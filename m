Return-Path: <linux-media+bounces-35820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE7AE6EC5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66EE37A6E4B
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29E92E6D20;
	Tue, 24 Jun 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="laXLc64u"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012044.outbound.protection.outlook.com [52.101.71.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DE93074B5;
	Tue, 24 Jun 2025 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790484; cv=fail; b=ntoTCpekRvhDgsbRk0wkQcg0pGtaDURjqx8LKGyYwDRnpWaF6FUPSJXgP11ROGf8DcCBDzcU47/ZhsLgv9gM6jcdPwCoO5bpdEbrY+XUkU8dGUZoj7iD37uTvbQFAmsc/5uHj44QzZk+PEXBUGlYVOFs/2hV12OpX1Vhakrwpo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790484; c=relaxed/simple;
	bh=BLGa8xESCPQlzhAWmAyjbh6pcJr6l4EkUnVY5WT0cVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MOcd1wvqSuQirX34nNUNK1OXBPuDb5MTJYJjhfkKIOJazOwRa2aIFLLeLLMiA6Nj7vWQ2SpiYohf7BPTck3H5aStsovzLeRbrmxcitowKWS4pmgr5HQTBtT77JzkMvPCrzDYk4Jkfhal3UZ+Y7RiYQDMEuQGzroD1WF+7tIRmoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=laXLc64u; arc=fail smtp.client-ip=52.101.71.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvulZ5LWv+brv0jmVDBgd0d5Xrhkdq12XltWr4wuI9n4jXbLR2rOnM+kcRGYZnVmZ/pXKxIhosAGys1Qwk3FjXt8uZZXUeuhZrMpKKQ9wzPYLLIKkjDFp1WgxXGS0V0hcMAzOh/HAxsXKgnlLPU7/VGWBQV8TSwfHs8802qHe+RjtkLn3GmwRaQresf3yZjYr1HgJoS20D+4PhJDRVcFGv4R11+kGUA4uV+jNTx86YvKqnAIt0XD0LXHcPtYyqi+jz9DoSxhvNjps/mhTonD+WMT+UOwSM2KScvyJSqbhQ701bld9HJvnO1LKaoN5xaOqocsHJBKJn3qz/kATQ6nSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfS3BEK4pQGMv2yv9GL45RpqmmWLpMSEj0uVOIcRzm4=;
 b=LRZAyfuqvZ0gxXznH+7XBw+X/oOcXOgobSveHw8rmIP13rjfi9IxhXto22eBXHADS2LCGME+Ia5M6PcLbGerJt3EFtbgJ9TltEFntIHJmEe05d1QfoCftZP/nK07zbMvj6cyBVqGV4eKnZ0oL3fRLbw2X61XRelUpuRPwVVmgm46rrpnaUTIcdJlD72i0rR4BnPFVZ3gXQpnjRKaS9o0YAX4aUEckQGX9eEUYGuULu5nYVV3OJIiRVABYGvFut0tQM7Ec+75RxmJoyUcN3nlJkVdQT0mVtqOnoPbojqnga7wWetP1IJYBvn0hAqPDiAHLHBhRAmGnatAKC7qhi2ycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfS3BEK4pQGMv2yv9GL45RpqmmWLpMSEj0uVOIcRzm4=;
 b=laXLc64un1PskPjXNc9UJyyygbwUk+6uSToKoXW8jrLiW4ZupEUjDAMSJJ8HAJmEBmvBE9xKDgxiqIQLoLZOtD3dNgbmJbED7oOuFkHIqCPkCdmitWej4D8gAyExT+p9kpPYwI/S/z9Zkc0EYtQm5vRdIcEvC1njsnB3OU94TJy8SIbBYSoP0Q7TejDv9g8G7+6v6XQdvpgitMALqkGkFUhvrNNkkC4U6jjpsD5ixR18ypafVN0anDMnNAGwzj99p0qNoyCTxwM7y4iBebK3eazuqUyCGecUk6N+47XJDm/g+EjeVsGpRztnnORnaTU7f4NJsoxBhBQyrYhA3RI2bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 18:41:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 18:41:17 +0000
Date: Tue, 24 Jun 2025 14:41:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add bindings for AP1302
 and AR0144
Message-ID: <aFrxSOapkQ/QIXT8@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
 <20250623224109.GD15951@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623224109.GD15951@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM4PR0302CA0030.eurprd03.prod.outlook.com
 (2603:10a6:205:2::43) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: d103c324-b9c4-4c96-bdff-08ddb34eb425
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?9UoCP3YuAIm5ObU9dNsIZGOmzsKId1drbddUbwZkmy+7G1zGW7t8MqKgIYC+?=
 =?us-ascii?Q?vSbaybywwCfDrs7xiq5s657snu5OanM8sv2eaSK0MWPrXGNKU3FOKZ5JTq3C?=
 =?us-ascii?Q?YIP0YLy1vAfbyI26jWOaGVIT0Gt3DCPewv0MkU48Wmj5PYNRCwvnVxuRf9Eg?=
 =?us-ascii?Q?TPBYdLS91r4FdF5K/c5lOvRJKf1i2eD2FfdcwEcKSnqa+gmMI2ac1fm2yC+i?=
 =?us-ascii?Q?xlvSMzToHIW6SCdVBMIWMmnaj5vf/k82qPwGbGCSNo8hEpUV/l4uhk97cgDH?=
 =?us-ascii?Q?yswyr/rW53C8GE6VVEFhuTLWTo5DXQOEqbl2XR5d1fTLdkcWBuuF+7BhmR9r?=
 =?us-ascii?Q?40DcShlKnHDJQ7WuSj8c42MFjuHPAuDl9CkyPGCsRt0k9PC49PxsjFVqr93R?=
 =?us-ascii?Q?PUZisl2+uqTXXHlynIzqW1JdbrO81axliBfFm3RBhVW/CacS9HqyjH2Iy/Mn?=
 =?us-ascii?Q?bGAaeYoQmyPOqz+6cFeH4AAkWstjBuJ7i+Fkoel/KnYzAa0CEyQGry+mGsW4?=
 =?us-ascii?Q?O9lK9RbjmqMS1DGvoFGUkZ85wi0vegkPvMZYYB4DD5b6cWYDINhDDXmysHTv?=
 =?us-ascii?Q?E0qChSkEp7gHp9G81lTRuCGMg5p3/ibUiATNBh50s0olsWKykXUeO/IQcA3B?=
 =?us-ascii?Q?hSvz3sL0SZgx3kc45jNm3PdLnKYimRCs0dsr+OMAp19Xz+Jn+Z0bdICZT6YF?=
 =?us-ascii?Q?H/w2q7R/Y14ja8UEojMq/2fCw7xr2uCpgVBZOiNvp19wi6qRiMp1jgbUXZ31?=
 =?us-ascii?Q?5Ngpfh3WdyFhuOvdvWXtDT1QadEivSusk5gCzMfvALwhWW1WEaSGg5zXZe/O?=
 =?us-ascii?Q?WGq9mKI5ibKIxj4iw9Ydl8V87tKkOpAtj9cgo5LO17QSj/snyrBG5W27/Ffb?=
 =?us-ascii?Q?PpRnxYjFjwxRNBKJ9/NJ6f3wRVVz8hDb5O9aMKKjhfbbHpVssxtH2btmZQZs?=
 =?us-ascii?Q?bIOZYlz2NqdXIM/l6Xi/A7qJj2M8ozLrHf2KdMQ3RUbIZoEhTLySh1osj5c2?=
 =?us-ascii?Q?d83HjTNHT3pjGbenPFq79gOZuxOs21knLMaxKjfoF2DB8rmM+lZTuI6ZDR0i?=
 =?us-ascii?Q?yKBUPIuLqPSHiygVQXyCwlBxAf0C5FgFOUF+LuYVsduzbokRe5drJc2FRaX5?=
 =?us-ascii?Q?2NzfjaDRrgvNAx62HU/5dhluTiIYKZf1ODdRm53t7aQ1arDtLclpghoc3JGW?=
 =?us-ascii?Q?wuMTbJH1BrHuIY8s91qymrJn8YV7c6wOFKMb5nq/j22+pGoyETgLnPxQWp/N?=
 =?us-ascii?Q?3v5pESaCsjXNfUQ8jyI1Vo5jMWltsgqc0AoF6+VjcoS+5eliTK5SPbFt9o6l?=
 =?us-ascii?Q?PLcVwoV+1rWy9EJRHrekQkwB7V9xzA2A9qzguSKQSg9+ajqP3lmCtpqRsM46?=
 =?us-ascii?Q?HvVLdiPxlz/8sMZVzf/zqwch0tE0ZxHP+IH3wAVpkNLnenrcXROdl3llsOFs?=
 =?us-ascii?Q?tyNHSI9zKswHdxLFxYdhA1YYJi843YY0?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?GRWNwucvkcCA+UXJG5xT3s7joSfbONidEopmMUM//jNEohPYZObNky2L9BfL?=
 =?us-ascii?Q?xUFp6IfISGCpHihzrIKjJx+ERicBf0HrgFyavbMswFxny0aICqmS+B5m/zDB?=
 =?us-ascii?Q?a2NRyL9JSRNBCZYOAIG9z9C+69sgR2Xd2ILTabrMSi2B2reQF1TWcKzt+rtc?=
 =?us-ascii?Q?DCZVUJr0nIkO2bYUR9jicEud9ZxiQ8xS1nFa0TBaCkf4IdGs21kdRCAnD09c?=
 =?us-ascii?Q?CagyZuXVHfWkk4Jt3tJkthyJ1dlIUeGZLJa+VUkMCqnU2r9jT43PI8k4lRId?=
 =?us-ascii?Q?NYzTl+As4OtyX/tOT30sN86NQM59krlU2ZZOfLgBcLGmHQ7LhvKaPKt29W3D?=
 =?us-ascii?Q?B3/I4DIvzrB0qwD71O07HaUZ0UFqvxoJ0xLsznY0U6KRGa8W7KV2FQd8B/AL?=
 =?us-ascii?Q?cLK6nc79WVb6gcaOQQrMHGq2I6+BvkHGrSbj+1wp5aS9WoFoWqf7IAEroJ87?=
 =?us-ascii?Q?NQr8iRTyvTvrF3S5ESSKONr6xSf47lGio/qIJenRcAVIP7D6Y0BOIe7/Dh2/?=
 =?us-ascii?Q?FsSlP54/zOkc1koofox4R5Kyjk4WAe3M51TxQR6AP4PpbnLVjAt5wUsEuGGA?=
 =?us-ascii?Q?FbpMhHk0IDxGQFs/nUXQcgHSAgTANC4BiTA/XyPDlLJ7gcgRnALueqdEN7ik?=
 =?us-ascii?Q?YXZ3UBK3M5+DRMDbQatkpDsFqHsPWDWUsN9HXW5CSbi7+HbA+Az/7SKXJZpw?=
 =?us-ascii?Q?CW39BcOM38zHv9BiOoww4q/Gm+niBCk9d+OQcH3nfcwqd2+FR76Qly3280Vv?=
 =?us-ascii?Q?dtGc5sDnmFBVbgSXNl3E7OG/p9bcLpNPgj/P94Znxp1VfsDEF/Zdi5ZvCHUc?=
 =?us-ascii?Q?RCIWmnnK6/vTJM84PX+KbnimuInY7CXriHdH1sq2TdT8gwc+RaERvVfuzsof?=
 =?us-ascii?Q?WmL44nLk4ttInaMbrrd+1bU98x3iHguQRHiqepciGLoBOf+tCGWUhoQPBGCe?=
 =?us-ascii?Q?pjMVl4supeuME4eBOf9B325riNdbmt9s9eJlr4l42rjFMXbEoDCL8znjk5w3?=
 =?us-ascii?Q?enzbMf7pyJL8mrxLHBO/gPwD7j2UOXr224lyQMN/Lz+EjumD/u6P90PzthHs?=
 =?us-ascii?Q?LWaCDrbfxijmOGvOlc3kw56VUSQ8t0XFq198ov75u1KqWnv1JeIT7CO4Di8g?=
 =?us-ascii?Q?zQh2Y8ESWvCtCJlXYAdVInlbpCF6oWWJiY0P/vQMFx+banJSeO7TviLgVVpE?=
 =?us-ascii?Q?TIYA0EK0b9EoNBuY0Bi5le8FoIcJNLdLBwNY5Oz3igzWjS28XD/EzxSqWH2D?=
 =?us-ascii?Q?Y5kwFZ/Iy7asIsmd3Bizv/R94P2Ik4vNmWQ4Uqe4W6Yma6VTRkULrqVbJJ9/?=
 =?us-ascii?Q?ad6BrHdn+gF8Xv8+dcdGIPFt8GdWNOWoaaoKNN29FDpRqiVeNtqeCqoNTdFY?=
 =?us-ascii?Q?CqrboB+XcoxLenMGXq7RsHGAQRKDI+o/JbzD3Npuk747wFyAtNkH9VTHZiUX?=
 =?us-ascii?Q?ZZMwi7ISpSBYhMsQl9HWWdCdzZe7vYjwINaS4ZOyDFx7Iv1IJszKx23qOdL6?=
 =?us-ascii?Q?Uar/hc9SIp+pm4ebjgX8P3TnSn5zXbhASJZ6PZIOVBJh3zlU3Di20XrbyHek?=
 =?us-ascii?Q?msFXtJgXzfPPt23PVXZNgms3GZM4nsGx+OG56qgu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d103c324-b9c4-4c96-bdff-08ddb34eb425
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:41:16.9617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylAdRi1XOCoCdFec3sB1VyOoI/r4sS9RispbqpuBZ6dyL25BQ/Kq2M+qE7eIOY99YuuKZ+luebbVM1lKpKhhJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

On Tue, Jun 24, 2025 at 01:41:09AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Jun 23, 2025 at 03:17:37PM -0400, Frank Li wrote:
> > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> >
> > The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> > connect RAW sensors (AR0144).
> >
> > Add corresponding DT bindings.
> >
> > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Previous try:
> > https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> >
> > Change in v3:
> > - Move sensors under ports
> > - use compatible string to indentify connected raw sensors
> > - Add onnn,ar0144.yaml
> > ---
> >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
> >  .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
> >  MAINTAINERS                                        |   9 ++
> >  3 files changed, 235 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > new file mode 100644
> > index 0000000000000..6b745dcf3fd3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > @@ -0,0 +1,151 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > +
> > +description:
> > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > +  Frames are output side by side or on two virtual channels.
> > +
> > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > +  from the host.
> > +
> > +properties:
> > +  compatible:
> > +    const: onnn,ap1302
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description:
> > +          Reference to the CLK clock.
> > +
> > +  reset-gpios:
> > +    items:
> > +      - description:
> > +          Reference to the GPIO connected to the RST pin (active low).
> > +
> > +  standby-gpios:
> > +    items:
> > +      - description:
> > +          Reference to the GPIO connected to the STANDBY pin (active high).
> > +
> > +  enable-gpios:
> > +    items:
> > +      - description:
> > +          Reference to the GPIO connected to the EN pin (active high).
> > +
> > +  dvdd-supply: true
> > +
> > +  hmisc-supply: true
> > +
> > +  smisc-supply: true
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    unevaluatedProperties: false
> > +
> > +    patternProperties:
> > +      "^port@[01]":
> > +        description:
> > +          Sensors connected to the first and second input, if no sensor
> > +          connect, isp generate test pattern. The compatible string under
> > +          port@0 and port@1 have to be the same.
> > +
> > +        allOf:
> > +          - $ref: /schemas/graph.yaml#/$defs/port-base
> > +          - $ref: onnn,ar0144.yaml
>
> You can't do that, that's plain wrong, sorry. There are issue raised in
> the review of v2, please try to understand the problem and propose a
> solution there. This is not what we need.

After review previous thread, Rob suggest use compatible string instead
vendor specific onnn,model property. I also think Rob's suggest is good
because compatible already descript the raw sensor model, needn't involve
new property for it and we can reuse other property like xxx-supply.

Your concern is that port0 and port1 have to be the same. Rob suggest check
at the code to make sure both are the same.

I think Rob may have method to add restriction at binding doc to make dts
have the same compatble string.

Anything what I misssed?

>
> > +
> > +        unevaluatedProperties: false
> > +

...

> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ON Semiconductor AP0144 RAW CMOS sensor
>
> AP0144 seems to be a typo.
>
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Anil Kumar M <anil.mamidala@xilinx.com>
>
> Listing people as maintainers when they had nothing to do with
> development of a file isn't very polite.

It is continue previous thread and copy from ap1302, If you have concern
I can put my name here.

>
> > +
> > +description:
> > +  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
> > +  ISP.
>
> How a sensor is used is not relevant for its DT bindings.

DT is that descript hardware. Many sensors have SPI and I2C interface, but
they use the same binding.

DT just descript hardware feature, such as how many clocks, how many power
supply. All of property does not related usage at all.

Some legacy binding related usage, but that is what try to avoid now.

>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - onnn,ar0144
> > +      - onnn,ar0330
> > +      - onnn,ar1335
>
> There's also no explanation for this.

It is just chip's compatible string, what do you want to add? Most compatible
string have not descrption.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vaa-supply: true
> > +
> > +  vdd-supply: true
> > +
> > +  vddio-supply: true
> > +
> > +  vddpll-supply: true
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              const: onnn,ar0330
> > +    then:
> > +      properties:
> > +        vddpll-supply: false
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@10 {
> > +            compatible = "onnn,ar0144";
> > +            reg = <0x10>;
> > +            vaa-supply = <&vaa>;
> > +            vddio-supply = <&vddio>;
> > +            vdd-supply = <&vdd>;
>
> No input clock, reset signal, ports ?

I am not famillar with this sensor, just extract from code. Do you know
where download spec?

at least ports is needed.

Frank
>
> > +        };
> > +    };
> > +
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d6f1670290589..1362d351f2574 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
> >  S:	Maintained
> >  F:	sound/aoa/
> >
> > +AP1302 ON SEMICONDUCTOR ISP DRIVER
> > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +R:	Frank Li <Frank.Li@nxp.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media.git
> > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> > +
> >  APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
> >  M:	William Breathitt Gray <wbg@kernel.org>
> >  L:	linux-iio@vger.kernel.org
>
> --
> Regards,
>
> Laurent Pinchart

