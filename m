Return-Path: <linux-media+bounces-65553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mYHEItPOO2r6dQgAu9opvQ
	(envelope-from <linux-media+bounces-65553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB86BE2AD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Um8D1CFP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65553-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65553-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B247C3165055
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6506D3AEF5A;
	Wed, 24 Jun 2026 12:29:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F9399CFC
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304168; cv=none; b=ttXDk3s7naY3fyRu6bzNi/Or2ymyqo8MUkAt/lWkusrhT5U4fZdCtUJhtjdFGiYpJFrRnrmX9BD7HLcqrW4vJjAbS/FdYjRpXQd2erZ1L22s18J7Q/9cY+Xt5rsSmsT+Y8kcBtxCwi7NlWs+YjE47zd8lpLysyl4LKFogQ9llxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304168; c=relaxed/simple;
	bh=RmNaptBwvXyeljMZs5ivEdAueXLm2rzJgQFHE2lrnBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLTC1QBvixs/lU8/j/4vvkHoK+g1roKFFK1R4iSnVXZ2+VYsG0f762ybOvnlFEscuKh/MYdl0hOqBedEpGhhH65H4/IJMT/+q/VaVZ8NgINCFe+irGX7U3YgjtzU/MX8JljOby+Hx1/ZfR+pF5YXORoOmxplk+kRbBQ0WNigyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Um8D1CFP; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so7290445e9.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304165; x=1782908965; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gDF3E/f0HpcAxk6Syf/Djo3DsKUW9SV64tqXNSKhSz8=;
        b=Um8D1CFPqBm0QO+3h0wAk8XPWeGGi0PPfIXZjvUhugyFa2r6mZfvz8WampN7coSJSn
         YoG2/k6ywBZKbSNwK+DXs0H8JcqadLABUi2RfR22eK6wkD37G1QHBHU3Fi+WgbIVRIrk
         42GypX5VI14dTdFAsQZg+r4zoDOBa4hycABj2AmqeYrv/W8FWuEQ9N+wvPfDAT2R0c43
         O94Xrkcw2uUsrnC6ge94ciLwcq3xNXAGNPtpgCGQ4P5Hfv5bzI0SpjPhythMzVZWzJ+C
         Sh/0o9ufO9YAVEHqyVv0hysF2XFK3nGHJowfVdZ6uxJBS8YD4b69ccdvLgIUVM9Kd6WT
         /Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304165; x=1782908965;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDF3E/f0HpcAxk6Syf/Djo3DsKUW9SV64tqXNSKhSz8=;
        b=sP+JZzYqIU3bPoPB2KVXwWOPRyAAKD1xT2gQl0k7a2ao9aDNFkXzTS7/6zfW3yLKo6
         maMemlE4/H6vUsntCJkbV18YOVubeGTuGcdXrX3PHL2xXlb3DrEOcnz21ptI5W4Q4khv
         E6a+tvF/S69XLQRRnHLqHLk7Ac3hqPSSIrICH4ORUdPWrRIoyznkkxSb0J/Q+RiPkpNH
         s5vrpnCIvbPlVlK3BdOR+bJw1Y24WfBSSDsjt/yBrF+5tYYfZQuUj81EhbvAQ6BEKYry
         i7EvuOeJ+PU5+vP87UAlcn7x3aA812Ben4fiCjxQtdWBhJ1yyyshvBVcCAEFXEql/cPF
         hIKg==
X-Forwarded-Encrypted: i=1; AFNElJ81me0nq3wCzwftiKSaV3t5UuwoQYDxXOow6jpgyJqN+Fs9kuIr7kcL8Db4RhdxZcHvidpZXfc1iD3znQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRk2Tc5GhkoxhZ24/Kit869iwuRU5sl423Y1okkSLUH6klOD+t
	ETVvcJArE1V915wAy6eRMFi+O+3gOH9iql6vmhc4vVFVoIHWPVzWZNhQ
X-Gm-Gg: AfdE7ck9BdKer6Eh1fxOKVV+lagTg0so0WAcU0SB3IMKcqZyRbP/onVPLuo4DdS9zXI
	AkQHSPB57dK76xtxz7Smj+Had/bybVYWKfRawjd/CZY7eBNzPQ+6FZD/LOSE/x6Nryir6a0XKzU
	yNELEBfbzi5stqwRngzU/5sVnLbMN7PmgIzx/n3y/GGHVOIpoLO5KbLl0iFQrf6pIHu9dNoQJs9
	nqvYco/T1++jY2K8z4QfTfZ04WXqWAEnrW6f7PCeB2vfX0EThUiY1PF4B0V+KQ34gTiFCTdZQA4
	aJF1Ha5l3LxPOUdZztL2UnJO8WpOdCPQb9FKy4rMMqd62rX2zIkgI5FN0pupLCrv/bt9OV6Fv3M
	oyEjgWV5HnyEt9krUObl7h/dCoIh/PRIhE6o9wEC3s2qYpKj2gGVLkry/MCU90tvPi4MVBoOPU3
	hgsDYh3m5mbTLqjtndJfjm9spQ9g==
X-Received: by 2002:a05:600c:5252:b0:492:4a50:8445 with SMTP id 5b1f17b1804b1-4925b387f72mr116817505e9.31.1782304164616;
        Wed, 24 Jun 2026 05:29:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:24 -0700 (PDT)
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
Subject: [PATCH 05/10] drm/sched: use dma_fence_test_signaled_flag()
Date: Wed, 24 Jun 2026 13:13:29 +0200
Message-ID: <20260624122917.2483-6-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65553-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:replyto,amd.com:email,amd.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7DB86BE2AD

Instead of dma_fence_is_signaled_locked() use
dma_fence_test_signaled_flag().

No functional difference the mock HW fence has no signaled callback
anyway.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 14403a762335..82dce344bfa1 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -224,7 +224,7 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 	}
 
 	spin_lock_irqsave(&sched->lock, flags);
-	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+	if (!dma_fence_test_signaled_flag(&job->hw_fence)) {
 		list_del(&job->link);
 		job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
 		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
@@ -258,7 +258,7 @@ static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
 	hrtimer_cancel(&job->timer);
 
 	spin_lock_irqsave(&sched->lock, flags);
-	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+	if (!dma_fence_test_signaled_flag(&job->hw_fence)) {
 		list_del(&job->link);
 		dma_fence_set_error(&job->hw_fence, -ECANCELED);
 		dma_fence_signal_locked(&job->hw_fence);
-- 
2.43.0


