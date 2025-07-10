Return-Path: <linux-media+bounces-37253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A99AFAFFA80
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739651C47533
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7B528851C;
	Thu, 10 Jul 2025 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="y6mdwgVv"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022111.outbound.protection.outlook.com [40.107.75.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE32882AB;
	Thu, 10 Jul 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131598; cv=fail; b=FZrK2egTuO/P1bUD22BJVzPe1alDdZnMruf9wl00Lb87hICbxhVuv32z5ud7DuP/+XmednEZcdYtGPNfEEcU3Dl4Hxecmun0tqFpQcDkugBfYb4XYNgI8CNxKJJkj2ULbWQEaXBKpNIxOkxQlFUuhvby6PRx2wQVNddE3YgrPxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131598; c=relaxed/simple;
	bh=5nlyMsONyIyICChwZJfd+URE1ADam0kSeT13jUoUI9s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PxPQczsIevpeLxBzKGMu/ctXCKD8RUGPER48N66nUOUo1pB/58Evz5nBDyesCcyucLPiegpbnbcB6LG+JETlFpxRM6+GZctQlzwas9M8/vJ16aEOS9wjtSLIQka3xrb9Q/btPUS6L1MAXcCRKLC67oUK2XDEFWjvBOXsVRHuWRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=y6mdwgVv; arc=fail smtp.client-ip=40.107.75.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBOXBuV0IShlWabH/lvHzvAINhK1NJ8m245Y5apXkzI3mEH+TAV4aKbLBVYhyRCNTN0hcShRx66RnWj2d03pCJaU4R2r4amsrzXJwN6bYOMu2gQSn+nkniyCuOM7LmiAh94bMXqz2tbmfbkJfIOQSW80tsjnllpWPVimdKZhRlnaT/vyMSsCrf0bwqt80Y7aEqC5ZTicoWUt57cSr0iHyz4U+PmMC5oel35Z7FkWodZ9Tz4TQkBaKPn83WfuSlE+jLvBx9607hxLDOUUpMLiWX/Kci1J777Y8fyyMZ8Xb4P0mXqHaHn7BcLO0i7WGcj1+Q0wiIpBgzQU5HfHsIvFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DikmKvJqrUQqovv3ikbr6+CyDlppVj9D7h5JMgNmfIw=;
 b=NM79jxP8db3nMoxifSp8s0mhtBEZIcV1g5/rV6r6hEbZgyEvLFv00gNZ9gUX4plKEZKMvkyjzOWlJ6bTcIkAl6C4KMUQi2hD3L3gSXKD7w8jqGBxl7fNyH541kHTcf4idWRRRp+0IS6k1BqAzzZblTxQcb8owVIMcDstBaeeDg1inUrMnBRSxRwgsNlISO83rjriAc+WqWjSvCjmsb5zQ/bN85d7QR9NssXye30U+ijwgcuWY/e6mVxKW+2ocCS2rYv8A/5rbaCmQ99wviwg02hyYuYha7BbzJ+Gux9LVT++BZc5n8W+ijOHlaaIQG1xoGYb3FVZPxsyUw0Nihe9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DikmKvJqrUQqovv3ikbr6+CyDlppVj9D7h5JMgNmfIw=;
 b=y6mdwgVvTumXBN47osHehbd6R8ll17yASDmO4sfRmGTN5gYZ1U67uxZFvB/UA2kIBvNZgZFr1tQLWAEwX1xH2HPaTe9QmDb6/h9uGmUxdD4tasLnoSyBewv2UNv70wXcFgFm8SSIWTk0dSJzmtYCX4WxxSPipD2TPMXJnfmPNyDV0taG7l5u5S3MerrizRfDSoU0DmXTsnfrIuLUfexYu8MkYVECT5sJ6LOofw94rAyY8ZsgpyHfADjuL4C37E1xSXELa0kZSaTgS3BJT8iMfa4UFSMTOTITwi4uahWP21T5JAaVv0s2O0hsV0ND5h+Qc4slzWzXLvUFU80GwH5Pgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB6817.apcprd03.prod.outlook.com (2603:1096:400:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Thu, 10 Jul
 2025 07:13:14 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 07:13:14 +0000
Message-ID: <c43294bf-cb50-4e85-97df-a0ef89c674f0@amlogic.com>
Date: Thu, 10 Jul 2025 15:13:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: amlogic-c3: Use v4l2-params for validation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-7-9fc27c9c728c@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-7-9fc27c9c728c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb4b0ef-1c9f-42ee-31be-08ddbf813c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlR5Zk1Kb01mZG9iNnMzUjF5dFRPN2FjSEFHVmxkWTFRYzdEc0lSUFIyeW5k?=
 =?utf-8?B?aTBtaElLOFh2eWVLamNrWGk2bHhrakZ6ZHhUdUg1dWc4b2JzODVNVXFzNERt?=
 =?utf-8?B?eGgxdWQzQVpqZ0g0V0QvUXdaVVVmaFhSdkNWN0FrR1JDM0crWms0ZEFMR0Zz?=
 =?utf-8?B?RHVVZnJaNFRaZUNoOVpPQ0xIMFFCeSthRlF2TThhdDlxVzNGSHZIRDdOTEtn?=
 =?utf-8?B?OTUvTm1LYkcyRk9Id3kxeGIvMXRNajlDeHMvL0Zua0txdDVwT2dBckY3WkxN?=
 =?utf-8?B?dkNobGtEM0Z6aGhMNEdKZU9WQlJqNXdxQWMxQ2JoUUNDMTY5dmd0RzVPbGJ1?=
 =?utf-8?B?ZVFPbHNMSGM4aTYxdS9QSldKdzFmRFo1NndpcDRzZUFheDBEcjVnU25TbHlU?=
 =?utf-8?B?QWJ3LytETTZIb0NKampiRExhUWpjYkI4VUpGYng2cjB5bXQ2U2FYYjh6cU9Y?=
 =?utf-8?B?dEI4Qm5pOWcvSkZ2aXpyMEtYYVZRMEtZUFVaRkFxTEo5bHBxcnlsR3RBOWl0?=
 =?utf-8?B?bENmckxWUjNUamZLYUVaUDBSSmx0bUp0MzVNNS9GMUJXT3VMMlB4c09FaXdM?=
 =?utf-8?B?aTYxS053dmlhMlBHUndmWTk5b0VCejY4ZVphK1Y0NjAzQXkzYVpXOUVjeldy?=
 =?utf-8?B?cktyYTNnaUNXa2l1TjRvYnh1UGdDZlQ2NEY3Yk1LUXg4RmNaTHlsQmtXeXNN?=
 =?utf-8?B?WjAvUURpeDh1ZEo2QWRGbkpwSjVRRWZ1TTgweFVaYXJRTWhBNDVqa2Fibmc0?=
 =?utf-8?B?cmJwT0VaNXV6OWxTN0IzRnQxcDVyMUxzeTJIZ2I1b0U4ekx2YjA1TEFoZGxi?=
 =?utf-8?B?eXJqUmxzUEJ0NGVFdEJseGNwM0Rmc3F5c2hhNEluSXhwakFxU0hYcW8vaytF?=
 =?utf-8?B?UmdBdm40bTlsOUZscGtTNW1TbEJBbU1rTWVpWXV5Q2M3d3pveHZlUTVkc0pM?=
 =?utf-8?B?UzV1ekd4NDJ0QloxU0ZzQUxNdEo3eWxMK205dWJaMU4wTjB1eXBjSklxUEYw?=
 =?utf-8?B?VmNqb3JSMk91YWVMZnI2dGhqOFJUSHZmU011UUk5VG5zNGk1WEErYTJNTDdU?=
 =?utf-8?B?NHI4MmxRc3JTb1JWUncrNmtITVZVblU0cng1UkRGbjFwR1ZWWk9IYjlZNnVq?=
 =?utf-8?B?TmVqSXdhOXRTcXVza2ZzYmtXMU1wQ2o5K1hTQjRXZVd6L012VURUWjZNRExy?=
 =?utf-8?B?SzJhVEJQVkNDNi9BcmwrOW9WNTF5RDZlNFNGbVkzZkQycjhFQTR3R1J5RThX?=
 =?utf-8?B?ejkrTFNKc3ZDREJJV1o5Nm0ySUpSL2dxUTVmQVZ2VDNYMGF3VnVKNlBuMThx?=
 =?utf-8?B?L042VEdrL2dXZVp1bVVqY1lha1pyV2NmVk8wNytGYjJCcXpIQzMxMlkrNXFW?=
 =?utf-8?B?OHViUmlzYVJNVlpqcUo1ekRjNmhkWGgvWmNZOWR2Z3RseTBrN0wrekR1Q0Ey?=
 =?utf-8?B?UFN4dEJ0THNlbEl2Q1RmNWJLbHlGaVYzNFZycDA1MWlOdWZ5dDZmUjZBWFRN?=
 =?utf-8?B?S3F4VjZ1NWpkZzQ0Q0tmWThwcFZUREZzYllvWEQ5ekY3TDhUWlNFUEp6NVZL?=
 =?utf-8?B?QU5oNHZ4TVhJODZPK2JablJFRjhLNUlMZVpTaXBHVmdOc0FncDJnbmxqRXl0?=
 =?utf-8?B?MnYvNW9tVXZaTUxpTXJ2ZEJBYzRvTitYUUtnUFo4Umh1QU1rSkpGOFBqc2Rq?=
 =?utf-8?B?Z2plbExFRk9UbWhFVHcxeHZBMzhwTUFVbFQ5b3NnOWVUYThWeWdlbnAzWGd0?=
 =?utf-8?B?ZzBvT2dsODFVZXBOYkxUajRGdlBucXAwaUI2REpBMnUrbzJMUmVtdVBkdTFj?=
 =?utf-8?B?WDN1STA4MS9OWEordzgzU3k4TkNLTXpHR2QzMXJZczNieVYzVFNCbHpHT0JD?=
 =?utf-8?B?UFhCcGpPQ2ZuWVlrME84eDZLQ3hPOVpyb1cyNVFpcXRLcUNEa0FtVFQ4cm1T?=
 =?utf-8?Q?kGA1X1GZVV8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk1OME8wWnl4SjVZalFqMURyakhyRi80cFl2dDFEMzgwTU5ZT3l0OHJZcFF3?=
 =?utf-8?B?am1jai92R01tRGthWTBVUEx6SkRiamJSZUNrb3BmajF1QnVhWlJadCtla1Nt?=
 =?utf-8?B?OGtyM1UyM3JvU0lEcVpBY2EveGN1Y1JHR2JDbktkOFhteHpLTCt5dWtRd0FS?=
 =?utf-8?B?WS9WREdIcHFOVWRNcVJSS0lpVVdsZEUzVnNCV3J2czhIb1FyN3Z3ZWg3cElI?=
 =?utf-8?B?R3dRTlE1bE1ORGRGV2hSU3Nid0dHU0czZGdLbEVMTFcyaW9vUkdkcTR0SmlS?=
 =?utf-8?B?Q21HRHkzNHJsTHRkYW1UZ0x2Zy9SMm1pOEIveDJvbFpoKzEzOGtNYzNFazhT?=
 =?utf-8?B?cnU0WXBrMUZGcHZaTnJqRkZCSlU5eUEzT09Jd0EvcjdrcXRMVldpcEpoUHRF?=
 =?utf-8?B?VmF3MDdEb29EK3gzekhBWE1vR0FQa1YrY1dwb0s0TENzZUlQT0xqbXFGSTlK?=
 =?utf-8?B?U3RrQU1mSmllZFJ1NzE4V3dpd1A4aGxzQVJ3QzRtdVRPbm1YUUg5TUNRWERB?=
 =?utf-8?B?cHlXYXl3V0NhL3VXamo1Vm95bCtKNlh5dVhCLytwY0VvSThjOGVFbkd3WFhK?=
 =?utf-8?B?K1VZZ1hLbERuWjhsMFZCMDVCZEt3S2pDZHZ5Q2J0Mnk3NXlvV3hjYnQvQ1FD?=
 =?utf-8?B?WlRMWU1DY0ZaTmFBK0lQQyswQUpGVlZqOFRYS1REKzUzalZsWVVrNnV0NEo1?=
 =?utf-8?B?VG5Kb3phL0dvbkE0SEVNNS82RzN1cVY4WkEvSU5YUjg5Tk5paEw2YWNZNHRX?=
 =?utf-8?B?TkhQcXduQWQxb3ptbGZ0ak1rb3dIbnNYLy83NkY3STVyeWQ5QW01V1RnMGEr?=
 =?utf-8?B?MlAwSVBUWjExTE10eUpFcFBXWGtTTHBHZmJlZFVkaytxSHpZSXJydTg0ek81?=
 =?utf-8?B?UGtJNWl5UXh5L3NvcDRvUXVrOThubnVWSUdRVS83NlN0U3ZDUDg1WmpRRlll?=
 =?utf-8?B?SjF4ZGprQWQ2a1FXNjFvT1UvNUZralFsQ2VSSG1Sd0phVUxtSUVNenBXWHYx?=
 =?utf-8?B?UnR3dWhDcS9zNit1ZU14UGtqVnhiTlhrd2FZSmNPZS83VDBEcmV3emc2NTZp?=
 =?utf-8?B?a2RtYzFtN0VEWnBENlFKeS9DemRacWdyRXc4OEhjTDBWWDE2bFFCN015U0ZU?=
 =?utf-8?B?a0drVWF4V0VGczF5V21pZVIwUWVJYmtrSlI4ME5hOXBtYW5oSkxyQ0ZHTnlB?=
 =?utf-8?B?Mk9Nb2NQR3V4V2FNdW90aW9vUnRHZTVQUXdKZmNsaDFSUXI4NVdLL1VhUVJh?=
 =?utf-8?B?dHRIMWNLWi84VzlwdlF6TXJtN2dWNEthb0t0QmhwSk9oMThRSk1ERVMvVFJh?=
 =?utf-8?B?NkVQZmY5QkRzYTZYc0M4a08yUTdEOUhKMHlpQnFRWGQzbTFZSTJQa3RSRG14?=
 =?utf-8?B?ZU1YTGlIaUZmODJSZlAwUW1ZQ3hUeEJDenBkbGcxZVpKM2MwOUVabSt2K1hp?=
 =?utf-8?B?OEVrOHJBNjhQdW5vQWRaNUdXMzNubmpuQVZOYXNmT3J4eHkrVUJUN1NteU1t?=
 =?utf-8?B?TmxqZHgrbDBCZmVQNFdEM3dCZjNKMndCREpMcGl0aFdBNFZ2QU16cUEwWWtk?=
 =?utf-8?B?UHZYaHNYWnorUlcxRW9pbmtiSVNJRGhiUWQ2OXViNmhaNFBMRWVoaXJNNTIv?=
 =?utf-8?B?WkYzTHNpK0R6NWErNVF3aU9iMXdCOW9aVGNIcStHUEFyaTNJKy9Ta2JEWmFD?=
 =?utf-8?B?MTJVOVhoOGZKY0E3R290a3R0VmFZa2ZlVFBXbGNCREdLSzM1dFVGMWlFaEV1?=
 =?utf-8?B?Ukh6SzVVVjVxVmx2UkdicnJVNnRxTERYbVVnTkJEMk91UGpJa2J6TjlFcFhJ?=
 =?utf-8?B?c245ZlNrMWhZaExHSVdJT0FDaEJrdWhNQnM1Ykpualpyd1NFL3NkaUVGckVp?=
 =?utf-8?B?OFlwaS9scmt3ZXYzYWFqRFc0N2hIZUVPY3lMa2lxeGEwNXVoT0xvM2FJYXlx?=
 =?utf-8?B?OFFhZjNBdHRhUVdUaktXQXhaZzhlL2RyQUFOYldpYVR6a1Jpckl5SSthWldX?=
 =?utf-8?B?UXB2dmtXWmtTdExDRTBqamFQNkZBdm12OWNua2R5dFhYNjBMc2ozYkdwTS90?=
 =?utf-8?B?UUhHTFNnekRrTlB4R0NQbHdoN0Y4eHJ4c2x6WVQ5R2dncDFPbVBYMG5NSDB0?=
 =?utf-8?Q?VPG1xEzhQRmQwSfW7fsulcSig?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb4b0ef-1c9f-42ee-31be-08ddbf813c42
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 07:13:14.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJYXssgd9dMYurErc2jOP8sbxecMQdR0IeLbYqrhK1EVksK1VRhffaA3ZRs7tDJ0RggCOexdE0VgIxZKJKApOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6817


On 2025/7/8 18:40, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Convert c3-ispa-params.c to use the new types fro block handlers
> defined in v4l2-params.h and use the new helpers from v4l2-params.c
> to remove boilerplate code from the driver.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++++-------------
>   1 file changed, 103 insertions(+), 169 deletions(-)


Reviewed-by: Keke Li <keke.li@amlogic.com>

Best regards,
Keke


