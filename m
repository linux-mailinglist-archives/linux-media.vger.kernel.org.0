Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542AB4087D7
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238593AbhIMJNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:13:32 -0400
Received: from mail-eopbgr140043.outbound.protection.outlook.com ([40.107.14.43]:39618
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238581AbhIMJNZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:13:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKhQZl5Mns2wk8cWKKmjuNgD4fIcs95z9Fg6lJad+f3Q6p6XCdzIl6iZHHaoeRWHUS4QkJP0yFi5XBPldP9zFS4qG9DuwUQKqIal1TReIpd31aRCEa8fX3wuaMoIgg7RhFQ4r5dZDVGb7HoTWZQXcZWoFwE+WZeBcp5r8VZtcTbfHD2OqdXEQwENBOShcLogs8WoPXrVs//pF+co9kBaUmT2zohMaWf6+SRx2H8B2uJaWFJ7UbAz7avdNsM0bxWI01Of2jraixNWSu/zXVm1Xry04ORfecet/GZ919jSFqxBVaSJsuwZIEHUXmK91BXgSgnuuX6mESgCWFU9YVzKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RalFoiOLZXT8nMxqtVf/3ehpUoPlAIXjzhHqDHSmg14=;
 b=XZHAPUNkBMBv8Qf8jDATfge5Fig09oftO8VWCBG/cwr7YDDud73MwtS8sSQswa4LfHv1CCCcgY9GHNlNG3nM8Ot3C2lOHKp7m3mOovKfAsnFYjLXihY+rmBR7B4cUkRYrBrm91SRbF132BBwzjPXEF1faAB0BT+Yqo3ww3o7xGMvSZJxGC+Wfv88Sv/PZFyfwGPTb3xFuCX895TUYWAZw61LyioRISErTUxNeEPlquYj8lhdXlzegUfUFHtSAzITcqI0jguY25t0E3WOtjNlrykrw1nIOFpetyRVezQ0bjMHDnAm32QNYtfTZHHRC2WWPfjC8zhLDOZ5/L265IZgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RalFoiOLZXT8nMxqtVf/3ehpUoPlAIXjzhHqDHSmg14=;
 b=sArqY+vl8f6yAEML8nIuLh9HHtIvu5StA78lBP8MwVxmbv4X91DEmrYkoYOKDWzc5QvYsFiC5NMUFERkidNeH8tMbAEO5xmuCKewTzJQWXyQpuZav1XUSCaR61Yj/j2v+jkoVdEKNaT/uVtWFAau+x+7lBuiDSLrewuqGRDDfzo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3925.eurprd04.prod.outlook.com (2603:10a6:209:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:12:04 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:12:04 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 05/13] media: amphion: implement vpu core communication based on mailbox
Date:   Mon, 13 Sep 2021 17:11:07 +0800
Message-Id: <a9e41d712b980b156b2b2415d052058739ac5026.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:12:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25b60d43-0c19-4597-2691-08d976968dc0
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB392532D4AADCE5D7EED92322E7D99@AM6PR0402MB3925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jfmXXh9KQ3/HG3JQNTRNKKjpsGsvhFrRPWbTl2f+0RiUiKv+9Txd8tbh/Iz9yZZh7/+cGITw/scfnUoYvJQb4xbAbdwXRqfE3ond65pBYfDxcKrrNUKOiNNxZwhIrz7eMndEPhL6AB+7Yg3QO7pXrOnHGGqPVC9fd2qChNPKS8zTl8isN+JG7vo9LD7dUO4Eh7wZmSc+Y6tIuUVtzldIIbePRmuU8ZAyrPIXL+kNpEj76CvW0MsCrPyMHAyFtRUBDumET1ZmIAZF3I9X8p87NxXRbdbU9S6CUgTCwvU8f578Q58RUtsWe7y8Cmd7CEHqoFGzcSinnzijo6Zq9x5AW7ACwSKukW+seu5hE659iVtdoA9P6dgfawp9sGhxq/QxNWv1g/uIs414fIFWICRI3KmC2XAYSGwtJxK8zkoRFjbA8NZyltc1zl/deJC97tB0Bwrbt0gRJiUFnfK8iKvkLL5GvN0GzwY9dCJCINmPj3DsO9FX5UY5d/sOltZ5gZvKnw9A0FOdE02b8nXe0yd49PvbFOsIZpNubexvzx5fAoCJKBtnond9xkNHzjx5TdOWtqwc/pZfGLNA4fGBfbhe4DobVVOYXcBpe9FriiMdAwrwQG4P1AxCb9yYY2Ln2UL2xGxmRSUWVujYLa7S0To0j3ZuconGgvOU5AOLGZd4zj5nnA0ZWhr5V0IeFNCKXMPktqJFsBygcdop9ASmt4RdKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(7416002)(30864003)(66946007)(66476007)(38350700002)(38100700002)(26005)(8676002)(6486002)(52116002)(7696005)(15650500001)(5660300002)(8936002)(83380400001)(186003)(66556008)(478600001)(956004)(316002)(2616005)(36756003)(44832011)(4326008)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++VWK6iXB/JuBj9o4fcLq/YNKeU8LVUcWGnUENfCJAVLMRIUscuquk4CbtxR?=
 =?us-ascii?Q?aR0DW5hSRxDM2cCs3VomzZZwIxAAlHMoRGRckwbg3fsrMUBU19BuRj/aT+Ed?=
 =?us-ascii?Q?QNNh3M6nYmRrfRoYJNVgoSZkUoT4KT5f0CvrliK0L31gv9ocUal2Zo1o05on?=
 =?us-ascii?Q?fSMI+BDnsovdyCmRrCDKgZObItnDOOS5Soln3h2KxnvdlHuzs9bi4uMsbkDq?=
 =?us-ascii?Q?SxewW+chkVM4w15qD0CITE/T8O2oyBCW1balHU8/Y4SYG52fJ06TCdlsTQNW?=
 =?us-ascii?Q?RBJ5Cq3NNzTBnxZ7ljsHv0NFiYKUB4YI3NihO0m89FIfDpo0xFTp3kwyVWP3?=
 =?us-ascii?Q?45sY8MdSRgQm9avus5Tjen7uQF0pccfeU61suqd5ZwBn8XXT1PsIrEdDu+dQ?=
 =?us-ascii?Q?KHvoRgB1KtB/AZBdzojrwfvjQZ+e6RfqnyZObR5yxMq6Jj6SGVivqvRFK/o9?=
 =?us-ascii?Q?0o/HeaF7nn3OWOCTlYGN4Fz0gRZGeRrVwp5eOUM3e+DDUBkM2tZnsVzfIRZk?=
 =?us-ascii?Q?JzrLpqQTZyIRdXfQ/qVKdrXC1SbwgxioPyVTRcHqudzAr21/zP31AMANSXd7?=
 =?us-ascii?Q?G2jT5EnLue4jFFt3bwoHysv4Bvgli/U8r0E93h/SM6rt6jbX0P5YUTSyOFju?=
 =?us-ascii?Q?XeXsdTAnA2V6XoYXyYsmsiB3R+XDkqAcL5Vgp2s/o0dSqjNpPgMnrIjhuQO+?=
 =?us-ascii?Q?lTc4UFoC23dGQmX4PyJvoqNxe0Ro2CD0TyNC383XFKrI1JPGmtbcHXEtPMPT?=
 =?us-ascii?Q?PnXJnE4w/bAAQNmmNRtVxv9/0V7fQlyMAgtAvGyPTRlJ8R9WjSBLo7jDQern?=
 =?us-ascii?Q?A+N02NU/JIMt1TP8VlI9KimmH0h3txQP2rWVQ4LU3wx5XnQU5LRvg3K/vsV8?=
 =?us-ascii?Q?YLnUjPO8gfArKaxm06k282G4EsW8htt7YrxGFKUmOkRDtkn7PJ9obC92KNfj?=
 =?us-ascii?Q?jGYhOtdJaiLFKQCLMm+uGy+DElxRrQ/SH5cKlLYiJfVzl+CSaVCk/X0kxVK1?=
 =?us-ascii?Q?94OFduTnhqXGpMulbDdOQXUvv8ciqgemiY9hOUpMoayM2lPvJ+4Wc7Et/ufR?=
 =?us-ascii?Q?j/l/EEkcHBI7qoHAj8N2QYH31vUyofo7pVw8jhoj0/h1V2+K2fWn1zelq/GI?=
 =?us-ascii?Q?DZvsTwSNTBTkXlNeJQVCXXpCmHvamuK8OzGTfJMmf16axMldiY9erU0r9s4o?=
 =?us-ascii?Q?QaDi50ZylC8sNDw3CMhOv4HQCIQhcfrS2CLzjRqIYpWumJizVOBrqxZQPU66?=
 =?us-ascii?Q?8TgOxCrWsGs74X6lbfH7ym00m9m2YSeS6dAUei1pSC0LHsUE+iL+i5ZHMYUm?=
 =?us-ascii?Q?vzyIaj2OSfOp0/ZtSNOyOQjN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b60d43-0c19-4597-2691-08d976968dc0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:12:04.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3XTUVCCLlCRhkqMIUJ0vZiarP0rED45KqFeCJueumfGHO1WO+0xMIfQeAj68WXAU1SARDZsF8Xd/R9qvGb2vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3925
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
---
 drivers/media/platform/amphion/vpu_cmds.c | 435 ++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_cmds.h |  25 ++
 drivers/media/platform/amphion/vpu_mbox.c | 126 +++++++
 drivers/media/platform/amphion/vpu_mbox.h |  16 +
 drivers/media/platform/amphion/vpu_msgs.c | 413 ++++++++++++++++++++
 drivers/media/platform/amphion/vpu_msgs.h |  14 +
 6 files changed, 1029 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.h

diff --git a/drivers/media/platform/amphion/vpu_cmds.c b/drivers/media/platform/amphion/vpu_cmds.c
new file mode 100644
index 000000000000..01a79ff9eec6
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_cmds.c
@@ -0,0 +1,435 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"CMD"
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
+#include "vpu_log.h"
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
+	WARN_ON(!core || !pkt);
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
+		inst_err(inst, "iface pack cmd(%d) fail\n", id);
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
+	inst_dbg(inst, LVL_CMD, "send cmd(0x%x)\n", cmd->id);
+	vpu_iface_pre_send_cmd(inst);
+	ret = vpu_cmd_send(inst->core, cmd->pkt);
+	if (!ret) {
+		vpu_iface_post_send_cmd(inst);
+		vpu_inst_record_flow(inst, cmd->id);
+	} else {
+		inst_err(inst, "iface send cmd(0x%x) fail\n", cmd->id);
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
+			inst_err(inst, "process cmd(%d) fail\n", cmd->id);
+		if (cmd->request) {
+			inst->pending = (void *)cmd;
+			break;
+		}
+		vpu_free_cmd(cmd);
+	}
+}
+
+static int vpu_request_cmd(struct vpu_inst *inst, u32 id, void *data,
+		unsigned long *key, int *sync)
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
+	wait_event_timeout(core->ack_wq,
+			check_is_responsed(inst, key),
+			VPU_TIMEOUT);
+	call_vop(inst, wait_finish);
+
+	if (!check_is_responsed(inst, key)) {
+		inst_err(inst, "sync session timeout\n");
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
+	WARN_ON(!inst || !inst->core || inst->id < 0);
+
+	ret = vpu_request_cmd(inst, id, data, &key, &sync);
+	if (!ret && sync)
+		ret = sync_session_response(inst, key);
+
+	if (ret)
+		inst_err(inst, "send cmd(0x%x) fail\n", id);
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
+	inst_dbg(inst, LVL_FLOW, "send start cmd\n");
+
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_START, NULL);
+}
+
+int vpu_session_stop(struct vpu_inst *inst)
+{
+	inst_dbg(inst, LVL_FLOW, "send stop cmd\n");
+
+	return vpu_session_send_cmd(inst, VPU_CMD_ID_STOP, NULL);
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
+	WARN_ON(!core || list_empty(&core->instances));
+
+	inst = list_first_entry(&core->instances, struct vpu_inst, list);
+
+	reinit_completion(&core->cmp);
+	ret = vpu_session_send_cmd(inst, VPU_CMD_ID_SNAPSHOT, NULL);
+	if (ret)
+		return ret;
+	ret = wait_for_completion_timeout(&core->cmp, VPU_TIMEOUT);
+	if (!ret) {
+		vpu_err("core[%d] snapshot timeout\n", core->id);
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
+	WARN_ON(!core);
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
+		vpu_err("core[%d] sw reset timeout\n", core->id);
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
index 000000000000..5f926837932f
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_mbox.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"MBOX"
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
+#include "vpu_log.h"
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
+		vpu_err("Failed to request mbox chan %s, ret : %ld\n",
+				mbox->name, PTR_ERR(ch));
+		return PTR_ERR(ch);
+	}
+
+	mbox->ch = ch;
+	return 0;
+}
+
+int vpu_mbox_init(struct vpu_core *core)
+{
+	WARN_ON(!core);
+
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
+	WARN_ON(!core);
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
+	vpu_dbg(LVL_DEBUG, "mbox request\n");
+	return 0;
+error:
+	vpu_mbox_free(core);
+	return ret;
+}
+
+void vpu_mbox_free(struct vpu_core *core)
+{
+	WARN_ON(!core);
+
+	mbox_free_channel(core->tx_type.ch);
+	mbox_free_channel(core->tx_data.ch);
+	mbox_free_channel(core->rx.ch);
+	core->tx_type.ch = NULL;
+	core->tx_data.ch = NULL;
+	core->rx.ch = NULL;
+	vpu_dbg(LVL_DEBUG, "mbox free\n");
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
index 000000000000..5f64511a21a4
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_msgs.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#define TAG		"MSG"
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
+#include "vpu_log.h"
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
+	WARN_ON(!inst || !inst->core);
+
+	inst_dbg(inst, LVL_FLOW, "start done\n");
+}
+
+static void vpu_session_handle_mem_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_pkt_mem_req_data req_data;
+
+	WARN_ON(!inst || !inst->core || !inst->ops);
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&req_data);
+	inst_dbg(inst, LVL_FLOW, "mem request event : %d:%d %d:%d %d:%d\n",
+				req_data.enc_frame_size,
+				req_data.enc_frame_num,
+				req_data.ref_frame_size,
+				req_data.ref_frame_num,
+				req_data.act_buf_size,
+				req_data.act_buf_num);
+	call_vop(inst, mem_request,
+				req_data.enc_frame_size,
+				req_data.enc_frame_num,
+				req_data.ref_frame_size,
+				req_data.ref_frame_num,
+				req_data.act_buf_size,
+				req_data.act_buf_num);
+}
+
+static void vpu_session_handle_stop_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	WARN_ON(!inst || !inst->core);
+
+	inst_dbg(inst, LVL_FLOW, "stop done\n");
+
+	call_vop(inst, stop_done);
+}
+
+static void vpu_session_handle_seq_hdr(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_codec_info info;
+
+	WARN_ON(!inst || !inst->core);
+
+	info.stride = inst->core->res->stride;
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	call_vop(inst, event_notify, VPU_MSG_ID_SEQ_HDR_FOUND, &info);
+}
+
+static void vpu_session_handle_resolution_change(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	WARN_ON(!inst || !inst->core);
+
+	call_vop(inst, event_notify, VPU_MSG_ID_RES_CHANGE, NULL);
+}
+
+static void vpu_session_handle_enc_frame_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_enc_pic_info info;
+
+	WARN_ON(!inst || !inst->core);
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	inst_dbg(inst, LVL_DEBUG, "frame id = %d, wptr = 0x%x, size = %d\n",
+			info.frame_id, info.wptr, info.frame_size);
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
+
+	WARN_ON(!inst || !inst->core);
+
+	if (inst->core->type == VPU_CORE_TYPE_ENC) {
+		struct vpu_frame_info info;
+
+		memset(&info, 0, sizeof(info));
+		vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info.sequence);
+		inst_dbg(inst, LVL_DEBUG, "frame release:%d\n", info.sequence);
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
+
+	WARN_ON(!inst || !inst->core);
+
+	inst_dbg(inst, LVL_DEBUG, "frame input done\n");
+	call_vop(inst, input_done);
+}
+
+static void vpu_session_handle_pic_decoded(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_pic_info info;
+
+	WARN_ON(!inst || !inst->core);
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
+	WARN_ON(!inst || !inst->core);
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
+	call_vop(inst, event_notify, VPU_MSG_ID_UNSUPPORTED, NULL);
+	vpu_v4l2_set_error(inst);
+}
+
+static void vpu_session_handle_firmware_xcpt(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	char *str = (char *)pkt->data;
+
+	inst_err(inst, "%s firmware xcpt: %s\n",
+			vpu_core_type_desc(inst->core->type), str);
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
+	inst_dbg(inst, LVL_EVT, "receive event(0x%x)\n", msg_id);
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
+	if (!inst->workqueue) {
+		vpu_session_handle_msg(inst, pkt);
+		return;
+	}
+
+	bytes = sizeof(pkt->hdr) + pkt->hdr.num * sizeof(u32);
+	ret = kfifo_in(&inst->msg_fifo, pkt, bytes);
+	if (ret != bytes)
+		vpu_err("[%d:%d]overflow: %d\n", inst->core->id, inst->id, id);
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
+		vpu_dbg(LVL_DEBUG, "event index = %d, id = %d, num = %d\n",
+				pkt.hdr.index, pkt.hdr.id, pkt.hdr.num);
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
+	WARN_ON(!core);
+
+	vpu_dbg(LVL_DEBUG, "core[%d] irq code = 0x%x\n", core->id, irq_code);
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
+
+int vpu_isr(struct vpu_core *core, u32 irq)
+{
+	WARN_ON(!core);
+
+	vpu_dbg(LVL_DEBUG, "core[%d] irq code = 0x%x\n", core->id, irq);
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
+		vpu_err("[%d]overflow: %d\n", core->id, irq);
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
2.32.0

