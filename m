Return-Path: <linux-media+bounces-65766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bBq0Il2uPmqyKAkAu9opvQ
	(envelope-from <linux-media+bounces-65766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:52:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E212C6CF469
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:52:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=FXCb4lu4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65766-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65766-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E791D305B582
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EDE3FF1A4;
	Fri, 26 Jun 2026 16:48:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FFA3FDC0E;
	Fri, 26 Jun 2026 16:48:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492487; cv=fail; b=FmqoiMXxsDvj+ot79EG5ACk1v1NKL4BWxaYXCdH/HPhWsK3ZB/MADWO+b8KFRYIFYJdNdxTLExZ3NxJukS4zTD3pJneCaVYfOMEeCjXFEwj5VLTkCitG/qxhvvpFTllEBq32kYQTi9eL49VY0W/mJ0+CPgu4SwVflUsQrOTxgwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492487; c=relaxed/simple;
	bh=g5zC60jbCOWat3wxMgWkpMFifynT7s4QeX++J54Yojc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gZ3jR4otatO6/r5HXuNUl4oy/aa591IYB9sSNIN4EefWrNg6GfiY5Cw70ZSVGmwDMadq6XSyUHHlXq/n9FKJ1QR9UV9/eVDT9pLoqLT/5wHLmDjC6CRTo3IcNXY+i6ZgzJdMHkRa6BNvOwgTWPxRjL3prX8xyqpgktLh81CoYY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FXCb4lu4; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep0mRc0XuzwjrBkwBzlwbEZugeXUP53bUtuw6644DRlKFq8OSSa/0HU9r+ABbepiS05ejtPp4OlzMGIwKI5xLb1K+o1qIJuBsr03RRg1IQVZ7VyAnOmGguByLHjkN5tzucsXctoFXHkHRoUCfQQvQJXvf57rgSIUqzpoKtGPLYqux2hFzTqJafNir7f70IFjYEUjfRaNeSDsGV5gZkTMyPixmOqYM/0O0ZUUnUhl8v+8m2WJsEjEPKuCfJigiE6UBJvkITMDEzjykHyn8AFB9/OtrAkxQ/CXEVqjAAUPnil3uuyL1HujN04zOOb9XyFr4pz7EzqC2jd/R8bnZ1AWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Kv0HID05uD+/9pA+QYi69vKrN+E0P3YTeVMde3kEs=;
 b=kKSU95+Fp4m6IegCOvjNj/ZMPTboBanP2d/+k41M5gAaSYZYFRc3AgB0d3JsDLUtgWpxo/imq2vWOLvQt0XZOYWsQ7iGc1P1z81F1UXLn+g1Eqp2dM8HID4l60uNT3LSWVn+QJ6GMolO1ZGUR7cQbveCjlk9eNR7LLvWDmcPukCD6ojE6wpccRSHGyZQHkS4bteOWWYbjI8rTyAA/VcG7CGvrOjn8fKt/vHttk3TCvjEKsqw+600fO57fLTiOvAkcA85QjQEQUyOeDpXSHwcIaPcNT3iK4IqAXDdd1Mgyz+0m1MwGqVjLBgJg6TnvfIeSH+MZkphrKiUHMxiuYym5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Kv0HID05uD+/9pA+QYi69vKrN+E0P3YTeVMde3kEs=;
 b=FXCb4lu40xhdjwfYRzzsCW1vJyCowpVpQ6bXoBdbOS0MBJXC2WtDyaNMh/OlEL38ADvCa5aWriCWBnGtIEWHUdw+YetIiBQ2/kcha/P0PhZI0rR/D3Tmu6osQnbxsH4wPYrAu1/BsEWxfS1HZ9FTis4h1a4sLu/meNChFlHyvfuwfr64A6RRnyKjfOnLHQcjEhog3HT0Sht1tmrsN4uevWQu2XWPlmMkEn9Jo2iFWgGjRzLW38PKjRo2mqgqsWWqw19TWN3XnmqYFMGLxFgdcFjinDilaP6UW/Z5LpiwYODEzzI7VHvdSCiTbn7lfggpybbevlfu2A2tZuWVQbN4eg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12099.eurprd04.prod.outlook.com (2603:10a6:20b:747::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 16:48:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 16:48:01 +0000
Date: Fri, 26 Jun 2026 11:47:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/8] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
Message-ID: <aj6tMpDies9QEc4a@SMW015318>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
X-ClientProxiedBy: PH8P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12099:EE_
X-MS-Office365-Filtering-Correlation-Id: c54bbe96-7484-4990-cf95-08ded3a2af48
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|19092799006|23010399003|22082099003|18002099003|20046099003|56012099006|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
 ALSPGvUStmf+oc4/z7nIzNXbtfElUHxCpfCVOdgnST+VqNP4ElXSu+GoAInU0pbKtXlbNIOGb2+Lz2R5GZPvWGsWrENSL88+ZP5GWGuIjvSPhMgBe1Sp6w2y68VpJirTYqyyc4tA4qBoFH/K0WGPtAWAm0ODwnHq1QBw6tNSIu51NeinFO+HSbuoDInI7wDb2Ca+/Qtq+0BvsACsk0MuowTGPMHfr7fBZ6m3fC6DV+ZC4UxgRfM+uNo6KzJaNUuwxiLFBs2dQMyRDYD+x7gG+hs+S4W/rE6zfirdCGp5ZVKrs4Uzlv3Fu38JXdEEP261cvfZMJfJjCZcQFpvj7NgRSQrvuN7iV/tWftlRZNgvU6PyJubXJCJhwlHPAQWcE9ICqFEgDwjzRlh4thB/ZfZj6dJRpGoacSnmt6ISNk+6G6epZOuEn64ZOQncnaRCTiQizewwsdsl2dHGXyE9e4zSkkPCPtH93+/6kU/R1mVNWxlMUbQGRxrtPdzFVe2RCzfcPv2khkHiPAr8XrshjQhgul9oRvbSlU0ksyeXpZDx7T1Vqio2G3vyfy76pJQ41g5wX3lKzoFZJWr6qgo1RFnpM7RXYXYtPxqqkkMASv2Ez0lp8ZxmKydFeLbadvbMLYGDKCmHeteqZQjtEXLEE1TFy/XjlEKzGu+sGx5KKLJdYA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(19092799006)(23010399003)(22082099003)(18002099003)(20046099003)(56012099006)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0Wn+G5ni6AY6rUCI9a4oUIzPU9yC91debal6rSQmwjJLA1kvSWIVihuAsn7u?=
 =?us-ascii?Q?m1qWFiOB5EV+guArKySCOJ+nR8JJeuFY1MMLrLkMnsQjtxC0IZcr8TVQ67q4?=
 =?us-ascii?Q?ReQyDRpYuWCnWhi/uHgC4UUEBD39Z17sdpEQnnmS+/HWdtvlXrMlHm4G4qVm?=
 =?us-ascii?Q?eSzokzJYp9f8UnfxdlcyLo8sZuh1FqPW72EvwTOaPOB/0CmkVnxmSrL0bi6T?=
 =?us-ascii?Q?oYwJo8aUy7Dj6fqvikZDygEYxrEudPa8YpVkL48+1PnNnW6EQOXba+fhjbbh?=
 =?us-ascii?Q?9EI9SA94tFORdCjyRUQZF845dPf8R+ZWd31ORitmmTK7b271UQW8uVJstKA0?=
 =?us-ascii?Q?+62c/qu8wpE3EsZK/qNkEYb6C4L8iVT5+uuG8ZB8F+edE/CEw+3b0VefrhHA?=
 =?us-ascii?Q?S0bBiFowPqVkwMzhBWQ8DkKQzzNQktyS2M+Rrh9YTVfl1ap/XlaaQpejObVn?=
 =?us-ascii?Q?qqMJy0cRzrvAobt6CDPiynVXaC5WRV9fuJNtmRn00MwUFJvivuSKN2fpC5gm?=
 =?us-ascii?Q?xNPB8MBWtcuCdjPe2LvBZqLRfXdMSU8bLaUNQ37I/BNWP6F2EUNEzELRYgPD?=
 =?us-ascii?Q?qzPyCo6DzmMGonR1RkOkut1iiICyIEBi+sGssADq1CFMfrnPktamcLAUQS5l?=
 =?us-ascii?Q?FgcvUwCRz9BHtW1jlgmhcfN0U5AGrK83H3RhSwx3XDsS0aE/htQvZVXQt1At?=
 =?us-ascii?Q?tdY66Rsrt6dAvVOV2MgPcBVtVj4ue3ESCHUOHtQ4j2mrUX7og2qSHuTKD6LA?=
 =?us-ascii?Q?5XVLrk0pMLlPPFccKG5hN8q/XsErWMoUn6PMd28FBHkRb0D+KPXkrAoLYp+9?=
 =?us-ascii?Q?07Xi49n8HJKi5dHyJp54b+tM99KykUMP2Na+WVWoJILWjUx9St9ZXrBLhW7R?=
 =?us-ascii?Q?E+s++LytbCn2ZnXQywvWN4IheRvPVvB3Qz0z1ixhHJ5JGs+l864qMCQ+w3rL?=
 =?us-ascii?Q?PeJ3HytKaDsyu0F1l1WjX2LJiPxwEiRW+mw5Lu2jO0iAsiUusAMso8VnM0U5?=
 =?us-ascii?Q?hJlpWEb4EE+zXIwN3ej+ge0AJOIw/9C8twIMtCvFNBezMj6Km0SLli0vq20x?=
 =?us-ascii?Q?DVTr4S92LtpzA1lkDJXh+7rj+rD+YCaZ34SmtLtG9So5IERiTmDa1qVW84oK?=
 =?us-ascii?Q?fS8p2FMFYPFWP1RM3S0/R3yCtAwlXNnKsAEjGIZbAiU5F43qnOzSbUf1QwmP?=
 =?us-ascii?Q?r62f8oV5CKHs9uU+vEP4AzuomXaYH5AIKqc7sk6Am+9PNFNZRAMZzuCL/eUn?=
 =?us-ascii?Q?cYh1BltrSR2lx3xaQpiohTeiEUkLLe6gXKynFwzSgI5rwMQYmcC03OzEMYHJ?=
 =?us-ascii?Q?5gioj1QJqLQ//3NwkFKaCQZ2/DXHGJuMS/QG2R8TptJVZXzZh0BAPgJSsXuD?=
 =?us-ascii?Q?clgYxOfWt+x8/I8FEc+qSlHtH71sJ3cm+33xKpYDB5zmskZuznWnH0TG+YL+?=
 =?us-ascii?Q?2QUCgQCiz1GxFEN/RNz93h/4cW4lY93gVIolcZ9gwxr6YmdgsJNSDHDMnOS0?=
 =?us-ascii?Q?dDewnwQYC57ZixdUYxC93JoyC8oKxmwbQB7F+r53Ah9uLsshdMzh6PUrKwK7?=
 =?us-ascii?Q?gAcvFNW7q1McR7Qvg2LLZ5pB04hWQnTH3zV8FMzv1p27A4aHoi0XaOrV6TUO?=
 =?us-ascii?Q?jnbAjDl2zYXHs7m23oa+n6o0D6w1w5pJ0JilvJUBOv2zaXVk5Y1jY/yNRa9t?=
 =?us-ascii?Q?ZBw6fIaaGoK3ZOtS+07+XnJD7HisjSQ+3Fy6cbsHnuoSlZ+We7m27sBRxyBj?=
 =?us-ascii?Q?OfFS6DboWRQow27lcwBJgYSM3bvEM27p856go4Ui1xVymJh+uPLN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54bbe96-7484-4990-cf95-08ded3a2af48
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:48:01.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCJsl/YghF+Rh/6kwiyE9F8pd1m2SPO8iN7TRboVfr9GpX8bN4NSMMfTTWl9fTywp35NhO61WiZFGMXDGt48iTwLcgwchH4ukbxi1U2EEluBnrBS0tw22z2VIPWQdf9F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65766-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de,vger.kernel.org,ew.tq-group.com,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,nxp.com:email,vger.kernel.org:from_smtp,SMW015318:mid,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E212C6CF469

On Fri, Jun 26, 2026 at 01:07:54PM +0100, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>        The orientation of a device (typically an image sensor or a flash LED)
>        describing its mounting position relative to the usage orientation of the
>        system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>        - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>          # defined as the opposite side of the front facing one.
>        - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>        - 2
>
>  additionalProperties: true
>
> --
> 2.52.0
>
>

