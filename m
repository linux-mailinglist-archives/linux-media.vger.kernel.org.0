Return-Path: <linux-media+bounces-51752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L/DC6RAemmr4wEAu9opvQ
	(envelope-from <linux-media+bounces-51752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 18:00:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7013A673D
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 18:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9F7F3004DE0
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 17:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25CB64;
	Wed, 28 Jan 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlSVzhLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA1A2FF679
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619613; cv=none; b=UCi0ZP2AW0D7nNL6EzUAP14LB4qg3zbJFs6KF2nPIIz7lGEiYCetmvn+fIT95E3vYRAoNx7J70mu9aqO+ljfJcsaOCfWTgK/i/SKZINTNfmo8dB1PCoqFrvMhTK9JIuXQZYP4yjSWk/y2VLv2ctgI5/jn6uC2JjHzl6Zz6MAHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619613; c=relaxed/simple;
	bh=CNRPhu53QxXcdG6SjRDofGKa9r9A3ndm26+G+UlldpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRQU01RKDLCW6eFFEERtkYp8SuPPTNjjrnHWmeiiV8l9ygVZAl9Z9xksoFkVdZQ/RizIDn20A9La1uHu8PIC+00NSiGFJjV077nCxTEP3d/zxyUx6r1ZaOz6dJzNsjgQxgYQJNaTThH2fqn9O6xykFhA+6Zk0lao1g4r5s7Zm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlSVzhLt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so8713465e9.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769619610; x=1770224410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBQss1jJFU5a4CFP0vqS7yMKyxU2b/P3/2L9s6yVfrw=;
        b=AlSVzhLti+f3J4UBX58Hh9FsyrbsSLXbUjDFXYExwWQpLaVEtvlK55AgToqQfEBaCm
         ypWUfabnn3aiPq+QBY2empA4lDqyVP76jtyjm7l/dSm3VSRMu2Dj5yp5+57vbU34zWQg
         +ZKtfvP45R5/GleKjE4kI757WeXyGCDZ1iMSmrup+aUjMF859BUSXAaAh8PrRC+AqBtt
         cjg6PjUvt1eE/qCBzDa7XS3z6fSQoVi9iE6ZdL8hctNYmNrJVKzZC3vza/ipfnhJ0hEu
         GGRn5zqVh4fJEmklc4eUn5prU0iJrkg5DpEX20E+jz++W8Cq//gDmNXvX9Hq6ETkcB3f
         BEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619610; x=1770224410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBQss1jJFU5a4CFP0vqS7yMKyxU2b/P3/2L9s6yVfrw=;
        b=gp33inNjw+0TJlwGIiG/Q4uWZoq6brEXqRN+fuKsFwSPShiKDslvTzXHTPaKIUlIXi
         KIJhj3j5yUL9hhlAl6PcAsUY0/apR6btyURs9/J6ktx5/RC+RQZ/fvj+SS6kRyHiq1RU
         5+25ojcxXXqqIcOT4u2XwGCneAsjmGUhbncNCW+/ulUD2pziUAbiczxtU3pGETGDIJGK
         f+Vzv1EyXrfcs0fEkmdjp6bKQ4u6UXmxZGU0lCfdqUUkeUMgD8NJXBLYOKzFqCXhX0Yf
         lmp85iJs50jTDs1tWmgPGTZhxghQDNUivMb9RncnTl+DIvzMIUbig3ZGmbEC/Qf2UOIZ
         9+UA==
X-Gm-Message-State: AOJu0YxZTHbOu/s8ll8eZxVkccIN3QkM8fgGlElEgvmVCB4ZWcvgG6Sw
	+XHc1ShLChdc9/E+7lIHa5Y7TrVakXwuN1XS6SujTxhzSO9PHkxp4BAv
X-Gm-Gg: AZuq6aJ+h4HeLgmU+WbaFSZ8gSNpZeNvo5EYD7HvSXwuCdnDNZgmfgw2m225qHXS64R
	4ck6+MldKfHE6SeWHsmhJ11LDcTlwMi0NNtjOdfOJsCYfC/rR3j2HUqaFo5RPAzG5++q4rNFhsf
	tVJYTDOLbU9/01q6odU9iwDOSpiEA6mrneYAUwTIcq7VkdZFJu7fJ0dh5l8yn/rd6Txe1yrtKeJ
	VvvLICdN4EGR22HHN8k7uD8FMsvKDhp+rgxaZT9s9RGVFi9iG6b8Na9DdNOQLBlPBtpctfh9u1I
	pUmmUMGZHKFYNVnrEUiTkzYVUdiaMPZ+luAgJtTmsYrYX+7qPYhA/sNROMH3KneAsARZFiSgL/D
	5+pNh+qdCJ+Is9KEciuZUAG6aZEYsXTDdDwZcJR+iBsoxUShePid0juaHtDi0OVz7nrCOn0csmy
	2Gd9Ii0qZM
X-Received: by 2002:a05:600c:3b85:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-480829b8e0amr1241075e9.16.1769619608142;
        Wed, 28 Jan 2026 09:00:08 -0800 (PST)
Received: from TTPP ([31.176.186.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm71964775e9.8.2026.01.28.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:00:07 -0800 (PST)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: fix function argument alignment
Date: Wed, 28 Jan 2026 17:58:46 +0100
Message-ID: <20260128165846.20375-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
References: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51752-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[omereidrissi@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7013A673D
X-Rspamd-Action: no action

Fix alignment of function arguments to match kernel coding
style as reported by checkpatch.pl

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/media/ipu3/ipu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index bdf5a457752b..84c4d0bf027d 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 
 /* May be called from atomic context */
 static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
-						   int queue, unsigned int pipe)
+						  int queue, unsigned int pipe)
 {
 	unsigned int i;
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
-- 
2.51.0


