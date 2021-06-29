Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620A03B6F44
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhF2IYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:24:49 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:47169
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232544AbhF2IYn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuMRPHu/cXTXDib5g8H9uQ27A9q+zsHdo1zA1Wn12ZTVllsgow8NivLlS/V1IhgYf5YMZS/SOvIPIUqiYo5wDR4sjpyWr+xXQAX2n+1aKIS2lQeNTuBPECE3Jk+KJ9xyqmLAd0rrqTnkA3uROsSgW7x2YBNIQRC+V0FT/Ro1iqHtlzXmf4BXk5A1xFoHSilOKXMO1FfoQcFSIJ8Hqq7Hhl2WQV/qqEUUvFmMxg8maCS2hiwFIQtFod6nsm/rSQNq6+DPl/Qb6fiU80bIdaw4IA2Kq9TOqHMez+xixL6+2zIgaTyLHp+Byzol0qrsg/nP0AHG8r0gVkMFRg8W6djH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F85bB/DcJI3naan2EKQvBBLVOJh8ngox1r3C99/X65A=;
 b=Dz6abaXwCjKfS270l9GKozN3B/LS47FEIMS7Fi0z/cABCWVCtEo65a8QvH1oNbX8PzUoSwOjlmNnvdvBawpOlRSrEhCrNYFGj2YSPlFEumgPzXAn8niAviLtEc8T1z8YmYAVUvpjgrjOu2tM4MdgQLbxp9qpcZJlQlTIEOwZirjdaEj2ttuiJKQ9TLvPWEXTH2UGGp/0qmVhSK1CoKxg6G90TTjZ+4sLyuKSDSXffLz8wvcyoQJDvqz12ouY2iBM9FBQZzlbHncVpL/SFiAMw3OR3eSWgmb7WaumFyoDwrz3UpZdpVD6cgoascFgDM0Y2cN786kauSrMKTLgRvjAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F85bB/DcJI3naan2EKQvBBLVOJh8ngox1r3C99/X65A=;
 b=EtZo4s978wyqCJPq3ztcR/BLkgG6mi/K51bmyvelfJpOCzmULePL07vtzNjc4Fl4w4I3pkj6RDNDiJV6kV1M+srYd24s9GHjrMN6OPQIkwR5bQyDAeuUptSafVZxLCWVnMVs9XG0gEDNgdxmp+M7Mhli4Q7kYurHAnotIHyLfIs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 08:22:07 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:22:07 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 07/13] media: imx: imx8q: add v4l2 m2m vpu encoder stateful driver
Date:   Tue, 29 Jun 2021 16:21:08 +0800
Message-Id: <fbd077f61786cdf805d1c1a964fbdb74102b5f93.1624954576.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624954576.git.ming.qian@nxp.com>
References: <cover.1624954576.git.ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0160.apcprd06.prod.outlook.com
 (2603:1096:1:1e::14) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:22:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a49e1ca0-82a7-4677-75af-08d93ad6fc08
X-MS-TrafficTypeDiagnostic: AM7PR04MB7191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71911802265FFB205487620BE7029@AM7PR04MB7191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BcuRTU8PlUWQaBRgyKd3upDDcjcs63VKAYFImOuXNHwIP9hFmwN/3912xd70yWrc2z8vEH1bvd9XxyFsM55zJ0ODYqyfylaKPz8eVvuJNm41WKsMDcvHCehUinn1lbxNNwOAa5V/WiWOSNgTvARo6kqWZr02GbWGubcm2NjPc/BtWQe+76u9ntH0LvYh+eOdr1Lm8HOANM97KUZ9nXCQPD+sYdWG8+E54qye1kNj/dadaaB75KChknGeHm5Pc8CJ54O8mL5F/exk1YedOa9xYfuKGWj+nzz3f3YgpFW0y9SM5FdaqMmJGHV8UtG9ESR1D3yXww01wTz5ZArAJbPXOQFz550vjSqXxoafwUZV+mOQ6Fl9GjPkmQZQk3xLus8y+zWJ5240Bs/cl+Whc8be9aAMSxS6PhtaIo3SrSO7VcPHKDRVMOxwahY0j2eTSG/iRBylvq/+9nxwlNWEFwTDkdnGTDN7f3SBFgQ36hxBE5SDxZ6kSxe1Yjwoy1PObAeHswGebk3K6ApLWfaq19gcBGqx2A6bE6xQdTOdJp6x+rqfGbbYwsKN7LK3XVtzhevZeSLQOMziCRGwR81J2sM8q0zNv/bOgx3HVHZU0iXAV4G/NCFhqhcFE4BLtSk463IRSbUGf3nmTNu3+ae1g3Z31UqA6o3+Oigkxto+X/CRaOElgYV4QTQkaYNGHoy96YyaJfhFX8BDtOOXvj4kSXTqYIjDH8y5LbfQLdovdkEgs0R2w/Ntn5JTvS3BMaBBOQrpzo2H+FK034ifnWSk+u9LiFwPityXOufF+gGgPuBvrG89FtNYAZFIBr2Co1oZshWQ+yQswbRhtRd7vq5aJ9x1DA2CCUWhmzmgi+lUtWkDx4bkVePvBOUlVPBZoa6I8An
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(86362001)(7696005)(52116002)(7416002)(38350700002)(5660300002)(66946007)(966005)(44832011)(8936002)(4326008)(6486002)(478600001)(66476007)(30864003)(2616005)(316002)(38100700002)(8676002)(956004)(66556008)(36756003)(83380400001)(2906002)(26005)(16526019)(186003)(461764006)(32563001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+PafRetseKP82eu6hit0zEj8vmnUbFuc8YvqBZ3NTyFopV45CUxgz0Pmd23?=
 =?us-ascii?Q?6e9wK7oQnJKBqs+7OdrE9UFvHwhzzqtWdbqVIvMu9HHZ8PUxjUDoo0KD2YoL?=
 =?us-ascii?Q?jXs90CYdKYypC1ynBQwKKORJF7+Gt8R3GkuCIwEA07wepGpOmbXwInssnR59?=
 =?us-ascii?Q?2AKhpi//vC11xm08SpR+EB2b8keq+CycCUDS45/VdnomLWjm9hxzTCVa/lMv?=
 =?us-ascii?Q?gi5TJ+I/iYYBid1Tq4nY0zYdA1eAzPWgIPUG11rZd9tlrcS4lwOj+zWyjQLZ?=
 =?us-ascii?Q?fpkapn1l7FKEXjU5lupMQbZSU5mF2jiYpTVn3H1LtzZqjjJnMMo9RIPdO0ts?=
 =?us-ascii?Q?vh8GYWs/wrMLnghG5XO2lMtrAWkpW7jOLu+OcH4gnvIBeit1v+M7NoBq32di?=
 =?us-ascii?Q?PA5XWzsj+qCVO4GewKYE6nQpFSdB2JQKxPFcQUNwtADXR6lfLGKRU4reMzBz?=
 =?us-ascii?Q?YeDkWnzaAH2ub/QDBRzlVt1eaQkZRPvXLCuZ2K4a4DbWht1ink1GGhu7aYD+?=
 =?us-ascii?Q?AdtAFfmHkLF6oLodh5WrfE+ltxOBiJz/RzxnPYTe1pmdScNhpYIoUwuLTKn6?=
 =?us-ascii?Q?vg4r7eQPB+/PcgRq8XeOiiImPIb4laHBYYiMfUkbE0wgVhBl9LGJDT6Nj5HH?=
 =?us-ascii?Q?Z1LajzS5iYtfWXR+0AwqzPV27ve43L4OPkFJr4S1Hnxbo7DxiucAo7wGOvU7?=
 =?us-ascii?Q?p5tS14IIo+Qx9ayNQ2clUi7/OEH7Vo1mWEjUhccFYvaPQDFOUjBvl+bTO6OI?=
 =?us-ascii?Q?7Gssp0AIVw1G0ubz7YEXeXmVXB02AeSXZgihJA+MXOTIojvDwsWeCV//BYY2?=
 =?us-ascii?Q?zf0lMM5VCGMtVapYuNR/No3fhVydS5jdQzSm9+RvlGi/cmCW3Z6pqgEgN049?=
 =?us-ascii?Q?cbik/0y3RZlAdzoMQ86ytKADTbUXAa6o5cFDsWiKSmV9aLMXY6ksm9qTPXeo?=
 =?us-ascii?Q?A9P/ti1fEuoth0MkidvQsD6btF2YMASwCqlBskLPWLZhamCPegvFgKbVsDC5?=
 =?us-ascii?Q?Enbhbu+sdPyKh2wu/g3dlGiVjbvrlqFMOXqAkMhAtZm9uItjVq9loZSh+WgM?=
 =?us-ascii?Q?3/amNdbuuYyGpUk6+kuoJDXm/xptoP9IkuOe47eeWzn09BXa8HnhmMGrRDZA?=
 =?us-ascii?Q?7lyoIYCgZHpxqkAkHphmsW386rs2M8Cg0moDOXGIa4yRSFM2cdHs42IzYAWF?=
 =?us-ascii?Q?g56zaEBFVjEGIuhGDPkPCUfuzhHySJnsZ7S8Lz2IWz8lMLsNlt3Us55tspHt?=
 =?us-ascii?Q?Qy3AfKUwyDbvXm51i5u6VO2N1axnBetCugEunU9RCdmAf8KF31JOT1qAAYZp?=
 =?us-ascii?Q?eoQLY7gL5Uj9JyidvPjv5LfJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49e1ca0-82a7-4677-75af-08d93ad6fc08
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:22:07.7120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQdyzCV24gXDEB+4YflFwn0Nb9jzijIHnsgh53GePwJsPZr3zBVfSgHozR2kSlOUxTGYdL8FIpgICllRHXkuYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This consists of video encoder implementation plus encoder controls.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/imx/vpu-8q/venc.c | 1411 ++++++++++++++++++++++
 1 file changed, 1411 insertions(+)
 create mode 100644 drivers/media/platform/imx/vpu-8q/venc.c

diff --git a/drivers/media/platform/imx/vpu-8q/venc.c b/drivers/media/platform/imx/vpu-8q/venc.c
new file mode 100644
index 000000000000..32af6ab5202c
--- /dev/null
+++ b/drivers/media/platform/imx/vpu-8q/venc.c
@@ -0,0 +1,1411 @@
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
+#define TAG		"ENC"
+
+#include <linux/init.h>
+#include <linux/interconnect.h>
+#include <linux/ioctl.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/videodev2.h>
+#include <linux/ktime.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+#include <linux/imx_vpu.h>
+#include "vpu.h"
+#include "vpu_defs.h"
+#include "vpu_core.h"
+#include "vpu_helpers.h"
+#include "vpu_v4l2.h"
+#include "vpu_cmds.h"
+#include "vpu_rpc.h"
+#include "vpu_log.h"
+
+#define VENC_OUTPUT_ENABLE	(1 << 0)
+#define VENC_CAPTURE_ENABLE	(1 << 1)
+#define VENC_ENABLE_MASK	(VENC_OUTPUT_ENABLE | VENC_CAPTURE_ENABLE)
+#define VENC_MAX_BUF_CNT	8
+
+struct venc_t {
+	struct vpu_encode_params params;
+	u32 request_key_frame;
+	u32 input_ready;
+	u32 cpb_size;
+	bool bitrate_change;
+
+	struct vpu_buffer enc[VENC_MAX_BUF_CNT];
+	struct vpu_buffer ref[VENC_MAX_BUF_CNT];
+	struct vpu_buffer act[VENC_MAX_BUF_CNT];
+	struct list_head frames;
+	u32 frame_count;
+	u32 encode_count;
+	u32 ready_count;
+	u32 enable;
+	u32 stopped;
+
+	u32 skipped_count;
+	u32 skipped_bytes;
+
+	wait_queue_head_t wq;
+};
+
+struct venc_frame_t {
+	struct list_head list;
+	struct vpu_enc_pic_info info;
+	u32 bytesused;
+	s64 timestamp;
+};
+
+static const struct vpu_format venc_formats[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_NV12,
+		.num_planes = 2,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.flags = V4L2_FMT_FLAG_COMPRESSED
+	},
+	{0, 0, 0, 0},
+};
+
+static int venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "imx vpu encoder", sizeof(cap->driver));
+	strscpy(cap->card, "imx vpu encoder", sizeof(cap->card));
+	strscpy(cap->bus_info, "platform: imx8q-vpu", sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int venc_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	const struct vpu_format *fmt;
+
+	memset(f->reserved, 0, sizeof(f->reserved));
+	fmt = vpu_helper_enum_format(inst, f->type, f->index);
+	if (!fmt)
+		return -EINVAL;
+
+	f->pixelformat = fmt->pixfmt;
+	f->flags = fmt->flags;
+	if (fmt->name && strlen(fmt->name))
+		strscpy(f->description, fmt->name, sizeof(f->description));
+
+	return 0;
+}
+
+static int venc_enum_framesizes(struct file *file, void *fh, struct v4l2_frmsizeenum *fsize)
+{
+	struct vpu_inst *inst = to_inst(file);
+
+	if (!fsize || fsize->index)
+		return -EINVAL;
+
+	if (!vpu_helper_find_format(inst, 0, fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.max_width = inst->core->res->max_width;
+	fsize->stepwise.max_height = inst->core->res->max_height;
+	fsize->stepwise.min_width = inst->core->res->min_width;
+	fsize->stepwise.min_height = inst->core->res->min_height;
+	fsize->stepwise.step_width = inst->core->res->step_width;
+	fsize->stepwise.step_height = inst->core->res->step_height;
+
+	return 0;
+}
+
+static int venc_enum_frameintervals(struct file *file, void *fh, struct v4l2_frmivalenum *fival)
+{
+	struct vpu_inst *inst = to_inst(file);
+
+	if (!fival || fival->index)
+		return -EINVAL;
+
+	if (!vpu_helper_find_format(inst, 0, fival->pixel_format))
+		return -EINVAL;
+
+	if (!fival->width || !fival->height)
+		return -EINVAL;
+
+	if (fival->width < inst->core->res->min_width ||
+		fival->width > inst->core->res->max_width ||
+		fival->height < inst->core->res->min_height ||
+		fival->height > inst->core->res->max_height)
+		return -EINVAL;
+
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
+	fival->stepwise.min.numerator = 1;
+	fival->stepwise.min.denominator = USHRT_MAX;
+	fival->stepwise.max.numerator = USHRT_MAX;
+	fival->stepwise.max.denominator = 1;
+	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.denominator = 1;
+
+	return 0;
+}
+
+static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct venc_t *venc = inst->priv;
+	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	struct vpu_format *cur_fmt;
+	int i;
+
+	cur_fmt = vpu_get_format(inst, f->type);
+
+	pixmp->pixelformat = cur_fmt->pixfmt;
+	pixmp->num_planes = cur_fmt->num_planes;
+	pixmp->width = cur_fmt->width;
+	pixmp->height = cur_fmt->height;
+	pixmp->field = cur_fmt->field;
+	pixmp->flags = cur_fmt->flags;
+	for (i = 0; i < pixmp->num_planes; i++) {
+		pixmp->plane_fmt[i].bytesperline = cur_fmt->bytesperline[i];
+		pixmp->plane_fmt[i].sizeimage = cur_fmt->sizeimage[i];
+	}
+
+	f->fmt.pix_mp.colorspace = venc->params.color.primaries;
+	f->fmt.pix_mp.xfer_func = venc->params.color.transfer;
+	f->fmt.pix_mp.ycbcr_enc = venc->params.color.matrix;
+	f->fmt.pix_mp.quantization = venc->params.color.full_range;
+
+	return 0;
+}
+
+static int venc_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+
+	vpu_try_fmt_common(inst, f);
+
+	return 0;
+}
+
+static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_inst *inst = to_inst(file);
+	const struct vpu_format *fmt;
+	struct vpu_format *cur_fmt;
+	struct vb2_queue *q;
+	struct venc_t *venc = inst->priv;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+	if (vb2_is_streaming(q))
+		return -EBUSY;
+
+	fmt = vpu_try_fmt_common(inst, f);
+	if (!fmt)
+		return -EINVAL;
+
+	cur_fmt = vpu_get_format(inst, f->type);
+
+	cur_fmt->pixfmt = fmt->pixfmt;
+	cur_fmt->num_planes = fmt->num_planes;
+	cur_fmt->type = fmt->type;
+	cur_fmt->flags = fmt->flags;
+	cur_fmt->width = pix_mp->width;
+	cur_fmt->height = pix_mp->height;
+	for (i = 0; i < fmt->num_planes; i++) {
+		cur_fmt->sizeimage[i] = pix_mp->plane_fmt[i].sizeimage;
+		cur_fmt->bytesperline[i] = pix_mp->plane_fmt[i].bytesperline;
+	}
+
+	if (pix_mp->field != V4L2_FIELD_ANY)
+		cur_fmt->field = pix_mp->field;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		venc->params.input_format = cur_fmt->pixfmt;
+		venc->params.src_stride = cur_fmt->bytesperline[0];
+		venc->params.src_width = cur_fmt->width;
+		venc->params.src_height = cur_fmt->height;
+		venc->params.crop.left = 0;
+		venc->params.crop.top = 0;
+		venc->params.crop.width = cur_fmt->width;
+		venc->params.crop.height = cur_fmt->height;
+	} else {
+		venc->params.codec_format = cur_fmt->pixfmt;
+		venc->params.out_width = cur_fmt->width;
+		venc->params.out_height = cur_fmt->height;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		if (!vpu_color_check_primaries(pix_mp->colorspace)) {
+			venc->params.color.primaries = pix_mp->colorspace;
+			vpu_color_get_default(venc->params.color.primaries,
+						&venc->params.color.transfer,
+						&venc->params.color.matrix,
+						&venc->params.color.full_range);
+		}
+		if (!vpu_color_check_transfers(pix_mp->xfer_func))
+			venc->params.color.transfer = pix_mp->xfer_func;
+		if (!vpu_color_check_matrix(pix_mp->ycbcr_enc))
+			venc->params.color.matrix = pix_mp->ycbcr_enc;
+		if (!vpu_color_check_full_range(pix_mp->quantization))
+			venc->params.color.full_range = pix_mp->quantization;
+	}
+
+	pix_mp->colorspace = venc->params.color.primaries;
+	pix_mp->xfer_func = venc->params.color.transfer;
+	pix_mp->ycbcr_enc = venc->params.color.matrix;
+	pix_mp->quantization = venc->params.color.full_range;
+
+	return 0;
+}
+
+static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct venc_t *venc = inst->priv;
+	struct v4l2_fract *timeperframe = &parm->parm.capture.timeperframe;
+
+	if (!parm)
+		return -EINVAL;
+
+	if (!vpu_helper_check_type(inst, parm->type))
+		return -EINVAL;
+
+	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.readbuffers = 0;
+	timeperframe->numerator = venc->params.frame_rate_num;
+	timeperframe->denominator = venc->params.frame_rate_den;
+
+	return 0;
+}
+
+static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct venc_t *venc = inst->priv;
+	struct v4l2_fract *timeperframe = &parm->parm.capture.timeperframe;
+
+	if (!parm)
+		return -EINVAL;
+
+	if (!vpu_helper_check_type(inst, parm->type))
+		return -EINVAL;
+
+	if (!timeperframe->numerator)
+		timeperframe->numerator = venc->params.frame_rate_num;
+	if (!timeperframe->denominator)
+		timeperframe->denominator = venc->params.frame_rate_den;
+
+	venc->params.frame_rate_num = timeperframe->numerator;
+	venc->params.frame_rate_den = timeperframe->denominator;
+
+	vpu_helper_calc_coprime(&venc->params.frame_rate_num,
+				&venc->params.frame_rate_den);
+
+	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	memset(parm->parm.capture.reserved,
+			0, sizeof(parm->parm.capture.reserved));
+
+	return 0;
+}
+
+static int venc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct venc_t *venc = inst->priv;
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->out_format.width;
+		s->r.height = inst->out_format.height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r = venc->params.crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int venc_valid_crop(struct venc_t *venc, struct vpu_core *core)
+{
+	struct v4l2_rect *rect = NULL;
+	u32 min_width;
+	u32 min_height;
+	u32 src_width;
+	u32 src_height;
+
+	rect = &venc->params.crop;
+	min_width = core->res->min_width;
+	min_height = core->res->min_height;
+	src_width = venc->params.src_width;
+	src_height = venc->params.src_height;
+
+	if (rect->width == 0 || rect->height == 0)
+		return -EINVAL;
+	if (rect->left > src_width - min_width ||
+		rect->top > src_height - min_height)
+		return -EINVAL;
+
+	rect->width = min(rect->width, src_width - rect->left);
+	rect->width = max_t(u32, rect->width, min_width);
+
+	rect->height = min(rect->height, src_height - rect->top);
+	rect->height = max_t(u32, rect->height, min_height);
+
+	return 0;
+}
+
+static int venc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_inst *inst = to_inst(file);
+	const struct vpu_core_resources *res = inst->core->res;
+	struct venc_t *venc = inst->priv;
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+	if (s->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	venc->params.crop.left = ALIGN(s->r.left, res->step_width);
+	venc->params.crop.top = ALIGN(s->r.top, res->step_height);
+	venc->params.crop.width = ALIGN(s->r.width, res->step_width);
+	venc->params.crop.height = ALIGN(s->r.height, res->step_height);
+	if (venc_valid_crop(venc, inst->core)) {
+		venc->params.crop.left = 0;
+		venc->params.crop.top = 0;
+		venc->params.crop.width = venc->params.src_width;
+		venc->params.crop.height = venc->params.src_height;
+	}
+
+	inst->crop = venc->params.crop;
+
+	return 0;
+}
+
+static int venc_response_eos(struct vpu_inst *inst)
+{
+	struct venc_t *venc = inst->priv;
+	int ret;
+
+	if (inst->state != VPU_CODEC_STATE_DRAIN)
+		return 0;
+
+	if (v4l2_m2m_num_src_bufs_ready(inst->m2m_ctx))
+		return 0;
+
+	if (!venc->input_ready)
+		return 0;
+
+	venc->input_ready = false;
+	inst_dbg(inst, LVL_FLOW, "stop\n");
+	ret = vpu_session_stop(inst);
+	if (ret)
+		return ret;
+	inst->state = VPU_CODEC_STATE_STOP;
+	wake_up_all(&venc->wq);
+
+	return 0;
+}
+
+static int venc_request_eos(struct vpu_inst *inst)
+{
+	mutex_lock(&inst->lock);
+	inst->state = VPU_CODEC_STATE_DRAIN;
+	venc_response_eos(inst);
+	mutex_unlock(&inst->lock);
+
+	return 0;
+}
+
+static int venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
+{
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
+	if (ret)
+		return ret;
+
+	if (cmd->cmd == V4L2_ENC_CMD_STOP) {
+		struct vpu_inst *inst = to_inst(file);
+
+		if (inst->state == VPU_CODEC_STATE_DEINIT)
+			vpu_notify_eos(inst);
+		else
+			venc_request_eos(inst);
+	}
+
+	return 0;
+}
+
+static int venc_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops venc_ioctl_ops = {
+	.vidioc_querycap               = venc_querycap,
+	.vidioc_enum_fmt_vid_cap       = venc_enum_fmt,
+	.vidioc_enum_fmt_vid_out       = venc_enum_fmt,
+	.vidioc_enum_framesizes        = venc_enum_framesizes,
+	.vidioc_enum_frameintervals    = venc_enum_frameintervals,
+	.vidioc_g_fmt_vid_cap_mplane   = venc_g_fmt,
+	.vidioc_g_fmt_vid_out_mplane   = venc_g_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = venc_try_fmt,
+	.vidioc_try_fmt_vid_out_mplane = venc_try_fmt,
+	.vidioc_s_fmt_vid_cap_mplane   = venc_s_fmt,
+	.vidioc_s_fmt_vid_out_mplane   = venc_s_fmt,
+	.vidioc_g_parm                 = venc_g_parm,
+	.vidioc_s_parm                 = venc_s_parm,
+	.vidioc_g_selection            = venc_g_selection,
+	.vidioc_s_selection            = venc_s_selection,
+	.vidioc_try_encoder_cmd        = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd            = venc_encoder_cmd,
+	.vidioc_subscribe_event        = venc_subscribe_event,
+	.vidioc_unsubscribe_event      = v4l2_event_unsubscribe,
+	.vidioc_reqbufs                = vpu_v4l2_ioctl_reqbufs,
+	.vidioc_querybuf               = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs	       = vpu_v4l2_ioctl_create_bufs,
+	.vidioc_prepare_buf	       = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf                   = vpu_v4l2_ioctl_qbuf,
+	.vidioc_expbuf                 = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf                  = vpu_v4l2_ioctl_dqbuf,
+	.vidioc_streamon               = vpu_v4l2_ioctl_streamon,
+	.vidioc_streamoff              = vpu_v4l2_ioctl_streamoff,
+};
+
+static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_inst *inst = ctrl_to_inst(ctrl);
+	struct venc_t *venc = inst->priv;
+	int ret = 0;
+
+	mutex_lock(&inst->lock);
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		venc->params.profile = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		venc->params.level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		venc->params.rc_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		if (ctrl->val != venc->params.bitrate)
+			venc->bitrate_change = true;
+		venc->params.bitrate = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+		venc->params.gop_length = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		venc->params.bframes = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+		venc->params.i_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+		venc->params.p_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+		venc->params.b_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		venc->request_key_frame = 1;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
+		venc->cpb_size = ctrl->val * 1024;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
+		venc->params.sar.enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+		venc->params.sar.idc = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:
+		venc->params.sar.width = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:
+		venc->params.sar.height = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops venc_ctrl_ops = {
+	.s_ctrl = venc_op_s_ctrl,
+	.g_volatile_ctrl = vpu_helper_g_volatile_ctrl,
+};
+
+static int venc_ctrl_init(struct vpu_inst *inst)
+{
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 20);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+			  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+			0x0,
+			V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+			0x0,
+			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_BITRATE,
+			BITRATE_MIN,
+			BITRATE_MAX,
+			BITRATE_STEP,
+			BITRATE_DEFAULT);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, (1 << 16) - 1, 1, 30);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_B_FRAMES, 0, 4, 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP, 1, 51, 1, 26);
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP, 1, 51, 1, 28);
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP, 1, 51, 1, 30);
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
+	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 2);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE, 64, 10240, 1, 1024);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE, 0, 1, 1, 1);
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC,
+			V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED,
+			0x0,
+			V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1);
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH,
+			0, USHRT_MAX, 1, 1);
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT,
+			0, USHRT_MAX, 1, 1);
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_HEADER_MODE,
+			V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+			~(1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+			V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);
+
+	ret = v4l2_ctrl_handler_setup(&inst->ctrl_handler);
+	if (ret) {
+		inst_err(inst, "setup ctrls fail, ret = %d\n", ret);
+		v4l2_ctrl_handler_free(&inst->ctrl_handler);
+		return ret;
+	}
+
+	return 0;
+}
+
+static bool venc_check_ready(struct vpu_inst *inst, unsigned int type)
+{
+	struct venc_t *venc = inst->priv;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		if (vpu_helper_get_free_space(inst) < venc->cpb_size)
+			return false;
+		return venc->input_ready;
+	}
+
+	return true;
+}
+
+static u32 venc_get_enable_mask(u32 type)
+{
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return VENC_OUTPUT_ENABLE;
+	else
+		return VENC_CAPTURE_ENABLE;
+}
+
+static void venc_set_enable(struct venc_t *venc, u32 type, int enable)
+{
+	u32 mask = venc_get_enable_mask(type);
+
+	if (enable)
+		venc->enable |= mask;
+	else
+		venc->enable &= ~mask;
+}
+
+static u32 venc_get_enable(struct venc_t *venc, u32 type)
+{
+	return venc->enable & venc_get_enable_mask(type);
+}
+
+static void venc_input_done(struct vpu_inst *inst)
+{
+	struct venc_t *venc = inst->priv;
+
+	mutex_lock(&inst->lock);
+	venc->input_ready = true;
+	vpu_process_output_buffer(inst);
+	venc_response_eos(inst);
+	mutex_unlock(&inst->lock);
+}
+
+/*
+ * It's hardware limitation, that there may be several bytes
+ * redundant data at the beginning of frame.
+ * For android platform, the redundant data may cause cts test fail
+ * So driver will strip them
+ */
+static int venc_precheck_encoded_frame(struct vpu_inst *inst, struct venc_frame_t *frame)
+{
+	struct venc_t *venc;
+	int skipped;
+
+	if (!inst || !frame || !frame->bytesused)
+		return -EINVAL;
+
+	venc = inst->priv;
+	skipped = vpu_helper_find_startcode(&inst->stream_buffer,
+				inst->cap_format.pixfmt,
+				frame->info.wptr - inst->stream_buffer.phys,
+				frame->bytesused);
+	if (skipped > 0) {
+		frame->bytesused -= skipped;
+		frame->info.wptr = vpu_helper_step_walk(&inst->stream_buffer,
+						frame->info.wptr, skipped);
+		venc->skipped_bytes += skipped;
+		venc->skipped_count++;
+	}
+
+	return 0;
+}
+
+static int venc_get_one_encoded_frame(struct vpu_inst *inst,
+					struct venc_frame_t *frame,
+					struct vb2_v4l2_buffer *vbuf)
+{
+	struct venc_t *venc = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+
+	if (!vbuf)
+		return -EAGAIN;
+
+	if (!venc_get_enable(inst->priv, vbuf->vb2_buf.type)) {
+		inst_dbg(inst, LVL_DEBUG,
+				"type %d is disabled, frame sequence %d\n",
+				vbuf->vb2_buf.type, frame->info.frame_id);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		return 0;
+	}
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (frame->bytesused > vbuf->vb2_buf.planes[0].length) {
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		return -ENOMEM;
+	}
+
+	venc_precheck_encoded_frame(inst, frame);
+
+	if (frame->bytesused) {
+		u32 rptr = frame->info.wptr;
+		void *dst = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+
+		vpu_helper_copy_from_stream_buffer(&inst->stream_buffer,
+			&rptr, frame->bytesused, dst);
+		vpu_iface_update_stream_buffer(inst, rptr, 0);
+	}
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, frame->bytesused);
+	vbuf->sequence = frame->info.frame_id;
+	vbuf->vb2_buf.timestamp = frame->info.timestamp;
+	vbuf->flags |= frame->info.pic_type;
+	vpu_buf->state = VPU_BUF_STATE_IDLE;
+	inst_dbg(inst, LVL_TS, "[OUTPUT TS]%32lld\n", frame->info.timestamp);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+	venc->ready_count++;
+
+	if (vbuf->flags & V4L2_BUF_FLAG_KEYFRAME)
+		inst_dbg(inst, LVL_DEBUG, "[%d]Iframe\n", frame->info.frame_id);
+
+	return 0;
+}
+
+static int venc_get_encoded_frames(struct vpu_inst *inst)
+{
+	struct venc_t *venc;
+	struct venc_frame_t *frame;
+	struct venc_frame_t *tmp;
+
+	if (!inst || !inst->priv)
+		return -EINVAL;
+
+	venc = inst->priv;
+	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
+		if (venc_get_one_encoded_frame(inst, frame,
+					v4l2_m2m_dst_buf_remove(inst->m2m_ctx)))
+			break;
+		list_del_init(&frame->list);
+		vfree(frame);
+	}
+
+	return 0;
+}
+
+static int venc_frame_encoded(struct vpu_inst *inst, void *arg)
+{
+	struct vpu_enc_pic_info *info = arg;
+	struct venc_frame_t *frame;
+	struct venc_t *venc;
+	int ret = 0;
+
+	if (!inst || !info)
+		return -EINVAL;
+	venc = inst->priv;
+	frame = vzalloc(sizeof(*frame));
+	if (!frame)
+		return -ENOMEM;
+
+	memcpy(&frame->info, info, sizeof(frame->info));
+	frame->bytesused = info->frame_size;
+
+	mutex_lock(&inst->lock);
+	list_add_tail(&frame->list, &venc->frames);
+	venc->encode_count++;
+	venc_get_encoded_frames(inst);
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
+static void venc_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct vpu_vb2_buffer *vpu_buf;
+
+	if (!inst || !frame)
+		return;
+
+	inst_dbg(inst, LVL_DEBUG, "buf done : type = %d, sequence = %d\n",
+			frame->type, frame->sequence);
+
+	mutex_lock(&inst->lock);
+	if (!venc_get_enable(inst->priv, frame->type)) {
+		inst_dbg(inst, LVL_DEBUG,
+				"type %d is disabled, frame sequence %d\n",
+				frame->type, frame->sequence);
+		goto exit;
+	}
+	vbuf = vpu_find_buf_by_sequence(inst, frame->type, frame->sequence);
+	if (!vbuf) {
+		inst_err(inst, "can't find buf: type %d, sequence %d\n",
+				frame->type, frame->sequence);
+		goto exit;
+	}
+
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	vpu_buf->state = VPU_BUF_STATE_IDLE;
+	if (V4L2_TYPE_IS_OUTPUT(frame->type))
+		v4l2_m2m_src_buf_remove_by_buf(inst->m2m_ctx, vbuf);
+	else
+		v4l2_m2m_dst_buf_remove_by_buf(inst->m2m_ctx, vbuf);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+exit:
+	mutex_unlock(&inst->lock);
+}
+
+static int venc_append_empty_frame(struct vpu_inst *inst)
+{
+	struct venc_frame_t *frame;
+	struct venc_t *venc;
+
+	if (!inst || !inst->priv)
+		return -EINVAL;
+
+	venc = inst->priv;
+	frame = vzalloc(sizeof(*frame));
+	if (!frame)
+		return -ENOMEM;
+
+	frame->bytesused = 0;
+	frame->info.pic_type = V4L2_BUF_FLAG_LAST;
+	frame->info.frame_id = inst->sequence;
+
+	mutex_lock(&inst->lock);
+	list_add_tail(&frame->list, &venc->frames);
+	venc_get_encoded_frames(inst);
+	mutex_unlock(&inst->lock);
+
+	return 0;
+}
+
+static void venc_stop_done(struct vpu_inst *inst)
+{
+	struct venc_t *venc = inst->priv;
+
+	inst_dbg(inst, LVL_FLOW, "append empty frame\n");
+	venc_append_empty_frame(inst);
+
+	mutex_lock(&inst->lock);
+	venc->stopped = true;
+	mutex_unlock(&inst->lock);
+
+	wake_up_all(&venc->wq);
+}
+
+static void venc_event_notify(struct vpu_inst *inst, u32 event, void *data)
+{
+}
+
+static void venc_release(struct vpu_inst *inst)
+{
+}
+
+static void venc_cleanup(struct vpu_inst *inst)
+{
+	struct venc_t *venc;
+
+	if (!inst)
+		return;
+
+	venc = inst->priv;
+	if (venc)
+		vfree(venc);
+	inst->priv = NULL;
+	vfree(inst);
+}
+
+static int venc_start_session(struct vpu_inst *inst, u32 type)
+{
+	struct venc_t *venc = inst->priv;
+	int stream_buffer_size;
+	int ret;
+
+	mutex_lock(&inst->lock);
+	venc_set_enable(venc, type, 1);
+	if ((venc->enable & VENC_ENABLE_MASK) != VENC_ENABLE_MASK) {
+		mutex_unlock(&inst->lock);
+		return 0;
+	}
+	mutex_unlock(&inst->lock);
+
+	vpu_iface_init_instance(inst);
+	stream_buffer_size = vpu_iface_get_stream_buffer_size(inst->core);
+	if (stream_buffer_size > 0) {
+		inst->stream_buffer.length = max_t(u32, stream_buffer_size, venc->cpb_size * 3);
+		ret = vpu_alloc_dma(inst->core, &inst->stream_buffer);
+		if (ret)
+			goto error;
+
+		inst->use_stream_buffer = true;
+		vpu_iface_config_stream_buffer(inst, &inst->stream_buffer);
+	}
+
+	ret = vpu_iface_set_encode_params(inst, &venc->params, 0);
+	if (ret)
+		goto error;
+	ret = vpu_session_configure_codec(inst);
+	if (ret)
+		goto error;
+
+	inst->state = VPU_CODEC_STATE_CONFIGURED;
+	/*vpu_iface_config_memory_resource*/
+
+	/*config enc expert mode parameter*/
+	ret = vpu_iface_set_encode_params(inst, &venc->params, 1);
+	if (ret)
+		goto error;
+
+	ret = vpu_session_start(inst);
+	if (ret)
+		goto error;
+	inst->state = VPU_CODEC_STATE_STARTED;
+
+	mutex_lock(&inst->lock);
+	venc->bitrate_change = false;
+	venc->input_ready = true;
+	venc->frame_count = 0;
+	venc->encode_count = 0;
+	venc->ready_count = 0;
+	venc->stopped = false;
+	vpu_process_output_buffer(inst);
+	if (venc->frame_count == 0)
+		inst_err(inst, "there is no input when starting\n");
+	mutex_unlock(&inst->lock);
+
+	return 0;
+error:
+	mutex_lock(&inst->lock);
+	venc_set_enable(venc, type, 0);
+	inst->state = VPU_CODEC_STATE_DEINIT;
+	mutex_unlock(&inst->lock);
+
+	vpu_free_dma(&inst->stream_buffer);
+	return ret;
+}
+
+static void venc_cleanup_mem_resource(struct vpu_inst *inst)
+{
+	struct venc_t *venc;
+	u32 i;
+
+	WARN_ON(!inst || !inst->priv || !inst->core);
+
+	venc = inst->priv;
+
+	for (i = 0; i < ARRAY_SIZE(venc->enc); i++)
+		vpu_free_dma(&venc->enc[i]);
+	for (i = 0; i < ARRAY_SIZE(venc->ref); i++)
+		vpu_free_dma(&venc->ref[i]);
+	for (i = 0; i < ARRAY_SIZE(venc->act); i++)
+		vpu_free_dma(&venc->act[i]);
+}
+
+static void venc_request_mem_resource(struct vpu_inst *inst,
+				u32 enc_frame_size,
+				u32 enc_frame_num,
+				u32 ref_frame_size,
+				u32 ref_frame_num,
+				u32 act_frame_size,
+				u32 act_frame_num)
+{
+	struct venc_t *venc;
+	u32 i;
+	int ret;
+
+	WARN_ON(!inst || !inst->priv || !inst->core);
+
+	venc = inst->priv;
+
+	if (enc_frame_num > ARRAY_SIZE(venc->enc)) {
+		inst_err(inst, "enc num(%d) is out of range\n", enc_frame_num);
+		return;
+	}
+	if (ref_frame_num > ARRAY_SIZE(venc->ref)) {
+		inst_err(inst, "ref num(%d) is out of range\n", ref_frame_num);
+		return;
+	}
+	if (act_frame_num > ARRAY_SIZE(venc->act)) {
+		inst_err(inst, "act num(%d) is out of range\n", act_frame_num);
+		return;
+	}
+
+	for (i = 0; i < enc_frame_num; i++) {
+		venc->enc[i].length = enc_frame_size;
+		ret = vpu_alloc_dma(inst->core, &venc->enc[i]);
+		if (ret) {
+			venc_cleanup_mem_resource(inst);
+			return;
+		}
+	}
+	for (i = 0; i < ref_frame_num; i++) {
+		venc->ref[i].length = ref_frame_size;
+		ret = vpu_alloc_dma(inst->core, &venc->ref[i]);
+		if (ret) {
+			venc_cleanup_mem_resource(inst);
+			return;
+		}
+	}
+	for (i = 0; i < act_frame_num; i++) {
+		venc->act[i].length = act_frame_size;
+		ret = vpu_alloc_reserved_dma(inst->core, &venc->act[i]);
+		if (ret) {
+			venc_cleanup_mem_resource(inst);
+			return;
+		}
+	}
+
+	for (i = 0; i < enc_frame_num; i++)
+		vpu_iface_config_memory_resource(inst, MEM_RES_ENC, i, &venc->enc[i]);
+	for (i = 0; i < ref_frame_num; i++)
+		vpu_iface_config_memory_resource(inst, MEM_RES_REF, i, &venc->ref[i]);
+	for (i = 0; i < act_frame_num; i++)
+		vpu_iface_config_memory_resource(inst, MEM_RES_ACT, i, &venc->act[i]);
+}
+
+static void venc_cleanup_frames(struct venc_t *venc)
+{
+	struct venc_frame_t *frame;
+	struct venc_frame_t *tmp;
+
+	if (!list_empty(&venc->frames))
+		vpu_dbg(LVL_DEBUG, "Warning some encoded frames are dropped\n");
+
+	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
+		list_del_init(&frame->list);
+		vfree(frame);
+	}
+}
+
+static int venc_stop_session(struct vpu_inst *inst, u32 type)
+{
+	struct venc_t *venc = inst->priv;
+
+	mutex_lock(&inst->lock);
+	venc_set_enable(venc, type, 0);
+	if (venc->enable & VENC_ENABLE_MASK) {
+		mutex_unlock(&inst->lock);
+		return 0;
+	}
+	mutex_unlock(&inst->lock);
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT)
+		return 0;
+
+	if (inst->state != VPU_CODEC_STATE_STOP)
+		venc_request_eos(inst);
+
+	if (!wait_event_timeout(venc->wq, venc->stopped, VPU_TIMEOUT)) {
+		set_bit(inst->id, &inst->core->hang_mask);
+		vpu_session_debug(inst);
+	}
+
+	inst->state = VPU_CODEC_STATE_DEINIT;
+
+	mutex_lock(&inst->lock);
+	venc_cleanup_frames(inst->priv);
+	mutex_unlock(&inst->lock);
+
+	vpu_free_dma(&inst->stream_buffer);
+	venc_cleanup_mem_resource(inst);
+
+	return 0;
+}
+
+static int venc_process_output(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct venc_t *venc = inst->priv;
+	struct vb2_v4l2_buffer *vbuf;
+	struct vpu_vb2_buffer *vpu_buf = NULL;
+	u32 flags;
+
+	if (inst->state == VPU_CODEC_STATE_DEINIT)
+		return -EINVAL;
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (inst->state == VPU_CODEC_STATE_STARTED)
+		inst->state = VPU_CODEC_STATE_ACTIVE;
+
+	flags = vbuf->flags;
+	if (venc->request_key_frame) {
+		vbuf->flags |= V4L2_BUF_FLAG_KEYFRAME;
+		venc->request_key_frame = 0;
+	}
+	if (venc->bitrate_change) {
+		vpu_session_update_parameters(inst, &venc->params);
+		venc->bitrate_change = false;
+	}
+	inst_dbg(inst, LVL_TS, "[INPUT  TS]%32lld\n", vb->timestamp);
+	vpu_iface_input_frame(inst, vb);
+	vbuf->flags = flags;
+	venc->input_ready = false;
+	venc->frame_count++;
+	vpu_buf->state = VPU_BUF_STATE_INUSE;
+
+	return 0;
+}
+
+static int venc_process_capture(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct venc_t *venc;
+	struct venc_frame_t *frame = NULL;
+	struct vb2_v4l2_buffer *vbuf;
+	int ret;
+
+	venc = inst->priv;
+	if (list_empty(&venc->frames))
+		return -EINVAL;
+
+	frame = list_first_entry(&venc->frames, struct venc_frame_t, list);
+	vbuf = to_vb2_v4l2_buffer(vb);
+	v4l2_m2m_dst_buf_remove_by_buf(inst->m2m_ctx, vbuf);
+	ret = venc_get_one_encoded_frame(inst, frame, vbuf);
+	if (ret)
+		return ret;
+
+	list_del_init(&frame->list);
+	vfree(frame);
+	return 0;
+}
+
+static int venc_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct venc_t *venc = inst->priv;
+	int num = -1;
+
+	switch (i) {
+	case 0:
+		num = scnprintf(str, size, "profile = %d\n", venc->params.profile);
+		break;
+	case 1:
+		num = scnprintf(str, size, "level = %d\n", venc->params.level);
+		break;
+	case 2:
+		num = scnprintf(str, size, "fps = %d/%d\n",
+				venc->params.frame_rate_num,
+				venc->params.frame_rate_den);
+		break;
+	case 3:
+		num = scnprintf(str, size, "%d x %d -> %d x %d\n",
+				venc->params.src_width,
+				venc->params.src_height,
+				venc->params.out_width,
+				venc->params.out_height);
+		break;
+	case 4:
+		num = scnprintf(str, size, "(%d, %d)  %d x %d\n",
+				venc->params.crop.left,
+				venc->params.crop.top,
+				venc->params.crop.width,
+				venc->params.crop.height);
+		break;
+	case 5:
+		num = scnprintf(str, size,
+				"enable = 0x%x, input = %d, encode = %d, ready = %d, stopped = %d\n",
+				venc->enable,
+				venc->frame_count, venc->encode_count,
+				venc->ready_count,
+				venc->stopped);
+		break;
+	case 6:
+		num = scnprintf(str, size, "gop = %d\n", venc->params.gop_length);
+		break;
+	case 7:
+		num = scnprintf(str, size, "bframes = %d\n", venc->params.bframes);
+		break;
+	case 8:
+		num = scnprintf(str, size, "rc: mode = %d, bitrate = %d, qp = %d\n",
+				venc->params.rc_mode,
+				venc->params.bitrate,
+				venc->params.i_frame_qp);
+		break;
+	case 9:
+		num = scnprintf(str, size, "sar: enable = %d, idc = %d, %d x %d\n",
+				venc->params.sar.enable,
+				venc->params.sar.idc,
+				venc->params.sar.width,
+				venc->params.sar.height);
+
+		break;
+	case 10:
+		num = scnprintf(str, size,
+				"colorspace: primaries = %d, transfer = %d, matrix = %d, full_range = %d\n",
+				venc->params.color.primaries,
+				venc->params.color.transfer,
+				venc->params.color.matrix,
+				venc->params.color.full_range);
+		break;
+	case 11:
+		num = scnprintf(str, size, "skipped: count = %d, bytes = %d\n",
+				venc->skipped_count, venc->skipped_bytes);
+		break;
+	default:
+		break;
+	}
+
+	return num;
+}
+
+static struct vpu_inst_ops venc_inst_ops = {
+	.ctrl_init = venc_ctrl_init,
+	.check_ready = venc_check_ready,
+	.input_done = venc_input_done,
+	.get_one_frame = venc_frame_encoded,
+	.buf_done = venc_buf_done,
+	.stop_done = venc_stop_done,
+	.event_notify = venc_event_notify,
+	.release = venc_release,
+	.cleanup = venc_cleanup,
+	.start = venc_start_session,
+	.mem_request = venc_request_mem_resource,
+	.stop = venc_stop_session,
+	.process_output = venc_process_output,
+	.process_capture = venc_process_capture,
+	.get_debug_info = venc_get_debug_info,
+};
+
+static void venc_init(struct file *file)
+{
+	struct vpu_inst *inst = to_inst(file);
+	struct venc_t *venc;
+	struct v4l2_format f;
+	struct v4l2_streamparm parm;
+
+	venc = inst->priv;
+	venc->params.qp_min = 1;
+	venc->params.qp_max = 51;
+	venc->params.qp_min_i = 1;
+	venc->params.qp_max_i = 51;
+	venc->params.bitrate_max = BITRATE_MAX;
+	venc->params.bitrate_min = BITRATE_MIN;
+
+	memset(&f, 0, sizeof(f));
+	f.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
+	f.fmt.pix_mp.width = 1280;
+	f.fmt.pix_mp.height = 720;
+	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f.fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+	venc_s_fmt(file, &inst->fh, &f);
+
+	memset(&f, 0, sizeof(f));
+	f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
+	f.fmt.pix_mp.width = 1280;
+	f.fmt.pix_mp.height = 720;
+	f.fmt.pix_mp.field = V4L2_FIELD_NONE;
+	venc_s_fmt(file, &inst->fh, &f);
+
+	memset(&parm, 0, sizeof(parm));
+	parm.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	parm.parm.capture.timeperframe.numerator = 1;
+	parm.parm.capture.timeperframe.denominator = 30;
+	venc_s_parm(file, &inst->fh, &parm);
+}
+
+int venc_open(struct file *file)
+{
+	struct vpu_inst *inst;
+	struct venc_t *venc;
+	int ret;
+
+	inst = vzalloc(sizeof(*inst));
+	if (!inst)
+		return -ENOMEM;
+
+	venc = vzalloc(sizeof(*venc));
+	if (!venc) {
+		vfree(inst);
+		return -ENOMEM;
+	}
+
+	inst->ops = &venc_inst_ops;
+	inst->formats = venc_formats;
+	inst->type = VPU_CORE_TYPE_ENC;
+	inst->priv = venc;
+	INIT_LIST_HEAD(&venc->frames);
+	init_waitqueue_head(&venc->wq);
+
+	ret = vpu_v4l2_open(file, inst);
+	if (ret) {
+		vfree(venc);
+		vfree(inst);
+		return ret;
+	}
+
+	venc_init(file);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations venc_fops = {
+	.owner = THIS_MODULE,
+	.open = venc_open,
+	.release = vpu_v4l2_close,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = v4l2_m2m_fop_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+int venc_create_video_device(struct vpu_dev *vpu)
+{
+	struct video_device *venc;
+	int ret;
+
+	if (!vpu)
+		return -EINVAL;
+
+	if (vpu->vdev_enc)
+		return 0;
+
+	venc = video_device_alloc();
+	if (!venc) {
+		vpu_err("alloc vpu encoder video device fail\n");
+		return -ENOMEM;
+	}
+	strscpy(venc->name, "imx-vpu-encoder", sizeof(venc->name));
+	venc->release = video_device_release;
+	venc->fops = &venc_fops;
+	venc->ioctl_ops = &venc_ioctl_ops;
+	venc->vfl_dir = VFL_DIR_M2M;
+	venc->v4l2_dev = &vpu->v4l2_dev;
+	venc->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+
+	ret = video_register_device(venc, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		video_device_release(venc);
+		return ret;
+	}
+	video_set_drvdata(venc, vpu);
+	vpu->vdev_enc = venc;
+
+	return 0;
+}
-- 
2.31.1

