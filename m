Return-Path: <linux-media+bounces-25484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DAEA240BB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81AD81889FB5
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934FA1F5415;
	Fri, 31 Jan 2025 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dAAihuDY"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947951F4E52;
	Fri, 31 Jan 2025 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341292; cv=fail; b=Z0E/jYuaFzWVeGRrOsV1+DEBoHezuze+kW1E0C3ZvAF1xUJXL6JrDJqmZNjG5Hp47jmM+zth0y/qiOSRoALJga3rt2q4lj73RhmExEA7mkRuUh5l1jSrheZanmtaG41aHU0Jdx1pmc6UdTYYaySch2pK2PErf/gTp98vh6SYSHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341292; c=relaxed/simple;
	bh=WzJNASaAyqTw40nhxOqyg0Vs6gPQxfk+3aVs3/7tMbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qHdyc4T7aTpKFzDEeqyCc1QySkzdMA1xForUs8fbLCzL1cu9gXJ4yfZoklpEY2HTQDbpixRRcWrqzo1L9TRft88f7msy9c2ATB6Nq/IrSTjcpCRXVIskV7BGsQ5aJiT5eWhHWQF0PFX9EZwdnCbXgRbWm7pGsZyZd6akcNVX13w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dAAihuDY; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfRVJQVucqN8X9A5ijQlHWcBkXHT8S5RrhxLv1ciKR0M5BK93o6SyTLUmxUNfeArgRhMiEEUloOaje1OM1AVEjURYNv27y/jNAYRaY859iwlEeGOiSi5uBIheB3wZVmCwsVX5nsp34HA8aK873LPW8xof0sE7/MDRwP/ZT3uguXLUHdVR920Fs5MSGrigJOfiZbJnEj4i2mccpj6jhqquZx8f0QVwEhAN1JSbRDgIRavX/BfBrS5AunxXGh7FPIrju5VoEV+t32Z9TMTde5fMw28uykn6Wm5rbefpQZXg49YmI4y9xZR0u/M2pAaEQIWFaSVXRNhpsd4vjxONGPm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZSjDZKxZoP/9q0aJBxwZjcP0Jc3EyFsW7qHS2lKeoo=;
 b=kUG9nm/NChBNn/OmkObQmUvi77EqK7mE+g6gjZGYaFgULYJlMmetx/ueV+cT8ZlQEjXj49pVlo3dxtmPjhN0StsDWb3R61cXTFWCcgWKnVYAa7aWOTNvgPQ36hVmFK4xk18PfGoqXDJ639c+r/DDC350DnJNhkhqT+RGIepOva0mi1TRSZWJwZlFdJODrWq8xKXEBveAQqFoQK3cLnSCw+R9CvkQ9QYBHHsWnSeBm1tknmJJPf8HV0uy0K8nhLnHCp1HRjLu/0whGVXMWPS5+uWedKUHUR3HlocMka7bt1KjIpiYzywwamHuyBpfNg4h/RjIPF8Xx3vMu2/e12+gNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZSjDZKxZoP/9q0aJBxwZjcP0Jc3EyFsW7qHS2lKeoo=;
 b=dAAihuDYuT6BMVse1qBIFlhYDKB1IuChdDVCUwIxJ1HF3M6I624q5cwaD2jLMUXtQ4gH3k6omsEqveSZlrWYCu2aTJDfftL5jCIEthb/bFjANzuyyM5bUQQ7K6bbtsmu6dqwyA1jdfbSkvCLmGXZhtKBo0tqR7nlKlCrTXzbkZcDoF7mUZVmoPqf9mLkPT1LfDfHZxoHS1iDfjj1AUlqqGmUmPJNJPewgqSspRvquTlMlaPz1ieY+DkCsfMe5cZM0AvgNYgCsJJCrlIiUTWKtaUXPLBP+W15P8+USLfJsKSnbywfX7luOTzQD6adUN9tNLOiJrmBnU/byv0+RGlVRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:43 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:43 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 07/12] staging: media: max96712: add support for streams
Date: Fri, 31 Jan 2025 18:34:01 +0200
Message-Id: <20250131163408.2019144-8-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::33) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae0564a-a4df-4a14-2818-08dd42152a3b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qdi2upsIG6zA5UaIUMCa+UC8a/7TuUQOs1Aq0KvYtAOIw6moU7GeCXzBW7/H?=
 =?us-ascii?Q?hoG1/fJlgfnD1VmqhGk/chzDmuts5MUw0OoavLMA+uloOX0WMbIhaV27k0q4?=
 =?us-ascii?Q?vC5RTUlNLy2lm4dnpfIBB6YQbo57l8jH182sagtSEhLntQLdpqSQ0enJZwu3?=
 =?us-ascii?Q?n+pXdYACUhnrQ3ootP52NKoUmD/crqXCUaztXAaZJhOlYaqK41LHpvHtBMvb?=
 =?us-ascii?Q?qLiMmICj+lKxQne+Bi0piVWp7YLhcmOr9znmykn5bxUfzkX4zwSJYnUwLmZ2?=
 =?us-ascii?Q?+gkQ092N0wHgIZ7uxZaEpflQeeVk6Agnjps+X581i72aIbsxdt1jyDzTiWnz?=
 =?us-ascii?Q?62ScCu3TfoUPKGT3KP4VSy/9794aYFwx2HPFn9LdDZ9klfY+iiIj8R7ymn8s?=
 =?us-ascii?Q?ASY4rlp3G3/kwOzydsUZwLEpADCI4mnOf+cKO1N4/Excpo3O42kSWe8C1CaD?=
 =?us-ascii?Q?MV/cd0AWpytEO43nrVY+wOuNE6YQnyEu2ByCCBv6r7J8PmExDBHFSV0s95JA?=
 =?us-ascii?Q?TMCVKe0Ma9uO/VZ2s70FSmKNsZvlnIniWU3bFfUL9WAgIQgEJdNDQtJvpY16?=
 =?us-ascii?Q?Tgk2+EZQMnjKRVBH6Oc+1eq+GQI98ZdVTqdA289T4RTmRjSY9nIPetVguJnm?=
 =?us-ascii?Q?0wji9DBSeGKSopgGvwICCRS5atUICaC23kk977fq+VqbLXE8iyhRVbRmhctu?=
 =?us-ascii?Q?zMYn8aPpCdxLKDxVlhuUwPnAV2Zz24+aPXVQcjUwdIYqrizSzeytR2AIGXvg?=
 =?us-ascii?Q?3qnFBfVUVWEj0EggntPutS1BplVhS7N0vtikyveSctRkmJIJwsAOzzThJ01c?=
 =?us-ascii?Q?WKwm/EsZrD5LkmlgkvvlsLtfQReHc0cvwoOfq1LFe880HkXZCtnjkIKrtIOD?=
 =?us-ascii?Q?1B1U8rNs5o+QNr2NjycJeKnPtTQO8yd92VajLtd/lUEYawAFd7fbU2XRfBWH?=
 =?us-ascii?Q?8A1Cv2TvZyCtaGtxgbcz8H7QixuwSENFuxmGHQD4ECtyAG0jvtS7cK1VbnDs?=
 =?us-ascii?Q?krlMf5eQPp+R/4Iv1NN/f+XGdifezpCr6Mu4P7tG2RcI70pXGtYi28X5r7zD?=
 =?us-ascii?Q?Wf9fXcX3PMY9HUHXV8JKwPZrC9lbRAYhvbfSoRMqp9utzbkbHgeY/Ra5XNvL?=
 =?us-ascii?Q?kE8qviYCWivwJhNsNU07Z5lHlg8U96kXDaH5RatmGSNsKpFPOIoeMysmQ/T6?=
 =?us-ascii?Q?uWOj9PGGDEtH2YXKhtiVw5IkRULWqOjhNGOyC1xtnlVKu6nEjzRs7LZTmN4r?=
 =?us-ascii?Q?4DuNfR9TNISHO0kM4mWzLV7rsQFONULbOX44PP0j8lCoTZCtrIuSX526xr4D?=
 =?us-ascii?Q?H/MRm3XH+oAx/oYtRJ/Iazh5jNBHjPVNltgyZxVuzJEd4Wprmm0q/oax8bZK?=
 =?us-ascii?Q?6MRXgXLEcaK9l+/JL2trrjpu9xFn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S7qR0Y5thErn1F3OiA3RyqyqhqLlLDZGItWOrlIFn7q2JL/Ni1rA4ejs5t0m?=
 =?us-ascii?Q?l6kD+TbATE+s9e7yXHOApZ1+3Km4u98XODweztdo0dmhTtw9hute5WCRi9rV?=
 =?us-ascii?Q?Eq+bqeAtz7SlQMJKOjeQ70YxkkY0daBz/Dd2wdEBpfRgxNHhTiXjN8y90b6n?=
 =?us-ascii?Q?3yj9i2MqFxHGqKsQIDoHfFShSwB9NkAYdZgeM9uZ9xxVZ+iGsLnUSf8uFxSV?=
 =?us-ascii?Q?ldNM+6OwGYDQW9Wk2CBQn7NBP0qk4LfrT4rBvCOpR2PD3MIpVI5pO9WNasa6?=
 =?us-ascii?Q?6mMg8Z3lzmtyT8/w7PNVURy3B7XfBUhoN0Sp8dhdm4BSyO86YmD0GR61/Rx4?=
 =?us-ascii?Q?6yMMc43rJKnfxm/tzOROmCy21Ai9iS2dvIpj0+sSPpXmmojI27+WMpcNZt9x?=
 =?us-ascii?Q?WM4BjARS+Y9p0FIzFr/xG0yCMM5WJ0GgwfooWuV/oIv5gK328p+w76/VuXeA?=
 =?us-ascii?Q?A3IERo6yobIwJs5IYu6xqRdejecHWJ7FIc4UKK9VwgDp0PvIrK2KiVehp04A?=
 =?us-ascii?Q?xc05hQIYscKtOnJvthxN9I7p5C2SCv51aMlXCTRSqcCXkE4fhx1X84p/VYQs?=
 =?us-ascii?Q?nUNlr2Cjf2FGBWcVX261V0f9ut38j7cHP25+Wnj+oV89cSnpgeVXkVGLWP0L?=
 =?us-ascii?Q?+XXc7Hz083MzHrSn+WZRsSJtk0ZqhtpngGpKdhrhlh8UPdh1z9CzFlOswB8v?=
 =?us-ascii?Q?a4YvZJGxv9UAwm+vBqqbowk4MMDdAAsmvZrPNZkmHSSbzE5rFOWvGQIUsqce?=
 =?us-ascii?Q?YVGS7BPO/MjhsK9ivwQHFFa1g8XSLuBxXursLJmv7ympu29EMkYccoYf5RJy?=
 =?us-ascii?Q?tZsQ2LCwBi5MZ+uOL2XNcpTe+6iN+WtphK8soTu8a/31YZMwiX/UvhvfroXd?=
 =?us-ascii?Q?cz4HuVglmjCPatOwWvqiKz2hOcT5KMQwbiyeRofc16bsdcntZ5wHUr0lvogy?=
 =?us-ascii?Q?JgfJ4RaDSLcY7ekq0sLlNnmFoGtSSFk1V0Ep1vS5Ymjwj8B2m1UvWiJr3b0+?=
 =?us-ascii?Q?UfBGvESFNJbmEItkSh/j2xjt3phijbOsD9sUBZzh5ycWNTmVQvW3jkLc591W?=
 =?us-ascii?Q?f8FpmKhNiwaHSVt/aEgs2lYEztcQWObSnQP6dp9yFLYPN2Z+qoCWhIxKLE6U?=
 =?us-ascii?Q?v4rRGch7RX4HVTZJy6aG+36yhMjLvI9jvI9JdjrqpNetqt9HkNYFsXuoXokH?=
 =?us-ascii?Q?h3GSIiL5B1vaf8gdueOdPlhwELvAq2U3Lm8F0eS5LYvHrz55ZT+sgj+GrPkB?=
 =?us-ascii?Q?zVCI/IcL7fagCZikOIlsFimidXeI5pMjp4FFIuRHyJ+4gFQzk5ipOEbo2tEj?=
 =?us-ascii?Q?UZa8C8meG+Mj8rPui9/Aa1M+wmkVJYdk5QJcAvFz048+B1dv4y8bcJ+xwyJN?=
 =?us-ascii?Q?ZoFkPtojSjJulTy0cNC6h3jLAYkfzsvoUyHl3GgwDf4Uhsb8S0BVAlq8R2yO?=
 =?us-ascii?Q?fIXIY4ZLwbFNRE14q09/HMceA3CgKwIa2SrM07n+KvKABC3M9kcxlqDgqnJm?=
 =?us-ascii?Q?GlTG6tphQRDybu9hBJvR6gKxAsw6i6uV++U/GuOWJYPRiOjvVnbzNwKaa2iB?=
 =?us-ascii?Q?DYjcp796UNlacYxDbu7HSmi7uW+7MnNlG23PZF9YunBAGY9tscSG8VrNPfX/?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0564a-a4df-4a14-2818-08dd42152a3b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:42.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iImW4zRKbdEP60rtAygTFAuiKq4rQQ/+jZ15RebaFo0dq8Oq3PXzZrPnV7ODZBjwes2vPdv97jexF/0Jfr/QxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

Since the chip supports 4 incoming GMSL links allowing for 4 sensors to
be connected, we need to add support for streams if we are to use more
than one sensor with this deserializer.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 177 +++++++++++++++++++---
 1 file changed, 158 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index f68a1d241b846..a078e4c67c360 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -13,6 +13,7 @@
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -153,6 +154,10 @@
 							 MAX96712_MAX_TX_PORTS + \
 							 MAX96712_MAX_VPG_PORTS)
 
+#define MAX96712_FIRST_SOURCE_PAD			MAX96712_MAX_RX_PORTS
+#define MAX96712_VPG_PAD				(MAX96712_FIRST_SOURCE_PAD + \
+							 MAX96712_MAX_TX_PORTS)
+
 #define MHZ(f)						((f) * 1000000U)
 
 enum max96712_pattern {
@@ -194,6 +199,16 @@ struct max96712_priv {
 	enum max96712_pattern pattern;
 };
 
+static inline bool max96712_pad_is_sink(u32 pad)
+{
+	return pad < MAX96712_FIRST_SOURCE_PAD || pad == MAX96712_VPG_PAD;
+}
+
+static inline bool max96712_pad_is_source(u32 pad)
+{
+	return pad >= MAX96712_FIRST_SOURCE_PAD && pad < MAX96712_VPG_PAD;
+}
+
 static int max96712_write(struct max96712_priv *priv, unsigned int reg, u64 val)
 {
 	int ret;
@@ -364,27 +379,119 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	}
 }
 
-static int max96712_s_stream(struct v4l2_subdev *sd, int enable)
+static int max96712_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_frame_desc *fd)
 {
-	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
+	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
+	struct device *dev = &priv->client->dev;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	struct media_pad *remote_pad;
+	int ret = 0;
+	int i;
 
-	if (enable) {
-		max96712_pattern_enable(priv, true);
-		max96712_mipi_enable(priv, true);
-	} else {
-		max96712_mipi_enable(priv, false);
-		max96712_pattern_enable(priv, false);
+	if (!max96712_pad_is_source(pad))
+		return -EINVAL;
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		struct v4l2_mbus_frame_desc source_fd = {0};
+
+		if (route->source_pad != pad)
+			continue;
+
+		if (route->sink_pad == MAX96712_VPG_PAD) {
+			fd->entry[fd->num_entries].stream = route->source_stream;
+			fd->entry[fd->num_entries].pixelcode = MEDIA_BUS_FMT_RGB888_1X24;
+			fd->entry[fd->num_entries].bus.csi2.vc = 0;
+			fd->entry[fd->num_entries].bus.csi2.dt = MIPI_CSI2_DT_RGB888;
+			fd->num_entries++;
+			continue;
+		}
+
+		remote_pad = media_pad_remote_pad_first(&priv->pads[route->sink_pad]);
+		if (!remote_pad) {
+			dev_dbg(dev, "no remote pad found for sink pad\n");
+			ret = -EPIPE;
+			goto unlock_state;
+		}
+
+		ret = v4l2_subdev_call(priv->rx_ports[route->sink_pad].sd, pad, get_frame_desc,
+				       remote_pad->index, &source_fd);
+		if (ret) {
+			dev_err(dev, "Failed to get source frame desc for pad %u\n",
+				route->sink_pad);
+
+			goto unlock_state;
+		}
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(dev, "Failed to find stream from source frame desc\n");
+
+			ret = -EPIPE;
+			goto unlock_state;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = source_entry->flags;
+		fd->entry[fd->num_entries].length = source_entry->length;
+		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc = source_entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt = source_entry->bus.csi2.dt;
+
+		fd->num_entries++;
 	}
 
+unlock_state:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int max96712_enable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 source_pad, u64 streams_mask)
+{
+	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
+
+	max96712_pattern_enable(priv, true);
+	max96712_mipi_enable(priv, true);
+
+	return 0;
+}
+
+static int max96712_disable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    u32 source_pad, u64 streams_mask)
+{
+	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
+
+	max96712_mipi_enable(priv, false);
+	max96712_pattern_enable(priv, false);
+
 	return 0;
 }
 
 static const struct v4l2_subdev_video_ops max96712_video_ops = {
-	.s_stream = max96712_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
-static int max96712_init_state(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state)
+static int _max96712_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_krouting *routing)
 {
 	static const struct v4l2_mbus_framefmt default_fmt = {
 		.width          = 1920,
@@ -396,15 +503,43 @@ static int max96712_init_state(struct v4l2_subdev *sd,
 		.quantization   = V4L2_QUANTIZATION_DEFAULT,
 		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
 	};
-	struct v4l2_mbus_framefmt *fmt;
-	int i;
+	int ret;
 
-	for (i = 0; i < MAX96712_MAX_PORTS; i++) {
-		fmt = v4l2_subdev_state_get_format(state, i);
-		*fmt = default_fmt;
-	}
+	ret = v4l2_subdev_routing_validate(sd, routing, V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
 
-	return 0;
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &default_fmt);
+}
+
+static int max96712_set_routing(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				enum v4l2_subdev_format_whence which,
+				struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return _max96712_set_routing(sd, state, routing);
+}
+
+static int max96712_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = MAX96712_VPG_PAD,
+			.sink_stream = 0,
+			.source_pad = MAX96712_FIRST_SOURCE_PAD,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _max96712_set_routing(sd, state, &routing);
 }
 
 static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
@@ -414,6 +549,10 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = v4l2_subdev_get_fmt,
+	.enable_streams = max96712_enable_streams,
+	.disable_streams = max96712_disable_streams,
+	.set_routing = max96712_set_routing,
+	.get_frame_desc = max96712_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
@@ -453,7 +592,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 
 	priv->sd.internal_ops = &max96712_internal_ops;
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 
 	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);
-- 
2.44.1


