Return-Path: <linux-media+bounces-12632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CCC8FE328
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 11:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F4B1F221B8
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 09:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D383152E15;
	Thu,  6 Jun 2024 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WDfWeC2u"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2085.outbound.protection.outlook.com [40.107.14.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE511514FF;
	Thu,  6 Jun 2024 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666817; cv=fail; b=dYLQXds+JoSwsRnauEHqy//OLhDzrxVN+ML6TM9yXjHgW965+Rx6WGlht4meKgAcoqP/5bnTD/4V4RCppEAqy+unqCSf30LLHwC4m067yeYklkLeiZXohnim4g3zPbZe70W9lgcjEnDlCyFlxpwHaJcXzQU/+CW2et9BTrsn4iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666817; c=relaxed/simple;
	bh=D+QWyGjkch2LtnwliHyM+TeFRHwq837snS8jZg8aLv0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MilaMlhPhcyNg/loSUhu2LHAOPv3hxhnU1SWSh/34h4Pc3MbOu1Dh3cvteRS3WiHRRzU/b8Tb6PvDHN/s/cn0/sGLaxc61Z9shqT59mJobGZRrSy1z+qPM+Ve/9AzrYgoKk14S8B+mfV6NUE7Q1dslJEZ0Nm+F85qwbwj9flWvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=WDfWeC2u; arc=fail smtp.client-ip=40.107.14.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay1P3rgtGtwjr7zA3S79Rw1nuOPD93tUa6RPmCHwKHwPeMNu2P/ZCu4m8ZnCT9u/M7AH2iVwvk/ns9F2RAhF/2sMQE8gEEHjkpOxfuC+Ae/G9su5wSXGazaTVPzxOouKS2hX/ybeq5zG0q73RYWUI8I0SdWoPiKSDO6i8YVknhflt0ul/A5Jh3nmF0MqjQBPyOoKlBLP+Wbsoq2DweA2ISOdsLtA67KlmClQoqHb3yJ5Q8hbQVWCyoUJfM1Ns8JfBry/x98Q3KRN/1RpkcewpF6XA5QvNdUzVlB+WAYV+hXrYawdcM/XInzKMdkqiQ3vZpRXU95Rsaw2donfREmXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL6Gb1MRxJHhKXkOIyhEHPTHZ9l4O84vX+NbtkEHpzE=;
 b=jLyQwTG3tBUcOJUiJloXqXVPTpiLQrCVfRsXrhfIhKgJvygKVRNwdmlyahBSCUCnRw5O5op+U9IrgICR6nXuzP9bRPRU5z3DWgwHdr6i7mSHdiN7xn69KAXtC7m8Zbvv+6xz/My5FW+DYXWCQ1fbdmb3Ftv8SfL7ATRzgx0yUkTDyPhRDh5nkA3gb8vvc7aUQppdwwMBliR0JdO9oF8cFIWwdRDUK+5kw2WA5No5PmKdLCnqw/Ba08R2j2R7uKiSce2VUIB6cmRh1Ghsfv5fyjoDn+LKEjHlvgDbh/3bsVmpNAJoW6y6/Rt1CoCGbCH+2JI+/EbVZFnvWNsnae8LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL6Gb1MRxJHhKXkOIyhEHPTHZ9l4O84vX+NbtkEHpzE=;
 b=WDfWeC2urUomGXAETpsrKyxEYDhtEh2oh2ujQTGjq6DFNVlVr2Q1xrFlt1/tlgXvg1qf/xRX2V4cPlXAgJK9+DdKW6vBHzMJvBvKq07RNIk6NF+TFvKSccuJvXlyS7gMIsip2f4zcRRWYRrNkKYPGqYCB0KOsIP/ftGtL2YAatQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PA4PR04MB9294.eurprd04.prod.outlook.com (2603:10a6:102:2a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 09:40:11 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 09:40:11 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: carlos.song@nxp.com,
	frank.li@nxp.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Date: Thu,  6 Jun 2024 17:48:15 +0800
Message-Id: <20240606094815.933755-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:3:17::20) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|PA4PR04MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a04eb9-e019-49af-8253-08dc860ca895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|52116005|7416005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HTQmNEvo7n4FvVQUV7POG1tcMt5jeC9xKj3NR0HXaPbha1DI3NcF+BC5cGAT?=
 =?us-ascii?Q?FdEAJdt3j2xBVF3V3XiC+YsVTXZxohqZJYgOoOHYX7oBEbe9Hy0PcnV9y1bN?=
 =?us-ascii?Q?5HnQI+dqJJDOILLbrr9qypKroYTqzo1/0tyaF8QIXsqUlPDqTvUvhhK9lpMY?=
 =?us-ascii?Q?vR7V4v/iAkJ+B+zXlaWd/EgCZP4vonZBaZKejoASF8XzW+KdqjCZ8XLXUx/l?=
 =?us-ascii?Q?rddXZXp1H0bMcIc9BGb58E/NibIs5hMbP/IKgoI4pDFUVRelUwNaERd+RTku?=
 =?us-ascii?Q?d9JMjwcrGBB/ws1HQXeYEipoGZWfaHXV6sV+WkQU02dFqYrwckjNTipJAwNy?=
 =?us-ascii?Q?ot9v2Pqa4pvKkyt7KwPvQ1JeQy/Otkxc+BEkduNU9e0uZHWFwd6Lft562dVw?=
 =?us-ascii?Q?CitaTDcad87k9VV9xSLyY/ZHW8jU17PLZspB/LDyHnJXq2Ly4yE8MJo/LJZN?=
 =?us-ascii?Q?sXDHs8odDyx/auLcRcuF4h3kQba0faBqnS7k3a23HMfevhoM/eOBg79nHurU?=
 =?us-ascii?Q?tPkVVTOGIJUJhvlCDV++CaYdRw66tJQkwENTI9f/fOjPDnJQPk6pwKpMaEik?=
 =?us-ascii?Q?lHERlNtC/+/PQcmaciY4VECyKVoSjJbOwWjhv2Ab2YKplnPsHFGWNq9vDU5L?=
 =?us-ascii?Q?ROA3Fz3sfA1wgdTSXsNZePEv27KEhldEf/Ny3Ks/uHf93paOrRQbwc51IZMf?=
 =?us-ascii?Q?N1AqanY4bnPdH4DcDS5u2EOA3ezjUbDpjwaN15eq7z3CZuoh0Tl1caMbazYE?=
 =?us-ascii?Q?MxYIZ+kdl25QxJcby5Qan2jzE2XMbh/2VUuOIS7WFWrnWWQStXx4Ik7y5tEB?=
 =?us-ascii?Q?5Rib0yFSE46UZzhi+sVM5BZlt1mChDi/Ot4xCyCYSyawn8HnFTRPaw4VLH9H?=
 =?us-ascii?Q?OCg0Xvz6dldndU0Zcn6yW203i2TlncRLHsrZHDzHOyS5Ousli3Dt1V+x76F9?=
 =?us-ascii?Q?V31H6C4NCYRpkDTffs/0D+vC7ZvYF0Hh1HPVTgW+QxEFptLCuZ5o7XvKgAZ1?=
 =?us-ascii?Q?9fNWtwQeZvudslge5kAAyr0kaaZeN7IgkvY+tkehHzq+2F78QXzGvpaBBslW?=
 =?us-ascii?Q?YCqEwb/LBng6bgpUXaJ1EPDL3xk2+8uo/5nlKzoCx3WOWsXxMFyN/j5URDcW?=
 =?us-ascii?Q?T9g+niCL50B1s72vZ6jS0v/GQ4/YoYGZvccfXTAqSNleg4z/Iohjdno7wp5r?=
 =?us-ascii?Q?XJYmTF+BlXzwg+WxOvFdYYboGuSd99VF27rJS4IZTZr7+B3AIUozIxgIZXYr?=
 =?us-ascii?Q?M0tXqQeAig8ze5H3Bzo2OhE/tql8dbdB5pcHwiiCa2iMmYi/Vx6jTBPDYR6a?=
 =?us-ascii?Q?sA9PCm2VMCRtYrwdf8024+EbT0jCRCMxreagLFuyctfSGbhGFENnGyEoy9PA?=
 =?us-ascii?Q?loRSBeM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W4CoObp9YDFz4CM8Qsh98+upzamL5UqLL7SXKlkGIu6zLjaU5kEaftIZOcXt?=
 =?us-ascii?Q?iPeS9Ko465sxDm4OzfyfKonXGw4ezjTUKEYK4V9fkJj125FWrfwiXNevkfUQ?=
 =?us-ascii?Q?69KGsDcdX+Dgt5HtxXonWGvuIK+Dzp9ojpeO6Dglr9OQ/dxOVWOaEyDucddX?=
 =?us-ascii?Q?LZypZxTKM0y2DrkC5TgcvFepeH/O6JGChaeq0rHh5CSnz11F5faP6SIp2ho+?=
 =?us-ascii?Q?o8lwCpNjMwxdnIYo1r7o44vBWSPYen7Fnh97DBsYMeVt3s+W1aOQL35A+gR4?=
 =?us-ascii?Q?KZjOwx6cEDz3JSEhvRhDnpjeMqISpQBjoMWR4ryZNP60gTPXfJocMJb+Yesb?=
 =?us-ascii?Q?i/YhG1Dt9d4BPlgVrrQbXl0LHiBSeGKu33gQaJTd9a1mdNKDYmkiA+Uk8TVF?=
 =?us-ascii?Q?CpYQPIbQO9t6sEJGlEleIlEGAjvEdlqitvsLWPQXPnKJCuyxdFBnwO72wV9Z?=
 =?us-ascii?Q?NBDA3n8cqHSesd9/B4PWYgdUwLCY4E9NXxYfo2p2ppM4kFQ6dzNmSq4Kkof4?=
 =?us-ascii?Q?kvLoX0Tk6Z3CRDO+WWrq4krJu4jA6EkZE1svvHVkXtnw/EziywgsgmGRtwrv?=
 =?us-ascii?Q?fCenecod86RDyB3fxKXDxpjBFKX4p0izAURXqnNq46t8iWAsOqvgBciGPcdX?=
 =?us-ascii?Q?/ysnEt7ZrOWiLm2OnpaC0YSSUdOpSgua1/7n3sRZecIUEqunNme08C3BbV+g?=
 =?us-ascii?Q?ROEzKfHAPzfWU/Rbmzd52XIoWGLNb57xE4gBQQxem/J0QHZxLBWdvJ1Qdz74?=
 =?us-ascii?Q?QxAI1xW/CHI9bIa0OSfZuRdiOSIs1RPpqI3adFnjJa2lS65p2AxQCgw/mYzo?=
 =?us-ascii?Q?Alchj2j/HWwoKSeONhKY6uAyTR7tNOI4kM8t94G9b1r9zu1cu68cHMkHH8Tw?=
 =?us-ascii?Q?sDHor5WQZdVydZL+6tLyONKjMm571YXVlIYFJhI8PxS0M1r2FP4dMKzyMnlI?=
 =?us-ascii?Q?+0Rxan4tKOTx8xJUVsfiNiSkhJM9HPnAVLLo84Ilf1lAPqsmeiIL68hfVwTs?=
 =?us-ascii?Q?IseG0FtFz2RTATNgKeyblaKrG1/vl8+klyC5sep2V04RPzBpe4Lu/0PD4C5p?=
 =?us-ascii?Q?vxD1dDah1qWWElBgapdZdnyIPPRZBcAzH+PJvG7zo7nQNVM5F8S8SLSKPMbC?=
 =?us-ascii?Q?65F4BngWzKvC0X6eRrccff+8A9WJqaVAH7uV1aPVN3fIqtXl2HCPAbrRxHpm?=
 =?us-ascii?Q?Op//S6/4DyO+j0G9M7icwiMhF5ykq2p+cqhX6Xu47LiHS6NPeqEOJGvyn6/+?=
 =?us-ascii?Q?JeXpsBwNRIMlg+NpP1weqmEMNnMf37MQ2X/F7y7a+Qncr0kP8qnOlF1PVrqD?=
 =?us-ascii?Q?KEkVTF94wL2D2iMc20igwiVrA5CCwzojLuqj5vIuljrSo3quc2BFjAD+iN2Z?=
 =?us-ascii?Q?U5z9Z9SrpGXVa7qxGs/YIQ8rwMUpqni5+Mj358ndXL2f0hPKwftJFGBBKou5?=
 =?us-ascii?Q?06/KzoUeYQM86rrm203bAEuRKxn4te8HtKcRAbAawLr/ttI381OVEiobxtU+?=
 =?us-ascii?Q?VzjWRS6Pi0ZUwyAXVzBnetBhh8rhHVTYRg+rM37rq7bATB+OEJpZxlHmsXwP?=
 =?us-ascii?Q?72BtiLviTm6YHKP0q+AeegMSVDzLDlwqxyVIjQ87?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a04eb9-e019-49af-8253-08dc860ca895
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 09:40:11.1640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2lX/XCENvH4KzRk95Erfz007WOYUXo0JLRzYHIRTQQnxyOd8wIMzkKG1/9yyOYHt6fPKOr6GFFZUV6DBSpKng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9294

From: Carlos Song <carlos.song@nxp.com>

Add eDMA mode support for LPI2C.

There are some differences between TX DMA mode and RX DMA mode.
LPI2C MTDR register is Controller Transmit Data Register.
When LPI2C send data, it is tx cmd register and tx data fifo.
When LPI2C receive data, it is just a rx cmd register. LPI2C MRDR
register is Controller Receive Data Register, received data are
stored in this.

MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
+-----------+-------------------------------+
|  C  M  D  |          D  A  T  A           |
+---+---+---+---+---+---+---+---+---+---+---+
| 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+---+---+---+

MRDR is Controller Receive Data Register.
MRDR[0:7] is DATA filed.
+-------------------------------+
|          D  A  T  A           |
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+

When the LPI2C controller needs to send data, tx cmd and 8-bit data
should be written into MTDR:
CMD: 000b: Transmit the value in DATA[7:0].
DATA: 8-bit data.

If LPI2C controller needs to send N 8-bit data, just write N times
(CMD(W) + DATA(u8)) to MTDR.

When the LPI2C controller needs to receive data, rx cmd should be
written into MTDR, the received data will be stored in the MRDR.

MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
MTDR(DATA): byte counter.
MRDR(DATA): 8-bit data.

So when LPI2C controller needs to receive N 8-bit data,
1. N <= 256:
Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
MRDR.
2. N > 256:
Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
COUNT(N%256)) into MTDR and receive data from MRDR.

Due to these differences, when LPI2C is in DMA TX mode, only enable TX
channel to send data. But when LPI2C is in DMA RX mode, TX and RX channel
are both enabled, TX channel is used to send RX cmd and RX channel is
used to receive data.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <frank.li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 536 ++++++++++++++++++++++++++++-
 1 file changed, 528 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 0197786892a2..26640c1dadc7 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -8,6 +8,8 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -29,6 +31,7 @@
 #define LPI2C_MCR	0x10	/* i2c contrl register */
 #define LPI2C_MSR	0x14	/* i2c status register */
 #define LPI2C_MIER	0x18	/* i2c interrupt enable */
+#define LPI2C_MDER	0x1C	/* i2c DMA enable */
 #define LPI2C_MCFGR0	0x20	/* i2c master configuration */
 #define LPI2C_MCFGR1	0x24	/* i2c master configuration */
 #define LPI2C_MCFGR2	0x28	/* i2c master configuration */
@@ -70,11 +73,14 @@
 #define MCFGR1_AUTOSTOP	BIT(8)
 #define MCFGR1_IGNACK	BIT(9)
 #define MRDR_RXEMPTY	BIT(14)
+#define MDER_TDDE	BIT(0)
+#define MDER_RDDE	BIT(1)
 
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_DMA_THRESHOLD	8 /* bytes */
 
 enum lpi2c_imx_mode {
 	STANDARD,	/* 100+Kbps */
@@ -108,6 +114,22 @@ struct lpi2c_imx_struct {
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
 	struct i2c_bus_recovery_info rinfo;
+
+	bool			can_use_dma;
+	bool			using_pio_mode;
+	u8			rx_cmd_buf_len;
+	u16			*rx_cmd_buf;
+	u8			*dma_buf;
+	unsigned int	dma_len;
+	unsigned int	tx_burst_num;
+	unsigned int	rx_burst_num;
+	resource_size_t		phy_addr;
+	dma_addr_t		dma_tx_addr;
+	dma_addr_t		dma_addr;
+	enum dma_data_direction dma_direction;
+	struct dma_chan		*chan_tx;
+	struct dma_chan		*chan_rx;
+	struct i2c_msg		*msg;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -305,7 +327,7 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 }
 
-static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned long time_left;
 
@@ -451,6 +473,444 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 }
 
+static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
+{
+	if (!lpi2c_imx->can_use_dma)
+		return false;
+
+	/*
+	 * When the length of data is less than I2C_DMA_THRESHOLD,
+	 * cpu mode is used directly to avoid low performance.
+	 */
+	if (msg->len < I2C_DMA_THRESHOLD)
+		return false;
+
+	return true;
+}
+
+static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			   struct i2c_msg *msg)
+{
+	int result;
+
+	reinit_completion(&lpi2c_imx->complete);
+
+	if (msg->flags & I2C_M_RD)
+		lpi2c_imx_read(lpi2c_imx, msg);
+	else
+		lpi2c_imx_write(lpi2c_imx, msg);
+
+	result = lpi2c_imx_pio_msg_complete(lpi2c_imx);
+	if (result)
+		return result;
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_calculate_timeout(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long timeout = 0;
+
+	timeout = 8 * lpi2c_imx->msglen * 1000 / lpi2c_imx->bitrate;
+
+	/* Add extra second for scheduler related activities */
+	timeout += 1;
+
+	/* Double calculated timeout */
+	return msecs_to_jiffies(timeout * MSEC_PER_SEC);
+}
+
+static int lpi2c_imx_alloc_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	u16 rx_remain = lpi2c_imx->msg->len;
+	u16 temp;
+	int cmd_num;
+
+	/*
+	 * Calculate the number of rx command words via the DMA TX channel
+	 * writing into command register based on the i2c msg len, and build
+	 * the rx command words buffer.
+	 */
+	cmd_num = DIV_ROUND_UP(rx_remain, CHUNK_DATA);
+	lpi2c_imx->rx_cmd_buf = kcalloc(cmd_num, sizeof(u16), GFP_KERNEL);
+	lpi2c_imx->rx_cmd_buf_len = cmd_num * sizeof(u16);
+
+	if (!lpi2c_imx->rx_cmd_buf) {
+		dev_err(&lpi2c_imx->adapter.dev, "Alloc RX cmd buffer failed\n");
+		return -ENOMEM;
+	}
+
+	for (int i = 0; i < cmd_num ; i++) {
+		temp = rx_remain > CHUNK_DATA ? CHUNK_DATA - 1 : rx_remain - 1;
+		temp |= (RECV_DATA << 8);
+		rx_remain -= CHUNK_DATA;
+		lpi2c_imx->rx_cmd_buf[i] = temp;
+	}
+
+	return 0;
+}
+
+static void lpi2c_imx_free_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (!lpi2c_imx->rx_cmd_buf)
+		return;
+
+	kfree(lpi2c_imx->rx_cmd_buf);
+}
+
+static int lpi2c_imx_dma_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time_left, timeout;
+
+	timeout = lpi2c_imx_dma_calculate_timeout(lpi2c_imx);
+	time_left = wait_for_completion_timeout(&lpi2c_imx->complete, timeout);
+	if (time_left == 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "I/O Error in DMA Data Transfer\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_unmap(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct dma_chan *chan = lpi2c_imx->dma_direction == DMA_FROM_DEVICE
+				? lpi2c_imx->chan_rx : lpi2c_imx->chan_tx;
+
+	dma_unmap_single(chan->device->dev, lpi2c_imx->dma_addr,
+			 lpi2c_imx->dma_len, lpi2c_imx->dma_direction);
+
+	lpi2c_imx->dma_direction = DMA_NONE;
+}
+
+static void lpi2c_cleanup_rx_cmd_dma(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	dmaengine_terminate_sync(lpi2c_imx->chan_tx);
+	dma_unmap_single(lpi2c_imx->chan_tx->device->dev, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+}
+
+static void lpi2c_cleanup_dma(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (lpi2c_imx->dma_direction == DMA_NONE)
+		return;
+	else if (lpi2c_imx->dma_direction == DMA_FROM_DEVICE)
+		dmaengine_terminate_sync(lpi2c_imx->chan_rx);
+	else if (lpi2c_imx->dma_direction == DMA_TO_DEVICE)
+		dmaengine_terminate_sync(lpi2c_imx->chan_tx);
+
+	lpi2c_dma_unmap(lpi2c_imx);
+}
+
+static void lpi2c_dma_callback(void *data)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = (struct lpi2c_imx_struct *)data;
+
+	complete(&lpi2c_imx->complete);
+}
+
+static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct dma_chan *txchan = lpi2c_imx->chan_tx;
+	struct dma_async_tx_descriptor *rx_cmd_desc;
+	dma_cookie_t cookie;
+
+	lpi2c_imx->dma_tx_addr = dma_map_single(txchan->device->dev,
+						 lpi2c_imx->rx_cmd_buf,
+						 lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+	if (dma_mapping_error(txchan->device->dev, lpi2c_imx->dma_tx_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	rx_cmd_desc = dmaengine_prep_slave_single(txchan, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_MEM_TO_DEV,
+				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!rx_cmd_desc) {
+		dma_unmap_single(txchan->device->dev, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		return -EINVAL;
+	}
+
+
+	cookie = dmaengine_submit(rx_cmd_desc);
+	if (dma_submit_error(cookie)) {
+		dma_unmap_single(txchan->device->dev, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+		dmaengine_desc_free(rx_cmd_desc);
+		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
+		return -EINVAL;
+	}
+
+	dma_async_issue_pending(txchan);
+
+	return 0;
+}
+
+static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	bool read = lpi2c_imx->msg->flags & I2C_M_RD;
+	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	struct dma_chan *chan = read ? lpi2c_imx->chan_rx : lpi2c_imx->chan_tx;
+	struct dma_async_tx_descriptor *desc;
+	dma_cookie_t cookie;
+
+	lpi2c_imx->dma_direction = dir;
+
+	lpi2c_imx->dma_addr = dma_map_single(chan->device->dev,
+					     lpi2c_imx->dma_buf,
+					     lpi2c_imx->dma_len, dir);
+	if (dma_mapping_error(chan->device->dev, lpi2c_imx->dma_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	desc = dmaengine_prep_slave_single(chan, lpi2c_imx->dma_addr,
+					lpi2c_imx->dma_len, read ?
+					DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		lpi2c_dma_unmap(lpi2c_imx);
+		return -EINVAL;
+	}
+
+	reinit_completion(&lpi2c_imx->complete);
+	desc->callback = lpi2c_dma_callback;
+	desc->callback_param = (void *)lpi2c_imx;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
+		lpi2c_dma_unmap(lpi2c_imx);
+		dmaengine_desc_free(desc);
+		return -EINVAL;
+	}
+
+	/* Can't switch to PIO mode when DMA have started transferred */
+	lpi2c_imx->using_pio_mode = false;
+
+	dma_async_issue_pending(chan);
+
+	return 0;
+}
+
+static int lpi2c_imx_find_max_burst_num(unsigned int fifosize, unsigned int len)
+{
+	unsigned int i;
+
+	for (i = fifosize / 2; i > 0; i--) {
+		if (!(len % i))
+			break;
+	}
+
+	return i;
+}
+/*
+ * For a highest DMA efficiency, tx/rx burst number should be calculated according to
+ * the FIFO depth.
+ */
+static void lpi2c_imx_dma_burst_num_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned int cmd_num;
+
+	if (lpi2c_imx->msg->flags & I2C_M_RD) {
+		/*
+		 * One RX cmd word can trigger DMA receive no more than 256 bytes.
+		 * The number of RX cmd words should be calculated based on the data
+		 * length.
+		 */
+		cmd_num = DIV_ROUND_UP(lpi2c_imx->dma_len, CHUNK_DATA);
+		lpi2c_imx->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+				   cmd_num);
+		lpi2c_imx->rx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->rxfifosize,
+				   lpi2c_imx->dma_len);
+	} else
+		lpi2c_imx->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+				   lpi2c_imx->dma_len);
+}
+
+static int lpi2c_dma_config(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int ret;
+	struct dma_slave_config rx = {}, tx = {};
+
+	lpi2c_imx_dma_burst_num_calculate(lpi2c_imx);
+
+	if (lpi2c_imx->msg->flags & I2C_M_RD) {
+		if (IS_ERR(lpi2c_imx->chan_tx)) {
+			ret =  PTR_ERR(lpi2c_imx->chan_tx);
+			dev_err(&lpi2c_imx->adapter.dev, "can't get RX channel %d\n", ret);
+			return ret;
+		}
+
+		if (IS_ERR(lpi2c_imx->chan_rx)) {
+			ret =  PTR_ERR(lpi2c_imx->chan_rx);
+			dev_err(&lpi2c_imx->adapter.dev, "can't get TX channel %d\n", ret);
+			return ret;
+		}
+
+		tx.dst_addr = lpi2c_imx->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		tx.dst_maxburst = lpi2c_imx->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(lpi2c_imx->chan_tx, &tx);
+		if (ret < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "can't configure TX channel %d\n", ret);
+			return ret;
+		}
+
+		rx.src_addr = lpi2c_imx->phy_addr + LPI2C_MRDR;
+		rx.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		rx.src_maxburst = lpi2c_imx->rx_burst_num;
+		rx.direction = DMA_DEV_TO_MEM;
+		ret = dmaengine_slave_config(lpi2c_imx->chan_rx, &rx);
+		if (ret < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "can't configure RX channel %d\n", ret);
+			return ret;
+		}
+	} else {
+		if (IS_ERR(lpi2c_imx->chan_tx)) {
+			ret =  PTR_ERR(lpi2c_imx->chan_tx);
+			dev_err(&lpi2c_imx->adapter.dev, "can't get TX channel %d\n", ret);
+			return ret;
+		}
+
+		tx.dst_addr = lpi2c_imx->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		tx.dst_maxburst = lpi2c_imx->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(lpi2c_imx->chan_tx, &tx);
+		if (ret < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "can't configure TX channel %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_enable(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	/*
+	 * TX interrupt will be triggerred when the number of words in the transmit FIFO is equal
+	 * or less than TX watermark. RX interrupt will be triggerred when the number of words
+	 * in the receive FIFO is greater than RX watermark. In order to trigger the DMA interrupt,
+	 * TX watermark should be set equal to the DMA TX burst number but RX watermark should be
+	 * set less than the DMA RX burst number.
+	 */
+	if (lpi2c_imx->msg->flags & I2C_M_RD) {
+		/* Set I2C TX/RX watermark */
+		writel(lpi2c_imx->tx_burst_num | (lpi2c_imx->rx_burst_num - 1) << 16,
+				lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX/RX function */
+		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base + LPI2C_MDER);
+	} else {
+		/* Set I2C TX watermark */
+		writel(lpi2c_imx->tx_burst_num, lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX function */
+		writel(MDER_TDDE, lpi2c_imx->base + LPI2C_MDER);
+	}
+
+	/* Enable NACK detected */
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
+};
+
+/*
+ * When lpi2c in TX DMA mode we can use one DMA TX channel to write data word
+ * into TXFIFO, but in RX DMA mode it is different.
+ *
+ * LPI2C MTDR register is a command data and transmit data register.
+ * Bit 8-10 is a command data field and Bit 0-7 is a transmit data
+ * field. When the LPI2C master needs to read data, the data number
+ * to read should be set in transmit data field and RECV_DATA should
+ * be set into the command data field to receive (DATA[7:0] + 1) bytes.
+ * The recv data command word is made by RECV_DATA in command data field
+ * and the data number to read in transmit data field. when the length
+ * of the data that needs to be read exceeds 256 bytes, recv data command
+ * word needs to be written to TXFIFO multiple times.
+ *
+ * So when in RX DMA mode, the TX channel also needs to be configured additionally
+ * to send RX command words and the RX command word need be set in advance before
+ * transmitting.
+ */
+static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			   struct i2c_msg *msg)
+{
+	int result;
+
+	lpi2c_imx->msg = msg;
+	lpi2c_imx->dma_len = msg->len;
+	lpi2c_imx->dma_buf = i2c_get_dma_safe_msg_buf(msg,
+						I2C_DMA_THRESHOLD);
+
+	if (!lpi2c_imx->dma_buf)
+		return -ENOMEM;
+
+	result = lpi2c_dma_config(lpi2c_imx);
+	if (result) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA Config Fail, error %d\n", result);
+		goto disable_dma;
+	}
+
+	lpi2c_dma_enable(lpi2c_imx);
+
+	result = lpi2c_dma_submit(lpi2c_imx);
+	if (result) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA submit Fail, error %d\n", result);
+		goto disable_dma;
+	}
+
+	if (msg->flags & I2C_M_RD) {
+		result = lpi2c_imx_alloc_rx_cmd_buf(lpi2c_imx);
+		if (result) {
+			lpi2c_cleanup_dma(lpi2c_imx);
+			goto disable_dma;
+		}
+
+		result = lpi2c_dma_rx_cmd_submit(lpi2c_imx);
+		if (result) {
+			lpi2c_cleanup_dma(lpi2c_imx);
+			goto disable_dma;
+		}
+	}
+
+	result = lpi2c_imx_dma_msg_complete(lpi2c_imx);
+	if (result) {
+		if (msg->flags & I2C_M_RD)
+			lpi2c_cleanup_rx_cmd_dma(lpi2c_imx);
+		lpi2c_cleanup_dma(lpi2c_imx);
+		goto disable_dma;
+	}
+
+	/* When meet NACK in transfer, cleanup all DMA transfer */
+	if ((readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) && !result) {
+		if (msg->flags & I2C_M_RD)
+			lpi2c_cleanup_rx_cmd_dma(lpi2c_imx);
+		lpi2c_cleanup_dma(lpi2c_imx);
+		result = -EIO;
+		goto disable_dma;
+	}
+
+	if (msg->flags & I2C_M_RD)
+		dma_unmap_single(lpi2c_imx->chan_tx->device->dev, lpi2c_imx->dma_tx_addr,
+					lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+	lpi2c_dma_unmap(lpi2c_imx);
+
+disable_dma:
+	/* Disable I2C DMA function */
+	writel(0, lpi2c_imx->base + LPI2C_MDER);
+	lpi2c_imx_free_rx_cmd_buf(lpi2c_imx);
+	if (result)
+		i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf,
+					lpi2c_imx->msg, false);
+	else
+		i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf,
+					lpi2c_imx->msg, true);
+	return result;
+}
+
 static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 			  struct i2c_msg *msgs, int num)
 {
@@ -475,14 +935,17 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		lpi2c_imx->tx_buf = NULL;
 		lpi2c_imx->delivered = 0;
 		lpi2c_imx->msglen = msgs[i].len;
-		init_completion(&lpi2c_imx->complete);
 
-		if (msgs[i].flags & I2C_M_RD)
-			lpi2c_imx_read(lpi2c_imx, &msgs[i]);
-		else
-			lpi2c_imx_write(lpi2c_imx, &msgs[i]);
+		/* When DMA mode failed before transferring, CPU mode can be used. */
+		lpi2c_imx->using_pio_mode = true;
+
+		if (is_use_dma(lpi2c_imx, &msgs[i])) {
+			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
+			if (result && lpi2c_imx->using_pio_mode)
+				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		} else
+			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
 
-		result = lpi2c_imx_msg_complete(lpi2c_imx);
 		if (result)
 			goto stop;
 
@@ -546,6 +1009,49 @@ static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 	return 0;
 }
 
+static void lpi2c_dma_exit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (lpi2c_imx->chan_rx) {
+		dma_release_channel(lpi2c_imx->chan_rx);
+		lpi2c_imx->chan_rx = NULL;
+	}
+
+	if (lpi2c_imx->chan_tx) {
+		dma_release_channel(lpi2c_imx->chan_tx);
+		lpi2c_imx->chan_tx = NULL;
+	}
+}
+
+static int lpi2c_dma_init(struct device *dev,
+			  struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int ret;
+
+	lpi2c_imx->chan_rx = lpi2c_imx->chan_tx = NULL;
+	lpi2c_imx->can_use_dma = false;
+
+	/* Prepare for TX DMA: */
+	lpi2c_imx->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(lpi2c_imx->chan_tx)) {
+		ret = PTR_ERR(lpi2c_imx->chan_tx);
+		lpi2c_imx->chan_tx = NULL;
+		dev_dbg(dev, "can't get TX channel %d\n", ret);
+		return ret;
+	}
+
+	/* Prepare for RX DMA: */
+	lpi2c_imx->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(lpi2c_imx->chan_rx)) {
+		ret = PTR_ERR(lpi2c_imx->chan_rx);
+		lpi2c_imx->chan_rx = NULL;
+		dev_dbg(dev, "can't get RX channel %d\n", ret);
+		return ret;
+	}
+
+	lpi2c_imx->can_use_dma = true;
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -568,12 +1074,13 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	struct lpi2c_imx_struct *lpi2c_imx;
 	unsigned int temp;
 	int irq, ret;
+	struct resource *res;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
-	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
+	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
@@ -587,6 +1094,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
+	lpi2c_imx->phy_addr = (dma_addr_t)res->start;
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
 	if (ret < 0)
@@ -640,6 +1148,18 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	ret = lpi2c_dma_init(&pdev->dev, lpi2c_imx);
+	if (ret) {
+		lpi2c_dma_exit(lpi2c_imx);
+		if (ret == -EPROBE_DEFER)
+			goto rpm_disable;
+		dev_info(&pdev->dev, "LPI2C use pio mode\n");
+	} else
+		dev_info(&pdev->dev, " LPI2C eDMA enabled\n");
+
+	init_completion(&lpi2c_imx->complete);
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1


