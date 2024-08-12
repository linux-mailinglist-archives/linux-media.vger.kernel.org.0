Return-Path: <linux-media+bounces-16099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB794E694
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BB3E1C21407
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 06:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47F614F13D;
	Mon, 12 Aug 2024 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dQkNs9W3"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021079.outbound.protection.outlook.com [40.107.42.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299C8F47;
	Mon, 12 Aug 2024 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723444176; cv=fail; b=JhuaNhEfU9Dw4riMYNXPpKUClDJH8K2JPU2yyJiLCoe4H+Lj2i37uYVOmH9/nSaOre51vy9CkbJTemJvALpTiXF1EIGP2qeImuBKDXX7RLa6geqV0UCdkAkzc1BfaCePN+J66DLEh7fs1NWDuuQ/l881cH4tsPwDQBlYqkKzbzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723444176; c=relaxed/simple;
	bh=kSDctqTnLEaMTcIwVIkXuc+h23dPmZ7zEJMLWdW9WEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RGospDe2qwB+QhsUsAOald1Cq+3DA8OyqTNJrQoE5Aq5lrvVB3f1MXAASuu4oTu0lWXjr4chixaU3CZ4UkH8g9JkoqflaJTlTzQkZtzz3KrAMOGqfsJELaUgJgKwtEN4YqcAuYIznOAC6BabIwTI602/KSlj3VD4H05U5TW9Ocs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dQkNs9W3; arc=fail smtp.client-ip=40.107.42.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cujPzahlxwVhW/FJFYDIpkBPW0Vjzx6T9I6RELzc12La/PX7xwC/Oow+Uylh6UvsBqjA+FyZqZLIJzctvcfKDSoT33Hxx4ErYUaSlDNa2R0cnJ3ZdTuG47rGTPMuM4NuNuFha7f02znqvGZCye9vkamPFh2fuzE5cduEwAQFcFMzvht8f2ZpUqP2zr4WAVV4xnN0vZ3oCAIsnbKaCaMWWTEbVQW9AUD0SWMTzzU3Wf0Xbe3bcBE+Dn2IsEIGCSYbTWjpWijURdTIPbQvwK9COkoy1gTyjFg0tifDBAvd6Y23PP4hBjkC6NSgvpoj2bFEN+0XGY+QmzvudDIsOJN5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWbNLWskET9h61KXYtOCGImr7d5KzHGfun3x8NvAomQ=;
 b=R0qSrm8if61XXP66DsI7Kv7In2xIUBYpolDSbKEAxo3+u7YTTwxMKlzu9QSXH720K10ID2v0KSmWSUsxjC/RR7JHGMwmOEWVpGCIsNpr8GannHlT9IGdol9Ajgi/tvfimaYSPeRGwpA3q6lPRXj2sFADBzxOzZqpmkpKDas++9PdxbEBU7x5A0gz3v0mgHYXpgAkKOyyJpS7e6Fuu9+5G0DBJX3xqbhD7wgpfojTvYImm9EhOKXie0jYi8fbAwg1N0ZX+nuoFzNoUu70JUulJOxNzfZdx6Y6msg4k2D28bUagjRuZDWBpD9mNnJJ67H0TWCIeVfgsyW1ZVhDQ3Xxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWbNLWskET9h61KXYtOCGImr7d5KzHGfun3x8NvAomQ=;
 b=dQkNs9W3iuOoYTf6tEQyxm7O0d5RfY5NNaW0QPDrEeuvfRZF3t6/XjsV/zbxsyJdStndRWTkLjDHw5HcvdfzTlq/9J9V5ukxRfzeblmTyGVmn5N9czdBHopYg8Vi7Sy5diRtdZfdAUJ8Owcdh0/RyR5+BP3lXSuUIH9tj9DfOrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1812.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 06:29:29 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:29:29 +0000
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
Subject: [PATCH v7 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Mon, 12 Aug 2024 15:29:16 +0900
Message-Id: <20240812062919.78-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
References: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1812:EE_
X-MS-Office365-Filtering-Correlation-Id: bea6bc08-a6ea-4841-059a-08dcba981edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kdReRfAM5itYkpYc/x3iAPrdj/ZnZrU0DTH9UPL+E7KBUcwb5b7J7osyA4rN?=
 =?us-ascii?Q?moNGe+Dt4nVJakNRv4GugyvrSF7CzCzwSDyO3uhiB6daGrOzPanHNuAyA4qI?=
 =?us-ascii?Q?ii7C/+5d3nxFECzdFZsnxYUJERptZLkfh6s8Fa4cdOI3L9htgIY239GvuTAE?=
 =?us-ascii?Q?jW9pf+t6GgiWxppEpZOacSEWJV1XMLDgceOWa4q7BO9lwxzRbQD6OnF4hBLn?=
 =?us-ascii?Q?3cqN6fXB6Ma79oSiW7WBcTTEj7khs3LPbqwOeNQOXtfDERqd6Od/D9WVTMwp?=
 =?us-ascii?Q?bNvTXAbYRoj+bJs9vNWXpX+5nTC1m8kwha5gJKXoll89NOfiIkorGXogLLRI?=
 =?us-ascii?Q?XdyZL/UF0tH/Ea1q2c2e49NeIjpw05QCEpc+udoAz/5g1SBLHV5no4jcK9qD?=
 =?us-ascii?Q?7mcres1rpwC69ajt9ltkTRsVcnPItDdI8fFWTLCnKL3OwWq2bGtgE+HKbbGq?=
 =?us-ascii?Q?EXdYBkewi19HVrduNYE7TQv/2fzp4tTLigJh9mMxBBRt0iNfGYCW2bQVhDQr?=
 =?us-ascii?Q?7BHVs8ED/AhOn1FQp9udlP9sykgaH9LPZzjJWtZc0QDBiAF0himPl/nKne3c?=
 =?us-ascii?Q?YGygBUnb1r4VSLFtgoVH18kD53KA9bulJ6X90dGz1YurEchnkeW1dm8fNOd8?=
 =?us-ascii?Q?amUHJ+bV0iBf74Sb/WsRgWjdIBxHowFsXDK6d9gzIWpHseKOrtEdbkhDFr6A?=
 =?us-ascii?Q?hoYpqqJU8IZC5gzN0tsjYrqEDlPRQxZlDtdQwiu/8m/RfR34fZopKNUbHYWH?=
 =?us-ascii?Q?sQIAz6l2klh/fUy1WmX9sLiSqLnK2RDn1BPSczn96xPyt1+M4Mngfuthkdx5?=
 =?us-ascii?Q?YqBOCbps2R18gnFIjonUjyyrxawrElXQhDSVNzUb4nCbo1fNxnYAZhoisn4g?=
 =?us-ascii?Q?bEFM55rpAHBq4yRfUaK70d9dT9I3l+W18SFPTvWTiossLHve7xMypTE9ajw2?=
 =?us-ascii?Q?6bTVfOrOgeXuy15tVi2nixbxRiD9rdd7y9s2bGwW1/O2gs+b7BpVdE1MBYxC?=
 =?us-ascii?Q?sG6UkZb/uX3dUIsoL7Ggxl6bm5EH16tXveHeFxwSNlKXhaHdtHNEjmUaqOSx?=
 =?us-ascii?Q?yIRQq8cQfBCe3Ge6VCHt5RyukhPE2jB6UAyZ53FrzSEwPSHEoDMV7XeDh2h6?=
 =?us-ascii?Q?sxevfrojMzrc8NT46MpY9K4Zq4KYMNO3Z8Dxg/yjzop85tbccue2kd2bqpr2?=
 =?us-ascii?Q?+23lKCIbUwNRHn75uACIPkKW1P8xha06vTb2gnjvM8eTu1PLwYa4Tdw6WTYW?=
 =?us-ascii?Q?gYV17nclnGcdzuWKc1faCbSfGiJqusvDcUQ3Hp2xAXa8V5xaIM1cD6GkXsh+?=
 =?us-ascii?Q?Uc6HTrySrYU4rAoZFfkGz1nMBPGWJ0DnQbn76xIirV07E4AuUeyDECpFovYR?=
 =?us-ascii?Q?Ir9nRfAf0zgAxhBntkqfakJjJ1QUueypNU8atae94xvGrmNcsg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bGM8aZw7XXscPW0dY65L68vRcXdKMkflcbn5/JUKms1trMnEV5S+FY1WqZ4q?=
 =?us-ascii?Q?SVwOwclDOjy+yrS39gvhJfRGzqCwPnJ33p4QEG4dtEBsDFcqu7CiUlkL1F4A?=
 =?us-ascii?Q?uEs/j9krCcNgO7ufLbqO9Xg+ZUFV/Chp9YBXfBo4VCZZcRDr58nz+YnGhChO?=
 =?us-ascii?Q?B6jfOCxyBFN895Zo0aMtxGZ34DAbANZp31zuCvAA1x5hxCVFq5bo84eZGxMu?=
 =?us-ascii?Q?IXilK2YOt2/3FhoO7vSgr+yGkZSmbW9VN6eYyb+OeNcwaAn6bhKfZxnF4gkG?=
 =?us-ascii?Q?kgKE0ULAhW+l7XKC4G/+TQiYVkSmGHupRNdRWJomMsd/mQl/1KhVrKlfjurR?=
 =?us-ascii?Q?xPCYO84HfGPkVE5w6dQfEbstf8tsOzoY/YXwzk9iFAbbyl8zIvMIL1ev7ouH?=
 =?us-ascii?Q?TXtK8y9L4hzUKaN8W+6WkE+21O4TqkNI3U42CEZg5PR/TaqGEtyQooe9+Bii?=
 =?us-ascii?Q?pPCCM3dJxSWaS+DuQA+J3+Tb32nsSfCPYiSPQLmBjmferHoehM8pnoshjn7p?=
 =?us-ascii?Q?mN6K4vQMZXoHKhBxfqYuedR+NkD9G7Lo+E2ydRlnZCTl5LDqpfQbtK7nPQV1?=
 =?us-ascii?Q?JkYAbevupjZnWoMzHgoZZCC3Ppokq+8UFetES7iVtxYUxWTGx5rCHaKblfT1?=
 =?us-ascii?Q?eZ1jPUqenq21Sev9v7Go2enM7tQLDDGwFAlbot270iOGTptWe9z/Yhxcw9zP?=
 =?us-ascii?Q?WpsGLHBxDgNW2ceVeZC7+0GQDyLnXTuwByBDbbT+dccBOK4oqFeqnNB1NzVt?=
 =?us-ascii?Q?o0XWG7+zmgL2wuU+zh2yiM+NzkDxqkqVIJMYs+BzSjOhz8EaREIhJiuEySX0?=
 =?us-ascii?Q?PsCnHl8HWMlKDr2btvXpOkV8tbcmlO8a6smuFnjPvJK+4uYxVKzqXgUlKdJk?=
 =?us-ascii?Q?nbCl3eP/bYUFdfR0UL6jSSjyIKXhiTAFlIEsmayW+EtHvTwHynrkTaie0CQL?=
 =?us-ascii?Q?eS55jfLPDehTGbYMk4kVdLpIGSMsFENpavDhHA3IaMLnV5pRBwYmM75DIIQz?=
 =?us-ascii?Q?/rd1cYlw1Vbl9GN7ThbMP40WqQCp5N5BfcDITSY4iQMfDW7C+EfoeKWcSvkM?=
 =?us-ascii?Q?h9LBjCvRmvqzSk7qZLmicP4+JhkxtJJFWiA5FIj589Bs2HccI4OOaMBgb+0n?=
 =?us-ascii?Q?v9s0Ncpq4EF9oAuIWYKVIiuv232S+iCVKQBWEfkoEfOmRFVI8DmW2yCvzwr+?=
 =?us-ascii?Q?TGgGogVt6n7A1XaBxS2TUmbc/ubeH5sFklAF8yRu5t/ficOdJRvE3DyZyioh?=
 =?us-ascii?Q?b29x790zrO8EYjFYCoSCEQH6V2exx/BmygUTefCb7Uv5s1BYb1YeL+Xd5vqM?=
 =?us-ascii?Q?HVOTwtFasJWeA8L36tsdKzCyTCwIPxYrh1lhheID4VMzublfh2PtEHLS0POG?=
 =?us-ascii?Q?a0Rc4EyhEG/cH4s37PIhG4rtu/MxNsVUUMZNlByImb2QGNcVIUqveA40ptSn?=
 =?us-ascii?Q?lUuQhTaahg9qbunnKwor6Zcy8ifEW1JFRLr5yN/9Rah2C/Zm5WOCQFBkPPcP?=
 =?us-ascii?Q?OpZFQAEW4KcQ3uEkBgCFMY3Jx0TOblNga2iUu9jPOVS/RUGGcS2BUSoLP/jA?=
 =?us-ascii?Q?yNBOGoeq+AfDh5pHPH8U3PGLmuodCcY03eyMhTenDktPaOb7VvBWukKHCSBW?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6bc08-a6ea-4841-059a-08dcba981edd
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:29:29.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMqhqj8oP2LdJWHkIYa0LOD6vmNh3xDzsNsXxBT+9q0/DLQ48xv5wz/yGsMctHO7hydYMNTSTYR3of54Txe82VTHfy2xpBYC/ihQZITtKgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1812

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     | 26 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++
 .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c89aafabc742..2a98bab446d0 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -23,6 +23,15 @@
 #define W521_FEATURE_AVC_ENCODER	BIT(1)
 #define W521_FEATURE_HEVC_ENCODER	BIT(0)
 
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
 #define W521_FEATURE_AVC_DECODER	BIT(3)
 #define W521_FEATURE_HEVC_DECODER	BIT(2)
@@ -35,7 +44,7 @@
 
 #define REMAP_CTRL_MAX_SIZE_BITS	((W5_REMAP_MAX_SIZE >> 12) & 0x1ff)
 #define REMAP_CTRL_REGISTER_VALUE(index)	(			\
-	(BIT(31) | (index << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)	\
+	(BIT(31) | ((index) << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)\
 )
 
 #define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
@@ -1772,12 +1781,19 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 
 	if (inst->std == W_AVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp |
-				((p_param->intra_period & 0x7ff) << 6) |
-				((p_param->avc_idr_period & 0x7ff) << 17));
+			      ((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_INTRA_PERIOD_SHIFT) |
+			      ((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_IDR_PERIOD_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_AVC_FORCED_IDR_HEADER_SHIFT));
 	else if (inst->std == W_HEVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
-			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
-				(p_param->intra_period << 16));
+			      p_param->decoding_refresh_type |
+			      (p_param->intra_qp << ENC_HEVC_INTRA_QP_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_HEVC_FORCED_IDR_HEADER_SHIFT) |
+			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
 
 	reg_val = (p_param->rdo_skip << 2) |
 		(p_param->lambda_scaling_enable << 3) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 3e35a05c2d8d..b731decbfda6 100644
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
index d2370511faf8..45615c15beca 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -568,6 +568,7 @@ struct enc_wave_param {
 	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP */
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
+	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
 };
 
 struct enc_open_param {
-- 
2.43.0


