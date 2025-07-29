Return-Path: <linux-media+bounces-38616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B02B1494D
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 09:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE3D97AD800
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3846A26529E;
	Tue, 29 Jul 2025 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Fg53FRzo"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8825BEE7;
	Tue, 29 Jul 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775009; cv=fail; b=tgGroV16jPbuC6b7y6Fgt28K72L4PPLq7u0/vv+lRIk/01PVhGsNts2tfhNaz8XmF7yJkx3RnhDalVGvhm5Z9uQ98SN2xcoAouwYzHGF3bJckS08AQkhrr5K9gsYkU8KatKOxKtQzf2nJZjN1/zhSoW7jAUaVQkvlYdGHNw93Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775009; c=relaxed/simple;
	bh=pjDz5MCTUDQ4Z2prPb90/wBg3Ijq0r131cU4jf1zpSg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FwFo9JSsSOwHT8ba5UfejHsJLXt03GULc2S5WfKFGfDRjc3AgvXXBZyaB+dPyoSnJI/q6CCPuXq8LcT3OkYajSBXd1px9C2r78opY21elqnRia4PPPO5ZmzvPpT2hufoDIOUIguNX3qccNNeKVRXZbQgE3jiHLtvQ7xZ2oh/His=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Fg53FRzo; arc=fail smtp.client-ip=40.107.94.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THm//V7U49R/D3pSYD5WdpA/dmrMjs8u/wksp//z7eKdNWCvj9az8PoZuZNpLEJCxeuMzWwxY0DxwqJhdCwwGZQVN/K1TebSCD2kKTX5lzxaKxTxlkzX94n26sjOAmzdnHGQmzVYjjAIgvTOGz2y7E+B7Hd+X3qU2jNPrIrDFxod1WuMCyb0XaVhDxDGN5Xo/F7T7qL8BY0XZZhTvMzqH8NSkG1avz+m707C7y+r9jO1DRmrC+Z9DSprNhgmbJJadz9HUuyx8anX8TO+8HUlypipbwYQu1hUDc0ZxV23iYqtJeiKjf7VD9NGMq38z5DE+69G9xDyognXlL/Mf0LN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVFjPWWgkl4ZslGw2ZjDUq8249zI2KEaP7IKgOW08OQ=;
 b=BTIEZcc6uFmd/0r4pc0K+nRWHWz7f8o7eEJo5Q4BuspkKQVjbV5kOhiO480MgL4OMHkpll1PwkwM5rUdqd0i92N/NaTH9WSxs52YvzzgTKET4MqyXjxKcgWwsa+1ft6HBCjHAEbQ0adDQ9W0jLaH1yl0xdkFgWeTFfkrQG+4DX0Zd/PsMvVnkp0m1snUMsBGd21RbJduXL+6FUVMFGgcMc++fcXySAaZ712g+B6v3fUyY67qVk3ivxZPyvlg4xd2l8lpzmaoJ/in3lYG4oMFP4t+mytNA6qdTN3xdwvA5TNJx9HpkW/+YHUnTWPictBzTIbcYH5Uy4d28Miz20nHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVFjPWWgkl4ZslGw2ZjDUq8249zI2KEaP7IKgOW08OQ=;
 b=Fg53FRzomsk/MtLtF6z5Ks9NmMAWe+NztloVRkBd3MMdj+UMBvOZ30rdBTVPwIGqy8UtDgoMS+fKihppQVCxvASq74t5y0UXF0VXR3Wrl8+GDPdHJTWgU25dsZms8F85pzHX/U9iSF8etyZDb2EMAsd98FPreY9tvpPt+NpEDQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DS4PR12MB9708.namprd12.prod.outlook.com (2603:10b6:8:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 07:43:23 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 07:43:23 +0000
Message-ID: <7a422602-7a99-4b49-b994-cddd9730cb20@amd.com>
Date: Tue, 29 Jul 2025 15:43:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIchBRdmy48BHl2k@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIchBRdmy48BHl2k@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DS4PR12MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c65bae0-716b-4abd-cb65-08ddce739885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTQ0aEFYV0FTWTdhVXBEOGhOdWlvMStHTE1lK1JUVFM5YytZV29sVm5HaHVv?=
 =?utf-8?B?TU9McDRsR0VMbGtPMS9mc3NMTGJheUp3ZnJWR0tZTjdWbzA3bkkzT0JNRE84?=
 =?utf-8?B?SStGSGtIdGFyYXRUS3hIa3lFMlV2cE5LREFlMjhGVGJyY2tmRGRuM0JHL2Iy?=
 =?utf-8?B?ejEvVkhkQ3JGVUtSZGdJMWYyRXQ3eUtOdVdwMGFpTXFQTGFqbmkrQzRJVWVa?=
 =?utf-8?B?MGJrUDYzKzBkU2VZVVViVk1jcFdCd3o3Q01aREFHNzJLYTA1Ky9PcGN0bzZ0?=
 =?utf-8?B?WFRRRy9xRCtxRVZGb2thT2hxRGZiZ05OYzFXQ3dUZ0g5OVBhdjNqcWdERE02?=
 =?utf-8?B?VnRRL3FuRk5UdjI4L3pqSGRuSGZnS2RNVE9XMXM4djFGL3lMR0d4WUwyRnZC?=
 =?utf-8?B?YmRVYUo2R3BGVEVaNXV4ZENNMmlMNkRMNGNFSUliWDVKdWxQN3VjaUdmcnI1?=
 =?utf-8?B?M2V2ZExkUDU0TmxzU1kzZkdzSklQUS9GeGVLNkJ3WDg2UlVpZmwrUmlHcUxr?=
 =?utf-8?B?eFpZc3hYcHdMQXYwVitjNTJ4RFg5Zjd3TktZVVJ0dE5GbUVBV0RYZ0l3T0hl?=
 =?utf-8?B?UzRrWVhoTTRBdnZXb2IyeVJTekZLbGtIcjJmbU8yNy85UE5pQXpJVTZscE5K?=
 =?utf-8?B?V01xaG9Fd0hzeCtFVXNBdVlEcjJGWjdqZ3Nzb1B5QnArelR5QWhPK1RQdGln?=
 =?utf-8?B?WU1aNkEzckgzMEpldXFNVDdvMlhNNHVoSnlTN2wxUzJhbkk2My95dDNQTXMr?=
 =?utf-8?B?SjZWSDBQMlBoRlpZS0xkUzFxWVRRMnNFbXo2dFFvcUlWNlkrTmFMSXVtSy9Z?=
 =?utf-8?B?cXpLajVCM3RKd0NTR055Zlc2T3FMYVN5WmxKZ0pGbGgyYzlMaXJUU0czQlVO?=
 =?utf-8?B?L3JGVFArcmFQTVRKRnF3dzBGUnI2eW1lazdmbTczUFhKVzlmbGRFaUsxWlJH?=
 =?utf-8?B?cHp6ZjM4SG1uNmM4UllPK1FwK2J3Rld1dWRuOU1Yc016WkhIOEp6Q1JSanpM?=
 =?utf-8?B?ZTZlU29KTzBEVXVZOVVNOGpVdUZ3M3Q4RWdPWTlrQ2hSajlJd281dFN2aVVv?=
 =?utf-8?B?bkRkY0s3d0JJditCZmxaREdQelpPRUdkb2YzTDlGWFc4UkVNZVAzRlh1b0Rk?=
 =?utf-8?B?dzE4K3FjUXRjcW81cnVPYVNrSlJwT2ppcUI5QTVIbVBhc2xmcjE0YmNnbFBH?=
 =?utf-8?B?NFJsK29GVGFBYWpkWjNCaFBOLzd4aHdmcXZ0SXNsK2dVUW5xZ1ZNMFRCQWxw?=
 =?utf-8?B?UzZBbytVbktyeG4yODVCVU1WQ2VwNGViK3QvekVrM0hoS1ZWUkw5UFdGTzlI?=
 =?utf-8?B?bHhmTk1pdG91LzgrZ0xSSzRmSGZ0bFpTaERCVzJsUHB0MHAxcjBIOTNiL2F3?=
 =?utf-8?B?UTQzRkNBMkJKVXRGU2ZMRDZqTXZNZjg5a2NvM01aMUFVMkg2NDAvMnlZbDgr?=
 =?utf-8?B?UWF6dlFtdUJyeC9hbUUxbFYxbjR2ZzFMZFN0NWh2RHREbGloR0t0R29QVmV3?=
 =?utf-8?B?N280RWpia0JXQVZSVnR6dTJYZWk3dm9RR2x1ajdnQjVVcGJuNitWRkI4ZjBC?=
 =?utf-8?B?QUhpdXJjZnlWSkFmQ05ZRGxVMXJjMUpCUG5YVHJIaHlXRXpzQzVsZmZKcHRK?=
 =?utf-8?B?eVdKcFZSb1dvb2hGYStUSGtRMXBKVDZIWVFMMjZJb0lEaGFuV25XQ0lYYVRQ?=
 =?utf-8?B?ZU9MK3JpR0xDK01XUnpEL2g2UGxuMFkzbDZlNE0rTVF2QXBOWDI1UVJjQm1I?=
 =?utf-8?B?a0hUMlpzODY2RVNHVjVjSlhuWUlma2V1VmtTdEhqcnN2cFNGSktyUGpac1VN?=
 =?utf-8?B?WWhGa1lhd0dKcEJvYkFIWFBmbVVGdzVhTngrWDJuZk15RnZqTUlJSFdDQ2lF?=
 =?utf-8?B?RlhoTnRYWXg5UzBiaG9GT29SSTQ1L0FQK1JTZVJWWU9ISjVQWHlrMFBydjhi?=
 =?utf-8?Q?sTv5fcO027o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y09OQmlrK2pEeVpNWndGVFg4eFkxOVR4QUVOejFNSjB0dm9RVnlqRk9XWmhL?=
 =?utf-8?B?RmhmZ3NPT0JuVUVicVpzam5udUF5N2tUd2IvWnJqWGpPMDVrUDB1ZnhpdTIw?=
 =?utf-8?B?MGozOXNYbWk5RlRkV0swTjdjN0NWWlgvRUg2OVQwUHdPNjN5VThrSWo5anJW?=
 =?utf-8?B?UllWZkRRVjV4SEVHdk4zZzdnUkplR01sNXF5TDhKOHVaT0E3UkZndVpad0dk?=
 =?utf-8?B?dzZlWXR1R09DaUNHQStFYXowVUMreThKSDduUmp1OHI4UThWWWpmZ3c0RXJY?=
 =?utf-8?B?VUs1eDJYQWh1K1o1Z2tkMnlNRnN6dzYxeFBmVnV6c2ZBbjYyRGFOQ2VObkZQ?=
 =?utf-8?B?SDFyR1JhdEpCRGVVV25wbTVZV29LdmlBMm4waEwwclUyS0pWSTRBTzFaUGZY?=
 =?utf-8?B?NXdvWk5zekl4eW1BampVTmZLaWx0UHdqN0orY0hZV0ZjMjJOSDFiOEVDUWUx?=
 =?utf-8?B?Si9kb2tiRkRaNUQvbjBENHZCZGErWk5MVFhpRmUzY08zU1ZvNVVuR0l5bTJL?=
 =?utf-8?B?R1VzcW9xRW1pc3dUbVJhK3d4M3RuNmpwYzRBck4vNFMvd2tGaEpTUkNmU3pE?=
 =?utf-8?B?LzdvUzNUMEZTNkRnWmhOSzl6NFNKY1lqQ1lubElXd3lmVnBHRk5KUC9IMXdz?=
 =?utf-8?B?VXJGeDU0OEJJYzB4QnNveFNOZCt5Qzl5RFVYb1RVdm5zdXZjUndLZkw2ZXRi?=
 =?utf-8?B?T3l3TVhCeEhxbGlnZmo1RFFGSFdGL3l0NmVtWnF2NVo3K3lQb1dMeVJVSzlv?=
 =?utf-8?B?ZDJTWXZ5aW96RTdTcG96ZjZLbVk3MGdObmZKVytEbUcwMjE3Y1Uyb1h4bkY2?=
 =?utf-8?B?ZU1uYU5YY3h0RWhlTEZSMzVDNEUzWW1hK3dTN0p4ODBSclk5Szczd1FrNmlq?=
 =?utf-8?B?QjZGWkw0bG9yOTgyWnNQVTZjeHVDNm1yejNGQ1ovbzVkYlhqQWZXQ3Y4aXFR?=
 =?utf-8?B?UEVnTWRFM2RHSGRXNUtLa1FYdzRjSE1aMDk5MUZxNUJPT0VBRHpRQ3FHbUg1?=
 =?utf-8?B?ei9zNGtUT2pOWHNwUVBTZWdrNkQ1RmY0MzBWZ3F2Y3Z2N2VzVXdsRUp2b0d2?=
 =?utf-8?B?OWF2K21Ic084Uk40N3o3UFdmYVRFb1N4cXE2NTl4ZmIxbmxhcU4vUzltYktG?=
 =?utf-8?B?K2xGNUhxVXVsRGRMOWRaZ1c3eXNpT2VBQ0o5Um1CSWtYQnk2Tk9PMzZGL2dW?=
 =?utf-8?B?NnAyOWVIZmRuT016UjU0eE1IaFJkNHlDank2d3h4SXpmeUE1c1dMR0F4Qloy?=
 =?utf-8?B?cHNhTnN5ZmxzQ0wrejZlVm10YzVVZVl3YVduREptamk4ck9ibHEyME9Pcnpq?=
 =?utf-8?B?YXgrUGNQcUJTanI3Q3JnQkpMR3FOSHVyNUU4T3FHRUNHQis5Q1RBMExGUXlz?=
 =?utf-8?B?azFnb0xGSDBHTmFGZHFXZGJ4aW5YWDUxaFJBSk5WMXBGVmNRU2UyN2wwZVZF?=
 =?utf-8?B?aW9sNHhpRHZ3Sy9LNnNndVlQaDhsUGhiQ1JiUVUzRGZ3Uzd6VzVYUVFaNUNU?=
 =?utf-8?B?VzhDYnl0T0VkYjUrcXZBeERsVlIzZnlQeVBENksxbzNNZFY3TWRFMGx4Q1RW?=
 =?utf-8?B?S0ZadEZKVjBJUW9GMlBHMXIycGhRbzUrK09BbWtaanZGYWFBT2lkWTFBSGdp?=
 =?utf-8?B?ZzdPZkZkSllkWW5yME1lNjZTWThJKzhzZUQzMWtXWXpyd09td2p2Mk93MWEx?=
 =?utf-8?B?Sm1yL3NSazd3YlcyZHg2ZHFsMXdydkhTRlRYQWtxeE81bUw3aHZMTEhaSUEx?=
 =?utf-8?B?Zjl2TStDN204STN5N0FTWnloeE1vYURvaDdFYW4zZ08wSGtEMmkrMEJSWXM0?=
 =?utf-8?B?TG96dnpKK2FRMU05U3laZlBtRm1ZTDh6WTl2RXlQcmd1K1FDU3J5ZDRqdFRZ?=
 =?utf-8?B?UDZta1c4Y3Boek9NWHI5dGZjaTlMelZSTmNBV2Q3amZ5UUZNRUlLRTRzNlJJ?=
 =?utf-8?B?YXBJYit4SUFhcDBqR0FBNFJxcDB1ZFJ1VHp5NzI2S3dLNWwxVTJCVXB3Yk9a?=
 =?utf-8?B?Y1RDaEdoSUR2bWZqczgzUzN3ZTM4YU01aUFiZWhyYWtTV2VjYktpdXlGeU1F?=
 =?utf-8?B?ci94T0dYVWZvbTgycVFSaGdQRGk3SWxNR0JqR1Z5NHNzbFIyeDMxclMrWE9S?=
 =?utf-8?Q?O8f8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c65bae0-716b-4abd-cb65-08ddce739885
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:43:23.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOiGuo8HGhZW1Uv+sQRm2qRuo17WXpS0wDTgUjykZzqDVYTSlm2kmZEi+6c+HnMK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9708

Hi Sultan, really appreciate your time and effort

On 7/28/2025 3:04 PM, Sultan Alsawaf wrote:
> I found more refcounting issues in addition to the ones from my other emails
> while trying to make my webcam work:
> 
> On Wed, Jun 18, 2025 at 05:19:57PM +0800, Bin Du wrote:
>> +static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma)
>> +{
>> +	struct isp4vid_vb2_buf *buf = buf_priv;
>> +	int ret;
>> +
>> +	if (!buf) {
>> +		pr_err("fail no memory to map\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = remap_vmalloc_range(vma, buf->vaddr, 0);
>> +	if (ret) {
>> +		dev_err(buf->dev, "fail remap vmalloc mem, %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Make sure that vm_areas for 2 buffers won't be merged together
>> +	 */
>> +	vm_flags_set(vma, VM_DONTEXPAND);
>> +
>> +	dev_dbg(buf->dev, "mmap isp user bo 0x%llx size %ld refcount %d\n",
>> +		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
> 
> Use refcount_read() instead of reading the refcount's atomic_t counter directly.
> This is done in 3 other places; change those to refcount_read() as well.
> 
> This didn't cause any functional problems, but it should still be fixed.
> 
>> +
>> +	return 0;
>> +}
> 
Sure, will fix it

> [snip]
> 
>> +static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
>> +{
>> +	struct isp4vid_vb2_buf *buf = mem_priv;
>> +
>> +	if (!buf) {
>> +		pr_err("fail invalid buf handle\n");
>> +		return;
>> +	}
>> +
>> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>> +
>> +	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
>> +		buf->gpu_addr, buf->size);
>> +
>> +	if (buf->vaddr)
>> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
>> +
>> +	// put dmabuf for exported ones
>> +	dma_buf_put(buf->dbuf);
>> +
>> +	kfree(buf);
>> +}
> 
> As mentioned in the other email, the dma_buf_put() here needs to be removed. But
> that's not all: the dma_buf_vunmap_unlocked() needs to be removed too because
> vb2 will always unmap the buffer before detaching it. As a result, having the
> dma_buf_vunmap_unlocked() call here results in a use-after-free when vb2 calls
> the unmap_dmabuf memop.
> 
> Change this function to the following:
> 
> 	static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
> 	{
> 		struct isp4vid_vb2_buf *buf = mem_priv;
> 
> 		kfree(buf);
> 	}
> 
Will have a try

>> +static void isp4vid_qops_buffer_cleanup(struct vb2_buffer *vb)
>> +{
>> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct isp4vid_vb2_buf *buf = vb->planes[0].mem_priv;
>> +
>> +	dev_dbg(isp_vdev->dev, "%s|index=%u vb->memory %u",
>> +		isp_vdev->vdev.name, vb->index, vb->memory);
>> +
>> +	if (!buf) {
>> +		dev_err(isp_vdev->dev, "Invalid buf handle");
>> +		return;
>> +	}
>> +
>> +	// release implicit dmabuf reference here for vb2 buffer
>> +	// of type MMAP and is exported
>> +	if (vb->memory == VB2_MEMORY_MMAP && buf->is_expbuf) {
>> +		dma_buf_put(buf->dbuf);
>> +		dev_dbg(isp_vdev->dev,
>> +			"put dmabuf for vb->memory %d expbuf %d",
>> +			vb->memory,
>> +			buf->is_expbuf);
>> +	}
>> +}
>> +
> 
> Remove the isp4vid_qops_buffer_cleanup() function. It causes a use-after-free by
> doing an extra dma_buf_put(). This function isn't needed now that the refcount
> issues are solved.
> 
Will have a try

> [snip]
> 
>> +static const struct vb2_ops isp4vid_qops = {
>> +	.queue_setup = isp4vid_qops_queue_setup,
>> +	.buf_cleanup = isp4vid_qops_buffer_cleanup,
> 
> Remove the .buf_cleanup hook too.
> 
Will have a try

>> +	.buf_queue = isp4vid_qops_buffer_queue,
>> +	.start_streaming = isp4vid_qops_start_streaming,
>> +	.stop_streaming = isp4vid_qops_stop_streaming,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
>> +};
> 
> [snip]
> 
> Along with the changes from my other emails, I believe this finally fixes all of
> the refcounting issues. No more UaF or leaks here. :-)
> 
> Sultan
Tried changes in this and other two mails together, found the kernel 
will crash when re-open cheese App (means open cheese, close it and then 
open it again), the crash stack dump is shown below

[   38.008686] amdgpu 0000:c3:00.0: amdgpu: power on isp suc
[   38.032693] amdgpu 0000:c3:00.0: amdgpu: set xclk 788 suc, reg_val 800
[   38.060866] amdgpu 0000:c3:00.0: amdgpu: set iclk 788 suc, reg_val 792
[   38.060877] amdgpu 0000:c3:00.0: amdgpu: set xclk 788 iclk 788 to 
performance state 1 suc
[   38.425284] amdgpu 0000:c3:00.0: amdgpu: isp set performance do none 
to state 0
[   38.448631] amdgpu 0000:c3:00.0: amdgpu: power off isp suc
[   38.508368] amdgpu 0000:c3:00.0: amdgpu: power on isp suc
[   38.538525] amdgpu 0000:c3:00.0: amdgpu: set xclk 788 suc, reg_val 800
[   38.568839] amdgpu 0000:c3:00.0: amdgpu: set iclk 788 suc, reg_val 792
[   38.568851] amdgpu 0000:c3:00.0: amdgpu: set xclk 788 iclk 788 to 
performance state 1 suc
[   38.997779] amdgpu 0000:c3:00.0: amdgpu: isp set performance do none 
to state 0
[   39.029297] amdgpu 0000:c3:00.0: amdgpu: power off isp suc
[   39.084010] BUG: kernel NULL pointer dereference, address: 
0000000000000008
[   39.084024] #PF: supervisor read access in kernel mode
[   39.084028] #PF: error_code(0x0000) - not-present page
[   39.084031] PGD 0 P4D 0
[   39.084037] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   39.084042] CPU: 3 UID: 1000 PID: 3119 Comm: viewfinderbin-q Not 
tainted 6.14.0-rc2+ #944
[   39.084046] Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile 
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[   39.084049] RIP: 0010:validate_page_before_insert+0x5/0xc0
[   39.084060] Code: 31 c9 31 ff 45 31 c0 c3 cc cc cc cc 66 0f 1f 84 00 
00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 
00 <48> 8b 46 08 a8 01 75 7a 66 90 48 89 f0 8b 50 34 85 d2 0f 84 8c 00
[   39.084064] RSP: 0018:ffffb95e05e7b6a0 EFLAGS: 00010202
[   39.084067] RAX: 0000000000000000 RBX: 8000000000000025 RCX: 
0000000000000000
[   39.084069] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffff9efa10e400b8
[   39.084071] RBP: ffffb95e05e7b6e0 R08: 0000000000000000 R09: 
0000000000000000
[   39.084072] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff9efa10e400b8
[   39.084074] R13: ffffb95e0e055000 R14: 00007fa3d6119000 R15: 
0000000000000000
[   39.084076] FS:  00007fa3f4bf96c0(0000) GS:ffff9f050d780000(0000) 
knlGS:0000000000000000
[   39.084078] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   39.084080] CR2: 0000000000000008 CR3: 0000000137bba000 CR4: 
0000000000750ef0
[   39.084083] PKRU: 55555554
[   39.084084] Call Trace:
[   39.084087]  <TASK>
[   39.084093]  ? show_regs+0x71/0x90
[   39.084099]  ? __die+0x25/0x80
[   39.084102]  ? page_fault_oops+0x15c/0x570
[   39.084108]  ? do_user_addr_fault+0x4a9/0x810
[   39.084111]  ? __mod_memcg_lruvec_state+0xde/0x280
[   39.084117]  ? exc_page_fault+0x83/0x1d0
[   39.084123]  ? asm_exc_page_fault+0x27/0x30
[   39.084131]  ? validate_page_before_insert+0x5/0xc0
[   39.084134]  ? vm_insert_page+0xd4/0x1a0
[   39.084139]  remap_vmalloc_range_partial+0xe3/0x160
[   39.084145]  remap_vmalloc_range+0x21/0x40
[   39.084153]  isp4vid_vb2_mmap+0x2d/0x130 [amd_capture]
[   39.084164]  isp4vid_vb2_dmabuf_ops_mmap+0x12/0x20 [amd_capture]
[   39.084168]  dma_buf_mmap_internal+0x41/0x70
[   39.084173]  __mmap_region+0x62f/0xbc0
[   39.084179]  mmap_region+0x67/0xe0
[   39.084181]  do_mmap+0x52b/0x650
[   39.084187]  vm_mmap_pgoff+0xf4/0x1c0
[   39.084194]  ksys_mmap_pgoff+0x182/0x250
[   39.084198]  __x64_sys_mmap+0x33/0x70
[   39.084202]  x64_sys_call+0x2541/0x26f0
[   39.084206]  do_syscall_64+0x70/0x130
[   39.084212]  ? __rseq_handle_notify_resume+0xa4/0x520
[   39.084216]  ? do_futex+0x17f/0x220
[   39.084220]  ? restore_fpregs_from_fpstate+0x3d/0xd0
[   39.084225]  ? switch_fpu_return+0x50/0xe0
[   39.084229]  ? syscall_exit_to_user_mode+0x18c/0x1c0
[   39.084234]  ? do_syscall_64+0x7c/0x130
[   39.084237]  ? __pfx_futex_wake_mark+0x10/0x10
[   39.084241]  ? hrtimer_cancel+0x15/0x50
[   39.084246]  ? futex_wait+0x7c/0x120
[   39.084249]  ? __pfx_hrtimer_wakeup+0x10/0x10
[   39.084254]  ? __rseq_handle_notify_resume+0xa4/0x520
[   39.084256]  ? do_futex+0x17f/0x220
[   39.084258]  ? restore_fpregs_from_fpstate+0x3d/0xd0
[   39.084261]  ? switch_fpu_return+0x50/0xe0
[   39.084264]  ? syscall_exit_to_user_mode+0x18c/0x1c0
[   39.084268]  ? do_syscall_64+0x7c/0x130
[   39.084272]  ? __count_memcg_events+0xcd/0x190
[   39.084276]  ? count_memcg_events.constprop.0+0x2a/0x50
[   39.084279]  ? handle_mm_fault+0x1ef/0x2d0
[   39.084284]  ? do_user_addr_fault+0x58d/0x810
[   39.084286]  ? irqentry_exit_to_user_mode+0x33/0x180
[   39.084291]  ? irqentry_exit+0x43/0x50
[   39.084294]  ? exc_page_fault+0x94/0x1d0
[   39.084298]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   39.084302] RIP: 0033:0x7fa463b2531c
[   39.084305] Code: 1e fa 41 f7 c1 ff 0f 00 00 75 33 55 48 89 e5 41 54 
41 89 cc 53 48 89 fb 48 85 ff 74 41 45 89 e2 48 89 df b8 09 00 00 00 0f 
05 <48> 3d 00 f0 ff ff 77 7c 5b 41 5c 5d c3 0f 1f 80 00 00 00 00 48 8b
[   39.084308] RSP: 002b:00007fa3f4bf79e0 EFLAGS: 00000246 ORIG_RAX: 
0000000000000009
[   39.084311] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 
00007fa463b2531c
[   39.084312] RDX: 0000000000000001 RSI: 00000000007782c0 RDI: 
0000000000000000
[   39.084314] RBP: 00007fa3f4bf79f0 R08: 0000000000000047 R09: 
0000000000000000
[   39.084315] R10: 0000000000000001 R11: 0000000000000246 R12: 
0000000000000001
[   39.084317] R13: 0000000000000000 R14: 00007fa3f8019b48 R15: 
00007fa3f4bf7b60
[   39.084320]  </TASK>
[   39.084321] Modules linked in: snd_seq_dummy snd_hrtimer 
hid_sensor_prox hid_sensor_gyro_3d hid_sensor_trigger 
industrialio_triggered_buffer kfifo_buf hid_sensor_iio_common 
industrialio hid_sensor_hub rfcomm cmac algif_hash algif_skcipher af_alg 
hid_logitech_hidpp ov05c10 v4l2_cci amd_capture v4l2_fwnode 
videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev 
pinctrl_amdisp i2c_designware_amdisp qrtr bnep btusb btrtl btintel btbcm 
btmtk bluetooth hid_logitech_dj intel_rapl_msr amd_atl intel_rapl_common 
binfmt_misc nls_iso8859_1 snd_acp_legacy_mach snd_acp_mach 
snd_soc_nau8821 snd_acp3x_rn amdgpu edac_mce_amd snd_ctl_led 
snd_hda_codec_realtek snd_acp70 snd_hda_codec_generic snd_acp_i2s 
snd_acp_pdm snd_hda_scodec_component snd_soc_dmic snd_acp_pcm 
snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci 
snd_sof_xtensa_dsp snd_hda_codec_hdmi snd_sof snd_sof_utils snd_pci_ps 
snd_soc_acpi_amd_match snd_amd_sdw_acpi soundwire_amd 
soundwire_generic_allocation soundwire_bus snd_hda_intel kvm_amd
[   39.084385]  snd_soc_sdca snd_intel_dspcfg snd_intel_sdw_acpi 
snd_soc_core snd_hda_codec amdxcp kvm snd_compress 
drm_panel_backlight_quirks snd_hda_core snd_usb_audio gpu_sched ac97_bus 
polyval_clmulni snd_pcm_dmaengine polyval_generic ghash_clmulni_intel 
drm_buddy snd_usbmidi_lib snd_seq_midi snd_rpl_pci_acp6x sha256_ssse3 
snd_ump drm_ttm_helper snd_seq_midi_event snd_hwdep sha1_ssse3 ttm 
aesni_intel drm_exec snd_rawmidi drm_suballoc_helper snd_acp_pci mc 
crypto_simd snd_acp_legacy_common drm_client_lib cryptd 
drm_display_helper snd_pci_acp6x snd_seq rapl hp_wmi cec wmi_bmof 
snd_pcm sparse_keymap snd_seq_device rc_core snd_timer snd_pci_acp5x 
drm_kms_helper snd_rn_pci_acp3x amd_pmf snd i2c_algo_bit snd_acp_config 
i2c_piix4 snd_soc_acpi amdtee soundcore snd_pci_acp3x i2c_smbus ccp 
joydev tee input_leds serial_multi_instantiate amd_pmc platform_profile 
wireless_hotkey mac_hid serio_raw sch_fq_codel msr parport_pc ppdev lp 
parport efi_pstore nfnetlink dmi_sysfs ip_tables x_tables autofs4 r8152 
mii usbhid hid_multitouch
[   39.084451]  hid_generic nvme ucsi_acpi i2c_hid_acpi video typec_ucsi 
i2c_hid amd_sfh thunderbolt hid nvme_core typec wmi drm
[   39.084465] CR2: 0000000000000008
[   39.084468] ---[ end trace 0000000000000000 ]---
[   39.116114] amdgpu 0000:c3:00.0: amdgpu: power on isp suc
[   39.159519] amdgpu 0000:c3:00.0: amdgpu: set xclk 788 suc, reg_val 800
[   39.201325] amdgpu 0000:c3:00.0: amdgpu: set iclk 788 suc, reg_val 792
[   39.201334] amdgpu 0000:c3:00.0: amdgpu: set xclk 788 iclk 788 to 
performance state 1 suc
[   39.343894] RIP: 0010:validate_page_before_insert+0x5/0xc0
[   39.343907] Code: 31 c9 31 ff 45 31 c0 c3 cc cc cc cc 66 0f 1f 84 00 
00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 
00 <48> 8b 46 08 a8 01 75 7a 66 90 48 89 f0 8b 50 34 85 d2 0f 84 8c 00
[   39.343909] RSP: 0018:ffffb95e05e7b6a0 EFLAGS: 00010202
[   39.343911] RAX: 0000000000000000 RBX: 8000000000000025 RCX: 
0000000000000000
[   39.343913] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffff9efa10e400b8
[   39.343913] RBP: ffffb95e05e7b6e0 R08: 0000000000000000 R09: 
0000000000000000
[   39.343914] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff9efa10e400b8
[   39.343915] R13: ffffb95e0e055000 R14: 00007fa3d6119000 R15: 
0000000000000000
[   39.343916] FS:  00007fa3f4bf96c0(0000) GS:ffff9f050d780000(0000) 
knlGS:0000000000000000
[   39.343917] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   39.343918] CR2: 0000000000000008 CR3: 0000000137bba000 CR4: 
0000000000750ef0
[   39.343919] PKRU: 55555554
[   39.343920] note: viewfinderbin-q[3119] exited with irqs disabled

This is the patch, it should have contained all your changes

 From b0a61b6b7500635928166516d5563e6de50300bb Mon Sep 17 00:00:00 2001
From: Bin Du <Bin.Du@amd.com>
Date: Mon, 28 Jul 2025 14:18:04 +0800
Subject: [PATCH] add comment from community

Change-Id: I06fff629c0dc691eaeaa9d9b81e6af27cbb6adb2
---
  drivers/media/platform/amd/isp4/isp4_video.c | 59 ++++++--------------
  1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_video.c 
b/drivers/media/platform/amd/isp4/isp4_video.c
index a1376498c246..b210a0b1e49b 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -183,7 +183,7 @@ static int isp4vid_vb2_mmap(void *buf_priv, struct 
vm_area_struct *vma)
  	vm_flags_set(vma, VM_DONTEXPAND);

  	dev_dbg(buf->dev, "mmap isp user bo 0x%llx size %ld refcount %d\n",
-		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
+		buf->gpu_addr, buf->size, refcount_read(&buf->refcount));

  	return 0;
  }
@@ -214,14 +214,9 @@ static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
  		return;
  	}

-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
-
  	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
  		buf->gpu_addr, buf->size);

-	if (buf->vaddr)
-		dma_buf_vunmap_unlocked(buf->dbuf, &map);
-
  	kfree(buf);
  }

@@ -470,21 +465,25 @@ static struct dma_buf 
*isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
  					      unsigned long flags)
  {
  	struct isp4vid_vb2_buf *buf = buf_priv;
-	struct dma_buf *dbuf;
+	struct dma_buf *dbuf = buf->dbuf;
+
+	if (dbuf) {
+		dev_dbg(buf->dev, "dbuf already created, reuse %s dbuf\n",
+			buf->is_expbuf ? "exported" : "implicit");
+		get_dma_buf(dbuf);

-	if (buf->dbuf) {
-		dev_dbg(buf->dev, "dbuf already created, reuse implicit dbuf\n");
-		dbuf = buf->dbuf;
  	} else {
  		dbuf = isp4vid_get_dmabuf(vb, buf_priv, flags);
+		if (!dbuf)
+			return NULL;
+
  		dev_dbg(buf->dev, "created new dbuf\n");
+		buf->is_expbuf = true;
+		refcount_inc(&buf->refcount);
  	}

-	buf->is_expbuf = true;
-	refcount_inc(&buf->refcount);
-
  	dev_dbg(buf->dev, "buf exported, refcount %d\n",
-		buf->refcount.refs.counter);
+		refcount_read(&buf->refcount));

  	return dbuf;
  }
@@ -579,8 +578,9 @@ static void isp4vid_vb2_put(void *buf_priv)
  {
  	struct isp4vid_vb2_buf *buf = (struct isp4vid_vb2_buf *)buf_priv;
  	unsigned int ref_cnt = refcount_read(&buf->refcount);
+	struct device *dev = buf->dev;

-	dev_dbg(buf->dev,
+	dev_dbg(dev,
  		"release isp user bo 0x%llx size %ld refcount %u is_expbuf %d\n",
  		buf->gpu_addr, buf->size,
  		ref_cnt, buf->is_expbuf);
@@ -598,7 +598,7 @@ static void isp4vid_vb2_put(void *buf_priv)
  		/* the ref_cnt - 1 is just a predicted value as reference, can't
  		 * guarantee it's the actual value now
  		 */
-		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0\n", ref_cnt - 1);
+		dev_warn(dev, "ignore buffer free, refcount %u > 0\n", ref_cnt - 1);
  	}
  }

@@ -642,7 +642,7 @@ static void *isp4vid_vb2_alloc(struct vb2_buffer 
*vb, struct device *dev,
  	refcount_set(&buf->refcount, 1);

  	dev_dbg(dev, "allocated isp user bo 0x%llx size %ld refcount %d\n",
-		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
+		buf->gpu_addr, buf->size, refcount_read(&buf->refcount));

  	return buf;
  err_free:
@@ -1140,30 +1140,6 @@ static void isp4vid_qops_buffer_queue(struct 
vb2_buffer *vb)
  	mutex_unlock(&isp_vdev->buf_list_lock);
  }

-static void isp4vid_qops_buffer_cleanup(struct vb2_buffer *vb)
-{
-	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
-	struct isp4vid_vb2_buf *buf = vb->planes[0].mem_priv;
-
-	dev_dbg(isp_vdev->dev, "%s|index=%u vb->memory %u",
-		isp_vdev->vdev.name, vb->index, vb->memory);
-
-	if (!buf) {
-		dev_err(isp_vdev->dev, "Invalid buf handle");
-		return;
-	}
-
-	// release implicit dmabuf reference here for vb2 buffer
-	// of type MMAP and is exported
-	if (vb->memory == VB2_MEMORY_MMAP && buf->is_expbuf) {
-		dma_buf_put(buf->dbuf);
-		dev_dbg(isp_vdev->dev,
-			"put dmabuf for vb->memory %d expbuf %d",
-			vb->memory,
-			buf->is_expbuf);
-	}
-}
-
  static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
  					unsigned int count)
  {
@@ -1343,7 +1319,6 @@ static int isp4vid_fill_buffer_size(struct 
isp4vid_dev *isp_vdev)

  static const struct vb2_ops isp4vid_qops = {
  	.queue_setup = isp4vid_qops_queue_setup,
-	.buf_cleanup = isp4vid_qops_buffer_cleanup,
  	.buf_queue = isp4vid_qops_buffer_queue,
  	.start_streaming = isp4vid_qops_start_streaming,
  	.stop_streaming = isp4vid_qops_stop_streaming,
-- 
2.34.1

Regards,
Bin



