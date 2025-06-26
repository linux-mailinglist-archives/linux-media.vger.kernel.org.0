Return-Path: <linux-media+bounces-36046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4990BAEA977
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 00:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDA65600D9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 22:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CAD261581;
	Thu, 26 Jun 2025 22:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XKEpTVHL"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949715278E;
	Thu, 26 Jun 2025 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750976255; cv=fail; b=sXQARTE2756jTl/3cVYifundGMXb8F8EozYVub8M8PDiTREABkPaV1MWlWma91FCN1eOFqGNZkSsQgf3i+qs8YAce4jLyBLFzn0Y2DYwsInGehcsua7c0bFuZZEqRuZ0kosCTTP1pHCvoehw+6ww0e40mLcf6QAKDkJb45GgqpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750976255; c=relaxed/simple;
	bh=8dftbfOeZdEd3kH5vdwb6gllDd7kceEg9EP+m/3bseM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EjaZY/oc0GRpu9JmmgwkQnTriX+AsI5+3/+fBh3PzTb34AW1hpJQQUeUg1ktNR+54TV7xKEZdzBVjrXrPIO7pf4Tio/anCMPNmwjQRnbnQmvhmJEMpzEVfquXCwvpcQN0I+yUUuKfTS8egGQr91MnYO98fReHdby//oqdiqMQTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XKEpTVHL; arc=fail smtp.client-ip=52.101.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vooPderr3imHb8gXCPZ+4ZSZjyfFcgqvS9jegbpspB5zdt4xvpXj05wWtULLYHsurVSA6+6lZ5+aT/+RQ8Wtkwlb1Ckl3nNhiINiLzo2xYN0KmVPLJQk3pd9fuUm8uHdZ+rbAQBLg0woNp782656i0yUsMNpWLO8eUaJnsKJr2jtOvK6FTrrahAF5naHLu+TQcl2ZIgQkh6FHO3zBqJ9B44Q0KvIOKMxzXHP5uq4haHp+m9AZgqwYMR5gfM31incc31VHTfRMLqm4gUNelROv2tvAQeEj/UONZ2c6KY60gvmJh+OmJPJeX4l6dksxV5Ue5ez/zbMV2dmYf5zQXc9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=figoTJPyV/p59ly25DYI6SfKMrYNK61OSOSTKWdVJzk=;
 b=nmgcJqiq0vdU7LsNBKmZ8zUVafAuR142Dk3GZN2bLF5br5EmUIE8RkvRqBXkO2j2zb5J+lhl0KnphtyYL4px74ScMrb1ih30WIZTtsZCG2Tyc7bc0Hjt+56TgNAToaDI7fUygT57SId539egwS6PyXDIb1/+YxAsHrbrD1QsC65Bsoy6yLC/GciQ/CEDK4fe1wmcY0cCChrCWk38HumXYya7OC8JiRzu9gZhrLUG6PHkAb/sBgQ8u0d7Om7oj1Pt/2K9EM8gsPPIWah9eipXlLSpe1KvRZUTNmeND9NNs4d20YOx6tTIR9EHIGATp35oZWcIgXDGF1+D/hCoAEof6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=figoTJPyV/p59ly25DYI6SfKMrYNK61OSOSTKWdVJzk=;
 b=XKEpTVHL7aYq/vT36OFLzSmu4iXywj6ebQIqLo+uZQrTH8/43X+O6z+B1OvAEZhe6OIV6KlShDWMhNdbuztepQoNsiY3l5RBa+iDmRkN3CCyQzgyWU6nJOovw136XcKdPVG5o+8Sqx0Fm17Jw7Gu2flyM9HRMCwvmsYqDIUaGX9JkKA9ewaaWDfdr4mH5hxLUJZNKkcRXsAHbMoUlCiyne+2/Tx/7v1+TenyiW2BUEYlKvR3n7GLaCW3v5Lr9Bj0aJVvJoK1TzPJwcNai+vn/0XUsWdVpo+/9QM3PZEVFYM0/nn9H2a+j86mkFhYf2bWLgkQN/MPt1MBhAIv6g5Gag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9354.eurprd04.prod.outlook.com (2603:10a6:10:36c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 22:17:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 22:17:29 +0000
Date: Thu, 26 Jun 2025 18:17:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <aF3G9LoVOqPcQXLR@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
 <20250623224701.GE15951@pendragon.ideasonboard.com>
 <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>
 <20250624185643.GE20757@pendragon.ideasonboard.com>
 <aFr6Ehpl5Kk+nt7m@lizhi-Precision-Tower-5810>
 <20250626124224.GK8738@pendragon.ideasonboard.com>
 <aF1gKGjpbEPZYBr2@lizhi-Precision-Tower-5810>
 <20250626190922.GC30016@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626190922.GC30016@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c3af09-74fc-4db7-3a57-08ddb4ff3d0d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?OC0EaYb4tdB/4S/0znInswE2q1ywbQNGRDc8250GkaZcPLTw9lDF0oD66F7D?=
 =?us-ascii?Q?TwkPwwcZPaPzzjbrKrRAatDactXt+/AswPoKUJUVzWzweUJP3BGRKqlLd4w+?=
 =?us-ascii?Q?M0eHmLqLAVzgwCoIxS/QuHDkQf45/yIUG9xr4qdBIixt0hq5hKFua5+V2Oe1?=
 =?us-ascii?Q?wSfE2QRMXc0OHvNUsBSU2P6UVG0K/pPt0hLenaeM2vM2sN7LS9l9HkPC1oaL?=
 =?us-ascii?Q?d7WSWYd6un+h5SYoBWFnCvu3lCQnBuLXMm/zBE9Pp3HDq98ffwWBbQkmc7Vz?=
 =?us-ascii?Q?CYWVOqcKzWRcaXRAE6+lQu+0hufn4tSSFbcC/+2wrXQ8695MQU7JJWSqMi/O?=
 =?us-ascii?Q?NlPQd0qJLF7vmnM1JZPqh1v+TUlivXFM3DWJTRYjtS3baK1d6LD1Gasm6Xf+?=
 =?us-ascii?Q?t+JxGJ5L2hmrpWSY4kRPitYcjOGprPuffHlRcFMleEpHc895KcSoroSb6jV7?=
 =?us-ascii?Q?nBpomkg0KP4/oHBochCj5CsqMllr/iRy3ZgVPGBFrwro7F6KYQud3lzGtZ8b?=
 =?us-ascii?Q?WzjRRlQeFvY/lJR4zVI1VsR3929vwgNjLXgnrgrSYe8f/AB4Xu8/vgITNAjw?=
 =?us-ascii?Q?Nj7/JYYiUtEW3gGot2wGd+WIGXfK8rfAjnt4sci7llmL1EA7xkG7EJBHMusG?=
 =?us-ascii?Q?QTwhFzd9q+29xXqteWKdTWJY2kFdbS8ar/eNww0Jg6mr0ZARsWT+2Sth5Qw3?=
 =?us-ascii?Q?CuSM9VBPbfOE7L9dOKpkw2qKQ6uDsTxoK1dROvgKi9L5SmWk+M3BB5rB9I/C?=
 =?us-ascii?Q?1xmigpCCY1i3HwAXJAwZM0SOaB2P1Ullapvt8KBTRE27Y6EdiIrY5jFt1yO2?=
 =?us-ascii?Q?gmlbXC2sn3KGnSIYaOIoXGX7yG+gX1E4GCog6vHzJByV3Vab+6hXSCt5p8Go?=
 =?us-ascii?Q?vncWin498HsypIVrEM9j6iTiyoTsbKNMmFVkVdw27yXvXjMkMt+F2QSuGLq2?=
 =?us-ascii?Q?eCRN/4H+nLNXbKfoGVeJCgllcUZ5V8mAN9LmjnTfEU3mGAim/O0hF6BNpo4D?=
 =?us-ascii?Q?D/F96wBU6Rd7SWn+Sk+tH2RM74PTCEngOX+sSi+fIwOVqbrZ7T3Xvoc/FTv/?=
 =?us-ascii?Q?dw+MnJVfc2Hh7djsIM87/e5h5Pjjbht5ipEZi4J4sRQtICYdqW4KKARMpw9y?=
 =?us-ascii?Q?e/cCS7WmQ/HBe6CMK/oMBUmkC7YMCrspfYE1wCxLAdzBGd42uVbtg1HxKr6G?=
 =?us-ascii?Q?A9ju3qn+kxJebGiX3VyUqGcZP/Ol4fJ+Mep12APO07Kk2SmSOBBpMCFWex8g?=
 =?us-ascii?Q?68TiB2IU6NbhKuyqZPM4kW0QBFCirAu3w3xwr/rM34/wsmGO0FQdjGZ7nHg8?=
 =?us-ascii?Q?BOlI+okJCHjJb+SVSwVOwoerwqqdTodUTEGtOHMMA4jumkxYxfj/mMzrgYWq?=
 =?us-ascii?Q?cQqnvH2J4gTNK0JVhQSA5ZPdGZ6xJt2PQrfW3X4TWmKPRZFPZErODeWnomiA?=
 =?us-ascii?Q?NcoeuDCzp00HpMgeTxHbtQfd8YpO5Q70+w5z4oJNBlz+a2bYcQS+5A=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ML6zqQV4muUpksjD1aKx4Td2wjI33/zN+qx4Gan2ynGiUdsVOeURfmiAUjaz?=
 =?us-ascii?Q?PWr/TX/Hy13iqyppvgTcEZS/PxLPeYu1dwmM6HMU3/Qd8NDIfN+LcbZ2S9up?=
 =?us-ascii?Q?8fG8OcaDzcgXaqqijevmzrOGHJRFo/GcW3uIIFOP79XZoE+h/u63okvO3Kwp?=
 =?us-ascii?Q?KEw/AcLHWytu0ntce27XrXSnPxiWgs7PwQ4ln4h8lSmkMB4/FtWplljVtQcY?=
 =?us-ascii?Q?pJYCZHnv5RweIioJYQPazOL2jVz9+W7v8xeJES2F8RZI1tqKyGWmJi2iBHyx?=
 =?us-ascii?Q?trqkMLcneu0W+XtoTeXOE8ZXGXvkrpyWfT+tLCXfDeiFxB7/CG0JM/U3KbRg?=
 =?us-ascii?Q?n/1Fb/uiUDEGkyA47DS++e3IQANEP0YmYumrnd8SNydCgUwu+GH5D5illH0X?=
 =?us-ascii?Q?kiNRm2uHZ/9mO4NBIoQ0okw3/vgyNCULPCKesBX/nmEY0o+y4QMN+lqAosyc?=
 =?us-ascii?Q?p/Ywn9tlOM/3SKc2NOMS+1uPa1pfyoBt7iVM3VQFOW/Ixu5Z77mgu5xAerM/?=
 =?us-ascii?Q?cAwdJLto3VJj5OvegblwYon+JUKPbtRuD5wUMfdHV3w+CCHZBsCJ+IrT+meq?=
 =?us-ascii?Q?v90TGDzAAzbUMIMI9DSkV3f5gYF/NX+M8quVFPbzCWsvF3dSRO9WoJTanQ31?=
 =?us-ascii?Q?nEEUN+Cs+B0odmZUYOjkhGSiSKGF0ABDyFtL59tqA7P2UYh46TOaC/GRTIO8?=
 =?us-ascii?Q?R+xq4lj2pJ+m75izdlWEIKqz25N7HvlOmWKGoZ/HH0NOCwvNWf3VIzQLqPPj?=
 =?us-ascii?Q?Kr26ANxo467L4Ycf2lBj8j3/ebQO1aL1xvl5sAE93nAivNAFH0Ptv4+iYPzZ?=
 =?us-ascii?Q?nzbI0H2ZH3O5VXaaekqrnV+FO0WhjRpopUAlZLndSi2DVDcPWb0rDk1F8uF1?=
 =?us-ascii?Q?5bRPqC8uKPwGVG8kOYYIl32DLvXYYn6Tn3E6+I3YNBy0qD2OH0if16R0iTjA?=
 =?us-ascii?Q?AsCJ9++qb65ny5PlYQhe13qxwWWj0+f9ViO8jH9WFU1M1uYzjQ/i2iGS+7P+?=
 =?us-ascii?Q?0Qc03JY7KZ5r0JmgjS2lBDttAl2briVu4rz+p986gusZiFwvM8xL0zkP3g/1?=
 =?us-ascii?Q?Fa81NXbmAsdk4W0hNDwVeAk9vglEgMKa9GjEPUk3lVtaZvMfYqRkl54GOpu4?=
 =?us-ascii?Q?7LQr+Vq/IVUxIG5XFdFv8BSSx64XersTqFKbj9WUn1VVPAhm3KDVbBcwFQ81?=
 =?us-ascii?Q?NtaivPK+X+EwaSntnN2jrXzBNsxQcEBupvYQQDf3NJWjdrW4xahT3xlKWkhC?=
 =?us-ascii?Q?U6mu8n/6khRNBtaJ/lqf8g/nCcFm2onimK+10aqJ5ZtDRRQIOXCD5vuVvz7F?=
 =?us-ascii?Q?9lFXqwHIJ8htBcc0bNUrFePt7RTuM1nEDBwYra5HT5PIIA7CLh5S5Ua+H2Zd?=
 =?us-ascii?Q?JggHRICYzOUznxSn/B3yJto0xl1fBJ0vSCrtfyFEMXVbN0fn9swYGc52nk3a?=
 =?us-ascii?Q?12KB83hRZeVhfL9nW42tnNBnayhHlhNQ7IFZo5egvmmvYD97tyHJTaLUtaHm?=
 =?us-ascii?Q?1iXzsnN0sG5EbN6V4KoyXIhd9+U18KtY4YIo9RW4uHb2BN5g6clh/WsTWvDg?=
 =?us-ascii?Q?9u0Ny3QRXRa+RvUatg9NNnVtngJD5dk6LJi63l55?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c3af09-74fc-4db7-3a57-08ddb4ff3d0d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:17:29.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J9wvmBxY/QrwqTt11Q8AJdwyDPbHFeu3zk4bQD8OngsRt7cOQl+jxdIA0MY4x3L0Wm45uMWsWO87GLWkb4yDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9354

On Thu, Jun 26, 2025 at 10:09:22PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 26, 2025 at 10:58:48AM -0400, Frank Li wrote:
> > On Thu, Jun 26, 2025 at 03:42:24PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jun 24, 2025 at 03:18:42PM -0400, Frank Li wrote:
> > > > On Tue, Jun 24, 2025 at 09:56:43PM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Jun 24, 2025 at 02:47:10PM -0400, Frank Li wrote:
> > > > > > On Tue, Jun 24, 2025 at 01:47:01AM +0300, Laurent Pinchart wrote:
> > > > > > > On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> > > > > > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > > >
> > > > > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > > > > > > AP1302 ISP supports single and dual sensor inputs. The driver
> > > > > > > > code supports AR1335, AR0144 and AR0330 sensors with single and
> > > > > > > > dual mode by loading the corresponding firmware.
> > > > > > > >
> > > > > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > > ---
> > > > > > > > Change in v3:
> > > > > > > > - add extra empty line between difference register define
> > > > > > > > - add bits.h
> > > > > > > > - use GEN_MASK and align regiser bit define from 31 to 0.
> > > > > > > > - add ap1302_sensor_supply
> > > > > > > > - add enable gpio
> > > > > > > > - update firmware header format
> > > > > > >
> > > > > > > One of the main issues with this driver is that we need to standardize
> > > > > > > the header format. The standardized format will need to be approved by
> > > > > > > onsemi as we will need to provide not just a driver, but also a
> > > > > > > toolchain that will produce firmwares in the right format. Furthermore,
> > > > > > > some time ago the AP1302 firmware was extended with the ability to
> > > > > > > dynamically compute PLL parameters IIRC. This needs to be taken into
> > > > > > > account.
> > > > > >
> > > > > > It is quite common when work with firmwares. Generally, it need version
> > > > > > information at header.
> > > > > >
> > > > > > The driver need check firmware's API version, if miss match or incompatible,
> > > > > > just return and report error.
> > > > > >
> > > > > > we can't assume firmware always align driver code because many user just
> > > > > > update kernel without update rootfs or firmware package.
> > > > >
> > > > > Sure, but that's not the point. The point is that there are multiple
> > > > > out-of-tree ap1302 driver versions, developed or adapted by different
> > > > > SoC vendors. Those variants use firmware files produced by those SoC
> > > > > vendors, and they not standard.
> > > >
> > > > I am not sure if firwmare is open source. Most like not.
> > >
> > > The firmware is not open-source, but I don't think that's relevant.
> > >
> > > > We need create
> > > > difference compatible string for difference Soc vendor.
> > >
> > > No, that we must absolutely not do :-) If it's the same AP1302 and same
> > > camera sensor, we must not have different compatible strings when the
> > > AP1302 is connected to an NXP SoC or a MediaTek SoC.
> >
> > After read code, firwmare header only used for sanity checks. can remove
> > it for initialization version?
>
> No, quite the contrary. We need to standardize a firmware header that
> will give us forward compatibility. Versioning of the firmware is a
> missing feature for that, and we also need to consider the issue of the
> AP1302 clock tree configuration.

How to move forwards? firmware is binary and not open source and we can't
change it.

Frank

>
> > > > > We need to standardize on a firmware
> > > > > format to upstream a driver, and that standardization needs to involve
> > > > > the device manufacturer.
> > > >
> > > > we need workable version (easy extend) firstly, when let other vendor follow.
> > > >
> > > > Frank Li
> > > > >
> > > > > > > I want to resuscitate this driver and get it merged. There's more work
> > > > > > > to do, in collaboration with onsemi, and I haven't had time to tackle
> > > > > > > it. If you want to propose a proper design for firmware handling I would
> > > > > > > be happy to participate in the discussion.
> > > > > >
> > > > > > who is onsemi contact windows.
> > > > > >
> > > > > > > > - update raw sensor supply delay time
> > > > > > > > - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> > > > > > > > - update use latest v4l2 api
> > > > > > > > - use ctrl_to_sd() helper function
> > > > > > > > - add ap1302_g_volatile_ctrl()
> > > > > > > > - remove ap1302_get_fmt()
> > > > > > > > - use guard for mutex.
> > > > > > > > - use dev_err_probe
> > > > > > > > - use devm_add_action_or_reset to simple error handle at probe.
> > > > > > > > - use read_poll_timeout() simple dma idle polling.
> > > > > > > >
> > > > > > > > previous upstream:
> > > > > > > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > > > > > > > ---
> > > > > > > >  MAINTAINERS                |    1 +
> > > > > > > >  drivers/media/i2c/Kconfig  |    9 +
> > > > > > > >  drivers/media/i2c/Makefile |    1 +
> > > > > > > >  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >  4 files changed, 2849 insertions(+)
> > > > > > >
> > > > > > > [snip]
>
> --
> Regards,
>
> Laurent Pinchart

