Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA219DFF8
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbgDCU7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:59:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33587 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgDCU7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:59:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id c138so4173529pfc.0
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=22SfKmXY8y8+HRYeceGUgnGwyzx3xP3vR7j8AXHSr+8=;
        b=SzOmBkBdU4oSwRLH118b9JWWifu6jHTToUYxAZNgJvLBCIOZ/hkOGICOTvsz3YowMG
         gqxSpjrXQHBT1U/8DNXDVpmiU7wSvF+gTO06YbCcFwzFnWLP1RAhQ5PRRBcIofFfQO2t
         uSG91z+8RbsmOmM3WksbKubDkADL76SmHdtficXAAPiXWcDWK8NMNyKOSXNuoFpbwDj+
         vdb9QNH4pv8h2UGA6Y/JFkZPfVNxW2A+Da9qNuB6xdGRzDU1rdcf1qomgeSSQzth1u3n
         OL1B99S/+DZ7vURgDZZPha5W28PyO2ai4Tces2edC/aebUns2ePUWyWUKc4zpx3oF4D+
         1ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=22SfKmXY8y8+HRYeceGUgnGwyzx3xP3vR7j8AXHSr+8=;
        b=IYgS3Qp5N8cDHh4Q1r+YghMKB834I1OKeMh44ZDGXNEkfi21U2YTlHSbgwp+wpuskf
         Roy7uaE0jTQPkvLrg5i+ivRXQmzI8712seTqlTSP2rE+7t9IMwQ0H07xbxcopQu8atzh
         6Q/q79vY2EubYYdk9DqCgKFTaxxsw1Pl5S0ru7Gm8nYcD4xzD3YAeat/hVHxtSSMAip0
         np+2lRozvgm1tKbjpD9WMmL1HppNtqTic5ejCo1aDMqFy8reWuwTgfVV+VcKRB07cz9i
         8meQsLFV31bBwIsPLyypdEZoDUmVvgVwx3zLgJazzzPVBH/fSA9gcYmtxHxPo+Vsh5tm
         cS7Q==
X-Gm-Message-State: AGi0PuYGWxjAkwCuCVOpF/FRi89EnGdKHE7Uy8thTqXortWPAyBPXn09
        KBVc8ILoAfQ+8M+8B9FkMHPxqye1pts=
X-Google-Smtp-Source: APiQypKzQ6A5sRscZ+B2zsAcvLsN6MCdx89J4xP/DKl7NNLR8lgxviodeR00E1QoKaNbU6JWf+NddQ==
X-Received: by 2002:a63:2a88:: with SMTP id q130mr9646321pgq.102.1585947539125;
        Fri, 03 Apr 2020 13:58:59 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:58 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 10/12] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*
Date:   Fri,  3 Apr 2020 13:58:37 -0700
Message-Id: <20200403205839.4531-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx_media_mbus_fmt_to_pix_fmt() and imx_media_mbus_fmt_to_ipu_image()
functions do not need to modify their mbus argument. Make them const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[Constified mbus arg to imx_media_mbus_fmt_to_ipu_image() as well]
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 4 ++--
 drivers/staging/media/imx/imx-media.h       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index b8481b286ebb..7a8d7212d9e2 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -455,7 +455,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc)
 {
 	u32 width;
@@ -507,7 +507,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
 
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    struct v4l2_mbus_framefmt *mbus)
+				    const struct v4l2_mbus_framefmt *mbus)
 {
 	int ret;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 24a993b3216b..c03114a6f6c8 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -184,10 +184,10 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc);
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    struct v4l2_mbus_framefmt *mbus);
+				    const struct v4l2_mbus_framefmt *mbus);
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 				    struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
-- 
2.17.1

