Return-Path: <linux-media+bounces-51066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3FFD3AF39
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 16:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A69C3006466
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DFD38B9A7;
	Mon, 19 Jan 2026 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XekxjPux"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78E23D7F4;
	Mon, 19 Jan 2026 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836923; cv=fail; b=YpgsH+RfZwo6HxQcqpgVnz5vB+k6MhXbdrLsm33jqeTEg4dqrJjZrJQ8ZzNsAnv4yx+8Ryo6dXqfyNoHW9AGXY30xAfVfCCFOLgoTUduSwGBUd1ob/lcFJEzIwXbWx6M4M7QpBZ7aooQj7tAvuF2lPv1srW1cgYyH/zWE6v13dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836923; c=relaxed/simple;
	bh=mLYnpy6sCufva/mDG527nizu4WyDffuIfwiqAQMOEAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IObz47rAykaV6iG1dq1GvZQXDyC5Cs8iRN8QJTcQr+DGtMiuj7b5E09R9neDF3oKsn39OD0z7KfDrCMQNCkOUHUkrmj6M4ls449zlFNqpESs9t2HjrVnk6iI4vfBalXAfyae5i+o0QqlRpY3vWg9Gg7gwAW29ZsjO/xHns5fPaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XekxjPux; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTUklO65YtNFovJ0c7D61fn/m3R4WZ1Ms4GuoYbNnIvgDCBNr5r65ZkKrCREp5V1wImHAk6xPk4um7EKzMeBax/5RPufLdYW7UMsWD/RAFSZTr/NawlVCnfShxh76cRL4vg7pVOTOFaVVG6AK69rdQZoNcQ6KtbTT6mG9UQjV7g0ifkzboSBjFvI7+umuNknY8HPmgO7LiXwOVGuLCEYOuu15rSUPU5zr6yKvLzVOtmQEYjhfB8S1yvpHusyyKr89Q45TYKUhztKfy2GqjfCReVVrblsimiYnhc44vfd+jbqqKy6UnULY78nAiCaiAtvzxWmN1BSlmXZQvlfX4cd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/YLDl/CSngaPBtOwT5TxurRg1e+gVmUKjORaces1uY=;
 b=O75L939q+aI5vkLWA3Ok2whhbFBPG4SU0YglDPz6QI+4b99ioGgaUtO7gDHHNRCcPZ4ptvxAokoWnnQY3TH1JZUcOcShthFqOSXpIYhzz37mOEs9y/nKkuAh8xQ8zgj4tbnr5u8eFrfCa/PnfAM9edSpWGRTi/AD6imRw6RVuEjNgw5faaG+kFrkt1Z1l3no8blf119L4XtbJDrRevikeqQGrCcABC3JjKpRAi7u9NGAW+T4AzKzl3Z34j9ekzyl8dZf0m2WoDqGFi+KDtY/tZpGeN3vGD7WKtLrBQMh/QoNO9mDTvj8jeyT6xpaKM524unUsDXD3uJGXO/Mc2DBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/YLDl/CSngaPBtOwT5TxurRg1e+gVmUKjORaces1uY=;
 b=XekxjPuxhEKYAF9CkV7YowUWGi40NoAv4OiOftAoFsuT6ue1JvInS9gqYVQQLpEEaghjP15W3MLojwZcrfzTXgAIaDRjeyaHBsCEIDcnKejQUaLfDhMcrmD5XsZRA1qRLyKUlcGDfxXivyjVYPwnnC5vamvtQUYyP+do8Dr8SExZzL/AkZEMCRBkPV8onM0rIXyz+z/2ILLArjmgvTEotWCvsd1FJnban+REPuHynidax31195Zu/8ZBigqmOYOGlrGxGVvmtmw1gwqosedSrmFIo0xjNk4k6l/qzoA1/tggq2/6I17kjxsDMqwVFiQAWbS/IDPXpflQp2SF/XEX5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Mon, 19 Jan
 2026 15:35:19 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 15:35:19 +0000
Date: Mon, 19 Jan 2026 10:35:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
Message-ID: <aW5PLIv2w+OY7xJD@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
 <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
 <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AM7PR04MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: caa7155a-22de-4076-f94a-08de577059bd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?eMfG+DbUnqkCpL/wPw4SKksyo78IXv19Mh+zY/VvGXUzWP5csza6zlYCGzYF?=
 =?us-ascii?Q?xMQWssthwFb3CW5KEHQLa7ysZjlQviuCEIH3J5iB2Jdro1txe6nNdLH49XSo?=
 =?us-ascii?Q?BHfyDqWEUumPrEPcYWsNAzKSURDo4ifszVkUOXI7k2SsEeLE0CQ+EKwUEbEa?=
 =?us-ascii?Q?ZXPWMvxWjBNH9FGWhrQ/AgXuh3vxD3iTF++yr1eil6EODM1a5gIAuYsw+viu?=
 =?us-ascii?Q?T6adodThclkEYOL0zdW70fjaU86eJlXdJGQC9+M4s8BCdYLxcmw3pHiyvenj?=
 =?us-ascii?Q?5Wc5Ahxe3h8r753KTL9OiUjr7FKXIM43ioVDRTrNGukKWUhFVyah7uJhjfAy?=
 =?us-ascii?Q?YX2P/k8pSNIMhTkh7p9rXBYFsJStDWVod644RKXyvMPqZImdwyjgrkJ49R4t?=
 =?us-ascii?Q?OtWDsiUPozxb6Jf+HrRHAjl5hpnR66/SMMMiEdPY88EYpCcbPhTrsFTW/rVE?=
 =?us-ascii?Q?itZIIIezwGdFYQNRhUstkhZsL5VvVGvVrpXYWqH74/qUakGQln8FwwRVaTqv?=
 =?us-ascii?Q?b1nIDruG+ddoGYGE51M7mGimC4t4yzwQ0TbQgdjKQXxgZm1vm5K6u5Vvap2r?=
 =?us-ascii?Q?9wJGo12hkSGJE8SddEOUem2rwaCjt6Kd22rLsoK2u1w7kjcSBBctmKfNZVby?=
 =?us-ascii?Q?hZa9p5BPc7Z7uisLNbSg8hLsAOriO4M5d8CkeNzomUsqaoQBO+4rN1Xj7K74?=
 =?us-ascii?Q?VO8h2SoGJIeuU8lMe6c7q1DwfOyG07aT0XTPwFwu2zHNZUp/iAi73kQweZhv?=
 =?us-ascii?Q?qyzvfqV/705u56qj1ojtD8fHyhEpMQA+r7iXX9VNfAtVC5XUgjLRt85p1XGC?=
 =?us-ascii?Q?ShhKYkwtFe0kZ4dGg9GGztuOS3QatHtwaYeA0jfYbWeIJ6U2ripE+ZDQqWbE?=
 =?us-ascii?Q?IkTaHFZd9gZzuYfEbuZueFPH8dmS+4pj2p+8mA6V1+wzKFaHFuBH2sP/DA2i?=
 =?us-ascii?Q?ovsvkrODvW0vmW1vf0Vaz8fAgCOEhJXjxAh1KEKKnIqMrKusJ2cvyyRViTA9?=
 =?us-ascii?Q?RdcqjPD27Z0zuIXw607VGa5z/zyWfOn/SczqUIXaRujpFlycuo6OXoslCMXW?=
 =?us-ascii?Q?1IbZjj0nkk0SaeHNUpnW8Vo3GPOyf4IsKsiU/vTaZRRDci+HR+LBrrkMzsfL?=
 =?us-ascii?Q?6xt4NCJ+JlCi+NOTdb5nq6luqm0od/l5hY23v37g6L1ehFoA5MlyE4v+R9w3?=
 =?us-ascii?Q?fUMhMZGtqLeKt83t77D1Dyz0fHyEEHgFhY2l0MelgyYd0yWCaySCfhFOID3X?=
 =?us-ascii?Q?28WiimfEd8ZSCfKT8Eb7t+EgJacjtKP4ylfzjMUqDdb2g/m1Yh2wgQOIOxnC?=
 =?us-ascii?Q?Y2KzPsB2/wCRbitb4gXstRL2Glb6RqZ1EaYxEvZ38PIxcLoq08PL3p18x+P+?=
 =?us-ascii?Q?0IHTe7/48Oz/RlR6pxdsFwAQ7vxUVxHomgCLXZO27Q/MLXukETIVQptD7vCk?=
 =?us-ascii?Q?0c7KILrYuf8g48LiQr0zyb9liPlqjCJrdM9nAbX1bW5Jd1Lqpq1q4Kn7OB6z?=
 =?us-ascii?Q?14Zdnpvj/FzB2bXkXlbO6Cz0095JEzDb5berEMjOtNMIDOwW+WZU9fI/bsMD?=
 =?us-ascii?Q?b0ewPhsRvN+QnYDrgaEdxqAMaUL4Eb6FSJVg0K/eWKg9/C//9XE6dSChDZDM?=
 =?us-ascii?Q?Hwt17pZLSqOs9hOGGFhuX8w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?at53ekwZ0nyMDiCFry0DqFzPlPduaHD7zbpzAwWZYagEhmIRpmJAEUcPWJqk?=
 =?us-ascii?Q?iyYV6/K/t8ykqtMV8OVmB9Rzu0/jowtWAWx7Y2SeA++we1S6fpQqVIT5OSH1?=
 =?us-ascii?Q?agHtl0zenNwJMuGnoSdm/YW9AG1gUZh8cGKS6pRGP068O74R8pPrSgFl40YY?=
 =?us-ascii?Q?dzuXmI1voioP7xo8N0e3Sp0X1tzsafuUAIFqnJH83zGmKgOjG2JRidwWh2T+?=
 =?us-ascii?Q?qTGObBRmE5Dr2pCa/WIjUVioeNjkQxBfwJRqpq9sKYTvDdJUpS6epVgGfu+V?=
 =?us-ascii?Q?EmU5A7b0AmNpcz6y83KhpPPsBu5X+PyOO/tWMwWYl2W7Nk77DpPQlgPJ9rEy?=
 =?us-ascii?Q?ciNjs61TTUFP/w+NtOH23ccC5aS6ZYfgOxkJIOmJqL4IRivs0M8ZOOokFovD?=
 =?us-ascii?Q?iYNKrFPtgnbwysf805WSbG0kSx3r7expJshrUx0pXE4Qo/0UEM4o2Ry7Bime?=
 =?us-ascii?Q?1bhrIXMXoquYiG+WKUIk7ehVSYei96p10gtgYpN7mbRSqpACNnP4GkIztPKn?=
 =?us-ascii?Q?FYI8VK5NzUAq+mNAlYh7T9A7X9+Qs5GAsMATRI44QHiXzOc4KDY+FarIsZ5G?=
 =?us-ascii?Q?ULErCXXspXK+Jbdq/HDYFgSaqKt9YQTz1f61vC/+dwr3+ymKZaNaoac7quWD?=
 =?us-ascii?Q?dUdJortDVLaAWlLzeyZV22PE694zjBf75/YsyMpnWKiT9NOU4AMjWbCdg5A+?=
 =?us-ascii?Q?gJ0MkZCkfG6y0KWcdC1FLbywMibmGDCtkrOZkdGBCYhnT+x5b+xDlJmEfr0i?=
 =?us-ascii?Q?vN1VyMkwed5Y31Eq2IWWf/cfjuXgTATFMP+1nqohrLj/Y/Dj+QsurEkeRB4d?=
 =?us-ascii?Q?p4xIwkHeGmS/SJ4i8MNm1I6kyqPuBdwc0lX1wUogpRo/Ey+b/uyiPyvDCUjw?=
 =?us-ascii?Q?51SFQcRXkGCxDhN7oqt8Eh90/6lzuaFvEwpzVqZzM6wvXefY+JjSOwwANh2f?=
 =?us-ascii?Q?OxPrK2AFWJfx75KEFZjAdUI8pzwJUAmTVkHM77Y4miD5AknqyKx5I8CT7owA?=
 =?us-ascii?Q?UTjRW7T6FQDr9OMajKGznddlH/BpllN5brJ4wF/XOroi65CGc+yeYmelByeA?=
 =?us-ascii?Q?y1x6inAhpbhVDA+WyG55Qjy1PIDd09ggAv6YCDo3cx4YR5mmU7avMaFj23nJ?=
 =?us-ascii?Q?CjS+O89tgx43GlmnSRBR929q4bryYsIUKZAwQwd/XKkubbr7OjT5idNeX78z?=
 =?us-ascii?Q?o/gBhwMC4/oEXihQcoyXiADyjBezuSKPkM6iypbwiKqCadwai1KN0gU7e2CS?=
 =?us-ascii?Q?1JHhSWtx1cq/QxDOIYNiygfng3xO5p9yj5pCcAT80wJ10i0yVB+JAkhx2h/I?=
 =?us-ascii?Q?utGIJ162VEjDZx2l6CcpSobpKgmdX6muLlfO2prVLR91/bckEOwDFaYtNHRd?=
 =?us-ascii?Q?6LZ/xJWGmA7BuVRegjqOycrgpBuLjOtJdKrz7vRcJLYyuuKJfS5GX2bFuJgk?=
 =?us-ascii?Q?8WHS4toUwvIf/niIXV0TShWwMYAM6GVWR/QoO3dosvNYXTNMcfcHfpF2ZS/2?=
 =?us-ascii?Q?Ubl9JPiLBWe7fGiU3S0kmuKBNK2CwXlJQTPlYPhor3K3sHlHBX2gvuZSPiT5?=
 =?us-ascii?Q?sXO00B+pHC9oaL0KfUtB/GneT7gmAiYIbVEw5yMvvtGU/njuyfCo6NSeQc8N?=
 =?us-ascii?Q?u8LdsOVqVNdYJXsTILa6/jAVMxJxUvY1dJSNJ9l5suz5Aj5Ntindm3h3uYoA?=
 =?us-ascii?Q?26IzVqYcrhrYR/FlLIV1uBdA1xecGS/JOeZg3osF1+8mCDxJN0vTmixihbKT?=
 =?us-ascii?Q?7TL1pyaW4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa7155a-22de-4076-f94a-08de577059bd
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:35:18.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /979g+7zqhnKhOM+nA3HsFLJmQXs1mVJuvNvYHYJC86vwzasPZqpdfC5I5YToH5aKwuvZylf+NkRpatR96T6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984

On Mon, Jan 19, 2026 at 10:49:20AM +0100, Michael Riesch wrote:
> Hi Frank,
>
> Thanks for your review.
>
> On 1/16/26 17:08, Frank Li wrote:
> > On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
> >> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> >> one input port and one output port. It receives the data with the
> >> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> >> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
> >>
> >> Add a V4L2 subdevice driver for this unit.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> > ...
> >> +
> >> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
> >> +{
> >> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
> >> +}
> >> +
> >> +static inline __maybe_unused void
> >
> > why need '__maybe_unused', needn't inline. compiler can auto decide and
> > report unused function if no 'inline'.
>
> The __maybe_unused was helpful during development and is not really
> required now. It doesn't hurt either, so I left it in. I can remove it
> if you wish.
>
> >
> >> +
> >> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> >
> > use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
> > handler.
>
> Sorry, I don't see the benefit of that.
>

I remember reduce one goto

> >
> >> +	if (!ep)
> >> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
> >> +
> > ...
> >> +{
> >> +	struct media_pad *pads = csi2->pads;
> >> +	struct v4l2_subdev *sd = &csi2->sd;
> >> +	int ret;
> >> +
> >> +	ret = dw_mipi_csi2_register_notifier(csi2);
> >> +	if (ret)
> >> +		goto err;
> >> +
> >> +	v4l2_subdev_init(sd, &dw_mipi_csi2_ops);
> >> +	sd->dev = csi2->dev;
> >> +	sd->entity.ops = &dw_mipi_csi2_media_ops;
> >> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >> +
> >> +static int dw_mipi_csi2_runtime_resume(struct device *dev)
> >> +{
> >> +	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
> >> +	int ret;
> >> +
> >> +	reset_control_assert(csi2->reset);
> >> +	udelay(5);
> >
> > Now prefer use fsleep(), which auto choose difference sleep function
> > according to delay number.
>
> I'll keep that in mind, but here the first thing that fsleep does is to
> check whether the parameter is <= 10 and (since this is true) call
> udelay. So here I don't see the point really.

Thank.

>
> >
> >> +	reset_control_deassert(csi2->reset);
> >> +
> >> +	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable clocks\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2_pm_ops,
> >> +				 dw_mipi_csi2_runtime_suspend,
> >> +				 dw_mipi_csi2_runtime_resume, NULL);
> >> +
> >> +static struct platform_driver dw_mipi_csi2_drv = {
> >> +	.driver = {
> >> +		.name = "dw-mipi-csi2",
> >> +		.of_match_table = dw_mipi_csi2_of_match,
> >> +		.pm = &dw_mipi_csi2_pm_ops,
> >
> > pm_ptr( &dw_mipi_csi2_pm_ops)
>
> Shouldn't make a difference here since this driver depends on CONFIG_PM.
>

Avoid some static scan tools to report the problem, no harmful to add
pm_ptr().

Frank

> Best regards,
> Michael
>
> >
> > Frank
> >> +	},
> >> +	.probe = dw_mipi_csi2_probe,
> >> +	.remove = dw_mipi_csi2_remove,
> >> +};
> >> +module_platform_driver(dw_mipi_csi2_drv);
> >> +
> >> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
> >> +MODULE_LICENSE("GPL");
> >>
> >> --
> >> 2.39.5
> >>
>

