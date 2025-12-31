Return-Path: <linux-media+bounces-49789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB106CEB8F8
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9D10305C257
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990F8313E1C;
	Wed, 31 Dec 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="dT2EdB63"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F8313E17;
	Wed, 31 Dec 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170439; cv=fail; b=SI8/inMS8xDEg7qeaIzgiVL/UyJCK3rs7holkgCtIQj+Nk9QDbOOWMJ92yKkxh7UG2lyDnPDQoFFuxpR5R0tW3RDReg+qhnf9AnDodXp9k0sfKl+tRCepEek5exWcCWeS4UXtqsGBlUHkfyLqMkVVquMHAaLi7Y0PnAmFUfi3Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170439; c=relaxed/simple;
	bh=5yxxgPAeXZ1E04TQue27FURhYNttyjrxK/3lWV1Fkw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cURJXIvj7BPnUGvdDV6CZ4qRWm/TQssMHpp/IFs9O6bVpxJchwBsrCV7RWmUA43qo86JnF1LfPCFtb29eOgJZUWCsiztbASpjd6FfXd1KMd9YDptrrNhmStrk8mYVssGgw7+V3NY2sXtsF6pSKT7m/qlJ35nrpf13B3Y7sf0oxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=dT2EdB63; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV89iVF210755;
	Wed, 31 Dec 2025 08:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4iuzLszjgoMEOTRj87tcHoYD732QLPd4XlRN9zJMvKU=; b=
	dT2EdB63BLXF0DK1u7cDDk6yr9Z1FIeG+PIIjAokA/2k6LQB64F67SieG9S+CFh2
	MBXnySeU4pg2prHlKCOTavHpsh9ihw7Tp65UHCShv258qNP9cyxB/6nI+0JHk3yW
	0JdVi14qPjyfNsWgsJby3evVBCCFAPEgNxaehB+B3j6DH5vX7eQ9eo7B93yC1pfB
	heUFNNymqRrvqgmeNN52EqkiSlBmj/9IUsrGzGF8DVQ1Yjwbhqi5xXDNacvkvadO
	KlPX38V5bYkcluLUqIdxl9F5Nzq1Ur4w0OZMjgT8EZcrAOwP3VRFOl1Z5x6lumkD
	pNZpsE5p6p4CcxUnh9PE5A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxur18-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 08:40:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uN7q7QZ6k4IxouH01hiEzLyQWwBMo6AMcffpgo743LUN9y7EMkQwcB3pna6QJQOvxm8XXl6g+FT582ecW8orqaSbyv3e34EzH7UwKm0zTSDopFKznwuj8m6q4N8SAtOUqGTwye+f2XvD2eLDB3/xJySPidrB/uKeGCIM5GkxP5MSmENOWP280k8NCJQ2VjSV4+kVfglVbjBs4hL0awaGCHbT52xRTSqQ2c7PFgDURlifgUo9LFj6dK/8WoBz8mRtxKuN+2McW9IjOgbfbBDyC8PRMKuzTgRQWLrTDZ+1tLyrJjm4csMzoigqcMsfxTK0wxUzAcYw4jng9efVLaNESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iuzLszjgoMEOTRj87tcHoYD732QLPd4XlRN9zJMvKU=;
 b=FFtPMxYsZR7bBqsrREELaQ0ajOSeCqDy08qWBtW4m0LDjC+Lum82U0VraUSQyNVQiI2w5NkMmTEtococR8op//Ny0FKBBsMjcx2dWFf/pchbEFDBorEpmiWfqGsjDBdErfV4JeYSJxrsRTJpTZAmtI/GFgWwCpSTdDnygDYN1cE4swb0pdqMp4YuTuNqxj16jGGrKDOfKJv6kKr3NdyuIafR3TfbCj8Mc882QvVZ29qvHL0XxNngEWebB1zEHnXQh1b8jDUcBjUjkQDP8pV0ykB5+ArD6XfsjjyVa6CgnurlFuPDwGyJpTfB8OJiSaZuCzaBOQSy7MQptIJwv638LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by BL4PR11MB8845.namprd11.prod.outlook.com
 (2603:10b6:208:5aa::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 08:40:11 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:40:11 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] media: i2c: ov5647: Convert to CCI register access helpers
Date: Wed, 31 Dec 2025 16:39:22 +0800
Message-ID: <20251231083924.2657165-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9159c61c-21ef-4e02-0629-08de484835f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LEsXMVXyQ2Xk+NxfDZEEfR+TPFqOMAU4nlH0KU0CSptXPMqlTnSSX28xITIX?=
 =?us-ascii?Q?Q6RdwAQH7r88Ooo4dbHS8b9Ucnm3Ejo6CXLv8NF0NjPMw8YXo9MN7a67IlCS?=
 =?us-ascii?Q?PuI5fNInXgZdmw7nGPZvL2JJxuTjStb/nZNZ+AsVmRUlnRF7OaJSZcqEAsvS?=
 =?us-ascii?Q?mdklwX47gWLQeFs5oHsLcafGTHdy4E9jvR8Cpdpu/aNa3xw7Sy351aPc0JN7?=
 =?us-ascii?Q?FSKgIRVlV6xcbC7WuUSqIoA8N+23ZWH47vC6Z9VzgiI85BbSW/opVMHvaPbe?=
 =?us-ascii?Q?NKYSV6hxZiHIP3vV4F67KEfgajtb1BGCOVxlIBG1rA1rfCl0QU09ErsL1TqM?=
 =?us-ascii?Q?cd+eGNTxQO8QmIWfoLOSIUIxLH/2LRAlHXdCmqdJBfSqd4lMcO0Bj00uLWVq?=
 =?us-ascii?Q?ahB0K1YHbUYPkDN/kKLwEw4Pyo/g38MnYgIaLiK2hrYo1sc6SIO03SvWHPQr?=
 =?us-ascii?Q?3OeXKAIvfTYsJKwxSXe0KpE/LeIgxUtVTdOZ/V79c8wks4tanYCgqvr1Enyr?=
 =?us-ascii?Q?G/Ux2Ndq+nXnH+sZn5BRoCU2KK5Y1OVDDzcdl03iseOGroTgNXxqW5FcvECA?=
 =?us-ascii?Q?kA/F+fVbUk++lhcDUj0bnu1s/824ORD+LroVD8UktVTDZ8IcWpama+IEPf44?=
 =?us-ascii?Q?HnAf12yCsBZG3YYKCRH0ARwYkkFautsrFRw2QVW8slqGnFCOcJ8dORADWZuM?=
 =?us-ascii?Q?SlGdXrpMNAgofdEIzUUfoVrhOaZCeiy1JruwZbNHbrEzFlCKplqHqPwN0aKL?=
 =?us-ascii?Q?E8W2ZoA3661BIbsQTsW7BU0rycTAGnYN13GxslBZbqQoJ5UmUQZJxN6IfXWi?=
 =?us-ascii?Q?BLoBJqbxbuLXiJ4iXQGB3IIKUJZX9m3veek5g358seNHRwMMheox5Dfq4mYN?=
 =?us-ascii?Q?09P3XrpMGgLw07q0bwOI0QUEUzCRuU/IrbiND1h084u0NauWPDcVBafFCrs7?=
 =?us-ascii?Q?9rAE/zvDsEyhN8T+W7sZj4AJtvl33IReSEJ4Uloi8apxte1z1mJ6cLNiU4nZ?=
 =?us-ascii?Q?WVXxBDczAys8gP8GbbAZaA+bGjZPnrQAf/aOZH3pt1XYWPby3GvnMJTYeaMJ?=
 =?us-ascii?Q?d2ow5wNkhHS3Sen0TWxD8MDJVodAWSfvpBR7f4PJEsvuXglznHwnWmr5JV6S?=
 =?us-ascii?Q?Gx8U0UWADnW6tOIilCECw/Hq3jseSBqyAL+VYq70XKB+73MKes6BzZVMsIbV?=
 =?us-ascii?Q?GXcnPjApwAIT0JaL/SFrwoYuC8wOTBmaN1sSdkD9eUWb+TesEuR8zoIes7nO?=
 =?us-ascii?Q?rlscsZpCRRI+VjN2K5L4YX6X8Yjoofu2psg2BEwG/rR+HQ10Ah5BdrixQHQ3?=
 =?us-ascii?Q?ryDjqRacOkamaRaTFAJrNaaQQtXwTetsCCFXNZykLBFJx9Gjf5nzVHZPalEh?=
 =?us-ascii?Q?1GNXaDJ+Lh5kZjBiiXWSu0NjVA8MgvKvIjJm+wS3Syp+M1XtBPuJ4k/EQqmR?=
 =?us-ascii?Q?BPcSbGYAyfxQVvBw/TnpYBrs6Bva2KYG5l0DriGHR+biOBXVPJrBTLBWkz94?=
 =?us-ascii?Q?8Ei8IHFMWxeBcfpVV7MPndXKuvc+6qfg9EpKLHKdiV+o82bkdHanGFn6rA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RCYA+OtTUvbSrQf7ht77XRNdtKCJYOdsAA6vyFy5bttZf5+WrHCybX4Ivti8?=
 =?us-ascii?Q?BVQ4LvgvscKLgmj+yas+xhuPpaHU0XrsyaMMXRiIGH5CEOZsV/JqIPXyKhDj?=
 =?us-ascii?Q?Uyr8+5FU5v5pDHRJREPP48NxP/p1LYrCKes5Yr7LqSETIEqR7d16EUeyFUXM?=
 =?us-ascii?Q?7+NuIQ6b7GNv2BYhG/wmOh5r9XvorajsV84DWAxrJXO8IGhjBHSRdqYNzNNo?=
 =?us-ascii?Q?Ugw3LG6sga4APIlYbP9GxLDj9cl7bCiAeqk/TahcEDzxG3vcECy/Nw1n4ETY?=
 =?us-ascii?Q?PVpLYWM/SPyDP+a+cnB4GfaOdWHU3qy7fhZwsMIYbCcYlkHIXk8g4Xu8KwuY?=
 =?us-ascii?Q?E+N4p5HZKnrKUkeXMJIuSvvHrSqZKGwOTqfw9XiEtKRLMIbEjhJCyt/J+M3m?=
 =?us-ascii?Q?lQqwZ/zBA2RDgli+uQdrzniQjGWiR64EFLXLg1AtXh9OQPydxhlxEFxFxJBU?=
 =?us-ascii?Q?oLAd0g8VR4jBhYhF003ppuf+Z6edlbzvfffOyUOvlgMtEGlbbOp8BoNFaSiS?=
 =?us-ascii?Q?cqcj4jJ/lDZAuDjpu52H9cNQAc1GkPUB6Ba6Gd5fybUMFXU22igSZ7vk/nri?=
 =?us-ascii?Q?AKGPksc7rEWM+6Dg/ae4ToHhMOk2zBHfhMYBn4O5uZq7HyRki6oe/vdfzSZ2?=
 =?us-ascii?Q?x+SeAS5jmgJ4ZP9TzCZSU32rVoPHFHNFX6HOCLaL5bO7494nSCe5iu6HUIaj?=
 =?us-ascii?Q?kBXfnqutEgwZ4g5qTjielM/D+ErFi+zn+eAKPcPQHR+iwsnouFv/jdfKRL3H?=
 =?us-ascii?Q?puSjDOZmEbUq6fKWEYnIZyz7PMD+cQQAdQlvjDurP7SFx27AwGx3ZTtNnp11?=
 =?us-ascii?Q?9541BOeMqYFJb9GqsS5EQjgoaQm+0RjUXsJ3l3UxsVKJBntIprIRs5aQTfS9?=
 =?us-ascii?Q?BnL9EZo7VXbnZiX1t1KvKmjopluIt0IFLtuPoRZc95TptlkfVUnZQwJ38Rqr?=
 =?us-ascii?Q?XOXNmmN6p/Qxj7vHvGe0MZPMZ6ZjGVvdb1aqV3IuITysHYNK/0AyI1gTQvFR?=
 =?us-ascii?Q?w4opIlCfpebqD8bUebELnbb20BPJRfcNr+pTTHiaun5d8wtm2YRaE0jrbSqj?=
 =?us-ascii?Q?4Frneuu5uhqUsdkb7aGwANuzEqSPlMuXk/l7x1KI7qpPdeSb6Rn3LHy8i9W9?=
 =?us-ascii?Q?VGEKriu8XegVKNV3CEQ8g4Ecxr5YqTjAASnBArKNjtIDkUyILjz4B6dmoqWS?=
 =?us-ascii?Q?iSODcLOBJv3b9/u37Lnzfb/oIu1Qhrbg4Nd8+gOqUaf5YzDG37dqqQBTGa1Z?=
 =?us-ascii?Q?wZta181h/tTk95g+pjUQ5uNmsR4m6d8vDILLnHYxHK8qsSHM9Nn1H3arqtRU?=
 =?us-ascii?Q?k5vCrK4CGU4/tzZ2NL8NTKJr9n0eeQlh839VeQ/5CCHN+Qftbis+5ZGMpqzF?=
 =?us-ascii?Q?z+nvUmdUzu+ew0fwRh4rBOAkqRWb1DupDeLr3Xr6vCPVCryGUwgVXHKJPx2s?=
 =?us-ascii?Q?U/PsNXULUCqGUFd6Y1VaQwMUC54P+btJ7grT+iptN9msZ8nrP9Y+HJnFryhf?=
 =?us-ascii?Q?twwMJLqNZeNv0iBkA327nbx2ipIyznJL+CZDZVyfwd4XQW+r5j3vqWpSjQAv?=
 =?us-ascii?Q?7K2xKhNnX2y0qPGnZ3E1S57RaV8W2V8q1XxHCmZUCnUJIvzfOdXRUGx/xNCq?=
 =?us-ascii?Q?aDJOrygkoXfwxIkcA89GCvHYSRswpnsUtU2+hRCzpqnR9MbtUnPZrB13n3Je?=
 =?us-ascii?Q?pg17UDNNnrXZWEpu0W+griMH0OlgIouS5ccw2BRzww7ZZHSc3nDAr9z9KZ5T?=
 =?us-ascii?Q?sfogIxoiFgO+/SBGDgagLvEpOIqQXwM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9159c61c-21ef-4e02-0629-08de484835f8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:40:11.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdHRCtALCwOUH/2lYJWDmsTuqYQKg4Cl/pvUCb25hpyclKmMZijrVCdC/YIuYSKQsRHDOYsoIPBKDh5IU7W28flFGR+AvZOfGZIsZUT/2H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXwl8veY3NxU+z
 k5WJJ2Os3VRd7pRZjB8jf0Pu59orxxHjxjSFYFp/8Gcfommi/axWpea958Dd3ZR/7CWjHUNZ5Ac
 eIOdS21J3nZzo36GdEVW/z1ntDPMNRb6yR2FUspgIfPwjVaoGLSbfusaOnoKd3bUrDncrH8VAuL
 frmVTZgPle8UaDrwEHIiig3BkYF7X07qNQyEmrftfocRVu8crS68J+gdhyRzmVMvgjPyFOlMYKJ
 h/+q5j4Gnn0xFa4SA1y0y6ntbhb4yGBYmVyEi2XWqZS+eWmYbvJqooUh2hOr6uwZWBHDKtZP5uB
 ZmqQ7od9gxT0vb+f05B+bLhUzvfKRbR/kLjZR9cdI7er+jbJVXMlA/Z3Vby4L57pkcVfWtTsuUO
 /5Q7RUV/6JFjlE5Sc4IOjodRuofQDrwjAKCy6kdbibJc1k6GU6n67XiwgYouDp5AxlTBzCg/2L9
 3vNdpY6SlhFncPtaVAw==
X-Proofpoint-GUID: PGjjunPWmJa6WUAUIuPOYES1_2RG4seP
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6954e16d cx=c_pps
 a=e/sPstj0vE6DIEdYTBOJlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=MXDipQL8urO0Dm17wfcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PGjjunPWmJa6WUAUIuPOYES1_2RG4seP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

Use the new common CCI register access helpers to replace the private
register access helpers in the ov5647 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 289 +++++++++++++------------------------
 2 files changed, 99 insertions(+), 191 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..cce63349e71e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -529,6 +529,7 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fced..cbcb760ba5cd 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -20,8 +20,10 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -41,24 +43,19 @@
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
-#define OV5647_SW_STANDBY		0x0100
-#define OV5647_SW_RESET			0x0103
-#define OV5647_REG_CHIPID_H		0x300a
-#define OV5647_REG_CHIPID_L		0x300b
-#define OV5640_REG_PAD_OUT		0x300d
-#define OV5647_REG_EXP_HI		0x3500
-#define OV5647_REG_EXP_MID		0x3501
-#define OV5647_REG_EXP_LO		0x3502
-#define OV5647_REG_AEC_AGC		0x3503
-#define OV5647_REG_GAIN_HI		0x350a
-#define OV5647_REG_GAIN_LO		0x350b
-#define OV5647_REG_VTS_HI		0x380e
-#define OV5647_REG_VTS_LO		0x380f
-#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
-#define OV5647_REG_MIPI_CTRL00		0x4800
-#define OV5647_REG_MIPI_CTRL14		0x4814
-#define OV5647_REG_AWB			0x5001
-#define OV5647_REG_ISPCTRL3D		0x503d
+#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
+#define OV5647_SW_RESET			CCI_REG8(0x0103)
+#define OV5647_REG_CHIPID		CCI_REG16(0x300a)
+#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
+#define OV5647_REG_EXPOSURE		CCI_REG24(0x3500)
+#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
+#define OV5647_REG_GAIN			CCI_REG16(0x350a)
+#define OV5647_REG_VTS			CCI_REG16(0x380e)
+#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
+#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
+#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
+#define OV5647_REG_AWB			CCI_REG8(0x5001)
+#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
 
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -81,23 +78,19 @@
 #define OV5647_EXPOSURE_DEFAULT		1000
 #define OV5647_EXPOSURE_MAX		65535
 
-struct regval_list {
-	u16 addr;
-	u8 data;
-};
-
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
 	int				hts;
 	int				vts;
-	const struct regval_list	*reg_list;
+	const struct reg_sequence	*reg_list;
 	unsigned int			num_regs;
 };
 
 struct ov5647 {
 	struct v4l2_subdev		sd;
+	struct regmap                   *regmap;
 	struct media_pad		pad;
 	struct mutex			lock;
 	struct clk			*xclk;
@@ -130,19 +123,19 @@ static const u8 ov5647_test_pattern_val[] = {
 	0x81,	/* Random Data */
 };
 
-static const struct regval_list sensor_oe_disable_regs[] = {
+static const struct reg_sequence sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
 	{0x3002, 0x00},
 };
 
-static const struct regval_list sensor_oe_enable_regs[] = {
+static const struct reg_sequence sensor_oe_enable_regs[] = {
 	{0x3000, 0x0f},
 	{0x3001, 0xff},
 	{0x3002, 0xe4},
 };
 
-static struct regval_list ov5647_2592x1944_10bpp[] = {
+static const struct reg_sequence ov5647_2592x1944_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -230,8 +223,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3503, 0x03},
 	{0x0100, 0x01},
 };
-
-static struct regval_list ov5647_1080p30_10bpp[] = {
+static const struct reg_sequence ov5647_1080p30_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -320,7 +312,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_2x2binned_10bpp[] = {
+static const struct reg_sequence ov5647_2x2binned_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -413,7 +405,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_640x480_10bpp[] = {
+static const struct reg_sequence ov5647_640x480_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3035, 0x11},
@@ -594,109 +586,35 @@ static const struct ov5647_mode ov5647_modes[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
 #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
 
-static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
-{
-	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 4);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-			__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
-{
-	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 3);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-				__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 buf[2] = { reg >> 8, reg & 0xff };
-	struct i2c_msg msg[2];
-	int ret;
-
-	msg[0].addr = client->addr;
-	msg[0].flags = client->flags;
-	msg[0].buf = buf;
-	msg[0].len = sizeof(buf);
-
-	msg[1].addr = client->addr;
-	msg[1].flags = client->flags | I2C_M_RD;
-	msg[1].buf = buf;
-	msg[1].len = 1;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret != 2) {
-		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
-			__func__, reg, ret);
-		return ret >= 0 ? -EINVAL : ret;
-	}
-
-	*val = buf[0];
-
-	return 0;
-}
-
-static int ov5647_write_array(struct v4l2_subdev *sd,
-			      const struct regval_list *regs, int array_size)
-{
-	int i, ret;
-
-	for (i = 0; i < array_size; i++) {
-		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 {
-	u8 channel_id;
+	struct ov5647 *sensor = to_sensor(sd);
+	u64 channel_id;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
+	ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
 	if (ret < 0)
 		return ret;
 
 	channel_id &= ~(3 << 6);
 
-	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
-			    channel_id | (channel << 6));
+	return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
+			 channel_id | (channel << 6), NULL);
 }
 
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	u8 resetval, rdval;
+	u64 resetval, rdval;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write_array(sd, sensor->mode->reg_list,
-				 sensor->mode->num_regs);
+	ret = regmap_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
+				     sensor->mode->num_regs);
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -706,13 +624,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (!(resetval & 0x01)) {
 		dev_err(&client->dev, "Device was in SW standby");
-		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
+		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -725,7 +643,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
-	int ret;
+	int ret = 0;
 
 	ret = ov5647_set_mode(sd);
 	if (ret) {
@@ -742,32 +660,25 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
-	if (ret < 0)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
+	return ret;
 }
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
-	int ret;
+	struct ov5647 *sensor = to_sensor(sd);
+	int ret = 0;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
-			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
 
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
-	if (ret < 0)
-		return ret;
-
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	return ret;
 }
 
 static int ov5647_power_on(struct device *dev)
@@ -788,8 +699,8 @@ static int ov5647_power_on(struct device *dev)
 		goto error_pwdn;
 	}
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
-				 ARRAY_SIZE(sensor_oe_enable_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
+				     ARRAY_SIZE(sensor_oe_enable_regs));
 	if (ret < 0) {
 		dev_err(dev, "write sensor_oe_enable_regs error\n");
 		goto error_clk_disable;
@@ -815,23 +726,23 @@ static int ov5647_power_on(struct device *dev)
 static int ov5647_power_off(struct device *dev)
 {
 	struct ov5647 *sensor = dev_get_drvdata(dev);
-	u8 rdval;
+	u64 rdval;
 	int ret;
 
 	dev_dbg(dev, "OV5647 power off\n");
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
-				 ARRAY_SIZE(sensor_oe_disable_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
+				     ARRAY_SIZE(sensor_oe_disable_regs));
 	if (ret < 0)
 		dev_dbg(dev, "disable oe failed\n");
 
 	/* Enter software standby */
-	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
 	rdval &= ~0x01;
-	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
+	ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
@@ -845,10 +756,11 @@ static int ov5647_power_off(struct device *dev)
 static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 				      struct v4l2_dbg_register *reg)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 val;
+	u64 val;
 
-	ret = ov5647_read(sd, reg->reg & 0xff, &val);
+	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -861,7 +773,9 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
 				      const struct v4l2_dbg_register *reg)
 {
-	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
 }
 #endif
 
@@ -1089,33 +1003,27 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
 
 static int ov5647_detect(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 read;
+	u64 read;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
+	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
-	if (ret < 0)
-		return ret;
-
-	if (read != 0x56) {
-		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
-		return -ENODEV;
-	}
-
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
+	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID, &read, NULL);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     OV5647_REG_CHIPID);
 
-	if (read != 0x47) {
-		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
+	if (read != 0x5647) {
+		dev_err(&client->dev, "Chip ID expected 0x5647 got 0x%llx", read);
 		return -ENODEV;
 	}
 
-	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
+	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
 }
 
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
@@ -1140,70 +1048,62 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 
 static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
 {
-	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, OV5647_REG_AWB, val ? 1 : 0, NULL);
 }
 
 static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 reg;
+	u64 reg;
 
 	/* Non-zero turns on AGC by clearing bit 1.*/
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
-							: reg | BIT(1));
+	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
+							: reg | BIT(1), NULL);
 }
 
 static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 reg;
+	u64 reg;
 
 	/*
 	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
 	 * clearing bit 0.
 	 */
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_AEC_AGC,
+	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
 			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
-							: reg & ~BIT(0));
+							: reg & ~BIT(0), NULL);
 }
 
 static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
 {
-	int ret;
+	struct ov5647 *sensor = to_sensor(sd);
 
 	/* 10 bits of gain, 2 in the high register. */
-	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
+	return cci_write(sensor->regmap, OV5647_REG_GAIN, val & 0x3ff, NULL);
 }
 
 static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
 {
-	int ret;
+	struct ov5647 *sensor = to_sensor(sd);
 
 	/*
 	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
 	 * which we leave as zero (and don't receive in "val").
 	 */
-	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
-	if (ret)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
+	return cci_write(sensor->regmap, OV5647_REG_EXPOSURE, val << 4, NULL);
 }
 
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1254,12 +1154,12 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_s_exposure(sd, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
-				     sensor->mode->format.height + ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_VTS,
+				sensor->mode->format.height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
-				   ov5647_test_pattern_val[ctrl->val]);
+		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
+				ov5647_test_pattern_val[ctrl->val], NULL);
 		break;
 
 	/* Read-only, but we adjust it based on mode. */
@@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto ctrl_handler_free;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(sensor->regmap),
+				    "Failed to init CCI\n");
+		goto entity_cleanup;
+	}
+
 	ret = ov5647_power_on(dev);
 	if (ret)
 		goto entity_cleanup;
-- 
2.43.0


