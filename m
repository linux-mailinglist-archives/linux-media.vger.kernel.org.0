Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543F428847A
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732790AbgJIIAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732787AbgJIIAS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 04:00:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6B0C0613D7
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 01:00:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so9219995wru.12
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VnPfmIw9ZEJAdxqVy4AIvj5gzcDwS/bnZ7Vl10D80aI=;
        b=AmZWcTmTMY3aRt6Gxo6D+cFSlAKtbo7rzcAhKQblXce5J0bM+0jidwIuX1SJM78PW3
         a4CzgO4OyPIunTZ40M8qjiQpRIe+CXuCN2QeQz0Nq3eitwpnmxf1tCSrmdU7BFARQUrJ
         TsYEd08BMm8jvttMOB5N0WbB01Om3gekKiY/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VnPfmIw9ZEJAdxqVy4AIvj5gzcDwS/bnZ7Vl10D80aI=;
        b=AtyjwHjG3cUtqB6vBPL2lHSX8RPqO6S9N9F6/hJSwx6DOgjY815yRQue1Hqr5Al+Vg
         HQdX5k8HreI8XYKpXcjdtRoBgTKPaCCFVKDP2ZGYmBhvkk1s17rNbBzaZw4b/O9IlDP7
         phdvNbFI46Ey2Je/6NOWsyeNeowzJY68AkUaDJVRCgmcsAFZx/s9l2Qx97pBzmKUrAW0
         XVo64XkInSlGc+cHbjoHNaQfXy8i9haVvQT5SIxw99BT/M8Ay2206vaSwa94UyzPWdMG
         MzxftCAxg6euwDeqprfRr9rXCVajzO3QyQwqMQM2RqbT5oLNmfjqSJjsIfBkF/Qw4ih6
         3mPA==
X-Gm-Message-State: AOAM5316cpHFNFZrvF1TMNk6UwGNe2s6G8Rcci9G82HZjvdaNHvcLvVi
        MOFEeq8TihLXNC/ZYdaUSlaYWw==
X-Google-Smtp-Source: ABdhPJyIgZ0DKgvAk38zXma7Xw6CtJtdY0QGkVhgcnr9L1zZ08hj8no1NH+SgdXtl2+3a6urGujNzQ==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr13160452wrr.273.1602230416967;
        Fri, 09 Oct 2020 01:00:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:00:16 -0700 (PDT)
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
Subject: [PATCH v2 17/17] drm/i915: Properly request PCI BARs
Date:   Fri,  9 Oct 2020 09:59:34 +0200
Message-Id: <20201009075934.3509076-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When trying to test my CONFIG_IO_STRICT_DEVMEM changes I realized they
do nothing for i915. Because i915 doesn't request any regions, like
pretty much all drm pci drivers. I guess this is some very old
remnants from the userspace modesetting days, when we wanted to
co-exist with the fbdev driver. Which usually requested these
resources.

But makes me wonder why the pci subsystem doesn't just request
resource automatically when we map a bar and a pci driver is bound?

Knowledge about which pci bars we need kludged together from
intel_uncore.c and intel_gtt.c from i915 and intel-gtt.c over in the
fake agp driver.

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
 drivers/gpu/drm/i915/intel_uncore.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 54e201fdeba4..ce39049d8919 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1692,10 +1692,13 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 	struct pci_dev *pdev = i915->drm.pdev;
 	int mmio_bar;
 	int mmio_size;
+	int bar_selection;
+	int ret;
 
 	mmio_bar = IS_GEN(i915, 2) ? 1 : 0;
+	bar_selection = BIT (2) | BIT(mmio_bar);
 	/*
-	 * Before gen4, the registers and the GTT are behind different BARs.
+	 * On gen3 the registers and the GTT are behind different BARs.
 	 * However, from gen4 onwards, the registers and the GTT are shared
 	 * in the same BAR, so we want to restrict this ioremap from
 	 * clobbering the GTT which we want ioremap_wc instead. Fortunately,
@@ -1703,6 +1706,8 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 	 * generations up to Ironlake.
 	 * For dgfx chips register range is expanded to 4MB.
 	 */
+	if (INTEL_GEN(i915) == 3)
+		bar_selection |= BIT(3);
 	if (INTEL_GEN(i915) < 5)
 		mmio_size = 512 * 1024;
 	else if (IS_DGFX(i915))
@@ -1710,8 +1715,15 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 	else
 		mmio_size = 2 * 1024 * 1024;
 
+	ret = pci_request_selected_regions(pdev, bar_selection, "i915");
+	if (ret < 0) {
+		drm_err(&i915->drm, "failed to request pci bars\n");
+		return ret;
+	}
+
 	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
 	if (uncore->regs == NULL) {
+		pci_release_selected_regions(pdev, bar_selection);
 		drm_err(&i915->drm, "failed to map registers\n");
 		return -EIO;
 	}
@@ -1721,9 +1733,18 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 
 static void uncore_mmio_cleanup(struct intel_uncore *uncore)
 {
-	struct pci_dev *pdev = uncore->i915->drm.pdev;
+	struct drm_i915_private *i915 = uncore->i915;
+	struct pci_dev *pdev = i915->drm.pdev;
+	int mmio_bar;
+	int bar_selection;
+
+	mmio_bar = IS_GEN(i915, 2) ? 1 : 0;
+	bar_selection = BIT (2) | BIT(mmio_bar);
+	if (INTEL_GEN(i915) == 3)
+		bar_selection |= BIT(3);
 
 	pci_iounmap(pdev, uncore->regs);
+	pci_release_selected_regions(pdev, bar_selection);
 }
 
 void intel_uncore_init_early(struct intel_uncore *uncore,
-- 
2.28.0

