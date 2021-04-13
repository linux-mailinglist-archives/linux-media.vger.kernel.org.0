Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A657635E119
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241119AbhDMOL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244947AbhDMOLy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:11:54 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355FAC061574;
        Tue, 13 Apr 2021 07:11:32 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso10740570pji.3;
        Tue, 13 Apr 2021 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=;
        b=HCWAtwaBVQdx3DeevYRszuLqOubsNmDDTOTU+FUgQJHr5WOPHzKY87DtFvsPI+S/81
         QR2Gk6DnFiU7zXEedpL+oq4LOUtxyg/lImKv8ezFR7EdoMoVQSNQLHIRLdjVv7XqWJws
         YGI9DeOoohjqarltgk4Fx+sy2IJ3LcRCnH4OII2+i/AKfoulTZHV2ZsmzrWG968gDgD1
         mcyiN/l+u3pl6Kh3xjmOZuaFH/61ucMxERgSLrl2UZaLj66WFwAb4fvHbJog9pkbE7mU
         AH2yjEx19AvArSSuSmm6RoOsDYo7gsx1mHjrND7Q5oFIW2/VIk3+gaRsKRHNyarn1rmy
         TrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=29Kz76z7ZOP2iBx6/3DXnAWj3+GXDiiIznMC8bIFGsc=;
        b=fGheaZxjCJL62v3f66pwWJaf+ahitmSZNtxlm8DQBdmYOG9C+pK2zTegpYPI0G9S8l
         hZxUSfsdhq5UfzNNmVnFFGzrBmLC2qfPkbxXiQNkblpKzbG6uWI9tjzkSh9364ygeCwC
         b8zUj8qmiNAOkCIuoTrVzCGUw/LY/K0NOkcEKKnwD0SC20UOoR/r+KFdjWAXlkdz5Fnb
         GNII3MwOkh2nWnSsji5DKpX3oyQANryZRE1lPsPLaVpPbaKVayDPOri4Cj8jcC4dDhGz
         E/tusQ30IEBbG2qGFnf4K6Jg9uBKnfCqTaWMSpBO/zUmDI5nYhsLjcFdRJlGBcl1i9Th
         p2oQ==
X-Gm-Message-State: AOAM533QXUiCEBz8y+V3JN4S3JJ4gMhturIpkg3EWy4pK/VZxztobh+j
        /AnmMVc2zqTJvZtDOEPtHyo=
X-Google-Smtp-Source: ABdhPJxc6+6O8gxrJL3OrEMe9mC+xOVJwaNQrJLDCo+F68glOIdvGxDa5YlD1mPqJsydBllGi86BYA==
X-Received: by 2002:a17:90b:390f:: with SMTP id ob15mr244765pjb.100.1618323091571;
        Tue, 13 Apr 2021 07:11:31 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id ms8sm2519954pjb.57.2021.04.13.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:11:31 -0700 (PDT)
Date:   Tue, 13 Apr 2021 19:41:20 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: meson: vdec: declare u32 as static const
Message-ID: <YHWmiBYAbOUw5YrY@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant throughout execution.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- Rebased this patch and made changes against mainline code
Changes from v1:- Rectified mistake by declaring u32 as static const
properly as static const u32 canvas'x'[]

 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..80141b89a9f6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
+	static const u32 canvas4[] = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2

