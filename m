Return-Path: <linux-media+bounces-57001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAhMMx7Sw2lLuQQAu9opvQ
	(envelope-from <linux-media+bounces-57001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:16:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D603A324A9E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B1BE3112E72
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E583CF693;
	Wed, 25 Mar 2026 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="XZau83i2"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021083.outbound.protection.outlook.com [40.107.57.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3A3081D6;
	Wed, 25 Mar 2026 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439216; cv=fail; b=V4Mc1Zhk259vN6I1SymcLVadfz4nw6h7XX+R1bIPZF9aQQG4Z4fXrf87XTcLAZbiGKmmQf0t8Pe5mi94dmHPtjjxw9v4mUB4425qfnUZrTP8Z9y/t0EcyGHAnavnPifY9615C84/IXSoDOT3NCDPAMPomZ2Bc4tBQGufYJvh0x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439216; c=relaxed/simple;
	bh=jID0ug6HmShjBYt3ZuqJKgOLWLaJUSceMq5o00lyJQc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HAslO8eq/SjIyJ2g5Yefk/WszQp9oTkiEd8HbQsFgxIatz34F93qGEyEC3W3e1AybInNzqNXA+94XOoTfMvG79gg/mZpJ2r0T86I7umWOn9y+Oo4V63Ni92Bor1j7ynkG4Wl5DWEjQCYaDtRdfT8VFsadYGK9VhUevtpzwsnefE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=XZau83i2; arc=fail smtp.client-ip=40.107.57.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLfbDnKja2bd6RXLn/YvUMq9hjP2TJQgPKkE7Lj0874g0lT24c2/PTbewNyETBOIMwGDdIaWrv4Rxli89jxLyMMmkEjSGwlTsaHijth+cpvUYBVjCxFFxNJaDy+yETzoGJ397PMzwg16/C+NEe2JiAoxE5CpXzM9Paih/7OnOSh3FtSEuKB1IZlhIboRfHIpZhIWhUGaplRo1NaMmdNDnBNVuj7yj7rUXkleITfo3vVXi2Z4NyIDfR3ISNVP9s8kntH8VOMzpEiC+ZaSb44/rIu9kYHcgL+EcCC/Y5Pm1M0WuRu041YiGQmcikhHtBs0ev6M5koQsUTN7XIfQD/d7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xne9zM2rYlJnG6qauSG6F8jihDvJhbXQN6H1B4dvVGg=;
 b=mMmGwP/1VgW8V1G5u4nso9h7zrU9exDz6XhPpxAyPuW4zWNMN4AB7433trodaIquUUZQz6FRwJPh0KRVomAchxcw49rU9a84oH0wP1zCFqyJO5aqkZL9VpLgIVeqGwlrUvOeBiVk2TSqp/YqrR807HDEX9EQwZ6nylu1NQMa6z/s7U+wLBXQzVkXNgLe0/k9MDHJs55AL1vmEpaPYrxfa2qV0ofhg8hCiIIKj9o5JXKEOlQmNq9cMvXIwVKopazcb04u+gewxAEYy/SZ2TF1wfl2m+uP6DGQplCg+aw1vOamXjSkjj1JzbNqSU5CqH6GhTCXwOFgjxpTbQTWswgefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xne9zM2rYlJnG6qauSG6F8jihDvJhbXQN6H1B4dvVGg=;
 b=XZau83i25GKYim4gzzQ9/iF0h1KJFfrUOJ+EF5i7UJG7xkOlWM8egKzszkZ8NBF08Y/r9N30rosSDK8iEcL/XUlgTeeXyRfOdAotRI2KWywjsBkLHM6/PYi8+JOMUoSDBHfIMOaY3dWP3/VOEmwumsyfp7uaYuWTLX1an7nBXy5TQ3s4H5cfR62cnm/QeHLMGvLn+sXfMO/JXPuimh4CGMomifg8Ak3NLjC6qoq1qex6KpPxCLQVr6eDShJSxVJvJuk0jGIGb6jBAOixY9RtpgJGrVEJqvXSTF1XPRYKK2UvzQ4tMhYZ8fLU6YwHLZS06bN8qcWPe9Gl8nnCcBC1iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB4907.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:46:50 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:46:50 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add new features
Date: Wed, 25 Mar 2026 17:13:46 +0530
Message-Id: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MAUP287MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 662287d5-1fbe-4312-6c78-08de8a6433cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rfV/pISiKlx7e5r/wEBfpdR5v902cTdrC1BpZE2F8xNHwWkWXACsZm8HL0qKL7PzsOUBHu1SUBJnUuT/PmqLLlDPAv2eLLWvUDOZ1TDxC2hwfk12yhDaU3bIzDUv68j561W+XZG4hrt1JKB1lwqDSfJrx5TdSlYJcB7Rgl2h2CSfF4HQgiQK+36lsVZocOKj+pEjvAX3IzyS35Ugx6inyv2GM1Kt8AHvLewtyuNgoYvKNdTygWIffAcnhcVqwrF+S+3UWfbQ6e8fTRQKUO/n9FUd1XcjLFiHUteZie9qYGGQOGaBPCq4N4xWDiNHp0Q3yMRz8ZZKjy5tpoWstzbOVS5Thn5JjNheNvIgN0lgkpvwRbrdtOYUlTUGECF/fhH1KAMzZ1eooYzjAfIq7rvueq4dFWPtbpghwjNrGj0mVzgh4IJ1H0x/vFGTp6C4KLRonMEN3RuJxfYJm7hBXF2PIFW9yeER9xTFitPSkXDp8SHCdxs34lOonkLZMENakQkdxRspBd8O6R9Ftj77Uuem6M/XUlMx++0gY0nZvkoiNlm9RiZMdRXbkdU9y3mBW18YHN5UxJj+uCD3W90B8ib4H2hL6VjMtVNj2Kd0wZWJPnQbSFx/iVJ3z2EzymCL59fQxWKLTectmVVo0NJFlLkpCpUS9D2Zjlk5GzlNmey+7SjgHA7N9zrSdTLbD8ermYq9LwdVDAhZ2QwRqCg/lAeUikXLNX7PuwnVVw5V0vH+QL17svaDF7wSwJY/DqSSwUwH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUV5dFFuZCtkajNJcFRGTDM2K0pPcnpsNnB4VVNscU14RWZXeW5sd0xqZnRJ?=
 =?utf-8?B?UUY2YlNLTVcrTzlBR1FidWNRMXJzV3dQVS9YKzNCYUN2MzZISDR1YVJJQ2Fq?=
 =?utf-8?B?NlFjL09SOEd2RWk3N1JhOUFjN09CWm00NjBEQTl6dnQrQUtxWWpxNWQrTlIv?=
 =?utf-8?B?V05CM01DSklqemJuVkdlL2I4TVgyb2EzUENaQjZqYnJUdCsxTWJKMkI0Ri8z?=
 =?utf-8?B?YXhYUWxUQm1rL1R5bXBTOGhFREczSVhMcnRHZUZTeEp0OG1rZWhjZm1UUTVP?=
 =?utf-8?B?SzA0M1FBWnliT0J3bkdmZ1d5Y1pZbVR3dkhZUjdRZkpPc1IzQVdObGY3enhG?=
 =?utf-8?B?WjBSZWVvMko1bGFWS1BtVGFwanREd3FyR0JGSkkxUHhuR3BQckhNUVdqMkJm?=
 =?utf-8?B?S0Q2am9GTVVsMEZRQTI5R0hWdmI3SVJaSjVHT0ozVnVoQkowM1gxR3NrbDRh?=
 =?utf-8?B?YUcxYWpBNFViVzU3MVh4ZTJJR1BxMHA5QVRhTjVBVFIza2Zobm5iUFJVbFVz?=
 =?utf-8?B?eUdPZG01UnVHeTBnUmtKajh6UXpaNWd5Skd5STJScUhJNmxRVnFUbk5ET1ZZ?=
 =?utf-8?B?MzNCK2dxK0Q2eFlHSWpUZHdQOUFjNlFPZTlZRHZlcWRRRW1BNlc5bVIxN0dQ?=
 =?utf-8?B?eUxBZEVFY1BxUVpaSysrbU5BUUFzS3N2am41RVFuZGU0b0dkR1E5K3pUYmNI?=
 =?utf-8?B?OVQ5NTFPbFBlVnQ1MmFKWTY3L2JjdkRxVnh2QlBId0lVcXNQTEhuaUZndHR6?=
 =?utf-8?B?QXVOb3NiK01mV3lWeVJoK0pmcmhjMUlGOEh6LzM0OVNyNEl4Zlo2S1ZEcDVa?=
 =?utf-8?B?UkVoRTNDbzR3SHpqTUFjSWVIZVNJdUlmMGZWY3BZdDNZTWxLTldWd2xMaGx6?=
 =?utf-8?B?eWtUZDE0WE5pZ21tc1pUNXd6cm9GM1FEeDdPT2xHM3R5dGExemhXaDRYRHEx?=
 =?utf-8?B?eHBYUzM2b2dwV1drcFlCUGdRVEhKWlpvSlhRdTZ1RnYybjZnTXRONkxPYjdU?=
 =?utf-8?B?dFhVaENjNVl1SStjMHdObkgwemlCeFc3L3JOc0pNNG9Ldk10S1RSdnFKalFv?=
 =?utf-8?B?Q3pxZXlXU2t2KzE1S3VVeUMyK3NJUWNvdGMxRVQwWWVMb2dSTUhEdm5CdVNx?=
 =?utf-8?B?b05mcGxtamk4Vktwc0YreHppaTBqM2JVNjhMSXVtYi9uclAvQWFNMERuVkpo?=
 =?utf-8?B?aTcwZzByWFhuYkM0QjR6dEtBV0Nhejc2SExJT1RVaFN3cXdOS2ZvSDV5Rk10?=
 =?utf-8?B?K0h4dldVVFl0YTI2T2FOZkdnZnRiVXF4Q21yZmRBdTVDM2ViVlc1aEVITmlm?=
 =?utf-8?B?ODNNVms3MzFuMGp6Z21lNi9MaWVuL2I3ajdGM2dOVkcvem9zek9xQ2dLb21V?=
 =?utf-8?B?eHB4bTdabko5TXRsUTZQdm43dUR4Wm00Ymw5TG5aczdLLzJZdUVhWXl3OGw2?=
 =?utf-8?B?azJ6ZlQwR01iN3dkU1h1RlEvekFPeFA1dk11YUh5OXQ4TXNEVXBNcXR4R3NG?=
 =?utf-8?B?NTAxNE9DcmxjWHJQaUkvd0gwZVU1WWpKNTNPeHplelc1T3AvSVFrcEV3TFdF?=
 =?utf-8?B?RmNmOUZxTzlLejBraVdmV3MvV2dPTEVjTzVIdTRZSnBsN2Z5a29OUFJlZHRk?=
 =?utf-8?B?ZmpXNWIwMVBvWHJhcXM5eU9hc1pnVjk4Wmp6YkV1dGdCb250bXB4WGhHODRs?=
 =?utf-8?B?cU8rTnpXTjg0WnhST1loOUVrVGViK3RPcmxjMjAyaTVhQi9MOWlvVy9ZUlVO?=
 =?utf-8?B?UDBNeDJVcWdQRDZPOU0xUXQxeFFOZk5LUU1kMWhXK2pUd05TcFJhU0FqVGZZ?=
 =?utf-8?B?aW9IcmwrdXd0QVJyT2tFWkVsenpKcWVaKzRZSXYyNDlYeHFCbWpXbnczZG0z?=
 =?utf-8?B?WW0yUDViUmpwdW5pRkdoUTd4WlZEdGpNY1p5VStCMitPdVBScFhFeHZSdnFU?=
 =?utf-8?B?R0p0OTFZZGRtaEI1TEsrLzBqUGJMMTl3TnkwVzdIS1g1R1FJZjAxT01LeGRx?=
 =?utf-8?B?TCtXU0dvOGF6ZXJOd3piR2xRZW0raG9pdkt4VHFCYTQvR2lLQm02MUdGWUlr?=
 =?utf-8?B?dmhmWVg4ZUxPYzBFQmpEaG1FZC9oMHZtejZTRmMzUUtPNG9IRTlON1U4RUda?=
 =?utf-8?B?QVlHSlIzMm9meWl2Q3lkdnBrK01xNnBBQzNNckI2d2ZhaW4rRURUSFVBUUpz?=
 =?utf-8?B?TGdCVHhlR0NLMWIwS2g3UWZPTWJPU2phRmZ0TTZEQUh2RDQxTjRMRkp1eTI1?=
 =?utf-8?B?cS92UlNadnNCbVpMeHZEZGFsMVU5ZXl4QzduZVhaWE1jSXdEb05qS294WXFT?=
 =?utf-8?B?QzFHZ0ZaYXJzcFlVa2wvODYvWGVoTnVVMzdKczBwNUd1NEhCdDJmdWVxSXpr?=
 =?utf-8?Q?qt1cBlC63Ujafk9w=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 662287d5-1fbe-4312-6c78-08de8a6433cf
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:46:50.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YirZeX97hBv9FOzgk9ODwAR2kwi9KSLqHsGHES1RX8xrj5K5h99u2ZNUf8xV8lDX2C6DzEAlch7LXiVh1W2WZUdHC8hYUCC9gzvMg5EBuGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4907
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57001-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:mid]
X-Rspamd-Queue-Id: D603A324A9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series improves the OS05B10 sensor driver with cleanup,
refactoring, additional controls, and support for new modes.

Patch 1 Use pm_runtime_get_if_active() when applying controls.

Patches 2–3 perform initial cleanup and refactoring. Unused
group-hold programming is removed, register definitions are
introduced, and the initialization tables are reorganized by
splitting common and mode-specific registers.

Patches 5–7 add additional V4L2 controls including digital gain,
horizontal/vertical flip, and test pattern support.

Patches 8–10 extend the driver with 12-bit RAW support, update
pixel rate handling when switching between 10-bit and 12-bit
modes, and add new operating modes including 1080p and 2x2
binned 720p.

Patches 11–13 improve control handling and internal logic by
keeping vblank and exposure in sync on mode changes, updating
the active format before adjusting framing controls, and
renaming the vmax variable used by the VBLANK control.

Patch 14 adds support for 2-lane MIPI CSI-2 operation.

Patch 15 fix negative hblank calculation.

All patches were tested on the Debix Model A board running
Linux kernel v7.0-rc2.

Changelog:

v1 -> v2
- Added a separate patch to fix the use of pm_runtime_get_if_active().
- Modified patch 11 Remove unneccery exposure range update now just modifiyng one time only instead of twice.
- Add One patch for fix negative hblank calculation

Link to v1: https://lore.kernel.org/linux-media/20260306123304.76722-1-tarang.raval@siliconsignals.io/T/#t

Tarang Raval (15):
  media: i2c: os05b10: Use pm_runtime_get_if_active() when applying
    controls
  media: i2c: os05b10: drop unused group-hold programming
  media: i2c: os05b10: add register definitions and use them in init
    table
  media: i2c: os05b10: split common and mode-specific init registers
  media: i2c: os05b10: add V4L2 digital gain control
  media: i2c: os05b10: Add H/V flip support
  media: i2c: os05b10: Add test pattern options
  media: i2c: os05b10: add 12-bit RAW mode support
  media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
  media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
  media: i2c: os05b10: keep vblank and exposure range in sync on mode
    switch
  media: i2c: os05b10: Update active format before adjusting framing
    controls
  media: i2c: os05b10: Rename vmax variable in VBLANK control
  media: i2c: os05b10: add 2-lane support
  media: i2c: os05b10: fix negative hblank calculation

 drivers/media/i2c/os05b10.c | 684 ++++++++++++++++++++++++++++--------
 1 file changed, 537 insertions(+), 147 deletions(-)

--
2.34.1

