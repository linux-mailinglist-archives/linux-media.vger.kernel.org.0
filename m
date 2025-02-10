Return-Path: <linux-media+bounces-25883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7172A2E740
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3673A451D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838521C5F30;
	Mon, 10 Feb 2025 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="T6s0gX/o"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021140.outbound.protection.outlook.com [40.107.42.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167DD1C5D4C;
	Mon, 10 Feb 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178467; cv=fail; b=DWIqGF8Bnjba483nWCJy6Eg6SlKnQqKwc+fyjf6/6apBut+qy5VxJYEHA7LckzarJVJezl3FSJ/sCH2f9ohV7mXPZn4d2etDEeXwQInwQLSDzanFE4fuYRYYDhVZ/UeNO0I5DLFe/iyZEwmV4APDvr9Xer+HTO/Bn4VNQbSJkaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178467; c=relaxed/simple;
	bh=DianqpdKXUsXSFLPO4PRUcBNHWYu0IR2HAJU+rlWwu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KWOaX6sgR5meMBM3b4QXnSExVyF0ZzSULYaDbUY0EIji4lQbMm5QAkXnRoLqllLvT8K0LoTi0uO0NohyuWIyAxkDJ8iLfAdUEYsLWm1unbKO44BBFgDUbHainXlB2bqqQjXWZyjqAFjjAX3GoxJrjrU8Bc+knaPoHdoyXiyRZbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=T6s0gX/o; arc=fail smtp.client-ip=40.107.42.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCGvW/toU5fWM/58HocYabMxGZVIqKGxhp4KUjP5pt6VJWOw8L/0+qaRkMKpxT52nICWCu8vGh0YL3xN2ZFhBbwvPLJ1JZnJVW44K3ieuDME5IJrNptb81d1Id0DkvpjlcunJVqpZoeiA9x8w2GrGs7HHwwolBckD6uypq0aLFb0CcJ4C8xZs6JdTxNa2ob/kFTJ+3AIhWY7l4/Rui9srmXEKM3qsUySq8HT2BoZLoysp8aBwqkeW6+RRCMlinE5N9/si/KMcLalj9MKByu/0DNW6Pqz2KrAK6BE1rM/soKqAC3o+6Ov9ThjfWYAwMige4bx3477XKAYifT57/VTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vC+la9e42yPkXL92NB0L4D/kS7TT+UTGpL/3nZaRX70=;
 b=WG1M3lfuurfzW6b9LbsI0n+UETwc7KC8+DPCPetGgPPYfkc1sGWDjspClyhZ/DG5V10sIfqvy44SbGHeU5p4JnLGoJLU0G5Z/FqPkR79xW8di+hjKO8UodMHICjpaF8XSU9zR+vyRGdgjaOjV95MNGZWll58ExrMKQV6+Rh5EKnTBTXYTpQwlLyJOFW+8l+gXU0OAClYrPkkOtNN2r7e3rCte27S8z3KJdqwasBFA4BvoZtbZaX4L1VDThdaV8G0O2DQYmLTaRzY0Lf6KEKjFx3fGK7/YmwIjd32L9Xby0FbB068LZPJvqDpNScjFQ9bS8nVAowqHGipdkGzx0fPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC+la9e42yPkXL92NB0L4D/kS7TT+UTGpL/3nZaRX70=;
 b=T6s0gX/oB9AwT23gE0qvUXfikMoosZ3851Gyw8qCruqSVYkOsLUi8PGRM6RWZPCE/lK7NGzvjn6Eot7/MTtb1TlOY9cKvAk+5WB070wHq5zOXQrmH3lYVPs2n0ATqWpSdtIUxEF2TD/CgYCtueZLCLQJfiDfzYNsVZ064pvJerU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:36 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Mon, 10 Feb 2025 18:07:20 +0900
Message-Id: <20250210090725.4580-4-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: 0897e959-f280-4a79-6f8d-08dd49b25c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tps3iHLWl6uRy1hyLrBA+6OzpJeGiuosgNRbuNLKaoNaXLWKGuVoEKJxpJmA?=
 =?us-ascii?Q?zmQFFr/al8m0MIE2igr9vOFsXaNWvHWT88LVjWLBzuEReBgUQrzm9Pm8Iqez?=
 =?us-ascii?Q?nSGQ+fu+HWkTwdrJZ+6YUXttFd01pJ71FdAaDLF4K/JxFsYmTLE0MsNXgEbq?=
 =?us-ascii?Q?pyYOBwPKBVGpFjF9RWkimPxvbVdNPMw1edn2RBr/G2wAtSZPGDNo1+8a48c7?=
 =?us-ascii?Q?mQAMYEjnAaWohgqDuVeV6pAvO8OMX4S1PNQT0Xy9eZSXdckHlGmyAJ9siMMH?=
 =?us-ascii?Q?NnnaK/EzC5CT+pWqIZlsZ4iIkVRq9+CfPXYfAI9SSZNx5MUl5mDb7CB08xEu?=
 =?us-ascii?Q?o4TI9trH+3d13WgQ8B52Yr/sUb41HES8rfVQ8d+9H65DFuGLMVhqOGx6dpMG?=
 =?us-ascii?Q?qLPl8KtIq+DTelO44krPtwgmgjpV5ypk/3ktsKzmWd50qi6+eMdNwZURaZ+s?=
 =?us-ascii?Q?zk2AIyCK2wO+W5SWFDKCuO4YuhOoOLlMhTfmj3S75Uh8OlhSradQvIEkz4W8?=
 =?us-ascii?Q?XdRdgaKD1PzibWIZ6FzH6fpPErPwM+RvEM0JZcxgcYvxnpT1baHuYQYRhbER?=
 =?us-ascii?Q?79kx3bxhaCI7hWoOCWDyulw3sVIB3Dboyb3qU4mX0UzXoiGE8i5Cgfwuqr3C?=
 =?us-ascii?Q?Q2rhgy1cIrZ7IxwYt5Lb2qt38M5m2NYzXd8OR58tfwPsMtaFnPVcDA/rjHU8?=
 =?us-ascii?Q?IXFvhVZjJJsdWM0TMGm2x2ShsK3koc3Q/Flv42VhbcuUotlMmexOjp0PurHm?=
 =?us-ascii?Q?SFp9SINk95we3W75r1bDM0sOteSxrlcr4LDj3UdfpVPXo/T58AExDTq3AVeb?=
 =?us-ascii?Q?gis+acaswHwowDe0Rg78QXQy65DniQ/V4UwlNgV3SrNNAE2CfQbi246Kpq75?=
 =?us-ascii?Q?vBaj27OdlhGXZ4dMNUvnNMXejuI6NTaKHM8ttyqJOZoJFMoHYh3TkOYWxMM2?=
 =?us-ascii?Q?mEGMG2KUOS4N1q/tzO6pknlv0kWvjsFfHNTD9umsPhfz3tmDpUD5YFiQsSpA?=
 =?us-ascii?Q?N13xjCc7Gpno464JtG2T6IDiHfBpHuAVPKu4WaLLd0T4PrD5469qqsCzM4N1?=
 =?us-ascii?Q?jNWjtmT80XtNlPl4K3N4Nyqm5U3rZV19AKAROPb20q6z2RcftaLXaqLy8dXd?=
 =?us-ascii?Q?mWsBC+j03ssxvWkHqZnkaG+PE63gT6o0VQa6D83UFUR47wifQNKx5s9X7vXs?=
 =?us-ascii?Q?H8M+8h9A8ByMZd8ewR3vx29aUk/dgWQ/lWqoHwBXlSaWu/GboQ+w66BS7kU7?=
 =?us-ascii?Q?4IkszzPRn1L6MEDkDUYS9AxYJOmRBPdJ/jDRclq0vinaNgRKMiJopsOIbQiQ?=
 =?us-ascii?Q?lmBNBO74J3AtPJfpV6xBJAHguHDWlefpZEH1hxW/dI9InH9zjl9zBaeuCmmm?=
 =?us-ascii?Q?B4+N5ihexttUEihTBXcK10erPsVj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r4TcN572nr33GTcDNggKwjyQjr7DoZM8WG4GDOxAOrwIxFyftvpTsPsqC69b?=
 =?us-ascii?Q?8PhyeTIYGFWp4zL6jw1iTZacW13tHFk7eru6t/B2640g1rdITnKe4thmKCJU?=
 =?us-ascii?Q?b6hu7FytuO5a+nuphUhLvY7dC6DJQeGXwggdhz9m04ehK3te5f2+FWmqs9bR?=
 =?us-ascii?Q?j54ZIIY4W/6wz8LnvkNwF56losgranGbKkBUOt3niKtE4N2UuT9/UftFUUSR?=
 =?us-ascii?Q?3rDYA6IGf50UNEe5/wI9iEYerObVnKPrdjXpJ4rCfgKwnNOvtcqcghDKDdUt?=
 =?us-ascii?Q?T+Q1PdbVWuc+E/EjXMEo6SjgocHC4STcNZ+M4B+v/vbu3As2Qap4WFbZDgmp?=
 =?us-ascii?Q?MbnvfO7decElhyBGW/PKEL9g8I5Xznsf/TfNjXAq2+bnmVnlooL0wNu+2CIt?=
 =?us-ascii?Q?oWkXqMQ0GaqdsDodQseGWVQp5RKjiIrArPqQVS1SYiT34n7EbkDVtwFJ0oSS?=
 =?us-ascii?Q?c7+WUvd2bK60rp13/+NG+CEGX5VKu9y2+DxdWmn4ehKcwsiZC2voUohGUpws?=
 =?us-ascii?Q?eujmvCax3kEoNTsBnWwioo//CkzTIkf1pv6Kcu44I79S9YbVi2eFbuIQdjuo?=
 =?us-ascii?Q?1iXBfVXWs3tUMkUdOarfyhyq5FoyxZy0NaYQ3EiOy8xjVLuxKYMjG5Lzp7fb?=
 =?us-ascii?Q?KKf4VpMiumeDrM2jKJPJxPtORr6M99JHEc2GhIFZroG8LhgZ6vQSfFq/e6HI?=
 =?us-ascii?Q?a2DL7L9KmSvfeaLwuZPpST/d8+aRrNuTo9j1FMzEqdKifICy1G2hQ8CBtUN4?=
 =?us-ascii?Q?dX/KoqcyZJPeHbe9ap/cZF2HDaU7rOep6brnwvWYwI91NBJ4wtubejvWczTF?=
 =?us-ascii?Q?qRhJpXKWVYaAyjTb3VfQM+zNw+0dcIgDDt152ywsxVUxKwjkLheGhuEBXU5w?=
 =?us-ascii?Q?Fxy9nte86U66YzELTY1PEkD99wRoE+aNS0fuwlwCx83mvYjcfvJqNbVSBt5d?=
 =?us-ascii?Q?nfrrGjyPUndftclIwWE3M3ZdOrU5PHrSzxRstIdd3ZNlvcDejMVF0BWMHaGJ?=
 =?us-ascii?Q?reV+nuujNonAKfeBGZwgwsDqr0icWKYvcg7dJU7AbG8+fUTOItdbtLrDhcSt?=
 =?us-ascii?Q?4rtxKqIhzI6reUL/sRLnAR4mkxot+5VfaDIwLNmUk16autywv18HfOx/mouB?=
 =?us-ascii?Q?e7E26nWQybyQiFOlwnM/yt28YLgd9dfdmUtjRK/J2zikYu5UEobbnZBe0Esz?=
 =?us-ascii?Q?PKbEcAHYoGF2IktlQownDnzKwABE1HSKiZT6qPiqOUvpELeBAKqxbMXZqhNv?=
 =?us-ascii?Q?RrinzySUR6d6BpnhRTiQMqIc07LlV8pbB1MjcYTFherNpEg2CV6DnfxQCfie?=
 =?us-ascii?Q?2mKbTUWsXoactlU15G9sPWvVJbKZBfXzLUVE1r4j/eCWF+e9TSovhYxdhIuv?=
 =?us-ascii?Q?W/b+SsU+HzTnqcQFEPR0jjGlyMc9PKmpnJKIrzLFGVfCrLS0TpYb6iYSU/Q6?=
 =?us-ascii?Q?+RKoWKsaEcYNLnRnvRebKkfFDbLAJp3na9OT+PaZ77L4uThMQvnuBJZ+4mEa?=
 =?us-ascii?Q?+i+sSLrv05mLsVWpUc6Ixd2HbkNFzy+kwEMScp8Xi5KkI7BgzP8QFJ/Z44pQ?=
 =?us-ascii?Q?SZ/ySeAPqOHpeGziHokM7t9OU4ZqIA3hjZ56ynMi/HIVKV02toktC4ipQoHp?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0897e959-f280-4a79-6f8d-08dd49b25c34
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:36.0536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxf5pco8ivD2o7P/b7NKO8gLJpXSwJCKzhUxM7eVE/0efYwwRLYnrLH7qBRL/Qlni4JJfu2CEOcNC1qfW4CPW8CX0f1mXHeVu51SjeenDTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

Add documents for the Wave6 video codec on NXP i.MX SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/nxp,wave633c.yaml          | 202 ++++++++++++++++++
 MAINTAINERS                                   |   8 +
 2 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,wave633c.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,wave633c.yaml b/Documentation/devicetree/bindings/media/nxp,wave633c.yaml
new file mode 100644
index 000000000000..99c3008314c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,wave633c.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,wave633c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs.
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, Wave6 codec IP functionality is split between the VPU control device
+  (vpu-ctrl) and the VPU device (vpu). The VPU control device manages shared resources
+  such as firmware access and power domains, while the VPU device provides encoding
+  and decoding capabilities. The VPU devie cannot operate independently
+  without the VPU control device.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,imx95-wave633c-ctrl
+          - nxp,imx95-wave633c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: VPU clock
+      - description: VPU associated block clock
+
+  clock-names:
+    items:
+      - const: vpu
+      - const: vpublk_wave
+
+  power-domains:
+    minItems: 1
+    items:
+      - description: Main VPU power domain
+      - description: Performance power domain
+
+  power-domain-names:
+    items:
+      - const: vpumix
+      - const: vpuperf
+
+  cnm,ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the VPU control device node. Required for VPU operation.
+
+  boot:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the boot memory region node for the VPU control device.
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the SRAM memory region node for the VPU control device.
+
+  '#cooling-cells':
+    const: 2
+
+  support-follower:
+    type: boolean
+    description: Indicates whether the VPU domain power always on.
+
+patternProperties:
+  "^vpu-ctrl@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nxp,imx95-wave633c-ctrl
+      reg: true
+      clocks: true
+      clock-names: true
+      power-domains:
+        items:
+          - description: Main VPU power domain
+          - description: Performance power domain
+      power-domain-names:
+        items:
+          - const: vpumix
+          - const: vpuperf
+      sram: true
+      boot: true
+      '#cooling-cells': true
+      support-follower: true
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+      - sram
+      - boot
+
+    additionalProperties: false
+
+  "^vpu@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nxp,imx95-wave633c
+      reg: true
+      interrupts: true
+      clocks: true
+      clock-names: true
+      power-domains:
+        maxItems: 1
+        description: Main VPU power domain
+      cnm,ctrl: true
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - clocks
+      - clock-names
+      - power-domains
+      - cnm,ctrl
+
+    additionalProperties: false
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
+      vpuctrl: vpu-ctrl@4c4c0000 {
+        compatible = "nxp,imx95-wave633c-ctrl";
+        reg = <0x0 0x4c4c0000 0x0 0x10000>;
+        clocks = <&scmi_clk 115>,
+            <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "vpu", "vpublk_wave";
+        power-domains = <&scmi_devpd 21>, <&scmi_perf 10>;
+        power-domain-names = "vpumix", "vpuperf";
+        #cooling-cells = <2>;
+        boot = <&vpu_boot>;
+        sram = <&sram1>;
+      };
+
+      vpu0: vpu@4c480000 {
+        compatible = "nxp,imx95-wave633c";
+        reg = <0x0 0x4c480000 0x0 0x10000>;
+        interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 115>,
+                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "vpu", "vpublk_wave";
+        power-domains = <&scmi_devpd 21>;
+        cnm,ctrl = <&vpuctrl>;
+      };
+
+      vpu1: vpu@4c490000 {
+        compatible = "nxp,imx95-wave633c";
+        reg = <0x0 0x4c490000 0x0 0x10000>;
+        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 115>,
+                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "vpu", "vpublk_wave";
+        power-domains = <&scmi_devpd 21>;
+        cnm,ctrl = <&vpuctrl>;
+      };
+
+      vpu2: vpu@4c4a0000 {
+        compatible = "nxp,imx95-wave633c";
+        reg = <0x0 0x4c4a0000 0x0 0x10000>;
+        interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 115>,
+                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "vpu", "vpublk_wave";
+        power-domains = <&scmi_devpd 21>;
+        cnm,ctrl = <&vpuctrl>;
+      };
+
+      vpu3: vpu@4c4b0000 {
+        compatible = "nxp,imx95-wave633c";
+        reg = <0x0 0x4c4b0000 0x0 0x10000>;
+        interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 115>,
+                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "vpu", "vpublk_wave";
+        power-domains = <&scmi_devpd 21>;
+        cnm,ctrl = <&vpuctrl>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..5ff5b1f1ced2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25462,6 +25462,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,wave633c.yaml
+F:	drivers/media/platform/chips-media/wave6/
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.31.1


