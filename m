Return-Path: <linux-media+bounces-25852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1136A2DF9B
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 18:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0778C7A229B
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 17:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E951E0B7C;
	Sun,  9 Feb 2025 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n7W5KkeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2044.outbound.protection.outlook.com [40.107.103.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE11DED5D
	for <linux-media@vger.kernel.org>; Sun,  9 Feb 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739123452; cv=fail; b=KEn0D/Fn5WBeskscSSSIm8XAM6Akt/BJRJQSZBhB/5y5b3+aWIi7fL1nQS03jDRKVln914wMNPIMpoCL4PLTDHHvGUYI/bNK9GZW/Qdmr1fDiDbWCqigzxxwC9ca6YHNbobOcXt88DCmDyam0O2dXlMESX08bcu4SNXIlspZhXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739123452; c=relaxed/simple;
	bh=0Fbs9zRAqUp4USD1GtOZl4BDakq+q/sZ3pux3K+qBTE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rghuyTIqwrU/rdNWy9qmvRDMOtjROJ8YdjgUWd3zU1x49yBOwyzcP3bBD4i20EsJqQfJHu8CeowZyZGGdN4O3RbyTQQfGZmLYlZUrUcpGT00hiG2Rs1tCHBQkiWd0VIEVsa8bcnC0bwsL+3eT/Uw1pxY/WKqtsnhd3XDoxneuTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n7W5KkeQ; arc=fail smtp.client-ip=40.107.103.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tApRByR0FUMlrKe9Hl+UpoF3nRb1waP0tKs2xGqugYw5/Gb5QxRMR2xM94moHUFUbDcpvqck5ryHTlnRTL8r/m6z+0bW9flCR9v8OSQOdH0W1qlV0GcKzl4wfXpNxeAF0sPACCSJi/k6xc80BLBYqdTsyMIZEGQf9qMOvI0yEtCuncVM6rzvI6xK/rYHPoXA0CLiPHB8eXdv5WIdhl0q3RGdn1KH79OBfDwdi1fXqmCW66CgqNyST7ePLSgMytZ75jM0vOXk2CHbuq2rn5Lcz9odPY1wGzLp+ABCK2pVVlFuXGhfWT05eKEWOh4+hkX/QfVLizpg5LF1rEAlVEHFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qR4U6Y3h+J3ypAHsJCbiC/PYp+IANcnLVO03vjbq1o=;
 b=jJq/KqeHs8gW6SUr3mA0H99rtI2WlErJU1GFqOj8oaFm3ea440T5X13au/X8KDECis1E+swRp6+OMnlKIeJxyYvayedxu2not1qUbnMGxNRYZKe6lidQEKiRzZx+z+MQC+yqvvwL7aqvRgbwwq2f4X33o5jX1xxH9qpHA05mA3NRQ+lIOToHJqGju5d45j/0vMOm7S6u5AQbgr1r2H4rxq/xsil6sMxEECoUkkXCoNvE8XQQt09KLry/1rMl8r/UBDWi0mNBCo693z3QNG0wnnDdEo9D3MC1jC4rbjpU5clpRaa9fjZawuYbuEmg4s5vO9f8Zb9ndXvYDdhroNVaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qR4U6Y3h+J3ypAHsJCbiC/PYp+IANcnLVO03vjbq1o=;
 b=n7W5KkeQb2PEdlLKB/CAon64+sB3jNm+zibUAH6STA4/KumZiy675diwCXeVn2O7ze3GixCLpf9TvAnbZTkIY4zSCjb8jK5DazRvlIK5XEzQ44lB4n6zmLJ9Pbx/yzjSdlY/2FYjitKki/1KI3WZh7UgXYJcuSmzXsekcDbzMAstMzPLWCTB3Ox5rUzizC8GumHqg7h0aGpQeM3HeBKkjwuaAkooRRTBbhF+hFUYV9rQsroNbZ2qpCHRRwQrA4BL3d3gaO23kdxhNWp6GSQbvcBBpKWUvsE5uhKgzqOZi5R977IA9Iahp1OzeVyKV4IGNPYKxTcRiWIRHgzrhqu/Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Sun, 9 Feb
 2025 17:50:47 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8422.012; Sun, 9 Feb 2025
 17:50:47 +0000
Message-ID: <a0061f26-c1fa-48b6-9dde-8744a85f889b@nxp.com>
Date: Sun, 9 Feb 2025 19:50:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 12/15] media: uapi: Documentation: Use luma formats with
 CFA pattern control
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-13-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250203085853.1361401-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::38) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|VE1PR04MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b30e18-2b47-420d-e84b-08dd493248b1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?anpKV3cyVnFhL1RhYTE0MzI4UWt2VnRMVEhtSEVoUm5JQ1Iyb2dLeTkzMEN1?=
 =?utf-8?B?RnhCN2VYQVkzd1JSbXY2dC9KMDR4cExRTjRFQVdSS2sycFN0aUNKQXhlYysv?=
 =?utf-8?B?Qmw3dFc2bCtnemFWRGQ5aVNkNDZZMm4zWVltQWxZM1FJcWR1OUJuZEUzSmRo?=
 =?utf-8?B?bWNpcG5mYnhWWHUraWNvUU54RFlMbURhQnZMdWl2SGp1UEk2RzcxODFJWG8z?=
 =?utf-8?B?SWtPOXRXZ3Q5KzQ2OXlza1dEMnYwWThIcmVIZDNkQWlpTXBXaGVqdnVJd2VO?=
 =?utf-8?B?ckYzeTI1Z2NRRHFBdmFIT3ZGNi9EcW91SUJhTHdvdUFUa0VqMWczREo2aEla?=
 =?utf-8?B?a2RuRGF6SC9TdGxEM2NndU9vVE5SeXc4dkdhZDhNblhNNmhRb0pIc3docExJ?=
 =?utf-8?B?ZnMvTnVqRmdjOUE5T0YrY3hQem5zT20zY1dTWlMvT2RreVhlVmpPcDBLSHNN?=
 =?utf-8?B?NG51TEFZdENPYmRjbFpUVW1sOGFxQVFKWXd3M0RkbHRHbm5tcCtvcGZvYWhy?=
 =?utf-8?B?NHp4WG0vR1cvbmhQc0tyK09ZUk9adzJUbEp2RnE2RkplSzQrM2dpNHNkaG1L?=
 =?utf-8?B?QXJYcXZWcXRNUFp2R1VjUzVsVytDK0JmTHhnSVhHVTZ5d1VHL1V1cEtmdzdi?=
 =?utf-8?B?dVF5dEQ4dmdzdUVpUFM5TEt5OWdzZkdzaU93ejlpR1k4K1lRVUFHTjNFaStF?=
 =?utf-8?B?U0dIYjltaWNSOFRCOTB3cTMwWStWTEZORGFSNSt5M3E1empTTWNVNk43dlo1?=
 =?utf-8?B?aVB2eE5MdE9JTjNzdUp2UDM2ejFuWWpSbWhPUDFvOFFzcTljZjBXT0VIOUV0?=
 =?utf-8?B?Qk1XaHYrL2RwZGZkOThBblJmVUd3UzYzcEVRcjNMVG1mYXJOMVkrVVQ0aXRO?=
 =?utf-8?B?SStRaFpENjhTanF1d2UreTFRcldTaVpzM3NCNnBTL04zcWtXTGpHTHJFVnYw?=
 =?utf-8?B?TEF6RE5NV1Z0SWpEb1lJb0NLSnVmNXJnMS95NGgwajB4aXA1ek1jYlJqREQy?=
 =?utf-8?B?ZnljeTZQbE1JQndvWG5JSTZ6NGF5NUpCeUp6TE5hbDVUdlhVOGV6dy9iR2Qz?=
 =?utf-8?B?WXpRSnV3NHBNZkNmdWdjZVRSdlZDZUk2RG5NbXJ4MkxuV04reDBqdkE0eVBl?=
 =?utf-8?B?VlJrdk1LSFdld0hhTFZEUWhEcmE2bE9wendyNGFjelpSQ1pOUmpUa3hmNVBY?=
 =?utf-8?B?bHRDR2s4ejM1WHBUa3dQR0hRajNtTXBkdGlIVDZVVWdBS1pkL1FJRU85Q1BN?=
 =?utf-8?B?YlNFWU52MENiQmhWYldheFMzMThuNHJVZU16OW1wTEs2VHR4Q0xDSEVVSUgx?=
 =?utf-8?B?Y1BMRHFEa2FVcFQwWXJSMGpCaUFFS0VSdTZZRnFsaU1kZ09wRlVycklDNnMy?=
 =?utf-8?B?a1hrQjZYWHVNenVhOGYzY1VTcjJjVy9heGNPaEk1SjJXNVVZUEtFcWJLVXNs?=
 =?utf-8?B?bEpQenNKUE1RVXdnNnliSHpESXk0WmlkcVpNSzBZMFBRVGhoc3JwNGx3eGZD?=
 =?utf-8?B?ZmZOQW1GT1ZpbWdKNEFzYjJ5Z0IzWjhuUzJ5NWQvZ2M5VGd4RW1yaC83RW9j?=
 =?utf-8?B?MjNiZnFGUE5kdlAzSHR5TUdxNDhBY3RPZHJvNnRjN25SMDZwODhUZ0dvRHRX?=
 =?utf-8?B?SnhLcC8xbDBPUTB1UG1DcHoxckNFNXNWUytmWDVsS1ZxYkx2QjFBdGNsRk9R?=
 =?utf-8?B?OVNydjJOenJvcUdEZXlRR3BEQmFhRGlUSzJoK2tYbU54ckR2QmVCc0FYb0VX?=
 =?utf-8?B?d2FqbHpCYTY2bDdZaEx5UFJPU1JoSms4d1NJdDdCOG5sYWNLK3BneEMxZXZB?=
 =?utf-8?B?eHl3aDQ0ckJscW1KdWZiTTA3elN3UFU5MWtnS3ZMWE12NDRoWU44eFpKK2pt?=
 =?utf-8?Q?vbEBP3ZI6Q6kd?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VXQyWDdkbzJLMkdsYm1zNlVqUGRsaHVkV1lJMTdCWnNndlZzKzJzcElLaDlv?=
 =?utf-8?B?aEVQejZGeFdtdUJpY01nZ3BTUmVvSkJqTHQ1aVUxUk0wc3ZSa1JKWmY5NHZu?=
 =?utf-8?B?ZDVMNWtobDhCcER1VzlVRmxWZUtpcnBmZmt3dkZsaHh5aUJyS1BXRTJwRzc0?=
 =?utf-8?B?NXVwYWhEY2hNRkE3Wm5pOHd4L0lwaWxqQjZETjNvOExSUThwWFhRUllTYTh4?=
 =?utf-8?B?RGtyL1NiVmdXa21yVVZzWDZNZU8yb1lqMjVHSUtjZWswSmpzclFkUDR4VCtn?=
 =?utf-8?B?NmpIZmFJbGM2UENVT2dnU0Fhd3JQRERxSnVURzVmeisvSUMzSWZUSTJmeU15?=
 =?utf-8?B?Y1M4U24wenBNYnRrSW44Rk9zdThMUW1qbjdFQ2t1M1dVMko3U0JmdW9oRG41?=
 =?utf-8?B?dklJMCthZFRIaXZjSXFCUU01SENZbWV0bGVFUzVNYWhIUWR5ZlVMQ1haOWJP?=
 =?utf-8?B?NEZDWHZMSG1jVG9LK0NWaDRuVnlvSXhuaVJBM1JEcmFOdnc3ZUxEdDJXZFBQ?=
 =?utf-8?B?QThUU3JSeUZlL0NWNnhTUXVNdk8wUks2U1JaSlR4UklacTVYcXVqK3BVV1I2?=
 =?utf-8?B?dEMrMzlUd1AzK0hvaHFvMGpJaTVTK2x1TzBoS1U1c0x6ZHltclR2WDdjYmRW?=
 =?utf-8?B?SXhEdkxkeTRpRk02Q01rcFRCaS9XUDhSemFOVGN0YTVURDF6czJWWlpUZ3R3?=
 =?utf-8?B?RDFtTzB5cER6UzNab256VHVhNEhhUncxVUorc2xSSkROTGFGcnp1Nm1jMlcv?=
 =?utf-8?B?MUphY0t6YzFud2VYOXcxa0J6Qm0zcXVXSm5ZWjl0aXVNelNEQm5TWm5Mai90?=
 =?utf-8?B?Rk50TFF1RlVRYlRYQXpRdTUzcGZkSXcrSDE1anVrL2RIcDhybWVCU1p0TTM5?=
 =?utf-8?B?alVVZnJFL2xlbnlsL0FEc0hsZkMvNVdrSXRaaDNiTWVFMkoxb3d6UE9kVGc5?=
 =?utf-8?B?TytpMkxUNTBucDMxcjFic0c3VEVmeTg4RXdMK1hwT0JjY3RCTjREQTVhTmdo?=
 =?utf-8?B?aU12RTN3SnAraGwySGRYSFFONFdoNElVUTRRV3pJWERvTWJMWHNkdTdjY05a?=
 =?utf-8?B?RnN4N2xtY2pybm0vODlDb0dhMElKK2FoMDVkM3dTU2daS3VJem9ZdHlpTFd1?=
 =?utf-8?B?UUN5Wit0eFdVbE50WUZRaElGelU3aVFCeDd1TDRDQ01oMzhKejNabUt3Q2hU?=
 =?utf-8?B?SE5uQVRvV0dpZXlXazlVOXZZSXd5bjNEQ3ZpYVhCajloM0lHdXZrcktMSHpG?=
 =?utf-8?B?Rkp0SWlsNG9kSWZjcldmdE5hUXMxczVQVFYzTzRtSVdOVysvYU8wL3l1QVVY?=
 =?utf-8?B?aFNWRW5Sem1hKzEvWjdHbWxkQnFBSjB1dWNWeEE2dVVTUHVRUjRWdDBrU2Vs?=
 =?utf-8?B?M2JkVzZTRTV2Q1FYWVFiNGJveWd1dzBTeUtVYkJhY2R3VzI4cjVvRE10Uk05?=
 =?utf-8?B?eENHT3F2cDEzODF0MmVQSEhCd0ZTZ28rQXh1UUdiZE4yWlBINWJQejYrRWlv?=
 =?utf-8?B?UmpKbHF2QlVacjRsMUw5UENSUkl2K0FNemVaVFRYYy9yQ1pwTmx3eGhrcVVk?=
 =?utf-8?B?elZQYTN4MHlyWVFMQ0tua3gvQTBhRmswbEYxQU1LOWlYU1MvWGhoTlVyNE9C?=
 =?utf-8?B?d05xbU1PM2RpYTlvWlFXQThzQk5YZ2JkT2FRQlRmV0ZFWk10YmVpR2x0NlRm?=
 =?utf-8?B?aUJpN3NxVklzSjZUN2tiYk4yMlRDcXB4RnZGbEhGOXRNVVZwZmpBRS9NTmE4?=
 =?utf-8?B?SVY5WHZWTS9kU2RBYXR0dUJ0QTNqQWxQOE5xcHd5STlhL0VkcFVtY1hLUCtN?=
 =?utf-8?B?bkJHbVJJTkpzang0SzU4TXR5Q3JXZklOUDVPZC9uVkl3cEk3N0xSOEw0Zmg1?=
 =?utf-8?B?aDNNdGEwODhZWGh2TSs5cmdjTkQ4NEE0NXQxV3h3UnJkWWlkNzNteXBhTkcz?=
 =?utf-8?B?QnpiOW0yTytQZ0MrZmNkM0FpMUk0eVBaMjRqU3Z1T0pnQUJmckZYTU5Da281?=
 =?utf-8?B?SzZvSTk2OFU4NFJCUnV5Y09hZkhrS0paRXdINm1ESG1xZVlHSHNCVk5aL25N?=
 =?utf-8?B?NWhVdGpUK0xjRWtFaXdDcDRLdmpTTTB4b0tIWlpBZHhadlk2WG5QSXRnYXRo?=
 =?utf-8?Q?TWYnC+de0vtY65FeF2wqO+2UB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b30e18-2b47-420d-e84b-08dd493248b1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 17:50:47.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfEHpKVTkWKyOG8FR9AfdCNVcyqcP81z6aWc6I+XtHR7R7vzyQrvMM1eO+IetCygRzYg4ljUFgU1XMiWQv5GMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

Hi Sakari,

Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks,

Mirela

On 03.02.2025 10:58, Sakari Ailus wrote:
> Document that the luma-only, greyscale formats (Y10 etc.) are used also
> for non-greyscale images with the CFA pattern specified by the
> V4L2_CID_COLOUR_PATTERN control.
>
> The advantage of this approach is that there is little (or none at all)
> work needed to be able to capture such images with existing CSI-2 receiver
> drivers as many already support greyscale formats when compared to new
> CFA-agnostic pixelformats.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 74df19be91f6..ae4e431b5fd9 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -9,6 +9,11 @@ Luma-Only Formats
>   This family of formats only store the luma component of a Y'CbCr image. They
>   are often referred to as greyscale formats.
>
> +These pixel formats are also used on :term:`MC-centric` devices when the CFA
> +pattern is specified by the :ref:`V4L2_CID_COLOUR_PATTERN
> +<image-source-control-colour-pattern>` control in the image source, typically a
> +camera sensor.
> +
>   .. note::
>
>      - In all the tables that follow, bit 7 is the most significant bit in a byte.
> --
> 2.39.5
>

