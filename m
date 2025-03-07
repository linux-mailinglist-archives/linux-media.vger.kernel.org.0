Return-Path: <linux-media+bounces-27817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91CA56425
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C7023A8461
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBF820B7EF;
	Fri,  7 Mar 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Ntf3wSeW"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013036.outbound.protection.outlook.com [52.101.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6B02063F1;
	Fri,  7 Mar 2025 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340518; cv=fail; b=tpyuJE/wvU0PJKYOTGkXxAgbvndzvoAia7tCmcaRk4v/fxiJuPFW0LikcbOj/CmXbC+iP0AH1E1t6/3z/fgAQMGCLwUgR/2v3NsZA87uZSCZOtCQxry+DYZfrYIP7bhrOjOdlebBP2A4Wd93F1BPVAqqC6spd1Jetn7vZsyW6mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340518; c=relaxed/simple;
	bh=bd2qyFZPzLM/vHrJtWfOViNgOk7OeteGbdKWJgoFcYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nV9gplGBn4kBfqi0K+76LY1YQpaf7VPgVefkyJIw3rQFoPZ6At49l8kJjBzikTV1m81j/r9FwfqvebgOJawCd446o8MTRBbOkUlwQ32lVNND0gPfFbGkCjgdY9qpxQphxfNihoXhh0GslIG7GAibF8hp3p8ExaVS24zQqOhJa1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Ntf3wSeW; arc=fail smtp.client-ip=52.101.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1BVN6EnRykWYHVfXsaw5LLgOonroQCqh+PHvWKZaispO6xVmZW1MFd16Y+LPCTvYTHbrcsCTqDo1t//YRK6Ho0TiWDXnMBBtuofcpUzKRUfJMWwAeUWdN6ZtzSZIbrVTyVM6hrY7hiw3+Lx3Git3rAab76tN5J/ZcCTbuOiutP5SilDCMphHcGiUhaxcRBcBavA0Y+Fsj0kVErY5rQSS/yJk6VF4+kegD8yLcH+lZcldHw7AkaOjiv0gNulL7mM3KaXmOOQx7I6pp+X800zg3SIOUNAUL8EadtEcjUHPDsc+Zv0hocRuSiBhVmFG8UgxJsq5Q2rKknbadEfYD7kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JR98LGZXt+CNTV5AR5kD4p2FkRbUo68pZ81MKP2qhAQ=;
 b=vgvpROH7fqjoLOrd0DiYimwnkzG228eU3XHbPJAqLyVB2wDzjdGEOVNGQ81pVon+G/HIR/RmMy3FbOS59sl01mMgj4OpGFSN/sZkknwjOjPSm8gMpmL5fCIMkzUr3ulpvi3H3o+LmFT1+QhoK3AEEJABMGA0SVTuwcLxzA3uumAg6lKG6OZJPqcka1cUW8VXycWXFsY35XIOB6M9ZVelqWGZEDe4MuoaqAILFlTeV+Vt/kj0tfRpwY/6J4MU4wGSyW2KvhJvt9dPk5HzwQGyVGv4UyoP+v32/aKSEYcG5S5GR3tn4Vqhidm5plunqK/ZalgD7/tOQcuJTBR3L3yMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR98LGZXt+CNTV5AR5kD4p2FkRbUo68pZ81MKP2qhAQ=;
 b=Ntf3wSeW/PAXm8xpACMuztxyIaHcAhx5m6d0whzybCL7aoZIniLvA+qGJwopZAWb92vYu7fAC2FpOjTOYb+/IwjeBJ6jfPRQBeoRT/aJlRUbtyf1VRbzgevn3qpQLXoCmJhxyHe+uQP6xba7D3R21pLLuUI6lXzkQVSueLz13zdnKC/Z9ErQoVfHJXkKd9S/fMdJjxm7xm3Z8vamxmkMJrLYxhMcD/CgD7UhLLte6Wfr7AUFVc+JIszuJsqoj8ZlXgGVheenSvbtwq4Z5IiqTSjCNxgt7fQRUl8CFngbWaunD88qPcLxIJw0CC/ye9fDpNvYeZVHlpVlCpoD7/Hlqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI2PR03MB10738.eurprd03.prod.outlook.com (2603:10a6:800:272::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 09:41:54 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:41:53 +0000
Date: Fri, 7 Mar 2025 10:41:47 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v3 1/6] media: dt-bindings: mt9m114: Add onnn,slew-rate
 DT-binding
Message-ID: <Z8q/W+wHnERu9P6G@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
 <20250305101453.708270-2-mathis.foerst@mt.com>
 <20250305130821.GA1374586-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130821.GA1374586-robh@kernel.org>
X-ClientProxiedBy: ZR2P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::19) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI2PR03MB10738:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e99c133-1325-4b0d-20a5-08dd5d5c4b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ck/o0JMTAIx4QLINx92L+oZcGT516Vi8tNAmqT99EQaXP168Tot0nAUoMZYM?=
 =?us-ascii?Q?npZ/SROHFn65dEZxpAOQhlhe0Ec5jpWNQbsMWZgkpVywL6FFdMZm8q2aZWq9?=
 =?us-ascii?Q?oQaea61zs+rg+VPhVUtTO0+ni3Ri/bmKkTV1DC1StZvHZzG/w1nMZhrV2rW/?=
 =?us-ascii?Q?SJrdYxZIluPvvraufb83MKZuzdks00lCrLEmeFRPtX1qy4t2yHUNpRaOyPiG?=
 =?us-ascii?Q?GDFXZVnYcogAVM0IjT2hPtbnn9QqiK78uMCeW3naDfV1pCTEmG41wLhjeF4T?=
 =?us-ascii?Q?RB6Jqd+uAtYtQNXvAgEWGXT/bjZ5nzvZfYU7/9kl17tT3xf5Nal0ygzwaL0L?=
 =?us-ascii?Q?MRBSykByOu2XD7F5pc5KSZT2nTyV/CvG1xjCvjGzxzcGZlsJFqwnD7EjrJHu?=
 =?us-ascii?Q?i3Gb4HPsfE0hE11k2FNHzpvL95Htp0/SIPbEdO+ZehHoWfm3yGetzb6K5Qmo?=
 =?us-ascii?Q?1kToS/yCYO2Cz+ZyX7bvcOAFaIv/LnHKZFmo9EKkJQ+XtUfk0G8bX19JAG5h?=
 =?us-ascii?Q?gIgqxTQDzMGpes+O/1/i3HCNUYKgqU279gKP5xRyHcz9GfteL4L3tyS5LhQL?=
 =?us-ascii?Q?L8dzZ/UpO9yXXfFvi/lulO2KJEPNvszkmw/G9+4xG8bUFq52hmcAYgMX4Sle?=
 =?us-ascii?Q?vDPu3suEJ159vKMtwhCvafNlFoLDe0urXZcbAwN/mvcV/nIWMyL56OIKM7aM?=
 =?us-ascii?Q?5BuaDWKj4H1SZ96RDiF6yPd5JyvqqXHTEmbWVX47BcHIkHs39xPlwM4TzvNE?=
 =?us-ascii?Q?Ih5yiCkSZdlvl/oj0ucNbDqJAOFX0BzROtloacvoRF8Ezd5dFCkvGoMHEdWw?=
 =?us-ascii?Q?4NHLozzm7e52UK3Id4My57srjnjjCoTZkhH00gFrZOUdejSEgiL/68CkqhMG?=
 =?us-ascii?Q?uparKc5pKTQw+5dA7bLXEPPlPPaq8SKY0IYo2AdrZhlJS+s8EWhyWRne4ybu?=
 =?us-ascii?Q?Bpn6tKSfHmdcKHP3mywTCYXakngRtrWXfYhuEdcnM9x0efclIatAo/3raiOu?=
 =?us-ascii?Q?nnSUdR6kz9gJxeKXeTfmRQjbXpVLIZDDeA3wq9rYyzeFG2jzBCxLbOPFCnnf?=
 =?us-ascii?Q?D0V3KuoPSEqTx+FXyyFG0qGSd6Yg/yx09So4oBofo/LfCrVNo1lPRcI/Fijc?=
 =?us-ascii?Q?kAoZlcaaLhddApo/DhPmV1FgLG3Qv41WYtB5k4kYsX4lN5dz3izzuly5JB9N?=
 =?us-ascii?Q?a5FF1MjbA3qk/9mHrq4gcZtSm21qlAOFN2PGj/IEKFaunN8Qstoe/p6v2rDs?=
 =?us-ascii?Q?ZuRh8T57tAuIumEfGMKNCFq9bEE+dy6GPbBivLT2CGeSTIG/zTlz0Ou3swRt?=
 =?us-ascii?Q?81kx/aXl7wqYgCUCKTlKqWfsGE7INluQ47Kj90nWRw4OPdHOkterQD1GNctT?=
 =?us-ascii?Q?CTlaiMNaspZyHuOCUkLHRttGOqvpMIBG2hRBnp2n7PYADolLF2iUA6jy3EjL?=
 =?us-ascii?Q?4OffDOya6HU8qdzF/dcyWTZ68UveGTLP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Se1WoQ3C0yqCQ8PQpi99YiLkPrAkwCdwr3yEzKytbWVm6D9TKOszSMVKspI6?=
 =?us-ascii?Q?n3uHFC8d3UZwz/qzEpLbLKQXkFJzvIzw0IYoLd9kJqP9aAgnCbiBijIH1dmd?=
 =?us-ascii?Q?0rjg1IYxGJXk7+P/CizvJf8ZQayDdzrxl6AbzVqk3PHQkBVL58SYNMSsqKB9?=
 =?us-ascii?Q?kZmUI8dxSTGqfenCW+ml9A7d7FvBRcgxOAwLa1tMAq97/ERvmbR3OHBgSqkg?=
 =?us-ascii?Q?ZFSbfCMUdXdhZCJG2wUN2P/k98/W35tgQbvz2smtNaGOkaOnH/e85gNTBuNi?=
 =?us-ascii?Q?OgpFsYAia1fUz2JMu/x0axPJtK8nd+M6ccy+fNqheYe/wSsHiBE2iEzGYUgH?=
 =?us-ascii?Q?AcedAm6/MDr8MslsKhKURpJP2wWWuqM24gQqTsJ/eGJVWJwpuz2JOyTV3nYd?=
 =?us-ascii?Q?kPR3Rjcu8bpt90lim2oC4c9UjxllV6uIZQWNtQ0SsxjGjaB2xK9SSdQImpys?=
 =?us-ascii?Q?jgXGkAgbcHlk+Bx/nTdWBLmNfBSUeZ+UFwgqMC6fIjD9H7e1ZyIZAoNXV0yi?=
 =?us-ascii?Q?TR+Kr/8PzyHIFPqtnwlT2e3O138eaG0I5cdNe7ro6fWOMCBtXiZLHi98pAKw?=
 =?us-ascii?Q?GTiXsZSn46dMD4L+7pERbLkQ1cMHJvd0myE8dzPQw2lqil1iuPqfuvBHl8RM?=
 =?us-ascii?Q?+EGxhfZg0oafYiRRNgDkvewE+ys4Y7eSIjk1uG6r/Etk4gHp85s1kVA+P9xJ?=
 =?us-ascii?Q?tViUrPqG7DPbyjrX1kiqYnWGKlOD3wN/QpWxHq7Ptfbm290NiI2LndsgRzly?=
 =?us-ascii?Q?FRMMr/ACytauZCaTeWXxinTKoyVk34bvClWiGt0V0rACKw8fMbgHZQAEGSje?=
 =?us-ascii?Q?wmix3T9kx3rIwq3THrn848mz3LPjwbM+48edte2kr8Ggq8l4YWkskxyYUOX3?=
 =?us-ascii?Q?9/AxRHKpiA0Q75KAb/iVi9wnp+hjnniox4TaYky2Nuu8rnJ5B1eS88kirv09?=
 =?us-ascii?Q?kUf/WjhPIOZ05rJ9loqE75IbKkvIOLZ4ZtCxMuwwQVUkGw15udVMMGyQ9fMw?=
 =?us-ascii?Q?UKPkk2KJIyaYRZKjgI4qrPYE+L7Fja9dRfrrnA2JJhK2BMtVACA+rqRr0v+W?=
 =?us-ascii?Q?Nmjx+o/KLkGjcW2/P3psOWZpcc+2tK9Q08Rec3/sTtIdDPuALDcZxs2f1aba?=
 =?us-ascii?Q?Akv9+ju/H7GvgovjYlLuH/V4ciXYJfGU7L7nSBoSuJthzZAjNH41o6oz2M6j?=
 =?us-ascii?Q?YsoMTXvHDs517FBq92anosos+FpPfznP6EZasvDULBcsRIk/sgix5fiXJkos?=
 =?us-ascii?Q?kdDYMg+LrRqx7DpHuP0MPROxFWQ7xtqRjmTHFJcSljqRkA5n/PIZeLthQxDC?=
 =?us-ascii?Q?P+bkX9y6m0cy5eI4YD8/LEbLF2javcmFSwUjxH2h1g/i8XpTpFV63IqIknSD?=
 =?us-ascii?Q?pEk5D1wlBcbRNgaOeGKTTuj7FxY3BRJqg0Mju7xWdO0Cry0ubFsbYPqo/FZX?=
 =?us-ascii?Q?StzkxSRcbEyER7E0wFCRxmqM2GaxGd1mk4sx81oZcvjOfxxpziOMHvQBVS/M?=
 =?us-ascii?Q?vT0sanNuujrvCpIUpSYx5mHhw2T9XAc1fDdILxzTQ2IE+3MLBPoOP6vN8QCB?=
 =?us-ascii?Q?3E8k1737Rh1be/e3P5e0Q7bD/MiNKfQdNLeOiQ0U?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e99c133-1325-4b0d-20a5-08dd5d5c4b3a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:41:53.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wrr61AH4To0KJAh975js3eJHsHMubzYy17Q8c2YjkjYTcEIDhb8z0f+6EWbVUpNMK6GvrDOJf4HgG142VhD8qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10738

Hi Rob,

thank you for your input.

On Wed, Mar 05, 2025 at 07:08:21AM -0600, Rob Herring wrote:
> On Wed, Mar 05, 2025 at 11:14:48AM +0100, Mathis Foerst wrote:
> > The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> > At the moment, this is hardcoded to 7 (the fastest rate).
> > The user might want to change this values due to EMC requirements.
> > 
> > Add the 'onnn,slew-rate' property to the MT9M114 DT-bindings for selecting
> > the desired slew rate.
> > 
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > index f6b87892068a..c184bc04b743 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -70,6 +70,15 @@ properties:
> >            - bus-type
> >            - link-frequencies
> >  
> > +  onnn,slew-rate:
> 
> Just 'slew-rate' which is already defined in the pinctrl binding.

Okay, I fixed this in v4.

> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and
> > +      PIXCLK. Higher values imply steeper voltage-flanks on the pads.
> > +    minimum: 0
> > +    maximum: 7
> > +    default: 7
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.34.1
> > 

Best regards,
Mathis Foerst

