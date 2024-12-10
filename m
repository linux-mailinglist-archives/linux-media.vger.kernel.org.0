Return-Path: <linux-media+bounces-22999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E179EAC5F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD687188BB52
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E15210F5D;
	Tue, 10 Dec 2024 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tvIsBlIj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC52080F7;
	Tue, 10 Dec 2024 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823254; cv=fail; b=HeCDYzfGitj2+PJrzpXD785EmBTzV45R3t8cRbbRTsXuT4XSeKrwFPodasomI9n3dtj13c7O79Fpwea0f6+Q1C+0HjgVi0+gMCHcjf6ucOJ7tm43usrA7phCE/xge4eZHXl/eGCcgbX75ttIzQfCP4P9SC6p0f2K0lC7PcPJxGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823254; c=relaxed/simple;
	bh=fXqNW0mn4JAV/NGGulGUGHg63ZzNDFHs9C1oJ4ohAwg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ap0gdSdIv6XlnJUSrAlGg4rVcJdW9kYrEiIUOHzhwh1xwCNq3PWFcUJJNRO3WLl6DYy09rFRLeLlnMM68c+a/EuL52WR6VL/uwR4JGnw8v7UtrsrUk9LI1NBbQyLM3aTaYYXxHhByfGDl5gfVEu/HKhUpbQAOTZYbN4CxFeWvoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tvIsBlIj; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUGzfUhSJIFRwa8GYfoi/mgUgv+M1mhvM5ZZ1BbGzvf4fSNINuoYU5fDLYjTKWImUjQBVkXbiOIQMmyx4PF8p9XGQAumSa7Qbbtx8kuR0XJbbt2NCmQTi0H2p/DVJFrDw8mS76muf/cFaWinORqK80tr/EbqW3IB7MsdgkqVTUBFRhpRpjGikqPYgTW6FyBwyFuKVPeTjQboIPOVMqPedp+IwwrICduUdfks3ITKawugsok2qtu5/EVf5CgbArWm7GALkeoKys0djm5g9NSvT6CpmlT7WAN7KXCZtzVLQ4T3iBlzFb8Wrl3JDgJKuNb6uDJKh8cOE3pg40TX/8CUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2eesSLVrGqvwAXCsGKjIszKMAd3pbGkwZgkFT5kWY0=;
 b=ML23WQ9/i3FiTEJC0xegNW346LMAopNFzMpvcy746zACASSLH+0hvP12taoG+6NXUP1ZENJSNkNMmrPv3dn5sQXqDZVtaL/GGFB6z29Xg8R2ZaSne19/OckcLx1b64fQUVWn3663WFXpRzb1PeXcHxjTqRuQVijnMm+yO8mQ+1hvk2gO7oAlNndpO7juwBUb5Uxf/UDrREj4GG1pgFLJemCBuhQ8vRQILFTmjDqk8ECx1aD+5GY9Ha8BzPLzlArfAhrewVy5HW6xnPOp2iHdA17ni0mQ5BjFUPpDMfzF3goLpd7gfjls+F21aKTmB0u3HD1v+NXL++Cyhnf7qt9MiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2eesSLVrGqvwAXCsGKjIszKMAd3pbGkwZgkFT5kWY0=;
 b=tvIsBlIjtWLIrQ8MGOUZDTzUggBa0nXN2KBVb1oukfPY8ntFDXsbUkx4bwcmSatYP642+DKTZ/Lo4bB8tziVlKhJPJKB2Ifm4eN+cmcque/CwblBmnPkpdrKmZvpaFD3RdmB51LQOfgHRDwoP0BXYxsaO7MIV0fLUeYkEk4/lsIkBBCSxeXgbpS2qOqYaLtNMDUSlasHqZKnnKpP68tHLRKumWtNtt1T9KHK2ExYBjckB3/3A6HGbJ3miu+2NqjYxZ5YncKrnP/wEk2uZ+9Tv/nW/mYc8mDxhW1z+NkEHJiBd/RHUC0z6/pAezTJkiTHsvUy4NAGXJOHCIP6AyFbOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10513.eurprd04.prod.outlook.com (2603:10a6:102:416::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Tue, 10 Dec
 2024 09:34:07 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 09:34:07 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: amphion: Add H264 and HEVC profile and level control
Date: Tue, 10 Dec 2024 18:33:37 +0900
Message-ID: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10513:EE_
X-MS-Office365-Filtering-Correlation-Id: befa00e1-d83f-444c-d9a1-08dd18fdcb0c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QiBJTBDuv80Qt5XH1azb1vATTr5KnsD9gmptLN+n2TwWdT7RhacL8nNNspkQ?=
 =?us-ascii?Q?9OXeIcVhivebveFiJ9BD/g2qdF9wsovRVuv34i8rIb55mfqFBD7dwI84oDrn?=
 =?us-ascii?Q?QgOPzkpksaNGTpzHvHATPcxVTzHJ65uujr8qvTwj7GxquKyfFt46gO8n7sGN?=
 =?us-ascii?Q?B34DJxFa/IeBIV9R3BWRnXXvJs3oqnblX6jpCch5AiWQ8WS2svsVnN+zoXqD?=
 =?us-ascii?Q?BdimqvEp1OVtJbIylxmqKgtbFo++FPN6nvMXamwGl9Xu5xgLQtrS8IMgdmA2?=
 =?us-ascii?Q?hJ3dArF5V2q9pCjI/iHHN4+7c1FzlstZ66GTx57JIEWiXzpL3KrBs3vp+scG?=
 =?us-ascii?Q?JZDZhPLI2xdbmVGFHkFkPT41nivC2ebt8EW4baXcA1qA1I1GD4K+oi7MXlge?=
 =?us-ascii?Q?YfDTM3koriEH1OTq+72tnpoEUsLrwvWVcsIRjveqdkI/HKx9llOY8/O0MrP/?=
 =?us-ascii?Q?6DHv2HLPB0CSiMDU4JzjnT1uMc/7Ke2HCEHe9wridkp0jp6MUz5ZI6tK6c9f?=
 =?us-ascii?Q?c4+UgSWBhkD14vmeh4qrMlZ+67iTs/0MFuekLf/BfNqZZoywmIJvitJ9zxd+?=
 =?us-ascii?Q?3WBVZ3f/Nbfv7Y7LQzKYVzaK0Jmk7Nx7DgP3kw6+NTVQPX2xp/aE+/cSQ9S2?=
 =?us-ascii?Q?ABKwF1O0vWPFmSYOegMCDkzUn5Oabe7lKtnElnXofBy4cOxtc7TK3sAlQ9Dw?=
 =?us-ascii?Q?AUneMAacHVkp/hqm4EDmrW31q339efCbwrfU18qa41n1C4XWFH8nzcRANlJ7?=
 =?us-ascii?Q?cT0nJ25kSAgdQhPzjQrXFmQeP923UhDaeI6A/5G3XqXOZaqY/YUeJu9fK1Z9?=
 =?us-ascii?Q?2kgbxC49ndYVUFNU5+fAF+fX+4P4EIqj4B8S7mq95JSddK3cfu2eb9W9TSNG?=
 =?us-ascii?Q?4pAZJ2+7Fe4+jc+arNu8NaX71FMYim0ZToTVf9znGo30tzw3RkYrJTEXBCB2?=
 =?us-ascii?Q?wwUUl1HoM8WvRSOqpDSyfFMwNn+SC5MUtVsHcyrSq4juZPUkIoqbVV8eItNs?=
 =?us-ascii?Q?RMj+Odz9Gvc0QiKqxFcioyPB0bSg/MpXkJ9TqEaSqnOSgd0u6b9AS/zSZRdI?=
 =?us-ascii?Q?M4x8y3VX+X4TRQOqmS38ynRGhrd4wisk+9+TzE6WT1ETyJYV6vGVPM/9D9ZB?=
 =?us-ascii?Q?KD6+RSpkeItrontqOci+oRjzuxi2GZBZML24I0MW23Cj2WYS3QSPFtcfjXBC?=
 =?us-ascii?Q?GyVFyPYU+NB1j/pk1n6XSyYGoepZ1Hy/DyAseA8g1/NCvnFgj7seaTfIH2UK?=
 =?us-ascii?Q?s6xqv5yEWA+nG3y23uSRQT3Hpm6hx2ITUqIyscTU0SOFxid4pOR7TOXi8yqo?=
 =?us-ascii?Q?ephGlui/riMzFV+7cvzKWaj0YasypSNhQyiXOpYksqfo5aa+iZ1f4yw+UN6g?=
 =?us-ascii?Q?lk+byg3qhbj5Tkso+RDztuV+rLyEN8oKxHH1zm1H/XkJ+u6sWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6CtcJ3+CxGepPPp36j88PGzUWdJCeikYefbEBWb9oag7SekpGYr2UrlOK7zL?=
 =?us-ascii?Q?+6nagNFKoaCSaLdtjHsWPfCxfGgZZo5BZyL1VjmT6/SGxULX+SprqXs8lK6A?=
 =?us-ascii?Q?lljy4QLKnxalr76MZdfIbcSx0o25bJcUxg6vXxcfXSYsY1fXSo9zWda6KkMF?=
 =?us-ascii?Q?K4au0ufaLPUTRQwHIhUbtv3Dz18vOqGgQ0/fazrzfwDY+wJ7V0dBaRFGHJXr?=
 =?us-ascii?Q?e127hKi/4mm0Ubhp8/T57iQyN++wADGzeg2TcUir/O8R6b0qXXMYnggcDyNV?=
 =?us-ascii?Q?zLD1yW2Hvvx8DYb2ivrVUIMgruqI3BV863NlvXaLXV7lIrT4kFMUhdMGEiCg?=
 =?us-ascii?Q?uWGA9m/wI071hPySGZBdtUisJUQG6WjGnDxlUeqHo4lSXq4Ldl+GBanDj+tj?=
 =?us-ascii?Q?GMTamQJvn3erxwbQZCAeELf3QCTuZudCPcA+fa+RRgeonoCPIxWUmtVRskHc?=
 =?us-ascii?Q?deESufV9iRV+1FtgA0JYESo3NeJDkkyGv64TFwjIJ83/HUfrmv0S+xTGldih?=
 =?us-ascii?Q?RjLWfPZ4OVul3gMwpbAKTFqhH/pG/uLpQ335TumAQNkzelLHz1emDSXm2tfA?=
 =?us-ascii?Q?dV5PdJ5jSmqud901icuUtfIvQcE5VQmwqGquXLHY9ctGf4UIa8h3QnZwSV9z?=
 =?us-ascii?Q?zEHQty2LZ9KsZwfkvo5+/LPNOcZ3N5N6axnabVjBCVFkx8qJcBrxZuRoLRGd?=
 =?us-ascii?Q?lvgNyCcVDtlAvpewSatTd3sMzccZ5sjHWqR1FPF3i1pliXx1XVdbePw0Ed+r?=
 =?us-ascii?Q?irPCtL66Pw6ITDPeSR+9xZybUOYa8yh2juH9rDb/1gy/F9x1eLN5Y1txFINI?=
 =?us-ascii?Q?poe/ehN/iecmWtlVJV9zeZOV0IW4Tar0XcudvKdocg7KlmzDMKKXX5i/uAf1?=
 =?us-ascii?Q?q3Fdv0WzaAcqSlXtobk8vY+sNwynPw9QlcX0yxZwTQ0NUK4g4hxPZ+2+WWTj?=
 =?us-ascii?Q?dIRFcmy+LpT67nffuuyL+NurwZFfNCkSWv4Ksox0sUGy0gGtPHPB0vbFDdp2?=
 =?us-ascii?Q?DcYYwp30Mv7gdn+xuDtKVU6rmXYtCoZlSR+1k68HdD7tg2CJaub+gEXxZuee?=
 =?us-ascii?Q?AY8hyhhwzSWtIE8iKT6YnpVmtjNSQGtxKWpO4pFJAGhuXBInmqloUB+2vfgM?=
 =?us-ascii?Q?0NDrNkEWQP7mFjN3d7xg63/hvpEwHRTC9V8cJSaufTdE+S67iLcOhpcLgzxx?=
 =?us-ascii?Q?UPaSaL+TcfvHNbPinCR5mmBaWD6H6x9LPZ8jiaN/jFeQFoqUTod8LO4K3VxJ?=
 =?us-ascii?Q?wR/3pfx4/2tcbgSjVyxS/cDIpkJ7WKqUSQPnkGZXXjWuXfIqltk9ve74tIZU?=
 =?us-ascii?Q?zvVNlotB3Kh+STvCZOa9L0ELTo5Vwv95prOcEmRuS96lPQQfqq7gcBirNBPA?=
 =?us-ascii?Q?VPXGZf/hvKq/++kOT35v5LEnqM9PilES3RjhwEsmetRvs8He7yxPsdZr2k9S?=
 =?us-ascii?Q?pRKrwbSqiqf/fN9NmbX/TOtGR6Ywf2FLuPgjmZRWbgaPnoiqq+W5Z0U/o5ry?=
 =?us-ascii?Q?RBR2Em2wqSfzhHU7T7I95ZL4m0Se1KL2pmmPdMJgGJMUwCyPERJR/gb+o+Aw?=
 =?us-ascii?Q?o9+BOJOb968ZTR/i7Oj/EIoLzxLhJ92kvIxhx0+x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befa00e1-d83f-444c-d9a1-08dd18fdcb0c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:34:07.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNW/CpAVbrYIeoyPpFxqnm6wRX6VZiZ+u0dfeN0BCTYpfgoguYmeWvkdRDG25+onHnlZRMLgkUVclub6yyyIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10513

From: Ming Qian <ming.qian@nxp.com>

For format H264 and HEVC, the firmware can report the parsed profile idc
and level idc to driver, the information may be useful.
Implement the H264 and HEVC profile and level control to report them.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
v2
-- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE

 drivers/media/platform/amphion/vdec.c        | 61 +++++++++++++
 drivers/media/platform/amphion/vpu_defs.h    |  1 +
 drivers/media/platform/amphion/vpu_helpers.c | 93 ++++++++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h |  5 ++
 drivers/media/platform/amphion/vpu_malone.c  |  3 +-
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index ca8f7319503a..61d5598ee6a1 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
 			  0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+			       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+			       ~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
+
 	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
 				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
 	if (ctrl)
@@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_inst *inst)
 	}
 }
 
+static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler, id);
+
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, val);
+}
+
+static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
+{
+	switch (inst->out_format.pixfmt) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_H264_MVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				      vpu_get_h264_v4l2_profile(hdr->profile_idc));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				      vpu_get_h264_v4l2_level(hdr->level_idc));
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+				      vpu_get_hevc_v4l2_profile(hdr->profile_idc));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+				      vpu_get_hevc_v4l2_level(hdr->level_idc));
+		break;
+	default:
+		return;
+	}
+}
+
 static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
 	vdec_init_crop(inst);
 	vdec_init_mbi(inst);
 	vdec_init_dcp(inst);
+	vdec_update_v4l2_profile_level(inst, hdr);
 	if (!vdec->seq_hdr_found) {
 		vdec->seq_tag = vdec->codec_info.tag;
 		if (vdec->is_source_changed) {
diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
index 428d988cf2f7..606f9d61a265 100644
--- a/drivers/media/platform/amphion/vpu_defs.h
+++ b/drivers/media/platform/amphion/vpu_defs.h
@@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
 	u32 decoded_height;
 	struct v4l2_fract frame_rate;
 	u32 dsp_asp_ratio;
+	u32 profile_idc;
 	u32 level_idc;
 	u32 bit_depth_luma;
 	u32 bit_depth_chroma;
diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
index d12310af9ebc..108b75ceb4ae 100644
--- a/drivers/media/platform/amphion/vpu_helpers.c
+++ b/drivers/media/platform/amphion/vpu_helpers.c
@@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_codec_state state)
 	}
 	return "<unknown>";
 }
+
+struct codec_id_mapping {
+	u32 id;
+	u32 v4l2_id;
+};
+
+static struct codec_id_mapping h264_profiles[] = {
+	{66,  V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
+	{77,  V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
+	{88,  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
+	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
+	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
+	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
+};
+
+static struct codec_id_mapping h264_levels[] = {
+	{10,  V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
+	{9,   V4L2_MPEG_VIDEO_H264_LEVEL_1B},
+	{11,  V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
+	{12,  V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
+	{13,  V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
+	{20,  V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
+	{21,  V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
+	{22,  V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
+	{30,  V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
+	{31,  V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
+	{32,  V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
+	{40,  V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
+	{41,  V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
+	{42,  V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
+	{50,  V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
+	{51,  V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
+	{52,  V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
+	{60,  V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
+	{61,  V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
+	{62,  V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
+};
+
+static struct codec_id_mapping hevc_profiles[] = {
+	{1,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
+	{2,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
+};
+
+static struct codec_id_mapping hevc_levels[] = {
+	{30,  V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
+	{60,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
+	{63,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
+	{90,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
+	{93,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
+	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
+	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
+	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
+	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
+	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
+	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
+	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
+	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
+};
+
+static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 array_sz)
+{
+	u32 i;
+
+	if (!array || !array_sz)
+		return 0;
+
+	for (i = 0; i < array_sz; i++) {
+		if (id == array[i].id)
+			return array[i].v4l2_id;
+	}
+
+	return 0;
+}
+
+u32 vpu_get_h264_v4l2_profile(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_profiles));
+}
+
+u32 vpu_get_h264_v4l2_level(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_levels));
+}
+
+u32 vpu_get_hevc_v4l2_profile(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
+}
+
+u32 vpu_get_hevc_v4l2_level(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_levels));
+}
diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
index 0eaddb07190d..dc5fb1ca2d33 100644
--- a/drivers/media/platform/amphion/vpu_helpers.h
+++ b/drivers/media/platform/amphion/vpu_helpers.h
@@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfu
 
 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
+
+u32 vpu_get_h264_v4l2_profile(u32 idc);
+u32 vpu_get_h264_v4l2_level(u32 idc);
+u32 vpu_get_hevc_v4l2_profile(u32 idc);
+u32 vpu_get_hevc_v4l2_level(u32 idc);
 #endif
diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 4769c053c6c2..5c6b2a841b6f 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
 	info->frame_rate.numerator = 1000;
 	info->frame_rate.denominator = pkt->data[8];
 	info->dsp_asp_ratio = pkt->data[9];
-	info->level_idc = pkt->data[10];
+	info->profile_idc = (pkt->data[10] >> 8) & 0xff;
+	info->level_idc = pkt->data[10] & 0xff;
 	info->bit_depth_luma = pkt->data[13];
 	info->bit_depth_chroma = pkt->data[14];
 	info->chroma_fmt = pkt->data[15];
-- 
2.43.0-rc1


