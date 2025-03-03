Return-Path: <linux-media+bounces-27383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D254DA4C690
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3271897F9D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1602356A8;
	Mon,  3 Mar 2025 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CHaYktUj"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F839234973;
	Mon,  3 Mar 2025 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018169; cv=fail; b=o9DgK3yCP9L33oKbdptYiGpijU4Gq1eGDnuuKVXxb6OCFLDFvzHij6xpsgqfrTMXEBrXNAWNgMoOyIyY73OZ8cSysnhO66jdcuto2PGlKOSXkWM3CFTybTTe9lIPaKuVR25K6bpk/GgqKAm/uI8JGPnseKogLBpFzVsq7YjtqNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018169; c=relaxed/simple;
	bh=SnGoffV7KoKPcrNJgbjqkgpI7d/Sj9Xn70t5R/6HS/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZTXU0knObHcU2SNB7EPIlsM8RdrbwgN8jvfSVt9LLXdlyReV0qh5wu3EQy7UmD+YmcWEnXUe4eJxo8m2s8/FMvjh+74ZJriFpQR5vhTZ7TLxDLsP6wpu1o+r+zEB7n72O5e5zptVc9zOZnEOl/LnVBDhJro/PsAOr1icXXDzZ0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CHaYktUj; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXHUhzamtx3d+kivcNS2SSc6urJze0iQl/AlcJdrzNwu+q4RM6K5sJaSmO6L5Z1Jdfec1o0rlW9IzgDs6ck4tiomXHmiMKYzaL2lDDGNlDEG87CSEh1iSwacKT5ZWyJqE8Ikaljh6lbrrWvKnpVxKi6XdOd2fH70r22I3x7jlM+stZFC83mvHR9SHomVGTF4C3UPSL8kZ7HEKQI1XFHPftiMfilRpNeYxIKo/uZkKV2yAnMR2gMfgRoXjjHr0ETdqBOvpHZpadbkUmS49UlwPieGey8mjmX6C/bTioj8ujGD/lrz3Pq1asIG5yxE1katRHh1TPBOgiMEtquTTo+++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeTVvrxRPDF2295q33BvUfAszfh/9fBZfnq2iST2iJA=;
 b=YfJu3P34dfHx4PEZ9tigJODufl0tHN9lT6OCepJk31bz0QY08HWIRl7ZgtX4FDfngcb7ARS4de5LSfeZNuOcyj3fVdsIKjsqITWwRdWkQ47rkKXLiD630uTgr+Svad4tHXbE07vCPCCQrA6wwlyeM1tdKHkPTor9nH9pe+z/stl82mW8+qwwvRiePbyV/+ZxwMFhFbB3/EVxYOqem+YMmtPJ1M1tY9BALfuFd8UqrvGmYq1sac8DC7YvlH7wVfVS2Kab8/gHkwFxx5Mxa68i/ZQQwjbPqFbYqRp9klWmWyoIprz9nNtBCKG6xHSQaFDnTyYIxENYaRqR6VGXcrM0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeTVvrxRPDF2295q33BvUfAszfh/9fBZfnq2iST2iJA=;
 b=CHaYktUjM4f1SNWyvSsXpBhG2mNv4YFXOeSJxM6BrDYXBTOhXYo5EHaDP9wPtQiMzWQtVKac7910uaGN7zH1LYc4MQ6Ioy1/BCpmlwKzENnsQ8cTe4JtbPYwPIzgP58MO8czlR+kFxF/qkIbjvhf99FSctrEEaHlu3wuFAv817A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:24 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:24 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Mon,  3 Mar 2025 17:07:42 +0100
Message-ID: <20250303160834.3493507-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: f5dcd4fa-8543-486e-1012-08dd5a6dc426
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7FHNAlnpcPv9pcIqBnRPsvDsgvetyqFniHsqa86rQ7/OkBqCbPnRvQt4Di8L?=
 =?us-ascii?Q?UwmLgWovQ9rf/wmHMd6bXllA9vfoVbuGJs4TlDfjgOKLaXdvlNHd0toPQeX1?=
 =?us-ascii?Q?NfkT/tdhbwJ02mUcBt0GVPxuS5UxPYPhQLNg+fBkjgDZRg+RI61d5xAx8eix?=
 =?us-ascii?Q?akTKkArhECwfzNp1UgtmsC3u/z8OfSd1uvscAwD9d2CcRkLR7wGYJgdIRJXJ?=
 =?us-ascii?Q?OLNFpjfjyz5aoXppQI7B7iCL7d8EkrlGmjPukUencHhcUjUaBS97xTtisFCo?=
 =?us-ascii?Q?IPb3NCf0JknfC9yqnCdtZ92OluUMvXIDO86MWc/IM2nN7xvh0HuLwtGNLjsc?=
 =?us-ascii?Q?N2iTz/WDVE3BnfrdbzpIZXggC822/VUY5d83mMekz51ryocS0VhW70W9AYtI?=
 =?us-ascii?Q?hsZq47rojrQoV5323A43PWeDLAc/vy9v5c5U81FWnfDToocy+MJABDpS2HLB?=
 =?us-ascii?Q?n9L/NcptCEywtcn35CuQ5z/kwSVmrhpSj2/lMAOpuqFqdHTtsTdcEQh4G5kr?=
 =?us-ascii?Q?9wxIgP1WTRUnJ7qT2dMkvdpB1knVWDVFZ6itOotKFiwofMPNm7s58APqcm/1?=
 =?us-ascii?Q?9T91H1G+1WM7cImayJZCTypB+PorPmJYFN53C+pzdsZyfHWZCG4HWRVBv7vG?=
 =?us-ascii?Q?IFeNm2gjnEiGYb5JU2JMV4eDIRGmHnkaZ+u2PS15ODnRpA3O6pr3ry3PZ7PV?=
 =?us-ascii?Q?/GcYNq20gvicb6RU+kIANTMLixrFF4ogv6SHLQnScW41Z4dawaVPbXmtWCeC?=
 =?us-ascii?Q?Uw7qwg1Njt97IJOPAp8nkhNXJqd7e8BWD/y3nFa50ol4Tyb1M91Iy+BYXQhE?=
 =?us-ascii?Q?tM9UaI0mk/SmOXZ+mars0tSvhlUUKYX8yQPWeDTJbnWVeu1v7aQvPuXLP4fh?=
 =?us-ascii?Q?Za2BW8zyaHBsbSWoETXMCXBBDo+kjxgxHcsFHjzlm3VxomcZ/r98Sk25NDqz?=
 =?us-ascii?Q?DHQQGoFU8sNZcIs99+G6oeOy8wJYLY4Fj3dWtK1Ke0rr1xht5Cz64ueGYoeE?=
 =?us-ascii?Q?VyPKs1LPKlj04VF9rzveD0qpCdB6vEyWkWidLHUh5dIJABaEHUz3HWGcik2U?=
 =?us-ascii?Q?ZGbU0t3MKTkstzHr+wjrFWzc9ynTIUoL/GOlxYkloNDMVpkp2dUjiK9bvxlE?=
 =?us-ascii?Q?PXJMUg6ezBN48x8dOxcLaDoDQVNl9dhjuYu9uaeZkQCBxRfacTo60UtAt1lH?=
 =?us-ascii?Q?PjOpqmwqP1iyOAEIMknkug05lNNy0+wIFtOuVOA/PMawl0FX8QkoZ2ASWWAZ?=
 =?us-ascii?Q?LOjj3TVLqfJr13Jp8L3HiLhswBcQVB9e3yGpNk/cOictCmty6Nle3EXSBalo?=
 =?us-ascii?Q?wfCln6Kf+sj7edPJJcuMNVN8H3vF+J8JUHJEP4Wth0jUZQYWqB9SgJaGm4BH?=
 =?us-ascii?Q?OepVK19DKDQN5EO2KMDG2Yn+flrvYIiCi/RA9RHgvlltJ7CWMcoEWqmlbgLI?=
 =?us-ascii?Q?Pc2MO8ZqmygaF0qUA3iwWgFqkbdHpKZ/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8ODs62xfZ/O3VhqSk5Oo9gdUg8adRO6VmNjbTUEr6pZs2g72n5oKMwFTy5zA?=
 =?us-ascii?Q?RSLhZ3kCXZZEh2W/0hCGNa4sbassdFwzfLEbHvLPzKMUEyBBUssAHi3Xn00X?=
 =?us-ascii?Q?hzrtle0hoL0QG6lUM/vh1RjqphwVBf6N5yIQeUFOjE+xHn0EQwbieL73o228?=
 =?us-ascii?Q?CJhaFsKjSrsK8tpPDa883OVoUzfCsaBrfVsexqnVIHny2Wl2LnfXkrr4hJz5?=
 =?us-ascii?Q?nBYHJSP4/efjpkqfwvGV4lXXRsTrqC4TYKjLwpb0Q85WnGTBphwu5wSh8T+Q?=
 =?us-ascii?Q?Cl54oqAdeR0x9/sHTkebnGOSjU7sKjViIfVdHjLBF2Vt8jVdU9AzSFYQJ5LL?=
 =?us-ascii?Q?pIpU9FKwv42+liGNK7h2wMPPnSVBl8XFy7osIrgPgkF/71wZYznXtkAfkp7t?=
 =?us-ascii?Q?WWYU5eUQ6e4eRLGJtyny436au+r20hOKFDEiYDIEFzZSGLtCNwnuAm2q4+AJ?=
 =?us-ascii?Q?EvW0UPRLxFv+NCZemr1E22CUC25xTLAucvHnx+geUdmxpiZr5Ykx4kTkGrqq?=
 =?us-ascii?Q?pkcQKEgYPmIy/DJTfSLBpy8pB75ndwU2sFkOsAmnoxxrs5jCxJ4kiCpjk8OS?=
 =?us-ascii?Q?uJVGBMQq5j5bg054O3XlAfaOzSYTAw1MKICLAI/ZYpleHmeBkjSKcLYTSVlB?=
 =?us-ascii?Q?9qLJGSy8d/BwHjw6iLJilW1tFdtV/8CaEjr95/FxvmSkUQHponida6z49J/H?=
 =?us-ascii?Q?OQzO4ows/eJV1LkpnO7wQaaTAqAQGGWCu3XK4cWNsTMJBOfGuZcrWaroEMSp?=
 =?us-ascii?Q?0K54U9v4qN0O3QW2i36xqQbjvLkwQ2y0jnXZa2jjgopVcP5hLl2p9NdbVtfI?=
 =?us-ascii?Q?YQ1MvFLIr+s9qyhMGLx0NGq7qQQEai4NkttSQY8HdQRaWlyIyFqI/7ADMZk2?=
 =?us-ascii?Q?K7ES7iW2BYMZMZkJVZ3eY9tWqBS+BkP2TDztmUXiInLqdcyOWrAvoalfKNY8?=
 =?us-ascii?Q?sBe6e0drDTkgyYvK2DNhAd/SwWfJGf9q1ZKimikfOAABwb2yd2XzHKs3MeNb?=
 =?us-ascii?Q?trNdgWR0N3pyCyt3MMPNsayDwLl3OejjwG9H9ltyh2T8ET+jTI/k67EMGQ/U?=
 =?us-ascii?Q?Rp54ctN6Ilw+Dbf1okySZC5VoB1wz7Bqmc1HO9k9oJ/yJ6iD2h+ZpTQCxOLd?=
 =?us-ascii?Q?VIarrrNCa0MC4F0dsWr7jT0rK/5tS0j1oMdUUvXgWDmUUoLbcqhVBdFp9jMI?=
 =?us-ascii?Q?uI8VJNECdEWuQVABNDmK9mHqCgJFZpCUtYjhD8j3owgxY5ALjH/2eEoFml1Y?=
 =?us-ascii?Q?Zb+8peU/jZEU80HN4RFBCtUE7fDmV3/6IG9oiwwPRG6HZnPbXOhqPN2onByk?=
 =?us-ascii?Q?k06xGxH3Up9wK2MrKZN5/P/Hs59qsDcLVLPtoRbB4yUXRF+nmxYOFqBrpcWI?=
 =?us-ascii?Q?Gq76iGMDDrvhtPsidnHqjPFf86eWg9HlqM5M5brqi0CD8FPWMkGxfyq+BYad?=
 =?us-ascii?Q?6giqSrwFzJvU4NPqQuu6jh9BRl8WNjQtuXJt+I9dioGPSFYgaifKSICdwLo0?=
 =?us-ascii?Q?bvE+FAW5aFCyN21vBZb8W+EchL3nmgh/grxcOHsjGyKT47AxSjNcDuNWIqn7?=
 =?us-ascii?Q?1wiheTd+c+fnSLibt7BxH/2bJsayg0QSKeLhIKsXbyfLGuA0PqTJj/K+ZxAP?=
 =?us-ascii?Q?V7bGGLeBDHnmMm4+vrnp4Qs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dcd4fa-8543-486e-1012-08dd5a6dc426
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:24.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke+MHQ7lOcnrByTlw/H7+qwNlpZ01PuopAB2Y/B4ImPf9ytIW6JBuanHAo4eWdYuEsRLXEUt/SMgAvCkyZ0KjedUPgrv2H9mtww72c2c16e+G7RRuEvVCVf5EQEExpY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed CRU_CMN_RSTB as suggested by LPinchart
 - Collected tags.

Changes since v3:
 - Collected tag.

 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 1f9ee37584b3..c5c511c9f0db 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -24,6 +24,9 @@ properties:
               - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
               - renesas,r9a07g054-csi2 # RZ/V2L
           - const: renesas,rzg2l-csi2
+      - items:
+          - const: renesas,r9a09g047-csi2 # RZ/G3E
+          - const: renesas,r9a09g057-csi2
       - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
-- 
2.43.0


