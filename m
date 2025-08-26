Return-Path: <linux-media+bounces-41089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 108A6B36C22
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 16:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB9B34E05BB
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C3C22333B;
	Tue, 26 Aug 2025 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RO0TRwQI"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012064.outbound.protection.outlook.com [52.101.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23999199230;
	Tue, 26 Aug 2025 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756219978; cv=fail; b=ksvlk7MuI8dUjKCdWpnwrcri3WONk5NN/fP9coL10m3R1XjbjvBbNWifoG+rwnlLKgRJeZGN1KqjjNzBBb9WLBHhwGrlVX+rRJtkiS5mm0IQ0T1l1sbx7JAWILEjTmeo0uqDIHZLaLm4+oaAWIUixWXGsTSGurCVpkj7bwK2qrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756219978; c=relaxed/simple;
	bh=tCyHCP5TL9Bxc4i0ALCvDkm6iIfipVdzFUkpRDIyLbM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=k6KlJu4jOHXQEWoLsgBWDDT12PiEr7RISTEwmKOU6wSFhi3sCfXdUs4xuk+6JxJ0+vcCb6aKGvd27KCtBTAm4unb8ptMChIHJ9PvBd6mNsONif6r1yoqV/uGMwW1/Oql2vQfWindv38CVeThTrMtkUIYpSYK1L2Wn343a9JItS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RO0TRwQI; arc=fail smtp.client-ip=52.101.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOXycwqfEwxr7Q70XwDFVudRvjgRxi3PZySl7IJ/wEq3DOHTDLQGKHALno4xTd42dECFDew/budURNG38lzzeXFKGXkQMD+Z0fvKyiRwG03pitYyLL84QIGOZZE2Uu6ypw9lmWFhrv4I+ZckUNx705BoVUj+tUTRz/ekIjbT4keXxnwahh8yqyoOYLkIk1Qc5AW3/W0in6F5uTJj+4h/LhrfLQVR3tq560qCJuRUsySntSvSuhZ5nDEqsEUiviq1VMoQXl6NyePb3u00RHyzrmvpOBy+UsMZPP8Ja5dnbmEB92/VKvK0pPXkIljN10lr2Ek4d1ZNUCaR4XEHNzrj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r67kMV5Vnd5TAVo/ElODdx0TysOlVEINMUB8YjEX4k=;
 b=vz+oD4zU8GOHZlUL+vy4G7X17jM6NzR1SBHpZkAE6DLYvdPYux6p9Tsk2KnrgE4P/4wHSV7VDni/Yse6RYuT3lvZKg0PHIb0fsGrSHKBMRzLrG1LxOmrZhDctXYEswiXqhCF64ivowpan/pjHZ8i1lmZi2ajfRAsf/5ZGzhuzHW/pKPqkAH/ogx5lFNnStBnMU+VTDL/dhd656CeYNmlNlDF+UlMWSQlWdRNzsggrD2TTZc38WkKxiddA0bp6Y5PkOA0xU7Qw8AokAZt4Rozw08uLbd5xki6vm6fT8+q+iNo9kXP45HV/wf66inPGaFF7WCG2bN7jac0OqbbthEB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r67kMV5Vnd5TAVo/ElODdx0TysOlVEINMUB8YjEX4k=;
 b=RO0TRwQIgVwaE4iIkwr3qiWslbHjGQbD1YyuRs3PrV9akswUk9AY6RknLdh/eg9gA4FMifxerLbjHYAip9a3qYVFLUPloyACH3Nh3lvq8qDm7Fv0OmtdsLpy83oLddyVvUBNM7sGFNPrCPPECpXNlWpnaFTzAUhWmUOcknfjI9YuU7cXQSMr3GGoepJxc+cHP3/W4++Qi/lpW+FxcNLdmaKIAnIcOsu9fcyllLDcpkcR5cxkVC8dAr/lgq93QmTxL0A/aBLtCfFuC4oYAXoSboAb6iFCANEEaKqmn3s+Vwd+jVEUleJiDDTCmkk2kwo9bjeWuBZTClv2SUBsG69bsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6787.apcprd06.prod.outlook.com (2603:1096:400:453::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:52:54 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 14:52:54 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:WAVE5 VPU CODEC DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] media: chips-media: wave5: Remove redundant ternary operators
Date: Tue, 26 Aug 2025 22:52:43 +0800
Message-Id: <20250826145244.534693-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0151.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::31) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: d66bd62c-0ec3-40c7-3c33-08dde4b03d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0uWlLvqgn96OofV+5CjmNy3HTve75n2Wbj7y58cpaffqCy8scOdg/bRB2oOp?=
 =?us-ascii?Q?39+8xwAQhZQnezYwjsR/h0msttvNHmzvmwYL91ppyUQvkifGTy4mu3zzS2nB?=
 =?us-ascii?Q?M8oZgaJmTxUn09i6VGCtwfsP1KhXdN+sffEon2q5theicAoz23Jy5qRBzrC3?=
 =?us-ascii?Q?QneXX1ceTVfhE0iC5QrSMHkmZNslFMIhiFnYlsHZL44yE950vrwFt2TNHvbh?=
 =?us-ascii?Q?8/jGNWvyO0oSQTM+iy7QA/QbqeQq02knQ1dBbm89DLt4zSJ+IXGG64gJeZpM?=
 =?us-ascii?Q?2hFUCdju4ZfI2GvMtRpXkoxyjjAZ8jO56osm8ijfRJxz6XAwPF4jxsSiB1DD?=
 =?us-ascii?Q?qYOxbMY27K+OZwJe5bTyxIwNrNeBrYb4h5OH6qcKn6DIF5grfRsb2PJzRDRb?=
 =?us-ascii?Q?rYTpaPHV0c3FHivx4YtGL1jaKli2hdnWUbBvI2QdxbykhdYCOAexcy1WzY6R?=
 =?us-ascii?Q?Z+l69T12/sZBlZA7Afx5wTQ11gIcbIk0X4XWx0T+7Jw2fzCbhvBtHPz7GY6o?=
 =?us-ascii?Q?/iR3dbegjYmL+2cv594Np4ii/pMtdBCnKVnUkhjyYgm203G5dkRPI6z/tRAm?=
 =?us-ascii?Q?vJRBWP7CWt02Xa6y3OQTccBfa0lmDjAdBAkzpMFLuvleosPJXTsAK5XWwY2u?=
 =?us-ascii?Q?8g09KEGDDr0ttshici1XCRhq+GOoD1UMvdaOnDXyDUx0a/wNa7tY7KYZ03iI?=
 =?us-ascii?Q?uWRm8nh9XR3ZU0zMrufgwiABUpVkbthfPybWMKI7WiBWu2GZ+ABICCeyk7z9?=
 =?us-ascii?Q?onheBYpoI2xdWf7/I62ajx+vkwXn7jtT1vaVhJ/hOTfcm1i/j4gcRRXnDoKN?=
 =?us-ascii?Q?QJZbaXxNjw4CuT4dEnRMw4nsKl4MOVNbIj87tf0I5Tx23ef4CLHw1XxnpQRR?=
 =?us-ascii?Q?NSHGX4uV3hNGPZ4LyMJuJz3iDOft8R2q9mlo4Ed0nf9DsIXFJgtK2kHCBG3n?=
 =?us-ascii?Q?RLweiqg2NBoTVm3yO9FmpxDC+oqywdcIQS50mqLawCKM9QebN2NQkWvFewZx?=
 =?us-ascii?Q?V2om1+rasBohE8aunLNaWBanRmRepmpQhfIELc4jf+2OsTqkYwtfIELphAiD?=
 =?us-ascii?Q?nIvAAregDIvm6ys7UW32eG/01XmH47h/Bkr8MJwbwGDo0igNj+hKZg6X+2T/?=
 =?us-ascii?Q?htXG3ttvZj+yroetqG04L5GmXHj5o2L4i2o6ZxheeJ6gm9rW6Ts9A4191vwB?=
 =?us-ascii?Q?yW6KjRajUqiuBp/aVzAnbOEbfsf68I4fGQnI7AKEkU0n+40Z1An574xVmI4R?=
 =?us-ascii?Q?4INtLpkjaaUxd7wgrYW/bbv2QjgEMYjI5pY0OqlA6QgoOLebytuzjihfzDAL?=
 =?us-ascii?Q?uT/PdZBi55XAjIljLgPFqhe2NIZ1755Gtuis4BdPoK8Dn1dVMe41aqfUzw3o?=
 =?us-ascii?Q?FudfBllQH1rKfgg+lpAlqoR9omFzkL555CtskxAeQB1qXy+T5YxXNoVqGf0N?=
 =?us-ascii?Q?zls7KwpbsQNb0Br2ioIEZD96O6etyev/jMs2hcLGvVxElGVP5SqevQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IZCmOcUftABmX7Kx3yyLWMkUXDwtwYVJuxFFnP38zH7mw0t7qeAAoo8GuVJr?=
 =?us-ascii?Q?UAlttuiaUYvK9LX/pmgPBAUrYGciMdLSiRTCixRmpR6MLVQPfTJzj6Ud8d5Q?=
 =?us-ascii?Q?F1kNmIXxyeZkEVE/I59dIcD8nYIT94z5tigSyjEJZHUOWA52ffkxp3g4ms3v?=
 =?us-ascii?Q?37hyfkD3IA6YNnwW+nPFMhueWRKCoQ2RJEDloygd29575MDjIUV0ub9fDKyl?=
 =?us-ascii?Q?NR/ee/UT/XviBWSLkfdC8UbbSOwqtHvxqozF6ilNIm8/yo4z96VckdnDX6lW?=
 =?us-ascii?Q?o+EpoC9MtrPJTtUe+nFp+5mAo/EEbIYAtXl3DoXredpenOCOaIWMphhoYIEP?=
 =?us-ascii?Q?1NxgQRXsPtVILooPD1iKyVwRRsV0W5y3CbdzjW1TkfUyY7xhdxKaaJuINg+t?=
 =?us-ascii?Q?qR0oF2AF2dDwzYQYqB/+pCPCwMAQnTZa48ZaUesjcCYkigIhq/ZtuL0xpu8u?=
 =?us-ascii?Q?X5g6JDylbVTXhQivTkp3Lc5NwvKh4vqQdjvjzv3nRCIsDiNXgRvsSohw8r/v?=
 =?us-ascii?Q?627qOibCB5jP8eApknxF41y+4+Z7Fw5wRhtCaebO9umxq0tGN40jGX2qKn39?=
 =?us-ascii?Q?mOTVZCnDRT8TuaM3EGuhxz6zCY0RAC/Nf4va2wmq49glk2UxJMjH1Dt78u/H?=
 =?us-ascii?Q?UgCTXisEmgu1g4n6Yf/I5FnRdXZy3Mskglf9SNB+4g5SxXdOKHZls61745nu?=
 =?us-ascii?Q?snpbhazywztBp8eiX0Au6D7YRvq4eUWLf3X9qla0DrLG1iSl5LgmNhcwKXQN?=
 =?us-ascii?Q?l/mphkQ89Dz/yuy53XhE4pqSIJFJxwHroZD13vSC184daGyMnvlNfk/53rv1?=
 =?us-ascii?Q?aCx5HBMO7saw10IsFPskGN1E0rAbCNM0JKWifdBMtwtqvvpUKnZ+vMUR7MTc?=
 =?us-ascii?Q?K8TJjSnViACrncMu4Yt54Zb/ZpEK5QENUAoJZhP3HLbyrBanrbh33qX8cui7?=
 =?us-ascii?Q?w/gRNpw2OxJhTbgn7QPU32w7zlOi5/Qno7w1BxAHPPZ/Ehsj7uwTfd1rgaQp?=
 =?us-ascii?Q?qu+SYPLFfY4k/FUMyDlCPWYkKAQWUVyfIfA9UoUVcWqJtkNqz6EFYxEzeYiD?=
 =?us-ascii?Q?UevYpW4NM01WG/a+wb/mEvpSh0mEbFJp7e8vYx2MpsHq/UXm6fsAMNclzxN5?=
 =?us-ascii?Q?ijyyFaxN6+iZI74ZVUmtjrY1gWea28u5rjtrZnQkOsnxHuUc+/J/f3tWnoOe?=
 =?us-ascii?Q?xnKT1ziMCSbUPk1cAQMY7FEzbx19AHFLMEjKkEQ9F0hHnbNc/BFfRiPofu76?=
 =?us-ascii?Q?sh293lU/Mayea9Z/jGG+4tUjYGNEeRS5sJO4w88g+qMAGB175XupDKN9+tUP?=
 =?us-ascii?Q?R8ZyAOz6h9Rb899gY8vUmoHV1CZX4YSkPbVEoWcvhW42N2KwLlwHe74D9jiP?=
 =?us-ascii?Q?5OFnDeaPHqmHTTFx6jXe43RCsGCQsuSjUQgYA9czuxA7pePJh/YdE5gO3Nqf?=
 =?us-ascii?Q?VGMiTPLBT4jcgkZGZSd0YbcYppUy4+vqv4DgboF7dEKE5qxYfvcefq9IaJY5?=
 =?us-ascii?Q?cyrEZpbc64JyGe3EEFVEbOvRqJ6RKGE3ZCAA3zfa8FPEIZq59cWG9oEc6ZhY?=
 =?us-ascii?Q?SXJaF+lbxKHrp2fQNnPs9OoqpFHaVHyNGDOA2Dzw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66bd62c-0ec3-40c7-3c33-08dde4b03d06
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:52:54.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVtrljC7ovVnFXE7JUAyZMM0i92c8//hqrBVxPEo5FTnZrROaK6nXJhAji9b7GKrMJEY8VpR9faYspOvMLFxHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6787

For ternary operators in the form of a ? true : false, if a itself returns
a boolean result, the ternary operator can be omitted. Remove redundant
ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 3f7521fcfb54..9bfaa9fb3ceb 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -543,7 +543,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	if (!info)
 		return -EINVAL;
 
-	inst->cbcr_interleave = (info->comp_planes == 2) ? true : false;
+	inst->cbcr_interleave = info->comp_planes == 2;
 
 	switch (inst->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_NV21:
-- 
2.34.1


