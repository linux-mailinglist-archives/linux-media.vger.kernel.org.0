Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003E72949C0
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441177AbgJUI5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502422AbgJUI5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:30 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDF5C0613A8
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:27 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s9so2075912wro.8
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ylZkHmK3aE1VlYRsGRUx3nUrnQWYBOnVeS+ToU4JUCI=;
        b=D88rd5JfQWap5HZksMfg9cXMMl3QwJVhjS6+VSQvUjjDd24gp69dQjtY144venALwF
         VsrNY/8fJu7KcREUK2gdnkvUKz4v4CFfNVYD7BE7l4swdssS9MrlGthSCyyUQikNqz1t
         3VSJEkLS9OteyMKDcMhL8pGN2qtRl9K89wcCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ylZkHmK3aE1VlYRsGRUx3nUrnQWYBOnVeS+ToU4JUCI=;
        b=OEMHCEZstFLugyesUQ/giUbMm7FxyUXhG+r9l/lEaQXATbEAqRix5FMdDAX6QosabV
         bVkBgsVXwhRnDuuHqSfe1DS4I/+3gsyPKuJNF6fRi4bCO2icybe6RwmgflDnldeXpvU/
         aSZ+ZhWGmt4+q+Cxh6HVyTeIrX1/DEtx/sIJSF5/65kOvNxKVWVBcS9O81BtFzqi0j3h
         AUGihvU6tYKtgFkEPA0FI/mID/Sdqd8WPuK0pSNujtyE/AD/5D5My29NXgGRVRpeUQx0
         BzT1zxUP2PaKl01LuyzH+SaRtokLeR12I3q1aK0zT6keXuksUMDxb97wtzfdOCcPWQP9
         fHVw==
X-Gm-Message-State: AOAM530Kb2JnCN1j4k4kWDGpTfpiLncqLg1PbcFqch3gQR04clGSIt9M
        QDiX1Ue7jFPlB4saSGFXZ0r5GQ==
X-Google-Smtp-Source: ABdhPJyRYpgvahsTCZYVhKWO7YaUqSYEiS71WxybX5MQOWBTVSJxRg21hOuSPVSQTJs5khc2TIcK9w==
X-Received: by 2002:adf:f810:: with SMTP id s16mr3280019wrp.424.1603270646012;
        Wed, 21 Oct 2020 01:57:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:25 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.com>
Subject: [PATCH v3 16/16] PCI: Revoke mappings like devmem
Date:   Wed, 21 Oct 2020 10:56:55 +0200
Message-Id: <20201021085655.1192025-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
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
index 6d78df981d41..cee38fcb4a86 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -928,6 +928,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_io->read = pci_read_legacy_io;
 	b->legacy_io->write = pci_write_legacy_io;
 	b->legacy_io->mmap = pci_mmap_legacy_io;
+	b->legacy_io->mapping = iomem_get_mapping();
 	pci_adjust_legacy_attr(b, pci_mmap_io);
 	error = device_create_bin_file(&b->dev, b->legacy_io);
 	if (error)
@@ -940,6 +941,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_mem->size = 1024*1024;
 	b->legacy_mem->attr.mode = 0600;
 	b->legacy_mem->mmap = pci_mmap_legacy_mem;
+	b->legacy_io->mapping = iomem_get_mapping();
 	pci_adjust_legacy_attr(b, pci_mmap_mem);
 	error = device_create_bin_file(&b->dev, b->legacy_mem);
 	if (error)
@@ -1155,6 +1157,8 @@ static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
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

