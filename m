Return-Path: <linux-media+bounces-67036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xkb2Et5vTmrnMgIAu9opvQ
	(envelope-from <linux-media+bounces-67036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:42:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6A87282E3
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:42:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=oKCQhpiQ;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67036-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67036-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E335C31B9271
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6BF3F12DA;
	Wed,  8 Jul 2026 15:22:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F2439339
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:22:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524131; cv=none; b=lm9viZnxxE1WXfDWINVXuTTZTojWlz6hAPtNV7lbh3M8Tzl9db2BZn5hNlKr4HOIIqZbBLZQuh5+2edLaz45+D5LmzgHU+GPGf8YVNpeObN5CsrcD6s/GR1mwc8ajDBDnzkm9W2lysqlGlSW/wgJ/U617tu467nqlDsFmnWNiXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524131; c=relaxed/simple;
	bh=NAe5ipfAWpbnz6hRDdeQSkmmoh9BsNhifBuHOhAQsgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtEKkBlfW2C+kqX0lsJIG8IdTLZP0bWaOdss7zCwImz5COHTqZPQ09O03D0zGIwM5uBJbJ5morE3iG45k6oM7fV2GPDxBtDTeWiOxgserMWrZ5u4W6wAJfUveLq1Ke86aI+i2KXGbWGePVIbb7U2vUl+gVqC0t650liJXE0b+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKCQhpiQ; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15bf399d3bso97891566b.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783524128; x=1784128928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZIUQ8lhybvuqUO/Qu4fqmCKQSSQtg8HD8yQYy4im0M=;
        b=oKCQhpiQCa2dwzFjxUvNxgyJJl+dqtwc6st1Rj72vJL1ensrH1/5ilfNV0fS7AzIb4
         Q2vtHCy+an+l8YC7CYjZH9uZGuVHyorH0Nc0gTwtdUX6HekGBtdxDt89JtMlk8RHc5NR
         epTrZiaz5VA27dJgDYr0TnOJyTApavcs6Z37XyCVCmEeRVSyETNFEa69IqazW/7+eqRr
         RpspogJm+uzzh8l/YMMKwhCt8l1APi3SlV1xLbTsNox6kJ+A8+bHxuY8zB7dQ9EkN0NW
         k5Pv4p0I2dZGM7PgsvtX+C2PAObFsBK4wUmNY2KaVr488sd/v5+I8r3xQSfnbJxNc6QK
         UBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524128; x=1784128928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZIUQ8lhybvuqUO/Qu4fqmCKQSSQtg8HD8yQYy4im0M=;
        b=fJUpkG11/bd/KzX4VRPLdSbYinyWm0lLbKFTOKM728spLnlv8FqnE3k8mjlQ/xkblz
         4D4ysPkjt4JJ5BVIXOTF9dwoz5cADnYSv4jrPHlmjf7ou6DXLm8t+IPc4cLB20obM4aV
         XYXfvmwaFQ2vE+FYnlfLt67dD7a67KcKthnyXZBptE7Pj5v9RCPK1YfR98qVfbxu6nka
         TfqK8ZsQwLltapiNkIRgtY1iG2FbHMFqHLVVSLq/s03Sm8w7DtjR+v1zWx36qEqkntE4
         MexRLLJtOgBO3ST+vy0+hKFS0LYLKvkJmN5QgvjEBcGkozdzwpcEQygNDq8Tgh1YshI/
         1/MA==
X-Forwarded-Encrypted: i=1; AHgh+RqMZeneYEq0jOfWBvjsaSLJjYhJUcu2ik97BRCiuIYwAK+xfinxd9FykvQGk3yd4eq5a7YJHh+TFraSSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyazxnfYtxlaYaJVVRasWHOhKnNdaOrQNA3G1RbycqJIXi+rW3i
	svqqRMp4l9JVR6kYEdarMYBKR1jn1P0Wqpz9/MCa5rvQcsuH2kkq1QANVMDP2MR0fXc=
X-Gm-Gg: AfdE7cnA7qsTtLKxoXAtVQCRimYKQi8rKsqI+rPyAKPrf3Md257taj8B98yirGhvRcn
	VN0q+zTInTuJKN94hTSaU56/1cM54bSWwkWQ5tJSPfrYNpmC8vGEeTnyBFW6AULOqNdruA5/4uk
	HeH0eFhO9XLUHbKl1x8SdP+enOhFyczHUvJp/rH8WCf58MBwUMLHzsjbITWL4CiHX44ww8GztfJ
	0vZV0XAhnlNetMvDXanb+T4Us3YN/u2gjg/ofsOBl9PCsSD8E4HhYFYYcHh+hUza9vSJJcFnkOs
	XTE9Q/WVClDRNVrRLse4Xhxy2BitNksLqqZGBwMvZhXDw5MRsBTpaHaHuyWkBFOPCsAz4pNYVVy
	ZNv33eCfHLCIPwq/LHXBFsxZvHvwxmbKYwv2Ma5kJH5uqpwxajcQcvalsS/upLy+PZT2rbUNIWq
	sW+sUIx2VAX6AI7jptStnysye/mAI1RyLRG2wxEltKludCuXMq8+7cDLJqCgpoSv2fO3e4hJQy4
	mq6JtA=
X-Received: by 2002:a17:906:f0d1:b0:c15:cc30:6c70 with SMTP id a640c23a62f3a-c15ce0c06damr103325566b.42.1783524128259;
        Wed, 08 Jul 2026 08:22:08 -0700 (PDT)
Received: from puffmais2.c.googlers.com (181.179.204.35.bc.googleusercontent.com. [35.204.179.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm213932966b.25.2026.07.08.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:22:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 08 Jul 2026 16:22:05 +0100
Subject: [PATCH v2 1/2] drm/drm_crtc: ensure dma_fence_ops remain valid
 during device unbind
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-linux-drm_crtc_fix2-v2-1-cf72be75d75a@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
In-Reply-To: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67036-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:andre.draszik@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA6A87282E3

In [1], sashiko reported the following issue:

=== snip ===
Looking at how these fences are managed, drm_crtc_create_fence()
creates a dma_fence without taking a reference to the drm_device or
drm_crtc. Because the sync_file framework exposes this fence to
userspace, the fence can outlive the CRTC.

The dma_fence contract requires that data accessed by dma_fence_ops
(like get_driver_name) must remain valid for an RCU grace period after
the fence is signaled. However, drm_crtc_cleanup() and the subsequent
freeing of the device do not wait for an RCU grace period via
synchronize_rcu().

If userspace calls ioctl(SYNC_IOC_FILE_INFO) concurrently with a device
hot-unplug:

CPU1 (Userspace)
sync_file_get_name()
  ops = rcu_dereference(fence->ops);
  if (!dma_fence_test_signaled_flag())
    // Preempted or delayed here

CPU2 (Driver Teardown)
Signals the fence (setting fence->ops = NULL)
Destroys and frees the CRTC without waiting for an RCU grace period

CPU1 (Resumes)
  ops->get_driver_name(fence) -> drm_crtc_fence_get_driver_name()
  crtc = fence_to_crtc(fence); // Casts to the freed CRTC
  return crtc->dev->driver->name; // Use-after-free

...

Does the CRTC or DRM device need to be kept alive for the RCU grace
period, or should the fence hold a proper reference to prevent the
use-after-free when get_driver_name() and get_timeline_name() access
the freed CRTC structure?
=== snap ===

I believe this to be a correct observation and this patch implements
the suggestion of waiting for an RCU grace period before proceeding
with destruction of the drm_crtc, so that get_driver_name() and
get_timeline_name() can still work.

Link: https://sashiko.dev/#/patchset/20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org?part=1
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/gpu/drm/drm_crtc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 63ead8ba6756..d55f1377ec36 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -501,6 +501,12 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 
+	/* Ensure our dma_fence_ops remain valid for an RCU grace period after
+	 * the fence is signaled. This is necessary because our dma_fence_ops
+	 * dereference crtc->dev.
+	 */
+	synchronize_rcu();
+
 	/* Note that the crtc_list is considered to be static; should we
 	 * remove the drm_crtc at runtime we would have to decrement all
 	 * the indices on the drm_crtc after us in the crtc_list.

-- 
2.55.0.795.g602f6c329a-goog


