Return-Path: <linux-media+bounces-38530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64572B1371E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82823188778F
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FEF1D8E1A;
	Mon, 28 Jul 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tEiIz+2i"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440B178F4C;
	Mon, 28 Jul 2025 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753693253; cv=fail; b=D7ESw/EP/tOVPrLxVXiQf6TbU6Ua9RaBI6cl8YwaDl/T+wdh674vjf9R4ZiFdkrJ8x3JZ1Zh4NyHRnoRNc+0pT/mQNrRhYRMmuz+OU7YvHeVmUI8jNCDAKa7Gcot4vWUXkujNQWhjU7E9dVB/oNP3++JUvHgeyI7h9RKTjymqTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753693253; c=relaxed/simple;
	bh=Cmr0Ky/bekcru+qmPj8tZJGIeuPWqtRGqf5ti7z1oMA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eMj3BMHUN76PEBphDrCuQ6wLrMI5PoEOWFTaV6Mur4TrBsQikAjMZ66IoLpb+mkRhepbmNYYIS1pRNBdNhNwWZJg+bFwVDRDmi4YLnCN69l6HTm8va81L5+g/h6pRxVyUEnQzTYthutT8u5dMg1btajosCY+K2sAIZbkYo2BGBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tEiIz+2i; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZfp6RGg9CNsZ+MZNdZA5CQM6GE+/LgO2hs1Kf0egBjRYqHKFk1YgaWXR5+LwS8mpdYPY/THNeYMKHwPa7E/YBqgMzG3QeQqPkuypI5QKCdk0cYjFZgvGARksDMqRkI0QEaRnl46yX+5RC0WK5nJNBnQomNxzCBk4pMGVnZawAQd/SfcyNdN1C6e6P5mTz2igwBpqq3MrVc7tt2t0NL9hiCV6cOTBOAPQXPkyMGUSJMqZVOgTWBA4KLo8tr9aF8LPYUB7BZ+Cq/2BDhIJ9T8lTZzINlEEU39m2+zTJZlGqLQQQlq7P7EVpTu9boRTXHpgmHHgdEYWMs3559XsutAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oq7rKV/XpB4SsOaHVlOG6lpODkubiKfyp205YStdaE=;
 b=fNrSOWEHD6ADdCKIdl+OlLR8Z4xMzBkTNGxdgdjNxOukd7WEERHcMGqBtzM5AfyxkiXJaadb0yZZ5XGraDqPFosVi6cKDADgbNFakypW4rw6trNWvvCim7sZw2aRwWVGxC4/BOEkRTh0cVAdxQmWgA5onP9xtGls0m8StKYxPinm30cSzMMU9n7jVFN8U0S0w90YP315CjFWcfyoKorp1ZATAejJln5OvpXvWJ95Z/g6otS0nTTW6p9DOyfceeJztJwymDDDhEIO5PVPGiQk2cGCGBk/L5EupX2c1ydT23s06DjS3voU0mq8iJ9iyDEtjWZRcikQychT258xGBKgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oq7rKV/XpB4SsOaHVlOG6lpODkubiKfyp205YStdaE=;
 b=tEiIz+2ixXjQj55TILWBHoQMAaKjNz9wGcbm6sg+baxNtFeB6Chz5LwEJRtYgGErfspoBPCzcO3dL4Sbz4WDyLe3kJ59q0yjXh7cGSz8qRPX2u6pWAXZblEWqf37D1AI7uiD2PwyZclD7t9gU314KZoJRYrHJgL1aVDMXqk/Kng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CY1PR12MB9625.namprd12.prod.outlook.com (2603:10b6:930:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 09:00:48 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.021; Mon, 28 Jul 2025
 09:00:47 +0000
Message-ID: <c8983a65-df58-471b-a90d-40c15129460a@amd.com>
Date: Mon, 28 Jul 2025 17:00:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-2-Bin.Du@amd.com>
 <aIcQpB3pD8oWJPHZ@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIcQpB3pD8oWJPHZ@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CY1PR12MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bbd52c-b5ee-4259-8d79-08ddcdb53e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWtnSDYwQy81c0VRWldWb2tNQk42NlpGMFJVdlp2Y0Y3Sk5aU1pzZkZ6VmtW?=
 =?utf-8?B?VG5vei83STY1MTBrL09zMzJoM3ZmOUw5N0liMW9RMEFKWWFmc1hINkZvV2xQ?=
 =?utf-8?B?Wm1IM1lOc2tmMWFoWkd1NkhtRmZuZi9TVjgxZy9wUUNYSkcvT2c1Lzl3TGRn?=
 =?utf-8?B?dWIwb3NaYUZIZko3MDNIZjRnWFdRSXhtU281UXpjUTlTZGJydmRrY1ZpU0xt?=
 =?utf-8?B?d0Nielc4aXkwcUJiT2xGR0lXQTlRemVjTkk3c094NC84OEtOQndqSFk1bkhU?=
 =?utf-8?B?eW82NWhwMWloZ055aEp6MWFPeXF3UnVrTjZoZzI1T0E3UHMxa0xvSjBwUDQr?=
 =?utf-8?B?Q29jS3BLK3VlYUZkS1pGaGRnUyt4KzJOSHZKUmpiSGpJMmh5RzlDOGlrNkxa?=
 =?utf-8?B?NzdsSkREZTFOTHpCdXBOVUs4N0kzSWlvemtCV3ZQaE5HdTBsU3d3WmNIckNa?=
 =?utf-8?B?Q3FnUUxJR3UycU9yWDBUOHk1ZFB1YksxcEliZGVFaWNjVVIvSHozYXFjckgx?=
 =?utf-8?B?S2UzbmI5cTRWM1ZyQSsvK0NHcVEyZXJrSmxSM2Z1dXRvVitHTkkvUUwwSXJ1?=
 =?utf-8?B?RWhyT1N2T3pWQlprWWY4bWJrSytLNEYxVzQrMitHUkZqay9sazBzTFBlMG1W?=
 =?utf-8?B?MElXUFgzT3RJU0k5Y2ttRU9HMENkQnRFdGZpc25tazJwYVkzeFF4Qng3TVA1?=
 =?utf-8?B?eVlnc1pXOHV2Y2RsMStPVDZCZXVIc0oxbHpEcXNBaStSRHo3ZXZkZDdxZjZq?=
 =?utf-8?B?V1R6RkNHTUx1R28xTVNVS2g4ejZNZlFPZE9wNTBMTkFEdXdlcVZuZ2k3Rjhy?=
 =?utf-8?B?SytTb2pHUHJxdEVFOVJGN1FhV1lKS2JlbytHR1FObW0vbHYreTl1YThFRldO?=
 =?utf-8?B?SmtXaHN2QmdSOWxLZVY0QjZMZkhXM1JXMlhpeG1JU09vU3lxeTExWDQ1OFZn?=
 =?utf-8?B?UmtDNTU3amlPQVc1NHpESkh5d0VYVDFxekxjSXFyYmFRN2NlZXRaZkc1ZkY3?=
 =?utf-8?B?cHk5QzFkbXhoNVJOOUFRWUVDRG53THowaHptMG5Eek9PMXZ6c1FQRS9lcENO?=
 =?utf-8?B?NDNQMDBwa2E3c0d2UngyUCtoZzE1SXpPSTJTcnBneEpMWE5qUU5JZEcraTlY?=
 =?utf-8?B?bC9VVEdmbVUyM1hJNkd4dFRwN1dkcjNXTEpvOXhmTDhzcVhVblE1S3hlMmR0?=
 =?utf-8?B?anVKMEtQQmNubDI5QWkrSFJmTGxNOHNDVEZvWGZuNWNSbHZjL0pGY1VWZ3NE?=
 =?utf-8?B?OXFKZjR1Rys4NnB0cDFTOWpWc1kyS3Z1T2NKbjNRdjRVc05hWlUrbm4wbEd6?=
 =?utf-8?B?VzRSYkVweVFIdG5mVUR3NU1qNTVIdUVtS2xNVzFwYVF2dDJqRmVHM1ltZWl0?=
 =?utf-8?B?YkYvb0ZGMmlqU3lucWQwbTZPWjFId28wa3ZqRFhZZmVtV3g2bndGNlFhSkZz?=
 =?utf-8?B?YllPZXFIV2J1MkdoeFdCdnZPemppenlHYmloL2MrUEFOK2tTT0Z2U0poYUZ0?=
 =?utf-8?B?WUJaTFYyclhNMWZ3TjZORnB3ZGNpVUhYWUc0d3hVS08zOW55dnBwODRuWmxZ?=
 =?utf-8?B?d0NMZllTNWFjV0w3dmF3OTliUUQyQmZsVE1pNTNXVUpDT2FJbHVqQnBEYkZr?=
 =?utf-8?B?OElwMVU3Z1B2bXJ0VUlHcnJxTENoSWgydk9ER3lST1I1T1IrUExYYlg4S2Vu?=
 =?utf-8?B?WWpkNDJyK2o5bnV1Q2dxckZEaXp3cW5VMmxpbTNMRjRjNk90MmtFbTdPS2Qx?=
 =?utf-8?B?TFZJc1ZRVmNBUFQzeFRmcDV6cHlRNTZyQXJhcVlCT0VaZ29kdjNwdFRmTmtJ?=
 =?utf-8?B?eHo1MEVYY2ovcjFtOTgvbVI2M2l1ZVlreEdTK01SbFZya1JlbEJmZ0JJcXIw?=
 =?utf-8?B?OWNCdjlkcFRCV0NUOENhSDlNMktMT1JDYjlTRWx5a09ubFpYVEc3TmVkTFAv?=
 =?utf-8?Q?4TO/YndbDf4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWduaStaQzJWQ2NDaGFXWlpXRi93UU1Tck9qRVAyR1hMWFpXd2pnT0d6djNo?=
 =?utf-8?B?dDA1Rjc5K0tmZ2pJM05ZcnBoVU9FbjYwQ2Q1UVNlSGwveFFBeGQ2c2dMUVJP?=
 =?utf-8?B?Wkh0OHoyYTZJQzkxditYUWlhc1d0ZnJMcWFEZmZuNGVtdzY3d2Y0eW9kYkhN?=
 =?utf-8?B?MWtnQlFZRDZQT1F2R05oYktXSlFtZytTMGREZklYcnEwOFdoUHdaVHByeFNx?=
 =?utf-8?B?QWlxRDB6UC9Zd2lzZFI4b2JlTndmRVFLc2MrSk9XSWV4bEpVa2p0aVVGaVl3?=
 =?utf-8?B?T0tLayt6a2hjRzlvWHJCa05Ma1c0NFA4M3JzWVdtNXI1U3Q5dFRhNmYzUllh?=
 =?utf-8?B?aUtTOE5LWDcwL3NMdlZMTmJBOE9kdnRhMkhyYkZ5NW5vQ2dlMDNUdFZnOWZR?=
 =?utf-8?B?ZWpNY3ZuM1hCdml6UldmdEtycXBxbTBTZXBubis3WTA0a3FqWGxtQlEzNm5a?=
 =?utf-8?B?QkhFVnl2MnpHVk1VbWZkNUN3WncwL1NxaHZoUU5BVnVCZmdZK3NNenp3WW9Y?=
 =?utf-8?B?bE5vQkJWcFl2Y3BHSGpYZWNQRUoybjR2Q09UeVNma3V5V2FqQzFTSThFVWZ6?=
 =?utf-8?B?cFJ1TnlycE1vSXZmT01wc1YzR29pQ2JFWWNScmZ1a0ZTUUpnQTFHa3FEQUZH?=
 =?utf-8?B?U1NaaENINWxycUM1WHR3ejBMZE91di9IZC9FaUdyV1RnSnlUYVBEQ0k1czdI?=
 =?utf-8?B?eGdIam1iTmg0eS82YWRQQ0RvMUlSaHc1WnkxQjJDVEFsRFUwRFUzM3ZtOU5F?=
 =?utf-8?B?em1ZU3RpaE5rMlE2d1BjemNxdzR0cnpraTdLRTUrUzlPTlRVVUIxYXh4L3hX?=
 =?utf-8?B?bHEvdEs5dWFDZ3JIbUpSZVlxUmhiK3NOUmczNlZBaFRTdzRDWFJYZWM1YXNk?=
 =?utf-8?B?ak0zc255eXhwQjV4QUR1VHlhSlhKVW9hYi9HdXhOam1meVJNVWFIeFFzMHp4?=
 =?utf-8?B?M0tpaWZxcE41Z2oxR1QxWXR2c1F0bDJGcVlYME94VXBHaFA1WXhKMy9PNWJm?=
 =?utf-8?B?UWNqeXROTnJHNzZNVUUzQllQQzhTSWFxLzMyM2Vud21Zek1GTGNWQ1NuQVIy?=
 =?utf-8?B?eDhkT3Qyc2Z3RG9KMVNHbGExK3Vrb0F3L1pVU2dRVW5DWmQ1NEJPR0N2QXUr?=
 =?utf-8?B?WjBUall1VnlacWpGZkVLcUdpQVA4NjdCQmRxaXh5SG8yVzd0Q3ZIMlg0czBw?=
 =?utf-8?B?UHlTYnpWanNVaFJTbC85Ry9LWGhQTFM2dTFuZ2NlNGlLSmVJdUErTDJrS3Bx?=
 =?utf-8?B?WFRRUGtUV0p1aDFvNmxTL1BkbkdIWlNDRWFBWWJPeW1BUEk3N3V6aGp5Y2FF?=
 =?utf-8?B?RE02TFJobmtkbDV6ZkJvYzMzS0ppQnM3Sk11TjJ4dXl4N2ZsWUU0b05abmZw?=
 =?utf-8?B?WGtxRk1pdHc3YTNRcFcrZG5BV1VQS1lFa0Z4alpEZUczU1VMS1F1TGFLQVc4?=
 =?utf-8?B?UTV2ZGI4ZUU1N21kTlNlV0QzdFkwbVczM1NOcHFyYzdNTDV4V0xiZyt6WjUv?=
 =?utf-8?B?Q1VuZzBoR2pqY1ZzOEpCeC9IcjVKek5PbjRKeVNkR3paQmY0VVVMclFnS2h0?=
 =?utf-8?B?Mjc4UExiMi9UTDFWUklUeTliczMycXI0RnNXekdVYTRidUdPYTlGTUF5SjNO?=
 =?utf-8?B?c2VEY1YrSkczU05TQ0FPR3Z3dEZLVllwREplUmQ3YzZLWVd0K2cxMksyelpl?=
 =?utf-8?B?UVNDVVYzOURSL2JuNXkxdC9VMjI2c2pBdGR3a25oOHlBR1FZeDlwMU1Td0c1?=
 =?utf-8?B?cW9EMDBKakgvWUE1VW5LSDZSZ05vQUU5aDZQV3B5bEl5akgxYnNlSFlSa0hv?=
 =?utf-8?B?K0laUHhGL3A1TDl5UnJ5YUF4ZkNuYThpKzluMWcrMGM3dGt2UGhoQ1djc2Y1?=
 =?utf-8?B?Y3FoZVRHblQ1WHJwRG9palBlcEU4c3N1ZGdaVS9MbkdpcmpvYitLUUR1Q2to?=
 =?utf-8?B?Tm0zd3YzTWk0REJIUkpaTVMyQ3AyVGFDN09UWDNVSlpiczFCdktKRUNnTzA0?=
 =?utf-8?B?UDFCV21ZTnV2K2U4Uit3c2FFUWFob2JvM2dPMnc1RDduWHp2a3FlekY1Wm9m?=
 =?utf-8?B?QXppS3dmRTlsNHlKdHVWNDlxQ1h5cFRjQmEyWTE3bVVNQ3hnSjRUSWRqRXFD?=
 =?utf-8?Q?eDUg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bbd52c-b5ee-4259-8d79-08ddcdb53e2b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 09:00:47.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXqZpz5097h7uOLqWx94RXb7dDSpI6q8m9QFGCfZ5TzZ3hIQZFwb+mVbf97aqFZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9625

Many thanks Askari Alius for your careful review.

On 7/28/2025 1:54 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Wed, Jun 18, 2025 at 05:19:52PM +0800, Bin Du wrote:
>> Amd isp4 capture is a v4l2 media device which implements media controller
>> interface.
>> It has one sub-device (amd ISP4 sub-device) endpoint which can be connected
>> to a remote CSI2 TX endpoint. It supports only one physical interface for
>> now.
>> Also add ISP4 driver related entry info into the MAINAINERS file
> 
> You could rewrap the text and use the full lines here -- up to 75
> characters per line.
> 
Sure, will do in the next patch>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> ---
>>   MAINTAINERS                              |  10 ++
>>   drivers/media/platform/Kconfig           |   1 +
>>   drivers/media/platform/Makefile          |   1 +
>>   drivers/media/platform/amd/Kconfig       |  17 +++
>>   drivers/media/platform/amd/Makefile      |   5 +
>>   drivers/media/platform/amd/isp4/Makefile |  21 ++++
>>   drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>>   8 files changed, 229 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10893c91b1c1..15070afb14b5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1107,6 +1107,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>>   F:	drivers/iommu/amd/
>>   F:	include/linux/amd-iommu.h
>>   
>> +AMD ISP4 DRIVER
>> +M:	Bin Du <bin.du@amd.com>
>> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media.git
>> +F:	drivers/media/platform/amd/Kconfig
>> +F:	drivers/media/platform/amd/Makefile
>> +F:	drivers/media/platform/amd/isp4/*
>> +
>>   AMD KFD
>>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>>   L:	amd-gfx@lists.freedesktop.org
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index 85d2627776b6..d525c2262a7d 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>>   source "drivers/media/platform/verisilicon/Kconfig"
>>   source "drivers/media/platform/via/Kconfig"
>>   source "drivers/media/platform/xilinx/Kconfig"
>> +source "drivers/media/platform/amd/Kconfig"
>>   
>>   endif # MEDIA_PLATFORM_DRIVERS
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>> index ace4e34483dd..9f3d1693868d 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -32,6 +32,7 @@ obj-y += ti/
>>   obj-y += verisilicon/
>>   obj-y += via/
>>   obj-y += xilinx/
>> +obj-y += amd/
>>   
>>   # Please place here only ancillary drivers that aren't SoC-specific
>>   # Please keep it alphabetically sorted by Kconfig name
>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
>> new file mode 100644
>> index 000000000000..3b1dba0400a0
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: MIT
>> +
>> +config AMD_ISP4
>> +	tristate "AMD ISP4 and camera driver"
>> +	default y
>> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
>> +	select VIDEOBUF2_CORE
>> +	select VIDEOBUF2_V4L2
>> +	select VIDEOBUF2_MEMOPS
>> +	select VIDEOBUF2_VMALLOC
>> +	select VIDEOBUF2_DMA_CONTIG
>> +	select VIDEOBUF2_DMA_SG
> 
> Do you need all these three? Most drivers need only one.
> 
After double check, yes, none of theam are used in our code, will remove 
them and also the header files included>> +	help
>> +	  This is support for AMD ISP4 and camera subsystem driver.
>> +	  Say Y here to enable the ISP4 and camera device for video capture.
>> +	  To compile this driver as a module, choose M here. The module will
>> +	  be called amd_capture.
>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
>> new file mode 100644
>> index 000000000000..76146efcd2bf
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Makefile
>> @@ -0,0 +1,5 @@
>> +# Copyright 2024 Advanced Micro Devices, Inc.
>> +# add isp block
>> +ifneq ($(CONFIG_AMD_ISP4),)
>> +obj-y += isp4/
>> +endif
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>> new file mode 100644
>> index 000000000000..e9e84160517d
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -0,0 +1,21 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +#
>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>> +
>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> +amd_capture-objs := isp4.o
>> +
>> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>> +ccflags-y += -I$(srctree)/include
>> +
>> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
>> +	cc_stack_align := -mpreferred-stack-boundary=4
>> +endif
> 
> Uh... does the driver actually depend on this?
> 
Yes, other comments also mentioned this, will update in the next patch>> +
>> +ccflags-y += $(cc_stack_align)
>> +ccflags-y += -DCONFIG_COMPAT
>> +ccflags-y += -Wunused-but-set-variable
>> +ccflags-y += -Wmissing-include-dirs
>> +ccflags-y += -Wunused-const-variable
>> +ccflags-y += -Wmaybe-uninitialized
>> +ccflags-y += -Wunused-value
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
>> new file mode 100644
>> index 000000000000..d0be90c5ec3b
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,139 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
> 
> Alphabetic order, please.
> 
Sorry, seems it's already in alphabetic order, an example in 
drivers/media/v4l2-core/v4l2-ioctl.c is like
#include <linux/v4l2-subdev.h>
#include <linux/videodev2.h>

#include <media/media-device.h> /* for media_set_bus_info() */
#include <media/v4l2-common.h>
Suppose i can add an empty line before #include <media/v4l2-ioctl.h>>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
> 
> Unused.
> 
Yes, other comments also mentioned this, will remove it in the next 
patch>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +/* interrupt num */
>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>> +	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +};
>> +
>> +#define to_isp4_device(dev) \
>> +	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
> 
> No need for the cast.
> 
Sure, will remove the cast in the next patch>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +	struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
>> +
>> +	if (!isp_dev)
>> +		goto error_drv_data;
>> +
>> +error_drv_data:
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +/*
>> + * amd capture module
>> + */
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct isp4_device *isp_dev;
>> +
> 
> Extra newline.
> 
Yes, other comments also mentioned this, will remove it in the next 
patch>> +	int i, irq, ret;
> 
> unsigned int i?
> 
Weired, no compile warning about this, will change it to size_t i in the 
next patch.>> +
>> +	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>> +	if (!isp_dev)
>> +		return -ENOMEM;
>> +
>> +	isp_dev->pdev = pdev;
>> +	dev->init_name = ISP4_DRV_NAME;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>> +		if (irq < 0)
>> +			return dev_err_probe(dev, -ENODEV,
>> +					     "fail to get irq %d\n",
>> +					     isp4_ringbuf_interrupt_num[i]);
>> +		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>> +				       "ISP_IRQ", &pdev->dev);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
>> +					     irq);
>> +	}
>> +
>> +	isp_dev->pltf_data = pdev->dev.platform_data;
>> +
>> +	dev_dbg(dev, "isp irq registration successful\n");
> 
> Please leave this out.
> 
Yes, other comments also mentioned this, will remove it in the next 
patch>> +
>> +	/* Link the media device within the v4l2_device */
>> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +	/* Initialize media device */
>> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>> +		sizeof(isp_dev->mdev.model));
>> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +		 "platform:%s", ISP4_DRV_NAME);
>> +	isp_dev->mdev.dev = &pdev->dev;
>> +	media_device_init(&isp_dev->mdev);
>> +
>> +	/* register v4l2 device */
>> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +		 "AMD-V4L2-ROOT");
>> +	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "fail register v4l2 device\n");
>> +
>> +	dev_dbg(dev, "AMD ISP v4l2 device registered\n");
> 
> This doesn't seem useful.
> 
Yes, other comments also mentioned this, will remove it in the next 
patch>> +
>> +	ret = media_device_register(&isp_dev->mdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to register media device %d\n", ret);
>> +		goto err_unreg_v4l2;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, isp_dev);
>> +
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_enable(dev);
> 
> You'll need to enable runtime PM before registering any interfaces on UAPI.
> Same goes for setting driver data for the device.
> 
Sure, will modify in the next patch>> +
>> +	return 0;
>> +
>> +err_unreg_v4l2:
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +	return dev_err_probe(dev, ret, "isp probe fail\n");
>> +}
>> +
>> +static void isp4_capture_remove(struct platform_device *pdev)
>> +{
>> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> +	struct device *dev = &pdev->dev;
>> +
>> +	media_device_unregister(&isp_dev->mdev);
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +	dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
> 
> I'd say this is redundant.
> 
Yes, other comments also mentioned this, will remove it in the next 
patch>> +}
>> +
>> +static struct platform_driver isp4_capture_drv = {
>> +	.probe = isp4_capture_probe,
>> +	.remove = isp4_capture_remove,
>> +	.driver = {
>> +		.name = ISP4_DRV_NAME,
>> +		.owner = THIS_MODULE,
>> +	}
>> +};
>> +
>> +module_platform_driver(isp4_capture_drv);
>> +
>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>> +MODULE_IMPORT_NS("DMA_BUF");
>> +
>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
>> new file mode 100644
>> index 000000000000..27a7362ce6f9
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_H_
>> +#define _ISP4_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-memops.h>
>> +#include <media/videobuf2-vmalloc.h>
>> +
>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>> +
>> +struct isp4_platform_data {
>> +	void *adev;
>> +	void *bo;
>> +	void *cpu_ptr;
>> +	u64 gpu_addr;
>> +	u32 size;
>> +	u32 asic_type;
>> +	resource_size_t base_rmmio_size;
>> +};
>> +
>> +struct isp4_device {
>> +	struct v4l2_device v4l2_dev;
>> +	struct media_device mdev;
>> +
>> +	struct isp4_platform_data *pltf_data;
>> +	struct platform_device *pdev;
>> +	struct notifier_block i2c_nb;
>> +};
>> +
>> +#endif /* isp4.h */
> 
> Use the same name as for the macro here, please.
> 
Yes, other comments also mentioned this, will modify in the next patch

