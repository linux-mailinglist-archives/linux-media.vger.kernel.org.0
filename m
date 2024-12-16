Return-Path: <linux-media+bounces-23480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2F9F34E9
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 16:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94C821884B3C
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 15:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE711494DC;
	Mon, 16 Dec 2024 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SYl+F45a"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799D13D61B;
	Mon, 16 Dec 2024 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364130; cv=fail; b=T7nYfgeOJmDUWG85m/QNoedZQaBhKR4bUaenegVglD53scoSypaWYR9LUhWPEy/0rpfZYBRzVRiBbe/Sy6e0OwXzdVJEQOaLDHLkJ5FsFI1vWWQBbllxMe4zKMMVNf37q2EVhuOEJNpBFahV/ppwnW7hVErF4Ork53HQNQLoeT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364130; c=relaxed/simple;
	bh=y/s2N481qzawLlBNS9becXhTmYryu9hMWWXtoz1+iOY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Rt7w0Y2cfjlieptsji7kk85deAi6JbgYRFAldZZQ/6ijESdKkayrXuxL8p0+2PKcHc4cXVsliHlfCpZHfsNrqp/Bzw32e0KL5M2nyiFNdeqzbuFkSqs2WWlgaYp5/6ZgTz1dNm2EO11P0OI4kzzx4PhTl7NI/B0Zsg/Xu/+YjEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SYl+F45a; arc=fail smtp.client-ip=40.107.20.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlxAEX5m60VvQM2pofRzA8qhCx0+gxZtp335rOD8+AZPgMXNYIo5OY3BJ2m1ZquK3Vq4za2bRZ2dcxdR13/YGKHVvZdyV1fUIym4S8SsxHVwyp5Stg19UXRyrMQuxyOwrlLzJqqSBeAXJxW3RZuHXhNpp+dt6hDfrxNOexpokjioA2nJswPJ7N7P+vMJ2sMbWxmWc6STfO0USJgOc7tPR97RtewMssDrhxoJlB7GYS42ad1bO4dasUuc9+DRqzhYATEwj7QX9NQ/Ih1X0fWhJmq/VTEBXMPZB1O6/I2t3BlgdfW6MtWyp3PlK3QbWspnsMlgbHGPbCyAeBVDZywHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//Q+1yuoV9QnQnfN0/4g7Pf5a3hnnsJG5c+3zg/TI1A=;
 b=FOpoyj5FA5H7sMk16jMPn68OFDpxZizZTnpT+xkMGCbgH/UrxLAHBiBnqjoRoc4WJPsY8hjmh6bUaYAcgu8iqf7a9+3hSSuqd1iLRU6X9kO2cFh9cQL4NJL+HLLBHJF6dl9MTAA/wXVEMTJ09lc97wyDMUgUnPaTEcQSPIYMUv5JD2y9I1uG+bL/rlgkz5ept3T2VZlap+ZVHsIImPIHvC6tY3rDZ5OHTBZxxlHQcDJ59lN1ONL8t1etZTOf2V20vmo6es1b8ohmgV2dDYBwOh2VjEOrOoRHUUtzKQnxuGrUuKa+p9DW9WNuLKX+2C1f9lcFXBxfdDD/CfLZPGY0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//Q+1yuoV9QnQnfN0/4g7Pf5a3hnnsJG5c+3zg/TI1A=;
 b=SYl+F45ahUHkZpRlwiG4W4AmB86517fQnHH1/XbAyT5IBKybnw6HfvzcBNU0mzZ5cZ7Vn+cC2rVu/tKhbbeXYKjaGrAlickt9qQnzeswW7K3LBe8Mz9Skxf5csT854tSb9u3lgVkEL4L3Vj3ng5LkVTv+lfsJNmiwA1GkuyTq4D8tjQOqokGM1EpUlkiVMlHxIRZrmtDdVuja3cBpCTLVxrBuMQd7efpm8wkg1nqwM4KNAjPVoyhBZuuSE1egl5ftRaAE1IxTuORx1uiquipqeALnqqpJTIhK39f079SPcONdr9yMxb1bEtMiVgRR3oZ/JeOCtITQKKMY9ymLxQoqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 15:48:35 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:48:35 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] staging: media: max96712: fix kernel oops when removing module
Date: Mon, 16 Dec 2024 17:47:50 +0200
Message-Id: <20241216154750.1193584-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::10) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c14248-00ab-4123-867c-08dd1de91955
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l1O2kgN8NJo8LjDJVEZl4vvmZ8JwB3w6xXOtx28qXLxAkidrmaPmmqP9igME?=
 =?us-ascii?Q?/K6CFrzmZX1mUmg4Ny3Akv3rILVvcl8ivftKBJmesMhS6NRsIP3QAqNAh1jC?=
 =?us-ascii?Q?PTG12hyHN9OMghIS10bxr9u4oZ47i7nIXbeDSvwkp1+RolIbzf17GVLU4Ya8?=
 =?us-ascii?Q?yFpkkHpkqzkCqUCxmBIkbw1dKkyQhpYHFNRNnRul9bVC9oVdWHi8VSueYw/j?=
 =?us-ascii?Q?1FpwGc5+bW91m3k2/YejaQFn7WN0aXAwVFTPJxDVchjxtr5uLcyxZCHEfeMH?=
 =?us-ascii?Q?h10s8l+oXlGxdqOPtEoc3CF1uWfBRqNb+WTlGXwYh3YpH+IHRXJbmid4NqSQ?=
 =?us-ascii?Q?24/cEV5Xx2KUbZIdq5zIgFY31Qa4pu5MiWL+MWw8uDOlvSoNNp8pgwSSB/C4?=
 =?us-ascii?Q?uHrKpP3GBVNDcR7L8iREbwPJ/ePAISiLTMNEvr20Woc99S66M2ErMZ8sN0WQ?=
 =?us-ascii?Q?crYMViYLl4i1/gY7MXPmWV26bmsfIM0xNs6dxRuOzF+Npti+3MjgkXqvWDgr?=
 =?us-ascii?Q?garfKgdUpTqpYAo/M/gN5cs0MdDT7Sp5CZTKvwJEcuQtFjox5zgTP6Tgj/AS?=
 =?us-ascii?Q?SIILyW52KtQYJ/DWCJLLPc6IURCB9NCDzxnSeTJboAhxHcAypSzfG/PYPSkQ?=
 =?us-ascii?Q?tdrmViTTYoe9Ry3DkRiF0btIXf+YKal/CywL7+EiE3APZRJgxvPl9YMweJ57?=
 =?us-ascii?Q?ACrhd39cSqKFLrH/RyBsaFLnj2vleOfhWB/UxTmtSxnrJR7EY7RxYOj1bpOm?=
 =?us-ascii?Q?9JmxKXW/A9UsN7Bimh8GpGKgNh3s5DLAgpOIGmr6JpgTdg71rDJQO2PhIDwV?=
 =?us-ascii?Q?FuY26kIyOzTZZD06JKp34lozZjju4WVwZEKJF3oL14ZBZYZB6wCm12S78jUe?=
 =?us-ascii?Q?rWQmUZ5Uk5laPcJ8hBoQTAhRFmVSLb3hBsNwzikAF8NYReLJ+D5fWjKKQwO/?=
 =?us-ascii?Q?BdFdqaOt3pC7oHp0qQQb3A0Swc6nbFdmwQbwFrDWT2KfSUA2oMFt7pVFcTbG?=
 =?us-ascii?Q?gmTAK6HCuNQJ/z0YudZEWdXFZDU0JEXZB27YNa0Mt/NvJmLO/gfM7HMqcHWl?=
 =?us-ascii?Q?s0FwVpoX2+o4YIXhPr3Sdc0idkcOLF7mhImMZJVWhLK/Id248rEPVKBt5IiO?=
 =?us-ascii?Q?1Uj3gpobQ6MTS/uGDD+zYDsfKcc2yx99cDnqpH3TJX6ExRVXTpBuxtX7P3WR?=
 =?us-ascii?Q?oLx4r/pRHd3pjdB9VGYgmu/Ef/B4SilzK41FZHEr+HmZzSSZO6+ifJdiByCz?=
 =?us-ascii?Q?OMzIelqV+vnteMTKV7QHSoZ5mor27BftcVa78Nav3HJn38hY62ovyvgBKx6r?=
 =?us-ascii?Q?hZo+swZqMEK9AhdK+0WTTv+ruxaeXUe4ogtsV7dVBwAJaHv3HwbZBWUWnlbA?=
 =?us-ascii?Q?BbYjZS/DzZ64nfjhAsYzbHtzWyRa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Im5iGMMaFreto57dOaHedmN4oU+THI1NihR3dPZry60Liq9He8CI1Jj8uE0o?=
 =?us-ascii?Q?HvGr8eiQRI9dAKay8AEldt9wjYQpWkWIW31Sg5CUewOSm2leiNMqEUtIE7ab?=
 =?us-ascii?Q?0KxZob3rsTl/teEiI30uoK76Lgh1hUskTHh72QVYvBzSlAQ3kpZmfIJk4CtX?=
 =?us-ascii?Q?dveVcJQrQ0kvDm1UWia9xQlgqrd0WQh8sb6yv/aKjJ9AbK9mtlo1vlL1fk9M?=
 =?us-ascii?Q?zNMPXlH3HjzCtil0zfvMt9CS/2iwh7flZlBH+9ug8MOGWF9zTVUzMasxMOVR?=
 =?us-ascii?Q?Uke6U9L/og8Fs38xVAcwTxg99MiMv/nwb/bnmaWjcXkZVRoIkl+sRC3t3V6Z?=
 =?us-ascii?Q?Fsah/QrGKgwQdod08cyShufgcgsBKEZ0pOyeLM06Yx4gvTXEL5KW2PLR4hxQ?=
 =?us-ascii?Q?+C4eU4IcyMjE3ps8qo3qXBGCImi06QGZf3sRwq56ls6YreQy3CD8MavtmNCD?=
 =?us-ascii?Q?b/+0tVgko6pq5ZPOCCM0XzuixwIPW/GEVi4lb6CcONu+cdJc+J/XilLqwoai?=
 =?us-ascii?Q?YmfKnSBGIuGlN2hgWANv14mem0laqjEtUyovAaBMDtqS2Uvg2L0UzN7/jfPk?=
 =?us-ascii?Q?21sXPu4LyG70aqBbDMb5kSw4WW8eoOoHCxtB5B9iBADXGYA7shjQ/rj++rTC?=
 =?us-ascii?Q?+IMFNTjJoca7k9/2kLbRZ3XNw2r4W4V1RPR3914HqZ4cu9ZRTH3PhrFtSHzn?=
 =?us-ascii?Q?kQPqkLeYO+8dmbsWGyPx698OG83hJ4X1nfEtUGbd8ThZ8HqeHrGeHlycw9zH?=
 =?us-ascii?Q?dgdP1CJ5EGbUbKHQrEMBb9O4aNLCLirKvzC2BJqy4H9pYCTL0GxiqCHL0JEr?=
 =?us-ascii?Q?qYUBbjPp6VZttkS89Seq9gpvGYhJw+YeQRHrNEjreh760ExKlT6yLVT90als?=
 =?us-ascii?Q?8heg4cyxKYGSurQ5sFM9G14YSqUOtOLAjCpI+iNT9ErEVRakHyBbLT8l14q1?=
 =?us-ascii?Q?VXIoKbt53FYJm276wIDchpUoFtFS/AzS32tYKwJH04URPoft/Fc9uG4HNbTE?=
 =?us-ascii?Q?nEZSVUUy8A/KMxJYo8OJ79zb8ugdbRrGU/+Al/a9GDT1CWGJ1tMsr5rbZkvz?=
 =?us-ascii?Q?KZdcMqN/zdfrK6u8jHh2f8RhRrgxGr+ZTU9Wz3L3AweGyglYOJ903qgWYxyE?=
 =?us-ascii?Q?pafCi/uHArPmw5ms7gc7tS0c3QEwK9U44/SscbEEUT9W6JIkC2E0xDGx6KMf?=
 =?us-ascii?Q?axUrXzfZyBS73CuAhHspE16hBrVC6YwS73q3BAJc8vdzw1094Ac4q1EyLnru?=
 =?us-ascii?Q?4d9wuCSi6amtDzIwP3MYP7kp3ougUJw3XR2tXUH/ywfjnc2r5+1dYEC0Tw6V?=
 =?us-ascii?Q?ZQ1seLgTLoDY5kQQY466aCDa9e3vzmBIfXB8anPk9w+6BkSUWZcfHu8Bkt0X?=
 =?us-ascii?Q?JgRMWd+adYlxG00hT3QQkNlrMFeDEANhMUkSpL9Dbn4wuTAoOWt/DttmiwBJ?=
 =?us-ascii?Q?lLTy6MYP7jWGD6iDd2CYUiATlN6fsh2f48Jwy/fjW9TGBn9wU6LhaR+wZz9/?=
 =?us-ascii?Q?el8WeynqrNBF5Zf0oulckvLabc0lNDgE7WzYfLcmVWg0AYJumKfDJEloE3wA?=
 =?us-ascii?Q?ULSEMVyUFjS2xFXPne9l8QEtfXcFSrN3XroAag4a2TL6p3glj3zQibOb3sYD?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c14248-00ab-4123-867c-08dd1de91955
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 15:48:34.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BotI8SVvnD894cY5OrxQ0hZTk24nUgv9v8LXZb9gcSPD4RtRZ8GEv432ZNLa8PO10oY78t3ffShgc30k7OpK9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478

The following kernel oops is thrown when trying to remove the max96712
module:

Unable to handle kernel paging request at virtual address 00007375746174db
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af89000
[00007375746174db] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: crct10dif_ce polyval_ce mxc_jpeg_encdec flexcan
    snd_soc_fsl_sai snd_soc_fsl_asoc_card snd_soc_fsl_micfil dwc_mipi_csi2
    imx_csi_formatter polyval_generic v4l2_jpeg imx_pcm_dma can_dev
    snd_soc_imx_audmux snd_soc_wm8962 snd_soc_imx_card snd_soc_fsl_utils
    max96712(C-) rpmsg_ctrl rpmsg_char pwm_fan fuse
    [last unloaded: imx8_isi]
CPU: 0 UID: 0 PID: 754 Comm: rmmod
	    Tainted: G         C    6.12.0-rc6-06364-g327fec852c31 #17
Tainted: [C]=CRAP
Hardware name: NXP i.MX95 19X19 board (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : led_put+0x1c/0x40
lr : v4l2_subdev_put_privacy_led+0x48/0x58
sp : ffff80008699bbb0
x29: ffff80008699bbb0 x28: ffff00008ac233c0 x27: 0000000000000000
x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
x23: ffff000080cf1170 x22: ffff00008b53bd00 x21: ffff8000822ad1c8
x20: ffff000080ff5c00 x19: ffff00008b53be40 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000004 x13: ffff0000800f8010 x12: 0000000000000000
x11: ffff000082acf5c0 x10: ffff000082acf478 x9 : ffff0000800f8010
x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff6364626d
x5 : 8080808000000000 x4 : 0000000000000020 x3 : 00000000553a3dc1
x2 : ffff00008ac233c0 x1 : ffff00008ac233c0 x0 : ff00737574617473
Call trace:
 led_put+0x1c/0x40 "imx95evk" 13:49 16-Dec-24
 v4l2_subdev_put_privacy_led+0x48/0x58
 v4l2_async_unregister_subdev+0x2c/0x1a4
 max96712_remove+0x1c/0x38 [max96712]
 i2c_device_remove+0x2c/0x9c
 device_remove+0x4c/0x80
 device_release_driver_internal+0x1cc/0x228
 driver_detach+0x4c/0x98
 bus_remove_driver+0x6c/0xbc
 driver_unregister+0x30/0x60
 i2c_del_driver+0x54/0x64
 max96712_i2c_driver_exit+0x18/0x1d0 [max96712]
 __arm64_sys_delete_module+0x1a4/0x290
 invoke_syscall+0x48/0x10c
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x34/0xd8
 el0t_64_sync_handler+0x120/0x12c
 el0t_64_sync+0x190/0x194
Code: f9000bf3 aa0003f3 f9402800 f9402000 (f9403400)
---[ end trace 0000000000000000 ]---

This happens because in v4l2_i2c_subdev_init(), the i2c_set_cliendata()
is called again and the data is overwritten to point to sd, instead of
priv. So, in remove(), the wrong pointer is passed to
v4l2_async_unregister_subdev(), leading to a crash.

Fixes: 5814f32fef13 ("media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index ede02e8c891cb..461d6f9757bd9 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -448,7 +448,8 @@ static int max96712_probe(struct i2c_client *client)
 
 static void max96712_remove(struct i2c_client *client)
 {
-	struct max96712_priv *priv = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
 
 	v4l2_async_unregister_subdev(&priv->sd);
 
-- 
2.34.1


