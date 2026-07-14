Return-Path: <linux-media+bounces-67562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gbDlJjIrVmpo0gAAu9opvQ
	(envelope-from <linux-media+bounces-67562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:27:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54525754876
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=I6zmW3OK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67562-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67562-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DA583067C94
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 12:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C62D44B69C;
	Tue, 14 Jul 2026 12:24:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB93448D03;
	Tue, 14 Jul 2026 12:24:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031874; cv=fail; b=b31TpA9sd4L3ZvM3Mbjj/uqXlue4IO+CE45X9tjmD1AoEYyqeWry31VEZ9FeLrJCGYghc6zwem+kOEmDFGedl/2XB4fjPVimiEfdLP6q3SUTzrSbo1H67f2I4xMYmhvYk43PxUYc8dgA3gzk1g0f7XCqocaUUq3/yWLYKPRRn7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031874; c=relaxed/simple;
	bh=pZDGbWkiPVNZN6qJFXUcqcxCJHIXY1ESLGMzE4Ndg58=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qK/es0KD/c2nqY1yow8XDRrMPbMOAJvvVIi5vUfIb2FtQghHldnovZ6wGY6OM8PlhvxzSIdirUiacKiSz+PIhOL/Bd7TqzrJic8xKuvbBGiHgrOMbSyBd3PEXHkFefBgrd6R3FiL31E2K5qYiU5I0tVS/O6ncX1q9z2xYei0Ua8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I6zmW3OK; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isKA+3WlWv20An9N/0cBVXJZsgWcbMd/Zrj5YZFhXTTQ6yT4QOxZu0mLpgYwre5DZrMh4L0xYgdW9eZ+INW1fvfAS7GleERHslvUqX0PWeFUx00eS7ebU4gjLRPxeqjL955m9Is9CxBgm1sGPrV2Iy9cCx7gqPqOk8ul+c/NmFjX2sEvMpClL+RbwnSFeCIu1fvyzzPklITZRrpQcYFY8LJhSMwPQ6WtvaTJf76B3dTZcfdzkMkIY4iM7y8V13hP9l7a5z+1aUURHvyk1H2F8LPuKWIAIcMbF7mEtvg6oohLY/p37a5EjmEmxA5l8jiWo6com3dM55SmTbO4evp1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGeT0F8HdfVtW/QKVHUM86s8Gy7Aqqi2GhckDlsZk+4=;
 b=T++Vuojcobl80AZBq228jWx6wQlsulZiYten/wlSB6HGaUn7XZbxAg6V/nkUqKKIu/COodddosb0FgRgRHOY3p6bYRpGq1a3lYiLmfKrWjgaW6wqDfqfw4Uqt9vMwAtQ7OtsZELB+Lt83+6NgMMJnSo3I580SeuXE3cfwzaA/tfCMqqnf+pcr52kaSTD6L0YQGEbnZR6B7kjg7o08a3BIBzL/VBiabcQhlTwICQiE3uyUcrlwRyL5or76Ik9ouxy6I6lpCCZ15tJSwZCcM6fCyXof5Rdus0eX4jOxMxExNhH1aIX1JOcobMf7S4RwkOVJvkRkHCqY3tESz4b9ThfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGeT0F8HdfVtW/QKVHUM86s8Gy7Aqqi2GhckDlsZk+4=;
 b=I6zmW3OKhZ8vQL57IaMnrnkfx+gKLlnyCgP+maLkWYxrCNjmVUi3NHjdK0Xp6o2zS81I5/t+a1BFrniRNGQJ0eQ9QoT8dPy4sr3XiTTG/sfw6iCfQjKU7F8inYUzoM9DxS1oytNQrKixTECMqRnp1QfBIs6eX0WE8pmulS+XpxU=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6742.namprd12.prod.outlook.com (2603:10b6:806:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 12:24:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 12:24:12 +0000
Message-ID: <4ccf4ae5-ccd7-4bec-836a-fcebfa271c96@amd.com>
Date: Tue, 14 Jul 2026 14:24:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] dma-buf: fix fd leak when copy_to_user() fails
 after fd_install()
To: Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "T . J . Mercier" <tjmercier@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Sandeep Patil <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
 <20260714114654.3885457-1-shoubaineng@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260714114654.3885457-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:52f::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a963880-8c1c-436d-2268-08dee1a2cf7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TmR6DhnrJeDRyQZRfQAcbG6KOyJubG5+JSl71GWoff78uI4PAK+QNMK/VT4qH7q6YYxGUn2pPuBn6O4tMt4HkHMVH09ViYb3h/mgArDnctBroGfFD27IEEjqprxzzZ1JSF8nzX4lJ2Ifr64GsLxLHP3OBC4bl2HHAZ5asWSE7UB7RgmLVCzD8VQy8kuNxR8mIAHq9xtzZ/6bCG7xftNG861Vc8uZT85q1KEJl+Q21F5ELSEYg2N+jbqXdLZUNbY5KcXGFbQ2Fv8rnPSXE2q/f22SweLU0g6HAzHRVsAE9cnvqjJQv4NGAq4sDww2mqtfFBQELrUdwzCAWCyvbGJmmxpO+38BdMDdsaHvRfcSNnPS6oF0VL5kMKQ1+V3fLYHxioQd2zZkb2R4+yZXi2B4deLR5FS1FV90fDS/pBWh3ISMB7Khn84DPlVJRkl+Y/exOEvWEDkTy0rz/3TJr3yMTllfPxyeOMqS6hatBgBHUr89v2Y1MGiqoykXgEvD8PPoDLUGNBH9Jba2iXOrB4QoMsPOn9W7vZI5sQc//KevDi7onWSZhOCrQCQBkc1LMLbQvk06y/bMlvQvY40Bo+KI15VsjAKnXU5i7uQs7lEr4UY0nuAVBer4RbPWt3sfj8bSV9YkTSAzOnIPDTrUzPHwy+RdjZdy9XXS8TMLi6HXXf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZUbDNFUEZMMThNT0szekwxRDdFR1I5ZVBSS2ZFUnkxUmU3SWZUMWpIOEo2?=
 =?utf-8?B?ekhqUEM5UklxNGtyTnBXRk4wdTEvdERSVWozaGFFa1JsTFMvZ1MrWHo2UkRz?=
 =?utf-8?B?cTRlbEkyZmFNb2N4bStoQWFzVkpFRTE1aG9yNlFtTVl5RkJwWUFaRitqSzR4?=
 =?utf-8?B?UWRtQUNQdm8wdEx1VHBSZXZ3cEJPeEthYmV5OFV0ZVk1SWZmQ3VTOVFBSSs2?=
 =?utf-8?B?QzNwOHo0Lys2T2EvSDluWTlEZmVHdzA5UFZNWmpRUDgxTk5OdTZIdytQSnl0?=
 =?utf-8?B?MHdTV3IrQlJjRkxTajNLdUNpVVFEUys0Q0hMNGpZTXAxUkVRbmJEVEZZRklX?=
 =?utf-8?B?Q3NlYTd5VGpWQUVTalI4LzE2NHlPOHJmblg2TDBOZTRCVDNOTmFicHJZVFk4?=
 =?utf-8?B?N1JNb1hodm9ieDNJNm5IRTNqMmtYbS9zUFg2aktuWDhHb25Pc3l2ZisvZS9S?=
 =?utf-8?B?Z3UwNnM3azJBOHNXbWtOOFVWTnBMMUVFekp0aDlTNXBwT0o4YndwM2hkOE5Z?=
 =?utf-8?B?WTRha1FWY3RJUTBlaG9DaGx6bHA0a3I4MFJuL1ZsMTN6bG5URDIwclRTSTdK?=
 =?utf-8?B?RDRPeEFsRVJlUnhaRlVNaUd2N1VLc2NhVW1zSHdUZE9lNHNyVWcyRFJnenp6?=
 =?utf-8?B?Z21vYXhDakYrQTVmOHY5Y0Zlc3JvbEdaVHZkZWlGVjgxSWs1OGpJdjluVVFY?=
 =?utf-8?B?KzMrNWZUdkdXU3UyVDdlUUhIQzBtbEk4d0FFNURiTDJSUEcvYXBodmE3UDIx?=
 =?utf-8?B?eWphcUF6YjR2U1RMbE14ZjRxV0ZmVEdjVEU2Mk9DaEM4T1I2ZWwyS3JjcTVr?=
 =?utf-8?B?ZVR2RTQ2YzBRc082bmtSSUlrdVhXbmRHQVdNNURkc1loNjVteXhTTUVMZnZB?=
 =?utf-8?B?YVMvaEtCNXBtK0h4R3ExaC9kbFpZMHBjSWE0NFRpZkszMkQzTHJpTXJoQjVR?=
 =?utf-8?B?WGQ3UVdtby9NTHNxYURxMEoxYmJPTkE0Z0dSNk0vWmg5cjJLaGV5TEUyRnZT?=
 =?utf-8?B?OFBEM3kxUThicUEvSzI3Y3V3UW42dWcyY2x4eGtpS0c2Nkl5VnIwZjVLSldt?=
 =?utf-8?B?a2N3a3Z2Q05YSnNaV3dpMUw0akJRM01NWklCOTBxWG11NFNlTTV1dm81dFQz?=
 =?utf-8?B?VnhsUHBHWFBWcGs4TnYvSFJ4QnFmNEI5RlRoWDhvSlNTRDhFdExERWgxUEd0?=
 =?utf-8?B?ZEdnRjBBdHh6a2FuMlY4TWpCSTNaZXJoNVdmdCtkTWZ0STFHdnJ5RTBBUXhw?=
 =?utf-8?B?VnF2dVI3KzBtS2ZvK3VscEltSjJmU2ZmSjkzL25NTE1rSUtjQm9JQnNBZW5G?=
 =?utf-8?B?OHQxYStLcFE0bld5M3dmaEtGQ2xtSmQ0WFNnby9pbGR5UDAxVVZzdFUzVTNP?=
 =?utf-8?B?aGppU0FpUEV1aVZXUGVkTXhzYVpxY3FTSUdKSTdqSmJZRjJ1TXVRanhIMVhY?=
 =?utf-8?B?NHUzOUI1cWJ1K0N2eXZicUtmbDl6NGdadk16MStCdXpOSUZlR3ZFVHNHOGF2?=
 =?utf-8?B?ZFlQa0dDdmZteVNIK0F4TnZKZ2pyeFcrMC9FaHFMNjkyV2xlSWNTcEEwY2t3?=
 =?utf-8?B?UDV1SWFiR1FFcGdPR0hPUjV5WEQzb29xRmZKWC84MjJDa3RQUVlPcXFkOXlG?=
 =?utf-8?B?S2d4b1R1M1YranlDVkcrWXFNTnR4cEl3dVp4ZjFrRnRsWHpzVUJJYmhyZ3Iw?=
 =?utf-8?B?SjBjMXVkeWhSY1FpQjlkOUpWeEVKUUR0dlNUaGRrUlVtWjQwb3o1SkRmRDVs?=
 =?utf-8?B?dythQjBiaXdjZlFnMFc0RTFLc1Y5Vk1Iak04TE9wY0xQTHBPSnpOdXdlWkxj?=
 =?utf-8?B?Wjc1cXlqaVlxZ1FhNHZBM3F4WHBqNXk2aXN5YXEyUW8rNG5tTWFXTUlwWFpk?=
 =?utf-8?B?c0t1OGJlZXlkYThhZTZqTC8yV0ZTQjA1SXJiQzUydVpkbzEwUWVFUGJ5b3My?=
 =?utf-8?B?czZqR0dIZG5ULytYVDZzWFBCMEpLNDZLbnlDYncwUENNQzFZS3dJWnJucjFD?=
 =?utf-8?B?bFJnUGpsUTVuRi9KR0JhVG5pTFVtRzF1SUs1SE10bjBEK0YwU0Jaa2ZQZVFZ?=
 =?utf-8?B?L0FycHlTRElhZDhSQ2w3NVBNZXNJeUs2ajdkZTV2eFJCby9SSTlDQ0V3ZSt4?=
 =?utf-8?B?K0JsZ253SGQxMUVzVEVSRXNhL25ZVkJ5eW5VQUx0ckt3MzViQmIzTGllblVU?=
 =?utf-8?B?Z2UrbnZIc0tRRUo2NlZjbWdoemtwMlNaWjZBMmlKSkV3a29sQyt3aXNzdkJE?=
 =?utf-8?B?amJWRmp0MnBHeGE3c0VNVXV0Y1F4ZGZyS0ZlL2k3ekE2ZklnRG1oaEZHNWdi?=
 =?utf-8?Q?BZQ8xLFIJlzsRfaGul?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a963880-8c1c-436d-2268-08dee1a2cf7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:24:12.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeQTvqcjq5r1EEk5+QyHmoiqhxx3W+QWaSc+6Lvkdj5w2MobX66DjbBgKN+0Ahdx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67562-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:sspatil@android.com,m:afd@ti.com,m:srini@kernel.org,m:stable@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,google.com,collabora.com,arm.com,android.com,ti.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54525754876

On 7/14/26 13:46, Baineng Shou wrote:
> Several drivers call dma_buf_fd() — which internally calls fd_install()
> — before copy_to_user() returns the fd number to userspace.  If
> copy_to_user() fails, the fd is already published in the caller's fd
> table but the ioctl returns an error, so userspace never learns the fd
> number.  Worse, the window between fd_install() and copy_to_user()
> allows other threads to observe and manipulate the fd (dup, close,
> SCM_RIGHTS), making any "close it on the failure path" fix unsafe.
> 
> The fix is to split the allocation into three steps: reserve an fd with
> get_unused_fd_flags() (not yet visible to other threads), do
> copy_to_user(), and only then publish the fd with fd_install() via the
> new dma_buf_fd_install() helper.  On copy_to_user() failure,
> put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
> side effects.
> 
> Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
> fd_install() together with the DMA_BUF_TRACE call to preserve export
> tracing) and applies the fix to dma-heap.
> 
> Patch 2 applies the same fix to fastrpc, which even had a comment
> acknowledging the problem could not be fixed before.

drivers/gpu/drm/drm_prime.c is also using fd_install() of a DMA-buf file descriptor manually.

Would be nice if we could us the new dma_buf_fd_install() for tracing here as well.

Apart from that feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the whole series.

Regards,
Christian.

> 
> v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
> v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/
> 
> Changes in v3:
>  - Split into two patches (dma-heap + fastrpc separately)
>  - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
>    (spotted by T.J. Mercier and sashiko-bot on v2)
>  - Add fastrpc fix using the new helper (suggested by T.J. Mercier)
> 
> Baineng Shou (2):
>   dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
>   misc: fastrpc: don't publish fd before copy_to_user() succeeds
> 
>  drivers/dma-buf/dma-buf.c  | 20 ++++++++++
>  drivers/dma-buf/dma-heap.c | 80 +++++++++++++++++++-------------------
>  drivers/misc/fastrpc.c     | 16 +++-----
>  include/linux/dma-buf.h    |  1 +
>  4 files changed, 67 insertions(+), 50 deletions(-)
> 


