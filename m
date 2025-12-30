Return-Path: <linux-media+bounces-49759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B39CEA493
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B983301F7CA
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00169330B0A;
	Tue, 30 Dec 2025 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BY0dWTAf"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACC330321;
	Tue, 30 Dec 2025 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114599; cv=fail; b=bdkAK4CuLm4aFWhK+qkbqW8WkZ+gm4LMhL9+H1eDJIMjdszSYSbPa/sPIIMyZxbVJcT3P1f2T/G0u/YHM1MwSlPF7vI+tUgScsvsHfdNVgt5hX1Z4y2vP4JSddhmUzhS3x3M2jvWvCNoL1tsaIB82sHWcc/ZPHXCMLeZ5wj0oOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114599; c=relaxed/simple;
	bh=O8jL4peIVsqAfdO7t4wHxSHmv8f8SNLsR9i4cS1bidw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bKoaG5+WIQTozNv6f5Pyx6A4m9+l5l75mS8YjmIM53IsT8Bqb7XIQNQm3Y32zbRP5gxFDeFgyB52z1vRXzJoeqPYftKLyFREIZrTpbE7hXsnG06iUEED0sE+9vgV28zXeVgcWfDLxEgYtnJGk7iHtvurnZJjcnykPupkGH/aVtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BY0dWTAf; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeZVKXA91Ad/Yv4TlFef2YQKMxT8MU6zOTTLahFgH0ptnXVGsPYnjvxkHiDCUv83kibcmuaXvYYHW71wL7/6e3q6oxbMAB1/s+W8fZ3jwDwGzbqvIFly2IgbR3P/CMt2vhNXeAfA71I96k77v4UDXzmn5HqxpNHxRD7Xbdut8PQ05jBT+eZmEiPyr/aDuWA2BaHVy9ejU+4/EOdO51J4aK0oPU9YbDo6SRvpFnjMy/Z9KOrIJWXhWM5oEUt6DRACC6Xm8uy862ei5PbukbHq/MnlLvjW9fI+wkrNwpOlkta2UMrbrHHNE9+Ec0QkdKBG9/ET9X/euFV1VJSrbIgP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAY0LbJvNknQjdWtra3AkjPaLK1zK4reFzmnk2gx6wc=;
 b=acIJPvQGwsbZGlRsJ9BnJqiEdWSa7tG6uuDiLdLh8XsGp+OtdquFkYeyZjxC5jQgLb+My9iYppYda9pMjmHvpbDyOMI+aLgnlS54Fl0nPdnSdoIoJko2DvSywqKu1ldmFs62JB4KoehAHS7/hDXZ7hxqpRn2ylo+RvSQKRRs/82L0mCwT+d1mSgMaJsr/a/qeONUdj6j5b0V+ZrOoTJ3StuuDWo0/PUDf+DDT/Fk33ERP7zBStRi2JQo5HaAz8s0NvhRXev25FUvljD2GLZM7rMIc3HyXIrgSPm2nsduO85hdfDfAcXb1hXczPInOt2tIYhIn23N3RyuHxroiPc2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAY0LbJvNknQjdWtra3AkjPaLK1zK4reFzmnk2gx6wc=;
 b=BY0dWTAfu/b8Zpp+n8Fm/mM61Oc1h4xMnfr9J/xFn/+ovpdSenO41+1WqoD7cSijh4tkAlS54qG2EBuPpwtHnZFDpvBCgHJe/BAtfGq83fGJexycw2Ls4zzYXuUqaOCHpt/r6n12thIU1jsZYMenw4U43sAQpZoJzVj0o1jzoGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB17518.jpnprd01.prod.outlook.com (2603:1096:604:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:09:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 17:09:50 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
Date: Tue, 30 Dec 2025 18:09:15 +0100
Message-ID: <b9aeabb34829b8e97559610a3d00ef67399a300c.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB17518:EE_
X-MS-Office365-Filtering-Correlation-Id: edd03e97-b444-48d3-8710-08de47c63df9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WgTJ0ebFG0sOJoC6tbaembZpFCvHTN7687RjVd2LlwP58BF8AFUuSnvBFibF?=
 =?us-ascii?Q?6V/sOtqnh8Xf2nVvx4UqxgwPkGXSCzURuToBdxRQ21Q9qh/Nql09P41qRCH0?=
 =?us-ascii?Q?DT5zV+GoA/UfLnwJy6aJIOra34KtNuQt5frizquwwqasl+PZnCAXQ8wFRhDX?=
 =?us-ascii?Q?DNPBvAPDj9UPMGsTFR8wdh5F67q8mX3ZuZq1+xSakt704NheUhFi5IJGCaCU?=
 =?us-ascii?Q?P70pOmf95z0BIel7M4AJyy/JbG4Q+duGSI9VX/xMQjOVGpZoGI/6O2ayqRvK?=
 =?us-ascii?Q?cOCEi+Np45qLfHyHuVb4ExUw0O72Ax1ed42vo9cgH3ehUExpBMmcmoq2PFlA?=
 =?us-ascii?Q?9nvnwRVkYF/WVm0fiE/UgXNbnmOzHiYwWZLxBUEJFHoE2hLmr9sHyYSzZ1zb?=
 =?us-ascii?Q?gIOa59MVzy7/zGHaakQQe++6BJEhKiPt+OQkBlp5+3mXDXeC+761xj5eCkC/?=
 =?us-ascii?Q?N9Mpb6hV5EGzXV018XUAPgFoy2O6/D/lCQb/jQ6wuzJaZKoDWGGO57XtSes8?=
 =?us-ascii?Q?nSLFyxlpIelRhu9Br28Zda1t6hrNZDWATRFfoso+HSjEeLDueZxrbc/1Vnnf?=
 =?us-ascii?Q?lyjKA8Ca4mJGUSLP4nKRkQsIJsjuQDSROxLm/S426/mkdjQklOMWz+DUZ+Si?=
 =?us-ascii?Q?fepvSKmZyD9AXPAjia5sjroGP//kSRRPKqrqdwZkkXrkmYGIzJaPTCt8iZOX?=
 =?us-ascii?Q?cs8EDzdny96ePxnkVdFUZ7rLxaxSVAR0YQsO0UUPUFve0b9wvKlSo/gHFJsK?=
 =?us-ascii?Q?a+22ySXXhpbV39eNE539+p2FqJ/xaRpVmIE3HOwDfjHufbn/hMNofoO9njXc?=
 =?us-ascii?Q?er6mkCNA7T+42RnSbUbKEh4zOlvS8a5RgAZhEj4L2i5WOWyuqr5/VgeK8WNr?=
 =?us-ascii?Q?2SCWlQYd9wcgMSFJNkgHK3TyuwPd3VZ1sTF2onS+M9sLk9pRX02wEAt3BYdt?=
 =?us-ascii?Q?ctEIc4Mm+qS0ETerLW2WKZyT11qZZ/C5NJCnlzKF3Qrc0MlUc/C3kyfyuCR6?=
 =?us-ascii?Q?VoLFstGS0ZCxTt7id108rp6bIxX8MC0YB8rroLDgBhiNSpa2rYL4rAEbP7FX?=
 =?us-ascii?Q?wAYeOC7/70QYNSqnXAX1CMDylrCkSAdu4NeEvOOIHBrzJWuMDu7oJRSsJkAT?=
 =?us-ascii?Q?zyOSI6zOBvFZJsZ2yhlSqAFnZYaGoWFWSdWQrMm5WNN43pL7023+ww3q/lG1?=
 =?us-ascii?Q?jRVi1MAkSKB53WYJG3NOXUQ0/9Q6W8XCzkZbcHHg0gp9NMbQEbV0H5aYVH2C?=
 =?us-ascii?Q?GcJVqyZnmDIkPv6klGBQab+YF1TQ0YPr/3XavclVCv75aCxsaYUIeKsUOWRB?=
 =?us-ascii?Q?J5a1vTpHdIqpVe9joRrcHeWXPkPsApUdInoXeY2P8Tq0qRcMOZrUlNUYzy29?=
 =?us-ascii?Q?Xo7lyuqFgHg1BuzcG0C6bKdZwZSAvykH+VdgvVbWTYFiWXSR++dD+DsRoTwo?=
 =?us-ascii?Q?Z+2Fdikbpa+YFO4RJxCISi1nc9kt+vGwH1t4SLRnuSAvqgZ/QDvvzbpM2oL3?=
 =?us-ascii?Q?e/dYMaehFYZ5B1ROPatnFBSWBV+eucKjfpOL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8YCo2rrny9qdHLaHJDJTAKR1MYVMXTtLoWRoYP7EK8J9chwCgjWd41FYKmzl?=
 =?us-ascii?Q?zTlnBmsmGzjW4NPFCctAZpbexIb5yKTv+EB2sya+oOnhrwHKv4P2oTRshHn+?=
 =?us-ascii?Q?soNQskHBwRbG9ftP27s7Vk/y+FgtErNtgEiOlvCelFXno69rKl6AKokiLFDF?=
 =?us-ascii?Q?wQX4ArboZNptU2WlNwaMHBNGgPxGxV1+pEr4MgypVfZ3voeFm9UTwq88qmoW?=
 =?us-ascii?Q?ivqnR67Rbc1ToKNF6RSrDg9UeQCsDFi9xyyHtvOsuS1aSYGNmZZqWndJC1nq?=
 =?us-ascii?Q?Pn8/0WXijPZvAiVqdf52wRlBgHzrYQ8ZBCOKGH631FAF9WxXWeCJWtitnhxN?=
 =?us-ascii?Q?j3CvBGs4V51UwPCY5/LknAZeHMvCRrlqwaUuxFdeedmTFvRopVWmhPHznFIJ?=
 =?us-ascii?Q?n2Jx8iFz+BD6yADr0Nz+ShjwEbF8/o4CzRUv9p8YMaCydD0527VGk7ySGS2h?=
 =?us-ascii?Q?IYSCGW29b8jxe6J8+cS9fASen8oPcErg7SjiBg1RtBKozhfVtmli4o4ZZ7U8?=
 =?us-ascii?Q?R8VOSIbVEJUD6qbjVzv/tVjzRRO20owzXejL/Ne3zexlikr50W+FBgi6uYOD?=
 =?us-ascii?Q?u7gYLyuAMi2bYgbKtXtivuUTkdBQ6O5TP18mn5dclwztpQ5Mn+lj058UljPX?=
 =?us-ascii?Q?KMXKb7zaDv6Aue8MwRbO6MWA8oDDiFMtBGZc8OlhxnvE+mQizeREfBitSabd?=
 =?us-ascii?Q?Y/nXXQNAw7a4+zy6zo7EkmQ2dskeXVpbWXGaWVd/npMhwW63A5xM0RlcccbW?=
 =?us-ascii?Q?W4bOAEnmM7f7FOyuwc1PveSfm0tp2IVrUzM5WrcnDW5LW8P1oaXiN4LKy5yp?=
 =?us-ascii?Q?aajP4Zs7qKMMKNqary+mtRQ9t1Tf9CIke+Sioc6sekTbKE6/u1eUH4QQwBNr?=
 =?us-ascii?Q?bpAoq211DNu4oNE33fgyst+2fYKQ3plo3om/NFbq9L98X5JcyFl8IJbYk+TK?=
 =?us-ascii?Q?1cxbe/8GmJAgP+3z+PtSnP5YR14ZIM8mUDpGS+qtlcnRQsXGZb17/5+xg+9g?=
 =?us-ascii?Q?0wRDyy0FajL1swQd1v2QGjUUCUkhZ4KxPITQqpS5aMYFVNPsJJGYh/OxryqP?=
 =?us-ascii?Q?VUHFy7pUjoetwj7jmgrUPymNVZ51WmKdBUQxnAp/AgKSIBF6PFDYF7BSkBk1?=
 =?us-ascii?Q?L0fG2P8F1wCu7IzT+i3oM5Ux/4vL4FjMmy4OtltIFVSr2euCbPaS49HQopP2?=
 =?us-ascii?Q?tT3IQcK4DindBU00cFYtHSAVb0Kl8y194dzvxvCVdUmngSZBUqV2iEacJ+LY?=
 =?us-ascii?Q?GIo1sBfBbTkY0+6n6VQORORwStdeqRElCk3EuI7gEckFrL7T1sJ7epehqZLr?=
 =?us-ascii?Q?q+gQbXu0Plprjk0VLnPLwqX533P2Q4gJvsoot9EWVJq9ugGsBe3FKotjd8Ya?=
 =?us-ascii?Q?li57y2jUogO7sS7s9/PrXgoy6qsavNap+vVVKbL5xaA+r9oLZUIZINWs8RXK?=
 =?us-ascii?Q?zy3od0WXIrUxk/o08OroypdEgL5qcVh9HcT5WKudaIM3TEz/Eo8lbVRTSfa7?=
 =?us-ascii?Q?w3wxRSy0sDY3zTCTo6jH+mSi9vb2KhbDsbcCV1klB2K8dwy2unGEu3SluvKx?=
 =?us-ascii?Q?9tJqu6NahE9DKhHUIGUvgQ4EsEFtJkD9oVlxzMAXncfzzm7ynDLSihCIupve?=
 =?us-ascii?Q?oSUo0G6iq74NwY4Y28MvsLgor4fI27PvCC8gkHkWU/mli1rS1tJnkzJMFYhd?=
 =?us-ascii?Q?CCJwpoVtj+hmfT1e6PXYaPos5KjXsdMjtQixZPmlmvQWYJ2kHLvXEGJ4kcRp?=
 =?us-ascii?Q?YALdExyBR30SxjdyoyLWbY/jhiPI2h1P1qnDzX9dpjgWz+ohcZWj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd03e97-b444-48d3-8710-08de47c63df9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:09:50.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRuMhpQxgbYalfKz+UuGH/Icr+bjXah1WubwwbRQbyR8nSsP/aBThtAa70numFkQ3Z51B/nRszwcm/80D7AvkWoMpIJlxEgFwBjie4Ym19rwqPyU+NIzQs0sJVKWJbZb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17518

When the CRU is configured to use ICnSVC for virtual channel mapping,
as on the RZ/{G3E, V2H/P} SoC, the ICnMC register must not be
programmed.

Return early after setting up ICnSVC to avoid overriding the ICnMC
register, which is not applicable in this mode.

This prevents unintended register programming when ICnSVC is enabled.

Fixes: 3c5ca0a48bb0 ("media: rzg2l-cru: Drop function pointer to configure CSI")
Cc: stable@vger.kernel.org
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..480e9b5dbcfe 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -268,6 +268,8 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
 		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
 				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+
+		return;
 	}
 
 	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
-- 
2.43.0


