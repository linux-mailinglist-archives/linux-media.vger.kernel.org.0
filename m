Return-Path: <linux-media+bounces-37945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90701B08644
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A323716BED2
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AED621ABAE;
	Thu, 17 Jul 2025 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AbOOfUAp"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51781F9F73;
	Thu, 17 Jul 2025 07:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736317; cv=fail; b=XelOoIAuJGiPKO1SrotvmiZqAek6goyGKX/Nsg/yllX2Poabo67rP49l5/lm6roeXgrFO6JoddCUXL97/DUvlWT2doEFykcy8PjfwFl0NQzcKC6sQsnrJeMpajM1GdFOuEb/2JD/MZiIdcYekt9NESgHkO7CFFnpZ7j4gsiaEY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736317; c=relaxed/simple;
	bh=PbXX1gSdfOqpHYDhMCsu94ZafUdArGaeCsfrTjw14DU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BDxwZXihqyxV75nS4RAZhEdkqs225175HgMc2jBYQSu6N6QZC8qfbM0edsD6NzKGzbsBa26kSX9ZluFjljMrCsS8uxbvp4qn5wJ9XOHAGWgh1spP+2/qIZZY3vsYC5R8GtY6uWhJX7p812cT9vyx0pqYTqDyonn0PWtB5jXj3z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AbOOfUAp; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGUD36DrKC2cn80ttmwWQLWwKQ4K32vikc/cynnCQ0W/sPDzEsdIPoa/jb+kDsp3AgZMGb0PXyVX/usRHSVO+Eu3d+yMp9yikyamCpdrLVj5kUW1IWiFbGHfA27j67ojaf90XJvkoHZOWzighs/hwCNxYhwqNRX6EyX7nXi6PhDEUltQKlj6zENPfZjuqfIdR/8glH7K/kRo4vOBkO6Jn12VtnMrZnWL5y8uoF6AwgbR3Ak0ayBr5QEL6BG6ritpWM9AtMF2/N8Npiarr/796cXVJCrY3Y8Kdp3iYyDMziWf+jeNCouP590SsEUufYxXy3a88cwSP5XKzco40iYXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdOeWgTRzqFfZMeAhTewfGFzIE3RF8/yrOak8eqUrTo=;
 b=sYMXCx+18ExZPfdhXyMaHlcKGRKeilkwvuyMQmAix6hDcUBaZtyTEcGcwgWZTktRYa0+2E5SHl4z6qZd1hj8WZTokYOYh5y4Z7HrEg7vvDTFkEbx/MCf3S4plN3YH6oMRUGRDKePnfV4FyccOfBsDyUJJ1+3UpG0LQ/d3+0AhphRjJWwbOGbsahNhsqDb7HwQgKpJneLzMYhD5rfd/sKD7c6Tm/fISJKjuEH0DYilBkhhviFtf6isjyIet7fBKSuXZ4wMcHZ1fRe6kA1um4ITR5T/wkDKHZAODhPTCKtbToEp4VbowkfqlV3b2+EVAmu92kZRezL1t9zgey/GQi+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdOeWgTRzqFfZMeAhTewfGFzIE3RF8/yrOak8eqUrTo=;
 b=AbOOfUApQRkj6mALcew5MAV8maGhTv81LiiNVaj+DUm3KMPfQJlQYteVcb+lVuCPDuTYGS9AoBozgZnpWxy0Iuhn9mvRTch43v79i49VvJWE4kSPDcxUPi7Z+TluE5EBVen5nXi5rh6P0ki4GbAwcWXV5Mxk99iKLAcrYeu35JDNoxJ4cg44mMxivrq1+Uuh2w2+Vg9KZsFzmKjn5m6yxLuAgYvIHJJtyfHJcz8mjGe8AnxYr2LxhDBcWZUjFW3yRse8ZDBiToYBbxgksEu7QpFjqsQ4LplLiziq2lwH4ETYJi20Ds6I0D5XEUwWKpuJeWaPbBvdQZVN5DvOM7F5Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:11:50 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%2]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 07:11:50 +0000
From: guoniu.zhou@oss.nxp.com
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm
Cc: mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: imx8mq-mipi-csi2: Enhance the driver to meet more usage case
Date: Thu, 17 Jul 2025 15:13:56 +0800
Message-Id: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: cebf340c-ee0c-4092-fb5b-08ddc501332a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WHBSdkRUc3JEWHpncVZFOUwyZkNFNmNvRlo4MDQwS05temp3SFFNb1p5MXMv?=
 =?utf-8?B?MHRUbGFGdHdJTDJrVS9Ob3pLQzkxbXVKZUcvcS95WHFoQlRWeFAzWVdkcVg4?=
 =?utf-8?B?cGVCU1huakxDdXUzdFZreVdodnFxNktaTzNWYlIrRy9FNDFEK1pVbWg3NnpO?=
 =?utf-8?B?WElmSjdCN01PUk9TalE4UWZqelkzOUNJS2RtTkt2a2w3MWkybElnUkJyZHJL?=
 =?utf-8?B?T1NmSzlhdkpDdUhrK1V1STJyaUp6c00rOUs4UUlRUk43UU1vTGMySWd6ZGEy?=
 =?utf-8?B?azVneVRxelhnUUVCblUyZWZiZzFIbDBVY051dU5ac0NkdmRTV3Q0WjZOaGtJ?=
 =?utf-8?B?YlhQRTdLbG9RTmNIUTZYVTV6d3ExTHJTN3NVYzBOQS82QWpwYzgvVTlCYytu?=
 =?utf-8?B?NzVKeEdKMWVreVY4RmVvT2RZbzBPaDN6U3pIeWd2M2lWSmF4NW1rbkFwblRo?=
 =?utf-8?B?NUFIQ0o1eWxQYUJ3RkdjVDZjT0ZjRzl1Ujg2UnZRUlFuTGVuWmo1QkE4RlY5?=
 =?utf-8?B?dHVjZ0xObEZKa0N6L2ZvclJhd29ZWlE5SEJGaldkN3owTGhxQWNadDRuWEFM?=
 =?utf-8?B?VHRXT1NXY3VLUXpaTHNNd1RtVGFIV2FyY1BJeFowL25vWk5IYzJKVHE3WnNI?=
 =?utf-8?B?SG1NaW5kZmNWNjI4KzlQYWsyRTZ2aUFpRk94SmVpZFl3ZkY3R3h0NW5Wc1l5?=
 =?utf-8?B?Y3Nod0taQUNHdHRNTzBTdVdWd2xFaHFwMjh1U0FXTU1jZmo4U0d2d24zblgx?=
 =?utf-8?B?MEdWRm51azB6Y3lCTXpwYlZBNk91bzZtSFZSUDF3aGNLOElsdTlxSmdrQ0dU?=
 =?utf-8?B?ZTFkMmthS1VEYWFLTUlkc1JUNml6YW1sZC8rZ3FQYzZrQ0VucW9BV0NpQjAz?=
 =?utf-8?B?OW5tSjIrUWQ4M1E5RGJDWHJqREpVQWt6SVFsbENiZkZPTGUyRHRERXBxbGh1?=
 =?utf-8?B?d3lSellockJvUStZZE1BUHB1dk1uL29nU3lWZkNMbnZSRUVNbEtiRTZ3ekhI?=
 =?utf-8?B?ZEhQM1RmS2djQUZoNnNJbXdsdjBwRnB3WHdja0hhZEw0TUFucmkwd3RNQnhZ?=
 =?utf-8?B?SDI4bDJ1TFVqd0NxeTU2b3JhUWRkb2FPOWU4UFFSdnF5RXp5dXJ5NndVeWVI?=
 =?utf-8?B?Sk5GSjVxK1N3WkE5VnBDZXlrelN0TXUyOC9RanBFdjgzcGVIZm4yM1NuOGN1?=
 =?utf-8?B?VmVQRHJ2cFpqT05rNHNSanoyajNIdVgrT0xucWZpUTRINjA2QkZycHlkbVJY?=
 =?utf-8?B?NDd4RExKRFFidy9GZmRFWU44dm96bDE3aFc1emFTVThhZnJ2NlFkaVl2UkRk?=
 =?utf-8?B?NTFBWEZRSFNDazIwdUNwV2ZLMFkvOUdQRnZXTjE0SnJSTXI4N2h6dUNMYzJC?=
 =?utf-8?B?ano1WWR3QVlySkNNaEdjT0tLMVFJQ0duV21KYU9YbVYrdUMwYmNOUUlsOHBP?=
 =?utf-8?B?YjFNZVlhakV6d1JHaVBpdEF1b3pmejJBc3JFeGU5U0VGR2xzNTdReldvSWhz?=
 =?utf-8?B?MEVtM0E4MTNVZWFjdDJXWHQ1OFFPV0JsT0ZJTjlzV0FuZVRidTFlbEVObTgw?=
 =?utf-8?B?K1cxM0lSenRiSExkYkM4bEtuNWNuTWFRZGJTZ3hOM2tWVW5vSzlHZlR3RUtw?=
 =?utf-8?B?cHVLSmlZQm90SGliUG92UXk3cEFuQ1MxUzNOTElwbXVlYjF5MTNPNjQyVERN?=
 =?utf-8?B?amxFaEJaOXErRGIwLzZ1MTN0UncveW9jVWxwUTd0TmkvU21sOFU0bHRZT2NK?=
 =?utf-8?B?M0tZVTVWSVpBclkzYkJ4eXJSSm50OWpVVlIxWUZnb3BkMjViUFNhaGFuS1JH?=
 =?utf-8?B?c04yWGVVT1BpMWZwWG5ZYmNUQmdCWFB1SGF0SjdCNGc4SkVoc202clJ4cDFB?=
 =?utf-8?B?aXpvMnJEdk0rM3plSW9IZmNBQ2x6RUtZdWhQN2k2OU56aVhBbEE3dGZSUzRy?=
 =?utf-8?B?cUpRcVhQbUQ0d0gyMlp1RjdHdlpWNWdZanJtUjkvZFBHdzJja0lveFJqNGky?=
 =?utf-8?B?dE9wNTNOL3JBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QlhwMTZuc3c3aU5ITTRZUEJIL1lJNnJIeXVvYTZLbFA3WXB0UHpweTdBVUJl?=
 =?utf-8?B?MXRLYkwycmZJc3BHNmFNeTNIc2lsUFFhRitQcWkybXFJU3ZXUWlZRmxuMmZQ?=
 =?utf-8?B?eXZuQ2I1US9tWTFlQ2FtNU9oMEJaKzFsaEVWekRPalowM2JuN3daMGFsYWxL?=
 =?utf-8?B?d0FTSE9ZTDdwT3RCTUl1cEhEeDF2WjQyT01PSWRmSGlIVnd5MjUwZ0wzamQ0?=
 =?utf-8?B?Z25mSnlxenNIeUVBa3R0TXB3ZENhRzRkOW41OTZWQTRsUTByTmJOSEMvblIr?=
 =?utf-8?B?eDNjNVdIQmRPbVFSSW5qYURTWGRRQmJxNE9YdE0wbXk5MkJKeElEQklaZnFn?=
 =?utf-8?B?eUxXZ2UvTUE2cms4ZUgxZVBVZ2ZaVlFRZ3FuQnNqQi8yRGtEQmg0WmFsS3VM?=
 =?utf-8?B?NWRsYUtMTi9qY2dmRXlRcVVrZTN5WitrdC9abmhaN2drbi8ydWdpZ05YS3dG?=
 =?utf-8?B?SUc0eUZJTWNzUldSRnlJdkVoZGNBMld4VVRNT0ptZDBBaDlPU09XMWNhbkMy?=
 =?utf-8?B?d05tQ3ZOdHV3RjVhWnFyaVFWblVLMTdmc0I1c1RjMUl2M2JzNmF1bmRrTFJj?=
 =?utf-8?B?T2QxS3I2Y0NIYTQxaWNDNk5tV3hPWm9ITjZ4SlBDYlJZbGxlWlV5bmFTS0o0?=
 =?utf-8?B?QWZkWWhEcUxYdmNaOVJ0dWJjNlZCMmEyZmRtWDBUT2hTQnhic1BEN0RGN25X?=
 =?utf-8?B?M0RwdTF5OU5qd1Qxck1UNFdtUGxUaG5XaFpDY1dPVk55UHd2cnRwNEd5RWht?=
 =?utf-8?B?aDBWL2xzZ0RuRS9DVEswbHFEaDg3UldsMmJSWnA1WlkwTWhyTG8rL0lITDRp?=
 =?utf-8?B?TjRhVldObW5QTVd1VWZEL3luV1hYdjVPWEJHWUNuUzR3azdTREdwUExzaWd0?=
 =?utf-8?B?T0lvYkhOQmc4MllWL2VmaWdWcTNYYkpCN1QzL0MxZWh2aWZjYVVlQ2tLNW9K?=
 =?utf-8?B?dVovWjBUNVFqeXArSGR5VWdIZ2F4blBubWVwd3RtM0ZhcFhFa1pHRmhaOHRB?=
 =?utf-8?B?dFVFTnIrcVp0RCtKQlRNaU83ZUJmOWltZFA3QU1mc1lSRXBla2IwNWtVd2hU?=
 =?utf-8?B?WHV2S09hS1E4ZitESU9BZHZ2MndoejB0Um9YaUZ4aFhqREo2WjFyYWxLV3Nk?=
 =?utf-8?B?R1ZNT29aaGJ0M0UzNVhhSmFqOThKWTdHemg5ZkszKzFXWGhuN2t5L2psVk5N?=
 =?utf-8?B?T05EUFVTMmt2dDc4eFBOT0ZOREErdERpeGx3cUpBVWFrWUJqaEtaMzZLekd5?=
 =?utf-8?B?OFhLdmVMVkdLaGR4ZEhEYU9tTmo1cU50aDJSelZyeG1ySWQ1c0Vnc3orWVpi?=
 =?utf-8?B?cVZ2c1pyRUhqeldpbGFTeXc3amhSVVByUHd0L2NxcGV4QThXUlB6cDJYR0JP?=
 =?utf-8?B?TXlLdWZ0QWI1M0U2T1pvbnJML3VsZlV2Sk1ZclN5OUw3M0hOYVJha0pYdldj?=
 =?utf-8?B?N05EV0RSeXZBcjdDVWdXYkxPNGFJQlIxaG1XYXJTS3BsRzNmU202S0FIYjlT?=
 =?utf-8?B?R0wya1owREN2bzdtRW9tK1RreW9wWlpTZ3g0NDRwZzgrNU11SGtzR3RzSFJJ?=
 =?utf-8?B?SkM1M0U2NXlibWhWOFdaUWZoTlVyeTd3cC9RQnJzQlp1QlFhVlNuUm95THRi?=
 =?utf-8?B?TEhPLzFURlVYMXBkak80K0VXZ3BmaVFkK3Z2VXpWZW92TWljeHpwbU80Qjk1?=
 =?utf-8?B?ZlVEU2xHdHhpQTRtUmJqaGlndlh5bVVLNGVySEVNQVQ3aFgrOWVLcFd3TGc3?=
 =?utf-8?B?ZDZIdms3QXBMYWpKS241b2MyVUtGU250Q2FmLzhMeStraGZ0MkpiTUcrVGRN?=
 =?utf-8?B?bWFrTVhUSTIxTkNNM25OWCtxZmhxSnJJMU9jSCtVQmlhNlVoQ2pLTTczaVhu?=
 =?utf-8?B?dllla3lNRTRIUFNKMHJ5cm8rV0JmejNZcWlHM2NUMlg5ZkNIYVIvZmpYai8r?=
 =?utf-8?B?eEJtQXBPMGZXK0o5dG5yN0h2amQ1RFY2cUZkMmJTcW1OSUs5MlRlbzA0UVlP?=
 =?utf-8?B?QXdWeWRhaGpYZFRqY0tsQkJ3NlVPalg1eGdya1R3Tm5STnRCQXRLN0x2bExn?=
 =?utf-8?B?Q3E3RTM5bzliK2txWU5OaUhmZUt2a0gvbjFKZ0dhTFNoN0tkSnJLVDB3bEI2?=
 =?utf-8?Q?xZ5Hu9ptPWrETii2ck3aMMRsM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebf340c-ee0c-4092-fb5b-08ddc501332a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:11:50.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxwjgSLtB5V2i4W/uM3Gx350bbSjmuKk5IjaYOx+H6047Eng+nX5knCB9DYHEogtZaiIYtxQ/vuE0sodIIHDLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The bellow miscellaneous patches enhance the driver to meet more
usage case, such as i.MX8ULP.

Guoniu.zhou (3):
  media: imx8mq-mipi-csi2: Add data type field in pixel format
  media: imx8mq-mipi-csi2: Add RGB format support
  media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

-- 
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
--
2.34.1


