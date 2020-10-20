Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE57D286511
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbgJGQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728425AbgJGQor (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:44:47 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622CEC0613D5
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 09:44:47 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h7so2992382wre.4
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P02GBIE7m0UGj1Ja16VfRtl1rny8rrQDbz10f0cDTbo=;
        b=jOfg2aPb+p2PctbbcpGPk2VTV8x+SKSCmFeHr5kNnGpMzP9+KndzTdMPcmKSmVIBOL
         Sn8AtpmXpRju+60FUKJKw5WoTBtH4QSJvymhz/0+3ZeCxQuRUo3jPklVq4Ib9EuOwEj2
         sPoeQoG2BgasR1J/L7Iui7jQ8XopY468hCzwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P02GBIE7m0UGj1Ja16VfRtl1rny8rrQDbz10f0cDTbo=;
        b=cjZOU4tb0UV42mllo6r8xDblZ7l24ob0Hen68HCJkmVjVKQweKK9LSKY6gbWJUwGdP
         Qu7u3aQ4fePjEYaWqSEtSBHKbQYG+xGTBABuBhb4xge/DNOUdGqvnHnI966TZzT2SZtt
         ysl5fzGlZMDy19v5LAGpCaaH72kqglmVHG3cg+M/Y+JSc9NDyXo3mpITxlrV6b2DkG0j
         vn+GXfkybCLQlTjm9E4Wi17FssKmWa6t1o52G2AxIip4ZCmHMZLLLItyEH6JZoBAEZzy
         QvoA/H7fIgl4tI/IwO8ozpJZeuMk8lPJzcBjiEmmZGWOcfEn/+1d5vUri23sPi8N6m4g
         pLCg==
X-Gm-Message-State: AOAM532CwjxuOO4FrjdefQR4m7FWW4wQDtDdFKLB7TxTJimvmFtjmhCq
        I4ikyuTExIDsJ/HRUzTo/c9TcQ==
X-Google-Smtp-Source: ABdhPJzCDfyCaOqONShrGzC8VJoQgNBmutXD42q/UwtrqERpH1arTrrensBhgkJDw5zkDOp6xBcjVA==
X-Received: by 2002:adf:ba4f:: with SMTP id t15mr4383017wrg.335.1602089086053;
        Wed, 07 Oct 2020 09:44:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:45 -0700 (PDT)
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
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org
Subject: [PATCH 09/13] PCI: obey iomem restrictions for procfs mmap
Date:   Wed,  7 Oct 2020 18:44:22 +0200
Message-Id: <20201007164426.1812530-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's three ways to access pci bars from userspace: /dev/mem, sysfs
files, and the old proc interface. Two check against
iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
this starts to matter, since we don't want random userspace having
access to pci bars while a driver is loaded and using it.

Fix this.

References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
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
---
 drivers/pci/proc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index d35186b01d98..3a2f90beb4cb 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -274,6 +274,11 @@ static int proc_bus_pci_mmap(struct file *file, struct vm_area_struct *vma)
 		else
 			return -EINVAL;
 	}
+
+	if (dev->resource[i].flags & IORESOURCE_MEM &&
+	    iomem_is_exclusive(dev->resource[i].start))
+		return -EINVAL;
+
 	ret = pci_mmap_page_range(dev, i, vma,
 				  fpriv->mmap_state, write_combine);
 	if (ret < 0)
-- 
2.28.0

