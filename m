Return-Path: <linux-media+bounces-27021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BFA45B13
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7716188812B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B511B2459C0;
	Wed, 26 Feb 2025 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IW8PfmyF"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013061.outbound.protection.outlook.com [52.101.67.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A01A2860;
	Wed, 26 Feb 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564082; cv=fail; b=uJ8gnfI0N995iVL+9FkyCcGstD/XrP+0CFbf+ZzGPzkgb+DCIjhBRwjTT9gfER9Dn4DlGOAM0lPrKGcySeNOleGlLI7Bj8V9LJtBZb6gYOd0wsqLD4R8lBGyGxTIOfnhfBg+bOs3biyMSLJH9SxRb/iezpzzJhzq8Fh0HEvNiY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564082; c=relaxed/simple;
	bh=draE6GvM2K5MabRbCXV2k6D621y6j5Tz/CKH+LYcPoQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ngNZIztBcZ772Y99oLHl/ys02lzWVWn11RrJ5VS3hru7i2dgXMP7H2q6lqjqMVCUbA/vOHFIZRVXmjonimqXN5/HIyUjABnPWWXJVcFUBqlS6KngeIeMf3nj6dxqFliUuMxolGqPsm48ACabGkaT6bU7wqhD8FW0dBXPs6ihRfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IW8PfmyF; arc=fail smtp.client-ip=52.101.67.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIfvsN0uE6j0IMwsmLiHfNvZxlRhEUCEGBdGiZTmFiVIXsg10LcNbqbOo6AodqgVZcVAA+14uX4VKasMOIGIBDyILqX2gfcWhCjUjyU5vmcUYf7lz6P/3KQaEcinz90xYlIJ+me+q+E5ixQROEWguCpvVws+CQ0g26rde/M/bbbrdCrMR35IH5T3QZ0b0rj86q15FrCYED/0iDilhtpFf57+qvcTtFnHqa0Mt1EreReVZ2ekWgwIRkF6aeEBzwF5JekrFtXBZylbNphIfJyNzdwQ2kcBp1Btt9kdV7uyiGARXO7P8j8B1gadHXmvlBlIiysXYFDLYfLwxJiLQViGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe4tLjaLbeEncaaXWPQSkDfmQPxGeKrT36PD4+ovozE=;
 b=ECoJUdlSL6HzFcR7S9VvIdU9cHJSL5DiifXTuX9si5DVf/rsSXa6v6z+/+JRmGd+yD7i+eamNi4FVC8gfACLBUs3gQPKF5PZ/ke8oa/LvxaL7LuJGu7aLphIdTzhe3jSzDSy4+ZtC67kv8yWkzz+ifb4G+nN/7o1Slz6POEYv+yl1GWFuBIDQB0j/miO6g4fovkaDLsVWVpQ4SIiaUHagzI5fZm9hLs++KM3EWjtrkQzrwlJ0WYggTfZ6TbC3W7ZOyetizX3ktIixthxyS/ixtbRMU992W90QycxJzZ9RhTd6Jx3MI1JIAnVHh8I0bDSPf2naTilkq4GYdEj89oQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe4tLjaLbeEncaaXWPQSkDfmQPxGeKrT36PD4+ovozE=;
 b=IW8PfmyF72UT7eGthtKwNS6FmlqLCzeYgydVCL7KLBjSz4b7VYG6Zil8+qXeX1avV8hvqGsIF+qoVHLorGArdYyogx77VBvbRWLZh9NzvHF0App9TmfHJuCGh1cUGQuWkbiU7zoP+NuQ8BABvMMsTFPtv0zIeeXuTEIrWunA5MHImWLKFZS8B3YZVMoaLvbzX8ZErNtk09zhA5Y0UBVYU8/QWo9UdzfHfqFOaHGPtaleF3O9HEjABx+pGqofFEXI9kT13YfJ5M0W901sTQh/eCfa/+qrsqADW+lZ6P2iDO2gVykLeMjVI2RbNrzM3Qsu89At113P8PKxJun0glG9Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU0PR04MB9225.eurprd04.prod.outlook.com (2603:10a6:10:350::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 10:01:16 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 10:01:15 +0000
Message-ID: <867dc64b-15cc-46bd-89db-b63ffdb6c186@oss.nxp.com>
Date: Wed, 26 Feb 2025 18:01:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250117075720.4018076-1-ming.qian@oss.nxp.com>
 <20250226094545.byr2b3p26w5vit63@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250226094545.byr2b3p26w5vit63@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU0PR04MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: cd545131-4918-4fe2-9e61-08dd564c81ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVNnK1pROGZ5SnpBT1pUOU45RGtDeVhXSUNsMHBrWlF3aGlFWEIzTU5NbHpV?=
 =?utf-8?B?UHJWaEVFazZKVitVendRQnFJTGltclhVMGJkZzVjdzBtaUlXRVNyL3ZOejd5?=
 =?utf-8?B?M2k0YWR2WVlDb0c2cUFUYzIxcUdnMncvRlhxYW14ckN6N0RHR2lBdXhFazZz?=
 =?utf-8?B?d20zWmRqVHM1aFBUcGUybnl0YkRHL2pQcnJlRmczTjl0Ujg2Y25RMW9FL2tJ?=
 =?utf-8?B?VHNvMmQveHZtalJva2s4TFFkQzFEeldOWFpiaW9pZmNuaHFCMTFTUkFidkVZ?=
 =?utf-8?B?TXArMjVPbnp0dUpQK0xGNmRWdVR6c3lyR0MwVHdlZ013N0ZlR21TQlJuM3J4?=
 =?utf-8?B?N3A5TDhiWDkzYi92RDdiM0dZK2pmay9FaXhkUlJRaitJdlFGdktFb2hmRkZ0?=
 =?utf-8?B?RWdZZkVLbUVMdDI4Yi9wdndvWDJnNE5nUWVzUFpoNngyUytSVVRrNTFZY3Q0?=
 =?utf-8?B?TmpvQlcramdNdVdyWGhpMkVaK0VLR3BMYjMybW9BOEFYeTNnWDVWMFBIU1pD?=
 =?utf-8?B?SzNIQ1d1MWpLZktWQWwweHNEVTJXMHcrSlY1UW5qUDVDMWFWVkpndDFhRmFD?=
 =?utf-8?B?SXptMFZDb1JIVmJqeHBSZHJpTzRQY2ZxeGJpMzZIbUh6d3dwN29yWFhYTDBN?=
 =?utf-8?B?blBOeldTQndRMWlhTytOQ25keVh4cTdhUGliTmFTVUdjNHVYVnp2Q3QxU3c3?=
 =?utf-8?B?ZE12dkFSNjVmSUI1azhQY3lOVkZFYWxUMlA4Y2xhaEprVHZuWUI1Si9YbERI?=
 =?utf-8?B?cGtGd2tsUm9DdTZJa2xUUlZEdkdDckpOMzN0VGk5SVpMRVk3REdUMVk5Wldi?=
 =?utf-8?B?MVZiQVFySGtaektIN0tOV1d4a0F5QTFVMHhDb1NYK1djMEJLekgyaHlESEpl?=
 =?utf-8?B?YjNHNnY1bHhXdFhRSEtCY0FkZlZDVDl6UHR5eXZJVDh5Z3ozT0NPY3hEajBx?=
 =?utf-8?B?empRSlIzQ1pGU3dXQXlRZ2hKcS9VZWhrY2xNYllPOUxhanpSaXNVKzE5ckRM?=
 =?utf-8?B?SHpwTnJkWW4xcG1RUUdIMlBLWFRJQ1dPWGkyV1NmTDNBNGxyckI1RmI5OEo0?=
 =?utf-8?B?VUN1cG5CNnd2UDJJMmF1c0syS05SVVUwOUVJeXRSUG9jSzZFTzdUNkwvd2Iw?=
 =?utf-8?B?VzEvSVU3N3ZjZmZndVA5SlIyaEQ0RW4xSzNpQ1pqTGtWVEJyTXlYT1pUN2JV?=
 =?utf-8?B?bUxGTEI0blF6L08rZHFma3NnN1A5bmE1YkxzbkhJOTFSQWtOUXRodTdxY3lQ?=
 =?utf-8?B?aHBNcHhPWUhQTFJ2aFlkSlBoR2E3TFFLVnVSeDl4ME5VQURUZW1iK2dwa0Nw?=
 =?utf-8?B?NkpiN3VYNWRPY29XUWRiNjFaKzBkVzR2Q25YSVZEdzZUb3FRaUIweW0wQnlq?=
 =?utf-8?B?MEQ0Q2kvb0Z2TGVvdFlia3BFWUZURDBTYWt3VWtJOTZIbDZHNWJvWHIrYllt?=
 =?utf-8?B?RkFKM1kwdGZRL1BqUmVZc1g0a2l4SFE1VnV5K3VCb2RpRFcwTHhRZTNYdW9y?=
 =?utf-8?B?T3ZneTVYQll0OU8yOTBWNm15Skx4TnlOY1JHZXBvWURLK3I0YmlKVndnVlR0?=
 =?utf-8?B?THdyZnpxYlZkK0RlT1NZdFpqenlXVHBJc0FhRy9ENXorR2h4c3I2dk4vclBj?=
 =?utf-8?B?ajIwRGMyelI5endYSTJ5dld1ak14emEySzBDSVhlUXM4bHBRTkQwU0VBMGly?=
 =?utf-8?B?M2JjU1NDVFp0Mk85SjhKcEJSTnYrNi91SUp1MTNFYnREMEtUbVZIWEdJOSsz?=
 =?utf-8?B?bElSNitHd0xiemxCY2h3WGVPL3JWV3g3WVVVMEF4dmUzTTJ4c2JIRlY5Tnk2?=
 =?utf-8?B?ZElEVTdkL2s4RHFobmhqNVJIZWM1aWVia01nblRZd0VKZXF5YzUxanp6OHJE?=
 =?utf-8?Q?+IxWy0Unm15sR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJyb2hhTmIwUHRSenhTTXZlYTR6ckxvUWFwNFRQYUdyZWR5WU1ieFZPRm9D?=
 =?utf-8?B?WEtwSHBKbzE1Nm4yUmk5M09BY2hIRExHVkU5U2h4V1RIc3NSYTJpd2tNdnRa?=
 =?utf-8?B?dzdITW5YZVYxRDVoQVpnVFNhRk0zTTdoZ0MvYTh6N0lxelVtQkh1NTVYeFFa?=
 =?utf-8?B?RlNlTEVPcE9EVHRiRGpPSVNrS0l5TXpXV20zbEVBV1owZWh0bGh3elJPVSth?=
 =?utf-8?B?Sm93amlyTFAzTlpzNk5Ic216L1BjeDlTYmtZTmhzQThVWllnLzQyQk5VMU9X?=
 =?utf-8?B?bEtmMkp4VElCL1IvVnc0TSthWDdXQmdQelo1WUU4N2s5SWlOMjM1dHRwWnVs?=
 =?utf-8?B?dG9EcDM4TGwvZ2srSFM3ai80c1N4SWtGdTdBUkZaNDFPVTllSTBJK3ZBNktJ?=
 =?utf-8?B?K013cDNEeDhncXN0cU1oTDVzZW4xcEp5cHdJU0ZGTHZ3TnNGNi9Oc2NaWDBl?=
 =?utf-8?B?S2oyRjg2bXNXN09HUFFRdks3STgzbHl6ZlUxT3N5ZjBvRzQrcFNOWWxjTTM2?=
 =?utf-8?B?NllVSGsrL0Jid2dCV2swaURncVhjczYxd3pxNytDZU11NEVhd24yOFd4MGp3?=
 =?utf-8?B?M2kyeUpJL2FPeDVrNDc1QzhTYUZWQmd2em9aeEFrT3dSVVlFSXZtTG13Mk85?=
 =?utf-8?B?SWpPOGErZ2gyUHBNQUFqaEdxZjRLV2ozbVcwVVR3dzNZREd3N0d5R29MNG16?=
 =?utf-8?B?SmVoZFlNQjBNa0J2dXByYS83emxDcU16cGRPa00zSVN5YlM3TWZKVjdFOXRk?=
 =?utf-8?B?ZS9oTEdRdXd5dUtEYmRGdU1kb2Jyakl0aDllQlg0THd5VUdPenhHa0hxcnlh?=
 =?utf-8?B?WXNZMTJjN1ZtQ21CQ0FwWGExNUQrVWpxdUswUy9DNXh6K0FkREViaVdESUFS?=
 =?utf-8?B?a21PSE9taitYMUNkQ2g4N1VMWHNIZ0IwNEdiTHJreGsvcVA1TmtnbHVCa2JQ?=
 =?utf-8?B?SVc5NGNYdExNdXF2TExXVlZHOEV4aU5nUG5abEVJUm1SZjk0U2R6NVJiRjlV?=
 =?utf-8?B?dWZ1dUlyQW0wcjR1eWVvdjIvM0RxN2tmK2lWcjJtdkNyK1o0QUtnem1VbTJx?=
 =?utf-8?B?SkxLYlk2bHNaUklvZ01DV3hwemlURGZMYmdGSVpndUhUK1pKbUNXVG1PL25Y?=
 =?utf-8?B?UnBQWUNhVlh4enR3dnVnZ3IyRGVTdjhMUnEwQzJqTWZ4NUFNdWdTUUtyMjdI?=
 =?utf-8?B?QzYzSzVSQTU0eFBralVPay9TSGN4L0FXaTRCUTcyS1lZcGw3VW1EelNFY0JH?=
 =?utf-8?B?YnVZMFQveml0ZGZCSk1nT1ViYjJiMDE4eE54SHRaaXBRWGV4TGYxTFlMRTYv?=
 =?utf-8?B?WVJDYWdOZmNodnNCTTlLSmxPd3UwTjJ2NTNqRXBYYm4wZThMRVQ1Wk1SL1dO?=
 =?utf-8?B?MndXaFZ5bXVSbU55c3R0bENuZXU3MFcvWkFlWTAxSi85VmdIbXAvejBUODc4?=
 =?utf-8?B?alpqOG5rUGZTZzN6VExaZG9tS1c3blVuTzVEaFFFZkpjWUNzanBBNTNEaXhD?=
 =?utf-8?B?VEErdFpzQjJOaGUrNXliUGVhdDgyZllTTHUzUW03bDltd3c2ZEc0QlVCS3Rj?=
 =?utf-8?B?VFg2aGhGS2tWWTZEVjcvUUNjem1CU1RFamprM0NFM2w4NlQyS0FqcHlvYkpj?=
 =?utf-8?B?R0Y3a25hWU1tRG9GWVZzdHdmbGs2Z045dDVLRHpGeTE2c2xKQ2R2enpjTk0z?=
 =?utf-8?B?dVM5dUl3cWdFcENEVlBKdWFMV2tFUk9tK3k5WVRWK2dCdUFWeVN6dnE2Lzhw?=
 =?utf-8?B?bUNiSkZVYUYzdTdnNkxjaFB3MXV2VzBDMTNtSGZmWDBndWIvOXo2UUpUaEVj?=
 =?utf-8?B?elNJaDhybjZCSVkvb0J1eVhXVWR5MENmZUw3c0dhMjVDSWxuSHRqdjdObHd5?=
 =?utf-8?B?MjZJRmhUU2l3YVNITFAyU0pxL0Yrd1VGNStHMHBiTXJGTnkybEhIY1E3TTBU?=
 =?utf-8?B?a0lkV283VzlMQ0pTelVTVWNnckIvNFkrakRuMnpUWUNnYWhNVVlubVdKSnhy?=
 =?utf-8?B?aDVDa3NVQ2pSMkVpQWt6czVCSVZFdiszZFRNaXE5YWxINnhSR0w3MklTZUJi?=
 =?utf-8?B?QzVhcHlJM284amVQanZsd0hEMjR4MldYMG0yQ2FxbzkzRFE3Z1VCVmpvSW1u?=
 =?utf-8?Q?qfy+szNVw0q8VfJUgdL5G7Cyq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd545131-4918-4fe2-9e61-08dd564c81ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:01:15.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xINt6UdxPm4Y00YrBh+VJM2IRkKAishDj6pn7ukoAXxI82wuo+nsYoncCmb3zZTgEDEg1ZmsI1sqnxZoIaa80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9225


Hi Sebastian,

On 2025/2/26 17:45, Sebastian Fricke wrote:
> [You don't often get email from sebastian.fricke@collabora.com. Learn 
> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hey Ming,
> 
> thank you for the patch!
> 
> On 17.01.2025 16:57, Ming Qian wrote:
>> The amphion decoder firmware supports low latency flush mode for
>> HEVC format since v1.9.0, it can help reduce the decoding latency by
>> appending some padding data after every frame, then driver can enable
>> this feature when the display delay 0 is enabled.
> 
> I see that you already changed the commit message for this version, but
> I still have a few recommendations for the description:
> 
>      The amphion decoder firmware supports a low latency flush mode for
>      the HEVC format since v1.9.0. This feature, which is enabled when
>      the display delay is set to 0, can help to reduce the decoding
>      latency by appending some padding data to every frame.
> 
> The rest looks good to me.

Thanks for your feedback, I'm preparing the v3 patch, and it will follow
your advice.

Thanks,
Ming

> 
> Regards,
> Sebastian
> 
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v2
>> - Improve commit message
>> - Add firmware version check
>>
>> drivers/media/platform/amphion/vpu_malone.c | 22 ++++++++++++++++++---
>> 1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c 
>> b/drivers/media/platform/amphion/vpu_malone.c
>> index 5c6b2a841b6f..1d9e10d9bec1 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -68,6 +68,9 @@
>>
>> #define MALONE_DEC_FMT_RV_MASK                        BIT(21)
>>
>> +#define MALONE_VERSION_MASK                   0xFFFFF
>> +#define MALONE_MIN_VERSION_HEVC_BUFFLUSH      (((1 << 16) | (9 << 8) 
>> | 0) & MALONE_VERSION_MASK)
>> +
>> enum vpu_malone_stream_input_mode {
>>       INVALID_MODE = 0,
>>       FRAME_LVL,
>> @@ -332,6 +335,8 @@ struct vpu_dec_ctrl {
>>       u32 buf_addr[VID_API_NUM_STREAMS];
>> };
>>
>> +static const struct malone_padding_scode *get_padding_scode(u32 type, 
>> u32 fmt);
>> +
>> u32 vpu_malone_get_data_size(void)
>> {
>>       return sizeof(struct vpu_dec_ctrl);
>> @@ -654,9 +659,16 @@ static int vpu_malone_set_params(struct 
>> vpu_shared_addr *shared,
>>               hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>>       }
>>
>> -      hc->codec_param[instance].disp_imm = 
>> params->display_delay_enable ? 1 : 0;
>> -      if (malone_format != MALONE_FMT_AVC)
>> +      if (params->display_delay_enable &&
>> +          get_padding_scode(SCODE_PADDING_BUFFLUSH, 
>> params->codec_format))
>> +              hc->codec_param[instance].disp_imm = 1;
>> +      else
>>               hc->codec_param[instance].disp_imm = 0;
>> +
>> +      if (params->codec_format == V4L2_PIX_FMT_HEVC &&
>> +          (iface->fw_version & MALONE_VERSION_MASK) < 
>> MALONE_MIN_VERSION_HEVC_BUFFLUSH)
>> +              hc->codec_param[instance].disp_imm = 0;
>> +
>>       hc->codec_param[instance].dbglog_enable = 0;
>>       iface->dbglog_desc.level = 0;
>>
>> @@ -1024,6 +1036,7 @@ static const struct malone_padding_scode 
>> padding_scodes[] = {
>>       {SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>>       {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 
>> 0x0}},
>>       {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 
>> 0x0}},
>> +      {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 
>> 0x20}},
>> };
>>
>> static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>> @@ -1058,8 +1071,11 @@ static int vpu_malone_add_padding_scode(struct 
>> vpu_buffer *stream_buffer,
>>       int ret;
>>
>>       ps = get_padding_scode(scode_type, pixelformat);
>> -      if (!ps)
>> +      if (!ps) {
>> +              if (scode_type == SCODE_PADDING_BUFFLUSH)
>> +                      return 0;
>>               return -EINVAL;
>> +      }
>>
>>       wptr = readl(&str_buf->wptr);
>>       if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + 
>> stream_buffer->length)
>> -- 
>> 2.43.0-rc1
>>
>>

