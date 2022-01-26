Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B3C49C1D1
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 04:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbiAZDKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 22:10:36 -0500
Received: from mail-eopbgr00041.outbound.protection.outlook.com ([40.107.0.41]:62220
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236899AbiAZDKa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 22:10:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJxmwBIiS9WqBruA0Q7tFe3RtbjxrIVD1MKaROPytbfIXzN1hBlrdHV/nqHP5n4DhIR30QlC9Otd/PozQCQYgtN1FjLIDSbzrIZy3Q+XkB7wJ0xS0dgKNmxa29bd1xyd/ZmfoLx02gosM6lpUoZAm3HY6on8HmKfNdYV72g/YrMzvAimvhpxX5uxreYd4BOxrT3SBIDL7Ohv4iNR/diX1kQZiiGxxxuHLfgADNC6k6s/dph7Zn0C2EpooyYf1P61DRUWhtJHs8dLSeVgJLGpDUZz2w8A1VACQSzu74CboWvcouYHqgxZVm4eTIZGIwPFTgeXbMi2C91z2X8J8AYBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRV9tMwehGJVCW67qx0ZfAWhhRjKJDNVVFAFsPpBZsU=;
 b=oMoE/7XgafIRbRP1dSV+Qhbw0oHYK/ZfcKH3YrxTuMwgIAZoxL2FP2bPOe2UECc2QkCLoGI+4HfH1lebkqEkq5UIwo600h8Hnt7UYWnmas4tcU2QTpqyrk4xHwSoKicE+LulAoqTZi0zXXbOChaFKYD5Q6PYkiO+iFt3IPLacjTn+oPpbOdfw7w4V/ux8NGGEIa88M2mAJm5+G5HrHPb3utZHKufI07TSzQK/d+JhM8J4Smd/1LedEAcjhd61uvyH+q7gBqdAZUEmX1TAM6UDJaKo0sGe7BcHG3xfc/Z97/mLD8yszujAAk4aNCWcXLXckUCd7IJvyxj3xYryQkaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRV9tMwehGJVCW67qx0ZfAWhhRjKJDNVVFAFsPpBZsU=;
 b=Fpp7/5ahIRpK1eyyF8Pq8kjemGqjLa9v+u69r6mrz1tGdiThr5Gg4n50jqXrUBWZU3GtX0LOlbRkeXCSbzsbQ5XSc6rXFL7541lqcyAnaO9+eS0ZVCyKBwvcygUM5H7+xemNdUvLW9/zJA0xHR48AqzLtpSIB530JnwkSjpOq60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3319.eurprd04.prod.outlook.com (2603:10a6:209:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 03:10:27 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::3d7e:6627:fdd0:9d13]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::3d7e:6627:fdd0:9d13%4]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 03:10:27 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v15.1 05/13] media: amphion: implement vpu core communication based on mailbox
Date:   Wed, 26 Jan 2022 11:09:24 +0800
Message-Id: <5873ee47a84cdf5f0377ce9f7a65a90a8bcc34c7.1643165765.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1643165764.git.ming.qian@nxp.com>
References: <cover.1643165764.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0091.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::17) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec3a7e74-b51b-4640-4719-08d9e07966b8
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3319:EE_
X-Microsoft-Antispam-PRVS: <AM6PR0402MB33193BF1830F943FA604939EE7209@AM6PR0402MB3319.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QVroFGcEHN6hBWs3LbQUBk4Zycxjttmp2p6bm+Y6aYnWhaY+oiL7k8+W2j3+oLZAntO7woqZlIutlBkmsffBPUoOUN9gwdU6LaM70efkoWC3NuPnIw7qtgusKXD9acfxFpazzeBA5gxIxOgzGYtyTemtqe+rsmJqKCFF9uo05I5oTMFwGjf2ndhkepZ1aVktzvBB93YgaqdW2AetGz5m/U/gfCdjXUZ+MAxM+gY0syWKsGqn+4blhOasywSKtJKMox890NPLco3KKwceQKh5wgEIqEIbcIT20Kgrt/2OpFPOWpOXdy9uBGQkle4AmvPmKSKkhgkp6mvZqn26nCrWI3L++buXgBLiusrcONUbbxQX8GAPRL1/3/7dLQKdhBBJDlzLH/pT0R5eXhY2aLaly4Ad8Lai7O9F6w5ysCPBL3KdaseEYyPAtL6LGjPi/jyF3X1Fsg7ZZV8a48nVC0jUBSglnDOC63m/s4j2LsRjFLkSbQevFguH4OJNurXZ84KS2mZ8PX13eiO3Vg2La9KjvBrTISpaJ27j5v0Am1zfJ4C+jPF+pqKRsZvStrepe5+vV5Fk4VPbkhUSTH7x9hb/gXiQOmnyCPdNH/bBakjUx/1dPFWbLm+c0fVjz4RF1RDxgauz177qiUTSJ+SFMn1DVgpxDYDyBORJO7I78QGDdrPBgXhKWhhy/amTDU0ECZnmpwEGtzsMv1zOpqE5NjguQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(508600001)(2616005)(36756003)(316002)(186003)(26005)(6486002)(66946007)(66476007)(66556008)(8676002)(5660300002)(4326008)(86362001)(30864003)(52116002)(6666004)(6506007)(15650500001)(6512007)(44832011)(7416002)(8936002)(38100700002)(38350700002)(2906002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7W2f7knNwU67nWWccaUY2yg+pIj2t/Z6Ol5GTsEnj+YW1KEDotCPbRizGn+l?=
 =?us-ascii?Q?zd2peabx9GhjsctkRp/CWTRgESgSHhdMsX87pCaFReI8bMQ4Xhdd2aJWHesu?=
 =?us-ascii?Q?o1bzpBRQdY+SANRzasYvDDotimFiWRbLCs5r9cSMlKsMbCZilV7+QfTrLL1Q?=
 =?us-ascii?Q?hvpUXlo8pVxOHNLzeKgKoEpTz4kWI2AejnILeapTp4Jf5bc3YdNoQ2r2aMz6?=
 =?us-ascii?Q?+puwSKT9ZoWD0YyzOhyZWIjaRflcBXSm8jglac9N1wWGnzl8TTChGSar9HwJ?=
 =?us-ascii?Q?fDAGCiQMdlirUsIkXu2bGWyUNU0VIKWLZ2LYENYha88qP+DcB1Qq++Jsm2qq?=
 =?us-ascii?Q?AhhWJemjJZ9qLlZCKZyZoiGi1yZsZYtETDhc+FSMZAAnnHvIv4PLkx/Eusti?=
 =?us-ascii?Q?HxqVoQIQ6WKKh7SJ5mfBRWINL+pufGXhoWISiyIEQKVLq1DEjXJnpwhoQ+1D?=
 =?us-ascii?Q?FuuIjKk5OARKBpS9cKAEqvd5C8xtfTJDRuhr5vMv4gkJvlM2QRyHTTJY3Zbg?=
 =?us-ascii?Q?6N+pHpuFdKFpkC1Uy8vQJEK0CsZCk5eq4X0cXoMdXbHiTi8YtEG6Equz2XeX?=
 =?us-ascii?Q?hfslYZJOw83MxI862gX6vUWHVd5L2CKMPmReGmmfSY5U/+mdvpEl3wohNmaB?=
 =?us-ascii?Q?Min9gJYNiVZ5ctmrbLR4tk7o3Ig5c+rlSt3bsTKmsbUy4C870gCWKowcwtLg?=
 =?us-ascii?Q?tdFqE+YustfVLJf25eLF0P7ifjOvUXbKK3ePDbh1DJkfrJrlgXzhCUYe2Vjc?=
 =?us-ascii?Q?L9IL6a3aauhXOXVTn3xjedIzvu6bAIQE8WuiRn4MhLV0L1Ywdn6Sbdazm+pJ?=
 =?us-ascii?Q?LwfWyguOQt6OefKbl8WxTMJ/iPkqu+Y8w9cn/JI3pnPZNNEGYi0nznkfpojB?=
 =?us-ascii?Q?v2+EsphnK3Lc7zbpOnxPjMLbORjAaC07jCYsxE78EQK4Wz8w6z9YKB2qjkyP?=
 =?us-ascii?Q?np+4cKZz8Dm6O5KTVJwl2Zu8/fihGthYilsVMiiwb7o/wvO2E15dky8fVe+S?=
 =?us-ascii?Q?xAw6hLfRiPQD7VzMgzTf/ALV7M74BktibOgvFTI/9NB8NUqbP+y/Sb/68hSo?=
 =?us-ascii?Q?O632GIraScpESsvFCOqjEFl4KGKCdg57jpaLYwgN5F3LbOAxTJdrti0bFirb?=
 =?us-ascii?Q?Z/OlSmoc70WHYmzmg2Qd3eBDryv2wteQbJ5SYBgNa7vcawkMaFQesECQiJk0?=
 =?us-ascii?Q?cGeyKQb0kzqmNTA9FWg679rFVEGO2rs73m2+1rydXW0NtTA9VPF5rY5VTESH?=
 =?us-ascii?Q?YR0/Xny2BmERukNhUYowUyrE+daCoW5D0T3rke4mTjaTciEsXL/evEdbzg8D?=
 =?us-ascii?Q?ottsgfzoXRfGWcuvOzORNbCpaOIBR8UAPgasLRUrUkUDqhOo3QWHpWWOtGZD?=
 =?us-ascii?Q?V/PZo7Gn8U3NRsl2L5v6YFV87qmnvX+7gZbIiJL7cPONdhwuP05yhENJt162?=
 =?us-ascii?Q?iCByWxfvo1nP7Ch+zqbnR64KG/eWoJfsqQyMiN4cQNmB1ms1O9Jot6NQLFd+?=
 =?us-ascii?Q?Mdzu7PnvHJgl/m8O3fnHLwQnhptPW6fITmr175SgstlC7IsuyCPvXhlSoE/f?=
 =?us-ascii?Q?h+xvuqxmbH4faVhnpqmJ4lUtqkrzicpcvPsom7uZDWcNcT7TbIreyYvRZ05e?=
 =?us-ascii?Q?C/S8WMTvjv+5QVVjvgZl5SI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3a7e74-b51b-4640-4719-08d9e07966b8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 03:10:27.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTTI/1MlucJN6xTYtapjybiV3PUJ5BJD40H4rNWmH8sNpTPZS0/uNh35C5N1XUL/yFH6GOZDo/ercu4jC727TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3319
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

driver use mailbox to communicate with vpu core.
and there are a command buffer and a message buffer.
driver will write commands to the command buffer,
then trigger a vpu core interrupt
vpu core will write messages to the message buffer,
then trigger a cpu interrupt.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/amphion/vpu_cmds.c | 436 ++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_cmds.h |  25 ++
 drivers/media/platform/amphion/vpu_mbox.c | 118 ++++++
 drivers/media/platform/amphion/vpu_mbox.h |  16 +
 drivers/media/platform/amphion/vpu_msgs.c | 385 +++++++++++++++++++
 drivers/media/platform/amphion/vpu_msgs.h |  14 +
 6 files changed, 994 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.h

diff --git a/drivers/media/platform/amphion/vpu_cmds.c b/drivers/media/platform/amphion/vpu_cmds.c
new file mode 100644
index 000000000000..51e404ebda8f
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_cmds.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/delay.h>
+#include <linux/vmalloc.h>
+#include "vpu.h"
+#include "vpu_defs.h"
+#include "vpu_cmds.h"
+#include "vpu_rpc.h"
+#include "vpu_mbox.h"
+
+struct vpu_cmd_request {
+	u32 request;
+	u32 response;
+	u32 handled;
+};
+
+struct vpu_cmd_t {
+	struct list_head list;
+	u32 id;
+	struct vpu_cmd_request *request;
+	struct vpu_rpc_event *pkt;
+	unsigned long key;
+};
+
+static struct vpu_cmd_request vpu_cmd_requests[] = {
+	{
+		.request = VPU_CMD_ID_CONFIGURE_CODEC,
+		.response = VPU_MSG_ID_MEM_REQUEST,
+		.handled = 1,
+	},
+	{
+		.request = VPU_CMD_ID_START,
+		.response = VPU_MSG_ID_START_DONE,
+		.handled = 0,
+	},
+	{
+		.request = VPU_CMD_ID_STOP,
+		.response = VPU_MSG_ID_STOP_DONE,
+		.handled = 0,
+	},
+	{
+		.request = VPU_CMD_ID_ABORT,
+		.response = VPU_MSG_ID_ABORT_DONE,
+		.handled = 0,
+	},
+	{
+		.request = VPU_CMD_ID_RST_BUF,
+		.response = VPU_MSG_ID_BUF_RST,
+		.handled = 1,
+	},
+};
+
+static int vpu_cmd_send(struct vpu_core *core, struct vpu_rpc_event *pkt)
+{
+	int ret = 0;
+
+	ret = vpu_iface_send_cmd(core, pkt);
+	if (ret)
+		return ret;
+
+	/*write cmd data to cmd buffer before trigger a cmd interrupt*/
+	mb();
+	vpu_mbox_send_type(core, COMMAND);
+
+	return ret;
+}
+
+static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data)
+{
+	struct vpu_cmd_t *cmd;
+	int i;
+	int ret;
+
+	cmd = vzalloc(sizeof(*cmd));
+	if (!cmd)
+		return NULL;
+
+	cmd->pkt = vzalloc(sizeof(*cmd->pkt));
+	if (!cmd->pkt) {
+		vfree(cmd);
+		return NULL;
+	}
+
+	cmd->id = id;
+	ret = vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, data);
+	if (ret) {
+		dev_err(inst->dev, "iface pack cmd(%d) fail\n", id);
+		vfree(cmd->pkt);
+		vfree(cmd);
+		return NULL;
+	}
+	for (i = 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
+		if (vpu_cmd_requests[i].request == id) {
+			cmd->request = &vpu_cmd_requests[i];
+			break;
+		}
+	}
+
+	return cmd;
+}
+
+static void vpu_free_cmd(struct vpu_cmd_t *cmd)
+{
+	if (!cmd)
+		return;
+	if (cmd->pkt)
+		vfree(cmd->pkt);
+	vfree(cmd);
+}
+
+static int vpu_session_process_cmd(struct vpu_inst *inst, struct vpu_cmd_t *cmd)
+{
+	int ret;
+
+	if (!inst || !cmd || !cmd->pkt)
+		return -EINVAL;
+
+	dev_dbg(inst->dev, "[%d]send cmd(0x%x)\n", inst->id, cmd->id);
+	vpu_iface_pre_send_cmd(inst);
+	ret = vpu_cmd_send(inst->core, cmd->pkt);
+	if (!ret) {
+		vpu_iface_post_send_cmd(inst);
+		vpu_inst_record_flow(inst, cmd->id);
+	} else {
+		dev_err(inst->dev, "[%d] iface send cmd(0x%x) fail\n", inst->id, cmd->id);
+	}
+
+	return ret;
+}
+
+static void vpu_process_cmd_request(struct vpu_inst *inst)
+{
+	struct vpu_cmd_t *cmd;
+	struct vpu_cmd_t *tmp;
+
+	if (!inst || inst->pending)
+		return;
+
+	list_for_each_entry_safe(cmd, tmp, &inst->cmd_q, list) {
+		list_del_init(&cmd->list);
+		if (vpu_session_process_cmd(inst, cmd))
+			dev_err(inst->dev, "[%d] process cmd(%d) fail\n", inst->id, cmd->id);
+		if (cmd->request) {
+			inst->pending = (void *)cmd;
+			break;
+		}
+		vpu_free_cmd(cmd);
+	}
+}
+
+static int vpu_request_cmd(struct vpu_inst *inst, u32 id, void *data,
+			   unsigned long *key, int *sync)
+{
+	struct vpu_core *core;
+	struct vpu_cmd_t *cmd;
+
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	core = inst->core;
+	cmd = vpu_alloc_cmd(inst, id, data);
+	if (!cmd)
+		return -ENOMEM;
+
+	mutex_lock(&core->cmd_lock);
+	cmd->key = core->cmd_seq++;
+	if (key)
+		*key = cmd->key;
+	if (sync)
+		*sync = cmd->request ? true : false;
+	list_add_tail(&cmd->list, &inst->cmd_q);
+	vpu_process_cmd_request(inst);
+	mutex_unlock(&core->cmd_lock);
+
+	return 0;
+}
+
+static void vpu_clear_pending(struct vpu_inst *inst)
+{
+	if (!inst || !inst->pending)
+		return;
+
+	vpu_free_cmd(inst->pending);
+	wake_up_all(&inst->core->ack_wq);
+	inst->pending = NULL;
+}
+
+static bool vpu_check_response(struct vpu_cmd_t *cmd, u32 response, u32 handled)
+{
+	struct vpu_cmd_request *request;
+
+	if (!cmd || !cmd->request)
+		return false;
+
+	request = cmd->request;
+	if (request->response != response)
+		return false;
+	if (request->handled != handled)
+		return false;
+
+	return true;
+}
+
+int vpu_response_cmd(struct vpu_inst *inst, u32 response, u32 handled)
+{
+	struct vpu_core *core;
+
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	core = inst->core;
+	mutex_lock(&core->cmd_lock);
+	if (vpu_check_response(inst->pending, response, handled))
+		vpu_clear_pending(inst);
+
+	vpu_process_cmd_request(inst);
+	mutex_unlock(&core->cmd_lock);
+
+	return 0;
+}
+
+void vpu_clear_request(struct vpu_inst *inst)
+{
+	struct vpu_cmd_t *cmd;
+	struct vpu_cmd_t *tmp;
+
+	mutex_lock(&inst->core->cmd_lock);
+	if (inst->pending)
+		vpu_clear_pending(inst);
+
+	list_for_each_entry_safe(cmd, tmp, &inst->cmd_q, list) {
+		list_del_init(&cmd->list);
+		vpu_free_cmd(cmd);
+	}
+	mutex_unlock(&inst->core->cmd_lock);
+}
+
+static bool check_is_responsed(struct vpu_inst *inst, unsigned long key)
+{
+	struct vpu_core *core = inst->core;
+	struct vpu_cmd_t *cmd;
+	bool flag = true;
+
+	mutex_lock(&core->cmd_lock);
+	cmd = inst->pending;
+	if (cmd && key == cmd->key) {
+		flag = false;
+		goto exit;
+	}
+	list_for_each_entry(cmd, &inst->cmd_q, list) {
+		if (key == cmd->key) {
+			flag = false;
+			break;
+		}
+	}
+exit:
+	mutex_unlock(&core->cmd_lock);
+
+	return flag;
+}
+
+static int sync_session_response(struct vpu_inst *inst, unsigned long key)
+{
+	struct vpu_core *core;
+
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	core = inst->core;
+
+	call_vop(inst, wait_prepare);
+	wait_event_timeout(core->ack_wq, check_is_responsed(inst, key), VPU_TIMEOUT);
+	call_vop(inst, wait_finish);
+
+	if (!check_is_responsed(inst, key)) {
+		dev_err(inst->dev, "[%d] sync session timeout\n", inst->id);
+		set_bit(inst->id, &core->hang_mask);
+		mutex_lock(&inst->core->cmd_lock);
+		vpu_clear_pending(inst);
+		mutex_unlock(&inst->core->cmd_lock);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vpu_session_send_cmd(struct vpu_inst *inst, u32 id, void *data)
+{
+	unsigned long key;
+	int sync = false;
+	int ret = -EINVAL;
+
+	if (inst->id < 0)
+		return -EINVAL;
+
+	ret = vpu_request_cmd(inst, id, data, &key, &sync);
+	if (!ret && sync)
+		ret = sync_session_response(inst, key);
+
+	if (ret)
+		dev_err(inst->dev, "[%d] send cmd(0x%x) fail\n", inst->id, id);
+
+	return ret;
+}
+
+int vpu_session_configure_codec(struct vpu_inst *inst)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_CONFIGURE_CODEC, NULL);
+}
+
+int vpu_session_start(struct vpu_inst *inst)
+{
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_START, NULL);
+}
+
+int vpu_session_stop(struct vpu_inst *inst)
+{
+	int ret;
+
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+
+	ret = vpu_session_send_cmd(inst, VPU_CMD_ID_STOP, NULL);
+	/* workaround for a firmware bug,
+	 * if the next command is too close after stop cmd,
+	 * the firmware may enter wfi wrongly.
+	 */
+	usleep_range(3000, 5000);
+	return ret;
+}
+
+int vpu_session_encode_frame(struct vpu_inst *inst, s64 timestamp)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_FRAME_ENCODE, &timestamp);
+}
+
+int vpu_session_alloc_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_FS_ALLOC, fs);
+}
+
+int vpu_session_release_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_FS_RELEASE, fs);
+}
+
+int vpu_session_abort(struct vpu_inst *inst)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_ABORT, NULL);
+}
+
+int vpu_session_rst_buf(struct vpu_inst *inst)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_RST_BUF, NULL);
+}
+
+int vpu_session_fill_timestamp(struct vpu_inst *inst, struct vpu_ts_info *info)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_TIMESTAMP, info);
+}
+
+int vpu_session_update_parameters(struct vpu_inst *inst, void *arg)
+{
+	if (inst->type & VPU_CORE_TYPE_DEC)
+		vpu_iface_set_decode_params(inst, arg, 1);
+	else
+		vpu_iface_set_encode_params(inst, arg, 1);
+
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_UPDATE_PARAMETER, arg);
+}
+
+int vpu_session_debug(struct vpu_inst *inst)
+{
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_DEBUG, NULL);
+}
+
+int vpu_core_snapshot(struct vpu_core *core)
+{
+	struct vpu_inst *inst;
+	int ret;
+
+	if (!core || list_empty(&core->instances))
+		return 0;
+
+	inst = list_first_entry(&core->instances, struct vpu_inst, list);
+
+	reinit_completion(&core->cmp);
+	ret = vpu_session_send_cmd(inst, VPU_CMD_ID_SNAPSHOT, NULL);
+	if (ret)
+		return ret;
+	ret = wait_for_completion_timeout(&core->cmp, VPU_TIMEOUT);
+	if (!ret) {
+		dev_err(core->dev, "snapshot timeout\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int vpu_core_sw_reset(struct vpu_core *core)
+{
+	struct vpu_rpc_event pkt;
+	int ret;
+
+	memset(&pkt, 0, sizeof(pkt));
+	vpu_iface_pack_cmd(core, &pkt, 0, VPU_CMD_ID_FIRM_RESET, NULL);
+
+	reinit_completion(&core->cmp);
+	mutex_lock(&core->cmd_lock);
+	ret = vpu_cmd_send(core, &pkt);
+	mutex_unlock(&core->cmd_lock);
+	if (ret)
+		return ret;
+	ret = wait_for_completion_timeout(&core->cmp, VPU_TIMEOUT);
+	if (!ret) {
+		dev_err(core->dev, "sw reset timeout\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/amphion/vpu_cmds.h b/drivers/media/platform/amphion/vpu_cmds.h
new file mode 100644
index 000000000000..bc538d277bc9
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_cmds.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_CMDS_H
+#define _AMPHION_VPU_CMDS_H
+
+int vpu_session_configure_codec(struct vpu_inst *inst);
+int vpu_session_start(struct vpu_inst *inst);
+int vpu_session_stop(struct vpu_inst *inst);
+int vpu_session_abort(struct vpu_inst *inst);
+int vpu_session_rst_buf(struct vpu_inst *inst);
+int vpu_session_encode_frame(struct vpu_inst *inst, s64 timestamp);
+int vpu_session_alloc_fs(struct vpu_inst *inst, struct vpu_fs_info *fs);
+int vpu_session_release_fs(struct vpu_inst *inst, struct vpu_fs_info *fs);
+int vpu_session_fill_timestamp(struct vpu_inst *inst, struct vpu_ts_info *info);
+int vpu_session_update_parameters(struct vpu_inst *inst, void *arg);
+int vpu_core_snapshot(struct vpu_core *core);
+int vpu_core_sw_reset(struct vpu_core *core);
+int vpu_response_cmd(struct vpu_inst *inst, u32 response, u32 handled);
+void vpu_clear_request(struct vpu_inst *inst);
+int vpu_session_debug(struct vpu_inst *inst);
+
+#endif
diff --git a/drivers/media/platform/amphion/vpu_mbox.c b/drivers/media/platform/amphion/vpu_mbox.c
new file mode 100644
index 000000000000..bf759eb2fd46
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_mbox.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include "vpu.h"
+#include "vpu_mbox.h"
+#include "vpu_msgs.h"
+
+static void vpu_mbox_rx_callback(struct mbox_client *cl, void *msg)
+{
+	struct vpu_mbox *rx = container_of(cl, struct vpu_mbox, cl);
+	struct vpu_core *core = container_of(rx, struct vpu_core, rx);
+
+	vpu_isr(core, *(u32 *)msg);
+}
+
+static int vpu_mbox_request_channel(struct device *dev, struct vpu_mbox *mbox)
+{
+	struct mbox_chan *ch;
+	struct mbox_client *cl;
+
+	if (!dev || !mbox)
+		return -EINVAL;
+	if (mbox->ch)
+		return 0;
+
+	cl = &mbox->cl;
+	cl->dev = dev;
+	if (mbox->block) {
+		cl->tx_block = true;
+		cl->tx_tout = 1000;
+	} else {
+		cl->tx_block = false;
+	}
+	cl->knows_txdone = false;
+	cl->rx_callback = vpu_mbox_rx_callback;
+
+	ch = mbox_request_channel_byname(cl, mbox->name);
+	if (IS_ERR(ch)) {
+		dev_err(dev, "Failed to request mbox chan %s, ret : %ld\n",
+			mbox->name, PTR_ERR(ch));
+		return PTR_ERR(ch);
+	}
+
+	mbox->ch = ch;
+	return 0;
+}
+
+int vpu_mbox_init(struct vpu_core *core)
+{
+	scnprintf(core->tx_type.name, sizeof(core->tx_type.name) - 1, "tx0");
+	core->tx_type.block = true;
+
+	scnprintf(core->tx_data.name, sizeof(core->tx_data.name) - 1, "tx1");
+	core->tx_data.block = false;
+
+	scnprintf(core->rx.name, sizeof(core->rx.name) - 1, "rx");
+	core->rx.block = true;
+
+	return 0;
+}
+
+int vpu_mbox_request(struct vpu_core *core)
+{
+	int ret;
+
+	ret = vpu_mbox_request_channel(core->dev, &core->tx_type);
+	if (ret)
+		goto error;
+	ret = vpu_mbox_request_channel(core->dev, &core->tx_data);
+	if (ret)
+		goto error;
+	ret = vpu_mbox_request_channel(core->dev, &core->rx);
+	if (ret)
+		goto error;
+
+	dev_dbg(core->dev, "%s request mbox\n", vpu_core_type_desc(core->type));
+	return 0;
+error:
+	vpu_mbox_free(core);
+	return ret;
+}
+
+void vpu_mbox_free(struct vpu_core *core)
+{
+	mbox_free_channel(core->tx_type.ch);
+	mbox_free_channel(core->tx_data.ch);
+	mbox_free_channel(core->rx.ch);
+	core->tx_type.ch = NULL;
+	core->tx_data.ch = NULL;
+	core->rx.ch = NULL;
+	dev_dbg(core->dev, "%s free mbox\n", vpu_core_type_desc(core->type));
+}
+
+void vpu_mbox_send_type(struct vpu_core *core, u32 type)
+{
+	mbox_send_message(core->tx_type.ch, &type);
+}
+
+void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data)
+{
+	mbox_send_message(core->tx_data.ch, &data);
+	mbox_send_message(core->tx_type.ch, &type);
+}
+
+void vpu_mbox_enable_rx(struct vpu_dev *dev)
+{
+}
diff --git a/drivers/media/platform/amphion/vpu_mbox.h b/drivers/media/platform/amphion/vpu_mbox.h
new file mode 100644
index 000000000000..79cfd874e92b
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_mbox.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_MBOX_H
+#define _AMPHION_VPU_MBOX_H
+
+int vpu_mbox_init(struct vpu_core *core);
+int vpu_mbox_request(struct vpu_core *core);
+void vpu_mbox_free(struct vpu_core *core);
+void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data);
+void vpu_mbox_send_type(struct vpu_core *core, u32 type);
+void vpu_mbox_enable_rx(struct vpu_dev *dev);
+
+#endif
diff --git a/drivers/media/platform/amphion/vpu_msgs.c b/drivers/media/platform/amphion/vpu_msgs.c
new file mode 100644
index 000000000000..a406ab08e490
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_msgs.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "vpu.h"
+#include "vpu_core.h"
+#include "vpu_rpc.h"
+#include "vpu_mbox.h"
+#include "vpu_defs.h"
+#include "vpu_cmds.h"
+#include "vpu_msgs.h"
+#include "vpu_v4l2.h"
+
+#define VPU_PKT_HEADER_LENGTH		3
+
+struct vpu_msg_handler {
+	u32 id;
+	void (*done)(struct vpu_inst *inst, struct vpu_rpc_event *pkt);
+};
+
+static void vpu_session_handle_start_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+}
+
+static void vpu_session_handle_mem_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_pkt_mem_req_data req_data;
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&req_data);
+	vpu_trace(inst->dev, "[%d] %d:%d %d:%d %d:%d\n",
+		  inst->id,
+		  req_data.enc_frame_size,
+		  req_data.enc_frame_num,
+		  req_data.ref_frame_size,
+		  req_data.ref_frame_num,
+		  req_data.act_buf_size,
+		  req_data.act_buf_num);
+	call_vop(inst, mem_request,
+		 req_data.enc_frame_size,
+		 req_data.enc_frame_num,
+		 req_data.ref_frame_size,
+		 req_data.ref_frame_num,
+		 req_data.act_buf_size,
+		 req_data.act_buf_num);
+}
+
+static void vpu_session_handle_stop_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	vpu_trace(inst->dev, "[%d]\n", inst->id);
+
+	call_vop(inst, stop_done);
+}
+
+static void vpu_session_handle_seq_hdr(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_codec_info info;
+	const struct vpu_core_resources *res;
+
+	memset(&info, 0, sizeof(info));
+	res = vpu_get_resource(inst);
+	info.stride = res ? res->stride : 1;
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	call_vop(inst, event_notify, VPU_MSG_ID_SEQ_HDR_FOUND, &info);
+}
+
+static void vpu_session_handle_resolution_change(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	call_vop(inst, event_notify, VPU_MSG_ID_RES_CHANGE, NULL);
+}
+
+static void vpu_session_handle_enc_frame_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_enc_pic_info info;
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	dev_dbg(inst->dev, "[%d] frame id = %d, wptr = 0x%x, size = %d\n",
+		inst->id, info.frame_id, info.wptr, info.frame_size);
+	call_vop(inst, get_one_frame, &info);
+}
+
+static void vpu_session_handle_frame_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_fs_info fs;
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, &fs);
+	call_vop(inst, event_notify, VPU_MSG_ID_FRAME_REQ, &fs);
+}
+
+static void vpu_session_handle_frame_release(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	if (inst->core->type == VPU_CORE_TYPE_ENC) {
+		struct vpu_frame_info info;
+
+		memset(&info, 0, sizeof(info));
+		vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info.sequence);
+		dev_dbg(inst->dev, "[%d] %d\n", inst->id, info.sequence);
+		info.type = inst->out_format.type;
+		call_vop(inst, buf_done, &info);
+	} else if (inst->core->type == VPU_CORE_TYPE_DEC) {
+		struct vpu_fs_info fs;
+
+		vpu_iface_unpack_msg_data(inst->core, pkt, &fs);
+		call_vop(inst, event_notify, VPU_MSG_ID_FRAME_RELEASE, &fs);
+	}
+}
+
+static void vpu_session_handle_input_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	dev_dbg(inst->dev, "[%d]\n", inst->id);
+	call_vop(inst, input_done);
+}
+
+static void vpu_session_handle_pic_decoded(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_pic_info info;
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	call_vop(inst, get_one_frame, &info);
+}
+
+static void vpu_session_handle_pic_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_pic_info info;
+	struct vpu_frame_info frame;
+
+	memset(&frame, 0, sizeof(frame));
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	if (inst->core->type == VPU_CORE_TYPE_DEC)
+		frame.type = inst->cap_format.type;
+	frame.id = info.id;
+	frame.luma = info.luma;
+	frame.skipped = info.skipped;
+	frame.timestamp = info.timestamp;
+
+	call_vop(inst, buf_done, &frame);
+}
+
+static void vpu_session_handle_eos(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	call_vop(inst, event_notify, VPU_MSG_ID_PIC_EOS, NULL);
+}
+
+static void vpu_session_handle_error(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	dev_err(inst->dev, "unsupported stream\n");
+	call_vop(inst, event_notify, VPU_MSG_ID_UNSUPPORTED, NULL);
+	vpu_v4l2_set_error(inst);
+}
+
+static void vpu_session_handle_firmware_xcpt(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	char *str = (char *)pkt->data;
+
+	dev_err(inst->dev, "%s firmware xcpt: %s\n",
+		vpu_core_type_desc(inst->core->type), str);
+	call_vop(inst, event_notify, VPU_MSG_ID_FIRMWARE_XCPT, NULL);
+	set_bit(inst->id, &inst->core->hang_mask);
+	vpu_v4l2_set_error(inst);
+}
+
+struct vpu_msg_handler handlers[] = {
+	{VPU_MSG_ID_START_DONE, vpu_session_handle_start_done},
+	{VPU_MSG_ID_STOP_DONE, vpu_session_handle_stop_done},
+	{VPU_MSG_ID_MEM_REQUEST, vpu_session_handle_mem_request},
+	{VPU_MSG_ID_SEQ_HDR_FOUND, vpu_session_handle_seq_hdr},
+	{VPU_MSG_ID_RES_CHANGE, vpu_session_handle_resolution_change},
+	{VPU_MSG_ID_FRAME_INPUT_DONE, vpu_session_handle_input_done},
+	{VPU_MSG_ID_FRAME_REQ, vpu_session_handle_frame_request},
+	{VPU_MSG_ID_FRAME_RELEASE, vpu_session_handle_frame_release},
+	{VPU_MSG_ID_ENC_DONE, vpu_session_handle_enc_frame_done},
+	{VPU_MSG_ID_PIC_DECODED, vpu_session_handle_pic_decoded},
+	{VPU_MSG_ID_DEC_DONE, vpu_session_handle_pic_done},
+	{VPU_MSG_ID_PIC_EOS, vpu_session_handle_eos},
+	{VPU_MSG_ID_UNSUPPORTED, vpu_session_handle_error},
+	{VPU_MSG_ID_FIRMWARE_XCPT, vpu_session_handle_firmware_xcpt},
+};
+
+static int vpu_session_handle_msg(struct vpu_inst *inst, struct vpu_rpc_event *msg)
+{
+	int ret;
+	u32 msg_id;
+	struct vpu_msg_handler *handler = NULL;
+	unsigned int i;
+
+	ret = vpu_iface_convert_msg_id(inst->core, msg->hdr.id);
+	if (ret < 0)
+		return -EINVAL;
+
+	msg_id = ret;
+	dev_dbg(inst->dev, "[%d] receive event(0x%x)\n", inst->id, msg_id);
+
+	for (i = 0; i < ARRAY_SIZE(handlers); i++) {
+		if (handlers[i].id == msg_id) {
+			handler = &handlers[i];
+			break;
+		}
+	}
+
+	if (handler && handler->done)
+		handler->done(inst, msg);
+
+	vpu_response_cmd(inst, msg_id, 1);
+
+	return 0;
+}
+
+static bool vpu_inst_receive_msg(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	u32 bytes = sizeof(struct vpu_rpc_event_header);
+	u32 ret;
+
+	memset(pkt, 0, sizeof(*pkt));
+	if (kfifo_len(&inst->msg_fifo) < bytes)
+		return false;
+
+	ret = kfifo_out(&inst->msg_fifo, pkt, bytes);
+	if (ret != bytes)
+		return false;
+
+	if (pkt->hdr.num > 0) {
+		bytes = pkt->hdr.num * sizeof(u32);
+		ret = kfifo_out(&inst->msg_fifo, pkt->data, bytes);
+		if (ret != bytes)
+			return false;
+	}
+
+	return true;
+}
+
+void vpu_inst_run_work(struct work_struct *work)
+{
+	struct vpu_inst *inst = container_of(work, struct vpu_inst, msg_work);
+	struct vpu_rpc_event pkt;
+
+	while (vpu_inst_receive_msg(inst, &pkt))
+		vpu_session_handle_msg(inst, &pkt);
+}
+
+static void vpu_inst_handle_msg(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	u32 bytes;
+	u32 id = pkt->hdr.id;
+	int ret;
+
+	if (!inst->workqueue)
+		return;
+
+	bytes = sizeof(pkt->hdr) + pkt->hdr.num * sizeof(u32);
+	ret = kfifo_in(&inst->msg_fifo, pkt, bytes);
+	if (ret != bytes)
+		dev_err(inst->dev, "[%d:%d]overflow: %d\n", inst->core->id, inst->id, id);
+	queue_work(inst->workqueue, &inst->msg_work);
+}
+
+static int vpu_handle_msg(struct vpu_core *core)
+{
+	struct vpu_rpc_event pkt;
+	struct vpu_inst *inst;
+	int ret;
+
+	memset(&pkt, 0, sizeof(pkt));
+	while (!vpu_iface_receive_msg(core, &pkt)) {
+		dev_dbg(core->dev, "event index = %d, id = %d, num = %d\n",
+			pkt.hdr.index, pkt.hdr.id, pkt.hdr.num);
+
+		ret = vpu_iface_convert_msg_id(core, pkt.hdr.id);
+		if (ret < 0)
+			continue;
+
+		inst = vpu_core_find_instance(core, pkt.hdr.index);
+		if (inst) {
+			vpu_response_cmd(inst, ret, 0);
+			mutex_lock(&core->cmd_lock);
+			vpu_inst_record_flow(inst, ret);
+			mutex_unlock(&core->cmd_lock);
+
+			vpu_inst_handle_msg(inst, &pkt);
+			vpu_inst_put(inst);
+		}
+		memset(&pkt, 0, sizeof(pkt));
+	}
+
+	return 0;
+}
+
+static int vpu_isr_thread(struct vpu_core *core, u32 irq_code)
+{
+	dev_dbg(core->dev, "irq code = 0x%x\n", irq_code);
+	switch (irq_code) {
+	case VPU_IRQ_CODE_SYNC:
+		vpu_mbox_send_msg(core, PRC_BUF_OFFSET, core->rpc.phys - core->fw.phys);
+		vpu_mbox_send_msg(core, BOOT_ADDRESS, core->fw.phys);
+		vpu_mbox_send_msg(core, INIT_DONE, 2);
+		break;
+	case VPU_IRQ_CODE_BOOT_DONE:
+		break;
+	case VPU_IRQ_CODE_SNAPSHOT_DONE:
+		break;
+	default:
+		vpu_handle_msg(core);
+		break;
+	}
+
+	return 0;
+}
+
+static void vpu_core_run_msg_work(struct vpu_core *core)
+{
+	const unsigned int SIZE = sizeof(u32);
+
+	while (kfifo_len(&core->msg_fifo) >= SIZE) {
+		u32 data;
+
+		if (kfifo_out(&core->msg_fifo, &data, SIZE) == SIZE)
+			vpu_isr_thread(core, data);
+	}
+}
+
+void vpu_msg_run_work(struct work_struct *work)
+{
+	struct vpu_core *core = container_of(work, struct vpu_core, msg_work);
+	unsigned long delay = msecs_to_jiffies(10);
+
+	vpu_core_run_msg_work(core);
+	queue_delayed_work(core->workqueue, &core->msg_delayed_work, delay);
+}
+
+void vpu_msg_delayed_work(struct work_struct *work)
+{
+	struct vpu_core *core;
+	struct delayed_work *dwork;
+	u32 bytes = sizeof(bytes);
+	u32 i;
+
+	if (!work)
+		return;
+
+	dwork = to_delayed_work(work);
+	core = container_of(dwork, struct vpu_core, msg_delayed_work);
+	if (kfifo_len(&core->msg_fifo) >= bytes)
+		vpu_core_run_msg_work(core);
+
+	bytes = sizeof(struct vpu_rpc_event_header);
+	for (i = 0; i < core->supported_instance_count; i++) {
+		struct vpu_inst *inst = vpu_core_find_instance(core, i);
+
+		if (!inst)
+			continue;
+
+		if (inst->workqueue && kfifo_len(&inst->msg_fifo) >= bytes)
+			queue_work(inst->workqueue, &inst->msg_work);
+
+		vpu_inst_put(inst);
+	}
+}
+
+int vpu_isr(struct vpu_core *core, u32 irq)
+{
+	switch (irq) {
+	case VPU_IRQ_CODE_SYNC:
+		break;
+	case VPU_IRQ_CODE_BOOT_DONE:
+		complete(&core->cmp);
+		break;
+	case VPU_IRQ_CODE_SNAPSHOT_DONE:
+		complete(&core->cmp);
+		break;
+	default:
+		break;
+	}
+
+	if (kfifo_in(&core->msg_fifo, &irq, sizeof(irq)) != sizeof(irq))
+		dev_err(core->dev, "[%d]overflow: %d\n", core->id, irq);
+	queue_work(core->workqueue, &core->msg_work);
+
+	return 0;
+}
diff --git a/drivers/media/platform/amphion/vpu_msgs.h b/drivers/media/platform/amphion/vpu_msgs.h
new file mode 100644
index 000000000000..c466b4f62aad
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_msgs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_MSGS_H
+#define _AMPHION_VPU_MSGS_H
+
+int vpu_isr(struct vpu_core *core, u32 irq);
+void vpu_inst_run_work(struct work_struct *work);
+void vpu_msg_run_work(struct work_struct *work);
+void vpu_msg_delayed_work(struct work_struct *work);
+
+#endif
-- 
2.33.0

