Return-Path: <linux-media+bounces-48692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E7CB7D77
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 05:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E1803028E76
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 04:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3FC2F3C3D;
	Fri, 12 Dec 2025 04:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="IKUubrJw"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022090.outbound.protection.outlook.com [52.101.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5F1D5147;
	Fri, 12 Dec 2025 04:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512720; cv=fail; b=JzfEnz1oh+WFajXhD9B6CWfAJU8cHw53cwbgCv1WdD9CHDPKDGXOi5QUjml8DDVn8S7fuBPyzluvlgYKoYwAR3BEtS7/ioUIDHe00nz2raDxo7G97AiPnZAOq+PZ+meh1mugaq/r60HPKmDVEi03OBUG+Bpgl1v1bXM+Dr089qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512720; c=relaxed/simple;
	bh=pb5Giq/aavYSkx39eK11L1eKO+PmbbCPY5uQYP0mijk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VccNRuaDr078S8PfKvMg3+GwlnLvl+2LpRw/ICZttctIWIeHcggdqHmMWUgfP/fUHLpEjzOzXkll/M6Q1xFeKVymcis2WW+GiNJW4Awq/cY10YmaoKnAvH/8Cf46JW5riJII00idAip5uuj5cAptT8yzy+Ee0O3Ly8rksEOa6sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=IKUubrJw; arc=fail smtp.client-ip=52.101.126.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTKVQyQNwDvmN4WMxx8vxcwo1cDCdzZzjfPvNKG/KdmaelGkfPGKz0wjwRKSqS7/R3AHHswcbyNgK3bs63+vxVwAGk5WNLwLRZ6ZyVNaOM0FNbwVPBQXoMgCBsMK1kcKhUzKbCde5z1bG2QhAT9GxunziNLNV4LwdfEa1l8LaqfYznho5pDc9GWXIQbxJe1E9EYQMWl00lg3OMmmPmMcN6tJxdQbQ+LoQHN4yVPMJklpNNkQz12U6kOxGGxjml+LEAkfoTnlricU40H5lBqozX5dI3cpXRbXDpvAMSZf+MVvFFyZnVsEoYUSlhHycQGSxWKyW501CecbAbNgaaxPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IJROTgeS+gdBrVdnKeZpbkhDjF77yTC9ofatEtxDvg=;
 b=XUjybddFBX2aBnb04BSI871MHP+XOvQ69BqdRLRfqAv6tAsBvClGX7wCAObzaMQpC/iDbPfdmZZpbBmk/SaWzgs8iI1GLyLIdOosVRClUXgsGwg/sFwaTonxrrBLt3hp5oknGoE7jY44yPjGxy9DgPKk1+SW8Yb/Enq4N0qv5JVR3IECMcc51b2GROuATGW2segAFxZK0QsafT/n5pxsw3ITyL1ZJjjSlxU2hHNptb9ysxTBUbQKxZanpuXVeHdVgKqU0lBnMlbbr6rLiHT0e0nHbrSXFuMlwUOpC93D0cBuzmeloJZSyy+XAoRTv0pfqVERiBDVGIoSf/mlycKBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IJROTgeS+gdBrVdnKeZpbkhDjF77yTC9ofatEtxDvg=;
 b=IKUubrJw5nok7vP3nxBlLQMxxewnj2KQ1PuSixlXuz68CTPvHyEEB6ZTACHE2LSr8oF34zrIig0da2rspXWQSIrWYEV0qsSWVfUMcyKJ8MMC0M6K99vAPNfJKFc/yHPLJ0Ef6HbVBoflSvogH7OyPBBVxpmL9QAd3mcAkoBuhpsMtsKA8Cm3HlU3bwhzG3IqineMv7E6pnFADhMTMp0eZE5WE2hiNPPOX8vMPM8CJU+Ar2qTgHkV608cZY14KdnFM2dTBAddcDIpAEv3oYLHD/heVM56Y6ak4a7N0n/LZHLYHA1pLrmLvi34jocF1D0IK2fSxphBhg43ybOU6/C6bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB6628.apcprd03.prod.outlook.com (2603:1096:101:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:11:46 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 04:11:45 +0000
Message-ID: <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
Date: Fri, 12 Dec 2025 12:11:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] decoder: Add V4L2 stateless H.264 decoder
 driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <20251124-b4-s4-vdec-upstream-v2-2-bdbbce3f11a6@amlogic.com>
 <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: ef578a28-a278-4c3e-b7fe-08de39348f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEw5TWFlZmFKYVc0M1gvSnBWYVJHTDhTdExZWnRPejFUbTY3b1ZPTUpyQSt6?=
 =?utf-8?B?UTZnMkR0aEtQTVlSS05YL09WUkNaUTExOFc2eFBURHVvcStoUTZoVVBxUUEx?=
 =?utf-8?B?a3lXc2NPOFlWd0RZeG9lajRLWDA1TzEwbXBTMFMxSXBxeDRrcXFIbW1lWjhv?=
 =?utf-8?B?ZHZ0WS9wblYwSmhvN0trTmVIWEkvMysyWUVJQ0p3Sm5tSHhRQVBZKzhUS3ZK?=
 =?utf-8?B?R1FpNTNsRUFkUHQvMVNsbmxJb0ZZU3FIblFHZ1lBUEFnWUZkblBEN29mQ0tH?=
 =?utf-8?B?Z01pS0hlQ1Z1VDYya0NNaVI1YldUMGFlWVhYb25NV0l3bzQramRxWmNSeXFv?=
 =?utf-8?B?STZZbU1RdEpxTE5OOTQ2cnUxbVpYdGtwZ3BHUnZkdGdpVmp3SDlFREpSV3k0?=
 =?utf-8?B?Y2x0aTVOR0FmajM5YStsdXcwV08zWEhBbXFiZmNnTDk0Nk1TK1d2eXE0RGov?=
 =?utf-8?B?OGFYYVJkbTZxTUcrRWJTYlJ4OU5CY3FlVFdvTjNRNC9Hb1lBZ1dBdGd5N2t1?=
 =?utf-8?B?UDdzOTZnVXgrcGVaWDU1dWpBUkluME9IUnduZC9ZWENWR01xRCtTVHNYR2hs?=
 =?utf-8?B?dG14ZTYydU43cVRpSmszZXBoT1VGZ1JmWGw4eDh2RmppQ0VVdzI1TFUxbEE2?=
 =?utf-8?B?N2l5U3BMdEFqeWZ2Z2tseUdyTWJqOW80bzFFTjk0Q043Y1FwNjFONHA5d1dX?=
 =?utf-8?B?WUNMZUNiZ1gxZm84cEVETWJlVUdnZlE1dDI2bS9oZ09rMkU0Z1dGNlR5ZVYv?=
 =?utf-8?B?QWE4cEZ2Q2owYkJyRHBCSVUyRUFqWGV4aktPelpDZi92RGJWTWJWQUVEUllx?=
 =?utf-8?B?cHQ5NW5UWkh6Q3ExcDJJYUdLUXdZUGRuUHhWTmVNMlB0WGFGV3hOdi96VjBK?=
 =?utf-8?B?RVF5eTlPclYyVXNhclY1SGkyTC9Id1ByWHRhZS8xTGFySS94c3ZNVi84Q1hE?=
 =?utf-8?B?ZGNIaU93VThHVlluVHpFZE1HWkxpMWdnWmt6ZjdyYm42ZWxRZnVBM05zRFpN?=
 =?utf-8?B?TTQ1Q3czbUgvRzc5blRJa2ZSVEZpcFg0Y3lSWFQ0aTlDTW9DeURUV0RnUEho?=
 =?utf-8?B?dFdnbEorQWViditWdUdyYlN0bnkrWFRWdWFjbDVlYS9IbzlKOUsza3ZlRGxL?=
 =?utf-8?B?eGo2SHFUaTdhV21wa2k0UGU5Zm9Dd3FzRG9Kb0M4bHJHZGIzdTJObmIxRFZN?=
 =?utf-8?B?b0ZGUHZtdUdKZ0loMFJrVW9GUHJPZkVxRDZaN2ptVEs5WkYxeE9JdTlTWWs0?=
 =?utf-8?B?bmJyRjlOZHBoaW9IUXpRajFwU1hwWjJ3dGtlUS9Uemh1U0VuQ0xNakh5dmg2?=
 =?utf-8?B?UFhkcCsremRFSFFCOEZJVEVOMWdFeFAyYjVwNjVkemZCSldSVzFZREJRWlNr?=
 =?utf-8?B?bVpUQUMwdEdlcDVJZ0ZZQzRpc2o1VnNuRmdqRmNhKzhyTVZOQlVSN3dUakdX?=
 =?utf-8?B?aGpUWGFCbkFmZE5TdC91YzF1dmphU00wMHE5TURMOE5nc05WY2E0dkJiTFU4?=
 =?utf-8?B?SDlOYzcyRVNSam9iR1hDNnNPcTMwQnpUbk95emRkQmNSenN5a1VmczZDNk1l?=
 =?utf-8?B?ZnJKS0FnSmN5UjJIL0tGWDMycFdldHlKSnpJQTgvS1pKbnBUZkJldTRqd1lE?=
 =?utf-8?B?VlZBVUxYL2o2Y0xmTHlqOHFEUUtzSXNyV1NiTTlXbUlPVlJGYXhpbEhCanlO?=
 =?utf-8?B?S2l4c2xRTnJQYjNKZjhOdzB5bWVRUHc5MUUxeU1RWVlxd01ZWkNOUzRtaGk0?=
 =?utf-8?B?cXhPT2FIc0lhUU5jOW9Lc2tmcDRrUy9Wd052N20yQnZOWnlJL2MxOGIxUUlK?=
 =?utf-8?B?UWJuT0FGNHFTcnVLWUtZUjFPRm9mVUFGVGpHaDEyRjd2by9ISnZBWEpIVWly?=
 =?utf-8?B?dWFUU1AvbkxUTmpHdWlFVHNDR25HK2VvUThlRExiRHYrZGxlalZNbWsvWFFw?=
 =?utf-8?Q?GgmWNhf/6m7eF12O0Z6wIlF/s6lO0axR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09jcFkvanZFK1dOQldsL3I2WmNyZFFJQlpKeTFiVENiTFRCc25zaHlHaXZP?=
 =?utf-8?B?VktPQTVqclVSLzg2cHRJdVFzMEwrWGZkaXVLMkhqREF1QVpORGEzWjduYzYv?=
 =?utf-8?B?SE00SjhzR2JMVndKa1ovLzIyZWZPUWJMTVNHSHhaMStWR2RRQnJKMXFmZ1pZ?=
 =?utf-8?B?SnBkbEIra0FRcU1xV2YvcVE2dUdzckpNZ3ZFaTJsdlpIYm1RT3V4Nm84RU5G?=
 =?utf-8?B?eFpoQkgyT04zdDl4UGhaNmxYeEozQnhUd1VCSkxZc0lraWZEdDc4MGt4Q3l1?=
 =?utf-8?B?R001c0trRkw1R1loN2VzL3lBeisxMk5tK1gzMm9qMFFHUmhLWlNnYmpmS1B6?=
 =?utf-8?B?UW9xcklGWmo2S3VMUWd3YUNKWWdZQXN2SFRsbnl5WXVIUm9ZbG1ZaEFHT1JK?=
 =?utf-8?B?RnZNZmpYZGFCdmdiQVYyTVlZTU5yL2ZacWdYYUdaZC9EVnhhSEJVWEdCM2RB?=
 =?utf-8?B?LzdBeG1sWmJOV3JscnBmazdPYXZlcWRuZFJ6dWVFUmthNFJEaUdFbUdOSHYw?=
 =?utf-8?B?T1dYc1VuM0MrbkQ0MWtudGNYU0NzZlliWmhtdXNTMEQwU1JidEx0K1FCUHNJ?=
 =?utf-8?B?M0hWdUFnNWZLY2Vqc0xWT2JIeGdWZWNiZ1gvbG00K2NLWVo3Uy93eWFaOEVG?=
 =?utf-8?B?bU80UHJmSmdpNzZuZmNTVTRWYll2Rk9kbk5HeVg5T1B6QXJ4TjBuKzkvVzBB?=
 =?utf-8?B?NnN4VWwrQk0wUm16M2RkaUp4c0FzWXZibXNTK2JEck5yNkdZRXZwaVRIS1F4?=
 =?utf-8?B?eFZMMnpIbzZGMUh6QW1TOWJCem9mNXZwNm9mT2t6SHo0UDBHRzl1QTY1QUt1?=
 =?utf-8?B?SE5oUXk4aXdhbEZObE1BMHZadlI4cE1zU1ZIK1hTUnU4dWdsbWlJWldZYWM1?=
 =?utf-8?B?aGZIM2lnRHBCRlo0OStrc1RxRWZSMW9rYi81WDFVUDkzc0hrcjBFM0V3TUFu?=
 =?utf-8?B?YjllZE45cldKVXlRNGNnSEt4ZTZEL0tKRXJOaFFQVnBiYjVIaGR0MmFIRVV0?=
 =?utf-8?B?ZWx4aklxMzVHM1A1Mldka3RCekRDMWFhSkRDR0tYN1VWczhHUDNtbHA0eS9H?=
 =?utf-8?B?SFBNTTA0Y3lOM2g0Y1U5S0dYVkZ3WWZJdmloVmVnNGo2bE9xTXJGbnFyU2x2?=
 =?utf-8?B?am5mcW5DS21yKzFWckJXelVpWjloZUdFRGZoajN3ZGd5T3h1Um8zY2lranJ2?=
 =?utf-8?B?QUM1bjVKYndBQmRQWWxWeGR1d1R0WFNpMVBTZ1p1NWlhSEdFNmJEdllPTHpa?=
 =?utf-8?B?UWwxdTVIdE9kM1dKSmxYRU14eEVtSEp1ZmhFb29lU3dua0FIUzk4VnhBWGxB?=
 =?utf-8?B?R2h1WFh6MU54SGVBbWdFeUo3ekZzeU9Fb21oRnkwYmxsWDkvdW5sRVYreDVP?=
 =?utf-8?B?dWFpeGQ3cmpFL2Q2d05VWlhjZWxNd0V6M3VjN3NFQmNXWkI0RlpUeGRDaW1w?=
 =?utf-8?B?MTNBZDhQOG1kSkp5Z3g2YkNUMDF0QVJZVWVOVjAzR0RZVlBOYUlVNEdJc0dK?=
 =?utf-8?B?eXEzQm9seVh5Z3loOXlnL3hGRXVZTWtmUnY2YUNEU1pvTVpvYmhSelBaU3JC?=
 =?utf-8?B?UHlKS2NCSVhTWmZoZ0w2QVk1VXhZNlN3cHByRHl0ZnlGUkk1dWhYZVZhQmRZ?=
 =?utf-8?B?Mldja0YxMUt1QVRYNm4zR1Z3eFVpdG9Nbm5CbDl2QVVBNjhEaW1OTEhvS1ZM?=
 =?utf-8?B?aEQ3WGU1K3hBKy81emdCK2E5bHVoNlpGdk13Szh1cVZ1Z25xN1lIem1nRjVR?=
 =?utf-8?B?TkNJRlJ6Ynh0ek0vQUlyTmdaM29tcGJOaGdxSWQ0dlJ1WU9wQi84Y25pQTRv?=
 =?utf-8?B?eUtiU0FmMktZbFZ0VWpZeE9RcXdwdW1KS01iZUE1Ymd1aVh5Nis1VEV5QlJz?=
 =?utf-8?B?cDJJa2VUYnFCNUNtYU1kRzEvdC9MRTZjU25JRnBpQms3aWVNTlplbkZKZjdx?=
 =?utf-8?B?SGM0blJmYXhBeUE2ekVqRHVmbDFkMUxjYmRlMzJZSTI4UFNlZ0N3andvQzhU?=
 =?utf-8?B?eGdJczI2UUNsKzZvVmdoTS9OVytEMWx4QS9QeHRwcWJGOHNZTUVYSmJIdWJL?=
 =?utf-8?B?Z2c0Q3ljSVRzRkU2OENWaCtVdUh6SmIvRUZCcW1Bei9iYnErQTJpOXhuUStZ?=
 =?utf-8?Q?jc4nKxLJFG/RzJy40K/jdEL25?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef578a28-a278-4c3e-b7fe-08de39348f9b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:11:45.1665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNntlKaeRHbv+NgzNYZw1LoAnILD16y9wizW7HmK/GKzRpCu4qHSMv6plJrVcSkgwF6qtJH8oNqIiRVNJlZsfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6628


在 2025/12/12 3:53, Nicolas Dufresne 写道:
Hi Nicolas
> Le lundi 24 novembre 2025 à 11:32 +0800, Zhentao Guo via B4 Relay a écrit :
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add initial support for V4L2 stateless video decoder
>> driver on Amlogic S4(S805X2) platform. In phase 1,
>> it supports H.264 bitstreams decoding.
> Please reflow in next version, you can use something like 72 char. Since this is
> subset of what the HW can do, some extra information is appreciate, perhaps
> which profiles, pixel depth etc.
Thanks, I got it. I will optimize it in the next version according to 
your suggestions.
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   MAINTAINERS                                        |    7 +
>>   drivers/media/platform/amlogic/Kconfig             |    1 +
>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>   drivers/media/platform/amlogic/vdec/Kconfig        |   16 +
>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>   drivers/media/platform/amlogic/vdec/TODO           |    7 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  756 ++++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  239 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  196 ++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  596 ++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  158 ++
>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
>>   drivers/media/platform/amlogic/vdec/h264.c         | 1933 ++++++++++++++++++++
>>   drivers/media/platform/amlogic/vdec/h264.h         |  300 +++
>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>>   17 files changed, 4521 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ec635515c0c4..371c8b828394 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1365,6 +1365,13 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
>>   F:	drivers/spi/spi-amlogic-spisg.c
>>   
>> +AMLOGIC VCODEC DRIVER
>> +M:	Zhentao Guo <zhentao.guo@amlogic.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>> +F:	drivers/media/platform/amlogic/vdec/
>> +
>>   AMPHENOL CHIPCAP 2 DRIVER
>>   M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>   L:	linux-hwmon@vger.kernel.org
>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>> index 458acf3d5fa8..7c541ac0d0c3 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -4,3 +4,4 @@ comment "Amlogic media platform drivers"
>>   
>>   source "drivers/media/platform/amlogic/c3/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> +source "drivers/media/platform/amlogic/vdec/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>> index c744afcd1b9e..7409de674c0b 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -2,3 +2,4 @@
>>   
>>   obj-y += c3/
>>   obj-y += meson-ge2d/
>> +obj-y += vdec/
>> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
>> new file mode 100644
>> index 000000000000..95424d64cc1f
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +
>> +config VIDEO_AMLOGIC_VCODEC
>> +    tristate "Amlogic Video Codec Driver"
>> +    depends on ARCH_MESON || COMPILE_TEST
>> +    depends on VIDEO_DEV
>> +    depends on V4L_MEM2MEM_DRIVERS
>> +    select VIDEOBUF2_DMA_CONTIG
>> +    select V4L2_H264
>> +    select V4L2_MEM2MEM_DEV
>> +    select MESON_CANVAS
>> +    help
>> +      This is a v4l2 driver for Amlogic video codec driver.
>> +	  This driver is designed to support V4L2 M2M STATELESS
>> +	  interface.
>> +      To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
>> new file mode 100644
>> index 000000000000..1a7dcf1d7562
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o\
>> +
>> +obj-$(CONFIG_VIDEO_AMLOGIC_VCODEC) += aml-vdec-drv.o
>> diff --git a/drivers/media/platform/amlogic/vdec/TODO b/drivers/media/platform/amlogic/vdec/TODO
>> new file mode 100644
>> index 000000000000..54c60145770e
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/TODO
>> @@ -0,0 +1,7 @@
>> +TODO list for Amlogic V4L2 stateless decoder driver:
>> +
>> +1. Support decoding for HEVC, VP9, AV1, and MPEG-2.
>> +2. Support more SoCs, including the new T7/S7 series and legacy SoCs (e.g., GXL, SM1, G12B).
>> +3. Support 10-bit decoding and P010 output.
>> +   Note: P010 output requires hardware support.
>> +4. Support interlaced stream decoding for H.264, HEVC, and MPEG-2.
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
>> new file mode 100644
>> index 000000000000..3ef2d32a7a73
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
>> @@ -0,0 +1,756 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/videobuf2-v4l2.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "aml_vdec.h"
>> +#include "aml_vdec_hw.h"
>> +#include "aml_vdec_platform.h"
>> +
>> +#define VCODEC_DRV_NAME "aml-vdec-drv"
>> +
>> +static const struct aml_vdec_v4l2_ctrl controls[] = {
>> +	{
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_SPS,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_PPS,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
>> +			.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>> +			.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>> +			.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_START_CODE,
>> +			.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
>> +			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
>> +			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +			.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>> +			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>> +			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>> +		},
>> +	}
>> +};
>> +
>> +static struct aml_video_fmt aml_video_formats[] = {
>> +	{
>> +		.name = "H.264",
>> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>> +		.type = AML_FMT_DEC,
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.num_planes = 1,
>> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
>> +	},
>> +	{
>> +		.name = "NV21M",
>> +		.fourcc = V4L2_PIX_FMT_NV21M,
>> +		.type = AML_FMT_FRAME,
>> +		.codec_type = CODEC_TYPE_FRAME,
>> +		.num_planes = 2,
>> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
> You can make a define to initialize this, so you don't repeat it over and over.
> Also, try to use readable style, similar to the cfg above.
OK, I'll refer to some other upstreamed drivers and imporve this.
>
>> +	},
>> +	{
>> +		.name = "NV21",
>> +		.fourcc = V4L2_PIX_FMT_NV21,
>> +		.type = AML_FMT_FRAME,
>> +		.codec_type = CODEC_TYPE_FRAME,
>> +		.num_planes = 1,
>> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
>> +	},
>> +	{
>> +		.name = "NV12M",
>> +		.fourcc = V4L2_PIX_FMT_NV12M,
>> +		.type = AML_FMT_FRAME,
>> +		.codec_type = CODEC_TYPE_FRAME,
>> +		.num_planes = 2,
>> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
>> +
>> +	},
>> +	{
>> +		.name = "NV12",
>> +		.fourcc = V4L2_PIX_FMT_NV12,
>> +		.type = AML_FMT_FRAME,
>> +		.codec_type = CODEC_TYPE_FRAME,
>> +		.num_planes = 1,
>> +		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
>> +			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
>> +	},
>> +};
>> +
>> +void aml_vdec_set_default_params(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_q_data *q_data = NULL;
>> +
>> +	ctx->m2m_ctx->q_lock = &ctx->v4l2_intf_lock;
>> +
>> +	ctx->pic_info.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	ctx->pic_info.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	ctx->pic_info.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	ctx->pic_info.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +
>> +	q_data = &ctx->q_data[AML_Q_DATA_SRC];
>> +	memset(q_data, 0, sizeof(struct aml_q_data));
>> +	q_data->visible_width = AML_VDEC_MIN_W;
>> +	q_data->visible_height = AML_VDEC_MIN_H;
>> +	q_data->coded_width = AML_VDEC_MIN_W;
>> +	q_data->coded_height = AML_VDEC_MIN_H;
>> +	q_data->filed_flag = V4L2_FIELD_NONE;
>> +	q_data->bytesperline[0] = 0;
>> +	q_data->sizeimage[0] = (1024 * 1024);
>> +	q_data->fmt = &aml_video_formats[DEFAULT_OUT_IDX];
>> +
>> +	q_data = &ctx->q_data[AML_Q_DATA_DST];
>> +	memset(q_data, 0, sizeof(struct aml_q_data));
>> +	q_data->visible_width = AML_VDEC_MIN_W;
>> +	q_data->visible_height = AML_VDEC_MIN_H;
>> +	q_data->coded_width = AML_VDEC_MIN_W;
>> +	q_data->coded_height = AML_VDEC_MIN_H;
>> +	q_data->filed_flag = V4L2_FIELD_NONE;
>> +	q_data->bytesperline[0] = q_data->coded_width;
>> +	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
>> +	q_data->bytesperline[1] = q_data->coded_width;
>> +	q_data->sizeimage[1] = q_data->sizeimage[0] / 2;
>> +	q_data->fmt = &aml_video_formats[DEFAULT_CAP_IDX];
> Why do you duplicated visible and coded width ? how can you hold two of these ?

Indeed the decoder hardware will only use coded width/height. They are 
used to calculate
the offset of the chroma data from the capture buffer. I'll refer to 
some upstreamed drivers
and see how they handle these two values.
> Also, to avoid possible deviate in sizeimage/bytesperline calculation, introduce
> some reset function, and perhaps make use of your internal implementation of
> try_fmt.
OK, I'll replace this with a proper reset function.
>> +}
>> +
>> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx)
>> +{
>> +	int i;
>> +	int ctrls_size = sizeof(controls) / sizeof(struct aml_vdec_v4l2_ctrl);
>> +
>> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, ctrls_size);
>> +	for (i = 0; i < ctrls_size; i++) {
>> +		v4l2_ctrl_new_custom(&ctx->ctrl_handler, &controls[i].cfg, NULL);
>> +		if (ctx->ctrl_handler.error) {
>> +			dev_info(&ctx->dev->plat_dev->dev, "add ctrl for (%d) failed%d\n",
>> +				 controls[i].cfg.id, ctx->ctrl_handler.error);
>> +			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +			return ctx->ctrl_handler.error;
>> +		}
>> +	}
>> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
>> +	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
>> +}
>> +
>> +static void m2mops_vdec_device_run(void *m2m_priv)
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)m2m_priv;
> No need to cast void*
Got it!
>
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	struct vb2_v4l2_buffer *src, *dst;
> nit: src_buf, dst_buf
OK, I'll rename them.
>
>> +	struct media_request *src_req;
>> +	const char *fw_path = dev->pvdec_data->fw_path[ctx->curr_dec_type];
>> +
>> +	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +	dev_dbg(&dev->plat_dev->dev, "device run : src buf : %d dst buf %d\n",
>> +		src->vb2_buf.index, dst->vb2_buf.index);
>> +
>> +	src_req = src->vb2_buf.req_obj.req;
>> +	if (src_req)
>> +		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
> I'll need to check, not all drivers do these check, yet I haven't found in the
> core where we prevent this from happening. I want the core to prevent this so we
> can remove all these checks, but I'm a bit unsure now.
Got it. If you think this can be removed, please feel free to inform me, 
thanks!
>> +
>> +	dos_enable(dev->dec_hw);
>> +	/* incase of bus hang in stop_streaming */
>> +	ctx->dos_clk_en = 1;
>> +	aml_vdec_reset_core(dev->dec_hw);
>> +	load_firmware(dev->dec_hw, fw_path);
>> +
>> +	if (ctx->codec_ops->run)
>> +		ctx->codec_ops->run(ctx);
> use if (!BUG_ON(ctx->codec_ops->run == NULL)), it would be driver programming
> error to not have a fun function.
Yes, I'll add the BUG_ON here.
>
>> +
>> +	v4l2_m2m_buf_copy_metadata(src, dst);
>> +	if (src_req)
>> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>> +
>> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, VB2_BUF_STATE_DONE);
> This is atypical, normally we call this when we receive the IRQ, that avoid
> having to poll, and remove a useless context switch.
OK, I'll move it to the IRQ function. In fact, I haven't looked into the 
implementation details of this function yet. I'll go and study it.
>> +}
>> +
>> +const struct v4l2_m2m_ops aml_vdec_m2m_ops = {
>> +	.device_run = m2mops_vdec_device_run,
>> +};
>> +
>> +static int vidioc_vdec_querycap(struct file *file, void *priv,
>> +				struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, VCODEC_DRV_NAME, sizeof(cap->driver));
>> +	strscpy(cap->card, "platform:" VCODEC_DRV_NAME, sizeof(cap->card));
>> +
>> +	return 0;
>> +}
>> +
>> +static int vidioc_vdec_enum_fmt(struct v4l2_fmtdesc *f, bool is_output)
>> +{
>> +	struct aml_video_fmt *fmt;
>> +	int fmt_size = sizeof(aml_video_formats) / sizeof(struct aml_video_fmt);
>> +	int i = 0, j = 0;
>> +
>> +	for (; i < fmt_size; i++) {
>> +		fmt = &aml_video_formats[i];
>> +		if (is_output && fmt->type != AML_FMT_DEC)
>> +			continue;
>> +		if (!is_output && fmt->type != AML_FMT_FRAME)
>> +			continue;
>> +
>> +		if (j == f->index) {
>> +			f->pixelformat = fmt->fourcc;
>> +			strscpy(f->description, fmt->name,
>> +				sizeof(f->description));
> There is a memory bounded version of this, and these are fixed size char array,
> please use these.
Got it.
>> +			if (strlen(fmt->name) >= sizeof(f->description))
>> +				f->description[sizeof(f->description) - 1] = '\0';
> strcpy() would be the preferred helper for this, no need to fill the leading
> zero liek this, see include/linux/string.h
Ok, it should be more suitable to use strcpy.
>
>> +			return 0;
>> +		}
>> +		++j;
>> +	}
>> +	return -EINVAL;
>> +}
>> +
>> +static struct aml_q_data *aml_vdec_get_qdata_by_type(struct aml_vdec_ctx *ctx,
>> +						     enum v4l2_buf_type type)
>> +{
>> +	if (V4L2_TYPE_IS_OUTPUT(type))
>> +		return &ctx->q_data[AML_Q_DATA_SRC];
>> +
>> +	return &ctx->q_data[AML_Q_DATA_DST];
>> +}
>> +
>> +static struct aml_video_fmt *aml_vdec_get_video_fmt(u32 format)
>> +{
>> +	struct aml_video_fmt *fmt;
>> +	unsigned int k;
>> +
>> +	for (k = 0; k < (sizeof(aml_video_formats) / sizeof(struct aml_video_fmt)); k++) {
> ARRAY_SIZE gain, please apply through the entire patch.
OK, this should be replaced with ARRAR_SIZE.
>> +		fmt = &aml_video_formats[k];
>> +		if (fmt->fourcc == format)
>> +			return fmt;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int aml_vdec_init_dec_inst(struct aml_vdec_ctx *ctx,
>> +				  struct aml_video_fmt *fmt_out)
>> +{
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	int ret = -1;
>> +
>> +	if (!fmt_out)
>> +		return ret;
>> +
>> +	if (fmt_out->codec_type == CODEC_TYPE_FRAME) {
>> +		dev_dbg(&dev->plat_dev->dev, "capture type no need to set\n");
>> +		return 0;
>> +	}
>> +
>> +	ctx->codec_ops = &dev->pvdec_data->codec_ops[fmt_out->codec_type];
>> +	if (ctx->codec_ops->init) {
>> +		ret = ctx->codec_ops->init(ctx);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +	ctx->curr_dec_type = fmt_out->codec_type;
>> +	dev_info(&dev->plat_dev->dev, "%s set curr_dec_type = %d\n", __func__, ctx->curr_dec_type);
> I not sure I want to see a numerical value of an random enum from the code from
> a dev_info(), please use dev_info() with the mindset that if you need to check
> the code to see what it means, its not a dev_info().
Yes, I'll add format strings to this message. It can help others to 
understand what is happening.
>
>> +
>> +	return ret;
>> +}
>> +
>> +static void set_pic_info(struct aml_vdec_ctx *ctx,
>> +			 struct v4l2_pix_format_mplane *pix_mp,
>> +			 enum v4l2_buf_type type)
>> +{
>> +	struct aml_q_data *q_data;
>> +
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, type);
>> +
>> +	ctx->pic_info.colorspace = pix_mp->colorspace;
>> +	ctx->pic_info.ycbcr_enc = pix_mp->ycbcr_enc;
>> +	ctx->pic_info.quantization = pix_mp->quantization;
>> +	ctx->pic_info.xfer_func = pix_mp->xfer_func;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
>> +		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
>> +		ctx->pic_info.output_pix_fmt = pix_mp->pixelformat;
>> +		ctx->pic_info.coded_width = ALIGN(pix_mp->width, 64);
>> +		ctx->pic_info.coded_height = ALIGN(pix_mp->height, 64);
>> +		ctx->pic_info.fb_size[0] =
>> +		    ctx->pic_info.coded_width * ctx->pic_info.coded_height;
>> +		ctx->pic_info.fb_size[1] = ctx->pic_info.fb_size[0] / 2;
>> +		ctx->pic_info.plane_num = 1;
>> +	} else {
>> +		ctx->pic_info.plane_num = q_data->fmt->num_planes;
>> +		ctx->pic_info.cap_pix_fmt = pix_mp->pixelformat;
>> +		q_data->coded_width = ctx->pic_info.coded_width;
>> +		q_data->coded_height = ctx->pic_info.coded_height;
>> +		q_data->sizeimage[0] = ctx->pic_info.fb_size[0];
>> +		q_data->bytesperline[0] = ctx->pic_info.coded_width;
>> +		if (q_data->fmt->num_planes > 1) {
>> +			q_data->sizeimage[1] = ctx->pic_info.fb_size[1];
>> +			q_data->bytesperline[1] = ctx->pic_info.coded_width;
>> +		} else {
>> +			q_data->sizeimage[0] += ctx->pic_info.fb_size[1];
>> +		}
>> +	}
>
> Why don't you simply store the format structure ? width/height alignment is well
> covered in v4l2-common, use the helpers. Re-use your try_fmt implementation for
> this too, and makes sure the changes are reflected to users.
Yes, this seems too complicate and superfluous. I'll simplify this.
> Finally, don't duplicate the data, its all very error prone. You have pic_info
> stored in 3 places now.
OK, I'll fix this problem.
>
>> +}
>> +
>> +static int vidioc_vdec_enum_framesizes(struct file *file, void *priv,
>> +				       struct v4l2_frmsizeenum *fsize)
>> +{
>> +	struct aml_video_fmt *fmt;
>> +	struct aml_vdec_dev *dev = video_drvdata(file);
>> +	u32 max_h, max_w;
>> +
>> +	if (fsize->index != 0)
>> +		return -EINVAL;
>> +
>> +	max_h = dev->pvdec_data->dec_fmt->max_height;
>> +	max_w = dev->pvdec_data->dec_fmt->max_width;
>> +
>> +	fmt = aml_vdec_get_video_fmt(fsize->pixel_format);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> +	fsize->stepwise = fmt->stepwise;
>> +	fsize->stepwise.max_height = max_h;
>> +	fsize->stepwise.max_width = max_w;
> no min ? Normally under 1x1 is not allowed.
The min width x height should be 64 x 64 for S805X2 platform. This 
should be added.
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, struct v4l2_format *f,
>> +			   const struct aml_video_fmt *fmt_mp)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	struct aml_q_data *q_data;
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	u32 max_h, max_w;
>> +	int i;
>> +
>> +	max_h = dev->pvdec_data->dec_fmt->max_height;
>> +	max_w = dev->pvdec_data->dec_fmt->max_width;
>> +
>> +	pix_mp->field = V4L2_FIELD_NONE;
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, f->type);
> I'm not sure it helps anything to use qdata.

It was inherited from the legacy code actually, used for the default 
data storage. I'll try to use some other methods to improve this.

>> +
>> +	pix_mp->height = clamp(pix_mp->height, AML_VDEC_MIN_H, max_h);
>> +	pix_mp->width = clamp(pix_mp->width, AML_VDEC_MIN_H, max_w);
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
>> +		pix_mp->num_planes = q_data->fmt->num_planes;
>> +		pix_mp->pixelformat = q_data->fmt->fourcc;
>> +		pix_mp->plane_fmt[0].bytesperline = q_data->bytesperline[0];
> What would you use bytesperline (stride) for on a bitstrream buffer ? Reset this
> to zero at best.
Yes, this can be reset to 0.
>
>> +		pix_mp->plane_fmt[0].sizeimage = q_data->sizeimage[0];
> Application should be able to chose a size here. Also it make no sense to used
> any cached value. Basically:
>
> 1. If its zero, compute a size, check what other drivers do
> 2. Otherwise keep application provided size, but align it for your HW
Got it! I should not be given a cacahed value. It should be given value 
by the user. I'll fix this.
> In S_FMT, if that call succeed, and the queue isn't busy, you will reset the
> CAPTURE format to keep it matching.
Got it.
>
>> +	} else {
>> +		v4l2_fill_pixfmt_mp(pix_mp, fmt_mp->fourcc, pix_mp->width,
>> +				    pix_mp->height);
> With a proper reset, you will simply copy the fmt you have stored already.
OK, I'll check my code carefully and see if this can be improved.
>
>> +	}
>> +
>> +	for (i = 0; i < pix_mp->num_planes; i++)
>> +		memset(&pix_mp->plane_fmt[i].reserved[0], 0x0,
>> +		       sizeof(pix_mp->plane_fmt[0].reserved));
>> +
>> +	memset(pix_mp->reserved, 0x0, sizeof(pix_mp->reserved));
>> +	pix_mp->flags = 0;
> The core is suppose to take care.
You mean the V4L2 core? Then I will remove this.
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdec_s_fmt(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct aml_q_data *q_data;
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	struct aml_video_fmt *fmt =
>> +	    aml_vdec_get_video_fmt(f->fmt.pix_mp.pixelformat);
>> +
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, f->type);
>> +
>> +	if (fmt)	/* default fmt was set in fopen */
>> +		q_data->fmt = fmt;
> You should not write into the state before try_fmt, and without checking if the
> queues are busy or not. Als, S_FMT(OUTPUT) will reset the capture format to
> match, so it requires both queues to not be active. Check other drivers please.
OK, I wansn't very clear about the behaviour before. I 'll refer to 
other upstreamed drivers and improve this.
>
> I'll stop here, I think you should rework your src/dst format storage. Make use
> of v4l2-common. Since you plan to make this multi-variant, add structure to
> store th#e alignment per-soc/per-codec etc.
Thank you so much for pointing out all these issues ! I'll improve all 
the points you mentioned in the next patch version.
>
> regards,
> Nicolas

Best regards

Zhentao

>> +
>> +	vdec_try_fmt_mp(ctx, f, q_data->fmt);
>> +	set_pic_info(ctx, pix_mp, f->type);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdec_g_fmt(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	struct aml_q_data *q_data;
>> +
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, f->type);
>> +
>> +	pix_mp->field = V4L2_FIELD_NONE;
>> +	pix_mp->colorspace = ctx->pic_info.colorspace;
>> +	pix_mp->ycbcr_enc = ctx->pic_info.ycbcr_enc;
>> +	pix_mp->quantization = ctx->pic_info.quantization;
>> +	pix_mp->xfer_func = ctx->pic_info.xfer_func;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
>> +		pix_mp->height = q_data->coded_height;
>> +		pix_mp->width = q_data->coded_width;
>> +		pix_mp->pixelformat = q_data->fmt->fourcc;
>> +		pix_mp->num_planes = q_data->fmt->num_planes;
>> +		pix_mp->plane_fmt[0].bytesperline = q_data->bytesperline[0];
>> +		pix_mp->plane_fmt[0].sizeimage = q_data->sizeimage[0];
>> +	} else {
>> +		if (ctx->pic_info.coded_width != 0 && ctx->pic_info.coded_height != 0) {
>> +			pix_mp->width = ctx->pic_info.coded_width;
>> +			pix_mp->height = ctx->pic_info.coded_height;
>> +		} else {
>> +			pix_mp->height = q_data->coded_height;
>> +			pix_mp->width = q_data->coded_height;
>> +		}
>> +		v4l2_fill_pixfmt_mp(pix_mp, q_data->fmt->fourcc, pix_mp->width,
>> +				    pix_mp->height);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
>> +				     struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +	const struct aml_video_fmt *fmt_mp;
>> +	struct aml_q_data *q_data;
>> +
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +
>> +	fmt_mp = aml_vdec_get_video_fmt(f->fmt.pix_mp.pixelformat);
>> +	if (!fmt_mp)
>> +		fmt_mp = q_data->fmt;
>> +
>> +	return vdec_try_fmt_mp(ctx, f, fmt_mp);
>> +}
>> +
>> +static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
>> +				     struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +	const struct aml_video_fmt *fmt_mp;
>> +	struct aml_q_data *q_data = aml_vdec_get_qdata_by_type(ctx,
>> +							       V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +
>> +	fmt_mp = aml_vdec_get_video_fmt(f->fmt.pix_mp.pixelformat);
>> +	if (!fmt_mp)
>> +		fmt_mp = q_data->fmt;
>> +
>> +	return vdec_try_fmt_mp(ctx, f, fmt_mp);
>> +}
>> +
>> +static int vidioc_vdec_s_fmt_out_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_s_fmt(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_s_fmt_cap_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_s_fmt(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_g_fmt_out_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_g_fmt(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_g_fmt_cap_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_g_fmt(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_enum_fmt_out_mplane(struct file *file,
>> +					   void *priv, struct v4l2_fmtdesc *f)
>> +{
>> +	return vidioc_vdec_enum_fmt(f, 1);
>> +}
>> +
>> +static int vidioc_vdec_enum_fmt_cap_mplane(struct file *file,
>> +					   void *priv, struct v4l2_fmtdesc *f)
>> +{
>> +	return vidioc_vdec_enum_fmt(f, 0);
>> +}
>> +
>> +const struct v4l2_ioctl_ops aml_vdec_ioctl_ops = {
>> +	.vidioc_querycap = vidioc_vdec_querycap,
>> +	.vidioc_enum_framesizes = vidioc_vdec_enum_framesizes,
>> +
>> +	.vidioc_enum_fmt_vid_cap = vidioc_vdec_enum_fmt_cap_mplane,
>> +	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_cap_mplane,
>> +	.vidioc_s_fmt_vid_cap_mplane = vidioc_vdec_s_fmt_cap_mplane,
>> +	.vidioc_g_fmt_vid_cap_mplane = vidioc_vdec_g_fmt_cap_mplane,
>> +
>> +	.vidioc_enum_fmt_vid_out = vidioc_vdec_enum_fmt_out_mplane,
>> +	.vidioc_try_fmt_vid_out_mplane = vidioc_try_fmt_out_mplane,
>> +	.vidioc_s_fmt_vid_out_mplane = vidioc_vdec_s_fmt_out_mplane,
>> +	.vidioc_g_fmt_vid_out_mplane = vidioc_vdec_g_fmt_out_mplane,
>> +
>> +	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
>> +	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
>> +	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
>> +	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
>> +	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
>> +
>> +	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
>> +
>> +	.vidioc_decoder_cmd = v4l2_m2m_ioctl_stateless_decoder_cmd,
>> +	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_stateless_try_decoder_cmd,
>> +
>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +
>> +	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
>> +};
>> +
>> +static void aml_vdec_release_instance(struct aml_vdec_ctx *ctx)
>> +{
>> +	if (ctx->codec_ops && ctx->codec_ops->exit)
>> +		ctx->codec_ops->exit(ctx);
>> +}
>> +
>> +static int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
>> +				   unsigned int *nbuffers,
>> +				   unsigned int *nplanes,
>> +				   unsigned int sizes[],
>> +				   struct device *alloc_devs[])
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct aml_q_data *q_data;
>> +	unsigned int i;
>> +
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, vq->type);
>> +	if (!q_data) {
>> +		dev_err(&ctx->dev->plat_dev->dev, "not supported vq type\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (*nplanes) {
>> +		if (*nplanes != q_data->fmt->num_planes)
>> +			return -EINVAL;
>> +
>> +		for (i = 0; i < *nplanes; i++) {
>> +			if (sizes[i] < q_data->sizeimage[i]) {
>> +				dev_err(&ctx->dev->plat_dev->dev, "not supported sizeimage\n");
>> +				return -EINVAL;
>> +			}
>> +			alloc_devs[i] = &ctx->dev->plat_dev->dev;
>> +		}
>> +	} else {
>> +		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +			*nplanes = q_data->fmt->num_planes;
>> +		else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +			*nplanes = 1;
>> +
>> +		for (i = 0; i < *nplanes; i++) {
>> +			alloc_devs[i] = &ctx->dev->plat_dev->dev;
>> +			sizes[i] = q_data->sizeimage[i];
>> +		}
>> +	}
>> +
>> +	if (*nplanes) {
>> +		dev_dbg(&ctx->dev->plat_dev->dev, "type: %d, plane: %d, buf cnt: %d, size: [Y: %u, C: %u]\n",
>> +			vq->type, *nplanes, *nbuffers, sizes[0], sizes[1]);
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct aml_q_data *q_data;
>> +	unsigned int sizeimage = 0;
>> +	int i;
>> +
>> +	q_data = aml_vdec_get_qdata_by_type(ctx, vb->type);
>> +	if (!q_data)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < q_data->fmt->num_planes; i++) {
>> +		sizeimage = q_data->sizeimage[i];
>> +		if (vb2_plane_size(vb, i) < sizeimage)
>> +			return -EINVAL;
>> +
>> +		if (V4L2_TYPE_IS_CAPTURE(vb->type))
>> +			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vb2_ops_vdec_buf_init(struct vb2_buffer *vb)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void vb2_ops_vdec_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
>> +
>> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vb2_v4l2);
>> +}
>> +
>> +static void vb2_ops_vdec_buf_finish(struct vb2_buffer *vb)
>> +{
>> +}
>> +
>> +static int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(q);
>> +	struct aml_q_data *q_data;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>> +		ctx->is_output_streamon = 1;
>> +		q_data = aml_vdec_get_qdata_by_type(ctx, q->type);
>> +		if (aml_vdec_init_dec_inst(ctx, q_data->fmt) < 0)
>> +			return -EINVAL;
>> +	} else {
>> +		ctx->is_cap_streamon = 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(q);
>> +	struct vb2_v4l2_buffer *src_buf = NULL, *dst_buf = NULL;
>> +
>> +	aml_vdec_release_instance(ctx);
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>> +		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>> +		ctx->is_output_streamon = 0;
>> +	} else {
>> +		while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx)))
>> +			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>> +		ctx->is_cap_streamon = 0;
>> +	}
>> +}
>> +
>> +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +
>> +	vbuf->field = V4L2_FIELD_NONE;
>> +	return 0;
>> +}
>> +
>> +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +
>> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_handler);
>> +}
>> +
>> +static const struct vb2_ops aml_vdec_vb2_ops = {
>> +	.queue_setup = vb2ops_vdec_queue_setup,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
>> +	.start_streaming = vb2ops_vdec_start_streaming,
>> +	.stop_streaming = vb2ops_vdec_stop_streaming,
>> +
>> +	.buf_init = vb2_ops_vdec_buf_init,
>> +	.buf_prepare = vb2ops_vdec_buf_prepare,
>> +	.buf_out_validate = vb2ops_vdec_out_buf_validate,
>> +	.buf_queue = vb2_ops_vdec_buf_queue,
>> +	.buf_finish = vb2_ops_vdec_buf_finish,
>> +	.buf_request_complete = vb2ops_vdec_buf_request_complete,
>> +};
>> +
>> +int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
>> +			struct vb2_queue *dst_vq)
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	int ret = 0;
>> +
>> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	src_vq->mem_ops = &vb2_dma_contig_memops;
>> +	src_vq->drv_priv = ctx;
>> +	src_vq->ops = &aml_vdec_vb2_ops;
>> +	src_vq->lock = &ctx->v4l2_intf_lock;
>> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	src_vq->supports_requests = true;
>> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	ret = vb2_queue_init(src_vq);
>> +	if (ret) {
>> +		v4l2_info(&dev->v4l2_dev,
>> +			  "Failed to initialize videobuf2 queue(output)");
>> +		return ret;
>> +	}
>> +
>> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	dst_vq->drv_priv = ctx;
>> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>> +	dst_vq->ops = &aml_vdec_vb2_ops;
>> +	dst_vq->lock = &ctx->v4l2_intf_lock;
>> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	ret = vb2_queue_init(dst_vq);
>> +	if (ret) {
>> +		v4l2_info(&dev->v4l2_dev,
>> +			  "Failed to initialize videobuf2 queue(capture)");
>> +		vb2_queue_release(src_vq);
>> +	}
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.h b/drivers/media/platform/amlogic/vdec/aml_vdec.h
>> new file mode 100644
>> index 000000000000..a9ff93f25043
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _AML_VDEC_H_
>> +#define _AML_VDEC_H_
>> +
>> +#include "aml_vdec_drv.h"
>> +
>> +#define DEFAULT_OUT_IDX  0	/* set default output format to h264 type */
>> +#define DEFAULT_CAP_IDX  2	/* set default capture format to NV21 */
>> +
>> +/**
>> + * struct aml_vdec_v4l2_ctrl - helper type to declare supported ctrls
>> + * @codec_type: codec id this control belong to (CODEC_TYPE_H264, etc.)
>> + * @cfg: control configuration
>> + */
>> +struct aml_vdec_v4l2_ctrl {
>> +	unsigned int codec_type;
>> +	struct v4l2_ctrl_config cfg;
>> +};
>> +
>> +extern const struct v4l2_m2m_ops aml_vdec_m2m_ops;
>> +extern const struct v4l2_ioctl_ops aml_vdec_ioctl_ops;
>> +
>> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx);
>> +int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
>> +			struct vb2_queue *dst_vq);
>> +void aml_vdec_set_default_params(struct aml_vdec_ctx *ctx);
>> +#endif
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
>> new file mode 100644
>> index 000000000000..7591e2958f42
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
>> @@ -0,0 +1,239 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "aml_vdec.h"
>> +#include "aml_vdec_hw.h"
>> +#include "aml_vdec_platform.h"
>> +
>> +#define AML_VDEC_DRV_NAME "aml-vdec-drv"
>> +
>> +static int fops_vcodec_open(struct file *file)
>> +{
>> +	struct aml_vdec_dev *dec_dev = video_drvdata(file);
>> +	struct aml_vdec_ctx *ctx = NULL;
>> +	int ret = 0;
>> +
>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&dec_dev->dev_mutex);
>> +	dec_dev->dec_ctx = ctx;
>> +	ctx->dev = dec_dev;
>> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
>> +	file->private_data = &ctx->fh;
>> +	v4l2_fh_add(&ctx->fh, file);
>> +	dec_dev->filp = file;
>> +	mutex_init(&ctx->v4l2_intf_lock);
>> +	init_waitqueue_head(&ctx->queue);
>> +	ctx->int_cond = 0;
>> +
>> +	ctx->m2m_ctx = v4l2_m2m_ctx_init(dec_dev->m2m_dev_dec, ctx,
>> +					 &aml_vdec_queue_init);
>> +	if (IS_ERR(ctx->m2m_ctx)) {
>> +		ret = PTR_ERR((__force void *)ctx->m2m_ctx);
>> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to v4l2_m2m_ctx_init() (%d)", ret);
>> +		goto err_m2m_ctx_init;
>> +	}
>> +
>> +	ctx->fh.m2m_ctx = ctx->m2m_ctx;
>> +	ret = aml_vdec_ctrls_setup(ctx);
>> +	if (ret) {
>> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to init all ctrls (%d)", ret);
>> +		goto err_ctrls_setup;
>> +	}
>> +
>> +	aml_vdec_set_default_params(ctx);
>> +	mutex_unlock(&dec_dev->dev_mutex);
>> +
>> +	return ret;
>> +
>> +err_ctrls_setup:
>> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
>> +err_m2m_ctx_init:
>> +	v4l2_fh_del(&ctx->fh, file);
>> +	v4l2_fh_exit(&ctx->fh);
>> +	kfree(ctx);
>> +	mutex_unlock(&dec_dev->dev_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +static int fops_vcodec_release(struct file *file)
>> +{
>> +	struct aml_vdec_dev *dec_dev = video_drvdata(file);
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	mutex_lock(&dec_dev->dev_mutex);
>> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
>> +	v4l2_fh_del(&ctx->fh, file);
>> +	v4l2_fh_exit(&ctx->fh);
>> +	kfree(ctx);
>> +	mutex_unlock(&dec_dev->dev_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_file_operations aml_vdec_fops = {
>> +	.owner        = THIS_MODULE,
>> +	.open        = fops_vcodec_open,
>> +	.release    = fops_vcodec_release,
>> +	.poll        = v4l2_m2m_fop_poll,
>> +	.unlocked_ioctl    = video_ioctl2,
>> +	.mmap        = v4l2_m2m_fop_mmap,
>> +};
>> +
>> +static const struct video_device dec_dev = {
>> +	.name = "aml_dev_drv",
>> +	.fops = &aml_vdec_fops,
>> +	.ioctl_ops = &aml_vdec_ioctl_ops,
>> +	.release = video_device_release,
>> +	.vfl_dir = VFL_DIR_M2M,
>> +	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>> +};
>> +
>> +static const struct media_device_ops aml_m2m_media_ops = {
>> +	.req_validate = vb2_request_validate,
>> +	.req_queue = v4l2_m2m_request_queue,
>> +};
>> +
>> +static int aml_vdec_drv_probe(struct platform_device *pdev)
>> +{
>> +	struct aml_vdec_dev *dev;
>> +	struct video_device *vfd_dec;
>> +	struct aml_vdec_hw *hw;
>> +	int ret = 0;
>> +
>> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>> +	if (!dev)
>> +		return -ENOMEM;
>> +
>> +	dev->plat_dev = pdev;
>> +	mutex_init(&dev->dev_mutex);
>> +
>> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n");
>> +
>> +	vfd_dec = video_device_alloc();
>> +	if (!vfd_dec) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
>> +		ret = -ENOMEM;
>> +		goto err_device_alloc;
>> +	}
>> +	*vfd_dec = dec_dev;
>> +	vfd_dec->v4l2_dev = &dev->v4l2_dev;
>> +	vfd_dec->lock = &dev->dev_mutex;
>> +	video_set_drvdata(vfd_dec, dev);
>> +	dev->vfd = vfd_dec;
>> +	platform_set_drvdata(pdev, dev);
>> +
>> +	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
>> +	if (!hw) {
>> +		ret = -ENOMEM;
>> +		goto err_dec_mem_init;
>> +	}
>> +	dev->dec_hw = hw;
>> +
>> +	dev->pvdec_data = of_device_get_match_data(&pdev->dev);
>> +	ret = dev->pvdec_data->req_hw_resource(dev);
>> +	if (ret < 0)
>> +		goto err_hw_init;
>> +
>> +	dev->m2m_dev_dec = v4l2_m2m_init(&aml_vdec_m2m_ops);
>> +	if (IS_ERR(dev->m2m_dev_dec)) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
>> +		ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
>> +		goto err_hw_init;
>> +	}
>> +
>> +	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
>> +		goto err_vid_dev_register;
>> +	}
>> +
>> +	dev->mdev.dev = &pdev->dev;
>> +	strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
>> +	media_device_init(&dev->mdev);
>> +	dev->mdev.ops = &aml_m2m_media_ops;
>> +	dev->v4l2_dev.mdev = &dev->mdev;
>> +
>> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
>> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
>> +		goto error_m2m_mc_register;
>> +	}
>> +
>> +	ret = media_device_register(&dev->mdev);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
>> +		goto err_media_dev_register;
>> +	}
>> +	vdec_enable(dev->dec_hw);
>> +	return 0;
>> +
>> +err_media_dev_register:
>> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>> +error_m2m_mc_register:
>> +	media_device_cleanup(&dev->mdev);
>> +err_vid_dev_register:
>> +	v4l2_m2m_release(dev->m2m_dev_dec);
>> +err_hw_init:
>> +	dev->dec_hw = NULL;
>> +err_dec_mem_init:
>> +	video_device_release(vfd_dec);
>> +err_device_alloc:
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +	return ret;
>> +}
>> +
>> +static void aml_vdec_drv_remove(struct platform_device *pdev)
>> +{
>> +	struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
>> +
>> +	vdec_disable(dev->dec_hw);
>> +
>> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
>> +		media_device_unregister(&dev->mdev);
>> +		media_device_cleanup(&dev->mdev);
>> +	}
>> +
>> +	if (dev->m2m_dev_dec)
>> +		v4l2_m2m_release(dev->m2m_dev_dec);
>> +	if (dev->vfd)
>> +		video_unregister_device(dev->vfd);
>> +	if (dev->dec_hw) {
>> +		dev->pvdec_data->destroy_hw_resource(dev);
>> +		dev->dec_hw = NULL;
>> +	}
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +}
>> +
>> +static const struct of_device_id aml_vdec_match[] = {
>> +	{.compatible = "amlogic,s4-vcodec-dec", .data = &aml_vdec_s4_pdata},
>> +	{},
>> +};
>> +
>> +static struct platform_driver aml_vcodec_dec_driver = {
>> +	.probe    = aml_vdec_drv_probe,
>> +	.remove    = aml_vdec_drv_remove,
>> +	.driver    = {
>> +		.name    = AML_VDEC_DRV_NAME,
>> +		.of_match_table = aml_vdec_match,
>> +	},
>> +};
>> +
>> +module_platform_driver(aml_vcodec_dec_driver);
>> +
>> +MODULE_DESCRIPTION("Amlogic V4L2 decoder driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
>> new file mode 100644
>> index 000000000000..18659eef87eb
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.h
>> @@ -0,0 +1,196 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _AML_VDEC_DRV_H_
>> +#define _AML_VDEC_DRV_H_
>> +
>> +#include <linux/platform_device.h>
>> +#include <linux/videodev2.h>
>> +#include <linux/clk.h>
>> +
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-core.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#define AML_VCODEC_MAX_PLANES 3
>> +#define AML_VDEC_MIN_W    64U
>> +#define AML_VDEC_MIN_H    64U
>> +#define AML_VDEC_1080P_MAX_H  1088U
>> +#define AML_VDEC_1080P_MAX_W  1920U
>> +
>> +struct aml_vdec_ctx;
>> +/**
>> + * enum aml_fmt_type - Type of format type
>> + */
>> +enum aml_fmt_type {
>> +	AML_FMT_DEC = 0,
>> +	AML_FMT_FRAME = 1,
>> +};
>> +
>> +/**
>> + * enum aml_codec_type - Type of codec format
>> + */
>> +enum aml_codec_type {
>> +	CODEC_TYPE_H264 = 0,
>> +	CODEC_TYPE_FRAME,
>> +};
>> +
>> +/**
>> + * enum aml_q_type - Type of queue : cap or output
>> + */
>> +enum aml_q_type {
>> +	AML_Q_DATA_SRC = 0,
>> +	AML_Q_DATA_DST = 1,
>> +};
>> +
>> +/**
>> + * struct aml_video_fmt - aml video decoder fmt information
>> + * @fourcc: FourCC code of the format. See V4L2_PIX_FMT_*.
>> + * @type: Curr queue type: capture or output.
>> + * @codec_type: Codec mode related. See aml_codec_type.
>> + * @num_planes: Num planes of the format.
>> + * @name: Name of the format.
>> + * @stepwise: Supported range of frame sizes (only for bitstream formats).
>> + */
>> +struct aml_video_fmt {
>> +	u32 fourcc;
>> +	enum aml_fmt_type type;
>> +	enum aml_codec_type codec_type;
>> +	u32 num_planes;
>> +	const u8 *name;
>> +	struct v4l2_frmsize_stepwise stepwise;
>> +};
>> +
>> +/**
>> + * struct aml_q_data - aml video queue information
>> + * @visible_width: Width for display.
>> + * @visible_height: Height for display.
>> + * @coded_width: Width for decode, which is 64/32 aligned.
>> + * @coded_height: Height for decode, which is 64/32 aligned.
>> + * @filed_flag: Field pic flag.
>> + * @bytesperline: Byte num of each pixel line.
>> + * @sizeimage: Size of frame in bytes.
>> + * @fmt: Format for curr queue. See struct aml_video_fmt.
>> + */
>> +struct aml_q_data {
>> +	u32 visible_width;
>> +	u32 visible_height;
>> +	u32 coded_width;
>> +	u32 coded_height;
>> +	u32 filed_flag;
>> +	u32 bytesperline[AML_VCODEC_MAX_PLANES];
>> +	u32 sizeimage[AML_VCODEC_MAX_PLANES];
>> +	struct aml_video_fmt *fmt;
>> +};
>> +
>> +/**
>> + * struct aml_vdec_dev - driver data
>> + * @plat_dev: Platform device for the current driver.
>> + * @v4l2_dev: V4L2 device to register video devices for.
>> + * @m2m_dev_dec: Mem2mem device associated to this device.
>> + * @vfd: Video_device associated to this device.
>> + * @mdev: Media_device associated to this device.
>> + * @dec_ctx: Decoder context. See struct aml_vdec_ctx.
>> + * @dec_hw: Decoder hardware resources. See struct aml_vdec_hw.
>> + * @pvdec_data: Decoder platform data. See struct aml_dev_platform_data.
>> + * @dev_mutex: video_device lock.
>> + * @filp: v4l2 file handle pointer.
>> + */
>> +struct aml_vdec_dev {
>> +	struct platform_device *plat_dev;
>> +	struct v4l2_device v4l2_dev;
>> +	struct v4l2_m2m_dev *m2m_dev_dec;
>> +	struct video_device *vfd;
>> +	struct media_device mdev;
>> +
>> +	struct aml_vdec_ctx *dec_ctx;
>> +	struct aml_vdec_hw *dec_hw;
>> +	const struct aml_dev_platform_data *pvdec_data;
>> +
>> +	struct mutex dev_mutex;
>> +	struct file *filp;
>> +};
>> +
>> +/**
>> + * struct dec_pic_info - pic information description
>> + * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>> + * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
>> + * @xfer_func: enum v4l2_xfer_func, colorspace transfer function
>> + * @quantization: enum v4l2_quantization, colorspace quantization
>> + * @cap_pix_fmt: Pixel format for capture queue.
>> + * @output_pix_fmt: Pixel format for output queue.
>> + * @coded_width: Width for decode.
>> + * @coded_height: Height for decode.
>> + * @fb_size: Frame buffer size for Y or UV.
>> + * @plane_num: Num for planes for curr format.
>> + */
>> +struct dec_pic_info {
>> +	enum v4l2_colorspace colorspace;
>> +	enum v4l2_ycbcr_encoding ycbcr_enc;
>> +	enum v4l2_xfer_func xfer_func;
>> +	enum v4l2_quantization quantization;
>> +	u32 cap_pix_fmt;
>> +	u32 output_pix_fmt;
>> +	u32 coded_width;
>> +	u32 coded_height;
>> +	u32 fb_size[2];
>> +	u32 plane_num;
>> +};
>> +
>> +/**
>> + * struct aml_vdec_ctx - driver instance context
>> + * @dev: pointer to the aml_vdec_dev of the device.
>> + * @fh: struct v4l2 fh.
>> + * @m2m_ctx: pointer to v4l2_m2m_ctx context.
>> + * @ctrl_handler: V4L2 ctrl handler.
>> + * @v4l2_intf_lock: Mutex lock for v4l2 interface.
>> + * @codec_ops: Codec operation functions. See struct aml_codec_ops.
>> + * @int_cond: Variable used by the waitqueue.
>> + * @queue: Waitqueue to wait for the current decode context finish.
>> + * @q_data: feature supported by the current decoder instance.
>> + * @is_cap_streamon: indicates if the current capture stream is on.
>> + * @is_output_streamon: indicates if the current output stream is on.
>> + * @dos_clk_en: indicates if dos clk is enabled.
>> + * @pic_info: Pic information for curr decoder context. See struct dec_pic_info.
>> + * @curr_dec_type: Current decoder type. (CODEC_TYPE_H264, etc.)
>> + * @codec_priv: Pointer to current decoder instance.
>> + */
>> +struct aml_vdec_ctx {
>> +	struct aml_vdec_dev *dev;
>> +	struct v4l2_fh fh;
>> +	struct v4l2_m2m_ctx *m2m_ctx;
>> +	struct v4l2_ctrl_handler ctrl_handler;
>> +	struct mutex v4l2_intf_lock;
>> +
>> +	const struct aml_codec_ops *codec_ops;
>> +	int int_cond;
>> +	wait_queue_head_t queue;
>> +	struct aml_q_data q_data[2];
>> +
>> +	bool is_cap_streamon;
>> +	bool is_output_streamon;
>> +	bool dos_clk_en;
>> +
>> +	struct dec_pic_info pic_info;
>> +	u32 curr_dec_type;
>> +	void *codec_priv;
>> +};
>> +
>> +static inline struct aml_vdec_ctx *fh_to_dec_ctx(struct file *file)
>> +{
>> +	struct v4l2_fh *file_fh = file_to_v4l2_fh(file);
>> +
>> +	return container_of(file_fh, struct aml_vdec_ctx, fh);
>> +}
>> +
>> +static inline struct aml_vdec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl_handler *ctrl)
>> +{
>> +	return container_of(ctrl, struct aml_vdec_ctx, ctrl_handler);
>> +}
>> +
>> +#endif
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
>> new file mode 100644
>> index 000000000000..1729076de76c
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
>> @@ -0,0 +1,596 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_address.h>
>> +#include <linux/slab.h>
>> +#include <linux/firmware.h>
>> +#include <linux/iopoll.h>
>> +
>> +#include "aml_vdec_drv.h"
>> +#include "aml_vdec_hw.h"
>> +#include "aml_vdec_platform.h"
>> +
>> +#define MHz     (1000000)
>> +#define MC_SIZE (4096 * 16)
>> +
>> +static struct pm_pd_s vdec_domain_data[] = {
>> +	[VDEC_1] = {.name = "vdec", },
>> +	[VDEC_HEVC] = {.name = "hevc", },
>> +};
>> +
>> +u32 read_dos_reg(struct aml_vdec_hw *hw, u32 addr)
>> +{
>> +	u32 ret_val;
>> +
>> +	regmap_read(hw->map[DOS_BUS], addr, &ret_val);
>> +
>> +	return ret_val;
>> +}
>> +
>> +static void dos_reg_write_bits(struct aml_vdec_hw *hw, u32 reg, u32 val, int start, int len)
>> +{
>> +	u32 mask = (((1L << (len)) - 1) << (start));
>> +
>> +	regmap_update_bits(hw->map[DOS_BUS], reg, mask, val);
>> +}
>> +
>> +void dos_enable(struct aml_vdec_hw *hw)
>> +{
>> +	dos_reg_write_bits(hw, DOS_GCLK_EN0, 0x3ff, 0, 10);
>> +
>> +	regmap_write(hw->map[DOS_BUS], GCLK_EN, 0x3ff);
>> +
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 31), 0);
>> +}
>> +
>> +void aml_vdec_reset_core(struct aml_vdec_hw *hw)
>> +{
>> +	unsigned int mask = 0;
>> +
>> +	mask = (1 << 21);
>> +
>> +	regmap_update_bits(hw->map[DMC_BUS], 0x0, mask, 0);
>> +	usleep_range(60, 70);
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0,
>> +		     (1 << 3) | (1 << 4) | (1 << 5) | (1 << 7) |
>> +		     (1 << 8) | (1 << 9));
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>> +	regmap_update_bits(hw->map[DOS_BUS], VDEC_ASSIST_MMC_CTRL1, 1 << 3, 0);
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_MUX_CTRL, 1 << 31, 0);
>> +	regmap_write(hw->map[DOS_BUS], MDEC_EXTIF_CFG1, 0);
>> +
>> +	regmap_update_bits(hw->map[DMC_BUS], 0x0, mask, mask);
>> +}
>> +
>> +void aml_start_vdec_hw(struct aml_vdec_hw *hw)
>> +{
>> +	u32 reg_read_val;
>> +
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_read_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_read_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_read_val);
>> +
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, (1 << 12) | (1 << 11));
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>> +
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_read_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_read_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_read_val);
>> +
>> +	regmap_write(hw->map[DOS_BUS], MPSR, 0x0001);
>> +}
>> +
>> +void aml_stop_vdec_hw(struct aml_vdec_hw *hw)
>> +{
>> +	u32 reg_val = 0;
>> +	int ret;
>> +
>> +	regmap_write(hw->map[DOS_BUS], MPSR, 0);
>> +	regmap_write(hw->map[DOS_BUS], CPSR, 0);
>> +
>> +	ret = read_poll_timeout_atomic(read_dos_reg, reg_val,
>> +				       !(reg_val & 0x8000),
>> +				       10, 100000, true,
>> +				       hw, IMEM_DMA_CTRL);
>> +
>> +	ret = read_poll_timeout_atomic(read_dos_reg, reg_val,
>> +				       !(reg_val & 0x8000),
>> +				       10, 100000, true,
>> +				       hw, LMEM_DMA_CTRL);
>> +
>> +	ret = read_poll_timeout_atomic(read_dos_reg, reg_val,
>> +				       !(reg_val & 0xfff),
>> +				       10, 800000, true,
>> +				       hw, WRRSP_LMEM);
>> +	if (ret)
>> +		dev_err(hw->dev, "%s, ctrl %x, rsp %x, pc %x status %x,%x\n",
>> +			__func__, read_dos_reg(hw, LMEM_DMA_CTRL),
>> +			read_dos_reg(hw, WRRSP_LMEM), read_dos_reg(hw, MPC_E),
>> +			read_dos_reg(hw, AV_SCRATCH_J), read_dos_reg(hw, AV_SCRATCH_9));
>> +
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_val);
>> +
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, (1 << 12) | (1 << 11));
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>> +
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_val);
>> +	regmap_read(hw->map[DOS_BUS], DOS_SW_RESET0, &reg_val);
>> +}
>> +
>> +int load_firmware(struct aml_vdec_hw *hw, const char *path)
>> +{
>> +	const struct firmware *fw;
>> +	struct device *dev = hw->dev;
>> +	static u8 *mc_addr;
>> +	static dma_addr_t mc_addr_map;
>> +	int fw_head_len;
>> +	ulong timeout;
>> +	int ret;
>> +
>> +	ret = request_firmware(&fw, path, dev);
>> +	if (ret < 0) {
>> +		dev_info(dev, "request_firmware %s failed ret %d\n", path, ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (fw->size > MC_SIZE) {
>> +		dev_info(dev, "fw %s oversize\n", path);
>> +		ret = -EINVAL;
>> +		goto release_firmware;
>> +	}
>> +
>> +	fw_head_len = 512;
>> +	mc_addr = dma_alloc_coherent(dev, MC_SIZE, &mc_addr_map, GFP_KERNEL);
>> +	if (!mc_addr) {
>> +		dev_info(dev, "no mem for fw %s\n", path);
>> +		ret = -ENOMEM;
>> +		goto release_firmware;
>> +	}
>> +	memset(mc_addr, 0, MC_SIZE);
>> +	memcpy(mc_addr, ((u8 *)fw->data + fw_head_len),
>> +	       (fw->size - fw_head_len));
>> +
>> +	regmap_write(hw->map[DOS_BUS], MPSR, 0);
>> +	regmap_write(hw->map[DOS_BUS], CPSR, 0);
>> +
>> +	timeout = read_dos_reg(hw, MPSR);
>> +	timeout = read_dos_reg(hw, MPSR);
>> +
>> +	timeout = jiffies + HZ;
>> +
>> +	regmap_write(hw->map[DOS_BUS], IMEM_DMA_ADR, mc_addr_map);
>> +	regmap_write(hw->map[DOS_BUS], IMEM_DMA_COUNT, 0x1000);
>> +	regmap_write(hw->map[DOS_BUS], IMEM_DMA_CTRL, (0x8000 | (7 << 16)));
>> +
>> +	while (read_dos_reg(hw, IMEM_DMA_CTRL) & 0x8000) {
>> +		if (time_before(jiffies, timeout)) {
>> +			schedule();
>> +		} else {
>> +			dev_info(dev, "vdec load mc error\n");
>> +			ret = -EBUSY;
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* Only h264 needs this step */
>> +	if (hw->hw_ops.load_firmware_ex) {
>> +		ret = hw->hw_ops.load_firmware_ex(hw->curr_ctx,
>> +						  mc_addr,
>> +						  (fw->size - fw_head_len));
>> +		if (ret < 0) {
>> +			ret = -EINVAL;
>> +			goto free_dma_mem;
>> +		}
>> +	}
>> +
>> +free_dma_mem:
>> +	dma_free_coherent(dev, MC_SIZE, mc_addr, mc_addr_map);
>> +release_firmware:
>> +	release_firmware(fw);
>> +	return ret;
>> +}
>> +
>> +static int vdec_clock_gate_init(struct aml_vdec_hw *hw)
>> +{
>> +	hw->gates[VDEC].id = "vdec";
>> +	hw->gates[VDEC_MUX].id = "clk_vdec_mux";
>> +	hw->gates[HEVCF_MUX].id = "clk_hevcf_mux";
>> +
>> +	return devm_clk_bulk_get(hw->dev, DOS_CLK_MAX, hw->gates);
>> +}
>> +
>> +static struct clk_bulk_data *vdec_get_clk_by_name(struct aml_vdec_hw *hw,
>> +						  const char *name)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < DOS_CLK_MAX; i++) {
>> +		if (!strcmp(name, hw->gates[i].id)) {
>> +			if (hw->gates[i].clk)
>> +				return &hw->gates[i];
>> +		}
>> +	}
>> +	return NULL;
>> +}
>> +
>> +static int pm_vdec_power_domain_init(struct aml_vdec_hw *hw)
>> +{
>> +	int i, err;
>> +	const struct power_manager_s *pm = hw->pm;
>> +	struct pm_pd_s *pd = pm->pd_data;
>> +
>> +	mutex_init(&hw->pm_mutex);
>> +
>> +	for (i = 0; i < VDEC_MAX; i++) {
>> +		pd[i].dev = dev_pm_domain_attach_by_name(hw->dev, pd[i].name);
>> +		if (IS_ERR_OR_NULL(pd[i].dev)) {
>> +			err = PTR_ERR(pd[i].dev);
>> +			dev_dbg(hw->dev, "Get %s failed, pm-domain: %d\n",
>> +				pd[i].name, err);
>> +			continue;
>> +		}
>> +
>> +		pd[i].link = device_link_add(hw->dev, pd[i].dev,
>> +					     DL_FLAG_PM_RUNTIME |
>> +					     DL_FLAG_STATELESS);
>> +		if (IS_ERR_OR_NULL(pd[i].link)) {
>> +			dev_err(hw->dev, "Adding %s device link failed!\n", pd[i].name);
>> +			return -ENODEV;
>> +		}
>> +
>> +		dev_dbg(hw->dev, "power domain: name: %s, dev: %p, link: %p\n",
>> +			pd[i].name, pd[i].dev, pd[i].link);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void pm_vdec_power_domain_release(struct aml_vdec_hw *hw)
>> +{
>> +	int i;
>> +	const struct power_manager_s *pm = hw->pm;
>> +	struct pm_pd_s *pd = pm->pd_data;
>> +
>> +	for (i = 0; i < VDEC_MAX; i++) {
>> +		if (!IS_ERR_OR_NULL(pd[i].link))
>> +			device_link_del(pd[i].link);
>> +
>> +		if (!IS_ERR_OR_NULL(pd[i].dev))
>> +			dev_pm_domain_detach(pd[i].dev, true);
>> +	}
>> +}
>> +
>> +static void dos_local_config(struct aml_vdec_hw *hw, bool is_on, int id)
>> +{
>> +	if (is_on) {
>> +		usleep_range(20, 100);
>> +
>> +		switch (id) {
>> +		case VDEC_1:
>> +			regmap_write(hw->map[DOS_BUS], DOS_MEM_PD_VDEC, 0);
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0xfffffffc);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_MEM_PD_VDEC, 0);
>> +			break;
>> +		case VDEC_HEVC:
>> +			regmap_write(hw->map[DOS_BUS], DOS_MEM_PD_HEVC, 0);
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0xffffffff);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_MEM_PD_HEVC, 0);
>> +			break;
>> +		default:
>> +			dev_info(hw->dev, "%s on, not found id %d\n", __func__, id);
>> +			break;
>> +		}
>> +	} else {
>> +		switch (id) {
>> +		case VDEC_1:
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0xfffffffc);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_MEM_PD_VDEC, 0xffffffffUL);
>> +			break;
>> +		case VDEC_HEVC:
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0xffffffff);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0);
>> +			usleep_range(20, 100);
>> +			regmap_write(hw->map[DOS_BUS], DOS_MEM_PD_HEVC, 0xffffffffUL);
>> +			break;
>> +		default:
>> +			dev_info(hw->dev, "%s off, not found id %d\n", __func__, id);
>> +			break;
>> +		}
>> +	}
>> +
>> +	dev_dbg(hw->dev, "%s end, id %d, is_on %d\n", __func__, id, is_on);
>> +}
>> +
>> +static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
>> +{
>> +	const struct power_manager_s *pm = hw->pm;
>> +	struct device *dev = pm->pd_data[id].dev;
>> +	struct clk_bulk_data *gate_node;
>> +
>> +	if (id == VDEC_1)
>> +		gate_node = vdec_get_clk_by_name(hw, "clk_vdec_mux");
>> +	else if (id == VDEC_HEVC)
>> +		gate_node = vdec_get_clk_by_name(hw, "clk_hevcf_mux");
>> +
>> +	if (gate_node) {
>> +		clk_prepare_enable(gate_node->clk);
>> +		if (id == VDEC_1) {
>> +			clk_set_rate(gate_node->clk, 499999992);
>> +			dev_dbg(hw->dev, "after set, vdec mux clock is %lu Hz\n",
>> +				clk_get_rate(gate_node->clk));
>> +		}
>> +		dev_dbg(hw->dev, "the %-15s clock on\n", gate_node->id);
>> +	} else {
>> +		dev_info(hw->dev, "clk %d, unreachable\n", id);
>> +	}
>> +
>> +	if (dev) {
>> +		pm_runtime_get_sync(dev);
>> +		dev_dbg(dev, "dev: %p link %p the %-15s power on\n",
>> +			dev, pm->pd_data[id].link, pm->pd_data[id].name);
>> +	}
>> +
>> +	dos_local_config(hw, 1, id);
>> +}
>> +
>> +static void pm_vdec_power_domain_power_off(struct aml_vdec_hw *hw, int id)
>> +{
>> +	const struct power_manager_s *pm = hw->pm;
>> +	struct device *dev = pm->pd_data[id].dev;
>> +	struct clk_bulk_data *gate_node;
>> +
>> +	dos_local_config(hw, 0, id);
>> +
>> +	if (dev) {
>> +		pm_runtime_put_sync(dev);
>> +		dev_dbg(dev, "dev: %p link %p the %-15s power off\n",
>> +			dev, pm->pd_data[id].link, pm->pd_data[id].name);
>> +	}
>> +
>> +	if (id == VDEC_1)
>> +		gate_node = vdec_get_clk_by_name(hw, "clk_vdec_mux");
>> +	else if (id == VDEC_HEVC)
>> +		gate_node = vdec_get_clk_by_name(hw, "clk_hevcf_mux");
>> +
>> +	if (gate_node) {
>> +		clk_disable_unprepare(gate_node->clk);
>> +		dev_dbg(hw->dev, "the %-15s clock off\n", gate_node->id);
>> +	} else {
>> +		dev_info(hw->dev, "clk %d, unreachable\n", id);
>> +	}
>> +}
>> +
>> +static bool pm_vdec_power_domain_power_state(struct aml_vdec_hw *hw, int id)
>> +{
>> +	if (hw->pm->pd_data[id].dev)
>> +		return pm_runtime_active(hw->pm->pd_data[id].dev);
>> +	else
>> +		return false;
>> +}
>> +
>> +static void vdec_poweron(struct aml_vdec_hw *hw, enum vdec_type_e core)
>> +{
>> +	if (core >= VDEC_MAX)
>> +		return;
>> +
>> +	mutex_lock(&hw->pm_mutex);
>> +	if (!hw->pm->pd_data[core].dev)
>> +		goto out;
>> +
>> +	hw->pm->pd_data[core].ref_count++;
>> +	if (hw->pm->pd_data[core].ref_count > 1)
>> +		goto out;
>> +
>> +	if (hw->pm->power_state(hw, core))
>> +		goto out;
>> +
>> +	hw->pm->power_on(hw, core);
>> +
>> +out:
>> +	mutex_unlock(&hw->pm_mutex);
>> +}
>> +
>> +static void vdec_poweroff(struct aml_vdec_hw *hw, enum vdec_type_e core)
>> +{
>> +	if (core >= VDEC_MAX)
>> +		return;
>> +
>> +	mutex_lock(&hw->pm_mutex);
>> +	if (hw->pm->pd_data[core].ref_count == 0)
>> +		goto out;
>> +
>> +	hw->pm->pd_data[core].ref_count--;
>> +	if (hw->pm->pd_data[core].ref_count > 0)
>> +		goto out;
>> +
>> +	hw->pm->power_off(hw, core);
>> +
>> +out:
>> +	mutex_unlock(&hw->pm_mutex);
>> +}
>> +
>> +int vdec_enable(struct aml_vdec_hw *hw)
>> +{
>> +	vdec_poweron(hw, VDEC_1);
>> +
>> +	return 0;
>> +}
>> +
>> +int vdec_disable(struct aml_vdec_hw *hw)
>> +{
>> +	vdec_poweroff(hw, VDEC_1);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct power_manager_s pm[] = {
>> +	[AML_PM_PD] = {
>> +		.pd_data    = vdec_domain_data,
>> +		.init        = pm_vdec_power_domain_init,
>> +		.release    = pm_vdec_power_domain_release,
>> +		.power_on    = pm_vdec_power_domain_power_on,
>> +		.power_off    = pm_vdec_power_domain_power_off,
>> +		.power_state = pm_vdec_power_domain_power_state,
>> +	},
>> +};
>> +
>> +static irqreturn_t vdec_irq_handler(int irq, void *priv)
>> +{
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +	struct aml_vdec_hw *hw = dev->dec_hw;
>> +	irqreturn_t ret;
>> +
>> +	if (hw->hw_ops.irq_handler)
>> +		ret = hw->hw_ops.irq_handler(irq, priv);
>> +
>> +	return ret;
>> +}
>> +
>> +static irqreturn_t vdec_threaded_isr_handler(int irq, void *priv)
>> +{
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +	struct aml_vdec_hw *hw = dev->dec_hw;
>> +	irqreturn_t ret = IRQ_HANDLED;
>> +
>> +	if (hw->hw_ops.irq_threaded_func)
>> +		ret = hw->hw_ops.irq_threaded_func(irq, priv);
>> +
>> +	return ret;
>> +}
>> +
>> +struct aml_vdec_hw *vdec_get_hw(void *priv)
>> +{
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +
>> +	return dev->dec_hw;
>> +}
>> +
>> +static const struct regmap_config dos_regmap_conf = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.max_register = 0x10000,
>> +};
>> +
>> +static const struct regmap_config dmc_regmap_conf = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.max_register = 0x20,
>> +};
>> +
>> +int dev_request_hw_resources(void *priv)
>> +{
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +	struct aml_vdec_hw *hw;
>> +	struct platform_device *pdev;
>> +	void __iomem *reg_base[MAX_REG_BUS];
>> +	struct resource res;
>> +	int i;
>> +	int ret = -1;
>> +
>> +	if (!dev || !dev->dec_hw)
>> +		return -1;
>> +
>> +	pdev = dev->plat_dev;
>> +	hw = dev->dec_hw;
>> +	hw->dev = &pdev->dev;
>> +
>> +	hw->dec_irq = platform_get_irq(pdev, VDEC_IRQ_1);
>> +	if (hw->dec_irq < 0) {
>> +		dev_err(&pdev->dev, "get irq failed\n");
>> +		return hw->dec_irq;
>> +	}
>> +	ret = devm_request_threaded_irq(&pdev->dev, hw->dec_irq, vdec_irq_handler,
>> +					vdec_threaded_isr_handler, IRQF_ONESHOT,
>> +					"vdec-1", dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to install irq %d (%d)",
>> +			hw->dec_irq, ret);
>> +		return -1;
>> +	}
>> +
>> +	for (i = 0; i < MAX_REG_BUS; i++) {
>> +		if (of_address_to_resource(pdev->dev.of_node, i, &res)) {
>> +			dev_err(&pdev->dev, "of_address_to_resource %d failed\n", i);
>> +			return -EINVAL;
>> +		}
>> +		reg_base[i] = devm_ioremap_resource(&pdev->dev, &res);
>> +
>> +		if (IS_ERR(reg_base[i]))
>> +			return PTR_ERR(reg_base[i]);
>> +
>> +		if (i == DOS_BUS) {
>> +			hw->map[i] = devm_regmap_init_mmio(&pdev->dev, reg_base[i],
>> +							   &dos_regmap_conf);
>> +		} else if (i == DMC_BUS) {
>> +			hw->map[i] = devm_regmap_init_mmio(&pdev->dev, reg_base[i],
>> +							   &dmc_regmap_conf);
>> +		}
>> +
>> +		if (IS_ERR(hw->map[i]))
>> +			return PTR_ERR(hw->map[i]);
>> +
>> +		dev_dbg(&pdev->dev, "%s, res start %llx, end %llx, iomap: %p\n",
>> +			__func__, (unsigned long long)res.start,
>> +			(unsigned long long)res.end, reg_base[i]);
>> +	}
>> +	hw->canvas = meson_canvas_get(&pdev->dev);
>> +	if (IS_ERR(&pdev->dev))
>> +		return PTR_ERR(&pdev->dev);
>> +
>> +	hw->pm = &pm[dev->pvdec_data->power_type];
>> +	if (hw->pm->init) {
>> +		ret = hw->pm->init(hw);
>> +		if (ret < 0) {
>> +			dev_err(&pdev->dev, "power mgr init failed!\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = vdec_clock_gate_init(hw);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "clk bulk init failed!\n");
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "##Amlogic hw resource init OK##\n");
>> +
>> +	return 0;
>> +}
>> +
>> +void dev_destroy_hw_resources(void *priv)
>> +{
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +	struct aml_vdec_hw *hw;
>> +
>> +	if (!dev || !dev->dec_hw)
>> +		return;
>> +
>> +	hw = dev->dec_hw;
>> +
>> +	if (hw->pm->release)
>> +		hw->pm->release(hw);
>> +
>> +	dev_dbg(hw->dev, "##Amlogic hw resource release OK##\n");
>> +}
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
>> new file mode 100644
>> index 000000000000..6aac89a6356c
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.h
>> @@ -0,0 +1,158 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _AML_VDEC_HW_H_
>> +#define _AML_VDEC_HW_H_
>> +
>> +#include <linux/module.h>
>> +#include <linux/clk.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/delay.h>
>> +#include <linux/regmap.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/soc/amlogic/meson-canvas.h>
>> +#include "reg_defines.h"
>> +
>> +#define VDEC_FIFO_ALIGN     8
>> +#define VLD_PADDING_SIZE    1024
>> +
>> +/**
>> + * struct aml_vdec_hw_ops - codec mode specific operations for hw
>> + * @load_firmware_ex: Load firmware for current dec specific.
>> + * @irq_handler: mandatory call when the ISR triggers
>> + * @irq_threaded_func: mandatory call for the threaded ISR
>> + * @canvas_alloc: Alloc canvas for curr frame
>> + * @canvas_free: Release canvas.
>> + * @config_canvas: Config for curr frame, such as w/h, Y/UV start addr etc.
>> + */
>> +struct aml_vdec_hw_ops {
>> +	int (*load_firmware_ex)(void *priv, const u8 *data, u32 len);
>> +	irqreturn_t (*irq_handler)(int irq, void *priv);
>> +	irqreturn_t (*irq_threaded_func)(int irq, void *priv);
>> +	int (*canvas_alloc)(u8 *canvas_index);
>> +	void (*canvas_free)(u8 canvas_index);
>> +	void (*config_canvas)(u8 canvas_index,
>> +			      ulong addr, u32 width, u32 height,
>> +			      u32 wrap, u32 blkmode, u32 endian);
>> +};
>> +
>> +/**
>> + * enum vdec_type_e - Type of decoder hardware.
>> + */
>> +enum vdec_type_e {
>> +	VDEC_1 = 0,
>> +	VDEC_HEVC,
>> +	VDEC_MAX,
>> +};
>> +
>> +/**
>> + * enum vdec_irq_num - Definition of the irq.
>> + */
>> +enum vdec_irq_num {
>> +	VDEC_IRQ_0 = 0,
>> +	VDEC_IRQ_1,
>> +	VDEC_IRQ_2,
>> +	VDEC_IRQ_MAX,
>> +};
>> +
>> +/**
>> + * enum vdec_type_e - Type of decoder clock.
>> + */
>> +enum clk_type_e {
>> +	VDEC = 0,
>> +	VDEC_MUX,
>> +	HEVCF_MUX,
>> +	DOS_CLK_MAX,
>> +};
>> +
>> +/**
>> + * enum aml_power_type_e - Type of decoder power.
>> + */
>> +enum aml_power_type_e {
>> +	AML_PM_PD = 0,
>> +};
>> +
>> +/**
>> + * enum mm_bus_e - Type of decoder hardware bus.
>> + */
>> +enum mm_bus_e {
>> +	DOS_BUS = 0,
>> +	DMC_BUS,
>> +	MAX_REG_BUS
>> +};
>> +
>> +/**
>> + * struct pm_pd_s - power domain definition
>> + * @name: Power domain name.
>> + * @dev: Pointer to device structure.
>> + * @mutex: Pointer to device_link structure.
>> + * @ref_count: Curr power domain instance ref count.
>> + */
>> +struct pm_pd_s {
>> +	u8 *name;
>> +	struct device *dev;
>> +	struct device_link *link;
>> +	int ref_count;
>> +};
>> +
>> +/**
>> + * struct aml_vdec_hw - decoder hardware resources definition
>> + * @pdev: Pointer to struct platform_device.
>> + * @dev: Pointer to struct device.
>> + * @regs: Reg base for dos/dmc hardware.
>> + * @pm_mutex: Mutex for pm->pd_data.
>> + * @pm: Pointer to struct power_manager_s.
>> + * @hw_ops: Hardware resource operation functions. See struct aml_vdec_hw_ops.
>> + * @gates: Clk instance used by curr decoder context.
>> + * @dec_irq: Irq registered.
>> + * @curr_ctx: Pointer to curr decoder context.
>> + */
>> +struct aml_vdec_hw {
>> +	struct platform_device *pdev;
>> +	struct device *dev;
>> +	struct regmap *map[MAX_REG_BUS];
>> +	struct mutex pm_mutex;
>> +	struct meson_canvas *canvas;
>> +	const struct power_manager_s *pm;
>> +	struct aml_vdec_hw_ops hw_ops;
>> +	struct clk_bulk_data gates[DOS_CLK_MAX];
>> +	int dec_irq;
>> +	void *curr_ctx;
>> +};
>> +
>> +/**
>> + * struct power_manager_s - Power manager & opertion function
>> + * @pd_data: Pointer to struct pm_pd_s
>> + * @init: Power manager init.
>> + * @release: Power manager release.
>> + * @power_on: Power on for decoder hw.
>> + * @power_off: Power off for decoder hw.
>> + * @power_state: Query the power state.
>> + */
>> +struct power_manager_s {
>> +	struct pm_pd_s *pd_data;
>> +	int (*init)(struct aml_vdec_hw *hw);
>> +	void (*release)(struct aml_vdec_hw *hw);
>> +	void (*power_on)(struct aml_vdec_hw *hw, int id);
>> +	void (*power_off)(struct aml_vdec_hw *hw, int id);
>> +	bool (*power_state)(struct aml_vdec_hw *hw, int id);
>> +};
>> +
>> +int dev_request_hw_resources(void *priv);
>> +void dev_destroy_hw_resources(void *priv);
>> +struct aml_vdec_hw *vdec_get_hw(void *priv);
>> +u32 read_dos_reg(struct aml_vdec_hw *hw, u32 reg_addr);
>> +int vdec_enable(struct aml_vdec_hw *hw);
>> +int vdec_disable(struct aml_vdec_hw *hw);
>> +void dos_enable(struct aml_vdec_hw *hw);
>> +void aml_start_vdec_hw(struct aml_vdec_hw *hw);
>> +void aml_stop_vdec_hw(struct aml_vdec_hw *hw);
>> +int load_firmware(struct aml_vdec_hw *hw, const char *path);
>> +void aml_vdec_reset_core(struct aml_vdec_hw *hw);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
>> new file mode 100644
>> index 000000000000..f1f8ba1f4ff6
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
>> @@ -0,0 +1,37 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include "aml_vdec_platform.h"
>> +#include "aml_vdec_drv.h"
>> +#include "aml_vdec_hw.h"
>> +#include "h264.h"
>> +
>> +#define VIDEO_DEC_H264  "s4_h264_multi.bin"
>> +
>> +const struct aml_codec_ops aml_S4_dec_ops[] = {
>> +	[CODEC_TYPE_H264] = {
>> +		.init = aml_h264_init,
>> +		.exit = aml_h264_exit,
>> +		.run = aml_h264_dec_run,
>> +	},
>> +};
>> +
>> +static const struct aml_video_dec_fmt aml_S4_dec_fmts = {
>> +	.max_height = AML_VDEC_1080P_MAX_H,
>> +	.max_width = AML_VDEC_1080P_MAX_W,
>> +	.align = 32,
>> +	.is_10_bit_support = 0,
>> +};
>> +
>> +const struct aml_dev_platform_data aml_vdec_s4_pdata = {
>> +	.dec_fmt = &aml_S4_dec_fmts,
>> +	.codec_ops = aml_S4_dec_ops,
>> +	.power_type = AML_PM_PD,
>> +	.req_hw_resource = dev_request_hw_resources,
>> +	.destroy_hw_resource = dev_destroy_hw_resources,
>> +	.fw_path = {
>> +		VIDEO_DEC_H264,
>> +	},
>> +};
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.h b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.h
>> new file mode 100644
>> index 000000000000..ff0933f6f074
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef AML_VDEC_PLATFORM_H_
>> +#define AML_VDEC_PLATFORM_H_
>> +
>> +#include <linux/videodev2.h>
>> +
>> +#define MAX_DEC_FORMAT 3
>> +
>> +/**
>> + * struct aml_codec_ops - codec mode specific operations
>> + * @init: Used for decoder initialization.
>> + * @exit: If needed, can be used to undo the .init phase.
>> + * @run: Start a single decoding job. Called from atomic context.
>> + * Caller should ensure that a pair of buffers is ready and the
>> + * hardware is powered on and clk is enabled. Returns zero if OK,
>> + * a negative value in error cases.
>> + */
>> +struct aml_codec_ops {
>> +	int (*init)(void *priv);
>> +	void (*exit)(void *priv);
>> +	int (*run)(void *priv);
>> +};
>> +
>> +/**
>> + * struct aml_video_dec_fmt - codec format required by platform
>> + * @max_height: Max decode frame height of current platform.
>> + * @max_width: Max decode frame width of current platform.
>> + * @align: Align requirement of the current platform.
>> + * @is_10_bit_support: Whether the platform supports 10 bit.
>> + */
>> +struct aml_video_dec_fmt {
>> +	u32 max_height;
>> +	u32 max_width;
>> +	int align;
>> +	int is_10_bit_support;
>> +};
>> +
>> +/**
>> + * struct aml_dev_platform_data - compatible data for each chip.
>> + * @dec_fmt: Support dec format.
>> + * @codec_ops: Codec operation function.
>> + * @req_hw_resource: Operation function to request the hardware resource.
>> + * @destroy_hw_resource: Operation function to release the hardware resource.
>> + * @power_type: Type of power that the current chip need. See aml_power_type_e.
>> + * @fw_path: Path of the firmware.bin.
>> + */
>> +struct aml_dev_platform_data {
>> +	const struct aml_video_dec_fmt *dec_fmt;
>> +	const struct aml_codec_ops *codec_ops;
>> +	int (*req_hw_resource)(void *priv);
>> +	void (*destroy_hw_resource)(void *priv);
>> +	int power_type;
>> +	const char *fw_path[MAX_DEC_FORMAT];
>> +};
>> +
>> +extern const struct aml_dev_platform_data aml_vdec_s4_pdata;
>> +
>> +#endif
>> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/platform/amlogic/vdec/h264.c
>> new file mode 100644
>> index 000000000000..d8619e160a6b
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/h264.c
>> @@ -0,0 +1,1933 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <media/v4l2-h264.h>
>> +#include <linux/vmalloc.h>
>> +#include "aml_vdec.h"
>> +#include "aml_vdec_hw.h"
>> +#include "h264.h"
>> +
>> +#define INVALID_POC 0xffffffff
>> +
>> +#define H264_SLICE_HEADER_DONE		0x1
>> +#define H264_SLICE_DATA_DONE		0x2
>> +
>> +#define H264_MAX_COL_BUF			32
>> +#define H264_MAX_CANVAS_POS			26
>> +
>> +#define DECODER_TIMEOUT_MS			500
>> +
>> +#define COL_BUFFER_MARGIN			2
>> +#define COL_SIZE_FOR_ONE_MB			96
>> +
>> +struct vdec_h264_stateless_ctrl_ref {
>> +	const struct v4l2_ctrl_h264_decode_params *decode;
>> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling;
>> +	const struct v4l2_ctrl_h264_sps *sps;
>> +	const struct v4l2_ctrl_h264_pps *pps;
>> +};
>> +
>> +enum SliceType {
>> +	P_SLICE = 0,
>> +	B_SLICE = 1,
>> +	I_SLICE = 2,
>> +	SP_SLICE = 3,
>> +	SI_SLICE = 4,
>> +	MAX_SLICE_TYPES = 5
>> +};
>> +
>> +/* Used by firmware */
>> +union param {
>> +	struct {
>> +		unsigned short data[RPM_END - RPM_BEGIN];
>> +	} l;
>> +	struct {
>> +		unsigned short dump[DPB_OFFSET];
>> +		unsigned short dpb_base[FRAME_IN_DPB << 3];
>> +
>> +		unsigned short dpb_max_buffer_frame;
>> +		unsigned short actual_dpb_size;
>> +
>> +		unsigned short colocated_buf_status;
>> +
>> +		unsigned short num_forward_short_term_reference_pic;
>> +		unsigned short num_short_term_reference_pic;
>> +		unsigned short num_reference_pic;
>> +
>> +		unsigned short current_dpb_index;
>> +		unsigned short current_decoded_frame_num;
>> +		unsigned short current_reference_frame_num;
>> +
>> +		unsigned short l0_size;
>> +		unsigned short l1_size;
>> +		/**
>> +		 * [6:5] : nal_ref_idc
>> +		 * [4:0] : nal_unit_type
>> +		 */
>> +		unsigned short NAL_info_mmco;
>> +		/**
>> +		 * [1:0] : 00 - top field, 01 - bottom field,
>> +		 *         10 - frame, 11 - mbaff frame
>> +		 */
>> +		unsigned short picture_structure_mmco;
>> +		unsigned short frame_num;
>> +		unsigned short pic_order_cnt_lsb;
>> +
>> +		unsigned short num_ref_idx_l0_active_minus1;
>> +		unsigned short num_ref_idx_l1_active_minus1;
>> +
>> +		unsigned short PrevPicOrderCntLsb;
>> +		unsigned short PreviousFrameNum;
>> +
>> +		/* 32 bits variables */
>> +		unsigned short delta_pic_order_cnt_bottom[2];
>> +		unsigned short delta_pic_order_cnt_0[2];
>> +		unsigned short delta_pic_order_cnt_1[2];
>> +
>> +		unsigned short PrevPicOrderCntMsb[2];
>> +		unsigned short PrevFrameNumOffset[2];
>> +
>> +		unsigned short frame_pic_order_cnt[2];
>> +		unsigned short top_field_pic_order_cnt[2];
>> +		unsigned short bottom_field_pic_order_cnt[2];
>> +
>> +		unsigned short colocated_mv_addr_start[2];
>> +		unsigned short colocated_mv_addr_end[2];
>> +		unsigned short colocated_mv_wr_addr[2];
>> +	} dpb;
>> +	struct {
>> +		unsigned short dump[MMCO_OFFSET];
>> +
>> +		/* array base address for offset_for_ref_frame */
>> +		unsigned short offset_for_ref_frame_base[128];
>> +
>> +		/**
>> +		 * 0 - Index in DPB
>> +		 * 1 - Picture Flag
>> +		 *  [2] : 0 - short term reference,
>> +		 *			1 - long term reference
>> +		 *  [1] : bottom field
>> +		 *  [0] : top field
>> +		 * 2 - Picture Number (short term or long term) low 16 bits
>> +		 * 3 - Picture Number (short term or long term) high 16 bits
>> +		 */
>> +		unsigned short reference_base[128];
>> +
>> +		/* command and parameter, until command is 3 */
>> +		unsigned short l0_reorder_cmd[REORDER_CMD_MAX];
>> +		unsigned short l1_reorder_cmd[REORDER_CMD_MAX];
>> +
>> +		/* command and parameter, until command is 0 */
>> +		unsigned short mmco_cmd[44];
>> +
>> +		unsigned short l0_base[40];
>> +		unsigned short l1_base[40];
>> +	} mmco;
>> +	struct {
>> +		/* from ucode lmem, do not change this struct */
>> +	} p;
>> +};
>> +
>> +struct h264_decode_buf_spec {
>> +	struct v4l2_h264_dpb_entry *dpb;
>> +	u32 canvas_pos;
>> +	u32 dpb_index;
>> +	u32 poc;
>> +	int col_buf_index;
>> +	u8 y_canvas_index;
>> +	u8 u_canvas_index;
>> +	u8 v_canvas_index;
>> +	u8 used;
>> +	u8 long_term_flag;
>> +	dma_addr_t y_dma_addr;
>> +	dma_addr_t c_dma_addr;
>> +};
>> +
>> +#define REORDERING_COMMAND_MAX_SIZE	33
>> +struct slice {
>> +	int frame_num;
>> +	/*modification */
>> +	int slice_type;
>> +	int num_ref_idx_l0;
>> +	int num_ref_idx_l1;
>> +	int first_mb_in_slice;
>> +	int ref_pic_list_reordering_flag[2];
>> +	int modification_of_pic_nums_idc[2][REORDERING_COMMAND_MAX_SIZE];
>> +	int abs_diff_pic_num_minus1[2][REORDERING_COMMAND_MAX_SIZE];
>> +	int long_term_pic_idx[2][REORDERING_COMMAND_MAX_SIZE];
>> +	unsigned char dec_ref_pic_marking_buffer_valid;
>> +};
>> +
>> +struct aml_h264_ctx {
>> +	struct aml_vdec_ctx *v4l2_ctx;
>> +	u8 init_flag;
>> +	u8 new_pic_flag;
>> +	u8 mc_cpu_loaded;
>> +	u8 param_set;
>> +	u8 colocated_buf_num;
>> +	u8 reg_iqidct_control_init_flag;
>> +	u32 reg_iqidct_control;
>> +	u32 reg_vcop_ctrl_reg;
>> +	u32 reg_rv_ai_mb_count;
>> +	u32 vld_dec_control;
>> +	u32 save_avscratch_f;
>> +	u32 seq_info;
>> +	u32 decode_pic_count;
>> +	union param dpb_param;
>> +	u32 dec_status;
>> +	struct slice mslice;
>> +	struct h264_decode_buf_spec curr_spec;
>> +	struct h264_decode_buf_spec ref_list0[V4L2_H264_NUM_DPB_ENTRIES + 1];
>> +	struct h264_decode_buf_spec ref_list1[V4L2_H264_NUM_DPB_ENTRIES + 1];
>> +	struct h264_decode_buf_spec ref_list0_unreordered[V4L2_H264_NUM_DPB_ENTRIES + 1];
>> +	struct h264_decode_buf_spec ref_list1_unreordered[V4L2_H264_NUM_DPB_ENTRIES + 1];
>> +	u8 list_size[2];
>> +	dma_addr_t lmem_phy_addr;
>> +	void *lmem_addr;
>> +	dma_addr_t mc_cpu_paddr;
>> +	void *mc_cpu_vaddr;
>> +	dma_addr_t cma_alloc_addr;
>> +	void *cma_alloc_vaddr;
>> +	dma_addr_t collated_cma_addr;
>> +	dma_addr_t collated_cma_addr_end;
>> +	void *collated_cma_vaddr;
>> +	dma_addr_t workspace_offset;
>> +	void *workspace_vaddr;
>> +	u32 col_buf_alloc_size;
>> +	u32 one_col_buf_size;
>> +	u32 colocated_buf_map;
>> +	int colocated_buf_poc[H264_MAX_COL_BUF];
>> +	int canvas_pos_poc[H264_MAX_CANVAS_POS];
>> +
>> +	u32 frame_width;
>> +	u32 frame_height;
>> +	u32 mb_width;
>> +	u32 mb_height;
>> +	u32 mb_total;
>> +	u32 max_num_ref_frames;
>> +
>> +	struct vdec_h264_stateless_ctrl_ref ctrl_ref;
>> +};
>> +
>> +static inline int get_flag(u32 flag, u32 mask)
>> +{
>> +	return (flag & mask) ? 1 : 0;
>> +}
>> +
>> +static inline void write_lmem(unsigned short *base, u32 offset, u32 value)
>> +{
>> +	base[offset] = value;
>> +}
>> +
>> +static inline uint32_t spec2canvas(struct h264_decode_buf_spec *buf_spec)
>> +{
>> +	return (buf_spec->v_canvas_index << 16) |
>> +		(buf_spec->u_canvas_index << 8) |
>> +		(buf_spec->y_canvas_index << 0);
>> +}
>> +
>> +static struct h264_decode_buf_spec *find_spec_by_dpb_index(struct aml_h264_ctx *h264_ctx, int index,
>> +							   int list)
>> +{
>> +	int i;
>> +	int size;
>> +	struct h264_decode_buf_spec *ref_list;
>> +
>> +	size = h264_ctx->list_size[list];
>> +	if (list == 0)
>> +		ref_list = &h264_ctx->ref_list0[0];
>> +	else
>> +		ref_list = &h264_ctx->ref_list1[0];
>> +
>> +	for (i = 0; i < size; i++) {
>> +		if (index == ref_list[i].dpb_index)
>> +			return &ref_list[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int h264_prepare_input(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +	struct vb2_v4l2_buffer *src;
>> +	struct vb2_buffer *vb;
>> +	dma_addr_t src_dma;
>> +	u32 payload_size;
>> +	int dummy;
>> +
>> +	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +	if (!src) {
>> +		dev_info(hw->dev, "no input buffer available!\n");
>> +		return -1;
>> +	}
>> +	vb = &src->vb2_buf;
>> +	payload_size = vb2_get_plane_payload(vb, 0);
>> +	src_dma = vb2_dma_contig_plane_dma_addr(vb, 0);
>> +
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
>> +	/* reset VLD fifo for all vdec */
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, (1 << 5) | (1 << 4) | (1 << 3));
>> +	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
>> +	regmap_write(hw->map[DOS_BUS], POWER_CTL_VLD, 1 << 4);
>> +
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_START_PTR, src_dma);
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_END_PTR, (src_dma + payload_size));
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CURR_PTR,
>> +		     round_down(src_dma, VDEC_FIFO_ALIGN));
>> +
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 1);
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 2);
>> +
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_RP,
>> +		     round_down(src_dma, VDEC_FIFO_ALIGN));
>> +	dummy = payload_size + VLD_PADDING_SIZE;
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
>> +		     round_down((src_dma + dummy), VDEC_FIFO_ALIGN));
>> +
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 3);
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 2);
>> +
>> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL,
>> +		     (0x11 << 16) | (1 << 10) | (7 << 3));
>> +
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_1, 0x0);
>> +	regmap_write(hw->map[DOS_BUS], H264_DECODE_INFO, (1 << 13));
>> +	regmap_write(hw->map[DOS_BUS], H264_DECODE_SIZE, payload_size);
>> +	regmap_write(hw->map[DOS_BUS], VIFF_BIT_CNT, payload_size * 8);
>> +
>> +	return 0;
>> +}
>> +
>> +static void config_sps_params(struct aml_h264_ctx *h264_ctx,
>> +			      unsigned short *sps_base,
>> +			      const struct v4l2_ctrl_h264_sps *sps)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +	u32 cfg_tmp = 0;
>> +	u32 frame_size;
>> +	u32 offset = 0;
>> +	unsigned short data_tmp[0x100];
>> +	int i, ii;
>> +
>> +	memset(sps_base, 0, 0x100);
>> +
>> +	h264_ctx->frame_width = (sps->pic_width_in_mbs_minus1 + 1) << 4;
>> +	h264_ctx->frame_height = (sps->pic_height_in_map_units_minus1 + 1) << 4;
>> +
>> +	data_tmp[offset] = PARAM_BASE_VAL;
>> +	offset += 2;
>> +
>> +	data_tmp[offset++] = GET_SPS_PROFILE_IDC(sps->profile_idc);
>> +
>> +	data_tmp[offset++] = GET_SPS_SEQ_PARAM_SET_ID(sps->seq_parameter_set_id) |
>> +	    GET_SPS_LEVEL_IDC(sps->level_idc);
>> +
>> +	if (sps->profile_idc >= 100) {
>> +		data_tmp[offset++] = GET_SPS_CHROMA_FORMAT_IDC(sps->chroma_format_idc);
>> +
>> +		data_tmp[offset++] = ((sps->chroma_format_idc ^ 1) << 1);
>> +	}
>> +
>> +	data_tmp[offset++] = GET_SPS_LOG2_MAX_FRAME_NUM(sps->log2_max_frame_num_minus4);
>> +	data_tmp[offset++] = GET_SPS_PIC_ORDER_TYPE(sps->pic_order_cnt_type);
>> +
>> +	if (sps->pic_order_cnt_type == 0) {
>> +		data_tmp[offset++] =
>> +			GET_SPS_PIC_ORDER_CNT_LSB(sps->log2_max_pic_order_cnt_lsb_minus4);
>> +	} else if (sps->pic_order_cnt_type == 1) {
>> +		data_tmp[offset++] =
>> +			get_flag(sps->flags,
>> +				 V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
>> +		data_tmp[offset++] =
>> +			GET_SPS_OFFSET_FOR_NONREF_PIC_LOW(sps->offset_for_non_ref_pic);
>> +		data_tmp[offset++] =
>> +			GET_SPS_OFFSET_FOR_NONREF_PIC_HIGH(sps->offset_for_non_ref_pic);
>> +		data_tmp[offset++] =
>> +			GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_LOW(sps->offset_for_top_to_bottom_field);
>> +		data_tmp[offset++] =
>> +			GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_HIGH(sps->offset_for_top_to_bottom_field);
>> +		data_tmp[offset++] = sps->num_ref_frames_in_pic_order_cnt_cycle;
>> +	}
>> +
>> +	data_tmp[offset++] = GET_SPS_NUM_REF_FRAMES(sps->max_num_ref_frames) |
>> +	    GET_SPS_GAPS_ALLOWED_FLAG(get_flag(sps->flags,
>> +					       V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED));
>> +
>> +	data_tmp[offset++] = GET_SPS_PIC_WIDTH_IN_MBS(sps->pic_width_in_mbs_minus1);
>> +
>> +	data_tmp[offset++] = GET_SPS_PIC_HEIGHT_IN_MBS(sps->pic_height_in_map_units_minus1);
>> +	data_tmp[offset++] =
>> +		GET_SPS_DIRECT_8X8_FLAGS
>> +				(get_flag(sps->flags,
>> +					  V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)) |
>> +		GET_SPS_MB_ADAPTIVE_FRAME_FIELD_FLAGS
>> +				(get_flag(sps->flags,
>> +					  V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)) |
>> +		GET_SPS_FRAME_MBS_ONLY_FLAGS
>> +				(get_flag(sps->flags,
>> +					  V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY));
>> +
>> +	for (i = 0; i < 0x100; i += 4) {
>> +		for (ii = 0; ii < 4; ii++)
>> +			sps_base[i + 3 - ii] = data_tmp[i + ii];
>> +	}
>> +
>> +	frame_size = (sps->pic_width_in_mbs_minus1 + 1) * (sps->pic_height_in_map_units_minus1 + 1);
>> +	cfg_tmp = (get_flag(sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) << 31) |
>> +				(sps->max_num_ref_frames << 24) | (frame_size << 8) |
>> +				(sps->pic_width_in_mbs_minus1 + 1);
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_1, cfg_tmp);
>> +	h264_ctx->seq_info = cfg_tmp;
>> +
>> +	cfg_tmp = 0;
>> +	cfg_tmp = (get_flag(sps->flags, V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE) << 15) |
>> +				(sps->chroma_format_idc);
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_2, cfg_tmp);
>> +
>> +	cfg_tmp = 0;
>> +	cfg_tmp = (sps->max_num_ref_frames << 8) | (sps->level_idc);
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_B, cfg_tmp);
>> +
>> +	cfg_tmp = ((sps->level_idc & 0xff) << 7) |
>> +	    (get_flag(sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) << 2);
>> +	regmap_write(hw->map[DOS_BUS], NAL_SEARCH_CTL,
>> +		     read_dos_reg(hw, NAL_SEARCH_CTL) | cfg_tmp);
>> +
>> +	h264_ctx->mb_width = (sps->pic_width_in_mbs_minus1 + 4) & 0xfffffffc;
>> +	h264_ctx->mb_height = (sps->pic_height_in_map_units_minus1 + 4) & 0xfffffffc;
>> +	h264_ctx->mb_total = h264_ctx->mb_width * h264_ctx->mb_height;
>> +	h264_ctx->max_num_ref_frames = sps->max_num_ref_frames;
>> +}
>> +
>> +static void config_pps_params(struct aml_h264_ctx *h264_ctx,
>> +			      unsigned short *pps_base,
>> +			      const struct v4l2_ctrl_h264_pps *pps)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +	u32 offset = 0;
>> +	unsigned short data_tmp[0x100];
>> +	u32 max_reference_size = V4L2_H264_NUM_DPB_ENTRIES;
>> +	u32 max_list_size;
>> +	int i, ii;
>> +
>> +	memset(pps_base, 0, 0x100);
>> +
>> +	data_tmp[offset++] = PARAM_BASE_VAL;
>> +
>> +	data_tmp[offset++] =
>> +		GET_PPS_PIC_PARAM_SET_ID(pps->pic_parameter_set_id) |
>> +	    GET_PPS_SEQ_PARAM_SET_ID(pps->seq_parameter_set_id) |
>> +	    GET_PPS_ENTROPY_CODING_MODE_FLAG
>> +			(get_flag(pps->flags,
>> +				  V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)) |
>> +	    GET_PPS_PIC_ORDER_PRESENT_FLAG
>> +			(get_flag(pps->flags,
>> +				  V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT));
>> +
>> +	data_tmp[offset++] =
>> +		GET_PPS_WEIGHTED_BIPRED_IDC(pps->weighted_bipred_idc) |
>> +		GET_PPS_WEIGHTED_PRED_FLAG(get_flag(pps->flags,
>> +						    V4L2_H264_PPS_FLAG_WEIGHTED_PRED)) |
>> +		GET_PPS_NUM_IDX_REF_L1_MINUS1(pps->num_ref_idx_l1_default_active_minus1) |
>> +		GET_PPS_NUM_IDX_REF_L0_MINUS1(pps->num_ref_idx_l0_default_active_minus1);
>> +
>> +	data_tmp[offset++] = GET_PPS_INIT_QS_MINUS26(pps->pic_init_qs_minus26) |
>> +	    GET_PPS_INIT_QP_MINUS26(pps->pic_init_qp_minus26);
>> +
>> +	data_tmp[offset] =
>> +	    GET_PPS_CHROMA_QP_INDEX_OFFSET(pps->chroma_qp_index_offset) |
>> +	    GET_PPS_DEBLOCK_FILTER_CTRL_PRESENT_FLAG
>> +				(get_flag(pps->flags,
>> +					  V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)) |
>> +	    GET_PPS_CONSTRAIN_INTRA_PRED_FLAG
>> +				(get_flag(pps->flags,
>> +					  V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)) |
>> +	    GET_PPS_REDUNDANT_PIC_CNT_PRESENT_FLAG
>> +				(get_flag(pps->flags,
>> +					  V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT));
>> +	if (get_flag
>> +	    (pps->flags,
>> +	     V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE |
>> +	     V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
>> +		data_tmp[offset] |= (1 << 11);
>> +	offset++;
>> +
>> +	data_tmp[offset++] =
>> +	    GET_PPS_SCALING_MATRIX_PRESENT_FLAG(get_flag
>> +						(pps->flags,
>> +						 V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)) |
>> +	    GET_PPS_TRANSFORM_8X8_FLAG(get_flag
>> +				       (pps->flags,
>> +					V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE));
>> +
>> +	data_tmp[offset++] =
>> +		GET_PPS_GET_SECOND_CHROMA_QP_OFFSET(pps->second_chroma_qp_index_offset);
>> +
>> +	max_list_size = (pps->num_ref_idx_l1_default_active_minus1 + 1) +
>> +	    (pps->num_ref_idx_l0_default_active_minus1 + 1);
>> +
>> +	h264_ctx->max_num_ref_frames = max_list_size > h264_ctx->max_num_ref_frames ?
>> +						max_list_size : h264_ctx->max_num_ref_frames;
>> +
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_0,
>> +		     ((h264_ctx->max_num_ref_frames + 1) << 24) |
>> +		     (max_reference_size << 16) | (max_reference_size << 8));
>> +
>> +	for (i = 0; i < 0x100; i += 4) {
>> +		for (ii = 0; ii < 4; ii++)
>> +			pps_base[i + 3 - ii] = data_tmp[i + ii];
>> +	}
>> +}
>> +
>> +static void h264_config_params(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
>> +	unsigned short *p_sps_base, *p_pps_base;
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
>> +	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
>> +
>> +	p_sps_base = (unsigned short *)(h264_ctx->workspace_vaddr +
>> +		MEM_SPS_BASE + sps->seq_parameter_set_id * 0x400);
>> +	p_pps_base = (unsigned short *)(h264_ctx->workspace_vaddr +
>> +		MEM_PPS_BASE + pps->pic_parameter_set_id * 0x200);
>> +
>> +	config_sps_params(h264_ctx, p_sps_base, sps);
>> +	config_pps_params(h264_ctx, p_pps_base, pps);
>> +}
>> +
>> +static void config_decode_canvas(struct aml_vdec_hw *hw,
>> +				 struct h264_decode_buf_spec *buf_spec,
>> +				 u32 mb_width, u32 mb_height)
>> +{
>> +	int canvas_alloc_result = 0;
>> +	int blkmode = 0x0;
>> +
>> +	canvas_alloc_result = meson_canvas_alloc(hw->canvas, &buf_spec->y_canvas_index);
>> +	canvas_alloc_result = meson_canvas_alloc(hw->canvas, &buf_spec->u_canvas_index);
>> +	buf_spec->v_canvas_index = buf_spec->u_canvas_index;
>> +
>> +	if (!canvas_alloc_result) {
>> +		/* config y canvas */
>> +		meson_canvas_config(hw->canvas,
>> +				    buf_spec->y_canvas_index, buf_spec->y_dma_addr,
>> +				    mb_width << 4, mb_height << 4,
>> +				    MESON_CANVAS_WRAP_NONE, MESON_CANVAS_BLKMODE_LINEAR,
>> +				    MESON_CANVAS_ENDIAN_SWAP64);
>> +		regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_CANVAS_BLK32,
>> +			     (1 << 11) | /* canvas_blk32_wr */
>> +			     (blkmode << 10) |	/* canvas_blk32 */
>> +			     (1 << 8) |	/* canvas_index_wr */
>> +			     (buf_spec->y_canvas_index << 0)	/* canvas index */
>> +		    );
>> +
>> +		/* config uv canvas */
>> +		meson_canvas_config(hw->canvas,
>> +				    buf_spec->u_canvas_index, buf_spec->c_dma_addr,
>> +				    mb_width << 4, mb_height << 3,
>> +				    MESON_CANVAS_WRAP_NONE, MESON_CANVAS_BLKMODE_LINEAR,
>> +				    MESON_CANVAS_ENDIAN_SWAP64);
>> +		regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_CANVAS_BLK32,
>> +			     (1 << 11) | /* canvas_blk32_wr */
>> +			     (blkmode << 10) |	/* canvas_blk32 */
>> +			     (1 << 8) |	/* canvas_index_wr */
>> +			     (buf_spec->u_canvas_index << 0)	/* canvas index */
>> +		    );
>> +
>> +		regmap_write(hw->map[DOS_BUS], ANC0_CANVAS_ADDR + (buf_spec->canvas_pos << 2),
>> +			     spec2canvas(buf_spec));
>> +	}
>> +}
>> +
>> +static int allocate_colocate_buf(struct aml_h264_ctx *h264_ctx, int poc)
>> +{
>> +	int i;
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +
>> +	for (i = 0; i < h264_ctx->colocated_buf_num; i++) {
>> +		if (((h264_ctx->colocated_buf_map >> i) & 0x1) == 0) {
>> +			h264_ctx->colocated_buf_map |= (1 << i);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (i == h264_ctx->colocated_buf_num)
>> +		return -1;
>> +
>> +	h264_ctx->colocated_buf_poc[i] = poc;
>> +	dev_dbg(&ctx->dev->plat_dev->dev, "%s colocated_buf_index %d poc %d\n", __func__, i,
>> +		h264_ctx->colocated_buf_poc[i]);
>> +
>> +	return i;
>> +}
>> +
>> +static void release_colocate_buf(struct aml_h264_ctx *h264_ctx, int index)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +
>> +	if (index >= 0) {
>> +		if (index >= h264_ctx->colocated_buf_num) {
>> +			dev_dbg
>> +			    (&ctx->dev->plat_dev->dev,
>> +				 "%s error, index %d is bigger than buf count %d\n",
>> +			     __func__, index, h264_ctx->max_num_ref_frames);
>> +		} else {
>> +			if (h264_ctx->colocated_buf_poc[index] != INVALID_POC &&
>> +			    ((h264_ctx->colocated_buf_map >> index) & 0x1) == 0x1) {
>> +				h264_ctx->colocated_buf_map &= (~(1 << index));
>> +				dev_dbg
>> +				    (&ctx->dev->plat_dev->dev,
>> +				     "%s colocated_buf_index %d released poc %d\n",
>> +				     __func__, index,
>> +				     h264_ctx->colocated_buf_poc[index]);
>> +			}
>> +			h264_ctx->colocated_buf_poc[index] = INVALID_POC;
>> +		}
>> +	}
>> +}
>> +
>> +static int get_col_buf_index_by_poc(struct aml_h264_ctx *h264_ctx, int poc)
>> +{
>> +	int idx;
>> +
>> +	for (idx = 0; idx < h264_ctx->colocated_buf_num; idx++) {
>> +		if (h264_ctx->colocated_buf_poc[idx] == poc)
>> +			break;
>> +	}
>> +
>> +	if (idx == h264_ctx->colocated_buf_num)
>> +		idx = -1;
>> +
>> +	return idx;
>> +}
>> +
>> +static int alloc_colocate_cma(struct aml_h264_ctx *h264_ctx,
>> +			      struct aml_vdec_ctx *ctx)
>> +{
>> +	int alloc_size = 0;
>> +	int i;
>> +	struct aml_vdec_hw *hw;
>> +
>> +	if (h264_ctx->collated_cma_vaddr)
>> +		return 0;
>> +
>> +	hw = vdec_get_hw(ctx->dev);
>> +	if (!hw)
>> +		return -1;
>> +
>> +	/* 96 :col buf size for each mb */
>> +	h264_ctx->one_col_buf_size = h264_ctx->mb_total * 96;
>> +	alloc_size = PAGE_ALIGN(h264_ctx->one_col_buf_size *
>> +			(h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN));
>> +	h264_ctx->collated_cma_vaddr = dma_alloc_coherent(hw->dev, alloc_size,
>> +							  &h264_ctx->collated_cma_addr, GFP_KERNEL);
>> +	if (!h264_ctx->collated_cma_vaddr)
>> +		return -ENOMEM;
>> +
>> +	dev_dbg
>> +	    (&ctx->dev->plat_dev->dev,
>> +	    "collated_cma_addr = 0x%llx, one_col_buf_size = %x alloc_size = %x\n",
>> +	     h264_ctx->collated_cma_addr, h264_ctx->one_col_buf_size,
>> +	     alloc_size);
>> +	h264_ctx->collated_cma_addr_end =
>> +	    h264_ctx->collated_cma_addr + alloc_size;
>> +	memset(h264_ctx->collated_cma_vaddr, 0, alloc_size);
>> +	h264_ctx->col_buf_alloc_size = alloc_size;
>> +	h264_ctx->colocated_buf_map = 0;
>> +	h264_ctx->colocated_buf_num = h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN;
>> +
>> +	for (i = 0; i < H264_MAX_COL_BUF; i++)
>> +		h264_ctx->colocated_buf_poc[i] = INVALID_POC;
>> +
>> +	return 0;
>> +}
>> +
>> +static void config_p_reflist(struct aml_h264_ctx *h264_ctx,
>> +			     struct v4l2_h264_reference *v4l2_p0_reflist,
>> +			     u32 list_size)
>> +{
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +	struct v4l2_ctrl_h264_decode_params *decode =
>> +	    (struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
>> +	struct v4l2_h264_dpb_entry *dpb = decode->dpb;
>> +	u8 index;
>> +	int i;
>> +
>> +	for (i = 0; i < list_size; i++) {
>> +		index = v4l2_p0_reflist[i].index;
>> +		h264_ctx->ref_list0[i].used = 1;
>> +		h264_ctx->ref_list0[i].dpb = &dpb[index];
>> +		h264_ctx->ref_list0[i].poc = dpb[index].top_field_order_cnt;
>> +		h264_ctx->ref_list0[i].long_term_flag =
>> +		    dpb[index].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ? true : false;
>> +		h264_ctx->ref_list0[i].dpb_index = index;
>> +	}
>> +	h264_ctx->list_size[0] = i;
>> +}
>> +
>> +static void config_b_reflist(struct aml_h264_ctx *h264_ctx,
>> +			     struct v4l2_h264_reference *v4l2_b0_reflist,
>> +			     struct v4l2_h264_reference *v4l2_b1_reflist,
>> +			     u32 list_size)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +	struct v4l2_ctrl_h264_decode_params *decode =
>> +	    (struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
>> +	struct v4l2_h264_dpb_entry *dpb = decode->dpb;
>> +	struct slice *curr_slice = &h264_ctx->mslice;
>> +	u8 index;
>> +	int i, j;
>> +
>> +	h264_ctx->list_size[0] = curr_slice->num_ref_idx_l0;
>> +	for (i = 0; i < list_size && i < curr_slice->num_ref_idx_l0; i++) {
>> +		index = v4l2_b0_reflist[i].index;
>> +		h264_ctx->ref_list0[i].used = 1;
>> +		h264_ctx->ref_list0[i].dpb = &dpb[index];
>> +		h264_ctx->ref_list0[i].poc = dpb[index].top_field_order_cnt;
>> +		h264_ctx->ref_list0[i].long_term_flag =
>> +		    dpb[index].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ? true : false;
>> +		h264_ctx->ref_list0[i].col_buf_index =
>> +			get_col_buf_index_by_poc(h264_ctx, dpb[index].top_field_order_cnt);
>> +		h264_ctx->ref_list0[i].dpb_index = index;
>> +	}
>> +
>> +	h264_ctx->list_size[1] = curr_slice->num_ref_idx_l1;
>> +	for (j = 0; j < list_size && j < curr_slice->num_ref_idx_l1; j++) {
>> +		index = v4l2_b1_reflist[j].index;
>> +		h264_ctx->ref_list1[j].used = 1;
>> +		h264_ctx->ref_list1[j].dpb = &dpb[index];
>> +		h264_ctx->ref_list1[j].poc = dpb[index].top_field_order_cnt;
>> +		h264_ctx->ref_list1[j].long_term_flag =
>> +		    dpb[index].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ? true : false;
>> +		h264_ctx->ref_list1[j].col_buf_index =
>> +			get_col_buf_index_by_poc(h264_ctx, dpb[index].top_field_order_cnt);
>> +		h264_ctx->ref_list1[j].dpb_index = index;
>> +	}
>> +
>> +	if ((h264_ctx->list_size[1] + h264_ctx->list_size[0]) < list_size)
>> +		dev_info(&ctx->dev->plat_dev->dev, "ref list incorrect list0 %d list0 %d list_size%d\n",
>> +			 h264_ctx->list_size[0], h264_ctx->list_size[1], list_size);
>> +}
>> +
>> +static int poc_is_in_dpb(int poc, const struct v4l2_h264_dpb_entry *dpb)
>> +{
>> +	int i;
>> +	int ret = 0;
>> +
>> +	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>> +		if (poc == dpb[i].top_field_order_cnt) {
>> +			ret = 1;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int get_ref_list_size(struct aml_h264_ctx *h264_ctx, int cur_list)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	unsigned short override_flag = h264_ctx->dpb_param.l.data[REF_IDC_OVERRIDE_FLAG];
>> +	int num_ref_idx_lx_active_minus1;
>> +
>> +	if (cur_list == 0) {
>> +		num_ref_idx_lx_active_minus1 =
>> +			h264_ctx->ctrl_ref.pps->num_ref_idx_l0_default_active_minus1;
>> +		if (override_flag)
>> +			num_ref_idx_lx_active_minus1 =
>> +				h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1;
>> +	} else {
>> +		num_ref_idx_lx_active_minus1 =
>> +			h264_ctx->ctrl_ref.pps->num_ref_idx_l1_default_active_minus1;
>> +	}
>> +	dev_dbg(&ctx->dev->plat_dev->dev, "%s get list %d size %d\n",
>> +		__func__, cur_list, num_ref_idx_lx_active_minus1 + 1);
>> +
>> +	return num_ref_idx_lx_active_minus1 + 1;
>> +}
>> +
>> +static int get_refidx_by_picnum(struct aml_h264_ctx *h264_ctx, int pic_num,
>> +				int curr_list)
>> +{
>> +	int i;
>> +	struct h264_decode_buf_spec *ref_list;
>> +
>> +	if (curr_list == 0)
>> +		ref_list = &h264_ctx->ref_list0[0];
>> +	else
>> +		ref_list = &h264_ctx->ref_list1[0];
>> +
>> +	for (i = 0; ref_list[i].dpb; i++) {
>> +		if (pic_num == ref_list[i].dpb->pic_num)
>> +			return i;
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static struct h264_decode_buf_spec *get_st_refpic_by_num(struct aml_h264_ctx *h264_ctx,
>> +							 int pic_num, int curr_list)
>> +{
>> +	int i;
>> +	struct h264_decode_buf_spec *ref_list;
>> +
>> +	if (curr_list == 0)
>> +		ref_list = &h264_ctx->ref_list0_unreordered[0];
>> +	else
>> +		ref_list = &h264_ctx->ref_list1_unreordered[0];
>> +
>> +	for (i = 0; ref_list[i].dpb; i++) {
>> +		if (pic_num == ref_list[i].dpb->pic_num && ref_list[i].long_term_flag == 0)
>> +			return &ref_list[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct h264_decode_buf_spec *get_lt_refpic_by_num(struct aml_h264_ctx *h264_ctx,
>> +							 int pic_num, int curr_list)
>> +{
>> +	int i;
>> +	struct h264_decode_buf_spec *ref_list;
>> +
>> +	if (curr_list == 0)
>> +		ref_list = &h264_ctx->ref_list0_unreordered[0];
>> +	else
>> +		ref_list = &h264_ctx->ref_list1_unreordered[0];
>> +
>> +	for (i = 0; ref_list[i].dpb; i++) {
>> +		if (pic_num == ref_list[i].dpb->pic_num && ref_list[i].long_term_flag == 1)
>> +			return &ref_list[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void reorder_short_term(struct slice *curr_slice, int cur_list,
>> +			       int pic_num_lx, int *ref_idx_lx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = container_of(curr_slice, struct aml_h264_ctx, mslice);
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	int c_idx, n_idx;
>> +	int num_ref_idx_lx_active;
>> +	struct h264_decode_buf_spec *pic_lx = NULL;
>> +	struct h264_decode_buf_spec *ref_list_reordered;
>> +
>> +	if (cur_list == 0)
>> +		ref_list_reordered = &h264_ctx->ref_list0[0];
>> +	else
>> +		ref_list_reordered = &h264_ctx->ref_list1[0];
>> +
>> +	num_ref_idx_lx_active = get_ref_list_size(h264_ctx, cur_list);
>> +
>> +	/* find short-term ref frame with pic_num is pic_num_lx */
>> +	pic_lx = get_st_refpic_by_num(h264_ctx, pic_num_lx, cur_list);
>> +	if (!pic_lx) {
>> +		dev_dbg(&ctx->dev->plat_dev->dev, "cannot find st pic_lx for %d\n", pic_num_lx);
>> +		return;
>> +	}
>> +
>> +	if (*ref_idx_lx == get_refidx_by_picnum(h264_ctx, pic_num_lx, cur_list)) {
>> +		dev_dbg(&ctx->dev->plat_dev->dev, "no need to move pic lx %d\n", *ref_idx_lx);
>> +		*ref_idx_lx = *ref_idx_lx + 1;
>> +		return;
>> +	}
>> +
>> +	for (c_idx = num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
>> +		memcpy(&ref_list_reordered[c_idx], &ref_list_reordered[c_idx - 1],
>> +		       sizeof(struct h264_decode_buf_spec));
>> +
>> +	memcpy(&ref_list_reordered[*ref_idx_lx], pic_lx, sizeof(struct h264_decode_buf_spec));
>> +	dev_dbg(&ctx->dev->plat_dev->dev, "%s : RefPicListX[%d ] = pic %p pic_num(%d)\n", __func__,
>> +		*ref_idx_lx, pic_lx, ref_list_reordered[*ref_idx_lx].dpb->pic_num);
>> +	*ref_idx_lx = *ref_idx_lx + 1;
>> +
>> +	n_idx = *ref_idx_lx;
>> +	for (c_idx = *ref_idx_lx; c_idx <= num_ref_idx_lx_active; c_idx++) {
>> +		if (ref_list_reordered[c_idx].long_term_flag || !ref_list_reordered[c_idx].dpb ||
>> +		    ref_list_reordered[c_idx].dpb->pic_num != pic_num_lx)
>> +			memcpy(&ref_list_reordered[n_idx++], &ref_list_reordered[c_idx],
>> +			       sizeof(struct h264_decode_buf_spec));
>> +	}
>> +
>> +	h264_ctx->list_size[cur_list] = num_ref_idx_lx_active;
>> +}
>> +
>> +static void reorder_long_term(struct slice *curr_slice, int cur_list,
>> +			      int lt_pic_num, int *ref_idx_lx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = container_of(curr_slice, struct aml_h264_ctx, mslice);
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	int num_ref_idx_lx_active;
>> +	int c_idx, n_idx;
>> +	struct h264_decode_buf_spec *ref_list;
>> +	struct h264_decode_buf_spec *pic_lt = NULL;
>> +
>> +	if (cur_list == 0)
>> +		ref_list = &h264_ctx->ref_list0[0];
>> +	else
>> +		ref_list = &h264_ctx->ref_list1[0];
>> +
>> +	num_ref_idx_lx_active = get_ref_list_size(h264_ctx, cur_list);
>> +
>> +	/* find long-term ref frame with pic_num is lt_pic_num */
>> +	pic_lt = get_lt_refpic_by_num(h264_ctx, lt_pic_num, cur_list);
>> +	if (!pic_lt) {
>> +		dev_dbg(&ctx->dev->plat_dev->dev, "cannot find lt pic_lx for %d\n", lt_pic_num);
>> +		return;
>> +	}
>> +
>> +	if (*ref_idx_lx == get_refidx_by_picnum(h264_ctx, lt_pic_num, cur_list)) {
>> +		dev_dbg(&ctx->dev->plat_dev->dev, "no need to move pic lx %d\n", *ref_idx_lx);
>> +		*ref_idx_lx = *ref_idx_lx + 1;
>> +		return;
>> +	}
>> +
>> +	for (c_idx = num_ref_idx_lx_active; c_idx > *ref_idx_lx; c_idx--)
>> +		memcpy(&ref_list[c_idx], &ref_list[c_idx - 1], sizeof(struct h264_decode_buf_spec));
>> +
>> +	memcpy(&ref_list[*ref_idx_lx], pic_lt, sizeof(struct h264_decode_buf_spec));
>> +	dev_dbg(&ctx->dev->plat_dev->dev, "%s : RefPicListX[%d ] = pic %p pic_num(%d)\n", __func__,
>> +		*ref_idx_lx, pic_lt, ref_list[*ref_idx_lx].dpb->pic_num);
>> +	*ref_idx_lx = *ref_idx_lx + 1;
>> +
>> +	n_idx = *ref_idx_lx;
>> +	/* Pointer dpb is NULL means this is a dummy frame store */
>> +	for (c_idx = *ref_idx_lx; c_idx <= num_ref_idx_lx_active; c_idx++) {
>> +		if (!ref_list[c_idx].long_term_flag || !ref_list[c_idx].dpb ||
>> +		    ref_list[c_idx].dpb->pic_num != lt_pic_num)
>> +			memcpy(&ref_list[n_idx++], &ref_list[c_idx],
>> +			       sizeof(struct h264_decode_buf_spec));
>> +	}
>> +
>> +	h264_ctx->list_size[cur_list] = num_ref_idx_lx_active;
>> +}
>> +
>> +static void get_modification_cmd(unsigned short *reorder_cmd, struct slice *curr_slice, int list)
>> +{
>> +	int i, j, val;
>> +
>> +	val = curr_slice->ref_pic_list_reordering_flag[list];
>> +	if (val) {
>> +		i = 0;
>> +		j = 0;
>> +		do {
>> +			curr_slice->modification_of_pic_nums_idc[list][i] =
>> +				reorder_cmd[j++];
>> +			if (j >= REORDER_CMD_MAX) {
>> +				curr_slice->modification_of_pic_nums_idc[list][i] = 0;
>> +				break;
>> +			}
>> +
>> +			val = curr_slice->modification_of_pic_nums_idc[list][i];
>> +			if (val == 0 || val == 1)
>> +				curr_slice->abs_diff_pic_num_minus1[list][i] = reorder_cmd[j++];
>> +			else if (val == 2)
>> +				curr_slice->long_term_pic_idx[list][i] = reorder_cmd[j++];
>> +
>> +			i++;
>> +
>> +			if (i >= REORDERING_COMMAND_MAX_SIZE) {
>> +				curr_slice->ref_pic_list_reordering_flag[list] = 0;
>> +				break;
>> +			};
>> +			if (j > REORDER_CMD_MAX) {
>> +				curr_slice->ref_pic_list_reordering_flag[list] = 0;
>> +				break;
>> +			};
>> +		} while (val != 3);
>> +	}
>> +}
>> +
>> +static void reorder_pics(struct aml_h264_ctx *h264_ctx, struct slice *curr_slice, int cur_list)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	int *modification_of_pic_nums_idc =
>> +		curr_slice->modification_of_pic_nums_idc[cur_list];
>> +	int *abs_diff_pic_num_minus1 =
>> +		curr_slice->abs_diff_pic_num_minus1[cur_list];
>> +	int *long_term_pic_idx = curr_slice->long_term_pic_idx[cur_list];
>> +	int pic_num_lx_nowarp, pic_num_lx_pred, pic_num_lx;
>> +	int curr_pic_num = curr_slice->frame_num;
>> +	int max_pic_num = 1 << (4 + h264_ctx->ctrl_ref.sps->log2_max_frame_num_minus4);
>> +	int ref_idx_lx = 0;
>> +	int nowarp_tmp = 0;
>> +	int i;
>> +
>> +	pic_num_lx_pred = curr_pic_num;
>> +	for (i = 0; i < REORDERING_COMMAND_MAX_SIZE && modification_of_pic_nums_idc[i] != 3; i++) {
>> +		if (modification_of_pic_nums_idc[i] > 3) {
>> +			dev_info(&ctx->dev->plat_dev->dev, "error, Invalid modification_of_pic_nums_idc command\n");
>> +			break;
>> +		}
>> +
>> +		if (modification_of_pic_nums_idc[i] < 2) {
>> +			if (modification_of_pic_nums_idc[i] == 0) {
>> +				nowarp_tmp = pic_num_lx_pred - (abs_diff_pic_num_minus1[i] + 1);
>> +				pic_num_lx_nowarp = nowarp_tmp + (nowarp_tmp < 0 ? max_pic_num : 0);
>> +			} else if (modification_of_pic_nums_idc[i] == 1) {
>> +				nowarp_tmp = pic_num_lx_pred + (abs_diff_pic_num_minus1[i] + 1);
>> +				pic_num_lx_nowarp = nowarp_tmp -
>> +					(nowarp_tmp > max_pic_num ? max_pic_num : 0);
>> +			}
>> +			pic_num_lx_pred = pic_num_lx_nowarp;
>> +			if (pic_num_lx_nowarp > curr_pic_num)
>> +				pic_num_lx = pic_num_lx_nowarp - max_pic_num;
>> +			else
>> +				pic_num_lx = pic_num_lx_nowarp;
>> +
>> +			reorder_short_term(curr_slice, cur_list, pic_num_lx, &ref_idx_lx);
>> +		} else {
>> +			reorder_long_term(curr_slice, cur_list, long_term_pic_idx[i], &ref_idx_lx);
>> +		}
>> +	}
>> +}
>> +
>> +static void copy_ref_list(struct aml_h264_ctx *h264_ctx, int curr_list)
>> +{
>> +	if (curr_list == 0)
>> +		memcpy(h264_ctx->ref_list0_unreordered, h264_ctx->ref_list0,
>> +		       sizeof(h264_ctx->ref_list0));
>> +	else
>> +		memcpy(h264_ctx->ref_list1_unreordered, h264_ctx->ref_list0,
>> +		       sizeof(h264_ctx->ref_list1));
>> +}
>> +
>> +static void h264_reorder_reflists(struct aml_h264_ctx *h264_ctx)
>> +{
>> +	unsigned short *reorder_cmd;
>> +	struct slice *curr_slice = &h264_ctx->mslice;
>> +
>> +	if (curr_slice->slice_type != I_SLICE && curr_slice->slice_type != SI_SLICE) {
>> +		reorder_cmd = &h264_ctx->dpb_param.mmco.l0_reorder_cmd[0];
>> +		/* 3:parsed by ucode, means no reorder needed */
>> +		if (reorder_cmd[0] != 3)
>> +			curr_slice->ref_pic_list_reordering_flag[0] = 1;
>> +		else
>> +			curr_slice->ref_pic_list_reordering_flag[0] = 0;
>> +
>> +		get_modification_cmd(reorder_cmd, curr_slice, 0);
>> +	}
>> +
>> +	if (curr_slice->slice_type == B_SLICE) {
>> +		reorder_cmd = &h264_ctx->dpb_param.mmco.l1_reorder_cmd[0];
>> +		/* 3:parsed by ucode, means no reorder needed */
>> +		if (reorder_cmd[0] != 3)
>> +			curr_slice->ref_pic_list_reordering_flag[1] = 1;
>> +		else
>> +			curr_slice->ref_pic_list_reordering_flag[1] = 0;
>> +
>> +		get_modification_cmd(reorder_cmd, curr_slice, 1);
>> +	}
>> +
>> +	if (curr_slice->slice_type != I_SLICE &&
>> +	    curr_slice->slice_type != SI_SLICE &&
>> +	    curr_slice->ref_pic_list_reordering_flag[0] != 0) {
>> +		copy_ref_list(h264_ctx, 0);
>> +		reorder_pics(h264_ctx, curr_slice, 0);
>> +	}
>> +
>> +	if (curr_slice->slice_type == B_SLICE && curr_slice->ref_pic_list_reordering_flag[1] != 0) {
>> +		copy_ref_list(h264_ctx, 1);
>> +		reorder_pics(h264_ctx, curr_slice, 1);
>> +	}
>> +}
>> +
>> +static void h264_config_ref_lists(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +	struct v4l2_ctrl_h264_decode_params *decode =
>> +		(struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
>> +	struct v4l2_ctrl_h264_sps *sps = (struct v4l2_ctrl_h264_sps *)ctrls->sps;
>> +	const struct v4l2_h264_dpb_entry *dpb = decode->dpb;
>> +	struct v4l2_h264_reflist_builder builder;
>> +	struct v4l2_h264_reference v4l2_p0_reflist[V4L2_H264_REF_LIST_LEN];
>> +	struct v4l2_h264_reference v4l2_b0_reflist[V4L2_H264_REF_LIST_LEN];
>> +	struct v4l2_h264_reference v4l2_b1_reflist[V4L2_H264_REF_LIST_LEN];
>> +
>> +	if (decode->flags == V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC)
>> +		return;
>> +
>> +	v4l2_h264_init_reflist_builder(&builder, decode, sps, dpb);
>> +	dev_dbg(&ctx->dev->plat_dev->dev, "%s num_valid = %d", __func__, builder.num_valid);
>> +
>> +	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_PFRAME) {
>> +		v4l2_h264_build_p_ref_list(&builder, v4l2_p0_reflist);
>> +		config_p_reflist(h264_ctx, v4l2_p0_reflist, builder.num_valid);
>> +	} else if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BFRAME) {
>> +		v4l2_h264_build_b_ref_lists(&builder, v4l2_b0_reflist, v4l2_b1_reflist);
>> +		config_b_reflist(h264_ctx, v4l2_b0_reflist, v4l2_b1_reflist, builder.num_valid);
>> +	}
>> +}
>> +
>> +static void clear_unused_col_buf(struct aml_h264_ctx *h264_ctx,
>> +				 struct v4l2_ctrl_h264_decode_params *decode)
>> +{
>> +	int i, col_poc;
>> +
>> +	/* flush all col buffers when IDR */
>> +	if (decode->flags == V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) {
>> +		/* 32 : max index of co-locate buffer */
>> +		for (i = 0; i < 32; i++)
>> +			release_colocate_buf(h264_ctx, i);
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < h264_ctx->colocated_buf_num; i++) {
>> +		col_poc = h264_ctx->colocated_buf_poc[i];
>> +		if (col_poc != INVALID_POC && (poc_is_in_dpb(col_poc, decode->dpb) != 1))
>> +			release_colocate_buf(h264_ctx, i);
>> +	}
>> +}
>> +
>> +static void h264_config_decode_spec(struct aml_vdec_hw *hw, struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +	struct v4l2_ctrl_h264_decode_params *decode =
>> +		(struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
>> +	struct h264_decode_buf_spec *buf_spec_l0, *buf_spec_l1;
>> +	struct vb2_buffer *vb;
>> +	struct vb2_v4l2_buffer *vb2_v4l2;
>> +	struct vb2_queue *vq;
>> +	int i;
>> +
>> +	clear_unused_col_buf(h264_ctx, decode);
>> +
>> +	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
>> +	vb = &vb2_v4l2->vb2_buf;
>> +
>> +	h264_ctx->curr_spec.y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
>> +	if (ctx->pic_info.plane_num > 1)
>> +		h264_ctx->curr_spec.c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
>> +	else
>> +		h264_ctx->curr_spec.c_dma_addr =
>> +				h264_ctx->curr_spec.y_dma_addr + ctx->pic_info.fb_size[0];
>> +	h264_ctx->curr_spec.canvas_pos = 0;
>> +	if (decode->nal_ref_idc)
>> +		h264_ctx->curr_spec.col_buf_index =
>> +			allocate_colocate_buf(h264_ctx, decode->top_field_order_cnt);
>> +	else
>> +		h264_ctx->curr_spec.col_buf_index = -1;
>> +	h264_ctx->curr_spec.poc = decode->top_field_order_cnt;
>> +	config_decode_canvas(hw, &h264_ctx->curr_spec, h264_ctx->mb_width, h264_ctx->mb_height);
>> +	h264_ctx->canvas_pos_poc[0] = decode->top_field_order_cnt;
>> +
>> +	h264_config_ref_lists(ctx);
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +
>> +	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>> +		struct v4l2_h264_dpb_entry *dpb = &decode->dpb[i];
>> +
>> +		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
>> +			break;
>> +
>> +		buf_spec_l0 = find_spec_by_dpb_index(h264_ctx, i, 0);
>> +		if (buf_spec_l0) {
>> +			buf_spec_l0->canvas_pos = i + 1;
>> +			vb = vb2_find_buffer(vq, dpb->reference_ts);
>> +			if (!vb) {
>> +				dev_err(&ctx->dev->plat_dev->dev,
>> +					"ref pic for ts %llu lost\n", dpb->reference_ts);
>> +				continue;
>> +			}
>> +
>> +			buf_spec_l0->y_dma_addr =
>> +				vb2_dma_contig_plane_dma_addr(vb, 0);
>> +			if (ctx->pic_info.plane_num > 1)
>> +				buf_spec_l0->c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
>> +			else
>> +				buf_spec_l0->c_dma_addr =
>> +					buf_spec_l0->y_dma_addr + ctx->pic_info.fb_size[0];
>> +			config_decode_canvas(hw, buf_spec_l0,
>> +					     h264_ctx->mb_width, h264_ctx->mb_height);
>> +			if (h264_ctx->canvas_pos_poc[buf_spec_l0->canvas_pos] == INVALID_POC)
>> +				h264_ctx->canvas_pos_poc[buf_spec_l0->canvas_pos] =
>> +					buf_spec_l0->dpb->top_field_order_cnt;
>> +			dev_dbg
>> +			    (&ctx->dev->plat_dev->dev,
>> +			     "config canvas for poc %d canvas %d y_dma_addr 0x%llx\n",
>> +			     buf_spec_l0->dpb->top_field_order_cnt,
>> +			     buf_spec_l0->canvas_pos, buf_spec_l0->y_dma_addr);
>> +		}
>> +
>> +		buf_spec_l1 = find_spec_by_dpb_index(h264_ctx, i, 1);
>> +		if (!buf_spec_l0 && buf_spec_l1) {
>> +			buf_spec_l1->canvas_pos = i + 1;
>> +			vb = vb2_find_buffer(vq, dpb->reference_ts);
>> +			if (!vb) {
>> +				dev_err(&ctx->dev->plat_dev->dev,
>> +					"ref pic for ts %llu lost\n", dpb->reference_ts);
>> +				continue;
>> +			}
>> +
>> +			buf_spec_l1->y_dma_addr =
>> +				vb2_dma_contig_plane_dma_addr(vb, 0);
>> +			if (ctx->pic_info.plane_num > 1)
>> +				buf_spec_l1->c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
>> +			else
>> +				buf_spec_l1->c_dma_addr =
>> +					buf_spec_l1->y_dma_addr + ctx->pic_info.fb_size[0];
>> +			config_decode_canvas(hw, buf_spec_l1, h264_ctx->mb_width,
>> +					     h264_ctx->mb_height);
>> +			if (h264_ctx->canvas_pos_poc[buf_spec_l1->canvas_pos] == INVALID_POC)
>> +				h264_ctx->canvas_pos_poc[buf_spec_l1->canvas_pos] =
>> +					buf_spec_l1->dpb->top_field_order_cnt;
>> +			dev_dbg
>> +			    (&ctx->dev->plat_dev->dev,
>> +			     "config canvas for poc %d canvas %d y_dma_addr 0x%llx\n",
>> +			     buf_spec_l1->dpb->top_field_order_cnt,
>> +			     buf_spec_l1->canvas_pos, buf_spec_l1->y_dma_addr);
>> +		} else if (buf_spec_l0 && buf_spec_l1) {
>> +			memcpy(buf_spec_l1, buf_spec_l0, sizeof(struct h264_decode_buf_spec));
>> +			dev_dbg
>> +				(&ctx->dev->plat_dev->dev,
>> +				 "config canvas for poc %d canvas %d y_dma_addr 0x%llx\n",
>> +				 buf_spec_l1->dpb->top_field_order_cnt,
>> +				 buf_spec_l1->canvas_pos, buf_spec_l1->y_dma_addr);
>> +		}
>> +	}
>> +
>> +	h264_reorder_reflists(h264_ctx);
>> +}
>> +
>> +static int h264_config_decode_buf(struct aml_vdec_hw *hw, struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +	struct v4l2_ctrl_h264_decode_params *decode =
>> +		(struct v4l2_ctrl_h264_decode_params *)ctrls->decode;
>> +	unsigned int canvas_adr;
>> +	unsigned int ref_cfg;
>> +	unsigned int ref_cfg_once = 0;
>> +	struct slice *curr_slice = &h264_ctx->mslice;
>> +	unsigned int type_cfg = 0x3; /* 0x3: frame type */
>> +	unsigned int colocate_adr_offset = 0;
>> +	unsigned int colocate_wr_adr;
>> +	unsigned int info0;
>> +	unsigned int info1;
>> +	unsigned int info2;
>> +	int i, j;
>> +	int h264_buffer_info_data_write_count;
>> +	u8 canvas_pos;
>> +	u8 use_mode_8x8_flag;
>> +	u32 reg_val;
>> +
>> +	regmap_write(hw->map[DOS_BUS], H264_CURRENT_POC_IDX_RESET, 0);
>> +	regmap_write(hw->map[DOS_BUS], H264_CURRENT_POC, decode->top_field_order_cnt);
>> +	regmap_write(hw->map[DOS_BUS], H264_CURRENT_POC, decode->top_field_order_cnt);
>> +	regmap_write(hw->map[DOS_BUS], H264_CURRENT_POC, decode->bottom_field_order_cnt);
>> +	regmap_write(hw->map[DOS_BUS], CURR_CANVAS_CTRL, h264_ctx->curr_spec.canvas_pos << 24);
>> +	regmap_read(hw->map[DOS_BUS], CURR_CANVAS_CTRL, &canvas_adr);
>> +	canvas_adr &= 0xffffff;
>> +	dev_dbg(hw->dev, "canvas_pos = %d canvas_adr 0x%x\n",
>> +		h264_ctx->curr_spec.canvas_pos, canvas_adr);
>> +
>> +	regmap_write(hw->map[DOS_BUS], REC_CANVAS_ADDR, canvas_adr);
>> +	regmap_write(hw->map[DOS_BUS], DBKR_CANVAS_ADDR, canvas_adr);
>> +	regmap_write(hw->map[DOS_BUS], DBKW_CANVAS_ADDR, canvas_adr);
>> +
>> +	regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_INDEX, 16);
>> +	info0 = 0xf480;
>> +	info1 = decode->top_field_order_cnt;
>> +	info2 = decode->bottom_field_order_cnt;
>> +	if (decode->bottom_field_order_cnt < decode->top_field_order_cnt)
>> +		info0 |= 0x100;
>> +
>> +	regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, info0 | 0xf);
>> +	regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, info1);
>> +	regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, info2);
>> +
>> +	for (j = 0; j < V4L2_H264_NUM_DPB_ENTRIES; j++) {
>> +		struct v4l2_h264_dpb_entry *dpb = &decode->dpb[j];
>> +
>> +		info0 = 0;
>> +		info1 = 0;
>> +		info2 = 0;
>> +		if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
>> +			info0 = 0xf480;
>> +			if (dpb->bottom_field_order_cnt < dpb->top_field_order_cnt)
>> +				info0 |= 0x100;
>> +			info1 = dpb->top_field_order_cnt;
>> +			info2 = dpb->bottom_field_order_cnt;
>> +			if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
>> +				info0 |= ((1 << 5) | (1 << 4));
>> +		}
>> +		regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, info0);
>> +		regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, info1);
>> +		regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, info2);
>> +	}
>> +
>> +	regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_INDEX, 0);
>> +	/* when frame width <= 256, Disable DDR_BYTE64_CACHE */
>> +	if (ctx->pic_info.coded_width <= 256) {
>> +		regmap_update_bits(hw->map[DOS_BUS], IQIDCT_CONTROL, (1 << 16), (1 << 16));
>> +		regmap_write(hw->map[DOS_BUS], DCAC_DDR_BYTE64_CTL,
>> +			     (read_dos_reg(hw, DCAC_DDR_BYTE64_CTL) & (~0xf)) | 0xa);
>> +	} else {
>> +		regmap_update_bits(hw->map[DOS_BUS], IQIDCT_CONTROL, (1 << 16), 0);
>> +		regmap_write(hw->map[DOS_BUS], DCAC_DDR_BYTE64_CTL,
>> +			     (read_dos_reg(hw, DCAC_DDR_BYTE64_CTL) & (~0xf)));
>> +	}
>> +
>> +	ref_cfg = 0;
>> +	j = 0;
>> +
>> +	if (h264_ctx->list_size[0] > 0) {
>> +		for (i = 0; i < h264_ctx->list_size[0]; i++) {
>> +			canvas_pos = h264_ctx->ref_list0[i].canvas_pos;
>> +			/* bit 0:3 canvas_pos bit 5:6 frame struct cfg */
>> +			ref_cfg_once = (canvas_pos & 0x1f) | (type_cfg << 5);
>> +			ref_cfg <<= 8;
>> +			ref_cfg |= ref_cfg_once;
>> +			j++;
>> +
>> +			if (j == 4) {
>> +				regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, ref_cfg);
>> +				dev_dbg(hw->dev, "H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
>> +				h264_buffer_info_data_write_count++;
>> +				j = 0;
>> +			}
>> +		}
>> +
>> +		if (j != 0) {
>> +			while (j != 4) {
>> +				ref_cfg <<= 8;
>> +				ref_cfg |= ref_cfg_once;
>> +				j++;
>> +			}
>> +			regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, ref_cfg);
>> +			dev_dbg(hw->dev, "H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
>> +			h264_buffer_info_data_write_count++;
>> +		}
>> +		ref_cfg = (ref_cfg_once << 24) | (ref_cfg_once << 16) |
>> +			(ref_cfg_once << 8) | ref_cfg_once;
>> +		for (j = h264_buffer_info_data_write_count; j < 8; j++)
>> +			regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, ref_cfg);
>> +	}
>> +
>> +	regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_INDEX, 8);
>> +	j = 0;
>> +	ref_cfg = 0;
>> +
>> +	if (h264_ctx->list_size[1] > 0) {
>> +		for (i = 0; i < h264_ctx->list_size[1]; i++) {
>> +			canvas_pos = h264_ctx->ref_list1[i].canvas_pos;
>> +			ref_cfg_once = (canvas_pos & 0x1f) | (type_cfg << 5);
>> +			ref_cfg <<= 8;
>> +			ref_cfg |= ref_cfg_once;
>> +			j++;
>> +
>> +			if (j == 4) {
>> +				regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, ref_cfg);
>> +				dev_dbg(hw->dev, "H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
>> +				j = 0;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (j != 0) {
>> +		while (j != 4) {
>> +			ref_cfg <<= 8;
>> +			ref_cfg |= ref_cfg_once;
>> +			j++;
>> +		}
>> +		dev_dbg(hw->dev, "H264_BUFFER_INFO_DATA: %x\n", ref_cfg);
>> +		regmap_write(hw->map[DOS_BUS], H264_BUFFER_INFO_DATA, ref_cfg);
>> +	}
>> +
>> +	if (get_flag(ctrls->sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
>> +	    get_flag(ctrls->sps->flags, V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE))
>> +		use_mode_8x8_flag = 1;
>> +	else
>> +		use_mode_8x8_flag = 0;
>> +
>> +	read_poll_timeout(read_dos_reg, reg_val,
>> +			  !(reg_val & 0x800),
>> +			  10, 0, true,
>> +			  hw, H264_CO_MB_RW_CTL);
>> +
>> +	/* col buf for curr frame */
>> +	colocate_adr_offset = COL_SIZE_FOR_ONE_MB;
>> +	if (use_mode_8x8_flag)
>> +		colocate_adr_offset >>= 2;
>> +	colocate_adr_offset *= curr_slice->first_mb_in_slice;
>> +
>> +	if (h264_ctx->curr_spec.col_buf_index >= 0 &&
>> +	    h264_ctx->curr_spec.col_buf_index < h264_ctx->colocated_buf_num) {
>> +		colocate_wr_adr = h264_ctx->collated_cma_addr +
>> +			((h264_ctx->one_col_buf_size * h264_ctx->curr_spec.col_buf_index) >>
>> +			(use_mode_8x8_flag ? 2 : 0));
>> +		if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
>> +		    colocate_wr_adr + h264_ctx->one_col_buf_size >
>> +		    h264_ctx->collated_cma_addr_end) {
>> +			dev_err
>> +			    (hw->dev, "Error, colocate buf is not enough, index is %d\n",
>> +			     h264_ctx->curr_spec.col_buf_index);
>> +			return -1;
>> +		}
>> +		regmap_write(hw->map[DOS_BUS], H264_CO_MB_WR_ADDR,
>> +			     (colocate_wr_adr + colocate_adr_offset));
>> +		dev_dbg(hw->dev, "col buffer addr = 0x%x col_buf_index %d\n",
>> +			(colocate_wr_adr + colocate_adr_offset),
>> +			h264_ctx->curr_spec.col_buf_index);
>> +	} else {
>> +		regmap_write(hw->map[DOS_BUS], H264_CO_MB_WR_ADDR, 0xffffffff);
>> +		dev_dbg(hw->dev, "col buffer addr = 0xffffffff\n");
>> +	}
>> +
>> +	if (h264_ctx->list_size[1] > 0) {
>> +		struct h264_decode_buf_spec *colocate_pic = &h264_ctx->ref_list1[0];
>> +		struct h264_decode_buf_spec *curr_pic = &h264_ctx->curr_spec;
>> +		int l10_structure = 2; /* for pic struct == FRAME, default to 2 */
>> +		int cur_colocate_ref_type;
>> +		unsigned int colocate_rd_adr;
>> +		unsigned int colocate_rd_adr_offset = 0;
>> +		unsigned int val;
>> +
>> +		cur_colocate_ref_type =
>> +			(abs(curr_pic->poc - colocate_pic->dpb->top_field_order_cnt) <
>> +			abs(curr_pic->poc - colocate_pic->dpb->bottom_field_order_cnt)) ?
>> +			0 : 1;
>> +		colocate_rd_adr_offset = COL_SIZE_FOR_ONE_MB;
>> +		if (use_mode_8x8_flag)
>> +			colocate_rd_adr_offset >>= 2;
>> +
>> +		colocate_rd_adr_offset *= curr_slice->first_mb_in_slice;
>> +		if (colocate_pic->col_buf_index >= 0 &&
>> +		    colocate_pic->col_buf_index < h264_ctx->colocated_buf_num) {
>> +			colocate_rd_adr = h264_ctx->collated_cma_addr +
>> +				((h264_ctx->one_col_buf_size * colocate_pic->col_buf_index) >>
>> +				(use_mode_8x8_flag ? 2 : 0));
>> +			if (colocate_rd_adr + h264_ctx->one_col_buf_size >
>> +			    h264_ctx->collated_cma_addr_end) {
>> +				dev_err
>> +				    (hw->dev, "Error, colocate rd buf is not enough, index is %d\n",
>> +				     colocate_pic->col_buf_index);
>> +				return -1;
>> +			}
>> +			val  = ((colocate_rd_adr_offset + colocate_rd_adr) >> 3) |
>> +				(cur_colocate_ref_type << 29) |
>> +				(l10_structure << 30);
>> +			regmap_write(hw->map[DOS_BUS], H264_CO_MB_RD_ADDR, val);
>> +		} else {
>> +			dev_err
>> +			    (hw->dev, "Error, reference pic has no colocated buf poc %d\n",
>> +			     curr_pic->poc);
>> +			return -1;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void release_canvas_index(struct aml_vdec_hw *hw,
>> +				 struct h264_decode_buf_spec *buf)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
>> +
>> +	if (h264_ctx->canvas_pos_poc[buf->canvas_pos] == INVALID_POC)
>> +		return;
>> +
>> +	if (buf->y_canvas_index >= 0) {
>> +		meson_canvas_free(hw->canvas, buf->y_canvas_index);
>> +		buf->y_canvas_index = -1;
>> +	}
>> +
>> +	if (buf->u_canvas_index >= 0) {
>> +		meson_canvas_free(hw->canvas, buf->u_canvas_index);
>> +		buf->u_canvas_index = -1;
>> +		buf->v_canvas_index = -1;
>> +	}
>> +	h264_ctx->canvas_pos_poc[buf->canvas_pos] = INVALID_POC;
>> +}
>> +
>> +static void h264_release_decode_spec(struct aml_vdec_hw *hw, struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)hw->curr_ctx;
>> +	int i;
>> +	struct h264_decode_buf_spec *buf;
>> +
>> +	release_canvas_index(hw, &h264_ctx->curr_spec);
>> +
>> +	if (h264_ctx->list_size[0] > 0) {
>> +		for (i = 0; i < h264_ctx->list_size[0]; i++) {
>> +			buf = &h264_ctx->ref_list0[i];
>> +			if (buf->used) {
>> +				buf->dpb = NULL;
>> +				release_canvas_index(hw, buf);
>> +				buf->used = 0;
>> +			}
>> +		}
>> +		h264_ctx->list_size[0] = 0;
>> +	}
>> +
>> +	if (h264_ctx->list_size[1] > 0) {
>> +		for (i = 0; i < h264_ctx->list_size[1]; i++) {
>> +			buf = &h264_ctx->ref_list1[i];
>> +			if (buf->used) {
>> +				buf->dpb = NULL;
>> +				release_canvas_index(hw, buf);
>> +				buf->used = 0;
>> +			}
>> +		}
>> +		h264_ctx->list_size[1] = 0;
>> +	}
>> +}
>> +
>> +static void save_reg_status(struct aml_h264_ctx *h264_ctx)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +
>> +	regmap_read(hw->map[DOS_BUS], IQIDCT_CONTROL, &h264_ctx->reg_iqidct_control);
>> +	h264_ctx->reg_iqidct_control_init_flag = 1;
>> +	regmap_read(hw->map[DOS_BUS], VCOP_CTRL_REG, &h264_ctx->reg_vcop_ctrl_reg);
>> +	regmap_read(hw->map[DOS_BUS], RV_AI_MB_COUNT, &h264_ctx->reg_rv_ai_mb_count);
>> +	regmap_read(hw->map[DOS_BUS], VLD_DECODE_CONTROL, &h264_ctx->vld_dec_control);
>> +}
>> +
>> +static void h264_get_slice_params(struct aml_h264_ctx *h264_ctx)
>> +{
>> +	struct slice *curr_slice = &h264_ctx->mslice;
>> +
>> +	memset(curr_slice, 0, sizeof(struct slice));
>> +	/* parsed by ucode */
>> +	curr_slice->slice_type = h264_ctx->dpb_param.l.data[SLICE_TYPE];
>> +	curr_slice->first_mb_in_slice = h264_ctx->dpb_param.l.data[FIRST_MB_IN_SLICE];
>> +	curr_slice->num_ref_idx_l0 = h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1 + 1;
>> +	curr_slice->num_ref_idx_l1 = h264_ctx->dpb_param.dpb.num_ref_idx_l1_active_minus1 + 1;
>> +	curr_slice->frame_num = h264_ctx->ctrl_ref.decode->frame_num;
>> +}
>> +
>> +static irqreturn_t h264_isr(int irq, void *priv)
>> +{
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +
>> +	regmap_write(dev->dec_hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_CLR_REG, 1);
>> +
>> +	return IRQ_WAKE_THREAD;
>> +}
>> +
>> +static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
>> +{
>> +	u32 dec_status;
>> +	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)dev->dec_hw->curr_ctx;
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)dev->dec_ctx;
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +	unsigned short *p = (unsigned short *)h264_ctx->lmem_addr;
>> +	int i, ii;
>> +
>> +	regmap_read(hw->map[DOS_BUS], DPB_STATUS_REG, &dec_status);
>> +	h264_ctx->dec_status = dec_status;
>> +	dev_dbg
>> +	    (&dev->plat_dev->dev,
>> +		"%s, dec_status 0x%x VIFF_BIT_CNT 0x%x MBY_MBX 0x%x VLD_SHIFT_STATUS 0x%x\n",
>> +	    __func__, dec_status, read_dos_reg(hw, VIFF_BIT_CNT), read_dos_reg(hw, MBY_MBX),
>> +	    read_dos_reg(hw, VLD_SHIFT_STATUS));
>> +
>> +	regmap_read(hw->map[DOS_BUS], DPB_STATUS_REG, &h264_ctx->save_avscratch_f);
>> +
>> +	switch (dec_status) {
>> +	case H264_SLICE_HEADER_DONE:
>> +		for (i = 0; i < 0x400; i += 4)
>> +			for (ii = 0; ii < 4; ii++)
>> +				h264_ctx->dpb_param.l.data[i + ii] = p[i + 3 - ii];
>> +		save_reg_status(h264_ctx);
>> +		h264_get_slice_params(h264_ctx);
>> +		if (h264_ctx->new_pic_flag == 1)
>> +			h264_config_decode_spec(hw, ctx);
>> +
>> +		if (h264_config_decode_buf(hw, ctx) < 0) {
>> +			h264_release_decode_spec(hw, ctx);
>> +			ctx->int_cond = 1;
>> +			wake_up_interruptible(&ctx->queue);
>> +			goto irq_handled;
>> +		}
>> +		if (h264_ctx->new_pic_flag == 1) {
>> +			regmap_write(hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_DECODE_NEWPIC);
>> +			dev_dbg(&dev->plat_dev->dev, "action decode new pic\n");
>> +			h264_ctx->new_pic_flag = 0;
>> +		} else {
>> +			regmap_write(hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_DECODE_SLICE);
>> +			dev_dbg(&dev->plat_dev->dev, "action decode new slice\n");
>> +		}
>> +		break;
>> +	case H264_SLICE_DATA_DONE:
>> +		h264_release_decode_spec(hw, ctx);
>> +		h264_ctx->decode_pic_count++;
>> +		ctx->int_cond = 1;
>> +		wake_up_interruptible(&ctx->queue);
>> +		break;
>> +	default:
>> +		h264_release_decode_spec(hw, ctx);
>> +		ctx->int_cond = 1;
>> +		wake_up_interruptible(&ctx->queue);
>> +		break;
>> +	}
>> +irq_handled:
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int h264_restore_hw_ctx(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx =
>> +		(struct aml_h264_ctx *)ctx->codec_priv;
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +	int i;
>> +
>> +	regmap_write(hw->map[DOS_BUS], POWER_CTL_VLD,
>> +		     (read_dos_reg(hw, POWER_CTL_VLD)
>> +		     | (0 << 10) | (1 << 9) | (1 << 6)));
>> +
>> +	regmap_write(hw->map[DOS_BUS], PSCALE_CTRL, 0);
>> +
>> +	/* clear mailbox interrupt */
>> +	regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_CLR_REG, 1);
>> +
>> +	/* enable mailbox interrupt */
>> +	regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_MASK, 1);
>> +
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 17), (1 << 17));
>> +	if (ctx->q_data[AML_Q_DATA_DST].fmt->fourcc == V4L2_PIX_FMT_NV21 ||
>> +	    ctx->q_data[AML_Q_DATA_DST].fmt->fourcc == V4L2_PIX_FMT_NV21M)
>> +		regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL,
>> +				   (1 << 16), (1 << 16));
>> +	else
>> +		regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 16), 0);
>> +
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL,
>> +			   (0xbf << 24), (0xbf << 24));
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (0xbf << 24), 0);
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, (1 << 31), 0);
>> +
>> +	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_MUX_CTRL, (1 << 31), 0);
>> +	regmap_write(hw->map[DOS_BUS], MDEC_EXTIF_CFG1, 0);
>> +	regmap_write(hw->map[DOS_BUS], MDEC_PIC_DC_THRESH, 0x404038aa);
>> +
>> +	regmap_write(hw->map[DOS_BUS], DPB_STATUS_REG, 0);
>> +
>> +	regmap_write(hw->map[DOS_BUS], LMEM_DUMP_ADR, h264_ctx->lmem_phy_addr);
>> +	regmap_write(hw->map[DOS_BUS], FRAME_COUNTER_REG, h264_ctx->decode_pic_count);
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_8, h264_ctx->workspace_offset);
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_G, h264_ctx->mc_cpu_paddr);
>> +
>> +	regmap_write(hw->map[DOS_BUS], AV_SCRATCH_F,
>> +		     ((h264_ctx->save_avscratch_f & 0xffffffc3) | (1 << 4)));
>> +	regmap_update_bits(hw->map[DOS_BUS], AV_SCRATCH_F, (1 << 6), 0);
>> +
>> +	regmap_write(hw->map[DOS_BUS], MDEC_PIC_DC_THRESH, 0x404038aa);
>> +
>> +	if (h264_ctx->reg_iqidct_control_init_flag == 0)
>> +		regmap_write(hw->map[DOS_BUS], IQIDCT_CONTROL, 0x200);
>> +
>> +	if (h264_ctx->reg_iqidct_control)
>> +		regmap_write(hw->map[DOS_BUS], IQIDCT_CONTROL, h264_ctx->reg_iqidct_control);
>> +
>> +	if (h264_ctx->reg_vcop_ctrl_reg)
>> +		regmap_write(hw->map[DOS_BUS], VCOP_CTRL_REG, h264_ctx->reg_vcop_ctrl_reg);
>> +
>> +	if (h264_ctx->vld_dec_control)
>> +		regmap_write(hw->map[DOS_BUS], VLD_DECODE_CONTROL, h264_ctx->vld_dec_control);
>> +
>> +	dev_dbg
>> +	    (hw->dev,
>> +	     "IQIDCT_CONTROL = 0x%x, VCOP_CTRL_REG 0x%x VLD_DECODE_CONTROL 0x%x\n",
>> +	     read_dos_reg(hw, IQIDCT_CONTROL), read_dos_reg(hw, VCOP_CTRL_REG),
>> +	     read_dos_reg(hw, VLD_DECODE_CONTROL));
>> +
>> +	for (i = 0; i < H264_MAX_CANVAS_POS; i++)
>> +		h264_ctx->canvas_pos_poc[i] = INVALID_POC;
>> +
>> +	return 0;
>> +}
>> +
>> +static void *aml_h264_get_ctrl(struct v4l2_ctrl_handler *hdl, u32 id)
>> +{
>> +	struct v4l2_ctrl *ctrl;
>> +
>> +	ctrl = v4l2_ctrl_find(hdl, id);
>> +	return ctrl ? ctrl->p_cur.p : NULL;
>> +}
>> +
>> +static int aml_h264_get_stateless_ctrl_ref(struct aml_h264_ctx *h264_ctx)
>> +{
>> +	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
>> +	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
>> +
>> +	ctrls->sps =
>> +		(struct v4l2_ctrl_h264_sps *)aml_h264_get_ctrl(&ctx->ctrl_handler,
>> +			V4L2_CID_STATELESS_H264_SPS);
>> +	if (WARN_ON(!ctrls->sps))
>> +		return -EINVAL;
>> +
>> +	ctrls->pps =
>> +		(struct v4l2_ctrl_h264_pps *)aml_h264_get_ctrl(&ctx->ctrl_handler,
>> +			V4L2_CID_STATELESS_H264_PPS);
>> +	if (WARN_ON(!ctrls->pps))
>> +		return -EINVAL;
>> +
>> +	ctrls->decode =
>> +		(struct v4l2_ctrl_h264_decode_params *)aml_h264_get_ctrl(&ctx->ctrl_handler,
>> +			V4L2_CID_STATELESS_H264_DECODE_PARAMS);
>> +	if (WARN_ON(!ctrls->decode))
>> +		return -EINVAL;
>> +
>> +	ctrls->scaling =
>> +		(struct v4l2_ctrl_h264_scaling_matrix *)aml_h264_get_ctrl(&ctx->ctrl_handler,
>> +			V4L2_CID_STATELESS_H264_SCALING_MATRIX);
>> +	if (WARN_ON(!ctrls->scaling))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static void copy_mc_cpu_fw(void *mc_cpu_addr, const u8 *data)
>> +{
>> +	/*header */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_HEADER,
>> +	       data + 0x4000, MC_SWAP_SIZE);
>> +	/*data */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_DATA,
>> +	       data + 0x2000, MC_SWAP_SIZE);
>> +	/*mmco */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MMCO,
>> +	       data + 0x6000, MC_SWAP_SIZE);
>> +	/*list */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_LIST,
>> +	       data + 0x3000, MC_SWAP_SIZE);
>> +	/*slice */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_SLICE,
>> +	       data + 0x5000, MC_SWAP_SIZE);
>> +	/*main */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MAIN, data, 0x2000);
>> +	/*data */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MAIN + 0x2000,
>> +	       data + 0x2000, 0x1000);
>> +	/*slice */
>> +	memcpy((u8 *)mc_cpu_addr + MC_OFFSET_MAIN + 0x3000,
>> +	       data + 0x5000, 0x1000);
>> +}
>> +
>> +static int aml_h264_load_fw_ext(void *priv, const u8 *data, u32 len)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)priv;
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)h264_ctx->v4l2_ctx;
>> +	struct aml_vdec_hw *dec_hw;
>> +
>> +	if (h264_ctx->mc_cpu_loaded)
>> +		return 0;
>> +
>> +	dec_hw = vdec_get_hw(ctx->dev);
>> +	if (!dec_hw)
>> +		return -1;
>> +
>> +	if (len > MC_TOTAL_SIZE) {
>> +		dev_info(dec_hw->dev, "size of mc_cpu_fw id invalid\n");
>> +		return -1;
>> +	}
>> +
>> +	h264_ctx->mc_cpu_vaddr = dma_alloc_coherent(dec_hw->dev, MC_TOTAL_SIZE,
>> +						    &h264_ctx->mc_cpu_paddr,
>> +						    GFP_KERNEL);
>> +	if (!h264_ctx->mc_cpu_vaddr)
>> +		return -ENOMEM;
>> +
>> +	copy_mc_cpu_fw(h264_ctx->mc_cpu_vaddr, data);
>> +
>> +	h264_ctx->mc_cpu_loaded = true;
>> +
>> +	dev_dbg(dec_hw->dev, "h264 mccpu fw loaded\n");
>> +
>> +	return 0;
>> +}
>> +
>> +int aml_h264_init(void *priv)
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
>> +	struct aml_vdec_hw *dec_hw;
>> +	struct aml_h264_ctx *h264_ctx;
>> +	int ret = 0;
>> +
>> +	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
>> +	if (!h264_ctx)
>> +		return -ENOMEM;
>> +
>> +	h264_ctx->v4l2_ctx = ctx;
>> +	dec_hw = vdec_get_hw(ctx->dev);
>> +	if (!dec_hw)
>> +		return -1;
>> +
>> +	h264_ctx->mc_cpu_loaded = false;
>> +	dec_hw->hw_ops.irq_handler = h264_isr;
>> +	dec_hw->hw_ops.irq_threaded_func = h264_threaded_isr_func;
>> +	dec_hw->hw_ops.load_firmware_ex = aml_h264_load_fw_ext;
>> +
>> +	h264_ctx->lmem_addr = dma_alloc_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
>> +						 &h264_ctx->lmem_phy_addr,
>> +						 GFP_KERNEL);
>> +	if (!h264_ctx->lmem_addr) {
>> +		ret = -ENOMEM;
>> +		goto err_alloc_lmem;
>> +	}
>> +
>> +	h264_ctx->cma_alloc_vaddr =
>> +	    dma_alloc_coherent(dec_hw->dev, V_BUF_ADDR_OFFSET,
>> +			       &h264_ctx->cma_alloc_addr, GFP_KERNEL);
>> +	if (!h264_ctx->cma_alloc_vaddr) {
>> +		ret = -ENOMEM;
>> +		goto err_alloc_workspace;
>> +	}
>> +
>> +	h264_ctx->workspace_offset = h264_ctx->cma_alloc_addr + DCAC_READ_MARGIN;
>> +	h264_ctx->workspace_vaddr = h264_ctx->cma_alloc_vaddr + DCAC_READ_MARGIN;
>> +
>> +	ctx->codec_priv = h264_ctx;
>> +	dec_hw->curr_ctx = h264_ctx;
>> +	h264_ctx->col_buf_alloc_size = 0;
>> +	h264_ctx->init_flag = 0;
>> +	h264_ctx->new_pic_flag = 0;
>> +	h264_ctx->param_set = 0;
>> +	h264_ctx->reg_iqidct_control_init_flag = 0;
>> +	h264_ctx->decode_pic_count = 0;
>> +
>> +	return 0;
>> +
>> +err_alloc_workspace:
>> +	dma_free_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
>> +			  h264_ctx->lmem_addr, h264_ctx->lmem_phy_addr);
>> +err_alloc_lmem:
>> +	kfree(h264_ctx);
>> +
>> +	return ret;
>> +}
>> +
>> +void aml_h264_exit(void *priv)
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
>> +	struct aml_vdec_hw *dec_hw;
>> +
>> +	if (!h264_ctx) {
>> +		dev_info(&ctx->dev->plat_dev->dev, "h264 decoder is already destroyed or not created!\n");
>> +		return;
>> +	}
>> +	dec_hw = vdec_get_hw(ctx->dev);
>> +	h264_ctx->param_set = 0;
>> +
>> +	if (ctx->dos_clk_en)
>> +		aml_stop_vdec_hw(dec_hw);
>> +
>> +	if (h264_ctx->collated_cma_vaddr) {
>> +		dma_free_coherent(dec_hw->dev, h264_ctx->col_buf_alloc_size,
>> +				  h264_ctx->collated_cma_vaddr,
>> +				  h264_ctx->collated_cma_addr);
>> +		h264_ctx->col_buf_alloc_size = 0;
>> +	}
>> +
>> +	if (h264_ctx->mc_cpu_vaddr) {
>> +		dma_free_coherent(dec_hw->dev, MC_TOTAL_SIZE,
>> +				  h264_ctx->mc_cpu_vaddr,
>> +				  h264_ctx->mc_cpu_paddr);
>> +		h264_ctx->mc_cpu_loaded = false;
>> +	}
>> +
>> +	if (h264_ctx->lmem_addr)
>> +		dma_free_coherent(dec_hw->dev, LMEM_DUMP_SIZE,
>> +				  h264_ctx->lmem_addr, h264_ctx->lmem_phy_addr);
>> +
>> +	if (h264_ctx->cma_alloc_vaddr)
>> +		dma_free_coherent(dec_hw->dev, V_BUF_ADDR_OFFSET,
>> +				  h264_ctx->cma_alloc_vaddr,
>> +				  h264_ctx->cma_alloc_addr);
>> +
>> +	kfree(ctx->codec_priv);
>> +	dec_hw->curr_ctx = NULL;
>> +	ctx->codec_priv = NULL;
>> +}
>> +
>> +static void config_decode_mode(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
>> +	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
>> +
>> +	regmap_write(hw->map[DOS_BUS], H264_DECODE_MODE, 0x1); /*decode mode framebase*/
>> +	regmap_write(hw->map[DOS_BUS], HEAD_PADDING_REG, 0);
>> +	regmap_write(hw->map[DOS_BUS], H264_DECODE_SEQINFO, h264_ctx->seq_info);
>> +	regmap_write(hw->map[DOS_BUS], INIT_FLAG_REG, 1);
>> +}
>> +
>> +int aml_h264_dec_run(void *priv)
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
>> +	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)ctx->codec_priv;
>> +	struct aml_vdec_hw *dec_hw = vdec_get_hw(ctx->dev);
>> +	int ret = -1;
>> +	int i;
>> +
>> +	ret = aml_h264_get_stateless_ctrl_ref(h264_ctx);
>> +	if (ret < 0) {
>> +		dev_err(&ctx->dev->plat_dev->dev, "not ctrl ref for h264 decoder\n");
>> +		return ret;
>> +	}
>> +
>> +	h264_config_params(ctx);
>> +
>> +	if (h264_prepare_input(ctx) < 0)
>> +		return ret;
>> +
>> +	if (alloc_colocate_cma(h264_ctx, ctx) < 0)
>> +		return ret;
>> +
>> +	h264_restore_hw_ctx(ctx);
>> +
>> +	config_decode_mode(ctx);
>> +	/* enable stream input hardware */
>> +	regmap_update_bits(dec_hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0x6, 0x6);
>> +	/* enable hardware timer */
>> +	regmap_write(dec_hw->map[DOS_BUS], NAL_SEARCH_CTL,
>> +		     read_dos_reg(dec_hw, NAL_SEARCH_CTL) | (1 << 16));
>> +	regmap_write(dec_hw->map[DOS_BUS], MDEC_EXTIF_CFG2,
>> +		     read_dos_reg(dec_hw, MDEC_EXTIF_CFG2) | 0x20);
>> +	regmap_write(dec_hw->map[DOS_BUS], NAL_SEARCH_CTL,
>> +		     read_dos_reg(dec_hw, NAL_SEARCH_CTL) & (~0x2));
>> +	regmap_update_bits(dec_hw->map[DOS_BUS], VDEC_ASSIST_MMC_CTRL1,
>> +			   (1 << 3), 0);
>> +
>> +	aml_start_vdec_hw(dec_hw);
>> +	h264_ctx->init_flag = 1;
>> +	h264_ctx->new_pic_flag = 1;
>> +
>> +	regmap_write(dec_hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_SEARCH_HEAD);
>> +
>> +	ret = wait_event_interruptible_timeout(ctx->queue, ctx->int_cond,
>> +					       msecs_to_jiffies(DECODER_TIMEOUT_MS));
>> +	ctx->int_cond = 0;
>> +	if (!ret) {
>> +		ret = -1;
>> +		dev_err(&ctx->dev->plat_dev->dev, "dec timeout=%u\n", DECODER_TIMEOUT_MS);
>> +		for (i = 0; i < 16; i++) {	/* 16 : show ucode PC 16 times when timeout */
>> +			dev_info(&ctx->dev->plat_dev->dev, "decoder timeout, pc 0x%x\n",
>> +				 read_dos_reg(dec_hw, MPC_E));
>> +			usleep_range(10, 20);
>> +		}
>> +	} else if (-ERESTARTSYS == ret) {
>> +		ret = -1;
>> +		dev_err(&ctx->dev->plat_dev->dev, "dec inter fail\n");
>> +	}
>> +
>> +	aml_stop_vdec_hw(dec_hw);
>> +	h264_ctx->init_flag = 0;
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/amlogic/vdec/h264.h b/drivers/media/platform/amlogic/vdec/h264.h
>> new file mode 100644
>> index 000000000000..3d3a35a641c9
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/h264.h
>> @@ -0,0 +1,300 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +#ifndef _H264_H_
>> +#define _H264_H_
>> +
>> +#define RPM_BEGIN           0x0
>> +#define FRAME_IN_DPB        24
>> +#define RPM_END             0x400
>> +#define DPB_OFFSET          0x100
>> +#define MMCO_OFFSET         0x200
>> +#define SPS_OFFSET          0x100
>> +#define PPS_OFFSET          0x300
>> +#define PARAM_BASE_VAL      0x414d
>> +#define MEM_MMCO_BASE       0x01c3000
>> +#define MEM_SPS_BASE        0x01c3c00
>> +#define MEM_PPS_BASE        0x01cbc00
>> +#define MC_TOTAL_SIZE       ((20 + 16) * SZ_1K)
>> +#define MC_SWAP_SIZE        (4 * SZ_1K)
>> +#define LMEM_DUMP_SIZE      4096
>> +#define V_BUF_ADDR_OFFSET   (0x200000 + 0x8000 + 0x20000 + 0x1000)
>> +#define DCAC_READ_MARGIN    (64 * 1024)
>> +#define MC_OFFSET_HEADER    0x0000
>> +#define MC_OFFSET_DATA      0x1000
>> +#define MC_OFFSET_MMCO      0x2000
>> +#define MC_OFFSET_LIST      0x3000
>> +#define MC_OFFSET_SLICE     0x4000
>> +#define MC_OFFSET_MAIN      0x5000
>> +
>> +/* Rename the dos regs */
>> +#define H264_DECODE_INFO    M4_CONTROL_REG
>> +#define INIT_FLAG_REG       AV_SCRATCH_2
>> +#define HEAD_PADDING_REG     AV_SCRATCH_3
>> +#define UCODE_WATCHDOG_REG   AV_SCRATCH_7
>> +#define LMEM_DUMP_ADR       AV_SCRATCH_L
>> +#define DEBUG_REG1          AV_SCRATCH_M
>> +#define DEBUG_REG2          AV_SCRATCH_N
>> +#define FRAME_COUNTER_REG       AV_SCRATCH_I
>> +#define RPM_CMD_REG          AV_SCRATCH_A
>> +#define H264_DECODE_SIZE    AV_SCRATCH_E
>> +#define H264_DECODE_MODE    AV_SCRATCH_4
>> +#define H264_DECODE_SEQINFO    AV_SCRATCH_5
>> +/**
>> + * NAL_SEARCH_CTL: bit 0, enable itu_t35
>> + * NAL_SEARCH_CTL: bit 1, enable mmu
>> + * NAL_SEARCH_CTL: bit 2, detect frame_mbs_only_flag whether switch resolution
>> + * NAL_SEARCH_CTL: bit 3, recover the correct sps pps
>> + * NAL_SEARCH_CTL: bit 7-14,level_idc
>> + * NAL_SEARCH_CTL: bit 15,bitstream_restriction_flag
>> + */
>> +#define NAL_SEARCH_CTL      AV_SCRATCH_9
>> +#define DPB_STATUS_REG      AV_SCRATCH_J
>> +#define ERROR_STATUS_REG    AV_SCRATCH_9
>> +
>> +#define H264_BUFFER_INFO_INDEX      PMV3_X	/* 0xc24 */
>> +#define H264_BUFFER_INFO_DATA       PMV2_X	/* 0xc22 */
>> +#define H264_CURRENT_POC_IDX_RESET  LAST_SLICE_MV_ADDR	/* 0xc30 */
>> +#define H264_CURRENT_POC            LAST_MVY	/* 0xc32 shared with conceal MV */
>> +#define H264_CO_MB_WR_ADDR          VLD_C38
>> +#define H264_CO_MB_RD_ADDR          VLD_C39
>> +#define H264_CO_MB_RW_CTL           VLD_C3D
>> +#define MBY_MBX                     MB_MOTION_MODE
>> +
>> +#define H264_ACTION_SEARCH_HEAD     0xf0
>> +#define H264_ACTION_DECODE_SLICE    0xf1
>> +#define H264_ACTION_CONFIG_DONE     0xf2
>> +#define H264_ACTION_DECODE_NEWPIC   0xf3
>> +#define H264_ACTION_DECODE_START    0xff
>> +
>> +/* RPM memory definition */
>> +#define FIXED_FRAME_RATE_FLAG						0X21
>> +#define OFFSET_DELIMITER_LO						0x2f
>> +#define OFFSET_DELIMITER_HI						0x30
>> +#define REF_IDC_OVERRIDE_FLAG						0x35
>> +#define SLICE_IPONLY_BREAK						0X5C
>> +#define PREV_MAX_REFERENCE_FRAME_NUM					0X5D
>> +#define EOS								0X5E
>> +#define FRAME_PACKING_TYPE						0X5F
>> +#define OLD_POC_PAR_1							0X60
>> +#define OLD_POC_PAR_2							0X61
>> +#define PREV_MBX							0X62
>> +#define PREV_MBY							0X63
>> +#define ERROR_SKIP_MB_NUM						0X64
>> +#define ERROR_MB_STATUS							0X65
>> +#define L0_PIC0_STATUS							0X66
>> +#define TIMEOUT_COUNTER							0X67
>> +#define BUFFER_SIZE							0X68
>> +#define BUFFER_SIZE_HI							0X69
>> +#define CROPPING_LEFT_RIGHT						0X6A
>> +#define CROPPING_TOP_BOTTOM						0X6B
>> +/**
>> + * sps_flags2:
>> + * bit 3, bitstream_restriction_flag
>> + * bit 2, pic_struct_present_flag
>> + * bit 1, vcl_hrd_parameters_present_flag
>> + * bit 0, nal_hrd_parameters_present_flag
>> + */
>> +#define SPS_FLAGS2							0x6C
>> +#define NUM_REORDER_FRAMES						0x6D
>> +#define MAX_BUFFER_FRAME						0X6E
>> +
>> +#define NON_CONFORMING_STREAM						0X70
>> +#define RECOVERY_POINT							0X71
>> +#define POST_CANVAS							0X72
>> +#define POST_CANVAS_H							0X73
>> +#define SKIP_PIC_COUNT							0X74
>> +#define TARGET_NUM_SCALING_LIST						0X75
>> +#define FF_POST_ONE_FRAME						0X76
>> +#define PREVIOUS_BIT_CNT						0X77
>> +#define MB_NOT_SHIFT_COUNT						0X78
>> +#define PIC_STATUS							0X79
>> +#define FRAME_COUNTER							0X7A
>> +#define NEW_SLICE_TYPE							0X7B
>> +#define NEW_PICTURE_STRUCTURE						0X7C
>> +#define NEW_FRAME_NUM							0X7D
>> +#define NEW_IDR_PIC_ID							0X7E
>> +#define IDR_PIC_ID							0X7F
>> +
>> +/* h264 LOCAL */
>> +#define NAL_UNIT_TYPE							0X80
>> +#define NAL_REF_IDC							0X81
>> +#define SLICE_TYPE							0X82
>> +#define LOG2_MAX_FRAME_NUM						0X83
>> +#define FRAME_MBS_ONLY_FLAG						0X84
>> +#define PIC_ORDER_CNT_TYPE						0X85
>> +#define LOG2_MAX_PIC_ORDER_CNT_LSB					0X86
>> +#define PIC_ORDER_PRESENT_FLAG						0X87
>> +#define REDUNDANT_PIC_CNT_PRESENT_FLAG					0X88
>> +#define PIC_INIT_QP_MINUS26						0X89
>> +#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG				0X8A
>> +#define NUM_SLICE_GROUPS_MINUS1						0X8B
>> +#define MODE_8X8_FLAGS							0X8C
>> +#define ENTROPY_CODING_MODE_FLAG					0X8D
>> +#define SLICE_QUANT							0X8E
>> +#define TOTAL_MB_HEIGHT							0X8F
>> +#define PICTURE_STRUCTURE						0X90
>> +#define TOP_INTRA_TYPE							0X91
>> +#define RV_AI_STATUS							0X92
>> +#define AI_READ_START							0X93
>> +#define AI_WRITE_START							0X94
>> +#define AI_CUR_BUFFER							0X95
>> +#define AI_DMA_BUFFER							0X96
>> +#define AI_READ_OFFSET							0X97
>> +#define AI_WRITE_OFFSET							0X98
>> +#define AI_WRITE_OFFSET_SAVE						0X99
>> +#define RV_AI_BUFF_START						0X9A
>> +#define I_PIC_MB_COUNT							0X9B
>> +#define AI_WR_DCAC_DMA_CTRL						0X9C
>> +#define SLICE_MB_COUNT							0X9D
>> +#define PICTYPE								0X9E
>> +#define SLICE_GROUP_MAP_TYPE						0X9F
>> +#define MB_TYPE								0XA0
>> +#define MB_AFF_ADDED_DMA						0XA1
>> +#define PREVIOUS_MB_TYPE						0XA2
>> +#define WEIGHTED_PRED_FLAG						0XA3
>> +#define WEIGHTED_BIPRED_IDC						0XA4
>> +/* bit 3:2 - PICTURE_STRUCTURE
>> + * bit 1 - MB_ADAPTIVE_FRAME_FIELD_FLAG
>> + * bit 0 - FRAME_MBS_ONLY_FLAG
>> + */
>> +#define MBFF_INFO							0XA5
>> +#define TOP_INTRA_TYPE_TOP						0XA6
>> +#define RV_AI_BUFF_INC							0xA7
>> +#define DEFAULT_MB_INFO_LO						0xA8
>> +/* 0 -- no need to read
>> + * 1 -- need to wait Left
>> + * 2 -- need to read Intra
>> + * 3 -- need to read back MV
>> + */
>> +#define NEED_READ_TOP_INFO						0xA9
>> +/* 0 -- idle
>> + * 1 -- wait Left
>> + * 2 -- reading top Intra
>> + * 3 -- reading back MV
>> + */
>> +#define READ_TOP_INFO_STATE						0xAA
>> +#define DCAC_MBX							0xAB
>> +#define TOP_MB_INFO_OFFSET						0xAC
>> +#define TOP_MB_INFO_RD_IDX						0xAD
>> +#define TOP_MB_INFO_WR_IDX						0xAE
>> +
>> +#define VLD_NO_WAIT	 0
>> +#define VLD_WAIT_BUFFER 1
>> +#define VLD_WAIT_HOST   2
>> +#define VLD_WAIT_GAP	3
>> +
>> +#define VLD_WAITING							0xAF
>> +
>> +#define MB_X_NUM							0xB0
>> +#define MB_HEIGHT							0xB2
>> +#define MBX								0xB3
>> +#define TOTAL_MBY							0xB4
>> +#define INTR_MSK_SAVE							0xB5
>> +#define NEED_DISABLE_PPE						0xB6
>> +#define IS_NEW_PICTURE							0XB7
>> +#define PREV_NAL_REF_IDC						0XB8
>> +#define PREV_NAL_UNIT_TYPE						0XB9
>> +#define FRAME_MB_COUNT							0XBA
>> +#define SLICE_GROUP_UCODE						0XBB
>> +#define SLICE_GROUP_CHANGE_RATE						0XBC
>> +#define SLICE_GROUP_CHANGE_CYCLE_LEN					0XBD
>> +#define DELAY_LENGTH							0XBE
>> +#define PICTURE_STRUCT							0XBF
>> +#define DCAC_PREVIOUS_MB_TYPE						0xC1
>> +
>> +#define TIME_STAMP							0XC2
>> +#define H_TIME_STAMP							0XC3
>> +#define VPTS_MAP_ADDR							0XC4
>> +#define H_VPTS_MAP_ADDR							0XC5
>> +#define PIC_INSERT_FLAG							0XC7
>> +#define TIME_STAMP_START						0XC8
>> +#define TIME_STAMP_END							0XDF
>> +#define OFFSET_FOR_NON_REF_PIC						0XE0
>> +#define OFFSET_FOR_TOP_TO_BOTTOM_FIELD					0XE2
>> +#define MAX_REFERENCE_FRAME_NUM						0XE4
>> +#define FRAME_NUM_GAP_ALLOWED						0XE5
>> +#define NUM_REF_FRAMES_IN_PIC_ORDER_CNT_CYCLE				0XE6
>> +#define PROFILE_IDC_MMCO						0XE7
>> +#define LEVEL_IDC_MMCO							0XE8
>> +#define FRAME_SIZE_IN_MB						0XE9
>> +#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG				0XEA
>> +#define PPS_NUM_REF_IDX_L0_ACTIVE_MINUS1				0XEB
>> +#define PPS_NUM_REF_IDX_L1_ACTIVE_MINUS1				0XEC
>> +#define CURRENT_SPS_ID							0XED
>> +#define CURRENT_PPS_ID							0XEE
>> +/* bit 0 - sequence parameter set may change
>> + * bit 1 - picture parameter set may change
>> + * bit 2 - new dpb just inited
>> + * bit 3 - IDR picture not decoded yet
>> + * bit 5:4 - 0: mb level code loaded 1: picture
>> + * level code loaded 2: slice level code loaded
>> + */
>> +#define DECODE_STATUS							0XEF
>> +#define FIRST_MB_IN_SLICE						0XF0
>> +#define PREV_MB_WIDTH							0XF1
>> +#define PREV_FRAME_SIZE_IN_MB						0XF2
>> +/* bit 0 - aspect_ratio_info_present_flag
>> + * bit 1 - timing_info_present_flag
>> + * bit 2 - nal_hrd_parameters_present_flag
>> + * bit 3 - vcl_hrd_parameters_present_flag
>> + * bit 4 - pic_struct_present_flag
>> + * bit 5 - bitstream_restriction_flag
>> + */
>> +#define VUI_STATUS							0XF4
>> +#define ASPECT_RATIO_IDC						0XF5
>> +#define ASPECT_RATIO_SAR_WIDTH						0XF6
>> +#define ASPECT_RATIO_SAR_HEIGHT						0XF7
>> +#define NUM_UNITS_IN_TICK						0XF8
>> +#define TIME_SCALE							0XFA
>> +#define CURRENT_PIC_INFO						0XFC
>> +#define DPB_BUFFER_INFO							0XFD
>> +#define REFERENCE_POOL_INFO						0XFE
>> +#define REFERENCE_LIST_INFO						0XFF
>> +
>> +#define REORDER_CMD_MAX             66
>> +
>> +/* config parameters to DDR lmem */
>> +#define GET_SPS_PROFILE_IDC(x)       (((x) & 0xff) << 8)
>> +#define GET_SPS_LEVEL_IDC(x)         ((x) & 0xff)
>> +#define GET_SPS_SEQ_PARAM_SET_ID(x)       (((x) & 0x1f) << 8)
>> +#define GET_SPS_CHROMA_FORMAT_IDC(x)      ((x) << 8)
>> +#define GET_SPS_NUM_REF_FRAMES(x)         ((x) & 0xff)
>> +#define GET_SPS_GAPS_ALLOWED_FLAG(x)      ((x) << 8)
>> +#define GET_SPS_LOG2_MAX_FRAME_NUM(x)     ((x) + 4)
>> +#define GET_SPS_PIC_ORDER_CNT_LSB(x)      ((x) + 4)
>> +#define GET_SPS_PIC_ORDER_TYPE(x)         (x)
>> +#define GET_SPS_OFFSET_FOR_NONREF_PIC_HIGH(x)      (((x) & 0xffff0000) >> 16)
>> +#define GET_SPS_OFFSET_FOR_NONREF_PIC_LOW(x)         ((x) & 0xffff)
>> +#define GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_HIGH(x)      (((x) & 0xffff0000) >> 16)
>> +#define GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_LOW(x)         ((x) & 0xffff)
>> +#define GET_SPS_PIC_WIDTH_IN_MBS(x)       ((x) + 1)
>> +#define GET_SPS_PIC_HEIGHT_IN_MBS(x)      ((x) + 1)
>> +#define GET_SPS_DIRECT_8X8_FLAGS(x)       (((x) & 0x1) << 2)
>> +#define GET_SPS_MB_ADAPTIVE_FRAME_FIELD_FLAGS(x)       (((x) & 0x1) << 1)
>> +#define GET_SPS_FRAME_MBS_ONLY_FLAGS(x)   ((x) & 0x1)
>> +
>> +#define GET_PPS_PIC_PARAM_SET_ID(x)       ((x) & 0xff)
>> +#define GET_PPS_SEQ_PARAM_SET_ID(x)       (((x) & 0x1f) << 8)
>> +#define GET_PPS_ENTROPY_CODING_MODE_FLAG(x)  (((x) & 0x1) << 13)
>> +#define GET_PPS_PIC_ORDER_PRESENT_FLAG(x)    (((x) & 0x1) << 14)
>> +#define GET_PPS_NUM_IDX_REF_L0_MINUS1(x)       ((x) & 0x1f)
>> +#define GET_PPS_NUM_IDX_REF_L1_MINUS1(x)       (((x) & 0x1f) << 5)
>> +#define GET_PPS_WEIGHTED_PRED_FLAG(x)         (((x) & 0x1) << 10)
>> +#define GET_PPS_WEIGHTED_BIPRED_IDC(x)        (((x) & 0x3) << 11)
>> +#define GET_PPS_INIT_QS_MINUS26(x)           (((x) & 0xff) << 8)
>> +#define GET_PPS_INIT_QP_MINUS26(x)           ((x) & 0xff)
>> +#define GET_PPS_CHROMA_QP_INDEX_OFFSET(x)   ((x) & 0xff)
>> +#define GET_PPS_DEBLOCK_FILTER_CTRL_PRESENT_FLAG(x)   (((x) & 0x1) << 8)
>> +#define GET_PPS_CONSTRAIN_INTRA_PRED_FLAG(x)          (((x) & 0x1) << 9)
>> +#define GET_PPS_REDUNDANT_PIC_CNT_PRESENT_FLAG(x)     (((x) & 0x1) << 10)
>> +#define GET_PPS_SCALING_MATRIX_PRESENT_FLAG(x)        (((x) & 0x1) << 1)
>> +#define GET_PPS_TRANSFORM_8X8_FLAG(x)                 ((x) & 0x1)
>> +#define GET_PPS_GET_SECOND_CHROMA_QP_OFFSET(x)        (x)
>> +
>> +int aml_h264_init(void *priv);
>> +void aml_h264_exit(void *priv);
>> +int aml_h264_dec_run(void *priv);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/amlogic/vdec/reg_defines.h b/drivers/media/platform/amlogic/vdec/reg_defines.h
>> new file mode 100644
>> index 000000000000..ea50018a078d
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/reg_defines.h
>> @@ -0,0 +1,177 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _REG_DEFINES_H_
>> +#define _REG_DEFINES_H_
>> +
>> +#define REG_ALIGN(x) ((x) << 2)
>> +
>> +#define VDEC_ASSIST_MMC_CTRL0        REG_ALIGN(0x0001)
>> +#define VDEC_ASSIST_MMC_CTRL1        REG_ALIGN(0x0002)
>> +
>> +#define VDEC_ASSIST_CANVAS_BLK32     REG_ALIGN(0x0005)
>> +
>> +#define VDEC_ASSIST_MBOX1_CLR_REG    REG_ALIGN(0x0075)
>> +#define VDEC_ASSIST_MBOX1_MASK       REG_ALIGN(0x0076)
>> +
>> +#define MPSR                         REG_ALIGN(0x0301)
>> +#define MPC_P                        REG_ALIGN(0x0306)
>> +#define MPC_D                        REG_ALIGN(0x0307)
>> +#define MPC_E                        REG_ALIGN(0x0308)
>> +#define MPC_W                        REG_ALIGN(0x0309)
>> +#define CPSR                         REG_ALIGN(0x0321)
>> +#define IMEM_DMA_CTRL                REG_ALIGN(0x0340)
>> +#define IMEM_DMA_ADR                 REG_ALIGN(0x0341)
>> +#define IMEM_DMA_COUNT               REG_ALIGN(0x0342)
>> +#define WRRSP_IMEM                   REG_ALIGN(0x0343)
>> +#define LMEM_DMA_CTRL                REG_ALIGN(0x0350)
>> +#define WRRSP_LMEM                   REG_ALIGN(0x0353)
>> +
>> +#define PSCALE_CTRL                  REG_ALIGN(0x0911)
>> +#define GCLK_EN                      REG_ALIGN(0x0983)
>> +#define MDEC_PIC_DC_CTRL             REG_ALIGN(0x098e)
>> +#define MDEC_PIC_DC_MUX_CTRL         REG_ALIGN(0x098d)
>> +#define ANC0_CANVAS_ADDR             REG_ALIGN(0x0990)
>> +#define ANC1_CANVAS_ADDR             REG_ALIGN(0x0991)
>> +#define ANC2_CANVAS_ADDR             REG_ALIGN(0x0992)
>> +#define ANC3_CANVAS_ADDR             REG_ALIGN(0x0993)
>> +#define ANC4_CANVAS_ADDR             REG_ALIGN(0x0994)
>> +#define ANC5_CANVAS_ADDR             REG_ALIGN(0x0995)
>> +#define ANC6_CANVAS_ADDR             REG_ALIGN(0x0996)
>> +#define ANC7_CANVAS_ADDR             REG_ALIGN(0x0997)
>> +#define ANC8_CANVAS_ADDR             REG_ALIGN(0x0998)
>> +#define ANC9_CANVAS_ADDR             REG_ALIGN(0x0999)
>> +#define ANC10_CANVAS_ADDR            REG_ALIGN(0x099a)
>> +#define ANC11_CANVAS_ADDR            REG_ALIGN(0x099b)
>> +#define ANC12_CANVAS_ADDR            REG_ALIGN(0x099c)
>> +#define ANC13_CANVAS_ADDR            REG_ALIGN(0x099d)
>> +#define ANC14_CANVAS_ADDR            REG_ALIGN(0x099e)
>> +#define ANC15_CANVAS_ADDR            REG_ALIGN(0x099f)
>> +#define ANC16_CANVAS_ADDR            REG_ALIGN(0x09a0)
>> +#define ANC17_CANVAS_ADDR            REG_ALIGN(0x09a1)
>> +#define ANC18_CANVAS_ADDR            REG_ALIGN(0x09a2)
>> +#define ANC19_CANVAS_ADDR            REG_ALIGN(0x09a3)
>> +#define ANC20_CANVAS_ADDR            REG_ALIGN(0x09a4)
>> +#define ANC21_CANVAS_ADDR            REG_ALIGN(0x09a5)
>> +#define ANC22_CANVAS_ADDR            REG_ALIGN(0x09a6)
>> +#define ANC23_CANVAS_ADDR            REG_ALIGN(0x09a7)
>> +#define ANC24_CANVAS_ADDR            REG_ALIGN(0x09a8)
>> +#define ANC25_CANVAS_ADDR            REG_ALIGN(0x09a9)
>> +#define ANC26_CANVAS_ADDR            REG_ALIGN(0x09aa)
>> +#define ANC27_CANVAS_ADDR            REG_ALIGN(0x09ab)
>> +#define ANC28_CANVAS_ADDR            REG_ALIGN(0x09ac)
>> +#define ANC29_CANVAS_ADDR            REG_ALIGN(0x09ad)
>> +#define ANC30_CANVAS_ADDR            REG_ALIGN(0x09ae)
>> +#define ANC31_CANVAS_ADDR            REG_ALIGN(0x09af)
>> +#define DBKR_CANVAS_ADDR             REG_ALIGN(0x09b0)
>> +#define DBKW_CANVAS_ADDR             REG_ALIGN(0x09b1)
>> +#define REC_CANVAS_ADDR              REG_ALIGN(0x09b2)
>> +#define CURR_CANVAS_CTRL             REG_ALIGN(0x09b3)
>> +#define MDEC_PIC_DC_THRESH           REG_ALIGN(0x09b8)
>> +#define AV_SCRATCH_0                 REG_ALIGN(0x09c0)
>> +#define AV_SCRATCH_1                 REG_ALIGN(0x09c1)
>> +#define AV_SCRATCH_2                 REG_ALIGN(0x09c2)
>> +#define AV_SCRATCH_3                 REG_ALIGN(0x09c3)
>> +#define AV_SCRATCH_4                 REG_ALIGN(0x09c4)
>> +#define AV_SCRATCH_5                 REG_ALIGN(0x09c5)
>> +#define AV_SCRATCH_6                 REG_ALIGN(0x09c6)
>> +#define AV_SCRATCH_7                 REG_ALIGN(0x09c7)
>> +#define AV_SCRATCH_8                 REG_ALIGN(0x09c8)
>> +#define AV_SCRATCH_9                 REG_ALIGN(0x09c9)
>> +#define AV_SCRATCH_A                 REG_ALIGN(0x09ca)
>> +#define AV_SCRATCH_B                 REG_ALIGN(0x09cb)
>> +#define AV_SCRATCH_C                 REG_ALIGN(0x09cc)
>> +#define AV_SCRATCH_D                 REG_ALIGN(0x09cd)
>> +#define AV_SCRATCH_E                 REG_ALIGN(0x09ce)
>> +#define AV_SCRATCH_F                 REG_ALIGN(0x09cf)
>> +#define AV_SCRATCH_G                 REG_ALIGN(0x09d0)
>> +#define AV_SCRATCH_H                 REG_ALIGN(0x09d1)
>> +#define AV_SCRATCH_I                 REG_ALIGN(0x09d2)
>> +#define AV_SCRATCH_J                 REG_ALIGN(0x09d3)
>> +#define AV_SCRATCH_K                 REG_ALIGN(0x09d4)
>> +#define AV_SCRATCH_L                 REG_ALIGN(0x09d5)
>> +#define AV_SCRATCH_M                 REG_ALIGN(0x09d6)
>> +#define AV_SCRATCH_N                 REG_ALIGN(0x09d7)
>> +#define WRRSP_VLD                    REG_ALIGN(0x09da)
>> +#define MDEC_DOUBLEW_CFG0            REG_ALIGN(0x09db)
>> +#define MDEC_DOUBLEW_CFG1            REG_ALIGN(0x09dc)
>> +#define MDEC_DOUBLEW_CFG2            REG_ALIGN(0x09dd)
>> +#define MDEC_DOUBLEW_CFG3            REG_ALIGN(0x09de)
>> +#define MDEC_DOUBLEW_CFG4            REG_ALIGN(0x09df)
>> +#define MDEC_DOUBLEW_CFG5            REG_ALIGN(0x09e0)
>> +#define MDEC_DOUBLEW_CFG6            REG_ALIGN(0x09e1)
>> +#define MDEC_DOUBLEW_CFG7            REG_ALIGN(0x09e2)
>> +#define MDEC_DOUBLEW_STATUS          REG_ALIGN(0x09e3)
>> +#define MDEC_EXTIF_CFG0              REG_ALIGN(0x09e4)
>> +
>> +#define MDEC_EXTIF_CFG1              REG_ALIGN(0x09e5)
>> +#define MDEC_EXTIF_CFG2              REG_ALIGN(0x09e6)
>> +
>> +#define POWER_CTL_VLD                REG_ALIGN(0x0c08)
>> +#define VLD_DECODE_CONTROL           REG_ALIGN(0x0c18)
>> +
>> +#define PMV1_X                       REG_ALIGN(0x0c20)
>> +#define PMV1_Y                       REG_ALIGN(0x0c21)
>> +#define PMV2_X                       REG_ALIGN(0x0c22)
>> +#define PMV2_Y                       REG_ALIGN(0x0c23)
>> +#define PMV3_X                       REG_ALIGN(0x0c24)
>> +#define PMV3_Y                       REG_ALIGN(0x0c25)
>> +#define PMV4_X                       REG_ALIGN(0x0c26)
>> +#define PMV4_Y                       REG_ALIGN(0x0c27)
>> +#define M4_TABLE_SELECT              REG_ALIGN(0x0c28)
>> +#define M4_CONTROL_REG               REG_ALIGN(0x0c29)
>> +#define BLOCK_NUM                    REG_ALIGN(0x0c2a)
>> +#define PATTERN_CODE                 REG_ALIGN(0x0c2b)
>> +#define MB_INFO                      REG_ALIGN(0x0c2c)
>> +#define VLD_DC_PRED                  REG_ALIGN(0x0c2d)
>> +#define VLD_ERROR_MASK               REG_ALIGN(0x0c2e)
>> +#define VLD_DC_PRED_C                REG_ALIGN(0x0c2f)
>> +#define LAST_SLICE_MV_ADDR           REG_ALIGN(0x0c30)
>> +#define LAST_MVX                     REG_ALIGN(0x0c31)
>> +#define LAST_MVY                     REG_ALIGN(0x0c32)
>> +
>> +#define MB_MOTION_MODE               REG_ALIGN(0x0c07)
>> +#define VIFF_BIT_CNT                 REG_ALIGN(0x0c1a)
>> +#define M4_CONTROL_REG               REG_ALIGN(0x0c29)
>> +#define VLD_C38                      REG_ALIGN(0x0c38)
>> +#define VLD_C39                      REG_ALIGN(0x0c39)
>> +#define VLD_SHIFT_STATUS             REG_ALIGN(0x0c3b)
>> +#define VLD_C3D                      REG_ALIGN(0x0c3d)
>> +#define VLD_MEM_VIFIFO_START_PTR     REG_ALIGN(0x0c40)
>> +#define VLD_MEM_VIFIFO_CURR_PTR      REG_ALIGN(0x0c41)
>> +#define VLD_MEM_VIFIFO_END_PTR       REG_ALIGN(0x0c42)
>> +#define VLD_MEM_VIFIFO_BYTES_AVAIL   REG_ALIGN(0x0c43)
>> +#define VLD_MEM_VIFIFO_CONTROL       REG_ALIGN(0x0c44)
>> +#define VLD_MEM_VIFIFO_WP            REG_ALIGN(0x0c45)
>> +#define VLD_MEM_VIFIFO_RP            REG_ALIGN(0x0c46)
>> +#define VLD_MEM_VIFIFO_LEVEL         REG_ALIGN(0x0c47)
>> +#define VLD_MEM_VIFIFO_BUF_CNTL      REG_ALIGN(0x0c48)
>> +
>> +#define VCOP_CTRL_REG                REG_ALIGN(0x0e00)
>> +#define RV_AI_MB_COUNT               REG_ALIGN(0x0e0c)
>> +#define IQIDCT_CONTROL               REG_ALIGN(0x0e0e)
>> +#define DCAC_DDR_BYTE64_CTL          REG_ALIGN(0x0e1d)
>> +
>> +#define VDEC2_IMEM_DMA_CTRL          REG_ALIGN(0x2340)
>> +#define VDEC2_IMEM_DMA_ADR           REG_ALIGN(0x2341)
>> +#define VDEC2_IMEM_DMA_COUNT         REG_ALIGN(0x2342)
>> +
>> +#define DOS_SW_RESET0                REG_ALIGN(0x3f00)
>> +#define DOS_GCLK_EN0                 REG_ALIGN(0x3f01)
>> +#define DOS_GCLK_EN1                 REG_ALIGN(0x3f09)
>> +#define DOS_GCLK_EN3                 REG_ALIGN(0x3f35)
>> +
>> +#define DOS_MEM_PD_VDEC              REG_ALIGN(0x3f30)
>> +#define DOS_MEM_PD_VDEC2             REG_ALIGN(0x3f31)
>> +#define DOS_MEM_PD_HCODEC            REG_ALIGN(0x3f32)
>> +/*add from M8M2*/
>> +#define DOS_MEM_PD_HEVC              REG_ALIGN(0x3f33)
>> +
>> +#define DOS_SW_RESET3                REG_ALIGN(0x3f34)
>> +#define DOS_GCLK_EN3                 REG_ALIGN(0x3f35)
>> +#define DOS_HEVC_INT_EN              REG_ALIGN(0x3f36)
>> +
>> +#endif
>> +

