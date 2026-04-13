Return-Path: <linux-media+bounces-58676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COy6N4cV3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:10:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA33EE649
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 435633072A8E
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7F129E0E5;
	Mon, 13 Apr 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E5AugRrf"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE42773F7;
	Mon, 13 Apr 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096288; cv=fail; b=Yp9c8egi0qltvMh7jtB4o6tECVqCpyGbV9VDIKiTYoGRFXstEZgcA/BN9Q3wKmtRi3kWhx9wzHpOqi61PSry9Y/C+ew9hp4LlyecQNrzbtbPAMrS1ku11NxKFnf/2Xxg68Sh1WX8en+Vtr2xD5FP5GDRBXxNqCpEzzihbXTYocs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096288; c=relaxed/simple;
	bh=qlxD64rLbxhAFYSR1tBkFDunpvxgxNoy4JGaicTnptI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I8EY5rUmjnUzXQjovjIcDZKPnYqKle1ptxp3whFz5JfFzElgbv7+IUZ+ZQtMidf2c4WsGc00rubywepyhaUPX/B3eV61t+tm6/sr0royl1H83ZQKhkk80Gtd6rfvoivXnlwXST6M6gUHzMpbHs5PezIWiN9Jy3N4SUs7qOmONek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E5AugRrf; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b628HCJx/oIXkOsNiou7B9bqrMQXIgijI0UdFDOeEtI7wBvW/3707lfCLzXEdoTywcfvD/adQWWY3ZQKZ60qTMMVIPp4TP6La4zvTSA+0Vl8zdeTF/tRn8uVzvqLMGcOre0UTBWe4QW4y0HyQ+JSTMaflEGmjwBpbQsVdsWMRCBkciLCZaef0eAoYgbf1xqjR8HzKH0OFPYry/o3Sgq0BSrCSS+HQ4ryPgRPdPzv+ge2APk5QA/R5hTm+iOpAfbI19yy+plgElqec9m3dg5QtMSie5IjiJEIqPjEU7aa16bj8YpyjmlYc8MBlbv4nwVqRO6CsxAmDTghoU/4xQMAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I27BI+fdlVPHzeh2g4yxL7HaCtmRAkr9Z57fdF5pJY=;
 b=bDgcmjDrwOeJW6RamIqBjsfh65wv9py440/yhpyjEG+lSQ4aIT97tOXYryHoHvWrKZC8ZX3J/lVHMiWWzZVheoU1Ftm1ZsMSTCAmwhdC96wUu2psGGp976VMD1sEi0wBm1xv+EGOFmbdzS5dcGSObZybdnYtBE3SmpPsmeMzLfV4smA3TtzCSY6YSCk5huEAPKcoh7nA/G3O2nj0TbkwhZG59SJBt+gxRnIlF9JxLRO6Tn9lD/7TJ9I1/MEBVGyDjlxS7KrEjykhOCuWluZgrgPqhTFTU3huK0/+Tp71GiHwhp88WFz5JQF4DFJ3vToM2VCn8j3jXxwmSk0C4V8HUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I27BI+fdlVPHzeh2g4yxL7HaCtmRAkr9Z57fdF5pJY=;
 b=E5AugRrfOs2axa57FVEcmEXG1bq/wSntGdoSoMznMhlp5twyFhgitdaubB7qreg3jjFI/WT6tiddwPkJ6jDxIBEVfiFE20j726RZi4nkegO607vCoKguHqd/+lxdmrXEZ875YZ54Yk2ECd8qG/JXruHb+KcY+wooW+5Gjti1tF/2hCZCJ4m3efn/AXA1jWu/0AIVTpLnFAQxHCF8L3z5rBFAelXftEWv63P3RFkpXqbjuhSB4TrOQc2RRY5SkbkRfplWORBMbnTL7xkI/lPaPQwzXxXrtnYp+FajL6jPR8lFxrwtbnhLioM0ZO1v3Ypio9NaI3MdROiClTZYjYGoOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:37 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:37 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 06/11] media: v4l2-ctrls: Add user control base for NXP neoisp controls
Date: Mon, 13 Apr 2026 18:03:26 +0200
Message-ID: <20260413160331.2611829-7-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: f10748cc-971c-4fdf-db3d-08de99765cdc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 Hv7zGQ/ANA+w79Jfy7KyMB+ZfRUOonEJmD0PAiJvp5UIdssSsiMIpzGowiWDfGa4ZtGGuyrBDIwtmDF9kckxmRE2NQ7Ue0uSeSWuuf+yeDEcVepQHcW4SLF8O140sjp2ebjAFkkgpTopT69JpsM/cKC57KqZaF4yb9/2zrB2Uo9FMHK6JKIaL1o13y93qydPv2LTbx+EyNw5OPMXQuOKB2pVWDf3VYc8kIy3NVSZi8fbg40in4hfO0QQHvj3Cg5/wILVOJ7iA3drE5qCmJm+3XnHOCCrzX4zGdUbLn0XfW97+RfZMFxMcqZ8qmp5gB18pvxsfqo1JoNRuMVbYNeKooLB2SNhJM/ykrZchJZuEml/Wx4YTIYpXZtLWs8Xf8SOvP6lp3BTMLyF6858EJJf7pzzPhCvNhvS+doNPuu9iZwqe++FR8CPqsk5OrazKA5K+IpKoVQDolUtXc4rKMoefecVq3BrOsTyli2JU8RmuvN8fXI68t0lYkTymu4FBWul7o+zCj67kRPJHLXPfPxQq6nvLa5HJ0jtonhDyMAoDsvNlIGkPaagA+ilxx1ShNCtq92ESebOIg7T/AMpLTkmP7Nez+IJiQZ87hMDoXtYQpV3Z4enqusgpwNfZMkHcTEBVkSDahtxiwotxcKCQ3fETNdkTxuvdNvw1hOOKakDjAknaFxmfgGKg8nVmLoUI5e9XJAWYfqN454bnQZ3FwRDHTfdJ1BpTuhJ/yslF9FEvCtX47m2uRQx6B5pbbc0KZwih2NZcFCQKFYO3g1O2xsBIibavt7LYoaCMv7k+2gOImG9nce2KI8tk31z2ogAf3Cb
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oRAP02wMnNrjkR24/tNLh+zdQG7uP95n36C3AQ7vql4xs71Gtyu1N2PdutqC?=
 =?us-ascii?Q?pYlTsGhvdKhxDs/O0+7I20ygfYrlLbrtwoMZ264EfhdyEoIqUw0kWdLMV8+V?=
 =?us-ascii?Q?8ecT40SGWel1dpoGGxQ0/QMKvDFJdOoBWYtRFMSPGsy7XaYy/cv/TtYrzti1?=
 =?us-ascii?Q?6U3C3+/6T7lqXz5ALPIrCXx2nYXx+zgT5wK6BSXdq6ufcbuzKZdI2XE4KkY0?=
 =?us-ascii?Q?RwWINisJgnbr7jb0TOv6haM2B4bT3OuI9QGwZSvtHvV9U87d6/iHsPC6ljix?=
 =?us-ascii?Q?AlbQM/UPSFB/goMMU4w6s+fj0ksvzhS5Fg4erZHKns9CyP5eyXghsQkp1LED?=
 =?us-ascii?Q?sw662FaWW7JPa5ufY9HMCAynkTfPaiQN3J+SZmQ2cCotBy/yjTOAkapzsQyB?=
 =?us-ascii?Q?8RRtIVLAEiOCrNERIKw3pZQiQBhWVXCk6N57uenxu18mmeSsKjEAxce2m9hp?=
 =?us-ascii?Q?25OEMt7BVnRe6RdRUbHIOBKsxrjuZmPxImAPRJTsyL7mMIYBkM9HtvvlMtwp?=
 =?us-ascii?Q?H7Rry+GH1i+y4eBMGtxfrotB0r87hBY4lG07MgpvQw0T5Q1i6Q45mbAgpNuH?=
 =?us-ascii?Q?s0VNeNlkpvcep+Xvg0HG1b3mkEn4JsjBECcxkPcgPmUssEQBBTqS5/gp4jPF?=
 =?us-ascii?Q?6hHgc7eQFbhgfEtjrJhBs1xaDyMrrZyKB/vfI8ziRzAjS1ppVdsDBjju0VKs?=
 =?us-ascii?Q?TgaCIJZqGBdJVpLTRFRtStoLbjwf0UCJmSwktsaYBcwTftz3Z8pfiVEBTw2W?=
 =?us-ascii?Q?7ZQ1yRsFe9OiMRt5X3z9bYCT/bxFy9a3cRT39T8d2tpFLVP/vqirvX8d6qkq?=
 =?us-ascii?Q?0iqUzWDTH1xHhzhc9KSjWajzpEA2MR7WxuMs2IABm1O9xkn1FYJ9ILRomDHr?=
 =?us-ascii?Q?IlCFUvP/LxzuSTEatxHKAnSf0EZGhW8YOrLjLNjsA4jHdvnqz5Eigs1yDRmx?=
 =?us-ascii?Q?E052oMoPB4Ro+4sUiG4DjeudXzDpyFxBhC68TW3P01lJwne7pf19Yf+/F5oY?=
 =?us-ascii?Q?t4iA0aBlP+pGS1QKd0OMZDgq12pEv+dja80uNyvtRoA594dxJM8p1iBfjaNM?=
 =?us-ascii?Q?P9dHZ8T1sPtk1aus3q1I6n0WwcijJUMHYHcIEVznGpsm2N92EKkoCCqb5B+7?=
 =?us-ascii?Q?9Or8VnLBbcliB+itDGi3pKMJsE5SJBZRr198bKeY5knI2q/yhPrYy/lurZbv?=
 =?us-ascii?Q?L0udwoPhWDJaPiTrqNA0kK1k3cFZktZxt2yp8FfDiK25F+bAAG9UVPQOVolA?=
 =?us-ascii?Q?qEVMVu9fFrn+uqk//bOJytRDUBKpepqyEaeSr8LzydxSp/PO3+NNH19IBE/q?=
 =?us-ascii?Q?W6aMeztxUVlMbNurth8xdDXb0CPplC3ISUgKh9WPhzLbWmveK2Gtr8jgfk7S?=
 =?us-ascii?Q?joMkEjWC3pDgbY9NULg7ku3Hr6XMQOTry01QcGWOhNeEExIQPIwn1LvfUPlr?=
 =?us-ascii?Q?JmCM4fwXAaq3XkHfJQtCe3xBDxsBpRUWbGv3DQA48wu+TkpXVBaiNIp4CMZp?=
 =?us-ascii?Q?k2jpS9NPkzRGZMBM4hHeLSX6G0m40KLjxxf+lGlfFcWSE4d+9ghngHIMAYKr?=
 =?us-ascii?Q?FWUjtKDzY7XYGlZgtHYdgI/2AO4lGXuoZS1w+Ei+nHwkONGIIjXxyBTPXbDQ?=
 =?us-ascii?Q?qO5G9eTxkErpBfdlGYgFgaSUtmQeZ7/GpKkkvS9fCZChvH8NkWRzVUSliHZF?=
 =?us-ascii?Q?UT9I3e9J66Ot25TeDV6yZ6zsOqFBwKUaYflYzsE5z8CCUHGrSIqBhP4Vn8Nq?=
 =?us-ascii?Q?F9+JgEhlMA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10748cc-971c-4fdf-db3d-08de99765cdc
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:37.8159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sncBzmd4CM5hG44BNF9bHIstlmsqUS3Cg5UaneqL6md4CPnTKDRgShDgnc32njHXgEMH3r7/QLlLiIu7OnQlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58676-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 5CEA33EE649
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a control base for the NXP neoisp driver controls, and reserve up to
16 controls.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68dd0c4e47b2..3e32e5651ac3 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for NEOISP driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_NEOISP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.51.0


