Return-Path: <linux-media+bounces-66159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fSxeA5K+RGpk0AoAu9opvQ
	(envelope-from <linux-media+bounces-66159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 09:15:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23B6EA8C1
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 09:15:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex.ru header.s=mail header.b=wxWfY9GO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66159-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66159-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=yandex.ru;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1ADF304E6DF
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 07:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC2D3B442F;
	Wed,  1 Jul 2026 07:14:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from forward205b.mail.yandex.net (forward205b.mail.yandex.net [178.154.239.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BF73B42C7;
	Wed,  1 Jul 2026 07:14:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890052; cv=none; b=If4z71+j2Rih/+2anTG4oTKBop1rzHkgHJ4qG+pdKxF/XbzM7dVeOvUHLC+mpMihpqDeXA2IK2AxQn+fHDcaHeWmwYoShm5e2Qhur4Q/U6svRFOcHicb3S9HtSQ/d+e1IT92vO8wLrhkry8j0aRh8jC+NqdDuLOTG4h26QZevx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890052; c=relaxed/simple;
	bh=R95S7oZ0TLTfSna4noC3sjwk2JQrExYIh0ldu29zQz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3D8wM/Q12UWjDs5LDjAwmVO0vfvP2znzvjtoa5NV4g/0mMwfkjuRM01QxnZ2r0jqXNBb8gArQUwra9E9/ztg93sfc1Hv+7JLtF3HOqOaJ9rBSkrWCjmUnnSCogDEEhVUgyYJWwhGEhMO/iWA1r7Uc8wuDm0Mm8ovIgsHCmD69s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=wxWfY9GO; arc=none smtp.client-ip=178.154.239.152
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d103])
	by forward205b.mail.yandex.net (postfix) with ESMTPS id 50770821F1;
	Wed, 01 Jul 2026 10:06:06 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:221f:0:640:b03f:0])
	by forward103b.mail.yandex.net (postfix) with ESMTPS id 5AA7AC00AF;
	Wed, 01 Jul 2026 10:05:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp) with ESMTPSA id u5ZXBD0dMuQ0-029dcTP5;
	Wed, 01 Jul 2026 10:05:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1782889557; bh=623+SyxJNrq/SwM4fNvWDIo8zRjLiExQEHmwxuKG8gU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=wxWfY9GODBnUo/CMWTsKZ+mZQQ8mfJAjwOwlOWF7R6+d+8kZ5jVfwEnJJbvqktgvv
	 zcYui9xhtiWGh7054O0a/DxhN+UPIuxj4A5t4Z0wrqWd8J6al3BTs0tm30LHYoxRdl
	 r+S0iPcv6uH6r2yeXeF5msIqYpB4t2h1oWnE/NMw=
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com
Subject: [PATCH RESEND] media: dvb-core: fix dvb device instance leak
Date: Wed,  1 Jul 2026 10:03:49 +0300
Message-ID: <20260701070349.2755931-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
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
	DMARC_POLICY_ALLOW(-0.50)[yandex.ru,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxtesting.org,yandex.ru,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66159-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:stable@vger.kernel.org,m:lvc-project@linuxtesting.org,m:dmantipov@yandex.ru,m:syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmantipov@yandex.ru,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmantipov@yandex.ru,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yandex.ru:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[yandex.ru];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,d37184d9d8cc34602616];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D23B6EA8C1

After 'replace_fops()' trick in 'dvb_device_open()', reference count
of the corresponding 'struct dvb_device' instance can't be managed in
a regular way (e.g. by using 'dvd_device_put()' in '.release' callback
of 'dvb_device_ops'). Since there is a race condition between
'dvb_dmxdev_release()' and 'dvb_demux_release()' (there is no way to
guarantee that the former always sees non-zero 'exit' flag maybe set
by the latter), an extra check for non-zero 'minor' field of 'struct
dvb_device' is used to ensure that the device has passed through
'dvb_register_device()', has reference count more or equal to 2 and
call to 'dvb_device_put()' from 'dvb_demux_release()' never actually
frees the device (with 'dvb_free_device()' called via 'kref_put()').

Reported-by: syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d37184d9d8cc34602616
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
This is a resend of https://lore.kernel.org/all/20260216154152.2597331-1-dmantipov@yandex.ru/T.
Since 6.12.x looks affected, cc: stable as well.
---
 drivers/media/dvb-core/dmxdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..c33490acba15 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1256,6 +1256,9 @@ static int dvb_demux_release(struct inode *inode, struct file *file)
 	} else
 		mutex_unlock(&dmxdev->mutex);
 
+	if (dmxdev->dvbdev->minor)
+		dvb_device_put(dmxdev->dvbdev);
+
 	return ret;
 }
 
-- 
2.54.0


