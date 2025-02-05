Return-Path: <linux-media+bounces-25697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C4A29742
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0242C7A2C85
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C3120D4E5;
	Wed,  5 Feb 2025 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nid3T96K"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208051FC10A;
	Wed,  5 Feb 2025 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776001; cv=fail; b=QC4RakwpDBKacWa6pL1wchRJPXaWltb3Fu49vHwku+LUJAWL41CRGHFCpgteJGhYtI/dDpNWKCNa8Aek/Rz47wt+lJOI0EdFCOGVsC4Pplp3faomDwDfCUAKdEvpwXw7HelyooZhZVe6qdNXTrnpnxi2ylvHUdrWAbJ2RFlzDGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776001; c=relaxed/simple;
	bh=F8/KW1mmqtnqimsbaU8oySYMCeCZtjkqbXU7OApktdU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jcdiryS+1A2GJkTETSnacRdoyMoetCBpVvnK2N+LsMyiFpFAhP5/4K2w2pAC7YOiGo1ApEFFKpU7D/134193Jo/vVDZN7c9JvoAe1d6o16kpZMHZdxDMRhryBSI2+VTvqD9NAOydwFdSTuRA5iLGFvqXMQYMNfpHB8OsSphYIqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nid3T96K; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kg8st47SozHnjtYTeAjocgyxgvpk5aWtJgxAbygRBuLJ68yRZ8JAkDDaFyOqAMnbdH20P/wYMakR+K4GyU2DEOtBHe8V/GAe1+CqcWRCLgEuMySwNWWsbAOw4CTbk1Ovdrq2XcM5X6I2mTXRismFsmbkfEJXmSuz84UUONVaH54CJPYH5GRInVQYCrNdGL3VCDQUw406469iQmfCKumJkGKESyHcVNb4L0vsFgksA+U8oa6ykIYLoMdLHB5ErOuQ8Bdso534Ef9ilWZ1ucy2Q6R2KCPQYmFcS/yhVBGfJbTdO3F9kYlCUvSHmva+UxV02c1BCD6Uy/wA6IS4fFKoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etzE/kLPgmJV0IsOO404pIa3/yAdG0yAA4xJMxW/xZs=;
 b=h7J6MEqgFjyGpQplNvWDZqeBav7S/9z9+3QX1ujwgFBDlpBkknI1kbmpupMudbyRb+IHZxwTmGTiW0ZSkyT4EOXzUmUJpaPAGPLvJDfr144M4q9mYaXqOX7UGXUHXI8WJ0AisMcXec5knWmjlXEr3/qlZVzlC5YyAUxIHpMzxepvBWP1ewQfNs3m3Z++4zdmPz8lyTmYjOlOFtr9J/NwZRcvnIefC9vC9Av1MgJw2o5MfjjHETIY1M4PKjBn/B95Fa6g2f0PMfTO0Xej+3pc2Db2cnHhwOBX2AzHOPcH7DIsTCS/FV4CTJkdHyWRTGYUmEBu3WAvSD4Wn/wAf2YHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etzE/kLPgmJV0IsOO404pIa3/yAdG0yAA4xJMxW/xZs=;
 b=nid3T96KkslqZYHx6C1XxsMD2dK9K//OwtUFGtRHFR8EJdZs41errIHp7LxqQ7XPtqRxyxGbEo9Gbdp7MLb089wBYKXyJBTPfMKnNZrDFyiWxoAhJKwrVzreztsWiQa8yjNHJNmGOfGxvphP4QbWHQr8S9i9IBSnB0pOgBL4vp7UYwoXhUDYL17kXiitT6IV30tg3H6SIsrbHWqHOMMv4rRVpFi0AFjciq4iPCy4vZSUzkw5sLORKCHFgtayOogmTQx46DXJjUHMxjBThztksOCQVEXQdDhgnCnMxMi77Sn50R323QUhD5CQnoENHWFFZGLXnJv2iJsUMIiDD584JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 17:19:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:21 -0500
Subject: [PATCH v2 12/14] arm64: dts: imx8qm: add 24MHz clock-xtal24m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-12-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=890;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=F8/KW1mmqtnqimsbaU8oySYMCeCZtjkqbXU7OApktdU=;
 b=5jh74NOJopQoqkWhxYo2ZW5YRP9Tm8E+8inUSggFYlMRXbt9Pb3xyZ2sZMBlpthCNX1nVc2sP
 cHIvo+fm75lDS04y2zeURVgDAFk5B2DCL/L6jrKvx2xl4+0Q06iC4eN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: f265312b-230a-4f7a-7919-08dd46095064
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NysyTWtsUEYrRDdsMFg0cUJhUmJTUVo0NHkwYmpUVDJqSWhPUmdBSDVNUlZR?=
 =?utf-8?B?MDB0SW1lRGhiWDVpTlk5Z296SUs1V0VxWU1JTUVISXQ0cjZYMHZ6NmtIYTdt?=
 =?utf-8?B?T0pib3I5a2NxNFV4Q2RvYkc4SUhWZUI1YjRrakNaK01nYXlTOVJ4U3FMSkxt?=
 =?utf-8?B?TkozWCtPZTlJMXJFTitsM2liTW5EUXdBOXZ5R3ZvRlNLcHB2SlpPdFRkSUFO?=
 =?utf-8?B?eng4b2l4OGQyWVhNZTE3Mk5ZMm1XY2htS3A2UmhQM1czd3lqSXhFWis5OWhw?=
 =?utf-8?B?RWxrb084R0ZqTkpCR0FjanBVOVA3Z3d6WWhvUzQ3YmxnM0xiR3ErLzhIRUcw?=
 =?utf-8?B?MWpkVVd5VWdZTkJQRURGNktMMFR3OExFSE1UaWRVUG55aHNxYklzRVNrRGMz?=
 =?utf-8?B?OXlnMVd3cG5HQW5FRU9rcmpIcndIMEhBK3N1YlNGbENIMDV5amQwdUlRUG9j?=
 =?utf-8?B?OVNXK3N0VTdTN1NCQjd6QUd2Y3FKRWtIZU5MS0Y2cy9ZNXh1R1QwWEdSUlZv?=
 =?utf-8?B?c2lsVGl5QWYyVHNXQ3l0VUpVcmJxeHhVNUc4RnRadHp2Tyt6Q1NZS21EeGxK?=
 =?utf-8?B?ZStza1BBY3M2SzNPVEV4cFhJbGpaZnRXd2dlLytmYytHRXZHNC83aG1qMjZI?=
 =?utf-8?B?NTc1UXRUYVNvL3hJUUQzQ0FMODl6ODh6ZEVsbCtEaVdmZVVES3BnYVh3SU9z?=
 =?utf-8?B?VUlrMkFzWlpxVmIzWFZTTjExRzZEZjZkSlhvZis0eVVqTm05UnNLNVZ1UmNH?=
 =?utf-8?B?RDF4YmduVGI3bkM2SXhmaGNhN1ZHUjRyYzhxYy9RVHNoWnJYRmJvTStHT1pm?=
 =?utf-8?B?V3pGSEY5TzZielJXZjBlWjJkYTFIeHdFd2svOVhCNFFja0I5WHJxZVRvZVk0?=
 =?utf-8?B?UkU5Z2NvZFpCVlY4dm1XQ1d4S0xMNjVnKzRIZGtkbHFQR01RanFRT010d2Fa?=
 =?utf-8?B?RUhQQnF2R0toeWsrUDB2R0dieHB4VEZYblg3RE1haWVxanFYczhBczQ0REQw?=
 =?utf-8?B?YTR1MVduR29NWjAvVytSdUN0L3hrQUQzVmZWcURndkh2NlJxdTVOTGFkRXZ3?=
 =?utf-8?B?OFE3OTFlcGFCVllYM3hVc1psbGlJZUJaTUJTUTZwQWJJVDdmbXBldUxQMlQy?=
 =?utf-8?B?VFhYZnMzUjlVVW10bHFaYlMxa05yeHhTenV0TGs0Q0RrN093TEVIOFhKZUkw?=
 =?utf-8?B?SWJpOHVqREsxTmVXRGlmQ2h3TGNlQjZJNVpaK3lhK0RtMXhEcEkwZzhINk84?=
 =?utf-8?B?cVpBdXB3bEU4eEZrNk1ibmxyU1NObDBoQlZVTThaNVZZdkdjcUlXWWhyUk5V?=
 =?utf-8?B?RkNGb1didWZnMGRGRkVCQ3NMdm1rQUo1bWNoMVZsY2VIVW15cGl2blFsRHoy?=
 =?utf-8?B?QTE3TVZPbDFSS0dZZW91UGNFSmVRcnN5VjRoVDg0ZnhiZWQxRWViZTJ4TG9z?=
 =?utf-8?B?OTd2Ni9EVGt4ZG4wN1hWWlBjcUd4Zkt0cFJWb2R2ZnpoTXArc3FCYVlISHZp?=
 =?utf-8?B?NHBDMVY1bURrOFo4M2paT0w2UnlJbzVkcnB5TzJ2VzFQYjBqNk96SEhkUERQ?=
 =?utf-8?B?Qnp0VUFGVEEvQkMyY21FY1U1VkcwK1FQMVZxbzFlUlBkQU9MZEtueTJRdG9m?=
 =?utf-8?B?Qmp5Y2VjWUlMVnVmU3ZyeGp5NmNTUE53N2NPQ1V6ZGJyV1dRM092bmwwL3pR?=
 =?utf-8?B?ZFkvU0IwL3c3MFRLeHdwbEl5R2h0ZktRZGovYTllRXNFa0EyOFN2VFNTcVBW?=
 =?utf-8?B?Mk9uc0FxUFdYaXg2eUxMaUFPRGoxZ2pCZW1oVyszWXEvS1k0L3gvQ0FIa1Ix?=
 =?utf-8?B?dU82Uzc5QWljZURvU2hIRkczaEhnQWRRYS94WWZydGUrMzh3QUZ5UjRXQklK?=
 =?utf-8?B?OTBkb0hEcElLU2pvVTNuOTVRMW1oSldYUHZva2l2b1ZMbWQwNHZzZ0s4VDBR?=
 =?utf-8?B?cnZ4WUlYL2xocnROWjF6cm1BeTdMVWcrKzNpUkVzV21xZGtKblRpU05kOVhO?=
 =?utf-8?B?SklpcW1sTlZ3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NkhqL2dTaDEwRFl2Mk9BNGFQSkd6ZVBHVm1Ca2lWY2IzMVNJdW5MVTVpcDJZ?=
 =?utf-8?B?NU9ISGRTWkp0T09Dcm81VEdYZ09pdER4YUhUUkorVVRaSExTTmJrdlpueS8v?=
 =?utf-8?B?QXBXaGt6M1pwam1TeFg5NzluTENvSE9rNmpzcDdsZzhXMjhnY2xCZ2luenNy?=
 =?utf-8?B?d1FDaTFTeWpJT0VnbHB3Y1RPeFZsVHVlR2pZQTBDZitwQWJuZy9XaEtLb0oz?=
 =?utf-8?B?QW9wQzhqZlJFVnpRdmtxZ0VQR0N4NXM5UXhTcVpzdzh1TWQya3dqb0ZmVkJ2?=
 =?utf-8?B?bGJZSjQ5T0dJSCtGY0Rvem03MXAxK0lNR2lhYlpyU05sREEwRnJXNXQzcjht?=
 =?utf-8?B?MjhSczhvc2Y0a0tzM21RV29OemdDaXNPTTV3Mkg2ODZRQnBjM3YwRWlUT3lS?=
 =?utf-8?B?U1ZoS2FPdE8waHRJekJzb0hBSHBybnJGRjNoSjBwdWVTOER5cDZsMG5XUTdV?=
 =?utf-8?B?VndvS2VZVXlDK1ZDcFlHbDkrMkFLUlEzaDNETmNEdXVxWjljbHZKVFBnNkJT?=
 =?utf-8?B?U2M1dEtTY0ovT25wZ3ZMWWF5NTJMMktsRnJYOVRMMUVOZHpmRmNlckFaOHI4?=
 =?utf-8?B?Zlc2dUdqWCtDM2ZXWG80Y1JkRHAxc0NwMktucVM2MWdldWhjMDVVajlzK0ZT?=
 =?utf-8?B?YnlRaTZLQ252a09JVSt1eE02dytnSTJ4SW9mVTNPb0I3aDIvcnFnR1R6M2hJ?=
 =?utf-8?B?MXd0Z2JyK0w3VEhQTzRDTDVjM2ZvYTBFaGRmdFBCU04xSG5ScW5IQ0hBd1lq?=
 =?utf-8?B?cytXUHk2bkZ1R3owcy9DL3VLVVJyMVpNZHVUd1lRWG1tV2NGc2Rlb3EzcTBR?=
 =?utf-8?B?NHgreFFlc21GMFREUnAwamFSZnA2RFUrbUVhVSsvbjRCbDVNWUFZTmdzWmdv?=
 =?utf-8?B?TEQ0cG1ESzVyTXV2N2E5SnJGRHBJVG5JWWgweDA0YldZNGcwRm9yWG1JNXpZ?=
 =?utf-8?B?R1AwbzRCK24rVWwxZ0VGYjl2a3lrVnhmZlprcUppNjJqUmRETkhwWTNVL0FH?=
 =?utf-8?B?dVZ0bmV5dzBuRTBMeXJ0d01Md2gvQWt4UXJ4dXhZQjJyK3N2NUlISW91c1ZX?=
 =?utf-8?B?Z3Q5czFjbk5DWjAyTUJHUW96TkdMVjVJTzJyVlNmZE9IV05iQmVOaU9IT0k5?=
 =?utf-8?B?c3owNkdBR1J1bzE4ZVZNMkNVYWlrQjZVZHVWT3pLbjh5akMvaDczbjVzdC8w?=
 =?utf-8?B?Rk40V1RyNjlrWEEvUjRiUUlpaDkrS2NJaER6eGVZdDBHVWhqejdGYURvVXNQ?=
 =?utf-8?B?MEttMDZaNmlzVEg3bmpIakh5MzRLQUZ2WlRZWEdYSUo3ck9POVgvUXNSS05R?=
 =?utf-8?B?Wmp6WFljbUdncThUQ3hNdFFTNWRCOTFGU3ZoWHVLQXNYYWlhemFNaE1rYjI4?=
 =?utf-8?B?ZkJZZEZmRWc1N1hGbnRtczk2THlRZmMxcW1KQTBET3o2bGxwWFdDS1lhczlN?=
 =?utf-8?B?dElQNng0NmNRejFmeFB3QTBlMVNKYVlOUW0yTUg1TFV5VkRUREpEL1ZHcEd6?=
 =?utf-8?B?VUgxd2ZWTGpJVk9OWDJFdThSem5jZDdtVmZRd2xBZmFXS0poRkxnSVQ4QXd0?=
 =?utf-8?B?T2dBQzlmcC82ZTVnTmkvMnN0V1M2N2VBbjBkYWtyVHBKalBrcS9PWjNuUm1R?=
 =?utf-8?B?V091c1k1ZlNYZTZqUWF3anlIN09BTC9LNFQ2YUVsUVluRmR1L2crQVRuclMz?=
 =?utf-8?B?dEEySTdzc2hBNWJLRnM1Z0lXYXp2UjhMbEtRTEN0UWpOYVBrc3JHbDhmZjd2?=
 =?utf-8?B?RlVyNjVGa0VMcWcwYU1MTy9KS0phUlkwVzV0My8rSFFDUFJMWWFVU29ZMk5P?=
 =?utf-8?B?ckc3QUh5aktZOENtaENWYjVTV3ZVSVN3bDY3cTROL0JhdXdkQzFwWERBVldv?=
 =?utf-8?B?ay96WTBsSDJVZXN5WDN6aVJsVklIVDRVU2Y0cTdJL05CVGVad0o4ZFBXanlE?=
 =?utf-8?B?ZlJ5VVU3SEpwOXV4eklDaDVrUHhGTXpld3V4blVIZjgrRTVFeldFMzc1YzNy?=
 =?utf-8?B?TVlqOWVmQjI4WUNnMVVCYlM4QzBySExzOHo2ejJBMnpQYk84ZkRkUGdySmtq?=
 =?utf-8?B?OG80OWpiMGg2WlI4aDA4M0p5U0JjRkVVdUJQSGpBMnFQQVRoUFVMbjRkOWJQ?=
 =?utf-8?Q?oIswScb3BxdUrRBmkU8G9A4yN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f265312b-230a-4f7a-7919-08dd46095064
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:57.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04SB/bnDq53/ZNgjf4kiWePwfMxfYAuKERX1bDByHIyLSX5INw3a8WWDTjiEV39e6+8pzFv42lAp7kCne2T+lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

Add fixed clock node clock-xtal24m to prepare to add camera support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- none
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index c6a17a0d739c5..40cd45cd9f88f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -590,6 +590,13 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	xtal24m: clock-xtal24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal_24MHz";
+	};
+
 	vpu_subsys_dsp: bus@55000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.34.1


