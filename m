Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DC144DDE7
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 23:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhKKWhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 17:37:12 -0500
Received: from mx08-0063e101.pphosted.com ([185.183.31.155]:35758 "EHLO
        mx08-0063e101.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229652AbhKKWhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 17:37:11 -0500
X-Greylist: delayed 1940 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Nov 2021 17:37:10 EST
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
        by mx08-0063e101.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ABM1ctx031407;
        Thu, 11 Nov 2021 22:01:38 GMT
Received: from ind01-ma1-obe.outbound.protection.outlook.com (mail-ma1ind01lp2059.outbound.protection.outlook.com [104.47.100.59])
        by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 3c8dqygqd7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Nov 2021 22:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThnLUv6jVPGHN+G3NAKNRVlvHnqe4TxAy54YPusaP5aaSrYUJZ4tQCwd5RM01cMOjzxS5Ova7d/bG+C+aHANvgW31vz295YpTsv3vJfFL3kEy0+hRDT2+K8S112EMK8E8haCgBxaqyhb88e2RxIvEpoelYwhI46JgRilBIE/KdTv6FU+7LQmYJhAiuJec9g5wpRvINumkVubovZ0+D8OQAIl2by02jULtY97TftmP6WQzvuo7CHUepsoenyVBtvgXjH7mmC0+tymr8AVArwZ4yYIeikLvwOYGSe1I9TF59dzzabKN2zzzrOs+/zlIZU+ZTGgVS5cVmVuGqstJNeETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTYZ02ryn4Kk0HIGiItKbjRQwhRurcSgByQLwRXDpeQ=;
 b=kpQ95UjZUnSRMEQimdeaW6WMvUOiPaG6OMFbb8MhSHlWbiOFKgWQLsBx1ohktAccxICu0jB3PAp/+4DtxCnaVaCR+/tFQXbiGEpcEM5sXbD/1S4QF2QWK+SP9QZxb57WoVhOKL7cZehHdYvKmgrtFFANHgSPGV9ua0sgTZxBLGZXs9BwWV8sEonTxQWwviOJuyE+eZSZ+wGsvMicwX7QD12yulLBpPOhB6pH0NsxuN0W+v4QDgvrrX0ij7ReduHqNkDZF0Jp+Cyxx6+YfvuUgi9/mUpoe53YpWO20HNLqe++qKYCdIWLXL8FxrquL0ABZ9YNKBICqxk1KueguXXbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTYZ02ryn4Kk0HIGiItKbjRQwhRurcSgByQLwRXDpeQ=;
 b=W0AUDUk4I6ruHp/nevjQhMVfa0+Q/dDuUYR9n0PiEMWyn9J5WiKHSEIRaI+H1/X4rnq5SRjAjQeMPumdCusf4nkoRLdR5pvLHNIl51K9SLfKgt9J7O8mH0OBnE9gwSfBISvbCUwXEVB+PTZJHlQjWzs/ksA8u+zrG/bRFq3VxoY=
Authentication-Results: vanguardiasur.com.ar; dkim=none (message not signed)
 header.d=none;vanguardiasur.com.ar; dmarc=none action=none
 header.from=blaize.com;
Received: from PN0PR01MB5299.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:35::10)
 by PN0PR01MB5314.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 11 Nov
 2021 22:01:34 +0000
Received: from PN0PR01MB5299.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80c8:18bc:1109:8b39]) by PN0PR01MB5299.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::80c8:18bc:1109:8b39%8]) with mapi id 15.20.4690.025; Thu, 11 Nov 2021
 22:01:34 +0000
From:   James Cowgill <james.cowgill@blaize.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     James Cowgill <james.cowgill@blaize.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: hantro: Avoid global variable for jpeg quantization tables
Date:   Thu, 11 Nov 2021 22:01:08 +0000
Message-Id: <20211111220108.1873947-1-james.cowgill@blaize.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To PN0PR01MB5299.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:35::10)
MIME-Version: 1.0
Received: from le-lt-j-cowgill.lan (109.202.244.96) by LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18e::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Thu, 11 Nov 2021 22:01:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5806415-3c21-4fb6-97af-08d9a55ed35c
X-MS-TrafficTypeDiagnostic: PN0PR01MB5314:
X-Microsoft-Antispam-PRVS: <PN0PR01MB531439A7F081EEB458E454DE87949@PN0PR01MB5314.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6VOKtpTF3qHPZ8p8uHMmIDpLXDjBIg36qeWzhzWCA72+9D/J5d/fN/+w5cC2MIBkB36cmTmAGmxc6cSmRexSGIr35HJwEDjcDIaAi1zizmCdtANdP1pSH+8fm9wuXYY6CEtwlaroSBvwXJwnHScELIaB5+qkoldtFV3SbSZExrNoj3RgrQ9UZEFO8hImMd3elM7IZYWkCYtCrQWAmY2SgyN9vqqXBcv2T4Z1RSqiKvl5StIin2CPr5AKYnzqcXd2H85lvpVFP84fIKHYu+nG86DhlEXpKpOlOXBD97pQzEVlyRoky5jfK4P+uxQHSP/l7FoLLt+8dlnjOH5Xcsl8JLbVYRUX0cwrFEP8zQBuJK8haGqvAgiDT7qGmCcieD0gq+nK5pdIgg1sa6lb+rcxPtq/p1laOK1dDJ6gUR+lmJEXBO8/koPqbFZFi5ZvALxw16uRHdDGejdTj3ZE2NLnkQyWhhF9bbJCJmIjWYjA3S3BpcS3vutoAGEFbV7V2rfgbNgJG9hajb6FR9o/0J7mmASm/IGzcr2Cc/MHC167WB5hje48qbrIxc3NXBANph2cY5fxgZ+Gf1MaIa31FwiKv5+c+6ax4T34C19OEPCpzReHu+BM9E8WK1SAtwmkM+mowN3zSOMMUIP/kP0ZMpYM1yTIfOTDj5E1/wHcIRmLVBYoHppAE3ZyoCzxFa9JHdkwmptnULjyPrAyhiX5dDTHMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5299.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(110136005)(6506007)(5660300002)(508600001)(86362001)(36756003)(66556008)(83380400001)(2906002)(38100700002)(6486002)(7416002)(1076003)(316002)(44832011)(8886007)(38350700002)(66476007)(66946007)(186003)(6512007)(6666004)(26005)(2616005)(956004)(4326008)(8936002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ms0yMsyaoI3/+S0yvwxTCvyoxB4Gfs8kV4v7mMbxS2pv9e3eBMMCvuyNXDFm?=
 =?us-ascii?Q?c0Wf/HgyM/6GRiXkQACdyf1k9t8yhGUBQTA5ddWolS+zU3/Swppt9NfKK6f4?=
 =?us-ascii?Q?EQ82HiQRgfnncc5LxEqjn6PX5u9aQDJEOvodlEkFhH9dqGy2Maxhk1R97wsh?=
 =?us-ascii?Q?awAKO1/yTlAErTCu2SNIYenyTl3/9slYJiUNRmeRjviCHIVgs9XoyYy/RfcH?=
 =?us-ascii?Q?8dhZ6UIDEBgBsV5+0oHu4ezRd+0kbhpGN0SXrbLrWy8CydAfaPO/XxnH3mKh?=
 =?us-ascii?Q?o/Q6+ujaLY8e7d5GNrbn8Mc0sW0FQyhHbCQLp+M3+9fIdxZul3K7oBEyRzYd?=
 =?us-ascii?Q?TwOAVCBG9kXLqpt3IiEj9CyGrIoYzfZSsIMylxiajtbkYSFeTw7aU1rlAPJq?=
 =?us-ascii?Q?1Jivk0d86dolWXTASK2d7dPIDJHJAwfC93IyE+QAshgt8XDJix72ioVGUZJm?=
 =?us-ascii?Q?7lOQXNRhAWHHDdaese0K4K3IffB/P2IMbyXT3oNFesEtzGkcAMhzcJ+sh761?=
 =?us-ascii?Q?TKp/crR1VN3/g+4DG8H4p/VCA4nv7J4lgbI9AVgtSlgJ4vBZExpEQ/Utf4sW?=
 =?us-ascii?Q?h+U1XK3BK4EWkeIUFoALmpyFTNCdjB0cvmdkx7tUTgqBCNOnZ3F4DvsAVdJd?=
 =?us-ascii?Q?F3rk7TV/lj2N0MptBGhg1d9CQj7RyzEOxVCPW9exHwFnfYh+8uQAcCtw3vND?=
 =?us-ascii?Q?jYALyOIb1AXlC64nZDqzKmOAZt4/s5JrW6xtmjdLdgkr9mHA7jJeXvklirHN?=
 =?us-ascii?Q?lI8j0pV47TOx63bLyw0Xgu6borxWi/AHNVDMFZTpjlIZJn5HM/PqLd4bjdoZ?=
 =?us-ascii?Q?8G1LkNnyL6XWTkZutGV+jcTIMzXoP5tnKqyJcaGTl8gZVNRETOuNPFHsJlgt?=
 =?us-ascii?Q?4qHjSH5BahNEBgTt2mqTU2ukmxFSqOLBX2DYsiXzUoJkKhNV5ZlwDcoBCaei?=
 =?us-ascii?Q?JaD3rupW0oD8bZgcPl/L53YSQYy1T4FTAGyntgzeN38K5HF1QGnsnocjrTN6?=
 =?us-ascii?Q?G6MBf83LCN3pHD7fzjmkj1csyfKHVjNqTSuWPhAFjFXQ/em7gP0Zmf0uY0W/?=
 =?us-ascii?Q?4O+1SQ9R6exE/6dXSf6MD7WW2PquAn23whfbsf7Fa1c94YSlUwEbwcTEx7zm?=
 =?us-ascii?Q?SJpCX3GDiOcmDi2ILi1XTJ4dxGp3c/eu1+kSi86u8gHGlDtAbJY1nXfH7W2y?=
 =?us-ascii?Q?916HKpF4XTZf2Z3Gg/ivgLVldAHSQq8FftANRjyQBcSSwqESIWVs1tjGixrb?=
 =?us-ascii?Q?M665G25CDwIZOSLPUut+iEGZhu6WhpZHvnZxtBCcZSoBoAtnWkZF1pE2a68l?=
 =?us-ascii?Q?I+txjW4Y1s4oWqkTltLbGEv31/FYh9bvOpKWFU8XKyxRffmOu4EmWG0DFBrh?=
 =?us-ascii?Q?RQHzkDFLwzH0R2lpDieH8G4oYiLY2FcvzmRbQ2fqzrluDx1iUJ6Y4YBGLJ8Q?=
 =?us-ascii?Q?O+fqT+jJNvvfC8L7/8McCJx5MsUPimaO5FGlA66GHEHvFGhP50v8EMbFOBTy?=
 =?us-ascii?Q?Tb+HMRzTGe5ywqi+GLORtAxrfc4xgRBlBRaKJ6Wco9f+SkYz4Npdz9iouzHr?=
 =?us-ascii?Q?z5KdoQ+naimD1kzYDjnORUUc/z6nNUwg1HYbR9GtiR7VDrttv02rbwPl/pi6?=
 =?us-ascii?Q?FV4TrfJUFzT2IonhXP/Y8u9IH6oXSfpiAP6amcT2a80QpM7/lpHbvJ0lHqf8?=
 =?us-ascii?Q?Xo8UOA=3D=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5806415-3c21-4fb6-97af-08d9a55ed35c
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5299.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 22:01:34.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de1uL1kUPec1qBylhk7auLoYC7awJ2+6FR3wNQw87YSsqrg7m/6e6VOzgUA4hIR17mRuPa0wfdJsUqminizTBlhWzL394RQwpcFev/8rfhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5314
X-Proofpoint-GUID: jibOp6NyUyYE9qKN3h3q6OYjAGXOc_Es
X-Proofpoint-ORIG-GUID: jibOp6NyUyYE9qKN3h3q6OYjAGXOc_Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_07,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110113
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On a system with multiple encoders present, it's possible for two
encoders to write to the global luma and chroma quantization tables at
the same time if they both submit a JPEG frame to be encoded. Avoid
this race by moving the tables into the `jpeg_ctx` structure which is
stored on the stack.

Signed-off-by: James Cowgill <james.cowgill@blaize.com>
---
 .../staging/media/hantro/hantro_h1_jpeg_enc.c |  5 ++-
 drivers/staging/media/hantro/hantro_jpeg.c    | 31 ++++++-------------
 drivers/staging/media/hantro/hantro_jpeg.h    |  4 ++-
 .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c  |  5 ++-
 4 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index 56cf261a8e95..20dafd6eb6b9 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -113,9 +113,8 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 
 	hantro_h1_set_src_img_ctrl(vpu, ctx);
 	hantro_h1_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
-	hantro_h1_jpeg_enc_set_qtable(vpu,
-				      hantro_jpeg_get_qtable(0),
-				      hantro_jpeg_get_qtable(1));
+	hantro_h1_jpeg_enc_set_qtable(vpu, jpeg_ctx.hw_luma_qtable,
+				      jpeg_ctx.hw_chroma_qtable);
 
 	reg = H1_REG_AXI_CTRL_OUTPUT_SWAP16
 		| H1_REG_AXI_CTRL_INPUT_SWAP16
diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index 36c140fc6a36..df62fbdff7c9 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -36,8 +36,6 @@ static const unsigned char luma_q_table[] = {
 	0x48, 0x5c, 0x5f, 0x62, 0x70, 0x64, 0x67, 0x63
 };
 
-static unsigned char luma_q_table_reordered[ARRAY_SIZE(luma_q_table)];
-
 static const unsigned char chroma_q_table[] = {
 	0x11, 0x12, 0x18, 0x2f, 0x63, 0x63, 0x63, 0x63,
 	0x12, 0x15, 0x1a, 0x42, 0x63, 0x63, 0x63, 0x63,
@@ -49,8 +47,6 @@ static const unsigned char chroma_q_table[] = {
 	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63
 };
 
-static unsigned char chroma_q_table_reordered[ARRAY_SIZE(chroma_q_table)];
-
 static const unsigned char zigzag[64] = {
 	 0,  1,  8, 16,  9,  2,  3, 10,
 	17, 24, 32, 25, 18, 11,  4,  5,
@@ -277,7 +273,7 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
 	}
 }
 
-static void jpeg_set_quality(unsigned char *buffer, int quality)
+static void jpeg_set_quality(struct hantro_jpeg_ctx *ctx)
 {
 	int scale;
 
@@ -285,24 +281,15 @@ static void jpeg_set_quality(unsigned char *buffer, int quality)
 	 * Non-linear scaling factor:
 	 * [5,50] -> [1000..100], [51,100] -> [98..0]
 	 */
-	if (quality < 50)
-		scale = 5000 / quality;
+	if (ctx->quality < 50)
+		scale = 5000 / ctx->quality;
 	else
-		scale = 200 - 2 * quality;
-
-	jpeg_scale_quant_table(buffer + LUMA_QUANT_OFF,
-			       luma_q_table_reordered,
-			       luma_q_table, scale);
-	jpeg_scale_quant_table(buffer + CHROMA_QUANT_OFF,
-			       chroma_q_table_reordered,
-			       chroma_q_table, scale);
-}
+		scale = 200 - 2 * ctx->quality;
 
-unsigned char *hantro_jpeg_get_qtable(int index)
-{
-	if (index == 0)
-		return luma_q_table_reordered;
-	return chroma_q_table_reordered;
+	jpeg_scale_quant_table(ctx->buffer + LUMA_QUANT_OFF,
+			       ctx->hw_luma_qtable, luma_q_table, scale);
+	jpeg_scale_quant_table(ctx->buffer + CHROMA_QUANT_OFF,
+			       ctx->hw_chroma_qtable, chroma_q_table, scale);
 }
 
 void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
@@ -324,7 +311,7 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
 	memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table,
 	       sizeof(chroma_ac_table));
 
-	jpeg_set_quality(buf, ctx->quality);
+	jpeg_set_quality(ctx);
 }
 
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
index 9474a00277f8..035ab25b803f 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.h
+++ b/drivers/staging/media/hantro/hantro_jpeg.h
@@ -1,13 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 
 #define JPEG_HEADER_SIZE	601
+#define JPEG_QUANT_SIZE		64
 
 struct hantro_jpeg_ctx {
 	int width;
 	int height;
 	int quality;
 	unsigned char *buffer;
+	unsigned char hw_luma_qtable[JPEG_QUANT_SIZE];
+	unsigned char hw_chroma_qtable[JPEG_QUANT_SIZE];
 };
 
-unsigned char *hantro_jpeg_get_qtable(int index);
 void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx);
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
index 991213ce1610..37f9707c3691 100644
--- a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
@@ -143,9 +143,8 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 
 	rockchip_vpu2_set_src_img_ctrl(vpu, ctx);
 	rockchip_vpu2_jpeg_enc_set_buffers(vpu, ctx, &src_buf->vb2_buf);
-	rockchip_vpu2_jpeg_enc_set_qtable(vpu,
-					  hantro_jpeg_get_qtable(0),
-					  hantro_jpeg_get_qtable(1));
+	rockchip_vpu2_jpeg_enc_set_qtable(vpu, jpeg_ctx.hw_luma_qtable,
+					  jpeg_ctx.hw_chroma_qtable);
 
 	reg = VEPU_REG_OUTPUT_SWAP32
 		| VEPU_REG_OUTPUT_SWAP16
-- 
2.33.1

