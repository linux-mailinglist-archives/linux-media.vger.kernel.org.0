Return-Path: <linux-media+bounces-26940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC5A43DB0
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404123AC803
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 11:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CA7267B60;
	Tue, 25 Feb 2025 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vRnFXI7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42C2676F6;
	Tue, 25 Feb 2025 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740482932; cv=fail; b=CCj8KRdTylkbZ9tvqcUvmeaCylYSoD3EfvWb8pxhR+7WLniiHfoc+kczJvHVRUwdUXOr2wZQHSTthe6t2UxwJezcTsFk4lvf+ZiArLYZH6nFuCgfbHReK+0e+d9PTG6yhckh5+cuPxgkuhjaj2XAS//7TvHhFGPlE9sAOw0cU5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740482932; c=relaxed/simple;
	bh=p+URq0DPhIDCrFnDuUoALjkHuseU7q8lJtQzOZfMz7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KfS1RXkQjmIK2UrEAgUwJHOfwgiOjtiQGpd7PEQwkeV89dSZtkFAtrS8st5iQaMbFKSboI16hkn5UEMoEVHxr2C3M4SczqWbMlEBH9DhZWrS0GyWfjMGAFrsRS+pY9YBQMlDuCCYLRQBLu+hHoEMfTr4xbCC6g6Ic7Jt+cVeqWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vRnFXI7Y; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db1XcXBI1uhdTQhAHJ1uqa9bJ5pYKjaGWyBuQESN03q5mrjrGa2KnZWRDeEOCZb/EXVgp/6S5QSn5Yp90BFIuE+kA3ZVCBuIUcL/NhlE8iv+w4KRxQLN4b0TbxvdUwbIomueQwGTYOKHnIzbbFS15hTkIGUzfJKuZrEWnSmaK9lDKGZJwtPGBROO9EqNdrR7c3jkTHUafpv1S6vef/fYhPjXi2DlgIrj/WOBKkyQm/LRmOeIeYyP3+3floC4dE7JS8OXScadBkUNG9ypwRHOfOHMCqQuZgR8t7MaLdy6FXZtQMF5DlEO8NoXq6Qp6lfixkfI5y6KPMqu6BpRmLvNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwSndH45chyot9e+HOj5kZjfnMeeZCN2f1v4ZtMlMxc=;
 b=SXbNIiTUpEgeBV+zciDLLDsr4LlB6Y10LLc+z1d3ElwyGVjuhM4S/AXlfjX+62q5wkCVz1J6Z8PuxbWh41okk0nJE/g0nsWZe8NxQGuBF/T53jDj6wj9zDBfxXMqr2bIbkOMVWgABnj9Xn05ka2AkKg/N68kLRVYfl4u3YojLEepECtLlZSDS79dp+UfFLqIJPH/vghhnLvwUrNa9KiIR9x/9RBU1surdMWuk3TTrFkOHmcXwVhN5YVg3lFB3qkn0AKt+A9HOfohG7n1Zb2XhzVVB1Q16DTvlkrC5Vnzx51vCq26Lg4aL6rbRTeytc3by5axqPK5MS42v7qXYMa/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwSndH45chyot9e+HOj5kZjfnMeeZCN2f1v4ZtMlMxc=;
 b=vRnFXI7Ye0rDWPrXA9HVJf4ijmdMxfzOoASgdhgWBPndSdqha9x8Tl00UrKjr0hyKbXZm3BRWkVjwoH+0unLRFJ6ZoAQlqLneJch5hTx5XV4VjE23rqOMoVfBu3kisTR80imJ/GbfiFHA2QBVh+FgCsKXNOQt3LQGBX94rgZqd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB13813.jpnprd01.prod.outlook.com (2603:1096:604:36a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 11:28:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 11:28:41 +0000
Date: Tue, 25 Feb 2025 12:28:29 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] media: rzg2l-cru: Add support for RZ/G3E SoC
Message-ID: <Z72pXWPH-lTylNiR@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-19-tommaso.merciai.xr@bp.renesas.com>
 <20250223203230.GE15344@pendragon.ideasonboard.com>
 <Z7y3LP2u2SP4x77M@tom-desktop>
 <20250224183810.GD6778@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224183810.GD6778@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB13813:EE_
X-MS-Office365-Filtering-Correlation-Id: c37b1a3f-489e-4273-7969-08dd558f8e5e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?jAOglS/Nh2WjXEl4DTDNInrybmsTpI4GV0tAZBXKc9nuCJgJLis4BDGofq8O?=
 =?us-ascii?Q?NDkheN2FjuujZ3gBiIVASbtzMMBxmKGZv/VcWqnydrq16Tc/SkirCHH6QOcs?=
 =?us-ascii?Q?cbbUjpNGbwexzoByIV0IxvzYIlB55rz86IFTW5IpxhnjkPyGIFLs3tO+CquQ?=
 =?us-ascii?Q?zGpc9UQRIzGYos5+FWKjVLnBksvaVE+bTofqQfOJLzwvwrw8C/k104xu6iEB?=
 =?us-ascii?Q?uelxpyZR7sKMCwBDXTV1g6a5zCUw4qu3x+dwzWrAyncGBVT2r+QFujl/GWYs?=
 =?us-ascii?Q?nK6EDgvw7aQmU7ffVHCluu2BDWOOwB2cY8YTh3Hqm374YF7HFQWeymkhW89q?=
 =?us-ascii?Q?LECDH+bwmT+cEAsMiABxL+olpz+mVPxeQXR+EQx0C+kt6LPq+PiVkkZ11Z1M?=
 =?us-ascii?Q?Jjh+Ic0QBOxctAGlWfbR0Wg8lKX+ro5Z7+MLUAYPL2Wq2K2EWeH/AqlWuatR?=
 =?us-ascii?Q?ub+1v8inykvROSzDtz83AALgzDskPywxeuAtpxP9E56x9uEamB6BOgLMPklY?=
 =?us-ascii?Q?debkrae5M03CF5hCU1/csKRz3pPfMmmvi5Nk5jB5wfVXpIogQGd7z8DSuY6m?=
 =?us-ascii?Q?nzsSdS5J6FgT8hMKKacT91YXeO4Cgyxw6KBAu4L3jSANZ0JvVaaXGYg83AFs?=
 =?us-ascii?Q?Ui/OLtaYMR8SelQHJgYbCpnPyq5un68EtZknNCI7nhWHsQvzBHri8/lVWzK8?=
 =?us-ascii?Q?bsLl8wOJg9e3NcnaYLSqvP5Z/8KKNlQ9P3R28gXx90fPcOwCDEvJ1GAuD4Tm?=
 =?us-ascii?Q?1NylxGXlimZOltuojIVJ5pSH8yvMNk+eCJaGi3HaNJYJ+JI0dA8zReHn5pr7?=
 =?us-ascii?Q?8Zsmb08Xsd8zkvNgwcUf2q8fJwxXtqRMOuUelT77NzmiiYYTKxWHkCeXMxn4?=
 =?us-ascii?Q?zxKY6W7kbxU+GxCFCsDRgHWNXSZqkNKg7Dpgh/c/Js1jobmF+AjlXErFwsB2?=
 =?us-ascii?Q?mxn8CNnz6t1dDCa6QuXq/il3pAEheodwZLL9BYPJYDV5m2ym73KTgzIGjaxU?=
 =?us-ascii?Q?etjZ5u+SCRvFNkbYh4iF+WyFZQ8S7Qk/xcbKhwBVdruLigfjEVuvfNUoK8PB?=
 =?us-ascii?Q?B3UbWy7km2VrauRs7e/HUBH4eEnhB9hhuLbOQRksx+mWARycC1s+Fwghedfi?=
 =?us-ascii?Q?vkmTJoqidRYbA5i1au9F473Wn3+y2Kb19BQZvM+VvF2wIDATIPgWXEcy8KmZ?=
 =?us-ascii?Q?5oXrzIdF2lhYnF+PAcQsz08MpG6CCDcS/Y6P3rwQLpBIE+5efksDTV77JM0m?=
 =?us-ascii?Q?DhwY0RXS9y+AyTSzXjmXYX1eW9em/FKN4ZKcyDWDWWcqml6d8HySoWaSc//E?=
 =?us-ascii?Q?qWujTwrGw5G/D7BW/FCIxPlLeJXeCxvgSdob1VZRiXJ+MG1jmBxajo9CdsSx?=
 =?us-ascii?Q?5iI2aNzEzp+SxTdNT4LI9ZhskFptBfnSSIHLQw+siNxyCrFGYKccMJJNGdIs?=
 =?us-ascii?Q?lzkRiz5ZiXnyBkLkFKdZ5HYd55uUv4sW?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?okalPqIVF35d5DoD2UqCV2HHAaq3Qdp+hcm67fhFdVcWUqPzdeAz+k409ukK?=
 =?us-ascii?Q?/prx6AkylyKCGU6MfHqmt+dDTGtAKVvOIHIs5A3KyMWc3g7Z24kQO0zJ6kEs?=
 =?us-ascii?Q?x1+qWswMlBncVQH59MVsAqoTLC3SMmrCcYswyukxyIEYUXRkazsQuHu8rd/o?=
 =?us-ascii?Q?d4TbcBx27prnWkA2LSSVV4F9saYUDKc2LT9OY7kjnZ4lwlXMeOsElHddtZpt?=
 =?us-ascii?Q?mnql1KxSiegngI4N9BuiBFDGuLRJ/jCurldqkxWpPRGVURLz6XU9DrfMP6mn?=
 =?us-ascii?Q?VromimvC28GR+wkN5hzudfuEFoZGWK+Q0GLSVW5jZ80qabrUSzf8fqwR8ALC?=
 =?us-ascii?Q?RhZFkLqoKDREhsF08VIkXYTCqKtfSBwgWVm+G4J+37fgxFJ+rULtpcTj56YV?=
 =?us-ascii?Q?ICVmd7xgsRg1H4LpdjlhbDM6yF4NfDvBD1223REsIXkrvoD5JBJAG/6KZB9k?=
 =?us-ascii?Q?TtYJZsqk6uJfq6Tnj67mt5LmfbdYiQU6HaLMvEZHpYh13ep7HbQe3fe4URT5?=
 =?us-ascii?Q?4/Pkd66NxhY9sFDA6JxRLZSUG+cTTy06AgxSWtUVub7W5UJD1RHXhYGopj2N?=
 =?us-ascii?Q?Os7QNwd2j/UWaXT6SE1kWrGiNK2PhIAVnPjtvuKR+LOzoc0ucH3kQRTNH6w8?=
 =?us-ascii?Q?ch9kE5DP4TJMBSxFvrZOoTLQgvuumTeq6GP00evLxD7Pi+LhihBYsaBXPZhU?=
 =?us-ascii?Q?uc1itX3A5QS4p/9AUMlMrHvVBbSaPbdE+0LKscibZuuTfLhfUdV4tT0e8pkz?=
 =?us-ascii?Q?pkDjFj1jgyGBRngoLOnPB6KbvVT1otLCIrvWPxTbyHsWjbkXS5MDrwxR7X2i?=
 =?us-ascii?Q?4bVj1o3koxkC35ujSDx3wQzgiFG0TFREtTtR56+hu+vNcLBRoKSS8sag6whb?=
 =?us-ascii?Q?vw0MqZRwvdpB6/TA6LFrbR6EFnTwfFJThbhhOOx/A10siYF+cepeKGCrZU2I?=
 =?us-ascii?Q?yGK5TidL0+i5ceq7WyqZiGF8OGLD7rTdkW4d8gQ2zbxKXNM6u57gUU6qGCIW?=
 =?us-ascii?Q?R8AhRSUjlvU2QFdwKkGB2hYCNWo5qkbpnuZbTXefAGftEaMyRHsTKbiYJhZx?=
 =?us-ascii?Q?1ogzRkOymjsFB5W3yswAYdMspjRyc6DsdgU8qzgucPMQ1wYEGfEbfiFLHrbX?=
 =?us-ascii?Q?490/C9b/Mm9EqBNL3WzzIXSQk8QM+JZQto19OvVD4TByFEZA7V9WFzRj1cjZ?=
 =?us-ascii?Q?fCbDiM44pPFp2GRro2UcYyhBdd68Q4dBzl9leTB+6Xn333FpL2qQj3Wz7rQD?=
 =?us-ascii?Q?FKTMeFIut5EDCyb1mscSpJiYzWXTIVt44XIuEgmSFIujP3Udo8fY1NrsFOyV?=
 =?us-ascii?Q?vtONJnxdjRX3B8DFBn+CfGnCdN+FQP40L0ZoFU5mhhwjJ6V6E4bGr9mGMoGu?=
 =?us-ascii?Q?lQ9yXsfVDRFsZWq+scPoN6hWHRoKPFZwD0X+0x7Zt8tyMuL5jQVg4wotpJ0o?=
 =?us-ascii?Q?aZ74IwFdVNIXyIp4uR7BlG4HjQmDsCfT7gD9Fnf4Er0xnnoyFAMb2aSF8F03?=
 =?us-ascii?Q?4XY0YWj2OMNpEjL3mfRXAQI2tZVpVnVIgNW7ktiliIKS5r4XIyV91CSJ2DfN?=
 =?us-ascii?Q?Fn6MzyB67ulSZadxEYoBaGs1g7c4G/udqomje7O0yq/fiGPghrYpXGHKJ31/?=
 =?us-ascii?Q?FBKbT0jByL2hJfRf5ESap2Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37b1a3f-489e-4273-7969-08dd558f8e5e
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 11:28:41.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdDHhrWYpsK4V67gEclQCMiP71Zyr+knoQkajHB9+Yi6Kut2GpESihebzasNL5fWTD2dWFn2qJvc+c4nYxTQkRBzXddlVnXFRDVhLQENm/3PUMv37P30+BH9CX7rk1QC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13813

Hi Laurent,

Thank you for your comments.

On Mon, Feb 24, 2025 at 08:38:10PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 24, 2025 at 07:15:31PM +0100, Tommaso Merciai wrote:
> > On Sun, Feb 23, 2025 at 10:32:30PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 21, 2025 at 04:55:32PM +0100, Tommaso Merciai wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > 
> > > > The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
> > > > the Renesas RZ/G2L SoC, with the following differences:
> > > > 
> > > > - Additional registers rzg3e_cru_regs.
> > > > - A different irq handler rzg3e_cru_irq.
> > > > - A different rzg3e_cru_csi2_setup.
> > > > - A different max input width.
> > > > 
> > > > Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
> > > > and RZ/G3E and related RZ/G3E functions:
> > > > 
> > > >  - rzg3e_cru_enable_interrupts()
> > > >  - rzg3e_cru_enable_interrupts()
> > > >  - rz3e_fifo_empty()
> > > >  - rzg3e_cru_csi2_setup()
> > > >  - rzg3e_cru_get_current_slot()
> > > > 
> > > > Add then support for the RZ/G3E SoC CRU block with the new compatible
> > > > string "renesas,r9a09g047-cru".
> > > > 
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  63 +++++++
> > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  18 ++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 178 +++++++++++++++++-
> > > >  4 files changed, 282 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > index 3ae0cd83af16..075a3aa8af29 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > @@ -290,6 +290,13 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > > >  		return ret;
> > > >  
> > > >  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
> > > > +	cru->mem_banks = devm_kmalloc_array(dev, cru->num_buf,
> > > > +					    sizeof(struct rzg2l_cru_mem_bank),
> > > > +					    GFP_KERNEL);
> > > > +	if (!cru->mem_banks)
> > > > +		return dev_err_probe(dev, -ENOMEM,
> > > > +				     "Failed to init mem banks\n");
> > > > +
> > > >  	pm_suspend_ignore_children(dev, true);
> > > >  	ret = devm_pm_runtime_enable(dev);
> > > >  	if (ret)
> > > > @@ -321,6 +328,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > >  	rzg2l_cru_dma_unregister(cru);
> > > >  }
> > > >  
> > > > +static const u16 rzg3e_cru_regs[] = {
> > > > +	[CRUnCTRL] = 0x0,
> > > > +	[CRUnIE] = 0x4,
> > > > +	[CRUnIE2] = 0x8,
> > > > +	[CRUnINTS] = 0xc,
> > > > +	[CRUnINTS2] = 0x10,
> > > > +	[CRUnRST] = 0x18,
> > > > +	[AMnMB1ADDRL] = 0x40,
> > > > +	[AMnMB1ADDRH] = 0x44,
> > > > +	[AMnMB2ADDRL] = 0x48,
> > > > +	[AMnMB2ADDRH] = 0x4c,
> > > > +	[AMnMB3ADDRL] = 0x50,
> > > > +	[AMnMB3ADDRH] = 0x54,
> > > > +	[AMnMB4ADDRL] = 0x58,
> > > > +	[AMnMB4ADDRH] = 0x5c,
> > > > +	[AMnMB5ADDRL] = 0x60,
> > > > +	[AMnMB5ADDRH] = 0x64,
> > > > +	[AMnMB6ADDRL] = 0x68,
> > > > +	[AMnMB6ADDRH] = 0x6c,
> > > > +	[AMnMB7ADDRL] = 0x70,
> > > > +	[AMnMB7ADDRH] = 0x74,
> > > > +	[AMnMB8ADDRL] = 0x78,
> > > > +	[AMnMB8ADDRH] = 0x7c,
> > > > +	[AMnMBVALID] = 0x88,
> > > > +	[AMnMADRSL] = 0x8c,
> > > > +	[AMnMADRSH] = 0x90,
> > > > +	[AMnAXIATTR] = 0xec,
> > > > +	[AMnFIFOPNTR] = 0xf8,
> > > > +	[AMnAXISTP] = 0x110,
> > > > +	[AMnAXISTPACK] = 0x114,
> > > > +	[AMnIS] = 0x128,
> > > > +	[ICnEN] = 0x1f0,
> > > > +	[ICnSVCNUM] = 0x1f8,
> > > > +	[ICnSVC] = 0x1fc,
> > > > +	[ICnIPMC_C0] = 0x200,
> > > > +	[ICnMS] = 0x2d8,
> > > > +	[ICnDMR] = 0x304,
> > > > +};
> > > > +
> > > > +static const struct rzg2l_cru_info rzg3e_cru_info = {
> > > > +	.max_width = 4095,
> > > > +	.max_height = 4095,
> > > > +	.image_conv = ICnIPMC_C0,
> > > > +	.stride = 128,
> > > > +	.regs = rzg3e_cru_regs,
> > > > +	.irq_handler = rzg3e_cru_irq,
> > > > +	.enable_interrupts = rzg3e_cru_enable_interrupts,
> > > > +	.disable_interrupts = rzg3e_cru_disable_interrupts,
> > > > +	.fifo_empty = rz3e_fifo_empty,
> > > > +	.csi_setup = rzg3e_cru_csi2_setup,
> > > > +};
> > > > +
> > > >  static const u16 rzg2l_cru_regs[] = {
> > > >  	[CRUnCTRL] = 0x0,
> > > >  	[CRUnIE] = 0x4,
> > > > @@ -367,6 +426,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
> > > >  };
> > > >  
> > > >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > > > +	{
> > > > +		.compatible = "renesas,r9a09g047-cru",
> > > > +		.data = &rzg3e_cru_info,
> > > > +	},
> > > >  	{
> > > >  		.compatible = "renesas,rzg2l-cru",
> > > >  		.data = &rzgl2_cru_info,
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > index 82920db7134e..1646d1e2953c 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > @@ -14,8 +14,13 @@
> > > >  
> > > >  #define CRUnIE_EFE			BIT(17)
> > > >  
> > > > +#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
> > > > +#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
> > > > +
> > > >  #define CRUnINTS_SFS			BIT(16)
> > > >  
> > > > +#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
> > > > +
> > > >  #define CRUnRST_VRESETN			BIT(0)
> > > >  
> > > >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > > > @@ -32,7 +37,14 @@
> > > >  #define AMnAXIATTR_AXILEN		(0xf)
> > > >  
> > > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > > +#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
> > > > +#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
> > > >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > > > +#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
> > > > +#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
> > > > +
> > > > +#define AMnIS_IS_MASK			GENMASK(14, 7)
> > > > +#define AMnIS_IS(x)			((x) << 7)
> > > >  
> > > >  #define AMnAXISTP_AXI_STOP		BIT(0)
> > > >  
> > > > @@ -40,6 +52,11 @@
> > > >  
> > > >  #define ICnEN_ICEN			BIT(0)
> > > >  
> > > > +#define ICnSVC_SVC0(x)			(x)
> > > > +#define ICnSVC_SVC1(x)			((x) << 4)
> > > > +#define ICnSVC_SVC2(x)			((x) << 8)
> > > > +#define ICnSVC_SVC3(x)			((x) << 12)
> > > > +
> > > >  #define ICnMC_CSCTHR			BIT(5)
> > > >  #define ICnMC_INF(x)			((x) << 16)
> > > >  #define ICnMC_VCSEL(x)			((x) << 22)
> > > > @@ -52,7 +69,9 @@
> > > >  enum rzg2l_cru_common_regs {
> > > >  	CRUnCTRL,	/* CRU Control */
> > > >  	CRUnIE,		/* CRU Interrupt Enable */
> > > > +	CRUnIE2,	/* CRU Interrupt Enable(2) */
> > > >  	CRUnINTS,	/* CRU Interrupt Status */
> > > > +	CRUnINTS2,	/* CRU Interrupt Status(2) */
> > > >  	CRUnRST, 	/* CRU Reset */
> > > >  	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > > >  	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > > > @@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
> > > >  	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > > >  	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > > >  	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > > > +	AMnMADRSL,	/* VD Memory Address Lower Status Register */
> > > > +	AMnMADRSH,	/* VD Memory Address Higher Status Register */
> > > >  	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > > >  	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > > >  	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > > >  	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > > > +	AMnIS,		/* Image Stride Setting Register */
> > > >  	ICnEN,		/* CRU Image Processing Enable */
> > > > +	ICnSVCNUM,	/* CRU SVC Number Register */
> > > > +	ICnSVC,		/* CRU VC Select Register */
> > > >  	ICnMC,		/* CRU Image Processing Main Control */
> > > > +	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
> > > >  	ICnMS,		/* CRU Module Status */
> > > >  	ICnDMR,		/* CRU Data Output Mode */
> > > >  };
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > index ccaba5220f1c..3301379c132c 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > @@ -84,6 +84,7 @@ struct rzg2l_cru_info {
> > > >  	unsigned int max_width;
> > > >  	unsigned int max_height;
> > > >  	u16 image_conv;
> > > > +	u16 stride;
> > > >  	const u16 *regs;
> > > >  	irqreturn_t (*irq_handler)(int irq, void *data);
> > > >  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> > > > @@ -94,6 +95,11 @@ struct rzg2l_cru_info {
> > > >  			  u8 csi_vc);
> > > >  };
> > > >  
> > > > +struct rzg2l_cru_mem_bank {
> > > > +	dma_addr_t addrl;
> > > > +	dma_addr_t addrh;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct rzg2l_cru_dev - Renesas CRU device structure
> > > >   * @dev:		(OF) device
> > > > @@ -108,6 +114,8 @@ struct rzg2l_cru_info {
> > > >   * @vdev:		V4L2 video device associated with CRU
> > > >   * @v4l2_dev:		V4L2 device
> > > >   * @num_buf:		Holds the current number of buffers enabled
> > > > + * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
> > > > + * @mem_banks:		Memory addresses where current video data is written.
> > > >   * @notifier:		V4L2 asynchronous subdevs notifier
> > > >   *
> > > >   * @ip:			Image processing subdev info
> > > > @@ -144,6 +152,9 @@ struct rzg2l_cru_dev {
> > > >  	struct v4l2_device v4l2_dev;
> > > >  	u8 num_buf;
> > > >  
> > > > +	u8 svc_channel;
> > > > +	struct rzg2l_cru_mem_bank *mem_banks;
> > > > +
> > > >  	struct v4l2_async_notifier notifier;
> > > >  
> > > >  	struct rzg2l_cru_ip ip;
> > > > @@ -175,6 +186,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
> > > >  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
> > > >  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> > > >  irqreturn_t rzg2l_cru_irq(int irq, void *data);
> > > > +irqreturn_t rzg3e_cru_irq(int irq, void *data);
> > > >  
> > > >  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
> > > >  
> > > > @@ -188,10 +200,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> > > >  
> > > >  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> > > >  void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> > > > +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> > > > +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> > > >  
> > > >  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> > > > +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
> > > >  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > >  			  const struct rzg2l_cru_ip_format *ip_fmt,
> > > >  			  u8 csi_vc);
> > > > +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > > +			  const struct rzg2l_cru_ip_format *ip_fmt,
> > > > +			  u8 csi_vc);
> > > >  
> > > >  #endif
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index 637c9c9f9ba8..efd70c13704e 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -138,6 +138,9 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> > > >  	/* Currently, we just use the buffer in 32 bits address */
> > > 
> > > Should this be fixed ?
> > > 
> > > >  	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> > > >  	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
> > > > +
> > > > +	cru->mem_banks[slot].addrl = lower_32_bits(addr);
> > > > +	cru->mem_banks[slot].addrh = upper_32_bits(addr);
> > > 
> > > Here you stplit the dma_addr_t in two fields, storing the low and high
> > > parts separately (but still in dma_addr_t variables), and below you
> > > recombine those two fields to recreate the full address. That doesn't
> > > seem needed.
> > 
> > We can use:
> > 
> > struct rzg2l_cru_mem_bank {
> > 	dma_addr_t addr;
> > };
> 
> Drop rzg2l_cru_mem_bank and just use dma_addr_t.

Oks, I will fix this in v3.

> 
> > cru->mem_banks[slot].addr = addr;
> > Instead of using low and high.
> > 
> > Then accordingly update the rzg3e_cru_get_current_slot()
> > 
> > > >  }
> > > >  
> > > >  /*
> > > > @@ -176,7 +179,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> > > >  	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> > > >  }
> > > >  
> > > > -static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > > +static int rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >  	unsigned int slot;
> > > >  	u32 amnaxiattr;
> > > > @@ -190,10 +193,45 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > >  	for (slot = 0; slot < cru->num_buf; slot++)
> > > >  		rzg2l_cru_fill_hw_slot(cru, slot);
> > > >  
> > > > +	if (cru->info->stride) {
> > > 
> > > I'd name this field stride_align or something similar.
> > 
> > Agreed on stride_align.
> > Will update this in v3.
> > 
> > > > +		u32 stride = cru->format.bytesperline;
> > > > +		u32 amnis;
> > > > +
> > > > +		if (stride % cru->info->stride) {
> > > > +			dev_err(cru->dev,
> > > > +				"Bytesperline must be multiple of %u bytes\n",
> > > > +				cru->info->stride);
> > > > +			return -EINVAL;
> > > > +		}
> > > 
> > > This needs to be caught at set format time, and the stride must be
> > > adjusted then.
> > 
> > What about doing this into the rzg2l_cru_format_align() function?
> > Somenthing like:
> > 
> > 	if (info->stride_align) {
> > 		u32 stride = pix->width * fmt->bpp;
> 
> 		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
> 				   RZG2L_CRU_MAX_STRIDE);
> 
> to honour the userspace request and to avoid overflows.
> 
> 
> RZG2L_CRU_MAX_STRIDE may need to be turned into an info field. That may
> be slightly over-engineered though, unless you expect other versions of
> the CRU with different stride alignments, maybe an info->has_stride
> field would be enough, you can then use macros for the stride alignement
> and maximum value.

Agreed.
I will go for info->has_stride field + macros way as you suggested.
Thanks.

> 
> > 
> > 		if (stride % info->stride_align) {
> > 			dev_warn(cru->dev,
> > 				"Bytesperline (%u) is not aligned to %u bytes, adjusting it\n",
> > 				stride, info->stride_align);
> 
> Drop the warning, we shouldn't allow userspace to flood the kernel log.
> 
> > 
> > 			stride = ALIGN_DOWN(stride, info->stride_align);
> 
> Align up, not down. ALIGN() requires the alignment to be a power of two,
> use round_up() if that's not a guarantee.
> 
> > 			pix->width = stride / fmt->bpp;
> 
> No, width doesn't change based on the stride. Only bytesperline does.
> Drop this whole conditional block, and just do
> 
> 		pix->bytesperline = round_up(stride, info->stride_align);
> 	} else {
> 		pix->bytesperline = pix->width * fmt->bpp;
> 	}

Thanks for the clarifications.

> 
> > 		}
> > 	}
> > 
> > 	/* Limit to CRU capabilities */
> > 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
> > 			      &pix->height, 240, info->max_height, 2, 0);
> > 
> > 	pix->bytesperline = pix->width * fmt->bpp;
> 
> Drop this line.
> 
> > 	pix->sizeimage = pix->bytesperline * pix->height;
> > 
> > 
> > > 
> > > > +		stride = stride / cru->info->stride;
> > > 
> > > 		stride /= cru->info->stride;
> > > 
> > > > +		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> > > > +		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> > > > +	}
> > > > +
> > > >  	/* Set AXI burst max length to recommended setting */
> > > >  	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
> > > >  	amnaxiattr |= AMnAXIATTR_AXILEN;
> > > >  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > > +			  const struct rzg2l_cru_ip_format *ip_fmt,
> > > > +			  u8 csi_vc)
> > > > +{
> > > > +	const struct rzg2l_cru_info *info = cru->info;
> > > > +	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> > > > +
> > > > +	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
> > > > +
> > > > +	/* Set virtual channel CSI2 */
> > > > +	icnmc |= ICnMC_VCSEL(csi_vc);
> > > > +
> > > > +	rzg2l_cru_write(cru, ICnSVCNUM, cru->svc_channel);
> > > 
> > > As far as I can tell, csi_vc and cru->svc_channel hold the same value.
> > > You can drop ths svc_channel field.
> > 
> > Agreed here I can directly use:
> > 
> > rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> > 
> > Thanks
> > 
> > > > +	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> > > > +			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> > > > +	rzg2l_cru_write(cru, info->image_conv, icnmc);
> > > >  }
> > > >  
> > > >  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > > @@ -244,6 +282,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> > > > +
> > > > +	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
> > > > +	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
> > > > +	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
> > > > +	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
> > > > +		return true;
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > >  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >  	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
> > > > @@ -355,6 +406,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > > >  	return fd.entry[0].bus.csi2.vc;
> > > >  }
> > > >  
> > > > +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
> > > > +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
> > > > +}
> > > > +
> > > > +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	rzg2l_cru_write(cru, CRUnIE, 0);
> > > > +	rzg2l_cru_write(cru, CRUnIE2, 0);
> > > > +	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
> > > > +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> > > > +}
> > > > +
> > > >  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >  	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> > > > @@ -377,6 +442,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > >  	csi_vc = ret;
> > > > +	cru->svc_channel = csi_vc;
> > > >  
> > > >  	spin_lock_irqsave(&cru->qlock, flags);
> > > >  
> > > > @@ -390,7 +456,11 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > > >  	cru->info->disable_interrupts(cru);
> > > >  
> > > >  	/* Initialize the AXI master */
> > > > -	rzg2l_cru_initialize_axi(cru);
> > > > +	ret = rzg2l_cru_initialize_axi(cru);
> > > > +	if (ret) {
> > > > +		spin_unlock_irqrestore(&cru->qlock, flags);
> > > > +		return ret;
> > > > +	}
> > > 
> > > This will go away once you remove the error check from
> > > rzg2l_cru_initialize_axi(), which should then remain a void function.
> > 
> > Ooks, thanks.
> > 
> > > There's another function returning an error here,
> > > rzg2l_cru_initialize_image_conv(). I think it can also become void (in a
> > > separate patch).
> > > 
> > > >  
> > > >  	/* Initialize image convert */
> > > >  	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
> > > > @@ -555,6 +625,110 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > > >  	return IRQ_RETVAL(handled);
> > > >  }
> > > >  
> > > > +static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	dma_addr_t amnmadrs;
> > > > +	unsigned int slot;
> > > > +
> > > > +	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> > > > +	amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
> > > 
> > > What if the two registers are read on a frame boundary ?
> > 
> > Nice point.
> > 
> > You are suggesting here to read the AMnMADRSL and AMnMADRSH with a single
> > ioread64 starting from AMnMADRSL right?
> 
> Is that guaranteed to be atomic ? I wouldn't count on that if the
> APB/AHB interface to registers is 32-bit wide.
> 
> > > > +
> > > > +	for (slot = 0; slot < cru->num_buf; slot++) {
> > > > +		dma_addr_t buf_addr;
> > > > +
> > > > +		buf_addr = cru->mem_banks[slot].addrh << 32 |
> > > > +			cru->mem_banks[slot].addrl;
> > > > +
> > > > +		/* Ensure amnmadrs is within this buffer range */
> > > > +		if (amnmadrs >= buf_addr &&
> > > > +		    amnmadrs < buf_addr + cru->format.sizeimage) {
> > > > +			return slot;
> > > > +		}
> > 
> > Here with the upper changes I can use:
> > 
> > 	for (slot = 0; slot < cru->num_buf; slot++) {
> > 
> > 		/* Ensure amnmadrs is within this buffer range */
> > 		if (amnmadrs >= cru->mem_banks[slot].addr &&
> > 		    amnmadrs < cru->mem_banks[slot].addr +
> > 		    cru->format.sizeimage) {
> > 			return slot;
> > 		}
> > 	}
> > 
> > > > +	}
> > > > +
> > > > +	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > > +irqreturn_t rzg3e_cru_irq(int irq, void *data)
> > > > +{
> > > > +	struct rzg2l_cru_dev *cru = data;
> > > > +	unsigned int handled = 0;
> > > > +	unsigned long flags;
> > > > +	unsigned int slot;
> > > > +	u32 irq_status;
> > > > +
> > > > +	spin_lock_irqsave(&cru->qlock, flags);
> > > > +	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> > > > +	if (!(irq_status))
> > > > +		goto done;
> > > > +
> > > > +	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> > > > +
> > > > +	handled = 1;
> > > > +
> > > > +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> > > > +
> > > > +	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> > > > +	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> > > > +		dev_dbg(cru->dev, "IRQ while state stopped\n");
> > > > +		goto done;
> > > > +	}
> > > > +
> > > > +	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> > > > +		if (irq_status & CRUnINTS2_FSxS(0) ||
> > > > +		    irq_status & CRUnINTS2_FSxS(1) ||
> > > > +		    irq_status & CRUnINTS2_FSxS(2) ||
> > > > +		    irq_status & CRUnINTS2_FSxS(3))
> > > > +			dev_dbg(cru->dev, "IRQ while state stopping\n");
> > > > +		goto done;
> > > > +	}
> > > > +
> > > > +	slot = rzg3e_cru_get_current_slot(cru);
> > > > +	if (slot < 0)
> > > > +		goto done;
> > > > +
> > > > +	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> > > > +
> > > > +	cru->mem_banks[slot].addrl = 0;
> > > > +	cru->mem_banks[slot].addrh = 0;
> > > > +
> > > > +	/*
> > > > +	 * To hand buffers back in a known order to userspace start
> > > > +	 * to capture first from slot 0.
> > > > +	 */
> > > > +	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> > > > +		if (slot != 0) {
> > > > +			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> > > > +			goto done;
> > > > +		}
> > > > +		dev_dbg(cru->dev, "Capture start synced!\n");
> > > > +		cru->state = RZG2L_CRU_DMA_RUNNING;
> > > > +	}
> > > > +
> > > > +	/* Capture frame */
> > > > +	if (cru->queue_buf[slot]) {
> > > > +		cru->queue_buf[slot]->field = cru->format.field;
> > > > +		cru->queue_buf[slot]->sequence = cru->sequence;
> > > > +		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
> > > > +		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
> > > > +				VB2_BUF_STATE_DONE);
> > > > +		cru->queue_buf[slot] = NULL;
> > > > +	} else {
> > > > +		/* Scratch buffer was used, dropping frame. */
> > > > +		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
> > > > +	}
> > > > +
> > > > +	cru->sequence++;
> > > > +
> > > > +	/* Prepare for next frame */
> > > > +	rzg2l_cru_fill_hw_slot(cru, slot);
> > > > +
> > > > +done:
> > > > +	spin_unlock_irqrestore(&cru->qlock, flags);
> > > > +	return IRQ_RETVAL(handled);
> > > > +}
> > > > +
> > > >  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
> > > >  {
> > > >  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

