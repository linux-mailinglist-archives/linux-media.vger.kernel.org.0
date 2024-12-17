Return-Path: <linux-media+bounces-23542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C59F448F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1C5E161EA5
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEF5155CB3;
	Tue, 17 Dec 2024 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cvGJ1AM5"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9224653;
	Tue, 17 Dec 2024 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418375; cv=fail; b=jf/+lQha9BYH+qrPknvbSAh9GhEJCwt+eGsPq9Dso09rGMoCyidGEQxUZcwaSihSqXKdk2vlT9KBDeTJHK/USilkkyA8TLRvGKE5xmExSGmjqUOKnXhr0VACcW1SdlCR36oRRWprHZ3hxwZNZqWVpefOaqTQsJ04NNp4WtMvIRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418375; c=relaxed/simple;
	bh=Ke1qXEIdH5xBR6RPP9O2tGYKN95S5c9o+kvuKNUt08A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KFU5zMKQpEuL/Y9lHbgShCooLlLsTrIf11pUA4PFqEYrWv/dhO3rS2/S2H3exHMHyLYaGMXjONk3cdm0E4EJ/hS5R6kPExJEp6NCi6m4xFeIY9lrXJqWd+JInQvm7u4SPAdvgWBAPPYBsCtwo1mG3lURdaxFqF5fr7Rogh9/GDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cvGJ1AM5; arc=fail smtp.client-ip=40.107.20.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT6k0/xBC+njoOMNVC6cnGrjapb6loiA4PSq1qLPux8xEldP0dEF3k6miAub2MD4jdPkSCFnO55A5sHWTaLT0t/PEFDFjRtLDHCIaJ3FYRqtepFYbsPC0bK1+cqrVvsqskgg/QwevTEpYwYnj3sXMGSNNdBNStMlw9pzDoxNnAYRdUNKFOslc+Zdhc9LCKwqmhtJu2vUNz+e9C5VOaYLQdnsUa2FUWXJupwxWoK8+ATfqZZ4EgfLd/KISxWSGgIY7ITQiHK/8YFhAlNrCe6+nVLh2LZIbI7XB2+QUpsT43uBCNCaWKM4SB6s7nlMIR918TvCnZcwTH9Zjkm5d/Fy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfiyHrpln1Z6tepGk6VJd8ZYEq/uaHOUBugvXjhHgcU=;
 b=PYsESEPgVFs3wAjhsb+Qpei4GePowSHnJMk8hoS9KgV+T8FjP/jI3ViCkBN8jLemqTcsvXE2CUokHUM02MvQPf5BtrXe07vm6upe2DEeVqI/JFfuqZ7HF4iVC6/G0jN7vXEJ9aGIB1nm7fME5xk9UOf6AijR5PyLg2MTApF1uF6b85f54yST28C5PMeVHKxuVV1hN7Jpm6QlVkg7Mbq9zYahdY4oUn1Qq4tSfTteJijhdNi5pCmR5t5/X+CQerAUMHWxJfSJb0WXaeVp0kGmF+oVtFHqsXS0iB7f7fl8jY3xDZ5dYwsntlgp/nq5YHMPPzq/cOocI6QDui7KL07Pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfiyHrpln1Z6tepGk6VJd8ZYEq/uaHOUBugvXjhHgcU=;
 b=cvGJ1AM5bmVPjhZk0cnXB6X3zkbRjrWhlhKe7I6YbDd9Jb1kciWlNeulPiUikNgQwdyBvvRgMHL6PIOd4+9TyuE2nU4Up8oFUbKmWMmiNzYh4umDx5q1q9Fq3yBZrL9gEYF5f4TSFPS1s+J/xi6iTfdVU1iI9jgYoi5XKSyPej3n67dsavCvHLYq+UnB+JbXJ6Q1lpzpYXWAm56vqWtcfernaPjQSALL0j6hyd3Ae732Ja/ru4/Wtb2BbV2gxubT/6EumoqZMJpez7La4YjPCIS9NT6BIlOFXV0PTOKz4YRZiwM45t3s0ZsZgI+zm8o5yKtW5cxkd6yFHgM4q4CO0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 06:52:51 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:52:50 +0000
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
Subject: [PATCH v2] staging: media: max96712: fix kernel oops when removing module
Date: Tue, 17 Dec 2024 08:51:50 +0200
Message-Id: <20241217065151.1281037-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::10) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 9edacd18-af77-4f82-6124-08dd1e676c7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S1BmQhVDsjANfpMaT+FP/J5kc5xAFzWKtMc4m/oTamBz9OCZhHAfqAB8Cxtq?=
 =?us-ascii?Q?sLmWxa1uuEBL4tbYOoXbXWfeWyqGaq9q2v8Uz59s4iM/8ytoW5H35vTS/84d?=
 =?us-ascii?Q?FcO7k9xe4MJwGUGM+VOaDSVpPpc3aRiQOzAH8gK0QryX2WRTEgnXEN3nOI5h?=
 =?us-ascii?Q?FDsAmf8cqtbIPf4Ctrisg4efuJY6usfz2ET9oJBtIAcEGohM/hLX8i7EOuTN?=
 =?us-ascii?Q?6kmcvTAIwl1e5f5iXRyH1GWHKsipvUKOtN8ogtQ2NgNqkQY+qqNVKcEt5OVl?=
 =?us-ascii?Q?mcTbPdGTuMJd0LqzNoBJLK4c1LbmVR8ykiRZs4wvOs3D7Av8uAGCCKucsa1t?=
 =?us-ascii?Q?vqJSs7Y69QdvW1B6bbCLstnfGRVcXEcUuit34na5roe4esmYz9h42/V+HIP2?=
 =?us-ascii?Q?JKWjG41DUZDXHrpbtAafh3nxZZ1PNgQlFYWeUV9gOe6qpUpkeYTKkljJFl0p?=
 =?us-ascii?Q?vGqf8FAdAv0L2ykVfg8MpHIf8WhjJQoFwq8zsstSFVAKZ7wSh0DtETQAqDsf?=
 =?us-ascii?Q?rfM3IBVFlanXaLQL5ObL73Puo81wu6fKgG6Nm7g0NpGKS1SgbXZcuZfcYxl7?=
 =?us-ascii?Q?CKnsnND9FOtKuiSFz5BpLlLvlrLICTafZZzUw1t4kFhKi+rjCckwe1PCfTc0?=
 =?us-ascii?Q?S3QlzfCdR7+pC+A4fpsP/WUXVLdetil5kWlFwT98Re7G1jjjNsd0sTiIqxtv?=
 =?us-ascii?Q?Xrp2DLrkbwDFyFOWzszOkUHG3CKa0JQHbKImZbK286A25lIH8yANzyCN+wI2?=
 =?us-ascii?Q?pKuECc4OHlGf38unTD8+QMVoQMi/nWzH1lcPzLYGR1MS8hSHFN1VCJ878oMc?=
 =?us-ascii?Q?YDmKFHah6tGqTlGncb3Cz8JtqW2wztDYGgnOikd+gHPSBwy4VppFCQnAzWdT?=
 =?us-ascii?Q?+UsBgnCqoCprwsYn70cUsVkNWtjPE4pYEQcPnqGUoTU83mZqwkN0Ye6D0jxo?=
 =?us-ascii?Q?hTX8sy6895soIBt6tTz5B/96dhB2Kb9GZ4WPaD+Zv6sWwWJOeFN/PO9fRjkT?=
 =?us-ascii?Q?sblwlMEphLPT3RCYs4WoYO/n3pM4x0uH3MwIUwe7/+4ozaFRgi9qfgEnZxIF?=
 =?us-ascii?Q?v1bes7Z4KhHCikcy5Ga8U3ujow+0/XVdRzlB77u1X2eC+t5oec+Xdrng44g1?=
 =?us-ascii?Q?76ppPocm9jbHR+7ofZiKhkkpQAgdEnqv8jjCol7720vIkkwJ30KklperB+AA?=
 =?us-ascii?Q?NUvOC8/RvgM7Nx5OI4yOowRCrnB4TjPypwQqfs8QHMEi8XcAzFIQqLbd+65R?=
 =?us-ascii?Q?eVf0SwTU0Bo5AGmPxH4AqvhV2FIClziQsgq5jeNPoNpu3B+Dq0clgyJZf+Mb?=
 =?us-ascii?Q?OL0zI31mXpWQ0YSR/K91dyhhkeCkjTtWcVreh4hpqLq6l3IYti+dzKA7LJEu?=
 =?us-ascii?Q?v+AfBQooUcssTOLOacIygdESkCXl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+cgXqVl/XTNgRJYsKystXsv7wE9XmwquTdWrNnkMEBhCB8YGRoiqYVtaW4yO?=
 =?us-ascii?Q?HZkuC89rlcGxo+97Svr0UtqHrZFf2OEnbrNg/CVOQ1PqAyk4KqNHDDDQ3aHt?=
 =?us-ascii?Q?wPYMDVgASdYWPCFsghzMkEqdXFpigXOTPuHuIdcHKi5H19sa/EZn6eAtqTKU?=
 =?us-ascii?Q?M8bVjGLfj+IUNLViEp0ejK/8qVgotwu+fFgRI9YAPK1MGzjW7Pp4fOT0TbVG?=
 =?us-ascii?Q?qAiIlsfJqFXovDnMTrlyIQ+J3jvZKr/N6Zv2cj/KFOwAt9y7PiGvDhKdiGYG?=
 =?us-ascii?Q?w23/VyV3WS+NZAS4s5w7JCMk44328Fo67ysD+lVMRSvcZ0IjaFR7a3Sp6AOn?=
 =?us-ascii?Q?RxpN2MhOwerCCcVrQnXQvV5Oa0woJzl+DyRZB4faTOVk4p3px8MTG/ZtvamQ?=
 =?us-ascii?Q?ti/iUDxvpzj5Xqk+O+A8sV7YHD8cTly0mX4u7vaFWLPov3+STqyh6R8El3bN?=
 =?us-ascii?Q?YS5D887lqn5786uLkAKfsK+f7s5D8hXU1F9XxBpPtA8KEawRi7NWTxMoBtRO?=
 =?us-ascii?Q?gmIF1KwAJ5LBd9Ul8uspTTyRCvxkXIusndYN/fXWoD4I4lnkVIiFxgxNtd/Q?=
 =?us-ascii?Q?VQsTsqGN8Y9mX5f33kmcEl1zK6YdnxNN2vOvCb26nvATwdMPC33zqXYyTMd8?=
 =?us-ascii?Q?5XvGpljEYkog9DT3xC3RE7d53OYcxWAqX0+cCVWN7lt1qd1ijJFxPPjFioi1?=
 =?us-ascii?Q?HUuvuRa01L/4yye86917vQ+JhS4DMqtWEVR6RZmw2demQxSAjmKC8B3T/zUE?=
 =?us-ascii?Q?47Soqi8N73VIdJm4Cudkq2E7nBdae5H8jsyYWU57apUTZSgzyplgHUKPFPhe?=
 =?us-ascii?Q?Co4BZ01d8JW38B1ASPz7CkUtsM3jnrGF77yRsDWJRBAgiB5mU0p36V7yhWkC?=
 =?us-ascii?Q?NLUvUvFboKpbvpWtFx6uzcD6sjBG0zsoLXPWYMPoEP0THMP+PG0dD+hOz215?=
 =?us-ascii?Q?qdZRQcAb9FOggj+UljS7ODrdxr1NLq1qsh1CUrqWAEsfWkcnw/SlyVC6KCHI?=
 =?us-ascii?Q?Hi9N8xk6uUnpWyp1Vcmq4Upg0J65/xNXtoSiqg7E6zOjfGa1uhdIKR4A6Y7A?=
 =?us-ascii?Q?sy8eUnjDOLmnmzyJZMSXQllrdOUWjMqn8kFF5Rzqq99D7Izda6L/jiw65vGW?=
 =?us-ascii?Q?u6pydAf/K93jdNkmg/vQMnZ1oQOo5YVjANZsSCtC1FlSXvbv+IdNGARUAAVe?=
 =?us-ascii?Q?zqFqT3LWkW/jhMzgygMcwEyFT6EMycTW1F39fFVbH/UefYAV8b7MEL6EY+md?=
 =?us-ascii?Q?QqkbY2vuV6SfYmMBZ4oBlzBMtV7om95ixf2BgQ73HNf+dyJl0kcqsaiOFBqC?=
 =?us-ascii?Q?8SYkT9fmUb6ZnSU4hfLtVOy/LRvay+R2gRmKUtzmPvvGJy9xeBEJhTc0CD3s?=
 =?us-ascii?Q?PazJmFjK65Gp4xuVQw3zhcIDjN4ebDoyL06VuLNW6Rzz9qWbZkwZwxCrMNs9?=
 =?us-ascii?Q?Rx6Eoux1iv0dN6cnv3nLFOV7Xdoa/xpEJjI+Fm6FC6Xtvs4Q/3JgIk/T9p8Z?=
 =?us-ascii?Q?Tp23QzFcbcubkHX5lfBji/2C4/BVhUPKyhJWKstedbdxllxI3AiTichqTfg8?=
 =?us-ascii?Q?c9WxzmRSCA73ATcxyvhbTXk1ZYMxOAHoBwiut7wq1pMFhRXrWci1SfRy+423?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edacd18-af77-4f82-6124-08dd1e676c7d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:52:50.9021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCNFIb/27RuyI2RJ5CWPHS8V2OK4FaPuK8cHPO26VN5ZkHC/mkyIsCk/1mZD+R5CI21QJ3Ajh6edqWk2n+mc7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771

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
 led_put+0x1c/0x40
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
Changes in v2:
 * removed call to i2c_set_clientdata() in probe;
 * cleaned up the trace in commit message as the tmux status line string
   sneaked into it;

Thanks,
Laurentiu

 drivers/staging/media/max96712/max96712.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index ede02e8c891cb..0751b2e048958 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client)
 	priv->info = of_device_get_match_data(&client->dev);
 
 	priv->client = client;
-	i2c_set_clientdata(client, priv);
 
 	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
 	if (IS_ERR(priv->regmap))
@@ -448,7 +447,8 @@ static int max96712_probe(struct i2c_client *client)
 
 static void max96712_remove(struct i2c_client *client)
 {
-	struct max96712_priv *priv = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
 
 	v4l2_async_unregister_subdev(&priv->sd);
 
-- 
2.44.1


