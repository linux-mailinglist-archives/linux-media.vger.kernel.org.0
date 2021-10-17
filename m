Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA34430AA3
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344185AbhJQQYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238236AbhJQQYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:24:41 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86D0C06161C;
        Sun, 17 Oct 2021 09:22:31 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id e5-20020a17090a804500b001a116ad95caso5306558pjw.2;
        Sun, 17 Oct 2021 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCRIijo2PoToFaAc7zQPed85KYSfqIFEBvsodoq8LHk=;
        b=k3T++MKGgxWrWsGO4lMsHWh7oHoeUjVFHlFvkZSM7t4PdX+T1kQ5wKGZxJuaduMa4l
         SsP4FJyH4YXPDL1CdpVyCm/j5d+KLwoI+KwozrHXSwNAJnWObMwZRVJX8EO6fiDzmmDE
         mz2ETABVsAUARamqXNmxaHMJkoSKKk/uogeJfh62X7Ldf3LIkx0jpJcs78Df3YJVrr5z
         1k2GwIZTNQzLK5lwY4Pauuz0CyVBeiQ09OW7x6kKMvDGWMnG+AFacnKUZgVeghPLPBYF
         sU/sd+dFKdccwRcdPwHrQ+p7KzB1E7J0fx/XVAphVni6xXswcMyHggNul9Huza5hCtFO
         JgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCRIijo2PoToFaAc7zQPed85KYSfqIFEBvsodoq8LHk=;
        b=z88hx2doVFbAIyB4QObIEEZw0siK5Y5TwFUXnegpBfA5P44ZSSSUYFm6puOyF5ZcP6
         Gc6wQ6giHQEVKXeN0wBtk+POBde9Vi2dyIQISacBpmHvQZKaWbzXvbmwpHdrx8uatYhx
         00ufvtQogcrAgkelJ2KVlx/xscyML1OquVjx1YwQT+xiYuLJaBcjc8kjJ1RSu9uYkR8q
         2DJDpreNdevuskE61JsmgIJaOmet1S6cLykyvUaFwiXlznD71uRvgWaFPkZGAsMZs3sg
         RBwuVIeoxAyTX9Z/thaZohjFAxtJrN3tPqvB+++u1BxuRjXeBc0hsMKiHCMUfXaFX2JQ
         02sw==
X-Gm-Message-State: AOAM530xxTu/ZLTNW5qgv8M4UMmDVtQ8NJqlZpaTtI1y8u+7rw+rIg4z
        J/48A45+EJwZrskjkTziaFw=
X-Google-Smtp-Source: ABdhPJz/AvWxDLcRzfrwl8E2zFEn8+bBE+zHTB4btQnYdKJUFs4l6SxFAlyvHiWQ/jtmkTBZvHUrsg==
X-Received: by 2002:a17:90a:af86:: with SMTP id w6mr28405602pjq.8.1634487751185;
        Sun, 17 Oct 2021 09:22:31 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:30 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 15/17] media: atomsip: pci: add Microsoft Surface 3 ACPI vars
Date:   Mon, 18 Oct 2021 01:19:55 +0900
Message-Id: <20211017161958.44351-16-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Microsoft Surface 3 does not describe CsiPort/CsiLanes in DSDT [1] or
EFI, or at least not desctibed in the forms the current atomisp driver
expects. This results in the default values (port: 0 lanes: 1) to be
used, which does not work.

So, define them ourselves in the driver.

The user-facing camera is AR0330 (2-lane) and the world-facing camera
is OV8835 (4-lane).

According to the portconfigs definition in atomisp_csi_lane_config()
[atomisp_v4l2.c]:

	} portconfigs[] = {
		/* Tangier/Merrifield available lane configurations */
		{ 0x00, { 4, 1, 0 } },		/* 00000 */
		{ 0x01, { 3, 1, 0 } },		/* 00001 */
		{ 0x02, { 2, 1, 0 } },		/* 00010 */
		{ 0x03, { 1, 1, 0 } },		/* 00011 */
		{ 0x04, { 2, 1, 2 } },		/* 00100 */
		{ 0x08, { 3, 1, 1 } },		/* 01000 */
		{ 0x09, { 2, 1, 1 } },		/* 01001 */
		{ 0x0a, { 1, 1, 1 } },		/* 01010 */

		/* Anniedale/Moorefield only configurations */
		{ 0x10, { 4, 2, 0 } },		/* 10000 */
		{ 0x11, { 3, 2, 0 } },		/* 10001 */
		{ 0x12, { 2, 2, 0 } },		/* 10010 */
		{ 0x13, { 1, 2, 0 } },		/* 10011 */
		{ 0x14, { 2, 2, 2 } },		/* 10100 */
		{ 0x18, { 3, 2, 1 } },		/* 11000 */
		{ 0x19, { 2, 2, 1 } },		/* 11001 */
		{ 0x1a, { 1, 2, 1 } },		/* 11010 */
	};

4-lane camera is always connected to the PRIMARY (port1) port [2]. In
this case, 2-lane camera can be connected to the only SECONDARY (port0)
port.

So, add these data accordingly as the gmin_cfg_var ACPI variables for
Surface 3.

[1] https://github.com/linux-surface/acpidumps/blob/7da48a392b4085c2021952290def1fc28505a643/surface_3/dsdt.dsl#L5879-L6278

[2] Yes, the PRIMARY port is port1 according to atomisp_camera_port
    [atomisp.h]:

	enum atomisp_camera_port {
		ATOMISP_CAMERA_PORT_SECONDARY,
		ATOMISP_CAMERA_PORT_PRIMARY,
		ATOMISP_CAMERA_PORT_TERTIARY,
		ATOMISP_CAMERA_NR_PORTS
	};

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index d8c9e31314b2..948eb6f809f5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -321,6 +321,18 @@ static struct gmin_cfg_var i8880_vars[] = {
 	{},
 };
 
+/*
+ * Surface 3 does not describe CsiPort/CsiLanes in both DSDT and EFI.
+ */
+static struct gmin_cfg_var surface3_vars[] = {
+	{"APTA0330:00_CsiPort", "0"},
+	{"APTA0330:00_CsiLanes", "2"},
+
+	{"OVTI8835:00_CsiPort", "1"},
+	{"OVTI8835:00_CsiLanes", "4"},
+	{},
+};
+
 static const struct dmi_system_id gmin_vars[] = {
 	{
 		.ident = "BYT-T FFD8",
@@ -358,6 +370,13 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = i8880_vars,
 	},
+	{
+		.ident = "Surface 3",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "Surface 3"),
+		},
+		.driver_data = surface3_vars,
+	},
 	{}
 };
 
-- 
2.33.1

