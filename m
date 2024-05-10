Return-Path: <linux-media+bounces-11281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D696F8C1E88
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05FB91C21500
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2616515CD7D;
	Fri, 10 May 2024 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="HiZ4I+7L"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BAF9C9;
	Fri, 10 May 2024 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324314; cv=fail; b=FumJeCvBE/jH0EkvSBu4hrZoir9YyHSVdlcSWEPkQu57UjV/+vorlIHia6Vm0J4g+rjFpiHMn+Nq6IPkKwyJ7p6FkJcd1Yg/r71oQ4Pw9ZAtkJzgSDF8oE5wu72rI+7VTvjUjjVmHF4jJyVqmtGeBKFxCq95Sj2ho9HuhdR/shA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324314; c=relaxed/simple;
	bh=lrEi0r97o8Y/xoHGwh+4ip2R0DIFHkyP/JQtkN8aDZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mkPQqxEJdA648+0dO6Oafs6zUjBoP8KhneVO3MxZwnMhMOvXO7D3+jgVvuLewWSWwIiaodpdeyO3YpZLJuOWSjtBQKDf4o8uS0gys1ltDLW13kHYeG0RzVsZaZZrBPl85gVvz1MSa+9FAPolADyg1Mqou0oBqKRBZnXcC7KqtzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=HiZ4I+7L; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TE7EgQYSxjV1Pg3CMsu7656JYjcAzK+XpBSpykjblTLRxmXKLi4dmgzqXaayIpl+C4N8OYIBuCNdxTfHF2YQKX5blD3m2yXQxdYUSqYsVRxkYVuP+0SIN86KELhS7Q+lFbLMFpdAaMONl5yXxKDtQ2vsI5Klw42lS3Hp5yGDc6k/SR0PLajEE1Xyr5i03KrtoFeZRLMFfEhFEPCi9Q2z8frdkk8tsh/TsgPEvL0q4hI2BX6HQL6Xj/4FZ3bSlSCd8EUEtpgaSXHKvzjTu40zef/t6ca/0gYwKcz/InqTDVAOM1GnexLwC63SeAkcYunPDCkDgrEHnLShD1B9cYgnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vACLLSZhrmTQO90kzFV39ILswOgXNXFuEX/8TwheFwc=;
 b=HEFffC+U7DkQ72fTkN9AuCisQSKTU7z2J4njuaWs1LGCoipb46kbsO+U+J/7k7+/KIaWOE429/TWNTAKqYYHP7RbuIHe/jq1lvz7On7AHzxaOxMDHR7fJrJXrQdEkdK1fwYVwKcu8Rt59tLzxenM0hdNseraKRagWHpkx5k06xI0RM2m7pvVmFD0LBB8K7qavTWRnFBOPigfjFl1HbA5iTufagJlOILGe/qkoBUrNqDP2I6zgfRYgF2IC7fyg/KjcdGS6iScPMDE/h6zRhrRTgS6fFtjk2awqCWOyZuOGy4e4Neqk57ipgSLF/C9l9qGU1fUDM4z9494xKn8P1imig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vACLLSZhrmTQO90kzFV39ILswOgXNXFuEX/8TwheFwc=;
 b=HiZ4I+7LGCzQC40Ixwt4Srv4+n1v986AuVlbnvSk1ykmra8yWUAZ6jwD5lIdptKVsHJertIgLRZ3ZxbJtrn+OETc8xlWoedCu+fz7imgbHAMDIOUNjuXu5Evn6gSPv19Y8fdweomithiXd6RQQmRoobbdKZnz3wJnjGcCSHnQdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2247.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 06:58:28 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 06:58:28 +0000
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
	jackson.lee@chipsnmedia.com
Subject: [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Fri, 10 May 2024 15:58:14 +0900
Message-Id: <20240510065817.743-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
References: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0033.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::19) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: ae64c846-3e84-4f60-8393-08dc70be97c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?srDc4y0PpdD3JNAHe5xY0UKXFkdxXNAjjqLzMZ35H4sGG+FrJggXMwd+XRPd?=
 =?us-ascii?Q?ClfkDzNs4WDrytwmYOFdAmwkDx9ZDKcim4S2aRXGvvCp6yy1T2w1mN6vZqaN?=
 =?us-ascii?Q?ZxToUju3NgOwpAt65AxtsnJVCs1njFw/d2bSN3B54VrMbi8AK/AY14xipIis?=
 =?us-ascii?Q?w3x6zG7TQ3I5dp+oDO8ejUT5bq485dt0knhefi8ngKSfcdPbh9j7Wj6p3KND?=
 =?us-ascii?Q?i6UH2bxatckiDFNNeHwbuHdN37g4GR0+FG21H9YYLvK7wdzAG98XLKmvA5E3?=
 =?us-ascii?Q?KXtCgXs1YO+eY0LSsPdzYPKJ0LZjnXd49FUSuDnbOdjkVUk0Swyrs6GKKAKx?=
 =?us-ascii?Q?N0m24Y2+DDh618g23WMSr4FfBnjzL0AmELekwlNkTnBz5Cl3Q2GzkhjWOrJm?=
 =?us-ascii?Q?ZcW5IJAl2XKXTA+LlOEnESRVCiVTFA9frS3sSKfApv/sCNprqx/xGOJLbZnO?=
 =?us-ascii?Q?5YdP9eLacGToyfJiZIfagu+18VzYAqgmv++2NJCyj8yy0qSIgH5paGf+T0HZ?=
 =?us-ascii?Q?s3EJzNqRtV07D4u2m7re6CAVPBBIrGYfeFB3PxJTtAL/T196GB9utcDblLdM?=
 =?us-ascii?Q?xJuKcoWkpWAHTFUQy9ZgKZBTif2XGwa76U12Hnk6+XlOam41fG6J7TZjlqBh?=
 =?us-ascii?Q?Jgzbt0eertcIdOk0qSuh/jQ98bcFuO/oeUMWRaLM4r53n22Kbd/5vxWJA5Lg?=
 =?us-ascii?Q?0b+tC5MnKeNaO8aWY5AnYLbnbEXJ4na8RO0VaupFG3Pn6X4RVZ5wE5ptkq7+?=
 =?us-ascii?Q?bHd/mcKhuxfwsbIdeAy7r7OA/amWb66NBi9idqDJfa53jtcBx4QA7uw4IlG3?=
 =?us-ascii?Q?gBnA6HAuytScld5YElRFpB05K/S27UKW8P/8i86tCIaKn25SC87KIC8Vtupt?=
 =?us-ascii?Q?R0WjgK4jJwu+QwR1JbHUoWpEqXkEPayaiGH0PziVrE5yf/FBBuiWf3brVWvP?=
 =?us-ascii?Q?it0K3pB7Iz3SfDIfJGw2mF9uw8aIGKnxJ9eRq7bH48kBScN7TjfEZHE13JrK?=
 =?us-ascii?Q?LWlOPu1GCE/2tqg0Mxn2Tu/Zdfx/uw+94n5py+EH0rYN0enkSZnFBIQrziOa?=
 =?us-ascii?Q?2tUD72th9uHDIJsh3Z10Fn1g/KsuCkx5jfa4jR+9hamGr2W4TeXK1PVMI7Ka?=
 =?us-ascii?Q?UpywUpZ78Z/eHIgguJUU8RIXcleXioZU5Z1bli+mjyxpIzlDPMaKxsIVAiBt?=
 =?us-ascii?Q?X/dtL6Rf7uwgFaOZRt75tCxh5D96n3u17PfpoXP3Za8w/WPUhPkPzCz89txY?=
 =?us-ascii?Q?8ONWb3X/izQnEKE1SVMAqnMFExnK18EdwkNVFuH6in0sS654Rz2vsIzZbNWZ?=
 =?us-ascii?Q?xSlzbxvSQ09bEejvz+7L7+/7fm3hzYaYLUW6pvKutUm32Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4HfdnTcsr0k6Vj+VJKPla8xms4BdexhKrFByIvGjSvQQr60RP4jgvWUzVDxX?=
 =?us-ascii?Q?WAEglEYICFln/1K/O+X6jbyIbd7fPWSKEgNscxoCBNQqvjYWfaUwbVwOt/Gu?=
 =?us-ascii?Q?zPO6c8kp+Hf4P1LhZkaJDcHV6RGnjHviaDkQSwS+6ZRDgFvZJe3HrOfY/O/p?=
 =?us-ascii?Q?Nnb7AT60WhXxSErCQZ3C8Rkq1NR9jHKVMqLklKZkHpw7cXlKHpcPHvP3eVV2?=
 =?us-ascii?Q?2ajc6ZSq2EVPNtu/XHmLpgQeyuMkCz5GEls4Nj+sx+YdYO3YU1EoO+nlbClm?=
 =?us-ascii?Q?C66Gcs1lI94mImU2TmXVD0Vg1IWsLz2cLBasnAASy2CKvRNpQkxpURmi8e48?=
 =?us-ascii?Q?ekqRMU01vfB5GG7Jg0pmrJt1VKd5lgj3XQsUB25lCjaqpcaHP6TWquqvIySd?=
 =?us-ascii?Q?0oGOVYENpAmQZ6BQoN3zL09TXD3hJ0ohtNIwyYAgfJQXa51z6vn7+Fzb+hFK?=
 =?us-ascii?Q?R5XkkaVk0CstaWDh0kQXmUM9piSvijmT973yXe8lvDUZM7gouVsV3N75mpRn?=
 =?us-ascii?Q?ACJTlEvcAA7pHc033Avt7XOw+s5iGIH3fEG7cd37ZM4SeIbcN8i10iHFPash?=
 =?us-ascii?Q?tbjxJMPegFwUpsbq28IqTQtAfCVofIbyWWkJThNBsF6lTxhSUZ6av8HDynvP?=
 =?us-ascii?Q?nL+WU8AB/j2xMXmlUkybuzBrBNHPhbp2U6jzHRu+wD3gpftv4tVd5JvvQWZF?=
 =?us-ascii?Q?QNA8hQjBQTo80uED4NWkTZpfdS9ytlP5cIfEFTPPTcO74nob7WyD9JozNUm+?=
 =?us-ascii?Q?+hUIsSi5ktdQwAu6ywII1qDFljaGfOXp2BTibkANgGVDeA86gO1w4IPiWf8N?=
 =?us-ascii?Q?vbfNGQXVBh7qGVNaohig6/C4ncKl+7zcDc1SURpTswZ+kk+r4A/IeX6O1kQA?=
 =?us-ascii?Q?QrTvQ8ZgNuNsRAPqPtvt/0MpW0CkIzzVdMthKSlJS0e3aNHSd/Yek/3f1P2c?=
 =?us-ascii?Q?Sax+6t7WYfvMP6qe3M9wgHaZ0ACHbA71pHZAxHtnH7fBEE+UjRaUYnMXiDLo?=
 =?us-ascii?Q?/nmZ5IedRON+M3ibjE+z9+e7bL1fKQmYyYM4/vQmCi9G0F2lJgfqVpWcWmAW?=
 =?us-ascii?Q?ZRXN1/S8bgapoWGhwWhylSX7/oyyC5GlilwlXDwY/FWlGUErMPbWTgPrrRZS?=
 =?us-ascii?Q?udTn79Ul6Os5KSV1Sftdtx93/zEPRpxzrP5oezoWVuPaozwMxnDlfDRn23je?=
 =?us-ascii?Q?5R0vrcPYjbwiD/dFMLy7XxGlGRpzdKIhXQN5Az1t4xphWhlvH7OA9XYUuexQ?=
 =?us-ascii?Q?Y9jJywSV29NMJ/c0x9W2TITidB3xJn+xey0mUKQ+5bkXuoScKTIoz7hBLkTh?=
 =?us-ascii?Q?DQblj7kVphpvva1NNbC7uRfoXCNXUt/xSfH45jx64elQtrS9xArsHUXOfQFW?=
 =?us-ascii?Q?tRe5oTYj5g25UdFevGq7niPc9yS1GdQK1N+HvF2s+b8Ggh1ox5n8loxmmWkY?=
 =?us-ascii?Q?WFnRpivzydvJIOtIwMcVVJNbKwdwXaKXBLsyOGBJH5npHwCACYAnAEAiD2oL?=
 =?us-ascii?Q?9y3Yd5b0cAJJU254PVyS3w4WUoVRycAy8u5XcwHwBL58ll4nDDopgLxrTN0O?=
 =?us-ascii?Q?XTlsLwjb7AsMMQkpkdJOLxBAyU58/xDyRSa9NB0Mu1sKM5jFB0JSMSt3Ll+z?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae64c846-3e84-4f60-8393-08dc70be97c2
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 06:58:27.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9E7XLRtv87sEAJmEw3oQ3Iw6fNTy7H1Bn/ll2Nke4us/3TwjXZbk8oDqvg8tSKjd2mDUX6QTX2ul+Uv5LvVaJ/qcieWm41Krk3lEV/GfRW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2247

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
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


