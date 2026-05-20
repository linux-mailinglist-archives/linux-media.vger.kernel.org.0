Return-Path: <linux-media+bounces-62240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJAkEV+UDWoMzwUAu9opvQ
	(envelope-from <linux-media+bounces-62240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:00:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A502D58C083
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE55B302263C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4403DA5B4;
	Wed, 20 May 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o6txoL/I"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010049.outbound.protection.outlook.com [52.101.193.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62733AFCE2;
	Wed, 20 May 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274826; cv=fail; b=f/+o2TwLzK6Kue5aPXvt47y9Y92AGcRFbnpVgdie+OIOjxqw2FhvimtouK6h0ZnoIbkc1gM56nT+IDdRcv6Uwk6oKi3Yk4p0gFqd+CJd54j/FESoBC73dEMxxXLyXAZ/xwUfwLy9QlkpWms8wE/fB2ETiVzzwI7hlZov6jScz7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274826; c=relaxed/simple;
	bh=JSXWbFYNpsCm6JYQtxjpuksunc9r3wEWYu5BhzaM5S8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eq3x0S1aCSFgVg5CzRMtkOVZSSYc3tpCAgelUP9a/i6NlZisAOnxAp9GrCFGKc96gSiFKW00nYkXoQPgLLicXO2h84U1zciJK37w1nQf4+xv0IqGhx3WTv/bYso64XIlZOYIdyM1aOLi2PGxeC6d7Z9vCV+1UdeXDqT4t3oQgnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o6txoL/I; arc=fail smtp.client-ip=52.101.193.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4THSbgkMpYmJA1DvPx3LICOD1aqdcH4kdp7UyXcaHoZONJ+nXgmIoNVYa6WZ6sg8O8jqmge2TYJjVKqjBT60IAc/bb1K8UVzpMN2T7Lgcz6tPOq460TJV0GBR7UT1Wz/HkJk/HFx4m9LFu3PZWMegW5jp0wFEgsVSWAYU2EXePWmDH/GoHDLuMNbL8mh/C5glLu5MM7av7rkn76cFMVWGx++Zm+ll4lIHZU6vYjw1Nx5tkDsxJy8sE3i/ci+8YWuNM71lFcSZhMXu8NNnE1QmjX7i2pPI1NwHqJ/b2lt0IZwu9i2yOn+iydB/5B3Nvwr5jo0raVpftRgCB2ZU0mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfTfZjFO8mbhEiCu+l1R9CuG+d1AtNZs3+W5W4/KP6U=;
 b=jcAnLRS8pybm0mxahSzIF1eQnRwel155A+tHUoBrKzVljlEtrh/Jaq9b9jC0cBkP4cSc/5ZAiXBB00hB+xQrP1W9+l96X/FAMstpO5uhoc+LTJSKVAencQGKGIhs+Ym8Afx96qjrnzKTS0cCBqjwAP+YgvqIY5Xd5ybj7Otwbwt37IZ2ldWIRLlk0Zgye3dy9MZmNbCA0qng0mdnIgibZVWxe94bv/tt9t50H/THOSWfLXkNjJsBjdFQkN6E+btug9oMH1tzAp7ZMulPb/htmo7yWLAq7m9wIZTnjzCjQxigKM5IsbsMwwdMRv+WdwI9BXoUskzMI7dX1XSyWIkR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfTfZjFO8mbhEiCu+l1R9CuG+d1AtNZs3+W5W4/KP6U=;
 b=o6txoL/IJds3fbV0BvHLD2lyfpQl4nrDqdns5DveHhayUywHwM4cAMwBmYhOUBWfyBMRX6l4FPfz2ZPNNMDP7M3FAS3/qXqdNX2Kx28C0GoZ6Urzh2ASvuy/yeFlyRmnEoHwdkg2cOFkb6Bs/7GevUf096/r7Hz0BFdfARYA9K4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8441.namprd12.prod.outlook.com (2603:10b6:8:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Wed, 20 May
 2026 11:00:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:00:18 +0000
Message-ID: <1832e5a8-db85-4b66-a5f0-08043c4aed54@amd.com>
Date: Wed, 20 May 2026 13:00:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: use uninterruptible resv lock for plane
 updates
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260519082247.34470-1-kartikey406@gmail.com>
 <2e23513c-9d59-4891-acfe-9f1fbcbce778@amd.com>
 <f6bcef23-5510-4aad-bf6a-4e1ecfc8d474@collabora.com>
 <a0f2cfd5-d4df-4e50-a52b-d5befbc2e481@amd.com>
 <f37bdc63-3575-49e5-aa5b-7b93428b293d@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f37bdc63-3575-49e5-aa5b-7b93428b293d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:208:23d::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d59778-09b0-43bf-011b-08deb65efaa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|11063799006|921020|4143699003|22082099003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DYVAcUBO/AOfVREIe31HM3srn1blo7KOP4k0bIiuzW3m2vFQCiTqqGPMS87xJkmZURPReydk89CTyTGX2ZFCmHRGOfWmS9B7TLCyV/ezg3FdDIj6ZtUS01IrQZhgM4jjRxu3w2dfbLi0m/pylDDKlaSVKXFdKXycWxf7NIg6tYengY21mPvA/1xHbENUfVibKfEY4yn4439yjidnEg/Z42teS20LQDt4ouOerPEd+YOAKyHnK8wHLpGxdUDsg7JIbUAu5UXxilkLWLreVATgPiGYfUkj6D0RBDPdBqfuTsGRq8h6evMPdFAkIihUJwzC5q4RvNqFCncdtLsL6i9JflynG3noMhESv2i6YDmu4ubKF3mJSXHTk7xjgkYiE8ajgpeHI5cpCODPQTu93SU1rA3i0hhynJPT6SVIFnRQId1hfGGXReNhlZS+NTTkHCbgU3CpLWU2hfcWjDIm1FxSxjqFsqQ0g+vet+u2V9gZYaJfSzogm03OCnZd6Guyuv/8lJJA+4vMizAGbMWWtvb9jAF48GxJb9hZuxjiySBbxXYOyLAsoAi0EusekRPMGBcQaY+VieOhclQmjuRtA53/R6pCUt/oYW4bsR7u3KKZB9RKB5Qky94sBrpROxAuu0cca0IWtBIPA2f/RnKp0zX6pUrK8gU0vvoNdX6y6YD/QwjSFQaHj9HDJ6eRPumshxJgUomle9QTCxYc42rdeGT9xNaqm7442UxLDO6Z7q/KzV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(11063799006)(921020)(4143699003)(22082099003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEFtK3FkMmRpMm0vRWpiTm1GTWpFVEFXeXlLSnMrYXZPV3hTSkc5dGhYc2F4?=
 =?utf-8?B?c0NiOFVoNTJuQnJnVU9xd1FaeERGRHQzeDBoSHNNbGE4TFZaKzY3bkpmbkx4?=
 =?utf-8?B?R3ozMEJucU9PdkQySTdPQWM1WlVvcG9obGN5dzJnU1c1MitDZjNkcVVkeStO?=
 =?utf-8?B?UWxnV2JId2tCUlF0ZzFMdUx2RHFtN2t3cHBYdmduUnFSSng1YzhRY1dtMkNT?=
 =?utf-8?B?bFBScVlCaUhINEh1bkFmME0wNHRERnQxQW8yTFBKR2o1Rkg2ajc0Qjd2ei9q?=
 =?utf-8?B?Ym8xV29OTTlTU3ZPVzVPbVJYcWZPb1g1eCtOZ1lOUDM0QXozU2ZoNVpEZmtX?=
 =?utf-8?B?VWdBd3dDSFN3eXYrbDZVYzlMUmFCbXo1bHpvZzJvNU5kMFVzMW5nYUg3UEFj?=
 =?utf-8?B?Z081MDZxSU1OY2p5VkllaFozYkNDM2YxY2VNTm9lMVJYbVJHbHVTQWF3ZWVI?=
 =?utf-8?B?MnFqMGNTMVllUVJFZ0lxa2t6b0ZiWmZlTkJPQ0k2ZHgxUnUyOW96ZThmNHNz?=
 =?utf-8?B?US9KcEl0VzU2dzZBaGd1anAvL2pnYTFJMHZXT01FeXBOR2VnWi9jOENaTWZj?=
 =?utf-8?B?Z3pFd2s5SVhPbDRWWFF6emFiYTQ4QU9mRkRHdXhCTzZRdDFVNE1BSnRJM0FC?=
 =?utf-8?B?bkxjMFF1Mk05b0lvSWxkeWJvd2lwbDc3Z2x0Q3o0NHZhUXhLTDdBelFJcCta?=
 =?utf-8?B?K2p5dWdPbFB3YXNsSmlwTzNwaWhkei9ScFBQdkVaV3U1TTZReHNRZ2NTcnJD?=
 =?utf-8?B?Zm5nZTBkUEJ1M3ZzckhwUEhoL3llUmNnRnNEN1hwdC9hVkt6WEFyb0Nha0Fu?=
 =?utf-8?B?ZU12TjNvY016V1M4NVZPRXNOS3dEWEc5R2VkV0Y4Rzc4dnA5NzVsakg1MzVy?=
 =?utf-8?B?K09XemhWRDNCKzRSbUJNRE83K2RwVisybVgzM0d3OExnTXJCS3QxMGlWZmxn?=
 =?utf-8?B?Z1ZwMU9sODU1NVBMZDN6am1ERkNjWUEyY1Nxek0zVy84aEFmc29EaG9iY1Ba?=
 =?utf-8?B?ZFpaOWh5MzNGV1lUblpzOTJiNzNEZnd2dFgyR291OUJuSjdrU2N0c0c5bTFV?=
 =?utf-8?B?Y3FXc2Zyc2xuWFUvMTdyeUN2MzZBL3oyQnIwZkpWM0NVbGxhaU5hdHlYWEs4?=
 =?utf-8?B?eGtoWlRtK0oyUHUxK29XNXZzMmdCSU00RFlPdlZjRmVtaG43Yk52Q1ZNR1NZ?=
 =?utf-8?B?QnAzQmE1eFBCTkYvUnNvVDlnQTZmZVlSTEc1cm5uL3FBSCtSeUl2UDZNM2M2?=
 =?utf-8?B?dm02WElrR0FmMVhZOS91OVpjRm9PUEhIZ3l5eHd5TmxiKzRwUUVoMEdIL0hw?=
 =?utf-8?B?S1FJVk5MeXdNOG1IRkhTS1JZaVRnWnVXSXBGam13Z3ZDT1FEQ2h5Y2hlTThJ?=
 =?utf-8?B?c2UyZUpxZnV4ZXBSc0RSM3pBdVB4SWNza1JsYmxLTDZxNyt6aW1qUU1QSEJv?=
 =?utf-8?B?dVl1V2J3a3crblVtMW4yY1ZIeU9Jd25lZVdCS2pnRFJwV1hNcThzdWxVR0JP?=
 =?utf-8?B?dUM0NWVrOXZ1SHFTZ2E3TFpBZVAxUWhpN2xTSHk4TUxiZm5CZmF1Q1RiV1F1?=
 =?utf-8?B?NEZnb1dNKzFjZFdBY3JhT3ZWOXFOVFVWY3U0MWh5d3RMa1BHRGkwaGFpT2NY?=
 =?utf-8?B?V1dVcDh4SEdNbGVqNjR6dnk0RHFzclN0Zy9QL3M4SU4zVDk1V0YxZk1tc0pZ?=
 =?utf-8?B?YmE3bXdzMlN5RUVUTlNVdStaRVdqcnZodzUyZk1FR1BGQTg4aEFvaGR6MUJh?=
 =?utf-8?B?d0Y5Y05kb2kySXhiMnFkNDg4QkFnemUwTUxGMlZSVGI0d29ZZjA0QmxtOCtM?=
 =?utf-8?B?RkJHMk05enAwSW1UejF6QXErNEYrb2RObTZYUXMxYW5wMk0yaER0emwyL1pj?=
 =?utf-8?B?MEpPYjFvQ0ZZNElxbzBOR21GWWI0U0JHQXpXTDBnYTIxQUtUNi9jd3R3cDdM?=
 =?utf-8?B?bll4UDFRTm9CakV3MW10Ty9haUNxSVRCaHRvYTdVMDA5bXlBSFhxOG4xb3Aw?=
 =?utf-8?B?RklQUklsTnRVMmVkbmUxbTZLbk1ZQUM5RWx1RFQxSXZDOWVPS3B4dlpST3JK?=
 =?utf-8?B?b1VMaUoxQ05FaGpsT3VSNHlBaHZQb3BDZEJmMWMrZnRFYk9kTkxWMkRaTm4x?=
 =?utf-8?B?TWhUT09MWVVKbk1abDNkNlBSclFSRFdZYytOV1Q0c3kvMTJockNlcVVvVkVs?=
 =?utf-8?B?cHFkZndLNmpyeWEvVFU3N1BzczlpMUtHSDcvd3lnRFc5a2xiVDV2S3hndXJP?=
 =?utf-8?B?Y2tJaEo5QkNyamI3YW5aMWN0cmI3djBWTkw5ellkV25SMUdBeDFGYUJlQzZi?=
 =?utf-8?Q?fy3ybZw0NHjxYc+5CZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d59778-09b0-43bf-011b-08deb65efaa7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:00:18.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lrN/A3XyxzTpivp4xHUXTiAxoPEz5MElyS9qr/POnEAfoErPDe2Yf5lSiWzDq6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8441
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62240-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A502D58C083
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 10:12, Dmitry Osipenko wrote:
> On 5/20/26 10:05, Christian König wrote:
>> On 5/20/26 08:50, Dmitry Osipenko wrote:
>>> On 5/19/26 11:27, Christian König wrote:
>>>> On 5/19/26 10:22, Deepanshu Kartikey wrote:
>>>>> virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
>>>>> the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
>>>>> ignore its return value. The function can fail with -EINTR from
>>>>> dma_resv_lock_interruptible() (signal during lock wait) or with
>>>>> -ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
>>>>> leaving the resv lock not held. The queue path then walks the object
>>>>> array and calls dma_resv_add_fence(), which requires the lock held;
>>>>> with lockdep enabled this trips dma_resv_assert_held():
>>>>>
>>>>>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>>>>>   Call Trace:
>>>>>    virtio_gpu_array_add_fence
>>>>>    virtio_gpu_queue_ctrl_sgs
>>>>>    virtio_gpu_queue_fenced_ctrl_buffer
>>>>>    virtio_gpu_cursor_plane_update
>>>>>    drm_atomic_helper_commit_planes
>>>>>    drm_atomic_helper_commit_tail
>>>>>    commit_tail
>>>>>    drm_atomic_helper_commit
>>>>>    drm_atomic_commit
>>>>>    drm_atomic_helper_update_plane
>>>>>    __setplane_atomic
>>>>>    drm_mode_cursor_universal
>>>>>    drm_mode_cursor_common
>>>>>    drm_mode_cursor_ioctl
>>>>>    drm_ioctl
>>>>>    __x64_sys_ioctl
>>>>>
>>>>> Beyond the WARN, mutating the dma_resv fence list without the lock
>>>>> races with concurrent readers/writers and can corrupt the list.
>>>>
>>>> Well why are you trying to add a fence on an atomic mode set in the first place?
>>>>
>>>> That is usually an illegal operation here.
>>> That is pre-existing in the driver. It performs draw operation and in
>>> some cases waits for the completion during atomic. Whether all that
>>> syncing is correct is hard to say immediately as some of it may be
>>> historical edge cases.
>>
>> I'm not not so deeply in the atomic mode setting stuff but it strongly sounds like that this is seriously broken.
>>
>> The background is that the atomic mode set framework allows an output dma_fence which is signaled when the commit is finished.
>>
>> So when you allocate a fence slot and add a new fence to finish the atomic commit it is trivially possible that this cycles back and waits for the atomic commit to finish. In other words you have a deadlock.
>>
>> You probably need specially crafted userspace with the right timing to trigger that, but such issues are usually a rather big no-no and need to be fixed in the long term.
>>
>> Try to add dma_fence_begin_signaling() and dma_fence_end_signaling() annotation and enable lockdep, the tool should be able to point out if and what exactly goes wrong.
>>
>> The usual fix is to prepare everything before commit_tail is called (alloc memory, create, reserve slot, add dma_fence etc....) and then just send out the prepared commands later on.
> 
> We tried with moving resv alloc to prepare_fb() in a previous patch
> version, it resulted in a non-trivial deadlocks. The goal of this patch
> is to fix immediate problem with a minimal code change.

Yeah, totally fine with me to get that fixed first.

> What you're saying is correct, but it may require a rather big
> refactoring of the code. In general, everything works okay today, so not
> really an urgent problem.

It's just a potential issue and when the AI bots keep evolving like they already do they will sooner or later start to point that out as well.

Regards,
Christian.

