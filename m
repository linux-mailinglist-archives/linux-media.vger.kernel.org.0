Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04423ACD6B
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 16:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbhFROXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 10:23:51 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40825 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234114AbhFROXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 10:23:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uFNIlE73xhqltuFNMl5jzS; Fri, 18 Jun 2021 16:21:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624026100; bh=OcMn3ZQ56601+ibFUfbMYRMUPoQ71Ilo6QDYiI4QOws=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FZbIE2RtFjhnrWce0p3oXqGSKLilzPZpM4OnMEQArHPyP7Tm5crA6CZWQkhngmR5L
         jnK76SbY6GVsB9Tkc7UkIGNtXkyB1hS5s33VOzBqChIWFJ//hZEufwr4/Ctn5V29N0
         KozbuAXlDiV+mNJPq4n+E8o7kPiiVAhRnpvXT/aPBiHdAns3aHZ82gL2c4lZQZ4lwm
         Zxk+I9ImznQiXHFtkc9JkNCxhr/vKnVugirzNEKH2YipKvxGr8lPp9stB7y8kmW6j8
         mkX4kixZJ6D+BsAEJuxQjRjCnra/gFdqxiWx2BBv9hdde5A7OwbSjziBMdstbt1orB
         veQ/UW99w5ymg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Johan Fjeldtvedt <jaffe1@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] include/uapi/linux/cec.h: typo: SATERDAY -> SATURDAY
Message-ID: <888f3615-f59e-1dc5-0ba5-157dc7877104@xs4all.nl>
Date:   Fri, 18 Jun 2021 16:21:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAbKgH6jcBcBH+RcgNrV6wN/K58jX3SbvF1aV0V6eW3KJ1IBP3fKpd6JwB8gKhqnb4+PXhWMIQKiFUULdIuiT61j/zYURypdcIOT4QrxTAqqNpdIsSQI
 +TulvpYs9c9MtIirQTPByPw1IIFrjYfYcGtbI0qcwQt9UbqmBq1KCj8KdYWEKribLz+kbO3bxDF3PEU+uv8/mzw084xqeRAzidiiWOHIa/9KifakceN/jbr9
 nITaIvoMbGKWkOS4YL7MmZtN/wKeiQBfBCqIsmfbiqA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo in a define: CEC_OP_REC_SEQ_SATERDAY -> CEC_OP_REC_SEQ_SATURDAY

This isn't used yet in actual applications to the best of my knowledge,
and it certainly doesn't break the ABI since the value doesn't change.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/cec.h.rst.exceptions b/Documentation/userspace-api/media/cec.h.rst.exceptions
index d83790ccac8e..13de01d9555e 100644
--- a/Documentation/userspace-api/media/cec.h.rst.exceptions
+++ b/Documentation/userspace-api/media/cec.h.rst.exceptions
@@ -140,7 +140,7 @@ ignore define CEC_OP_REC_SEQ_TUESDAY
 ignore define CEC_OP_REC_SEQ_WEDNESDAY
 ignore define CEC_OP_REC_SEQ_THURSDAY
 ignore define CEC_OP_REC_SEQ_FRIDAY
-ignore define CEC_OP_REC_SEQ_SATERDAY
+ignore define CEC_OP_REC_SEQ_SATURDAY
 ignore define CEC_OP_REC_SEQ_ONCE_ONLY

 ignore define CEC_MSG_CLEAR_DIGITAL_TIMER
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index dc8879d179fd..de936f5e446d 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -642,7 +642,7 @@ struct cec_event {
 #define CEC_OP_REC_SEQ_WEDNESDAY			0x08
 #define CEC_OP_REC_SEQ_THURSDAY				0x10
 #define CEC_OP_REC_SEQ_FRIDAY				0x20
-#define CEC_OP_REC_SEQ_SATERDAY				0x40
+#define CEC_OP_REC_SEQ_SATURDAY				0x40
 #define CEC_OP_REC_SEQ_ONCE_ONLY			0x00

 #define CEC_MSG_CLEAR_DIGITAL_TIMER			0x99
