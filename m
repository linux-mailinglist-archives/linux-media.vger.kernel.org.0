Return-Path: <linux-media+bounces-41536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2EB3F9E3
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45F4E3AB657
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BA32EA72C;
	Tue,  2 Sep 2025 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nds8ZXJw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD92580CF;
	Tue,  2 Sep 2025 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804199; cv=fail; b=g3A12LBbgUzPthWDombMzLdFr1kbpyYpvnnNiiw/4AvvVjul5IQiJaq96QVvKHNGGiKXcp8MDOVweAwu9ZGrgXIDN5oq6jINTy8aVR/8rcYI2JicYIQ02WQn67cHhLMIhZM91/KaeDGY8m/CUstgNTrXe/NfXUhR/qb4thSwm7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804199; c=relaxed/simple;
	bh=y8+1cnvI/Qzo2tU7cujbHuwYQsfvqU9kqd+MGqM2VJE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nd/S07OLxXZZPbdrqHNXC3rAIBK49zUxvak0pirQ14yIz2jnu0vWUede9k+o49idHyIqilop8/mgskfxKoJn587p/ZXqlyX+icoTPRxfNiygGKPmPG+766tyLlF59wNGgs1jxpv3bKAdiWnbpmFl2M50nN0JWUZH1fWLqPBcVYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nds8ZXJw; arc=fail smtp.client-ip=40.107.95.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/uXluo+ls3Db3K9t2mYYlZhQWcgJgWduV5TGOc3F+VQXAl4SS9aLj7eCycz4Xm3QHagQdZT66w79iZY2jKlSTHkY6Kdd5JnkKGQHoYZ6mtbrFBES7J0f2+LiWnNTNq+dbGheMi0AMZIn+unWbJwmW9fZ4zuF634VqSN0Hx2M5EZdnc5xCIHwVsxS8vUWW1SJCHKrFeXQklQVrMvpgH3LaVUJaN3/gqKF4ztkhTI6W6Pf9UJQ2HHhL7RK6Vx/f2MlrEVQkE9hFgG9cxgSo89Yv/Of8uQVXinSY8kZGSjk5IwN6szyRn+OS5G2QAYwrA3lxMyRGawaYtwfnOn70AX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCvelgZETGdZutVnPJtdbtBKSi9EQHjyjahG2pmnyek=;
 b=ixx6XXrsjLZUTN9MbbDbMRc8yqv90DBKEE7jDxq7bqYZEqbRuAlo9lwlB9iBFOy6RmwjSwWT2W12wBlD0mbag9ScUnvbMzzvoVB1L9Xnk5lB2KwJqORbTBYmzDX4tDpb1GkJ5Re7sTJ+Q5vCXsbRWAMcvR3IzLgDCgPti0HIeIbEyn1Hc2ljr1LVQiSFS/Xe4MaGgyTIoNjlPNqTZjKy6LMU/8/XMPyV6Q03U8lRtfGec1dFmgi3dgpOFqe4BdkFpzMDNbw4r3Iv1X6x11WF8TTTeG72FK1x+Bno3yujnwf6ykl6dLuLiVqMCy5s8UxgBMSm5JFhGgGAHUBFjILbTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCvelgZETGdZutVnPJtdbtBKSi9EQHjyjahG2pmnyek=;
 b=nds8ZXJwiTyN25uJ7EzIojEgST70L9kw7N/pRGrVV5GHUgxW8O1A6fzQ3DSztucjHldqGWgMPMlgKUOCYLPHOn4m+4AnUfSBdCCtPVWiy4yrdQPyGWvW6FhQkrtONLel3hhpxvt7yuEEiq1n82bH69GiUo9fC6AQaJijVBULMVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 09:09:55 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:09:55 +0000
Message-ID: <354485db-3de2-4b47-b303-4a220178ff53@amd.com>
Date: Tue, 2 Sep 2025 17:09:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <aLaTRwNp_SmHc4K3@kekkonen.localdomain>
 <aLajrP6ANpCZl-0n@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aLajrP6ANpCZl-0n@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 25672161-0b7f-4c85-c64e-08ddea007b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1gwVVlHUFIxUk1aSGZqN0FSMXgrZzlTUWwwOVFqbUI0TTU5NFNEY1dQclhD?=
 =?utf-8?B?NEJoczU2UU5LekRGdVZNZnEvREp3Vk1GY1JZZFBGbEhuaFBQa2ErMXNRTVdT?=
 =?utf-8?B?TzJhcnVEVldNYWFkeXdzN0Q0MzB5NVR5czdVdXZSV0Y0bStieVRjWWhJNHpQ?=
 =?utf-8?B?aTRBWGpTMUNIZENnbG1JNkJ5d3NyTlNFbHQ4QldXZVh1NHI4Q3d3K2pHQk83?=
 =?utf-8?B?SE1ValBGRXJyRTRHK2VVR3daNVd5T0JzOFRybTg5SnFLSW5wM3IrdkNiOTZX?=
 =?utf-8?B?VnoxT2pxYm1vZm83aDlmTEVjNW44enFaS2tBaEZKcEpnTFJUQkFQZkpESFlj?=
 =?utf-8?B?V1NaWTN2Y1c3ZXBwcDJEcUhzNCtVTTBGcHM4SVF1cmxIT3d5SUxucmJtTGtk?=
 =?utf-8?B?MTRKY0pGL2dtckR1ckJtSklxZWxZNmNtM3J0b2tJSG1PV2VJZWh4aTg1b096?=
 =?utf-8?B?aTg5VC8vV0xrWEpVa1RIMFhYaTFnbTRueU0wbTBrOUx2VHRuOUJlYzV2T3lW?=
 =?utf-8?B?bEpQR0hyaVBaNGdUUlNpNjZJQVdVVzVaQ0dNNlhyK0FOb2lLeW0vL3BoSUwx?=
 =?utf-8?B?Sm9PSU1vMXdXeHhnYk9CMUx6SGlpV21TVzlOZDR4eGJGY3J4WW5kQ1FMRExs?=
 =?utf-8?B?dUpaOTlBSmN3aHRrRitZK1JtUG9NeThGb2FaY3Z5TE9pN1hoVTI1MFFLdHFE?=
 =?utf-8?B?T2lsS3B5eVBYYngwMnF2ekdvb082UlhhYThhekNYVTFTSUJtSDNpRi83YjE4?=
 =?utf-8?B?KzRXUGZGak9IV3R1Y1NCeWFWSllMb0VyZndzcDFFb2VRam1pVUVNZ1pUUjU2?=
 =?utf-8?B?ZExYdmJvZ0p0d1k5TWtGcE1aUjRwbUlmcHF1NGNWTDFRb3RyM3hGTWxicG1w?=
 =?utf-8?B?RnhXSjUydEErTlllR3pnK3U5WjF1NnFvQzBaNmZqL2xTdDBIS0RUUlVGL3lx?=
 =?utf-8?B?VDljS3hhZVhBdFYzTkR0VjQ2L29vUDdLMi9hVFFJVi9KYUVCR295MUpNV3Zh?=
 =?utf-8?B?ejJjalJnTnJHNGpEU2lTbkY5K0hoVnNhaUVIbmZXbytvb0Y4QlB4OTN6QTFH?=
 =?utf-8?B?UEhvRTAvWU9aT1Y2OThhdS9qOGZnTjhiellEWVpUYXFnSGZOcllic1c4ZnNV?=
 =?utf-8?B?WlBkQXpOY09NZkUvMW5kTHVFMm5OQ0dZSk9SNE1jN0JZV2gvSzRzdlZROGY0?=
 =?utf-8?B?N3ZYWnZyMDBmVHAyNEFTRmowTW9vQkpmSWJpUzVkSno0S3YybTUvc3JaNUd4?=
 =?utf-8?B?TjBWWlo2d0RxeVBNVElNWnVXd2tQLzBoMzBDbERMMWJaVjVTQlZRL0o3Nm9F?=
 =?utf-8?B?YmN6MXJpZjVkbzNIOGs3UGNqZ3dTaVQ2akVneEpONmorVE9QMzRMd0xPYmd1?=
 =?utf-8?B?OWJVc09BSWVXdkdCRjN0R05JMUZzTU9aQlU3d3VHZWgvL3lhZXNRaGsrUy9O?=
 =?utf-8?B?R2NpTi9zUnFQb09FZ2kxekhHVStiTEozQUZ2WlZnZzRwVjEyUnF6ZXp4TVc5?=
 =?utf-8?B?TG0rSkM4UUJIRTBxTGdKSy84d3lLT3dCcm5SNGxxanVMZTloN2NmVXVrWXQz?=
 =?utf-8?B?VFNtb1VEbDJOUkJxTEowc3NQYVp4ODRvZ0Rib1k0eHhCZFlicW9sWnFQNVA3?=
 =?utf-8?B?b3hhTDBLUnVZMk1mVDZPQ2hMUnNrWEtpbU1mZklyN0NmMDNjcUM0eXhVR2Z1?=
 =?utf-8?B?TkptL3JPZVlNeTIyTGlkWUsxbVphQ3JpRmVRM0V0QzJzbkJIL2pSNTMyTmdV?=
 =?utf-8?B?ZEVZNE1URkZnanNieDcwS1V1RWFJRXpBOUhKd1ZQTmdveCttQ0xEdTcxU3BN?=
 =?utf-8?B?WXArYSsvcndkY3RWajFkY2dnT2JqSkMxMEh2bE00WHF5U1MyV0lCelpOWllS?=
 =?utf-8?B?eWN4dk8yQW8vYXoySjRIVnJJZlRFSEtPYW1FZC9VNHZCMVhwVUd3b3RHK0Ix?=
 =?utf-8?Q?HauSJXjKU9U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldUTU5ML2J3ODdwV0VmT3J4bTdtRFRWdTVSZi9rNUdrRW5HRUltaERZNzVk?=
 =?utf-8?B?RUV2V29vdFI2Wmw0NEVhWHRBNjlXMjlxeUFLaEpWRmhuanVxVFgvTHNsM3JO?=
 =?utf-8?B?czdWaC82aHFhMnVmdVVtQ0lETkRLM2ZoeVdDY1FoYi90R3d4RkdyT0s3YUxa?=
 =?utf-8?B?UTFaT1cyYVZzZU04ZFBJVE0xbzZsQUtqMjh1eDFtM0VwcGp4S1d2Zzh4ak9t?=
 =?utf-8?B?SVVsSkY5THdwd0dpYWZDNXJQUWxaK0RDT3pEV1g2eUYxS1gxQmRRUSsreEE5?=
 =?utf-8?B?NnZydFRyYzV2TnhQMks0b1lOUVpxbFA3STBwTXBRR01xOU5uSXhFYzNMMkp2?=
 =?utf-8?B?a0lIdmRxbGMxWTdNQTh1dTJDS1IyVUxiZ1NOYlVCUHNIWU5LKzRaVkh2T0ZF?=
 =?utf-8?B?cGdEc3FJTFFoeU8reWJwWXVSV1Y3WmxnZjRuM1UrWS9WQW1nOU5lMktGMVVu?=
 =?utf-8?B?U1Mzc0w0U0RVek9mQlNVd0VvODFSSE13VzZkNGhWNUVBVUczdHBGMEV1M0p6?=
 =?utf-8?B?a2Z6dVNEWmRPYzZiR2FMa0pZbWR2TW9jR0xPLzRjQUM3Wi9KNW0rYW4wa3Y0?=
 =?utf-8?B?QnM1VXMzOXF3aWU5ZnhWOCtzMlhEazZJN0dJQzIwWTJwRVB4WmVUM3V5YkE4?=
 =?utf-8?B?RzZFS0NoVjhkblo2WGYyam52ZDhDOEFpVStxZEo0Y25CT3BUWnB5SDRiWlp6?=
 =?utf-8?B?eVZsYjEvV3lOOEM1THNjUml4SHlITy8zc2xDMCtySHpGck5NUVorRThTeUh4?=
 =?utf-8?B?ckpPcEFkN0JQYTVsdDJxZ0hUaXFxekplQ09veUNlZ2hNVFF5dDErYmg3Q0lJ?=
 =?utf-8?B?ME4zcXFyTXE0RGMzL09uYkVjaHBlbEVESHFFbGJ2NWNvQ1dlOHNXZHBlRnZG?=
 =?utf-8?B?WWFxVmpoY3F2RWNWa0c4a2svY3VKT0prNTk1TndSZlVCTkRPMXBLWEd1T09k?=
 =?utf-8?B?Tk1ZNGFNUno2djhSQkZzMnVrVldrMThuK3VUOTN5dzNwUHAxY21CN3BKQ0hW?=
 =?utf-8?B?QWpvUFBTaDJadkVrMGR2WGhEZENNcHUzYUFMK1hMR3NtL241VytuSm9laW5E?=
 =?utf-8?B?NHVJK3ZWeE5FTS9NaDJqaTIvRFBhc0E2cUZySHNOeUF0eHlxbUo1Znl0ZzU3?=
 =?utf-8?B?RXY4RGN3cFJFVzZvTkdsQTVESHhMYUVBOW1LdndtTW1NbTR0V3Z5SnZWaDc0?=
 =?utf-8?B?bHo1bW5JZDJtN3Jhc1I0ZlFxRDhGMk80dE9KbkNIcHp5ZEhHQ0puNkFkaWRz?=
 =?utf-8?B?WWpWUzVoVXJnYUdoSisyWEpLUnNnbTZicDdoVWtOQTAxdTIxWk9HR1FRRE5n?=
 =?utf-8?B?SHFZUlhXR2NOZEh1bHp3Yzd1a1RKMlM4UVAzZHV3MndUczdtb3lHZmU4ajh2?=
 =?utf-8?B?Mk5xUCtxY3hUQUVmMENKL0xReXFQM1gzOHg1OElZTGtScUY5VEJMMDkxaVhs?=
 =?utf-8?B?d05Vdm1hcnR1Qys2STYxbUliMEc5S2RYZG92V250Y2F4L2NkU2I3ajlXMEo5?=
 =?utf-8?B?SldVNlhsdTVhSnJaL3gxY1NxSStQUjgxbjJ1WUZIVWl5aXc4aHBMTXQxcnRQ?=
 =?utf-8?B?TlQ0dDdVOUFMZUdCc2JGRXgvcWJ3RVVKb3NwYXpGQmFUdTdodEZJVmtqaVhm?=
 =?utf-8?B?S3BJVEpYaU8wM1A1Rkw0Wk5TQWFEZm1NZG1JTm5pbUNPdEMycEtaU3JCdU4w?=
 =?utf-8?B?RjhYZDVxUVRYUys0eHNNQ05YYnhkTDVoZjZ3dzFyNGJwdURCV2IyNm5IK3Nt?=
 =?utf-8?B?Rklqc2tiR3ZvUlNlcTJBTmtkd0RaWHc1dkVlUjdDUkZiUGVEMURuM2JiQ0Fx?=
 =?utf-8?B?dUdtQkp5Zng2c0h0eGVFVEV6c2xFNTR0MDBDZHplM1lLSXJRQzFHUEVUQW0w?=
 =?utf-8?B?VTAveUF5eHNGclVvWkNjdkxiZVRyczdydXpuTXg2cE1FczkvcU5xYVFwNitJ?=
 =?utf-8?B?NlJ6bGNUbUE3YnZ0dmNtcExvWmRTUmhjU28vM2NncWpoaXk2UWYrb29hc1Qr?=
 =?utf-8?B?VVpsVk15b2VaNXV6TnpZaVJUWC9kdWhNV1NRcExRRlRWclJNc0IxeFZuNUI5?=
 =?utf-8?B?Q2J6OG44R08yNGV1aW9XbC9aUVRsQkZRdkVXYkYxOHNsaU9lRkZrL3VreW9z?=
 =?utf-8?Q?t01Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25672161-0b7f-4c85-c64e-08ddea007b9f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:09:55.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCIHQdIOe5KpWwvh0537XJoDmxKZz1Zk+ZfekaVti1IbiF4OdSyUReN/tUic3cDn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864

Hi Sakari Ailus,

On 9/2/2025 3:58 PM, Sakari Ailus wrote:
> On Tue, Sep 02, 2025 at 09:48:41AM +0300, Sakari Ailus wrote:
>> Hi Bin,
>>
>> On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
>>> AMD isp4 capture is a v4l2 media device which implements media controller
>>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>>> interface for now. Also add ISP4 driver related entry info into the
>>> MAINTAINERS file
>>>
>>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>
>> Could you elaborate what are the changes in this version compared to the
>> previous one, please?
> 
> Ah, I missed there was a cover page in a different thread. Please ignore.
> 

Yes, 
https://lore.kernel.org/linux-media/20250828084507.94552-1-Bin.Du@amd.com/ 
is the cover letter, because of some server issue, the cover letter and 
left patches are sent separately, really sorry for the confusing.

-- 
Regards,
Bin


