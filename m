Return-Path: <linux-media+bounces-14728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E492B248
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C552827F6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B59015358F;
	Tue,  9 Jul 2024 08:39:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774F12C481;
	Tue,  9 Jul 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514397; cv=fail; b=hcs+JBMwnP2dpZe+5cwww5JL93EE9Tm7phr1V068HH9yQz6sekKdjJnr+qa8AnDCgErdZvlj3ejyLTzZxryTSUKfUJsd+g8anLqOXoyy0xpWDDiFzdrlF5O8IlvGv3Q4tCQBZ0vjMOhgyd9h8VtVSNeELh3dGpdMWZxksJrN250=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514397; c=relaxed/simple;
	bh=+SiXIlS9xRgB9Uk+id65QRQQdN+77i/KJd0PUD00/po=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ey913yDaGDRQ0p74oN/P9ryVge8nTQFrT1BRHyGclSXAWqlbnAikasewl0tgsiNmODKgQ0Upq8LjIlg/cRj/cwp8Ka3lT5lVBZ+qtS5s6DdvgImaU6JwSltcIbFwpV1U858WYoS033uJclyAt/AcjxS2pEYjWgNtkwd1nC2WsS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noKlIMq/mkW7K59zaVmUpg6NuBcST31y9AhUQonKFYdJyrQJvl7+ZKJCH6qVSmcR0f20OZxCZPGINtRhtHLAtgePWLEInV3rvu5xEO17sSHoBc6f8O26rKqsmq1miq57YeKEZDcuB7yH2BFXdJ6q/NwPGQRXfQkLYxT3b2ZS0Sm4AZf0yJqyZhkFhs+0zzRva4nSTc9APuVwtLhMy6ofLnMh0FqwdMFCZYn6BD/a3iisc+P8g4lV3gQ8U5mBdptitagoFIOtBP5py+YtBcwK5HuygcmH45ATukrdJW1UyVtQ0b3dnbCXCO5ltHLaOm2nFAKDi99LC544K4YPHH3rdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpNDGY9Z69KwGD7XfHtTW7NF/LKZHWPGrDb6RfSKDWM=;
 b=DgnXnjfBFS3JwrLccme1eZm2rrepRMqoVl8uYnCiKdODICiol1jfSe1hV1pk/lAz8jHi2+95HgWCGADGoep6KhjLMPFgIAXQ0m5IBhX5eIAT+E8lilxI/m+331CKwfLVgJ2MDKq96NusaCONxMmXg2wY6+9fwApyR68p7J/rqnxppAZL/t7dLLsufvP6RVSf5hA4nyGGfjhPgq0KoEcRLuiN1cUuSOywdM58qXnotWlhbffnSUZ9EgQ5yq9Jsgw/37a9XU0IAt2Q10IMPRX0mbJpCjH2UwoztDNgZs6qL1phC2xYTlfUPJ3ALOl6gQioXqRI72/shTEj0OQnofFoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:40 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:40 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 07/14] staging: media: starfive: Separate ISP hardware from capture device
Date: Tue,  9 Jul 2024 01:38:17 -0700
Message-Id: <20240709083824.430473-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f43d708-b2ac-4d77-f33a-08dc9ff28896
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	RCVKTpWi+KW/w9jMwth9c4mTBzogbErcY6ZA9BXT6oLUnm20OS8h9h+zfX3MyE6WA0rmb94CsM2GPPGQO1PLm01cFuVWGpdqhx1ZiyznrnFex/1GrNf8sGC0c7DlRI7mjGqWGFHhDNwR3MHz6vexcQVZnUxkZm0MD7998+FALHXZo3k/B6wnIA312016I3QNwKfj4rEjRCpoqn6/cob8WvWPcvWrfFYEGCrsK/yZW2MpQau+f98V+UTypw+SLdqwncV8zLidQ4WPV22trsNN6GAqfLUqmwAvlQ72aV0zUdT2SfetwtPNBTCCTcP1ZxygOrl2BYucZ6z/PiPbdnycnGWU9cvIGGtjfC3FPzCpwMHhxJnVjk4kVi96ZtZmSGrypLWtCdafUIgys/gjcsLGNECi6dgQo7KilOvez3wKWKndmUA/4ovWstntHnNeqV3mpZalednqTfBhv9vm7OsKmNQRqwViwKq20nkleGnL2vxrKQ1r0T6TnZnFJjg6goMuUrx7cyhkzAnCxMSh6MUNMF/DImxRjl4qOFB0Z1NGYYMI6I9jApYHxG8efRfMeV+8uEmlIKVqQkJCF139IiFLA4rtn3/VNSqm8Z47rJqV9EufI4gLv9151ZTBouQuIjMl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l6E1Gca6BcZChFlrGbhSrmTmPJmrDROg6UpSlafmrABkuEJdXJoDj39TBH8j?=
 =?us-ascii?Q?NnipnL4AQgwmPHrv0MXUOAN0e2AL5lBYxEX/haQpNp9hddkyDr8+dODJOqQD?=
 =?us-ascii?Q?eAGReZFIMrZO3d4ARUpg40l8CTEiEmW927aE+PXGt7t9kK/5Dc71jJlv22eY?=
 =?us-ascii?Q?ESLepMaFDiSiDPg91SAzbN9XVqeuztOgyuKiOnqncxICL7GZAJ7bzzfNt9xk?=
 =?us-ascii?Q?3eoe8gZJ3/Nkzh4rKwJ83mTIfKR78oCZGpuzUJ+JD5hNomESnMdb/W7kPHrz?=
 =?us-ascii?Q?Urw1BHP4JAbNGJn0AmJDafk9tt3YR5971+jcq2sY1NiGoNzEO5uWWcVmMoWj?=
 =?us-ascii?Q?kl2PibB9Mx/6YXHqJen/kpYyoobonboWgMxMgVehXYBBlyzgGXz0vvCmXVKk?=
 =?us-ascii?Q?4J+1APRaE3FCgMFPvEOjFOg8qRGKfgVdh90MslyK2ID2p/AjUIfuje0ZhoMj?=
 =?us-ascii?Q?sc3BJe2RvUY1GlX+WPF0KLpj67HSe4T+SxENtKPpb7/qO53GBpDpuSgpp7nD?=
 =?us-ascii?Q?h9K8aW7UcaybXr+2ij++aA+5XynaiiScT2bphIqIEq5fBepDH/j34i+ZNOcz?=
 =?us-ascii?Q?yewLnBSiuVPqNXCHwPG33KLZ8UyyCge59SIroUsivJHsXq/ZYSJgdBUkO6UO?=
 =?us-ascii?Q?lzz0S5ad4Uj+56gtHNYQqdpxZKJRa6Nmk6OacOj/+5BISABLw8ZnNDTjdcUA?=
 =?us-ascii?Q?nfPuS0mqmO2Pq6fEaDd1o+3vPu2IvwjzlFNn1q/tRw8wjQSd+MtF8d58hJ64?=
 =?us-ascii?Q?FwZnfpg4o0l1m4qY9JHW9JnI27CuQoaK2aQh4Yg/jjSA9JQSoTLfgHlWqPfk?=
 =?us-ascii?Q?fMN3kJPD1xvFEHnwz0B1xmtQYB+LpeLtM+sPYYSd2OUWKllluFqG7PHuELvw?=
 =?us-ascii?Q?2UbSwMumg6uSj4zRDJkWkcVgZEb1Lkmleu5JPPX5/XLXpiT2JuYzLYwBJhIe?=
 =?us-ascii?Q?h9URZ9pCyYtdcYlW6mZjSVVPKXkkG6N20+Sy2Zp3oTLYJ4eZZwCSXWeJBd0q?=
 =?us-ascii?Q?moGzUyhRn8Y4RiPrrFQTIzpZXMxY0wlm0slFkSBIdI+lg0L5577UNydVsIpl?=
 =?us-ascii?Q?0/Hh+e55sxuniXcJX9Dojxijjm2MQgCRvnFVh0VFjg3hF/AmJHzrolWee939?=
 =?us-ascii?Q?WQOM6Jm+4ysfyixtag8UkyJspV5EqZFRnAmEZjC7OZKlIMgv5Sbv5ugiwg7y?=
 =?us-ascii?Q?E8jWScEzrS7Y2moX9L/w0zZOVqhI2z2Ia7Y7XqNsTBA/Rxpj2ypelgJmSOp2?=
 =?us-ascii?Q?/B4fxEJX+ufKPaHgSXQHstCPp7XfHX0GmbcfOL0ZoMT0AfcAM392kaFvi6sr?=
 =?us-ascii?Q?w7B+ftD0Fmts1YHAbnkhX+e/Ep3IotwRBz1SQd88xae2kpWlhHSNoUAbmBXx?=
 =?us-ascii?Q?rq0L+fdWVg3p2JRgQ4s7z4tcKkZQB+U4anLMq0EycXd4xM7jdVSc8Dlbx0GR?=
 =?us-ascii?Q?q2ufyUgws02jYWCJ/juqQUzuqeY3AtPdIlDG9wxGYEYRPH+lDZnzs8BJ7a62?=
 =?us-ascii?Q?kGAKPDCmlpa9jY9QIQZgTE10fW8FRkm0BwEhUwBPVZ0bjsXRZz2Ra11jcV/s?=
 =?us-ascii?Q?PwQOe2ZzY2TvQeBWQK2V9fCrG2zead5SJEAZGFDeSbBJUaujboTvxF37bJ/5?=
 =?us-ascii?Q?NSVsEEn0rM6BdObv+gV4HLY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f43d708-b2ac-4d77-f33a-08dc9ff28896
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:40.3633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vK+3cnyHMDMQDkB1/sKfHzTEY+wXyfZR+VIG2QsG3THb3f+S9bl19ZaYrCiNptSLS4OfaWOr1P3nRSOjSVBzUX2fFDF2xV2LcOWRYmvnA+sMuK57Lz0Dn9+lH1NBtBgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Some ISP hardware operations also used for output device, so separate
them from capture device, move them to ISP common file.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../media/starfive/camss/stf-capture.c        | 60 -------------------
 .../media/starfive/camss/stf-isp-hw-ops.c     | 60 +++++++++++++++++++
 .../staging/media/starfive/camss/stf-isp.h    |  3 +
 3 files changed, 63 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
index 696d79920713..75f6ef405e61 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -66,13 +66,6 @@ static void stf_set_raw_addr(struct stfcamss *stfcamss, dma_addr_t addr)
 	stf_syscon_reg_write(stfcamss, VIN_START_ADDR_N, (long)addr);
 }
 
-static void stf_set_yuv_addr(struct stfcamss *stfcamss,
-			     dma_addr_t y_addr, dma_addr_t uv_addr)
-{
-	stf_isp_reg_write(stfcamss, ISP_REG_Y_PLANE_START_ADDR, y_addr);
-	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
-}
-
 static void stf_init_addrs(struct stfcamss_video *video)
 {
 	struct stf_capture *cap = to_stf_capture(video);
@@ -307,59 +300,6 @@ irqreturn_t stf_wr_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-irqreturn_t stf_isp_irq_handler(int irq, void *priv)
-{
-	struct stfcamss *stfcamss = priv;
-	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
-	struct stfcamss_buffer *ready_buf;
-	u32 status;
-
-	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
-	if (status & ISPC_ISP) {
-		if (status & ISPC_ENUO) {
-			ready_buf = stf_buf_done(&cap->buffers);
-			if (ready_buf)
-				vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
-		}
-
-		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
-				  (status & ~ISPC_INT_ALL_MASK) |
-				  ISPC_ISP | ISPC_CSI | ISPC_SC);
-	}
-
-	return IRQ_HANDLED;
-}
-
-irqreturn_t stf_line_irq_handler(int irq, void *priv)
-{
-	struct stfcamss *stfcamss = priv;
-	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
-	struct stfcamss_buffer *change_buf;
-	u32 status;
-
-	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
-	if (status & ISPC_LINE) {
-		if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
-			if ((status & ISPC_ENUO)) {
-				change_buf = stf_change_buffer(&cap->buffers);
-				if (change_buf)
-					stf_set_yuv_addr(stfcamss, change_buf->addr[0],
-							 change_buf->addr[1]);
-			}
-		}
-
-		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
-				    CSI_INTS_MASK, CSI_INTS(0x3));
-		stf_isp_reg_set_bit(stfcamss, ISP_REG_IESHD,
-				    SHAD_UP_M | SHAD_UP_EN, 0x3);
-
-		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
-				  (status & ~ISPC_INT_ALL_MASK) | ISPC_LINE);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static int stf_queue_buffer(struct stfcamss_video *video,
 			    struct stfcamss_buffer *buf)
 {
diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
index c34631ff9422..6b3966ca18bf 100644
--- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
+++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
@@ -443,3 +443,63 @@ void stf_isp_stream_set(struct stf_isp_dev *isp_dev)
 	stf_isp_reg_write_delay(stfcamss, ISP_REG_CSI_INPUT_EN_AND_STATUS,
 				CSI_EN_S, 10);
 }
+
+void stf_set_yuv_addr(struct stfcamss *stfcamss,
+		      dma_addr_t y_addr, dma_addr_t uv_addr)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_Y_PLANE_START_ADDR, y_addr);
+	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
+}
+
+irqreturn_t stf_line_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss = priv;
+	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stfcamss_buffer *change_buf;
+	u32 status;
+
+	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
+	if (status & ISPC_LINE) {
+		if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
+			if ((status & ISPC_ENUO)) {
+				change_buf = stf_change_buffer(&cap->buffers);
+				if (change_buf)
+					stf_set_yuv_addr(stfcamss, change_buf->addr[0],
+							 change_buf->addr[1]);
+			}
+		}
+
+		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
+				    CSI_INTS_MASK, CSI_INTS(0x3));
+		stf_isp_reg_set_bit(stfcamss, ISP_REG_IESHD,
+				    SHAD_UP_M | SHAD_UP_EN, 0x3);
+
+		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
+				  (status & ~ISPC_INT_ALL_MASK) | ISPC_LINE);
+	}
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t stf_isp_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss = priv;
+	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stfcamss_buffer *ready_buf;
+	u32 status;
+
+	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
+	if (status & ISPC_ISP) {
+		if (status & ISPC_ENUO) {
+			ready_buf = stf_buf_done(&cap->buffers);
+			if (ready_buf)
+				vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		}
+
+		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
+				  (status & ~ISPC_INT_ALL_MASK) |
+				  ISPC_ISP | ISPC_CSI | ISPC_SC);
+	}
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index bc7e7b0736fa..fcda0502e3b0 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -427,4 +427,7 @@ int stf_isp_init(struct stfcamss *stfcamss);
 int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev);
 int stf_isp_unregister(struct stf_isp_dev *isp_dev);
 
+void stf_set_yuv_addr(struct stfcamss *stfcamss,
+		      dma_addr_t y_addr, dma_addr_t uv_addr);
+
 #endif /* STF_ISP_H */
-- 
2.25.1


