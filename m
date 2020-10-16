Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9BC290AF3
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390689AbgJPRqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387837AbgJPRqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:46:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98679C061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:46:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j7so1877368pgk.5
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WHK2GR8kfX0b+oqz1bD56wcKMpWRXbXriAgoKBCG6nY=;
        b=ZMOmvEzel2Ob/PWFKa8SSEBzOiEbxhIAeTUyVwGfR7pgRS0OFM1WxO1nuGCn8AhQWg
         FtpAbGFgXtG2y858W34ogDFy7w5+a9rbPmu/+3VWw7iJCuUYF6vNcnrHrRR77zlrZCgH
         087S7GUE7UIGx0RSvZaYpq1HhhZx3bit4w9uZeQVW3oQrx+nARNJaNS2TCB5MTmafTD1
         Q1Y4bE4Zdjchjk9PmnMDxAKq7kMTR8eX3d2b7v5zbOd7avD2kaBj5fuImM8u/ZpiUDuR
         I8ZqbPUwbj/kif/k3nyR2CTWItuB2U0wgv5+ABEwaKQ6dYAOk5EXC5foUBw3LINHBm9Y
         B58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WHK2GR8kfX0b+oqz1bD56wcKMpWRXbXriAgoKBCG6nY=;
        b=LlclRU23n0X/HrjtxJdqw3y6S6ouwMdzLRUD9VhbgItugsVjlbjnuPr31FkbasbVhW
         ncueB7JomrJbAYsh4XdjThj2esUpnG1yhWAZZpprOvhVsPP3PBhcVeR1EQgpKp9Cy3e4
         lL/4wh1xWiPxZ/SrS2CKzFQ9TFuvR2DNo+ydNSh1C9CY7b8Qt1UX1Sf7GGo/5exWrgY/
         KlBUh6iMIyKzrtbz2KUbZhSVhDoBEf7GYxUT/oAvH7TkDzl0urNdmv2uQjAqMpO6kPIj
         6dvgyGayxbfFfeWlF0fwtGJLBu0s4jAxX9fVZBNhupImSkkGAvfSJQqFdN6ld7ETbWeP
         CkDA==
X-Gm-Message-State: AOAM531JGfN9sPnDmey2z/EXUITjZ8mqpwLNZOtwpNNKzb4t5PfZUNXW
        QxUxzw27rRIF7X/jQgmRaPU=
X-Google-Smtp-Source: ABdhPJyb00dyox29qIuF4FNIIUTHjyccfR6X54PhR0HWDypmn2ICoTFHtiK3UqJiilxRnJpPSMCFMA==
X-Received: by 2002:a62:8389:0:b029:152:416d:f026 with SMTP id h131-20020a6283890000b0290152416df026mr5060384pfe.64.1602870373113;
        Fri, 16 Oct 2020 10:46:13 -0700 (PDT)
Received: from ubuntu204 ([103.108.75.206])
        by smtp.gmail.com with ESMTPSA id 17sm3632433pjd.2.2020.10.16.10.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:46:12 -0700 (PDT)
Date:   Fri, 16 Oct 2020 23:16:06 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     outreachy-kernel@googlegroups.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 2/2 v5] staging: media: imx: remove unnecessary variable use
Message-ID: <6a22de0a51e06b7cb43d4a55850f3a0213532e42.1602869338.git.mh12gx2825@gmail.com>
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use of variable vc_num is unnecessary here as it is used only once.
Instead, the value can directly be used in place of the variable.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Changes since v4:
   - None.
Changes since v3:
   - None.
Changes since v2:
   - Implement feedback from Vaishali to simplify patch log message.
Changes since v1:
   - None.

 drivers/staging/media/imx/imx-media-csi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 9320e3974d86..db77fef07654 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1123,7 +1123,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 	priv->upstream_ep = upstream_ep;
 	is_csi2 = !is_parallel_bus(&upstream_ep);
 	if (is_csi2) {
-		int vc_num = 0;
 		/*
 		 * NOTE! It seems the virtual channels from the mipi csi-2
 		 * receiver are used only for routing by the video mux's,
@@ -1131,7 +1130,7 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 		 * enters the CSI's however, they are treated internally
 		 * in the IPU as virtual channel 0.
 		 */
-		ipu_csi_set_mipi_datatype(priv->csi, vc_num,
+		ipu_csi_set_mipi_datatype(priv->csi, 0,
 					  &priv->format_mbus[CSI_SINK_PAD]);
 	}
 
-- 
2.25.1

