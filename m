Return-Path: <linux-media+bounces-38693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5512B16EEE
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 11:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9FD13ABF09
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F66C27CCE2;
	Thu, 31 Jul 2025 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sluoQ+9e"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C2187FEC;
	Thu, 31 Jul 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753955174; cv=fail; b=mHsc8lpu6MNqipy55ESbXh/roPtlqNizHbAR+5B/eaLVTTeUlDc6eqXoEcQk6XOtstnUcTXolM/IGDXVhUvQkN2CC+VTq+aBFkNhiYJCSPU8jUnfk5XCKbyhXvlNPBKuc6gQe3lUF32qgs5SYUHNIOYhzcjzaSj/1CVpi+TcIp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753955174; c=relaxed/simple;
	bh=QO8Opk2//G9N0VR6N9/njP2TC5xYkAdWxZ6RFb2MGRE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pwsBIhVow9pNylrwt1P72XtRXky8+evw2CG2dyMHAxgGYuqYJPD3N0ak+oV2D4jZTiFpULP8EgnBMNkjn0k6QDclxwkXzORn7nWRGPzIauaok6Isr5SKy7VEtelTFqZ/Pv4QTUKwGmg7onmppmz5HReG2H3NeaJ3CGC9BIiM/uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sluoQ+9e; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4YhgKWVbIE43PjpWoCISk821IAJbE6c17yndcpp9Wxs4sBvbAg56jVOXwOkBCw7r8mTPl8+/QgjYO5V13Eg1AsJUMZ262545GgcH5aHr2ivgrRRmC0VStoGKbWjs2JfWLujNCk9apUxHyrG3uFiCluvPsn+2/mhJsOjp4/dHRArcRlk0BCMCqIZphpJgQJ/aZ0U6G2ExHZz6u+FYsqj2PXN73WiBC+0mQ/8F9baq+Y0yb4WLIJ3m/IstX47eQIosXbcwTqoRbIKVobPVjk7dVt3Bn4+HxgMOTWuJjpfRPCdouG8jcDQSSrOS2irbI7AOkP8yOCC+fh2B9GJDO1zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K4sskHudctcrgXBt1iWCijQUMiqGCc0ZI/oU9HnPAM=;
 b=sbnCB+YBshp1QS9+tzPzytncrQXuV7d0twoK8aOiyeT9E0d85uujSdyvzFgxgkMGP1BVdrT1YzQ/MWuzzqKB9rOaBvoB1zbLSk9Aea4ze2YYh9EcPs/HwELhyAao9GSXQ0Bz9SKkH44BW0iyqSmBhrnT3qqaNLaXE/OaQWQj9TxxW7kCDwooIlHndZi1kT0rSaX3cPhFBLPhJRch66fS5SPNlT3lbCqD/IlPmgUkQ/FSUlx1x8yze/25sq8ZKB7svhTLEMUlKnLljUiZV6sNi35H3Moo+0YExbpfFor7Q2ysOZWDQDGaUXetKlIw9UiKlkwddEiiZs3l2mzh1EFaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K4sskHudctcrgXBt1iWCijQUMiqGCc0ZI/oU9HnPAM=;
 b=sluoQ+9ezcGIgnXL0VWRbVF5xQMYdrPil9CgTpaIHabddetI8O5ozd5TV+a38uPHjAYaVy0hPK7iSUa2CZkqtILX4PL53WJAiQX95U5CLgzjrBVidcbfH1DygxYmZ/up+yv0W8V3Ne7DDsSeET2a6eSlucQ6qf2JcnuKo3Xw+K4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 09:46:07 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 09:46:07 +0000
Message-ID: <263874ef-46b9-4508-ab96-7fb311668faa@amd.com>
Date: Thu, 31 Jul 2025 17:45:58 +0800
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
 <7a422602-7a99-4b49-b994-cddd9730cb20@amd.com> <aIq6DpV_cMJWKfhn@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIq6DpV_cMJWKfhn@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: e420aab0-1b16-4188-1708-08ddd01712bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0JZOUNXc0FBRUhhNUNkMjVCOVNFK25PM1RTWWlNRGcyUzNQTDl3YUoyMmVo?=
 =?utf-8?B?bHpxM0pNajNMUXFYTGxvSjUvTUJWUnNSSDI0Sk0zdlVRZlh2RW9DMkdqUEho?=
 =?utf-8?B?amVqbEtVOUYyY3VBdEdNOHZxbGhUejhGa2pSbEFxSUVpVEtiS1oxMGxwaW8v?=
 =?utf-8?B?cktrVkJkSUpycWFKSXNLaFduL05md0E1d3lwY2pHUTdQK3lEZW8xT2RSRHhx?=
 =?utf-8?B?dDdsSEJTNGhOcmdQa2xMWEx0MFdFRVI3ZENIazFYSWN4RVZtcmRZNVpMSEpM?=
 =?utf-8?B?WkszY1NuYnUrRmF3UUpVOHJGQnFFREEyRkkyQ0FwaTlOZUw1OXBpQUhvSUtM?=
 =?utf-8?B?dFlkKzVYV01FcnJFNmdad0NtWE52K1RhdldiNjhkN3AwZFFjR2NiY0ZaUGY3?=
 =?utf-8?B?dXhZaldlV2VpNFc0dkF6YVQyVWczNVYzVUJZQ3MrOFFobmRNcGJRYk1oTnlo?=
 =?utf-8?B?WTk0VVhaS3ZueHRmRFo2R3V4UXp5dmRNZDgvWE1GTmQyT1ptSkFMSStndjN0?=
 =?utf-8?B?aUErYUpkd2JOMEg1VGFHZEQ5QVpocGNaZ0xGTDY0eGZyY2VJMVhGVG1VYTE0?=
 =?utf-8?B?cjJwNjFpTlBRd3FkWnZKcUxqNzdFZSs4SkpJVTZuT09XTWwrUG9RenpGOWk0?=
 =?utf-8?B?RERQc2cxZUt2ellvNTNxYThYZkg5cE5jWXZhaWovbkw5dGxXWmpOT3V3Nmxm?=
 =?utf-8?B?L3Z0L1RjUDZ3TmxSeEdpTVdtTzlMYVcrWm5STjlHM3o4MzBJRThBWE41bzlK?=
 =?utf-8?B?ZGJnK2hRVGtoRFRML0tzbDl2anQ3L1RhQUtkQmNENHRLNGdGMkNmRExLUHN2?=
 =?utf-8?B?LzN3S1FGTExTWnQwQ3dkbEtyekFFdElZSkIveTkvOW9yc1EyNTNvNlIzbXB1?=
 =?utf-8?B?ckZHTVJ0cnlvWnZGeVdsU2JRdEkxaEQ2Z1hKbysrNkVwL09SdXVTczU5S2c0?=
 =?utf-8?B?akxNSHVFaGdWSFdudy9YTnNscWtQQmhBdUhNL25QbzdSZGwvN240TlZmb3Fm?=
 =?utf-8?B?SXBkWE9TdS9QY1cwSDRBNjlmL3lWSG1JOER3UG9CQ0pZZ0lIY2hOWFFjb05X?=
 =?utf-8?B?Q0crQ0ZkMm80cXk3L2JwSzk0amJsSTRXbkZQKzZiSEtJQjViQTRHM1Z2b1BP?=
 =?utf-8?B?MGlPTHoySXZGeDhaWFB1SG1Ib3BsM2o5Nytvek9tMHZZZElTd1JKN29zckdi?=
 =?utf-8?B?NU5EM0V5S1c2ajNsc2FhQnNvMGpISE9qZjhOK1dMWTRCVElQZFNSYnFzR3lI?=
 =?utf-8?B?L2J1bjRxODkxMnEyZitseW00dUN5RUNoc2NKQUhwUk9wK01SY2haV1NKRWg4?=
 =?utf-8?B?ZEYvQy92d2FqTXVpbTJhR2Z0TGt3akVBWHlxRE9nUzlVTTA5MnhNM2tNWi9o?=
 =?utf-8?B?YjJHWFd6OHJDaWdtWXZ3SmxaeDlKODlzR1VnMkg3bVNOU3BIblNOdEFWL21p?=
 =?utf-8?B?Sk5aSVJ4WGZrQm8vSUJvU0NmdUgwMnh1RjRvNHhWaThDS3BNWTdESjZFcTJv?=
 =?utf-8?B?Zlk1V3JTZ0xYckdFRzVycVorb3pCb2dJT003TUFYRFpBa09ocEpsZG5IOUNR?=
 =?utf-8?B?SVQ2TWlXbWNPcXkxcXZONExRZTlpTDMvVkgxNmlNRERNZXdXZ0YwaW5iL2R2?=
 =?utf-8?B?THFqL2JnbFRaNGdaWXN2NEI5TCthWjE1ZDFiakhhbzN5Zkt3NmpzYjlpd0Nv?=
 =?utf-8?B?aEk1S3FGU3Bvc2tCRVMybnpHM1VoU2J1dXRQSjdTVVkrdG12VzJxelF0WEJn?=
 =?utf-8?B?ZGZTTWNhaGFqWjlBcUEvYzRiVFEvcWFNeDJLVTNOa2RwSkZ6b2lYZndDQ2I1?=
 =?utf-8?B?N281Qk5xK0RLZHk2STZaTEVkNm1IL21OMEJuQWJ1cEJuakgxN2syL2dmaExk?=
 =?utf-8?B?cldBU3pQWU5id0xYT1pjZFE1Q21oczlQVlNML3Y2a0hZditOSVlGc2t6ZlJw?=
 =?utf-8?Q?ima5G95vpoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEpiK3hYSGNKOFhKeXNpZ2JxNFV2R083TElKY0o0VzNKVUtOYmlUNzhZQ1NR?=
 =?utf-8?B?Um5BUEhhcHhxMHRDcWhBaGsrekJ6blY0K0dzeEFwL2lFRHM3NGdRVlVjNC9s?=
 =?utf-8?B?VDVIRldNaXRPZXp6UFE4NDFGQmJPU2dTYi9xUkkxaHNqMlVaUzVlZ1p6TUFU?=
 =?utf-8?B?Nm03OWordXhGdDZaVUFUVkE3NHVuSkdtam13Rjc1MThVZW1tR21NdXlIbjBw?=
 =?utf-8?B?aE51TFdRSGN6cjlpK3liQ28rcDNXZHRKVVhQeHJCSi9zVG4xL1Arb0h3OFBq?=
 =?utf-8?B?aGZvTnk0dDRMQVJpQW9Ya25QRHhWK2ZuUW5RdTJ4c21SdVFCZlJ0MUpCdFBu?=
 =?utf-8?B?dkVrSEVNdnV0V3AyZ0dFa0hRSExkanpqbDhXenJUcUFGdWlXQ3Nqay92YjJx?=
 =?utf-8?B?MlJNRURjR2QvUzRNdDhVTHl6VWp5bll6dVhLdmFnTWV3QVJSMWpoUnFxdE5U?=
 =?utf-8?B?VlZFLzVWc2xld2RJYWJvbHh2VUFqaFU3NDVOZVZVMFBzMHhNZVlxTEpzYVJB?=
 =?utf-8?B?dzgyUkxla2hydEk1V2pLMDk4S0RUbWtoU0lrVitTS1dKS3h5WktDL0FPUTJa?=
 =?utf-8?B?VGZqRDg2QThLZHZNcUkvbjdzOHNSOTNpa1QxZStTL1FIU0xDL2Mydm1telhP?=
 =?utf-8?B?ZUJQc0pPdTVJV3lVYUhEbmN0TG9PWFE1eEk1MkU0bVBZYytSVG05V1BPcHJO?=
 =?utf-8?B?ME1GWG5kUDRvMUR2TlMrNDNmbmNJdmVUUk9VcjBydzNpSzRYWEp5WmNDaWJz?=
 =?utf-8?B?YytMSDJuK1AxMTJqdmpqTWpVVnpLa2lBb2pRUG9MQk9iaTNzcW5NOE9QWCtN?=
 =?utf-8?B?ZjJRLzJPNlNlRGxYYjFDZnJlVUZaa1BnbGJqUmt6TEJKcFMrRHVvWGpIZmMz?=
 =?utf-8?B?UGN6QStwR0NoNXl4SC9ERlR1YjI5TWNRRm44dDBDTEZJeUFGL0IxMWs2ZGJE?=
 =?utf-8?B?TTh1ejZxVXAwdEJIbkorL0tGSG9mZE5MMk5NcC9HOFBrOEN0ZXd0bG5VbzUz?=
 =?utf-8?B?RHBOODdHMFJJMGl1RGlpZk50VGZpRklLZjN3MjIrK1hkcmd3aE1UU2hRcXAw?=
 =?utf-8?B?VkNiODhWVjhDQWROUzA2OWRPOFR1YkJtbnJFUG50RVdZSlRJK2xTRE1Uak40?=
 =?utf-8?B?NGVEamVtUlFPUmxTOUJzVzRYdFNoVkVHZ0s0QUlobkFtRDgzcDI3cTJrTUxq?=
 =?utf-8?B?YUhsaGpyd3BWcG1mV2lncXhCUXJRUGVsTURoU1BnL2hpNlJ4MVdaVVF5MDdE?=
 =?utf-8?B?bzk0bE5JaC9nbjUzREpTM05OejZzSXZCdjhmQmtEb2ZGSnFRZ05xN3UxbEp1?=
 =?utf-8?B?TmtTdThGcnlKN3dUQ09kV0EydEJia21udTVjai85dkYyQUZUUkltZllCd3Jp?=
 =?utf-8?B?d2FaamFnVFBkWGp6bmNraE4zSGpRbEp3WkVyMnJQZVVjcWtibWIwdkNGRC9R?=
 =?utf-8?B?dHBndm1CY0RXVE9pa1JxT1pDUUs4MWlrcUVuQVN4cDJuR1J5MEFFUUF5RGxm?=
 =?utf-8?B?NVNRbVBEaG9HQ2NsVEVtbTlicFZkb1c4Z3pPSHk0OVVRbGhESXN5YW80Z2h6?=
 =?utf-8?B?NjdNVW9UR25iYjRuWGVyZE0yTlNZYU1iWUtTc2tvVTV0M3pKcDltdGk2Z0Qw?=
 =?utf-8?B?NVhYSHhSR2pjMnZoK1I2NHo2OWVwUDdlNWxKb3V5WEFnNUZzS3JyamdBbHA3?=
 =?utf-8?B?V3JBcytNTjRqUkZZZm9pZmV3dDE0bUdvNGY4MTgzN0Q5OXRPNGlhRWp6VUR1?=
 =?utf-8?B?NHlzeFRxVzNnTHFnM295VUJuNllaSlJBSXZRT3loMHFqcjdjNUhvNXgyNC9m?=
 =?utf-8?B?NUp3b1hIeXltRDlmU25qQitDZDhqc3IxbGMzZ2pJZExTWkFTSlNNNWhUL3pu?=
 =?utf-8?B?UmMwNTM5OUFVZkUwMW5GRjVCQTRLUmdIb3huMDRlOXc1QXZKdUFtR2h0WVVv?=
 =?utf-8?B?R0xnb04zTDFVSlRyMWk3eS9tdUhlV2RNNENsY1Btd1Noa0lVemNNMEkxdUMx?=
 =?utf-8?B?RXJDK1FINW1BcG5FUm81YnBYTnIvVERrTXNuTW1SSHVCelEyM2sycENDb1VT?=
 =?utf-8?B?NVhUY2F2U0hFVnRkbkxEaWlUWXJGWUlxQmU1VXQwek9GRGFBUEYvTUlQSXA0?=
 =?utf-8?Q?7nvI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e420aab0-1b16-4188-1708-08ddd01712bd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:46:07.7014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEj6H/J1RxPztmjduxP+NKhRVP8JACHUUrJroEtT9jslxi28SBi/J3jDkYToJhP9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436

Thanks Sultan.

On 7/31/2025 8:34 AM, Sultan Alsawaf wrote:
> On Tue, Jul 29, 2025 at 03:43:14PM +0800, Du, Bin wrote:
>> Hi Sultan, really appreciate your time and effort
>>
>> On 7/28/2025 3:04 PM, Sultan Alsawaf wrote:
>>> I found more refcounting issues in addition to the ones from my other emails
>>> while trying to make my webcam work:
>>>

[snip]
>>   static const struct vb2_ops isp4vid_qops = {
>>   	.queue_setup = isp4vid_qops_queue_setup,
>> -	.buf_cleanup = isp4vid_qops_buffer_cleanup,
>>   	.buf_queue = isp4vid_qops_buffer_queue,
>>   	.start_streaming = isp4vid_qops_start_streaming,
>>   	.stop_streaming = isp4vid_qops_stop_streaming,
>> -- 
>> 2.34.1
> 
> The patch looks correct. I will get back to you on this after doing some testing
> myself.
> 
> FYI, I can only test these changes with the old isp4 driver right now, since the
> new isp4 driver doesn't work for me as mentioned in my other email. So far,
> something does seem wrong after these changes I suggested because they break the
> camera on the old isp4 driver too.
> 
> Sultan
Yes, seems so. At the same time, we are checking the new upstream isp4 
driver

Regards,
Bin

