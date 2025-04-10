Return-Path: <linux-media+bounces-29833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321EA83741
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9053B34A6
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AC91F1315;
	Thu, 10 Apr 2025 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ms93Bra9"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020083.outbound.protection.outlook.com [52.101.156.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AD1A9B3E;
	Thu, 10 Apr 2025 03:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256419; cv=fail; b=V0YcRyx1ABZCH1ZD6XgdpJS7DIf5v5CYg479NqCTBuSgYAYnH92rJ41SNRND55QF18vLGijWC2F0/RihIm8UkBe72XozqXzUMd31Id24lI6R2k5kpCjFoaECCVUkZrYdrROvHBUtcGDjsfYQTutSgPH0ITYVuc6gGAyvp8TCLjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256419; c=relaxed/simple;
	bh=dmyIOuwGzzrEca7bRqtHfH0wm5dQ5ukVrb7LiUCR/sg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M3KeWYZepp5B3LIg2pIPBw4vWDJZcsHcA7a/bJAtLJ4aD/cb/Rv1RbAEv1csQN/OLpJAw1qLKBA/a1HQTImNM2GfmTvnA4ysYG0/GQy09a6M504X6/M5Dy/bB6szL6cfep+QBMT/4XHPfdxQDu+Tgl5Iw5qb0q+4ijG/gv89H5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ms93Bra9; arc=fail smtp.client-ip=52.101.156.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3JhPVh/JIo3f0lRHd4CaOIB/PIjQdbGKjARneDvoTu17hrAtoDDXNTqzDDK2ovBhAEPRdp/BgcFE143cwRJZpY133NqZ+LunsLpgn6P7xwgTnXMHqGoZLkSTrh5vRtl7afKo1FM6vrEM5+Y7gCD8FgpPKNXdvPG74aqSTMCS/LglhfkxsFafRtH1Uz/jRaB35k2ogBp+8yUB2MvgPv9TOJcpEuWjjAzKlqOrswAgkMh7vCxQuz5SiiTw6xkvwLraEw0JwznN4yGg0y+Nire/Wk6gro6Th2qNAkVt4DnhZDYBGGbsmxjwcB5fv9Rsc7IqopS8VhcbCtNVovKaE7k0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x9nmvdWtC6i5OPh/z7K7badGx7j1ocreuYxUkmqyk8=;
 b=hAyUSDKvC3mZkETQmyfkfgHm8aZYAlrg/isS8oK0GxRbM/AkZOgnPU4M0QnEQ9vLet/W+uy7SooU836DP7jsrEULrg/yiRlITELZXRPWtpAuQfawMQmjpU+PU8Gq8mtP+7XXYiL025irUZfE4/Z8XOZb+JSOMVJEF0CvgvOgqic8G+1o931/KbqdLfipmHId0UQzdsmKZr5mOSjKT4bh+UjAb14re7uQu8vIJ5/LzrCOqPo9itUOLqpRje7VTBZOpiNpYO4z8bAOko5S33eYQYaxZlqHNuxwq6joSFXqCsOE4OcUK3evQglgoLbZO22194tinAayKX6VGwhdIYB6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x9nmvdWtC6i5OPh/z7K7badGx7j1ocreuYxUkmqyk8=;
 b=Ms93Bra9TScJ4hobh/6aTuz0SH7vB5zWSLmxk11GS8fu0nNWnhil5PD3m16tNnEdMxxevpsNDKjICTH0oInFtONLzXoxy4ITV/sCYz61KKoUn4KnFXtmpctNZ/tjz6SmowMj2vjPIdBAyYv4uBEz6r2p3nScIxVRRIy/wK1fLr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SE1P216MB1318.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:13 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:13 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [RESEND PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Thu, 10 Apr 2025 12:40:02 +0900
Message-Id: <20250410034002.88-8-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0051.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::12) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SE1P216MB1318:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3ad24e-deea-4dd4-24c5-08dd77e166f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aiRfL/H3aTYftFsWG/grbFcuX5NnJnT0MSuinh88rZH/RXh5g32hElcMiMHF?=
 =?us-ascii?Q?dOIZB9E8GlYKZFk1ZwXnF41V+5mrd6ieldCzX7XRTx8qKzcOFUYVB+fy4ABx?=
 =?us-ascii?Q?ysPz07zhIT0Blx8Ri7GAo63SPFAwN2WKBG1z6ZptOrwQgixAlP28rQFQ1Ppo?=
 =?us-ascii?Q?ZF1Y3nqLYdIKkfp6fDWqerGMEtKlmCDCu4QZMecQ7HyH2onobYRXqpSWOWv+?=
 =?us-ascii?Q?VNSCb5Q2Z9i31Fr3uLSM7WDlPguvJNNbD2D8X7NZulD5r5zjyiy8zr2mlhJe?=
 =?us-ascii?Q?Dr+WypUMT5E3XEJR6MDHOuk857/NKEVPLEVB/PJx5atG0P7E4spKbeLnnwBD?=
 =?us-ascii?Q?GmnP1w75bNHbOiN3/azBBhJwqMV1VbWhJwJq8k8wNkgEK8RCg8TY/scyH580?=
 =?us-ascii?Q?AqawvKxT8G6Dh0H/VmevYQ11knKg1bzBejmxrEm915tAuy9unYn6T7bvKdUc?=
 =?us-ascii?Q?7JSfRHhbW/dBg/C1EZq6RsTHVnK580SeGRcUK5pbwIdYmgjfmfif0PbGzpS+?=
 =?us-ascii?Q?MWNyL9f78mt3SoPrX2y5CtVjrJ8oy2JGuH/nFC/0NpiCmXuLmVJbEZTzt6kX?=
 =?us-ascii?Q?Cqj6glmeB52WD0hJhC2WFsByqwliMp6fN7Iwba3XO3PtXHZ+YxiOp4AwRpWm?=
 =?us-ascii?Q?VQdJPO7J3+86w0KonWQyAYfnUQp0aAqror06Bpo46Uozf7zYC+q3N8CCTp5l?=
 =?us-ascii?Q?jhNbTeIV6vGPpLePpjyQ6nKaEE6wxxMW0i6ZTPTFurKzDfZmW8T8qPLQwmmF?=
 =?us-ascii?Q?pl3ILW7ofnNEORE8xbv9dflJo7N+YrYrNQ/yPs+GHEII+UhLrDXBlmNaHtFd?=
 =?us-ascii?Q?wepTkpkNAEFbJ5B/Ym0l4U+yAL9LCs06VF20wkcgxzp6q0HHETHNW1VOm7Tl?=
 =?us-ascii?Q?bhf5thOTrkWdeq2IHWKYiX/3V2UHR/rmvqAtkv1ikLCF4h1zdmlrnETAG0p1?=
 =?us-ascii?Q?O21w3dSemuGR3wziEhpNLBnYJu+Ipk79KZ2bVtrLjNEkjlN8R8bcpksiCQdC?=
 =?us-ascii?Q?SmIrWzkRsYylFabM3InGls1Y4QlZscNpj6WuwPus6GeS0Ueicf1/gu5/WBX4?=
 =?us-ascii?Q?iI2yotL9q46QqgmfWDGrzS0i+alk5zkvPPtrMdFQTJxUjvoHG1UCurLODKVV?=
 =?us-ascii?Q?UaqyNiwaDYm2jvZW0+62Hk7EoGTpU6eNSOOduckUUf7Al5yoyuzuFX0v+fMN?=
 =?us-ascii?Q?XUORdz1CSJ0Zj4lby+oK16GBNfPoc0m/kcUKG6wzLUhPJ+3xsn6wFvbeO6o3?=
 =?us-ascii?Q?KzeQO6xq0ir99GHzORCrOSm63VwZsiZDTCQlrdRm3lsCoMKUlEMAFmmprYU3?=
 =?us-ascii?Q?LrHdJvFlzdNmSAtTrJEU9j20zg1QrGS9ucFA9MQw8W8wR+dv76Nx+gqS80zj?=
 =?us-ascii?Q?ltGAKlsgxS0J6DyGengVZX/alPEyGMXi0X2dMbuig4BN8Ibd47wYnyNP6itp?=
 =?us-ascii?Q?qEIHY3LaVjc6CHxxHH0Xg2hRTpJ9k/PaiSJzGhQ0MoKiC5ZbYYVHIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dv9XUUKPhcRYqnYMuRA25W5Jbl6u5/dZe8FUbSZmVTwkFSYhQr2kShXXqnRt?=
 =?us-ascii?Q?Q5UYYXTh+6j+e9td8acZkzCYmQ2vYLF8fbT0wtrqHCo1mMO4qYO0SJBlp988?=
 =?us-ascii?Q?D8w5N1FpDn9kDlI68tE9oeOhNZvEN2iroKazBvRkboYhZOrporsxnwx4hHEH?=
 =?us-ascii?Q?mcQ0s9shfScVA0s1j9pkVL+dWWqmnCqKY4hGdGesOUGq1Y110USspc+ZHrzd?=
 =?us-ascii?Q?PcVhmW3LjmFvdQCr8zsJfPXnf7eeSezORutUAJzgmhZ01gS2r6zLzgEhbZym?=
 =?us-ascii?Q?56yA6NIC5iPvzuxxsico2u7JugpV7/utN7skkjmodyTgsgeHkNH76MttKhPx?=
 =?us-ascii?Q?elS6D4baCpE2jbxSlmGobB7cA7J+VMWp2+oI2AaHDqJ5B8FIGLWIFNY/+lMt?=
 =?us-ascii?Q?xluNWXEUcJOuLOj61734MkQcnjAB6dLZnHKBlNr3pT5L6IphEBT6K8mYR+aD?=
 =?us-ascii?Q?zbW1kqkkPi4KUgD1DA82u9iC4wFzamF9nY2LeMhfpfgYU/ANt6l0PaYEDSz9?=
 =?us-ascii?Q?4jIjZLDbYxNo7aLUavvAjShO4E9RCrQbO1beUaVdOwkTRRrvKQ/VEuxNZ7Cy?=
 =?us-ascii?Q?mKvpOq6G2YDE1zcD2BCrW4x19OETLWib/ZFnXiOjuQMvDe1aEKD3VdUrEO2n?=
 =?us-ascii?Q?Py2vsM7a6lY0JozQKjZSX/HEvkke7mYkFOZA7bfNLPvd344fgVrmbMYpmrNM?=
 =?us-ascii?Q?dyuEBloVMihnY3hqqv4ZgtYEo/iQaLBydEd06cfOrzHwe/Z02DX8PQzEw7bk?=
 =?us-ascii?Q?FtWriv/jR6AllR1o9PQasikqlsC0U04xbm0PudtX9I0dLcb7YclBPLR5zh0y?=
 =?us-ascii?Q?X7BXaavyKr2CPY1OsCfoBLw2ewENhSiY0ChrJDRCpmGEat6xXr342I7LS7o0?=
 =?us-ascii?Q?gFyYApX1xCJbdICwE46IvFLGgzoRknqS3w5xJieIvqXAEHnZO5L8f31Htx+k?=
 =?us-ascii?Q?GAFLPqz7to8dE1LO/5+x01nRVnEBRG+Uu6OdQed2xKczmT5HdSfiCOHWjgu4?=
 =?us-ascii?Q?KTGcDkxv6oMj/2bRTWM2eGfUY+frGumSQ7jooXqfdNy+YUN3cxgCT+TR9UaL?=
 =?us-ascii?Q?nUixGd4Ky5oQqeSociZOkqrvuKruhULZqKGbrTedYDGyVKKN+eiKMqtY1gak?=
 =?us-ascii?Q?cLpSdY/ZVOpJi4LMz7rEzAAoFGQ1i81ecoJodHsunl1BvnCJo514oa+zBSs7?=
 =?us-ascii?Q?fqWylylqkHnr91SFLqYPnven0eVemJ/TN4cdW3g9yhPjwr8st38m62ROXfia?=
 =?us-ascii?Q?khXN/cpsgbsgnDoXjJ7M89bxiWfNebLl78BKS0n2g7y34INsjShKDZszdgLn?=
 =?us-ascii?Q?ZeZ5B7aVHzZ7ASQhntX+2GxmN+Ay+Vie4XoRJB0o7rR5PTonxRTY89OSklga?=
 =?us-ascii?Q?/zGiK0ibDa8LIn+uqR8MC+IIWxml9NTJwLhJVnorrsgBgo3sD8636Uyr82cz?=
 =?us-ascii?Q?kJ85l+YQgMDg1BoghBXALgPqb+o0XWNWoXptEyZMCFQMnzO9RkK609TCYtr6?=
 =?us-ascii?Q?vhVKwGOdKMHL0EPj+ZJXsmc4vUJjpa7C5SboMj7EwSHxPZ67LwTyESe5B92F?=
 =?us-ascii?Q?DrdEaAeMc+9/VKQjA3Tjf0Ms45/I9aUGsD2MMijuWxDlk5nSx6GfpZ7PvQJD?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3ad24e-deea-4dd4-24c5-08dd77e166f7
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:13.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAlnh0VY7ZrMh73mqd3BjaPAFq7VOsZHJZRgOd5DBBzUHR4Ralq/XPt1i1iQ07ypvLZPwSuWzooCSWiNSUCgNooCzQehaB7Zs1v7bPier+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1318

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying "Reduce high CPU load" patch, SError of kernel panic rarely
happened while testing fluster.
The root cause was to enter suspend mode because timeout of autosuspend
delay happened.

[   48.834439] SError Interrupt on CPU0, code 0x00000000bf000000 -- SError
[   48.834455] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834461] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834464] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   48.834468] pc : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834488] lr : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834495] sp : ffff8000856e3a30
[   48.834497] x29: ffff8000856e3a30 x28: ffff0008093f6010 x27: ffff000809158130
[   48.834504] x26: 0000000000000000 x25: ffff00080b625000 x24: ffff000804a9ba80
[   48.834509] x23: ffff000802343028 x22: ffff000809158150 x21: ffff000802218000
[   48.834513] x20: ffff0008093f6000 x19: ffff0008093f6000 x18: 0000000000000000
[   48.834518] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff74009618
[   48.834523] x14: 000000010000000c x13: 0000000000000000 x12: 0000000000000000
[   48.834527] x11: ffffffffffffffff x10: ffffffffffffffff x9 : ffff000802343028
[   48.834532] x8 : ffff00080b6252a0 x7 : 0000000000000038 x6 : 0000000000000000
[   48.834536] x5 : ffff00080b625060 x4 : 0000000000000000 x3 : 0000000000000000
[   48.834541] x2 : 0000000000000000 x1 : ffff800084bf0118 x0 : ffff800084bf0000
[   48.834547] Kernel panic - not syncing: Asynchronous SError Interrupt
[   48.834549] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834554] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834556] Call trace:
[   48.834559]  dump_backtrace+0x94/0xec
[   48.834574]  show_stack+0x18/0x24
[   48.834579]  dump_stack_lvl+0x38/0x90
[   48.834585]  dump_stack+0x18/0x24
[   48.834588]  panic+0x35c/0x3e0
[   48.834592]  nmi_panic+0x40/0x8c
[   48.834595]  arm64_serror_panic+0x64/0x70
[   48.834598]  do_serror+0x3c/0x78
[   48.834601]  el1h_64_error_handler+0x34/0x4c
[   48.834605]  el1h_64_error+0x64/0x68
[   48.834608]  wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834615]  wave5_vpu_dec_clr_disp_flag+0x54/0x80 [wave5]
[   48.834622]  wave5_vpu_dec_buf_queue+0x19c/0x1a0 [wave5]
[   48.834628]  __enqueue_in_driver+0x3c/0x74 [videobuf2_common]
[   48.834639]  vb2_core_qbuf+0x508/0x61c [videobuf2_common]
[   48.834646]  vb2_qbuf+0xa4/0x168 [videobuf2_v4l2]
[   48.834656]  v4l2_m2m_qbuf+0x80/0x238 [v4l2_mem2mem]
[   48.834666]  v4l2_m2m_ioctl_qbuf+0x18/0x24 [v4l2_mem2mem]
[   48.834673]  v4l_qbuf+0x48/0x5c [videodev]
[   48.834704]  __video_do_ioctl+0x180/0x3f0 [videodev]
[   48.834725]  video_usercopy+0x2ec/0x68c [videodev]
[   48.834745]  video_ioctl2+0x18/0x24 [videodev]
[   48.834766]  v4l2_ioctl+0x40/0x60 [videodev]
[   48.834786]  __arm64_sys_ioctl+0xa8/0xec
[   48.834793]  invoke_syscall+0x44/0x100
[   48.834800]  el0_svc_common.constprop.0+0xc0/0xe0
[   48.834804]  do_el0_svc+0x1c/0x28
[   48.834809]  el0_svc+0x30/0xd0
[   48.834813]  el0t_64_sync_handler+0xc0/0xc4
[   48.834816]  el0t_64_sync+0x190/0x194
[   48.834820] SMP: stopping secondary CPUs
[   48.834831] Kernel Offset: disabled
[   48.834833] CPU features: 0x08,00002002,80200000,4200421b
[   48.834837] Memory Limit: none
[   49.161404] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c   |  3 ---
 .../platform/chips-media/wave5/wave5-vpu-enc.c   |  3 ---
 .../media/platform/chips-media/wave5/wave5-vpu.c |  2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c    | 16 ----------------
 4 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 58340fddcd04..d069cb955a7c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1865,9 +1865,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 52a1a00fd9bb..7f1aa392805f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1779,9 +1779,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index c53ac9a5c1c2..ae2c3eefd00a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -367,7 +367,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index d7318d596b73..1f7f4d214b3c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 	struct dec_output_info dec_info;
 
 	*fail_res = 0;
@@ -265,12 +263,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_destroy(&inst->feed_lock);
 
 unlock_and_return:
@@ -738,8 +730,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -782,12 +772,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
-- 
2.43.0


