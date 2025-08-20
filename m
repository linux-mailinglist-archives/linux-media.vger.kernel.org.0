Return-Path: <linux-media+bounces-40330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E9B2D214
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 04:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D02918879CC
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 02:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E422264B0;
	Wed, 20 Aug 2025 02:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="k1AcgJdD"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022139.outbound.protection.outlook.com [40.107.75.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7182866
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658177; cv=fail; b=qc+xX7Dcs+QrWxmDjZMk6xsH0iaVMeTCAIiiE2TYw63+bf6lYwu817S51+kbsanL83EklARiimb3HwuFF4w3oPaCLMCb5Dx686zfPoydnQ0RZbwfVwQCkObw80ZAunJKPxY5yAbNEBSg6nqGNweb0z6G8yezbOe8pEeCy6gcot0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658177; c=relaxed/simple;
	bh=ww0G9VoOmSOaGDxFflFK9jWbfIrVWhLyA07PRDMU9cc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p3qGXunJK7O/x+JTUEDJa0F8YJjzcFULLncmn9rVaCspiUNvY/mhHqIl6zrJ2CPdc0o5nRmQKJQ/w1W+ckJSaPp3YF1rcgdLy6bwM2ojiSrt1SA2mXqeOHSUfI++Y7shrzr15DbP4/OMta76PaLDXQLLCmLlRqog1Mz4JbRU3rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=k1AcgJdD; arc=fail smtp.client-ip=40.107.75.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkdYpUPF/su7/eLwtWA05BtEORS8UNX+lYmghPVSyla0slUktzXL7rcNYVpnX6oO7mnGlVtjTPE15mLGXo5uzjKDHOsu6VprYOhlq4o7ryEpHHdT8x6kiMtwKw87QtmS7wMZPDXMTHoSqvfs/h7FobV32n4Ydek3epBGcb9C8whpycBnJKrcNanr/wSduihp/3dY9xq3buZZ7Rz/TnSZR2wQno13aIzv2DbLmDKdKfxlHI/9qFUk3F9aDWDz3bDH2zDBIESeiAvHccvYCIObZJjO9QojVFCpNg17EyAGKakImptBxwac6Ay5SSezBzsz4+ooH2vre+lXRPgMDJM7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifM6WgbrfuWG71xVpmb6RJDEytxmxxfANAxL63b3ESs=;
 b=mZVi0QFYn9qwunLFZaR2Bojxtq2eltdu6pfIG0PQUhvrONjjmRpl5Jo1hQxQ6Ry/WY7jDVm7N0XDrNjjMoQ6ZEsCH25wG+w4BWji30pv02wTWKakgf2Gspi3+4SwYMpX/BUEMctxMp6klonjz6xLfMTfbThKqSB+vMdqrhAw1ZVeTS4ppak4C5FH4zpEyMLimThLvcEnkXrFnI/cm6S6dT9GI/pwHdPEKaSw7VFVX6v1vz4IJVbEAWsTe3JIdx2p0JKdLT585tUg8VbqTuN3Xl9ykGmSljzLeQ5LsC9St3I3akCnVioY3OyzDCDD8QELWxN3LILhMSfMKBNvrC1JVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifM6WgbrfuWG71xVpmb6RJDEytxmxxfANAxL63b3ESs=;
 b=k1AcgJdD906IksUc1YUvaLRp3thCRn+oGIL+jrjBsbHGaFjV96g/yWFkWSz7dQKhFujVNWgX5Y1Zpx9KuEd4rQXRMKge0pMMsM5KW000oEo48jgkA6Nm0iPUlqhN6C5t2YeFcggfr7e2PFYwc2oDB5XvGFNzne4QNEGzSNQqxzabcaX+IF6hEPebMFusfQ5HD+LkPa0YprV3m9CwUz8/hGcY0aZOau52XsI/PDZgTjBlrKlOWFR29OlVQbFYh0mDUeq0F9KcLngPRwPmckEXMnTOcnJEhJ81PxHeoHS+exBx4B3MoYKOYi6tvgibfd1eFU/47ASPD2EE9yHp5Sux6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB8102.apcprd03.prod.outlook.com (2603:1096:400:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 02:49:31 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 02:49:31 +0000
Message-ID: <592b612f-17c0-4022-b4d4-c8d4556f7a2b@amlogic.com>
Date: Wed, 20 Aug 2025 10:49:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: amlogic: c3-mipi-csi2: Call
 v4l2_get_link_freq() on source pad
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
 <20250819094533.2335-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20250819094533.2335-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0219.apcprd06.prod.outlook.com
 (2603:1096:4:68::27) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 980cf5a0-23a6-49a6-f6de-08dddf94301b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWdSQTNWRXpadllCekVjSDM3WDdyb1ZKT3FsTkR2QnY4VU5XMjRkdFVvWUYz?=
 =?utf-8?B?ZkREZXV3OXlnSXUybFRKOWJJZjRyQXBtV29pclB2eExhOGJPQS92dHBxNHpE?=
 =?utf-8?B?M2FtU0k0aFMwQXRlN2hESkh3ZUoyNy9IWUJJeWFtVHBjT2hIeEZKOFBRamE5?=
 =?utf-8?B?Yzl2L2JzR2w4TGlHVlRyUDJONHArOVhPYWFmWlZuMkcxT0JTUmw0Qi9tNTRx?=
 =?utf-8?B?cjN5dGVSR3d4eXNPQXk2ZHNzeXJkRkxxejlNQXRCNzhXZVh3d3RocnphQ2Iz?=
 =?utf-8?B?VGMrbXRPOW5zcXl4K252VWtQVzhQajNUcWtselM2ODU5UHpVU0N4SzNFUFRC?=
 =?utf-8?B?aFRFVW9ld1ducEFsSFdnVzZXOUVPdjY5Tm9GdXQvaGR6ZFBtRytYMmFPK3BZ?=
 =?utf-8?B?K0lZRmFpOHhTd2ljM2tPTXAxWWtZR2ZhblF5d3dDMW1UYzhkZnhSMVJqQ2tZ?=
 =?utf-8?B?aUdIdjRuZDJKUGpYbVRHTEtCL2VUQ2NXR1RjSlJOZWowaVRqNEd2bytsZzVZ?=
 =?utf-8?B?aWxaYVpBcml4NWlFRnBmUXVrdERJQ1FoY3ZBaGREQmc1RjJKTDViTU9jSnFP?=
 =?utf-8?B?Zng5NE0yVmNldE1PTStsTWM2VVRlYXVsYktMV3g3NE8rbTRmOXdtN01LRExy?=
 =?utf-8?B?WmFjdjVhdU1IZUNJL0F4aEtzREt2clNCYUpiSjMyUXI1bFhtbmxaQWNGNVJB?=
 =?utf-8?B?S2NZU1hZSEJSOHREVGRVRXZDQ29hemtmbHlCdEtEU2kvNFBDaWpDczZpdFc5?=
 =?utf-8?B?UmE2a2dPRFF1cHNiVGZ2RWNHSndob1A4Y1VoMFRyYVprU0ZzME9ORGNNUkNz?=
 =?utf-8?B?dzYvWU1rZlpVV3hoZENHL0tNOCt5WUFxbER4N1k1MCtBdnJhWmE1UE13b1dP?=
 =?utf-8?B?RjM3RGtpVWJXeXhXcnNwQVZ6SitvT2JDemh3RGMrVHZlVlFKSVlZYUJOY1FG?=
 =?utf-8?B?d1dhWm5nYW5RYWdmMm5KeEhXZWlQOTVQVmhhUktkSS9JMUp2cmxyR1VGNWJ0?=
 =?utf-8?B?U3QrRDBoOXdvOVVOcUhkcllhRWY1NUhxUXhPdmQxNE5WaGFGSFZUbXE1cDRT?=
 =?utf-8?B?RUlidmJMUE4yS3RKQmFxa1FKWHZ5QlhhbmwwWktLQ2hoUTFRbnA5UjNhbU5r?=
 =?utf-8?B?aGY1OStRZ2NNOEhCYzNNVDZhRyt2ZU5sN1RTby80U0dJWlFvY0RMaHY3TGNL?=
 =?utf-8?B?NlRwR0xhZWw2KzJId3BnNmszVWUrOUIxQ0JWNEpSeVBYeHFLeVZNNC9hb2hK?=
 =?utf-8?B?T1Z4UGhSMUdBckV6UGpucmFOcmhxVHkyQnBoRmVmYUYzM3FUTXAxMjM4bnlP?=
 =?utf-8?B?TW9HVWRPSzgwdmZkN1Y4TzFVeTNnOUhjbEEzS01wYmluZ3E3UWhwOEx3eldz?=
 =?utf-8?B?SG5oYlVhRTZjVXlaUXlaSEpCZW9zbEU1emVqU2EzeUFDQkxVNFUyOWF0MzlU?=
 =?utf-8?B?aTZSN01vdkwrMmlkSjh5L01PSFR1bjlrdXFCbXlkMTZnT0w2cTBTSXNhS1By?=
 =?utf-8?B?NmxwN0dMR0dtSDRyczk2OUZCcmNjSktqN1R1eWRKV0hYTlVpcEhKL1RmUWJX?=
 =?utf-8?B?M01ZNnRjc2xKVWtLTFhKSWJsY0xuTml5RVZDMjRhWHJiVy9TQmQwSnNnZVdj?=
 =?utf-8?B?cnptVjVrbVdKZlBRRE1nOUdXdlEzTzhzbjdYbVlVd3MxMkR5c1JkREJkcDRx?=
 =?utf-8?B?R2M0VjlrSE9rbi9PclBNTTNoRS9HS1dTT3Z1aXRQZTh4c0tKenhadjNyQW1P?=
 =?utf-8?B?T3hMdEZudXo0Rlg4MGJEdm00VjFPanByQUZ1MXBGd0R2SnNncHRQencvOU1t?=
 =?utf-8?B?UGs2ZUJXdFR4ekd2Q3k5RjRqUk5XdjdjeWJOL1RLa2RXUVl5S0NiWXlMRW1F?=
 =?utf-8?B?UXBxT1FsMTdKNkFjS281eTBxSHh1cnNZN1NXYWNCNGt2am5SblhaRC9LMEhY?=
 =?utf-8?Q?c+32LL41srY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1RZUFZyZXg2VXVtWXBmNGdRUXArV1k1cGJiWUZ1OTF6YVVwY2tKM3RUc0No?=
 =?utf-8?B?ZHRlSm9WVGNvN3B2TnVVNWlGOElqd2lOYlNFTXBER3dxYzdOcDhTMGxZVEE0?=
 =?utf-8?B?OGRid1Z6cjV0T0NTQTBVVkNUVW5yYVhDRi9vR2UyODF5RFpjQUF0M005QTF4?=
 =?utf-8?B?a0dTM0NxUEVrNklTYldnUUxSSDJzcm1UNUJqSEY0Y1RMTndtVGhPQWZCY0JM?=
 =?utf-8?B?aGZoYms3eTZ3c285NnJ6ZThmc1RzQXF5T0FEeU5EY0drQlozM1lGcEp5UjM5?=
 =?utf-8?B?d2VHSjZPU2lKajV5MkhrL0plRldTSHdyRmJMaFgxM2c5bHFnSGF2WStBUmoz?=
 =?utf-8?B?NGhtN05tdXNVYVZsVjdheXQxanhvSmNoSEhJZ1NEMUs5Y0JpaWtJRXBlTmMr?=
 =?utf-8?B?S1pEWXU4UlJKMzNtS2dyTmN4QWhZR0ZpeHBIV3lndVk4SW0zUUVaaXpDN0Iw?=
 =?utf-8?B?WjdaVDBBQUt4SkVDaDJvVUc4SDJ6eUsvNHdmcTdOdlZVRGZPS0ZMNnI3anpo?=
 =?utf-8?B?Tk9WYWdKdEhWVTNJaWcxZWh0bUVBcHhTYnlvMUhBL0RkZ1pVajU1MXpCZFBK?=
 =?utf-8?B?OFhRQXhUalhaMCtPRUdIeEdtSklCSytTYmw2OGFuRmhCc1pqdFhTUGVFZWJR?=
 =?utf-8?B?bEkyc1NuY2lCMVp0VytmSmtOVXZQRUZaeGpzVHNVZkhuNEJqcEIrWUlhQmF0?=
 =?utf-8?B?UTIxeFQxeWE2OWpJSkJFQkl1QjR1SCt0RUROd3lYWXdHQVZwcGNXdTB0d0NZ?=
 =?utf-8?B?dWJjdE4ranV6cUdXbkVDM3h4TG8rL01QS0hvd3h5cFZlSUlnenVBTVBVbDZO?=
 =?utf-8?B?c1h3aWVSMGxqemI2bjdTTSsvaGpIRE5vT3c3cDRTNHRyZkd1MksyTXhLQTZZ?=
 =?utf-8?B?THl0bFFqME56MWhLYWVyUmtPVENUUEtHWVBBdWY0L3Z5N0NrVytDU2VrZDNP?=
 =?utf-8?B?aWVpWHJnS2JBWHI2NFBRd21XZHVqNDhxU0ZReU9GVWpoQ1o4eUdxbXNSNWtj?=
 =?utf-8?B?VG84N1hTUzQ3bGkrWXZBdHN4SXNNR3hFRjJwTnhFc21HRXQxZE5sY281bDR6?=
 =?utf-8?B?UmVXOTNpY2JFakgxeDFyRE9CRHFqdk1QTHBCcjQ5c2pZUEl2Tnd2ZkRxSXRU?=
 =?utf-8?B?Z1N5d1NHRlpMYThWTnZzR1FJeXZpMWZzeDMxMXB1SlNBWG51VHFTZE44QUd6?=
 =?utf-8?B?bXhseDdZVnlIb2V1d25KOGVCWGtiVHVXbVUvbFdDUGxML25jeUkwUTJnNXp2?=
 =?utf-8?B?b01HeHdqTm1SbGNEZ25JNkd6Z2tsNTZXeDllRlE4MVlEZXJHQ3F6eStqcGdh?=
 =?utf-8?B?cHloNHJaaTNCTmo0bHN3M2FYZkozVG4xd1dFTXlHZGVmcHZCQU1XVHIxZFhB?=
 =?utf-8?B?aDVZeEpicDVzN1phR2FPaVYvb3RkL2YvZjNWcFZwRXNiRnlLME5uNko1Skhz?=
 =?utf-8?B?M2hFUUErTEtRRkVOMEhrOUZ0SDFnczVjbHBVRWpDbVNMVmhOQytTK21ET2xs?=
 =?utf-8?B?TC9kNFFLVkluN2hyRko2aUNsNzQyVi85NnVDTkxicHJnV1ZnOE9zUW52R25D?=
 =?utf-8?B?MUQ4NnU5cmxZSUFsejFvUjViRW4zaENQczk4VFhGMTIxdE1tSm5qNkNzUWx6?=
 =?utf-8?B?YmdJeVYwU25MaVk2WXhiSEpFeWxkOUtHb0ZJK2IzOVRETWE5K2pMVmoyeFdl?=
 =?utf-8?B?QmpXWTRSR29IUExlMTRTc3daS0tyODlhT2FobFpSWnhaREladjlFa29IRGhq?=
 =?utf-8?B?V1AwS3E0YWJtTHU5dVFaWGhEdyt2NTUrWTMza201Y0MyaDhnRi9laUd1WUFn?=
 =?utf-8?B?aDB3em90d0F3bEJoSWZUTHpnUTU2eGwrRnBDNFdqMWZodlZMaVY1akF2OCtF?=
 =?utf-8?B?NTU2NXBPWmRhNDNOMUZNTGJpSGh4WTlkTWJUMXVvTXV0WFpxZDJSbFA4eDhj?=
 =?utf-8?B?YW1qVHhSMVQ1OEREb2orQTFKcUZ1U3A4azZCbElDTUh0SnBxQTFHb3RvL1or?=
 =?utf-8?B?Rk5BZ2pWZE0vMEJzOFFIQVgyaTYvbExFWWd0cmVqRmVObG05UktnVjlPL1Za?=
 =?utf-8?B?NzJFQ3NqK1ZwZy9rd0dsRmpKNnNQTklaSUpBY0pubjNLY09WM05oa2xXSlVs?=
 =?utf-8?Q?BNrbwry1EOl0WLzZbEEMx7KyH?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980cf5a0-23a6-49a6-f6de-08dddf94301b
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 02:49:31.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q14Abi4Md01qhXl5scnypqCxuxUZPwGQrOwYzuUExrdcUxmy8Wzzs48eEja/brlYgiLTirYcOXaAwsMnyQKBRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8102

Hi Sakari

Thanks for your patches.

On 2025/8/19 17:45, Sakari Ailus wrote:
> [ EXTERNAL EMAIL ]
>
> Call v4l2_get_link_freq() on the source pad so we can remove the
> workaround that allows calling it on a control handler.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


I have tested this patch series on C3, the result is OK.

Reviewed-by: Keke Li <keke.li@amlogic.com>

Tested-by: Keke Li <keke.li@amlogic.com>


Thanks.


> ---
>   drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> index 1011ab3ebac7..b9e4ef3fc308 100644
> --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> @@ -388,13 +388,12 @@ static void c3_mipi_csi_cfg_host(struct c3_csi_device *csi)
>          c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, csi->bus.num_data_lanes - 1);
>   }
>
> -static int c3_mipi_csi_start_stream(struct c3_csi_device *csi,
> -                                   struct v4l2_subdev *src_sd)
> +static int c3_mipi_csi_start_stream(struct c3_csi_device *csi)
>   {
>          s64 link_freq;
>          s64 lane_rate;
>
> -       link_freq = v4l2_get_link_freq(src_sd->ctrl_handler, 0, 0);
> +       link_freq = v4l2_get_link_freq(csi->src_pad, 0, 0);
>          if (link_freq < 0) {
>                  dev_err(csi->dev,
>                          "Unable to obtain link frequency: %lld\n", link_freq);
> @@ -434,7 +433,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>
>          pm_runtime_resume_and_get(csi->dev);
>
> -       c3_mipi_csi_start_stream(csi, src_sd);
> +       c3_mipi_csi_start_stream(csi);
>
>          ret = v4l2_subdev_enable_streams(src_sd, csi->src_pad->index, BIT(0));
>          if (ret) {
> --
> 2.47.2
>

