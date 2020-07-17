Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA67B2231D6
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 05:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgGQD6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 23:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGQD6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 23:58:06 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6259AC061755;
        Thu, 16 Jul 2020 20:58:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d4so6026599pgk.4;
        Thu, 16 Jul 2020 20:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JetoyPciAFofOkM46v7697tncAhHHwvgmW6+FF7q4EI=;
        b=SQTsaYvetOM1v356yrgZ70ZWFIumZlyBqkh0U4F6uKel/LiVJTYLOVXba5FZWSoaMD
         j6rtq9l+rTGOMThBLvS0I5my3oWHWsZK6mJYDSjLcuQ8auxY/mOr3NEMACubjmWFYZtM
         WABUhv7XcAPkUuAkdyQpwoU66GY9UOm0h3crWecSGwy0UdaGJDHUHOo+k46ZNpwiBzFK
         KoogYvjSK243ZGt/UvlMK+PcJePlL9Uw80JjOBQxxVELVLDt1SzfwWPJJ6cC1zwrywRS
         VIzslPRF0mGxsXxa0ubTxio87UY1zZL2O+fFaCCeLs2rDjzsiSyer+47oc71997kHSwL
         BcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JetoyPciAFofOkM46v7697tncAhHHwvgmW6+FF7q4EI=;
        b=Y1ITYYxUrHAcQJVLI4GBh55eR9Qk+dx+rS47MOdpiZX0/IwuRyHVvX2HBQfGct06oj
         3j/TXPjR79QnHWCAHrQzOrNBsFTCKOSBSgLB/kLauZvc/EP1+rL1oDCgyQdqwaOjvrhn
         Dgflh+CPs6utTOv+fQge70rABqGciKVbWEPyisrXsja0Av4W1e1TnXkzpzbixyKVpBbz
         plUbotE3uAt5LgIsw/myUXzdacPLrSz3FXfrAJ/Y9AOGj1Ce+Iwzv46K6zTgJtC2Z4pu
         QSrquGxEIolvkesXeMJAzPKlwztJ5wsBVOnj7YfAJcQ1AyhNRh3SFo7wKIuvsp1msjB8
         8nDw==
X-Gm-Message-State: AOAM530vxHaLun1ip+YAb6Bb/SPoktD4HawnkunXPnepuqrM7ixWxtL7
        5KywGnr6q6SUyIP9DL3mSig=
X-Google-Smtp-Source: ABdhPJyQGXUcV6zCkE3MOHzwvTAOjdHtpOOsE/Zsef8mAJXI3n4YmvqKgpZUf/OTcBLcROCfl/0JxA==
X-Received: by 2002:aa7:9736:: with SMTP id k22mr6130149pfg.62.1594958285870;
        Thu, 16 Jul 2020 20:58:05 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 20:58:04 -0700 (PDT)
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
Subject: [PATCH v2 0/6] [media] pci: use generic power management
Date:   Fri, 17 Jul 2020 09:26:02 +0530
Message-Id: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
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

v2: v1 possibly broke cx23885 and cx25821.

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
 drivers/media/pci/cx88/cx88-video.c      | 52 +++++--------------
 drivers/media/pci/meye/meye.c            | 15 ++----
 drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
 drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
 6 files changed, 44 insertions(+), 122 deletions(-)

-- 
2.27.0

