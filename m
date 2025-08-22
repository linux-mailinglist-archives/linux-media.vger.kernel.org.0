Return-Path: <linux-media+bounces-40772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D52B31AFA
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96C22B682B8
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598B6305E33;
	Fri, 22 Aug 2025 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B7IkArN8"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4082D97BB;
	Fri, 22 Aug 2025 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872028; cv=fail; b=m5yRfNFzj/8M7izDXfCXpil6bvcy34jPPJ1jSSI8QilM1gGXISECO4iMAcWl+4Wf1x13bSgD1skeuIIb8NIwXx0G3As1rskJQiUUXWzIvHIv1esaQfbQyQouj5E7xhAxvhHXQrQAAOrbZEgN5wWQSCc4XZ0fpepXcXFv89mbVoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872028; c=relaxed/simple;
	bh=aYZE9gKrKs1Sqhou7cCTEGmqYbgZHmQb8sHdqpxP7/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rEZHJz+cObT3jFMS/EWarfSP++5SNWcEFJWXwAblhw8FPyAFCEQ61gEG8E7fiSACPzAV06B5m1zW1yWeNJ5qHDc3ty1n4WmVjuzZ2Fr1MR9kBWNQymSSNcwSgMrlkcUPbq40IIYrob275yB4SmyNlL1O8Ynf1fjttz+XJJJGsSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B7IkArN8; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S86JWxO0VYfTKLFsTBWeb7lEsomBW0TqvUrXs5IqCT3QTy1FDg/H6evPAtnNzL6xIsB09TaRyf1JpDG1hXQZfFrrv8EJnPpHXvvqO8ysM6mFP3sXmIdlgCIF2Oj1Wg1JSUU34Mx1gbhecO3wNlqbEtk+3RQlx5o2p5kqitSN/GT91BjnvincFvUXJGg0mYkZmB4y2Td5zRkMeo/xmel65rbMMWmpoYZw1pm2CXXz/3pGZB2w9PbXjIfq8Dh9dkHKnA/nCj1mwnMIcYc7QgbxWaNmBVczamZk9FVDSaBFQ86kqcVlvoBQqEJvg4Vy/fdQjVKPKr7lA3K1IKlfHRS6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh5Ztii3ALj027CEaw9F+IIDMJBha3hYvvYOGuItS1Q=;
 b=vuDKoox5pEcN0mvSgTm1oG1T1nb1/8YGQOZoXpMsCO76pd0wMX51y/JMcN2EtS7TwK4oXWXBfJCTbsC/bXbK8j09hU5q9k72Z6MQ8eue8kGOJdLvfqQ6TEIwLCxqE840k9rE9U28b2ktfmKkxpxQFssy20aIvzK0WH24zMzqr+OMl4T00oIIFWi18R+e4x13uVcutXnsutLCfoiMborAtRnLF54AGp9nRD0R2XS0+VNBZwygXP5LrANShuhPvjJssHZDtj32fWJytWiSPlMJGkHJsuHAjUb/AWed1C0aO02YzY/QjkmaZX8Lal3z6nukZyFTV3/MtDcf7KcoWqaOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh5Ztii3ALj027CEaw9F+IIDMJBha3hYvvYOGuItS1Q=;
 b=B7IkArN8eBLkNqCWUID+MIFy94WyUu+hsMhRBWTLELNEC+QyKS1K2E1av879Sxqykb+JFLKih/kWBRTm/mkxulJauzBDNbcfThKZ+jk01PSnYdW+kYS1/XR97UyjfbkfAYJRjR0isIZ9bS/iBIL3kfM1xO8VmPHvLt616Tk9+Csya/k5xHjb9h+Qw56J9MLR99V2DsFMh95CfvXHN4FRFJrNjZS8L1/GkffbJh94ai70b0Syu1sXdKgc/9dM5l93ibCBuRQKCKTnEMEJSgXZIuKEWxwIaHXwV5xK3BBcYxtB0qi9FgyQwBgo18auLUIS0Uy6roE/D3Z3knsAIiQCag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB7682.eurprd04.prod.outlook.com (2603:10a6:20b:2db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 14:13:43 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:13:43 +0000
Date: Fri, 22 Aug 2025 10:13:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 06/13] media: imx-mipi-csis: Use GENMASK for all
 register field masks
Message-ID: <aKh7DmnEB2KChVol@lizhi-Precision-Tower-5810>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: eda22f30-d536-4ecc-d7d7-08dde18619ba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BUoburOnw+/1bDnPiA3xgIrMG1YQfa2dLB0cZO5yccRiOVdSg2Aypnp86jmQ?=
 =?us-ascii?Q?BLkdxOfEbW/3mjvPIehLuGw2KO0iAmIRXRn0OYAz5OLk1CyTQtSz8jWwpkWi?=
 =?us-ascii?Q?LLTOJL8WgbKeAaC60kTogEpMhkCQXZsXnrnD+QyStGnfuJhxXWiRiu0KMVDO?=
 =?us-ascii?Q?QVvW9Y2XRtyuYg7OZx0To85cWRKlgAz2cWdZW6kNiHhsUn37WbAltumCSKny?=
 =?us-ascii?Q?jcHGKGD0nD32BZICtszK/QTkKmu+A+3SnD/tPEdK9h6ztmAxldiLtMgGcwtc?=
 =?us-ascii?Q?XOkEIRk/TJW5qehOkX55JdbLZ131qeAkxyOpqwt4V+IUj26o15a5iVOZSNVT?=
 =?us-ascii?Q?VLJYPTaIv9GjCaAphMVQ4HArA2DlMeaFGcs5QcptdOHJZzK2s7ewZWL6cRZ1?=
 =?us-ascii?Q?Zu6o03tg0mDFQELR3x738demYLV4bfaR6pKVpoi7LiqyaUY8/0oe0S38NoEj?=
 =?us-ascii?Q?j64Z4STKc0DXnyC2PoM6ik4PswSXhRWM6VJxb5iuvgaBMrx8Rmm6IHlKxULD?=
 =?us-ascii?Q?DW1w0G+i7x3okM5rLaNXXIFnZYghnVmIp5/Uw1xjRHMjhpNsBmHt4LTEPXcf?=
 =?us-ascii?Q?ccO2GhQ/ljyK7YOLfhAz4z0ZnmVsgCNz5c8bzvB19LBs9pu5q3eDYOr46vz4?=
 =?us-ascii?Q?3L6cCAdIBQB6fsjiujk0eQxW7lVaZyQSJ/MsYa/7dL9tapn0urkKg1QTjq5O?=
 =?us-ascii?Q?fBvQpeq4YmFkHQsGdSnKTWzJnGlxVYtkuocSeUvVWdsh+C3ixcjXD2GB4xmB?=
 =?us-ascii?Q?8NlaxztTlsgxuhTFJRbRzGV1cGeX9+S2W59+qLfZ7C1yuJs8nz+GdutIcCuq?=
 =?us-ascii?Q?jTsj4u4fUHY46nLXPEaYiMsPDy+sScwHOLMkaM0GpKo61ywgUMylDpqiiLP9?=
 =?us-ascii?Q?hDtsGTNtMjo73i2hFC2Sk3QwT53wGzwZn8kSAKKBBQQY1wZxzGCpD06q3JIG?=
 =?us-ascii?Q?qafYwX0UJq3ClrNjfKOVeqdL3ZzKdJGpOTRw82DI/X1qW8nQHzTBOPDyIVYl?=
 =?us-ascii?Q?+4q5hlPH5o117AIT2Bf1H6A2eDGq1yz+vbcBTcTan+EFw4xjAu33XftucQMo?=
 =?us-ascii?Q?TytdoKV1wnaJcvvGr41r81c0B2Zqmtc6YaUXefmtBCUuG2PgI+BjJrCrq2SU?=
 =?us-ascii?Q?6IGiOOLASEmLFfepCBO6ybCMYZKgozNZsB03V3x+j65DyWqRF5axEXihGskd?=
 =?us-ascii?Q?0jbqTPpXbCoFkbGtzE+hPCoZ54B6D2wg0ODnDnDms0YQUrsZ710Rh4gxpckO?=
 =?us-ascii?Q?A4wHLqk8KmkMJFZRXQM0m+WfF9uzwHGrK9Z6uWVhDQyZwoF+UC05+H+wRxsI?=
 =?us-ascii?Q?7wJOk6t2npgNfhEWvy6Pg/dNE85vjYelU0XmIHdnKuNgVoXNA7KE7HdYbRYw?=
 =?us-ascii?Q?KcjfJguxzN6XBlZlGuYd1US+hYa2yhoB976z2JtD9bhbn1vrZl9brfcs9IXT?=
 =?us-ascii?Q?q+7/9CbrioE8eKaDXKxNxSqQ18qc02jmVGubsMfTSMdorftZAzdLVA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bqXFvkJ98N9PelTR7tNt56lWxSLP+YY62V/fiAWIOiWjZJTUFjy7eWzrNlzb?=
 =?us-ascii?Q?Ep3rOMj8K1teJ9eTAqMRbQCPh1tXxfz6k9DUYe7+goThcj5+FXl5+ADMPUC1?=
 =?us-ascii?Q?LBw/+8y02gRm+OzWzoEe6ltNrkdbm36jUwQAVS3m2IlME3Fb2glKASYTIXWk?=
 =?us-ascii?Q?vSDWYE6UVrs4tmly0cG1svWMDvwA0Gx0Ik+g47sSXv3iam+xu9k/gFmUrT35?=
 =?us-ascii?Q?vmb6/c+ybciYKwUmJJszNeTjJ5IMUTJ3MrS2oD9y2KWBZD6mBQuyVcialAkx?=
 =?us-ascii?Q?EDeYqC8AqrZHoD7k0tI9AwKlkS1y474YRNRT1LjBCkORhdogZ9w23w1VFNTO?=
 =?us-ascii?Q?WpeDpUY/Mfhj548PQvxl8uQUrshuVDBfy1AMNaCx4LNvr/tZcf2PhBtd4gY7?=
 =?us-ascii?Q?+Xp6cmAou/vTrByeDSkS9XBA7I3jRqwyC+45F6fw8htM4UoWZFXSglQKJVUQ?=
 =?us-ascii?Q?r4Zyppxyn5yTn8Qs06Z/WCnLvEINewyLrCh1Zsn8zKViQJzEWVmCKUdxGs5w?=
 =?us-ascii?Q?HvZ4pFyZ4UK5grdn3Q5+2vhe8o8oNLMrmQZN6YSk6EiCCPXMq40tws/y2HJ1?=
 =?us-ascii?Q?Rwgk5EXva5sa7d/6rvBXxRRNoWNzVvl9YOnkBGJwWx6CPoNTe/LmSJVOc4hi?=
 =?us-ascii?Q?I/b7ZYOuS3vS3yZzz7M7FdbGteRvNCPQjgExr9/AZkueQFflAmHmZtm7GGom?=
 =?us-ascii?Q?AYE/Vx3Eq4MUQhMgOyZQtzRs/DHgstLS7ZdmbAzqJbCZWdSi762MfbgvNYZt?=
 =?us-ascii?Q?qstiCH1hSWqPkQkeQjysNlFAd96W98/CpZhKtKab0glyJ+oxxHtKhSUENOHz?=
 =?us-ascii?Q?Ea6KD/URB1POTczKrdaNWrilt0l/GOa0CVr80wh25ZGxkByPJiRQ8PbSk+UP?=
 =?us-ascii?Q?GTB6mwTb0cqyXv56C4wXB0tC7tptJ41FEgsKxUsgqItAYD3hVht/NN+72DYA?=
 =?us-ascii?Q?tEQlxJFsl4AWtK7ybYuWFsBSJM9m6IDWMi8uMvUJpZf4m0XaCOkubVPTtcPY?=
 =?us-ascii?Q?mpGxy+RpgKj9z56aq7THQryJD4c0vOcuXzy2UAp6xv2N7fUBn2/s38YXg+ob?=
 =?us-ascii?Q?ECyLJtgSnJcJysynHvuBZYCEXPzxEXAtCK31BXAi9tZ2DdVU5AhrPmAnttRX?=
 =?us-ascii?Q?pTFYYSC1SaEkdTxCWeVzYMQJwyfSLHeU8zeOaH1dq5mzgHLmF3lMdFHeDOOJ?=
 =?us-ascii?Q?/euj/Sy/Nxe/c3J93Nh0jzfKno+0kRvzC/7yAJhffBbyp1gZD8OOcwN8b4qT?=
 =?us-ascii?Q?2iKhQ6LclGlQDrhcBaK64lBovO2lrfvOz+Uz1mSD91tF7tDEu5xrlCTDu0xj?=
 =?us-ascii?Q?E3xfh5QgymDUQthUs8g6xUF3dFpyS2L8OEmdeZMNxn8W1VrDcy7hUTnze+Tj?=
 =?us-ascii?Q?J0dKIN+EaN0FqnF0glF65PmHqGX+qhe/2ZEcLBNFnSauIleQBHXoALQQaLqR?=
 =?us-ascii?Q?LjJTgOyz5YFVkUD6AHY1XLiChJ4RyUqPKbi+lZ64rPwQrNrETEAkPdEeNhNP?=
 =?us-ascii?Q?XFUxCXRoUmNFwf+0jSjZgaM8QX6eYvEYtJ3FMxrrq/sKSB+dYF6BIlq65Lea?=
 =?us-ascii?Q?QsYQKQVO23k+F3CoL/kXTbyalgOhlzO8yVW6GbuE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda22f30-d536-4ecc-d7d7-08dde18619ba
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:13:43.1606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMgpk6OMTd1waqofANjkDgpT1OFqAP8pjBy+YJWYkiPUN8bmXAfwlvY9zq2lkSLajbM6M9F735xHEZQLtUbh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7682

On Fri, Aug 22, 2025 at 03:27:26AM +0300, Laurent Pinchart wrote:
> Multiple register field mask macros use GENMASK, while other define the
> mask value manually. Standardize on GENMASK everywhere, as well as on
> the _MASK suffix to name the macros. This improves consistency and helps
> with readability.
>
> No functional change is intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index ce889c436cb1..50f6f4468f7b 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -57,7 +57,7 @@

...
>
>  /* ISP Image Resolution register */
>  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> @@ -655,7 +655,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
>  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
>  	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> -	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
> +	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;

nit: if need create new verison, I suggest add "change MSK to MASK"
informaiton at commit message.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
>
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,
> --
> Regards,
>
> Laurent Pinchart
>

