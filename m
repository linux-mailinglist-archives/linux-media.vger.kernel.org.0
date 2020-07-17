Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3B32235F9
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgGQHf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgGQHf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:35:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C415DC061755;
        Fri, 17 Jul 2020 00:35:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc15so3813794pjb.0;
        Fri, 17 Jul 2020 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H6UgjbIQGVN5oFfgxU/CHIEw0G9DHJL+4n0GByCqoKU=;
        b=ZWZ/4jVtjrKf9R2VXYKIHZ+Pyugf1ECUJzzMztl7ZhJmng7dJMQOjVX0nnY1wEv9Mo
         sWzRdLBYGlDLQiKNgfip3W8IqglWn5NoB+wjkO8Pv/74UUapkKJcjtP9v86ZTJw6zdpJ
         //LcgllV8AuvMsLd3OeGTGXQGa1G4S1UyBcQ8U8G7aUTZmNXvsT5xr2LSlckjnzFjp+H
         R22aDhy8soxWLWgpLfPa66TQrtoPkT+z2jhLlHu+t4J3km5o/306kyBXcdi27dxF8F4l
         oSbWcUfFNYmED7V9S9guJI7rFmtV88l3xM4eIur+pdmG+fv+Ej0wh3oDqgVlLplIzOXS
         MFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H6UgjbIQGVN5oFfgxU/CHIEw0G9DHJL+4n0GByCqoKU=;
        b=eLDxj9BOEN5I6c15ccitjGm5BWoMTvj3+oyam7UaOs2+xkPoOFqyB8+FGSl1YUA9eF
         a4YY25iLj8yXx4dTi9EUCIZgBG6wfi/THkOMcrM7FK06n51mqD8ubCy5+NUAP+jiDg/0
         OcgX+f5AN9GHiLauDQNYdfVQ8VpJFJmU95FwHqArLpD+a3wZ906XSiN+P2Ya6XkCdMsh
         3c7u1qZ1KU5uYCOkgF1EraRr3y8tbXvHraA6aP9D0rpJaF+aF6IOdo7K2+KB/kgJQ4BB
         lvECij0BJGw5l/pykXrO3TbtPEd7oluYyFe1hr8IBp5e0kg2Mbx+5aUSq1YTSooe68s6
         tFSw==
X-Gm-Message-State: AOAM530CWdnRIEyDufVS+fncfYg38Gj8F7aaapNefZeVPRJ3Ua1cVBM2
        pvQdfAgD9BNbVhaws+KiahJ6Igae0HhvCw==
X-Google-Smtp-Source: ABdhPJyV8TF/8340VW6zAKsBcjtJyGZUCuLrzgfBjaLKiQqbhUXOWPWT4ov7XWH1kS1rxJD2S5vFug==
X-Received: by 2002:a17:90a:17e4:: with SMTP id q91mr8464124pja.61.1594971357237;
        Fri, 17 Jul 2020 00:35:57 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:35:56 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 0/6] [media] pci: use generic power management
Date:   Fri, 17 Jul 2020 13:04:30 +0530
Message-Id: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to upgrade power management in media
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

v2: some changes in v1 might break cx23885 and cx25821.
v3: kbuild error in v2.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (6):
  sta2x11: use generic power management
  cx23885: use generic power management
  cx25821: use generic power management
  cx88: use generic power management
  meye: use generic power management
  tw68: use generic power management

 drivers/media/pci/cx23885/cx23885-core.c |  3 --
 drivers/media/pci/cx25821/cx25821-core.c |  3 --
 drivers/media/pci/cx88/cx88-video.c      | 58 ++++++----------------
 drivers/media/pci/meye/meye.c            | 15 ++----
 drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
 drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
 6 files changed, 46 insertions(+), 126 deletions(-)

-- 
2.27.0

