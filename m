Return-Path: <linux-media+bounces-65051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJEkHSKEMWqTlQUAu9opvQ
	(envelope-from <linux-media+bounces-65051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:13:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE888692DE6
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:13:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=TG4WjFb5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65051-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65051-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89B233100D5D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDD247B406;
	Tue, 16 Jun 2026 17:06:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE847A0D0;
	Tue, 16 Jun 2026 17:06:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629604; cv=fail; b=rbuqptkmnUi6FqXG2+9/AsDogQ4pJ7uUCEt2KoyxDkIranHaVf3gqA9LWdo0TPnUvAlz4htH3PqfLgtZK4xKE4d2EwUlQHSZJRoHZ/ImEYao0jClv6SUZzD5UpFYiQ6wm7IN0DFMCLOsXVtcGze0e0NX23nSBDTFtfHhM7duRzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629604; c=relaxed/simple;
	bh=ejLta4f6RM6cT+2NkdCJKCE4N0zAT4amxwfQnXGfk94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TD/0JSZC1BUvTQt6fRr+SwhFJ0EOgz04PdUskvN00gRGlJmW+KG91R0Cf9E2kmmpFZ0OlR6kjomzAR8vlE2SqG6GFHeBD7tMC3do8SwltOF4MsShVmciae4Zlmf5HL17Gh9lnEMTmgaF2Ro6Le+oQD8jrQvm0Rmb+NCfPseWHww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TG4WjFb5; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fff2w4kGCCDwDbEHYG8S/KZdSC4RMBgKO0a+0LVgRtIih4uX1PHMIELS0SzEpvtD8DugO+3vzkypBzn1nInUjNfcYT/W+kUP4DUBnbveQjTvn3MlPy6Smj8v+54TcwBI6qz5Dk2Rm/oQ1gBlTUWsXXDTijd+xddWkKLiok3i/8BRnvVEddV1ExvjxPIB0BxBY8JjPoPocBwJlM4hdxFAqdjq0xa46enK5Ggmp0VNOI4h9kmUe/f4Sik8qqlP5LpyxwagzS8Fq88X61Lkg32rsaY0BJB37/YW5s8VeJrAwFqrgxbkMfuLD8tBeYSI0y7tzE6aKCAhETuifHiNWU0V3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtAAa/HZ0rNd8zy2hq/lALBoD/2/5zY4HKc00XUsnW8=;
 b=bIylxlhqUlS1Qj9ksmbAnbKe3f7CPIW99TSkT2whyWlOr5nmZe+nvAYEzN0dmeNnwz3obGSG9WLAHbVykCjoAgdrRFtJ+4ifwQric1oQ9WstLfgG8O3igrYNT3wZXyPnBITQDjQA/h8InkvWeDs2moYFe9P1UhD+0g3IdJCxjdTSS4N/mImwe/wc5V+MkEoWa4Q6FzfjTss55Lf6GLhQ4jg84gR1JV+wYjn832EVnNsqnnZPE//mPGvPApRE0vGA9JAn53TbfSU13SO3xpl6gT/CgudIa08d0v7/yK9MdkGl6MdBm3N59UeaIBBmKv4EMeLZdWnnYp/fx2aCZgn50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtAAa/HZ0rNd8zy2hq/lALBoD/2/5zY4HKc00XUsnW8=;
 b=TG4WjFb5Nu1jRL0DTWYRro8C3Q74ZRBqW2aIs49hT0S6On6Vaz19nYr7bFz4M+TlXLQBNu/xXCgO2DfjKkZXTVgZDmqarDU3+toGGFoHasTFr+ztynx5pK8gwcPHFOyWEUvCGn653RpK8lMltLUupjxKOURqvOQhDrOu2fOhspY=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:39 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] media: rzg2l-cru: csi2: Add device_link from CSI-2 to sensor
Date: Tue, 16 Jun 2026 19:05:32 +0200
Message-ID: <20260616170542.447804-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 8065fb90-513e-42a7-d166-08decbc9a140
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	BRx/rwzob4XW5KvufszDv/WGmuUILZvfqSkgoIPjzBGkfAGHK+bj/uMg81G6xh0nMFYY/ip3uFzWd43ITrz8RoFBZsp1ytWlaBxceUJQd+Bpm2QJXVXC0W9mfzjwvJxdYCJKmbhwLTYZqmkGxZumU/SHlgtQNvKS1377RyN+YAB1CAoVVtvQT/GZaBYuKt14eswkhp1l7PnGOBnosrR0+sadJvH0iQ8lzj3O38fzh28VOe8lWFfda/wYBjI5TmxFXHmsJJwjqM+Biu9XG7pE4akrvM5mVM8MknFEqkZMP5UOD61DW29J+h+aTzqXt4rJRlZQlbP8C7SpiiofKHAhxEsPbvwZ1HVq4lIdYBe+WeCCCxrfhioYx27cMNJE0OTp6TzlBjJmqnT+rqlECWL5ZfvNoGrvIUb9dwnRvkZXJ/cEV1XkYELXX20AuZAWgSqWbJi+wePD9V2SlmyXjulEWmezhfnjf6RyQCfv3GvI5ppD4jcr1pjtX5haF7dmtlEu46w4bf2GKz2sO07qmiWKl3tiqIvuPvyG0Ly/TKGVBN2WgBWd2t0aM10sPqjgJItpDPdh+FtWlOAmDZxArTBKiS7UaFKsLTPSSl4OkoOB/zdsWOdSgWP9NAjOGyVvzG08XNfMN4lFg81yRJRec8+jSx7sx3oHUGO64ocVBEreUAjZ0kWbYqheLFRj2CgDrK3ASP2c4MLnBhkqDiEsx81cjs9nRQbyNp/LgsO/XeL1fCbRB+iRC42Txls9Ypuszkia
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVmAbPhSDgtj6vS+jeFzqZziArfcQHprRmP4iIB1riw56/McJmbvDpPg7bkR?=
 =?us-ascii?Q?zc/PfjzZ7ISs3bnwkKFPXYxan9YM/KQK+wCRy/BvHgIqmtHjibO/14SA6TL0?=
 =?us-ascii?Q?pEoXs3PwAVi5iAnzxI64IHvztgrUdgdMvFnYaAGx+u0BVurk/Ha7cxYXxa/X?=
 =?us-ascii?Q?vMHDtBMX1q94d7PpGnvpzjlsq086n23Wxp60GiJtL0g24L6OWuSifTAZ3UhY?=
 =?us-ascii?Q?eoIZQ9LsX4xyylFxRnD25VHiKTk+HHwNYiEjIeGbP2Ehv0CQhi5RM8+Pb7oj?=
 =?us-ascii?Q?W78Fpx3eGO+l6LassZSGPJlwf8lKzUFConqyswdcDmyNaN00GRO0eLu08ocG?=
 =?us-ascii?Q?i5Jn7WyUvrk/afPmqbtTz0ZC71ZLl1rkRAm9EVLatv+M55uBuuyBxsstQU9D?=
 =?us-ascii?Q?n0tfW2X9bFi1fWf9ee2+AAp2lU0lDavP2lZKOILyJ2c9eZ4eV2NXcixPTx84?=
 =?us-ascii?Q?LHC7JpPv3y2hA5AenPW6Jv6njwLMgdViDGAc1OuikbVwQEsdpmo6+FlZvdi9?=
 =?us-ascii?Q?jMA8kswtUSmo3zORNusKnO5wH71bxi3VhpRhkggbJdfsYFixsJsRH7xTgubF?=
 =?us-ascii?Q?6UU6WnajHnfGYa+EpWSeGV0tSW1sRpOoBUFlYW2tyqB72V4WvNC/3ebIOwWC?=
 =?us-ascii?Q?pYO41CZLFf1e8RY5xcdpQnjvXRF2s62kcR8+8jCjb7krcyx1RgeY48tQRw9P?=
 =?us-ascii?Q?MhNxmatsu0GS/gX0joUtm6zGa0/oucCmqIl3W5XIQTNqjZygmNtCOD/VKBcn?=
 =?us-ascii?Q?CC/Qgxek5ozCyriL/l3EdsATLHVsjYQKK+LrUzEWuYAZMVLf1VXw3ji+/avT?=
 =?us-ascii?Q?ySCW0u07E7wVc6a7ctbzZfmzTcbwQBZqI35QBzCiYphzz+rTsBp2D3/NBLMf?=
 =?us-ascii?Q?Ux7QNoO49RKpI6DhhqGWVmT7H7hYxgrNUtwiadJEsArrbrcVBwjpmIy+AWLn?=
 =?us-ascii?Q?WefLl9O7ylzEVCW4o6htwMa3DNRxirNMFUAlxcLPQ9nbixaG8KHHBwSYYKec?=
 =?us-ascii?Q?9yYDefQba+Ajvh87od0rMz4m3MhTxxltqtvktT5qkhe6gH5wkkVFGaWQy5AT?=
 =?us-ascii?Q?7lzKpQSuv9WpUycBrO3XGWD9UMN2dG2l6bVtInvTDHWMSD3SVezYQkon93D8?=
 =?us-ascii?Q?mgchWR0W35KEUACy+Eo9RlKfTKNi28vsaUTDmnaTTwz5DaAwHvKsyDXnICiA?=
 =?us-ascii?Q?Wsd5gljSnMnNUxVHigmly7wWkWnouJIndS87kvxbvtVMG9DfenHOUiWIxT0Z?=
 =?us-ascii?Q?6pzNV0JmKvrFQZ3MaQ6JQ5V/iQaQy0o6hwwMKfwiWKC/hMEw6LoqGPZUbJ9A?=
 =?us-ascii?Q?NXSPAN2lgVGl3tIBNpu9CZ/8fn80pv9U0fz7xFnxB70LXq8KGqCirdPWg+W/?=
 =?us-ascii?Q?uaCO6fcgJALOaYWWsvVIj/V+w3pNXSJ/rMRnSU1MLcsBynO/LBOV/T6xm75b?=
 =?us-ascii?Q?ccjI6pd1XGfZKDkCNMEddmg5uob7A+8X/BBfIZBB3vXPDNIF2IyYrgTNO5GK?=
 =?us-ascii?Q?qLaXvreolNCxq3/kahAcAeEuQCH7ojtY/Z8/FFEhfyzqJHquqKv6tPKKyBVJ?=
 =?us-ascii?Q?mvxxPgmJyxkBF4hg3CoQKScV2Fe69pRGBm/PjKY/r/ymsroN44ckDf3TPVFG?=
 =?us-ascii?Q?MdCS2ntrmEhSikZd0ucMfCewUV4uNSwgr4SmIH25RZtebnt7tfcTs/ssH7Q5?=
 =?us-ascii?Q?AiENO7uCCWfW5YLnM+zkBrwqU6OfIzt38Z3h1pR8+kqTEYhGoXxBhNop2aiY?=
 =?us-ascii?Q?jPQARlgdU1ytsg/mt4/AvwxcZO2kO2uds9TWGN70O1Ec3ZNmyGTK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8065fb90-513e-42a7-d166-08decbc9a140
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:39.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZSk96+MbLIOAUl6d4H4cA1l91G01ReAOn3K295Vamb2LXTGAbzgqLcGPshNW0sS7313qGziYDntkvDO/vWv6H49HpvCJknekE/4KOM+YSeUDd+4HLsUn/+EmvndARvb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65051-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE888692DE6

The CSI-2 receiver depends on its remote sensor being powered and
configured before it can receive data. Without an explicit device_link
the PM core has no knowledge of this dependency and may suspend the
sensor while CSI-2 is still active, or resume CSI-2 before the sensor
is ready.

Add a DL_FLAG_STATELESS device_link from the CSI-2 device to the sensor
device when the sensor subdev binds. This instructs the PM core to
suspend CSI-2 before the sensor and to resume the sensor before CSI-2.
The link is deleted on unbind.

Move csi2->remote_source assignment to the end of the function.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 6dc4b53607b4..3a4bc4ef72fc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -773,15 +773,28 @@ static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asd)
 {
 	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
+	int ret;
 
-	csi2->remote_source = subdev;
+	if (!device_link_add(csi2->dev, subdev->dev, DL_FLAG_STATELESS)) {
+		dev_err(csi2->dev, "Failed to create device link to sensor %s\n",
+			subdev->name);
+		return -EINVAL;
+	}
 
 	dev_dbg(csi2->dev, "Bound subdev: %s pad\n", subdev->name);
 
-	return media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
-				     &csi2->subdev.entity, 0,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
+	ret = media_create_pad_link(&subdev->entity, RZG2L_CSI2_SINK,
+				    &csi2->subdev.entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		device_link_remove(csi2->dev, subdev->dev);
+		return ret;
+	}
+
+	csi2->remote_source = subdev;
+
+	return 0;
 }
 
 static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -790,6 +803,7 @@ static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
 
+	device_link_remove(csi2->dev, subdev->dev);
 	csi2->remote_source = NULL;
 
 	dev_dbg(csi2->dev, "Unbind subdev %s\n", subdev->name);
-- 
2.54.0


