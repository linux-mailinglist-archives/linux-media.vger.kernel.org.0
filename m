Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9872F3CF1CF
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbhGTBY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:24:59 -0400
Received: from mail-am6eur05on2074.outbound.protection.outlook.com ([40.107.22.74]:54432
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243571AbhGTBFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:05:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meWUcY4+4EWfOonXYJcAMOS72OKafqX9MBBtf8RT1eicwtIcnSu7qiPgQuDp9BGOnOvTJjGUvdw9Q0UljLNy2OmN6KAjA3WjIjTDD1um65MHaIZ+htYos3kvjTKfn7GOHbP5gGXD0eA/i3C/8gz6bF0gQnY6yxpgDUXWoTDGXvMrYC61PDUQxvqPiSeFRiluGZAfEniAX8sqOxMIHNgnMhbwMS0bwq8SVA8IbNWc8q2EWwnXqiYUXb2vT5HCyiRbAaneV+2ArG62JW/N9gYSixppy4/YQKM0H682YuH76VmgbxlMRyOgNL13cBwNyUPOwpFvJLAzbhOe3rCZ1yliBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptk70abqnAjCiDNTI+sF66YyDf/RrKk8GJpOuBWku44=;
 b=WOQ/XiHm6Byw1XzCBxefO20CaJe9CdLXIZEwFZTpUvHiRu7JxopmR4INch4qrkAm7FuDeNB4ByISc7V8KoPcIAvfwl84+6yyaRcpuT/xo/RdnwGbkIpAjJLU8dLcFp9tcOFT1/JwPKB/a7Wq6O6LuP/ZZ6o3qYANncLtwizA420rsv+PlIxUtK4/+t+X55uFWEKeStPfHlmJqwZ4EQfS9a/xcu0Ub3GQP202JUkScFN4CxdpozY/c/3aCDxDDM8ZwoKKQvtdfWIxy5L37VVcLg6o59iVoa75wuu5NQUCQ/7kFU4m0Z5poEk4fX8Na0i6A2mFvpIe/aOAOzBUO/0iVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptk70abqnAjCiDNTI+sF66YyDf/RrKk8GJpOuBWku44=;
 b=DAmFIqBWkIXFf086g6TrTEsdT+64qLKvgK/FWM/wH+BgzKedKS/1qBCziwpR+j93c4bYnaG8Gt2joTK4q/S0E59LivaP+kvLH7xQ9TMpxsVHnhviTJKFSJ93m6dvKjK4aYoJjhYvRt71RKJ9bHRlCNVs9sPJh/nRItk2Hphx1Xc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:44:17 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:44:17 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 05/13] media: imx: imx8q: implement vpu core communication based on mailbox
Date:   Tue, 20 Jul 2021 09:43:24 +0800
Message-Id: <a6d71095bc7e30441654df04fda35a1cd900b5e8.1626743758.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626743758.git.ming.qian@nxp.com>
References: <cover.1626743758.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:44:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f115efd-2b9e-47d3-8ed1-08d94b1fe31e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB38135A459692C60CF2949832E7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AA3GF11eACb4eW8Dw0TcO8ZcZCHTHVMPll80DIf6FIBqP3jR1vWiexu82mP5FgE0AqQ1Q2BFNhYs8u8311BtU1A5JCTL2/KrYE8+C3/X8eK5U4VuCUc1Sr5ixCzRnPq/U/849rqcwrpiziHzK6VlM7q2Lw1mng3MS7E+Aq7RA+nNwgidCdElRXqr/fF0feFQTPqVvUQ35IRaDUvx0MaRREuTglmcuoJqeXgyBHjsps7xmL5KdPGk16OHyAtjFC9WRHm4R2/pU6qnhz/NcY4OtHLVISmyEmm6+ooNq6Ghmrgccqrl0o+N4QYdpeQiQmLJbrDwHY0cW5fxquYIo1z/kx+pJZRdL56S1+n+EyyAXK5K+jObQX7wLmb3njllVnvUx/7jZl5jni1zOUSI0lYGiQRFDFOnV5v1T7FCMXUuf/8+qcm7mDYkRstCCAUNqm6O0cF5jV3kcEk02A2vnlmcCtY8SCNTeq/uXMrvYgi53br53XpjpD+4E7Eb5nWM4AM/fLeFG88+nY2FZY/DyLw8ZrkA7Fb3kXMRyESiGOdBSo7WHeuVyUOr6t5SRHc4wTxfWfFbGxAcKwOMG2wtWIa1fnLm7rsFIfFGW0jekmm3MCkHQseyZ0oNhrXYX3d7Bd4iX71yGWnCkFEUNtIMNwlyIctrZeGznc5lTF3/IBM4XTzd/+EVHAGYt7iJhGgjf8qefyxlT1lq15jIj8gPTVa2kWwljwqQcy/7577ZduA2iYmt875/aO68aXE7vAgRGiAvbCCAsm2p/9L4DtxVo9drAP93spjt2XXXo8TiLk4GT27mK2T5tKS/7xV+QDIUh4254IdM6lxwmHzqh2GnQf6FYRE3f/tEA0sLSkYIOSY+kHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(30864003)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(966005)(26005)(38350700002)(6486002)(83380400001)(508600001)(44832011)(5660300002)(956004)(2906002)(15650500001)(2616005)(8936002)(7696005)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+Ndul1wEC4mP9azCwDg1ShEqcZuROGirP2bqOJ7NqMyST9urEXEV7cwcMWw?=
 =?us-ascii?Q?XcmbizfuKoBEZnMaNbAMzy7s6pcfmjrubyCNKrC7kAqXlnE42BaKAkY1ti4Q?=
 =?us-ascii?Q?HKSqIn6b9l0TCdGgg9rnK5HLqJqmDiVPpGYLol9EDt3VIPEr6aknXfBpYAiE?=
 =?us-ascii?Q?a5paDq1cwY725QPGnCjAE6FQYaD49MCbfp2BwvEaToYjlWzi+dDNLqt9izQY?=
 =?us-ascii?Q?Ac7Iojiz0WjBvdhh4Y9spbEJZhr628qMm5lVlZ1u4Na9EXhUpOVNAPjSOywb?=
 =?us-ascii?Q?d29uzbCQVREZ3e4X523C5II86tG4rro9f0OzSgbwstyJzp7c/BVybifv/pVY?=
 =?us-ascii?Q?D8t84CTrcg4Khwdb5b9I6LqAxbrXjM6z26qxJRZGy2wZq6gpfp6hIFsNzuQt?=
 =?us-ascii?Q?gfYf4qV/4gfehJ+Rh9hwLew6b8FlmdkmAzMH9xf6Zhf98xycSztwRVX+EvIc?=
 =?us-ascii?Q?CzwuU3tLBHZjpQRtGQt70HcH7zVJlRAZudzV6GfbCujlR4Ezv3RkhysAhobW?=
 =?us-ascii?Q?A+/nTRIo8X5mo9jty5cOgu0DvvQ/Sc5gBIYaR47ayxOvBcF9jHEWTzBBJqer?=
 =?us-ascii?Q?j4N0mlucvRZjkkqwHzeNrRbAXIJFy2PRCzsDNCJ9+WX4pjv4vAS0zNM36iWn?=
 =?us-ascii?Q?Z77CigktWxiGtNKW/b+TlCKuLLuZCcBxYXj7ly5w1bdOAuJ063ubzTxpRRxy?=
 =?us-ascii?Q?L1YRWwfn/w2IsbPS+gf48b0ZDeN0JvoewX7dhxMjFu5OPuQiOtmFc5V1AovR?=
 =?us-ascii?Q?G1yNX6MXoJ6d/Q4egdu9sL82MWog5cvgKDxM7jSmJQiCeqBA3D6H+3tc2fST?=
 =?us-ascii?Q?yCFlAU0vAliPlDc48Z+2vxYvF+bgrOsEmAdZUPLfPppxse72Zs0V2MbG4gG8?=
 =?us-ascii?Q?vkdMZAwsEd2hnfPhIp7qQjsNHahuMyrn78fgkqBN5ZM/mHg0lUXmoHeXL3/Y?=
 =?us-ascii?Q?+uzZNtiZdV6zi2H1xwoNMp32TdpwuZwp9GL8S17O9L3st2X36VOle1h442Y9?=
 =?us-ascii?Q?zm0WaYZMrVxLe7AgieQz7E3xGJv9kqnJi86Ca8G3bP5v0dfXptVohnH7XX6h?=
 =?us-ascii?Q?Y8YHwNEE5C0BAVHsAgc2P68VD4Y6QAPciL5G7ccv3Fr/BsFRwmtzjMmAILi8?=
 =?us-ascii?Q?dAI482reJ2fWBUZaC5S6UITgYYkhXDfxjCg8p6f/jJwobygtKF0vwmolt0uT?=
 =?us-ascii?Q?/jYJ0HLeLr3yNWQCr09wxvdWbkcyPySFNm5wwLbfCMns+PIB5CHKXEaB2rjm?=
 =?us-ascii?Q?A05yNgclSTciUtUtvzjut7w7Gutnek1VArNYcl66gceFGRgv29IWJWm+r1lF?=
 =?us-ascii?Q?qIUiDbHgFfRNUG+84KokMb8t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f115efd-2b9e-47d3-8ed1-08d94b1fe31e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:44:17.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6ckYm/jrnYlMOR36+Ix81hGOGiLovXnqi1jGw7cqV3sKUnQD5NAN2e7YhC1CYmDYJ9tn+cpn175TkKAoEAjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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
---
 drivers/media/platform/imx/vpu-8q/vpu_cmds.c | 446 +++++++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.h |  34 ++
 drivers/media/platform/imx/vpu-8q/vpu_mbox.c | 135 ++++++
 drivers/media/platform/imx/vpu-8q/vpu_mbox.h |  25 ++
 drivers/media/platform/imx/vpu-8q/vpu_msgs.c | 420 +++++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu_msgs.h |  23 +
 6 files changed, 1083 insertions(+)
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.h

diff --git a/drivers/media/platform/imx/vpu-8q/vpu_cmds.c b/drivers/media/platform/imx/vpu-8q/vpu_cmds.c
new file mode 100644
index 000000000000..e9c0999d300e
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_cmds.c
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
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
+int vpu_cmd_send(struct vpu_core *core, struct vpu_rpc_event *pkt)
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
+struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data)
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
+void vpu_free_cmd(struct vpu_cmd_t *cmd)
+{
+	if (!cmd)
+		return;
+	if (cmd->pkt)
+		vfree(cmd->pkt);
+	vfree(cmd);
+}
+
+int vpu_session_process_cmd(struct vpu_inst *inst, struct vpu_cmd_t *cmd)
+{
+	int ret;
+
+	if (!inst || !cmd || !cmd->pkt)
+		return -EINVAL;
+
+	inst_dbg(inst, LVL_CMD, "send cmd(%d)\n", cmd->id);
+	vpu_iface_pre_send_cmd(inst);
+	ret = vpu_cmd_send(inst->core, cmd->pkt);
+	if (!ret) {
+		vpu_iface_post_send_cmd(inst);
+		vpu_inst_record_flow(inst, cmd->id);
+	} else {
+		inst_err(inst, "iface send cmd(%d) fail\n", cmd->id);
+	}
+
+	return ret;
+}
+
+void vpu_process_cmd_request(struct vpu_inst *inst)
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
+int vpu_request_cmd(struct vpu_inst *inst, u32 id, void *data,
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
+void vpu_clear_pending(struct vpu_inst *inst)
+{
+	if (!inst || !inst->pending)
+		return;
+
+	vpu_free_cmd(inst->pending);
+	wake_up_all(&inst->core->ack_wq);
+	inst->pending = NULL;
+}
+
+bool vpu_check_response(struct vpu_cmd_t *cmd, u32 response, u32 handled)
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
+	long ret;
+
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	core = inst->core;
+
+	call_vop(inst, wait_prepare);
+	ret = wait_event_timeout(core->ack_wq,
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
+int vpu_session_send_cmd(struct vpu_inst *inst, u32 id, void *data)
+{
+	struct vpu_core *core;
+	unsigned long key;
+	int sync = false;
+	int ret = -EINVAL;
+
+	WARN_ON(!inst || !inst->core || inst->id < 0);
+	core = inst->core;
+
+	ret = vpu_request_cmd(inst, id, data, &key, &sync);
+	if (!ret && sync)
+		ret = sync_session_response(inst, key);
+
+	if (ret)
+		inst_err(inst, "send cmd(%d) fail\n", id);
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_cmds.h b/drivers/media/platform/imx/vpu-8q/vpu_cmds.h
new file mode 100644
index 000000000000..fa114ed5ba7d
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_cmds.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef _IMX_VPU_CMDS_H
+#define _IMX_VPU_CMDS_H
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_mbox.c b/drivers/media/platform/imx/vpu-8q/vpu_mbox.c
new file mode 100644
index 000000000000..c20aebb16991
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_mbox.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_mbox.h b/drivers/media/platform/imx/vpu-8q/vpu_mbox.h
new file mode 100644
index 000000000000..60fb797ccb0c
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_mbox.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef _IMX_VPU_MBOX_H
+#define _IMX_VPU_MBOX_H
+
+int vpu_mbox_init(struct vpu_core *core);
+int vpu_mbox_request(struct vpu_core *core);
+void vpu_mbox_free(struct vpu_core *core);
+void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data);
+void vpu_mbox_send_type(struct vpu_core *core, u32 type);
+void vpu_mbox_enable_rx(struct vpu_dev *dev);
+
+#endif
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_msgs.c b/drivers/media/platform/imx/vpu-8q/vpu_msgs.c
new file mode 100644
index 000000000000..cbd15e384922
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_msgs.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
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
+void vpu_session_handle_start_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	WARN_ON(!inst || !inst->core);
+
+	inst_dbg(inst, LVL_FLOW, "start done\n");
+}
+
+void vpu_session_handle_mem_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
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
+void vpu_session_handle_stop_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	WARN_ON(!inst || !inst->core);
+
+	inst_dbg(inst, LVL_FLOW, "stop done\n");
+
+	call_vop(inst, stop_done);
+}
+
+void vpu_session_handle_seq_hdr(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_codec_info info;
+
+	WARN_ON(!inst || !inst->core);
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	call_vop(inst, event_notify, VPU_MSG_ID_SEQ_HDR_FOUND, &info);
+}
+
+void vpu_session_handle_resolution_change(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	WARN_ON(!inst || !inst->core);
+
+	call_vop(inst, event_notify, VPU_MSG_ID_RES_CHANGE, NULL);
+}
+
+void vpu_session_handle_enc_frame_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
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
+void vpu_session_handle_frame_request(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_fs_info fs;
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, &fs);
+	call_vop(inst, event_notify, VPU_MSG_ID_FRAME_REQ, &fs);
+}
+
+void vpu_session_handle_frame_release(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
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
+void vpu_session_handle_input_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+
+	WARN_ON(!inst || !inst->core);
+
+	inst_dbg(inst, LVL_DEBUG, "frame input done\n");
+	call_vop(inst, input_done);
+}
+
+void vpu_session_handle_pic_decoded(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	struct vpu_dec_pic_info info;
+
+	WARN_ON(!inst || !inst->core);
+
+	vpu_iface_unpack_msg_data(inst->core, pkt, (void *)&info);
+	call_vop(inst, get_one_frame, &info);
+}
+
+void vpu_session_handle_pic_done(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
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
+void vpu_session_handle_eos(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	call_vop(inst, event_notify, VPU_MSG_ID_PIC_EOS, NULL);
+}
+
+void vpu_session_handle_error(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	call_vop(inst, event_notify, VPU_MSG_ID_UNSUPPORTED, NULL);
+	vpu_notify_codec_error(inst);
+}
+
+void vpu_session_handle_firmware_xcpt(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
+{
+	char *str = (char *)pkt->data;
+
+	inst_err(inst, "%s firmware xcpt: %s\n",
+			vpu_core_type_desc(inst->core->type), str);
+	call_vop(inst, event_notify, VPU_MSG_ID_FIRMWARE_XCPT, NULL);
+	set_bit(inst->id, &inst->core->hang_mask);
+	vpu_notify_codec_error(inst);
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
+int vpu_session_handle_msg(struct vpu_inst *inst, struct vpu_rpc_event *msg)
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
+	inst_dbg(inst, LVL_EVT, "receive event(%d)\n", msg_id);
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
+void vpu_inst_handle_msg(struct vpu_inst *inst, struct vpu_rpc_event *pkt)
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
+int vpu_handle_msg(struct vpu_core *core)
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
+int vpu_isr_thread(struct vpu_core *core, u32 irq_code)
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
diff --git a/drivers/media/platform/imx/vpu-8q/vpu_msgs.h b/drivers/media/platform/imx/vpu-8q/vpu_msgs.h
new file mode 100644
index 000000000000..4bcf7be34097
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/vpu_msgs.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef _IMX_VPU_MSGS_H
+#define _IMX_VPU_MSGS_H
+
+int vpu_isr(struct vpu_core *core, u32 irq);
+void vpu_inst_run_work(struct work_struct *work);
+void vpu_msg_run_work(struct work_struct *work);
+void vpu_msg_delayed_work(struct work_struct *work);
+
+#endif
-- 
2.32.0

