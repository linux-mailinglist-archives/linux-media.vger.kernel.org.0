Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6B174BD5D6
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 07:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345078AbiBUGNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 01:13:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345031AbiBUGMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 01:12:36 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F4A13E22;
        Sun, 20 Feb 2022 22:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOEohcrxTQB05ITDTF00sblqLikjL8E+kQjXnFjticXnvrKwtxwTYqvxRvdvwL0NOZX1f2ia+7YZiaXugV401YLC1jHVm49lScTFTJ1r6hdTNQshkJqzu+al0Q9PJiPmDr6Qf3Dh/eBy6lMlQIejjUlM6386/xVqVB9G0OF5vffOEQdQHKQjDJxyHk1hKICcwcDU26WCNOU9VWiz2bloAR+GGx0HFUFiO6JZj4WbqbMc98VusS/VnlPmk/u4tMOc+VW9pX9mqzi1NTpE/OB7gvyD/eydIw2bTkRHVAUimqfb+j+vOJ7wqTuXTS9iPszW+pv9DgJdfWhaF9q1DGvd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scNX2LLawCMpJHWQTPAVmoEOJ3FlwHDuYLvU45mQFK4=;
 b=bGG4fTOXlBZ8Pb4pgRrcuAstip66/5LoUJSuojPl2B0hMBkwnuKTifurmje4VHqT/sRUadYcXWDuv0ljiYQAbM0yJDR4egojQuXFx3WpSQJ/BuuH9Vw/T7TP0+r9yIzY2wTo/yqdvB46Dcf6ZmHfaH3+u2T9UmetoofptkekvitDfxb1Pk0hkmQts4fekxl78qoT2LdkuFhNHEl5odCSSFSys2JlOGM8tZHnEWfqFwIxIICJGdWOzMRAHQfFpfnWJEqBaYpfhJVYVvyiyt+k8nbmsCQ/00qNebmb22ZLvNGKEjoSarCpOi+AY31KJ42T7vCRaW9jcJk0I9NGtKGosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scNX2LLawCMpJHWQTPAVmoEOJ3FlwHDuYLvU45mQFK4=;
 b=BRW5aXsxwbj5S5VbARpRdc5QzOAKv0we8KAWQ2Yzry49Iykav7S22D5d2jcVNUNDCbGGdtjjjo7tRmo3UOIZE9fYpsyo+QV+jVybrHbFOyQYRiLmLcDLkaZY2kq8e7qVuqeSuUgHGoRoUYvTUl9Uk4KJ0qtQbFMxm+mf6c1tE7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 06:12:01 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967%5]) with mapi id 15.20.4995.026; Mon, 21 Feb 2022
 06:12:01 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v16 09/13] media: amphion: implement windsor encoder rpc interface
Date:   Mon, 21 Feb 2022 14:10:28 +0800
Message-Id: <2c3979eca835fe528b0ca60aa35aeaa0de6f474e.1645422822.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1645422822.git.ming.qian@nxp.com>
References: <cover.1645422822.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67bf4a00-2214-4200-a19d-08d9f50112db
X-MS-TrafficTypeDiagnostic: PR3PR04MB7322:EE_
X-Microsoft-Antispam-PRVS: <PR3PR04MB732218398A69EB485A5BF42EE73A9@PR3PR04MB7322.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Fp6CT3ov4d8/19Bc0mJKIaUUyjyPNMPFGZ+d2JcdyB1Yrfn46uZtgCE0PRxSVtlXj3eA5wJus9uKhhX+/QW89o9ObvpSxxIlYYdLpX7sZxlnsV1ad+Tn+G7DofmD3vx15dmIBxIUOGeMsEh/3AIUq9Xin8WtfnVr3mQsS7wA68XuB+3wXfTb18kYLKMRReBiuQ7ZWzFWJoH6KY6Mo5hvXtG2FslgHQnOlScovPwWgfUWiGclGdXPUMOnqK2wgQ03dpdGkamtKu/A3kB762Jkz50fdzvMmCt6yoZi7RTucfNbggq20eufIhCjlcxqc/SBrIhaif1qEQModzWsMWNsILh8ioI1fk+UKI6hmQ1O3eXE3RKNmBlL5JnUjlv9rDgydZJG07PhlPdZwz7KLGUHhgWlLx/fywab9zCuVkgsKc8Yy6mdMxXYXi+5Ni0ccuTUlcmAxIK0Pl42f3rBw7jsMBkW0XSvzDrGUCs+MgMqyh8OeI7lwnqEa/m6v2fjUid4vTCqd9anADTk97Jr3VKy413mLcmHTFYLXD4D7UnYpjAY97cdWw/ONLxoD+ieSh8KiXedWafiL5PsUCIj4ylfTgxQBV6KBdM8+/4qiU/ltocFodlDXlKUaORnwgU2nXySSN8CD5MnRjeT8tgZEMQ1xmrRGPy1b+wxiRXgzCC4jrhIB+y5mzpXb/sow2A14bU74+6Lw+E3dpisujSXSB6Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(83380400001)(66946007)(66556008)(36756003)(44832011)(26005)(186003)(2906002)(30864003)(508600001)(316002)(86362001)(7416002)(5660300002)(38350700002)(38100700002)(8936002)(2616005)(4326008)(52116002)(8676002)(6666004)(6506007)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GvCCF9jUEaEJ8HT3RIjjf+CGDDtL5V/A/zgHbQ3opf93IRgbRqzzHyIdh8Vh?=
 =?us-ascii?Q?YMw2P7TOpSeWh6hmzYp2ClB2UqN40bh/eCB0dSzUis3Eq5GllKnfqmV697Qh?=
 =?us-ascii?Q?zVgB2h3RCx54MTmdlBuHEzryBERlXueCG7etpzJABtd9y+ZszQCue+U1zy09?=
 =?us-ascii?Q?+xjphcNfxG83ykuQBAhm9ZGQFIHTCf38jAqCMcR3vHlyu9Jgq3KxCEc4Cv5Y?=
 =?us-ascii?Q?RjojlUjIbROjj7FODtQ2W1rmZZaHp/9rxdaDaWUSw0wvV9GQZe2J8fEu4fDW?=
 =?us-ascii?Q?TXThkco3Dwdy9E4AHIxnFMNvhAUv9BcqBNlRg81Ga2bnvQkQJlhjsSx7QY75?=
 =?us-ascii?Q?q8PLBtAos9oDsHz8cMT8LQhf5NT0ZN4cEpRwh1/t0/ffLoxqjy4udoITwMic?=
 =?us-ascii?Q?sBCwVQA1nHId4cx8nk+ihWAWuMPIguvEfVPe+fpgKJgUO5iMBSxVs7J9W9E7?=
 =?us-ascii?Q?zgxeRXZ49c4BfZQs8VQ+ehNep4VGnV0qqolPww2nTyFhG8NFvjjc7noyaAjE?=
 =?us-ascii?Q?jyL+8zKTXBRMZhPdhv9nO+GLEex974DxjzgTe41f1KtLj0Q53GKNreBj5vt0?=
 =?us-ascii?Q?O68oVMriaCOtIskRGUMHvkzH7dWhMs6go3cJ6uw1UDzbYxQNUwYXirXrjajz?=
 =?us-ascii?Q?BcmtKJC/1Zx3HzrP7H4BnqtGnQ7eYE2rGB1ilqFrpuLB9TdDZ4SHQqKTj8dU?=
 =?us-ascii?Q?mwncWjpBCUM1J3zqAwVp7Pe8DNsiowXM64LptmADMmmAqEeE6pAbGsab1U22?=
 =?us-ascii?Q?N+GmuVNmcXUDi7tts9hiB980IyL5tAg85coSt3KG0N7LJpDgSJjFpyJwv1Kj?=
 =?us-ascii?Q?GFoCQ5d/zFEDhP7CwdIi28ydVaEiKMVb/x72HQ8wk+XxYoSoWANWgbz/3s13?=
 =?us-ascii?Q?tr7PsH0EDICCt2IHKxPbBV1oinAWDjmZ5VFDiN4Buthj7hIX3N79KcQLR5wx?=
 =?us-ascii?Q?oTmvZ5/syOBoM3m9dsv440jcS9D4p4MIdrSpDJo2TWZH+xsp3vB4WWQQBEWY?=
 =?us-ascii?Q?6co1bjnw7v2nFZ3TL93h7iCqOrNGS9A3mHGS6kgzsqeJKdp6FlB7NGOGCClQ?=
 =?us-ascii?Q?G6eN9B5mfTZYwWo+KjT6UVeNmEiAPfaSu+vGzaehVGPHo/ym3ZnXtdNjRB8k?=
 =?us-ascii?Q?L0fulSHXDT8MxwSngddz5BoVEjUuTQ6Dlc9ralqGfMg86sfHhfkJ3D7AM5cD?=
 =?us-ascii?Q?7a/pZNcaPVIEJNkhvILkQ1B+MqEqXcpdd7hAs5fx0vekKipY9QfAeu18j4IC?=
 =?us-ascii?Q?ZZ39Xn3lpQMJT0yPjQ5qHK0+6oKAo59KJkUlFCM93bePWKYbzXGuA048MoOz?=
 =?us-ascii?Q?/sZVKeDaDoTQtB7/e/eS9gH9kTZL10PJhJYEY1GG7SxapCz/9mDDerryaFgJ?=
 =?us-ascii?Q?7Q27E1AD/j4Y6k6DAebciPx7evxuiWstgGbPV3kuc6oDovGFX+c18QWZI+gd?=
 =?us-ascii?Q?yhtYn35z/k7TVbVkBluF528eVWs1rWzidE1051VsXqSNC5iB74puVB4S9UVK?=
 =?us-ascii?Q?BfNb5kk25H348liMYql93ZzzJkFWGwlCJ87lINq3y4rE6LwsEQfGQEAGeevi?=
 =?us-ascii?Q?qYIpg0BduUdpa7MTrehDObcBIChx1fiyO7cnI5ZJMt3Vxyj6sOEJ99ToVcaU?=
 =?us-ascii?Q?ICZz7eyUL+7FCuMr7N6v4ng=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bf4a00-2214-4200-a19d-08d9f50112db
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 06:12:01.2448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XsbxZ5cbK6XP7uw6jw92mUh6Q1ATGKvkvzufd3+DAGRA7KczG3QKr5nP1Fh6bTK80YwUTzIVNYp8xof1r/kRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This part implements the windsor encoder rpc interface.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/amphion/vpu_windsor.c | 1169 ++++++++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h |   37 +
 2 files changed, 1206 insertions(+)
 create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
 create mode 100644 drivers/media/platform/amphion/vpu_windsor.h

diff --git a/drivers/media/platform/amphion/vpu_windsor.c b/drivers/media/platform/amphion/vpu_windsor.c
new file mode 100644
index 000000000000..e8852dd8535b
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_windsor.c
@@ -0,0 +1,1169 @@
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
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "vpu.h"
+#include "vpu_rpc.h"
+#include "vpu_defs.h"
+#include "vpu_helpers.h"
+#include "vpu_cmds.h"
+#include "vpu_v4l2.h"
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
+					     u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].yuv_desc;
+}
+
+static struct vpu_enc_mem_pool *get_mem_pool(struct vpu_shared_addr *shared,
+					     u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].pool;
+}
+
+static struct vpu_rpc_buffer_desc *get_stream_buf_desc(struct vpu_shared_addr *shared,
+						       u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].stream_desc;
+}
+
+static struct vpu_enc_expert_mode_param *get_expert_param(struct vpu_shared_addr *shared,
+							  u32 instance)
+{
+	struct vpu_enc_host_ctrls *hcs = shared->priv;
+
+	return hcs->ctrls[instance].expert;
+}
+
+static struct vpu_enc_param *get_enc_param(struct vpu_shared_addr *shared, u32 instance)
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
+			  struct vpu_buffer *rpc, dma_addr_t boot_addr)
+{
+	unsigned long base_phy_addr;
+	unsigned long phy_addr;
+	unsigned long offset;
+	struct windsor_iface *iface;
+	struct windsor_ctrl_iface *ctrl;
+	struct vpu_enc_host_ctrls *hcs;
+	unsigned int i;
+
+	if (rpc->phys < boot_addr)
+		return;
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
+void vpu_windsor_set_log_buf(struct vpu_shared_addr *shared, struct vpu_buffer *log)
+{
+	struct windsor_iface *iface = shared->iface;
+
+	iface->log_buffer_desc.start =
+	iface->log_buffer_desc.wptr =
+	iface->log_buffer_desc.rptr = log->phys - shared->boot_addr;
+	iface->log_buffer_desc.end = iface->log_buffer_desc.start + log->length;
+}
+
+void vpu_windsor_set_system_cfg(struct vpu_shared_addr *shared,
+				u32 regs_base, void __iomem *regs, u32 core_id)
+{
+	struct windsor_iface *iface = shared->iface;
+	struct vpu_rpc_system_config *config = &iface->system_config;
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
+				      u32 instance,
+				      struct vb2_buffer *vb)
+{
+	struct vpu_enc_yuv_desc *desc;
+	struct vb2_v4l2_buffer *vbuf;
+
+	if (instance >= VID_API_NUM_STREAMS)
+		return -EINVAL;
+
+	desc = get_yuv_desc(shared, instance);
+
+	vbuf = to_vb2_v4l2_buffer(vb);
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
+			    struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	vpu_windsor_fill_yuv_frame(shared, inst->id, vb);
+	return vpu_session_encode_frame(inst, vb->timestamp);
+}
+
+int vpu_windsor_config_memory_resource(struct vpu_shared_addr *shared,
+				       u32 instance,
+				       u32 type,
+				       u32 index,
+				       struct vpu_buffer *buf)
+{
+	struct vpu_enc_mem_pool *pool;
+	struct vpu_enc_memory_resource *res;
+
+	if (instance >= VID_API_NUM_STREAMS)
+		return -EINVAL;
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
+	return 0;
+}
+
+int vpu_windsor_config_stream_buffer(struct vpu_shared_addr *shared,
+				     u32 instance,
+				     struct vpu_buffer *buf)
+{
+	struct vpu_rpc_buffer_desc *desc;
+	struct vpu_enc_expert_mode_param *expert;
+
+	desc = get_stream_buf_desc(shared, instance);
+	expert = get_expert_param(shared, instance);
+
+	desc->start = buf->phys;
+	desc->wptr = buf->phys;
+	desc->rptr = buf->phys;
+	desc->end = buf->phys + buf->length;
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
+int vpu_windsor_update_stream_buffer(struct vpu_shared_addr *shared,
+				     u32 instance, u32 ptr, bool write)
+{
+	struct vpu_rpc_buffer_desc *desc;
+
+	desc = get_stream_buf_desc(shared, instance);
+
+	/*update wptr/rptr after data is written or read*/
+	mb();
+	if (write)
+		desc->wptr = ptr;
+	else
+		desc->rptr = ptr;
+
+	return 0;
+}
+
+int vpu_windsor_get_stream_buffer_desc(struct vpu_shared_addr *shared,
+				       u32 instance, struct vpu_rpc_buffer_desc *desc)
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
+	struct windsor_iface *iface = shared->iface;
+
+	return iface->fw_version;
+}
+
+static int vpu_windsor_set_frame_rate(struct vpu_enc_expert_mode_param *expert,
+				      struct vpu_encode_params *params)
+{
+	expert->config_param.frame_rate_num = params->frame_rate.numerator;
+	expert->config_param.frame_rate_den = params->frame_rate.denominator;
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
+	return 0;
+}
+
+static int vpu_windsor_set_bitrate_mode(struct vpu_enc_param *param, u32 rc_enable, u32 mode)
+{
+	if (!rc_enable)
+		param->bitrate_mode = MEDIAIP_ENC_BITRATE_MODE_CONSTANT_QP;
+	else if (mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+		param->bitrate_mode = MEDIAIP_ENC_BITRATE_MODE_VBR;
+	else
+		param->bitrate_mode = MEDIAIP_ENC_BITRATE_MODE_CBR;
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
+				   struct vpu_encode_params *params)
+{
+	windsor->target_bitrate = vpu_windsor_bitrate(params->bitrate);
+	windsor->min_bitrate = vpu_windsor_bitrate(params->bitrate_min);
+	windsor->max_bitrate = vpu_windsor_bitrate(params->bitrate_max);
+
+	return 0;
+}
+
+static int vpu_windsor_set_qp(struct vpu_enc_expert_mode_param *expert,
+			      struct vpu_encode_params *params)
+{
+	expert->static_param.rate_control_islice_qp = params->i_frame_qp;
+	expert->static_param.rate_control_pslice_qp = params->p_frame_qp;
+	expert->static_param.rate_control_bslice_qp = params->b_frame_qp;
+
+	return 0;
+}
+
+static int vpu_windsor_set_sar(struct vpu_enc_expert_mode_param *expert,
+			       struct vpu_encode_params *params)
+{
+	expert->config_param.h264_aspect_ratio_present = params->sar.enable;
+	if (params->sar.idc == V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED)
+		expert->config_param.aspect_ratio = WINDSOR_H264_EXTENDED_SAR;
+	else
+		expert->config_param.aspect_ratio = params->sar.idc;
+	expert->config_param.h264_aspect_ratio_sar_width = params->sar.width;
+	expert->config_param.h264_aspect_ratio_sar_height = params->sar.height;
+
+	return 0;
+}
+
+static int vpu_windsor_set_color(struct vpu_enc_expert_mode_param *expert,
+				 struct vpu_encode_params *params)
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
+				      u32 instance, struct vpu_encode_params *params)
+{
+	struct vpu_enc_param *windsor;
+	struct vpu_enc_expert_mode_param *expert;
+
+	windsor = get_enc_param(shared, instance);
+	expert = get_expert_param(shared, instance);
+
+	if (windsor->bitrate_mode != MEDIAIP_ENC_BITRATE_MODE_CBR)
+		return 0;
+	if (!params->rc_enable)
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
+				  u32 instance, struct vpu_encode_params *params)
+{
+	struct vpu_enc_param *windsor;
+	int ret;
+
+	windsor = get_enc_param(shared, instance);
+
+	if (params->input_format != V4L2_PIX_FMT_NV12 &&
+	    params->input_format != V4L2_PIX_FMT_NV12M)
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
+	vpu_windsor_set_bitrate_mode(windsor, params->rc_enable, params->rc_mode);
+	vpu_windsor_set_bitrate(windsor, params);
+	windsor->init_slice_qp = params->i_frame_qp;
+
+	if (!params->frame_rate.numerator)
+		return -EINVAL;
+	windsor->frame_rate = params->frame_rate.denominator / params->frame_rate.numerator;
+
+	return 0;
+}
+
+static int vpu_windsor_update_params(struct vpu_shared_addr *shared,
+				     u32 instance, struct vpu_encode_params *params)
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
+				  u32 instance, struct vpu_encode_params *params, u32 update)
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
+	struct windsor_iface *iface = shared->iface;
+
+	return iface->max_streams;
+}
diff --git a/drivers/media/platform/amphion/vpu_windsor.h b/drivers/media/platform/amphion/vpu_windsor.h
new file mode 100644
index 000000000000..3fbb6556dbca
--- /dev/null
+++ b/drivers/media/platform/amphion/vpu_windsor.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#ifndef _AMPHION_VPU_WINDSOR_H
+#define _AMPHION_VPU_WINDSOR_H
+
+u32 vpu_windsor_get_data_size(void);
+void vpu_windsor_init_rpc(struct vpu_shared_addr *shared,
+			  struct vpu_buffer *rpc, dma_addr_t boot_addr);
+void vpu_windsor_set_log_buf(struct vpu_shared_addr *shared, struct vpu_buffer *log);
+void vpu_windsor_set_system_cfg(struct vpu_shared_addr *shared,
+				u32 regs_base, void __iomem *regs, u32 core_id);
+int vpu_windsor_get_stream_buffer_size(struct vpu_shared_addr *shared);
+int vpu_windsor_pack_cmd(struct vpu_rpc_event *pkt, u32 index, u32 id, void *data);
+int vpu_windsor_convert_msg_id(u32 msg_id);
+int vpu_windsor_unpack_msg_data(struct vpu_rpc_event *pkt, void *data);
+int vpu_windsor_config_memory_resource(struct vpu_shared_addr *shared,
+				       u32 instance, u32 type, u32 index,
+				       struct vpu_buffer *buf);
+int vpu_windsor_config_stream_buffer(struct vpu_shared_addr *shared,
+				     u32 instance, struct vpu_buffer *buf);
+int vpu_windsor_update_stream_buffer(struct vpu_shared_addr *shared,
+				     u32 instance, u32 ptr, bool write);
+int vpu_windsor_get_stream_buffer_desc(struct vpu_shared_addr *shared,
+				       u32 instance, struct vpu_rpc_buffer_desc *desc);
+u32 vpu_windsor_get_version(struct vpu_shared_addr *shared);
+int vpu_windsor_set_encode_params(struct vpu_shared_addr *shared,
+				  u32 instance,
+				  struct vpu_encode_params *params,
+				  u32 update);
+int vpu_windsor_input_frame(struct vpu_shared_addr *shared,
+			    struct vpu_inst *inst, struct vb2_buffer *vb);
+u32 vpu_windsor_get_max_instance_count(struct vpu_shared_addr *shared);
+
+#endif
-- 
2.33.0

