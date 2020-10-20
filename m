Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C35E288491
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732729AbgJIIBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732749AbgJIIAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 04:00:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3334C05BD40
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 01:00:10 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n18so9252105wrs.5
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mkr+QLHrHRyzDeEuLV6zjmHQ3ublwStz21KQT1DOayM=;
        b=GGX55N304bFNQXT7vE1ggs1hCrNO4kTCwZL12SxHZag0+p+9wIk4MXiU4skay+LXim
         49xSp0FO/9WgeR/sK6Fi90U35plzqw+Vb29HBAZuQNOnvJt3IwmsbNCeAFjlMohevOl4
         MeSmpBQPKt0omjgQbvLdsGQUrxbNL/9LDoUKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mkr+QLHrHRyzDeEuLV6zjmHQ3ublwStz21KQT1DOayM=;
        b=MjHOOvoxejeEpZcbfNuPRQ+QXGnVPP/q/DdO9t8kFarmWH3wbZ4et7odWexeryhSaJ
         nLOAdCA3PJj3Nd0dGgxyGdXY97brBQrp9KPeA/8PPLpxqzhX6dZYjV5Q90gXOX4xXugw
         F1zz88ks0szMGkag5TFt+3+srSYmEUz1NEEi9M5IzA2gxunxBg+8+UTRi5t1h+srmndc
         qqy9BB/8HnwATUw8CL8FTj3fmHlf810AO66kd8zuPsIkL2mTE//czQ6e+vWpQ3osf5Ni
         XQZZaFP/zHShzZ67OE59UfAvvO7ndKOIIs2kmsRRpe3YgbF3HEskOhJX/tMZvF6TZ3TL
         7NeQ==
X-Gm-Message-State: AOAM533XRtAdRCT+V+UbVTH7rQWsPT/DaCeivhJxVqoq9ZMEsclqofqD
        UhBMU32urvUl8pHVB671+f2f5Q==
X-Google-Smtp-Source: ABdhPJyDv2qPX/s1a3mWcZq1GdiuGUlSH1qbeC8CG58tJ0NKdoFcESH1X88ElvgtpyqLXEEr3X8XWQ==
X-Received: by 2002:adf:d841:: with SMTP id k1mr13481898wrl.227.1602230409528;
        Fri, 09 Oct 2020 01:00:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:00:08 -0700 (PDT)
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
Subject: [PATCH v2 12/17] PCI: Obey iomem restrictions for procfs mmap
Date:   Fri,  9 Oct 2020 09:59:29 +0200
Message-Id: <20201009075934.3509076-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
files, and the old proc interface. Two check against
iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
this starts to matter, since we don't want random userspace having
access to PCI BARs while a driver is loaded and using it.

Fix this by adding the same iomem_is_exclusive() check we already have
on the sysfs side in pci_mmap_resource().

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
--
v2: Improve commit message (Bjorn)
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

