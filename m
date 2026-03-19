Return-Path: <linux-media+bounces-56323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DdBBJDRu2k4owIAu9opvQ
	(envelope-from <linux-media+bounces-56323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:36:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BFE2C98F0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A241301629A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E533B0AD2;
	Thu, 19 Mar 2026 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5OY63mv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1EA37AA99
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916557; cv=none; b=UsToNjspW4jScHS2UoalNnLmQU25o8TGgIO1pwQcyHnXiGxwxDB7lHWcM963CBUA7JPkSQsJ4DCvAGq+ukk1KxnAukyoWm700YjCLsKbm6jrG47J7ZM7YyHKCfMwXYBkJj50wBfaCxmruQxw8jfyoq0M1JlMfolwX+uv2BGFrug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916557; c=relaxed/simple;
	bh=swkt+SzHSUOHWDBwk5D+2y6l5EfClX0GySUg5E98kw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nq4tqLly2d28t5jq9zskSjorh25A4PqeTaEAiIeSWB6zMjW4iGfwsGCIBd+T7ektv7bVkbaXbZJWgPx5/o6JazfkQ+UfW6kuX/r0qheyF5pz414X10Ns51yHe0en7YXehOadD5bk/Z+2LHi5kFo9W532patl8xuchejNiyxA5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5OY63mv; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so282936a91.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773916556; x=1774521356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlPl5K2k8DfaT1rbeWGKMb6z3TeEUyI3TnPwWJfHuxo=;
        b=T5OY63mv927CC5fyO9HVrCcN9ev86tAyw5bV+CAnny1PcIjMRK2rhYRGwO3AgdeWA5
         foxTZZcLEopUEnfjMjH+CmB96CPVa5G3PXHESrUO/aFwSHGAabt0JA1LCDbeEQWipvLF
         P3IcIOsypetZ1KzDLKXUyulaXKmvEWVVYnzCh0/1+GU7IZsLJY3j5ErCDRPBtw2+hv3t
         PUF1855FvVTh1VEy8roY+3hGWBuB4SCA2wSX4ErZhhnDxsok/zB9w947OX/95rMl+lNs
         ojKzjrNcvzDe3OFxjs3GzzUS5ENcBiPF4HxbP/EVFu5VPfIF+ykt0AX6jG+LQrZXKF07
         xYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916556; x=1774521356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlPl5K2k8DfaT1rbeWGKMb6z3TeEUyI3TnPwWJfHuxo=;
        b=RuHjnqcHzycimbS5jIzX+0XnN9LhCaUaaZcq8OQgBUmF8qfx0zFh/EXY9+h1M9Mll0
         9goDUmVtLy4q/T6eruE/dxphf74v6zs9G6QbGDcllPZAbeUxxG8vt8Mm5g0niYpXkmTq
         Gtetp7313T+WO7/rXDRK2spq1OBkYi2VF6YK61KXzG5XbmnwM7MxyE7r7Im9POd4C/UZ
         VvadFkwq+fObKAVbF1PxmPfGKD+090KJxNrwzCWObhM+ncqo2WywQXQrbisWvEl6AliF
         ZXV5UKSndgWWJD3dcuX5rjlkPrN8V0M6UZN7tV8nhEXhr8RdSnoILAG0Po26PmKWurqF
         emSw==
X-Forwarded-Encrypted: i=1; AJvYcCXfuzjpK5Hz7pqgyQu+BETS6l6KhuYLW72jg+rJ6mjCq0hlq37GGMjY6ZBpv5YAKrvir5/3CHWJYw1A0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+6uLfPCQT91nR4DX7unS3VOPTFFu83l8wpDawXtGCbItdkbuW
	wigFwUPV+vC4iGvJvtFVvxJ9spi2uwVvlwIhRF2cGkglvBPhLVmxjioc
X-Gm-Gg: ATEYQzzYgctoeRBqDStlUP1L01drLqY1uoD7pmeJwnRJaEjvVZoZfaRyQGqWfT1sC5/
	Q4L4tWsilWI0leLDCMj/zDflA8lHM33WYJ9EB45zJP250Tf5dWtFf6m0300SGRMGALsBub5nnuA
	3ERM4Zr/SX3BOXnFhlgF0xepxFsZVAOiG60UspF0Z2n+LOlByaJ9W4ErKy+VDuI07bwhQLqy9mJ
	3TArnPkn+Rrcc1X8hZpHCY5DPkZvGCgUSysOH87zdIp3dvGKD/FTtgUtiGzWwYQ/qr2UEMrU1q0
	qgQidJbeXQ7Miex81xMSyHovGDP27QQsL7BZK03wOxG3tJUQKN75F8i3itB6cJew8t6vrdwTOdk
	oPJz362cqDRaaEw51QOZF0HY9DgPOOQaO+mvQIEzimogwjhqRe02SrKpI6CB7wRYD4fBfPNXt1P
	BNrM+PMGiAIpK9H2xdKshmpDeaB72H9cnVDr00YzhFb6HDxXMEhHjb9MtYyz83JWW7V6j5pFvQ3
	KBln1uVuvvzaRqpR5rCuU33jdu2SFw1DSY=
X-Received: by 2002:a17:90b:184e:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35bb9e7d24dmr5920825a91.13.1773916555696;
        Thu, 19 Mar 2026 03:35:55 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6026a5asm2850964a91.8.2026.03.19.03.35.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 03:35:55 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	abdelrahmanfekry375@gmail.com,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: hmm: remove unnecessary casts
Date: Thu, 19 Mar 2026 18:35:45 +0800
Message-ID: <20260319103545.34515-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2026031933-juggle-decimeter-3547@gregkh>
References: <2026031933-juggle-decimeter-3547@gregkh>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,lists.linux.dev,vger.kernel.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56323-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongzile99@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.924];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E0BFE2C98F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop unnecessary casts when accessing vma->vm_private_data.

No functional change.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
Changes in v2:
- restore the blank line

 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 856561e951a5..bd8091c21b26 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -975,8 +975,7 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
 
 static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 
 	check_bo_null_return_void(bo);
 
@@ -993,8 +992,7 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 
 static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 
 	check_bo_null_return_void(bo);
 
-- 
2.39.5


