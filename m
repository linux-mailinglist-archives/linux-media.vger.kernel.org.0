Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06E344094F
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 15:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbhJ3OAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 10:00:45 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:25328 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhJ3OAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 10:00:44 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HhLMw5sNWzbhJn;
        Sat, 30 Oct 2021 21:52:44 +0800 (CST)
Received: from SZX1000464847.huawei.com (10.21.59.169) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Sat, 30 Oct 2021 21:57:26 +0800
From:   Dongdong Liu <liudongdong3@huawei.com>
To:     <helgaas@kernel.org>, <hch@infradead.org>, <kw@linux.com>,
        <logang@deltatee.com>, <leon@kernel.org>,
        <linux-pci@vger.kernel.org>, <rajur@chelsio.com>,
        <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH V11 0/8] PCI: Enable 10-Bit tag support for PCIe devices
Date:   Sat, 30 Oct 2021 21:53:40 +0800
Message-ID: <20211030135348.61364-1-liudongdong3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.21.59.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

10-Bit Tag capability, introduced in PCIe-4.0 increases the total Tag
field size from 8 bits to 10 bits.

This patchset is to enable 10-Bit tag for PCIe EP devices (include VF).

V10->V11:
- Rebased on V5.15-rc7.
- Rename sysfs file 10bit_tag to tags.
- Fix some other comments suggested by Bjorn.

V9->V10:
- Rebased on V5.15-rc4.
- Fix some commets suggested by Krzysztof.

V8->V9:
- Rebased on V5.15-rc2.
- Rename pcie_devcap to devcap, pcie_devcap2 to devcap2 to keep the same
  style with commit 691392448065 ("PCI: Cache PCIe Device Capabilities
  register").

V7->V8:
- Add a kernel parameter pcie_tag_peer2peer to disable 10-bit tags.
- Provide sysfs file to enable 10-bit tags.
- Remove [PATCH V7 6/9] PCI: Enable 10-Bit Tag support for PCIe RP devices.
- Rebased on v5.14-rc6.
- Fix some other comments. Thanks to Bjorn who gave a lot of review comments.

V6->V7:
- Rebased on v5.14-rc3.
- Change the "pci=disable_10bit_tag=" parameter to sysfs file to disable
  10-Bit Tag Requester when need for p2pdma suggested by Leon.
- Fix comment for p2pdma 10-bit tag check.

V5->V6:
- Rebased on v5.14-rc2.
- Add Reviewed-by: Christoph Hellwig <hch@lst.de> in [PATCH V6 2/8].
- PCI: Add "pci=disable_10bit_tag=" parameter for peer-to-peer support.
- Add a 10-bit tag check in P2PDMA.
- Simplified implementation in [PATCH V6 6/8].
- Fix some comments in [PATCH V6 4/8].

V4->V5:
- Fix warning variable 'capa' is uninitialized.
- Fix warning unused variable 'pchild'.

V3->V4:
- Get the value of pcie_devcap2 in set_pcie_port_type().
- Add Reviewed-by: Christoph Hellwig <hch@lst.de> in [PATCH V4 1/6],
  [PATCH V4 3/6], [PATCH V4 4/6], [PATCH V4 5/6].
- Fix some code style.
- Rebased on v5.13-rc6.

V2->V3:
- Use cached Device Capabilities Register suggested by Christoph.
- Fix code style to avoid > 80 char lines.
- Rename devcap2 to pcie_devcap2.

V1->V2: Fix some comments by Christoph.
- Store the devcap2 value in the pci_dev instead of reading it multiple
  times.
- Change pci_info to pci_dbg to avoid the noisy log.
- Rename ext_10bit_tag_comp_path to ext_10bit_tag.
- Fix the compile error.
- Rebased on v5.13-rc1.

Dongdong Liu (8):
  PCI: Use cached devcap in more places
  PCI: Cache Device Capabilities 2 Register
  PCI: Add 10-Bit Tag register definitions
  PCI/sysfs: Add a tags sysfs file for PCIe Endpoint devices
  PCI/IOV: Add tags sysfs files for VF devices
  PCI/P2PDMA: Add a 10-Bit Tag check in P2PDMA
  PCI: Enable 10-Bit Tag support for PCIe Endpoint device
  PCI/IOV: Enable 10-Bit Tag support for PCIe VF devices

 Documentation/ABI/testing/sysfs-bus-pci       | 56 +++++++++++-
 .../admin-guide/kernel-parameters.txt         |  5 +
 drivers/media/pci/cobalt/cobalt-driver.c      |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  4 +-
 drivers/pci/iov.c                             | 84 +++++++++++++++++
 drivers/pci/p2pdma.c                          | 48 ++++++++++
 drivers/pci/pci-sysfs.c                       | 91 +++++++++++++++++++
 drivers/pci/pci.c                             | 12 ++-
 drivers/pci/pci.h                             |  9 ++
 drivers/pci/pcie/aspm.c                       | 11 +--
 drivers/pci/probe.c                           | 75 ++++++++++++---
 drivers/pci/quirks.c                          |  3 +-
 include/linux/pci.h                           |  1 +
 include/uapi/linux/pci_regs.h                 |  5 +
 14 files changed, 377 insertions(+), 31 deletions(-)

--
2.22.0

