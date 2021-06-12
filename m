Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909FC3A4E11
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 11:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhFLJtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 05:49:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46373 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231158AbhFLJtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 05:49:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id s0EhlMnmUhqlts0EklfnaE; Sat, 12 Jun 2021 11:47:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623491250; bh=UreVtJpshyf5RYI9449xVLUYDZzvnOjNiqli1Bhx1kM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hAUx4txrSWQzLtS9wmA9fOPlngmOCUPB6jeMfjgmyZhi8bhepXfWgLBhpnuzyENKm
         x3XYqrbWQLKXCIhdWVvr5xrlkfXMlI0RgFg8VZRZ4lK0TYrOjzGhs2fHfFAFprcDqB
         SQBJGggp6pbfu2BIDKrmqI6GggOv/CUH9YfyYIuh7in9CiNHiunxKej5IaYIz/cLbw
         a1trRxZHJHtEmLn6uGl0eLloDqSCC2qD+GIvqPxKMotkT3Zb7E6Hv5ju3fv5VSZtE4
         njeszIaCycc4DbAimZtc82jxWNchXMXtLYQRH2VOmHCtMCdt4j7Mvphg6rNJ3p5s53
         VSO14Jo39d3Ug==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l-utils: libdvbv5: fix broken my_strlcpy calls
Message-ID: <b18b9189-3621-16d0-4866-dccff52c453a@xs4all.nl>
Date:   Sat, 12 Jun 2021 11:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNlE9/3D31H+dtURQDU8n9hW4ji4j7XCxGhU1xtDlVDq3WfN5DuGSNkjwLQezPGSJ5rlSCT/vfLR3fuqwfXMUx5cXHshJF5Bl2kiRt0sfgYwMzZH+y5A
 4iqGIwDT1y17puhAoa2vzwv3t+YyYl8/ZKe85+O+a726kURrr3eLjJT4rUOeO8VMoVWJQkckPBERzoqtDgALT9QmktdNiJao0+dNRdSvzsQ6ohNvMw01fb8u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sizeof(*msg->cmd) should have been sizeof(msg->cmd).

Also, call strncpy with siz - 1 instead of siz to avoid this
compiler warning:

  CC       libdvbv5_la-dvb-dev-remote.lo
In function ‘my_strlcpy’,
    inlined from ‘send_buf.isra.0.constprop’ at dvb-dev-remote.c:350:2:
dvb-dev-remote.c:121:7: warning: ‘strncpy’ output truncated copying 1 byte from a string of length 12 [-Wstringop-truncation]
  121 |  rc = strncpy(dst, src, siz);
      |       ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 lib/libdvbv5/dvb-dev-remote.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/libdvbv5/dvb-dev-remote.c b/lib/libdvbv5/dvb-dev-remote.c
index fa551b82..3ef9d67c 100644
--- a/lib/libdvbv5/dvb-dev-remote.c
+++ b/lib/libdvbv5/dvb-dev-remote.c
@@ -118,7 +118,7 @@ static char *my_strlcpy(char *dst, const char *src, size_t siz)
 {
 	char *rc;

-	rc = strncpy(dst, src, siz);
+	rc = strncpy(dst, src, siz - 1);
 	dst[siz - 1] = '\0';

 	return rc;
@@ -251,7 +251,7 @@ static struct queued_msg *send_fmt(struct dvb_device_priv *dvb, int fd,

 	pthread_mutex_init(&msg->lock, NULL);
 	pthread_cond_init(&msg->cond, NULL);
-	my_strlcpy(msg->cmd, cmd, sizeof(*msg->cmd));
+	my_strlcpy(msg->cmd, cmd, sizeof(msg->cmd));

 	pthread_mutex_lock(&priv->lock_io);
 	msg->seq = ++priv->seq;
@@ -347,7 +347,7 @@ static struct queued_msg *send_buf(struct dvb_device_priv *dvb, int fd,

 	pthread_mutex_init(&msg->lock, NULL);
 	pthread_cond_init(&msg->cond, NULL);
-	my_strlcpy(msg->cmd, cmd, sizeof(*msg->cmd));
+	my_strlcpy(msg->cmd, cmd, sizeof(msg->cmd));

 	pthread_mutex_lock(&priv->lock_io);
 	msg->seq = ++priv->seq;
-- 
2.24.0

