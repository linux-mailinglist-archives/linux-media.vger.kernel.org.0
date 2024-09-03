Return-Path: <linux-media+bounces-17424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D899691A2
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 05:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D96B5B20A6F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 03:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E091CDA3D;
	Tue,  3 Sep 2024 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="aB1Jo4Wh"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2111.outbound.protection.outlook.com [40.107.117.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F311A4E6A;
	Tue,  3 Sep 2024 03:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725332612; cv=fail; b=cDk8mK5VGRK/6DwiBZ5UMqx0WzASBwZxREZz9VBu73nAc1UK4ULfv4a+AxE78ACQQ6IIvaX6HGqZDdRN6+yRiuxL73FdQVm0RYCwuiw6/QEBdgrI0thGjEcO8WCIofguf49b0MtFFuuv+ubYCB8Jex/SFVnlI9D4LQl3R7/891s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725332612; c=relaxed/simple;
	bh=Y2Qf52pIXu8Nti0xcIQkCyIBknXno8+4hacH8PRUEo8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qpTIC4ocDRQiD9Cv0YND9/IUIYQW5b2lv2bDj9vuUOL38C/AnoKUH1xPu2e1vDX5neglko2i10Xr/IOj+OKw+4/hlBBgVmYjoGZGe4FT2BL3ussjmH0J84lIMQ06e4VGhXBtfMOygoWMxTaFpyoMiUHYl321KBh3nXb0BImXLo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=aB1Jo4Wh; arc=fail smtp.client-ip=40.107.117.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzSVoZAQyMXgqCpE7OoZF1Am20ZTVFkNfbNBaEKOF5CS5XWMk1FBBu7RG1unl9YmeLTfZMuP6M6pfKBWQkoC+xuQAKQzycm9JwWpyiYwDo0JTTKk0aEchILn/FE9iqaNQeP7+jufL6bDXTUwa+XEhTVUxAsIc6zs3Wl9QojBFo9R2MG8XEWGT2Gfb9OZWVfSK2eRhs1wx0BJ5IBx5r7+5aJP26Nzn5SRykXygg46iy+U3sneZaJQYHWPoSuJyAz/jUHVBbwG+lo2wO2J5m6/MHOe7mpBt2ubjukRkNIzfWEGRmHrO5mkjShjLJd3kIn/mzk3nrXBOGralOvO8egrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSV1NrP3gWp0ilb6ekhsrKHmPgjPew0H7NAzODRvZKc=;
 b=aSJUSQDv+U1wtCHB1KwMsOC26IELAgjUfhy2rIESxZ5mdDCqC5XDQZqJJkGFsWD3xKzTldN0MG6oBREVevu8lBhapV4v4ta/UpxKWFDf2CO9Z4NpyNqjMLTPl2Fw0DEakx0ixoMojKBKW8u5Y38sq8+i2O4XqGQSxrX3TvsHpZgvHnqxiRbAE1JJaoO+L9H8+xV8655f/75mqwhRwKnytvmO/qOBP+x7uCQ81ogOiqzAnoJXCFFNid01AiKCs+iwp2qJG6hzCuCd5R1w8rUjY2JBnLZl8m0EXfuGfr8Hu+37fT/Tt/M4Kovr+kAua0GH2tU2X4DbGgHo8MkaZANZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSV1NrP3gWp0ilb6ekhsrKHmPgjPew0H7NAzODRvZKc=;
 b=aB1Jo4WhWMQgFX9y5gysWpnLVKFhIwK85WcITPyNhEBff9R8zDyd940zeLKTQxbP9A1i4ShNHuWPaj7u0sch50P3fx0bwU0vQcFtuToqAWXnJEkMnixQT5NeQJv1vm6+TZSCTMWC0qycwkXfSXhE/XffD5umPS1+eLS4VxeA+hI7ao1fwU0a1/eSJmoNvtGAharRWg/mNMU90Kcr+a7tOus7Z2IJdBl6iAEn8Q94IAeLyL/GAYeC9rpMlqHKX5rjX+LXWSrcsXaOG9nBnsoef5S+qltItjGLVYShCp4vxQoNwb4s5vHwd+uGch0BMqx0OSJJo5rc7s5FCroOs9KNRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SI2PR03MB6512.apcprd03.prod.outlook.com (2603:1096:4:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 03:03:24 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 03:03:23 +0000
Message-ID: <9b194be4-8a58-419c-b25d-fb1895cbb6ac@amlogic.com>
Date: Tue, 3 Sep 2024 11:03:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] Amlogic C3 ISP support
To: kelvin.zhang@amlogic.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com
References: <20240903024127.5834-1-keke.li@amlogic.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20240903024127.5834-1-keke.li@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:3:18::32) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SI2PR03MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 750c9533-5060-4974-0036-08dccbc4f958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE82MXo2c2FlRTFhOWF2cVZQS1lzbUFETUlZdHFBUTZjYUw4ZHZvb2pxdkdz?=
 =?utf-8?B?SUR5K3poaGtrMW1SRmkxbFNVN3N0K1pRNUx0Q0U5Mm1STUxXT2lIVlowRXlq?=
 =?utf-8?B?dmI1N0p3THYwTURNMXBrUEFMUkdma2ZNSUJuLyt2TDZzTkxJd3pKZHl1dTJj?=
 =?utf-8?B?YU4wcmVvLzREd29Wc0FKUEhDSjgvYzMrWjFybjZxVTNYLytPOHluLzJWZ0Nh?=
 =?utf-8?B?WU9GNER4aWt2QTl5V2RiNFAzRmIwd3dYa2JzNTl3cTRtbW9iUjdNYXVsZGg0?=
 =?utf-8?B?aVdjWDFudjl1WnVlK1plSUdNaVBEOThaVGVZSjE5MG1EL2ZvYlQxenpIeU9q?=
 =?utf-8?B?MFZOWmJrRDhKMGNxdXl3Vy95UDlTaTc3NWR0OGJ6c0hvOE5aQ3Z0Y1h0dlk5?=
 =?utf-8?B?RWlmbHVNRDE4Tlk3RXBEdUJJNFlUTGJKSFZ5bG9pWmdBdTRyb1ZuQ3Y0d0VC?=
 =?utf-8?B?a1dld1BKOVdZdXhGY1hDazdsaGZ5dUpwV2NjaFRYa0RkRE9pREp4RWQyak1Q?=
 =?utf-8?B?SzVialg3VUcwNkNoY1VkVEZEcWdRUEdPRDQwanVBNHc3Wit3MFdydi9YdjVG?=
 =?utf-8?B?K1gzTjNtT1pxT0ZpRzFCV1dKajltczZxNDFWU0UydHo5aU40b3VhYVhaMUFH?=
 =?utf-8?B?TVhZWTB6dkNKNThVcm1oVHBTSTViNlBEbTQrYzFZcmpwMVI5NkZUdkI2UFZW?=
 =?utf-8?B?ZWZQL0VWQnpQY2YwVXhMcE9hMmVwdXlYcFBRd0NWS0w3YXVPTzlnWm1NUnFB?=
 =?utf-8?B?TnVFamRNcVJuV0hNYVEzOXhUa1huYVVCeTR0NnBOcHk4RzZhTTNPMTNrc1hS?=
 =?utf-8?B?TWJxQkVoRmFYYkxNUFE4azk5b0VvalpoL1Y4MWlBS2tnZ3pYcFNmK0RNWlRa?=
 =?utf-8?B?ZWNLNE5HWllTemxzTHg0K09CelFuYy93WVBvYnpNSm5UODNLQmJwdjkraTZK?=
 =?utf-8?B?Ymo4WFVmdEJzdmptakFoRjR5SjAxbC9EWWxZRnV0RVBSQlhxdGdNMElvbXd1?=
 =?utf-8?B?WC9EbE9YRHFWU3JpdnJPSnFtUFRyNTN4M1psZERwWllEVjY0UkpNbDEvdmI2?=
 =?utf-8?B?UUM3Qm85dFFqRG5GcnhjSnE4R0hOWi9iVzVRMkNzNXhnM3VSWUY0clBiSENY?=
 =?utf-8?B?aUpaaWV2RE5TcEgvZHFxTVp6bkpoRGtyUEM4TjNGb3R5RmlCSEZpeHZqNWpp?=
 =?utf-8?B?aWY0c3AraXJNUThWZXUzMERPVUIrQ1hTMk50MW9tZ0Nvc3g1Wm02ZXMvNk9U?=
 =?utf-8?B?TkEvYjA5MnQvL1B4NVQ3eTBUMm9uYnhMZDZTNFQxT0RhMktGSHhrSHM0WU4r?=
 =?utf-8?B?T0lESGE2dlRCbEs4RGdFMXlRWVZIU2pkaE9RVmdWTkg0NzRHQURjNzlGckE4?=
 =?utf-8?B?OFNISk5ZTGxpcTZsVE90QTFPUTF1KzNaSHJpK214bysrb1R3OVNtMEVmTWV5?=
 =?utf-8?B?VWhHd3BSb2Y3VWNrMTI1RjVPU2V6cEp4Y3BrbEZhbVlOWlk0Sm1KeUtGTWZ5?=
 =?utf-8?B?VG9sN3dYYk1ER1NlWkpEaUpqbXVEVUE2dEJhZVpvczhLOXBwejQyTFd4bytF?=
 =?utf-8?B?b1dDVFJwTkhTMGpOOWJsUVFCOXdUY3M5cFVybDgzeENNMTZJS2ZNVEJSdG1J?=
 =?utf-8?B?ajQzMkdPQmgyaDZVZkZZRVYvVVJPc01ZbkROL0czcjRDb3pzcDh2ZG1FTVY3?=
 =?utf-8?B?RHNlN1ltekh4T1ZwQUpTZlV1ditOdVNZMkM2bjIzUE9hWHIzYkxpb3VCTlVk?=
 =?utf-8?B?VmhjeDJGZnRLQ09aR0JHeVJGRVQ0V1JUL2krSTgxMkp0WmMxenVKbTN6cFpj?=
 =?utf-8?B?bDMvMkZsYS9Za29BZjNpUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVFodW0xa1FJQ2VvbnJuSmU4ZUNjdS9uSUJVZmRybUtYZ2Y5djlPdDNyd2VH?=
 =?utf-8?B?M1J2VWM3UGYvVUxwNjhORlNtVGdBU1hFbWEyNmhqZzllK0FOUGM4NlRJOTZa?=
 =?utf-8?B?OEMyZWJvMTJEa29HQXpMTGNCRlBPL0dqVUJZSFlLU2tSQzVnbGw2NXQyZ1Vo?=
 =?utf-8?B?SkxmWXdjN0RwQ2gvRDNqNWU2RExLcFFhbm5FNkxYa3FQS0E5NDRNUkdIQlBy?=
 =?utf-8?B?MnR1K2V6MzkrUURXVVRLeS9BWnhsY080Vit0ZG9xWHo0WnVlTXNSeVFHYUph?=
 =?utf-8?B?eHJXYkZNZXZXV3JsWWl5dUVNQTEvanlScnBqZU1kUlhDTVJ1Y2JRLzBHZ1lN?=
 =?utf-8?B?aEYyM29Qd1lWUlhCRjBBNHkycUR6WGdPSk92MVh5U2hWQ3FZcXF0eWNmUGRZ?=
 =?utf-8?B?cmlxUG9FaitmUGV1REh5U2RoU0p5cXFEamg1QWdLSDB6NU42Tkc3b1RKeFpB?=
 =?utf-8?B?M1BDUEZnazR2dWVVaUV2bFJjRUhsMjN6bktVb0JNR2FzcFZLVm1lclJnUVpF?=
 =?utf-8?B?cnJoem5SRXVDWDdiZnFQVGpYWWVoMktnMmptOW9aNnFPaVBJVHdzbWtIbVN2?=
 =?utf-8?B?R3pWTHd5Tjcza1FDUU9BWVE5UXZUY2NTNFVtS1J1YVV0Ymp5ekVjQllncklY?=
 =?utf-8?B?aEpPblJpM01qYTY4WWY4TzJxMjJHWnovazhrNWJ6QS9xTndZcEx1cnJWNC9a?=
 =?utf-8?B?dXNOVWkwTHppdmhPaFVERmFENkRzQnBqYURZS2hxVXJnVzQ1NFhpZkllZ2tV?=
 =?utf-8?B?eDJNSTNQRUdpODJZLzh6YTRrOWxtcG9tMy9iNnVqRHQ5amFIOW9HZDNmWU1G?=
 =?utf-8?B?Y3VocW5JNlRoVHZIYzQzRlJseUZDSnJGanZuSFpidjhnTi9jTWxhbTczOFZ6?=
 =?utf-8?B?Q3pQWW1GV3gzZUZKSGpPYTVYRXFXU3lGNU13dTJPeWExaDIrYit4SldMaElh?=
 =?utf-8?B?UE8vUDhNVkRnZUI5OVZScHRSaEtpRzhHcWpEQnZyUGNqQjRjK3RDa2JKcmxs?=
 =?utf-8?B?ZVVpWDdxZ3JnZ21RTjZXL3QrNVltSVFDZE43Z1hlWThUWjQ2L1NYa0FtK2xr?=
 =?utf-8?B?OWtEZzV2SjRUcXdPUGFaWnphQkxFd2REZ0NkQnhCRElGUUR1NXVmWUVMb1VW?=
 =?utf-8?B?bHJtaWllYVVsTmJPRFZuN2d4Mkx6eUY4THBuU282YllqR2h5VDdrcFcwV0hv?=
 =?utf-8?B?RnFxM3BoSlIxWVQvL3R0b0ZCYVNUc1NwYkxkZ29OMGNSRkZEdkEwNmFmWkdR?=
 =?utf-8?B?S1ZYSCtPSzF1UXBSZXRsaVQ1QUowY1YwQjNISU0zTUhjLzBkbXBaOU9SZ1Er?=
 =?utf-8?B?Y0R1SzF5c1RMR3pTZVpSR2diaG93VmNmWWhzYzAzT0ZwWlBPdFA1bENNWGU1?=
 =?utf-8?B?bmRMcmNuNHkwUjBqR1NLc2dqa0ljZldKVzJmS2FaZEovdVhIdUY0emlOV1lB?=
 =?utf-8?B?dUs0SnV0ZzNJV3JVY3FPL2tQVHJ1aUFqbVpCUTAxaTREVkIveGJYUHVUR0Vp?=
 =?utf-8?B?a1RuMGlHQTk5QmU5aU5yMklwOGpTQ1ZHMjVDUld1YmdRSnMxa1k4TmVUQzk4?=
 =?utf-8?B?VDBQa3I5TDJSK2dYWmg3L0lJVkhXUzB1emdsRXRQcStKSm9GMFFwYTlVaExk?=
 =?utf-8?B?QWFIaFpMWFJQakQ0L3QxS2czOHZpMmExYnV5ZEtWb1Zzc3RxNm1sT2kyeERT?=
 =?utf-8?B?WlJ1MGtveXFVNWk5ZmZkWlZ5Y25QVWwxS0NLZ3M5S3hmSFZubFlHcmpCcTRS?=
 =?utf-8?B?ejIyVTlpRGNsYVo4MjJ6WkpSWXUrdVZqRFEwdzN0OXpDa0dISGFYc2lKUHlo?=
 =?utf-8?B?MGJqQ1o3bVJhSUpUT2dTbSthblB2Y21qUUNNVlJXSVNkZlFtVlJHVE9LVm9s?=
 =?utf-8?B?VnVRazM2VkZxb2syb3J1cmV0RHFUV3V3elphM0ZzazdMOUlaYm12bk40OVQ2?=
 =?utf-8?B?RlQwc2tzWTgrdDZXUWcxMW1PUk10ditkL3FwTVFKZ1ZvWENWckRZSmh2SDNp?=
 =?utf-8?B?Qkt1Wk8vQnNrVzFaWE5qYmJUTUV0UHFiQ1M0MExieFpEVkxxRlZxRzZhVzlT?=
 =?utf-8?B?bktJdFR3MlZha2tuMFc0OW9TeWdQOFhobGVybFlCNmxGUENaNHZ0NThZcDNo?=
 =?utf-8?Q?pdaCE7irEVcZug1cnj4WtFZyL?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750c9533-5060-4974-0036-08dccbc4f958
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 03:03:23.8636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGwTof8VsJtGS35vSUOlJMnRuxTaDr1hiFi8ENkE1Ap+y0z8ny2S6g8djxoyE+9dfdxJHxexw26G0No9tJh+1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6512

Hi all,

   Sorry, it was my operational error. Please ignore this email.

   Thanks!

On 2024/9/3 10:41, Keke Li wrote:
> The Amlogic C3 platform has an integrated ISP capable of supporting
> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
> 14 bit raw RGB Bayer data.
>
> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
> an adaptor layer which integrates the inline processing from the PHY to
> the ISP, and the ISP driver itself.
>
> As modular hardware components, these are split to separate drivers in
> this implementation and are expected to be expanded to support different
> platforms in the future.
>
> The test result of v4l2-compliance:
>
> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>
> Compliance test for c3-isp device /dev/media0:
>
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
>
> Required ioctls:
>          test MEDIA_IOC_DEVICE_INFO: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/media0 open: OK
>          test MEDIA_IOC_DEVICE_INFO: OK
>          test for unlimited opens: OK
>
> Media Controller ioctls:
>          test MEDIA_IOC_G_TOPOLOGY: OK
>          Entities: 12 Interfaces: 12 Pads: 20 Links: 23
>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>          test MEDIA_IOC_SETUP_LINK: OK
>
> Total for c3-isp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video0:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000011
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x0000000f (15)
>          Name             : isp-cap0
>          Function         : V4L2 I/O
>          Pad 0x01000010   : 0: Sink
>            Link 0x02000023: from remote pad 0x1000008 of entity 'isp-resizer0' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video0: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video1:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000015
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000013 (19)
>          Name             : isp-cap1
>          Function         : V4L2 I/O
>          Pad 0x01000014   : 0: Sink
>            Link 0x02000027: from remote pad 0x100000b of entity 'isp-resizer1' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video1: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video2:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04200001
>                  Video Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000019
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000017 (23)
>          Name             : isp-cap2
>          Function         : V4L2 I/O
>          Pad 0x01000018   : 0: Sink
>            Link 0x0200002b: from remote pad 0x100000e of entity 'isp-resizer2' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video2 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video2: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video3:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x84a00000
>                  Metadata Capture
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04a00000
>                  Metadata Capture
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x0300001d
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x0000001b (27)
>          Name             : isp-stats
>          Function         : V4L2 I/O
>          Pad 0x0100001c   : 0: Sink
>            Link 0x0200002f: from remote pad 0x1000004 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video3 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video3: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/video4:
>
> Driver Info:
>          Driver name      : c3-isp
>          Card type        : AML C3 ISP
>          Bus info         : platform:ff000000.isp
>          Driver version   : 6.11.0
>          Capabilities     : 0x8c200000
>                  Metadata Output
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x0c200000
>                  Metadata Output
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000021
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x0000001f (31)
>          Name             : isp-params
>          Function         : V4L2 I/O
>          Pad 0x01000020   : 0: Source
>            Link 0x02000031: to remote pad 0x1000003 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/video4 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>                  fail: v4l2-test-buffers.cpp(703): check_[  123.995890] isp-core: =================  START STATUS  =================
> [  123.996714] isp-core: ==================  END STATUS  ==================
> 0(crbufs.reserved, sizeof(crbufs.reserved))
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/video4: 46, Succeeded: 45, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev0:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000041
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x00000001 (1)
>          Name             : isp-core
>          Function         : Video Pixel Formatter
>          Pad 0x01000002   : 0: Sink
>            Link 0x02000036: from remote pad 0x1000035 of entity 'mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
>          Pad 0x01000003   : 1: Sink
>            Link 0x02000031: from remote pad 0x1000020 of entity 'isp-params' (V4L2 I/O): Data, Enabled
>          Pad 0x01000004   : 2: Source
>            Link 0x0200002f: to remote pad 0x100001c of entity 'isp-stats' (V4L2 I/O): Data, Enabled
>          Pad 0x01000005   : 3: Source
>            Link 0x02000025: to remote pad 0x1000007 of entity 'isp-resizer0' (Video Scaler): Data, Enabled
>            Link 0x02000029: to remote pad 0x100000a of entity 'isp-resizer1' (Video Scaler): Data, Enabled
>            Link 0x0200002d: to remote pad 0x100000d of entity 'isp-resizer2' (Video Scaler): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev0 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 2):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 3):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev0: 72, Succeeded: 68, Failed: 4, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev1:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000043
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x00000006 (6)
>          Name             : isp-resizer0
>          Function         : Video Scaler
>          Pad 0x01000007   : 0: Sink
>            Link 0x02000025: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>          [  124.084364] isp-resizer0: =================  START STATUS  =================
> [  124.085234] isp-resizer0: ==================  END STATUS  ==================
> Pad 0x01000008   : 1: Source
>            Link 0x02000023: to remote pad 0x1000010 of entity 'isp-cap0' (V4L2 I/O): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev1 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev1: 58, Succeeded: 58, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev2:
>
> Driver Info:
>          Driver version   : 6.11.0
> [  124.130974] isp-resizer1: =================  START STATUS  =================
> [  124.131838] isp-resizer1: ==================  END STATUS  ==================
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000045
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x00000009 (9)
>          Name             : isp-resizer1
>          Function         : Video Scaler
>          Pad 0x0100000a   : 0: Sink
>            Link 0x02000029: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>          Pad 0x0100000b   : 1: Source
>            Link 0x02000027: to remote pad 0x1000014 of entity 'isp-cap1' (V4L2 I/O): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev2 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test V[  124.177400] isp-resizer2: =================  START STATUS  =================
> [  124.178270] isp-resizer2: ==================  END STATUS  ==================
> IDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev2: 58, Succeeded: 58, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for c3-isp device /dev/v4l-subdev3:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
> Media Driver Info:
>          Driver name      : c3-isp
>          Model            : c3-isp
>          Serial           :
>          Bus info         : platform:ff000000.isp
>          Media version    : 6.11.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.11.0
> Interface Info:
>          ID               : 0x03000047
>          Type             : V4L Sub-Device
> Entity Info:
>          ID               : 0x0000000c (12)
>          Name             : isp-resizer2
>          Function         : Video Scaler
>          Pad 0x0100000d   : 0: Sink
>            Link 0x0200002d: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>          Pad 0x0100000e   : 1: Source
>            Link 0x0200002b: to remote pad 0x1000018 of entity 'isp-cap2' (V4L2 I/O): Data, Enabled
>
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev3 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 1):
>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK  124.223764] mipi-adapter: =================  START STATUS  =================
> [  124.224637] mipi-adapter: ==================  END STATUS  ==================
> m (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for c3-isp device /dev/v4l-subdev3: 58, Succeeded: 58, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for device /dev/v4l-subdev4:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
>
> Required ioctls:
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev4 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for device /dev/v4l-subdev4: 43, Succeeded: 43, Failed: 0, Warnings: 0
> ---------------------------[  124.269696] mipi-csi2: =================  START STATUS  =================
> [  124.270587] mipi-csi2: ==================  END STATUS  ==================
> -----------------------------------------------------
> Compliance test for device /dev/v4l-subdev5:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
>
> Required ioctls:
>          test VIDIOC_SUDBEV_Q[  124.273752] imx290 2-001a: =================  START STATUS  =================
> [  124.274678] imx290 2-001a: ==================  END STATUS  ==================
> UERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev5 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for device /dev/v4l-subdev5: 43, Succeeded: 43, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for device /dev/v4l-subdev6:
>
> Driver Info:
>          Driver version   : 6.11.0
>          Capabilities     : 0x00000000
>
> Required ioctls:
>          test VIDIOC_SUDBEV_QUERYCAP: OK
>          test invalid ioctls: OK
>
> Allow for multiple opens:
>          test second /dev/v4l-subdev6 open: OK
>          test VIDIOC_SUBDEV_QUERYCAP: OK
>          test for unlimited opens: OK
>
> Debug ioctls:
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 12 Private Controls: 0
>
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK (Not Supported)
>          test VIDIOC_TRY_FMT: OK (Not Supported)
>          test VIDIOC_S_FMT: OK (Not Supported)
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
>
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>          test VIDIOC_EXPBUF: OK (Not Supported)
>          test Requests: OK (Not Supported)
>
> Total for device /dev/v4l-subdev6: 43, Succeeded: 43, Failed: 0, Warnings: 0
>
> Grand Total for c3-isp device /dev/media0: 613, Succeeded: 604, Failed: 9, Warnings: 0
>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kieran.bingham@ideasonboard.com
> Cc: dan.scally@ideasonboard.com
> Cc: laurent.pinchart@ideasonboard.com
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
>
> --- b4-submit-tracking ---
> # This section is used internally by b4 prep for tracking purposes.
> {
>    "series": {
>      "revision": 1,
>      "change-id": "20240903-c3isp-7cfe70bb2583",
>      "prefixes": []
>    }
> }

