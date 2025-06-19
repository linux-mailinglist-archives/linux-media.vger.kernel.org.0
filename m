Return-Path: <linux-media+bounces-35358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F97AE09FD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4341C170AF0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF0022CBE2;
	Thu, 19 Jun 2025 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GUazw5RI"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B5F3085DB;
	Thu, 19 Jun 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345930; cv=fail; b=GmLF48y0BCEVpYTRetgwSRBdNIccVzG1khGxu7mUh80e7JNo+hct2fJbXpA3T9E7i6teRoZZkuEw7U/RVPeIabotv6+1883p5ulOUbf7mptFgcfE3bgL22DHhOdsukvFGHL1u6b0zz1F/+kYuwL8NG8I26nMiLtv3Wmo6F5PwP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345930; c=relaxed/simple;
	bh=/Iz5wMjqcFSnovMfpd8tPQUAnlIOG2DOchdM4vRnUyg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HkWOKqEGUHf7Lz4YefAg0TYJqk/UHhd0GDJ8Zq7qSDNkvwVE2mOTq2JXvsgBKr44nCsC5w4q9vS2XL0r85IDHLdOw9yqX96dbeTTCSnSbeIzATmwpeJpRIBNuyO/G5a7eW+hGwBRaC37jnqPGRjtyEEGKfk1dX+Adlh07U/6Pdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GUazw5RI; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUYacAlQzLOXOog07xk2rwuCi+wdBBcsxQ9fxLIDw/S3nRIzlI6VgPbQzHdWt/JKYgwk11IY5vcuRoJnKBB0dUxBhvBqz4wUf8ixmXhENu/VUFUo0m5k/I9VREFI3s+v7gz8X42Bsu+YGnOP/zF2r/5MBp6wQ7Smje/nSMYLRhO5crzHu6l8MOHO3dK+rRZrNFWl7zkryyDxTksYPMxio7SymlnHiSn44pcsHKaixujGwWSo2Rz4AlSkxrTkbSnf+i8blikr21AqDblg4p82UnK208TrjAqHS65tg39E1WR9WjwW+BfRyRlpP0PGnpDuDc/O3YprtP/kBKyiWkG0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKrArgmXFOTLYTTyNhTeXov6XSTWvjvT9b7RYgx8wRU=;
 b=HMQuNfu43iwzuJmWNMq/t1o8WZSj7H/xPfJt/JyASw9BgeBHTDsfBJlXG1k6BbfU+pL4DA1N4VfumUgFNYuvKf7NZqac0rYoNsmcLNga8NqwDibpm8+cMarPDIJD+0+Y6PzH45mZSzmQD5nn3yhodEeY+htPFUUlx7W1I7vKwimUEP0gN0G82lncpeJ6ixyoZaAZHJ8Sr5dyqTr2Q2gaK+vN3zpRTsVVEtAyxd5afWusdvRidzNSylL6MsZGONewyxXXIE/hsUbPq+arBhLsKxlrCXfAGXtXNehjYKdcUPVtwHUJ11272Fhm09Q07yZrQxiVTSKkD7+lUaYd4aMP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKrArgmXFOTLYTTyNhTeXov6XSTWvjvT9b7RYgx8wRU=;
 b=GUazw5RIjG3kK3lkh3pOL5+Ys3Tn5s8QNJnZyypGlVKcDT/iWyBzQvxDTePEQyWCrnjpMiSGXH2zcxei/7u8HEuH5PpINbJxpF1j8Oc7zNtMHyTr4T82rQB2I63ktblU8EYN9EFGy5CdIjj0yXYeVi90TNgo4O+x2v5qwQlm48w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 15:12:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 15:12:04 +0000
Message-ID: <beb4ba2d-49e9-4945-b3c9-5af6927026fd@amd.com>
Date: Thu, 19 Jun 2025 10:11:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
To: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <42bac0f3-159b-4192-b23f-658d7edc0d37@amd.com>
 <6735fb02-24a0-42c1-86ab-605a783c4f47@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <6735fb02-24a0-42c1-86ab-605a783c4f47@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SCZP215CA0023.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:54::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d689b95-2f4b-4950-e27e-08ddaf43a65b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXY3cldpclNvdDMrMWR0cytoQ1IwNDdEcDA5bGtwY0psVHVtODR5ZWhxbFZN?=
 =?utf-8?B?MEtYcUZ0TXY0U21uU2FPcURLRUtnMkUrOUNCR1crNlBoNmwxOE9uMjB4c3ZN?=
 =?utf-8?B?TXRwNll4OTU4WDIwT1FDbnBpTEcrL0lnYVVucHZSeFR0VHViRDVTQ3o1ZE1Y?=
 =?utf-8?B?RlhHaktGenlJekZPYjZ4ZDBJVVhoWSsydkQzbmJSelVXckZ0dTI3K1lpRkNC?=
 =?utf-8?B?alcxZ0pQWFBxMHE4dU5KME5LRnBBQ1kxZ1V0NHRWOE1nU1AyQTdkRU9ocFlv?=
 =?utf-8?B?VkM0TSt5OUtCQkx5ZkpqSWJhOHkxbW5Rbk41dzI1WDNqci9YZ1NsbjIxYmlT?=
 =?utf-8?B?cHZRTjYrTG9mRWJ4RW02a0ROSExmTGtIWVVFbGdvZHEydkQ1anNNNHEyR0ps?=
 =?utf-8?B?TldNRVdYcXJ6RWxwWWVIZm5uQWtLa0IzaU0wempTbzNta0RPK2tvaEE4NkVa?=
 =?utf-8?B?azNneEpVSlRqY1RXS09jU3ZpUk5HbXlpS3dtbitOOGpSUWFsMTRpWGJhNlRO?=
 =?utf-8?B?VVBVTzlleHBRNFlrUVlrN1gwVS9mbjRvUDlyUGNqcWNLZEMvdnNTRjZubUxm?=
 =?utf-8?B?U3JLV0NPT1pJV1c5Wmc4dE1Nak9BSUhkdUFlWC9VQjJtUXpRUmM0MTNQaWl6?=
 =?utf-8?B?cGlXcGw3V1pvYlhHdmxtL3FUUXQvUEtVTVhVeDNDZ0g3cFlieEpqL2JPVWtT?=
 =?utf-8?B?RWZ3UjVpTWJnbVYzZkRLRkJIVnZXQ0RpdWswTlFoWk9ROEtwaVU2aGo5TE9a?=
 =?utf-8?B?dGdxc0orV2VnbktuM2Y0WGF0REMxV3laVHFNNWdBMVdOZ3FibWM1b2lCMVl1?=
 =?utf-8?B?d1I4eDVWWmg5U056NWp2RUswUW9JVzNTZVphaTNkeVdQSUh0aGhxbWw3KzJx?=
 =?utf-8?B?MFhrb1VvM3dTN0FxcnZybTd3QlBrNHVoaHR6OVRxVEZtY1ljMjA4bktmTG5r?=
 =?utf-8?B?REhZSkRrcHBUVlVKTUtOcmFtOFdCakw4cGhNL2tnZnlWeStnL3ErTW5aQ0RU?=
 =?utf-8?B?L05nSDY3UFBZemRjYWc1cFVobThBLzFtSTZ1QjVaMDRnSG44TzhYSVRJRVNR?=
 =?utf-8?B?Y3pnc1Z4QzVwZ0NEU1Q3bS9KcGVISk9IYzlEVEJMdFJxSzhLOXo2NUtPVlZL?=
 =?utf-8?B?eVVCdm8vVWxFVVZ3cXcvZ2tPSEx6K0JhdGZHNHRsUEpaRWdxaHRVMm0xMjY5?=
 =?utf-8?B?anBQRGc2TUJpUUVOVEpnTEhKYkc5Z3VHVllnR0JwV2Y3ZUUrakkvSmc1QkpL?=
 =?utf-8?B?UkJZMXlaV1kvVHdWdkdIcElWWWNMMUYvZFZQSTZWeHFFWll5R2R3V01Lb29T?=
 =?utf-8?B?YnN1MGxnUUF2VXdFTy94Ukw4VG43VFJScUJBOWEzZzVMRGpHY2xUdzlEalk3?=
 =?utf-8?B?N1dxNHZreGFXZnl0ZXFadUtuWUtnYUpWM3kvQjU2ZmUrZ2V4ckNSZDR1bk5X?=
 =?utf-8?B?TEJFUzc2c0VnbFhsWnpiZjVMaXR5VkUxdlpIUVQzbTBpUVNsbERvQXdYRW9B?=
 =?utf-8?B?bXJKM28rTmJxa0gzOTU0aC9BbkVCayt0NTFoV0c4UythSXNYUXJVSWR2Sk5x?=
 =?utf-8?B?TGRaeDRjNmRaaHZRcjZDaFQ5MzRzNU1OK1dhd01UbW03amc1aEhBVWd2WWNu?=
 =?utf-8?B?OWZycFR5NHgzWVBvcmsvT2hNVEIzUE1TbURYdkdKUVNHQUljakxtbURuelUr?=
 =?utf-8?B?Y2NRMHpJZDdOaCtldmFXdFQxckphYi9SbndaQmd0WlVEQXJnR1hqQkVFQW1R?=
 =?utf-8?B?NTRDNGdVblpDRFBUY0xNM28ySjl3QmdMZUFIN1krQ3BtUmFBTmZCTG9BUVRH?=
 =?utf-8?B?WHBRcnFTWVFWZ2FtMm9VYnVSTFdCaTNYOEJySVlDL0NBanpickZ6ZG42WnMx?=
 =?utf-8?B?Q3BiSldqS3R1Vm1wTEgrejlNakRpQm9ESzVncEhlR0FFWDZ4ZWFsK1Y3VU1t?=
 =?utf-8?B?dVc0NkFkeWtCRXNYSVgvNVBseDA1bTZOYlhGYVVPRFMvMmZYVmp0MlVJSVJh?=
 =?utf-8?B?TGwwK2w3Q0xRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amZBZGE0TktkSGFBOXhhLzlTcXF5dW9uaU1OMU1uZXNaWmNiNStiQ3BMbTE5?=
 =?utf-8?B?R0hOTzFxQU92akVadGV1eHFEbFVYMGljc21Va2kyRGl1VjZPTlhrSHAweGRv?=
 =?utf-8?B?dkVydm5uUFMxeFhLQzVXTXZzaDBZVVJqWnV5bDl4UHhPSzZueHpka1F3ZU9y?=
 =?utf-8?B?cWluMkprcWx2WjhWTDhydmZ5WjNCYlN5dFFhSmN2QlJFd1c4NmViUHBDb2NS?=
 =?utf-8?B?TFBSVzA2cEs0ZDYrZk4rWlJ3MDR5SkI5Y081Ky9VekNiWnpIZ0trVG5sYm5X?=
 =?utf-8?B?MEJBRkJxUVM3aUVBZytuUkszZVVORldUWWlFdTlQU0RJWkRrM1crVVBHT3lK?=
 =?utf-8?B?Zy9rR2dwbFkwa1lMWERpeUhkaDY4ODlReXJaQXlXUnBLanREK3lvejlWSGFt?=
 =?utf-8?B?aEJHRlhtQ3Jpb0t0QTJ2RkxXWVVYQ2psdWFEZm80N1Avc3ZGaDArS3VOalF3?=
 =?utf-8?B?Z2x0bWtST1ZqY0pRUGsxWmp5eEwyZXppVTVtbmlOQ0N0aWV1ZzAvWTZWRXRK?=
 =?utf-8?B?ODJPZFN1cGluL0JIN1hQbzlsUjZGemlKRWJiSGMwQXE1WnQwdVBTdVFBMjlp?=
 =?utf-8?B?TEF6OGE4TGg2SUM1NDEybFkwU3NXN1orYmMrYUlOMHl4Q1dtNTVkcFEyZmFv?=
 =?utf-8?B?OERlejVFRDJUcGpYVEd4aFhWM3FjV2l5Qk0zTVJOeUV0NGlITm95MGl3eW5S?=
 =?utf-8?B?eDBjWVkwazVtL2x6YlRkbTJBQzl4SDRTcGZDWHkxSnQ4R08zZ0p4cmRFbEgr?=
 =?utf-8?B?c3lBcXMwR0dNbTU1cG16QzRSMkhQWDcwaGowb0QySGxuam1kYXJDQTFkbEhG?=
 =?utf-8?B?Qm12RlQxRzBhemVlZ1RqM2tJM3UxbjMrMGF2cUU0UENueE0ycThoTVN4SUpV?=
 =?utf-8?B?L0RIdTJ5ZURpNjV5WGtHd3NXeDRHTUVyRjRHM2ZsZllpMXRZbUFpUk5PQWxi?=
 =?utf-8?B?bGZ5UmpFaytuNFJEOE1XK1BvRml3SFBLZWk0RkxWQ01tWkpMRk5IOE9NYXhQ?=
 =?utf-8?B?UFJqdWFSV2paanYrVm8vaFo1N090Zk5JcUZZRGoxTlRzRjVaZi9kVU9kTytX?=
 =?utf-8?B?Y2thaUtWQUwyU1AxWXIyLzIwM0JqNWJXZHFiNnFFcFhUeXkxUW1uelFlMzkv?=
 =?utf-8?B?MndOVUZQbEFHN3dIdGI3THFOTURFVXdiM3gzVjRzbVNJY1k2Z0lIWmlHQXFC?=
 =?utf-8?B?YXBieDkrSSs1bkNRdlRJZHB3TkFtanJZYXNDaTZUeTBINm1LQ2h6YmZRRGhH?=
 =?utf-8?B?YXdXYWRXSTZXVXpzU3VldXp1YjJUZFRRSnUxUjBLYjhQQ0xURWxMalQ5UU95?=
 =?utf-8?B?TkN1STMwTGlPaEliZC9VelAxWWV3Vi9wVCtTcWxEd1ViRXdITG5sY1NxVGhw?=
 =?utf-8?B?Zmcybm12QmVPOWdQcWZqNk9ZdDdRM241dWh6U2N5YTVhOS81eVNadEhIU2l4?=
 =?utf-8?B?RzVGbTNsSlE2VmJuSzdlOTQ5eGdweDQrK1Z2YVJPblBMbnhUSFJGTEFYTFlZ?=
 =?utf-8?B?R0Ewb0gyQTBJd3VOQkgzOHpnQjdQakFDWUE0VktJU2tOcGM4bE43VEFlYUMy?=
 =?utf-8?B?elVIb1Y5bUdMS21HZlJoZkdNejFudFRuRWNMQjdaRXRMVUFMa2xIVlExdTRH?=
 =?utf-8?B?TWE3QTRBSmFjYThGM3FGdkFjZlFyZWhzWTdQamdza2dna0RGM01jQTlxMVpD?=
 =?utf-8?B?ZHJXeHVReGNIWEVEZXZOQ3JCSGpMckpvbzNkTHFVUGlVNzRwbnJLOWU3b2FL?=
 =?utf-8?B?NTV6Vm1MS29xOEdWRzFjNWEvMmJhSStOT1g5SmczaTJESEVCODZWeGZ5NWZV?=
 =?utf-8?B?c0VSYlZKU0d1YmNya1dveHNHeEFiUDRBblRGZFNySXEwV3NKTkFWVVRwUHQ1?=
 =?utf-8?B?M20xZ1FVRXNzS2xITE5EK1gxRFd0MktUd3RKeUZJMzZPekw2Nm1KemMwU04v?=
 =?utf-8?B?S09TUXA0N1lOY0dCb09jeld5OEFRRFpMaTBXSTBUbjRTOWxWdkVpcWJkLzU2?=
 =?utf-8?B?SHN1eEdQVEtVaWFmNFlzODgrWk5SQjJwZUFMKzFjR1MweThscE1uOURHSFV0?=
 =?utf-8?B?d1F6VFk0LzNSMmlWTENLOVM4KzRpL1k4bC9nOGpta0VKKzZubHpGRnRGWjJK?=
 =?utf-8?Q?Wms2MYv/YHBj9F5w3mIWwECLZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d689b95-2f4b-4950-e27e-08ddaf43a65b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 15:12:04.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckPvLBQ+sf6aZPJngTDXgXGa3kxP6okX8tamEDM2Q61sFP0mztT2A6hnKH/McIBWbjfo0/tTvq+pYc7g+2WklQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063

On 6/19/2025 4:58 AM, Du, Bin wrote:
> Thanks Mario, will fix in the next version and pls see some of my comments
> 
> On 6/19/2025 12:17 AM, Mario Limonciello wrote:
>> +Alex
>> +amd-gfx
>>
>> On 6/18/2025 4:19 AM, Bin Du wrote:
>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>>> called ccpu.
>>> The communication between ISP FW and driver is using commands and
>>> response messages sent through the ring buffer. Command buffers support
>>> either global setting that is not specific to the steam and support 
>>> stream
>>> specific parameters. Response buffers contains ISP FW notification
>>> information such as frame buffer done and command done. IRQ is used for
>>> receiving response buffer from ISP firmware, which is handled in the 
>>> main
>>> isp4 media device. ISP ccpu is booted up through the firmware loading
>>> helper function prior to stream start.
>>> Memory used for command buffer and response buffer needs to be allocated
>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
>>>
>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>> ---
>>>   drivers/media/platform/amd/isp4/Makefile      |   12 +
>>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  318 +++++
>>>   .../media/platform/amd/isp4/isp4_interface.c  | 1052 +++++++++++++++++
>>>   .../media/platform/amd/isp4/isp4_interface.h  |  164 +++
>>>   4 files changed, 1546 insertions(+)
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>
>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/ 
>>> media/ platform/amd/isp4/Makefile
>>> index 0e36201fbb30..c0166f954516 100644
>>> --- a/drivers/media/platform/amd/isp4/Makefile
>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>> @@ -5,10 +5,22 @@
>>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>>   amd_capture-objs := isp4.o    \
>>>               isp4_phy.o \
>>> +            isp4_interface.o \
>>>               isp4_hw.o    \
>>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/include
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/amdgpu
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/pm/inc
>>> +ccflags-y += -I$(srctree)/include/drm
>>>   ccflags-y += -I$(srctree)/include
>>> +ccflags-y += -I$(srctree)/include/uapi/drm
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/acp/include
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/include
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/modules/inc
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/dc
>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/amdgpu_dm
>>
>> IMO this feels like a hack and also fragile to be sharing so much 
>> across subsystems.
>>
>> Either there should be a kernel wide include/ header that can be used 
>> by both or there should be a helper exported to get just the data that 
>> is needed.
> 
> Yes, will refine to remove unnecessary ones in the next version, 
> actually isp driver needs to access function amdgpu_bo_create_kernel 
> which is exported by amdgpu and delared in amdgpu_object.h, because 
> amdgpu_object.h also includes other amd gpu header files, so have to add 
> these include path to avoid compilation error.
> It'll be greate if there is kernel wide include, any suggestion for this?
> 

Ah yeah I do see exports as of 
https://git.kernel.org/torvalds/c/ebbe34edc0a90

So based on what is in the tree right now what you did "makes sense", 
but I don't think it's "correct".  From another driver like the ISP 
driver I feel that the code should really just be something like:

#include <linux/amdgpu/isp.h>

I see a few ways forward.

1) A new set of helpers created for amdgpu that can take
opaque" data arguments (maybe the mfd device?) and return back a pointer 
to the new buffer.  Describe those new helpers in that isp.h header.

2) Manage the lifecycle of the buffers in sw_init/sw_fini of the ISP in 
amdgpu.  Store pointers to them for access in the mfd device, and let 
the ISP driver take references.  This only works if you don't need new 
buffers after the driver is loaded.

I personally prefer option 2 if it is feasible.

Alex or others might have some other ideas too.

