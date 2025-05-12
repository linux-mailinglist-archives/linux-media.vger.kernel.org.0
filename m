Return-Path: <linux-media+bounces-32303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF4AB35C8
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 13:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A921189ACD4
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E085C28FFFE;
	Mon, 12 May 2025 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="Vg4CEC7S"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021126.outbound.protection.outlook.com [40.107.160.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB628F932;
	Mon, 12 May 2025 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048651; cv=fail; b=MfIPKgsjMGVQ29Bp1kK9GYdDp5ktzm6dCVwvIv8p4xsspR0rSqmBVaw/2QaTnVY/JwhNg1WPKeslcLBHscGju2gf5+wSMoOMqMZD+CcM4qgycbyRqxQEp6jqenOjEUTf03cZ8O7CqSITo5aJw15wAJSLwsvpNCppap6MxRHW0x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048651; c=relaxed/simple;
	bh=jGk+9MOXTFr+diwoE/rFMGfDmETL3s8X+aJfS7CfLN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L/XOgVfPoiensTW+Tl6SJ5B5qgAqqs/qoMCN6g8+/P7u+BjLXT7Zu5Fw1j1dhMu+FUim+yfK47k/WWL6ngMdgp5MKVhmUpSGbgi6MCzv67H7skkDjO7SYEOMCbaGFDZe1O0VwrrZOAswOI8VYz88o7XbDV+vnneB40ho22+QU9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=Vg4CEC7S; arc=fail smtp.client-ip=40.107.160.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD/a5iwxT7IUutG2wEpwCvr+FDJkoYBJVSCo5zpE8Xi4X2q0HHG8vj+9q8vCO6NN2cU70q1WGAzDk+rI779s+XbAM1AGlntaAuw1uq11QHF7Ae3yJNWmevLmQFiwoXp/qN/BM2jJF5Gh89TwG5FLYUE9X7kTprYNsckfOinjfKv9QPPd0VoCQjr0ND+RhFjxrYwOhEbj+i6Yna5d0fkZXEULKKPgfRtOtAStlsPaeD06Jg4/Z06cHXWqAS/Hz9IgM755N+j6wKegS4H0ae1hByxzp1H5loD9LfOWQo2dO6aep7AEVAphonDrmGWPpD6jDbQamBjvi0WVNjx9/hAfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoTLAy/g9/0XW2XvdxjQ4GsAjJX0yHdTZLfxsCMOKMM=;
 b=Cfa7n8I5qqTqCbnL4JDfyQMAdB1rL8QYGW+2hip0HEhoWEDwypCmuAy2ILyfReLtpnTOjl6sUXdDlttxKiXJqJ2mKQzUt8Mq68UKeW5gv+ARL6s7csU3BRbA5qIkPQsScPvUHWsV4doZnl0AoC2lwo4Yve/yfXg/DOPcc5rzpU6SpeF2OC0um3y5X1OYQNhSVEscfPzOCmQdU4RZPzR0mqhM/CbI0kFgLJB9vQzCR/PRF0X3vnsHNx/bLJPPLKfrfNNxZGnsSUaVG4lFM69S/Q8q2UWo6WwD2O0vNRazpaLsSNcIv9ZN7tarU6VGgWnZnC8uDREjqRgmNkxBq6MuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoTLAy/g9/0XW2XvdxjQ4GsAjJX0yHdTZLfxsCMOKMM=;
 b=Vg4CEC7S++e8qXh0AvnU5F2C/EBVtfcli4FwJQOVeii3fgd04Nf6grULWZJ9tFF/molWglkCD46BY8sBVvJjpEaui/qZljFQI/rC2YarHTUOYIzgbMLJMJEAxk7WXzrZurhYEYVTmz4mYuP7QnzQdNYdS090qpsUzG+YLgTWcy24p5iYGBJzapsZ5MDzUY2u5byQrUaItofdPtN2YI2GdureNXy0Jrc0yl8zSmJJoXDb2cn7LiBQMsP0VHUl7arYFbY25MpR2OM3IO7f/G/ERkjTO/+9uS3LNGmtADuWl0tMXzeFismvrFdpHdc0975fOkDxXr+BYmAWPOdqxRgVNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1P264MB2964.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 11:17:22 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 11:17:22 +0000
Date: Mon, 12 May 2025 11:17:21 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Junhao Xie <bigfoot@classfun.cn>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3 IP
Message-ID: <5cth47emwdjyc7dt35a5n2zeh4lkklgdpp2r2qs6s2qgiye6et@oxb2a4tene4k>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
 <595adbaa-15b4-4917-b3ad-9bac3e2333e2@kernel.org>
 <knnumpmyq4ewvqcfor3vqynxbplynajdlmz3p6f2ywadvmz6wo@5uz53eubbkfg>
 <20250512-fabulous-provocative-raven-ec3a81@kuoka>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250512-fabulous-provocative-raven-ec3a81@kuoka>
X-ClientProxiedBy: PA7P264CA0517.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::27) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1P264MB2964:EE_
X-MS-Office365-Filtering-Correlation-Id: c54a6712-ae2c-4fb8-27ad-08dd914690c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3lxaWtIVE0wUnpuMmRhV3o5Rk00S1A0a1UyVCtFWXd2U2VLRjZ4TGdGOXNa?=
 =?utf-8?B?OXUzdG9SVFR3bGlKU3I0eFlKYTFLZFFEenpSdkJZWFVlQ2dPMGR2ZUlMVVBz?=
 =?utf-8?B?b0d6Z1I3Nmh6TjRCdXNBK241a3ZFbXFabEtzNHZHSW1pM2V3dGcwVytqQjB1?=
 =?utf-8?B?dUg2OG8yMUxQS21CenRweVN0MXFWZEtINGxHU3lHSjNaeEs2Rmd4ZytLenNI?=
 =?utf-8?B?cFh1RkViVFMvcUx1dW1RVmRNbDJDQ2JuVk1WQWhDNThGa0VqazRPcE1LUktR?=
 =?utf-8?B?OHNFTFM5RkMyYUtDN2VCMXM2MTI3NjNLeGZLTVRpa2V4QjcvRlpJMTI2Njgx?=
 =?utf-8?B?c2cyWUs1dFhSOVFaeUZVRnNGK21WRmhwQy95Uko3UHdGQkNJMnpRekRTWkgw?=
 =?utf-8?B?a3cvZDBkU2V0M3dRNWhaK2JMM0thRXpwWXo1WENTYUlNSUFZcWUwWGEyN1E2?=
 =?utf-8?B?d2tjeUF4NEJVUWwxemZ6djEwYlY1N3FBbFZaSUp2VHExbUZOWFVlMG9yME9R?=
 =?utf-8?B?WjhDeVQrWmlnb3ErOHFHUlZvR0dvWW1VL3FMZnZUUkJIS2ZueGk3UVdZYnM3?=
 =?utf-8?B?amJNb3lzUllXb0c4NUVmVkkwMzN2L1N0TG5LL2Z3T3FXdGFmaVNuSWtxc3pZ?=
 =?utf-8?B?Q0tDbWZvc2tTVzZPeENoSFFKdy8vZ2g1bzhpR3J1V3pNbjdVN2JqMkZvaUU3?=
 =?utf-8?B?K2EyU3lydXhvaCtzWkxUV2FxQ1Bua3dXWjBrZTBoY1NJUmVSWjNyMkhnblNt?=
 =?utf-8?B?Z2RsQWNTUVFzOXhmWW05UDR6ejMrV29Vb0lkQnd6NitDU1ExRUNQVlA3M21q?=
 =?utf-8?B?MXFMODk2YUJlc3dWTyt5ZkNDUXlGN2VnRFA4VFFFd2hBVjBQaXI4Mm1SR3F0?=
 =?utf-8?B?UThXc2MxRktQYjN3bkdmRm11TGRXck15cjFnVHRQZnhQaklUZVJuK2h6dVFm?=
 =?utf-8?B?bzA2aDdFd2hINXRvZFZQK2QyMmgxbWpTNGtoVUk1dkdWQzlqYnRXSGRGdUcy?=
 =?utf-8?B?cERyc0xqQXcwN1g3RlUwN2VqWGZEZWxJSXRrdk5TTi9YREdJS05MNWJRbmJZ?=
 =?utf-8?B?Z3lpS2lsdG1Wdkc4L1M4SDUvSjlmcU1WYllFdE8vLzFCT3pLdjVwTnhlMWZS?=
 =?utf-8?B?RlFHRDdOL2t0Qzl3S0RiL2JXdmRRRzJzeU5GZ0tKcFpCVmk4bkxtY1lmUUY4?=
 =?utf-8?B?Z0Yrd0VUbEVtQlFHOEpxYzJxbnBoRWJuMVE2RDNZaG5YaTA4eFBVQ3czbXVD?=
 =?utf-8?B?MlI2UTlmL3EzelkvcHp1TXRuSmlmWTZWdU9WZXBDTzBUT0JlQnlnYkxxRjRx?=
 =?utf-8?B?Q05oTThoSEdlVWYvTnNHZjVlUmJiclFtR3JDRzlmbmZvblU4cWowUkNtMmVr?=
 =?utf-8?B?QjFSNXJnbXgzaWxiQnRlRlhma0FLNWZ5UEhIYmFJckFLVjdyT3M2TUpXL0Qy?=
 =?utf-8?B?ZnVVVlZKdUxhQXRHNjA1TUhLcFR0NjQ4V1BKdjhSMXQ5enNwMklsaXJyYmhT?=
 =?utf-8?B?MDh2Rmhqbk9NM1QzWHpBN3FoNXdSZkdlb3VJZGZ3S0ExbDltV3ZoNUZRUUg2?=
 =?utf-8?B?MG9CczQxK3ZFcGx0d2ZDd3M5OWo4SGJpY25WVTFWWUdrK3F0dks0cHVWSjJj?=
 =?utf-8?B?d0VkMjJ3eUdQVWZQVTc3bVRJMWlCTmZYLzNheGRvejBnMVM5YXlEOG13TFgx?=
 =?utf-8?B?Skp0NWczME9vZzVxQVc4Z1AyR045dWRNbDdvYjhZZUZrbTdwU3NmclJDU1ht?=
 =?utf-8?B?aE5Uc2loazlZOTZMZlY0R3Yya2hUMXpoYVNqNHRkaHFQWkVoMm5JZE9NWWlq?=
 =?utf-8?B?MXAySm1TbkhQUzVITHY1L2g1Z2l3S1h2RU1wNGp1VVhLL01aSXBST3RlVlpE?=
 =?utf-8?B?ZmNWaE81cGhObjhLWXV6VVVzaDNiNmF2ejl3eUU0NWtCd1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkFpdlJ5RDlTbWszZGtocVU1YzQ5cEY0b2JjTWxzZWxqTXEwNlJwSzd3WnY5?=
 =?utf-8?B?bzNqYVJMcjkxVG5MNit3Z0dOMGV4Rk9FWG5aNnphZ3g2QnpsWTJ4R0crZDF1?=
 =?utf-8?B?dXRZWlVYd0p6UXBVQ3k3bkszQ2U0d2c3N2ovaGFKQ1BKQkllcDAvL21FcmxN?=
 =?utf-8?B?NThMZWs0Q1VhSTZQSm96RUg2SEdYSTE0Mk01UWMvZUtSN0tpYmc1ZUwzdE5o?=
 =?utf-8?B?Q1haTGtkd2FsTnRtODYzN01IVTFLNEEwdVVmMmx3NCtiYzF2eTNPeks0N0Er?=
 =?utf-8?B?VDRuMTFvbnpqMFVqYlRKU3crQmdHSCtKYnQwS3orOFF6OTdQWmgvOFI4Ynpy?=
 =?utf-8?B?ZnQzMVhuSzYxWnhoVHlmSTUyTnNySUFzZHdxUnAyaFltMUEwTXdZTnhJclVl?=
 =?utf-8?B?UytZS3JobnQ0dlBmWkdBdURtMEQxV2IzelVTWU5CdXJyczV0TmVScUJTaENN?=
 =?utf-8?B?TDNVNnNrS3hic09KU0I1R0c3YUdKejR2b2dmbFI0LzA2NjJSOXQrSGFoemFD?=
 =?utf-8?B?UDlvWklDbnJsejF6VXlXSytnNVl3bTlXd1ZQTndXZ1daMmF4ZUFoeFB2YU5p?=
 =?utf-8?B?MlJaS242TW5PaDVMMWkvWUg4M01NK0M2Um1xZnFxckR1MW1QQVVGSlFOTEZR?=
 =?utf-8?B?VXhWYWRROVlINWJmVkRZTVppMk5FOGtSUUZCRmdFelcyQlkvMllUNGJKeEpu?=
 =?utf-8?B?ZFZXRUpiaWwvTy8yTVJad25aM2ZDZjA0MGs2RTJNZXQ2OWVSQ2YxalFrT1ZG?=
 =?utf-8?B?eHlmTzhQTDFuQUY4TlgwazFvZ1ZZbHVJVTk2Q2Q2TUNLN2JId0tOZ0pkQS90?=
 =?utf-8?B?Y3N3bk9yekhUbFlKdll2MS9HTzVhTWw0ZVRGY1ZxQXdiRDJsYzFrWEZ3RGxy?=
 =?utf-8?B?K1ljNkJCNWFhdWdhUU8wcFpzYjdqaUFlMU5VQ0xDcmxPTjBDTkE4VnNKenF6?=
 =?utf-8?B?cG4ycW52K1ZmMkdlYmJQNEFwcWtTVEUyayt2QWNITDliMVorK3ptZEhGR1ZY?=
 =?utf-8?B?bmF6d1Jla0xYNzJjWlhPb1FpUEIxcy9aUU5uVHBkRzVWTnpjRFUyOU1tRjc1?=
 =?utf-8?B?K01wc1poYXFTNjV4ekJGMDFoN1p1VVptYXhyTWkzUlg2R0t2eVBBTlBrNnhB?=
 =?utf-8?B?RzNrNitWRW9zT0Y1RisxSnlobzRYRFdkZXovbEhBaDA2L1VNeXZ3Nm5ic1dK?=
 =?utf-8?B?SHQreHNwc2drSytOZFlSUXdaVUdRZzhzUmkrRFZqeUx4c2Y3K2Y3amFsNGYv?=
 =?utf-8?B?UDcyL0w5QjhGSmlTdG5kY2puek40ODVwRDhTU0dJc3FaS3VGMjNkaFRCVjJB?=
 =?utf-8?B?UEl2cTVKWndkOG5leURuQ2xXZ3I4YzNGMzk5WDNxQ3VFUzFaeHhGT012K280?=
 =?utf-8?B?Ukk4eW9TZXNGeUpOeHhPazRCeFBxbE9lZjJROEM4MDlFZEFPalN3eERlUGxR?=
 =?utf-8?B?VTRtVGZRNUpBT1FYckt4bEo5Q0ExV1ZrWi9NOHozN2NKYVN4ZlFjQUlsTjM1?=
 =?utf-8?B?V2NlZGNncGcwRDlHcGhtSk1KV3BPMGRYVmJ0eFBsYUwvZ3BiY2NOYlJqai82?=
 =?utf-8?B?aERGWGh3VlFJV1NjK0xRbUt0OUMrMVMxZHlLTFNtRGh2WWV4MDN5ckZMRjk2?=
 =?utf-8?B?cU9GZy9COTA4SzFjdXNPU25la29NZ2VvdkZ1TXljVXIzWG9paHh4ZnBGdURi?=
 =?utf-8?B?OFVoN281bjFPWUZLRkxMU3IzY3BldjVGMTdiSFZKR1pTNDdtYWpKaXJ3Yng4?=
 =?utf-8?B?N0E0RkdPZFFXb0NmcXQ2YnlqNWREQ2RDMkxrcUpzZXhNM3ZGRkZvTVplZ1Nr?=
 =?utf-8?B?eDFEQTgxRDhRRDhLV0w0OFludXpLWHpOQUZudlNDaDUyMWJHOEd2UkhkWHpN?=
 =?utf-8?B?YUZ5UFEySnZodGR0VUdUN0pKMkd3bWp1SFpkNCs4aWJBNWhJV01KV21GUzB4?=
 =?utf-8?B?Z3NQOEd5cXFzbWZGV0hieDZrRlZxUXVOR2N2YUJMSVZCWldOS1dnNC81ZW1w?=
 =?utf-8?B?OGw1SDFTMHlrWTBrbytRVFozR1FJN1piTTMrdFFrVEc1WVRXNVpYL0ZITnNV?=
 =?utf-8?B?cExncVEvSWVuOEN0VGkrT2hscFFDZHVDci9qMkI2ZnpyTzkzVGM2aFVxVWwz?=
 =?utf-8?B?SzNhSURQWlMxRHZ6RUtaT20xOUpVc0c5R3FkSFExYjk0Z0pKaGRoMVBSSXJ3?=
 =?utf-8?B?dGRpS25wbXk5bFJaWnlWRHVQMmcycldQSkRtVUEwMmU2T2h0UC9xMmx2S0JF?=
 =?utf-8?B?aHFzTHJJNGFyOXdaaVJCZkRqam9nPT0=?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54a6712-ae2c-4fb8-27ad-08dd914690c1
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 11:17:22.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GPTyJ4GIkJobM1l3G/IZTwHHun7hu9XSonB9FyW3e7PgB6wiikYt4TpoorGJmwL1+0VLMHE6bs3pcmo6adr1ZJRbb9QZSEkLC/QbDELnMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2964

On 12.05.2025 12:42, Krzysztof Kozlowski wrote:
>On Mon, May 12, 2025 at 08:23:11AM GMT, Yassine Ouaissa wrote:
>> issue fixed also, thanks.
>> > > +  significant advancements over its predecessors. This new decoder features
>> > > +  enhanced processing capabilities with improved throughput and reduced latency.
>> > > +
>> > > +  Communication between the host driver software and the MCU is implemented through
>> > > +  a specialized mailbox interface mechanism. This mailbox system provides a
>> > > +  structured channel for exchanging commands, parameters, and status information
>> > > +  between the host CPU and the MCU controlling the codec engines.
>> > > +
>> > > +properties:
>> > > +  compatible:
>> > > +    const: allegrodvt,al300-vdec
>> >
>> > Undocumented prefix.
>> >
>> > What is the actual device name? al300? Can you have al300-adec? or
>> > al300-dec?
>> >
>> >
>>
>> the device name is al300, the vdec is for decoder driver.
>
>So drop vdec. Compatible should reflect device name.
>

We cannot, the IP could have the encode and decode in the same time.
the al300 is for the IP gen, and vdec/venc for the driver compatible.

I'll discuss with the team, about other naming.

>Best regards,
>Krzysztof
>

Best regards
Yassine OUAISSA

