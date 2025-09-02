Return-Path: <linux-media+bounces-41566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B73FB3FFCB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D635E1A9D
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92032FD7BB;
	Tue,  2 Sep 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YfduJNNO"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4885F21254D;
	Tue,  2 Sep 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814675; cv=fail; b=LJ5kNIOXJXwF7BmhXotir+kWaCCyoFFOTs8A3cFNfuK5KWhBOIwP2nhj8UjsI4rUQ3+cH2vvgBCsbuhtFbQPacfUOORylCxGaZk60REfQnidnz1iwhC2danSQ+QGLxcBevtWFNNVRME88wBi5xUTEQaQl4KkS3Jnfg+yngE39yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814675; c=relaxed/simple;
	bh=Blpy6xi4T3sO/DZ0cK16Cqjz5R5lyfct3qnuH759R3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NdPvN12eTLBHYttujtEaCEeOogiHGOKG4YogCI+E3kHABAi1n/yeTmL0aXAbnDCnGqNsWb2C1FJWIGrTEuH9ehd060jHJsO0xv6/wrKLR6TSi05OOuMeUwg6ZtfYZ9bGNOGW89dghtsbsY1IfYf9FoKSatS5RSOWbYymsY258DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YfduJNNO; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAWV1j4EdFtB8yMm6Uiyyn3LSsmsOTii2pZM2VID4P8tgwe1ATGF3Rcz/HR8ga8prq9VNPwhIb47P1qrDtYGEMHAyf1GLpKVMYNs1XbAds56sEGVBZuD3G628z3zNnwRNmBQOIy8WP236K69OY9Qmrn1BtMzlMrVQHUPQ7ON6MpsCH4gSw+MVAs1V3/RvdE07uVKWls+tVwtZd96ko8MRBmcJX32r4caDwri4+9xWe701uPcFyOX+PP/kipbmpaxrDbINwwH1QE71G2p2CbOVdTqIB6L+CWTSUmrNUILw7P/rI6VQbRJi/+xBhBt6960yUGG+6sTXL2wan5k//QwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQ+EC/V2fJcvuxm/1IPRC/UZOGZYif9HsGn/BViNpYQ=;
 b=xd0MzmU1EqPEt+y0gkgberdobnWtJ+u4cg0073b/a+iBAdvqKQP9vID10rmYJ8oUqdDiCvwsZgJXHnuLNtbr4J7U9ytikn3vBBV+A+lcw8lm85MAERpIjZH7z9z0ki75yFOM2Zoo6rUkZ1B2aBAzgaObvABUKSUURFXSaleatxOD7AzNBVV2qmbwNiYIuNMSBiI16nE0FcM8wYe4SHJ8N2vv8hwREQGnbl+0il2DvpVsHd0lGhe1BV5m1rc0GgMUT8MfP6WepEa0QN+d0X7fmCcC4KPKNgx2JSSZdbobN77ze9/MtObJW9/I7IvTHOOZl2fouXgF4ZLZwa2YUDeyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ+EC/V2fJcvuxm/1IPRC/UZOGZYif9HsGn/BViNpYQ=;
 b=YfduJNNOeH91yGRvUxnulRpVCEQaX+0b/4F4X3XXE7yLrujjD03z4J7oYz+VH1gqR/5bTmbS4jAIC7JCe9ucwYrw+idx4Mi2+D6kwieEg2pYzr0wo5RRRLqZYcDJiUEU7fRjpDwuG5GPODAHOIYHyebysus4Wf2+rQSq8572xIR2Wan5cDDviGBxla4WA6r8NIn+LUeick54bmbEJffZjfXfb1K/0nmiq12HQeq6R0yA7QwVOFnA/tFnVJJDlTCCIOzZTRWq1276VcNcHSqt/sF3mNtGvHBKV9s7RN32EnLoqcihKIjT4pNzblAKSN5H8O7/dyM1WGonyxfLgZTWUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Tue, 2 Sep
 2025 12:04:26 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 12:04:26 +0000
Date: Tue, 2 Sep 2025 08:04:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v4 0/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <aLbdRdS3TmLHjW+Q@lizhi-Precision-Tower-5810>
References: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
X-ClientProxiedBy: AM0PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::34) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI2PR04MB11276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e546bb8-543a-4ba7-bef6-08ddea18dcb0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CZaHNU1QqNnL2lGzcCi3I6Dgwfz2j8atsTosN6J2SRbJBoDR/OnvcdA0mVc5?=
 =?us-ascii?Q?utDDONlSbozfW9rSEtGkF4g88uoviQHUxuF00gp0teuj+2V5OlPSbI02IVfk?=
 =?us-ascii?Q?Mme7Ge9HEkcfI1U1PNAJ+zPU1xPTB3XFwRRVYrixJ96o+5WrLW/W4oCf8tJv?=
 =?us-ascii?Q?Y57ih+6GA9XHuSJ/qM4GhQsGgiwaeWaqHnvCjhUjNa/sfSkeFwNajV1gsh/a?=
 =?us-ascii?Q?PmAbhwCAgocnf/Kxn7Yb2Nhkt9k10oxDE2mz7v13iqLDEqmQHwztcXxFDjdq?=
 =?us-ascii?Q?ft40uHfSo+6uPfXtGJr62ZXMTzUFOjC3/4JCcR+XyRDdORkwCFxvYGEdwTDi?=
 =?us-ascii?Q?Yi4YNwuSQn/JqlA0qJVhvMuOVLpFTg5uUbW7s90SBSzAR/9M8wfXT4OUjnVC?=
 =?us-ascii?Q?/r2MjTqPd2GDdUNb5YMYoJ5SUTFfqe7XrrZNk+m68SqdNckpTuOsAgJ8uh9Y?=
 =?us-ascii?Q?WAuCMbm6DoYqLRDYBWzDUOvERRdl57ZJDfDcbEVB4VveV2Q2MFEiKCL9l4vp?=
 =?us-ascii?Q?KaOD3Xp+6AbVyjQr8lVB1hQERl1gI96yz9e60i0OGasYwislcz7dp/5lj+Y6?=
 =?us-ascii?Q?JqiFRGtWWAapD+oOFDLmtb0F7lppwwwWJP3mMStJys0ORQxfgdtaW0Q1YLaX?=
 =?us-ascii?Q?y7YHfITBRExKZruBt3he5hdN6v1gseZoXunSrJst9PpBhhbaXrSlTaeS5pqw?=
 =?us-ascii?Q?/x/GHHFlFWI/G1IQyWzxMBpRF0BrOkdGglbD5uehlLhqeofWY+oNlLJNqZGw?=
 =?us-ascii?Q?RouOw+zSkXx0dSIC220j4aXaRgsMRxNFJxDq3hfrqmRfxHUqaIE+oZDYWjnW?=
 =?us-ascii?Q?ZNd+MHFrAA3Rwy/Nwk91Jx8LDIxGYO+ELbqWldmU0zQ6MNX/tupoYr9O+NPa?=
 =?us-ascii?Q?HQTFBdCMxkZPefyh+m/WwPswNXGiyXTlPVo0IBasTstA6aI+G+R+IJMaTG4r?=
 =?us-ascii?Q?+BvewooYJkmNNFAvDfOeH1a7ZNXI8OkFgHMx1boQ3ot4N6QWkeJMdihN4wSj?=
 =?us-ascii?Q?FKmSXcpX+xu/t/xbZAEU23wx9HcO35vKUUukzSCMqvMWnPuIo28xPZOSPlNJ?=
 =?us-ascii?Q?uBPJU86Rjav2Rsez0UkS8+ws0FOXuPOSXa9diFgr/jodUlGPQJuH8C/AISrG?=
 =?us-ascii?Q?soY0EjHJN1ScWWQHdvyGsra8r8P2UGSYQHULn2kBCrfxxCEDMjatJP9rMqLB?=
 =?us-ascii?Q?OwZHl4Du1FF/6sKb1JBPomZuCUieq4xO42kHHuoTMK+pmWLEJHnBbBIY4F0+?=
 =?us-ascii?Q?FaFKa+wH6IbA1unkt/PaEHPzlpSTf8RazYdHG9iLPIUo89t0DXDsgi2nnA5c?=
 =?us-ascii?Q?4+Dn1P9jeJgHFdl+oQZZ5wGqyIYTnNCe14Fc3MO3AxOzRFb4bHAlT6dxoThk?=
 =?us-ascii?Q?5ZAGJJBxszYayJ6kMGrLoAlwpxvx/7dyPaEgf8B8V0KvtI2+iM93YmO8c3mq?=
 =?us-ascii?Q?4HIQ1K3RUZCaVVGB3wy5aaro0jd38+Hk?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?h8DbKFr1cgv/JDdLxWsu1ct7vTyrTCx0sjgkRec+7ndN1zB2HaivXiY51ol0?=
 =?us-ascii?Q?F3jsCOXHw9Yu62vMG/Ohp6rQkmQxKeaFUaBJKlYfAuLqtpTwZYwhsTW9fuoF?=
 =?us-ascii?Q?1Hf9+uMLxRWySoBozDXL43iVbdGI/SzKSQrHBfQ0Qi/ZWlYbAYbvStsTZ/Ny?=
 =?us-ascii?Q?bq+GoRWwWDXT+jI53gWvzCDbN0ylm6uCMkEoM0sPjidEtU1AU+mZXe7AJ5m0?=
 =?us-ascii?Q?J4ui3HqyNp4Hk+MX3mHwVsUc2iORowwPrqd9ycNq+5jckUgI3+sIv5zzL66/?=
 =?us-ascii?Q?rnMNckbp0CAGn1C6S/CI8fRSy/05mTuXtW3hA7+2bnbcWWf9G34svHi9BOqM?=
 =?us-ascii?Q?gwx+hnAaXkBLEb/tUyaqbevm9ehL302dUJM5qw2kFSd7tyUcP2TLKjIeRmGs?=
 =?us-ascii?Q?N8vSidwkyN5QXYotyq7QUp+nZrhTbwwM75rCJ8Irv9kKlVa0R9h7wTaTPmE3?=
 =?us-ascii?Q?Wxb+TUh7EE3ZxCUraQ65GxqS4Z9IUOqkoHUvgzA9CsZaPLINrR4IAQpNSzbm?=
 =?us-ascii?Q?UORXHmmf40ps3b9PK7kX2eSVBWgEye6YAlvsnzrfLwf/SoHM9kpT+1sDHuzT?=
 =?us-ascii?Q?nkRpu/a6uP0fieCCs6AEC/Vtx70j5yrnoLufVNs/q2I9F0eRsCiw4cFzHjzo?=
 =?us-ascii?Q?8TBRohOTMExzYaXDOX5+zpuH0KLeMye9Eue55neKKNsk0fXLGQ3zyxg1q+zp?=
 =?us-ascii?Q?IU0iicjt/kfAqbTQ5Vl0D8/x4x/7IMeud4cSgxKk8/4z3lis5QU/D54CtBw6?=
 =?us-ascii?Q?CqUK2ZB4hQZ/SRHKoOs3VM5GLTCEjouokEGFudbypToQVtFTUYpgDTr+UXJB?=
 =?us-ascii?Q?jIkQTfQYfAfTwQdyNvKM0AI+i+FCrry4WScoGl8Rp1JnqP4EUswFHosYkziZ?=
 =?us-ascii?Q?3oLQ1PHrdF0GP75djzxu2lg7Qlws+WSMZ5wwyTssVUbXsFrvVrVjyimpbxLb?=
 =?us-ascii?Q?G2Qn06WB7YwXZSlq1yvql6ai24FADz4ozcupho+kDuuogEgKV/z/NJzly3eJ?=
 =?us-ascii?Q?D6pUErBN6aoU035zI8XM7R67GdDtoU6VowfRwcXudl7VKFFBvPzwmnD442IZ?=
 =?us-ascii?Q?uGGDue9QKIZX2eBFK6Z6LsU1sAHuJuQb+9agNa2CL5hcihW4xVdkENlMVYcf?=
 =?us-ascii?Q?c5hfEsFhcW0nJvp29gy1IIAXrpVtFNJzgMnpVtsMsU7aYKJT3CHJOlsrD0hf?=
 =?us-ascii?Q?CifsFobaQ5BETmintsyq2W5Zs6dWW+pbhMJLfWIJjyXPkgLFXiTw1sxVtuec?=
 =?us-ascii?Q?Iv0EF+UZ7f2ILdc4F4fcDyz/8Ri+unRirJYP/HSagG9XU5RDfq3t/gUN11cI?=
 =?us-ascii?Q?DrHiFxN+Ex7el2BBX+Du/ZUs13o7pKAgt32zK5YpAmb8xsnNMxoazsslp9p0?=
 =?us-ascii?Q?fY7AcX/m9onAYHRegxDPy6Ugq+MbqNOoCb1jMizCK8pyOMLg1SVqQln4gX7p?=
 =?us-ascii?Q?u4Nkt8poZDecTFEsmaiZR/mgZkKj+B6IBJckfl+7NBhHLvVldMW1h+jvkHeN?=
 =?us-ascii?Q?BRc8KO2GDKGlP9peUt+sPBxugW4QWw7egDr0sSVmEQ3WCh2kJF1h6lBj/R10?=
 =?us-ascii?Q?05Z90+HoBm51cemwU88=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e546bb8-543a-4ba7-bef6-08ddea18dcb0
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:04:26.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vmgnTv7jWj6pyHi1ZQlLnlgzrIxxp61seSrf/D7Sa0U2Gvh6VcswBtYLD7TNUKYDJ+5QX7UpO3NRBvHKzrJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11276

On Mon, Aug 11, 2025 at 04:42:29PM -0400, Frank Li wrote:
> The AP1302 is a standalone ISP for ON Semiconductor sensors.
> AP1302 ISP supports single and dual sensor inputs. The driver
> code supports AR1335, AR0144 and AR0330 sensors with single and
> dual mode by loading the corresponding firmware.


Laurent Pinchart:

	Rob already ack binding part. Can you help check how to move forward
driver part (firmware header)?

Frank

>
> Continue previous upstream:
> https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v4:
> - roll back to use onnn,module method: see discussion with Rob at
>   https://lore.kernel.org/imx/CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com/
>
> - Link to v3: https://lore.kernel.org/r/20250623-ap1302-v3-0-c9ca5b791494@nxp.com
>
> change in v3
> - move sensor in binding into ports.
> - add missed regulator and enable-gpios.
> - detail change log see each patches's change log
>
> ---
> Anil Kumar Mamidala (2):
>       dt-bindings: media: i2c: Add bindings for AP1302
>       media: i2c: Add ON Semiconductor AP1302 ISP driver
>
>  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml |  184 ++
>  MAINTAINERS                                        |    9 +
>  drivers/media/i2c/Kconfig                          |    9 +
>  drivers/media/i2c/Makefile                         |    1 +
>  drivers/media/i2c/ap1302.c                         | 2829 ++++++++++++++++++++
>  5 files changed, 3032 insertions(+)
> ---
> base-commit: ce5d48bfb56d70cfbdf29770c5c392a979cc3871
> change-id: 20250617-ap1302-4897c591871c
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

