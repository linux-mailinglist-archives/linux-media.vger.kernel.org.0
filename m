Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 619EA156F5A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 07:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgBJGEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 01:04:10 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36286 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgBJGDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 01:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=VDWufxS1v8YBATfJuGUc8vM6jGy82+VrkVyMthw2XNA=; b=g6FpWmZvYn4j+gzfOlrxqCU77m
        MnHEEgBSSLDmR08Pp5ZU49/KqtejgFB4bVsXJnSo8jctvAiqgp0HHZ8Cxx+OqIXKEQ/b9VjMlJi4M
        07Rb9orVO9zRaRedJhEuIbSXrTgDOCGrah63jEho/d8hVpYKJN8z4ljKpbWIrhJQCP+61SS3GnVeP
        U61T2MFDVQGdZktt8e33Umjyw/oZjq3Xi7KiIM6LoGYEGrHpjc7OUEWlRN9qk59jtC7i9WbMp9wy0
        QWYMwi+i1hYekAkA71IsXftKEF7qpzokgrWDDv0pJtdvLkVglkLvhcGRusoemkwm6AtsmGLGkrxYi
        hr04jZMw==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j12A3-0006Tf-II; Mon, 10 Feb 2020 06:03:11 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j12A1-00C2Ux-Sx; Mon, 10 Feb 2020 07:03:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 05/28] docs: virt: convert halt-polling.txt to ReST format
Date:   Mon, 10 Feb 2020 07:02:43 +0100
Message-Id: <c3de1c2b726a5df1e3616e53cb118a46025bc635.1581314316.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581314316.git.mchehab+huawei@kernel.org>
References: <cover.1581314316.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Fix document title to match ReST format
- Convert the table to be properly recognized
- Some indentation fixes to match ReST syntax.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 .../{halt-polling.txt => halt-polling.rst}    | 86 ++++++++++---------
 Documentation/virt/kvm/index.rst              |  1 +
 2 files changed, 46 insertions(+), 41 deletions(-)
 rename Documentation/virt/kvm/{halt-polling.txt => halt-polling.rst} (64%)

diff --git a/Documentation/virt/kvm/halt-polling.txt b/Documentation/virt/kvm/halt-polling.rst
similarity index 64%
rename from Documentation/virt/kvm/halt-polling.txt
rename to Documentation/virt/kvm/halt-polling.rst
index 4f791b128dd2..4922e4a15f18 100644
--- a/Documentation/virt/kvm/halt-polling.txt
+++ b/Documentation/virt/kvm/halt-polling.rst
@@ -1,3 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
 The KVM halt polling system
 ===========================
 
@@ -68,7 +71,8 @@ steady state polling interval but will only really do a good job for wakeups
 which come at an approximately constant rate, otherwise there will be constant
 adjustment of the polling interval.
 
-[0] total block time: the time between when the halt polling function is
+[0] total block time:
+		      the time between when the halt polling function is
 		      invoked and a wakeup source received (irrespective of
 		      whether the scheduler is invoked within that function).
 
@@ -81,31 +85,32 @@ shrunk. These variables are defined in include/linux/kvm_host.h and as module
 parameters in virt/kvm/kvm_main.c, or arch/powerpc/kvm/book3s_hv.c in the
 powerpc kvm-hv case.
 
-Module Parameter	|   Description		    |	     Default Value
---------------------------------------------------------------------------------
-halt_poll_ns		| The global max polling    | KVM_HALT_POLL_NS_DEFAULT
-			| interval which defines    |
-			| the ceiling value of the  |
-			| polling interval for      | (per arch value)
-			| each vcpu.		    |
---------------------------------------------------------------------------------
-halt_poll_ns_grow	| The value by which the    | 2
-			| halt polling interval is  |
-			| multiplied in the	    |
-			| grow_halt_poll_ns()	    |
-			| function.		    |
---------------------------------------------------------------------------------
-halt_poll_ns_grow_start | The initial value to grow | 10000
-			| to from zero in the	    |
-			| grow_halt_poll_ns()	    |
-			| function.		    |
---------------------------------------------------------------------------------
-halt_poll_ns_shrink	| The value by which the    | 0
-			| halt polling interval is  |
-			| divided in the	    |
-			| shrink_halt_poll_ns()	    |
-			| function.		    |
---------------------------------------------------------------------------------
++-----------------------+---------------------------+-------------------------+
+|Module Parameter	|   Description		    |	     Default Value    |
++-----------------------+---------------------------+-------------------------+
+|halt_poll_ns		| The global max polling    | KVM_HALT_POLL_NS_DEFAULT|
+|			| interval which defines    |			      |
+|			| the ceiling value of the  |			      |
+|			| polling interval for      | (per arch value)	      |
+|			| each vcpu.		    |			      |
++-----------------------+---------------------------+-------------------------+
+|halt_poll_ns_grow	| The value by which the    | 2			      |
+|			| halt polling interval is  |			      |
+|			| multiplied in the	    |			      |
+|			| grow_halt_poll_ns()	    |			      |
+|			| function.		    |			      |
++-----------------------+---------------------------+-------------------------+
+|halt_poll_ns_grow_start| The initial value to grow | 10000		      |
+|			| to from zero in the	    |			      |
+|			| grow_halt_poll_ns()	    |			      |
+|			| function.		    |			      |
++-----------------------+---------------------------+-------------------------+
+|halt_poll_ns_shrink	| The value by which the    | 0			      |
+|			| halt polling interval is  |			      |
+|			| divided in the	    |			      |
+|			| shrink_halt_poll_ns()	    |			      |
+|			| function.		    |			      |
++-----------------------+---------------------------+-------------------------+
 
 These module parameters can be set from the debugfs files in:
 
@@ -117,20 +122,19 @@ Note: that these module parameters are system wide values and are not able to
 Further Notes
 =============
 
-- Care should be taken when setting the halt_poll_ns module parameter as a
-large value has the potential to drive the cpu usage to 100% on a machine which
-would be almost entirely idle otherwise. This is because even if a guest has
-wakeups during which very little work is done and which are quite far apart, if
-the period is shorter than the global max polling interval (halt_poll_ns) then
-the host will always poll for the entire block time and thus cpu utilisation
-will go to 100%.
+- Care should be taken when setting the halt_poll_ns module parameter as a large value
+  has the potential to drive the cpu usage to 100% on a machine which would be almost
+  entirely idle otherwise. This is because even if a guest has wakeups during which very
+  little work is done and which are quite far apart, if the period is shorter than the
+  global max polling interval (halt_poll_ns) then the host will always poll for the
+  entire block time and thus cpu utilisation will go to 100%.
 
-- Halt polling essentially presents a trade off between power usage and latency
-and the module parameters should be used to tune the affinity for this. Idle
-cpu time is essentially converted to host kernel time with the aim of decreasing
-latency when entering the guest.
+- Halt polling essentially presents a trade off between power usage and latency and
+  the module parameters should be used to tune the affinity for this. Idle cpu time is
+  essentially converted to host kernel time with the aim of decreasing latency when
+  entering the guest.
 
-- Halt polling will only be conducted by the host when no other tasks are
-runnable on that cpu, otherwise the polling will cease immediately and
-schedule will be invoked to allow that other task to run. Thus this doesn't
-allow a guest to denial of service the cpu.
+- Halt polling will only be conducted by the host when no other tasks are runnable on
+  that cpu, otherwise the polling will cease immediately and schedule will be invoked to
+  allow that other task to run. Thus this doesn't allow a guest to denial of service the
+  cpu.
diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index 488c6370a447..b39f4894b61d 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -9,6 +9,7 @@ KVM
 
    amd-memory-encryption
    cpuid
+   halt-polling
    vcpu-requests
 
    arm/index
-- 
2.24.1

