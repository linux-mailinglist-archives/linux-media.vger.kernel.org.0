Return-Path: <linux-media+bounces-35228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC8ADFF2E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3C66189E549
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 07:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894E4248F70;
	Thu, 19 Jun 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uKio2SYP"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCCC248F68;
	Thu, 19 Jun 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319649; cv=fail; b=UBimlCl7gnkXefMDHJr2PCKiWR6TsBN+Sg4rCDbObhJZr8Hwnw8Tw0PtuWQbFGbzfQakBuzU2jMY1i7Z2+Ykq4n7xxfli8eZc0/Y82pbz60Tg3ANsUOIKV6yhvl1iBcGaq7FMtlyKMbzkRdpbOiIqVHo+Welg8h/8sD4vb8cZZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319649; c=relaxed/simple;
	bh=/bKhCOvoaZJ6IaDSMgqTMRf4JAW5fOKHhKr5FUtQiLg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RzeAjZPUN7L3u8quJGQcUKYtQEs+mF5rNc/Sm69OwUEbgg0J0XDiwNWOotmpM93Z3PQQQgLze4bsY1x4tfXidRtYORFARvUdBqlZWXS1Gq+dV3Ayh+96hKeqQG7z47DOP2OGBit06rt88uR/BP6nrxZb8v9lzAko/l5m154t8W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uKio2SYP; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvmU5zKiKaD0YM9CIExtEm+XUoF5QCW/WR+WcVwVIKkdT3Qcn/ViGpo05WmA70HrUK06s1/IFYOT9atlIusvpixhS4ZDDbACtOYHesK6JpiOsxGcFAE4n/xBfy6lJhn6Y+7t4QAu3zXAIAJsFtcfcyPKK2f6CxD+eXzkGnU6zDxbjQJMxo7sQhU8Nx1DOz83OVeR0NS5BgTbI61lt5sBG37YzjOMddaICr2ly6dCDkRoKv3coB1y9hrjft2j+y7qTjQ9iTCqIy4vwzHyNaBVqDYM4mkOKWA6045FZz/rv0mhSR2G8RQCpMhbdgwICa8NF/JITvfPNCKdKx6RfkI8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94WP99L8UuYu/xLW+aEx9EH9+TcqmcFwNJzuSIqS7Pc=;
 b=BFmGvuMOWz5Wvge95fNUwZLtFLxYIq7HB3hCvPDmXKLQc1EUZqPG3YPRpwCz78U/+1SudL5IH4HW8NPErzDDXl8ATYmxWEVkvbGmuOgGxi0QBxU4XFMQpICbcyKPRMGf352jG805iqZm8NJT+mbb/hujEVvdiwlnGrPDTXANeVuzx5UBkHZc5B+x0k32PfeRldz3gqr9ONRS56ri94EpPv35+zsPYRJ41+H/+5yEOD21lRBsosM9V8va6UuvIvs/j4qgn/zcsZcimXRtHUIbGZFVHI1Bmrn+yXc+9Gpyk5kaWIGHo/Aiwv7BJ7Y+G3OnXaKxoRk4b7QE76BOCmh7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94WP99L8UuYu/xLW+aEx9EH9+TcqmcFwNJzuSIqS7Pc=;
 b=uKio2SYPo4iyNrSlJBvYaQNPZkmo6d7gGwkwVI+SZrA/5Fgw9saJmg47zmrQQBLMStstrU8gve11DZH+U05gWL+HLkM0BvvAG8l8phFssyaQ70xZwEbRu0qCrZcS8k8HLG8PE4IQX0tc/bSRw1HZoIQDm39mfXpLw/nk9UHGfGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:54:02 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Thu, 19 Jun 2025
 07:54:02 +0000
Message-ID: <f6b609a4-d340-499d-ae0a-935e00e69a4a@amd.com>
Date: Thu, 19 Jun 2025 15:53:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: platform: amd: low level support for isp4
 firmware
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-3-Bin.Du@amd.com>
 <9aa3dffa-ded6-42f8-a87b-33ba986311d1@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <9aa3dffa-ded6-42f8-a87b-33ba986311d1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0024.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::9) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4a0a3c-80dd-4869-e6c5-08ddaf0674f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXNueG52YmVnM0EwMFI0RmZaZ0Yxa2lRVWlBMWIrL2dxdnVEeVJ4T3RrVXZY?=
 =?utf-8?B?Wi9NaTdvTWszcFllQy95Q05DaHF2cFVYeVdzelNzVGRnbHlZd3BwdU5mb0tK?=
 =?utf-8?B?MStyZGdiTFhnbmRuZjJjR21OWVlFMVpLajd1d28zUVB0R0lmWkVTTzNCVGYz?=
 =?utf-8?B?ZGo2ZXJXZGNDNmVleEIzclJtSnU0R01DRjd4Skg5SjNkZjdHZ0s2KzVvVWlv?=
 =?utf-8?B?U1VPMlB2T3J2UGdUUytqR21PZVNWQ2g5ODAvd2dQOHhUc3VXRGlibjMyQjJs?=
 =?utf-8?B?Uk9uc3EvTHVhWGluSEcybnBRTmxvWDF0SlpvMXZiU3BsaTdzOGhZbTZOMjRX?=
 =?utf-8?B?cGh3Vm1SY0trWkxqM1lBLzhSUmM4WmRXc09wRmRDV2txRFRObFpiQ1l4Mk5q?=
 =?utf-8?B?WWNHK2FYN2NpcUl2WU1nV0xKS0tpd0pKNXBOeVdSdUs1b1NGOXNNcDdIbndv?=
 =?utf-8?B?cWc3U08yYzhpc3kwWmFsN3k4WmJ0Nkpub1B3ZWxjV2l1dmI0K2dDWXBVQ3Rs?=
 =?utf-8?B?cUdqaitGTitKN0xWNldDK0ZtUXBhN0IyRjZqeitoVTFBcGNwZllzOGFLWlUv?=
 =?utf-8?B?ZDRWZlhUelFCU1haR1NGMjhYeDZ6ODZHaFpITnlFelVDd3dGNzUxTHI4YmxT?=
 =?utf-8?B?aEdOSVFuVHk2NVlKWDRWYmVCOTJySWowdDFqT0YvZk5OYXdGaVVXZlFtUlJj?=
 =?utf-8?B?bG4xQWRsUy82ZkZqSE5PZWhJT25WU1hvQjYrRFlNWk5HdE84U24yY0FsTFJ6?=
 =?utf-8?B?bEpSWXIzN2hXWjV0QVI1VnRxREdadXFCSFZzR3R0di9RQWhzcDdXZTNVTE1I?=
 =?utf-8?B?bm5YaUpaK3FLVVp0ajV4cU1HSjE0cXNTU0VSQTNPdEc1dk1PYnBNT1JaZ1lO?=
 =?utf-8?B?ZnZjNXkzanF6akk4eEpNMDBxOVFKblpyQmZEYVVnKzhpUVpEaHVENDlqWG9j?=
 =?utf-8?B?azhQWEZIajEwb3lHOVNHbWhEMXhQRFk4MTdlL0xBYndDd0IrUXJTVjBvaElk?=
 =?utf-8?B?MjVtbER4TDBpN1h1cGt5ZWFPcmRpUFhDdWhoZXlNcDBRM3cvc0M1cmFjT2Np?=
 =?utf-8?B?SVIxNmwwVWNuR3d2RmFNYUFNUTBUdTBOSlAzMHNaWDh5Q0VaSFIvR0hLK1F6?=
 =?utf-8?B?QUtGMEdvT3VkOG13WkRUY1kxS3NjQ2hQZTU3SllENEZvVlR2cFRTWjE2MkZH?=
 =?utf-8?B?MnlRNDk3TENZTlFpUE84Qnc3Sk1oaFFac3kvZ05aUk52R1liSnNHNHpVQ3NQ?=
 =?utf-8?B?L1VMRnBqZGd0Zk5nVERNYUh6c0U5alRYazk2K3EwRk9DSVdJL0FHNXkrK2RI?=
 =?utf-8?B?ZW5qbHNLSmR1Q1FnZTYyQlJJWDZqbDdTMUJ6bUxYc2tLZ0pJcndLN0xseUw3?=
 =?utf-8?B?WitCL2o0Zm9GYTdYZVoyWHlneEdyL3RsNzZ3WHVjYWNsejZZN2ZDNTJvZnkr?=
 =?utf-8?B?QmRubjdaaGxjdEVLaGhrdFRXWVM5RHg2azVybDh6N0czbG1DMzFCZGRmTFVT?=
 =?utf-8?B?RExqMWtwRVZCNEh1aGRHZ28zaDNqVTNYaUdMSFEyOExLcjA1eWk0TnhXa0Nn?=
 =?utf-8?B?S2tmVVNIdThYcmVIZ3c2d3NWcWZxWTg5eEs3cXZwTUlRMXVqMDR1aDhrRXFj?=
 =?utf-8?B?akVPeUQzUXRYcndabGVTdDRuMXpYeWI1THpLTTE5ZGN3ZWhIWGxlaUlNTFlQ?=
 =?utf-8?B?YmZQL3JBMXNuMVBpa0FXbjNYUjl2T0RqY0ozWkxQN2Q5SzQzK1lBR0NCT2tP?=
 =?utf-8?B?MjRnUkVVUlFpNUNmZkNiSW1CcXFacVo1bkpBVHp1NVcrOUh4MDdIR05mVFl0?=
 =?utf-8?B?SnQrM3V0TFFqcmtOUWNXeFJhVXBUVHNSUTdDY29GTDh1VGFwTUpvTE8xeHN0?=
 =?utf-8?B?eDU4MDJCKzZyWElTNHNiRnZXTk1Xa29qNW45TktQbmxGM3VHeEk5UE9FVHRx?=
 =?utf-8?Q?NIhzrOGc45g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmYwajhqMjZBeENaMEpOR0hoaXRtdDkrbDUvdmhxSi9yMWwwNkxrWXRadmJi?=
 =?utf-8?B?NFdXY1QxZHJPK2swSlRHZGdQWHhBcDhMVWt5bmtybCtPVWxIYmVtRGJ1MzdS?=
 =?utf-8?B?N05jMGlCNkNmVnZLNnNjV1Y3ZHJRUjBUOXpmb1V0dzd0T1hHUGNkdXBBWHBG?=
 =?utf-8?B?dmRJemJHZERiSWdlWVh3bVZFYVU0TE9xNjBXUmxscGdhUW9ZeE15a0lVbFdL?=
 =?utf-8?B?anEvQmVybkNkT2ZhYUpRQTdHdHpvV2MxZlM5RlJkcktNSkdHYlF4S3RNWEQ5?=
 =?utf-8?B?Sk5qdXMrR2JmZlN3OGJIcXZBMENvaUJ5c1BPT0p0ZGg3dlhKU3EyUXNtYlpJ?=
 =?utf-8?B?cERhdXFTNCtVVEZ0eVBKRlYwaW14M0tTQUlSSHZzVE42WE0vMW5RaWRWVFVE?=
 =?utf-8?B?WU1TSm1RY09IaHdPT0p6UHlsUDhydE93akZqVHFsVUZOajk0SzFzbUI3L1Ew?=
 =?utf-8?B?clVyMWo4bzQ0TlhFN2k5amRRdjhCTnlhTkdCUm5Dc2RaZHF1VVU0b2pqSnBz?=
 =?utf-8?B?eVRaNFZBZ0dPaHlja1dydlB4eVFZUVJBRHdXOXRDM3R4dGVYWHhpZ2RYdUlp?=
 =?utf-8?B?TTFhdkxxSm1tekhHRDBscGVXZ01qSU1YYXh0K0I1aG5acmdUeTIrbkdoV1hw?=
 =?utf-8?B?OUV5cjRDeTJMQjdsNzdZVncycDBwdnY0MmRtNHpNZU9ENHFBY2ZqNmZxVWlY?=
 =?utf-8?B?alBHZy95SWx6eXFZYU8valljNGFSOFFEKzFTM0EwNktXRml6R1pmUXNtVTN6?=
 =?utf-8?B?bFdCNkp6bEVzOHlFUXRYRU1hRElBNkNybGhrOU1MNFppTDVESzNRK0RNTmFM?=
 =?utf-8?B?NXdlL1hDdVdjeTVOVkc0L0FYVzQ1M05QWTArYzZmcFhvaXJpcllSTFArRXN4?=
 =?utf-8?B?cVFWTUpNOGViYjFBN0wyaGxYOHZjdnNiNmVFOFBMOE9BR3RzcGNvRWV0TjRH?=
 =?utf-8?B?MnF2bUhXMk9XU2M2VWlnanE0bDJ1d0t3UjYyaisxdS9DN1M4dTdNM0ZNNXRu?=
 =?utf-8?B?VklMR0N4ZFNWczJyRHd4TFM3UUc0Si9Sa3U0ZWE3Mk5uQkQzWWtVSmREQlNa?=
 =?utf-8?B?cldyNjcwTldCdmh4Wkw3SzFueTV3aEdxTldUcjBiVWpYVHMwUWMrT0dXbXRx?=
 =?utf-8?B?eE9FcmFQbU4vYm10d2pBSXJrN2N1NEt2bllOODNrOXd2VkxTS2pSdmdiM1hX?=
 =?utf-8?B?VGVERHNJK0FnMEczTDlTZm1GMnlVMzAyRCtRTzkvcms5emZSalhpZkM0Z0lI?=
 =?utf-8?B?OURZRlRTV21WTjl2RE5BaCtIRXpSNXhDRm5YNVBaU3FYMStFVXg3K0JLaGNV?=
 =?utf-8?B?b3VtalRhV2pUNTNoUkVTQ2YwdjlJZ3RTaFRsWk45NXlZT2JCakJTSEpnQXZE?=
 =?utf-8?B?aVJNVVpudng5NThZQ0gzY1FPL01sRlVyQzNjSWhZWXNsSnRjUGhUTEVIdWZj?=
 =?utf-8?B?Q2FXbTEvUmpONzBWNXNQMGxaUTcyQXdHVnhsS1ZwSm1mRjhVb2ozTVNWVG1R?=
 =?utf-8?B?Nkp1MnpNVWJYT0NyQXFOd1lHTDNhVDFBL21JSmhxZjVjOWZyQXRoRG04ZlFQ?=
 =?utf-8?B?ZGV2a0o2VEdTdlNYOTJyck4ramZnWHB2eTBpeUNWNkJEcFNHUHdRNDhHWUtQ?=
 =?utf-8?B?S2hmR01JaGcxR0ljTEFiWFZqSm1tMm9ETHRMcWJTSEY0QkJlekpBeHFKd1RN?=
 =?utf-8?B?ZERlalNrUVV6SnBRcHFOcmZHd2tXZXRlenkrNGFGYUgyMlIwRHVXVnozS2ow?=
 =?utf-8?B?ZG5lbUR6bmM5YllBSE1GZTZkaVdoSS93eE9XMDV3UjFqbEQ1a0w1Q2J6WlB2?=
 =?utf-8?B?ekpZdWgzZnp0TUgwRDBFODJ1OFhQVndDbFZ3TzBxZE5takxtbklMOTl3Sjlu?=
 =?utf-8?B?YWk2dW5YdjhYTFYzaHlGN3dOY0JsdmhqRi9PaXRBRFJTU0U2Sm9GcitXY3JN?=
 =?utf-8?B?MHpKa1FIKzlDN043dGozSmh4eFZkMDdzQkNCMUpqc1g1UUdMUVBvVk1KVWZk?=
 =?utf-8?B?VUdFSy9mZ1JjWW83bmw5TmpOOWdqbTFVUlRYVDJpU1owMHRXYXg4YU4zdzl3?=
 =?utf-8?B?OUsyVHJtdHRMYlhEOFlMaHRZSmRsejQ1RGMvU25oVHh6WHdkVTV1ditSOTBQ?=
 =?utf-8?Q?MEqM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4a0a3c-80dd-4869-e6c5-08ddaf0674f5
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:54:02.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDFjhzaC2dWc7NYHf85aD8mJNLtjQI16A4qq/b21fcdSZFGMfn08C5Dv+J+sBTAn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190

Thanks Mario, will add the Co-developed-by in all patches in the series.

On 6/19/2025 12:00 AM, Mario Limonciello wrote:
> On 6/18/2025 4:19 AM, Bin Du wrote:
>> Low level functions for access the registers and mapping to their ranges.
>> This change also includes register definitions for ring buffer used to
>> communicate with ISP Firmware.
>> Ring buffer is the communication interface between driver and ISP 
>> Firmware.
>> Command and responses are exchanged through the ring buffer.
>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> 
> Same comment as first patch (and others), who wrote it?  Is Co- 
> developed-by missing?
> 
>> ---
>>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>>   drivers/media/platform/amd/isp4/isp4_hw.c     |  46 +++++++
>>   drivers/media/platform/amd/isp4/isp4_hw.h     |  14 +++
>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h | 116 ++++++++++++++++++
>>   4 files changed, 178 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/ 
>> platform/amd/isp4/Makefile
>> index e9e84160517d..8ca1c4dfe246 100644
>> --- a/drivers/media/platform/amd/isp4/Makefile
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -3,7 +3,8 @@
>>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> -amd_capture-objs := isp4.o
>> +amd_capture-objs := isp4.o    \
>> +            isp4_hw.o    \
>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>   ccflags-y += -I$(srctree)/include
>> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.c b/drivers/ 
>> media/platform/amd/isp4/isp4_hw.c
>> new file mode 100644
>> index 000000000000..e5315330a514
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_hw.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/types.h>
>> +
>> +#include "isp4_hw.h"
>> +#include "isp4_hw_reg.h"
>> +
>> +#define RMMIO_SIZE 524288
>> +
>> +u32 isp4hw_rreg(void __iomem *base, u32 reg)
>> +{
>> +    void __iomem *reg_addr;
>> +
>> +    if (reg >= RMMIO_SIZE)
>> +        return RREG_FAILED_VAL;
>> +
>> +    if (reg < ISP_MIPI_PHY0_REG0)
>> +        reg_addr = base + reg;
>> +    else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
>> +        reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
>> +    else
>> +        return RREG_FAILED_VAL;
>> +
>> +    return readl(reg_addr);
>> +};
>> +
>> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
>> +{
>> +    void __iomem *reg_addr;
>> +
>> +    if (reg >= RMMIO_SIZE)
>> +        return;
>> +
>> +    if (reg < ISP_MIPI_PHY0_REG0)
>> +        reg_addr = base + reg;
>> +    else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
>> +        reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
>> +    else
>> +        return;
>> +
>> +    writel(val, reg_addr);
>> +};
>> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.h b/drivers/ 
>> media/platform/amd/isp4/isp4_hw.h
>> new file mode 100644
>> index 000000000000..072d135b9e3a
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_hw.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_HW_H_
>> +#define _ISP4_HW_H_
>> +
>> +#define RREG_FAILED_VAL 0xFFFFFFFF
>> +
>> +u32 isp4hw_rreg(void __iomem *base, u32 reg);
>> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/ 
>> media/platform/amd/isp4/isp4_hw_reg.h
>> new file mode 100644
>> index 000000000000..b11f12ba6c56
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_HW_REG_H_
>> +#define _ISP4_HW_REG_H_
>> +
>> +#define ISP_SOFT_RESET        0x62000
>> +#define ISP_SYS_INT0_EN        0x62010
>> +#define ISP_SYS_INT0_STATUS    0x62014
>> +#define ISP_SYS_INT0_ACK    0x62018
>> +#define ISP_CCPU_CNTL        0x62054
>> +#define ISP_STATUS        0x62058
>> +#define ISP_LOG_RB_BASE_LO0    0x62148
>> +#define ISP_LOG_RB_BASE_HI0    0x6214C
>> +#define ISP_LOG_RB_SIZE0    0x62150
>> +#define ISP_LOG_RB_RPTR0    0x62154
>> +#define ISP_LOG_RB_WPTR0    0x62158
>> +#define ISP_RB_BASE_LO1        0x62170
>> +#define ISP_RB_BASE_HI1        0x62174
>> +#define ISP_RB_SIZE1        0x62178
>> +#define ISP_RB_RPTR1        0x6217C
>> +#define ISP_RB_WPTR1        0x62180
>> +#define ISP_RB_BASE_LO2        0x62184
>> +#define ISP_RB_BASE_HI2        0x62188
>> +#define ISP_RB_SIZE2        0x6218C
>> +#define ISP_RB_RPTR2        0x62190
>> +#define ISP_RB_WPTR2        0x62194
>> +#define ISP_RB_BASE_LO3        0x62198
>> +#define ISP_RB_BASE_HI3        0x6219C
>> +#define ISP_RB_SIZE3        0x621A0
>> +#define ISP_RB_RPTR3        0x621A4
>> +#define ISP_RB_WPTR3        0x621A8
>> +#define ISP_RB_BASE_LO4        0x621AC
>> +#define ISP_RB_BASE_HI4        0x621B0
>> +#define ISP_RB_SIZE4        0x621B4
>> +#define ISP_RB_RPTR4        0x621B8
>> +#define ISP_RB_WPTR4        0x621BC
>> +#define ISP_RB_BASE_LO5        0x621C0
>> +#define ISP_RB_BASE_HI5        0x621C4
>> +#define ISP_RB_SIZE5        0x621C8
>> +#define ISP_RB_RPTR5        0x621CC
>> +#define ISP_RB_WPTR5        0x621D0
>> +#define ISP_RB_BASE_LO6        0x621D4
>> +#define ISP_RB_BASE_HI6        0x621D8
>> +#define ISP_RB_SIZE6        0x621DC
>> +#define ISP_RB_RPTR6        0x621E0
>> +#define ISP_RB_WPTR6        0x621E4
>> +#define ISP_RB_BASE_LO7        0x621E8
>> +#define ISP_RB_BASE_HI7        0x621EC
>> +#define ISP_RB_SIZE7        0x621F0
>> +#define ISP_RB_RPTR7        0x621F4
>> +#define ISP_RB_WPTR7        0x621F8
>> +#define ISP_RB_BASE_LO8        0x621FC
>> +#define ISP_RB_BASE_HI8        0x62200
>> +#define ISP_RB_SIZE8        0x62204
>> +#define ISP_RB_RPTR8        0x62208
>> +#define ISP_RB_WPTR8        0x6220C
>> +#define ISP_RB_BASE_LO9        0x62210
>> +#define ISP_RB_BASE_HI9        0x62214
>> +#define ISP_RB_SIZE9        0x62218
>> +#define ISP_RB_RPTR9        0x6221C
>> +#define ISP_RB_WPTR9        0x62220
>> +#define ISP_RB_BASE_LO10    0x62224
>> +#define ISP_RB_BASE_HI10    0x62228
>> +#define ISP_RB_SIZE10        0x6222C
>> +#define ISP_RB_RPTR10        0x62230
>> +#define ISP_RB_WPTR10        0x62234
>> +#define ISP_RB_BASE_LO11    0x62238
>> +#define ISP_RB_BASE_HI11    0x6223C
>> +#define ISP_RB_SIZE11        0x62240
>> +#define ISP_RB_RPTR11        0x62244
>> +#define ISP_RB_WPTR11        0x62248
>> +#define ISP_RB_BASE_LO12    0x6224C
>> +#define ISP_RB_BASE_HI12    0x62250
>> +#define ISP_RB_SIZE12        0x62254
>> +#define ISP_RB_RPTR12        0x62258
>> +#define ISP_RB_WPTR12        0x6225C
>> +
>> +#define ISP_POWER_STATUS    0x60000
>> +
>> +#define ISP_MIPI_PHY0_REG0    0x66700
>> +#define ISP_MIPI_PHY1_REG0    0x66780
>> +#define ISP_MIPI_PHY2_REG0    0x67400
>> +
>> +#define ISP_MIPI_PHY0_SIZE    0xD30
>> +
>> +/* ISP_SOFT_RESET */
>> +#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK            0x00000001UL
>> +
>> +/* ISP_CCPU_CNTL */
>> +#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK            0x00040000UL
>> +
>> +/* ISP_STATUS */
>> +#define ISP_STATUS__CCPU_REPORT_MASK                0x000000feUL
>> +
>> +/* ISP_SYS_INT0_STATUS */
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK    
>> 0x00010000UL
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK    
>> 0x00040000UL
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK    
>> 0x00100000UL
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK    
>> 0x00400000UL
>> +
>> +/* ISP_SYS_INT0_EN */
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK    0x00010000UL
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK    
>> 0x00040000UL
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK    
>> 0x00100000UL
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK    
>> 0x00400000UL
>> +
>> +/* ISP_SYS_INT0_ACK */
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK    
>> 0x00010000UL
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK    
>> 0x00040000UL
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK    
>> 0x00100000UL
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK    
>> 0x00400000UL
>> +
>> +#endif
> 


