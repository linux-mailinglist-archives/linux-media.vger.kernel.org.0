Return-Path: <linux-media+bounces-34096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D69ACEC60
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678BD3AB565
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C351FDE39;
	Thu,  5 Jun 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGL0cizT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71250143748
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113626; cv=none; b=p5aTh5MxhaXND3moC8tUDdMJhae7K5eCOyn2uOdUqgdv2rTEW2QwEEat5p0FR/vaNoV8c4r5cpbL+KeXd/axUdiKgxvAQGLh+f9j5HWxMQAzZpqxO6SbTa6R5EzYY2iuIXX1VIgo0m9YuB39cEBzfXcxsh6MyKvqDecvPk979h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113626; c=relaxed/simple;
	bh=W49vvr8XDS7yfGI/+zPZZYpAnF/VdlxTaIrpcUraWvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O+o/aCTRrWP/eEFit/0ixk9rQWdA2/AzLzwKh+PG3qtXoyhsJNaDT2NX6NcAVKzvuR9Olqryy6otbYTaQeDrbeaLiMRwp4mhHVDl/rDVmfpDbQ82wwu/0vsWmDcKilCWMACAJjjjcnPj8tAaI8hUzKcQXXPA4DjMKWSp8auMvt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGL0cizT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d0997d3ac7so81153185a.2
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113623; x=1749718423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDEWl38WFpFNnd8GWTrKKFIYCiy6Z5fzCEGVZofpXpw=;
        b=bGL0cizTmFHR26I+wJqe8bicyDdbNUUfbk/hv+fuuvRG9av6fepgvIwXE4ShfNHkNB
         GxGZkOBReBd19G02E1ccNVaPBSQiwYQF9Yo6uDCuPMpRFsqbgC+3R6F50YmlGwfi84BC
         Ec0V5udXXfCB+F2v9c0Ipqf63C1mPAscze14vHywXOL6y+e1lgkSzJpcEDW7SePneZAv
         5RfIoFP79GF95CVjgWJoWC5D7bHQ3aTGM73CyAVfqXTS0cP71n+DMMPIE2pDKb9zuf/b
         wLBT7RUP9BWewo59+kQVuX89jfv6LK3K5ECQ+v1OuUL/uTweEX+K1UvbiBSIQrVCBdbs
         fQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113623; x=1749718423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDEWl38WFpFNnd8GWTrKKFIYCiy6Z5fzCEGVZofpXpw=;
        b=GJoHq1UUoJE443y5FTw8VHJgfr+VOghYX9CHxn/ykh7NLz+B2AdkoTpFD6ZSTzyF7E
         9wVRkvLRl7wz3j+yI9vxeVey9VNYBqYrRM1BikTn5VDWGIXP35Cw8th2PY8jgHxjkkq2
         LjlD9iTCxXRAEZrTfN7VqiEI92PFgmO/kikuOfZoRLcRXTsgSvQdr1CVWCOV9pk7J0m6
         71+MGXzE+FRMGIIjfc6AbtFpiBCXO8zy+GtnSyNYly141WUcd9ZtFIG5WREMy7YsCcuF
         W5p0N8lYCCCWyWJUid2ZhDREzK1Lqk+n7VPMIMUvs/bfay/sVdmPfToa9JXXB3uvBO8X
         +Vwg==
X-Forwarded-Encrypted: i=1; AJvYcCWHVJMXHdHi8e+8ZGHfNF4gT/ZQA+bGFpCkkauex+q+pAxaZVJqqKRleiaEh688QOh7aE9DtCNOqmu6mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydliyny4ldQOCF0fXSCAhsK/EBJ/K1Z4URDxkBS/LxunCC5Bxb
	Htzb+qi0IGhRbCfixBjGQ9BWdL7xBJA4ut51EnhqJRGeyH2jrBsv/aQt
X-Gm-Gg: ASbGncuO0KDUivqkrJIkhep0Mpaj5IdJzKiTD6JiqX1hJoJ043UVq/3OQyh40nl3Ccl
	molhFCfWJjqQCjlQdauBFHrbYs5EbwBfxqgVnKb8XTyhkQ4Zp0olWmAQ0N9FAHKQ8kionevIYQq
	sIZuunM4ENLeOuzHI3zD0pP68yZpDpjXP6L9Ru5vEWWAQO7xqH9VvwegvVonszcewNloJyRNTnY
	cRD4zW5DMW3qTuFh+vW4RS+Efw/cj5ehRaJLV+woQJH+mKcAEIwjcRTa3HuoJ7oB0W98GNOPybZ
	mUjcteWAmHyyaeYKZp8/Ui+RcNjlD0l2iWWm4QfCCpcMFxFXIS7RG2uo0KIyVyBmkOXbBbc=
X-Google-Smtp-Source: AGHT+IGLH8m16XkE87l1eFPbxjX4AhOlhPsBOMe99DdtYfdVzZAuDktVgyg981QS3ANLMdJctEgnRQ==
X-Received: by 2002:a05:620a:4109:b0:7d2:1404:ac52 with SMTP id af79cd13be357-7d2198ef8e0mr991962485a.27.1749113622868;
        Thu, 05 Jun 2025 01:53:42 -0700 (PDT)
Received: from laptop.fritz.box (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a768csm1222520585a.94.2025.06.05.01.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:53:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: dan.carpenter@linaro.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: fix compare in WARN_ON_ONCE
Date: Thu,  5 Jun 2025 10:53:35 +0200
Message-ID: <20250605085336.62156-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Smatch pointed out this trivial typo:
	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
	warn: passing positive error code '16' to 'ERR_PTR'

drivers/dma-buf/dma-buf.c
    1113         dma_resv_assert_held(attach->dmabuf->resv);
    1114
    1115         if (dma_buf_pin_on_map(attach)) {
    1116                 ret = attach->dmabuf->ops->pin(attach);
    1117                 /*
    1118                  * Catch exporters making buffers inaccessible even when
    1119                  * attachments preventing that exist.
    1120                  */
    1121                 WARN_ON_ONCE(ret == EBUSY);
                                             ^^^^^
This was probably intended to be -EBUSY?

    1122                 if (ret)
--> 1123                         return ERR_PTR(ret);
                                                ^^^
Otherwise we will eventually crash.

    1124         }
    1125
    1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
    1127         if (!sg_table)
    1128                 sg_table = ERR_PTR(-ENOMEM);
    1129         if (IS_ERR(sg_table))
    1130                 goto error_unpin;
    1131

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 0c48d41dd5eb..451714008e8a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1060,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		 * Catch exporters making buffers inaccessible even when
 		 * attachments preventing that exist.
 		 */
-		WARN_ON_ONCE(ret == EBUSY);
+		WARN_ON_ONCE(ret == -EBUSY);
 		if (ret)
 			return ERR_PTR(ret);
 	}
-- 
2.43.0


