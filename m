Return-Path: <linux-media+bounces-51980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKu4DA52gGkV8gIAu9opvQ
	(envelope-from <linux-media+bounces-51980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:01:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F30CA62B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0632F300CA21
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763643587C3;
	Mon,  2 Feb 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NhocvgSf"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780913570CC;
	Mon,  2 Feb 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026398; cv=fail; b=A4QhE5f9gc9W9OCUXwkm2zMyskw1CTPbyYf8au2gvQgej4cRw0kUWpvULybpXr1jUeaSa0V872GKFCQ9dzN3nTTcadIve6APh5P6nO6+w8PRO975qczFF4kDU7waAhExZLm20HyBY6oqsvFXdZ3DCOI8TACKd9d3ujetYwk/Kq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026398; c=relaxed/simple;
	bh=QNtmxr82//s74WSHLz85+izt8S4w7Ngbbq9SQZ04gU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TKIn2g/e47mJGZCiFPhqpCdBU0jMDZlRwDEz3ohA/pG4wUgHByUbspzF3TFYCQpf6FmKgJPYpR6j3ipmhJ4NmEx2OEo7o54iWk3Jw40hPPtkjV7hRMLwM0k39o1F/sbH77WXmqSIgN0jFk/aJ9ptGG0Q7ueB4rD6gzz5tjaXYIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NhocvgSf; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQ+U3hGL9Y9y23AA6Adj4ieL2J0qNvnAJFIy6Y7MhuXk9QpHmSXYhvylKkUZKSM9nIps0N7lJPOXKWRdAbF4p/MaR72C0US2n1dKf67swcjIag5qgkS+rGMSm+B2GRAocKufSPNxR/sAa1WgeAxW+I6JndSas5NWjFvFeJrEnOfFbKDFU9mn1Znx30gOiBLCefmO23lgIdMS+SGpqE2HZWDKhPD4QhApoz73L6knUdkyasKx1w4IfD3kNqAdYxgd4TDyBYAgFi0G1SV8wIZr9/Ci8Vq6Ye8vuePxLqD2aK+BFGY7dBJpAv88en/2LcnFb4yOHhMLTLFtn0b0PrgBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahHhO6Dbye2yWV3LKflr1tW8HSOHh+LavQO69gU4IEI=;
 b=ZmzLURMgBKN4PFJ/DBgEdtf71qFXBTidirtLR4NXw6ThNvtQg0C6pynD17nh9mPAOlrogn7I0kdMchDI94zauHQ7JYuLZV+GnWifVziGLj4vYx2C8s5znpwq4r58GCT3tQai0dN9Rkc/7CHyy8tqIT1GUSLlyqSfFkY48XhvzTl9csKEA0kKIvXEsAxAiZq7Hz6PXvzGslwlEfnavzZ9gb0fAsD0kke1v/PlnFvbHW6NSw1ejwRvjinZoZlLQcJtnRI75B3oFdF1PGmG5cw+d/AQjPRdT1hSpMf+qvoWSIm+Gxd/ah4Ka4JYG0gXQvlY0t3/cwyt773W5WPiNFoiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahHhO6Dbye2yWV3LKflr1tW8HSOHh+LavQO69gU4IEI=;
 b=NhocvgSfw6mdyiylgXi7zJgTXp7mGYSIZwzkTNaEUnwA/jtOhE+vmcmIV6rnE1AbTeHJdeZbGEfERLb3oniwjJvdUyJjbkDvilBj+VrVncO80/y+NIdtURKYde2W60KQgT81M/1QTkc3prv5jEkQjI3C8XpQ2N7ZS+ClCV3F0AQ3QGwyvKze69LISTe5SJ3WKbW3RnqOsLMYTyCo2qbM7DSRb027GkEufvPDYYLRVvgcVaB0s/C9eqppkN4om1qbn8uSJ5ItnY5H1H3X9nASVOos/nJ7JcR4yVrBdDdsfVeSnX2eyhNnTgsJ/Di+I8HCNg4pE6tDCfc4Mdk4Q6+LEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:59:50 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:59:50 +0000
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
Subject: [PATCH v3 3/3] media: mxc-jpeg: Add support for encoder v1 descriptor configuration
Date: Mon,  2 Feb 2026 17:58:36 +0800
Message-ID: <20260202095843.1030-4-ming.qian@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 789299a2-0337-47ce-da5b-08de6241cdb0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6FdbFswLhUsJ71mdfOvSOHhT1V4XXekkI9zCeQKZK+B4atWEYyGfIUL9r/+H?=
 =?us-ascii?Q?APKqTxwgA84rLZWlr1OlKgOE/WA7YIhEuUUL72AYfnkBNw/jTzSLcpmqJevP?=
 =?us-ascii?Q?lwuhgYlzpLQwepTURV2UNA19ZmKbJoLXye0m4HGAlgNlcaUv18Idp6vN1Cko?=
 =?us-ascii?Q?/VHx9eMocPmJgE9lmG/JbmTJAY0Z8rMQ42RwjXab1I9dqVCLCuY1dCrb/vgr?=
 =?us-ascii?Q?bjM1xlJwgiNOhtlYRJi2/QhupmdXa6IyZ1CUw6vpMNA6FtTkHysmSNemv3oi?=
 =?us-ascii?Q?QuFR857YXDR/J2RSqrZOgoUZxuvNKavUqRDtHHe2/eVslD7SzNlYkcI4Gpkj?=
 =?us-ascii?Q?XUoshSIpubc4WjRMuWc8eJPjt77hy1vw5EvxfoS819y4axO3d9w672xkDwBG?=
 =?us-ascii?Q?HbFtp+x0zrSbwgGLG7dEKy+Gyt3fbqo7AzbxKJHyLUy+iykEASoKz/kPYnlG?=
 =?us-ascii?Q?sTgtnvLr8TdwPuzl+MobRX6Xy4/XUeZW8nvzDdoAwBRDa2c6aVl2S1LK+BJp?=
 =?us-ascii?Q?n/lv3QXNpfzfXKNyZw4wGbcKSE7907AYfcuEsxDgCANd+TYDCmrTFD81mD5Z?=
 =?us-ascii?Q?ENc+2rI80ySLCcu4M4gVAOtCjLmwiMZIGFhsJZdCk5u9t5nTF1ZGusa+/Bq3?=
 =?us-ascii?Q?30/cxocyENPmXOhSV1D5Ga6QJu7ongBM2q4lz6ezmwY3stzeLu0F6a3AjcFo?=
 =?us-ascii?Q?72cFZYVljGCpEEPekQfZ1bfdfV1Dgy739vXGpTX8O1bfF9J9MGRgzWBhLGS1?=
 =?us-ascii?Q?4FcAkP0oKVzq1gzxF9PZs7pcEYJRll9mtJg4i2mR08tEOl7c+sDa4VVJITL9?=
 =?us-ascii?Q?/6S1AHp2GESxjl+06HOAQPNNgB3sUR94Zw0Cyxd+1iveDgKd4/JwW4lRpzdy?=
 =?us-ascii?Q?d0q0PVD8q1Op2kU32NE/dXKAKAvp0/5DQ2UrC4ly8pS3PhLaG2TsZGAeiVNq?=
 =?us-ascii?Q?aAmfyyIfZicComMf0sekygweh/GNgi1p36KKMmaHMblf2ugdOyILIsLdeYz8?=
 =?us-ascii?Q?wOGzyZXucKbweQ7rj8/z54yDu6i8LESXLYhpWNmm9fsL2U2/x5YKi2ftjVJZ?=
 =?us-ascii?Q?Es/JZsZXDh4cDWywYj+Bg1xFlMK+s0dFZedlNdKXCe1gDGQcOsgkgkXOgK5Q?=
 =?us-ascii?Q?28FyhKMLO7YrFjvCFaCbn0nYvHJJlb5+Uy3wEztIitzokryObpFvSQwPmBT7?=
 =?us-ascii?Q?4nHm9LDRf+q6+Um7BXA41Px97GR7lifoKxLtCXAOGgdxxTz5h+/1bHn+i8w8?=
 =?us-ascii?Q?5zjrxQ8YrJ9u51eP9IOOtPOtzERQTzfFoK4+bnJx0J+MYLkvgN3sEnpBtPcQ?=
 =?us-ascii?Q?V1plhpW43EhOxRbh8I8AYIKguwG72EWStkPLrLvrjjjxfTd3IdOf0KdbnMrs?=
 =?us-ascii?Q?ygbk2pXj5AHVOZw1XgYKkUQhrSYdU0oQfZQx6deANG6+6CWXQYoaAsfuIbym?=
 =?us-ascii?Q?dbBnfCNBOvLTXkU3bD1b9xnC+uZFUknR//PpWoY2RzKe0Z1Cz8yOtLeUxwA3?=
 =?us-ascii?Q?PEgTMafpsHwdOGIuzoGzmlz5bsOxCV9N+pPTND1epjzMC+E+gC6VyjgWd0ck?=
 =?us-ascii?Q?IBH4uEmFPBe39w5wvK8bPvWrR6xaNz/sAJ1cMRfhDEk1csIncr6VjyR4PQz1?=
 =?us-ascii?Q?bvYp1Ykjk/5wPd/TjHh3qCk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y0EaVkdgoQFU7QTadqGsLKG1M7vqRmabLX2tA/9RaerCun99JWvVRAkiP64u?=
 =?us-ascii?Q?UwLFuHXajLufpBLFn1usgkzbi4+oUdG7b/hFfjZN4onmKPIO82AvaWKXCFVP?=
 =?us-ascii?Q?s/vn8daCSwtk8AmLpGZPLw90FJ2KAS8o6jagN12KKHcESCnYBOB+RXzA+Hgk?=
 =?us-ascii?Q?ISRCs7koyoXYDFnJnKppasLz72xf9iRyfsjN8dpyOFqGsVfh7b6IPI3YJmug?=
 =?us-ascii?Q?bn+vYbPSHJHLBXR6TAkP0g/MTa75cJaxsCSVznWhB+gZ8zt5aB7NAbqSbdUa?=
 =?us-ascii?Q?xptu9zM/q45W+yfKmOYdIHeOIELKVRbHKOuVfZCp3SEhSb23cDcnSgVTHicS?=
 =?us-ascii?Q?eHUHYcB15Nt+HKts1Ci/BpG8s1SNy2UE4icFQJ2LhoURUV3k3zf0PGg5L9Hi?=
 =?us-ascii?Q?MmlaqL6tCEJkvMNEgoVMwZTE5bcTJ0MPtTbsshCTAu3rg7IwxJx9TmUQMmVp?=
 =?us-ascii?Q?2oiMXYsfvgwaAFu3+xrnt/8GNQbG5hCwYWDbF5HgH8qqWqQXSU7zGWyUoE5Y?=
 =?us-ascii?Q?4bGNS17jDJgPz4nruKfRb5RrNBQCunRDaNJK2xKyS0vIh9chuk1BH3JaCVAc?=
 =?us-ascii?Q?w1ICKyouTgK2QV7hi1WY1xFhLeypB7Xxs/JIg4/pHLGiuzX7luPfJHNvtUbk?=
 =?us-ascii?Q?vytKi/dW1kGct5ym12g9M2iCNWnDL3BjGD8p+qGL+fDKsH/GJLCj1lSjyQW1?=
 =?us-ascii?Q?5K1dhDSoamle0/ggMFFujWdMi36nOvNHdrxE1S7lFW3UIxcEpfxvK05BmXHG?=
 =?us-ascii?Q?gj9BTx/ZpP+ltBU2ph6DkwzX1oevhPE0doWAlFIM5QMAp/MkJkw6O4I2T04K?=
 =?us-ascii?Q?48xfaBOy7nrBYyjtfU9W508hwfrfChmsgeFIZDNHQWznhw3w8YtvcY1ZZTcS?=
 =?us-ascii?Q?0HGA9vxRPtnZ8taWOF9chAt+gjNUhHRvERUY5SSryAxc2VJjT428sqrrTR/g?=
 =?us-ascii?Q?zZ4xtvFmHzGRYBQ6s9h8ZjsLH5qL4YJjKZh08wU59JOY13/ua+oeO8N+9n5g?=
 =?us-ascii?Q?cyz2ZRwby1BJ2Sxpue4k6fpEpnUo+K3ljE0yFe/DRusMVqvRPVPMaD46ZmDl?=
 =?us-ascii?Q?GL7sXQjB0CVpRFuLgd9aLlnW1ADu23F37CCmsRcDf3mrgoKJe9L1hlCkIIbp?=
 =?us-ascii?Q?gvY1M4W3fgmGx4gpaf+WAwj4332Chi2oWAmwsCvlABWLx+whaJZjqBFFuAU9?=
 =?us-ascii?Q?0e5PdSv1/wLmq/g0+QzEQwY4WvhpcuLo+tYBu3tbu31K2LHUPpPPQ2uvzdr7?=
 =?us-ascii?Q?6O8T6IeFvsins39e6On9Xon0VsWKIFlHI/77XEdw8Rp9zDgW5+AVc3gY0cd0?=
 =?us-ascii?Q?BpYTIdWnY+sX8lIVG1YbCDXlm7LWshmWo0L5VRyUGh6h/vjjrsGfFP8w4H6C?=
 =?us-ascii?Q?gBWSZFMPkHLfHzmgByqVR04FHkhxWooWnMAwNtMmGZWl5UseyKVbyteCDV1j?=
 =?us-ascii?Q?WnIdZEbdWaOLKKNg329DI8Yt8D3WbAlckq96qgxT+PoZ1CFAiEWcSXUNfsRr?=
 =?us-ascii?Q?86+Hak+POI1X0188VvVmT3uqsbMmyQrZ47kTonw1E/hGgoS1ZlGrjRAPtd6l?=
 =?us-ascii?Q?6EoPGKE8dqmvMo8QpkYEr5ao9EIwewj7zbP/sZfavD2Agnta44DnDmTy9vga?=
 =?us-ascii?Q?NoPMYfS7fBwNSkmR+7r/qzAy6h4A1wcrBfy203EDStT3TU/ylAXIB3JnBaeC?=
 =?us-ascii?Q?riTcHr9HYfZQrJOBo9J3G6gJa+ndTeRaiWM++XDKlveDnUwg3jpkhuhGfBtd?=
 =?us-ascii?Q?U6plqnX9Kg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789299a2-0337-47ce-da5b-08de6241cdb0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:59:50.0991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaocOj9yWLt5NU0co4fVl2cyE31dsctd/xdKZLmG7NrXLllL719WZT0t2qM+5kKc7b+E/nlcYn+NjGFw7ZpEyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51980-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org]
X-Rspamd-Queue-Id: C6F30CA62B
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Support the upgraded JPEG encoder v1 found on i.MX952 SoC.

Detect the encoder hardware version via the version register.

The v1 encoder uses an expanded descriptor format that allows all
encoding parameters, including JPEG quality, to be configured directly
in the descriptor.

This removes the manual register-based configuration step required by v0
and reduces the interrupt count from two to one per frame.

V0 encoding flow:
  1. Write quality to registers -> trigger config interrupt
  2. Start encoding -> trigger completion interrupt

V1 encoding flow:
  1. Configure descriptor with all parameters including quality
  2. Start encoding -> trigger completion interrupt

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 45 ++++++++++++++++++-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 +++++
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index adb93e977be9..0d78443cb270 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -73,6 +73,7 @@
 #define GLB_CTRL_DEC_GO					(0x1 << 2)
 #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
 #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
+#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(GENMASK_U32(19, 16), r)
 
 /* COM_STAUS fields */
 #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index ede422364f9b..71f4a1d292ac 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1417,11 +1417,32 @@ static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
 	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
 }
 
+static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
+	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
+	cfg_desc->cfg_mode = 0x3ff;
+
+	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
+	desc->cfg_mode = 0x3ff;
+	desc->quality = ctx->jpeg_quality;
+	desc->lumth = 0xffff;
+	desc->chrth = 0xffff;
+}
+
 static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
 	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
 	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
 };
 
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
+	.setup_desc = mxc_jpeg_enc_configure_desc
+};
+
 static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
 {
 	int i;
@@ -2874,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	return ret;
 }
 
+static int mxc_jpeg_get_version(void __iomem *reg)
+{
+	u32 regval;
+
+	regval = readl(reg + GLB_CTRL);
+	return GLB_CTRL_CUR_VERSION(regval);
+}
+
 static int mxc_jpeg_probe(struct platform_device *pdev)
 {
 	struct mxc_jpeg_dev *jpeg;
@@ -3008,11 +3037,23 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, jpeg);
 	pm_runtime_enable(dev);
 
-	if (mode == MXC_JPEG_ENCODE)
-		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+	if (mode == MXC_JPEG_ENCODE) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
+			goto err_check_version;
+
+		if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
+			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+		else
+			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
+
+		pm_runtime_put_sync(dev);
+	}
 
 	return 0;
 
+err_check_version:
+	pm_runtime_disable(&pdev->dev);
 err_vdev_register:
 	video_device_release(jpeg->dec_vdev);
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index cdfefb68346a..c00c13549746 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
 	u32 stm_bufsize;
 	u32 imgsize;
 	u32 stm_ctrl;
+	/* below parameters are valid for v1 */
+	u32 mode;
+	u32 cfg_mode;
+	u32 quality;
+	u32 rc_regs_sel;
+	u32 lumth;
+	u32 chrth;
+	u32 nomfrsize_lo;
+	u32 nomfrsize_hi;
+	u32 ofbsize_lo;
+	u32 ofbsize_hi;
 } __packed;
 
 struct mxc_jpeg_q_data {
-- 
2.52.0


