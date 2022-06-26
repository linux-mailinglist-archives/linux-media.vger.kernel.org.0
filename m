Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B3B55B2EF
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 18:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiFZQqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 12:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiFZQq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 12:46:29 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A8EDFCD
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 09:46:28 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 266E88123D;
        Sun, 26 Jun 2022 18:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656261986;
        bh=JwxtbtpH5NZ0Uoaxtila394jHAOb4v2hkL3MmQOO3+w=;
        h=From:To:Cc:Subject:Date:From;
        b=ibBHb2dD4wqW36hCSkTBqYlDWCFQX9j/cDq46ozN5FPBr6+u1gcJnMFy6AeexgPzI
         NX/2xUKNhPwmXiJn+C6hUiMIOQbqlbBTOnI7ByvU/jJAjN3/qLdziqnihAQYoZGZu1
         cxV7vTw+CqtambbWJM1/hoS20r59EPTYvYS7ynGS2GsigtnX0BJ+nvCKIXC9xr5rNE
         luQ+eOeOgkMRoNv2a6zjECqc3/wdvlThrFU1Dk3TVKbYLzPV8SwPx3tenBUs7B09eq
         Op3AEjL3weId6De0n37BsRX4nDLhmtw4Ynil55vlU2YspC9BAlQTMlcqFN9sUzVPdP
         Y7kTsYG0abQ7w==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: docs: Fix VIVIOC typo
Date:   Sun, 26 Jun 2022 18:46:08 +0200
Message-Id: <20220626164608.15718-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace VIVIOC_ with VIDIOC_ , trivial typo fix.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/mmap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/mmap.rst b/Documentation/userspace-api/media/v4l/mmap.rst
index 16b1e13b029f5..a5672573dd6fd 100644
--- a/Documentation/userspace-api/media/v4l/mmap.rst
+++ b/Documentation/userspace-api/media/v4l/mmap.rst
@@ -232,7 +232,7 @@ In the write loop, when the application runs out of free buffers, it
 must wait until an empty buffer can be dequeued and reused.
 
 To enqueue and dequeue a buffer applications use the
-:ref:`VIVIOC_QBUF <VIDIOC_QBUF>` and :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`
+:ref:`VIDIOC_QBUF <VIDIOC_QBUF>` and :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`
 ioctl. The status of a buffer being mapped, enqueued, full or empty can
 be determined at any time using the :ref:`VIDIOC_QUERYBUF` ioctl. Two
 methods exist to suspend execution of the application until one or more
-- 
2.35.1

