Return-Path: <linux-media+bounces-28886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54282A73F42
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC38C16D160
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEB61CEAA3;
	Thu, 27 Mar 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="la6fOTv6"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F8F28EC;
	Thu, 27 Mar 2025 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743106933; cv=fail; b=Svsy1df/3e2wqyYDm55BF0vRtGL4pyuYPhW0qI16n1hb+2DydU2txscZ3h2GGsaD215bvLQSRXGTIAgdZtfWjNmDpSeAUpSpg8Sxsc3Ewf7NB2aO51qF1C3WTDm8RFPcaryA3iH6zmVctkBMEAeJ4dkeMOpiFyC0xkb/Tq+KRrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743106933; c=relaxed/simple;
	bh=Jw1mXmExj0Z7WCobt1NKGTZTmElXHyuW7c2/AdePZ7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g+cwclDDi9C6uhfxXOr+100kmMkWte36trgSQsdgM0hG64mlzv2VhMx2YHhunrGUooplIGwoIdPPkJP/uWrpeE866zRJaxmZQpehrKUdk42hl9jE576aarXd/x0wbPAm2COlW4LlJJfGtNfiZ2D7FI7g9Io39OMaoWRPiwT8nLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=la6fOTv6; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/j+0OzKSLDXWCi4rdM1Gar0fktiBYvuC1HmvdCfjuh88EPZzYE0858k2dOz/X65StHrQsowSbaFq5lPnnDSjYcwQoq6FHcbudk+2bDdq9liY8I355dsvHgVfjBnW7oT0cUNdGAbGS0QzZ6ZLkDZJmJqSHmY2WTLBInsPooef+txBPJhJ4tKIatnWjYuoG5p75tH1obkmZXuZuOpvXIHyqT/GpfYQTvmu6htdPJne6BjJaWXA2EqzMt1rQdCr/pxVjkGe7OAZbD0mI5cLuYA557AFKT7En1Ktj2IAnNyf7r0LaHnZNSQtaaqOb/gQKCRC27RY+MY1i3DaHl1Szdvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rm4mj7GzkG747mmmhrcVlDgxe85hTH8fn6cAhDb/AZI=;
 b=c3+ef1jJ/pNe36zlsNrybwUxRi7eGDJ0oLGrKyoAQ5+InmcLnPOn5tf1R5bpH0QL4PmCoxT+jz4K3eyAqoo0AVpMeofdATkC6pH8TLv33DVZaY8oMWE4D2fGy3kxBvTxEZyh+jtSSAbOdsGNogr32oO7FCMyNOIVQrQlFP0TR3h5u30PvBQe6ObIa/w5XXE6LX/d2Z/3EO83sBS8KVtcc13jQgyyD07pCn8kwIXwptSvmT3YWj4rNInF2Jh9Ekuvw30BKUdCLsHo/VPyjsCAGeSPrT4FYtZFXX7MBw2QyArBudXLaBwTjGUiJ5Wwhd/odmT2KXHZtRWpc2KkDLDXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm4mj7GzkG747mmmhrcVlDgxe85hTH8fn6cAhDb/AZI=;
 b=la6fOTv6xBgNNf4PM2CwHh7JYzh3iWilxa+U5vkb0gsWd9vNhhL8jyhoCCpwWwSPUHG2+9xOVKdiuAvmzTlSI77L8ZXEYYNCAbt4CoJDAjO9ZeyyAtwl5QeHbrd1NbiRc3WXOmGKB+rp3n9myU0vGtsIbA2FuZaJKiiwe6zyzyoygoBecd2zgBPcSFb5hqLL3MWgqcNkhYRMKiwzHDfjQwln66IU21I1eNwVLK7ONT0CE8WpTJDOARwHlgpPBb/kzA38kmyJG8R1c6c2EOorC7GKu5CdCjoh0pblryRdqILxpIlCqXagIIMNMYwBUPIFXtS0f8L/VkHEjMdb1wWRkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA3PR04MB11155.eurprd04.prod.outlook.com (2603:10a6:102:4aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 20:22:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 20:22:05 +0000
Date: Thu, 27 Mar 2025 16:21:56 -0400
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
Subject: Re: [PATCH v3 03/12] media: dt-bindings: Add binding doc for
 i.MX8QXP and i.MX8QM ISI
Message-ID: <Z+WzZDNxpPcYScYT@lizhi-Precision-Tower-5810>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
 <20250327184425.GE4861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327184425.GE4861@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA3PR04MB11155:EE_
X-MS-Office365-Filtering-Correlation-Id: 815e87d4-1e82-4c94-590d-08dd6d6d0acb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?hpVlp9bHMDu2bOLtLw8TfU5vMZFw+f+vE8qPFoDpQu4Kizqhfj+bfeXStDuX?=
 =?us-ascii?Q?IMqJotLQ8P2AMfmrpSZsix2/pY4awRDb3EXCmYmm68nyBkNkZCiXmAuQwD0S?=
 =?us-ascii?Q?fF196W1jSt4Y3J7fQ3LlEo7uM+GvBGlhV+1Zc/x2u6Ev6P+Tf7DBvVXo6iZV?=
 =?us-ascii?Q?RoIm/O1y/gGth3Zds75QAGM+2jomS+ePOtlRiAZn+0da2CtpixKXYMOi3sTn?=
 =?us-ascii?Q?4asrAHp3tAJIEZwBzDISiTU6US9awMBVpvvoBZOnB9zdAGcKqoGLdiUg2QVi?=
 =?us-ascii?Q?PWRGvL3niBfUiaVuPAWmpYMsPUDFP+5TVwWOy2s2VeP31fLGSNJDAAALmLIE?=
 =?us-ascii?Q?526nOxsvdJteCoOaMzDSJSthzW6BK/GSoHI5sP/sy4VMDkAG6HmAGrU4bTHP?=
 =?us-ascii?Q?jEJe2zLJ/IvJwSNPKb0cg5tGGo9HWaFD/SefQb5hPcU5l3uohhCyaQDZ5jwl?=
 =?us-ascii?Q?VddTXNc/eXwo8s5LEqNG6BBavC0Q5HEtaTbh39/9uSzAigd6CIn8GezFrZjj?=
 =?us-ascii?Q?f51hUdRiEyMVG8I+2y9Pl1CFDEntoYtPZzn8qsHHDKijw0vqQb4VHGpGCkwu?=
 =?us-ascii?Q?TY6KfEzJNwKWbM6F0xMh6tFQINNgPK8a6hZ/hoTaaRJNnVVfnc/QgWlqfeps?=
 =?us-ascii?Q?lyutJJB6hncvKNvUtgfe9gM/sLKjegFd6hv39U4+g9eMk+5Z6kRA9+GGdNbq?=
 =?us-ascii?Q?PScbNe8O15Wi5NbHr9LxMoMwGKvAoH2Xud5ETUUiaBLm4HvmTne50Aqee3ty?=
 =?us-ascii?Q?tQA6dWIq2G9EUlEGk9rhARS+ZJ8SG3p8XWVn4mOOEO4ZEGX/Wkd6tspb1gwu?=
 =?us-ascii?Q?uk/qKnI5f3/q4X2a/IX/5iw8s5WGEJDFaPmHtqvI16f220zwd8js/JksagN8?=
 =?us-ascii?Q?EH+L7iog7sl/ZjEOwHqt3jP8ZPwROGpWw6GEkNG+y1rvd/+b+4Ncpk+oHbes?=
 =?us-ascii?Q?UYjRfknx3OLNPY7vH2yBVBWiid9S3Dj2F3DqFCYOsKYcmtdqf+/g7xBZPeCj?=
 =?us-ascii?Q?xdRk1nvaz37F+r3EpwOv/nV35vkfPSLIFlZjR6NgfmLGOHm0SGqpLEo4RCvU?=
 =?us-ascii?Q?PuHwaLRyaFQXN/Zly6VjL8QPUc0P7+ImT0DpuA+ausYdUfWa62IvL0/kR5aE?=
 =?us-ascii?Q?N25g6FPasc0bJv+XJXMYazblJ2MeJzZUV7Fqu6+xSyA89jH/2o90Bxe6jyDM?=
 =?us-ascii?Q?zOo4KTgOODdMmvpkRR3iL2/x5uGC4awWP2XmdW+K4/ebM/Z/Q4R5oydYY5lC?=
 =?us-ascii?Q?WpphI3ye1DI62DXSCeqG2BYRfNbhw5dA3PAiTvCez1kEjbHOjRvk7CcqD8ei?=
 =?us-ascii?Q?yBpFiXvgyTXoppbOJMfQWOo0g7wlqadJgiUJ8Gm50gDEmIA9t7ngDvg7am5m?=
 =?us-ascii?Q?XID9cT4II+AojHP3XtqbwTpdgRu0?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9QLVVv56D1jJrAJJBHaJw7cvsLaHeH7KU5cQaSEzvTF3nZC//+V03yVVPa1l?=
 =?us-ascii?Q?PrM1j0SK0PGkcivuF1vbRNSy+LO0egAqDHmsj8jDUqpwGoD+FBj50xHgnvlC?=
 =?us-ascii?Q?KMn6yAC1/BKlFnJ0ceMpLezx9T+cdvD/A4Sf2vNGB3YVHyC/cdM3+vF/ptQF?=
 =?us-ascii?Q?QVM/tjpsN2kwomVgBbtcWu2Zzn05CeihhKNnMfrhNO2ZSjfu6IGwirdnt/w+?=
 =?us-ascii?Q?xb1tND1kqNsbe+iTTqMvmze6tomvIJdbedAo7TM73rqJh8ITxi2o+ngW16wa?=
 =?us-ascii?Q?mxslbKXzd3YZuj4WOVf3p3eIDGfIr2R1KAbl2rCpAqRrUBktgLzkK0Xdjhuu?=
 =?us-ascii?Q?Q9GQFQZ+LSyuwYB48ROBWhZcjw6fG5n+n0m4By6Tk7/GkD8L5Kc5T3rSMmG3?=
 =?us-ascii?Q?wEUcIoyUSX17h/p7cBpR4j0bZx6HGYRrWZm8GMh+Fpnh1ePWQJbg3KkesYqL?=
 =?us-ascii?Q?Y36HVI4JeJkZR1T3b/1CxDd3r2Eku9SLUDNsRDXutgdE+78Xf9SVv0x6jK4p?=
 =?us-ascii?Q?9Y/wU8lmNYggrS2ZcCLEz8lC7sLyxkwoXqtsoLTtpdCCBjFamrbZ+hg5p5Yz?=
 =?us-ascii?Q?HAW5raop8PkzkmvMOEFdy90ELnXlelvLWFtwKq2qMFtV9tZdrR1QpClgGQZz?=
 =?us-ascii?Q?llV4PAY5KGWtZbnz44toFEfdPRHyHuvPYcTAyRKs3aUj2soJeFKEfp7PJtgs?=
 =?us-ascii?Q?EwPeq6JRTuWYEiydv7FBHzP5/JBhpsBl07Sow9sMditle81UauR9lBYou7tF?=
 =?us-ascii?Q?5N969O0pKjmwUw25Fa72kFofiWLrHkDQmoTIvP5r4YUA2365lhdQuLx40ZRB?=
 =?us-ascii?Q?LalsssdhFDRF7HPEpKEm8ldRg1yxLjqo5raPtTP5laOwfVp+MBdD3nVLYHYG?=
 =?us-ascii?Q?3eeaJGAF8xkH1AQLVdtQ4lJMg0AnP23Inq4GaTxUu6/WhTWAl5Xb1rsB50Vu?=
 =?us-ascii?Q?bQbdw23QjaP8GMqCNwhC7r5+1x9efX2ctx7D1nXwHmnx43bw85YWDIoGN04f?=
 =?us-ascii?Q?U8Mme4ZLnJZtI9BCkYPbaaDnTf611uKBQ6RLYqYMvhSNIYbFXGXw55ED88Lh?=
 =?us-ascii?Q?LBTg2Odv3aPkxK9Bn5MW7RC0Z7wlNR396rWS8AmKVIftA2GEBYJm2IV9eFvR?=
 =?us-ascii?Q?tiqLdBoU5nD6kwTRjHJldnafYLEohSFKHis8u6v3XAFUocO3hmDovxz1g7YK?=
 =?us-ascii?Q?xRggAqf1tWisx+prqQ4WBPGmE5N0tj/uaRDBefuWia6xvpYiN1C2FJZT+o/3?=
 =?us-ascii?Q?EUQmHqNyz3mw4KZwsip+9+7gsPYwlojZY80en0612VRIhnbbxk3Pz6sB3CkM?=
 =?us-ascii?Q?MUNdxE3QdfKge8HzR+q0rWTTKz16ekDHrLp/utqGkT6OGYX7jFfZVfTCQQB5?=
 =?us-ascii?Q?0HXAvnxFzAh7nRtsjK/ORyvrScVwGSoIzRdAoA1TO2lbge+GRBqBvK/5BRlD?=
 =?us-ascii?Q?qVhHc36at1D2nDM0nC2w3IoWj0cYHsEroB6CHc2Ic4gTydbrKdqIGAtR3qF2?=
 =?us-ascii?Q?uC/OYx4Z9zr8kKsIfIpZE0nyotVPF079SnQDQYnZO+vegnf6co1LfoECObF6?=
 =?us-ascii?Q?JGz1ne/g9h9gn91IfzsC5gPru2ds2lXS7xqhlf+C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815e87d4-1e82-4c94-590d-08dd6d6d0acb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 20:22:05.8737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7/e9dBr0msAXurYZggT13Vw3qdA/HlBjk6z86a4HjP3OyqsI3oTSMO+4/N+Bl8Y/XWK2aoXsPdY8MyJT35lfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11155

On Thu, Mar 27, 2025 at 08:44:25PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Feb 10, 2025 at 03:59:22PM -0500, Frank Li wrote:
> > Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
> > power-domains, and ports differ significantly from the existing
> > nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.
>
> Mixed feelings about having different bindings files for what is
> essentially the same IP, but I won't object.

Rob suggest split it at v1.

https://lore.kernel.org/all/20250203221659.GA130749-robh@kernel.org/

"I think this addition is borderline whether it should be its own schema
doc. The if/then schemas are larger than the main part. The ports are
not even the same."

>
> > Add new file to MAINTAINERS.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v2 to v3
> > - none
> > change from v1 to v2
> > - create new file for 8qm and 8qxp accroding rob's suggestion.
> > ---
> >  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
> >  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  3 files changed, 221 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
> > new file mode 100644
> > index 0000000000000..61c551673e2a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
> > @@ -0,0 +1,117 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX8QM Image Sensing Interface
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +description:
> > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > +  DMA engines to process and capture frames originating from a variety of
> > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-isi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 8
> > +
> > +  clock-names:
> > +    items:
> > +      - const: per0
> > +      - const: per1
> > +      - const: per2
> > +      - const: per3
> > +      - const: per4
> > +      - const: per5
> > +      - const: per6
> > +      - const: per7
> > +
> > +  interrupts:
> > +    maxItems: 8
> > +
> > +  power-domains:
> > +    maxItems: 8
>
> This surprises me. The reference manual does list 8 clocks and
> interrupts, but only 6 channels in the ISI section (for instance in
> 15.6.1.1.4). Which one is wrong ?

Support 6 input, 8 output.

"The crossbar is a 6 input 8 output multiplexer where each output port can
be configured to connect to any of the 6 inputs."

8 irq and clocks is for output dmac.

>
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX 0
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX 1
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: HDMI RX
>
> Figure 15-59 in the reference manual list MIPI CSI-2 RX 0 and RX 1 as
> connected to inputs 0 and 1 respectively.

Reference document should be wrong, I reference another internal document

0: display control 0
1: display control 1
2: csi2 rx0
3: csi2 rx1
4: hdmi rx

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/imx8-clock.h>
> > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +    image-controller@58100000 {
> > +        compatible = "fsl,imx8qm-isi";
> > +        reg = <0x58100000 0x90000>;
>
> The memory map in the reference manual lists the "Pixel DMA" region as
> ending at 0x5817ffff. Shouldn't the length of the region be 0x80000 ?

Yes, it should be 0x80000.

>
> > +        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> > +        clock-names = "per0", "per1", "per2", "per3",
> > +                      "per4", "per5", "per6", "per7";
> > +        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
> > +                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
> > +                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
> > +                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@2 {
> > +                reg = <2>;
> > +                endpoint {
> > +                    remote-endpoint = <&mipi_csi0_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
> > new file mode 100644
> > index 0000000000000..818fea0e4679f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX8QXP Image Sensing Interface
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +description:
> > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > +  DMA engines to process and capture frames originating from a variety of
> > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qxp-isi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 5
> > +
> > +  clock-names:
> > +    items:
> > +      - const: per0
> > +      - const: per4
> > +      - const: per5
> > +      - const: per6
> > +      - const: per7
> > +
> > +  interrupts:
> > +    maxItems: 5
> > +
> > +  power-domains:
> > +    maxItems: 5
>
> Here you have 5 channels, while the reference manual lists 8 interrupts
> and 6 channels in the ISI documentation.

QXP should only have 5 irqs and clocks. QM have 8, see above reply.

>
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX 0
> > +      port@6:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: CSI-2 Parallel RX
>
> Table 15-6 in the reference manual lists the parallel port as input 4.

Reference manual is wrong.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/imx8-clock.h>
> > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +    image-controller@58100000 {
> > +        compatible = "fsl,imx8qxp-isi";
> > +        reg = <0x58100000 0x90000>;
>
> Same comment here about the registers range.
>
> > +        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> > +                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> > +        clock-names = "per0", "per4", "per5", "per6", "per7";
> > +        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>,
> > +                        <&pd IMX_SC_R_ISI_CH5>, <&pd IMX_SC_R_ISI_CH6>,
> > +                        <&pd IMX_SC_R_ISI_CH7>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@2 {
> > +                reg = <2>;
> > +                endpoint {
> > +                    remote-endpoint = <&mipi_csi0_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 40d1b7ec30fde..f243257ef7653 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17000,6 +17000,7 @@ NXP i.MX 8M ISI DRIVER
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>
> Should nxp,imx8-isi.yaml be renamed to fsl,imx8-isi.yaml ?

Suppose yes, it should match one of compatible string name. This patch
have not touch nxp,imx8-isi.yaml. we may rename it later

Frank
>
> >  F:	drivers/media/platform/nxp/imx8-isi/
> >
>
> --
> Regards,
>
> Laurent Pinchart

