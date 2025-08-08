Return-Path: <linux-media+bounces-39169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E833CB1F0EB
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C17021895F17
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF572957C3;
	Fri,  8 Aug 2025 22:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GlD4nfrF"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A03295517;
	Fri,  8 Aug 2025 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692902; cv=fail; b=slZXgTbj6JRhtTAR7pdb9Z17EP/7YHeBjtA0ljTLjfMZKPPyf9gRCfx3j5E1xCpIcuHWRPUx0C+9S839/QCDprzy/n7cUYXJwwU6GDL6oru5rx+nmfbd5kUCCS3gqXcCckX5cjvNhY8vwed++K9pN09Hr+/oysnrCokZBEZFgQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692902; c=relaxed/simple;
	bh=TdAg+36hxuwjbsBS935mA6qY3FT+CFA0JyWVVsUhFhY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZZDcirKL5/Q/fyPRKnvv1VTfSXLduc0VbNyCBf/EqeA1Suv9/InEy5bx0y9O3RlVvowjsmwGFhVOKKCl+JIswNid5Pj6yL3F/pZJ3tuUp9QGuAoIZHJJumGVVgNae+Vyd/mTQTMepqmhRs9PE8gujZKAbnKBSvxoqaqVt1VStMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GlD4nfrF; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leQn4R5TPkkihqUm/H4ZwckIQhkrV6eeZOpl2Tk5r+NsEh8Xh2tuihV1WEM1jXix3/bKJKWkGo7YCr7lWzXi5aluwXvKb9kditiieVPknn8h+n4ZCUM7H0khNjRWwDx+kl7UYq0iMcesWCKT1AaRI6gje40v+E6ElvIyYQVH5c/xzTfRbboqpLKN4YcDUf06zjAq2F5ACes7sAmF7b8+1xUKHurhiiRTPJARm2yDrfw/ITjfART61YfAXp6kpWofjWuUO8mxrO4jXwk1oCVkke33oRSBMYcXCZDE5jTVbEDKpw/Da4EiRp8NBj4PpJfz3XGOlSEwMMUBv6hToC74eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/iq4Yf5eORgNUU2nmYp+IRXkEwOsyMa5Rtx8tdDtlM=;
 b=jRxhLJGcai0kfoZnohP40toanfNwv2RDtUObuvv9RKX4qskGgOgNAe1nseyZ2z9W41eiLRTviVhSjNtoYaVZMdcCbEgXjRmZOA7oNz5xtfTCWNVknIggRhhDAAFzuETlAF10E59q+gIVKdd+ZwDWZOp5RwAJutLxdzIPkR+8Z5mRvweD3qq81spC7kpC208MTZI7TpKWR0Oy9LSr7tyCtOMC91cQ5+KfwhBTn5oCCPY/XG0fanqZfADN3ZO9BXFJjQoLZf3vFq+GKnhT97bIPWC0O4nz2Bv26r/+duTlJSgJTzEcopm0d84HYmejyErDl6IjmqpNRDeK8RTKZ1yKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/iq4Yf5eORgNUU2nmYp+IRXkEwOsyMa5Rtx8tdDtlM=;
 b=GlD4nfrFqpVhyU/IGP6xWd6vnbyxuKPUJV0l6YuSVFjPVnRWheoUMvLpqqAi+jXfK3u5ioFqOIGIy6ub520bKWwPTWxTQT4O8PfyGRerUp1+mHJRhuxrTkS4gT7pYjacRPaNfaCRrQWEaUVMN0LAHmYJckfmLq3WPN5T/djPCLi/Yo4nfqH6QYc/6R92MDhj5B9ljN0/HkINBC0VrXhN16n3PcKVOIetsngxvanf1uQITiAgddvASUBKdU4UPhqvanASbA5uvNO4O9716N571ewGmJ+DJzZSe9Dj21Zr8Ffe1nRwAKCSDYwcAWpxBA1Zaop/vLxnQSr+wXQx78h9Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:20 -0400
Subject: [PATCH v2 17/32] media: staging: media: imx6-mipi-csi2: use
 runtime_pm frame to control clks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-17-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3877;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TdAg+36hxuwjbsBS935mA6qY3FT+CFA0JyWVVsUhFhY=;
 b=YpUJQ6EuRHovtbnaKuEYNkiLefHLeurbXLT5sB8+x9zAh7g9AYHSbvDOIWK88LhmoFjn5C14J
 GTbwyjeCxkrBjOWkc6fBM99F4jWG2pX6OQgN3fLydkcSx1RaPASQqfv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: c6596562-ccfd-40b3-1304-08ddd6ccbc49
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MWpaS0dJMHVEL1NmUFl6MHRRRlpqeXZZVkM1eUZNZWM5V2dpZnpaWERJdlRF?=
 =?utf-8?B?bVVSa2hDdkdJV3FBdmluT3liTVRTaXhDZWpxVVRIOUZOb2ZUdU9ZMk9jRVNt?=
 =?utf-8?B?bnZrS2FQcDRLd0oxWmFQQVR6UWI5aFBNUklRNHY4THl6bWd6bkFjbE5xLzFj?=
 =?utf-8?B?SkZWaUppaENHL3Vvb292OVh6M3AyUkc5K084aUpleEt3WnpheWx4V2pUNUt2?=
 =?utf-8?B?bXVLZGhQb2xnSW83bGZFSGFqaWQ0STN1OFo4OUNIL010MlRKZkViTHZ5OE53?=
 =?utf-8?B?N29qaFRJN0dBK1BkTkFSR25vcWpSbGZSdnlVd0VQTUE4N3NlSnRnNjRkS0lJ?=
 =?utf-8?B?cUdtdHhPK1QzL25xV1kzaTNacWRSQ2xKcU9vUGFYa21FdWNzL3FTdWUwdWoz?=
 =?utf-8?B?aGNhNE5sYlp2Ylh1TFFYc29uaDJEYmVkRC84M01XdktxbFNabXdNQkVONzVp?=
 =?utf-8?B?bHZ3M2RSQ2hRZVFsSU9ZQ0QvUERzWkRzbzNXTG5JdGRQMTFSVDBOdkpUcGZn?=
 =?utf-8?B?d0lUZkdsRjFQdnFOcFNOWkdxSklaUU51ejFFZGZlS3pMTU1BYnUrMVpFbGFW?=
 =?utf-8?B?Y1ZNMUdxRXZEblZqWExZZ0VTMmxUSnp5cHRGaUs0Y3JveUxjVEV5SXJJUTlL?=
 =?utf-8?B?RVpoWXltSngrdnZ2anU1NjNRYmhGbGpMOWk4aXo0WSsvbVM2cjlUTmhYQ1dM?=
 =?utf-8?B?WWRLVlpmcVVlZ2RIbzRxQ2FYMFkxV0NJTEhTZjh4aHIweHNLS0psQmJDT0JD?=
 =?utf-8?B?NVpHa2Qzb24wR2RYSVhZMHd5ejkyYlREM25UdXhscktWT3djSHVUTFhmTFVo?=
 =?utf-8?B?SVNkc2JGZm1FbGlmb010MjdQb2xENURMTkdoWENBWTFrSmhsc1lZOG1USXVQ?=
 =?utf-8?B?MDBNU0FjbU9jYTBVaC9WeG9TaWFvWENXcWVydm5TQkwydGpDeXJzaG5uREhi?=
 =?utf-8?B?dXlqWDlmcUlyTGxWbWFHZWRjK2VuZ3EyelUybTZBQkcySzVlMkZ0VWNvZEVM?=
 =?utf-8?B?WHN2bTdFS1RMZjdwTGhqeHZmQm5KNWxpeTY5aTFqM1dKMUxmckJ4blhYem0y?=
 =?utf-8?B?eGREc1k0V2JjdVBScFlUcGZuS3lWbTdIWDhsRnRGZW1vU1R6ai9FekRRSmJk?=
 =?utf-8?B?MVIyTmhWZ0w0cHhGOHZwclJTMEJjNmkwbldpRm9MTlZBdlAzWnplbjhzM2pr?=
 =?utf-8?B?MXFNMUptVWNsS3NKK1pSNzM1UzdnTjBWakdsVEtFa3M1aW9WVkJsTXpuTlNr?=
 =?utf-8?B?RWJieFNaeUJYenUveUxwaWRQOHRoY3RBbzAzL01MS1l1M3gzdkZzeUxYVldO?=
 =?utf-8?B?VGo5Q3VSYUYwVjlyNVh5WlI1SC9SaGYxNWxBNGNiYzF4UzFaeDNRRzJLZitj?=
 =?utf-8?B?SzhLTVZVZWhGMUdCcC9YUm9xdkxTaUlQaWY4UnVnZFFsQ2hRcklSM3NGNzk0?=
 =?utf-8?B?QVZYS1hkUExOR3dSRTQvV01FMGQ4VEQySkJZSGVSeXBkaXEzaU10R3p5c0RG?=
 =?utf-8?B?UVU5UGZIRkxVVVB1VS9xOHpRMktJR0t0Sk1OOUxvbDM3QUtseFc1QVlobUN6?=
 =?utf-8?B?Y2NrSjFtLy9Pam92U0lRaGp0blRtaDJ1Y3Z4UG52YVhzTnVaN3JKZDI3ek1H?=
 =?utf-8?B?OUxGRGg2c25ldVBFaVVWSEFxYVhxRlVDSFBwTkNFYVNnaUFWTnNieEhGd2tK?=
 =?utf-8?B?RC9nRzUyNjBUdm55Z1BXcEpSNllmNTJqOWFPWElNRisxUVlETEJrWmsyTTdi?=
 =?utf-8?B?QnJYY1NTZGt3cjYzM0l6a0JRWmtvaFdXRFBpeWNKTnBucTU5RkdDYjZzYjd5?=
 =?utf-8?B?TWpsa215dzRDYk00THpUTEVuVm9mTmNUVFkyY0E3RUNLM0c1SUpKbW90c3BH?=
 =?utf-8?B?M3JjQkFoS0puZjQrVmxsOXlRSVRINzl2RExwTVJwUHdUd0RUVEdNTVdxMXBF?=
 =?utf-8?B?cHhOTGpRT0tSZjg2azY3YThocThQcmtXWjVkK0hFOFZaMkt0cVp5M1Fqd2kv?=
 =?utf-8?Q?LK93CCkafOOVcMxKOs9U0fquhAYwiQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M1Iydzl3ZlNSZS9EYTVnc2xCSG05bEFUQmZkMnN2VnozZVFIcm9nMGsyS3dK?=
 =?utf-8?B?NUtEM1l1MWlldHArTXpPWk15MnJVNE1JRlJLeit5cHdXWTJKQi9iRmZ3QVlC?=
 =?utf-8?B?ZFZVdHVqaTYxSkl2YzFtZXRINTZyb0FyY1M4SmcvNjcydnF5ZXBubG82RGM3?=
 =?utf-8?B?VlJPSVpYMVU0ek1rZWZGSktVaW9NUHZTWS9YWjIxTUJWRG44RTdJakVmZ1VL?=
 =?utf-8?B?OUJsVDNZeTdXbEowMkVrUUxQaGpEdEdYMjVNZU1XTzVCeWtORWNlWitLNGFU?=
 =?utf-8?B?U3l5N3A1d21ac0tsYnU2UXRva3RMT0hyZE9keWVndE9WSGRSdXlQMlkzbEZS?=
 =?utf-8?B?dU1UOW4xMFF5SnZCMGE1UWROOWV4d3p3QVIycStzbjljb0pZWVJqVnZkdVJE?=
 =?utf-8?B?eG9UZnBPS0JoZTFDUlNNMUo2YkY2cTBGTTdLZHhlWklrZFhRQjFwUlI2b0ZU?=
 =?utf-8?B?d2NaeGFDUG9aNThaR3pTeTVoUmxLRUxodlFzdzhPV0laQ1MyblRvellUVG5i?=
 =?utf-8?B?Wjhnb3JWQzVjbHRYd2NPSGJmNVhKblFTTXpWNHVrdmZ1azFCOEk4YWpFZ1lG?=
 =?utf-8?B?M2FVMmh4T0g4MUFZWEJ5NElwdmxLRGFUdWdPajJ3Q0VUU3QzaFZxNGROQ1RM?=
 =?utf-8?B?NjZ3dHJzYlJiRE95a3d4VmJVVWNnMURBZU1BWGdxTjB0aHJwYXBQenBqRzJY?=
 =?utf-8?B?U2I4TjJwemczajFybjJYRUNLbzlPK0JWNlJlVjRka1kwYXlkcGoxSGQ2ZXRt?=
 =?utf-8?B?TnBaWnB6dEhGcG5RUmIyK0o1K2ZTMWRZNGdMajhYRHVHbnlVY3lrNk9ZTk9y?=
 =?utf-8?B?L2lLenBLbThvMlg4eXdRUzNWa3FOaHdvS2ZqZUg4THZPcGJ1Y0lyZFZjU01p?=
 =?utf-8?B?N1F6a0RGUW5mVUFrWXlxcSt5OVpWM2hRSFlZZnlnU0s1cGRmWWE1RWlQZ3lV?=
 =?utf-8?B?cS9LNnNaOWhjbUdKZWdEU09Hb3VQOHp2WEVvbzdvWHpWbmVtck5rRGFPMWxz?=
 =?utf-8?B?L1BhbFBwU1M1WnpnWDllMlRlNXNFeTlwQnN0S3MxSEFhWDhiZFJzTythcVRY?=
 =?utf-8?B?TTJvb2l6Rlp4RXg0L3J3Zm1xRnIzZGlYZlRwTGlGR1YwUWtRdWxCbDV3eUZp?=
 =?utf-8?B?cWttK0RCdFMvbThmQnFpRmdYM3AvdnZrVlVJYkFMZlBtWit1aTI3SFV2Uk1y?=
 =?utf-8?B?eVNJQ2Fubk1lK2VnbEJiaHRCMGJKNlNxdVdwSjhIYXREenZTdjAwanBLckdN?=
 =?utf-8?B?Z29ZbXliUGVyZEU2ZlZKU2xEdTBvYWpOYzhwb3grY2FGVklmellzTkhqVnZJ?=
 =?utf-8?B?SGVEb2E2a2UrbjBzRk1KSXhZNkpyczBuR3BXUmMvdW9RaTB5YUR1Y0dBaEkr?=
 =?utf-8?B?OWo5QTJxM09SN0JUZG5hSFpwN1VZYUVJSkEwSVJWcVppTEVZQjQ3Z0Q4U2R4?=
 =?utf-8?B?T2dKZU4vMm56NW5pRm1QUHNoNWp5QmNkRTAwaE1FYUovcnVESzZSalZrbTVW?=
 =?utf-8?B?VlhXRzZZSFRBYmczZTUvTmxZYXJzckd4Q1pFbnNwbVBVRDIwWHVRMEs0dlA2?=
 =?utf-8?B?YmpEai80c0liUEZpTGVqSEhlNmtzbWhtc0IraUJPNEEwOTlERjNrRlF0T3BL?=
 =?utf-8?B?SXc2OUxNL0JzMTNIc2FkUTY5R253WnFscEpmUllCdnlRK1lYZzV4Z3FiUzZX?=
 =?utf-8?B?MWg1dGtGYjRHWGUzRTNzNjFJWGJZcU43ZFp5SDQ0MEorV0FqN1Fld0t5YitZ?=
 =?utf-8?B?Qm83L2I5V3JSMnc4M09wQVIvZk9MZ1lwNjJKYUQzSGJXbkI1OG9oeG9uOTJR?=
 =?utf-8?B?RlpSUWEvMzR1UlQxVUZBUVF4c04vMXFCUERiWkZoODFQTWptMkF0cTN2MHpl?=
 =?utf-8?B?aHhXRkMzSld1c2xGN1V1UFdPcXJrU1dlZmJlS3VIcmkrdFB2OGlzQTUzcUZ0?=
 =?utf-8?B?YU02NE10VU5aMjV5U1dlVEVGWkN2QVdmOEJtcXJJWHMrVXM4dk9zZG00WklT?=
 =?utf-8?B?Q1Fqc3I3SlFrVTV6d3NhdUoxdXNyeEZySExldTFHWndaRDVrbmlodG1JLzVa?=
 =?utf-8?B?dzM2QmVQa2l6VG1Vd0pya0xBUzQ4ZFNWRzBiOEhqdC9NQ2p5M0ticFFhU2Qx?=
 =?utf-8?Q?RHqoiEFlO7ygRftyiJGrwvyGm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6596562-ccfd-40b3-1304-08ddd6ccbc49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:38.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJNlJMQWHtKCltAXb38lJT7iy8SmDqIldMQ4VA4oP5dzGysuYRz9bi0NUu/M1qIpQkntKZGBt4Qzez0YUXTjVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Enable runtime pm and use runtime pm API to control clocks.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      |  4 ++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 11 ++++++++---
 include/media/dw-mipi-csi2.h               | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 696644aa04c83b1f2877b2b2315202627d927e96..e5192bcd886958a27f4255fca1055ae0a94866ef 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -154,6 +154,9 @@ static void csi2_remove(struct platform_device *pdev)
 	dw_mipi_csi2_deinit(csi2);
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(imx6_csi2_pm_ops, dw_mipi_csi2_runtime_suspend,
+				 dw_mipi_csi2_runtime_resume, NULL);
+
 static const struct of_device_id csi2_dt_ids[] = {
 	{ .compatible = "fsl,imx6-mipi-csi2"},
 	{ /* sentinel */ }
@@ -164,6 +167,7 @@ static struct platform_driver csi2_driver = {
 	.driver = {
 		.name = "imx6-mipi-csi2",
 		.of_match_table = csi2_dt_ids,
+		.pm = pm_ptr(&imx6_csi2_pm_ops),
 	},
 	.probe = csi2_probe,
 	.remove = csi2_remove,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 23656291d808ccdfc47f36d1f7f5104698812eba..0c8022ecdc18d42fa038c721e0c0953e8eb9cd6c 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -273,7 +273,7 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	unsigned int lanes;
 	int ret;
 
-	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
+	ret = pm_runtime_resume_and_get(csi2->dev);
 	if (ret)
 		return ret;
 
@@ -323,7 +323,7 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
-	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+	pm_runtime_put(csi2->dev);
 	return ret;
 }
 
@@ -334,7 +334,8 @@ static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 
 	csi2_enable(csi2, false);
-	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+
+	pm_runtime_put(csi2->dev);
 }
 
 /*
@@ -634,6 +635,8 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 
 	csi2->tstif.write = dw_mipi_csi2_phy_write;
 
+	platform_set_drvdata(pdev, csi2);
+
 	if (!config)
 		return -EINVAL;
 
@@ -667,6 +670,8 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (csi2->num_clks < 0)
 		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
+	devm_pm_runtime_enable(&pdev->dev);
+
 	return csi2_async_register(csi2);
 
 }
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 935c664440aae82d69f0253a551b91ec4ff2724e..3d70c1f4f38e7d663f9b043d8903ce57d630d1b1 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -3,6 +3,8 @@
 #ifndef __DW_MIPI_CSI2_COMMON_
 #define __DW_MIPI_CSI2_COMMON_
 
+#include <linux/pm_runtime.h>
+
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -86,5 +88,21 @@ int dw_mipi_csi2_init(struct platform_device *pdev,
 
 void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2);
 
+static inline int dw_mipi_csi2_runtime_suspend(struct device *dev)
+{
+	struct dw_mipi_csi2_dev *csi2 = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+
+	return 0;
+}
+
+static inline int dw_mipi_csi2_runtime_resume(struct device *dev)
+{
+	struct dw_mipi_csi2_dev *csi2 = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
+}
+
 #endif
 

-- 
2.34.1


