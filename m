Return-Path: <linux-media+bounces-64690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6u1cDfQHLGrOJwQAu9opvQ
	(envelope-from <linux-media+bounces-64690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:21:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2243679BB0
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:21:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=V8XkLAP2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64690-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64690-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9371330FE462
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6703EDAA9;
	Fri, 12 Jun 2026 13:21:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E933EC2E1;
	Fri, 12 Jun 2026 13:20:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270459; cv=fail; b=ptgSlSqhinCHhT4TpXZMHGx7wmEon+mD8fBD/lJT2GcP8jybRHPDFS2E8jsDbikFRBRSzhAePK2by7A3HKUWHFbclF0HGHiak+RfU3AIBNp3nUSOOj0vZd1Q+xkenYQiMtJ+gwY3kH/xbG4Ayim7cW0CYllDjOxmvd+Ipt1vq/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270459; c=relaxed/simple;
	bh=BQqxafIMtTkKAMwC+xdESHTLeXpYxaXYvjlaQBvYEcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/2fPtZlYW0bXVcFvByuKH65qm2nocsp4623JWxYmNyAhNzqkDv2/5e0raDQKPv7EQFLSGq2LhE/+oXmBobNgr2PE0RpEUuvXOdPxlQCKjx+rfKqXf3DeOUQoGdtVZRrKE4HkLh6N5I5aN7f4yX71Ea1PevZFzQT69M7KicMSyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V8XkLAP2; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAY1ved88caHYSwy0DiCr0kbqjbv2jGFNGStGiJyEvhS8YH54gzLNcV1VytKrNUWGYqMWnW53Vzb6VS0aJXmr8falMtHBaOhjV77wR0z64/ckrvqirgRRav+x3LovHAqirsliBXTUhDrVAmFIba4O3SPlLnkF5SNMY9MtiBF46saTZ0dU2mZKb8VGhvE2X0uhmAKXj80lYbODbB/Z7nSGzKi44EOXRn64XUvp18JJLtpEnLquLGl9r4Zjl+G1df731feO4FQmOejzbMldL1Y2iGJfz8FPvMHR2NMSbb4rvXO5c9WXLNcJgwC7Hug5QuITRbVFICMNfLlmKYjrRvF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auZ1sWQO+u/Ug16/3GkGDmclPngY0qQnRvzgdh4nQek=;
 b=wqjnWTOougVWu1Qq+QnC/+ome22IjP57PK43C9xRZh8lPQYcmgmDJVe8ghyBG2wzzb/bSyK5wG08wDjwN3q8FMy8W3EIa5Xm+tzJCSl5VTzlzUX/p7ibEByPSS1J7u63YyHrGzV0FJTGqi3o9wXuXMamAjmJPQNwL77SI5+bP9H5qAZO/5phs0WOouJkij/0n2FtSztNC8YW2TCBmMEurhJlInIAqQ+Z1lyyVq+LO/l/p/MycUgm6JWWpi4B8o676cmYinneDsnlWvbYmYdOTHQ5U4+kvy+kOK2V9l67OB3j49S/UcLL15iir81akG1nPdVe/bdZVLD/xMN4OimEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auZ1sWQO+u/Ug16/3GkGDmclPngY0qQnRvzgdh4nQek=;
 b=V8XkLAP2lNMykNWhew+QEy6+JAEKVUKehfO4yr0i9/dvx1xLowyERyAjF+en9KRcjtzecLVdwoYqq/4JilJuplzDjbp4f+V6Cvje1uEzcyF8bT7QWzJYZDYbyQrE8m8v1Nlr4fTeMJsn3W61IEGJm6TyIAWAUC+NXMzonbmnNySwfuawLzSL+d0PrVpNwy77DuOi0zRsM9va70p4b121UCrDeQz7jL7tu5zKQuciN6d7pM33y9iYeEC1ZPtAL/SdLb5JtG0SVlmBPeYoU2HfViGVw0jm39eR8XHHPISGnSV1XK+KxH/UFvjzPvbiY7x7TMUaPMQbXdLsUY49vpglQw==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:20:50 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:20:50 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v3 2/8] media: v4l2-ctrls: Add user control base for NXP neoisp controls
Date: Fri, 12 Jun 2026 15:20:33 +0200
Message-ID: <20260612132039.2089051-3-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 983065ac-23a6-46ad-4758-08dec8856c13
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 l0FLMv3XwBb4Ldr2ipU/yg42Scwb/TH/939AV1lYC6V/Rxsuf/jnmZqklFlguErBbF0cGHGzMS3/+M3d3tu7f5h7rjMcxlxOFgjwxHIFxmWZS8gTx+zwZry2w8JXMdZUqpdE9y6j+5yMWHJ3WGUS1JK58Aj6K+b085kafngvzgXqyagF9mrcVP4vAdrTnlFlOx4ihLCsJmckvULJNguBlUStS18GTX0gTyUKGrNdKgq2pfKK/bGDiwT1RARfBpjcJqFFdTmUabkHuTNCBlVYXtV6rG1UVGRtrkmrPigAJ1R2MuWiYsGVY6eNOVnaXDC/oXuQfYrvxBWoo3CMyvXsevK6mkQ9wFru5+CJHLYV4T3QOWGTrBQxksZ2T/gf/oFh631oN4ROaNDS0hhHge0PHnyG15P5fQINzLmpVRVsTLNdwbTYCjh92bA2rePr+A0VPQO4j8tMylh9wJIuJ4Xg1YgWD2FQZOOQ2pHQIcJozNP7rtZPjppka/Dabws6vdRdB81kUYQ59e4lv1clQFZWiLKK046sPOWhUQweII3V0qn4/iRQuEW4YV7cYDTVgB27KiFym242V2lid+CUVGvVN9GOXI/73wpx2pALs7jsNgxUERidb7jagO9q6WrmzaCiXYwrw7kJLVP6gpujO2VMGIPCChUEmiEw4xEx/+Hg2WK174nImrNiIoo/36FV+/dyqZ4tAs5pTW5Cx7ErTwr17FvgoyOLCe0AqxkATXkZS4o=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?otrEBOoG9XSRtoxq7lEDuuKcFLxol6PUCM+NUcEgZ2GTrIlP4NqaKD1WzwWD?=
 =?us-ascii?Q?uMa+E1Z4gvjuQg8L8Q7Dp+DyoPTz6tSFnRPXl+Qst31ZWTL77Q1C9522EfVu?=
 =?us-ascii?Q?lOKmUmkiNNKGUkebl78SuIm818VDZxh70PsO4hlXQbDKOlom7bcdrjNd03rN?=
 =?us-ascii?Q?1ogvbT9d22E3dr5vRW12XfLFuKj2RA1EOuUI8rxjYZuXKu6xRxq/zzefVd7F?=
 =?us-ascii?Q?oNcaJofW3AeLLeuIeC6ONdk/OuCxhgEw6O0ue9Sd9QU7/9hhbCJStpMPjzvf?=
 =?us-ascii?Q?FLprITEWAyqOL3QTtsIcu1xPdKpFX9AWeRHJawcLEkFAxsSK5kqWwv7m3Ux6?=
 =?us-ascii?Q?KY8+5OlTkjyeycugTtc9zJqfLpgTDD1AHouO/m1KcXaa3vBhnk5H2+wG9G0Q?=
 =?us-ascii?Q?R+xpknazls8ZWSEccuVygy9blJHSfF0h+Fbc1i7CctayBUp5lR+A/U/cTfgp?=
 =?us-ascii?Q?H2qj6IlK9kV5pd3/29lqcsLS4mWNZvf3hhBa5s/KIrQHzuC5EH0+rPmmAM7c?=
 =?us-ascii?Q?3YFMVWXZPIKzoVbtfIwyF/+MlluaMA/kDeFB4lEYGX0dA4zrKCqhbggpIEMz?=
 =?us-ascii?Q?m9w7G2RRhTFaBYvm7i1RHaEKbbzhFerxx9SLT0ZEuhrI/mw2YS5hmq9BcYty?=
 =?us-ascii?Q?7+41Qs4Ygm+YYk7kMS7t7FFIsmVfKL9RKJZlXvU7UWVuCwIFcex54eKKgdgF?=
 =?us-ascii?Q?wk1zkJdQs3sUkwqcl0WztXXDvVj8W7wcJ71dMEHEnpV/k5FhPr65N4Bf5uS7?=
 =?us-ascii?Q?9Iy+7Kq8sC1VciP08NDXgUBwIKKYfsqPV13I0DSNgT38mcAiZpIMpEI59zhI?=
 =?us-ascii?Q?5VHHYMPxFX67MRdRs0uSrUTj9FpA7iHJwRrP6ih+ov4gPPuzPoKxSFY52P3n?=
 =?us-ascii?Q?H+hulPJEHAvmiQTcNRXrbAvr3CxPPtajesVJ8OJL3+M0oFKko2sRs9GiCszL?=
 =?us-ascii?Q?3qRvH4JbL/M48B73Q/xvlIb8/jEV7mix5LlQIorepzAaXtxIzLRJRsWmFmao?=
 =?us-ascii?Q?kZmEdppRw4kII3WOOh6vwNDWr9r+WsJdPV4WHBV3WLjF0OCC9GWQbWqv/Mmz?=
 =?us-ascii?Q?3U6cmdOB8eSRB+T/xChyXeR98LjEfp4sIqQ0JPlSwB+HWqwmu7v33Yh9tDTW?=
 =?us-ascii?Q?CgTCCiNQnvIyAjlEVJ5sXcd/5EAM+K969htmTq1H6OmAwPx6n6rxlaj4Ku0A?=
 =?us-ascii?Q?7L75Oznf1tAT6xXGlbX3DMzRSuUihpi9DJj6VBoWHfprFj7RnJw81rgTrLOJ?=
 =?us-ascii?Q?XHicOQMNtQlzmEyZhc8o3oAFV3++L99NZsJGRfrSjBsYhclLl/kcWRnDWpdw?=
 =?us-ascii?Q?ufgpgXDiPj2nTpbdOSzUAeNbgAhW2jOVSi2Zx7F1d6/F3HfPHmrww0xVTxw9?=
 =?us-ascii?Q?o+6lPJD/BcTS0jM4u+BXGlKZXQnfUnkug6V3qNjReGyTc4vSzZamrZDJSIOf?=
 =?us-ascii?Q?+QCZFj+5aTI7P0lCh7dIZ+7ptv7Itdq51lfQ4QfmZzS2vvsJ1MlxC0L67SK+?=
 =?us-ascii?Q?9Mn0Mw8mvVYtmjC2FCn6vibnzHcNUYufK1lFCqMJYPqiAkCDWy9Zx28819Np?=
 =?us-ascii?Q?X7IbkKyznphIVGvTx/hYZRPmltC/2//fTUBELGtjm4FjIMkFFfA4SCL70m+7?=
 =?us-ascii?Q?GHA8euJBAavqbEj+y7cr6YlKyl8A8sZOMoLcEOADEVLIm7MNYGb/q1diGbmN?=
 =?us-ascii?Q?K1KDgMJggyfnksgBbjEoi2IW2W9Zf4Lk5pGsFgLwXdpy3IU6zWZgmrWA9vNK?=
 =?us-ascii?Q?ihSFUvnn5g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983065ac-23a6-46ad-4758-08dec8856c13
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:50.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFg0org8WwQKV9ZL8X9DRtSiJccuvfRz4eblVGSg8+y92sbP6Q+VYmrVp/7yuxOJ0eAVba55ZlpbN3byhkVbkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64690-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:antoine.bouyer@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,nxp.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2243679BB0

Add a control base for the NXP neoisp driver controls, and reserve up to
16 controls.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781..1c44229d349d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for NEOISP driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_NEOISP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.53.0


