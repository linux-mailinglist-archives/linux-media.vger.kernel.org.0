Return-Path: <linux-media+bounces-20035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004649A9D2E
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77B211F220C6
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E93191F7B;
	Tue, 22 Oct 2024 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="myPcoAjq"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7D218BBA9;
	Tue, 22 Oct 2024 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586479; cv=fail; b=BwWk+wKPlA91m5q0yKo1xQtVoJ2jQZd4ndTkU0Sf+GU4A7UR67h1L8zp24ihpdKCRijHvPRNOIKj6PEM+rOxAcHBv9mW2IY8LParCW9nz172GU02uMTGDnnvNCgYWTjIaWDLckn06dq9zy6w00+8EwlKGfoaytP5nXW4WRCq960=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586479; c=relaxed/simple;
	bh=V9uQS5qYmiXssOXx3/jo+h9bUk3tmEJA4+u5KYczP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/H46Ul1UrYYtO/ioJg2Ml0s3K6dE/G8ykBY7XDCRREq6pwxX7urp2EecHqhIUAfUevE9Q9kCfDYoa/oyZ+7GKfceCpYxTuk9DhAmgZxy5S1n9j8lXlJZXE7hpouKJlR6UdlpgjNEx9Oy4QUC03qJ56xm7YnyGmymzRCpwlQ1EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=myPcoAjq; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFm08aoultYe5Me/7HOCB67lvPUZOnhu6DZCpwL8rwchZ40Lp/fIClHiV7HxmawoazqX/P9BxhotA7IgyjBqa9wRS7WJnh/cZgbuUu+PThciE5J4O8BBP7L4qO1AEB5K0Nnms1+TPM8w121u+fTECO2/mTNaATZFNV8hg0R8t59/S8Sqbd2zDj/Tn0oIy1LM02vyXCbC1vGB+UgiQbXLuQDRjgce410Jca4JkbJJGSqMmzAYGHeOUWUsnVKGrZJxRMTg0PPBTcGCNz9Frn+B9VJslsierbOLCUGDvi8pgUt2GVrn2rntUHEdq+0Ahn7zk4iGu9WZ2hau8lNoWkNm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=gwoS65LnGeCLSl4Ieeb30vsmaieLeNN8NnWsUzYAC3yJX9jz9g8n/nCnPZMafSQg0FIpSN0QLaFrneqO4wZW2uj33YdlrVzmutAFGAqhY3L0oJtr0HDPEXF9E69VS2I3W8CY6Z31cvA/cs0kcv0rSJvLCJy27HoLkg495f0jvK29/WQ1VJTqeROEBUzwqcGD6sJmTLMpS4nPcmJcjjjsXvkMWY6oTBIz4prVgbRY4A5Xiz2bZ4yRnBnlzNpzDlSMT0ULXMWXpbrvskXmYqxJzCjyIli1+4APMeDbsWKqPdyzo3pv7R49RCd62FKgug/0VZsh5YyYNHZeyoE3UWmIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=myPcoAjql+9blBeXgyxhqoWnZR9LFek9o/P1LgUqk1bbG5XJ2fbIB+lR+CNCnnqSZRuk+nfdKRwAM5Qm2/SiZD5IqpEfwfun0KDoTGBm77RC4zhULHlQLdAR0+CHbkRWg+EQsF6mp56IgtFr7bS+BJsVz7pGrGnlKMy+aaOn4dXWM7l9SU8eiCaTd2R3JSk3XfVFApBnPVHlvwb5ADObgjIG13pLi6MrPH/tYGGOcUdjlpkQszNEw90tU52ZKu7+jsUiianjLPiyQJ8YbXBnL9gODUqfwXCKCyQEqHNiNick7ZGf2s4u6XY0p4l6yPUh9HoeFdI6B58sNAJW9UOZGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:41:15 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:41:15 +0000
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
Subject: [RFC v3 2/4] media: vivid: Add an rectangle control
Date: Tue, 22 Oct 2024 17:40:38 +0900
Message-ID: <20241022084040.3390878-3-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241022084040.3390878-1-ming.qian@nxp.com>
References: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cefc7c7-1705-45e4-cfc3-08dcf2754a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f57aSO1p4s8b+UvotILpSqMwQfAkr04tJhbGPEgWt+tw20SO5o8Rw2HPUffC?=
 =?us-ascii?Q?f8IkC9HjswTkbgjLSs55xxvBAByhXZj43Erqzo92ZmNcYyW6kVQJGiIZuwZv?=
 =?us-ascii?Q?Ixh0qFaIWgNJzCYndVxtIvE5MyP9TI2uLGVqT6bYFzSmIGtw2GluQJl2vVvE?=
 =?us-ascii?Q?S0huqbv46zFJ273MsolfT/d0L4WhVtqfS9rIejVNvzihlHzF1i0iCdc788J3?=
 =?us-ascii?Q?DAmzeu0ooAt5xThkc97ntd87ko01W8oXxBM+wswLg+PzlalmZYWDZVENy5/z?=
 =?us-ascii?Q?bUy9lk998I4PPPznZ4fN6nRVMswhCcGxfebh+ojRlw6dJsgKKInd7fVnYzYh?=
 =?us-ascii?Q?ukPHeF+k1BhOtHOpllDN47WIi7/1HB9cHbyM3RoQM6aLowpSf2G/O5xexvC9?=
 =?us-ascii?Q?MwLpJhbUUeUD5r5b/RH/Uch48rzQvXcHz5taDihetcmrPCM0028V5OkbHaPe?=
 =?us-ascii?Q?RDLxbjBtq73OfEFI1MlMY0TeOkAE2+k9zDMqXol14WG5x/tCTJR21Srlk/Zj?=
 =?us-ascii?Q?XQWBau4TjoDIGvZ43RXLqRSSkc7ebRUcK3R1K7ZMUJed+hGGrsrMDzFL5ik4?=
 =?us-ascii?Q?j1yZY31K2tlL8bWEOzpk7Qx2evQABEjux3Vxla+0ptAe8c6u1CMa/ptx00VG?=
 =?us-ascii?Q?/QJuBZaCoAk5y0shZW0ZRxOlVnGPNC8+6CQWon9FalfZOuX3G/7Nm4Aneyia?=
 =?us-ascii?Q?iAie3FqhnTOtr0Bx0wQS1JN64Nh+ubF3/Bi+bQ0eKMUrgY9uwU1p8R0VfJ3n?=
 =?us-ascii?Q?YJoUUyv9ewJXopDQOPL//YiW98nRBUt9Z3YNkkYIBDcguSlESrY0v6iyucg9?=
 =?us-ascii?Q?0rY6mH2GchQmpnk6qgBCkCv8765Pd+tYt6tGG7rEaCAmj9K+nbdwdzpQes3K?=
 =?us-ascii?Q?O++9XzUHmt6C9no5AMP/6I02rbCR9myMNeBYHnNPi3BgqWQdXfyXfL4QcUCF?=
 =?us-ascii?Q?WgVlTeKFwcmx4TlCydXFOHFjhcv89exOEOdSpPMHVtRnNWprzq9UJP7X8fzm?=
 =?us-ascii?Q?EQYPSKHbRLLAn0opE+JYKuYUSN2blO+bd7Ig8eoa0y8192eplSJAYS4fK2Av?=
 =?us-ascii?Q?iaPtg4TUyxIiUrHkLcAzD2my+beb2T1bo3I05jtrV4mvbbj0V2QEasOJZzpV?=
 =?us-ascii?Q?qbNKdZ+ypUAxtAD1zKqSYQp//Kjcjid66GjWeOQZm9BPW7fn7oC7z/X1gssP?=
 =?us-ascii?Q?BOANvOuFjCEB0I3PK35KIJzTS+mISiNn41HP2Dv6xxW232bjE0qCdo7y2YIc?=
 =?us-ascii?Q?H40tx7hXLPFeuXa8GxQMd106/tbWN+YCWuy4k89FYbUvaY0T4jZnFw3CaMoS?=
 =?us-ascii?Q?k1cb/X0uuSIp38RzP2KzCWJDBWW0MY/fGPWKwQCTqxtBRcQvAFfhBmaVbdQt?=
 =?us-ascii?Q?HVYEnDA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sHOAKYuL3ed3Sg8Q/NMPGCmqo1UuoBqOUWe+uHFXmHI6GsBSWSljjOrRX3Tf?=
 =?us-ascii?Q?LZCTXilFoQx/W/6PnInWeN3F5ycgrxIV+O+8fAdo8tsKWZCq8HDVX4xwfCY5?=
 =?us-ascii?Q?vr3FcT6uOWNUfMJuVFN+XBccoHccfgyuSg8L8/Rp6bj8/6QKDE426D5LzSGv?=
 =?us-ascii?Q?taXiNAYg8VEXGzP14cDsXeDyuuJ7OMFd8YKndejh+y4rCJcQMKeLfe3lIkPT?=
 =?us-ascii?Q?mQ5OndP9w9ZFxo6iD/ElOwnviHgMlVXucjlWFkUYT19Q1rz9BZd+ZzFjlm4Q?=
 =?us-ascii?Q?U2GmYm9BirUlMczpYj/cLJjXCouBxepPGdjjaGwBwLZKYv6NSITEWSJIgsqE?=
 =?us-ascii?Q?42qrN1MJdl9NHpNKB5CORgCOphDIb5iLM4flQj5Pwi3IsGLFtmSv+cyPpBU+?=
 =?us-ascii?Q?NrZCJMTNUVaEITV3v16NtZ4zDRFPrjFsiHsR/Bs8xQNEsZ25/1JX5ARqORb0?=
 =?us-ascii?Q?9ULiwHVnPO3c40aZt92u665vEXVFi0+uzbVzuWRu0zVoLMUtOQSSVXnp/fCE?=
 =?us-ascii?Q?5JIIu/OQKpuuDNdouCCtpI01aM26IL3Al8i/NAugUAO2jzCHGNNfRDZgEsgR?=
 =?us-ascii?Q?USf1gxeoW84Ol+6eRXq2L+XcBrwAPjsOqQM5EEqmgy8OTKifVrElTKyDLvsH?=
 =?us-ascii?Q?8mAcGpFPU14m2Tu6keY6K+uMdh6PJbO9JxhwY9cS7Nl7vMGWHfwB1r4d3mFS?=
 =?us-ascii?Q?tbH3rVDNOd3almoiUq+hwUHOIGvB9YZaU5peFr1R6tJzxNkziUECOgaALwic?=
 =?us-ascii?Q?efNxZBam2yyNTpY1iz7cYN6FNR99gwtPdp7KSUkD0PatvJzLPGGNROb5o1DS?=
 =?us-ascii?Q?DS9XkzHWfYKzZn71ghAbhWGpn6mcaJIQOxtCyhKx3HJY1VtKQFI5ZZ2QLHLz?=
 =?us-ascii?Q?5skFOBQxyepG4MEOBrF2+5dTvwzx00SMNM1i8oWddQ/TQOht48Yz76vOXAfK?=
 =?us-ascii?Q?DK5zocjpsMul2CDLEXwaLtp0CVI+tfiRnzOMX7to0VWXK48XSauYXWRVELfD?=
 =?us-ascii?Q?VfDLXUC/0zl6FXaLXnEdyLWuWC00DjTIJBY8k8eTvdh+dLpSPr7kMNS2+yd4?=
 =?us-ascii?Q?wAAqRbTPR81anrIWWBZdoAv/sQbSxPZsp4cY0Sh9zrKQLVzkI/0t1kNVubk8?=
 =?us-ascii?Q?pX87VETiCNJyEZgMM7hEFmYObaqI/7UaMlxvYVcgpz7GUUmDjTiO+e/q7OXe?=
 =?us-ascii?Q?55AHUwnNxaWJ0Mqh06DKB5wfDrmHOMJqfmXFG78SKwSS20bsJPT2cd4BhvX5?=
 =?us-ascii?Q?dFM5CmlnFvoac0Wgpqn/C5hNWO11JydkmF6dRk9SH1qF+JhqOO+T+RSWhB/U?=
 =?us-ascii?Q?u72sZ3VoeuGkcFbW11iHz/fJuD6sBGpOepfunNeZUPSF9EjCZnONSq9sRCj+?=
 =?us-ascii?Q?BF7HRpR4HFBUH+0OhF1nTp8Bqz4+dJjfLGeZo6FcwBDwpyaz+uxobn69XJmf?=
 =?us-ascii?Q?UfCqoMker6426A8F99XMSu1bM3kqRsLD+xX8AHVa1UdhZvqZ+h0Stx0hN0TR?=
 =?us-ascii?Q?7v8U7NiAUc2NCD8V/gT7s5Urc/CJklOd03plRTDkOZSJtfiFj7jCjXbg26vo?=
 =?us-ascii?Q?oqgO5fsWfWJ0Pb4Ss2ReseJpu+0jyvFVKfYg2OMs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cefc7c7-1705-45e4-cfc3-08dcf2754a39
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:41:15.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMBk2wwTiOqlAA3HZHUSjicFPVbAjsTke/qUVBUYtPQkzj1IMNkm8t4ckh3/wkRgAd0fg83oUIilhilUXjWJdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8bb38bc7b8cc..bed5f4fb0c69 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


