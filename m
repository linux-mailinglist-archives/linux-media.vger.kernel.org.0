Return-Path: <linux-media+bounces-17582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9A96BBC7
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50436282F81
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915271D79B6;
	Wed,  4 Sep 2024 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fCM8pG/s"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71B1917E3;
	Wed,  4 Sep 2024 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452182; cv=fail; b=lAbJQ827a24sAY5cJ0HNjT9i9B4H29v6azck1ne/5ju1vLCo6nBhgl6M92+AXLXSfi+stJXkqnvpOMVxtr4dfivPDTbO0leH8IIK13RhYinc9uhKflqojLtTXXfY6JaEUWHzQW/NpFmXtDOYTLE6rzQZSPh60GgyItEzsil0oWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452182; c=relaxed/simple;
	bh=OSK/FlO+Rwy5a6ECI6ndVdgwMSCUABsbyt56CY9S1ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NuBSALQpRoBS8VAA1schb30ExcA7Nl+re7z81fh78/nz/tU18bNya9Jzas8BuETNmUoYs6wVxqPkn1KupEEEjOi07+wTsNu//NSEoax8ynwO9hzeC16Pd/1un0IWw24a8Z5B5KdRzYW5TmcUcZASTq0d3LorzsJ0UwernF4htS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fCM8pG/s; arc=fail smtp.client-ip=40.107.95.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8t24l2oTGV6b8DCSYVloAnmpte9qVT+uLR/YVKTRGPegb8T35ZNw2gG2tFVQ1phXSvVcxqNUzLfL9H4ken7NelCpy1sTfQEa+hZEAeoHiWG1t/w/pIrOI6JSF22JYBEk8DNvOmcRP4j8QiOFeYVPKz4Y+dwc7P1tOzCokYQdbU/qUWJ8DQRqCx/uLxlXiuM0LsgbI3ZsjU/+0Ddy5YDo9cMHFLEEhFKjRHi7Eq8CgrEk2aCuk6/kII6SoabAnS2LNtQfpsrQsuFySJ0kOaf3sZsOqHoiMMoZUYYCgKnSc0d0048yPXQw47W6NR0NuH8YmGAMpLXIlozfVIdjKXY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OhZCBpyTK0W3W5A2C/UrhR8TkO98+g/AbdZxE6cQgU=;
 b=w6swp8LbqXrtD9G9I65R+1JCAlhQntvDuNQw/UdsE4QDR0ERiOrvWPV4jf1VqLPi25wVbed6Nar8pGC1Au/ayRVzPJ+JESnxBWtv93neDtevZqNZxXHJAOt+mLNB4nVxMmrmJu0Qg5lsIcpatLv4/EWkYqqjmiuC/hHvty3ceyPte/zvEYf/GHatbToYi4hRowjTADsWWHPVazFjTKTCOOtnY9aLZe3AKGBYn9tzj0zQ9ksS9fCJpLcDcN/mEi/xPSMOqP4EU0qP9AilMx4agCmf3DjXk32Upc2xYmA/ilR3Q4vPN7XPhnQm/t4F2QbX0W9DP2vHjMdEzt68W+gGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OhZCBpyTK0W3W5A2C/UrhR8TkO98+g/AbdZxE6cQgU=;
 b=fCM8pG/sK3/bGwBz43QS83tFIftMFWrqtzfhXdmGVauwnU3OzIV48vvmXUMHCE4Qm18yeA+sysHyN6I7ooFja4N/gRgHMa775nQ0NbrVIEHRmsOGAtzRnQltAKbzIv1N7VDfQ8G7BgQjyzRnRoGNvNVaQvJ7PiItztRskoNRElA0iV4CU2zrTW8umHooKK9/g1hBDfOZdUIA1MBwkTYgBhc62Upk2PcTRLPX0D76rZSTGGyenFw3J+uRrW8bB/1Ql6WmZfWUFVB1RkVQk/GFp9G/2Q83ILXHLsRkmNe19mJQvnkkDa1b3lnhucIAb02YZFK70ApBZFGFraw0rfW7gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 12:16:16 +0000
Received: from CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8]) by CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:16:16 +0000
Date: Wed, 4 Sep 2024 09:16:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: firmware: Use
 iommu_paging_domain_alloc()
Message-ID: <20240904121614.GA782327@nvidia.com>
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
 <20240812072105.9578-2-baolu.lu@linux.intel.com>
 <c5141c18-3f7b-41ac-a064-9911873d0bf9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5141c18-3f7b-41ac-a064-9911873d0bf9@gmail.com>
X-ClientProxiedBy: BL0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:91::34) To CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7763:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 8009ae8e-c386-4f80-29a3-08dcccdb6019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjFaanFPWTU3MXRMbjBjay9PZ1hWSzdvTGJaaEhlTmhnMEVZdWdqWjZjUytX?=
 =?utf-8?B?ajZ2aHN0Tk41T2kyTmRabm5kWmVnRVV6allyeENwVVBpWjJDaWJMMzlWWXla?=
 =?utf-8?B?RFdvMURweXY4RFBPeG1OZmltODRpZVI4SFB0Ni9tU2ZaTDZVa2tMSkZPYkxq?=
 =?utf-8?B?aUpVa2QxRzBBdjFNUmM0dUFqK3ZnQ0xmMm9nU1o5cWxBOXF3RlF0NytTZjFK?=
 =?utf-8?B?UUVxRzIraEtlNzBEQjhFYUsvWlRlRHI5UUNmUDA5UjY3R0NQcm05dFByRUQz?=
 =?utf-8?B?QUYyTjJvUjJmVUZLbFpoRytNMVBCdERvUk95TTZBWUtnUVpxc2FnZWFaUmdM?=
 =?utf-8?B?Zjh3Z09ENm05c0d5cnFySUt5M2IvZ0k4eEZZK1VzZHcrbHRsUUdrZlY1Y3Fl?=
 =?utf-8?B?VVEzQ3haak5QMG9lSmlXRG9FS1VhT2ZMVEJjR2svMzBtT1Z1N1VQeUdwWktO?=
 =?utf-8?B?amRaSDUrQ0VueklrNDFtVmY3SGROREhsZTZHUHA1S2tNeTE5akxEcThiQ3NX?=
 =?utf-8?B?Uno4Q3NZQ2NLRFpTL1NZd2pQK2dYb1V1OTVMaHNKZ2kxUGlIakRzdU5ldDh6?=
 =?utf-8?B?c3VOUjN3YmFPSFNKVEo2Z0RyWi93eHdQUnIyYjlITjhOMmpCSTJzTXAzWUdi?=
 =?utf-8?B?MTZnNWhDdHVlUG9yamZ3a2F3ZVZreUlpT213ZUhudGpwUHVBUHBnWGx1aExv?=
 =?utf-8?B?VXlSY2JuRStUQXIxZXRLQittS1grYWtRUmpkQ1ppM0ZNZDdwRS9WbEtQRFNN?=
 =?utf-8?B?Ykp6S2dRanVrejhPdXd2TEVYMUIzWnFZWTRBMklmVHpBVm1mNUdBZTFWMWVN?=
 =?utf-8?B?UjZUa2t4QTFOTEkwejJKdEU2b2c2OTk4Z05ubk5malZnYmo4NnVUN0RJNWhL?=
 =?utf-8?B?WTY5dUFnQU1qYnFWMm5mRWt2SHhIcmdKc1VDTTYxdWRZdlBlcjVKaUpiZ3p0?=
 =?utf-8?B?aTVCM2E1T2VpMkF5SlAxWUwxei9IWXRlamFFQWFMUVk3M0kwV0NTd3dtVVNv?=
 =?utf-8?B?cXVNK2p6RTJEVjgxMGpVMGxqbDNEQlQyaHBtR053Yjh3dytrajhTVm5pTDAr?=
 =?utf-8?B?UTlsN2p6YUxkUU8vUFQ0WFAzdWptcC80KytwWHhLeWhRQmppaGtCOEVLU2cv?=
 =?utf-8?B?UXlWU0U2TVFaczNwam9VZUlsRjEyaGYydkt3UHRxUDBMSXhXY1lDSG9LVFpq?=
 =?utf-8?B?RVIrM25BZ0d5VWljM21XTnpDZGVyM1lmZWVSSUZqMG5YUFVWMEw5b25WUm4v?=
 =?utf-8?B?VEZvRFB1SUQzNi9VWkgxQTNsQ3kvS1kvczFtdWdFWHV6Yzcvb0Eza1FJOGl1?=
 =?utf-8?B?MzJvNmhZR1REMElhbmJ2cDQ0dTlNSy9aRmJnOG5EeEU3VDN6azJ1WUdzY1Yy?=
 =?utf-8?B?UE9rTzRudVM2RG1WRzJFNG80WDlFZnZQMGt3b0dQRzJPdmhKMFBGYzBkYTFy?=
 =?utf-8?B?SW40SHBlbzB4VjBXdFRidW0zOWF5RHV3RHNic3VPcEhaemg3aWkwQlhabTZI?=
 =?utf-8?B?VWVMak5NQWk5T3hrQmppQW9mTzNoWTBlUE1wRWEyVVptYXRMbWx6c2Z4dVpM?=
 =?utf-8?B?UHFENUtOdmdVT2xya1BwTG1ETlFjOG9uTDRLbk9jR2tHM0kvaENQbUFMY1Jo?=
 =?utf-8?B?Vk1BTWE3OHB1SjBEdDF2ZzNyckZzbUhPMHBGcUhVRTB4SVFRNkphS2Fka2Jk?=
 =?utf-8?B?eVJHYVFOemJ2MDZKWStCVlNJdWdYclpUeXkvamRYdkhiN1V2OG5LejZyZWlK?=
 =?utf-8?B?UW11cVl6VmNxUU9BMXpvWHVqUG1nWm9GOFljbDZPUHRSRjBoeWRVTVREY3Fx?=
 =?utf-8?Q?6zn4i3cYUOFDlqQN3AXEl1HDVGxgHNbrDZyAY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFNFVnpBS0FDYVgxVks0akEvWFlsRzhQMkFhQWcyKzdjZGF0bmM5UUZ2d2g0?=
 =?utf-8?B?VmRkMDVtYWtQTlFjNUMvaEFhcXI0cjljZEhaOEl3aXJKdEgvMW5pc2hUT1R0?=
 =?utf-8?B?d3NoaDd0M0NZK3d5NllhRktVUHdrb0xFU3FpcUhvQWZwT3d0SzE2OVBxOEU4?=
 =?utf-8?B?Vi92T0FwQVg1VUY4Q01hRDIrSHR2NG9PYzQycUxuUDlkR2Fic2IyZWFCOFha?=
 =?utf-8?B?VklQaFBKbUJQNWZGMXYxVmlGR29rcG82MXVEZTh6cHd1NTRmdG0vak1hc0tQ?=
 =?utf-8?B?NkNpTG5yS3BIWVhaQmlqYTQ1NkEvN3ZFbksyeEtpRmlBYSsxSmRUaWZTRGFO?=
 =?utf-8?B?ZlB5R2diT0xVSFV1UDdDN3Q1R01zQ1pUUzJIZSt3OXExUUJrcThIci9hQkJq?=
 =?utf-8?B?c0RuQno3dlBSVUpTREl2NTE1TXQyRDMwdU1uS3hiYUE5Tkh4a3UvWDZFc3pu?=
 =?utf-8?B?Z3FXVzJrd1htbFNLZGM5dnBDVlRpdVNlMEJrWEIyVER6S1hZblZvd1NieFBC?=
 =?utf-8?B?K0haZ2JPa3lmRm5UUDFTQWk2YnIzcHlnM0VvZjRLK3RKcTFFTmJxSGZsdUNC?=
 =?utf-8?B?ajkzS2E0cGtwZHMwMVNJNWk5NFUxZ0dWTGVjUmVVbDYvTUh2RTVHbXJUa2c0?=
 =?utf-8?B?ajF4OXVFK2VpcHN1NTRsRnB1QWRGWDcxVWg5MFRrQmJnL1JRNm1qdEN1V0lQ?=
 =?utf-8?B?bnN2N0RTeHVYUHhmMUxFNEVUbkFLbWF6ZjhIcHNPQWQ1MCtkV2hyaVdneHUz?=
 =?utf-8?B?Mk1RMWQ4WjdhQVZiSEphTCtzckJFNkdjZzZ4bGNmTWx4K05ML2NINmNuSGcw?=
 =?utf-8?B?ZFdkVTRYZnFNUHdhOVBlR21SWHc5RnpQRmFKU2J3M29VZ2I4T29qTjJsM3R3?=
 =?utf-8?B?ZjVId1ZaYmRIOVlTaXdsYW1peHBadVBad3VsMUduNFZWUFZlQ1k0NXMyZUtu?=
 =?utf-8?B?Um43MWRCSkgzejU3OHpzeTByMVM0Q21iOHMvR244U2p4dnorbjAweUxKUkRj?=
 =?utf-8?B?eFZpdWQwWTV6Tjg3b1pmckErMVdpVFpCalhtdlVqNjAyc1l5b3ZUNUdoaVhq?=
 =?utf-8?B?c2VMQUlKM1YzSU1BeURVQW11S3JSOEovVFlXY0E5OU5YOG1TaklNN0puMjk3?=
 =?utf-8?B?U3FYL3ZPclZnc293a1Z1S2JDVjhxMlhaS2s1UFRibHpUSFJvVkE2VzdkWlAy?=
 =?utf-8?B?K3R3ekdJemRmMnBVR3hNUGRMS3FXY05UdFJxdXdlY0toVjZUTzdjNDlmVTNa?=
 =?utf-8?B?ZEpaM2ZudUpDUXVCem4yUVNDVFVRRkY1T1lvUzhvV1Fzdkg5N0VXendoTGsw?=
 =?utf-8?B?T0h5UDRHcFAycmZwUWN2UzJGOGJLcjBOZTFkbXBRQWFsUnlSRjAwa1Q3YXkv?=
 =?utf-8?B?eUhCcWlBb3BSUlBRYkFMWCtTUFAvVU1yQkYyVGJNWVFKV2cxREI4b0RuMXpT?=
 =?utf-8?B?TFVOUmRoWTVUVWtId2U4bHV0U1RINkUyQkI4VGVQcUVEUEM1OTdoejFGLzF0?=
 =?utf-8?B?dElJc1ZReXcwdURBR3NCcmZEOWRMN0s5ZDdrVFRYSGVnQ2FoTW5leEtMVFRP?=
 =?utf-8?B?ZXhzRFVBWWl5WHhEOE9rUlBYdVlWaHo3MzlzMVJ6a0ZKZUVrYW5yc0J4WjZO?=
 =?utf-8?B?aTlkdmsrSjBXblNjMlY2RXcwb05vWktqT1RXQjAybkRNaDlFM3U4QjFVb2Iw?=
 =?utf-8?B?ckRUNVEvQXVUQTV1eC9yNXZXeExjQ3MyYWxKbmEzUFppTFBnSUJyQ3hJZU9U?=
 =?utf-8?B?V29XbXAvWWNYL2RhTkQwaW80NUtSSnRrQ3VPYmVUaXE0WGpmaCtYdnZTWnpV?=
 =?utf-8?B?b1FyR25XTlU1SFVrWkp1cXpwd0NnSEszaFhVZTBCN3E1c1FENnNWMDlBNXE0?=
 =?utf-8?B?dEh1VUE4K1laTlZtbVQ3L0JvRWRZR3NkMU1IUGt6cTdpZXh6dEJCOXQwdE1K?=
 =?utf-8?B?YmJxVmpuUjlkWCtDNlRGbVI5bUx2eVNTdkFMaWxXSmpYc1BiRTlYVkhrY0RB?=
 =?utf-8?B?Qm5UeEZSejRFZ25DWStJRUJ6UFEwTVNvUENQTEhrM3R2YUZVd3ZJVmdkR1pC?=
 =?utf-8?B?bmN1TTY1U2tPRDl6Mit0VjZ3TnRUU0IwMENEbUJ6ZEVjYitkU00vU2hBOUkz?=
 =?utf-8?Q?ja+DO/bH38cMDTgQkwYHwmoTk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8009ae8e-c386-4f80-29a3-08dcccdb6019
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:16:16.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv2YfcYDmgusMY9n+k8z6d6AVERcnS5xyHxEPHwDnuIUS5hJIVT0BkFVwBKW2H4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863

On Tue, Aug 20, 2024 at 11:43:50PM +0300, Stanimir Varbanov wrote:
> Hi,
> 
> Thank you for the patch!
> 
> On 12.08.24 г. 10:21 ч., Lu Baolu wrote:
> > An iommu domain is allocated in venus_firmware_init() and is attached to
> > core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> > make it explicit.
> > 
> > Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Link: https://lore.kernel.org/r/20240610085555.88197-10-baolu.lu@linux.intel.com
> > ---
> >   drivers/media/platform/qcom/venus/firmware.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index fe7da2b30482..66a18830e66d 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.ced
> 
> Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> 
> I'll take the patch through linux-media tree.

Did this patch and the 1/2:

https://lore.kernel.org/linux-iommu/20240812072105.9578-1-baolu.lu@linux.intel.com/

Get picked up for media? I don't see it in linux-next?

Thanks,
Jason

