Return-Path: <linux-media+bounces-51105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C62D3C4DE
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 11:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A39056C4734
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F23ECBEB;
	Tue, 20 Jan 2026 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RDsasM+H"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97853E8C6B;
	Tue, 20 Jan 2026 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901409; cv=fail; b=Jt5WyHQQ0T3lo/ER4ml/W68OwMTbvEA3Li4umRd5k/zQr8oAEvmqFxQ08DTI6QfFDDB2FbIMtvYlYoHHsBj/zQnug/B2lijIsheObKDavNRw894HcweDXExxXjE8OBFExX24Xnj0VeKV4KarMGb/pCmXsYinYySrgne3W5zVcNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901409; c=relaxed/simple;
	bh=lGHoCgPm1bl+SSm4y72jk8T52Wrnpzzy81n5fSdW2Gc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XLSzrVhFD4YTlZylJemcb13Lr+lvU0lzmaHmVoUcFwwkHda1kn9utL1H9RLJIjEyBbmaB0+bfAzL7DMuh1cuPi8jC+tEnxYNC1q8m+GAhXWI7q+F/WdUcY7yBF/Wrg7W/K7TwxC0yjFwTXw+b8AIzBlS8ahBAqA7SCHY7DJ3Vxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RDsasM+H; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNE8m5Fhm4H2WKJ4VE2dvOVIpxulWj2jIO4SPDy3ospwesTDKWGF+OCIFX1i2gFfUlLxwvywi80ROg6fMbK4xiOBTd77hPqZj1p2rsYM7wyctEIAFxFO/LBySn2AbfykG4Z4+tffrbicqjB0cuGzPk33DCsjKIqCj1ooG2dFHoNgdoAf3mAp65Xckbz8mBMW2uxyOTyeK2eBdC6eV9YtSGupXGg1AMRyEYsJCw8dGKYTyXh3Bq5F5k0pqKcHFUHj/jWSHRimHgnvkttEDrAJ+VqshbzhiKzzjrKxSf3f+M6pe27vidt5wceQDOCoiLhgJ24J8jfmGwvObzp4TD54cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuLicLl8PgJ9SaXenFbl/bhjLwxlKaRM1Sap8SLvLiE=;
 b=TyKLo99ZuAKHAzU4qHaFf+aok4pJeOWQRJfgg8VE0EObKRTB9hX8cVxmBBkdrh8ci5d+99KDtigb/ogsRT3cWm89QIu0MtKv/PbPIJopRrLHx4hEuyBi3J4OJvoCd9yi4nqIe4R/MoTRCSYrs/0hVDFV8OaFR8rlXFiflOTV8oVfUtcQfgmAu3NREICGcJJ2m57Vg06HgIJSMzfi1cPmQUuTQC/Qf7QP9i9nxeaSR7S2mdY9kVQdOwNzD2RtWfkCHS0kSYkcljwFM4rxm9Hn1U4SAwQSIKoe5CxY5QJ4jGk0G1uO9mwKIe/ERb+VwQcHvCpK+8aTsaqCYPXTmpHh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuLicLl8PgJ9SaXenFbl/bhjLwxlKaRM1Sap8SLvLiE=;
 b=RDsasM+HgYyOIL2KiS8hbX3omasedpfpxDcxpJH7kFPex3lTZMg5vssmyFEFFioaW89SeJHKa7mSVs3OdIgCJxgUqGtMe25wL8iJkH10hGt11pdtbxZko8vAoaNKqGfJG6uSRv7Fmhyq/pmQqYqNiZhtP1slX/rjQY2Oc4Kpk40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH8PR12MB9789.namprd12.prod.outlook.com (2603:10b6:610:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 09:30:05 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:30:05 +0000
Message-ID: <24c3bcfb-5338-4cf7-a0f3-a32428e91144@amd.com>
Date: Tue, 20 Jan 2026 17:29:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, mario.limonciello@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain> <aV4MYcgdOviulN3E@sultan-box>
 <aWgEtfp1MWioqKox@kekkonen.localdomain> <aWiVfyz49P7oWTsn@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aWiVfyz49P7oWTsn@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH8PR12MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b70e7fe-68a0-45ac-047b-08de58067ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVJ3Y0RHUVJPTFFHRk1PdFdwNmFDK3lRZmJXQXJ3OTJsbit6VWJ1TmNBUEQ1?=
 =?utf-8?B?cit5cU1aa0V3OEVlYTFjOVpUZEEvTEpXbldPMkVlSVlxdS9Md1FDdm9KNWJY?=
 =?utf-8?B?SHFCd0pzK3B2NzhNdTBGNWZBdzNCMkl4WGhOaGp1cDUwd0FZUEIxeU4xbHFK?=
 =?utf-8?B?Y0RValFjaEl5RjY5KzQzQU5GL0FnNlVGb3FvTFpESUZHR0hTekIwaUM1bzBK?=
 =?utf-8?B?dCswbTJCU2RielIya1dTbUVYK2l2QlRaSTZLazJZRkFzVjB5MTAydmQybHlk?=
 =?utf-8?B?YmRjclp0VDRaQklyc0JUMzVsUStZQ1UzVVljSDlVZFVxd2JrcGxVQUN5ZDVo?=
 =?utf-8?B?cGtuWW1NNS9rVVlSK0hiTXpoa1BlY1hnQ2RTWUF6MEpBZGxOdUFzdW1rZFlx?=
 =?utf-8?B?ZXVSMC82TjduQXZMVXgzRWVFSUtwMngxdjBmUU9SS0Z0dmRFS0g4RWRjQ2I1?=
 =?utf-8?B?NjdkTFZybjg4aVd3RWhFTnVmNnQ5dVhVVlRKeURuaXhyQWhlSTd3WXpNZEVs?=
 =?utf-8?B?alh5c0tvMjNNNk96UlpIRUVsdko4c1NnMVBmdVh1RkR6ZTZ6dW9SSldCZHcr?=
 =?utf-8?B?TkJmUzRWUHZteXllRWFDSlhYcU91VGI1QVZSc2krVStGTjVaME94NS9uS3Fr?=
 =?utf-8?B?NzY4Z1dRNThOUTRsNjh2TzRkUzA2UEszQlhEdUlNbk9BUHR3TnhLOGtBOXFI?=
 =?utf-8?B?a2VWa3JIUHpaRkkwUWpZK3hUbFEvdldNd3pIOUZSOWk0NE5NYWlzTzVRVys1?=
 =?utf-8?B?QWRIRDBlQm0xMzZaVk0xQzN4MWt0cjBsSHhnbTFRb25xQ0xjVmdBVWJMeFFm?=
 =?utf-8?B?VW5OTStqR0V4U3RuM0hYK3lnaUk2T2ZxeVlXeVFWYTVoRmhBNWFNaHNvNUpU?=
 =?utf-8?B?YUNJUlZrYVdzekFNVXZIVmNQYTBOM1JNZXVHVUw1TVFLWHZVRHNkMHpjSzh1?=
 =?utf-8?B?RVZzZm5OaC9sb1B3YTZmbFZBWFU5MXpJV3pqdjA0M0JZRkNWTGovQ2JFeitm?=
 =?utf-8?B?QThEUTkvcVRUcWRYWTNNUnBtTUVxOFJQbEd2R2I4T1ZxK3VZSFdZdWgySjNu?=
 =?utf-8?B?dHBwYmdMNndVRUdEbmlYdUtrVnRBV1plaU1VaTM1OGFDS2VmNmF1MlVhVkxq?=
 =?utf-8?B?RUFsc3UvVVlaY3RzVVhoVFV3eGNHakovcmtxeFcwU2VscGRuK1lEZVd5enRH?=
 =?utf-8?B?SjQySGUxOWt5QW1yWjJVWDFnT09yd0NnRkdZNUdURzhzY3VJU29JSTA1SzFU?=
 =?utf-8?B?V3lBRmFoVXhUNmJnTE8xdXo2c3hldjcwc3pwaVc4bXl2SnhVM3gwZ0x2OVVQ?=
 =?utf-8?B?T0YzdzkxZUtnV0hqS3dUWWx5SlhWcy9mS1QwYk8zUEswNTgxTlNZWVc4QVlq?=
 =?utf-8?B?clJINW5OTS9BUkpOS0NhVFh5ZHlmQlhpZXNZNUpwek9RUHdzcVVSSHJOYnd5?=
 =?utf-8?B?UG5jRi81VWpIQVZRcC9TOE5hZjBwSTVCL0g1SnlRNHhrQmNUL2ZzTFFoandy?=
 =?utf-8?B?ZGRvTkREbGl4UUpBd2U0RVZmaFhOWnBsaUtNVlVBdEJFbUh4b05qNXBCdC9Y?=
 =?utf-8?B?a3MrTjhPMmlZWmNJVTJvSXVtMEFYbCsyTWcrdXRVNFVrTzdDQmEvU1VEVVFE?=
 =?utf-8?B?T0REU0FIUlNEVy9NVGJxMjFyT0RQNmJRakNKRmMyVFV5NUY1c01sYW0rZWZm?=
 =?utf-8?B?a2NjU09QRDhVQUs2UDRCQ3BSTS9ERzlSenErdk0vNEUySHNPUmYxOVl4ZUtl?=
 =?utf-8?B?bUlxWHpXY2hKa2FPNFRHS05LMDlRTzh4dDZwR2tOYWhteVlhY0p6b1Z2T0VD?=
 =?utf-8?B?SnBrQktyZTY3bW9tY0ZNdjV5QXYvQ1gwbEZwOGxMUE1YRDhlSGFqaDFsdFh0?=
 =?utf-8?B?eVFsNVpJREhSamdDaGFxR3ZxMnpOS3AzblVENGlyL3M1OWxyaUllODBrWUdl?=
 =?utf-8?B?YktjMUpZL082VEJzUGU2VjhJTjZMMERQM25lQ1JOOGgrY2VFcTVlN0N6R2g0?=
 =?utf-8?B?QitLT0NLSVc3UTBTOHZ2Q2RTYlpxQ29LUjVaSFplNHJsS0REMUw3c0J0VGFS?=
 =?utf-8?B?d1dvY25qcnhFZDc5MVNvMHFDSDBka25Cemk1SlhFRjlnMkJTUTFRM1lSRmdV?=
 =?utf-8?Q?DHj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZSa2JuM3NHRTNjTFQ5bWx0MCt5eml0TXJZOVJsMENUYWNHNTg3bDQ0d2dK?=
 =?utf-8?B?Q3dZdERweTRTMnBhakJtKzVrMkcvbzdLVzUvMnU4Z0FKSURZeVlSbDF5akp3?=
 =?utf-8?B?ZWJtaW9oUFpIaW1QWXBuVVFhSWJqMnNTN3NtbjdOd2lsaFhBU0FuMTcrZ0Yy?=
 =?utf-8?B?RGV4WVRmU2FoUHcyZnlxUmc5aEFWb2xuazdwT0hLaHZaYVNHU0NKWC9COUhV?=
 =?utf-8?B?TXJxNDZ2LzZOdzJrM3d1bTIxQzF3c1BZV09ZUGNSWUlMdlNucG00T1lOT05V?=
 =?utf-8?B?dlo5RlNoRkErbTlobFcycXkwOFBGYzN5Z1ZZU25KTGlydFIzSURKR1FSRzlO?=
 =?utf-8?B?b0x4OE5qY2NMWXNMT3JwdWIvZ2NmTUx0SmpzdkUvNDg3RExjZmhONWMybVN0?=
 =?utf-8?B?eDB0NGZxdHBDMHo3czdBUmlFQjBmRUgrcmpYOTZwbFF0aWF0Y3BHMWVPL01p?=
 =?utf-8?B?eW9aMFRsZDNuVzh6UG1CZStwVVN6a0t1em1oWG1udHphSHVHSTlVdWd5UFRj?=
 =?utf-8?B?RHFnY0FZb0lJVTZKR0hxRDhmaVYzVkFnNk5BL1VlemtzMzJzV2t1VUl0YXR2?=
 =?utf-8?B?a3lDakYvaHlnUWJ5K2pUS3NzMkZGWG1DSHdtNnlDay9WeUZPeGR4MU5Ua29W?=
 =?utf-8?B?OGthUkpMMURPRXJZVFY1bDhEVCtuamwzMWZYZjlLUVFBdjU2R0V4VkF2Z3NI?=
 =?utf-8?B?NGpZQ0o5MFIzSnYxWTAweXVZUVhtV24vOFNDVlkrbHVjN2swRk9LajR2S0p4?=
 =?utf-8?B?ZW1YTjBoaURMN1JGc0ZHRTdCQm5JcHcyYWZubHZhK2kvYy9GVUJDYlloOXkz?=
 =?utf-8?B?R054NnVFclI4eUdGQ3VHSHg0S2hRUnZEYm1PZlpUZEljMmtiMCtoUFFzQk9D?=
 =?utf-8?B?eDd1emFHWm9aaXhGZGpxSnVickRXQkJKQTJKNmJENENwVXVReXdqQXUvcUZq?=
 =?utf-8?B?dkRwSEh0aHk2ZDlGdlNFK29vQ1d0TmZSNGo1cWdDbFJYUE9Cd0RCYzUzMDlK?=
 =?utf-8?B?d1pkUDdvZUJrL0dxbnBLQjJnNnlVQWdRcU9MVW4xMnhMak5FNm9mMXhiWjYv?=
 =?utf-8?B?eTJqN3pudU5MZmJqWWNsRElMbCsxNFVlTWQzakFiSWxNakdadStNWUhucHhy?=
 =?utf-8?B?TUxUam10by92WU5BM3lKVDFjbm9XM0RFQkwzNnVWTDJVQ2FyaW9nMnhBTU91?=
 =?utf-8?B?bVNXdlN2MVBwUWxvcFpaeE55cHIrS1M1cGJ3UGVBMXA5VWpML3FyNnQ4VW5p?=
 =?utf-8?B?d3ZFVEZ1bC9aQ2NiWDBnc1FrcnduS3pUVFJmeDB0cjhwQkVRUFVMbVNDODFo?=
 =?utf-8?B?STNTTlJETkNzWDVpazB1bEZEdEREUEV5aDE2N2FqanJTeGNOdVJmM3g0Mm9B?=
 =?utf-8?B?TFdvQ0tlK3N5eUtyRCt2VjdxRXFpVVREbGdLdjdHNlJJT2huTG9hNGhaUkNh?=
 =?utf-8?B?WTNpMXBvRzUzaUlWajlmV1dRd3ZwK3o0N0p4Ny9lRnhMVnZiYXVHUzV0SCtn?=
 =?utf-8?B?L1hHd29Va0JzWTJPa2ljNkpRY1BDWG5MRzhkWmk5K00vbGQyd3VkVE9GRURO?=
 =?utf-8?B?MmN1b1FROU5uMDUwOU1XL0x4VkRwMitDWjRCVWZrYmY1K0RwV3dSRUxIcUdS?=
 =?utf-8?B?UTZhbDB2SDJXR2QrK2hpREZBTlBDTU1mRm1WVGxQQk1DSHI3N2g1UEs1Wm1u?=
 =?utf-8?B?Wnc2NUF2elZKbVFya0l3blhEZ0RieFpXQ0VQYy9CbElYem9BaFRKZEpLVDVD?=
 =?utf-8?B?cEtQUGc0R3Naa1NRM3ZtcnZwdzhSc3JSS3FDdzNlcEhGZ3hDU2ZObkVtQk83?=
 =?utf-8?B?SHBibFdqUUViZlBKTnlvbmZTZ0RQZkh2dWtMOFFBSDk0Z0laTXJHUzRXSGxp?=
 =?utf-8?B?RXdIOTF0Z2VsN01kMnNIQSs3UVRLVjdYYkpMbGUxUHJpZlNaSmpWbkNtYStK?=
 =?utf-8?B?VkFJaFlkc2pVV1FKemFBNVpKa2VUQ0R1VmVuUzhxbjR0eUU4MGQ5QkkvNFJV?=
 =?utf-8?B?cmtQK0tPOFZKVjhpQVZkZG0xWlBzWUU5ZU8vQnVKZGNNcXc5U3RqWFozTFA0?=
 =?utf-8?B?Uy9rVll2SFVTdWpHemVRZDBtSzh0WTY0U29qT0Y4SzhVM0lWd3JBbkxSYlky?=
 =?utf-8?B?ZU95eUw4bHpLQ1NORExIUFc3K2Z6dzRaZFlmczkrd2c1d2tvcDVtaDNBamNF?=
 =?utf-8?B?RFhqVEQyTGJRV0NtTVJMc2RYUENGZ3UxcU1LWHg0T01PdGZqaWlOaVRpN2Qr?=
 =?utf-8?B?YTJwa3J2VTFMS2FTQUlTNlBUR1VLODZ4UGVnbHlMRWFDZkRxQXQ3dXc0Tm4r?=
 =?utf-8?Q?znn/0GdNflltFWBzUb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b70e7fe-68a0-45ac-047b-08de58067ea9
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:30:05.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f72wAcloiksnAu6g4fjJutVTZSkOTKPirnFwrhoX+a8TaJY7zbiLTpWUihAuGUXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9789

Hi Skari, since this is a mature product, the ISP driver/FW interface is 
fixed and should not change. The only remaining question is how to 
initialize them—by declaration or with memset. Would you please share 
your preference?

On 1/15/2026 3:21 PM, Sultan Alsawaf wrote:
> On Wed, Jan 14, 2026 at 11:03:49PM +0200, Sakari Ailus wrote:
>> Hi Sultan,
>>
>> On Tue, Jan 06, 2026 at 11:33:53PM -0800, Sultan Alsawaf wrote:
>>> Hi Sakari,
>>>
>>> On Mon, Dec 22, 2025 at 12:11:11PM +0200, Sakari Ailus wrote:
>>>> Hi Bin,
>>>>
>>>> On Tue, Dec 16, 2025 at 05:13:23PM +0800, Bin Du wrote:
>>>>> +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
>>>>> +{
>>>>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>>>>> +	struct isp4fw_cmd_set_stream_cfg cmd;
>>>>> +	struct device *dev = isp_subdev->dev;
>>>>> +
>>>>> +	/*
>>>>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>>>>> +	 * zeroed, since this is not guaranteed on all compilers.
>>>>> +	 */
>>>>> +	memset(&cmd, 0, sizeof(cmd));
>>>>
>>>> You could assign assign all these in the declaration and avoid zeroing the
>>>> memory explicitly at the same time. I presume possibly leaking some
>>>> information from memory to the firmware in case there are holes in the
>>>> struct isn't an issue.
>>>
>>> Leaking kernel memory is bad. Also, there is no guarantee that the firmware will
>>> behave as expected with varying values for the padding bytes.
>>>
>>> Please see my arguments from v4 on why these structs should be memset [1].
>>
>> There should be no host CPU related ABI introduced padding in structs defining
>> firmware interfaces. Just use reserved fields in that case instead. In
>> other words, the above memset() is equivalent to zeroing the memory using
>> an assignment.
> 
> I understand that, but I don't work for AMD and don't have firmware source. :)
> 
> My personal preference is to pack firmware interface structs since relying on
> reserved fields is subject to human error, especially for future changes to the
> firmware interface.
> 
> That being said, please see what Bin said about the firmware interface [1]:
> "Quoted below is Sultan's reply regarding this, does that make sense? On
> the other hand,  these definitions are shared between the ISP driver and
> firmware and have been verified. I prefer not to add extra padding
> fields to the driver as it would affect consistency. Is it acceptable to
> leave the definitions as they are?"
> 
>>>
>>>>> +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
>>>>> +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
>>>>> +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
>>>>> +
>>>>> +	cmd.stream_cfg.b_enable_tnr = true;
>>>>> +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
>>>>> +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
>>>>> +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
>>>>> +		cmd.stream_cfg.b_enable_tnr);
>>>>> +
>>>>> +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
>>>>> +				   &cmd, sizeof(cmd));
>>>>> +}
>>>>> +
>>>>> +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
>>>>> +{
>>>>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>>>>> +	struct isp4fw_cmd_send_buffer buf_type;
>>>>> +	struct device *dev = isp_subdev->dev;
>>>>> +	int i;
>>>>
>>>> unsigned int, please. You can also declare this within the loop as you do
>>>> elsewhere. Consistency is nice.
>>>
>>> Why does this need to be unsigned?
>>
>> Do you need negative numbers there?
> 
> No, but we don't need to make the variable explicitly unsigned either. It's more
> common to see `int i;` than `unsigned int i;` too:
> 
> $ rg 'unsigned int i;' drivers/media/ | wc -l
> 904
> $ rg 'int i;' drivers/media/ | rg -v unsigned | wc -l
> 1208
> 
> Making trivial loop iterators unsigned without reason inflates the code and adds
> some confusion to future readers trying to understand if the 'unsigned' was
> added because it was *required*, IMO.
> 
>>>
>>>>> +
>>>>> +	/*
>>>>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>>>>> +	 * zeroed, since this is not guaranteed on all compilers.
>>>>> +	 */
>>>>> +	memset(&buf_type, 0, sizeof(buf_type));
>>>>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
>>>>> +		struct isp4if_gpu_mem_info *meta_info_buf =
>>>>> +				isp_subdev->ispif.meta_info_buf[i];
>>>>> +		int ret;
>>>>> +
>>>>> +		if (!meta_info_buf) {
>>>>> +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
>>>>> +			return -ENOMEM;
>>>>> +		}
>>>>> +
>>>>> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>>>>> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>>>>> +		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
>>>>> +				    &buf_type.buffer.buf_base_a_lo,
>>>>> +				    &buf_type.buffer.buf_base_a_hi);
>>>>> +		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
>>>>> +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>>>>> +					  &buf_type, sizeof(buf_type));
>>>>> +		if (ret) {
>>>>> +			dev_err(dev, "send meta info(%u) fail\n", i);
>>>>> +			return ret;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	dev_dbg(dev, "send meta info suc\n");
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
>>>>> +				    struct isp4fw_image_prop *out_prop,
>>>>> +				    struct v4l2_subdev_state *state, u32 pad)
>>>>> +{
>>>>> +	struct device *dev = isp_subdev->dev;
>>>>> +	struct v4l2_mbus_framefmt *format;
>>>>> +
>>>>> +	format = v4l2_subdev_state_get_format(state, pad, 0);
>>>>> +	if (!format) {
>>>>> +		dev_err(dev, "fail get subdev state format\n");
>>>>> +		return false;
>>>>> +	}
>>>>> +
>>>>> +	switch (format->code) {
>>>>> +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
>>>>> +		out_prop->image_format = IMAGE_FORMAT_NV12;
>>>>> +		out_prop->width = format->width;
>>>>> +		out_prop->height = format->height;
>>>>> +		out_prop->luma_pitch = format->width;
>>>>> +		out_prop->chroma_pitch = out_prop->width;
>>>>> +		break;
>>>>> +	case MEDIA_BUS_FMT_YUYV8_1X16:
>>>>> +		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
>>>>> +		out_prop->width = format->width;
>>>>> +		out_prop->height = format->height;
>>>>> +		out_prop->luma_pitch = format->width * 2;
>>>>> +		out_prop->chroma_pitch = 0;
>>>>> +		break;
>>>>> +	default:
>>>>> +		dev_err(dev, "fail for bad image format:0x%x\n",
>>>>> +			format->code);
>>>>> +		return false;
>>>>> +	}
>>>>> +
>>>>> +	if (!out_prop->width || !out_prop->height)
>>>>> +		return false;
>>>>> +
>>>>> +	return true;
>>>>> +}
>>>>> +
>>>>> +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
>>>>> +{
>>>>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>>>>> +	struct device *dev = isp_subdev->dev;
>>>>> +
>>>>> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
>>>>> +		dev_err(dev, "fail for previous start fail\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	dev_dbg(dev, "w:%u,h:%u\n", w, h);
>>>>> +
>>>>> +	if (isp4sd_send_meta_buf(isp_subdev)) {
>>>>> +		dev_err(dev, "fail to send meta buf\n");
>>>>> +		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	sensor_info->status = ISP4SD_START_STATUS_OFF;
>>>>> +
>>>>> +	if (!sensor_info->start_stream_cmd_sent &&
>>>>> +	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
>>>>> +		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
>>>>> +					      NULL, 0);
>>>>> +		if (ret) {
>>>>> +			dev_err(dev, "fail to start stream\n");
>>>>> +			return ret;
>>>>> +		}
>>>>> +
>>>>> +		sensor_info->start_stream_cmd_sent = true;
>>>>> +	} else {
>>>>> +		dev_dbg(dev,
>>>>> +			"no send START_STREAM, start_sent %u, buf_sent %u\n",
>>>>> +			sensor_info->start_stream_cmd_sent,
>>>>> +			sensor_info->buf_sent_cnt);
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
>>>>> +			       struct v4l2_subdev_state *state, u32 pad)
>>>>> +{
>>>>> +	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
>>>>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>>>>> +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
>>>>> +	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
>>>>> +	struct device *dev = isp_subdev->dev;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
>>>>> +		dev_err(dev, "fail for previous start fail\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	/*
>>>>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>>>>> +	 * zeroed, since this is not guaranteed on all compilers.
>>>>> +	 */
>>>>> +	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
>>>>> +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
>>>>> +
>>>>> +	if (!isp4sd_get_str_out_prop(isp_subdev, &cmd_ch_prop.image_prop, state, pad)) {
>>>>> +		dev_err(dev, "fail to get out prop\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
>>>>> +		cmd_ch_prop.ch,
>>>>> +		cmd_ch_prop.image_prop.image_format,
>>>>> +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
>>>>> +		cmd_ch_prop.image_prop.luma_pitch,
>>>>> +		cmd_ch_prop.image_prop.chroma_pitch);
>>>>> +
>>>>> +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
>>>>> +				  &cmd_ch_prop, sizeof(cmd_ch_prop));
>>>>> +	if (ret) {
>>>>> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>>>>> +		dev_err(dev, "fail to set out prop\n");
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	/*
>>>>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>>>>> +	 * zeroed, since this is not guaranteed on all compilers.
>>>>
>>>> You should have explicit padding fields in any case and not rely on ABI in
>>>> this case.
>>>
>>> It is error-prone for a human to make sure that all padding bytes have
>>> explicit struct members. And what about future changes to the firmware
>>> API where explicit padding might be forgotten?
>>
>> Just don't do that. Use pahole to verify the result when making changes to
>> the structs.
> 
> Humans are fallible. Someone will undoubtedly make this mistake in the future
> without some way in place to either automatically run pahole and scrape the
> output for holes in firmware API structs or memset the whole struct at runtime
> so it never matters. OR slap __packed onto all those structs.
> 
>>>
>>> Unless the firmware API structs are all __packed in a future firmware update, I
>>> think the memsets should remain.
>>
>> If you want to be certain of the size of the structs, use BUILD_BUG_ON().
> 
> This won't help for the addition of new structs and still requires a human to
> "do the right thing" and make sure there aren't any holes when they hardcode the
> struct size into a compile-time assert.
> 
>> -- 
>> Kind regards,
>>
>> Sakari Ailus
> 
> [1] https://lore.kernel.org/all/62bd8248-dd8a-4d51-8a85-ad13d3a03180@amd.com/
> 
> Sultan

-- 
Regards,
Bin


