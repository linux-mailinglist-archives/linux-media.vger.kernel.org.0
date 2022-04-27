Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A025117F4
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiD0LuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232986AbiD0LuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:50:21 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290103.outbound.protection.outlook.com [40.107.129.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB603B57C
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxSYrB+a7fZP+kvwMmZhQRvUHPH++sYahgrGzUD+rnBA3u7jkZDQ/UKHQpI8M+1MCVDmHglPe4zI7j8viyMXt9sjG7vkpnpV22Tj/bICau7OuXOFWhYMfAegLMcP5ka+mEgRS9ziOJjEWz5xTH/272YY3KWUR+shyYer1HmeP91bSsFVSrCdt06vDX/rG1JgROiJ/mkADXsoc5eJd3GDol2t5cWCQKR0wpcAtj56PW9BPv4kVrDQIDMxUdMs46b8dlEkQIFszoKsQBodKnaBoyLFJETKw/Z3LGV53qOyZFHw1RJ6voNtRxPFtsz3hk1IcpZcTvLeBQMBE6f2Yg0ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc+DbhJOvEqkSsG3iaRhbGXehxwVWjylanIkoEI4XEc=;
 b=KCDstkSGACr/Rn8uzUSN0pfm4NlVkNHQSPsFprsOjseB/Pacw7Wr9xZgXuAQVVU8WawifQJBi6/yBpORNorZ0mMDXKXHGGc2N0DDnDChqt/G1Yj2lEZ8L8u5Q77efFcsS4x3tmHVAgXs6lJCIf+RhNc60XubgNmzIXQu03SvMOSBzKrViybnIKWEgcTWepSciSy38CJjYOk23sV41LlgKSLPVTmpvTsKN2xkbqin50NPSzhcWdHaYdwi5eT3RdMT8JtQ2lDCA5DgMkWOw5zukOJ5kLZ9e5ZRsEz1Ox5Mpc1vlbUzYcjF6UdOd+L5CTbtj2XpLMzlylAnAa9onyYpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc+DbhJOvEqkSsG3iaRhbGXehxwVWjylanIkoEI4XEc=;
 b=jCvRfS8ABd+8d+XbF+lwVZJCTDQEF1FbAPb5A8bjybgLiSmhFphSEe0nUpckimRkz5DbMWgM8rYcSThuNVHZWEtgHaVMO8Pu4ux7xZk64OmNm+wFP/r4A2XGX9XOv0wsROyCls2M2X1yS3r7eIX2RyUpRw/jR0ggj3+VFnVfPN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1502.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Wed, 27 Apr 2022 11:47:06 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%9]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 11:47:06 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>
Subject: [PATCH v8 2/6] staging: media: wave5: Add the vdi layer
Date:   Wed, 27 Apr 2022 20:46:34 +0900
Message-Id: <20220427114638.1638-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
References: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5647bab-b6e1-4deb-1fd6-08da2843a750
X-MS-TrafficTypeDiagnostic: PU4P216MB1502:EE_
X-Microsoft-Antispam-PRVS: <PU4P216MB1502F6D23D455D116090BAF2FBFA9@PU4P216MB1502.KORP216.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NW5ld0XiAjHTqhLCjrJCL2np9U9TPCop+2gaxUsmjr72fwllrHfw2spVU61kCCFz/zndNALzcCoBz6Synt94YTvwDo9/IclctFfFTgwO4F2XQeduCZkt8qjVbXqjYQWZrFjP75/NpR8irAiVtKK9Oz8arjI6Kqg8FDFpMYsmKvwzWTWI7wM1IVOBqtFN1oNz5Np8MeuB0QkVQ+5xpPqpDrXx+ORW1y4exXMWm+k2/iV8PFu6Bt6waPeoVwUkPFmSLAR4eZ8KMdMJLB3TmeztDZl2dZzozZYRIASXt5F5bl6AvMw6qaivDDgekmdab2PaJfxhHYdQVKXbo7R0AAAvqWqbMDEE/MEmq8hUjufpmf3/aRuiYjwPahb1YvpUTQ25LzDfD2NddAYckgniOZb8Hj3TbyiRtX3NHz47OQNNHIxUJljHH7eORoy+HC8Afnxb3ub/RV6rl/w1cXKwG/16r8GQK7gGROT/G4ACaL43N0MPthp5acCK8A69JaH332RLSXbV/RP3Lo7kt/ihWfppShB58nabzb5O44JTJM622166dlyvPvlPiJYFzj/C6wzZ1bPhGLGodqmcM+5voUgEemHs8zfNGTAVleF5Pb9MBBV5FOdJ3trP9W/us/AetspOw4LTNTokRACRqmWHmNEjHYqf+Nilsw7B3URhcGFIrD0Lcbzt5P7wb3XLh2mzplGVR1a63G5e2UiZjN4QY8kABg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(396003)(136003)(346002)(366004)(376002)(1076003)(83380400001)(66946007)(44832011)(2616005)(5660300002)(2906002)(54906003)(38100700002)(6916009)(38350700002)(86362001)(508600001)(36756003)(6666004)(6486002)(6506007)(4326008)(316002)(8676002)(52116002)(6512007)(66556008)(66476007)(8936002)(26005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y2N8HfvP/mfIUbstUNxNW/tqJBgpkVDzHG0uzEqXJTGyyi6luzuZ66rTWiKI?=
 =?us-ascii?Q?HhIOhhedVDXG0tUKDDlMrXn/X9eNW9SGvhBEkgnBF08VEvLhAA4BNoVNQIdH?=
 =?us-ascii?Q?drp2LExtKunxBt9vmnJxlO5VZEnZIXD2IDMFml+J6LEvVFqxJ6CMNxF71OQi?=
 =?us-ascii?Q?IRTJkCHJG7PT+Us4u+0IaEo/VqeI+qYE4bmThqny08dipG4k2Msup48rYnTK?=
 =?us-ascii?Q?/D1Ecn2WWe3Z4IBgkDCVFZZPa+hQSxmrEaIAbtvu6eI4i5/kaEYjmtMVOuq4?=
 =?us-ascii?Q?z/r4ZlTVTllmKDnIiYP9mFugJElawjhrfiZEgcX28DVONPDLUIYpQWFxgzwo?=
 =?us-ascii?Q?IMBYLeNAwR1tEHI9OWe8EtJUnaf6q9UCAtorPkZkyCgiSsWmccc+04HiBCeb?=
 =?us-ascii?Q?ZCYNr454D+/BO0ODmdr/qBDyGF+Q9UETD5btJF18iL5jqVQLLaTscSzYM4yn?=
 =?us-ascii?Q?Wq4jV1D3zBk+dzn0d8/Y0t0Q548OgzRNDWupuYBqL7qS7FdjdvPZm7DKaZpL?=
 =?us-ascii?Q?Ej7XH+v/VKrgWqp5vC9Ot3PcMpiNZT/mU0+QO6M+9Qb5kWeS7aUP2WE5MRbq?=
 =?us-ascii?Q?DK3lLacCGPEcsaB5zWFtb/l5ZIUTsjkp7LZyCowx2OahziNfZBY3CmNciL8P?=
 =?us-ascii?Q?aeOVBMdIqDLqp8OZAmJYxBP8fFBsJHNLMuxTmMN5yrWDeyE3hnOcqykeUEnX?=
 =?us-ascii?Q?u09DpjmDV7b5QzP8rA3P8c6Q/1fSzjOnFt/kOXUmeH1HNDERcqi0YpVBkBZ+?=
 =?us-ascii?Q?LE4fsA77cLYN6rjdvStF35y355hxH10HTmjUwm1LO0ahURb9q4XjOUi704EN?=
 =?us-ascii?Q?HrWWh5Y9YulJ5FS8tsxaglSyWY8kQ0+1yMEJMrCzqAuTmDhBoxsIuILlQvJX?=
 =?us-ascii?Q?zhjhl/EBdlxlkofAm3zcv09ah37i7E14Bpiv0KY1rOKHd7U0lUjFqVX8klOq?=
 =?us-ascii?Q?2xnb4rh9pVJFummorjDrzLn6nX24ofDVwozQ12B9GEkzpuxq6iHjbWDUa2Qn?=
 =?us-ascii?Q?GB8d+nkLxyfb9rmBrVKTVF26YQBPPSFTn/Xu7Gt/FgPF7BRNV2QnHtz/0m74?=
 =?us-ascii?Q?jC+zpS7N0vC+YiKeTkuhShDj6GbD3yIO+aknB7Z3KfsIB8XqxSjX5OO8vup6?=
 =?us-ascii?Q?XNQwyV/HcgHHotJ8oOPgTCmxPq1UeKRMUbi1JcyfWQRBSFhsPR5+3zg81MnQ?=
 =?us-ascii?Q?uUU8iXDb5JEFLXydXTtyZaYZ7ZhT5+PveEaKvuUq6ttBC+UFVYBQBB+Q8pAz?=
 =?us-ascii?Q?YTvDzKTRFpJc45dHkP7S1f+w+bHL8SWwzQZZxoIyTJbFJTMkbwyiPpwopePC?=
 =?us-ascii?Q?xeIoqsEWISJxTunB7Z3gdkJwknq7+4/3YHLaycXLF7HYSTdmBxklsna5gkSU?=
 =?us-ascii?Q?Hrrt437ZFEpa2EAH/rCtRzzWm9Zh+VlzikHCJ0p8QbapcdF57hA3ssWD6G3N?=
 =?us-ascii?Q?YYO2tYv/MLH6u+cXKRRthizXXmfauvWUGkO5Kv7qm+dCIU5SS2nXFo8P8Mm+?=
 =?us-ascii?Q?2eLE8YKfOjdMEPkrS/UvftKCVNm4HtzPqPwDQHTR5cGu4fBwtPsR/C2lRUMO?=
 =?us-ascii?Q?7ILvzeisTWF+v+Beu/jpVVmQa2UTJQxSrJsTMhe2Xm1bW8eXkNwhhFZSZJEO?=
 =?us-ascii?Q?0i4Dm0Xnr8e6v0Aa1i8PiKluBKq521Gvcvyv332K84HaV93uq/0pzPcK7dSa?=
 =?us-ascii?Q?2r0vbyLLEQNVzxWwwIt1Bxj8NF3fK+6N3+J7jPTZENHu9YM3OQlH+QfNePMZ?=
 =?us-ascii?Q?kZvaZkJSXTPYx9aMKVkAwZNc4J11t5E=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5647bab-b6e1-4deb-1fd6-08da2843a750
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:47:06.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLqY6BKoHOgH2oOaU+eGQpudjjTOhlZoxVqW7rNtDwx9yk4NrE0oaVW55wG19I7PWxi2Or8xycIIQ7w6meY4vsLzRRqzKOOyjP6N/MUPnVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1502
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Add the vdi part of the wave5 codec driver.
The wave5-vdi.h header defines common helper functions such as writing/reading register and handling endianness.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/wave5-vdi.c | 260 ++++++++++++++++++++++++
 drivers/staging/media/wave5/wave5-vdi.h |  81 ++++++++
 2 files changed, 341 insertions(+)
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.h

diff --git a/drivers/staging/media/wave5/wave5-vdi.c b/drivers/staging/media/wave5/wave5-vdi.c
new file mode 100644
index 000000000000..bbde868de42e
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vdi.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave5 series multi-standard codec IP - low level access functions
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#include <linux/bug.h>
+#include "wave5-vdi.h"
+#include "wave5-vpu.h"
+#include "wave5-regdefine.h"
+#include <linux/delay.h>
+
+#define VDI_SRAM_BASE_ADDR 0x00
+
+#define VDI_SYSTEM_ENDIAN VDI_LITTLE_ENDIAN
+#define VDI_128BIT_BUS_SYSTEM_ENDIAN VDI_128BIT_LITTLE_ENDIAN
+
+static int wave5_vdi_allocate_common_memory(struct device *dev)
+{
+	int ret;
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	if (!vpu_dev->common_mem.vaddr) {
+		vpu_dev->common_mem.size = SIZE_COMMON;
+		ret = wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
+		if (ret) {
+			dev_err(dev, "unable to allocate common buffer\n");
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "common_mem: daddr=%pad size=%zu vaddr=0x%p\n",
+		&vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
+			vpu_dev->common_mem.vaddr);
+
+	return 0;
+}
+
+int wave5_vdi_init(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+	int i;
+	int ret;
+
+	ret = wave5_vdi_allocate_common_memory(dev);
+	if (ret < 0) {
+		dev_err(dev, "[VDI] fail to get vpu common buffer from driver\n");
+		return ret;
+	}
+
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		// if BIT processor is not running.
+		if (wave5_vdi_readl(vpu_dev, W5_VCPU_CUR_PC) == 0) {
+			for (i = 0; i < 64; i++)
+				wave5_vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
+		}
+	} else {
+		WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->product_code);
+	}
+
+	dev_dbg(dev, "[VDI] success to init driver\n");
+
+	return 0;
+}
+
+int wave5_vdi_release(struct device *dev)
+{
+	struct vpu_device *vpu_dev = dev_get_drvdata(dev);
+
+	vpu_dev->vdb_register = NULL;
+	wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
+
+	return 0;
+}
+
+void wave5_vdi_write_register(struct vpu_device *vpu_dev, unsigned int addr, unsigned int data)
+{
+	writel(data, vpu_dev->vdb_register + addr);
+}
+
+unsigned int wave5_vdi_readl(struct vpu_device *vpu_dev, u32 addr)
+{
+	return readl(vpu_dev->vdb_register + addr);
+}
+
+int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	if (!vb || !vb->vaddr) {
+		dev_err(vpu_dev->dev, "%s(): unable to clear unmapped buffer\n", __func__);
+		return -EINVAL;
+	}
+
+	memset(vb->vaddr, 0, vb->size);
+	return vb->size;
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian);
+
+int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb, size_t offset,
+			   u8 *data, int len, int endian)
+{
+	if (!vb || !vb->vaddr) {
+		dev_err(vpu_dev->dev, "%s(): unable to write to unmapped buffer\n", __func__);
+		return -EINVAL;
+	}
+
+	if (offset > vb->size || len > vb->size || offset + len > vb->size) {
+		dev_err(vpu_dev->dev, "%s(): buffer too small\n", __func__);
+		return -ENOSPC;
+	}
+
+	wave5_swap_endian(vpu_dev, data, len, endian);
+	memcpy(vb->vaddr + offset, data, len);
+
+	return len;
+}
+
+int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb->size) {
+		dev_err(vpu_dev->dev, "%s(): requested size==0\n", __func__);
+		return -EINVAL;
+	}
+
+	vaddr = dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+	vb->vaddr = vaddr;
+	vb->daddr = daddr;
+
+	return 0;
+}
+
+void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	if (vb->size == 0)
+		return;
+
+	if (!vb->vaddr)
+		dev_err(vpu_dev->dev, "%s(): requested free of unmapped buffer\n", __func__);
+	else
+		dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
+
+	memset(vb, 0, sizeof(*vb));
+}
+
+int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endian)
+{
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		switch (endian) {
+		case VDI_LITTLE_ENDIAN:
+			endian = 0x00;
+			break;
+		case VDI_BIG_ENDIAN:
+			endian = 0x0f;
+			break;
+		case VDI_32BIT_LITTLE_ENDIAN:
+			endian = 0x04;
+			break;
+		case VDI_32BIT_BIG_ENDIAN:
+			endian = 0x03;
+			break;
+		}
+	}
+
+	return (endian & 0x0f);
+}
+
+static void byte_swap(unsigned char *data, int len)
+{
+	u8 temp;
+	int i;
+
+	for (i = 0; i < len; i += 2) {
+		temp = data[i];
+		data[i] = data[i + 1];
+		data[i + 1] = temp;
+	}
+}
+
+static void word_swap(unsigned char *data, int len)
+{
+	u16 temp;
+	u16 *ptr = (u16 *)data;
+	int i;
+	s32 size = len / sizeof(uint16_t);
+
+	for (i = 0; i < size; i += 2) {
+		temp = ptr[i];
+		ptr[i] = ptr[i + 1];
+		ptr[i + 1] = temp;
+	}
+}
+
+static void dword_swap(unsigned char *data, int len)
+{
+	u32 temp;
+	u32 *ptr = (u32 *)data;
+	s32 size = len / sizeof(uint32_t);
+	int i;
+
+	for (i = 0; i < size; i += 2) {
+		temp = ptr[i];
+		ptr[i] = ptr[i + 1];
+		ptr[i + 1] = temp;
+	}
+}
+
+static void lword_swap(unsigned char *data, int len)
+{
+	u64 temp;
+	u64 *ptr = (u64 *)data;
+	s32 size = len / sizeof(uint64_t);
+	int i;
+
+	for (i = 0; i < size; i += 2) {
+		temp = ptr[i];
+		ptr[i] = ptr[i + 1];
+		ptr[i + 1] = temp;
+	}
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int len, int endian)
+{
+	int changes;
+	int sys_endian;
+	bool byte_change, word_change, dword_change, lword_change;
+
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		sys_endian = VDI_128BIT_BUS_SYSTEM_ENDIAN;
+	} else {
+		dev_err(vpu_dev->dev, "unknown product id : %08x\n", vpu_dev->product_code);
+		return;
+	}
+
+	endian = wave5_vdi_convert_endian(vpu_dev, endian);
+	sys_endian = wave5_vdi_convert_endian(vpu_dev, sys_endian);
+	if (endian == sys_endian)
+		return;
+
+	changes = endian ^ sys_endian;
+	byte_change = changes & 0x01;
+	word_change = ((changes & 0x02) == 0x02);
+	dword_change = ((changes & 0x04) == 0x04);
+	lword_change = ((changes & 0x08) == 0x08);
+
+	if (byte_change)
+		byte_swap(data, len);
+	if (word_change)
+		word_swap(data, len);
+	if (dword_change)
+		dword_swap(data, len);
+	if (lword_change)
+		lword_swap(data, len);
+}
+
diff --git a/drivers/staging/media/wave5/wave5-vdi.h b/drivers/staging/media/wave5/wave5-vdi.h
new file mode 100644
index 000000000000..f26cab7ac845
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vdi.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave5 series multi-standard codec IP - low level access functions
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#ifndef _VDI_H_
+#define _VDI_H_
+
+#include "wave5-vpuconfig.h"
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+
+/************************************************************************/
+/* COMMON REGISTERS */
+/************************************************************************/
+#define VPU_PRODUCT_CODE_REGISTER 0x1044
+
+/* system register write */
+#define vpu_write_reg(VPU_INST, ADDR, DATA) wave5_vdi_write_register(VPU_INST, ADDR, DATA)
+// system register read
+#define vpu_read_reg(CORE, ADDR) wave5_vdi_readl(CORE, ADDR)
+
+struct vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+	void *vaddr;
+};
+
+struct dma_vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+};
+
+enum endian_mode {
+	VDI_LITTLE_ENDIAN = 0, /* 64bit LE */
+	VDI_BIG_ENDIAN, /* 64bit BE */
+	VDI_32BIT_LITTLE_ENDIAN,
+	VDI_32BIT_BIG_ENDIAN,
+	/* WAVE PRODUCTS */
+	VDI_128BIT_LITTLE_ENDIAN = 16,
+	VDI_128BIT_LE_BYTE_SWAP,
+	VDI_128BIT_LE_WORD_SWAP,
+	VDI_128BIT_LE_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_SWAP,
+	VDI_128BIT_LE_DWORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_SWAP,
+	VDI_128BIT_BE_DWORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_SWAP,
+	VDI_128BIT_BE_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_WORD_SWAP,
+	VDI_128BIT_BE_BYTE_SWAP,
+	VDI_128BIT_BIG_ENDIAN = 31,
+	VDI_ENDIAN_MAX
+};
+
+#define VDI_128BIT_ENDIAN_MASK 0xf
+
+int wave5_vdi_init(struct device *dev);
+int wave5_vdi_release(struct device *dev);	//this function may be called only at system off.
+
+/**
+ * @brief make clock stable before changing clock frequency
+ * @detail before invoking vdi_set_clock_freg caller MUST invoke vdi_ready_change_clock
+ *		function.
+ * after changing clock frequency caller also invoke wave5_vdi_done_change_clock() function.
+ * @return 0 failure
+ * 1 success
+ */
+int wave5_vdi_ready_change_clock(unsigned long core_idx);
+int wave5_vdi_set_change_clock(unsigned long core_idx, unsigned long clock_mask);
+int wave5_vdi_done_change_clock(unsigned long core_idx);
+int wave5_vdi_buffer_sync(struct device *dev, struct vpu_buf *vb, int dir);
+
+#endif //#ifndef _VDI_H_
+
-- 
2.30.2

