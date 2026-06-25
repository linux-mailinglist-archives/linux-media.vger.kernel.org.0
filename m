Return-Path: <linux-media+bounces-65635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /5CwM8gmPWrqxwgAu9opvQ
	(envelope-from <linux-media+bounces-65635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:02:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7886C5DCF
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ICJpzssW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65635-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65635-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5AF4304123B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 12:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A173E4C6D;
	Thu, 25 Jun 2026 12:58:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C73E4510;
	Thu, 25 Jun 2026 12:58:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392299; cv=fail; b=fXZEAPd9VrHKZeYzh5dJ6MiluFVNh98haZ0JfetoCm9cKfcr6Hw8K32BjH82Vfn5E3jAII1ZNDoMVFZJE+TYH+x1dtL8LgFD53zircssUK9s63CFoEnzf5ZRuFkCcuh4dwZzmZnu2bM+orJoke3viEzVaPrabTSxRDZh4joKCOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392299; c=relaxed/simple;
	bh=sU4pHWz6gz2Q6vOwjamBao8HdWRvRiEi0K+NYiIg7FU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PZ9zo22sM/wZKhYOFCmt/Yz+e/ul55cTO6nwf0B3VeoOPh5w+22kxK8eaKDYV5qA0ep8dALaY8sPxPE1qWl13PAfr1zFdB7WIyL0ewrWXoC/k7XTZhDKtZb1ggf7vtOyjpc5HVae7ZLbMO8GTKMC3pECCOe38mLR8k2kk6CA0mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ICJpzssW; arc=fail smtp.client-ip=52.101.43.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HK9kJSSSpGG7TDCZjl6iNC3/W4NdvKHQSXSt3IarXTU0mI7T0Np4zt1iVmleK7WaJ8o4dww8CpyXhpnKpYudq884F/4yEiGV6atT0zjdOFQzMNd9nDv3knKiygSKF+mEyaedsOJ+Go6NuWQjqvAu+PoZkvfeY8hS5cTaxcF3bilMKSiHc0WGc94par7s6FMiC4jwftMH/KlVH4IOSP5N3a5IM1MuQoozeMOk1VyKgSm4cDQZ17zbGpbSal53dOs+gKWVEaUE6Gk4qpNAwbwuzSF58+ripbDziuBruTK5cIjmvcREYCiGLlhfz1znhaBFX2UVdiOt6gRug1qbPwk0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uizVK4a1ukLloz8ocen0sOjHT0IbSw3jVdTC2OBwOLw=;
 b=i7jrI8IP1+2CuSLS+HhIJ7U6enGeWpT+plnWBEfeQT/7wSOU6421m7W0ouRgABCl6BPBfBwTJJtXzw9sr44/pQJK3M6crqrm2UECoC/GEx/MNFLLVaeG4SPlfkwu0+siovukgUxVF4Iaa+0ZSScagErRexZnH78TOOMDlbUZfC600IA0CB34Itn4Qv3DQ16qfQLJM9qwHcE4R8wQR3tmton3izw+LlnCg3lPcEkQ1WtW6IuLqhTM2ibPb++9lW4/1Oeoukg8oUERelNU3PvhSTiIjF7sUq/bieKNIA/iUnWNLU2iWgYzcXUItFVscdYaqbMlFUw2TVe/SxduupZceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uizVK4a1ukLloz8ocen0sOjHT0IbSw3jVdTC2OBwOLw=;
 b=ICJpzssWZadU6IynMfQeZ1Nwc5KQEpfBmN5E3BGu21gOci83tYsW8EZ3a0h4vriJdkqQH6qTGPxVFcm6SmtrMO3UcIZiE7AKZ6OZ7x/Lp/PjOYe4nptHdOnwfzAjoVZCSRnDwZwuV6/i96xubsco316+QR0PCAfLk3SdVkecFMk=
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by BL4PR12MB9477.namprd12.prod.outlook.com (2603:10b6:208:58d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 12:58:13 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%5]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 12:58:13 +0000
Message-ID: <91df07da-3938-4890-b120-e827873683b0@amd.com>
Date: Thu, 25 Jun 2026 14:58:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: udmabuf: make list limit unsigned
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260625085735.4488-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260625085735.4488-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|BL4PR12MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e62f9c-21ba-4aba-2595-08ded2b96a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xH+cuD/zLa7jGHPcrulcgSHsaO9oe0AzM9C8Mkk66koyXKxbtvNlGiylopMNPwwdOdzpd6AG68dduwO+yN7wCV0x1H2g64EKHmR7rpyFqmSX/PJU0+xDoUanCYpTZert711ubcEd/Gt0jgXBvWAgN0i8YYvJkE+ptlDV9oEFTfhkFl+X7j2xVfWtFmnnqh1epTeLVHbPde4V4cXUAijqNK2phrXWRu+DkD8gruQ29oV9c9yKac0g0NjSWhHZqHiAUZueVkTtcGQmg+fGw0KthZ/0qh08up11uuPvCb2WXSP82IUyxsdVugHoY+1s71MudwmpePUY4IgesPbDxNNPylRtCxjQL2p/xOZtdZeGSrgtrOTWYQA3ibadjf8g2t1poFzq8cbatkPhwJ+YdTC8XgxUjyOselBloWQomU9Upz2UuRJ1t7zn+hfRv+vvlnkLOKU1IDkx85S7vMyV9nHlR8PRUddqj1fONmOCnOAmbeWKdBphX4NY2EwRbjcXXltArnfgMCyaI74Df3Ry7IS7BPc+HGJN71zq0ZmVsLXYJtGhkwnOfY4w4u0HZANn9/1kYWO1tZVtS70q46425rXbnceRDiJoWnGDqxQN2WktQs/js7YFJH4SFI6LEe1DHXxMKy7BtRfq621jbPbG2bQFb8Xit8YCVzuswNzMGqEYhbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5673.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elUrV1Q4aER5cFpwVWUydTZ2OGFLODFoc0NUU1BUWEFPWnBTOVFZSzBvWWt4?=
 =?utf-8?B?UlNNTm5Fc2tjTmx0ZEViMDY5blc4NDl5OUFOeXZkL0htODlHMTFhOUI4MnJ6?=
 =?utf-8?B?K253ZzlhRFRuTDlheHNJQVRjL2JtQ3FZWkhaUDFGZlFCb0dSSWxWS0xrV015?=
 =?utf-8?B?dUJkdTJ1R1dmZ0xKaUdBNWl0bk5kNXVpYS9XOUI2WTBEUVB4Q2RtbC85ZEpa?=
 =?utf-8?B?d0hIUitOREhEd3NrK2swaHZsNEp1ZFJuWGRJUmlOY0xxdU53aSs1SGZNeXlQ?=
 =?utf-8?B?ZVozUzlCcDVaRVd3L1YrcDFDUVZSdHVqbHdESjhBOGx2QzRZTnZSQkxRYjRB?=
 =?utf-8?B?K3BtNDc5SXphb3AzOEZ2T1F1OElORGt2QVhJempheUlrYzBjOWF5ZmFCZzMw?=
 =?utf-8?B?SWpza2tiL1dYc2JzNE5paTZmK2ZvM3NNcTE0OEV0ZC9kWmZiTk9ObHk2V0lj?=
 =?utf-8?B?TmpmQm1WY3RmNXB0ZUx5c0JJd0Y5b0srVVRCQ2ZxeG8xU1pWVFVTeTgzbjhh?=
 =?utf-8?B?VTd5cVFmOU5EaFdRNFBYb2lRM2ptYWExVDFOcTZaclRJVlk0UTJNMlh2Yzdy?=
 =?utf-8?B?VTRGZnl1NzlIOTZQS0sybWtGdXptdlkrcmtHQ1ZYUkh3dlQ0bmE5N0hYcThj?=
 =?utf-8?B?V2VwdkkzTUc4TGJrWHVPTEFBKzdOanVPTmpuS0crNUFTWjh3dENqdU5CUmMv?=
 =?utf-8?B?Z1hNbnQvR0tPZDU0RGFPUWROak5xUmtLem4rOTJ2aXBKdGRxQnhiYXVadlRM?=
 =?utf-8?B?S1BleDlGUXB4UlB4MVNIdUg4cnpCN24rY0dpZVpVY2lNR0VpdVJENVpwR0Vw?=
 =?utf-8?B?aGNHN01rT0dMT0k0NjhtRmt5aG1VQzJQdWFNSmwzQUxFZXNBT1JjS1k5bDBP?=
 =?utf-8?B?R2NadWJiQ0t5Q0hDdHp4ZjhtTVVGR21VUHpoOVVYT0NOYkF4Qmo3U29QS0lu?=
 =?utf-8?B?cVFyZER1WkwxOGQzdk43UC9mVWx4Z3U5dVNuRXQycGtvVDBQSm4xb0lFQ3Yz?=
 =?utf-8?B?c1RkSkI3ZmZWZjJITHFSUkdsWUZJTzZJMzlyWXFjWElJYTJ1UnQ5KzQ1TDFx?=
 =?utf-8?B?RkRFbndDa0htTkFkVWJuU2NnWFpncG9wcVVuNlptSGl3OWFhWTRCVVhpNFg1?=
 =?utf-8?B?elBVVlRZRmhaZkdWc1ZlYm1Ja0RCRHUzUEdLdzc5QmhHRFpydnp4VXZ6b2Vl?=
 =?utf-8?B?aytkTHFjRGk1WnJtaGpQWXRid1BqUkVDM0Z6aXBYOHZOWUMyU2I2N1Fua3JX?=
 =?utf-8?B?eEl0WlFBblFqZFl1UFp4L0RXVkVFZTJaU2ZidFBaMTBCN2t4akY4V2NTQXMz?=
 =?utf-8?B?OFBuZzM0OXlnVzV1Q0QvN2ZMUHV4ZGwvZnNFSElBbytQbzNodkpPMk5oQjdu?=
 =?utf-8?B?SmgraVVHV0hTOTl4ajk3a29UZnFzRDF5elExZVJWV2JYaVBkUGxGV3BMZDk2?=
 =?utf-8?B?UVl5Yy9PTHl3NVdZajJkNXJ2YWFkaWY4V0c4a2UvZ29DR1ZKYlZoTWNZR2lJ?=
 =?utf-8?B?NkNwNGcya3JwckxWUFNZWENVSFdCS0tRU0FlT2xMQ09pbU1hbzhXR0taNkhu?=
 =?utf-8?B?d05BZENXWEJaOWY4TktwVlR4bFVFcUhuQUVxc0tLQ1RZcURZMitRZGFYVzVq?=
 =?utf-8?B?TFRJbUI3dU5XNjBTbzZIL0JKekhPK295Q25wVGJlYytHb3RQOW1rNHg3eVl6?=
 =?utf-8?B?aGQ2M0lqbk1QbHY2YjVZanpXTnl5L2xQeHhmV2ZTMXdHa3pMbnltczkwM1dR?=
 =?utf-8?B?VXdac0QxWDByQkp3YllXcUpzTk40QmdpaXkrNlN5d2E5aHNnanRydTZ2TWZC?=
 =?utf-8?B?ZUMzZ3R0eUxKMnJZeitRYkc0OEJleHZpU2xXN05aK1FOOC8rL3RZeFpwQVJ3?=
 =?utf-8?B?bEVOazM3bEsyZHh0WmdFUXUxUXpVVHBFNCtZTHJIL3JRN2tMVkRYVHBjYVdC?=
 =?utf-8?B?SXY0M1dtcWtxSU5ITnloMHRJTys5ekwyMlRTNEtWYXMzcC9OVENJbGFpOWJx?=
 =?utf-8?B?dE1JMnhzZWlxUXdON3ZaME50ZVNTT1RWc3lMSnBoUWVuVjVOS1NDMlgrbzBj?=
 =?utf-8?B?ZFdZL3dRdnMxOUVEcHZ5cWRxdVRXenp5bUNwMHVJcGlkZDhjV29BVGJrOG1a?=
 =?utf-8?B?REREUTR3RVIrL01nM0UrWjUxY1Z0d2pMQ2Q1VWc5Vmw1NzNlRmlDZE81VjZS?=
 =?utf-8?B?elowWjd4UWRpSG92N0JMQ2UxeUpLcVU2TkVTWmFON28yeERNcTBBd3NxMTRw?=
 =?utf-8?B?RXl2RGRpaXEzMEFNY3VlZ3FhOUxoRWlLY29PZU1tZFdNV09WVHZRN1p0Uk1Y?=
 =?utf-8?Q?6oh8jGibsa8tr6onXu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e62f9c-21ba-4aba-2595-08ded2b96a5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:58:13.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Du2t1hq7L+W/fbqqRK232Dy4Hy26wKmTm8Q6xTEjVyQXX7/TbXm70cQO8nOcTiQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9477
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65635-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,intel.com,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF7886C5DCF

On 6/25/26 10:57, Yousef Alhouseen wrote:
> UDMABUF_CREATE_LIST uses list_limit only as an upper bound for the
> unsigned entry count supplied by userspace. Negative values have no
> useful meaning and complicate the bounds check.
> 
> Make the module parameter unsigned and keep the checked array copy so
> large counts cannot wrap the allocation size before udmabuf_create()
> walks the copied list.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>

Looks good to me, but somebody more familiar with udmabuf should probably take another look.

Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/dma-buf/udmabuf.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index b4078ec84..620113df3 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -16,8 +16,8 @@
>  #include <linux/vmalloc.h>
>  #include <linux/iosys-map.h>
>  
> -static int list_limit = 1024;
> -module_param(list_limit, int, 0644);
> +static uint list_limit = 1024;
> +module_param(list_limit, uint, 0644);
>  MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
>  
>  static int size_limit_mb = 64;
> @@ -469,12 +469,10 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
>  	struct udmabuf_create_list head;
>  	struct udmabuf_create_item *list;
>  	int ret = -EINVAL;
> -	int limit;
>  
>  	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>  		return -EFAULT;
> -	limit = READ_ONCE(list_limit);
> -	if (!head.count || limit <= 0 || head.count > limit)
> +	if (!head.count || head.count > READ_ONCE(list_limit))
>  		return -EINVAL;
>  	list = memdup_array_user((void __user *)(arg + sizeof(head)),
>  				 head.count, sizeof(*list));


