Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3B5290AEB
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389552AbgJPRkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389037AbgJPRkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:40:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC6CC061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:40:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a200so1884416pfa.10
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Np+zW2GuhNLqLx1TqqXkHXVvHvxaPBCZz87T9F1IuLc=;
        b=Gw8JSSMcnYhmlGUrLsR+Lt2hgWI1pKAm5DuqJYG7p3UnOHE2QKRj2Wd1/54W1HcPKK
         edVif1RnRiCRZ01D6K7c484al0YPRNHoXKLXF6BkNFs704AD1oMWcuj4PfXsgb/fiMOd
         Hgc8v8knCLdU2JV/Ph64/wSbRDPfW0yciyl/F5iqZct5wGRjAxg5I8dtfPigbtKAafLv
         4aDY2EJOmtnz8jd1aFcCQ3jRBvaFEKu9FCKKr+/rRu/gPbMLCeeIvZPzJ2tgPPpgB4VZ
         0ElNV/50s13hD+r/SsbuY1CaAzl69Uk51O5K4E60NCdW6otGTJJC0IfN8tY28GCN6ZBF
         QuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Np+zW2GuhNLqLx1TqqXkHXVvHvxaPBCZz87T9F1IuLc=;
        b=ZmrPSKB/vha3jp/fdybh5P1bzkh69T1tkEGSJAtFMNfiBfM15/vgoyc5kVZ2V+C584
         5DPUGyCvEXh7JoJvHpa8m5lEtkbPGOAqxJ6jDjWA8tL1Fd/TfvBtU7A0bKDFwmlDpVOB
         FWKwu7oByhmskh4iwd2n5TEmmRJPHdRu7OrX1Rv5j6dWgJvfcsLhOy0kJ4NOeTB8xONG
         V/SnUMM0E8fKGVWqG26q33jh2aliMm8gQC/fJlNXDgq8egml56mc9lKGzErxGMu8MxJW
         WTkWbHucfWXJejNE2U6mm7E5uRavuRoGCpT/BeEC8AmqrxwFOJmzvQ1RoHjjdAmsppKl
         JvZA==
X-Gm-Message-State: AOAM532HpPZqjJLN9xOkEqTV3KiJTF3egFJ6EtipskKy7I6/euwf1t0Y
        Fir+brsH4eWZRutsX/9Q7UM=
X-Google-Smtp-Source: ABdhPJwLzAXMwUXObasiQgmBY6+B76hw7yeSPBhLoc7MCzAX8Xxzt2prFvwQ+AAVkiLjm/1cEImiQQ==
X-Received: by 2002:a62:80d4:0:b029:155:3225:6fc9 with SMTP id j203-20020a6280d40000b029015532256fc9mr4797706pfd.41.1602870040858;
        Fri, 16 Oct 2020 10:40:40 -0700 (PDT)
Received: from ubuntu204 ([103.108.75.206])
        by smtp.gmail.com with ESMTPSA id ls8sm3563230pjb.54.2020.10.16.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:40:40 -0700 (PDT)
Date:   Fri, 16 Oct 2020 23:10:33 +0530
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
Subject: [PATCH v5 1/2] staging: media: imx: remove commented code
Message-ID: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The virtual channel is always treated as 0 once the stream enters
CSI's. Commented code in the "#if 0" can be safely removed as it will
not serve any purpose in future.  Issue reported by checkpatch script.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Changes since v4:
   - Rephrase patch description to make it exact and accurate as
     suggested by Julia.
   - Add linux-media to the recipient list. Suggested by Hans.
Changes since v3:
   - Rephrase Patch description
   - Implement feedback from Vaishali & Helen to mention checkpatch in
     the patch description.
Changes since v2:
   - None
Changes since v1:
   - Implement feedback from Julia to be exact with the patch description

 drivers/staging/media/imx/imx-media-csi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 21ebf7769696..9320e3974d86 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1131,13 +1131,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 		 * enters the CSI's however, they are treated internally
 		 * in the IPU as virtual channel 0.
 		 */
-#if 0
-		mutex_unlock(&priv->lock);
-		vc_num = imx_media_find_mipi_csi2_channel(&priv->sd.entity);
-		if (vc_num < 0)
-			return vc_num;
-		mutex_lock(&priv->lock);
-#endif
 		ipu_csi_set_mipi_datatype(priv->csi, vc_num,
 					  &priv->format_mbus[CSI_SINK_PAD]);
 	}
-- 
2.25.1

