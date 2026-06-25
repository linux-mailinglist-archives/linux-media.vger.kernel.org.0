Return-Path: <linux-media+bounces-65625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vDOiNPDtPGo4uggAu9opvQ
	(envelope-from <linux-media+bounces-65625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:59:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D56C4051
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:59:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Pla0pJCR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65625-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65625-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FAEE304568D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BAA388876;
	Thu, 25 Jun 2026 08:57:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D669379EE8
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 08:57:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377870; cv=none; b=YGu5IBL3UJxKi260kxPVyRrZnJsAOkO7ZPTmdH4EjKnvE47iM1laqv1vi3u1SCGtVl/AN1jX1cw9Ypg/ELynKJtjD3jrnus7ElQ5BFiT52M+q+C8I2nkH4HxT4qp2xppkJ94u3kXyEV+wM+tODoVV4qm4bnFZOALkwU5aDVojZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377870; c=relaxed/simple;
	bh=JkIeH8G3UDsIunXCm6he5FJmTCacmkG7UZWOLNyDQjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WP8xT2hV9fADqt1GJV4SFVoLoguV94wHY8fD5fVN+Cwh6IT14uSgT/ehSnBZJeGm2TucfJ4qDpUzXHE2guN9iVeFN6MMfQIl9GsCz4wQe8MzNc64QbiIGQeQ8M18VurIRS5HI0/g6PsxQN9j77ASMFXviC4/ggPPpLBfG/nYrV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pla0pJCR; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso12421785e9.2
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377868; x=1782982668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7mK938UvamZb4f9XlJ0eXBktak5gapPH+AoT8mY1/M=;
        b=Pla0pJCRWGHA+VqBHhTjXQf7yxkY33iT+6WOYcW5SdxCJ0qykyeXPLDYptL+ZyfeRE
         h5kN+/Lyt6OUdL1wAIT9w39P0bvW+/LIU4FeUGl9cuJ0w7q6GS1YND1vuUqkOP91luFo
         gmBK2vImqIZg0Tv6Zg/dr1o/T/SoKspQz99hNdb3F8aewudUZf9cAkWvga+VIM4CI4Ao
         PtZc7xyJkFrg5G9tH/ks2NAaL8NLgceTi1zzJplBTsVna3rUEhrmW0FbHcaCX1HCc2Kq
         +wWBWUtjkoF5wgN/t1pJ6LQ4YHZ5hLNWFm6v41BqG05U5JOFdE2OLTdC9FXVq4azn3iI
         af6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377868; x=1782982668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7mK938UvamZb4f9XlJ0eXBktak5gapPH+AoT8mY1/M=;
        b=MBjcr7SzvSdNlfleE0g9XdWbCX8zz3ETU3qmpORMry8uaeHCRJqv7w8TqY9VSGkS1p
         odeujGnaRFj40eKa0KHjuL59MBd/fWU3IyIgt7Yntjmpd6yxffJOuWAfNI4WnOY0BSga
         APWOvum9mg6u91uT6NJm9b0JXag6o3ZiEZ04xDVCZBbJFLxHUbhL9Noz9EnCnDq3XizF
         7LdqU/t+to/DF4TgYIJbtk1xf6lYFUS6HfnuiEGC9aJhc5uImynUK8utpVaCc8JdHaaS
         +bVdU2h66Gpx8A5IWpgglWojMUqw3GbZGJtXQADiH2XvVPKcAzBTNxiyRNyM0nIbCkyF
         qeyA==
X-Forwarded-Encrypted: i=1; AFNElJ+z5a+2m707VfyhzNuRpWgq1wwS0ikJDgzoBQF+BREakmiE6BILnajotJCZR57EnWHV3kfcuvUIREvJTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylGT9rBiCMk3KifwtvLurNyVC8XD/Vv1PyidPWBYypM496tU8z
	Vg18GQMI3/YHNKUHZ3Nvx6AV1IkG+Lcii9247dZO1/QhX1LdT4/NahEi
X-Gm-Gg: AfdE7cn4XC6t2MPSRbJBbwQdsGs3L20TGmZZhhbOcTqb8Lqytk9oOW4wT5zATS0Od2h
	crWOXhxw+Xu929JTNvGxI9DKNRLrvAPGblnI5kMwZ80mERfLZA9ihoUb6b22TVrY0HS+KDdh2me
	N33gPNJA5DiOIBwkvRvWxdHCEweVyNbBCNL9OC+Gzj9pOMeEQZzbffCOhwRIepJbaheOBfx15l2
	3WWG4WLGM5K8mdJCVagUgg4MtXg77uts6OUWW6YP+ZC6iT3bVUSBM61XFnOc3OWzh8YBvmZJ+00
	yRb31TZiWRPfH/OrDt6txACFKZ9zBG8fIiiJFZzhLLzm/qvQiUe7aXAt6hXG4IBewfolztUtEdu
	acCIv7L3pENqZrx1a16wiWftF+ra4MXqJSkg28ehqtMRNei9MIPMyLq4uqHbirzHbwgFsFm+HSU
	0906wgqSDRujTJNAPXMsVVT2FimQ==
X-Received: by 2002:a05:600c:a12:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-492668ad891mr20377325e9.30.1782377867583;
        Thu, 25 Jun 2026 01:57:47 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926541e03asm40015555e9.2.2026.06.25.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:57:47 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] dma-buf: udmabuf: make list limit unsigned
Date: Thu, 25 Jun 2026 10:57:35 +0200
Message-ID: <20260625085735.4488-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65625-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F4D56C4051

UDMABUF_CREATE_LIST uses list_limit only as an upper bound for the
unsigned entry count supplied by userspace. Negative values have no
useful meaning and complicate the bounds check.

Make the module parameter unsigned and keep the checked array copy so
large counts cannot wrap the allocation size before udmabuf_create()
walks the copied list.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/dma-buf/udmabuf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index b4078ec84..620113df3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -16,8 +16,8 @@
 #include <linux/vmalloc.h>
 #include <linux/iosys-map.h>
 
-static int list_limit = 1024;
-module_param(list_limit, int, 0644);
+static uint list_limit = 1024;
+module_param(list_limit, uint, 0644);
 MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
 
 static int size_limit_mb = 64;
@@ -469,12 +469,10 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
 	int ret = -EINVAL;
-	int limit;
 
 	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
 		return -EFAULT;
-	limit = READ_ONCE(list_limit);
-	if (!head.count || limit <= 0 || head.count > limit)
+	if (!head.count || head.count > READ_ONCE(list_limit))
 		return -EINVAL;
 	list = memdup_array_user((void __user *)(arg + sizeof(head)),
 				 head.count, sizeof(*list));
-- 
2.54.0


