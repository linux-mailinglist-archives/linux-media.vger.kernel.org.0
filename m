Return-Path: <linux-media+bounces-28951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D373DA74F77
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B579D1891B60
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF248248C;
	Fri, 28 Mar 2025 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UTvvLUFb"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653391E22E6;
	Fri, 28 Mar 2025 17:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183206; cv=fail; b=NMhBEML48mi0j0g7JEZCZJ3I3Ryf/Ym/LpvoXRq0jK8IgjvW6fs9fSXIpOy9+0LLEuaZsMumVlUhMO+iZdxjIcRbonnjY9BwLXt25S0yaRd+cNsjj/Suol41a/K3jnvsLSWJgt9OuXegsyCNUZw19K+0kj7HT9J//6fANh3ZQBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183206; c=relaxed/simple;
	bh=wsl7y7uOGcJSHiFcWJMWFcv84S1B3QEb5pApkwW7URE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fywXkecfdlziu0dGmoEe+EOzpa0oSBSizqnizwCAc9FArKVp3HvOQST6KjPtYpSn8cwmEqkYZ1skQ4UiiVh+b2k9Dq8jgYzsGr3EqUKRQp7Laji40yy1yJAAntpCLfn/JT6gqZeed6VBCKWJVo4tvX8Gpgoezt2RDnWvt2tvePs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UTvvLUFb; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu+7rmSdLltAwmho0r6soJWtpTpgJzGZkdoc/g0fdOfTgCHf5iyNAlvALM1CmnZEb0qO5iJsJ2owgxW9VToSqwepIzJkrjINqzedkL02Co0mOFehYjJUzgQn9omfh7yHk692u4GrXdhoMAnByRfWXF0B1PyIFVduAAPfPVtUw/M3i6ItcvGJMBXgN6QABsgS26G6J6jnJEeN5MchZax/Whgi9pE/agVPFUQJ1FPpIvotQnw+Tu3E2GbAzBhQBTC+C4C0giT8GwQ3wZnUpovxh1alzp4YF3nAKE+/nnP4FSGRnhUTwHmY2/Yyf+C4IDfeaMDZpvsZU/CxJquReJyhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDKPLWr81PGxfMO4ZHBjacoNXMKmIQNvXNl9P7GcS90=;
 b=rP9kEgyzXfaEG2g4CSYFaQtMWAYQBJoDVunYBTFter6dhMIHHyFWsM53QPz0JS9DFr5gowfAWs1IQXLEnp1t9YOX/ASL6HmfxixLA04RokGzakf8TCMxGGtirImmYAoZCjaRa3lllzZDuT2Di/vu3aQIpbjUr9j8DC/YFcgAmKvJEPNvuBPFBrWyo8KB007Hpdfh1aQRJJCcNuFEZbJfCBaRVcEsEVdq4g2LuN/rXdx0D0+a5G8s/6KAkl4EbWdw6Wko6PnMJnsCR1yFhYMh+ruqkdwgWiyOO/NaqWYxMcBNvhBWE/tT2AifmpstrKElGUB+rRkN9u2xCfWZ1GnsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDKPLWr81PGxfMO4ZHBjacoNXMKmIQNvXNl9P7GcS90=;
 b=UTvvLUFbD3UjYsmAgnU19ohEzNTdpef5faCLhuW3eX9ss2aHj1CbuQkruaFLuWua/+bOhhqmEK1vPBRRE1Pzhu4Ce07DGxVdllvBYEwrxaV/kKyQMTPet/HrADPuDB7FHsUnftgyrT+76YoHZDtZs4pGyotnMtDJPNwXHU3Unu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:33:22 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:33:22 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/17] media: rzg2l-cru: Add function pointer to configure CSI
Date: Fri, 28 Mar 2025 18:29:52 +0100
Message-ID: <20250328173032.423322-17-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e3fe58f8-51dd-4f11-0d6f-08dd6e1ea319
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UK0mlIT7tEKH86bNLyoc8OFlIHV9CjogJR62ZUxGKZ5xi/sWBoFA3sH8deLI?=
 =?us-ascii?Q?SQfCRJDDltks8caMLievNyLoOreaG08MXXQNmDaCka8HiPHVEmqWfZ+8iffF?=
 =?us-ascii?Q?sT0x98LsNv3Yp7f9X4v3/n1ahw9UmPhEP1y4XLNrgCKFZEPvrSfSn/Ms4zPd?=
 =?us-ascii?Q?0NOnlCVibCTrQ9HbPQ8ywmS4GzYItJ17XtwYpIAav3PB20HMqzs4RXLgNu7X?=
 =?us-ascii?Q?5XMNDMDCVUV9Yj9zar7O6QI2v6b6+BOlRL2ed4vpLGhv7oyUpkjnByIXETJd?=
 =?us-ascii?Q?aR7kYQBYzkuiTZdTwgiIf1vs9ZNjWpI3As01eTEH/0bHFZ7l9maOxryAROFk?=
 =?us-ascii?Q?PbEtTZqqP+zB1mD4A/rmruhzVhlM5OSY4+p4iJ0T0npS00F4c8EFU01vxOAP?=
 =?us-ascii?Q?5+ie0n/+kfspsQqmjp5wJ8ooR9k7eayhso997SGt5CqiHyi3p90/jVIbdWI9?=
 =?us-ascii?Q?QfvYa1YN2Q/gENrxUxow3ZbGe3KZ412QDfI/kpf0WLDcIQMX+/Xc+IwjF1Wn?=
 =?us-ascii?Q?snfADLt3F/vnHgE/93I1yOSCqvFZijx/uQIsqtGCUEcO0gyuLcltBzkvo3HX?=
 =?us-ascii?Q?HbOd+WEjssf/hHV1W/SwosnQM4GKWcNeeR5B6HpLNoYSdun4lssvr+Y0CaHG?=
 =?us-ascii?Q?3z+59rU3KnGDXsxapxKon+v5GHdk/1Glh+h2+3ebunrf+nLcM3pNaMECUZn/?=
 =?us-ascii?Q?xi2NO+fwPB4mw1yWBov+Cb2cXDaZovs2w7mo51lEG9f12xNtq3lXyoAzPK1V?=
 =?us-ascii?Q?wFklfiLG/F1aMGZvAZedKI0QxmV65EIKlA50e0TZkNofd8l85o/udLnvkyW8?=
 =?us-ascii?Q?f2BMcsA8aXce39+dHaHd/4SLL4GktZ/Py08Rhtq2+R7ygUaFgsI5xRZHESKo?=
 =?us-ascii?Q?2RE4GpP0KJKbCRVrWG3HKyU9OfAxJXfi3HMXICG64qLDhN8soNukTShAuiPm?=
 =?us-ascii?Q?QZJcf4q0SDGFVHI0yN3MaeWbDcMlwANPVauGn80crMTC8Gn5VeU7eDFHB8+U?=
 =?us-ascii?Q?QIF03+cQQSlAXq0jSQ7XKE5/qCPR5cIhb+grFn8xkdUtBEtD8sAVF6LPt1+4?=
 =?us-ascii?Q?dGOfScR3VYz0noED8MizUd7hOCIWOGX4lSJW1bs7fidhtL5OUwwkZ65ojLgt?=
 =?us-ascii?Q?oUcnRv6nDG9YuYJ9gUzXz3NkqrUJnIQAophNm4GD0poKIOa9bc5cKEpFSxn/?=
 =?us-ascii?Q?mbo8TzzPUnCTPvJHvsRrNk88FsCmFL4lso6LEEupdqBL29GbIBBITk7Si4l5?=
 =?us-ascii?Q?vvYtjM7OL4DqyzYWUVaoX3HBx31bX2fl2zVFheF9ZWgOUjrTI0Mm9LwdYJyX?=
 =?us-ascii?Q?EyQsb8oDlfWYIAZ/0tc/F8XZisNfZZVggbroE/1hv5l3pPLed4UVTlUwMAou?=
 =?us-ascii?Q?/veTJsXVkSes22GPSnrcIDQN3rbACoGW3YH/5IPxVN+913RfDYdGbmzbIYfu?=
 =?us-ascii?Q?5P99CbotEGc9fpt8+zz3TsB97bvs+BuY+bs1FopA+J54ILpXiXAc8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pRXLzBrdrbscqygBf3QPn+xlZ++3ZNkXOTa7ULizmqJRwOK+WerMxIrqCSsq?=
 =?us-ascii?Q?6touOMFr0+Pe5FMyDAcauNUkVN2TI7cLSU/den/sjVh6+s7RPRCmAcuXb1hT?=
 =?us-ascii?Q?cqkv3X7WI8VPgq4gz0lOi+7cCDuXqWDCjkJaD2mIsv7opn0m4DWM7TZLeMKA?=
 =?us-ascii?Q?jz2fcaAuBNunKBad0fpIExdEmiZW4ScGi0TQeAtKvHX2wEpLNQewTi4fDcjd?=
 =?us-ascii?Q?4nI3b8ZvOzu5vrUjmziG/EUxvaxrFckKaamLHfhSH9p9iklj2FDLxKFSGebm?=
 =?us-ascii?Q?i/eI4Kk+UOIRDZzqLnoDGACZKKeoMvRm7XoMOAfMHB9RFdsRJXSgRWefosdj?=
 =?us-ascii?Q?9rBaaQEbPzj2NuKUhG5/a75QVEEmNkofHijUnQEUAEPfJDg7SucQb7OoOjMQ?=
 =?us-ascii?Q?xKDXjMYTHCKA2UQcQHDpa1WDKiHO8jU9YfzaVJ+qQfEG4jGwxbKTm617aSmC?=
 =?us-ascii?Q?SKDtDiiZUQKIU7tlRwFZGOyJrTpG5N9BYBtC6LJC15VFa0YjO7MrSexdi7xo?=
 =?us-ascii?Q?dNVrS3br6yTuH3XrRjzlA5vcDsgPdC85JWIVQ3mK8+GC2TGTHNg0PnkYmEBV?=
 =?us-ascii?Q?KRJDmmpskYZipeoinvdqdiWpHORdXleBaJfGMYm3L/Iq7eh14tPvuO7Tq9fc?=
 =?us-ascii?Q?MBspblfoFiu1+tMlKHAwaEUwrGbsZXS1FYFyqNkXu57N5O1+WrJgowLghaG7?=
 =?us-ascii?Q?owhQ3738X8jtxXfC6MG6mU9NTS89I1mFrNSLRUDx8mWqSqzEevnKz/uAq2Ip?=
 =?us-ascii?Q?rTs1nZWMFka3InqEWY2srsrQFPnAqEKODGP69cKdyTLBrn/a9NEIAevg0J10?=
 =?us-ascii?Q?UVpe/tOf27Lvt+iW7ZPVLpb+/16zqkMhd70dpuCj5zmRTnCtPLIeOA8zjfRd?=
 =?us-ascii?Q?FKqKeGlMEtesubBEzg0PatNqe/OSMAsRc1cFD3HKF+BB6Yp3wIorcH3qSSeX?=
 =?us-ascii?Q?lkNwv4EavtexGFe7b7hXHEwxKJhoHPLjwLdiEvTZMyGNtaPQynEXF1MpFvjN?=
 =?us-ascii?Q?fSqEuOJvX0tik0K4K7X9YVJqUENtk96a8puJR5WnpXRseIgTJTzxgd0Byank?=
 =?us-ascii?Q?GefcQyVvleqGg4bJb68ZhgrPS5WYmU0vY8HCdliFG0NKsTSgWmQdQW06+R4n?=
 =?us-ascii?Q?MUYVqHWHwMBdOFMkcXKJHvD5KqUX2y3I4/yUF7FA2UW8+LuOxWPzCE/3qisJ?=
 =?us-ascii?Q?r9xBbZjrYdybX01ySHpZlaCJeSdfqwm1sF+9aKs4D18EZb8AG+wZSd/M/dqq?=
 =?us-ascii?Q?smF976abCOMU1PtC1MAHYuxXUTcZL2sX8JmDscskx52hmKkrhT520rtj/T3p?=
 =?us-ascii?Q?5NZqH0Kvh8o2K6vNcPDUk6A7rwhaOKx5lDNj5Ai03AxSX957HTlxf/h/h5FB?=
 =?us-ascii?Q?fcTkhPqciiTkdh5ufDwlSdrk2AAODqJeu0HusERqJovKVD0K7pQfsvJiqJkh?=
 =?us-ascii?Q?kQiZkde1WL9Djn0QETx1PvJ+QryTOvkizsXK6FBP1ZxL0AdQn1XOZIzXTbf2?=
 =?us-ascii?Q?Qez6Yl1Q8letGGyOG5148BQF5iuj7L9yB8ZwxZUmeJJ6Iz1sU8/cZGBLjcp0?=
 =?us-ascii?Q?ikFylh7fWn6Re0FQzp/WUA9i5E/k63BxsaxtVtfvRi580jyTZAOsWBqex1pv?=
 =?us-ascii?Q?7bNq72e9iZUkKQzMzUVwSJ8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fe58f8-51dd-4f11-0d6f-08dd6e1ea319
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:33:22.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNHiRmaIBExAtdpm8tgLlSljvvlovhe3ai96pkoCOq+J6kYAonsXUVqD8r3gmb/4nBkeNpN20chzAUgjXeS7ifRDCWCAb86lFF6+tTraJ9qTKYgE8t+ecCG8mRKG90mE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
register configurations are required compared to the RZ/G2L SoC.

Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
pointer and update the code to use it accordingly.

This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e4fb3e12d6bfc..3ae0cd83af164 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -363,6 +363,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
+	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2e17bfef43ce6..ccaba5220f1c8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -89,6 +89,9 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
+	void (*csi_setup)(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 };
 
 /**
@@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 31848dc463381..748a0855b3245 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -242,9 +242,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-				 const struct rzg2l_cru_ip_format *ip_fmt,
-				 u8 csi_vc)
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
@@ -266,7 +266,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
+	info->csi_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.43.0


