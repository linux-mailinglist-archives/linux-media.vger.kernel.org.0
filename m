Return-Path: <linux-media+bounces-28943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEEA74F5D
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883071891915
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113BC1E2850;
	Fri, 28 Mar 2025 17:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="htgiJKHo"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41E1DEFF1;
	Fri, 28 Mar 2025 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183124; cv=fail; b=SAoS5pI/ED7KHlX1ITNa0SulFEYt7kbmVzeteFzJjG6xUy/k6zht0aghRHlKm1SJoWglXYEYkIelzFk3E3VmqBxVDeWJRtBxQZSl2pBgSbyhDdjNKs70Pa5l+bb5hZoy5K2EDtMRzioUQZ0U9nX1yugW4oRZfbnfJJyAyRVRmxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183124; c=relaxed/simple;
	bh=8rPwWyKGU42djKH6MYxaE82TLxzNheQbC/s6A7rWfWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nw/+C48rAD5/DQxw5ESTyMtpavDozOiXXzA+pE94yX0xcspyM2AQcjk+CNNVLvX8x8QCOJ6Cr9FlTepss9s9LWOTmNjO2w6ZpLUijFChCGsNs+Oc8XT+1oE6x+maS2cSarasFRI4jZHTEIgTLWNB4/CQ5iSWmiVMAZR/aI2kb60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=htgiJKHo; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkOqShYhSrU0ypYlOjtDCLcuAqDN4etd/0WeHYCaNP7h0uT3sjXDTqnIi43eBpJOSFfWhaZZ8fDGd4dUGUZV7iVAy3ovF+JyDe74mmif4otAsc76v69I5cW4e65PLrudIt6FpB4xsKlJxK8aN8StejxERHV9oIEzJAFpHB7sMOdt5RRQe+mpshBc7qKQ2MzJQ6sAdrQ+vXs5B1gIjroFLrxv4j2WDmuCZzhK+5J0NSzNDll7hF6Jx/Dv9URZ2TgLnTXJ6cbJSZ4p0LzWFR1gir2lShsnh8sahpcjjwAytkxKbWsfW3+PKhUAUFm08Rb2dyTSgu1ZLa2QZEN+5dIIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM/KzKiGFXhJddIsb0wAEvP17kYlm0x8ySJwv+CLakc=;
 b=L8JIXfT6jXIDI7GbggphSA4Wm7l4nwwgbXKjuPTLbWEKEtEFqMa7BJJtkttWX5nS5f8sehRbj5AFcQJU7uwUGmXUQ66KA8lnuK1yf/IuG2gik0KyitUyhV6uhEzhRLZYUMX/y6reyEi3tVBqlp+TklEKvKKwcnld2OgeglH7FtTGryq/Cffq1XCdPCHHXwz0+p9xwa1FuPjRJrYa15BjCFw3bKSGDDHlZXxxPbREZIUq9A2j6MJMkG1LG6GBAEaAfi6aMDzGK8tmOStYKLmTc0MdYaqG/A+ZP3+YD0HQ3r1F2smN7Cfas7sI04+rXHmou5ZsowVcfWD1hG/FM6O+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM/KzKiGFXhJddIsb0wAEvP17kYlm0x8ySJwv+CLakc=;
 b=htgiJKHoHHDO5jMgqdqpjYkeK9rwBJOyYJfoXE5dI9NPDVfuS2z9gRdFGF7ROuX4Qh44SbtHD9fuY03xXUEjk+cigX8a7IGyZ55Ju+eFujCviDqWBgJKIN+mGCst5Vu/06G7lP47Vk2PhFS/iMBJf1vlxFbipLV05g1JrMx8KC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:32:00 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:32:00 +0000
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
Subject: [PATCH v5 08/17] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
Date: Fri, 28 Mar 2025 18:29:44 +0100
Message-ID: <20250328173032.423322-9-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ac862cf-1764-4c30-08a8-08dd6e1e723a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KFCCdDVr/RWQbheVSdnrQjqw0bq8xsF4tKlswkRPUdiI1si52afzHMXAEANk?=
 =?us-ascii?Q?ObNCeOZcfCrEYnb1GqRwUX9aqpeAbO/wP0w8TITNl6+rKboS/ljrvF86AhRC?=
 =?us-ascii?Q?Sj/M2VqnTTU2n48Hdg6Wyz4PnB7aY2yq97Zf7/1wjwJgtOWdPbRIz+tCQLBc?=
 =?us-ascii?Q?wyyTuxxmVhkYnUzegSfpwwbrrWE2BywdMWAfjPCj0X3VGooBC9l9T1VZzNvA?=
 =?us-ascii?Q?J0uEoY7pygvUAT9pKe54u549S16SMml4czEBRNLJLIrWSoGndY+zdY20iKFz?=
 =?us-ascii?Q?kYf71jh77eX0WSTvR9ZbBJk2lqdxyHF5XixrmGumIbPtm3bfAFK5cIs6rOzo?=
 =?us-ascii?Q?QJe7ba1KvdPE99xNduXJvAti0xVXkRliSHsugkNgWe9xKiykbEJ4m+GcpR0J?=
 =?us-ascii?Q?fIoA49ZY0Ft7XART1PC8smayS/GytSQnmxxugJXe2z9xsg0IGuAQaPkYyflF?=
 =?us-ascii?Q?UwM1gGt7E5ndBH4KdOYtI4fIeAjMgv1lxKwuVsuCXchpXTdP8iWP9jrg/PRb?=
 =?us-ascii?Q?TnvmwJgfIEAh32OlvqMnxQb2Y+a8BTo5Y9rYAW6hXySjvYXo4ynjWaHBHZAh?=
 =?us-ascii?Q?n/W2fw60V+11bB3TtCqAaIW5Wx4TtNLLINXFWMDtLdwSJbZQMC89m51TgyfW?=
 =?us-ascii?Q?4DoSIrgoepgMVYX9mCGyiMkATsgjWAgYdUHoLutpiIt6Nzk0Ha9vyF9HFto1?=
 =?us-ascii?Q?QROA9DyP9ZJtsJp7/QKQjnW7pORI7K4dLulRTjChaiL86M9nHyjmz249tzCx?=
 =?us-ascii?Q?4TLGAksvgXUz4KbhKY2zea4leOLFitcHxmcxx2ANAgHHPwM5hdgmlFuCvVTw?=
 =?us-ascii?Q?xJRIzWWvT/t7DPAD7zRdmKJuLTMVyA+QyqvdVqRA25mA82NfnA/iul07W5OX?=
 =?us-ascii?Q?9KN2SjLmd/Xm/iufQ4QWJcE8mcMBBbtM0blQ5diZs3UFL8CaxWJqijL+y+Dl?=
 =?us-ascii?Q?XpfhhTnt7y+DmcF7HKR9HjTxADkZUAYp7B43/5qvLIDV4MwroETnLVn0vsx4?=
 =?us-ascii?Q?J2yrTjvx5fKhZ4WGF2bWRG5zBSImAB4otQQk+/jFAJ7ziZRh8MLwyWbflruy?=
 =?us-ascii?Q?O0iINiCvTXPyfbqqNNr3we1i5Ft0nYI89q2KzgBRoQDy/tyUJGzwFs3Jixa5?=
 =?us-ascii?Q?e7CgQNO8yV5F85SBYOGLWwOdLAG8A0b3gu8FkUbej3rowrBc8XcHg7eVTp0i?=
 =?us-ascii?Q?l2rBgvnPHMy4Sanct9b4LFRC/H3pdu31HfQyPtTJKmzh2MrnB40CX/hDZ/nn?=
 =?us-ascii?Q?K7gqgkb6WW8ZifQjkqEYbISEZcdXj1RSH6/QbgwqGZ8TYrntjyURCchz7cel?=
 =?us-ascii?Q?6OmDCMOJuXB6i1lfuN9tpr8Gc1y00MWI752S7U2nbkIC0mlizAfOvFVyHpzQ?=
 =?us-ascii?Q?PJKyIllzWeAJFovlBc+FjpMoFIVmKldPDDRH35CPFwESfNpti/ES3Ynfhunu?=
 =?us-ascii?Q?Aj100AxZhfDIhzSS6gg5dN8qQICIUBfuXBHPTd+TX4QfwBVaxJyIyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nh9IbKr1pE+ZOCfR3Ffg84QO6qBNcCn6UhWbwtKlL//1NZAdMIArkd8yCGvX?=
 =?us-ascii?Q?vzTt6NMjdDzJhMjQLts/pAfpZN5A8WNO+3WGePGIraZcufCoeeqGkXVZm+PR?=
 =?us-ascii?Q?KnHF+ReIR3g1cADj9FznfpF1GvVdI6X+43Q8eWWOFMAY4wfPpfHdGPehKxO0?=
 =?us-ascii?Q?kv5kuNyXJ0NblIkUMDCXK4OAhiVPaiNXaECESis0qvNwXjKFVAZm/GaBgLqG?=
 =?us-ascii?Q?F7y5zTS39WeNEJQJgzUzkhpuZEXJCK+UvhaMrbOT3YfjV9G48R4uNC4v/y0f?=
 =?us-ascii?Q?dco8jdWXe+sJQuiD1d1vn7kwCqewlyRX4UGOMIcYrDOmbLVkcukzeyEeMYsn?=
 =?us-ascii?Q?AuKszKuHrvhg8hX/tPoA6wJ491lBytmKP3+vIqdeUsCaqJsmGG/y+BTKX9/7?=
 =?us-ascii?Q?MWW8RBgJwV82kWJySPMJI3agrbiKKqBUExnQskg+5bqcE+5OOnMhgBjyi+ET?=
 =?us-ascii?Q?gAnhfh4YyFOzZNsh0SOCBLhcU5x3Lv2tM2PFXRsllSVnoYpz/jZ4TISGHHj1?=
 =?us-ascii?Q?+2uCUbcUrYGnk4ab/qP8JzX8Gg722qQmnjvQw6uZkmOPf45Cp/8lrmNbIA9V?=
 =?us-ascii?Q?yALsobsbP8YwriRCOBPRJW3xu/feR2cn0V2KlFWck7n0MNiyQKq/CrbQ+kiE?=
 =?us-ascii?Q?xaQoCefuIYpOmYf5J/cCA1iC7cDVbGQNrMAhd3Qso5Esd2tHisS6vlm+EMFy?=
 =?us-ascii?Q?IQsJtFIeFYkoIyXb1QKA2LCwuNYgLQ4BX5RInBfhcR8UYaNeIlgXvKxsKpE1?=
 =?us-ascii?Q?L/0C5O5U1C3Os7ZzYuTyghJKyrm9FB8YZtncZPDJmY4zU5MgwswQDC6Xefcs?=
 =?us-ascii?Q?H4qMJP/UVi6OcKvGlSFXBP4HdnsDodxG4zVjVaGNusOZMID7qZRO9wBOeqi5?=
 =?us-ascii?Q?Ye/JGh2WjbZ2PhgkeSbPcCu5EDiAeoIhMy2CLYoqr+dOvRpoyg1/cXjkVaOe?=
 =?us-ascii?Q?jjlwVf49x3XBKs88dXtY/oouVGpLnv4770rB0G5m7ASGqqyvisuwwgxGxl1T?=
 =?us-ascii?Q?WB71by6s3OTxa2XZufZ3KnD10PA8V8FkdGn7zEHrkGjJg0AmA3BwF6qpoJS2?=
 =?us-ascii?Q?LptS7g4mV3DdHmrNMdLgR3AUTgZlRSHSXycNGCnLJD8Empvi2DemQ5Jc+ImZ?=
 =?us-ascii?Q?FY/KiTuBbCxagxj72ytuP1ntmyPRUUPwxqKQawJnVa1hVfPASmxf8cL40vUF?=
 =?us-ascii?Q?RUG2M2WNP98Uae6LoLGdNBcdFQRRjUSoeJ3Jcv7aketB3jGcu/C8xNQ0KBrw?=
 =?us-ascii?Q?AvqVSUDYgsXg1oCUW+n3aXSmXYqi9auX2q2jdbTiypEDwBAzV5T3MzgUetI4?=
 =?us-ascii?Q?WxHEer2UbWRUFdCWh8OdHtwTyQahAXlntClxim4gQCmZZbzxv4euHiCa5rJD?=
 =?us-ascii?Q?Cwv3IzKZ1zxpKxGreCl/05kl/FC8f/b9Vy8Ljlcz7nz6zShteRNAeSn6JywB?=
 =?us-ascii?Q?/6l6YPl6mHm7DlZwvPFW1RLfF3AUSYmMAEP4N+Q76ULofEndDk7w9RIU1vIM?=
 =?us-ascii?Q?AFuqLMKaHGPWGpJ+9CMOl4joMUDliQo1t8pagY5iqf3mGBPBf0517CH5j2rY?=
 =?us-ascii?Q?nkzndqSnk5B6U90E+V+foUmnvllOKfeVGN3+FX70Bu7pjltZxFKzzkyacuJF?=
 =?us-ascii?Q?XsXObHQPv0A8v+1vZrECFvI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac862cf-1764-4c30-08a8-08dd6e1e723a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:32:00.3985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC28YcGDwmtiPPhiE8P3hWnd1o3x5uw0FjPMLuTKAu27TjbuMdBzI8ylANb4HrgW8UNDg9GazfQhuloN5RyIW7zc994qPYdGfjCHjCTHQycfwhBs9mf7z9pJMB60PiNg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
differs from the existing RZ/G2L implementation, introduce a new
rzg2l_csi2_info structure. This structure provides function pointers for
SoC-specific D-PHY enable and disable operations.

Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
Update the device match table to store the appropriate function pointers
for each compatible SoC.

This change prepares the driver for future extensions without affecting
the current functionality for RZ/G2L.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved rzg2l_csi2_info below the definition of the rzg2l_csi2_dphy_enable()
   function as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4ccf7c5ea58b0..4aa5d58dde5bd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -107,6 +107,7 @@ struct rzg2l_csi2 {
 	void __iomem *base;
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
+	const struct rzg2l_csi2_info *info;
 	struct clk *sysclk;
 	struct clk *vclk;
 	unsigned long vclk_rate;
@@ -123,6 +124,11 @@ struct rzg2l_csi2 {
 	bool dphy_enabled;
 };
 
+struct rzg2l_csi2_info {
+	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
+	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+};
+
 struct rzg2l_csi2_timings {
 	u32 t_init;
 	u32 tclk_miss;
@@ -355,14 +361,19 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 	return ret;
 }
 
+static const struct rzg2l_csi2_info rzg2l_csi2_info = {
+	.dphy_enable = rzg2l_csi2_dphy_enable,
+	.dphy_disable = rzg2l_csi2_dphy_disable,
+};
+
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
 	if (on)
-		return rzg2l_csi2_dphy_enable(csi2);
+		return csi2->info->dphy_enable(csi2);
 
-	return rzg2l_csi2_dphy_disable(csi2);
+	return csi2->info->dphy_disable(csi2);
 }
 
 static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
@@ -772,6 +783,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
+	csi2->info = of_device_get_match_data(dev);
+	if (!csi2->info)
+		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
+
 	csi2->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
@@ -891,7 +906,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-	{ .compatible = "renesas,rzg2l-csi2", },
+	{
+		.compatible = "renesas,rzg2l-csi2",
+		.data = &rzg2l_csi2_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
-- 
2.43.0


