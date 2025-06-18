Return-Path: <linux-media+bounces-35199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8115ADF1FF
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 17:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A392D7AD73C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F132EE965;
	Wed, 18 Jun 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YiVN2vCb"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8A2ECD3C;
	Wed, 18 Jun 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262316; cv=fail; b=Ppsfh6YA7XKaKS0OdyprFFOrkpWSMn4bfMIEeFBeFL59OrJmGKHvXtLcRI9EIdxz/MHp0v4eD60mntWtDXTOWP4eMvTqmNrdHJaOm2FvY7kojeBtnm4l+eX1/9DtxQeKoqZ2UWHe/828J5LMNTbsOiM5JEf+SrSiJTcRMyeEcDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262316; c=relaxed/simple;
	bh=khG6Vysp3zVmHlCagT8haIcqVizH42IV1p9+xvG4N4U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DpKDtL8cqKpAZMHUpavC34R1pNx/kjPJEAFR1oYo5FQdlV04PB+1BQFq9VEwyuGWoEx5YzBhZEjDhIzievgVkQGkhJnS2bClxRj/o912x+NRZkpdljSRFFRORSZDZJVJEdBHArU+NGCpfrZffiCdmVlKgXoOCdjlkD/a/jGOh04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YiVN2vCb; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNr8k1g3YaYgEl3XU12jRHxan5aKsBCKoJdSsfvNvsw6D2iksoPO2nGH4UG8T2LkubLyGGbh+HuiBUIuqJ0ka6zNt+PKboClJ8yCoAgSedmPl7iN6mK3BiiN0Yb/6NdLIH38pUEJly/llVBsem/C5UIfRiEIuNX1Zqi/VwTGAg2iDu7r9MlI2IScwOulNRlW5HU4sQgQHh/H5CpW0L5iw1ijtcI79QuMn//xjH4NRYkSiAd5Fz5W9mKUp3zOsN2q21R12tvNgQ8782UyEeqaEY3e7KhmzBB9Kw/QSdZQoG5GTXlPNxjg9Ti3csK5+2ffOp4+UOsreCaus/sXnSGrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBJ+xBLsXCh85frxcBMIlpAL39iw30odLuGcfiRo1ec=;
 b=NmUOkwyFSLd8woGeTFAX5ZH/OYypyc25gKUhBKUJ4yU6ngtJe86f9/Ko1BUmVOKnF6EwarPjh3JgMLy584381ZwxkNrcq2QBidb8U+PyDSjw1pyR2unRiwn2MvVbTkPoL/g6tI2Mgg41JH/+FRxtL54qpeC4DNm0Hm2PAQHIphUIajYrPK0Iu7UkyyhC6FfzBPUV1XtHWvUiHojLriy5157qjleWJ9DviAmDmJTqprLFl5Bvuxm8P/lhP/9RuZrt0szFMMPsqFclqPcWHHrjOKI/1pVf8PiZsK83AAqOJjcT7bqkG0uJoURfH8iuaGWUw05PJ8CS/mZjBXEBXfbOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBJ+xBLsXCh85frxcBMIlpAL39iw30odLuGcfiRo1ec=;
 b=YiVN2vCbw+9CmMfhBl5HO6B7xK71Vw2WZPtWUsT1j8usz4dbX1mSzQfGtz97DJlZ4nEWkcpiC6jfvMMEDoAT7K7rKp0O75Yevk2JJBlvFsgcmUJ1y/AKKzjP0NVtBqH4aTEXv6tGXQj28cGrxUE02zN2wZkZ3YG+AfSLzxBvIkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 18 Jun
 2025 15:58:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 15:58:30 +0000
Message-ID: <0c4240bd-4918-48b3-aa8c-3860fa62db00@amd.com>
Date: Wed, 18 Jun 2025 10:58:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture
 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-2-Bin.Du@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250618091959.68293-2-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0109.namprd05.prod.outlook.com
 (2603:10b6:803:42::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b997864-dd35-49a7-0e64-08ddae80f83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXhkckwwMElCclBWOTdPaExxWmQrejdabkEzUXlYcjBFUlJqNGlWV05kNGMy?=
 =?utf-8?B?OG5lYU9ZdnNWdVZla3VCcGxkRnZmZi9haGJ1WnBWSDF3NVQxQ3JKbGN0RFVw?=
 =?utf-8?B?b2lHM0lYclFtaEJ5Qkt6aWcwdmU3bDVXL3JDaGVHRlVlUVh4Ukp0OVRLWlZr?=
 =?utf-8?B?VkZxa0U4NEhtV3I0TTN1M2xBQm9yWTJxMVlpU1BEaGY3QmcrTGFOZnBFZDA4?=
 =?utf-8?B?a1psaGFVL04ySDAyZHNpSGMyR3U4QmxGL29qbW1vb3pxUFFXQ0lDTVNybktZ?=
 =?utf-8?B?VHZvRmFnL0ROTXBwRDBFSytVQXBOeVNxbnhjMUVxN2pMOGlkaU5vL08zRzhK?=
 =?utf-8?B?Y1lUV0RZMW5HUml5REJ0TGxlWXlrM2hBN1RFL0hmSHVUUUtOQXJNZFJpelI0?=
 =?utf-8?B?Z3BsS29DQzc3aEpyQzdKSklpYk9Ndy9iNzFiWXIxaUVUVjlGaUxyc3p0eCtJ?=
 =?utf-8?B?S1hkSEVFSmNaSHVHRDZMNm1RZnE3ejZpcjVhd1RGbkMwdk1EUHZ6OCtRLzJ4?=
 =?utf-8?B?VnhsR2U4MlZhekJ2Mm5WNUcwQzJjODFaMGwzQUI1dFU5RXAyeDFIT3orRHh6?=
 =?utf-8?B?algxS2FOYjRVRllPSTZJNmFtTGttUCtFaks4Y0VWa3F5NnVteU5paURRRjc0?=
 =?utf-8?B?YllBWDh3emlYbnlvckgzeHV1aUJNWldRWmVFSXVLUXRKa25HWXhPa1V6OGxZ?=
 =?utf-8?B?bDhXbW9nbEl2Q1g2eFkyQjB0d2pzb1d4UkVkK3Rhckhweit0MStVQjZBUFRy?=
 =?utf-8?B?WU5ib3l6akl6VWFjc1JNdGhoNWFtaFp4S2E3SzBVcjNKUy9LUFlwbHg0MjUy?=
 =?utf-8?B?Z0hkTkVxSndNLzJjL2JlVFp0Y0lJZHVGbGdNTXlQNitSSWp2NTFVaDVObkth?=
 =?utf-8?B?RElXeXo4dUdpZnIxSFV1Y3dLU0pMbUZXejVjSWFSekU5dnB5WFErUjg1bmtY?=
 =?utf-8?B?U081RjJnOGk2b2I0enhmdTliNDVkdEJkQmJGNHphTm0ybVB1UHFQR3JuUVBw?=
 =?utf-8?B?TUh5L2Z5YVhVTm1ybk9wWTZLK1JVS1JweDU1T3NhNmFCSG94akxhSC9iU0c0?=
 =?utf-8?B?Q3RXMVlsdW5JMW1ieE53SDlnMm1QN2ZmQXJVSlV1RW9ycVhvWHhxUUcxZWI5?=
 =?utf-8?B?bHVlcGRLcm1jY0NMSFE3c3NDOVlzY015WkRGbUNkd1FDakk3T0hYNE9DbXpw?=
 =?utf-8?B?QWpFMUhmbldVNXlYN1hYSDRFT2w4c0Z5S0xKbWdJS0twRnVvK3UxS25oZmVx?=
 =?utf-8?B?TzBTOTZtM2ZJcHBpTW5WV1E5UHRncmpWcm1pS05nNE1kMWNkbVNZMEZGYUdK?=
 =?utf-8?B?TmhQSkV6VVMvOFl6OGg2Q1FSUUc1N0ZMVk5FTjVhcTRKNXMzU09FQ3NXL1pM?=
 =?utf-8?B?S0M5UmVNMGNkUWtQckwyc015OWxiVkhtd1A3aGI3YkxIY2pmZlAyejM1VjVS?=
 =?utf-8?B?LzRMRFBIVG12UjhaU2pZZ3pQUkpJVGs3aUVvbmZzMVRPL1ZhZTBoOE1KMjVl?=
 =?utf-8?B?Sk9CVU5OZ01oUG5reEkrTVM1TlZ6R01GTWZGU0lFTVFTaXNvVDlrQktLd3hD?=
 =?utf-8?B?dzNIM05IQVlBMEtaTEtldVBONmplRFRnV2ozbVVycktaa2I3WHpYZU5WcXUx?=
 =?utf-8?B?WGp2dDZWR0xiSlo0dGpCNjN2UlBtWU1vVFBZSDJDbXNFTFl3ajlucXZSY1ZK?=
 =?utf-8?B?Q0hRTlVnMExwdXNVR1VFYTZaWVhIVzNDeDRRZTJxcWdtcmdpQzQ3MUI5UUdl?=
 =?utf-8?B?T2p6UjBaMGNUd2tzRVVjOE15L0NnMFdXSDdHZE94bVVtanYwNnc5MnBDNmtm?=
 =?utf-8?B?N09rdzMxejBjMHIzclFRL2FIbUdYTHNYbjUzQmp0VGpKcEdjcXpyQVJsd2Qw?=
 =?utf-8?B?UGZVcTRsNGJRRVdYb3hCZ2Jpa3pJK1drWUs3UEJpdVpDMkhjUFIvM2t5dmZh?=
 =?utf-8?Q?MTixXAljei4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajVhc0ZVcTh4Y2hETXBYNzRvRndqb2hNVkxKbElTZHk2S2wvSVppRnc2dU50?=
 =?utf-8?B?Ym9oN2ZYSi94RnNQUy9GMGI0K2F2WDJkdDdIbEJZeXpybWw1c2lXQzJqUGZa?=
 =?utf-8?B?QUJnWkR0VmFhNktYZ1FCdHNUN2pGT2RPTTk2M0VITmpGeG9HRFlvSFZGMjhm?=
 =?utf-8?B?UlFXc0J0Z0t2NWVQQUI1WHE5ZWJoSWttR2ZvY3NwcEU1MURCTVVGVTczMHBk?=
 =?utf-8?B?RTdRWGd2T2FEVHFoTU5VeFUrZVpiQ1ZtSW1VWkJiNnF6ekh4bXhrMUFreUJQ?=
 =?utf-8?B?RzlDTTBCSnZuR20zS2xrU1dUY2dlOHFBU2l3SnRQMURtSXc4SmwybGlXRGJ6?=
 =?utf-8?B?QWN1K2JKdXhuZHJoM2R3bSt4Q3J0cjU1Mm5NekUra1ZDU2dpMWhkelRhYkpY?=
 =?utf-8?B?V2puNm5kbEMyVGFFdXVsU21aYjI5cEZUMWh2MHZ4MXREanNBN0lzWmhnc2hv?=
 =?utf-8?B?clZzeDlnek5wSDdnNkFmNmNCdFRxNWpTdkZUNTZZamhNUWxVOGJhSlRXSStO?=
 =?utf-8?B?YlJ3a1NGUWtWTlFxZ3U0Wis2VXVDNlZYMDF2b0tqMEw1M3hXM20zOXRCYmRk?=
 =?utf-8?B?b2pFclorMEpLZFVOTEtqNjV3TEExamcxWnlhbEtQbWNLU1dZNkhGeHdKMFJl?=
 =?utf-8?B?ZHo5N2UxeHBMOHBjUm1wNVFYbmMvbU5vbHdXV1Y3KzRNMkQrTXNic0hFWmd1?=
 =?utf-8?B?Q2E5WHVyNmhkYTVlQy93ZmhEbllWcTl5QmpGQyszOURZQitWYWFIbXJRcjZn?=
 =?utf-8?B?NHZYWG9NQzM5SGRBVE5OMVl6YTFIRm9lWnFSVnJKWDRVU3JTcURlWTg0Mjdt?=
 =?utf-8?B?Qm5GTlowdHFjK2lJM3JJa0daT2hNTVdtUklxeExHRHpvSzlyS3U0TkJEcnd2?=
 =?utf-8?B?UFBUWW5HbVk4L1gwcGtwdVl2OGxxcVpkMm9LN1Z0Z2RsZ1A1eVQrYmMwb25q?=
 =?utf-8?B?T1doYjA5TkMrUnFRUHdqTEVHNWVGSFpXL2Q1RXVQNk9kc2ViMmlkY1N6bXNy?=
 =?utf-8?B?MnJ0SHZTQXpuMUttL0d3RkdTSlpDUndMTGFSdEp6bFFMYUZiV2lFc2syZlJO?=
 =?utf-8?B?ZjkyZnFCS0NLSkY2eEFhVjBjeU1rVFN5WEl6bEZ5T0pxV1VhZ2FJMTJOek5a?=
 =?utf-8?B?dDl6Qzh5ZW9ucTIzb2tQR1U4RE9wS3d5MDVFZU5CTzFSeEI0Ujg2SDBhaVNm?=
 =?utf-8?B?WFVNVmFkMmtkWXVndEFMeTZCMEpVMk1KdlEvcWdCUjFpRXp1eVZuR1ZXRzlk?=
 =?utf-8?B?VzVIaFdHQXlUWDNBK1lObURrTjRxSTZQbWxBWXZsNXhGTUZoL0ZvUGxmQWxP?=
 =?utf-8?B?c1Z4R1BoR1A5bmo3Wll3UmdPbWZ5TnRRMHhKZmJjZTF4bnhFM2ozR3R2em5P?=
 =?utf-8?B?NElDaWZtOFZ2UjgybEplNkhZNy8xU25BL0NwMVNzU1R6RnYxMkFjdGVVRHRE?=
 =?utf-8?B?eVRSNTdsSCtrN3RpaFc2YkZpNUpQN0dXeHlKOHRLRDBmQnV6N01yZVNSUGtD?=
 =?utf-8?B?djJ6eURpV1NxYitlaHJDblJybzlHbE45NGFKdXJ5VkZlSW5aTUk1ZE9jekt4?=
 =?utf-8?B?SHg3WDJnSmtEcHhDRS9NbUVQVEVSTnBZeDdDVTQ0YmFnWmMvRTF1ZUlNRkVE?=
 =?utf-8?B?dDR6cUc4bTh5YmFRV2ZMUy9lbU9sa0VJalBKUElhYmtmNU5QZ0VHYUJKeHRi?=
 =?utf-8?B?YmhxeFJDVW45d01vZ3FkeUhnUDIvNjFIbEFyd0phMFFwSm9lR2xXcytJK2Rk?=
 =?utf-8?B?L2taSG5iaUFrRXkvR0FNSE9iT3A4NnhHY2Z0VnFvaVl0VlpvbytmWTVFV1dX?=
 =?utf-8?B?QzNiOHBvcDMvY2JBUHFOajZZb0dkWnlJQ2VyWnFBVW83M1lYTUg1L0ZDYStw?=
 =?utf-8?B?UWNCQm5UVVJvVkZhNmI3OWxkdnpHektyZHN2MVQ2MTQ1cmNSTEdWdzhWUyto?=
 =?utf-8?B?ZFNXSGt5REhKblI0enRXcVg5NHlucEJ1b2lrSWxWRThackJaSEFaeWlWTmd0?=
 =?utf-8?B?a2k1Szh1UjZnb3FPTzRJOC9rNmp5RmRWWXJkQm5lUlRMWEhudkx1bVFlR3Fy?=
 =?utf-8?B?d1F2Zzk5emtXSG9qSWF2SXd3RllGNCtUcHk0UXNQNml3TkQ5a210TmFZQ2d4?=
 =?utf-8?Q?xZiiZ2FLTZN7LhnDYbciVfja+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b997864-dd35-49a7-0e64-08ddae80f83f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 15:58:30.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nz6sxq0dzUyyZZ4/9qfLo5coZ9oYf4GHmINriVaAdZWXDHE8aJ3mT92Ummz9yNCxWZSNTUsdmvhUFKJDIj54dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489

On 6/18/2025 4:19 AM, Bin Du wrote:
> Amd isp4 capture is a v4l2 media device which implements media controller

AMD

> interface.
> It has one sub-device (amd ISP4 sub-device) endpoint which can be connected

AMD

> to a remote CSI2 TX endpoint. It supports only one physical interface for
> now.
> Also add ISP4 driver related entry info into the MAINAINERS file

MAINTAINERS

> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>

Who actually developed?  If both are developers there should be a 
Co-developed-by tag.

> ---
>   MAINTAINERS                              |  10 ++
>   drivers/media/platform/Kconfig           |   1 +
>   drivers/media/platform/Makefile          |   1 +
>   drivers/media/platform/amd/Kconfig       |  17 +++
>   drivers/media/platform/amd/Makefile      |   5 +
>   drivers/media/platform/amd/isp4/Makefile |  21 ++++
>   drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>   8 files changed, 229 insertions(+)
>   create mode 100644 drivers/media/platform/amd/Kconfig
>   create mode 100644 drivers/media/platform/amd/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10893c91b1c1..15070afb14b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1107,6 +1107,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>   F:	drivers/iommu/amd/
>   F:	include/linux/amd-iommu.h
>   
> +AMD ISP4 DRIVER
> +M:	Bin Du <bin.du@amd.com>
> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	drivers/media/platform/amd/Kconfig
> +F:	drivers/media/platform/amd/Makefile
> +F:	drivers/media/platform/amd/isp4/*
> +
>   AMD KFD
>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>   L:	amd-gfx@lists.freedesktop.org
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 85d2627776b6..d525c2262a7d 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>   source "drivers/media/platform/verisilicon/Kconfig"
>   source "drivers/media/platform/via/Kconfig"
>   source "drivers/media/platform/xilinx/Kconfig"
> +source "drivers/media/platform/amd/Kconfig"
>   
>   endif # MEDIA_PLATFORM_DRIVERS
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index ace4e34483dd..9f3d1693868d 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -32,6 +32,7 @@ obj-y += ti/
>   obj-y += verisilicon/
>   obj-y += via/
>   obj-y += xilinx/
> +obj-y += amd/

Is this whole file alphabetical?  If so this is the wrong place.

>   
>   # Please place here only ancillary drivers that aren't SoC-specific
>   # Please keep it alphabetically sorted by Kconfig name
> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
> new file mode 100644
> index 000000000000..3b1dba0400a0
> --- /dev/null
> +++ b/drivers/media/platform/amd/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: MIT
> +
> +config AMD_ISP4
> +	tristate "AMD ISP4 and camera driver"
> +	default y

I don't believe this should default 'y'.  Normally drivers need to be 
opt in.

> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	select VIDEOBUF2_VMALLOC
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_DMA_SG
> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called amd_capture.
> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
> new file mode 100644
> index 000000000000..76146efcd2bf
> --- /dev/null
> +++ b/drivers/media/platform/amd/Makefile
> @@ -0,0 +1,5 @@
> +# Copyright 2024 Advanced Micro Devices, Inc.

2025

> +# add isp block
> +ifneq ($(CONFIG_AMD_ISP4),)
> +obj-y += isp4/
> +endif
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> new file mode 100644
> index 000000000000..e9e84160517d
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
> +
> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o

As the directory is already conditional on CONFIG_AMD_ISP4 is this 
obj-$() needed?  Or should it really be obj-y?

> +amd_capture-objs := isp4.o
> +
> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> +ccflags-y += -I$(srctree)/include
> +
> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> +	cc_stack_align := -mpreferred-stack-boundary=4
> +endif
> +
> +ccflags-y += $(cc_stack_align)
> +ccflags-y += -DCONFIG_COMPAT
> +ccflags-y += -Wunused-but-set-variable
> +ccflags-y += -Wmissing-include-dirs
> +ccflags-y += -Wunused-const-variable
> +ccflags-y += -Wmaybe-uninitialized
> +ccflags-y += -Wunused-value

Do you really need to enforce all these flags just for this driver?

Was this just for development to avoid having to remember to call the 
build with W=1 or CONFIG_WERROR?

> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> new file mode 100644
> index 000000000000..d0be90c5ec3b
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "isp4.h"
> +
> +#define VIDEO_BUF_NUM 5
> +
> +#define ISP4_DRV_NAME "amd_isp_capture"
> +
> +/* interrupt num */
> +static const u32 isp4_ringbuf_interrupt_num[] = {
> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
> +	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
> +	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
> +};
> +
> +#define to_isp4_device(dev) \
> +	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
> +
> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
> +{
> +	struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
> +
> +	if (!isp_dev)
> +		goto error_drv_data;
> +
> +error_drv_data:
> +	return IRQ_HANDLED;

In patch 5 you change this function, including dropping the goto and label.

So I suggest that for patch 1 you KISS:

static irqreturn_t isp4_irq_handler(int irq, void *arg)
{
	return IRQ_HANDLED;
}

Then in patch 5 add the extra conditional code and real handling.

> +}
> +
> +/*
> + * amd capture module
> + */

Pointless comment, no?

> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct isp4_device *isp_dev;
> +

Why newline here?

> +	int i, irq, ret;
> +
> +	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
> +	if (!isp_dev)
> +		return -ENOMEM;
> +
> +	isp_dev->pdev = pdev;
> +	dev->init_name = ISP4_DRV_NAME;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
> +		if (irq < 0)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "fail to get irq %d\n",
> +					     isp4_ringbuf_interrupt_num[i]);
> +		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
> +				       "ISP_IRQ", &pdev->dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
> +					     irq);
> +	}
> +
> +	isp_dev->pltf_data = pdev->dev.platform_data;
> +
> +	dev_dbg(dev, "isp irq registration successful\n");

As you have error handling in place with dev_err_probe() I think the 
lack of an error implies this message.  I'd say drop it.

> +
> +	/* Link the media device within the v4l2_device */
> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
> +
> +	/* Initialize media device */
> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
> +		sizeof(isp_dev->mdev.model));
> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
> +		 "platform:%s", ISP4_DRV_NAME);
> +	isp_dev->mdev.dev = &pdev->dev;
> +	media_device_init(&isp_dev->mdev);
> +
> +	/* register v4l2 device */
> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
> +		 "AMD-V4L2-ROOT");
> +	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail register v4l2 device\n");
> +
> +	dev_dbg(dev, "AMD ISP v4l2 device registered\n");

As you have error handling in place with dev_err_probe() I think the 
lack of an error implies this message.  I'd say drop it.

> +
> +	ret = media_device_register(&isp_dev->mdev);
> +	if (ret) {
> +		dev_err(dev, "fail to register media device %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
> +	platform_set_drvdata(pdev, isp_dev);
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +err_unreg_v4l2:
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +
> +	return dev_err_probe(dev, ret, "isp probe fail\n");
> +}
> +
> +static void isp4_capture_remove(struct platform_device *pdev)
> +{
> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	media_device_unregister(&isp_dev->mdev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +	dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");

Probably not needed message anymore, right?

> +}
> +
> +static struct platform_driver isp4_capture_drv = {
> +	.probe = isp4_capture_probe,
> +	.remove = isp4_capture_remove,
> +	.driver = {
> +		.name = ISP4_DRV_NAME,
> +		.owner = THIS_MODULE,
> +	}
> +};
> +
> +module_platform_driver(isp4_capture_drv);
> +
> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +MODULE_DESCRIPTION("AMD ISP4 Driver");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
> new file mode 100644
> index 000000000000..27a7362ce6f9
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_H_
> +#define _ISP4_H_
> +
> +#include <linux/mutex.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
> +
> +struct isp4_platform_data {
> +	void *adev;
> +	void *bo;
> +	void *cpu_ptr;

Will touch more on these in later patches, but I would say don't 
introduce them until the patch they're needed.

> +	u64 gpu_addr;
> +	u32 size;
> +	u32 asic_type;
> +	resource_size_t base_rmmio_size;
> +};
> +
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	struct isp4_platform_data *pltf_data;
> +	struct platform_device *pdev;
> +	struct notifier_block i2c_nb;
> +};
> +
> +#endif /* isp4.h */

/* ISP4_H */


