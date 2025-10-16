Return-Path: <linux-media+bounces-44684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47083BE1E32
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 09:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63EB94EFA2C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 07:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC5124EAB1;
	Thu, 16 Oct 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UsbnJaB0"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF781EE019
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599206; cv=fail; b=KEMxzgyHwJrIZ+NnTlLEKsCIRjq+OB7uoQphvzBKYzrvQ9Z9VJ0SM+xfF6AcdDSFPoCSLrfHaArA6i6xmpXIKRTLE4jFox4VYA6HH6o9vOGYIzQOXNawWduqINDGEZLeAq5Zx9rDJs8ba7lXoYfTRAbqUfzW7/RfN5+bODcFR3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599206; c=relaxed/simple;
	bh=tmHoTymoEhC4EEBadfJ8fhhDVs/DcOeewHT93DISDh4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EEz/PMrHeskwPaq6n3ciCXUjCSj+QptyLzbvxM18W1s8zuFfpr2mnMZ3sq1nJ2/hN5fN1bAIMOBUPl20RA+JNvQRtR9JhrAdXndHxSLp8TaV3johC8wQkZdWEpnjXoGWdnh2IUtF9aebyezniSrYABaq/D8GE36i4t74dZ9peHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UsbnJaB0; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gr70pnEen9oruaX8i4AJyd9o9iriiiQbKXYZFDtEYNzrCVSmLRnpUQz6oSzEKZ7XhLjRx320CeXKnN+Kch2ASFQpAPK89qI5SflDNlfTFzFob5TIGHvy2zq69h6J8yAjOe46gEwRkDphFTmQsQ362xHPWIOqNkInxKJ7OOVF6dublj6jCwVVKAZZX64C6k7qa6P6doyu6PvfSJ4R+hV14SU8rWg/e29kKbceNNLSjHDuhLMfdVjQixSS99CO72bOJjw8cL6zAUVBMTl/ht1iQZFBHyHR+FF3acrunxRgPaeOG849pKe/WiAib+zpE5OW0MyAFDrkh9fc1GDojYvldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYaGvEP0uGZaYxdzPBkBXG+tLXDAV+4FI16r7TMBaD4=;
 b=Xg+89Ae2LX0D+X1oAH4+z/Ql35IvNeVq+CkN7lD1E5tgdjaG1/QgpGTW7KuT0giG71hKyHDO9NGjX3yqwMzByzp8+PQZlwwldGULBbPBeHZIq2MhOsv5NPsQRI8TVTOqd33Um3fixqBJXHKQmztFtjDuLCMh55XvbO3DFJ7mev9fqR2wQ6l8IZjaFxMcsRz79lfCgg6q4aX/h9nKxvGmDMoYOhgU9cKYGibzFwE0KCFC+d0/WPhOeQKnmendIKdwsO4f+FfvNkOdmnktITS8AflDtDlGw5+q5S+3SOR3UKSVVZ3sSo789qJCceuyvzoNdlOCf0W+WoPxbF7A23l5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYaGvEP0uGZaYxdzPBkBXG+tLXDAV+4FI16r7TMBaD4=;
 b=UsbnJaB0aa5iqpyAaF5O5p6oF8P8Zm3ofdbKoru3K8Aq7B5SQ+WfCrjDLQRkJBzmNaFPXUM5hA0aSg/+4DeG348pA5XYuTBcWfl4KwB3N5zP1aRDxw/hOafDobaZp2mgIpLdqu/27u1cPho9+S1INuehKSRQmi5bs/oSsE0KpBEpNEeaw+OxWswbIAnpaMMm8DhUmPkcaHcSckDuSDgBNfu5IpfuzjHfzL/r9I7qIu6FCdUfw0Z0EUN+pSjeEpx8jjU+20LbzWs6x2O5N/pVleuIMIh2WkIBsZ4M6OpQKnlgaYipYV7ajCOrMUWfMceDE5UcgL/fI+t1p2TV4GkUBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU2PR04MB9082.eurprd04.prod.outlook.com (2603:10a6:10:2f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 07:19:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 07:19:58 +0000
Message-ID: <2de5bc3f-d1cd-4cc3-8400-86c4e4853ceb@oss.nxp.com>
Date: Thu, 16 Oct 2025 15:19:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx-jpeg: Add support for descriptor
 allocation from SRAM
To: Marek Vasut <marek.vasut@mailbox.org>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251011183306.163564-1-marek.vasut@mailbox.org>
 <20251011183306.163564-2-marek.vasut@mailbox.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20251011183306.163564-2-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU2PR04MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ed213e-b7a5-4326-7246-08de0c846953
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UjYraWZkc0p3Z0JuTW1hZXQ1SVF3T2pFZ3kreUlCcGQrdXhoNm1hbHpWS21W?=
 =?utf-8?B?RDdreXVTNm1LYm04aUNVdTM4ME11RkRMK05UVkRqL2MrR0ZOcUZ4UmhlVjZo?=
 =?utf-8?B?V3QrTGk0OFlMWUVMaksyMXZpQ3J4NW9KU3FzNFJ2KzIzb1BuMVVCVlN6THl2?=
 =?utf-8?B?bGt0Z29Uay9BclZDQnFNY0ZzL3VwNEQ5U0k2UjhHeDhqbUtZc3FhTm9PcVRY?=
 =?utf-8?B?RWhvTE1uQlgrVmRzd3RlOTVoRXBMek43aG5TZmJ3UWxVaTV5cmtPUnBXbC9z?=
 =?utf-8?B?TmtINkRKSzFhdlhhK3BEYjJsaDhJWTVuaEV4bmdlMUcxRGR6N1dIb2pzR2lC?=
 =?utf-8?B?S2Q1Z04vZUZ3TTI5a2lwaDFSNjFVMXQ3Q3hLM3QxdGVsWjlsZzlVaFA5MEMz?=
 =?utf-8?B?eU5FUEZabW9TYlM5YjdZaVlBdG53OEFVOTcxWEFtNm8rQWVhTkFLQUZpNFBM?=
 =?utf-8?B?Y0o3VWNLYmI3TTlrWjB6K0FZdmI3VE1CSGJBOWF6RDU0enVkeERlY3FWUkRL?=
 =?utf-8?B?OVdTZGpCbFgwbkZyazQvN0Qva0NQb0ExU0htMjRzV2d6YVJVTWRmQmQwZk5n?=
 =?utf-8?B?elA4OHZxelp2cEdncEZFMFg1TmlnZWxpTEVSanovSlNBRVk0aUNvT1pUTmhC?=
 =?utf-8?B?OGxCV3c2WEhkYVdQZWJFV0pMUXlBYTVpNk9zTi9CU0pYYVIrYm50dUZLZlVT?=
 =?utf-8?B?cWVNaXJKLzVSZi9pS3ZJOFVRQ25MbGo2MWV6azVncUZBSFJ2MlVzU0ZNNXVl?=
 =?utf-8?B?Q3NHSVdJdnIzRjFJWWM3aUtsQk9sNWxDVGFlRzh3ejN4K3dpY2NxdHVqMWsw?=
 =?utf-8?B?TDUrVXVueDlzaTZheVBITFZqeFFzQktLRFovMitmQjZOcXY3ejQxenZJQkxl?=
 =?utf-8?B?dEhxNjl5cGw5RUdITUtmQnJFYmcvRW14QUJkRDRoTVlXVnRqM085WEhsRmhs?=
 =?utf-8?B?NmdtNnRMaFJQcjFFVk1YTEd3L20xS3crYUQxTkZET3EyVXI2NGFoSWxVTkV5?=
 =?utf-8?B?RS9vaG5rc1g3U1h3ZEJqQ1p3NG9nZnZ5dFptRVM2ZnJTY0JPV0xmMHNZcXJq?=
 =?utf-8?B?ZHVJaStiY01Kc3I1UmhVVitDbW0rc2t2cVBNdTdwMXB0aWxVdktGYXl2QU9H?=
 =?utf-8?B?ZUZvTFc5NWltYWQyM3hpRVRlOVRheDA5RXJtSUUzU1U1enIrenk3M0JxdWRu?=
 =?utf-8?B?RWM5WkJwUit4MkdaN0cwRmo4czR0VzRtRGdnK2RjR01ab0wzeUsxbmh5cXFP?=
 =?utf-8?B?cU04Z3EwT3VaRUxuMmsyVEdJaS9jNnk3OWlHVHJsdXR3TjRMRzArRTUzSG1y?=
 =?utf-8?B?RithKzNwOE5XbVVtQi83bkJscElvYkUrNnBYMUdRREFYa3RlNXFoc2JoZDhV?=
 =?utf-8?B?WVp2MFBxeFZNNHlHS3JuT3BYKzNNZWdJZDhZd3YxdGhWNlRMYnozekoxVE1T?=
 =?utf-8?B?SXhCZlIrSWtQQVhiY2xjb2xxSnVWdjh6ZVB2cDVpTWhWck1oZ1dnNVc4MUsw?=
 =?utf-8?B?NzdUYzBwc1ZmT0dQRHo5d0ZXdFdpWTcwOXZnVEFWbmdkNG1RYzd0VTk0aTRC?=
 =?utf-8?B?SE42UjJrd0wzMUFWeXlEcVRnelU4Z3ZpcGZYQ01Odm9Ia2hnZ0s2aFI4dGN0?=
 =?utf-8?B?TWlkT1VLU2FGUlZRYjNNOEhWY3I5QlB6cW9VcW5MSzhzNjRxL0J4djVma2Jq?=
 =?utf-8?B?ZG1adDV0YTFUUlU0YXJJRkFKNFJpWEIyZW5sSmJmWUNDaHhlV29ldHBDZHFv?=
 =?utf-8?B?N0M3clZIVTZaaGd3NGVwVm9zUGVKRVVZbEtBSXllcWNYWWtQNTlCUGFjYlhW?=
 =?utf-8?B?bDdxakY2NkJoU0RCaFRDd1lWVEJnU0c3cTFkN3lNcUw2NlVFc3JSVE1ta3Fa?=
 =?utf-8?B?d0d0OGU4aTZKdlc3SEhoUExqWGZZSDJ2S09WVXNBVUVBd3BVUHJ6VThrcC9X?=
 =?utf-8?Q?9pTtl530xjvcbASgnePEK6nAoMIpvrRr?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VzBxaVl2TGpBUmRaL0c2M3NnUVdiR2dkZXB1WFZiU2JwVHV5bUxTVW5HVXRa?=
 =?utf-8?B?YkhXSmNjZ2VnN3JRNmRGWTE0Rmx6ckZ4SlBjRnpUdDRJUDFUMHhaMXl4ZnBx?=
 =?utf-8?B?eVg4dmtpd3JYM0Z3RlZzenJuKzZMWGxOckRabTZ6T3o1TkdpZHJMSXJmQTFm?=
 =?utf-8?B?c1ozOFk0UC9DNGJ2VzRMaDByVms3TUtwZkszTmRpY053KzNWS3UwM01UQ1pz?=
 =?utf-8?B?djZ6R01EU215WnE3WDNFTHdRTE4wOE5TRkNXU3hDVFVXcHgycVhteVo3dGEz?=
 =?utf-8?B?dHZKOXZQMm1YN2ozQWs0Y3MyNzdEbXVRbFU3ZnM1L3J6WDhXYXBKR0tnZGpE?=
 =?utf-8?B?YXV2QlJORlBKOUNUcU85cW5mM0lxeG83cVdBNmF4T1VqTmR4d2VKdGdQZndY?=
 =?utf-8?B?VkN1bDZ5OEhhZXo1b2c5bGQrcUNjZWFxUHpmaUYzNWUvZWp2VVRDWGhVQkZZ?=
 =?utf-8?B?MmxncnZnVkU2U2RGMWVUN0ZvZFk5OXZLYmtYQkJ2SmxaNGxMWVExVnY5SUFK?=
 =?utf-8?B?U0VEQ1FkQXB5enVhN1VWU21IOWk2d3ZnQnlaZ3JwbHhKbm0wQW1PNG5DQnpk?=
 =?utf-8?B?dDNXbWhqbVJ6R0VBa0pHaHJxbUh3ODNnNzVUYmZsMzduNVA2ZkxVTGd5L3Zn?=
 =?utf-8?B?c2hlOFVCdkJCdU9Oa2VWWkZPODROdGlKckpnUXM5dVZlWUFXdmtQTU1IdkVH?=
 =?utf-8?B?ZDVFVVZtSGEya0NFbmE4M3VBdWs4TkQzV2hEbDd1UTA3MVJkSDVuTC9PNmJi?=
 =?utf-8?B?aGRUVUxiMWcyeDEvaDZsVUJ6R0RLOTBoWEdZVkRpbUY2NExrQTk0MkVnd2c4?=
 =?utf-8?B?Snpod2N2eWtRMDlkQmNCWW1GZE9mL1NTZTBQT0lpTzhuZTE4ZFRRSEJvVE1Q?=
 =?utf-8?B?Z0xsS3l2ZmdiK0UzcEpsQS9MZ1hZZERHOXcvQmZHNktnUWVPM2RiRGZ1bG1z?=
 =?utf-8?B?MXRpNEJEWU5yZ01zV1JuUnkrR1MvMGplOE54SFZ5QzZ2M21DQ2grY1NHYjlv?=
 =?utf-8?B?c1VBdDBSZHg0dmc4dFhUSFVCcnFBZFYvSGd2VUZjUENZS2lSaVFNd1NYQ25G?=
 =?utf-8?B?MFRwZDNxdytjdTFoL0NLYlN6ZSthSHNBdVdqMzNkVDNPK2h3bEhTNEFBalN1?=
 =?utf-8?B?dEFOWWpER0I5SkhxazI1ckhDMkpuK1R3aGVXMGpGZk5kWUhBSlRoT1VabC8v?=
 =?utf-8?B?M2hEK3NlQjhpZnNmNEVteXJCa2ZNSklwMmh0b1BiZnpBQ2k1cHhrb3IwcURz?=
 =?utf-8?B?QUtzU2hPcDVvRVBjZ2pvY2tpb3NLdVhtQjhhSGkwb21LWTYzd3lVZS93bUFG?=
 =?utf-8?B?dS9lbkdFQS93eFp6UTd3SjlINjlkOWJiT0luN1UyeUg5VW9WNG1JNXJxcDM5?=
 =?utf-8?B?OUZzaVE3R2tJN3BnSXFEdWdjNG5FVXc3RTVydmUyYnRTdGFPb0dUMXJkNysv?=
 =?utf-8?B?dFNUMStjalNxbWNjQTVtZVBzUmtkNGRNdmhkZjdtTHphYkhqd2pwc2h5ektW?=
 =?utf-8?B?cWtScFZ1d2J4ZzR3WW5JaCtDNDZkN1RWZ2ZKZms0R3ZneUlTTDEveUhiYWp2?=
 =?utf-8?B?S0Z1cFZUbS9tdnErK1ZPMzNkVTlnUGFLcHRjV2dHcmk2V1MzSVRkZmdNblRu?=
 =?utf-8?B?U1V5azVEVzVXZTI1c2FMSFdLdGRjYVhTQjVWMnVZaElDZ0FNeFhEajh6Vnlr?=
 =?utf-8?B?a05YQlQweG9jN0gxa3VzVWdnMmUyU1N4UytCWTRrbnhFQVcvVjVrQmJkc25o?=
 =?utf-8?B?a1NJVFRSVC8vOU9nRHdiWVF0T2RoREtWc0FiQWk2UzJzZEVlUVBmRi9vM3NV?=
 =?utf-8?B?Q3BJc3hkcTVUYnV6aVgxbmhXczlGVmwwZ2k5UHBBVlc5Mzh5VXpqU2JEWG9G?=
 =?utf-8?B?MG95UFZBMmV3aEpUOWZYcW9TczZCSHUxdWtWL2tnVlZyNytSNmJaREZuSmxz?=
 =?utf-8?B?VjgyQktMNGJhS01ZNDhmSzdaREF1SHIyRWtLYUZsQUh4ajVlUUlES1gwT1d4?=
 =?utf-8?B?K0RTOFRLTFlmN3M2MFhGMXI5OXNsZzVtUFl0eG5WdG00dE1sVnQyek12ZXNt?=
 =?utf-8?B?WWpWamptOGFsNjJpYktiMVIxUjF1dWFLbnl3UVRxRy9ETER6d1VqYzlmWVIr?=
 =?utf-8?Q?NMFiz9ooX4DkRzte1yx3jLIar?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ed213e-b7a5-4326-7246-08de0c846953
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 07:19:58.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnyJKOqLuFJohSM2bTBpUBJSPFJlTMS5kG+W/sTCJe09/ODPP2xKfe9dwjdslTYI+ZUmtenmsMnmEkm+3vykdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9082



On 10/12/2025 2:32 AM, Marek Vasut wrote:
> Add support for optional allocation of bitstream descriptors from SRAM
> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
> property which points to 'mmio-sram', the driver will attempt to use
> the SRAM instead of DRAM for descriptor allocation, which might improve
> performance.
> 
> This also helps on i.MX95 rev.A with sporadic SLOTn_STATUS IMG_RD_ERR
> bit 11 being triggered during JPEG encoding, which is caused by a bug
> fixed on later SoC revisions. The bug occurs less often when using the
> SRAM for descriptor storage, but is not entirely mitigated. The following
> pipeline triggers the bug when descriptors get allocated from DRAM, the
> pipeline often hangs after a few seconds and the encoder driver indicates
> "timeout, cancel it":
> 
> gst-launch-1.0 videotestsrc ! \
>                 video/x-raw,width=256,height=256,format=YUY2 ! \
>                 queue ! v4l2jpegenc ! queue ! fakesink
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Tested-by: Ming Qian <ming.qian@oss.nxp.com>

> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Ming Qian <ming.qian@oss.nxp.com>
> Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
> V2: - Wrap lines to 100
>      - Update commit message
> ---
>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 70 +++++++++++--------
>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
>   2 files changed, 43 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index df3ccdf767baf..a1e9878ec517f 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -44,6 +44,7 @@
>   #include <linux/module.h>
>   #include <linux/io.h>
>   #include <linux/clk.h>
> +#include <linux/genalloc.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> @@ -783,32 +784,40 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>   	return -1;
>   }
>   
> +static void mxc_jpeg_free(struct mxc_jpeg_dev *jpeg, size_t size, void *addr, dma_addr_t handle)
> +{
> +	if (jpeg->sram_pool)
> +		gen_pool_free(jpeg->sram_pool, (unsigned long)addr, size);
> +	else
> +		dma_free_coherent(jpeg->dev, size, addr, handle);
> +}
> +
>   static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>   {
>   	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> +	mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
> +		      jpeg->slot_data.desc,
> +		      jpeg->slot_data.desc_handle);
>   	jpeg->slot_data.desc = NULL;
>   	jpeg->slot_data.desc_handle = 0;
>   
>   	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> +	mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
> +		      jpeg->slot_data.cfg_desc,
> +		      jpeg->slot_data.cfg_desc_handle);
>   	jpeg->slot_data.cfg_desc_handle = 0;
>   	jpeg->slot_data.cfg_desc = NULL;
>   
>   	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> +	mxc_jpeg_free(jpeg, MXC_JPEG_MAX_CFG_STREAM,
> +		      jpeg->slot_data.cfg_stream_vaddr,
> +		      jpeg->slot_data.cfg_stream_handle);
>   	jpeg->slot_data.cfg_stream_vaddr = NULL;
>   	jpeg->slot_data.cfg_stream_handle = 0;
>   
> -	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
> -			  jpeg->slot_data.cfg_dec_vaddr,
> -			  jpeg->slot_data.cfg_dec_daddr);
> +	mxc_jpeg_free(jpeg, jpeg->slot_data.cfg_dec_size,
> +		      jpeg->slot_data.cfg_dec_vaddr,
> +		      jpeg->slot_data.cfg_dec_daddr);
>   	jpeg->slot_data.cfg_dec_size = 0;
>   	jpeg->slot_data.cfg_dec_vaddr = NULL;
>   	jpeg->slot_data.cfg_dec_daddr = 0;
> @@ -816,6 +825,15 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>   	jpeg->slot_data.used = false;
>   }
>   
> +static struct mxc_jpeg_desc *mxc_jpeg_alloc(struct mxc_jpeg_dev *jpeg, size_t size,
> +					    dma_addr_t *handle)
> +{
> +	if (jpeg->sram_pool)
> +		return gen_pool_dma_zalloc(jpeg->sram_pool, size, handle);
> +	else
> +		return dma_alloc_coherent(jpeg->dev, size, handle, GFP_ATOMIC);
> +}
> +
>   static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>   {
>   	struct mxc_jpeg_desc *desc;
> @@ -826,37 +844,29 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>   		goto skip_alloc; /* already allocated, reuse it */
>   
>   	/* allocate descriptor for decoding/encoding phase */
> -	desc = dma_alloc_coherent(jpeg->dev,
> -				  sizeof(struct mxc_jpeg_desc),
> -				  &jpeg->slot_data.desc_handle,
> -				  GFP_ATOMIC);
> +	desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
> +			      &jpeg->slot_data.desc_handle);
>   	if (!desc)
>   		goto err;
>   	jpeg->slot_data.desc = desc;
>   
>   	/* allocate descriptor for configuration phase (encoder only) */
> -	cfg_desc = dma_alloc_coherent(jpeg->dev,
> -				      sizeof(struct mxc_jpeg_desc),
> -				      &jpeg->slot_data.cfg_desc_handle,
> -				      GFP_ATOMIC);
> +	cfg_desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
> +				  &jpeg->slot_data.cfg_desc_handle);
>   	if (!cfg_desc)
>   		goto err;
>   	jpeg->slot_data.cfg_desc = cfg_desc;
>   
>   	/* allocate configuration stream */
> -	cfg_stm = dma_alloc_coherent(jpeg->dev,
> -				     MXC_JPEG_MAX_CFG_STREAM,
> -				     &jpeg->slot_data.cfg_stream_handle,
> -				     GFP_ATOMIC);
> +	cfg_stm = mxc_jpeg_alloc(jpeg, MXC_JPEG_MAX_CFG_STREAM,
> +				 &jpeg->slot_data.cfg_stream_handle);
>   	if (!cfg_stm)
>   		goto err;
>   	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
>   
>   	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
> -	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
> -							   jpeg->slot_data.cfg_dec_size,
> -							   &jpeg->slot_data.cfg_dec_daddr,
> -							   GFP_ATOMIC);
> +	jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
> +						       &jpeg->slot_data.cfg_dec_daddr);
>   	if (!jpeg->slot_data.cfg_dec_vaddr)
>   		goto err;
>   
> @@ -2888,6 +2898,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>   	jpeg->dev = dev;
>   	jpeg->mode = mode;
>   
> +	/* SRAM pool is optional */
> +	jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	dev_info(dev, "Using DMA descriptor pool in %cRAM\n", jpeg->sram_pool ? 'S' : 'D');
> +
>   	/* Get clocks */
>   	ret = devm_clk_bulk_get_all(&pdev->dev, &jpeg->clks);
>   	if (ret < 0) {
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 44e46face6d1d..9c5b4f053deda 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -141,6 +141,7 @@ struct mxc_jpeg_dev {
>   	int				num_domains;
>   	struct device			**pd_dev;
>   	struct device_link		**pd_link;
> +	struct gen_pool			*sram_pool;
>   };
>   
>   /**


