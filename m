Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1E21546C1
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 15:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgBFOvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 09:51:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55410 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbgBFOug (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 09:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=CFTgqqR2acxHA5DJomm2PAamk9pZ/zM9hwGQ2WMtNfY=; b=JleqWJzuQMdqgilcjxy2q0YU3p
        Zy28uGKU9tvzuIds0rI4IO7SfN6BFcLn7mfla3HzvwJyvHDa0Z9S/I3y6mqXg2Cb4C4MpyQO4SXuV
        VGPacStQh+oUTjE84Go67+OqnGS0EQb72LpreKnq3Q6s4IuJCslUiuRvpefh8F5ki6MnOaGvyhGrq
        k4jCcCAQJwtr4/Tm1UHsJaVWS2/UmhwRpr9ZTQZYS1E1hdrSN+IGybq22EQ30JQeH+R+pbA8QkhkY
        oiM7tPwCaPDszRwwdkWS2S835N1xXc2SWyqaTczNHoaNMImot1L8MCNMCJAehSaC3mLW9TpQunedW
        iA8lxqVw==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iziUE-0004IX-QJ; Thu, 06 Feb 2020 14:50:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iziU6-002nKI-5y; Thu, 06 Feb 2020 15:50:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-doc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Richard Weinberger <richard@nod.at>,
        Jeff Dike <jdike@addtoit.com>, kvm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-um@lists.infradead.org
Subject: [PATCH v2 00/27] docs: virt: manually convert text documents to ReST format
Date:   Thu,  6 Feb 2020 15:49:57 +0100
Message-Id: <cover.1581000481.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Manually convert the documentation under Documentation/virt to ReST,
minimizing the usage of uneeded markups and preserving the documentation
writer's style.

PS.: Patches are against linux-next tree (20200204).

v2:

- Solved a conflict with linux-next;
- Added SPDX headers.

Mauro Carvalho Chehab (27):
  docs: kvm: add arm/pvtime.rst to index.rst
  docs: virt: convert UML documentation to ReST
  docs: virt: user_mode_linux.rst: update compiling instructions
  docs: virt: user_mode_linux.rst: fix URL references
  docs: virt: convert halt-polling.txt to ReST format
  docs: virt: Convert msr.txt to ReST format
  docs: kvm: devices/arm-vgic-its.txt to ReST format
  docs: kvm: devices/arm-vgit-v3.txt to ReST
  docs: kvm: convert devices/arm-vgit.txt to ReST
  docs: kvm: convert devices/mpic.txt to ReST
  docs: kvm: convert devices/s390_flic.txt to ReST
  docs: kvm: convert devices/vcpu.txt to ReST
  docs: kvm: convert devices/vcpu.txt to ReST
  docs: kvm: convert devices/vm.txt to ReST
  docs: kvm: convert devices/xics.txt to ReST
  docs: kvm: convert devices/xive.txt to ReST
  docs: kvm: Convert api.txt to ReST format
  docs: kvm: convert arm/hyp-abi.txt to ReST
  docs: kvm: arm/psci.txt: convert to ReST
  docs: kvm: Convert hypercalls.txt to ReST format
  docs: kvm: Convert locking.txt to ReST format
  docs: kvm: Convert mmu.txt to ReST format
  docs: kvm: Convert nested-vmx.txt to ReST format
  docs: kvm: Convert ppc-pv.txt to ReST format
  docs: kvm: Convert s390-diag.txt to ReST format
  docs: kvm: Convert timekeeping.txt to ReST format
  docs: kvm: review-checklist.txt: rename to ReST

 Documentation/virt/index.rst                  |    1 +
 Documentation/virt/kvm/{api.txt => api.rst}   | 3348 ++++++++++-------
 .../virt/kvm/arm/{hyp-abi.txt => hyp-abi.rst} |   28 +-
 Documentation/virt/kvm/arm/index.rst          |   12 +
 .../virt/kvm/arm/{psci.txt => psci.rst}       |   46 +-
 .../{arm-vgic-its.txt => arm-vgic-its.rst}    |  106 +-
 .../{arm-vgic-v3.txt => arm-vgic-v3.rst}      |  132 +-
 .../devices/{arm-vgic.txt => arm-vgic.rst}    |   89 +-
 Documentation/virt/kvm/devices/index.rst      |   19 +
 .../virt/kvm/devices/{mpic.txt => mpic.rst}   |   11 +-
 .../devices/{s390_flic.txt => s390_flic.rst}  |   70 +-
 Documentation/virt/kvm/devices/vcpu.rst       |  114 +
 Documentation/virt/kvm/devices/vcpu.txt       |   76 -
 .../virt/kvm/devices/{vfio.txt => vfio.rst}   |   25 +-
 .../virt/kvm/devices/{vm.txt => vm.rst}       |  206 +-
 .../virt/kvm/devices/{xics.txt => xics.rst}   |   28 +-
 .../virt/kvm/devices/{xive.txt => xive.rst}   |  148 +-
 .../{halt-polling.txt => halt-polling.rst}    |   86 +-
 .../kvm/{hypercalls.txt => hypercalls.rst}    |  129 +-
 Documentation/virt/kvm/index.rst              |   16 +
 .../virt/kvm/{locking.txt => locking.rst}     |  111 +-
 Documentation/virt/kvm/{mmu.txt => mmu.rst}   |   62 +-
 Documentation/virt/kvm/{msr.txt => msr.rst}   |  147 +-
 .../kvm/{nested-vmx.txt => nested-vmx.rst}    |   37 +-
 .../virt/kvm/{ppc-pv.txt => ppc-pv.rst}       |   26 +-
 ...iew-checklist.txt => review-checklist.rst} |    3 +
 .../virt/kvm/{s390-diag.txt => s390-diag.rst} |   13 +-
 .../kvm/{timekeeping.txt => timekeeping.rst}  |  221 +-
 ...odeLinux-HOWTO.txt => user_mode_linux.rst} | 1814 ++++-----
 29 files changed, 4003 insertions(+), 3121 deletions(-)
 rename Documentation/virt/kvm/{api.txt => api.rst} (71%)
 rename Documentation/virt/kvm/arm/{hyp-abi.txt => hyp-abi.rst} (79%)
 create mode 100644 Documentation/virt/kvm/arm/index.rst
 rename Documentation/virt/kvm/arm/{psci.txt => psci.rst} (60%)
 rename Documentation/virt/kvm/devices/{arm-vgic-its.txt => arm-vgic-its.rst} (71%)
 rename Documentation/virt/kvm/devices/{arm-vgic-v3.txt => arm-vgic-v3.rst} (77%)
 rename Documentation/virt/kvm/devices/{arm-vgic.txt => arm-vgic.rst} (66%)
 create mode 100644 Documentation/virt/kvm/devices/index.rst
 rename Documentation/virt/kvm/devices/{mpic.txt => mpic.rst} (91%)
 rename Documentation/virt/kvm/devices/{s390_flic.txt => s390_flic.rst} (87%)
 create mode 100644 Documentation/virt/kvm/devices/vcpu.rst
 delete mode 100644 Documentation/virt/kvm/devices/vcpu.txt
 rename Documentation/virt/kvm/devices/{vfio.txt => vfio.rst} (72%)
 rename Documentation/virt/kvm/devices/{vm.txt => vm.rst} (61%)
 rename Documentation/virt/kvm/devices/{xics.txt => xics.rst} (84%)
 rename Documentation/virt/kvm/devices/{xive.txt => xive.rst} (62%)
 rename Documentation/virt/kvm/{halt-polling.txt => halt-polling.rst} (64%)
 rename Documentation/virt/kvm/{hypercalls.txt => hypercalls.rst} (55%)
 rename Documentation/virt/kvm/{locking.txt => locking.rst} (78%)
 rename Documentation/virt/kvm/{mmu.txt => mmu.rst} (94%)
 rename Documentation/virt/kvm/{msr.txt => msr.rst} (74%)
 rename Documentation/virt/kvm/{nested-vmx.txt => nested-vmx.rst} (90%)
 rename Documentation/virt/kvm/{ppc-pv.txt => ppc-pv.rst} (91%)
 rename Documentation/virt/kvm/{review-checklist.txt => review-checklist.rst} (95%)
 rename Documentation/virt/kvm/{s390-diag.txt => s390-diag.rst} (90%)
 rename Documentation/virt/kvm/{timekeeping.txt => timekeeping.rst} (85%)
 rename Documentation/virt/uml/{UserModeLinux-HOWTO.txt => user_mode_linux.rst} (74%)

-- 
2.24.1


