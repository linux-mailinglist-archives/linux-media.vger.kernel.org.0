Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA0933A964
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 02:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhCOBk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 21:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhCOBkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 21:40:23 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5DFC061574;
        Sun, 14 Mar 2021 18:40:22 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id n24so97441qkh.9;
        Sun, 14 Mar 2021 18:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NiNdhhazDnI6FjSBvQJOpJxSfj8ZNZYE8Wj1k8RM+E8=;
        b=WVoXMmjVKQFGoG8/SHLU1zk1f47EpcxBaJEyPirQkR8MXtN1+z7nxAQO4gnFNxrsyB
         9SW+xhZa0Z775GNWLFdSNwVKiKmUVmJUUNtKt//e1IK3iO8WlQxGveVcSRjag6XLvRN6
         z+1nxxG9z4YCcaKDu0rv3a+/+MdhEy//pZqfDZUXyt5y6Q10bAQaorAcCBUJINZ8Q2B/
         thMZ0zrRPvBmr4pC3VHOZ7xSP/YSWJ6Q66Weadl6qJ6gRvA2TErxdry06HaBlaSKrMVb
         Gl0XibZIg543THCBxUcYv7mNkIGo6n7wW/OeJ6T1SHm6vJZJomwzNoboX3GyNU2ij6Md
         PAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NiNdhhazDnI6FjSBvQJOpJxSfj8ZNZYE8Wj1k8RM+E8=;
        b=ATyaiq4h3XlQhSK07Qt4NxbywIeZILAM+BrdugjilMrYdtgzXqaoN0/QfXLOD+KE3l
         VPuXcdH+z9ZTak411cu56On8oCPQxqI9agJVTHzSorA5j+n1RQsLcI0kQjqQ9uCLw3U3
         aaWLGftpdeA7qCcLIbHahfJk1pA2Y6mAwk8+htfXlF1XLVHORzI0zZRutwq66Ttyac9T
         ZVTXO9N+1GILkzNKXaXl8/Tk3M3cknfzxLi0MdooJLHsb9eba+eTTEILdpsDccGX1ZMl
         YwMfvs+IXi/IMn6IxXcEzILculJnlnNZNIglOW4FerbdofHM/8yuZCxVafUdGoW8Lbqs
         4mtQ==
X-Gm-Message-State: AOAM533fN+iwdWkJVgp5QItiI3ClThaaOeRRrbzuLzIzjyhF+NWtNmCH
        46vzefpG40Z+jkNfnVC2RNo=
X-Google-Smtp-Source: ABdhPJxWAijObUIRsuySpBDm7iR+G1ruY8z5nn0C4N8NmFDKOcUfnnbQhY3cmiucxUJLM8FGPHd+zw==
X-Received: by 2002:a37:86c3:: with SMTP id i186mr372588qkd.256.1615772422294;
        Sun, 14 Mar 2021 18:40:22 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.69])
        by smtp.gmail.com with ESMTPSA id f27sm10769917qkh.118.2021.03.14.18.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 18:40:21 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     mchehab@kernel.org, unixbhaskar@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] media: pci: saa7164: Rudimentary spelling fixes in the file saa7164-types.h
Date:   Mon, 15 Mar 2021 07:09:58 +0530
Message-Id: <20210315013958.646798-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


s/structues/structures/
s/decies/decides/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-types.h b/drivers/media/pci/saa7164/saa7164-types.h
index 34dd2be6fce4..00f163b38d40 100644
--- a/drivers/media/pci/saa7164/saa7164-types.h
+++ b/drivers/media/pci/saa7164/saa7164-types.h
@@ -7,7 +7,7 @@

 /* TODO: Cleanup and shorten the namespace */

-/* Some structues are passed directly to/from the firmware and
+/* Some structures are passed directly to/from the firmware and
  * have strict alignment requirements. This is one of them.
  */
 struct tmComResHWDescr {
@@ -28,7 +28,7 @@ struct tmComResHWDescr {
 /* This is DWORD aligned on windows but I can't find the right
  * gcc syntax to match the binary data from the device.
  * I've manually padded with Reserved[3] bytes to match the hardware,
- * but this could break if GCC decies to pack in a different way.
+ * but this could break if GCC decides to pack in a different way.
  */
 struct tmComResInterfaceDescr {
 	u8	bLength;
--
2.30.2

