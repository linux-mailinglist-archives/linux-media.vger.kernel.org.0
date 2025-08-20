Return-Path: <linux-media+bounces-40389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F2B2DA8F
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40DEA166CA2
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B402E7165;
	Wed, 20 Aug 2025 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hKr4aXLS"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CF2E6110;
	Wed, 20 Aug 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687942; cv=fail; b=jtA2KqiypazB49PevOaHL6tRDjzsu5lzAu3EzqsegcQlnOmJbjpSZmXn4TR+JA+a4ih1QrZjkwQBm+gv5il2IbE2f20Pi8taVC+lq/eg3mkrZVxoLjZJ3NiIoen1Hkvrd1NznzRsnVtCqi0mUaBcZRPgK2MYFerqABbTTkyAUxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687942; c=relaxed/simple;
	bh=+MU93QfXHZ+PZzOSCVEvrYi9oSSdBn47b9qqLHfG2Lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=euqC+BvRzLw/KD/98MKAL5nwSPgdI0wQq/xv4Qw/R1DDKm2rrDA8Zhj+mYNfZqPORx7GDoekO3fOhP44vxIdqN/cKzmcbsk9Wt8iIdsMMsZ9NlHmhrhEzNuEzYrHGRdyx4H+g+UFmeLwA028/tB70aRdFeUyvR37iubzldPaVMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hKr4aXLS; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvfylvYEoFGeLi2i+qC9lFeh0HxJelWWe4GgXM3jYu9IOYCo0uoCcqsLaF9PJ+cWExP6s9Z9od1eBMr2ZhXKoVObdXCjrDQN1CdT3GJpumX9e/UxHdIaE/VSrlbgX/5uusxAZhh4MZ/XUh5AsZaVSOQY2Cu+UIEY1uqFRuLamD+L0y2NhqGNH3/4K8pEC+rRRFP2ly+F9626TTqb1iQ/n8yhp/sV36nfkXMAtHqZ5lidv9tgo+9bPgc5PlgJPVNMsm+iphDcNw0qNDofinzq+Mk9RHtZs5nwPd9zmVfztc24AKQ9gqKkpgPIh0kSXccegoTCfwJFv6u5SOmsaY1y4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/He38BwOve64SoyFk8qCen6DToL2e8S7aAbMgGQo+I=;
 b=A+ERY2Gm71WtYJwpbPdpEguEK1UFtM185BBeqyg+OMlwNnNcJLBk3CqtI2e1FfmNhgCkOzJEO3uaavXIxxqA0OOiee87CGVW8gmeR+qvDDBBMtZI2M/FUoZEd2J5V/SLIhz7EuSWIsfV4VC3AGD8y3RVKFSiKlCsE6lPVMt0N3w/bDUZVTtjbZniHIzpusla9P7D8AZsJV9QQwXJrwFADVd/UIpsfzGG3hbhpbx6ecpE7Oujg87vN0/N1D/Mcr44vNO6rxKuWxwGGzvUzmgbIXDfA2oQx1e3Fab5RylCmvbNKVyEY+Ds306ASM4c1zA1kkpXCcDG4GljkJHXjMAg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/He38BwOve64SoyFk8qCen6DToL2e8S7aAbMgGQo+I=;
 b=hKr4aXLSiHulNYv+M1TSiSOJc/c6bK6d7BaD/qj++kmrhIuoBgC3nziEgQuij3q7D2AL1+Zfq7kKc9l5iEMckOEiUPUofk1HZfLCZbkUwPR6gLQUXPjpn3ULGFeEA3BiBpcCDGzRq2hyyOHDB9EkSvq4zdBr8IAttoQce3HQFom/Dd2NsWj+eN78vC2+Rtmi4hE6HcYX0Gj2LwHy4exXZOCC3yWjK+W50DP5ijPrmvtRgfM1tJn1WVuCIbNnFXnQ0/Y2EUZYtExk9Em/fHJvsCO3Yd1Y6LB1IQAcq3dzvC9r8MAFNp0GBcRxC7XWxjIjFFzucxJYQmn62Z/51SHv6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10913.eurprd04.prod.outlook.com (2603:10a6:102:484::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 11:05:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 11:05:37 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 20 Aug 2025 19:04:58 +0800
Subject: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Add RGB format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
In-Reply-To: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755687914; l=890;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=+MU93QfXHZ+PZzOSCVEvrYi9oSSdBn47b9qqLHfG2Lw=;
 b=HypHF8qeJLBkvWXOzNY+/NTlr21otlJd2ipRSGEyJHkhtldUCmM4qSkESmzwOcOg1YVFezDKw
 5GwBj8FLVHwBe0LayMwboi5zEasWbHcjsAiQkhNIFtkL/e0O+IjU3Ut
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d154446-eb6e-4985-dbd8-08dddfd97e3b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?em40SVQ0TWp1ODlrNWYrb1psRDJSZ2hTcFZqeUdIVWgrekdUR0U0WVFqVjd0?=
 =?utf-8?B?R3JWWTJKYUtqelkySWp1aStjZm1zN1RNSTFqMUlOcy9hV0V5cXF6ZXcyUE5S?=
 =?utf-8?B?cXQ0S0Rmc3ovT05GL2lBZmkrWEQyRG8vZUVPRWVDaXROdXJVMUFuSnJhSVhh?=
 =?utf-8?B?N1hWbk5Xc2pQS3lESlRrcFNxdlQrc2pnN2htcGwrQWltSmRScytZUld0L0oz?=
 =?utf-8?B?ZUpDWk1ZNEdKNGxhTGp4bHlFZFN5bUl6YitQbVVoNmp0SUNMci9DZ2duV0x4?=
 =?utf-8?B?c1ltMTU4RVdMT3hEQ0ZxU3A1SW1oK1lwNEpkKzJxVWRESXg1TFBQUnRCdDk1?=
 =?utf-8?B?UDJybGc1d0VyMnZJK3MvSEtUZUNWOEtoejhJa1U1ai9DeUdQZnpUN2ZXMHFI?=
 =?utf-8?B?VE5FYUNxR0ZiK3R2MnFqWkw5OS9CbWVNV0g0WVVRaDA1aURjcmREV0V4N3lC?=
 =?utf-8?B?R0lSWDVKTVlCZG5weFBERWJhenF1SzhMR2tEV2ZGUmJic080R0RmMDN1SXlV?=
 =?utf-8?B?U2ZjNjRjYkRoemFVVS9HVEZVb2V3WEpGN0V1WDNCaVEzTG5KbDBwOTlPMDAr?=
 =?utf-8?B?ODlxeXY5dXg2eFVIVUhrWDlzdkQzZUhZd0tEdUJPSXMySENLbDJScFBRQmZT?=
 =?utf-8?B?T3FDVnhmWnZjRXMxbTlmZW9uU1hiMkxDS1kxbTlzOXd2Y1MxNVU0VXVGdlRJ?=
 =?utf-8?B?Rk1idjlvSDd3S2dNM3lENFFMcHpCdkhySVcxRUwwQWFYTXNUR3drRlBiNHdi?=
 =?utf-8?B?VTlzSFA2MVRDV3ltVkliVDZQNXJxZjlpdDE5R0Yyd1hPWlNkQ2l0T1p6NHR2?=
 =?utf-8?B?bjlwVFBOUTJkRysyR2VFTFo5VDJJb29qWEtNL1cyMWhTeHBXczhKUU9SSTh2?=
 =?utf-8?B?OHd6R0Q0aXROczNCaDJuUzdCc0MwU3JGTGFUakUzTXZLcXVKejBFSk14ajZK?=
 =?utf-8?B?TldJampnWHUyaWZMSVZqWmdIZG54Mlp5Z2xBNVUvZ0wwUVNxdVNYWWUxSldP?=
 =?utf-8?B?UDRnZ2t1SytFOHFUbU54UndzazFyWU41aStrTlhYazV0Ukx0eXMxbCtCV3Q5?=
 =?utf-8?B?K2QxTGttV05RVnhJMXQrYzl6YVNGUEJwRzhYQlE0U3E2RldQbUIyN08yZEEx?=
 =?utf-8?B?R0RUT2lHckVXSDc5Y1FhVUNydHVycXY1dTNHcXhKUnliRHlpWjFrakx4ZjRL?=
 =?utf-8?B?QkcwQStWei9iMlI5OThNTFQ2MmNBNXV4TGt5OTFFUkk4b3RMRzRXbGl0UWZv?=
 =?utf-8?B?RjFSVXduOXpxaDQ3bjQrejRHTFBXemtkNUE5L0tLeE5RMklNcUFMSnRGZERF?=
 =?utf-8?B?MWNRTlE0NHRKTnBQc2x2bFRCRFlOcllySTZicUFxVzBGSnBBRlpERFNuRXpm?=
 =?utf-8?B?WDlYSm5hK0pzRXRuOUd3TFYzbkczY3JuWnZHeVdSL2xydmZhQnZ6cW5tNW9I?=
 =?utf-8?B?UHd5RlVvY2QydXNyWUMzMTQ3YTVYTzBRMDRtdnlVRkpWVGZFL1FCQWgyUHY1?=
 =?utf-8?B?MExuT3J0TlFtQ3pkWjg5a2pvT2NabThmMzQ2N2syT0NpZ2U1S2lQS0dWRTgr?=
 =?utf-8?B?R2dhZWF5eVVjRUludk42UGFwWlBDbi9IRlBvcjB0YnJpTld1SkIzZjB5cWxD?=
 =?utf-8?B?ZjR3YXRoUStmUlNpODNUKzhZQlI4YVM4bmUwVVlLV2h4cExpek9taUpwQnIv?=
 =?utf-8?B?bGNHMFEzRCszSGVnSHQ1Z3k5Vy8rZVN0Qk5kcGN1VytRUnRnUDdCZmVXcWxx?=
 =?utf-8?B?djZXM1NMdVcrRlVDTjFSV0IwejBDRXRNNldTWDFPQ3RhaGF2UWIzQWVTUDlj?=
 =?utf-8?B?amN1TlQwVUJ1ZkNHU0EvTU9wRm1talFsOHltS2JJM1BBOUk1dENNdXgwV0VC?=
 =?utf-8?B?T3FscG81WWg5QndVNmdyUitETDFVTnVYbHhYc2piUHMwVzR2c0I2cXRnb0NT?=
 =?utf-8?B?c2VORDJyQmdldzFORVlkTU1hQmlESUlEZ3h6dDFvdms4V0lIUjRjRlJnWDE4?=
 =?utf-8?Q?4Jz+IlSJOpLu6yJWLTFzydGKj0+shA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M1U1TEg2cGh5US9nb2FNMmJJMVZMaU9yOURrZnUrWmpwak5DMmFZRlBEZlR2?=
 =?utf-8?B?WGZiM1FsYUdqaDgyMkJFT01VVHcxZ29Qa3NQL3VuRFNKd283S1RKd093ZG1P?=
 =?utf-8?B?R0lCdmZYV1plSTg5aWtLQ1FreXR6K2xDZjF2TVk0Sm1zcm8xb1lwL1I2eW12?=
 =?utf-8?B?Y3loK2pxdWQyTGJuSXhGcS9zUFQzV0UvTUdDVFBXbkw2cVBVRjlaRCtpcC9F?=
 =?utf-8?B?TnRkS0hJUFFTb1BJcnVvOXNzYXBPbnA0VkhDWFN6cllHRDVXcStlZWVxOVlt?=
 =?utf-8?B?OVlCcXp3aUhOSDF0TmRLNjREb0JON05EOWVUbDUybGkyTk9uMFp0VnpMN0Fa?=
 =?utf-8?B?Qm44enA5ZjAwNlIySkxOMUZyT2Y1WGlKRC9PdUp2YzBGU25XMXNXSlV2ZnR2?=
 =?utf-8?B?SWd6V0NDRFZXRlV2eUhEaE53U0c2OEVCRWVGSWNCSGpSZXNtb0tOQzRGY1Vr?=
 =?utf-8?B?RFQzTXcrYkNrNW5hN0F5eUlsRG5UN2dFdzI4Z2RnMFo2d21zdTF2NGVRKzRP?=
 =?utf-8?B?RjVWZWcraXVYbVZuMmV2Tis4OEMyaWhnVVVmbndnNkpvb3c3VnFUM3pJNnBI?=
 =?utf-8?B?K3ZwUy9CelJHNWtmWEdYaTJ5c3hnN0dSOHJ5azEyV1k0SGZkeFcyQTlLWWhY?=
 =?utf-8?B?blpRN2lLQ0R1QnJ6UmF1ZFY5cnlkK08zTUhMcEtFVHdQWm1CYW5yUG4vek9a?=
 =?utf-8?B?dkk1bUFvWU9JRXRjeHZxMHFwNy9BT1hpc0M4MXJGMVYyQ3dQMEUrcTNMeXZy?=
 =?utf-8?B?MnNzdmNTbHRBaEZMcXoxK1cvWkpwWTdudkJxMk5kZ0RsQzNpc2Ntc3FDKzJ0?=
 =?utf-8?B?WHFvTGk4RjVwNnprR3F2TktyMWdNb2lBdk5pamVTTkt3Um1FdVJQY2JpTVpj?=
 =?utf-8?B?NHc0bEJVZ29EeUxCQVNrUVJ6Mlh6UEd1eVVDRG9vMXM5SUZYU1ZhQU0rUjNy?=
 =?utf-8?B?Ti9iKy9qejY4NGxheXBoQXZLSWYyL3dnZ1ZqOUt1azh4c2QrbDNCK3RwOXdm?=
 =?utf-8?B?Y3hEU0pyVnpyL0c2QUhFQlUzd1hJTFdtQWFJZjJSVmZhb1V2UjZKRTJSV0do?=
 =?utf-8?B?REIvYjVYMHRMME0yUjRFUTlKc3BrTmNtT2tmRFdYTGtEc00vSWFxYXdodVYr?=
 =?utf-8?B?dGdaL2hLVEFjRFhwZDNRcjVlVENJcW5zRGRsbTlPcEJtRmFkYkZTeDQ2eGFq?=
 =?utf-8?B?T0tOTFl0cWNKZmxjcFB2eW44S1oraTFTYWdibkVHNVRDNzFuWk5xTDcyZmNw?=
 =?utf-8?B?dDNObTkxelEvSURxeHJGSzJ6NTJaT0d2SzRvMUJZaUpsbTViSXdMZG5md0hH?=
 =?utf-8?B?R2J4ZU50cFQzc0FJakZmMXo0UXd2SlJlUTAxQm5jdFF2KzBHeE1oU29RbXhM?=
 =?utf-8?B?VmNnSEwySGROdEFXRHUzUCtwV0dCS1FUZ1IzWmdFR243TmVzNUFiNnROVjlT?=
 =?utf-8?B?K1R2RGx3cnNpV3NsZ1pQeHJPZm5IYkJOZENDM2l2cUZIcTBQZVZsUmdaMmJJ?=
 =?utf-8?B?dDJUYUVlWGRnMVF0L3djdXl1Q2hQSWN6Q1dvaFZ1Wkd0SXJZOEhRWHFHb09O?=
 =?utf-8?B?eHdzYXB5UG5OT2Q5V2lRaUxjSzNReHk4VTQwNVRGNG5sUG1WTGMvMFFhOHdw?=
 =?utf-8?B?bThsbWFkOVBTb0NoZUVndnFGcjlKYUVzYVd6cVlNVzc2cFhROEs4RkZVWnhM?=
 =?utf-8?B?ZzRpSWdFWm5ORGhqeVFJMCsyV05PVVJ2bjhTVktQZDBHOUJTY2kyNlUyM3BU?=
 =?utf-8?B?RU01NWNSWVc2dGxqS2JkVW5FRWczQTZuaUF5eElmek9VcCswR2toQ25GZDQw?=
 =?utf-8?B?WGRjckRiSXBjaFBYL0hSdWhwb005RkpiV05QVS9pOE1yVHM1aWM5YUU4Q3ds?=
 =?utf-8?B?Vkt4dzdCMmxVWWJXSVhxcEw4Y2VnRUorZnU0SlR5eVFCWE82bUh0NFVuYUds?=
 =?utf-8?B?RnBySk4xZU1Ed2tHeVlhZ0FWcnBDamZzR0xGMDFBSVphMGZTSmlWdVB6TlI0?=
 =?utf-8?B?cnRUYXE2ZWRTMElDU3JxZytqZGdHZ1JjZDFTeitQbHYxaElGVGUrV2JoV1po?=
 =?utf-8?B?MW9HekxPZHY1QVV0ZTU5UVFVa2JJQlFWTCtMRkx6R0pwRS9XWkVMV0tKb3ll?=
 =?utf-8?Q?2QZlQ3I+oQhaJigGND5xOYMcy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d154446-eb6e-4985-dbd8-08dddfd97e3b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:05:37.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGOt4GN/c/pYxc0cL6vc73YuQrQy6uTpl1FAFVlJt6zq2oGAp+dMwcPd5CHP3pZ72e3am+d/cSe41oqua8UxRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913

Add format RGB565 and RGB24 support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index ad7adc677e389e0f35b0cf63195279e197907f8c..529928b94a193e02177f8773a0e68375b59b0a08 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -306,6 +306,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
+	},
 };
 
 static const struct csi2_pix_format *find_csi2_format(u32 code)

-- 
2.34.1


