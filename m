Return-Path: <linux-media+bounces-58675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM+iHFwV3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:10:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFFD3EE60F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9624530684FF
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54758272E6D;
	Mon, 13 Apr 2026 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eCVfbCr5"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF52BDC2F;
	Mon, 13 Apr 2026 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096286; cv=fail; b=ePsLOCVFvK7Rkx93/oew1vxMopiPDuhf5fOjpPR/JRyZ7ip/nFvr22YvOYJhXmSP6vM8PdfF2n7yrWzksdX+iAP3FGHuQwp4lQ/phCsSweOOONhWWxyfm4xf7lPd5DYIMOjQth7Gex3r4yqeSxUBvcDoML0/MbTSPSkOc/ob7RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096286; c=relaxed/simple;
	bh=JkbCxXKq45xJy7h1374P5iPwO2qP9G4PVzDsqmiU3VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wc1EaOiKBGUpsB9a55/n/9D30T+S6WbTJDect4aHGQOdX6rNZHmAfG3U5F/1cqMdc/681pY6p6kOxXyvRGWtPMaUgXSFbam9Dli3B95VxsNDPAcY6vnnyclZgJxfnB2LNZ75/25kiAIowcgV1Pse6jM6TzoaZ/kNq73rWJTM7dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eCVfbCr5; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0WYzVowba0DanPMSsfsVjcB2dIU2RQFLr4xa+o5ACi7jsllq4SH+SbDIYs0+IWVGyGqm4v3VgR/V5Z+7zDRrbgO14/rEqtm+apZhufboBvA/n+c1LrpuACJYlUfrORDYuhYOsdOG3RM+KJdCkWGTt7bthbsWwymMNprzD98/Th4C8E2ftljaMvGayVapNlrsEl7f2GRzyxpq79Wi90yDk/XThG2PCaqtHH5jHtwv2B8lMB0ETjKtTk/1fdQoAbEa6H1YYqU7jT8nW1p2PQu9ASj0/zXKyj79yyeOfrrpZH+YkvDxi9xIpsXAx+E2mRWLGX//5SgjKev/RBAq2fHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4pXK8PU9ewu20RpBj/hRXtlUz9fPzocFNE9HF+yz8g=;
 b=QnnCBX77dqzjoJ9+wNN/D7q/7qFKcIA79unu7g6om7N5h8jnT66aVgYVXjKqYyaQ9PGAd9796+cf903f50a9SWmqCC9aTZoTpjku6YRzZ9NeWtWcoA1b+4CFe62WQwySRhPk/qqrY2YsDA/NGrXyKnAq46/6Ent3rXTRkPVnavX2fy0wQQSEFaV5DINUDlqtDyxEwHgfad1XG/9jBUpH5XnZAB/1wWqi5gWdZ2zh43RwTpOBA1ptMrvqSQqWO3qh5D7LoQ2H25oAVlYw5gbXp5C64+Md66661/ooNtmKTYhGyn6mLwJPUKLItV0QjrJJiySnycLY9sWJ1RzPV2Zrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4pXK8PU9ewu20RpBj/hRXtlUz9fPzocFNE9HF+yz8g=;
 b=eCVfbCr5HIMc3hHVRfRUKseXIktLzhWuffs7tI1Dp/45PairQBp1Bab5qrLk7RQHj/3Zs0HvKebpXiKChCAZvNe7K3FRcuY824qq4qyKgUY7zTTqeDBHRUA/sW/OMlPPg0pIT4Zk09lF+tG2FpUQ7yKcApBzXuUH75oMfYkNTc6e4Mt75y/HPXQOjCn2SyuqH2/mEX+zoNffSfJkcIvH0iS/6VhvnPRj8fpKZqGXxpDgTd+QN1H5D03WTxqNWn7rZ7aEmPB1tJlsdluMES1oULbeXXva+8SRn9m/mMSSpqdfIyGLmkBlfauGMyg4pg2zn3m6yviwyofWTlFShllEBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:36 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:36 +0000
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
Subject: [PATCH v1 05/11] dt-bindings: media: Add nxp neoisp support
Date: Mon, 13 Apr 2026 18:03:25 +0200
Message-ID: <20260413160331.2611829-6-antoine.bouyer@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6c7b7c21-8e79-4b05-ec78-08de99765c24
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 OAFs86cip8vjnpN0H0OQF1hqtG7l+0PKzVLGTMhqAb1lzAsSHZVwhyYt2FoCyHsxKpB2+sEqDri6D1f9nhmQ5kMD8V/8KdxYkSQSNIMJ6sN+hgHRnpBI+1RFP8JjIHyfseaM9DCO1SJxKTPV6sYsKgHXc0AWevP/OfFENivWvoLmEJjQDEHGbNFn9t9HXM2pXnLYQRs+XSnJ/hf5nL+ybDD3gR4HKbcLq/XHPLQCoSPVjJlHj6kqumuXbPpMLSAgpe2Z7HZOIJw0+kNGrfAwN+Cgks9GA7e27rVv4Vdh7d/GDkK85nai7MkcV/7nlhhKSitJjfF/isnUp7IXLAT5883MCafcqnVky4IOxalw07oI/yA4j6xP56PwQqDeDek26v8U5ooinMZjr4NctYC2zm7qTEFAXDX4e8xepKxrFMXWwqsoWit1zYM3ag1JeMBmEba/5E2jjEHcJ22EhEBQnn4fN7GLeWJbAtoVL8lE8oNhMViSB8BYDvkP46Kk47vohBTXzO2Skd89Zdu1al/NVMZr2ZdSn13MlMmgqsC/W6y6sG6o75A/efgZZcHIVMp+0Bd2rUkwEladSl0FmXYymLgW9KOCsOa2HBPWM5eaewNX4omhqJErBcQojUqcIZ1XrRtA5PBqP8He9gd1DB2ygz6iFJYdiNhmTOJdcvCYL4d8jwqsBbw/U00bR5zDxKnRaQt1hRr35p8FAyrECIkOdBN2nHiqzG5aZVWmSIPzCf9CiS60aPZg03k/cqVo+3N7fP2CJUmLxGgFBAhTvkk5MQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?V4og4wtbMYySVv99tsPraJibSu7DM+1XaJ4m9R0xe6zVg5kfpRygfLzo/weM?=
 =?us-ascii?Q?P4Pu3AM2yG/nDppZbWILnq0elsB8zkaGqXqwjEZRRZ5ABYdJT3SlaWH4A1gj?=
 =?us-ascii?Q?a3wKK4fVSVLu7Ac+5hCH5zyffaD+vAfyDgdt6ossD/Rf3L+rw0Nv6T9g44Fj?=
 =?us-ascii?Q?jkKqVV51Fw9q1Gi73MKRSm/14Gqt3AkEghj0bnrYXYPRDMhWsMqSxOi/Ra1y?=
 =?us-ascii?Q?dIzRxr+EyRSJX81omaBf6LULkJtUv1JhCOc45ZO+NKO1zzan2gi6IVEljpSK?=
 =?us-ascii?Q?8rnhxULF1WXlTWvCTK193nUpOvXFT9lG9JSfI3H7uo/PA+iUPr72PzAaSDIN?=
 =?us-ascii?Q?hoTcZHaWD9CtvWquxLXYh7NYrr05ca+aeWYd4JvLgOBbEO7q/PJDjIozpDNo?=
 =?us-ascii?Q?j07UzsDyTUwdlMR1tMDHkH+vFuW6/SckN38nj1sZ22PumGub28FImsv9O/3T?=
 =?us-ascii?Q?m7V6src1Ik07knd3hs9dbyJa9Edue6MNUNSJ0sdHnML2PPXv63YYD2DvduXr?=
 =?us-ascii?Q?+XDCN9GI944/getl9vo2AMSfiWZtzyv65N5gdOSNVOu5xUxKzTJsxIyZtRNy?=
 =?us-ascii?Q?ShBtMQKC3AcgXFi7T0s2EHpSkBalsYF63TeIFrP/FxrU2tJoiy9JifR3k0FA?=
 =?us-ascii?Q?slhL1rewulTC5dGxgL9175DUNCsumDtSZQjgUY/5nFjSIKrvVa+VhLcWYnIj?=
 =?us-ascii?Q?wl5XxUbvKgP5oJp6UGjzsxCX7e6OQ74DdU3ViT5GuY4D20Qkhzn9zXCuMMaM?=
 =?us-ascii?Q?ATGz2voTaS/6tnheAQ5ffNs6kXAnOC6GPkzroMAc5aeh+rm+oO2RQ5xgS/ER?=
 =?us-ascii?Q?mIJISPTOuQMRIfP2CMxmK0kAupPlT/cBjzavmeIALqTqHyQq35OBD/gp/Pu4?=
 =?us-ascii?Q?qmVwOLoNTTBRW9oChbKF8TdoMX2Qa1BK9GnYQ/iaNTNWAxUCxZR4mcTd5631?=
 =?us-ascii?Q?YDcmbyBD+0TBnvy0b/IF2a/F8YXFf9A+Ol/N6lB2Bhe0nxM0ELbOZ5zDptda?=
 =?us-ascii?Q?zDDlQnw0vzyDb780FLDZQr7Jye/PT6VCJyHcSCSeu8dN6cyVeXyDT470xc7J?=
 =?us-ascii?Q?ZXtfffieJ3eahGJ/xS0XGOxi7ca5UwlxWPEFqD/e0hL5M2Ux+j47WDM1pcny?=
 =?us-ascii?Q?uRk0tmL4X6as6zlRwtxIguG87oaJVkwPqP2gWdojP931P2v+DG1mDe3/5RVe?=
 =?us-ascii?Q?CXh1xyi4iq+psv0R3gVOmKaly3JYN6ha4SHbdMXXyqVgb4HwTdxFNhXcL4GN?=
 =?us-ascii?Q?jz1B6C8zUN52Ac9KZXk21SYjkZPlD9y0T3pmhxEf8JyzgAP0kjesDnFCpDir?=
 =?us-ascii?Q?RIDB0V5V3Khf18NqlajCEGR5fPhU8EVQad1c1EFvMFENjbAKw9q8Z7Fjg9xS?=
 =?us-ascii?Q?vqiQh6rmmTA/DgALptwScm2U+CV/XFCq5bIIR6IJyq+Bqbq6YL2qKaZQIumZ?=
 =?us-ascii?Q?KKKi70oH1N7ZXu5ZsOLqMUPe+CrLN1OdGbWxA6duQ3YVhy5LWaFZzGp7O4GG?=
 =?us-ascii?Q?O703C2XFwzuH8ESLI6e616j7FhFKg8h4uJ6rWJ9ZXfjT0O3/niW2tkaaj1VB?=
 =?us-ascii?Q?tY5GgPj4hc3aQG0UumvQcbKjVnMCedhCiIBsZHub3q+R1fTgXWvsvhyUu+JX?=
 =?us-ascii?Q?F0X+/ILFwA9HHNdsyPbb/PTSyeenyC3tVS42IkqxWtTAFyBsnngh2gH3qRD9?=
 =?us-ascii?Q?Jrr98X3v6ilUzSyco5+6QwOLBPIK+TusB90WCEmFs2zCAPPRzFKHStTWbOJv?=
 =?us-ascii?Q?0niba5/Qjg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7b7c21-8e79-4b05-ec78-08de99765c24
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:36.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: af09m866mTL3Dnf6qVh5lO0/rJewT1HKfYdtJCxUcdDuhFhgG0HR3x+7glReavdGxM5eK2jDksl2iaCcTJSkBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58675-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid,devicetree.org:url,4ae00000:email]
X-Rspamd-Queue-Id: EAFFD3EE60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the yaml binding for NXP's Neo Image Signal Processor (ISP).

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
new file mode 100644
index 000000000000..55ac10a065c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,neoisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP NEOISP Image Signal Processing Pipeline
+
+maintainers:
+  - Antoine Bouyer <antoine.bouyer@nxp.com>
+
+description:
+  The NXP NEOISP performs a set of image processing tasks on the RAW camera
+  stream and provides RGB or YUV enhanced image.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-neoisp
+
+  reg:
+    items:
+      - description: The configuration registers
+      - description: ISP local memories
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: camcm0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp@4ae00000 {
+      compatible = "nxp,neoisp-imx95-b0";
+      reg = <0x4ae00000 0x8000>,
+            <0x4afe0000 0x10000>;
+      interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-parent = <&gic>;
+      clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
+      clock-names = "camcm0";
+      power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
+    };
-- 
2.51.0


