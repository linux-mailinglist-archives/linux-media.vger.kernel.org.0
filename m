Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3C755D1D5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345391AbiF1LIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 07:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiF1LIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 07:08:37 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2112.outbound.protection.outlook.com [40.107.129.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA90275F7
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adkp/rgcBBt74WFuiKQwTv+fQ9mbBsilhLZG7uRyQ4k+V+Kov9Z2fiX13Tb8Y8XvhpoyvEABqQHikn6fcb51ZekSNg372iUUIVlir53cTnd+TvuhwOIUvNlOGbfPCXaY02Ay7bFZZHCpL7+5ioYl7Gr04uVL9B9asxAHYdxrng7xrgWs+WnIrZayhwi2bCgQR0l0/Q7lPwLMrI9gUnPyIw+qi02KlTZ5Kca8hdbLETxhtj23B/3UnG6xKJmlsnKjVzgVi/S0CaKKnT4fXsnfW6xAioISBwAECxdpRTsX32mAFEr7JNy5Oq6wrXtIXljfTpaL1AFZYoYafFTBua4jlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc+DbhJOvEqkSsG3iaRhbGXehxwVWjylanIkoEI4XEc=;
 b=FgVG1sndrQzzx0UbBIB9sQuDUNZNydqL/8dIGYJrP6iNnCLuGCNJBfVVbsZhPO6LNFM17btREsx8C7uei1PjRasd8bHSB/pPurLtc5oKjgOm/a1SIaJHIjHOj8PVfad4IH9BRWUTULObhfzRhiLoDuH1CrNYlocGTsrDzOl2F7DJm1Y2LYWWpaMf6dRG/9Y3sFEsk6q85qPDip9hZNJKu7Gc6DfNZoLRCppFprA2/hVrRSCo3PqQY3G9N9KAUSBHaebGgYHniU9tTQqsEo1nYx916Za3zne99xGXu5TlqFIrZkCjx1IWRRu2zq98eaEwKl+oUNaDIQDwRiBmaTQlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc+DbhJOvEqkSsG3iaRhbGXehxwVWjylanIkoEI4XEc=;
 b=Sj4EkVkYSLWAaqSjAzJZWR4UyHWIAtrP5xezQV1hA1czck+inU5Gy5evbrWlbME1sIEVVZvJgdctjbXMvDBV+MoJVMtoTKdh7DDNl8pFPwvNRl46g3qWokpdANIwcU7PyMEYvoV/YtPniwpHTqHDaglfijvgvRLB71JGgt58q2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0386.KORP216.PROD.OUTLOOK.COM (2603:1096:300:28::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Tue, 28 Jun 2022 11:08:34 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 11:08:34 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-staging@lists.linux.dev,
        mchehab@kernel.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>
Subject: [PATCH v9 2/6] staging: media: wave5: Add the vdi layer
Date:   Tue, 28 Jun 2022 20:08:17 +0900
Message-Id: <20220628110821.716-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628110821.716-1-nas.chung@chipsnmedia.com>
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0222.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4ca6151-ad10-4af3-e931-08da58f68ab6
X-MS-TrafficTypeDiagnostic: PS2P216MB0386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOHNQGcQ3g4omnTm4rbH8LJG18EsMd7oawlPLJJGJO07f/ks7OP856qaO+92FQkGi1z7OQ9v40FmZPv3q8iSPnBgGZpCTz1xYMDEN0mBn3Op2ym0ujWVZW2/P2tREpHs7/19uyxUbnFmnAakzbpQKWXTlgbYmYv2ikTbxqCCrUfokCK6DX6fgKtQrpwf5DW4qb8tYg8DVbyOIpQ+sG22PUKhwccr2HK4/x7cqYexRHC/VMYKgSnE3TrhcvByqC3tG0Hng0cbuGnO0OF9k5d2wArd+LBB+uhgtdIXfoXh28tYtphusRjPuRrKjkz4rh7vroqPvslXFXuH5YL7JS/D0GqD87oJSzSFuWX3tIIyvPhUz+A0Vg1SazLMKE+xoz9er2yLdU7YMhCoASbHYOoufwyfsuXlkJnH1zl5e6GQUqfnAbJ0lxR6a30MykWGIiVmIMzW9Mx1Rgg/D7CHWJeXyyV+/0fOC+N/NJmT5/UE+5c2E2hih+Sw+e3Cql7Hi2t4QQjeNcDVixSq6i4Bc/7RmDdMacFk9cjwAmITgSzG+ioekw8yRFtMd4cIjT2+6gJPo2b2aXQunoQ+lxdZn9Gpn0VtWYYHf5p/eKGICGd02DfX2A23YnMOnC1xSvo6O5Dev4WZ1Z2S3OoHAvHvK1E10n3T6xr7rYd1yQE/IqGcKnJF432hOo+luNfgFJuMFUi7o18PD2g3BCXwp7XP1GRz+aEGwDWjD8l8Ko28CAUxhFVXmLSpmrkzeoGzGGAnG5pbAZ/q8cbFn4lHQK2a//td/5sroZ8uq5M7yB/Gl92iPOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(346002)(396003)(376002)(136003)(1076003)(66476007)(66556008)(4326008)(8676002)(6486002)(2616005)(66946007)(8936002)(6916009)(52116002)(6512007)(6506007)(186003)(6666004)(83380400001)(478600001)(54906003)(41300700001)(26005)(38100700002)(2906002)(86362001)(44832011)(5660300002)(36756003)(316002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZtuUhfwzvaDjFq4+uIxQ+AJIOy7uioPY7Apfda8BJ/2sV+lgJNyAs8ddRrG?=
 =?us-ascii?Q?eAYbb1BdLSbVcjf02voVRcLmeaWRwfRpTqCg8r1YKd9HSUNQcckhvCBHnZej?=
 =?us-ascii?Q?35JLAKK0oxvsUkre74VEkKhgVb1ZtY3FYRffldfG1Ldee7U1cWFpi5K/Pkx/?=
 =?us-ascii?Q?jjjIoMY+uHqqKA/Kvrey2WZKKf1aONsi+fId/PxDrvqAGPvaWhOJVTzqMPL/?=
 =?us-ascii?Q?BWGy95QECXTJCQ7asQn+ShSsqTrLvRQEIzzTwHOp2+tDO1CMFsU5O0IEcxk7?=
 =?us-ascii?Q?hPu0qNqAv1mkKwr2o+VYjPt2c54KEn/MATfaUhEnjN7uzD4EKDV6xKfrErXN?=
 =?us-ascii?Q?VzEC+aT/C3O94zZLziahdfC9AoXjNBvTtKFZfk8Kupzz13phZmVkKI9XW0PP?=
 =?us-ascii?Q?5b6rlNbo8/s6gSbOaw+zBTx6y76/Wk8jfv/gWlDkzeNA43M4DKEwMsbv5vmu?=
 =?us-ascii?Q?QWU+DDLSGZxavwRffUGiLkqZbYTpH0FMqQvtMd1pD4fEUZujhT7/Fuu78tyn?=
 =?us-ascii?Q?Icn3Wqr+QTp0/Io/drPscnSDqfoH963OcdhQ8FxDoAPjq9X44s7YJj916i79?=
 =?us-ascii?Q?wlaIkbWg7ynlvv5g3N/8SenY3CvlkCxHti0OJqbHcliVdIB65rcxTnbroNh9?=
 =?us-ascii?Q?x1CJoD7HMBuB+D+65i4zG7dQwg/SU9Eqz/Uu8NQ/t5PttfaELCfT3H8O/Ifj?=
 =?us-ascii?Q?EB1WZDHGhAHqEw5mW9E/exonAfEyOf1B7pZXefuku9c97NsSx5n1liVbEUzk?=
 =?us-ascii?Q?juau1fnUcCO/mN/SEzpUTn0qYJV+7IsLvexNxbNnuIqpSGixzO6hbkruErOV?=
 =?us-ascii?Q?3A1pq+qbbO2JddwmQ70OVTu3hdCEpMcpmZdnDPs42seyHz4hjX1/pGxc5VWI?=
 =?us-ascii?Q?jJRLT5wSX+kkEis2YLCK2GWfGab8TtW1PMxajmHcBqsMn/5e2qbtAEH5jME+?=
 =?us-ascii?Q?qmtyWJgylkUvkAUSy6qzk9f+N5cZrL/oAjFp0CrmKbIbnBjcQMbfVpv7iQCS?=
 =?us-ascii?Q?zscVNHk9Arwk14BH9cRtNA2YC4siPIIztSE9JqK/jZCZoM3+ZvroYpSAFWtU?=
 =?us-ascii?Q?S1eoDHEVbOFa+h550d2e7P5emwi+h3nOmod31Cn3muyJYDSLb0sew8By7ykH?=
 =?us-ascii?Q?7YGORGonSwSdt7N8Dv/DKo1dsEQHPQ3qjl2zvr3WVhisXs9Bv2T0iKNX24K5?=
 =?us-ascii?Q?sqrwN3dvWAlKJn7H/iNmbkNF98AIZJY8KwQSy1CCEO+q1bNjQHszvgBbOW6u?=
 =?us-ascii?Q?DrEyRWngWoLQiggYrQ2YFr7Tpf1d8vp8HDLIf70ANBYlwkIpDWaWNXQDwczA?=
 =?us-ascii?Q?1yXuFgqwsIXOuXTXNINS2KlVKKI7sUyrxtntUB0CqWpSNTNL0tE/KB/lSfS0?=
 =?us-ascii?Q?enIMCIinxbjRo0frGkcNxbAewy5wnUKGkYgksAzXXvEVG/TG8Tzj23hd/6Dh?=
 =?us-ascii?Q?z6NmJp9hmeYO3RanFx6PkudYSXCycgMR4wprSccx8TXLp7b27M5ovkNkHvjq?=
 =?us-ascii?Q?+QbOIWkAKxAgc5SEpKjfutax25Roq5kRDFAnqqaVWqgezNT8axyGoYOD3drt?=
 =?us-ascii?Q?mPMSecy1FLajjn3u+054SblaIaKc2NXqeoJ3TABot6WUs6sireMm7caACdg0?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ca6151-ad10-4af3-e931-08da58f68ab6
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 11:08:34.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3N/Z/8Pwek4Y/5K30V7HAipV5iMzZybuhxh84d0Fp+O+MU+fE9ldsLw5nvKussNhfHd9WfIJOINs7eikLAnHbofEjITYU1qY32YzNfYbHTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0386
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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

