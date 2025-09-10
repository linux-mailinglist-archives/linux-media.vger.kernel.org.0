Return-Path: <linux-media+bounces-42141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7430B50A28
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 03:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC5161C266FA
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 01:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC961EF09D;
	Wed, 10 Sep 2025 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="g3qKEn7S"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EFC7E9;
	Wed, 10 Sep 2025 01:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757467246; cv=none; b=XWpo//FCT+wipuTb8kU3XQR+9SFvM4NI8o1bfsUVv6xXQPWi+8J4rymV6jmqcmz6TcUtWeUzVmgfCrc7QJEREnh6Y2PKb49tiw8sIShUkhYw8od5scXqXnclpna6SmEtL0hJaBmk/6ZhOSC1dOR+a/9s/MHu0SjyL5zEbnHCXkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757467246; c=relaxed/simple;
	bh=SjSZ4fJvEkON3f7H8fSsbr6eG88xcLoUS0NgI9+azdk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=o6fKDhLepegqiH2U5u8BNM9B95v3CP5KYUAKO+fd2PbEgBm0+m8H/3xHATu6sfqn3WLIbOEd3lrX4CPHBiJ4p2oDQ3meEJyRgelM+Zso7Mx/4I7ohmvKQX5buFuUjMrcbxCEo4jzNkEzastIyR8KHE8f9SgE/IoT06dAHQfXlIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=g3qKEn7S; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1757466931; bh=G5kNXpFVRo0yjSdKeycX6sHGdQvY6yNnQ0dazno75uU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g3qKEn7S+F5W9VJwpwkk7zo2bZxxDfLZntWUCQf0syMnLLq4L0P7Kl8xqcdZssw9n
	 uxN/07pkLA25tP97PVAc3f74HAK/YEd1g2vEQ1IEs7e4MdHzyuC+ei5cKNfC+rNAIR
	 xpbfDovVBajMKhqA0v/vGMXccbJci+D1Im3/LrF8=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.230.220])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 3DD89E33; Wed, 10 Sep 2025 09:15:29 +0800
X-QQ-mid: xmsmtpt1757466929tuoy189ox
Message-ID: <tencent_341BA32545BAFBBB2133249EDE1B774B4908@qq.com>
X-QQ-XMAILINFO: NqN/wpVFVRYXHuZItgFVQwOdjGLIqK2h9RS3YOVGy8/sETj/yPd+ohspYbsk4V
	 nuWIZC2YGsqW5C7Ppd2NGKITiGwsVHGh8QM0KjI6ejMnUijPPDYgChLC2E9HTMwqwtjrK4qhH0fh
	 7urzwWuv3VrLKzj/dVIcCF/JHrPz0TYJVZuO/p46CJdTAcAu6hvamkw4QJCYteaHA7SjSM08xJUX
	 VquRr1ucYL9OYy57VoIt1uALj1dt1cbvD8uTo7lt49eirN3GzyNERliK2CSywvR/eE1mAQfo2Rvh
	 Ch/lnJEhEQxlYuaiSni6dc97cBHZkJJPyePjd+LRpPXSZ1tluzO7I9RHRFpPufvlnP53eBLQmvf+
	 7IeVoLMfr4bVqVEOuoR9OOvYziGViGSj+bXb1xIxyI9smvOfuB757j5aY+2XkYIyDHpz7xCx/Z84
	 +hVTM0XfdUvaTE6BjF89wd8hMdYlboRR8whELKxSoG4T8L17Fe6MUYwe5vjKEHn5w5Vwe4f2E4wl
	 rxcR9xCoMzURTumQW4/M7R2feEC/NJdTzv6FPaPEhey5np9aTfOyzrrDFFpglvig3uBXQ2z7V6js
	 2Xg8UI7Jcsygrc3XRtRHRCwTdXsC5EAtpm4MItR9qqRLQYHRrYQGHKi1hq6f65YRoFXcZ5LvyNDG
	 nKlUmyZFYCrXy055ozMp1+m+6ztixCBNnkIZ/See0wVNWlb3hi7nCkNoguHZiMAteJm07p4c/kjb
	 pmQyVs5VCIe4hruAmU3l2phjsGOgqjDwOa0W/6QataLWgSLY+lQiL2ndqXJUNVSpBYbJi6p2Gw2H
	 0R04/zkxh4D5aglK27Xu11Hkza48xLkMf2TSjk/DWIfScTK1dL0NUuOxejBFvxfxsCJehrIaUMje
	 p3zmn90JOIgxXmUC2cPFkfrQkZLxD1+0zoJ7J3ko8CTi/woA1OKkg+PmpfmOZjquEXIBz4E2cV63
	 xlVXPIrsikmFxfGy1VXevSUNE1y1I7cfCM5DcAKJpM6RMQRd/DvQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
Cc: laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH Next] media: mc: Clear minor number before put device
Date: Wed, 10 Sep 2025 09:15:27 +0800
X-OQ-MSGID: <20250910011526.990021-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <68c097c5.050a0220.3c6139.000a.GAE@google.com>
References: <68c097c5.050a0220.3c6139.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device minor should not be cleared after the device is released.

Fixes: 9e14868dc952 ("media: mc: Clear minor number reservation at unregistration time")
Reported-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=031d0cfd7c362817963f
Tested-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/mc/mc-devnode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 0d01cbae98f2..6daa7aa99442 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -276,13 +276,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	/* Delete the cdev on this minor as well */
 	cdev_device_del(&devnode->cdev, &devnode->dev);
 	devnode->media_dev = NULL;
+	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
 
 	put_device(&devnode->dev);
-
-	mutex_lock(&media_devnode_lock);
-	clear_bit(devnode->minor, media_devnode_nums);
-	mutex_unlock(&media_devnode_lock);
 }
 
 /*
-- 
2.43.0


