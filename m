Return-Path: <linux-media+bounces-19819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF9A9A3462
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 101121F2408B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD08917E010;
	Fri, 18 Oct 2024 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ff1RSGWi"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5617B50A;
	Fri, 18 Oct 2024 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230334; cv=fail; b=P3Oy66Fwqt1FkW8dffvvcn0RdWJ2l0gQaiJmNQEeDOUjgYWqmVELOg9SAWt2rH8p4fWynmemiNqgJsmiJwsDBa+vCPXbH6egSRvnBIwMQpfhkBKSZ9/M5p8OtxzhrqwqLZ6tdabzclxhC5aQcpD/r+bxLnTHaFD0QEfqtJuwitU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230334; c=relaxed/simple;
	bh=eEIY+eIg/YSUi/78YoKXcW1GY61OT8DPIdwv0d0IZYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UcqvBNCvEgO1XTtJcoxR3SS36QznAviyFV82QDEO5+ua0Klj7ShUYhtIGzNl4pXROwHtvWeW0Tw6Hl3pz/2uK5TkRDHpEJfmtyO4O1rsDv9W5rO7veUrbl6WqcQnArF9dkBHr9GZUr17anYKXzdS5E3wrXdkxSR1eomr/xkuJjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ff1RSGWi; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ/i2J9jwlzOYzgXrfyWUtHJpX56EjA50ufAFzL2evswHFlvSFBwoSzD3vfikRfW40WUjUhj8Q0Q2KBkEJrwuNMt6FWm7Ypgzc2NrRLJT+2VyGajTM83CdH7GlLavkQEIN3fUcgH42jKPSK+kmArDig5EEDzhvRpo9LvUFxlbBKwcr8jJdVrgY6ql94ZgRUOzKhjF7eyHvpYtHTIsfTKiE4scZItgV7qocXNxjoBX683ugypHmBDFA3Vgos2p38SnKCw27H/dwXn4APc7zHpXTKDAAHgYLjB9UCImIeeJcvvFHSNe6KtNXAd8O3+s2W1vxk6trhiy2n8GOM57VGqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAK5fhxZzM/TuoFldoTn4hT+Xpwz+9b4vQrEcZaryiI=;
 b=GlyiRzh/3ihpEBXSlF2+tkkXxa2dym+jUAboQFUTmTC0QhAJLiGyW8NAKz5tFPQA85sWpl0uEejMW09OgtfNMgClI0xcv/Q/GE5Iz9FKJRQKVu0Nt2GdbRClT2uF1pdhRtf3sAYWmNCDdU+02QNAavEoIQFz4auSXls2IWU9H/G9t2bwu5WLXqdiWVHgQE4xZkEFCY2HSVMeQmpSNoHFFa47IIL2bIoABUByNHFzTgv6aCwQy8fsLN3a4VxPw6tCZOZdi9LklafRehE55BjL/QJFcC2kNGw96KVBV8TaFOL48zOtHiVu9AmM73ygDvPFhm/8gw/iMpIbLZlD2jAbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAK5fhxZzM/TuoFldoTn4hT+Xpwz+9b4vQrEcZaryiI=;
 b=ff1RSGWiuL6Te5ZLW87wUPrq7fvjFDv5xp4Jksiprn2bOP9/GjK3s7SX49LbKOqg6zTDMry+SeI/QP+Ns1PDWHkLXunkHqxHrBEs33VueaZnZfUdyON+0ptWyjXEdY0spHXnmwh2dMIHkPG4pvD6+SHkq5yORihBhvgxDRBIdB+SriHc/WYRJ1zdnX10NTocVh3Yy+DkYG85Cohb/f4C5iTGtrRulylH+oxizFdoqQkoVKLtMXvHK8phhVjvoxRC+4cO4Gy7WNASEoJ637g7r2krGIYs5sWMhABzy97ZRqnZYv9ukFB+kc1tDj0E9z37yElQU36K9TdMsQISuzES2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 05:45:28 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:28 +0000
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
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v2 1/6] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Date: Fri, 18 Oct 2024 14:44:43 +0900
Message-ID: <20241018054448.3190423-2-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241018054448.3190423-1-ming.qian@nxp.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e66f146-675e-4eb1-62bf-08dcef3811e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9K8X8m80kXHxG9u74PuBW91Dy8J7lJcdY+TDixzCi/QX3KAOO+zRKFpDezVc?=
 =?us-ascii?Q?7q7DgbHtxyvRc+eKrmyff1JC09Sq8sH7UDxTFDyray+yCXTAo7ixQvWOAvSn?=
 =?us-ascii?Q?HCWJDmHmTMGq6BaQPLGuNpJu2JQFF+PsfsLhuMZXBh81rhP2G+gARdN3B+Cz?=
 =?us-ascii?Q?NErLg2omHdsXLhV2S9b3TIUbk01cwTLabOb7AtipgDNr5d1X9FH3mRKZ7KJT?=
 =?us-ascii?Q?kTSGi6e0O0NjYPdk0AmH04j4Pn1367Xbb50PxcG7yZttsMIdizWLk7bo0nAs?=
 =?us-ascii?Q?FP+sCVjL6w4vXl52xXcCa+/T4qnR/QQ/RFlzAR4UEQDJhheJ5/I2eZhn2Ud0?=
 =?us-ascii?Q?sbx/fRIdvCgrTL1yctQNsglwaAIT5kqHLmTtTYG6uwfsSfR6OoQhaFB5Ff10?=
 =?us-ascii?Q?ohuqwQEniMl02w67ssUVB5VHJuX7nE2b4amFuQv7LgvckTRUbbE/ZkBk6x/H?=
 =?us-ascii?Q?HBovZbTTzRzkcsnoCOZKwdDUxqYdxJA9vfOfytipgXJ5WTijKR3Ub5vbmAuN?=
 =?us-ascii?Q?2HEmPHmmKJjDMZaoNSgrJdPQhqSt05cGydcxkpECEsZ+p948/8bPMTg7KRz4?=
 =?us-ascii?Q?3PLe+tCuZ2eNarzgDV/PZIoAOuzwDK1zuCsnFJh6wzWLCW4P4tmiIP+jvTAA?=
 =?us-ascii?Q?LvLAZ6ztDwZn7e1mc342CcpJycktgKm3g1YGNnC8kHb19tjQ6yNqkpXWjlZs?=
 =?us-ascii?Q?Pszqp99RPOL7aB0sfX/4eUCyBkmQ7VOocWRKd938xtXeQqj8a2B6j9PDlGsy?=
 =?us-ascii?Q?shepk6NVa+oMRkt+s+Fxtbmkjx1PdCEgwBsJuj02XhDazKFReCmBx4VnC3RI?=
 =?us-ascii?Q?wdbd0yX3NvvrAaiJKcgx3HN2Nk0JAKCDuCwWAaVDhYJNt+Jtbfs/xjG0ZaTV?=
 =?us-ascii?Q?nT4ra2OpnMdcd5rP8XgtgKJMMD6rIiNE6+utYFl6ETrnfa9lOisaqhcGr9Hy?=
 =?us-ascii?Q?S/yFU2Y6QWET3o/mCpZOVNdHtAMeI6o2qQfyr4v3xFz3TkxZBlbZQmNF2YM8?=
 =?us-ascii?Q?n6r2z8cGcWdTb/XKJAnDimC0ejRIuKYq1jtb2PoMq69ehXnN+BDL+aBXdBMs?=
 =?us-ascii?Q?Tu0t16XdHXMV1bPYWsyCgOFWC38s+O+RQpF6U0Hjmq1t128YWOj25TDvnSsc?=
 =?us-ascii?Q?zIebt7LUD30fCJVDb6kLq3rlUv+D7s6N0l+h3+vEc/nwz4SOuYxd6IVoxPTD?=
 =?us-ascii?Q?Ds8f4UssKAbL9aj4oGxtnrElM7jkOK9udg4XlhRdIakLZfsfWNUH+twGS5/Y?=
 =?us-ascii?Q?KpXmy5QzjPjUx+jq5wHDlTkgS7AGfmOt0GJ2pB1wHSbeORnv8pTSBl517Mqh?=
 =?us-ascii?Q?H3FWyqqzPdR/Zm4uQSmUq3/2Ql+Yi3HHY1GH856aUnFkOETq4Mv/tYAmM08s?=
 =?us-ascii?Q?r5bq7zQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+DRhV38qRprBFsyh8MlXCvwGoBmvv/3sSRBYYzbD+hwyUX5syp2hn9H27bfB?=
 =?us-ascii?Q?yFL3cZDYUO0Cxitb1YyjycmdxOMO5xhKbrp0hatrsLeixCtAVPGK/DQPB9r9?=
 =?us-ascii?Q?xPkA6RnqfcLlK1XPphtahWs7VY33BYaGda0rSDx3MGej1c71gIf2ZF06Pk7T?=
 =?us-ascii?Q?FX7d67YbU+AXCY7QKANPyt4yXbR4DH0j4ZZlnd1R5744mFwcHN+k7VhzVJRO?=
 =?us-ascii?Q?lPnQikbTc/k2Icc0CpP14LhZXgaxPJGQd46VAWtuRv4Vy7n9WaqUH/Uj0uE7?=
 =?us-ascii?Q?rkdVhzA97Zh3yY6Qf2Y7vWRe/qwcHPDwO4DKX+5SXVd2BxlDP0WEfQlMl7Mq?=
 =?us-ascii?Q?xbBE8QANnncYLBL5riwnQD1/AwAH8T+9WRXqBNLLiSZ1S4Z0EOGgJ/Xbyddb?=
 =?us-ascii?Q?KubOl4A5OBOBSaxQl/ZjjyOibHp3NsQ3+JY8uEZqfaUxRr2QQ+qLTniNwu/+?=
 =?us-ascii?Q?K7BxeL2ShFhZfGU1BIfEolmM4UEZsRsKM0Uvs2Q7GjSGRlLGqZj6j6An8Ggu?=
 =?us-ascii?Q?kBmpt5Ga/zHYTYH05ODSBmV3kZm8OApcMG6KvKWlYfJfqAS36o4fdDnFZjyD?=
 =?us-ascii?Q?mlNPlNO1cpUTdvjP5K98B9haU21nMHzL0MTomf7SQ+0Ysnd4gL3V+zqiSLM9?=
 =?us-ascii?Q?jiOaebHmH2f9G+WeqyNSbHJ/co9PdvFakZmFUauiwf+FlDhbcnZJfRQn8IjF?=
 =?us-ascii?Q?JMmzJftbfKM+Mxkx7HSeBKR2ss6UvrH9S1gJ4wUlTExSyUG8MCdLZ2lZezaH?=
 =?us-ascii?Q?JMse/Cu5JMPFsCR8xrRKJhHmGF9CI4zhM42R3sIZfFhwz1pGqyA5F0Zsvv9z?=
 =?us-ascii?Q?b2XjrA9wlDYJo3GN//9md97Fbb9ZrTpTc08Q0YjhAanYQ74vxEueZXTS4RT/?=
 =?us-ascii?Q?/Vl8HNTUqyhPTBkqW2sATVKbgTHv6Bgd6h6oSr5zhHamlf6zWLCb9hvsKXVV?=
 =?us-ascii?Q?e52lqKyraLWOwEDV3OaJtxzwVuoRfRdUmgOQiJZLdqMJSsdCCBsguei/1Uqz?=
 =?us-ascii?Q?cTjDQoOtmqDcIvmUrJPJkB4McJEIlqn7dsVsvRCH+Esw4E4kSgoqdPU1SDSl?=
 =?us-ascii?Q?0dJKCtckg3oE5CLQ9D58FSazxdj1hozlYiMjTMkl+cHF4izSddWjxGJFTkn0?=
 =?us-ascii?Q?r5SosLtcYPSuMRhpRUOnQnYqAmyC44Dt1TRXaJETBYpb+LBnx5ozyo446Coj?=
 =?us-ascii?Q?wnwY9w2mMyrR3qxopK+Mo45+l8jQXlZE7h0rRQv0ByQm+v7MpTBqx2nhDJZo?=
 =?us-ascii?Q?cp28QMfEzXmUjCji8n1wDp8fd/H4jwpPdG+NS5CatbA/HzM8aQrf8y+CIv44?=
 =?us-ascii?Q?NvX/xTqa7cFrRj1yYvqJgZpbVThEnNO1fLGoDR0d2Yn5y+1mss8vhzBrJvcc?=
 =?us-ascii?Q?OSSz1znNj/l3kj1PpDwTiLx+IGRzQ1l7SfRWziZOBG7cbU61GeSAWCQUED5W?=
 =?us-ascii?Q?yIwbTk6U0T3+GH3Cle0E/BmRvqQqOYH5FPIPngcbjhm5cnsqVnwG/TzmWx8S?=
 =?us-ascii?Q?3EhOA41EN6+nr3qA00N5awaxmUpzbRaddX5tEuEJxz5HcSNe/XpHLJ91GwGf?=
 =?us-ascii?Q?e96o7RLrSxtW3D3dPjgAJsz7LHwwuLCHcFmSkNlx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e66f146-675e-4eb1-62bf-08dcef3811e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:27.9214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRhnQrqsmq5U8G29FsMrsRSvsKlCeIL8dOkUhAL2H4CfvDo1UWA3VzH6ho0KfUQc+vKqSuE+QaMk+f1eKNfZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

From: Yunke Cao <yunkec@google.com>

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst             |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst |  7 +++++++
 .../media/videodev2.h.rst.exceptions             |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c        | 16 +++++++++++++++-
 include/media/v4l2-ctrls.h                       |  2 ++
 include/uapi/linux/videodev2.h                   |  2 ++
 6 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 4d56c0528ad7..b74a74ac06fc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -199,6 +199,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_rect``
+      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_RECT``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..56d5c8b0b88b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_RECT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
+	the position of its top-left corner, the width and the height. Units
+	depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 429b5cdf05c3..3cf1380b52b0 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..4c8744c8cd96 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -370,7 +370,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
-
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("%ux%u@%dx%d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -815,6 +819,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1172,6 +1177,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		rect = p;
+		if (!rect->width || !rect->height)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1872,6 +1883,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		elem_size = sizeof(struct v4l2_rect);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..b0db167a3ac4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index ded023edac70..4b12322be592 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1857,6 +1857,7 @@ struct v4l2_ext_control {
 		__s32 __user *p_s32;
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1927,6 +1928,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.43.0-rc1


