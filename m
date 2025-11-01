Return-Path: <linux-media+bounces-46113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4FC27A91
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 10:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2A43B17FC
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 09:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98ED2BDC34;
	Sat,  1 Nov 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="cEv/Z6bI"
X-Original-To: linux-media@vger.kernel.org
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D228AAEE
	for <linux-media@vger.kernel.org>; Sat,  1 Nov 2025 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761988100; cv=none; b=iNk/fK5XXIeU893yKz7nM5My3sgOTZ8V9SCX68SO3Fq9JplXtpMl44/5qhysc1Nv7UY1rnYSO37rHTPkm5IgN4yNurSs26qMkwJsyH62VIe0YFLuznpbFt7Z4svvlAJJVF7bW8qOTL++IG7k5B38sHPeIcS+zq4iI0B5kbCTY6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761988100; c=relaxed/simple;
	bh=P3mBCqy94ZK7bwKdDnqbLkVFf+D+y6ZvA9BvmTAkj88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f5RSunkWOZxm07VxmyGOB+pkNJeKV51SN7egPltkE2bIi2ul/Z2AmfgoiHI6Gh+EtYMuZojqKhwvJNk477jac7cuL05BWw5mzWAqxNSDQ1s48lwK/wqf4KeTcfTgV2dWzFv0O6jZIeLZCgbz5DbY5bi0JhKv/TGKRQ9ZDGx0ZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=cEv/Z6bI; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:9a4b:0:640:e388:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 1EE34C0014;
	Sat, 01 Nov 2025 12:08:14 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id C8db7bcL5eA0-A1VoVnBR;
	Sat, 01 Nov 2025 12:08:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1761988093; bh=bhZwJ0qwSBl80v4k6aEDKmoRmZVPoNAtNoQ9qbNAjiI=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=cEv/Z6bIfS32oudl8fcXk6AfYVH64ygiKQMYHTZ9FENm6CaQRZ/cukjlkVm9JYKlI
	 gPrL92UzDIMCuKwT9q7pkea5CQl6hoUt0W7wOWdqc1uJPt6f7fl75BoF1CLH/c/jQD
	 FhiquaWTobanYR0qM4fZmtO6+3ZlVRfxS/eVMJwE=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] media: v4l2-core: simplify v4l2_m2m_register_entity()
Date: Sat,  1 Nov 2025 12:08:00 +0300
Message-ID: <20251101090800.394984-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid 'strlen()'/'kmalloc()'/'snprintf()' sequence by using
the convenient 'kasprintf()' in 'v4l2_m2m_register_entity()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 21acd9bc8607..704121c321b1 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1040,8 +1040,6 @@ static int v4l2_m2m_register_entity(struct media_device *mdev,
 {
 	struct media_entity *entity;
 	struct media_pad *pads;
-	char *name;
-	unsigned int len;
 	int num_pads;
 	int ret;
 
@@ -1074,12 +1072,10 @@ static int v4l2_m2m_register_entity(struct media_device *mdev,
 		entity->info.dev.major = VIDEO_MAJOR;
 		entity->info.dev.minor = vdev->minor;
 	}
-	len = strlen(vdev->name) + 2 + strlen(m2m_entity_name[type]);
-	name = kmalloc(len, GFP_KERNEL);
-	if (!name)
+	entity->name = kasprintf(GFP_KERNEL, "%s-%s", vdev->name,
+				 m2m_entity_name[type]);
+	if (!entity->name)
 		return -ENOMEM;
-	snprintf(name, len, "%s-%s", vdev->name, m2m_entity_name[type]);
-	entity->name = name;
 	entity->function = function;
 
 	ret = media_entity_pads_init(entity, num_pads, pads);
-- 
2.51.0


