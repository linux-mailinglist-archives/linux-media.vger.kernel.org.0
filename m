Return-Path: <linux-media+bounces-66598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n1V4KDpJSWok0AAAu9opvQ
	(envelope-from <linux-media+bounces-66598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:56:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0370823C
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BD14PH+x;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66598-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66598-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64EA9303ADEC
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A42374E64;
	Sat,  4 Jul 2026 17:54:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9737206B
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 17:54:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187648; cv=none; b=A5JcAkf3rTDEoXBMzSTvJJ9f+wTA4qm73mr9KaEjg4BpLbv8hPaiQXO8sTLTPbWKT8YWzu1tE3qNpDyu5tiVtIzIMczeLNIqA80fTcM66ZzjUGruj666mWObwlOXmMBmwie8HhjGuZHQ7OWLGq6ewcIIII5cBk53jwU0JKKjY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187648; c=relaxed/simple;
	bh=IleNu9kVSuAJm7Q5Fpv6O/DqKf3UI+pPZj/WHMAwnlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzNHyr0F927VhsvKmRQ4Kk8InxArMF+mlZgG21U32RV/iP+dkU2K6AP4Silg6SeuVxdXnO030dOQZo/gdfds74+34oM+Blgaj6XGardwBYuXXHDdZcylA74bBGWImWL94gHNp9lLunPRdPGagKgX0w/BeRB4pxMbISDEXcjOWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD14PH+x; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1477596a91.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187647; x=1783792447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AbjPfAmyYbFJAi2zj/YWEJaXgs7wZq4d5KSovlCSmw=;
        b=BD14PH+xwb9tHPqiIEa+RKqn+ALMKxF5q/jBA2ikj8YGgo4k5JrcoHNZJClnRuRVYy
         CuBSdKsLahY+oHwf7ojaBb0+BkcX8yBy+nHV1o+6MGptxVnDK77e6LMXFQcSN4k6iAiG
         FBDr8mIeqiKXn3PfKnXtKDhx6u4uVqawehLAcb6D5lKLYjAixgRiBml7c2eY5ZFXHOW5
         QAPbj88/bE+qvk+p+zcVuJP987WNaqM7iowiaXWwY6EEi325iSQd4r3NGTZ4V5jMqBmy
         c/VGO6ERaZ39gxA/GBc0gbzzyNoTh7BcbC9+fzpU0yP0MNfMlja/6bwZD4dQqEoE4u4d
         xTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187647; x=1783792447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5AbjPfAmyYbFJAi2zj/YWEJaXgs7wZq4d5KSovlCSmw=;
        b=e9tEUKIngovZszmjWI4dZdal8EjUXgkNlK9s9yOXqxf4fXdycY8/ABe4dSzJ5MexBM
         8I/w+TPYivECs+UVW3IEM7jc2dMcHqrvmaDKoCZLbjZi/kzkkpFeBAU/Eb/QoLuQ19P3
         bokwGVd3K6rRnp7KpwcStXEtEJ6k+a3XwwhIZGdy3KVwGg2FQ9HgQbmTajQCz6dchjfX
         ygAGJWaXsgmjJ0eXLXXL2XrQhyS0u66izChxdVFyVpFSVRlPkeNeZb9TgMUXX0R1YjFD
         BDvmx8nAwQgpD8PXfHLDohe1JqGjDz2WImifrAKEKPS4CNH7lKiOieGLJ84fgy/tQjom
         ZgKw==
X-Gm-Message-State: AOJu0Yw7DlXyGOLFgFaI4hlbw1H2HaGllr9BxOB3ibiM5q4p3G2YEhAt
	zjnbhaW9PaWlCQJPn7i+fz659Es7nlWQKtGz3fn5oIbxtoH0ChNNVZ96GNGK/O3g
X-Gm-Gg: AfdE7cnJxDxaBOnUMqCpmN/eE5Qo5s0mnuJHjxhmwGzJSfcNrSvA+v9syl88iGRkorV
	j78cHAH/wfUZ8UA1CCnmgqClzQecAnuTQcQ+zz9UZKqvqdKpoMTS8TR2+ydwX7Qd95NniAdgCku
	Smuaglx5/wSGpVuf3aVp2McqiWX+3k0V3sAbi5N8lXSDWz7maYpLuzStij3qxNoNlzDUq09/w8q
	+NPWzh+KS3IUghEYbOuwjBVYiOSXB6n8Ny6sSkbpbyZpqI9TzA8sNDVQeCxhEK9SuNjqJTAqYN9
	jqtnSrkmrR6t6dWOWHMH5Z9kBvuz/DQeTgjuNoum84a/XiZ+KHUUPD/Y+TO7xRUvABOaxL2ev1j
	T2kUhZi2SH7OBoyh6u/rZ4sT0gzEsfkTJqHhFQCFM8kRyn6GBmwpV4DkVO7uPrC6lnh66uH+/Jb
	tnyAmj7Gupb5NR1P5uu7TSdhi/huNQIuyUFk2i5sbarGk=
X-Received: by 2002:a17:90b:184e:b0:37f:9cdf:f0ad with SMTP id 98e67ed59e1d1-3829f9e3ecamr3875517a91.28.1783187647012;
        Sat, 04 Jul 2026 10:54:07 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.54.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:54:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:43 +0530
Message-ID: <20260704174638.66302-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704174638.66302-6-birenpandya@gmail.com>
References: <20260704174638.66302-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66598-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0A0370823C

The remove function fails to call media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() call in rzg2l_cru_remove().
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..84d4883e2fe7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)


