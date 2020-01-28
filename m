Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE2C14BC32
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 15:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgA1Ova (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 09:51:30 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgA1N6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 08:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=c3O1qU0BaMW0VdPESODOU6k7pCSNM7sfr+uBlXdB8Yc=; b=lQHC2mTvqddMIlJFDkKRR0OVts
        q/bN8rxHqwIJuNjVvYzMwXlnqNDuaJ83M+53U3tDfnvS1yasGoYIZIek2a2a35NksTaI6r246R9MQ
        dRDn1JcV655Qyod4IzHI/UnGGHyJlflklB3unGke1Z6b2kt/liERpZN+eeBVOMAhgALzsdocy8MCS
        SdRGniaO4EOtFUz3gpl3bQ/Qk89S+u6CNXBNKIVwfyl3RUk8woQ5l8mF3+kW9HvD7Hai6OvZdWxym
        Gr/PPp2DvgNkhowlyjzzVeqg920r17JtPPM6XxtM83WAbglAVW27wwVYn8PGkmcDhQb6v8+5CsmyD
        yvzz7lhw==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRO7-0006Hy-31; Tue, 28 Jan 2020 13:58:43 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRNq-001BKP-Of; Tue, 28 Jan 2020 14:58:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 19/27] docs: kvm: arm/psci.txt: convert to ReST
Date:   Tue, 28 Jan 2020 14:58:15 +0100
Message-Id: <cfd61af2a61678bbde6394dc5bcfe2e82bc26da4.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Add a title for the document;
- Adjust whitespaces for it to be properly formatted after
  parsed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/arm/index.rst          |  1 +
 .../virt/kvm/arm/{psci.txt => psci.rst}       | 44 ++++++++++++-------
 2 files changed, 30 insertions(+), 15 deletions(-)
 rename Documentation/virt/kvm/arm/{psci.txt => psci.rst} (61%)

diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
index 134fa5fa77e5..3e2b2aba90fc 100644
--- a/Documentation/virt/kvm/arm/index.rst
+++ b/Documentation/virt/kvm/arm/index.rst
@@ -8,4 +8,5 @@ ARM
    :maxdepth: 2
 
    hyp-abi
+   psci
    pvtime
diff --git a/Documentation/virt/kvm/arm/psci.txt b/Documentation/virt/kvm/arm/psci.rst
similarity index 61%
rename from Documentation/virt/kvm/arm/psci.txt
rename to Documentation/virt/kvm/arm/psci.rst
index 559586fc9d37..5cdf8fb86779 100644
--- a/Documentation/virt/kvm/arm/psci.txt
+++ b/Documentation/virt/kvm/arm/psci.rst
@@ -1,3 +1,7 @@
+=========================================
+Power State Coordination Interface (PSCI)
+=========================================
+
 KVM implements the PSCI (Power State Coordination Interface)
 specification in order to provide services such as CPU on/off, reset
 and power-off to the guest.
@@ -30,32 +34,42 @@ The following register is defined:
   - Affects the whole VM (even if the register view is per-vcpu)
 
 * KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1:
-  Holds the state of the firmware support to mitigate CVE-2017-5715, as
-  offered by KVM to the guest via a HVC call. The workaround is described
-  under SMCCC_ARCH_WORKAROUND_1 in [1].
+    Holds the state of the firmware support to mitigate CVE-2017-5715, as
+    offered by KVM to the guest via a HVC call. The workaround is described
+    under SMCCC_ARCH_WORKAROUND_1 in [1].
+
   Accepted values are:
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1_NOT_AVAIL: KVM does not offer
+
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1_NOT_AVAIL:
+      KVM does not offer
       firmware support for the workaround. The mitigation status for the
       guest is unknown.
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1_AVAIL: The workaround HVC call is
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1_AVAIL:
+      The workaround HVC call is
       available to the guest and required for the mitigation.
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1_NOT_REQUIRED: The workaround HVC call
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1_NOT_REQUIRED:
+      The workaround HVC call
       is available to the guest, but it is not needed on this VCPU.
 
 * KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2:
-  Holds the state of the firmware support to mitigate CVE-2018-3639, as
-  offered by KVM to the guest via a HVC call. The workaround is described
-  under SMCCC_ARCH_WORKAROUND_2 in [1].
+    Holds the state of the firmware support to mitigate CVE-2018-3639, as
+    offered by KVM to the guest via a HVC call. The workaround is described
+    under SMCCC_ARCH_WORKAROUND_2 in [1]_.
+
   Accepted values are:
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_NOT_AVAIL: A workaround is not
+
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_NOT_AVAIL:
+      A workaround is not
       available. KVM does not offer firmware support for the workaround.
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_UNKNOWN: The workaround state is
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_UNKNOWN:
+      The workaround state is
       unknown. KVM does not offer firmware support for the workaround.
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_AVAIL: The workaround is available,
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_AVAIL:
+      The workaround is available,
       and can be disabled by a vCPU. If
       KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_ENABLED is set, it is active for
       this vCPU.
-    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_NOT_REQUIRED: The workaround is
-      always active on this vCPU or it is not needed.
+    KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2_NOT_REQUIRED:
+      The workaround is always active on this vCPU or it is not needed.
 
-[1] https://developer.arm.com/-/media/developer/pdf/ARM_DEN_0070A_Firmware_interfaces_for_mitigating_CVE-2017-5715.pdf
+.. [1] https://developer.arm.com/-/media/developer/pdf/ARM_DEN_0070A_Firmware_interfaces_for_mitigating_CVE-2017-5715.pdf
-- 
2.24.1

