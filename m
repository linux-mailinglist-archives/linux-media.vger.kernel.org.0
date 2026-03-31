Return-Path: <linux-media+bounces-57726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNy9HTl3y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:26:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA346365258
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 250CC30329A6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE093C1402;
	Tue, 31 Mar 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nq5wWUcS"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11993C13FC;
	Tue, 31 Mar 2026 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941931; cv=fail; b=WlSD9sYlAcByIl2xulGU46q+mCrOyJ9XepvWgsXdG9s3jKJFjzLh2I7INK3WFkAmselwzCZTRUNGvJsIfQ9uIN+nIMvROy3ct5I/qxr21Z+Qpz9yxLLqExJ3NLgjQZs5YC/xOo8RYb4GvOQBNhnFf8qySOJUx5Shu4MRjewcGJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941931; c=relaxed/simple;
	bh=FeROEfrqUD8BdR1prtuUwKT9ymsdVtvm272MkyXP5q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ulGy+TSrIUt+vdawomFNC1PFvrqUJA7cDbhqaaaNOMxZG52TzoRiPK/hVGQV+xtn8apaqOg8TiDGXeSy27RFVJlEUmXrjQ8rGiaNjjZGzL8aiPT3D1uSWSJY6SFo3QE681ABICafKBkN9cWx6qm7JanK0l9GIf1bsY5AJ3NmKVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nq5wWUcS; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0siN5ovUzzpQIoNme3H/2rJYjfddV9W4DbyP9s/b+PFtdUVYR9qYoa4tfUkAuSwsHnDOcb149SsX/5OPgBTRkf9Qp7BoCOSNACMzVWSjEZORwucjDW16SBdlIVSeYPe1eZqhlfaqYH5CCEJI9tITs0z69bYAmhBa4SYGBljVp39a/w73hLbYiW0ksrNk/1RdtS7tG96wWm6IP6fGQgoyo8cDgb5diC+htyiEGdm3PiHbFRPX7Na2ywIhAsOduEomOZguADMjjFKV8dSGUmBKw5oGBCg7e9NutvCrUx3coG4Bv+Auw0Y18UjAa3G+MM2hF5WiK1Rb41MjpWNbBkRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPie6igWEVMiEee6bNPFfSXSnWs21rbUyCZln8rkxD8=;
 b=hy3YDukOFxQjgQm/DqShC9xbUiin6NeJ/5u5MiZ8JU2trCV1pmQaSHuR/NoQLvXyQV2err+qsi45J7QSAcwZQkt9r0wN4g6MJX0TGbTlAVCZta9DooxaR0EUgAauW8LaOj88BNMbBR/uKSPc7lfGhJJJ2Er9AZ6C08tbzhSpUQW7DXcMrcSqk2RdhD7lFWbvJUmWwZwvLdEDnTYbe+A+8DCffJnwVafavWDVWovFq5gQqNZCDhttuhqq7HL8KV9XqwuwpoxL+qTFJ2kTYToG1yKRQTcwk7axGNoI4N7w4rgxuB6/jFBH/DSCq7jynRwVXomcTsDNsFJbhzYA+FoxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPie6igWEVMiEee6bNPFfSXSnWs21rbUyCZln8rkxD8=;
 b=Nq5wWUcS7qjHr/NEW2y2FnbYHlJyMf3rrgXy7hb2Bzt/1b83f7zKLw8IpVfSRZC1q7wUBv6kJJEGQersUbsJPPfeBWd07lqt6lktV/Do6v3orPMaKYvqtAKCDLuA4vtbiTyVzrceYoG7dsRn/bKk0m9JG6yESHvKmI4+Kc6A1YDnLL6LGsjUyLkGhq1V8UrWnx5dVNpGu+opc9Ng0TghWTHABVzg6u5PZxi5x0xuZQkswj9BVPcy6QoVDD2WrHJLkDAH526iY1rXzANjr9t2ilCatj/Y8m3jtZwk9TueP0vSmh22GJpRqKKgr4K9UOOQiflrOsd1dSRhdbpFOE5f2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:25:25 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:25 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 5/7] MAINTAINERS: Add entry for V4L2 memory usage tracker
Date: Tue, 31 Mar 2026 15:23:15 +0800
Message-ID: <20260331072347.253-6-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d4c911-c2ae-4df5-2b3a-08de8ef6ace8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	DYKrT5bA677ncq1ny1T8U/t8IgGxNbg7suLuNyEEpwq10S+5Y2FY70mM/fjmsdBcPBX4muM2Nxz1RhDakxfHhB/RnbRP10xuN9qkdqmznrKFKvu/erGJ56jYJxiTSemXfLBFIz+qJnPAUe2ZbPUZOqMiqHVehBsM8QWVhxpQcKde53/pFtUMn1vgPUUq+iuRfYljV5YpAm1cIyeDIbPDQQ6KfzyYQQlMPO46mDV7EPuVEgeyUc1nOmPbueaP4NeVzRjFDLYaYfTa7t22upmd5FSdwayvVyDLTweODOB6Jg+f/H582ZktFr5XHBkMmaB7FSCAzl9rwM9Sc+v4cCOiX5I1wLuXNQPgHN7UOXi2I0KxkOu++fPxJPYnaQ4BeoBZBH7+YTA0VdjUM8zt4hsliaO6EtIn4J5Nsf4pfhy+aLO3z7GQI5wIA5lBU3NKr3Fzbk0D8wzniPB2ksPkLZXpMKAU6zyKeQlOcPepLkPS0YhGN8GtXljv6W99FnT4+9qBvKcf87K7Ze+MIdmFqFJ2uTMGBfiaNJm031w73diq0gGHyUJ9SN+cQuzOm+IE6Sz9q58g6cCG7M3VT+8mtqeLhiTAmqYeEp6w8NE8zQXPCJ98v3CBcltGjFQzgLvyvrYrxVrJodEP4y8YtgjqECQbgyDjD++uat/C8RzrAXWqmvHQXOWs8uR8LcLeusTn2BD1KEjVpkdVgZ8O5RfmEGgNo30WTVtIGQy/Wo3Thk4QkwJ7z38kN/IG36Z91LOMAXuvSCrHz8L3CW6VusblqC9zqV65CJQK18keunjY8DVCacY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w0WrH0WjnoMYBMn8gMa4Im0vnhpCb/FG9HIyj+V88Ddut62wQ4xxHBvp1JLo?=
 =?us-ascii?Q?SmHqWuqqLGqWDiOMw4doMSJvh1CR+YKbOiviCemRyHgG6LzYwBImAuM2lGu9?=
 =?us-ascii?Q?h6Ix8IRSqQiHR6UqBkIoP+09EX3xEskqcrmEJSrGkySc0WRt0j6iDEtbbRoJ?=
 =?us-ascii?Q?iS4mSnR7zPLspqqXzKUcgzPi9TBnYpaX8XFu9cjJdEI4zhdw6bQOzH8QyJP4?=
 =?us-ascii?Q?M2gBQiHm0cWjbBrWXCiRp1JuLOY3WTZUIeVbULckOfRVvFJ84D14coIN92vN?=
 =?us-ascii?Q?U00HjOrun26sVlynIm5lcC0eSqztZVu5h3uKS1UhRV7+bLJcViz6ujyZpqgm?=
 =?us-ascii?Q?LIOQUm9IUjxhs8XZoOTgZ2gc2UtT+WafRWSyqcGPwESXHs+m/I+KEMHM4Nug?=
 =?us-ascii?Q?Rgtje+REvTjhIrZi2xiExfvzrgu0rLrX+FWL6ZFHpsYHzT+T65JtnHrIknQX?=
 =?us-ascii?Q?/BNjA2ksxL58+gHaSd4CLjnKlK99ixLNuvZPnpcXZMMSgmS69unSkXiI3o9U?=
 =?us-ascii?Q?oKFFB6Dsan6UIll+EZ75wI+Z6VyiXl83ZshatvjXIb2mqVND5I7VNMeWllKt?=
 =?us-ascii?Q?vbs/aVYng/A3MVJ65o6nPAUqo6CnBAsI2dq3wVVjXp0HyeiCWrhNHbT36Old?=
 =?us-ascii?Q?XWeRyStgGHMGPKu2JSrD3tbr8Lyo1EDUjogjEPbOZCbfdxZALwMpwGw9MfuW?=
 =?us-ascii?Q?2cmHCFKYHxcfXOc/M0VDwj6sER7wakMTmAA1mnlOhvZiO8CZ2eUI/RHhzYKV?=
 =?us-ascii?Q?3WLsGk0Nv0xLx6DBUWvN7bFFg1A8xP1K0NkbKLK5oFUw6WcUnOQl5Jy8/os9?=
 =?us-ascii?Q?rAASvdLGQtbjPVh9gO0Ob3kwgvNpYdAv0tikgve70MDVZGz4ZTbe86Rd2Xdt?=
 =?us-ascii?Q?uRhEWKUUPYNlgDh6XJIccUdkspm7LmBVZwkPuMTHd3JSNoapVqJcFapboDpI?=
 =?us-ascii?Q?8KbWsWe/QQaupfdnHS55B4JoHRsScY+bHp0iiAtDIy+Bcdk2HrrKQHjDp2cM?=
 =?us-ascii?Q?L8JF9E0AwlCsdtFZq5bhC24UE9i4Y9hPXmI9vqCetk0inyFeU3m6YmXrEI2j?=
 =?us-ascii?Q?AOCEi9r3oB3e9WrLYxLqakfq6NoC9ZqMJlhaGyXbx5x14ZGRr9HL3CvBbS++?=
 =?us-ascii?Q?zCryzlrl8KrZjvM+e0xq8iA0hOEkMXAiTh5pTr9nPKt04R+wzQ3kCA0wAu2H?=
 =?us-ascii?Q?E6P/i0G8Y0agTk7KQCyvViIXuEFAIvkzEJoMmLTmjrxNTKgXJUFpb2Aw6fHW?=
 =?us-ascii?Q?LPmU7AKROIWylvWVcxkX0kEblQtCsmqFPASj1Kk8E3bwtIWDtFNUbM49It9M?=
 =?us-ascii?Q?A1DD+nCZiOGxiGHZh2g9HM0kv/ThzQ81hoS/QntyPXbrmMWnt+muzHPFlwvF?=
 =?us-ascii?Q?CwBIwcacgHFPXULZGXzTxdlhtwhMt3C0JzX94H7K3YkH+WYmCet2fiJ9Ms8Z?=
 =?us-ascii?Q?WJiBJUrlRK6lenAdQ1aUfYzTqYhKCkV/xD8HOuC6pgFkqmUAHOtBG0j6lAfu?=
 =?us-ascii?Q?jBsdk7F1wjEHwb6RlZvTvCHNJJEC+75Q8/UBJys6cxV22dXr4d/BCIl21LQq?=
 =?us-ascii?Q?sx+DFVBT9l4zq6/FTw9NS9vUg1sav78nE7QhA2sovg+4dvw3xJ+ILgDNzXZZ?=
 =?us-ascii?Q?5K6d9+pMpV0jdn67Z8S4zNYCNJ8dpf2iWIuCFA6jcBcCypZF9CvL9Z31Fokc?=
 =?us-ascii?Q?CV8BJMj2PyHQcLsMFhfJO3+LZRML3CyUB6UbJPGwZ/mUWsbJwzs5wMNl3HIz?=
 =?us-ascii?Q?2kmg99mjew=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d4c911-c2ae-4df5-2b3a-08de8ef6ace8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:25.0440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxgKkjbAM40gN/Xc8NiwJJMpIDea/bR455VXakV/7pRpVViLKdd4whYZZYuLzuHGwN2+TzZqFouBRrzADfC4vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57726-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,infradead.org:email]
X-Rspamd-Queue-Id: EA346365258
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Add a MAINTAINERS entry for the V4L2 memory tracking infrastructure,
covering the driver API documentation, core implementation, and header
files.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32b1dfee8614..6de2f259415f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27667,6 +27667,14 @@ F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h
 F:	include/uapi/linux/media/v4l2-isp.h
 
+V4L2 MEMORY USAGE TRACKER
+M:	Ming Qian <ming.qian@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/driver-api/media/v4l2-memtrack.rst
+F:	drivers/media/common/v4l2-memtrack/v4l2-memtrack.c
+F:	include/media/v4l2-memtrack.h
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
-- 
2.53.0


