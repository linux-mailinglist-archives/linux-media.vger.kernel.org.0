Return-Path: <linux-media+bounces-28926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55701A74C30
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 15:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C792D188B21B
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767951A9B34;
	Fri, 28 Mar 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aJVsTYm6"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFFE171092;
	Fri, 28 Mar 2025 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171253; cv=fail; b=hc2llCBHUzfskMOROGukH/jx0W5vX1ESxHDPRnZlNgKz0UcvlE4OapjPGOF19M6lR9ifVHElLHs2KsI5rmB19TPkUFJ7qO8/w1DZyHsoqgDDXG2t1MTM01bUaMusf1ySrmQXu09D4Ej85lcCq+preF4AafFsg5JKVgkO57nw+Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171253; c=relaxed/simple;
	bh=+rDdIoF79coZ8Q6N4JiyzWHoZXh4feTCdamsJefm1jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iM3NBYilcEj5Co0ADSuLiUhbxtAhm6ypP2yGwu+B4DoeWnaS/EVIxnjSbNgvNnpt4mzcZ5TlP7lZohZDH6uFVgrlgpdXzE5MCe2J+r15svpXnihQ+UdEy5ohpa58e7d9ddJan6nkA98VH6V4e4nL5TlnkPwJX68RPjWy8QaT6QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aJVsTYm6; arc=fail smtp.client-ip=40.107.21.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dea56snIaykvuIdHglCI0/9p7/28gi+v+NsI51WAwLpt1pXLWIez9tAUCFgHSWcV/OhQ23jElmNA8Vh7X/Jr3Tk09FGgMj0OJsVrH7EG3P1pBspFIJEs98nMAX8aGM/AE2Q8sMDZ90iDmO99b0sXMeMttzfK/QAJIrPDyFGklRWHhIO1B1rpt3oHKIBsTdmkcGsQpdRuocQ1eAuaV9MMAezrwi42zncGqx4wyquNOSnFvdWTqniGcM6fJc9N4x6neCgeBXg+Ryulm1UZmr84qVCqSU0+yPSZBZZJCSUC719uII/QJwIrRotwczzi0avaO6aqsljKyApg4mKP5ZkZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftyQmTH1OU1iUMJG6X/bYyl5Q92L8FX1HNvcPf/m5Xg=;
 b=TDzS95Sq3E8B8DkL3PMRHBAfrzAeNLN2w4uqS0/p++g+O+iIDeK23lSKyvIRNAMmJnWm4YzzcNzfRSUeVviWDVB0kB+pvSx7onanBjo6TwPwktD3vkiV4QqOu+WOfRe5YOprDQEcgCyjIz63mfzLPWtQB252OqbWj7T5/1Unhx9xUZzxisN2vNqFJ+c2pVBg5HxNFqFDs6sELgx6u573q6pTn7O1YfeYAmc+gWGzd2fKv2nfpRNPn5z/314YVwTiz58SxYI2PS5HL5JJ3FD237MVw9V4XZrJSKE8YW001VhZTMyPFOtBbtQ0yPVvnx/uVXJWKQT8cZsAinpCTy7e8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftyQmTH1OU1iUMJG6X/bYyl5Q92L8FX1HNvcPf/m5Xg=;
 b=aJVsTYm60YxydaZ+FdVi4vQ7E4G9KLBb/1ZoraO3qstdE6phYnwiNObzIP5Pxmpq1V4n0IuCNkwX0jzYLNNxv0N7yAZ3H2gFr6swlZZAl6UpHsipqwKAuTDirQ5Gafes2I9zxY5LePAm//l7ZVCw1JuIYRRuP7CaA/c3hliVwCny0UnJx3+hFlk8rlBGGEZ+EqwMz5vj/Njf7EWVSVcbDpxl4rB59uXo3PXnwXg8pITnfa2uPA2sSqZ8vPn/fo8TIfd9r8lNbXRmBDjO6e+a19PNeT9YRrVyI9IM/v5uZdaeqqAVbPbe444mzSJesrJtepITgcQj2nndTWDIg4FmLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB10246.eurprd04.prod.outlook.com (2603:10a6:150:1be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:14:07 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:14:07 +0000
Date: Fri, 28 Mar 2025 10:13:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 05/12] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Message-ID: <Z+auow/gNh/5XKKU@lizhi-Precision-Tower-5810>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-5-324f5105accc@nxp.com>
 <20250327201124.GI4861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327201124.GI4861@pendragon.ideasonboard.com>
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB10246:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e34368-13f0-40ce-ad6b-08dd6e02cd49
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?mR9ou0kTXqzK5mOYG8RtX/QrKPGNtW0dvXJShxCIILia2cXaAWrIbNvFl/B6?=
 =?us-ascii?Q?cGmqd9U/uvOHb+FUCPzWY4s7IolEkZmgldGqexWWqGBEB5TlfgCTXiyFbPm7?=
 =?us-ascii?Q?Sikdc5Z6h5udLrEpFmG9m/rLUPKCpqJLXrxaHJ92KhLzi90NYqIZAfSqK5oK?=
 =?us-ascii?Q?NICLZqgM/EaJymBWt58RH0FQvunVN5XRi3VDsDzt/42mNpKOQrGCdG9+hVcb?=
 =?us-ascii?Q?UJqNPA25JZMKaGCYpcdAthLKL12PSGGK3QFbOpteoVAvmTP8IYVMgjgilkom?=
 =?us-ascii?Q?ZGh9z0osasoE1c/n5QuoPwc0mtv5rUa22fe0khos/bQ2XMDEtVLRl04JUxZ7?=
 =?us-ascii?Q?NDOQPy+J/tmUyEjl2fTI+Vg5kuSHl6Yqp5RiafycC6hBCgTepeqlig85d8C5?=
 =?us-ascii?Q?4+DiLXCtMQ9/sgFWyg3efpQkbI8ljRNLKTE5Vy6qsqDD84tlogv7OZS5zOai?=
 =?us-ascii?Q?lLCJEr31X3Ai2Nurauk2YqGq0s1UOHkrP88d2fALWjRwqHsAZrCc0rYqzsJA?=
 =?us-ascii?Q?n8hmTNQsmUxmlGDL66ON7ZzMDLNXy+Ga+RVSabWFRveTyJMK/QMCMJr6Itmz?=
 =?us-ascii?Q?P4s34Gr1wIYC4AFUy8YwS0yEFokyalbbqkWUemy0WruP6j1MCSXGYQCK6Yeh?=
 =?us-ascii?Q?udoi4dWQKgIs69FKIZsAebit8fMaGJEE5zH+dTE3rGohoKL/bIDTOgnJTgN8?=
 =?us-ascii?Q?cak9WtsaYNSOReBQQyUVMaMzJ1zoui7h2qmEpT3OSWiPaPCYEY68DcYpWCET?=
 =?us-ascii?Q?Zh1G2O5x+B1m7zpmG1YhzFD8M7wXkM+6sTjvARENX1hQXMGo75K4mbQAys3P?=
 =?us-ascii?Q?BCrCHEY6ZO+jXKeHDbeNbuKvK38S0yrSChhMJE1aDZxmp5wholm/TxGDXTxu?=
 =?us-ascii?Q?0jcs9Nseic574SPAYYLDOnXREDzulPEdqtRA013+1Dy1OUHmB/uRKRH56lNy?=
 =?us-ascii?Q?uVBUyoMU9bpsd2loAgJywI/HIIpoNoeW/98LBfnxTOeaDvrXh9Sxb6K0c5nX?=
 =?us-ascii?Q?9HABLtk+VDw6ip9oobqkNUt0MSKFzdJoN1drVtcn1BQJ171KNh+DBcd10sIJ?=
 =?us-ascii?Q?GETf25RHsqD2wcJiTbke49HVgyIJGcWuhPqJ38PDVYibej7EmChneWA36rgE?=
 =?us-ascii?Q?GCeder7p+8Enk4g/UHcaZHBDliSA45N1FHrMwZ/I93OYWEHwqM11CmgULFeR?=
 =?us-ascii?Q?pacq1GJu+M0KnV9cKEQjypMa5PYu151mLc3p+Y/qepRZgF9D3OW5JoV40+WB?=
 =?us-ascii?Q?AMYvtW0/PQ+5JwrIcLN6C9PlGFAkYzAtqx5DWD1dMlwr8W6mXlWyAyXzxxq5?=
 =?us-ascii?Q?WyHMGUdkByb9U00LYyYq9X8JIdh/z5/zIVzZtayxHfythR8G08p4usOKloNd?=
 =?us-ascii?Q?AHfVSQS3qmxNfPwHdvl/MG62fovcnGLiM88P1dFcbYzjgifLgZ2b0fk2mkLu?=
 =?us-ascii?Q?4zg+lf6ZbrJJEVCknYzcd64LEFpsd6bX?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?doDQfTJOMoOWps4mDoWAnzYKHtNDzxAKHSKp2pjZIUXXj+0iipaQUDMBBGRx?=
 =?us-ascii?Q?M3Bo+urbRvSFGMXWbmO7hlrmOiaJI1Q9eQWEbH2q4qDwAyc3XoRSl3ZvyC5V?=
 =?us-ascii?Q?9U9XmUlPeYO2hA/gkdr2hAuF1Ctief/Vwl+Tcx3D33Hu8bdi2Jnp3dca0zNO?=
 =?us-ascii?Q?w2tH1IF+kA4fY1H+6ZepLkdLGkm929Xj7bpgwpHqMWdwzU+o03yVD7T2RvKR?=
 =?us-ascii?Q?eWvoJxIaEsjVfU66zKK9ABy9Afl7F94YfE6gxgO9l9vYuYBVPXJ5UrzdYra4?=
 =?us-ascii?Q?oP+RMCorIurJF76ysxAo9GMsOpjRooekKK5N6hdAcYRMb9X8Rd9+eHrnFjvH?=
 =?us-ascii?Q?VFMgvupfJY8DmNNx2cRg5vBY78EXau+eB2HmoBbxUtL+JVVgGxLFQUYuTheN?=
 =?us-ascii?Q?H3icMRZjZyr8JpWWqVsUruc7a7DTkcHQuEed1vRWx+JoLpPkL9bJMVr1N4ZC?=
 =?us-ascii?Q?wxfk51eR9vZs2zXHlVRhMu7agdoL7ewo1wAc9jz5Cdaine4V/ArKOrwPG3Hb?=
 =?us-ascii?Q?nRgH56Uq+YvC4ClE8Vp5Z1tIsqKNx2M2ZEKgXZsfwitfmlItaUzvVi/qIPr/?=
 =?us-ascii?Q?a+1vQKPZHZU39HxRCiHqxEgXo5815cK0G2HtOwSX7kPcwYrfSeNEzj8ieMv0?=
 =?us-ascii?Q?u5Qs9C4JcHgbln+PBZVLR9ZTdlR9YgGB+W3ZAk2qHGa+HSQR1A9Y76yBqAwc?=
 =?us-ascii?Q?nA/TJhO/hae3CI79hyh7x7ro3InVzybxO7GSbfCuRBnrqrKe0qQIoP3zkG8Q?=
 =?us-ascii?Q?0y0D4OM0j4tm+YGfj4BXb0MGYX9/niuRK42bhNbOcXzkUZfDVPLWp9yIWmVJ?=
 =?us-ascii?Q?rkCmVusUasgdbaVX6udhDF8/d4Lb+j6lqA+ntR1g0B3fbAoIDAsVCMvQEgbs?=
 =?us-ascii?Q?/mX/aZ/SDMByrPc6RQoPlvCAfLwW6fpRStkV2B2aJ/j9m1xKk12J5EbmQhEz?=
 =?us-ascii?Q?9vWK0BcE23qb3Z2UCLnGlNstlpVVfFmKHxHEXhWLzjkmGxYBgTeU1ylUMmGw?=
 =?us-ascii?Q?NUnldXgGkuybMJFMx7DCScPiAbbRjMD4cRgufc5M9wFC3Wokc2sfblhv1Tow?=
 =?us-ascii?Q?Mg++qbnBOqMrsL3SlXxlP2lckEn4cn+YFL0sdXwDjQ3Y0DVQ/06zS/mVQHUC?=
 =?us-ascii?Q?KYUYga6AS5/vVAN/l804IlaBSEcJs9rxXTuJCTqvCyBuzO5Y+1msTIiG3J/Q?=
 =?us-ascii?Q?CL18NPGsx7L5oXzpHgij9vLuix+Fs2W8hyO0oetC/4Zdv6NzBMKzrrKT25a8?=
 =?us-ascii?Q?c2ORxZ0QJCYrEtQ56zlZF/q7RvIizNx6v3I7ZZvbsI1EqYkyRq8Fz7ylw4Zo?=
 =?us-ascii?Q?zQXUTJF5x2XxiN+aymCzTaVGK+KvNcNBLsDQWFK0kgbmbjtcFRpWvIXYQuMe?=
 =?us-ascii?Q?bdNVQbuNBC8DJWYFFNukXjamPEHZB6rSrfSCADIlJZUB/krmBchs2rbgFe9z?=
 =?us-ascii?Q?Z6s1PiR3AcveOO81IVQ0msQLll42Wqpn+14rYmiPCvpmNX7Vcm1LL8IiX5NQ?=
 =?us-ascii?Q?sUK9SMgFA2lxGzqiaw0cYjumxU2B+GF/P7gFXTmW++mbknAEGiktHu5T91yh?=
 =?us-ascii?Q?qQDPPI9GOxO9dK7m2E1Pt6hMF070FtJyPbBvCzRs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e34368-13f0-40ce-ad6b-08dd6e02cd49
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:14:07.2624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9xp/MNVYNu3Xg4haf6Uruy3lQFR2n7m3u+9UgFOpbktZfwDzhQPSSPXl3zX5GGvcZk1yhfNdZQ25OpbhrmKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10246

On Thu, Mar 27, 2025 at 10:11:24PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Feb 10, 2025 at 03:59:24PM -0500, Frank Li wrote:
> > From: Robert Chiras <robert.chiras@nxp.com>
> >
> > Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
> > There are 8 ISI channels on i.MX8QM while there are only 5 channels on
> > i.MX8QXP.
>
> There's a discrepancy between this series and the reference manuals.
> I've raised that issue in the review of the DT bindings, let's discuss
> it there. I'll skip that part of this patch for now.
>
> > Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v2 to v3
> > - none
> >
> > change from v1 to v2
> > - remove intenal review tags
> > ---
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
> >  2 files changed, 49 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 1e79b1211b603..a3237d76f7aa5 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -274,6 +274,25 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
> >  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
> >  };
> >
> > +static const struct clk_bulk_data mxc_imx8qm_clks[] = {
> > +	{ .id = "per0" },
> > +	{ .id = "per1" },
> > +	{ .id = "per2" },
> > +	{ .id = "per3" },
> > +	{ .id = "per4" },
> > +	{ .id = "per5" },
> > +	{ .id = "per6" },
> > +	{ .id = "per7" },
> > +};
> > +
> > +static const struct clk_bulk_data mxc_imx8qxp_clks[] = {
> > +	{ .id = "per0" },
> > +	{ .id = "per4" },
> > +	{ .id = "per5" },
> > +	{ .id = "per6" },
> > +	{ .id = "per7" },
> > +};
> > +
> >  static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> >  	{ .id = "axi" },
> >  	{ .id = "apb" },
> > @@ -334,6 +353,32 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> >  	.has_36bit_dma		= false,
> >  };
> >
> > +static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> > +	.model			= MXC_ISI_IMX8QM,
> > +	.num_ports		= 5,
> > +	.num_channels		= 8,
> > +	.reg_offset		= 0x10000,
> > +	.ier_reg		= &mxc_imx8_isi_ier_v1,
>
> Are you sure about this ? According to the reference manual, QXP seems
> to match mxc_imx8_isi_ier_v2, and QM doesn't seem to match either v1 or
> v2.

Thank you for found it. After check old code base and compared RM, you
are right, let me fix at next version.

Frank

>
> > +	.set_thd		= &mxc_imx8_isi_thd_v1,
> > +	.clks			= mxc_imx8qm_clks,
> > +	.num_clks		= ARRAY_SIZE(mxc_imx8qm_clks),
> > +	.buf_active_reverse	= true,
>
> I'll trust you on this value, I can't verify it.
>
> > +	.has_36bit_dma		= false,
> > +};
> > +
> > +static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> > +	.model			= MXC_ISI_IMX8QXP,
> > +	.num_ports		= 5,
> > +	.num_channels		= 5,
> > +	.reg_offset		= 0x10000,
> > +	.ier_reg		= &mxc_imx8_isi_ier_v1,
> > +	.set_thd		= &mxc_imx8_isi_thd_v1,
> > +	.clks			= mxc_imx8qxp_clks,
> > +	.num_clks		= ARRAY_SIZE(mxc_imx8qxp_clks),
> > +	.buf_active_reverse	= true,
> > +	.has_36bit_dma		= false,
> > +};
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Power management
> >   */
> > @@ -541,6 +586,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
> >  static const struct of_device_id mxc_isi_of_match[] = {
> >  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
> >  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> > +	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
> > +	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
> >  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
> >  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
> >  	{ /* sentinel */ },
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 9c7fe9e5f941f..496cad3f9423d 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -158,6 +158,8 @@ struct mxc_gasket_ops {
> >  enum model {
> >  	MXC_ISI_IMX8MN,
> >  	MXC_ISI_IMX8MP,
> > +	MXC_ISI_IMX8QM,
> > +	MXC_ISI_IMX8QXP,
> >  	MXC_ISI_IMX8ULP,
> >  	MXC_ISI_IMX93,
> >  };
>
> --
> Regards,
>
> Laurent Pinchart

