Return-Path: <linux-media+bounces-58674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P6TCaAU3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:06:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 284593EE528
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B530A301F18B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1102BE048;
	Mon, 13 Apr 2026 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Cni3WWMb"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A571E282F25;
	Mon, 13 Apr 2026 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096284; cv=fail; b=a90DSn4JyADseX3eP50PwUY8rEg3omshXoAU8+Dwo3Nuuqj+jJFcSZ82CIlLTbWbJImKbe2pk3h9rGfTv7nhb3jHbKFjTnLWDN2/+jHmFbjLjkKBLpZQVbyY/dxRvKPN3quV+UmF7p/l09+rqK5QZOyLZ5tsWn/4P8s9tWv9Ld0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096284; c=relaxed/simple;
	bh=9r12d28JGhuWeE+DX+ofkUIPWBkKK3oaeCRPlzdy7Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oDd828H88cfzAVgSTY1dJrscVn9CLV2Aij0gTQgmg2qQA5qTfTF3HFaFaqJQ3AaqbirFUxAh0xKNX+raygCv5ByuGpPWakogUJ2WUH6TuqAFeRf3773mBwAc3ll5K4V8DQKOKtrVaVcE8Aq0XUnnixk7ZNW07fgSkm1kob9vXb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Cni3WWMb; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6HaLY3f7LvqaAFc7dKSu6vixvI6PMVPnOVCHUOd9aN5IBe+0UT2Rde3TyKwUkIbmrLuu/E2wYuZSBNH+Zq9gbghvK6WqU2iS8xRaq9BmmVxB4LL6jeYMrkoOvJJ0Q/FdK+OFjNy+4QdtLRIV4ddi7nml6NB+vdoPOurCG0GMebZIRUDk5LgkEmC3nx+i7WgR9cmo44cmlWEu8Lpff21DOikRLE2DNx7VHYPZrAk0c/SrigfI+0hvu33s2mJUXLkcKtVE7E3yoG2kQ4SZs5zONwKuSWS4CeMb8wpCdRR9s6x5Fp822FIMvEnmt0iojtEzx7vvMZ4dCbTok3pnt2iOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bahP9F8keN9n0zSbC523RUzo6YHavp63On13FiV0LR4=;
 b=TMp75Y0fZVhZgPY13aUwhnHm2c/UYWigqISxN56z1+Y5XSoG7fNNzAo/jSTJoTRrcUH0dSk8eAthDvJbxWzad5R5Qi7kDjNrkj8Oc4PUfBCsgeZ2nOvKX5cMAD4ck70BghIag3MJULYg0FnDN1/v3pHAuvy/B2EHYksyMETm3qF9PEfdmWy2rEjp6AX1xV9MBpJfk2Xq0m4TRV9OmYC9e3nZdCDptb0R4j2iEfrFZ3RmhrX+YsoN8o+ztdsmA//c4V/mHFClHIz+Ac2tdmfaP3L2PWB35ZQFHPfbd56Dn2Y1S39rrraZKntfvDwLVLHEgAo6IlyEFVhpJS0UV5tpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bahP9F8keN9n0zSbC523RUzo6YHavp63On13FiV0LR4=;
 b=Cni3WWMbLioPw9qeW1TvB7FSjfahaLbtvigdfedIiKK6lwnJif3EOMFfru/uB+msH1obb9JpAIJKMbTwuwv9CHSRB6621lo0czLNt93MA4c00ysA4mqn43H/PUTIjX3gFFeRIKPFFLbRS6CUx06LM5JVed/y8ddC1gkkwrfxLYRSdX1KQNRnI+3GsKjxL1pDwhwirPGWc0Xn08f6S9y+We/P4X9qim96DEN8e1TJLweFozcCk36AAMWFzBCs8ysp4uL5T6qAPb09uqHeIkpzcwsZKOD95BWrStCJhq1LqX8KagTtG0Jnftvhr2ScBvtzchqk/teoeCsyMRcHX20Zmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:35 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:35 +0000
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
Subject: [PATCH v1 04/11] media: Documentation: Add NXP neoisp driver documentation
Date: Mon, 13 Apr 2026 18:03:24 +0200
Message-ID: <20260413160331.2611829-5-antoine.bouyer@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2cc294b4-7ed8-49f0-79a4-08de99765b6c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003|8126099003;
X-Microsoft-Antispam-Message-Info:
 oUJ6Hl3X/cbkCexED9FFXeGnGD/75xSxKKv9mCv4HGx/pdBmhO9s3L8lTYIvYjQTTVvLiYgmT/cO0sXiWohn03x749LF64GWB7AucNoTGY/n7TD0eRAXKXvEPqHOKc9YRZeEXdjxAI9zStjK6gquTb+saYLjT1JsGBBTTEn71k1yxHXVmS3VORXK2rsTpo4G8OCsIcaZcguWyDG2CVUQOke9XSOB4thpKrvIMf/ygn5tBKKfwcPATdmH6Z00NXzjMt8R8T8o4dDW9h4nB+WXnUHcf5Mu4FA6SybBKBp/mDoRDtufpNQfcj64p/qaH4VBEcIFeFm/lwInVepjP3ownloYfP6V71G+XV7Gt+as4sddwh8UOWQdb6U1StM2axfjgyfbAr/WK9ifj2XdZFgoGhgSFdycmGSbNFO7qJ7x7yuV/W9zs+mSQ+sS5/YK+SWqIoArmopQEo50wyOJLaEHBFLeAktTbywUl1gjCdMrEIGSnes85BJ80aeNdyFVMPh6iZkLIl2WgcFa8qoSTLwjyHi/CLSLhMqgdxlhxS9W18ALOvZKYrvwA0yTdSB9CgaUAWW48gC9iJlIasQE87vHLWsPohxrf89I3IzajIAUZOoT0y6q6DZCYpXIoubIrvSUgYxqSbbxO7nvQ/Otbx1H+JSXa/GbRKIuEOlF1eP8415I8zE9iOa5XDvDCMoZsjMEaqyhKUhD12bt1IPr63d5beu+DXvNunXg4hdkLPmBmYL8MRprgNE3yFcLTz0AurJtJWbD568PkadSiL7wwFk6hxqP60qyRfnIgmXkGsFP1nn9YTu+Yem0pY3RWPHKRgyp
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003)(8126099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?wzWlJjSvWlLdUuJb/GRzvDjewKEgfSQ/0Ao+WKkfIDQ01BAZ2mXdjmRoOcYT?=
 =?us-ascii?Q?1CY0OBTTF8Pfx8W9pLn+A31Iy54tdIqLNcXn5LouduRThh9use/ZqIKNzbZ4?=
 =?us-ascii?Q?MRbnGHvBE2Eafa1Ca+kmInFvGDnkoyh9TNO+HYne+OaMGnaQHxyBOtnVRgz2?=
 =?us-ascii?Q?nYdcPiQOzKUAgN+dCib9iR4vLEI623+1LaU3C06Fu/Yo3W0NvL3jd0s1fwbi?=
 =?us-ascii?Q?5Q6GZMmEdjk4/ISLYkzsOhnBcnd9ZESxBnnfUDLNUgyK3dw7+vhkCG6/7/aE?=
 =?us-ascii?Q?0jD1YTRGOZWBPRNc9MauPxrTIuUiAqpDQ8z6W4Y/SPFmNeztKnt5vY1FkZnY?=
 =?us-ascii?Q?Y5OXCzIr73i04ZNncxzOI7z8IHEavu+M4mOPYKOmlC2gXDMe5VWuVJEToina?=
 =?us-ascii?Q?osoZdUAR5BfizLVsX4gCP8bQYRCpH5Xk0P0uNEK/EPgWa1FRQ15AwJvpshgX?=
 =?us-ascii?Q?62AdBBOMX+WOth9pgUe7KaiSq6C1brB6pM4Wdy4KXydGlyjV8m+uSFndV1Ey?=
 =?us-ascii?Q?bBbVXiKbQv1JriUE55w3s0Ub4cDzDA3SPiQkB9yx2h+DJLG7Bf/AW68YqMRK?=
 =?us-ascii?Q?et+KZ8tonwAvEPPDwDI4RJPOwQU9MnbhDXNpi2k6Df1ABNElpGd2ndXKWqSy?=
 =?us-ascii?Q?VgMH8imCa1vhbCRjrrlmLdpjTfMry+6Gi5V1CwLKfly+QUk+lipcHN+s1okQ?=
 =?us-ascii?Q?rlZsrWblzvxlQy4rU/IHdCMtUhC0p5V8j6A9tYNp2CIhIzpK95BaUzBPtvlD?=
 =?us-ascii?Q?t/3zZO3eMhf2mfY33DWUO5g5Djhcv/Hc9V55xAqLvKijZK+4gdfLgFDroXJD?=
 =?us-ascii?Q?qB3PL6wxwIGbiznxUhk+Vylepnx7+Wu4zxfukgK/VPG7kvoxYnOBJD2nJIih?=
 =?us-ascii?Q?6ZJjp5L0sBQcY3eYZILeYJyQkbeFBLzfURtSVdYoIyqtbWmCVfYKZihoOF2E?=
 =?us-ascii?Q?IkztTc5nnmz+iQ/qFgj43bQsXInrUv5M2AEHKbW0zWWcUlx2Hv13QnYCAWh+?=
 =?us-ascii?Q?0ZDLxANfC7tuWtLLygslvJuPVfHE2PZJdxlKQg8VRg8dmjSJMD42fojGVFwz?=
 =?us-ascii?Q?EX0YpWrICv+gO8a82cX2YKH15umw1BSgDX4R1etxEyfR2ceWFc9V69fGAWo/?=
 =?us-ascii?Q?iNigIGqnC5InqN/VZsZQ/xJ+zLKEzn97ukwlrNX9jHUnjwAEY/PSZp71aOC8?=
 =?us-ascii?Q?cdWzvT6hz3LhHMypKCaqwvrQEsBu7LeJUgihvFtB0RKIiRbv+ik4a5TxiuDQ?=
 =?us-ascii?Q?Nh37jtmjO32vqHRj3rwmQayQ7EghNGFMCH6YjQr+RkaG6t3X3Ls15Ll4DKyB?=
 =?us-ascii?Q?yhPnQsUh4LWuGmNgVF58+N0Zwnlkta4LTcLFz5rRJtDy71j67Y3Ya9IhBUZ7?=
 =?us-ascii?Q?l+8mYW7NJBLlY2EQ4py//ehjermSl80nh2gbTGIp+ZIc8pwusQnAqUAz5xzf?=
 =?us-ascii?Q?FryWWUsy//IPwVMUQ02u+h4Tkp6C4bcccaIGN2o3ER3PtC31aAsvoLB6HsnP?=
 =?us-ascii?Q?lmnkWh/aRth98kgvhfY1nq5giGZ6zrdmWdwWe1NVtY1H4xYqEukqkVePM720?=
 =?us-ascii?Q?emFJXAoBxZqHFfvuLLtFZkbdUujLDHI00mFovgVPuHiFoPUPEEdEcQQBxypL?=
 =?us-ascii?Q?r35H6Gka/0bgWSXaMNM6Q6Nf9yIWicBAVUHLRn5FeztnsMuKRpfF044unFSN?=
 =?us-ascii?Q?yLHKViP/mMB4udGlzaJsBOVhTPhRy5sMqP5R7X7P3reNjxgQ5BxZoUSurAkf?=
 =?us-ascii?Q?3u3W1biwWA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc294b4-7ed8-49f0-79a4-08de99765b6c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:35.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+NirNT3DDwl21Z/kggIfYvO/6PMZyZTlFDV07NMK9t63uMbd7elKHy7/APeCMDk86eaU3/qxm5NZj1Y5ZnxCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58674-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp-neoisp-diagram.dot:url]
X-Rspamd-Queue-Id: 284593EE528
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the NXP neoisp driver both in the admin-guide for neoisp IP
description, and in the userpace-api for neoisp interface description.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../admin-guide/media/nxp-neoisp-diagram.dot  |  22 +++
 .../admin-guide/media/nxp-neoisp.dot          |  16 ++
 .../admin-guide/media/nxp-neoisp.rst          | 179 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          |  70 +++++++
 6 files changed, 289 insertions(+)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst

diff --git a/Documentation/admin-guide/media/nxp-neoisp-diagram.dot b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
new file mode 100644
index 000000000000..ac0d950bc1dc
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
@@ -0,0 +1,22 @@
+digraph G {
+  rankdir = "LR";
+  node [shape=rect];
+  splines = ortho;
+  label = "Neoisp pipeline diagram";
+  {In0, In1 } -> HC -> {HDR_decomp0, HDR_decomp1};
+  HDR_decomp0 -> OBWB0 -> HDR_merge;
+  HDR_decomp1 -> OBWB1 -> HDR_merge;
+  HDR_merge -> RGBIR -> IR_compression;
+  RGBIR -> Statistics;
+  RGBIR -> OBWB2 ->BNR -> Vignetting -> ColorTemp;
+  Vignetting -> Demosaic -> RGB2YUV -> DRC -> AF;
+  DRC-> NR -> EE -> DF -> Gamma -> Packetizer;
+  DRC -> DMAP -> DF[weight=2];
+  DRC -> CCONV -> CAS -> Gamma;
+  {rank = "same"; RGBIR, DRC}
+  {rank = "same"; AF, NR, DMAP}
+  {rank = "same"; IR_compression, Vignetting}
+  IR_compression -> AXIOutDMA;
+  Packetizer -> AXIOutDMA [weight=3];
+  AXIOutDMA -> {"Out0", "Out1"}
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.dot b/Documentation/admin-guide/media/nxp-neoisp.dot
new file mode 100644
index 000000000000..abcc2dc9bb55
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.dot
@@ -0,0 +1,16 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2} | neoisp\n | {<port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n00000020 [style=dashed]
+	n00000001:port4 -> n00000022 [style=dashed]
+	n00000001:port5 -> n00000024 [style=dashed]
+	n0000000a [label="neoisp-input0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000a -> n00000001:port0 [style=bold]
+	n00000010 [label="neoisp-input1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000010 -> n00000001:port1 [style=dashed]
+	n00000016 [label="neoisp-params\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000016 -> n00000001:port2 [style=dashed]
+	n00000020 [label="neoisp-frame\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000022 [label="neoisp-ir\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000024 [label="neoisp-stats\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.rst b/Documentation/admin-guide/media/nxp-neoisp.rst
new file mode 100644
index 000000000000..64876612065d
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.rst
@@ -0,0 +1,179 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+NXP Neo Image Signal Processor (neoisp)
+=======================================
+
+Introduction
+============
+
+Neoisp performs a set of image processing tasks on the RAW camera stream, where
+the input camera stream and Neoisp processed output image are stored in DDR or
+any system memory fast enough to keep up with Neoisp processing.
+The overall Neoisp operation is frame based, that is 1 complete image frame is
+read and output pixel by pixel, line by line wise.
+
+Revisions
+=========
+
+NXP Neoisp driver supports the Neoisp V2 hw revision, used in i.MX95 Soc family.
+
+Neoisp hardware
+===============
+
+The Neoisp registers and pipeline processing are documented in the NXP Image
+Signal Processor Specification document (under NDA).
+
+The NEO pipeline block diagram is shown below:
+
+.. kernel-figure:: nxp-neoisp-diagram.dot
+    :alt:   Diagram of neoisp pipeline
+    :align: center
+
+It is composed by the following HW blocks:
+
+- a Head Color (HC) selection block,
+- two HDR decompression blocks, one for each input,
+- three Optical Black correction and White Balance (OBWB) blocks at different
+  stages in the pipeline,
+- a HDR merge block for HDR image capture from the 2 input lines,
+- a RGB-IR to RGGB converter,
+- a Bayer Noise Reduction (BNR) block,
+- a Vignetting block, aka Lens Shading Correction (LSC),
+- a Demosaic block for RAW image conversion to RGB,
+- a RGB Color Correction Matrix (CCM) and Color Space Converter aka CSC or
+  RGB2YUV,
+- a Dynamic Range Compression (DRC) block,
+- the Denoising pipeline (composed by multiple blocks for Noise Reduction, Edge
+  Enhancement, Gamma Compensation, etc),
+- a Packetizer used for UV sub-sampling or RGB packing.
+
+All these blocks are controlled by SW through registers. Some of these
+registers are accessible by the uAPI, so that usespace application and Image
+Processing Algorithms (IPA) can configure them through the parameters buffers.
+
+Neoisp driver
+=============
+
+Neoisp driver is located under drivers/media/platform/nxp/neoisp.
+It uses the `V4L2 API` and the `V4L2 subdev API` to register capture and output
+video devices in addition to a subdevice for neoisp that connects the video
+devices into a media graph realized using the `Media Controller (MC) API`.
+
+Driver provides a core registration API that allows registering the neoisp core
+media devices into an external media graph. In this case, the neoisp is fully
+integrated into a main media graph which could include other subdevices such as
+camera sensors, crossbar routing, etc. It also provides a module parameter to
+allow running in standalone mode. In such case, the neoisp registers its media
+devices into its own media graph.
+
+The media topology registered by Neoisp driver is represented below:
+
+.. kernel-figure:: nxp-neoisp.dot
+    :alt:   Diagram of neoisp media device topology
+    :align: center
+
+
+The neoisp registers the following video device nodes:
+
+- neoisp-input0: output device for RAW frames to be submitted to the ISP for processing.
+- neoisp-input1: output device for RAW frames short capture in HDR merge mode.
+- neoisp-params: output meta device for parameters provided by user space 3A algorithms.
+- neoisp-frame: capture device for RGB/YUV pixels of the processed images.
+- neoisp-ir: capture device for the infra-red pixels of the processed images.
+- neoisp-stats: capture meta device for generated image statistics for user space 3A algorithms.
+
+neoisp-input0, neoisp-input1
+----------------------------
+
+Images to be processed by Neoisp are queued to the neoisp-input0 (and
+neoisp-input1 when in HDR mode) output device nodes. Supported image formats
+as input to the ISP are:
+
+- Raw bayer formats:
+
+  - 8 bits raw (V4L2_PIX_FMT_SRGGB8, V4L2_PIX_FMT_SBGGR8, V4L2_PIX_FMT_SGBRG8,
+    V4L2_PIX_FMT_SGRBG8)
+  - 10 bits raw (V4L2_PIX_FMT_SRGGB10, V4L2_PIX_FMT_SBGGR10,
+    V4L2_PIX_FMT_SGBRG10, V4L2_PIX_FMT_SGRBG10)
+  - 12 bits raw (V4L2_PIX_FMT_SRGGB12, V4L2_PIX_FMT_SBGGR12,
+    V4L2_PIX_FMT_SGBRG12, V4L2_PIX_FMT_SGRBG12)
+  - 14 bits raw (V4L2_PIX_FMT_SRGGB14, V4L2_PIX_FMT_SBGGR14,
+    V4L2_PIX_FMT_SGBRG14, V4L2_PIX_FMT_SGRBG14)
+  - 16 bits raw (V4L2_PIX_FMT_SRGGB16, V4L2_PIX_FMT_SBGGR16,
+    V4L2_PIX_FMT_SGBRG16, V4L2_PIX_FMT_SGRBG16)
+
+- Monochrome formats:
+
+  - 8 bits Monochrome (V4L2_PIX_FMT_GREY)
+  - 10 bits Monochrome (V4L2_PIX_FMT_Y10)
+  - 12 bits Monochrome (V4L2_PIX_FMT_Y12)
+  - 14 bits Monochrome (V4L2_PIX_FMT_Y14)
+  - 16 bits Monochrome (V4L2_PIX_FMT_Y16)
+
+.. note::
+   RGBIr camera sensors are supported as well, and can be used through user
+   space activation of the IR block.
+
+.. note::
+   neoisp-input1 link is mutable and should be enabled in case a short capture
+   image buffer is provided to the ISP for HDR merge.
+
+.. _neoisp_params:
+
+neoisp-params
+-------------
+
+The neoisp-params output meta device receives configuration data to be written
+to Neoisp registers and internal memory for desired input image processing.
+This v4l2 device accepts the generic `extensible parameters` format.
+
+In this format, the parameters buffer is defined by the generic
+:c:type:`v4l2_isp_params_buffer`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_PARAMS <v4l2-meta-fmt-neo-isp-ext-params>`
+as dataformat.
+
+When the related media link is disabled, the image decoding will be done based
+on the default parameters of the ISP.
+
+neoisp-frame
+------------
+
+The capture device writes to memory the RGB or YUV pixels of the image processed
+by Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will be written to dummy buffer and not delivered to the
+neoisp-frame video device node.
+
+neoisp-ir
+---------
+
+The capture device writes to memory the RGBIr pixels of the image processed by
+Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will not be delivered to the neoisp-ir video device node.
+
+.. _neoisp_stats:
+
+neoisp-stats
+------------
+
+The neoisp-stats capture meta device provides statistics data generated by
+Neoisp hardware while processing the input image. This v4l2 device accepts the
+`extensible statistics` format.
+
+In this format, the statistics buffer is defined by the generic
+:c:type:`v4l2_isp_stats_buffer`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_STATS <v4l2-meta-fmt-neo-isp-ext-stats>` as
+dataformat.
+
+When the related media link is disabled, the decoding statistics will not be
+delivered to the neoisp-stats meta device node.
+
+Control
+=======
+
+To support additional neoisp hardware revisions, the read-only bitmask control
+`V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS` can be used to query the list of
+supported blocks. Each bit represents the availability of the corresponding
+entry from the :c:type:`neoisp_param_block_type_e` enum. In current driver
+version, default and max values represent the blocks supported by the i.MX95
+SoC.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index d31da8e0a54f..445269f87b17 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -21,6 +21,7 @@ Video4Linux (V4L) driver-specific documentation
 	ivtv
 	mali-c55
 	mgb4
+	nxp-neoisp
 	omap3isp
 	philips
 	qcom_camss
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0a..46268d955d3a 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -18,6 +18,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
+    metafmt-nxp-neoisp
     metafmt-pisp-be
     metafmt-pisp-fe
     metafmt-rkisp1
diff --git a/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
new file mode 100644
index 000000000000..c412b1595205
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+*****************************************
+V4L2_META_FMT_NEO_ISP_EXT_PARAMS ('nnep')
+*****************************************
+
+The Neoisp image signal processor is configured by userspace through a buffer
+of parameters to :ref:`neoisp-params <neoisp_params>` output device node using
+the :c:type:`v4l2_meta_format` interface.
+
+The parameters buffer uses the generic `extensible parameters` configuration
+format.
+
+.. _v4l2-meta-fmt-neo-isp-ext-params:
+
+Extensible parameters configuration format
+==========================================
+
+When using the `extensible parameters` configuration format, parameters are
+passed to the :ref:`neoisp-params <neoisp_params>` metadata output video node
+using the `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_params_buffer` defined in ``v4l2-isp.h``. The
+:c:type:`v4l2_isp_params_buffer` structure is designed to allow userspace to
+populate the data buffer with only the configuration data for the Neoisp blocks
+it intends to configure. The extensible parameters format design allows
+developers to define new block types to support new configuration parameters,
+and defines a versioning scheme so that it can be extended and versioned
+without breaking compatibility with existing applications.
+
+****************************************
+V4L2_META_FMT_NEO_ISP_EXT_STATS ('nnes')
+****************************************
+
+The Neoisp image signal processor generates statistics data while processing an
+input image. These statistics are captured in a buffer and provided to
+userspace through the :ref:`neoisp-stats <neoisp_stats>` capture video node
+using the :c:type:`v4l2_meta_format` interface. The statistics data are
+processed by userspace application to produce the next Neoisp parameters.
+
+The statistics buffer uses the generic `extensible statistics` format.
+
+.. _v4l2-meta-fmt-neo-isp-ext-stats:
+
+Extensible statistics format
+============================
+
+When using the `extensible statistics` format, the statistics buffer is passed
+from the :ref:`neoisp-stats <neoisp_stats>` metadata capture video node using
+the `V4L2_META_FMT_NEO_ISP_EXT_STATS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_stats_buffer` defined in ``v4l2-isp.h``. The
+:c:type:`v4l2_isp_stats_buffer` structure is designed to allow future Neoisp
+driver versions to populate the statistics buffer with future blocks
+statistics, and defines a versioning scheme so that it can be extended and
+versioned without breaking compatibility with existing applications.
+
+**********************
+Neoisp uAPI data types
+**********************
+
+This chapter describes the data types exposed to userspace by Neoisp driver.
+
+Some structure members are in a fixed-point format, in this case the related
+description will be ended by a fixed-point definition between parenthesis.
+
+.. kernel-doc:: include/uapi/linux/media/nxp/nxp_neoisp.h
+
-- 
2.51.0


