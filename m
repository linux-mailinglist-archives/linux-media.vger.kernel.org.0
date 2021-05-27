Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9D939249A
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 03:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhE0Bzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 21:55:37 -0400
Received: from m12-14.163.com ([220.181.12.14]:52372 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233226AbhE0Bzf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 21:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4Qi8a
        MwmBibxY9+R2w9nfVTsTsuEonMRgBc/qLnlv1k=; b=gkCdFyxCfHFE4dPOq5LZs
        wRrGw8my/bNH+bBOUwyk/f/DNgs6iCD+NHHf8avL3qpraesYXffc76xNqKLRkvZ+
        AjpK2HkdiagipwsIYb49TEC6Sjlcsvm9i8WCHGEr8ag42pT1r0ufV/r9fankXjHx
        elmltz2Iq6XMnfeucGSRcw=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp10 (Coremail) with SMTP id DsCowAA3h3+m+65g4G_ZLA--.3338S2;
        Thu, 27 May 2021 09:53:43 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, arnd@arndb.de,
        sakari.ailus@linux.intel.com, sergey.senozhatsky@gmail.com,
        gustavoars@kernel.org, yepeilin.cs@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: v4l2-ioctl: deleted the repeated word 'the' in the comments
Date:   Thu, 27 May 2021 09:52:43 +0800
Message-Id: <20210527015243.117654-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowAA3h3+m+65g4G_ZLA--.3338S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxWF4UuFy7KFykWF18AFb_yoWkJFg_X3
        s3uas2gr1UJa1j9wn0yr13Z3s8K3yUurn3A3WDtryaqF18Z3W5KrWkArsrJrs7ua1qyasx
        XF9xWw1Fyw4UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5i_-PUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiLwefUFUMYtGJjwAAsL
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

deleted the repeated word 'the' in the comments of function
 v4l_sanitize_format()

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2673f51aafa4..5a232fd32cf3 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -999,7 +999,7 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
 	/*
 	 * The v4l2_pix_format structure has been extended with fields that were
 	 * not previously required to be set to zero by applications. The priv
-	 * field, when set to a magic value, indicates the the extended fields
+	 * field, when set to a magic value, indicates the extended fields
 	 * are valid. Otherwise they will contain undefined values. To simplify
 	 * the API towards drivers zero the extended fields and set the priv
 	 * field to the magic value when the extended pixel format structure
-- 
2.25.1

