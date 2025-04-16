Return-Path: <linux-media+bounces-30314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9AA8B2F9
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 10:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B901902D6C
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 08:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1F422F178;
	Wed, 16 Apr 2025 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="UCiAqscH"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2133.outbound.protection.outlook.com [40.107.117.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDABD347B4;
	Wed, 16 Apr 2025 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790989; cv=fail; b=hxYIL8UblR2G1AdjbEySkk1/STxlxrh1ZDkq1tIX8oWEbsdJRN+TTE+ZMNow10pU/Kjvv3e2614LhPlb71K4xgV70wOd3RcGQ92EjOkhayaqx2VkFnLUxmn38+MM3sYbtTiUlj5fLfrC3mMegA3yBW4fTn+KLgXxtlu6ba0tXqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790989; c=relaxed/simple;
	bh=3bkjqMYTXm9xcT8GZlNWXuSvwzaiXWqVN4NyC/SOJvM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YFIPjgP+P0iC2OkUueGxVcM+SZ9Or5xY+w2gJdPswrwkEd4Nt7JEd1ISMZAzMhN9vB91diX4pJYgTZlSJtqMoQhrz6QgxxgEFbD8BrmnGwMZsjkYFHiyDy5ruZ1WgwtW7xhgYfWllGV1tK4AXWRLv94Qtu9LtctA1EJ9BVFsiMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=UCiAqscH; arc=fail smtp.client-ip=40.107.117.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWoVM/WBhZRDm335g5U0udKj55UHoPdbDRxLLEKwQSYQYJBM0Z6ut9r2SDi2GRKjsInmgPJShWs+UHzVwhTw+0npMbe+KiXA4iUDwuQ8dIUU1TDsGI1Qj1mHjkHTiOfswXMt9aZ0Z300lyP2SADAuF7NNz/VC1O/T+TUbaw8tmEl076mCwCroQ67d10xTSk2WHmfMhSgHzsHfVnEqJDjy4J7R5iKbEaONC4UBz1YEYcbi4+Ya/Q4VOmQL6ZaapmjB/l/cgZv/szjCIufqmSIPF7OttuBTPy8gSc6hoaCNG9LjPv4k+w1u0GGXbCaUcsqCv1TwD80FreI5q+eFtlDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK2QbaIXEjqdf1yNL2bRZSzvsJrmDuCuxYRTT1FeGT8=;
 b=dJ+9CZCUFxcuVPJLXununY2mt4BQvVNEdArS184LbTym2BfNy1TMGy8GdsdK4azfmdEafw/FWRaWr/4k8YiWgbcXcrNbHyPlMtXqWusyuYGrbkp6EHqRL/cPWrE5ZDBKuQZ5jlXkTs+bNOhFvheJbBr31TG7pk9unjVJocW6jEQGKf4LNz/e0Uw5tkWkLx6kH4liZ8kFEhc+pRqgMQKI/Ft7AB2xWox9Df+1l5yDU8FK7Iw+fe0BUxFk5Zq9sXGP5IO0SL9GJA+EtaPTh60FJQIiC+rIu9hI1o6rCBXmSLcXRufl5/JHOyJzzvwHqQOVWcjMfqmGykEkNRf6Tz2ICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK2QbaIXEjqdf1yNL2bRZSzvsJrmDuCuxYRTT1FeGT8=;
 b=UCiAqscHVFkhzRV3m9QJSlY+Ra+VjAcGzrw1W8WyCgNZ/A/pT/EtuNpLvffU3LaZP7y68rAXj9eaEFEg2IPB7W6KC1nTsfFQ655L7mkCc5rW5gGYcL7XUx8N6pDZUbMV0db9r/o4Qk+1NiO6NITm/tUxjszXGwuNQn5u9fyNqsWBaza3wdUSDIW1PgklQKZ6+3Ge3/acK7Ivgr9glsfpzP89GiUy3DtvTCqzLVEZOknYZjv38NrkiYl7vj8XmdaFrF2zt3TsHoudou+sttOLwFVQ/19Ad20YAVlFVq3mWCo7tKCxELLTJuY4dD4jO2k3XxAMCADS7/zX78j57J1ikw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB8168.apcprd03.prod.outlook.com (2603:1096:400:44f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 08:09:44 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 08:09:44 +0000
Message-ID: <d94c8ecf-7658-4578-88b5-0b34736e3736@amlogic.com>
Date: Wed, 16 Apr 2025 16:09:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] Documentation: media: add documentation file
 c3-isp.rst
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
 <20250414-c3isp-v8-10-9f89e537494e@amlogic.com>
 <3bordqs2ygaaj6d7yqs2cgvhc46szwf53ojsaz4aikvqmxxx3v@s5af6wtpzfxn>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <3bordqs2ygaaj6d7yqs2cgvhc46szwf53ojsaz4aikvqmxxx3v@s5af6wtpzfxn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a281cf-25e1-40b2-bf6a-08dd7cbe0b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzhWNU1pb2Nwc3JUZkszdjBJYUhkTG9HK3NDUkhWdERFRi90ZHhqc2xyMmk4?=
 =?utf-8?B?MnZSTERzeDRuZCtwVnJWK1hoVHl5QkcvVjljSFJUSzBrTGlBS1JIWFNNK1BU?=
 =?utf-8?B?blVsUm4xMW9MQTdIOVcwdGtqT2I0Yk1reDFMQVl5N05sZmxNNDFDSUhibnZh?=
 =?utf-8?B?S1pjSHNYMCtLUjZaMkZuL2ZDZ2pobzFSYU5McmVkWU40M3E3TVh1TFhTR0or?=
 =?utf-8?B?ejZwKzJ2V0hFRVpMK0RiLzc5TGdFVkpYUHZOYkszVjAzNStvUm9xZml0NEhl?=
 =?utf-8?B?WERtcjF3Sk0yREsyMlRXaVRQLzUwb0VJcUJUVXd5L3BxVEswT0QyZmRHT3Nm?=
 =?utf-8?B?cmorVXJPQzVPVUxoMjNQREtYa2dCcFZkWFhNWk5XNVRQRXVDZTcxME1LUnFn?=
 =?utf-8?B?TmcvcDMrQ1ZBOUxqd054ekg0SXhVUUZlQ0FrNk40ZHJ5a3B0UVgrREdCcEVI?=
 =?utf-8?B?NkdhZis4Uzc3ZlBubGN4dFZtVkhzcDFVVFdselB3QlBHLzVCUkJsYWpySGhh?=
 =?utf-8?B?UmYvUEdZVGNDb28rKzFtYmpoYXhlQitsanVNd3ZvZ0xqUmVXVGdMaThPS2o4?=
 =?utf-8?B?d25xNnk3bFJ1Wm9qbDExOEFsR242QTFBQzBGYUJKTDNuZHZUOHBFcERYWXZK?=
 =?utf-8?B?ZXBHZGVKWlFYZXJEZmptc1M4bTBWamsrRTBvdnNSRXltUGJMdjhwaVJaQzNu?=
 =?utf-8?B?WVY0R3FCMWRXMFZ1dTZxZytRZFNhOXowT2tSKzZCSzV3UzF5VEhiZFRreWVU?=
 =?utf-8?B?OGJidzA0M2ViM2h6VmJXd1lSeWV4eURxZTJEVGtCRUVtYm1vQkFmdWcrSWV2?=
 =?utf-8?B?SHB2OFRLU05jZlU0bWZHR2E0OW4wVWVzSm5QcmRGRHhVZ2ttSUV5TGp0RlNh?=
 =?utf-8?B?d0VWL255NU1ZanMydkdrbHkyTnlUMjNwc2dXV3dYYjBNRk9OU0kweWNpay9P?=
 =?utf-8?B?bTFJSU1tMmYrUVJOQ1RnczBsbVlGRC9NcWVJL1JGMmJCbEdjc0ExTlhxL2JR?=
 =?utf-8?B?RGNnV1FZdnJQZEUwYXlrOWN3MFpqNmdBQ1pLcE9GTzdxS2pkYmpFUXh0RzdS?=
 =?utf-8?B?RE5mSnVkSXZnaEdVVDlBdzhUZ2RZdis5WlZQeU5xTzFyT2J3NUxRSWw3NDdw?=
 =?utf-8?B?alpPZGpDNVB1TUp4enArWkNOUTlLZXNSYndYMkRHbzdWRHNST3RJazhyY0d3?=
 =?utf-8?B?clhwbWQzNks5bEFuZCs2Uk02VS82QS83Kzd1QlZydm8zVnJ1ZnFlS0ZwRXZr?=
 =?utf-8?B?MzFsYk5zWDk3Rmttdk1oRUVZbmRmNXJsY3ozcDA1akZzK25EY25qbWZvbVcw?=
 =?utf-8?B?S3hQVThuRUdTSmVkUjMvVVBxSTJaRFZTZlRGWXFhZVVaOG1Hd2JNdVJKVmtK?=
 =?utf-8?B?a1FKT3NMaXNnZzlENnFzOGd0aFpGanJIbFRVc2RueGl5ZVNHcGRBcHBDSVdK?=
 =?utf-8?B?d0hwb0hRNHNXUE10eFdZTyt0NzJUWE1Sd0tNMG9TWVNMaGd4cGR5aFFSRTQy?=
 =?utf-8?B?NUhjL0VyanhEVjNzRGF6bHlxa0dlbnNRRG85OUIxSHorMDIxOEw5eStRSlhJ?=
 =?utf-8?B?MjhCYlNKUWhwYjVRRzR3Rk4zOG55TENLQzBIaHl0WE9FQnB0VTU3bHErSEpC?=
 =?utf-8?B?ZTR4dzlhR2FvbTRJbHJzKy9HNXFoZy9WVXYrTTRBYzA3YXVDakMrNkNtV3Ix?=
 =?utf-8?B?eE91NmFDM29TbE85aEJ6ZVZmVFA2WVg2b2lmaEJzazEzMjA3eDAxTWRZcE5W?=
 =?utf-8?B?TS9wd0dkL3lIUDhMQzVMTFdjT0c4NmtyWHFMT1IwZkJrdFhWdjZXOFdEQlhB?=
 =?utf-8?Q?LtyDu9L0FBt4hYl35ewsL8LksB318i8lbRWx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHZHTVJ6QWt0YUtQQTdraFRhVWtzSGpYT21lU1BBdGIyRklhZ05QRVFUMkhT?=
 =?utf-8?B?S1pCUmJWaG9Qc3g3cXhqKytrSm1BUkhqM3dLdXNtaDJ4NU5IU2xTTzZPWkxp?=
 =?utf-8?B?ZlpVb0RNMDBYanhjK0tHa29sVkU2d3YyblFMTldIRkJGU2M1MlhGOHVocHdh?=
 =?utf-8?B?d0RxMktwMUNuclVoa0ZEb1RvWCsza0ZMcGh6QlNEbVdRVFpYeGFDUWY4SGh0?=
 =?utf-8?B?SFc4OXh5QlQ4blpEZndiK3NXRTFWcDRTeUp1L2ZxK0ZybjEzc3BNd1oyQ1pk?=
 =?utf-8?B?K0hQbEdKTUlUSW9YMUhlQVZsL3hiNUpWMEptK2E5d00rdFloVVJ0aGFMWU1V?=
 =?utf-8?B?ZjNBNjFZbzNOQkVvNjFyRjRMTk83eEpoNVpYUXpOMTZORnlsMWhuZ2VJQkpH?=
 =?utf-8?B?NE45MCtLTnBaR0JqNFdKU21MYjVSN2lHcG5jaU1vWld4RnZLVnRtSTRkS2pL?=
 =?utf-8?B?Y3BZWUlxK3RvUlQxaEFJeHc5YjZFQ25LUEZBUE9qWDRYcWpxdVF4aWJOaUlw?=
 =?utf-8?B?ZWw0Nm5leWdPL2V3cmtqUzVQd0hQZTFXMjhJem9vQ0FKWEp6S1BubFNHWllF?=
 =?utf-8?B?VDRMS2tsZkhDZ2hvQ3locE5wbGhyZi9wMUZ2WDZyaUFwY0VwS1FGK1dPYTN4?=
 =?utf-8?B?SGZ6VUc3WXRETXB6TTlyWUs1cjFXVHpSclBtcXlJVkpZNngwNmxJNkRFYW1n?=
 =?utf-8?B?WlpkK2FFV3dEazVwVDdaTFArbm1Jakk2RExTTjNwTUM5UlU2ZFAwUkRpOTVD?=
 =?utf-8?B?S2ZDaXFzYTZYUi9leXhHQkJvOFZQUnVoNFBsbmh3YnlpYjMvcGtKbnJFQlVu?=
 =?utf-8?B?UlRSRlZCOUZCWVZYVGluYTQrOWIvRWtuUDZ5eWZ6cTRldWlaZzYwaHpLOHlL?=
 =?utf-8?B?SVhla0xpY2hLQW53RTNjQmNFMVJTVEVzYzdOcEJCbm43b3Jlc2VCbTd5RWEw?=
 =?utf-8?B?dWZZdmo4SFc3Q292Z2RMRHh1NlBJLzUrUDgzYmVVOFV6NDIzV1dCb1lKdHYr?=
 =?utf-8?B?WFQ3cHlEQ0FuOGNhTDJpbEQ4R2xhTTNRTG02NEVBWDJqa3RxQ0V1SDhMMlpM?=
 =?utf-8?B?U25zRXhKdkV5ZjZOcEltb2MwRnQyV1ZXK3k1cG43T2cxN3lhSi94bmIrZ0JS?=
 =?utf-8?B?RXlWclVKYmsvSExycDMyTFZWSjRqSGlsRkpFa0xPVGl1OUdZeWFSTmwrK0cr?=
 =?utf-8?B?VWtiUmVPaWhUNFVyZ2pYVWdHbEZYUUJQOTZpQjV2WXlGOUo2aVpmTFNSdWV5?=
 =?utf-8?B?aHFWNGRVUEVJODFMZ201NVh1QU1QS3NyeGY5V3NYajhKSlRzWHczdjRwUVJG?=
 =?utf-8?B?S3V1UmVScExQTysyakQ4WWtSWVJqdHBTT3RPdGQrUEhTV2xjQTRJMGVqTG90?=
 =?utf-8?B?MFNXY0pRWUZLWDMzaGQ1S2VqUlhFSWxOQ0lwUTBmdVJScmNXdUdGYkhudis4?=
 =?utf-8?B?SnF1TmwxVndaMnJhbWFLczdSbkhWbjRKc1FIS3VLM1doV200eXZOZ3lZV2Rt?=
 =?utf-8?B?MHNha2FOMGNQTGxXRkI1MDU5UE9hSnBMU1k0TFFRNTB2UU9rM2h4YXJOcG4x?=
 =?utf-8?B?ZDJnSXZsQi9aSlhlZzJ2UXVJalErMnRkTDlYOWtYSnE1NlFJM2NXUzBDYkpI?=
 =?utf-8?B?Z1BEdGo1dzBrWDk1S0g5NVduV0JBVS82dW9Da1l4QlIvb1RyYjR2K2hScmxy?=
 =?utf-8?B?NjA3ODJLZzNFbUZJUEgxOHRFWGd2YW12ZjdWaGVNRk1lWEQ2NWcvMmZ4bjkv?=
 =?utf-8?B?eUJ2QWVJY2R5ZjVkNVY2Rko4SWFqZ2N5TEloVEd3MkZNZFovT1loYmtnZVor?=
 =?utf-8?B?eFpvc1RxWGxtS3FtcU9WdE42Zm9lNlNhT25xUFozdXVtSDI0OGk5dWN1SG85?=
 =?utf-8?B?NWZGN0hYeWpjUlhHOW1QWmE1OWFIRkZ6SHk1N0pKZjVjeWxBais0Yk82Yk5H?=
 =?utf-8?B?NEEwRlB3K1MxOW1sVWNWU28vNWhpODlpekxWVDc1eVBBN1pRaHZFL084cjI4?=
 =?utf-8?B?ZHlDVkJQZTEyKzJuamIyZUVweDg3L3RYakoyMFpiSGwxaG9IWms4dkRoLy84?=
 =?utf-8?B?YW1JOXBzWXFTUHo4cjlTOStzTVRjaUN0QTJqSVhTeTlvTjZmeDNCekhuRnAr?=
 =?utf-8?Q?ta09jV3RLjZGYdeSXqG+kYKb+?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a281cf-25e1-40b2-bf6a-08dd7cbe0b9c
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:09:43.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zI0RIuX9qaWAQgu2ykRommchph56ppdP49suFccDsm28va81Q2MVcucjvTXfM8ox0tPP9262RCK+XzU2bnb7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8168

Hi Jacopo

Thanks for your reply.

On 2025/4/15 22:55, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>     sorry, I missed this patch in my previous reviews.
>
> I think you're already at v8 and there's no need to resend the whole
> series. I would like to send a pull request and see this series merged
> soon.
>
> I've run the series through CI (applying a few minors to patch titles
> to fix a few checkpatch warnings[1])
>
> I can apply the below suggestions with your ack, re-run the series
> through CI and send a pull request. Or, if you prefer to resend I'll
> wait for a new version.
>
> What do you prefer ?
I will  send a new version.
> See my comments below
>
> On Mon, Apr 14, 2025 at 03:35:23PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> Add the file 'c3-isp.rst' that documents the c3-isp driver.
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   Documentation/admin-guide/media/c3-isp.dot      |  26 ++++++
>>   Documentation/admin-guide/media/c3-isp.rst      | 109 ++++++++++++++++++++++++
>>   Documentation/admin-guide/media/v4l-drivers.rst |   1 +
>>   MAINTAINERS                                     |   2 +
>>   4 files changed, 138 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/media/c3-isp.dot b/Documentation/admin-guide/media/c3-isp.dot
>> new file mode 100644
>> index 000000000000..42dc931ee84a
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/c3-isp.dot
>> @@ -0,0 +1,26 @@
>> +digraph board {
>> +     rankdir=TB
>> +     n00000001 [label="{{<port0> 0 | <port1> 1} | c3-isp-core\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n00000001:port3 -> n00000008:port0
>> +     n00000001:port4 -> n0000000b:port0
>> +     n00000001:port5 -> n0000000e:port0
>> +     n00000001:port2 -> n00000027
>> +     n00000008 [label="{{<port0> 0} | c3-isp-resizer0\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n00000008:port1 -> n00000016 [style=bold]
>> +     n0000000b [label="{{<port0> 0} | c3-isp-resizer1\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n0000000b:port1 -> n0000001a [style=bold]
>> +     n0000000e [label="{{<port0> 0} | c3-isp-resizer2\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n0000000e:port1 -> n00000023 [style=bold]
>> +     n00000011 [label="{{<port0> 0} | c3-mipi-adapter\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n00000011:port1 -> n00000001:port0 [style=bold]
>> +     n00000016 [label="c3-isp-cap0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>> +     n0000001a [label="c3-isp-cap1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>> +     n0000001e [label="{{<port0> 0} | c3-mipi-csi2\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n0000001e:port1 -> n00000011:port0 [style=bold]
>> +     n00000023 [label="c3-isp-cap2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>> +     n00000027 [label="c3-isp-stats\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>> +     n0000002b [label="c3-isp-params\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
>> +     n0000002b -> n00000001:port1
>> +     n0000003f [label="{{} | imx290 2-001a\n/dev/v4l-subdev6 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>> +     n0000003f:port0 -> n0000001e:port0 [style=bold]
>> +}
>> diff --git a/Documentation/admin-guide/media/c3-isp.rst b/Documentation/admin-guide/media/c3-isp.rst
>> new file mode 100644
>> index 000000000000..8adac4605a6a
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/c3-isp.rst
>> @@ -0,0 +1,109 @@
>> +.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +
>> +.. include:: <isonum.txt>
>> +
>> +=================================================
>> +Amlogic C3 Image Signal Processing (C3ISP) driver
>> +=================================================
>> +
>> +Introduction
>> +============
>> +
>> +This file documents the Amlogic C3ISP driver located under
>> +drivers/media/platform/amlogic/c3/isp.
>> +
>> +The current version of the driver supports the C3ISP found on
>> +Amlogic C308L processor.
>> +
>> +The driver implements V4L2, Media controller and V4L2 subdev interfaces.
>> +Camera sensor using V4L2 subdev interface in the kernel is supported.
>> +
>> +The driver has been tested on AW419-C308L-Socket platform.
>> +
>> +Anlogic Camera hardware
> s/Anlogic/Amlogic


Will use "Amlogic".

>> +=======================
>> +
>> +The Camera hardware found on C308L processors and supported by
>> +the driver consists of:
>> +
>> +- 1 MIPI-CSI2 module. It handle the Physical layer of the CSI2 receivers and
>> +  receive MIPI data.
>> +  A separate camera sensor can be connected to MIPI-CSi2 module.
> Do not break lines when not necessary
OK.
>
> s/CSi2/CSI-2


Will use "CSI-2".

>> +- 1 MIPI-ADAPTER module. Organize MIPI data to meet ISP input requirements and
>> +  send MIPI data to ISP
>> +- 1 ISP (Image Signal Processing) module. Contain a pipeline of image processing
>> +  hardware blocks.
>> +  The ISP pipeline contains three scalers at the end.
>> +  The ISP also contains the DMA interface which writes the output data to memory.
> Ditto


OK.

>> +
>> +A high level functional view of the C3 ISP is presented below. The ISP
>> +takes input from the sensor.::
>> +
>> +                                                                   +---------+    +-------+
>> +                                                                   | Scaler  |--->| WRMIF |
>> +  +---------+    +------------+    +--------------+    +-------+   |---------+    +-------+
>> +  | Sensor  |--->| MIPI CSI-2 |--->| MIPI ADAPTER |--->|  ISP  |---|---------+    +-------+
>> +  +---------+    +------------+    +--------------+    +-------+   | Scaler  |--->| WRMIF |
>> +                                                                   +---------+    +-------+
>> +                                                                   |---------+    +-------+
>> +                                                                   | Scaler  |--->| WRMIF |
>> +                                                                   +---------+    +-------+
>> +
>> +Supported functionality
>> +=======================
>> +
>> +The current version of the driver supports:
>> +
>> +- Input from camera sensor via MIPI-CSI2;
> s/;/.
>

Will use "."

>> +
>> +- Pixel output interface of ISP
>> +
>> +  - Scaling support. Configuration of the scaler module
>> +    for downscalling with ratio up to 8x.
> To be honest I would drop this paragraph.
>
Will drop this paragraph.
>> +
>> +Driver Architecture and Design
>> +==============================
>> +
>> +The driver implements the V4L2 subdev interface. With the goal to model the
> The driver also implements the V4L2 video capture interface and the
> Media Controller interface.
>
> To be honest, I would drop this first phrase.
>
>
Will drop the first phrase.
>> +hardware links between the modules and to expose a clean, logical and usable
>> +interface, the driver is split into V4L2 sub-devices as follows:
> s/is split into/registers the following/
Will use "registers the following".
> s/as follows//
>

Will remove "as follows".

>> +
>> +- 1 c3-mipi-csi2 sub-device - mipi-csi2 is represented by a single sub-device.
>> +- 1 c3-mipi-adapter sub-device - mipi-adapter is represented by a single sub-devices.
>> +- 1 c3-isp-core sub-device - isp-core is represented by a single sub-devices.
>> +- 3 c3-isp-resizer sub-devices - isp-resizer is represented by a number of sub-devices
>> +  equal to the number of capture device.
>> +
>> +c3-isp-core sub-device is linked to 2 separate video device nodes and
>> +3 c3-isp-resizer sub-devices nodes.
>> +
>> +- 1 capture statistics video device node.
>> +- 1 output parameters video device node.
>> +- 3 c3-isp-resizer sub-device nodes.
>> +
>> +c3-isp-resizer sub-device is linked to capture video device node.
>> +
>> +- c3-isp-resizer0 is linked to c3-isp-cap0
>> +- c3-isp-resizer1 is linked to c3-isp-cap1
>> +- c3-isp-resizer2 is linked to c3-isp-cap2
>> +
>> +The media controller pipeline graph is as follows (with connected a
>> +IMX290 camera sensor):
>> +
>> +.. _isp_topology_graph:
>> +
>> +.. kernel-figure:: c3-isp.dot
>> +    :alt:   c3-isp.dot
>> +    :align: center
>> +
>> +    Media pipeline topology
>> +
>> +Implementation
>> +==============
>> +
>> +Runtime configuration of the hardware via 'c3-isp-params' video device node.
>> +Acquiring statistics of ISP hardware via 'c3-isp-stats' video device node.
>> +Acquiring output image of ISP hardware via 'c3-isp-cap[0, 2]' video device node.
>> +
>> +The output size of the scaler module in the ISP is configured with
>> +the pixel format of 'c3-isp-cap[0, 2]' video device node.
> The output size.. configured with the pixel format ?
>
> I would say:
>
> The final picture size and format is configured using the V4L2 video
> capture interface on the 'c3-isp-cap[0, 2]' video device nodes.
OK.
> I would also mention the ISP is supported in libcamera (or better, on
> its way to be supported by libcamera).
>
> I can send an update to this patch for your review. Is this ok ?
OK,  thanks.
> I'll check with maintainers on how to then moved forward and collect
> this series.
>
> For reference, the branch where I applied minor fixups to pass
> media-ci style checks and with this last patch updated is available
> here
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1406119
>

Will refer to your update for this patch.

>> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
>> index e8761561b2fe..3bac5165b134 100644
>> --- a/Documentation/admin-guide/media/v4l-drivers.rst
>> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
>> @@ -10,6 +10,7 @@ Video4Linux (V4L) driver-specific documentation
>>        :maxdepth: 2
>>
>>        bttv
>> +     c3-isp
>>        cafe_ccic
>>        cx88
>>        fimc
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b2bf9c6cd194..4b06a798d30c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1259,6 +1259,8 @@ AMLOGIC ISP DRIVER
>>   M:   Keke Li <keke.li@amlogic.com>
>>   L:   linux-media@vger.kernel.org
>>   S:   Maintained
>> +F:   Documentation/admin-guide/media/c3-isp.dot
>> +F:   Documentation/admin-guide/media/c3-isp.rst
>>   F:   Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
>>   F:   Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
>>   F:   drivers/media/platform/amlogic/c3/isp/
>>
>> --
>> 2.49.0
>>
>>
>>

