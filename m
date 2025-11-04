Return-Path: <linux-media+bounces-46239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB0C2F275
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 04:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B34E4EA64E
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 03:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5228427979A;
	Tue,  4 Nov 2025 03:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x6mCrJY3"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB173272E42;
	Tue,  4 Nov 2025 03:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226518; cv=fail; b=JF0ygSlEbGdq6FBFL7jjCZVF7KjPuRWGT45pe/6/APF+MgI/Mc8dwbz6i2Hwfrh6FGQgtQ7/9l4U5MbJio6MmmYCs/HbWYDiL2e+Qaj0Kd4JGL3QW06t4N8mz4CKLAmsh0SfkmjBQHX279DFy0eCAHyANqMo1Qr9q21plMVNNyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226518; c=relaxed/simple;
	bh=c7q1kXJ0QiUJyQ+HKaVN97EbmgnUY+TBZu5xmiqMMa4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SXgrLZcw/VfrYd8m8mI4ocjVnkS1xMzE05txNYQ7vrj+rYX/kdv7y3AypVLlPvbf9tRGCtKGT91C6CtGrJZXOT0MpLPNC73XtVlfgL3dp+npQz+8Ha9IhH4aH69tq7FZugNDoC5yh9inF2383zgn+5THTTNCAuUkQGmWRhxLs14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x6mCrJY3; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPjNX/CSSokbRTSfAz8pzI+mZ0j5CFgPe3mvIYFmzyxS2VKTvuwTHwpG+zJPex+VlWPdWNVSXuFEYSWxiK/DUK8vyMPP1G4Yj/f8eNBSrcFtDu/1e6pW94mZOCihFDmEG2nRyUa/fI4/g91PZ3pPWf7+lnrQAIcHfMkh8aSray7pCUpMV9fxVDYqCDb6vnNNeR+610joZsfTs8F7sOsdTrv0ulBJjSL8QZux2tnNrJ/3VFtVBrbyXosVboi2Dyv7x3VRsPJzQIfsG41hglmlTqfN+AOJMZEd/qzMyMqXLTJXSVSEBnI8U6NRhvcEdujy/Lx0/Qe8z0jV/HceX0EJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toJGfgxegWgi9ZXppKhPNZdM+3ri5zCOCpnZc75TnU0=;
 b=yCOoAU0UZfOdp1D2bkekonDUD+SYkLyANkdmjeW9VOvHYUDrSkP18YWMOYlFi1Po19rSsvIktHDlwVcC9DRpq9osmbqN50P4kGc44hznRPurSJU4o248ScgNMy+8dxIrRnnUUIYTkSt/ritlPD+tW6KK4fUvB1iabqFHmkCz0mlv+2jEXS7sxS3GHUR8BxU9HE/HzljAHlECRbinylg2VxOzmFn5acT+Z7WilVG8jBjNqtdbkZZG1zKgeAuW08bW1q/I43FdoY+HhUSgWguO47Gh13C/bwQaT7xHpVGpfCntGm5N5TJpi3LJAdt7DAxdXBW08jOmdaGAw9qallpU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toJGfgxegWgi9ZXppKhPNZdM+3ri5zCOCpnZc75TnU0=;
 b=x6mCrJY3zQQDNcHXA4ewDJwt25cgnLLJx8ZTWteMyrBKxh7pjJw5USXMBbuvKbctK5zxs49kCu5tuUl7ZxeZjOmqaLk5jD4Gm86s3cUcRkR+keVSROQdsgDPZZUXQZwpCYKq/of/WbQ/eUZxU64vgHT6uEorhl3eAm6cCOAjKYk6CuIHKwLGGMr6d83vBo+Fbyh5WvGH7Cy1cZ+SLqYMaKq7xsM7DH8g4GiBDLX0sdRoHYbBiQPujezidtQjvoZJb0EDAjzrIF8jsT4xNc5SYTR4mUdEG/lw0+upDZvGivlj4LB77WlkDCoffS34xggaN9Dry5HxKmXR6I10BFF89A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:20:36 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:20:36 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v2 0/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Date: Tue, 04 Nov 2025 11:21:04 +0800
Message-Id: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBxCWkC/03MQQ7CIBCF4as0sxbDgNTUlfcwjSEwtbNoacCQm
 oa7i6xc/i8v3wGJIlOCW3dApMyJw1pDnTpws11fJNjXBiWVkQMaUR9PXvbBCCSNvZ48Db2C+t8
 iTbw36zHWnjm9Q/w0OuNvbQpKdflTMgoptPVop6vTvsf7um9nFxYYSylfg28En6AAAAA=
X-Change-ID: 20250915-isi_imx95-1e3163fde962
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762226484; l=1510;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=c7q1kXJ0QiUJyQ+HKaVN97EbmgnUY+TBZu5xmiqMMa4=;
 b=gyVV+9BphrPIEMGfKwkaWIaWtSV7gUxeUFS2gnDhsBIcG5bZ7IfoFo6qyAusG7D4oXmibpWmW
 4Cxk12RBaAPBdTzGuaAb+Y+9WqG7zNtlmQC+oqB1cJiOPB02nGbi/bL
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a18a42-89a6-4f5b-a13f-08de1b511f4a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UXlqcHVQS2phR056US9zRXRRemdHS29YUHcxcFB0L014aWNKT1V2V3o4TmFx?=
 =?utf-8?B?czEwMXN1amFKNGV5eGl5WGtqblkxMWh2YkJ5Vlc5V1h5dVMveWRNdWRuY09n?=
 =?utf-8?B?WlZLN0lhNDNzK0JQOHByazZyY0NQZkgvUG56a0QrMytBN3A4cmpkN2IzN01r?=
 =?utf-8?B?aElPYW84ckMzTU5DOElkaUxQY291cTNJNE5MckhEZ2duWWUvdDNjRGJoWFI5?=
 =?utf-8?B?RDhKKzBJQm5zR280Q0htTVZuOWxBYXoyWVRhVUpyNFlablFCMkNqaWlUMU0v?=
 =?utf-8?B?T0tqdGRhKzVGTEUvT0d1UGlnOTBPcEZ5OUJWSE5pNXRqSHUyeEtUYWpUeVcv?=
 =?utf-8?B?elpidi9sWDB1eWRWbThhQlhXTEtTcUxhUlFScFN1aXp1YVVFelg5MHdwa0kz?=
 =?utf-8?B?TXNiMm1pRDd3QkkxYTRIMW5Rb01sRWYrcmd4LzBYNXNjQnF3Y2ZidkZCSkdU?=
 =?utf-8?B?K3A3U05Tc292OWNlQUN1S2NrQk5USkxnQ0lyQkN0Nyt0TEhEWjR2M0hFVHZl?=
 =?utf-8?B?cEVabkdMWHBpVDI4eklQZ001SURxaW90RE4zVmQ0Z25aM1Bac296OE1YdDZt?=
 =?utf-8?B?Yk8wM0t6M2JEZEFOSHlSdVB2MnZ5Q244VVZkbEpES29zQlFMSUw4Y055TlFH?=
 =?utf-8?B?bWEySTFPdG96ODVZNmV4ZlJ4UUY1K3Zkd0FMM2MrdzZsQm5EUG9waXp5MFhL?=
 =?utf-8?B?YXgrODl4aDV6VTBJSUVoOEU0bmtGUWI5UDl1QkE0bzhZZ0dYSGpmS1RQMHZk?=
 =?utf-8?B?NTZGQlBKcVBtOHhhd3RaZjFoNkpyZE5vZWFVV2x6dS9mTllhS0Fwb2FsS050?=
 =?utf-8?B?V2JNU0RtbExxT2tRdUVRWUNGYnBTV2w4SGYwTC9KQzdwZHZwek9RR2RxUVho?=
 =?utf-8?B?eG9DUFdseEh6YUtiaWZOT3FGZEdrU1VUZUxaaXJBN0N4Y0hXQlozUUorU1Vu?=
 =?utf-8?B?WjI3UXBkZlRzTVRGNjhzM012SXZ2TnhaNWVNUXVybG9mbXYvWjYyVWhVYmhJ?=
 =?utf-8?B?V0ZKd2NCSWpMdTROK1drOUtNQnptM3BFUE0wZTJuMHRTNGVsUkFZNWFWZHZm?=
 =?utf-8?B?d3hqdG1DUDZrY1FtN3QzQ3k5YlJmdEFoTXpJUk5oeU03QndWZEpPczFMcGJG?=
 =?utf-8?B?U0VkY0lVZkFmN3NIZ3V0WXFsYXFnY01hRllEcTR3OG5tSVVyWURmbktVM1Vw?=
 =?utf-8?B?R05Bd2s1cDdTLzdKTEhtSkZWTktqaWprY0RNS3U2dEMvd0JwYmllOUhLZWpW?=
 =?utf-8?B?dlMvQzg0WjU2bUg1d3pXMjUyQ3pXdGJtbkJBa1J0SWt1VkVQbzN3dW01NVVm?=
 =?utf-8?B?WDIwak90VXlGYTlxUUhIY3ByZ1gxRjU3MzJ2dUpVcjNPdktZbFEyZ0dFT3l6?=
 =?utf-8?B?L3R5VEhTWElrK0toVURaOThQN09YYk1pQ3FucnRpaXozQnVSL251OTNYVStj?=
 =?utf-8?B?S1IrSUk4QXFZVTVSdkdubjBDTm9zeGlRV0h3QjFUcjdEUDBnZFZZc1VJZVhy?=
 =?utf-8?B?Vm5ETk9JQVpCdzRnNlRvNGJrbCtOSnJ0ejJLRVE2Zzl4YjhVb2lTL2xtQThS?=
 =?utf-8?B?eHRNcWxpODFWRnByeHhHZk11c1QzL1Y5OTc3NmVkbVYySjVMZHlnWnZVUTVa?=
 =?utf-8?B?T21PNTE3aDhiWkZwSzRKY3JwZWFpQlE3ajI2NVRzakluNmxHTmYxdmxzekd3?=
 =?utf-8?B?WVRMb3B6dGlCeExYbjZ6TjRldzk5c3lNVnRweER1NUZXTEhDeUZwMU9hTE5r?=
 =?utf-8?B?NlllMHkveGNvd0wrYlNkQVd0MktaRWRrRDNLeDVIWjFFYzNTZFRYbmh1allu?=
 =?utf-8?B?cnJYQy9RbTVuV1lqRGp2aE9OeEpLbDNKOFI5SWEyZkN1Q0xxdjI2ZUJsS1FX?=
 =?utf-8?B?Z0pCZEdwK2lNZWFzUE9iMmVCTlYvQzZ6cU1KNllURVhXK3IvWk9GcTZxeWFk?=
 =?utf-8?B?R1B6YWh4OGI1RUlQRDRJdG1XNHBRejA0bHVLSzExMFFHaUY4MU1VTkRDUHpa?=
 =?utf-8?B?TVIraEo3Vjhsa2t4OUdmbkZGM09TODNqeVlNL0ZRTUxRZmZJb2gvREdkV1ZJ?=
 =?utf-8?B?dEI3MitLd1VwZlZ4VUNzQUZVU0xzSTRObGsyQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QXlLUlRqVEw0VHBFOTBPLzJvemt0bFpvRktRdHBpc3RGa09pNFF5SmRLY3dh?=
 =?utf-8?B?Z3orc2o4ZGtoU0R2aVZjakp3MWU2bkZRbmF2c1p4SlZaQ0RlL0YrNGhIMW1O?=
 =?utf-8?B?VTJwbCtXZ1NxRWlSNzVsRHhialh6UTh6TlEyL3h1TFZ5c2lidEIvbEVid29T?=
 =?utf-8?B?SGhvSTczdXlRVnI4elV6aWxCVzZSYlBlM3hyekwrV201dFNCc2dqNzlZT1Vz?=
 =?utf-8?B?N1drRGwvNWNoMlFzVVppUEkxbzhYQmdFVWxLdWJmSFdTZFJOMjRwYy81Y1hm?=
 =?utf-8?B?dzhydW92Yi8rcHZTK2l5bjlvbUlnTGlwWnFkRlBpMWlldFdEM0F3RDBUeGRX?=
 =?utf-8?B?V0c3NGQweUpSQmszSTkrckt6VFBybVJTczdoQitlZ3RaR2M3Z3F5YnppNC91?=
 =?utf-8?B?MFNLT21UWExRaWxCakxHWUhoT1JRdExvdnoxdEkySzFBWmN5R3B5b2k4bUF4?=
 =?utf-8?B?cVhSa0NkMW9kOHdoeHBvYXpWNUV4dWd6c2xvTi9sYm11N2JDR01hbmNYTHJw?=
 =?utf-8?B?b3p0dDZmT3ZIdWR1ZWNYK2JzN2dHVnlrbW5RaWRYT3ZDZjVsWlBkV2NnWURi?=
 =?utf-8?B?MEV1NHJZWXhxd0pGQjVpMlg1VmpzUmVjT2w4UXZSZ3dlQlhkUWJPc09SNXNs?=
 =?utf-8?B?QjFEbk5NR29pUFJicnBCbmNLMHlpNUpFS24xV1FDelhMYUFnNzU3YTYwY3da?=
 =?utf-8?B?cURZY2V2b3NVekNPTnd4YzkzQlZ1bVZMYUNvRkVvWnpXQ0ZqNldLSnhYZURJ?=
 =?utf-8?B?UHJwaWcwbFd1Qm5Pb3FWazkrYjJNMkl4QWhVM0pveHRUWXJxVWp3VmVaQlI4?=
 =?utf-8?B?VUtXRzZWUDdQZjNJanNZeFNhdlo3MjdRcGNPTjg5MGFDYVpnd3E5NkNhL2Ny?=
 =?utf-8?B?bllHdzBBelpuMU5mdmZQa0Ura3RDanIwdVRENlI5ZEJ5NzltRGR4eUxzUlB5?=
 =?utf-8?B?bkUycmdqWHJMRkV6aDBYQU01MkVDdERXMVdXYVZhMVEzVUxCVU9oQzk0alNu?=
 =?utf-8?B?dzc5NW1WdDVPZ0RNa25FeWROL2sxekVBRjZrczM3S2srY3pRL2ZqTlhPRHR6?=
 =?utf-8?B?Uk16QTVJYnBmRElFYUJES3k5YjZPcjR0d2ZiNGxzcitmbTBpekpnNVcvT0dl?=
 =?utf-8?B?RGM0S0NoaWV6TCttNFZaU3RiNS9lV1IvOG1EOW80VittUFBIc3E3eERtZ2Zr?=
 =?utf-8?B?cjJlTkUrTU9DMGVyRXBzWERSUjBKSmpwZ0ZCRE55cnVUY3hRU1lkTlowWnAw?=
 =?utf-8?B?TDl4emxBRGd2c0FRTjlPUk5BRkVFTnZLeXB1ZDBCREdBbk5EdnJTVGtRN2Yv?=
 =?utf-8?B?cnVIREZGZll3TTJTa3JXT2NubzN5SzVDTUl6MXBzZUdnbDNLNi9hWmNaUjMy?=
 =?utf-8?B?Z21JTG5xZjRURUFyYnpmY0djc29MVDVya3UxUzc3enF3aTBQWkFRZGt2V2xl?=
 =?utf-8?B?YVltK3d1UStIc0pJZWdvdWNHQnNBbVMxOWlYUGkrWExLQmdSbjFJSVJwelRB?=
 =?utf-8?B?Y0cyYXp1eDUzS0lOd0Y5ZjlUR3RQbmxWQzQ2bHpuNVdMVTg4OXhEeG1oT2JD?=
 =?utf-8?B?Zm5vNFZuQ09MV1RaOWdaMTZCaEdFREkya3lpNFFnbGgzeUNZemVGL2hqbDNu?=
 =?utf-8?B?QmZkWmtVNFlsS0F0NUpJRlhJRWtDekYySm5sVzRseWVDTWp4WWtsVVpmZHM2?=
 =?utf-8?B?ckFDeERBTmxUZGNwTTRUK0pLZFllSlhKZTJOVzlIVHQ3aGZnTzcvV0RRNERU?=
 =?utf-8?B?K2V5cnlzemVvL0ZqamxhL3pscENVeXNDVE5CSXJOUlZsNGM5eGJKOVdhTFBm?=
 =?utf-8?B?ZlAzdE9kMGptL29waS80dU9vTlZxV09wRU9aZ3RGOGxwSmRITFFpQlV1NWFE?=
 =?utf-8?B?MTJnY0ZCS0RETHYyZzYxbldtelRrblp2dU43L2Z2TEdsYWVXUEFjZjdkV3BQ?=
 =?utf-8?B?SVd4bUw2aVVNWkI4MXdSaXo1WDg3STZNcTBvYmNMc0I0eFhRU2FheFlLcEpL?=
 =?utf-8?B?cWUzL05YUXBJZ2VSKzU3SGxyL3lTdUYxMjRwVkJwdDY4dk0xbjNkU2xCSmFT?=
 =?utf-8?B?cWs0Z25Majc1eGZyYzdRWHhvaitORFdZNjU2ZzFrUmNKRURoeTd6UFFhTjFn?=
 =?utf-8?B?aW0yR1duTjc4UjNXUlIrQjBoVU5TWVo4a2RXRjV1ek9tbXMvU25CdzlXMEZ5?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a18a42-89a6-4f5b-a13f-08de1b511f4a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:20:36.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDoOIAtafLC4ZkrRwyX41eDJK+vd7XnvfK9rE6stc/M7Hc3JVw+JTbo2qebRZWPJK4sXoYv/YsNcWIzOVjr+xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

Add basic functions support for i.MX95 ISI.

The ISI in i.MX95 supports eight channels and interface up to 4 pixel
link sources to obtain the image data for processing in its pipelines.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Change maxItems to minItems for the fsl,imx95-isi conditional block.
- Add minItems for the fsl,imx8mp-isi conditional block.
- Add "else" block to keep the same restriction for existed compatible string.
- Update commit message in patch 2.
- Remove gasket callbacks since icc driver still under development and ISI
  could work well without QoS setting when system loading is normal(no buffer overflow).
- Rebased on latest media/next.
- Link to v1: https://lore.kernel.org/r/20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com

---
Guoniu Zhou (3):
      media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI compatible string
      media: nxp: imx8-isi: Keep the default value for BLANK_PXL field
      media: nxp: imx8-isi: Add ISI support for i.MX95

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 31 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 12 +++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  6 ++---
 4 files changed, 45 insertions(+), 5 deletions(-)
---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20250915-isi_imx95-1e3163fde962

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


