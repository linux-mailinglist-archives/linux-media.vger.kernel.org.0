Return-Path: <linux-media+bounces-29824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63BA83566
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE42E19E4898
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12141B0F20;
	Thu, 10 Apr 2025 01:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="C4qmm/Oq"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021123.outbound.protection.outlook.com [40.107.42.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5556F15B0EF;
	Thu, 10 Apr 2025 01:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247321; cv=fail; b=u6UCNDtMxRBunEr7EhgdiCpzgvRksVo+9VnKXKFFpOm2rcrS8rJBw8VJRXNFL6D0H+ldIkIG/M53PefNzLQdTVspw8i1L2mv2GrcqvqGpEOgKdG1vu8zO7bwksZtS7c3QMB6GGP2po8/mdRiCbnuEEKDeRMm6qSulGU3rKhAFvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247321; c=relaxed/simple;
	bh=ohTNH1sRoJB86HJ/REE6hro2A4VoEOS2CRRv+EJUkQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=caSX5iuikzuQVfz4uTFYHed8H0PXza1qyFSI2QQi6q7j04OoWP5JGgMVqu29TE0rQfdUcaluCLH8TWoW3m+NWjgAcixTHqI/X33r5/Ano+mzZDPU5VMxN4hfk61zvrLT8JmmyYkrQIUvqaH8EUQb1bxZgJazct0h7R2hq6injLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=C4qmm/Oq; arc=fail smtp.client-ip=40.107.42.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEwcVmsxe9auMpipc5t+VstkBCgDQkDSKVwDLH3wHBNcjTe+3FfmqtF+7quqeSXqbHpez67hxZe/D8d2wopzt9fOWGdGMtfySB3vuwDEY89dzDzJITKBQAYTIbUn8l7X6mL1C/Vuo7l2CbFYfke+mcuJLMrRvR6ywbZSOrYpy7ialIjIBMWbx4nGpihKuU6NX8oSXrf4qid36NPxQJum4zBR/hOBAfoy5+VTCEYnuqzWxEG9tCHr+SoSlSJS+PnykXIQt+8N5wKhP9b5T2qOSKgWbvB1F4cNw9DcfCmEPKgiFTw9mBCon8sPzYmRIYLhn5R4hShPNmE6AKtbtyjFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyH4ggXuFPWyn4KJKTsC1zBmVNl07Xr/EEWKZmklQvM=;
 b=cSE9b4DnGv6HqQzKu1UeUHZ80DZnMrw89SB4lNY9ZvYVemBl0N1G3zGsiZF5nvViWy7wGGjdzWX9wtEZAnk4WEB93RA9hMxckbQrEQ/pskO4CGtytpZY2P5JD2UYCf+ZCEqRBxa70IvZCF++N/v8veaFJB7oCzCIpmEEB31YzBrUoUJWafZ76iwBubbrEX91hiAIIpQUPwRrfjMQ9Nc6HifwZ6+cp7+ISQYkrAbGa8BJBU37MC2wQqKcCSb18oZLtDo4SPjLrJjuRZhX6dgehCGMO0nMcylsjy53Y9cK1ny1AicQ1j8lI+AqwjTlxgEsgIBBhO255/JrGXzcJTrU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyH4ggXuFPWyn4KJKTsC1zBmVNl07Xr/EEWKZmklQvM=;
 b=C4qmm/Oq6GkdjRrtQ4GwquF3SW9QgXtrF2TS5aHWHntCd6gXhvtKqR7DLawdTNW55lT5F9YvGY3u/gNU3tQQtFu6cUkZQvcmTfMA6KmPbO1uq/FZ4lMSA7NNUhJywqifV1I5E+SuI+O+xz9E0gIBXKpfXngSTrTfuwlG99l1mlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2928.KORP216.PROD.OUTLOOK.COM (2603:1096:101:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 01:08:34 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:34 +0000
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
Subject: [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Thu, 10 Apr 2025 10:08:21 +0900
Message-Id: <20250410010821.52-8-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
References: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2928:EE_
X-MS-Office365-Filtering-Correlation-Id: c4264b0f-4a7b-42d7-bc2e-08dd77cc3719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wp8RMQ7OV25+IJL4GPsFbs4tvJwwbBbKY+bC6cqE83U6nLWvxtuNngeSzyt0?=
 =?us-ascii?Q?zUYHlbHGkIcdSU8R03iaOA977qjmsf4m7stMm8Hea93fTJFxUK4v2uKMII1m?=
 =?us-ascii?Q?cJ1rASToL2+xkX9O91snhZAhRdaEpzySZVHTH0OXOVlcq7wMplr9blmXrQ7M?=
 =?us-ascii?Q?/bW35g0ARoZL058CP5Y8wp108pINBUDoPilnuH+ySa9GOwNT7y/yVL5lx8qh?=
 =?us-ascii?Q?7ZKEGfsQgxg18d9yMUYAkQWmRD55oRmhObPw5asBEK4qntoq27olCj4cncjS?=
 =?us-ascii?Q?7/ZR2f5sNNxU53K9GMBNSgsnxZ3CAHUv4UQHHgdOh8wnoJ9ycPLQ3/wnlqOe?=
 =?us-ascii?Q?u9RRH6qetu20kwFznQXFYe3NR25bdad0EDG2GExza1WxpN83a08rot+zWLuI?=
 =?us-ascii?Q?WIZf6o7ckHc20OchqXHjVSvL8bqNufwkbEM04o/6niDpVkYFyYQ8RERHmjvE?=
 =?us-ascii?Q?a9L6ytops5//uOUZ4FL9WXcLRsHPBL0Na3UU0OCLDoOvjlHl1J1w2wsM+j4Z?=
 =?us-ascii?Q?nHbMzytu7oIcLWbhMDPXMW3mUucEmjfyTmN5wEAAV+U0COSLQGYHLLoWHexl?=
 =?us-ascii?Q?Eg3hgjyzPVAaNqIowTCl5mdnh2oFgFSZYE8G60qRHCySnkjQFNr90GzGmdHw?=
 =?us-ascii?Q?1YBRrp8eVubPYxzGBcIrp8qtZizxLDgSxPzf6+bJjBYEToRZ+99rcOjnLiof?=
 =?us-ascii?Q?lobLQVKhc7NTwb5dflQj2K7RSBdIuoGdJeOyDKKuKBE6U8zwBovBOgN8Gi0O?=
 =?us-ascii?Q?/RpH7M9jKvPLQurd9DlWtsNfHNAzDmdpMp61KC41J6bFnDs5IeKrd3hXcMV3?=
 =?us-ascii?Q?2kDqcUt9nyAOrnuRaWbWh9NfwKBWsdddQqxSNu7pEND0rMGhlk11nfQFQlDF?=
 =?us-ascii?Q?VcS6/BI70SH6j80O4NY3231dCP1v++keAS5fLC1GBTx/SvedD4t/sMi/eiMg?=
 =?us-ascii?Q?QShAOt/AxIIFPsLAPFQe4D84QNY3e92AY6oqiLqI9RlVwi+Zp+fdVT9G/LzB?=
 =?us-ascii?Q?gN9CIEzaaf3Fry19/rEYMOCsK6IrlDjm4pjDYzjUT8oRMLCQ+cmPj/pmuLY8?=
 =?us-ascii?Q?gcZ+xDgkE69giEtfP2w1zBDhkuAHSJdoUX7WcoHmRTlLHRJLFggzOZy0wYu+?=
 =?us-ascii?Q?pNzPQ3LqdYIu8+RmWQZw9Og6pgCvsaQqUU5i1N/wN11Wvzndgz/+wHsVBHD/?=
 =?us-ascii?Q?l85JJkgvzi4mlJDLl9QpH1Iuq2+wSt5t8k+Ev+MsRTvs5A886tnm/EPHErHR?=
 =?us-ascii?Q?7o4dkOslNxJIX3hQ/+VBiQaDk12xpRozh1AyX+evpF8yBsAtpgYaLRULFr9Z?=
 =?us-ascii?Q?DQjUR0a1eH4tHgo4+1VhiJoxaxSEVy8ElsDEEFiwDuQHXj4gx7d2Z8zBn6+S?=
 =?us-ascii?Q?gRHRdVLRBfRo0W3cKJVaM22NHOtUk3l6RxfpVky7VDc2csVx3wYWJa9DW6iX?=
 =?us-ascii?Q?bYtPuGpnRlQLDRgiBZsQJUQVMIm4sAomz/URzGg44nDM15mKUFANMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nf7DieHLExxi3E6T0xeNfJnlLCwCOAflbFnVFBGLRNgyXyE6/wK/9fSubZQP?=
 =?us-ascii?Q?jWc3ZIOp4h+G2tQe9raR7wiBaHAnDNac9f07ft1Cv8jdDO8U6VaXlYql+t9h?=
 =?us-ascii?Q?nY65VZN8XFTYezO/D9b4pvLPpINX6iXWttfzmbLz4VxpjDe7yS8w1mYoi6hx?=
 =?us-ascii?Q?g5iDrVwqDu2kVAOx+IqDVkdaS0vUWKayrdVJy8nXFNmyEolcJeWHBuU3HYgM?=
 =?us-ascii?Q?1PYMYjhnCQznRe6fDknfUlu1hXQ+4U3GtNZQDUgm5M8gQRypoIXrCtqK5rvy?=
 =?us-ascii?Q?k+wse9u8u83u5eQHNWB8NmKeYBpuyPlsGdO4kufG29zj1j1yhQUYBdATcKax?=
 =?us-ascii?Q?dYn3bRR3rGtlJDZQJCaAbBUaOMN+YYQZ86PkSx0Q5nljL0tokw1JqF4M0Eb6?=
 =?us-ascii?Q?RiD62ualAvmcAUVyqLpelXXCQMC9Qpqe8MgaAh7cKHDEFZbuHtvdsHtRUKQl?=
 =?us-ascii?Q?CpAmKwcztozZ6sV/t9wAVTpWQO5iF0n3mh2bujnHTqKxNdrE766duMM+bJ55?=
 =?us-ascii?Q?TmvYdd5SITWkGg0SXd1LMA+Fu9gXVpdl6j4Qi9PtaEKufYJyGT//tQQfvmTu?=
 =?us-ascii?Q?uh4xWZD6w4O6gv9V0vm45yttfN/AEL3AGoPkR72UvcnJceWremRyK7fA2B5K?=
 =?us-ascii?Q?T/1yM4eggEK4y6JVYmTDiFGFrKJGxyVLW/2R/rK/rlzqJt44knLUmTUnPgtM?=
 =?us-ascii?Q?LxCHOXV/RUtwSsPFCjoNrkmp9bwj8zIjCg7I0rwX3+kgWswf3arD4WEcwXIn?=
 =?us-ascii?Q?JaJO6O4x5U9KkUuMCu80aUTL/EB+EayGWg+tu1p/oSZe0IcZlx3BEujhQHP4?=
 =?us-ascii?Q?i320SLHfoUAx3ctey0IHDubs84vGUnqOLhq/hEZBrolXMgvP8s5ZRiuV3XqH?=
 =?us-ascii?Q?SOFj2fhhb/QhAuJZrhpSOaSVv9Ng+P+GHWJT/RrnrjvZ61Rvd9JLPrAsJUB5?=
 =?us-ascii?Q?aATpmOtyD9tir00krBMhP/iMpDCz4h5QPUveBEDgCRteI7swseHjHDw2eTcD?=
 =?us-ascii?Q?vP/dBsKi32Ky/lIRfp/refDIdr+3yv7/NVRe73lYnqYIin9cSSs2vnnpH7Az?=
 =?us-ascii?Q?w6Er96YFO9HVbgcZYYmub3n2tQzIT0BEwLuYe3RbZ3eExu/ur0lpTjY70wuy?=
 =?us-ascii?Q?lyliAbmR9T0uFCMZUzlRK027866ASwnKHXTR3mndS4YPbfdn5/Qf6U0KDOj5?=
 =?us-ascii?Q?0e3AtCdUP141xPNpm9JGJNh3PPhFAHSiPp5rdz+p0Rb1qZEmGSlZp+XFJC4C?=
 =?us-ascii?Q?n9ujAb3Vifspn4xoShxwKzqNv9fPtw/IrKzxPsrH6wguATAwL/Zj3IBU+MOV?=
 =?us-ascii?Q?YB2ZnV33X0lh2YO5FrbCdSE/gC8IOoUFomdIQIn/85xSFvzoWDRWudFOAV0r?=
 =?us-ascii?Q?jCAxZ4oIH6dSET4t6aAVnMark3Dr3FElGIMdubiEvNZMkVwkGCnVmYac06Nu?=
 =?us-ascii?Q?Ni2IzOfqGRZLklleesrNNTTpfTglxFBpeN1aKghWTA2sIO5Wu6M+PReaTExd?=
 =?us-ascii?Q?CFK/9IlD99WpD1y6/0JtFVtXjILqfUrIh2qq9HlLvaTCBTLamm4A3vxY97HV?=
 =?us-ascii?Q?9hTPn5gcM911lhISp94XByEWZiKTjoW5ZKp6k5zPowP/zdjNxJwNrwjg5DyX?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4264b0f-4a7b-42d7-bc2e-08dd77cc3719
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:33.9307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8x123B/Px31/KartiS6F+xbTniy9gh11zKaAxKvk122jsjqvNYwqLZgobFPGO5KYq3igmMuyfdS47wRC22gzXkpchgPgklSbtG83fI8BfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2928

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

Fixes: 17ec0f717972 ("media: chips-media: wave5: Reduce high CPU load")
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


