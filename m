Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B17658D59
	for <lists+linux-media@lfdr.de>; Thu, 29 Dec 2022 14:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbiL2Ndn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Dec 2022 08:33:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbiL2NdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Dec 2022 08:33:08 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FBD1145D;
        Thu, 29 Dec 2022 05:32:54 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id A6E1BFF816;
        Thu, 29 Dec 2022 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1672320772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kZf6SSI8l57BVKe3J2dXVrQAA+mbF4i79MlGylHRxzY=;
        b=kCyu6Q9QCaWvbjmkNtXQItqLRk/ykSO+yUYX3ASC400D4CknoS8Q3DzDuTKaUO2+095NED
        4QsDLEYyJ1aj2kQSAG90O46MF7rT9X1MSWC72E5+l/nZtbYig3G3z/P07lm5hSiDKo2IcH
        jqJZnaKyRDIbGHWNCA3tTX3O6Gv5qw4EnwXI+5pdmFNjRjE5IDeiAmiK/ySMmu9vvFkYX4
        p6riBhot3F3itmrSzLeqVWVdVA8UDnqiQkYJAOfqW/EQYVCZcXvKqAHjGC5YnJut2eLHK9
        6o46k/Jb1yqtE13eQATvzlJXBb4w6jxxWe7mOgVcxBWc5gunSJoRFGVuPJLUnQ==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v3 14/21] staging: media: tegra-video: move default format to soc-specific data
Date:   Thu, 29 Dec 2022 14:31:58 +0100
Message-Id: <20221229133205.981397-15-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tegra_default_format in vi.c is specific to Tegra210 CSI.

In preparation for adding Tegra20 VIP support, move the default format to a
new field in the soc-specific `struct tegra_vi_soc`. Instead of an entire
format struct, only store a pointer to an item in the existing format
array.

No functional changes. The format pointed to is the same that used to be in
vi.c.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/tegra210.c |  2 ++
 drivers/staging/media/tegra-video/vi.c       | 11 +----------
 drivers/staging/media/tegra-video/vi.h       |  2 ++
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 71483d0c19bf..28d3d05c12c4 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -771,8 +771,10 @@ const struct tegra_vi_soc tegra210_vi_soc = {
 	.hw_revision = 3,
 	.vi_max_channels = 6,
 #if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
+	.default_video_format = &tegra210_video_formats[0],
 	.vi_max_clk_hz = 499200000,
 #else
+	.default_video_format = &tegra210_video_formats[4],
 	.vi_max_clk_hz = 998400000,
 #endif
 };
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a76cad0e3026..3762fd273514 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -44,15 +44,6 @@ struct tegra_vi_graph_entity {
 	struct v4l2_subdev *subdev;
 };
 
-static const struct tegra_video_format tegra_default_format = {
-	.img_dt = TEGRA_IMAGE_DT_RAW10,
-	.bit_width = 10,
-	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-	.bpp = 2,
-	.img_fmt = TEGRA_IMAGE_FORMAT_DEF,
-	.fourcc = V4L2_PIX_FMT_SRGGB10,
-};
-
 static inline struct tegra_vi *
 host1x_client_to_vi(struct host1x_client *client)
 {
@@ -1111,7 +1102,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	init_waitqueue_head(&chan->done_wait);
 
 	/* initialize the video format */
-	chan->fmtinfo = &tegra_default_format;
+	chan->fmtinfo = chan->vi->soc->default_video_format;
 	chan->format.pixelformat = chan->fmtinfo->fourcc;
 	chan->format.colorspace = V4L2_COLORSPACE_SRGB;
 	chan->format.field = V4L2_FIELD_NONE;
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1021c730b595..879547073371 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -58,6 +58,7 @@ struct tegra_vi_ops {
  *
  * @video_formats: supported video formats
  * @nformats: total video formats
+ * @default_video_format: default video format (pointer to a @video_formats item)
  * @ops: vi operations
  * @hw_revision: VI hw_revision
  * @vi_max_channels: supported max streaming channels
@@ -66,6 +67,7 @@ struct tegra_vi_ops {
 struct tegra_vi_soc {
 	const struct tegra_video_format *video_formats;
 	const unsigned int nformats;
+	const struct tegra_video_format *default_video_format;
 	const struct tegra_vi_ops *ops;
 	u32 hw_revision;
 	unsigned int vi_max_channels;
-- 
2.34.1

