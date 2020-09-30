Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D5127E12E
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbgI3GgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:59308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbgI3GgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A509207F7;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=etEdHKnsQP/29xUeMI6P5O8K+a5TTCmJWm0/4A80Hxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n920gN2tFYHH/vtTh5H86Gbvy5iLSOeL8CtJQMZWkYeKj6e2/m4wFHRqQ9FAlj0Lt
         TEz3/EL73TdS/z51olTY0QYvGsQmGAIMDYKpLNh/o4+rDgk745/iJ6JWPIyZsfX0hT
         t5Hwuu/un8hxToi+1qGKc2F3NYFsI/KJAsyBKyu0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmY-W1; Wed, 30 Sep 2020 08:36:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] media: cec-core.rst: fix warnings with Sphinx 3.0+
Date:   Wed, 30 Sep 2020 08:35:59 +0200
Message-Id: <fa50a5ccf615f056aff48051fe0e038b946c72d0.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new C domain code on Sphinx 3 is a lot more pedantic.
It only accepts real functions declared as c:function.

So, declarations like this are not valid:

	.. c:function::
	        int (*adap_enable)(struct cec_adapter *adap, bool enable);

Also, no blank lines are allowed after ".. c:function:", and
continuation lines should be like:

	.. c:function:
		int (void foo, \
		     int bar);

Change the logic there, in order to avoid lots of warnings
when built with Sphinx 3.x.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/cec-core.rst | 62 +++++++++------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index 3ce26b7c2b2b..03016eeaf8f4 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -36,8 +36,9 @@ The struct cec_adapter represents the CEC adapter hardware. It is created by
 calling cec_allocate_adapter() and deleted by calling cec_delete_adapter():
 
 .. c:function::
-   struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops, void *priv,
-   const char *name, u32 caps, u8 available_las);
+   struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops, \
+					    void *priv, const char *name, \
+					    u32 caps, u8 available_las);
 
 .. c:function::
    void cec_delete_adapter(struct cec_adapter *adap);
@@ -74,7 +75,8 @@ To register the /dev/cecX device node and the remote control device (if
 CEC_CAP_RC is set) you call:
 
 .. c:function::
-	int cec_register_adapter(struct cec_adapter *adap, struct device *parent);
+	int cec_register_adapter(struct cec_adapter *adap, \
+				 struct device *parent);
 
 where parent is the parent device.
 
@@ -123,9 +125,8 @@ The seven low-level ops deal with various aspects of controlling the CEC adapter
 hardware:
 
 
-To enable/disable the hardware:
+To enable/disable the hardware::
 
-.. c:function::
 	int (*adap_enable)(struct cec_adapter *adap, bool enable);
 
 This callback enables or disables the CEC hardware. Enabling the CEC hardware
@@ -137,9 +138,8 @@ state of the CEC adapter after calling cec_allocate_adapter() is disabled.
 Note that adap_enable must return 0 if enable is false.
 
 
-To enable/disable the 'monitor all' mode:
+To enable/disable the 'monitor all' mode::
 
-.. c:function::
 	int (*adap_monitor_all_enable)(struct cec_adapter *adap, bool enable);
 
 If enabled, then the adapter should be put in a mode to also monitor messages
@@ -150,9 +150,8 @@ called if the CEC_CAP_MONITOR_ALL capability is set. This callback is optional
 Note that adap_monitor_all_enable must return 0 if enable is false.
 
 
-To enable/disable the 'monitor pin' mode:
+To enable/disable the 'monitor pin' mode::
 
-.. c:function::
 	int (*adap_monitor_pin_enable)(struct cec_adapter *adap, bool enable);
 
 If enabled, then the adapter should be put in a mode to also monitor CEC pin
@@ -163,9 +162,8 @@ the CEC_CAP_MONITOR_PIN capability is set. This callback is optional
 Note that adap_monitor_pin_enable must return 0 if enable is false.
 
 
-To program a new logical address:
+To program a new logical address::
 
-.. c:function::
 	int (*adap_log_addr)(struct cec_adapter *adap, u8 logical_addr);
 
 If logical_addr == CEC_LOG_ADDR_INVALID then all programmed logical addresses
@@ -177,9 +175,8 @@ can receive directed messages to that address.
 Note that adap_log_addr must return 0 if logical_addr is CEC_LOG_ADDR_INVALID.
 
 
-To transmit a new message:
+To transmit a new message::
 
-.. c:function::
 	int (*adap_transmit)(struct cec_adapter *adap, u8 attempts,
 			     u32 signal_free_time, struct cec_msg *msg);
 
@@ -196,17 +193,15 @@ The CEC_FREE_TIME_TO_USEC macro can be used to convert signal_free_time to
 microseconds (one data bit period is 2.4 ms).
 
 
-To log the current CEC hardware status:
+To log the current CEC hardware status::
 
-.. c:function::
 	void (*adap_status)(struct cec_adapter *adap, struct seq_file *file);
 
 This optional callback can be used to show the status of the CEC hardware.
 The status is available through debugfs: cat /sys/kernel/debug/cec/cecX/status
 
-To free any resources when the adapter is deleted:
+To free any resources when the adapter is deleted::
 
-.. c:function::
 	void (*adap_free)(struct cec_adapter *adap);
 
 This optional callback can be used to free any resources that might have been
@@ -216,15 +211,14 @@ allocated by the driver. It's called from cec_delete_adapter.
 Your adapter driver will also have to react to events (typically interrupt
 driven) by calling into the framework in the following situations:
 
-When a transmit finished (successfully or otherwise):
+When a transmit finished (successfully or otherwise)::
 
-.. c:function::
-	void cec_transmit_done(struct cec_adapter *adap, u8 status, u8 arb_lost_cnt,
-		       u8 nack_cnt, u8 low_drive_cnt, u8 error_cnt);
+	void cec_transmit_done(struct cec_adapter *adap, u8 status,
+			       u8 arb_lost_cnt,  u8 nack_cnt, u8 low_drive_cnt,
+			       u8 error_cnt);
 
-or:
+or::
 
-.. c:function::
 	void cec_transmit_attempt_done(struct cec_adapter *adap, u8 status);
 
 The status can be one of:
@@ -341,17 +335,15 @@ So this must work:
 	$ cat einj.txt >error-inj
 
 The first callback is called when this file is read and it should show the
-the current error injection state:
+the current error injection state::
 
-.. c:function::
 	int (*error_inj_show)(struct cec_adapter *adap, struct seq_file *sf);
 
 It is recommended that it starts with a comment block with basic usage
 information. It returns 0 for success and an error otherwise.
 
-The second callback will parse commands written to the ``error-inj`` file:
+The second callback will parse commands written to the ``error-inj`` file::
 
-.. c:function::
 	bool (*error_inj_parse_line)(struct cec_adapter *adap, char *line);
 
 The ``line`` argument points to the start of the command. Any leading
@@ -382,9 +374,8 @@ CEC protocol driven. The following high-level callbacks are available:
 	};
 
 The received() callback allows the driver to optionally handle a newly
-received CEC message
+received CEC message::
 
-.. c:function::
 	int (*received)(struct cec_adapter *adap, struct cec_msg *msg);
 
 If the driver wants to process a CEC message, then it can implement this
@@ -399,15 +390,14 @@ CEC framework functions
 CEC Adapter drivers can call the following CEC framework functions:
 
 .. c:function::
-	int cec_transmit_msg(struct cec_adapter *adap, struct cec_msg *msg,
-			     bool block);
+   int cec_transmit_msg(struct cec_adapter *adap, struct cec_msg *msg, \
+			bool block);
 
 Transmit a CEC message. If block is true, then wait until the message has been
 transmitted, otherwise just queue it and return.
 
 .. c:function::
-	void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr,
-			     bool block);
+   void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block);
 
 Change the physical address. This function will set adap->phys_addr and
 send an event if it has changed. If cec_s_log_addrs() has been called and
@@ -422,15 +412,15 @@ to another valid physical address, then this function will first set the
 address to CEC_PHYS_ADDR_INVALID before enabling the new physical address.
 
 .. c:function::
-	void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
-				       const struct edid *edid);
+   void cec_s_phys_addr_from_edid(struct cec_adapter *adap, \
+				  const struct edid *edid);
 
 A helper function that extracts the physical address from the edid struct
 and calls cec_s_phys_addr() with that address, or CEC_PHYS_ADDR_INVALID
 if the EDID did not contain a physical address or edid was a NULL pointer.
 
 .. c:function::
-	int cec_s_log_addrs(struct cec_adapter *adap,
+	int cec_s_log_addrs(struct cec_adapter *adap, \
 			    struct cec_log_addrs *log_addrs, bool block);
 
 Claim the CEC logical addresses. Should never be called if CEC_CAP_LOG_ADDRS
-- 
2.26.2

