Return-Path: <linux-media+bounces-28946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D8A74F76
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 705233B3D45
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230F81DFDB4;
	Fri, 28 Mar 2025 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AIAciXe+"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BFF1DE3BF;
	Fri, 28 Mar 2025 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183153; cv=fail; b=SDkSu/szNxerYGnlmSqNse6MiiPMP43R/u6MVxtMapBnLWWTGvXa5zuLfreHY2ALTh9gWDCIInMrzy/kUgiCD5w5GnllznAL1PPHq7FxfWFs/FGHiXc9GygIFEaIOM4Ffk0tqbUwXcgQxDHzbNrBSW6QXfPuPW22fI8JjINQ548=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183153; c=relaxed/simple;
	bh=yeRnwR2PhWlTlpmmTXH8PxcG0cTuV08ohn8P/eT1P4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFef8qmGaX0y16KfwI0UhIg1HNi7W7k4CVWb6zLOEq8oa1La1xPTAfG3hmRlR1ETNtgLiLZqVR++yfy8bwzYYhf9EwZH3V7R+AgbLTZj7NrwI8/CtKSJbBjlBAq3cWO1KJ66lBwOer9gfbKmJ4lBq33sZIESSPsrdHDewKESuSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AIAciXe+; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJzVSt4cDKkAgTby465qOzyA13MUaaCrfKyU6lYxPXlrbmdo4hjgPcsFvTFn/AUeHe5/VtEdsKNYaX10xtG+umi3VVHC5JLnl4vmS4so3UvWh2+Bc6ubZbkhsGVv4c9QodnxHQK4gXKr8a4My+wdJ++ENGOvd5P6P4PuoKc0yBx96H7RrvvzmWmIh6LuPCwtIgxeLheaGsYQtj+B823kMtjfq4leHsoaChqwmR/yGphNnQ+9P0sOXn8Mn+NTndhnhCkX9I5pHFNxuMWPs+UicZwHRluLYPWXE+6NiLmA7fKULF+UcrW5Ifnw/SYx+iOKoDqaHkaFZwBHLfPc0m6yAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoUVfWxmhXxIGV1LC4G+mxd+fJYCjAGhtOH5YWwk14Q=;
 b=O2rJKDZW2NNPYBLaGKDxyx/MChw6EZeQqw9qINxiKlzKtQdOE0Nk1sMxt+/o0G3pAuJpguU3x3z5YfUP139XkPI4CyjUA6Q3VJEhCG+ITiOBV3bBVE4m0tP+OzUdHBMLF+unBaZOLWGdHTXzQaMCLLggu2yknDdpI0fZKGvEF5Qc87XFqlhhUR2LEQ1okEPByk7maldGOS10yuOd9AGLsDY0kLhP3ZlhVML+QRnRk+vylHVYbGwiE+HJrthboH+YG9kyNqWvATQdYviONgwVxOSI/AdFOrlmnSKB1nJ/rIBC52UrBqOo8qbAKgTTok6dIQ3FfWlI6BhiHuYOjaEdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoUVfWxmhXxIGV1LC4G+mxd+fJYCjAGhtOH5YWwk14Q=;
 b=AIAciXe+DaRXrydsU55IBd+NWlzAfS1gkt64zyTN0qLYITqHmIU6Z2JjGCQ8XAsxCuvQYAt1Y7+Fc1/IezwTn14tejBv3BDkXElczWQD5CvLOAlTBSA+4Vk+eKq5Z4lWd+2oEh25GCOY/MU9jas/hN7+ClfzaxwfTNq4WWtjZos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:32:29 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:32:29 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Date: Fri, 28 Mar 2025 18:29:47 +0100
Message-ID: <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1586d5f0-c6c4-4a86-b3af-08dd6e1e8370
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DNWmZfrZfUwnKtW9k5v/JmI5/VVAqCs8oM2OM6yKtVIh4qG3wUGN4wpS6xT4?=
 =?us-ascii?Q?zOdLRKjvjxDpU3hiQJxVne/wGPqGqxuWHNWk+/QDmmY4BIqyyNFqm9g60I8V?=
 =?us-ascii?Q?kcMK2js2wAeQWqfBOpw9NaVe6Oip7nSPPJa3hsyKSBHvFbOAintUuGlo0ejx?=
 =?us-ascii?Q?DNmYVCHPQfob8M4OKtu0SqFVfQYmX9PoUphOQOngC5QOF7sEk0YLNgpp0Ked?=
 =?us-ascii?Q?WgjyIzHYNk8fbxikg0mS33+P659Al0sqzEnE8PE8Eh7iz9isOrYRBUByaUvv?=
 =?us-ascii?Q?MiIm2mV2943lJHntRQ5Ag1smbzHhVdpFKfAhINI65elh8V4XrKpOudfGZrg4?=
 =?us-ascii?Q?8niuvfW7Gm+pmq8fUw04ItJmgk8XEtWNmYfPtXo1voLaZi+mhsXVOjAn/Tii?=
 =?us-ascii?Q?n1yAVDhiZhL42y0gQQfQV1U39ovHoT1BQBJOzqdeX5wi7lMyCeglHcnxr6dN?=
 =?us-ascii?Q?WWwl590wJjRWPdZzAJuPAskB/7u8bjV376GNLKSzt1OJiaFaWOteaSKxzLX/?=
 =?us-ascii?Q?kPIHq4g81xnhiaNdtft5XD7ZeR5Wl3Zs4ItRwpnuCf6UGP8YTYNH/P4zkM4E?=
 =?us-ascii?Q?fgvIwqyOfijz5wYltt87EHmhsU7NLqNdllXtZiLLUz9Ar0V8WQCmcEZ5mb5Q?=
 =?us-ascii?Q?FgAkLSpm4MMNS9enTuWa1EObmm8TRcST7DXY0Abos/r9EdVAi+E/Q0aHttm2?=
 =?us-ascii?Q?6pqIg0s67/UA8y2TofJF55OGlhzx5j3J7Qk+y2BPfE0tXkhLfilgPPcM2C5i?=
 =?us-ascii?Q?/3MWg/nEXvRmA9h0ZRBIAsundAEwsJ98C6kDz9Jhtrl5PjbBOt0XCANHWJM0?=
 =?us-ascii?Q?mUIbXePTSjQb2/MgwB/DeiWlJ9B/RpWdk2YN/jq09eFQbVrQ7agNYNOhKC4/?=
 =?us-ascii?Q?pMkr0Sh5KFEFAjQIzSgrahl8hiC+kH0bvcfFqiGWfT9W8Ht0BNQVFV2FMlCq?=
 =?us-ascii?Q?s2n7D2zuU94WHWOtUlXnMg8IHUw9qcXzPc16yuQWCheS4YTBZqo4NYd6yk78?=
 =?us-ascii?Q?oBA98V0TlM6hzUQQZp+FKsvFBIAFdcn7CChuU4ZX6NcfQSvqWnLVdqjkT4ZW?=
 =?us-ascii?Q?2KdvQyNPEapvjSHrz9t4DLp49h7sIINmrq7W8SdzKH4PnkHNoiFew91dY0WS?=
 =?us-ascii?Q?MscuUzZ+gO3/GUY5GUl3CZSVOeWLNN9fc4f1OVtQ6pPY0QKy/NDKhpr5xO08?=
 =?us-ascii?Q?l3f+7g89RcPJah7Wcy0sF0FTXJKkgVNAZZNiRZQBlwTGR6c0qa6WnVxWrVc5?=
 =?us-ascii?Q?l2VuOVS9CkdEdbjNBuB8AKSXC+qbSkgoX863F81O3A7DOtemDNl3MYoYzZ1g?=
 =?us-ascii?Q?xR81SN2Xe5Oe5vg+nNMR3Vq4rYhewhUHOCZV4lgLKIlUB97RpOCjMz2hOWec?=
 =?us-ascii?Q?Bdm4wEDSsJ03H9GG8p/4NKva/TYYgIAgv05aSZ/a09AVGNHWc3gC3uFgisjR?=
 =?us-ascii?Q?tYazMdWJe3LK6Dt4fMtwcHr825lEjXQxgkA+riWNyBKJjTmqqE+oHA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mg7M15UCuhuN3DjkWjXyZpKhz+XZTXEnXD0akeqFpuNyf9tuSTPu40Zu5VaX?=
 =?us-ascii?Q?fpHNwOlwwbMo9Pp6ZyhB3U9bS7q06rykIfmjl//uiXunD0CVNg3I/x55lZj+?=
 =?us-ascii?Q?A5EvWAtCWr7uMCh9/ia2ePhpJ99UKlM259cSAtLOgGqekqXR2HfTDWCOXvsC?=
 =?us-ascii?Q?1Q3MVQ3nKRLuzfgBEOrc+PoxkH7s1OQcbZxM2Z99I22k6ekh9F4KmoPY6FTx?=
 =?us-ascii?Q?jQMh5rdNKPHz9FocaTkqlhHlwdb/1/0iaRI5WHEWDt6d+2ytLDckIb2/vrLW?=
 =?us-ascii?Q?XdPrruOKk2DYS23Nx5m+5plREyBS9n0H9wIJFhR6/5FmaBWNDYehaUJ3AMRu?=
 =?us-ascii?Q?shVxapVbc1td0hJuBAMugK4aAg5ZH5K6onq44nknKVGneV3wcI+2UgoQkQlg?=
 =?us-ascii?Q?SOc8F6Be2+6nqxXqDACo8P2gpOrhhnH6bZrtiU6i8LSBI8WnNnC17DYgVt9z?=
 =?us-ascii?Q?hQEbUY+NNq9hqxQgR6M43vGJhULhCNnDcEhWp7akNMIaKIpFmJmM3l1EwutN?=
 =?us-ascii?Q?ZfKMDiiaQjo/zoCkM2vwP83Je040PvATbGPqkURXXSoHyKxJ4KppcYmGGZMp?=
 =?us-ascii?Q?Z9HsmlvWK+9x1V/fNb/JwSvXtwUhArnIM+sJav5fAlEd2uidMoLa7X19a1KS?=
 =?us-ascii?Q?/8LFyDLxROvvSlBGPHbArkUP3M/DwP/3U06j0kwQQRLLutqFRzPOjm/bmIRt?=
 =?us-ascii?Q?kK4Si4NLoCAC4OGy1NRHaHLwgPfvdMaZl3DIp5BfyF4CNGONKA/gwvu7ltMg?=
 =?us-ascii?Q?ZbD9WWBBp4P+zPnrI8UEiiruGJjnkqtHl1A+vTtBkFhACJKxBSDJ2daLNpgj?=
 =?us-ascii?Q?ULEs5t/DKMrI7G5uGoScwRdNW1ph1ntjwifNMXTZHKImDtIki7HwlYSO23Fn?=
 =?us-ascii?Q?g/LAjrjUB5SlDzq1/YWesN2cnhBrnJdKcpp7wVR6H3pPZFIxd0s3XrzmjHmz?=
 =?us-ascii?Q?lnE8nQL9ddx6lbCFMZZNBIdC0lO3Jj/EcL1rTdhOMOOQ/7qtq/DdqohtaXx/?=
 =?us-ascii?Q?UABXVP84SuJ0sUG8JjcypBsbWU8kDJAWwwjBTfU9+2XmVvaOVEaaqSI9sjw9?=
 =?us-ascii?Q?eF7wlN1lxFvrHfPnP3l1gkr1fwGLLbWStd+8UloMUUbdl3lViENEowBnpMRK?=
 =?us-ascii?Q?DVe2/HTI+bn8Hw5hDjwJmzsKLkFLme5R3lekGK3B+z9txZ4X2KGoSP5nwMeZ?=
 =?us-ascii?Q?J3VhKCEb9jr7Lyr04vxpPSJIswa2Biu2vR/0N93X7Um/524ob/e+2FmGnzVQ?=
 =?us-ascii?Q?1BHNsn8NfB1y73WG0AM9ZZUQWT99Eo9XNUGopwj69mboiNFjdFcdcAMAdUjG?=
 =?us-ascii?Q?2hyZm0WaMBWshLUlOBITggCL/rBnGUuZg3gIHzG/kjSeJquwB09BWgbObjQN?=
 =?us-ascii?Q?qHV3B1zR1G7TEicFejyvxvWjV8KPYSxEQy341A06a9Ps0wurTEXftw61SHMY?=
 =?us-ascii?Q?4zhY3iw7Rkge5cL5LRny1c419Y4ROgaL0H33Q/UGdTu44NjK1lvGT+SfaRYt?=
 =?us-ascii?Q?NxR1YMWxSfeRHTxPkMEEAXBAR8JDcwdF7FGjlXaZfLC60lQxwnWOEkE608li?=
 =?us-ascii?Q?XhEc5U1iaZworOlTEVJW5EcRU7PhtRGi/3pQ/4LXiujM6yfo23aphkwcO5oe?=
 =?us-ascii?Q?+kLqQpG1B/5RmgjkQ4TUkdg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1586d5f0-c6c4-4a86-b3af-08dd6e1e8370
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:32:29.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c6TOlrJ3s39U1QEl6+sdu6mGClqavaYs9ZCBAFB96vbVAbSeIcuigNxm9teLNgvyM3UCdDUgHWUEC7zOlmKGSieTqjw3fnQY73WKvpzGzCu2Hr/zHtLPVNzgxCSjmGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
CRU-IP that is mostly identical to RZ/G2L but with different register
offsets and additional registers. Introduce a flexible register mapping
mechanism to handle these variations.

Define the `rzg2l_cru_info` structure to store register mappings and
pass it as part of the OF match data. Update the read/write functions
to check out-of-bound accesses and use indexed register offsets from
`rzg2l_cru_info`, ensuring compatibility across different SoC variants.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
   accesses as suggested by LPinchart.
 - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
 - Update commit body

Changes since v4:
 - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
   as __always_inline

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
 4 files changed, 139 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index eed9d2bd08414..abc2a979833aa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -22,6 +22,7 @@
 #include <media/v4l2-mc.h>
 
 #include "rzg2l-cru.h"
+#include "rzg2l-cru-regs.h"
 
 static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
 {
@@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->dev = dev;
 	cru->info = of_device_get_match_data(dev);
+	if (!cru->info)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get OF match data\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg2l_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnINTS] = 0x8,
+	[CRUnRST] = 0xc,
+	[AMnMB1ADDRL] = 0x100,
+	[AMnMB1ADDRH] = 0x104,
+	[AMnMB2ADDRL] = 0x108,
+	[AMnMB2ADDRH] = 0x10c,
+	[AMnMB3ADDRL] = 0x110,
+	[AMnMB3ADDRH] = 0x114,
+	[AMnMB4ADDRL] = 0x118,
+	[AMnMB4ADDRH] = 0x11c,
+	[AMnMB5ADDRL] = 0x120,
+	[AMnMB5ADDRH] = 0x124,
+	[AMnMB6ADDRL] = 0x128,
+	[AMnMB6ADDRH] = 0x12c,
+	[AMnMB7ADDRL] = 0x130,
+	[AMnMB7ADDRH] = 0x134,
+	[AMnMB8ADDRL] = 0x138,
+	[AMnMB8ADDRH] = 0x13c,
+	[AMnMBVALID] = 0x148,
+	[AMnMBS] = 0x14c,
+	[AMnAXIATTR] = 0x158,
+	[AMnFIFOPNTR] = 0x168,
+	[AMnAXISTP] = 0x174,
+	[AMnAXISTPACK] = 0x178,
+	[ICnEN] = 0x200,
+	[ICnMC] = 0x208,
+	[ICnMS] = 0x254,
+	[ICnDMR] = 0x26c,
+};
+
+static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.regs = rzg2l_cru_regs,
+};
+
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
-	{ .compatible = "renesas,rzg2l-cru", },
+	{
+		.compatible = "renesas,rzg2l-cru",
+		.data = &rzgl2_cru_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 1c9f22118a5d9..86c3202862465 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -10,71 +10,77 @@
 
 /* HW CRU Registers Definition */
 
-/* CRU Control Register */
-#define CRUnCTRL			0x0
 #define CRUnCTRL_VINSEL(x)		((x) << 0)
 
-/* CRU Interrupt Enable Register */
-#define CRUnIE				0x4
 #define CRUnIE_EFE			BIT(17)
 
-/* CRU Interrupt Status Register */
-#define CRUnINTS			0x8
 #define CRUnINTS_SFS			BIT(16)
 
-/* CRU Reset Register */
-#define CRUnRST				0xc
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
-#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
+#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
 
 /* Memory Bank Base Address (Higher) Register for CRU Image Data */
-#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
+#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
 
-/* Memory Bank Enable Register for CRU Image Data */
-#define AMnMBVALID			0x148
 #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
 
-/* Memory Bank Status Register for CRU Image Data */
-#define AMnMBS				0x14c
 #define AMnMBS_MBSTS			0x7
 
-/* AXI Master Transfer Setting Register for CRU Image Data */
-#define AMnAXIATTR			0x158
 #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
 #define AMnAXIATTR_AXILEN		(0xf)
 
-/* AXI Master FIFO Pointer Register for CRU Image Data */
-#define AMnFIFOPNTR			0x168
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
 
-/* AXI Master Transfer Stop Register for CRU Image Data */
-#define AMnAXISTP			0x174
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
-/* AXI Master Transfer Stop Status Register for CRU Image Data */
-#define AMnAXISTPACK			0x178
 #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
 
-/* CRU Image Processing Enable Register */
-#define ICnEN				0x200
 #define ICnEN_ICEN			BIT(0)
 
-/* CRU Image Processing Main Control Register */
-#define ICnMC				0x208
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
 
-/* CRU Module Status Register */
-#define ICnMS				0x254
 #define ICnMS_IA			BIT(2)
 
-/* CRU Data Output Mode Register */
-#define ICnDMR				0x26c
 #define ICnDMR_YCMODE_UYVY		(1 << 4)
 
+enum rzg2l_cru_common_regs {
+	CRUnCTRL,	/* CRU Control */
+	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnRST, 	/* CRU Reset */
+	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
+	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
+	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
+	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
+	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
+	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
+	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
+	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
+	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
+	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
+	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
+	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
+	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
+	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
+	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
+	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
+	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
+	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
+	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
+	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
+	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	ICnEN,		/* CRU Image Processing Enable */
+	ICnMC,		/* CRU Image Processing Main Control */
+	ICnMS,		/* CRU Module Status */
+	ICnDMR,		/* CRU Data Output Mode */
+	RZG2L_CRU_MAX_REG,
+};
+
 #endif /* __RZG2L_CRU_REGS_H__ */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8b898ce05b847..00c3f7458e20a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
 	bool yuv;
 };
 
+struct rzg2l_cru_info {
+	const u16 *regs;
+};
+
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index cd69c8a686d35..c82db80c33552 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
 /* -----------------------------------------------------------------------------
  * DMA operations
  */
-static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
+static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	iowrite32(value, cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	/*
+	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
+	 * rest of the registers have valid offset being set in cru->info->regs.
+	 */
+	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
+	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
+		return;
+
+	iowrite32(value, cru->base + regs[offset]);
+}
+
+static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	const u16 *regs = cru->info->regs;
+
+	/*
+	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
+	 * rest of the registers have valid offset being set in cru->info->regs.
+	 */
+	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
+	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
+		return 0;
+
+	return ioread32(cru->base + regs[offset]);
 }
 
-static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+static __always_inline void
+__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	return ioread32(cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	iowrite32(value, cru->base + regs[offset]);
 }
 
+static __always_inline u32
+__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	return ioread32(cru->base + regs[offset]);
+}
+
+#define rzg2l_cru_write(cru, offset, value) \
+	(__builtin_constant_p(offset) ? \
+	 __rzg2l_cru_write_constant(cru, offset, value) : \
+	 __rzg2l_cru_write(cru, offset, value))
+
+#define rzg2l_cru_read(cru, offset) \
+	(__builtin_constant_p(offset) ? \
+	 __rzg2l_cru_read_constant(cru, offset) : \
+	 __rzg2l_cru_read(cru, offset))
+
 /* Need to hold qlock before calling */
 static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 				  enum vb2_buffer_state state)
-- 
2.43.0


