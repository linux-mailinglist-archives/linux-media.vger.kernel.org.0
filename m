Return-Path: <linux-media+bounces-65123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jwQkAYemMmrE3AUAu9opvQ
	(envelope-from <linux-media+bounces-65123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:52:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDCE69A459
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=cPA2zbB7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65123-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65123-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D93304BBEE
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 13:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA2A2D662F;
	Wed, 17 Jun 2026 13:50:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021096.outbound.protection.outlook.com [52.101.95.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608B2C3266;
	Wed, 17 Jun 2026 13:50:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704254; cv=fail; b=Ah6KM4SMtmvSvalD+Sv9zu8y3AbCFRuJQqRsdq4d6Juq+Y3JOTvNrSOQ0jE+9nVS6FyBtoeW+7iz+UaU1WCx4veuwDTftCW+KiPwo40IIeeggFy6IhLXiz/uJtFoJHghlZUF+jsOYjn2obu8+wktLvmDrXkJPgTqzfC0bJW4+lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704254; c=relaxed/simple;
	bh=v2DsndEK/HhBRwk24D5lLswlIAHBJwBTxTTmFU9H6ao=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TzKTKMLXqXql9T5Z28lL+4z8MWvf1QkUrcrbvl9+Mq/a0A2hy/Mu+485T09yMvnQDJCXN+H0Eli0JcjArnWihBrYHUXJqJCqjcyFplDkmlnyfuKsyHKKaHAhMMUP7t9PiGyVlz3n4ddE7aJUUOevpQbLxowLW09wXv4b1/KgXfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cPA2zbB7; arc=fail smtp.client-ip=52.101.95.96
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwlU7erRFw6z4OWOY7ofYgkV5fqdx+Ms75wAm7ARkpwP8+9SWmbbaB2fynRPV3RZkFyFjxVx7Ed63sirtATvDM59Mk3LcgwuYL/4cwZcsq6iRmMU6pVMmKoY+BgeKWFX5sAflAfKljPCy7ump+dNesddbhJmKbIJ1dwXhu0IdleIlQ1ntenVPU11mlCZ+NChl30H2FO6htEECR2TTidj+NlktXX8J94pF2kzmDOsmsjSrjsvr2/2+LPG2+O/YNaDiN9ZDxUT3ian/U84wyiyrPLbzTTCASjLsCzdOnK6Z6VxbSKf1znGyL/l6JdbN6j0ml808U5JgVPCvnw8R+dvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2DsndEK/HhBRwk24D5lLswlIAHBJwBTxTTmFU9H6ao=;
 b=JVel20qPUuxtqPmh/typQaUoJSI5eCh+2iNWRQuef18op0KLGVq0VRLEpwbySfI30G26UsWmu66zK8owC1kQbF/YEd87kfTnw6dvR94PH+gdXMI/6c2xUInJIyPYVIsadHp9EH1tEQQdoXj3uCS2zIykXq6lTlNwMibo8PGc2h5LeiW62z9UriQ7FB+AfqbVz84GWb3z4PknyDiHXMxfsXDMp9lMNIa7LMs8xjkxGt2GrSEtV2LxCRQKLMeJa7JFd2BJ7iDVxp7soUqyJV0GleTPHtfXxMFaNo5PhvyuvtqA2O/bULi5icT8rcBjJTvU49PhydO2EnXE0eEH9b3baw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2DsndEK/HhBRwk24D5lLswlIAHBJwBTxTTmFU9H6ao=;
 b=cPA2zbB7I8Wycy4cIgA/OuWpXdkpWHqz8l9s7p3j1qh/88aE0tiO/299GECMSL+IbRcd2kS8EeFqgIgta3Kn1fxJ5sSREMvh0qQl4ecMvaXeilfv/q/GrP/Yc8NqlZcxSx7mrA28in6JA8XwQv4+WcwgtKh1nt41M/H3EVtz/yw=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2333.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 13:50:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 13:50:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 14:50:48 +0100
Message-Id: <DJBDG07UXTUD.3RX5ZCO36X4AK@garyguo.net>
Cc: "Sumit Semwal" <sumit.semwal@linaro.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <dwlsalmeida@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: Properly synchronize dma_fence->signaled bit (Was: Re: [RFC
 PATCH] dma-fence: Fix races of fence callbacks versus destructors by
 locking)
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <phasta@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
 <6ea6c373-c6cb-4221-ad9d-e60b04d1368f@amd.com>
 <630a8a84ee8fdaa634c7b104742e7a28fcfe507c.camel@mailbox.org>
 <7ff7dc15-4df5-443c-8d7c-c8e9b2672f2c@amd.com>
In-Reply-To: <7ff7dc15-4df5-443c-8d7c-c8e9b2672f2c@amd.com>
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2333:EE_
X-MS-Office365-Filtering-Correlation-Id: feb13542-6e24-42fe-65ee-08decc777054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|10070799003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	dkg4Nc50nxTmdFN1sElwYtk043/s5ZX6Pi2wnRqYtM5VgZ3bZkkZ913+z7U2+XEioCNdlK7rEZpXE2p4NcOwrlUYfEHH5MEzO2AWClTvbEqQoXZuBCOu88+CLNofh5WbE1VEGnGpE1VRqAiTf57UpOjg074jQu2E4YpwAJaPPyK3Bi0J4vGM9ObVq8kYy/zNns9mFeCqJ6CXjYxvfFiKFtOws0hMTUc1Dp4OwIaXHsGdzy/KEBrUdypL7ggqWRGDRd/VMpWL8Yizxtijiy5lz4hm1thq8lyVGK0x3aCdglzool0b0u/FQ0DQzymCHtF5ZVE3eiJCu8r3R2bWWmaAoV1sNrnmGP7DA7nkmSXCd7AdUv9MSDhoFMb5s6hmwAW0ZdHM0LQfCQsIn9ZiuUvCHDb25STWYlHra3tQj70LCZRs6l8J8xBFi/Hlgrm6BZ4lSY4INbtKOAaqkiBk0t/YxNn7ozE9Z+mTFgICOc2xoDtforg/Jvmg1U/k+KPRTezc/lSUWZkyb+qR8oea0gXoQxheveGE2HZ/KK/WX+usXtOaXI8VvxEL0AcWAf4zXTsDiviJd+dLFABgkWpCOSpqgfm2F7Q9ac6Z0Dv8SY8c4oYkSKDT8tGoHUoPBXnxEXL/fnLa6tbGDwhmLUYDcNKOTYmRQLYiSKhJ1I5vqilKOp/bPkmsVP7OuFl2oYLaRu/0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(10070799003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWw4amxoZjNpQklabytLV1JMdFdhVkhiNHRnRGoxdGtmK2tEOEMxOVcya2ZS?=
 =?utf-8?B?WTZPbTV4Y1owRVVWMngydnlSRCt3WTBqc1BVMTgzZndjUDBDRjZ0Kzl5Z0hn?=
 =?utf-8?B?RFJUU204ekUwQTNGeHBpclZMSFJLOFpla3p2T3hLOEVkdnFURmV0ZVhrc2cr?=
 =?utf-8?B?ZlcvbUM1R2hJNU40LzdrUzhnSW1Cam9FVXBOMXpxQ05GNDZXZ3B2dGtjQTN1?=
 =?utf-8?B?YlQ5M29xYTd5VDlnOEJLNWRGdXNXZUxScTZYb0FhVUFiVHJCcExOa2FJV3dY?=
 =?utf-8?B?OVhybmRZRVFxZjduSU9JeGVtZ2JENllHOXcvcGZIMGFhc3pEdktFamhmMEJZ?=
 =?utf-8?B?S3U3S1VtdXhZNS9aM3B4cngrQ1V0LzFHVXdHOW4zWGlRbmMvWTBFYTNWYUNo?=
 =?utf-8?B?ajQxeFFHeTJxcGV4THd0SFdpaWVreGVpbVRZMWVVSXRTMjhhVjJJY1dWb1Vv?=
 =?utf-8?B?Um9yU09LWFNVeDFKV0NNV1FrTmdHa3htcTcwcUpGUXExZlpvMXFJTkZBY2lq?=
 =?utf-8?B?TVk1M045K3hxT2Z1RStnNVJ4ODNEQmZVY210MW9KREZqNitRREVrSzNQc2ov?=
 =?utf-8?B?SituS2NaL3kyQmNMR2xVU1l6N2E1N0VYVHFPaEJQeDR4aXN5OHF3YTBXRHhK?=
 =?utf-8?B?Rnd3VDZNb1ZDT2cxeSs4b1FRcXFGRE5Xd3lxQnJ1bVcyNG43TXdGNjMvSWZH?=
 =?utf-8?B?Zmk4akVOQ2ZsRzVrTGIxRnNWcUNybWF6NWV3aU9YTlA2YkYwbUM3WGlmOER2?=
 =?utf-8?B?T2lQeVlEL1Z3MlNxQXVUN0F4TzV5bXJ5bnd4Y0VobFo5M2k0TkpudVBXRTFB?=
 =?utf-8?B?QW45RXN1UHBrZGg3QURvWm1nNmFXMS9jSmJrRUdaekdrakU2bGEwQWtNQk5r?=
 =?utf-8?B?TmJzZXBZRDJKQ1pGbHN2T1lDUHVkOGdxLzJ0cThUQTN5TUxkU2Q2UEtyNk1s?=
 =?utf-8?B?cjBXUjA2Wm1xY3UycEdXdmVjaFZHbGxrVW5UTjVqUjNqUDE2T29aZjJUSXh0?=
 =?utf-8?B?RUhuTGZjdURjS2tQaW9CY2txL1Rva0lDUTJScWliRTYrdjBPUVJpYUYvK2NK?=
 =?utf-8?B?NnQ5eWVhdHZ6VGJPZ213S0YzR25KUmVkbFI2Z3dGUEJOQU90WHhZZlBkeWtW?=
 =?utf-8?B?dHErL3RjL3NMbHNIWHpBdldEZHIzQ05LbWhGZW9qR3NVS2FLbEkwdjRickw2?=
 =?utf-8?B?N2hTaW1vVXBXMTRmd1BqOEF3bU93UTJzR1plbVl1eGdOck92L01QeDJycjBG?=
 =?utf-8?B?REZqeXNPaGZyTjdRcjlPUS81R1V0VkozNExITi9mdU44aVRKb2FjQU5wclhp?=
 =?utf-8?B?UDFFQ2l2SnpTRUtvNXFHRDlOMzJ3THM4aHBWMGtteFZOQmtnNzJ2Z2tTRk5x?=
 =?utf-8?B?aG05dnk3UERlbmlpTXRhUmxBYjFtZ3BMUkRHNVhKZ2YzT3pzNTFPRkNkWUVL?=
 =?utf-8?B?OUpRUC9zOXFUZE1GY3g5WUpCSGk2aWovNmMrblpsNmlkVGtiR2FTaHRwTDhn?=
 =?utf-8?B?UzVuV0E5V0ZuSk5uUVR3cUlYVGRHNDJtUVZ5UlRRbjdKd0xaSmx1VlRnUUNE?=
 =?utf-8?B?V08yMThyV3MydnRFUkFBVkZQMDlGeHp1R1A5TXlFWGk3c1VLT2VqSEdqUUJ6?=
 =?utf-8?B?VGg5WHBuVUhPOE5TWEg2WTdLWHg1TkorZ3VWN1lQc2ZkaTBXMUF2Wk91ajZP?=
 =?utf-8?B?S1hnR013eDVSRVE5UENoOVFZWUpmRFZWMlhaTHlqWEZUUGFITjZBMUVqcVNB?=
 =?utf-8?B?K0UzNkFMWkErNkt3dXJ0MFpXajFwN1JCQVF3Z3dUSGZSUHJZY3VxSkVOOGtl?=
 =?utf-8?B?R1dLa2hsNWJURWt5ZmlJMjdEM2hyT09xUnE3dFRnZkc1NFpLNUtkOTNuRFNn?=
 =?utf-8?B?Slp4ejBxcGp1bVZpWjRFZzZuRFcxd2p2MXdOdGhnWEkyWEpSNFJCMWxLN0Y3?=
 =?utf-8?B?V3A2WnJWM2NJQ283bzdSZGVVa1VHd3VIK3pkS00wZFd3c0xLTXVtUzB1L2Zk?=
 =?utf-8?B?bXo4NzhVdlJudTVQSGcweFd3T0F4RU96amV3TlNOMG5UVlN1dFYvRXdnQXVt?=
 =?utf-8?B?SnV5MVBiSW5KSlBhWWc0ZGE4ZmxINmlpRzl4TTBUSy9JdGw0elZyOExONmoz?=
 =?utf-8?B?TDhGWkNyMEpoMlg1TWVZTzNIb29sSTNpRllLUzNWTWw1ZUQwcVlEVnk1dkg3?=
 =?utf-8?B?UnFRVHhHaGg5T0l3d2lMcFl1VGFJMGVjWGlkMEFKZmJWQ3YxcHVROEhpUWhr?=
 =?utf-8?B?cWQwOWpMcER3aDFVdlJLeDkxbGlFdWI3VVR2N29KSFdSS05oSHo1bzY0OGRu?=
 =?utf-8?B?Y01ldDIwOTdrL2N0NkpaeXJVVjI1WFdoNndIbmVaV1lGN0JUZnFzdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: feb13542-6e24-42fe-65ee-08decc777054
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 13:50:49.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQuQakySMICE7nMQ9M2MCfu6rxyEmHyuD1tE0O8w5VqQxHtQ8VW/4rFyZDAaXQWUM7lkjVZM9PrnZHYS7JGTeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2333
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65123-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid,garyguo.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FDCE69A459

On Wed Jun 17, 2026 at 10:46 AM BST, Christian K=C3=B6nig wrote:
> On 6/16/26 13:25, Philipp Stanner wrote:
>>=20
>> I think rejecting ideas with "we tried this, it >>didn't work<<" is not
>> a valid reason for refusing an idea. Point A above helps with that. If
>> your commit message contains measurements or links to tickets with
>> *real life* performance regressions (microbenchmarks are invalid), that
>> helps reducing discussion overhead drastically.
>>=20
>> Now, in this particular case, I fail to see how taking the spinlock to
>> check that bit is evil. If it regresses someone's speed that much, it
>> would mean that someone is heavily punching that lock, like polling
>> 24/7 with dma_fence_is_signaled().
>
> I think (but I'm not 100% sure) the the problem is that taking the spinlo=
ck
> introduces a write to the cache line it is in.
>
> At the moment when a fence is signaled a read is enough to check that sta=
te,
> so what happens is that the cache line for the signaled bit sooner or lat=
er
> end up in all CPU caches.
>
> When you start to use the spinlock the cache line backing that plays ping=
/pong
> between all the CPU cores and that is something which always stalls each =
CPU
> when it needs to acquire the cache line. Keep in mind that on a modern bo=
x you
> can calculate like a 4x4 matrix in the same time you solve a cache miss.
>
> This is especially important for the stub fence which is used by basicall=
y all
> cores at the same time whenever you need a signaled dummy.
>

This sounds like an area where hazard pointers can help. Like RCU the reade=
r
side is lock-free. And for the specific case of signaled state where it is =
only
going one direction, hazard pointer is also wait-free because it does not n=
eed
to loop until the state is stable.

The reclaim side just needs to wait for all reader to exit their critical
section, unless RCU where it needs to wait for a full grace period.

That said, the reclaim waiter still must not hold any locks (or other resou=
rces)
that the reader side critical section can take. So you still got a variant =
of
the lock inversion problem to avoid.

Best,
Gary

