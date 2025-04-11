Return-Path: <linux-media+bounces-30057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B992CA8646C
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52FB09C7837
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F78235341;
	Fri, 11 Apr 2025 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UB5vChXY"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861921D3E1;
	Fri, 11 Apr 2025 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391332; cv=fail; b=U92bW7veiq/bxb8UOqy//zTY1U3ve/Oihoc+kO051ytg2qoAF2Ss7Te38QdRB0INpOXOLWu6ShfNU+9t22VKyrlB18cdREbeqbvo6lWNjv5e2oYowj4sD24kPEB3Y+5e1j444UK6uHWgWsgRNtUJdiCpf0zXAa6heSMEOKeVb/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391332; c=relaxed/simple;
	bh=qNQVnmx2wPx95xrzf9vTmELaS9tgu6U2cupmDXuZV10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qBuAkUvd2udgH1j2FC1RHTCJMGzJG7IqxFK0ddRnzM2tmAHL+8gGqL7/LxHjMkGIYoepptWyGD80+mn4ag3ys7bR+nPm91B0h0U1x/XoTrqbfnd3Hbf3bYG+kG/MdPSpiPY47cPsCMjJTRA8SYq3t+zRRqqBPiSJIACFU6tKJiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UB5vChXY; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CW5rcUYTvcT0dKdWe9zOM2pRFq7/I/48Yq45eYBUReAyC7U+v63J+6dpN9klrwAl8LhzwY6BiX1/5/4I5nBcqiXzHn3PhYE6r97gk3vcupWwE+nVniCaN8si7HXysZM8zfs8R9bmORCfWZ+HQmOB08mfR11/wa4qBKiOq5LwMEfDuBu6yFp4LACjfuv9ErXDkeFRvoBDM2FDIcxOHmsX/fVc/3xcryTYyVnFZl5mLMK4AAHGXqNcDlywgRQRObcRnqpzvkAmvrJ0de8MRmMMv3XOUNnIFfriqXCJ3pVApVDDFuaGUVP9aAbewkgqiIOdD9ALnx91B4Qm/Mf/Ukth0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HjJXPpFmIuG9G4Gv94s3/8Tk5+svAlbbQEDiUkf6zg=;
 b=j2tdH/Kzx3+0OHVtxNrq8qayETRlz4/zhx+sHJrTh+cXzYcEED1H+UHBBlfUaZZSsMFHm03bvfCAvTNusEeDSCgnR0UpIJJGPqGoh5jG0Mz4b6yiDaVnfGOYPm/L2d51f/kvVT4xud723fc+BmjrdhJ9X1CE+s4f2tZZAZWArn43/XEWdzVIsczWEIl8qtZ7lxP3HCFCggqlfrJbXPjlX9Ru0bShcXQz5uh32aBzVyhgA7nagGoEt9RtGet2k+p07Qf0iXmrjwtcToespCOXUV2vaApreLTpPvOa3rsynnFG7T/GW/8uPPX7lMbF4WuAJF4lsW30MbzA6qrd3xpF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HjJXPpFmIuG9G4Gv94s3/8Tk5+svAlbbQEDiUkf6zg=;
 b=UB5vChXYiLkVukOGHzGCO5wVqimXLpA2Jl36xDI/pclrI+7jrfVri6YojPbZxq2E3beR40m+Yoj0sbn+k8nVzKUF8MEwVHaHyYtffylBEqTmYgVKeAyTQ9UHgaupMqZ2UYwWLqvX6KkvGod0e19IfZVNdjcZ4ZJcwzR65YT29S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12643.jpnprd01.prod.outlook.com (2603:1096:604:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:08:44 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:08:44 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/17] media: rzg2l-cru: Add function pointer to check if FIFO is empty
Date: Fri, 11 Apr 2025 19:05:43 +0200
Message-ID: <20250411170624.472257-16-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12643:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6392df-6026-4633-46b2-08dd791b83df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/xAlUfHvisQAXmkQjVQuqwBud+HTh6WTRr33hUkQV8mfvyz85GKpHQ/ztgBx?=
 =?us-ascii?Q?2WLRnnXNSRxRMxakieISv2Zb+bPvvR/Mzk7GYC/7yeSPO0onoSbu9OTyPLXp?=
 =?us-ascii?Q?IvqwpjqCPtxP/f2juGk7z6+PjUA+rQeuFFOsuKkM77mvjsC8yUvf5fH2TNim?=
 =?us-ascii?Q?FDAcGVGaw/xYADZwL57whgg4twyBFNy266/L4xt7ECxptBKoEe9dJZs7aMut?=
 =?us-ascii?Q?J++UM9HFzrPcdDQzYpDeNLEaSajh2/6SmZynX8Rst1kEm6vggDP7UX/gFuPK?=
 =?us-ascii?Q?IY5dMiKvuZf8IkEYavy2KEzRj+7odEnHUvSMF360x0/hWx/gb7Zp2gjq7c0B?=
 =?us-ascii?Q?2U7bV1SXhMj427NuJPPNbCCb7SuJE3qiGUsbtAgi3oMhJCrdsC1C1JQoOuSb?=
 =?us-ascii?Q?I/n2p+nUf5fLaTnsW/4mCMTKMbOgD3lDLvnfhGWMr1YivruJtZa5EEkOn39r?=
 =?us-ascii?Q?ZTkez7vYnJWs8VkO75JLQNf2E5UnJ4GTihcHuzCRr/Tnnrb9Noj63yoLg3bW?=
 =?us-ascii?Q?O9naz7PKvkb0p8JVjVXTBEVNG/ZNEjZmdunhFyaRCOiBbvNSNxrtQdRpKAzx?=
 =?us-ascii?Q?dR1NOWN9zqM8ukE9X993CJDfzJpZBr8vMVGNob/7FkVgwni3l4WEHKtx5UO6?=
 =?us-ascii?Q?PJrqyCnFl5bOxRwmQj9A712RnJUa//AUmgiYVFjB+9uAIZc0GAuG+CYB//2p?=
 =?us-ascii?Q?fQ4umvqPKhhobrGTzmsn3IoyBBiZY9CJEuUuzHGorGq+XmA9AcAGCYIaSaX0?=
 =?us-ascii?Q?SGPsbu0VQ+czg4Idb6QnyBigq8HNHVKGBWhbZ0Z/1HUx9LmBiaollhejnxy9?=
 =?us-ascii?Q?x+EvlCQYHhQsceV5ZlQMWfjLOFvvzrrMhSjVPwb3IwaQMeHdXcbIi4RI36zU?=
 =?us-ascii?Q?GLagzoh7iOS3xhQUoWvYDVR+h6xufMz7bCFdSC4MIT+VXuW4zYksyyJei8WX?=
 =?us-ascii?Q?iNATNE9IU+OkC1hIHiL9NNuJ+iwidpIhglvOAN8W0tZQC3kP5OWdUdqKxE5/?=
 =?us-ascii?Q?ELDDlrX0X2ejySQv5t2odFaidBwcMYFf1CWJAp1JeqzmqdPKpwxx+bIPFnl3?=
 =?us-ascii?Q?AEZOxAm6jevx+vdNFGeWNoZ7fbPMnlV558C36UQSaNrgPM6hD+2pFb6IB0ZP?=
 =?us-ascii?Q?8urAjJ5Wy8To9YAJcNNqc9Ttzr152SbI2a9HWKwJ7cw2wsm1DpbN509N8Uhb?=
 =?us-ascii?Q?idU5VR15v4j+EOrt1Qxu4jUVL5QXg/Gx5058x8geXkrD501aTa9VGe2KEa8W?=
 =?us-ascii?Q?SZbQ2FCMR6aLLzxB283PK9M8K+FuHrf4Nwnf0ze6k3X2K6R30hrIG1GeHt4s?=
 =?us-ascii?Q?q3LlpsdCI65vt85JtY4DKJs2/2IIXGPMyB4+iIuLkXUCqCSXFPJg7tAHHVTG?=
 =?us-ascii?Q?N7Ca5eRToPzPoQacGNgzHy+VbQv/UdLpQ0vdNjlCHpkFJJhSp3RTY9Rewgm3?=
 =?us-ascii?Q?oMCK4YYCXXrmZju9Or1PSm8EQ/3RrFwsTypnF78tAL+xXe4ZjNHAfQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yB6uOE+mTRhK6mCO8901l4aaoWE5zvNU/v1Zd+3ihibzaAl1XAZL8JLTMLmX?=
 =?us-ascii?Q?tTh7tIWFG22yrpKYCGKQ78QoCdulaGFD7zaIK8YDyUonukTKY36l89FLhgVF?=
 =?us-ascii?Q?hgoxJJTDY3lLyrd5pLzqdJZk+w5LrVJsfXCQsx7YoMOlXckZIVjxJ8uBi4t2?=
 =?us-ascii?Q?Z/LvQPsLNwIGGs+Vj3Elql+88Mp7DSRnC/nQMmCNbvdsUXUlPgIjj9VrBWL2?=
 =?us-ascii?Q?SzcyecF8cjOR/S0ezhmlC8GBuc4MDkHP+YCxSMYvq8jGR2B2DZ4SPIvY9hBd?=
 =?us-ascii?Q?YAd8PC41xnB61JBDkZ85ShZ6CGOs1UpCcmf7RZSkBRV0Bkd9MlVndZp0KuHG?=
 =?us-ascii?Q?oOSravLgpV98s9NYZxvFXfj2p1OeMPYSU8CXSm9VdqBKZTIgaxCKaSB/3dFH?=
 =?us-ascii?Q?14d0EhJrQMIlG9nTv5aGBuKnKDIWhcboBLBb9M65+wDHQG0QtshE+6JwFUUS?=
 =?us-ascii?Q?5QSW76Xn7iAfZsuRcU3WQfdfkp9ErurO3rwQd/dpszb+IqpUDdiP7AkS03O+?=
 =?us-ascii?Q?Tl4cFlhVT9IiGzfvdxwYEzJ6+Ibno9QvEILOt+87mts9myVi9S40gvNWkd+G?=
 =?us-ascii?Q?dn6s1uPOKZLLbLU+TRNBlMDaGxeFX19lKUwal2J12RsoZ6gx1VU23+Th5fBw?=
 =?us-ascii?Q?tTJSUrFMVp4pVPHR7uoBvkLD9MQ0tHpHS5qgR0T0tD95xQNmqjWSuVhk1eFl?=
 =?us-ascii?Q?aZFMxotlfeTUF1z4lvNfC0mIUlenj2PUQoPPGEJqoVxnwSXRD/KAx7Dl7y2w?=
 =?us-ascii?Q?vDAEiDF0fV895DceBCQk8rpAlPZjGI4PPbW+YX4ujSjkgmV0m0b7GhRB6wiF?=
 =?us-ascii?Q?qYw2uRP4GWEyaau2fpEogv2roranWGcj8xgzg8uHzVP6cQg3eoo+g+7lopFV?=
 =?us-ascii?Q?WxlnpIxIuvLB2mYnr/k8/95DMp2wCQgvdat2/RlBeA/AfkXj14nmmwqjDeyw?=
 =?us-ascii?Q?VBG8tDAZMfeIYv0G0aVzricajna6S+mbBNN+2M94jQG9M158zu2i6Lp9K/pf?=
 =?us-ascii?Q?Pf+0YcUsIXTCnGp9NgZPxBHpMXw817ZH7DON/6wIGzgQDPtlHogNgfigtrag?=
 =?us-ascii?Q?dhExwTk9iS9eZSKKPlrpFr2xN+FqS6vS4m+TyqrhC5PR5yaCbdKTjTe2VVvQ?=
 =?us-ascii?Q?InJmYG62ZI2vI2CSer3EZfRFwywczOJywYTbGpeoBlJdZCOqZSUOK0oRMkqb?=
 =?us-ascii?Q?MbzdV8Zrc8Q1LWVHiEXfno3haM1TfUVSEzHbv553IW21NJq1V6VpVbc7Elvn?=
 =?us-ascii?Q?NIgHAzK+BHtPHcBgv8MMrSJhHxDCCMv+tG1r93a3YNIeHTo6vM7srOxDEyxa?=
 =?us-ascii?Q?RtC5Q2PmFDhguXHBudZdWnsEN0XkYzPBIzW9BXnDqfxjchpvi9cpu25H/yyB?=
 =?us-ascii?Q?mtFnf2qwQQDl+LoXl2gSDIYZKKJoCH/YynmHjdRROsJv5Le1szOMd6WbWWn1?=
 =?us-ascii?Q?JpCLg9ks/mOJucwyh/Lcsuvu77LWgGQrbsKfhB7hfwsYd4sfdky4Uo24NLQ1?=
 =?us-ascii?Q?j0/5qcOB0YzW3TIc0VjZXNZgDETw4jTDus1CGWOY1cnYnAlho9XSgZ6Sbjc5?=
 =?us-ascii?Q?yJ3SN/5Va1qOcWaZn6/vE3mP32u0/eCfOiLpRa3vqZEkgp/YeST+jgdshuCE?=
 =?us-ascii?Q?Y+6a/Y9dt5kXYO3G07sV6l8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6392df-6026-4633-46b2-08dd791b83df
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:08:44.3330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbnZwqTV4fp4v3KsajRdipRibP6HWMYPBaPPptAbMm04vuyPgxTGaQxnbbTG+zp2GXTSYzz7bRnkLrmhwPgY7Gxd4pnGizGYJlge6ezC2TQBgfW/3RPpwKZffzM3y4rI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12643

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `fifo_empty` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, checking if
the FIFO is empty requires a different register configuration.

Implement `rzg2l_fifo_empty()` and update the code to use it from the
function pointer.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed return of rzg2l_fifo_empty() as suggested by LPinchart
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  1 +
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 +++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 +++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index ae989fa2768b3..3b5de84533192 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -359,6 +359,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.irq_handler = rzg2l_cru_irq,
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
+	.fifo_empty = rzg2l_fifo_empty,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3f694044d8cd1..2e17bfef43ce6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -88,6 +88,7 @@ struct rzg2l_cru_info {
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
+	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -185,4 +186,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a104821d823f9..d35e9b2074937 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -290,9 +290,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
-void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
+
+	amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
+	amnfifopntr_r_y =
+		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
+	if (amnfifopntr_w == amnfifopntr_r_y)
+		return true;
+
+	return amnfifopntr_w == amnfifopntr_r_y;
+}
+
+void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+{
 	unsigned int retries = 0;
 	unsigned long flags;
 	u32 icnms;
@@ -320,12 +334,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
-		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
-
-		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
-		amnfifopntr_r_y =
-			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-		if (amnfifopntr_w == amnfifopntr_r_y)
+		if (cru->info->fifo_empty(cru))
 			break;
 
 		usleep_range(10, 20);
-- 
2.43.0


