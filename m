Return-Path: <linux-media+bounces-56315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDbZMpvFu2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:44:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE72C8EE3
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78CAF329DAD1
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244473BBA1D;
	Thu, 19 Mar 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM/6jhu8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C912B3BC67D
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912999; cv=none; b=FEFQuR9fVCSeOG+mGBr6cOb+nSpm+CMTVrtHvP9MLDxW368ihAROVRqoUle8u4C7LX2SE4n5uW/sJ2MuNtPmVLgKPX0lFFp8NS6BBtsmegidkWjzrP+nPoalTpepk4T6OxkROkfl8mkN5V2PnJkclhn+akqFMp88/cjU6yoEGLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912999; c=relaxed/simple;
	bh=ALCZuyCbQDE4PR0CBGgDwNFq5F9+cHZWAcLlCPhCigs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXErpmNuuJ8EIUu2UmM5JFJfMEjjvgRsxh1pHl9+mW9qaV/VVUViPvZFtSBNtr5/HyBGXBOdy7DAH6889jdPD5hg+or3XX8cXikVuL4ZFFIJhtxW/Dct/yLrdQa7bf2I2AYJpxpHsIzHOeN1sVTstZ54KGZitblrZR4DmGNdJYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM/6jhu8; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so341621a91.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773912996; x=1774517796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afv3PFH4437gcExyVUtKDrjEDhRt4MOcfGEC4ZdfMa4=;
        b=OM/6jhu88Fttlt1sHJpbQYgZC0ncSOlGomD3kewSzWG/RGrNYpLROHiXY5endMKbhb
         epwb+Eoo82LxxVDNZYZ51CpGnZrEeJ8yBop70h6GdhiJsTFQSurRm3XO20kEklZc+xtw
         qy23dVblMpEkXCm20ofzijhUg/YIwqwg0aBOsixpGmqJth1M4g7ibMUF2fR8/ft+6vyo
         bB3Bsm3qqBY/5nSyRzHBAcYXMvZZm72Lw3gw2WH4pJUTZR5FLDcnuVC9w8eR1wtKwuXr
         sd3ovj5ME3F0uGHe6HrBLCxenTVhSXtNsAAImTP89Wac/M7cbqrTCsh8bshJYKoE84Bl
         AA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912996; x=1774517796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afv3PFH4437gcExyVUtKDrjEDhRt4MOcfGEC4ZdfMa4=;
        b=k+SSYYNPIQ0FQgxEs3R3tvCBwmEnEDDdn5M6gUi/TCIYXBoR9wIgoGzitfjVy68+YO
         JxPhcRTZSnuPHh8XIqblkTmzAVrtPCjp87e11Ru4qYLo73AxXGln4UfOxPcFc05SLo7p
         SP66yHjIIqTALpF4W1g7VHb1dKmMEJPxYjGutho54htvA+Hdon3lAhvGLMk5czmva9U2
         +4YD9QFEpJAVVWOOKpq0tW6T8hiXCb2m+Jqgc2fcN3vD2e2DOOZV1S9gujIFL2p3O0MB
         I9GhDkD+UIYKZSReNp63ZQBrY1S4yg19ukv26Bym60AfzvmXdPnok/CenpyTh7JcHyGJ
         /e7w==
X-Forwarded-Encrypted: i=1; AJvYcCX8TFdvZ4dZ4BFEEwSbJCnaEl31LAHua2T2RXXrRgzf4t2iXZSWRZXeTAT6TYN54+/H82kh/MonP3Icdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdIPsVNMOTb73gBcoG21BiiPrQRSZkfv7v9KqwV2yqMMPIHgJ
	6p2PESCInvQYfOjxxw0Ws7v9dRZGDXOMj3exDaKmNhYqPQbgn7Jc6cZiusd3OX05am+NkZBk
X-Gm-Gg: ATEYQzwsLOS3Jl4m6G/vpG0vuHUfnL5vqFtbb6u7bIwcevqjTxEu23pJ2QcWPrDpAEB
	a3+JU6A9LHTltfkS22epnCDeoXwNOeKsvDguknOyRNCiyeJdmN/feoNeQ16hxAesZQ9t+gnDcf4
	ex/ztKjYkZB9woBISaTQ52i2LLSLVeOok7rsjLkpbETledqiUU8GgmMVKiDi8gIl5i9EeORC/nP
	cEZcjPjsl7rU5TmSFmxVKaptaJbEYsYZz9mh8ScZytG1l/qVSDiplxwD+rhAq+ZY6SHTjF4C3IR
	z4aakzNjrJHGTCsm/j3qn8IqcmesUKQPo56TgehAAQM5T47nCdV+YrUGFt2JB/j+lDySidx3z2a
	O6fbkIFGenT4n0J1w34L3D51o7xspIec1mcYPTytO+DSNIIIc5Vdsnfgwcf95VOninEQn5+vwG+
	f/kMiru1nvwaB1fVNaPQrUSU78v+0W2PAKxWCvsL5YnbBJV6ALvMpizJvvN2za8TdcLvnj8bWR7
	DP20hkDYJh5/0j4UB1zcMCF9Ylboh0gcLWt/1yzmEG6LqSpVJk=
X-Received: by 2002:a17:90b:4ccb:b0:356:1db4:8fe5 with SMTP id 98e67ed59e1d1-35bb9f477f0mr5945568a91.29.1773912996005;
        Thu, 19 Mar 2026 02:36:36 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6026a5asm2663607a91.8.2026.03.19.02.36.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 02:36:35 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: media: atomisp: hmm: remove unnecessary casts
Date: Thu, 19 Mar 2026 17:36:25 +0800
Message-ID: <20260319093625.3225-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-56315-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongzile99@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.965];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DEE72C8EE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop unnecessary casts when accessing vma->vm_private_data.

No functional change.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 856561e951a5..68116edda591 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -975,9 +975,7 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
 
 static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
-
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 	check_bo_null_return_void(bo);
 
 	hmm_bo_ref(bo);
@@ -993,8 +991,7 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 
 static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 
 	check_bo_null_return_void(bo);
 
-- 
2.39.5


