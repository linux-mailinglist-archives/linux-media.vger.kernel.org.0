Return-Path: <linux-media+bounces-30516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC51A93335
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F38F7AA2AD
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A79026A08F;
	Fri, 18 Apr 2025 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tI+tCBCA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40A211460;
	Fri, 18 Apr 2025 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960160; cv=fail; b=XEGJv+qCkqP9ife/ZiksiQXaUZOwRVrzzVFASaD2xg60M8aTm1QxLf5Fa1oRBgMmpBmaQMIENrQbZaqwZesfMpSS+7iCWGkeKnyE1Ve5MMBvwOakgyYXV7ercdfpaZyiHh8JXJxQhDqDM+ogltOM6DntgaN7LGr8rpQTDb/wJAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960160; c=relaxed/simple;
	bh=k2H5slb8RqIZLoOxU2qzDJWy6eGYlRpQqOK3N3vxops=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lN4lhQP9xfhpdQ04dkwIvDnE5YwDsciprmzjXsj+q5qlca/GyvxArRfzPav3wuFu1Vg5EXP8DHVbYSQYnICl35yqS8Rn/xHZLxsJsLkFLHpoTt/zd/UhatgThMK4PVlCATQwby+E8l8VUeVzT5KiJVu4QZP1P65P4ozV1Ul+qrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tI+tCBCA; arc=fail smtp.client-ip=40.107.105.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQWNo7waJFTgAVFH4EQfEEfNJUj8+wQRsXHNZV3vKZvMpkja8bLCWKiXQHBaxUJsC+tCcw5TcaTyPsYTnzsG0xjfvbNAAy/SvAO/drjYUzHt3dnBoVKILcFJCvF7VyCnlFw/TsyPF5rsBODKSrUsnNqy2WOrWX7ojCViZj3lBLUh/7BcZOBBmLCw/8ZrUcxsFGC/+AMqPhK0tOmkQKuZjujNkXJSyRT89c1PYlmK7VqwliaB2PG9AfilcyOyfJRHUfomVZebaM+sz5jDGSoDNRqIYz74kw3JHZy9B4J8OkX4xKmz1a9UtBtcMjA8vJr+RVApgS/2fw0n6mU2UsczQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRuDdJbBSA7XsrTX3P/XP68CgJnl1AGmmrbB9ZwT+Ak=;
 b=Xd9DZnzZI1cLv3XWwJe86UD3EOpBL15/FQvueSiaKnQqZMcs2LcfTOoTOtaHA0pmWbSNBJE5Zp7X3hwpzeQTYlDwFz7gmVd6OWplOJH7DhbPr/Qe1/+fzS1a5vtwICeYNPcGAOIKLK9AW7tH5tRGEzytcdLq3uzrogrmJT1boxP7DrkAu/7aztd8XA0IC86eg6QVJEprqP/aB8NwqF6xBTi+2dYVRbURUgCh+mxHwkydk/MQ0rVslezUi4ccR6YJmjzlAILVZ+PfsISc+HDAvXqUVa/zgVTXZ7wFIYxZ9xelF2gJyj2aHi8qZZhHqTtv2GhMonjconOSdfdKsCpXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRuDdJbBSA7XsrTX3P/XP68CgJnl1AGmmrbB9ZwT+Ak=;
 b=tI+tCBCAe69KKsQ/B14UTOhN3D2/cOflWj5RlzwI+nowQ5z99rBwcpw0+PnJm1/DTWQcYgt2eR+qBX+kZAN8JRQ3Rnt3TZDzYZoi01DkgeKcJVy/lEto0aTTsE4D7Oi0DMuAnPiF+OAst1L8IaxMqILCxkmAWxLTPugGvVVwymYN/xfBYhdYKxIcLxNpfwjqcC7qSMN5injRiL/h6vgXoeG+OCk92vmI6Pp/4+LHqpZveYeovuojXI8Kb1s8krpBNR8N+87IHVj6nvZs5nwYlmIMtB3j4wUAdDbx76YW1pP5apCDm0p3ayIDCTeqruRpojDNatV26UiKkw86e0eHqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:15 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:15 +0000
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
Subject: [PATCH v5 0/5] media: imx-jpeg: Fix some motion-jpeg decoding
Date: Fri, 18 Apr 2025 15:08:16 +0800
Message-ID: <20250418070826.141-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b4063e-5a0b-4915-d682-08dd7e47ed50
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qMIJdb6jmzSjaYzn+o38tVi+mFp5RrHeCLvmLeU3M0IRIaTujg6TNdAPV114?=
 =?us-ascii?Q?lQOzrLUamqvZrY+EL+hkEfVB2tGEkhr2956ZAKdYM2NyAzEOyKFvbAjS3Mz7?=
 =?us-ascii?Q?F5fomYiLKB3g9Svt8Mea2D7OQcA2+Fw3idCnXQdD4f9mHyaQV5oe3IUiS+sq?=
 =?us-ascii?Q?c32mqUISad6lfkohv/B6D+koei4qYpdEqIP6W7rjvc0xtip2DvcWwy61ablZ?=
 =?us-ascii?Q?iPPzbQZ2NPKXSM+6XWAUW95WET+v8udd4lD9pcTV4k5ksz0HevtWihsdkGa8?=
 =?us-ascii?Q?bRTyPbQj3N/M9J2IDLZWRJO+0beQvZwAwLAEkpDxBvQF1gKPc8KMs2anjiXe?=
 =?us-ascii?Q?37DGLXC9hvL+906F95V04gE71m8lBIdTJlI4LgWzbzWkNarZApI8/2Lsd6KU?=
 =?us-ascii?Q?alB0juHY2i2X3+tFYZzeIF+MWSjgzxyaeDupMxIYYmjxFPdLFHTU0AQPyEiK?=
 =?us-ascii?Q?0dJc3YZfigWnloOHY5iLWQf2KNFRvE2W886nvjb8y5jx5T3E+cetaKYZHM+a?=
 =?us-ascii?Q?cqZ33Ay3wI3cQKbL/sVISXcgKjmNcG5BFIcQE1wc2zeGXhoOJ6keNYMuQQWb?=
 =?us-ascii?Q?SX6qlP5pgz/tulTxVEDF6ZSJHja5nH+N8ZPKsvmt6ClhOBJTfU2h5qW5SyBt?=
 =?us-ascii?Q?XIAo7AsVUOHhJr5mLGgjHHp/E8F7797nlz4sYdtIufCgCN0YK2WIOxQ06pFt?=
 =?us-ascii?Q?nc1rzkvYFRzDpqAB7BLAI7anWDzcQElX82wFIuW+eOSpGNH3ifF79uvzDmfq?=
 =?us-ascii?Q?zYC1MY9riEshRuogRuPtKA0dY9CdzMFYL7oRZIIw2jzrTzar1wz5ZzlXBBSM?=
 =?us-ascii?Q?FEq6wBXhr7A4yPHxba6qvSqBx/nncsXupTo1Gyd/sbcqZ80kQg7gc8DnqUN/?=
 =?us-ascii?Q?AaEhocAV1uJdX73jB7Cerrebt2inSJnzHw/YS6ix+ckhNyz9aaaGFvBWBiXz?=
 =?us-ascii?Q?J/2VMF33w3MXiTgKdM/7LMbMx8T+KoLxMszozMoajku8fMOMcl5XsbZFHe2E?=
 =?us-ascii?Q?HJzG5sKIdgzHauYfteuaK4KqN+DvNa6viO14nCTx7NnwObHpc8uHov8vJ9vY?=
 =?us-ascii?Q?lqPxKvsg3muK4ImPT5INxn8ka8mZ+5Vvdv7ydlrPJ4yWQ/LgkN7ph2/nqZV1?=
 =?us-ascii?Q?dnViEmcLz4Zm1zEXgmTBBy1fpGYrTzY5lxI83cRXg9iSsmXwCKghIIfw8wN3?=
 =?us-ascii?Q?7Ou4K4QKlXPFDxvHisJQMQoxXQnUnedH7GcrVBZZ14Q6h2Qmi8yczNPU4PHZ?=
 =?us-ascii?Q?CnXxzDWh8Ffg5HV7kgK6Qk0/U3hcYlN2B89rFk+/cr5A/VQGzOui2REUgQ/8?=
 =?us-ascii?Q?4Ao8WvK1QbckLY+RZFUItWtPZzs+ALTJWy8zXG1yDSecP87I6Z+7zi+Mjyx+?=
 =?us-ascii?Q?zqVmRgLiWFracWArII6V5Fg5IUJsQuFH2M6h94mpa5sVHVcqWmQMZLMvuCq/?=
 =?us-ascii?Q?eWByHVYPzA75uqw6LYctcQQQ/yLnG24pxZDX3UJIVQVLiTI9JbgThVWaL+OD?=
 =?us-ascii?Q?nC1EqOMlVXldkto=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dyUp66SKCVT15PKWvUm3hFRxq8zoGU7ESS/0YN+8nynOGADhEpEXLoNJ7k0e?=
 =?us-ascii?Q?14SK2miqFuekbMBuOF4qxUGAgJWJVWq4T2CaSTR7JageNr8rbrkSfwiFOt1y?=
 =?us-ascii?Q?HMAwVKyxB3XqDXso6mFaho2ITJ0cBHOBzB3y/GuKgx4K1kNctBstadzB9uFe?=
 =?us-ascii?Q?33n+trnXBQ/LSusYy02dPtSCev96Pl4+Wl/pDXR78eWnP5IRmoSAArBOYi2B?=
 =?us-ascii?Q?ZXxtL1QQY/s4TVCy/oSndF5/Bfh7odSK1YuAvoLJPiYXV2SXHAUm8X9ISpOZ?=
 =?us-ascii?Q?FJ7yUZyPI+vZYXDNOBfDy6h19vpbF3tFFj8dV54LNFXNpjZfQstWe1z0wOme?=
 =?us-ascii?Q?dmYSo7mGNsfS8HqOi/Le40s4wbSoKBrt7XAHAaIaPJSlT5CKF4x0wlbXEaGL?=
 =?us-ascii?Q?yPp4GIsNJVUcz76+8roa+eMMhhXzqc0Wgo9eSAuakmid4K1vFqpA06f61eJb?=
 =?us-ascii?Q?IlyWScSt7P4ORqdSlZCVEdTvKAYUIT5X7whQDhtsQjNv3Su/E+ni6BY6vw5l?=
 =?us-ascii?Q?al3We1ZA5WlzhkCivowqChoy4TJLVZSfrxmzbiIdoouos098ku9Z/G9NiYlr?=
 =?us-ascii?Q?AWTYSIdAHq8qnFtOiCmXCER5IIpbT2jlS4lAh3w5phl1pRQXFbxuIsmNP638?=
 =?us-ascii?Q?ciu2sumXxpJMQSxAO3m3U2clIHRqNdvORe9DWv0zLUf/ceQcW/KDFntAxmCy?=
 =?us-ascii?Q?vhVcDyPxlAxae7Y3kifd+NbwciNAac5i3hed/XSly3lL/qDQEtbNXvR1UAs3?=
 =?us-ascii?Q?WWx46cI93bQpHM2ApV1uTFnEwWOxUyysaRAZn07eBZPYqnGOBOfAFUGyIf19?=
 =?us-ascii?Q?qhpHCnXnhUSZt1oKmvWhBdQR6qkhyH/5yq0SXtwbqdFWyooK1boGHiUS9N4T?=
 =?us-ascii?Q?jDTGWq868Okz2SlfFNU86ApuHx6PCwFr9QQXvGggeJhIkQLGFrsz48l0ojxg?=
 =?us-ascii?Q?jtH4aNmF5OigjwsLQ9imgVnkvsXAPJu73dp0A7SbeZRN3VUTGtuK/oHOdVre?=
 =?us-ascii?Q?G8C+DubrTZMGE/9qHnkw8wimUlTWlPggnA3Zl2Yp6Z1kbvvKkK3Lbcknd2Kz?=
 =?us-ascii?Q?n30qqTTMX8Im4F2bJGVYXJjdEOx6Sf7JYRY8gKRKHXNfpDiBDa9J6Qoenjzx?=
 =?us-ascii?Q?ZQt15/XERMctBxnlc4bemYdr+odWBeDa3lfhFcGcQkVg8AMw/jk1/C0/UDDM?=
 =?us-ascii?Q?kZhg7KzoVLnYsyP2bfjQ45bbRvHWfE7KR8VgNmMcrWjB7fV5GNFH59YugS1z?=
 =?us-ascii?Q?u0nu4engc+gTxqyjQMu55jJOvvhEfplbSjHSpT+NkyT8JL4nX3cT3AD/DD+H?=
 =?us-ascii?Q?vkkGKw5ZMLSta5ntbOe+mQatj435m8ziYVIYWQt2QVqb+zr1yzWSKj3V1ZPq?=
 =?us-ascii?Q?DipsPs2niH9SJvGk85B885C8SC8V9SRugo2EE0xmzfC0OfZUh9yGaLgDDLo6?=
 =?us-ascii?Q?vt14r5awO+17wZ3SQuK89nzxufnOK4vWYMvGUSzm3B8vOZOtPM6/c/MvMsSQ?=
 =?us-ascii?Q?RFNmcgcw01fhG8vd2eM2UIDjcnjqVy4coxOCmwmA/wCpvQPwXE4HGdr/KKb4?=
 =?us-ascii?Q?Tf+w4BSpRtSUtjshbRmlCgJlQUwJ5YCrU+8D0ESL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b4063e-5a0b-4915-d682-08dd7e47ed50
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:15.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qw/a9SHUSZU3pmloJHpUB1tm1pH1kkk+9HpVqodeVxufspV7ykbcVmbNbdy2LNEgTpRLHy1WlL76Zv2dFDvP9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Ming Qian (5):
  media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
  media: imx-jpeg: Reset slot data pointers when free data
  media: imx-jpeg: Cleanup after an allocation error
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 120 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 97 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


