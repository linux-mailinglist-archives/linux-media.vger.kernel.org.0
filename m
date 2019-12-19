Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4BF126EE8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 21:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfLSU33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 15:29:29 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:45446 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfLSU33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 15:29:29 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 47f3Q02Q7Yz9vZ2B
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wYqbWLWQpacj for <linux-media@vger.kernel.org>;
        Thu, 19 Dec 2019 14:29:28 -0600 (CST)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 47f3Q01Dyhz9vZ1w
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 14:29:28 -0600 (CST)
Received: by mail-yb1-f200.google.com with SMTP id b5so5012838ybq.23
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ku3WkybWuYyol2wbhhnHdNuHA1Lkwj9hheWjbC7/44=;
        b=mpjePlJ9nPLL6pMoZa3NMUzvBxSAij80+5mlgV8hUi54WoJWZLHaB1FG/vLn1EdBgz
         OTQFltozEQxjVG/v/d+TIY4qH29YAaXEY0GdZ2Q4m5H8GdzRVH9Nn8cpJbJQ0qogLXwe
         fRlU+87eCFwqfnjW5fD0j+z3TEeAPkk4uj8j5XOKPhm+A4NS/OFNixKQ9/vIVigktPov
         GqCbDQtgf/KX+CaXiwU/2SxPjeuyl6JKhlV7VAufsEeGYAlMDiMuUVUGGzrMgCuHPMFr
         cvLxMHOQElgXGKMUieRTJXPAD8XZ1CXyKvIrNR7SHpIKHTB8LrehERXROw5KIOlGtLpz
         dcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ku3WkybWuYyol2wbhhnHdNuHA1Lkwj9hheWjbC7/44=;
        b=r9T1ODEDNFvNN+hIrE5diEHpkoxEUz4VFpsImUe3/xenwjmR1gKFYlcsdtCtvPWYwi
         3pfhxlYjaF9s21SYk9FidvD/BLsP0PkUTnbSK8uXI7PsAZJ//qZyWIMxzV4systzI+Fd
         6WYE/yhJvqqSExMOCXFgfDCqXKiVxQJFBachrnpR5QX+d1zzjUjFOyOv9slcPj6C6Q4l
         t94OhcJ4iYYg5t/xMUV3f5AO0b6UlbIGWh+/5yMcb0aqRJek69yd+KrlM/OFcRTCn8Js
         pRybIJ3T8gqzMqzhm4DVkV9Mj1b9B5e1JFfQkaiaoT1qKwTRMKT/LgyxiR+8VPVYu1O+
         Ujbg==
X-Gm-Message-State: APjAAAVrYeeQGfz+4D9oCtdrW+ySlK6Qo7O5wnQ7ucSzCoQ+qyLAoP9O
        uwMfUclnWtff7TVdq+aWLa+ig5ebR8GDlDSzt3ULqg3inZMXDu1u+NW7i3DVwMrIV1IDwrphN+2
        6A0svCJa9exwJOIUyrgsN4uqXtSQ=
X-Received: by 2002:a81:3a0b:: with SMTP id h11mr7820046ywa.217.1576787367604;
        Thu, 19 Dec 2019 12:29:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/xa8tB8qV6esn82AbEH4SgpvqcB9j6GjxQw3qqRE8q4mJtWFsv0+QkciV590Lu76NnF8KkA==
X-Received: by 2002:a81:3a0b:: with SMTP id h11mr7820030ywa.217.1576787367403;
        Thu, 19 Dec 2019 12:29:27 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id w128sm2827126ywf.72.2019.12.19.12.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 12:29:27 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: media/saa7146: fix incorrect assertion in saa7146_buffer_finish
Date:   Thu, 19 Dec 2019 14:29:24 -0600
Message-Id: <20191219202924.24194-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In saa7146_buffer_finish, the code for q->curr to be NULL is
already present and asserting for NULL is unnecessary. This patch
elimiates such a check.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/media/common/saa7146/saa7146_fops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index aabb830e7468..d7e83b55ddca 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -97,8 +97,6 @@ void saa7146_buffer_finish(struct saa7146_dev *dev,
 	DEB_EE("dev:%p, dmaq:%p, state:%d\n", dev, q, state);
 	DEB_EE("q->curr:%p\n", q->curr);
 
-	BUG_ON(!q->curr);
-
 	/* finish current buffer */
 	if (NULL == q->curr) {
 		DEB_D("aiii. no current buffer\n");
-- 
2.20.1

