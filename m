Return-Path: <linux-media+bounces-57724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBT0Jft2y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:25:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DAE365215
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45E7B3020A49
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC03BE15A;
	Tue, 31 Mar 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QYrs+y+H"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5113A63F2;
	Tue, 31 Mar 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941920; cv=fail; b=aZFctHqglwh4jE2YSl2loUENFqS0KFEwNVhQHppoQGvJdXtwOXTbPuQrMIv67ZHR+FvueckkfJdI3cXM9aGDAxoVUAVL0a2H1PKP61obbW+FufVYdE/2v24SQgDdt6tNVzrCKSJBWXn6hWFvULYub1cWLr7A+Ur5HBfUiV+5X0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941920; c=relaxed/simple;
	bh=FaKrky4vn7jlxAivrAQapWGzpeTGaOcMVSKF8tlLPlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9j1ylT9d4G8G9GuhqL16yUrNMapxF1qYkJEVri+1Qr9ERtHHwFzgJn7vYAeTCLbw1q4it2jMaiXGCsxsz4i5GZschnziCyJLc9fFpqkwwMiX4N3XvcT/EKdANiqLylSWhXEBQ4Er+74JXmWxUk4GcG2FysW+aUE/MmRkLNDTss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QYrs+y+H; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSn1PX8DuU9gfV58lk1FHfgOIX6pb6L7TEfg8DcOUUjx5hFihJe/T4e4CKsFBNC0APjtmaahFbB1FbRLaw/6ZXO5B9tKB9f6+ONPLqWggsZzkeROEXGYI38UEhsxEiSwIqG4IrCVl/qfL4erh3zo5nGkAsnOu958BOdgaxk1CMOxWIIAk7+2dnXGOfg3itkisMAUooSeWliISIJ82vT0r1oRR0+g9O0LhNS6cEBJ2PC5sXBOpH105+VevnLjrxqVNyhyah9zSAECRuhWzRHdTF5VCduhwsJmPi4QZ3vxJNxy9YlA+jLXXNCduYsTQ6scgB4R28DuQoEVHt21kMvjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UDKDpFdvlu+yHmlkw8x0m/80ZzvHagyajHrAnppOIs=;
 b=gcK9c0dlWYmWpbKuQZQAOpnxU3Y0ko9q4yLGgpQwaKECe8IdjfO6mZwa10FYUNx4zkhLDlE5+DZQY6K/hQVEEco+OpqJuMHHT/jugHGTQRPxzLvbfQxcOYOsV5alsOgP3YX5QrYySX4Q1gShFB0uQ5SZGYK72Bs7uk/xTPTbfuVBwtscQOhu5gWrtQrJMuRDGOzB1oXrxJS9JW8xBB0UA8qWWLGQKX6HJv7JpgfE1ietQzNMN9fyF0ZAvYxeQO2Eleg1fxloGRhqXmOLs8QLgdK+AYUFj+iMFlMAky43ulD0c+zleqy0s2yG1XNiSC+TwMLDVZ/LwijEp5cv696vDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UDKDpFdvlu+yHmlkw8x0m/80ZzvHagyajHrAnppOIs=;
 b=QYrs+y+HkfzuccplJMylBcn9sj1gayJF6mXeku+vBOoD6wrDmSxevXplMYTZX0AcuayTsVyqJlC+BPH7fmWrnVvOkMS/In8yDAcBg4RcF4O2eFgjW5VtQ/enX2/yYqkEPW2dyhjgRYKGB+J2FiUp5Va8jDiP46wmwA43Cx/XxrGV8Oa445jNQWrNU/kpKDRM8xu83bGt67h6jaj27UP0VuF6aJ0TwV0zdskq3lfBHNV7XnxDRABC1V5qfGUbugaUD6g+G7iMjZF+/3+BHsUHwIsYCuw1BVAQ6omWPlFNDxOELdJZ6FEgJHDHcfUxMLN1nr81jPVdTrn1jVeYkmOiPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:25:13 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:13 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 3/7] media: v4l2-memtrack: Add V4L2 memory tracking infrastructure
Date: Tue, 31 Mar 2026 15:23:13 +0800
Message-ID: <20260331072347.253-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: adeb03fa-4526-4c61-0326-08de8ef6a613
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	f3x275k4wAiPxVpyQDS7foBv+tXzJh7Uc4fYaqmpOwx7Nic++1nc53TZ9oo6kQwBD/p+jhW2bmvUosvJUO6YmxujVzYj0c7hbulgI5HXXTl4OH6nOMwz0qBLw7SRIFA6+jkcFVwdB1gRNjwFDxjaABRTJwGiVQ6IZDSx1BZgozRtnOChJCk9DASC6XjvUudU9rbYXm9Z2N26oiQt10bBOQVhqq00VN7ZWihCKvVeImkFN0jdiCgwmKZ4++zJD462f2VwaTSzgXyMRzAxIGhZ7YADGmClmZ/+cO1zcTdMaNg5CNlWkOhR/Wud1Zgv1o0tGK/FI2E2mzzXpyY+oe2cOp+Qbzkm0o6KyOTgCE9GY6oO4/n1PdvQNGFpoEUh/4pcDj+nGhOj/H8rfIdKxXLfkmoBLC3GGXzcqBCUgfyLwGswtU8gyjyOn73j6fgHJj1dEH+15sZndHxVT46TRCEoyYPHXlpwwzBYYTcu5hgeK8L0Pbe3ej9hMoattX96tJdq4nAUBNIJ2XcDLGFFsboDRNCuHgerMCizOgwFV1Kf1FBIPww3+ONuGEzNb8H6FoYVGJvJQQu9kPot5d+q3nih6028PXA96/3h4v43i5Efsno9a5KowClw0o90fBl522oROy8p02otPtfDxr/9E2dlN5gpWBAB2BqslBRgZLN8/+cqf+Y0adjHSjv9DQpkv4YDHDXlS3gSbhAYhQMcr1SJk86OGcEsdlScH+9T6/7XaDtAGm94EtL1UCsX4SyArWZ5iw1I2OryUTJSUTiJLe7j49Q5+PyZgZhpg8LKJc+JTuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4SSHuxiIGM1RIHPp+hx9BQgtiqq4pfF8B3rp8VCdo3ZXg1vO1GEfq1BxCLG1?=
 =?us-ascii?Q?R4kXxUzfsiyz+s/wPVjQdJciYqOHR5cUWmEI4a1XQVi/6tnTu4uXNksRQp5D?=
 =?us-ascii?Q?PGXJKHNptXykfjtgMsKhNub9KyKaYICD7rejtjeoWZvdrbZPcHMYq3DpEc2d?=
 =?us-ascii?Q?q89QPrwc5v3jdA5TYM30Y6tsdCea+cqFgNM7udXkER/sxVpMNuxHT9ZjUhnY?=
 =?us-ascii?Q?9aoSH1OCLGafD6aU2sR0+PXdTZMBKXNgZDAqEi46EoEASgWE1o89EyDDFoK3?=
 =?us-ascii?Q?/eoO2dYenv3SC10OnJ6KEqhqtaXdS3VTk2TJoYmFSPZAy9XEJvD1hGN9uMUE?=
 =?us-ascii?Q?y7cAcY4m7eMH6ju9UJbQhhROPoxh1M8mVhs5HOTRJ0gZfr15ruKwZXFWJxVu?=
 =?us-ascii?Q?naZE73sAHbuzirKVFoJ57Q7+NIvKFAJdSRrS2DitGyrSwkXVSLRoe3FSUT0O?=
 =?us-ascii?Q?u4KSXcRUDE91Vw2OgVLCmIlKfwtiUk3n2oe536OrT7pk25q1T4crw+MWm9s8?=
 =?us-ascii?Q?FMlp3INFMF9bjHyj21QolJQOhjH6uCltEPC+Ky8mGtI12GE7Cd8EDm+sYi0g?=
 =?us-ascii?Q?iOxNZZHEWImSoGL/rBhXfrjTBqudCodvGSYSwssOMTi1z0c8xU9spmP1wMEj?=
 =?us-ascii?Q?ewQuw0pBqrhbSIfCKohum/kw2uLY5o703dxeSUum+qUhP5rbtk5yu2W02hJZ?=
 =?us-ascii?Q?VN8UjCDVOTFcTnCb1vEZ1lvW9BY6gnUdM5XSHR31kqLPCZDb5N68JWUpIxgU?=
 =?us-ascii?Q?rz0yv3s+8GMnxNDTWHqw5Wxfo15N58S9ggDcrmaM8BHZiJ+zMycXzeAwpStt?=
 =?us-ascii?Q?D3CuVfscAe8T4rbzBPF1yHchjlQnIJ7a/xC6I7XUyubSug4VAUlgNAYth+rF?=
 =?us-ascii?Q?rimjgZq5XKRVclh8EUOvz8eluAlytBb+H2ocWMjOIvyxm+pxErRPYz37Ri3r?=
 =?us-ascii?Q?SnWEjxwmbDZrX2FgkOiApeonO4xLJGwTsdaJBWPynte+A18q2YaGEI8+J/6T?=
 =?us-ascii?Q?ewhzuiKsBzN8OU4N5+qU9BmPe3HDGIHlMV6/3oKwL53oX+BHXu24sdqjlO/t?=
 =?us-ascii?Q?btIUMdxv1WuW0uSBaOTtNJw1ZKRA0j/MfD9iSzw1FfTv6/GsTBMv2OifpA9J?=
 =?us-ascii?Q?sDWhZ/FduDNzwFRhRAW2Af4mrkiv/8vKQeEYJDkM5DlU2NMp+zEpacR7WXLE?=
 =?us-ascii?Q?WK8BnuAUargqoK6tJ7atLp4PUOOkYLa+xkRipsbQmSxhrPgsL4JLeo191rN/?=
 =?us-ascii?Q?xXNc43ZmjjFpKb6RVuZoNsucsD8ncVLcj9Dwq1kYzsgKCLUW8rbwfkOFnYVJ?=
 =?us-ascii?Q?zirwrcHlWLrbhTYxbhDc45wmQxQP6tX2mGA8ySF+skKTLoFJk5XouhSS+JTP?=
 =?us-ascii?Q?G3+qps8dJtBLAw1BMinXEZ2rEmBVDoPQNYDbUlkiiqtt3JJdL06YQtjITg57?=
 =?us-ascii?Q?2hbFSilI1TobXiU821R2SoH1pYJaZQymZJvgq4gOMKCG7yV0U3JMgXPrnf1b?=
 =?us-ascii?Q?bTtG8litax9D8BOR4uf7woFoMrM1zUpp6p+0fVLNFAf5/96qethOYrw8I/Vu?=
 =?us-ascii?Q?1/eZO1BmH0vhPTHThhBilphGUxIVcQjcATUDlbgX+NUaAE/8pFAKNgsgkPnb?=
 =?us-ascii?Q?in1gpN5di7+cixyY4MlLQv5x+VqqoN306rV2nbEicsjxPf5ZDQU80WIFWnLf?=
 =?us-ascii?Q?pfkBfl3nfRDDKNJnrr0AdO4wLc2v3hTqvMjdSGLQ39R2nBF1bNmofMOmg1Uv?=
 =?us-ascii?Q?JNQxla8pjQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adeb03fa-4526-4c61-0326-08de8ef6a613
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:13.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6zt2eLODj4EPvxanosaxeMS9jlOJO6NXdw3Y1BPviO/3lmKj7Bh9owgGfOBDy5AynIMzZmYPvNvgwkc7FFWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57724-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 48DAE365215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Add a hierarchical memory tracking system for V4L2 devices that allows
drivers to monitor and report memory usage. This infrastructure provides:

- Tree-structured memory tracking with parent-child relationships
- Per-node memory accounting with allocation counts
- Automatic aggregation of memory usage up the hierarchy
- debugfs interface for inspecting memory usage trees
- Notification callbacks for memory usage changes

The tracking system uses a context-based design where each root node
creates its own tracking tree. Memory changes propagate notifications up
the tree, allowing drivers to update controls or take other actions.

The debugfs interface creates entries under <debugfs>/v4l2-memtrack/
showing hierarchical memory usage with indentation, allocation counts,
and process information.

Drivers can use this to track internal buffers, intermediate processing
data, and other allocations, providing visibility into memory consumption
for debugging and resource monitoring.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/common/Kconfig                  |   1 +
 drivers/media/common/Makefile                 |   2 +-
 drivers/media/common/v4l2-memtrack/Kconfig    |  19 +
 drivers/media/common/v4l2-memtrack/Makefile   |   3 +
 .../common/v4l2-memtrack/v4l2-memtrack.c      | 825 ++++++++++++++++++
 include/media/v4l2-memtrack.h                 | 220 +++++
 6 files changed, 1069 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/common/v4l2-memtrack/Kconfig
 create mode 100644 drivers/media/common/v4l2-memtrack/Makefile
 create mode 100644 drivers/media/common/v4l2-memtrack/v4l2-memtrack.c
 create mode 100644 include/media/v4l2-memtrack.h

diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index adcb6655385a..4da632f53970 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -27,5 +27,6 @@ config VIDEO_TVEEPROM
 source "drivers/media/common/b2c2/Kconfig"
 source "drivers/media/common/saa7146/Kconfig"
 source "drivers/media/common/siano/Kconfig"
+source "drivers/media/common/v4l2-memtrack/Kconfig"
 source "drivers/media/common/v4l2-tpg/Kconfig"
 source "drivers/media/common/videobuf2/Kconfig"
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index c5ab905e7c20..0010a4d904ca 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
+obj-y += b2c2/ saa7146/ siano/ v4l2-memtrack/ v4l2-tpg/ videobuf2/
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
diff --git a/drivers/media/common/v4l2-memtrack/Kconfig b/drivers/media/common/v4l2-memtrack/Kconfig
new file mode 100644
index 000000000000..f4c97117b779
--- /dev/null
+++ b/drivers/media/common/v4l2-memtrack/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config V4L2_MEMTRACK
+	tristate "V4L2 memory usage tracking support"
+	help
+	  This option enables hierarchical memory allocation tracking
+	  for V4L2 devices. It provides:
+
+	  - Tree-structured memory usage monitoring
+	  - Per-device and per-context tracking
+	  - debugfs interface at /sys/kernel/debug/v4l2-memtrack/
+	  - Optional V4L2 control for userspace queries
+
+	  This is useful for debugging memory leaks and monitoring
+	  buffer allocation in video drivers.
+
+	  To compile this as a module, choose M here.
+
+	  If unsure, say N.
diff --git a/drivers/media/common/v4l2-memtrack/Makefile b/drivers/media/common/v4l2-memtrack/Makefile
new file mode 100644
index 000000000000..5ed59453b35a
--- /dev/null
+++ b/drivers/media/common/v4l2-memtrack/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_V4L2_MEMTRACK) += v4l2-memtrack.o
diff --git a/drivers/media/common/v4l2-memtrack/v4l2-memtrack.c b/drivers/media/common/v4l2-memtrack/v4l2-memtrack.c
new file mode 100644
index 000000000000..96eeaef7a653
--- /dev/null
+++ b/drivers/media/common/v4l2-memtrack/v4l2-memtrack.c
@@ -0,0 +1,825 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Memory Usage Tracker
+ *
+ * Copyright 2026 NXP
+ *
+ * Provides hierarchical memory allocation tracking for V4L2 devices.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/list.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/atomic.h>
+#include <linux/sched.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#include <media/v4l2-memtrack.h>
+
+#define V4L2_MEMTRACK_DEBUGFS_ROOT	"v4l2-memtrack"
+#define V4L2_MEMTRACK_MAX_DEPTH		16
+
+/**
+ * struct v4l2_memtrack_ctx - Memory tracker context
+ * @name: Tracker name (shown in debugfs)
+ * @root: Root node of tracking hierarchy
+ * @debugfs: debugfs file entry
+ * @lock: Protects the node tree
+ */
+struct v4l2_memtrack_ctx {
+	const char *name;
+	struct v4l2_memtrack_node *root;
+	struct dentry *debugfs;
+	struct mutex lock;
+};
+
+/**
+ * struct v4l2_memtrack_node - Memory tracking node
+ * @list: Linkage in parent's children list
+ * @parent: Parent node
+ * @children: List of child nodes
+ * @bytes: Memory usage in bytes
+ * @alloc_count: Number of allocations
+ * @name: Node name
+ * @depth: Depth of this node in the tree (root = 0)
+ * @pid: Process ID that created this node
+ * @tgid: Thread group ID that created this node
+ * @ctx: Back pointer to context
+ * @is_leaf: True if this is a leaf node (internal use only)
+ * @notify: Notification callback for memory changes
+ * @notify_priv: Private data for notification callback
+ * @notify_work: Per-node delayed work for coalesced notifications
+ * @notify_delay_ms: Notification delay (<0: off, 0: immediate, >0: delayed)
+ * @in_notify: Flag indicating if callback is currently executing
+ * @notify_done: Completion for waiting on callback completion
+ */
+struct v4l2_memtrack_node {
+	struct list_head list;
+	struct v4l2_memtrack_node *parent;
+	struct list_head children;
+
+	size_t bytes;
+	unsigned int alloc_count;
+
+	const char *name;
+	unsigned int depth;
+	pid_t pid;
+	pid_t tgid;
+
+	struct v4l2_memtrack_ctx *ctx;
+	bool is_leaf;
+
+	/* Notify fields - only used by non-leaf nodes */
+	v4l2_memtrack_notify_fn notify;
+	void *notify_priv;
+	struct delayed_work notify_work;
+	int notify_delay_ms;
+	bool in_notify;
+	struct completion notify_done;
+};
+
+static struct dentry *v4l2_memtrack_debugfs_root;
+static DEFINE_MUTEX(v4l2_memtrack_debugfs_lock);
+static struct kref v4l2_memtrack_debugfs_kref;
+static bool v4l2_memtrack_debugfs_initialized;
+
+struct v4l2_memtrack_iter_state {
+	struct v4l2_memtrack_node *node;
+	struct list_head *next_child;
+};
+
+typedef int (*v4l2_memtrack_visit_fn)(struct v4l2_memtrack_node *node, void *data);
+
+static int v4l2_memtrack_for_each_locked(struct v4l2_memtrack_node *root,
+					 v4l2_memtrack_visit_fn visit,
+					 void *data)
+{
+	struct v4l2_memtrack_iter_state stack[V4L2_MEMTRACK_MAX_DEPTH];
+	struct v4l2_memtrack_node *node;
+	int sp = 0;
+	int ret;
+
+	lockdep_assert_held(&root->ctx->lock);
+
+	ret = visit(root, data);
+	if (ret)
+		return ret;
+
+	if (list_empty(&root->children))
+		return 0;
+
+	stack[sp].node = root;
+	stack[sp].next_child = root->children.next;
+	sp++;
+
+	while (sp > 0) {
+		struct v4l2_memtrack_iter_state *top = &stack[sp - 1];
+
+		if (top->next_child == &top->node->children) {
+			sp--;
+			continue;
+		}
+
+		node = list_entry(top->next_child,
+				  struct v4l2_memtrack_node, list);
+		top->next_child = top->next_child->next;
+
+		ret = visit(node, data);
+		if (ret)
+			return ret;
+
+		if (!list_empty(&node->children) &&
+		    sp < V4L2_MEMTRACK_MAX_DEPTH) {
+			stack[sp].node = node;
+			stack[sp].next_child = node->children.next;
+			sp++;
+		}
+	}
+
+	return 0;
+}
+
+static void v4l2_memtrack_debugfs_release(struct kref *kref)
+{
+	debugfs_remove(v4l2_memtrack_debugfs_root);
+	v4l2_memtrack_debugfs_root = NULL;
+	v4l2_memtrack_debugfs_initialized = false;
+}
+
+static void v4l2_memtrack_debugfs_get(void)
+{
+	guard(mutex)(&v4l2_memtrack_debugfs_lock);
+
+	if (!v4l2_memtrack_debugfs_initialized) {
+		kref_init(&v4l2_memtrack_debugfs_kref);
+		v4l2_memtrack_debugfs_root =
+			debugfs_create_dir(V4L2_MEMTRACK_DEBUGFS_ROOT, NULL);
+		v4l2_memtrack_debugfs_initialized = true;
+	} else {
+		kref_get(&v4l2_memtrack_debugfs_kref);
+	}
+}
+
+static void v4l2_memtrack_debugfs_put(void)
+{
+	guard(mutex)(&v4l2_memtrack_debugfs_lock);
+	kref_put(&v4l2_memtrack_debugfs_kref, v4l2_memtrack_debugfs_release);
+}
+
+static void v4l2_memtrack_notify_work_handler(struct work_struct *work);
+
+static int v4l2_memtrack_node_init(struct v4l2_memtrack_node *node,
+				   struct v4l2_memtrack_ctx *ctx,
+				   unsigned int depth,
+				   const char *name,
+				   bool is_leaf)
+{
+	INIT_LIST_HEAD(&node->list);
+	INIT_LIST_HEAD(&node->children);
+	node->bytes = 0;
+	node->alloc_count = 0;
+	node->ctx = ctx;
+	node->depth = depth;
+	node->tgid = current->tgid;
+	node->pid = current->pid;
+	node->is_leaf = is_leaf;
+
+	/* Initialize notify fields only for non-leaf nodes */
+	if (!is_leaf) {
+		node->notify = NULL;
+		node->notify_priv = NULL;
+		INIT_DELAYED_WORK(&node->notify_work,
+				  v4l2_memtrack_notify_work_handler);
+		node->notify_delay_ms = 0;
+		node->in_notify = false;
+		init_completion(&node->notify_done);
+	}
+
+	if (name) {
+		node->name = kstrdup_const(name, GFP_KERNEL);
+		if (!node->name)
+			return -ENOMEM;
+	} else {
+		node->name = NULL;
+	}
+
+	return 0;
+}
+
+static inline const char *v4l2_memtrack_name(struct v4l2_memtrack_node *node)
+{
+	return node->name ? : "(unnamed)";
+}
+
+static int v4l2_memtrack_sum_visitor(struct v4l2_memtrack_node *node, void *data)
+{
+	size_t *total = data;
+
+	*total += node->bytes;
+	return 0;
+}
+
+static size_t v4l2_memtrack_sum_bytes_locked(struct v4l2_memtrack_node *root)
+{
+	size_t total = 0;
+
+	lockdep_assert_held(&root->ctx->lock);
+
+	v4l2_memtrack_for_each_locked(root, v4l2_memtrack_sum_visitor, &total);
+	return total;
+}
+
+static void v4l2_memtrack_do_notify_locked(struct v4l2_memtrack_node *node)
+{
+	size_t total;
+	v4l2_memtrack_notify_fn notify;
+	void *priv;
+	struct v4l2_memtrack_ctx *ctx = node->ctx;
+
+	lockdep_assert_held(&ctx->lock);
+
+	if (!node->notify)
+		return;
+
+	total = v4l2_memtrack_sum_bytes_locked(node);
+	notify = node->notify;
+	priv = node->notify_priv;
+
+	node->in_notify = true;
+	reinit_completion(&node->notify_done);
+
+	mutex_unlock(&ctx->lock);
+	notify(node, total, priv);
+	mutex_lock(&ctx->lock);
+
+	node->in_notify = false;
+	complete_all(&node->notify_done);
+}
+
+static void v4l2_memtrack_notify_work_handler(struct work_struct *work)
+{
+	struct v4l2_memtrack_node *node =
+		container_of(to_delayed_work(work),
+			     struct v4l2_memtrack_node, notify_work);
+	struct v4l2_memtrack_ctx *ctx = node->ctx;
+
+	guard(mutex)(&ctx->lock);
+	v4l2_memtrack_do_notify_locked(node);
+}
+
+static void v4l2_memtrack_schedule_notify(struct v4l2_memtrack_node *node)
+{
+	int delay;
+
+	if (node->is_leaf || !node->notify)
+		return;
+
+	delay = node->notify_delay_ms;
+	if (delay < 0)
+		return;
+
+	if (delay == 0)
+		v4l2_memtrack_do_notify_locked(node);
+	else
+		schedule_delayed_work(&node->notify_work,
+				      msecs_to_jiffies(delay));
+}
+
+static void v4l2_memtrack_notify_change_locked(struct v4l2_memtrack_node *node)
+{
+	struct v4l2_memtrack_node *cur;
+
+	lockdep_assert_held(&node->ctx->lock);
+
+	for (cur = node; cur; cur = cur->parent) {
+		if (!cur->is_leaf)
+			v4l2_memtrack_schedule_notify(cur);
+	}
+}
+
+static void v4l2_memtrack_do_notify(struct v4l2_memtrack_node *node)
+{
+	if (!node || !node->ctx)
+		return;
+
+	guard(mutex)(&node->ctx->lock);
+	v4l2_memtrack_notify_change_locked(node);
+}
+
+struct v4l2_memtrack_seq_ctx {
+	struct seq_file *seq;
+};
+
+static int v4l2_memtrack_seq_visitor(struct v4l2_memtrack_node *node, void *data)
+{
+	struct v4l2_memtrack_seq_ctx *ctx = data;
+	struct seq_file *s = ctx->seq;
+	size_t bytes;
+
+	bytes = v4l2_memtrack_sum_bytes_locked(node);
+
+	seq_printf(s, "%*s", node->depth * 2, "");
+
+	if (node->name)
+		seq_printf(s, "%s ", node->name);
+
+	if (node->is_leaf)
+		seq_puts(s, "[leaf] ");
+
+	if (node->tgid && node->pid)
+		seq_printf(s, "(tgid=%d, pid=%d) ", node->tgid, node->pid);
+
+	seq_printf(s, "usage: %zu", bytes);
+
+	if (node->alloc_count > 1 || (node->alloc_count == 1 && !list_empty(&node->children))) {
+		seq_printf(s, " (count=%u", node->alloc_count);
+		if (!list_empty(&node->children))
+			seq_printf(s, ", self=%zu", node->bytes);
+		seq_puts(s, ")");
+	}
+
+	seq_puts(s, "\n");
+	return 0;
+}
+
+static int v4l2_memtrack_seq_show(struct seq_file *s, void *data)
+{
+	struct v4l2_memtrack_ctx *ctx = s->private;
+	struct v4l2_memtrack_seq_ctx seq_ctx = { .seq = s };
+
+	guard(mutex)(&ctx->lock);
+
+	seq_printf(s, "Total memory usage: %zu bytes\n",
+		   v4l2_memtrack_sum_bytes_locked(ctx->root));
+	v4l2_memtrack_for_each_locked(ctx->root, v4l2_memtrack_seq_visitor, &seq_ctx);
+
+	return 0;
+}
+
+static int v4l2_memtrack_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, v4l2_memtrack_seq_show, inode->i_private);
+}
+
+static const struct file_operations v4l2_memtrack_debugfs_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_memtrack_debugfs_open,
+	.release = single_release,
+	.read = seq_read,
+	.llseek = seq_lseek,
+};
+
+static void v4l2_memtrack_create_debugfs(struct v4l2_memtrack_ctx *ctx)
+{
+	guard(mutex)(&v4l2_memtrack_debugfs_lock);
+
+	if (IS_ERR_OR_NULL(v4l2_memtrack_debugfs_root))
+		return;
+
+	ctx->debugfs = debugfs_create_file(ctx->name, 0444,
+					   v4l2_memtrack_debugfs_root,
+					   ctx, &v4l2_memtrack_debugfs_fops);
+}
+
+static struct v4l2_memtrack_ctx *v4l2_memtrack_ctx_create(const char *name)
+{
+	struct v4l2_memtrack_ctx *ctx;
+
+	ctx = kzalloc_obj(*ctx);
+	if (!ctx)
+		return NULL;
+
+	if (name) {
+		ctx->name = kstrdup_const(name, GFP_KERNEL);
+		if (!ctx->name) {
+			kfree(ctx);
+			return NULL;
+		}
+	}
+
+	mutex_init(&ctx->lock);
+
+	return ctx;
+}
+
+static void v4l2_memtrack_ctx_destroy(struct v4l2_memtrack_ctx *ctx)
+{
+	debugfs_remove(ctx->debugfs);
+	mutex_destroy(&ctx->lock);
+	kfree_const(ctx->name);
+	kfree(ctx);
+	v4l2_memtrack_debugfs_put();
+}
+
+struct v4l2_memtrack_node *v4l2_memtrack_create_root(const char *name)
+{
+	struct v4l2_memtrack_ctx *ctx;
+	struct v4l2_memtrack_node *node;
+
+	v4l2_memtrack_debugfs_get();
+
+	ctx = v4l2_memtrack_ctx_create(name);
+	if (!ctx) {
+		v4l2_memtrack_debugfs_put();
+		return NULL;
+	}
+
+	node = kzalloc_obj(*node);
+	if (!node) {
+		v4l2_memtrack_ctx_destroy(ctx);
+		return NULL;
+	}
+
+	if (v4l2_memtrack_node_init(node, ctx, 0, name, false)) {
+		kfree(node);
+		v4l2_memtrack_ctx_destroy(ctx);
+		return NULL;
+	}
+
+	ctx->root = node;
+
+	if (name)
+		v4l2_memtrack_create_debugfs(ctx);
+
+	return node;
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_create_root);
+
+struct v4l2_memtrack_node *v4l2_memtrack_create_node(struct v4l2_memtrack_node *parent,
+						     const char *name)
+{
+	struct v4l2_memtrack_ctx *ctx;
+	struct v4l2_memtrack_node *node;
+	unsigned int new_depth;
+
+	if (!parent || !parent->ctx)
+		return NULL;
+
+	/* Leaf nodes cannot have children */
+	if (parent->is_leaf) {
+		pr_warn_once("v4l2-memtrack: cannot create child under leaf node\n");
+		return NULL;
+	}
+
+	new_depth = parent->depth + 1;
+	if (new_depth >= V4L2_MEMTRACK_MAX_DEPTH) {
+		pr_warn_once("v4l2-memtrack: max depth %d reached, cannot create child node\n",
+			     V4L2_MEMTRACK_MAX_DEPTH);
+		return NULL;
+	}
+
+	ctx = parent->ctx;
+
+	node = kzalloc_obj(*node);
+	if (!node)
+		return NULL;
+
+	if (v4l2_memtrack_node_init(node, ctx, new_depth, name, false)) {
+		kfree(node);
+		return NULL;
+	}
+
+	node->parent = parent;
+
+	scoped_guard(mutex, &ctx->lock)
+		list_add_tail(&node->list, &parent->children);
+
+	return node;
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_create_node);
+
+static void v4l2_memtrack_cancel_notify(struct v4l2_memtrack_node *node)
+{
+	bool wait_needed = false;
+
+	if (node->is_leaf)
+		return;
+
+	cancel_delayed_work_sync(&node->notify_work);
+
+	scoped_guard(mutex, &node->ctx->lock) {
+		node->notify = NULL;
+		node->notify_priv = NULL;
+		wait_needed = node->in_notify;
+	}
+
+	if (wait_needed)
+		wait_for_completion(&node->notify_done);
+}
+
+static void v4l2_memtrack_delete_subtree_locked(struct v4l2_memtrack_node *root)
+{
+	struct v4l2_memtrack_ctx *ctx = root->ctx;
+	struct v4l2_memtrack_node * const stop = root->parent;
+	struct v4l2_memtrack_node *node, *parent;
+
+	lockdep_assert_held(&ctx->lock);
+
+	node = root;
+	while (node) {
+		if (!list_empty(&node->children)) {
+			node = list_first_entry(&node->children,
+						struct v4l2_memtrack_node, list);
+		} else {
+			parent = node->parent;
+			list_del(&node->list);
+			kfree_const(node->name);
+			kfree(node);
+
+			if (parent == stop)
+				break;
+			node = parent;
+		}
+	}
+}
+
+static int v4l2_memtrack_find_notify_visitor(struct v4l2_memtrack_node *node,
+					     void *data)
+{
+	struct v4l2_memtrack_node **found = data;
+
+	if (!node->is_leaf && node->notify) {
+		*found = node;
+		return 1; /* Stop iteration */
+	}
+	return 0;
+}
+
+static struct v4l2_memtrack_node *
+v4l2_memtrack_get_next_notify_node_locked(struct v4l2_memtrack_node *root)
+{
+	struct v4l2_memtrack_node *found = NULL;
+
+	lockdep_assert_held(&root->ctx->lock);
+
+	v4l2_memtrack_for_each_locked(root, v4l2_memtrack_find_notify_visitor,
+				      &found);
+	return found;
+}
+
+void v4l2_memtrack_destroy_node(struct v4l2_memtrack_node *node)
+{
+	struct v4l2_memtrack_ctx *ctx;
+	struct v4l2_memtrack_node *parent;
+	struct v4l2_memtrack_node *notify_node;
+	bool is_root;
+
+	if (!node || !node->ctx)
+		return;
+
+	ctx = node->ctx;
+	parent = node->parent;
+	is_root = !parent;
+
+	if (v4l2_memtrack_read(node))
+		v4l2_memtrack_print_debug(node);
+
+	/*
+	 * Cancel all notify callbacks in the subtree.
+	 * Get one node with notify at a time while holding lock,
+	 * then cancel it without lock to avoid deadlock.
+	 */
+	if (!node->is_leaf) {
+		while (true) {
+			scoped_guard(mutex, &ctx->lock)
+				notify_node = v4l2_memtrack_get_next_notify_node_locked(node);
+
+			if (!notify_node)
+				break;
+
+			v4l2_memtrack_cancel_notify(notify_node);
+		}
+	}
+
+	scoped_guard(mutex, &ctx->lock)
+		v4l2_memtrack_delete_subtree_locked(node);
+
+	if (is_root)
+		v4l2_memtrack_ctx_destroy(ctx);
+	else
+		v4l2_memtrack_do_notify(parent);
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_destroy_node);
+
+static int v4l2_memtrack_create_leaf_locked(struct v4l2_memtrack_node *node,
+					    size_t bytes, const char *name)
+{
+	struct v4l2_memtrack_ctx *ctx = node->ctx;
+	struct v4l2_memtrack_node *child;
+	unsigned int new_depth;
+
+	lockdep_assert_held(&ctx->lock);
+
+	new_depth = node->depth + 1;
+	if (new_depth >= V4L2_MEMTRACK_MAX_DEPTH) {
+		pr_warn_once("v4l2-memtrack: max depth %d reached\n",
+			     V4L2_MEMTRACK_MAX_DEPTH);
+		return -ENOSPC;
+	}
+
+	child = kzalloc(sizeof(*child), GFP_KERNEL);
+	if (!child)
+		return -ENOMEM;
+
+	if (v4l2_memtrack_node_init(child, ctx, new_depth, name, true)) {
+		kfree(child);
+		return -ENOMEM;
+	}
+
+	child->parent = node;
+	child->bytes = bytes;
+	child->alloc_count = 1;
+
+	list_add_tail(&child->list, &node->children);
+
+	return 0;
+}
+
+void v4l2_memtrack_add(struct v4l2_memtrack_node *node, size_t bytes,
+		       const char *name)
+{
+	if (!node || !node->ctx)
+		return;
+
+	/* Leaf nodes cannot have children */
+	if (node->is_leaf) {
+		pr_warn_once("v4l2-memtrack: cannot add to leaf node\n");
+		return;
+	}
+
+	guard(mutex)(&node->ctx->lock);
+
+	if (name) {
+		/* Create a leaf node for named allocations */
+		if (v4l2_memtrack_create_leaf_locked(node, bytes, name) < 0) {
+			/* Fallback to direct tracking on failure */
+			node->bytes += bytes;
+			node->alloc_count++;
+		}
+	} else {
+		/* Direct tracking for unnamed allocations */
+		node->bytes += bytes;
+		node->alloc_count++;
+	}
+
+	v4l2_memtrack_notify_change_locked(node);
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_add);
+
+void v4l2_memtrack_sub(struct v4l2_memtrack_node *node, size_t bytes,
+		       const char *name)
+{
+	struct v4l2_memtrack_node *child;
+	struct v4l2_memtrack_node *found = NULL;
+
+	if (!node || !node->ctx)
+		return;
+
+	guard(mutex)(&node->ctx->lock);
+
+	/* Try to find and remove a matching leaf node if name is provided */
+	if (name && !node->is_leaf) {
+		list_for_each_entry(child, &node->children, list) {
+			if (!child->is_leaf)
+				continue;
+			if (child->bytes != bytes)
+				continue;
+			if (!child->name || strcmp(child->name, name))
+				continue;
+
+			list_del(&child->list);
+			found = child;
+			break;
+		}
+	}
+
+	if (found) {
+		kfree_const(found->name);
+		kfree(found);
+	} else {
+		/* Direct subtraction */
+		if (node->bytes < bytes) {
+			pr_warn_once("v4l2-memtrack: %s: bytes underflow\n",
+				     v4l2_memtrack_name(node));
+			node->bytes = 0;
+		} else {
+			node->bytes -= bytes;
+		}
+
+		if (node->alloc_count > 0)
+			node->alloc_count--;
+	}
+
+	v4l2_memtrack_notify_change_locked(node);
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_sub);
+
+void v4l2_memtrack_set(struct v4l2_memtrack_node *node, size_t bytes)
+{
+	if (!node || !node->ctx)
+		return;
+
+	guard(mutex)(&node->ctx->lock);
+
+	node->bytes = bytes;
+	node->alloc_count = bytes ? 1 : 0;
+	v4l2_memtrack_notify_change_locked(node);
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_set);
+
+size_t v4l2_memtrack_read(struct v4l2_memtrack_node *node)
+{
+	struct v4l2_memtrack_ctx *ctx;
+	size_t total;
+
+	if (!node || !node->ctx)
+		return 0;
+
+	ctx = node->ctx;
+
+	scoped_guard(mutex, &ctx->lock)
+		total = v4l2_memtrack_sum_bytes_locked(node);
+
+	return total;
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_read);
+
+int v4l2_memtrack_register_notify(struct v4l2_memtrack_node *node,
+				  v4l2_memtrack_notify_fn notify,
+				  void *priv)
+{
+	if (!node || !node->ctx)
+		return -EINVAL;
+
+	/* Leaf nodes do not support notifications */
+	if (node->is_leaf)
+		return -EINVAL;
+
+	guard(mutex)(&node->ctx->lock);
+
+	if (node->notify)
+		return -EBUSY;
+
+	node->notify = notify;
+	node->notify_priv = priv;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_register_notify);
+
+void v4l2_memtrack_unregister_notify(struct v4l2_memtrack_node *node)
+{
+	if (!node || !node->ctx || node->is_leaf)
+		return;
+
+	v4l2_memtrack_cancel_notify(node);
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_unregister_notify);
+
+void v4l2_memtrack_set_notify_delay(struct v4l2_memtrack_node *node, int delay_ms)
+{
+	if (!node || !node->ctx || node->is_leaf)
+		return;
+
+	guard(mutex)(&node->ctx->lock);
+	node->notify_delay_ms = delay_ms;
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_set_notify_delay);
+
+static int v4l2_memtrack_print_visitor(struct v4l2_memtrack_node *node, void *data)
+{
+	pr_debug("v4l2-memtrack: %*s%s%s: usage=%zu bytes, count=%u\n",
+		 node->depth * 2, "",
+		 v4l2_memtrack_name(node),
+		 node->is_leaf ? " [leaf]" : "",
+		 v4l2_memtrack_sum_bytes_locked(node),
+		 node->alloc_count);
+	return 0;
+}
+
+void v4l2_memtrack_print_debug(struct v4l2_memtrack_node *node)
+{
+	struct v4l2_memtrack_ctx *ctx;
+
+	if (!node || !node->ctx)
+		return;
+
+	ctx = node->ctx;
+
+	pr_debug("v4l2-memtrack: Memory Tracker: %s\n", ctx->name ? : "(unnamed)");
+
+	scoped_guard(mutex, &ctx->lock)
+		v4l2_memtrack_for_each_locked(node, v4l2_memtrack_print_visitor, NULL);
+}
+EXPORT_SYMBOL_GPL(v4l2_memtrack_print_debug);
+
+MODULE_DESCRIPTION("V4L2 Memory Usage Tracker");
+MODULE_AUTHOR("Ming Qian <ming.qian@oss.nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/media/v4l2-memtrack.h b/include/media/v4l2-memtrack.h
new file mode 100644
index 000000000000..b146277ab98f
--- /dev/null
+++ b/include/media/v4l2-memtrack.h
@@ -0,0 +1,220 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * V4L2 Memory Usage Tracker
+ *
+ * Copyright 2026 NXP
+ *
+ * Provides hierarchical memory allocation tracking for V4L2 devices,
+ * useful for debugging memory leaks and monitoring buffer usage.
+ */
+
+#ifndef _V4L2_MEMTRACK_H
+#define _V4L2_MEMTRACK_H
+
+#include <linux/types.h>
+
+struct v4l2_memtrack_node;
+
+/**
+ * typedef v4l2_memtrack_notify_fn - Memory change notification callback
+ * @node: The node whose subtree memory usage changed
+ * @total: Total memory usage of the node's subtree in bytes
+ * @priv: Private data passed during registration
+ *
+ * This callback is invoked when memory usage changes in the node or any
+ * of its descendants. The callback is executed without holding internal
+ * locks, so it may call most kernel functions safely.
+ *
+ * However, the callback MUST NOT call v4l2_memtrack_unregister_notify()
+ * or v4l2_memtrack_destroy_node() on the same node, as this will cause
+ * a deadlock. The callback should be kept reasonably short to avoid
+ * delaying other pending notifications.
+ */
+typedef void (*v4l2_memtrack_notify_fn)(struct v4l2_memtrack_node *node, size_t total, void *priv);
+
+#if IS_REACHABLE(CONFIG_V4L2_MEMTRACK)
+
+/**
+ * v4l2_memtrack_create_root - Create a root tracking node
+ * @name: Name for this tracker (shows in debugfs)
+ *
+ * Creates a root node that serves as the top of a tracking hierarchy.
+ * Each root node creates its own debugfs entry under <debugfs>/v4l2-memtrack/.
+ *
+ * Return: Pointer to the root node, or NULL on failure
+ */
+struct v4l2_memtrack_node *v4l2_memtrack_create_root(const char *name);
+
+/**
+ * v4l2_memtrack_create_node - Create a child tracking node
+ * @parent: Parent node
+ * @name: Optional name for this node
+ *
+ * Creates a child node under the specified parent. Child nodes
+ * contribute to their parent's total memory count.
+ *
+ * Return: Pointer to the new node, or NULL on failure
+ */
+struct v4l2_memtrack_node *v4l2_memtrack_create_node(struct v4l2_memtrack_node *parent,
+						     const char *name);
+
+/**
+ * v4l2_memtrack_destroy_node - Destroy a tracking node
+ * @node: Node to destroy
+ *
+ * Destroys the node and all its children. If this is a root node,
+ * also removes the debugfs entry and frees all resources.
+ */
+void v4l2_memtrack_destroy_node(struct v4l2_memtrack_node *node);
+
+/**
+ * v4l2_memtrack_add - Record a memory allocation
+ * @node: Tracking node
+ * @bytes: Number of bytes allocated
+ * @name: Optional name for the allocation
+ *
+ * Records a memory allocation. If @name is provided, creates an internal
+ * leaf node to track this specific allocation, which can be matched and
+ * removed later by v4l2_memtrack_sub() with the same name and size.
+ * If @name is NULL, adds bytes directly to the node's counter.
+ *
+ * Triggers notification callbacks on this node and all ancestors.
+ */
+void v4l2_memtrack_add(struct v4l2_memtrack_node *node, size_t bytes,
+		       const char *name);
+
+/**
+ * v4l2_memtrack_sub - Record a memory free
+ * @node: Tracking node
+ * @bytes: Number of bytes freed
+ * @name: Optional name to match (must match what was passed to add)
+ *
+ * Records a memory deallocation. If @name is provided, searches for a
+ * matching internal leaf node (by name and size) and removes it.
+ * If no match is found or @name is NULL, subtracts directly from the
+ * node's counter.
+ *
+ * Triggers notification callbacks on this node and all ancestors.
+ */
+void v4l2_memtrack_sub(struct v4l2_memtrack_node *node, size_t bytes,
+		       const char *name);
+
+/**
+ * v4l2_memtrack_set - Set memory usage directly
+ * @node: Tracking node
+ * @bytes: Total bytes to set
+ *
+ * Sets the node's memory counter to the specified value.
+ * Allocation count is set to 1 if bytes > 0, otherwise 0.
+ */
+void v4l2_memtrack_set(struct v4l2_memtrack_node *node, size_t bytes);
+
+/**
+ * v4l2_memtrack_read - Read total memory usage
+ * @node: Tracking node
+ *
+ * Returns the total memory usage of this node plus all its children.
+ *
+ * Return: Total memory usage in bytes
+ */
+size_t v4l2_memtrack_read(struct v4l2_memtrack_node *node);
+
+/**
+ * v4l2_memtrack_register_notify - Register notification callback
+ * @node: Tracking node
+ * @notify: Callback function
+ * @priv: Private data passed to callback
+ *
+ * Register a callback that is called when memory usage changes on this
+ * node or any of its descendants. Only one callback per node is supported.
+ *
+ * Return: 0 on success, -EINVAL if node is invalid, -EBUSY if callback
+ *         already registered
+ */
+int v4l2_memtrack_register_notify(struct v4l2_memtrack_node *node,
+				  v4l2_memtrack_notify_fn notify,
+				  void *priv);
+
+/**
+ * v4l2_memtrack_unregister_notify - Unregister notification callback
+ * @node: The tracking node
+ *
+ * Unregisters the notification callback and waits for any in-progress
+ * callback to complete.
+ *
+ * NOTE: This function MUST be called before v4l2_memtrack_destroy_node()
+ * if a notify callback was registered. Failing to do so will trigger
+ * a WARN and may cause use-after-free.
+ */
+void v4l2_memtrack_unregister_notify(struct v4l2_memtrack_node *node);
+
+/**
+ * v4l2_memtrack_set_notify_delay - Set notification delay
+ * @node: Any node in the tracking tree
+ * @delay_ms: Delay in milliseconds
+ *            < 0: disable notifications
+ *            = 0: immediate notification (default)
+ *            > 0: coalesce notifications within delay period
+ *
+ * Sets the notification delay for the entire tracking tree.
+ * When delay > 0, multiple updates within the delay period are
+ * coalesced into a single notification, reducing overhead for
+ * batch operations.
+ */
+void v4l2_memtrack_set_notify_delay(struct v4l2_memtrack_node *node,
+				    int delay_ms);
+
+/**
+ * v4l2_memtrack_print_debug - Print memory usage to kernel log
+ * @node: Tracking node
+ *
+ * Prints the memory usage tree starting from this node using pr_debug().
+ * Supports dynamic debug when CONFIG_DYNAMIC_DEBUG is enabled.
+ *
+ * Enable output with:
+ *   echo 'file v4l2-memtrack.c +p' > /sys/kernel/debug/dynamic_debug/control
+ */
+void v4l2_memtrack_print_debug(struct v4l2_memtrack_node *node);
+
+#else /* !CONFIG_V4L2_MEMTRACK */
+
+static inline struct v4l2_memtrack_node *v4l2_memtrack_create_root(const char *name)
+{
+	return NULL;
+}
+
+static inline struct v4l2_memtrack_node *v4l2_memtrack_create_node(
+	struct v4l2_memtrack_node *parent, const char *name)
+{
+	return NULL;
+}
+
+static inline void v4l2_memtrack_destroy_node(struct v4l2_memtrack_node *node) {}
+
+static inline void v4l2_memtrack_add(struct v4l2_memtrack_node *node,
+				     size_t bytes, const char *name) {}
+
+static inline void v4l2_memtrack_sub(struct v4l2_memtrack_node *node,
+				     size_t bytes, const char *name) {}
+
+static inline void v4l2_memtrack_set(struct v4l2_memtrack_node *node, size_t bytes) {}
+
+static inline size_t v4l2_memtrack_read(struct v4l2_memtrack_node *node)
+{
+	return 0;
+}
+
+static inline int v4l2_memtrack_register_notify(struct v4l2_memtrack_node *node,
+						v4l2_memtrack_notify_fn notify,
+						void *priv)
+{
+	return 0;
+}
+
+static inline void v4l2_memtrack_unregister_notify(struct v4l2_memtrack_node *node) {}
+static inline void v4l2_memtrack_set_notify_delay(struct v4l2_memtrack_node *node, int delay_ms) {}
+static inline void v4l2_memtrack_print_debug(struct v4l2_memtrack_node *node) {}
+
+#endif /* CONFIG_V4L2_MEMTRACK */
+
+#endif /* _V4L2_MEMTRACK_H */
-- 
2.53.0


