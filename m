Return-Path: <linux-media+bounces-28938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F64A74F4C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64D111733E5
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DDC1DF747;
	Fri, 28 Mar 2025 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XXeBkZx8"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0E1DDA3D;
	Fri, 28 Mar 2025 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183083; cv=fail; b=Su/3ZXlQsUrR6VjXPzHv23Iizcq9N1RhiILpoqQeJUTxfBAwVMhCg0JbWlKXld89oyGodxQLIaIue6AeV4HItWjwlF9FXD5BbEWwwn3fhU9s1JraN8INNu4JZ7FFJcPRzyktlX+VZSHGfyjO39O8KmSxMYHwC6r7d6jl9WEEc/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183083; c=relaxed/simple;
	bh=5lZh7HN+FhdMMBUEgU0P/qwv/7pYJNB9JrQ4K7QqGKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O0Q8fPQwEU1F5HSeb01X4iSsfm13C0TUzRk8n2BUHqubQiHu3EBYM1i5xW3M87LuqsXV60EDApa1PIz55OrNoKzVOtRwQR0qVcwYT6gALxgxLSeN+xaljSsBEYTZvRJRqgGpYvaD7QBzRtR2PEzE8N8E+3Du3lmKsTe/3bAQE5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XXeBkZx8; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyCTTZ7RpwxCGG9bsVVZ3+w58iER/Fwv7+VpzJe7jcroUZGhtJE9xoqKEW6oHfEPsLjMUaVlIBRIlhGxH59tpZDJptLyIYP+Ryl35OKiBA5u6ltpNchuXUyxoAnY9VvVeuPHtgkP3E4EwIX6p0s/W9sjfnO6qMEO9qtv/bh9AuiGmUBWpGHEmX76CKUjbBNiYnkbfFvLsZ5A2v/+QCItCpflZj4OKvs7lurmbCJ1/lsXddX4eQgru2njftET2LPyLtffWAyCFW4C7pZ/+HUAo+Al+BUXgffDemJZYSB7oDDKvhIgRh1KTFDR9ZBCnWIUaMApM4gVWXsBMRk4SN5Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKusPT3wHBmXFoee0MVMf1m+kJjTUL3CN92mSEDV6z4=;
 b=PsxLJ6CKkcoO7iBC+EsBHEwcoXdlE0XbFXy4BwIu6xm7SE+yJQMlpnUVJLGgvgH8rjPNPbKCWCIBpunfxwQbPAPlKOutiA2ZKxuXWE/ofeNMbEUcIIQqoCIRAFd24v9PG0vHviaQ7zpe9zLs1kq4eE36Q0Dv5EoPu9ry8w7oBCwympR4hJ1ukA6kvdK8UT6rrP0AOxqLRdmGmoV516kKsYLMEbTXmnX4RwqvH/cGw2rfyQKT3M2icyed5mKfEQ+2/OxBeawsUr67Lz1jUta3pYmSHCD2/hgctO7xwEeudg3QUIzFF1MXzDBrmhMaPXfIumazJDmmfBQmy6G+r0de5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKusPT3wHBmXFoee0MVMf1m+kJjTUL3CN92mSEDV6z4=;
 b=XXeBkZx8Aj8XpZGFv1RuACvgdO/ogcGNDkYLwFwMzihg8xHqqKT5JhhcD2jpzTenMbrGPjA/bqO2nw6VgCtXozuJbLw34LBNccgWdAZpF3ekEhwY1qd9st3UIWHt3YPKsKOehi8qdtNbltvHuCABb6KnzVIUapfcG6gP6P2oApM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:19 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:19 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/17] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Fri, 28 Mar 2025 18:29:39 +0100
Message-ID: <20250328173032.423322-4-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 909f0e3d-4d6d-45c0-e3c7-08dd6e1e59d3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+NdwqfklBv/U/1LbKDbu7PyOcU0COsqtAhG9p/kIgjSKQajG3UXEFtIqYAT?=
 =?us-ascii?Q?hr78W2OSjj0Bq3YYk4Ti/MbrvSHXO7TMvgKXS6snMpUl+DHO6LDUiDR8WACm?=
 =?us-ascii?Q?DS+wbkw/rsyjl7WparSD0pVNcWaYiK57d+JElU47vtCT1OsRUp0Qycy3+L6P?=
 =?us-ascii?Q?80v+Of1Td9O3BTW41LU9+xMxLZZZuIn/DIsui69UpV8wKoGDAHiGOCn2oCkB?=
 =?us-ascii?Q?ICop7wLUjFDlyYdTSCnqpDBf8oJL24mopbGoJKr+KLlc7Rjy21pmbCZ4UHwN?=
 =?us-ascii?Q?IFsAOUCdJdG6IC6OF1jYUQj67a/CsHSGRTTvzWF8UYg1nkeWHglKcXNdBPAA?=
 =?us-ascii?Q?VwD1EjDOYtKWGTQfQQbVlcdF5isSDoTFIFmqOT87jT5Qhypg7K5Juap2Nzip?=
 =?us-ascii?Q?hPyFBHsWSXJOOJIJzUMdHp3yA959fjT2WzJHNhdLNFksycVcEcQsdNNh7ECI?=
 =?us-ascii?Q?xBsVs2F67i8ChvpxN38dzD/NH3B9dEU4z1NtV+uYGbrSfuLuLitYOhhGSfXe?=
 =?us-ascii?Q?CCG6bFynY9FeTxaJVsnY2k4rgGOBmeLSQQXDZ74aOkRUGHdSAazZwfXa7JL1?=
 =?us-ascii?Q?5BH6cTF0uFOp4LCurNIzWFO0rjiTq3hbny6fgj5VdcD8IZ3CcBzPSX75D6h/?=
 =?us-ascii?Q?TcUSRC+3PNMbMT+2n/3YDygWANntkZoolNTimK+x4OhiyLjXg/0lDcb38OO2?=
 =?us-ascii?Q?gHwbcjyym/DKgpvD8xRoEpTmxc9B5fJGUA+cr2e4glVLmitM/TQRlhH+fqrA?=
 =?us-ascii?Q?GSEC/WEycv97iMEbPRQo0IneIuYciYjfgRDYgu+BwFMp2OfHe6ruLDQnAAFn?=
 =?us-ascii?Q?cHR4lDlifTncLZIbuMEfJN1o6nOckKUiJV/Q4T9YL4OXzHXYvG8ih7HBu0Vp?=
 =?us-ascii?Q?AYvUmG+/pvOWAjtnuT+Lncz5o4CMOiwPSjHRfDrJD7dysFyf87JLqX2aCs2H?=
 =?us-ascii?Q?KAP8T2PUP+peTXv4ZzBF12Qe+4qYQCrRkOr2F3Kkhk+4ttK2AON7b+gA2Zrn?=
 =?us-ascii?Q?OvVrSvU4BCVfwrb6KC1sFc7ipEzwvUi22fqBCpozhsVa4Opr4zLrW+ScOZ5u?=
 =?us-ascii?Q?jQqsjG5kg+A9+vAr5xM2Z128YeXriGJkvChlOEq6mK/DylUz4gp4W4MBHvLU?=
 =?us-ascii?Q?9wo5NKYflq2b7mfM+qNy8/7oKdXvgVmP23nxaZqzxzyRuU3/YF7Sa0akWLrw?=
 =?us-ascii?Q?xOdTm6uduHpB7hvsaVcr//eJm4FdCFpQOny2CvzkbMAh8t/b4ZHlIWh1qVj8?=
 =?us-ascii?Q?mUOfaa7ajfE+IzrWn93ualLyZ3yfKqNbqyz3McMiiZ4mMCWlp7WlBk7GFYkW?=
 =?us-ascii?Q?QLYp1Jq/3mMWmdnt8OhTIOkCnqHOT9yoJK9TBeNQxW2vzJYVEYT2gduDO6fc?=
 =?us-ascii?Q?jWD8NsqBjby41HSgvO8b1bjG1EdRBQ6duVu6dRRG/iaV7ZpRuImNH5gKDWtJ?=
 =?us-ascii?Q?Xl0sLOWGAjJN9KRuOsFg/o2v0eEkuF7weW+oE4AXOpUiHScQ/Q4gJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BMblQ/fK3pRW02QZb5S4FRTS6lrWbL07fYxC1h4pJXIQtZK1Xyu2pNGS3SaX?=
 =?us-ascii?Q?UQb+G0R6BSxYdthjhNBDPsCSAtX5/jaXWL7emekDI5wdoYTDhD9M4tgBg592?=
 =?us-ascii?Q?WIZpW6kkbFKjSY9R8WyeU4mnhnUCbTlgsvlGFRIFJAOo8XpsUYgnunL8E9aO?=
 =?us-ascii?Q?rceFn1XvQ1pERUh2OsHHEyECiUiYA4IE9Lo3m1LVoMmLDL6oUJhkdccYnokC?=
 =?us-ascii?Q?WJ6UwX6ZSTZn3clYSbIbGm4UFa9jUYnq4ivdxCc2g/zAMdGIACbWLxcltzi5?=
 =?us-ascii?Q?WyQGAT0mLEafeP9spftZyr7cruiD+p7XycErFrGYEmdOz4NfhZn7geGKryX3?=
 =?us-ascii?Q?bOLYsqQgZ8NIaRtLDlpzahx5tHc0sp/cYZTQ6aFaGWpPAuZX2c6kZXDJzwgD?=
 =?us-ascii?Q?32vh6uZdj25piC3nCdx6MMq0Uvd8IUoPNdmHNiYfY1iogTtaVD1L7GXzvbcQ?=
 =?us-ascii?Q?snskKVoOX4BRZ78St6T9aEFVgqgSgbiI6F8J/YyKWIia8NlOLqpjlQJBwoBN?=
 =?us-ascii?Q?AiyybgHZZ3TnKWYF+7JdrMqyYxAxcafaxGdd2Pka9zopZPsmetMuUq59BVwH?=
 =?us-ascii?Q?MXKnO72fHF0DnmQ/kOALPVEbwLAm3377t3Oz4x7A4z93HNl7Cm/fVxn/j2kx?=
 =?us-ascii?Q?tOC80RVminQiJjkFyB8AshtXUw+UMGYRLBhdCfG8g5q2EVZks7w6vabScWfs?=
 =?us-ascii?Q?CDAcwE7k1mldYJTdyTHU6HG1xWNexv0/P8bJkDW167VtmUGkQFsCGajp1lFZ?=
 =?us-ascii?Q?PejV6c6bzmSKL3iu/6Q6IuX6heQb5h2+TNcfsVSpz46eoc8y0yukiOmAygea?=
 =?us-ascii?Q?h1nJcokKRZRe9cjkyHSsI86xjESuOtt6+Vhtsezg5UlYBxoI3Phe4pZ64NMd?=
 =?us-ascii?Q?BApbOMBl3jFk6A47pkML1qBS6RObtqLYiSbossvvK9qYlKgot7oycF1Mv4qp?=
 =?us-ascii?Q?drxDpAlkKPRWd5pZy0zqFxvTm2PzpiH9nKSd9JL9fcL+EGQ8XABL10CUk7Ax?=
 =?us-ascii?Q?W4nOvZ6P7MLDhrT4C//zgVtGCn0N7ZkWbFzHF109/6KNtT/dtciyEhILu+nb?=
 =?us-ascii?Q?ozH2WhqLwwsYxENQJ2YvunFlrNZKPzki9ICoQzQWgnGI2ifB78wWP+BqB6QE?=
 =?us-ascii?Q?PKgs4E+KZoLgIOO94Nhdzr3IzeIoCvAfzMU03LanYb8IVgBJgjMkcRbW2tyN?=
 =?us-ascii?Q?4MhMkeWnIsTjYdK0MXZFuXIv55a8nomiOziU36ZeJYMgq7ShQoFLcW4iaDJk?=
 =?us-ascii?Q?/bQ4SIS+8N8TIktpuvrSafwzLjBZLoP5an7GvIAIffGBaMFUTOejOLGRkmeR?=
 =?us-ascii?Q?/ScqhOGgoTLKTw0OkhhQsOfnNuK/zfa87z7zUN3fyYYm1tFaYtSLvYLJIgdX?=
 =?us-ascii?Q?sph6l9RW71QzB3YNHRQMG3/G6e0FKZGK9XyG/M+5O2esHq4lZcWPZoMynGyu?=
 =?us-ascii?Q?2vmTPHqDvAvth9NfW9fRCIeujKICMIQPi2G7aBp0Qw0wMv+YyGCvXkz05Wh8?=
 =?us-ascii?Q?oqdP7wHc05XwAAzrsf6aC/mQCoYFJ1xkiPjE0XCEfQHmj3jROVlXHMehpUbT?=
 =?us-ascii?Q?tVD1W/GGv2bpTqv3dqIlkhGxUpOyIccriRhYA/Xoi17RjvXiXdlNUSDWOj2N?=
 =?us-ascii?Q?AZzVxzcmjZeS/7thG5Jj9vI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909f0e3d-4d6d-45c0-e3c7-08dd6e1e59d3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:19.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaNbTzkO39ufKw9fp8JeglxLmWDqEEiR9mtnDC7sWzxVOZ0FXizWRj1Jo8cVGI5n/9kZI3+yiRoEAvLgvdvXw/g69Dz1sQOq1cmdUqEanKmLXopcbH0+c7e0CKXkY2b7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
interrupts:

 - image_conv:    image_conv irq
 - axi_mst_err:   AXI master error level irq
 - vd_addr_wend:  Video data AXI master addr 0 write end irq
 - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
 - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq

This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.

Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Use oneOf for interrupts and interrupt-names
 - Handle interrupts and interrupt names base on soc variants

Changes since v2:
 - Collected tag.

 .../bindings/media/renesas,rzg2l-cru.yaml     | 65 +++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025e..47e18690fa570 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -17,24 +17,43 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-cru       # RZ/G2UL
-          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
-          - renesas,r9a07g054-cru       # RZ/V2L
-      - const: renesas,rzg2l-cru
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-cru       # RZ/G2UL
+              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
+              - renesas,r9a07g054-cru       # RZ/V2L
+          - const: renesas,rzg2l-cru
+      - const: renesas,r9a09g047-cru        # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 3
+    oneOf:
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU Interrupt for image_conv_err
+          - description: CRU AXI master error interrupt
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU AXI master error interrupt
+          - description: CRU Video Data AXI Master Address 0 Write End interrupt
+          - description: CRU Statistics data AXI master addr 0 write end interrupt
+          - description: CRU Video statistics data AXI master addr 0 write end interrupt
 
   interrupt-names:
-    items:
-      - const: image_conv
-      - const: image_conv_err
-      - const: axi_mst_err
+    oneOf:
+      - items:
+          - const: image_conv
+          - const: image_conv_err
+          - const: axi_mst_err
+      - items:
+          - const: image_conv
+          - const: axi_mst_err
+          - const: vd_addr_wend
+          - const: sd_addr_wend
+          - const: vsd_addr_wend
 
   clocks:
     items:
@@ -109,6 +128,10 @@ allOf:
               - renesas,r9a07g054-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           required:
             - port@0
@@ -122,10 +145,30 @@ allOf:
               - renesas,r9a07g043-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           properties:
             port@0: false
+          required:
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-cru
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+        ports:
+          properties:
+            port@0: false
           required:
             - port@1
 
-- 
2.43.0


