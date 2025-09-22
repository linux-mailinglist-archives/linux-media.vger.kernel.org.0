Return-Path: <linux-media+bounces-42870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC9B8EF31
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A923BD96A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642179475;
	Mon, 22 Sep 2025 04:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dkJzS5ek"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021114.outbound.protection.outlook.com [40.107.42.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE623535C;
	Mon, 22 Sep 2025 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758515811; cv=fail; b=T7RJ1lo/8939ZRN+aEUPbZvf2B9DIqywP8ZqU9g2LRvkfk30L6ik3LtS0uDx4hsvNsKb0LXJbIVf6DgJ3rurYADdkty6Q1S55GUheacYQX7sMArCnNb4Q78YIfkekx2GUF9QfGhbc5ObG3j5VGonjmdx4H7RpO22vlXDqqTDpuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758515811; c=relaxed/simple;
	bh=Qi5MhXzxrTp2v1Qui3FIA9GyuDhnq5TmFO1w/aWtAhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ngbCAfVYNl/f9hWsxMTONSA2lth0e1DGtfcCtjsEeBGKL4fb0Ix1v/pDsOhrLL/I95GJvY5mp/sYDZKlm8Ph61dUFbs3E/AEwFQ5pMi8vSQnwATolRtKL6bykz5ChREqIjx1r/kz1bLzxYU9mQZQBEt6yECJJqwEQADa2lNBQgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dkJzS5ek; arc=fail smtp.client-ip=40.107.42.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gti/SbmLzpTPwMRRamAB/pc0NnWPdzOjaY66gsnzIDQiTBf3LKzbNbRHULGDQnRY94DqHUfIZomB6K++5EbwNQzNUy1H9ZBeQy+GUfUs8lJt0fwFdIRnmY0ZW8+Knqsg+dF8VhCyBaRbBm8SBDcm1xDyyrGGKaHzgFTjGFhdRrEUtW+N8vcrn1ca2h+JvoOJ6/I7EiTpMGW7f7TUIVZ5tekzl014YD0FaQvtLZQkxQIJWMUISbNPerQl/gIvw8qXIDv4IqD+n7wy8vHtVaNWSmF20gR09sZdX/SC44QMpqQL1qOQV8S8dv6rDtOERKUSUprZehvCjx6OvjwFgP2urQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOfrGXe6cIFzAD6qTlFcZhqILsbgPYcl40sGW7Ndewk=;
 b=wHuJZ+8a00LV8fyjIEf0mgN1+lqtQIOeThFeivEN3/Lo+wWLRB0PTokzNB/sW4H9+0A6IgfaxS/HyBjV+hVF3dcT/Xzs+LS/vPJSvJECD4uPJ3Fpgyo4B8xOro8ObQPE+4n3/LiWhN0XM9PjrQi2WmVJXpNhUylrdkOby22YgYYtZRiRj8Dn4A4lTZB5sf3AupBYz0GB0y4/H94p4JNNTwSDF2N1T4dYlBjlzZtUhs+dBxfcsSYsiFS8/Hqsn/xdAP9gUzjXXU8LRTX31KuD/JCx6X99vQ6UlJLZ/bgYpK54HIuaZbmwL5pJ2yJaRKyOUMU7LUvpmCy2vF/jpBqpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOfrGXe6cIFzAD6qTlFcZhqILsbgPYcl40sGW7Ndewk=;
 b=dkJzS5ekNYWgVRCPYzOlWx7EzW3Ls7822N0sXazPadMboGZi2wmru2bLIABk8o+WFkkxEEaeKcTA+GA+uSi+RA9I4wfaReZeJlJgwIbV07mwpnYgfhh5Z5pt1WXBIFB1+KocePOqA0PkjS31GOv/VAQ2IiHh13kwJ4Uu6QqcuCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE1P216MB1479.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 04:36:41 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 04:36:41 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v4 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Mon, 22 Sep 2025 13:36:27 +0900
Message-Id: <20250922043630.74-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
References: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0023.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::18) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE1P216MB1479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9686550c-0d7b-42d0-fef7-08ddf991a04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HMx6msEMsFNfayIcjqcLc9W4T2X2fWMc8MIm0tNd+Un01LcyVmHLyJ+J+QPT?=
 =?us-ascii?Q?LbTPh1t0LNwax6M64Pu1uaSq8ZiwY3Nz0sj6SzumBFPM7hzM7eZiOnfwFMfG?=
 =?us-ascii?Q?WVo0bHk+mUGhLdm0GgMGjbpdJUNtnsDdSmPz57UvKeZWXjjJssffaQ0zoJl7?=
 =?us-ascii?Q?uw1MVIe2ZW8Sdi8j17wdE2A0dEVTEyumRFGjxr+/P7iU+r4wq4UHGOSrlQXg?=
 =?us-ascii?Q?dgcVJlyv4GJyLBpM/AcbeCY5Jv+e7xM8TmO+G+sKb8RnhujxUXRzYlu2QkF+?=
 =?us-ascii?Q?TP2PX6yUyoPX9YLTLP9fQHGzCpPZyK7Y3ywvl76cfKqUI9Cqgw4D/MqNn7vj?=
 =?us-ascii?Q?KAelmql5ILFPs3V9MfVUo+C7BXE3J78YHSF9kLqzveLPMZpJtr+LUzsDkxYE?=
 =?us-ascii?Q?PxJfcEqmd0CDaIbbZRccTXxA2a+I4LN+/jljZzG/otrEkZ34UtGlxjQWXI5W?=
 =?us-ascii?Q?tokmKcsKDQIHFG1x4g9Dn2Kvcbp7PAp5wH33VetBDQwEbdSRhjMSht2v0gQV?=
 =?us-ascii?Q?IH2dRRyz2ZQBBvg9zkQ7hD2v74d/DHJu3vrus9Rvq8sVkdNUERpqK492A2tC?=
 =?us-ascii?Q?D4bo54/frpfLk6yDhSgQukn+l3WgwN1e5yKakt34ckINViTtAVpG2nqESs34?=
 =?us-ascii?Q?DOPAQ3Vv1GiDwh8OiXjKb9YKhWek1pL1+Tgn2UHpYzd4fQdw6Kd44RYutuFY?=
 =?us-ascii?Q?3R5NoonbnlU65oQAb5Iv9wMuG8aXNusx0EXgZxFH+EUJZFVUaGZ7PtbAVndn?=
 =?us-ascii?Q?nPsMPkhcNPnePEkApBLtSBbzQIIAJn+KVUsLCRiIny+9RzMM+0Aru4ariIik?=
 =?us-ascii?Q?U/6ZpwmekO7XtBATLcfgLkFntazttlM12xVBTCIuwS2J0AZq8NualioaWyzr?=
 =?us-ascii?Q?r8yr6/tbkGX8WegjeGA58bcEF1mNVzALAQkMTNCVaJEdCl88p9+HfZ5LowrG?=
 =?us-ascii?Q?elnV4TBv303dNhVRAJRPy1F/iHKMEWp5371wG2M/jAhQeG16FdaZXt81RH70?=
 =?us-ascii?Q?AjlPvkERXrQfzNXAqqF/FuVUHljvv+VLaZxX2sizSj8I+M1cCmjRsOo+Vis3?=
 =?us-ascii?Q?7M4nkkAcq6G4KHFtvcDks0nRBNNz6D82UYBo4BHFboqPbvgphvT3pRTR+aGS?=
 =?us-ascii?Q?jSIy7C4+cxEmsGQMMYDydqISViaH+RiJ0OR1eorpvPL4NsXP/6uw7GnCGWbz?=
 =?us-ascii?Q?qBVXxcMSjqEbKJHIp1hMdvOTwEbZQoTyTN3vj2oUaBBUpgrMQFg1rZ23brW/?=
 =?us-ascii?Q?sHHF1KausTqEASWGh2ycbUGBtH7AmwDTBFgLUaEu8fAz2s8eSissAB04abbU?=
 =?us-ascii?Q?CI22Tc+a+NlnFRTm4tt3uwrOb3BM5zcFI50lXvj2ie08mskeAxwFnB+leK9j?=
 =?us-ascii?Q?GeMEejUcF4dZl5eOSsd0dOJikOL4ySL7LMHkDWljwyXPY94rAQwIp4tVeGRE?=
 =?us-ascii?Q?m3rcbhbQ5TUG1+C6tkTxAe8Q7AJliWKCroXKCG/BSKIEXPGuZ6597g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cc4EN8zmG6xFgQitC04KMZ7vAlVJpjUFm0XSq6sz1TO9V91SNVkGjBrJhHA/?=
 =?us-ascii?Q?bWU7ED+vn0UDOhGo9pKefjhgl8iNIbCthAvF7DTjplDugJManZlAwvcEEjXB?=
 =?us-ascii?Q?+qQ1mL8rcIJCkk521ze7sXP86QVtrGp0kW7n4z5U87L65lxswc/rTDyGxACa?=
 =?us-ascii?Q?zNG6M7PW3FGhhHFvLEXh85Wf50g/iYAvB0af4zu4Kotz+sZ0fcKyMty76Pi+?=
 =?us-ascii?Q?judrXOoU2t+5raxQ5dG787ldOlyuzYWgMjAZh7jcnmy6AJ3wKqL+SCxOJkCd?=
 =?us-ascii?Q?vZybwovsG2kXKsCkJ30mXv0VYX5Q3nWM2JCGAyKLddD4v/NCTnEtXBVQslGD?=
 =?us-ascii?Q?mRVAP6CTbbvO3pGRCLrKuaY3ksnBZ6VB8H+dpPq1aAwMYeOH0iEHaca9KYYP?=
 =?us-ascii?Q?XyqSxGmqrSfgveKt7u83yI3g/BnyA2U3oX28q8vfIsutk9yht4jQVukUGDqm?=
 =?us-ascii?Q?BHaCJl4YiVasatquZ4+QLFAOOmjhEst4U8+YsUxiv+G3GlfNQy5kEBym2VxE?=
 =?us-ascii?Q?RVnU/TwsevCXmOlDSY3Hh8o8RAWeN5N0ffZraZWJAUKg+EtxOqHUQdBcxTwZ?=
 =?us-ascii?Q?aBOh2OIrsk4k3kMy8tB/FuHUmOAZEgMMrT/LLEyEw+Hyg+EgP156guZlnXPe?=
 =?us-ascii?Q?z39VbdU1bpZTdp90n7vhGY72Ts0P/LoGhieP+LGDYRfyOEqvYsdToNo1Hhoh?=
 =?us-ascii?Q?idhupGVseq0c2c3cF171yAxE53Dj57OkmLNru42zeA4PHvh8DE01WdIP9CL5?=
 =?us-ascii?Q?d0PVs4RUKDyodsb+ZgenJNNO/mdEiTDaNhA97/I9jbgUHku0VDu7uYWX3vFH?=
 =?us-ascii?Q?bKSotiFEId+wo3QQL3JQH2Zn+Bh9AQ2g3HdUGXAWeYPBzsa78aOfuYsaX3w1?=
 =?us-ascii?Q?OsXijbXmR1m5/RiWpOhSsM4DC4fAvWDYSFiUZKUe1L4aJHhdFHvjwaB1LwUJ?=
 =?us-ascii?Q?JBfYcCYfJWvWpAZT0wZvriUF3DidzyzNJji2XGEdvwVAlLGtf2QSTXuAqEqe?=
 =?us-ascii?Q?zv2/QlGZkPP5Lp3Nyujo9vLyeenMG0bJT/74rYaeZN7fOqSeb08DGa9RAPlY?=
 =?us-ascii?Q?uQnrDgHqLWYItW8XndrqkvmmORzYceYOa5Ijqvv+dH+6OB78uOjEMEbKq/ue?=
 =?us-ascii?Q?ctIHzSXpdQpYw2WZixaqlikoVcBzKBVbQsO5vtTERb90q06UzEaUinGutM9R?=
 =?us-ascii?Q?OXj2MiEGHr0eA0bfPtN9EPz6AkWUoDolHPgV8+bF9nPF//kGQWjnbx46Poeh?=
 =?us-ascii?Q?On/WtO3m/WKldNrmaopP2NIaCT/BFbJzCgJ8VQaWyjafZwclRbTtijGn4ljk?=
 =?us-ascii?Q?1VweAI69arby355EoPY8+jRs5/LMmVl+3qENMKoPqFMtjYDNKUe+cs6A/rqf?=
 =?us-ascii?Q?z6NoAf4zjyqG02AHaS4bji3tTw01NCtVO0sM1V/wzkfM6F+koWPMsz4rYKYZ?=
 =?us-ascii?Q?CBdFkeke2z6ud/PCEqVaoZizNBBFJw1yqstvHF5B67h12PRv/jjLKGQxUNN8?=
 =?us-ascii?Q?30nKxhKlHjurJtWuifPrnZLKYPGChwRSnK305UDN1PnQtPG4IYz8i2cgIgY9?=
 =?us-ascii?Q?UAmcOadqlKhTTJTF8HwUyoIKwegvcAgYsYHW3KQ3VgJ7w7rXwpZetonyV1gu?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9686550c-0d7b-42d0-fef7-08ddf991a04a
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:36:41.3504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73Qf+4ul/kLuY+H/jDTtSWRG9Yt/NeSiFpwk7PgF/m2Frgb8sy+pzPkQIB5uZLZ0l0+zlpshwNfiLqjlCDSd7CmtGiKEO5rtU4UwsdBtt1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1479

From: Jackson Lee <jackson.lee@chipsnmedia.com>

SError of kernel panic rarely happened while testing fluster.
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

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c    |  3 ---
 .../platform/chips-media/wave5/wave5-vpu-enc.c    |  3 ---
 .../media/platform/chips-media/wave5/wave5-vpu.c  |  2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c     | 15 ---------------
 4 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 72af0faa3ef2..1df78e427c6a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1829,9 +1829,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 506d6c6166a6..d2b047706626 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1773,9 +1773,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 156b099d435b..91fe4086d87a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -322,7 +322,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..e94d6ebc9f81 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -250,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -720,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -764,12 +755,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
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


