Return-Path: <linux-media+bounces-10788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C18BC088
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 15:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235CC1C20F44
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE9E1D555;
	Sun,  5 May 2024 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjTrFV1z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8521C695;
	Sun,  5 May 2024 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714915435; cv=none; b=uIDVWQu2hGMltC6QwUx3z22ju9hwIpPP1IWjefUTVL9jJIAGCiVtA+0RXPKasR7vSt3hTOElaxuFxRPVMxtk3QXRNvtIcmcz9m/PU77H5iEcXOM6uZh9oYDZ1I3VpSY27lKmRKhb68QTANTy0RdpWSxVEC3eCunWDC2zcqmDMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714915435; c=relaxed/simple;
	bh=RZBU9BLwoMqxabCjuE4NgICjeuHsBhDACgoIfR0UVsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RWPs/qfmzbMjd+zhWSODyLkN2ZlchSGoGzVANRs3QrGKkTMQEPtHwalKtr+3/UQ56h3auQ0Csc5HLyOjUJ7nAIpx58arNIt8gnl19YiHRQnRIyV2V8OXEMkI3FJZm6j8eVvqr21PDXl7RxhKMNNSg1M7cXFl6gRUBln2ALsTdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjTrFV1z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ec486198b6so7335195ad.1;
        Sun, 05 May 2024 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714915433; x=1715520233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mc0FzHEhUeqDsgURvEW8MExped5cfDIKcyo64gW0V3A=;
        b=bjTrFV1zQ9jGXogYzUooilqMOz2ODpKXt8J38Hxh2xf08fKOcxfyBk6OSIyypzIWTv
         EVMPzgf91JmKBup+CfG+Lsnkf3e0JRMTCg65fnsloFvC1fHYbvq8/EyWlwG+McYiVrJU
         YtfYTDy08vwUw8VqmHuOv2yphdOeWrswM9vTWCosfpXwdnY4CTKJsh6E6fKkzA3dXo7n
         juc/yON8irkbk3yH5Cfed7aHCIUmTmMloRK22yMwFQCEcXO5BCRqPvN/myXQn956/Jt9
         U6sJOi4btTMOWT9JRAeW75hNUCHGnb5ExwpWk29/wg5HPr3QMRatzr7sGSGZ+EEk4DV4
         7s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714915433; x=1715520233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc0FzHEhUeqDsgURvEW8MExped5cfDIKcyo64gW0V3A=;
        b=VlF/4/uH2rX/ONXBg2Bs13RcHEM6e71J8qjjevH9pzvLjGYyXWOHC8EzuXjPReEy/R
         5rLAqTP6DCdXpeL6wqEpKVG8oOURgKb0Z5QmSlG3zZxwM7vSBKSdBjb3mJ81M0v519f9
         iJvcg+NrBcQ2zCdAvZLWRViRE04uCDAzc9lSfZsey9sxC+coy64RLUxDs5FB4x4wzbsN
         l2J88YlilMp9xlkSZ0WPuRgm9KFCtdQ7mFnwa4aJpj2Eh2p52Ii8xGrz33Jl0dtaw+2c
         XRRjeBeNpp3F8pUIMYVe/LqUkBf8oHnvpKuQYB8WSrZE193IxKzHLcMr69qp0tOZuL02
         MAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUU69Y+sJbJNv1CUsmS43P6bT2tuyxlasrPPUiCW7PnANtgtmev1DnfJK8ITP+i4nbd1uGpyLhMYd1CL+Xtu30+tBFBWSlv+7Gp+5N2hJcd+0aZgby7PrysfZ1Xn9eKu/Eg9Tuat3ag30g=
X-Gm-Message-State: AOJu0YxAXwCvLvwkwCd840vy3UpDrIlmXP2zpJGsNivbzSpLN14hYlDc
	Y6VGl3FhFei5gXILI3KFyQZIbot/nPD32sOOejag2prTRsEdlFLf
X-Google-Smtp-Source: AGHT+IERzKT6ecipwoJu1Z+lrbemytWDosmvEMrqC5CfWS5gLeUzk4VxGRn1IuPLY4snAEp9Aa/hYw==
X-Received: by 2002:a17:902:64c2:b0:1dd:2eed:52a5 with SMTP id y2-20020a17090264c200b001dd2eed52a5mr6903295pli.37.1714915433499;
        Sun, 05 May 2024 06:23:53 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001ec4ed47ddesm6511645plb.86.2024.05.05.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 06:23:53 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in hmm_bo.c
Date: Sun,  5 May 2024 19:08:44 +0545
Message-Id: <20240505132345.135528-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled unchanged in hmm_bo.c at two places.
This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 095cd0ba8c21..b90efac771e2 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -288,7 +288,7 @@ static void __bo_take_off_handling(struct hmm_buffer_object *bo)
 		/* 3. when bo->prev != NULL && bo->next == NULL, bo is not a rbtree
 		 *	node, bo is the last element of the linked list after rbtree
 		 *	node, to take off this bo, we just need set the "prev/next"
-		 *	pointers to NULL, the free rbtree stays unchaged
+		 *	pointers to NULL, the free rbtree stays unchanged
 		 */
 	} else if (bo->prev && !bo->next) {
 		bo->prev->next = NULL;
@@ -296,7 +296,7 @@ static void __bo_take_off_handling(struct hmm_buffer_object *bo)
 		/* 4. when bo->prev != NULL && bo->next != NULL ,bo is not a rbtree
 		 *	node, bo is in the middle of the linked list after rbtree node,
 		 *	to take off this bo, we just set take the "prev/next" pointers
-		 *	to NULL, the free rbtree stays unchaged
+		 *	to NULL, the free rbtree stays unchanged
 		 */
 	} else if (bo->prev && bo->next) {
 		bo->next->prev = bo->prev;
-- 
2.34.1


