Return-Path: <linux-media+bounces-26606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2BA3FA2D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 461FE19E3FF0
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6017F2206B1;
	Fri, 21 Feb 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kvLgo+YG"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EB51367;
	Fri, 21 Feb 2025 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153467; cv=fail; b=svrf8Yp4hu3OLm2DKSYSaOLemcNvX0WjnmY1SPfvs0l6NWlODCWUy2Gkhu0WfP3vHHQaW/Ds9JiU60stIFMyaLIIQNJKbyiUKazEYAVLacF0otHQ7LSUUCgRjtTKxLQhxV58wBvJIPoA6VbTWSVPb9RHMnORnGTJeHMQO2f5lnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153467; c=relaxed/simple;
	bh=SuXFXKaCzGPDoj8ow7o7UaRCJzx5n62XrAQt9ipsOdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QEL7OToeZID3VeYbU1RIKQgXk77PFYwQCLLWvczkYHZ/s/9t0tf+zlKROotC341CWn72CfZj8gr5UTX3YwMejp09M6qb85359NRhXJDUGEK071zDmo8vBbpmcOajfMsuvkspAkxWPvbkHntyJCONypNEUxnKjtX+cJEVqG2aB1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kvLgo+YG; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXcl+5TKUHvCKUc0DYzLWwjAeJtjyPWy7o40pHjA/jliK6SzRiFguxO9QWTjuzKckeKFJmwyA0lyWFEqHfWKkx42KwxAb9JoZXdl8yZJ06DURz7bSOaN/QxLMujEVlq1ZctO+o+bDsjxU4lfsp26s289OGRZ29zhJ14b3X1ARVeBupi2dYTZreb8B1z+eHbAnXIbcBvePLUe8fBEytHDry2xer14ecOhE887cBCtf9d+q89pLwrOXoXbflAEuahdNz+PI5fPyfAgA36GbycE2yNvr1hYHAql57kbPXS3lsrQRjuLj4rImb4ZR+rHIYSBH3NvVlk/GrbF31F45rShIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50LaY/mDBjT7QUg+lyikrAnw8aa4Y5rxKQ9JIVMGeno=;
 b=XOfMMP02k03+e7hjCJ9BLnz7Xvnhrlq2J6F977iBOFrfrLFAwQvydcxQRMP9uLvvGmIBhHVbwH0MAMeM7ogIcpO5KlRiKTJ4Ka7q0/55GF3AOee3O15DWZwiiSD7ebrl9Q0f5LmJmBRnn56nO+rvQ9Jnxqmxc7kM+coJHqfDtHnsN2QhSuk9rzVlJOUue4BYr+LKLYWOw2HK4uSPjeXy1K7JyJ54yD8OWDj1gSSWVD0P0FwmwFeki5Q6jOudl+Ka5RSvwKALjtVrC5K2rwX+H1waaLSC4G4Sd7nVCbbypNSz8OT4w708t25ksXlFLyLTM7pYXJYQAd5nYIe5bXb8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50LaY/mDBjT7QUg+lyikrAnw8aa4Y5rxKQ9JIVMGeno=;
 b=kvLgo+YGy7LxdbF2FG++jiaEqS+INFq8VC7sns1SL0As3DCiyCxkrOqOS+Cl49tC1rM4fyXJETSS51N9lopd1gl9Okh5CZC/0u/s4ODUBuMI0TsH8LQ6pyz1jiIFZe6OJWU2GpQbdsvX1IHHFA2lzVQ4p7IAMIJ4BADCIHxrhhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:57:43 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:57:43 +0000
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/18] media: rzg2l-cru: Add image_conv offset to OF data
Date: Fri, 21 Feb 2025 16:55:27 +0100
Message-Id: <20250221155532.576759-14-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: a70efbdc-2a69-438c-1fad-08dd52907a52
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vHfgFF1LL8u9fqzEytqGNpTof+mpb5kEl0sngOVPN64tjbykQ4hKbBxTVJSI?=
 =?us-ascii?Q?FSZEZuDge4HIJ0yoa3n75vDNb1T3b790jJg5Jjf8ikwu1VbDxROXLvK2qLnN?=
 =?us-ascii?Q?c7EPCTmFBcU6BjIrK9WzWrumbB+rroHBSXP4xAFwxXQZ0ssYfEprjcex5pXs?=
 =?us-ascii?Q?kv92pwWhYtKoULTDhKCfSjVdNNwCVjqO1A5e5zu7lHS96awRm42VDAxvcWJl?=
 =?us-ascii?Q?IoK5e9Ll7+U0rxVtI8hId9Z1NxHEfu9MoFbWRiMuDAtXXzThOXfiAS89+dFV?=
 =?us-ascii?Q?p5SGJ/deSB3q7zWN/zUmeWViJJzTlN3pGhiXtKJD3c7DsbVkq8RgKsbvY9HC?=
 =?us-ascii?Q?gXYaRfjJpQ9SG2sD/iaKCIZ1wdjb6QluxM7m7H/sI0WQD7+3mL0Pgto947EN?=
 =?us-ascii?Q?QiIYoTJFeA8HM2I59OGzYk3Zu6gKGMwK4ldY4X1Iz8iWo3x8QrCMXADQSlni?=
 =?us-ascii?Q?S49RQ9xywjXiJWiLSmuWJUrnWGbslnaneyXw3Oc8I9VOxqFfFagv7rsjlFxW?=
 =?us-ascii?Q?Y5eGuGwKbsugA6FdYrtWIpyCN1JQnwNYmM26JRk5Xn6aez4X3tMxW/MVdm7F?=
 =?us-ascii?Q?IKfqunwFhsKjpPSMM+wK03d7AnJ2qk5etnvcrasTy2aVnSMA/SYqjmUZLxbL?=
 =?us-ascii?Q?vjx4mVrNBK3ppWUc4B9Fp+q73pZwhvusEGLnyLF/1BqEtakvJvm45au9EnZ0?=
 =?us-ascii?Q?cRX/GXzFzg6diLVjjieWWCGFomq4uy9sZFxcFqnpRSBoLTSxT/27Ph9ELm5L?=
 =?us-ascii?Q?YLLSfWnpd0tF/8Vng+Y6QlzKXnz4Vk/xbP2zTgaYn0MrhtKPVK3frISPPCoF?=
 =?us-ascii?Q?c5dGGOJfwgC1L3zUVX6bTsh2ogLOe+kW9tx9aknCpdldzgpP4ppXSmNaN3Sp?=
 =?us-ascii?Q?abURGVi9CE2waf3sGIvUIZ+hYqnHbs2zasOzdY2+SKKkrnPyT29VO6UlRq/A?=
 =?us-ascii?Q?gZB5pZDr4E2sxTtYdh/UzAUl3D7sU1nbX1CtQX8MGluKIEqF4IRiIk0mbPMu?=
 =?us-ascii?Q?uNi+ab/u+kP6bkx1576/ocq/6aG04rFfDc1kgGNiKYUpabcsp/mrJB35oPDC?=
 =?us-ascii?Q?NYvj9FHzfHY4Q8VCpqLq7cBh++Opkvy+6OPoaFs5xoEMNMtU4a0/9id7azpe?=
 =?us-ascii?Q?g+LxIE2oBz0QTurEU+kIdeUJo2MdM6O4wxFNY0SUcpo7UAJ9J81GCAchwwXM?=
 =?us-ascii?Q?0BRKmYepfPnE6Yu1Iefne3SRi6wQzsOT6zuCUvaLjrA7puLxPID6Z6WtTa9e?=
 =?us-ascii?Q?IKiOIC2V9Tez1QNF9nKiTPQT0clw6aj6RSI10Uk4vNCWzOcZ5DSH4KZJhdlX?=
 =?us-ascii?Q?odZzIAx79AptdbORP4qKVUFf3bnUkCz5bOIm+PH4ctmDNc79kSaB1b5b5TIr?=
 =?us-ascii?Q?hHFKO1ijxoAN0pVg7AFr8Vv6ED8F9MoFgcOwzOtDVDhD2EEaLAsWpfxq91TV?=
 =?us-ascii?Q?Zna1JwqI9ohoEfh+osq8sLO1T9SgMqUo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d/8JlPdShlMpEBUvWJ+nDvecoNjoNhtT0Hfh/LgCWOkNvZHyb1AYf68g7dr+?=
 =?us-ascii?Q?FOrhqPhKfGqQeP5pt5QlI0GQ3It3hIL10pqt+51ckBjN2tICZqS5PrKAemjX?=
 =?us-ascii?Q?SyycqN1LP+yQ47csqpjiEw/v2iTQIoHMBl3ZJQyJZyyGuPOakwT27Vh9e9cG?=
 =?us-ascii?Q?h8Ae7Ws8oJvq0QO9RM542SEvOdYYMmwz2UkpMoi1oxQNKWD4w9RLYMlN7DjN?=
 =?us-ascii?Q?ldfcVy9TnCnPEOMZEGf8ZTWjE0jJMFpNUrpEh6eHkbwD/sjdowUEoGxnJLTk?=
 =?us-ascii?Q?putTHTZlZXGuaMsRjeru91Az7kNjemwcA44lvCViqSPVRCXxZuusl+jeyKMq?=
 =?us-ascii?Q?sOrBji2/d52nA7PZ+Coh8eKzyNeFfzXFBIDIqjHVp8bLYKjtpnJH4VygQKRu?=
 =?us-ascii?Q?GWWUy2rG4GkbmdPSk8DyT1LK0pUA/nCQVFbUPUD2ZDtc8xZ6HKDZIqg2YcUI?=
 =?us-ascii?Q?YNXRLlFwNkNJ+/tpuyKnD/N6t9ZUa5uX/idKQDY2H5kXsZGnc37scViA+2i+?=
 =?us-ascii?Q?qzqxsaEGbVxt0ZjGQHMeUPqgeSRgh4g6pXbk3FBQQrllzxKdo8wjE0kOiPvx?=
 =?us-ascii?Q?5W8GpWmzCJIpRtR1hH3xZvNLuqjZzcmxxlYgp1dRypFo/EBa9yHkC78W+fJV?=
 =?us-ascii?Q?nWRQKlq4oP7u1GC25UdEqF/4HJ/AyxASSyPGgket/VrsTJCjQUZ6KJUQ+AbZ?=
 =?us-ascii?Q?qmG7Tb/SeE9SgUWLNnJrIKafRrMAfzhz7dsdpxxGRu9oC57u+KPHeFVfpK1J?=
 =?us-ascii?Q?nTF7z+61h+B2ctcwGOngaPeogmRnHrql6O312YltRwE5ClEreuyCM+4fRJvR?=
 =?us-ascii?Q?698f7l89cvjiGsK1Caw9wKz2pxMCUe1/K5wtJywHx+fKrPLwCbdn2+UynjLv?=
 =?us-ascii?Q?ox21nyNeBqVQwOLWZMkJH0FW239olhcn3CzjYjAopFBNdfO5dJTRnYy/Rk3d?=
 =?us-ascii?Q?6YsvOpZhLPiAgFy/Hgyrls+vO+k/ylnSqPpS+iOf1EZ29kJyRTKrH8muy290?=
 =?us-ascii?Q?HwJxlJr8Rdfa0iMSR/gr32A1YeMY1uRcHBJqHV8zEUG2tJmnQyzcZT4o8rjY?=
 =?us-ascii?Q?FuyHI6cunkqzEE3dsjLTc6+C8h3jYAFKxxhlf250ODRzoV4wcdC7VN5MxwSG?=
 =?us-ascii?Q?BKwMJc0xSkPlc/vfjcdkuRnZGM4lacCXdbDDKnDvwUjW7ejKiWUQP7x+LS1m?=
 =?us-ascii?Q?b7bzGASLzirp3mrCMxHC3AeeBL1UNjAXcozJLFGUB74a27iG1Wuv5wwQjUgK?=
 =?us-ascii?Q?SOiJxJatS/ONHjfmZs27Q74B1Au5Pw1czdVvhpUKpmJgF5mU6GR20tXmJ/wc?=
 =?us-ascii?Q?C3Kq5z78Rvxc/GBKcKzzFeREnLqw+zxXl+tW1KiZJEIcniAkkDwj1qOMURN9?=
 =?us-ascii?Q?NbX+VUpxFajiAn4oOfZSSN5W2fVdSyaN12otyMrV4iur0FauKqTIRuhw5QPn?=
 =?us-ascii?Q?sz1IAnTrH1v/S10QxgV+o+Vh0BBzJZU31pvjoQmx11ZQKrJkgRY1qx3XU9tW?=
 =?us-ascii?Q?IMfixpYyPO23TJg0BbWgSOF9Q1J4hzLpVmXbLlV0INzVVUV33pxcJ3aEWikQ?=
 =?us-ascii?Q?qwuX5b9j1JmldSqTc0yM965niAOEJtdWsyl/WhOBZiOxXz2MjGMKPksoU45z?=
 =?us-ascii?Q?WimEXfacN5KTUVsP1NOIrzU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70efbdc-2a69-438c-1fad-08dd52907a52
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:57:43.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfipJ535Ekx9DfamX7NPpe7YXS0FDrVMaut7/MfFwL4ET6H3xc+Lg6d+acw/zn0mdl5Sgi0+AZnZyo3jHTV3Bg0oPlwvQLIg5TutjrC8V0Y3b3DakUcy4qdNXD5Jj7hW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `image_conv` field to the `rzg2l_cru_info` structure to store the
register offset for image conversion control. RZ/G2L uses `ICnMC`, while
RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.

Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
to use this `image_conv` offset from the OF data, facilitating future
support for RZ/G3E and RZ/V2H(P) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 19f93b7fe6fb..7e94ae803967 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -357,6 +357,7 @@ static const u16 rzg2l_cru_regs[] = {
 static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
+	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 6a621073948a..ca156772b949 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
 struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
+	u16 image_conv;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 9e5e79c6ca98..022da19dd88a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -200,20 +200,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
 	icnmc |= ICnMC_VCSEL(csi_vc);
 
-	rzg2l_cru_write(cru, ICnMC, icnmc);
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -230,11 +232,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
 	else
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) & (~ICnMC_CSCTHR));
 
 	/* Set output data format */
 	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
-- 
2.34.1


