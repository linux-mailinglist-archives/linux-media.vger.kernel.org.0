Return-Path: <linux-media+bounces-51082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FADD3B79B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 20:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C4E2305B1D7
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 19:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643E1285CA8;
	Mon, 19 Jan 2026 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jeI9vTYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859E225760;
	Mon, 19 Jan 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852114; cv=fail; b=UEdINK3SBrw2Z3qgduAwDYKQ+uGAX8LrjKgzhTKO6BYlgZmbig7m2fLAbPvBeFSpz8qeRCtlpRDKzY2By0+1cxCUwDdGOtnv0tjacQU+wYnEZ5Dr4QX78clbqFLcbycwdU5UBPpfYPQc+xj4bQSugg0ybGFIrFMntUHnVKJNYuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852114; c=relaxed/simple;
	bh=+l8Um4Phc0Stcqy/pXgcjiPs9iHLR1bSQwyovSguJnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Frco878PBO3Yzk/4Mmvigozi8wYF8NTjWtO6+VB4Vz6GsJbmvDEi/I2rfUTzCzsBwejxZzSNAguHbBTRh0zrDJBH2keMUEBdYPvWzx+m5yRGUb5r1rBaN6wEAAH8i0x6Rq6yd4tSOhsSZp3lWDgeLpYzo6+tTr8D1UMSI94F5Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jeI9vTYQ; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml6Aye4roxlC/oP2eNS1EqbYW5ygBJGLIz6mB7JEVl8MOtKfroXej0OW49fBKaYbPtDKAgBNFz+PeXkqKzBCBbDxGz44tDszK50i8XAaqd0WKWZHDLxUI8fufdCxXve4n3o1hwzG6DY55nCwfnhmighb+VQAwIyYwECrhJGoftvyhD50Sl4xrF5mUWZJmiUTYB8OD/Y2db6ZyOn4L4TZH5UO6JstBXU38YrHne3eQ2sKPu524h4ifLXby9opAw+7/+HxiB2ei1uhqHBH6XWkSiJfsP4u7d3dYLnZLWO9OcJi6HDPSgn3LUqHfPRxecOtDX9nNjkdBhZ10SlZKoPxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2HtxC+veEZ9mwWdOmiUySl0Lz+8mgxeeMwmAd1Iktk=;
 b=Mee0VzRcaKERiBAInBMTSP4ywClWRQiLf1pmUVFl2IDAtotN8hUR8FAXPY5eo2WYbvZxsptN2wRfq8m1757mqj5JriZeIvJD5b39UO4jlI8RUiLZfVL4msKxAaPQCUqAhZif8DyQqOikmZqZ7Y1rI5IeiBssKahTVHQfDCKpbF6hJg7nNHryVONBHWAIFdPsh5X+6z4RsCJS4XSc3DIXmdleQmwWXqVO4rcFXjg/4ekHyHQd11kIgXf9pdmT9NFKyaj3P+vrDAbtE2a52s43ZMI1Y0SKbVMKCFEFsyf3YUmF3e+I0Me/UVvoZ+Sd/vEg8mQaXaau1wvvjEcXqK2ocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2HtxC+veEZ9mwWdOmiUySl0Lz+8mgxeeMwmAd1Iktk=;
 b=jeI9vTYQQK6H5rFv37H6Zn0/8Z6LOSo5jQ+LZk6NO6L2H41i3qHYt4X4O3nKkAn8VRWKZQNtzWV3Py9DvANW+tkV6YBm0Lsxvcfopzfo0BtfDfMOXIOdUj2wTULHp9ASzG/Mc3I/wz5D1/t48oB8VN4EvJP2bum94gEqZ+LSrBqEs9U4XodxxD2ymhyRuVqIFID/EviFSfcqA5fNqftxCWyGHJGCDub0j+FieTafjKlra3klJChkiIvpJ9TogwAB2mSPYDxr0J5cqQNxuQSsMQay/VhAC/kEJVXDgElV4ROfxsX56P0a3niOotPh6GXV7sZZOE5pJUol9FNCW4C2pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by PAXPR04MB8125.eurprd04.prod.outlook.com (2603:10a6:102:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 19:48:29 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 19:48:29 +0000
Date: Mon, 19 Jan 2026 14:48:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: michael.riesch@collabora.com
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
Message-ID: <aW6KhD9UsHNUPdVl@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v7-0-42ff419f9b51@collabora.com>
 <20251114-rockchip-mipi-receiver-v7-2-42ff419f9b51@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v7-2-42ff419f9b51@collabora.com>
X-ClientProxiedBy: PH8PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::14) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|PAXPR04MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: ef964987-3e63-4b66-c8da-08de5793b815
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|19092799006|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?fkE9VkKZ2eUG7GNtVnP6+HbSuWc19mg7khva5rgt09zxg3Jb2wSfQ8BJxSxX?=
 =?us-ascii?Q?SXPMoGHlzLYRITi/XZa31OW1AwnrQrU+E+6ZcMTe/CVIPQf8g6aQiAYvvPJH?=
 =?us-ascii?Q?hbYcx4i2L4/24e/EggtKbLBZn3XOJBkZWKaMbtVO1nmj6OPwrp78AXxWXfnQ?=
 =?us-ascii?Q?4saOPZMbQ4Gf+fcfQoQilOq3ZqESYqrmV6V+XWMPNdVclpa2WKbHgC7lbnxH?=
 =?us-ascii?Q?/LVjDPNXslrcUB+l+0u7bMStJyx83IbKk/fU0mqljj9rfnD0mKysDZXlf3kS?=
 =?us-ascii?Q?GdZ7tr/cH/Vn6SPO9egjSh5nyTZaPdd522zxmIxLOq27G7ZgAjwsmoVrcG0/?=
 =?us-ascii?Q?5o+QYaRMLW4fmdGTK5Hkn66S59NIgp/bvKIfL2iTYxlE5//osSU51eglCdEt?=
 =?us-ascii?Q?nUBbXhgpinOsIU9Pen0rxca015Ny2AjI1oIxT4WOdJkFzzYtrs2spvQm3nbF?=
 =?us-ascii?Q?1gUvc9vlgePnai9BtQb72B9qY/YnYF6Ao/Pe7EgkFT9FT3yd0HsvAHBVptQS?=
 =?us-ascii?Q?H1jaTicdxum30O0jxmXe4hZJkEQOBNBAhF0tI6w4r4pYnnhQRJGNjUhriTT5?=
 =?us-ascii?Q?iHyQk1iczvZPmM7h7XMJZEkMQ8vqWgHn0OGL1WkyiBfeFbzEDjx8CELgKU6t?=
 =?us-ascii?Q?vRHUIhsA0q1no/AMwFxTayya65DysX7X5P9jJ3DdSeYX3af3vTSkda4LQlqZ?=
 =?us-ascii?Q?Gyncxmn8fO+T5YOQxYVBsmWswPyaoqervHpZCqjTa9c9V/2F29pNkTzCJhdt?=
 =?us-ascii?Q?zdTZidED61aCSKGl0lcRstyzXeaY++t2js+p/7IFfCIru4dVVomJXWvUh5Ii?=
 =?us-ascii?Q?/W2T94mq4Z4Xaoi5KjkLf8p+yHZ+u9Dq0SwHCWIJ9kDT+dzbAmlO1Sn0BeAQ?=
 =?us-ascii?Q?fUQRot7ACnzIsimXpjDM/E4g7z5mz5hdVeNYtinP4zR0GujBAUq4883uWTs3?=
 =?us-ascii?Q?5/fkj6vz/mKLh7jg5+jJ7HOIwUTdi1+F2wEhOcJA2hO1oXxXIMZad79nvN/D?=
 =?us-ascii?Q?1vGPKogveBuYuCYvOBXUibMv0hoJ5YFqFdul6wqAfF6L9qOvN7wnH4UPvR6/?=
 =?us-ascii?Q?uBDsmfMh9gJOMvGKmNR909Tp9ThP6XkghM1kgp9XCQvkVRgHm/vi0OC26BUB?=
 =?us-ascii?Q?2ZSDDriiczQ52Yo8V5bFn2oGQxRVHfKDDPSvGBhTnaSzKlSaSRlOLGKjJCFp?=
 =?us-ascii?Q?/AEtnnLkOK+PdcHKvJiu680wXObwCk2IRv6mFZit0bdW9dUqBCi5q9feeCBj?=
 =?us-ascii?Q?/vy3yA5E9a8JcuqzvHFq1qWiNK6RcGPUYCuIutn0GIMTJqIb2APO2hOSQKWa?=
 =?us-ascii?Q?UcMFMn4UnuV3GZ5HVZP10EVi+kf60RfMVJ+eggvMu1QDVRwK5RLUdpEIB3gw?=
 =?us-ascii?Q?XXPo7GSvZlpEZwfkjqxgbO6TAdg17pRW4+VowQpcAJLKHJAcYRHMnmluocAV?=
 =?us-ascii?Q?0uRiNopzzAIvex2uKSFtnrR3NX589wGkKh0Rpbt/d+I5DHHUB4Y7r9uaAdEZ?=
 =?us-ascii?Q?iO1oW7Sm/bUp1Ikp8jRjqaqBbivY2rma1HwGJFcyA9T8WvvQVOyvGRMnW4Fr?=
 =?us-ascii?Q?Asfk0L3NenI9vT7Ok4xajrcYWCrflM1rGABAvHbC1yRwxZZ2Gn8I7BKJcJPh?=
 =?us-ascii?Q?0vHtZv5FwfRi0wg5w5hrl6M=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?B5iaRiyCiRs+wpb0EGnUVhBZvho9kpd5on8fA98USQbsYmoOoT94zO+ozCqu?=
 =?us-ascii?Q?csU90ZTNI59VSSgLFh5d3rbsnOyJRzQ/rinFmYF8qggUlKwBCPZiyyU4dX83?=
 =?us-ascii?Q?5NPTVChnIH0uAm7e4bFffWpKkx7MoIzlc7+hVZjiOFJzq0xfv7APl9I8Tk8+?=
 =?us-ascii?Q?HXBLDE72misKzmmdb1vtgRrCH5WaAn8JYQbsbN4bPe/HZyLwwD/GLBZSLDdV?=
 =?us-ascii?Q?QiQP/Pv8oODmmqrMVh0ReIsvITbSxQBWsbyValj51H2smW6ssRbmKVvCfjvJ?=
 =?us-ascii?Q?DHmh3ffhXrD9hS+S81yz/tnk6qLioX58FmSrpYhSmU0Syvy3wt6AoHEaFkIS?=
 =?us-ascii?Q?AF7lUDKk0V+5OAIPTGKz+XDVEcRamvFH2K1kPTtPyhyyevwahXXuzfdDJsoh?=
 =?us-ascii?Q?L/ynnh3BKhOR1ZelWImhUsMP8LGIuPxzXhUhFJ7AhkRyOzXCtpKIDlI0uyzc?=
 =?us-ascii?Q?+VNopYu1P/1DB5kfhIt9D+ht6x/KdzhIdEiiAp6TqAHzGjC0HOKa3r3bpej/?=
 =?us-ascii?Q?m1I2HD3qFPcoY/74a34SWZ/7971fwt8I9f2gzFLJr1dQsDLmDLiYFwjMNb+0?=
 =?us-ascii?Q?OXTLcVf7gMiqUGGtJrLauBYD8r9TkRbxn5AbNdo4Uh6a//D2BfNNrcB3stwd?=
 =?us-ascii?Q?QmoemjIdchOdr+8LBdC9kYSC4K9GHhe3ZxHm3iwa4ks4efQc0oDCaiS5Xc6a?=
 =?us-ascii?Q?e62yqkKP8Cj8hlsLvKGsYy3HwFrO6Hj9KkEvrjCoxA7tgsUsBVVe+AF6/If1?=
 =?us-ascii?Q?kjV+7YReVPA041ShJFZncKUWTTBRUBthTLi7XKzIb2PjzbYpacpP5fl6vmPH?=
 =?us-ascii?Q?HyjVZSElWbrGZ9a7CSYJXyvBiVgw+4uWoVCpXu91xjMZFdWuYQTdb2UFvoLA?=
 =?us-ascii?Q?liSM+XoMFjVRasWGVHbPN96XKNYMQK8EENxtw17HTuwMa29r9u50a4ELg+R8?=
 =?us-ascii?Q?dycqw3KLoKvR4kMMTqfuSkqCIQakBOCnKg4wwxKbii43pO6ecTpyCesEkXoS?=
 =?us-ascii?Q?FX6Fi7k4mejjIkumTM4jrIC0n3MgPfhQAgT06CaGYlfBgXUQRYZYgEfKZsu8?=
 =?us-ascii?Q?k8HBazCZArCZatF9MqtcqkY6Y0j9pCHnEKwy/mNyHlKf8qRF3Mt714XSMYLo?=
 =?us-ascii?Q?TBmmdYfP8oQhagelb0cGRqpQlNzXJ8XZFr17xAsgSp3oeCB0xx67dIrYY2LK?=
 =?us-ascii?Q?wDgQDPzZGudKCKJOY2stDW6rSKrXN1q/qIgc4fBphRmakRzg5IojA88KAxVY?=
 =?us-ascii?Q?V861fwXD9tvDRX2vg0tYqqRiZHLkg6L43RzvDEs+YE/A4lb5Cl2mUwWYN/gY?=
 =?us-ascii?Q?sZWI4iQXpI/XmKO7hUiJMf7afo0nmzF4N7YsLJmf07vtwYKfOCvgCtre63oI?=
 =?us-ascii?Q?G5jAhoSjm2ChR+MEcQxTWBwSH/j+D8K0xClzPhQjzIuqtM9krUOmecZ4MbY7?=
 =?us-ascii?Q?nxjpJLX+f8DX4Kk/L2z+A9BRUlp0VODhel1PEIqL+9LviP8TSPmohl0KD8wa?=
 =?us-ascii?Q?oDHfoLo00xv9sThj71ehYN/xajChdRSL6WQqsuzicvH/tQiufWAq9nP7zCwW?=
 =?us-ascii?Q?0QpFf93O3kITNxP2ctgvjjz6JKyMnJSZhntX0KRTPmHviRgt6veCh/VbYESX?=
 =?us-ascii?Q?G4RLWJS4l7E+nb4s9yGqANc5ZfuYk52S4hj6SVmsW2GSFmY8Gp1+jD7bDnGI?=
 =?us-ascii?Q?SLZ+rXWfRc3co440vCUebq+EsYISO9JaWUQSbwiPS0/nse0qZhqoHWYcyRdP?=
 =?us-ascii?Q?D79XYpadTw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef964987-3e63-4b66-c8da-08de5793b815
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:48:29.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxlBXo65+mGXw0kcjZoK9g7wEjAk7nVQ0MxMpma4EZZiPQd1fy7b4WWMadPrbyBr700U+zKJeC1ZbcTmWcnykw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8125

On Mon, Jan 19, 2026 at 11:43:36AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> one input port and one output port. It receives the data with the
> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>
> Add a V4L2 subdevice driver for this unit.
>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
...
> +
> +static int dw_mipi_csi2rx_register_notifier(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
> +	struct v4l2_async_notifier *ntf = &csi2->notifier;
> +	struct v4l2_async_connection *asd;
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev *sd = &csi2->sd;
> +	struct device *dev = csi2->dev;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);

cleanup.h prefer set value at declear.
	struct fwnode_handle *ep __free(fwnode_handle) =
		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);

Krzysztof Kozlowski did many work to cleanup pattern '__free(*) = NULL',
ref https://lore.kernel.org/all/20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com/

> +	if (!ep)
> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
> +
> +	vep.bus_type = V4L2_MBUS_UNKNOWN;
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
> +
...
> +
> +static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_mipi_csi2rx_device *csi2;
> +	int ret;
> +
> +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
> +	if (!csi2)
> +		return -ENOMEM;
> +	csi2->dev = dev;
> +	dev_set_drvdata(dev, csi2);
> +
> +	csi2->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi2->base_addr))
> +		return PTR_ERR(csi2->base_addr);
> +
> +	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
> +	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> +	csi2->clks_num = ret;
> +
> +	csi2->phy = devm_phy_get(dev, NULL);
> +	if (IS_ERR(csi2->phy))
> +		return dev_err_probe(dev, PTR_ERR(csi2->phy),
> +				     "failed to get MIPI CSI-2 PHY\n");
> +
> +	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(csi2->reset))
> +		return dev_err_probe(dev, PTR_ERR(csi2->reset),
> +				     "failed to get reset\n");
> +
> +	csi2->formats = formats;
> +	csi2->formats_num = ARRAY_SIZE(formats);
> +
> +	devm_pm_runtime_enable(dev);

Need check return value

> +
> +	ret = phy_init(csi2->phy);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to initialize MIPI CSI-2 PHY\n");
> +
> +	ret = dw_mipi_csi2rx_register(csi2);
> +	if (ret)
> +		goto err_phy_exit;
> +
> +	return 0;
> +
> +err_phy_exit:
> +	phy_exit(csi2->phy);
> +
> +	return ret;
> +}
> +
...
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2rx_pm_ops,
> +				 dw_mipi_csi2rx_runtime_suspend,
> +				 dw_mipi_csi2rx_runtime_resume, NULL);
> +
> +static struct platform_driver dw_mipi_csi2rx_drv = {
> +	.driver = {
> +		.name = "dw-mipi-csi2rx",
> +		.of_match_table = dw_mipi_csi2rx_of_match,
> +		.pm = &dw_mipi_csi2rx_pm_ops,

still prefer add pm_ptr() to avoid some static scan tool report problem,
or some contributor send out small patches, which just add pm_ptr()

Frank

> +	},
> +	.probe = dw_mipi_csi2rx_probe,
> +	.remove = dw_mipi_csi2rx_remove,
> +};
> +module_platform_driver(dw_mipi_csi2rx_drv);
> +
> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.39.5
>
>

