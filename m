Return-Path: <linux-media+bounces-25645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F405AA27695
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAEF13A04DB
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 15:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA6A215170;
	Tue,  4 Feb 2025 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nekcjwj7"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8F20D4E2;
	Tue,  4 Feb 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684573; cv=fail; b=kULYBHHSyXfwhznLYk6B+2gnlpvkRAXs8UW196ycJQ5eV1lum0zCOdHWI2siWoU58vicmMeT4LynrrGkGatR8k5iDLAeOHuoReQz8rQSSuuJMxg02DWWr9TNcXmp/kVPzX+dxL9CNJruEhM4pLHXfV0SFWu5WWtKlTvN1Moa6+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684573; c=relaxed/simple;
	bh=0fS/JDg1VtAoe1Gl+c7/20adcDRXCI+DeOtNcL44Wec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZdWQ79VxDi7scpuc4bjnd3aaIlH29gAAW436pPrJ1uM+aFYACgua3m3qOUEHc6eVpFDvTbd1VcDd4hWti02QLx/3672wiulqCB46u3e8APxBvAZRJs7NLnhUJGUZpcBLV0flWuQ6dyTYbokPeP9hVxlU/6NCWEHO6moQwgaZ3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nekcjwj7; arc=fail smtp.client-ip=40.107.104.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa2fHJs2wvLN+qRShDwHV/wvEfb6617LmvqGoiNPUVFdUUVh+me7hrQCWO+QPnD59a+O0e/iHB/HSyQVDLScyNJHKjI/tbFpawMTIDTG3nd74uBVU5sTqSsIVqKHn6La0gtlag2GoSEIUZn21BByTfaEq8uVnfU6erah2zTmHZBAtFZXhIyqNEvFvXu8AXpSjdWbV6jKXo3sbVawWGsCOYta+JXr/k18R0ba48b+YN9r1igrz9Stv8lhdQru4xTCqb4DdkNKsxhpgDeRq//eA/XF8GaFCcQ+iyGigTHvMcfSGsotZVkGJfkVinSKtqnUiT1rtpDeQDZdkHyHj2q0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Yza2OMcneQsR7fWgRiqhYL9777Ht7AxZEPjQ4w/oY=;
 b=pSVqHilMvIJ+zBWlJNqRQGvBZJKtmvcMNp/t9uUOhRP6lhvkvgfsgJOmgwhh+IPgN22djyhkHhjAllY9lVHGe8MhIoBoowofXOZH8erMeaXRf8f/27U/unPaBE4CtO+L6oTRW7meJr6lhagQ8h7h1lji7bOy3CiuG3hsr/VHKQ5u5gigXzIiw62IjAAQw42BST6MgP5qJtyicCX3yrssL4Ep/Fq0xcIz1eMBFlwdq9GBbg11tpOsaTan/7nCYGWOn1ivK1I10UqDk8aMLqdVyb+iM33z79yyw2tWGxmiVi/OWBib2jUjeIlcv98cVPmq9BdvpwHHvakVGkYklzxbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Yza2OMcneQsR7fWgRiqhYL9777Ht7AxZEPjQ4w/oY=;
 b=nekcjwj7qqvLvDLygbPlQys6gYePPHR0GXvFEN5MQN5om2Qu4z4IZrzV3zxUxfiycd6iGzkvauwDYzPnNZ7V6xjt1TuFUv6kqk94hY75046joB7T5SFdwhdYWrO1otB/DLpt6hyyN+PmBAzsn4eGwwjk72ceD3NYdZZ5mgXeeLLsz9rACxZThOgVdPnrG6tIPl0xiahDQOZT2qXGFHWZqwbC+vMS69JIC5scFff1ON9Ox5kWCoBjRiVnzyEcdLT1BaWhOkAkhhvY0D6yetZlFykIxL5IkMhoC4IixBFIKyKHt+nogGCBNLq4cd4KjzbEHzsEmiaInQF4fvhoGpVr6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Tue, 4 Feb
 2025 15:56:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:56:07 +0000
Date: Tue, 4 Feb 2025 10:55:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <Z6I4jZW42ZkSYFJ7@lizhi-Precision-Tower-5810>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>
 <20250203220230.GA120569-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203220230.GA120569-robh@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b1ec6c-d566-4d47-cbb9-08dd45346fe4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?rj/8kj7XOLsFhaMkyzDdw2JL8kP/nmNhOEJxJM4/9h0ofKwAr1QkwSLDxHaV?=
 =?us-ascii?Q?RWO9wIS7WNuViHoP56LuJRauPtR+6C+gsIbir0R5RfNMpHNrV4Pi1ChCl2tw?=
 =?us-ascii?Q?pfGXzzpTu5GLm/qPNXaqflRHSgJ+U9O3kEf2y65Sk3c0AKp1wWMYBMoNHKQh?=
 =?us-ascii?Q?9kz1utK3885sZv5Os9GfXeB8WSDrMH/5BU+98VoI9mNvfKe+/JWvdpeSVLxJ?=
 =?us-ascii?Q?iyN6MEYNuSqwUvnr/9p/UC3zJq8sNjE04DUjE8ewG0Ky9t8CibmNiX44rd7K?=
 =?us-ascii?Q?AKOA2+q+ebHH7Em8zidqFhfrkwVJNc3DQI0WAM+0YUnI6Dj3OijQZKCKAW8O?=
 =?us-ascii?Q?5u8Cg4Vp3NEDmf0n/bp1HyrHVlJs2MND3Bb8abtZ8zONPSNjabNxlOo+A1I7?=
 =?us-ascii?Q?Rk6SYkBmPRRh+stnPA3Cjxz7j4W9yyiOHUF01HGeo1uqMJY96P/gl9O/L4Y1?=
 =?us-ascii?Q?WqgUmzC4Wlt2KQ7Px0T6K3ZrrFe3Zwc4koPSUm6RJGMJMculEJS4ZIlI/FIw?=
 =?us-ascii?Q?uDXSB+7RJaK56p+ntV681MyckxDQbsk6HE1GVOTIn2/OCcbY6LMoltA9yIcl?=
 =?us-ascii?Q?8wWUNqFoemYUFD5Ug6aOri34MTvskwjQcqc9v4XJNGVUJ7lumaesHexYkK2p?=
 =?us-ascii?Q?h9jzF1kmqif9xSvOtnWJumZLZKGGK2xriQoBxV70PxJPsLpZm//XK6nZQ/iM?=
 =?us-ascii?Q?elSl6IMukJ2K64LZvoFxnvn7fTAsu+VhquD9MmXI+sUZoyr2Ga1YUXqFEy5p?=
 =?us-ascii?Q?lqmK1g2SU3rejrVKF3gFwBQBomByBI4W7K75FEWoIh7XRwAHKT3o+YUHDC2c?=
 =?us-ascii?Q?gZA/YajPMf+ZUBK12Ax5AfIMm3G6Ca3tuxqkaly+8w02KaElVYr5GU4HaLJ+?=
 =?us-ascii?Q?e3RVYp80M6m4f3v1U9aTyynfapl+iOaebHt7j5EYm5lmbGa6TCjlEJrg/DEW?=
 =?us-ascii?Q?j31wPOt1EdDcOcy92LrhMdxs5IosYdjAyqEbm0wLWDpdbu8eU+RTwBC28yXQ?=
 =?us-ascii?Q?dHOg+Cz1wqu7WroHRsCAe10sJBQZRRG5+HY1IZ6bsOv0dk2gXY9XIhP2Shi2?=
 =?us-ascii?Q?Q2tnKXdA0GuS4EYd+TMBwu09hckIkScSD4MN6IeGXaR/Ec7L5D/unEhnvNIz?=
 =?us-ascii?Q?x5UQb8apz9CkNOnxSHjh+k9zP/Ho15hSCJBFKN8UhcZtS7MmagN8WQXxjjI5?=
 =?us-ascii?Q?Io2J5wX2/ufoA2AGvt79dSD3gCZgU0lOaTcWt/ErW2CJZQf/A0e2oZmUFnuW?=
 =?us-ascii?Q?t7uPqG5McPeJVb4bo36ifh/TIHu4T/fl1/rUwPlclHt4A40qJW9uYsK0avhk?=
 =?us-ascii?Q?ux7J1RvWYU+sNHJ0BgiogB2Lv/aWOupGQpwgweGZfD1RIQN8h15qIFjpb8Wv?=
 =?us-ascii?Q?PpkfRgd4izaKjGpmSZzOWF0jYlWZ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KS6xDtor4Z4HR93El5drBJQywSFNIdvlrdleNrVa7WvFmzlUwBP6gWH40EXf?=
 =?us-ascii?Q?yfazu5HcY2oDPa/ozyeOuhtWp4dpliH8a8+AY302mI8iDIF699gq2zRgwI64?=
 =?us-ascii?Q?i8MuZp+Jjx2/sPrUCdaW2p50yUeS8YRz5IufyK1uzpCirutoMnVpvWO453WK?=
 =?us-ascii?Q?xXPfdF+qy2TVMSChtA0lhF+9g3NWHcyVWyGG5y2kbJfs0PikoS+Y/pXMXpaW?=
 =?us-ascii?Q?ofWC7djAkD1WEQ+xrvI4vZxokwem4pVlzOwruJNlH/zJqoxqcHM+myGz43G8?=
 =?us-ascii?Q?GzjCPQVsTgXX2EjRlAQyzHObeUhXB4cSICHO/ewmAeB7HaBTkaWgBDcGWNfi?=
 =?us-ascii?Q?+Eq5MWrCvWKdsU7SZi63UGSfRSnY695zQvm6KfW2UmiHn3fccAF8tzFZawqZ?=
 =?us-ascii?Q?9NhaL5FepEQwSMcza4TnclGzCplo5KEhwswALmOOeQP/X9QfT28XVGWgxJpt?=
 =?us-ascii?Q?/yzIh7CFnfHOY0q/UoWeP2lcyFf/74hBSTGqKQvvBasmXv1pDt1yFur53U/C?=
 =?us-ascii?Q?dSQFw47bjXtJ9+kDb+IFGslQNnu7h7uxhddp5djMSkvw15OoiEJpYybvXD5e?=
 =?us-ascii?Q?H5/i2ydobbrlvtp2huECDjwSpWy8juMAY9+WQnpf9aIGy4ZZbqRrUIfjlshs?=
 =?us-ascii?Q?SRhXCCOmUchJQiTdUGcSiZYxtKcSGj/aTNkvG8kFO+KS31zoUWnd5dhbo3Lb?=
 =?us-ascii?Q?FXjyWSE7xBY4QXr/Uo+8lR7sXQVPuKPsR4Mr8XEHK0vJC+vrNN8M3/lecMae?=
 =?us-ascii?Q?euthFjNkH3Oys9naOyU98rN9ePimquEoNy7+IUCWvg4hoXC8vV/VgBtChSq8?=
 =?us-ascii?Q?KPzn+POBoiRq+bvrhYeaHvWIWzH8x1AyyKBkMrHEIP0C4MYLXzKCMJyNW912?=
 =?us-ascii?Q?PkYlcMKLW75i+5Sb5GJzVY8JRmEfbB67WFOjTevdJ8IvalLBZ4VmVcvtUSzm?=
 =?us-ascii?Q?+QBiUMKnxwUS1HaBa2rnUmI63ojVrC3fhT68W+L0RlzrzaZR1Yvfuu44bp//?=
 =?us-ascii?Q?61BvXkYEyuKMfQG6MgPbVy3hCHr98ScJUaf+htF2RQTCqrEkT/GlcQ8G758g?=
 =?us-ascii?Q?CnrypQYU3am9gXeICiGNCJKJtl+aWbBDxG3ni8/c//diUGxsL+OMrXex44o7?=
 =?us-ascii?Q?bSqB9PRQBa+vCJwIw7pMAB1RYlMObH8CoNJzgMYooFJ3sOMNxhQb0iHBW4vb?=
 =?us-ascii?Q?lRCl3eCdJLBWZP/y2zTmpzWLCFfoqsW4yilwzz+UyyBvhVJUEsHT67TOoafu?=
 =?us-ascii?Q?cglfr27f1UcMzQVfc638a8VJOFOuaQwePRLuy+ha4QIaYt8pQAJ914eXydIw?=
 =?us-ascii?Q?006bQ8Qv55bz1uo7oAqyKrs/UX8td4XSo/2n7UEoY8xTWNPm9ElYRzzoUog9?=
 =?us-ascii?Q?2i04dJZt+VYY+Hu8iP8zaUIIWfPf/E8VPohgrBEAJDQhxlL7uahofmfuJJDB?=
 =?us-ascii?Q?OaLiyQ4dB8eVugZpcJpWTmP4fpZoGl7aVZTz9j6u1cBDZQnFfmSNPZuC+aLL?=
 =?us-ascii?Q?/Tg2U7nDg5jfl6MfO5+a2u5FJt4NHMceHQA5yY/B93wwQAknC8GElQSI3OFR?=
 =?us-ascii?Q?4/BpfcMR5A3aTvMYrxY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b1ec6c-d566-4d47-cbb9-08dd45346fe4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:56:07.6266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5f09eIcOSUdMMQg3FggrXMHPH3FlZIey9exox9mC7SSMYgC8ItStSqYO5r4Aq8ccS7SeQlT4bHi1pwnFsCY+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

On Mon, Feb 03, 2025 at 04:02:30PM -0600, Rob Herring wrote:
> On Fri, Jan 31, 2025 at 04:33:46PM -0500, Frank Li wrote:
> > Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 53 ++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > new file mode 100644
> > index 0000000000000..c6cbedd9ed114
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8 SoC MIPI CSI PHY
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +properties:
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qxp-mipi-cphy
> > +      - fsl,imx8ulp-mipi-cphy
>
> Where's imx8qm?

Sorry, missed. dts use fsl,imx8qxp-mipi-cphy at 8qm, so I have not found it
by DTB_CHECK.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - "#phy-cells"
> > +  - compatible
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qxp-mipi-cphy
> > +    then:
> > +      required:
> > +        - reg
>
> How is the device accessed with no registers?

8ulp boudle other function's register.

csr_regs: csr@2dad0000 {
	compatible = "8upl-csr", "syscon", "simple-mfd";
        reg = <0x2dad0000 0x10000>;
        clocks = <&pcc5 IMX8ULP_CLK_CSI_REGS>;

        csr_regs_rst: reset-controller {
        	compatible = "nxp,imx8ulp-csr-regs-reset";
		...
        };

	mipi-phy {
		compatible = "fsl,imx8ulp-mipi-cphy";
		...
	};
};

I have not 8ulp to do test now and this serial are already quite big. I
plan update later.

Just put a fsl,imx8ulp-mipi-cphy here, because it is quite similar with
fsl,imx8qxp-mipi-cphy

Frank
>
> > +        - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    phy@58221000 {
> > +            compatible = "fsl,imx8qxp-mipi-cphy";
> > +            reg = <0x58221000 0x10000>;
> > +            #phy-cells = <0>;
> > +            power-domains = <&pd 0>;
> > +    };
> > +
> >
> > --
> > 2.34.1
> >

