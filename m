Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF92FCE61
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733294AbhATKjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:39:18 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:55609 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731636AbhATJnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A18l8jEP; Wed, 20 Jan 2021 10:43:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135791; bh=6NRXEHUxjZBx2VWD5wEWM0Lrged4zVx6TCrEsDhzyOc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=KKA7O6Z3HXzfEKgCZWLjBE+95eRDIQGW3NvUHypMdYG1qwC8RcB7NenuminCkIodY
         WAfZR/IUlM80twq5xAlltbOeuqRf0Hfa7ddIt7E8EGcq6d6p/dRTyqWjtOuo6MAQPF
         kaM/M+eMpVjB4y36suX/bk3sAdbRs/vhgS0bUBJKHaJSG/RjPNlKT+pNaVx2qtSlQV
         /+jWMR84PK+z6McNe+0X0WSMKe4kFNOKQ9umWipXF6cm8+QVz/67cRt92ke0WTh6QT
         QCPCzsAHqdZa/8mu5oPfz8U/DSwqzxsJzgm2sem1SH7chST7EFkybvqNi6hXy+xNTp
         SfobkQPtlaIYw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [PATCH 04/14] davinci/vpbe.c: ret contains the return code, not err
Date:   Wed, 20 Jan 2021 10:42:56 +0100
Message-Id: <20210120094306.784318-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfL6gXyIQamfwxJt2kYKZXIXPfvD+J+cb4hNqS4nbZzw1GI5vvllDlxOUWgqraiFNhq3F/LZtBzfudYa84HR768+XzVha/eeTgmB7xn3J2//BbfAk1A8s
 5K51t7mq0GZhhRzy8q2mJCkBnW/olr6hAcPJJmtpi7qySuQkPni50WBwSuSgWdujIYeONtM5tvxr8wdI8jbwvKfnflQAK8HUBVwJAB70utBQl/HA+1/JemGD
 Qm+5gqLU4GqEBAAl2YVr3KW5mXMyHo1977iCpb9OoBCvqG58vxnSnnoHzxWADMg3
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this smatch warning:

drivers/media/platform/davinci/vpbe.c:632 vpbe_initialize() warn: missing error code 'ret'

The function returns 'ret', but instead 'err' was set to -ENOMEM.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/davinci/vpbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index fe9468b180e6..5f0aeb744e81 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -628,7 +628,7 @@ static int vpbe_initialize(struct device *dev, struct vpbe_device *vpbe_dev)
 		if (err) {
 			v4l2_err(&vpbe_dev->v4l2_dev,
 				 "unable to initialize the OSD device");
-			err = -ENOMEM;
+			ret = -ENOMEM;
 			goto fail_dev_unregister;
 		}
 	}
-- 
2.29.2

