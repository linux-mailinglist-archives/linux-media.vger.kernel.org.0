Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98D2CA307
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbgLAMpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:45:35 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48499 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728623AbgLAMpf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:45:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k51SkssSADuFjk51Yk2RZB; Tue, 01 Dec 2020 13:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826692; bh=4qbHEJdiN8hY9S+Fm3WxNty6LYiWWcjJlDO8CtQih0k=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=YpoyBm7E/I87661RgKDTB7V5Ou2RsKZ7pIQSUzG+ajD3iKMvbZDvE5WmGvIoBhdPD
         sGjkNpDRPtjUJF/b12GbvC+LfzA7XoJSu09WFdeOeDIGUDomUwsbDanltt6RXlQZnR
         4rBUnz0a4+eVy3s79aTFyaUecNAe452w790dIRdjNGmeLi73fH0s1jUeKAXKJSYS92
         TO9TwwZCRCyMvcQvR8AgaCi/Ss70ciE6pFoUzBMZZ2QIFeDwAHMhF4OyrhKggB34HR
         XXjMcdrMf408V/Nl68qqgglaup7bvEey493Q6R5UzIqMGnqTQerFl4V6kdatLhn8Mz
         upa8WfRfkYMJA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 6/7] v4l2-dev: add EPOLLPRI in v4l2_poll() when dev is unregistered
Date:   Tue,  1 Dec 2020 13:44:45 +0100
Message-Id: <20201201124446.448595-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
References: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMpvkjAk6HI2j3BveW2MEiCLvzzeRn4nnBO1V+ZM2q1Y2N6RUcSw8tTmOeRBj720LACdfRQKS6lKxmZf0IA1VBi176pkOz94HuIUN5ejM+oQDNve9s2j
 FT/XqBztnHKZqx7uUyd4pwR0S6tIPGDzzwA7xgVn7c/LeKSY+gnXNsmLzw5HOTL2MWcXoaze0r0+PnSI3u3uZzUMrYLvah+1NqcbUsnrYnyw5CTF1POWvWj5
 iIfUzUGIFnPwd+jQq6loI/HX7KoQKJSH8XtwhtS8rvKvtXsmn3pF17jScEBzdmH+8vlxZI1DG/o6rvgJBh72CtGC12ghXWXpvLxcfsX5P+A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the V4L2 device was unregistered, then add EPOLLPRI to
the poll mask. Otherwise a select() that only waits for
exceptions will not wake up. A select() that waits for
read and/or write events *will* wake up on an EPOLLERR, but
not (for some reason) if it just waits for exceptions.

Strangly the epoll functionality will wakeup on EPOLLERR if
you just wait for an exception, so in this respect select()
and epoll differ.

In the end it doesn't really matter, what matters is that
polling file handles are woken up on device unregistration.

It also improves the code a bit if vdev->fops->poll is NULL:
this didn't check for device unregistration.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 0ddc3554f1a4..f9cff033d0dc 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -339,12 +339,14 @@ static ssize_t v4l2_write(struct file *filp, const char __user *buf,
 static __poll_t v4l2_poll(struct file *filp, struct poll_table_struct *poll)
 {
 	struct video_device *vdev = video_devdata(filp);
-	__poll_t res = EPOLLERR | EPOLLHUP;
+	__poll_t res = EPOLLERR | EPOLLHUP | EPOLLPRI;
 
-	if (!vdev->fops->poll)
-		return DEFAULT_POLLMASK;
-	if (video_is_registered(vdev))
-		res = vdev->fops->poll(filp, poll);
+	if (video_is_registered(vdev)) {
+		if (!vdev->fops->poll)
+			res = DEFAULT_POLLMASK;
+		else
+			res = vdev->fops->poll(filp, poll);
+	}
 	if (vdev->dev_debug & V4L2_DEV_DEBUG_POLL)
 		dprintk("%s: poll: %08x\n",
 			video_device_node_name(vdev), res);
-- 
2.29.2

