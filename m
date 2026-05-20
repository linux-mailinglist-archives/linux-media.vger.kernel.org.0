Return-Path: <linux-media+bounces-62241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEp0MqCUDWoMzwUAu9opvQ
	(envelope-from <linux-media+bounces-62241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:01:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2A58C0AA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD058301A3AE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF0C3DA5C3;
	Wed, 20 May 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N/VSuZot"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98A3D9DD8;
	Wed, 20 May 2026 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274882; cv=fail; b=KGigUa4EC16/6+KGqOULqgx+DOCDSQYmHTMRi11hr3Rc23xa7Ra3OwBGINejyjDa/I3ukovdVTqQrvrxpEaB5z8MrYHh7rxwPjdlIcJbo9wu5l9Cu7McDBt4p54RTRfAIAh1kVFE/nEoAqQl/kIX46qSgC8XwIwWsk8Q/sDrY3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274882; c=relaxed/simple;
	bh=To5SbltWPSWotVdsIyLajQDbV58ZX9+45f6UWHL9ajI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qk3+zzaZth5lN3jxRuck43P5wjXIlU76C3nEVB4hTURpU/CPMkj5t9VSFyR9V4jeaABKgFce/LttEXCKq8OI9F/jBZ+LWGkUOLl0fMG7+3bIdwZn9LikCWZ2tp1IeO6ePg0swm6ilWZqQa0ETJg1Tc0RtQ5mAN/Ghp4sQv3JHlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N/VSuZot; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk54t6ZZQ+h6g+icAlCGilAwl2GtejVizwlpfwQgcm6EyfyRXp4bqcRZCrUxrKXh+6GD16l3n32nlI0WHnmtjzOSZSUkjteRWrOquVapd5XUbzN+RhDLzduN1VlPgFstkoQ17v7HDzL5It63voLIJWEet4Rfy+ThKPXidKl6AvfLbdCh+3ulnFSLawThQqE8Hsa5lZVR/s7U0sedTCQxy00eZuMEvMySSiRTyWq08ajlKScKFJR6PHQzHbkv++fBnbbqCu4qj9jOHsx+9l5g9FukdjHXJY7TBhz20N0hapOXoSym4muKGRG+2ulvV5xouGj3AEtOHc6/4oCAh7tJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE9syY8pECyheGWS6oDJjf+otkW4VIL4d5jEgVMVBMA=;
 b=m+bJsD7+hIyQ9lkThbaMHN8m8NRYmRj4c2bruYZ0MvHRgJBmS4FjFNtT+Kj1eXGsa0RjLFo1FpRL91OcrTzYLVpXyF8nVf895UpExGURMELUjVZiaIeoKS3x0jsU3xfAH2yvmMfHmvFQELH5VH+Gz9Od9M7SRg8ltRATJhmjtMYyncJAAp7UzqSD1olxwVCilN7E72cID4zh+zCcZJRq0X+AOAcGkoEg7r/VscF+q/SShzz9xyhlPnq5GHITOpt1Yo7sPP20k+QfEZUKIuoVHZgqmRbmjwyoCc5HnovqDuyOMgik8568Mv60SqbvJlFLXj1b3FPxjhNF9LJSncS1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE9syY8pECyheGWS6oDJjf+otkW4VIL4d5jEgVMVBMA=;
 b=N/VSuZotZzbjfzX2neiLKp47z5nf5QcgoAqSyV/z4B5wU6Zmp8/eB7eNBYsMczrbriyvd2FVFD2kGht4B9TxWKoX/yExmBGyeYIWyDkScoBZq/4o6tx5LlpFW8TlsT9AbyST9uUCpsB58nAHBEq6K5t53sxSwf9dPrErS3JDNnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8441.namprd12.prod.outlook.com (2603:10b6:8:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Wed, 20 May
 2026 11:01:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:01:16 +0000
Message-ID: <5970c2a0-365d-4cef-97af-644159ea2779@amd.com>
Date: Wed, 20 May 2026 13:01:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: fix recursive ww_mutex acquire in
 amdgpu_devcoredump_format
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
 <20260519161541.19994-1-mikhail.v.gavrilov@gmail.com>
 <45bbcc75-f852-46c2-bcff-8cacb9413376@amd.com>
 <CABXGCsPRY+jk_ArYMOXqNTw31W95FBgNzqFq0_pvi3paYR=KDQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsPRY+jk_ArYMOXqNTw31W95FBgNzqFq0_pvi3paYR=KDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:208:23d::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d376aa3-eb9f-45b3-e4bc-08deb65f1d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|11063799006|4143699003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	86CI8u23YSr+bBkCaUBeBtX3f80NQgOpFoKs8DcrkwwHTG05JnhWZmX6lSMOSX8OWJ1z1z/gVKLkRS0ImZFq3zPMVVtYphuFOJBMugmkUnEEhM8jQD6BVXWpkxU18sKByhKKyARwQQgENM9X1qgySSKyAoGs1kStzUkQtVdXWm1139/8l10QIVhwQJ0ZnJ2R/GO30yK67jPvegXc4R3nSti1YctniHK7LpWBYMCjx0GA0vaqe5sh0ksoZDAKPbOtUy6sJno20Mtxiy58CoIKnvC34vHqRWAgyXLYtNN3tQeaXggiC/+atTnFljs+08MgIjg2XbwcUxd7qOtaMhhXD7nPMMbK6bk4dSm1FzAImXzBEcJZWZ9ciPPrsC0dFgjuYf16q/sZ12vt3JDiQ2mQzqJBqLvp0INE4UZnVoXSzx0gKf1rQrDdyaH8tSQ0m8Po8eTlWLZYdmIvlFQUzC+caqOWmiNtW0lpZ5hjHxhTqh97ZQp3JLXYsHbaut7Z6uiAKkdIKWvnvoLVvMpap7XuogGIbIQzjkryItFBxWCe39oHCJBL84Nhc6/eSTEIXAQCn69Kg2Rgzyp+5MmibPYf8hcNOw4h16Lu0rtBsV8/RPPsMWSbdeDp9+KWFxBXdk/8JYcmdtw1WsxwHPa1rnbWDe1CI0pkCuVTWaUjU8WC7FPWt8AEPzvfbuP2gZoDK42B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(11063799006)(4143699003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBOSG90YlNrcDkveGJ2VFR0UWlaWTExTUxpR3Z4OXdhaTd5enVFNzZDTmJr?=
 =?utf-8?B?c2JnWlcwWGF1L25KdU9jajBFUkFBNHlQd0tlOVd5THZKcTF2RUtzTmRIejQr?=
 =?utf-8?B?VFZvNERDVElVWXM5cjR3UnY2aWdUY2tmc3dpSUY5NDc2RGk4YUdEN3pWSG5z?=
 =?utf-8?B?WmpERk16eUtEdDJuSG1jcXJyMlY5T2s4VnZCbzZTalpqRGZyZ3BUSzJ6YWZu?=
 =?utf-8?B?Y3lHaml4MUwreVlKTnpRbkREbFlkeTVubE5uTGFoTjZSQlJ6S2IrUTNRczZm?=
 =?utf-8?B?U0hyc0xhN1k2elo3WTVaSVFRdHRTdkRKbldqdlR2NDJDaEc2QWdxazUxS3dG?=
 =?utf-8?B?MEdGQlpRN1FqTHcwS1hVcVE0SkZjUDhUbjcwdEJSSnJCakRQUTBYSDVlL3pO?=
 =?utf-8?B?RzQvL0ZTWG42aGgwQnhvZWpXZjRLSVRvYmZvOFFJRmRJSlI4NzFock1ITXZh?=
 =?utf-8?B?aUNaYmJDUmRFZ3hGQzE2MERvTHIrYklYRVpqS2tmTGFKNzd0blA0VWl3SHVJ?=
 =?utf-8?B?K2hVOWlZZHN2RHpuUVhxQ20rZ09HZVZsMlVETXRGSC9xU0NIV2w3Umdja05M?=
 =?utf-8?B?TFJ1Vkx2Rmh4akR4QjllM2lCenkvcnJYeEI3dE1uaW1HUUU0QSt5a01XbktB?=
 =?utf-8?B?WEJFMGJhNjUxL2VHWEtFYkptZk9MOFJDTUVWNTdCWTZFdC94aUFhRXlpd05Q?=
 =?utf-8?B?dDN0Z3p2OHNuMnIzRnhMNHU5OVozVFM5ZVQyVnFBdC9aOVZUeTcvZDJsV1R6?=
 =?utf-8?B?UHM5UndsSDlGd3VuTm5FdlNpQlJ5Y3c2UnNNNU5yZjV0cnN1aVNubk9INTJY?=
 =?utf-8?B?L3F2UkU5d1FNWndYOEcxd1h5elhYT0dBUUkxVDMwaXVwTWdMQVF5eDVRNFZv?=
 =?utf-8?B?RXZpeDNlTUtkcFRLbWhMYk84SDhIWnhOU0VaN1BnREJCTjU2TFJKbXNxbUN1?=
 =?utf-8?B?YXh5dU9UWXhtWkN3WmpYbjBMVlpDMHlpMy9xYk9ZWThmMmQvdWRUT21QUUZ4?=
 =?utf-8?B?UURsc3NTK3p2Nk9MQjNTTjNCTGY3N1NRTi8wOXpMdUNjcjZwSURaVFdKUElv?=
 =?utf-8?B?NzZvZGY5czVVTVllTU4zYndUU0NEeDA1S3N4TFFGbDQrL1c5S3R5YkpvZFNJ?=
 =?utf-8?B?NlRRODB0dFpxMURMZXlQUHZ0eXIrTVN0Wm5yb3BVbUhoVHZ5VFhNNEpQdkNP?=
 =?utf-8?B?MkZIZytubzR2QjcydFpoZzc3SGVkbkF5MDRUOXVqUmc3S2l0RkZTNjFUcnU4?=
 =?utf-8?B?VXE1SlQrZmhqTWdEajkzZnhHT3FrUmM1Zmx4S1BTRHR3bEpTWVNLNGQ1cVhJ?=
 =?utf-8?B?QS9wbTlNYy8ybHpGUGdvdzJyQVFGRnpMTGRtKzNYTmVKN2UrZEhJQUtCS3FE?=
 =?utf-8?B?V29vSllSeGVrZGkvS2NHZmluUTZva1ltcnVzSk10MVhuckRtL1B4VHBONEtN?=
 =?utf-8?B?ZnJoNDNDOVNxN1dCcm9MM2Q5NngyamtoczlSaXVaY1FKMjFhcjlyVDFDNFdp?=
 =?utf-8?B?ZjV2YWQvSDdwK0VRUUtOZkJJZ0NIczVOOWIrNEEyaVkvdzc0Q1hMYjU0WTlL?=
 =?utf-8?B?QkhtLytBMDlseVNmdXgvUTBITWtPTXE5a3I2MlR5UUlQUzVqS0d1dzJKTFVp?=
 =?utf-8?B?OG5rUCtvZmJzcFBYNXhHR21yczZIdXJ6SU9BUk9JWk40L3BiUktSTW1YUmpJ?=
 =?utf-8?B?N2pEMlRCZHJwUWF4L0tJRlVaY3ZnREtSaTlNK0w3dVFlUjB1a0FwajBuVHdz?=
 =?utf-8?B?c3l2YkxVQzloZktiVE05NzZrTzh6bkxWZDQ3MmhLdEJFZ1JOdWp0M3ZDK0s4?=
 =?utf-8?B?YnpXbGg3RkEyS2o4VUY4ZXJxRXQvUUtUQlJaZzhFNHJIbHl1L2RLd2p4dUlN?=
 =?utf-8?B?eXdiNTVESjMwdUxzOEppeHlMdFkyNTJwTktvSiswaGtmRjNGek5DamJ0c2cx?=
 =?utf-8?B?WEhzNVBsOGN1UGdzK3FCUXBSU05hVEpjY1NWWjJPVCtUam5mbHlnQW5Ud1o2?=
 =?utf-8?B?bFV4ZHRSQW04cVhGSFhWbWhaTHN1OFpVZW5XYXFQTGgrUzlkaW9WZ3Y2cUYw?=
 =?utf-8?B?eHVYK1I3N1FuSFNJR1VxZ2t2S1hwaC9ralBIbW1oYXZMa0lhNWRrWWZQNGtP?=
 =?utf-8?B?eDAzR3l4QjNSZTVTOHYvdW83bklucnN1SXF5Z3pWeTFZeVJlZnpLTjZWa3ZF?=
 =?utf-8?B?S0xzaVczVnNxL3AraUV1ZHVJQnE0Q0N4L2h6R0RlcEtpN3JqN1ZCUjZQUjE3?=
 =?utf-8?B?ZWNvYXBoblhTS04zVmQ5MzVZSnNpcjVFaVZxQWUxL2RIT245V28zRm9MWTNn?=
 =?utf-8?Q?pc2oyFlFyr/ygGkzmJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d376aa3-eb9f-45b3-e4bc-08deb65f1d5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:01:16.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZuIYcAcYD4MTrRrHawjK9+n3Zbxf2Zpmn2u6k9gg8d8xGPNTuCxBA/UrQ90vnEM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8441
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62241-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,amd.com,gmail.com,ffwll.ch,linaro.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 25F2A58C0AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 10:07, Mikhail Gavrilov wrote:
> On Wed, May 20, 2026 at 12:08 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> That whole infrastructure is superflous. You just need to modify amdgpu_vm_lock_by_pasid() to take a drm_exec object to lock the root BO.
>>
> 
> Christian, modifying amdgpu_vm_lock_by_pasid() to take a drm_exec turns
> out to also require converting its other caller, amdgpu_vm_handle_fault(),
> to drm_exec — most of the diff is that conversion, not the helper itself.
> 
> I can:
>  (a) convert both in a 2-patch series (handle_fault becomes
>      drm_exec_init + drm_exec_until_all_locked + drm_exec_fini, ~30 lines),
>      or
>  (b) keep the loop inside amdgpu_vm_lock_by_pasid() so handle_fault stays
>      a one-liner — but then the devcoredump caller can't add the IB BOs
>      to the same ticket, which is the whole point.
> 
> (a) seems unavoidable if we want one helper. Is that what you had in mind,
> or did you intend something lighter — e.g. a separate
> amdgpu_vm_lock_by_pasid_exec() leaving handle_fault untouched?
> 

Just make that two patches, first switching over amdgpu_vm_lock_by_pasid() to using drm_exec() on both use cases.

And then changing the one for device core dumping to lock all BOs at once.

Thanks,
Christian.

