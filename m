Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC312C69C4
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbgK0QmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731150AbgK0QmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:42:14 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B63C0617A7
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:42:13 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id z7so6207324wrn.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rW60Jo5EYOrfW48enxn4HuDZHwz18Yu4cEXjV+kmxhI=;
        b=PQkuXj5frTE5y11eiKAgq79LrIZ8tE/zx4eh3eEZQp6giLCWCHkekWBtjZn+b6apiX
         OettDGs7KeV6c1u5GVEgBTyePxi+k0YgxvAkEqvC0lu/PHO5FoD5SaGsKYrsR8iraWxV
         gzEOq3melTr0FDtkd450cWQdzdipC9arwKkow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rW60Jo5EYOrfW48enxn4HuDZHwz18Yu4cEXjV+kmxhI=;
        b=qPUvrNy2L/pdRUJyMSA7kB2y1BVS91b1VYTyvHMFrA3FSeAJ+UeudIpDq13Z81oyDH
         Yf/M6ctn6yKZS0XQs9aIT9GZ9MnPNWmD+NMIc1yysgv+xN/Y6y6BigCWA877F9ilgYDy
         E9TbJNjA1Psi7c8itaeedJnBs9pgFMg0wIIs9mgZ6QR8Lfj06+h/4at23VqqW1lxOpRF
         YpnHxCBstlYr8rczS3KtKqumMEdMWNWljW/cMlqMDd4BRuHL5UtK2MkqghrY1tQd5Uac
         SqSgEIrJ0OC2W0EcWOjWrXZw6eOTxonR7fFEDlVgTrFTNqKTfyRhlBZO42gCYX1eOA/z
         UpLg==
X-Gm-Message-State: AOAM533rsgaPHCU/nMdE70bUH6DTU/nLPDqgLgGyf7B6GR/o+0JKPtRH
        F7JVg/+CbOmC7Jnqi54xdRWJhg==
X-Google-Smtp-Source: ABdhPJy7N8sWlvrZkrO6DwKDVYKhPGfBm7BDjLJVeT6c/8cd28+5xGF25PU+qwVqK2WiY3xNRptmuw==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr11762819wrp.201.1606495332522;
        Fri, 27 Nov 2020 08:42:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:42:11 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Nayna Jain <nayna@linux.ibm.com>
Subject: [PATCH v7 11/17] sysfs: Support zapping of binary attr mmaps
Date:   Fri, 27 Nov 2020 17:41:25 +0100
Message-Id: <20201127164131.2244124-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We want to be able to revoke pci mmaps so that the same access rules
applies as for /dev/kmem. Revoke support for devmem was added in
3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the
region").

The simplest way to achieve this is by having the same filp->f_mapping
for all mappings, so that unmap_mapping_range can find them all, no
matter through which file they've been created. Since this must be set
at open time we need sysfs support for this.

Add an optional mapping parameter bin_attr, which is only consulted
when there's also an mmap callback, since without mmap support
allowing to adjust the ->f_mapping makes no sense.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 fs/sysfs/file.c       | 11 +++++++++++
 include/linux/sysfs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 96d0da65e088..9aefa7779b29 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -170,6 +170,16 @@ static int sysfs_kf_bin_mmap(struct kernfs_open_file *of,
 	return battr->mmap(of->file, kobj, battr, vma);
 }
 
+static int sysfs_kf_bin_open(struct kernfs_open_file *of)
+{
+	struct bin_attribute *battr = of->kn->priv;
+
+	if (battr->mapping)
+		of->file->f_mapping = battr->mapping;
+
+	return 0;
+}
+
 void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr)
 {
 	struct kernfs_node *kn = kobj->sd, *tmp;
@@ -241,6 +251,7 @@ static const struct kernfs_ops sysfs_bin_kfops_mmap = {
 	.read		= sysfs_kf_bin_read,
 	.write		= sysfs_kf_bin_write,
 	.mmap		= sysfs_kf_bin_mmap,
+	.open		= sysfs_kf_bin_open,
 };
 
 int sysfs_add_file_mode_ns(struct kernfs_node *parent,
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 2caa34c1ca1a..d76a1ddf83a3 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -164,11 +164,13 @@ __ATTRIBUTE_GROUPS(_name)
 
 struct file;
 struct vm_area_struct;
+struct address_space;
 
 struct bin_attribute {
 	struct attribute	attr;
 	size_t			size;
 	void			*private;
+	struct address_space	*mapping;
 	ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
 			char *, loff_t, size_t);
 	ssize_t (*write)(struct file *, struct kobject *, struct bin_attribute *,
-- 
2.29.2

