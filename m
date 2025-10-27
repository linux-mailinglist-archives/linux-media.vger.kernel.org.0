Return-Path: <linux-media+bounces-45713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D113C10FEB
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3A66503A7D
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A325C3277B4;
	Mon, 27 Oct 2025 19:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jk9yS0QL"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460D2DC33D;
	Mon, 27 Oct 2025 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761592815; cv=fail; b=McxcpTAbDN/w7iVwsq3C5HVs2H9eoadlQyZQXB1wWKJ3r2csliTwMJxuFshWnkTSYr3QYr14uX1uDSkmiNZHtBiltsknGo/S234Xhjhloyr/nf1yuinF6IH+TzmBQcFOKSw/POrtS4K1uNBm2nMSehs7to4RsFcMjtFtrHXsGPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761592815; c=relaxed/simple;
	bh=rbU4JtyP6Hq1xM5FDoqAvN9TNjGmVxV91tdS0pLUCFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WnvvkzDPS6/NJERaBOQrjrTCsErdvFuwSCY4J2SZw/Lj7vbJGjUwQfMWLCdS40FhkjFNbcNceXMQbZIrFliBqsagKGjXZsb3FYBZ5nzjYNoNe6uOnPSFPiCktPyUA3CQuJqUbcPLHn5y+tziETO5FUh9G7gV32pkbrE7EUlv32s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jk9yS0QL; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vpm+LVNaLfZd5HrZTeCwwLOuyM0QCWqrKWaAqd4z7U37cTnecdV10aBGyXEpt6bmQhX+ohFEbs3YsxCV4Kt8y4TgzMI23EIif5077JwVBd2bGnohIpXwWoZ002faDMb5oOk1l1EUUu4XXTQWHet91S26xAn6zaixXd3MRop9h9MT2qysqKkw8PZEvTld4L1PHF4vaAToFOIDdbhWGXFap+lLyFTW9tAFpm1/ZNV6xcvhY8+L0S9J02/DXy1djTPvMo3ctvZGuOS+c0qtGdcvgToh3m/AuTy86taMRLC54kA7vitMcvtP8jShckk/LHCRzilMFpEnP+zT4LOhUMZMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhsldWWK4ehTu+bx2aO95bDxHJz5yw4JL7JJfOA1uwk=;
 b=qyf91gM6xbmllmgoxQ1ZoV2dIj0SDtB2Fi8mpW37Jx0NgyHHUg+BUJUxW9h+8xBtWL2CLRlnmz0SeM4tCMGnBwf3zbUqU3gt+RNDD/TuBQzS+o7yBjNVTr+SXHCAKXy+fX5XeeXvUcYdwLQClemExrUhNXBc7p2nuqS5SJgqCQIj+DYDrB3k/x7U6Eeb5a1TbShdbhks0MWl6b8hCeLgtjsFaCCPpnHqszAY1OVKIMMRBIVq543NN4ZYxAT94GNSbl22YoIvZZC5hDSzwawibw+J6WJXopnCamYDK8cLNjnd9MTq/Quf6LNIuh+ceDRpCtn8t9GgUTHAP51vwY3jfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhsldWWK4ehTu+bx2aO95bDxHJz5yw4JL7JJfOA1uwk=;
 b=jk9yS0QLyCRu2uCtShOlM6cq//QUmoDwVj1+WuXIKWlSg+4z6sisueN9XMaVaUXBnli6hSh9XBudrCq0BDr5IrPzUVRMAxqNyw/GwWmhyln9DI+2Tjq3PGrJ4cNHayzhgb81PeKMn+Lxvx17gWD4ls6qozLCe68557PrSHbdT+MlefM1YoMd7FXpGv/zSIFiYNApfcFSwGlB1Py5jXPp+ggV62w7HBu7yoCD/+REcvWzbd+Jy1FOJRwDqFuFdaNWRlUj+2VOK+Zbp45N6Nz/DorYuL2C35WpFhlSCnIE3Iv6gRSGg6Bgq1b1lAQMBm+ttAgHJtZ4ePzJgzJrPhguFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by FRWPR04MB11248.eurprd04.prod.outlook.com (2603:10a6:d10:172::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:20:08 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:20:08 +0000
Date: Mon, 27 Oct 2025 15:19:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <aP/F3joJ0RnL0G1z@lizhi-Precision-Tower-5810>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
 <aPuAVqVUHjrPCbIH@lizhi-Precision-Tower-5810>
 <20251026220438.GG13023@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026220438.GG13023@pendragon.ideasonboard.com>
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|FRWPR04MB11248:EE_
X-MS-Office365-Filtering-Correlation-Id: 43386765-6228-4ea2-9b92-08de158dd71d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?VkAFPeTHTHufVagJ4Ncix2yxWx9e8x5rjKfb9W0+UPdfeJUz89Y1H/X3wr27?=
 =?us-ascii?Q?WKpHSABok4p0bkGjJQqsctknsuvLOahixRujc0ZAkgP1F3xwDeUWxXPbT4k2?=
 =?us-ascii?Q?6mHdR46pkeaqRogNALkEwGdrWeBX3QOZ2Lu2O2a1abBmwB8No07q/kwSaPzu?=
 =?us-ascii?Q?5QhT8Z1ZXDx8roBMy/wqWnl166SWGjY5XI1iwS8ty92NRyMlps0BlwRiRQXJ?=
 =?us-ascii?Q?Wu5aWpg3yXBHDKpr79FEjRVxRe2QzxVNRfr0D6EXoBdivs1dxOX/ASyRhy5R?=
 =?us-ascii?Q?9CfLvOEp1NUy2jTi2/Q0p2sc7gWyaBGYdZxNC6kSPyyYPO8mxMHYyVkeUlXV?=
 =?us-ascii?Q?kFcSf3yO3jp4qnPeT5bSmQKxSE0ApFH+IfCmlUJgrO1AdCs9emptKeAly6Ck?=
 =?us-ascii?Q?z9pm5WJ65pxL+yyPACXSsiKvZ0hsWBydBPLlaKzzpWCgUkpNK9z0QN/6tmBU?=
 =?us-ascii?Q?jwypzhvhfyTIZ9BKpZR/QHFrItoZ3V6mRUUeO1pEV9qpnSPBlxFZCc+j/2V3?=
 =?us-ascii?Q?DSVX9kfofyV7PoLzKng5RR0iE1UAovuoxxtyDelhobtDKjokrEaHbJ7w3Urx?=
 =?us-ascii?Q?EPlU8aYelTa2wFLeqmtHq6EYmSpEjBNO8uZUbPPxNKzOFwZKGPilxUGtlVex?=
 =?us-ascii?Q?NVpQAKxxSPwLxFfxkW6uWCP0J1L/HKKP+TuDrPWfvEPwjLt0NNi+bd483TDX?=
 =?us-ascii?Q?OGokia+zHy47XZ+I1w5skGfsACcxkDt8wXV6u7EK9O+/vC204DMK86TSKG0C?=
 =?us-ascii?Q?qqmJechEpmi5IQGzABDheNVsWb10eyYb26IbEXGawHzy38zp10lw33XI7Es/?=
 =?us-ascii?Q?wiBTrs7fyDfDLcd9JKs1pYRSZOW9ZQoOl8TUnk94wFfO7ew5NHQbmnJNokc7?=
 =?us-ascii?Q?cbtH4Mmjhly8DtMas7/kqIt9Pf5cfZ2o0ipGsj9SAz+lFdLm7siaP/KvLP8j?=
 =?us-ascii?Q?XJde3mtbM8XuVeDLII86VVjgKc0GNSa3tVCeWDF6BbpGTspBn7fBVNYgyaZ/?=
 =?us-ascii?Q?NpCNiHXQOAZea+X72kCfoy9XWWM2n/12Am4dypeEMq1uJcpwHn05eUZ84PzA?=
 =?us-ascii?Q?1Ocx43TtDF+rnxEW9FQY/PgNLYOAauKZ+yZTFXUcxRStF3IWIeUEFpwZ0QOC?=
 =?us-ascii?Q?C53Rz9ZdVKWdvA4a3KSK78n7pPDTcPyNElV9DtdAXKG/ugWLcdvLLmJH9bcS?=
 =?us-ascii?Q?u8mw7uZhBkCWlrg8zqAZOMzFlvhpLAOpdBH2iZKxnwuMc7ILWv6inMo5GFpC?=
 =?us-ascii?Q?Hfd2qHGH4SfgcPxNefIqDsUrHN2WQKZM847tNEbjyhGCYm2fNILfu223qncW?=
 =?us-ascii?Q?54WL/Ev+SocOcOafCU2kniyr9YliV9P6xd1rXdghUJ4XjM0611sdZcpBUbzy?=
 =?us-ascii?Q?y4l4aHdartp3r/gmQxSWmTRovngpCRawd1sSRsgZBb/PWQwF8upffIDDHbNk?=
 =?us-ascii?Q?fWCaX8ESRqCjc61Ybj3tJ2q1Dg5TskX4YfPEQKZi86IR6MrwVBgFoCkVyVjB?=
 =?us-ascii?Q?HwPIxBtppAGxGcgoppJqB8yp1R8wHwgVVdhS?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?17iDAdFsPawUYOExu6eqSHVAVRGpxT+i8Dki9Qcd5fOHAlvAoqkrDYgoZy0L?=
 =?us-ascii?Q?/HOVVmkupm4Mk1uYttXQLMRUS8wzbo9DYuZu/MpSRQdFTZzxmYCx4H4Lj9VN?=
 =?us-ascii?Q?9qpbPRmZUJ4rPFIDIyRWkj8APh5gR0sXMEVG9mrMPXjIBClrTm93ABWUuJ/K?=
 =?us-ascii?Q?V/ZtUhZNqXDLilTipiOVEmJuMHqafhA4dL9XcWIZ4SoxdKkW4LuUJP2BUN1+?=
 =?us-ascii?Q?1WT3a+T84DL0QZycm8W3dTssNyqIOTe0kiQopYtf71/kDlrN7NN6t+bqn7X0?=
 =?us-ascii?Q?mQnxEjySfD3buN5Deo28FC+2I2XWp4glYfiYV9/1qiYq9hGY3ztEnu/0oafk?=
 =?us-ascii?Q?hZOVOiW3OxPH9CufjCSLquVw60IB5ad/WUQJAGaYyZm9zoR98DMKlyxTyg2J?=
 =?us-ascii?Q?epMI4Ym1Zrpl0gHmXAMo1yi4uWc+hv8A4A0Hlh1zyCsempiZuLaulEFBfZDI?=
 =?us-ascii?Q?DAX+WIbOYm1AKGCEiVWcF1Vo7bqeTqZhYPzm7DHrHd0ITrfYLE7d6W58jDMd?=
 =?us-ascii?Q?AYBNM7EcX4xJM9Q7IYhwnR2jMYBY+7W5DVooqn2VnJZWWi8Rd5+bCpzkq0Iw?=
 =?us-ascii?Q?GDMhfFjLjtqHUfV2Sm/U46rkkXVACSTiUEdIqFGHPD/vhQH8hAcTFskDCL5h?=
 =?us-ascii?Q?f/L+kyxx6o0cMnDOdnX/thPmzK5JCg/UAZe8wsW2sIIfOpnnRpnvVvBnDqKA?=
 =?us-ascii?Q?D5+xHGFfUuTb31bwwWTF2HNHnHa4DLTAPgR2X8IHt7bSzaSfwL1JYjGCSYg0?=
 =?us-ascii?Q?LbB50iEhgxzdpzqu+G/JVbqZqV/kfh5OaV3YBlVE0YZ+So3p7xb88M5gi9+u?=
 =?us-ascii?Q?pGYBQiteZJK2bLe0jw+CGQgWMg0w594EUsuAgA6qU/qcODYoB4sSgSj71jxD?=
 =?us-ascii?Q?qMDwYitM2WpWZneLgnAx8OkiqBoKJJJiB3qWxGupB+NHo2csACLNyIE5Fry/?=
 =?us-ascii?Q?S1pLv3UUwB+j0AWSUREAg9g2AtR5Tcf4e4zAgIv/tsnMLwAqBsDaINKetibr?=
 =?us-ascii?Q?+bvbjR8S80x1y50gOVRVJQlWZYcY0cNZN1jez8hcFVVsLiS5Hewvi9fZ4i6M?=
 =?us-ascii?Q?jh/H+K5rFi0UIPRH3Av/I4ojjDOYS5R9/ENSdojbHxP9pV6I8y2ZMhceU/lX?=
 =?us-ascii?Q?MAwfksw1B1qbfi79rZb+70LNMZFAQrjVTzMLcaJJtDZXdp6AlnyYAyaXpfaO?=
 =?us-ascii?Q?D3xJZwI9py9+Ix+abeFSgdeQBYcVwG8kFf0bsudFXXnuZy5aE+GnQkQ8VEJ1?=
 =?us-ascii?Q?8xeF7SJJhVT5OFG7liRL20EKQJwUfIUi/vWhP4m5MbRhMMbBRHI6Q4Gpd6pR?=
 =?us-ascii?Q?2mjmc5o+3cdCJow4/KdHlTpHNdMngw4I/uVFMduaZheelS3D8Pfn4QnRscjb?=
 =?us-ascii?Q?dL4d8+BX8mDFgnb3ydf3KKIdyNrQW9bZqSaMP9eSFHRuLR2GBWnOoGfUFyuK?=
 =?us-ascii?Q?6L9PPBJMER4hhRId0TK8MWskZrOXNOWp3hiESTmkGhGQOCZEgbgICF8emU/7?=
 =?us-ascii?Q?DUMaVfwAjUzPfgULO8bO90Qzjyt8ETTfRVUgNsENjEJKwkNX7pZ2B/NJOJzJ?=
 =?us-ascii?Q?bWOobt+V5sLdughQF7w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43386765-6228-4ea2-9b92-08de158dd71d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:20:07.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYsQYHl0CGr6vNMPOhNGzD6SqCC8YQ/zrhV1XnzPad2kHpLSKqzJ3GUOXH2ildlpz4fwHsK8dJYxYlOedm28Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11248

On Mon, Oct 27, 2025 at 12:04:38AM +0200, Laurent Pinchart wrote:
> On Fri, Oct 24, 2025 at 09:34:14AM -0400, Frank Li wrote:
> > On Fri, Oct 24, 2025 at 05:46:52PM +0800, Guoniu Zhou wrote:
> > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > >
> > > The ISI module on i.MX95 supports up to eight channels and four link
> > > sources to obtain the image data for processing in its pipelines. It
> > > can process up to eight image sources at the same time.
> > >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 +++++++++++++++++++++-
> > >  1 file changed, 25 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..eaab98ecf343a2cd3620f7469c016c3955d37406 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > @@ -23,6 +23,7 @@ properties:
> > >        - fsl,imx8mp-isi
> > >        - fsl,imx8ulp-isi
> > >        - fsl,imx93-isi
> > > +      - fsl,imx95-isi
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -49,7 +50,7 @@ properties:
> > >    interrupts:
> > >      description: Processing pipeline interrupts, one per pipeline
> > >      minItems: 1
> > > -    maxItems: 2
> > > +    maxItems: 8
> > >
> > >    power-domains:
> > >      maxItems: 1
> > > @@ -109,6 +110,29 @@ allOf:
> > >              - port@0
> > >              - port@1
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: fsl,imx95-isi
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          maxItems: 8
> >
> > should minItems: 8 because you already limit maxItems at top;
>
> As far as I understand, when no "items" are specified, minItems defaults
> to 1, and maxItems defaults to minItems (if specified) or 0 (if minItems
> is not specified). This is implemented in dtschema/lib.py of
> https://github.com/devicetree-org/dt-schema.git.
>
> Then, in dtschema/fixups.py, if only one of minItems or maxItems is
> specified, the other one is set to the same value. I believe relying on
> this is frowned upon by the DT maintainers.
>
> We could specify minItems only here, as the top-level constraint will
> ensure we don't go over 8. That's not very future-proof though, so I
> think specifying both minItems and maxItems would be best. Confirmation
> from a DT maintainer would be appreciated.

I pretty sure I am correct. please below thread, I met many similar cases
before.
https://lore.kernel.org/imx/72c29785-eb7a-4cc8-a74c-3aad50129a23@kernel.org/

Frank

>
> The fsl,imx8mp-isi block above should then be fixed. It currently only
> has maxItems set, minItems should be set to 2 as well.
>
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: Pixel Link Slave 0
> > > +            port@1:
> > > +              description: Pixel Link Slave 1
> > > +            port@2:
> > > +              description: MIPI CSI-2 RX 0
> > > +            port@3:
> > > +              description: MIPI CSI-2 RX 1
> > > +          required:
> > > +            - port@2
> > > +            - port@3
> > > +
> >
> >      else
> >        properties:
> >          interrupts:
> >            maxItem: 2
> >
> > to keep the same restriction for existed compatible string.
>
> We already specify the number of interrupts in two separate conditional
> blocks above, with any else statement (for all but fsl,imx8mp-isi first,
> and then for fsl,imx8mp-isi). Both specify maxItems, so I think we're
> fine.
>
> > >  additionalProperties: false
> > >
> > >  examples:
>
> --
> Regards,
>
> Laurent Pinchart

