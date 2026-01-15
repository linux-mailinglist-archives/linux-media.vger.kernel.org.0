Return-Path: <linux-media+bounces-50748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38BD229F7
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4F53051337
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 06:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5412EACF2;
	Thu, 15 Jan 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oGW68KXm"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782552E92C3;
	Thu, 15 Jan 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459654; cv=fail; b=ouWMrlF4wEIi0XNAbfHeKPpl6GcoaEisknSFzXhPjfZd9JkFaHQMcKhW7/NgbQPUN67YoXcQQRr5L/ppobJUWIYOxxTUsbZffajHiqHu/pBF2Mki6rPXbyU8piDxFRlZu/iW8n3CB57xr0sxLKhZiqhIaB8zNos8PVDjb1xhenI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459654; c=relaxed/simple;
	bh=ayCGLkrosh5MA3QXHuiJw5OIP1U63UFb9oMtroW4kSE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eN8xlPZe3hTYk18T+b3XaVAqnYY3wWvUMWbUJkM2lSvZVdRozdPaAVSiZRY8klDyawSBY3LQ4wFY175LmN04vX4gwD+rKC3jsjiD+EMmG2kM0By6d4+tjKxJa7mbLUcPQdkBYv5xEWyRWmUnyu+dQHkR+asbMWPiAPrl54yw4QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oGW68KXm; arc=fail smtp.client-ip=52.101.53.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GotrXWtg+uyWrwM6BxsZ7xXh4XFfiWq0pfOqIPGsuWUXFAQ+vKtyXRNU2iGPIyYxXJkb50iJ2eh/X9TwDEV5lH/TxuR+GUXaO1ynhOpR+v2Hg0vzFg7tLrl3FqXoBSiozozNUC1isFX7yCo7tNkLfaGQ8lYExDdgejS0iWGWmfcKbtVVj/rxR2GwmVWbQUuVk8fJ+CiqjPa8OgiSSUFUaexEOw9QhcCoz+3iz0pnbMB1AcrRAIcW2chVhP1MUqIkJy0IJgyIboETjP67lymdAtGNFQqKeCP1cUKIXvW8C9Pt+DEI8qxz9phyylAyIqKsgkDN0+Yqib1xirWl4m9i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twe2HF/y5hg9SqIZ8kO2PMfCNZxAsS6Od/qlDI/g/44=;
 b=LXD5YA9fwD2Y+5dXIyL3oml5oaX3gTJyCwfCo6QFCJVutfxOx38r4ezcKvS9EhEHSmvels/xjs1rYEpPwvJXQ6Os4SgkxlH+IWSqIbxe+0zAmt1/t7fzqpsr7lxAddYLhX0PoEkM3c5Ppv1RAzzgzRy0IhYqFe4LzaE7emP27cVxtp6tG1p9kx8q/Q36xECLcBod2YXB7W3izD8R9g3rSRQxnOwNBoHfcGUKWizAD+783P6xaTxDTR9nQOf68HqdPFC2HXo27JPZcxMqnY8o2KEjFOz6ZVHPCzZL0SEc4rStNwIatfWeM7S4AZsXADGIubzyPVfFaS1d682Ty0anAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twe2HF/y5hg9SqIZ8kO2PMfCNZxAsS6Od/qlDI/g/44=;
 b=oGW68KXmUKoFVTTy7KyrAN2pyA2JgZfrqBWw7wXrZtHPCkz8xNnUkkBL7XxI8wNi2iNwy2cQuZ/smAwTJ8raJQrTK6jmKEhi1pCOfbsBwBkO1E0v1dr5XMrdhX112Sf7V4TJdPxY1xfSWryjid18rpwixEfCwNXMENaStsXEafo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 06:47:21 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 06:47:21 +0000
Message-ID: <ddaf56e2-f065-4cfb-8a06-28479065713c@amd.com>
Date: Thu, 15 Jan 2026 14:47:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: Kate Hsuan <hpa@redhat.com>, "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <CAEth8oGuoFH1R1NXVmFFrDmZeKLZSHnJO=wuXdaFYLFXi4upGA@mail.gmail.com>
 <CAEth8oHw6zjTYP31sCmpSX_Ac2Vb8QDnf=ZUt=tWGQeO9ApS=w@mail.gmail.com>
 <fcc79419-9f9b-4151-8a95-b287ecb0436b@amd.com>
 <CAEth8oGMNUuKCiW=wgQqpC29TWxAfRLiVMvy=eF5KX0Psqq3gQ@mail.gmail.com>
 <e2132038-2220-4cb3-b21e-f98848d41970@amd.com>
 <CAEth8oFRY_0ZwgTdP4YmY0W+FoGyH9fy_OCxRg790n3hqb+gww@mail.gmail.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <CAEth8oFRY_0ZwgTdP4YmY0W+FoGyH9fy_OCxRg790n3hqb+gww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::31) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5aaa98-9cb4-4e4c-c133-08de5401ee8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0J1bTIzQ2w2ODdaaGpPRnQrRStYQW5ySzQxT0FJaGFVWGRlaTFvMlJyaU5C?=
 =?utf-8?B?SkxqNHhkem4yek50LysyQ1IwYTFnNFZ6T2krUXV2eEFUejQ1cWJPNjBtRGJt?=
 =?utf-8?B?SnZ4VjBJa1VhNHVaOWxEQXhSYnQwRTRKaWhpM2Z5NDU3NkhDM0ZkOHRiZWJx?=
 =?utf-8?B?aTAzbldWMW8zSE95WmdORlBlNURITlVwMWtiVGc1aGNGcGRJWTUvcEVWWXlp?=
 =?utf-8?B?cDdheWtUVk85TndYZ0l2a0Z3UHNLdHlteXdzVkNZcVAvSmR6aUQ4RHJCQi9j?=
 =?utf-8?B?aUQ1VUdKNnN3eHN3bW03WjVjRXJVdTVEQ09PeXdhcjk1OFhuOHJQVGtpTi85?=
 =?utf-8?B?MUszVzJhNHE1WTh4bm04UFg3dDRjMU1QSTBYa3ZEUlI0VzNURksydUMwbjIz?=
 =?utf-8?B?cGhIVFh0dFlHeHJoNHFlbGgrMUY1aTczc3ZsRytQUXUxK0VFdHVJREZRLzVK?=
 =?utf-8?B?MlE1UnErRjNlRWlhTFBoMjlMR2o0S3V6NWd5SWh0Z2cvd0NjQW5wRSt2aVM2?=
 =?utf-8?B?NU4ydmx3bWhPMFBoNlNWb3Nod3cwcW5JSGZFcW5IVTdHNU1NZGdobXBiS2Zi?=
 =?utf-8?B?MHFoVkRJa2h3bnNwUHM0TmhSSTlFSitzRzYzeEI0bGVvSmR1ODBZTlN6Z3Uv?=
 =?utf-8?B?TEVWdElBQ3lVemp4VVA0am1WNU92Q0JyUnZsVjZOQWU2M1J2SFFGYnZseEFN?=
 =?utf-8?B?R3MwVUFEUGpWQms4UExXMGVncGZNV1crVXY3a3B5MDh0ZVJzcnEwZnFDS3dl?=
 =?utf-8?B?RytGQmh3UHpYMkI2a2xsVFdPeDgwakpMalNmN01IcXA1SlYrVlUvc2crREw4?=
 =?utf-8?B?OW1FWFBrcVF6TmFHZ094NEk4UjJIcXdRYUlRUkVRR2JRbzBiVGVJZ0RsbUZN?=
 =?utf-8?B?aklqenlDR05Xbk1RMS9EU0tNbzF3K3FpdGF1cGQ3cEJlWThtNTFRbUFzSWZT?=
 =?utf-8?B?V1FQMUo5UmxPVDk5RFc3SzlTViswUmY2eUNLRnFqYVFManE0NWRvcVN0ZEJm?=
 =?utf-8?B?YW13VUZaM3dWQWlkazMyOXlqWkdjV0lNNFdaTEUwcmFrV3NhSDVZdWZ2Ym9Z?=
 =?utf-8?B?OFRxcWZQc0dWYllURFJTUlJCWEJYL0RYd29jR0EzRVN0d1R2WGY5NS9kQkU3?=
 =?utf-8?B?eDRvRDdvMXpGL2lxQ3ZoVERwL0JZRTlsb2t1Y0FIUFF1L2dMbWZWRjJpQlhC?=
 =?utf-8?B?djkvYmVURFVESUN6N1YxeDlRUFpoZXp4d2V4MmtsVEh2RlpIRWtjUVVmTnVL?=
 =?utf-8?B?UzJYMmFzMUZhYytCUzZqWjBZS2hkWUkrcXlsbXZBeHN4SVRSTUlJbVczcjhJ?=
 =?utf-8?B?bTl4Tm05UnRUU29vbFdnUG44QkV1cXYrK3lhL0kzcExja3NGUVhIZTlpczJv?=
 =?utf-8?B?VmprTEgyRGJWSTA4N1Y3RjFQcGxrZEpaVEI2VklMOG9VdWlVWmhOeVI1KzJZ?=
 =?utf-8?B?anMyR1pRYzVuQjRPK2ozbnNBbVlSSDgydm1EbnZWWUMvTEoyNHVLT0NOU3VC?=
 =?utf-8?B?UXB6V0JTUzRrZEtYZForQXFXYU5UOXNrM1ZPK2doRmJ2Wlczc3UveDhxa3Mz?=
 =?utf-8?B?TlZrY1BvL1VHTUdXTnVyWW5KUzlieTI0N0lGblNiVlBvV1RJMUttV0ovanhj?=
 =?utf-8?B?MWFDaUx6eW9IQmZoM0g4SUFneUNsemlOdzU0RXY0a2Y5NnhvK2wrb2wyQ01B?=
 =?utf-8?B?R0NRR2NRUWFZY054MGFyT25yL1hLeEVJbzNDUmYxT1Z1YmlEVHp4VXc3Y2hP?=
 =?utf-8?B?T0luOWFLZG96QXNaclV0Szg5cWp3MUMrK3grWUJYQTBZcUJhdHRhYVpUdmVl?=
 =?utf-8?B?anpUaUpTenBYK2lha2tuS2E2NUp3ZGhGclhsZ2lpeEhTSVZDTjh4MUhjbG5z?=
 =?utf-8?B?dXRoWnB1R3UzTXJoak5vby9yVWlBUU5oZDQrKzkxNE9UcWpVVVdRYmFsTWVJ?=
 =?utf-8?B?RWh3a1pRWG1ScFB1OFZneS8xS0RyQUV3WGFZNERsNHQwT1hRdmwrYWhWVFVF?=
 =?utf-8?B?OWtpQnZTNUxZeWRKeGExWFZ6eEI2OTk5WWdiOVd3empCSUUxcHNvQWtqM2U0?=
 =?utf-8?B?Sk9EcnQ2aTdRUmIvbXRBbklsRTNsRVRPM1BhaGw2Qk43UTRLb3psYWZLRlJv?=
 =?utf-8?Q?VqVU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG14YVd2cjJPT29UbThETUxWaTVIZXdFMzR6dlB1YmhHY2xvS2lpSnVnV25O?=
 =?utf-8?B?TUtaQ1pIdTBldUt3a2VSNXlCb01QcURBTkVDdFRuOFpsVGxYWmNoRU5zMTBt?=
 =?utf-8?B?Vms3V3ByOVg5SWhxM2JhY2tialdrbWFWU0djWTFtYXZZSVlpcm9LcUpOTHlx?=
 =?utf-8?B?N2dvTWc0N0VVQUEySGxOK0VSRnozREZqb2phMnUxUkZLdVlkV0RSNkxrTXFP?=
 =?utf-8?B?NVhzd0JGL0Ewa1FwRXV2VEx0eDNsMUk0REJWdmpCSklzRnA5dG9sbVVJU0Ru?=
 =?utf-8?B?YmxPVlNqUTNkY3RUKzB1YXpTRlFOR2poSkpoSmlPbWlqOUM2cnVWam1qelY1?=
 =?utf-8?B?ekw2WE9nUGxqVTlzV0RRaUNkcExielJzcmZzL0hVWHRLdVB5Z2JtMjFLR3Jy?=
 =?utf-8?B?bWNJajJLSTZNYm1GQ3dLUHdxRGN0bEtHTGlYVEVVeGdnRVNZbEdIalFLS0xL?=
 =?utf-8?B?VU9CQVlUenhEaEo1djdhOE9xUUJlNWswWE8rQkNyb1hHaDJvUjlBNlFmbnZX?=
 =?utf-8?B?N2xpOENpbVBDeUp0Zms3WGFvT1NmZlplVTRGNGZ1b3dzNXkvRXJ2TkhLTnBH?=
 =?utf-8?B?VlRvREZXeWNGeGRKRVpyNmdoK0hYeEhNWDJvUDZINDdxek0xWk41bW95eEt2?=
 =?utf-8?B?TUo0a3VtNHc4TGdFZWdOLzkvNFQrTUhmS25XSFdYYjhtNkNOUzBxYzVlRkV3?=
 =?utf-8?B?LzZNS2g0N0p1WlRpdmgzR3B1NWRjZzBOK0hDOU00cysyRG1WdzF5dnQwekU4?=
 =?utf-8?B?MDcwSXg3dFFxUmFEVXdUUFJ0YXZsUndLQmc3SXNvb3VtTVU5RTN3Rm5sdWd5?=
 =?utf-8?B?VVZmMTQ5VTZHemRZSzZyWEFINEtVOEhDMFhzSFZuRjNtL1ZCc21JMkViTXRm?=
 =?utf-8?B?UzAvYWc2MkNXQjdYekNTUW9IUFFWbG5nUlM0MGpEZXdwdmhiZ0gyYWNnb2o4?=
 =?utf-8?B?aURRVFF1Nnc3SzhsTXZ5MkQ3L0NMU3Z4MjFRUDhML2R3dlJKdVRHMThISWEr?=
 =?utf-8?B?L3J2aHhTcXRka1JJWUJIYnViZU1JcVpxd0VVR2k1b2R0cGthNHZ2cU90L1h3?=
 =?utf-8?B?bE8ySHN6d2t5ZzBwOFRONCtjVFhWVzdVTHk3VVVOZHNwWnY3UmMrNFo5VVRV?=
 =?utf-8?B?enJ5WWtkbUpxSGM4SlFWWEo2SjRQRDlXN28vZUZkbyt6dWxpZHR4NXV1UnRx?=
 =?utf-8?B?TDI1c3VRU0Nyb0FoWFpzU3huTlVUY3RUY05MbGVvVGt1bmtTaVl6azVPQ0pE?=
 =?utf-8?B?c05DOUlpTWpna0UzbmJkazBUUElCckZ0c0R6VjJQbEZHZkpVaS81YWEwUDZM?=
 =?utf-8?B?akl0Y2lMS0xNd2lidDJVWDhEck81cVRVSkY3Tkw4a3pZUSsxZThvNmxTRlJa?=
 =?utf-8?B?Nko5OEl4MVZiYjV0S2VoTnBYUmwxYy8vekcrelBvZSt1MS92UkhpQ1lUbHU4?=
 =?utf-8?B?bmx2OWFya3BRbFJtMmpNb0dBZ1AyM3lHL0M2d25INEt6aTZmcjBqSTRJQ25l?=
 =?utf-8?B?K0pSK2EzY0REMmZrWGp2d1RzejUvZnFMR3ZqR0svNGRETTU0dk1VRjNCNDVo?=
 =?utf-8?B?dEExWEYrdzZWUDkrMHlzbHhHNFJjemJCQmZIb3JjaXlXNGs2b1VaQkdwa3Zx?=
 =?utf-8?B?WUlJR1Z3TEk4U1VIcjBpaHB0NWl3WFc2eFFTYVF5SGVBNmh5R2d5UzhDbEp1?=
 =?utf-8?B?bUZsc2Mrc2M2S2I1WXZsMEo1OUNDMUFPY01HUXloMyswMDdNNG1qQk05RndX?=
 =?utf-8?B?c0lCRUU4YmlQV1BCSWRPaDkrUG1BWndNVFBNSlY4K2JmU0JPVjV6QUI5NEl4?=
 =?utf-8?B?bHg5dHcvMUlCQnU3V0h0WEV6L29QdmR3VUhwcEl5ZG1UVkUvZUhpdHpUTk9r?=
 =?utf-8?B?WDdKbGpkcVhZVFFLeHZHc1BCb0UzR09jYUVOcE5xcTVMdklYMDNpU2NwS3dW?=
 =?utf-8?B?VUJkT3dTNHBVdjJxVzlBUUM3Y2l5MnJKQ1M3YkFFbVR3TDM4ek03NW9FdUcy?=
 =?utf-8?B?QXdzWTdZTysyN1Y5R3hUTzFrSWg5N21XMmZiNVpxS0JSWFZmWk1hUnRFOXVI?=
 =?utf-8?B?VHpMdkRXcE0zcW9QZUNYUjYxVzc1aExHWE0yYXlxSEhzK3h0Qk4ySjJkdzNr?=
 =?utf-8?B?MmMxRDhNcHVZY1FaWnB1UDFnSm9lVkk3NU80d000WHVONUZlYUQrQ01Da2dK?=
 =?utf-8?B?a2ZPc3c2bmFFc1lCSXQwUmRXcWFRR3hmS0l6VTV4bEFnRzZxVWh0NTNjZlJm?=
 =?utf-8?B?RHlpd2tTOXgyLzhtYnhaMmZ2dXorVzJ4eTZWdFpaTU1RU3ZEYzQwVkxyUThs?=
 =?utf-8?Q?nhb9Hh2pfT2ezm7cBt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5aaa98-9cb4-4e4c-c133-08de5401ee8e
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 06:47:21.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaZdcgeU23RGP52dK5iNBKehA9QDTyypcpVUO/qJvlMIxShYQaGS4hvYi1nmJza7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558



On 1/14/2026 4:59 PM, Kate Hsuan wrote:
> Hi Pratap,
> 
> On Wed, Jan 14, 2026 at 1:14 AM Nirujogi, Pratap <pnirujog@amd.com> wrote:
>>
>> Hi Kate,
>>
>> On 1/13/2026 9:11 AM, Kate Hsuan wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.

[snip]

>>>> --
>>>> Regards,
>>>> Bin
>>>>
>>> The ISP driver works perfectly with a clear and sharp video. I tested
>>> it again, and I found a suspend/resume issue.
>>> The ISP can't suspend when the system is set to suspend. The privacy
>>> LED is on when the system is suspended. Therefore, the user will see a
>>> luminous privacy LED when the system is set to suspend.
>>> Today, I made a work to move all the power control to use the runtime
>>> PM, including suspend/resume. This work may be humble and may break
>>> the finite state machine but it works. The major changes of it
>>> include:
>>> 1. Support suspend/resume.
>>> 2. The power is managed by the runtime PM so the s_power and the related
>>>      callback function were dropped.
>>> 3. The enable_isp GPIO pin is controlled by the runtime PM.
>>> 4. pm_runtime_get_noresume() is used to get the runtime PM at probe()
>>>      since the device doesn't have to be set to power on when initialising.
>>>
>>> This work stops the video stream on suspend and starts the stream on
>>> resume so the privacy LED is turned on and turned off with the changes
>>> of suspend and resume.
>>>
>>> Could you please consider this patch and idea?
>>>
>>> Thank you :)
>>
>> Thanks for reporting this issue and also providing the patch.
>>
>> We have addressed this issue recently. I suspect the below fix in AMDGPU
>> available in v6.19-rc5 is missing in your build.
>>
>> https://github.com/torvalds/linux/commit/7ed51e3a1381422278933d0d3ebda0268b6825de
>>
>> I have tested locally and this issue is not observed with this change
>> included. Can you please check and feedback if this solves the problem?
>>
>> This change takes care of handling isp suspend-resume as part of amdgpu
>> device suspend-resume instead of genpd, and uses the pm rumtime as you
>> have suggested.
>>
>> Thanks,
>>
>> Pratap
>>
>>
>>>
>>> --
>>> BR,
>>> Kate
>>
> 
> I tested again with the patch you mentioned. It works but I found some issues.
> I also tested it with my work and the test results were shown as follows.
> 
> The test step is
> 1. start the camera app -> 2. set to suspend -> 3. resume the laptop
> 
> The results:
> 1. rebase to 6.19-RC5 with the fix patch (7ed51e3a1)
> It works but I found the logs when stopping the video stream
> ...
> [  527.733851] amd_isp_capture amd_isp_capture: fail to disable stream
> ...
> [  528.237828] amd_isp_capture amd_isp_capture: fail to stop steam
> ...
> The isp4 tries to stop the stream but it fails to write the data to
> the firmware.
> I think the ISP stops working before the ISP stops the video stream.
> So, it cannot write the data to the firmware.
> 
> 2.  fix patch (7ed51e3a1) + ISP4 runtime PM (my work)
> This also works.
> The ISP4 complains the error about "static void
> isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)" when suspend.
> 
> (This only happens when suspending the system)
> [  223.085419] WARNING: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:517
> at amdgpu_bo_free_kernel+0xe9/0x100 [amdgpu], CPU#30:
> kworker/u130:4/794
> [  223.085552] Modules linked in: uinput(E) rfcomm(E) snd_seq_dummy(E)
> snd_hrtimer(E) hid_sensor_gyro_3d(E) hid_sensor_trigger(E)
> hid_sensor_iio_common(E) industrialio_triggered_buffer(E) kfifo_buf(E)
> industrialio(E) hid_sensor_hub(E) sunrpc(E) nf_conntrack_netbios_ns(E)
> nf_conntrack_broadcast(E) nft_fib_inet(E) nft_fib_ipv4(E)
> 
> <snip>
> 
> [  223.085591] CPU: 30 UID: 0 PID: 794 Comm: kworker/u130:4 Tainted: G
>         W   E       6.19.0-rc5+ #92 PREEMPT(lazy)
> [  223.085592] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
> [  223.085592] Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile
> Workstation PC/8D01, BIOS X89 Ver. 01.01.00 01/16/2025
> [  223.085593] Workqueue: async async_run_entry_fn
> [  223.085594] RIP: 0010:amdgpu_bo_free_kernel+0xe9/0x100 [amdgpu]
> [  223.085725] Code: f4 ff ff 4d 85 e4 74 08 49 c7 04 24 00 00 00 00
> 48 85 ed 74 08 48 c7 45 00 00 00 00 00 5b 5d 41 5c 41 5d 41 5e c3 cc
> cc cc cc <0f> 0b e9 42 ff ff ff 3d 00 fe ff ff 0f 85 a1 34 95 00 eb bd
> 0f 1f
> [  223.085725] RSP: 0018:ffffcd80413e7ae0 EFLAGS: 00010202
> [  223.085726] RAX: 0000000000000000 RBX: 0000000000000005 RCX: 0000000080800077
> [  223.085726] RDX: ffff8b3719f6eef0 RSI: ffff8b3719f6eee8 RDI: ffff8b3719f6eef8
> [  223.085727] RBP: ffff8b3719f6eee0 R08: 0000000000000000 R09: ffffffffc0558135
> [  223.085727] R10: ffff8b3719f6e7a0 R11: ffffef494467db80 R12: ffff8b370ef86220
> [  223.085727] R13: ffff8b3718003c00 R14: ffff8b372a60ee00 R15: ffff8b370ef86220
> [  223.085728] FS:  0000000000000000(0000) GS:ffff8b5649311000(0000)
> knlGS:0000000000000000
> [  223.085728] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  223.085729] CR2: 0000563d26ad9000 CR3: 00000001ace2c000 CR4: 0000000000f50ef0
> [  223.085730] PKRU: 55555554
> [  223.085730] Call Trace:
> [  223.085730]  <TASK>
> [  223.085731]  isp4if_dealloc_fw_gpumem+0xcd/0x100 [amd_capture]
> [  223.085733]  isp4if_stop+0x59/0x70 [amd_capture]
> [  223.085735]  isp4sd_pwroff_and_deinit.isra.0+0x99/0x160 [amd_capture]
> [  223.085737]  isp4sd_stop_stream+0xbe/0x250 [amd_capture]
> [  223.085740]  v4l2_subdev_disable_streams+0x1ad/0x390 [videodev]
> [  223.085747]  ? dc_dmub_srv_wait_for_idle+0x50/0x150 [amdgpu]
> [  223.085914]  isp4_suspend+0x2d/0x80 [amd_capture]
> [  223.085916]  genpd_runtime_suspend+0xe7/0x300
> [  223.085917]  ? __pfx_isp_suspend_device+0x10/0x10 [amdgpu]
> [  223.086069]  pm_runtime_force_suspend+0x71/0x110
> [  223.086070]  ? __pfx_genpd_runtime_suspend+0x10/0x10
> [  223.086071]  device_for_each_child+0x71/0xb0
> [  223.086073]  isp_v4_1_1_hw_suspend+0x22/0x40 [amdgpu]
> [  223.086223]  ? amdgpu_dpm_gfx_state_change+0x49/0x60 [amdgpu]
> [  223.086399]  amdgpu_ip_block_suspend+0x27/0x50 [amdgpu]
> [  223.086522]  amdgpu_device_ip_suspend_phase2+0x13c/0x3d0 [amdgpu]
> [  223.086647]  amdgpu_device_suspend+0x161/0x240 [amdgpu]
> 
> 
> Both solutions work but need to be integrated.
> ISP4 already enables the runtime PM so the power settings can be moved
> to the runtime PM and the s_power callback can be dropped. The runtime
> PM can be used to power on and power off the ISP4 for the typical
> operations, for example, the user turns on the camera and shutdowns
> the camera. If the ISP4 media device manages the power status using
> the runtime PM, the video stream can be gracefully stopped to ensure
> no error events are propagated to the user apps. Moreover, it resolves
> the suspend/resume issues and the runtime PM will manage the
> suspend/resume status.
> 

Thank you, Kate, for verifying and debugging. Yes, s_power is now 
obsolete and should be replaced by runtime PM which is also suggested by 
Sakari in one of his comments. In our initial version, support for 
camera streaming suspend and resume wasn't included, so if you suspend 
the laptop while the camera is running, it won't continue to run after 
resuming. However, it's easy to fix by simply reopening the camera app. 
Therefore, the stream disabling or stopping failure after resume is 
expected and harmless. On the other hand, the isp4if_dealloc_fw_gpumem 
error was unexpected, as we hadn't encountered it before. Once we've 
switched from s_power to runtime PM, we'll test again on 6.19-RC5 as you.

-- 
Regards,
Bin


