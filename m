Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C488E4630BA
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 11:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240682AbhK3KNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 05:13:22 -0500
Received: from gofer.mess.org ([88.97.38.141]:58687 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235184AbhK3KNV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 05:13:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B56AAC642C; Tue, 30 Nov 2021 10:10:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638267001; bh=CFTxINl5DbE+8ZcREVPC3yYKcL+I4owfwcsHYx9ohuA=;
        h=From:To:Subject:Date:From;
        b=HQT30r7GrrjF6RLkrjenYrz1OkW79bdGd/DzBqBTEUCj0E23E8nZ3h3XU470ZzFW2
         Ndjmk6XNL+Vs5FEKDVu0MlDkY5ZwP9+b3CxN3IOO29bhYesZlXLq2UyETjgfhvbUch
         aELqigltrDISwZcI9r2pLN3w67dQtLmYuhDt42vJ4U41iExuVSjdajxXOJmV6YeFSk
         CEHYziKpCC9Pg50D9GMEJvBUNBp5xMPvOT9DfDwvXSy0DZSXMcSrM6Hy8vioL9f3kG
         3uXJ0Xyy6axi4E+DRc0bGc93uuaLVQhP8WHNqfaMYZ8JlhAHo7vQsF8VO5+Cef/TIt
         JwrdWGmcuHHTw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: lirc: always send timeout reports
Date:   Tue, 30 Nov 2021 10:09:59 +0000
Message-Id: <7d4ef3b31c3fc45741154db622b71fd6d0f5f9e7.1638266939.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without timeout reports, it is impossible to decode many protocols since
it is not known when the transmission ends. timeout reports are sent by
default, but can be turned off. There is no reason to turn them off, and
I cannot find any software which does this, so we can safely remove it.

This makes the ioctl LIRC_SET_REC_TIMEOUT_REPORTS a no-op.

Signed-off-by: Sean Young <sean@mess.org>
---
 .../userspace-api/media/lirc.h.rst.exceptions |  1 +
 .../userspace-api/media/rc/lirc-dev-intro.rst |  8 ++-
 .../userspace-api/media/rc/lirc-func.rst      |  1 -
 .../media/rc/lirc-set-rec-timeout-reports.rst | 49 -------------------
 drivers/media/rc/lirc_dev.c                   |  5 --
 include/media/rc-core.h                       |  2 -
 6 files changed, 4 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst

diff --git a/Documentation/userspace-api/media/lirc.h.rst.exceptions b/Documentation/userspace-api/media/lirc.h.rst.exceptions
index e74b73cd0e9e..42f540cb4e4e 100644
--- a/Documentation/userspace-api/media/lirc.h.rst.exceptions
+++ b/Documentation/userspace-api/media/lirc.h.rst.exceptions
@@ -33,6 +33,7 @@ ignore define LIRC_CAN_SET_REC_DUTY_CYCLE
 # Obsolete ioctls
 
 ignore ioctl LIRC_GET_LENGTH
+ignore ioctl LIRC_SET_REC_TIMEOUT_REPORTS
 
 # rc protocols
 
diff --git a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
index c88973732282..9a5e5f0aae11 100644
--- a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
@@ -117,11 +117,9 @@ on the following table.
 
     ``LIRC_MODE2_TIMEOUT``
 
-        If timeout reports are enabled with
-        :ref:`lirc_set_rec_timeout_reports`, when the timeout set with
-        :ref:`lirc_set_rec_timeout` expires due to no IR being detected,
-        this packet will be sent, with the number of microseconds with
-        no IR.
+        When the timeout set with :ref:`lirc_set_rec_timeout` expires due
+        to no IR being detected, this packet will be sent, with the number
+        of microseconds with no IR.
 
 .. _lirc-mode-pulse:
 
diff --git a/Documentation/userspace-api/media/rc/lirc-func.rst b/Documentation/userspace-api/media/rc/lirc-func.rst
index 793f295d3ac9..5c84888f1eca 100644
--- a/Documentation/userspace-api/media/rc/lirc-func.rst
+++ b/Documentation/userspace-api/media/rc/lirc-func.rst
@@ -22,6 +22,5 @@ LIRC Function Reference
     lirc-set-rec-carrier-range
     lirc-set-send-carrier
     lirc-set-transmitter-mask
-    lirc-set-rec-timeout-reports
     lirc-set-measure-carrier-mode
     lirc-set-wideband-receiver
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
deleted file mode 100644
index aebe81012939..000000000000
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
+++ /dev/null
@@ -1,49 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
-.. c:namespace:: RC
-
-.. _lirc_set_rec_timeout_reports:
-
-**********************************
-ioctl LIRC_SET_REC_TIMEOUT_REPORTS
-**********************************
-
-Name
-====
-
-LIRC_SET_REC_TIMEOUT_REPORTS - enable or disable timeout reports for IR receive
-
-Synopsis
-========
-
-.. c:macro:: LIRC_SET_REC_TIMEOUT_REPORTS
-
-``int ioctl(int fd, LIRC_SET_REC_TIMEOUT_REPORTS, __u32 *enable)``
-
-Arguments
-=========
-
-``fd``
-    File descriptor returned by open().
-
-``enable``
-    enable = 1 means enable timeout report, enable = 0 means disable timeout
-    reports.
-
-Description
-===========
-
-.. _lirc-mode2-timeout:
-
-Enable or disable timeout reports for IR receive. By default, timeout reports
-should be turned off.
-
-.. note::
-
-   This ioctl is only valid for :ref:`LIRC_MODE_MODE2 <lirc-mode-mode2>`.
-
-Return Value
-============
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 7f591ff5269d..c7c5157725f8 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -102,8 +102,6 @@ void lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 
 	spin_lock_irqsave(&dev->lirc_fh_lock, flags);
 	list_for_each_entry(fh, &dev->lirc_fh, list) {
-		if (LIRC_IS_TIMEOUT(sample) && !fh->send_timeout_reports)
-			continue;
 		if (kfifo_put(&fh->rawir, sample))
 			wake_up_poll(&fh->wait_poll, EPOLLIN | EPOLLRDNORM);
 	}
@@ -166,7 +164,6 @@ static int lirc_open(struct inode *inode, struct file *file)
 
 	fh->send_mode = LIRC_MODE_PULSE;
 	fh->rc = dev;
-	fh->send_timeout_reports = true;
 
 	if (dev->driver_type == RC_DRIVER_SCANCODE)
 		fh->rec_mode = LIRC_MODE_SCANCODE;
@@ -570,8 +567,6 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case LIRC_SET_REC_TIMEOUT_REPORTS:
 		if (dev->driver_type != RC_DRIVER_IR_RAW)
 			ret = -ENOTTY;
-		else
-			fh->send_timeout_reports = !!val;
 		break;
 
 	default:
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 8c5b7978e1d9..ab9d3b7cd799 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -59,7 +59,6 @@ enum rc_filter_type {
  * @rc: rcdev for this lirc chardev
  * @carrier_low: when setting the carrier range, first the low end must be
  *	set with an ioctl and then the high end with another ioctl
- * @send_timeout_reports: report timeouts in lirc raw IR.
  * @rawir: queue for incoming raw IR
  * @scancodes: queue for incoming decoded scancodes
  * @wait_poll: poll struct for lirc device
@@ -72,7 +71,6 @@ struct lirc_fh {
 	struct list_head list;
 	struct rc_dev *rc;
 	int				carrier_low;
-	bool				send_timeout_reports;
 	DECLARE_KFIFO_PTR(rawir, unsigned int);
 	DECLARE_KFIFO_PTR(scancodes, struct lirc_scancode);
 	wait_queue_head_t		wait_poll;
-- 
2.33.1

