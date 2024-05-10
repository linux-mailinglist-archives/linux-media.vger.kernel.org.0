Return-Path: <linux-media+bounces-11282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B038C1E89
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BCB32821BD
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B5015E80C;
	Fri, 10 May 2024 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="MEkuebch"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20F14F9DB;
	Fri, 10 May 2024 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324314; cv=fail; b=ZlR8NlzYGhipdyEZVllEP2t1k2WSv157kB7FfxxTCHbS08PCsZcqnMm85UhHNpfMvYd2tbHhrmvjeOhmx8/oVtrPaY3FcEf6aL+j2BoKK6iUC986j/8h/1rzA6szFXow39qm9Or+soI9b92Oqc8fC0gvdg+hDN9amuL8BGNN2tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324314; c=relaxed/simple;
	bh=g7GnN3v5b7brU1xSRBE+yINneysTTH6RhFrDZCOc82Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvhj9rYkcRwOAUplYMKiVbKzWWSiZQRIBVOX//94+P+/AeX3c3Qiu8EQBjMZsDY3KIWWUTaUZv6kz/3FFcXHG/aGqGTo4EM1yjvdJU5xpeF21S5YsrZS8nzkWN7tAs5KV1U2uAIu9HhzdinnQ7o+1IJJH2z8eZES6dWm0f5Ds2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=MEkuebch; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht4frguCLA4QrfDsxVT2eackJH5FQjWbzaWQSbwrPVQGdIGn5KbpZ3NulC/+n9PW3yMibnqwfLsQKQTTF/Lu4rjViCZf3YtPaG/gc5lD+N1UbKw24BLXzR7Hgkq+YPO7w0pKwSecJxD+So/YUziHRZME5rxjgkkzmCXDDaQ0YLnPI5VltPnNGNS0L8CG9kCY5ErYz6LqaK1oPPpoGsHe5lghv4B+TNEhTEto1RstzuKoIIRBphbXlsId9RMKNgCVEVA63nkEaHZzSbPDopSVcAjKhiErCVAfqQ33vx7bt6+HqK3GSUNMr7iSrI9Jpfc8vYLIE0lggGvRl5K4ehRQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSBCqniFhGfdDtbG2A0I0Ml3S3aWDzVpm/x23WOZIfU=;
 b=IGv7lFetTu3TXGpxhgRxo/nLbxDdXrRqqM/gU/fpF5YzKDEswFSPG7h1CkgIIlp/9P4i8/12/IrUOVYvyGaBz3T2138j1TC1jSA/j7isbZaXobKhj4Re4DmVUCnD9mnm5QYj9T2m423WCkwXAuAqCye0YT1iNRryfMp+a/H40JraObAs9r4G9UkS5aAcf34drqPC/A8H/33nWBiGsWOGskBe4Br5eo1effz7s/NSapdQbh/aZe4NwfXqYIB4IlPenNFR8b7Es/pBx/T4fKF35tMOdVIcpnb7YQ2AW9kQUfjzU3+uSV23uIuKGEPWRC8IjIljhSgauv6EEXDGLMPLYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSBCqniFhGfdDtbG2A0I0Ml3S3aWDzVpm/x23WOZIfU=;
 b=MEkuebchaBvV3uNjUS5xgpi3IxiptVdoNcoAQsQELDzBscO8PhxyCXf441VkO85oAVcCVZODB9jbhJJvH13+GeBEyEvgyXiBCuGP61xT4iTEybSIVCy5ZnLn1dqk/bqQz2OZnvMkuqNeumt/pRCQwAdlq9y1XZesQzB1re1+fpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1826.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fc::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 06:58:29 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 06:58:29 +0000
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
Subject: [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Fri, 10 May 2024 15:58:17 +0900
Message-Id: <20240510065817.743-5-jackson.lee@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1826:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b5e913-2bcc-4a1c-6512-08dc70be9836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jAEpZAE+D7cFYbW6M34Wnv6SoWwtDbMCmgglZkxkkw48Rrtgl51TOOPBU58A?=
 =?us-ascii?Q?lYntk0PaDZUDrvw4npniNvVSDeXmsZQdTNtBnGBLRwg9rBy6p9y2CY0+vb4J?=
 =?us-ascii?Q?cl2LnKeVyhW+mAYujEti4IVboke07rUSNKfZ8/4fT9dfnBEeRCO/t060kx/G?=
 =?us-ascii?Q?cmPufUd1L/10mhbyAtIbJJsOfvezHoT4G2sTBas84CA5s7atn5Kw0ZqYbWRO?=
 =?us-ascii?Q?RRtecqCYlX5oJGNrXmO6iOPnm5EQvFcFGZtWvnUu1EmZ66afno9PP6oWUQEB?=
 =?us-ascii?Q?upZ35rI3LNlDngDy4kT+Lsxtnduiwc+Bre2Z1wrlcXkndAsQstySdGOVj87F?=
 =?us-ascii?Q?pSees4Nl8GbrAzBNAK4JDDB1lL20FwQ/TDA1X+gdGe3SK8HoEdaBBhG2NwvT?=
 =?us-ascii?Q?HCGcDoJYEmVJmrirN/tWGgLJG59PiS6N0fgIgC3kAckh5eh9QLFVS7Mx2AEy?=
 =?us-ascii?Q?WqpiT3t71Dpi75uSGhXkCM/zhovNxAyqm6jZAHyglt2RlG50WbRKivYKgcB7?=
 =?us-ascii?Q?R+SeLrIOQZ3loqNDatSYOZKCgTR0MJyjUU8O+ht7i1AWk15+pR/+hN+AgUgB?=
 =?us-ascii?Q?4lAp1fO5Ejiq1z1pIB14OD4PO3JDDwaSPGODXRK4aUUH7xQaQ/vmfMEQ19OS?=
 =?us-ascii?Q?8Mi/I+CnXowtOx+LhOENIaB0LYjf3EIMH3rztXg/oFHZyVpGiQLDZ9tz9coz?=
 =?us-ascii?Q?ZHG6y20IFbULAJ/DMNIMp+K+2IwhH1GvKhQLdim7n7gA14JJHIYW5SZm99ne?=
 =?us-ascii?Q?MnypYJvM5rkMuYnc23NkDLteSb8qmVIg0Y4Y2m2E96ziecBX9nZ+BFuVMYCS?=
 =?us-ascii?Q?AgMsIuSApfKoSNtAp9VfOFtfl6XBytjPPQoQ0XZAwsTZ1gNYcyzNx8TH+gof?=
 =?us-ascii?Q?XiS8oXJWpGErWo90QkEG1tmIa9yyt6BaFuoXX5QZ/JZXsHtL4m4wZLb9pIzk?=
 =?us-ascii?Q?gAmluhEzt5UQKJ+ngHgeoMKUFFshBWEoFZS8vDQWFyMETOoWvWeclsqEzJwq?=
 =?us-ascii?Q?y/kSlw/1Pc+tQ2MJXPeUXx33wpRVwtDvQwRh7jSWMxyO6QA8/uIzkZKbQAGw?=
 =?us-ascii?Q?T2WnoBA1UNkHh3n+NoE4DwJ3lc63C1J8MuNgiFez043TLHD43GOjG7Fk7io8?=
 =?us-ascii?Q?+0ZQB+KDErGTdNtjNwo/GkJhLNWOq62IUj1OUS6VSoCnV32wrJCkfUZOEZkF?=
 =?us-ascii?Q?ty0TFeqM8JXJGs5PNZj0GWYnjgb5pYcR53LhbAIQU0MJbvW1iByYoHh4AyFl?=
 =?us-ascii?Q?9Y4LQLVpCIjjFY9x6+q1JQHQDNm1ZcXS1BmYKdh0mpsqL3ixENraufEyd44C?=
 =?us-ascii?Q?DcDQjeCYeXNaicF5q8rXZZy8Ei3l7q2ewNOwSqP7/U0NuA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GvZeOFW1I7RseFastZZCeFHLIMTbFUpeQ5XkIVmpeGykkZaLA+kQK16WIIA?=
 =?us-ascii?Q?72GXpMQ9ELoIeJ5XQHuheBxt66Yy3j2xk+0MR1tASBFXdikq1+d4no6aqw4K?=
 =?us-ascii?Q?rI/frazKxmZDrKImvN2zSe6WraGxCinnvtbPOaEShGp9JKGBuyq+A1hiXGUm?=
 =?us-ascii?Q?ElRTg68lGKiahYV0LWumcchYTiXIgbqz6XKWqESZPVVgEXFaGo14MvPYAL7M?=
 =?us-ascii?Q?D9Tp4jW8M9FKdivtEwXK2CrKYaBMp+BPDRUYdTxpPMmBlnvp1AOnTb6tkply?=
 =?us-ascii?Q?RG89ZeEMFi491yd1f6j+5jxIvUdxzoB8MKe6oW/bXk3Zn1RcxA000uQdZfPE?=
 =?us-ascii?Q?TziRf8WqdjITLlq9X61lyf16846jBA8HMJf+04wJiUIAIylY1+GdIq2Be8S0?=
 =?us-ascii?Q?zIpma1kMN4ZidqnZEKyONv5tJzEAPfNCyY60EJOZeKEbEnYcxRp6euHrMN96?=
 =?us-ascii?Q?bWDEy4209ZBZnq2FShzW+reYpZmHBWSYz25bKKNf4B+yBP9/2wkXWJZ8kT0s?=
 =?us-ascii?Q?8sjbnDI8sOohBt/gUEHpdymdj57U9qiDdQCpbnt+DH/VgCOWMCZrwt446sDQ?=
 =?us-ascii?Q?gZyWAdNwBZRPsxpz9GnQJM0foTXW6dAaeNo4z+ZUvZYufPmjKmsVprzeV4P9?=
 =?us-ascii?Q?ZSM/ddC2C33TDzIR034wGkpstT4wjTKhs/oNcnHho1/0I827X976XnyiXsAA?=
 =?us-ascii?Q?QXP920soFZ+iduOFnS246PM6sf1ontoHpYvrL1GlNAX71MyfoxAQsAKmueKC?=
 =?us-ascii?Q?8m8jxYRs9z4F9dfjEwu6d9O1nMtkQUUHz0Zu09ybFf+8B/aCdM4S9WA8mjdq?=
 =?us-ascii?Q?ZAithzWjlDXEdIPRkjYf8Hths0THxWsaPaXc7He8rEhzIkAiXs8mEUXuSXG7?=
 =?us-ascii?Q?3LW0xlM9FrwQuWdmQtAz5tlupM4qzuv7x9U6gXHMg5BB5/HtiJWD8Lc00sh6?=
 =?us-ascii?Q?Zy3JDpy2YP2lMokEa15UJvzm+dtFCvG0adH7Ds+Zv4feQY7T0n33SdZgN7L5?=
 =?us-ascii?Q?osSWagNgXWk2oq3nTAs9D+FBZyWkAex690VdpMxT/n3+D8dNL31eiyR8fDio?=
 =?us-ascii?Q?VEHy1PDoMw3Hpfcx6pwscJp4mOejcfnSEFJbhVF0C2JTpbYj5D3bq3XpayPo?=
 =?us-ascii?Q?2cJuUJRkXX0W3C7RcLSCkCx56iPLviX+vSgetF4BXuhJpoqMjFLzFM16bsMH?=
 =?us-ascii?Q?Jt6CAYD5qaxBxcP17/YnaekdaaeaBbObJXkIL19qAynauYAvIWOA3Dg58/ei?=
 =?us-ascii?Q?OQ6gJotrKuEYFA7O04AjYyfoz9pG2ka3+ThR+mJ0FlmR2RSd1PJijs89pduo?=
 =?us-ascii?Q?s+1J4CjzBAdtCLOH5Nl5gyR0C8VezmxitAdbaJ2cBIWXKQSowuc/W1JoaoMg?=
 =?us-ascii?Q?7Ue4qJnm1jCQ8JUPocVagta/XCHCXIz9zGTD9EA1fC15C2HFun1W9yEem/Z5?=
 =?us-ascii?Q?osIpnVoXSU1XYzCNd13Wb+vcdresQ38Ndep5tXnZbtAyZjpQTo46G9O4vpE2?=
 =?us-ascii?Q?eH2Fkx77FADgDmdK9y3VAe27urLGkD7VaZbnRC9ERcquhs3QxaHFFXDbvW+m?=
 =?us-ascii?Q?4kMB7GeLCtt+xtEGlF9N25TktOUbhAzdc6+Mg4bG+DPTffnU9cDA5iE8VP+J?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b5e913-2bcc-4a1c-6512-08dc70be9836
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 06:58:28.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orDuLAgidwzKr3BiL+qJOjLt3aXdV0SJs7ZIKs/H4uX2LXUl3q6PTOnIexZkAxiN+l+hzmAPj3zrIcE9StN4tphxkP3ClNeAr7n346q0ceg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1826

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
NV61M raw pixel-formats to the Wave5 encoder.

All these formats have a chroma subsampling ratio of 4:2:2 and
therefore require a new image size calculation as the driver
previously only handled a ratio of 4:2:0.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 81 +++++++++++++++----
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 75d230df45f6..3f148e1b0513 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -66,6 +66,24 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+		},
 	}
 };
 
@@ -109,13 +127,26 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
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
@@ -479,6 +510,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	const struct v4l2_format_info *info;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -500,16 +532,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
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
 
@@ -1095,13 +1131,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
-static void wave5_set_enc_openparam(struct enc_open_param *open_param,
+static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 				    struct vpu_instance *inst)
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
@@ -1190,6 +1236,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
 	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
+
+	return 0;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1285,7 +1333,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 
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


