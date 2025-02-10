Return-Path: <linux-media+bounces-25965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AAEA2FB45
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B06187A1D2B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317EF250C05;
	Mon, 10 Feb 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHYiETtb"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB6250C07;
	Mon, 10 Feb 2025 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221234; cv=fail; b=I8g+JggYGSFBBc9vwDjdEAW37oCnmD3VGtY8wt55D/yTs4I7FE9Pv742nkWhzTaZNy/DScPti5OOKdmxQz6ZzcHXkh4jZZSS5R+RYLNe9Z/hgDU4dnV1w3zgTX7aWp+oC2J0xALmmNsRzAfzpZVc9ZcBq+FowmBYw7h4EdXC3CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221234; c=relaxed/simple;
	bh=uTgcHGZix1ytJE8Xu8g9iMI/55rj7h1+bMQRsryN1e4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oiOLFKzdf3aMpAgtXaQmgn4QQecEuWspYku53YhxSTNMe3if4fvXWfgdoRucpRNd3R65zQARxiMwNVX2dklfTYURet/93zeqauPAUBaYzIeGCb1hJuIURwncSEI1wouKKIMTv0tqGbscQlO0VfCtKuT+S8ZsXcUbsS4rWKLutec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHYiETtb; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPtDnOIlKc6z6jrHxjJ1GDtOQ241jblgebcF+5QRhrULjQZw20KxtWs92wfh648GWVS1OfYcvBqBJxWShNgaDeQXAECjyvx6w+inDG5fkBc8P4h080rTH+3oVAaptDOmKK9ncQ64YkUsTQyZXb9W+MvH4rSIk2mT5Zsskum6OxU3QIoP2Xhtl1PnykL9d0mE7VrjfTf0hJb1zgqIPFVwnw5e6gwOBW/EADXqS+5BMsjuIF9Gvp+SeWCiWp12ErBt1Oq3kMwSsSp4ed9hBPplxAU0UDlO1J2Kx0zpIoJdvxVO8W9d8cAPPsgAcyKcAfZd2jJdp5knGC4xHdkbWUcMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFmOuNmFg/co7IfSvcapwoSxOFkKZHm/FZsnx4OG/Gk=;
 b=gnsEzEC56PNl+3YBK021ahXGCfbxSofc2DWZhKyDFKzU30butRortNMW3pUjywmRmxl1T/lRvsFdoEjSpBbpoMCWkhchKaI3c2MOvCwAeFIZSSNp2kEQ2NT7puZGU4UqqCY4xqMzAgXu4Egb7JirwHo6cU8pNekA3N1Do8YrtY85q6ZTFzBSsD/W340wDO20KPe4E2U/OIZT+uIBUH9qJpSIdXIStjS4xy9aS+Wv63do+NAMAya5LbPGfypUgW2FAJUmIIzmSQVOmvInB5AhELAj/OZUozBeBxaWNfSu6iWHOz/IlzhT6dFePD4cRQDDdtoNvMM8g9HG7Caeml9HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFmOuNmFg/co7IfSvcapwoSxOFkKZHm/FZsnx4OG/Gk=;
 b=iHYiETtb/4Wg2rwp5YNQVlmYuPugJIUFtWF+9lTQ6XYHSRp296eSp8OUjqJ4NnCjj/GDkMQzr8hsVPhqt97rNrJ3QFW6rvRj9BczVeNyhRvniC2O+B6Pn7CIkfTDaKriJaqoP6mgrdRf3Hipv0ym9WdkX0EQK6zv95o511ff3qdU5czIv9M0Mg2S3H6TLLR+FyVdbkSsCcz3GqLHCWTMk3IFLwKUloOyiozprNIyvTqIvXKDykNAWKaW7YX/+gG39Dqw0a9a/ZEH0xncMZssEoBg6WK1zgNCRCcKx84g9dSHGkWrq0DDibzZIKv/4v13wZk+CNYRlQ6gpvpHoZcOjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10238.eurprd04.prod.outlook.com (2603:10a6:102:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:00:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:27 -0500
Subject: [PATCH v3 08/12] media: imx8mq-mipi-csi2: Add support for i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-8-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=5801;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=uTgcHGZix1ytJE8Xu8g9iMI/55rj7h1+bMQRsryN1e4=;
 b=rmTil36f57oTzJx98CogdIznKiCEP0fGPXAjtqSusSe3Nx+CWEShXFAFDdx58Ao9dcFUiLtYG
 X04SqfkGMSdATGmOMQ53/Qk4byzG9LwIeNowPDx3WecA+OmoyxvZaFC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: 71323f07-913e-436e-83ae-08dd4a15f318
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TDU0dVIvd3k3WjhXOWo5alRWdUVJSURiYTdKaWtMUFQzMUVRQnQvNnEwS2hD?=
 =?utf-8?B?UmUrNFpZb3ZKUWk0V0llTXFQaFlCaVJVN3ZZSnlCZEpTWlZTeG1MM0pmcksz?=
 =?utf-8?B?NHJLQkVrazRHdUhqN2JaN3B0Z3VUMHVKdjNSK0dXSjJPVGd1MW51RUw2R1BI?=
 =?utf-8?B?WlEvUHBEbGkxZktuWTFYVGIyWC9GbFN4N3JkZkZVUlFTSEpZNFdQZzh5QlhJ?=
 =?utf-8?B?TS9wSlhSaFdKZ2lzY2NwL0dMeC8xb09hR2pRV3F2R0pVaFJuc2prdjRENkxa?=
 =?utf-8?B?ZDJyUm1RcWRPZXpVOWYvNGo1MVRuelA3K25OQWpvM1VDWkFpZ1NjUEhXbVZm?=
 =?utf-8?B?Ky9GeElsMUxwelBwa0RqSTZaWDV2elN4SU5GbnA4cm4xc0VyNW04ckpSZUtQ?=
 =?utf-8?B?NWhVQUJ3VERyR1BUVDRnSTVLa1ozWWVaUFpTNzlPTU9idzV3Vk5LSkZBTi9C?=
 =?utf-8?B?N05RNkVtYS9Ibi9MK1VhZ0hHNGprSXZ6OEkxZzFXZFI0aDFyUnNXcm9RTEU0?=
 =?utf-8?B?ZjV5U1ROa20xR1NzYXJSYkozZStGS2RqbnNSL3VZVVdGVWVxT0REQUdBU3cy?=
 =?utf-8?B?d2JReVdCcFkvLzg0bVBQcVB0RHJMaUtPYU0wZ0Z4TDNwbXJSWE5vQ3IrS3BX?=
 =?utf-8?B?VXVWeVBkcjZHSEpSRWhBNFJLRHVsVlA2cW9PRUNxR3ZvZi9CWE9zcCtvL1la?=
 =?utf-8?B?Um1heStLK2lHdjRWSWpMR3VtZXVyNTN2VStGMng4ZjhkVzlEYlFkSVZ6VlA5?=
 =?utf-8?B?V2E0SUZoUVVqZDNaek5LZGo4cC85UVRub01zRXhvT2JLYWJyQzdZalpUenpw?=
 =?utf-8?B?NWIybXdGMU5zRUJ0RTF0b2ZJUGJjOUtRUnVWMEluTTNHdXJpNHRiTm41VlFj?=
 =?utf-8?B?QjRyTktCbWRkQUxkVG1GYjFidU1GT205TUY0ZEpNUEp5T3IvQmo5UTk0T0ZF?=
 =?utf-8?B?eFhPN0YwUzdzN01HbTRZV2RLZGtKWmh1UmxIMDlZOVJZMENzVmp4V2JocUZN?=
 =?utf-8?B?cmE0VVUxT3IzQ29IMTU3OVBWbm0yaFE5QzlLaEo5YVBIbkNlbWl2VE83elFm?=
 =?utf-8?B?b3hGL1hhLzdSK05WTEUrY2EyaXBkZmo2Q0d6K0FPRENPODV2Y0gzSE5YQzRt?=
 =?utf-8?B?OC9vVlV6OGFDeGU2Yk9BTW4wYWZaSEkvUno1dG5iQis0Ry9iZ0VLV3BCK2xq?=
 =?utf-8?B?WXNBa25UMlBNZC9PSnEwbnRmNGRib1o3UFZUdzBYTFp6THp3bjhTUWF0TGpV?=
 =?utf-8?B?eittdU8xN2RWVnNKSUFEM3NSQmNBbnkwUXV0OVBCQm00bUZLWC80SWJmZ0NH?=
 =?utf-8?B?dVJldldxcGJ2Qis4WDc3VkZseDlFemdsTnZKTnNpeWFieFVuY0dlYVZZejNG?=
 =?utf-8?B?WFI3T29sQW84UXZRMTYzZGVVM1dSa3hjUi84cGFpbzdISHVaem1PM3duaElL?=
 =?utf-8?B?c1lwZU55Uk5td0YzUWFiVld4VEZ0SmtyeWZWSGp2eURVRDJHYWZuMHBKTWNP?=
 =?utf-8?B?Vm1CS1hmenRZOGhCK1o1QmVHaUtpeWZPdFhuRVV2MmJmelVtNVNaTTZrYWlS?=
 =?utf-8?B?OUhCOGhHKzFoWUhMcE1wTXV5SkVjdTRaakxWcTdtbCs0bUpkYndsbk1zVEph?=
 =?utf-8?B?SHp2dVlzWWg0dVhxdWF5T1BnVS9WVjVRR0ljSms0K0FvL2ZyTFBLbTdmb3Fl?=
 =?utf-8?B?T09Zc2FzSlphODBZTHRyeXlheGp1YW5tWjRTajE2Ykh4VE52a2JqNVg1M1pm?=
 =?utf-8?B?bldTUlBzcGtDWkdkME9JRlVrenJVcGprMEFUTGN0YTY1MkViZWlSdFFqU2lO?=
 =?utf-8?B?V2dLemdjT2IyaDE2anBKTFFDbDRSbVpEbzZhQldXUExYNWpyaXFRd09seFlF?=
 =?utf-8?B?dk9qdWRJMkVPblVQL2dIdE5yYnNLeTlNY1lvb1NVckhJUU42MnQ4VFBYM0E3?=
 =?utf-8?B?bUhZSmV5OURnUlFHV1hXWEIvYm5mTi9DamY2SUpxVFhHdTNNZU5NQjFrc3Bm?=
 =?utf-8?B?bERmeG9KK3lRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bmZNekM1blFNOGd1T2ZWSGJaUThLVE1MbVhka2UxNmFMNjB0ck9VbXN6NnZG?=
 =?utf-8?B?ZU1vcUFUaE1DUEl2UzRBRlZtT09xRTl3dk9jOXZnZWQzNlhYME5sMnlMRkpP?=
 =?utf-8?B?MzNsZ0dXRGRQTmREcnNRcnVDRmRUeVVtRlZlaDdRWStPZFNxSkZlTVZSaVZD?=
 =?utf-8?B?U2RmNTdYTGl2UVU3VXBMTmNoRjM0KzVEUlNaRlQrajFUcXBlcnlJOWdNTGlY?=
 =?utf-8?B?OC8xbmR5c012TmRKNXhSSEk2RGh2Y3ZOTmo3a1k4Z1BEblFaYzcxVjk5cUFW?=
 =?utf-8?B?ZVdCeHl3YXg5Zk9WMWNuWFU1VEw3U2ZKeEE5UW9iMU5GMU9mZU9BcTF3WmhE?=
 =?utf-8?B?NlBGM3JoQzVyeGRkMG9KS1ViMzZZK293ODNBUmhaMXhjbDRhaWJUOTZhd3Rh?=
 =?utf-8?B?RzFWMU1FbEVRVzdhektDdGZLeGV4RnJGd2Y0MWI0TC9MZXp6YXZDdHRVZGcr?=
 =?utf-8?B?T0E5dXFBQjVQbHY4Q2c1WFNWVzAwVHU1UGJsMUIyQ25OY2lmL3F3dHVYbFgv?=
 =?utf-8?B?YVNDYmJUTUdyRHRrS0M5OUFCelpncFZWV0thaXE4MHBFSXowWEVCbDNDQ3Nt?=
 =?utf-8?B?OTRodDFvWC8wSnNGdnd4NVYwbjFDZGF5RUpxRWVucitPWURBK2g1TTVWZ1VY?=
 =?utf-8?B?ZTV4Nk9qLyt2NnRFSXpxMmFSY05Md0xWbWVBY3ltTFlUT0FNdmUrSlo1Vjln?=
 =?utf-8?B?Y2c3VGJ3MDlvdDBmZHgyZ1VjUmRCTGJjdXE1NkplRWltSXFEdEl0bHhseEh4?=
 =?utf-8?B?TXhad1hJb1RGd2Y5ai9HaTkwVkpkZ3E4N09FMElLa1ZGWlJhRzJNWHRadVRG?=
 =?utf-8?B?ZEkvMVZqV2xSVkJaMlIwUTExS2p4U2EzOEozckdoTnd0SXd2cEdDdHJZSmVR?=
 =?utf-8?B?TjVNcVlOaU5EMmRTQnBBdkZSZlAzRExMUWg3MU9CM0tQcmozYmlhS2ZSODIw?=
 =?utf-8?B?T0RPS25pVjVoYm1iN1RvY1BZN0NvMUloZjU3Z3F2REFEQlI2WXVmWU56OUdi?=
 =?utf-8?B?NFV3L01PdzdIWnNERlNDcHpnOHpJNTBENDJTSWorbTU0blA2cEVLaFE0S3d5?=
 =?utf-8?B?alJhTGpIV2wyRXJwYTQ5eFNkc0Y5aW1VN2hLR0crSEJNbkFOdmJRQkh5a3E4?=
 =?utf-8?B?dU5JUXRJbnZCWUQ3R2xjOU55dTVnQk8rakdwTGtHNm1rKzN2SEUzcW1ScVZJ?=
 =?utf-8?B?OWNobnpCM091bTJMQmxiQUdHR1R4cDZUYkttb09zK0Y2NWJQUitZOFRJNXRZ?=
 =?utf-8?B?S3hFTlJsYkZuYnpTaXJRdEZjZ0xXUzM3YkdWbmNqMGM4OXQ0L0VJb1dUa2pp?=
 =?utf-8?B?RzhlQitlSFM3cnF6eGVIRTNKalVUY1ZyY3BicDE4VnpBdjR6dDJ0dFg4dW5C?=
 =?utf-8?B?bjRsNXRiT1ljTnVjQ0t5Z3A5VDEwcE1YeG56MGp3OXdvZzlteG5ndW9zUUhL?=
 =?utf-8?B?SmRtem1VMDBCS0lCclcxRmtZTEc1TUtKR2VJaWlvRzVaRm5yL0p1R1RwQlNt?=
 =?utf-8?B?TGdQZDZ6Ny9tU0hyWTIwOG5TNzZKL2UxWTNBelpreUl3ZkRtTTlwWFlpWDJk?=
 =?utf-8?B?bmxqNUU0ZlpHeElqaW03RlJndzVqWENJajU2VFhRbWhTQm1ZaFBudXBKWmtn?=
 =?utf-8?B?dE1pUGltT3dhN1VCNXVOc25qSXA4Q21vTXlkSEdwVGxHLzR6bDl2OGxxcU1L?=
 =?utf-8?B?NnVjTmVkN1NNd1FOV2xNZGpCK3lWbVBqby94SXlqRUJIbTJTREtGR0xuOFpu?=
 =?utf-8?B?S3l5RWZlWkNZb3dKZVlRR1lQUnRtUUFsOTdVeUZBTHZSdFRQeFVHNHlYdGhD?=
 =?utf-8?B?U0J2ckpPTXFzdDkzWkE2UVM5azhmRmh5eTkxK0pGcVg2THAweHlLdHZLSERC?=
 =?utf-8?B?by9mZFE1NlNEclBTQ2daR0R1Qk9rOGFKdlVoMTZNVHBtR0NIRjc2QTRYUE9S?=
 =?utf-8?B?Zm9vejF0d0xqNVZKc1lTM0wydWdEN1loeUNoM1VIMnJLNGszNEFweE5YTHor?=
 =?utf-8?B?bWdMazkxM2JHbnNTU1ZqZGQxaElBdGUxQlcyQ3VlMUVuczNmU0o2K2NWdCtS?=
 =?utf-8?B?VGVxVWJydGF2N3pTaXoxRDJqZFpiNHZCd2tJY1lqd1JCOW1nWmR0aVc2OG8w?=
 =?utf-8?Q?Gd1g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71323f07-913e-436e-83ae-08dd4a15f318
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:29.0676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJVswVeExyCpkANa2IshoboOoORV+0z0FbYYRmDb3NTE6oH65z3x+nhCJfSICtXcCzjs7sm2p0ExwPhbNfPrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10238

Add support for i.MX8QXP, which has a dedicated control and status register
(csr) space. Enable obtaining the second register space and initializing
PHY and link settings accordingly.

Add reset delay for i.MX8QXP. It needs a delay after toggle reset.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- use dedicate csr reg to control phy and link settings.

Change from v1 to v2
- change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
phy drivers
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 119 ++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index b5eae56d92f49..788dabe5a0870 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -89,6 +89,8 @@ struct imx8mq_plat_data {
 	const char *name;
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
+	bool use_reg_csr: 1;
+	int reset_delay;
 };
 
 /*
@@ -169,6 +171,101 @@ static const struct imx8mq_plat_data imx8mq_data = {
 	.enable = imx8mq_gpr_enable,
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8QXP
+ */
+
+#define CSI2SS_PL_CLK_INTERVAL_US		10000
+#define CSI2SS_PL_CLK_TIMEOUT_US		100000
+
+#define CSI2SS_PLM_CTRL				0x0
+#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
+#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
+#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
+#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
+#define CSI2SS_PLM_CTRL_POLARITY_MASK		BIT(12)
+#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
+
+#define CSI2SS_PHY_CTRL				0x4
+#define CSI2SS_PHY_CTRL_PD			BIT(22)
+#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
+#define CSI2SS_PLM_CTRL_POLARITY		BIT(12)
+#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
+#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
+#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
+#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
+#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
+
+#define CSI2SS_DATA_TYPE			0x38
+#define CSI2SS_DATA_TYPE_MASK			GENMASK(23, 0)
+
+#define CSI2SS_CTRL_CLK_RESET			0x44
+#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
+
+static int imx8qxp_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	int ret;
+	u32 val;
+
+	/* clear format */
+	regmap_clear_bits(state->phy_gpr, CSI2SS_DATA_TYPE, CSI2SS_DATA_TYPE_MASK);
+
+	/* clear polarity */
+	regmap_clear_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
+			  CSI2SS_PLM_CTRL_VSYNC_OVERRIDE |
+			  CSI2SS_PLM_CTRL_HSYNC_OVERRIDE |
+			  CSI2SS_PLM_CTRL_VALID_OVERRIDE |
+			  CSI2SS_PLM_CTRL_POLARITY_MASK);
+
+	regmap_update_bits(state->phy_gpr, CSI2SS_PHY_CTRL, CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK,
+			   FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, hs_settle));
+
+	regmap_set_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
+			CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
+			CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
+			CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
+
+	ret = regmap_read_poll_timeout(state->phy_gpr, CSI2SS_PLM_CTRL,
+				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
+				       CSI2SS_PL_CLK_INTERVAL_US,
+				       CSI2SS_PL_CLK_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(state->dev, "Timeout waiting for Pixel-Link clock");
+		return ret;
+	}
+
+	/* Enable Pixel link Master*/
+	regmap_set_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
+			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
+
+	/* PHY Enable */
+	regmap_clear_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
+			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY);
+
+	/* Release Reset */
+	regmap_set_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
+
+	return ret;
+}
+
+static void imx8qxp_gpr_disable(struct csi_state *state)
+{
+	/* Disable Pixel Link */
+	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
+
+	/* Disable  PHY */
+	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
+};
+
+static const struct imx8mq_plat_data imx8qxp_data = {
+	.name = "i.MX8QXP",
+	.enable = imx8qxp_gpr_enable,
+	.disable = imx8qxp_gpr_disable,
+	.use_reg_csr = 1,
+	.reset_delay = 10000,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -273,6 +370,8 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 		return ret;
 	}
 
+	fsleep(state->pdata->reset_delay);
+
 	return 0;
 }
 
@@ -860,6 +959,25 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 		return PTR_ERR(state->rst);
 	}
 
+	if (state->pdata->use_reg_csr) {
+		const struct regmap_config regmap_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+		};
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
+		if (IS_ERR(base))
+			return dev_err_probe(dev, IS_ERR(base), "missed csr register\n");
+
+		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
+		if (IS_ERR(state->phy_gpr))
+			return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+					     "Fail to init mmio regmap\n");
+		return 0;
+	}
+
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
 	if (ret) {
@@ -979,6 +1097,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
+	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


