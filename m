Return-Path: <linux-media+bounces-58774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANTVIz0K32n3NwAAu9opvQ
	(envelope-from <linux-media+bounces-58774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:47:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3740019F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C16E4304A099
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02C7347507;
	Wed, 15 Apr 2026 03:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FQnd8Na3"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC5336891;
	Wed, 15 Apr 2026 03:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224709; cv=fail; b=NWol7mBGXhq7ifDhHXNoJhDC3ooE3I5mFhen70fap5MI6FXT54Pie5tqWLRILCp+AaYw2oWlyGSEx5j8tzGFDG+JW12raxOsVthfBynC37URp8boF0eEomTzKkZXLSB8mDKVTlw1tkByJy2rViQ/0oGXr2ui+8APDTdiSgREws0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224709; c=relaxed/simple;
	bh=uLdqPOW/4ItMF9qywrhWYkq5mRsUEOXnu2uop7ViLUk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KNN5dWdlUSARlxMkPjCCVJh9ltAXkkpmaCRHrF4uOnYFYJstYOdzOcYhrxE2TqLS+3kNB8TYh4vgOdf+mo7coFsEJuhutBeocA0GHkVGOIDQMftNEZdbGZyuDmfGIR8J6rXUb5ySRsfX8qKfqd8lnD7CHI6BPzaKJmonSbQyfrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FQnd8Na3; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/Zcw83Dv7/FD//QreJa0m/BSNLZCFuw828TLjloN/BmsEAw9pdyfmVKM/YswrPsy+eHSrDodYdIHbfBK1hsNJ1+wpXt2yVPugbHyA6xugamJL5UYyTP5PaS8Q48bW7Zdqr5S+0w8Z/KJ8Nw7lFmbNMHjhct0YhQ1BeuchSZwTKpYAt3NzugohwhQb1nYX7T8tenHlFB52Dn8HzpRDdRFHzdWqS6W+G70sFN6pDIpjkjRpRsTp8zBhkgw0BcbhJjli40WRBoeU8/RslLTLFlR2/52l1qduXRXr3naEl7ehxXsB+5YzY2tuj8XB6a4nSesY7d7J7yc/29i6Tl7m1C1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqvBYU2I6edyXeuMpX5eEsGXonR1V817poLCE4F9KCg=;
 b=BmH9uQxskfFLd2e+5UAXLkH7OTqELgEkGgvo5+WfVR/v7417/0B9wBp6yI4/dhxC80BlWUXbbcZGFDJTx5X+wYYEs4+JXVKSpSEDiIrh136Xv7ENJZ99K23H2QeKR1cH1BQg65XGe2xBue/7d+iejcXaLHtsjLKgZjuDd1KOs3+PVM9dNfbMFNXMqkfht9fLS5TD3QfbbfkRwJoCo4E0tB3uRz8S2okIgF7aBwH1QSs9aPrfdQIRBjf+o1RQpOQcZzrWpcd4oeDe4Ozpa7k6bjPKwnWefYPlk9l5kEWi8MwUjNmhFEANPypj34RnoKVUHlWtWwWvpGdXkENqWLyrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqvBYU2I6edyXeuMpX5eEsGXonR1V817poLCE4F9KCg=;
 b=FQnd8Na3Pmszplz2lL+xoJYrrhnAoJLVr525ggeFKpBsNDSz3FYtyym0feMB2mREnTcrXuLLcZJY3JvOsHeBV+bpjdvwbJN5P31zaEzuHsKd/aeG1g+xYMK1ur+xosVC5tRFgW+vbJbfHj4pQD1+/UGz6ddUsFdIYNHKrSanrZ0M651qh1EJJf/gybMWadQlMe0xYij4ihvHXfHXtiEQB30DPDYtO4jLCaHUsWFWWbC4loXP5sTLjIt4mZPj/SOEX3bn1o0oGWXd6JbqkDtPVuR6Bt3Y97OWrRgAZ0ZOe5P20AQQjleLLl2EoUGCDfeziCxM9r3UP+avNL6J2+wZ5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:44:49 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:44:49 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 15 Apr 2026 11:46:53 +0800
Subject: [PATCH 2/5] media: synopsys: Add support for multiple streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-csi2_imx95-v1-2-7d63f3508719@oss.nxp.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
In-Reply-To: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=2679;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=uLdqPOW/4ItMF9qywrhWYkq5mRsUEOXnu2uop7ViLUk=;
 b=fyo0M33BZpmeNwu63jrM4XKnCmyS+1P94807zuVA9fN/VJnM+kaZ/n2ivkibCKLI762LPZHKs
 nYD6Wwac1AgCoFEuf/IuO+BbZt8txYSwxyFOLlyWFyY8PskZxa3sQDk
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b47a30-0eb3-4187-54ee-08de9aa1586b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 hXjaEr6hMZe22Z9L7GWz9wEP9nGCwLseD+TsgE+ZkoBNBcHL0iOCpZBzIZ1YPYSi7Oavc6LogA7+GFrFZjr6wbVaaM3rbDpjGrutxkmhZJFhq++gFRgMJsOoQHgdIafBv7ApOzOOMnJutngzAqkJeuyA/WItcWWk3JxkxwTyeW+rVAooNqdQ3rtrUhqJzorTClZZdfq5QHfvYRUzxu/NaQ7Wjd8wGNdVxLB7GMAF7dw1gV7zXd62/frOyL4S44jPnIVLJQ5Ra7q7X3ztJBt8hcazaGpPMLLBqjwKeSiFwituZkKl17Uq9xyxUxKyom9JUFWkmpWZElAokUPgtwFGsyC8829NrUZ7qPI3nWJ3mDpbX8EXb8Hu75hU3tIxa62lvW5El1aonACd/irPOf26LUqWPSmm2UdyYUdcjGOJfQqdR7cGAhf3pOF+D2moAI08jwtUkfPPS7KyDs80amasrM3aXcVj8uKSCMsfkTcgO655A5CDosyNv8DjEIu9uTcsMUXBxbEEMhY7j7HJ93Obd5UfvykUuo9e/cCHIjyRntbhXykoQGyFAepCuQ2xCyKcQWHGZyho5CvnwIjhLsVuBlNqBtQ7owxNOfuRrX9vKIZ5rIaFZ4VJ2nPwtapC4samGp54slFScYuFIFCEB+dn/Lc3oc/3b1KpkQUmL6k9SFbJFPcp0wAlFi8+wCdq1G/NNRUPLsxyIZ3hraIgvXFYWcus0ifWDlJi/LHcCzwrG3H3skcpEXaZ5cu1JMgTBQb0rPxH0bRhoaK6xdAuAUM63T4VshPQuQDN3w/Np+7KEIY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TVd5aGVPV2NFR0o4dEpjV2txcWxyNnZiaFJOZWtlenlwY3ByRHBJbjJOT0Vu?=
 =?utf-8?B?cGhtd2xtMjFqVEdlTkZMWHVBQjNGbWFwb0hieW5kZ2pseG5pbFAwY2IrbHNV?=
 =?utf-8?B?VGdiZ003aG9SNEo1MFV1cjl2M0VpeFNpSzVPZlBTMlUxM1B2UEVISzRaNEU3?=
 =?utf-8?B?VkxVdnByYzJkTWlZd1o4UENORUVFYkRJU3cwOFJJMlM3OGNnVW9VV3RVVnpj?=
 =?utf-8?B?ZjNmdSt5a2tKTjFZeUdXVVdhOEJVVFc0MWx4VjBRQmE1MWRPNVBoWHhOaWh2?=
 =?utf-8?B?aDNzMkxxSnEra2ZRUTdzUnZ4RlN4cTdzUHJ0R3UwWlB6WCtDanBrakQvdnZu?=
 =?utf-8?B?UFNiU25aSERORnNHVzI2VW9VSkVJRWRkYzBjL2MyS0dVWVg4cHVLOE1KRHJM?=
 =?utf-8?B?V1pmc0lldlE0ZGdSZ3dHOG9qemJRd05aTnpidE95b2ZGNEFxVjVhcml6Smw4?=
 =?utf-8?B?SUg3NFYwWFk2MmtyempRQzluOFdGcUZHUkVFSjJDVzBrclgyY29RUWFFUUhu?=
 =?utf-8?B?b2dpSkV3TStpRjc0NWZWeS85TVh2d0pPeUJSNlUremhDcmZ3di81SDVsdEtW?=
 =?utf-8?B?R09wREVEUW0xNzA1dnhpZHRaSWh0dkxWUllWWFdZVHdyRkE5WTF5dGlBQTRj?=
 =?utf-8?B?SmNPV3IxWXBKUnNNb3hSSDRzYzRLd2tUamVvU2t6bEVNS0M1Mnpyb1Q1RmVF?=
 =?utf-8?B?MnN5WW5JY21kbTVESklDNjE3cGRzeEFoNittdDZLNVR6TmltT0NTZXFuOHhS?=
 =?utf-8?B?YWxoc2ZCUFByYTdEeW9oZDJHY1VNc0VmejFwdHlPRVVNUGdFR00rM000TkFj?=
 =?utf-8?B?dEI1Tm92WENuT1JzRGdhdnNsTCtzWDFSWEg3b3p5T1pDcVU5RjhSbEhEYmRw?=
 =?utf-8?B?WDVRNHpvZGJ5RitkM200T1NFNXRjZzlDcHgwRGxyMUJXWUxYTU1XU3VHRFRH?=
 =?utf-8?B?Z2xYR1Z0QU0yUFZTNjNWM2xoQURGdFA1NjJhTTZxSVM2SEc1YU8rNm1uRlgr?=
 =?utf-8?B?K0hJY2pGY0haUHpUMStUZ1VTNVFwUk8xMmtHTzRqL0hEdzM3MlVDdFA1UGZu?=
 =?utf-8?B?cXNsVGVtWkV2QUNObjRLV2hvbmFHelo1NWVURmh2ZjViVmFEZjI0Sm5JTFNC?=
 =?utf-8?B?a3crK0hSYVhvRHBQRjluZzd6dSthTnJnK0NJVE54SndQdU9pTGt5cHQzL0E4?=
 =?utf-8?B?RStWUkxyQWVlNUw2U0lUdm1vWnVtVkpnWU9QM2cyZ05oRi82ZGNuSzB2bTlL?=
 =?utf-8?B?ZzhQYkpFc0ZQUzQrd2IvWmtCVkE2OUV3bzJCVzM0Z2w1bGpTNkx0WWZoTERV?=
 =?utf-8?B?YWdwbHNLd05TN05wZnNxdkM2aUVmb1ZrUzJHeVlvTjZaM20yV2pLUXlPMno4?=
 =?utf-8?B?cUYzbURTSStWZkNiVlRsaCs3amgrN2FFZUlHQ1RLK3d6cWtKVVpUd0ZwTFpD?=
 =?utf-8?B?ZE5rcGkwT3kxRHN3YW1vS1FNR0xlRmlSQmNqVmpOT3lKa2xBL0QyRS8rNHZ5?=
 =?utf-8?B?RndVM2tLMGp6T3ROYkJSSXg0dnpDSmlPRUsyTmNsa1dKaG1LSE4rSkoxbTkz?=
 =?utf-8?B?U3E0SXExSmZReWNVaE0wMmUrS21Xbi9pLzZPbnVkdjNLeHV0R3RzVWRrbkMv?=
 =?utf-8?B?VGh4WDVPVnBhcGIzbzBNTkp1cFdVUnhuMkFzTStwK3k4TDMreWN3OTZYU3VK?=
 =?utf-8?B?MkZGdGhGSkxCVGVRQ0lpZE1nRzRDL3NCOFZjS1VOT0o4M1VEcEtRVUpveE4v?=
 =?utf-8?B?MzBId01QZDJzY2xKRzh5WHJ0UzFhMDdWQzRDcW82a1NwMncxWTd3dEJBRGd4?=
 =?utf-8?B?Z0pWd2RYSVhBQkI4blpkc0FhcDJ3TDAxTmNqVzJ1c0JaaWVsL05IZUQrdHFy?=
 =?utf-8?B?TU5RbE05a2F6SVcrNmpQRjBMb1JQYUhPU1dqYzB3MVRvb1E0SGNjcVUrMTBL?=
 =?utf-8?B?c0lIdmpyYUZLRUVCb1hxbGZjV2Rqb3drV2lvQW1SdU9NWGdCTU9Jd1RsVGFG?=
 =?utf-8?B?T2lWOHlVdTluZFBidVhUTW5ncW14WFFaN1JjS1luaHlDazJHQ1JKTUJuaUZs?=
 =?utf-8?B?UXR2dk9pTHhFSGN2QS9ETEZlVnhOdVdNckZudjY3eFhBZys4Mld5bXVIY09w?=
 =?utf-8?B?clVsb1lXNHZkTm1BWTUzeXpqd0xxM00welBYNHNKUXM3U3YySG94MXRwREJQ?=
 =?utf-8?B?L20yd3VwY0pRQVZJWjhZZWlFMk5JWmJUU01ieDBzOTg4aFNVaS9lNmdYZE1O?=
 =?utf-8?B?OWpmdHpXL1k1b0VjLzlra1F6RnZLVjZZMU42emNPaTkvd1VMTVhkYnFPRkJ3?=
 =?utf-8?B?VmVTb3FYM0tCaTVEUW5nd21LTmF4NkROTEVXeFAyc2hMNk41UmNlQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b47a30-0eb3-4187-54ee-08de9aa1586b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:44:49.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLPWjDlcVqXDxfRjGaebsgdkaxlqMh/yU3ZUbC7DhUYYtzFI2pG+lYi1ibP0krZfQd6EknTWltViTC5nQpA3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58774-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: A9B3740019F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current driver only supports single stream operation. Add support
for multiple concurrent streams by tracking enabled streams with a
bitmask and only initializing the hardware once for the first stream.

This enables use cases such as surround view systems where multiple
camera streams need to be processed simultaneously through the same
CSI-2 receiver interface.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 45 ++++++++++++++----------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 46e2a4315ac2..85a2a95bf080 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -113,6 +113,7 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+	u64 enabled_streams;
 
 	const struct dw_mipi_csi2rx_drvdata *drvdata;
 };
@@ -528,28 +529,31 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 					       DW_MIPI_CSI2RX_PAD_SRC,
 					       &streams_mask);
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		goto err;
+	if (!csi2->enabled_streams) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
 
-	ret = dw_mipi_csi2rx_start(csi2);
-	if (ret) {
-		dev_err(dev, "failed to enable CSI hardware\n");
-		goto err_pm_runtime_put;
+		ret = dw_mipi_csi2rx_start(csi2);
+		if (ret) {
+			pm_runtime_put(dev);
+			dev_err(dev, "failed to enable CSI hardware\n");
+			return ret;
+		}
 	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
-	if (ret)
-		goto err_csi_stop;
+	if (ret) {
+		if (!csi2->enabled_streams) {
+			dw_mipi_csi2rx_stop(csi2);
+			pm_runtime_put(dev);
+		}
+		return ret;
+	}
 
-	return 0;
+	csi2->enabled_streams |= streams_mask;
 
-err_csi_stop:
-	dw_mipi_csi2rx_stop(csi2);
-err_pm_runtime_put:
-	pm_runtime_put(dev);
-err:
-	return ret;
+	return 0;
 }
 
 static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
@@ -572,10 +576,15 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
 
-	dw_mipi_csi2rx_stop(csi2);
+	csi2->enabled_streams &= ~streams_mask;
 
-	pm_runtime_put(dev);
+	if (!csi2->enabled_streams) {
+		dw_mipi_csi2rx_stop(csi2);
+		pm_runtime_put(dev);
+	}
 
 	return ret;
 }

-- 
2.34.1


