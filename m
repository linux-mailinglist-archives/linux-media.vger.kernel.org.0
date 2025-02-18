Return-Path: <linux-media+bounces-26282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649FA39DCA
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCC5D1618AD
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88282269AF0;
	Tue, 18 Feb 2025 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ImYPlTd2"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BB13DDB9;
	Tue, 18 Feb 2025 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739885868; cv=fail; b=Mb6L+KH4atHMpCU/xDmzELd0j8OCal/yDGbatxMrWgQzKb4w0T0TZ0tuydrH/dX+zSwVvY87lxqd3ODGHCXGME9fVYJ51OK6duJf7CQZcY7j9wv/6rHgA1N5TmTC957UY9EmLMgovMRaW4SLQ4O6MCD0IZGhzJrsi4dslPX0bvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739885868; c=relaxed/simple;
	bh=6F89zCo3B1JrNEuEXPDoIBf2Dv4vY9A5sJscVxB+kbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KANk3Q6bMAkAB0i/EhHIJePVtKduaJHxYHoO1sbOC84SbGDVKBnVHV5eA2dQDlctdpJlT5Nsmz7GBTdcjllBJBymv1h8O47ItK+45dR6KRTat+1wkvFjaZaNZX7HWPAyO4uUs6Ap3yoiu37aqS2Mb0kFsq4BZImUfatgL9dftog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ImYPlTd2; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJq2lzY84hcgylsVW87M8PD1Hvo1EVa+Q1Kn2ZobjQVEqYbcMoF/dK3F/I5BOQpmEIbGiIltJkJmXam+PlePgnRVHlNZoLXxz+kCsALbtk4bOD4vfPy4otuov6bJcdllr7snPOZQ3yM0yWN2yBc08IoWRBmjkmu2Rr4uZP395WR3h4hRnQ9bjj/xsxpycxJ81NLkFDsgLLZY2iwMcMb+OMomZ6ADvF+kWmGTDPBzUzD0jxO5ar9uZN6zGFPSOsHQK2PKdfpUUxz8irntQ04nsHlMMSxzAB4XN+N0oFDwVj+MnQGXinpPoFUZaGPFlpAw3kYjoPKvRK+PhYMvBN+T6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1ct5BffBp5Ioah5/CyJ0Fowkzh+ox1KGUHI6bXBt+0=;
 b=lGHdEBW7+bSJob2xyXwVaQSOt+xEImPBoXQCvc0zP9V+awjaCKGpLI8o4G0IHLlzIBOuvokn9PDWo3ahJa+ULLp1NoZCn2dB+GVnjyxgkjd6u/DTmazlNnMRKbYJJywhAtrD0Pkg5GbhdCG1hKN/ROSKoWart5CtjQfaHg9N+Z2OU1Hrh4wBpTleQzlSfnJ8xRXLRlqC3rH+PHHPvntuHnMkkTLG4XAn2CR1LoMDGdqgO7foGHryx4uK7fzNoJu72AUAJf3bUTaORri5rfZ7UHk+CF89s8Gurv0Ez09IxGDS3J8ZDAbNPMyey0T2MudDcN2SQMDmUFA1244J5iQpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1ct5BffBp5Ioah5/CyJ0Fowkzh+ox1KGUHI6bXBt+0=;
 b=ImYPlTd2Rg/0/aBKBMbsKg7hcsTt0xxUajgWvfGt0z0xwHdMRmWU26v88oAsGBdMZ3foDz2rVM1CHrR5Wuiq4NSJpsfq0h2+ZYJdflxZL9thLQnv5P7IlUaL/+BQzPzMoDQ5biHOZO5crFytLPsFl6hxt0XNYtN/V1QSEz0TRdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB9473.jpnprd01.prod.outlook.com (2603:1096:604:1d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 13:37:38 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:37:37 +0000
Date: Tue, 18 Feb 2025 14:37:27 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Message-ID: <Z7SNF2G5UUKWVOUk@tom-desktop>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
 <20250214002951.GB8393@pendragon.ideasonboard.com>
 <Z7R1KiIBqPcR06hP@tom-desktop>
 <20250218123503.GC20695@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218123503.GC20695@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0356.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::20) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: 080d3b39-b304-4a38-94cf-08dd50216882
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?h0SXgQHm5CRWJStu+zpw5hQZe1Dedz2psF2LYaIwo8iKhu/Wh94QCYAf0rqu?=
 =?us-ascii?Q?XnYD00SUawi78OocBRmRoA6VVpLkxVk0zwXDxAa6mZiktGimhzE4FvpWHb+2?=
 =?us-ascii?Q?MYGPkHakbmkR/hC2iVBfQeU2hHYKxlhlocFqXTmz0PvfmGk97pNrs1ScWl/w?=
 =?us-ascii?Q?u+gBIzfjElKoDoabE+hZ1uphwXMtGTnj29G8Td/40LbmTZdoqeB6fcBmTe72?=
 =?us-ascii?Q?AMljj76Z30BJuVdKi0VmBbLAHhJQHaNLwgYpj80D9UCYK2FNcDUu21pZpUFi?=
 =?us-ascii?Q?CO92z19nidD4tvsgIrjLnPfwE+xLL23q0itpXfZBPK2Xw5U0gZs0xXK5vv/z?=
 =?us-ascii?Q?XjHVm3yCtwK4OO2u3byYhCNMR8lzgNOz+vSZRAZiXquRomh4H47a5JfK8Jnv?=
 =?us-ascii?Q?dXf7JmlYqBfDflogBU3pjoVvu8Cu3kCvXE9LC9ZrZO7+P6KHfGTiFkvy9bsz?=
 =?us-ascii?Q?Bw7FqjqbRDvLUlg9NfDWkHrQ5M86HR3NFnPbN7dYzYvCC43dk8dIx3KuaYzr?=
 =?us-ascii?Q?mTFTlKPCy9/lVVSy7HyS+Vw9FPFJN76ueLQ+6bmdgBmGdUR58JLOO7HIBHvO?=
 =?us-ascii?Q?eAT8Q52Kq11d0/jQGPDfVZBqZ3taS1/2+Z9RA42fjBReXU4GbFl/KfBiOgMW?=
 =?us-ascii?Q?VH1rmeqeMrYgxamY+8nnOqSO2DgJea0Lr3PU0jTzr8tFXPSCL+uJAlXaNGXY?=
 =?us-ascii?Q?XYACOXbKqNUnO0mlFgWg69Voua3yYnl9rT18TTs53uaMN1lxypcb9/SwodGH?=
 =?us-ascii?Q?3guBi9JL0wOxODNUqOMsrc5c+fqpmJqOf87nAF1cuRYpvN0xXCMJalOfcQmg?=
 =?us-ascii?Q?KmDrZFtL6pLWdz+Lr2pxOtTEs9QxgT1sIusUqHMdQZXd5HVAzqnsmMl6prUz?=
 =?us-ascii?Q?1tSsK0gqiiTnXLVu/h9sxOvNBVpEh7cR8XNdjYMFU4/by6/x34sjt5evbK6H?=
 =?us-ascii?Q?SKnyPlsD4ggFD/6bVL97WZX8aA0OzKpXsmRFMU2mnPPUv9vwZPvrjDIm3rQp?=
 =?us-ascii?Q?f1zld0aj0rYCnAix+2Xcc6x3f2fjHHBNPh7YRRo3eSRQyjyb9io+mxzAw9wF?=
 =?us-ascii?Q?lnh1uN0TBt2/itkvHnW+b3FYu91M/+n+a+F9w2+2NQ8F7/OHYkVuqg6wBOaW?=
 =?us-ascii?Q?8LlupFNygqeziMq2X9tZVTUCu/mUIEqiiPczixe7sPqf++jLKpzdhQrrBXWH?=
 =?us-ascii?Q?oiHQTnqHXTGYMsfjnvtLc/2zU1QhspXMp3hGAqXrmFtBQbX9HMTmLrvz07D7?=
 =?us-ascii?Q?z6MLDKuvzumxzuk18Lgl8c7JmVtiBcT7Id9K4XQu15eXJYWKUjhL+Y2v4GvB?=
 =?us-ascii?Q?6pc01mVsBUdEaOMJmMLmuIF8iWxGbfYOyMyH9u39vTb2awZmGuvqYx9ft6ld?=
 =?us-ascii?Q?iufR1E9smhlPRtla4vngl55rywCIzjWJCZpJYLUh6uxEnqupi4BUUnjudasx?=
 =?us-ascii?Q?c6ay4BAbUFfo3nKxxQie7RrT+XZWGXWm?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pr+EwNO8KcXK3cFtjMw3z8ujYqwqlOwYRPljmZFPbSyrRCpzDdm0hSFeOtac?=
 =?us-ascii?Q?vNR0x938JeCDhRfrCZq3J1FPdtqwy56EPbYA/6fJDZ2TfoHTE2ZUvySvt084?=
 =?us-ascii?Q?fbc90RtDanmnX6unrWlfSncTaG2gvJulPud540dnE3hSApU3zKxVCOe+2pnW?=
 =?us-ascii?Q?4D7mWZMjMeco038+X3bACadz+ngA4K3eZE7T3PjQZ6+HI2QLieYYhfS6fsrI?=
 =?us-ascii?Q?O3lvXMxSNgPocoCm7b71Siw/ve8aR1GTm5jvWadsaNlQ0802J+oQ0JQC8d6X?=
 =?us-ascii?Q?Kqn+nq+f6P0DFl2F9mZv7T7FhRws+lk8zhnqR38MvmU/oNzu4PHDmE3wRxbl?=
 =?us-ascii?Q?loSQomODR/9V2HjkWrOS+5tXH+RUKdWvk3zpj790IMfIu0eeSqUTRHT+kOhL?=
 =?us-ascii?Q?hJ7psyLMgUNl/87nP3IDTucyRfCyA8ZmG6r9f/0j8YpfDWGie6zS+HYDiGi0?=
 =?us-ascii?Q?V0woQTBEpusmEge/clYY9pDA0PTj/grtABg2OtMNUUhAPPgkddQlfMVWS3Gh?=
 =?us-ascii?Q?MocKS9KnowVP7UNFhZPFpgXMn2qVw+rzI1K9TofghUZJW2M/xFBxGwHR2xny?=
 =?us-ascii?Q?XdhFGpch0TKuIUrc9hU78e/ODi4ZTPqPSBYldV9/z3UUWQ7Tk7RwAl9isgSJ?=
 =?us-ascii?Q?xgt7PYRtg6Gx5Kh8ZM4SpxOqBNgRctnk7C5ugpw59GXiOlUcbYM3JgkK3g6v?=
 =?us-ascii?Q?IBiDcRE3kbftuWgkAOjRoM/rbndm8EvTrYaCEdR/qXrRTWX2NG+N6sFauUEG?=
 =?us-ascii?Q?pGizPxzjJ6pLCknRSnpw5ja3u19gMzu1w9RQ/XVEaxZex+rITBCSxRF5OvV3?=
 =?us-ascii?Q?kcPOGjZePfZl70QUY2ZokAKFFVyHHJl6DbyXaDfDOnmUbdJXbL4WoVAVqp2C?=
 =?us-ascii?Q?UV7hcsOWG9b4ZzOKlk1qcy2rGRk6Mlgh+ppqqkA1bqdvqJpOWCI8WU7cthh6?=
 =?us-ascii?Q?tCfKzF66oO+ooLgitpSKiO7dgNuaXrKF/fyoq13iN9Xti+pMahPJP+mYDIx6?=
 =?us-ascii?Q?sSMvgTnihphIsZ6dh3G12GAHVdi5f+ipftlgZCKzxbjg8QLBs7xNlKI1K/2g?=
 =?us-ascii?Q?jNrS9SInOTNKT4Ii6Gca7Zl2obulR9Kqs0mI3k6ULXWMWEGXp5uLMz8BlbU8?=
 =?us-ascii?Q?z6jZjD2DMn0O1MJ1pTmpMDa/b0cmkrshNOi7nJXLrflfY2O9KRgTxfjWSYoz?=
 =?us-ascii?Q?9dnu63ZPZvFmbaW7c8IU8xzhi79ar4vSqJZqJb6iegs7MpEf2wjC4pHEG+v3?=
 =?us-ascii?Q?CXSM+PZvkveCWEs2gtqZdrYefM1ry95+oZyjxHGoR1BocnEwX9pDVkKAgJyu?=
 =?us-ascii?Q?Fealp8G8l2X2bd7lh6EokC8y6UIjirBnP3jM8SPvMTYiXmVeQZ6M5PNSNIgz?=
 =?us-ascii?Q?/msJUTI8+8gIt3XUT8b/AJnKfwqbQhInCryauJL/E9GOUHk83BY4I57DyhSs?=
 =?us-ascii?Q?SgdV3smq9CrVF2h/hWIfHXw8Izo2Gr8EBEK6hC8m/wAIYtxJHgF2cMpaqu2d?=
 =?us-ascii?Q?GjbIBSVONbYYDZPILHrmQn6z0u2iTeIzE7t8kzHtmSC2McGynUCtkKKtUffH?=
 =?us-ascii?Q?960SU7ApYLqgeROGvcWOMMwiVm1I3fUovjLTISsZo1OfePkXT4xen55gxAgV?=
 =?us-ascii?Q?eTw801fne88yI1FbwrXGivE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080d3b39-b304-4a38-94cf-08dd50216882
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:37:37.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXMANM0zMAk6QeTSFdVbY+qPKVj4tFgH0AiRr72lv3S01nvxKAxDyJ3RBd/VOKVagLTJsQIrlCqgwiq1iBs981wydB246Uuaz+19T6Br+6BHj/ZcrFU93aS7DOrAHX6K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9473

Hi Laurent,

On Tue, Feb 18, 2025 at 02:35:03PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 18, 2025 at 12:55:22PM +0100, Tommaso Merciai wrote:
> > On Fri, Feb 14, 2025 at 02:29:51AM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > 
> > > > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > > > found on the Renesas RZ/G2L SoC, with the following differences:
> > > > - A different D-PHY
> > > > - Additional registers for the MIPI CSI-2 link
> > > > - Only two clocks
> > > > 
> > > > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > > > SoC.
> > > > 
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
> > > >  1 file changed, 48 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > index 7faa12fecd5b..0d07c55a3f35 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > @@ -17,12 +17,15 @@ description:
> > > >  
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > > > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > > > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > > > -      - const: renesas,rzg2l-csi2
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > > > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > > > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > > > +          - const: renesas,rzg2l-csi2
> > > > +
> > > 
> > > I'd drop the empty line.
> > 
> > I'll drop this line in v2, thanks.
> > 
> > > > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> > > >  
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -31,16 +34,24 @@ properties:
> > > >      maxItems: 1
> > > >  
> > > >    clocks:
> > > > -    items:
> > > > -      - description: Internal clock for connecting CRU and MIPI
> > > > -      - description: CRU Main clock
> > > > -      - description: CRU Register access clock
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - description: Internal clock for connecting CRU and MIPI
> > > > +          - description: CRU Main clock
> > > > +          - description: CRU Register access clock
> > > > +      - items:
> > > > +          - description: CRU Main clock
> > > > +          - description: CRU Register access clock
> > > >  
> > > >    clock-names:
> > > > -    items:
> > > > -      - const: system
> > > > -      - const: video
> > > > -      - const: apb
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: system
> > > > +          - const: video
> > > > +          - const: apb
> > > > +      - items:
> > > > +          - const: video
> > > > +          - const: apb
> > > 
> > > I would move the clocks and clock-names definitions to the conditional
> > > below. Otherwise I think a device tree that has two clocks only but
> > > incorrectly uses "system" and "video" instead of "video" and "apb" will
> > > validate.
> > 
> > Agreed. Taking as reference your work done on renesas,fcp.yaml.
> > What about the following?
> > 
> >   clocks: true
> >   clock-names: true
> > 
> > Then move the clocks and clock-names below as you suggested
> > into the conditional block:
> > 
> > allOf:
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             const: renesas,r9a09g057-csi2
> >     then:
> >       properties:
> >         clocks:
> >           items:
> >             - description: CRU Main clock
> >             - description: CRU Register access clock
> >         clock-names:
> >           items:
> >             - const: video
> >             - const: apb
> > 
> >     else:
> >       properties:
> >         clocks:
> >           items:
> >             - description: Internal clock for connecting CRU and MIPI
> >             - description: CRU Main clock
> >             - description: CRU Register access clock
> >         clock-names:
> >           items:
> >             - const: system
> >             - const: video
> >             - const: apb
> > 
> > Thanks in advance.
> 
> I do like that, but I think Krzysztof wasn't entirely happy with it (it
> could be a separate but similar issue though, I don't recall the
> details). I'd recommend checking with him (he's on CC, so he will
> probably reply unless the mail gets buried in a mailbox that I am sure
> fills up quite quickly).

I read a bit of the conversation you have on renesas,fcp.
If I'm not missing something the suggestion was to use (in my case):

  clocks:
    minItems: 2
    maxItems: 3

  clock-names:
    minItems: 2
    maxItems: 3

Instead of:

clocks: true
clock-names: true

Please correct me if I'm missing somenthing.
Thanks in advance.

> 
> > > >  
> > > >    power-domains:
> > > >      maxItems: 1
> > > > @@ -48,7 +59,7 @@ properties:
> > > >    resets:
> > > >      items:
> > > >        - description: CRU_PRESETN reset terminal
> > > > -      - description: CRU_CMN_RSTB reset terminal
> > > > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
> > > >  
> > > >    reset-names:
> > > >      items:
> > > > @@ -101,6 +112,28 @@ required:
> > > >    - reset-names
> > > >    - ports
> > > >  
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: renesas,r9a09g057-csi2
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          maxItems: 2
> > > > +
> > > > +        clock-names:
> > > > +          maxItems: 2
> > > > +
> > > > +    else:
> > > > +      properties:
> > > > +        clocks:
> > > > +          maxItems: 3
> > > > +
> > > > +        clock-names:
> > > > +          maxItems: 3
> > > > +
> > > >  additionalProperties: false
> > > >  
> > > >  examples:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

