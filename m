Return-Path: <linux-media+bounces-28909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7075A74401
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B9D57A64FC
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 06:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEE421147A;
	Fri, 28 Mar 2025 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u62PEx/o"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EB0183CCA;
	Fri, 28 Mar 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743143519; cv=fail; b=Or7NzByS+W+onOTmeb73QjxU2sbCDFfZe6LCujvxm+zEAjsugq82ICmyVc8CU1+adiMXIGN8eVGzRvlzVmFLLDngJ3oOa9OVlwTYWFgLmSXnUAwt1NF1PyqjcaB93n1G2gJ1+bbkVlrzNGyS4zfH1hPwybqDdtkPXWhPpJ7TMKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743143519; c=relaxed/simple;
	bh=Q8ChxIKyIOdKov3LRcyySPI0AI3NpyUsKtz9QaHVw7g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CVwsiNY+kkhxjeqyQtmgxPG7bN89i0964W1/r1oZV/G8F6+i/2UXN/GcxC0mFEwilcap2WUsbT473XWTY5Vbm7bGhp7i5oqIcY4sraPPIFm9rbQRoIH6FS7JCKzQYKupclSQIWY9nVm5JXYKAYX2i1ujb0puHTGLhiAPL4KQTw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u62PEx/o; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGyFn6QyhPwukn33medGpyVWFvt5kgvUg51qI/nIR4701J8NRmBTzsP1zp61eU7q4hBEAUUBzHBYDL7JegjQMvyzG5Wi7imKnv+wBoqqIjH8AJQ63OE9OELepJJSIXwKrbZMxfOAYJASnsbHcB9v5auYPUF4fyOKvN/LRp1ln91WSqFz/H+4qmbldKGVQ02k6cLAA0ogX56bJPssN+qNhbLJLJ1Jmkb3oQLO8Ue6CmpKOaVz6luhchcNyna5JaZiBn8qN3/7g5UPP7XUdrMiQa3QRjifKGm/R/s4QMKQhDQX6xqNMIL1wK9+rrYnbr+SMm/5cOJB0YTyyvuVf6n92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+csSuqSKO9PSrm0drX0fc2/hvcaTADa0DHjvy5ko7E=;
 b=Eq8z+/XO6ljsQlYOx6YJj3mxW8t9HHoE4P1SgKMOgABYwDThbYR2vvoUQGA9q9OyDlBuNnBFsDFzYaew8yoX9GPuXam6H8TEA0Ep8XzmHdRwJnlRb1T+hdSpjCTF6v+lWBa9/kMuU7UYysXUuLy6Sl0iMb7hZnY89ml478R0TiSwMKxMFqFKfD43HTwgQ+fTjEd/ms0eFHDvM9nRjp+NJaw0bUszVcR95DrPjGyArE99xU9Y2VOq7moF0vCA0B1FPBLoKoxHlKx04UBKMEjxPP77ETqa6vDm1WRxg5/SRi4jxNS6hR4Owz4OIMQ6zhVivvsOZPWjBftDQK6R2bKAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+csSuqSKO9PSrm0drX0fc2/hvcaTADa0DHjvy5ko7E=;
 b=u62PEx/oXoR0xEv7swlrjzXYTwwmDlvZp3J/Oo/D6kgMpivJ712r51id/wAZUKphirN2rV4ruYsmJ6IESPVQWIDKN+pt2ytDiISPiS0KSm3Bqxb2etBh+/3LSn1sbD5Z3GS0AGjXGK90xJZAFg+b529+hbGDsNbSjhIMDMliDD3h+lpiTct2dmUv9Ugu0uLyrOZoGqUWshZp6DbQzWC5OWBBJm15ElL5SFoN8thRwIzF9j2B8qNW7vQU9YHMLa017FAYPwx9edJQf9KJX8KfGVIqa+5sR0JaoWbpkPDMKJ9r+Wd1ihixqCyjtFmzaBIlMqTNI8+xuMk+bq0jrVrl+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Fri, 28 Mar
 2025 06:31:52 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:31:52 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] media: imx-jpeg: Fix some motion-jpeg decoding issues
Date: Fri, 28 Mar 2025 14:30:49 +0800
Message-ID: <20250328063056.762-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b793cea-76d4-4844-c733-08dd6dc23a03
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LoPsgmG6eJqYDIMGfdYbDgVZSk1/+ee0u68lfq3iMWoRu5lDv4/wcNJSxqfK?=
 =?us-ascii?Q?YOOX/roRkuZLVkKV7FUEyFCaSCoq03eJW2IDHZPtSIYxQHpTJJQIbyeoJY0V?=
 =?us-ascii?Q?/4AIz/Ls/+YTr7GuQZL8GoTN/p/Hv7TkwXER61t0Uf8nvwIzDuwozfAvIt97?=
 =?us-ascii?Q?RYyOYf4e0Z0VmIrdkjp+gxHCPe/5GVSvO8onalHoQB8AJXAykFQSMstfV35D?=
 =?us-ascii?Q?+O3qHZOxNozy1Oev9IEfuumhtq/KUvexEWMRwoRHQ3z7d8lUN4CulQVlFyly?=
 =?us-ascii?Q?xUR/rcIB0/lZKSCOHDR4gP/h0gkzXuUV/fpMrsWjwrJIP7S5nQtWcHUM/okP?=
 =?us-ascii?Q?IoGCVEd9eN8We8X4Bi05sf7Cpk+aFh7bukVYT8nTRUyzG1pKGBg71nr216BF?=
 =?us-ascii?Q?lTLAHo0kWIyFu6V0Q+k2VGZ/hHhc3CXcP38KiV3L222D82yWawI9Ay2NePLV?=
 =?us-ascii?Q?Nx9lv23SKSiXQkvPrDMJEFLbtYhWXfRwbcEOgmUR0jzFOj+zSfofC2Jn40Rd?=
 =?us-ascii?Q?wZ8kx6eoeMF2gysUfVumWYt5MkNY3DS6CrD5I1SbzqwpwvPk9jAt80//aVad?=
 =?us-ascii?Q?tLq4OkWtCnQ434eFu0zDvoTCdWw/QE8z11edGlSDwgJ2ujABbUELyiVURuLY?=
 =?us-ascii?Q?x/ZWHZOq8jTb54jttCyXxqzj8e93H1FIgN+MQoAt/RZYzbxdEv38H5/NicQE?=
 =?us-ascii?Q?+uP8HFRogEZXYLlIc+0HwDoZAJ+87TTfORkpvF9qGasC++fzeEnta7zS9tjl?=
 =?us-ascii?Q?q5CzMkx/UbAtr+cyj1YtNRnSGO6g7sLZ6NoUy0V9cQu+70JgxUSXjJT9I8E2?=
 =?us-ascii?Q?v5MsV6HdlQw8YYYnHLkCnRDDoxZ0vQ+KW7v+PcE3DJbcNgvHjlVnFhJHPu8I?=
 =?us-ascii?Q?U8ff9OoaFl+TghomgTo0YZLbG/c9tglye+NUo7o/irAgTlqz5kQn2w1W1Q9C?=
 =?us-ascii?Q?PvwrNIJU5tIpcIRI2moQRCsJG9xbAOLxlRGw8WmKtZeuPk80k7v6l4TDJSnt?=
 =?us-ascii?Q?9cBtfj/TGsL4fnXzpHLcR4+ycVZKjDnWcjD6pOj+dkvKo1/xF5OA7Q5lmY7P?=
 =?us-ascii?Q?Ny1OUv/B/xKXbyhIkoKuxIVNF/N7lY2dXmM9kK/pkERdduz+mHkLc2crDI2h?=
 =?us-ascii?Q?FrGxUUF7PO3MTQ5L+MBek9L5FqEEkzyirLGuPNCALU56QhBXmtjav7pV6Vxv?=
 =?us-ascii?Q?0GwrrYXeiKsxAxwdhrOSVTkfIeRcA6w3BRKduH6PWOlRoUJHpViGvWhlEQUp?=
 =?us-ascii?Q?dSTzLvYNWvyTf4tUSqBJh6Bm3AP9Q2ib1p/v+Pl0VqjBaUQ6GmlW+AkknOqz?=
 =?us-ascii?Q?RIK1X8pMkDO1ORy8s4+GmINH/xpVIob2GwrX23GJFDM86OYGifFFA112OgL6?=
 =?us-ascii?Q?GIk9NZMwnyi5d+kF0ER9SfbXLxdpqZIczjfNZgh9FAhc8c+R0zj4AfLq3BY+?=
 =?us-ascii?Q?d7iuZEXDQwas3I0RS8sztmODUb2rl+l7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ssZEYr0RFD+Xe7tq398hgxI+96RO+R8ixN74ZgACh7/4Tg25imptXrntXRVO?=
 =?us-ascii?Q?F0dxRs7tOtcY4aKVehNSmE+ESTXfmnKx5zifLMyL9x38ukEjLRnTOhavP6TP?=
 =?us-ascii?Q?Oq3EEHESwdTtWEe+HztIu9LsFxQemkMkrG6tG7ZIlTGxlMNo8YsNF9E16sZt?=
 =?us-ascii?Q?lcUI3k3EmMf5EBmtU5cc0h93UPlyPmoLXAwrJjfXbxrSihFYxKHd27VR7q/V?=
 =?us-ascii?Q?0fr2j00JXg0jPU6bkSj2hGoj3dGZUJnNPAY+ix2WB04GflgVFiXtiO6AoEDt?=
 =?us-ascii?Q?qXqmRTi7XecrH0i6heJ4k5yLydp40B62RnWSmGx7GyQ1aA28Cx2COLYOw/LE?=
 =?us-ascii?Q?Wh4QtbMsul7s/QA2Mx4qym0/o8KFyhXa/AevAKzmK/xvfzfehfqhTon9G5ht?=
 =?us-ascii?Q?lU5in8eZfN0YuDuEjAb7UTz+mXBowgR3KVIUgIc64Fo4Qp4Rf/1I5dtuuzIW?=
 =?us-ascii?Q?7h+biv2jcHFmAREMfmRs19VEN+An8xW0Qomx2G3W25iYfBy3fYcyE0D8xNVR?=
 =?us-ascii?Q?NMS14G3zlsvXnRvAYBEsrOrm12rJ0DA0sGM34iYNDlC2xpBv4DTG2wkKfOR7?=
 =?us-ascii?Q?gRqycRdmMKx9HYNM+o3mQwP/gPNb2YTS95mA0wfDTfCb/tfgQGQ5CY7mNiCG?=
 =?us-ascii?Q?+aA2hgkOBRc7zcKPCj8Jhub5Qy70LZtERLBSZzB1HJXIPCinglKNp+fvtcD6?=
 =?us-ascii?Q?PRfdiTa/h6jyZoWGi4zDSMiRo50m/i4thsExhuZhtskUAY6AiJ5Wf2ivBkVa?=
 =?us-ascii?Q?BiyeIfwAyaj0pvdmsGGQ2D7fy1R/k9NMdW1GweJgniUwu/xADHC5jZzwBV6/?=
 =?us-ascii?Q?OFOf49IpaVDdJozuvwh9OiWxdJG5tgaXqFj2TetgzTsYKZxTJ+tN/HIv0Aj8?=
 =?us-ascii?Q?cYtG1Tx2LE0+a0lKY06WPjwjaZAFDJFmEsQV+yzzfaGGKMS7ElNFIKXrZdGf?=
 =?us-ascii?Q?FjWLnahfcijOSPaTLGHAggM+b9j+nlG2EsJvd+kRXDPMGqcNqMeGWc/LGAuo?=
 =?us-ascii?Q?tSjBIQBMmfVH9nJxmngmqqikRYtqxAkTpBQYN4o/QJfDhr2249mHgRNAEc+u?=
 =?us-ascii?Q?z8PxuzJuuB1duawFb4Y+QGhA9ULa24AfVLVkCKBhseMWDw5yF52pnz3+VSzd?=
 =?us-ascii?Q?brfLnHdVJWoOM1LAlHqtFRx+hpcwz4b5l1f4oHHDiu/nHEv9YzLHMAxUr7cV?=
 =?us-ascii?Q?fA5PU/UCUcN6hZwtEu8sHZG1MTlbjrS4D0euAh2gwV1rm0yC0hMy9VPMl+fG?=
 =?us-ascii?Q?GMgoev7Jv1s/GEY1KSCwXxNyx0ATMOdCBblm7/DrXToK3dCCxZvNxBBMeNMH?=
 =?us-ascii?Q?VslJ2qyFFhm45RSTa2RNvbq28e7QCjmEePpe7PGE6NgFTr7eC/oTqn4ElM0r?=
 =?us-ascii?Q?TZnoPqxX8I7XLEPb1yA3kzvhuyagRdAtwYXkXiLDDTG0Mh/k7UNIa2fxsJAk?=
 =?us-ascii?Q?8nzIpv76sqWULcaUKc9+++AlRPVn5In/WafEB0/4O1+lyttGC7DYKB59TQLG?=
 =?us-ascii?Q?MuhsHKpa56ZIAVANKnl+ji3X1Y6tL75XCN3pJeqXelvzqzR1h4p9eQf6Iv05?=
 =?us-ascii?Q?yRndn0o2ZimocKBHjUWgzU2ag05ULZUnUX4UDcYH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b793cea-76d4-4844-c733-08dd6dc23a03
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:31:52.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pbpRrIY04xxykn+v9MFwv2lpAzGiDIz4cjVtTtbRmPEQ7n+6lvaXEHo49c3WnRPQKlO7OVZPfWNIDSayAPmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Ming Qian (3):
  media: imx-jpeg: Enhance error handling in buffer allocation
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 109 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 86 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


