Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8813E8C41
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhHKIpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:45:31 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:49541
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236500AbhHKIpZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:45:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQMldMoB29GcRIdvQgUUh408GOVHQ8H4HUO9VY05nWAXn8lgJJqTS5mStRTb+PQsE88RmHlSqqPrpUnRd2vqCJUekDqfiyqIsgmYq7unpM6Vwhu/rZPVo2O4xiCAHxVNuBiYr7uMqOJ1wlAS7fgczXPRRQ4VPvJVY1Rmv6+Nzu+BJqxy70KnGej9SRGAOP0QUWVMusn7AJE3iBp0Z4XLjGcKz/Gat0H48Tq+Bi2ACLGSZTPh+B6jPEmuYF+KbGyDL9wq3lAgSAu4H38+2iUvhF4cWIkeF9NH+VheydyKiKsHMIZh6bTzz2vUhkOqECcLO70yIxCIhqYj6vPdlp8P8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obr0aP99skifWDOnNJChE+8/ativxjvmotGqewxWE0I=;
 b=goYMIVLD4//4oD2wrnlJhlVfQTNrhW7qOCaZFKAjxmhvy3Gzn5fz+pfEehESnlE+bfblmpUPJqGpVGl+U7OTPqxrYdlsVwOVdPfutiqzRqku4AbfScT+H6eQ5M3ZlBcrunmQpJpOU7TGKdDvhexiHUyrd+XX9ndJGU74VRWUFy9sbRYJcdU/w8Z7tNkxHpGpFnYh5NVLZ+jRqWLf6ZPU2ktqHR9KXlAMsEeqO1+HvJPUcegi555PIoBuiWOoU9vvTj4vNqzn+IzwC0RSiMB+5oE9kBbc3LD9XIApbXRywzFwvoqUqRrT0Wf8heRHqqORX6JmveK85WM6//cNMhVdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obr0aP99skifWDOnNJChE+8/ativxjvmotGqewxWE0I=;
 b=lACUvIwY8VMC/0oE8LbLiuwH/r7parfeJwecQ6Yqnvoj/9Wp4338nyWBrxnkvnrd1pj8Yc91Wt9sOSMyz4qvML5R6p59LgBr+sew5cE8+e5e1e49Z7yisF/9mCV61cypp2F7cdfRFmq4yEmN24DcdESnxgLvU9SEjpl+SxXBewM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 08:44:38 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:44:38 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 10/14] media: imx: imx8q: implement windsor encoder rpc interface
Date:   Wed, 11 Aug 2021 16:43:06 +0800
Message-Id: <aa51962b851fe8d0d7cafe6f13b5a2141010bacc.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628671163.git.ming.qian@nxp.com>
References: <cover.1628671163.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:44:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85c1b618-68ea-4087-f231-08d95ca4409a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB48880690CC74A10AFE554B32E7F89@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXO18gqDX9CSsL/XfSzvZ3QEVXlKsXGYjqNv9y6y4prs7zwf+Oc/7YJc2zURSmIZ/9ILLXcyK6acLV0e2Q/8FH+l7tL93AxbcAdPpOEAfV5OSieOL7sSrrGGiSJwjb1tWRnIRLmQX/zMCiGLnQc5Twq+spte3vheZjcLgKQ8+Y/gqiw+xQtiEbKZ48z200OG1wZZC4lRI38rQ1Roq67zsisx+rcpY5tOfYU2QcPYVMiGoCd8nkfAhZxDUvn9V+TiS1wU9H6I1n9y3w67mmP45ousGqiW2UK0BVfq1wutnSOZpXuRGoRh6L7qkG2LmEKU8dCUniQ4+iflge0BMQaZS2orJMlGWgyRtdPSyfDB8EJwiJSN75Omv0HRpVRnCxCsd7Z4qYnh9g2e4uYmikni3c84cq3sazhejhrhygRll8yBqbvs7CCJEUt5e7aplDolkXkutoHoGQJa5oqSBu2LHZ4zzxB1vMuOjObitB3Ra0W8WH6E8tv0l8bNVlVWfaVIaDZXaS1/WUocnCATTcunkAN6r7qSE/1WqXPxR2+8Nb+aqyx2DyMpGYS0OICMTk80FcMXl6JE/0DJUqXcQTCKOwNhS5OXi//OGjgqp93onDv2ZYPIdzTnBT22OgZ7/xK35SSe7NdZ80Ae3EZxA5slk0XdKZZJMz7KdU6ttYLRpjOujwgI8CJje0qDiL5OJQieX4YFqiQ5P06GX5rrp2txbz7aeNDyKr11y+UkWD3tsVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(7416002)(86362001)(8676002)(6486002)(36756003)(44832011)(2616005)(956004)(4326008)(7696005)(2906002)(38100700002)(66476007)(478600001)(26005)(52116002)(66556008)(66946007)(38350700002)(186003)(8936002)(316002)(6666004)(5660300002)(83380400001)(30864003)(32563001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+aHnVYZVDgI2/XApbxNFYJMWYVI0HBS+RxPdn03mbaw8AeEGH7kECI7o+zHP?=
 =?us-ascii?Q?+GhxCzOEQrCQ4aoigoGViJYLK+cx1dNC/PU9RITLkUHAyQ9gSviffVR9qi0b?=
 =?us-ascii?Q?A3NPU7Y6vzdiQsTebpKsmHsW1bRZU3ly8vimag7D5hteckwG1gR9pGMHhruy?=
 =?us-ascii?Q?+ueTPJ5N3WB31qFoT16Q2Q8ARERov7/OaX5/LjiAxbPRDS2MkaL++/SCCnBc?=
 =?us-ascii?Q?ylc9OAo1av628cvOxIXcACjq9pZjj74fS3rnDxN54T+kvR3+zNdXB1JjLdkj?=
 =?us-ascii?Q?AaOJ1CYsvzp4QiBqa1aWjjFv23J/joUPbiZ7qJi5AdN+VfPNPkGtjSaJvazP?=
 =?us-ascii?Q?2sxwxeG9ChqAkHmS5z4SZJWFd42DI7nDxzyJ3xUh1GVggvqrjBCSXuyRrcLp?=
 =?us-ascii?Q?T80f8iHAqkY6+2mBw6EfnjT9lFKt4nLg+e94NTVEaBuiKe1SO01lnLYm3FUh?=
 =?us-ascii?Q?WnCJv5iBMYznaW+Fo+3sRZc8RvC/05xYYNVj+ZEkEPULz0IzxGcKhXvzBxcE?=
 =?us-ascii?Q?RlkTORJCb+Ojiwbhxk9LYVRJHWZ2q/L8MjCK0UZmYQVP12UNSUkdYdx96giX?=
 =?us-ascii?Q?QaO7ulVc8mqha358h5vvzGwEw/3pN5hWdmM+Ac5eLngpgdidvihWt5SldjjU?=
 =?us-ascii?Q?aihk9Y3g7gJp5kF28Q0jmxzQxhirY+04aOSUiro0S6BYpmdhvbqz5wgjWguH?=
 =?us-ascii?Q?zQdhRduRFw35PFBmS01YIwrNHdr9wVzbVIPdfL70s7Ffc0u6dfcn1xRFEjEJ?=
 =?us-ascii?Q?DO0ohtwayrPtVlx3EOPGIWhcfXAKiFNx+jz4Gg6Z7Vv+K1n2a82oMXaIdbTs?=
 =?us-ascii?Q?4p36XyS5txwxhICxevhEZsCHmQhKxVVWg8Hq39a0W19LEZouq81jD3aKJGK5?=
 =?us-ascii?Q?+RC7R6G+luYtWiP3ugqsrKinizeJr9fibUAbX2EbWjhIANtWyLsdXnFwFqvr?=
 =?us-ascii?Q?BHgJ0guKsn8c61kFxw+N0600KVRBOMtlA4y1zDMiddctjmcz69RnZ4tE4Hn6?=
 =?us-ascii?Q?uSf+hte+Va7xGwJLiNwkD1c/U49qRx52Sv6p+w4m2ddz5kPg8FqMfHvQDJzM?=
 =?us-ascii?Q?5RMoVbILGID1ChL0Idhrhno6otV4GwWBztMEW3tXd3q1sWaWP1Emlz3FAGVg?=
 =?us-ascii?Q?byqliumTumFGyCBFH8559tyIlfqRQHzlI4eRjYJw5L4WshUEEvTYatYiAV2S?=
 =?us-ascii?Q?Ynw4vf3G+cK9u6zZ+JCUYtHauXtI9G6ChifpmQCkDahwxbkLbeZl9J0EPq0l?=
 =?us-ascii?Q?nkAcvgMMAovOBao6q8+bhCX4FOf/Lsn3v2yA1sTvZ3O5krQdqXHO6Vwlr3aC?=
 =?us-ascii?Q?rdV2ruqJZ86bACLqYLLxaKC5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c1b618-68ea-4087-f231-08d95ca4409a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:44:38.0592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zup8q+vv/CUxaosCwANjmdMsjV3CBNCMIS9pj8IWlada73pobGRImY8XjRTyIMi6UyZhCWgWXcM5Qi8+epwmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This part implements the windsor encoder rpc interface.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  218 +++
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  116 ++
 .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1244 +++++++++++++++++
 .../media/platform/imx/vpu-8q/vpu_windsor.h   |   39 +
 4 files changed, 1617 insertions(+)
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.h

diff --git a/drivers/media/platform/imx/vpu-8q/vpu_imx8q.c b/drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
new file mode 100644
index 000000000000..0ec840f07e77
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"IMX8Q"
+
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/types.h>
+#include "vpu.h"
+#include "vpu_core.h"
+#include "vpu_imx8q.h"
+#include "vpu_rpc.h"
+#include "vpu_log.h"
+
+#define IMX8Q_CSR_CM0Px_ADDR_OFFSET			0x00000000
+#define IMX8Q_CSR_CM0Px_CPUWAIT				0x00000004
+
+#ifdef CONFIG_IMX_SCU
+#include <linux/firmware/imx/ipc.h>
+#include <linux/firmware/imx/svc/misc.h>
+
+#define VPU_DISABLE_BITS			0x7
+#define VPU_IMX_DECODER_FUSE_OFFSET		14
+#define VPU_ENCODER_MASK			0x1
+#define VPU_DECODER_MASK			0x3UL
+#define VPU_DECODER_H264_MASK			0x2UL
+#define VPU_DECODER_HEVC_MASK			0x1UL
+
+static u32 imx8q_fuse;
+
+struct vpu_sc_msg_misc {
+	struct imx_sc_rpc_msg hdr;
+	u32 word;
+} __packed;
+#endif
+
+int vpu_imx8q_set_system_cfg_common(struct vpu_rpc_system_config *config,
+		u32 regs, u32 core_id)
+{
+	if (!config)
+		return -EINVAL;
+
+	switch (core_id) {
+	case 0:
+		config->malone_base_addr[0] = regs + DEC_MFD_XREG_SLV_BASE;
+		config->num_malones = 1;
+		config->num_windsors = 0;
+		break;
+	case 1:
+		config->windsor_base_addr[0] = regs + ENC_MFD_XREG_SLV_0_BASE;
+		config->num_windsors = 1;
+		config->num_malones = 0;
+		break;
+	case 2:
+		config->windsor_base_addr[0] = regs + ENC_MFD_XREG_SLV_1_BASE;
+		config->num_windsors = 1;
+		config->num_malones = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (config->num_windsors) {
+		config->windsor_irq_pin[0x0][0x0] = WINDSOR_PAL_IRQ_PIN_L;
+		config->windsor_irq_pin[0x0][0x1] = WINDSOR_PAL_IRQ_PIN_H;
+	}
+
+	config->malone_base_addr[0x1] = 0x0;
+	config->hif_offset[0x0] = MFD_HIF;
+	config->hif_offset[0x1] = 0x0;
+
+	config->dpv_base_addr = 0x0;
+	config->dpv_irq_pin = 0x0;
+	config->pixif_base_addr = regs + DEC_MFD_XREG_SLV_BASE + MFD_PIX_IF;
+	config->cache_base_addr[0] = regs + MC_CACHE_0_BASE;
+	config->cache_base_addr[1] = regs + MC_CACHE_1_BASE;
+
+	return 0;
+}
+
+int vpu_imx8q_boot_core(struct vpu_core *core)
+{
+	csr_writel(core, IMX8Q_CSR_CM0Px_ADDR_OFFSET, core->fw.phys);
+	csr_writel(core, IMX8Q_CSR_CM0Px_CPUWAIT, 0);
+	return 0;
+}
+
+int vpu_imx8q_get_power_state(struct vpu_core *core)
+{
+	if (csr_readl(core, IMX8Q_CSR_CM0Px_CPUWAIT) == 1)
+		return 0;
+	return 1;
+}
+
+int vpu_imx8q_on_firmware_loaded(struct vpu_core *core)
+{
+	u8 *p;
+
+	p = core->fw.virt;
+	p[16] = core->vpu->res->plat_type;
+	p[17] = core->id;
+	p[18] = 1;
+
+	return 0;
+}
+
+u32 vpu_imx8q_check_memory_region(dma_addr_t base, dma_addr_t addr, u32 size)
+{
+	const struct vpu_rpc_region_t imx8q_regions[] = {
+		{0x00000000, 0x08000000, VPU_CORE_MEMORY_CACHED},
+		{0x08000000, 0x10000000, VPU_CORE_MEMORY_UNCACHED},
+		{0x10000000, 0x20000000, VPU_CORE_MEMORY_CACHED},
+		{0x20000000, 0x40000000, VPU_CORE_MEMORY_UNCACHED}
+	};
+	int i;
+
+	if (addr < base)
+		return VPU_CORE_MEMORY_INVALID;
+
+	addr -= base;
+	for (i = 0; i < ARRAY_SIZE(imx8q_regions); i++) {
+		const struct vpu_rpc_region_t *region = &imx8q_regions[i];
+
+		if (addr >= region->start && addr + size < region->end)
+			return region->type;
+	}
+
+	return VPU_CORE_MEMORY_INVALID;
+}
+
+#ifdef CONFIG_IMX_SCU
+u32 vpu_imx8q_get_fuse(void)
+{
+	static u32 fuse_got;
+	struct imx_sc_ipc *ipc;
+	struct vpu_sc_msg_misc msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	if (fuse_got)
+		return imx8q_fuse;
+
+	ret = imx_scu_get_handle(&ipc);
+	if (ret) {
+		vpu_err("error: scu get handle fail: %d\n", ret);
+		return 0;
+	}
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_MISC;
+	hdr->func = IMX_SC_MISC_FUNC_OTP_FUSE_READ;
+	hdr->size = 2;
+
+	msg.word = VPU_DISABLE_BITS;
+
+	ret = imx_scu_call_rpc(ipc, &msg, true);
+	if (ret)
+		return 0;
+
+	imx8q_fuse = msg.word;
+	fuse_got = 1;
+	vpu_dbg(LVL_INFO, "imx8q fuse = 0x%x\n", imx8q_fuse);
+	return imx8q_fuse;
+}
+
+bool vpu_imx8q_check_codec(enum vpu_core_type type)
+{
+	u32 fuse = vpu_imx8q_get_fuse();
+
+	if (type == VPU_CORE_TYPE_ENC) {
+		if (fuse & VPU_ENCODER_MASK)
+			return false;
+	} else if (type == VPU_CORE_TYPE_DEC) {
+		fuse >>= VPU_IMX_DECODER_FUSE_OFFSET;
+		fuse &= VPU_DECODER_MASK;
+
+		if (fuse == VPU_DECODER_MASK)
+			return false;
+	}
+	return true;
+}
+
+bool vpu_imx8q_check_fmt(enum vpu_core_type type, u32 pixelfmt)
+{
+	u32 fuse = vpu_imx8q_get_fuse();
+
+	if (type == VPU_CORE_TYPE_DEC) {
+		fuse >>= VPU_IMX_DECODER_FUSE_OFFSET;
+		fuse &= VPU_DECODER_MASK;
+
+		if (fuse == VPU_DECODER_HEVC_MASK && pixelfmt == V4L2_PIX_FMT_HEVC)
+			return false;
+		if (fuse == VPU_DECODER_H264_MASK && pixelfmt == V4L2_PIX_FMT_H264)
+			return false;
+		if (fuse == VPU_DECODER_MASK)
+			return false;
+	}
+
+	return true;
+}
+#else
+bool vpu_imx8q_check_codec(enum vpu_core_type type)
+{
+	return true;
+}
+
+bool vpu_imx8q_check_fmt(enum vpu_core_type type, u32 pixelfmt)
+{
+	return true;
+}
+#endif
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_imx8q.h b/drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
new file mode 100644
index 000000000000..e8b1fa1da9c0
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _IMX_VPU_8Q_H
+#define _IMX_VPU_8Q_H
+
+#define SCB_XREG_SLV_BASE                               0x00000000
+#define SCB_SCB_BLK_CTRL                                0x00070000
+#define SCB_BLK_CTRL_XMEM_RESET_SET                     0x00000090
+#define SCB_BLK_CTRL_CACHE_RESET_SET                    0x000000A0
+#define SCB_BLK_CTRL_CACHE_RESET_CLR                    0x000000A4
+#define SCB_BLK_CTRL_SCB_CLK_ENABLE_SET                 0x00000100
+
+#define XMEM_CONTROL                                    0x00041000
+
+#define	MC_CACHE_0_BASE					0x00060000
+#define	MC_CACHE_1_BASE					0x00068000
+
+#define DEC_MFD_XREG_SLV_BASE                           0x00180000
+#define ENC_MFD_XREG_SLV_0_BASE				0x00800000
+#define ENC_MFD_XREG_SLV_1_BASE				0x00A00000
+
+#define MFD_HIF                                         0x0001C000
+#define MFD_HIF_MSD_REG_INTERRUPT_STATUS                0x00000018
+#define MFD_SIF                                         0x0001D000
+#define MFD_SIF_CTRL_STATUS                             0x000000F0
+#define MFD_SIF_INTR_STATUS                             0x000000F4
+#define MFD_MCX                                         0x00020800
+#define MFD_MCX_OFF                                     0x00000020
+#define MFD_PIX_IF					0x00020000
+
+#define MFD_BLK_CTRL                                    0x00030000
+#define MFD_BLK_CTRL_MFD_SYS_RESET_SET                  0x00000000
+#define MFD_BLK_CTRL_MFD_SYS_RESET_CLR                  0x00000004
+#define MFD_BLK_CTRL_MFD_SYS_CLOCK_ENABLE_SET           0x00000100
+#define MFD_BLK_CTRL_MFD_SYS_CLOCK_ENABLE_CLR           0x00000104
+
+#define VID_API_NUM_STREAMS				8
+#define VID_API_MAX_BUF_PER_STR				3
+#define VID_API_MAX_NUM_MVC_VIEWS			4
+#define MEDIAIP_MAX_NUM_MALONES				2
+#define MEDIAIP_MAX_NUM_MALONE_IRQ_PINS			2
+#define MEDIAIP_MAX_NUM_WINDSORS			1
+#define MEDIAIP_MAX_NUM_WINDSOR_IRQ_PINS		2
+#define MEDIAIP_MAX_NUM_CMD_IRQ_PINS			2
+#define MEDIAIP_MAX_NUM_MSG_IRQ_PINS			1
+#define MEDIAIP_MAX_NUM_TIMER_IRQ_PINS			4
+#define MEDIAIP_MAX_NUM_TIMER_IRQ_SLOTS			4
+
+#define WINDSOR_PAL_IRQ_PIN_L				0x4
+#define WINDSOR_PAL_IRQ_PIN_H				0x5
+
+struct vpu_rpc_system_config {
+	u32 cfg_cookie;
+
+	u32 num_malones;
+	u32 malone_base_addr[MEDIAIP_MAX_NUM_MALONES];
+	u32 hif_offset[MEDIAIP_MAX_NUM_MALONES];
+	u32 malone_irq_pin[MEDIAIP_MAX_NUM_MALONES][MEDIAIP_MAX_NUM_MALONE_IRQ_PINS];
+	u32 malone_irq_target[MEDIAIP_MAX_NUM_MALONES][MEDIAIP_MAX_NUM_MALONE_IRQ_PINS];
+
+	u32 num_windsors;
+	u32 windsor_base_addr[MEDIAIP_MAX_NUM_WINDSORS];
+	u32 windsor_irq_pin[MEDIAIP_MAX_NUM_WINDSORS][MEDIAIP_MAX_NUM_WINDSOR_IRQ_PINS];
+	u32 windsor_irq_target[MEDIAIP_MAX_NUM_WINDSORS][MEDIAIP_MAX_NUM_WINDSOR_IRQ_PINS];
+
+	u32 cmd_irq_pin[MEDIAIP_MAX_NUM_CMD_IRQ_PINS];
+	u32 cmd_irq_target[MEDIAIP_MAX_NUM_CMD_IRQ_PINS];
+
+	u32 msg_irq_pin[MEDIAIP_MAX_NUM_MSG_IRQ_PINS];
+	u32 msg_irq_target[MEDIAIP_MAX_NUM_MSG_IRQ_PINS];
+
+	u32 sys_clk_freq;
+	u32 num_timers;
+	u32 timer_base_addr;
+	u32 timer_irq_pin[MEDIAIP_MAX_NUM_TIMER_IRQ_PINS];
+	u32 timer_irq_target[MEDIAIP_MAX_NUM_TIMER_IRQ_PINS];
+	u32 timer_slots[MEDIAIP_MAX_NUM_TIMER_IRQ_SLOTS];
+
+	u32 gic_base_addr;
+	u32 uart_base_addr;
+
+	u32 dpv_base_addr;
+	u32 dpv_irq_pin;
+	u32 dpv_irq_target;
+
+	u32 pixif_base_addr;
+
+	u32 pal_trace_level;
+	u32 pal_trace_destination;
+
+	u32 pal_trace_level1;
+	u32 pal_trace_destination1;
+
+	u32 uHeapBase;
+	u32 uHeapSize;
+
+	u32 cache_base_addr[2];
+};
+
+int vpu_imx8q_setup_dec(struct vpu_dev *vpu);
+int vpu_imx8q_setup_enc(struct vpu_dev *vpu);
+int vpu_imx8q_setup(struct vpu_dev *vpu);
+int vpu_imx8q_reset(struct vpu_dev *vpu);
+int vpu_imx8q_set_system_cfg_common(struct vpu_rpc_system_config *config,
+		u32 regs, u32 core_id);
+int vpu_imx8q_boot_core(struct vpu_core *core);
+int vpu_imx8q_get_power_state(struct vpu_core *core);
+int vpu_imx8q_on_firmware_loaded(struct vpu_core *core);
+u32 vpu_imx8q_check_memory_region(dma_addr_t base, dma_addr_t addr, u32 size);
+bool vpu_imx8q_check_codec(enum vpu_core_type type);
+bool vpu_imx8q_check_fmt(enum vpu_core_type type, u32 pixelfmt);
+
+#endif
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_windsor.c b/drivers/media/platform/imx/vpu-8q/vpu_windsor.c
new file mode 100644
index 000000000000..fbd2c1a37aa9
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_windsor.c
@@ -0,0 +1,1244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"WINDSOR"
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "vpu.h"
+#include "vpu_rpc.h"
+#include "vpu_defs.h"
+#include "vpu_helpers.h"
+#include "vpu_cmds.h"
+#include "vpu_v4l2.h"
+#include "vpu_log.h"
+#include "vpu_imx8q.h"
+#include "vpu_windsor.h"
+
+#define CMD_SIZE				2560
+#define MSG_SIZE				25600
+#define WINDSOR_USER_DATA_WORDS			16
+#define WINDSOR_MAX_SRC_FRAMES			0x6
+#define WINDSOR_MAX_REF_FRAMES			0x3
+#define WINDSOR_BITRATE_UNIT			1024
+#define WINDSOR_H264_EXTENDED_SAR		255
+
+enum {
+	GTB_ENC_CMD_NOOP        = 0x0,
+	GTB_ENC_CMD_STREAM_START,
+	GTB_ENC_CMD_FRAME_ENCODE,
+	GTB_ENC_CMD_FRAME_SKIP,
+	GTB_ENC_CMD_STREAM_STOP,
+	GTB_ENC_CMD_PARAMETER_UPD,
+	GTB_ENC_CMD_TERMINATE,
+	GTB_ENC_CMD_SNAPSHOT,
+	GTB_ENC_CMD_ROLL_SNAPSHOT,
+	GTB_ENC_CMD_LOCK_SCHEDULER,
+	GTB_ENC_CMD_UNLOCK_SCHEDULER,
+	GTB_ENC_CMD_CONFIGURE_CODEC,
+	GTB_ENC_CMD_DEAD_MARK,
+	GTB_ENC_CMD_FIRM_RESET,
+	GTB_ENC_CMD_FW_STATUS,
+	GTB_ENC_CMD_RESERVED
+};
+
+enum {
+	VID_API_EVENT_UNDEFINED = 0x0,
+	VID_API_ENC_EVENT_RESET_DONE = 0x1,
+	VID_API_ENC_EVENT_START_DONE,
+	VID_API_ENC_EVENT_STOP_DONE,
+	VID_API_ENC_EVENT_TERMINATE_DONE,
+	VID_API_ENC_EVENT_FRAME_INPUT_DONE,
+	VID_API_ENC_EVENT_FRAME_DONE,
+	VID_API_ENC_EVENT_FRAME_RELEASE,
+	VID_API_ENC_EVENT_PARA_UPD_DONE,
+	VID_API_ENC_EVENT_MEM_REQUEST,
+	VID_API_ENC_EVENT_FIRMWARE_XCPT,
+	VID_API_ENC_EVENT_RESERVED
+};
+
+enum {
+	MEDIAIP_ENC_PIC_TYPE_B_FRAME = 0,
+	MEDIAIP_ENC_PIC_TYPE_P_FRAME,
+	MEDIAIP_ENC_PIC_TYPE_I_FRAME,
+	MEDIAIP_ENC_PIC_TYPE_IDR_FRAME,
+	MEDIAIP_ENC_PIC_TYPE_BI_FRAME
+};
+
+struct windsor_iface {
+	u32 exec_base_addr;
+	u32 exec_area_size;
+	struct vpu_rpc_buffer_desc cmd_buffer_desc;
+	struct vpu_rpc_buffer_desc msg_buffer_desc;
+	u32 cmd_int_enable[VID_API_NUM_STREAMS];
+	u32 fw_version;
+	u32 mvd_fw_offset;
+	u32 max_streams;
+	u32 ctrl_iface[VID_API_NUM_STREAMS];
+	struct vpu_rpc_system_config system_config;
+	u32 api_version;
+	struct vpu_rpc_buffer_desc log_buffer_desc;
+};
+
+struct windsor_ctrl_iface {
+	u32 enc_yuv_buffer_desc;
+	u32 enc_stream_buffer_desc;
+	u32 enc_expert_mode_param;
+	u32 enc_param;
+	u32 enc_mem_pool;
+	u32 enc_encoding_status;
+	u32 enc_dsa_status;
+};
+
+struct vpu_enc_yuv_desc {
+	u32 frame_id;
+	u32 luma_base;
+	u32 chroma_base;
+	u32 param_idx;
+	u32 key_frame;
+};
+
+struct vpu_enc_calib_params {
+	u32 use_ame;
+
+	u32 cme_mvx_max;
+	u32 cme_mvy_max;
+	u32 ame_prefresh_y0;
+	u32 ame_prefresh_y1;
+	u32 fme_min_sad;
+	u32 cme_min_sad;
+
+	u32 fme_pred_int_weight;
+	u32 fme_pred_hp_weight;
+	u32 fme_pred_qp_weight;
+	u32 fme_cost_weight;
+	u32 fme_act_thold;
+	u32 fme_sad_thold;
+	u32 fme_zero_sad_thold;
+
+	u32 fme_lrg_mvx_lmt;
+	u32 fme_lrg_mvy_lmt;
+	u32 fme_force_mode;
+	u32 fme_force4mvcost;
+	u32 fme_force2mvcost;
+
+	u32 h264_inter_thrd;
+
+	u32 i16x16_mode_cost;
+	u32 i4x4_mode_lambda;
+	u32 i8x8_mode_lambda;
+
+	u32 inter_mod_mult;
+	u32 inter_sel_mult;
+	u32 inter_bid_cost;
+	u32 inter_bwd_cost;
+	u32 inter_4mv_cost;
+	s32 one_mv_i16_cost;
+	s32 one_mv_i4x4_cost;
+	s32 one_mv_i8x8_cost;
+	s32 two_mv_i16_cost;
+	s32 two_mv_i4x4_cost;
+	s32 two_mv_i8x8_cost;
+	s32 four_mv_i16_cost;
+	s32 four_mv_i4x4_cost;
+	s32 four_mv_i8x8_cost;
+
+	u32 intra_pred_enab;
+	u32 intra_chr_pred;
+	u32 intra16_pred;
+	u32 intra4x4_pred;
+	u32 intra8x8_pred;
+
+	u32 cb_base;
+	u32 cb_size;
+	u32 cb_head_room;
+
+	u32 mem_page_width;
+	u32 mem_page_height;
+	u32 mem_total_size;
+	u32 mem_chunk_phys_addr;
+	u32 mem_chunk_virt_addr;
+	u32 mem_chunk_size;
+	u32 mem_y_stride;
+	u32 mem_uv_stride;
+
+	u32 split_wr_enab;
+	u32 split_wr_req_size;
+	u32 split_rd_enab;
+	u32 split_rd_req_size;
+};
+
+struct vpu_enc_config_params {
+	u32 param_change;
+	u32 start_frame;
+	u32 end_frame;
+	u32 userdata_enable;
+	u32 userdata_id[4];
+	u32 userdata_message[WINDSOR_USER_DATA_WORDS];
+	u32 userdata_length;
+	u32 h264_profile_idc;
+	u32 h264_level_idc;
+	u32 h264_au_delimiter;
+	u32 h264_seq_end_code;
+	u32 h264_recovery_points;
+	u32 h264_vui_parameters;
+	u32 h264_aspect_ratio_present;
+	u32 h264_aspect_ratio_sar_width;
+	u32 h264_aspect_ratio_sar_height;
+	u32 h264_overscan_present;
+	u32 h264_video_type_present;
+	u32 h264_video_format;
+	u32 h264_video_full_range;
+	u32 h264_video_colour_descriptor;
+	u32 h264_video_colour_primaries;
+	u32 h264_video_transfer_char;
+	u32 h264_video_matrix_coeff;
+	u32 h264_chroma_loc_info_present;
+	u32 h264_chroma_loc_type_top;
+	u32 h264_chroma_loc_type_bot;
+	u32 h264_timing_info_present;
+	u32 h264_buffering_period_present;
+	u32 h264_low_delay_hrd_flag;
+	u32 aspect_ratio;
+	u32 test_mode;                  // Automated firmware test mode
+	u32 dsa_test_mode;              // Automated test mode for the DSA.
+	u32 fme_test_mode;              // Automated test mode for the fme
+	u32 cbr_row_mode;               //0: FW mode; 1: HW mode
+	u32 windsor_mode;               //0: normal mode; 1: intra only mode; 2: intra+0MV mode
+	u32 encode_mode;                // H264, VC1, MPEG2, DIVX
+	u32 frame_width;                // display width
+	u32 frame_height;               // display height
+	u32 enc_frame_width;            // encoding width, should be 16-pix align
+	u32 enc_frame_height;           // encoding height, should be 16-pix aligned
+	u32 frame_rate_num;
+	u32 frame_rate_den;
+	u32 vi_field_source;
+	u32 vi_frame_width;
+	u32 vi_frame_height;
+	u32 crop_frame_width;
+	u32 crop_frame_height;
+	u32 crop_x_start_posn;
+	u32 crop_y_start_posn;
+	u32 mode422;
+	u32 mode_yuy2;
+	u32 dsa_luma_en;
+	u32 dsa_chroma_en;
+	u32 dsa_ext_hfilt_en;
+	u32 dsa_di_en;
+	u32 dsa_di_top_ref;
+	u32 dsa_vertf_disable;
+	u32 dsa_disable_pwb;
+	u32 dsa_hor_phase;
+	u32 dsa_ver_phase;
+	u32 dsa_iac_enable;
+	u32 iac_sc_threshold;
+	u32 iac_vm_threshold;
+	u32 iac_skip_mode;
+	u32 iac_grp_width;
+	u32 iac_grp_height;
+	u32 rate_control_mode;
+	u32 rate_control_resolution;
+	u32 buffer_size;
+	u32 buffer_level_init;
+	u32 buffer_I_bit_budget;
+	u32 top_field_first;
+	u32 intra_lum_qoffset;
+	u32 intra_chr_qoffset;
+	u32 inter_lum_qoffset;
+	u32 inter_chr_qoffset;
+	u32 use_def_scaling_mtx;
+	u32 inter_8x8_enab;
+	u32 inter_4x4_enab;
+	u32 fme_enable_qpel;
+	u32 fme_enable_hpel;
+	u32 fme_nozeromv;
+	u32 fme_predmv_en;
+	u32 fme_pred_2mv4mv;
+	u32 fme_smallsadthresh;
+	u32 ame_en_lmvc;
+	u32 ame_x_mult;
+	u32 cme_enable_4mv;
+	u32 cme_enable_1mv;
+	u32 hme_enable_16x8mv;
+	u32 hme_enable_8x16mv;
+	u32 cme_mv_weight;
+	u32 cme_mv_cost;
+	u32 ame_mult_mv;
+	u32 ame_shift_mv;
+	u32 hme_forceto1mv_en;
+	u32 hme_2mv_cost;
+	u32 hme_pred_mode;
+	u32 hme_sc_rnge;
+	u32 hme_sw_rnge;
+	u32 output_format;
+	u32 timestamp_enab;
+	u32 initial_pts_enab;
+	u32 initial_pts;
+};
+
+struct vpu_enc_static_params {
+	u32 param_change;
+	u32 gop_length;
+	u32 rate_control_bitrate;
+	u32 rate_control_bitrate_min;
+	u32 rate_control_bitrate_max;
+	u32 rate_control_content_models;
+	u32 rate_control_iframe_maxsize;
+	u32 rate_control_qp_init;
+	u32 rate_control_islice_qp;
+	u32 rate_control_pslice_qp;
+	u32 rate_control_bslice_qp;
+	u32 adaptive_quantization;
+	u32 aq_variance;
+	u32 cost_optimization;
+	u32 fdlp_mode;
+	u32 enable_isegbframes;
+	u32 enable_adaptive_keyratio;
+	u32 keyratio_imin;
+	u32 keyratio_imax;
+	u32 keyratio_pmin;
+	u32 keyratio_pmax;
+	u32 keyratio_bmin;
+	u32 keyratio_bmax;
+	s32 keyratio_istep;
+	s32 keyratio_pstep;
+	s32 keyratio_bstep;
+	u32 enable_paff;
+	u32 enable_b_frame_ref;
+	u32 enable_adaptive_gop;
+	u32 enable_closed_gop;
+	u32 open_gop_refresh_freq;
+	u32 enable_adaptive_sc;
+	u32 enable_fade_detection;
+	s32 fade_detection_threshold;
+	u32 enable_repeat_b;
+	u32 enable_low_delay_b;
+};
+
+struct vpu_enc_dynamic_params {
+	u32 param_change;
+	u32 rows_per_slice;
+	u32 mbaff_enable;
+	u32 dbf_enable;
+	u32 field_source;
+	u32 gop_b_length;
+	u32 mb_group_size;
+	u32 cbr_rows_per_group;
+	u32 skip_enable;
+	u32 pts_bits_0_to_31;
+	u32 pts_bit_32;
+	u32 rm_expsv_cff;
+	u32 const_ipred;
+	s32 chr_qp_offset;
+	u32 intra_mb_qp_offset;
+	u32 h264_cabac_init_method;
+	u32 h264_cabac_init_idc;
+	u32 h264_cabac_enable;
+	s32 alpha_c0_offset_div2;
+	s32 beta_offset_div2;
+	u32 intra_prefresh_y0;
+	u32 intra_prefresh_y1;
+	u32 dbg_dump_rec_src;
+};
+
+struct vpu_enc_expert_mode_param {
+	struct vpu_enc_calib_params calib_param;
+	struct vpu_enc_config_params config_param;
+	struct vpu_enc_static_params static_param;
+	struct vpu_enc_dynamic_params dynamic_param;
+};
+
+enum MEDIAIP_ENC_FMT {
+	MEDIAIP_ENC_FMT_H264 = 0,
+	MEDIAIP_ENC_FMT_VC1,
+	MEDIAIP_ENC_FMT_MPEG2,
+	MEDIAIP_ENC_FMT_MPEG4SP,
+	MEDIAIP_ENC_FMT_H263,
+	MEDIAIP_ENC_FMT_MPEG1,
+	MEDIAIP_ENC_FMT_SHORT_HEADER,
+	MEDIAIP_ENC_FMT_NULL
+};
+
+enum MEDIAIP_ENC_PROFILE {
+	MEDIAIP_ENC_PROF_MPEG2_SP = 0,
+	MEDIAIP_ENC_PROF_MPEG2_MP,
+	MEDIAIP_ENC_PROF_MPEG2_HP,
+	MEDIAIP_ENC_PROF_H264_BP,
+	MEDIAIP_ENC_PROF_H264_MP,
+	MEDIAIP_ENC_PROF_H264_HP,
+	MEDIAIP_ENC_PROF_MPEG4_SP,
+	MEDIAIP_ENC_PROF_MPEG4_ASP,
+	MEDIAIP_ENC_PROF_VC1_SP,
+	MEDIAIP_ENC_PROF_VC1_MP,
+	MEDIAIP_ENC_PROF_VC1_AP
+};
+
+enum MEDIAIP_ENC_BITRATE_MODE {
+	MEDIAIP_ENC_BITRATE_MODE_VBR          = 0x00000001,
+	MEDIAIP_ENC_BITRATE_MODE_CBR          = 0x00000002,
+	MEDIAIP_ENC_BITRATE_MODE_CONSTANT_QP  = 0x00000004
+};
+
+struct vpu_enc_memory_resource {
+	u32 phys;
+	u32 virt;
+	u32 size;
+};
+
+struct vpu_enc_param {
+	enum MEDIAIP_ENC_FMT codec_mode;
+	enum MEDIAIP_ENC_PROFILE profile;
+	u32 level;
+
+	struct vpu_enc_memory_resource enc_mem_desc;
+
+	u32 frame_rate;
+	u32 src_stride;
+	u32 src_width;
+	u32 src_height;
+	u32 src_offset_x;
+	u32 src_offset_y;
+	u32 src_crop_width;
+	u32 src_crop_height;
+	u32 out_width;
+	u32 out_height;
+	u32 iframe_interval;
+	u32 bframes;
+	u32 low_latency_mode;
+
+	enum MEDIAIP_ENC_BITRATE_MODE  bitrate_mode;
+	u32 target_bitrate;
+	u32 max_bitrate;
+	u32 min_bitrate;
+	u32 init_slice_qp;
+};
+
+struct vpu_enc_mem_pool {
+	struct vpu_enc_memory_resource enc_frames[WINDSOR_MAX_SRC_FRAMES];
+	struct vpu_enc_memory_resource ref_frames[WINDSOR_MAX_REF_FRAMES];
+	struct vpu_enc_memory_resource act_frame;
+};
+
+struct vpu_enc_encoding_status {
+	u32   frame_id;
+	u32   error_flag;   //Error type
+	u32   mb_y;
+	u32   mb_x;
+	u32   reserved[12];
+
+};
+
+struct vpu_enc_dsa_status {
+	u32   frame_id;
+	u32   dsa_cyle;
+	u32   mb_y;
+	u32   mb_x;
+	u32   reserved[4];
+};
+
+struct vpu_enc_ctrl {
+	struct vpu_enc_yuv_desc *yuv_desc;
+	struct vpu_rpc_buffer_desc *stream_desc;
+	struct vpu_enc_expert_mode_param *expert;
+	struct vpu_enc_param *param;
+	struct vpu_enc_mem_pool *pool;
+	struct vpu_enc_encoding_status *status;
+	struct vpu_enc_dsa_status *dsa;
+};
+
+struct vpu_enc_host_ctrls {
+	struct vpu_enc_ctrl ctrls[VID_API_NUM_STREAMS];
+};
+
+struct windsor_pic_info {
+	u32 frame_id;
+	u32 pic_encod_done;
+	u32 pic_type;
+	u32 skipped_frame;
+	u32 error_flag;
+	u32 psnr;
+	u32 flush_done;
+	u32 mb_y;
+	u32 mb_x;
+	u32 frame_size;
+	u32 frame_enc_ttl_cycles;
+	u32 frame_enc_ttl_frm_cycles;
+	u32 frame_enc_ttl_slc_cycles;
+	u32 frame_enc_ttl_enc_cycles;
+	u32 frame_enc_ttl_hme_cycles;
+	u32 frame_enc_ttl_dsa_cycles;
+	u32 frame_enc_fw_cycles;
+	u32 frame_crc;
+	u32 num_interrupts_1;
+	u32 num_interrupts_2;
+	u32 poc;
+	u32 ref_info;
+	u32 pic_num;
+	u32 pic_activity;
+	u32 scene_change;
+	u32 mb_stats;
+	u32 enc_cache_count0;
+	u32 enc_cache_count1;
+	u32 mtl_wr_strb_cnt;
+	u32 mtl_rd_strb_cnt;
+	u32 str_buff_wptr;
+	u32 diagnosticEvents;
+	u32 proc_iacc_tot_rd_cnt;
+	u32 proc_dacc_tot_rd_cnt;
+	u32 proc_dacc_tot_wr_cnt;
+	u32 proc_dacc_reg_rd_cnt;
+	u32 proc_dacc_reg_wr_cnt;
+	u32 proc_dacc_rng_rd_cnt;
+	u32 proc_dacc_rng_wr_cnt;
+	s32 tv_s;
+	u32 tv_ns;
+};
+
+u32 vpu_windsor_get_data_size(void)
+{
+	return sizeof(struct vpu_enc_host_ctrls);
+}
+
+static struct vpu_enc_yuv_desc *get_yuv_desc(struct vpu_shared_addr *shared,
+						u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].yuv_desc;
+}
+
+static struct vpu_enc_mem_pool *get_mem_pool(struct vpu_shared_addr *shared,
+						u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].pool;
+}
+
+static struct vpu_rpc_buffer_desc *get_stream_buf_desc(struct vpu_shared_addr *shared,
+							u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].stream_desc;
+}
+
+static struct vpu_enc_expert_mode_param *get_expert_param(struct vpu_shared_addr *shared,
+							u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].expert;
+}
+
+static struct vpu_enc_param *get_enc_param(struct vpu_shared_addr *shared,
+						u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].param;
+}
+
+static u32 get_ptr(u32 ptr)
+{
+	return (ptr | 0x80000000);
+}
+
+void vpu_windsor_init_rpc(struct vpu_shared_addr *shared,
+			struct vpu_buffer *rpc, dma_addr_t boot_addr)
+{
+	unsigned long base_phy_addr;
+	unsigned long phy_addr;
+	unsigned long offset;
+	struct windsor_iface *iface;
+	struct windsor_ctrl_iface *ctrl;
+	struct vpu_enc_host_ctrls *hcs;
+	unsigned int i;
+
+	WARN_ON(!shared || !shared->priv);
+	WARN_ON(!rpc || !rpc->phys || !rpc->length || rpc->phys < boot_addr);
+
+	base_phy_addr = rpc->phys - boot_addr;
+	iface = rpc->virt;
+	shared->iface = iface;
+	shared->boot_addr = boot_addr;
+	hcs = shared->priv;
+
+	iface->exec_base_addr = base_phy_addr;
+	iface->exec_area_size = rpc->length;
+
+	offset = sizeof(struct windsor_iface);
+	phy_addr = base_phy_addr + offset;
+	shared->cmd_desc = &iface->cmd_buffer_desc;
+	shared->cmd_mem_vir = rpc->virt + offset;
+	iface->cmd_buffer_desc.start =
+	iface->cmd_buffer_desc.rptr =
+	iface->cmd_buffer_desc.wptr = phy_addr;
+	iface->cmd_buffer_desc.end = iface->cmd_buffer_desc.start + CMD_SIZE;
+
+	offset += CMD_SIZE;
+	phy_addr = base_phy_addr + offset;
+	shared->msg_desc = &iface->msg_buffer_desc;
+	shared->msg_mem_vir = rpc->virt + offset;
+	iface->msg_buffer_desc.start =
+	iface->msg_buffer_desc.wptr =
+	iface->msg_buffer_desc.rptr = phy_addr;
+	iface->msg_buffer_desc.end = iface->msg_buffer_desc.start + MSG_SIZE;
+
+	offset += MSG_SIZE;
+	for (i = 0; i < ARRAY_SIZE(iface->ctrl_iface); i++) {
+		iface->ctrl_iface[i] = base_phy_addr + offset;
+		offset += sizeof(struct windsor_ctrl_iface);
+	}
+	for (i = 0; i < ARRAY_SIZE(iface->ctrl_iface); i++) {
+		ctrl = rpc->virt + (iface->ctrl_iface[i] - base_phy_addr);
+
+		ctrl->enc_yuv_buffer_desc = base_phy_addr + offset;
+		hcs->ctrls[i].yuv_desc = rpc->virt + offset;
+		offset += sizeof(struct vpu_enc_yuv_desc);
+
+		ctrl->enc_stream_buffer_desc = base_phy_addr + offset;
+		hcs->ctrls[i].stream_desc = rpc->virt + offset;
+		offset += sizeof(struct vpu_rpc_buffer_desc);
+
+		ctrl->enc_expert_mode_param = base_phy_addr + offset;
+		hcs->ctrls[i].expert = rpc->virt + offset;
+		offset += sizeof(struct vpu_enc_expert_mode_param);
+
+		ctrl->enc_param = base_phy_addr + offset;
+		hcs->ctrls[i].param = rpc->virt + offset;
+		offset += sizeof(struct vpu_enc_param);
+
+		ctrl->enc_mem_pool = base_phy_addr + offset;
+		hcs->ctrls[i].pool = rpc->virt + offset;
+		offset += sizeof(struct vpu_enc_mem_pool);
+
+		ctrl->enc_encoding_status = base_phy_addr + offset;
+		hcs->ctrls[i].status = rpc->virt + offset;
+		offset += sizeof(struct vpu_enc_encoding_status);
+
+		ctrl->enc_dsa_status = base_phy_addr + offset;
+		hcs->ctrls[i].dsa = rpc->virt + offset;
+		offset += sizeof(struct vpu_enc_dsa_status);
+	}
+
+	rpc->bytesused = offset;
+}
+
+void vpu_windsor_set_log_buf(struct vpu_shared_addr *shared,
+			struct vpu_buffer *log)
+{
+	struct windsor_iface *iface;
+
+	WARN_ON(!shared || !log || !log->phys);
+
+	vpu_dbg(LVL_DEBUG, "set log area <0x%llx, 0x%x> (0x%lx)\n",
+			log->phys, log->length, shared->boot_addr);
+	iface = shared->iface;
+	iface->log_buffer_desc.start =
+	iface->log_buffer_desc.wptr =
+	iface->log_buffer_desc.rptr = log->phys - shared->boot_addr;
+	iface->log_buffer_desc.end = iface->log_buffer_desc.start + log->length;
+}
+
+void vpu_windsor_set_system_cfg(struct vpu_shared_addr *shared,
+				u32 regs_base, void __iomem *regs, u32 core_id)
+{
+	struct windsor_iface *iface;
+	struct vpu_rpc_system_config *config;
+
+	WARN_ON(!shared || !shared->iface);
+
+	iface = shared->iface;
+	config = &iface->system_config;
+
+	vpu_imx8q_set_system_cfg_common(config, regs_base, core_id);
+}
+
+int vpu_windsor_get_stream_buffer_size(struct vpu_shared_addr *shared)
+{
+	return 0x300000;
+}
+
+static struct vpu_pair windsor_cmds[] = {
+	{VPU_CMD_ID_CONFIGURE_CODEC, GTB_ENC_CMD_CONFIGURE_CODEC},
+	{VPU_CMD_ID_START, GTB_ENC_CMD_STREAM_START},
+	{VPU_CMD_ID_STOP, GTB_ENC_CMD_STREAM_STOP},
+	{VPU_CMD_ID_FRAME_ENCODE, GTB_ENC_CMD_FRAME_ENCODE},
+	{VPU_CMD_ID_SNAPSHOT, GTB_ENC_CMD_SNAPSHOT},
+	{VPU_CMD_ID_FIRM_RESET, GTB_ENC_CMD_FIRM_RESET},
+	{VPU_CMD_ID_UPDATE_PARAMETER, GTB_ENC_CMD_PARAMETER_UPD},
+	{VPU_CMD_ID_DEBUG, GTB_ENC_CMD_FW_STATUS}
+};
+
+static struct vpu_pair windsor_msgs[] = {
+	{VPU_MSG_ID_RESET_DONE, VID_API_ENC_EVENT_RESET_DONE},
+	{VPU_MSG_ID_START_DONE, VID_API_ENC_EVENT_START_DONE},
+	{VPU_MSG_ID_STOP_DONE, VID_API_ENC_EVENT_STOP_DONE},
+	{VPU_MSG_ID_FRAME_INPUT_DONE, VID_API_ENC_EVENT_FRAME_INPUT_DONE},
+	{VPU_MSG_ID_ENC_DONE, VID_API_ENC_EVENT_FRAME_DONE},
+	{VPU_MSG_ID_FRAME_RELEASE, VID_API_ENC_EVENT_FRAME_RELEASE},
+	{VPU_MSG_ID_MEM_REQUEST, VID_API_ENC_EVENT_MEM_REQUEST},
+	{VPU_MSG_ID_PARAM_UPD_DONE, VID_API_ENC_EVENT_PARA_UPD_DONE},
+	{VPU_MSG_ID_FIRMWARE_XCPT, VID_API_ENC_EVENT_FIRMWARE_XCPT},
+};
+
+int vpu_windsor_pack_cmd(struct vpu_rpc_event *pkt, u32 index, u32 id, void *data)
+{
+	int ret;
+	s64 timestamp;
+
+	WARN_ON(!pkt);
+
+	ret = vpu_find_dst_by_src(windsor_cmds, ARRAY_SIZE(windsor_cmds), id);
+	if (ret < 0)
+		return ret;
+	pkt->hdr.id = ret;
+	pkt->hdr.num = 0;
+	pkt->hdr.index = index;
+	if (id == VPU_CMD_ID_FRAME_ENCODE) {
+		pkt->hdr.num = 2;
+		timestamp = *(s64 *)data;
+		if (timestamp < 0) {
+			pkt->data[0] = (u32)-1;
+			pkt->data[1] = 0;
+		} else {
+			pkt->data[0] = timestamp / NSEC_PER_SEC;
+			pkt->data[1] = timestamp % NSEC_PER_SEC;
+		}
+	}
+
+	return 0;
+}
+
+int vpu_windsor_convert_msg_id(u32 id)
+{
+	return vpu_find_src_by_dst(windsor_msgs, ARRAY_SIZE(windsor_msgs), id);
+}
+
+static void vpu_windsor_unpack_pic_info(struct vpu_rpc_event *pkt, void *data)
+{
+	struct vpu_enc_pic_info *info = data;
+	struct windsor_pic_info *windsor = (struct windsor_pic_info *)pkt->data;
+
+	info->frame_id = windsor->frame_id;
+	switch (windsor->pic_type) {
+	case MEDIAIP_ENC_PIC_TYPE_I_FRAME:
+	case MEDIAIP_ENC_PIC_TYPE_IDR_FRAME:
+		info->pic_type = V4L2_BUF_FLAG_KEYFRAME;
+		break;
+	case MEDIAIP_ENC_PIC_TYPE_P_FRAME:
+		info->pic_type = V4L2_BUF_FLAG_PFRAME;
+		break;
+	case MEDIAIP_ENC_PIC_TYPE_B_FRAME:
+		info->pic_type = V4L2_BUF_FLAG_BFRAME;
+		break;
+	default:
+		break;
+	}
+	info->skipped_frame = windsor->skipped_frame;
+	info->error_flag = windsor->error_flag;
+	info->psnr = windsor->psnr;
+	info->frame_size = windsor->frame_size;
+	info->wptr = get_ptr(windsor->str_buff_wptr);
+	info->crc = windsor->frame_crc;
+	info->timestamp = MAKE_TIMESTAMP(windsor->tv_s, windsor->tv_ns);
+}
+
+static void vpu_windsor_unpack_mem_req(struct vpu_rpc_event *pkt, void *data)
+{
+	struct vpu_pkt_mem_req_data *req_data = data;
+
+	req_data->enc_frame_size = pkt->data[0];
+	req_data->enc_frame_num = pkt->data[1];
+	req_data->ref_frame_size = pkt->data[2];
+	req_data->ref_frame_num = pkt->data[3];
+	req_data->act_buf_size = pkt->data[4];
+	req_data->act_buf_num = 1;
+}
+
+int vpu_windsor_unpack_msg_data(struct vpu_rpc_event *pkt, void *data)
+{
+	if (!pkt || !data)
+		return -EINVAL;
+
+	switch (pkt->hdr.id) {
+	case VID_API_ENC_EVENT_FRAME_DONE:
+		vpu_windsor_unpack_pic_info(pkt, data);
+		break;
+	case VID_API_ENC_EVENT_MEM_REQUEST:
+		vpu_windsor_unpack_mem_req(pkt, data);
+		break;
+	case VID_API_ENC_EVENT_FRAME_RELEASE:
+		*(u32 *)data = pkt->data[0];
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int vpu_windsor_fill_yuv_frame(struct vpu_shared_addr *shared,
+				u32 instance,
+				struct vb2_buffer *vb)
+{
+	struct vpu_enc_yuv_desc *desc;
+	struct vb2_v4l2_buffer *vbuf;
+
+	WARN_ON(!shared || !vb || instance >= VID_API_NUM_STREAMS);
+
+	desc = get_yuv_desc(shared, instance);
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vpu_dbg(LVL_DEBUG, "fill yuv with id : %d\n", vbuf->sequence);
+	desc->frame_id = vbuf->sequence;
+	if (vbuf->flags & V4L2_BUF_FLAG_KEYFRAME)
+		desc->key_frame = 1;
+	else
+		desc->key_frame = 0;
+	desc->luma_base = vpu_get_vb_phy_addr(vb, 0);
+	desc->chroma_base = vpu_get_vb_phy_addr(vb, 1);
+
+	return 0;
+}
+
+int vpu_windsor_input_frame(struct vpu_shared_addr *shared,
+			struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	vpu_windsor_fill_yuv_frame(shared, inst->id, vb);
+	return vpu_session_encode_frame(inst, vb->timestamp);
+}
+
+int vpu_windsor_config_memory_resource(struct vpu_shared_addr *shared,
+					u32 instance,
+					u32 type,
+					u32 index,
+					struct vpu_buffer *buf)
+{
+	struct vpu_enc_mem_pool *pool;
+	struct vpu_enc_memory_resource *res;
+
+	WARN_ON(!shared || !buf || instance >= VID_API_NUM_STREAMS);
+
+	pool = get_mem_pool(shared, instance);
+
+	switch (type) {
+	case MEM_RES_ENC:
+		res = &pool->enc_frames[index];
+		break;
+	case MEM_RES_REF:
+		res = &pool->ref_frames[index];
+		break;
+	case MEM_RES_ACT:
+		res = &pool->act_frame;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	res->phys = buf->phys;
+	res->virt = buf->phys - shared->boot_addr;
+	res->size = buf->length;
+
+	vpu_dbg(LVL_DEBUG, "[%d] type = %d, phys = 0x%x, size = 0x%x\n",
+			instance, type, res->phys, res->size);
+
+	return 0;
+}
+
+int vpu_windsor_config_stream_buffer(struct vpu_shared_addr *shared,
+					u32 instance,
+					struct vpu_buffer *buf)
+{
+	struct vpu_rpc_buffer_desc *desc;
+	struct vpu_enc_expert_mode_param *expert;
+
+	desc = get_stream_buf_desc(shared, instance);
+	expert = get_expert_param(shared, instance);
+
+	desc->start = desc->wptr = desc->rptr = buf->phys;
+	desc->end = buf->phys + buf->length;
+
+	vpu_dbg(LVL_DEBUG, "stream_buf:[0x%x, 0x%x]\n", desc->start, desc->end);
+
+	expert->calib_param.mem_chunk_phys_addr = 0;
+	expert->calib_param.mem_chunk_virt_addr = 0;
+	expert->calib_param.mem_chunk_size = 0;
+	expert->calib_param.cb_base = buf->phys;
+	expert->calib_param.cb_size = buf->length;
+
+	return 0;
+}
+
+static void vpu_windsor_update_wptr(struct vpu_rpc_buffer_desc *desc, u32 wptr)
+{
+	u32 pre_wptr = get_ptr(desc->wptr);
+	u32 new_wptr = get_ptr(wptr);
+	u32 rptr = get_ptr(desc->rptr);
+	u32 size = get_ptr(desc->end) - get_ptr(desc->start);
+	u32 space = (rptr + size - pre_wptr) % size;
+	u32 step = (new_wptr + size - pre_wptr) % size;
+
+	if (space && step > space)
+		vpu_err("update wptr from 0x%x to 0x%x, cross over rptr 0x%x\n",
+				pre_wptr, new_wptr, rptr);
+
+	desc->wptr = wptr;
+}
+
+static void vpu_windsor_update_rptr(struct vpu_rpc_buffer_desc *desc, u32 rptr)
+{
+	u32 pre_rptr = get_ptr(desc->rptr);
+	u32 new_rptr = get_ptr(rptr);
+	u32 wptr = get_ptr(desc->wptr);
+	u32 size = get_ptr(desc->end) - get_ptr(desc->start);
+	u32 space = (wptr + size - pre_rptr) % size;
+	u32 step = (new_rptr + size - pre_rptr) % size;
+
+	if (step > space)
+		vpu_err("update rptr from 0x%x to 0x%x, cross over wptr 0x%x\n",
+				pre_rptr, new_rptr, wptr);
+
+	desc->rptr = rptr;
+}
+
+int vpu_windsor_update_stream_buffer(struct vpu_shared_addr *shared,
+					u32 instance, u32 ptr, bool write)
+{
+	struct vpu_rpc_buffer_desc *desc;
+
+	desc = get_stream_buf_desc(shared, instance);
+
+	/*update wptr/rptr after data is written or read*/
+	mb();
+	if (write)
+		vpu_windsor_update_wptr(desc, ptr);
+	else
+		vpu_windsor_update_rptr(desc, ptr);
+
+	return 0;
+}
+
+int vpu_windsor_get_stream_buffer_desc(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_rpc_buffer_desc *desc)
+{
+	struct vpu_rpc_buffer_desc *rpc_desc;
+
+	rpc_desc = get_stream_buf_desc(shared, instance);
+	if (desc) {
+		desc->wptr = get_ptr(rpc_desc->wptr);
+		desc->rptr = get_ptr(rpc_desc->rptr);
+		desc->start = get_ptr(rpc_desc->start);
+		desc->end = get_ptr(rpc_desc->end);
+	}
+
+	return 0;
+}
+
+u32 vpu_windsor_get_version(struct vpu_shared_addr *shared)
+{
+	struct windsor_iface *iface;
+
+	WARN_ON(!shared || !shared->iface);
+
+	iface = shared->iface;
+	return iface->fw_version;
+}
+
+static int vpu_windsor_set_frame_rate(struct vpu_enc_expert_mode_param *expert,
+				struct vpu_encode_params *params)
+{
+	expert->config_param.frame_rate_num = params->frame_rate_num;
+	expert->config_param.frame_rate_den = params->frame_rate_den;
+
+	return 0;
+}
+
+static int vpu_windsor_set_format(struct vpu_enc_param *param, u32 pixelformat)
+{
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_H264:
+		param->codec_mode = MEDIAIP_ENC_FMT_H264;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vpu_windsor_set_profile(struct vpu_enc_param *param, u32 profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		param->profile = MEDIAIP_ENC_PROF_H264_BP;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		param->profile = MEDIAIP_ENC_PROF_H264_MP;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		param->profile = MEDIAIP_ENC_PROF_H264_HP;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const u32 h264_level[] = {
+	[V4L2_MPEG_VIDEO_H264_LEVEL_1_0] = 10,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_1B]  = 14,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_1_1] = 11,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_1_2] = 12,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_1_3] = 13,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_2_0] = 20,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_2_1] = 21,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_2_2] = 22,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_3_0] = 30,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_3_1] = 31,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_3_2] = 32,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_4_0] = 40,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_4_1] = 41,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_4_2] = 42,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_5_0] = 50,
+	[V4L2_MPEG_VIDEO_H264_LEVEL_5_1] = 51
+};
+
+static int vpu_windsor_set_level(struct vpu_enc_param *param, u32 level)
+{
+
+	if (level >= ARRAY_SIZE(h264_level))
+		return -EINVAL;
+
+	param->level = h264_level[level];
+
+	return 0;
+}
+
+static int vpu_windsor_set_size(struct vpu_enc_param *windsor,
+				struct vpu_encode_params *params)
+{
+	windsor->src_stride = params->src_stride;
+	windsor->src_width = params->src_width;
+	windsor->src_height = params->src_height;
+	windsor->src_offset_x = params->crop.left;
+	windsor->src_offset_y = params->crop.top;
+	windsor->src_crop_width = params->crop.width;
+	windsor->src_crop_height = params->crop.height;
+	windsor->out_width = params->out_width;
+	windsor->out_height = params->out_height;
+
+	vpu_dbg(LVL_DEBUG, "%d %dx%d (%d,%d) %dx%d, %dx%d\n",
+			windsor->src_stride,
+			windsor->src_width,
+			windsor->src_height,
+			windsor->src_offset_x,
+			windsor->src_offset_y,
+			windsor->src_crop_width,
+			windsor->src_crop_height,
+			windsor->out_width,
+			windsor->out_height);
+	return 0;
+}
+
+static int vpu_windsor_set_gop(struct vpu_enc_param *param, u32 gop)
+{
+	param->iframe_interval = gop;
+
+	return 0;
+}
+
+static int vpu_windsor_set_bframes(struct vpu_enc_param *param, u32 bframes)
+{
+	if (bframes) {
+		param->low_latency_mode = 0;
+		param->bframes = bframes;
+	} else {
+		param->low_latency_mode = 1;
+		param->bframes = 0;
+	}
+
+	if (param->low_latency_mode)
+		vpu_dbg(LVL_DEBUG, "low latency mode\n");
+
+	return 0;
+}
+
+static int vpu_windsor_set_bitrate_mode(struct vpu_enc_param *param, u32 mode)
+{
+	switch (mode) {
+	case V4L2_MPEG_VIDEO_BITRATE_MODE_VBR:
+		param->bitrate_mode = MEDIAIP_ENC_BITRATE_MODE_CONSTANT_QP;
+		break;
+	case V4L2_MPEG_VIDEO_BITRATE_MODE_CBR:
+		param->bitrate_mode = MEDIAIP_ENC_BITRATE_MODE_CBR;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static u32 vpu_windsor_bitrate(u32 bitrate)
+{
+	return DIV_ROUND_CLOSEST(bitrate, WINDSOR_BITRATE_UNIT);
+}
+
+static int vpu_windsor_set_bitrate(struct vpu_enc_param *windsor,
+				struct vpu_encode_params *params)
+{
+	windsor->target_bitrate = vpu_windsor_bitrate(params->bitrate);
+	windsor->min_bitrate = vpu_windsor_bitrate(params->bitrate_min);
+	windsor->max_bitrate = vpu_windsor_bitrate(params->bitrate_max);
+
+	return 0;
+}
+
+static int vpu_windsor_set_qp(struct vpu_enc_expert_mode_param *expert,
+			struct vpu_encode_params *params)
+{
+	expert->static_param.rate_control_islice_qp = params->i_frame_qp;
+	expert->static_param.rate_control_pslice_qp = params->p_frame_qp;
+	expert->static_param.rate_control_bslice_qp = params->b_frame_qp;
+
+	return 0;
+}
+
+static int vpu_windsor_set_sar(struct vpu_enc_expert_mode_param *expert,
+			struct vpu_encode_params *params)
+{
+	expert->config_param.h264_aspect_ratio_present = params->sar.enable;
+	if (params->sar.idc == V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED)
+		expert->config_param.aspect_ratio = WINDSOR_H264_EXTENDED_SAR;
+	else
+		expert->config_param.aspect_ratio = params->sar.idc;
+	expert->config_param.h264_aspect_ratio_sar_width = params->sar.width;
+	expert->config_param.h264_aspect_ratio_sar_height = params->sar.height;
+
+
+	return 0;
+}
+
+static int vpu_windsor_set_color(struct vpu_enc_expert_mode_param *expert,
+			struct vpu_encode_params *params)
+{
+	expert->config_param.h264_video_type_present = 1;
+	expert->config_param.h264_video_format = 5;
+	expert->config_param.h264_video_colour_descriptor = 1;
+	expert->config_param.h264_video_colour_primaries =
+		vpu_color_cvrt_primaries_v2i(params->color.primaries);
+	expert->config_param.h264_video_transfer_char =
+		vpu_color_cvrt_transfers_v2i(params->color.transfer);
+	expert->config_param.h264_video_matrix_coeff =
+		vpu_color_cvrt_matrix_v2i(params->color.matrix);
+	expert->config_param.h264_video_full_range =
+		vpu_color_cvrt_full_range_v2i(params->color.full_range);
+	return 0;
+}
+
+static int vpu_windsor_update_bitrate(struct vpu_shared_addr *shared,
+				u32 instance, struct vpu_encode_params *params)
+{
+	struct vpu_enc_param *windsor;
+	struct vpu_enc_expert_mode_param *expert;
+
+	windsor = get_enc_param(shared, instance);
+	expert = get_expert_param(shared, instance);
+
+	if (windsor->bitrate_mode != MEDIAIP_ENC_BITRATE_MODE_CBR)
+		return 0;
+	if (params->rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		return 0;
+	if (vpu_windsor_bitrate(params->bitrate) == windsor->target_bitrate)
+		return 0;
+
+	vpu_windsor_set_bitrate(windsor, params);
+	expert->static_param.rate_control_bitrate = windsor->target_bitrate;
+	expert->static_param.rate_control_bitrate_min = windsor->min_bitrate;
+	expert->static_param.rate_control_bitrate_max = windsor->max_bitrate;
+
+	return 0;
+}
+
+static int vpu_windsor_set_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_encode_params *params)
+{
+	struct vpu_enc_param *windsor;
+	int ret;
+
+	windsor = get_enc_param(shared, instance);
+
+	if (params->input_format != V4L2_PIX_FMT_NV12)
+		return -EINVAL;
+
+	ret = vpu_windsor_set_format(windsor, params->codec_format);
+	if (ret)
+		return ret;
+	vpu_windsor_set_profile(windsor, params->profile);
+	vpu_windsor_set_level(windsor, params->level);
+	vpu_windsor_set_size(windsor, params);
+	vpu_windsor_set_gop(windsor, params->gop_length);
+	vpu_windsor_set_bframes(windsor, params->bframes);
+	vpu_windsor_set_bitrate_mode(windsor, params->rc_mode);
+	vpu_windsor_set_bitrate(windsor, params);
+	windsor->init_slice_qp = params->i_frame_qp;
+
+	if (!params->frame_rate_num)
+		return -EINVAL;
+	windsor->frame_rate = params->frame_rate_den / params->frame_rate_num;
+
+	return 0;
+}
+
+static int vpu_windsor_update_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_encode_params *params)
+{
+	struct vpu_enc_expert_mode_param *expert;
+
+	expert = get_expert_param(shared, instance);
+
+	vpu_windsor_set_frame_rate(expert, params);
+	vpu_windsor_set_qp(expert, params);
+	vpu_windsor_set_sar(expert, params);
+	vpu_windsor_set_color(expert, params);
+	vpu_windsor_update_bitrate(shared, instance, params);
+	/*expert->config_param.iac_sc_threshold = 0;*/
+
+	return 0;
+}
+
+int vpu_windsor_set_encode_params(struct vpu_shared_addr *shared,
+		u32 instance, struct vpu_encode_params *params, u32 update)
+{
+	if (!params)
+		return -EINVAL;
+
+	if (!update)
+		return vpu_windsor_set_params(shared, instance, params);
+	else
+		return vpu_windsor_update_params(shared, instance, params);
+}
+
+u32 vpu_windsor_get_max_instance_count(struct vpu_shared_addr *shared)
+{
+	struct windsor_iface *iface;
+
+	WARN_ON(!shared || !shared->iface);
+
+	iface = shared->iface;
+
+	return iface->max_streams;
+}
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_windsor.h b/drivers/media/platform/imx/vpu-8q/vpu_windsor.h
new file mode 100644
index 000000000000..42545cd2b882
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_windsor.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _IMX_VPU_WINDSOR_H
+#define _IMX_VPU_WINDSOR_H
+
+u32 vpu_windsor_get_data_size(void);
+void vpu_windsor_init_rpc(struct vpu_shared_addr *shared,
+			struct vpu_buffer *rpc, dma_addr_t boot_addr);
+void vpu_windsor_set_log_buf(struct vpu_shared_addr *shared,
+			struct vpu_buffer *log);
+void vpu_windsor_set_system_cfg(struct vpu_shared_addr *shared,
+				u32 regs_base, void __iomem *regs, u32 core_id);
+int vpu_windsor_get_stream_buffer_size(struct vpu_shared_addr *shared);
+int vpu_windsor_pack_cmd(struct vpu_rpc_event *pkt,
+			u32 index, u32 id, void *data);
+int vpu_windsor_convert_msg_id(u32 msg_id);
+int vpu_windsor_unpack_msg_data(struct vpu_rpc_event *pkt, void *data);
+int vpu_windsor_config_memory_resource(struct vpu_shared_addr *shared,
+			u32 instance, u32 type, u32 index,
+			struct vpu_buffer *buf);
+int vpu_windsor_config_stream_buffer(struct vpu_shared_addr *shared,
+			u32 instance, struct vpu_buffer *buf);
+int vpu_windsor_update_stream_buffer(struct vpu_shared_addr *shared,
+			u32 instance, u32 ptr, bool write);
+int vpu_windsor_get_stream_buffer_desc(struct vpu_shared_addr *shared,
+			u32 instance, struct vpu_rpc_buffer_desc *desc);
+u32 vpu_windsor_get_version(struct vpu_shared_addr *shared);
+int vpu_windsor_set_encode_params(struct vpu_shared_addr *shared,
+			u32 instance,
+			struct vpu_encode_params *params,
+			u32 update);
+int vpu_windsor_input_frame(struct vpu_shared_addr *shared,
+			struct vpu_inst *inst, struct vb2_buffer *vb);
+u32 vpu_windsor_get_max_instance_count(struct vpu_shared_addr *shared);
+
+#endif
-- 
2.32.0

