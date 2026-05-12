Return-Path: <linux-media+bounces-61203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NvSL2/BAmpZwQEAu9opvQ
	(envelope-from <linux-media+bounces-61203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 07:58:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7651A8B8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 07:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36DBB302A7C3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 05:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E7A3CE48F;
	Tue, 12 May 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LmuKFtFA"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E9D3D34BF;
	Tue, 12 May 2026 05:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565042; cv=fail; b=X11uDIacpuKstRXLso0dJMyV63T3uIzSykrp60Cal6F1D2bXU2Lix3nQQQoY2GD2QrmRhBJ3npT7kiXEhTZK+VXupQVGxrSgje+XL1dH3fdObNJALEfYGXKnGXNJlUaCPT9OOu540Ivxm+CEUvtMAqUh3DLY/8g3/n57zN3LOzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565042; c=relaxed/simple;
	bh=Hbo6O7ZB3ErYbZpy/v6FSDttyrv80O44vnBS0HX+1x8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j4xICBDBcaX8vFUO6QUZ5fDxC1hQnZwo8v39wWbiMVS9LpQ503A6kRWlmkLLof3QbNgzSqFEDbyRPiOgGlOP4D5pDXnO+/VGj/NXfyqfJqtaPcr58WdJsELzFeqTTK4jbRUbJvkTplSr/DpXLQdnnSBtIIzbFbI/lUcHC1hMEY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LmuKFtFA; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2KyEKDXYWyHQCHSTZkTT9lHZkIMDr5iFjPq2aXeAL4RXGHcFIWGXTguDV8q1P0bY3Sf8NC5eq2NFwOiI/n+1XOlpFh117RZH1IMzQpPhIVXCsEuHiWp7+vPjXDCsm/lExjSYZIt6pJcng24MmivXLdq1/c8b+k93U6Q6rF6Ie7YY7lIID2Llg0CEt4kEND7IzqUGw6EtEu3+EwpmsDKgVfODvSnrrExDcpHK3OOBuXWMQNbRTsomXo5ndpMAgAv5BU5wAhl8w5vWM5iQIIkSV9KQSG6TSt1AVu/gw+3lA/8Y49J74i1JVXpZTU+lLlTUi+5HdMVdFtYpioJ0dwAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsjROagNmhoz/nHaTg8RwHfPpFTQtf9U+c4cylqsH10=;
 b=SGmf2qk2YLBy9zt4gAFjJcw3Tqu2vFCdwaQtngs+5docsNWaIsCwyVYnEJi6Op9oyqRkIO9SwYD13mKJUKOLNRXlfiAghFSS13xeOvL0u55lCe9C+cl4fIaY8gEsHsODgnCEaWMzyBS00kB8CawRW7/MkvmKlZnGtHvJ1tghWRy+B+OAbYexh5zy9J7zRNnoHv936OtOROQdmVx06xKuY4E6LTL7PhGqI4fCIcVFQ1U7DMZq5liWfhnIpB880+pMBLYnFBDWBtoBJ6VrMhYcQ0tV1peUC5pDePtoj4P9LlEiPoXbogJoxOpH9QpZsKz1b4zkqjrj3lxEFptWPThJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsjROagNmhoz/nHaTg8RwHfPpFTQtf9U+c4cylqsH10=;
 b=LmuKFtFAAbtDRYW+y+wy+iDuP0OLjxb0xHYLwPllPA8u8/BXVrqvqzm2Lf29lF4AJ2fCUrzbEQo6sttFptNrhsKPrF1Q0ZW/baHvnizwv1HUq2Q2W7XxO8uPtSOzQaCFnH2K/41GHVMGSbP+fOgii8B1jqGSxVaAl4bFf9DHSCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by DS0PR12MB9399.namprd12.prod.outlook.com (2603:10b6:8:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 05:50:07 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 05:50:07 +0000
Message-ID: <651ddf59-68e2-482e-a7ba-c238a626e1ba@amd.com>
Date: Tue, 12 May 2026 15:49:51 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 04/12] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
 <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com> <afs/Jamxnj6GGFfM@nvidia.com>
 <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
 <c166f41e-d983-4a22-95d1-c485a82d1d06@amd.com>
 <20260511235617.GG1116784@nvidia.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <20260511235617.GG1116784@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0032.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::11) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|DS0PR12MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 0601bc2a-f33f-4d3b-cbcb-08deafea51e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CWcuea6dcL5I1WGgrAOfMpG5Te4KXC8RSruq9HAYpv4vJErp6gMOcGad7viTOz0L1pJz8MBHooZ+220rW3hBl22gcpYxP5jxePCfsN8XiTSUiNtvncO0fL1h/s9hhdrC8529ELBZvgUfjwvQBfaJnb/AsDdrR1JbEk3FKFs16jyPsxC39ZtDusKF1PZ9oDFMI59I7VZbyP4luftvcoTUdoV75ZCnoJpb0j+y+5YOBYtxnLQ7Ppe4vD9VPm8B92Cp3LwVk0K5Lcd4Tzq33tQkrHGKGH2JJhzLANlO4ZLyEdEUynVa1tlsLgBd77JJegZCmg18zg3E4dbcnZvU/TbTGE3c2Xo+mnO7x5gs1coU64zIikkVfLXDukmHgcvhRTQj8Bm58YlgHncPihvqQuhdz4LqChW+k2AcKmUMCesJkjjD2w+Zcfx2RMwAhcmlJFbPlNsOZSHSkLBhP+vnQBR0EzvL/QvM/ELHPsj3C3RWtxUjGs7fqwCWtdSb59RawslFbd0aykwYMRHz5en8MGq9pn2eU8BFTSg7biNN0PnGcxiDPjIt8TnnBCiHmXpW3jAL4vXScAnjw97vAU/SZppnKuecKKPzBkwo4dkT7K7ztp8kyrVl2vUGueTZPs6AJbONs4Hywv0EYC5Ik0FEmSFe6Qz+D4WRTH5IaLdXim2RbcI6iSsBSZ2G43vpet4MNl54
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXNYV0JVeWdidTIwMzBVaERjVVRNTFF4S0JFSlM0aWIvTk8vUklUOGwxckZS?=
 =?utf-8?B?YnRreWdTQXJjVDViajJaMVV4V0lsQ2djc3hvVlVxRWJoUnJXdjdBekxvSVNi?=
 =?utf-8?B?VnpxMDltNzVsMitURitPNWFlNGJWOElFaUgwQ1hBMk5TVHQyeVdWWTNWeG9V?=
 =?utf-8?B?VUM3WGVuUVphaU41bzNDbERuR2dNMGpkR2EvaVhpSlhEOVNPKzdBN3J3YSs0?=
 =?utf-8?B?UDFWMlhvQW5Sa01UeDRjV1ZiS1UyU2VSU2Vzdit5NEVxNExVTERMSVAya2JR?=
 =?utf-8?B?Q283WkpKdHJIeGNMM041dkRkY0RHaGpzYWlwS0NpbldPUnZmdlIvNFg2QzBJ?=
 =?utf-8?B?cjdkSk5pOGVNMUI4K25ZMHlyYUFnZ3N4MGp5OEl6aFQxbFpqa1l1dnByeFVF?=
 =?utf-8?B?RGZjNzVhcTE0dVF6SFNTRi95NVFMampxbE51NWRyd3hjWk5wakRqOWZrbnM1?=
 =?utf-8?B?R0pQd094U1MxbDJYR0xvVG9zR28wMUxqRW9NVTZBNkVHTHJkZmlZQS9PaEtL?=
 =?utf-8?B?b3Q4S0JaVmZlb3o4RHFTWTI4b2xzQXh0bWxyOFlKYzRmZFlMbHlYVFM1QU5u?=
 =?utf-8?B?TkszbitpMGh6bzdOV0crVEJLU0ZiZDN6UFZuVFAwcFVyeTBtR2dFWlAvUi9M?=
 =?utf-8?B?c25sZWx6bDBabTRBb1dwZXh1K1U3QmU3NHpDZzNEQWhoSS8vU3cxZFZWOGRR?=
 =?utf-8?B?SnJRWnZmS1Zwc1kxR2RCa1JaYlF6cmNaYzg3MldJY09lV0h4MEhEU2tGTndV?=
 =?utf-8?B?U3hScnVWZG9lQWNQWTBJY2d3U3pNc2thZ1RSTWtTQ1dESzBOZU1Day93bUha?=
 =?utf-8?B?ZFI1RVd2SmFKOE00NkJMMDc3TlhrcVBoLzBEWmdTdTdkVGQ4N1IwbHRQYis4?=
 =?utf-8?B?YWo0Tk0rSE13MTR1RWl6RityUk1wc3lFRW9oMktsSmY1VU01S2dFL01tQXFX?=
 =?utf-8?B?M0FvQ2pmeEdxVkF1L2grWlR2MHJHenVJVFA0akNqS3hSYitTdFRzQkNRY0pN?=
 =?utf-8?B?WGx1TEx4M0Q2LzJZbVZjaUNOQkMvSk5KcVNXR0hQYWg2UFBnaXVMd0ZSMWF1?=
 =?utf-8?B?N0I1YkxFdE5sQysvQWNhVjVmN3hkVnNlcm1OMWMvcmpYbGJpSWtHbzdVOGRG?=
 =?utf-8?B?aHp5Tmp5QzNuTE5WVmw3M2t3b0xFTjVMc1J6dVZETVdaK2hxdzhlY1V2QzQx?=
 =?utf-8?B?c0RpdGU2dXl0dkN4aDhLV2hER3ZMcVBONzZ0U2dMZDlJQTBvSGdaSm8zZFZY?=
 =?utf-8?B?YUlNVWsyY3BTS21sakdoQ0dQUXVycFdzbi83dHpMTEJ4ZjJtYjJWM1cwTXlY?=
 =?utf-8?B?N0ZTLzZuZkRaY3ZXRGplZEh6WW9BbFhqcEZ6OS9KQ2sva1ZkWlhsdTlQWHhG?=
 =?utf-8?B?MlQ4WWl1dEZNUnR4L0RUZGgwNklaSTR1Q1BjVnhPUWszRUxNOGk1TWhSYjBa?=
 =?utf-8?B?TWQ3eElHS04ySGxXM1lOcUtRQ0pSZmVFbUo1cFBxNnA1VUpGL3pOMmo3LzJa?=
 =?utf-8?B?UFlzMjE5em9HS2ZPdVY2VUJiYjV0UGZEOTRteFRFY3lxS0x6b00rdWpnTkZ1?=
 =?utf-8?B?UFo3UUJuOTRlMWd3M01kbndueFd1VHpIZ1VXdm9LMWJGNlJad1JlbHJoejZG?=
 =?utf-8?B?K044UFpFQkhjb0dGZHE4bU5uZEQ1bnV0NDdsTm85TEtsQ0Y4aEhTbVpRVHpt?=
 =?utf-8?B?cGpJVnR2TjliVTdHT3E5TlNLaHNwdlFtSlNjdFBzUVM4QVYyYVpYVXlDc284?=
 =?utf-8?B?R0FvbEdwWjgrMXdGa0NyZ2lqZWlVc0VuUFloWnNkcWxlQzlSeHFHK1BrYUxT?=
 =?utf-8?B?N1BkRnJPWTE5NlFnM1Z3b2lBb3RKcVVtUWRnR0lFemxyNW1rM2tRV0R5dURj?=
 =?utf-8?B?Yk55blhnQXBVcTJ2M0drOVNMaWl4ZnU0Sll0L1Z2ek4wNDZ2Mmx1eXFVT3NK?=
 =?utf-8?B?aDVxZEFkL2U1WUhDZ0xEaHdSU3dNU0xZZ2VkK1I1dmpoa3V0Z2p3YW9KbzJZ?=
 =?utf-8?B?U1ErZDczd2UzUE53V0JWalg3V3FILyt5YktnbDRVclFWeEhoZUpTbHB5RllY?=
 =?utf-8?B?YjRRTUFQY0V1OE5KTnZUVUo3bW1qL2dwVkN5eFQydlo1TE9MUCtoR0dPaVpJ?=
 =?utf-8?B?SUZsVWcyckVwa2dZRHVFOWRSYktoa1Qzbm9EM0FYS0xjNzFiUWdCN2FjaTli?=
 =?utf-8?B?KzlxNzdKR080NzlPRHJDS2dSSkFXRVRaSHlTRUNHcU0rUGhTaWlGUjdKeUYv?=
 =?utf-8?B?Q3JXSmxjbkJqNjJGREdmb2JWVUVKTXFFaTk0M0drcUZhS1I4bE9YenBSa0tk?=
 =?utf-8?B?SFNVU2pGeFZNU1g3Skg1dHVDSU84U3lFeE0rdEMzNUVTYTlPamE2UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0601bc2a-f33f-4d3b-cbcb-08deafea51e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 05:50:06.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ElqT7MWuHOavtLHI7JYNcsB3Qjg/dxMT8Og1bmQ/L65To5IjL8zBUlM5PkfJAlBC9XdNvxujJ9rAZhqkt7LQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9399
X-Rspamd-Queue-Id: 66B7651A8B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61203-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aik@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On 12/5/26 09:56, Jason Gunthorpe wrote:
> On Tue, May 12, 2026 at 09:42:01AM +1000, Alexey Kardashevskiy wrote:
> 
>>> true but either way dmabuf slicing will be directed by QEMU's msix-table
>>> emulation MR and this slicing needs to match the TDISP report so I'll
>>> have to teach QEMU these reports, right?
>>
>> Or TDISP devices are going to align MSIX BARs to 4K, and QEMU will
>> do the same and it should "just work", and if it does not - the host
>> won't crash. Can this work? Thanks,
> 
> Host crashing stuff is a different issue, I think the plan was to
> revoke the entire MMIO space from userspace and remove it from the
> kernel mapping. Entire because we don't want to parse the TDISP report
> to figure out something more narrow.
> 
> Therefore there is no way the host can crash.

Ah ok.

> When qemu constructs the VM memory map it already has a scheme to
> insert a hole for a SW emulated page for MSI. That will keep working
> exactly as it is.
>
> When the VM validates the MMIO the hole has to fall within a T=0 space
> of the TDISP report or the VM will reject it.
> 
> This means devices need to have a T=0 hole around their MSI-X/etc
> suitable for a 64K page size OS.

Since we are ditching mappings, the entire MSIX-containing 64K block will be ioctl()ed instead of directly accessed from QEMU via mmap (which is slower the VM direct access but still)?

> This is already the case, if a device mixes MSIx with other things
> qemu will work but it becomes horribly slow and a little broken.

Really only when MSIX is not system page size aligned but yeah, I had enough of that with PPC. Thanks,

> 
> Jason

-- 
Alexey


