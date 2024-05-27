Return-Path: <linux-media+bounces-12044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268C8D1024
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 00:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914A91F21D93
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 22:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291C5169394;
	Mon, 27 May 2024 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BFScEVdD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B1168C29
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716848098; cv=none; b=h8rKJTOsrrbnH9cJ+/zJIKsqlDyKOJGFfzEmbXwNUuURdbn12hbHWDuVAf2CD/BdFmS8ozcCvcd3zhTzS43ZWthwbMVR15ZWJHT7b2pIif5nMFxeOeLiT7F7yiwgBET0CLqow63JvndDPr0KWlLVocKX4kL0i9q/Zzk+AFSTbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716848098; c=relaxed/simple;
	bh=zkCc5qc834sm2jFXbJrz+qWjcuUHh5rZO02ixWNCZGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVIktYZwAD0l8nojmbtiMTEFus3njMVuUL9DuGkqEtMnnW7pdib5PdN2ZA0DL1dm5N5OVu0IUELVl2ui9bH4HK8zv9q03aCvJYM4nd8zQrpssyjeTdoKPixjGRSlr1Dy+irj4AzCFnzcdAtpjOsGcHRd3tAJdVPkEAfAk3sEOhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BFScEVdD; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df7812c4526so196293276.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 15:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716848096; x=1717452896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH5jBveEGD7wUqQ+hKTo7ViWmJ+iwz9fODsOR0liGjU=;
        b=BFScEVdD0lThi0CHoyjl4b+zcmmzlnHfOCOjyBLwkr48MkY7jUwzMZ1GwWIXQ5L7Tq
         1p6eGgq8oG/HLtTryeRszd+nxXPrpjPVR7+IYIwJpzclJnabSigMRbRu4OfF+1T7W7SZ
         8QEKv55UgmpA8wF+cnsTcs/YyD3Yqq3lDh+7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716848096; x=1717452896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH5jBveEGD7wUqQ+hKTo7ViWmJ+iwz9fODsOR0liGjU=;
        b=KLS+NxhrsSOWApahMrusoRwf3BE/N7S5WH73vGOrJyI6uupO6qPGMt2BMWBF0016h+
         d7rbTlVQDwHh+NNmF+fGNvwwa+2qXMZ7Y4JYcSc7cGiSd6i2AhBhqbbeMBP7uoIX9ZzL
         YtnFtI96CaBQnMkJ8RVzYN8tpcQ6nBzg1nl/iJzjvE5648i0YmPPWdR8W6wmaerS7Niu
         07KlhUBGGMiBNShfyivAixyXWONv+ht8f3X/d2d6heeo2RQij5MSbf8DyvSQR28K1roG
         tv6tdTBwpH8S3wNcPRZk2dN3q8TOHQFE0HWE9TRj6mbL2SRkBCiWZ2w70JlpT7f/YSp6
         aAhw==
X-Forwarded-Encrypted: i=1; AJvYcCXzZFcLWz2MtJpsqcGytHOqOWEuwW5qfEogi65jS/DK5QjuTCfFsLVxqjBDeN0CHbX6UA3WvooCJLtvwj+BpDpTBp8hVEAZfrL5mWo=
X-Gm-Message-State: AOJu0YzMtE4YxFXoxO8/Hu7Ba0b5BVcFH2Zxqg/haHEiSsJ7yEzpchEo
	nX3rdKawVI4cwIJAk4N8qcECafLiYlxSMCW5beOzopSlNvpV9/pUxAOOjavsOg==
X-Google-Smtp-Source: AGHT+IF/+Mihfsp6bhL+448RZuxxPngF070ExMphzlwcEZQFgFLZGDEAty23JjJu3gtIRrXr8eMhKA==
X-Received: by 2002:a25:ada0:0:b0:dc2:421e:c943 with SMTP id 3f1490d57ef6-df7722597b7mr9399627276.42.1716848096193;
        Mon, 27 May 2024 15:14:56 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abca58e6sm329740885a.18.2024.05.27.15.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 15:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 22:14:47 +0000
Subject: [PATCH 3/3] media: pci/ivtv: Use managed version of
 pci_enable_device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-devm-itv-v1-3-f5829b8e7674@chromium.org>
References: <20240527-devm-itv-v1-0-f5829b8e7674@chromium.org>
In-Reply-To: <20240527-devm-itv-v1-0-f5829b8e7674@chromium.org>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

If there is any error during probing, we should probably leave the
device in its previous state.

pcim_ will take care of this.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ivtv/ivtv-driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index 96f40c9685d2..ecc20cd89926 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -806,7 +806,7 @@ static int ivtv_setup_pci(struct ivtv *itv, struct pci_dev *pdev,
 
 	IVTV_DEBUG_INFO("Enabling pci device\n");
 
-	if (pci_enable_device(pdev)) {
+	if (pcim_enable_device(pdev)) {
 		IVTV_ERR("Can't enable device!\n");
 		return -EIO;
 	}
@@ -1402,7 +1402,6 @@ static void ivtv_remove(struct pci_dev *pdev)
 
 	free_irq(itv->pdev->irq, (void *)itv);
 
-	pci_disable_device(itv->pdev);
 	for (i = 0; i < IVTV_VBI_FRAMES; i++)
 		kfree(itv->vbi.sliced_mpeg_data[i]);
 

-- 
2.45.1.288.g0e0cd299f1-goog


