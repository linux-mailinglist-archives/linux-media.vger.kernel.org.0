Return-Path: <linux-media+bounces-66256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfE4LnNGRWqi9woAu9opvQ
	(envelope-from <linux-media+bounces-66256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:55:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C906F0082
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:55:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=IyuXX2dp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66256-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66256-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA0D63049738
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970B837AA63;
	Wed,  1 Jul 2026 16:50:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEE837AA70;
	Wed,  1 Jul 2026 16:50:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924654; cv=fail; b=a0xBW8R6lcXlsYtX0Er9KiHEs0d+Ka7onxeTuiSH2XyfI8wEMlz4S480QhyhqIoTpo9Vbm5FunP4iChq8UGOt8dHnj7WH087oVu8X4lO61GfD4xABL5XfxcEuoYOxLJ77e9FW6+7/Nr5/BW/FrxlunnsScJzxUlmeYJEXJUvX4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924654; c=relaxed/simple;
	bh=UQPEhoofb20HhXPh0vZwEvkAXZ48qr6aW00jRpBK0PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Adad1AqctZkfIlEgG4FcVbPfw90v07FInbyln1ZN1eiT25AawIxFGPKxoI1K88My9AhSsUMLDOPk6fuxfJteXY5UrY2QIBMVpm0PQKi/e+UOSpW+t6hQGAzC0rIUDvcwGoHLRENlMWOURTEauEMRYjK+35vw8TMePr96cKISjLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IyuXX2dp; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq1MQGv87V2kx0Uc+GqV9zUGe+HOkowkVkD+oQ7p2Iwkd2A+gQttiKMXHmf71DE973kYV5YWe/a3MPPFTfSAMtjcaYZ1SXiwB39KkZaVhQiX6Yea1rXRy4lZRBbdNEFLjRbpGvyGnsBwfBQh73hmSlAPurNPYDlHL5+KsMAAM5gxupBl+cSNIfDF6ml5uzcVFKDWQAb8gUgf0NJFXfRPxOkdx0PWO1A5rJRBcmJqcMPKPZ//8+yXqH8sAOqJeu5X4U7mC+z0J5SRkGLBSLWyhXg1TLK/6eG5N3ijpSdQ/D0IPh1wrFAPNIODmm5dXWSCMdvxw5iOe/IJkkF69jgrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rknmijwDGp5NrEfXOAiXsf3Zd2rRJg24Agz/E2r+DKc=;
 b=BJGoXlsRwc0+OaMavcGZARXN5z+j7+/oC1LA0A9IO1eQ1Zgv486npPmM79C7y80r3V4xOirDOo2uqyEiOIRhdk3hK5aBXMbjtsNaON0SNxBiCTMyHv4HnLepDDbDyKwPO57s6Y1GY4xhY7Hg2MmZJ5NcC4V0aTMYJDDC2hpnF82tLwlDNgTK2kwCcy2Klp2yKDzM8uXRuu9yIl/8mOddyDc+32Wsq5DwmgYpOfd+hKA5y2uP1K9W1cOCtlY9xAIKOYiyUigyaJijLxW6V0lOvUMYFqOqzxwF9CMMaDegfcNj+gfR0fgXgAbJkd9ZnCod7TNO+MpJrr6jIx9k6LA5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rknmijwDGp5NrEfXOAiXsf3Zd2rRJg24Agz/E2r+DKc=;
 b=IyuXX2dpFvmPuuSsOxFeeNivoCNr0NIQ4J7ST2Ttuzjft+ELRAIRTY8/BVC2Zdh8Gg+fyWxElKdYd1ZULFAi+7n5eIlU5MGVWwthRk1DGkTJxazNtyql5HW+TbNTBu3b4WQhhowI/ZlKgMZKYCNEhqF43Z0AC6Or9oErH8wptsk=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17534.jpnprd01.prod.outlook.com (2603:1096:604:450::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:50:48 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 16:50:48 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
Date: Wed,  1 Jul 2026 18:49:59 +0200
Message-ID: <20260701165003.1495035-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB17534:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b68eae-6647-4450-7119-08ded790e6ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|11063799006|3023799007|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 SoFswRtst1M1Ur8i3Yz6f7oXsW4W8eAQ4tz4DCtp4fwA5MzSPilK0tABXTL6KvgYVTJwAJxHL0X7iGiCZiPN2qYRS5BDqIffO4ISx6LX3/4HWVflDcTWJJ6dk4r4aHvNuY+Yk7iec69eoD1OJOVm5daC1JzATdY9s5uLLgbMkFTYNlvCPm4PJtqgYd7sn54J6aJDkfuFIQn0f5FihRjJeEoTaOv1KX8HbxCO9nR9ueP7p7QhGygP759FAPzzm3Dg2HXLSCoAJZisWwV1V0o1rb31LhQ3PBieXKlkgLvnBsnKf7AjMr5zaXP/ccwJFSMrc30joUFXKni2g8OkrFozD0aE//Bg9jZfsIXnK0324PQVBMTqfbrgQWfyX7jCctlezgYAJ8vHWBhfqO9WnQ8poRSj7C8LK9dBcdfiCpLvuYBlJtbYmx0bJQBwAuWmCQmGtos+PV5V/09Pwm0SS4fBneVacYNMwwAzP+UYKtZwIeJ6X/HlBa5aDXXrZY/yzXvDgESH+tg0g9ulkCI5JPel9uv5UkAUfnF/SOpkeH4DZqGuHyknebgjcEIfCH9ilEBMdITn8iMe9sXkMtJMM7hrJjQkI5EPpSSmMruQUDNRygDMz87/DHZkZVzF9byLkX4L7EUl6dMQO75c1wqo0lRXKGnZX6/ej74SdO2xeI5J3PCizgPToWpNyP7MGLiGZIqog7YVh0hvS0/CWz+9RrQeeGmFPSUS56w9p+ZdMqBXIF8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5+emkgeud6FLKO1XlwoGHZDLgE/sU2VprGd6k3f4q+B9nN+g/lFksDV1WbCG?=
 =?us-ascii?Q?+PWVp5e10/ACZqV9DG5TV8LRILwlZ7r5GntF5g+lpCg1DnxWnkLDcZwDS5An?=
 =?us-ascii?Q?E0XIHbJzaha6FGgBAgkiBqEyxRw7qCAtnB+R+kSgQmyrkZGyQ9dpu/dhuHS+?=
 =?us-ascii?Q?RAYC0wCh7DRYIO6Ok7tlcwucpfUBVNd4v+LImIVJ9tHTiRJcSr5p1ZHSXrYU?=
 =?us-ascii?Q?IEs8nPC+gXi2X6M1dsbN3aj9eYn0/k6NenqE2nLNeTo9vh8hOWgjfPakTJrp?=
 =?us-ascii?Q?8FYewaC0nD8aFnOn+ol283O9ySquL0TIgitpQHCTQvexiDXWZ+/roWninqPM?=
 =?us-ascii?Q?aZoXr+kF8n6k65JIDqHPosjT9W9OzsMpCjonXNfELYaGzBSJAPW8tYMW7WV3?=
 =?us-ascii?Q?Ju5IsQQWWC1lGzay+0OCPITqWJBwxdSD2s7Tv3/VSXouZTczhQd2I4a2DwO7?=
 =?us-ascii?Q?mta6u1Z8WqzQEU9RPX9AMg9VULfV1bPPYscVrrH+3mNqoM+82MrrRSKLde0V?=
 =?us-ascii?Q?tZAeyPjtbV0RuwHkR9M9TJJ1tSAvDWmGJkUKOK3Wbfhg3TiulfIgBe3gX9FH?=
 =?us-ascii?Q?q9QI39hKGQniBttrSnfWqpr6GzruQVlD0S6qll1AdCWHUf/HqW3jnEAZWool?=
 =?us-ascii?Q?pUSUbDxZyy5ScAu1MEfKa+4pTS5jHQMZddcVrLt6NeQOeMUqn/QeIlSRxjjQ?=
 =?us-ascii?Q?5r7sYfZ7HCzNoo6ZzsRfRENPypcX6NfbyvbT/uSqNzvQqQfFvsRm3jaqra/T?=
 =?us-ascii?Q?+TCZLWFE5N9a0WIV5vjj/Uxl4o26QVlbvDibyKtu5dIhAqu4htr8iewxQUxv?=
 =?us-ascii?Q?Ml+Be8pCBOaWPZwZX4I1Zq5tYT+Jk2OB3oxgRR5irDnrxXTndO0tpOBGruJR?=
 =?us-ascii?Q?Qp34dCGR5Mj7702p2Xip/bEuY8FWJmV25PmR8ybV+Nh1sMp5ezbGPstF2guv?=
 =?us-ascii?Q?sEJUG+FhG+nZPufQHm+PJ9IVtmvp/qwPxl17/rU68dRhWpO2LvyZfVN8TcVm?=
 =?us-ascii?Q?B3ZedFkZ+FT/MuMOeWS9pGmQMCFkn/IDX2Q8pdg22RRVfxbsZ+cpoq4UKWzu?=
 =?us-ascii?Q?3gIFh74iwvBkwNsKp89cLjdvppCG7LIYv7yRQlBj/5waSG24gVV6ewgsk/uh?=
 =?us-ascii?Q?H487aDR7VRuGgpLYsWxhpcY1/4tbLkgmq/TjE3q0KguZ73e4keQEpfuZSxuK?=
 =?us-ascii?Q?KN5ZmlBfWuf+yEDMeMQSeyfOYDDejTGQu+2nZwcgYsIYVB0za0pgqnpb+fle?=
 =?us-ascii?Q?j4eCvcsycj6XcAIVlDPXgp9/t+21XeLV7NvJ81XvogIK20Bmdh6agtGyxCBe?=
 =?us-ascii?Q?yQb1gNCkdN9YLPerZlxyYLZqPYMHPO5gKWgybg2RNY/qeRQN5Hv7EDhJCHrb?=
 =?us-ascii?Q?0+HBYib5Rep3P8mZChybCF8i5t56HfPm7pZqAr8lRuKcnCTypmz7/ragSeOs?=
 =?us-ascii?Q?M1e3QLPrAEI9Gp8aR4moKOUlGPqB07EdL1pKTIf2dba22eGaVxFNTBGdhH5B?=
 =?us-ascii?Q?81QpKHaWMoWFzj6Gqwg1sXPd2pAXk//l5YHE2ibnqeo7aNsy47TOk+T6BrJv?=
 =?us-ascii?Q?rxrpkZKeVyB0KBiJ2fsHANSII7ycDR9vv4yBGwRY16ofA6gw4EeCGvw6NByX?=
 =?us-ascii?Q?gziNrJIlOPoz8peQ1EbrKt/lewE+bBfZnSxhVKzHxGkdGpZzXuu1RZvWR+sN?=
 =?us-ascii?Q?uSBzYlXcCXugl38ub+5bjXm+MN30HtHwtBKgSGXD10EPs0Ef98FCyekUcL6E?=
 =?us-ascii?Q?zvOkcXxo+g8LP07MQHAgBY+1CXn4XdXyR6x31lM7UKsFgLy6UAM4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b68eae-6647-4450-7119-08ded790e6ad
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:50:48.1725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxDbcnIZoHNKtfG4YRPjDb0aidVQgNoqfLDYeQboSe+3BvmKPyGwcOtEkXOW0y5pOjjVS19a/Ut2WUnGKK6G4INnezT01LV79S24298NYcZKzsfblIL3gWcVGSVA2tg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17534
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66256-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:nas.chung@chipsnmedia.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26C906F0082

Replace the bare placeholder comment with a full kernel-doc block
documenting all parameters, the function behaviour for both single
memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
formats, and the return value.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 include/media/v4l2-common.h | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 749fe38c134e..db59dda578f0 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -557,7 +557,32 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
 
-/* @stride_alignment is a power of 2 value in bytes */
+/**
+ * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
+ *	stride alignment requirements.
+ *
+ * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
+ * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @stride_alignment: stride alignment in bytes; must be a power of 2
+ *
+ * Fills all fields of @pixfmt for the given pixel format, dimensions, and
+ * stride alignment.
+ *
+ * For formats stored in a single memory plane (mem_planes == 1), the
+ * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
+ * is set to the primary plane stride rounded up to @stride_alignment, and
+ * per-component alignments are scaled to keep chroma strides consistently
+ * derivable from the luma stride. plane_fmt[0].sizeimage covers all
+ * component planes.
+ *
+ * For formats with multiple memory planes (mem_planes > 1), each plane's
+ * bytesperline is independently rounded up to @stride_alignment, and
+ * sizeimage is set to bytesperline multiplied by the plane height.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown.
+ */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
-- 
2.54.0


