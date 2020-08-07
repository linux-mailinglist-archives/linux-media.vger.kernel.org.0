Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C990A23E922
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgHGIhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgHGIhR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:37:17 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2658AC061574;
        Fri,  7 Aug 2020 01:37:17 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id s16so724034qtn.7;
        Fri, 07 Aug 2020 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2yb5QPDam+5IEgCEDv8doERVGtgdGpfjdx2bUCpxyBo=;
        b=h1ooMgGiGLgaAh8SRDKWMxzu8381us1FoiBNDtCqOFHA8B7K/+KymRUACbrb3z4bTA
         CRTHdn8LgeSiaQ9vUmmGWFo9lbLS256Ud/r5Bmz5TXt6kqbv1sPC1CFglNLVJ7mE9Gc9
         Ga6eo+vbV3vZNZVFhiU+r0lTSQsC928zA2QOKPuXjBz7uafsHCt1XY3l9x58+dKskatW
         Z2+8uU7fffT4r6Mct87ItP/ijG7QTgqgvPQqlmg+EeuZ5h5S8IEdZbWv5p2AIhNOwwQf
         +sO6FjS9ZEHn/oNWSRNITXi+aoXFOQ/GRxIGkdImh3D6UDSES6lL6lymZiGykPCz1IpT
         djUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2yb5QPDam+5IEgCEDv8doERVGtgdGpfjdx2bUCpxyBo=;
        b=gq13A2pQUN2/RAY5yD1Ao4OzCIInf/jXYlJnY+okh2e3WF57ABh/+KkSgir9UbnKOn
         pPGwwIu6hr7SUyjzjwmqZiil9ubdN86m7cdoLydp7MvDV2h6l6q53HtplY77whOgW51E
         rXNzfyP7zhZipq5yDXkaaG2OGW+9gZb5AJMEEKsaAcIs/2ztS2Paa5mhArnR1Gzk1X5D
         YF4dC6uFQN5eMZxUoiSwQgioas78QQG8yxq2/M2AGKrG5rGbEecfF4wx5gzDqgekFYfb
         C7BZT52vwXyrU7DGj81Er7Nria1uyfPB+HvR0T4Uu2dtLI68ziZMPAXKLAJ9H2PeMu4s
         wUUQ==
X-Gm-Message-State: AOAM5326MLVIVz2sYGtV0CFyasn2vOPMivZXvyx6OpCh3T9A+FD3zdWg
        UdctnZkN2xZfzcTHnwq62Sb0xiz0ho93bw==
X-Google-Smtp-Source: ABdhPJzN0DqAoHav6RSn7l+R8YeBljVvTs4nbpT97KunEwaN4r8GPW/u/jWmcPwaqp6xjolviYrYcg==
X-Received: by 2002:aed:3947:: with SMTP id l65mr13325137qte.374.1596789436386;
        Fri, 07 Aug 2020 01:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:37:15 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 20/20] media: mtk-vcodec: vdec_vp9_if.c: fix comparison to bool
Date:   Fri,  7 Aug 2020 05:35:47 -0300
Message-Id: <20200807083548.204360-20-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c:963:6-31:
WARNING: Comparison to bool

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 257a5b5ad212..c612d041aafe 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -960,7 +960,7 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 			goto DECODE_ERROR;
 		}
 
-		if (vp9_decode_end_proc(inst) != true) {
+		if (!vp9_decode_end_proc(inst)) {
 			mtk_vcodec_err(inst, "vp9_decode_end_proc");
 			ret = -EINVAL;
 			goto DECODE_ERROR;
-- 
2.28.0

