Return-Path: <linux-media+bounces-65547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xlLiN5fOO2rsdQgAu9opvQ
	(envelope-from <linux-media+bounces-65547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:33:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C06BE274
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=U7wh+rbJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65547-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65547-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B141303FAE1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC45738B7D6;
	Wed, 24 Jun 2026 12:29:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D513B1F94F
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304163; cv=none; b=Caqcp4ztVqMVjkYnaItbDYJJpX6d8oh1RpxvXnv1Nhu4/rBktac3KxsdMp6DKGLuAIDko1JVSqpIp6oVV0DCD7Q545xAPgUd+MGe2qCYzx7ZpA+X19RYyK7GANEBZbLp/6wUUfdW8OGBqgTNtAQlwyUvtbD4AdN3ijZnpHt66mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304163; c=relaxed/simple;
	bh=pFbStoNOnxZ8EusijrnYkbV2hWnyICFUOIVa9+YJMwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVan42736unC5kaPI1cCmp13QHDs5wO+D6htUzdfZnUN3k0HZIlVXZm4thITSev5c3ZF5BbKx5jMN49QPc7ZIeJQ0MbxEFRBQ5ofLnNG8+grzYy6afRHwxjLs5xn2aoq0CJD56pw2jFmy+QYpLnePuJlztAIjm0mjKGO1nPyZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7wh+rbJ; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so817980f8f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304160; x=1782908960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFbStoNOnxZ8EusijrnYkbV2hWnyICFUOIVa9+YJMwM=;
        b=U7wh+rbJLxJyVGe/+S78TPGMEoJst9R0pBWk4xfFuhzsp4rpbOE+ivVjc8bwT8rfDZ
         VZ402DfrOxADHq1Y4elxvGHXfbKlSxWR9dYb6b+qoGaNNzHG1uQLqUWf0VlZ/Do8InAB
         4B5CDI6pPPiquhNT6xaasQwU9ctB3iF50vk4t2A+mNizCIw5iayVA6wVuHV4fInsIXD7
         w7KXE698ab0ma6ENnwt6spfTSBB7kZHBH/jozDjJO1VhML5JPuHeKezg1BW3g8g/m2BF
         EUHKqHFhwQVSIytClQL6Ad5d4pUa2mUXqScn6MpnEY5ljMYOHNJfbnPKih4b+2kvpCbC
         2C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304160; x=1782908960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFbStoNOnxZ8EusijrnYkbV2hWnyICFUOIVa9+YJMwM=;
        b=IOns/lIUD3hMjCxrM5GTxYb3TnBZAnJ3N5CoMbZX1Ix9Yfug6laVT4VUYEvrod0Mit
         jhVTFl6Uam5Ap+871Zb2Isc9m/nca7+2Rl7K+KACgX7eFn+AmfBeGWByUbQC7YrvISuu
         +AR1tWr3L+wznyh5Fm/ZlFO7cdOODYBanhFhSx/7IDe3RArIvbWkSu0J3LQxpDe4T435
         PHuoaCVlfLpV33azG9pwC1FREYj0km/UPS/0GOSd16urfBrnvu4g5d8dl/rO9vcK80lG
         TCiWuvE9BVTIQ/xyngTTbq36a5ixZ8pJzDzZFqjpnC/cG01guY22FddPsx8J/1yfCRny
         vCRg==
X-Forwarded-Encrypted: i=1; AHgh+RpsFPuufZvgiiLa5OzsQRSQ26lO4OTJwWP612dLly04SlfGQpOhDyMiS3oV6C+fn4s7zz88vghVPtCtCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqG2AGYhR1/fMFsUqffUdJsECgGNkFZ4LKnNH+PQx+nvmGrxSZ
	KGNv7zKzeoCVOyE+XEm7yyuvgsj+oEK9qiOGS/RTh2ZZNB5wOa4dVopT
X-Gm-Gg: AfdE7cnoEVoa1ihuqJ+a+N6wR6v931cXxWJ8/OLK630pQ5H3ebhafXNm8/06X73WZVW
	1hIiswxzYdbyDyyPdftPAT0SIsN6VuWoGmSxZ/7B7LsXIwc5nPlC7jgBzj4UjDa80QOhi7yx8aV
	2tzRulIThU/Nn+x6ipTQzw1a14ScRgnq3QwT7eBOXVwTkhisaGw4wpQSt/DiYSabJa90lHYAcos
	9Or3UHtDkNLp+Wh1P74YOb7yg3MovxxG4mJZlN5aBwJI5fcstJKobyEXf9aBFIpIfM3+0Z4N+zb
	1weX9TbM5rRqgG0DbHDnoamL6vUp4N9YrSujWAuYZmNSFqZ6ekjY2BWJQutRed7c9NTLkp3zaxJ
	j/Mt2A/Q8qwrx6ERpZgJDx9Idxxk/5OLWF2ZPfKtV3i6xzrxabh7w2Ai4Q5WioM7DfNCO2x3Rib
	FMVh/7M3nGYrqiPN0+KJUJVPaHWg==
X-Received: by 2002:a05:6000:26d0:b0:45e:e44b:312b with SMTP id ffacd0b85a97d-46c09427c74mr5404079f8f.18.1782304159998;
        Wed, 24 Jun 2026 05:29:19 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:19 -0700 (PDT)
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
Subject: dma_fence cleanup/rework
Date: Wed, 24 Jun 2026 13:13:24 +0200
Message-ID: <20260624122917.2483-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.83 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-65547-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 556C06BE274

In a recent discussion with Philip and Danilo the question came up what
was already tried and never finished to cleanup the dma_fence framework.

So here are the different ideas I came with but never fully finished,
with the patches itself modernized and rebased on top of drm-misc-next.

The main goal of those changes is to make it easier to implement dma_fence
backends and don't enforce unnecessary constrains on implementations.

As first step the locking around the dma_fence_ops.signaled callback is
made consistent by removing the dma_fence_is_signaled_locked() function.

This was mostly used by backends itself, but if polling the HW is desired
the backends can call their own functions for this directly without going
through the dma-fence layer.

XE actually seems to be the only driver which make use of that for a bit
more handling. For all other cases testing the signaled flag should be enough.

Then forcefully calling dma_fence_signaled() is removed from the dma-fence
layer and moved into the backend implementations.

This allows the backend implementations to cleanup after they have
signaled the fence. Such cleanup can include removing now signaled fences
from lists, dropping references, starting work etc....

Especially nouveau seems to have some really messy workaround because of
that involving the DMA_FENCE_FLAG_USER_BITS and installing callbacks
because the reference to the context couldn't be dropped directly after
signaling. This can now be cleaned up as far as I can see.

In the long term this should also allow reworking the error handling, e.g.
removing dma_fence_set_error() and instead giving the error as mandatory
parameter to dma_fence_signal().

Then the last piece is dropping calling enable_signaling callback with the
dma_fence lock held. This makes it possible for backends to acquire locks
which are semantically ordered outside of the dma_fence lock.

This is necessary to allows using the dma_fence inline lock in more cases,
previously backends used some common external lock for their dma_fences to
for example make it possible remove fences from linked lists.

Please comment and review,
Christian.


