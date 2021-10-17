Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56469430AA5
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344192AbhJQQYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241666AbhJQQYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:24:47 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53E4C06161C;
        Sun, 17 Oct 2021 09:22:37 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 187so12809088pfc.10;
        Sun, 17 Oct 2021 09:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ue2xdZLYD2ElvWKGNBKjsp5o3GL4BC9cJ58ddnGFYJk=;
        b=DTBtZkcBC+FwodEBseqZkDv2IZ3sbKBFdm1Q7+Eos3ebPOnZPsHE/YRyw7ita0zXZJ
         pHU6ODfeg43zL8+iI9oCVL4lvZrgwnSEyoZf3Px2umN9VeNn7FMYEdGIMjGSjCy4FVwU
         S6F0De+a2X9ZR6XP0q0pe+9mJbZ89kYexXfAwIqUc/LL4y1ASMfiOweD4u/Vz37vRjY7
         Oj277c75U5oOA7GKaPtaLV15up3tqdfEN4pZVbJHCgnNbH/8lujknEMSENwoU8Vc86Gk
         c8iIHQo1EK9wfLM5ZzRI42LkyYKi6Lpcb+pkOJlgoLwK91dnRvQm/LPiWMvrUSNr02sG
         EJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ue2xdZLYD2ElvWKGNBKjsp5o3GL4BC9cJ58ddnGFYJk=;
        b=AIg6XTk3BigdewBPRU28FQgXce8hDOG7PXbuw+kLIe+zCUGGokaQXaHPybdKSTQi+R
         EVZlbSkrhnFvHXaINh2lQri8A+6Jehg38f6+l+rzvVG/P0NaO3aqCRu58SYggfTgrz/B
         ZtzA9iiQFzr6NQwJyekQTEK+lJhvCbvsOF3I68X0oPhezJmFYZ6qX0r5Thjogpd/5eaM
         aHL++P3GNukESirIelpOqzVDmGKnxDOJhycu+08csCUkBnPGxi5vH1wJfHuX+P6Xpjnw
         Z+C8O0Jswo7T4YeCoKhfJnKbuCqUlKKQZjNWTfdnJbMvWqGJuvhiLluuvUr1cdnjbfpb
         eB7g==
X-Gm-Message-State: AOAM532rcco9Sm7umJMXN1A7DsLExauuzMp13IT8yBquE0l8vD2WLAAl
        sw+blmlGInuTCoPiBB3e1tg=
X-Google-Smtp-Source: ABdhPJzrx9izO18sTvA++aSDIJM8D8l1RUgokAgxf2l7bE461156/sxjT5kjbfRo0wYNe3jJusNaJA==
X-Received: by 2002:a63:9212:: with SMTP id o18mr6329980pgd.392.1634487757241;
        Sun, 17 Oct 2021 09:22:37 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:36 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI match for Microsoft Surface 3 with broken DMI (OEMB)
Date:   Mon, 18 Oct 2021 01:19:56 +0900
Message-Id: <20211017161958.44351-17-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit is added for Surface 3 with broken DMI table. HACK-ish.
Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
knows a nicer way to address this, comments are welcome...

>8-----------------------------------------------------------------8<

On some Microsoft Surface 3, the DMI table gets corrupted for unknown
reasons and breaks existing DMI matching used for device-specific quirks.

This commit adds the (broken) DMI data into dmi_system_id tables used
for quirks so that the driver can enable quirks even on the affected
systems.

On affected systems, the DMI data will look like this:

        $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
        chassis_vendor,product_name,sys_vendor}
        /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
        /sys/devices/virtual/dmi/id/board_name:OEMB
        /sys/devices/virtual/dmi/id/board_vendor:OEMB
        /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
        /sys/devices/virtual/dmi/id/product_name:OEMB
        /sys/devices/virtual/dmi/id/sys_vendor:OEMB

Expected:

        $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
        chassis_vendor,product_name,sys_vendor}
        /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
        /sys/devices/virtual/dmi/id/board_name:Surface 3
        /sys/devices/virtual/dmi/id/board_vendor:Microsoft Corporation
        /sys/devices/virtual/dmi/id/chassis_vendor:Microsoft Corporation
        /sys/devices/virtual/dmi/id/product_name:Surface 3
        /sys/devices/virtual/dmi/id/sys_vendor:Microsoft Corporation

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_gmin_platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 948eb6f809f5..3868d64cbc2b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -377,6 +377,17 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = surface3_vars,
 	},
+	{
+		.ident = "Surface 3",
+		.matches = {
+			/* DMI data for Surface 3 with broken DMI table */
+			DMI_MATCH(DMI_BIOS_VENDOR, "American Megatrends Inc."),
+			DMI_MATCH(DMI_BOARD_NAME, "OEMB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OEMB"),
+			DMI_MATCH(DMI_SYS_VENDOR, "OEMB"),
+		},
+		.driver_data = surface3_vars,
+	},
 	{}
 };
 
-- 
2.33.1

