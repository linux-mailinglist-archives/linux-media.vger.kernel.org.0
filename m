Return-Path: <linux-media+bounces-25000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D049A17276
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 18:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77E57161CEC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246381EE7A5;
	Mon, 20 Jan 2025 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lcw7CJKe"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7807C2FB;
	Mon, 20 Jan 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737395950; cv=fail; b=leS21AQFoy9ZQsAPbzzDW7AXm2Mcw7Mj9/VJaDojfPCeBMCM7N1iYmnThNPBMbYeIQWvLUm8w7jBf4SsDh1Bgs64vOiN4gdL8ltD+g+8iTahmB5S5KlWpbdWwAqvda5Y03QJmbhnGPmIEEvqf9l0LjV8bkSncBhcHkceRtNQ4lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737395950; c=relaxed/simple;
	bh=daTnWwwnh1AYHbULnSTQIP17u8B1eyIjtfbY35RsQe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LkoP41PAau/V2SjqVp35TFFvsvRYe8x1ohrcaY+yZypVQ8uCZ9+imVbZG0bf5KZt9K+K1H99UKWcFaJwVJP/PRqE2a8DhLwvPKaEBFeMjIKN4f/Ey89zmU8b7MNxXntjUVD6GFophG7y4V6TZTahF5pN2X9hLsaC3lnufd/Ecmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lcw7CJKe; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjQ6cAPj8WPvutAQ7Z5TX2tJOyl2stiRSKHtr5l45Nd6kRnJRaTm9fJAGLC+V2O6OCBbfvYxWGJIyHtg1PRcwwgGzdvZ6iW+9YeyUOW59TXtCJmRjTd8fk7cu7cD22DaWTEIY4Gvd1wqXc5v2cKyjC2VnvWtZcay+FvOdI8fHuXQfhqapJqRDsRcqFMCXRma24yKEPAblo8ws9nOG8hxfSXvp5KKigzC7V/38C7PqCXfXzqiWRajw/knDq2TQ/ESV7PnJAfULvzJ29ZiITA89Uz6LPmwd2O2vhBc3290p+9H+J9E6nVfd4ZWZNqbqrzqgSXVYJlxxi2V898arhlxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zWZwwJoXFpppVHURARR17tKAMyZmsvX4NnXTOiXUkk=;
 b=o7ETjSL3gsH9bHxlpUo87HqZNCiiJh39McPoeRAMfSL+2zpZzUDcYrgcSTvw9/er9tGuRFCnaiQMNNk+2hWrLrjJWKyQfV6ioWUeieFXETyzRO01gSgTElyevGItY7mQNA1X4YXFnrg98tS0VAvjWHSIQhYJgPFPLtRNX+iksfx727aWGiueSFZWZFw/o0t/B7OVsGHdRzNDslPGePO5KhB3fiCpEXEXgwvs58vyaThKNQwUHWP06X1gKMMgFNGu9TkHm3jP0y9MeS2ZeRko9a4D9214F7ohOB4DKLIbByCnRQ3zJMYgxuVzV1qBaa6wg+slBPO78zgMBJtnwVrPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zWZwwJoXFpppVHURARR17tKAMyZmsvX4NnXTOiXUkk=;
 b=lcw7CJKeegahYwl+QgbHZhg0oVPb+2sZofsS23lOSFHaiKnQ1n84M2KvAjtiCRz/2LEOS0SSIjbGTlxuz/8/JofF3vJzBI7Y0N//12crP7fXijUXd/5MH2MG9KRyUtyhL/lgkesEpfrAYLTJdjeTz29uvEKvgjWMFoX8ajRoDhu65PjBffD2pusCPLTcdKBkRxblslNK+UooPBFoQHB9rwwqOgFpbNEQDQMVQkugD2FT4uj2Lcu66SZ8c32nRGNonA+YnO/tdaOC5AD48u4V5gL4Zg0vzYG3g0xbpeH1+2dif6dAQGhK4SRG2127RpyJAMUx5Jz4mKTqpD97gsxxZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Mon, 20 Jan
 2025 17:59:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 17:59:03 +0000
Date: Mon, 20 Jan 2025 13:59:01 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
	yilun.xu@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250120175901.GP5556@nvidia.com>
References: <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
X-ClientProxiedBy: BL6PEPF00016412.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:a) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 7814c0dc-eb73-4334-9ca2-08dd397c1fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWRPSFNBUk53QzBvMlZkM0ZjSktDZEVCN2Uzby9oZFkyUFBlZVJDZUhQVmJm?=
 =?utf-8?B?WW94VW1OR2UxNDNWZDBhT0l1dklaUHdlSDVya1hSOUh2dzBBSTFJRFQzd0g2?=
 =?utf-8?B?MjB5UFV4Um5wa2NJYlgrc0pPeTRDU2Z4QmhOdVF0am5jM3hFck1PMWtlL3Nt?=
 =?utf-8?B?Z1B1Z1ozVFdrTnN5NGdNVCsvcDN2aFlMMGxsdVhCWmxZNVdSMzZiYW5tYTJ5?=
 =?utf-8?B?dEI5cDhWUXVwbkh5N2dJMmVCOEdqVzJPMU5ycEJHN0JNQ2ZLSWtXcFllMGNI?=
 =?utf-8?B?UnUvK0Z5S041YzJNZnJ3bFlWYkZuMUludEVEb0hac21sb29wSkdmV1lYVUE3?=
 =?utf-8?B?WExKVTlHRVpjeGNqUnlJL2hTUVVjbGdKcVFZTW9BSHJXYXMzK0hlRGZDMzNZ?=
 =?utf-8?B?LzdpYlRuU3hIL2hVWEtvR05wY2lkczY5eTBsYXZNSGIxNVR4Y0NzN2JwTFFP?=
 =?utf-8?B?NnBoSEJXTUt0U0dPQWZHVU9zUkxaNjZVRUlRRDZZUWo1L2hSQkU0UWNheUJN?=
 =?utf-8?B?cU9jY01SbkRkak9vcDdQa29wTGFXOFhUdXdudnp6ZkdKVHlVTzdKMjBBemlB?=
 =?utf-8?B?WlhCeldnellmKzhFNFFVYmlxeWVPa3NPQWpFbitJeWU2ejR3U3pPQ0RXVjdQ?=
 =?utf-8?B?V2Vnd3pYWnlLaDVselVCdzVjMkFIL0t3VWJKRlJlMVRPeUNyWmltSnB5bUho?=
 =?utf-8?B?aml2QjBLZC96eGp6OERJT2JReUdENmUxaWkzNWJSUTFaTyt4TlFRYXk0VXFp?=
 =?utf-8?B?MUx3L2xiNXE2cjh1MFV0NW13ZGxZUFRTdTU1ckhpeWh0Z3RTOWxvakdkdzlt?=
 =?utf-8?B?bTFURVcxanhNRGdCck03L3lraDdCY0pRSDVlZGFJVSs4RlVyeE9CUkVwZFFx?=
 =?utf-8?B?NTM1blVpVFJCWFFPTitMeCtTNEMxZFF6OXN5S24xdnByKytCejU2WktnTWlX?=
 =?utf-8?B?N1JiS3kxQStiU2F6ZFk0SWhLSksyc2Ezdmd6MzhpZWpON3Uva0pMZGo0TDl4?=
 =?utf-8?B?bFVUcXZhaHVXS0RBMis2YWJSNDB1NXAxdDNreC9lQTdPMUMzQThkR2tlc210?=
 =?utf-8?B?SktCbFVSajlWcHlqSXkyckt5bUpEZE9CYUkrZ2VvSTJDREh6c2xJMm5RTTBh?=
 =?utf-8?B?eEpMME1XT2JqRU9PYUZma3VFTmpQY2RVUE11b2hkaThCQ2ZiQmhqRTFYMDY3?=
 =?utf-8?B?dmJHa052VlFBb3VrSkM0VTc0ZnlBaDhOZ2lqOXFvZEErblZpbEZOR3Z4N1FZ?=
 =?utf-8?B?blBkU3VTbWpGZFY5RTU1QWlYTXZ5dnY3M2V2TkIzdnZWbE1RTE01amJJY0VO?=
 =?utf-8?B?OVV6UEdDUDRVMEtlczFtQXdzMTRzaU1xcTdWN1V5eTNrR3ZqTFhrczM0LzlB?=
 =?utf-8?B?VWdUZGw2d01kMTUwY1ZXdEFCeEh1Qkd4czdzeUlERFp1NDRpVVA2cUdheUhH?=
 =?utf-8?B?WlZmaThRQ1c1OE14VkJHbVFhMzQwMXhUbGljcmE0cnUwa0x6R2JuWnI4cmls?=
 =?utf-8?B?b2FSRFpPT2swMTJmL1pjdVFQTG40Y0NBaG1QNzZjaVl3eHpWZ0NVYzd1S0JU?=
 =?utf-8?B?b09zTkMycGJLQ3RVc1RHc08zcUdZd0tTeDJ4MGMzdVlhOUNkemlscjBlK1c0?=
 =?utf-8?B?UWlBYXpKSkJQYkNsNG1QVTlEN3Z5OGdrZytlQlBDVFNmV1orS0l4YTZieEYr?=
 =?utf-8?B?ZnJWZ3JOL1hlWU5SRWhVZXhsM2RPaWZPbnlSUDNiUk1NM0hlMGlPWFVXc3hZ?=
 =?utf-8?B?QytzOEhnRVpELzlLdzd4QzkwK1ZVODVUQ1hSczFUM3VoVHJ2VWFMOXlSUU5j?=
 =?utf-8?B?N1FxMmdBbUozalJSNW10bjVPZGNIU0I5Q1VaZDhLN3NlK1FURU1UOXk0M0h6?=
 =?utf-8?Q?oV2kd0hW5H9PI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGZmYW9NL0hyU0lNZ2JTWTJpZ0xHRWhCUGpmVktzVlF5d25IN3MrRUM2Z3l0?=
 =?utf-8?B?U2JUV05MSis5NmZoWjNCSncrOWZ5TUoxdjhKY2d6OGMzNUl3SGFQSGZMN1dR?=
 =?utf-8?B?NTFNRkVhRFZDdU80QzRKVVNpQndiT3drUnhjbVV5cHVaM0FYYjJnNzB3bjR5?=
 =?utf-8?B?NTBJWmRMWjJVbkROMDkydWFyekUxVDZpbHN4aGZuMDlkUHBwempTWXhtZnNy?=
 =?utf-8?B?UTQwN3VlZG1FS3N2ZklxSXl0RVRKS2R3d1dTUzNmYXJ1cjk5aUJhTUh2S3dZ?=
 =?utf-8?B?MDBHbzdzZUNpU2dBYzIxbVlDakVuWGhoalJGMjJoY3FBekJ1b1V3MVR5QzNM?=
 =?utf-8?B?VGpONGYwUWRwcnhKYUlnbmhrYjBqQU1IM2h0dExMcXVsV25rY2xZZHpwdTNz?=
 =?utf-8?B?YVhuWC9HcndhTHYxeFc3RzRmUElWaC9NWHNnWTljd0RXR25QbktwQ2M4TnNs?=
 =?utf-8?B?NFBUbCtwVnFTY2tUVXBLd21JMDNrT2REUHFwQTZ6cEQ1dUpiMjg0b1N4U2ZY?=
 =?utf-8?B?MXcyQjBWTk5KdHV5c04vb3RoektrSTR2U2ErZDBiY2RlY3dCOG5GU011N21l?=
 =?utf-8?B?WXFmN1pDd2MxeWpPWGZFNm92UmwxR1UrZWhvZ1M5Q01ENVZuU0JkNE5IOWRm?=
 =?utf-8?B?bjRCUVpJUkNzTUdTZDJ5cjY0N3NMMithRy9ZNytwZkF0eXpxei9BRkJ0WEFF?=
 =?utf-8?B?S2ZMTHlQaEZhRzVyOVc5NEYzVzFIYVJhakxkMG00bkVtcmJFU2IrekxaQlJJ?=
 =?utf-8?B?V0JrZmR0ZUo0SVF2OGx0VzU1NEhSRnVLdExCKzhtQm5UZVJmNHB2aUtIR1RI?=
 =?utf-8?B?Zi96NXBsMjNPZGVUVjFUelIxekpOS09sdXVmQ29yZDhBby9WNzd2NjR6Zkt5?=
 =?utf-8?B?bU9sa3lWaG1NclJLcnRIYjRoTERTblBBZ25kUXRYV1RlRWJLcTNxNGE1R09i?=
 =?utf-8?B?WHRsRldKNEUzcEcxZEtQUkhUQ2w0djE3RUtwRVNSRVFlL2VjMGhDQnRqUk1y?=
 =?utf-8?B?cEhMZDRwVmpEVkRrSkN6NE02bHRraW5UNWRCVm5ha0lCazFYamVvYjlnV1Yv?=
 =?utf-8?B?NVQyOGtzQkZCSitaMUNCbmVrZVYyTnVETllVNmhONWpVZTNyVjJHSFlkUFRj?=
 =?utf-8?B?Q2xscHRxam13Z3hiNldYdks3OUF4YTNDTDhNdlR2T0JaVG5kb2RvVDJRaFE2?=
 =?utf-8?B?N2V1ZGhSdGs2V3VnSVJMVVdiVGdGYVpXQlcrRytsalptT3dIQzR5ZWVEQ2lU?=
 =?utf-8?B?TnVFTDVXT2ZOeG8va3Z2TlJsZTZJdEVtM2hxQmFtVDB5RUlZTXErSVd2Mzdz?=
 =?utf-8?B?MkNIdDBGU1FMSGp0RG9UMDRMSHo3aVU3RDdrektONXJxRnFwWVg0Sll4MzBk?=
 =?utf-8?B?bHJwb2RBZlJhaTNTNVZIR2w3WTB3ck8wOWpTcUl2S2Fsb0FLUHZMaStlY0dV?=
 =?utf-8?B?cVZVQmR0dE41VFBKNXY5MHQ4NThBSkNHZ21lSnlPS0g3Z240NCtheFgrdDRs?=
 =?utf-8?B?bmtOamh4czhwdVFraC9OclN3Vi9YVWJTYXBhSHJSZVkxeGNsQlEwdXlaTFE5?=
 =?utf-8?B?dkU5S0VVMmhZSGRGWDYrTUpqb1ltMERib2ZJaWdDa2JuN05jZnVqaERpV0JV?=
 =?utf-8?B?ZDdoR0o5amNWQ3pHK3hVNjBXTzNZanRMNzdPdG1qeWdYaUpzVDNCVGo4SUpQ?=
 =?utf-8?B?YVh2ekxwM2JyV1B2cVo1VTNOTTJBNENqREtyUlJaMkJrNktLZEs4VXFIcnRF?=
 =?utf-8?B?cnRvWUJTekFId21kUXhkdThzSEpUeENXRnF1UEgyUWpTaGhKdldybHV5a0sx?=
 =?utf-8?B?ampjMUJtWlVqVGFvbUN4QU5FN0xzZi9yMm9CbXlrNUk1L0dMREdRSkx4ckt2?=
 =?utf-8?B?eFVKNi9zZFRTZWd1NjBmYm1rcnQ5SUhRSzF0SVFtc2VYRlFXZTRaNmNjVEZJ?=
 =?utf-8?B?OE9QcWhsdlN1eGoxekN1M01xU1I2c09QT0NhRk5TeDhmL2FKemF2WnJtdnhx?=
 =?utf-8?B?dUpoajM4clRRQXROSkQyR2NSK2lCNnd5NW9zYWQ0L0FYVTQwYVJhbE4ybVA4?=
 =?utf-8?B?Y0p1cDYwRE5hcjJLWnpxRmxRV1BsZjR1cnlpbjNoaUlpOW1jcW5YcTZoZlVY?=
 =?utf-8?Q?d4c4OVU4bkVhA8XnznPu9jbJ5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7814c0dc-eb73-4334-9ca2-08dd397c1fcb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 17:59:03.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAYIg5FInixg/IRUfEPbXINngwYLvaalhQ+le372qzHQ3cqKKsP8a/ey0DfR0q3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052

On Mon, Jan 20, 2025 at 01:14:12PM +0100, Christian König wrote:

What is going wrong with your email? You replied to Simona, but
Simona Vetter <simona.vetter@ffwll.ch> is dropped from the To/CC
list??? I added the address back, but seems like a weird thing to
happen.

> Please take another look at what is proposed here. The function is called
> dma_buf_get_pfn_*unlocked* !

I don't think Simona and I are defending the implementation in this
series. This series needs work.

We have been talking about what the implementation should be. I think
we've all been clear on the idea that the DMA buf locking rules should
apply to any description of the memory, regardless of if the address
are CPU, DMA, or private.

I agree that the idea of any "get unlocked" concept seems nonsensical
and wrong within dmabuf.

> Inserting PFNs into CPU (or probably also IOMMU) page tables have a
> different semantics than what DMA-buf usually does, because as soon as the
> address is written into the page table it is made public.

Not really.

The KVM/CPU is fully compatible with move semantics, it has
restartable page faults and can implement dmabuf's move locking
scheme. It can use the resv lock, the fences, move_notify and so on to
implement it. It is a bug if this series isn't doing that.

The iommu cannot support move semantics. It would need the existing
pin semantics (ie we call dma_buf_pin() and don't support
move_notify). To work with VFIO we would need to formalize the revoke
semantics that Simona was discussing.

We already implement both of these modalities in rdma, the locking API
is fine and workable with CPU pfns just as well.

I've imagined a staged flow here:

 1) The new DMA API lands
 2) We improve the new DMA API to be fully struct page free, including
    setting up P2P
 3) VFIO provides a dmbuf exporter using the new DMA API's P2P
    support. We'd have to continue with the scatterlist hacks for now.
    VFIO would be a move_notify exporter. This should work with RDMA
 4) RDMA works to drop scatterlist from its internal flows and use the
    new DMA API instead.
 5) VFIO/RDMA implement a new non-scatterlist DMABUF op to
    demonstrate the post-scatterlist world and deprecate the scatterlist
    hacks.
 6) We add revoke semantics to dmabuf, and VFIO/RDMA implements them
 7) iommufd can import a pinnable revokable dmabuf using CPU pfns
    through the non-scatterlist op.
 8) Relevant GPU drivers implement the non-scatterlist op and RDMA
    removes support for the deprecated scatterlist hacks.

Xu's series has jumped ahead a bit and is missing infrastructure to
build it properly.

Jason

