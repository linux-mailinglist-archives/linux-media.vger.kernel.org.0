Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46FB8EAD3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 13:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbfHOL6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 07:58:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35363 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731176AbfHOL6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 07:58:03 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEOA-00042t-L4; Thu, 15 Aug 2019 13:57:54 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEO5-0006IZ-1e; Thu, 15 Aug 2019 13:57:49 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v7 12/13] media: tvp5150: add support to limit tv norms on connector
Date:   Thu, 15 Aug 2019 13:57:46 +0200
Message-Id: <20190815115747.24018-13-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815115747.24018-1-m.felsch@pengutronix.de>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tvp5150 accepts NTSC(M,J,4.43), PAL (B,D,G,H,I,M,N) and SECAM video
data and is able to auto-detect the input signal. The auto-detection
does not work if the connector does not receive an input signal and the
tvp5150 might not be configured correctly. This misconfiguration leads
into wrong decoded video streams if the tvp5150 gets powered on before
the video signal is present.

Limit the supported tv norms according to the actual selected connector
to avoid a misconfiguration.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
[1] https://patchwork.kernel.org/cover/10794703/

v5:
- probe() initialize supported tv-norms according the given connectors
  if they are available.
- check if media-controller is used. Don't limit the norm if it isn't
  used.
- add more logic to be smarter during connector changing so it is
  intuitiver for the user space.

v2-v4:
- nothing since the patch was squashed from series [1] into this
  series.
---
 drivers/media/i2c/tvp5150.c | 63 +++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 9a812d5f45d7..8f0daa2f0d58 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -32,6 +32,13 @@
 #define TVP5150_MBUS_FMT	MEDIA_BUS_FMT_UYVY8_2X8
 #define TVP5150_FIELD		V4L2_FIELD_ALTERNATE
 #define TVP5150_COLORSPACE	V4L2_COLORSPACE_SMPTE170M
+#define TVP5150_STD_MASK	(V4L2_STD_NTSC     | \
+				 V4L2_STD_NTSC_443 | \
+				 V4L2_STD_PAL      | \
+				 V4L2_STD_PAL_M    | \
+				 V4L2_STD_PAL_N    | \
+				 V4L2_STD_PAL_Nc   | \
+				 V4L2_STD_SECAM)
 
 #define TVP5150_MAX_CONNECTORS	3 /* Check dt-bindings for more informations. */
 
@@ -63,6 +70,7 @@ struct tvp5150 {
 
 	struct media_pad pads[TVP5150_NUM_PADS];
 	struct tvp5150_connector connectors[TVP5150_MAX_CONNECTORS];
+	struct tvp5150_connector *cur_connector;
 	unsigned int connectors_num;
 
 	struct v4l2_ctrl_handler hdl;
@@ -782,17 +790,28 @@ static int tvp5150_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
 static int tvp5150_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
+	struct tvp5150_connector *cur_con = decoder->cur_connector;
+	v4l2_std_id supported_norms = cur_con ?
+		cur_con->base.connector.analog.supported_tvnorms : V4L2_STD_ALL;
 
 	if (decoder->norm == std)
 		return 0;
 
+	/*
+	 * Check if requested std or group of std's is/are supported by the
+	 * connector.
+	 */
+	if ((supported_norms & std) == 0)
+		return -EINVAL;
+
 	/* Change cropping height limits */
 	if (std & V4L2_STD_525_60)
 		decoder->rect.height = TVP5150_V_MAX_525_60;
 	else
 		decoder->rect.height = TVP5150_V_MAX_OTHERS;
 
-	decoder->norm = std;
+	/* Set only the specific supported std in case of group of std's. */
+	decoder->norm = supported_norms & std;
 
 	return tvp5150_set_std(sd, std);
 }
@@ -1331,6 +1350,8 @@ static int tvp5150_link_setup(struct media_entity *entity,
 			  TVP5150_BLACK_SCREEN, 0);
 
 	if (flags & MEDIA_LNK_FL_ENABLED) {
+		u32 new_norm;
+
 		/*
 		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
 		 * Both links must be enabled in one-shot regardless which link
@@ -1342,6 +1363,26 @@ static int tvp5150_link_setup(struct media_entity *entity,
 			if (err)
 				return err;
 		}
+
+		/* Update the current connector */
+		decoder->cur_connector =
+			container_of(remote, struct tvp5150_connector, pad);
+
+		/*
+		 * Do nothing if the new connector supports the same tv-norms as
+		 * the old one.
+		 */
+		new_norm = decoder->norm &
+			decoder->cur_connector->base.connector.analog.supported_tvnorms;
+		if (decoder->norm == new_norm)
+			return 0;
+
+		/*
+		 * Fallback to the new connector tv-norms if we can't find any
+		 * common between the current tv-norm and the new one.
+		 */
+		tvp5150_s_std(sd, new_norm ? new_norm :
+			decoder->cur_connector->base.connector.analog.supported_tvnorms);
 	}
 
 	return 0;
@@ -1559,6 +1600,9 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
 				TVP5150_COMPOSITE1;
 
 			tvp5150_selmux(sd);
+			decoder->cur_connector = &decoder->connectors[i];
+			tvp5150_s_std(sd,
+				decoder->connectors[i].base.connector.analog.supported_tvnorms);
 		}
 	}
 #endif
@@ -1949,6 +1993,7 @@ static int tvp5150_probe(struct i2c_client *c)
 	struct v4l2_subdev *sd;
 	struct device_node *np = c->dev.of_node;
 	struct regmap *map;
+	unsigned int i;
 	int res;
 
 	/* Check if the adapter supports the needed features */
@@ -1993,7 +2038,21 @@ static int tvp5150_probe(struct i2c_client *c)
 	if (res < 0)
 		return res;
 
-	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
+	/*
+	 * Iterate over all available connectors in case they are supported and
+	 * successfully parsed. Fallback to default autodetect in case they
+	 * aren't supported.
+	 */
+	for (i = 0; i < core->connectors_num; i++) {
+		struct v4l2_fwnode_connector *vc;
+
+		vc = &core->connectors[i].base;
+		core->norm |= vc->connector.analog.supported_tvnorms;
+	}
+
+	if (!core->connectors_num)
+		core->norm = V4L2_STD_ALL;
+
 	core->detected_norm = V4L2_STD_UNKNOWN;
 	core->input = TVP5150_COMPOSITE1;
 	core->enable = true;
-- 
2.20.1

