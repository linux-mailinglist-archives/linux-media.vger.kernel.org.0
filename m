Return-Path: <linux-media+bounces-39484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95349B21AEC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 04:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 993391907299
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 02:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AC92DE6FC;
	Tue, 12 Aug 2025 02:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xcrHj/c8"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02A311C17;
	Tue, 12 Aug 2025 02:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754966666; cv=fail; b=nqV1Oxg8GM9W0MyS1KQmj1G2HPJkjsVIf/ARckBYrf789jIknz9Qtaq04x4Y74zklj98od1gibgjVV64nLJo2tIPtcqvmTqB4gOBu+74yFVR1+IRAnZXjyoNIonfiXxV+emfTCgiWbsGski33N0jHvnCprwNXP3/BzXa7WcuU3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754966666; c=relaxed/simple;
	bh=o7ZJt+mFuD5om6S7jSvVT24MAwsPOfm3O4HUgfWQzFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XOM0/WK/PZh8Hmc07OQBNcsvMZjd+xL6yzHYIcUwTGxinBHse9ZmgIdrYRfCbuIlzfk+aAhWFvEWdWF1WCO0vZfHbRQG1Frre0jbBlBQUUkMkBhl50x54ehAC3y9FjxEd+XS/jNT+FhwMaLS3hPVqCBGBpJ4O1EBkrnovQwK23E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xcrHj/c8; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dII1S/CBCu75+gWFeT5ooMyEMMtpkO0Sd10/MUBVVSfPkA4rY8TSi27pjnuioPPZSfN+nAPoPtAtlBNIwWV4s6aV7MGJL/8ytOl3P57bUKtzWhikTkOrMtJZr2vZ3/+J6OPQNZK4yOS3WiDLy56Mh4r14nw4GfTYCv3pFjegulXiL4QaT3qZTkoOAseNIYB0mCSVQ//pRw8SkJC8hM7BdOyO+h3SqIaFVudsY1ji1rR6tOU8vpOuOFvJGBJAHun4u8PkYyTgMC68TrLI1wS28zdV+Av8Mm45qCcOHs9PIZzXCBSkdodbYDO/vwyryQDL2fDYEQE7GBnUw1oO9tSDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vmh0IuUr4WnHTdQ/vTCQJi0wAZXKnOSn+bmQo6Ir4+c=;
 b=JHALmCtOCACzme1IzoKwjBYkJlJALWENB/BhRNQc48i/kTGo5e50W/2yXoKsHHDUwdUbHurPqW5ux7Ee5nZt/pItZEADxpeFfz7bLE6gF8Et8kh8ii+e6snonAOHrGX+kIBwmZSLSXgNPvlSgHH7Gli9DOwCA6gKOQMFs2j3Ex+gyVCWsSUrGTaxS+qRAIpS974vI9oJYKF+WwRUmHCY7Yvjm7c4w49jFogouOfD8jWE5BXRfeYooMESruy1AFUBFgeD3Ls54k/apvJE2yYPNTw8WOyx7DK9fC3vnlTc7ZKS8IZigiSV+8DhnhjF+ya237Mwbtd6NlrX2w9jYP2EHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vmh0IuUr4WnHTdQ/vTCQJi0wAZXKnOSn+bmQo6Ir4+c=;
 b=xcrHj/c8PHPNVMsUJj8CNusHqFOSGTbMOscVZCOnojxRXuTi90Oc+3kDiJEXy64ziuKDjIhFyuVn5k/NBoMz9oQu/3WDjHXH8X2GzXm+8cUWc7Xd4mXPqowhtWxpXhooeU+Ryqe5Iz/dCLl1gXGRCOKuORetr8XuumKFLyR3WVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CH8PR12MB9814.namprd12.prod.outlook.com (2603:10b6:610:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 02:44:22 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 02:44:21 +0000
Message-ID: <fe92044d-9c6c-4e1a-aeef-2804c50acd09@amd.com>
Date: Tue, 12 Aug 2025 10:44:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
 <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CH8PR12MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd95dbd-1bf9-42e2-c9bb-08ddd94a2451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFJOWm95NkZDSDBLNEh0YjRLM3RWa0NKR1FxTkhWNGt6UGhtVHJNRnF0YlFV?=
 =?utf-8?B?Um1SRUVmeFJqZ0lUQXZESFJNdEVydTA4TUl0LzVnOFh0WVkwclJMZTJ1dkh0?=
 =?utf-8?B?RGtWbHRsT2dKQ0NCMGovUERPUkNZNFB4STZHQTRxL1FPbkNPRzVqSkUzSWt4?=
 =?utf-8?B?NTVVbFI3VkdnanBQc2d5eFBCaVAyMWZkcTQyalRuR0plZXpJUmJpb0RxYWtO?=
 =?utf-8?B?WVVQWDhaOWRVWVMwWC8xcW80bHNsM0EwRGU3YlBKRk1TbHNRSEJtMTlVT2tz?=
 =?utf-8?B?UGdkMDU3RmMrcC9yRUJwWjdpZVk4eDM3dHUwN0h1emwwcGVpZkl6OHo2RlEv?=
 =?utf-8?B?WjdscTNEQkNxTEt6YjJEUUdmYjZQQkpBcUpVRjAvcTFIcmtLM3k0NVJnaFlH?=
 =?utf-8?B?R3FrWk5yOWNtUm43SzB3SThhaDYvc0l2WHNnVzI5UU5paE1EdHBRZ3UyUjdu?=
 =?utf-8?B?bkNUa0sybWNVdmFmVVhTMGErYUhsSDhLdDFvYlE3Q05PbDRETzc4UWdWVnc4?=
 =?utf-8?B?RG9yeWxndUpPc1h6M3JxTWlJYjA5UmpjbFltV240TlNuL2tnMUVORzZxRVJx?=
 =?utf-8?B?c01mcTVpcHhwckxEdk9pSHFScERTNkVsSXpXMVV2ZllINm90ZEErMlRUWlpR?=
 =?utf-8?B?VTV0ZjI0a21DZDB4eStMM0QyaFRZN3ZmRytDS0JpZjFHa0hwUFl2ZkhvcUZL?=
 =?utf-8?B?TExNaUFkYjkxaVl1MjhGWDhIamdQZ0dXaUFYTzJuQVpuRnp0dkNyek1lb1A5?=
 =?utf-8?B?SjZOUFk2RDNycGI2WmhVRVo4bGZUSUpKaFFvMHBVNFJEbmY4aHNCSU5PZCtO?=
 =?utf-8?B?Qnh3cmFjWlozdForZDFsMW5KTTZwUjlKOUFmWlNsbTJudDg0Qi9PTDV2TVJB?=
 =?utf-8?B?VWFpMG1lUVR3aDZHajlnR0FoM2tiSU1SalN3TGgxN3JJTzRDc3R0cnVKZzRD?=
 =?utf-8?B?dThPcW1YTHVrSDM0T1dFN2JoeHc3TlNXbTd0VnhOTWtMK0hLTk9naitNN09n?=
 =?utf-8?B?OCt0Ni9iNHpaV28rQ1lTbkZwSXZNanFXTUV1TlZLQ2pYSDJtZ0pUQnJXeGZ0?=
 =?utf-8?B?R05TdlUzblRHRGlZUlR4cDZwUzVoK2EvYXNVWElzbTVObnMzeDBIL25RdUtD?=
 =?utf-8?B?YytLcEVtQmVCOFpsOWlvNDZmdzdBUVNIM0lXZ0swbk9Bdk84N1d6WlE1MXZ1?=
 =?utf-8?B?aFNiN3Y2TU1rRFNlRHM1VHc3RThrc3VJR0pHMGNlT2h0bGFGQVp5UWRUVmZq?=
 =?utf-8?B?MUZla004QXVjbUZOaVFEckN2cktyVnB2Znc5S0hUQVpZaGJ5dmhjMjJ3azgw?=
 =?utf-8?B?VHBTNXdjamhDeitvM21MQ3dyNWhsK1orR1hOVmcrN0l1aHRzeG9VaGs2cnly?=
 =?utf-8?B?NDJ0ZCtlNHZCRGR6bmRGQ0tySW9aYytTaDY0ampOZDdvejVQTXo1ZGxaNnBz?=
 =?utf-8?B?R1RrUlpueG9jWnJsVWo5K2N3ZGl3eW1TNTlxVk1hZnArY0w5UWtUZEIvVEw3?=
 =?utf-8?B?a2w4VE5oZ3pqb3dXTE1RRzR4MnJDQkFoaW1GdFBCalZRbDM2dzJCelE0dURr?=
 =?utf-8?B?Q0RmZmNUeG5DZmtPbG1FajZUblBiN3RrNW1wT0NwdjM3NGZ4ZjN6UnFSOFN4?=
 =?utf-8?B?ZVlLaU9qb2srVkY0NXc5QnNIay9mTEVSeUxGdXlxM0ZDeFBtZExnNGxWT3FH?=
 =?utf-8?B?azRnRzc3WlZ2cVdTNG8vRUw4RTRPYzVqWkc1eTg1akVIbSt6OXlqdWJpbTJJ?=
 =?utf-8?B?bUpLVnp6b3pZcmhTUi9WeXdmRmgyWXI2VDJUVGNVRnVqUFZoNWk0ZzM0MDB5?=
 =?utf-8?B?MXZZOElpTWZ4b1plUDl6WFhiV2Z1YUwwRnFzdXpDZlJvVDlRSFNHemxlazA3?=
 =?utf-8?B?bkZrY0w1SUhmREZlbGlYZFZSbzFReFhyVkxTNFpZZ1RWQ2J4SmJQcU5peUtC?=
 =?utf-8?Q?tjy4SPOYndk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekJFdEkwT1pTUWIzZ2pnd21pMSsrMHhpTG5VKzUzT2t5VVZ2RHM4ZWtVUkoy?=
 =?utf-8?B?MnNiM3lnNUxraFMvWG11c2gvWkE2elEzVVVydFlTK2VXSFl3bkZ5dXF0Kzh1?=
 =?utf-8?B?b1ZFTDdVVW5rakd5dm1HTnpqSWNTNzExRGFFaUpBWHVVYWRaZWZaTkhJQVkz?=
 =?utf-8?B?dGdvMzBHMDNTQ1Y3RWRzU1NscFJFTEtCcm45aW9xN2ZjbEhhOTFOYWNNbjQ5?=
 =?utf-8?B?bng1K1F5Q3g0RCtYK3VkRGlOZ2t1RmVNSHFoRnVldTc4TkZOQnFja1Vzcmx0?=
 =?utf-8?B?UVhEcTlVYzFsZ0dsa1kzTU9tZnM1cS9VNzAxZ2VYZEMyVTU0aDJXckF2N3p0?=
 =?utf-8?B?ZDFqQTV6NWszYzBMUms2S1JCMllNV0dmRFk3TDJrK0JYRHlkcGNzSE05NHlE?=
 =?utf-8?B?U21GN1JzaFJLUkpJL3JzaGVSZVQ2Sk1QWU9ILy9UVVBHWWhTVUw2U01zZEhR?=
 =?utf-8?B?cVNaSGVDM2VXV3IwZkZ5SEw2Y09aQ0ZuWDVsTnNMYWYwdDVuYXJqQkwvQ3pl?=
 =?utf-8?B?anMvWFIyaWZmZjFOM3hudDh6Ujhwek1TLzF4dDFHL0tVSHcvNWtiMmk4VC9p?=
 =?utf-8?B?RDN2UTlzY2xGWWRkMXB0QUVSbExucURYRDR2anJMYXdUejNONGZSanQrNTdv?=
 =?utf-8?B?UlZYVEl1NWJRU3dmbGMvN2hMUHlyK3ZraDJWL0dEWlkzUHlieTM3Zk5STXVu?=
 =?utf-8?B?RUVOVkNBMytydVMyU25qMHhNdXcvMHlXUFdMRnpjbEd2YlRORGxjZnF5UnlN?=
 =?utf-8?B?Z202K2IwSU1GWU1kVWV6eTgzalJkNjI5R2lGVHNlblA4RUNTYU5waXhIUmRn?=
 =?utf-8?B?cGVWMFNHU1dydXhGWTZoWTkvaWJHem1KU09xU0tMWkhxcHRUZ2MvZkhsWkV4?=
 =?utf-8?B?TnJMUGo4ckFWZW9CTE9zWVFGamE4bEdMaGdrMjltVjYxd3A0bW90VVJ1ZTFV?=
 =?utf-8?B?ZmlmK1A2OHcvY0xvVWJlaFNzdmRzcUYxSWxpTmI5cFlqaTJEbCtYYkFvbzAv?=
 =?utf-8?B?ZlM5UnhhZ1pMaEM1OGE0Vi8xNy9RVHZOUmFvNVd0eW1ldklveDQrWG1sSWZW?=
 =?utf-8?B?SnRUU2d2VExtbU9lTkVveGhYV3o1M1ZPaDZXMnd3cVU0UE9MRy9nVEpoQ3U0?=
 =?utf-8?B?cTBuVUUxMUlHWXZHcFgzV0h1aGVFUHFldnRMT0JsVGNBU1ZxU2p4WlhaODVT?=
 =?utf-8?B?ZGtkUDRBZ0I2VjEvQXBJeUpTa2pBYTlLc09udG9LZUhObFpMQU5LK1lRS2ox?=
 =?utf-8?B?WHE2Wm80WFlMZVVheE9EazExbndRK3dvWWliUVphOU5MOUxXU01DZjVFSzFQ?=
 =?utf-8?B?WWdYbEZlVXJqaWxndlhkWFZzMzIyNWU5RUYxQjhRSU5oRnVzdmlxUzdPYTM2?=
 =?utf-8?B?MWVhUXZYMVpvcnR3NkNQOE1tNnFoRDVmbHE1SFdoT2Nqd0RJLzRkQmZQTnlW?=
 =?utf-8?B?R1VUaVRHem5BVWZjSGJpNzgxTFFlcnRyS3ZPUmhhTFJKU0MxMkFYdWMzOExV?=
 =?utf-8?B?VjdSRVppWGx6STkraFc4MUoxQWJVZHRFUFE5dDhMd0UreGgyNXhobEt6Z2lZ?=
 =?utf-8?B?NUVQdHUrMDNoY2hKdWJudS83N1BpeitYVDBkUU5abHBCMlN5RlptM0tlWktU?=
 =?utf-8?B?MTZJQytOSXlFdG9leEJncDgvaldKUU9OSUtkakNEOEFSWkN1ZFU5UDQ1endD?=
 =?utf-8?B?NzFtaWMrcEhhdnE3NFBsSXhqV3BuRHZrSldOeUlKUWg2STBaZ1l1YVF1TU13?=
 =?utf-8?B?eElnZHNJQTlZc05OeWdJMWsrelF4TytGSllKWnIvVG5oaFNwMGs0RFRaWktM?=
 =?utf-8?B?bEVPcHhVb09QcUp4L3RnSkJPcWE1V05DcFM3SzVXbEVFK28vOHJvMG5rV0FX?=
 =?utf-8?B?UUhTSnpHdTlPSVF5eXp6UGhBbmVzdktOSTNDTmF2dUF3STU3WmFjWkFxd2Iz?=
 =?utf-8?B?QndVSEVSVEJpQUR2ZUdTb2l4cGlma2dxYm1naXZBZzlFd09jbFVtbGswY3Iw?=
 =?utf-8?B?aTNzNkxDbFR6eGYrYTZ3Und6Z1FiTDJqN2FFMU5SY3g4d1pEKzBoUnJvOWtw?=
 =?utf-8?B?czRYcno2TGVMRnBUMmRTNGkzbkJtTGhhRWR4TSsvajB6V1c3eVFpZzJGUEoy?=
 =?utf-8?Q?G3yE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd95dbd-1bf9-42e2-c9bb-08ddd94a2451
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:44:21.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2DPgQ1Ddc4yeQvnTBVwxAGc/6dpX7yx82y/hTq2xGB/ssj7q9zSYfnTYKKCgqrv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9814

Thanks Sakari Ailus for the comments

On 8/11/2025 7:46 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
>> Many thanks Askari Ailus for your careful review
>>
>> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
>>> Hi Bin,
>>>
>>> On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
>>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>>>> called ccpu.
>>>> The communication between ISP FW and driver is using commands and
>>>> response messages sent through the ring buffer. Command buffers support
>>>> either global setting that is not specific to the steam and support stream
>>>> specific parameters. Response buffers contains ISP FW notification
>>>> information such as frame buffer done and command done. IRQ is used for
>>>> receiving response buffer from ISP firmware, which is handled in the main
>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
>>>> helper function prior to stream start.
>>>> Memory used for command buffer and response buffer needs to be allocated
>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
>>>
>>> Please rewrap this, some lines above are quite short.
>>>
>> Thanks, the line after the short line is supposed to be a new paragraph?
>> Should we put all the description in one paragraph?
> 
> One or more paragraphs work fine, but a new paragraph is separated from the
> previous one by another newline.
> 
> ...
> 

Got it, thanks.

>>>> +	void *cpu_ptr;
>>>> +	u64 gpu_addr;
>>>> +	u32 ret;
>>>> +
>>>> +	dev = ispif->dev;
>>>> +
>>>> +	if (!mem_size)
>>>> +		return NULL;
>>>> +
>>>> +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
>>>> +	if (!mem_info)
>>>> +		return NULL;
>>>> +
>>>> +	adev = (struct amdgpu_device *)ispif->adev;
>>>
>>> Why the cast?
>>>
>>> adev isn't a great name here as it's usually used for struct acpi_devices.
>>>
>> In the next patch, will use new helper function for this and will no longer
>> use amdgpu_device
> 
> Use correct types when you can; either way this doesn't seem to be changed
> by the further patches in the set.
> 
> ...
> 

Yes, totally agree.

>>>> +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
>>>> +			       struct isp4if_gpu_mem_info *mem_info)
>>>> +{
>>>> +	struct device *dev = ispif->dev;
>>>> +	struct amdgpu_bo *bo;
>>>> +
>>>> +	if (!mem_info) {
>>>> +		dev_err(dev, "invalid mem_info\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	bo = (struct amdgpu_bo *)mem_info->mem_handle;
>>>
>>> Why do you need to cast here?
>>>
>> In the next patch, will use new helper function for this and will no longer
>> use amdgpu_bo
> 
> Not quite, on top of this patch number 6 adds more of the same.
> 
> ...
> 

Thanks, will double check all new patches to avoid similar problem.

>>>> +static struct isp4if_cmd_element *
>>>> +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
>>>> +			 struct isp4if_cmd_element *cmd_ele)
>>>> +{
>>>> +	struct isp4if_cmd_element *copy_command = NULL;
>>>> +
>>>> +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
>>>> +	if (!copy_command)
>>>> +		return NULL;
>>>> +
>>>> +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));
>>>
>>> kmemdup()?
>>>
>> Kmemdup is to allocate memory and copy, can't be used here.
> 
> Isn't that what you're doing above?
> 
>>

Yes, you are absolutely right. Sorry, missed the kmalloc before the 
memcpy, will fix in the next patch.

>>>> +
>>>> +	guard(mutex)(&ispif->cmdq_mutex);
>>>> +
>>>> +	list_add_tail(&copy_command->list, &ispif->cmdq);
>>>> +
>>>> +	return copy_command;
>>>> +}
> 

Regards,
Bin

