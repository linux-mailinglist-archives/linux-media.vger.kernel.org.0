Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A772A0243
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgJ3KJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgJ3KJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:09:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D35C0613D6
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:09:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id w1so5809669wrm.4
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uyz54q5dHhyERRD5YHe2pc1kjOtZTM8dS6wbdOtR09U=;
        b=ZmeqJABf5IZy8178YdO3vLrv7Dev0oZlicQtRQJAFyuKorSjRs1ohgpdokuxCePQP6
         AT9c2k/9qgd7FJGrvFkPmF2kMNAeIzqUTlcHa8Ui3wx+pyZXo2f2gYQ4p0iG0np3YRGb
         DBDTmpFDif+PZ1J5huaMsN92sw96Ft3EEblkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uyz54q5dHhyERRD5YHe2pc1kjOtZTM8dS6wbdOtR09U=;
        b=r1vOrwwqhkaVdr4uR5aLp6FhQPVVhTkSgdWWdasWrfkmD+qgAsaruwETRyWwFeYRS2
         2adP3bd+/qbfLSJHJLxw/V3qO4obn4arZ/JXwKZYr0yEO/LPq1mtFi3y4VCPS17QjbSb
         Upc2XXis8B0bELN58bAA4nnUG1o42uncS9w07w9ATRBY53if4zYug+S1Brc9OTjNjP59
         kJYJbsOxoYvibTT60HZoxcbXT8BO+5tDOlzcMaXtmAIaLaLl+b/eVfdwhgB8LUytbyj8
         v6uFLPfjIKn/mIcf5HCjnHCcAjQ1VhGVcqAMZxGNz9kgv32mfGdLNhC/6wK1+VaX89o3
         LjZA==
X-Gm-Message-State: AOAM530hJoqtiUnUaj/2GrFBiM65pFR9950bBKlFp9+4kK2JVSNFtwo9
        f0jtiSrn4VzNweMeRMg4SXMGzA==
X-Google-Smtp-Source: ABdhPJxxiq57gNvMtaTh3ZESySC4gGe0ysNC/70ulYRhZee43lOQKGAF6EOP+2m6lhkPckGzWLncBg==
X-Received: by 2002:a5d:6287:: with SMTP id k7mr2062794wru.402.1604052540040;
        Fri, 30 Oct 2020 03:09:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:58 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Subject: [PATCH v5 15/15] PCI: Revoke mappings like devmem
Date:   Fri, 30 Oct 2020 11:08:15 +0100
Message-Id: <20201030100815.2269-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
the region") /dev/kmem zaps ptes when the kernel requests exclusive
acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
the default for all driver uses.

Except there's two more ways to access PCI BARs: sysfs and proc mmap
support. Let's plug that hole.

For revoke_devmem() to work we need to link our vma into the same
address_space, with consistent vma->vm_pgoff. ->pgoff is already
adjusted, because that's how (io_)remap_pfn_range works, but for the
mapping we need to adjust vma->vm_file->f_mapping. The cleanest way is
to adjust this at at ->open time:

- for sysfs this is easy, now that binary attributes support this. We
  just set bin_attr->mapping when mmap is supported
- for procfs it's a bit more tricky, since procfs pci access has only
  one file per device, and access to a specific resources first needs
  to be set up with some ioctl calls. But mmap is only supported for
  the same resources as sysfs exposes with mmap support, and otherwise
  rejected, so we can set the mapping unconditionally at open time
  without harm.

A special consideration is for arch_can_pci_mmap_io() - we need to
make sure that the ->f_mapping doesn't alias between ioport and iomem
space. There's only 2 ways in-tree to support mmap of ioports: generic
pci mmap (ARCH_GENERIC_PCI_MMAP_RESOURCE), and sparc as the single
architecture hand-rolling. Both approach support ioport mmap through a
special pfn range and not through magic pte attributes. Aliasing is
therefore not a problem.

The only difference in access checks left is that sysfs PCI mmap does
not check for CAP_RAWIO. I'm not really sure whether that should be
added or not.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2:
- Totally new approach: Adjust filp->f_mapping at open time. Note that
  this now works on all architectures, not just those support
  ARCH_GENERIC_PCI_MMAP_RESOURCE
---
 drivers/pci/pci-sysfs.c | 4 ++++
 drivers/pci/proc.c      | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index d15c881e2e7e..3f1c31bc0b7c 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -929,6 +929,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_io->read = pci_read_legacy_io;
 	b->legacy_io->write = pci_write_legacy_io;
 	b->legacy_io->mmap = pci_mmap_legacy_io;
+	b->legacy_io->mapping = iomem_get_mapping();
 	pci_adjust_legacy_attr(b, pci_mmap_io);
 	error = device_create_bin_file(&b->dev, b->legacy_io);
 	if (error)
@@ -941,6 +942,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_mem->size = 1024*1024;
 	b->legacy_mem->attr.mode = 0600;
 	b->legacy_mem->mmap = pci_mmap_legacy_mem;
+	b->legacy_io->mapping = iomem_get_mapping();
 	pci_adjust_legacy_attr(b, pci_mmap_mem);
 	error = device_create_bin_file(&b->dev, b->legacy_mem);
 	if (error)
@@ -1156,6 +1158,8 @@ static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
 			res_attr->mmap = pci_mmap_resource_uc;
 		}
 	}
+	if (res_attr->mmap)
+		res_attr->mapping = iomem_get_mapping();
 	res_attr->attr.name = res_attr_name;
 	res_attr->attr.mode = 0600;
 	res_attr->size = pci_resource_len(pdev, num);
diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 3a2f90beb4cb..9bab07302bbf 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -298,6 +298,7 @@ static int proc_bus_pci_open(struct inode *inode, struct file *file)
 	fpriv->write_combine = 0;
 
 	file->private_data = fpriv;
+	file->f_mapping = iomem_get_mapping();
 
 	return 0;
 }
-- 
2.28.0

