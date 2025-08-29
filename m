Return-Path: <linux-media+bounces-41308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE9B3B63B
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2039DA02D1C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFA62C21C0;
	Fri, 29 Aug 2025 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Zdcbdv02"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020136.outbound.protection.outlook.com [52.101.156.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7932BEFE4;
	Fri, 29 Aug 2025 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457252; cv=fail; b=mNC3GH1FGZHWiqwHgQ5qUUsXs1q11bDjISrQOrQMUjkXnfQdRx/dRPAwk4u3Mu9Iun9W6ovSJm2fCrOh38p/D1A3DjIMRO2cDg/N0FOtswEK8vBwTvSOiXgeb7guALrkLWXgdYJG8rcu2UEjx0BGw+JX78VKcB00q+muM1kRjxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457252; c=relaxed/simple;
	bh=Y6Z5UWaJfMddh2Kew0eEkSs4IiaLm1/3wypSs3wFKYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sOQAuC75mFl578Alg+czbi8xp5NOKwCK3v/ygaOHTplBLL6wr+ueddXAGF4W1gFqwKN28wK97ejkWM6zaRHCIE2w2VBvLhz5Z9BOu7zJI+jL696nXG0T6Kqa2VjdIFxvMCZj/WzaAjKl0vONhQ/NuCXYy9GNKCo5BOMwH9ebDso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Zdcbdv02; arc=fail smtp.client-ip=52.101.156.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw1T4gXB3YMULSHxrRRvAqdPZ6kboJfhyzow3A9ZZUXQ/VylbWS0HvjXrrVSnAE18h24V8nBjHykg+QtWt7IJixGzeWYsZ1JOAL0LpeFmDtik4JIU9A2D/hcQWykrPU2GytqeP7v//ZzfP9IPtJYTW6VMoib6iMiCkci9RtlyMWY73UN/llN0d8vR5uXGltVGC46EnsL4btwF50KtvDz711j0qGck0SECx4mjgZVNWWR4PHAqY5MXG4h8ISNsjEoWmsB/q6YuRG2Y5zePkpMtio5PWPHJJuSAdcXpb8sC+q45YvygN38LbVXajdkfIZD86WtvU3fGxElu0tf1oJcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmSTk/4/FPJyNDqCU9S4BaS8yO/PYWUJt0iNbjT45Pc=;
 b=bikR/jgHTHV/IuBtMKhh4B+CGpka/3Qfd9uItsb8ttyg8+i91utIgOpjbzNZyY4C8iChziBCEcHVXFAjyFoiTuocCxENETLgC2zmXOsh7wzWY7K5KNs3yp56Uj7WfaAay4mntWtIHRumPs13NEf1qZnqQ4WY3N+uUxco8WKbrSl84wVaw//8ZAwhwAqPh8Ix9HO6/M82ZbOSqkHRtjecZbH3WiYvTvpZpwme8zzKRJNDzMxQB5t09A+eDRL+BxP3m5DLGE2WvcozT4MB96QhGzMXJLOJPTTp9bnBYCn/CPJdHrG1aJ29a8gJ7CNxl1alIAZ2/8NuSFPCtjlr9QiIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmSTk/4/FPJyNDqCU9S4BaS8yO/PYWUJt0iNbjT45Pc=;
 b=Zdcbdv02S3RMRUeL/4Mf+MaR/r5roLbx7ZME2pYazy9YfAXJZEqQMmQD3iY/PnfKqu+iOk6obopmaAQMtfyB6y4KaOrPUgJ+GtOTa+fW65PR5Iphg6UuvJ2de8pO3iW7WK/gi9rl0lKVnVdOvCbRL8HO1r18MsXV422r9nl3VWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB1418.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:23 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:23 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Fri, 29 Aug 2025 17:46:42 +0900
Message-Id: <20250829084649.359-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250829084649.359-1-nas.chung@chipsnmedia.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB1418:EE_
X-MS-Office365-Filtering-Correlation-Id: 2071a08c-a230-4670-20f8-08dde6d8ac1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N1Ikc46xrwVSW53ODcZbce770y6ba6y7HOAXDF32Zn4XYn6PqptUgn5s+MOF?=
 =?us-ascii?Q?4FxJSSCCkwoQvORAYyTSiUPVr59V9j7tRKIv7D6FXmVwpbaC72wGYtKsX+Qe?=
 =?us-ascii?Q?HEkRxNjnDSQACM9biCpyeM+STHhibk0f2ESDUAxKAxfiK+SU7FPqCN/lMFLU?=
 =?us-ascii?Q?pqL8RtOCjHhNo1d7DZcBNAZsw8/uPXV9GyqyeU+CQsQbYRN504bckuY/5JsO?=
 =?us-ascii?Q?+kxOwP/hD9BA3VnQVh4MbNKA5bLYfiTvg6KgcTNojzs4hzdmiQWUZdsUC81e?=
 =?us-ascii?Q?0uhU7bVjQq+mp900YhYsOPaA8YhjAkWUJcyUTR62Ts3RApopzAXzXeraqLn9?=
 =?us-ascii?Q?yGFzSBtKMI/ybgzEG+jFZLE7EY/gB8uCc7J8nmOlTHq2oSqkEXPbyhl0PFMR?=
 =?us-ascii?Q?cMTdTrmO9aKPgZhWCSYV4ACVMS64m9/35oKlCoSgParankyd1aYAO69Yga2f?=
 =?us-ascii?Q?GYbc+gEMDyIdnHABL6gc3w0qGan2ZzIaKKhSO+Uz4Q6ZSXcGWqQKqBZeiiXb?=
 =?us-ascii?Q?VOTYNa/u8bW3bISpHxWOM1ucPlRPZb/9lRyLBJdWDkwaz4OPuEmQOxq17Twk?=
 =?us-ascii?Q?3p9KVKPVadCPn68rQ8p/UP7Ka+W36yXQOhKT4KdpRqIBaKJ+yhrbDRn9AvBB?=
 =?us-ascii?Q?XuzanUv6KQljodeE+jp5563SyqY9Wh/e/+wNmzYQsxY/r3qihC0S1dHeiDnb?=
 =?us-ascii?Q?ZQXg8xXWxV+UaOW5dIvr7xPO+fsSW/uuxQCj9KXZ32rOlWFq6ydp/fYyLuZb?=
 =?us-ascii?Q?ezHQsbgm1NEqA1aZktEVH4gAvDDpoZ7+Ih9T4x1DxrajlWUgERvGafzIhGjf?=
 =?us-ascii?Q?xNPoArYStyGYc/hBNywoos70RIZfnvdxqUgEHgn2tteLt0dV4s1QzWWNQEfQ?=
 =?us-ascii?Q?klZP1nDCtlDfOLUwsBXUhj1gAwsX5wke34BgoCwcuzC/rlP4cONWtxzkzQzI?=
 =?us-ascii?Q?hEqSck0VG0v05JyuXUD165rjLmFpMzkGiegB4q3E96+xVayzT17CtLj4SVZQ?=
 =?us-ascii?Q?6T7nf7Od5fiHET/jfkP7IKyw23m+xT/rHWENufxRxYdOHxBtxGGSx9jCsn4g?=
 =?us-ascii?Q?J1/HtMbmrv09Wz3iF5qefR5OJ+ol2+BKVVz/LVhCwqWdhxjgE6k8OissJiF3?=
 =?us-ascii?Q?FnczMt4kZywyBbd2oSaJk5BrNvwySt4y3vrPgrVwOjnjhf65LwAl9jpg8/9c?=
 =?us-ascii?Q?bBTvZTywTabv/ewhXSmnhYBl+2/FpXi2y8keFMXo+sr3F0uYR4KUTO24fVfh?=
 =?us-ascii?Q?w4x5ZddjdgsJnQNPeqkBSRN5Q/EsMdPGNIs7uxhFImgngahVKG9GrE4Q32l3?=
 =?us-ascii?Q?ILdvtyX1gPU65KtLzCqTUPoq1VDyhDg9MayFmKM7qSfwbDrAwwHxttYooj99?=
 =?us-ascii?Q?sh55D/M03yGGl4OYyKX+BQsk4BByYyEs1qT3MVJp6WtlVJQsWH4zHEoOX07s?=
 =?us-ascii?Q?P4kllW0nAGY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?44LP+rxIFzfSC84+xKmSRh27ADjk5od3jqK0w/rEK4EBsrXTpGou6CwZve6f?=
 =?us-ascii?Q?ogiB6imKhRuOCgKxKzgwyPxnXV/IXRMl6FQbUGhf5/TFa7bvCVktdHSxSBe3?=
 =?us-ascii?Q?Bh3nJqfeTl5+SIioyvu89fSe8/SGCCVDNdlCt690+Zgl/FHGKh7xxEhCa99I?=
 =?us-ascii?Q?qlDsSz6SIwyE2Hk+qKBnTmRoanxGsxZ+/TpZCwMS8NdBzb/jNWrLlqxAESzt?=
 =?us-ascii?Q?zwbNGba3KrynXtjhKscpSL4VdHhMAHQ4horu99pQD9mEJ02UD2eT1wa2H7gV?=
 =?us-ascii?Q?ZVBpMAWleX0IsHAW1k2NS2pktZQKl0HDk1nxUU0SpD8F5/VtpCAiAJytFtBX?=
 =?us-ascii?Q?whsLYTXWlOAbIzlKvT3wE2GZA+oDu9+bdzAP7/4OKaOTKbVZ0LkguslaPZi8?=
 =?us-ascii?Q?VQWgZFkT/SmNgfVEc29czhwL/mJXlz3w3ANQM5xeixvw3ELbae2MnGh/Y1Ud?=
 =?us-ascii?Q?noxM8DGH3VrjAWQBZdCWz0X+hxdrHIs0xfvDQzJEw5L2MePRhsMeDnP7RWAg?=
 =?us-ascii?Q?wA1JTx4pDabq6SK7fn2Jik43M75vfdWSshlxldIw+TU3kv1nPSQJtchX+DqH?=
 =?us-ascii?Q?IwdUBLQn+llV5yUMAr8fuIhUCKJvems3bXJrHi2uFQYuD9I3LgV475mabqZm?=
 =?us-ascii?Q?Pv2dNIIvWawW7xMuzunIFvJMW9+IjhC0J7aFNmRjc5mSNsHANCcpYhZUbGQN?=
 =?us-ascii?Q?oWnnVYYBx6BgkFeMVyx+aSubdmK6YBbA3op2Ho/DWQFNs2V1vzPEwS5HAMdu?=
 =?us-ascii?Q?CbZSRmP9BsQe3WINacmEvtDx/6QzYpAbSkxAAzcWrypuMUWVCu8UrYAeJj2j?=
 =?us-ascii?Q?gR1clegDyKrC5tW8z+p0A7wWYvmqwKVEQz63h8fsxOzI/jUPT4yIr6soIyjG?=
 =?us-ascii?Q?jtywrcy0VNpN4/NT3alLFqsCJH6agSL9s9WqGV/tPi7wrL9tZ5Ni2FAjy74K?=
 =?us-ascii?Q?Xe5sdyJusj/Jzm5MpBI/WM8NUSPogHLnA8dYq3DCj7VuvFIAjmM3dkY8XWkp?=
 =?us-ascii?Q?3EgOE6vc4XywvqkjqKFyzm5dB5kRxKg+NOJKrtFMxRzc0ThZ2X+SiKfFeXK7?=
 =?us-ascii?Q?GmuUEip1lWLpTSybcjh2RI1H+g62P5OAyN7XuF8Gz4zv+5tZYQNhm/A97OHr?=
 =?us-ascii?Q?ME175guQeyH0zkk+lofp3h7KlWav3JMbbcsA19chJP317PHFVju0qPQnzBYS?=
 =?us-ascii?Q?VzXVXuacjgFoqAwUn331jCW1e4MfKs4i0I18hm0wMxLJyig3beuUaCgHJUX5?=
 =?us-ascii?Q?dVhghQ+jSXMQckKGrrsiXDbx3mJog7PRDILQsAUvd99liSXgZiGtAh363S/O?=
 =?us-ascii?Q?eetigzO4JxLNiORPWnRKFut9Kjrgcm/aCzEblLKrLPHt6hgwvhbi+W7YTBmz?=
 =?us-ascii?Q?ugipZnN2rD+7VHDxEhHaDkdQ44Cs0KF0eo2n48GX+OhFrup488UHbGeyWxTF?=
 =?us-ascii?Q?HUE+DZsXy8BuaeJq+J3RBWZYl0vlpvrezauzt/udjhSy+P2cExoJYVFi0v9y?=
 =?us-ascii?Q?CN8VgFiJYmqOqZ2vv7t6UEWyP64WHXmM576pZ1F4NBgmBpfPT1qCtcITsJ5F?=
 =?us-ascii?Q?k67pgVk1M0OdHGxwtkQqibtQV7+KWEKkl9nqTlYz/TW67is73oo9iF27cTCM?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2071a08c-a230-4670-20f8-08dde6d8ac1c
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:23.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VExorq/IwUXxxWqsUIx2ZXWNXck8fgRarzvVC562QXytepE2OfzPQa67n66mgWiPQ7LAKrjtTW9Fkac+9UIjIpyoECQ9JAiFkZqd+CDVBaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1418

Add documents for the Wave6 video codec on NXP i.MX SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/nxp,imx95-vpu.yaml         | 145 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
new file mode 100644
index 000000000000..34917997f8d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, Wave6 codec IP functionality is split between
+  the VPU control region and the VPU core region.
+  The VPU control region manages shared resources such as firmware memory,
+  while the VPU core region provides encoding and decoding
+  capabilities. The VPU core cannot operate independently without
+  the VPU control region.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-vpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the SRAM memory region node.
+
+  "#cooling-cells":
+    const: 2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^video-core@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - nxp,imx95-vpu-core
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - power-domains
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      vpu: video-codec@4c4c0000 {
+        compatible = "nxp,imx95-vpu";
+        reg = <0x0 0x4c4c0000 0x0 0x10000>;
+        clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        power-domains = <&scmi_perf 10>;
+        memory-region = <&vpu_boot>;
+        sram = <&sram1>;
+        #cooling-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        vpucore0: video-core@4c480000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c480000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpucore1: video-core@4c490000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c490000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpucore2: video-core@4c4a0000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c4a0000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+        };
+
+        vpucore3: video-core@4c4b0000 {
+          compatible = "nxp,imx95-vpu-core";
+          reg = <0x0 0x4c4b0000 0x0 0x10000>;
+          clocks = <&scmi_clk 115>;
+          power-domains = <&scmi_devpd 21>;
+          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 41e9014db574..c0e1eb867758 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27070,6 +27070,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.31.1


