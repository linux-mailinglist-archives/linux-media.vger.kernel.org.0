Return-Path: <linux-media+bounces-51979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DRNJkR3gGmo8gIAu9opvQ
	(envelope-from <linux-media+bounces-51979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:07:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A14CA7D5
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 083EF307FC15
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898FB3570A4;
	Mon,  2 Feb 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fsTi0CFN"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51545356A12;
	Mon,  2 Feb 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026389; cv=fail; b=qI6IntU2+nr+Ux5bBbi2bTnIjuW9PruIJA3sMIS2UkQgMy//qeOlLW15l9CHTVtEGKBIRA92V8rwG5UZxiziXT3z0MLYWSp+7Xo44mc3mA8KZnImOaPjIoJnMipWGk+bS7g/Vf5YBDemMfSxitU9uVJ1x9RIwgTbTLoPa7bIfeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026389; c=relaxed/simple;
	bh=Goy9Sup1d1F+i115Dh2jbgwoMFyFl4+lkoSF08wf1g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jrgoU/CRT7rUAv2SW2Tcx22fpEC1cYvgugu2dgNmYUTghSWTuA+QiGMP10W02S6oPkkF17v8Mg7n/hStACuepwAuyfx/wLZeZgLz5NMKOS1T9Jv33pVOIFjThRh9xRWnoctLujeJYR/hKMbNeOTGlYdfmP7IVhAwWBokfjHiQrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fsTi0CFN; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVE9T95qS/gxxN9wXcXbbs6Z/WTb2+U8IV7psd4DZKsdnRbVyICXoX11gEFbmxCgATAjofqW2Xm73EeWbylamgy+NnT249eDGvaTVOZsWMNYGGsjTTLElGMb3AOi2UTFbkFiIL8t01q6BV7MkPXE+M+njFs5JJCKo7iGk1QJ1Vje97wkezZBjIBZ0qEV8KnEJh8ncjfP/NJlbUtNaz3Fsi6v819lxsfhnWeUFIFmvmNu0f9Qxu2hJMb+/I9co4F5+1X/ntgfEeRJF9zkmWuQywQzXvvTGypaBSMg0G8Jf/CmSR+Rcyyy2/z+Te8x3gdxMLB41lGPkEQkuiZACP//hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLf0FsMRjGe5K0pKOu5rUcsYypKS1yvGOLWeDxy63QU=;
 b=HM4M1Y3kqQLDax9WwKWazRc+OuCqIqZ5P59hZafjNMahN0hv+s/v5K1YweA+3x2nVGCa6qtUsI7lX8xu8+7L0vMBVgmvHbMMKj/0l0uz+IAKOnnrPDaAPKSNT6BMK9XnouIIsVzbrkbzYzCZtVrpOrv4eYWmxG2hdWXd2j3WI0bgg9kOE7r3o53X+cautgWMwWgZXAWfYbpYiHDNzJKihUTR8j/WQOOuxzudrH5LBMJJBOISnwnAeLLKe0hyZ6lScJUmh8chbJs+VpSN8Z3kkO42mRRQxe5j7tEOprEB4gI4IILEpdiU6CaDi0nnbYHkcpqtLuqalhHWDrdENO9MJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLf0FsMRjGe5K0pKOu5rUcsYypKS1yvGOLWeDxy63QU=;
 b=fsTi0CFN6jAoZ53s88eZTYSebSw+pQQkRuM4WHm6Xp/nGkav2fKnfbLFcn8eR69Clrbrcown3hsPslXnYSlkldrCjXCrgcbRA4zVtJQmi68yUM0WupUxNj1t4ooXHI2+QhdMlbJdn0qkMtNmSrovNI6JQTqPWXzBS9jFs0J7N0qrstwVofVJXHu4a+HDoXlZthgfwmj39vFScYwW36Ee5x0UFwksdm01zEbubcc4Hj/IR5eAfxAseWuNAocaiLodUI+TRv6IQwg9MgCO3SW3wQkDe0OfP0NG+84A40/3xnBUaybSsXuGd911vFKup0uQ1jqJGSTUjO6mAOCXU2TaqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:59:44 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:59:44 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] media: mxc-jpeg: Add encoder ops layer for hardware abstraction
Date: Mon,  2 Feb 2026 17:58:35 +0800
Message-ID: <20260202095843.1030-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260202095843.1030-1-ming.qian@oss.nxp.com>
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0188.apcprd06.prod.outlook.com (2603:1096:4:1::20)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: ee20ddb3-a594-4839-8454-08de6241ca0f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fx/BMJhviY1QLrISefMUlZeYYYGMnQRcJALoY23fDuUOy/aUNfxD0KYJ55zj?=
 =?us-ascii?Q?za6mcdfVnF4gDI7r8VICbYQAmJlUwfJ+tnzgg6EI7+nl/uhAOFE2rnMSsCih?=
 =?us-ascii?Q?nMXicPTwz+qILJLm5rabmrpk1Ocl9J7Xec29XPKqFjIdQp5Klq8kMw3iEcKv?=
 =?us-ascii?Q?XCP1ucNWKJ3Jut4fYWDNmox12540azrJRCZo7ExvCxJJO0v4WPY5PvW0AIF6?=
 =?us-ascii?Q?JOVsxhOmPC/GODzlyy3DMrpfpWhedYw6J7loiIiO3YrA01bBYNRnc/HoE+xV?=
 =?us-ascii?Q?iLv+oZFfDw5Y/MG8TzuMBlaD186bWBqQrfLDbEP6uLUZGAiY7ULj9W5C/kI8?=
 =?us-ascii?Q?8aqSZTmrPrZoqt/gvpCmZnr7ON/FwlcUdMGFqWL6kZPDN80fUL1g4C57oRfm?=
 =?us-ascii?Q?II+RMp8IoMcdiPB9IJBeg5HOGYu6KEXqJgju7221OfK4/eNp3WnZAIMn+9DF?=
 =?us-ascii?Q?fhKSGka3mp9mnx6dzt0eJ35qJEz3wOgHFx4mnvn1LTDPhf8K+YhI6Eoueq+r?=
 =?us-ascii?Q?00/3GGqHBR98+cIHuaVFYQt3Au+ItOIzj8UIcZZZY1NYPT3J4AXnd+33cHbC?=
 =?us-ascii?Q?0X+0UUq9qU8fTATBIKzOEFlEagvLxi2LXWDjevbOoBiLJzgRwXhwd+wM6NSV?=
 =?us-ascii?Q?jZ01n6Wd3iJKhYQV92EJ79UlGWSQNnt90mrU7zm5UZUyx12ZkyYEdb13Jdsb?=
 =?us-ascii?Q?ZDLVHEz1n1hgbEhb1gkei74EDoGDQxoWmzIv94mkarXNZtEPRVgeSuhTBzGi?=
 =?us-ascii?Q?R1DRAO94Ve24CRUbjTyjfNlVGFNJU4sFVlhg4RE7NdL55Av3HwzRs81cC3Hn?=
 =?us-ascii?Q?FZKyqZ31zcH/tXDdKMXXfpn8uniXJEGWQyNO2kJXgRHs3eZPetA415R4gD69?=
 =?us-ascii?Q?q/tLS382G7EUu4d+RabHuP1k+I0yzGoe038XkX4B0A6sKNoR/m21fIl9TEJY?=
 =?us-ascii?Q?hyHn/ars3gElQG2D93kyR1YfnnhCvKq/yVKheGDv5FP/bEju1VWPrZs/ctoB?=
 =?us-ascii?Q?8TdR2+QT+T1IEo5sEv/fgCH8bC6CpCXBszbTx7JWl1wG2Y+qkWMnSvnvFcgn?=
 =?us-ascii?Q?8rdj8eHPo41tsm/+ytpMUJNQfOuyk1XvspGyuRwmp96iChUdgseVSuIdXyVC?=
 =?us-ascii?Q?zwT3smWARqPz2lsIncJvZ2KyK088NRXmeOoZCtxJM32l+rerec4TH/oHY0jG?=
 =?us-ascii?Q?RDM7kL/M+RJAyN4m7vtzvpL0f/ULpOdO5qOMtmI+dmGY1Ogufk7p/MbuTw4u?=
 =?us-ascii?Q?4wdBn4jbB/24rPEFLAkIAN1/Gtd3Q2+hjl3KtfpgCdCdhJfCBVsoK9EzOUA4?=
 =?us-ascii?Q?rUcyf93Zzc/KRVw4DaODFVwVyDqcQYP3wtcmPqxYzU777ivlbqnMX0a/xjkW?=
 =?us-ascii?Q?9VHJvlRZ3KvsYZpffRFBxKKaQq0csWy5Sxx+BtePCqpRNP4nFEKHR45szEJe?=
 =?us-ascii?Q?ZTLIk5aEKYtkvDEbPuwutolCxha2ql0Okl9gwjmc/bod2FptzcXOwdp5XlD6?=
 =?us-ascii?Q?LiRCq9ZxQzB/05xjbEasnyzkkTaKXQsDd+JDUzuWPKvi0OKwVdUx3oibFm4m?=
 =?us-ascii?Q?nkKvzjitQiWRTV7z8QMTY7xyP6Oz8iV/dnQR7lwOuuzh5NTaUoOmDh6rD8wQ?=
 =?us-ascii?Q?stpKo96vwA9gKwOm7JTBgPc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wecc/yzJ+8Dv4j2gbm/COpT90bfS1XWghK4Oy4TQFAT3PqKhpbhxTMn7Gmkf?=
 =?us-ascii?Q?gd0IeYo5sLiv8WTBJ0m5kD+j07aYPzddpF93bMAxikyBRAOSuDji9Iu/lwse?=
 =?us-ascii?Q?zTG98SQ2SWs2g84YC1zsYYXwBS0YU6sncpdJAmi9QpLGTRmv04N78QcKnjnl?=
 =?us-ascii?Q?W2rJHXhdHywr2a0CS60teTlOZ5buve/2uhtiyo0kxbZHhTFISuW1OiZ6DG9Y?=
 =?us-ascii?Q?AeYRA9gFL+Lm1XQGlpOz6BdSB7rSHqjebsiN7oFgszLhEDEPt0D4OlTwrf5q?=
 =?us-ascii?Q?1EhKX2uwV/TjSwS3vhuKBpy26IjgFAVOFu+3cbs+f6Pkio0UcDGfZfb2LluG?=
 =?us-ascii?Q?jGdVUf6eBeTUC2GRB8T+jeTnLIDs+YlvX00wBwctC5KX5Me9s5RjGCLKzRPy?=
 =?us-ascii?Q?VNiDmJxcCZI/pFNkDMhDULhZ93zFw8ufxKbjZ5bIsAHy3H0k+j29G4OIV/cI?=
 =?us-ascii?Q?Zrv7pJnI8E8OX0lMuGG87Irs/naF7NWCHLw02zjC3B+jr9SgaKeOERrAW7OC?=
 =?us-ascii?Q?Vubd6CC4AGENUYPf9hll1pVCXtAIkqhM/aDuh/sqxQ3Y5vFudejgInDYaR4Q?=
 =?us-ascii?Q?jGOlbykyXZQ9t/glmQo5hVtoul4Dj/kDRLn5SRejUiWtl6lQfI9jixRGEfcC?=
 =?us-ascii?Q?/hfDiyfAOOHaiQjF03DcVLsnQDC5n8Hmes9qIDZQ+/aNFFbVp+0ZcOoY5Qn7?=
 =?us-ascii?Q?jWxKqsFKK4MLLauKf1rYcN4xRnilIYz/YyzYdyAkXagnYMMaIS1/yAENCP75?=
 =?us-ascii?Q?vZX3Aeik14EtK/xnqiK0KqRkL/4+pHTEj4ycOZL0vyMi2oVHYOag0uY0yv4c?=
 =?us-ascii?Q?3W4Cv0+OxAw8gvRc+eeXhWHsKAYqRRyNnkQMzuP8ghWN5Mzl/AMTZCgpB12J?=
 =?us-ascii?Q?4vEarSE5Zl/2CRIU69mN7rEFJQjoxx6oZxkKOSzyzO8QF7aVfOx2SzSjZCgJ?=
 =?us-ascii?Q?zYD6mYq6zmhmP/gSsO+qDWEke5QJKykWOe45W2v08IK5V67tDjdry+8Dbcd3?=
 =?us-ascii?Q?9D8XC8Kixcv8jhoVALFSjf477IsCmmUeHbdPYwgZrQTL+WvZDhvuJ/F5AX86?=
 =?us-ascii?Q?Wo4I/lut8YzD8i2PmnfNKMWgJ4KJn1R2DnM9AQHUbeI6Hka3gJoWjR/uWnCJ?=
 =?us-ascii?Q?JJXcrejov4Xe2KguE8S16gK3nM5mO1zbQ9wfQSlItBT+P9QxtV+uqTgxPIah?=
 =?us-ascii?Q?QWFuOIdUPkb+MhZqkWWALzFFgxr99jGjSIaVZcVIpLgu57dQ2PitheGBOVSU?=
 =?us-ascii?Q?PmBymw2NdYgrOaDQBuXU50hGqjf/nUOaWlRC3yHMWfSxHvW5qDNdYkGmws1y?=
 =?us-ascii?Q?PkOZ7JRtANRLmwhi4Y3qXJMUxty7ZHUV/aK5CG0ms7CDPGrI4QgtGwHAAZ1L?=
 =?us-ascii?Q?5Z+MrDlibNsfAYwYhDBfXAhqGVvk7yXj2RsdJqP0cxkqs1XxViVXdWCm+/Jy?=
 =?us-ascii?Q?Of2T6irKiv4RNPvFCh3XJ83Qt4Ziirp8M/mnBzsaZvbm/3ZiIHWeNc7GfIZn?=
 =?us-ascii?Q?k0tH6vh/AW3J6PBpDYQ6wvR1w5Gk+NxGzXkfrWk08GedqyHEo4e+kodlo/tH?=
 =?us-ascii?Q?iIW0k7xob/6Q+ZrmksRFiZxKWpkL2Zw/j6zXMHzRWtgLu7BE7xsQ0nqrDybU?=
 =?us-ascii?Q?FSFnVsNKtPjpO4p+MUrEYpRYlOfCfiC0JoArTzUn/I/3KIFgRM37tzNpBRrB?=
 =?us-ascii?Q?W+T/IoVcMsKRoDSacylkljL+r7ELDsT6gOzKoUgbnN34bZaiFIfveX7GKUKT?=
 =?us-ascii?Q?HBjvBInX4g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee20ddb3-a594-4839-8454-08de6241ca0f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:59:43.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVAsWOzh0qw57d5Pg5qAE4PEIX0AqqPBBwEBy1fQb6wsQbbsCkJ9RizJj/BQFV1IKu6dtVGpdtACl7wMcQqnsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51979-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 82A14CA7D5
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Introduce mxc_jpeg_enc_ops function pointer structure to abstract
encoder configuration differences between hardware versions.

Extract the existing two-phase manual configuration into dedicated
functions (enter_config_mode/exit_config_mode) for v0 hardware.
Add setup_desc callback placeholder for future v1 hardware support
which will use descriptor-based configuration.

Store the extended sequential mode flag in the context to avoid
recalculating it during configuration phases.

No functional change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 56 ++++++++++++++++---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 ++++
 2 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 39022c1bf36d..ede422364f9b 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -64,6 +64,12 @@
 #include "mxc-jpeg-hw.h"
 #include "mxc-jpeg.h"
 
+#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
+	do {								\
+		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
+			(jpeg)->enc_cfg_ops->op(args);			\
+	} while (0)
+
 static const struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "JPEG",
@@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE &&
 	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
-		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		ctx->enc_state = MXC_JPEG_ENCODING;
-		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
-		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
-		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
+		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
 		goto job_unlock;
 	}
 	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
@@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 
 	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
 
+	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
 	/* setup the decoding descriptor */
 	desc->next_descpt_ptr = 0; /* end of chain */
 	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
@@ -1335,8 +1338,12 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	struct mxc_jpeg_q_data *q_data;
 	enum mxc_jpeg_image_format img_fmt;
 	int w, h;
+	bool extseq;
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
+	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
+
+	ctx->extseq = extseq;
 
 	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
 	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
@@ -1369,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
 			 STM_CTRL_IMAGE_FORMAT(img_fmt);
 	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
-	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
+	if (extseq)
 		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
 	else
 		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
 	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
+
+	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
+
 	dev_dbg(jpeg->dev, "cfg_desc:\n");
 	print_descriptor_info(jpeg->dev, cfg_desc);
 	dev_dbg(jpeg->dev, "enc desc:\n");
@@ -1385,6 +1395,33 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
 }
 
+static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENC_CONF;
+	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
+}
+
+static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
+	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
+	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
+}
+
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
+	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
+	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
+};
+
 static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
 {
 	int i;
@@ -1590,12 +1627,10 @@ static void mxc_jpeg_device_run(void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE) {
 		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
-		ctx->enc_state = MXC_JPEG_ENC_CONF;
 		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
 					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
 		/* start config phase */
-		mxc_jpeg_enc_mode_conf(dev, reg,
-				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
+		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
 	} else {
 		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
 		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
@@ -2973,6 +3008,9 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, jpeg);
 	pm_runtime_enable(dev);
 
+	if (mode == MXC_JPEG_ENCODE)
+		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+
 	return 0;
 
 err_vdev_register:
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 9c5b4f053ded..cdfefb68346a 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -105,6 +105,7 @@ struct mxc_jpeg_ctx {
 	unsigned int			source_change;
 	bool				need_initial_source_change_evt;
 	bool				header_parsed;
+	bool				extseq;
 	struct v4l2_ctrl_handler	ctrl_handler;
 	u8				jpeg_quality;
 	struct delayed_work		task_timer;
@@ -125,6 +126,15 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t cfg_dec_daddr;
 };
 
+struct mxc_jpeg_enc_ops {
+	/* Manual configuration (v0 hardware) - two-phase process */
+	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
+	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
+
+	/* Descriptor-based configuration (v1 hardware) - single-phase */
+	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
+};
+
 struct mxc_jpeg_dev {
 	spinlock_t			hw_lock; /* hardware access lock */
 	unsigned int			mode;
@@ -142,6 +152,7 @@ struct mxc_jpeg_dev {
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
 	struct gen_pool			*sram_pool;
+	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
 };
 
 /**
-- 
2.52.0


