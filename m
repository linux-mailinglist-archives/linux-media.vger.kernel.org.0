Return-Path: <linux-media+bounces-17536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88596B459
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 288301F28457
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1EE188A37;
	Wed,  4 Sep 2024 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="wTMu8zME"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2133.outbound.protection.outlook.com [40.107.255.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0E17BECA;
	Wed,  4 Sep 2024 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725437733; cv=fail; b=O06HaZ4a29tC1qsiydrzZj8t1YGxmpUwQMGIRaRP0qbIR9XLqiPrWxUE8B1Ee0yOCW4qzYGsQe+9mQmHSm2bTc3EQz1LO7t0i/oeqC8rVA7iYGP70n/8pl6eIiTYeCwwgtYoivbXCAtz0iMlcWp0wDzeP1ySjEXSWgl8F5/ih44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725437733; c=relaxed/simple;
	bh=AFQl62hfVAisV4nDSn5NqzqypCpIrV85paYkFlca+lw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f4osnGJ5P4SHxW1wM0fanCUvMTB0SPyE3M0FXQxkmS2Np4rtpX+CcM8zOfZpbZyj0v4ps86iBBhRxhXFtdqLnzADOBIUbuppyBqaZnvswzdl5w+5h3Oy/ip2MhtfL+B6M5VXHa7Zdvf247EiiQ2oMR8tFBM953zo3RNLepZxVgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=wTMu8zME; arc=fail smtp.client-ip=40.107.255.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4ANuyiwbEIZ965ivLLO+XVOq1u7KUcWy3GAfuG2fS36xKLeP83r+KcNoRuD8v/6FiIr1vPAkK2eKGD8sAMDUUEGClJxZSDnrQ/u+nJIhEteNotqCogbKY7HRDXe7Sepe2hD77NiS36Oqvccek1qBJ5bpf2RAzAFR9FAV0rkP/PzHR0cnR2L8QTVVXvVP8BMj8m66CxMyRxDlDiTbWt6zovoDHp8ORFMD9DOP3ynkNk83K24eRJGK7EJycX+28UU1GKFbfNU7sNMwCsFj1FdrnfhrHlIsIchgHc1zPyRxI2YGJAPTzkQ7+XGoNVi0uo/FH8ULF7XYLHFw52St+SEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gGC5W7RN0Z2irje//Rk6cygI526jG8zCusLwzgCqmw=;
 b=x3glD7NyumMs4ezHF/NrOBGouf7P/ieqyBCeCz56XpzPGwH9k3vvk2EEabGt1iJAgcuVVjaTudJD5UNystMWLc/vMhd28daelu9NZfYIi5f95TBFpbonDYi8Idpb5JbY9b44/h+2oepT53HazFWMwOnaXWfslc32ucNj47SfLJNtzDuKKoG8N/tz54oYsnMqhdU/W0/PT+ahsT7KWmwmmzoa3bgdEfjHNnT4JovQzT42uTpj6HOdYWWRCsMsHhRjI5wBIikQZoyoiV/d7Tv6Ris7c2pILJhT54U+ASkzLLO6kP9Htf7whO/zEAQu+j6yoAKYvifpCASLWlJ7Pafi2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gGC5W7RN0Z2irje//Rk6cygI526jG8zCusLwzgCqmw=;
 b=wTMu8zMEJYDZS8BVJibZMuUP6KpxhxHV/tGJGQ1fpG1QwCR7AANQuv6ugEBqdAvEiws6rppNdsjMMC3K85WneFR/chJuAc4hi741+te9GN/nKMR48txN7oZLu7+RkUwPOs6afysDt8J3rHdP2AyRP+oYXeUjbDpCtLK/InO1vspqC/A4m0vCtU5x7MzY5KbQHxxYial52k0lMti9C3t5KP9a+CmsUCpAvniW1folRVtRxi1b+u+hdXwlMc4kTPqoIAttxFedUdW3+RBNHFxwzv3ezgwXV3ywC4QssWGgHvOlCfm/maOPY0ftWyaPiLHbPszJy89D5PerIQwjRxrhOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB8084.apcprd03.prod.outlook.com (2603:1096:400:473::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 4 Sep
 2024 08:15:26 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:15:26 +0000
Message-ID: <d83c58d9-164d-4a07-907f-9f2dbe682f09@amlogic.com>
Date: Wed, 4 Sep 2024 16:15:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
 <20240903-c3isp-v1-1-8af0edcc13c8@amlogic.com>
 <d3672523-11fe-42de-ad7b-643b396b8778@kernel.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <d3672523-11fe-42de-ad7b-643b396b8778@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 210af477-9045-4a11-f239-08dcccb9bb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmlaR0VjOWw0R1NWcVBrODVKQ2J3R0FrdllwRElkaDZZWjlXODUvcXRvQUgr?=
 =?utf-8?B?b21mWWg5NjZ1UkVEczMyTmJkeUxKTTlNanpRNnFWNWZkd1Q5ZjN1Ni9PbUtW?=
 =?utf-8?B?UkJ3N1pNaCtRNHJaL1RPNzZhdytubm9NNlluWjNDcUlpNkdFZTcrMFF0bWtO?=
 =?utf-8?B?Mmh6L3c4WHhWWHZFSm52NVFoOUs1cnlxRE5DcW1BL2t1cUxNYitBd0tMRjd2?=
 =?utf-8?B?Sy93UVUxQmcrMHpmVkw5bXBxMUtXYVB2YTRjWXFnNFlUZndoRlg2ekJJRUxq?=
 =?utf-8?B?OThjNmNyTzF6eldqZVBLNFdGbkFpeGVLT0ZqYjV5dUdheE9WU1ZIaDhZUUh4?=
 =?utf-8?B?d1NnOThMaWNtY3lndHJYTlpjMUhMendaK3VmaStTazR2bzRMbkFWK3NWQXpi?=
 =?utf-8?B?NVM3d0JoNzl6MDRvbmR6LzJpUTI5ZjV5QzRIOGpxMjlkTFRMUkVya0hXUGhG?=
 =?utf-8?B?R05mMG1OTGZkbHRpVkhHdnFvQmdReWFoVUJxdXNleTVDTy9HZ2R5ZzVxMmt5?=
 =?utf-8?B?NnZGUkw5azFqQmsyaUNxVVdvQXIyWW1mcUZtM21nNFpSOXpYUEtlWE5aTGho?=
 =?utf-8?B?TFIvWkdmWDQvTzN0aCt6OGw2WU0rYnhVaVhEZ3VTbnhRR1NZYmdvMXlhS1hM?=
 =?utf-8?B?VGdYRzZpSkJYK0ptd3M5d3hEVGJtK0k3U3VIZEE5L1ozVkhaV1p5Rmdremk2?=
 =?utf-8?B?RFpHeCtQeXcvNUR3QUNRYW9jY2ZMTDZUdVA1U3BZc0pLNlFIYXk1NklydjE0?=
 =?utf-8?B?MkszaUVKVWozQjFMYTNlYmljdUpmQTk5Rko2SjJ5Mjh4Q2VINHRpeHVkMUZG?=
 =?utf-8?B?aFpreW94RmpnMkxDcTZJUE5BQllrWkhWWVd2My9sZDBkT2NrUm1EQm9sT1Nj?=
 =?utf-8?B?RXNwQnUxbzJ0QmNoNjhmcExSZzBWcXpRaklJcmVkSCtvZzBpSjFJcFJoM0Zi?=
 =?utf-8?B?cHNWSENPcGY4L2VwVVN0elNWbC9ISVhWbVNrNjkvT1ZzVEpvbGhWUHpoMThC?=
 =?utf-8?B?ZUY0d0phTnpiODEzWkdPTi9ha3hxV3lXZFlqaU9PR1NZNUppVVViWTc3V1pT?=
 =?utf-8?B?VWtZRzkzc082Y2VtL3NOT3JLUXlnbVdhcnV1T1ZSeXNpUEVEajQ0NFpjRFdC?=
 =?utf-8?B?Q25BNUF5aGF4cXMwMUUyYjdhWmcrSVByMjMzU1IrZ2pBUnNybEE3ZWwrZXp1?=
 =?utf-8?B?L3QvMlZHRE1vTVRYQTg4MDUwSEtHczEvcjNRN1Y0MkIwWFRiK0NzWDNrU0VG?=
 =?utf-8?B?a1UxZEpYRUxxZDh4Z0VOOGtrSHhRVzJkQ0FXSTZVK1dHRmJ3ZTVVRXFiUlkz?=
 =?utf-8?B?TG1lNWZlMHJVdnRSa3ZYbjFkQzFGTnFTNDBOTzc5a3cxcnRQcExBcVRjUlBp?=
 =?utf-8?B?c1lLQjB2ZEJ6czFhaWo2bHZEQXU1MzdpQ2xEQVVSVG1ZUFZxWjU1T0xseEQw?=
 =?utf-8?B?Q3FyeVhnN1ZmWEhMOVB0T1Q3dzVQLzF5d3BGTjV3dEl5L0Z0Z2IxSUdka3NY?=
 =?utf-8?B?QnRWeFZWNVRIK2lVOTBXSEFxSCs3TmpoN1F0R1FiL2xGU056WHo3dmlkbEVt?=
 =?utf-8?B?WDVRT2E2WmhLcUpUS0F1c3ZKbXpBYmlFQmlFQVBTeFVTUUM1bEcxVzBvZ0Nh?=
 =?utf-8?B?QVRVWTY4ZG1xYTQvNVdHa3N5S0VQWUc2TllDc0tSWXpnWDkyWklQc2g3U0E0?=
 =?utf-8?B?QmUzZWRHMDRXZk5qK09CQWsrUmR2VS9yaWRmWWFhRDhXbk1DZ0tVdkg5VmhL?=
 =?utf-8?Q?kJ2P342/51Tj46qAfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEFOcVpXaDBLemFtQWhhTUJRT0tCSHJVK2pOazYxWUFvdmFuNEVWNHRqNGdy?=
 =?utf-8?B?UkswcTJFZVh1S2dqeFVIMFA3eTlGZXU1SVM3R3VJcEt2N3dod0t3Y0NQclZX?=
 =?utf-8?B?TU5wd1JEdjAwaWFIMDFCUk8yL0R3ZjV2eGo4c3FyN0tORkxicC9HajRabzdW?=
 =?utf-8?B?bGxJM1kvZ3oyNlk5S2k5Tm1DRDBhbjU1c0I5MG9La3NRdUM0alp5K2NjV2F6?=
 =?utf-8?B?ZlVCNHNyVDRTRzJlVFc3TFRqS2F3b3NtYmMra2M4eE9KbjRUZnBFN1dndWhk?=
 =?utf-8?B?SGFNazNKalZyT0p6MEtpSWlvbllFNDlxZ003VGluWlJDbFV0bU1wNktKZ09S?=
 =?utf-8?B?ZnBteDJjUlZLM0NPVC9FVnRCRUVuZlREQ3duN0djQjFYYnl2U0szdlZMcmk4?=
 =?utf-8?B?eXVxNXlrdUVGamJuSmFlU1pqbnNQeldvVXlmSVlYbkFBRGkxMTg2VU9iOXNx?=
 =?utf-8?B?Q2V5RjZqYmFJb0Jnd0FBdkhaeGtFNTVDczBQOE02N2Y4RTVqZXVmQnZmYmFM?=
 =?utf-8?B?R0M5bDVtTktaZHRQWGEyS240cHhuQlZrVE41MzhKQ3hXTS9VL2Y5UzVTQ0Vh?=
 =?utf-8?B?WjBQd2FWdVdjd2VBWU5MVGxVQVRSeUpCRWdyRmNQWUgzdzhJbVlTNXpTMjV2?=
 =?utf-8?B?WDNDTTV4NnB3c3IzclBvQ2E5U2ltYzJtYnREdDJMeDBnbU41K3A2d0x6UUwz?=
 =?utf-8?B?WGQ4SHBNcm5NejE3YmF5MG4vR1dwUXRiaHZkUCtKdmNVSjhtZFdxR2E3WUxS?=
 =?utf-8?B?RnY0TE4yT3lQOGVuNi9mcmpDNGdnYUx3MVdVbjFmbUsvUU1KSjRqVkxSZkhU?=
 =?utf-8?B?WlcwWXMvOUkzZzhlRUlSVDlySm1TTWNyYkNFanJCclZBeld3aFlPUTZuK2RP?=
 =?utf-8?B?QUlnM2djMllZNzY4Z2ZOUnFzdElrWEZsNE55Z3JYV1ZZNk1tOEkrRElnVENN?=
 =?utf-8?B?L0QzK1c0dVZHMklrT09jdmtzVFNhV05BMlZndmVtcytGUDBEcVI2Yy94ZWVz?=
 =?utf-8?B?eTZ3VElHcDV6SmVZTGwvems4MWVsNm9HZTdheTJTR3lBcUFwZ1ZyRXVPbzBl?=
 =?utf-8?B?OE1KakZyNmJDRmxJdVNTSUJjSjJkZ3dLZlp0b2JRd1VwS2tyRElpNEdFRk9l?=
 =?utf-8?B?cEVPeXJZUDJLRzdWVTRYRVUwRHhhSE1Cck1FSkdCdlRxNFIvaVV4RFNndlVZ?=
 =?utf-8?B?RS80TFJpRkdEYm5NSkpGdEo1ZjNDdUwyQnQvMmcvb2EwZk91cmNpcmJ4Rmty?=
 =?utf-8?B?RG9qQ0xicW44dVlCMldBMmRlc2VqbFRDbHEweGozaFY2ZUNYd2g2ODlnRThi?=
 =?utf-8?B?dFU1Qy9IcFZId1hxRHpIS3c1OU5Nb3BES1hJT2JwMEVsVDVGdzZsUnZsSEZE?=
 =?utf-8?B?YlRpSkdjUjNLcWZMWC9kWkRpR2RzcGZ5cEM0SzNtVGFxTFVIcU9MRjhWMlUw?=
 =?utf-8?B?KzBKMEVEZ3pqcm5mcnVKWFlPSVVZV3daZ2ZGbFV3U1JvK2dTNzI4cEtWMHdr?=
 =?utf-8?B?Qk1IM2NvSmMzdUozR3Z6K3pwMHpUdVBnZnBaOEVxREJMOXR4K3B6cXZoNEhz?=
 =?utf-8?B?VnNNcU5mTysyZElTdmdOVVZlbVdBajdYNVV0cFNiZTZTOHNsYVV3N3N4OTRY?=
 =?utf-8?B?NlZtSEVRVmpKSVBtT2tadmpxUllNN2pEdWREYTFzejdEUmZVMWpLTWpVL1M2?=
 =?utf-8?B?QytGOGE4Rm9EcExiMVY0RUVhS2xUUHR0bE1sME95VkRtbk5tTjVwQnFZSVYx?=
 =?utf-8?B?eDFYaHRRZ2NZcUFmS3U1ampSN2VIaVB3VDdSYVVxMURjQ0o0L0x5ZjBIL2ps?=
 =?utf-8?B?Z0xrQ2RXbDhSdXIrQWZoVml4anhHUnpuemQrWTZDNnZDVHhobFJIemRycDdV?=
 =?utf-8?B?NFVkc0h0bEt4TU5RdDRQTWNQUFArMG5iM1lqeTF4YU1VRkZ4VXRmb1ZLNmcv?=
 =?utf-8?B?N0hsZTJaYjM4TDJzTEV1bXQ5U1hCaDluL3JwNEJDZ2lsdURjUkhzaE5YbG4w?=
 =?utf-8?B?c3V3cFlvdnE5VkxWM3I4WkpEbm9BR25XTzZQTnR2Wk5scEhHVTMvTzQ4Qkha?=
 =?utf-8?B?U0FkUXdpS21TVWgvRmU3YmRaMFBNZmQzSXdycDNOcmJyZ1o0M0lMRDJxTzhF?=
 =?utf-8?Q?5gsxe8/2WnvHX4W9zfrR1bAMZ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210af477-9045-4a11-f239-08dcccb9bb40
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:15:26.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1tbq72YVDD885AnsBoORFxjHko6Tdo/0H4a++A2ojzGqnyMoX9TmbqOdI0m0HhSckqCO//Ft6W4OQ+Py1Xpyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8084


On 2024/9/3 22:08, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 03/09/2024 08:57, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> c3-mipi-csi2 is used to receive mipi data
>> from image sensor.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
Will modify this issue.
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 130 +++++++++++++++++++++
>>   1 file changed, 130 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>> new file mode 100644
>> index 000000000000..85d3088d6f9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>> @@ -0,0 +1,130 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-csi2.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic C3 MIPI CSI-2 receiver
>> +
>> +maintainers:
>> +  - Keke Li <keke.li@amlogic.com>
>> +
>> +description: |-
> Do not need '|-' unless you need to preserve formatting.
Will delete '| -'
>
>> +  MIPI CSI-2 receiver contains CSI-2 RX PHY and host controller.
>> +  It receives the MIPI data from the image sensor and sends MIPI data
>> +  to MIPI adapter.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,c3-mipi-csi2
>> +
>> +  reg:
>> +    minItems: 3
> Drop minItems
Will drop minItems
>
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csi_aphy
>> +      - const: csi_dphy
>> +      - const: csi_host
> Drop csi_ everywhere
Will drop csi_ every where
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
> Your code is random... Look how this is different than other list - reg.
> Instead maxItems.
Will modify minItems to maxItems
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vapb
>> +      - const: csi_phy0
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: input port node, connected to sensor.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: output port node
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
>> +    #include <dt-bindings/power/amlogic,c3-pwrc.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi: csi@ff018000 {
>> +            compatible = "amlogic,c3-mipi-csi2";
>> +
> Drop blank line
Will drop blank line.
>> +            reg = <0x0 0xff018000 0x0 0x400>,
>> +                  <0x0 0xff019000 0x0 0x300>,
>> +                  <0x0 0xff01a000 0x0 0x100>;
>> +
> Drop blank line
Will drop blank line.
>
>
>> +            reg-names = "csi_aphy", "csi_dphy", "csi_host";
>> +
>> +            power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
>> +
>> +            clocks =  <&clkc_periphs CLKID_VAPB>,
>> +                      <&clkc_periphs CLKID_CSI_PHY0>;
>> +
> Drop blank line. That's poorly readable code.
Will drop blank line.  Thanks again.
>
>
> Best regards,
> Krzysztof
>

