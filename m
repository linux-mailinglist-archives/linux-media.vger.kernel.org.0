Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCE26BD27D
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 15:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbjCPOio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 10:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbjCPOim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 10:38:42 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AA567810
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977520; x=1710513520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C9sNIEVpGd0LWVqABddnM3tNj1tR5BNHnL7rTZOVfhY=;
  b=XXF6TBXhqilbVJ7Hlr03IFAGaqibN6TPtppp84GZAMHwCJ2ZM5JlqeZz
   HTHeU5LZyvELxdo3G8vW9aElOMr76plpBxGrNLrRdr2xBspQlwJqxkzEC
   r2mXcQDI4ZYJlTZU+8wCgFK+0vx6BpofMxDU415RqTWaZsJY6SEkxY/yq
   0IT/qFPx0bygCbaBMGc7a8HB9xnYaD0kPAuTJiou+1bgIPTzpKy/uueno
   WKvTauwNaY9ojj9rSHga2NX5YzoDuvj2UOcmyTQuRU4tbweVol8PNkP95
   MvDtPZfPy5zTHsgZmcfbH+WhMUpf+v6Bag4PlVCBlv7e1XAz34GbAXKJB
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742389"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 15:38:35 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 15:38:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977515; x=1710513515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C9sNIEVpGd0LWVqABddnM3tNj1tR5BNHnL7rTZOVfhY=;
  b=GzjEgpHWDfnYv9oWF4xkwJTgyDvlf1EiT6g6QHwaY8w9eIdOXlcAxuXZ
   zTuAs2ba3qVoAMXFnE1FozAqZYTS8+Ja/625NpBIsFNSumqCsiYqVbvYH
   zicn+p+STz2kfwFPL5owR5dTf2n9k8Nu5vi5wRl2ueW7NEBQ5DCA05W6r
   KE2MWdEvzMl8K5ubw5YfrkbQAxg00KSfpJSPhUYGLB05tbigkXCi3Aqfi
   CgsNin24Lh80dOPwolaIawrmeqPxfjitdRQKVWu+GLY4w0PjrKQbTlE43
   PacJoaKYoKatGvUNvLe53S52iG8jfQNjdjOa7Z1uW4xXZBHcNlCCHDhVR
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742387"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9C9C0280072;
        Thu, 16 Mar 2023 15:38:34 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] media: imx: imx7-media-csi: Fail for non video-capture formats
Date:   Thu, 16 Mar 2023 15:38:29 +0100
Message-Id: <20230316143829.499039-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver only support V4L2_BUF_TYPE_VIDEO_CAPTURE, so fail for other
passed types.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 389d7d88b341..e470b0505d3b 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1186,6 +1186,11 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 static int imx7_csi_video_try_fmt_vid_cap(struct file *file, void *fh,
 					  struct v4l2_format *f)
 {
+	struct imx7_csi *csi = video_drvdata(file);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
 	__imx7_csi_video_try_fmt(&f->fmt.pix, NULL);
 	return 0;
 }
@@ -1196,6 +1201,9 @@ static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
 	struct imx7_csi *csi = video_drvdata(file);
 	const struct imx7_csi_pixfmt *cc;
 
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
 	if (vb2_is_busy(&csi->q)) {
 		dev_err(csi->dev, "%s queue busy\n", __func__);
 		return -EBUSY;
-- 
2.34.1

