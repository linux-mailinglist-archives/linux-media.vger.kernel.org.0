Return-Path: <linux-media+bounces-36031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F1AEA4F8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4AD1C412EB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD3D2ED173;
	Thu, 26 Jun 2025 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kmnYHY1R"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B202F1FDC;
	Thu, 26 Jun 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961656; cv=fail; b=FX/XKLd+F9fy65GRP/5tqoujtaYfY6Pi5p4u9slwJQdTQK7kuemtuLDpjV9tiMTUkJ3RfAR0B7Tr1BllLQDr6ONbMQcqWOoq/A/geWWtk9Dm0OpwIdIHGavr4YzdgkdVL8/+sh6jWZUFuTaLqaHJ/H54Ii/zCR5aXAOwvCPRfFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961656; c=relaxed/simple;
	bh=NrgWRtYnnsE82o2y8GHypGPpCUP0MZBiTK5QhPrQbuM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nNv/iq2w/oPZv9HTecbKlyaSJuOpQs/UrFEAhhQxxzQRlnpeA9UxkAJgn4oFFB9aeiCmK2I23Ln7u7wNMlDm8VSzkzuaXschaRylll8eKbOZOdKQ0UZKss2ErAB+5wZ26ADBloe73Y87fo0za+vO69dnilmJJJCe4/EvbsYBu50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kmnYHY1R; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4DdTrMUm7P0zJaR2+u0Mrmn0WqsjKD+v0tgO6lJdGs5aGIxAu+j212/F2Or/K790NADOUVRhQUEcG10RAz8g6sebm1ShP5sU+kou9P6fLyE5OXKJszzgb8cf49lkGrEifJioLS/PPMcXY1j+FXXsaDtKDo6GSuEoBRkPawhsU0XhVrONAorNtRQaSO/dswClsEPpCjmkN7TyL1dCMPvaAbbErOE8koyjF8DizkTd5fMfS5JLlK4QAJvIzsY9GNLTWk83gOmit4P6gNgzZRjNxA5BBP6Z/GXzMrIl1HE+UMDs9pEXPHfgoja5JBOeBK57JCnrpc1Gq5GlVE0r7FYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQOgzfkFvWvDhCj04g2GYI1pc7+aTIFdeLpwWQO6SB4=;
 b=n6YXEGzdFCCbUtGYrA5j9hX7ut65VMJLg0+RIThJCn/J8LAMeLyCGFRD0pZWpf9u0OXDFi26zXg3aoK4JyXoz/IG73sMEaBAeNcnoMEvkbnvTwbgKGhqFDEfg6kscoq5lXLawuHD92yn0wsXXduOMbXTeBSzlETMNdnOLPe71nnjpSijBMrAut20b6mPYxAV0K3E6+BrzoE7nTpT7h/4S2oMcIpsZV2Dj2az0L4zhBkQHRbeeUCmtBoWAbBLML9zNlh/8JkXGMLDDN8THOJ8SQlc/pykFplYQj11BSmSxTlK5qQynMe1LVO1aK9AIWuWep3aR4IS6TRHHP1VB3Iv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQOgzfkFvWvDhCj04g2GYI1pc7+aTIFdeLpwWQO6SB4=;
 b=kmnYHY1RBbUjmPA4EvSpWNgG8EGcQhQDp3QrAmFED6C2BOXHIq25lkRDeoBV0y5JaxIvB4ESIaXmGMix7DChZGCi20eX4pOgmrgDXNNBWF+e51wpvQfitEd1JCnIyuSYqhVonL6zTiTYwEwZLJkhsPNMBgixXDQGHWj5MGanLUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Thu, 26 Jun
 2025 18:14:10 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 18:14:10 +0000
Message-ID: <31ba098c-9f1e-4710-b6b3-042a510cda52@amd.com>
Date: Thu, 26 Jun 2025 14:14:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
 <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
 <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
 <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0050.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::8) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0a08e9-081e-4b1b-82b0-08ddb4dd3f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFpiNnNIVFVVNjUrMWRNTFhxRUZhRkdseE9aNVQvRFdrdlduUE5TQzhpZmZ5?=
 =?utf-8?B?ZkhDV0hMcHBPSEFORlNXbHRzc01lN1lXYXltZDAzZ0V0d0FETHB6MmRNRll0?=
 =?utf-8?B?SzAvQkJmOEZvdytpSHFNYjNvNXNnVFBvZ0gyN0lRTnhPaDJWSlF3THg4Mzdz?=
 =?utf-8?B?V1pYUGFLVWQyVWtLQXJjU3dkRmlmazgzZXRPUHh4VTNSTUhzbnZlYm1OZlly?=
 =?utf-8?B?QnJpS0tpNGRuU0kyMkhFd2pYNGxjWUVNcTVPTGR5V1owZ0xCMU1kYWxQVFFr?=
 =?utf-8?B?VzQ2NFB0bnNYQi9tdXg0cWQ5MjBPdXI1WmRZdFBzQ0F1anIwdUFSYzhzWTlJ?=
 =?utf-8?B?bzEzTDhuWW03UWhWU21ZbXBpWjZ5eVVpanUxaFBxYlAvc1diZU5xS01NRVdP?=
 =?utf-8?B?ajc5OHVCVUtuclpUWm84ZXZPNlJGMktoQTZUV2k2SjhkenRUTVk1U1JpVk1S?=
 =?utf-8?B?ZEtJVTFXd3Q0T2VjaDdFWVF4cGFaL3F3MUgzMW5kMHE3M3ViUHQ1bHdoV1BI?=
 =?utf-8?B?U3g4ekdsYnNXemNIeTAyYVhLelNLblZvRmxNSDliYkZwOWlXcWhFaWI4dE1T?=
 =?utf-8?B?MnZBcVA4bEh3YXVuQ1l1WGd6UE92Vk4xTEJKT3B4bldhVGNQYkJqelViMVdh?=
 =?utf-8?B?RGdTZmRJdU5lUFhUQUVnS0FxTU9aUUlIVjdIVk41ZzRYN090a3h6RVNYSm9C?=
 =?utf-8?B?K3FJR3gwcnBxYjJNelg1RFJieSs1UFBqYUJ4RmJaUEQrZjFSZVJRK1RldWlR?=
 =?utf-8?B?a0x5dDhVTXptWGhwTlNPWTF3cTRUSis2QVZsdWphRkZydTJpcURUS1l0QWJq?=
 =?utf-8?B?VEl5UUdLeWFvNkd4WGlCbzVDZndGaysrWU4rTXJ1VUl3TGlpYnBxQmZHaG12?=
 =?utf-8?B?WUdGZWFlNFhhbmpUNmdIbUhzSmNSQkg4MEhvVUJqTjN3TGI4SGVMbUFmYmJh?=
 =?utf-8?B?VEtuZ1dFWVh6Y0dPWWp4R0hLd25USHVHMzYyVUF2SFR2bXIyRDVVdWNoQS9i?=
 =?utf-8?B?YWFhVzIwenVjcUthbG5ueG5EbFpZWkxYcVFvRkFXMkJ6OTFKdzdkRjZpZnJr?=
 =?utf-8?B?OTdqclpFZUJGS1I5VFROb0ZUU3owMnhVU29kR3pQUEdSVVZINDFOeWlxRk1v?=
 =?utf-8?B?SEVZMWgxNEs2bWRvSG53WkVQL3NMWkpmTXphem1lYzZ0VDRNd0lpbzVPN09D?=
 =?utf-8?B?am1idFFYQnZ6UHdZU3gxeTNxNnZMb3dZcllpUUhyeUhNSWxVUStRV0NqZEFI?=
 =?utf-8?B?Ly9GN3dzRXNMOHBPMnlnOUJxZXNySjFiczRncE8xcHJIUTBqY1RVSWJwYUM2?=
 =?utf-8?B?VXBuRXZQdEEzZXpLOXBoVnVDYkFIb2JoMjZYZjJWMFd6VmdaUDVmQVhYTmhi?=
 =?utf-8?B?SlYrQjhqZ1pCN3pSbk93RlNMa0cvU0hTblIvRGhvclQ2MHNlYy9RcEtINkFC?=
 =?utf-8?B?aXhsTkJwRFFGMkhKbFl1NjFIa1V1blUvVi9GOWE2OThiV21rQTdRamFpK1g1?=
 =?utf-8?B?eEl6aURRRjdNSzBTclkrUFRNNzBZazRIWkJodjBRTmEwWXI2eTRwNXdNSFVT?=
 =?utf-8?B?elduUmlMY0g3WHhRRVoybktScjZaNUoycXpBQlJ1TVBGZThra0pzRXNwWXhn?=
 =?utf-8?B?RlRac1BWOXZ1ZnExVEdOcXFhbmlFSGNmZkJhRHJteko3OUwyZXV2K3FNb295?=
 =?utf-8?B?R0YrTGJKdVUxNGx4RStNaWFkMkNzUVdiWGhVRXR2RENSdThrbjdFMENIelc4?=
 =?utf-8?B?bWlGSlkwOGxzSStITXFzamVmY2dCaldWYWJ5MXN5ODZ1L25FQ1puTXRFc2Nv?=
 =?utf-8?B?aVRUQWdjQmpybjlLcmdwYXI0ZU5URkl5dWNZSXkyTmZyTnRSWnloanpnNHAr?=
 =?utf-8?B?N096OEwrN0pOdnZTYXA1NndpZ3pnREdydHBydld1cEM2VGVWREJpQTlaZDVW?=
 =?utf-8?Q?ZqLohMtjyPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3dZay9PYmhhS0U1bnVYdmFMODBGNzFXMXptNVorOFYyZm05RXlRalZKN2Nj?=
 =?utf-8?B?eC9JbU9MeitzejJtMDRieWk1M0hkNUVDNGJJd1EwNGxZZkRMWHZFMDFaOHp3?=
 =?utf-8?B?SC84a1pac0xaMmJ0akFVV1hUTnVReHpldzN2WjdFZlU3aTBiWU1lSEpMTzdF?=
 =?utf-8?B?QnowcUh4YS9CNGE0OERjYm0ra2FJY3NlaVRqb0ZhVUFRd2RLdFhvR1FTcGFl?=
 =?utf-8?B?UzZ4N1JWMzA1Z1cxZnRTMW5jaVIyZGlyZjlhMjY4d0h5UVRkYTZRUENLR08z?=
 =?utf-8?B?OW1ScnJtalZQKzdQSW1rUjRIbzVacHpxa0djMkNLMVFpZ3ZORE1VeWNTZjcy?=
 =?utf-8?B?a05ZZGpXam1VSmRXU1A2eSt1bEg3UFB6MGdyUG0xK2RDU3RZRFU1Rmd2SFJ6?=
 =?utf-8?B?eWY1MTltTkdpUFFwNnhGcEl1aGIvUjdzRlpGNE1lMFRoMW1lZEVhc21wSGNL?=
 =?utf-8?B?L3lJbVQzVk5PeXROOXNRSkZWWE52L2JKcGlEenhyZ0pXd1BOTytHK1VLMUgv?=
 =?utf-8?B?Znc4L0dQd2ZCenlYSWtpaTVlcUJmWjRkNnk4Ri9LT01DMnJ2Z3A3RlJ6TURh?=
 =?utf-8?B?Vks1RHl3MWRpVmJJNnRUUWlYRjhDempTbm5iZm1HSjdnMEJZd0QzOHVIRHR6?=
 =?utf-8?B?UXNtSDRjZjhwdld3VG9YbjhMTFE2eWlkV1RPMXREOW9pNkpjZjdTWFpGNWJC?=
 =?utf-8?B?cFR4ZzFFOWliOHRWVUpzbkFtM3FVdVhSN3hZSk8wejNYNWR5eGxkRDlRT3l5?=
 =?utf-8?B?Ky9zSHBQZjQ1WnNVOHNoZm5QZFdWMFdUa2xiN1BVelkxbkMrbUdFOFlvNUkz?=
 =?utf-8?B?SWhmcVA3UVVHa3cybzNzQUF3amIvZjZ1V1FsWEtieWYzZVpIL3lrOVlDT09T?=
 =?utf-8?B?N0I3MWlDRVJ2amY5S0tZRUw3SWxoMUlJYWpsTTg3cW9IUVNWSitJYUUySFVZ?=
 =?utf-8?B?RGRMeEJPVVd1MnhhSmpRTGZGZ2hZa05naDhNaGoyQ3BGeW5PM21tWEVrMkp3?=
 =?utf-8?B?U1A1SlMrV3A5cDM5RGl5cnhMSmxqVnZUZG52TE0rKzk4ZzgzOGRheE15T0NX?=
 =?utf-8?B?YyswTklleFRta0NBK1lTejBlYUJJcU84NTBFL0gvczZXeDUzQ1FiU0p6bG5q?=
 =?utf-8?B?bFJUSm1QWUNBUUFyZ1A1SUJqR2ZlZitoekxXN21OUzNqOUJ2cFJCeDVNdDZY?=
 =?utf-8?B?c1JqM3pGaTI3K1ovNSswd2Zxd2ExbWRtcUVhWWhySzZMNkZIaGJ5dlo4aTF0?=
 =?utf-8?B?dk5JWWpLUzh2emVBamNpSFJZUTNtdGYxSkFlZ2txMVhCaTBtVmdoWlR6clVR?=
 =?utf-8?B?WlkveUJCejYvWkpUaGo1dWVpdkI3V0xIT256K05YQkw3UHdIM2tHZ1NNU1JR?=
 =?utf-8?B?c0hlQm9qeHREOEQreW5xSGNQdGE0S0FjNkV0YnRnbDR6eFRJbEVyb2NaNUVH?=
 =?utf-8?B?OXgwWVQ5cGpjNGZXbGhNWjcxSnoyU09qcklNTDV0ZXRtcko0OGFhUkZGZ08y?=
 =?utf-8?B?WVBTTTBFNUFaRElLUG4ySUd4QWRWbFludnFpN0pQS0RiN01xWEltKzN1aDlr?=
 =?utf-8?B?Nk53dHJ3NG9xNmFzWW1Lakk4Q1dHZGsrYUlXcnF4THk1UUlMT1dPQUc5Znh3?=
 =?utf-8?B?YUI2T2xYaWpYY0RCblFES0x1UWhBV3VGR2FQbkFoalhFWC9rWEZqdG5kMVQ4?=
 =?utf-8?B?K1Z0SlRMd0R4NXJTaFVkYWNWYzhadHVzMFpkUGNPSXR3M0dXdzZOeW54Qi94?=
 =?utf-8?B?ZFc4MGRPbE5wS3YzYjZ2U3I5dFAycHNCSlZJUHMweUI0eTI3bmRnL2lYdHda?=
 =?utf-8?B?UnJ1Rnh5OVVoc2RLbEpMZ3JSM2lnNi9GelRoL2pEVFR2NXh3YXNKVUNaRHRl?=
 =?utf-8?B?dEFIcVlhcFBPbXhNeUQ4N3g2UU9BMyt4YlExV21QTm91OVZhdnVqOFVOcGpk?=
 =?utf-8?B?VnVTalNsYzROTlcvdldIYWZPVVhrNGhkVlAyemVjanpoMEQxT1psNkdJbTJD?=
 =?utf-8?B?RFRJeHBua2I0ZHZjK3IyTXJKRktPYVNidWhGeWR0d2pmSTdGVmhFVGNGNnNJ?=
 =?utf-8?B?b2dGL0VJLzVCcHdqWC9STkdrRW5ieDZHMTBNYmFYcnhhbFlQWHlPNHhKSkNi?=
 =?utf-8?Q?ojyv8IhpfRSLhNwcTQv74AMpY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0a08e9-081e-4b1b-82b0-08ddb4dd3f31
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:14:10.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EPJgEfjbfCUBVvqOpHnVSRolqwch3UFs0eyWbr1WgWQE7vCjKyRu+w9IaK6YQmDN78kflUInaWqJb10249w+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878

Hi Kieran,

On 6/26/2025 7:11 AM, Kieran Bingham wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Quoting Nirujogi, Pratap (2025-06-25 23:06:01)
>> Hi Sakari, Hi Laurent,
>>
>> On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
>> [...]
>>>>>> I think it can live in the driver for now. Given that the device uses
>>>>>> only 8 bits of register address, I would store the page number in bits
>>>>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
>>>>>> available for driver-specific purpose.
>>>>>
>>>>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
>>>>> bits are plenty for that. If we add pages to CCI later, this may be
>>>>> refactored then.
>>>>
>>>> That works too.
>>>>
>>> Thanks for your support. We will add the page number in the register
>>> address 15:8 or 11:8 and will update the implementation accordingly in
>>> the next version.
>>>
>> I would like to share the approach we are taking to implement the CCI
>> helpers that support page value. Could you please review the steps and
>> let us know if they make sense or if any adjustments are needed?
>>
>> 1: Add new macros to embed page value into the register address.
>>
>> Ex:
>> #define CCI_PAGE_REG8(x, p)             ((1 << CCI_REG_WIDTH_SHIFT) | (p <<
>> CCI_REG_PRIVATE_SHIFT) | (x))
>> #define CCI_PAGE_REG16(x, p)            ((2 << CCI_REG_WIDTH_SHIFT) | (p <<
>> CCI_REG_PRIVATE_SHIFT) | (x))
>>
>> 2: Create V4L2 CCI context. Initialize page control reg, current_page,
>> regmap etc.
>>
>> Ex:
>> struct v4l2_cci_ctx {
>>          struct mutex lock;
>>          struct regmap *map;
>>          s16 current_page;
>>          u8 page_ctrl_reg;
>> }
>>
>> 3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle
>> register read-writes updating the page control register as necessary.
> 
> Out of curiosity - but couldn't the existing cci_write and cci_read
> already be used by the users - and then the default behaviour is that
> the page isn't modified if there is no page_ctrl_reg - and by default
> CCI_REG() will simply have (initilised) as page 0 - so the pages will
> never change on those calls?
> 
> Then the users can indeed define
> 
> #define TEST_PATTERN_PAGE 5
> #define TEST_PATTERN_COLOUR_BARS BIT(3)
> 
> #define MY_TEST_PATTERN_REG CCI_PAGE_REG8(0x33, TEST_PATTERN_PAGE)
> 
> and can call
>   cci_write(regmap, MY_TEST_PATTERN_REG, TEST_PATTERN_COLOUR_BARS, &ret);
> 
> with everything handled transparently ?
> 
> 
> Or do you envisage more complications with the types of pages that might
> be supportable ?
> 
> (I perfectly understand if I'm wishing for an unreachable utopia -
> because I haven't considered something implicit about the page handling
> that I haven't yet used :D)
> 
Initally we too felt the existing cci_write() / cci_read() should be 
updated to support pages, but worried about the potential regressions 
with other drivers that are based on existing implementation. We felt 
adding new helper functions in V4L2 CCI — while keeping the original 
cci_write() and cci_read() unchanged — would be a safer and more stable 
approach.

Thanks,
Pratap

> --
> Kieran
> 
> 
>> int cci_pwrite(void *data, u32 reg, u64 val, int *err)
>> {
>>          /* get v4l2_cci_ctx context from data */
>>
>>          /* get page value from reg */
>>
>>          /* acquire mutex */
>>
>>          /* update cci page control reg, save current page value */
>>
>>          /* do cci_write */
>>
>>          /* release mutex */
>> }
>>
>> Similar steps for cci_pread() as well.
>>
>> Thanks,
>> Pratap


