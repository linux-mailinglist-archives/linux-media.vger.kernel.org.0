Return-Path: <linux-media+bounces-27472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44190A4DD20
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B687189A8D1
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542D91FF7CA;
	Tue,  4 Mar 2025 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="bLLCaBBD"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D636D201024;
	Tue,  4 Mar 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089201; cv=fail; b=USDyS6uDZyIS4ZTSJfs3N71h8rEGSEuXJrxtH1WPTxJZE7rGcXvhwwyJvRyK+wASo5dp+BADoCsKztJKHcsjMUY9dkZAofm13kmYth++SIWt785BQNSrMAcFN2bnIgLnr5B2MZgfbCv9ZazNmSm5tRc3ahCcDcIH94RuuvPZG/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089201; c=relaxed/simple;
	bh=8J7qYI83f2DiN5PSPl7MsC7qA3HBTF/VLd94rLZjxog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K6Z7RaEPngGnMYTWE0dIxpesaDpJD1edlJuyj/0hIuZT+ke3kUMsaiX88ISECTjTalTEH8AB4Q11/HZvpuJrHjms6SYm0LxyCpWlS+8SMifMo+htckp+twJ10D3vVLFQu0OgSK3rwmxIxdWuOjg28XsUMuqN59iRXcbYH8RHB6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=bLLCaBBD; arc=fail smtp.client-ip=40.107.20.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1JwDP1ubpiO8G9UnhntzNWg9sMIV0sjZjXPgfpFlmnL381sudmMcmK6BYrdXSE3Iol+N9kqWQUXKUdSHxF0kemJG4ynJ8B3+NJ3rryZgluKK6ozLhDCP52f3wab2tT63jUlFZqiDW6aojqtSF12Z9il0pcfVfPXUziUTN119XPYXPU6/cVO0dPMvWVJao8Qpd3G4goQouSnPoWKpCJ8oYwqtz+djKMGa6ONTgilZm2oEqKqBLuWJMjs0ihLxoxskFAHtdKgbBUvDv+JPpE0lesJ9fUeRZx+9+FKpBJSc+iTpW3KZLu5Z7rDZeMMVnEBVhf6qa3hmO/63i3SRh7XbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rx8jiJQQx5OAZ0ObisO8Ci46WTdYRZaj4kTZGKdDJU=;
 b=Y84OiIEEkxoiiuLAVsaNAXh1+2ilgdGUkfo5oE1by6bWMd/MCgYquGDjghIDKgN8zcj86ua4hLnJ+Ll0ebcM/Wr6IKzNIyeI9OoIos4rm66JFEo3u2LhsMwu3kvqNu9Gt23WvbztyXIaeF++ZzhOAK1G7jRB0wKLAyzXdJE4ib812rlikQzC14sIkej6NI2V9qAUj11MRwBMvIdKWILeKMvGIJA+34WtZjPp10awQN4+HGD8XtdrYW3q80yW40jFk1aVUm/7Oco3DYWr7BC4k21m3V9r/XbtXvWEN/+vnJSE+1m7nF0VBjSXMZP53Tgiwxj4Cfsm7emMohpFhQr9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Rx8jiJQQx5OAZ0ObisO8Ci46WTdYRZaj4kTZGKdDJU=;
 b=bLLCaBBDu7A0++ebpuv4So4uLLJ4TSZgnl0DbiBHdpTKiIzTaegF3yBuik4/vUxs5wPnAV6j5cgJ7ZptdVjAQMhEzE/cM2FiKg9LXEDDcxwnLwhbQrwBoHeCZ1isg7vLY/ikcKlf89Mg7VG2HFexCvzYMkMuJ20iYkRNlDlMMshl5GrZluXbBOMRKJ+0J5bFzWX7RVeuFxXRzWOYWwvLyvX6L0j19Lh84jM3ll///+jQHDlZ6lfQlaCBc81J9hcedFqILu9pyoGZu+pOMVGL1KGYuJqF0z9oAYzrcwz+dC3Fh4A8eliWy1cMPDRX92aMyGDs6H+MXAKPJ7TRNrtndA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by DB3PR03MB10131.eurprd03.prod.outlook.com
 (2603:10a6:10:43e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.28; Tue, 4 Mar
 2025 11:53:16 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:53:16 +0000
Date: Tue, 4 Mar 2025 12:53:05 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 1/8] MT9M114: Add bypass-pll DT-binding
Message-ID: <Z8bpobFg3BnNHJ+/@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-2-mathis.foerst@mt.com>
 <Z788hw7pSpwmL2Ze@kekkonen.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z788hw7pSpwmL2Ze@kekkonen.localdomain>
X-ClientProxiedBy: ZR0P278CA0117.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::14) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|DB3PR03MB10131:EE_
X-MS-Office365-Filtering-Correlation-Id: eba7f282-f51a-4a64-2a4f-08dd5b132679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YeLefpiXvZnashLervtFp5SXghRFGw9EVu1u1bdtCZPNdFo/tWI1cyzS/P0c?=
 =?us-ascii?Q?P4QAV2QE/3velW+Pzkfuq+DlerDgWeXIT48kwh1aBVb5Pvugn/2YrSj7tRHW?=
 =?us-ascii?Q?T3A/umm/OrJJaaATJLO3vsAThFejXwHBw9cOgfC5UgkOgY1nIGAtQ6l4X6mv?=
 =?us-ascii?Q?gpDJQW/LtW89PH2aguz2r4wUuWdGnWNzckkWCnLQ9Y953pjbYoPWy/YVf5WL?=
 =?us-ascii?Q?56r+22vjzxWz7l5zNhpCCJjxEUsCNtTyeMl0SybtlXgilbD9mJHM4TWYXX1O?=
 =?us-ascii?Q?7qrNQ78rtlDKs8W1t5jOxoOn/JCPLWRiKnMjuhKY3TqOvfceJy0253ws4QC2?=
 =?us-ascii?Q?XBhoQ/miMQ3jYDbRyGbEmP2LoL0wxAQ8tEW8YY6RtDTII+25L2UuJ5QjQIjv?=
 =?us-ascii?Q?CjBHquoP/jUeAU2WmRtLhVA4+XjMKAiMNsEC3Eo7vaSPQDHCikp1DuhsZ7LP?=
 =?us-ascii?Q?T1CqCsFNB2zqr1uhgixjHTJEIhaAi7hsjN+uUU4BDR2+AkEJ6n3vRtahEHY4?=
 =?us-ascii?Q?07p29CrffUmqt79gzS7WDuzfQL4eqLtzy1gbZvi6pgXfjOzw0Ax5O7JXsmic?=
 =?us-ascii?Q?hMMi5X84KZ+7EwL6RqK39dsFMS3uujGYshjGR0Wfrt/d3rFxVRLhupkcT8+5?=
 =?us-ascii?Q?ZevZAEYO9fiCyTSThaPGOsKlBUnih6z2aSONBa4GLgthE1yVj0dW45Y8n6Ro?=
 =?us-ascii?Q?qMqZ9vuucJl+5lg0CPHSzF1x/a1kuOf/D7QQL0jK8MnGSVYaWn9WrJkjSyWa?=
 =?us-ascii?Q?k2gcoRrPPFg56GpgJwhxFs/mer41OeQXg2PySJeaPU4PB7LQRTPOcXuT9x5Z?=
 =?us-ascii?Q?6dPe5+fZrnj5GTjnpypJkBuU2hT4CzQdPr0O0k7taQ5xg0NYqXbkSsJL1gPv?=
 =?us-ascii?Q?+10RnFzVaVR9tdalUeqykbogiRk/6i3AbT8LU1a06SsiOGDWRgvYm7v0IROX?=
 =?us-ascii?Q?d/phlo2oTR5/8Kry+9zshDQvzKjx2neKNeFTQPPJYxUl7yLnwnxpOpRkVN5R?=
 =?us-ascii?Q?0xq/uSoaP2c8YzPMLF/LMd4pdumTEaXiIzMJ9GqoZqFDWzJCNzc76nkTWmaR?=
 =?us-ascii?Q?TkB705o4OPhsqNbIvcWRxMDUEsDxCje6XZCm0+1fLyIpleDECekCzXCoZ2JV?=
 =?us-ascii?Q?2g+hH0MTB+WUPk2IQuRyyZZPulWiDn3YIGVFw4WjeU0v51fcZNCK0Xa/Ia5x?=
 =?us-ascii?Q?drQyV5whFm/WAKCZnoImZT5meA1ocmCMUi1WhwesI4q6/bwaJbTf1MbZSE7I?=
 =?us-ascii?Q?ie7lgKtZuNzus10fQbPaxJfKSngeYaSe8Anr/M38raPcaDkmguaLO4Aw/c0K?=
 =?us-ascii?Q?JFGaenF87JzZIzEVmWBcbGP96gPgX9fv9uNAE6Bd08znlchcx4L409IixuDS?=
 =?us-ascii?Q?1IIue27kwaJOsKZ8ygOZ7Ts2x9VZxE81iswYdVUS5d+5znTVv1Wd9PIVFzXc?=
 =?us-ascii?Q?2msxhAE6vBr/3MAXzewVmU+hr4LZZekH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DJv2LZxb9nbwh55n1EpqDoW0VSP3Ev5oDFQXVLJPMAwmspTYhEndn4ABLdy5?=
 =?us-ascii?Q?wFDGoJesmNt0vaR68wewdT/x+g2XdfsPkhHVP/2NCVOiUnrWu56Z+DSwiGIB?=
 =?us-ascii?Q?AMNHdFgoYPWtO7MsvW7kpprH7K5gHYUZPHomrQ+HsOlbhBeg4B3zN7buIRbN?=
 =?us-ascii?Q?+kCRLfiv3HArFxA8XdRjwpPnSl3i/Qw1K237r9Bww5myG+Z+U7cAsKByV3YZ?=
 =?us-ascii?Q?LJZ7aQjNC8FQEg9hW5iKEvRQZ2xVWOpgfLALQRRkqA2k4PZZqSKP43UWJTCy?=
 =?us-ascii?Q?j2YWT5BsIzYn+wgNeN4yE4seDR5rRnrTnh6r8zdx1LJK81xWI7eGlRhn8eZM?=
 =?us-ascii?Q?jP3oVFX26qdXyi2NgB/bodqcY7rBrm7o0YAr1xsLExVmb6nUcdHW30IhZfTY?=
 =?us-ascii?Q?1N2cBtQVfywVsKMbm0VaHv3VeDtqvc0OKgo+vBwUgemJfsSSQ/hsihoNwonM?=
 =?us-ascii?Q?OzlcM94brc3sS0iGJrTFJQPQ2/9mHwWchVGZaae8t0UwfB5MlI6pH12Un46h?=
 =?us-ascii?Q?eZt0xwgAZ0h9P2sUyzCzqziSpQdjr4USrvnlR5LLRtxcpUQ97ISk4Iv0BDGF?=
 =?us-ascii?Q?3FXFlpVVip7pHg00bhQhRQLYSgnuNIkYpOm4cuJd0e+bZMSdT9FClWAMjFbF?=
 =?us-ascii?Q?1UCKeW6VaenoHpbkARkmk9UiHo7U7aZqbZlMIj1wwfEtgm07Xi20+RHIqe+k?=
 =?us-ascii?Q?fJW4fPedyiOsZLJS/UH4lliDDxvGXbkNlOEoonke+3ypLH7bO3RtRplV+5Aj?=
 =?us-ascii?Q?m+hn6LVolDEnjJZudlzJo6u5vsct7lhTin0KkrzeDBiIQm86J4of1oKhcNiF?=
 =?us-ascii?Q?eglP2pHzbKLAsfGzFTeJA7riuUOKiLEiLRe74IcKv9G+UczMdSov0dB6MCb0?=
 =?us-ascii?Q?/CNI5U6tNfZHrnuTk7fs/mzincWPpZKDmChSOUVnSbopub0noSWPh85VSeuf?=
 =?us-ascii?Q?MptsfO5XX0//luxODzJb30Z8ESb0VvDteOpWC+YIOSqLiOYl5Tbi2Zxbztxq?=
 =?us-ascii?Q?NFDv0SENAo7FJjG8o/SDQSe4isgTJVaptUOGSWArQtFoWrPEQSyoscUXrAa4?=
 =?us-ascii?Q?4UTA7MJL5iKdhVjPMEh56bLBFzA7rRjPPQ1L66hGz2sMWaA+5bmQyqVLE3rA?=
 =?us-ascii?Q?iPrEdt/1z/xS2/TzCiZY9pfqUcaeQBa5OkAUAS9ojoeS7wf1ouCy4L1V2p/7?=
 =?us-ascii?Q?anFaIb+agLFn87GKYo1FYS9RavlD3h227J0KPE1zjdm+E7sB7y787H3g/lQR?=
 =?us-ascii?Q?cD90Kbf6EIjRIKwVWdqOOH4aOqbatQ6uwCVkxiiUpZyMAFTOExQ2JpUwLgwe?=
 =?us-ascii?Q?XDQpVglt3qcasPMjpuYG1QVg1eSa3B5GDpm8rwSkKm+eKQF/AHVanf2w5xxU?=
 =?us-ascii?Q?eZDHZF8joBq4ND8LYsF5AxiT5v/53O74D7kMEB6L3X5ZONXZPtWAahTNWmmI?=
 =?us-ascii?Q?gashFGUAJORVkOirIfv4pHCgbY24YGEzzOjUsqi0oryA1ojfjV0xUA9uNscG?=
 =?us-ascii?Q?isMZ4q7gxblBFb6WMaVUJciIhAEagG0FXd04tyDEjGL5ui1AFUsVpNMgyw5W?=
 =?us-ascii?Q?5QzH2sCUHsPhrGFkZ/Anos4+yUrmdj2WwXFrh7Vr?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba7f282-f51a-4a64-2a4f-08dd5b132679
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:53:16.6261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HWI4X7ES0Zq/2IWRRmpcILPQQ87uSY+ONrw/GsL4nBNUp+ijOlwfl8J55e0vfku+2FtrUAgOckw+qkbY0I9LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR03MB10131

Hi Sakari

On Wed, Feb 26, 2025 at 04:08:39PM +0000, Sakari Ailus wrote:
> Hi Mathis,
> 
> Please see which subject prefix has been used in the past for these
> bindings.

Yes, I'm sorry for that. I adapted the subjects of the patches.

> 
> On Wed, Feb 26, 2025 at 04:39:22PM +0100, Mathis Foerst wrote:
> > The MT9M114 sensor has an internal PLL that generates the required SYSCLK
> > from EXTCLK. It also has the option to bypass the PLL and use EXTCLK
> > directly as SYSCLK.
> > The current driver implementation uses a hardcoded PLL configuration that
> > requires a specific EXTCLK frequency. Depending on the available clocks,
> > it can be desirable to use a different PLL configuration or to bypass it.
> > 
> > Add the 'bypass-pll' property to the MT9M114 DT-bindings to allow selecting
> > the PLL bypass mode.
> > 
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > index f6b87892068a..72e258d57186 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -70,6 +70,10 @@ properties:
> >            - bus-type
> >            - link-frequencies
> >  
> > +  onnn,bypass-pll:
> > +    description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
> > +    type: boolean
> > +
> 
> But on the content itself: do you need this? Could you instead compare the
> external clock frequency to the link-frequencies property value(s)?

That should also work. I removed the DT binding and let the driver check if
EXTCLK matches the required SYSCLK for the given link frequency to decide if
the PLL should be bypassed.

> 
> >  required:
> >    - compatible
> >    - reg
> 
> -- 
> Regards,
> 
> Sakari Ailus

Best regards,
Mathis Foerst

