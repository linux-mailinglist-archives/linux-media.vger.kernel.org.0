Return-Path: <linux-media+bounces-62640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K9TLDqyEGpWcgYAu9opvQ
	(envelope-from <linux-media+bounces-62640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:44:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9D5B9909
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77AA3022FA1
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 19:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FB1379C55;
	Fri, 22 May 2026 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xl76m0GS"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E1349CCB
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478838; cv=fail; b=usNjlRaQunrScAgrq9Bhw6/AipeKyNroJsiTc8IxyDNkmfT7jKqu0G0bgMG0aTGIivQU6LXzjzgHRqViB1nR+JhvFOpGwASdgq3Dv3Zi4+pAFp9RdvLEO7ZpSEgm2HIDlWl2kLLHvH3ZUWS2ldn9DrTcDqUkWT9peZ/NvJ/NyWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478838; c=relaxed/simple;
	bh=OyE9HboQXmVU9CzKffn4qL/M+88QFfnJVElcpR54AlI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JxpMMaZz7OPb+5WzQDoguQY/Jb2LPZUyKnBXq1ulL1Kp9ekNiTPdLqfz5FhjduantIOL/r/uxV+xYW6KvS7yzIujy3vBvBnPSl3uKctdqSkFbugnA2q76aNKSICid42o98n2FzP+FVleLgiSzcjTebmMNQf7B1Ya+9HTdzERXEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xl76m0GS; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuVYrGa2gHBP49V8VtkeCAo81ssthCmUukhSLkYqs/B6eFG1oMQFPDcrFx7OaIF3gGr2wyGobtAonPFjMoy0Cd6qDkAuuTxxG2rcDeZa4hnaTVjYgtm40VaWw7+kSxbcwvF0SD5OVWLAvTFAVgKRo5f7PleK+EiaoCT1mZDV7HMbD4cHa8+EG3HuB1s9z2csQmZWoFQuqSQBWNdB4+yeJI60zs2G6c1RiZVjHb+a3wbLKipd8v+dEjsNhwsKRnbLB/COQjdB39AR7YN0Y9At0eCJO6OBT30mUWDoy/EIDHXV3iKBA6aUQbA1aOnf9X4PQLEwU42RpUrN4vxlzL+G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1XJTNgS2ge3n5YlUmVMTh43rQBttxGnQp34HY3qF/8=;
 b=JghPJQ+gE/Xczoy5y+ecWZTobREv5Bm26ABhMCvIHvrcLNwkCKTJD6WIGF4vxGcoDoMS0TDhKtzdiYws4fgFFo7sI2UlSXMqr4lAKsSj83EqHrVY/DLos9mOzfD/zE0AeRFaxQ7XHwVGFnSM3rQrUghwUC6KzDVBcZDajGiVVLORiqEtEXiaGzv1H8iW1LPTbxS4rS6Y0B8x4sNoEuSOb08DWNpuIjG7LVq15SuzGciOYzqljiO2i8YnD7j6+wAGQtq/9vP1zSFogwOXdUrWwNY6OjCYomjxR3y7PL3ir/SBCAsRWCLyx3fU3ev2dcY056pRdDvKpCGXhfqc1AYcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1XJTNgS2ge3n5YlUmVMTh43rQBttxGnQp34HY3qF/8=;
 b=Xl76m0GS9pZzGTXgZiXaE17LTZ+0huncIUrMPWxzD6GjQJRd+e6jvYKPiF/7YzN2tmhBE1JdBc3esOhtRl3vGaCMPr2WOg2quMrzPl+tepWlhZoTt21gCIeEPkgeqp8lPH10EjOq5Sf4il49RM5gPzm73X8IQdf2REULiQsbZp3mGNqEJlbNQIJStN6bnBM246AHV2GQ6Msfk/dHBdKEWi0qFKo0wN0sgPdN+t/UMo9Iv/NasxB1VMNfhYhjE3ji6AFr2TYz5KPb/h9F25mWkfHzb7VtZJV0Dr84+UPbN1O/IH0ir6qkS46OuraCGNU0T0fcFp+c2ed0qBnI7AacFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 22 May
 2026 19:40:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:40:33 +0000
From: Frank.Li@oss.nxp.com
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank.Li@oss.nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	Mark Adamenko <marusik.adamenko@gmail.com>,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [GIT PULL FOR v7.2] i.MX NXP stage driver for changes
Date: Fri, 22 May 2026 15:40:17 -0400
Message-ID: <20260522194020.693731-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:510:f::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7b1433-b6fd-4b66-8276-08deb839fcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	xdHyM0wS+IIuW7vC5OKdFBcR9lH62sRER79BnFec+lWt7DOiuKUmIN4z6Oa/J/oUS20QD8NaxF2Znmvbn3lfbBqi8wCNVpUarq+yHa+W7h/c+gMblLU3iQwyeGNh8xO+RaxN0fi5+SR0YEg2TeUQN6hu5gjPNQBxDIMKndrlVE+O3vVjeY86Bz2g0UUXeMiEQD7TihJyRIfHZyLGs4vC9IeNg+VWhvQszYSV7GYn9A2K9ceZSVPMz2H/bJqE+AB3qjRIwQWj/Knn/2A8aI/8CPw0cY5r7c+hJVR7SGCLELC0oRHwVG8nxKH7ckBGx+Xk7ZK7T9kEDrRztnMLs859qTlW5mJY6hMxqqH/QUGaufDAx4VUKPyh0rGs1stkK8KHajjZ/FI6pUKZ5+UPf5JjaihUtQUrvlbEWuwdP/e4I8voaF8J9QjuKpt6td+c6f1XRZgoIYFFhhJ8RLnrTJfLzZwJh3z944wQUbAMp09IULXDnumyXicX/qj+iFrObaTuvDjljl19v7D0OgcxM6NHkwko9yCMBYSekao7XakWdHKCCcsj+iBpVSd4kI0MkL13BSlNhNYsux33vA7fFeXNH2RvPlO/AbugYOFO1oU9rsVHcno2S5qxkECPqRLJqcTKo9pxdCCrgXtXr8kCsKBkTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y5vt4AYwzZt3oIN5AYQYRlAmH9abki5Bb1DLCmRWGftcvFQYyPSA8hNQ8fL3?=
 =?us-ascii?Q?uaChilz3RyspRbGfz7+HXzBJZh81vs0Jq1Fv1ErigGBe4RqRiTlvbrPcFO1R?=
 =?us-ascii?Q?hwo56ftva6AP2ROZSKjsBHSyfW0mmc9kzqcGRORcsBm6H027OJNZtLmOKFPR?=
 =?us-ascii?Q?5Ud2fGJmnk4zK6N/a/ex3vNThOUHEdgiNvoiEKvvu38XPV430o860csi40Gb?=
 =?us-ascii?Q?kE3UE8sXIEuxqGLN8ypPhcwGYuYUOXKuK51/hvTPluj+rQex0/h7ECGLuijq?=
 =?us-ascii?Q?WSM7murzHD4/8AraTWuITHSRbIg/3V0isZiP3JepwXNXYh2azPu96uSGNHKV?=
 =?us-ascii?Q?rXXpJuXao7QiFMbDFb89Lx0NBgU2AmRdc0LEFUlZYRISgJ4/Pg2tgWcbYXN7?=
 =?us-ascii?Q?n9u7gmjwFLKHH4R/67JRc7vpcZnhP+D7qzudGHgisy5IiCaswjCEYymgf28w?=
 =?us-ascii?Q?6qQ784OlhD8NcRRKiXulve9vc6qsu5GqVoUIssmp/IGiSfUbIraNqPLUpsME?=
 =?us-ascii?Q?LNNuk/ZkjoKzKSvN6nCGays8My4mVNbWek8eUsFLeuQgk1D/8KM+TWYBvaRL?=
 =?us-ascii?Q?0N3OM7oVJvJABdxh7G6PrzWkTEso1fjXUU7zxvE1alP3aeOaVteEDD3ilXNk?=
 =?us-ascii?Q?r8QnqgZkg3oJbLToDQQ/lthW+PQdE6CODguwUieRpxh68P/+fsYJdXB3Nee4?=
 =?us-ascii?Q?jx+fYGCk5Z7cvHG1cMQF4hpy7zinOEYTiCVL5VNpmYGTXvWO1VqjpvUbWXrz?=
 =?us-ascii?Q?LkvFIT61d7K0psBQwz4jtMnZ6Wq/csiJf8T96gFVjqfGrNG52PFMfV/2LN23?=
 =?us-ascii?Q?T/Ul45gyCCBAVOQStE5uIDQ4/WLzT8HWiXhJJR+2Ai/N4lMrx+6Kw82UV04i?=
 =?us-ascii?Q?0T82TYrcIw/UxancE9TkhXdWvYJ6YG/qEGU4PZdzWZGr73ba9+dbgeb+RObh?=
 =?us-ascii?Q?PpXW7j/DI+KYbjHo/dGbhDrJOmtVvHL0Zg289XVzecXb+EsHajGom3ZLXt2k?=
 =?us-ascii?Q?gEV8+Mb2l9qGjJXti9TcA9o8NyAVHwVlgNfhN7SHvY9doZ8TNjd1eY0XwAlj?=
 =?us-ascii?Q?7bDrJ/pyIcaWbtzXkU0xyJXpROdGSN46tpwNBw6ElhQEkP5tti+RzHLSLKwA?=
 =?us-ascii?Q?k0l4V7llmAeCoYE2PWD0jiQlIFY1Oazpxz89tsB141v/YZnp6/njlu1s2ThS?=
 =?us-ascii?Q?SeNhTqsVsKS+Q+YR1HNFtvE/bQ5igAZs40P7mZMFqdo0sMVeYhtC1mEB9C8h?=
 =?us-ascii?Q?E59D9aH4PmJgadL83fjBMk87yBgMPgB2fpQ0yGT+TFS/SZQP2mJuNfiP2+VF?=
 =?us-ascii?Q?1mc10FcVUDuMsblEC0BtvQHJQgkoOx0/xtDgCs/Ol6vJHOf06/hdXKCIZlsq?=
 =?us-ascii?Q?0c9PZCM4Bgs7iG58MBR6EKND9kkelnU6k7FGz0heZ2EwGJUpqdor5T7ZDaYo?=
 =?us-ascii?Q?+/RpP1aXtYjrsa3u+x661HqKFdkvVIPEJJbXITZtqrK0xlyZkxNJZ5AEiQBx?=
 =?us-ascii?Q?kcZ6y3tNwRMqBZE0cS+uilqj3+OGDHRoXYsfL7onX0NZq3DY5x+MXPfgaMNY?=
 =?us-ascii?Q?WEgcVzM4TdoYO8pBDYsEqySuHzVun+dP7Cl7j4EHw9kuLIGS6+2oRRKNuAJY?=
 =?us-ascii?Q?ZB4/B/FaiINyDN4b6R4EUNJFTaxxrX8rop9QEm8Eb81fgI3MzlsdIVdbIXM6?=
 =?us-ascii?Q?F29+mjhC0dej2LwbcrHbCRDrYVGR0j9T5YUGu1lMU8agAHEz7TVdq1YCJSdF?=
 =?us-ascii?Q?VbssMPe8EC5bxS5xY69Ger7IIGWarXS76VPWIVlIfM7UOeQJl8gR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7b1433-b6fd-4b66-8276-08deb839fcf4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:40:33.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPBovoGM+7hqH9B9yfMD60noJvHqLq1kp9uLObfzgKLNOumQVwE22LRDdB1K2f5/Cx3bT+v4EnWvZldRyB+R8/tUDJBE1/sm+z9QjoM+zRVCqJqvDgg7SA+vgalEH759
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8813
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.nxp.com,vger.kernel.org,lists.linux.dev,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62640-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0CD9D5B9909
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 940f161f734b25f175a95d2684c2021f6323693a:

  media: meson: vdec: Fix memory leak in error path of vdec_open (2026-05-21 12:32:22 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/frankl.git tags/media-stage-nxp-20260519

for you to fetch changes up to 87ac7ccb322a2cb70957878905fd46d821a919bd:

  media: staging: imx: fix parenthesis ending checks (2026-05-21 12:58:30 -0400)

CI pipeline: https://gitlab.freedesktop.org/linux-media/users/frankl/-/pipelines/1672639

----------------------------------------------------------------
- Use media_pad_is_streaming helper function for cleaner code

- Fix media pipeline handling in imx-csi driver by explicitly starting
  pipeline on pad 0 and moving media_pipeline to video device

- Fix imx stage driver code style problem

----------------------------------------------------------------
Mark Adamenko (1):
      media: staging: imx: fix parenthesis ending checks

Michael Tretter (3):
      media: staging: imx-csi: move media_pipeline to video device
      media: staging: imx-csi: explicitly start media pipeline on pad 0
      media: staging: imx-csi: use media_pad_is_streaming helper

Shyam Sunder Reddy Padira (1):
      media: staging: imx: remove unnecessary out-of-memory error message

 drivers/staging/media/imx/imx-ic-prpencvf.c   | 16 ++++++----------
 drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 16 +++++++++-------
 drivers/staging/media/imx/imx-media.h         |  7 ++++---
 4 files changed, 23 insertions(+), 24 deletions(-)

