Return-Path: <linux-media+bounces-34135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA96ACF0B5
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 15:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB6CA3ADB45
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 13:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79D7238D2B;
	Thu,  5 Jun 2025 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="g4PW1o58"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020123.outbound.protection.outlook.com [52.101.167.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90B2356BD;
	Thu,  5 Jun 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130190; cv=fail; b=QjY971ZKjzVAy8ni33n5nxNtjLweA0O96Hj4Qk3lwEYOJa+/IaOIwqvy/Oy43cjn8qGf2KymykITq8rEhkHvsnozR8YqhrGYeL74Tle2BtWn8RUbOPkF2bGSMS0N6L1m4upFBmD0J1WIEmQuxQPUeLZ3FoNnJR+mJ0ThtX/GMig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130190; c=relaxed/simple;
	bh=/4lTHxAwv4C3qxQZqQMqD+HYVhltfRTNIPtMH1Y1CLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bl68f7Re0zGHPwHr/3Qgl03nf9RxVwn3XBhNvHqoaTdB8N4DDRZct/bKoS+PjHa40GIS7p7gjpH1/IabLuUlZZPCLpSBIrrlU1XY6ZTBWEzx49axR4sWcTc/6KnUJ2d72wsiCYRhLzPu2z9aitjxu2pUydRwTs1gCo9uNLe+5ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=g4PW1o58; arc=fail smtp.client-ip=52.101.167.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im5P81QnkCW7j8dH7+sZD6TWsgfB5dO9AibDcfGu/mtAToYbw8y6wClDoHhg6pweVv7GMZX2WIpv9ojpSivaM2G3qhijSR36VUy64szb0XVU40n3wXUKJOOwTgyTpO2QcZXkYuHfmedV7qk8x/RUZmadYKjNEUycEpT+R/CJr1VrmzrIClqMXN8fa8O5q1iGGaFXbqFcSiewNTlSYj6saXqycubSuYAZuXgyosadXtyCxj2IP5HvSMOwn49DlQYCjoK4wjtzhwnD25VJ7vbjFFgnDnrw4xsyzSlXkNbsr5oo58ZiIe7BB/u7l3A4M5VvKlP0A8ETfjlIEJrUP6JeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t3ruNIDHdcHH1+tAe6pSYD7KqkuIDMt7U17BbC62Dc=;
 b=BOEDokro0nMAQznfuYiq2aLLCULHgrLUg02xTFQXEH+d/AONMnlBiClxEptelx9y15ufWr0PdOTZSNa/B8Mz3nHFH0fHJcKDRNiEU4tjM8ZKAlU1RwW+mjLWWZjLqLYw7f1o384nHCf67bgY/Hlu9yX5hnGGKQQCYcNdp+ee6N5oZshCCVOBmHrNbsr7V7lokt9Ur2hWZfdVFvxAELLm4iTayrJUAN112JgXd2fWMmAt+2XPwKqPn9ni8o0KgcyOo/0VjljC7kzhARx49kQJ72XqrCRDYojrps4jjvMHsGz/9dSu0cAfz8x1ULadoHldSBfeMRpFphJiQISK3xlyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t3ruNIDHdcHH1+tAe6pSYD7KqkuIDMt7U17BbC62Dc=;
 b=g4PW1o58MjLEqMhXH4MsYeEODIRWbUl/XW3TwDK8ty/u2yToZYdCkV9mQl5oXnDsbFpSu2NKcJR7vK6rfCO2rvlho4WSGsFP05+5M9GvSSgeCeVQqejjHsExKjMgs5Qh2kOM1k/ie0NYsqejQegGWaNtpjaaED52ccC8mWEH2wfcNGG5WgksxJWKhkIQAGJ5KvWMcNZP/Jqw0l11qnnSrEelQx7RGzOX1q/1lSnCedLf9sJYdEq8oujSW1qu6c/me3EvgXrvk8lvlzu4/F95R5gWrUkzIBeFnCUN4svbMmGYKaY16lTYoB76aBNIcPZT2xlvAbHH4DFx3+JcLdMmpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PR0P264MB1785.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 13:29:41 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 13:29:41 +0000
Date: Thu, 5 Jun 2025 13:29:31 +0000
From: Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <pvocii4kji7xsci5fcztenhkkjbsyu4dgz5fu6nuwykezzoyuy@35i4phytxyzc>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
 <20250605-allegro_dvt_al300_dec_driver-v2-2-1ef4839f5f06@allegrodvt.com>
 <759f9900-a74b-40a2-ae53-5e5a6261f963@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <759f9900-a74b-40a2-ae53-5e5a6261f963@kernel.org>
X-ClientProxiedBy: MR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::12) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PR0P264MB1785:EE_
X-MS-Office365-Filtering-Correlation-Id: 232c90be-d803-41cf-72ed-08dda43506a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWZYVXlvVm5DUFhZdExwTXBFL3hxalVPemI4eWY1QUdISHpFM1RsR1ZBT09B?=
 =?utf-8?B?cDdxYklCRjNOeFl4cCtqT0p2V3JCMTJHY2FwRmt6Uk9NMDZ4N1g3b3R3Vlo4?=
 =?utf-8?B?K0JSOWcvSFB3L3VCR3VjSmhkaCtKNG5BM0VsUko5RW5wZitEQmpiUzg0dS94?=
 =?utf-8?B?OS9VWC96c3NuUzVPTmNJSEV1QUdNcCs1Ukd4Z0tnc3AwKzAzUWdLUFVFaE9K?=
 =?utf-8?B?UHFlTkNZVW94a0ZQL00wN3JPQTlGbE9QTVJteTFXV2ZZY0hUMFBwNURTVHZU?=
 =?utf-8?B?ZGJ1Z0NaQUgrKzlMVS9oOXZtZStsS3lPNDhlbVY5VTdlR1ZYeCs2OG5VWEhV?=
 =?utf-8?B?NW55N1VTMEFONXM2MEx6a1ZSWmYreEZCaHNvMmlBOHA2R3NwVUVScW03SC81?=
 =?utf-8?B?cWNNYTA1NGNNTmtUc2JjUHlOa3N6YVFEcnZEUGc3aEhNQTlFYVlqdUpkZlRq?=
 =?utf-8?B?ZS9zbzY5dnFwa1N3a0JUWFd5TTUyMEVxODhrTTduczNuRmljb3I1VjRmQ3Bx?=
 =?utf-8?B?TkVVWERKcHNNT1g2Ny9PZ1l3dUtaNlo0dWhpODlQSVQ5dDBaMEp5SjZFWlpQ?=
 =?utf-8?B?Uk53ZlZOdGdpQk5yaVR6ejg3b2Q4UndOQ2FtZm5xeFJWMHdybi9CdjBJSk9k?=
 =?utf-8?B?SGw3Z2pueHZZekJ5VEx1WXFLT2xuSDFBUFlrS3dXYkVQNWV3NmsvbU1qSVpo?=
 =?utf-8?B?YXJ1cmh3c3ZFMDFHbDhXY2JFeXI5Ym1pTVJYcTJwcDBqb1FnRmZ6QUphd3pP?=
 =?utf-8?B?WFR2S042SDlIaXErMHNXZmdaS1VzUmZaZFcwNVh3a3MvYlNEZmVLUXdjaXll?=
 =?utf-8?B?TldwS2pLSGpoVkw3SzkzVHRmV09KbTJ6VFZqL1NJN05hd1ltMkNZZWcyUjhJ?=
 =?utf-8?B?d0c4NnJ5SDRBU2Zmb21xVGwrWFFFZjVHSTgrUlAyN042K2FVSDV4eFVJUVAw?=
 =?utf-8?B?djJkb3ZrNWlMeGVUYksyZEMvLzZRSmF0RE9LeHNuTTlpZ2ptTmhuYzM5QlIw?=
 =?utf-8?B?aUtNMVQ4QjJJUGNmOUJCektMMWdvbFppZUJFMkpZb1hNOWV3Q0NyQitOb2pz?=
 =?utf-8?B?Y0tnZkZUOUlzTW9EN0JmK3pudzJFYktrMkxQVGtKd2hmR3ZnVzVPSndWdDMz?=
 =?utf-8?B?ZzVmWVQ1L2l1MGt5SzdRd1huM280ancrdkNBSkwwaDgyRnhmMGc0OVBrM0ha?=
 =?utf-8?B?SGFvek5IZmc0MUN4QVNUSWZ0dVVNVjZySzQ1VGlVaHBtblY3ZjJ5bGo3Vis1?=
 =?utf-8?B?VmJmS2hHcFpPSWV1cGloUmpySzNkMjFRL2k3RFVxOWRkcTQyM1VGcm9wWHJp?=
 =?utf-8?B?UnFtL2pNUGFoa1paazlONnJBdkNrNkFnZnp4V0dRa0pJN056STJ6R3FBRCs3?=
 =?utf-8?B?cHB0Q2NSK1dSc01ZNzJUQVVIWWNKVHo5bndyVGNHZ0dZQVBnZ2Z4cHBNa1Vk?=
 =?utf-8?B?OFV4bVZnSWk5YXVxQzJZdHF2eDNNZERtVm5DQjFsSW9TUU5uVUUzNEovbG1E?=
 =?utf-8?B?ZStjbnBUSmY2Qm1PVzZFWStHTVI0NkpKT2hISXMweEhuSktPUFZHeXViSjVm?=
 =?utf-8?B?UGJXSFBxUjh0V3BnMk5sd3VGR0J1Rm5OTVZzTStLcTkrQzl1Uis1NXFGTnk0?=
 =?utf-8?B?Mk5yZXNvYTVLUytZZmhGTWFjVDRJSDdBM3Bsb0E5ZDRGbUhjdi9IUEs1YzRP?=
 =?utf-8?B?a2t6bjBTWk9Td2NTS1czcndYZE1VZ2YxQWU2bG1sYStHSHVKV2VISlhLK1V4?=
 =?utf-8?B?UWVEUlJSSnlMRVRSRWh1TGY2SmRBWnBtMXlQNjBWN1Z0a0dIT0x2V1pJRlpB?=
 =?utf-8?Q?+oZcoiZIfzenLymKyupvY7pArzVQoxVD41g1Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTM4ZUg3VEFjTVdLRE5GeVVXVEJLSkNPSmMyVXo0akk1N3p1NDlVTjhWRExT?=
 =?utf-8?B?em14a3YzblZ3VkJHTjJOVjVBMzl4b1BlVlA5R2JNTXNoVnBrYlpKSzUyZ3pa?=
 =?utf-8?B?Q3VuY1VvcGt1L0NCV2huZy9FZHdnU0lPQ0MvZDI0V0t2NHd0U1NIQU1NVTQ2?=
 =?utf-8?B?cXJHa0JGYkh2VExEWTJIc0piaTJuVTFtMyt3UjdkakxUbzNJaUZXUTk3OXp4?=
 =?utf-8?B?VG92VWZQdmRkNlpKUWFMS3MxeDRHN21xYkQ0aUxEWDI1YThNekVUWUNVbk1Q?=
 =?utf-8?B?dVJoLzVMTkJYeXQvc3hPRGY5TXZxUnFwcktmS0tlbmlGWFJxTkpiZWVORnls?=
 =?utf-8?B?aW8wQ3dSSVRWQnBaemVXblhmR2dUeDZya0FiRVAySWtINnRlZGdtb3hLQzJU?=
 =?utf-8?B?eVZ3bWxwSytVZzRSeTMvK2hwMWpkZk9uMzNsc2V1U0ZEWEJKM2I2UG1wUVVN?=
 =?utf-8?B?VENUODJVUlVvWDdRcGdUaVNKZk5OQk9wcnBMT2Y5eGdZUkkwSUhaZDR1eVg2?=
 =?utf-8?B?Z0dNWHhiQ0xkdXV5UndaWVNTS3cvNTQrbkJsL2pUcC9DR0dOdE1BOUxOZkxj?=
 =?utf-8?B?WE1NYXVlTkM1S2V3MStiTlE2c3dNQ2ZabVNkcGtqYmFlNWk3VXJqYWh1eEhX?=
 =?utf-8?B?YXdtZm5oQ3N5bU1UbkxqclduTkQwalY5MmZyZTVxbTJhdFp6V3BIekZScXFm?=
 =?utf-8?B?QUszeGhjdm9xMlJDelJXcHEyMmRtSWtqTURPaFVKVDBHMEx0bWtQeUsxSHVC?=
 =?utf-8?B?MlMxMFh1YVp3VVA3OFdJNkFuMnVYcDFUVUVLMVRvS2kzaTVOVmJQT0JNOGFK?=
 =?utf-8?B?STduNm5VbHlCZ3Rad2NRcE03Wk9KTS9ZNUpDY0JYYW5QQ2dCWkNQTFRWTG9r?=
 =?utf-8?B?NTBoeVB0VHMxNENlWjFNOGx5SXl4N0FZMmlpMjlFbTFINk9STGhsMWIzazJx?=
 =?utf-8?B?NDV4ZTRCRUVsMVRGTzVpd2puNjF4T1NFNHd3bkE0MkY4a1F1ZFd3cVMwbGh6?=
 =?utf-8?B?ejJVUXpSYTVteVVCZlZQdXZlWkh6UjRMeVlWeS94OWR2QWpTNVUvOURFMTdP?=
 =?utf-8?B?eHZWZksySG83MDJBU1dKMGlaU2FmVEdaUFQvSGVNR0twOHlGa1lOWGNRdGlR?=
 =?utf-8?B?NVMxV05BSHVvNlF1NlNVRWI3Y0wzTllHN1VmNmRMVVBhY0xBbGlqU0VQb3dm?=
 =?utf-8?B?NnVhQnV2RzJhbXZhVGVBUWUzeS94S0EzcFU1NGljc3VucXBKd2tSQmczY01h?=
 =?utf-8?B?ZmlUVUo3a0M5N0lyQm9YQ1Y2S3JON0ZGYngwREV0cUUxOTUwUW5FVVBxY2Zt?=
 =?utf-8?B?MW5vUms5OTVuWmlPVXJxeTZsc2JpYjNodVlzSktQS3JzRXBaV3I4V2h3a2E1?=
 =?utf-8?B?eVNiK0VaRFB5akhQRVVBRUN4WjVHdmJ6TTRrVzFZSEVFUUhyenpVMGFHeHBT?=
 =?utf-8?B?TFRpb250YTM2cHVJVlczUHNJb0sySHVVd0VENmVOQVdHS2d0TWFzUGVNWnRi?=
 =?utf-8?B?QUpzN1R4YjJONkt3eGhGWGVpQWxiUmQvTGpkWUxqRm83ZjkxYlV0MS9FTEZ2?=
 =?utf-8?B?MjZrK0M5akFXNGtpSklNNWNsK01GdGNpdzZSMnB3VytYdWV6WjE1WDRBbE01?=
 =?utf-8?B?L3RrOGd1ZDUyYTFUTDhtbkVvVzF3WWl3U1BYYm5lMFJ5emtXbDZ5RmtuSjEr?=
 =?utf-8?B?RUlxSGp1SWI5M2NWbytKL2p4UHMrelc5cHpQY2Z5cGx1VGhmNGgwUW4weGtV?=
 =?utf-8?B?eGlqY256K3AwNk8vcWQ1UHh5Rnp0cytPOFBySE5id0Y2eCszTHdETzJpWUZZ?=
 =?utf-8?B?SmlCa01hVndnOUt5VFg2b0pXZng0aHJCSEpGTnlMYk8rZUZ6RThrb3ZzZ3Rv?=
 =?utf-8?B?SFlBemNhR25NK1o3dVhaRjdGcEtBWi9nU1c5clo1eUJSZlBoNTZTbUU3ZEdU?=
 =?utf-8?B?OURZbHZiY3Fqa2RDU2hYWng5dG9OU3Y4OWtpWHlLbkhpUHJzY2hrOWFmV0VL?=
 =?utf-8?B?VVIvSW1Yd2lOVVJDYXBtellKYm1uRGNTVzRLRkp3UjJ1dnV4YXZyVVJZdFQz?=
 =?utf-8?B?amMrRkJsRVRYZzBEWEw0UEtUNmNRQ1dQOHFXTzdTRFA2c1ArUmYxZlU3VE5L?=
 =?utf-8?B?WHJvem1jQ2QwWHVnRDN6RCs5M1FSQ0FSQnRiREhrYkRDa09FM00yR20zR3Jl?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232c90be-d803-41cf-72ed-08dda43506a7
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:29:41.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeK0GxwxaLyl86e84itwrkWopEPAQ/1ZYV6AtGq0Nc4UrzsqNqSuGgLejoHPQyc/4jabOJBYh7k9eQt0TgNdQG6H8BEvqA22u3U02YaqcyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1785

Hi Krzysztof,

On 05.06.2025 15:01, Krzysztof Kozlowski wrote:
>On 05/06/2025 14:26, Yassine Ouaissa via B4 Relay wrote:
>> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>
>> Add compatible for video decoder on allegrodvt Gen 3 IP.
>
>A nit, subject: drop second/last, redundant "dt-bindings". The
>"dt-bindings" prefix is already stating that these are bindings.
>See also:
>https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>
>Subject prefix(es): still wrong. You can get them for example with `git
>log --oneline -- DIRECTORY_OR_FILE` on the directory your patch is
>touching. For bindings, the preferred subjects are explained here:
>https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>

Got it, thanks.
>>
>> v2:
>> - Change the YAML file name, use the existing vendor-prefix.
>> - Improuve the dt-bindings description.
>> - Change the device compatible identifier, from "allegrodvt, al300-vdec",
>>   to "allegro, al300-vdec"
>> - Simplify the register property specification,
>>   by using the simple min/max items constraint (Krzysztof Kozlowski)
>> - Remove the clock-names property. And remove it from the required
>>   properties list (Krzysztof Kozlowski) (Conor Dooley)
>> - Use the simple maxItems constraint for the memory-region property.
>>   Also for the firmware-name (Krzysztof Kozlowski)
>> - Example changes:
>>   - Use header provides definitions for the interrupts (Conor Dooley)
>>   - Improuve Interrupt specification using GIC constants (Conor Dooley)
>>   - Use generic node name "video-decoder" (Krzysztof Kozlowski) (Conor Dooley)
>>   - Remove unused label (Krzysztof Kozlowski)
>>   - Change clock reference from <&mcu_clock_dec> to <&mcu_core_clk>
>>   - Use hex format for reg property (Krzysztof Kozlowski) (Conor Dooley)
>>   - Reduce memory region size (Krzysztof Kozlowski) (Conor Dooley)
>
>All this goes to changelog
>

I'll move it to the changelog.
>>
>>   - Link v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250511144752.504162-4-yassine.ouaissa@allegrodvt.com/
>
>Drop
>
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  .../bindings/media/allegro,al300-vdec.yaml         | 75 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  2 +
>>  2 files changed, 77 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..26f9ac39682431b1d4828aed5d1ed43ef099e204
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Allegro DVT Video IP Decoder Gen 3
>> +
>> +maintainers:
>> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
>> +
>> +description: The al300-vdec represents the gen 3 of Allegro DVT IP video
>
>Blank line after description:

I'll change it in the next version.
>
>> +  decoding technology, offering significant advancements over its
>> +  predecessors. This new decoder features enhanced processing capabilities
>> +  with improved throughput and reduced latency.
>> +
>> +  Communication between the host driver software and the MCU is implemented
>> +  through a specialized mailbox interface mechanism. This mailbox system
>> +  provides a structured channel for exchanging commands, parameters, and
>> +  status information between the host CPU and the MCU controlling the codec
>> +  engines.
>> +
>> +properties:
>> +  compatible:
>> +    const: allegro,al300-vdec
>> +
>> +  reg:
>> +    maxItems: 2
>> +    minItems: 2
>
>Drop

I'll change it in the next version.
>
>> +
>> +  reg-names:
>> +    items:
>> +      - const: regs
>
>base? apb is also "regs", because this is "reg" property, so "regs"
>feels redundant.
>

the regs, is where the device is mapped, but the apb is used by the MCU.
the reg 'apb' is used to map the MCU peripherals.

>Unless this is something entirely else (quite different address in
>example), so maybe this should not be reg at all.
>
>Also, make the example complete - missing memory region.
>

I'll change it in the next version.
>> +      - const: apb
>> +
>Best regards,
>Krzysztof

Best regards,
Yassine OUAISSA

