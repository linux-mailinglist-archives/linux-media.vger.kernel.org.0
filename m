Return-Path: <linux-media+bounces-52098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIrVGTTNgWl1JwMAu9opvQ
	(envelope-from <linux-media+bounces-52098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 11:25:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2CD790A
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 11:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 637BD304AC29
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58F5318152;
	Tue,  3 Feb 2026 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="auS91Ck7"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012043.outbound.protection.outlook.com [40.107.200.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE049317709;
	Tue,  3 Feb 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114327; cv=fail; b=c5MfezCWFJ7bMMojFUGadvH98hsXRHH+2aOGM9NaNxHmyIGgdc+riEpZ6sg7+CMiOQC79ev+sbhDfB95JrW+kz8fk2EYgXur9GaNKZ1EKIEZDz6je2IooO1xzBJ6FkSM+WHJu9K/cgoe65TE6bySSG6A6UIRUwUq0mZ6NdIqrZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114327; c=relaxed/simple;
	bh=huE9ek1QHaTwuVPieiwDo6LuSUbLuksRZ//NALvRyL8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=euXRGNsv20CWRP8WDE3z04vMf/yPpW45m+hfz3NJBxGuJZQvC1XR4tcLG+GHzk915hccbjnSkgmA++n+sqZ8FZN8Gln3vuiSQhsaE7/vQC6o9eoZfdsSLtxVgFcmU0sZgMZbZHTWzLAoTWdYdDsWhmVUelUjTALDKyjFId/8Vpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=auS91Ck7; arc=fail smtp.client-ip=40.107.200.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxi4m/mP0PszHkmxbLT4AhqfWHtvErAnnec+7ZV/KcOu8SwC/jHzi1UnToi65Cy31I3ytYUZl06FXbAACHYZmm4N4HgK1OhpuMMx+8/8Vx2I7Ft8KVuTTrjxLvEmKi5fgSsEWPNegAru2HdY/7cjlhjfhU/UZNVguCMAR98wtsTTLsl7qcIHISanthiLOBFAfDljJIukLgZM7PeJdcDHiZoNl3NyG8wKqnpIy7TU3KptFjj7mxmvTcPFNYOjD5nOAEAKjuV+g9olKnLbSPPrTrxzDTHWf8taBZwrnk6tWNgOhCHzYeRMOV7Cq4rNlxz8j8iZ/ZNHFPTvV9f5/9O1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8WY7YcI/p4C+q5bgWanWfKoUrUG7WoUSict9dlxtx8=;
 b=hB+DKILtFnUSJQRq++qKXHwXqJhab9GctCvq3GiAIrON4nXNUxQQno/zY1TVmMKoVnpAc0U3uIR6IQIKlJ0efzYRKv2HVrOO/xlDy27DodzweS1SpUlisRYp8v6scTT/UY2uWWEonGKDcy4uNJcSFTRWN9BJLewEyDgKepfrlaMGepvaINqGun+a9TmZHaBavIPGbBsnQj/wcbL8CgPqp6m6Y5AtVxPweqlaHPY7FI4nuUOMMgk6FgTdgtN4CANZ/rNhkigbPdES44Db+urDj4IVgFAP3f5H1v75RXJielCL/tMmZ0KDPbiYyHPCUeJHlyyhjgdPTgoG5GdWulQtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8WY7YcI/p4C+q5bgWanWfKoUrUG7WoUSict9dlxtx8=;
 b=auS91Ck7PMCaT3qdwOxvMphuY5oJBGZ8IAeUb6gs1z/zyPpYLVFe9NLACxryLM+FZxupbEClXW9pkFV23lzM4lFkA5TnED74xwINvW7wftn7T6qjWSJ9bbPNdyBSANlwb4rMdnPtzRaburINc9RKKpdckabeQCD3cV80GFD0FmM=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by DS0PR12MB8788.namprd12.prod.outlook.com (2603:10b6:8:14f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:25:16 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::bf) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:25:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:25:16 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:25:11 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To:
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
	<alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
	<sunpeng.li@amd.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>, <amd-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 00/12] drm/amdgpu: use all SDMA instances for TTM clears and moves
Date: Tue, 3 Feb 2026 11:22:07 +0100
Message-ID: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS0PR12MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de1fa52-1d52-4b50-411a-08de630e8625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmRpZERBenFpL3NyVkJuWFp5bjFwelAzYjVnd1lOQkxTT1FoT25vYkREcFNC?=
 =?utf-8?B?VmsrUTBQVDYyVExKeStVWUFadFg3SEZRVlcvRU5Jc1JGeXNNZEtmd0puaG4w?=
 =?utf-8?B?dzR1bTN6MnRJV0tncFdjWmhQNUhNUlNPY1VXbjlsd3g1STBQR0lUZEN5bm9i?=
 =?utf-8?B?dnpGTEpPRkk3a1BKMzFaVmxRTCtMYU13ZmRUY29BL1E3NmR2OCsyOE5WSXpT?=
 =?utf-8?B?OGhNdTVkOThVVjVHT3dnaWczdEVKRkFsZVZYaGRTcnB0LzJhTDNNOXQ1c2oy?=
 =?utf-8?B?SGEwNmVVcXpKYjdqZmxFei9UandFMEg3VnJ4S3Z4TnZJZWd6R2c1UXplWWFP?=
 =?utf-8?B?TCt5d1h0VWtSdGliNWZOcFE3OHRyUVFIOXdhZXRFR2hPWFA4L0ZOWnhGM1V2?=
 =?utf-8?B?eDBSZkZxN004am56b3JYM2VVV3VTamlsaU53VmdhR0hBOW8rcWVVWmpqYWRV?=
 =?utf-8?B?NCttclEzVFZSWHRRY1RIUmhDTk9raVNrQ1RMcUZLU281MzUreEluc2R3L3ox?=
 =?utf-8?B?NkxNQVhwR3RtRi8rSFNyWkRqdW93QXZDL2xGYWF6U3dQYUlIUG92WmNmYVdG?=
 =?utf-8?B?SWJRcnZZU252cmM3U2ljZE0yekNNOWZ0YmxSZVFSamF5ckY4b1Z2VUZDMFBS?=
 =?utf-8?B?N2NUbCtScUxDV01IRmM3TjBOZWxLMEhYcTNkTWo1MUdPOEVkMWRnRjBUTGNz?=
 =?utf-8?B?aWlGcmFHT29ta1FjZW1hYUpuTmVlTHpZbmdtZEhtRnNsTXN4ci94UFNuVjN3?=
 =?utf-8?B?TWhXUTkrUnU4ZkxVUEppUHExb2VGYnkzeHQ0L0tKanFJL0FrQWVFTy9VdjJ3?=
 =?utf-8?B?TzRzdFFya0FEaHVkengyMHRaYlVDT3Jxa3FEVWxRME1wTVZOMjluVVdvYVht?=
 =?utf-8?B?a0w4Y1NZZFk0RkFqb3Zpc2JURWc4U0lUeXRlVlRuWlZ4UFdoOGtoL3hodi81?=
 =?utf-8?B?bkltN3RPcm14RGxNTnNkRkVIRFBoRlBxT24wZDAxL3EzY1NGSjdXOHhPVHBR?=
 =?utf-8?B?RWtkcER1MGx3TTNKd0RRRWpmTjZjbmM5ZXcxNnBWTEV1NE4vYkZKdVVpN2wv?=
 =?utf-8?B?OFZZWlh2RGZSaFlxdG1MVVBPdFVPVXYvRzNabW0zNUdwYVo2WjBkVWRiR0gx?=
 =?utf-8?B?Z1VEVmtnaU1Lb3VWNFNuVVdGOWZpSjhCN1JTdUhJYm1pemJkc1FtVGhsbk9R?=
 =?utf-8?B?VGQ2cWpsUS9ZbTRWRWZSNjFYVytqcVZxOUJPQ3BuejE3bzdrQmhDUXJVVERq?=
 =?utf-8?B?TXBEdUh3Q0Z2SHhqMXBOT2FiWWFzUTdkaVV1cVdYL1JQSTBVWmJNL01Lc2o2?=
 =?utf-8?B?UXdweFNDOEpsa3pUQStuSjA5cmQ1Y253ekRmaktLUXdsSmNGc3FHZFAvS1li?=
 =?utf-8?B?QkZtYXRmaUkxQVh5UUVrRkpJdGpNUVRuc0RONy9GSXcyeGhJRzdPaDdJLzVC?=
 =?utf-8?B?V3E3V0ZZaGFsM05rMHRnOWpkek5Ua0ZmMGJEMi9HcTZaYUpxWkVlY3V0MTNp?=
 =?utf-8?B?NE81bVV5Y2pBdUk2QWFnSHVwMXFncHJOY2F5USsrVVJGeFljZVQxU2R6Q243?=
 =?utf-8?B?WTMrRHJYYVhRdXloNDVmTS8zYkhOZUJyZDBwNHpFWEZoMllORXRSQy8vSW5I?=
 =?utf-8?B?dlhxUVNCeERFelgzbm9Wa25ycXU1a0w2UmpTV2ZKaW9lU2lFYkEvb2lFaW9i?=
 =?utf-8?B?QXdlelFhNnc4R0pMZzZmT3J0dGE4OGlvME54Mm11cHBBTHFhRmNGVUtEZHlt?=
 =?utf-8?B?VjQxeEJ6blZJL1NtMTRsc0JSVEJjdk54UzdjUHFXcnhSZEg4cFNHRVZ0NTV1?=
 =?utf-8?B?Q2FFelVoaGFTN1FERXBZcmFTcXVFK1lhbzczNXV5VjBOYXB2L21GR0RIOVdH?=
 =?utf-8?B?V0lIT1VwSWdVemRaeGo1Zng0RnUwamhYUnJoRjFOcng1dmlOeDN1Y2NoelRE?=
 =?utf-8?B?MzZFOGp1SDU3dE9HcjhnNGxjUVlWeHllbkRyRWN2N2RXMHJrRG5pRnZCSUFZ?=
 =?utf-8?B?S3hUWkdmNkl3TXRYZXR1UDR2TFdacmY2VjNuWHE1WTRLTVhPekxpcU5yS01m?=
 =?utf-8?B?OHNQUTJFZ255ck1oU3FLcHNyR0RyYnFIclFwZy9ONlVuZG0ydGJYT0o4Yk9W?=
 =?utf-8?B?UFZ5RWE0dzBsQzJtUVFPYk8zR2wveWpPTDdGT2NpcWNJMGlUdTZ0NFNQKzI5?=
 =?utf-8?B?SFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XytBm3qqOuP93kKlttE+MMBE5wERrAVaH+Pc2vpH2sdfNDriIkaPaBlxqXYS1CDHUBxwulYDttjIqirpKKXPeX9vuPQPqAp6ax45fXkevP7R9IfjV9Eiw3AN93EJx1V7IJxW0kf8lS82ZYeVxuMIyOvJj6VY9EXbwQF2/KfRQs30T1RSB5AKQjeS1CEUvZJynOEOrqoqwsidnHR39aHkoD85EfUVJ43ZwmuFKVftGwQDMjUsKauDqT7sv786uxx5rLpCGKgXBgepMpSiQmLTbcgMOhzj6877ZBkcrgW7ksMG1+UTNNZXj/dHid2WnBRx0/L1e2raPi0SGNmqUtw1vojJq5VWGj48sJY+zUOK8bIr7EXw4V625HqBPQlUIkzQArBJMTX+2VEQn5xHAI54qxp9FNDrhRGcv2nlOPkhqrMDlknkLT/4vuxJ9aCSD0iq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:25:16.3384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de1fa52-1d52-4b50-411a-08de630e8625
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8788
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,lists.freedesktop.org,lists.linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-52098-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.freedesktop.org:url,amd.com:mid,amd.com:dkim,gitlab.freedesktop.org:url];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4A2CD790A
X-Rspamd-Action: no action

The drm/ttm patch modifies TTM to support multiple contexts for the pipelined moves.

Then amdgpu/ttm is updated to express dependencies between jobs explicitely,
instead of relying on the ordering of execution guaranteed by the use of a single
instance.
With all of this in place, we can use multiple entities, with each having access
to the available SDMA instances.

This rework also gives the opportunity to merge the clear functions into a single
one and to optimize a bit GART usage.

Since v3 some patches have been already reviewed and merged separately:
- https://lists.freedesktop.org/archives/amd-gfx/2026-January/137747.html
- https://gitlab.freedesktop.org/drm/kernel/-/commit/ddf055b80a544d6f36f77be5f0c6d3c80177d57c
This version depend on them.

v3: https://lists.freedesktop.org/archives/dri-devel/2025-November/537830.html

Pierre-Eric Pelloux-Prayer (12):
  drm/amdgpu: allocate clear entities dynamically
  drm/amdgpu: allocate move entities dynamically
  drm/amdgpu: round robin through clear_entities in amdgpu_fill_buffer
  drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving fences
  drm/amdgpu: use multiple entities in amdgpu_move_blit
  drm/amdgpu: pass all the sdma scheds to amdgpu_mman
  drm/amdgpu: only use working sdma schedulers for ttm
  drm/amdgpu: create multiple clear/move ttm entities
  drm/amdgpu: give ttm entities access to all the sdma scheds
  drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
  drm/amdgpu: rename amdgpu_fill_buffer as amdgpu_ttm_clear_buffer
  drm/amdgpu: split amdgpu_ttm_set_buffer_funcs_status in 2 funcs

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 329 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  13 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  14 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c        |  12 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |   6 +-
 23 files changed, 300 insertions(+), 243 deletions(-)

-- 
2.43.0


