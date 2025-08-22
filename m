Return-Path: <linux-media+bounces-40704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F6B30A8C
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15BC1D0129F
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C426148830;
	Fri, 22 Aug 2025 00:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lXMbjCrT"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E671347C7
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 00:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755824310; cv=fail; b=bCFxpU8cLSBEk5Kdft+Epj6sh30yhRGjz7K+hjz4nt9gAUKWKi5bz+VFlshWXAK1/SWpOm1DNvKtOOgjVtYZRhXty2dFjOCDdOI5N5atr9IqiwWRKAvgOsf2PxuDl3fp7Oqpuu0dJgzmjT+5uILcLP1pnx7JluscgUNaJEx658s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755824310; c=relaxed/simple;
	bh=kV4IvgMFSSs6xd8qS4tpMju0OJJie0ypsI3myJsDj0A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fPqXdrmj4+BkL0nuS0zgi+WOefFH0+WpQUWCBVuCTcSHS6DBWtzCIFbP+YIOzJW9rSdyWDBqntDfhnSVATmn6udSwY2ilNuIxukNu7qme789J3XXEqUytdyPI/Aa4OYBRukKH/Z+8G3tPy8+TaSR/Nv739YBQ00rbv2TMA+jfsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lXMbjCrT; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hy1pGOiEHL1RN/m+C2SRW5EOCrWw1u+D7ficcClf2ar3wyOEbw9FGdtH79wMigHOi/TzT1x08PW9I4jBK2N0OADbaphA89aGpsVA+ugwnE6nDiEZy8ZfpVsoXwhkAaow2RcC4s70LOq4VaXsUCyRGxFsjYuVfxklnZisBMJcGqx0jvcIDscGOR3dcoyslFsdrMqca6VeZ8+pIkcy9oxUOUsuyWqfQyhD2p9MaxThNoYHw8OQm+n4YoMHAoVW7fL7732uxbN+kGnuka1A0wzJwQ2INf5XADbBEXgvUd7sj3cGDqDJMi892faGuKq/HlF2HMSVjfu4+2dY8KE8ehsmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwsSAZ8l+EgHyYbE8++oemLo2R39z8Y1k6y2J9S3ej4=;
 b=kyvawPazyVadZfGvHrSH6e6irzYdeKSaIQEisndqA6G1iMSDkoQYNVHOW3x0texJgRx18SzrdeorgcrxOoRe6wfUqKSM3w4dzgdqaywtE+SVTO2cdHsOGu6MV+GLFZSa3lMEsfGuSgLa0NTCYHjYyF447Sv0odNV5XqwqwVzjYzqaEL5jh68oRU/WfvM7qaA1gA5HjqQXVtIwBujBKWp43Tk1NXDWMvvNc8EWwuUk632ssCiwfRpvQmlb9CFoP7e93fXL9AaTZ7QMTpZxN+WQGv2x0jzfng3n7XFygGpnbyb1QTYVEu/THyv3zfDrS0LdjJHeikYEDQ0KqD723GAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwsSAZ8l+EgHyYbE8++oemLo2R39z8Y1k6y2J9S3ej4=;
 b=lXMbjCrTjNURlRZdfc5RxdOPdBAoraGJLFr7Lkd/bYbNYozggLZQtSlMrEQlV2Urggck54BdaILmIIJZPwfYvKznXmtRoRY8hVOIm69m9KHQoGj4SC2mSK84SXySwuz9jrQP62DHsN/9nIntgdibIL3+nuDviJLTrVwMkxlVGy75NpcZ5O9L4RVxCpWMaH+AC2ke3BDjBarzNghK+s3v+e3ut/qKnFa5uWvMV5yMxvSk8cLcNMbVVCQbHfuq65wFfh/Ow2HgSy4Qr4Ju6dwjSr3PQ/YacPM8leoJ7PkbSernW8NTWYgp+7UfKcH2PIcNVDSoYeh/bLFNCTp4uCdOCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Fri, 22 Aug
 2025 00:58:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 00:58:25 +0000
Message-ID: <c1289df9-01b1-4c0c-ba09-7cf18ee8baaf@oss.nxp.com>
Date: Fri, 22 Aug 2025 08:58:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: Marek Vasut <marek.vasut@mailbox.org>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
 <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
 <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
 <b1a39526-92c6-4fff-9376-0354bf2f8ff2@mailbox.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <b1a39526-92c6-4fff-9376-0354bf2f8ff2@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 24314544-b1c6-4074-e778-08dde116ff54
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?M1JQdUY1RTJQYmRGdkh3TnFTMk9wMkpMTWMvVk5jMTNMdStEV2U1cUhXSTBF?=
 =?utf-8?B?b3Z5eG15MEVhanZjdXQ4M1cyditwaExLc3RKamZKTUliTkdiZHNRUTNEMkVJ?=
 =?utf-8?B?Z2p5RkZsdW9tUk5IWFV5MkEzVzVuYTA2aUpTRUxCdXBHQ2lSWG5DTjVzZDh4?=
 =?utf-8?B?Y25NNDF0Wk1yN2NjRTVITDFQWW5sN2V5S08wQ3dJaERaK05aZHlnaUV5cWQr?=
 =?utf-8?B?WlJFc2dwaldMNjNrU0lZTzBueTFnZnZVdjYyOXk5K0FUejk1Wjg1OXlFTHlq?=
 =?utf-8?B?Ull1RHFQeElkV0VhVERFYkJ1ZDVUUWdHanp2Y21aLzVlQXFyS3BRaFFnY1pK?=
 =?utf-8?B?czNuOVdVUTdReXhqWkhDZTc0YUwyZndWOG5VTGRQZnBVTS93SU44ZUNZcWZJ?=
 =?utf-8?B?Tk9nMjBicHJxbHlMT1h6TUVhc1BwZTB5VHUyTjgzdFJ1THRVZkluQkFKSjdz?=
 =?utf-8?B?MUFVcmM0Z0R2TU4yZmc0SzhacTFndkpWMXQ3c1FacmxscFEvUk1NS1o0dmNn?=
 =?utf-8?B?b2NZTmlueXl5QXpnUHI4SlViOVZVc2tSMHVYSmdNN1BlM1E0cWtpR3dzbjU0?=
 =?utf-8?B?WXd1T3JtUGwyL3ZyZVRzaFU1cHdiNk1ybWVzQnJqTitiZVRQeE00RnU2YnBm?=
 =?utf-8?B?ZnkzcjlGdnh4dzMyV000dHk5Z3k2NXIrYTljcmNTMHZjU0FyUEpDRTFRc0tn?=
 =?utf-8?B?SzRwZmRtTEd3b282TzdyT3d1TUQzNmdBV043eFlwVzdkdVJtSTU3cnBIMWVN?=
 =?utf-8?B?VlM4OEJZeEM0S0hma1Vna1FOSUZqSUxndVlkMlF3YjRWNU4wZmNneHdxYjg3?=
 =?utf-8?B?TzY0QUpIaFEzWGpUR05zUUQ3NS84TVNrMHI3bHdYTWpYN1hseHF0ejRvQTJY?=
 =?utf-8?B?ajd2WCtnUXFNREQ0d1NUQWZHMVZMZ2ZCYkxWMG1TSmZlWk1uQUxGRUZ5V2Jm?=
 =?utf-8?B?eXVMYUNiYlFnK21lYU5iVXpMTi9qc1NEYVdmWEVkNUY0MkZtUkhWOUh6U2Fa?=
 =?utf-8?B?ZTVsdjhKa2RmWXlEeFhYWHU1a3YydzZDakVWYmQya0FVdTR5NmNWMWZ6QS9M?=
 =?utf-8?B?M1QvN1NVOG5zQ0hySzB3c0ZPdndNYjlkWmFialpRYXJUVzRIWXg2SkFIUm5O?=
 =?utf-8?B?NEJ4c2p2akg0bmRXZlZlVjNGSENnbE5aaCtFdEdIRWRwNEl2bGU1OUpjZDFZ?=
 =?utf-8?B?Q0NIRGZTUnMySThKcUJFUllUaXUxNXAzNkVVYW1MY2VnQVloM1p1anRsTTdT?=
 =?utf-8?B?RWdmUk1xWHBzQnhFRzJ6d3dGazcva2M4eCtiMWxYem1OQ2xHdDBISGhFdXlQ?=
 =?utf-8?B?MUduK0xtT0dBc2hRc3hld3o0cVRLZXFmN0F2STU4cjJvczFKejdDYkpGKzI3?=
 =?utf-8?B?S1dpeDVzYWtaT1kwdGxkUEFpOHQ4YytnbjJmY1Y1blBXallHbXhoak9ic294?=
 =?utf-8?B?cnlxV0N3ZDN3MVA2SGMwWWgzeHFhVXVEK1pTK3AvNVRNTTVzN2lXbUtTeW8y?=
 =?utf-8?B?dTlHSzhocDVOdjkybDVDRjBPRVpRdnl4ZFI1WWkrbDBReHNzdzJGanlZVHZ2?=
 =?utf-8?B?bDBxbUlVbFllbUJWOFRMVEN6dzl5WUd0S2NmZWpJNm1sbXcrNEZnVkdXTlA2?=
 =?utf-8?B?YzZCYUZQRjFDSUpLU0s1ZEJNV1oxd2lqWktucHY1d3lLbTdzR0E1amorcUpW?=
 =?utf-8?B?ZzYxM2p5M2VnTCswaFN0TWREdFF4UFhBWlU2ZVhEU1ZXQWtHNFA4SGJjRjUx?=
 =?utf-8?B?L0MvMjJHQ0Q2d1IrM28zTDhmWjJEUG02UE83SnlwSUhTOUxrOWVsR25QV0tU?=
 =?utf-8?B?Q2ZzeUhTZlBrMFVsdmM4c01YOHdudkVHNkNTQ1Bhd09OTHlwNzc3TncvSnhX?=
 =?utf-8?B?T3VvOGx1SDRZOVJ4ck5MbzA1WFJhYTErbUg2Nkg5VTc1dGpENFN4SWlWV1Q2?=
 =?utf-8?Q?7y6elvOn2SM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y0svRUxGOHRoNkNhR1dnWmZzREF6ZVpmY2dpZWpkc1JqSXUzYXZ4ZEtXWlBR?=
 =?utf-8?B?SWk4bFZxK04zcUU3cHM3blAyK2tYbFFxdS9PbXpsdzl4NG52a2VRYUFqSDhl?=
 =?utf-8?B?UktoYkVxa0JIZUdscUo4ZCtPRUg4U2tsZi93OFovRGF4RTdqR0VhUjFHdnI4?=
 =?utf-8?B?eitFR09RRjZrNVUydjFOMW5YSUlXUkh5TjZJTVhWSnJKM0Z2Q095U1hvWjZl?=
 =?utf-8?B?WjltTVdGYkNBc0F1UGY3SEFFRytaQXFKZG4wU2h5NWg0SzlmekdvRERmMThO?=
 =?utf-8?B?aEJieGFBNEVIaG1pMWJ1czVhcFVGREMwdEZWUzJhYStxR3JmUjJ1SDFMazdS?=
 =?utf-8?B?c2pJUWVpL29LTVdSa0kzTDJwU0hiT29pYmxjb2NBaWtseUs0TnN3VmQ0OVFR?=
 =?utf-8?B?dHpWcm1iSkF3RGg1bmxpZmVybml0MUxhVHJHakw1bVJMTFh5RUtlbnBmZXZk?=
 =?utf-8?B?cHZweU51clBsanc5bEQrVUdUelFNcXg4eExCem1JaGo0L3plT1RLVUpXRE40?=
 =?utf-8?B?RzFDRitZQ2dWaHdtUTI5MzdzUXBEN3FhVk9KWkhlVmQrOTNUdVRGcnc5bFJG?=
 =?utf-8?B?bkVKZmg0K0FFZXAzZEd3Wi9yTXVSdVBBbk5WcnArZm5yVlNTeE54Q2RNZDBa?=
 =?utf-8?B?OFZ2RzJjOUwzSDZLTjRtTDJBNW5UMW9PeEtYNC9LdVJwY21tS3k3UUxVeWRy?=
 =?utf-8?B?eFFUNktqakZKL3BtdlpFV0NydjV5ZzlwY1RlUEMydy9jOEsvbjRVb1A2RnFT?=
 =?utf-8?B?aWZjS3F6a0lTakVLRHQwRmlPYjg1akFsZHpsRVdWRTB2Lzk1cko3MFlPdVZR?=
 =?utf-8?B?MWwyMmxkMTQ4NDVVNnpqRmZsaVVlcG5GczJUMnZPODExOGVHc094bk5mV0Ns?=
 =?utf-8?B?ZXZCZzBBQWswdTdyN2p1ZVZxcEo3SmxuNkd6OHd5eDJlbTNNQmJibzZkeGRM?=
 =?utf-8?B?eFNvOFZ5aytZUTJNSTRkc2U4V0JCbVU2d2ZVcjVqU2liS3ZrQXhhRDRZWFEz?=
 =?utf-8?B?OS90VEd4Z0ZWb3NzMEo4cVNjUUtEUy93dVFsZ2RuOEpoTGkvMFR6Y2oydnRw?=
 =?utf-8?B?djZ4T0xUWHVjenZ1MVZYZTUxNHBWSStYUXAvRUxUbnNKbHViRDF0V3Y0a2Yy?=
 =?utf-8?B?b2VqaVI1amVyUm5ydGNSbWNiQlRWYitYZnNvMHkzWlg3ZkJacXZRL1FVa21H?=
 =?utf-8?B?MHhmTm5yeFd5aVpBM1ZoNU9pbk15RWh0T01sTEk0MWFDbEpyblpuZWw1a0tC?=
 =?utf-8?B?VCtURDV1K0QxRHFRQmVXRzBRUHcrRnNXeTM4d2tmQnZDVHh3N0FSR2NnYWNt?=
 =?utf-8?B?NDI0eHE4QlVpVkRWRHVVdVJIaDZhMlpaY0hmazdFRW44L2gzZG51Qk53eERz?=
 =?utf-8?B?RkZPbFRuM2ZGK3lHMlc4WGNZZWR3Z29KZU43U2M3VGlWcmVwSTNBWXJtT0hM?=
 =?utf-8?B?MEpndXRlOFZhN2laaU01U3M2dW1JYjA0NHErdjhqUnlzYXFaM1JSSjRQK1pU?=
 =?utf-8?B?OW9EZmlhd0FzeHNXb3J3N2hKREt4VkxEVm41S3lmYkR3b3J6cytVbkJPWmNV?=
 =?utf-8?B?OGQ2WjVUVWw3WHBSUDNSMEdSaTBKVm5kTW41Y0VEVXIvTkRrRDdOOGF1QStw?=
 =?utf-8?B?QldFd3dpSWVaK2w4QW8xQWhiZlhQQ3BEc0VKbDZDaWhualM0Z0hPZkhTbDd6?=
 =?utf-8?B?ek9vUndKVjVjUERZa2NZZjFyanhueG9ZT1Z5Z0hTUGp0R1RkRVpMR1M2eHdm?=
 =?utf-8?B?eFVhTi83L2FNWWtPSkQzcDl6QTA2Y2s4a1RjeEdXRXkvb01qWjZ6NWNmZ1JK?=
 =?utf-8?B?N21BT3JQS3paYW50cGlBZUdBUFdNN0RyMWZ3TlNlNnlydlVEcVZYQnNWZWk1?=
 =?utf-8?B?dzl2amtuSS83TFdZYUdWMWhQeHFGWFRsbTdxV2t1elRYVEIwbm9jRjYrNHBF?=
 =?utf-8?B?ZGFXVXZRV3JhV0NWU2kwbUZHeUp5VkZSbGJQcXkvTE94blBrQm9FUWsrZ2NP?=
 =?utf-8?B?VFBua1cwV2Q4K3p1NXlmdSt3aFFId3pRb2FHRFlCZGhSdWRFM2N0akNrYndS?=
 =?utf-8?B?QWVSdEorS2txaklVWGJKSGpLb0xMMHdaa1RLemN1VjNseVo1ZmQ5RzQ3TllR?=
 =?utf-8?Q?r5G5itz+uSRo6j6BCUWkRY7Uc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24314544-b1c6-4074-e778-08dde116ff54
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 00:58:24.9506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfTvtwvBgPF1sHRVDLoiiO8AX2hu9NQ9DJ8YQIquWfVOwx4qDyHAsBRRvJWxS/pDlb5yi8Mp4SS2dIJ70R/LEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9073



On 8/21/2025 8:01 PM, Marek Vasut wrote:
> On 8/21/25 11:42 AM, Ming Qian(OSS) wrote:
> 
> Hello Ming,
> 
>>>> Using sram instead of dram only improves timing, but doesn't 
>>>> completely circumvent the hardware bug
>>> Does it make sense to upstream this patch anyway ?
>>
>> I think this patch is helpful.
>>
>> But so far, we don't have any SRAM resources for jpeg.
>> The i.MX95 does have sram, but it is very limited, and it has been
>> assigned to arm_scmi and VPU.
> 
> I found out the SM can work fine with only 192 kiB of SRAM instead of 
> 256 kiB of SRAM. That frees up 64 kiB of SRAM for NS world. Each JPEG IP 
> needs 20544 Bytes for descriptors, which fits into those freed up 64 kiB 
> of SRAM.
> 
> The alternative would be to handle those AXI read errors and restart the 
> encoding. I always observe these errors in the CONFIG phase of encoding. 
> Do you happen to have any details of this issue you could share ? Do you 
> know whether the problem occurs only during CONFIG phase, or also during 
> image read phase ?
> 
> If the problem occurs only during CONFIG phase of encoding, it would be 
> easy to retrigger the CONFIG I think. If the problem occurs also during 
> image read, that might need some more creative fix.
> 

This is a hardware bug that affects not only the jpeg encoder but also
the jpeg decoder.

This issue occurs under conditions of high backpressure on the AXI bus,
meaning the latency on the write/response channel is high, while the
read channel latency remains low.

When error occurs during CONFIG phase of encoder, it will trigger a
interrupt. But in other phase, there is no interrupt, then the running
job is stalled until timeout.

Regards,
Ming

>> This patch makes the jpeg can support SRAM. Maybe in some scenarios, we
>> can assign the SRAM to jpeg instead of VPU.
>>
>> So for me, I welcome this patch.
> 
> Thank you
> 

