Return-Path: <linux-media+bounces-30049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8402A86456
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789531BC5862
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C182D221577;
	Fri, 11 Apr 2025 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gVlG+2aW"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2E230BF7;
	Fri, 11 Apr 2025 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391262; cv=fail; b=lPqVXAF8ybYTFTR2pz2Rd7Wkvklw0G8vmxeECzWKtpx+KG34F8BOaUA2uaDdITyPI8LBpI0Hi4pi6kiDSIZk35XPdXZTQVlROd4XfY6Rs+/HEHJkAzO/BBJ5ij3dMH2TTPhMCn2jvRVZcEEA2cmIIY9Jc6obU5OZ2GDm2uj89Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391262; c=relaxed/simple;
	bh=gk2f5O3tX4SENV+cB0k7xa34lZ1ZnngCnzzMe/PyGo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qvo1gMevhYOzghG7PsfavY+E0uOYLXvb6gnq7Fr9LdXJzKjLsZZVaCF9vzSFo9KYecYvhR2GUCOj6mpORx5PRjTqWHYyym33bkKDLh+4lzh/ae0rG65RnjL3isEgRmAJO6yTjuvfK4i0VpT695cWLJMfhILWRaDZrzoVgRRbhNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gVlG+2aW; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IShTu5cNv4efscagVE5jkJEhovlhG1d881VNjLNLat6gHn/aBBPglLgqY6Cyrc+6Mmqm9JmdSk25dF8nDu34HBaaWMHir8ojlyRvi4aOqXcY9YyXWJnJjUQAWhkhafUU2e8p2r2ImX29YuSzCi9oPe8rO6aAT7dpmDt944JNsBu6FN1l+pt/dZWHhv2f1ybzUDgVgdcjV4CzhUK2JBzQaFKUzIWSqepqIh1a1veJ2BKC5sWa2W2GN7b+kQmAMUeF32b2fxBxt771twC6PaLbgBglZ6CnGxgwn77Z8+TX8AQQJVEmNNt/0e6/yL6kxDyXBCJoUWgcVSrr4nmbnbl2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O80LhtIrIy/abMehTBvd3FaXj5QPLwAUb4l2HqwPAFM=;
 b=VDOOMRJ9WZjT7iEo8TOABKD7vbcYjAJMdtFOIa0MLJKcah3zqBjdss2d8HcjupA3/oM/ObYeqEp4mMIo2hvvgvKbchtR5EoOd6qGUx4Us75n77mdc/fvb0n5IfbPye2vl+R9nb0iIFVF7i3sJgGgzUA3mh6liNyWIZGkyChcGmHWru4P3CGzS+B6CvmnG8htAiTrg2siHz5M3ZO43+x4Lw0OgN4SXHTHFyHg0xdaFWG/2Djh2FVW1NphKg/qsPmBfep8buqF11bh79sWJixdD8FKzRiqEOrARQIxAcJGDzwicRT6nWygymbazcLQ1xnab01fyF7bq6PoZVdyHfZeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O80LhtIrIy/abMehTBvd3FaXj5QPLwAUb4l2HqwPAFM=;
 b=gVlG+2aW9ThORy8hrjOsH748fCeovzCo3l+EJsOm0zK+nUW8lGZTfCsEyzcZMfEpuQIC/ZBeZpVtjCPg6tDystPXPKPkDfi1kfP9PpAhOMR68DJRH3egGS4Llx5Fud55G4e+TvOHn7Ae6u2jnLkHQGh70gtI4kw7/LIGk3+/PN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:34 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: [PATCH v7 07/17] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Fri, 11 Apr 2025 19:05:35 +0200
Message-ID: <20250411170624.472257-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a168ab-27ee-40ff-d9b1-08dd791b5a0a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yj0OxnZkQjqwrYI3GuWyIk6rCvAzIutK+yt7FOr1bkS2VbbpB33bvROx1DHi?=
 =?us-ascii?Q?hrVGMQSTaT/X2JS/m52zMF8FKje8snKo5rT6Ts1R7j5VzOJunGQbT5ZtwGcp?=
 =?us-ascii?Q?8QTzub4q9jUnvUSm1H4p4ll3aIjEuypVjw2vRCGPo5Bj+XSAB+QjCaTD87+3?=
 =?us-ascii?Q?KvMqn764cS6qZTxbijdBo29XG89M6vJkXbqchC7iM5f4i7GSwqlHa0HfhhHD?=
 =?us-ascii?Q?R5OKqMY6IUpVdV+gjyOi6aCLvXASSRFcGFU29SFInRqGGn5R68twei/YhQqZ?=
 =?us-ascii?Q?jiExSPtHQHBTqg97XtUuXnox2KJImePtjs6ztvA8yEjjW4eQT6UNmm4occ4f?=
 =?us-ascii?Q?JqXEHgajLaBgwOxNrV5cTVamSV53wsEjn8d4zGGrGk7O4jaq3+iF2mRHw5EW?=
 =?us-ascii?Q?Y+pz8ed1QT14Wuqedqp985xDnxWJ+ox3pTdfr46Jd9nbsO8NgGFJVrhpH9xH?=
 =?us-ascii?Q?drbQebaCF5Lrwwr43ZhfE1qMlsvzw5guLJgcSk6/xkg6myB3BaDMB63vSsxL?=
 =?us-ascii?Q?H5Usj3tqmBVConPlAWZJMlc4n+O/fj8DBVMUpg3GHxKm1FeSfHTRtwIWo8KL?=
 =?us-ascii?Q?81KhSIMgFnbuy+FUMzjXQFhldzHETadZhiM7/l0JrJCXmPD39Rs2BVhGEqd5?=
 =?us-ascii?Q?5O6ot17fIDjM2Cj4cOV5RahHo2KvC0SEq4+lQHJoSfXN8QGHqUmZwUSErHlz?=
 =?us-ascii?Q?BaowyQrru+Mp8GQok0WKD8AduV576sx0vweS0mpC3qG3UlRCD9cTbxPhf3ea?=
 =?us-ascii?Q?a/GTtYgiFVm5lSa9jppqJe4Pu/3AXoD45mCEfRGzaYhg08fixMjE0t/ptzE5?=
 =?us-ascii?Q?jf+qRem6zNj3bfslFBHbMpX0pclJgXr+DxO8N4qXTGtdg5E+jPI0N5xJKy1i?=
 =?us-ascii?Q?qo6GoX+/ChTzyjfaDkh7JqKehtYNqpwXecPCKQ3oMvYMZyonaXYpR2A7xeNp?=
 =?us-ascii?Q?ZzAqV5myJ+724Zoc0N89bfMVvFKNl0JW7sJSBv5BINMI1jeOUlW3vcCBmFKr?=
 =?us-ascii?Q?Zj1kcSmtvoppjDsv6j/NKK1g3xyUXWkzt3XTdB/DPH7ZIHU5zHKgGJhfJz6u?=
 =?us-ascii?Q?R7hm2fuhiw2aXaKMkn7rkX2xXAnCSC89gVtSbeG49uEDC2BP+6HZq+xLJ0W+?=
 =?us-ascii?Q?Z1WvJfJLBen5taBLmW+EzGdXwBdaPFBCfl7LVHvBkvta6IybJTs5ZFbNOVLP?=
 =?us-ascii?Q?GGTwsVKsOIfEpObZkF5BM+VENP0jYwlur3/BlUtP5ZOsnJvOGWjz7JsdWJBL?=
 =?us-ascii?Q?q1yoKGksYFyyNFC6VPLjGXWgSXBHKvME3zPz/tcnLKSLgD7HcM7gFV5OPMGV?=
 =?us-ascii?Q?KPvQYyldbq6I4FIFgaBqtDe+28+AYgr9Q3C6G7tT0IY9QHPbKdGoRXhokEpl?=
 =?us-ascii?Q?Qqwx8VJX2tFCItXXAVUwvUtubHT4zckrxvjeQl1FiObxPfJ1XDo138Dbhq7x?=
 =?us-ascii?Q?zhOpQCnl9WJisYLBFdRnW8yowjLi9KXeBDHin3hpb0p6U76NU6XtcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jDmA5TWZLkC9EIidm0kWMg0z7sNN9Lu2I8wi49D1DcMQiEtsFRW7M2uCgek8?=
 =?us-ascii?Q?35YMWH3iC5PQ1bY22Wr7GlWPYw/BeAaDlb2vjCZAbMyfA0FW22CKsyyA1sjy?=
 =?us-ascii?Q?yFIfgrQKrW5TpqqQnCp5XZdUiY2DzUqgC7nZ1WprYeGigDwd/h7N0ha0Dr/Z?=
 =?us-ascii?Q?iKBaMEMIZ7lEI93UogB/cwhbiF+x/MCAvSUmdtXVyUpNvZFHIVj2INHNLpOJ?=
 =?us-ascii?Q?oycBCKtEQKJsTRAT1E6/P66AF4gBj9F2BpPvMmqN61AxAp69vkS9sQEhNBqd?=
 =?us-ascii?Q?uauLZe9TAue1i+CTlbPBtJMriL1Y4qsZmYcfQUy+GX3nPkZfLG5Y18EUVd+l?=
 =?us-ascii?Q?f2+Vh41z/5SSfZBaIRF9yfD3vZAP8bC9LeQlWA6yukR3qhWvM5dgUJ0+RMqQ?=
 =?us-ascii?Q?9VkPfIvGUPZajIe60L3Z0h9PYxHsmbOQs+IgDup6zk74UwjpTA8eaAyls2PK?=
 =?us-ascii?Q?BXwHBt/f6mga1ypuLOKzQiJ3FSQOR7ZhgYVhdwVEM/UuaB6+ur597+yFP3Q3?=
 =?us-ascii?Q?tYKgxfo/EesFrZGk6Dd31zQvLyLRAOC9QzM+oCyWatHkvfYNI7TWuM4KDF4V?=
 =?us-ascii?Q?zD/JXFT8otK183vt+ZTEB6EktDgpwdF9VP04VFHB9KYILZSSpw0+ns3yQ4tO?=
 =?us-ascii?Q?wz2OohDMVweEf0WJG+dgslS5bBCzKGRSxH8NKrnsQcexo0h3G4jM8fjvOs+3?=
 =?us-ascii?Q?ohFcZPuqiX9VWO+BbQIq+fM9wzFcvXLRm8w/xkFByRz3KhN28fBl3+JMvpUR?=
 =?us-ascii?Q?ujQ49F2btA5jI1lbTzuaAyAPTCR97fIIVGlMk/13J9nsXSSSOmvwho61e5mP?=
 =?us-ascii?Q?owWCtx1EwGKZtC4I+gUT5ilJfPKmareuFvFiwAOojBYtLU+5FugBWbs1iZyG?=
 =?us-ascii?Q?+FDijuANNKtpepK4nBNhYAJeskJenfisbmL4Trk4KJ0EgDckNI4ot+i+czNa?=
 =?us-ascii?Q?D6GK8jG+SG1UoxTOoQKAcb/eP0lkpvnK5idsWbHrsvapXt4SXAKoFPYpYz6P?=
 =?us-ascii?Q?9nezSkAMjry8vPgKFTJxPvjnK5b9SzRBUdGkYJZCxJKRuTJHnpYacMRSUltG?=
 =?us-ascii?Q?GlmULj2VBN76y4NrBvyXdFVu4gAi9L0mki1/oun3zLOsiHiWtXcexDsol7W/?=
 =?us-ascii?Q?vV82ww5wdRbXIYounugxVm+mG50xMiZkqV+48fNnqOC1woyxV3HbAgaiR2HP?=
 =?us-ascii?Q?hPDQMsRs2EqWrEpyPDM6U/JMzvTJgFhubIDhP+CAamnf/NBmluSjREyyJw3f?=
 =?us-ascii?Q?as+/FhyyTSea9aOLRjkNBnev80KduLARaDHLcolDmewRRTXmhxpqi9HuolBj?=
 =?us-ascii?Q?JLj0tdI0r2PL96JB0+mYFg1koZDL4DKB3t6RKEi5tiqN69UYQ8i+3C1vsr98?=
 =?us-ascii?Q?UPmOHieYPijAloPpo91vc+KqidS4tj+82NFoEKtLT+EBKpg6cwyIQ2uH7939?=
 =?us-ascii?Q?XSAumer1G6c+w6RR/o+OlV+FfgkTJjO//ePu69dtHkcHhAb8kuLCWC+vmJIW?=
 =?us-ascii?Q?FaLhd7fi/ToW7jd2jq0SeWB7tXfK/9W5oNtrRCUCGj1I2OyePJD19B6Nw/LI?=
 =?us-ascii?Q?N+03CnhJxFYHWWuit5Pjp5CWe5t6e6cD9RXoSEFewUbSIigS4ZwG9ISNWNOZ?=
 =?us-ascii?Q?EXu2E7Tf0Mxk6ib1CkZAfUE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a168ab-27ee-40ff-d9b1-08dd791b5a0a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:34.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gis+PW+xi+VDoCyLGsfXrX0qzRFtBT2Q6kV3tKNrNpUaGEspNKK8InlTARfI4XHWhX9yc8Nc/8LvQESIU4QP9H1qVlFGI1ASVK3ONsVg+fOIi+HIcmd2qkqR8smhn/vf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed DMA leak as suggested by LPinchart
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea0..eed9d2bd08414 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto error_dma_unregister;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.43.0


