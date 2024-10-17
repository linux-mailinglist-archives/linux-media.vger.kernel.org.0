Return-Path: <linux-media+bounces-19786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA539A1E27
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412C11C20825
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F031DA60D;
	Thu, 17 Oct 2024 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JHRrSPob"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ADF1DA11B;
	Thu, 17 Oct 2024 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156850; cv=fail; b=TxD0Aji9/X9j256Q0HFXxeMwKYfdB6CbKO01KFVE13IC0X3rx6SnpIU+uRxAvTDMklrZx9+A3Mfh4UqyZzBSD3RimQreeZwR++Bf3AaRpgn2pnTC8MKM4teD2IUewE97GmFLDg7hy+gu5A6ng+hIA98IWLe9+xjFJ5D4FHE6Imk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156850; c=relaxed/simple;
	bh=grNxK6bOjE/M1Bn/EmCnn82k2c49+V5f2Zozke7dm38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nEPcm9BTxMb3H764eX1KPRX7pVd/0SBGmJHq1HPcGJAzX9ptUKp1sDSDBPGXNVstSpYgEI0J82QuXUCV12B37KuOV9Id67BUgiSZSy5wRQ945LntOemJyZGaR/hZQ+ASbp02IZTAh+Kew8hVyqX+JALeV/AlClXYR1Y8bb+tNls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JHRrSPob; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/5kNGgEBynLkVAlshHlrHUXaiDBRMX9XnhVfp4s6yw+uCQEJ1GmLLSO3t/kn0+VPAGHImURcLHxAgz5kuLmnknv1yUuxppagulM4fS3yK4YcUuznQMCHeiAZlZRR08GvT8N6beRn3mRCGcXbNAZ/o0zMvrKXKM0YtEy31ewqs3YBrB17SJ/yCHPWAqgW8rbSDdI9kfQzhOcX2aRIpOqXDaLvKCNjzV+ZWLfV7FV81ns+Oj8eV8MzglMuk+/Mc3af7zSpPvYV+hvRmG7GFBsBrO6X58fg/YiwrM59/dLTlpWtH1vr+4keOVhduhm0F0Ejve1ZLRoAkC+dkwHRBkIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M9OnD4p2ZXsp5igVRuYNX2PmQ2vcvmplBNzS4uaMBw=;
 b=nXvIhik7A+juNad7CodL9zpQuQ6UzHLBqQQcCrluIrTrbWNyMq8RJ6fYRl6MMForbftbGKFj/ItJBA0Y+isQ55zlPp85BiPgVCEl4l19kCPVtA8ERGmLIA1yYRFyQ3Nk8+zxVjeT2kEzYOEb+b3w87Ba8inPfUY68ptJzVIAf2x86faU4HcgLO5PYdzkyvDYUWHvMW0Tl7xMXSWsyB7r61dsYGBZ0C3NAGeieXxNhF1jUIGTEPQ8eYXycz4RS6OJhlnLh6A1ystg+lEitG1xJ3dJ0CFtpkA2Dh4gZtI53bycIVW5NaK5r/9IhLGe4R9ia22wkd8gBtYh/GtP8+VJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M9OnD4p2ZXsp5igVRuYNX2PmQ2vcvmplBNzS4uaMBw=;
 b=JHRrSPobddqrTEUde2YoRG+CM8MOizvS23qGc05ju57HUjcF8J/PMp76cOax+n5rCHTCag7/CCOBPvlabpN4VsGWaOtKzcLp1fzdBiMGg/ulH2FzEVx4aWVv0rxxkrlCruH4Of50/dasl9emVxqWf5bZs0P3+Uiax2xytts6XEgyWdG8/3kvpq8Pu4nRC/hSvnZcC0br1DZl1W4hhBJ81MmDyi2HL07HFunbb/Zx+whKoArdZVsKyXDX2Ujys/oqYvpLbPaiw/m7BRxsyaj7/cya++NLCq1dxfIIc0YmfcIljSsWByYNLLbPcNAJVngrvKxBHxceaoMBJc1r0b2RDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:20:44 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:20:44 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
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
Subject: [RFC 4/6] media: v4l2-ctrls: Add V4L2_CTRL_TYPE_REGION
Date: Thu, 17 Oct 2024 18:19:49 +0900
Message-ID: <20241017091951.2160314-5-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241017091951.2160314-1-ming.qian@nxp.com>
References: <20241017091951.2160314-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acd3eb8-8114-4458-e9eb-08dcee8cfa3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5SdIVau/c2W9oZ/uCjB7l5nMUa13mMF55usJPYPXysXa8OlT6uqKrES22QK?=
 =?us-ascii?Q?xAPWZjj3fpSucfDMNOX/VJAuWG+qFZCx5m6y5f2XCm3r/Xh2X/L0ma7KlaWB?=
 =?us-ascii?Q?funF7HuMKRamsKOi4265ycRycvx7lSgNMsAi2GO+sm5gwQ8RqhEhoH4g58Fy?=
 =?us-ascii?Q?Z3kOmvsFVk4CF25cd5/2FaZSq6t9FuTso0WFt/1G3KFZYM1bORKpBw5Csnue?=
 =?us-ascii?Q?X08AfvfzbtWQZq3cZm+Q4E4n1dz1BQ0SyIIiVuCeKJxawPQ8FleBF2YnXF3u?=
 =?us-ascii?Q?ni3jhH3BmBkvcv/OTTkwSYuiZxUcqVl8WZiMi6oHOXHiO9uLxrn0vt8edIo9?=
 =?us-ascii?Q?gLZYQg96c0N5qlEO/ZEkzHm7Gp0gqdjSnhdTyh2r0Op1oifrwNfjXywxKFwl?=
 =?us-ascii?Q?7zQhhpF1NwEw1ye81tC7GbmIHlgw5TrvhETVSGRNjG+xZM0pfnRP2lugoUao?=
 =?us-ascii?Q?VJ5llCt4N8jFyHiGlO1gq2cnC23/gadqRzJr2dDvKgc5BctlLIXjinunopsa?=
 =?us-ascii?Q?CFuCxpHzIEJHSfplapkgsUVPBX1O/MsRFEu9InHDYQaaW05EcctLeZHIA0cQ?=
 =?us-ascii?Q?JfSFlFSPoXeNk4EA9FnfNmuBAoFkoL8oXIp6LiZHlSguCr8tnPsJGugjvdXJ?=
 =?us-ascii?Q?oP1sIAg0vK8xMMcJRTaW9zF4P/HViviq4Y7IYMbOg9lvgbeqZgTguiuTJ5f7?=
 =?us-ascii?Q?q5+HNP9VNrsHI5eg0Q9oWeOlaLWqIRgmEGmDa5wxuhMAzCV8cxTEpS6YvU/z?=
 =?us-ascii?Q?0V5+m/+N9xyOJYP9QosO3aXN5MRnH96R5iKjFKBIcNeL+lHtGF2skg4ZmDda?=
 =?us-ascii?Q?lnuosnMRCAKsxCjG5/vlI8EwYX7FB6PuzxYI96m+2YAL3oc/3WoK1aaYxKHm?=
 =?us-ascii?Q?EYflyLT+fCwOQ6LkxyGEG55mtTZl+DR4acobcvBTMXF+bogysl94uhKJRq7d?=
 =?us-ascii?Q?I9I3EhdgOYKwVaFEannyJ/Y2Clhz811RIXGRKvy/8weDkTaDgta9Vrz2yRGZ?=
 =?us-ascii?Q?ve5iE6KBAfjGXPQ/gBXw7t9W0aQu/p4NxPZgO2BTAZG0R+ccvlerYrcqWZIt?=
 =?us-ascii?Q?TYeC+h64I8SXLIpMuea7CiQnpx9AxD+sSBOY/8EzlcnxZZq70KUEmMghkvNx?=
 =?us-ascii?Q?A4sWw4/T+qlSvFpfpSaVviCqmBAeaUt3UKjdLd668KdPWpdIGQH4lzAZNH+i?=
 =?us-ascii?Q?UbOO/uJASADTeWoaHppZ5FNtaI3zVx0U1A5laC3sxsh1J+8jurQh0tczSSKA?=
 =?us-ascii?Q?3EM+RFb19y7kfdP44O2zE7pTwMgso//FKAMmnSrswdB/Tfp+fJw4uqmAxNaa?=
 =?us-ascii?Q?lOGhkKD2Ap+9i28ERVYH7UGUlWcOxFhSwdCZZEAC14ss+hBM1SwyMb7YnTIf?=
 =?us-ascii?Q?TVUFzBw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n4CJh+MGEvGa+Gvqtw/u21fJAUgknpEQ7dW8A4Lb9xHmUWZ51GSudzcC8o7J?=
 =?us-ascii?Q?QsIeavrImC/BIpfTE7WT5TiOwh42X4lBpjTikmY6OEeRq2v1da1uQbyxuy5p?=
 =?us-ascii?Q?8E1OaVfKslgVY4jcwWt4iQUs7gRgWEhjdb2rXUyDISDpI8WJUnVNY+icPlvk?=
 =?us-ascii?Q?qJnfl5wNqPIbQz7Jye6xtu7NTJcixM0PmkGHUpyYb2H8ul6JOUtljbtMjj9c?=
 =?us-ascii?Q?KRjJDkWqPHWgq1qv2pTEHXqrL7+ed7mc3A46K0v5Zi1r1/INvUrUaMycmoVM?=
 =?us-ascii?Q?Wzjiu8a7k8BY3xM5wq55EYt1AJA4WZK8INdwFTAb/FzodFgD9kzcsAuDEvdX?=
 =?us-ascii?Q?LChZolB2DuILwuSq3Fb8/eddPft44Q3q6SXlqayNUrDu681Dc0yepd3EhkTX?=
 =?us-ascii?Q?s9Xal7jLI1hQrOxTR1X42ljT71t8FGVOxzh9ZZ6Vywews0mJ1Ysj+QAH1akr?=
 =?us-ascii?Q?t34YmS40bmESPfqbOOzcmdILBr/00GIrEtq6sjfiCfwPbdd9iJIdoVcHnQAL?=
 =?us-ascii?Q?L4PBqivMs+OADwucXaYIdWdicc0vK6FKL1Xmn2+MIUO/a6NY5veQLVV4Iuqj?=
 =?us-ascii?Q?KXcnkM9HK+26gxc9YPoNGKmS1BdUs+tBe5MGqBZMRLss1qZZU6QYbdnfUZrV?=
 =?us-ascii?Q?J9zJak16Ncr5hrbYPewljYwKD1C0OXGKJlKP01FKcGH2GZdYNmT8A+m2p3zO?=
 =?us-ascii?Q?BBMD2wH95hlwZe8jswFz3qtE9hy3Na6A9tpeS+fXkmFeMsBHvHEuombV61fO?=
 =?us-ascii?Q?8WgESiIDmNeoz/rWs0zNSgmOK2EKB7ByhTLq3rbzljV6ARH+k+SR3a/WJuDR?=
 =?us-ascii?Q?ig5rXfgaNlKHPC7q3ADfuR6owWXz05mCiWWZSmlpJsgeO2qOCsIlm/vaY/p9?=
 =?us-ascii?Q?Pvu6KXp5PH0gH2r6NlaTYKSODg+GHGXEoEnSiyj+0Ecd7Rx4mNHJLTKmHezC?=
 =?us-ascii?Q?a19if4HCOkGC5WOZVqRQRQyxVWjMIM9IDAzcU3d/SlMedGzr4j0qQs+pMQ30?=
 =?us-ascii?Q?QpQIHmP4+tVFFEEU5H7a9csBn/Yd6AD8aBaNFvWGSOdrK6H3Ybk2lGJsFdzX?=
 =?us-ascii?Q?g1STHuDJVPVGYTEquTLarZr9kRAkFFCAHR0pJDuMAUpPYC2DWxZlCorM+3S5?=
 =?us-ascii?Q?N5p873VK0fnctnj9EOsi8bAfZO2/bjGG2dgG8jmSrvhLsfiW1vOOO/OsRzwe?=
 =?us-ascii?Q?HQ+E1j/xwROMt8XoB5hgtQ8TnV9TyyjofV4tSw4h11dZW5dRPYQyaqs0Vmq7?=
 =?us-ascii?Q?LIDF6xF+JzF6TI+wfwQV4DRG3VWR99oCEehOwqMwMf+gw4oo9LsmnUoKTLO9?=
 =?us-ascii?Q?ucebevmG8D80OFpjV0VkM+vMKOukdngaIod6k1T9sEHuexOfSSQHwn3b0YC2?=
 =?us-ascii?Q?tLjOuMGYpL0jWZVQ/XMxDWnGv01OKrBoLSfQU8GcBit1mNLdj7UIHgAsMEoN?=
 =?us-ascii?Q?ijEZ/ySErcooJLrmvNULNyhghS86KXrG1XBVzsJKnuXgjgn9aFwB/G3ibYJ1?=
 =?us-ascii?Q?hrgA3EgdLavibso4vz9fMTRQLdUApkJzmUn6IjkZiUH9+xSkjgMKktQ0hIS3?=
 =?us-ascii?Q?rAQsymYqkU8CNZ59U6T6qwBqjrLkTfsa9y62zowH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acd3eb8-8114-4458-e9eb-08dcee8cfa3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:20:44.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0n92O3FYS7HLp8EpNr8AuK+h+VQfDPVoVzic/UzyBQ+x73icM5LPl3pXUXNWu9j39xEoOtdEiUJ/a/vJcaPQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

Add p_region to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   | 12 ++++++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 14 +++++++++++++-
 include/media/v4l2-ctrls.h                         |  2 ++
 include/uapi/linux/videodev2.h                     |  8 ++++++++
 6 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..f00c6d1f7784 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -203,6 +203,10 @@ still cause this situation.
       - ``p_rect``
       - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_RECT``.
+    * - struct :c:type:`v4l2_ctrl_video_region_param` *
+      - ``p_region``
+      - A pointer to a struct :c:type:`v4l2_ctrl_video_region_param`. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_REGION``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 3815732f6a9b..df3cd36b67ab 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -451,6 +451,18 @@ See also the examples in :ref:`control`.
 	``V4L2_CTRL_WHICH_MAX_VAL`` is optional and depends on the
 	``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the documentation of
 	the specific control on how to interpret the minimum and maximum values.
+    * - ``V4L2_CTRL_TYPE_REGION``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_video_region_param`, containing a rectangle
+	described by the position of its top-left corner, the width and the height.
+	And a parameter for detailed purpose, for example, it's QP offset for video
+	encoder ROI. Units depend on the use case. Support for
+	``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` is optional and
+	depends on the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the
+	documentation of the specific control on how to interpret the minimum and
+	maximum values.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 35d3456cc812..22307e029883 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -151,6 +151,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_REGION :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 9642a1f242e3..8235e681acb1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -441,6 +441,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 			ptr.p_rect->width, ptr.p_rect->height,
 			ptr.p_rect->left, ptr.p_rect->top);
 		break;
+	case V4L2_CTRL_TYPE_REGION:
+		pr_cont("%ux%u@%dx%d, %d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top, ptr.p_region->parameter);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -886,6 +891,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
 	struct v4l2_rect *rect;
+	struct v4l2_ctrl_video_region_param *p_region;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1248,7 +1254,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!rect->width || !rect->height)
 			return -EINVAL;
 		break;
-
+	case V4L2_CTRL_TYPE_REGION:
+		p_region = p;
+		zero_reserved(*p_region);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1957,6 +1966,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_RECT:
 		elem_size = sizeof(struct v4l2_rect);
 		break;
+	case V4L2_CTRL_TYPE_REGION:
+		elem_size = sizeof(struct v4l2_ctrl_video_region_param);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 9ed7be1e696f..299451b33e7f 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -57,6 +57,7 @@ struct video_device;
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
  * @p_rect:			Pointer to a rectangle.
+ * @p_region:			Pointer to a video region
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -91,6 +92,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 	struct v4l2_rect *p_rect;
+	struct v4l2_ctrl_video_region_param *p_region;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4007041302d3..503cbb884734 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -448,6 +448,12 @@ struct v4l2_area {
 	__u32   height;
 };
 
+struct v4l2_ctrl_video_region_param {
+	struct v4l2_rect rect;
+	__s32 parameter;
+	__u32 reserved[2];
+};
+
 /**
   * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
   *
@@ -1858,6 +1864,7 @@ struct v4l2_ext_control {
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
 		struct v4l2_rect __user *p_rect;
+		struct v4l2_ctrl_video_region_param __user *p_region;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1931,6 +1938,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
+	V4L2_CTRL_TYPE_REGION        = 0x0108,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.43.0-rc1


