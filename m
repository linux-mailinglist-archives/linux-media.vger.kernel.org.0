Return-Path: <linux-media+bounces-23256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4C9EE1B3
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D95CF16668D
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9890B20FAA7;
	Thu, 12 Dec 2024 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="LwaSolGN"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2128.outbound.protection.outlook.com [40.107.117.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E9620DD62;
	Thu, 12 Dec 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993058; cv=fail; b=CnMD5xQEgW3Noz4RLT5WCsVg2csTynur/0ZInoOSCOkZ5L9XL2OhOwdTETz7iAdD9EAVewDtZln/IKZjJzeGKJ34etvlNjyZB3EkCcYoCQrlu2JPPWHHRLZBVvtTRnlSoTnWwNzfsHk3n5xZY7cD5q/hLYkpiY3D/YD/fx9QxK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993058; c=relaxed/simple;
	bh=c5ji/SLs/yNLaUY8V9Xqa0LpqLpQbUiInfHvMn+ivWA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rj64QqWPlqn27etunqfNptYa1KoLovJ6ifGP+Br4+p9CsgfM14RnnNP5Ss1dAujz4hFMd8OJ5DOkJz7zdnnno6q7QPhI54oOoZC+ROnFxDhP+TqV6sFq4khX+GjmlQCnSkonIif8xS8zivI7zGG8XRwgTpjQgDc3n8CmESXMSlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=LwaSolGN; arc=fail smtp.client-ip=40.107.117.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCbzc7CLsSagpIPI/LMDsMiitM6qjUP/tAWAoOFqiJPWPmtLoIoDRFVfc+IxzCATzDNKn/nvzaQuYZlRVHLBr9MPO1D7zc/5zCbHgdBwr1ZBbI05ZkUHs41bwtvU9forC2YM3QUljzGiV1VhQ812SvSs1AxB+fZvnsA2pr6e62Pz8oAIy8UV7Dm/crhiaM3eVjBRk2+S+CvyiFwEt1iaw+cZWGOn2Twdq8wgfNHjnPskdzVjRJYJCtvTWkgD5R/9v1Yi8ecy7RH/JrpH0FDfZQKtuwAOb+iDo/VXYGHar5eqSjWTaw3fbu15z7v2tw0xtKONW/qOnkxgkUyc9diULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bjnWfdZpy7xVCZ6+yJd0AGMP/vjRGeHarnb99UwjXc=;
 b=L4kKW5Pm0JKG47J5F1NbiQskHtxQ45lV5gdGXcDjCIKHIbSYxxFl/PIvvCCYFJzEYqZkpXd30AYjDRZOoR14gW2Xz238ld/Enyp5BMJdXetypjElgYafK3rRwLVD7XVe02HHriQjE0ijQKPQIrexkvoHr+4g6c2UC21XhbL/Vxm9cXZ6szpfLS+FIwPjxiSr1csYxrUTWYju33tyzgDQtMhN31+DbW6pyjH+6kGiU6oZw2oiyPGNq/qw58oRHy4+C4HLVqNW0JG9GnFgVizfRkcN2BP+4JPw2xT1xLDVkjX+GFvq2eBqp7wGqChcjmXBXl20hlMtUqu48bciPBteNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bjnWfdZpy7xVCZ6+yJd0AGMP/vjRGeHarnb99UwjXc=;
 b=LwaSolGNYEeYjgQxRnPBI3GdTQ/KHgfzRwiJx8o/gXRVcmY6xmNmnyA1bNzxKeGKvP0148JPhKfaxnEPzjkTLQsQgzI6iyWp9G26p/urZG5umoo+Sf5dgxwglnh43viAsMo3zucD5nAl0irTISIBW8RKbYCbxc/I5/kSt+5regrMRNOOxdzTFVuccYDgrUWdadr/1GWsi+X693N5JtqPW87gDm2OLe8iXcWs+UrhJgTCb4C/cJAVq5o/QsCINvSjB03e3P9zRXK8e+Gfsn8lmSSjLLzRI8muAm9j1hMhLHGDdUcgYAuNI9n1ISd3h+pBNeBt1iXwO2nhLSUEotYgbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7385.apcprd03.prod.outlook.com (2603:1096:400:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 08:44:12 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8230.010; Thu, 12 Dec 2024
 08:44:12 +0000
Message-ID: <be812803-bfff-43bb-822b-85e1c5f8ff11@amlogic.com>
Date: Thu, 12 Dec 2024 16:44:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] media: uapi: Add stats buffer and parameters
 buffer for c3 ISP
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-7-cb1868be0105@amlogic.com>
 <uep67vpp245wrbzs3xpwlxmknalnri7vc3paooqqpb67qx53zt@zdibmsldg2yn>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <uep67vpp245wrbzs3xpwlxmknalnri7vc3paooqqpb67qx53zt@zdibmsldg2yn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 39604594-74f0-4d66-2adb-08dd1a8926b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1J4RlR5Nktjd1BlcGdTTHMxbDN4L08vMmpYZ1I0S0hkb2JrTXIweDRucHdw?=
 =?utf-8?B?bnlBUWdMRFdBSHpoV3FFTWY4SmpRTVAzVXJkNGlOSFdiTytPOEtmdzFaSzlU?=
 =?utf-8?B?VlJwZDIxZVdTcFJ4V0NoZmhqNW9ucFZ3ZTVSajZRUWFuNmRpZkkxOE5KVTNt?=
 =?utf-8?B?V0xHMUVMUTFpbUZQdFQ5ak9WdUJXa3VSU29hMG5LRGRSRFl3L2ZaS3dhWWJN?=
 =?utf-8?B?MVZlWmNFMG9VemYxRkdockRTZXZxTExiQUxKd2V6b3kzTDZnaTIybWlwNUVr?=
 =?utf-8?B?Ymc2OHVxZFVhWE1tUWdXWVgvWW9jY1BZWElRVkNLMGpBbk95bkJTKy80Ykt4?=
 =?utf-8?B?eldhcnFkZmxhbVM4dEdQOW9RNmlPSWpaUjN5cUtLZ2wycU12MEdMTDNyTHRz?=
 =?utf-8?B?NTFsYjhqakIwZ0pvVWUwY29WRlFzMWVsVnFETG1KNDdEYzM2OHd2b3NXWU42?=
 =?utf-8?B?WDVBTzRQcFh1Y25tcUNBdXhpa1c3THNBaFUvUkl6ZVpOVGpUUFQ0VndIQkI5?=
 =?utf-8?B?d2FIeUwvaDJ3bUdoR0hjRklqcnFINFc4L016ZTBzbk04Zmp0OER3TmhPR3hk?=
 =?utf-8?B?VENiK2VEdVpDbXVCVGRNRXZzcWhpakJ4YTJuMEZiR0J6RnkvMDgwTFlSUlVT?=
 =?utf-8?B?ajVVMTU1dTNMNENiRmtvbFEwamtzS2xzSFlER1ErMDh5NnlBVWR2a2xpVEtt?=
 =?utf-8?B?dDB4d1RER0l0Z0VLV2k2b0tqcGRGdFQ1K0huZUhzeHJzOEYreUptOVhDSjZq?=
 =?utf-8?B?QVhIVFFFRTk4MGlld0tBTk5BSDVZMFJML0VoYVdvQ29DSnFMaC9zRnZ1U0tE?=
 =?utf-8?B?K3RxdlVzbzZxVWcvbHhHS2hBeitiaFNrTG94eHEyZ3drNUlqSHJWMnk1R0Ex?=
 =?utf-8?B?UW10OHpFV1M4c0h0MXViY1VqeU4xMDRiNkRzYkVxSHFOUkxVRkhuNXN0RkhI?=
 =?utf-8?B?djZWY2VIT1ZOb2YvY0swNGxFQXJUVi9Vcko1eUZDQjVMTmxRQUYrL25uUzBD?=
 =?utf-8?B?QzNrcE9IeWN1Y2p6Z05GTDA1WmVrWVlXSmVjM1VYMkIyR2U2VXdiemVRNmRQ?=
 =?utf-8?B?R0IwTjdMd2toTFd0aXUzZW5BSm1YMTd2clZKL3JON2NBN0pKWFJqd3Q2Y2pG?=
 =?utf-8?B?WUJZaElUN1dmSy9uYWwrMWpIcGJUYjNhbDBESFZhWGcxMkxyQmMxd3k3Y1Qv?=
 =?utf-8?B?aFNoUnhQZjFic0tIZzh5anBpaDVrOGxESWRhNVM5a2t4a1JoRUpqTEMwc1gr?=
 =?utf-8?B?UlVBNUhFRkNldUhqUzEwem5DRW81TEp5N25mV0wyWHpuaEZXdHlVc3EyVXkw?=
 =?utf-8?B?WWMxMFlNR1lTQktSZHV5bzhDMklKOHhubmVQcC9CeHRqNnRuNU91STE4aVQr?=
 =?utf-8?B?ZmFhekpTYW4vbENUamcvL2NTVTYzYXBvYnlMeW1uRWpreVoyb1AvR2FWa2dV?=
 =?utf-8?B?d3plUlo0RFgrQlpzN0hNZUZ0bUVHUjE3OCtLbkxJOXVtRWxjZVRFcnh1UkUy?=
 =?utf-8?B?bVNjRllwdkVaMjc1SlBtOFFZVjMweVE2U1F6cHFiaWRMdFJxNFplMERzSXZM?=
 =?utf-8?B?b3BlWkxvd3FFc1lRdkdqNmVDOUwyMVV4VnlTaXY5VEthc1JwSG9iL3YzaitZ?=
 =?utf-8?B?ZFRxRXZiNlFQMWpxcEQxdGxKSDRnTnZjeEZGL0R1TlZlZUFUWmQyandYa1VI?=
 =?utf-8?B?ZWNScXZqTHU0UkNQdXhLS3lmL2RwY2t6NGUxSy9xWitIbVNkaHZrU3dxM1Nu?=
 =?utf-8?B?TGo1QnZQdGFKKzBBcHQyT2hRa25xY0RGNzBUaUNkQlhCMG1NYlVIakxpK3Jm?=
 =?utf-8?B?cnRKZDA1UkdQQW9qUWViUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUpidTRjdVEwOWZ2L1A5a0ZRRm5XZktJWFFGTkd2SGNnS3AzRG50UU1jeCtr?=
 =?utf-8?B?SU5YNktWRVpVTDlkUm5LVnN4OC9qM3V2SFlUZlFqQkhGaGJYYm1OM0I2TjZt?=
 =?utf-8?B?dVBzT1FJYjZWd05Va2U4L1JUYmhiWWhhUjNWYkk5eXN5M2l0b2VxcmllQTRS?=
 =?utf-8?B?RzR3Nm04YzFIMUFHUk9VUUdhNjArTlVyMlJEZVdIZXJERjk4YnNDM2Z4N3or?=
 =?utf-8?B?ZzVyVlcxeFdTV2Q3NU5EQ3VEeERJd1JsbklCRmV1VUt5WHlSdElMSlhhT0xp?=
 =?utf-8?B?NmhxVW9QN0tuZXpvVGVJNnZ3aWs2L0k2V0RjbDFJN1RSV1dPdzhQN3lGb3FC?=
 =?utf-8?B?N3oybHIxT2lsajhSWUQxL240R2FZNDhzRXUxTkFCZUVaVzZYRHNUREFwbytr?=
 =?utf-8?B?RTBhNzBNSXhqNDF5dWpPTlJIMTJpKzFIa1AwVkdwZ1k4VSt4azR2cmk1Rmpr?=
 =?utf-8?B?cWJ6VG5wd3oxcXV4emJaQmYrNmtXeWI0NXZURFMvT3dQY1MxZE91N3JnNTBJ?=
 =?utf-8?B?MmVhcUpOTHpacGxDZ3RQU1FhK1dZa0JLeHpId3J1T09SMU1oN3MvVFZ6YmRx?=
 =?utf-8?B?MGFLS3VFcGhqUndHclFueWpFMXFPdWxPRmFzRDBTZVNXMFJoSUR0YXlKY3Yr?=
 =?utf-8?B?bjNTazk5VE5JWDVVamtXNXNwYjF4R3pIRFE3MU1CVC9pbXhmYXUwQVBkMTgr?=
 =?utf-8?B?ejVjWllwejZqM05oRlF4TGRmVlJFdFdRM2NEclp3YVFhczczck42RVlDeC83?=
 =?utf-8?B?YWphVWJaWXBUYkVTZ0Z2eS9lRUdjb2x2SjJyNTZnN3JYS1EwZlY4MTdGVFpP?=
 =?utf-8?B?SFBSc1ZrQi9PTFFsaksxRzVDaXdoeDBaeEhqT3FZdVpHelUrQjgwVVhVaHdn?=
 =?utf-8?B?Qm5peVVyZjErSnFHcld2ZzBpeW1BVFNYMTFXSkptdzYrU3NNL1d5cERZZmM4?=
 =?utf-8?B?dVN6TjdENjdUNFpRTmFHZFRabERJR1lqR0tla1cySlY4VkwxaHhnU1pZZ1Fj?=
 =?utf-8?B?VURZQ25UL1h2QStLQWQxcGFqTS9WV2p1ZExOVHI2OUNxNERaa2p6cGlpTUtl?=
 =?utf-8?B?clY2RzhXTzcxNE9ueHNzQjF0Ung5dkNTTTVUY2VCcmkrdXRVYVh3cW5jUmFC?=
 =?utf-8?B?T2V1dFhvZFdybm0vbkdJOWNvQSs5VG5yNTNsbW4xVkh3WUlhL282cndVaVJT?=
 =?utf-8?B?amdoejNMUTc4bGRTdGhMTGIzK1dYTWc3UW94cndEUm9mWEMyQXpsNkY3NkhY?=
 =?utf-8?B?eXdsY1ZnMU5qZmhUcHlvNHRNMkdUQXBVWUlwaGJObTVSK2VPUjhYNTZPM1RI?=
 =?utf-8?B?TDg1amhpK3MreVVQOWxnS3c3aDZPeEZqU1ZVSEdMbFFpRDQ5RUxqemdLV05Y?=
 =?utf-8?B?OTB3NW0xS0NHTE1PNm9mMDRleHpONVJycmlQQ0Q1WFRmUHROdW8wRkZ1R2F5?=
 =?utf-8?B?ZjNwVEZmQTE5ZDZuTVRheEphd1NnVEw1RmdwZWZIb0dSUVVlTWZ5SmdBSmdj?=
 =?utf-8?B?b3l3U2N3MTNVeFlzb0ZzN3NzRmpKMExlYlpodi96T3k0bk9ydUprQ0dITzJm?=
 =?utf-8?B?MVl0Q3hWR21xT21nT09DQU9KaW5oSEJOcUoyQ0VzRmoyNkwxUzNLdnJteUlt?=
 =?utf-8?B?ajlmaWVLR3NOeitkNmtROVdwR3RjbDRRczB2UWN1aTBpemdzZzNrd0hqZGNR?=
 =?utf-8?B?NGdXZjZRaG5LU2tvZzdTbXpic0tSa3dOc0VJRFFyMEZkT09SMjhva3NJUkcv?=
 =?utf-8?B?SkM0Rk5tUWM3NGd1ZWhpdm14eTQ3eHpHallGUUNCdGxFNnpSYjBJZG5tMHpE?=
 =?utf-8?B?aHpiWnlXOHF6SW9ZWEkxSnlTZWsrU2FYK20rMGdnNXN2dCs0dnFLUzFOcDBu?=
 =?utf-8?B?MmJxWlhoOCtVN0dGYnhkYWF3VGNHMmVBRk40dUloSE5oZjJHYlZkeW80UWtN?=
 =?utf-8?B?UVUzckwwdU5scjk2Z3loWkRNNlZ0dWloV3kxb0ZWQXRIZjBva2UyQkpjRlF6?=
 =?utf-8?B?ZGNHRXorNDJTTmtaMXpjSWJKTzlyNEtpNDM5ZWJ3Zk5EdldrMitaMFJHdXYy?=
 =?utf-8?B?UjNnR1hTN2w4eHFJcmpaUjFUUFVySFRiZG1qOEZIRjVnSUtkZGhvc2RxamRr?=
 =?utf-8?Q?Gn+Hns+S1qQJ3h+RwWxjmxtD/?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39604594-74f0-4d66-2adb-08dd1a8926b5
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 08:44:12.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8TYMqgPPuEqLfGVp7rvl/Pu42zat4NnCl4MZJeV1Gafm8tFnmfScyzV0WhFC53acEUySUX17OHpJ+qnd2adAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7385

Hi Jacopo

Thanks very much for your reply.

On 2024/12/12 01:21, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Thu, Dec 05, 2024 at 05:04:33PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> Add a header that describes the 3A statistics buffer and the
>> parameters buffer for c3 ISP
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   include/uapi/linux/media/amlogic/c3-isp-config.h | 555 +++++++++++++++++++++++
>>   1 file changed, 555 insertions(+)
>>
>> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
>> new file mode 100644
>> index 000000000000..52b9b805f870
>> --- /dev/null
>> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
>> @@ -0,0 +1,555 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _UAPI_C3_ISP_CONFIG_H_
>> +#define _UAPI_C3_ISP_CONFIG_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Frames are split into zones of almost equal width and height - a zone is a
>> + * rectangular tile of a frame. The metering blocks within the ISP collect
>> + * aggregated statistics per zone.
>> + */
>> +#define C3_ISP_AE_MAX_ZONES               (17 * 15)
>> +#define C3_ISP_AF_MAX_ZONES               (17 * 15)
>> +#define C3_ISP_AWB_MAX_ZONES              (32 * 24)
>> +
>> +/* The maximum number of point on the diagonal of the frame for statistics */
>> +#define C3_ISP_AE_MAX_PT_NUM              18
>> +#define C3_ISP_AF_MAX_PT_NUM              18
>> +#define C3_ISP_AWB_MAX_PT_NUM             33
>> +
>> +/**
>> + * struct c3_isp_awb_zone_stats - AWB statistics of a zone
>> + *
>> + * AWB zone stats is aligned with 8 bytes
>> + *
>> + * @rg: the ratio of R / G in a zone
>> + * @bg: the ratio of B / G in a zone
>> + * @pixel_sum: the total number of pixels used in a zone
>> + */
>> +struct c3_isp_awb_zone_stats {
>> +     __u16 rg;
>> +     __u16 bg;
>> +     __u32 pixel_sum;
>> +};
>> +
>> +/**
>> + * struct c3_isp_awb_stats - Auto white balance statistics information.
>> + *
>> + * AWB statistical information of all zones.
>> + *
>> + * @stats: array of auto white balance statistics
>> + */
>> +struct c3_isp_awb_stats {
>> +     struct c3_isp_awb_zone_stats stats[C3_ISP_AWB_MAX_ZONES];
>> +} __attribute__((aligned(16)));
> the 16 bytes alignment is to match the layout produced by the HW ?
>

Yes,  the hardware requires 16-byte alignment.

>> +
>> +/**
>> + * struct c3_isp_ae_zone_stats - AE statistics of a zone
>> + *
>> + * AE zone stats is aligned with 8 bytes.
>> + * This is a 5-bin histogram and the total sum is
>> + * normalized to 0xffff.
> Here and in many other comments text should be re-flowed to 80 cols


OK,  will re-flow to 80 cols.

>> + * So hist2 = 0xffff - (hist0 + hist1 + hist3 + hist4)
>> + *
>> + * @hist0: the global normalized pixel count for bin 0
>> + * @hist1: the global normalized pixel count for bin 1
>> + * @hist3: the global normalized pixel count for bin 3
>> + * @hist4: the global normalized pixel count for bin 4
>> + */
>> +struct c3_isp_ae_zone_stats {
>> +     __u16 hist0;
>> +     __u16 hist1;
>> +     __u16 hist3;
>> +     __u16 hist4;
>> +};
>> +
>> +/**
>> + * struct c3_isp_ae_stats - Exposure statistics information
>> + *
>> + * AE statistical information consists of
>> + * all blocks information and a 1024-bin histogram.
>> + *
>> + * @stats: array of auto exposure block statistics
>> + * @reserved: undefined buffer space
>> + * @hist: a 1024-bin histogram for the entire image
>> + */
>> +struct c3_isp_ae_stats {
>> +     struct c3_isp_ae_zone_stats stats[C3_ISP_AE_MAX_ZONES];
>> +     __u32 reserved[2];
>> +     __u32 hist[1024];
>> +} __attribute__((aligned(16)));
>> +
>> +/**
>> + * struct c3_isp_af_zone_stats - AF statistics of a zone
>> + *
>> + * AF zone stats is aligned with 8 bytes.
>> + * The zonal accumulated contrast metrics are stored
>> + * in floating point format with 16 bits mantissa and
>> + * 5 or 6 bits exponent.
>> + * Apart from contrast metrics we accumulate squared image and
>> + * quartic image data over the zone.
>> + *
>> + * @i2_mat: the mantissa of zonal squared image pixel sum
>> + * @i4_mat: the mantissa of zonal quartic image pixel sum
>> + * @e4_mat: the mantissa of zonal multi-directional quartic edge sum
>> + * @e4_exp: the exponent of zonal multi-directional quartic edge sum
>> + * @i2_exp: the exponent of zonal squared image pixel sum
>> + * @i4_exp: the exponent of zonal quartic image pixel sum
>> + */
>> +struct c3_isp_af_zone_stats {
>> +     __u16 i2_mat;
>> +     __u16 i4_mat;
>> +     __u16 e4_mat;
>> +     __u16 e4_exp: 5;
>> +     __u16 i2_exp: 5;
>> +     __u16 i4_exp: 6;
>> +};
>> +
>> +/**
>> + * struct c3_isp_af_stats - Auto Focus statistics information
>> + *
>> + * AF statistical information of each zone
>> + *
>> + * @stats: array of auto focus block statistics
>> + * @reserved: undefined buffer space
>> + */
>> +struct c3_isp_af_stats {
>> +     struct c3_isp_af_zone_stats stats[C3_ISP_AF_MAX_ZONES];
>> +     __u32 reserved[2];
>> +} __attribute__((aligned(16)));
>> +
>> +/**
>> + * struct c3_isp_stats_buffer - V4L2_META_FMT_C3ISP_STATS
>> + *
>> + * Contains ISP statistics
>> + *
>> + * @awb: auto white balance stats
>> + * @ae: auto exposure stats
>> + * @af: auto focus stats
>> + */
>> +struct c3_isp_stats_buffer {
>> +     struct c3_isp_awb_stats awb;
>> +     struct c3_isp_ae_stats ae;
>> +     struct c3_isp_af_stats af;
>> +};
>> +
>> +/**
>> + * enum c3_isp_params_buffer_version -  C3 ISP parameters block versioning
>> + *
>> + * @C3_ISP_PARAMS_BUFFER_V0: First version of C3 ISP parameters block
>> + */
>> +enum c3_isp_params_buffer_version {
>> +     C3_ISP_PARAMS_BUFFER_V0,
>> +};
>> +
>> +/**
>> + * enum c3_isp_params_block_type - Enumeration of C3 ISP parameter blocks
>> + *
>> + * Each block configures a specific processing block of the C3 ISP.
>> + * The block type allows the driver to correctly interpret
>> + * the parameters block data.
> can be reflowed


Will re-flow

>> + *
>> + * @C3_ISP_PARAMS_BLOCK_AWB_GAINS: White balance gains
>> + * @C3_ISP_PARAMS_BLOCK_AWB_CONFIG: AE statistics parameters
> This is AWB


Aha,  will use AWB

>> + * @C3_ISP_PARAMS_BLOCK_AE_CONFIG: AE statistics parameters
>> + * @C3_ISP_PARAMS_BLOCK_AF_CONFIG: AF statistics parameters
> I would say "statistic format configuration" for all blocks that
> configure how stats are generated
>

OK, will modify these comments.

>> + * @C3_ISP_PARAMS_BLOCK_PST_GAMMA: post gamma parameters
>> + * @C3_ISP_PARAMS_BLOCK_CCM: Color correction matrix parameters
>> + * @C3_ISP_PARAMS_BLOCK_CSC: Color space conversion parameters
>> + * @C3_ISP_PARAMS_BLOCK_BLC: Black level correction parameters
>> + * @C3_ISP_PARAMS_BLOCK_SENTINEL: First non-valid block index
>> + */
>> +enum c3_isp_params_block_type {
>> +     C3_ISP_PARAMS_BLOCK_AWB_GAINS,
>> +     C3_ISP_PARAMS_BLOCK_AWB_CONFIG,
>> +     C3_ISP_PARAMS_BLOCK_AE_CONFIG,
>> +     C3_ISP_PARAMS_BLOCK_AF_CONFIG,
>> +     C3_ISP_PARAMS_BLOCK_PST_GAMMA,
>> +     C3_ISP_PARAMS_BLOCK_CCM,
>> +     C3_ISP_PARAMS_BLOCK_CSC,
>> +     C3_ISP_PARAMS_BLOCK_BLC,
>> +     C3_ISP_PARAMS_BLOCK_SENTINEL
>> +};
>> +
>> +#define C3_ISP_PARAMS_BLOCK_FL_NONE          0
> mmm, in other versions of the extensible format (rkisp1) there's an
> ENABLED and DISABLED flag. It seems to me you're using FL_NONE as
> FL_ENABLED here. I'm not sure what's best, as setting a field to FL_NONE
> seems weird, but also having to specify FL_ENABLED might be
> redundant...


Will check this issue and refer to rkisp1.

>> +#define C3_ISP_PARAMS_BLOCK_FL_DISABLED              BIT(0)
>> +
>> +/**
>> + * struct c3_isp_params_block_header - C3 ISP parameter block header
>> + *
>> + * This structure represents the common part of all the ISP configuration
>> + * blocks. Each parameters block shall embed an instance of this structure type
>> + * as its first member, followed by the block-specific configuration data. The
>> + * driver inspects this common header to discern the block type and its size and
>> + * properly handle the block content by casting it to the correct block-specific
>> + * type.
>> + *
>> + * The @type field is one of the values enumerated by
>> + * :c:type:`c3_isp_params_block_type` and specifies how the data should be
>> + * interpreted by the driver. The @size field specifies the size of the
>> + * parameters block and is used by the driver for validation purposes. The
>> + * @flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL*.
>> + *
>> + * When userspace wants to disable an ISP block the
>> + * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit should be set in the @flags field. In
>> + * this case userspace may optionally omit the remainder of the configuration
>> + * block, which will be ignored by the driver.
>> + *
>> + * When a new configuration of an ISP block needs to be applied userspace
>> + * shall fully populate the ISP block and omit setting the
>> + * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit in the @flags field.
>> + *
>> + * Userspace is responsible for correctly populating the parameters block header
>> + * fields (@type, @flags and @size) and the block-specific parameters.
>> + *
>> + * For example:
>> + *
>> + * .. code-block:: c
>> + *
>> + *   void populate_pst_gamma(struct c3_isp_params_block_header *block) {
>> + *           struct c3_isp_params_pst_gamma *gamma =
>> + *                   (struct c3_isp_params_pst_gamma *)block;
>> + *
>> + *           gamma->header.type = C3_ISP_PARAMS_BLOCK_PST_GAMMA;
>> + *           gamma->header.flags = C3_ISP_PARAMS_BLOCK_FL_NONE;
> maybe explicitly saying FL_ENABLED is better ?
>
> I guess it also depends if your driver differentiate "update the
> config without enabling" from "apply a config and enable the block".
>
> I'll find out in later patches I presume...


I  will check this flag and wait your suggestion in later patches.

>> + *           gamma->header.size = sizeof(*gamma);
>> + *
>> + *           for (unsigned int i = 0; i < 129; i++)
>> + *                   gamma->pst_gamma_lut[i] = i;
>> + *   }
>> + *
>> + * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
>> + * @flags: A bitmask of block flags
>> + * @size: Size (in bytes) of the parameters block, including this header
>> + */
>> +struct c3_isp_params_block_header {
>> +     __u16 type;
>> +     __u16 flags;
>> +     __u32 size;
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_awb_gains - Gains for auto-white balance
>> + *
>> + * This struct allows users to configure the gains for white balance. There
>> + * are four gain settings corresponding to each colour channel in the bayer domain.
> easy to reflow to 80 cols


Will re-flow to 80 cols.

>> + * All of the gains are stored in Q4.8 format.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AWB_GAINS
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: The C3 ISP parameters block header
>> + * @gr_gain: Multiplier for Gr channel (Q4.8 format)
>> + * @r_gain: Multiplier for R channel (Q4.8 format)
>> + * @b_gain: Multiplier for B channel (Q4.8 format)
>> + * @gb_gain: Multiplier for Gb channel (Q4.8 format)
>> + */
>> +struct c3_isp_params_awb_gains {
>> +     struct c3_isp_params_block_header header;
>> +     __u16 gr_gain;
>> +     __u16 r_gain;
>> +     __u16 b_gain;
>> +     __u16 gb_gain;
>> +};
>> +
>> +/*
> If you want this documented by kernel-doc use /**


Will use  /**

>> + * enum c3_isp_params_awb_tap_points - Tap points for the AWB statistics
>> + * @C3_ISP_AWB_STATS_TAP_FE: immediately after the optical frontend block
>> + * @C3_ISP_AWB_STATS_TAP_GE: immediately after the green equal block
>> + * @C3_ISP_AWB_STATS_TAP_BEFORE_WB: immediately before the white balance block
>> + * @C3_ISP_AWB_STATS_TAP_AFTER_WB: immediately after the white balance block
>> + */
>> +enum c3_isp_params_awb_tap_point {
>> +     C3_ISP_AWB_STATS_TAP_OFE = 0,
>> +     C3_ISP_AWB_STATS_TAP_GE,
>> +     C3_ISP_AWB_STATS_TAP_BEFORE_WB,
>> +     C3_ISP_AWB_STATS_TAP_AFTER_WB,
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_awb_config - Stats settings for auto-white balance
>> + *
>> + * This struct allows the configuration of the statistics generated for auto
>> + * white balance.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AWB_CONFIG
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @tap_point: the tap point from enum c3_isp_params_awb_tap_point
>> + * @satur_vald: AWB statistic over saturation control
>> + *           value: 0: disable, 1: enable
>> + * @horiz_zones_num: active zones number of hotizontal [0..32]
> active number of horizontal zones


Will use  "active number of horizontal zones"

>> + * @vert_zones_num: active zones number of vertical [0..24]
> ditto


Will use "active number of vertical zones"

>> + * @rg_min: minimum R/G ratio (Q4.8 format)
>> + * @rg_max: maximum R/G ratio (Q4.8 format)
>> + * @bg_min: minimum B/G ratio (Q4.8 format)
>> + * @bg_max: maximum B/G ratio (Q4.8 format)
>> + * @rg_low: R/G ratio trim low (Q4.8 format)
>> + * @rg_high: R/G ratio trim hight (Q4.8 format)
>> + * @bg_low: B/G ratio trim low (Q4.8 format)
>> + * @bg_high: B/G ratio trim high (Q4.8 format)
>> + * @zone_weight: array of weights for AWB statistics zones [0..15]
>> + * @horiz_cood: the horizontal coordinate of point on the diagonal [0..2888]
>> + * @vert_cood: the vertical coordinate of point on the diagonal [0..2240]
>> + */
>> +struct c3_isp_params_awb_config {
>> +     struct c3_isp_params_block_header header;
>> +     __u8 tap_point;
>> +     __u8 satur_vald;
>> +     __u8 horiz_zones_num;
>> +     __u8 vert_zones_num;
>> +     __u16 rg_min;
>> +     __u16 rg_max;
>> +     __u16 bg_min;
>> +     __u16 bg_max;
>> +     __u16 rg_low;
>> +     __u16 rg_high;
>> +     __u16 bg_low;
>> +     __u16 bg_high;
>> +     __u8 zone_weight[C3_ISP_AWB_MAX_ZONES];
>> +     __u16 horiz_cood[C3_ISP_AWB_MAX_PT_NUM];
>> +     __u16 vert_cood[C3_ISP_AWB_MAX_PT_NUM];
>> +};
>> +
>> +/*
> ditto, use /** if you want this documented
>

OK, will use /**

>> + * enum c3_isp_params_ae_tap_points - Tap points for the AE statistics
>> + * @C3_ISP_AE_STATS_TAP_GE: immediately after the green equal block
>> + * @C3_ISP_AE_STATS_TAP_MLS: immediately after the mesh lens shading block
>> + */
>> +enum c3_isp_params_ae_tap_point {
>> +     C3_ISP_AE_STATS_TAP_GE = 0,
>> +     C3_ISP_AE_STATS_TAP_MLS,
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_ae_config - Stats settings for auto-exposure
>> + *
>> + * This struct allows the configuration of the statistics generated for
>> + * auto exposure.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AE_CONFIG
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @horiz_zones_num: active zones number of hotizontal [0..17]
> s/hotizontal/horizontal
>
> same comment as per the AWB stats


Will use "active number of horizontalzones"

>> + * @vert_zones_num: active zones number of vertical [0..15]
>> + * @tap_point: the tap point from enum c3_isp_params_ae_tap_point
>> + * @zone_weight: array of weights for AE statistics zones [0..15]
>> + * @horiz_cood: the horizontal coordinate of point on the diagonal [0..2888]
>> + * @vert_cood: the vertical coordinate of point on the diagonal [0..2240]
> I'm not sure how these fields are used, so I'm not sure if this should
> be 'point' or 'points'


I think should use 'points', because here has not only one point.

>> + */
>> +struct c3_isp_params_ae_config {
>> +     struct c3_isp_params_block_header header;
>> +     __u8 tap_point;
>> +     __u8 horiz_zones_num;
>> +     __u8 vert_zones_num;
>> +     __u8 zone_weight[C3_ISP_AE_MAX_ZONES];
>> +     __u16 horiz_cood[C3_ISP_AE_MAX_PT_NUM];
>> +     __u16 vert_cood[C3_ISP_AE_MAX_PT_NUM];
>> +};
> When passed through pahole this gives me
>
>          /* size: 340, cachelines: 6, members: 7 */
>          /* padding: 2 */
>
> Because the compile aligns to the larger members in the struct which
> is a __u32.
>
> so I think you should
>
>          __u8 reserved[2];
>
> at the end of the structure to avoid the compiler insert padding
> bytes.
>
> Generally, for uAPI it's a good idea to avoid implicit alignments and
> holes, and possibly align to 8 bytes.
>
> This is a new format, and it's extensible, so it's versioned, but I
> would rather make sure all holes/fields are declared as reserved and
> the driver requires to have them set to 0 by userspace.
>
> Reason is, assume you add a field to this structure in a future kernel
> revision: existing userspace compiled against an older header version
> will set the fields to 0 and the driver can ignore them, newer
> userspace can populate them and the driver can use them. Relying on
> implicit padding means that if you have to extend this single
> structure a new version of the extensible should be declared and the
> driver prepared to handle both, while I do expect the extensible
> format version to be updated only when a major change to the data
> layout (or the header) is performed.
>
> All in all I would:
> 1) Add __attribute__((aligned(8))); to all types
> 2) Check with paholes is there are holes or padding bytes and declare
> them as reserved, documenting that those fields should be set to 0 by
> userspace.


OK,  will resolve this issue.

> The discussion we had with Hans and Laurent to provide some background
> https://lore.kernel.org/all/20240724085004.82694-1-jacopo.mondi@ideasonboard.com/T/#m5333e7b6ab4230bb32efa063ab6fd73a529fdc29
> (I hope I got all points right).
>
> For pahole, what I've done is simply
>
> -------------------- main.c -------------------------------------
> #include "c3-isp-config.h"
>
> int main(int argc, char *argv[])
> {
>          struct c3_isp_params_awb_gains awb_gains;
>          struct c3_isp_params_awb_config awb_config;
>          struct c3_isp_params_ae_config ae_config;
>          struct c3_isp_params_af_config af_config;
>          struct c3_isp_params_pst_gamma gamm;
>          struct c3_isp_params_ccm ccm;
>          struct c3_isp_params_csc csc;
>          struct c3_isp_params_blc blc;
>
>          return 0;
> }
> -------------------- main.c -------------------------------------
>
> $ gcc -g main.c
> $ pahole ./a.out


Will use pahole to test it.

>> +
>> +/*
>> + * enum c3_isp_params_af_tap_points - Tap points for the AF statistics
>> + * @C3_ISP_AF_STATS_TAP_SNR: immediately after the spatial noise reduce block
>> + * @C3_ISP_AF_STATS_TAP_DMS: immediately after the demosaic block
>> + */
>> +enum c3_isp_params_af_tap_point {
>> +     C3_ISP_AF_STATS_TAP_SNR = 0,
>> +     C3_ISP_AF_STATS_TAP_DMS,
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_af_config - Stats settings for auto-focus
>> + *
>> + * This struct allows the configuration of the statistics generated for
>> + * auto focus.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AF_CONFIG
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @tap_point: the tap point from enum c3_isp_params_af_tap_point
>> + * @horiz_zones_num: active zones number of hotizontal [0..17]
>> + * @vert_zones_num: active zones number of vertical [0..15]
>> + * @horiz_cood: the horizontal coordinate of point on the diagonal [0..2888]
>> + * @vert_cood: the vertical coordinate of point on the diagonal [0..2240]
> same comments as above about 'point' or 'points'
>

I think should use 'points', because here has not only one point.

>> + */
>> +struct c3_isp_params_af_config {
>> +     struct c3_isp_params_block_header header;
>> +     __u8 tap_point;
>> +     __u8 horiz_zones_num;
>> +     __u8 vert_zones_num;
> Pahole points out an hole here
>
>          /* XXX 1 byte hole, try to pack */


Will add __u8 reserved

>> +     __u16 horiz_cood[C3_ISP_AF_MAX_PT_NUM];
> Because this should be aligned to 2 bytes boundary. Add a reserved
> field in between.
>

Will add a reserved.

>> +     __u16 vert_cood[C3_ISP_AF_MAX_PT_NUM];
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_pst_gamma - Post gamma configuration
>> + *
>> + * This struct allows the configuration of the look up table for
>> + * post gamma. The gamma curve consists of 129 points, so need to
>> + * set lut[129].
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_PST_GAMMA
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @lut: look up table for P-Stitch gamma [0..1023]
> lookup


Will use 'lookup'

>> + */
>> +struct c3_isp_params_pst_gamma {
>> +     struct c3_isp_params_block_header header;
>> +     __u16 lut[129];
>> +};
> Check padding
>

Will check padding.

>> +
>> +/**
>> + * struct c3_isp_params_ccm - ISP CCM configuration
>> + *
>> + * This struct allows the configuration of the matrix for
>> + * color correction. The matrix consists of 3 x 3 points,
>> + * so need to set matrix[3][3].
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_CCM
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @matrix: a 3 x 3 matrix used for color correction,
>> + *          the value of matrix[x][y] is orig_value x 256. [-4096..4095]
>> + */
>> +struct c3_isp_params_ccm {
>> +     struct c3_isp_params_block_header header;
>> +     __s16 matrix[3][3];
> check padding here as well
>

Will check padding.

>> +};
>> +
>> +/**
>> + * struct c3_isp_params_csc - ISP Color Space Conversion configuration
>> + *
>> + * This struct allows the configuration of the matrix for
>> + * color space conversion. The matrix consists of 3 x 3 points,
>> + * so need to set matrix[3][3].
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_CSC
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @matrix: a 3x3 matrix used for the color space conversion,
>> + *          the value of matrix[x][y] is orig_value x 256. [-4096..4095]
>> + */
>> +struct c3_isp_params_csc {
>> +     struct c3_isp_params_block_header header;
>> +     __s16 matrix[3][3];
>> +};
> Check padding here as well
>

Will check padding.

>> +
>> +/**
>> + * struct c3_isp_params_blc - ISP Black Level Correction configuration
>> + *
>> + * This struct allows the configuration of the block level offset
>> + * for each color channel.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_BLC
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @gr_ofst: Gr blc offset (Q4.8 format)
>> + * @r_ofst: R blc offset (Q4.8 format)
>> + * @b_ofst: B blc offset (Q4.8 format)
>> + * @gb_ofst: Gb blc offset(Q4.8 format)
>> + */
>> +struct c3_isp_params_blc {
>> +     struct c3_isp_params_block_header header;
>> +     __u16 gr_ofst;
>> +     __u16 r_ofst;
>> +     __u16 b_ofst;
>> +     __u16 gb_ofst;
>> +};
>> +
>> +/**
>> + * define C3_ISP_PARAMS_MAX_SIZE - Maximum size of all C3 ISP Parameters
>> + *
>> + * Though the parameters for the C3 ISP are passed as optional blocks, the
>> + * driver still needs to know the absolute maximum size so that it can allocate
>> + * a buffer sized appropriately to accommodate userspace attempting to set all
>> + * possible parameters in a single frame.
>> + */
>> +#define C3_ISP_PARAMS_MAX_SIZE                           \
>> +     (sizeof(struct c3_isp_params_awb_gains) +        \
>> +     sizeof(struct c3_isp_params_awb_config) +        \
>> +     sizeof(struct c3_isp_params_ae_config) +         \
>> +     sizeof(struct c3_isp_params_af_config) +         \
>> +     sizeof(struct c3_isp_params_pst_gamma) +         \
>> +     sizeof(struct c3_isp_params_ccm) +               \
>> +     sizeof(struct c3_isp_params_csc) +               \
>> +     sizeof(struct c3_isp_params_blc))
>> +
>> +/**
>> + * struct c3_isp_params_cfg - C3 ISP configuration parameters
>> + *
>> + * This struct contains the configuration parameters of the C3 ISP
>> + * algorithms, serialized by userspace into an opaque data buffer. Each
>> + * configuration parameter block is represented by a block-specific structure
>> + * which contains a :c:type:`c3_isp_param_block_header` entry as first
>> + * member. Userspace populates the @data buffer with configuration parameters
>> + * for the blocks that it intends to configure. As a consequence, the data
>> + * buffer effective size changes according to the number of ISP blocks that
>> + * userspace intends to configure.
>> + *
>> + * The parameters buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Userspace should populate the @version field to
>> + * inform the driver about the version it intends to use. The driver will parse
>> + * and handle the @data buffer according to the data layout specific to the
>> + * indicated revision and return an error if the desired revision is not
>> + * supported.
>> + *
>> + * For each ISP block that userspace wants to configure, a block-specific
>> + * structure is appended to the @data buffer, one after the other without gaps
>> + * in between nor overlaps. Userspace shall populate the @total_size field with
>> + * the effective size, in bytes, of the @data buffer.
>> + *
>> + * The expected memory layout of the parameters buffer is::
>> + *
>> + *   +-------------------- struct c3_isp_params_cfg ---- ------------------+
>> + *   | version = C3_ISP_PARAM_BUFFER_V0;                                   |
>> + *   | data_size = sizeof(struct c3_isp_params_awb_gains) +                |
>> + *   |              sizeof(struct c3_isp_params_awb_config);       |
>> + *   | +------------------------- data  ---------------------------------+ |
>> + *   | | +------------ struct c3_isp_params_awb_gains) ------------------+ |
>> + *   | | | +---------  struct c3_isp_params_block_header header -----+ | | |
>> + *   | | | | type = C3_ISP_PARAMS_BLOCK_AWB_GAINS;                   | | | |
>> + *   | | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
>> + *   | | | | size = sizeof(struct c3_isp_params_awb_gains);          | | | |
>> + *   | | | +---------------------------------------------------------+ | | |
>> + *   | | | gr_gain = ...;                                              | | |
>> + *   | | | r_gain = ...;                                               | | |
>> + *   | | | b_gain = ...;                                               | | |
>> + *   | | | gb_gain = ...;                                              | | |
>> + *   | | +------------------ struct c3_isp_params_awb_config ----------+ | |
>> + *   | | | +---------- struct c3_isp_param_block_header header ------+ | | |
>> + *   | | | | type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;                  | | | |
>> + *   | | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
>> + *   | | | | size = sizeof(struct c3_isp_params_awb_config)          | | | |
>> + *   | | | +---------------------------------------------------------+ | | |
>> + *   | | | tap_point = ...;                                            | | |
>> + *   | | | satur_vald = ...;                                           | | |
>> + *   | | | horiz_zones_num = ...;                                      | | |
>> + *   | | | vert_zones_num = ...;                                       | | |
>> + *   | | +-------------------------------------------------------------+ | |
>> + *   | +-----------------------------------------------------------------+ |
>> + *   +---------------------------------------------------------------------+
>> + *
>> + * @version: The C3 ISP parameters buffer version
>> + * @data_size: The C3 ISP configuration data effective size,
>> + *           excluding this header
> can be reflowed.


Will re-flow

> Thanks
>    j
>
>> + * @data: The C3 ISP configuration blocks data
>> + */
>> +struct c3_isp_params_cfg {
>> +     __u8 version;
>> +     __u32 data_size;
>> +     __u8 data[C3_ISP_PARAMS_MAX_SIZE];
>> +};
>> +
>> +#endif
>>
>> --
>> 2.47.0
>>
>>
>>

