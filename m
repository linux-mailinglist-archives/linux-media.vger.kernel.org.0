Return-Path: <linux-media+bounces-60767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPS2EkFW/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:07:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D40004E585E
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 830973059C48
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 09:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7E33A9D9B;
	Thu,  7 May 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UmXr930S";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UmXr930S"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91743AF643;
	Thu,  7 May 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144646; cv=fail; b=Ju/qRw6yT3dv/LAYEjPOQUURx360U8NAWeNxV1yGAgV03+I+AIH7CuNZ3SYvm0qzwUnGkP+jrHsr+BnD7vbTNB1vPlbAGfFyZwoDduXF/W9E4popNN0M1utgDK8nI7UkZ+WjDHWfmnKFVvgnOHgJGs0anOm8bJFF2JrVh8JKEFA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144646; c=relaxed/simple;
	bh=LSmbTPFeLg5A54BSIkEDSYbSpNTwgsxZyfdEDP9Typs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=djyoXzoj/RKxnmlIAIEXMIDo6NKEuDaieGHIkumNcs6oQlwNumR8qrNwkqs0R54qtCkc6y+8Aug9zfiCkJsDeRl6Qv9it3jVTil6vUZa4P6L7heNjQOBIi9WJArfFLLeRTC4T/7ABhkOwwiMwG45IIie1MibPWDYiN9k/bmaIRw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UmXr930S; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UmXr930S; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JaVPDLzoFMGlVWswQI90aXUWM5ym9xObmWHYQwpRKvNf4VDe9PX5mIfH8Sn/sPQN0J3Qvd/QP5M36PKJh8hBegY19ciVepxShUJSyTJ7shaVHFcbIL72Pyf4Qz4dPo8CJ3hR/37LUMSy/0aHbWdy+2rvwiP7/RXyP4XjpuaEW0WRxkSS3G1KyiXIhfg4qnW4TY2yTEbKpwjQxYfLTW/AwSPPVJHw+TLSDFwlUxWnclgS6CNUwcQyu/5lrIjY7HppVgOlUT05GisuGoDtDuZdqGrzp9lOO8ZJqMQqbldxZBqYHIs46TOA/4mDFGL/G5/BLPC37mbOBpQFlaI1X8iXuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKRDwNHO9CCOWjAuV2t7h3EkjZpo/JcMPvzaQJBw8UE=;
 b=AIMt1TIB1WGdYbZMiGI3MiWDjZjxozw9wvzDnhQn4PJNzoOoAlsvkHf5+h4xLu0SXYLswsnAsChqktjVoTDYB9wSBNWqSe6AcC7AAnleS9IICVVnF3fwREzV6gd+Ndqt1vG+LMUBtWFTS5c8rOpGYGTONdd+acmHAl8gRTg2HYpBHKo5J5KWwGbMmel4i2KKfojHkohZ8qJiBPfDKTH9g0SkBfeVpOVwMYCYLtGASNFb9/7RA2o3FhQQJR5COUn2AviX8UsAM8cC0/hHpGBMMEO20bMmC+ojBQOheSl8Su9fbFsyuWVTgv7zS4XPbBAMHCW7U6mDrA8tt0AEjAaQgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKRDwNHO9CCOWjAuV2t7h3EkjZpo/JcMPvzaQJBw8UE=;
 b=UmXr930SmYZf8KzIPx5ni4l7KoRwmJhd1dB7ffQ5AuZJ8wCQTA7OPlC5jEl8W66ginn4h+4p9/x1giNAZkSLK+0Yc+AQldDxWNoGF33ff+smcHGlH3NL2hl5xMcB3a6NOV/8gvxqWQDgVBoNFgYjdiBAstcHQfj5uJ9jmFhgoEo=
Received: from DU7P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::29)
 by AS8PR08MB5896.eurprd08.prod.outlook.com (2603:10a6:20b:294::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 09:03:50 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::13) by DU7P194CA0013.outlook.office365.com
 (2603:10a6:10:553::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 09:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 09:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vchLfvXcp1FeT5MRB1Rymxi8FdCVkBZtar8yMCBJAxZaalf0AoudpP3VKcM4q1VmzDYKaNnsH8woNXluAKmc/96onwY9xecT+c6sxS18rl/kQeq6p4pp1LC7oIAcsX2+4U7pUNtn1ra9fH4tmBWO+y5q+2gzbcTToTtg8T4WaWpjbVU0eUHQEKqwicyJJWF/1lyYAk68sjVQwKmJG7keplpnsm2XhNXPzWpu3uMs49gTdpls1Hf/GzWgzKYutqXw1GUbOGeUKxS6pqYj6fdNV9vf3ghN/dkr+ktDzrBLr+dzwEf6EYh9L6j4ke562oHkIABJdTrkUPAbm/8hj2kmzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKRDwNHO9CCOWjAuV2t7h3EkjZpo/JcMPvzaQJBw8UE=;
 b=uBWLjFiXpoHsTxGpU/vbLdZDPf9eNsLwIhhH65b+b8PHmS5B8eypQ4CnwYzApsDm1R9b60USpg2dQ/Sf+fZWYPcdNOWtfXA5waGjV3mstbXBFrjWZK/LBmGNjkaA9OM/i8jGgj5ck+rb+MNq8Q6ZZ2w+SAFxbs9jpsMWP4vIf5bDOSyqkU1rxM4haWUiyA35Uq4WZQbziMiKYhVj5C19TPeYPcoUi3OVRY4dkzqMdjwwMNcnfiA12YiCaPV0iypOb1VzbOh2KMi3pPow51vOsUSNImqJcCHMUlTIKvQU2qeW8LP4Fsx5kRxIKxC03lvXsoI8JulVAkOq8X1IiWa7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKRDwNHO9CCOWjAuV2t7h3EkjZpo/JcMPvzaQJBw8UE=;
 b=UmXr930SmYZf8KzIPx5ni4l7KoRwmJhd1dB7ffQ5AuZJ8wCQTA7OPlC5jEl8W66ginn4h+4p9/x1giNAZkSLK+0Yc+AQldDxWNoGF33ff+smcHGlH3NL2hl5xMcB3a6NOV/8gvxqWQDgVBoNFgYjdiBAstcHQfj5uJ9jmFhgoEo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9996.eurprd08.prod.outlook.com (2603:10a6:102:35a::11)
 by GV1PR08MB11050.eurprd08.prod.outlook.com (2603:10a6:150:1f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 09:02:44 +0000
Received: from PAWPR08MB9996.eurprd08.prod.outlook.com
 ([fe80::5856:8db5:9ee6:414f]) by PAWPR08MB9996.eurprd08.prod.outlook.com
 ([fe80::5856:8db5:9ee6:414f%6]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:02:43 +0000
Date: Thu, 7 May 2026 11:02:26 +0200
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <afxVIuVVPisBQ9p_@e129842.arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505181523.49a3d85c@fedora>
X-ClientProxiedBy: LO6P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::6) To PAWPR08MB9996.eurprd08.prod.outlook.com
 (2603:10a6:102:35a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9996:EE_|GV1PR08MB11050:EE_|DB5PEPF00014B9A:EE_|AS8PR08MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: ad911ab8-5169-4bd0-8354-08deac178e16
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 K2xq1PP1A6l1UvXWdW+Bj3nc83B+6K+LRaqYD+uZ3voE28di9ZdhYBdJ+10lN0zlphXI7fWHUKsHiSo8xKRGY45ZpNodTZJ8cuBZgt6WIUiw5r8PqsTFSxY81ZEG9OmVruVbyqdcJrLej/kwzLtEupdhZiaFFAwQA2ZD7ktQFC5VrQpnexOP7/VjMyDS0Ma+Rud5eg8TkO+qxkiIRXgUygEYc0mK0YVKi/pGw78nIY6LqcUCNM04zfq1Lm2u8q7bSZ5wjrCGJmUpuWj0mGqZT/lVn3ij6mxzHCLxU38m5N96dSq6QCgnVI9QQ21Ah4aVMbxWvuT1CClG4utEilBmnxV/acmr2/ahJzYOChXIW/nMA3g5mjDoqwbeTot4lhfq9x9i4dSKLJoN2NcUTAwtH6ZycNkv8/mRM8oC4qKz6OG31i/n8K2mSSPlyJCrLv1JqJkGfwphZTiPOIE3gc8QrtDbTdlweqRqMzSsglTZPVIWflyrXgu/0LdHyWTCsbo3408kdolhybyi7Qivo3+nx6qAHwQkzHV3YOwe/vI2aWeHv6vt/Bt8dqF3m++ubE2tag2NrcsVYWRpRv+BT0ircb+Wg+grvBlnRdeFEmUmD31wSRDX9aQ9IWVlr+amVxx7z10EXySFtnHjoFwnuLwwrCKT/zKTKwT/Fr740vOTzeKBwMIvGIbWEpBtF2Kft78J
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9996.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 XJ1T6EoheAt6U+FREPkCNk9lmTPcfzSATSqW1yw+CL0VauPjAPvg0atTwGy6E2XOscgZriGtllJzvEMDByJ4mXxl/Ewd17+joUZcDGAkkNpoorbenAno8gaoJzpGnd7tBaucC1+bzNRn2jLbBwjfwuAj4DuBctHLOiNP3BFJ0924yDQhuVvuzerWRC3DBzOMlXTwNn+ocgGK+qu7RLmxsTOn2HXVIofFOfw8ZFtSeVo+D3yPyzzdrCxlEm+y9q52IoryKTY8yY5td+OF83hiRJWkaZwxBNKp4aCORgcJPmzxpzAwQj89zk9lpksBqnqxrRQ+mwyr1BnUbNO5VI/XOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11050
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a30f35dd-b7e1-4ff8-fb75-08deac176625
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700016|7416014|14060799003|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4PMk609cGl8yM/iCXDNq5MjFLTeHOukpC5pJhnfVbfogGwBsn5pIpif3fJhaCOG9DbPAuTTMEuA6IfI2Q0HZsPj5q7U1Ji+KAOM8FteiWOL5bgewPeYl/k2w2Md/Vi3gzTybGSFUUxkFM0llVyEPrxEyDSQzY7CkLIXVhA4mYeJWF1I6KteFe5XCKM07NTIwGWF0wDp8P7LRrY5hEgOZ9aPI+5Hn03JIA5o4kD5wYPlY7AEC5oCyOK2zKyferyuw8GFn4DRJzwBSmGc3JR2OBtwpMDHF/+ycijpTdfVGRRUdMDg/FvnhIZJ5ESo69SO4DrrgL0N2avMSm2EmtkYjGrEctdglGVZRzDx0ttq8OR5TNggQG1qW8k0xsx3UvBa48p6WBTWCPGkv93W7wJUMaA3zEjAykwnB5IMen0mmiIdmwphVpmpWt0s2S80WVKWFrMA+LYecfMgLxwmTg3xLWM8XjsxIZsemBKlTd7E6oke6Ejn3sZifEizoQofBt2dA0Zis2tstRAQ8uKX8vrCJ+kUiECCYcZhJgBXqlulbXbA5DVwREYK2XNWUWN0qlmIcFEmygQAiNVdVFt67mtPimnJG4yH3EpnKvvo5hxoOw8heYVnY4NAr0xjBSPzDE6mDIFl7wXPQhLdOcTq2RTHYLl65psdzQDNbyYVZdx/wAA1Uz0kLogqsJ7z5wyHctR1LrSPDw74THoT5b3dE+cj7ZKO2eVglJpNevoNi+5xG9wo=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700016)(7416014)(14060799003)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QJWvgALR1WNRC/tRN7VrsCzAf3Sm1moslUv4ThmlKKZEXxBFtSs3iaYs3DQarPjewgLny9TBYL7//x2E5/Rkzq6lSTm2fe9fdT1tWdMnPrsUkqcXYEtCX8nJ+xtnbVmZqrPEOY/I6MsfHaVkIpE5G0mlMCsNeQ+j7mqLvACpwIEqMC+06VuElmspkuE403j6m3vHZ1VZ+BE1YyPOTUPpyLz9rbwZ64WMZMWZliJ+sXtoDR5Z2rzXTXpsYmaPA8P09wuP5u1V1ejspl+jxwICVbreAq7GebtqHXWlovOtIw4vPEAkO7hXpgpCIVx/xY6ysq3IxDEO/gVW9V4K1BBigyebMooHZ7J2ebjniigoc9BAI+nbLG6lcBWzSIjIezAF/MfMM6GVT6G4OVo8xwMT+/PMDONZUrB/MKnaTXMIcDWP/r/U+qO5u9D45kH1roa7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:03:50.0262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad911ab8-5169-4bd0-8354-08deac178e16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896
X-Rspamd-Queue-Id: D40004E585E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60767-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,e129842.arm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcin.slusarz@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
> >  			return ret;
> >  	}
> >  
> > +	/* If a protected heap name is specified but not found, defer the probe until created */
> > +	if (protected_heap_name && strlen(protected_heap_name)) {
> 
> Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
> name is "" already?

If dma_heap_find() will fail, then the whole probe with fail too.
This check prevents that. I'm not sure why it's needed at all, but if
it is really needed, then s/strlen(protected_heap_name)/protected_heap_name[0]/
would simplify this.

> > +		ptdev->protm.heap = dma_heap_find(protected_heap_name);
> > +		if (!ptdev->protm.heap) {
> > +			drm_warn(&ptdev->base,
> > +				 "Protected heap \'%s\' not (yet) available - deferring probe",
> > +				 protected_heap_name);
> > +			ret = -EPROBE_DEFER;
> > +			goto err_rpm_put;
> 
> If you move the heap retrieval before the rpm enablement, you can get
> rid of this goto err_rpm_put.
> 
> > +		}
> > +	}
> > +
> >  	ret = panthor_hw_init(ptdev);
> >  	if (ret)
> > -		goto err_rpm_put;
> > +		goto err_dma_heap_put;
> >  
> >  	ret = panthor_pwr_init(ptdev);
> >  	if (ret)

