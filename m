Return-Path: <linux-media+bounces-22419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860E9DFEDB
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 11:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D4F161372
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9702D1FCFC6;
	Mon,  2 Dec 2024 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="u1zkMt9j"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020102.outbound.protection.outlook.com [52.101.167.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52B1FBC84;
	Mon,  2 Dec 2024 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135226; cv=fail; b=r1WT1u8eJWyyq/V2ZKvekxH7r8SzBJOocqNK4sIANsmgi5EBwtuMRgkWLB1sjDKDGE3zCWyRRK4/JhlNj8BxSfD+wxazi/01oEg/Hc9Gvgao8xf/YJt3kp2QCdifYScC7AbhQywwsA6nJ/3oG2YOVwH+TMytDbETqIxb3Mci2/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135226; c=relaxed/simple;
	bh=hh4PyGGi2C4ABYEQLtnAtIUAxw+65w2GtE/5swnpOl8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=d5Meh4f3Z5lkkEuqWxt6tJz+GyKxWBQVP9U1+q1imJz23CJRl/4zdfwe90W+zyby+gw08fWXplCrg9kuXg8FYkM8XRKquitToR6jtmKQOg+/YSaPZNVACDNnSx8W3K2DG+YqdupMuvn30d7gyxKV3+EqWFcClR7roxltW3ZbSd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=u1zkMt9j; arc=fail smtp.client-ip=52.101.167.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Chp/HZefW/6Uz1BCCpyh8NNwnk2+Tp4er4jMv66GEhvbA5qOpCgfuahpGUUsbylAR7CPFXrbMpq1sEGewOBE6tc4naGewa8YOgMoD/bqIpLmz0ibSzSWVV58zXI3rfRodrvNwxuU0D3an51H5y9RMv6ikEo9MmImk5oJ2AHwP+AXYvdEcPNY/Os3fFTf0P27gESHlIz+yTz1DOekDYw8nNzFSu3rosRVmzhbflYpdc7e6S6Lv6mhB54YDPU0LGhMtjh8nVC3G3sK/F3Qxl1jjGGrZ1va0daHnPxVlYZg6NWHCMdimhhz0OCtmh7QMSC0DnJlnO5fYrQMO3tDWusXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGvANRNh+rcpqx1BIdJLPzEZHvPorZcVc6rMfzU8drw=;
 b=wVbacINXxGRtz8X7nO1FVViCoDZUjCtkEgVqheXO+m5WZKgICtQr2pEQCBf/+qnXrsj50SAziKQDHx7R8UECVDUfcRRUqRU/+Qb/T3VKSrLjyaso70S+a2YUaTxEu54odhS+9FCiFQ0H9yxMHjbnbmMZKM9i2hlOieUPgY95DLaLZiuFzdYS1RGGBnphXvi6Yy/uX+mAfJ2NTxJNjeAfI3PDN5alF68gXRA2v1G7nIvKTSd+tVc+TYc7U3NR0UngTtEJbXDyTJLnhi1PUPM6GUa6dNk0K9StIDK8wFv39o8oOswT3sZ9fAZQXO13WGS6QDSKE/+8yWtFyPBLPTpdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGvANRNh+rcpqx1BIdJLPzEZHvPorZcVc6rMfzU8drw=;
 b=u1zkMt9jinVPcI4UICEoKNbvZuoPLY65OEW8ihHz+48hBbd4DsKmCEa0MH832qkpO1YLEKbF/T1q6G8iqxlYT2xM4TLYgFxj//p6hhf6uYKZcgdlk0Ov+1MJnPnyfI+91a77PaXOlY8beL4yBhvmUPbXqoB9dH0ExS2AuoOnRSmr3mFGqRwYgeRJjAKzI2rgPnxNAtpm5VddkiRLek6wUM7vseA6KrbDG0feNOxnOI8TxvZcu0+cjLG/5yedy37wv3qyIEX+gwOvyVdnY1iMLZj/81lWOnrn4azLpcL17Z4ayEGMrWrqyEpwfgp7XEhHljjEuTi2SIPZzpaoRDxfIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PAZP264MB2318.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 10:26:56 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f26:a361:4704:1a67]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f26:a361:4704:1a67%2]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 10:26:55 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To:
Cc: yassine.ouaissa@allegrodvt.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Subject: [PATCH] media: allegro-dvt: Moving the current driver to subdirectory
Date: Mon,  2 Dec 2024 11:26:38 +0100
Message-Id: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PAZP264MB2318:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e1104a-ce77-4ab0-aea7-08dd12bbd85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YzPVs7kKCx+JyrXwvQdpTfD+czHVaFyWILo2q3e7BkE7D9BF42Rwy4HYkT6N?=
 =?us-ascii?Q?OMG6WgOyJS7/a+QxttDC6hSZ6KWrDo3FzsbgZr6/99hGqjXxoyWfFaolVGI2?=
 =?us-ascii?Q?u2thbGUtQnF56o/LKWNMMrFsbQKpC1bvWQrBBUM7ObrqVPwdZKNhPQIurM5B?=
 =?us-ascii?Q?8qoXsVw37YJlaybEBWPyOX/02h5kfiL00QX+iiQLiJk7dgwPwTrvrk0vyLId?=
 =?us-ascii?Q?BS93k3T4HoHWMexsFbaxRzyceRF6HiSQFsuJf1yawj39Yus+bCaPIVN9kOx9?=
 =?us-ascii?Q?3vIYymuDTE5SgD4GmLrnt98OwWE0d4alH6j7xgRTbIwwnLoGcMIKfmM4AIZM?=
 =?us-ascii?Q?YGtdMV1xqK8R9bGomR1CPiFPB4DAAUCIK/JLVFk3MUkwCjVQqRI0wNhdF+I7?=
 =?us-ascii?Q?eFqg1NmjREYluZt2/gTnEsMqdNC9E+rd2pan/r0TnrKBqsDp1DfUMu7i5nCP?=
 =?us-ascii?Q?BgNRqsphldtpiObM+EdXxxuyFlz5OGQwh76VOgwX0Qvf5qBZ8BP7udYArwho?=
 =?us-ascii?Q?cQwYXtKDPaP+o8Iz4U4bQL0HZSBUlepBijuqPLVVxH8PcEZAhSEMWhqeEJJu?=
 =?us-ascii?Q?qB9jJOZ7ybwWjcPbHVx6ggRbgWhR+Fya5w3W6igGrQNgKN/GATDdMeNy3N1C?=
 =?us-ascii?Q?EdE56mlHi3/QvMaMlCNCJ90dxl5bk9zWcotpEFOlcmnLQEPp/+HKtjXbIlVl?=
 =?us-ascii?Q?IHuU1OD2Uyg4IuuJJXA8wYtUr7lN/UyHOqGP+l/VGmCp6lPiHe620GTxW8TP?=
 =?us-ascii?Q?ksHYkLEX0keWhANgWT1fC32E30z1QNf3Fh8ZHOXYCgTDJpN0Pr/EwpTV03We?=
 =?us-ascii?Q?maqwUPbGZaq31yOjvN9w6ZFZ+nqOgVkT3cFHyJNBlsYi03GXPCkYNyM3UF23?=
 =?us-ascii?Q?l3gGmfmeOgvLaixMmtRIMrTDJlklPR1n2CVvANuts/pck+qYSy3M/ov69J0R?=
 =?us-ascii?Q?4ZHLBqMdF1d9fjH8Y7R/X1pibpDp7ApcPx4SV43i0P8ke/xP0FAtw/ghnkrW?=
 =?us-ascii?Q?S6xidbTAFKpOKo82unMGuRkGqljFTrnWpX2tRILI5UFicu5DB1JK3A0ZHp9Y?=
 =?us-ascii?Q?8dKiR2osn2NUEithadB0VALR8PJoQbkYv9TQb5gThp6MO/QD4ALLREgj/CY4?=
 =?us-ascii?Q?zyvGd+sk4Ccv9o5efDgGkOK2z7TjFVsyM5diI5rfI/aUNYHpxYxcY/B5ONDx?=
 =?us-ascii?Q?VqRezz6wXovi8cgs9KnQijRfBQK45vjr47yJGtKA7kqBxK7ma+f5g8B/6Yl+?=
 =?us-ascii?Q?TDGN76kn9X42t5xp1IhD51Buz4q2afr0wWobQiHYP5/U4XoooZtz3kh/iw+X?=
 =?us-ascii?Q?ZDefvQX9bMbjaQOXiIQhBz2vFKBVIe41k2Rtdkl5YVTs9LXsdv3r24inPJYY?=
 =?us-ascii?Q?w3zBaKh831c3NXzcDo3xQhYoIbpQSVIbofMvGCP/aB/ZoSD91Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fC7t2n5MHjVoXK5rlwDJt0YlxO614+XznuyAEBCjwnhg7GC8PpmKJl1mRkDE?=
 =?us-ascii?Q?9M8w0kOulg+Q2LvjOYgxbr9Spq97gjC9O91PRosM1kodnFd5+vFJslcnUfOk?=
 =?us-ascii?Q?51BWf6/DDD43jK12J2tPkU+qdeCqoJl/O6pPxpPy0VQzAFApLenV+ulqxK8S?=
 =?us-ascii?Q?SdysvZVs0SN7ICTVXJWjXFqOMuwLW3h8+/cDEVdpB8tblVLIPt++Vf2PGKTw?=
 =?us-ascii?Q?5jgQgxvN/7qYXK0KJkIEdhw/xWTY8GQkQp/UVLUR650Pz6KRfsOCbb1mvzTB?=
 =?us-ascii?Q?m0hxkGGNhi3cjsC9JjZrIngNhCPLYSbBRe0Hr+yaz5gqjeDsD1NeTJ2QODrS?=
 =?us-ascii?Q?EqO06g9smAH5hWXCprCi77BioOfUImset00dVwiaWO4NWFFSSwQpjqKujdBw?=
 =?us-ascii?Q?V+2PUvsD9OwgJL6tbBKG7QHUQmh7JL/bfzDAHVSesyZrUg/KOKIXtLfDhsqz?=
 =?us-ascii?Q?m0Yy+o3hRLaLZ6V/o1ChFSrT944MTDvAPFaM0r7v/Fgp+cn3xqEhHZzumtkA?=
 =?us-ascii?Q?9/PBjEPlVpSmIG1XlIVhvLzzF38uSoPbdcDKJmuqS1h58JZbV4Tp8EwcY+yc?=
 =?us-ascii?Q?txiPZMqMd4ppCGpWtWPXXthOAYBzuigwTqc9tmzUNGczu7RffMkeebg71gyb?=
 =?us-ascii?Q?AGpRNzZTpUUCqixLR/1Ln8GZub7n04yuVhcXlQppoUtHYi07XQCUgkk//sEq?=
 =?us-ascii?Q?hfm3m2VPRX147Q2SkxNWGJcNguWTrM0nPzRFu/3qruB6Qe8V3ACnJMbm+Uhb?=
 =?us-ascii?Q?lnMETT+hTh8/djHz2FkbLEQSPK+iLQcBx1kWL0W2byceQJp9oHbte/TqYLMc?=
 =?us-ascii?Q?H6G+dl9E08aHEkwhepME+qjObZHT3RR4jqrf8TWHkJIwxOebZ4aTOpaOhsPb?=
 =?us-ascii?Q?3mnC5XsHK7L6tyedarZ9hBG1xMdgj05k4QYa3gKWQc0zTqhVFhhnVOHvjNdn?=
 =?us-ascii?Q?LvTrvv2ddDPzfVIiZJcgOIuKCcAfb2lbY6VVLnTVZiCBq4GtzNLM+9aKFsNR?=
 =?us-ascii?Q?Q8L+J4hx5OA7mV4swMPsQI7uSbHtvvjFa418e/hqC6iBg44c5EM14OqzoTZz?=
 =?us-ascii?Q?LnUxQ8rdFTsqnwt6x8F0DiQXCmf2OUYnQ34h/1wVyYAg7gD/b/FfV0Yv5alL?=
 =?us-ascii?Q?VUiXmpU2X9QeP7bEd49P6kOuFH9H/93D6FnxuYx9HlNJD5A8zkIkB4krSv0v?=
 =?us-ascii?Q?CBe1FpWSPSHNZ1FozCA5JAPu+m0u76QLVPX+22wEcfRTynSBeL2czK9d7DB8?=
 =?us-ascii?Q?avbtYrHOBayNSjrB3osYaQMsY5OnFd+fDlsUvxYr3hBMOTsLQICKNOAFa4uv?=
 =?us-ascii?Q?OruymBtDiMo2Cgi8T9pXD89qNkaEVEFs4P4NV4zi/+83CmKYo5Q7fwCdSXAM?=
 =?us-ascii?Q?PWvkuTE8AU8/m0vebAEaGRz1NT72ISi8IxTzDitvv8fWZcHBgHgKHGMzXIvZ?=
 =?us-ascii?Q?/GIkZT1r4ud8O+eyX87VqQryEbEDbw0I9O2kpS2gZrVvtnNJQpX/9B7wEtgv?=
 =?us-ascii?Q?hhGZ4NsTkoqk3xPXO6s+mCvY8nqCMyE25vG4TnyefGFyBA6fm511ppGkgm6l?=
 =?us-ascii?Q?rzpjlbwH/8hNotAs/BLrepAo3F6EUXP/fS8K/OO1MTcR215BgyPPrtsR9ZEk?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e1104a-ce77-4ab0-aea7-08dd12bbd85e
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 10:26:55.6286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7ISmmANbZKGdXBf0tE1QunDt3sDV5lQHixc8HiB1cVIKWXo7rz3PmYY4etbuOO5qsOniSvQUSaZvkqO5fHiu2mNZL1pmRr7dpBi4VsMlyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2318

In preparation for the upcoming driver update, we need to realocate the
current driver that is not maintained by us ( allegro-dvt ).
This will help ensure a clean transition and avoid any potential
conflicts with the new driver.

This patch is crucial for keeping our directory organized and
facilitating a smooth integration of the new driver

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS                                               | 2 +-
 drivers/media/platform/allegro-dvt/Kconfig                | 4 ++--
 drivers/media/platform/allegro-dvt/Makefile               | 8 ++------
 drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 ++++++
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c    | 0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h    | 0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c    | 0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h    | 0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c    | 0
 .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h    | 0
 .../{allegro-core.c => zynqmp/zynqmp-allegro-core.c}      | 2 +-
 .../{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c}      | 2 +-
 .../{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h}      | 0
 13 files changed, 13 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)
 rename drivers/media/platform/allegro-dvt/{allegro-core.c => zynqmp/zynqmp-allegro-core.c} (99%)
 rename drivers/media/platform/allegro-dvt/{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c} (99%)
 rename drivers/media/platform/allegro-dvt/{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7292e4a1ddb8..d79efe6f8992 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
-F:	drivers/media/platform/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index 2182e1277568..9bc7e99788b8 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,8 +2,8 @@
 
 comment "Allegro DVT media platform drivers"
 
-config VIDEO_ALLEGRO_DVT
-	tristate "Allegro DVT Video IP Core"
+config VIDEO_ZYNQMP_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Core for ZynqMP"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_ZYNQMP || COMPILE_TEST
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 66108a303774..04727c5f7ef4 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,6 +1,2 @@
-# SPDX-License-Identifier: GPL-2.0
-
-allegro-objs := allegro-core.o allegro-mail.o
-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
-
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
new file mode 100644
index 000000000000..a8ddb9cf93a8
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+zynqmp-allegro-objs := zynqmp-allegro-core.o zynqmp-allegro-mail.o
+zynqmp-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
+
+obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) += zynqmp-allegro.o
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
similarity index 99%
rename from drivers/media/platform/allegro-dvt/allegro-core.c
rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
index e491399afcc9..8895d7755987 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
@@ -31,7 +31,7 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "allegro-mail.h"
+#include "zynqmp-allegro-mail.h"
 #include "nal-h264.h"
 #include "nal-hevc.h"
 
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
similarity index 99%
rename from drivers/media/platform/allegro-dvt/allegro-mail.c
rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
index aadc947a77ae..88a98f9e5d00 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
@@ -12,7 +12,7 @@
 #include <linux/string.h>
 #include <linux/videodev2.h>
 
-#include "allegro-mail.h"
+#include "zynqmp-allegro-mail.h"
 
 const char *msg_type_name(enum mcu_msg_type type)
 {
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.h
rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
-- 
2.30.2


