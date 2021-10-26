Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671DA43BAF6
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236163AbhJZThM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238859AbhJZTg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:58 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40B0C061231
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id o4-20020a1c7504000000b0032cab7473caso1662425wmc.1
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsNFpY1RRkr+DNPQxSAx+z1PDhyA43H0wT6kfJ2Z97I=;
        b=eME9O1/pcsGox5LjfX7xPVoCrlsF3VVOUBpSmani2lqKTUVyRqJiluvPcZL3a70haz
         ezOSnQ5oY5mg4iqKR4piTZdyW4BPP1A81mXV3wmOY+2Mx6fw3dHS5DbC8UwbIyIxy9/B
         F37EkoExJekgeAyATlAGIM8AYm9WXa1o8G2hCIHVmO9lTiaW/hepGMfeW44fXVe7ZB3R
         d8vj6Euu0zI3AvlF0nFYdD7Ki8HreGE0BdIbVkJPhjhDyQsWpQ7FtTMgdl5zY7wYXoy2
         iVzniBL2F3XJUSOJFtln+WR0UfcP8og2qdOlB+GsaRBW/sH/+Qrh1CtQQfoi5QOCAlmh
         Mnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsNFpY1RRkr+DNPQxSAx+z1PDhyA43H0wT6kfJ2Z97I=;
        b=OfUkl0mX8H2Z4iJcoIy8ZNATaJHFicHYf7VbUFRoLZnw/eDu7xXwJsLsTwfiilKaHE
         M1+RCSJg0+fUflZB3KNhuUSgFIQW4NA0Qwufn7+tqEz2okhYhLnvzbx/Xc6TLKTKZntf
         3ZOcV92X+nNYbO/CU8OrQ7h34vpVB8k1C19J3vfWxN35ygFRayq0z1DgsIV4x524dSnw
         n2CxCbMoRJKmCPnekQUe+O1e6cesVP42TdrN46EZ09K57NEQuibJLV7x/zGGRmUGJP9t
         1kAzGPDvPOJhJXfM3I6Ccr+OHxgO+pkSKNr1Ft7Ng0Z8nuoiUuEajegdHDq1NpdfAb2l
         MT+w==
X-Gm-Message-State: AOAM532CNwe5c1Wt8O/53s0Hnt9CaZOkUUCKDF1ZsOf1ObgUctamMWf1
        8zFcJQM3D3Q0462kPlFadZ9k1w==
X-Google-Smtp-Source: ABdhPJzl6RgoK75e15lPN0nE8cV0VDbdl5tXgmBcelZwY2x6GlL86ABMpt9s6+FbGBGktuDk2J+W5Q==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr731765wmj.164.1635276868270;
        Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3 11/14] staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
Date:   Tue, 26 Oct 2021 19:34:13 +0000
Message-Id: <20211026193416.1176797-12-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vb2_dma_contig_set_max_seg_size need to have a size in parameter and not
a DMA_BIT_MASK().
While fixing this issue, also fix error handling of all DMA size
setting.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: d4ae3689226e5 ("media: zoran: device support only 32bit DMA address")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a00ad40244d0..4ea2fbf189b9 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1282,8 +1282,10 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (err)
-		return -ENODEV;
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+		return err;
+	err = vb2_dma_contig_set_max_seg_size(&pdev->dev, U32_MAX);
+	if (err)
+		return err;
 
 	nr = zoran_num++;
 	if (nr >= BUZ_MAX) {
-- 
2.32.0

