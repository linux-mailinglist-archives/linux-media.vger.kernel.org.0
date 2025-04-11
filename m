Return-Path: <linux-media+bounces-30042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A77FA86418
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAAB54A3FE4
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E48D221F36;
	Fri, 11 Apr 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MCWUlba0"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5842144AC;
	Fri, 11 Apr 2025 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391218; cv=fail; b=ATRa4PGfIap1YX+NyMQrYTA+dANL21yQUiufArgL02M2Oo2PuE5RuQ4TgBDSbPqTQI1/qLP3jhRaGS1diBwBOyoKLwTs264w7kvzIrCOgNnY7zm+gGIGQQXyB/c3tzt4X61UpMBkmQUE9okS8+Fmp12UdMN51/vgd0V6XLq7vxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391218; c=relaxed/simple;
	bh=NHSYXqT1cHxvI0ULx1+HPOoXmRerwwgI5LDo0VpHV0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cdgrbr/fYf+SRaZHW2mv0mENPZQQDaB4tsEHQ2Uld1XD3uWZjRQgYz4sLfBTCJWZN5ERe5uw1Q3FSx/omkuVEAKWmxWiU6aViMxQ+CF5irsldaBWj+p6+HpQiGXB3e0sI4R1NY/DxfWyGsFDID8CcOS6DVPiMIPG2brUSUz/oFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MCWUlba0; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR9g0k+TTD3+l8z8Re2naKrA2utLoBZsyPELCTsW6NTD+WPCQb7YfAJGNvlWUAhCqbcXZxzYv74R61/V/VZQXeLIxDOM0iN3Df2f1rfWrfkgnO619evNGr1QUj23fkhm6YzCjAcWEZg24I4yLUHBGciGBKVI8w5qVlC+ai/4SqkJDuWCaez8annXTjOrvBmxmltYcmgx1kRSv0KrRGbgyXTEhvegUjJwdMQAn8xpO3TvucdQpduart86lbGD1aU88hxSTC2zfeEKacL+DeqAWTBdvW3VVe9E2yPDkT78HdlUYRfMSZz6Z8sB9jL0xPn0ijsBzqHpu1Va3I4dmSVsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5B1xBYQtiHj/seV2nYxD+kXYuJ1JU54M+sMGSd/fCZA=;
 b=uedrMB8j6syxb0yFMnM7xeygBo0L7VZT0Dr+XJ+Y8mni3vF6gmoUIQ4LaCWSDksjCLz/ibVroyQBWH+jA/Ov3K4VZtVtNnXvazUJP/FIZjUejhmzPpNT4/dRXbwW9DOWjp98MiqjcQLoT4eE8EerpGiH4baGnOF0/o5zB7bSCqb0WoOW8pvHeWZ2cU42+hYdX0GB1l/+CGpyIzKi44EKja23Lcpsa0GGWgFWIGHaAZKv2hKpSzeH3ejHz3cF42p86hpcFrMJ0iKELxp6Kv6r7LBgFmpLL7CtoDtl6fLCOGUgCr0y43do/8E/9U7MuAEozMSuK2wD4Ot5Z6xDFt0V2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B1xBYQtiHj/seV2nYxD+kXYuJ1JU54M+sMGSd/fCZA=;
 b=MCWUlba0qrNJUd9ccvpcnmmkhpyvGf3n+mywwoigeJnWSg5PcfeJNCy0pn9EYJ5SXhBOJBDZBLshr2liwQAOVjH2lBnSSqG7ESybAL2okkDseviRlemu8J2pc16AR0Y1n9zi0ofGeR907+TQ2XJf8JFeQV+rA1IT4jsTgawu8gE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:06:46 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:06:46 +0000
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
Date: Fri, 11 Apr 2025 19:05:28 +0200
Message-ID: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: edcc9973-bda7-4fd8-74e3-08dd791b3dad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EgtDXa4A0ecFpxeySHVE5EOlAMclX7CDUpdS/dkOT34Pg/g5IMrPsTB9T6rM?=
 =?us-ascii?Q?wmp7R9/QXOqH9tc9W5RZ0qe82radFmFdlfikOmgCbJOkQlh2wXLvPGfEc2AX?=
 =?us-ascii?Q?/rhugwkIuUJ6vLHIMqcN3X1Nn9T2gHDkcbyzWOBm/vfeVNBsoF6WDlC/n5sc?=
 =?us-ascii?Q?bnqEj+3gAl+Ei2OqCS5NAXWvVWvKRnxuDCmyieT26yH3LwaVXMLCSb65j/o1?=
 =?us-ascii?Q?TL12yd2/XzNUz+mV67nHV9YtU5LVfkygNxISMjhOMvR+UQ73l11u0yixREni?=
 =?us-ascii?Q?akDA8qpjIalRTUxUXgCj0gpVGUgAdBy1+iB56rjEEjNQ5dhToBMBS69OkMwe?=
 =?us-ascii?Q?mgCwfeq3LWjU6CT5fbmJpGA7QM52O8aPFwmA8c1GpVg3aIl10f3+or76in8l?=
 =?us-ascii?Q?jKuYWbmXhsTjMfdHe3LYt4iO2IIrmG4i9WiWiRu4ti0ANaUX5Bb86XGf9OUe?=
 =?us-ascii?Q?WClN2WJUKmAF4MwiU2BrQSDcJthGMJvN7zZ70PvmHKzKO6xLv3xSFgMJFr9+?=
 =?us-ascii?Q?HFlNoMxm+XqhcoJz/1kZWOGWYak6d3cD8irU8z0lOpvuhOabWajQ7ZljAGJK?=
 =?us-ascii?Q?MnBJ+Vn8k3o8hxZ2prL+UHmwAO7W7qCnagw0o7aClgyqp9kfp7ujcmgy2noZ?=
 =?us-ascii?Q?p3qnSZMDe8gdpQ8pujpr8hdDkifX83u31+DUbQrjJ05Gi18PKMYffy5ucsaW?=
 =?us-ascii?Q?AYDlchE+5N8JnhqVmDay6GPAOh/a8nZrfKidUEeQ9p+ZdpeTuA95omxHdKUs?=
 =?us-ascii?Q?GdQE4flEWcRxdea/NUMlraE7DCGnfcKUk5cxpNCkfIMfkrHcKSqykl6zdmav?=
 =?us-ascii?Q?77XAmCaQnfAA84J0D4XokVIZkbFSatdqT5/wZWWX0UcJ2ZOgIpOBDnJ+J0VM?=
 =?us-ascii?Q?vDgMYWYFfeLpUTa+AcsuuzTbsJUEO0dbsixdKNWG/p6WchkPmVVgp+TCdkWI?=
 =?us-ascii?Q?aTC47bZCe8McQ0Ywy5LRhbhUInF0yrDAuMDfAe2m7FDlHNRW6BKseGho1nL6?=
 =?us-ascii?Q?PmTbtWtpm/dL0OJ/xx6M/LUrmmdTpKzLfJY0Gtia8XO5lTmFSrzPaqPaDf8Y?=
 =?us-ascii?Q?IrpuVZGpPMlse8uiA6fhKKos6+CYlc8B+n0hom04ekMTsYq+12zWDOciRqXC?=
 =?us-ascii?Q?r6qJA9T4HZYRr775tolhany2+weBzUjeHoD7SO1ZBMEtDQmYRv66KG+DmTfF?=
 =?us-ascii?Q?wwQd7NAunJVPHWHSzKlIqDELfxz+kE8TPFtzmir3avA9d0QFYHCyPM0qGPq1?=
 =?us-ascii?Q?SBo03j95ipqrXdct3dVsvTRJDGyESN0zTrg5woq9ocxGFTN8Bi6PzY6geicP?=
 =?us-ascii?Q?AaqR1Nwp4QAgQN8wZw84UWnWUqizeVb4E18vt50RA1pE419STfxapN7rCbmp?=
 =?us-ascii?Q?GRereJhOiLwvxSRp683bCu3/82+EQf1mQ66SOsgSYz2V+mKb6Dwgft8cYryQ?=
 =?us-ascii?Q?NolrDD0UKYhUeSFcWcGOm25cFHlf1xAlGvcnx6ZCqly1cMFzlqZCKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2P9ObD7aGoFPrfk2XzMvZJizxtbuHAYkljIOWc3ByhbVpwUdAwHBbvU4K4m6?=
 =?us-ascii?Q?ENdPPsjJOv5x6Nyhw+wvKzkB+sz7/JOVrwsrgEXjfTfdSbi52qXVhw/jgJ2M?=
 =?us-ascii?Q?nDymfRD5TH5kyBbvRdA990duTmE74Stu1Es1TFJS18bbwAU4aonBK4AKYibH?=
 =?us-ascii?Q?dYb2nkJ99ghz2BCV4RHpJ26WhdmGbVB9/EoQ85HloCPn7MZ8qa59/pe6uxhR?=
 =?us-ascii?Q?YIDSZmTzdMaR6MHWUh9CvPkY5PoCbej8B2RKE7wRA5rOVTNwRhSza1s2HiNu?=
 =?us-ascii?Q?FOs/GU8UgjkMvbxdJ1I79+SuHBhAIFgr+FuLYOwXyh+Q3v07lnWa0EBG8D74?=
 =?us-ascii?Q?9c5ER5pYFP4Mb2xRMwxO32Fb6lk42Od2T8swUEodmm/bQTaveDDVxGm7D596?=
 =?us-ascii?Q?Rf/rcNTilSy2aAiCNT0OSxB5Qv+U0qOEvYF0415pke3EGLIzro0nNGuz6ZzY?=
 =?us-ascii?Q?ozqfchE2IM4xq2YSyWsB+Mf8DI8RNKaNwwSG81LAyR17AHc6UZuIBmOaEdiZ?=
 =?us-ascii?Q?ofGSNREtHF6A57XY8AYxNLT7VBx1SHSj00KWzFgG3xIyWBuk3Dka2DFkH1cK?=
 =?us-ascii?Q?Y5cU+6pqBowVODRLo64h7kUN4vER6pj1LBBU200zdeJJDjbbOAZ24cdDiqsH?=
 =?us-ascii?Q?h9ncvxSHWr+bK7kMX6xGkjhO/HWP+Pesfur0ryYAiqExH6whoVETDxnEsrp7?=
 =?us-ascii?Q?tlDITf1Rm5iUhkcUwjfKb7SW4HC7/5mwLOw+hPkwkh6mSeF/RVSCf39kz9vO?=
 =?us-ascii?Q?kyoptigCkwnchu6X9X0igcRyBr4WmP3mc87sGRRxF85vz5/cZNGxoErJbDmE?=
 =?us-ascii?Q?lVq0u0P68KlR6x6lmzN/vhiYDxtyB+k3Pfru4uZ3kLPCF2OF9N5156fBG9x9?=
 =?us-ascii?Q?Ya++QbRf8gIMuVXJjbd4R9nyBLYubRNe2M4B96kn5eqmotGrWGN0LK8xSKKF?=
 =?us-ascii?Q?VUijhIXPc81R2VV2UH8+WYa3uWJbqNctMnuYPtBhRImJp5RabWuFwf0jff+f?=
 =?us-ascii?Q?TsPwFf3ac0OPxxpeoUVyw2D4s0kwh3L152EzxBPgGHthY1SE/FBp2GDveLKs?=
 =?us-ascii?Q?neo4H6sDtUDzfXInZ3DMMHdJitPdXHwcbIvCKCjh2HJtptPZIUJlA8EovHpg?=
 =?us-ascii?Q?07aTVqCKWKOGpdSyJ6bjBG/6o20SiPorp7N0QdFtY8EzqTcnNjuzfCNkjGKW?=
 =?us-ascii?Q?ZLTwI1/yKxMSPTSmZx8IjL9lRjdDRiJMN/huYuuuJeQeB57hih84wVevqnFd?=
 =?us-ascii?Q?eT83z2UDOBV0+m/i1AGnPVLdgdatfXSPUnMyH1Qv+BdSy92/LeZ+NQf8KvNJ?=
 =?us-ascii?Q?gXGslL/54yggZicinzdAHq72HofohiwltW7xu96Wb/ryzrjFV/bKcTL4KglP?=
 =?us-ascii?Q?tD/3sOX+s/EaGm87aY7Sf4ce71hbo9DNw7jNvTnYVU2OfpegfMi6yo4G3t9h?=
 =?us-ascii?Q?BLXe2m4plrMdP27VhjX4eamJSC9GLJsENWQydPAduK5Tx6faOBQ5dVsxcLiA?=
 =?us-ascii?Q?7DFelITJmkUpX+gmvFvauwqpfzla60vQvVlGQwQioT3Fj4LQf+8N2TgM++sM?=
 =?us-ascii?Q?iIP64yW26KSdRxnRtFHDzKxElHy3zz02LMPGFvYjM+VscUGAFIyUOpUg3BY8?=
 =?us-ascii?Q?nHrVvY9Ldatj/fbuDfKRmrA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edcc9973-bda7-4fd8-74e3-08dd791b3dad
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:06:46.4362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RorAxsWPigI/6C0WsXvXPwMoCs4a3yTySPaxqQwWIW+7Ly0rWNNVTv4prs7zTiX5ltOOpHAKZC7IGeEz4pAVvL6CTrbj67qw6tqhOkx9UaOyhIo24BhNu/IpDzWBDCJb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

Dear All,

In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
SoC, this series adds driver/dt-bindings support.
This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

The series was tested in an out of tree branch with the following hw pipeline:

ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU

base commit: 7702d0130dc00 (tag: next-20250408)

------
Some logs:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.15.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.15.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
                <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 7: ov5645 0-003c (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev2
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb
                 crop:(0,0)/1280x960]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

- entity 17: CRU output (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0
v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev0:

Driver Info:
        Driver version   : 6.15.0
        Capabilities     : 0x00[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
000000

Requir[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
ed ioctls:
        tes[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
t VIDIOC_SUDBEV_[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev0 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
v4l2-compliance 1.26.1-5142, 64 [  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
bits, 64-bit tim[  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
e_t
v4l2-compli[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
ance SHA: 4aee01[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
a02792 2023-12-12 21:40:38

Compliance test for rzg2l_cru device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.15.0
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : rzg2l_cru
        Model            : renesas,r9a09g047-cru
        Serial           :
        Bus info         : platform:16000000.video
        Media version    : 6.15.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.15.0
Interface Info:
        ID               : 0x0300000d
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000004 (4)
        Name             : cru-ip-16000000.video
        Function         : Video Pixel Formatter
        Pad 0x01000005   : 0: Sink, Must Connect
          Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
        Pad 0x01000006   : 1: Source, Must Connect
          Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev1 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for rzg2l_cru device /dev/v4l-subdev1: 59, Succeeded: 59, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.26.1-5142, 64 [  602.158977] ov5645 0-003c: =================  START STATUS  =================
bits, 64-bit tim[  602.158977] ov5645 0-003c: =================  START STATUS  =================
e_t
v4l2-compli[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
ance SHA: 4aee01[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.15.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev2: 44, Succeeded: 44, Failed: 0, Warnings: 0

Thanks & Regards,
Tommaso

Lad Prabhakar (12):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
  media: rzg2l-cru: csi2: Use local variable for struct device in
    rzg2l_csi2_probe()
  media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
    rzg2l_cru_probe()
  media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
  media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
  media: rzg2l-cru: Add register mapping support
  media: rzg2l-cru: Pass resolution limits via OF data
  media: rzg2l-cru: Add image_conv offset to OF data
  media: rzg2l-cru: Add IRQ handler to OF data
  media: rzg2l-cru: Add function pointer to check if FIFO is empty
  media: rzg2l-cru: Add function pointer to configure CSI
  media: rzg2l-cru: Add support for RZ/G3E SoC

Tommaso Merciai (5):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
  media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
  media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
  media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC

 .../bindings/media/renesas,rzg2l-cru.yaml     |  65 +++-
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  62 +++-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 139 ++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 295 ++++++++++++++++--
 8 files changed, 737 insertions(+), 132 deletions(-)

-- 
2.43.0


