Return-Path: <linux-media+bounces-26596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36278A3FA00
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6687189F731
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF1C2153CF;
	Fri, 21 Feb 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WSH6rYIc"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911C621518B;
	Fri, 21 Feb 2025 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153386; cv=fail; b=d1KBDwUcNF7Gn4ul7kDxfzhiodcy2O/rBaFMiqaMqjHDD8KwnaL2tL4AB8NrwUGrQ0XAhBNIJ4u3nI6GytC6PgYXtcbDlKI7RFodfztwbwP1r5FOr0Cv3GcBpFTzG8sNFoYld9LG9l15ZzoFRhVg7i/TZ2laoDvcoAE1xiBQaMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153386; c=relaxed/simple;
	bh=wg+VkVASWdnS2Hs69XbXc+G8Ifu1bb5T8CFbndYrdA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e5ZCPsKgxfJ8mJ93hDrgiJbjYkwQYHzd/pPiDdmAQdb0nW4LXg57Q2yQDit5BIKP/2+k8Lnoc9Ksj/v8SYjylblv9VvzD8pr6/BvPfwWmBGmdVpjjN0CAd4ume0h2VdOSAOnWdkDJ26VKNKltBGeWf1dIhw8fP4ni/MhfbMWpqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WSH6rYIc; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9rd7cVI86jHXIRyhJKfB3+6IXU5KVGOXpfOtBqDq8AZjGDvXEZIsdcud0BOGDeyYJP+I2XZ0uGRGl+Vog1XB/tjbAT+sqiF9bEuljjgvDrmF4/N05ClUxvvQvZ7Mjmc6wFuB6znjQF4EuVQkuwJ2ymSA5xr3aVVMfa+Xhg/5yOXH8WJCUJgTu7v8NZng2xZIxMpPrPnHpZo4yPoz+DRn17OFtV1A6OnJSvcPmmNq9WJ/sT6MMsw7QKI1pVCaF0RqC8s/SHoEIuUz1Jlk/T0yDGaYOxVcIQ/E1tGNMF1Irfjgamw3dnrDN23ev7XxoHsNwnvZapY+UX2T/xnPcjJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+C3hZF+BEIQeo9FQB2B1Sn9VFLb97c3qDDm+ZuOkAc=;
 b=M8yvyB1ZTPtvwE+Md+vPPFTX1bIdBx9jVxjhLMr0Z2gydJqg7/LhA5uvVpkMgLFNay+0FqVgnG6y2ufDgMp2PsdV+QcMtabzOVpynZKOSh2NiOb++cbSbpRmeix3An1RNCLcMyZHK5lrfzMs41vePTLohCwBcl9bpTAJUxFhaqCNNUuZVpwgKe95JgG1BQKAvjA3CRCXFZskZjdeBGRNyqiKadFeM8r3c74Ad3P5zjNEBZ5jJSk1a98cMkMlTEdJJ2BsOIeORBratSWlYKMc2fhgvZAjnotvwGZjbnWSP9sNgHYHy+41v7GUZZXfeqceJTFiGb43N9SQ4UAi7rlEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+C3hZF+BEIQeo9FQB2B1Sn9VFLb97c3qDDm+ZuOkAc=;
 b=WSH6rYIc+2zLJ1+E5RIEHdpDuvB5MwYhTqKxaU44p4q1dqH8q3cfntpQBrhoCcH+3QehSVLs3djLmKznyVgQRoiHEWsud9gHG8A/zuJAQZIVFJ//ID3WRpmAqeCxiaF8KZzqpZPmFl0R0i6676QiAQr0DFFpI2Glum0adWZx2Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:22 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:22 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/18] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Fri, 21 Feb 2025 16:55:17 +0100
Message-Id: <20250221155532.576759-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: eb24e993-91f9-4fa1-1479-08dd52904978
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hnw5H4iQo08fZbY7oNlJWzAoXp6VNJmu1iBA266SO3XbeEeCaevnlkBwYOgs?=
 =?us-ascii?Q?LhNyutMKHf7Q5AcIMRtfeQXXRqnlNPGUWeJUqIoVo48nZlYCVtnlXqlZ/FFW?=
 =?us-ascii?Q?z0FUXRg7PbdfToMC44JOjWospDIH3nnpfhIfucE5k+810FlXT700VWbYmGxo?=
 =?us-ascii?Q?yfR2v8+/N/cv8G3XqEn+cuIqEj0G5rK4BH0rm/WsO3c89JCcpCj36/WQ6oup?=
 =?us-ascii?Q?hTxfvJgbPoa0hf3qUTfMpZnLu0vmyj8ZoLmQ3O7ASdxIIu9o8i05EY1Xxw2a?=
 =?us-ascii?Q?kaVr3VhMAt5w6N9X+7v50COpWlBa0alIRgQTLUYmBFaKdugexB/vpY7AEn7T?=
 =?us-ascii?Q?w/GaQICKt2ynVX02ka6QWGfBnZCf15L1vM5O5dVkUXO3jkwMKhRNKQi2v+V6?=
 =?us-ascii?Q?oSu0jkAjSMXQ/jNAD8VPvyGWUxfUTfS8ifkJT7sJVtYIn1vLOspi4bs0kLh2?=
 =?us-ascii?Q?LXuy+eXx7p4c1j0AyRXCIYsA96Rwb0le9pXMCXkGbGxnZfV51A2KmRhBOfKZ?=
 =?us-ascii?Q?vJZdCvnFoUWWdvxLV9Fice+vBaMWNZGKxvQQUox3Eds1PKNudWzXZ/gQ7E1w?=
 =?us-ascii?Q?MBvPG8dp+kCVyPMw5k+gfa+ar3ZJ23s4IdPsQUYAq89VPZxI0m6T3YvVV59x?=
 =?us-ascii?Q?QErAx8WRTPTWnXLLw4K8r251mX36+ZDvPOkYOQwiH+a+obQN5hVALCpgCZ1z?=
 =?us-ascii?Q?hydnpBV/98wXRX5oReMEYlYXi7tWjVigWyVzZhMwh95V+N5e9nAx95cbDL58?=
 =?us-ascii?Q?Pv31WzGsFm/KnVUtaRHC2XjPkpw+Gr8/7F2a9mMk3tnV0mVWPXCThFP/3A7J?=
 =?us-ascii?Q?D013Fx37yQK03Ly4DvPZ9iHZKjj4Skj6DEDOHB6RwOAackzP7Fp3m5DzTt2D?=
 =?us-ascii?Q?ymO4UvXd+rEJkQnjBMqRzR/NdPzPO54/5jz1gzpbnfAq2zsIE2Fm52zupRQm?=
 =?us-ascii?Q?8laZLjGuJM/fYRAsGyqdaREAhmRsm6+r6+MZBYpmUgbAXzJ5ysBS4e/SGhlv?=
 =?us-ascii?Q?DyVYu7wz31kB5QHIgPi5f+PuUJRyxHj7vul10XPM3nURfLxuGeWRr8RR2Wdy?=
 =?us-ascii?Q?O1SOIqY1/XHa/OCy2JdpwnFeG9tFRvbhJ8YGmowq92DP2LZATY40Gc8yQkaO?=
 =?us-ascii?Q?K2n8tmDtsG77j0JrDrIgvUVFPh8mLJNWB49mTkSnSQoBCjzpcx2WIbCfj8Me?=
 =?us-ascii?Q?bwc4gCqgUx2psoTeHS6jVc+PJaxldIHTOIr5g8iFL27jNPQJVVWjeup9DWg5?=
 =?us-ascii?Q?21Bh588RBmsDhC2MFrf8LFemj+92hvA0RFFlSLd+084Lf+fUjNmvLbXHk+Su?=
 =?us-ascii?Q?g/+38f9K+uzOYnD/bwMKweubNRBpommX88X/72lBG8AP6D8lmQQu1i+KFWQG?=
 =?us-ascii?Q?ytiox9t+frVfViAb0VGJR5OPDqz7BfHGKIaUL59tkHaUl6PpmBL7al02N31S?=
 =?us-ascii?Q?3OodWtv5yILTrGJpn4m2CAmDzgN5Lj+h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TA60kKoCmzyr+xkC3duSYPFbu+HpdNKuMr796fHu/iOkeV6eVC4p7c87Z7q5?=
 =?us-ascii?Q?rCTcvnq4csMCmHdVoQrgZTD6ODI9W7J41w9j/Ge2n9pPbk8OE6Ik42NLrNpQ?=
 =?us-ascii?Q?3fEdcMj62oQpFS1s86CTG0SXT/iXUj3ixd6ffCaG6T5pzKVvAyNMBsDRouvX?=
 =?us-ascii?Q?8AcUv2VaxTho/GPgk1dY9ECZ3Atv9xLvh7/nKEjeWfl+9ggQYB+ArKTld/a+?=
 =?us-ascii?Q?8EwLkvb87bpzUXrAWzHrZO+8dr4obLqbJPBNZZWACR28xAY0QCqloURuZwz1?=
 =?us-ascii?Q?7ZAMfZOylBGlFHBMv4+ke/FmMMg/gSMQBZkUIn9kaH0UvgK0mVt2vZsNbCLz?=
 =?us-ascii?Q?t8zcfKl6fwMzareXODDTfNJAXyiwn00wKPap9OEfv2PtN5IHWmTA6gVelrfy?=
 =?us-ascii?Q?dXQz33Lj76a6VzhteObKizXzgLS6iGQNdDpqUTkwfKAWDE3ZdHDvJYAcxW1k?=
 =?us-ascii?Q?8xQJoc1SbeJzfwGWdI7jqL01f8Ohd2A9F8tkwRe9JKiLSzx5ZJkZ4IGM5p5U?=
 =?us-ascii?Q?rHfrgCefetc7yqJ0HC0IhBvuC3c9lIHbDercqfgW8xTDSuKJ1X4jpb8CRuj2?=
 =?us-ascii?Q?nZ62hcTfSwsNZ1VP0pGo7/Amb66QIah4s7h+qJYxl4xsodOt1FUQwiJYC2eS?=
 =?us-ascii?Q?oldFZs55uf2O8qTcQ7cxtGmhCUKtE59WXCF+UkzSzoFF7kduCtEHRMnSH9+8?=
 =?us-ascii?Q?HJwQ62KWl63mLl6D8qAAj5+QEQbu9/+B2gHpfQfxsLNaElGiJ7sO4VbU9dD+?=
 =?us-ascii?Q?N6LTbM5RB48a6GKeoIIiA4Ra3RIRRw/MpDqSeJiDuzP5bJKnJJ2wo7GW/zKX?=
 =?us-ascii?Q?OnJGr76RhjhcoNswjIe5ZRntT+ezEDHYtVlSDtWV31GK545bektGoGhQ9Nvw?=
 =?us-ascii?Q?VvhPbgwfQin0IBkX8BCTHOQbCM1mdKvm1YJWHaVaLKn40zIrO9SNWF+GQLxt?=
 =?us-ascii?Q?jZRa0FM9v+BNsc+GoL9G7NwW18CkDXil04KAkqBLAYGIDYV2wcnSe49G8QRw?=
 =?us-ascii?Q?U2wbsKlWhH702iJuq51uDQKzXU6+N5CtCGOqcLhQlkOjZObZiNP/Dpy+lLvL?=
 =?us-ascii?Q?+c6EtT0ujdLEUO43hHWXRWSqxJu0EgAGzRj9SR4BkC2o5GpTnFduxpNdupjh?=
 =?us-ascii?Q?HOuq4A75vspNaOKXPW9oOUD9ur0AemBPBRDzGF+bzcUzgpwp3wHu4jdziMQa?=
 =?us-ascii?Q?isLvyBA2HnrrPbDDctDs6W6vtQ5Qa3QevXANzqCCYSt7Z/ks6A2u6sexdh83?=
 =?us-ascii?Q?1Dtlm8k6EU0QyqD/Bzog/NkSzYlm04rr+EXsGfEripj98A91hKmCr9PU+Zbp?=
 =?us-ascii?Q?1IDDkUni26NCArIMlIqwNwqq/G94QFwd//hwYASLNF62P2ZWmD8wsdP2XsuG?=
 =?us-ascii?Q?G7c+rHYTI40NyAmtGAEbupcvM1vRN039CclSo7IEemdweCXvKNteZEQzEudQ?=
 =?us-ascii?Q?sw0OPr0oh/Vm08lEweQ6AhSdI6veS6ADCSXay0Uqx30WXbE5vSWpIlb31Vt2?=
 =?us-ascii?Q?sx+A/GNm2aR4BsBpLRUurRK1JImkBLcmwuP+AEgpZUWzgGHmpLZzuDe9O5vy?=
 =?us-ascii?Q?akfY0ZgkryBs1up9ePrtA35krW/umI97D+02Tr4Cu1l5LU6lE/5+evvrtU3N?=
 =?us-ascii?Q?D4WX6iCSmWFY6ksC0RunXyk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb24e993-91f9-4fa1-1479-08dd52904978
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:22.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/AZNlOsneESakEhkNUA37Cnz/GYqp4RepXMNVBrgV3hwUrUcSgLTmaSCTLLqhVxV/dw3fuDSJRjNhNKnwLutBYqFStLDKRkObJwz+5Bj+rvvgmOdmAlYlXBlxRzNSN6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
interrupts:

 - image_conv:    image_conv irq
 - axi_mst_err:   AXI master error level irq
 - vd_addr_wend:  Video data AXI master addr 0 write end irq
 - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
 - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq

This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.

Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Use oneOf for interrupts and interrupt-names
 - Handle interrupts and interrupt names base on soc variants.

 .../bindings/media/renesas,rzg2l-cru.yaml     | 65 +++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025..47e18690fa57 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -17,24 +17,43 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-cru       # RZ/G2UL
-          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
-          - renesas,r9a07g054-cru       # RZ/V2L
-      - const: renesas,rzg2l-cru
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-cru       # RZ/G2UL
+              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
+              - renesas,r9a07g054-cru       # RZ/V2L
+          - const: renesas,rzg2l-cru
+      - const: renesas,r9a09g047-cru        # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 3
+    oneOf:
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU Interrupt for image_conv_err
+          - description: CRU AXI master error interrupt
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU AXI master error interrupt
+          - description: CRU Video Data AXI Master Address 0 Write End interrupt
+          - description: CRU Statistics data AXI master addr 0 write end interrupt
+          - description: CRU Video statistics data AXI master addr 0 write end interrupt
 
   interrupt-names:
-    items:
-      - const: image_conv
-      - const: image_conv_err
-      - const: axi_mst_err
+    oneOf:
+      - items:
+          - const: image_conv
+          - const: image_conv_err
+          - const: axi_mst_err
+      - items:
+          - const: image_conv
+          - const: axi_mst_err
+          - const: vd_addr_wend
+          - const: sd_addr_wend
+          - const: vsd_addr_wend
 
   clocks:
     items:
@@ -109,6 +128,10 @@ allOf:
               - renesas,r9a07g054-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           required:
             - port@0
@@ -122,10 +145,30 @@ allOf:
               - renesas,r9a07g043-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           properties:
             port@0: false
+          required:
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-cru
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+        ports:
+          properties:
+            port@0: false
           required:
             - port@1
 
-- 
2.34.1


