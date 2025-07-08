Return-Path: <linux-media+bounces-37144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F5AFD41E
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0535188F4BC
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523C12E6118;
	Tue,  8 Jul 2025 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kwpTrsMR"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0812E5B31;
	Tue,  8 Jul 2025 16:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993970; cv=fail; b=G5IXZsbbUTmQrzWrubg0yTyjG6JRacHXkhfW34hfDOc/d6USVqPxqLEhLHT+wk2TONLS1AiwU1vH8DtkEeD1VwoWZ/rsiTm/KokZM86nAe/+nOcdnMgolhlDPN81bnzZBehOg1wxiLnOrBw3Q/5qrE9Jm/M0Wc1pKuo4dv1V7AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993970; c=relaxed/simple;
	bh=LjlR6QwYNVsD2161/nIKch9jDwnOuaa0W+gqvO2b15c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dB8A7ZakxgHKx/A+Jz4pH8a5bJx4qiB/AhMJ03t+zwtVA5V9D/0xtWRNJsGC/6G/sW9r8rnlIKkBlzTYLBxxjhUxvbjYtw6270zlaGZLmjDMZh06ps0eOjcHk0DHc4IAD5tOA3bR7KawvS6VgRKonrN0hn1vd92q5OEfCl8NAao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kwpTrsMR; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r248zd3bwXFvXJc+3Do2Ptk/pfXmYke2hI8X+Jldg6Of1PBLt7dCKSij6usH503oku9QDIwsjeV9Gji6fyigmWJ5PqR//EL5VUSYv+QXpBY8IS7psYWaKWz+1dYj1udrM9m3Q4Z6tMRK9h3y4uPGuMHcPiDuVI8wu4RlHvxVeorm8KaEnvW7MKd9/jsRJNUKKT7S3P7wNXwIp5S8092W1BZaI0gZQLLYNGHHtIarXVXkj6laoxMqg8RfX5JRkUnBt9sWATGD2/cbpc4mIWVX97JD31nH5o7gMBpwZNHndF+ftjFXj2zTOqIaHQXme3adT5aO/YLcF+S/UwIoS5J4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzf/PFORp2oEz5tXz/1PzP9KCtDXTNJB1uEvZVO1wPg=;
 b=q8fDchVcFX0dp02b2Fn2Z1zqGgchJqErvs+/AmsN9a7U3s4tib1DML6fEQe5e6v+QSZdvchGKxMiYoXfpJmRmj9zZlvQ7KGFwgAGnszlszQtCQepWlKADGmUo5cvlbaih8zFfS0nNc7PvuCgSWbggNrd/EHOyp5PWXdJvlZTmd+P5UOVllEIcmQd1qAm9Hbqh0OOGY/lwtmf9deIq2Ww3zj4S0wG/N5sZbnd6RJw0EKlCpfyJVr8BEFzYDszMhP4IUok/sUSmIMh/41F7U+VsHzEV4qovdkB7ZIMec/eg372texPvbXpTcMh3AYln6wIpNMRavqMQw1Nf8bjdmdjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wzf/PFORp2oEz5tXz/1PzP9KCtDXTNJB1uEvZVO1wPg=;
 b=kwpTrsMRvPNion+OZGxQCmEiWA2xSf3oyr2TdpcodVU4+uobSvsLxDsvj2P3NK58IDHYjJ3Wr2wpXW32m8k5MQpEAJUoCBqcr5UvHi+pUzozufmbMgplB4SfYrMOQ/MeRnyQgtVYZC8sT+vrDYFQI/E0pMF4u4oL18s/H/WibNGFMQhLvXNPN2ZAkXV663u3io97s6UfWyFCM0nEdNsEeXQCLSTyvs6tXMkfUIniffBwJZKssjIdeIKo4j7PgB+OYF2UvLsPsHgkWwN1EHfD69N4iNsz7LYHWQRcX9wBu1o6g2QjCYXyejCglo0p6psRH7l3JYSXPpvWHzPErkkYXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 16:59:21 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 16:59:21 +0000
Message-ID: <d65191b2-0988-401f-ae6e-9e723650f64e@nxp.com>
Date: Tue, 8 Jul 2025 20:02:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 1/4] dt-bindings: media: i2c: Add OX05B1S
 sensor
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-2-mirela.rabulea@nxp.com>
 <aGAz-TA7fjI-m76N@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <aGAz-TA7fjI-m76N@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a7b5c0-d90e-4c44-fd7e-08ddbe40c8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGJzaVRSL1ZneTU3dkY1dGdudm5SSmJ6L3FXbW00TDVSOTE3SFh0NThuVTBW?=
 =?utf-8?B?b0J0aW5nYjFHUmppK3hDRkVBMC9CeEprLzcySWhSZzVIYmdWVGdvZ2dEUUlw?=
 =?utf-8?B?MXgybkVzeXRrZ1RHbXFlTFZ4Nm5sMzRibHc1UHFHOGxROFJscTNwOURqaTFZ?=
 =?utf-8?B?SHl3R2sxbndLek16K2lQMWZuNDllTWdiV0xkQmtnenpXV1hKZFhpM2Uzd1g0?=
 =?utf-8?B?Z2FCQWdBS05aNUcydVEyWU5EWjZjNGlvZGxIMnFXSHk4S2tMdXNCNHY2Z3RP?=
 =?utf-8?B?SmxlSUN2N0lZckNwdHlxNmUzaThzMG9GQ2M5VURINXFNeGFlNTRUd2JyYWto?=
 =?utf-8?B?NFR5Q1VCdzVDekJDYmE5Z2pjQnF4N3psZjhwb0dLSWZKRFN4VEVRUlJzdkRT?=
 =?utf-8?B?aHhENzR6TEFraElxOGpFbTI2MUdENnhVNHFSV0RxWXVMWjhzTmlBS0RUMXBw?=
 =?utf-8?B?ajYzOXNjTGxEb2UxY1JtSytwd3pTYUE4REk1YUFxcVNUWCtyM2UrOFhrZFlj?=
 =?utf-8?B?cnErclc4MTJ6SXhuN3J5bStsM0IzR1cxQ0pyV1RoUTFQWEFnUTBaalp0UTR6?=
 =?utf-8?B?eVpmQjhHSUhZdWFDTGRtdUE0TmhKRlRTWkRwUXoxNDNBMzROdVVPMTVIcVkw?=
 =?utf-8?B?ZVFBODdpeGVHdVhCQmlNTVRncC9ZV1FjekJPQ1NZMEUyZjY5NktMQkZFelFt?=
 =?utf-8?B?YkMvRmMranUzTWJtU1FGdjZIeWlaRkhkRnBqdm1GM2c4dUg0NlNCcGtudUll?=
 =?utf-8?B?STdobUtUQ281Vm9IL0tObkdSQzg2ZlFMaDgrQ3RzMWl6NGxBdDV3Uy9oeFJO?=
 =?utf-8?B?VVhhTHI5S0I5NDl2alZQMjZGZ1hsaUNqZVpIcUd4N1NOelBiY1ZWTnkrQTNm?=
 =?utf-8?B?SUNKbjVPU2FRU0F1Tk1EOEU2OFFteC9UY3o0QlpRTUYva3VSaUwzeWl1L1NB?=
 =?utf-8?B?SzU5eEhxZENoeUM5aVdEdW5zWmJjU2JTTzI5MjA5UU9hQ0U4QWo0eXhzWnZ3?=
 =?utf-8?B?MVJiT1cxMjgxYkpRQ291eGtCRlVBajFPamFmODFsQWs2Y2RhRjVGSDFaTmRy?=
 =?utf-8?B?anp2ZFY1eFU5QnIzNk5VemVsNktHWlNSTm9BaFhhNEpkYWJvbi8ySGl0MWh4?=
 =?utf-8?B?NkdtckdtUVZUWUhUdCt6bEZoNGpvRnNURHBJMlhXbEV2b0pDd0V5M3RvLzFp?=
 =?utf-8?B?c1lYazdXdXNkTzRDNS9NUkFNOW9tZWY2aWRuMVZTaXZ6M1g2UkpscW1pSDZZ?=
 =?utf-8?B?MElOWWkwREE4elpqeHd0c0Z2ZXhnd3dhWURaT0M3QU9RZ2FwZm9ybDRObFJ0?=
 =?utf-8?B?WU9DS0pRQVVwTEJXQTl3cmpOT09MRkZLZEZXVFo1TVI3dDUwS1F1Z2V0SFQ2?=
 =?utf-8?B?MTZzQXJqM1F4MDE1Y1pTU0FNcWlDRWlZM2Y5KzVLcVFjdDhSZXJ2ZUZjRW1Q?=
 =?utf-8?B?YjBTRXN5ZS9BRDFOY3R0djVPSnozK3JMZDBoYXNVMTFZdUV6M0daT21YajQ0?=
 =?utf-8?B?ODRMbmFKUjAweFBrWkwyajZGaDZXVG11WTFTUVJNM2lCQk9PbHZhRG1CTEs3?=
 =?utf-8?B?SEZHTldKcUhBdVFOR0kxZmYwNm8vZ2h3QUdSbVVkSmkzdGpxZXVZRU9iRnRv?=
 =?utf-8?B?R2dUdWUyYUwvOUd1MmJMV2xIcFlkWEt0dG1Lenp5YnRyWTBSMnhHMk9tWFFR?=
 =?utf-8?B?Z1FnYmw2djlReS9BNDJSUEI4eGdrVnlINm0yamdwQ0l5aEZMaUtLem1LZENR?=
 =?utf-8?B?Rk84RHBSVkdsbHNkVXR0aUxVblhES0I5RDRabXNLWWE3K3B2TnZHSlJ5eXdR?=
 =?utf-8?B?ZHdFUEZpSXVkWnRKOEtHdnlPVTlYMFp0TEhwTWVoNG9RMVk3d0Z0Y1JGcWZN?=
 =?utf-8?B?Nm9zT2w0a0Z4TjNZSm9mbFhFWGZkTGRTbXRoQVRLR3NLcjV0ZzNrNDcrUFEx?=
 =?utf-8?Q?Gw8DDjo1gTb08yFQraFBvhwksnTtucRQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVmSmduaWcwL0V2VHJNT1ViaFRpR1d2OEFwdzBRL21wYTJrcEYyV2JPVFFJ?=
 =?utf-8?B?bHMxM2NmRVpNM3ZIaHMwVDVENDFVNm5udUJlUnlhSnVhVTBWenFFdnJ0MnpL?=
 =?utf-8?B?d1o0Smtwb0F1aGdqMUFoZEJIMjEwYzc3NXhPQWhJV0Z2aEtvNDhkTjFzRmZV?=
 =?utf-8?B?NkQzbEVmdWtQN3UwblVkV2lNMlZ6UjNLWVR2Y0k5NzVlS2tMMnFIRjhRaVFB?=
 =?utf-8?B?U1ZiTnk3SWltZXVGVTRsZEhoZ1FLU2dQYVZlQ3liUk1tLzFvaHpNbDJJSlRu?=
 =?utf-8?B?ZDU5VDhsT25oVHg5V005Z3Jqb2dKbkRiNXZsa08wNm9Kb3dWUGlrQ2NlK1Zj?=
 =?utf-8?B?UGZQRmwxRXV1N2hKZ1d4d2x2cWhWMlRCTkdPNGRqeW5CYXQ4WndJWlJkbStt?=
 =?utf-8?B?a0RnbTVOWWZWOS80UDU4YTYwaENSQlliNWU1ZWxhQk0wQ2s0UXcxcWhqejA0?=
 =?utf-8?B?RSt5bmhGV295VkcvS3ZYaCtWT2puQldDc094OHJrbkpEb21PTGswMGN2aExu?=
 =?utf-8?B?c0dtc3JvaG5KTHZ2V09VUEtGOUxFTkVNL3hKVnZWT1JFdGJQTndTQVd0ZGV6?=
 =?utf-8?B?QUI3WmpIRHI3UmE3N2dTWWY3TTNnL20xd3gwMkwrWVFWMTJOdndkbm5iUXNk?=
 =?utf-8?B?bWt5cG9DLzZ5TGVCV3FLM2JSVDJoMzRaOWlxeHVpOThrUUpFL3oyMGVBMDVU?=
 =?utf-8?B?USt2a0p6Wm1LQ2JRZ2p5a2RvWHV5VVdBVDlnMUNObEQ3S1hsNTkwdVh3YWNU?=
 =?utf-8?B?cHFiV3U0djh3T1czY3FoU3N4c0FGRHdEVlVwS0lUd0FYblFEU2t6VGxKS2Fy?=
 =?utf-8?B?eXpLaWw3TW05bmhKVElxMEJKZVBtWGhYL2xlRGhVYm5hdU9ZaXZPZzVlZlZx?=
 =?utf-8?B?dVVBazMyZ3llbjF0YWdWcUZJTzA1WXM5WWplWTAvSlcrNWxVN09BSzhBQndV?=
 =?utf-8?B?bXduQTVYV2pRZGJ2Z2xsY0k5SXljcWtWQzBqSHoxTnBuZ0tOejdWWDBZT3BP?=
 =?utf-8?B?VmswR0VUUFczVkM3V1dUOUo5Zm9RNzlSVnpmYTN0YmN3dmJqcEtkU09McGlq?=
 =?utf-8?B?Vk5Kck1tUTRlRWJiVTA2VUIzTkRBbC9sUVZLM2o4cWZOaHJsbkFuM0V5eXhH?=
 =?utf-8?B?Q05ON2NTc0RXRTQ0YXV6OUxLVW5WUElWMVVVdDAyLzY4bG1PRVBjY3l4MnR6?=
 =?utf-8?B?czZ3eWVBa2tnUlR2ckJvVkxHUXgxTVBFVW9ycXNvb3Z4RGc4dUpQdktGeDJT?=
 =?utf-8?B?ZnhKRUo1c3gvOTZFQXoyNzZNNlpDdG45SG9icVNVelFHNXNxaDRnaysrZURH?=
 =?utf-8?B?Q3JjY0NOc3hOT2hQOWdjTEJ4dEpGYTJtUUYrNCtQV2hjWGhtNUJGZm1vMEtu?=
 =?utf-8?B?eDJwSzRwT0E1dk5Bc2RGYWQ4enM4Q25Ec3pYbjZQNnFsaWlCWDVJaEc0Nnoz?=
 =?utf-8?B?MEY4VmtnQU45SmFwN1g2RjBqV1g2RDh0dEZFYTFyVzVxbExhQSs2ZW9QUGVX?=
 =?utf-8?B?K0NEZlZvNVNXN3J0dSt0VHh1Z21OZitNSGhybzNFUlJVMlRtUzhENjhXKzIv?=
 =?utf-8?B?Q1AyaS9VSnVhZ0hvM29aS0NPRkR6aVFJbkwyc2tlSnp1Z2pXeE96OW5KbmVr?=
 =?utf-8?B?WXhEMHJBZ0VKbkZ5STZhN1Fsejk0VVg1cGt6dmJXV2VpNmZESUx6M0lxQ1Y5?=
 =?utf-8?B?S1ZIWWxjbEY5ZktRYzFaWE1Wb0xBdmRibElUYW1OVGxmMi9hVzVnVXpzVzJa?=
 =?utf-8?B?akh2ZXg4TUxkMWlpa1BXbzVvYkxkZXpJVVgwM2U1OWR2anZXdDdCOVB3WFNW?=
 =?utf-8?B?VGg4SlFNcktLd0FJU3FsTVFtTSsva3dpY1lmU29FV2J0ckgrS09Na1JOWlBK?=
 =?utf-8?B?cGl2RUI2NTMrbzlLNW5xVmZmTytWYVF2c3gvaEo2b21ub3JmOEZ3K0loeHhG?=
 =?utf-8?B?cDRYMnk0S3pXcldUdWZzeXU0Q0xucHNENGI3MGlqQ0tIQWJzUzIvcnhMWUNK?=
 =?utf-8?B?VFRJaUtWbEVkQlJPV0ErR3pjNjA1VmpyZXlFYzBFUWdDaHVKMjJHOFllOXUz?=
 =?utf-8?B?b0pkLzJ1R3NtSW83VDM0UkhvUUhKYlNHK1R1Y2VtTGNQeHkyUDJBMC9VY2Vh?=
 =?utf-8?Q?2h9ncuMDexSOehmoivnPWbxdI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a7b5c0-d90e-4c44-fd7e-08ddbe40c8a3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:59:21.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfD1wfPbfzfxbRQ76sPEAVusV7TmO68Sl/LZpxnp2bssbw8RV/dBPwL+iabU0mRZV93SBmh5aPLjcfBYacO3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

Hi Sakari,

On 6/28/25 21:27, Sakari Ailus wrote:
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>
>
> Hi Mirela,
>
> On Wed, Mar 05, 2025 at 11:43:56AM +0200, Mirela Rabulea wrote:
>> Add bindings for Omnivision OX05B1S sensor.
>> Also add compatible for Omnivision OS08A20 sensor.
>>
>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Changes in v4:
>>        Collect Reviewed-by
>>
>> Changes in v3:
>>        Use unevaluatedProperties: false and drop orientation/rotation
>>        Drop items and keep alphabetical order in compatible property
>>        Shorten the description for reset_gpio
>>        Make the supplies required.
>>        Use generic node name (camera instead of ox05b1s)
>>
>> Changes in v2:
>>        Small updates on description
>>        Update subject, drop "bindings" and "driver"
>>        Just one binding patch (squash os08a20 bindings)
>>        Re-flow to 80 columns.
>>        Drop clock name (not needed in case of single clock)
>>        Make the clock required property, strictly from sensor module point of view, it is mandatory (will use a fixed clock for nxp board)
>>        Add regulators: avdd, dvdd, dovdd
>>        Add $ref: /schemas/media/video-interface-devices.yaml
>>        Drop assigned-clock* properties (defined in clocks.yaml)
>>        Keep "additionalProperties : false" and orientation/rotation (unevaluatedProperties: false was suggested, but only orientation/rotation are needed from video-interface-devices.yaml)
>>        Include assigned-clock* in the example, for completeness sake (although it was also suggested to omit them)
>>
>>   .../bindings/media/i2c/ovti,ox05b1s.yaml      | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
>> new file mode 100644
>> index 000000000000..9f35b4e67bea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2024 NXP
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Omnivision OX05B1S Image Sensor
>> +
>> +maintainers:
>> +  - Mirela Rabulea <mirela.rabulea@nxp.com>
>> +
>> +description:
>> +  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active
>> +  array size of 2592 x 1944. It is programmable through I2C interface.
>> +  Image data is available via MIPI CSI-2 serial data output.
>> +
>> +allOf:
>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ovti,os08a20
>> +      - ovti,ox05b1s
> The bindings only describe ox05b1s. How are the two different?

Indeed, thanks for pointing out. I will update the description in _v5 
like this, to include also os08a20:

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active
  array size of 2592 x 1944 and raw RGB-Ir output. It is programmable 
through
  I2C interface. Image data is available via MIPI CSI-2 serial data output.
  The Omnivision OS08A20 is a 1/1.8-Inch CMOS image sensor with an active
  array size of 3840 x 2160, raw RGB output and 2-exposure staggered HDR
  support.

>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: Input clock (24 MHz)
>> +    maxItems: 1
> Is this really a hardware limitation, or what the driver is currently
> limited to? In the former case, I'd include the range.
No, hardware is not limited to 24 MHz. I will include a range like this:

description: Input clock (6-64 MHz for OX05B1S, 6-27 MHz for OS08A20)


Thanks for feedback,

Mirela

>
>> +
>> +  reset-gpios:
>> +    description: Active low XSHUTDOWN pin
>> +    maxItems: 1
>> +
>> +  avdd-supply:
>> +    description: Power for analog circuit (2.8V)
>> +
>> +  dovdd-supply:
>> +    description: Power for I/O circuit (1.8V)
>> +
>> +  dvdd-supply:
>> +    description: Power for digital circuit (1.2V)
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    additionalProperties: false
>> +    description: MIPI CSI-2 transmitter port
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            anyOf:
>> +              - items:
>> +                  - const: 1
>> +                  - const: 2
>> +              - items:
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
>> +                  - const: 4
>> +        required:
>> +          - data-lanes
>> +
>> +    required:
>> +      - endpoint
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - port
>> +  - avdd-supply
>> +  - dovdd-supply
>> +  - dvdd-supply
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        camera@36 {
>> +            compatible = "ovti,ox05b1s";
>> +            reg = <0x36>;
>> +            clocks = <&ox05b1s_clk>;
>> +
>> +            assigned-clocks = <&ox05b1s_clk>;
>> +            assigned-clock-parents = <&ox05b1s_clk_parent>;
>> +            assigned-clock-rates = <24000000>;
>> +
>> +            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
>> +
>> +            avdd-supply = <&camera_avdd_2v8>;
>> +            dovdd-supply = <&camera_dovdd_1v8>;
>> +            dvdd-supply = <&camera_dvdd_1v2>;
>> +
>> +            orientation = <2>;
>> +            rotation = <0>;
>> +
>> +            port {
>> +                ox05b1s_mipi_0_ep: endpoint {
>> +                    remote-endpoint = <&mipi_csi0_ep>;
>> +                    data-lanes = <1 2 3 4>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
> --
> Kind regards,
>
> Sakari Ailus

