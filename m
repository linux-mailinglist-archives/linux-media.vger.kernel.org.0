Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4D229D996
	for <lists+linux-media@lfdr.de>; Wed, 28 Oct 2020 23:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387581AbgJ1W5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 18:57:55 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:46037 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389868AbgJ1W52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:57:28 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 789716000E;
        Wed, 28 Oct 2020 22:57:25 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     hugues.fruchet@st.com, tomi.valkeinen@ti.com,
        sam@elite-embedded.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org
Subject: [RFC 3/3] media: i2c: ov5640: Add V4L2_CID_LINK_FREQ support
Date:   Wed, 28 Oct 2020 23:57:06 +0100
Message-Id: <20201028225706.110078-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the V4L2_CID_LINK_FREQ control in the ov5640
driver.

Unfortunately V4L2_CID_LINK_FREQ is a menu control and its supported
values has to be pre-calculated.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 236c684ca20b..8429269b9d7d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -144,6 +144,20 @@ static const struct ov5640_pixfmt ov5640_formats[] = {
 	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_COLORSPACE_SRGB, },
 };
 
+static const s64 ov5640_link_freqs[] = {
+	126273600,
+	191116800,
+	184291200,
+	167909760,
+	252547200,
+	331724160,
+	335819520,
+	368582400,
+	382233600,
+	737164800,
+};
+#define OV5640_LINK_FREQS_NUM	ARRAY_SIZE(ov5640_link_freqs)
+
 /*
  * FIXME: remove this when a subdev API becomes available
  * to set the MIPI CSI-2 virtual channel.
@@ -220,6 +234,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl *test_pattern;
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *link_freq;
 };
 
 struct ov5640_dev {
@@ -928,6 +943,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 				unsigned long rate)
 {
 	u8 bit_div, mipi_div, pclk_div, sclk_div, sclk2x_div, root_div;
+	unsigned int freq_index, i;
 	u8 prediv, mult, sysdiv;
 	unsigned long link_freq;
 	unsigned long sysclk;
@@ -941,6 +957,19 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
 	 * update the associated control.
 	 */
 	link_freq = rate / sensor->ep.bus.mipi_csi2.num_data_lanes / 2;
+	freq_index = OV5640_LINK_FREQS_NUM - 1;
+	for (i = 0; i < OV5640_LINK_FREQS_NUM; ++i) {
+		if (ov5640_link_freqs[i] == link_freq) {
+			freq_index = i;
+			break;
+		}
+	}
+	WARN_ONCE(i == OV5640_LINK_FREQS_NUM,
+		  "Link frequency %ld not supported", link_freq);
+
+	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, freq_index);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * - mipi_div - Assumptions not supported by documentation
@@ -2787,6 +2816,12 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
 				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+						  OV5640_LINK_FREQS_NUM - 1,
+						  0, ov5640_link_freqs);
+	if (ctrls->link_freq)
+		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
-- 
2.28.0

