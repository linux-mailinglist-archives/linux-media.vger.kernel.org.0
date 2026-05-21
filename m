Return-Path: <linux-media+bounces-62469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAe3Km39DmrrDwYAu9opvQ
	(envelope-from <linux-media+bounces-62469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:41:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF05A4F9A
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04D6C3058D62
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038CE3D5C3E;
	Thu, 21 May 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SQskeNd7"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D288B3B83E8;
	Thu, 21 May 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367158; cv=fail; b=mbNeDsroTWnWubZalkX+mDYQwDpdXJqzSTrcgL66wV99L4ZtfG2s4oPF9FULFjVMu51Z05rgXP9pzCD3YERMmW5XDr0nqXEYTCGitbQi3Vbr2aevFr58KV8Otz83Xy+L+0ascKHP37kObHW+H5BilXyo+QeIl9cSZv60Emy3vFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367158; c=relaxed/simple;
	bh=hX3LwWoaOS0mVUaLa17An+IGekzNB7EH+vMNaQE1tTE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nWPiu4m2G4cKWbtE3/RtAPUPcjS9uQlB4MZscQ8L6ntnpVAayBVPyV9NOY2AqOw22LpVQhN7T2bEan8tBEcZUL7Mvo5Or1/iH+DpWCqhpjfkjlyVrKtJ5oDxcq2OpeTLb2sJAx19cLHwQ6L5u7a5fzX/DYfBql0nPB4evC5rin0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SQskeNd7; arc=fail smtp.client-ip=40.107.209.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6t5vPrYXpJF/lM74EyuvK8p5cSb64qMDb7rM1h+yOPA8OqE7nXOTmT9TajfZA1d4SrU7U3t1BlUePMmUfWfKqMJIzxOG+Ju0fwusVeFUTXO/xcBLhwubPL+s/GCATHoTcbe/8D0u27J+z2aKmnFuQI37MJEmHgPxA33bpghTWQ2/AqVh1TotDmRMBjMPsPPNwoByQF/vnbWREgsIFUh72G4wtkkZuNy5w3dR0O5Sfi+iHLKCwG+GZjvbPpRpshXnV2OSjwDIyJ1d5uwx0akyWmo9trRYJ5kAGZfA71wdrkK6oVeUT+xPpkAVa02WzYBCdN38MR10L/W84+9GZ0wOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB7DG/Qoe6AxYIXu8MQKx/ll6syNJYZzRyJc7mjTS50=;
 b=PS3HYZXYJJZ3rw58oKN4Noew1bcWmQqVRHdnivUFtS8ZGs6frN6bGGRvr09ydmkZFvdJ5e6sGsoG062amivMH58e2pxOUSftPh9Dat0R48S9XBQwV51TrbNxjCiJ87PDl/Ga82c+hzxt/dFXW/XXFcGGEP3Vq7SndnfPk03cnsagh1Dy+TtcFdHJuAbHDH8qbXDbs3FC0+qvPDvCUUmAzmQ4br5tAXJKlAsQdHWjqxQ3nrpJqIBKe/+IOM/VVOxrW1WTNutI9nzlJDOG8vR3LjraCIpuNLWCJkR75bnkKDjZA8rDA2JnX9v3lMPU/feE/JAOT2h+fOLLMvtDm2jDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB7DG/Qoe6AxYIXu8MQKx/ll6syNJYZzRyJc7mjTS50=;
 b=SQskeNd7kr1W7bRvvVlK1uvrNZF4qTsqXlxwagPsmY8cE5gAAbdNBEsOHoqcadtRfFfKvbObl5TPfq3WSJL1Avqeia4Et08dp4Eq3+YRydpiTFZKNoyPrcijnBlhvpyOy42826+E75ZMwe6mHqRb2F+c4q6LOJ/Te0SUpuhgv+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPF916D632A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 21 May
 2026 12:39:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Thu, 21 May 2026
 12:39:13 +0000
Message-ID: <24b58d4c-7fa8-4bd4-a799-701f69cfbc06@amd.com>
Date: Thu, 21 May 2026 14:39:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to
 drm_exec
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
 <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
 <20260521104335.28978-2-mikhail.v.gavrilov@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260521104335.28978-2-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPF916D632A9:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5ffeda-48d1-46b0-3c94-08deb735f6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|4143699003|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	9G9gh9T4Cq47uC9APOgbqbMcND6VgSWsntlU999vAIUDtn5oRHRGRmlYGByyeh3ghcB04P/PY2BUDo5GtgxqhTTKS8mPujGiPV9bSwimT9tjNNYvceziSUk9NmNZWsxFKllm+bmFA8vbek0enCMAKbf6FyU5dSJPkIvsELlKqgr8Vb3S/QWWd3XHxHI9sfERCmfV1hd++PFg17WTgM/y6fJcmmZr2hEzekf33QhgefrZ4ZnAhEVOTN72hUhW6BAfJ+S/6LnJlGDIm8e38u+H6zisRXtIXFkQSGKxslvZ0jg6z4gUNp24+UlaeS8dJfoRi51Jyxavlc7egZiRL77SKHQPhHh/dYaS19sheRkHf1pXKzpBcfHQ5+DDPm9XFpkAOHimt3+ON+DL32eQ8K5AZrxOR5TcmZHnSnePxVXfjeq7KvDO/0kzkca71+goKCXv68OG8dB8teFT39/IU8W4q9Tnyi5c2NC8HEmtVmFUi5cAKHkhm+CG8Y9C+o1aMWR2p/Py/mDqgr+PFhlaeddLPcL5ahYRQlkuh9PSMLhb5+TehZsvPDD9c2p74bwnaatpfpOjDsZf7PiBlIw9ZP5IqhnWGJC2c1DPXCVPCPuWo7FhrsI2VgtWXfntKNCQRVIktrF5gV0wFed5BkPZQ2dDOoHc05O9wp1GeLXUX5hhtAej7wCj1xSVs84nC/65btMU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVhOQ1BlK252andmYW1qN1dySVFqcE5DRXdpekxqMFA1T2ZSU1UxTlZHeUFs?=
 =?utf-8?B?N3ZrbUVlVHpNalF6ZzVjUzFnWWZjNzdBUFZJbm52WERDR1JOdW1MaVFaRnVv?=
 =?utf-8?B?N011dkxRNFZFMWRvckcxTG9UN21TbEJsVmR4VzErUDhzdGVMSW16Yk9ZcDZm?=
 =?utf-8?B?WmhPR0E5ZEZpRmlMZnhKOU9EY2kyM1FteUdOL0FDcUI5NTFxSlNFU296eUVL?=
 =?utf-8?B?OWtPcWlXdkpsWGlacmFweUZoZ040M2t2TXczUmZ0eXlWVmZsZHMvRk9rdG53?=
 =?utf-8?B?NUhwOXhOTm8zWndHdUY2dlhCWHhmcDk2ZDlIbVU5b1BlVDJEWldkdlJOL1cz?=
 =?utf-8?B?bmdrQ2doUyt1QVorMjZhMm9FUUFLbmNYZjBrbk9PMHFDQWRFOVB3cFVmQVE2?=
 =?utf-8?B?bzZCZnhZMFJ4R2g3T2hBT0JjdzRtclpLWUJYd3R4ZWhPcEhiTGVhRkhrNzNG?=
 =?utf-8?B?dHFCditjK0VZWkhPaHMxWmsvN2lsVk5qZXRlRFdSTExEcVY3K0F0MThSVTZm?=
 =?utf-8?B?UGxWNUFGbGkveC9RYUNROU01VU5LNS8zc00xek5sQmV5OSszR2QxNEl2L2c0?=
 =?utf-8?B?ZGdIaHltODh5U1hVa3JzQmRuVUcvdWkyLzVjWmw2MFVnV2c5UjlDc203cTNr?=
 =?utf-8?B?NDVkSHlsYUMzck1iSTBiRDkzQTgvL09vV3ZFd1pDZmx1YXRudVBCRjAzSGlH?=
 =?utf-8?B?YzVSTWpEcnF0dlVrVWJlc25tdGVxMnpyVTJyWUhCeDFjN2t3Wm5tamVRWUpY?=
 =?utf-8?B?VTltMlZHRWhtMTVNNmhvWnVDeHVUMGZpeTBXdlMwcDh4ZWZLdHNicnk4Zmoz?=
 =?utf-8?B?akVkU2NZTklvUHpVTTdJbm5IbEpPV20rOVJFV0dSSGJvbkdPTUZJeW1yaDNV?=
 =?utf-8?B?KzlINmgwa0tjYThVa1VvazZLK1NPYzdndGVYU0dOWHdrUmJjZmxjaEhVK0ho?=
 =?utf-8?B?NDZxMFBYMzZKUFE4WStEekRodTVReTdxMnlKOHhSR0Y2SVNncDdmbCtLQjJI?=
 =?utf-8?B?UG9DZlZVRlZ1N0Fic0l0ckFvTjNoSkJPMUEwNzlVdWxCOGRhSWZpN3lVWmho?=
 =?utf-8?B?R0F1Sllydkd1T0FlWWNiL1BGcDNCRVY5VDdpd0xCUEZYeGorRlNXbGxxY3NW?=
 =?utf-8?B?VmhzNHg3OWRoeHZHOEk5Z0haeGlhSkdSbkJrMlc4UzRPSHFjN3hOSmh2eWN4?=
 =?utf-8?B?L1ZNRks2VXNaOXhmQ0FBT0NmVDlJVjhFSE1BdWs0UUluOFhCS0lVc2VhT0F1?=
 =?utf-8?B?WnlVb3pwaTRDZSt6cXJpOEZVVEgrZVhiMnV2a21wMFJFT3o1UUhBNTJrckVs?=
 =?utf-8?B?ak03T2tYRGFpaEVzaGlZYW4rNEp5VFBXUnMxZG1IZUVDeExvdHlEOVdOUW90?=
 =?utf-8?B?YWxLTk9IMFQrQ3ZJUUdoYkVhZzlnZVgvUmlZTGc5cE9BZ1M0MEZnWnFVbXpT?=
 =?utf-8?B?VDJmTytYdW14aUhoZ012NXZhcTBSSjU0SURQdytUL3Q1Y1I0bWJOd1ZSTFRj?=
 =?utf-8?B?ZllwU3ZNRTBOZ2twYjNLZFhUOGpoK2NaME80R0JKWVFCVSt1cldrSXB6MER6?=
 =?utf-8?B?d2ZvbnJlZUN5dUJMV05IR3pId3pJRGNJdjlaN2l1Qnl5Z3NZdmRQTFphb1Vk?=
 =?utf-8?B?Si81Y3cvQnBCV1RDTmMwbGxvZkpiUGJBd2hRYjZHV2Y0N05aVUN3RkhpSC91?=
 =?utf-8?B?dmVzQXRIMDE5TVNGalZ3S3F3NG9icHVSQmgxLzc0Y3dsT2VMM0tLd3VHVGZR?=
 =?utf-8?B?SVFWVlo0Unl5eUwrN0pNRnlCMFJPbzRYZW45ZmFkaEtqNU1ZTjNXbnNGbnl5?=
 =?utf-8?B?QmpkZ1NHZWNZVGsrMVFhWU9yeVcza0g1ZDZyVlN2azJTQW4xYWY5Ly9id3Ny?=
 =?utf-8?B?K05mdGZDVTI4TFJvNnYvOEZnYVEyZS9la1NCNjZtdG9kVWluT2FJUXNvelhN?=
 =?utf-8?B?cnlreVRBNDkxa0tVR1pGOUUvT3AwU0gxM09rZTlHRUlzM2ZjajZjaGF5SDM0?=
 =?utf-8?B?clE0THlXdmxUM0lHc1cvVTRkWEFyYVNFaXVKMkRmaFNEcmNIaWhFdlFmWkJV?=
 =?utf-8?B?bEZmUEVoOTNqemZxYXhmY0ZqUVFrUkJZNXduOXkybDRNRUIwMVNKN1BoOGxR?=
 =?utf-8?B?T2U1ZzVWZ0FpNmV1NXp1d3hPWWJYOGpQOW5pbEl3RS9WM2I4bmdTamU4bXFm?=
 =?utf-8?B?d094NlltenZ1L2hvT1hnYWsrQjlSdEQ5WmdBZFJzM0h2MmJoc0djUEFDWTUz?=
 =?utf-8?B?VWpMUk84NkhhaHo4NGc3NndMSkxJREhnRkZNU2JJY1RwYm5QVERhOVlyNER3?=
 =?utf-8?Q?wMTycSXD5dJui3XH6T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5ffeda-48d1-46b0-3c94-08deb735f6e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:39:13.8207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8y2f64Sk/eaXA8zxfuLIo1cvfU2D1Vkz1BeEa4yyxD76zrdU+udMQZN4t1OrPNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62469-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 51FF05A4F9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 12:43, Mikhail Gavrilov wrote:
> amdgpu_vm_lock_by_pasid() looks up a VM by PASID and reserves its root
> PD with a bare amdgpu_bo_reserve(), returning the still-reserved root to
> the caller. A caller that then needs to reserve further BOs (for example
> the devcoredump IB dump) ends up nesting reservation_ww_class_mutex
> acquires without a ww_acquire_ctx, which lockdep flags as recursive
> locking.
> 
> Convert the helper to take a drm_exec context and lock the root PD with
> drm_exec_lock_obj(). Callers now run it inside a
> drm_exec_until_all_locked() loop and can lock additional BOs in the same
> ww ticket, so there is no nested ww_mutex acquire.
> 
> The drm_exec context holds its own reference on the locked root BO, so
> the helper no longer hands a root reference back to the caller: the
> root output parameter is dropped, and the transient reference taken
> across the PASID lookup is released before returning.
> 
> The only existing caller, amdgpu_vm_handle_fault(), is updated
> accordingly. Its is_compute_context path, which previously dropped the
> root reservation around svm_range_restore_pages() and re-took it, now
> finalises the drm_exec context and re-initialises a fresh one; behaviour
> is otherwise unchanged.
> 
> No functional change intended for the page-fault path.
> 
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 91 ++++++++++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  2 +-
>  2 files changed, 58 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9ba9de16a27a..591980907211 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2950,47 +2950,56 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  }
>  
>  /**
> - * amdgpu_vm_lock_by_pasid - return an amdgpu_vm and its root bo from a pasid, if possible.
> + * amdgpu_vm_lock_by_pasid - look up a VM by PASID and lock its root PD
>   * @adev: amdgpu device pointer
> - * @root: root BO of the VM
>   * @pasid: PASID of the VM
> - * The caller needs to unreserve and unref the root bo on success.
> + * @exec: drm_exec context to lock the root PD in
> + *
> + * Must be called from within a drm_exec_until_all_locked() loop; the caller
> + * runs drm_exec_retry_on_contention() afterwards. The drm_exec context holds
> + * a reference on the root BO until it is finalised.
> + *
> + * Return: the VM on success, or NULL if the PASID has no VM, the VM is being
> + * torn down, or locking the root PD failed.
>   */
>  struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
> -					  struct amdgpu_bo **root, u32 pasid)
> +					  u32 pasid, struct drm_exec *exec)
>  {
>  	unsigned long irqflags;
> +	struct amdgpu_bo *root;
>  	struct amdgpu_vm *vm;
>  	int r;
>  
>  	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
>  	vm = xa_load(&adev->vm_manager.pasids, pasid);
> -	*root = vm ? amdgpu_bo_ref(vm->root.bo) : NULL;
> +	root = vm ? amdgpu_bo_ref(vm->root.bo) : NULL;
>  	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
>  
> -	if (!*root)
> +	if (!root)
>  		return NULL;
>  
> -	r = amdgpu_bo_reserve(*root, true);
> -	if (r)
> -		goto error_unref;
> +	r = drm_exec_lock_obj(exec, &root->tbo.base);
> +	if (r) {
> +		amdgpu_bo_unref(&root);
> +		return NULL;
> +	}
>  
>  	/* Double check that the VM still exists */
>  	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
>  	vm = xa_load(&adev->vm_manager.pasids, pasid);
> -	if (vm && vm->root.bo != *root)
> +	if (vm && vm->root.bo != root)
>  		vm = NULL;
>  	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
> -	if (!vm)
> -		goto error_unlock;
> +	if (!vm) {
> +		drm_exec_unlock_obj(exec, &root->tbo.base);
> +		amdgpu_bo_unref(&root);
> +		return NULL;
> +	}
>  
> -	return vm;
> -error_unlock:
> -	amdgpu_bo_unreserve(*root);
> +	/* The drm_exec context holds its own reference on the root BO. */
> +	amdgpu_bo_unref(&root);
>  
> -error_unref:
> -	amdgpu_bo_unref(root);
> -	return NULL;
> +	return vm;
>  }
>  
>  /**
> @@ -3012,33 +3021,49 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  			    uint64_t ts, bool write_fault)
>  {
>  	bool is_compute_context = false;
> -	struct amdgpu_bo *root;
> +	struct drm_exec exec;
>  	uint64_t value, flags;
>  	struct amdgpu_vm *vm;
>  	int r;
>  
> -	vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
> -	if (!vm)
> +	drm_exec_init(&exec, 0, 0);

Make the last parameter 1 here since we are expecting to lock 1 object.

Not a must have, it will work without but it is just a little bit more optimal.

Apart from that Reviewed-by: Christian König <christian.koenig@amd.com>.

Thanks,
Christian.

> +	drm_exec_until_all_locked(&exec) {
> +		vm = amdgpu_vm_lock_by_pasid(adev, pasid, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (!vm)
> +			break;
> +	}
> +	if (!vm) {
> +		drm_exec_fini(&exec);
>  		return false;
> +	}
>  
>  	is_compute_context = vm->is_compute_context;
>  
>  	if (is_compute_context) {
> -		/* Unreserve root since svm_range_restore_pages might try to reserve it. */
> -		/* TODO: rework svm_range_restore_pages so that this isn't necessary. */
> -		amdgpu_bo_unreserve(root);
> +		/* Release the root PD lock since svm_range_restore_pages
> +		 * might try to take it.
> +		 * TODO: rework svm_range_restore_pages so that this isn't
> +		 * necessary.
> +		 */
> +		drm_exec_fini(&exec);
>  
>  		if (!svm_range_restore_pages(adev, pasid, vmid,
> -					     node_id, addr >> PAGE_SHIFT, ts, write_fault)) {
> -			amdgpu_bo_unref(&root);
> +					     node_id, addr >> PAGE_SHIFT, ts, write_fault))
>  			return true;
> -		}
> -		amdgpu_bo_unref(&root);
>  
>  		/* Re-acquire the VM lock, could be that the VM was freed in between. */
> -		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
> -		if (!vm)
> +		drm_exec_init(&exec, 0, 0);
> +		drm_exec_until_all_locked(&exec) {
> +			vm = amdgpu_vm_lock_by_pasid(adev, pasid, &exec);
> +			drm_exec_retry_on_contention(&exec);
> +			if (!vm)
> +				break;
> +		}
> +		if (!vm) {
> +			drm_exec_fini(&exec);
>  			return false;
> +		}
>  	}
>  
>  	addr /= AMDGPU_GPU_PAGE_SIZE;
> @@ -3062,7 +3087,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  		value = 0;
>  	}
>  
> -	r = dma_resv_reserve_fences(root->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(vm->root.bo->tbo.base.resv, 1);
>  	if (r) {
>  		pr_debug("failed %d to reserve fence slot\n", r);
>  		goto error_unlock;
> @@ -3076,12 +3101,10 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  	r = amdgpu_vm_update_pdes(adev, vm, true);
>  
>  error_unlock:
> -	amdgpu_bo_unreserve(root);
> +	drm_exec_fini(&exec);
>  	if (r < 0)
>  		dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
>  
> -	amdgpu_bo_unref(&root);
> -
>  	return false;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index d083d7aab75c..0c6e3e0368c7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -593,7 +593,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  			    bool write_fault);
>  
>  struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
> -					  struct amdgpu_bo **root, u32 pasid);
> +					  u32 pasid, struct drm_exec *exec);
>  
>  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>  


