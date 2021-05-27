Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59A63927F1
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 08:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhE0GoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 02:44:17 -0400
Received: from m12-12.163.com ([220.181.12.12]:41304 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229740AbhE0GoR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 02:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=XrbAl
        VjOi0vmo4uqp8iWRDHB5nejSyXIVIY77v/qZN0=; b=UmEFVSqLB8EEwqiNmfpAo
        3qBTwbvbzSUM3ar9fQ7kX8jtEvggWBh8YNZji7iw/eQdOLO3EEOJSm1/uIi1uNyS
        X+WHhDG0N62NsmiwVjYJu3MGaFDB7rj4NVlRzorSUxUbH3rtavbdldrupwezgk96
        hBdepUuDCmwduef8xyJ8xI=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp8 (Coremail) with SMTP id DMCowAAHQzM+P69gLrreGQ--.15917S2;
        Thu, 27 May 2021 14:42:07 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, arnd@arndb.de,
        sakari.ailus@linux.intel.com, sergey.senozhatsky@gmail.com,
        gustavoars@kernel.org, yepeilin.cs@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH v2] media: v4l2-ioctl: deleted the repeated word 'the' in the comments
Date:   Thu, 27 May 2021 14:41:07 +0800
Message-Id: <20210527064107.149950-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAAHQzM+P69gLrreGQ--.15917S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxXr13CFWUKF47WryfJFb_yoWktwc_X3
        93Cas2gr1UJa1jvw1Ykr13Z3s5K3yDurn7Aasxtr9aqF18Z3Z8Kr4kArsrtrn7u3Wqyasx
        XF9xWw1Fyw47WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5i_-PUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBER+fUFaEEeF72QAAsB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

deleted the repeated word 'the' in the comments of function
v4l_sanitize_format()

Signed-off-by: lijian <lijian@yulong.com>
---
v2: changed the repeated word 'the' to 'that' in the comments of
function v4l_sanitize_format()

 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5a232fd32cf3..eea9412ba153 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -999,7 +999,7 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
 	/*
 	 * The v4l2_pix_format structure has been extended with fields that were
 	 * not previously required to be set to zero by applications. The priv
-	 * field, when set to a magic value, indicates the extended fields
+	 * field, when set to a magic value, indicates that the extended fields
 	 * are valid. Otherwise they will contain undefined values. To simplify
 	 * the API towards drivers zero the extended fields and set the priv
 	 * field to the magic value when the extended pixel format structure
-- 
2.25.1


