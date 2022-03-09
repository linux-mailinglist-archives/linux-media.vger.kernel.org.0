Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E80FB4D2E51
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 12:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiCILnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 06:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbiCILm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 06:42:56 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A1816BCDD;
        Wed,  9 Mar 2022 03:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646826117; x=1678362117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ph86NPcPjwy0dX+EuR++GKI6JItrpTnVEStlCLpR8Qc=;
  b=FP0TFKrnrc85UOSZ9DcKu6ZoEE5nyQrT4xXlVkXz+TEWDAf4MitkXHim
   bF68pQlFpcyC1EjcV8duEPcLjBHg28URP5ipPM6jBfY+TiSv6bg8BJI77
   7x3poM7YCFEzKaiQjYXu5UPZCdBLCR5O9N9DO/OXWqeOCbU5JJSPIowjs
   HrGh3FlQuzePNdrmVzGSs3NFnPhEIQTDwyY7lEnFErALUO2H18W2DJ8V2
   +2tAqKWIt8T1WRHdR3sX7et3KSiFieN+czJsdvxtT0uNvvtKnyBPJ04/9
   7G3QHaBuzRtrwSsETTOWfXBQEB6M71DYvtB1YTP9HNbuEbu5wzVVJZb06
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22553364"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Mar 2022 12:41:54 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 09 Mar 2022 12:41:54 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 09 Mar 2022 12:41:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646826114; x=1678362114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ph86NPcPjwy0dX+EuR++GKI6JItrpTnVEStlCLpR8Qc=;
  b=Y+TveUuPEwAHyiHEqma0068gJcoyzzm3LeFBPQ+atB4Tl1msJBzEm7Lz
   VNXIfUj4RyNf8g9Zp8WZLBAWMlKEgqBYeTtDix5KpZeaLEHgKLqDVkA1X
   dFmgBx+oRMvzSrCBLEkIrSGvzRpY+vX+TJeK1mYPAULkcdra5DfxBJXyb
   L2aciMI6iHLWdZrSDQj72yxE2egz3Ib8TAZS+EQIeMR1XrxPrbvj9VYy+
   BK2Nj/+1GFYyecoLHv52SHY+3r1u+XWoYRVyjFlTtUTL72oh+Rfy6bmwq
   hBfZYAmwnRd3vedZKxT7N7i3nFLru6nqGCCjbdWZO4z33eEqF8KynkeTg
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22553363"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Mar 2022 12:41:54 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D13A7280075;
        Wed,  9 Mar 2022 12:41:53 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 3/8] media: imx: Use dedicated format handler for i.MX7/8
Date:   Wed,  9 Mar 2022 12:41:39 +0100
Message-Id: <20220309114144.120643-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309114144.120643-1-alexander.stein@ew.tq-group.com>
References: <20220309114144.120643-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

This splits out a format handler which takes into account
the capabilities of the i.MX7/8 video device,
as opposed to the default handler compatible with both i.MX5/6 and i.MX7/8.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fixed bbp check (This driver uses bits per pixel, not bytes per pixel)

 drivers/staging/media/imx/imx-media-utils.c | 60 +++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index c42f3da8e3a8..0534f7746cb3 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -516,10 +516,9 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 }
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
-int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc,
-				  enum imx_media_device_type type)
+static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					   const struct v4l2_mbus_framefmt *mbus,
+					   const struct imx_media_pixfmt *cc)
 {
 	u32 width;
 	u32 stride;
@@ -568,6 +567,59 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 
 	return 0;
 }
+
+static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+					   const struct v4l2_mbus_framefmt *mbus,
+					   const struct imx_media_pixfmt *cc)
+{
+	u32 aligned_width;
+	int ret;
+
+	if (!cc)
+		cc = imx_media_find_mbus_format(mbus->code, PIXFMT_SEL_ANY);
+
+	if (!cc)
+		return -EINVAL;
+	/*
+	 * The hardware can handle line lengths divisible by 4 pixels
+	 * as long as the whole buffer size ends up divisible by 8 bytes.
+	 * If not, use the value of 8 pixels recommended in the datasheet.
+	 * Only 8bits-per-pixel formats may need to get aligned to 8 pixels,
+	 * because both 10-bit and 16-bit pixels occupy 2 bytes.
+	 * In those, 4-pixel aligmnent is equal to 8-byte alignment.
+	 */
+	if (cc->bpp == 8)
+		aligned_width = round_up(mbus->width, 8);
+	else
+		aligned_width = round_up(mbus->width, 4);
+
+	ret = v4l2_fill_pixfmt(pix, cc->fourcc,
+			       aligned_width, mbus->height);
+	if (ret)
+		return ret;
+
+	pix->colorspace = mbus->colorspace;
+	pix->xfer_func = mbus->xfer_func;
+	pix->ycbcr_enc = mbus->ycbcr_enc;
+	pix->quantization = mbus->quantization;
+	pix->field = mbus->field;
+
+	return ret;
+}
+
+int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
+				  const struct v4l2_mbus_framefmt *mbus,
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_media_device_type type)
+{
+	switch (type) {
+	case DEVICE_TYPE_IMX56:
+		return imx56_media_mbus_fmt_to_pix_fmt(pix, mbus, cc);
+	case DEVICE_TYPE_IMX78:
+		return imx78_media_mbus_fmt_to_pix_fmt(pix, mbus, cc);
+	}
+	return -EINVAL;
+}
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
 
 void imx_media_free_dma_buf(struct device *dev,
-- 
2.25.1

