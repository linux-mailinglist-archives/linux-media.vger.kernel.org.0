Return-Path: <linux-media+bounces-40684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD04B30608
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25088A20F31
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014D836C06D;
	Thu, 21 Aug 2025 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dFeuTsLy"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DB388936;
	Thu, 21 Aug 2025 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807542; cv=fail; b=B/zpGm94TGzn/MfDxUol1MlUiGunP7mKKmDYphXUnl63J337GbsC2XDnahnzxc4JIC4OW/CjS6XT3d+YhslmBPvlVZtCnJ5NuwVl0py1D6fJ+m2c1XlKO/AqfKK9ncZqULWe0OsKZMshshtW39jlfuKJ6udBKe3a6gZFQDBtM8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807542; c=relaxed/simple;
	bh=Kd1UpC7Tv5MDWcs/GaCozBdSV3FaLik6M978eu3nI9E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E2KwJOmeaM762M/cQZEFT+4r6Kcy+ZvgRyhGwcmtYd8oRe3padkRLilVFBnHanOSEnPGZz7cspZoFeqg0nco5MDrHYGBVz+FOpQxZCISEm9wXK3X3s9j92FYXOm7kqySoPu5tlW6YwTGz6/TUdkNOqFRBiKa3ZuUe+c+PaKDozs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dFeuTsLy; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg+k0iEf4Lg7xQAmDeVpimqBhfcKzjbHKf24uzMi4as0UxIy26F2b6YDJtQvLMej6oElI7KLVa7Z9FyJlmS7Ea+O449nvgsKuM4YCFKJIHUusSQBn2QOQgR+MfucaV5kI4VgZP6dwkbW6Z432d3GT96s55rulO64Fc5Tnv8hNQjkNLzVuMzCvg/BdzWZwrkwO4LK8A6qaYmVNqeSZqZOlATjMecmb6shhOqLvaUlft519mILOxW6o5a3+AjXgqPZz3V5nI4s+57EvGfY91R526Kk60n1q0H+fLYWoqO3axeF/VKqEDhkm09WbOUFuuf82FxCXtrzPPtGXJUXdMTeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdk3zVLDwGP1bDqNTVNjYBKU7xjXNoaGNA1NoWZSAjs=;
 b=vsIw1YvHEMhTbsjHsd6TIgf2Ogy11HKt6rmszfmB7Fz8Q3WjLnc+pdHcFANRPbzzAE18dEI9yicvRlmGd9nedKo0LXEnEp8w9p0RRKle7T6iqTESryqYpyu0O+TNaylWjfgmAslAWp+9S5zU8rJTWcW311/lLoCIke5Fz7+gRLokftYL/mKhrGzRaK8ee8xUx+Yj1c18coZviqvwSCUgGFs19zxMhVs+edZbjdwJhsxT4bVSC90wTMVZ6IGLUCQJC0EFWPtfaMg/sHFtyfGyg3QW7V2neP6ogZBR7iQmL1ltIMW6TqXi3b67fXGBGFGNbpv36X4J+/tb78Dc+jq7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdk3zVLDwGP1bDqNTVNjYBKU7xjXNoaGNA1NoWZSAjs=;
 b=dFeuTsLy98adE42e8cKZI1n4ZhefD18Y9Jpy6Cy7p3+K9MhSV9TZni94RG1OCvRXdV1UaGoBZRIysKos+ilgn9fZtjKloNcVbS8TOYSZoL2dLPznjShelvxYKOV7FlRKRBVELFgPHJO5DqsezMR+jwpNC7ds0bFIavj4TyUMIvIIcc+WJaTswU+e0PNm8VGwh/NPzR1Azy8RWEMer1Yg9kuGO66KahrPWNmpG5ln22MEe/J+nAofk6zSQP4SvUhq2CQruFiJ5ZDy54/7U2wvYfvN2NQtRaiGD2s9CkplKTbXZXHrw88TgirlokcEkM6Tmj9KTwzvSZr3ChpD+Rh+PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:58 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:02 -0400
Subject: [PATCH v3 27/31] media: synopsys: csi2: use standard
 v4l2_subdev_get_fmt() function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-27-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=3568;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Kd1UpC7Tv5MDWcs/GaCozBdSV3FaLik6M978eu3nI9E=;
 b=5CpOIklV4ZVau6R/3IDUVWD2v+5753bop7VK1QNyVyahVpjdgiHkpDQlnlkMKp/Ezatj+Kxb0
 bEkEQkNUZP7CLbIli3vvrcy0m6n/cZuvWpxaCMPYLdp9cpWy6im2Bov
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: d842a33d-fa62-4aa4-9056-08dde0eff58a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VDJVQ080dHg3cUVRd0N6bnMzNXVzbUxZZFFHM1VSN0plVWQ3Sk5zQ2kyclZq?=
 =?utf-8?B?SGl6Z281cVBLWjhjTFBkSll6RnUrWXdORzFabEtBRUVsWS9CVWVZeU1GNnFu?=
 =?utf-8?B?Nk5RbzNTWFFzUE1pZkNVbnpzdXV5NURSVFpNQjFqVG8rZFNmdWhGS3RiWjdz?=
 =?utf-8?B?R0hlNDk3eE83emZhOFRDbElIMDJYRVQwZCt2dUIxSVYva1c0Y0dlOGJtN29s?=
 =?utf-8?B?VVJCdTZIbDcwRzZHWk9TWjN3SGZ0eVBUNUhTS294eUZnaGF0L2VpeFFUSFhi?=
 =?utf-8?B?SEJMS3JPRHVDUVJZcVJ6dG56UzAyM2ZLN0dMbWs1NjhHWEVGZTRneWVadm9y?=
 =?utf-8?B?QTRnL21rYUpsLzlneG9JZ3Qwd1oyZzhQWFRSMEw1UXdwVHlFNWJiYmN6SldH?=
 =?utf-8?B?ODVyZkc2L3hTdDBSTXBjdnl4QWEyQU45M2NuZTFEWmUzN1dpOFBvcGxpT0hh?=
 =?utf-8?B?b2ExUGhqeGtXZFAzaElzZWlYbXVtQkREcmZ6T0tDcDZDbFNYSjJ6TmE0Y3hL?=
 =?utf-8?B?RTBjclhLYm5nSVNtRFlaaWNDOXJxSFloK3pOYXhqQlhWTHRYNXB0Nkt1U1pz?=
 =?utf-8?B?UDIwSzAzOWZtQy8wMnFacDBVa29NOWdDcS9JT1hzTGtvejVteHFOQTU4WlFJ?=
 =?utf-8?B?Vm5pUzRSc3AwTGI4SXlqWExhRC9vcGw4eXhRWSs5ejQ2UXI0THB0b0xUUUN2?=
 =?utf-8?B?RlpoYlg5N1hNM2lQS25xeGVoK0VMelBZTGZPRGtUQnVqWmZXNXdCU3F1b1ND?=
 =?utf-8?B?RGYwSXVzRW9qTk1CMkFNdytWNlBVb3cwN1BvVTA4MDVTSllieTJ5ZURYbVNu?=
 =?utf-8?B?QTZlbUpyK05SbnRIeHc1OE1ZRmJpUTJJa2VwSS96cS9nTWExQVZXOTFCRS9t?=
 =?utf-8?B?aUJsbmFPNXlnNmhkN0ZEMEFRd040amxUTWFQUFAwaEgrREc1bTlIc3cwMTUv?=
 =?utf-8?B?SGg2WjNiSlAvbkR5SG9uZlIrbFI1dW5lb1RiMDBmbzhmN2Q3M0l2VnlSQUFm?=
 =?utf-8?B?UG5qNU1EbGJwK2FIVm5FNGxUTWlWajAwdjVwRGdkREhwd0NjSldxcVZtNzhG?=
 =?utf-8?B?UktBU3NqYW9lZmd3dnVoY2YvS3pOOGp0SGgweFFzdnRXUGMrcTQxUUdlNEZ4?=
 =?utf-8?B?eGpUdkFjNElNQW9oK2FLL0JMZlZuWkU5aCszV3Z4QnJSRnBiNWVobjVrVys3?=
 =?utf-8?B?RjFDVmJUU3RhTHFpUG9YclpvK0I0YTdydmh4NW1RRmxzcTJrN203S0UxZisw?=
 =?utf-8?B?V2JkYjhENVdKcjY4dERzb2t2V24wT0YyUlF5eFRiclJDYUZTYXRYeXpLbzZM?=
 =?utf-8?B?ejZzdmkrK2orSHJCS3ZOVUQ3dlVxSVVUcXBNVVNLeWhWTENVanl2Q2xyYmNx?=
 =?utf-8?B?b0h2bmhLWVd5VC9VdkIyQ3RpSkVhZjRrdHNUbmVxeHY4WlQ4Nm9MRVpYUW9i?=
 =?utf-8?B?TFF4eEtrQ1hmcEl6SXo5Y0dGM1dWQ0J4UHJDVFlhUldmSXdsR2V3VGxLZk43?=
 =?utf-8?B?a1JrejBCYjgzMmhYVSt6L0xwQng1cS8zSEdJRnRNbXdLUXRVME1hWkJjN0Q3?=
 =?utf-8?B?Uy8va29HQ0pKZXNpRHJqaTZnQ1M3M3dkMlpKYTZYRW9HRmlReE5QYkUyYWRI?=
 =?utf-8?B?ZXhNbm1nZGJieUNUYUJuUU5pSit2VkZYOCt4dHlsVUhldU1hUnR5WmEwTVo0?=
 =?utf-8?B?b3l5NFBFN0lpWm1ORDNYZmZwQlFyMWZtaTVBR3pxTnhadEIraStlcDZxRXlv?=
 =?utf-8?B?bWN2MTNQeXE4V0pNVk1kQ0wwc2xFMUNhTjEzQzFtZ0FCMUNZMWxRQnp3TVIx?=
 =?utf-8?B?UW9td2tabDREYUhPUTRkWjRiTHhCU1Nzc0JWa2dMVHlJWEJsb3lyQnk3SWJh?=
 =?utf-8?B?eXBOMEJmejR2S0xXa1ZLSS9RTjhiVXltL2JGNmlubzVlcjN2dDZDc29qTXJT?=
 =?utf-8?B?UnFZUVBuRjlaalllNkVVRTgvSGNaRDAzUUpBYkN6TG5mNGZqOWVwK3JicXRG?=
 =?utf-8?Q?am9n9MHQVhD/euncMO3p/i65Z+gFko=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MmVqMVNGRENRN2EzNkxOMFB4S20wSUpJVEhpS2ZjU2liRGl1UEF0cHU3MWRl?=
 =?utf-8?B?SWg5ZVVadVNCaVhWY0wwV3RtVjNTRGZubXJRZXdsTDBsM2J2dmZqbUk1K3NR?=
 =?utf-8?B?Y3R0RkppdE5CVUkxQUIwZk1RQUw0d085ckpoTzZ6YVQ3NDFBQmVlbDhXU0Zs?=
 =?utf-8?B?QWMybkIwWjBGWEhlQU15dHJKMDJVeGRtSlB4Y3dqTFFNUEZlM2FGWFk4OHh2?=
 =?utf-8?B?eURvRTV3QWNOYWRQeXU5TW5RSC8rd2xyVUN5M2ZvdEJ0ejhTak5Xb25KMUE1?=
 =?utf-8?B?VFJBOHM2RVJPby9GQWZ5VVBBRjArS0lTMTNSUGx4OTJhemFyMTRNOE1BVFpn?=
 =?utf-8?B?STZsMStyRUFkS1JMNnd2dDVRd0ZjVjl0czNMWWhzd21WTnlEVHh0NDBQaE9M?=
 =?utf-8?B?MVc5NElGUUxYVTlpcXprb1luVjFCbWtJNTBRcFV0a0ZDL2tIUUhTZk9OMTlu?=
 =?utf-8?B?Z0EydHR3VTZ1bjI4NWQ2aWFyaENMRk1OU3IrQWgyRkZIbmhsYnZ4akFSZUZE?=
 =?utf-8?B?TldValAxZ3AwRjd5ZjM1Sk0vOXUyRzdscFRTZmxGYU9DM2VJdkFlYUlsb2RO?=
 =?utf-8?B?ZXBvYUNhYU1uMlhzb2NHU3FiWmZLNWM0QUZmWGR5SXhzQ0FQYTdWRXJTZGlV?=
 =?utf-8?B?MzdjUkQxUlZLc1ppOHdIQVlWL1FjTWl0NnMwNkwrdmxTRVdlYXg4bFdkbDh2?=
 =?utf-8?B?RTZPZXNrRUZxZ2RNMXEzVVAwM29ReWVTb0JoaWMrTDFheTJwODJXdXFtZzZW?=
 =?utf-8?B?SVFXRExYZzNDRTR5Q2NVQ011ZlBtNnlGV0s5ekRCSEZFTlRsUk53RjhxeVZp?=
 =?utf-8?B?L01QY1hsdFBwRmpZK2lBMXdWWGNYcWNpSWZEdnVhRWg3UjVtN24wQzUwRzVt?=
 =?utf-8?B?SHhXTmFoTzg3dzBsLy9kdmhRbkdZMG9DcWsrY0QreWxjTzlNRElqUmsvVGZx?=
 =?utf-8?B?U0ZaTDIxN0hhL1RkRkd6NVQyNytKekJZTTVOc3FyTjluRGUxWVVaTVVDakVr?=
 =?utf-8?B?bGdyUDFWOHlHazJTK1FnQ210cm5nd25jcEx1NkdoTnArNkRMS0RTc0NYNTZN?=
 =?utf-8?B?MEhyblhmUGIyUTU2RVZzdnB6VTFMbWFjcFRDT3Z6aUdOYTVlbmVjQnlpMzNs?=
 =?utf-8?B?TnI4ZVJScUVuUnZUcCtXNFJpNVdRWWoxQkFFR0JRNUhFMk1CdXdVZmh3Z3hj?=
 =?utf-8?B?M3dibXBsWURGWVB1VnlFRDF4NkpLQ2krTzd5UjkvRDlCakorc1ZCaUxqZHhr?=
 =?utf-8?B?cWEvcW1nL1RibnlSRHZhdG84ck4zMlNrcnIxczQxa1ZLUlkvMmR6M01nU2Jp?=
 =?utf-8?B?TzBjZ3FCWW44QnFBMk1IV2crdU9URVJNRDJvTTFmWm8vTXRRaGFBSWoxMVhn?=
 =?utf-8?B?ZVNaOGRWZVF4L1RpM1M3anlzc3E0UFJBeno5bTUxY3BNWjR1SjVSVnhFYkp5?=
 =?utf-8?B?RHpzQVc1VFh6Ull6KzJqQWMvOThMVWZjN2NOdC9XenhCWVVhUFN0MmlBWFQr?=
 =?utf-8?B?WTFWdUk3MGdFdzlzL280YWxyNnYraVpxZWExZ3dKRWxCazlDaXNHdER0UHhO?=
 =?utf-8?B?eXVGMkRlOWt4T24zOHZSc2hlTHFEOGcxZ3I5STA2UW5RSUlwc25LVVVJalZ0?=
 =?utf-8?B?NHM1ZmhiWGZKRUwxWEZnQ1plc2d6WkFhd1BLL3Vwa0F0dDQxbHpRNTk5ZG1L?=
 =?utf-8?B?QmVTcEFzTndPYmUrdnlNM1VrdmVTaC9DN0U2YU55dGcyQ2VlaU1nTGFTdnpH?=
 =?utf-8?B?MVJLZmNqeFZ1N0NtNy9CVWNYTCtjbEZPczN3SHZlekFrS09nMExJRUJSMmNi?=
 =?utf-8?B?dThTTkszdlNtTEpHRUlJSHl6cjU1K1h1Q2NubFNNY1pwb1Y4ZzRiQXpwZTFP?=
 =?utf-8?B?TGl4K3QybFVhYktFNjFoNWN1Q3lIWk9aV29hVVZITTh0V0NEYmtzR2RyTklM?=
 =?utf-8?B?UEsybHZ3aGNra3hhY1pCN0Q4ZEJnUUdndlJXZzIwaTRlNWNlaVVTTlc4cDJE?=
 =?utf-8?B?NnA2dnRyUnd4RTFCckg2bUNGcDg5T2hiWElsMjR0SUoyVTY2SnhBQW42eXds?=
 =?utf-8?B?SEJ5WGV6M1hIVUg4cHBGbVJaeHA5TFd2NW5vekQ2Tzh0UjdWM0tzK2xoUU9N?=
 =?utf-8?Q?yPWI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d842a33d-fa62-4aa4-9056-08dde0eff58a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:57.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIGYYpxFKOwwgkPQOeuAXBQeHJH2y6u1d9blEE6cyTHxDA2E57A+yrDD9W5trUTE0XzXsbPIhZm+iun01CadWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Use standard v4l2_subdev_get_fmt() to simple code and add missed call
v4l2_subdev_init_finalize().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 49 ++++++++++-------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 7225285c772edf6ca3372408dd3cb0637b47e0c0..5ed65e89d4d9a75b245ebc6f28df989dcbd00b7b 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -714,38 +714,13 @@ static int csi2_link_setup(struct media_entity *entity,
 	return ret;
 }
 
-static struct v4l2_mbus_framefmt *
-__csi2_get_fmt(struct dw_mipi_csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
-	       unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	else
-		return &csi2->format_mbus;
-}
-
-static int csi2_get_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_state *sd_state,
-			struct v4l2_subdev_format *sdformat)
-{
-	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	guard(mutex)(&csi2->lock);
-
-	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
-
-	sdformat->format = *fmt;
-
-	return 0;
-}
-
 static int csi2_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
+	int i;
 	u32 align;
 	u32 bpp;
 
@@ -756,7 +731,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	 * The CSIS can't transcode in any way, the source format can't be
 	 * modified.
 	 */
-	if (sdformat->pad < csi2->num_src_pads)
+	if (csi2->pad[sdformat->pad].flags == MEDIA_PAD_FL_SOURCE)
 		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
 
 	guard(mutex)(&csi2->lock);
@@ -771,13 +746,17 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	v4l_bound_align_image(&sdformat->format.width, 1, U16_MAX, align,
 			      &sdformat->format.height, 1, U16_MAX, 0, 0);
 
-	/* Output pads mirror active input pad, no limits on input pads */
-	if (!(csi2->config->sink_pad_mask & BIT(sdformat->pad)))
-		sdformat->format = csi2->format_mbus;
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+	*fmt = sdformat->format;
 
-	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
+	/* Output pads mirror active input pad, no limits on input pads */
+	for (i = 0; i < csi2->config->num_pads; i++)
+		if (csi2->pad[i].flags == MEDIA_PAD_FL_SOURCE) {
+			fmt = v4l2_subdev_state_get_format(sd_state, i);
+			*fmt = sdformat->format;
+		}
 
-	*fmt = sdformat->format;
+	csi2->format_mbus = *fmt;
 
 	return 0;
 }
@@ -818,7 +797,7 @@ static const struct media_entity_operations csi2_entity_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
-	.get_fmt = csi2_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = csi2_set_fmt,
 	.enable_streams = dw_csi2_enable_streams,
 	.disable_streams = dw_csi2_disable_streams,
@@ -1071,6 +1050,10 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (ret)
 		return ret;
 
+	ret = v4l2_subdev_init_finalize(&csi2->sd);
+	if (ret)
+		return ret;
+
 	ret = devm_add_action_or_reset(&pdev->dev, csi2_nf_cleanup, csi2);
 	if (ret)
 		return ret;

-- 
2.34.1


