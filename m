Return-Path: <linux-media+bounces-56916-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLyMDQT9wmlXngQAu9opvQ
	(envelope-from <linux-media+bounces-56916-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:07:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FC31CAEC
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A560D30226AB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CB733BBCD;
	Tue, 24 Mar 2026 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eZeQleOG"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6630595C
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386187; cv=fail; b=iqHICayf7Gh3EQ+CifYega7vr/SvAfT4T0h7h/aGCLWqiuANoxN2FI988X6uexcS/u/FKnmsRsSkffYpsCcYepb4xBNJN+obuhh5uN9DEXIGgCrijVHA7dXulMYuZ6MZNZf/MCwvgah8068waWIRUlPi029OTiJWYmSaVZYoVeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386187; c=relaxed/simple;
	bh=5rfLYmfwd9+1g1IRAi+eqVRuhfTDEVh19fLMQO2N1jo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ndDqVv3ZFhWApv0zAeWEdc/ZM3AoVpm3nj1mCaHX4LevQ07QiTVpe7ZVx6KWwiOHkuCgyuJPRUCWmEAG0Vq59bn4UM2rxoRZ73fQzuaHNKnIrgMSM/HyKwwL5c9md1g295/knJioZ5ZQHRAF2RytMyD7ajiEp3RQm6ifER2izWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eZeQleOG; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWNhhp9Zh6eP6E9kAgwVDEO+b3qiaGdXU3vocAd/tHnJjURHlm6XKMpmJkCQE0tGigDqn7ff7oS2XaprRpCeiiK+2QdMJqpUKbUoGv3nzCqT3bTGG85FiZTB3HqKUVx5KnQvc2wGzE+Sh67z+ynEP3pV7Ok+/5DznifprwojK8mSRukvuq7L0N3WrEqFdNQwHfVqHccH4MtxtBc2xHMEB8zhxXJiyKME+FpyRvF9bXDdoYlnpw+7jTbJyWn6E0TwkWz840y9HVta2J+Emyk9TZCR2ZYhEsxMMMLJY1i56QSXa0auBeY08OfSzYN69x3uCw/Pe3CLsampLu82z73BqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBV9TXNtpd4+o6uHMPc6ppBaz0K6FwvjH4DVnvMlCNA=;
 b=reydN+ba96JH9ZF7xA5SQTY3erUUgd+5BbX53eVbDig0Vt0ANMSaxtbJXxOKqAtfVk9f0YIaENhoCxpecrdtncoc8GcK6WZmGxn/xsGWUdxtT+hyOD2l03phb+KKv6Mg2E0F6dbeuNienRB/Ez8iyHTnzV8lsgLfzMMiE7gpuNmpB4ULaOc0ClNSeny9823Op3qGCkP6Wtwu9b3cjlc9FMr5UQIZwIYz5elKSphN7i3UsyFur7tFBq58Pnvr24iU3ojC1bfYwpLMR7usSSoOWYNjO6Q+IssejtivOFNUI4v0nlIQuel19ljOTtsrFGKBAPIu+ElvKZuFNk0qFfU8mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBV9TXNtpd4+o6uHMPc6ppBaz0K6FwvjH4DVnvMlCNA=;
 b=eZeQleOGTuQaqo+yPDcIrjWEQwb6BtzZRl21Af3FyhMW7KGPsfyjsv8OKPoJeu4mgpKY21uuy8teZZ3J/PlDy5C58N7xezeSr4d5VfY2+30f/qabrlCwlTw8vo58aBIodoqPnWCEpKtAN9NKWe8hCsg/v8FxWFzvQ86NX41FTThVkx7FONo4Z3SpEOsY+6XKq+hsiFzPCiqfzPbxMb0IPB9oRzYrJKwkJW6rXCTeVZYG9Ew5bbM2X6ivTb+XUL7/hO/LoDPEERtcArHvEIahflk/bmHZqddylWLE0jYFz/TkvU60nYArGJCXn56Fh/NIrQo1k359UwCpA2+2PlFU0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB11146.eurprd04.prod.outlook.com (2603:10a6:800:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 21:02:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 21:02:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [GIT PULL FOR V7.1] i.MX NXP stage driver for changes
Date: Tue, 24 Mar 2026 17:02:42 -0400
Message-ID: <20260324210244.2370892-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:806:125::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB11146:EE_
X-MS-Office365-Filtering-Correlation-Id: 699a0549-a2b0-4849-9adb-08de89e8b5f2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 N5WYvJYRimVSlpiFrKjiQMd7nEQslymymwekU1kBRFvGeSf1W7fCJa0Qf1uABgtsTfrPfaHAEKxUNEqYSuK/oTa7kd+wamQGoBSiOF3ivxr80y2JvY3nIyq4ibaeCIJd4YBOGmmIlX/8LFo4rb3XarmuLc4CWw5CUva+N3sepdk6p5Du04+6jtCRTYuIHf6r0GjvQeSp4m5YKZR1yMNDc8MVEdphb3xHunpMNgLsEbp+WdGpVSScNnW2RwDWo5FOYmX0/J/WkOEqAgWvljB3g1h+pRYhg/r2L3tC5MDsm87zsSC72cDgvE5aXjFOboYZn4uSY/0uuB+pbM48ul8lQQMj7GUcjKKRd1VKVsyP8GQbcCQV2UuM9qz28Sclvl+9EqDFUKyroS8M8gn5P2g9qwCd2vcp5do/Rn/WViDN9b5r+HZ0xtMRQCxpI2uz7D/xwO/xm1xFvicCVUYKfS0dY9GTdyx0NkCjTe/cQBX+PBTYh65FCKltNgAwigM/9HlY/m1LY/hp5z2HEdaKiFd+Z4pVEQy1Kuw+EsNt9G9x6wy0FW8G65Pwt3fOXtWYJeQI+eMZyeJ7XNlkjmNdXSLILRjfoVRT675wC8sQJCXLFXE4S9bZ725J6sCn/Y0ErgoJkkJ4CF84YIMOtDaXhtAOosccMhenAzX7s3mm2wJUKCNt5xzE2BjsnhXNHHBIy0XfAfi8lQ5lz+4K4M59zCJNveItw4Yy5s65M0MnLeUvwYrH+rxAeIjaP0/BcMksHsfkEKmDAmQhHW05dQ79VmhMclN8kYy2HsQiYi88TwQT4WA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Z0+gDqw1Misn0+n5lOotWjAjfZQM8bypBHpyTcU7TGYpAz3+FKeW18w9i4P5?=
 =?us-ascii?Q?yJSf9cl10+vPgTnSppN2vpSvQcxOu9hGwHXEuRGWGy4K0RziTKIRrrvTFfxL?=
 =?us-ascii?Q?YFQnSCZ5n8SkkdnEYjGqLk1lmSmZWnlbaEIgp3yKIqpI0OoRiE/n2Lliv1cd?=
 =?us-ascii?Q?gmf3QnqHnbChJZhWFiVmwhBSe3/LCpZgK1y/Te6CFNnFendvtT/Zj8GQOQjF?=
 =?us-ascii?Q?Q0peAc7VebgOy/xS0tPnJREUB/pURJ+elH9kn7Fo8kVBFxwbQK646BlSW/MO?=
 =?us-ascii?Q?P2zFONCBkqtWtO6L8Ms9xxx4WcOAU/JAe3POacL4C5SouBGM2kRxc+117diM?=
 =?us-ascii?Q?Nz9CzFG+qJDzqya6JKqexNV2yBbmyQ+ms3gifS9jrUA381vE2W4Bvg8yMXe8?=
 =?us-ascii?Q?6ARXvhQ26ESoAvfAxdMogCtui3ONsiuvYrJjGou222A17y06g/Sgi6Wqo5Cf?=
 =?us-ascii?Q?dJrJRslSMqD2sdj8aJK0424rb2XlUTyA+1LJ5Slt5ebnXuWkhWUGtBHNJZYN?=
 =?us-ascii?Q?YsKTIImQN/R9/jsRUFxY6HRjJiq//ySygI3frO4DpodNgVgmWJWEz1VoFHCw?=
 =?us-ascii?Q?+qeSRol3A8E1S4DrFiBJLS5OkmOaDTViUr7us6m82k30SngZkakLt7IfxvC4?=
 =?us-ascii?Q?lJQZDeztkl1zxk5+uc9U5MAPp8eHWnI9FR1fTDiyvD0zqnR+WQSE834eGtmr?=
 =?us-ascii?Q?mBVDKQSoR9EOBGUSYuxawH2N0RQ1iQcfd6jXB+qTz/hr4kNqfq5J5/ijepWD?=
 =?us-ascii?Q?lRw1plxi4NABwXJ6+V0ifV+Vy2TE5Tk4hl9MuP06/6KSR/3yN8m/4k//UuoN?=
 =?us-ascii?Q?9P9O7ooabOPAE+IeVmJKLDBf2isnZEfcOJNrttD4kN8iHSZ9h7gnTOU1UF+v?=
 =?us-ascii?Q?rGpNOcbqqP0UtncEbqAPDSmmGSFk4avDkyzz+zjFBr1EvqfrVz7De0evuDuj?=
 =?us-ascii?Q?3c/Nj8pivMgJ1QUr3GE8W/wCzi2m/nUQ6DLMl5mjnoiqBQRG0xlSMAW2S5qd?=
 =?us-ascii?Q?uXBSONvaTVLZXASA1fMG/w2vXNSj//YMhUWwXArQEVlmjrq1vHesGcpFDHZ1?=
 =?us-ascii?Q?WlYga6ze0qUm5XFktzAiaZ4oOW5MtszcYGFs3FrYbMRSYtJTB50Dpnigiat6?=
 =?us-ascii?Q?jqdcBFU6EPAL8GbPAC/b63ePZRnkKxaEzstp+tX4vfXK57jsPPEHEVpyy7Tm?=
 =?us-ascii?Q?NtW9hhBjklTGfoOPAaChLsEWFJr4Gl1vfOh4gUXTeZQ/Bhwy+Wwu7Qp+6xum?=
 =?us-ascii?Q?cAkHwK6aA+1P0jQ2y5QMwyJ/m/ckNqT8N3UCFwg1U1Le94ktYfYZLCWN5Ew6?=
 =?us-ascii?Q?W3VY3aMaunF4WijZcxVcBHHWSJXJu2i1TpTae4P+zOBYMqq9vVoOTO+XIIr3?=
 =?us-ascii?Q?AIYJ1oNrn6SKPEUVzVcxEoWXETjaPsR8FevEwg3pHXew6drc+f7fGiw2nLjS?=
 =?us-ascii?Q?XqqdbpljHEdbrT6ubHL3cslPgJKVHSjN3ZOQgykD2+DQcLP24dp0enYiXJpE?=
 =?us-ascii?Q?qTv4Ookm8n/UvJYNaBJXZ1ofCs4zYjvIu8jlH9MA26U5mfRhCqm0LN5hn053?=
 =?us-ascii?Q?m+kN3T+wVETCb0aBIDu7fjzCu1U5icrXu/2vKtOJE/K1K3YI56kO5XdTFAxf?=
 =?us-ascii?Q?DOe53pn4r0AzC2PA8DPXuX797le71gxBcj2QuCR1omutBklxgiOa51aIx+Wu?=
 =?us-ascii?Q?k6er9g5bcDS3YeifQ1W3v7iAYEJ4G9WZ7TM9WLFYiG+Vo5g/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699a0549-a2b0-4849-9adb-08de89e8b5f2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 21:02:51.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ1dyBlue05mc0TTgBRz2gHTZg/hrTjpG0tWd3FVYEiSCjs8iJqg7NS5XPyA5d/R1dVlqCTNXVxMsu4SqjGzzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11146
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56916-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 623FC31CAEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frank Li <Frank.li@nxp.com>

The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  git@ssh.gitlab.freedesktop.org:linux-media/users/frankl.git tags/media-stage-nxp-20260324

for you to fetch changes up to ed45f1f8e6bd1dec4c8c7c96e51f0e56e46ee8b3:

  media: staging: imx: configure src_mux in csi_start (2026-03-24 16:38:29 -0400)

----------------------------------------------------------------
- Move CSI source mux configuration from link_validate() to csi_start() to
  ensure correct hardware setup when starting stream.

- Fix imx stage driver code style problem

----------------------------------------------------------------

This is offload Laurent Pinchart's work. Laurent Pinchart have not time
to handle imx's stage driver changes

https://lore.kernel.org/linux-media/abqqOw9JZDOSX3mR@lizhi-Precision-Tower-5810/

Ayush Kumar (1):
      media: staging: imx: Remove unnecessary braces from if statement

Michael Tretter (2):
      media: staging: imx: request mbus_config in csi_start
      media: staging: imx: configure src_mux in csi_start

vivek yadav (1):
      media: staging: imx: fix code style issues

 drivers/staging/media/imx/imx-media-csi.c  | 86 +++++++++++++++++-------------
 drivers/staging/media/imx/imx-media-of.c   |  3 +-
 drivers/staging/media/imx/imx-media-vdic.c |  2 +-
 drivers/staging/media/imx/imx-media.h      |  2 +-
 4 files changed, 52 insertions(+), 41 deletions(-)

