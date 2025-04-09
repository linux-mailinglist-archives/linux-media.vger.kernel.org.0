Return-Path: <linux-media+bounces-29813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656CA83406
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5532A16721F
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF54021ABD7;
	Wed,  9 Apr 2025 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A0USBPGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE0715855E;
	Wed,  9 Apr 2025 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744237147; cv=fail; b=ZidATpYiybcPvZip841ZczIHTOkmzy2H9/RFjnPrBqkBagavglbPbtuJc+FkFGOv+92NlV4xnsIoQqgTgG8t5y0BsYTlYSO7ghrF9SqXb3I+e0IdCuCuhOwCpIIE1F3VsuZZMFnJpXTX7brn3hgr/29W/nwWjSGVSCDwnC46nyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744237147; c=relaxed/simple;
	bh=rVDkSYbwL/jeA9uy2xrvTlP5Ycr41/SlMPREm3uJiKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Iee8t4T/pPL+n9YNouPZolMLhMOCU8Zi+jDQvB4H8Qy8xpM8l90NxEGzvJ/8G0qx2bf+HTGAJDSCRgLocZKdJuSezV6Dumo+PcImsUSUS+1nOQr4DVGU76ihg+gknaLnmXr5J/YlPTNtrHSYdxlVV9vT0uQe153aeVxpsTCkgVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A0USBPGQ; arc=fail smtp.client-ip=40.107.20.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoPtBOW+03UtBGCzX/gB2pX+v7TLohBqIbHYLMYTdIWX6h5LeQIVtKbLf7bbnrBlcdvGgVVhGQasEHz8Io9qDWDntdkmcUaGUsgQZa4kjCdnymFcqhOcZv55iQvxM4dv0SZw7vyoh+x5Xj1yMnqxRRvxpkCRlxmqj8pp+aflw0p8O8V63UX/7nX4QsxaLuU9Suy/M0iL87zqXVK1EsaNRsQVcPjsL5qgjDViA26MeuYm5Dqjv0X4A7yv8vTjdBq7xIqX/3CSTdtzJJawrnt2HdgCDnTBSJQludkhE9BBkfKEbdcRVntKXSRVHeCyBAwo3LJ4FR53rXC8G6iIaaxaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vc96rNeKQVG8g/Ok0ws+D5wkSdQOaTAoc3N10NJhWe8=;
 b=kn7eheD3XyrabTvqxDzDB4njLXKt6TbqLh7ERfvNqAZwEcNu0tmmqhLso7WRi4QH7DXEapq6cLPhZSHigPv0JhwWm8jLzcoEaXkCEFhHbY6u7WvCEsEn+z3vjj96+hox2H85MfCwtEjJ8HotwcomtUX45KpRFPSw2S3Mhos3izFM4la1vZ5jzi53ZIWTIVQ3I3AUIrqOPKnrf7QhNDtVxKRoiyp1CcbaYWTh6uxYx1mjihtp66Ukiu4SFV1Ir+bPwUVEw30L6TADwZFFGJfHgg0fMDclRMlPQVH7Yrhr9pdNv2EMZcpz7DbfYhbjQiH0giYJTEm4zuU3rPBh9jvO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vc96rNeKQVG8g/Ok0ws+D5wkSdQOaTAoc3N10NJhWe8=;
 b=A0USBPGQELk/CQ6O5l7uRqr7soci6pTfVGyC4qAjWLg+LqI+R9lmnYQ9oSKtMZ0Q61P7+WbOlvluy0Y+VeuAhjM8eVWikZRxyuPCn24cMn16bt2O+bp0m6kn3YvBIRqAU5rXvCKfuw/smRQlWnIG/JDaqEKSo1EIgojOCaRosiyPq6Yg7/+qLeKLZcNf/RVk9iGHK1Sv/7ZXBXIM1Ew9/ji5fYPyOT/1Vz/We1QDnqodCNS5dtlxBKPWtoh5VHPMQrbYIHySYjXUPdpr9Tl8l9Vjmm8db7ZJzOf/VLiSqFyARn62gryydEFMPnQHNT8vVHnQSMxbVh4a9u0ibKQ/sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10423.eurprd04.prod.outlook.com (2603:10a6:102:41c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 22:19:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 22:19:01 +0000
Date: Wed, 9 Apr 2025 18:18:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <Z/byUMYsbw2KXr9Z@lizhi-Precision-Tower-5810>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
 <20250408025725.1244-5-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408025725.1244-5-ming.qian@oss.nxp.com>
X-ClientProxiedBy: AS4P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10423:EE_
X-MS-Office365-Filtering-Correlation-Id: 028eb851-d6cc-4155-1ed9-08dd77b48806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UTbXtyMJmWLo6cwT9Tkk0rwdkv2JC1w5RvFmHQXpftHo+kk7MNNPdq/rHtHs?=
 =?us-ascii?Q?wZwwRD1a5ax1B1yD0ptRuwmKYqwvEEG8qqNW4tVZqChksmaHs7ftZ9/1201f?=
 =?us-ascii?Q?mL7OtHn3TtSP8cP33/fQyezyWQOp/twk1AECYCL46kLsIjGZ9bJzIRzOTrtj?=
 =?us-ascii?Q?kWOG8cSC7nRziR3X3QH3c+ln380gbA1sajm8cfIkndkbSMk5AgjG8ifFfzBy?=
 =?us-ascii?Q?AiJYFbemgwdAVLy5cDir92b7yMEpPqq3zM1cMN637HEgx+Dm8u8seb1/PPPY?=
 =?us-ascii?Q?u0+40iEzh47BxXfXWCgmsLa/a3Ut8H2vcrP9UDwO9DXxPk207uh9jpesZh1S?=
 =?us-ascii?Q?UhXW74Qco6JoO8kNA8SvJukkzWV5jd6YRyqiax+ih2148dJ4Jb9+eYzfxDER?=
 =?us-ascii?Q?KpZCYKQyBnXeovX+2/p40p3we8y/yM2RcPU8VjkuatfgYARJ9nLl/dWtDpTj?=
 =?us-ascii?Q?zMc0L2RuTxT2XlP1+XPlhOvj1cGo+O6fiNtaNVBt/nAIA2kqQQGBggiTk8Ri?=
 =?us-ascii?Q?/vu4nxT8pfclMxvjjYG1h5x2ZIQgX+ePjz6Ul64ccnomlp8K7XtuKFHQm6df?=
 =?us-ascii?Q?IsQy9UnyFP1Hmqjx+lG0QszzTMLc5PYUoq/ln1sQbVlAqFEM2EO9aJi45RAC?=
 =?us-ascii?Q?5mwT50F7fSZsujD472n+BWwe28DWFOh65Q0mlW+DQbtKhTIgMiPaWcybrMev?=
 =?us-ascii?Q?egACA0R9hmbCTIldofdk4e6j7UUreBrP/cp4EnIyNINGYnXmZgTKhSxGO9GT?=
 =?us-ascii?Q?3sJphS/0Hk9Od826xdRDP+CPhTnnovCQBmj0i594ju+GXu8vZOBzHG1YRbzA?=
 =?us-ascii?Q?mIe4mmbPUK1Qndl+UMrygnSDByo5HRxvez7IbPYzzjV5gLi9hZ3UOOqs/yTD?=
 =?us-ascii?Q?PpKqrmZtmRts+cgZXVw+L/iQ1DjyfxG2dNe8yCL4cMAFD6SRjjv9ZxQL6Ehq?=
 =?us-ascii?Q?46YhN8npIQVZ799NleD2YFIl1jQJo41DOu1ecghNivMSPw8WczDQ0P/pV9sd?=
 =?us-ascii?Q?0/kT0xIEqq2VdzWDqhAUfSr/BAHJnQvqH1SJkDN/Rg51m95fSxSHjLCjXQuV?=
 =?us-ascii?Q?Qmz5yu1qz/B/OxATGI7Xm3Qmww+9GMatAQELFOV33k/+a2Wb1t8mU6SviaRA?=
 =?us-ascii?Q?C/yFgN8Er0JAdHUEputTgbjtEflhhuj/X2TbJ7cYHnuj9gZdihjEfwkXyiql?=
 =?us-ascii?Q?HsnF88oECessjxJ477uaZMYeGKFe30DGXoxXgVqbiybfQqtnhNIYNhvX9WeO?=
 =?us-ascii?Q?zBXRQECzCdJFo4Fjfm0HZOf5SH8AoCVmMV1I+/9vxL+Xx1Uce7lsVTQUNbA8?=
 =?us-ascii?Q?EtOP/gbOoASVAKkWbuF37JFoAQ4BD0/gzvFFN9SeJTF/M0FaQLZA+3dM4Ii6?=
 =?us-ascii?Q?Tv5sRlI2CB6R7yu/zarTfSN0+hYKCjwtnFizjvgElFQLYXZhIXGQ0t7Ucone?=
 =?us-ascii?Q?bTNhxYiLJtYDO5ObAtuE4cD7MQld9uBmbLd0F4pdrMWPgUrmdjCh3Au6D3T8?=
 =?us-ascii?Q?IFA6IhDJxAixR8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xn/xI/kEHSuA7QULctlgBuaiPt9rkdiulP1BjGY439TRr7sqjXwRvpjvzfwH?=
 =?us-ascii?Q?TpdniGiL1B2/7xACJNS5pwsUkn02S1J5hHoO8qD/y2zg7BA703QcI2JCvBbO?=
 =?us-ascii?Q?1rGeObHOxslaziVckaDIGGnXhaCKlzgLB7bWXO4WdjYxX1YtMG4XX70IzR8d?=
 =?us-ascii?Q?NNLiaThc8pgvFr4EUTWif4aP1HrWgyZukmUG1UuUgAOzEXj9fesHvQcMJgVE?=
 =?us-ascii?Q?Ia0XACAlA6s531WMHyImwIRcIGRnZr+7o8Ujgh1RVx910AZaX1bprvIkKghc?=
 =?us-ascii?Q?LGYKuzIqbDYfnvt8Po2wj7nE85/RPoFsYFRoBICnBgr8q3Gwtn814Fhxifg2?=
 =?us-ascii?Q?cuWwm1eqAOdqdZ20O49wC/4lC2/yMCqgIrNZP1SQeMoByRQlRJrrVncrRpkZ?=
 =?us-ascii?Q?tD02nK3i4dbYOb95Nvmx0f1RDVOEnzKEBqKJUDYIGoXz7eyzVAQD70YYIGMR?=
 =?us-ascii?Q?B0aYtLEPdkUkIpmNL0zJH01dIxkV3PilCPHlNRURHVhYhffCTYKqvYeTeTT1?=
 =?us-ascii?Q?aUr/rPF/j/Igme6OgQ7mfbFUswbE8xBObPxtetrwKrWcDmxdOe3Wva3WrqUv?=
 =?us-ascii?Q?UQgzMzKhoMG2gn6N8OKZN3kLC+mAGuOLIBuU5LFq6B58Bze3td2gl8REpan/?=
 =?us-ascii?Q?A9nXyQaZV9CgVxtpjajyw0kg4ORAmVS2G0FJmaBRajy4D937YGDIQ+UoILfg?=
 =?us-ascii?Q?QfHn66RZWy7mzdoRKMoI3QHWSiDH5yvwZ0pufqfkdaV5Dg7rE7JQJI0t4JSK?=
 =?us-ascii?Q?H8lVA1RV8Os0KBuF17t16QCFVBDhdr6TFXTBdd3duuuaEizNH636HV5GJW/7?=
 =?us-ascii?Q?7a4d85Abtiy19PrmHa1Ss1Ua0RBLhJMenJopd6aqayoK8IRGAkWi/rGjDS20?=
 =?us-ascii?Q?+qSQgeno1KPA85QYUg45UmmxFL5tT6riz6ngaH/0VkxST6aDJPK+bWiMZwJm?=
 =?us-ascii?Q?XwlQTCj8OHRY5A7tDdw6qwnDgyXFX2rzES0WRmchuZQUNF5o/Qm2V8L9VLRU?=
 =?us-ascii?Q?ee/IDHwOu4GQ3EzT0a+6HpfFHnan+aG59BxcETTNzZIKCyq2mtqXrBQwZc9X?=
 =?us-ascii?Q?2gsxb8Vv/tSMepdeMx+eCj7nrghtdZhHThFoIlQT5DkldTQRHEXsjCupKmhO?=
 =?us-ascii?Q?YWCP1inbuIxfYLHSUofV89q+M4XqLEeXr0hrxxX2dnT0wanafWnTUmlcpLiI?=
 =?us-ascii?Q?ji9Yq4BhADOTg84VHkNYG23mNPZWCooXAmuxmmr2bisNlZFNyFHaVyKRaGHG?=
 =?us-ascii?Q?Xvwl5ON4keSUOVg4n3+nawNOjn91KxwwA00QPmw+tSHEaR1/TcCr/+3vO2lo?=
 =?us-ascii?Q?Skz6MhUJtLDz4nO8Z2jzt1RgUwGLdEgiNnBVwnou7/W1IwlwfafGrykA1bEM?=
 =?us-ascii?Q?HN7xqZsGxv/5wbuvP1FPV6f43ReoTiam+kJWAcCQEHEWRfzOqoBhXCsNzd54?=
 =?us-ascii?Q?CYpyT0FpAb8ShD3Wh4OeU/DUqLNkWK4KkkE6WV4GVQRQ4165GOhxhiMAZUxC?=
 =?us-ascii?Q?CJH2apBBD/XquPSywZw97naNqVxfDAO94D/Reb5UsX8+2iFGtLJfNH+LA4P8?=
 =?us-ascii?Q?f07Xk/oC+NrMAWrklCk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028eb851-d6cc-4155-1ed9-08dd77b48806
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 22:19:01.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS5R/DrdNHkLXCDeeefmvTCFQNTpMXrZYtCCvTPVfZSK23FvPWAGYRcEy5mfXtEpA02i6Pv0VrKD60DM0EW/fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10423

On Tue, Apr 08, 2025 at 10:57:20AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> As the first frame in "repeat-mode" is the pattern, the first interrupt

Can you name first irq as actual function, such as "pattern done" irq.

> is ignored by the driver. With small resolution bitstreams, the
> interrupts might fire too quickly and thus the driver might miss the
> second interrupt from the first actual frame.

"second interrupt" look like "frame decode done irq"?

It is not "missed" second irq. hardware combine two irqs to once because
irq handle have latency.

>
> In order to avoid the driver wait for the missed second interrupt,
> driver will check the curr_desc and slot_status registers to figure out
> if the decoding of actual frame is finished or not.
>
> Firstly we check the curr_desc register,
> if it is still pointing to the pattern descripor, the second actual
                                         ^^^ typo
run ./script/checkpatch --codespell

> frame is not started, we can wait for its frame-doen interrupt.
> if the curr_desc has pointed to the frame descriptor, then we check the
> ongoing bit of slot_status register.
> if the ongoing bit is set to 1, the decoding of the actual frame is not
> finished, we can wait for its frame-doen interrupt.
> if the ongoing bit is set to 0, the decoding of the actual frame is
> finished, we can't wait for the second interrupt, but mark it as done.

Firstly check the curr_desc register
  - if point to the pattern descriptor, ...
  - if point to the frame descriptor,
  ....

>
> But there is still a small problem, that the curr_desc and slot_status
> registers are not synchronous. curr_desc is updated when the
> next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
> after the 32 bytes descriptor is loaded, there will be a short time
> interval in between, which may cause fake false.
...
> Reading slot_status
> twice can basically reduce the probability of fake false to 0.

Consider read register is quite slow compared with IP read 32byte from
memory, read twice slot_status can avoid this situation.

>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v3
> - Read the slot_status register twice
> - Improve commit message
>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 30 ++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index d579c804b047..adb93e977be9 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -89,6 +89,7 @@
>  /* SLOT_STATUS fields for slots 0..3 */
>  #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>  #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>
>  /* SLOT_IRQ_EN fields TBD */
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 45705c606769..85795ac4cc71 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -910,6 +910,33 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>  	return size;
>  }
>
> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	u32 curr_desc;
> +	u32 slot_status;
> +
> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> +		return true;
> +
> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> +	if (slot_status & SLOT_STATUS_ONGOING)
> +		return true;
> +
> +	/*
> +	 * The curr_desc register is updated when next_descpt_ptr is loaded,
> +	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
> +	 * So there will be a short time interval in between, which may cause fake false.
> +	 * Reading slot_status twice can basically reduce the probability of fake false to 0.

Don't use uncertain words.

Frank

> +	 */
> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> +	if (slot_status & SLOT_STATUS_ONGOING)
> +		return true;
> +
> +	return false;
> +}
> +
>  static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  {
>  	struct mxc_jpeg_dev *jpeg = priv;
> @@ -979,7 +1006,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>  		goto job_unlock;
>  	}
> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> +	    mxc_dec_is_ongoing(ctx)) {
>  		jpeg_src_buf->dht_needed = false;
>  		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>  		goto job_unlock;
> --
> 2.43.0-rc1
>

