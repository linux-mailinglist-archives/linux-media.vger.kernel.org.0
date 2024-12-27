Return-Path: <linux-media+bounces-24124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFC9FD177
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668C7188354E
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9C14A4DD;
	Fri, 27 Dec 2024 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="hEa9CiHk"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2134.outbound.protection.outlook.com [40.107.117.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81913DDD3;
	Fri, 27 Dec 2024 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735285219; cv=fail; b=KEKws55O1ExKqNZkQrx9SSpqo00g74TJc5vCnxxT4NJwvaJfxeyKNixJ9hl0OHSrppfUABIqGb2YPIKQQugqueS44eIvvF5iMue4CYoLjucfTYpR896ekkPxTK3plYq6OXE+svXGJ6gGhMIYDw8ZMQBA2AbsurULhb5i/mcfg3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735285219; c=relaxed/simple;
	bh=yfkn/yCpzsK63JtNLZCswSiZ+n3aGRFyelguSiVrRSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uiLSyX2z1NPepePNljGefI2+9V83bQ9e22x5pk9Lz5/5zgu02skyvqjrAWEWJeOeVChV8ugJRwxfSAWca2v6bEU/POVNiVvlFYWREjSwS8j6kbHCXgHcMkqzhi5oxv2+P/SgQMTuioqO8rXKTRVEdJi164kIVUCRvS5Zo19QIAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=hEa9CiHk; arc=fail smtp.client-ip=40.107.117.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UizGT09N1ITwb0eCahi0mSICjZdV3YBllwLjbUAXEfQ4V6yxid+7DBnSLSSoNlObC6Oa3IOCnFPGxivxBmvvQ5GIeDSs2IHuYP63QitKYLOKx5GNEVGwjlzSu8cKluOzDv9M18ABegda664OZdSDzdyY56rN/CX1kh0tZw0VzpFMcYu/jP9hJ9O+yZWGGly1ORLrPdAg2kRyLqAi01M6OpcoU9qrh3oAY56EJOsXYDwJje6UfiG5haMoF9RFxQnC/POTiY1lOXvA0dBKOLcIk0kvvQ0U/g37Pvb8rztkviW7pPOhnAcrMS2e4aEmZCZi7ANWqjMxQObyGyIHjmnAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kOFGcMPL73VfIDvV1n89iQ6e5hZZmppaAckU6bkPjc=;
 b=RgJs9uyGOlYVJRgpdHX6UXdY6GHV+Tzwf2n4DWgzEHflBlW2eK7Bk4sqAPfQ+87mBXEynM7F/rznfb4RLHxRlHg8Het+3h90aIEbw0D/UHG4tH20aG2/oQiMLVd0mmys2O+u38pQZRbSue0jWkt4HE/ZgiG1ZkkfD/rtV+/WzCqGT9JWO5XfogH7FdiWXsMkxbqB8Ne91KupioDQISyDurXa2tt2RnW8XkCW7xuqmAWftlk86dK+SGLNWPbyfyGHgOH/b9ESCSMVcf9Nk6piRZmPalG2DR8PwBNPtYPvbAjkhsqIZ/ukF9Y8abSR8APfMLVz6Ef0cI4cH60jMw1Q4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kOFGcMPL73VfIDvV1n89iQ6e5hZZmppaAckU6bkPjc=;
 b=hEa9CiHkiRbspIuX2vSMYo1E8jQthLeqE9cc99s1RLxh5EWsL1DlPxennvqqEjdsHpD4FGrsiQf9WqP4yhNpykHpxr3NK0yqOrSFIjk+jQ6YgmhddnlFUgtf5cdqrQkDatcirnd7ITsGn7f2Vpyf3DrrVvYbYwOCNaiSvQHIzUFbHtC59NLJu43qxEQhUEvJhf4B56iPcVRF5nI5gYlZx8i8EdcJmoGLolvmC3TTOcgDWmeqMJDEOs/MrxHFt1nqGqntK3bj5OP1mFO6+D7VP9INveeb8JIb0M64vG/2mxFjnMVyNOPygr2qTlpk/HSVg0ecXEPIidPs15d7K8tpWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7649.apcprd03.prod.outlook.com (2603:1096:400:42a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 07:40:15 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 07:40:15 +0000
Message-ID: <917de55c-c16e-4d28-9cef-e56e2fbac77d@amlogic.com>
Date: Fri, 27 Dec 2024 15:40:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-3-c7124e762ff6@amlogic.com>
 <f4dca976-3cce-49e7-bb06-25219623d987@linaro.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <f4dca976-3cce-49e7-bb06-25219623d987@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:820:f::14) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 615afec1-031f-42d5-1d91-08dd2649b433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2F1QTREdFJEVU4yc3YxaW9OOUNnUW13YjlrMkdaQnBZTytGbTdXQWdsSlp2?=
 =?utf-8?B?aDF3ODJaR2EvT1FBVW1QZ0RNb0NPQmpkcEh3MWc2eE9Zdy95RHdkaUdEYUt2?=
 =?utf-8?B?N0hyYmovbXdxS0doYkpEbjhFUWFBZnlqbWNQT1N1dkFtU05hdDRWZFFjYm9v?=
 =?utf-8?B?TTRFbnV3dUJHdk5GVkNKOTdTNTNEQXg5RWVsZXUrZzc4RG4ydjF3MEZKSFc1?=
 =?utf-8?B?bk9JcUg4RHlGTVd4L3Fta0k0K1ZOUWhOclc5SmZZSUs0enh0VW41OTNVWTBs?=
 =?utf-8?B?QjEyaDB4UWd4UUp6SFowSTJrY2xJQlBjTFdqcTRnWFRLTzVya3h4TXNlVEU5?=
 =?utf-8?B?Y1dMSEh6bUxEamI4QkhleFg2VGV2cXFzSnZwZHpXWnhEOC9pSEh2bUkzN1Yy?=
 =?utf-8?B?TnNJTWZQOXRtL1V4RWd6S3k5QVVwVVM5aFFUQVV5aVdCZ05DNml2L1JFb2tZ?=
 =?utf-8?B?TjlNTjVDMGQwK2J5WG1QNk80anB3S3pJK1F3OGIvOHN1VjFzUGlqVE5TT2NX?=
 =?utf-8?B?WmtUSzdVcUV0bGN1czNlWStvRHM4RkFmN2ZsYzBremFBN29nVUhqb0Q1YStl?=
 =?utf-8?B?SFY2ZGNicjc4YndpL3labFRMaFJCL3NKZ2pYOGQ4Q1hWM1JrcGZwSDJZK2J5?=
 =?utf-8?B?WkkzM3JDQkdPNFFhQ2pwY2hVcjg2YVRaMCs0RHlZSWMvYWtOVElZMlNIOHBK?=
 =?utf-8?B?bUxuWGE3TUI1cXhVK3V0TDBnTC96amZLeFBxSUVTQUVZMDZaTGNrNmdzbG5L?=
 =?utf-8?B?TzgwWmRndXBaZ3Y2Wlgvc0VkY2lZNU1WMEpGYWt2SnUzV0xoWS9xYXVqNUVW?=
 =?utf-8?B?T0EyRDNXS3BrSjJnWHc0NWduZmxsKzFUZ0szYng0THd0ZUhDZFVpM3BrL2tN?=
 =?utf-8?B?T1ZQb1pjYWo1eVVjVHZQckU5L1dULzhmOXpWNjN4YzVwaFk4UlNqYnE4NFd4?=
 =?utf-8?B?dHNaOW1NakVwSEFQNEoyc3Eya0lYeStlNlE2M092aXNNQnUvcXpkRVRZSjRJ?=
 =?utf-8?B?VVlZc2hmb2NQRWM1MXdrTC8zK09BRjFuQXdHVEI1VExtUkIxSXYzT0FwYjQx?=
 =?utf-8?B?RFNLaUZoVmtJaWl2OEhPQU0xSHRxUG1tYnA2Q2dQdzBaNGJUZkN5dGJ5eFBm?=
 =?utf-8?B?S24zbG1CQ3FLbVluNUhNa3pHUEJlQmliYm5FTTNubXUvSjdWekptTDRlVS9B?=
 =?utf-8?B?S25ZS3FoNDVRV3QzVmZkY29NenRSUFc0eWYvRWpXMWlOWWE1dnRZK2tGKzJM?=
 =?utf-8?B?ZFBjUFlOWHo4eG0yTFd2Skx4L3lIdmI3NVZ1WEJiN0xmTnlkOXpTNis4SGFM?=
 =?utf-8?B?bGp2d1BrcXlvb2lHZWp0VGt0eHNjYkk1dVVRR1lKVCtOYUs2ZVVyOENXbmw3?=
 =?utf-8?B?R0NlYlkyOWlod0U2YU1ocG03NVZScnYzQnJkNE5ZM3ZrNXhmREJTTCtTUTNa?=
 =?utf-8?B?ZUh3VTM4VlFSSVF0UmlXTC84RnFqWVBReWRqNGlXU3hTUW1WVzNXbWF3TGoy?=
 =?utf-8?B?SldFaGkyZlVTK0FYVXdzV0VkN0l5bE9WMWVVVHB3bHBrY0Q2VUFUU24wRmRv?=
 =?utf-8?B?L280SW1MTlJGVUNEWTVLL21xamxKdDl5Q29YRjNqMTdPZXNJTk1HYURIK2hk?=
 =?utf-8?B?SGVHOXprYVpwcXNCM3hrR1VOVGJUd0xUVnd5UktDMHVXcDVpcGlIWU1XKy9W?=
 =?utf-8?B?R20xaXNMTjFVV2cxK0MvVThoMkVEa0J0Qi9DeFJZOW9pUUZ4TnFUUVpYWHhp?=
 =?utf-8?B?bjZ4NWo2bDdjbmlXeWZRMVh6aEUraHQvM3p3M0VBaEpJZlZTR1Y3MUV5cHZm?=
 =?utf-8?B?S2FqUlovWDFlNzhIZXY5QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUdERVlRa0ZmMGM0MGxMNE9ic1FiUldhTmRMcndaaGNkU2w1TTZ5cEpyeVkx?=
 =?utf-8?B?NnFyRHE3Nm5OT1B4ODFaZUlIWnNUbERWQW4vYU1SVnZxSmdMYmxJWk5oMktk?=
 =?utf-8?B?ZUFiYVNkQnRuS1hTUFJlb3NBT1V5QmN2c3gzM3R3a21rdWJrdUtZRHdkc1pP?=
 =?utf-8?B?eG1SZmc0YVRTeGFzc0FlOUNpL1lkb0lERTcvcUFxZkh0SmJvcGFMdmhRbHpH?=
 =?utf-8?B?bGxHMEEwRG9FRnI4ZGVpWWNSeGx6ZVdyQm5talpwcEdlc2NCUTBVME5MN2FW?=
 =?utf-8?B?MGVKd212OUhOYkhLSmVIM1JDbGE0ZjIrd1FqMkNJRU9RSlRnaU1DSmhkUXg1?=
 =?utf-8?B?NnFVUW9ZSG56alE2U1o0MjVsaTlONkdRR2U0cTlhQmJ2dXVyLzVKNDNwbzdJ?=
 =?utf-8?B?U2tHWHhhTmZsK0VLRHRTbHNCdVBwQVllU1dIWGVpZjd3cEhZNkRHVGY0TEpz?=
 =?utf-8?B?Tkd1UndKVEJVT0dKUEI0YUtDZ3NTZ1l6c0xWcyt3bjRTYmNSNlVadmQ0eEtK?=
 =?utf-8?B?NCtLc0FQSlBtUEpzKytYMUExL3RGeHd3dlZ3aHdESVI1U1RoeHhMSEtaeGxE?=
 =?utf-8?B?bEtsQWtNSGl5ODZPdm9zZ09iNHBoZGZ0dkVCQUlGVWNGVkNiZmJtYWc0aitW?=
 =?utf-8?B?QXp2RmdTWVV4ZGdiTGl2MGhXQTljMWVGd0tjSHN5Z2kxTlNyTU5zUC8vVDY2?=
 =?utf-8?B?M2dWSm1uSFFPRTA1WXYxWUJhdzcxUlQ4TVc4SkVPaUc3eVFxZ0R6dVhvVVhV?=
 =?utf-8?B?eERMMVFMWWc5SUNlV1M1blExVzZ5R0RYVnJCYUdiNG9NQUNBYzBIRjdKSU9H?=
 =?utf-8?B?Ym5KZlVheG5Vc3hsNElzMm0rSTN3NVNQODJ3MUtnYndZcko4SmlyeklaZWJS?=
 =?utf-8?B?VXV5bTNXZjB0MDRvZ1E3anlPZFQ1R3dlSU13d2Y3NTVmYkJJbHNKTjFzTFhC?=
 =?utf-8?B?bkQ4R1c3SUdTak5sVGZtczdsek1INkdMd3VqRmZLRlpiNWtOUzFpcWxFUkFL?=
 =?utf-8?B?K1RPam1QbUtXUllPWnNtSUQ0dVNIUFFnUG5vSUc4QmYyZjZiaFRHSVRzUUR4?=
 =?utf-8?B?dThnVkZzQW12WGJtM1RZb1oxVm5ndmZkdFo5TGhCeUxMWDBRalBNSzgxNXN0?=
 =?utf-8?B?bWVySzFIS3lndkFpRytpN2ZrV0ZtNWdpWGQxS1hKTUNTejB2ZW8vOWN6elBt?=
 =?utf-8?B?SHpVTjhJT2dsQlhUeG5JV05yeERPR21ySXpxS3ZDM2R3OWhCWXFtUTBObmsv?=
 =?utf-8?B?bWJ1V1liS1BXV0llMWU3czRCZjNITFBHS3prcHQvcktIUmhOMGZ6QkNSVmlP?=
 =?utf-8?B?Tk04M0piamlhRUFiSlJSNks0clhxSjM4SkFhVU0xMmJlaHhNWE15V0ZSRjRh?=
 =?utf-8?B?VFNmV1NKTHJDRVk3WFlvVXNRcjBPL20vWWpCN0ExMXdMdElybytYNGNEUitT?=
 =?utf-8?B?QnpHWUpWZFB5bFpVdllFNk1nQlRxa3VuVzc1QkVJRjBoWDRCemwzNW1yU2Zh?=
 =?utf-8?B?dGJ1MzhMbkJGVjR0L1VSYURYU1ZRdmpYcExaVkFRSFJzai83bGpvQnUxd3lp?=
 =?utf-8?B?RlJVMVZnaFp0OUNJOVJnVVZLRnRUS2xXaTZIS1ppQ1VFVGNjL3IvRllHbVYr?=
 =?utf-8?B?UkNqeWY1YjlYd3FVQWpuNDhhZjlxYXIzcHB6VHh2bFZRbENVQ2V0S3RYSE1o?=
 =?utf-8?B?WktIVFJkZDZGZjVSWW9WUFNTQ0tvV05oaEp4VFU4dFpjZHY2QWowUXd5S0VY?=
 =?utf-8?B?dmZEcXVnUUl6dklTUm9qSHpyK1BteEZHQzZISUZiRkRBY0hoTWRLYTRqMThR?=
 =?utf-8?B?RlRhNzdFbm9yS0QyK3NMQ0c4L0pZT09Jb1orRGpQV1VUbUdETDQxbHY0VTZi?=
 =?utf-8?B?TU52MkV1OGNxNmlBb1lTRGt1YS8yUHRjRCsyUGRKNGQwZVd6Z1M0MjY5RjI4?=
 =?utf-8?B?T0tGZlUrNUxDakpuVkN2ZmpQazBERlNZVDI0Q1Ayd3FFYWRDUzI4RGs0VjFB?=
 =?utf-8?B?eEJJSnRaMFNRTnJGMnBUSENUdkZ0d3B6bGdLeTNwbWNDR3F5WWxUMTRYaUZT?=
 =?utf-8?B?M1FqWnp3WXJpdTV0c3h2UDJ0ejhLY2JzNlF2N25KU1FsYktjZHQxa2xValVZ?=
 =?utf-8?Q?YS9dfTO9bTh4yl6Nfvhpq+lLa?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615afec1-031f-42d5-1d91-08dd2649b433
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 07:40:15.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZsy8m/hUrMVLFC/a7iHArGiyt69ll73NCEWf/l0LkkF36auH1ImANScZiJkwskKFrMrHnEIGsbXj4AbNDDGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7649

Hi Krzysztof

Thanks for your reply

On 2024/12/27 15:20, Krzysztof Kozlowski wrote:
> [You don't often get email from krzysztof.kozlowski@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> c3-mipi-adapter is used to organize mipi data and
>> send raw data to ISP module.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 115 +++++++++++++++++++++
>>   MAINTAINERS                                        |   6 ++
>>   2 files changed, 121 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
>> new file mode 100644
>> index 000000000000..1105fee2d7a8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic C3 MIPI adapter receiver
>> +
>> +maintainers:
>> +  - Keke Li <keke.li@amlogic.com>
>> +
>> +description:
>> +  MIPI adapter is used to convert the MIPI CSI-2 data
>> +  into an ISP supported data format.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,c3-mipi-adapter
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: top
>> +      - const: fd
>> +      - const: rd
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vapb
>> +      - const: isp0
>> +
>> +  assigned-clocks: true
>> +
>> +  assigned-clock-rates: true
> NAK. Drop my review tag. You cannot keep someone's review while making
> significant changes. Please carefully read submitting patches before
> next posting.


OK, I see

Thanks!

>
> Best regards,
> Krzysztof

