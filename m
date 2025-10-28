Return-Path: <linux-media+bounces-45797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA8CC144EA
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C49EE5451E7
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786153081D0;
	Tue, 28 Oct 2025 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="pSaRmzU+"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022137.outbound.protection.outlook.com [52.101.126.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C63064BB;
	Tue, 28 Oct 2025 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649740; cv=fail; b=FW2vbeabam+dcXL9ljt/sQs4dezAv0mDPh/yuGbPt1SDe54zwYvgi/dZmuFnWmXVVVWhKT20fIkUwl552cT+en90VAIKy/8nuHF1jaZnX2DZcYIicpWSjmD6vgZYXw2blzpKb+EpaKKE6wo7vx3j10miI16jUhVyl9y98okw3oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649740; c=relaxed/simple;
	bh=5orPXXFUzpHsayhF5BUhAzZnrrFCo59bwQon/HCpSJs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KkcjL6L2fyOeEOtfsxNOyBKaU+mQc4PxfjZKD8fXcxNl5NatWYEpkbyFO/Xzb/DHbNfQIO/fVe0ffKoom7dcMIOzt8Op8Y8B4mH0CoRjP19ltc7sjnDSbutPbiaI/PEkhXHDgmZ+a0bF9g08Jy9dZcUm0upTIo3FBEpt71FTQa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=pSaRmzU+; arc=fail smtp.client-ip=52.101.126.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md0nfG9Z2pstprDdkQyU70gEFsY/39aL+YeTIUtKXGhferHEs8zqjxv484yC7dVbB/k9vD4NOi+oBYp5pZ5XDHvDN8ta6y27uytGP0n61jJ6U9QhPa+VajVdp+XRHxlTwD8jxU1eJp0YITQodPkQLV0ZvO+gx+juJWAMA+iaELth+uVVeaXesPOx00yS37CXpyObaLTwctKoflNgrRFcfeC17LTmUdY3UjbNolecEc6scL1R9ozo0AesEfNPow5o5w5S1eDvYrkptWZnyD75x8tsMgXz09q738wFIYaEuyB5vz4G/l87aUnBYgLBKKilK71qXIjrLC3OTMpafByt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecz4QcHmBk9R3vmdo08l4T3nIBmaP+Mk2764KHp81F8=;
 b=DgkogLdy5cem3sZLz9RJMHr0y1Xr8PDccAIeHpx7PDH7b6Vm9gtK6Q2CiMJK4958+Gdd1BVEf52gsGCmY/wOoEwA+AMPftL2zimOtjdclEZNv785CHjKYqFdwdFzH7JmtNK+a7JKEVP/VwxzPAcTXGXgSNVY6Awo9RYkRA0t8/ntLbn2R+O6AsUO4KkgbdhE6cZUCl+FduTvT6qdfD5c7eA7EUE1SL8pmMtkkQFJcd8IDxwKNM7izyjvmn7es6dxQ8yD3DFpTIHrI5oPba7SUrrm0L43+D5zwTVaphEG9oKCmdKIIc4vy5tUSy9peMYfiBIxqzRe0rwS0Pt7APCPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecz4QcHmBk9R3vmdo08l4T3nIBmaP+Mk2764KHp81F8=;
 b=pSaRmzU+vhhCi2Dq1UDozbBbyTfTs1F6uKEEfVQRAahuWquikHd7SSbg+SOWTWmdibJg4NoximnFdneM57jtBh9SDqDJmQuHOa5eYmMRTTu37MMF3lg9nKm9G/9tUpWsxTb8oQDzp20qiokr1+IfYF9+UmVICK21T1nx4sXs/ZPAXz4BOvh5HF/7y/fXqC7nwqDbXg9Abd3OH8aqfXNvxVukq5bm67+sMn13c1xI5+pT/L+4uMqE61XFRcRfG1wLkfHCEoVPTMIHrhNAAd08t6GBDjXlhW94sBPdebsUj/l4Keam0uKwzurJXLcewZPodq5zk990Y2wpn41sP4J/fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYZPR03MB7130.apcprd03.prod.outlook.com (2603:1096:400:339::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 11:08:54 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:08:54 +0000
Message-ID: <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
Date: Tue, 28 Oct 2025 19:08:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYZPR03MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: fe21672c-f9f6-48ac-32af-08de161261d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlA4WXFYYmxwVVVxaUpDTDYxb24yemRDNHZTSnBzK1dPcnRhOE1NMVJYSHRa?=
 =?utf-8?B?L2ROb1YyZkZNQTN0VzZqaHkraHdBVW9ULytJaTljM0doT3JkaHlaVElRSnZt?=
 =?utf-8?B?dDRZMTlITElNY05KRFJiajc5dmRmcjJwK2Nld0V2Qkc2WElvVTJRbUFGSGtx?=
 =?utf-8?B?Y3Y0WUZnbUZZcUFPV1hzTTdrbXRrRFd0cE5mbnNiMGVGYkhnKzQzMHRaNkNF?=
 =?utf-8?B?V1N3dkJ6cktNM1hqQkdSbEVOTkJ5UFVQTC9wdzBwKzhXcStheStRdjFRWHEx?=
 =?utf-8?B?VTI3VnpJK2h6dmsyZzhqb3d5Sy9UK3VGN3kzMFByVlhuVityaGhYazBMWHZN?=
 =?utf-8?B?L2dNSUwzcWxPK25KQ0xwYVlISVBCQm0xUXN4MGhRU1ByTS9XUnNhNWswTXYv?=
 =?utf-8?B?Z2FXK1Q4Zkx0NlEyRlp2UHJNSEtrYUdPZEZWbFh5S2NRaDlaSjQ1T1pXR2JJ?=
 =?utf-8?B?bVdVWXdVWmdIbW1HZEFkOHN0NHpsSjlwVlhKQTl2S0VndGRaMGc5U2R5WUdi?=
 =?utf-8?B?WjNpdmMxQUtpTSttZnJyTmlYS0pXTllCUzNkdXJubDJqeGhwenhjTS9NUEox?=
 =?utf-8?B?ZDBaNXFlSkdNZEVteXdBalBtdnp6K0NYQkFHTEs4TW5lMUZTYk53UDgwSVpU?=
 =?utf-8?B?UkoraCs3RVZiMEJLNUswTlFEamhnSWlwMkdxWTJyRzRZcHNNYzArNE4wKzBp?=
 =?utf-8?B?SjJicWkxNURiZXZmOFJybGtzaThvSUVsSlBaQzc5ZmIvTzhZZ3p4T2NXRWR0?=
 =?utf-8?B?UEVCdzNlZHRkbnZiVlNOVk15NVNsbVNFc1JoWXZMNXJka3B4bUtqdGVCMDhq?=
 =?utf-8?B?MDFkaEQ5ck1KeUFJbGY3UWZmZHdmbkZuSlRaY08wb2Q3SnN0aW54QW9nVEhB?=
 =?utf-8?B?dnlKWitKVEE4dnV0M3BEUk1kR21Mek9NMXVOYUI3SERyQ2s4NGsrOUIzNFhT?=
 =?utf-8?B?Y2NLY3R3NGdkOFhNZWw3NVJVbmJXTEs5OUlDdmorOEZ1Nmx6akdHL2ZFY2lI?=
 =?utf-8?B?Rk1YRTcxN0E4ZVlzVU04R1l1dnlSbmRyM0V6aEtMdm8wVVhNM2p2TWhmZDNJ?=
 =?utf-8?B?bVNyMmF0MXVmclI0KzZVMmgvbG9OalJLQnYzNG9oaHF4UTRTUUNPN1lHNG1V?=
 =?utf-8?B?ZXdpOWI4T1dreTJVbmVpWTFYeU9Cd3F6blNQd3RzVGM0QmZFZ0JxMmtGZURE?=
 =?utf-8?B?RDBNZm44V29CQ2haY3FacllIUlRlWEg4NTVuTFU2WmNXRDdpbUNoMURQbTY1?=
 =?utf-8?B?RU9kNHkyU0xlVWpTTHBERFJlRC85SWxYM1RLMk5HdENrZS9ldW4zSExxZS9h?=
 =?utf-8?B?azhUUnNxZmk2Q1hnQzBicXo2YU9XeURLUVJPajEvYUFKUkkwWmpaS2RPSmJV?=
 =?utf-8?B?N1pHUWE5cEpxUjZxL1FWVVhKNklpKzFISWtOTlFHL1g4OWNQVGtxaytPeVpJ?=
 =?utf-8?B?SEp1UjMxOWNYWTM4NW1zSy9qa1E4bVFoOUJNVFo4bk1FQ0JRMlpOYjl0anl5?=
 =?utf-8?B?L2ZHdHpYRzNQblRpQ3lWNTFYY2xXclhway9RU3V6VnQzd3dHQlJSaFpBNHEx?=
 =?utf-8?B?c2RsQ2RYR21DSFNBQkE4aWpzbjlpbzBhaUlRQjZJZ0NMWGNVVklnWUIwbHlX?=
 =?utf-8?B?TjRwWEVHS0lqeDUveWlxZjkyNWkxSmh1TUhTemJ3Ulo3ck5JS05HNjFsWVZR?=
 =?utf-8?B?b0dQcXQ0bTFmQ3Z2ZkVCdXNvWEN6Z1FXTytqNkxIY2ROUU5sZ3h5dFVZZUdB?=
 =?utf-8?B?NldKK2FCZXBMSlJqQ28yUGFDUytmQWt1WW9NNWNwSjhxWUJ2ZVVTOTB0d1N3?=
 =?utf-8?B?VHp3citmcXFwb1hFV0V5amtRV1dxOHc3ZzRjTlhseFZCMVVmK3dVVGwvamF4?=
 =?utf-8?B?YVQ2OTA1bDkrUmlVaENTNEdoUW1LU1psWnlxQ1JNUlgyeUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0g1akE1cE1aNjJNaFVJc1BYRmJaaWo4NUE4T3JQT0IxM3FSWDkwNnBUYk42?=
 =?utf-8?B?cnU1bGZkWjRHb09RU0IwcTY5RDBWYnpOR3RrMjFmOXBGUEw3M242L2pGTnl6?=
 =?utf-8?B?M2szYW02eGlja3g4aVkyRWJjTlpTT3lhR09EbzVJRHFIUnN3ekw1WWp5R0Zz?=
 =?utf-8?B?UXBxQnpFVzhLY3B1N0JQeDN6TGlRTlZwOXJGZS9QTWZlU1RJMU1YVjdWRmlk?=
 =?utf-8?B?WFEwYWJTanBXeEQ3ZU9TM1g2U1d4RmZwR1F5dGppSzNiNEtUUlAzb2ozYS9T?=
 =?utf-8?B?QjRibDVNcTFoRXh5WFUrYnZoQ0lUeWpBV1lQTlJtaWozOVdjOTZSeTl4c0s0?=
 =?utf-8?B?S2R6cVBGdFI1RzZpVlQ4cjduZmtGS284dFVuRitnbitSck0wdWpIZWVuemx0?=
 =?utf-8?B?d1c2RkF1c0gyNW5RMk8yQ1FlUjRhYjJzUGtDODhjbFhnUnIzWTBvTlhXajZ2?=
 =?utf-8?B?M1lKdVpHV3p5aitpTkt4NHQ2c01tWnlibHNNQlp5bDRWM2dqZWZXVjZNazhQ?=
 =?utf-8?B?VzV5NjNhWXI5NjVIckZoRWdFM1ZycUduOVNpWmh1QWlaNC9DQjJlVktyOElU?=
 =?utf-8?B?QWJtbERFTnhuUDNmRzgvMUFrdGpGeXZGeFNOVTI4Z2czNVVuVU9zWDRReWEz?=
 =?utf-8?B?VklQcGQ0bnhrTU1CTUZTNUxmRDkwZndIMmF6aEhibEJRT3hqaEp3OUJYa1BM?=
 =?utf-8?B?NmxJeFRyQ1BIRDJ5N0l1UlJ0M1Y0M1ViWlFQaCt2a0d0UXFMTUNlZUFiWkpi?=
 =?utf-8?B?bWpmM1BQWWRDUldUUU14djhaVzlYY1lKZXFhNzN0TmJIamJpZ1o4UzVYM3Nh?=
 =?utf-8?B?SStuUHN6dzFnMDJLOEl0YmtGaWQ4VkY4N0RXOW1qVXNmQWFWWVEyTm5JSEUw?=
 =?utf-8?B?UEtkWXhlcmh4emt1RUY4YmRrTGdUSUhDVHFFc1BmbkhxM05Ccnd2WDdrdXpB?=
 =?utf-8?B?SnBHQi9MZ0pNTFE0ZENJKzJpY2xtMHdsZEwyK2huQWZ6QklxTWJpZEVISWxO?=
 =?utf-8?B?b24yMjVULzVDazg1WlkrcHZRZXFXTzZ5c3d0T3hkOHRPUDk5Uy9hcGk2cHgw?=
 =?utf-8?B?RG1hSTlBaEIrcXJWaW4ycXBkRFhKNzllcnpQZUZJM1RtZXAzbk5Wa1dHMlhL?=
 =?utf-8?B?TFFBNmZjU3N3MHJOYnhUemxCOWtlZVdJbHdrTTJtWnhLUkV3WEozc1ZVMlM0?=
 =?utf-8?B?dmFrRWYxSHQrUVBDYzZPekgrak8xZm9RL0FSWVl4MjlaRzN4MTd3YXFUQjNx?=
 =?utf-8?B?eHdIUWVUQ2MydlpjdUxZUFdRVm0zbU9vLzJGQmlnS0ZYbWZ5WUhVejlBUDNp?=
 =?utf-8?B?NWFPVis5Q1VhOXQyUzJ4akVvUmxGVllNbCt4ZTRIbjhrQU5hNTFLVlRmMGV4?=
 =?utf-8?B?TGtOWnNxTW8zQVJ4SUlWdHhVTUtvUllGVUxpV3hvY3hqbFB2ZVl0Qmdhbm1m?=
 =?utf-8?B?TCtQY2Y3dWlPWFc5QXB5N1d4QUVNbVVwWEhibkw5RjZtN3hHSld3NGpZa1Uy?=
 =?utf-8?B?V3pMYkJYeStPVVdTUCt1WUZ1SFUrVnc1YjViS2IyYjZTK3dPMXdiUjNISStq?=
 =?utf-8?B?WG9IMlNTREF0czNqNFBMR2hZODIrVnZVQ3pOUExXaFJlWTBvWWRjSlBXS01I?=
 =?utf-8?B?TWFuN1dxK01IQlR1cEp2TlhpZ283dVhUWVFubWZ5UkxKZStSeXJUTlc2NmxF?=
 =?utf-8?B?cVNjZnVIU3NadHNzWmluZlV4a3kzdWc4QVZlWUdOQXplVU13ZzQwMFY3cGFi?=
 =?utf-8?B?OC9jTGFRMmQrZTVpN2pqb3dxYUFybng5VmJGQXo5SUt0Tm8vRW5ZeHFHa0ZU?=
 =?utf-8?B?TkUrSkEwdlltUnZScmM3Y3VCYTVVREFxU3J4Q2IyYzE2Q0ZrSGNGY0xIRC9y?=
 =?utf-8?B?dTdRSzg4cGMveHpjS2lBb2p3YVlDbU5EY3UwQ0hkK2RpcG4rWnEweXhVcmdk?=
 =?utf-8?B?c0hlcXZtWlNOSHNIc24xMWtrZnJoTXJtVGhUeUQ1NVlaRGpvVUpwNUtSbndz?=
 =?utf-8?B?VEd1UmozR0wreXdYdHNHb05taWZVR0srTWlNMURldFBFUUZDYXROMHZMZGNt?=
 =?utf-8?B?TG1lQjlXVFpiZnN2bTNtNFNIZ3l6KzhZMWFDcEhMdDhmUWpUMkMwVlhiUUE5?=
 =?utf-8?B?Z0IxZ29tdmhUNDIzZmRyREpDRDdhWUNNNk1YQW9FVWt5aUp0VG4zZ1Fpc243?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe21672c-f9f6-48ac-32af-08de161261d5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:08:54.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PptvYWID1QuFWq6n/PQnMCx3xyCBx1mJamvUK0UOEnel67C39sW93BddHWHzCvN7efaBp+PXIX8rJBKhOQDLYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7130


在 2025/10/27 20:57, Christian Hewitt 写道:
> [christianshewitt@gmail.com appears similar to someone who previously sent you email, but may not be that person. Learn why this could be a risk at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
>> On 27 Oct 2025, at 9:42 am, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>>
>> Introduce initial driver support for Amlogic's new video acceleration
>> hardware architecture, designed for video stream decoding.
>>
>> Compared to the current Amlogic video decoder hardware architecture,
>> this new implementation eliminates the Esparser hardware component,
>> enabling direct vb2 buffer input. The driver is designed to support
>> the V4L2 M2M stateless decoder API. The initial phase includes support
>> for H.264 decoding on Amlogic S805X2 platform.
> It would be nice if you can outline the additional hardware the driver
> plans to support so reviewers have perspective on where we are now, and
> what more be coming? - the community would also like to understand if
> this driver will supersede the stalled driver attempt in staging.
Yes, we will follow Amlogic's overall upstream progress to support more 
hardware
platforms in the future. The next step will be adding support for 
A311D2(T7) platform.
We also plan to replace the stalled driver with the new stateless 
decoder driver.
The new stateless driver is fully compatible with the old G12/SM1 
platforms, making
this transition feasible.
> NB: I can only find two S805X2 devices to purchase for testing. The
> first is a Mecool KD5 HDMI stick, but this has Widevine L1 certs so
> will be unusable due to verified boot. The second is a no-name TV box
> on Aliexpress where the advert claims S805X2 inside but also shows a
> prominent Rockchip RK3228 logo :) .. please advise on some accessible
> hardware that can be used for validating the driver.
I'm not familiar with the two S805X2 devices you mentioned. Maybe we can
post you a S805X2 reference board for testing. I will talk to my colleagues
about it and follow up.
>> The driver is capable of:
>> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).
> It would be good to provide guidance to reviewers about other codecs
> the driver plans to support and how (architecturally) the driver will
> be expanded. I’m aware due to off-list discussions, but others are
> not and will want to know.
Thanks for the suggestion. Our roadmap is to implement support for five
codecs―H.264, H.265, VP9, AV1, and MPEG-2―in phases. This patch is the
initial phase of development, including the V4L2 interface layer and
the H.264 driver code. The H.265 decoder is also in development.
I'll add our plan in the cover-letter of the next version (v2) patch
series to make it clear for the kernel reviewers.
>> - Supporting I/P/B frame handling.
>> - Supporting vb2 mmap and dma-buf modes.
>> - Supporting frame-based decode mode. (Note that some H.264 bitstreams require
>>   DPB reordering to generate reference lists, the stateless decoder driver
>>   cannot access reordered reference lists in this mode, requiring the driver
>>   to perform reference list reordering itself)
>> - Supporting NV12/NV21 output.
>> - Supporting Annex B start codes.
>>
>> This driver is tested with Gstreamer.
>> Example:
>> gst-launch-1.0 filesrc location=/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
>> parsebin ! v4l2slh264dec ! filesink location=/tmp/output.yuv
> Is this upstream gstreamer? if yes which version? If no, where can
> we obtain sources for testing. Has ffmpeg been tested? - the same
> questions apply.
The version is Gstreamer 1.24, I downloaded the source code from the 
official
website: https://gstreamer.freedesktop.org/.
FFmpeg hasn't been tested yet. We will also try to test the driver with 
ffmpeg.
>> The driver passes v4l2 compliance test, test reports :
>> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>
>> Compliance test for aml-vdec-drv device /dev/video0:
>>
>> Driver Info:
>>         Driver name      : aml-vdec-drv
>>         Card type        : platform:aml-vdec-drv
>>         Bus info         : platform:fe320000.video-codec
>>         Driver version   : 6.16.0
> It would be preferable to test the next iteration of patches on
> the latest kernel release, e.g. 6.18-rc, or recent media tree or
> perhaps drm-tip source.
Thanks for the suggestion, we will do the compliance test on kernel
6.18 and post the result of the next version(v2) patch series.
>>         Capabilities     : 0x84204000
>>                 Video Memory-to-Memory Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps      : 0x04204000
>>                 Video Memory-to-Memory Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>         Detected Stateless Decoder
>> Media Driver Info:
>>         Driver name      : aml-vdec-drv
>>         Model            : aml-vdec-drv
>>         Serial           :
>>         Bus info         : platform:fe320000.video-codec
>>         Media version    : 6.16.0
>>         Hardware revision: 0x00000000 (0)
>>         Driver version   : 6.16.0
>> Interface Info:
>>         ID               : 0x0300000c
>>         Type             : V4L Video
>> Entity Info:
>>         ID               : 0x00000001 (1)
>>         Name             : aml_dev_drv-source
>>         Function         : V4L2 I/O
>>         Pad 0x01000002   : 0: Source
>>           Link 0x02000008: to remote pad 0x1000004 of entity 'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable
>>
>> Required ioctls:
>>         test MC information (see 'Media Driver Info' above): OK
>>         test VIDIOC_QUERYCAP: OK
>>         test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>         test second /dev/video0 open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>         test for unlimited opens: OK
>>
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>         test VIDIOC_QUERYCTRL: OK
>>         test VIDIOC_G/S_CTRL: OK
>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>         Standard Controls: 6 Private Controls: 0
>>         Standard Compound Controls: 4 Private Compound Controls: 0
>>
>> Format ioctls:
>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>         test VIDIOC_G_FMT: OK
>>         test VIDIOC_TRY_FMT: OK
>>         test VIDIOC_S_FMT: OK
>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>         test Cropping: OK (Not Supported)
>>         test Composing: OK (Not Supported)
>>         test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>         test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>         test CREATE_BUFS maximum buffers: OK
>>         test VIDIOC_REMOVE_BUFS: OK
>>         test VIDIOC_EXPBUF: OK
>>         test Requests: OK
>>         test blocking wait: OK
>>
>> Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>
>> Some Fluster test cases are still failing. We will publish the final results
>> once all these Fluster test failures have been resolved.
> IMHO good drivers that merge quickly have more merit than perfect
> drivers that take forever. No driver passes all fluster tests. If
> you share the results, people can advise whether the failures are
> normal, something that must be improved, or something that can be
> improved with time.
Thanks. We have now tested the JVT-AVC_V1.
Result:
Ran 54/135 tests successfully

- 52 test vectors failed due to interlaced or mbaff clips: The Amlogic 
stateless
   decoder driver only support bitstreams with frame_mbs_only_flags == 1.
   Test Vectors:
         cabac_mot_fld0_full
         cabac_mot_mbaff0_full
         cabac_mot_picaff0_full
         CABREF3_Sand_D
         CAFI1_SVA_C
         CAMA1_Sony_C
         CAMA1_TOSHIBA_B
         cama1_vtc_c
         cama2_vtc_b
         CAMA3_Sand_E
         cama3_vtc_b
         CAMACI3_Sony_C
         CAMANL1_TOSHIBA_B
         CAMANL2_TOSHIBA_B
         CAMANL3_Sand_E
         CAMASL3_Sony_B
         CAMP_MOT_MBAFF_L30
         CAMP_MOT_MBAFF_L31
         CANLMA2_Sony_C
         CANLMA3_Sony_C
         CAPA1_TOSHIBA_B
         CAPAMA3_Sand_F
         cavlc_mot_fld0_full_B
         cavlc_mot_mbaff0_full_B
         cavlc_mot_picaff0_full_B
         CVCANLMA2_Sony_C
         CVFI1_Sony_D
         CVFI1_SVA_C
         CVFI2_Sony_H
         CVFI2_SVA_C
         CVMA1_Sony_D
         CVMA1_TOSHIBA_B
         CVMANL1_TOSHIBA_B
         CVMANL2_TOSHIBA_B
         CVMAPAQP3_Sony_E
         CVMAQP2_Sony_G
         CVMAQP3_Sony_D
         CVMP_MOT_FLD_L30_B
         CVNLFI1_Sony_C
         CVNLFI2_Sony_H
         CVPA1_TOSHIBA_B
         FI1_Sony_E
         MR6_BT_B
         MR7_BT_B
         MR8_BT_B
         MR9_BT_B
         Sharp_MP_Field_1_B
         Sharp_MP_Field_2_B
         Sharp_MP_Field_3_B
         Sharp_MP_PAFF_1r2
         Sharp_MP_PAFF_2r
         CVMP_MOT_FRM_L31_B
- 3 test vectors failed due to unsupported bitstream.
   num_slice_group_minus1 greater than zero is not supported by the
   hardware.
   Test Vectors:
         FM1_BT_B
         FM1_FT_E
         FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the
   hardware.
   Test Vectors:
         SP1_BT_A
         sp2_bt_b
We are working with the remain failures, we think that these fail cases
must be resolved.
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>> Zhentao Guo (3):
>>       dt-bindings: vdec: Add binding document of Amlogic decoder accelerator
>>       dts: decoder: Support V4L2 stateless decoder dt node for S4
>>       decoder: Add V4L2 stateless H.264 decoder driver
> None of the patch subject lines are following the naming formats
> used for the subsystems. Patch order is also important. Bindings
> go first, device-tree changes to expose support normally go last.
> Expect maintainer complaints about not reading kernel etiquette
> rules before submitting.
Thanks for the reminder. I will rebase the patches in correct order
and revise the subject according to the specifications.
>> .../bindings/media/amlogic,vcodec-dec.yaml         |   96 ++
>> MAINTAINERS                                        |    7 +
>> arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   24 +
>> drivers/media/platform/amlogic/Kconfig             |    2 +
>> drivers/media/platform/amlogic/Makefile            |    1 +
>> drivers/media/platform/amlogic/vdec/Kconfig        |   15 +
>> drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>> drivers/media/platform/amlogic/vdec/aml_vdec.c     |  759 +++++++++
>> drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
>> .../platform/amlogic/vdec/aml_vdec_canvas_utils.c  |  154 ++
>> .../platform/amlogic/vdec/aml_vdec_canvas_utils.h  |   22 +
>> drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  263 +++
>> drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  194 +++
>> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  652 +++++++
>> drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  182 ++
>> .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
>> .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
>> drivers/media/platform/amlogic/vdec/h264.c         | 1790 ++++++++++++++++++++
>> drivers/media/platform/amlogic/vdec/h264.h         |  300 ++++
>> drivers/media/platform/amlogic/vdec/reg_defines.h  |  175 ++
>> 20 files changed, 4770 insertions(+)
> The driver requires closed-source firmware blobs (sadly) for each
> codec and hardware target. Will that change in future iterations?
> If not, the firmware blobs are not provided here so it would be
> useful if you could provide a public source for them. There are
> known FOSS tools for extracting files from the Android ucode blob
> but testing presumably needs a specific blob version?
Yes, we plan to address this in future iterations. We intend  to pack
the firmware blobs for all codecs together but they will still remain
categorized by different hardware platforms sine we want to avoid making
the firmware package excessively large. The closed-source firmware will be
uploaded to the firmware repo:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git.
I will share the commit link once the upload is completed.
> Most maintainers also prefer a complex driver to be submitted in a
> series of patches that break the driver up into logical and easier
> to-review pieces. Large uber-patches are harder to digest and are
> likely to take much longer to review, and more effort for everyone
> to track feedback on over time.
Thanks for reminder. I admittedly overlooked these considerations.
The next version of the patch series will be improved accordingly.
> ***
>
> NB: The fact this driver is being submitted, is still a positive
> and welcomed step towards better upstream Amlogic support and it’s
> great to see! I would encourage you and colleagues to establish a
> public working space to share code and tools so the community can
> directly engage and support driver testing and development.
Yes, we will take this into consideration. Thanks again for all your
suggestions above, we look forward to cooperate with community.
>
> Christian
Best Regrads
Zhentao


