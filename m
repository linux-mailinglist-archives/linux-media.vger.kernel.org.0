Return-Path: <linux-media+bounces-29810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA2A833BE
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 23:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493DF4A1647
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 21:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6A4217734;
	Wed,  9 Apr 2025 21:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GUnOS2EH"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2087.outbound.protection.outlook.com [40.107.105.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E9214216;
	Wed,  9 Apr 2025 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235721; cv=fail; b=pkzj1S6Ymg2hY5oB+ESXTr3FzPj5ehen3ggWoPF5EFKn9GF0H38DuCAin766mkqXEz0TW81Gfnbm/WmL518dr96dyPkGclCyFMONG2ocCjRl0sVp0VuZzo+Qox7zPdtN6Y/2BY5mYhquZXCQB+R0xAkd2pA7NDqOgANWutxZoy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235721; c=relaxed/simple;
	bh=+HCg5m2MJPwt5Clfg/Ibt7CbfispSA8EWN5q+gh9/sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ts2eKJk1u75meRYVyDuUaKoXjYbWrEqCfSXdME11ukz1eKtjmNZhvQeHTFM4UrwCdIhCYaLSkV0WhU+MFPs+p+HnyFcbvEmoofSjcrVYqsqtJGkMCfECG2PP1swUhOkXEypy6U2b25VxyVA7nkooD0NmRDXNmZbHJpNVzay1TJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GUnOS2EH; arc=fail smtp.client-ip=40.107.105.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATjFGAO1Rg8mwCaHIF21TjnXHx4K0Ipziz0WYr/aG/xuHIPEJZpHri8CdxiUpTST2n6NSfvMpiUzLh3jJhTw0AMgjUubTrM5n2V48r6jaIsS78DUk60qH+1nP3jFUtBC5geqpe5whOyKPtJwCGdQZjtwfnkrAOYiy3JSb8ESbouI5oxyYedGP3QmEis8aO7M76QNOKmCOuSQnQ9+4IB/P7zkZX9AakDmzPeJVFHCHhjvus0jYV52uNjBIEJ3eFPkR9YFstLVeJBOSVX6XPK3Kp103CfAvx4QKPqf/qmyrWbVLnpJAPOh7qkSiPgBlgmxjWLmTJjo2+uTVAMNQY9nQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1Nep4u5yhKGvferxyWg8RALYfci4g/A65tzbQE/dF8=;
 b=l0PfExUKV5hQcZ2Vz2HZ2rF8ri3vQNxkt1P0jWR32q4fvEroAq5K2XtOIDkHe/D4f13WYkIbve8GsJX2JYjJQYNXpLlvs84LkyFqjwsadG62VD24oinjy/7S0YPJK5IKG/rWaaN718HBvupDi/JwwqTObQMGp5slQazoxmiUptUdLN8mTDkeMJgBGYiCgE0fFZEzV6VQT/mPcpf2++P2+efXIgf+vJ+rZQUpSoMAm2qF+PC56iwyFXgNjJIpYTZcmcaMGRg05pBHdY94TIPxBpEUBqABUl4V6uPADALWBBHQfHc3DgeLZYg+UKOCdM1T5wv+DMXrpEVLa5ye9JmL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1Nep4u5yhKGvferxyWg8RALYfci4g/A65tzbQE/dF8=;
 b=GUnOS2EHGFP5j5pT0V2L7QxitUwWlLZRnHQO7wIxx6YpXA0vxKCwFlQX+16DtgNYQNKFpdivpPetgtuOBB0TOHeca03XVNbI28MDBE49ORvhege8lk5rqdE+QpQyp+C/ivKE7oYc2cMgETiRfVuwJU7q9imc8tkUuJMYJne4mE3i+WMfdMKnVVgr5k0Q7U7u4XWWJX++YrHiggcJw0hucaqlXjgv28cNS6X5QId2nQBYBX1cBcUvQELt+rVB2qGYOy4OGsM3j8vwwy4392r16WyeXh0B3lIr7Vi+qU/aaP4qFEqh1VP1rrewPmTvY9LY+DcwO2/e5QFJjDL268M0RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10984.eurprd04.prod.outlook.com (2603:10a6:10:586::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 21:55:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 21:55:16 +0000
Date: Wed, 9 Apr 2025 17:55:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] media: imx-jpeg: Cleanup after an allocation error
Message-ID: <Z/bsvC5txo3aL9QF@lizhi-Precision-Tower-5810>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
 <20250408025725.1244-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408025725.1244-3-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0374.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10984:EE_
X-MS-Office365-Filtering-Correlation-Id: ed65fda9-eb77-4ab7-1331-08dd77b136a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IWoP2LlWyf8hFdwgugjaYTDKk9ykCcn9vxzjhpbl6kgLZQspGB7yo6z1riy9?=
 =?us-ascii?Q?YlfSBI5Ez59QE9cyGLA7QTi6mPuu2cPHY91hQYO4C489zR/P+NnNqfS59Re+?=
 =?us-ascii?Q?pnXAv1iNdij+z/yvou4Qw7cT6xsIOqbnE83efkieHkGoBX0Z7KBPvsughcWi?=
 =?us-ascii?Q?WekxF+8HbNYOUM1689GU1kRgnK5Gd6pC9aDQsHEzG+NchyukeJGRij/Gyj5Q?=
 =?us-ascii?Q?1aWoc+Ma+ILC6pOK4bNRZNQ52gAYsuDdfvV8/gOHmH5rZlWar0fCPoI8CHpT?=
 =?us-ascii?Q?iYgP5HW2oJu31+lNiXFffZ7ZpTinO+WE71xlmEIWoTlaxh1SgYpTUQAEEVp5?=
 =?us-ascii?Q?ySSHKrjpDuaDRpzZwk+5QtJvmv68YGWU4o17nAxasku0ORBmN/yZCBZKha7w?=
 =?us-ascii?Q?yhl2+MT4K+zQPeR3DqLhlZhg7/hNVZoPLiClwAnoH/ib6y/1uGhUAvZBK/XZ?=
 =?us-ascii?Q?ibjYZqPt+ovVELY+RjezY/R2hm4QLemTcHNGGIVvZoYlRWBZCXus8yK3g/df?=
 =?us-ascii?Q?BD0rmUu9z0wW98HCiC15/ESVU02ff+vC0vJPx6/nczlY1YLuGl//+3qRkr9B?=
 =?us-ascii?Q?hq3MqYtY/F9fmf0sDtDJXT1XdHi4sFcbM8ldJU3Ap46n19rOuSh5twAC2Y1W?=
 =?us-ascii?Q?w3kAV7eGIQpq5KwBQP0qUvnMQ6E64kpNrruhp03txIH8X7eePqkxdEw3MIys?=
 =?us-ascii?Q?kiFJN/msSAyuYAbqiPF2l41Bc8+LSDrLYhQnnUzO8WvjqIyZs1uH7J69d9oJ?=
 =?us-ascii?Q?NpgTLKbRBHvwXEbdGebUdj+b9OMnwZWIL20sdgJ3UstOAw3NqMnSER+gwxBw?=
 =?us-ascii?Q?U8o4dwzptH/XmfQ2E8709a1hPRgrhV0pcIWD4YQr12jCeY3ss0hxy6gsRuax?=
 =?us-ascii?Q?g+SmLb94dhE8kl9ps8GvpAs83nOWSEoIB/jbiiHnjZjlcG/ymuL8XnV8xm50?=
 =?us-ascii?Q?r7jfQCt+RJglLtGWEZM/5Q7F9SUYrvc6hEqRZQJ/nz5hHjPfgmvelKxTs8l4?=
 =?us-ascii?Q?MiRkKDFs9loVc7BnEK+ZRfgrcet3R3BNRkx2gcM6ej+8I3aLXsk146sVqnjf?=
 =?us-ascii?Q?dbNo4k4VgugEoGi19KAO0U2e4dt5owLUuE/Fq0wuQFbESsJfM+S/1fyB7pqG?=
 =?us-ascii?Q?Gs8Bzg6pLlmh4fu3LPiZl70HIOKq88YQD2T+I+TH70RK6Eo/25amhM/t5i0L?=
 =?us-ascii?Q?bXv7zJ153vJnK6cZrjR0suaHIgiQ7yPY2kQvTZwvReV7O60e506ZISQapYrS?=
 =?us-ascii?Q?PLIDC9kXXi2ijWySliMRQIf3y6WhBL3IClZxyg3Okgj1GiPIHb8/bQW5YOGG?=
 =?us-ascii?Q?N6kEhL9g7MK/uPS7W0i7oazJrtBsl92Hi+a9s5MaeVjEm35MQ9gHs4yMgsQ1?=
 =?us-ascii?Q?HYPamMCoGhNsCFd89vHqvFmpfpzz+dV6VPwDyx5YjRS+xOdsJuDYR0Apj3z2?=
 =?us-ascii?Q?44ep7MhLR8INZ5gGnY2IaalEm4lI81a6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ls3yz01NFoUvRzZGGY/BqUzJhLzN6BIIbU8sFn7M45mddNgz7aiVB0ZZo1lD?=
 =?us-ascii?Q?1jIH3MFzqFxc+qS97P5gwGkfjs68/DL3a//Gnr1pXosbciCjBBfzLLao6hH6?=
 =?us-ascii?Q?ddbl32LhQUOz5pRVD6BH/bwH7rE3qc5nEWCozmrb2Y/PJQhx5TQQnJJ0nUvQ?=
 =?us-ascii?Q?VSCkIVPj7LyjJZxD5BwMzhFTduWiFFjg5g58O0s6D2BLiiG8y8S9XB1HlVw/?=
 =?us-ascii?Q?ARWr5NH7NsnRzOZDWyRq9Lanlkianx0vCWHLH9kFEui8n3NAP8L4FZDNeZ6U?=
 =?us-ascii?Q?w2zd7cM+alIFEQCYuwiwjS7KawjGuaRqKQtLg9/UUlurQAKU+trei7xKK/Fs?=
 =?us-ascii?Q?yCTgwJBtAf2xYx1AtivpZmDJoOJuYpKm+26YICYsScwDdLMX/Oi/cXQ/cv8C?=
 =?us-ascii?Q?3pzDQpB7G1hIjxtnxJxVE+UixYlzVzNjnJ15JR/em+k+xXVbtoEcyFsExqXt?=
 =?us-ascii?Q?oiw2y1U+YhlDMC7Lus4kvgaLy1AOh1FY2ARaOJk2zG24knaJsHOYcSXBOeZ+?=
 =?us-ascii?Q?DSaGzH8nhlC4iSm08UVqd2tyJzr37PLBXHhaPk+CO0iBLvTwe+QpYp73VI9n?=
 =?us-ascii?Q?gzZvyGknYpKbNGk1x7DY5AciP0LFQo3N+SjTk1opFHyuNiIrp+6vVyUlUvhG?=
 =?us-ascii?Q?xLWopnTVx0Z7JTYfVAPz/IRflKdbTwNx0IdbDR4BYQjePaBxuQV02mk7+knb?=
 =?us-ascii?Q?TgZaJkAINkNGp1VCNvvBm2YEi+9JjUDmfVfccb06IpsoJveu5YaosP1YMKHw?=
 =?us-ascii?Q?aEIGXIcVvspmcScoRKrUe2XYiHCSuZ6yXDeMFYPLHvAcgCGDbfLTOA7sIE33?=
 =?us-ascii?Q?Crn7gx/ecN/9Ld8ezbDdRmsCgIc6YTtiIuQxIIF7xXxtG86S9nnko36GDh20?=
 =?us-ascii?Q?dXNubt2i2wl11Nxf1rpyvorAru+plhzb6JcB3z8t6eEdQehVsonWc57edjbj?=
 =?us-ascii?Q?B7JsBYRiYHAVTIgCd0vUPzeWzYob1kNV7Wd29MtJKcPJekh5zMXw8qIjztQX?=
 =?us-ascii?Q?ncVhiwo5NBI4KXLpWa6giYqIP0Nwbyk7VOyFOjoogw+SaLOmh8cZe3kfwxW6?=
 =?us-ascii?Q?dAy3cPMU45b7L/C/ScVg3/dQ0s437XtIkKjLnuuqFjWO/p2DV8F33vnV/eCc?=
 =?us-ascii?Q?vQrVfcZG8RU633CWVOE2GHUPUH4qnov6O9G2aDIArvKhA3tcsOzGKfMl3rn7?=
 =?us-ascii?Q?MJ9KlqBME0B0WOswL5Yk2g0J8SWqBXifZnjh/kOJEFymP/NcqcWFByMDw68/?=
 =?us-ascii?Q?MnDqZM89W15j98OUeED5h4gobZ4hLbNVdmKmZ0qJfpKXlxNtiNT244Mvtlty?=
 =?us-ascii?Q?HBBcpzZz9ZDlrpity5Jl1LMDsIgBFmEzicfvjkNC4U1ntSLGZjhczYLH3w8E?=
 =?us-ascii?Q?QB7rFcaG/aGbXg8Py3z3lfYSSWDhGRPwxp6LJLlqI5Fu3t8nD5QJ4wu3UIkC?=
 =?us-ascii?Q?sN0nC1tBffLWUUKRqHHo5sZWzHbSgEHiEy2kqxr2a8vziqM2wZxgxFKfVUzx?=
 =?us-ascii?Q?x3O0sLX8TZsM+qdhxTVGfIsj1++qovp8exF4meHIuElhd202kj0qtgWxNk3y?=
 =?us-ascii?Q?VHdr0BRf0+QUyAjBgO8qvtlu7O11+aQKT4mYLjW6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed65fda9-eb77-4ab7-1331-08dd77b136a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:55:16.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfolq+hG7vrBCweYlIRLGEFZeVx3tKjVwUz+S8rH3vFNq6ocRlFKfhWg78t/p0Rx6IwLXpTPr+HR3FxsYa2oDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10984

On Tue, Apr 08, 2025 at 10:57:18AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> When allocation failures are not cleaned up by the driver, further
> allocation errors will be false-positives, which will cause buffers to
> remain uninitialized and cause NULL pointer dereferences.
...
> Clean up the errors accordingly.

Ensure proper cleanup of failed allocations to prevent these issues.

>
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> v3
> - Split the moving of code into a separate patch
>
> v2
> - Add the Fixes tag
>
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index b2f7e9ad1885..12661c177f5a 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -820,6 +820,7 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  	return true;
>  err:
>  	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
> +	mxc_jpeg_free_slot_data(jpeg);
>
>  	return false;
>  }
> --
> 2.43.0-rc1
>

