Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F5D17DD20
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCIKOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:52 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40487 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgCIKOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:52 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mx-6N; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQh-0001mU-2W; Mon, 09 Mar 2020 11:14:35 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 18/19] media: tvp5150: add support to limit sdtv standards
Date:   Mon,  9 Mar 2020 11:14:27 +0100
Message-Id: <20200309101428.15267-19-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
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

Limit the supported sdtv standards according to the actual selected
connector to avoid a misconfiguration.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
[1] https://patchwork.kernel.org/cover/10794703/

v12:
- use unique v4l2c naming
- move tv-norm check to new tvp5150_validate_connectors()

v11:
- address 80 character warnings by:
  - use struct v4l2_fwnode_connector *v4lc
  - add truct v4l2_fwnode_connector_analog *v4lca

v8:
- adapt commit message
- fix rebasing issue
- apdapt to new v4l2_fwnode_connector_analog naming
- fix cur_connector update during tvp5150_link_setup()
  -> Only update if we have of-connectors.
- fix supported_stds detection during tvp5150_s_std()
  -> use connectors_num to detect of-connectors presence

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
 drivers/media/i2c/tvp5150.c | 76 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index abc784dbeb81..fb24581e86c1 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -34,6 +34,13 @@
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
 
 #define TVP5150_MAX_CONNECTORS	3 /* Check dt-bindings for more information */
 
@@ -66,6 +73,7 @@ struct tvp5150 {
 
 	struct media_pad pads[TVP5150_NUM_PADS];
 	struct tvp5150_connector connectors[TVP5150_MAX_CONNECTORS];
+	struct tvp5150_connector *cur_connector;
 	unsigned int connectors_num;
 
 	struct v4l2_ctrl_handler hdl;
@@ -785,17 +793,33 @@ static int tvp5150_g_std(struct v4l2_subdev *sd, v4l2_std_id *std)
 static int tvp5150_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
+	struct tvp5150_connector *cur_con = decoder->cur_connector;
+	v4l2_std_id supported_stds;
 
 	if (decoder->norm == std)
 		return 0;
 
+	/* In case of no of-connectors are available no limitations are made */
+	if (!decoder->connectors_num)
+		supported_stds = V4L2_STD_ALL;
+	else
+		supported_stds = cur_con->base.connector.analog.sdtv_stds;
+
+	/*
+	 * Check if requested std or group of std's is/are supported by the
+	 * connector.
+	 */
+	if ((supported_stds & std) == 0)
+		return -EINVAL;
+
 	/* Change cropping height limits */
 	if (std & V4L2_STD_525_60)
 		decoder->rect.height = TVP5150_V_MAX_525_60;
 	else
 		decoder->rect.height = TVP5150_V_MAX_OTHERS;
 
-	decoder->norm = std;
+	/* Set only the specific supported std in case of group of std's. */
+	decoder->norm = supported_stds & std;
 
 	return tvp5150_set_std(sd, std);
 }
@@ -1335,6 +1359,9 @@ static int tvp5150_link_setup(struct media_entity *entity,
 			  TVP5150_BLACK_SCREEN, 0);
 
 	if (flags & MEDIA_LNK_FL_ENABLED) {
+		struct v4l2_fwnode_connector_analog *v4l2ca;
+		u32 new_norm;
+
 		/*
 		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
 		 * Both links must be enabled in one-shot regardless which link
@@ -1346,6 +1373,28 @@ static int tvp5150_link_setup(struct media_entity *entity,
 			if (err)
 				return err;
 		}
+
+		if (!decoder->connectors_num)
+			return 0;
+
+		/* Update the current connector */
+		decoder->cur_connector =
+			container_of(remote, struct tvp5150_connector, pad);
+
+		/*
+		 * Do nothing if the new connector supports the same tv-norms as
+		 * the old one.
+		 */
+		v4l2ca = &decoder->cur_connector->base.connector.analog;
+		new_norm = decoder->norm & v4l2ca->sdtv_stds;
+		if (decoder->norm == new_norm)
+			return 0;
+
+		/*
+		 * Fallback to the new connector tv-norms if we can't find any
+		 * common between the current tv-norm and the new one.
+		 */
+		tvp5150_s_std(sd, new_norm ? new_norm : v4l2ca->sdtv_stds);
 	}
 
 	return 0;
@@ -1604,6 +1653,8 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
 				TVP5150_COMPOSITE1;
 
 			tvp5150_selmux(sd);
+			decoder->cur_connector = &decoder->connectors[i];
+			tvp5150_s_std(sd, v4l2c->connector.analog.sdtv_stds);
 		}
 	}
 
@@ -1928,6 +1979,12 @@ static int tvp5150_validate_connectors(struct tvp5150 *decoder)
 				return -EINVAL;
 			}
 		}
+
+		if (!(v4l2c->connector.analog.sdtv_stds & TVP5150_STD_MASK)) {
+			dev_err(dev, "Unsupported tv-norm on connector %s\n",
+				v4l2c->name);
+			return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -2060,6 +2117,7 @@ static int tvp5150_probe(struct i2c_client *c)
 	struct v4l2_subdev *sd;
 	struct device_node *np = c->dev.of_node;
 	struct regmap *map;
+	unsigned int i;
 	int res;
 
 	/* Check if the adapter supports the needed features */
@@ -2104,7 +2162,21 @@ static int tvp5150_probe(struct i2c_client *c)
 	if (res < 0)
 		return res;
 
-	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
+	/*
+	 * Iterate over all available connectors in case they are supported and
+	 * successfully parsed. Fallback to default autodetect in case they
+	 * aren't supported.
+	 */
+	for (i = 0; i < core->connectors_num; i++) {
+		struct v4l2_fwnode_connector *v4l2c;
+
+		v4l2c = &core->connectors[i].base;
+		core->norm |= v4l2c->connector.analog.sdtv_stds;
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

