Return-Path: <linux-media+bounces-22093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889A9D9B15
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A125016644F
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074871D7E35;
	Tue, 26 Nov 2024 16:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XZAJShV9"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A851D45F0;
	Tue, 26 Nov 2024 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732637448; cv=fail; b=nHIZYjDmya2Aes44kbnpkLXaRtyENIe9lg8O+gCTOpCKTGXGN91TwbB3vQ6VOqUUHqCfwJy8NU3cCohzuFA5sPodDS7vebOuOVNWOF4DKPw8C/YZhblHveJ2zNKyZVtvG+tBIZccxHQV4cpgex2QVdE6BJl+/copD/KON7Diae0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732637448; c=relaxed/simple;
	bh=eQazCuu8eNmdDVI6Fq7LT04vKo1c6xpVxtnAAu0OlzU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gOA+1nnTjP+TWpkdf1316ntZRuSblgCMQG/72bckIImdDTUfVNOLbGfzwP3lOh1akZhwn+f1sY7dZcEW7LuR7CogQ6kJ1cxyhy50PHjFoExPatHAIL7Hl6FVWdTeCD7lloIuYG5gNKIv9R+oGXEcciUktORQeCcu1jrmdT/hjM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XZAJShV9; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwT7Fp7Rs9jxtoBUBmqmsiWarWb+dBlnhOqMB81KXFxK5sGPdEIh/DmDnZ3BMvEG8WGfS2KIRDiDf8liE0lsSH1tU6giCrKTtUbkO37jBNWveGJBZgxLQngxeuDUTahMh4pryJw7qsT8gf80Ps3jinVsuEd/73+KhBTQUbqFz1j4steiU9LcEKtHBleGWqHVKkgIYFtV0T5tm/Y+pvrH9kHwYRN89QciqUT94w3Ax8kyO1vMAhQtOnyXtEiA2uT5CCbfKd0wBHGH44OeF0iq6CG53CtKA7YtVOcWR/puUXlAPPlpILV+bTQ4/MV7Gnw9MjkFUDI/QqhMQ59X0eQ6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMjzVw0ZgwIvHSUcwxnF0FFae+Icx7n2F5ecyfFo7eY=;
 b=Ktng19pd39jHX2kTCOtb4XFjIOQ/aTf30tQV+uAQyxEcrPeHHaKZPul7scTHWrmctla3j+YADLQaOkhQYkHCTD/bifkrROeYwmVWY/tjnEui6JGokJJZHi5O9qy7ce8HuxMGCt4GIxKuzxvkoQIg9IsSLQwZNePzrdd44ynUb9HC39pN4/kMem5ItB+faw/oQmnF6tC7c5YvYXYcAgHJwSY6vULa9f+89MvCE6RC6IQPvjLfMlW2LVZycsAKFoUKxvg6DLuy+akI1KME5QRBmhd0v59ooavEkjEftC/R90UonfMB2gqln3vVZYkKEGgOUrxe9ZdcP+XS5zXpTipHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMjzVw0ZgwIvHSUcwxnF0FFae+Icx7n2F5ecyfFo7eY=;
 b=XZAJShV9S9WuAVYUH7l5zWZZlYAF/0IqmPyPkecRVETFRpVlbd0Qk6/TVODlJJaK5HCVGHcwBnltQc5/WabZNvrVmQuox2Gn51NrTD1uhhsh+KjrkMqBQO5gQ2QB/FjkUweZ8CXMi43E0hEZ0VaDQpmFghpt0GJl7109aonHrJzRxl0EsgPlMiWxIzEJf7j1qJQAKXEvpUZSm0x5TZelgslRpaxfmNrjHLaZ7U5721IL/4Ux/R5A6OoIHK8hhCEN8910Isi7ZqdK2JWK679aMwEB/F9orK/uAKP6GDrsfpmy3HQl8/EIfnNXUA7Kni1u9uzv54Q6kIHRLBGAWSGYIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS4PR04MB9692.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 16:10:40 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 16:10:40 +0000
Message-ID: <469ce7d1-9dde-44bc-9e18-e414d83c9f57@nxp.com>
Date: Tue, 26 Nov 2024 18:10:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>
 <20241029115747.GL22600@pendragon.ideasonboard.com>
 <7cee3358-bf8c-4ae5-a688-12ff18d4b7e0@nxp.com>
 <20241104142543.GA27775@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20241104142543.GA27775@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::28) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS4PR04MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: 579cb292-5306-426d-71d5-08dd0e34df44
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?c0NqdThZQ0EzeDFhSXdFSUkyUmRteVdXUVVwNUtoTk56VXorbzhtY056TGV6?=
 =?utf-8?B?TDhQWmFhSnZEOVBWb3FoTFY3SUN4VHFXWmx4clYvVTA0bVNlUGtmdVc4T1pC?=
 =?utf-8?B?bDdNd1prY0YxNldWWU03ZU1zd2huM0JGTEFNUkJEVjd5VW1sTEtDVzFJalR5?=
 =?utf-8?B?RU9zRms0QlVrUGpSVWlJNWJwWjZsY3g3S2xrays2Y1lyYWRyOXlETDlHeHBr?=
 =?utf-8?B?QmtoY3hhdEtFUFJoaWJJUVNkdDBrc1gydk5tY29JZzUxRUVBczRNTE1jNzhL?=
 =?utf-8?B?QnNzUU5ZRG03MStMaW53dWx3bTFYTVh3dUdTZXZFenVsbUVSaWM3ekhSdmJ1?=
 =?utf-8?B?aU5kT1JwVjdUS0pPWHVFNUlTYkVROS84THdFQkFscWNBMlJsZXJpamFLVzdI?=
 =?utf-8?B?ZXFEdFppSmdIRkR3Yi81c0pUN2cwK0F4ek9UbXYyYjR2dElCdTVSSU5BU0Ey?=
 =?utf-8?B?MTFBWmdzMGs1QklGY2JqQ1FxZ2dpU1pFYWVDUW4rNUlIUkZlQU1uMUxSYzNZ?=
 =?utf-8?B?MmlZR2hiVWdCSXlXWit2K1JlbW41VjVZd1cwYlZBU3dUay80eUR2ZFNFVjFl?=
 =?utf-8?B?ZC96M2NQM0N5RTdIN1prdVNmbEozZUF1SGwySEZxaVkvNXU5ckJZdzIvekpx?=
 =?utf-8?B?bkprazJiUjNiUC9FVEJiMFRPb3VwRkR4bnFwRTFZVnJTUFRXa3dGQnFkYXFs?=
 =?utf-8?B?WUdydUwzNENnODNpaVd5WUdnR3JHalFXS3pUVXNtSXFSZjB2MFh5aXd0R1Jv?=
 =?utf-8?B?V2NDcld2MHdoOXdnV3BjY0pYa3A1QWJYV0V0WTBaS3lwazBvZTdDaElKNHhC?=
 =?utf-8?B?YWFTRjJGMHpERXFiOS9kTEpSWWxvandETWVBZUo0bG9oYzhvRHV4NC9SZjV0?=
 =?utf-8?B?bGVpY3ViQWl3TlJlUkpmbDN3SGcvMjdQbitPcEpQOEFVekxxYWpoK3BIa2tn?=
 =?utf-8?B?NmxUU2ZGdlExZ3ZIcFhxN1phTUZ0MGRaNmlTTG5UKzlkL2E3NGgwdFFGbDhz?=
 =?utf-8?B?RWtqNjVhWTd1MmVDVjVyQnVmbTk0dlJjTWltR0JPcCsyellmVmprdXBGb2Mv?=
 =?utf-8?B?Rk1EeUpmcnZQR3dTUm5DUkpDYzd2RXgrb29tbkdWZXpjOTdzZ0xFZE03ZjB5?=
 =?utf-8?B?dHlOTWlxTG40WDNHbmdqdUwrSFMwOVBhdGJuVkZpVEZwZHB6b1Z5QjBXa1Zn?=
 =?utf-8?B?VlMyQTdCaGtXRi9HdFA0LysrT3BPMTZxUGNtVTBoQnFENDU3RFFBOTFIa2R2?=
 =?utf-8?B?WXg1OE94S0szSHIzRTRZN1JiUFFlZEVkQjk0NjF2SHBicmkxMTFkT29PcnlX?=
 =?utf-8?B?NWs4SytSRFlFanVZdmhXeWJLV3g5WEl5MWNHR3dHTUowYXByUkZJVUd4RU8y?=
 =?utf-8?B?RzRsRGxsOWlSSHlyMGlUNkw3WHUyVXNmTmFvNDRUK2xjK3VtT3lQTUM3Skli?=
 =?utf-8?B?VzB2REVSS2xhOTE2b1VBMjVSV3Yva0cxRmRWTGhnNUlTSmw5NDhIcmdtQm0x?=
 =?utf-8?B?ZkdUbnZscVk2b2tzeHFtcWhzRjNRdWlNM3N1SDJwLzNzU0pGSXlreHBPR0Jk?=
 =?utf-8?B?WFFaTUtKUnljWXZBQXJYcFViR2dCYzhXSTVBaHNOZTBpQWRlN1NreFhkUnkv?=
 =?utf-8?B?U1puRzI2MzhScE5CQ2hKTmk0MFBVeVVvTHVtaTU0YTlZOUNpa1lsWXU5dTVl?=
 =?utf-8?B?TjRoZStXN094N2c0M0FOMzdSTjVvbkJBS3d4RWM3bE1TbGh3Tm1ObVlXM0ND?=
 =?utf-8?B?aFRqVXBxRml4VjJJQ1NLRW1oUS9tQTkvRzBZZ0VYYWEyaVQxRmZFaitjd3pM?=
 =?utf-8?Q?3U38FWJ5h117u8DPppyOdYY4w+6KZj12JNkS0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YmxiYVhYWG4zUzBOUkNHK3dDWUFReUtubkV6RVRvU3FzZm1NdmtLcEhTY0t5?=
 =?utf-8?B?M1hpRjdVajBkTXY0NG5VRnU4ZmNEckk3anViV3VWTS9mQUYrMzd5NFBuMnB6?=
 =?utf-8?B?RHJVbnBLeXNkN0NsbDkyYUNzdjlHQnZqNHpQam9YcEJNYWF2QU9DU25SMzdB?=
 =?utf-8?B?bTFCbjVNOWlacjBab2RDaWxnODdOZTJGYS9JZzVpTjNJRktiYS96enBKSmNw?=
 =?utf-8?B?Nk1QMlAvVkNrVTFSblhqRElPNUFBQ2R3MGtvYlRxWGo5YjBLK3RzNzVUb2Ix?=
 =?utf-8?B?d1dLVm40Z2M0MW5xUWdKbnQvK2x4S1NXOHlua1lWTFpUU1NHUEQ1K3VydkJQ?=
 =?utf-8?B?NWZtelIvWlpuTEptcHdtWFBWSEJBSzFRemoyUW1BMDQ3UkRMektrQWp5RmR3?=
 =?utf-8?B?S0Q0Z0tjdVNucE5rejRhbm5mU1VMZ1JBRldqZG9rYWcrcEwrWjlCa1QrZGZN?=
 =?utf-8?B?TUVJd3A3NGw4bnNhMHVSUjF6TWdhOTJudU1kT0ZxaWtsUjlBbmxzMXNqOTlI?=
 =?utf-8?B?cEwyYXB5YkovZE9zdWk0QVR3enlaa2xKMXZDdC9XM2VwaEFiU0hvclVqR2kz?=
 =?utf-8?B?L05xQllkK0cxZE1VL3c1aG0ydXNrUS9rWHVNQVh2aHZBWDdLRzEvbmp4Q0VK?=
 =?utf-8?B?MVpWeWY0NlljdXlvcHJlbzZQOUpET3lpRm50ejEwcm96N1lRcWhETGhYT1Z5?=
 =?utf-8?B?aUZtWjcrdnJBaTd5ZnYrMitQSjJWN3BjNndldjh0dm5tZkRBNkp5aFpsY1Vv?=
 =?utf-8?B?a0lyZjRYd1FHZlF6VzlwdTJraW1aWTMyWmZqZk1rcEhBRW9YUVRDbU1jTjFa?=
 =?utf-8?B?KzB5cEk5MTkvbGJjK21rbjdmZysvTytDdkZJOXhHb1pxTW12TFVBQWdmd01l?=
 =?utf-8?B?Q1ByZm5Yb0RKdE1GeE8wb00yRlQ1c0k3Y1BNaDVRQUdqMWVyUGNFaHdJS28v?=
 =?utf-8?B?cjQrLzJXNGYxR3N2VHJRUGMrWjZPYmxkU3dTT3YrSHBhYUJpd3J4Z0JDZ09z?=
 =?utf-8?B?UnJ1VU93bDBLeHJ5citQZ2dLS2FTbjNKZ3RyMzJienRRazhLY0F6K2h5UytM?=
 =?utf-8?B?RGRUT0dkajdpM1QvNHF6VHkwbkxNbWhkTUVkVFEvVTk3QW5nQ01vaFFNNmti?=
 =?utf-8?B?bTQ1OU1XL1FkSHBiWjFkY3hGVytvUHZ5SGRVRTdaWHQ1bEpaK1ZJMk9YaFlr?=
 =?utf-8?B?TkxaLzJ4VnNUZkdzZVNLS2NWcEVhZ0tPalZzOFdzZXhuVUw1cXJWNm9tZXpQ?=
 =?utf-8?B?Wjl2YWVQakVRV2x4Y0x0QjNyTFVob2dXT3hxZ3VQYXlRK2t2NmRoRmJjdVNQ?=
 =?utf-8?B?b2RwZHZkcisvVnp3Y0xjR3M3Tk9EbndYME9sdW5IbE9CMEtoYmJ2TDgyVWRZ?=
 =?utf-8?B?Tmt3RWxodWpKaEVGN0RXN3MwaDdYa25COWpCNDd5NzhBUXdwLzFNTSs5eW5L?=
 =?utf-8?B?dG9QYk1uMUNiZEp4KzYvUk42d0dzd2hkOTZMY0hnSHFDREZISkxGYUxUeENh?=
 =?utf-8?B?NzlOckJVRWdpUHBRaU0yS2VpdTFlL1k2RHhZczd0T0FFd0hzSTBSaWYvQjZa?=
 =?utf-8?B?NHRTVWQyT1E3aU1qNkhQT2s0NnBrTURRbDVJcnBJYUErRzZtVitKbVFkVFBk?=
 =?utf-8?B?encrdDFxWmd2Z1VZTGVyd01aZ2NLTk9MNkIrVEc4cGdtUzRvUW9RbS93d0RU?=
 =?utf-8?B?aEdtbERrdFJzY3FucVVqVFU0bHN5NVU5dXZ1SGpGTi94Z0ZYRkhoVnpENEFo?=
 =?utf-8?B?NzJMZXdjV1I4QVROSUN2QmppUElQam9nK0ZxZURocUVSVGovS0hqODg1K1Vr?=
 =?utf-8?B?dHRTcEhHQ1czVEZrdFJqdzBINmpxUnJGMGt6cm0xOXNITGVrSXg3WU0zSXhZ?=
 =?utf-8?B?VjNHTEZrL0VxTTFkUk52YW9wa1ZtTnhVdm40VDhyL0JOTmduVzhBdEZFQUt4?=
 =?utf-8?B?RGVyNGN3VzdDcXIyOEIrQzE3RjcrRmRsZWovSDdQUWR0N1NRK2NLOWFQOVpu?=
 =?utf-8?B?N0hwSGRvZEt2VzB5WVRzSVE0djhYa0IzRnFXVkJodzl2Vk9KbjNHUEgzb0Ey?=
 =?utf-8?B?cUI1ckZYSWU5MnNlMXpyM0NNcms5RTY2UmNEdTBuRktqN3kxTHNkeGVCR3NG?=
 =?utf-8?B?QXVkemwzRU5uNWtzWkk4RXJET3pwaXZuZnFyVjB1WkxrdFh3ODNWZTRwV0ZZ?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579cb292-5306-426d-71d5-08dd0e34df44
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 16:10:40.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sW/Zz3ICnAHIKSBkTZeWJI/x+WeJroHycqv+In3P/F0Jyp5mLQQ9cmT7OIHHZ0PvIXu2uw0RxR5chnmTOsDmeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9692

Hi Laurent,

On 04.11.2024 16:25, Laurent Pinchart wrote:
> Hello Mirela,
>
> On Wed, Oct 30, 2024 at 08:02:44AM +0200, Mirela Rabulea wrote:
>> On 29.10.2024 13:57, Laurent Pinchart wrote:
>>>>> +
>>>>> +  orientation: true
>>>>> +  rotation: true
>>>> I think you can drop both of these too.
>>> Aren't they needed given that the binding ends with
>>>
>>> additionalProperties: false
>>>
>>> ?
>> I added orientation & rotation properties in order to support
>> orientation and rotation controls, libcamera warns about those (optional
>> requirements last time I checked).
> The orientation and rotation properties should certainly be specified in
> DT sources. They are standardized in video-interface-devices.yaml which
> Bryan pointed out you should reference. If you're not familiar yet with
> with how the YAML schemas used for DT bindings reference core schemas,
> now would be a good time to have a look at it :-)
>
> In a nutshell, you'll find that all properties need to be properly
> defined with appropriate constraints, and properties shared by multiple
> devices have constraints defined in core schemas. Some are included
> automatically and are applied based on property names, other need a
> manual $ref. You can have a look at
> https://github.com/devicetree-org/dt-schema.git  to see core schemas that
> get automatically selected, they specify "select: true". For example the
> schemas defining the reg or clocks properties don't have to be manually
> referenced.
>
> Bryan's comment about dropping the orientation and rotation properties
> was related to the fact that the video-interface-devices.yaml schema
> defines them already. With "unevaluatedProperties: false", you won't
> need to specify "orientation: true". With "additionalProperties: false",
> you will. It's a good idea to learn about the difference between those
> two and how they really work.

Thanks for info :)

I just sent the v2, I added video-interface-devices.yaml.

>
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>> The device requires a clock, shouldn't the clocks property be required ?
>> I intentionally left the clock optional, because NXP has a converter
>> board which supports both ox05b1s and os08a20 sensor, and the converter
>> board has an oscillator, and we are using that, not the SOC clock.
> That's fine, you can have a fixed clock node in DT to model that. DT
> bindings describe the intrinsic needs of a particular device. If the
> sensor requires a clock, I think it should be mandatory. If the sensor
> itself could operate without an external clock (i.e. if it had an
> internal oscillator) then the property could be optional.

Also, in v2, I added the clock as mandatory. Strictly from sensor's 
module point of view, it is mandatory (will use a fixed clock for nxp 
board). Also added regulators.

Again, thank you for feedback.


Regards,

Mirela

>
>> Here is how the module looks like for os08a20 for imx8mp:
>>
>> https://docs.nxp.com/bundle/AN13712/page/topics/os08a20_sensor_module.html
>>
>> There's a newer revision for the converter board for imx95, sorry but I
>> do not have a link for that.
>>
>> For imx8mp, we used in the past the clock from the SOC, then switched to
>> the external clock (from the converter board).
>>
>> I think Omnivision has their own module.
>>
>> So, I thought leaving the clock as optional allows for more flexibility.
>>
>>>>> +  - port
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +    i2c {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        ox05b1s: ox05b1s@36 {
>>>>> +            compatible = "ovti,ox05b1s";
>>>>> +            reg = <0x36>;
>>>>> +            reset-gpios = <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW>;
>>> This isn't specified in the bindings. Does the example validate ?
>> Apparently yes, I mean dt_binding_check passed:
>>
>> $ rm Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.example.dtb
>>
>> $ make dt_binding_check DT_CHECKER_FLAGS=-m
>> DT_SCHEMA_FILES=ovti,ox05b1s.yaml
>>     DTC [C]
>> Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.example.dtb
>>
>> I have dtschema-2024.10.dev6+g12c3cd5.
>>
>>
>> The "reset-gpios" is described in this binding, as the GPIO connected to
>> the XSHUTDOWN pin.
> Ah sorry, Bryan dropped that part from his reply, so I didn't notice it.
>
>> The <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW> is what works for imx95
>> ("nxp,pcal6408"), for imx8mp this works:
>>
>> reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> --
> Regards,
>
> Laurent Pinchart

