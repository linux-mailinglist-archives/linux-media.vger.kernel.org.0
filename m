Return-Path: <linux-media+bounces-32960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D1ABE8D4
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 03:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63B3C1B67306
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 01:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046281442F4;
	Wed, 21 May 2025 01:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ulXNulFa"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2086.outbound.protection.outlook.com [40.107.247.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4815143C69;
	Wed, 21 May 2025 01:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789560; cv=fail; b=DJ4uD6LKHtk7DKGaHyAvvSYpeAp+aX49DadXHLWh9v/EjHos/8LqnKCxJyEN0ilGB2WKecGEaEWd2URcEQZBZyXfy0ZyOQb2yHG1/MiNFLEwQP0TnwPsRMzqMCicyu1OE7YQRwvVxu6F5eT7aA7KiovvG5ch/+KFGpmU66k5i9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789560; c=relaxed/simple;
	bh=2g2DR8zOEhcqB/sgsxtN2VR7a4BYK/cHUaZzdMkWsSM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iGZB7m0h8Y4wfkogJagx3cANDoQRm1zs1mt3tsSYtVtF/cbLcabQa1P3pWd7DMgpO3Kpk/6sUDgaqLTwr4ruaveSO6/zR0MQfhY6sdwPWKE6eAinrhbv751H3x/MODKVIYKv6+XPDkI1sqfndm09FqXSmiIpuIvcIA7KdgtDnQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ulXNulFa; arc=fail smtp.client-ip=40.107.247.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOISD/tSYSKse1/ylxWaz9AADdyXUGTvvYnHdUdDsb1I6cF4F49eEClYE9lWquz2DBE2MZHdEmBKF0uQuGfSmEYWcgttwAilWPDdnxKir/Nuxu9xrr3K1LyFnQwhKZjvsliPEDc9xcwczkWqmVOghwaQ5uTZVnQ9jnFOZQe5FVXR/+ttg9N0s9kUKddoYLNyn6kQ608IlFVdpLvWp0l0IasvgBMDYGYsT/8if4z5Zju6zR6d6loPj67zGVwHeS9TFzSK9x+Efxt00OLnsgp9qAujcScFnNKyQXwrqt8v3wLDIADwuZSIwOci04F+iutkNKocFgWqOtm0ZS650ObN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSy+razrFNviQv9mrsIaR4Zxp2gcRXAnfTpc8tbKrQs=;
 b=rscCrCpTk+wXW983k6r5p/kCBH52zdVzK6ue6buTzp+IHUhv5MLS8zpKleloV/gG9cX+a8XNpILDz/a/9L7gxkxTb7sJGvFoRLPC6mWyTWXqILOtDalbPlg0RBUQo1MyzyhjYK0O5MvGb+sEHKiz7fWmDJZfWSjpE61mPu8JR+vAp76CTZhZv6rN9ti+exFo37wn14b/eSyGTqFkb6e/2BMkTsjD8ojdFOR4H1EBMI49XfOQdMmdTBIGCSvbb+dd2WqFwosDcEgqT5u//Jhh1pGGDbAFPL0VDznf1K8ptaNVYGruwXeh+cwy/ZTT3bgJzN7SmqUX9u1FlPNqQ4CAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSy+razrFNviQv9mrsIaR4Zxp2gcRXAnfTpc8tbKrQs=;
 b=ulXNulFaqzDMmRknJJEMYZlO7IybtyEMIv9kDMwxaii4UWNZH8d396lbOQ4fxl6AGE4VKAKwgA36ltMnVXV4+j/5t1dmypht4BWU2Cf5IaGGewisws0q4qvAl9g4pTVS/5az8OpClQXjEYFd/CVAE1HD5jb+QgWSokcvholkM1AgM/9PqH1+SGEdwZttXXwmQ5FYr2bjaDm2wE3WyG48PM2vZ6P8F65TAkR+4q8oC8JOroOYDmwft8KVNjxA1mSlXWRgDczwc3OpHpN0q03rQyP5/3idEvegBdfIFog9pnW/2RBKj7x/4Es543jmzzp4ce1aruW2smRGHXPqjJ3nqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB9PR04MB9939.eurprd04.prod.outlook.com (2603:10a6:10:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 01:05:53 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 01:05:53 +0000
Message-ID: <f1d504ad-65d9-4580-a626-a98ae5d76e77@oss.nxp.com>
Date: Wed, 21 May 2025 09:05:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: imx-jpeg: Account for data_offset when getting
 image address
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 nicolas@ndufresne.ca, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250506080816.1792-1-ming.qian@oss.nxp.com>
 <aCubHqUy3v+slA1b@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <aCubHqUy3v+slA1b@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DB9PR04MB9939:EE_
X-MS-Office365-Filtering-Correlation-Id: 402e75a8-2770-43b7-d4a0-08dd98039c1c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkkxZm1BWVFGa0ZlRk9oempxb0JNK0t4RTBRMzdVaWw4bVRiTkVIZ1V3WFQz?=
 =?utf-8?B?WnVtUnllV0pNdm4wZU9pblpPR0pBQ1B0bDdrRSt6UVM4VG1GZ2pnejNnWDBI?=
 =?utf-8?B?dm9NRXZZTDFIbXMyb2ZQbDY1a3l5ekQ2N09QMzBCSVFtcDV6VXNGTTdoNmxu?=
 =?utf-8?B?QXJNM2p6QmhnVUQ2dzhGM3YreGJOYzEyZS9qL1Y0alRyWmEyRXQvSWEvZEJz?=
 =?utf-8?B?N0hHcWdzTlhOOWpqelArU3JhejdRaFo4U2w1RW9qOUJCMWtHS3BNN0FGL2hO?=
 =?utf-8?B?Y3MzczVHU3VybE5Ka2ZnaCtLSmZ0bWh0bm1LUjJqa1dVcHhTTm1HZ2lTUXZy?=
 =?utf-8?B?cUlmS2FNZDVPc29KL0VnWm01YUxtcXFPRm5DK3dqOGJXT3Bkd0JKcHY4TFhZ?=
 =?utf-8?B?Y3JSMnJyY1Bxd0kxWTBQMzU2emNXQmtpOXMwc0djWXRGYm5QdStlOWVOQStE?=
 =?utf-8?B?Vk84RFFMYmhEd0YzYzRpbUNCQjJhVHZzSU10NGk4TVdoYkFnYWh4a3VQay9Y?=
 =?utf-8?B?c3RLQTJrSTdja0tqTi9RSE1GYWE3TitZQVAxVEZlREcrNEplaEVCOFRLS2Jv?=
 =?utf-8?B?ajArYythQnFqQlpZUkxqUHVvMWo5VFBmZStsMURGVnNGd0hHVkRFU2g4eU5F?=
 =?utf-8?B?TVV2b3JQa3hxSXVtblJad0hQYnFQQ0xtd0FaWVpqM3NrNDM3c0xHZDRtZUtS?=
 =?utf-8?B?T2IxSUFHaWtTSDQraUJuOWVHR2Y1U2RmdktDbTV1d2ZTSFRaZjMreGhROHFW?=
 =?utf-8?B?MGJjajlpM01vckR6UFJlUmJNOUt0cFU1bi9NbU9nUzAweDJJeXJGQkd5azF6?=
 =?utf-8?B?bkM1UG5CeHpZU09KZExyT2VaMkphVG5MbmIyd2xlR2xTUzBiT0lYNXFtZzRs?=
 =?utf-8?B?aG5hT3EwUE10Z0o5MFFwclNob1NVYmkxR1FrYlJJMDJ1aEFvS044bUFPeDBX?=
 =?utf-8?B?bEhpdHp4aFMvUXFpMkRKYzlQQkVWczVOUjVHMGhuZ0lWMkluQXkvaXJGMlJF?=
 =?utf-8?B?ZXVNcHRhRjI0QSthLzZ2VHBmbHk3ZnBNaUsxQTJTUXJ5MmRnQVViaU12ejdW?=
 =?utf-8?B?OXVvUDdvQ1J3c0hobitpYmZ0bGcwK3hvYkh4bHIxWFBIV0trcU03bmFuaXhI?=
 =?utf-8?B?VFJrZTF1dHFOTHVKeklFMENJV25FNDlrTXBxbkRReWY4ZFY1ZUd5YWhxdE5w?=
 =?utf-8?B?dElPWmlKZCtkS0wzZmM1ZUpWdE5ZY2t4WTJscVU5ODQrT2p6VHZJczFMbGRH?=
 =?utf-8?B?eU5SKzZ3b05MVFRucFBWOS9NVDVXc3RqMTRYYjEwTEpETmNkcWw4QUJxMUFW?=
 =?utf-8?B?alBDVk84UnFtQnNQazlwTkJrdEY4RGxRVHRabzB2OHNRNVFSS1ZRYnRhblJE?=
 =?utf-8?B?VFZ2amlleVg3OWFNcFZRL3FVaDl2b2RzTGNEKzhUUkVBcmNsMk0ycmtNaUk4?=
 =?utf-8?B?c1o3cHVrTWRoVlNWU3hMT1FjSkhoUE1PSGh5Ry9tWFkrTS80NFlIRXRnZ2Zl?=
 =?utf-8?B?cFoyN3VIMlNSRTVISnpveFNQTGdHRTJ1RlZZSEoyV0hGK2IvUEhQdXRzREN3?=
 =?utf-8?B?bXdoTmZ6d2dRbU4vL01iSEdGUHpTMENJU1oxclY3TTFHV2tGUUwzKzlqeVVh?=
 =?utf-8?B?bStDMEZvSU5NeWtuWWxqTThJRXZQK0QwYVJSZ1M5WW5uVWZzaXpCWFRYTU5M?=
 =?utf-8?B?dFgzQk10WEoxUENzcERJWEQrV01TVExQSFZxVnBZZmg2NGF6by8wSEVUVjRk?=
 =?utf-8?B?L1QrUnduOGFXT3Nqb1lRalRNeFdJanZRenB5SmVxVW1CM1BIYlc5cUNjWlAz?=
 =?utf-8?B?QUl6b3BRVEVDZE16NkVSdko2NStrMkR3V01TQjUyaTAzSjJneXRiaTZjRTds?=
 =?utf-8?B?bTFESDFGSDVsSzFRZUc2RFVaTU41N0FkVk5xdi9GL2E3dmVJcVNneWpULy9T?=
 =?utf-8?Q?+EnvfkC/API=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2E2U0RZUDZ0MjlKdnpmRUhmMnliaGhRSW9mSUZ1V0U5eFlNdTVhZ0NVdFRR?=
 =?utf-8?B?T09WMUkyTVdMb3ZSbW9tdzBHN1BEb29EcUJxOFYxRGp5R1l5bTJNWldDRlNV?=
 =?utf-8?B?K2RabzZIT3d5c2VoalNqMmJXcTVBMWJFNFc5T08vQ3VjaXBkVXMwc1JoMHRn?=
 =?utf-8?B?eDJ0Ym9RY2MraGdWbDNzYnY0NGQvbnp5ZDBFOGNRMVFrUTZFOW4xSTR4ZzZp?=
 =?utf-8?B?di9MOXQ1ZThaczF6S0FnRkFLNzh0OThxbWRaVXJSdFZ5TFV5dkdRNFA2dFVv?=
 =?utf-8?B?SEF6c0hnbmU2eCt0T2NtSUxVSGZSMHBTbHdPUU1Nclptc3pXaHBSeDVSMXB1?=
 =?utf-8?B?T3E5OGw4K0o2aVdJYVk4U3FTNXpwMndFQy9iTlJmcVpGMVpJdlltaFlTYlM5?=
 =?utf-8?B?VWdMNER0S25vSitJZnF2T2dobm8xQUJiUjRNTTAwTXpHK0NMb2M4QmltN3N2?=
 =?utf-8?B?TzFjS2U5My9jMEYwb1hObFV6NzF0U0lidDdMSlFZTG5OMG91ZlNwMDZkT0tB?=
 =?utf-8?B?NC9Vd09TQUxOKzlENzRwK29nLzEzazVmMnlaM1ZjR2p0aDBnaThFbndjd0R3?=
 =?utf-8?B?RE5ONkJiRkNCRGI1V3RoeHZaY3VxS0ZZc1JnK1J5MXh0QlhEdzFCWStMODBm?=
 =?utf-8?B?Zmd2Yld4K0gzNit2cHhHN0YvM1k1cFBjNkhMZ0p3RTQ0ZFZFTXluUTlPdVVS?=
 =?utf-8?B?RmdxZEw0bno3d1VkKzZHNlpTbEZWZzNGRjRTZ2lOQVJxN1hUazdaTkxVTzNj?=
 =?utf-8?B?aHFsN1dhTFlPUnhqRmljNEREa2FlZVBzNjh3b3lMUmo3ZUdsRi9FcW1FZ1Vq?=
 =?utf-8?B?QWRCclBDVzJCUFNOQmQzd24ycVUxNmVpZWNKRjcvSmEvS3ZuSW9VVVhwV3ZO?=
 =?utf-8?B?dmpFcFMwYnVWN3NPNW1zdGZLa216cy9JS3c5QUQ4dmlURncyRGdrdU1rbU5L?=
 =?utf-8?B?d1NZR0VBQnJSVXRlN2JGU1YydWdOWEMvb1F6R2xrMlJwT0pGdU1lYThDempa?=
 =?utf-8?B?WkZqV2l1YjFwaE8wQWR4VlVPOHdLcnAvc29COGtGT2RacDRtdkVkb2N3Mit3?=
 =?utf-8?B?a2xzM2gzTzRLc2EvV2JSSTEyUmovdWtvTVpRWmgwRjBtSkJoMFVBTWhtcHRD?=
 =?utf-8?B?QURKYjRpZHF0L1VEaS9mOUVEUlB2bDlqc1dOQkNkSWppQlArWGZSUkVBQ2xw?=
 =?utf-8?B?cVl4b2tBVS9LRjB3THVTYTVBZmVHVktPeGx6akxHTEhKL1ZWUW9kYm9ZSU9v?=
 =?utf-8?B?ZnhxaGUxR0ZRUU1HL0lVSCtRanZpV0d5UTJtMG92YUwyTVpIODZDcmFFMmN3?=
 =?utf-8?B?WGpHUmVlRllkSTh3dGFORDhrWjl3VWFmV1IvazZpNVpMbHRTb0lTdjJsWU1x?=
 =?utf-8?B?T0UrMHNDTVlBd1RFUUNZNmtsQ3Q0M1NxWGtIM2hSWWVpUzVmRnF0ZVZuUldX?=
 =?utf-8?B?WlA5ZGh4RW1xaFl1ZWhkc25YQmtzcjJVOFM1MXU0TTNnSGtJOWdDS1ZQUy9M?=
 =?utf-8?B?d09vd0t0WmRlYlpSUjhYVWU1V1RMK1k2OU5RTGFaeC9BUzdwRmNnVENHcXds?=
 =?utf-8?B?Smt2YTYzaGdXMjFaUDBhajN4bDBFRVcxcGh6czhZUHhwdlNnYWRtY3BUTGVF?=
 =?utf-8?B?T3pKM0pOTFltblcrOGdBWmwyQ3lVVUQyaFB5dzRnVk1wRG01bnZXNUVNT0tk?=
 =?utf-8?B?UDc1dGxnSjFYbHY1TEdWeisxVnd6WTY5a1V1cG5qbDAxNTZ6MWxKcFF3eGx0?=
 =?utf-8?B?bE9SemdWTEVUWXZDTjhEeFloT1k3b1VZUk1RaWxaMCt1S3Juek1TenVCY3d5?=
 =?utf-8?B?TFk1U3dITTB1U21wWjhSeVBNTFdvbFR6VFc3aEx4ZkhBcU02NTJ0UmJZdDNW?=
 =?utf-8?B?TWE2SS9TdFFYakFIY0dCeW54SnJUd2FRR1JRYzlqMStXRGJiY3hMOHVGV2Na?=
 =?utf-8?B?ck9KYXRTdGlPazNHZDNZUG45VVZiTWQ1WUN1YzJtakk3R3l6TnpSbWZWZURC?=
 =?utf-8?B?ZkUzeTEyOGlxSnZ4OVFqK0RpWE95U3NCN0d0SjltOUdTY1NyVUdqaVpmOHdK?=
 =?utf-8?B?ejU1L3RWTENnYXZuMGNmNFA5VDF2a01VVmpXdGk5UXJTODlKbmVKWUlNalZr?=
 =?utf-8?Q?C6O1vbiZ5OawkUr2PKh+JJSL9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402e75a8-2770-43b7-d4a0-08dd98039c1c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 01:05:53.3063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5P9Ll0z4sDz2GphHRF/+rMdP7lmDcfZd50DiqJrZ+pKXjRr7e3nS8eHFPftL02UbmBZJpyJzwr96MRT+Ru5Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9939

Hi Frank,

On 2025/5/20 4:57, Frank Li wrote:
> On Tue, May 06, 2025 at 04:08:15PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Applications may set data_offset when it refers to an output queue. So
>> driver need to account for it when getting the start address of input
>> image in the plane.
>>
>> Meanwhile the mxc-jpeg codec requires the address (plane address +
>> data_offset) to be 16-aligned.
> 
> look like it is bug fix, missed consider data_offset.
> 
> So need fix tag.
> 
> Frank
> 

Thanks for the reminder, will add it in v3.

regards,
Ming

>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v2
>> - Verify the address alignment in buf_prepare()
>>
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 ++++++++++++++-----
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
>>   2 files changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 5c17bc58181e..8681dd193033 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -598,6 +598,27 @@ static void _bswap16(u16 *a)
>>   	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
>>   }
>>
>> +static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, unsigned int plane_no)
>> +{
>> +	if (plane_no >= buf->num_planes)
>> +		return 0;
>> +	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane_no].data_offset;
>> +}
>> +
>> +static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned int plane_no)
>> +{
>> +	if (plane_no >= buf->num_planes)
>> +		return NULL;
>> +	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offset;
>> +}
>> +
>> +static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, unsigned int plane_no)
>> +{
>> +	if (plane_no >= buf->num_planes)
>> +		return 0;
>> +	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].data_offset;
>> +}
>> +
>>   static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>>   			  unsigned long len)
>>   {
>> @@ -610,11 +631,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>>   		return;
>>
>>   	for (plane_no = 0; plane_no < buf->num_planes; plane_no++) {
>> -		payload = vb2_get_plane_payload(buf, plane_no);
>> +		payload = mxc_jpeg_get_plane_payload(buf, plane_no);
>>   		if (len == 0)
>>   			len = payload;
>> -		dma_addr = vb2_dma_contig_plane_dma_addr(buf, plane_no);
>> -		vaddr = vb2_plane_vaddr(buf, plane_no);
>> +		dma_addr = mxc_jpeg_get_plane_dma_addr(buf, plane_no);
>> +		vaddr = mxc_jpeg_get_plane_vaddr(buf, plane_no);
>>   		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
>>   			 "plane %d (vaddr=%p dma_addr=%x payload=%ld):",
>>   			  plane_no, vaddr, dma_addr, payload);
>> @@ -712,16 +733,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
>>   	struct mxc_jpeg_q_data *q_data;
>>
>>   	q_data = mxc_jpeg_get_q_data(ctx, raw_buf->type);
>> -	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
>> +	desc->buf_base0 = mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
>>   	desc->buf_base1 = 0;
>>   	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
>>   		if (raw_buf->num_planes == 2)
>> -			desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
>> +			desc->buf_base1 = mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
>>   		else
>>   			desc->buf_base1 = desc->buf_base0 + q_data->sizeimage[0];
>>   	}
>> -	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
>> -		offset;
>> +	desc->stm_bufbase = mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset;
>>   }
>>
>>   static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_fmt *fmt)
>> @@ -1029,8 +1049,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>   			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
>>   		}
>>   		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
>> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
>> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
>> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
>> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
>>   	}
>>
>>   	/* short preview of the results */
>> @@ -1889,8 +1909,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx, struct vb2_buffer *vb)
>>   	struct mxc_jpeg_sof *psof = NULL;
>>   	struct mxc_jpeg_sos *psos = NULL;
>>   	struct mxc_jpeg_src_buf *jpeg_src_buf = vb2_to_mxc_buf(vb);
>> -	u8 *src_addr = (u8 *)vb2_plane_vaddr(vb, 0);
>> -	u32 size = vb2_get_plane_payload(vb, 0);
>> +	u8 *src_addr = (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
>> +	u32 size = mxc_jpeg_get_plane_payload(vb, 0);
>>   	int ret;
>>
>>   	memset(&header, 0, sizeof(header));
>> @@ -2027,6 +2047,11 @@ static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
>>   				i, vb2_plane_size(vb, i), sizeimage);
>>   			return -EINVAL;
>>   		}
>> +		if (!IS_ALIGNED(mxc_jpeg_get_plane_dma_addr(vb, i), MXC_JPEG_ADDR_ALIGNMENT)) {
>> +			dev_err(dev, "planes[%d] address is not %d aligned\n",
>> +				i, MXC_JPEG_ADDR_ALIGNMENT);
>> +			return -EINVAL;
>> +		}
>>   	}
>>   	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
>>   		vb2_set_plane_payload(vb, 0, 0);
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> index fdde45f7e163..44e46face6d1 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> @@ -30,6 +30,7 @@
>>   #define MXC_JPEG_MAX_PLANES		2
>>   #define MXC_JPEG_PATTERN_WIDTH		128
>>   #define MXC_JPEG_PATTERN_HEIGHT		64
>> +#define MXC_JPEG_ADDR_ALIGNMENT		16
>>
>>   enum mxc_jpeg_enc_state {
>>   	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
>>
>> base-commit: 2e79181dfc85e1347a8655ea8d8a314158155c52
>> prerequisite-patch-id: 0000000000000000000000000000000000000000
>> --
>> 2.43.0-rc1
>>

