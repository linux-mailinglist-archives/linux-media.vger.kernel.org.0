Return-Path: <linux-media+bounces-67577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9iV3MVlWVmqC3gAAu9opvQ
	(envelope-from <linux-media+bounces-67577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 17:31:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5551756766
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 17:31:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=m6uRfOwM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67577-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67577-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03C5130AD335
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4B14C8FEA;
	Tue, 14 Jul 2026 15:17:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C64BC032
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 15:17:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042233; cv=none; b=NMo4H2XfN0IGw/ylO7lAfISJADcxAJjx1IAahHK+gTnGDeTxyFm9RiYJUESG0QhcXjEw6SOWGS2ZpwCPNXlwVX5dEccErzdBwSUgzzlol/2nWjRuKw5GuziJ1X97k+izjLApzHK+Tv7NLXzoodvuOjhgt5mIJ4SGE8h9z5Yr7Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042233; c=relaxed/simple;
	bh=qvhInT/SgcuGyP/ork55nnSJpC2mxeW1HjGP20C6WSM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YFm/2fIbIPgVKVE+3msReEAyw0HZVRONJ7yXKX+pov1hQ8H5AzJmalfP/aY6eqXyvTkYJS17HqhR6V+N96HoFTrI9InW29wAvWzjX574MkaT02Pr9NEik6qg/6LsrapNPhLZ3ZLrFup6vM0v5myIj8iIvnyLQif7JELYpIy5NyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6uRfOwM; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381891a9525so4803331a91.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784042231; x=1784647031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=joYU7SNNWgacv3mwvw+01Lka//SvlR+4VPR0uOgRcXA=;
        b=m6uRfOwMwwqO6OqQ1QAXW3oNIeNE7f8ckkX4ncMbFIpNzHMJPc7jnLzTX7oK7ArYqq
         tWqPRM74fokn+3JKrsEhf13xmau7vu8LF/hMS903BV+CLxpgkKQ8VYQnl9fpOl23vO1B
         RT7LrOtFB26+hmxXEl4fs+Q94IWeHG9UVdhtCbC1W7PnyQ3kNbUZp+PK8ETHLvyXDYD1
         BqBNyOV8Fl30uya4ncCfjRNG0W1z/jo6yxLIL7hLuOtU+2sYWfR1U5dV+BmJOLQkD5En
         9PKjnT+H/6hquJsRS0j2xmtjnfC0uBIgadlvq4b8KaYgIkbGcZPqbE9RoD9RLwTAchma
         PgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042231; x=1784647031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=joYU7SNNWgacv3mwvw+01Lka//SvlR+4VPR0uOgRcXA=;
        b=dRrQjHwKCf/qWQhd9M0w++QGNQUFYaVeWC92Wtrv5t3P2Mo68TwVbS+FR1X4HYVseJ
         hT5bnnImKQiBCSbRENvRue+8dr8G1Wy6QLBmUxAeFsENk5zVXdQFZyoVwdpkOyOe/9sr
         3yz+3GjOKISdZN7gkj+59VOBq3SScsor2HcxM/+MMHjNQXys8Lglp2+OlCdvDd4IUUoM
         gdXaPhuAA9PrnNI4yQWL3ElQFSR7li+MQCUoQPIA8EWEwu1KAav3FkQS9colHkAK0gGZ
         WiFJSQcsp6htWIIoMDeZzVmacY/yhMhwKdEpVa16EmGRREmwYvNpj+kpX0FnLuVxYmmN
         41ag==
X-Forwarded-Encrypted: i=1; AHgh+RpnUaWq+xAM9SHgRZZxIKquZQgnb47LMmhaf3cmcS/gPcCmPYq5m2WkAayKSSWO6dwj0R3L5VCOm4xvOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPXcR6PdJl+M+/gqGXnSvvfnJVbdUScUdU5hKTxXQ4LBSyJMl
	owtbFpexOQLlYM0hGwEFoT+mUiifLjqMk1x9VomuBo2CBP5udtzlI1yZ
X-Gm-Gg: AfdE7cnchEru7gK8ArY6nA6/p9nQjGDXAeBTqfEwe8u6HOIl044tXLiS2Nd19d2aUU6
	MqjYsottfaxJjSoCJOR9UH0aHqqhHSrc9rNfNbSCNF21cQZgZxwxofSuV3fAEbPM9wlSZ7pwiAg
	XxGWiNIim7ypClxJThrmSOV/KzKfzeiQ/xIxHuNehQJNvfBbFUu3Kyd8VJLq2oBiMVK36qrtlao
	nRj3L7spPSfqdMoFrJGI9GNLeBmEUvsNE5AkIcEXFH0gOH3LSY++WJa/AUTBbkU+12l9oqEWIw+
	9x6k4thAHa6jn7Mlke/MZjnc0fUFQ8pCnCHfAHkt9kiS0jDO9hTXodplaKRHK1SPYm7aG+FFkKU
	gxIkEZt5pVdo06ZKdhY/ins7bZFCG5KJXvqqBTyGXa760HWV31TB0ZVDDZjrKg2Q3IQeV3ccrnf
	YdGndh04uAVulbRxP86SDm
X-Received: by 2002:a17:90b:5830:b0:387:e0bb:57f7 with SMTP id 98e67ed59e1d1-38e1af72937mr2984017a91.40.1784042231006;
        Tue, 14 Jul 2026 08:17:11 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d305ce5d1sm3935600a91.2.2026.07.14.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:17:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: usbtv: Fix V4L2 refcount leak on probe failure
Date: Tue, 14 Jul 2026 23:16:48 +0800
Message-ID: <20260714151648.1724134-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67577-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:johan@kernel.org,m:hverkuil+cisco@kernel.org,m:lgs201920130244@gmail.com,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5551756766

usbtv_probe() allocates usbtv before usbtv_video_init() registers its
embedded v4l2_device. v4l2_device_register() initializes the reference
count to one, with usbtv_release() providing the final cleanup.

If video_register_device() fails, usbtv_video_init() unregisters the
V4L2 device and returns an error without dropping the initial
v4l2_device reference. The probe error path then calls kfree() on usbtv
directly, leaving the reference stranded and bypassing
usbtv_release().

Leave the initialized V4L2 device intact on this failure path. After
releasing the USB reference, call v4l2_device_put() so the final
reference invokes usbtv_release(). Retain the direct kfree() path for
failures that occur before v4l2_device_register().

This issue was found by a static analysis tool I am developing.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-core.c  | 5 ++++-
 drivers/media/usb/usbtv/usbtv-video.c | 4 +---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index 6c4facf4f41a..4f10f6613bc4 100644
--- a/drivers/media/usb/usbtv/usbtv-core.c
+++ b/drivers/media/usb/usbtv/usbtv-core.c
@@ -119,7 +119,10 @@ static int usbtv_probe(struct usb_interface *intf,
 
 usbtv_video_fail:
 	usb_set_intfdata(intf, NULL);
-	kfree(usbtv);
+	if (usbtv->v4l2_dev.dev)
+		v4l2_device_put(&usbtv->v4l2_dev);
+	else
+		kfree(usbtv);
 
 	return ret;
 }
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index de0328100a60..92bc7a2509c3 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -949,13 +949,11 @@ int usbtv_video_init(struct usbtv *usbtv)
 	ret = video_register_device(&usbtv->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_warn(usbtv->dev, "Could not register video device\n");
-		goto vdev_fail;
+		return ret;
 	}
 
 	return 0;
 
-vdev_fail:
-	v4l2_device_unregister(&usbtv->v4l2_dev);
 v4l2_fail:
 ctrl_fail:
 	v4l2_ctrl_handler_free(&usbtv->ctrl);
-- 
2.43.0


