Return-Path: <linux-media+bounces-28867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B0A7374A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 17:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284D81B60F7A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2CA21772D;
	Thu, 27 Mar 2025 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="De6Oa1w6"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A22147F4;
	Thu, 27 Mar 2025 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093970; cv=fail; b=J+ptEJVA+by2g9KbDxn/PUSvj9RVdXjaSwDLmlSv8ndNFpZ4O4DCRoJwlG68zPwPynat4j27NkPAFdQLhELKRJxUL+189wpasP1tlUE0O5Rr9BVxAGCul/ThGWjX8m94hDmihkaIRuhTchhsZ8C4ohui0JA25DDF/wxC32G4zZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093970; c=relaxed/simple;
	bh=aciScKBbgpcQhM3S8EllT+jH0Vkd4YsImvRdINfcqcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FvGa+IRslr2wbuHHWL9uqiu27AZ+pAnHFd5DH97oThsMlmJOj284nRCh8OjNog5L/JuzqjPdhL2CzlzvqRaNnQH5prNfWYTfUV2n7qLn2RaDyFhmts6X4zI+Lw54Cvl8rwIiZvUjPoiRxDsu9bHhuBvttrqUbaAWCkQjqGqqNyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=De6Oa1w6; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5IQEGS7ozFPXFIcSgLFfvzAjF2wMKhwfZZFFFfZ6Fr7Hkl4RJFThJVf689ienwv1fvnvFxJYj+oLzEwmaSeIFXaRaxIs8iK6l+yrxSHTPyzhw4QnjfYRxD03VtmMByihJHkTU6LQIlWYMFKdR8lqgrVkls3+MvFw8XOFwNckaiiOhvnYc76xeXMduviOcYbSXtuzZ+KIiuuUBe0lEx789rGE+YSTYBMdmovILB8QOxdnbEnFcJ961SyDBNLown5zYTsKLaAVGUFbVDXZR1tqwjF4R/K4AE2sL8mCydehCZywKfln6ZAckNZZx3nLzVF6s4zgj2vNmS/AWmO/Rpq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eulM7zAb2FMaH15ySi4Sa+ynjIOOj87zG5il64+Pkzg=;
 b=svWN3uKHfImHJYI58dRS0IiserFbcsI9dxYx5eXRPJ7HbW+P1wyv+pOr/S+njmXWSd1os9XS/wDy9BDX/+kYpjV7Krl9xHXfuEM1tQEGrhKBgG6ZDGf5gaMZSoZ3Ou+scWhJwgr50JZZNSBC5HjzehUB9X5SEtd5kNB+v53g2LEhVL+ZHPA22DZTYcisRXR00IPKJjtWmiezBQlxew7sWrCcCHFcAhqtBQtUXoVF1Ony5yImwdnICQLkGUhQ+XLV0/mAhFWWEkb7BOPot1Wnk/INQSM5LUjHm3tqUlKMG4nJ3AN2OIEj8tvEOf3szGoEdFtKf3izcd+SdVztgBQEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eulM7zAb2FMaH15ySi4Sa+ynjIOOj87zG5il64+Pkzg=;
 b=De6Oa1w6e7TAx2EunW9O0y1NypudcQvU4VYOBda66w9L/LRehWeCKKsdMzBCWXecZ0AzKOzrXFe8WoZWOsq+IM37P85UYEd+LrHpsASlLGjf1LH/GHUMyd2au4bBCznxP2Bn1r5V4smGLC0422n9+gsTNrJ3ZZ2GNV0uh8I2f/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB15545.jpnprd01.prod.outlook.com (2603:1096:604:3bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:46:02 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 16:46:02 +0000
Date: Thu, 27 Mar 2025 17:45:39 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <Z-WAsxVJ1QpDa8fx@tom-desktop>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
 <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467D4C0BE9691A6E4630C786D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z9LJFCBbqbdlDP8k@tom-desktop>
 <20250327101554.GA18306@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327101554.GA18306@pendragon.ideasonboard.com>
X-ClientProxiedBy: MR1P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::30) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB15545:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b6a108-d2ab-4b1d-2e60-08dd6d4edbd2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Fa/4rhJlo1zQ7jd5PXwMuVItltk8njwK3LBoMZxt8zpr8lt4JnTpNCbs4/sK?=
 =?us-ascii?Q?EM0PB9+X194G89CSXyV5ictlv+UgK2aOUjGA3CmHG8rZHIKeIs71/7Ff2vmU?=
 =?us-ascii?Q?Bmgs01zp1STmIvcFqrONYIPpN3UDSHsYRxyTvU9jCA/+t14KJ/UMxar2s6zD?=
 =?us-ascii?Q?+EBKzpwHcieBnAVkV1v/4dcQiGXq70uMHb575/4omTG5DzDoJ+wpSgibt8BV?=
 =?us-ascii?Q?ytoqwATlEeKCH7Wa5rDaCirb8Jr+xrIZbOsI4JDeGCWOfh/bgdWyCgk108dX?=
 =?us-ascii?Q?u1Yw/GQYwyfrr5CVzulaa6jwt2XWug2tBfc+8b+kh7DZpvYRx+ZUuY8O6SXP?=
 =?us-ascii?Q?Zo3RhUzbe6EWTyTnmlwJhWgJFG7Iwtf28NuEuuN4vNivWBGiIGBj91HJPnRX?=
 =?us-ascii?Q?hZTfgecsa+SuHMBIkg/3skR/aQwElsnc4LTOyEVMJciSoND8xzc0eE3qbc1G?=
 =?us-ascii?Q?03amgWL0AbvVMlr+IT2WXaQmlN/7b6WPPHtfMIvH2qnnct5hzqkDmxGDpsRg?=
 =?us-ascii?Q?aPEM88AnPYRh8+7w6zUgP3fZydnkEV5FQV7cD8YLoXLj9Z6CbMeCsK/sMUdE?=
 =?us-ascii?Q?LZOdUMGbjwkivBr7Jd3OYSbGBB3caj48RCzReKjwew58eAyyxkTMWM1SEEpP?=
 =?us-ascii?Q?uPC5sUXQtvaa9MTiPBeJHF4agO26U35Kpb3TbzfnR9TmhPZvO8uh9a1BwqgA?=
 =?us-ascii?Q?kMLzi6FQNLdaTp37X84LBHThdytsciv7yHdyS57IYnj2l8ndJTptKO0BRx4r?=
 =?us-ascii?Q?BSCfIPpP8itdljFOb6ZUkxnWMo8QsOVy9M+acv9dabyJWZpqe/XAAQLYUd/f?=
 =?us-ascii?Q?EDBdsWkj/ksMGrPQ9cRIv22UC/RNAqLLpFuMUb79Hm5pb6Y53YwvzRKKA0p2?=
 =?us-ascii?Q?MPzL9ExM3lnB/bB0GchmFjVrsmQiskqxJ0bDGr6Slns5Db/CitRBmCCGLWC5?=
 =?us-ascii?Q?xpTbzrNOKQEZER0SbtokoZK1VK/PH+2JUIkDdlvPwRfi1BOl7sMCwRTHN0Jq?=
 =?us-ascii?Q?cTAtx1fc+aKD6YwSkxKAjVjprLR5Ig1Uh1yYmFg0l0EcWqGnLj+sWDJaF91g?=
 =?us-ascii?Q?4RkMl7TtgIu25b6+U+UEZnya+cHuASrysaPdldd72xb4SkILR+/hDAolTqQ5?=
 =?us-ascii?Q?bns70MHMW8COVVHkgqIhph2HbmbxmmYuvUtQwEHMfpRJig3/F5QYGvU60DNd?=
 =?us-ascii?Q?8NzXYfBAuyxpokrIfGhruHa3yZUQ7TerTsQtUgkJ/bVdbJQ8fwQxrvOuJ93O?=
 =?us-ascii?Q?494xlv/qpmhiHGvW6u90QwB+N3373phQDMSNvyP49HihhbjI4+ity8p5qVzT?=
 =?us-ascii?Q?MjDyh8WcLXdSIcehmuSzfwU03y83AZU5LB/qLcE+jnR2Yy5+t1DzUL9+/WkP?=
 =?us-ascii?Q?VwhpUawTB8BYKC65qSw/Mh9QMAceJFbjLVLrNXf1y5mWNZQa+qpy1rWsw6oA?=
 =?us-ascii?Q?+hTYkGlgWFgI5XPIyOoLxAMtY+HIZ9Sr?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Hw5MZFQxv9JA+b03ky47UVogCoS9clnbnKJxlrzguuSYwXfwn2k+JOy/T04D?=
 =?us-ascii?Q?aYQzBcHrJye1MGDP8tBxZi/38OIcbL6aBsCeTteNItVPFgWecZlPe5TAo/Xm?=
 =?us-ascii?Q?g4eMc+cr+gxvZ8UHf50zkE96IxaSN9xim3B28R6xvpluw4sPqmxCSjh/vWbX?=
 =?us-ascii?Q?BfjXSeUwXany4Y2+Et3/AQhVx3S5Kr0PqpmGEr5Xu8wUAFSg9DXoizkTNYZQ?=
 =?us-ascii?Q?r/depacre7UjqB3XAPVq2ylnYLV+MUZuEVZx+iiIqz6kwvF68UZBf3rVho8o?=
 =?us-ascii?Q?h6U/y1H2Q2/OB9P6sqqTz0Yua5DXXfhEEd+OLWpk/UOD+ZmnTRlLHuhu4/CG?=
 =?us-ascii?Q?Klie2rMWwYFgFrc5NfOt+xS4t8srNJWihs6ra7K5N43kG+HmQrZ15mxP2aZN?=
 =?us-ascii?Q?V6zBw5DViQnmKYhH4g5u/bFUCz+ui1NwojGG5SeT97R9oMxaTlTZ7MOjcehR?=
 =?us-ascii?Q?+kt6AOv9yGZhB4A+cr1jNNuED1TTknBX60u5a/F1GwMk2QW3F3MHjz6rQoH7?=
 =?us-ascii?Q?hxze9WSWRCAsaovfKLExRH5D8hDb8WJ4I2wi0KKwsWnBpT2K2WDUmR4whHt2?=
 =?us-ascii?Q?wNxKgBqlAh989x7TzCdJQZGpmdDwZ85q0rGwcND3n2mUN63pEAISr5C7YZ7d?=
 =?us-ascii?Q?kDHsLV0sZQhkSixANysPCKz/+cN4nW335NxtgBfYVtxkq1/pRLcsm/HO0OUQ?=
 =?us-ascii?Q?1GBsxC4a6bt7W8fZwZi0J4R5tYxMhi0/yUdMoQEAAE7qNHCHK5YErlhsz4E3?=
 =?us-ascii?Q?0wTtqP0MsolzBspN6sLZbOnAl3eESU+TdpdflSNckoIV7FWWTvHy/N0S6XQc?=
 =?us-ascii?Q?vUoHX4lrwWcTJLBb2wx9OLiLxNSMHoQqn++AGpIH9Hi6Vx1iNLL8J50npRhq?=
 =?us-ascii?Q?W+dzvXnqnQffSTHyv2AJSHfV+OsXBop/1Oupj9jiag3DkFTQROKhBXdMRv2G?=
 =?us-ascii?Q?L4m8wEqraBDZk6bcY/NovJB1a2xmZtOSggMQ+2/ibh9FyatyqE/P0O32fbr7?=
 =?us-ascii?Q?79VAXips5OA6EJmTAtErp4cvhOYrOyWQsPqa0HWhmtYj5S7qcs94ba+Bp9yW?=
 =?us-ascii?Q?BYWeGZ/X2ou61+b0dxLckMukjr9QH/GPfkF7bl/eA36PHdX8yvewGs1dPoo3?=
 =?us-ascii?Q?tK3BHi4L6861LvLyVrH4WHgh3ehSmkIEXKWYrtcBty1HUCMm/KpJryYKPvbu?=
 =?us-ascii?Q?ylpoiKw1PE5/5CU93qsOwsSnqJM74UJz/0WKy2JQBmU8qRiAVov4p7GSeSw8?=
 =?us-ascii?Q?W+dAwIkXduG5ZzLYvJNbR4Jdmyn1y2uIEsNP9GccrDKqwU5Gz/unZP6fm9n8?=
 =?us-ascii?Q?+0n3W7gfcSRCeXNLlENyoBvwxjmsSrP6UxdsgZl7AX+1NhAvggUN3Qyc/BgA?=
 =?us-ascii?Q?9B2cDk8Ai7qWXgxzChptUyLBQfOd2vV5pY5TvUKW48e0mw1Uab4Tg5CHkreq?=
 =?us-ascii?Q?qE9Rg13oKvURRPt28DN68bI2HNljAEvtC4emxKjwRB5EvxS0PytXUmunoGVo?=
 =?us-ascii?Q?TwSB4NyNfN/AqZ0FnK+OvhdvYxRqgXyitzQ9gaZgRRmS7tS6JWkLClPncGMJ?=
 =?us-ascii?Q?BYTzyznmwqmp6UfYpOjbOk9xCovjefHHgoHId9IrktvlQxyrRQWcqABM9eun?=
 =?us-ascii?Q?jezGrnMwYBAElQOLQqYaBuc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b6a108-d2ab-4b1d-2e60-08dd6d4edbd2
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:46:02.2723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qbhjkf/iEuT2N1Gj1BZqN5VfIkD9NCeWuVTc2neKR5GHRTriQpMigkkAXVwUDlZPzWVAOLG9b335OOzjPRmZLOUP3bUvZFwB8Zp0l+89GvaFxlDobTC3eW2qpuED1DH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15545

Hi Laurent,

Thanks for your comment.

On Thu, Mar 27, 2025 at 12:15:54PM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thanks for being patient (and reminding me about this). Apparently,
> Embedded World is bad for e-mail backlogs.

I can imagine.
I skipped the EW this year, hope you had fun there :)
No worries.

> 
> On Thu, Mar 13, 2025 at 01:01:24PM +0100, Tommaso Merciai wrote:
> > On Wed, Mar 12, 2025 at 01:37:25PM +0000, Biju Das wrote:
> > > On 03 March 2025 16:08, Tommaso Merciai wrote:
> > > > 
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > 
> > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a CRU-IP that is mostly identical
> > > > to RZ/G2L but with different register offsets and additional registers. Introduce a flexible register
> > > > mapping mechanism to handle these variations.
> > > > 
> > > > Define the `rzg2l_cru_info` structure to store register mappings and pass it as part of the OF match
> > > > data. Update the read/write functions to check out-of-bound accesses and use indexed register offsets
> > > > from `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> > > > 
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > Changes since v2:
> > > >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> > > >    accesses as suggested by LPinchart.
> > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> > > >  - Update commit body
> > > > 
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
> > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > index eed9d2bd0841..abc2a979833a 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include <media/v4l2-mc.h>
> > > > 
> > > >  #include "rzg2l-cru.h"
> > > > +#include "rzg2l-cru-regs.h"
> > > > 
> > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)  { @@ -269,6
> > > > +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > > > 
> > > >  	cru->dev = dev;
> > > >  	cru->info = of_device_get_match_data(dev);
> > > > +	if (!cru->info)
> > > > +		return dev_err_probe(dev, -EINVAL,
> > > > +				     "Failed to get OF match data\n");
> > > > 
> > > >  	irq = platform_get_irq(pdev, 0);
> > > >  	if (irq < 0)
> > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > >  	rzg2l_cru_dma_unregister(cru);
> > > >  }
> > > > 
> > > > +static const u16 rzg2l_cru_regs[] = {
> > > > +	[CRUnCTRL] = 0x0,
> > > > +	[CRUnIE] = 0x4,
> > > > +	[CRUnINTS] = 0x8,
> > > > +	[CRUnRST] = 0xc,
> > > > +	[AMnMB1ADDRL] = 0x100,
> > > > +	[AMnMB1ADDRH] = 0x104,
> > > > +	[AMnMB2ADDRL] = 0x108,
> > > > +	[AMnMB2ADDRH] = 0x10c,
> > > > +	[AMnMB3ADDRL] = 0x110,
> > > > +	[AMnMB3ADDRH] = 0x114,
> > > > +	[AMnMB4ADDRL] = 0x118,
> > > > +	[AMnMB4ADDRH] = 0x11c,
> > > > +	[AMnMB5ADDRL] = 0x120,
> > > > +	[AMnMB5ADDRH] = 0x124,
> > > > +	[AMnMB6ADDRL] = 0x128,
> > > > +	[AMnMB6ADDRH] = 0x12c,
> > > > +	[AMnMB7ADDRL] = 0x130,
> > > > +	[AMnMB7ADDRH] = 0x134,
> > > > +	[AMnMB8ADDRL] = 0x138,
> > > > +	[AMnMB8ADDRH] = 0x13c,
> > > > +	[AMnMBVALID] = 0x148,
> > > > +	[AMnMBS] = 0x14c,
> > > > +	[AMnAXIATTR] = 0x158,
> > > > +	[AMnFIFOPNTR] = 0x168,
> > > > +	[AMnAXISTP] = 0x174,
> > > > +	[AMnAXISTPACK] = 0x178,
> > > > +	[ICnEN] = 0x200,
> > > > +	[ICnMC] = 0x208,
> > > > +	[ICnMS] = 0x254,
> > > > +	[ICnDMR] = 0x26c,
> > > > +};
> > > > +
> > > > +static const struct rzg2l_cru_info rzgl2_cru_info = {
> > > > +	.regs = rzg2l_cru_regs,
> > > > +};
> > > > +
> > > >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > > > -	{ .compatible = "renesas,rzg2l-cru", },
> > > > +	{
> > > > +		.compatible = "renesas,rzg2l-cru",
> > > > +		.data = &rzgl2_cru_info,
> > > > +	},
> > > >  	{ /* sentinel */ }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table); diff --git a/drivers/media/platform/renesas/rzg2l-
> > > > cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > index 1c9f22118a5d..86c320286246 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > @@ -10,71 +10,77 @@
> > > > 
> > > >  /* HW CRU Registers Definition */
> > > > 
> > > > -/* CRU Control Register */
> > > > -#define CRUnCTRL			0x0
> > > >  #define CRUnCTRL_VINSEL(x)		((x) << 0)
> > > > 
> > > > -/* CRU Interrupt Enable Register */
> > > > -#define CRUnIE				0x4
> > > >  #define CRUnIE_EFE			BIT(17)
> > > > 
> > > > -/* CRU Interrupt Status Register */
> > > > -#define CRUnINTS			0x8
> > > >  #define CRUnINTS_SFS			BIT(16)
> > > > 
> > > > -/* CRU Reset Register */
> > > > -#define CRUnRST				0xc
> > > >  #define CRUnRST_VRESETN			BIT(0)
> > > > 
> > > >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > > > -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> > > > +#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
> > > > 
> > > >  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > > > -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> > > > +#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
> > > > 
> > > > -/* Memory Bank Enable Register for CRU Image Data */
> > > > -#define AMnMBVALID			0x148
> > > >  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> > > > 
> > > > -/* Memory Bank Status Register for CRU Image Data */
> > > > -#define AMnMBS				0x14c
> > > >  #define AMnMBS_MBSTS			0x7
> > > > 
> > > > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > -#define AMnAXIATTR			0x158
> > > >  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> > > >  #define AMnAXIATTR_AXILEN		(0xf)
> > > > 
> > > > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > > > -#define AMnFIFOPNTR			0x168
> > > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > > > 
> > > > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > > > -#define AMnAXISTP			0x174
> > > >  #define AMnAXISTP_AXI_STOP		BIT(0)
> > > > 
> > > > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > > > -#define AMnAXISTPACK			0x178
> > > >  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> > > > 
> > > > -/* CRU Image Processing Enable Register */
> > > > -#define ICnEN				0x200
> > > >  #define ICnEN_ICEN			BIT(0)
> > > > 
> > > > -/* CRU Image Processing Main Control Register */
> > > > -#define ICnMC				0x208
> > > >  #define ICnMC_CSCTHR			BIT(5)
> > > >  #define ICnMC_INF(x)			((x) << 16)
> > > >  #define ICnMC_VCSEL(x)			((x) << 22)
> > > >  #define ICnMC_INF_MASK			GENMASK(21, 16)
> > > > 
> > > > -/* CRU Module Status Register */
> > > > -#define ICnMS				0x254
> > > >  #define ICnMS_IA			BIT(2)
> > > > 
> > > > -/* CRU Data Output Mode Register */
> > > > -#define ICnDMR				0x26c
> > > >  #define ICnDMR_YCMODE_UYVY		(1 << 4)
> > > > 
> > > > +enum rzg2l_cru_common_regs {
> > > > +	CRUnCTRL,	/* CRU Control */
> > > > +	CRUnIE,		/* CRU Interrupt Enable */
> > > > +	CRUnINTS,	/* CRU Interrupt Status */
> > > > +	CRUnRST, 	/* CRU Reset */
> > > > +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > > > +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > > > +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> > > > +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> > > > +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> > > > +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> > > > +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> > > > +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> > > > +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> > > > +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> > > > +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> > > > +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> > > > +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> > > > +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> > > > +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> > > > +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > > > +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > > > +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > > > +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > > > +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > > > +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > > > +	ICnEN,		/* CRU Image Processing Enable */
> > > > +	ICnMC,		/* CRU Image Processing Main Control */
> > > > +	ICnMS,		/* CRU Module Status */
> > > > +	ICnDMR,		/* CRU Data Output Mode */
> > > > +	RZG2L_CRU_MAX_REG,
> > > > +};
> > > > +
> > > >  #endif /* __RZG2L_CRU_REGS_H__ */
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > index 8b898ce05b84..00c3f7458e20 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
> > > >  	bool yuv;
> > > >  };
> > > > 
> > > > +struct rzg2l_cru_info {
> > > > +	const u16 *regs;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct rzg2l_cru_dev - Renesas CRU device structure
> > > >   * @dev:		(OF) device
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index cd69c8a686d3..792f0df51a4b 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
> > > >  /* -----------------------------------------------------------------------------
> > > >   * DMA operations
> > > >   */
> > > > -static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > > > +static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset,
> > > > +u32 value)
> > > >  {
> > > > -	iowrite32(value, cru->base + offset);
> > > > +	const u16 *regs = cru->info->regs;
> > > > +
> > > > +	/*
> > > > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > > > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > > > +	 */
> > > > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > > > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > > > +		return;
> > > > +
> > > > +	iowrite32(value, cru->base + regs[offset]); }
> > > > +
> > > > +static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset) {
> > > > +	const u16 *regs = cru->info->regs;
> > > > +
> > > > +	/*
> > > > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > > > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > > > +	 */
> > > > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > > > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > > > +		return 0;
> > > > +
> > > > +	return ioread32(cru->base + regs[offset]);
> > > >  }
> > > > 
> > > > -static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > > > +static inline void
> > > > +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > > >  {
> > > > -	return ioread32(cru->base + offset);
> > > > +	const u16 *regs = cru->info->regs;
> > > > +
> > > > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > > > +
> > > > +	iowrite32(value, cru->base + regs[offset]);
> > >
> > > Do you need this code as the purpose is to test compile time constant and
> > > It won't execute at run time?
> 
> Biju, I'm not sure to understan this comment.
> __rzg2l_cru_write_constant() is called at runtime, with a compile-time
> constant offset. The BUILD_BUG_ON() verifies at compile time that the
> offset is valid, causing compilation errors if it isn't.
> 
> __rzg2l_cru_write(), on the other hand, is called when the offset is not
> known at compile time, because it's computed dynamically. That's a small
> subset of the calls. It needs to check the offset at runtime for
> overflows.
> 
> What do you mean by "won't execute at runtime", and what code do you
> think is not needed ?
> 
> > It was suggested in a previous review.
> > 
> > I've done some investigation on the above bot issue here.
> > Using __always_inline for constant read/write issue seems solved.
> > 
> > I found this link: https://www.kernel.org/doc/local/inline.html
> > 
> > But tbh I'm not finding an example into the kernel that use both 
> > BUILD_BUG_ON and  __always_inline.
> > 
> > Laurent what do you think about? Do you have some hints?
> > Thanks in advance.
> 
> Do you mean that the compile-time assertions are caused by
> __rzg2l_cru_write_constant() not being inlined ?

Seems yes.
Using __always_inline seems to solve the issue reported by the bot test.

> The function could be
> marked as __always_inline I suppose. Or the BUILD_BUG_ON() check could
> be moved to the rzg2l_cru_write() macro.

Mmm not sure that I completely got this way.

Actually we have:

#define rzg2l_cru_write(cru, offset, value) \
	(__builtin_constant_p(offset) ? \
	 __rzg2l_cru_write_constant(cru, offset, value) : \
	 __rzg2l_cru_write(cru, offset, value))

And BUILD_BUG_ON() can only be user on constant offset.

Thanks!


> 
> > > >  }
> > > > 
> > > > +static inline u32
> > > > +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset) {
> > > > +	const u16 *regs = cru->info->regs;
> > > > +
> > > > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > > > +
> > > > +	return ioread32(cru->base + regs[offset]); 
> > > 
> > > Do you need this code as the purpose is to test compile time constant and
> > > It won't execute at run time?
> > > 
> > > Not sure, maybe adding an entry with MAX_ID in LUT,
> > > that will avoid buffer overflows and you can take out
> > > All out of bound array checks?
> > > 
> > > Cheers,
> > > Biju
> > > 
> > > }
> > > > +
> > > > +#define rzg2l_cru_write(cru, offset, value) \
> > > > +	(__builtin_constant_p(offset) ? \
> > > > +	 __rzg2l_cru_write_constant(cru, offset, value) : \
> > > > +	 __rzg2l_cru_write(cru, offset, value))
> > > > +
> > > > +#define rzg2l_cru_read(cru, offset) \
> > > > +	(__builtin_constant_p(offset) ? \
> > > > +	 __rzg2l_cru_read_constant(cru, offset) : \
> > > > +	 __rzg2l_cru_read(cru, offset))
> > > > +
> > > >  /* Need to hold qlock before calling */  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> > > >  				  enum vb2_buffer_state state)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

