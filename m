Return-Path: <linux-media+bounces-65587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vLPJBX9APGrWlggAu9opvQ
	(envelope-from <linux-media+bounces-65587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:39:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045D6C1394
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=P47DPsJI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65587-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65587-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31F4304FA5C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DB33E122E;
	Wed, 24 Jun 2026 20:38:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16AA3E1222;
	Wed, 24 Jun 2026 20:38:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333526; cv=fail; b=Ag87gSsa3cTFP9W0pNSNF8RFj4g+f3lF8DD8NESM97UY0FaEfZHC7FMX1Kpoolott9cqP8OrMA09Dw2YMENVBuC/jEsZyPpzz7vNFnPy5gmWG7flY3XptZPbF3fchYKjcgyY0TxmRd6Bt7sO1CIzarj6CB/AizDe0DhPtGnsi84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333526; c=relaxed/simple;
	bh=JPrKAvQcvoTkWyrofy0o92gRP+yliD+9KZLk6zANxKU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BC2+PEnjMavGA9FycSpdI8Pmz7dw9MYT1hgrq6IBdbCbw/u2bLisasu4l+iOx8KxqfDIAifz0eS27NjHia5Z29WbEBbpJ5RHM0T9dSFJV53GVdNIY2BQg9fO8AuKYHk2GHilKdqDvhsQv4IJB2odP3xlhoib8jgD7bSZCcqRgXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P47DPsJI; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o44uZcNsVhq48hmBOpFGBxUjDaAQspYziYPcJg1bMiMQZXh/v+7iO2jvmo1L6M0YfMHMRJoUW5qZe91dk/zBvJElT30iPLenp64thR8t+KbrzV59yro11YiztgMLWyxiYrSRPkSuNVA546CpcFJDS7fI8QlmXITKifzbYexEHtmzjixT1y/SiQBusbUBc+/aFzflC4+deLULs9SvGjt3rpFASEHnUXD7CVufCO10D36gfJij4wkh/rhbui4QSvC6+Y2yx4B9m8CFFcFKKlj/vOoQxREDwxvSLg3VlqoyXllOz83ApOGWp/LfHE4YMZcAss6gSyN7TCdZrzNla9DfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+tgr1Ap0i9OzZqPcmohFuSY5tkU630KlTIERKHGLe8=;
 b=wMYoqhUWQLI3pa8xl2sJNTmZZTBfRyk4dcAEj0U6RMMmprDr0YlSxPqK9WCz4kV7jYdnSogfD+rEE5YKLCl2eBN1Z6sQzd+iP8p4jlevVDiNhg8/hPWs/gUOdhYOjlAvv4h4GaWx8mioA702TGCqVkIUYTIIOIVxdA9byAAJZslH57/DmPMQliBMJvp3vyRkzkcbph5/TjS7sSUCEn/OOUUsYr7kGmSXsWnhSBmmr1MKHwWExu1kd4YpzD6VY/aa++E/goscVd7R/YFTuMJNBGX+eTbvAU7e6PCjUW2DbK+RxwaYrLkrbSyS20hli7OGRAakQ8SWVNeSPMjyJhNi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+tgr1Ap0i9OzZqPcmohFuSY5tkU630KlTIERKHGLe8=;
 b=P47DPsJIgjJIs57YKuuvq161192eXsBKIhdym1VuF2jBt3cj5Z0wxIHXnA2npYfafQE87KqUgWSveUWYrJyvMlpxQRk5odtdhCauo9MtCbHI5MWr6I1MS7kZtAoqWdGfSzeyEg6UF+6NhtYwH4JGNhlvhpQQgl4r98tg6JzM0YwoUsaAK4GUdz0eETt2jGdrEtm5u/HxRYE3zcxPB2RVohgEbeVLjt7SguTEOQKCJfgIqA2Z8pf0ds9B2g4Jqc1Zklrd3XQ5r1k9iUwik9cv9xAvK2ObRv1JaoocXmMWSRkOPXFjbJPgZoNy+S+tRQR8o4Y+aPC0DgJbr8XT6l6pGg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:38:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:38:42 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:48 -0400
Subject: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode endpoint
 in media_pad
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=1604;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=h3+MxmY5u+lmSZ6oer9Jj49nkAEShJBsB54i46isFtc=;
 b=kEkjSScNwPDCjke9KoaE2oOLYy3s9vh8c3XU21CoCP6oay+TYLuT7pq6k34c5BHPCdo/U/cmQ
 V7kIX/tX6/eBYS+dKKqLS9rMbcuQL/jp+DKSjaRZPpe38Sma7eAz/S7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fcc2935-971f-4f51-f00d-08ded23094a6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|6133799003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 Kt5hXQFv4k1X4swjuAauGfaBgisyznM6H/6xDZAboF6RSdzJfoiUsA51oy3glGVbOsJtswY54zi0F0jbWpoZ+H0L6lkpVzs/RtV2LT+OjZafJAMPOLbh4N4N46oMcalffUcb6HgVW4OAnDFEF9Nlu0lafTQ5zHQLm2NFWBJMeQ4JP/JJk6yiMKNyDbdgHTZHGe6hLRlWU/a7E1Em+rrQ0VvxoEOtXd2rTb8bfPftom18VstWonpgfuCj2C7mVpiCP+0qPlwVycI+terJczQQXcIsxaBxeN63TbNBljkCF0XKcOkeM+F6GkdSgvWWoEPkV07MfllpLSeij3PDVQlk5OB7lBCQxPgMcI++cPwaa650d2GHFfPG3i9pnsdjRzPzr2B6UmTYppyelBlJCdKkrtureFsXNPcaqRTVc7TmvU4zJuxWz1xIVI2Tmr4od7yRjxfKLmQIWGx3+y14+n3n7RJYA/iIuwCEO7yeXRTRzYMjSYdt1/gNVFLSFcNOywJ1s7JGfkpAYuL5vEJHuHDfu1WQ2Gn3FjPu3+mOacypc5rv/sKqh3ttxDUgW+7cyzMetybsW9Kr9i8yV3IHM9RHx1vrblKbHZ0e3HVzg+ieh7KZEJ/OZEhYcOYEGuRsCi/mu8CQCx9qOtYsWPno8ujwg7c1fQCHPhZ3pLZ2NSipPTF1nWG6u4SyuLUV296dwPy6qCmuu1oEQWGysqCXYc7eaA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cm1OcFFVQi9oTFQ2cWVBd0V3eDhaT014bUwxNENIVk5udm56ZmlNSjRIaGlm?=
 =?utf-8?B?VFRtdkhiWmRaZ2paT1pFdFU1Rzk1NmN2ZFNidUdMdVVGTndLS09aSzgrS1Ar?=
 =?utf-8?B?aWRRd2plUkVoS1RmZ3VTN1gxcUgrY3NrdGdYSXk3MmpoYlRSMVVVNmtSeTJZ?=
 =?utf-8?B?am4wWWE2anhQK1BoL1BFT0hpVkFvdUdvY0hCMXJJUGRoMTBxYUhaam8yRVJo?=
 =?utf-8?B?MEMvTGgvM21GTnllYTJYVFI0NFFxQ3RCNXpCK2JEZUdGRktJSFloMEI0U2VJ?=
 =?utf-8?B?aW1PU2F0RURKVWVodlZWTi9wWU1uckkrSzlqQnpTTThSTytsZTFqOFpReWpR?=
 =?utf-8?B?ZW5NN21nWkdXZzgxSUExWGxzeE9zWThBM1ZmYzQrbHRDY21kSCtWRGVtUlU1?=
 =?utf-8?B?V2N5RnlHRW03RS9TS1lsL1pRYlRjZlFjQk5kM0NPVHBrdzYydWNoSDdRL1FT?=
 =?utf-8?B?VlBtSnVqUUdnRHJCUnppbFR4OUt1SGdOQUdOald1dmlCeS9oRXpEd2t0ZFFw?=
 =?utf-8?B?VDZvcUo1T20rb2FWWXRKNUdsVDFyT0lkSVBNbU9idVVadUxZQWZBcmo4alNN?=
 =?utf-8?B?N1c1QVU4UWVIcTd0elhRb1g3K1pYM2ljSnBFZms3cjJPOWFjcDRMakl1Skd5?=
 =?utf-8?B?VnZ2SjV0MzE5ZFBsSTJLS0hZZVgwSjRGWGlpYnBTTE5takJiVS9yczd2N3ox?=
 =?utf-8?B?dGZ1VWxvQmo3WXFYMkpzdXlMUGFFKzh3NVpDSG40MjVTWk1qZ1JMUXYrZHdn?=
 =?utf-8?B?eEt5TU9oN0tab1kyTUV0SE1uM053UDJXZFYyTFNrc0xTRHNCMkFPaXZGNGdN?=
 =?utf-8?B?OGhXanY0UnNPMUZjcmlsWWlSQjVPWXd5cFBXRmN6TmFVbng1MnprOGFpUThx?=
 =?utf-8?B?eFdVczBJMmozKy95TlQwdEVCNkhWY1VNcFlaWVRXQTV1WWhSblkrMG80YkFY?=
 =?utf-8?B?UGVKYndkU2xoL1EydGg0SGdud0l1cXdhaDhzVUFNYTB4YmNtTjhBZVJTK1p1?=
 =?utf-8?B?ZE9oNVRSVVRkcHJjZHJ2QnpZTisxRi9Cc1ZrZkk4cmRoZlRYeG0rZzRENFA2?=
 =?utf-8?B?eTk2RGtoQnFlTzN1bmdRaTg3bUpJQjdKOGF2Y2p4eG5DRDJENFY2Z0RXWmxC?=
 =?utf-8?B?VENwUFlUUGc0VGpEU3k1ZU96ZkxWdDgySnRVNzEvUENSaE1LZ0o1SkRzcFd4?=
 =?utf-8?B?azZEV3M0WGdzc3dQTXBVWWNFMmdJY1lzVlZ1NzBTT0M1MWlMZkNFY3h4T1pZ?=
 =?utf-8?B?c1RDbWtLUlI0WDQzTG9JdzVnQ1ZQY01sOW1xL29aSStOMytJcnd2VnBVb2Rq?=
 =?utf-8?B?MVJ4dndneEJRSXN6YVA2ai95aDEzV3ZzaHBsZTZzakhvaVlUcDJ0ZWlhS2lF?=
 =?utf-8?B?cmlUa1F5QmJNRDl5UG14Mm5VbW1BdjlYTldwSVdlQXE2SDdTYzYwbUFNblB6?=
 =?utf-8?B?dDZOTGpVM2s5bmNscS9ldVVGdnFYbkM2OEpUV1p6cWdRUlFFV2x3Q0d4UzNL?=
 =?utf-8?B?WEgzNURIQk55Y0JBV3JZOTV4RVhVUHFjQ0plS1h2T3pVVnp1SDBFRTBMUnIv?=
 =?utf-8?B?amZBNXBFYmZsbm14bDhmaWI3ajF3YzQwTGs2NDBKWkR0c0JsUGhVaWZ1anZt?=
 =?utf-8?B?ajhDMmgwaFNNR3lDc3djT3hPSXU4dmxJOTlJSlgrNUh1M2JRWlpQUkpIZVd5?=
 =?utf-8?B?aHBvaE1uOStseWFaNU1PQjFWVWpkQmQxejg5dldqbGYzUllzYU52a2ZGQW9i?=
 =?utf-8?B?ay9rSTRmVDlmUlJONXFtYUc0cjdkemh5WjVGMGRFU2pyeHZwZW1ET3N4SllP?=
 =?utf-8?B?cWZRdTRvaFQyUDIyOS9sWGNjb2JxT1lTUmFtcU80Z0U0WktFellER0MrZG9x?=
 =?utf-8?B?akxPbGtHeWErVmpsaElYeHVXTFE4ZWRZTmlFYlk3S2oyUVlKR1RGRUhUcHU3?=
 =?utf-8?B?cGRkUDBUZDVGVlNMaXRLNnp3dEZBLzhlQkJUSXlCcjNlQTVCdDd2RGMrUjhH?=
 =?utf-8?B?S1Q5WFpFNEV0MzhBaGx4eTE4U1lnK1VwMnM2OHVpSGhuUTN3VmdVNjZzQXFy?=
 =?utf-8?B?ZndFT0Z2MUFxajRFQTl1Y2haSmFBdGdoWml4ZGlDNUZ5M1BTWWh5NmpocTFq?=
 =?utf-8?B?M2JFUi9YL3VjdnlBYlVKR3FtaUJ6ZlpTNCtqek1pSmRqSEZ5WDFZbVhIL3pq?=
 =?utf-8?B?OGNaS084elNXcnNGSjVjTHloOVhBeG13Rm9kc0ZpSC9ETVFmR2NLL3FnUzk1?=
 =?utf-8?B?VlFEOXNsQ0tyUDRKZHpyOEMzVDVKQmpkYnl2K2IrbDBEWnJXeXpzMk1sd0FV?=
 =?utf-8?B?TUNFZkp6R0M3UXhmWGNJVHU4bEgzbFFEd0ZoSk1VSU1kTTl3S0lJeGsyK2ZL?=
 =?utf-8?Q?e2WZRrrCxj12wZImvk/uGIsbYCk5qsXjumK8L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcc2935-971f-4f51-f00d-08ded23094a6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:38:42.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: We5LYf4C0VM2+ExOj6BuAJoJdX3BZCaj32ju/4JmUig2688ME0MFphY10hYLKaodq3FiFkuRNFS77W+FBNsf6feoT0KTP37QahldqkwyMy9O3sGo8FACr0Z2InU/QsUH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65587-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6045D6C1394

From: Frank Li <Frank.Li@nxp.com>

Each media pad is associated with a firmware node endpoint. Capture the
parsed V4L2 fwnode endpoint information in struct media_pad so it can be
reused by consumers.

This avoids reparsing firmware node endpoint data every time the endpoint
configuration is needed, reduces duplicate code, and provides a common
place to store endpoint properties associated with a pad.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Assume 1 to 1 map between dt's endpoint to medie pad.
Change in v6
- new patch
---
 include/media/media-entity.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index d9b72cd87d524..4a3785cd9f370 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -20,6 +20,8 @@
 #include <linux/minmax.h>
 #include <linux/types.h>
 
+#include <media/v4l2-fwnode.h>
+
 /* Enums used internally at the media controller to represent graphs */
 
 /**
@@ -230,6 +232,7 @@ enum media_pad_signal_type {
  * @flags:	Pad flags, as defined in
  *		:ref:`include/uapi/linux/media.h <media_header>`
  *		(seek for ``MEDIA_PAD_FL_*``)
+ * @vep:	associated fwnode endpoint information
  * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
  *		access this field.
  */
@@ -240,7 +243,7 @@ struct media_pad {
 	u16 num_links;
 	enum media_pad_signal_type sig_type;
 	unsigned long flags;
-
+	struct v4l2_fwnode_endpoint vep;
 	/*
 	 * The fields below are private, and should only be accessed via
 	 * appropriate functions.

-- 
2.43.0


