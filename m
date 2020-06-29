Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B54020E1BD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390028AbgF2U6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730969AbgF2TNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:02 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B38BC0A891E;
        Mon, 29 Jun 2020 00:37:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x3so2007746pfo.9;
        Mon, 29 Jun 2020 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDM4k1Yk8LW7xlU6yNIJsCHS3QIR5uvUtDlbeW1QFKk=;
        b=X8RCISIZnXYpunasoPJqDhNH3rQ0XiSvdy4nAbk41pWq/dz/IPVZkg7PzZFRa4X1xn
         2YpDmquvcakzAJvUjME2R+RjFbDUOq9YJeT8rjloM3HOL5a532uXPTt3dHwNj9mDtxDE
         /rr7V6qOJWdkIs7xHye+ZDDVtmnOsdmoRMhBAY5Ll2d3KNJ6vxOXRcwIpI/ZM2B8s8e5
         EFAo4K2iEPmbe3Zg26yk6ckABJk299EGhZxOMt+9spTkdaphyQMC8ffmnIa2dvd6pC5w
         vz36LE8CtA5QSCMHB7d3B1H2h8nqKu3qQnShqek5l9zhH7FMXqpb+4uo9XFAE17E3zRm
         ZoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDM4k1Yk8LW7xlU6yNIJsCHS3QIR5uvUtDlbeW1QFKk=;
        b=ecKykODT0J/xY1MRekonSaUdzf0zCjepa4quyBnufQJCGle+YBGe3OrKhYriyq5cfu
         HErPg1ddzpGmtbi0hXi1xULCXIvlvPr4zwauB1skHzxMFaX4CyRGSSC94nrNfoX8EuIy
         Z/Boiz6q2Gj8qLlZqUJim5ijK+rt2Ef2er54sE4u0ZC+IPXsJh4E5nzS+pXEwQdyg2L3
         cCfHUso9+tvVHXyMWIpotjgajZNL8HOVzTl3UcPuL3tEQVvRN/Q/fzdmij0qJwEXS+XJ
         f/ja5aMfDx2ZJg70lW9suwNcK53dp7o6wPEEGQDMti+NPo+pyDXdhOuL920JBzAU8VEH
         QPzQ==
X-Gm-Message-State: AOAM531oowVC4Shqb4zwjOtbhUSKpKSjzKUcR4lhW70BlENgwQ4zK1i7
        ux292YPk6Ntpbi3gg7iY638=
X-Google-Smtp-Source: ABdhPJxpCV89OAF2D6UcINS7KgFdE7WIv1a5RmvUcOk3a454WOLgNxKhYjvpA5bfJR821uWzIzAJxw==
X-Received: by 2002:a63:4861:: with SMTP id x33mr8936376pgk.448.1593416239679;
        Mon, 29 Jun 2020 00:37:19 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
        by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 00:37:19 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1 0/6] [media] pci: use generic power management
Date:   Mon, 29 Jun 2020 13:05:58 +0530
Message-Id: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to remove legacy power management callbacks
from amd ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (6):
  [media] sta2x11: use generic power management
  [media] cx23885: use generic power management
  [media] cx25821: use generic power management
  [media] cx88: use generic power management
  [media] meye: use generic power management
  [media] tw68: use generic power management

 drivers/media/pci/cx23885/cx23885-core.c | 16 +++---
 drivers/media/pci/cx25821/cx25821-core.c |  8 ++-
 drivers/media/pci/cx88/cx88-video.c      | 52 +++++--------------
 drivers/media/pci/meye/meye.c            | 15 ++----
 drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
 drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
 6 files changed, 60 insertions(+), 124 deletions(-)

-- 
2.27.0

