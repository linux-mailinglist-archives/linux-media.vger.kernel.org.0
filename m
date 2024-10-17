Return-Path: <linux-media+bounces-19783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A39A1E20
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F008284FEB
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEBF1D966A;
	Thu, 17 Oct 2024 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gj2PO2N+"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0CA1D8A0B;
	Thu, 17 Oct 2024 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156836; cv=fail; b=rejmTweBD0iaE0VN+keCtA7bpXWVcdMtN4D2y5AUXTNOuY5L/gXGzJtiUwKnkOCnQjrAgF7T18XB2NFvbtSyN/r/ltXvTDXg0dX3z6lDppiQ7lujGhGo7JQ6Eot3+NHupWDs9Qfu7etXB+8rlca4N9amybvQD1oLgtolbXLhtSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156836; c=relaxed/simple;
	bh=eEIY+eIg/YSUi/78YoKXcW1GY61OT8DPIdwv0d0IZYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J09nOf6epHT3xM5aCHA1/MRGn4VunS9kTQ4P4y48fxkfiDcadJ/H6jbfZCi3Tdk+Lfr3ypeZth3K+Cmc+uQPPrH+Qf7gfg5rK+4zudyTWr8MoBN8DTvTOUlL4A9VdHLFr7YObqlkPcF5zoWY2PFtlwkfwEY6YLKXUAebiQpnI4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gj2PO2N+; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7EGl6PMsf1cXcUpG6q5wvNPUXBRoWcnzuBbSy4bvrE5D5U7MYZS4gTyxXxPuT9dHSXurFfR1iZT7Uv5tcNBh3XQ+7mo9lkGgI4yputiRFI7xtfaA0w8T8KA3djf1TwI1oDpZYVGE76JTj2IlLQITBgxb/yLXzcfwcWXEYE2Da2IXRf7LUquWJvSZDVftEgrttDfDUgJg4N3AHYuyFaWz5kGhkstKNw3H6rPxa0eqCsuBiZvEE6s/u1r8lpPvwo9P6XcwlBSqcI0MdpqaxhmHmBxccUFN9kffbbmUewuTrn+dKcvBAXP6sw139B12bbzKrQsh3MBzVK2d1gFAe0GNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAK5fhxZzM/TuoFldoTn4hT+Xpwz+9b4vQrEcZaryiI=;
 b=DtBJ/sLT5QjG+WThbfqZEzI5qmTPZVKAAVO+eATXjFsp+WHmZFQEScH/lpuvcLWDo/MDIsmYzsM9QjdK/6VOOLmmhppoGr5HL9BD4S6w+unIzp+brGsNhYteKHmiTRv11CKPOz7U5lYb/TT4z4ygwVvVVoUNDsdYPKGHzej+Jb4sZbhneHZPuSo6GiKWavvEj+kTp4PfikCW3Pj9JDnCV++RKpQPKsSqGwE7tRV/wLULtH75WfywhspECgAt/VdtUF2D+xAPtef4GmvdDgUzDU7nAGU9HsOYhX8ApQLNzxXQRidqD093DqLXTixMletM3y068N8x4LMlckq3kFyCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAK5fhxZzM/TuoFldoTn4hT+Xpwz+9b4vQrEcZaryiI=;
 b=Gj2PO2N+TobfghE+90d9YaU6KQ63yaGRqjrw+SlwUZry6tt4BCdyUNE3Ji42bsrFc3jdg7sFMLar2m4oNvpfeGRRyn+8HyRNkZn4FX6EpVpJdnkYdyZmA+5ZGCOrR2+zAEuET74HFE0d7qq8o3L0r0HkcHtxlvpohJ9GWLe88lXOMEOv0rEA+Vl0b+7Az3Kes5nEuFEhHQpi8wnfNCSRRq7VisGeTqKVsX1nXobVVhEN9pxuEFp1B3eM80cqexVTayMW7TQq3Rsfts62hocKVzznVTPjZluzeCXZqkTWlbP/cIWbOTaD0JdhhSerZarsu+M3VwQ3uHnNEqJfL5Tk6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:20:30 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:20:30 +0000
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
Subject: [RFC 1/6] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Date: Thu, 17 Oct 2024 18:19:46 +0900
Message-ID: <20241017091951.2160314-2-ming.qian@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3ad53861-29be-4c69-c672-08dcee8cf1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UpcgBlpKoVGE7bVU4knx7cpOaZ17X89UZ88eRmjERdCLUSPN69rLmWmZKDfr?=
 =?us-ascii?Q?pZoyXYr5yPXUl7BBRyubPbR8C9nEstRRwFj1JBp1hRWgSMQAQTSFXcgC7u4G?=
 =?us-ascii?Q?GvPasI0ACLNEnmZPJn7/ND30gpHwnQOt2HNkv+E8Z8R/TB8CdP0hOH37Zab0?=
 =?us-ascii?Q?KuIoKsbqJzXpmfIeiM5cLtRFRUNjgD3hbbcdG1hK3TjLBfMHeJPCGSMFlg46?=
 =?us-ascii?Q?0g24CauS5HtnybRMxbtq2j4BG9cpn9+F7F6GjomZ5QhEDueSYipk1RWArNA4?=
 =?us-ascii?Q?ueTqmAAU19KexTCHmnLFGYsdJrd/eNKlzaVDp1jnXiymJE/aVAL9JA2Wdk3a?=
 =?us-ascii?Q?jdilojeKj2UbhuU64Nu+A61aTIM7d+fNKJtC9L9TGBA5Td3jB23bxmTR1uO/?=
 =?us-ascii?Q?x0VCOVPM74Le/Nvrm2iUEAiGDWZ/Gr2GBxKFtZFyXr8PzQcifEwIYaKHIvrm?=
 =?us-ascii?Q?cy9k+JrLjoYfaJmDeoOub7q/FKVOn34TrLLr9PM0YhvH4ogwEDS04EZSM7zE?=
 =?us-ascii?Q?vwkD1LgkKGiB9zRyX//LCM+Urew/h0z3Pr1RBepPVcoYn5/qz9aeW7tUFodd?=
 =?us-ascii?Q?y3mjO0YG5KhqVNtnhPg3PLM+CPjJU+J6ktWSYTxom5SqUtVu3N252MduOh/D?=
 =?us-ascii?Q?hoTpxt1tm1hxtwN/yJ/oYHuNlCEmxFqfavdoedqVEnLpDwBp9iysLuCAvqsw?=
 =?us-ascii?Q?+D7JBC3MVsYhmVcxDn4+0Q6QdF5j1OIVSOwtAVV6bxKs4X+IOJPGGwx3HH6X?=
 =?us-ascii?Q?8vH8eAu3zO6wGBCljFV5ZzkyRQTGR89mOyRMj1pAg5dMQvrwY2cMlBtXBICk?=
 =?us-ascii?Q?DWCU9U9LQeIaCpEAhEPyKouoaxwlX1HPRz7Sa2HXWE+QZ5qriPI49WUD4C2E?=
 =?us-ascii?Q?UbJXOHY57ofcOzghUw1kcDTVbpfHY0fpIbx+/mTeQxA1OViiXkq2TcabKKaA?=
 =?us-ascii?Q?ElijNjdu/PzN3MG5DGAwXzTNcxKBJs+qwTYjnu/dPvYHsFiyBou//MxWnwf1?=
 =?us-ascii?Q?6LWUxzn3P7w1EP7oEo1ZIWRfxcvwTSuxJIC8Md2O5mbIaSbAB+SLnv+4fXZ/?=
 =?us-ascii?Q?0I9J3HFfzST4YYxqalLixn7IHcgFP2DWMqQCX7FHJXvPFqL6YDrt75zV9h6h?=
 =?us-ascii?Q?aplNlz1XSMbgeNQC9r7pTMc92jHKRz0cxbDejrI9/SWiM4kNL+18NTXqSvrT?=
 =?us-ascii?Q?p/uWXBAIfCzMbexiUSnnUMD0YIP+26MmqC8fdqlkrZZTGwG52HNJO0u6b3U4?=
 =?us-ascii?Q?8s0BhOqVVboSDJYh1+MECHgDcdwWTztlnlmHFn+oqlyiw/HGzK+AxMfq27ss?=
 =?us-ascii?Q?e3B5RABPBA3LyIJ5DuDUlYTsDVQ/dv+xe4efxz2O16DlfsGIojYbxa9b+bD6?=
 =?us-ascii?Q?o+Qq8+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vvu/aPvKHqZFcQI38notR7o2q/aCU1b/tBeA4sGD2EGk+nJPIyAhkbIFwwck?=
 =?us-ascii?Q?CWxF3FNDZhuddCYeqBp4/rSlV+2hj+Tz360YUN7W12yAjX2Gs8okZDlAHliA?=
 =?us-ascii?Q?HuOgvP8nN18Kywb1nVAke5EvU35YSaoJqqAUaYUFLYOLKNk0LYyRWJ60CEvk?=
 =?us-ascii?Q?lu5m9ZM26md+4cPEnvgNyigDTUkN3MipRlUQ0lgh3PLUPSxJ35RTBOfHACqc?=
 =?us-ascii?Q?WfH0hvAGHhQvcvaKuo2z3BhJ7jTsua0wE8nMprqt+5GRawicgVFJDECBytgG?=
 =?us-ascii?Q?EFSycXxFWxf1WDuMt46Ict2Dy46jmFvYemWLkPiXmkaiXz70ArGrGlK8Zany?=
 =?us-ascii?Q?Lr2jtW7/LSvLg294XG5PL4RgvA4oqEfPdHWJOf6aJ8LK7sGN1NRyEnuDgTr1?=
 =?us-ascii?Q?SWdLZekJ7OFE5mQ7xMbmY8lYjMnRq/VJ9NRaFGRvseTxzOfKIyM21rajKG8+?=
 =?us-ascii?Q?BAeFff0+R9OqeIo+F+nq5/LpZu8K8ZpfBIwNB1+GWSpzaFpLObFBDoe2CWbi?=
 =?us-ascii?Q?AOblIjSAcA+3tsIgmp5eSqllTaGOYct7dcbRqBkK7jenjlfXsRiN6xP9Qbky?=
 =?us-ascii?Q?s1mLyHXgk5BEWGlrUjHZw/pwHmaY/9T4ZCi00f2kKYe1B7oCv4VCwSagmgCD?=
 =?us-ascii?Q?L6HZamiEh30331JNMBlWfxjf4Ql3xJ2oAy/qwksUj3oXE0UNelgRhW64lKze?=
 =?us-ascii?Q?ldVkuDmsYNOHUyN+dl7vQMgH2AatCiSScCOKVoSczc9JhKscsFnePQ/6zC5e?=
 =?us-ascii?Q?suqgyhIupcTRpsJ9ftWerpWWGS28RbiPubE4aOxvyqql04WsdN4Gd59kBoXn?=
 =?us-ascii?Q?yhCUqwunhJPjeNpzsVK/B/LdUvkTOgABU5XVoapaehAzRh+9hDORoCBXu8PF?=
 =?us-ascii?Q?oVjUmNKwYb31zPX1AQP1Lo3OeEJfPDNIh4G73cMg0CCMvfHd5Eq2XvqE3tGu?=
 =?us-ascii?Q?Bti68Zzxq7svv3o7IzaWeHvWeA5cR0VD1jgxB1mGIJH5iNlM8wDiAsQ1ABUS?=
 =?us-ascii?Q?4zbFPz005LIzntY7hSCD6keOF9oI8BWiOlqsGIy+32w6CSsc1stu7g+a5Ap1?=
 =?us-ascii?Q?JcDt6qcqb7caHiagPVC+tsvNZC7RQoYdn20Ki5hrHcVLR6WUwltCR0Cbdt2z?=
 =?us-ascii?Q?84S5H8qZ176VXViZDUbGTYCzuhsqbM/Uzw+yFJOiPc8+r3A4tTxFwJQKKppi?=
 =?us-ascii?Q?0PEP1S4N6/YAZyp41Zrom8iw2eeE3p0xwpGfJ9hI/MQXRugnvsOVK5zm3lys?=
 =?us-ascii?Q?fsk43ERJPztIt7ZxLGbYKGspg8fb9yVTgJqA3ZeXezaCPtv2YuHWZe+DN7xg?=
 =?us-ascii?Q?CDiX5v4k6MegtSb4sd2eiXAgZgyROC7L8j7gVIQYi/Mzfk6uKfemeuzct2bY?=
 =?us-ascii?Q?NB/FuPKEC0hZJwq8+Jbiz9z+WQfv1s3dLgy0nmA7WKLh3liJwcqC1N1s7zHD?=
 =?us-ascii?Q?mzDPZ3dKK+smmfUgMbwoFcyecMfHcf22IyutL9e/31Lguj4ZpVMCgjP/hUwS?=
 =?us-ascii?Q?mJBQsY1GMJDAO9Ou0fYRbRoT7k5AZJYe5+jbM16MY5cLBAwc/+TMVAX3L80v?=
 =?us-ascii?Q?rtj0V4hZlvT+brlo2Wi5gD3rbR7YHtQX/qooodN/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad53861-29be-4c69-c672-08dcee8cf1f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:20:30.5209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcECwHSCUL3jBnr+o2yqLCCyR02jO9U6fU4qA6r/mXfZcvEHFS1bYwkxLPZ/FVDWDUVlhaGCd+lYveF15MUdSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

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


