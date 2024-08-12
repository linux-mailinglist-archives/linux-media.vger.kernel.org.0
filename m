Return-Path: <linux-media+bounces-16111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF894E771
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAA06282640
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FF1168487;
	Mon, 12 Aug 2024 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ftZ7RQPF"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021080.outbound.protection.outlook.com [40.107.42.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09C165EF7;
	Mon, 12 Aug 2024 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446532; cv=fail; b=FZqScpvFfR2/cNbx1x+Wz9bo+mUgcpGRymNSqTuzfjKzvdj8IpbLyePLgJ0e6u8NAqasWfx6Y9o8oZhXhocIzmSjlXenxYQuHz36tCnkBL/U6ieTbpRbutPQaqNd+RN3E3f7ZUtsuZaYkVKp0gpyMFU7y+z2rFYIglOkXKUk/4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446532; c=relaxed/simple;
	bh=UiTOsuIPdnjFiy25DGycvOoGT0s1iFeQjnnlxcQCqy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V4uVfFsCYaTQ/AAxULRq1wrtnVtCZslGYwvw4K3Xgne9FUfHk9ndz4qC32fgSOw7KuKEmKFSHPdoQxCzKcR0gpOTHEcUVzloyRXoVKfdBWAL/YBfgMBEMYQBH3h8BuxuTBhdFb62xTp7NlwLJTGlXtzNRafDBv+825z1zywd/dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ftZ7RQPF; arc=fail smtp.client-ip=40.107.42.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fS8lpd47jw3H9NA03pzvH++UTa7NGSrqdBVGRDVi5E06FuJ5phA0naLA9bxX4vvmj4j2zTMHPb5SIU+ZSH2isU35zNU9rkEH//8x+1DgvF6+hUAyubrkgiM2fnmtxWLr+USEeCw+nni0JQVcFOlFcxBwvnQU8eRJshTpT+rqX46pPvLrkt6lcKjQVhrYkr5H/v98AFoPZ8jdHD2k1mECYHqddCATnENU25GGEUxfgEASBJWZksk+361dzwyYW0L7cjIOZT64JGKmRt4/+NqZDkfMs8K0sMYRlR9f1T53ixoAWRdeAR0iV5/JFzMwwBMnR1A2ixCijHUwimoRDk2daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo09o0f7cArhs9nmYI/Ipzy2U9tnqhbP6xrDVuSq5UU=;
 b=GGyO2DBiXf3CdB7adzxbBOuF/+M1HDGg4Ex+NiafEp7+ASd+Eq89DmY+svf9c/3QP/15+PdtrWXaDGhdpTgMNAMJnJpukWEBcSWcNooG7rYU0TewGa5xSbrBM2MhJymIQ/jMduI+PZXVGr6k1ET6GByRbQdwbr5e4ot0PPNqWNlIW4CLXtFDBXcOPiAjVKtbr5wF2NXipTGMsip4tA67cxREU61Ezqba4bKaYuRFwF88NzaQhAQeLUNpVLxZQyxQLPvfaEstAKthaPD8MAs9BA2MLvUPGijcEHOZdlu96xkIdXKOqzifxkEMwukMDfBcUwLiYOC0FcQSGmPnl/kZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo09o0f7cArhs9nmYI/Ipzy2U9tnqhbP6xrDVuSq5UU=;
 b=ftZ7RQPF4l418ZugN9mfsOB1cyiONywFlv9usqDYuiBEJwlZzU32eHSI4JIParzCh9SGDXHN6cWq1kwlIDLPaSxizIdyGgvwYewi5DZyiZmFRH9oT0oRauoJoO3NBhRLH0zbrIECMJSw6/eTCOVqCpmZxnva7RA4kSww+YzgIFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1530.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 07:08:40 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:08:40 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
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
Subject: [RESEND PATCH v7 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Mon, 12 Aug 2024 16:08:23 +0900
Message-Id: <20240812070823.125-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB1530:EE_
X-MS-Office365-Filtering-Correlation-Id: afa22d4b-4c2d-4be7-f0b1-08dcba9d9831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SMBxUSIFKSYwGXU/N7uuxppeaK3l92GET8sG7zmPm+4oC/U3/mUtXeSL6ts8?=
 =?us-ascii?Q?MohGOPaz81fj0hj6BgU1hyJjvVnfUAU3D0gl/WFCeh9R6muiLaB1LzWTtwdu?=
 =?us-ascii?Q?mc5dIs88pVWUVAOv3oD2d84Hrc2zgYLvNg7clfONx771vfEGxm84lAHeb+Dd?=
 =?us-ascii?Q?ATWNx1Jpu4VAWmsuasRj3fMyT3d5YOyo3bUS7iACVoD7N4NeeBuav677rbmJ?=
 =?us-ascii?Q?2Mjd4/pj6GGiNilYuOzhCx8WInbpMovStA9Z/xVoNUc3gswRC2c5AXyAhiJ0?=
 =?us-ascii?Q?QI9UqYvdZs2cRpNwXBJzZIrHp/+dAujzx0hoVj+m1di316Arayuc6brHb504?=
 =?us-ascii?Q?yWxAcQzjF2nwYWt/9wllAj+8sVf5jiaE/+hqNKN255x+C8kjL7JCobX/Y8R9?=
 =?us-ascii?Q?qCi/XRn9Po4Qo+lGRhq+Eu0fDzGKFPowTnQIK3GC4jR9gi2fKaE5W+1ApmNl?=
 =?us-ascii?Q?dN7DNEg8dQRq/HZX3mxqZbi19/oPqtb86Aty/Y/7O1ChN4viBlj2xtdJLaFT?=
 =?us-ascii?Q?2oL0ZgzcPmDLFuJM9jheg5iZd4M0ERbJHlmug/yArIQPyRAX1PRZOSEIZbZS?=
 =?us-ascii?Q?GCp8cakgmY41OkteFnZElW/kmJknFpTYxXAkVHT7tz3hyBkqXb4rAKEUWkNm?=
 =?us-ascii?Q?L9XIKGunA0lXBujinI5/UjznFpqk/FsoGiQ31wBofi+rjf9XM+yV3pi/TBEM?=
 =?us-ascii?Q?C26LKe8u669Zwx4L2iYSLu9sFWmfiKtdHEzO47HI4IIUNyRStMZtB27XlAGW?=
 =?us-ascii?Q?XRJ2Dp44oRkg7IRVA/RqvdeA6gi4xrfjQtOC/BAAscFNkbiIdNZX0A10OdPF?=
 =?us-ascii?Q?ZSRcw87yNv0loXncUHc9HR68Y4SWGYpJZGldqVNXjd1r6qXfvC5wdAL+d9Z5?=
 =?us-ascii?Q?/NyblqSoJFAH2oN3IDVML8h7HicWbRIirvVS3cWIJtaiYiBiFIK9dY4JrPc/?=
 =?us-ascii?Q?6bXpDXhLNxvXu0z529HKuiSdqzmNe4tSf++Ip7pDxLbDmBQ/eteeRcwWljK4?=
 =?us-ascii?Q?5KYlh16N9diQ/7RZ+LQK5CJN4rF3573vM3bVyzfv8ndOWsGyM2XBzZoV5sS0?=
 =?us-ascii?Q?XQHzsYgYamdAFB3IVFI4f9N3GPvAQ72H5C2lWFMsQViAJpVPv4Q8VL+kG3KQ?=
 =?us-ascii?Q?x02yG8CyWlVHN8Pn+GfV+F/8J9BpqnY6z6EYPNM1BU2xCn705S35GV0QkBoj?=
 =?us-ascii?Q?4ofWSOixUa01QxkXVmPyBUAEuZC4HpujsDAV0YL+ESh+qcx6men7r1fdGU76?=
 =?us-ascii?Q?jutdXg3VLE22cnkvOfvIf54g+ziVM6JSQcGnmsnRGeQqay7T0Y3j+Cle/YM8?=
 =?us-ascii?Q?5vVv/0PCNM5OVhTY2RgaeNG8yQMbFGh1RJ1qVCC5JcId3Xf1Kfj5YQeIPOwL?=
 =?us-ascii?Q?60aYvVkz5LfEOUe+7I8Lw7Bmx8qRAoaLKPTU5ahfiR+7g675ZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q7qXYoImupgLF/9QlngaqbMixYUJZbMvvLxTbqAr2f+bXHsisQFAHr/DQkOA?=
 =?us-ascii?Q?etWbKCfcGuBDmRyl4Kj1dPFpaYyccdLEzezCF9ImxF73/PmUBqG0nfDLxJ9A?=
 =?us-ascii?Q?PdoiX1iN6rkx39MbBHbsraXyI1egxLO+4H7Y7CDyJRsFgyEgUuoPq92YiC+p?=
 =?us-ascii?Q?6IvCq2LqF+2sQN0B+qLm9j76Og17yuTkTLaZRUGWQjblE40aKM/ch0CFeok3?=
 =?us-ascii?Q?LGxG0KP0FJXqAKMwN+MqK0e02Vm0qpelrvC9ho8SfwUynLYO/HFY9Wks5usC?=
 =?us-ascii?Q?kljUutofiDgVHfcdVwOWZBtN0AuvA7z46cYG+Kp9a3umMa6Vz989FPh7NezE?=
 =?us-ascii?Q?s+/+g7iIpZUxm/82XSvLa1VTv0QqpXjzf2GdCWRpeYOztof4eOkLW2C9ytca?=
 =?us-ascii?Q?taticfQ207zmP82//zzPDkgMRNPjsfvPy1o5/pGLGqclvQnVn/zJOounq6iO?=
 =?us-ascii?Q?8UXBJvIkYTWV1WTHWmjHFKMzPQfjcjnqjD7vYWo8o6APWTvHnw/EknMbiE64?=
 =?us-ascii?Q?LtDS8Kpj1A89WnqRv778pLPLcuLn2+4JSJeUoXvVmc9+/3kMibtJHAUmfw9x?=
 =?us-ascii?Q?Zh0cdhCzIzObi/Z2VT2bPBQA/Yyo6srnp0C2PP0XyBac7izg/8anR+LQpNHw?=
 =?us-ascii?Q?u/bgTwKnMtGYMuF/4eNzua5JrFUG5StgKp1krOt+7h+H5dqVapj5nMCrM4zM?=
 =?us-ascii?Q?BHH2OEFpSqIwNw6dSXAUgB5aVOaveScKJFHkX4o0bEQ4Qt5jNdWUDIhZ5aaH?=
 =?us-ascii?Q?3xw8DnhqnNxWlFKq21Kbuz/TZCKCY1Q/mQImj/urZgbuFx4sGOtH/ZPsGeOP?=
 =?us-ascii?Q?zE4hUCyhtUkYj5/vCu2c2iT+3ByFbg4gfdXPgMIR3D/5mGFDbqDnu3wLkm6B?=
 =?us-ascii?Q?aE2xY/wD6CKxJZp/f02tD+5VSw0y0o2d3mMA33w11252qJgd3a764qeaLOdD?=
 =?us-ascii?Q?iUTiWRb/a+PtT0PlDhcl07tMuaJZeDpKX/z92EUrC3XcYA/9JlsI8Uzb8sBU?=
 =?us-ascii?Q?ZdMJI/LKQIPmO9yWMISNQLy8HagySQp9PTAROoNK6+L8jjeVWzfASxkZC11A?=
 =?us-ascii?Q?htfGzvVUfgst20d/Wr8/loiEz9J76SjJwPMBuk9aMQqAeSpy1XV/SO3Lkgaf?=
 =?us-ascii?Q?gKWAuKfYn1IaatAcm2QpPNPMO60E0aNUfUOtojhzL4zyH+k5l5ZiVp4rVjYl?=
 =?us-ascii?Q?NxJ1bNSNcMKum0NoYSlUZcJm7WBPvU/GFCyykNisODukQ5oBmR25CHKrjOqz?=
 =?us-ascii?Q?51NXv/kLeOfRkzagglLFTQ2UCUC/RX1mWcT0ez7gpBD0yUyePP/hGhs5ixeg?=
 =?us-ascii?Q?DjMFV3WbFhqUIpcYPbIiucQykZN/AxXdHDsyoqLuTQ3AzjX1ynwgPMekuh+I?=
 =?us-ascii?Q?oAR3M5RZ1Ne1b3fyv1ekgX0gMSyfrAySJuEv6eqtSiGyNwlJpCiEbvjh9nBm?=
 =?us-ascii?Q?mMeKzZrpCW6ZpvTzQV/kiib3BHgZOQVBqOtdILYQRYtb36vuqVk183Aoy+J2?=
 =?us-ascii?Q?sxjA6qTZJirO3VqD8pxcx/mioA1KY8MGAEIfAkStQh4EzJqwAm6oa63jGBoh?=
 =?us-ascii?Q?aWmFeMywn3ljJCRfIoSvXUQcslja4S95ySLDzDWErURvnDLxeCYy50nxudm5?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa22d4b-4c2d-4be7-f0b1-08dcba9d9831
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:08:40.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+1hOwCfD+GM2E+gnmlo6JUD/faDZSo0+lk3ZZNNDUNii7nhHEoiCDMIGh7oJ7p32gHF4Qa12bKGY9nKug4ANHXGPBIxiWwVcGmzAqsmw8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1530

Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
NV61M raw pixel-formats to the Wave5 encoder.

All these formats have a chroma subsampling ratio of 4:2:2 and
therefore require a new image size calculation as the driver
previously only handled a ratio of 4:2:0.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 89 +++++++++++++++----
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index ef9aa1562346..4e1c8a4e7272 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -66,6 +66,30 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
 	}
 };
 
@@ -109,13 +133,26 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 	struct vb2_v4l2_buffer *dst_buf;
 	struct frame_buffer frame_buf;
 	struct enc_param pic_param;
-	u32 stride = ALIGN(inst->dst_fmt.width, 32);
-	u32 luma_size = (stride * inst->dst_fmt.height);
-	u32 chroma_size = ((stride / 2) * (inst->dst_fmt.height / 2));
+	const struct v4l2_format_info *info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = 0;
+	u32 chroma_size = 0;
 
 	memset(&pic_param, 0, sizeof(struct enc_param));
 	memset(&frame_buf, 0, sizeof(struct frame_buffer));
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->mem_planes == 1) {
+		luma_size = stride * inst->dst_fmt.height;
+		chroma_size = luma_size / (info->hdiv * info->vdiv);
+	} else {
+		luma_size = inst->src_fmt.plane_fmt[0].sizeimage;
+		chroma_size = inst->src_fmt.plane_fmt[1].sizeimage;
+	}
+
 	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
 	if (!dst_buf) {
 		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__);
@@ -480,6 +517,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	const struct v4l2_format_info *info;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -501,16 +539,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		inst->src_fmt.plane_fmt[i].sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
 	}
 
-	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
-	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M) {
-		inst->cbcr_interleave = true;
-		inst->nv21 = false;
-	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
-		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
-		inst->cbcr_interleave = true;
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	inst->cbcr_interleave = (info->comp_planes == 2) ? true : false;
+
+	switch (inst->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV61M:
 		inst->nv21 = true;
-	} else {
-		inst->cbcr_interleave = false;
+		break;
+	default:
 		inst->nv21 = false;
 	}
 
@@ -1095,13 +1137,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
-static void wave5_set_enc_openparam(struct enc_open_param *open_param,
-				    struct vpu_instance *inst)
+static int wave5_set_enc_openparam(struct enc_open_param *open_param,
+				   struct vpu_instance *inst)
 {
 	struct enc_wave_param input = inst->enc_param;
+	const struct v4l2_format_info *info;
 	u32 num_ctu_row = ALIGN(inst->dst_fmt.height, 64) / 64;
 	u32 num_mb_row = ALIGN(inst->dst_fmt.height, 16) / 16;
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->hdiv == 2 && info->vdiv == 1)
+		open_param->src_format = FORMAT_422;
+	else
+		open_param->src_format = FORMAT_420;
+
 	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
 	open_param->wave_param.hvs_qp_scale = 2;
 	open_param->wave_param.hvs_max_delta_qp = 10;
@@ -1190,6 +1242,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
 	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
+
+	return 0;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1285,7 +1339,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 
 		memset(&open_param, 0, sizeof(struct enc_open_param));
 
-		wave5_set_enc_openparam(&open_param, inst);
+		ret = wave5_set_enc_openparam(&open_param, inst);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: wave5_set_enc_openparam, fail: %d\n",
+				__func__, ret);
+			goto return_buffers;
+		}
 
 		ret = wave5_vpu_enc_open(inst, &open_param);
 		if (ret) {
-- 
2.43.0


