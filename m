Return-Path: <linux-media+bounces-49845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC183CEE801
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 13:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8945D3007C9F
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 12:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838EB30FC29;
	Fri,  2 Jan 2026 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="H1E0nrSJ"
X-Original-To: linux-media@vger.kernel.org
Received: from forward206d.mail.yandex.net (forward206d.mail.yandex.net [178.154.239.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5930F802
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356501; cv=none; b=BAzD0xJUaHX3u60xGYW//FQcbL0TBSRHzdpj+33ixB+DRQBJxE4KnD69GmkY4H9sgjgzOVF6+Lbp2NZsJtaTu2BNCDMgxvSPqMMm66ADw79nRNpCeZVFKdltyyPT1UjYh49EfDHnZXV3p/J/Ix1zTBzq+811PEO59u5K2rMT1OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356501; c=relaxed/simple;
	bh=dTPo/QC0iT/8R2X28UuJj4GTvI3bkp4x1yuIw56EVpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRa90+rXTa/T5PdIN2upKix+9F2BnOIVBIT3Lp9tCXECqT5K0Uq0z6ExkDPTe6XZteHTLT179bIfRldY/aDWlkY9SY1egfSojqlEb/q4l+1xul38v7jTgyZZlC3bJcrequw7+m677CWt+YGT+IWLbmeUSmW5a1eBGL/u9//igjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=H1E0nrSJ; arc=none smtp.client-ip=178.154.239.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward206d.mail.yandex.net (Yandex) with ESMTPS id 9E56782937
	for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 15:15:09 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:9407:0:640:8fbc:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id DFE5AC007E;
	Fri, 02 Jan 2026 15:15:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xEkcCVwGKuQ0-1jxe5k7p;
	Fri, 02 Jan 2026 15:15:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1767356101; bh=acCA7W/vKU/bP419fyeHhZhdjGASZCo71lBQ0UKX3BU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=H1E0nrSJ6o7gb+BKazvheOEmMWM0dPocv7OEzADmAOUjjCKb0bkoYFfUj8FF7r8Gr
	 doqg+evl+SsGqzboJhS+b9yaReIcx/dm/wR49cOCT0pfDyCLz0RZSsWctmwvcp9jUl
	 fx8R9fVtMndtPKjdMBmqIp1+BiHwR56++0skO7X0=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+2bf29e42be0666f2df70@syzkaller.appspotmail.com,
	syzbot+37fd81fa4305a9eadfb0@syzkaller.appspotmail.com
Subject: [PATCH] media: media-request: fix race between media_request_alloc() and media_request_close()
Date: Fri,  2 Jan 2026 15:14:10 +0300
Message-ID: <20260102121410.710456-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot has hit (seems twice at least) the following race condition between
'media_request_alloc()' and 'media_request_close()':

Thread 0:                                       Thread 1:
...
media_request_alloc(...)
...
  req = kzalloc(...)
  ...
  fd_prepare_file(fdf)->private_data = req; [1] ...
  ...                                           media_request_close(...)
  snprintf(req->debug_str, ...)                   media_request_put(req)
  ...

After [1], an instance of 'struct media_request' is available for
'media_request_close()' via the filesystem interface, so 'snprintf()'
in thread 0 may be issued for a free-in-progress request. Fix this
by managing an extra reference for that request in 'media_request_alloc()'
by using 'media_request_get()' and 'media_request_put()' in the former.

Reported-by: syzbot+2bf29e42be0666f2df70@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2bf29e42be0666f2df70
Reported-by: syzbot+37fd81fa4305a9eadfb0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=37fd81fa4305a9eadfb0
Fixes: 10905d70d788 ("media: media-request: implement media requests")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/mc/mc-request.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 2ac9ac0a740b..969051c1f07c 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -282,7 +282,7 @@ EXPORT_SYMBOL_GPL(media_request_get_by_fd);
 int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 {
 	struct media_request *req;
-	int ret;
+	int ret = 0;
 
 	/* Either both are NULL or both are non-NULL */
 	if (WARN_ON(!mdev->ops->req_alloc ^ !mdev->ops->req_free))
@@ -305,12 +305,13 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 	req->updating_count = 0;
 	req->access_count = 0;
 
+	media_request_get(req);
 	FD_PREPARE(fdf, O_CLOEXEC,
 		   anon_inode_getfile("request", &request_fops, NULL,
 				      O_CLOEXEC));
 	if (fdf.err) {
 		ret = fdf.err;
-		goto err_free_req;
+		goto out;
 	}
 
 	fd_prepare_file(fdf)->private_data = req;
@@ -321,14 +322,8 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 		 atomic_inc_return(&mdev->request_id), *alloc_fd);
 	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
 
-	return 0;
-
-err_free_req:
-	if (mdev->ops->req_free)
-		mdev->ops->req_free(req);
-	else
-		kfree(req);
-
+out:
+	media_request_put(req);
 	return ret;
 }
 
-- 
2.52.0


