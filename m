Return-Path: <linux-media+bounces-26609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2AA3FA35
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35D31894F27
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C627B22258C;
	Fri, 21 Feb 2025 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f/IpJ+l1"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288462116EA;
	Fri, 21 Feb 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153494; cv=fail; b=YjWaKySdAMagh5St0cBreftKr7Tn0dTm5iAO6HK4preE/cp53Ws8x/Itt27khT1MLqASC1aR4SBcrquP2pv0T6+HwpM4nVQ9JgycMbfvera3lehbBKk2/gX00xeGaFN5/Hv8YjXgcIoPpc2qm2sw7kjlWcNj24rAqyNNWMPHK9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153494; c=relaxed/simple;
	bh=1sDYQDoOEeuGEoe6yAxt+VMolFFSdq9kJOAIfCqZ2qU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k87z8fJjB4gp3g/XcvQ8pHmYEsvZpQ6ac2kqle3/4PoFko3byoGVKF6LUdMprwT25iIYSaomlYRiya2onKEGwQ8FhL5rOrPxo76Mo0d8EBwmgOB8b7hrkUH3mJSbcrdUtKIkQKz3F8g/r4xr2SdDmP/GWkaWj3qPH4p7/S6J0MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f/IpJ+l1; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7qmOJ1sgUAswN0nuN8TiKVtFjhXTpxWqW+mSaN4CVgIcENgg4T88oCSr2vjKPNq+2lnlhMqXdnVdkbHDt27Fdle4VgiKMo7ErHRErYoMiDln8arlyzf/BL1UwLl/Ii3wOPbCyv1O6qxaBEXu+crV7bFCTk4jS9bveAL49byFI37FL6dZZirEowtqJWGL5zXO0BCfJjCCHvIybhlksHf8hn/WnzXMUkyyXcb0w677urShkM75Q8AGXMCbCUUh1CnmCSvZj//O6nIxDwWGtU93Rp0KA7l3UzWhVpKpNPJ/Pdr2GtoaT8pK0fYiziCGJeSBq4/J6ftXh3Sy9sJ8VK0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F31cvkbVIVlo9iA0laqNSZSnZbbOcWMUrKRl6EsMnrA=;
 b=V+3eJkdseugdOLkKEPDlDvEGkDO8o9KvB/ABbinwudkJXzYIbNdK9CWWRBhnvK9urMbWEKQYPLJvtQeL5lSXhlsxg3gULKUOnMNZRZ0PMRR8WU6XMB/kWEb3JroneSR7S3IHhMh9AF4mcJEX+uTIGxIT5QS/YstEM5svs3ZZm9OiDj4q5LxKViNZaYdJjdd2AjelIGpWc6UjTK3cud4BSIwU2EsiKNPIDeo7v/M/2blG84Yjv/6K0KJmbkEKKBZgsYovrMps2hDFuZ9ecgsWIqniiTpey/7vnZGCZR/NhR1cbltQHx/sNrKuqM1CKhaD5f52RHxFKV8yTytgOy+8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F31cvkbVIVlo9iA0laqNSZSnZbbOcWMUrKRl6EsMnrA=;
 b=f/IpJ+l1hGNjxZ3sLVgSnezKogCGyRIxy07XL7oN7k8RloyxKv1346H48HHruWD9wqz+W1H/M5zl6w8e12UwbB+XRLYw6DI/yBAyQ0emhjvYB+gYzfuwIxTZNOJ7Ze0BFR1yoJscz1g9EBbtyVjvEvbCSGLTSaqET5W1+5+X+bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:58:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:58:10 +0000
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
Subject: [PATCH v2 16/18] media: rzg2l-cru: Add function pointer to check if FIFO is empty
Date: Fri, 21 Feb 2025 16:55:30 +0100
Message-Id: <20250221155532.576759-17-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8b4a3238-0d23-45a9-fb95-08dd529089f9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KNeKTX3tBnJbertVfXal0TZ58dGQ0iGIowTONi3jWHcNld6PgVrsL6fa7F7W?=
 =?us-ascii?Q?xUYez8Rk3435kVexr7PUml+5xdHRaBCnnIhQ2xbii+IT72PTsJZp+kbHo98H?=
 =?us-ascii?Q?+WQz342eliMcujIDgt5lsIIlT7mnR8KCHgQKxO7EqCcTa6QBCi2IQZOwDG3Z?=
 =?us-ascii?Q?p4mfgTlLuqkHcr7stxDH34h/U/E4jOfRpk1+XR+chT4fdXLh8v0U5UVEpANy?=
 =?us-ascii?Q?saTw/EvZLMXCfA11BcxTtfHoEEleqorQUe79hFLVZ+jnXvBYTOt6YSRmdxv7?=
 =?us-ascii?Q?oNchIOu8Oc79lst5IgBpK2Z+IzpLJu/iDNadNH6pBpIUWa1WcZnd6PVd+lWY?=
 =?us-ascii?Q?aIPIXyReTuGsVuPfkbOeQ82a+MXO52hjHP/0ee4lR70958OO5oRCmj2bg11m?=
 =?us-ascii?Q?iLb+Z7SyNwjZjW5UadJA0u2MJCW8oVzGzMVEguNd8e/HRswnt07smAauZqt9?=
 =?us-ascii?Q?+iCXyCdS/369Bjnm6gRMywjxGuaoaC4vbyA1+kCj422asZv1S6l/xPW3I2R+?=
 =?us-ascii?Q?UzUFHcewvJ503NxpJ8GuPBJrvhud6vgwepT6LLzJIQ63jAQMVhRAwD2fCgXD?=
 =?us-ascii?Q?EFCO89ihgVZGwE/4NSDHEzsoZzmE9qfX2EIWYXk7Z+a19ZmhrQK0bxbPbABX?=
 =?us-ascii?Q?iS4zn4tLmBb7noS1qzwysxvYviNPLvUFwu7jLPH7nZBC86IapZ+MjDPNUVAU?=
 =?us-ascii?Q?MUra+KNHb7+Oa+RqtxDRZfuGefaGzM7j6pg5W35lhlA2bnheOP94WtZ9yTjE?=
 =?us-ascii?Q?vPhQ0oy6MVNGlP497FOEPwOFuAiF9zTfAlGpjB8x68klXy9BGxsSfGbopGBP?=
 =?us-ascii?Q?uif790M5W7MZ/gDaNMQZolJBjkXBLqmrdf/D6QFf1yMF1Vul3Nq1Dofygr5O?=
 =?us-ascii?Q?d0kAI+eG/VMY/tRYIR7D2cXmnHsrvMmCOinSNjDx5xn8CqkgXAk35jX39/ow?=
 =?us-ascii?Q?yX9D67VR8t72ktlGDi0e/dWCn0AXbRocXiPopX0QdijucuR+UnZvIjEvv6vc?=
 =?us-ascii?Q?Jz3CeyrSp0YwOsBQm2gCz/z3pLq37zErSPfShUSljNtYOQBMYPG6Wrl7zGpa?=
 =?us-ascii?Q?6eqROeFrljzhNFIq1Xc9z8Rcpp8YcjvZ/lM5BAahIRmoDfXEmxsRUhSQAjcx?=
 =?us-ascii?Q?ZYtM2knDYwppSwhWvssSNTL73gIoQw0bU95MEvEQQR6wi8EruRFlVD6thmBR?=
 =?us-ascii?Q?Y56MZ0guuTwxmVdmkILMecNZYl3EEFSWEJ5a6I8YpVXfCpOCunh79X37poog?=
 =?us-ascii?Q?5a6qrL1a3LqcB71ttc5IXT4+aQ7N40eyVcoss0XEfxKtlQZJU2ERC29aexvX?=
 =?us-ascii?Q?SvlP4oyMvGcUp2/dlt0UVVQ/83EgT7Fyg/YraC6nZZTZsjAmF76N4MqhdkKO?=
 =?us-ascii?Q?kjSZ/0wl0AgIjWlEbCsVTdXF1vG6TSaIMYd2SXxuO3zVONWNW7IdetNFr5m5?=
 =?us-ascii?Q?6O+i0OZ2evIk6eh3itmeqJZ20L8/gvoi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y1ekdy3/pQ2lgBmKza5/7hzhDYNshFQzFnia+kIvbBFoUm3f21s0ut9vNkrf?=
 =?us-ascii?Q?8Hg2nU+eobzm92SEs+QblBrjhql4dT/oivf7FGPxKhg5IvL04Wo01yfRbT16?=
 =?us-ascii?Q?LMSrmKKnx9OpMrEDMtDW+xc7A2QlJ8NpOnMC0hW3KEddAbFpIRvVmM7eQko9?=
 =?us-ascii?Q?BLvwTuVdVIP4L32bjNP5OxK/e4NuCVqnoNC6D2LcGPEQcOY9H9YFSZfYgJvv?=
 =?us-ascii?Q?9TiaYlV8TZvjG8xwXrS8ewXcrm9e30Cg4awAOd+YOqY770YROCNQZ+IS9PnQ?=
 =?us-ascii?Q?jq1ai+rXjHL6mvBh1GnfZBE+qByMqsg6R+EVAWD08aBsSqctNL4wiyYOwXZC?=
 =?us-ascii?Q?CoTdUnXvYzIDTiWEWOWIMPitfBUHAFk0H4Vd2l8PoqR/FEZdfNs7+P2tQjIR?=
 =?us-ascii?Q?+eLQKPrj9g5vByGVensyfPotcgocfie5WRXzjb2lO2dPRun9MPe0/Bc3DD7+?=
 =?us-ascii?Q?VyDwxJzDUsmsLAUi849Imvrxt3fzw4dy3uLunHRsWsvHNVskG/W/9/rsNnk1?=
 =?us-ascii?Q?DK7eEck+GWI4HKmDW2P4znvL9FG/S6rDqf5oxe3LHOD82QaWn0v47K3EHolW?=
 =?us-ascii?Q?thawHUVy5LZky1MG1Mcb2cqk53mazTwG9lnMNDqHoVbVH4rxgGkqOj69qjg8?=
 =?us-ascii?Q?lg8itd1YLNGz5FxRonVs4OfCR0P9Z/XefkFTC1KcObGdpCV2ufTrIENyX8LU?=
 =?us-ascii?Q?EI0Xn9+0vS3XOsm/qyJ6aJlpIz1c9oWtcojhHf9lJGeTaHdQrOJ2Grkeconj?=
 =?us-ascii?Q?hOgio8ywNrdKPJ+SZiUyHjH4zFfHDoAYHN25ngVD//k3c8d1ChnvO5K+nrHg?=
 =?us-ascii?Q?Rw9nd73jMZ4uKmBZxPbd0C0yx6BjvRmZflXudyapZM7EsHPn15uMGlQTO3s+?=
 =?us-ascii?Q?Sq2M4uvaCM45RZo3HBOw9hwR8cAo0slExUt8/4Owc/IjNSOUfXZQFRtgZS8w?=
 =?us-ascii?Q?TbDV83AmMH6+Mv1oKzBmnIf94GYDo/syiaU/qz/qbsfSf2MzULgvJ6c7zu3r?=
 =?us-ascii?Q?8GZFY6Sl05FdK+6qBYHPS21wVQejwGP8w6CMEngMEd70/q+DOE3/bfA4xOnt?=
 =?us-ascii?Q?tyKSvR8NArzKAz1w+aJwYV4EjFGzSE//NaW3V582K6cdZnDkejkEovYlAPNz?=
 =?us-ascii?Q?JzkrY7I6XJiCTtd1mbql7G/JLkIqyCmbGUyWS3coFpn/8EBUXzE75q4J9EIN?=
 =?us-ascii?Q?w10qmaXQmZrDNRNJy+z9+/0G5Q3frluWX5QUNb1WB1yOdfuxoWj7vHVesG8f?=
 =?us-ascii?Q?CYP1gZviVnYfZM/CXkLCQTWiDkLqRxHc8IMJ2XS32KNyJzVv0++o5lM7zb/a?=
 =?us-ascii?Q?iMouJEemXEJHxcJ5Q9cn9dQXLjvSBiZfW/je6K84FWt7lPfBXqLqwBx4kmoX?=
 =?us-ascii?Q?4o7mZDFCueyUw4phvhqDYwJTHDvKAtSzyrLnoufAwYwoKEnkxdidkFHI3A6e?=
 =?us-ascii?Q?ODD2k+kDfmpVOxOF3I2/sU1ic1Lhg5GKyi2uJLwNJ1WmyVLF8iMsGVH22isU?=
 =?us-ascii?Q?lFSnC8+Xx4REM8/End+MVme8B1rOnsZPjc4fvr9Dzp6CDfxIJwt5YWdVyMQb?=
 =?us-ascii?Q?LbJS/1NmFxRmf3usH0tGHsKyLYta2TsBbE/foFuSr9tiL1+rjvAtFQ2oEJ4y?=
 =?us-ascii?Q?aEd+vTBiuNke73+FDXrpe9k=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4a3238-0d23-45a9-fb95-08dd529089f9
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:58:10.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1Y6cmQAIYUovHszjcG7fwfF9VeqAuJbZDL7A4XdihMVkKXzmRnrAxH8KcfIV2cEUImtGcdYsoEtlQxPtF6DYcenKFxkysvckntIuQYxy0uAqOI6OPThUdr0KKtMp8lE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `fifo_empty` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, checking if
the FIFO is empty requires a different register configuration.

Implement `rzg2l_fifo_empty()` and update the code to use it from the
function pointer.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  1 +
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 +++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 +++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 302f792cb415..e4fb3e12d6bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -362,6 +362,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.irq_handler = rzg2l_cru_irq,
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
+	.fifo_empty = rzg2l_fifo_empty,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3f694044d8cd..2e17bfef43ce 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -88,6 +88,7 @@ struct rzg2l_cru_info {
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
+	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -185,4 +186,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5ffa3173af62..7cc83486ce03 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -244,9 +244,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
-void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
+
+	amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
+	amnfifopntr_r_y =
+		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
+	if (amnfifopntr_w == amnfifopntr_r_y)
+		return true;
+
+	return false;
+}
+
+void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+{
 	unsigned int retries = 0;
 	unsigned long flags;
 	u32 icnms;
@@ -274,12 +288,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
-		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
-
-		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
-		amnfifopntr_r_y =
-			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-		if (amnfifopntr_w == amnfifopntr_r_y)
+		if (cru->info->fifo_empty(cru))
 			break;
 
 		usleep_range(10, 20);
-- 
2.34.1


