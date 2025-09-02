Return-Path: <linux-media+bounces-41506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEBDB3F524
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF6A9188B346
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 06:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC83B2E1F10;
	Tue,  2 Sep 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HQ0azmIN"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E1D2BE7CD;
	Tue,  2 Sep 2025 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756793784; cv=fail; b=i6fAogqVKbm5DtHxqrrPY5Xub9kyeMP+Ds4G3seKwMfyC18Gv/ICryW1tbG5lqau5fWsVUeesg+rutHkT7rr209xYXrjtl6HqHXidjtw3JEWtGLODKbS9EH5d+qMWJixAmgxWExLlY7nFrkdq8s+4dF+0uaCBHzrdT0EDzuKIUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756793784; c=relaxed/simple;
	bh=u0khCI4sqfuBhmIsLP+rx/mElJ6ogegFojWez2Xl7jM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jF4NlHO3YfCxYNYgDqet9X6CaT1rhHkAv5yY+jbIQLsckLKh6QzQA2hCqNNRfHAFu1SVM/y6/htNBX5anA/c5Jiy2LDM4rOZlthWLop+vxKNCWDEUUlNGqSSqAmKi9i9Qiph3n5a9leViyfONQLvyoBt2qIRtbuQ73CxgFJn7Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HQ0azmIN; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKoMBc5EKStkUf10q8lVoxcuapjFo/Oa0zLK4OIXjJZAKaDRqzRltbku6l+kCh7zhUayg1Md9uG11Fxks5NsON9kOYzs1ROSFCR9SWt5FjSSCUY1CdQXu9gvSJGv5qi+aIQvFtp5iBuDUh6lgHszOQkDo5DAK5bmn3+kWLf4hXi0bdVNLNrJH+ipi6XpgxAuJp9vXLTUiP7lQHTFzGGxNq5aP0tK02Co9y1ZlTBF2ztMzDTnjILU5VkUuXdUwAANLsW0VUofYH+7iCQQRlEygHnNM1roWcdUBL9MlpFYJDnB54JTfG1GCm3Tk9o+RrTYMQv6OfNeblS+fR28x+SE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW1CrxDTlSxZ2RhD9M/05qn/xmnA/jU33z/m66YGvFI=;
 b=nBd0SR4rGayMY24h5yXBfx8Rpzwi/TGjqmr3xL+tI0NV95NYSmkVsNhWZwENWMFaFT4VqM4p8dIkGkYK1nHa96VhJMkGMIBgW/IGUIhhxzcZI5OeZxa5/f5mBLDUgo3uP5mbEgC+gm0wplABzNd00yf3egf5MkYHDuijWV8SbLifZQ67aLucDpNgdqWqjIXSYv/Pg4469YNzXqip5GegQMz6WlJ11bWJpDjl47m9OzS4jQQqz8tWqpHlI+lIUNz2GU4LKbfdVzT4WuFm2BtzPWmkotIPcu0chRUBa5U1tn9+hYW3aaXePjSk13+X//uk2b4Vq9MDF9S5jkbpsb7vEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW1CrxDTlSxZ2RhD9M/05qn/xmnA/jU33z/m66YGvFI=;
 b=HQ0azmINNFVtu8ktKpZ5oIfq0z4tJQisOgO1h3S2D0+rkLrqPFK6GhgxwHhUkeKmOdaQLadR5qiawA4fJMz/9M9BszQ1bMMMVviP/VIhbfkkcZ07kDK5s61LB4gJ3s7pjj/1aYj283d1EysDhp9MA7Dd4zeo6bVBRjs2o1KGSLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 06:16:18 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 06:16:18 +0000
Message-ID: <e1260d3b-1404-44fa-8085-ccbd34a84003@amd.com>
Date: Tue, 2 Sep 2025 14:16:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: Alexey Zagorodnikov <xglooom@gmail.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <5f0a5f6b-a84b-414d-a028-1e65833f0d22@gmail.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <5f0a5f6b-a84b-414d-a028-1e65833f0d22@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0114.apcprd02.prod.outlook.com
 (2603:1096:4:92::30) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: ae651695-e8c7-4e1f-0026-08dde9e83a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2dkVzJPOGlZNjdTNEcwMGZYZWc0QW5PRGxQM0JzRmxYOHJlNlVmeFdPRmdm?=
 =?utf-8?B?VkFCZUhVZjZ2MmI0NllHODlPQzBiTThBVlJ4SlZkSE9ueHcxN0Z1dk5nK3FO?=
 =?utf-8?B?bm5kN0ZlZVN6bEI3aWNadWFiSUJWOWdla2QxbjNmbEpHTFdqbmsyOVN4UkpQ?=
 =?utf-8?B?bmhVdThiem4vRmtTMG5hMmhBL0ZQemlzWitzZ2xaVmVkSnFHNUtENXNScUkz?=
 =?utf-8?B?MWlOMnlPTXZxcDBRMXltK1BtSVZRVXVHNWU4dGhIREdkSGMwcjYyNU1FSGxq?=
 =?utf-8?B?ZzVwTmhDSnZKbUVMbGtwNkN4dlIyT0RHZWFObWNvNEw1bjF1V0FWMHUyeWRs?=
 =?utf-8?B?VmY0THNjSW1IQTJ2UjAzWUxuTlNUcUhsMTFoR1NyN3ZsOVB6NW02bXZ0MmtS?=
 =?utf-8?B?VkN4V2FvQTZsL1NlZ1BBV3RUdUNRVm5McTR3dndoSXd1R1dqWnFhOVVFUWdP?=
 =?utf-8?B?b1M5SWpFVmdZaWVpTzFpcXJzb2pERDdmTzlwSTFQZktIWkFtVzZTeFEyaElK?=
 =?utf-8?B?MldBMmtUb2dtWk1xSmE5c3FIMFlFcHowamRXdFZvS1llVndLVGptcEJBUXFF?=
 =?utf-8?B?dnpZc1dreEJQOGRHamRucnpPclBKelpsQ3Z1QWlZcjNoWWdob1o3TEZHQzZX?=
 =?utf-8?B?N1dwUGVFREI1Yk5yOW14c0JYbXdoMlhycEV3VTZyVzVtbWVpSk1neWJNVXFY?=
 =?utf-8?B?ai9WVWtwcUVMUENIVHJMbnhPKy9NeFM3TVo1V2R2My8xaTVqZmQyNDgxaDM3?=
 =?utf-8?B?M0gvQU04Qkl5MzFXMGVzK1d3YlF4NVp1U00zaytZazZwWENFVTh0aWhiR0kw?=
 =?utf-8?B?d21ERnZHaW1KUEMybXJRYXBGSGVPTUhVK3lyUytORXU5UjdiVjZpb1ZHRzZI?=
 =?utf-8?B?dXUvam13SjZYL0RkdWEzZW13blhLbVpETmh4eTRWaWg4ZHFTY1puQlJSRytz?=
 =?utf-8?B?K3AveEJmbDQ5MXlyTDhOL29sZGtINC9yRVpXeXJUUHdIc3M2ZTN0cWZFMlY2?=
 =?utf-8?B?OE91bFhyVHJuemVuelNoTk1pQ1MzVDNya1JFSWt6ZGMyVWZ3MWIrVFNqekx2?=
 =?utf-8?B?ZDZoc0U2cW5zWDlMMDVyU3JCQTJOQXl3MVVPV0RwQlBxUDVOQUN3UzdDNVVZ?=
 =?utf-8?B?ZXVDQU93Q1pjYnFZSU5mcXZZOGp1SmdOWE1peHI2cjFQb0lyWHJRYWVvMWtX?=
 =?utf-8?B?dW5PV1dYN0JMc2JFUEdMUkw4RVYvNFJBQUpJZWx5dk9kRVV3S3VjRkd0YnNr?=
 =?utf-8?B?MmxTVmtjLzBGdFR6dm12VDYveFp4WmFNd3UraUcwdUFkSU00Mm4wKzA3WU80?=
 =?utf-8?B?S0ZDcG00N2RkZmZWYlZEekU1Y2JDMld0Y0w3ZUdWR25UQ09WUmp6WVdTVFly?=
 =?utf-8?B?WFFLTHZMNGVjSEhsa205UzF0MkNraGkrVzZ6dnZGUWJJd3pLeW96T2ttdTJz?=
 =?utf-8?B?U1crRFJXU29IRUpaWC9jVUd1NUVmTkp0OHd6cHl5VmNLNlI1ZFpHQ1VUaVo4?=
 =?utf-8?B?dmF1UjcrWmtmbHpBNk1uNUhNK3dqUTUrN21HTG93blNRcHB0WDRWempnZmpx?=
 =?utf-8?B?bFBWUThOcXFWZ1AxY0owaVhHSkcvV2ZPTGZEcUtHVlNZLy83UXFNWGtwTE5R?=
 =?utf-8?B?T2VyQ1l0eUJuY3J4dzg3TTNiVE5BMVFmOVV5aHM2YXlSWE5VTWpFOHYrbG9l?=
 =?utf-8?B?YnlRY1hyTmZpM1NRRlNnMjBQc0hITllsQjJPeGx4dXdqNjcveWJ4S0Q5ZFUr?=
 =?utf-8?B?bHNabmIrVzFZV3FzZWpnMTVTZy91ZUZSSG5WR2phSzJuRXVuQjg0SWVyd1lT?=
 =?utf-8?B?NDVIOENBd0tpUHViRTNGcHJ3QmpDUGl2YnFUdG1sOFpKbEkyNDhmWjlWRDA2?=
 =?utf-8?B?RloyZnJhZUdMT2F3M0ViNnNBenFNQzFaK1Jpb1dObHhSbkt2UWRzY25JdjFB?=
 =?utf-8?Q?f30MePN+jWA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXQ0dXVVVFo3Sk44L0lDQkphakRkREFFMzdwSjhSVTZaVFpwYWJtVUV3V2lt?=
 =?utf-8?B?bWh3RlVlMGI0YUNuc2JoaHlUYnMvbnIvRGRkZFQ4Qjg5WTc4TFllRFlteGtB?=
 =?utf-8?B?VXZYekNwTkttbEk3WFBieDQvRFVRblZqMC80OXFLajB2aU1kZDVCNlllTnkv?=
 =?utf-8?B?dTZMU1Vla1dTU1ZCaXc4VzJuSmpNbEpXMStrOW9KYU9vcXlNTGNQQjdXYkxR?=
 =?utf-8?B?MFE3N3RiSmxpOXE1S3MwV2JOcVdxemJPV29qLzNYSXdOaDdyQzVGZzkwaXFq?=
 =?utf-8?B?dk1JaUpLS21RM1h5NGNYRGpKNXZ0bWtkUURsckgvclJmU0p4U0FxS0hzYnlL?=
 =?utf-8?B?anU5K3Bic1VnVlBKbkw3c1R4ME5mRzFPbDFCK3d1cjdDTU1zNHhmdml2bHlQ?=
 =?utf-8?B?Q3ZzbUJvK1BFcHNtd1NiTkNMQU5ZVEIxWStMS2pnVnJ0TEdTWVd0dy9vSEpI?=
 =?utf-8?B?Ni9mUkRLVk16SVk0ZjBFb2RRWVVyU1JpQTE1dzhOWU84RHdDZ1lJUlh2MmNh?=
 =?utf-8?B?S1AxUHcxd1NETVJDY2phZzAxTU9vcndjNUQ0RFlsZVBCWEZjYjBqWEtJZEd5?=
 =?utf-8?B?cHlYckxTc05DYUdHV3RhK2hlSjh2dFZEVUgzVFQrNjJ4eWJOVlNqNlk3MFhj?=
 =?utf-8?B?b1VxL3BPMXd6anJXcUlqODVPQjJ1WGtaOG51U2NiQnlGTUlkbDRlSGs2YjQ3?=
 =?utf-8?B?SG1wODJJQ3VaWHd1U0pQMUNIbk96UWpEd0NUdHA4S3RzM2daNmNrSEVPUXF6?=
 =?utf-8?B?cDNpQXJjVE4rUzFpRlZEME11TUY1NFpuM05CNjVhbXU2TE41dllyQjNwK2dv?=
 =?utf-8?B?ckh5VFlEcURKdllHZFNIU0VLYWRPU1h0Y1V0KzVPUFlSamEvbWpzaDNHZGpF?=
 =?utf-8?B?dlFoRVNldFRXRlZNU3Y4bThuUjdlbmpSdjFDbUFVWVczVDQxNTAwOVBrM0gw?=
 =?utf-8?B?d2xEUFBGRUlPbENwZmZmZWxVU0RyZkhiaFZ2TXlqTE9WbmhPdSs4ei9Za0Ft?=
 =?utf-8?B?dGxtdEEydG5XRGFUcm50M0Qvb0NDS2svM1o4RHhxR3dqSFdmdEFUNFZGSnRF?=
 =?utf-8?B?cUh3blFzMHplQndQalcrZzFvRGs4T1VZSDNaaGhSb3NpWHo5MUdrSGZpOEJP?=
 =?utf-8?B?d0NGVHFoZUhhY3EzRjBhUkRFSlVsWmtFY1F0emV3Y1BXUmtxVmlhSUJid3RM?=
 =?utf-8?B?M3NNajdNTUk0NTNyNUo5SVA4SGI3Z3ZFWGtEUUhsZUJFSXh4ejdMMmQ5YU95?=
 =?utf-8?B?TTRLTEVBdVhqWUIvcEFla3AvZEFxSXZ5UE1ZZ0haRi9FL2c2WUpaU1EycVZq?=
 =?utf-8?B?a2JUeW16a0hOaXcwdElnSW5Ic1RZLy81c09mSWJ4RmJmN2tLUGdlYTZDZEVR?=
 =?utf-8?B?Z2dhaklmSG4vR0lBYmUzZUtMWGRtL3dYZkhPYjhzMmMwc0tYazVqRGtYQUpC?=
 =?utf-8?B?V3h4STJqQlpTOG1IM3dzcm03ckw4UHo2VDVYZnVOQ1laZjcrS1JyUDhXek5M?=
 =?utf-8?B?SCtGeW52MHFuSEdoK25BUUpDcVpGNlYyL0YrOHZYUWgwWkNxVWFMa0VCOGpO?=
 =?utf-8?B?Yi9YcllJbVAwNURQV0M4NFRibVhSMWYvcFVpQXU0YmVzT3hZTlNmWXJFdmdN?=
 =?utf-8?B?VVdlamRCTnpyakQ1Q25vVFdXRDlHcERZdDRvRmRzek5nbjVkRDRheEtuVUk2?=
 =?utf-8?B?WG5mNFNzMzMxY2x4N1VZZXJQR3Y2KzBrNGxzSE9obThGcFl3VENGYXdMK0NL?=
 =?utf-8?B?dG8renFWckcrOGhnck1tdElPRGhLUVF5RXFvQU9jNUEzWURaT1RrRDE0SUtP?=
 =?utf-8?B?Rm1wbk1Vdjd1VXR5N0FVWnVSOTJOVmhkUUtpQWNrRmV5bzVyMVpod1F2NDZ3?=
 =?utf-8?B?WlUzQWxBdDNWWVVsUmRKblMybDhEY1JLQXBUeHllSE00QjBrTmlYNU1GcWZt?=
 =?utf-8?B?eVlYd0NDZStyQ0Zud1NkSHZzNnptR1RJL3ZWeE1VOGFhcTNVM2NFOUlyWVJ0?=
 =?utf-8?B?dTROMXFXd0hOS1I3U0VLQm9sVGgrSG95aUZMck1aT2FaNmM4Mm1wdTgreGJL?=
 =?utf-8?B?TTlETlYrOWVqb28rTGhmSTdYNVQ0ZmJKdUFhS1I2d2pZbFc3eUpqOWVzNTZZ?=
 =?utf-8?Q?oB8M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae651695-e8c7-4e1f-0026-08dde9e83a94
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 06:16:18.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs9Q6bL+gCrh9OGfRgYqLQjyVmI0909y55MUZjXmVKwWhm5CEC0R2zMp6E/DoFQt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

Hi Alexey Zagorodnikov.

On 8/31/2025 9:41 PM, Alexey Zagorodnikov wrote:
> Hello,
> 
> I have tested this patch on my HP ZBook Ultra G1a, and webcam now works 
> great, thank you!
> 

Thanks for the verification, really glad it works.

> One trick that I noticed, mkinitcpio does not include isp_4_1_1.bin 
> firmware inside the image, however, other amdgpu firmware files are 
> present. So I need to manually add via config.
> 
> Should be "MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");" added in 
> isp_v4_1_1.c like other firmware, for work right out of the box?
> 

Many thank for the fix, yes MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin") 
should be added, maybe amdgpu_isp.c is a better place. Will follow up 
with separated amdgpu patch.

> On 8/28/25 13:45, Bin Du wrote:
>> Hello,
>>
>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP 
>> ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
>> (https://ubuntu.com/certified/202411-36043)
>> This patch series introduces the initial driver support for the AMD ISP4.
>>
>> Patch summary:
>> - Powers up/off and initializes ISP HW
>> - Configures and kicks off ISP FW
>> - Interacts with APP using standard V4l2 interface by video node
>> - Controls ISP HW and interacts with ISP FW to do image processing
>> - Support enum/set output image format and resolution
>> - Support queueing buffer from app and dequeueing ISP filled buffer to 
>> App
>> - It supports libcamera ver0.2 SimplePipeline
>> - It is verified on qv4l2, cheese and qcam
>> - It is verified together with following patches
>>     platform/x86: Add AMD ISP platform config (https:// 
>> lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>     pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/ 
>> torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>     drm/amd/amdgpu: Add GPIO resources required for amdisp (https:// 
>> gitlab.freedesktop.org/agd5f/linux/-/commit/ 
>> ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>
>> AMD ISP4 Key features:
>> - Processes bayer raw data from the connected sensor and output them 
>> to different YUV formats
>> - Downscale input image to different output image resolution
>> - Pipeline to do image processing on the input image including 
>> demosaic, denoise, 3A, etc
>>
>> ----------
>>
>> Changes v2 -> v3:
>>
>> - All the dependent patches in other modules (drm/amd/amdgpu, 
>> platform/x86, pinctrl/amd) merged on upstream mainline kernel 
>> (https://github.com/torvalds/linux) v6.17.
>> - Removed usage of amdgpu structs in ISP driver. Added helper 
>> functions in amdgpu accepting opaque params from ISP driver to 
>> allocate and release ISP GART buffers.
>> - Moved sensor and MIPI phy control entirely into ISP FW instead of 
>> the previous hybrid approach controlling sensor from both FW and x86 
>> (sensor driver).
>> - Removed phy configuration and sensor binding as x86 (sensor driver) 
>> had relinquished the sensor control for ISP FW. With this approach the 
>> driver will be exposed as web camera like interface.
>> - New FW with built-in sensor driver is submitted on upstream linux- 
>> firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>> - Please note the new FW submitted is not directly compatible with OEM 
>> Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and 
>> the previous ISP V2 patch series.
>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with 
>> CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>> - Included critical fixes from Sultan Alsawaf branch (https:// 
>> github.com/kerneltoast/kernel_x86_laptop.git) related to managing 
>> lifetime of isp buffers.
>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>        media: amd: isp4: Don't increment refcount when dmabuf export 
>> fails
>>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>        media: amd: isp4: Fix possible use-after-free when putting 
>> implicit dmabuf
>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>        media: amd: isp4: Remove unused userptr memops
>>        media: amd: isp4: Add missing cleanup on error in 
>> isp4vid_vb2_alloc()
>>        media: amd: isp4: Release queued buffers on error in 
>> start_streaming
>> - Addressed all code related upstream comments
>> - Fix typo errors and other cosmetic issue.
>>
>>
>> Changes v1 -> v2:
>>
>> - Fix media CI test errors and valid warnings
>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS 
>> adding patch to the first patch
>> - In patch 5
>>     - do modification to use remote endpoint instead of local endpoint
>>     - use link frequency and port number as start phy parameter 
>> instead of extra added phy-id and phy-bit-rate property of endpoint
>>
>> ----------
>>
>> It passes v4l2 compliance test, the test reports for:
>>
>> (a) amd_isp_capture device /dev/video0
>>
>> Compliance test for amd_isp_capture device /dev/video0:
>> -------------------------------------------------------
>>
>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>
>> Compliance test for amd_isp_capture device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : amd_isp_capture
>>          Card type        : amd_isp_capture
>>          Bus info         : platform:amd_isp_capture
>>          Driver version   : 6.14.0
>>          Capabilities     : 0xa4200001
>>                  Video Capture
>>                  I/O MC
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x24200001
>>                  Video Capture
>>                  I/O MC
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : amd_isp_capture
>>          Model            : amd_isp41_mdev
>>          Serial           :
>>          Bus info         : platform:amd_isp_capture
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000005
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000003 (3)
>>          Name             : Preview
>>          Function         : V4L2 I/O
>>          Pad 0x01000004   : 0: Sink
>>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd 
>> isp4' (Image Signal Processor): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls (Input 0):
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls (Input 0):
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls (Input 0):
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls (Input 0):
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, 
>> Failed: 0, Warnings: 0
>>
>> Please review and provide feedback.
>>
>> Many thanks,
>>
>> Bin Du (7):
>>    media: platform: amd: Introduce amd isp4 capture driver
>>    media: platform: amd: low level support for isp4 firmware
>>    media: platform: amd: Add isp4 fw and hw interface
>>    media: platform: amd: isp4 subdev and firmware loading handling added
>>    media: platform: amd: isp4 video node and buffers handling added
>>    media: platform: amd: isp4 debug fs logging and  more descriptive
>>      errors
>>    Documentation: add documentation of AMD isp 4 driver
>>
>>   Documentation/admin-guide/media/amdisp4-1.rst |   66 +
>>   Documentation/admin-guide/media/amdisp4.dot   |    8 +
>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>   MAINTAINERS                                   |   25 +
>>   drivers/media/platform/Kconfig                |    1 +
>>   drivers/media/platform/Makefile               |    1 +
>>   drivers/media/platform/amd/Kconfig            |    3 +
>>   drivers/media/platform/amd/Makefile           |    3 +
>>   drivers/media/platform/amd/isp4/Kconfig       |   13 +
>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>   drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>>   drivers/media/platform/amd/isp4/isp4.h        |   26 +
>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>>   .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
>>   .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>   22 files changed, 4898 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>

-- 
Regards,
Bin


