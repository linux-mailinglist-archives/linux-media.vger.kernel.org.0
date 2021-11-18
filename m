Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41AB455917
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 11:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245211AbhKRKed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 05:34:33 -0500
Received: from gofer.mess.org ([88.97.38.141]:60165 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243723AbhKRKec (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 05:34:32 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 615E6C6364; Thu, 18 Nov 2021 10:31:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1637231491; bh=7BjCXa9NyuIE6iX3f8qOm89IK0t/EKCD1AXAqLk4SKI=;
        h=From:To:Cc:Subject:Date:From;
        b=XmoGl/BES82yA0b4v7vXtZdw0HIwGdfOcJn3PKfJEhrKUljTouwijxcpu/Q/BqsrV
         mmsMNcpH3wMXiVC8gICzhCou89LL6NO/LXORFhxQSRS7Wogm4kk7Rwsf18EqIJCjiz
         deYAHPOBpvBXtTpwSKlNXTJOxZYOyj4OOXF7iJGJjqu7aM9PeZ7plmGj2n9494shYO
         OHd3TCbWAvLHcmMP1AtnSg9H0riOpeKwVKkKcOHxShPirZFPoDBLlBsfvMLD/G1YoI
         7h/nbEgUMcQh7SQwpbiQnAIIu3XOXTk7AC4rdGreP2CaODZjycapMEqVZSOEx/Q97Z
         Ql76wKVQ/2GRQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: meson-ir-tx: remove incorrect doc comment
Date:   Thu, 18 Nov 2021 10:31:31 +0000
Message-Id: <20211118103131.1523-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not use kernel-doc "/**" notation when the comment is not in
kernel-doc format. This fixes a sparse warning.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index c22cd26a5c07..63e1dbf0a4e9 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * meson-ir-tx.c - Amlogic Meson IR TX driver
  *
  * Copyright (c) 2021, SberDevices. All Rights Reserved.
-- 
2.33.1

