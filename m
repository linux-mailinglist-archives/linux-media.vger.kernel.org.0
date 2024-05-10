Return-Path: <linux-media+bounces-11315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1ED8C2337
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8678CB21A57
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 11:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF07117082C;
	Fri, 10 May 2024 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="F5VtrorA"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37016F829;
	Fri, 10 May 2024 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715340202; cv=fail; b=rPgOQZ5Qj2qO1LYKlG69N/qk6FzIX56PoyA+NiLs6VpNPF2M/9GofGQ8OHK8el1JgsQ2oK1v+7Ljm8cD4y2/uRV6WGqX96RKwdvpJIDFrsDzi6PzbAiYlELxLNjRcGy1ikKWUcxQ0oYwWF7jp3AGA5JdQ3u8pCZH5dlnqF3vWNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715340202; c=relaxed/simple;
	bh=UdDbnQ+4fqdcittKVESmOw+oCu2MKZmKC4WoVjV6smg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQXM3uOtt7bTFd5PqbyjHjOk8qfx+W5hgP8GU5ICnuVPpk9IZ3e0xkiTLIlSPxCTlC/97WeWtto9VnLABullT3Q0HWiI6MuuChGigK6uwd0RAaJZZyXGZwTpgAvPTImKFrkg7XYOVTDzAnSjy0nN1JIte8wINqDjHjKGcDMnI1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=F5VtrorA; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn5Zb6QHID8D/ImoTYbzbQXVpfuQ+mpoPwGfBAx3OnEoAqpUM2yHQXKRQO5q7yXFLNZY5jiwDdxKKY0YIeFGkIrL0i8SxYH0DJCHL8a6WbvPux7d0jO55eGqYjQMXxtAKlTrm1fCnRBDJ2sgVDAEgaHVvQzKZSuEt61QyVBeqYnOqvbvCa176sL02upZYwQ0wEUH71AU0a8zoeSDLNNX8tL7N/zNN5vhCc/BBdH7rOIWRNBQUiwbzVuF45R3Pv9I1o4d4JBssQyAySUVbQTrKxI0MPsothcv6N6iA0o7tzf3fByh/JYx/c7E3LtxveCpQu2WIMJKR69dGTTZyQuN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7u64hUVPthveZ+N2cB+0mYi+WsgE2TPOg4MbPzmR2o=;
 b=D3FSquSYnn9/cb6I4Z6yCEs8THtJwcyyF62DgNJRm1zJZa99rpCQP4Mwuj5tv/1H6/CoQ5DC1qYfiGCDPLoknCAu4eIkjpeWolSqCRQo/+P72NKoidQJ4ot3tAN8O24vhsRaLdW07tXSng+FpAWSgXKu/GzbHuiSgCC/Bk/TrdswGPqCljCa8HL3eZg1sM8M4hj+vhpoH6ZPlNlYypcVo1J4mat908T5pnbUkYYeLPo46X9Nuz1GHp7P1QAysa9f/9wiHSDtjm4O6IV0Jf3P1/frmSNieGHPHiBaI1GSw//iD8s/LFQ2K6zcjnQz2r1gsTR8Wq2Nu2/rDOyg76sAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7u64hUVPthveZ+N2cB+0mYi+WsgE2TPOg4MbPzmR2o=;
 b=F5VtrorAuvjZXLO1j2FNd8533YgNpY1hCaJTPlj/pPn9CvfGOAGpTTriW0CVE4GNA7+incw7pPLgTtQH3v1dM4ibKbZ+cXECaTkBx7ekRGDIZUlCG+aVaay7ktOHkJJ68ul3pDp+/+3gd7Z3z3N0nInQXBv00S4o+4gtvrSDhnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2862.KORP216.PROD.OUTLOOK.COM (2603:1096:101:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 11:23:02 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 11:23:02 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [RESEND PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Fri, 10 May 2024 20:22:49 +0900
Message-Id: <20240510112252.800-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::7) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2862:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e52167-b554-40ef-24b2-08dc70e38e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gEvX+yCvJxwvedC//zL4ZA/yXYNcWL+/ukXThYpI1wlzU6y3XBp8HMMY+YlI?=
 =?us-ascii?Q?UN1Gi/iN0I0zR0+L9yJNfzMESykc+owwJOdlMNTgbRdOmDwf66i/Uyr1rWaq?=
 =?us-ascii?Q?DB+zs9AuSzPiSpm1E3Ikwmj1RxuZh1iFOggtAp0ZApc25WwtdAlW0uSvqJKl?=
 =?us-ascii?Q?RDCfzuFp7u6XJrMeMKsAqI5NxwVOK2Fz723jLBm3aez9TsIYYOqwl+GDetnq?=
 =?us-ascii?Q?SKCEGf+qpacuEnV5oP2SwOms9Wy6Kjl4o8cg0EEKChAubIUcZeRURqAIRkr+?=
 =?us-ascii?Q?xtlf/KmgW+NXSYOWUfZARCeEly7sdcLlMx9IqOA3s0CURPXJ6IS8mlGPTQD6?=
 =?us-ascii?Q?Zy+qcKnB8x52yk15dChYqdf2uzl+4m1epnAXnOMKimdW1IbyadTPeLou4qCo?=
 =?us-ascii?Q?N+sQCf4WRRNmXsyvvT3verHa5T9S8rTz7moIRnBIpD7G5pelM9tvIWtdth+p?=
 =?us-ascii?Q?8bYLKNvaq0kYJzSge4U6LRg/ps5JwqcPzbBS5FNkd8JAXiNjzmrFGlB26D/g?=
 =?us-ascii?Q?k7z0H6L1KcLXHYoXkpBq3ThWH1cZvXDX6KkP97ZLwAjtjYf+udakZsbvhQ7W?=
 =?us-ascii?Q?QX+CeEGT61kNg3LmpTBuyYGnjD/VwlyGfiMveRhjhX79AkF+bxNnjnjGyGHC?=
 =?us-ascii?Q?2sSnjKILZJxp7SFchhgSLLdXwFjItH44cB8h/TBWSgJXag4O618qdFiBbIMS?=
 =?us-ascii?Q?FOeBu7jzrnQttDutFCS9TDbIZHvAerUTwlGXIQvciToUcoBvzVUen8kaQUpv?=
 =?us-ascii?Q?YHdCVevNSzLzgaXd8sqLBUmjLE0Oj4PRcEbZ8VBhqYcJzKO2RMVXsc29CKzT?=
 =?us-ascii?Q?jHyvL0mpnzTmWr2fzm/BMpNBa7syUfjPKE8AAMwvrLUbFa90wrhfOEIfbE1o?=
 =?us-ascii?Q?dMNWvTdcCqTAkLw75MvpGZAWT1i6MzRFhpUiNdBs4feSANVABgPMov9WSKjB?=
 =?us-ascii?Q?SqP7VhakH+L95NQR/4T6YvwZJ2uQF0Iockx86kAL41o57F0OGK3QPxSIfzB8?=
 =?us-ascii?Q?eyAc54PMaFptBZPiNqXQ4F4YuBFoGV9O94UdJ6RXGlZbxRB1wQZTz7ihkqOz?=
 =?us-ascii?Q?jLn2qS3XrT/3pVcmp+TrlXWvhpkMkQiCV6XrCRJ32pawlEoVxJQPNDcekFlT?=
 =?us-ascii?Q?nJXsvUMO5BtvHgZdbkYKEhbM0VmnapZlw/7rakx/QFZeLOzfLcEfJKincu9O?=
 =?us-ascii?Q?qi+ZLG97Et4AYksBQlAmj9+Fzi9KUC5xmwTU92v2PasM15CFnDa9nS+5i5Cj?=
 =?us-ascii?Q?iK56mBa1R5ASZ+/IOjksJZrnEiyhAgIQFrttfQF8GYMmdji26VujuoFSFUNV?=
 =?us-ascii?Q?idkewp+0slqt9nmRXEAZ7qB777d3p2l+UFRof2RIKay0Lw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CatXNpV2ael11J627nMqRqTO98CwUGyQAV4C1lIXBxhNe4VTMF+uPsrvV7Pc?=
 =?us-ascii?Q?wSYTQz8IqpFx0zA59XVo0wazSuKbaewlNjKjik/X01q3K8pnc/9arNHufzPq?=
 =?us-ascii?Q?NDSUypjo8MYnZEUYwGEGTcwnnA5USpL3M3Ry8yr+z83fWu7+4VockCL5Q5Nq?=
 =?us-ascii?Q?2MzX+mf96ucMN5HfI+5Q7kU654lni1u21MKPtUfTYwV+k/94aa/qcB8j+uxu?=
 =?us-ascii?Q?DO3Ha4JbvsTdFxULNAvVEOVoupBr8VnYKn8iapazU4Ts9X3145CYMp7P/SYx?=
 =?us-ascii?Q?nXP6O2CqMOcLF7+ocFE932NkiQWytNiIYcuuyS/mVqtVToMhW2FolWVavt99?=
 =?us-ascii?Q?o3LxTNRcck5XSRJyO2UYxlNz62I6lOku9SM5YImWNEoDOvcp87QKbNu4onB4?=
 =?us-ascii?Q?OF82yhqNRESPLCmeaDNHcMIAL1j6ZVq+T2IlYX/JrphTe83uMJOzTYN66yJF?=
 =?us-ascii?Q?NcOBzqlb3jgGZ2GTEaVQtG5VNAKkpI5gq0jCuOSkbLrFCode0xsjsj6psiTz?=
 =?us-ascii?Q?wiuMaUUW9edNRQaKlkLh5oNHdHEt8oKxsJDSuAl2AedOGqvmlQnw6NfqBxro?=
 =?us-ascii?Q?I3+JCM9ehhnpNYhY1DDyT80+mq3Aaa6FDawyMgQgFnv3tkBDEpLhj3H3VDsE?=
 =?us-ascii?Q?3uWyk5UiBmRt9S7uRIRMKXHVpQCoROGQjmWp6uU/nADDMN6EaIdwKKAQmt6O?=
 =?us-ascii?Q?BymXOFptvo7Zc46HJinOilsdkCBRYq5cEAoXFEy2qUU6SqARS29yv01GAzOX?=
 =?us-ascii?Q?QDbzkXvgTvGOlD7gFxdPV7SB9UIAZCXcBdAHKj31L8qKhzg7Jp3wL2c8Ft7M?=
 =?us-ascii?Q?aFsG9eDFaSlGRBMIgL+Pr34z90dfK6Ab125c5WqYw0b/cbK5Rb9+1ko1LKvD?=
 =?us-ascii?Q?7vi+W1dDSCiri/dHyvde+s6Vx3kSljn5nPNRNQ4ABT9TouNeZIa9SCzsiuLt?=
 =?us-ascii?Q?R6S9AJ4nilBowKex/nhc3zOgQh11eWLYh/hhlFRlzzAJVhK7IDvP2kIw8JY6?=
 =?us-ascii?Q?igZjDm0mD6M+5+ZH0IQH2CuzEW6bhyE59yJkU/4kn+8MESwRfrlCV8l/1efd?=
 =?us-ascii?Q?T0kU/ZB9W04+LQybcrSwU0O7jVNF1zBDPoi60xX/7333Q3cXYqeRbB3zXYgx?=
 =?us-ascii?Q?JuKMsiaeN8HL4aNcztVe939upebbRhuCoKOh9p1uz4Sx0heQTXDNao8lmmru?=
 =?us-ascii?Q?/5UKsFtGEL3WzRcVWgfeOJCStOKEOSZu/+eAXQhIwDDvWGWYBS7lQ25T6WRF?=
 =?us-ascii?Q?p30DkNdHBEFUg6LSUd4ryu2xWwybK3i36Z+K8XHfoIWy7ngMh1sPji+LtcRX?=
 =?us-ascii?Q?849ofae1XR/d4SXGQlkgXk2PjdCfvzUmrBcgzsNbQJ+lH8WUWLsIZH3z2lg8?=
 =?us-ascii?Q?8qPfGfIVByartpxQRRXIqeNA9Gxr6wANHzEU0nd09DV9bM65t33nk86/elgy?=
 =?us-ascii?Q?C4e6wba0gtOC2Yo31gVGRK5RwKHUSlqPFATDPFnBsKFK9Lt0N3xg6DHYwLKM?=
 =?us-ascii?Q?Yxr1QEZfKA9nHTAC4HwfnDx2laRTNkQqY8xOosd5UPu6mCFo+c3Qed2dbKtI?=
 =?us-ascii?Q?6bynkKdltAZ4mNlyGStjMoX4rUENBy62/NmpcPYXC5K3FcWFW8yyTEdc8h0Z?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e52167-b554-40ef-24b2-08dc70e38e01
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 11:23:02.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPuz5cIi3TSv9AemPOwO4DctBxoD2eG7NBAku/ONfoa3zKNwwoBkDXyg1StDe1jI9nTZMs6M6pzxRWQjlBJfP7pqUnFzwGKl8kQKcaVU1t4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2862

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     | 19 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++++
 .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 2d82791f575e..fff6e66b66e4 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -23,6 +23,15 @@
 #define FEATURE_AVC_ENCODER		BIT(1)
 #define FEATURE_HEVC_ENCODER		BIT(0)
 
+#define ENC_AVC_INTRA_IDR_PARAM_MASK	0x7ff
+#define ENC_AVC_INTRA_PERIOD_SHIFT		6
+#define ENC_AVC_IDR_PERIOD_SHIFT		17
+#define ENC_AVC_FORCED_IDR_HEADER_SHIFT		28
+
+#define ENC_HEVC_INTRA_QP_SHIFT			3
+#define ENC_HEVC_FORCED_IDR_HEADER_SHIFT	9
+#define ENC_HEVC_INTRA_PERIOD_SHIFT		16
+
 /* Decoder support fields */
 #define FEATURE_AVC_DECODER		BIT(3)
 #define FEATURE_HEVC_DECODER		BIT(2)
@@ -1601,12 +1610,14 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 
 	if (inst->std == W_AVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp |
-				((p_param->intra_period & 0x7ff) << 6) |
-				((p_param->avc_idr_period & 0x7ff) << 17));
+				((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK) << ENC_AVC_INTRA_PERIOD_SHIFT) |
+				((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK) << ENC_AVC_IDR_PERIOD_SHIFT) |
+				(p_param->forced_idr_header_enable << ENC_AVC_FORCED_IDR_HEADER_SHIFT));
 	else if (inst->std == W_HEVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
-			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
-				(p_param->intra_period << 16));
+			      p_param->decoding_refresh_type | (p_param->intra_qp << ENC_HEVC_INTRA_QP_SHIFT) |
+			      (p_param->forced_idr_header_enable << ENC_HEVC_FORCED_IDR_HEADER_SHIFT) |
+			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
 
 	reg_val = (p_param->rdo_skip << 2) |
 		(p_param->lambda_scaling_enable << 3) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a45a2f699000..a23908011a39 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1061,6 +1061,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		inst->enc_param.entropy_coding_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		inst->enc_param.forced_idr_header_enable = ctrl->val;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		break;
 	default:
@@ -1219,6 +1222,7 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 		else
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
+	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1701,6 +1705,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 0);
 
 	if (v4l2_ctrl_hdl->error) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index edc50450ddb8..554c40b2e002 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -566,6 +566,7 @@ struct enc_wave_param {
 	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP */
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
+	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
 };
 
 struct enc_open_param {
-- 
2.43.0


