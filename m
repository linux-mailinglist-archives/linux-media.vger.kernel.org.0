Return-Path: <linux-media+bounces-52635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCAvFYyTjWl54QAAu9opvQ
	(envelope-from <linux-media+bounces-52635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:47:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA712B848
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED0E317B93D
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3202DAFBD;
	Thu, 12 Feb 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mHe4g0pS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mHe4g0pS"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90D2D94A3;
	Thu, 12 Feb 2026 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885922; cv=fail; b=jSCOLqrQjARJSQIPW4nNOQOsbi302MjXMRk2tA+RDDdr/iuZBGIYR4DI2YgA66sCE2y+hPOy8oPmgNddiYR98KsmbWmOyXYBtUH81uow61j0VB5kiDxUwY3Lg9cgm9986S3Nl8+52ysqc16WbsDoRZefifX2HJOEw8BAvx7ej9c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885922; c=relaxed/simple;
	bh=la7kHZ7rz/uqydCZJO/0h+0sR3eYwCusNlYLVi/d0N0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kfOavfAqSlG+gCHEogWCYUdArOQrTG8jB/XeJeirYEsPbgvHlN2+sw2B/TD1HC2o7fqwpy1NKBs8Aljngmc3oH93ZRgeTzUByObXytnqftc/+bfzKO1vVmTh80gxGUfdYFTzaFXvwrA/qfMOVFl9eEZIMGBUVkN1wsDPd2vFsOA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mHe4g0pS; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mHe4g0pS; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lHoA2h3umqp/L//FlbbdPazOV17m4TvlAPv6v8sntxg2DBBTIxdFc013lTvooxan1Rge9mhv1HExjS3o6v47d4qtNVX14yjF5m2k2UWbDKzBBO/ExGKD8Kpp+o0JQtzgvmOly6YC1HPmpQyaqVy16gEYs3dGWO1Pbt3i63AWeLuG3DVVn+yQU3+G44naxvELrqLZZ+ctDc0QwSu+QUHb7TJnP38Jso1iqDA9XYX6uXm7WcAjbGZlUd0wDb6ndX5/Gkyb0VPa2qi0Ej59uYg12xgTJdykDLzCieJXPMcJuL42EQE0LcmVqUlymJuGzfLtYSBO/A3Y4VH9qo5j7RZt1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAJaE1mKDufJ/QuXQUCXdZsT9hnBFPYqKefxAMBEM4I=;
 b=zTxaCtvFCoz2O6bVYYNDW+9qTrQZpru5OZOj1E6CVdDN0vw1gAwYkrgiEO/t+cmb+BbXljXv0eQCWSWJBplnweR0y75MYzZ4ZFyDJcR0pROP+uEp8Ara1v+G8YpcPWXzHnIdZQwuHlofzZiOP5k80s3POUu8FZOv/IdwM8EK7eSxSIUI0Tdhdnk7fcvdMAn/4eMfklBwSOVYZgxf4Vsmd6R39+ZICbScVeRzwzqVEakxXzNpWl+OjqDTqXxw4d40lMIjozSsHav+s/2rqHf6MzySxjgohqG0nHo8ro57q2FUY7SpBu7U7ZIiXeOvPG1QiM6WrmBqXz7VEl1CnghwEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAJaE1mKDufJ/QuXQUCXdZsT9hnBFPYqKefxAMBEM4I=;
 b=mHe4g0pSeFSL1mY0FM6J6/cwL2Ui7FBmealLLZi+sf1RFsGKn/SNV9demuT0JmLBcQldrjbD+ab3uPunmzkqzpI1n7MGBvYqRo/S/XHpfKDtl2IJMI4a2LtmOHRlKURozxkPfRJmO6O6pUDZCF8KiZRgrn+Z3xccw1UCrfSfrzs=
Received: from AS4P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::13)
 by AM7PR08MB5445.eurprd08.prod.outlook.com (2603:10a6:20b:10d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:45:05 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::16) by AS4P192CA0028.outlook.office365.com
 (2603:10a6:20b:5e1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 08:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Thu, 12 Feb 2026 08:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsG/kSEoNxHW6ipUge5mBTQQpYWFOR97o8E/pQU5PuV1cRDy0AdZX5Sbtt51pvCf8tG9VhNj9gJeuEe0SsthBPkF7HMhFr18rmcEzvq/oqz2IzPkXO1ScoxL4IcyyVaR5oBBD5JIpUPeF89VRk30TRPeW5DKNHV24rnPp/DrY9gbzVSinLFVQQ4fB7NBlU4hZPY5RYBkqLmyL2Xhu4rHfSaD5PKnqn6jwLrPNdMmxVS3+OUHQNyqcx/wpxadPbb5MY2u3BPn23LiK0YBQPaoxfl1NawITA5pfZkNZ8W0RtZfUsDETdR43inby8zwhBYZBACPotK1Ovi18T9NNL43Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAJaE1mKDufJ/QuXQUCXdZsT9hnBFPYqKefxAMBEM4I=;
 b=sgs7OYkT5r4NWSwWuTbGNCfxB+mHlUZQ0vGYU0+2qCNauFY7okQWDVZtjhi/HT99/VMC0eiU7GZ0TWre3ArDFp/2pYK/kyIZHT8d5oK2q8oSJTf6qKXnVqP0clHlXTdj88k3ZQlo6+4Rq1TIG8ocNqxIXypDJcB/zmhqQEDXZIJjN4WNOalJg9knq8pNHYsYxgvcwzJ8apVi/7TI+MtTXjXZFRpng3h8CvrCFau9JvDui4ZyUL3JP0JIgAfQr3sHAZ3iIzbUHrvKYBcRQdJLvW4nBVoHuZ2nluoX0wgHwUJE+V9mXFHlCeZneP0xBonymLGp6HphBAlhcfZ+EfMxNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAJaE1mKDufJ/QuXQUCXdZsT9hnBFPYqKefxAMBEM4I=;
 b=mHe4g0pSeFSL1mY0FM6J6/cwL2Ui7FBmealLLZi+sf1RFsGKn/SNV9demuT0JmLBcQldrjbD+ab3uPunmzkqzpI1n7MGBvYqRo/S/XHpfKDtl2IJMI4a2LtmOHRlKURozxkPfRJmO6O6pUDZCF8KiZRgrn+Z3xccw1UCrfSfrzs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11797.eurprd08.prod.outlook.com (2603:10a6:800:313::6)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:44:01 +0000
Received: from VI0PR08MB11797.eurprd08.prod.outlook.com
 ([fe80::c4d3:baed:b106:2ba4]) by VI0PR08MB11797.eurprd08.prod.outlook.com
 ([fe80::c4d3:baed:b106:2ba4%6]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 08:44:00 +0000
Message-ID: <695a5c42-335f-49d0-9af7-7de10bf13270@arm.com>
Date: Thu, 12 Feb 2026 08:43:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>,
 Michael Riesch <michael.riesch@collabora.com>, julien.vuillaumier@nxp.com,
 alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
 frank.li@nxp.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 niklas soderlund <niklas.soderlund@ragnatech.se>
References: <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com> <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed> <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed> <a4c62fb8-51f5-47eb-a1aa-ec0e4f6a9707@arm.com>
 <20260210002053.GJ2405149@killaraus.ideasonboard.com>
 <2b64aa6c-b3d3-4b96-b603-1ceb3497dce2@arm.com>
 <20260210160245.GN2405149@killaraus.ideasonboard.com>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <20260210160245.GN2405149@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0312.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::11) To VI0PR08MB11797.eurprd08.prod.outlook.com
 (2603:10a6:800:313::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11797:EE_|PAVPR08MB9356:EE_|AMS1EPF00000046:EE_|AM7PR08MB5445:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4b0a8e-0489-48c2-a266-08de6a1304e7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VURNT0IvTWZjSzA0WGtGTDFJY2pldGpuTDF0TGlrV2NxQUp3VWZjU0VPWGRr?=
 =?utf-8?B?NHowaGIvMWFnYXFxYjFIRS9NUnJCUStRSnNCOTJNdWtjNEtOUmsvUWI5cU5V?=
 =?utf-8?B?eXJPOFN5SjN3WWdRNTVQZmRVc0o0aHBTWGE5RlVtYUFlT2xPOGVJZGVZNUtX?=
 =?utf-8?B?TlBwbG5wL3FKZlFzSE41R2pzbzNBREJyeW95UnJKUm5IOGc4SFpNVCtiT1R5?=
 =?utf-8?B?Q2FyUW15Yy9ONGd6eHJxbFVUVzArTUgrRy9Hd1YzTHFXajVVc245aTlaa0xs?=
 =?utf-8?B?bDZNamxRSXFDMi9TWjRFenp6alhtSTVDTVpyYllSb2NCNVJwNFVmV0JPNlBD?=
 =?utf-8?B?TVRRcnR0TXlmUzAyN2hIRFcxcWJwOWxqVCtBaFFaYXYxOHg4YVhOSGk4aUxs?=
 =?utf-8?B?UEZwdkpGeVgyeWxtbXZvMklRYlpDdTQ1anRFMGdXWC9mZ2F1MTVaSXM1L0Nl?=
 =?utf-8?B?ek55YXRRc2VNS2VaalJ2MG1SRG1rZ1VsSmhFVzBaSFlHZTgrNTdwanpldDdI?=
 =?utf-8?B?Ym44K2J6SEEwVHdLOThSNnBsQ0krakhqTlljZmU1QkhPdG5kY3NST2VLd05T?=
 =?utf-8?B?emFOVXNjYS8xc3dxMTByWXpKbENrTHVlei94VzJNYWRWelYzVnZjNlJ6Zy9M?=
 =?utf-8?B?UGR4M0J2SFlvWW5qYThHV3R0RTJBdlBubTM0OWhndTFKUDVhTURnN0EwQXdZ?=
 =?utf-8?B?SGVHQXg4ZldydkRLeVg0aUxZL1FMNmdrb0VZd1dyVHBycmx4QkE0VUdIU29t?=
 =?utf-8?B?ZFZ5MXBpWnh6RlcwUjh6d2RQdFpOOUJUNFRTSzQxMmxRYVhLZzE1R1Y4eDdn?=
 =?utf-8?B?Mlh1cjI1L2ppNzhVUEU1Z2VwVWFldjdpQ3RPVi83R2ZmdjdYLytxZGJXVjc1?=
 =?utf-8?B?T0tKUDVnb0tXQ3U3Qm5TYnlVb1B4ZS95ZUJ6K0x6Rkx3R0dvR1FWMGFsalBQ?=
 =?utf-8?B?dEtVTHA2U1lBNFBvY083aEdwTjlQNGd3WTZndVN2dkJ4TERDM25xbXY4Ykt3?=
 =?utf-8?B?ek1LV0tteDQ4RjJZTHhuaGVUdXpIdXA2cURTemFQd1hsVDlRYnZ3V0k3NjVK?=
 =?utf-8?B?NGJRam5OYmNrcFNVZERuNndxSms5em5KR28rK1FIbGhPZ295UDlYaTc4MWlN?=
 =?utf-8?B?VUNUVEwzQVN2WVVSaVBZN2lGdXdJemhsQnl4WmpPYkUvYytITkhuUmdadGZS?=
 =?utf-8?B?aWRwQ3dGNGtqYk4wQVJ4UnM4dVFrYXRJWktBMzZEVWdNUjFxaFRBOG94NFNI?=
 =?utf-8?B?VTlxa0Z6VGtBbXZraXdTQ2g5L00vUGVkOVZJbXlPWStXZUZ0ajdjeE95NUVO?=
 =?utf-8?B?RU1OT3lub3NJYTFEVEpUaE5sY2tZVmdkNnhCQWpYcHJUK1p4SXlScWlCTng2?=
 =?utf-8?B?UnVTZ2Z1OVp6ZEF6ZUxiMDR5a3FJbUhlL0lzU1lESlhOTmxlcnNCWVNuMlpI?=
 =?utf-8?B?RDl2SDFIRlpxVzExUUE4TEZQL1llMk5JRjgvY29TV2NoNG5Hc3V4TDExNTNK?=
 =?utf-8?B?cko1dzhUbG9JNzBIbVBsRXlORDRuT3FyV2JjMURTVWhjQTIxTUdwUGdWU3Yv?=
 =?utf-8?B?NnJDMTJlRXR4ZWI3a1ZlclNQaWhGZ2xRS3o0dURGa21rSG9zbXo5b1NocTYw?=
 =?utf-8?B?Ukl1REpJK1dXRjg2aXZIS09yUlFka2NDaXE2L1JDMWowMG5PWEs5aWpSU0pZ?=
 =?utf-8?B?ZVJsNnpDN3JuNnJpWVNrK0tpYzBmTHZrMGc5UjNySVZIUVZLdnRYcVFQcDV3?=
 =?utf-8?B?Wm1jS2gyc2x6QllGUm94TFRlY2hsVGZidVEySWIwc3Y5YnNrVjdQSGdaZDgy?=
 =?utf-8?B?NXpJSnRYY0RqY3VHdmhsVUNEQUNxMGtPRUxra3pmKzlUekRPUG1keTVnNmdO?=
 =?utf-8?B?Z1dsa0wyejZpU0Y3b0ljYm1uYXNuQ0oxTUlTY1BPbG1oazRwaEdVcEI0UEVh?=
 =?utf-8?B?a1BndDYyRVFNR1NVZEs2VDJJYlBnamM2S0tuQ24xc1JKb2ZyY05ReWw1V3pj?=
 =?utf-8?B?ZXZDSTNaMmpBRldEL01YamhqRnFkQWZ6ZXIwWVA4T201b0I5S0JiNGlGU1ZU?=
 =?utf-8?Q?r8e5Yf?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11797.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d5e3833-3a77-4a8f-9eeb-08de6a12de68
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|35042699022|376014|82310400026|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWp3Q2lIaEFWUjNUVGdSSWw3MUtidXFSOGNLRjlwNVArcGt3RXVSMEhkbk93?=
 =?utf-8?B?MHlaUUpBbTlqSmtpMzN3TmJJWis2K2J2MWFJVERXL1hlbXBXaFZIMVJKYlRi?=
 =?utf-8?B?djN0YTN6eWlqVmRLSzR4R092MmgzRHp3d2k0QTdhOG1WcEE2ZzN2ZzlibDAv?=
 =?utf-8?B?UjE4eGs1eThQZUJkVFAvY2xYbW9semsvOEdxYTBDbVgvcUFrWHBkc2tqVHg0?=
 =?utf-8?B?dU9DM2JPb0RKS3lFeitkNGQ1emVvd0FTTytGVmZKN2pOa084Mzhra0Q1dDFW?=
 =?utf-8?B?TUJhZ1NmV2htekNOUUxhYzIyNlpkUEV2SHIwelFvL0NvZklwR3l2K2IxSUFY?=
 =?utf-8?B?TGpNcW1lTmpoMVoyOGlWQUdEajZsWXptakJhTTdqSkkyeUo3L2ZVdW5yZXZR?=
 =?utf-8?B?S2hlNFpCMHo2NFRybFlVamJKM2tJYUZOQlpkejFibGtlbXlzTG9DUFozZjVS?=
 =?utf-8?B?alpDNmp6OFpYMXpUTmFVWXdWSWF3NUhVbXROOUJHNDhJSy9Tc0NURzFVOE0v?=
 =?utf-8?B?WjNVZkV6czJqRWZUd2paQTF4V2lRTnc1ZysyRDRIUGd1VlBpaTUvTmxNbUxh?=
 =?utf-8?B?bnprTElmbkpGS0FmVnB5b2hXR0t5eW5tN0VvbURiQWlaOUNwRmt2N3FWM09Z?=
 =?utf-8?B?d2FBWjFHSkdzTDAwNktYNkpYaTJldDRUYUo2L2g2VDd0Vi9Yam1KODBaS2N0?=
 =?utf-8?B?MFFXVXh1WGUreFFFTTRGUzZhVGI2ZXlLVWY3UFVuRk9TTEloZVVudDJUSG9x?=
 =?utf-8?B?OUFnN1l6cTNWTWZ3KzJ2OVFNcjdYVmlRUVZTbVNOQm84Yi9SZDMwWlpUcXBC?=
 =?utf-8?B?Y1pZSi9HV3djZGh5MzQvbmU1Zzl0R2dQNVRUYlE3eW9KNklqWWhRdXFRMU9S?=
 =?utf-8?B?bHd2ZGZrZXYzTEY4enEvT2ErbmhDdlF1bjRsaitmeHpkM2M5MlJwUWxHbVFx?=
 =?utf-8?B?a3ZoZjY0RFBUMXlOaWI5WmhhK0h6VXBaNnB2UHMzUjByaXlLTTBXd3pZOFQ5?=
 =?utf-8?B?TWM3TVA3d3g3eHB2bTlpN2p6d0VPTU44VUZ5NlNPR3JGK1J2djZDQndlZDhl?=
 =?utf-8?B?ZEE1azNsY2ZvUEprSGszV24vTFo5NHlVc3U1RjVMblZpUi96emo5QmhlRjhD?=
 =?utf-8?B?TEprZ2djcHZaUGxRM0VpZ2oyTklhSFFublBBOHRoS0JPc2UyUHNKMDMrRmVB?=
 =?utf-8?B?QjVaRmZHak13UGV4VFdqSVBxenh0QXpsWHdxRGNtcExibldNZzIraFBtMm56?=
 =?utf-8?B?NTlIVHJTcTgxbjNDYUtlRXFtb2Z6TVhvZUJoZXBaTmhSbTBpWUE0bGl4WXRR?=
 =?utf-8?B?cm4wakZnUVV2Mzd0RmZHZjBtSDhqZG5NbENhMzA0WVpHVmpFTlhjTk5lU0lz?=
 =?utf-8?B?WjdPdkV5NzJkejBCUmNYbCtoUHByenE0QkdtMHVkMVp2TDRYWlQyRDhBRWRv?=
 =?utf-8?B?bSswMXlpMkNBL2pVVU80UVBVUjJWaDhoUmgyNkhuK0tleGJtUTU0SUZVWE9Y?=
 =?utf-8?B?YUdObHRzeHNGcVZUMmVpa0s5a0MzZlRia2ZUK2gyQXh2VmRyWDdnU3g1Rmwv?=
 =?utf-8?B?YUhVN2RwSThaMWRIVnJjWXB2WldteWVTWlFUQjk1cEIzWDZFNlQzTVd2c1ZM?=
 =?utf-8?B?SXNIaW9lbnF4dU9hUkhZcDRuckl2UGk3YnFSSTFGaXBiMTkrRGtFY1JZd25C?=
 =?utf-8?B?d3dxS2VIRWVocmgwcXZuOUpkYTJLTWhBVjh3VlBEa1BYNlNoOFo4eDA0N3I2?=
 =?utf-8?B?YnNkMjlmOTZwTHlUSXdmZnNhbWN4ekFWaVdmY3ZtSVRJWjhrckRiK1dZVUxj?=
 =?utf-8?B?czdUT0NpTVRLU3Q0eEdBMnhCTjBzREh0dUZyQ1VjM0lCRTJDUTV2ay9qMFdp?=
 =?utf-8?B?Zkt6ano5dDNTWjNtVmxRYnhRWjB5YWVWTWtwQXFsNVlNWXpFbVE1bDc1MXZM?=
 =?utf-8?B?V295QVkxSCtwZWJqNnFPc3dOV3pvSXZWNk1YUTJjcEFDRGlRbDIyQlowTXpi?=
 =?utf-8?B?c2tMRzRMVWtOem1hWVVLUnplbXVNQkM5Z1NRd0pLT05LbkVxY0xTVjVLcWNF?=
 =?utf-8?B?ekttK2ozVGEwYUkwSWs4M1ZRcHd6eHc0dlNlNzkxRjRXK0ZOUE5YTEJ6MnF4?=
 =?utf-8?B?OXpsTVJmOFBybEQvOGdkblU1ZFVxRnBuMExERGJ2NjUrNUhra1dJOXpZVERO?=
 =?utf-8?Q?CZ6+fKCwSPCxeKK6lzlx7BA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YTD6kY1vO+A+DGVuhoApIdJrF9M8gJ4CJWTBKkibzjfJtYS6yfMWZNCcIhu87ff+xaaYnwHUbyIttyY/5tRQRmTX9xznRe/24Ba1JzUQbOM5qMOMPMijPfI4LmaocpJH8TfKQd20xiNSEZNOZHZEYqgpo/R4U4Qv31qAHJIAbVOSvY/wuu0Aym5eIiFPwIDZ1Ez5cNlQ0dx14vqI5GtCGWi9cyJ10fcLwyOjJhwdQq+f88yyU385yAksvPEn58PyCvFlf8KOvqqslnODEHOOK95KkOwAX/EOeef/5Vz1atqMAu7k6U9RCndVnsKUMcDLySmhYIvlwLHikt4KMb2/f/LzRuGDXmt7Qkxa3P1dQ9sV28w2+l46ptbEo1gnlQEdAbsyFihpmNgG44Gyg7lqSad2UHeY8Xe2raE2jdImxZjqffmvBdNSqSlKIgbEhAZg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:45:05.1373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4b0a8e-0489-48c2-a266-08de6a1304e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5445
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52635-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,libcamera.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,collabora.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.mcgivern@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A4CA712B848
X-Rspamd-Action: no action

Hi Laurent,


On 10/02/2026 16:02, Laurent Pinchart wrote:
> On Tue, Feb 10, 2026 at 12:20:42PM +0000, Anthony McGivern wrote:
>> On 10/02/2026 00:20, Laurent Pinchart wrote:
>>> On Mon, Feb 09, 2026 at 01:19:43PM +0000, Anthony McGivern wrote:
>>>> On 05/02/2026 09:40, Jacopo Mondi wrote:
>>>>> On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
>>>>>> Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
>>>>>>> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
>>>>>>>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
>>>>>>>>> On 1/28/26 09:17, Antoine Bouyer wrote:
>>>>>>>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:
>>>>>>>>>>> On 1/23/26 09:09, Antoine Bouyer wrote:
>>> [snip]
>>>
>>>>>>>>>>>    - How many media devices are registered and which driver registers it
>>>>>>>>>>>      or them?
>>>>>>>>>> That will be part of the evaluation. My initial assumption is that
>>>>>>>>>> neoisp would be the appropriate component to register the media device
>>>>>>>>>> in this mode, since ISI is not involved, and ISI currently performs the
>>>>>>>>>> registration in the M2M configuration.
>>>>>>>> Isn't the ISP registering its own media graph ?
>>>>>> Yes, 8 copies of ISP media graph, that can be used with the 8 output video
>>>>>> devices of the ISI media graph.
>>>>> I suggest you do what RPi does. The mainline driver only registers one
>>>>> instance and they carry a little patch downstream that implements the
>>>>> for() loop where multiple instances are registered. Duplicating media graphs
>>>>> is not desirable (at least in mainline) as we can have ISPs with 256
>>>>> contexts, we don't want 256 media graphs.
>>>>>
>>>>> A framework level solution with proper priority handling and job
>>>>> scheduling is what is required and that's what the context work should
>>>>> end up being.
>>>> Our Mali-C720 ISP can support up to 16 contexts, each with over a dozen
>>>> subdevs and capture nodes. As we imagine this will not be feasible for
>>>> upstreaming :) So using  this framework is definitely the way we would
>>>> like to go. We are mainly limited by the lack of per-context graph/streams
>>>> configuration at this point.
>>>>
>>>>>>>> Can we get a copy of all media graphs on an i.MX95 system including
>>>>>>>> the ISI and the CSI-2 receiver ?
>>>>>> Here is an example with multiple sensors. Or do you need it in another
>>>>>> format ?
>>>>> No it's fine, thanks!
>>>>>
>>>>>> digraph board {
>>>>>>         rankdir=TB
>>>>>>         n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 | <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7 | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000001:port5 -> n0000000f:port0 [style=bold]
>>>>>>         n00000001:port6 -> n0000001a:port0 [style=bold]
>>>>>>         n00000001:port7 -> n00000025:port0 [style=bold]
>>>>>>         n00000001:port8 -> n00000030:port0 [style=bold]
>>>>>>         n00000001:port9 -> n0000003b:port0 [style=bold]
>>>>>>         n00000001:port10 -> n00000046:port0 [style=bold]
>>>>>>         n00000001:port11 -> n00000051:port0 [style=bold]
>>>>>>         n00000001:port12 -> n0000005c:port0 [style=bold]
>>>>>>         n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n0000000f:port1 -> n00000012 [style=bold]
>>>>>>         n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n0000001a:port1 -> n0000001d [style=bold]
>>>>>>         n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000025:port1 -> n00000028 [style=bold]
>>>>>>         n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000030:port1 -> n00000033 [style=bold]
>>>>>>         n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n0000003b:port1 -> n0000003e [style=bold]
>>>>>>         n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000046:port1 -> n00000049 [style=bold]
>>>>>>         n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000051:port1 -> n00000054 [style=bold]
>>>>>>         n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n0000005c:port1 -> n0000005f [style=bold]
>>>>>>         n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n00000067 [label="mxc_isi.output\n", shape=box, style=filled, fillcolor=yellow]
>>>>>>         n00000067 -> n00000001:port4 [style=bold]
>>>>>>         n0000006e [label="{{<port0> 0} | 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n0000006e:port1 -> n00000001:port2 [style=bold]
>>>>>>         n00000073 [label="{{<port0> 0} | csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000073:port1 -> n0000006e:port0 [style=bold]
>>>>>>         n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} | max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000078:port4 -> n00000073:port0 [style=dashed]
>>>>>>         n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000081:port0 -> n00000078:port0 [style=bold]
>>>>>>         n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000085:port0 -> n00000078:port1 [style=bold]
>>>>>>         n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n00000089:port0 -> n00000078:port2 [style=bold]
>>>>>>         n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>         n0000008d:port0 -> n00000078:port3 [style=bold]
>>>>>> }
>>>> This was an interesting point from our sides too regarding the context framework,
>>>> how would shared inputs be linked to independent contexts? For example, one input
>>>> port with 4 sensors where each is processed by a separate context.
>>> If the multi-context ISP operates in M2M mode, the capture and ISP
>>> pipelines will be disjoint (even if they're in the same media graphs).
>>> Linking the two will be done by userspace, through memory buffers shared
>>> between the pipelines.
>> In our ISP we don't have to operate in a pure M2M mode for multi-context.
>>
>> Instead, we have a time division mode for multiple inline sensors simultaneously.
>> The context management unit writes incoming frames from multiple sensors to memory
>> buffers and automatically schedule them for processing, injecting the buffer into
>> the pipeline once it is available.
>>
>> In the driver we just configure the context, provide internally allocated DMA buffers
>> and the scheduler automatically handles the rest. Of course we can get interrupts
>> for these events if we have use for them.
> OK, so this is offline mode but with hardware (or firmware) scheduling.


Effectively yes. As you pointed out having an inline ISP operate with multi-context and
no buffering would have to be specialised. It's more the case here that it must be
configured once, then the ISP just provides interrupts on certain events.


>
>> While we could do this through userspace, it doesn't make full use of the ISP's
>> capabilities such as its hardware scheduling. From a media graph perspective, I
>> think it should be considered as an inline ISP with the buffers simply acting as
>> temporary storage while the ISP is busy.
> Given that userspace will still have to supply parameters for the ISP,
> as well as buffers for processed images, what would be the advantage of
> scheduling the raw buffers automatically ?


It is mainly to reduce latency, since userspace parameters are written to per-context
memory regions rather than the ISP registers directly. The ISP automatically loads
the correct region in when the context starts. Effectively the IPA can be asynchronous
to the HW, though we make an assumption that the system is capable enough to run the IPA
and write the results to the context region during vertical blank as to ensure gains are
aligned with the sensor exposure.
The ISP can also still run without output video buffers, so we can still capture
statistics for frames we don't consume but maintain our IPA loop i.e. for auto exposure.
In Libcamera, the IPA loop is pretty much independent from requests, though still need to
figure out synchronising controls and metadata...


>> I guess my thought was the camera "frontend" would effectively have some shared
>> state across all contexts, but the outputs from this would go to per context instances.
>> Perhaps a similar thing would apply with this CSI-2 receiver and the ISI since they
>> appear to deal with multiple sensors that are then divided across their 8 contexts?
> With a media graph that spans sensors, CSI-2 receivers, ISI and ISP, the
> frontend part of the graph (sensors, CSI-2, ISI) would be handled with
> one pipeline (in kernel terms, not a libcamera pipeline handler) and the
> ISP with another pipeline. Those two pipelines would operate
> independently. The ISP pipeline would make use of the multi-context API
> while the frontend pipeline wouldn't.


This is one way we could go about it, and as we discussed DMA fences could
be utilized to still allow implicit HW scheduling while passing buffer from
sensor frontend to the ISP backend. Of course this introduces additional load
in waking the userspace, and potential concerns around error handling if the
input fails to capture a buffer.
One other concern I realized is our HW scheduler needs to be aware what inputs
are actually assigned to the context. With this separation in userspace that
could be difficult. Unless we make it explicit that each capture device on the
frontend ties to a specific context i.e. cap0 -> context0, etc? That may have
issues of it's own, like userspace now must know exactly which context it's using,
or potential misconfigurations not being validated and causing errors...


The other option we discussed being whether a media link could be made across
a single-context frontend and a multi-context backend, but naturally how this
may impact link validation, the APIs for interacting with this, etc. I guess
this would rely on first having media link states per context anyway.


>>>> As a test of multi-context with duplicated media graphs, we would segregate our
>>>> inputs between media devices, though this is less flexible as it strictly ties
>>>> one sensor to a particular context.
>>>>
>>>>>>>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
>>>>>>>> that's exactly what we're working on with the context framework :)
>>>>>> Ok. Then I should have a look to context framework too ...
>>>>> Please, I hope to be able to resume working on it sooner or later
>>>>> given the right use case.
>>>>>
>>>>>>>>> ... since it is not, your assumption seems very reasonable.
>>>>>>>>>
>>>>>>>>>>>    - How can the user decide whether direct (csi2isp) or indirect
>>>>>>>>>>>      (mem2mem) streaming shall be used?
>>>>>>>>>> That will also be part of the evaluation. From dts would be my first
>>>>>>>>>> option, but may prevent using both modes on same platform then.
>>>>>>>>> Of course this depends what the hardware is able to do, but in case the
>>>>>>>>> HW is reconfigurable easily, I doubt that device tree is a good choice
>>>>>>>>> to solve that.
>>>>>>>>>
>>>>>>>>>>> While it is certainly OK to introduce this support only at a later
>>>>>>>>>>> stage, it makes sense to consider this right from the start to avoid
>>>>>>>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
>>>>>>>>>>>
>>>>>>>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
>>>>>>>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
>>>>>>>>>>> thoughts about that.
>>>>>>>>>> Is there an existing discussion thread available on this topic? I would
>>>>>>>>>> be very interested in following it.
>>>>>>>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
>>>>>>>> It's probably time to have one :)
>>>>>> Good. Please loop me in ;)
>>>>> You are in, this is the conversation ;)
>>>>>
>>>>> It might be a good discussion point for the media summit in Nice
>>>>> co-located with Embedded Recipes if people with interest in the topic
>>>>> will going the be there.
>>>>>
>>>>> I'm also adding Anthony from ARM as I know he's going through the same
>>>>> inline/m2m duality you're now facing.
>>>>>
>>>> We make the issue even more complex as individual contexts can run in either
>>>> inline or m2m mode simultaneously... Though in our case the ISP does not
>>>> have any external dependencies for this like with Mali-C55 + IVC.
>>> Simultaneously ? Can a single ISP instance run in inline and offline
>>> mode simultaneously ? How does that work ?
>> Technically speaking the inline still require memory buffers but once configured
>> the ISP can run without involvement from the driver. The buffering is effectively
>> invisible at this point.
>>
>> The context management unit facilitates this through the aformentioned hardware
>> scheduling. Each individual context may choose to use inline mode or M2M mode.
>> In inline mode, that context is "schedulable" when it's input buffer isready,
>> which occurs automatically once the image is fully written to memory.
>> In M2M mode, the context is "schedulable" when the user triggers it via SW.
>>
>>>> As a side note, was there any thought into how Libcamera may support a pure m2m
>>>> usecase, say by passing user provided frames rather than indirectly coming from
>>>> a sensor? Perhaps there is already something for this that I've missed.
>>> https://lists.libcamera.org/pipermail/libcamera-devel/2025-December/055627.html
>>>
>>> I expect more work to be needed before we can finalize an API, as I
>>> think different people will have very different ideas of how this should
>>> work.
>> Ah nice thanks :)
>>
>> I took a quick skim through and it seems pretty good. When I have some time
>> I will try pull this series to test on our side.
> What are your use cases ?


For m2m it could be cases where we interact with an external sensor running
it's own auto exposure loop. Or we may even use it for passing precaptured
sequences of frames through the ISP as part of a sensor tuning process.
In this case, we could modify the behaviour of the IPA so we only process stats
once we are aware of the next request's controls i.e. user provided sensor exposure,
rather than running the IPA on frame end.


Thanks,
Anthony


>
>>>>>>>>>>>> This series is posted as RFC because extending the v4l2-isp interface may
>>>>>>>>>>>> overlap with ongoing work. If similar development already exists, I am
>>>>>>>>>>>> happy to rebase or adapt the series accordingly. If preferred, the series
>>>>>>>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>>>>>>>>>>>> driver introduction.
>>>>>>>>>>>>
>>>>>>>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>>>>>>>>>>>> consistent with the existing style in that file.
>>>>>>>>>>>>
>>>>>>>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>>>>>>>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>>>>>>>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
>>>>>>>>>>>> yet upstreamed.
>>> [snip]

