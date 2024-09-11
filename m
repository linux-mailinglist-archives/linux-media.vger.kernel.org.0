Return-Path: <linux-media+bounces-18141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EA97484E
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 04:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D0271C24460
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 02:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA26273FC;
	Wed, 11 Sep 2024 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="VHs3NiFJ"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2092.outbound.protection.outlook.com [40.107.215.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADFABA34;
	Wed, 11 Sep 2024 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726022730; cv=fail; b=fFRjVqNW+3SlUy8x5uLzlOp78k5B2bbfNS1WPggs8JJTsH/kwjcEE6JHqmi/dz1eeNMK+V/a1mjrVegaQOAkP+19h2VUR783UqsbprxRy1+anaD2MEVfBCnS/aE/w3+BH1xQjgDZ+t/2UJ+3W0G5AXj3HC/3hmZ1WJcwlZsCJc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726022730; c=relaxed/simple;
	bh=FGokfGnAowlYmv2tiAg+TCBR6eGE2VHcXUGoBCoNi/8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pRWwiQ0GdXXvqxN4rikGmdSqfU4hXcYZ5kAhrL5h1aVGiKS69phI9X2sh1/SnEuPSgdIzKN0njHmfcVYWx+R5wvy9xMbJyHnH4BicTqUQVtCX/ArKUd+OBq/EIq9Ax2MbTULl3DSnkTrGrv0gSnirhD52m7SUSd2uPmjlHLSvJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=VHs3NiFJ; arc=fail smtp.client-ip=40.107.215.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjplGdJzOybh7SrvmQoBPxvFaSuYweFMJfPMGEtE2zAIGSe7JeJRRq60ytn6Gt9vo/wCVRx/Nq76wn3JEouy9rr+Z4+mWEOrMgCCePChnbE6F+E4h70iofjNgmjmsO8vqQGs0gUAxrx8VvX0V4AAdTwPiFAsFlmeh90QhJsn9YLjjhX1wOfbEHwWo7/S3xpUslu+XbRsCGwS+ux/aQTtDjotGOll2lTqGV19cZImxQGJ8J4qI6uiifU/e2/KFvKeAdcwwjgEX12ILFnd+3o1kaVklafClbwLTuks3vHAZVtBseCME3DIR7dNq98p0fecgAfDItppsQDLXkJc1POQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dELYq/MDItpAK+ZBeC6nqNy1s2eGIk5XVTcaU7GkYjA=;
 b=dwBUn3i0XV1JcTM6rNicMKl/krV0xxOwVl16hrk/Tee8vXD554cfXfdCR0NbxC5pVCpyBYsEQS9OLcAC/fXXUomzn41DYOVWFWg4IXB7U/qyhzKdFNMUZnH5OO35/dxwbEtPZc+1tJiIRhHrRFaKYX1YobHSiOMS0a8kqqj/m5pvvuf8hCOaoXq4rXhGaPGF5s6ggNCHN+auR0qzvs9qz242Do/eHUF8LNyphLYgOPynTnRO9777jNLMsZ7px38wJGoxl38aeV8vdNbBjPLcRgUWIKUnxdg3aaECzSsfI6drW2dtxD8PcSMfo+4N+Lpj3SdIR/7KaCsz+MfXL0rzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dELYq/MDItpAK+ZBeC6nqNy1s2eGIk5XVTcaU7GkYjA=;
 b=VHs3NiFJjSGgKmdptF+c8OfolsEriGjQDALkY5EZwNVagDp1GoMMCusa9pBZdQ48OZ1faM4F/5vTYqkKsB7fB13CWhBNcn6DHBljoTeO66dpYSnwALrXkV9Xd2d4MQQq8aL9ELE/YGWqOSDvF8usQnecJmpAZ972I4F6RSWsdQaZPMU8FKVOqwSAg0ajuvSMDM54sd4Bj4NBq80FYrAboyR6FZLlHkacJGnDW3LyzR/y9nO2Eiy8IRL+GFlrryZ7el7CsQ5Fjzr33V/ARrA5DWbn4KrERR/IIPWJbRmi2dTVIBfECsaZA+Bb6YTxYARFkI+5gcJnqrz0pJBCpT3F4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by KL1PR03MB7937.apcprd03.prod.outlook.com (2603:1096:820:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 02:45:22 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 02:45:22 +0000
Message-ID: <26c0c7c0-23d3-40a0-816d-1d4ebbe2beea@amlogic.com>
Date: Wed, 11 Sep 2024 10:45:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] media: platform: Add c3 mipi csi2 driver
To: Dan Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <20240909-c3isp-v2-2-3c866a1cea56@amlogic.com>
 <7bffa45c-e20d-4e0d-8b5d-928d0016e5af@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <7bffa45c-e20d-4e0d-8b5d-928d0016e5af@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0224.apcprd06.prod.outlook.com
 (2603:1096:4:68::32) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|KL1PR03MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: f90eb090-c3b6-44fe-2cb4-08dcd20bc7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGpiYk52VUJ2NWdhUmJwampPTVA1dFdhUVB4TVZDRzM2VThyM3IzY2dWZmoy?=
 =?utf-8?B?TWFGajBrVWo0Tm9ic2lLdXoydVowRXBVOWd3eVNjbXNxSGQwNENjcGJ2S1A4?=
 =?utf-8?B?ZGlyVVFaeUMyYi9ESkwwWDBGQWFiamtvYlFpbTBVeXVFTnVSaWdwdDJCdVlL?=
 =?utf-8?B?d0FJUkhxQ0h1RmFsclFLWmY3RHUrejVKTFJOekZYOXp0TEdVRVA2MjE1ekph?=
 =?utf-8?B?NkNTQnc1dUF2L1dYQ3VjdW8zYjhNZzZZYnF2TG1xdFdVUWMrdmFrQWRkaVFq?=
 =?utf-8?B?QXNESkJQRWIwVWNBb1VQNlg1NzFSbDFvYzdseXhmVEtVSytHS2pYTnByNW10?=
 =?utf-8?B?Q29qQUJCRGdmZWdzU1N6Nm56UVNEZWJRanVYR1FPVm1obmxqdkNiTGh5dndi?=
 =?utf-8?B?U0hXR0VucU45U2NYL3lMQWhQUCt3dTlPU01SV29DUDd6MlVHb3U0SzRBaG9m?=
 =?utf-8?B?bWI4U0ZQZzB5cHhITWhtVGc5WDByaDBoYUNvMFZRaU1ic2xva2ZpdFA0SUhU?=
 =?utf-8?B?dTZJT3VwcXkxWXVqVHlIR0N0dlRROXZnMzZIbFJQRnFrSCtvekZzSG1lY2xH?=
 =?utf-8?B?YUZvdlJGZU1RcUVRellkSmVkYTFZbzNsSGlaOE1OUWt3bUhxWldMOGc1em9F?=
 =?utf-8?B?cE9yRjNVazV5a1E0Y2gxcUhnd1h5bFpUN3lHWXQ3RWNweGhrWUlqcFVQSi84?=
 =?utf-8?B?eGU4YXY3K0Q0VkVBaGF2QXFVc3hmbStuT1Zvc3puSDVrWWN4bkpqMEdTYkRC?=
 =?utf-8?B?cVJPcW1RRWpKd2t2UzNSZENXY0I3OGVoVGRhU1dEblhrblllUzJtZFJiVFpY?=
 =?utf-8?B?Z3F2NEJEMkR6OWJEcjNXU01tMUl6VmI0V0p4LzloVHlFKzJCYjFsU1VueUpo?=
 =?utf-8?B?b1VhbGNpemhiTWp2RjIyeWRob1dZU3ZoUHpFVTE3blhrbUZDRk4xMlA0UkFB?=
 =?utf-8?B?K2txRGRGWlJCUlBuamtibHNrVDczeVRIT3pvTnFLNFdSeW51QVAyK1FnRkZX?=
 =?utf-8?B?UUNab2hoM3lFcWxSc3YxdXhvTnA5eThOUXFKajNLU3Z1MUZiMVhUdDhoa2xu?=
 =?utf-8?B?WlZXbzlIUnBNd3doNFMzMDluNTROUWFqUlFNeWM2Mi9FSi9vaUJ5Q2E0cW03?=
 =?utf-8?B?S0N1cDJJYnpYMGVxeG1TZVU5WEMrbjhhSXpKaitSQnB6czgxV3RQenBJQ0tR?=
 =?utf-8?B?aWVjVGVkc2s4Mm9uUENqSC8zVks0bGVKOGtldU1rbUJFdnRqMGpLNGlNVFVF?=
 =?utf-8?B?NHVlajg5TlhwS1lZNU5oT3pKcm5jTHdRV3Y2cktpa1c0T3hhMlJkT1JRZmxW?=
 =?utf-8?B?UElnUXpuMEV5MGc1Z2Rzb1BGejN3VVF5aHMvQTZzeTJXeW1sMXIwVlR5eEoz?=
 =?utf-8?B?Tm5NbThXd1ptN3kzOEUwV3Bjck9SNFBjM041bVU1VGF1WjZoZEU2YkxJNUNr?=
 =?utf-8?B?SW1VM2pXbEdpZTFDelA5VW0vVFVueHhlUTlRRDd1VENTWjdLZ281SVlqSUZp?=
 =?utf-8?B?ejEwcXFWNnRyOE9BR0RiVHBZcnprYTV4b1FGcmFDSFdjWUQyVGJPUWFWTlFs?=
 =?utf-8?B?eG9zeGdFSmRPRFhpMUxiS1Rjd0NPZEpSQVZIQmQ4Q1FraGUxL2dFWDFjMUJG?=
 =?utf-8?B?Q3hyOVFKNVNsaEJ0bXBhaTVaNW9Ic0JtRGorY2lYY0IxZXdORkdCN1VqTVBa?=
 =?utf-8?B?am4vQkF2ckpmTmpHNFU0V29Qbm9WeCs4Z3FGNEpvUTEzTSt6NWVhU253WXZ4?=
 =?utf-8?B?NXI0VzhpQjNBNVNaaVBXMUUzOVNnb1B3VmZGdTJaMFhhYW5RNlllVlpQVVJ5?=
 =?utf-8?B?MkxsUG9yVXduQ1JwbkR2dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE5SWkdqOGhaaFZFUGZEVGdpbGU2d2tZK3VzbVI1VjdtMzd5T1NMMXpqV2U4?=
 =?utf-8?B?emxnKzlIUW1zVHAzSGkyVGRxVFNEbXliVVdDWDh5ZjZYSUlhVm05RG5zdUhF?=
 =?utf-8?B?VlNpbnVRMnlCTG02QnpmNWFBZFNpSHFGTTM5bnhYd0IrRUZVaVpJVTJOV2pW?=
 =?utf-8?B?ZFc1WjUwM1hnMXg2R1dHRWRsazZENy8rZzZZNi9lZzRtckdPaGd6Z0dMdk82?=
 =?utf-8?B?eGFZOTViaFNiWEdqeHdiNXM1U2pmaDBydE45Zm01a2YvYjhscVdVdk9McWRO?=
 =?utf-8?B?ZUMySGs0QXkzTEtQb09oSEF0Q3I4dFBHWkJTNmdBclUrakVUeDNabk9zemkv?=
 =?utf-8?B?KzJPS3Y3QTR1TEs2SEtpSjd3QzdiaUJCTUtIcGtMcnFWUElrY1VmRkxjOXBC?=
 =?utf-8?B?S2tzOEUweGVBQTNkcGlyVDNXblVvc2JRSmwrSnNEakpuck8zVmNWYnRSYmF5?=
 =?utf-8?B?MnZjUlB4ekJhVVB1MTFxK0dDK2daNU43a1llejZLSVM4c2h3a1JFenR0REFH?=
 =?utf-8?B?UFdFdkZ1UStWY1N2d01qR0syeVczak1WVTJOeWFiWFlNaEMrbG94RTZ3SVh4?=
 =?utf-8?B?NytxMFozUUJsdFRVLzBTQUVTRnZ3TUNpUjlYUUtMM0pJeGpRR0FCRm1zck0w?=
 =?utf-8?B?M0R2OVBZTE9RQjh6dVpIU0U2eHNiaGttMkNqOTVSdXFmczRtdDBhYTVCUWQ3?=
 =?utf-8?B?Z2VtYWg0dFVxNnVxYVIrcmgrSE9KQkZObTd6UENzL01iY3NHaSs4a3BBNUty?=
 =?utf-8?B?Y05KNFlLbzV3N0dmb0xWRHAyRXMrdW5nVG1VcWtwV09SVE1veGhYMEpEenh4?=
 =?utf-8?B?QnRzdGJBcUtjUXpLL0hjOEpFS1ZKcEM5N1VpanNHSENVOG0zODlKaHZwdkdC?=
 =?utf-8?B?d2hVQjI4U3I1d0g4RGdwVzFmamlZNmo0N3Zvbk92UFFPQ21pUFJwbXBFWHhv?=
 =?utf-8?B?MFRXQ2dLeUNFY2ZsVzBZKy9hQ014Z0JNbGMrNjk1ZzlMblEyV05TWTU2SkNh?=
 =?utf-8?B?SkcyRGY5cUpzUTVnVHk4YUdGdm9zaTBJVlR2ZjlaaHVmUmtxUGQ4OWoyaU5T?=
 =?utf-8?B?RWJnMjM0aWVnVm9rNFdmbWhWeGFYckwrR2YvWllockordWJKNENNNWQ5Ri9l?=
 =?utf-8?B?VExLMDlLNFpjNzNWUmNtaUNsclVjYU1lZ0lPUVJaOHA3MlN1QXR4ZUsyRXhQ?=
 =?utf-8?B?Nk1xS29Rd2tmbTBFRjM4M2FwVXBKanZwZG9YcmZRYkdjYTJlL2xjcldvM1Jy?=
 =?utf-8?B?R1I2TDNMWXowZURJS3lCRlBHRWxrUHJNak0wcEYvVjB3YWRlbForT3FuU2Vm?=
 =?utf-8?B?ekVtQVZQcVNXTEFNM01yaUpOeEd3VGQwSkVIZWZEK1p6aGlQK1pxQ2JTMlpn?=
 =?utf-8?B?ME9XdUM0Sk9VSXc5bWpubkVYTjhRVHlDOUdqLzBrdnV3Vi8veC82VkY0KzBY?=
 =?utf-8?B?VFQrZGFueEFEeEhVWUxsTW0wTnRVY2lZekxRSlk4MVorQzVqZVl1bXpmc0JQ?=
 =?utf-8?B?ZkxhaENLRVJ5ZFVBOGp4NkJCOXNQamZlQXIvUGw3MUk1S3AvZTNxUVFJY3Ev?=
 =?utf-8?B?a2hGMm9LN3Q5amc5SWMyOHBjRVBGSXM1NnNjYW9LVGNsaU5MZEp3dkl0OFVt?=
 =?utf-8?B?cW1vYStGNktCdG52dEhxUUt5bkRDT3JXb08zcXpqQTl0UWlNc2o0STIxWjJo?=
 =?utf-8?B?VytwTkJCNisyNlJnbnFPaithQU4wV0dta0pIYkxTUFlYclJvWVEyR0g1Z3VP?=
 =?utf-8?B?MW80c25zeVg3SHJhSFMvLzg2amtXNjhVSjZmd3RDMk1JbWZVOWlqVTF5T2xG?=
 =?utf-8?B?cHJrZkhFL1Fvc3RCV0REc2tCMHFZNlZzZ05MRThQNitRVTNJcks0YytvVncx?=
 =?utf-8?B?ajYyNExmd3lrcldpTy83dzUyWGlCdENXK3FhMkdOdFVXa0J6UWo3cHZDTVVa?=
 =?utf-8?B?MzRCNy9Zb2ZoOVlReXA3ZlFKWHFkWHBVYkZvQTlIblB6ZkJHYndVNDY4NitN?=
 =?utf-8?B?UEpjWm9EVXB1SlNFbGJoMGhMYk40bkEvakIrbFpPT1gvaW9IN0VDcDNaUnFU?=
 =?utf-8?B?QTNiQ0FmSGlZTjhsMEdVdDR4S0k2NSs5VEk5ZTR2bTQ1VjhZWFpoZ1VrbWRJ?=
 =?utf-8?Q?WmXAPvcTAafp/rrY0Fw6O/Iiz?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90eb090-c3b6-44fe-2cb4-08dcd20bc7bd
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 02:45:21.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5hSHk0HrDwFabqVrtvVbpz2NcBAbTl7hhb+Cw4cOgOxIJ48VVLVVxtinlhKgwDghbPSIYON1vMsOeQZ2vuivg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7937

Hi Dan,

         Thanks for your reply.

On 2024/9/11 00:56, Dan Scally wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke, thanks for the patch
>
> On 09/09/2024 08:24, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> This driver is used to receive mipi data from image sensor.
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   MAINTAINERS                                        |   7 +
>>   drivers/media/platform/amlogic/Kconfig             |   1 +
>>   drivers/media/platform/amlogic/Makefile            |   2 +
>>   .../media/platform/amlogic/c3-mipi-csi2/Kconfig    |  16 +
>>   .../media/platform/amlogic/c3-mipi-csi2/Makefile   |   3 +
>>   .../platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c   | 937 
>> +++++++++++++++++++++
>>   6 files changed, 966 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0a3d9e17295a..de6e25b0eb09 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4887,6 +4887,13 @@ S:     Maintained
>>   F: Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
>>   F:  drivers/net/can/bxcan.c
>>
>> +C3 MIPI CSI2 DRIVER FOR AMLOGIC
>> +M:   Keke Li <keke.li@amlogic.com>
>> +L:   linux-media@vger.kernel.org
>> +S:   Maintained
>> +F: Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>> +F:   drivers/media/platform/amlogic/c3-mipi-csi2/
>> +
>>   C-MEDIA CMI8788 DRIVER
>>   M:  Clemens Ladisch <clemens@ladisch.de>
>>   L:  alsa-devel@alsa-project.org (moderated for non-subscribers)
>> diff --git a/drivers/media/platform/amlogic/Kconfig 
>> b/drivers/media/platform/amlogic/Kconfig
>> index 5014957404e9..b7c2de14848b 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -2,4 +2,5 @@
>>
>>   comment "Amlogic media platform drivers"
>>
>> +source "drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile 
>> b/drivers/media/platform/amlogic/Makefile
>> index d3cdb8fa4ddb..4f571ce5d13e 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -1,2 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-y += c3-mipi-csi2/
>>   obj-y += meson-ge2d/
>> diff --git a/drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig 
>> b/drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig
>> new file mode 100644
>> index 000000000000..0d7b2e203273
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_C3_MIPI_CSI2
>> +     tristate "Amlogic C3 MIPI CSI-2 receiver"
>> +     depends on ARCH_MESON || COMPILE_TEST
>> +     depends on VIDEO_DEV
>> +     depends on OF
>> +     select MEDIA_CONTROLLER
>> +     select V4L2_FWNODE
>> +     select VIDEO_V4L2_SUBDEV_API
>> +     help
>> +       Video4Linux2 driver for Amlogic C3 MIPI CSI-2 receiver.
>> +       C3 MIPI CSI-2 receiver is used to receive MIPI data from
>> +       image sensor.
>> +
>> +       To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/amlogic/c3-mipi-csi2/Makefile 
>> b/drivers/media/platform/amlogic/c3-mipi-csi2/Makefile
>> new file mode 100644
>> index 000000000000..cc08fc722bfd
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3-mipi-csi2/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_VIDEO_C3_MIPI_CSI2) += c3-mipi-csi2.o
>> diff --git 
>> a/drivers/media/platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c 
>> b/drivers/media/platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c
>> new file mode 100644
>> index 000000000000..c036be24fcff
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c
>> @@ -0,0 +1,937 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-mc.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +/* C3 CSI-2 submodule definition */
>> +enum {
>> +     SUBMD_APHY,
>> +     SUBMD_DPHY,
>> +     SUBMD_HOST,
>> +};
>> +
>> +#define CSI2_SUBMD_MASK             GENMASK(17, 16)
>> +#define CSI2_SUBMD_SHIFT            16
>> +#define CSI2_SUBMD(x)               (((x) & (CSI2_SUBMD_MASK)) >> 
>> (CSI2_SUBMD_SHIFT))
>> +#define CSI2_REG_ADDR_MASK          GENMASK(15, 0)
>> +#define CSI2_REG_ADDR(x)            ((x) & (CSI2_REG_ADDR_MASK))
>> +#define CSI2_REG_A(x)               ((SUBMD_APHY << 
>> CSI2_SUBMD_SHIFT) | (x))
>> +#define CSI2_REG_D(x)               ((SUBMD_DPHY << 
>> CSI2_SUBMD_SHIFT) | (x))
>> +#define CSI2_REG_H(x)               ((SUBMD_HOST << 
>> CSI2_SUBMD_SHIFT) | (x))
>> +
>> +#define MIPI_CSI2_CLOCK_NUM_MAX     3
>> +#define MIPI_CSI2_SUBDEV_NAME       "mipi-csi2"
>> +
>> +/* C3 CSI-2 APHY register */
>> +#define MIPI_CSI_2M_PHY2_CNTL1      CSI2_REG_A(0x44)
>> +#define MIPI_APHY_NORMAL_CNTL1      0x3f425C00
>> +
>> +#define MIPI_CSI_2M_PHY2_CNTL2      CSI2_REG_A(0x48)
>> +#define MIPI_APHY_4LANES_CNTL2      0x033a0000
>> +#define MIPI_APHY_NORMAL_CNTL2      0x333a0000
>> +
>> +#define MIPI_CSI_2M_PHY2_CNTL3      CSI2_REG_A(0x4c)
>> +#define MIPI_APHY_2LANES_CNTL3      0x03800000
>> +
>> +/* C3 CSI-2 DPHY register */
>> +#define MIPI_PHY_CTRL                    CSI2_REG_D(0x00)
>> +#define MIPI_DPHY_LANES_ENABLE      0x0
>> +
>> +#define MIPI_PHY_CLK_LANE_CTRL           CSI2_REG_D(0x04)
>> +#define MIPI_DPHY_CLK_CONTINUE_MODE 0x3d8
>> +
>> +#define MIPI_PHY_DATA_LANE_CTRL     CSI2_REG_D(0x08)
>> +#define MIPI_DPHY_LANE_CTRL_DISABLE 0x0
>> +
>> +#define MIPI_PHY_DATA_LANE_CTRL1    CSI2_REG_D(0x0c)
>> +#define MIPI_DPHY_INSERT_ERRESC     BIT(0)
>> +#define MIPI_DPHY_HS_SYNC_CHECK     BIT(1)
>> +#define MIPI_DPHY_FIVE_HS_PIPE      GENMASK(6, 2)
>> +#define MIPI_DPHY_FIVE_HS_PIPE_SHIFT           2
>> +#define MIPI_DPHY_DATA_PIPE_SELECT  GENMASK(9, 7)
>> +#define MIPI_DPHY_DATA_PIPE_SELECT_SHIFT       7
>> +
>> +#define MIPI_PHY_TCLK_MISS       CSI2_REG_D(0x10)
>> +#define MIPI_DPHY_CLK_MISS          0x9
>> +
>> +#define MIPI_PHY_TCLK_SETTLE     CSI2_REG_D(0x14)
>> +#define MIPI_DPHY_CLK_SETTLE        0x1F
>> +
>> +#define MIPI_PHY_THS_EXIT        CSI2_REG_D(0x18)
>> +#define MIPI_DPHY_HS_EXIT           0x8
>> +
>> +#define MIPI_PHY_THS_SKIP        CSI2_REG_D(0x1c)
>> +#define MIPI_DPHY_HS_SKIP           0xa
>> +
>> +#define MIPI_PHY_THS_SETTLE      CSI2_REG_D(0x20)
>> +#define MIPI_PHY_TINIT                   CSI2_REG_D(0x24)
>> +#define MIPI_DPHY_INIT_CYCLES       0x4e20
>> +
>> +#define MIPI_PHY_TULPS_C         CSI2_REG_D(0x28)
>> +#define MIPI_DPHY_ULPS_CHECK_CYCLES 0x1000
>> +
>> +#define MIPI_PHY_TULPS_S         CSI2_REG_D(0x2c)
>> +#define MIPI_DPHY_ULPS_START_CYCLES 0x100
>> +
>> +#define MIPI_PHY_TMBIAS             CSI2_REG_D(0x30)
>> +#define MIPI_DPHY_MBIAS_CYCLES      0x100
>> +
>> +#define MIPI_PHY_TLP_EN_W           CSI2_REG_D(0x34)
>> +#define MIPI_DPHY_ULPS_STOP_CYCLES  0xC
>> +
>> +#define MIPI_PHY_TLPOK                   CSI2_REG_D(0x38)
>> +#define MIPI_DPHY_POWER_UP_CYCLES   0x100
>> +
>> +#define MIPI_PHY_TWD_INIT        CSI2_REG_D(0x3c)
>> +#define MIPI_DPHY_INIT_WATCH_DOG    0x400000
>> +
>> +#define MIPI_PHY_TWD_HS             CSI2_REG_D(0x40)
>> +#define MIPI_DPHY_HS_WATCH_DOG      0x400000
>> +
>> +#define MIPI_PHY_MUX_CTRL0       CSI2_REG_D(0x284)
>> +#define MIPI_DPHY_LANE3_SELECT      GENMASK(3, 0)
>> +#define MIPI_DPHY_LANE2_SELECT      GENMASK(7, 4)
>> +#define MIPI_DPHY_LANE2_SELECT_SHIFT           4
>> +#define MIPI_DPHY_LANE1_SELECT      GENMASK(11, 8)
>> +#define MIPI_DPHY_LANE1_SELECT_SHIFT            8
>> +#define MIPI_DPHY_LANE0_SELECT      GENMASK(14, 12)
>> +
>> +#define MIPI_PHY_MUX_CTRL1       CSI2_REG_D(0x288)
>> +#define MIPI_DPHY_LANE3_CTRL_SIGNAL GENMASK(3, 0)
>> +#define MIPI_DPHY_LANE2_CTRL_SIGNAL GENMASK(7, 4)
>> +#define MIPI_DPHY_LANE2_CTRL_SIGNAL_SHIFT      4
>> +#define MIPI_DPHY_LANE1_CTRL_SIGNAL GENMASK(11, 8)
>> +#define MIPI_DPHY_LANE1_CTRL_SIGNAL_SHIFT       8
>> +#define MIPI_DPHY_LANE0_CTRL_SIGNAL GENMASK(14, 12)
>> +#define MIPI_DPHY_CLK_SELECT        BIT(17)
>> +
>> +/* C3 CSI-2 HOST register */
>> +#define CSI2_HOST_N_LANES           CSI2_REG_H(0x04)
>> +#define CSI2_HOST_CSI2_RESETN       CSI2_REG_H(0x10)
>> +#define CSI2_HOST_RESETN_DEFAULT    0x0
>> +#define CSI2_HOST_RESETN_RST_VALUE  BIT(0)
>> +
>> +#define CSI2_HOST_MASK1             CSI2_REG_H(0x28)
>> +#define CSI2_HOST_ERROR_MASK1       GENMASK(28, 0)
>> +
>> +#define MIPI_CSI2_MAX_WIDTH         2888
>> +#define MIPI_CSI2_MIN_WIDTH         160
>> +#define MIPI_CSI2_MAX_HEIGHT        2240
>> +#define MIPI_CSI2_MIN_HEIGHT        120
>> +#define MIPI_CSI2_DEFAULT_WIDTH     1920
>> +#define MIPI_CSI2_DEFAULT_HEIGHT    1080
>> +#define MIPI_CSI2_DEFAULT_FMT       MEDIA_BUS_FMT_SRGGB10_1X10
>> +
>> +/* C3 CSI-2 pad list */
>> +enum {
>> +     MIPI_CSI2_PAD_SINK,
>> +     MIPI_CSI2_PAD_SRC,
>> +     MIPI_CSI2_PAD_MAX
>> +};
>> +
>> +/**
>> + * struct csi_info - MIPI CSI2 information
>> + *
>> + * @clocks: array of MIPI CSI2 clock names
>> + * @clock_rates: array of MIPI CSI2 clock rate
>> + * @clock_num: actual clock number
>> + */
>> +struct csi_info {
>> +     char *clocks[MIPI_CSI2_CLOCK_NUM_MAX];
>> +     u32 clock_rates[MIPI_CSI2_CLOCK_NUM_MAX];
>> +     u32 clock_num;
>> +};
>> +
>> +/**
>> + * struct csi_device - MIPI CSI2 platform device
>> + *
>> + * @dev: pointer to the struct device
>> + * @aphy: MIPI CSI2 aphy register address
>> + * @dphy: MIPI CSI2 dphy register address
>> + * @host: MIPI CSI2 host register address
>> + * @clks: array of MIPI CSI2 clocks
>> + * @sd: MIPI CSI2 sub-device
>> + * @pads: MIPI CSI2 sub-device pads
>> + * @notifier: notifier to register on the v4l2-async API
>> + * @src_sd: source sub-device
>> + * @bus: MIPI CSI2 bus information
>> + * @src_sd_pad: source sub-device pad
>> + * @lock: protect MIPI CSI2 device
>> + * @info: version-specific MIPI CSI2 information
>> + */
>> +struct csi_device {
>> +     struct device *dev;
>> +     void __iomem *aphy;
>> +     void __iomem *dphy;
>> +     void __iomem *host;
>> +     struct clk_bulk_data clks[MIPI_CSI2_CLOCK_NUM_MAX];
>> +
>> +     struct v4l2_subdev sd;
>> +     struct media_pad pads[MIPI_CSI2_PAD_MAX];
>> +     struct v4l2_async_notifier notifier;
>> +     struct v4l2_subdev *src_sd;
>> +     struct v4l2_mbus_config_mipi_csi2 bus;
>> +
>> +     u16 src_sd_pad;
>> +     struct mutex lock; /* Protect csi device */
>> +     const struct csi_info *info;
>> +};
>> +
>> +static const u32 c3_mipi_csi_formats[] = {
>> +     MEDIA_BUS_FMT_SBGGR10_1X10,
>> +     MEDIA_BUS_FMT_SGBRG10_1X10,
>> +     MEDIA_BUS_FMT_SGRBG10_1X10,
>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>> +     MEDIA_BUS_FMT_SBGGR12_1X12,
>> +     MEDIA_BUS_FMT_SGBRG12_1X12,
>> +     MEDIA_BUS_FMT_SGRBG12_1X12,
>> +     MEDIA_BUS_FMT_SRGGB12_1X12,
>> +};
>> +
>> +/* Hardware configuration */
>> +
>> +static int c3_mipi_csi_write(struct csi_device *csi, u32 reg, u32 val)
>> +{
>> +     void __iomem *addr;
>> +
>> +     switch (CSI2_SUBMD(reg)) {
>> +     case SUBMD_APHY:
>> +             addr = csi->aphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_DPHY:
>> +             addr = csi->dphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_HOST:
>> +             addr = csi->host + CSI2_REG_ADDR(reg);
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     writel(val, addr);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_update_bits(struct csi_device *csi, u32 reg,
>> +                                u32 mask, u32 val)
>> +{
>> +     void __iomem *addr;
>> +     u32 orig, tmp;
>> +
>> +     switch (CSI2_SUBMD(reg)) {
>> +     case SUBMD_APHY:
>> +             addr = csi->aphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_DPHY:
>> +             addr = csi->dphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_HOST:
>> +             addr = csi->host + CSI2_REG_ADDR(reg);
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     orig = readl(addr);
>> +     tmp = orig & ~mask;
>> +     tmp |= val & mask;
>> +
>> +     if (tmp != orig)
>> +             writel(tmp, addr);
>> +
>> +     return 0;
>> +}
>
>
> Given these can only fail if the register definitions in the driver 
> are wrong, and you're not
> checking them for success/failure in the callsites, I think that these 
> two functions can return void
> with a debug message if the switch reaches the default state.
>
Will modify these two functions to return void and add debug message in 
the default state.
>> +
>> +static void c3_mipi_csi_cfg_aphy(struct csi_device *csi, u32 lanes)
>> +{
>> +     c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL1, 
>> MIPI_APHY_NORMAL_CNTL1);
>> +
>> +     if (lanes == 4)
>> +             c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL2, 
>> MIPI_APHY_4LANES_CNTL2);
>> +     else
>> +             c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL2, 
>> MIPI_APHY_NORMAL_CNTL2);
>> +
>> +     if (lanes == 2)
>> +             c3_mipi_csi_write(csi, MIPI_CSI_2M_PHY2_CNTL3, 
>> MIPI_APHY_2LANES_CNTL3);
>> +}
>> +
>> +static void c3_mipi_csi_2lanes_setting(struct csi_device *csi)
>> +{
>> +     /* Disable lane 2 and lane 3 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE3_SELECT, 0xf);
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE2_SELECT,
>> +                             0xf << MIPI_DPHY_LANE2_SELECT_SHIFT);
>> +     /* Select analog data lane 1 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE1_SELECT,
>> +                             0x1 << MIPI_DPHY_LANE1_SELECT_SHIFT);
>> +     /* Select analog data lane 0 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE0_SELECT, 0x0);
>> +
>> +     /* Disable lane 2 and lane 3 control signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE3_CTRL_SIGNAL, 0xf);
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE2_CTRL_SIGNAL,
>> +                             0xf << MIPI_DPHY_LANE2_CTRL_SIGNAL_SHIFT);
>> +     /* Select lane 1 signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE1_CTRL_SIGNAL,
>> +                             0x1 << MIPI_DPHY_LANE1_CTRL_SIGNAL_SHIFT);
>> +     /* Select lane 0 signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE0_CTRL_SIGNAL, 0x0);
>> +     /* Select input 0 as clock */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_CLK_SELECT,
>> +                             MIPI_DPHY_CLK_SELECT);
>> +}
>> +
>> +static void c3_mipi_csi_4lanes_setting(struct csi_device *csi)
>> +{
>> +     /* Select analog data lane 3 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE3_SELECT, 0x3);
>> +     /* Select analog data lane 2 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE2_SELECT,
>> +                             0x2 << MIPI_DPHY_LANE2_SELECT_SHIFT);
>> +     /* Select analog data lane 1 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE1_SELECT,
>> +                             0x1 << MIPI_DPHY_LANE1_SELECT_SHIFT);
>> +     /* Select analog data lane 0 */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL0,
>> +                             MIPI_DPHY_LANE0_SELECT, 0x0);
>> +
>> +     /* Select lane 3 signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE3_CTRL_SIGNAL, 0x3);
>> +     /* Select lane 2 signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE2_CTRL_SIGNAL,
>> +                             0x2 << MIPI_DPHY_LANE2_CTRL_SIGNAL_SHIFT);
>> +     /* Select lane 1 signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE1_CTRL_SIGNAL,
>> +                             0x1 << MIPI_DPHY_LANE1_CTRL_SIGNAL_SHIFT);
>> +     /* Select lane 0 signal */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_LANE0_CTRL_SIGNAL, 0x0);
>> +     /* Select input 0 as clock */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_MUX_CTRL1,
>> +                             MIPI_DPHY_CLK_SELECT,
>> +                             MIPI_DPHY_CLK_SELECT);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_dphy(struct csi_device *csi, u32 lanes, 
>> s64 rate)
>> +{
>> +     u32 val;
>> +     u32 settle;
>> +
>> +     /* Calculate the high speed settle */
>> +     val = DIV_ROUND_UP(1000000000, rate);
>> +     settle = (16 * val + 230) / 10;
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL, 
>> MIPI_DPHY_CLK_CONTINUE_MODE);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_MISS, MIPI_DPHY_CLK_MISS);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_SETTLE, 
>> MIPI_DPHY_CLK_SETTLE);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_EXIT, MIPI_DPHY_HS_EXIT);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SKIP, MIPI_DPHY_HS_SKIP);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SETTLE, settle);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TINIT, MIPI_DPHY_INIT_CYCLES);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TMBIAS, MIPI_DPHY_MBIAS_CYCLES);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_C, 
>> MIPI_DPHY_ULPS_CHECK_CYCLES);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_S, 
>> MIPI_DPHY_ULPS_START_CYCLES);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLP_EN_W, 
>> MIPI_DPHY_ULPS_STOP_CYCLES);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLPOK, MIPI_DPHY_POWER_UP_CYCLES);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_INIT, 
>> MIPI_DPHY_INIT_WATCH_DOG);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_HS, MIPI_DPHY_HS_WATCH_DOG);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_DATA_LANE_CTRL, 
>> MIPI_DPHY_LANE_CTRL_DISABLE);
>> +
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1,
>> +                             MIPI_DPHY_INSERT_ERRESC,
>> +                             MIPI_DPHY_INSERT_ERRESC);
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1,
>> +                             MIPI_DPHY_HS_SYNC_CHECK,
>> +                             MIPI_DPHY_HS_SYNC_CHECK);
>> +     /*
>> +      * Set 5 pipe lines to the same high speed.
>> +      * Each bit for one pipe line.
>> +      */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1,
>> +                             MIPI_DPHY_FIVE_HS_PIPE,
>> +                             0x1f << MIPI_DPHY_FIVE_HS_PIPE_SHIFT);
>> +
>> +     /* Output data with pipe line data. */
>> +     c3_mipi_csi_update_bits(csi, MIPI_PHY_DATA_LANE_CTRL1,
>> +                             MIPI_DPHY_DATA_PIPE_SELECT,
>> +                             0x3 << MIPI_DPHY_DATA_PIPE_SELECT_SHIFT);
>> +     if (lanes == 2)
>> +             c3_mipi_csi_2lanes_setting(csi);
>> +     else
>> +             c3_mipi_csi_4lanes_setting(csi);
>> +
>> +     /* Enable digital data and clock lanes */
>> +     c3_mipi_csi_write(csi, MIPI_PHY_CTRL, MIPI_DPHY_LANES_ENABLE);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_host(struct csi_device *csi, u32 lanes)
>> +{
>> +     /* Reset CSI-2 controller output */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, 
>> CSI2_HOST_RESETN_DEFAULT);
>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, 
>> CSI2_HOST_RESETN_RST_VALUE);
>> +
>> +     /* Set data lane number */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, lanes - 1);
>> +
>> +     /* Enable error mask */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_MASK1, CSI2_HOST_ERROR_MASK1);
>> +}
>> +
>> +static int c3_mipi_csi_start_stream(struct csi_device *csi)
>> +{
>> +     s64 link_freq;
>> +     s64 lane_rate;
>> +
>> +     link_freq = v4l2_get_link_freq(csi->src_sd->ctrl_handler, 0, 0);
>> +     if (link_freq < 0) {
>> +             dev_err(csi->dev, "Unable to obtain link frequency: 
>> %lld\n", link_freq);
>> +             return link_freq;
>> +     }
>> +
>> +     lane_rate = link_freq * 2;
>> +     if (lane_rate > 1500000000)
>> +             return -EINVAL;
>> +
>> +     c3_mipi_csi_cfg_aphy(csi, csi->bus.num_data_lanes);
>> +     c3_mipi_csi_cfg_dphy(csi, csi->bus.num_data_lanes, lane_rate);
>> +     c3_mipi_csi_cfg_host(csi, csi->bus.num_data_lanes);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>> +                                   struct v4l2_subdev_state *state,
>> +                                   u32 pad, u64 streams_mask)
>> +{
>> +     struct csi_device *csi = v4l2_get_subdevdata(sd);
>> +     u64 sink_streams;
>> +     int ret;
>> +
>> +     guard(mutex)(&csi->lock);
>> +
>> +     pm_runtime_resume_and_get(csi->dev);
>> +
>> +     c3_mipi_csi_start_stream(csi);
>> +
>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> + MIPI_CSI2_PAD_SINK,
>> + &streams_mask);
>> +     ret = v4l2_subdev_enable_streams(csi->src_sd,
>> +                                      csi->src_sd_pad,
>> +                                      sink_streams);
>> +     if (ret) {
>> +             pm_runtime_put(csi->dev);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_disable_streams(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *state,
>> +                                    u32 pad, u64 streams_mask)
>> +{
>> +     struct csi_device *csi = v4l2_get_subdevdata(sd);
>> +     u64 sink_streams;
>> +     int ret;
>> +
>> +     guard(mutex)(&csi->lock);
>> +
>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> + MIPI_CSI2_PAD_SINK,
>> + &streams_mask);
>> +     ret = v4l2_subdev_disable_streams(csi->src_sd,
>> +                                       csi->src_sd_pad,
>> +                                       sink_streams);
>> +     if (ret)
>> +             dev_err(csi->dev, "Failed to disable %s\n", 
>> csi->src_sd->name);
>> +
>> +     pm_runtime_put(csi->dev);
>> +
>> +     return ret;
>> +}
>> +
>> +static int c3_mipi_csi_cfg_routing(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *state,
>> +                                struct v4l2_subdev_krouting *routing)
>> +{
>> +     static const struct v4l2_mbus_framefmt format = {
>> +             .width = MIPI_CSI2_DEFAULT_WIDTH,
>> +             .height = MIPI_CSI2_DEFAULT_HEIGHT,
>> +             .code = MIPI_CSI2_DEFAULT_FMT,
>> +             .field = V4L2_FIELD_NONE,
>> +             .colorspace = V4L2_COLORSPACE_RAW,
>> +             .ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +             .quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +             .xfer_func = V4L2_XFER_FUNC_NONE,
>> +     };
>> +     int ret;
>> +
>> +     ret = v4l2_subdev_routing_validate(sd, routing,
>> + V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, 
>> &format);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_init_routing(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_subdev_route routes;
>> +     struct v4l2_subdev_krouting routing;
>> +
>> +     routes.sink_pad = MIPI_CSI2_PAD_SINK;
>> +     routes.sink_stream = 0;
>> +     routes.source_pad = MIPI_CSI2_PAD_SRC;
>> +     routes.source_stream = 0;
>> +     routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>> +
>> +     routing.num_routes = 1;
>> +     routing.routes = &routes;
>> +
>> +     return c3_mipi_csi_cfg_routing(sd, state, &routing);
>> +}
>> +
>> +static int c3_mipi_csi_set_routing(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *state,
>> +                                enum v4l2_subdev_format_whence which,
>> +                                struct v4l2_subdev_krouting *routing)
>> +{
>> +     bool is_streaming = v4l2_subdev_is_streaming(sd);
>> +
>> +     if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
>> +             return -EBUSY;
>> +
>> +     return c3_mipi_csi_cfg_routing(sd, state, routing);
>> +}
>> +
>> +static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
>> +                                   struct v4l2_subdev_state *state,
>> +                                   struct v4l2_subdev_mbus_code_enum 
>> *code)
>> +{
>> +     switch (code->pad) {
>> +     case MIPI_CSI2_PAD_SINK:
>> +             if (code->index >= ARRAY_SIZE(c3_mipi_csi_formats))
>> +                     return -EINVAL;
>> +
>> +             code->code = c3_mipi_csi_formats[code->index];
>> +             break;
>> +     case MIPI_CSI2_PAD_SRC:
>> +             struct v4l2_mbus_framefmt *fmt;
>> +
>> +             if (code->index > 0)
>> +                     return -EINVAL;
>> +
>> +             fmt = v4l2_subdev_state_get_format(state, code->pad);
>> +             code->code = fmt->code;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>> +                            struct v4l2_subdev_state *state,
>> +                            struct v4l2_subdev_format *format)
>> +{
>> +     struct v4l2_mbus_framefmt *fmt;
>> +     unsigned int i;
>> +
>> +     if (format->pad == MIPI_CSI2_PAD_SRC)
>> +             return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +     if (format->pad != MIPI_CSI2_PAD_SINK)
>> +             return -EINVAL;
>
>
> perhaps just replace both if segments with
>
>
> if (format->pad != MIPI_CSI2_PAD_SINK)
>
>     return v4l2_subdev_get_fmt(sd, state, format)
>
>
> and rely on the function to return -EINVAL if the pad is wrong.
>
OK, I will replace both if segments with

if (format->pad != MIPI_CSI2_PAD_SINK)

     return v4l2_subdev_get_fmt(sd, state, format)

>> +
>> +     fmt = v4l2_subdev_state_get_format(state, format->pad);
>> +
>> +     for (i = 0; i < ARRAY_SIZE(c3_mipi_csi_formats); i++)
>> +             if (format->format.code == c3_mipi_csi_formats[i])
>> +                     break;
>> +
>> +     if (i == ARRAY_SIZE(c3_mipi_csi_formats))
>> +             fmt->code = c3_mipi_csi_formats[0];
>> +     else
>> +             fmt->code = c3_mipi_csi_formats[i];
>> +
>> +     fmt->width = clamp_t(u32, format->format.width,
>> +                          MIPI_CSI2_MIN_WIDTH, MIPI_CSI2_MAX_WIDTH);
>> +     fmt->height = clamp_t(u32, format->format.height,
>> +                           MIPI_CSI2_MIN_HEIGHT, MIPI_CSI2_MAX_HEIGHT);
>> +
>> +     format->format = *fmt;
>> +
>> +     /* Synchronize the format to source pad */
>> +     fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
>> +     *fmt = format->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_init_state(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_mbus_framefmt *sink_fmt;
>> +     struct v4l2_mbus_framefmt *src_fmt;
>> +
>> +     sink_fmt = v4l2_subdev_state_get_format(state, 
>> MIPI_CSI2_PAD_SINK);
>> +     src_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
>> +
>> +     sink_fmt->width = MIPI_CSI2_DEFAULT_WIDTH;
>> +     sink_fmt->height = MIPI_CSI2_DEFAULT_HEIGHT;
>> +     sink_fmt->field = V4L2_FIELD_NONE;
>> +     sink_fmt->code = MIPI_CSI2_DEFAULT_FMT;
>> +     sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +     sink_fmt->xfer_func = 
>> V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>> +     sink_fmt->ycbcr_enc = 
>> V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>> +     sink_fmt->quantization =
>> +             V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
>> + sink_fmt->ycbcr_enc);
>> +     *src_fmt = *sink_fmt;
>> +
>> +     return c3_mipi_csi_init_routing(sd, state);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops c3_mipi_csi_pad_ops = {
>> +     .enum_mbus_code = c3_mipi_csi_enum_mbus_code,
>> +     .get_fmt = v4l2_subdev_get_fmt,
>> +     .set_fmt = c3_mipi_csi_set_fmt,
>> +     .set_routing = c3_mipi_csi_set_routing,
>> +     .enable_streams = c3_mipi_csi_enable_streams,
>> +     .disable_streams = c3_mipi_csi_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops c3_mipi_csi_subdev_ops = {
>> +     .pad = &c3_mipi_csi_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops 
>> c3_mipi_csi_internal_ops = {
>> +     .init_state = c3_mipi_csi_init_state,
>> +};
>> +
>> +/* Media entity operations */
>> +static const struct media_entity_operations c3_mipi_csi_entity_ops = {
>> +     .link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +/* PM runtime */
>> +
>> +static int __maybe_unused c3_mipi_csi_runtime_suspend(struct device 
>> *dev)
>> +{
>> +     struct csi_device *csi = dev_get_drvdata(dev);
>> +
>> +     clk_bulk_disable_unprepare(csi->info->clock_num, csi->clks);
>> +
>> +     return 0;
>> +}
>> +
>> +static int __maybe_unused c3_mipi_csi_runtime_resume(struct device 
>> *dev)
>> +{
>> +     struct csi_device *csi = dev_get_drvdata(dev);
>> +
>> +     return clk_bulk_prepare_enable(csi->info->clock_num, csi->clks);
>> +}
>> +
>> +static const struct dev_pm_ops c3_mipi_csi_pm_ops = {
>> +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                             pm_runtime_force_resume)
>> +     SET_RUNTIME_PM_OPS(c3_mipi_csi_runtime_suspend,
>> +                        c3_mipi_csi_runtime_resume, NULL)
>> +};
>> +
>> +/* Probe/remove & platform driver */
>> +
>> +static int c3_mipi_csi_subdev_init(struct csi_device *csi)
>> +{
>> +     struct v4l2_subdev *sd = &csi->sd;
>> +     int ret;
>> +
>> +     v4l2_subdev_init(sd, &c3_mipi_csi_subdev_ops);
>> +     sd->owner = THIS_MODULE;
>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     sd->internal_ops = &c3_mipi_csi_internal_ops;
>> +     snprintf(sd->name, sizeof(sd->name), "%s", MIPI_CSI2_SUBDEV_NAME);
>> +
>> +     sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +     sd->entity.ops = &c3_mipi_csi_entity_ops;
>> +
>> +     sd->dev = csi->dev;
>> +     v4l2_set_subdevdata(sd, csi);
>> +
>> +     csi->pads[MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +     csi->pads[MIPI_CSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>> +     ret = media_entity_pads_init(&sd->entity, MIPI_CSI2_PAD_MAX, 
>> csi->pads);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = v4l2_subdev_init_finalize(sd);
>> +     if (ret) {
>> +             media_entity_cleanup(&sd->entity);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void c3_mipi_csi_subdev_deinit(struct csi_device *csi)
>> +{
>> +     v4l2_subdev_cleanup(&csi->sd);
>> +     media_entity_cleanup(&csi->sd.entity);
>> +}
>> +
>> +/* Subdev notifier register */
>> +static int c3_mipi_csi_notify_bound(struct v4l2_async_notifier 
>> *notifier,
>> +                                 struct v4l2_subdev *sd,
>> +                                 struct v4l2_async_connection *asc)
>> +{
>> +     struct csi_device *csi = v4l2_get_subdevdata(notifier->sd);
>> +     struct media_pad *sink = &csi->sd.entity.pads[MIPI_CSI2_PAD_SINK];
>> +     int ret;
>> +
>> +     ret = media_entity_get_fwnode_pad(&sd->entity,
>> +                                       sd->fwnode, 
>> MEDIA_PAD_FL_SOURCE);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "Failed to find pad for %s\n", 
>> sd->name);
>> +             return ret;
>> +     }
>> +
>> +     csi->src_sd = sd;
>> +     csi->src_sd_pad = ret;
>> +
>> +     return v4l2_create_fwnode_links_to_pad(sd, sink, 
>> MEDIA_LNK_FL_ENABLED |
>> + MEDIA_LNK_FL_IMMUTABLE);
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations 
>> c3_mipi_csi_notify_ops = {
>> +     .bound = c3_mipi_csi_notify_bound,
>> +};
>> +
>> +static int c3_mipi_csi_async_register(struct csi_device *csi)
>> +{
>> +     struct v4l2_fwnode_endpoint vep = {
>> +             .bus_type = V4L2_MBUS_CSI2_DPHY,
>> +     };
>> +     struct v4l2_async_connection *asc;
>> +     struct fwnode_handle *ep;
>> +     int ret;
>> +
>> +     v4l2_async_subdev_nf_init(&csi->notifier, &csi->sd);
>> +
>> +     ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
>> + FWNODE_GRAPH_ENDPOINT_NEXT);
>> +     if (!ep)
>> +             return -ENOTCONN;
>> +
>> +     ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>> +     if (ret)
>> +             goto err_put_handle;
>> +
>> +     csi->bus = vep.bus.mipi_csi2;
>> +     if (csi->bus.num_data_lanes != 2 && csi->bus.num_data_lanes != 4)
>> +             goto err_put_handle;
>> +
>> +     asc = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
>> +                                           struct 
>> v4l2_async_connection);
>> +     if (IS_ERR(asc)) {
>> +             ret = PTR_ERR(asc);
>> +             goto err_put_handle;
>> +     }
>> +
>> +     csi->notifier.ops = &c3_mipi_csi_notify_ops;
>> +     ret = v4l2_async_nf_register(&csi->notifier);
>> +     if (ret)
>> +             goto err_cleanup_nf;
>> +
>> +     ret = v4l2_async_register_subdev(&csi->sd);
>> +     if (ret)
>> +             goto err_unregister_nf;
>> +
>> +     fwnode_handle_put(ep);
>> +
>> +     return 0;
>> +
>> +err_unregister_nf:
>> +     v4l2_async_nf_unregister(&csi->notifier);
>> +err_cleanup_nf:
>> +     v4l2_async_nf_cleanup(&csi->notifier);
>> +err_put_handle:
>> +     fwnode_handle_put(ep);
>> +     return ret;
>> +}
>> +
>> +static void c3_mipi_csi_async_unregister(struct csi_device *csi)
>> +{
>> +     v4l2_async_unregister_subdev(&csi->sd);
>> +     v4l2_async_nf_unregister(&csi->notifier);
>> +     v4l2_async_nf_cleanup(&csi->notifier);
>> +}
>> +
>> +static int c3_mipi_csi_ioremap_resource(struct csi_device *csi)
>> +{
>> +     struct device *dev = csi->dev;
>> +     struct platform_device *pdev = to_platform_device(dev);
>> +
>> +     csi->aphy = devm_platform_ioremap_resource_byname(pdev, "aphy");
>> +     if (IS_ERR(csi->aphy))
>> +             return PTR_ERR(csi->aphy);
>> +
>> +     csi->dphy = devm_platform_ioremap_resource_byname(pdev, "dphy");
>> +     if (IS_ERR(csi->dphy))
>> +             return PTR_ERR(csi->dphy);
>> +
>> +     csi->host = devm_platform_ioremap_resource_byname(pdev, "host");
>> +     if (IS_ERR(csi->host))
>> +             return PTR_ERR(csi->host);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
>> +{
>> +     const struct csi_info *info = csi->info;
>> +     int ret;
>> +     u32 i;
>> +
>> +     for (i = 0; i < info->clock_num; i++)
>> +             csi->clks[i].id = info->clocks[i];
>> +
>> +     ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
>> +     if (ret)
>> +             return ret;
>> +
>> +     for (i = 0; i < info->clock_num; i++) {
>> +             if (!info->clock_rates[i])
>> +                     continue;
>> +             ret = clk_set_rate(csi->clks[i].clk, 
>> info->clock_rates[i]);
>> +             if (ret) {
>> +                     dev_err(csi->dev, "Failed to set %s rate %u\n", 
>> info->clocks[i],
>> +                             info->clock_rates[i]);
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct csi_device *csi;
>> +     int ret;
>> +
>> +     csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
>> +     if (!csi)
>> +             return -ENOMEM;
>> +
>> +     csi->info = of_device_get_match_data(dev);
>> +     csi->dev = dev;
>> +
>> +     ret = c3_mipi_csi_ioremap_resource(csi);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to ioremap 
>> resource\n");
>> +
>> +     ret = c3_mipi_csi_configure_clocks(csi);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to configure 
>> clocks\n");
>> +
>> +     platform_set_drvdata(pdev, csi);
>> +
>> +     mutex_init(&csi->lock);
>> +     pm_runtime_enable(dev);
>> +
>> +     ret = c3_mipi_csi_subdev_init(csi);
>> +     if (ret)
>> +             goto err_disable_runtime_pm;
>> +
>> +     ret = c3_mipi_csi_async_register(csi);
>> +     if (ret)
>> +             goto err_deinit_subdev;
>> +
>> +     return 0;
>> +
>> +err_deinit_subdev:
>> +     c3_mipi_csi_subdev_deinit(csi);
>> +err_disable_runtime_pm:
>> +     pm_runtime_disable(dev);
>> +     mutex_destroy(&csi->lock);
>> +     return ret;
>> +};
>> +
>> +static void c3_mipi_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct csi_device *csi = platform_get_drvdata(pdev);
>> +
>> +     c3_mipi_csi_async_unregister(csi);
>> +     c3_mipi_csi_subdev_deinit(csi);
>> +
>> +     pm_runtime_disable(&pdev->dev);
>> +     mutex_destroy(&csi->lock);
>> +};
>> +
>> +static const struct csi_info c3_mipi_csi_info = {
>> +     .clocks = {"vapb", "phy0"},
>> +     .clock_rates = {0, 200000000},
>> +     .clock_num = 2
>> +};
>> +
>> +static const struct of_device_id c3_mipi_csi_of_match[] = {
>> +     { .compatible = "amlogic,c3-mipi-csi2",
>> +       .data = &c3_mipi_csi_info,
>> +     },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, c3_mipi_csi_of_match);
>> +
>> +static struct platform_driver c3_mipi_csi_driver = {
>> +     .probe = c3_mipi_csi_probe,
>> +     .remove_new = c3_mipi_csi_remove,
>
> I think back to just .remove() is fine now.
>
Will  back to .remove().
>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>
>> +     .driver = {
>> +             .name = "c3-mipi-csi2",
>> +             .of_match_table = c3_mipi_csi_of_match,
>> +             .pm = &c3_mipi_csi_pm_ops,
>> +     },
>> +};
>> +
>> +module_platform_driver(c3_mipi_csi_driver);
>> +
>> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
>> +MODULE_DESCRIPTION("Amlogic C3 MIPI CSI-2 receiver");
>> +MODULE_LICENSE("GPL");
>>

