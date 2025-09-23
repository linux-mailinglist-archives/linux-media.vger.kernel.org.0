Return-Path: <linux-media+bounces-42988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088CB95987
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 13:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6103B66E8
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 11:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE722321459;
	Tue, 23 Sep 2025 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0PqUndd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC330F545
	for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626088; cv=none; b=gKkMH2vsKNJ078mUyFpGMBzIu9IWpZqu5rhqQLMNmycGTu59lLmXVnpHZJzaPsABHRnyKfUrJtx8Tk/1Wzmj6W+TESCJZOugYYzsok5ScBIBgOztt8Z6XMeqINJ+OuujCqz6qoKpisTTliMiLSQjg4foYrR3ToUuA0TszgjUNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626088; c=relaxed/simple;
	bh=YptwYi2KhyqTs2MPDUowQsobfWUXyvNShpVbrq//inw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKTbt/Lw21oy+SGD1/Yj++0Fmgz0DWx5TxKdzEnecT1D7UFe7xJFKvX87lGTJCr1YZWtJEi5KfMqKlVKNL2F57r1O2zLtlSWJWDmZWIAuaN0t/HCIfG1FLF533DVXXYVZDn+n/fnGK2HqDhReEFiHyIF2FCeXfoohqsga9F+D5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0PqUndd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e24de89c1so727815e9.1
        for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626085; x=1759230885; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veRQoXTOP5jOH7336MItrAXBwCoB6ZB/LrxpVKH7RUg=;
        b=o0PqUnddSAS6bInqUUA6bb5FZBQvq8yHaQJuN0nfxLYkcqvfG5vgDd3MA0uKxSo8R8
         9A47geBU6a/EmrK2quEftVqzHyTIr6M8BTSEtzbcsQXrqTzRJi8wbCz6YHMEAoTEl9dr
         nF5lofTZwRwrK9aNRXOoIsJGmF7AL/AIBdI9rRtE/MEvk4i7ZNCt2Wl9itowgfz7q4Dl
         IbDJDm5NLn7P/TAtKi2RSxEgBvHbcjfETZympUEIemBvMnHZfiIORqxPxHQUm2wjSmDT
         V7isVuffOzb+qy28ghGfujLf4pmCPAZZ91mo8VL8NPChgMKry/0wdtDfstToqZqcSKPI
         JYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626085; x=1759230885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veRQoXTOP5jOH7336MItrAXBwCoB6ZB/LrxpVKH7RUg=;
        b=r3cuqVvPoYNwPVSREIvcrYjLFtMF0O5so7dxRX5AGsE08tzym12oxTHwupL8IcTQBe
         vcu8GDB903K1ckMa34MPMobjaS+w+l/5HvaYOT6ZC11gCyRe3Guel2dsPgwJ6kfvp6rb
         m7Pzh6C214nt0IAdVCsNTLkqfjKojLQtWNufqI/xS/do+ZBef+9YPspqukIVNOaOfTC+
         gV29tLt9zf4XREwAL0NYQO5Nd/rWTbe+L4gNfb54xf7tDMn0wZhQJV3JvStlR/VN4/X1
         YL4wz/+tUjmC08E18gWv5iawbAgWSV7bkpHLLAmI4WZTWldnrGqomfUs0n98dPhoOg4F
         /JPg==
X-Forwarded-Encrypted: i=1; AJvYcCVblkkQvis9PFC616f6GkGhlLQOwU3Bl1u8/JyXMSpRLpSQdILLRsLIkN+2Xb7xQYyd1Q/76k6RJARr6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3LNywfkc4Snah4KP5F8LdUQMx50HkbOP8MySOKAaml9pfL9O
	rF2tSuaDkFSS2OHYO0dtxONb5Hye5h5Tzp08M52OaIDSigMw6h5CsQ40LYIl2DKe1pE=
X-Gm-Gg: ASbGncsKqb+V+Wj2LYAXh0aC+S3p2rzhAC+VG/f5a726pEuloQ8UwmtOr6ULLYeHXzp
	brvzQyCbcoRnR6LAOZONlv/B6cn8VIvD1Ph1Q5XngtSbdv891304GS1lNbPzJlpG1Nl5QwLWqZI
	hbPn+BXNdUI4zc1ivKz5Om3zsWuky40LOynUzs3rxvf6fH6BllHF/r75j6bkveyJmGiNj4hMOP1
	swHBhfatwYhKqnhLt1O0aSODyxpGJWFEXv/oxKaDLaCYF9aCS3YoAsWkqP8RoHaP6KShGw73zuK
	lIhSgXftSvaPuZeyqrLHZJDT7dMBwabMEAP6JmMow4x43LTmTzBEWKdS6j2rYh7hXdIAtZ2PRla
	xhFG+JLdlgjwVgisYyG2u4cnJn4bX
X-Google-Smtp-Source: AGHT+IGNA4ZE/G6xv8PAXiFATMi0x7yx2B6IdUPeinnVHdHE221ujk0cX1DYaOF+khzLyUivuysi8g==
X-Received: by 2002:a05:600c:3145:b0:45d:f804:bcda with SMTP id 5b1f17b1804b1-46e1d9817dbmr22553515e9.13.1758626085008;
        Tue, 23 Sep 2025 04:14:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a285efsm270902105e9.18.2025.09.23.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:14:44 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:14:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: fix reference count leak in dma_buf_poll_add_cb()
Message-ID: <aNKBIcpF6kZRG6Mg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) if dma_fence_add_callback() fails.

Fixes: 6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From code review, not from testing.  Please review carefully.

 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..a14e1f50b090 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -301,9 +301,9 @@ static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 				fence) {
 		dma_fence_get(fence);
 		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		dma_fence_put(fence);
 		if (!r)
 			return true;
-		dma_fence_put(fence);
 	}
 
 	return false;
-- 
2.51.0


