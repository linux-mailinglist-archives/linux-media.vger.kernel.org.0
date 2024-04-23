Return-Path: <linux-media+bounces-9956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBA8AF734
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 21:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72EE2823F8
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 19:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3582F140368;
	Tue, 23 Apr 2024 19:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="bzDQ0x6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from forward204c.mail.yandex.net (forward204c.mail.yandex.net [178.154.239.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7313FD9E
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900093; cv=none; b=nSvWPj5gabUylVNwWmLUSOldIF2X6SLDQGXYstXSryJg/Z0VSCnPYM9Mx0AB62vIq7Or7NIbtFIkjaE7iX30sbBXwrD9jKsBvhdfCPmzXTUc4uurIqV3gqj/hOGGVR1hfCVr5PpTuFvctWRIQ9kOiMOIjNkSotaBn05GA1jLIfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900093; c=relaxed/simple;
	bh=kjvhhljX2lPQ078qSyN97XGReivHZEDzVYujybo01GU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uyo4CrzgFPLmW/KeK7G/c9mAQP6H3JTmj1VLRZFVbRMiPQmDQ6g5l7O+BZN+cELJ9TBKs7umZAq8/5qMqLflEaJD4ozCFrw6lU0c/iQMejYz+DeUMQxA0LMHa5rmbp6f/W+Fb6k3ASyDuBLYygczYXN6qBUl/Lz4WXuX2N1Fy/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=bzDQ0x6Z; arc=none smtp.client-ip=178.154.239.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward103c.mail.yandex.net (forward103c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d103])
	by forward204c.mail.yandex.net (Yandex) with ESMTPS id 05F5561AA8
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 22:13:46 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:1699:0:640:fad2:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTPS id 1AE3C608F2;
	Tue, 23 Apr 2024 22:13:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id aDQ1Y2KV04Y0-2XDCZw09;
	Tue, 23 Apr 2024 22:13:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1713899617; bh=m8rHljVzEMT49ON9+udmCkXCxIYBV78xM53MloEwSVg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=bzDQ0x6ZF12N0ud7Slsp9GrH9ITSqPAo2r2k+XXWXExf++djG65wpSwIgDjo1w6zy
	 jACK33lfOLEIeG2SSK7GTiRGaClpZRgLCwNs2KzvmHTobV8vdVmCEtFGdg+rW03be4
	 /88zq9IR+dyqpHpxNc03SGG6eo+Q5QXcDZFKdOfU=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
Subject: [PATCH] [RFC] dma-buf: fix race condition between poll and close
Date: Tue, 23 Apr 2024 22:13:10 +0300
Message-ID: <20240423191310.19437-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot has found the race condition where 'fput()' is in progress
when 'dma_buf_poll()' makes an attempt to hold the 'struct file'
with zero 'f_count'. So use explicit 'atomic_long_inc_not_zero()'
to detect such a case and cancel an undergoing poll activity with
EPOLLERR.

Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d4cb6b4409edfd18646
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/dma-buf/dma-buf.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..39eb75d23219 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -266,8 +266,17 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLOUT) {
-			/* Paired with fput in dma_buf_poll_cb */
-			get_file(dmabuf->file);
+			/*
+			 * Catch the case when fput() is in progress
+			 * (e.g. due to close() from another thread).
+			 * Otherwise the paired fput() will be issued
+			 * from dma_buf_poll_cb().
+			 */
+			if (unlikely(!atomic_long_inc_not_zero(&file->f_count))) {
+				events = EPOLLERR;
+				dcb->active = 0;
+				goto out;
+			}
 
 			if (!dma_buf_poll_add_cb(resv, true, dcb))
 				/* No callback queued, wake up any other waiters */
@@ -289,8 +298,12 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLIN) {
-			/* Paired with fput in dma_buf_poll_cb */
-			get_file(dmabuf->file);
+			/* See above */
+			if (unlikely(!atomic_long_inc_not_zero(&file->f_count))) {
+				events = EPOLLERR;
+				dcb->active = 0;
+				goto out;
+			}
 
 			if (!dma_buf_poll_add_cb(resv, false, dcb))
 				/* No callback queued, wake up any other waiters */
@@ -299,7 +312,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 				events &= ~EPOLLIN;
 		}
 	}
-
+out:
 	dma_resv_unlock(resv);
 	return events;
 }
-- 
2.44.0


