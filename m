Return-Path: <linux-media+bounces-65550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jxWvMajNO2p0dQgAu9opvQ
	(envelope-from <linux-media+bounces-65550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:29:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA86BE172
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:29:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jyx9a88u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65550-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65550-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96293300B1C8
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366F32BD11;
	Wed, 24 Jun 2026 12:29:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E153672AC
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304166; cv=none; b=AvCm7DHWmUV0FGQ7If4k42TWzZeFt33pTndXyaswZpAQr9HgVssR+UwMzP/p2nw4o2OQjptFH2Acx3t9DJXyVQX3WdxM7Rczg38kkYm5vMl/rI4NPFBAQdo+MkVsxrl0fQdyEHnLa2i7NhtXTD7f5Q6jYNdPke/DFaHF3tyJapo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304166; c=relaxed/simple;
	bh=TvmIG4o32FkhISu4Bj0TqMnrKp958l+/HbE7lXgf0Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MkoxTLoXpsPIHMT35XPAmqh2OWoxFfV5f7l7ZKeZ2yVorGZjXNacnHacVRAUPGER19kra7QIMWbXxZvJW+ARuLa3mSwURYjZHdueD4EtWWuGviUyC6aVQQ3oXqmgNfoRoaWg+7okS8zZ48tP65VWYKtuM/hvdjDuMifd2UWFIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jyx9a88u; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46cbf263113so350238f8f.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304164; x=1782908964; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f2YBNpTeLYg62fGg7sbOleS8wV+O2KANj9vsOiEQ0A4=;
        b=Jyx9a88uUjET2Lr/CcEjAl1dLFs5wpwMztM4keF1Svzvx/ST0bHZx5L2E0pbnE+UF/
         ZqpEowgjui/9ryldcBBVW+tt3G1Gii39PGXU7SOLLqV1DrmugFNQtz4TZ1VRe4mGqhQ/
         /KTY4JzDRB1wOBdIGJggWNvOkWGn9O3UQ5pGD5shD0wPohdocdxF9d9Gx3nH2WPC9/aN
         wH4YIFEDMCXAEHL27YmTZIoMf8p3WkU7hGBhBMA13KZNU4WXlqHMVwlnvo+vL9Wd/G7A
         2jv9oPXSBuqTqTG4ZYfJB6QrI1fOv4Adx6slV6FltrUCGV9VoMQQTK5nFzdCiwVSgsDg
         uADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304164; x=1782908964;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2YBNpTeLYg62fGg7sbOleS8wV+O2KANj9vsOiEQ0A4=;
        b=ViFDlGJDYGPFkqMbxU0qS7+QxIIWL0gn4fJ2DXCnxz4oB1f838RSoHRXlfxKAK73IA
         wl99Tl/RKxD7vCVgA0QonPvZ7q77WdfEvQ6EOK3AcGx+NFjSdDijw7Jg8lBcmvXsy+cq
         T4jOafBvAgu5EoF5G6iW7feReC2x3AD1IuMMW8p3q0e1MhMY8mTAayzTX326FieuKAm0
         HZqDbsUb2LQzxgz+s1aG+b/rDoD+bhf/qOqlbOuUiWr2/qgxRQIN4N4ADEEadqGlzFzA
         d6JplA2XoNhT35vtKFt6iAENL0EO6izodxfmDFJXbLIlScMklLlS+qwfKf6LwABd5F/X
         N62g==
X-Forwarded-Encrypted: i=1; AHgh+RqHKTnsSLXxEUR9T87EwGMDNZ9YuyzqET6zvCXrCm9Zv3oZIzJuasN2DcDmPuYVErcA+ccoOgN6wBCCrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zwYwA8ESlpfVPVqH2IakCkmzhqdlA55zclU0h1KDaOXxp02Q
	KECDAhunY/zTe6mfRKMAQrQf53B7GJnSBPhhQPmXGT4KNQkvU1iqjqyY
X-Gm-Gg: AfdE7clOb9S1vacbXHrAvO72udGfHHNMy93l+3E40q9JzHmWQw/oIQ07bEAthwet4ie
	7NKfVs86bZ/nlI3Zk9GM+uJpfy0YI3xAdsk5Yn/XIMu/HlsOMgGWYNp9HgJ6hBWDjhC0VkvsUlW
	r8F1BWkbg1Rc+uBLVYmOevZ2CNWGH9CKA/H1tIbtwqdiF9wz4HIho+bkf3uWwIaDBSLtBTCLsMt
	VDfAtMYntgRMXCkxok4QcozgsTrsjzOMoJpWky0DSj1xK1DySoEyDODV2czywhUYN+yBM3TrfTv
	h8ihxJFSA6bdS/wz/+CWri8zfwrMxxhUxw6Y2uME6AMSjb0jsMQReZuPmX2xXUD5Hrqso99RGLy
	NeU0baGZgclvbd96HX7MgWcKdEXSYNf+140Xtclx/PehcO2a9G00r3FxgAHmpbcAl+wBaFQxSPx
	jiBxr+giEiEeBIpDKwhTj3ow1Y9g==
X-Received: by 2002:a5d:490e:0:b0:461:a169:f965 with SMTP id ffacd0b85a97d-46c0b8b182bmr3421914f8f.34.1782304163747;
        Wed, 24 Jun 2026 05:29:23 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/10] drm/nouveau: use dma_fence_test_signaled_flag()
Date: Wed, 24 Jun 2026 13:13:28 +0200
Message-ID: <20260624122917.2483-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65550-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:replyto,amd.com:email,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DBA86BE172

Instead of dma_fence_is_signaled_locked() use
dma_fence_test_signaled_flag().

The extra polling check seems unecessary for those use cases.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index edbe9e08ba0f..6601ef52e301 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -83,7 +83,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 
 	spin_lock_irqsave(&fctx->lock, flags);
 	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
-		if (error && !dma_fence_is_signaled_locked(&fence->base))
+		if (error && !dma_fence_test_signaled_flag(&fence->base))
 			dma_fence_set_error(&fence->base, error);
 
 		if (nouveau_fence_signal(fence))
-- 
2.43.0


