Return-Path: <linux-media+bounces-26296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72666A3A1B8
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086B5172CDF
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483DD26AABB;
	Tue, 18 Feb 2025 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kNRm+8Ni"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FEE26E14C;
	Tue, 18 Feb 2025 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893918; cv=fail; b=X7D6toH7ZHR7EGPEajDe5RXXIOSL04VCQNwqu9A2REArDvq+ECxugUx7QgCWG4cuJ9SuNfOOchZ+T9GahzQvdmESkgmCR+K2F4mNaYAIFiT6TdjMln3LSAlbIz1s7/9h6/GuWqu92JvCoIzOEHAgv24eaSzARllE3ROA02jjrQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893918; c=relaxed/simple;
	bh=WwtWtdLx7rDqzPPQw/iUtJctNBDVfZjAbFEjfZwpyDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MpnZ9hOmpXUtO+L4diBjpNRXWk1DMNtv7NDNiuiB+ZmU2HqzqyPfgw/EwwFXTgQMD/VnSIrDeUgohn9XLZJdv/bwebNm+7n9RUdLeXSW4XUZfSMjnT9SFKsffdXrqnPeINLFbKCXOzFYLnJ7lz9geLxt33977UKxNKlUS7A6exA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kNRm+8Ni; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smNEa46mUSDlFcklrknS10jDAh3Pth5HKMoNPJMZd8T8q1rQUMV7qHOhQE3YsMH4alA5uD+nnEUnkL4Q5y/ctyOIlzWxIX5N1m3hp4QO3sYT82JPO6HD43moRK10OpeqJNnwhJcb6GO2HzIOUint56jOiI3uV3zDSl9465fiE1/+qFDGF0tx7aUDSg46z2TfGOeczgZ58L2RoilJZFo6E/nStWUqSHrxVdn14xugU8j+EAeWVhqd/+A8L5exXD5I13jNlmnFuLwhd9N3w75RvrwZUm4mMPJIUhQWkrA8qDX6FFnmPR1YsXENGNC3BNUUdlPG8Xo106sBiN+OuqMjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=li0wYahItCRRyuDPuqxYtglUTZz/SdWZLdbccAv/G90=;
 b=tngKqA1Y8XfST7awq0MiTx38NEtrlit1gD3fkQNUUCmLooTNfI0dCCfEynFfmfZmMtMllLx8P7GIc18k9XpzCPxPIJ/fcmUWUtwx6oi6/gjNqT4Hb0rSjAbrPRcH7RMqO/TKrRJepHkF+DiQJ+vix5zTTFsIyZzLki9yShvbfQFeYE1joUa4c0iSsbk2SyRYksEVEyNowXqAh2WFCSr/awYBrNPi7mS5nsS41Rucv0OGFPHg8vgxV7C+kJ2bCWJEkVYCvmCYzkyoKi9ZjyuQgY+hOK8Ojh97Ydgxb+OJodSH6pxEytGSKsKwFXfGxqoCQ5IiPwRJI5DhTUf9PHQlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=li0wYahItCRRyuDPuqxYtglUTZz/SdWZLdbccAv/G90=;
 b=kNRm+8NihS5hIjPzQPDOVx2/iHKn29vzH9bfGHadoB1xuE9s2dVEPimVpjsAK4sPfGL4BmhCNSOMshgoLh2xjdVAOkC/KZnD1yumeDhWNZ5nYE2JCXqen/Pr7C6bWP+/kHjhCUWzlSxHrE/L5hPjvpqfAQBGObXNTasyX9JEBtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB6505.jpnprd01.prod.outlook.com (2603:1096:400:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 15:51:50 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:51:50 +0000
Date: Tue, 18 Feb 2025 16:51:35 +0100
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
Subject: Re: [PATCH 4/8] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G3E SoC
Message-ID: <Z7Ssh5HbbjxpoRxR@tom-desktop>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-5-tommaso.merciai.xr@bp.renesas.com>
 <20250214004500.GC8393@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214004500.GC8393@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 534265cf-9d22-48c1-82de-08dd50342859
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?O6eAWNTihlEbTEZJ3RvbPZgauN1zQp0Zk6CaUjhPMQvQASHIF6PzC7XWYmKo?=
 =?us-ascii?Q?S7ph/ptxRbtGVvVL1+qpYKVeWYRdfpzU/wfZHvpirc3apwFUqtQQCUpbFYpc?=
 =?us-ascii?Q?VV9v4zxRoghPIDdIQ1rGLiKO+X8sffGpcaUgfexsNl46AA9F5XdSLN3uAJ8n?=
 =?us-ascii?Q?PwLN0YgCt0jgGtBe/3Xj6379qlALDqbP0FnCnUdoXwXrWND6N1CAU7K0a8AN?=
 =?us-ascii?Q?l+7tVZQZmAnd04rOOwxw51vNmRb4T0FfF0YDXpYQ+4kPTgIhthfOa4ZUmlVx?=
 =?us-ascii?Q?XJFE5sni66R9yxWWG77TLt38Mg8Gm2EKV5gPVc2MW3ojYUmtetplp7Su1qNA?=
 =?us-ascii?Q?K1/rQv0pa2o+1mXR2h33CtBgUiklM7ckL36X3rGnAHKM+MNzTp31MP8pQHFQ?=
 =?us-ascii?Q?FDsQ1h6jNU3ZIBGck3gMZJYrgW+jUI1TZiO/sEt1BjPVOyCpxFLpmmTiqT4T?=
 =?us-ascii?Q?LpDx38NOItI3clXmB4SkJb/ALsQsebNR8RYrH09bphJMZT9NI/gqAYWwrsNc?=
 =?us-ascii?Q?NCUl6zIScagcCJf91HosC4wxLE1eFpKhxiCBY/MwW7ugF+obYgR0D3Mr4J7m?=
 =?us-ascii?Q?6XRSwj11JEJGjBYaZsBR46R0/MzOAG41ROpuk+rfegM6ICuA5UXlSMSu6hAi?=
 =?us-ascii?Q?PRZuGflT2aH2pK834gA3sYyD1Ouckc7Bm71bcVlm4FKUQ5Zmt4VLh1bb44KI?=
 =?us-ascii?Q?mH7awuq5mMtIbKDIDq8aHqnYNZqFi8T0wd5ASfpPT0aeRc6xGkK7bIvWozq+?=
 =?us-ascii?Q?B0NEAiXWcP4ZMBKwrkEjVMMggJgKqkR0Eopc78Z9MHd/g/ockd3DOXtxiLHR?=
 =?us-ascii?Q?Hf+vpgfIaMXRCj+zk2ZAAsAQoY6r2Rxe9khCYp5jV7sQd44PlZgvgHb2uYHN?=
 =?us-ascii?Q?pFvai38CEaj5TiV0yVmxaQWldHGT664XdZNP0Ul053DYL7hkYswzH8dtlQR1?=
 =?us-ascii?Q?wF1ZKEDEK80LzJUmSwiKXvMv37p9skFGDCAk3N5NnVktThUprAWHyEnCwbyP?=
 =?us-ascii?Q?lp2rQ+fPqyJzWirnmUs7GkR/doXo+O8lzt9/FXQ8FynDGn/QZ6W2OZ5Fl1D1?=
 =?us-ascii?Q?fuqwRU2bzJhmd9+KRNRYFng2T/vgXvPy/21sfoTH9oXgf2vdArBkQZnpylXa?=
 =?us-ascii?Q?VYxw9sUU43K2mriiapUZzY5TssFZ5dN1flIPPddyZ/rallU18ZTuuMYiFYCC?=
 =?us-ascii?Q?YytjCE7tdf7JvDgTKqXTX5GYxzmv7nHmSkqVLJOjNKmxb6En4lCvp5Yd8zYS?=
 =?us-ascii?Q?KJu6UDVS6eL8t2bweU+IlW3BGPNefJY1Xf1u7yPeJKFheAVMI56CZq6Mk6hG?=
 =?us-ascii?Q?YiceeKM0PW7epnkd13mJTPaGtmYudkPSzbdwXGaZRjPjH2KeKWhGDjv38RMx?=
 =?us-ascii?Q?9b7+TzXgGJWt55GtkwE2p7GH0msLzXHwUHO7eIlcT9CDbrI2oTeacU2mnZJD?=
 =?us-ascii?Q?d+1FbihqeB7T5SNNsZ0Xd81DvMg3tZ6i?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+JMXxNUUM35OjixTgZlPZkh5h7JpzzX4uYLTixla31tToKg39Ek+Cdc3vFpU?=
 =?us-ascii?Q?M8BJ0Yjoq6sU7WPA8CuTOIvW3Zb1Q34gwWn2DmQOpMw2PJu0QHKzpCEzjGSo?=
 =?us-ascii?Q?FsYi/OrblMR6NV8RZId2G4a51lHgIpQHpDI2NIHlH2lMz3IcdTZRQiNzInQe?=
 =?us-ascii?Q?akM/5EoUHplPMScldG2EjlYTCm7Fg0nYDcyCkkF8OxUpBXY4KN+HZA6JohJ4?=
 =?us-ascii?Q?qIKWO91xj59QCE0aTYWbfeaYxPd9iAXgMWJBaxMNj/6R05jSVrca1F+fWvdf?=
 =?us-ascii?Q?pZC6CeTIpslQOK5nfsLWNzxHoNJGMgXowUCohUBIV6ksTgTMS7/78wakWQiw?=
 =?us-ascii?Q?C/Mqi87Wsnh5Dir85TVCNTOcjNInKuGqq4NZRgvdNAdEBXo5w6uYVTBpQf9F?=
 =?us-ascii?Q?9BEL8Msp7r4SfS3LMdhZKc8TGyoISx9NL5hNfrQhgn69l8oZkbuUSOlDg2Om?=
 =?us-ascii?Q?wL+OMiOTD9yGWL+fM/0S8mVyNF7+YcJj+7m4ZTTpS4jGoAF286AV7BEDsvKm?=
 =?us-ascii?Q?mvdgCeX8pa/YyrnnJQ+R/qZqYTtA9RBAHwOm3fPesfohbOKveVpGVBzZVe56?=
 =?us-ascii?Q?EIciVafP9bJx8+U8X7yw7tiroA1E4eZUC08aLgMWLKWQb/t186ksmIaiUPZS?=
 =?us-ascii?Q?XU5vK1EFKmBJGRL2vQ7Pj6FS28ffXmDUXqr9HEAdaG45DP1qzvrf3UCZv6M/?=
 =?us-ascii?Q?qjhRHhMznZ6Pnj21O/WOi7hM7ICQ6ySAVdAzkuSynmYr/mOniWVx0yDbWBJU?=
 =?us-ascii?Q?pOdU7Nnc5Yxy92xich+ac8tPQE/wOV1ysjrmCVaeLlFjrThnJWmaW54b7KOZ?=
 =?us-ascii?Q?mbiGlXvjhQYOg8Z9ZwJH8gb4Yz5QAAniu3TsR4BhM3sC4C/eb/a3cqJ13Yli?=
 =?us-ascii?Q?O1Ek1azx23iKhDb40JA+ijAIZ9n19SEbvRQWCAtdKEws8M9HkoZX/NrYvWjH?=
 =?us-ascii?Q?3sW9a6WAxLq+31jNdYiuJvjCegCnGusK8uoPgxvbirGKkWAVW5W5DhpXkLDe?=
 =?us-ascii?Q?hVnOTlxMmJz7Xf7E3vMy3CZAokKx6jz8iQWZWMVF8sLgaQ0YdV83jEZECoNM?=
 =?us-ascii?Q?oLVGSV/l6iRrUEdGMl+ZV8hAaIOrwSTF+LWyj+w3uvfhosSGdzSnw8jiREAM?=
 =?us-ascii?Q?ii/EsaqrGRgONuD+rq9m2aIC9CQABCr8KGiATXnavl98M1Nw6E0LAhG+1FB+?=
 =?us-ascii?Q?AQz58rTV/RC69l2kySnFXoqvwWk+ZjUIa1GrCS5Kt0ZJZoQcdQteUpiNGfMc?=
 =?us-ascii?Q?9WeNfDa+F1Tg/TUdOA6i7RycyDe15mbvxJdF2G2MAazHmopUV8qDHuC2xXbC?=
 =?us-ascii?Q?jufq1iFjaMM3CRPzuLTIABFNLhAc98bUeEHAX/xZGavdVLSFySTvtu6Q7b8w?=
 =?us-ascii?Q?Y5sjNzQEL+URx0ukDf3a0jfs2pWmIevraRKeDkoFfbzEkUEUDIJHw5VSNgfI?=
 =?us-ascii?Q?HaIRVEaSDryqeOdE0VMVMKF3bg3SsMxAVe4SVuAUKhGmgIkx/4EuEF8znAPr?=
 =?us-ascii?Q?eqTrIz0YnpM1rJZAGkBolUaozMNt5ysbTVlbSXcBVsNoyn1jshnFfZdwpyue?=
 =?us-ascii?Q?WqYhanyPztXbQn1DHTLqKbY8vjmvuss38NpsGtuR6zUj7eFKKI8bYo5wP9Zk?=
 =?us-ascii?Q?rLsyiam3wQScVeWaMU5Pkt0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534265cf-9d22-48c1-82de-08dd50342859
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:51:50.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPZIROYq4SAF6jy8xPmhsuhA4DGvKLVls31I5SBxM2/hVlqOXQovBDdbMmtgSmWTN3CBOAXXYxQMWqL8bPfFivoeKQIj8mjEqMF3qSaee/8LzvJEfNbVnjqvacqfJS7N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6505

Hi Laurent,

Thanks for your review.

On Fri, Feb 14, 2025 at 02:45:00AM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Mon, Feb 10, 2025 at 12:45:36PM +0100, Tommaso Merciai wrote:
> > The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
> > interrups:
> > 
> >  - image_conv:    image_conv irq
> >  - axi_mst_err:   AXI master error level irq
> >  - vd_addr_wend:  Video data AXI master addr 0 write end irq
> >  - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
> >  - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq
> > 
> > This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.
> > 
> > Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../bindings/media/renesas,rzg2l-cru.yaml     | 33 ++++++++++++-------
> >  1 file changed, 22 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > index bc1245127025..7e4a7ed56378 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > @@ -17,24 +17,34 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a07g043-cru       # RZ/G2UL
> > -          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-cru       # RZ/V2L
> > -      - const: renesas,rzg2l-cru
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g043-cru       # RZ/G2UL
> > +              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-cru       # RZ/V2L
> > +          - const: renesas,rzg2l-cru
> > +
> > +      - const: renesas,r9a09g047-cru        # RZ/G3E
> >  
> >    reg:
> >      maxItems: 1
> >  
> >    interrupts:
> > -    maxItems: 3
> > +    maxItems: 5
> >  
> >    interrupt-names:
> > -    items:
> > -      - const: image_conv
> > -      - const: image_conv_err
> > -      - const: axi_mst_err
> > +    oneOf:
> > +      - items:
> > +          - const: image_conv
> > +          - const: image_conv_err
> > +          - const: axi_mst_err
> > +      - items:
> > +          - const: image_conv
> > +          - const: axi_mst_err
> > +          - const: vd_addr_wend
> > +          - const: sd_addr_wend
> > +          - const: vsd_addr_wend
> 
> This should move to a conditional block.

I think here we can do similar to patch 2/8.
What about setting here:

  interrupts:
    minItems: 3
    maxItems: 5

  interrupt-names:
    minItems: 3
    maxItems: 5

Then move interrupts and interrupt-names into
the conditional block:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - renesas,r9a07g044-cru
              - renesas,r9a07g054-cru
    then:
      properties:
        interrupts:
          minItems: 3
          maxItems: 3
        interrupt-names:
          items:
            - const: image_conv
            - const: image_conv_err
            - const: axi_mst_err
        ports:
          required:
            - port@0
            - port@1

  - if:
      properties:
        compatible:
          contains:
            enum:
              - renesas,r9a07g043-cru
    then:
      properties:
        interrupts:
          minItems: 3
          maxItems: 3
        interrupt-names:
          items:
            - const: image_conv
            - const: image_conv_err
            - const: axi_mst_err
        ports:
          properties:
            port@0: false

          required:
            - port@1

  - if:
      properties:
        compatible:
          contains:
            const: renesas,r9a09g047-cru
    then:
      properties:
        interrupts:
          minItems: 5
          maxItems: 5
        interrupt-names:
          items:
            - const: image_conv
            - const: axi_mst_err
            - const: vd_addr_wend
            - const: sd_addr_wend
            - const: vsd_addr_wend
        ports:
          properties:
            port@0: false

          required:
            - port@1

> 
> >  
> >    clocks:
> >      items:
> > @@ -120,6 +130,7 @@ allOf:
> >            contains:
> >              enum:
> >                - renesas,r9a07g043-cru
> > +              - renesas,r9a09g047-cru
> >      then:
> >        properties:
> >          ports:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

