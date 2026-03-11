Return-Path: <linux-media+bounces-55338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GBvLcwjsWkOrQIAu9opvQ
	(envelope-from <linux-media+bounces-55338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:11:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794D25EBBF
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EA8F32EF536
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E20B3B8BA6;
	Wed, 11 Mar 2026 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Irx/mquz"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C23B6C18;
	Wed, 11 Mar 2026 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216083; cv=fail; b=uv1ymFxk3Q5eA21hci41R2mkdqrPxhmft7gTIYA06QSekFHJKV11iQoS/uTrYeMm5ehmaQ2Ye+2JTICdltgPuP7a71+BB4nsEHpLHBKWjTcjfZi8DRWyuqhmBJqQ1bAAvxU/Eew7mXOcrQgjKxhTjkX9xAetzrjvJ1RwS9opHZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216083; c=relaxed/simple;
	bh=bLeLwmkV1nr99q4pFdMGLJQKcQ7/NMDKr5f8VMBGyJU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JDfM9L3qiAp66VPmW89qqxitqxdVsCapeMrdTEtV+7b1OmVLdVXEJvW2q6UqQjEDXWFgOdJaX0SZ7hEULFEUhzgV6C7q4ceKLEsl/lsz3Bwotz43TKqABIfx8AXjU3cFN3vx9lEDBSmY4ZhAUwxV7MJodQkgy8JP403kWRvfQnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Irx/mquz; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRy96mqGsWZN01fcY0brN3AIoscLY4TukVzn5f5Vg1S/e6Zpi14zjGPihqa4OccSeSNOJIKJsHTVjHzhi5OQudttmR9coOpX2uOAo4ksRlfbGJxRLKmZuDGTC1DwijqratAAcRUfTZ9e+zd0aDkcgfvtY+TIgd3PlpSsnURn3u2XkNVu/604hXdN+rfAZbV0xpDRJjS9zZM8qLx60KIT33yqS++N/7hPR2uyCjr9K8ASs9r5v3J7yiwh6IgBDiOL+1eo61zhiyIxWRzesFU7Sby7w1/p6SU1XSg76dtvaUzUEwFsU8PciZdplKlZY8MWKxoZblIswKBIvZ0Q+auRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwPMMHgSnrt4qvM+O3L0el8mJSdop390KozLeFwygmA=;
 b=qe8v7iOkwMhqPU+aHOa6SkSeEOWJ35tL/9mldMcNydeA/ZyMNqRsGjTGfE2ulGH3XvWsLgaT1APEgKPiPDPfuXm5c3FgqLGvuzRMaam2Hq+Xkh/oXpz+BKmzGkwXGBWqfbPd/icSlex0Y3sZwxXAF9a4Zofbd8KkKrFzXt0T98xqGZk/gwDFB+5CAVPgo5fP8IcVr6nWqT+evh90RsNlK+uqBKL4UP3zV2fd/EIO1NZxhM7t07logAOwkEKVJERlRPXDMrKYzfA5K9nx6tMhHa0uD2i1SaCMFbG3WYKekytFjxZv/y6j3sYLXjK/hQsf2ZQwdq2W9JcGnW0l6NrM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwPMMHgSnrt4qvM+O3L0el8mJSdop390KozLeFwygmA=;
 b=Irx/mquz9FF3ImlTZHlCoZhkRd0r1Pxi029m1ffhl6HryUJD23A/ubmnW4o3bOrPCt0ZNgU7/bazz85+dXubk1sb+OmFK04UAxAKmbz4HSzA76YM9j29cv3ZwdeG/vcyoP1UNdcsNn7hF17PI3VFw0/dILcupd9CS9J1+gcGwBok1ZVEn0meRmR+QUuGBLhOWvbuFg7/2ssfyJX07GgFdQ4mZ08qXDKjua42x1it7KeZf9bPvDWJMR3qp/wrNTVyA7Qti4uRoo+5opcsmfYn+4cqfC41+SXY1/Ovjdzlb2rWvZ0vq4R9BraOwykma4WceH+1L17qm8pziMLPYCDHsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB11967.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 08:01:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Wed, 11 Mar 2026
 08:01:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 11 Mar 2026 16:02:58 +0800
Subject: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
In-Reply-To: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773216202; l=1465;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=1+shcN66ahH3PpZFU+X7i5hmibgJ9IfnKLC2vuHD898=;
 b=3+JTrujsO0aFw2mFUsdCkYVqd9YVDP8Fnh88LAZKUP2AsoSgvdFDXSpXZq/+PETO/RojRzpln
 68Nv5EtaGDIAbiuR5AAIHC+AsGcOW4zVvyvXNBT39pWQvHtxg2AThC2
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: f4996abc-656d-4e56-7d39-08de7f445f7a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 VjpHie5N32ifGJZJC47iVyYIaY1Mv4JMiMJd4IMoHBi1ieS0Lc/SRqCsfgPSIQZYtD34xIePP6fhNl7tF3gfBdJ6f/zPfb822LP3Fjp5SKGSvpCnoDzOBL0UbRz9Uw3PXiShuq4RDDHvxMMWqxaa8jtUZIHQ5hsKJeFTw2TQxpHg7nuJiF7szc18UfZDVvpb3mwM50TFduZ3bHylx+CWVOW6M2F5h2Wq4OxgGpeCkUDQDdbX/497NJ/Xh2krbFpQPo1Q6vjB8dn9Xnigkn1oeHzBXYNYw5Tx0yPvputGhlXOWXgKM8LZuLm7NUl8eiea4RZE1MaTaJ9fZTNNQ3ny1nVfA3iiW+Nu/05rZuQZoaKlrGYEy0TaNSSRemptbJSZYxj2HmR9KjE44NT/ZlvvcbjLyMnXhTWv8jSnJdDyZuyu0gijrFoxuUYjBTpqa4xB9/saaah7CHuqkXo0fDsaSp/A1lyya+fLaLrlrXHc9QXSAGcRmcqQk256vE6j3YPXRLl4jJD0cF06ZFU43TJTi0q1/VwPhzSTincLbBpsHtMpZ8rDLWHQ/wmaTZXA1rfRM2MaLwoDeJvcl+cwyN7AXNcoLtcKr9QN/E+BCiTOZU8TRObhgJsUukO+/o3tsQsq6kKDOfk7mpUt/T/ElfOf+B/p3yKZOUyRc3PMPjMSk5R0afHby4xKfSajw7trA/PTWRzIluBB+N5aKz2tD2sGcfZdEJtc6QyFr1JSmpkHpdDENgKqp/vEqH/vPhY7dttF/cojexcQlhgplhBPc2vQdECEkfVpMlj2owEIv0N2aOY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UUxLcXRKQzZJelZDN1hHaHZ6Zk1mc3N6aTRCTWdGSks5aDRPMFIzcG5PbUlD?=
 =?utf-8?B?dEJiMWU2RENWRjJ4bklSSjZUa2w3RVhMT2RETjB5bUFpTHcxc0dWajRuOFlQ?=
 =?utf-8?B?RXhrUDg5ZFRBTFM5YzN0QTdwQnFqaWFWZml1S1BTa1FBMXBLd0d5bzN5RXJP?=
 =?utf-8?B?UU9zRGlCN2J6S1NnSEpVVnIwb0pjbWo5eDcyOUxkRnF6NEdYWW8vL29tZEFN?=
 =?utf-8?B?VVVOSG0vWWJHN3JCZXB4WTE0VklEK0JpWmg4WEQrUjFIbHJMR2JiRkx2RVN1?=
 =?utf-8?B?SzcxMUpETlhtcWhzYUxFbitkcDgxbjgva2dKeUVTOHVqemVwK1h0U1Fzd09z?=
 =?utf-8?B?YmdzWndPVFp1MGZVSVFvUG51a3ptS01zSi9rSjdsbDlZaC9pYkxzT1BCZmhq?=
 =?utf-8?B?ZFltdUo0U0xhbytDUEJVY25qQ2p4TDlPZjdtUkJzdXBnU0pQa3VhQkZSZ3ZR?=
 =?utf-8?B?RWFFUmxmZEV4Z0dtMWdaakR4Wk1nNU9EK3l2ekxTaGVNbnp5bTFCNHdMam1v?=
 =?utf-8?B?TklZN2lDMm9IUnNxT2pZdEZMUXVWMXpZQ0tMbWRUYVdOOW8vNy9WMEVlMEs3?=
 =?utf-8?B?UjRnZitOOEZDWkxQdERFZ21PaDJOVzMxRWJhbEhlejBuWHhtUnZ6cGcyWjhN?=
 =?utf-8?B?QzZhWU9aOUYwbUw2TXg3SVI4Vkp6QjVES3lXRlphWmJ2MDNoYVpkQVVSbmla?=
 =?utf-8?B?RzdTeUZDT1ZTSEZTL3FtNDlnOC96L2JtbkgwbTFqTnRiTmNleEVEYWRRK09R?=
 =?utf-8?B?dDFETEFMN0NGZEY0TmMwSmdORWpGR2F0cC9nZlNLSklaN0I0UVFGNGMvNzc3?=
 =?utf-8?B?RnVkRUhmOW5kRE81eGNEc1VlUFRmMXdGYTBvc2RTRGY3bDJ3MEhOUk9NNUor?=
 =?utf-8?B?em9hcmdzOVBMamRyV01KREI5TTB2NWxXb09UeThvZkVYQnJWckFFcWlhNzlk?=
 =?utf-8?B?a0FxbUNrNldZUmk1MlUxQmF3N0Vyam1saVd0THIxcFNEN2J3cjBvVkZ2L3BR?=
 =?utf-8?B?b0I2RS9VSndLVlJCYXdXUmd0aDhNTEJScFNBSWR1R0d5cXhVK0VWb1crMGt6?=
 =?utf-8?B?ZlV4cndtUmNDWjJqZEhTeHY2d1dCaEpYSVhjRktBK09lZWpzVXlhNHhLQmll?=
 =?utf-8?B?RTNYNTVrWXNFQjF2bXlXZzRrYWUxejFIL0dLNG9sOW5XTVN0V1BMK1h4eXpi?=
 =?utf-8?B?dElOSGZWZFhPY2thWWc2MjQyS2g3d1J6YklKRHZpcEN5WDdnSHV2VGcrN0Y5?=
 =?utf-8?B?NkEwNm5CenArKzBRcEdvd1hzM2JRdWNDYmozaUE2cjBGTzR4V0ZHdEdUaUhV?=
 =?utf-8?B?M1pLWDFYTnd0UUNOd2JzRGptbklGRDlWUEMvWFF5SkswSnNMTG9XaTBIQTBJ?=
 =?utf-8?B?SHYvalZZQjBFWm5KVGl0cFEzazErWlc0QTNBWDVsWlFMdm9rTm41Wnc4SCta?=
 =?utf-8?B?TjlpK3BzMHBxNzBqWkJIQ3A2T2MxWkRDRFJ5aWo3REZUSUFnN0lxTUFzTjk5?=
 =?utf-8?B?Q3Z2clpZd0F0d3JENVlpSDNPN2JHdWFuVjRDUGZwdkVUSDBwUy8wZ0FsSE9N?=
 =?utf-8?B?ZnFjUzJVTnJEMWpzeGduMHg2d2pRc3NSWCtlczRIRjZlanRLN2NjeTdmem8w?=
 =?utf-8?B?M0dzVC9ZZzV6Q2JOQkd2b3V5Rys2bjR4N1hjNDdNT0EyR2lXQ2plaDh2QXpa?=
 =?utf-8?B?V2Z4UnV6d3hVTmFMNEpaNndRZ1RTTmhldVF5NGF1aXpla0NnNy9Fa3M5cm1Y?=
 =?utf-8?B?cTRycEFzbVRZMGhkUkZaa3pUYllrYVh4a2JnUWhLMDBmT2lqY0VpQW05NGVP?=
 =?utf-8?B?T0w1U0d3MXJZSWZGa3ZKZTFYbGpPblQxc2Z6cFR4eUV0R1RmWEQ1QUZkOUdl?=
 =?utf-8?B?M0Yra1g3R1kzWU5ZQXQ3QlFqVXVjU0ZYMEpuWjEvOUxocmNObHRVSWlvT3lH?=
 =?utf-8?B?VHpWVlQ4ZTRFcEU1Ri9JcFZqWFBBUWNTbHhqeUtEcGVKOXlNeThscmdOMFJY?=
 =?utf-8?B?VUJzK1ZVckZKOHpoQ01lN3oxVFd6WUhuVTU4S21FQWkycEhQMjNiZGlBZzdq?=
 =?utf-8?B?aFdCREF0bGtHbjJXK1JNc3lGL3U1VWdyUHZDbUZjL1Q2WVV6OUtCMUN3MkpZ?=
 =?utf-8?B?Q1hXS2MyNDBUOTlQNlZqWkE2VVJWazlHQ2ozendWM3g5alVWMG5pVkhrWEZm?=
 =?utf-8?B?SlVqMmJwaWNRdU96eEl2M3U4R05YbE55RWZoWFpBdTZjZkZYMUxCTzhxbHda?=
 =?utf-8?B?ckN3VWNKY1ZwSXlFcmthRC9lTDd1aFdDbThQN0o1L1pjY1ZZZVl3Z1FaN1o1?=
 =?utf-8?B?ZkhxUE1YLythTFcrWGNCVE82eXBCTTZuSm0wNjlJTjBVdHIxZ1JxQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4996abc-656d-4e56-7d39-08de7f445f7a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:01:17.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jA007f3sMmAwXZomXSi3Eh8pHzqYBjiE8hR/Pkw3orj0JxjJYBYwjGWHg1vF+Y+YpQt3tRk0OiZ5Bzmfvj3cSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11967
X-Rspamd-Queue-Id: 1794D25EBBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55338-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Fix a hang issue when capturing a single frame with applications like cam
in libcamera. It would hang waiting for the driver to complete the buffer,
but streaming never starts because min_queued_buffers was set to 2.

The ISI module uses a ping-pong buffer mechanism that requires two buffers
to be programmed at all times. However, when fewer than 2 user buffers are
available, the driver use internal discard buffers to fill the remaining
slot(s). Reduce minimum queued buffers from 2 to 1 allows streaming to
start with a single buffer providing more flexibility for applications.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..2405baf21594cd18cf2b349234313c5e103b7802 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_queued_buffers = 2;
+	q->min_queued_buffers = 1;
 	q->lock = &video->lock;
 	q->dev = pipe->isi->dev;
 

-- 
2.34.1


