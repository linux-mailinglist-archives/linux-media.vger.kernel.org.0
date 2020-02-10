Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB55156F26
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 07:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbgBJGDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 01:03:24 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36470 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbgBJGDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 01:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=eNrFz6CRMRgHnFevqnlIWroPTSTbSy2UTpFunBlwins=; b=bpGtW2VUBD7wTMpbCAg9wfg/9T
        yLcnBTXkANMXsexTKSTXOyzofS6JhqCM88G2oSdWdWmCsiC53Lt9Y01vTeNYMQLEJ0SKCaw2AzfXs
        M0FfG0LuLGYQWSRAMkKEuqDvdN07NUzVITZyG65CGD7tw6dGy8h5S95cGeemSuV2XsnzMU4yv7eUf
        sBUL9TqUNYNnS0/gEiC2VzhIpTtFhP8n5ET7O6c7dzHTmQOB5fxYv/hGka7FuRFyhnRYCW9crtDdx
        ydAuixpAPiW9Ky2/PDhM9ht5o2RBKCdO1TCCUme9pKswyitgx5Wi7p9XC8TJEuwDm8qt88Txty+n2
        dxAGdaCg==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j12A5-0006V4-GB; Mon, 10 Feb 2020 06:03:13 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j12A3-00C2Wp-Qc; Mon, 10 Feb 2020 07:03:11 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 28/28] docs: virt: guest-halt-polling.txt convert to ReST
Date:   Mon, 10 Feb 2020 07:03:06 +0100
Message-Id: <f72a1d3e72274953932ef9827e5ad4def3d027b1.1581314317.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581314316.git.mchehab+huawei@kernel.org>
References: <cover.1581314316.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to some merge conflict, this file ended being alone under
Documentation/virtual.

The file itself is almost at ReST format. Just minor
adjustments are needed:

- Adjust title markup;
- Adjust a list identation;
- add a literal block markup;
- Add some blank lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../guest-halt-polling.rst}                          | 12 +++++++++---
 Documentation/virt/index.rst                         |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)
 rename Documentation/{virtual/guest-halt-polling.txt => virt/guest-halt-polling.rst} (91%)

diff --git a/Documentation/virtual/guest-halt-polling.txt b/Documentation/virt/guest-halt-polling.rst
similarity index 91%
rename from Documentation/virtual/guest-halt-polling.txt
rename to Documentation/virt/guest-halt-polling.rst
index b3a2a294532d..b4e747942417 100644
--- a/Documentation/virtual/guest-halt-polling.txt
+++ b/Documentation/virt/guest-halt-polling.rst
@@ -1,9 +1,11 @@
+==================
 Guest halt polling
 ==================
 
 The cpuidle_haltpoll driver, with the haltpoll governor, allows
 the guest vcpus to poll for a specified amount of time before
 halting.
+
 This provides the following benefits to host side polling:
 
 	1) The POLL flag is set while polling is performed, which allows
@@ -29,18 +31,21 @@ Module Parameters
 The haltpoll governor has 5 tunable module parameters:
 
 1) guest_halt_poll_ns:
+
 Maximum amount of time, in nanoseconds, that polling is
 performed before halting.
 
 Default: 200000
 
 2) guest_halt_poll_shrink:
+
 Division factor used to shrink per-cpu guest_halt_poll_ns when
 wakeup event occurs after the global guest_halt_poll_ns.
 
 Default: 2
 
 3) guest_halt_poll_grow:
+
 Multiplication factor used to grow per-cpu guest_halt_poll_ns
 when event occurs after per-cpu guest_halt_poll_ns
 but before global guest_halt_poll_ns.
@@ -48,6 +53,7 @@ but before global guest_halt_poll_ns.
 Default: 2
 
 4) guest_halt_poll_grow_start:
+
 The per-cpu guest_halt_poll_ns eventually reaches zero
 in case of an idle system. This value sets the initial
 per-cpu guest_halt_poll_ns when growing. This can
@@ -66,7 +72,7 @@ high once achieves global guest_halt_poll_ns value).
 
 Default: Y
 
-The module parameters can be set from the debugfs files in:
+The module parameters can be set from the debugfs files in::
 
 	/sys/module/haltpoll/parameters/
 
@@ -74,5 +80,5 @@ Further Notes
 =============
 
 - Care should be taken when setting the guest_halt_poll_ns parameter as a
-large value has the potential to drive the cpu usage to 100% on a machine which
-would be almost entirely idle otherwise.
+  large value has the potential to drive the cpu usage to 100% on a machine
+  which would be almost entirely idle otherwise.
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 0a8f7fda64ad..de1ab81df958 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -10,6 +10,7 @@ Linux Virtualization Support
    kvm/index
    uml/user_mode_linux
    paravirt_ops
+   guest-halt-polling
 
 .. only:: html and subproject
 
-- 
2.24.1

