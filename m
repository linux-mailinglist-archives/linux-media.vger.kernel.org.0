Return-Path: <linux-media+bounces-30108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC144A87966
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8A3188CCE3
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3162586E0;
	Mon, 14 Apr 2025 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="slTdjORr"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113AE1ACECD;
	Mon, 14 Apr 2025 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617024; cv=fail; b=Hx0MevQTn+zCyDNZJicubBKyYvK2I38wBt2bxhTgxJUx+NV5W9f7hMRN++TsQWcW6oTpBp0x773kykwCm06QokZEj62Lz0ml19S2rGZlwt/YfrXRk2Jn97cXj5rR5A+c9z0T3ivcykftBlTYI7W+qf1UNFKlCy9UybhHFCO6bm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617024; c=relaxed/simple;
	bh=GvZg3+QFaqME62dO3sTOII5I+5OuhoqQ+fhVG3DMfm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k92dn/p9nnkiwKscVdJdYaXx4+RpZfhnQVkqU748CMZURudc4TKAj5ZmRqRTBJi6ecU+2i4UZp4Pl9eaIZ89LKdc5at5kOYrQSiaOAbXYXeldKSXcP/e0SeKoNIJ9RE0LN0ZXT3SYkqP1am1nHjhpAs8dDdJISjjeXGLupuXWlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=slTdjORr; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqFKIu2SMqo6dda/7YivBJpfpbLNlDvS8oufa78U3MDJtEEXeL0L8jt/Bns9Nl414Xd4VFuPWrgkwBvAYlt8w6oigHE4gRt8/BazSgkMQGsuumAEw6tBb02a3bzlCsG4amhlrGaUrrF6Sn3RtxktLPuMszeyoHeWnS/Nk6K4UEM3Nx5MiPvCAcAen98RAjIn6Vh3cWVdbrS+9ZPUC8LrrXkdpvimcaH3aFANBe9Hhh9VgU5AZIswJi9QAHDohbvqNXgoL3uSuFSFY+qDudSS6llLXxb+MR6S3nN5yfH4b+ErIkLIGieMfIdxuo4ZOwp7PtXU9qeZJ+PfD839nFtn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU7arI0dc/u2J1GzKAmTnC+80yF7o82gB38Hf9pZlIY=;
 b=hMZ1vRZ3roH1ysys1QpR4ELlQgt2SZ70/nUaQuNHukSG8m1OMEjZ6yPOjfPw5MoyKjOcawgUDfiGHjYHvDFkMoThSn3r2GnqROtCESqoX/kn5rR6KMA2zs22Uk3L4TP0waJOuSYVWpIU4arIJ3Yg2yFq7ELJPsphSvSwJbiCL+5Znh8At3WCOFGH7BLY3/mxf1e4PSl6DOTGRi0dm+FCjWhbYVQ1m8WND6Erj280/K5BT8g3lyf9eQN+AbggqU1xYGMmhbMyfz9dzCgh/+weypiuQ72Ji09ujsZrjTW9Oib47aUXct4A3CdkBVyfgg/kWQhN4q5tuF6fJKq4IkIAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU7arI0dc/u2J1GzKAmTnC+80yF7o82gB38Hf9pZlIY=;
 b=slTdjORr/Hc0WgIdfhL8RhJlZKYumJMDFeVkEuMKg0LUXcwwKqf7TUCXUAZ/ImJjG8ziYLfOsVmG7J1prlPnsXV3HTPRyqO3u/Amhh6JumzDK+TGFgDuJENLORwbEmMvURwb9ZhrPTBS6LMoiLAD8wj1tRYWKhQpbozc08GKDgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6608.jpnprd01.prod.outlook.com (2603:1096:400:ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 07:50:14 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 07:50:14 +0000
Date: Mon, 14 Apr 2025 09:49:56 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2,
 CRU)
Message-ID: <Z_y-JJathHn5hBBQ@tom-desktop>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdWNGPTD=hPPZ1KxPYrJrokZJyydDreevABDt+yZpm-e7A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWNGPTD=hPPZ1KxPYrJrokZJyydDreevABDt+yZpm-e7A@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: ae21ee40-6312-406a-c60d-08dd7b28fde4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?98pJK9B2G8O8qsb1EgMBFU8BcG7oQmQhnOFpK3tbgVRes6aC/+t+wA7HvOeG?=
 =?us-ascii?Q?VdIvWUFZ+cQz4CzOv1z0lP/GeFsH6qqRYOmWdSPIkMLxPHxYR084Fv8WCECf?=
 =?us-ascii?Q?MZMyV5YEVZ29V51u6FdD0Tt+xK5hxxMCTmCAOhPBTQnidv1gDHeCKHFXkYVi?=
 =?us-ascii?Q?MyxwcPBjW/m6bPwITftH8J7VuKvqfwMnKVzNQ+w0HyfiInYunBgZ/XNy9xwO?=
 =?us-ascii?Q?lAdVtg6EmsZaGbwoP09YnKo//TuJJIJ3NnqpsPUwcT0bIT3wLL8+y4/CYVXq?=
 =?us-ascii?Q?3Bhp8/Uc7f2ETRm2t7TLK8vI10mrfA1ZUarsugzkpSpO4J4dO9vEXxzLNo/f?=
 =?us-ascii?Q?kBnOG2V6Hac1gzfqRw6eKnTYEtn2ao5iiAgt7o+KOOaW57RnM+Hq5crakfRK?=
 =?us-ascii?Q?Xkkcu0gjzONYIU92EDYQaTXD/80BY/jYfbMOkbKSCHiJHhzfbqU7P11RQ3W3?=
 =?us-ascii?Q?G31PbFL4oJNOG4vEYweulnYGb3jI9KK6PGhrDuMgrrskMBIKkGBssQop3Sj6?=
 =?us-ascii?Q?WH/NL33Ns/idBFZW3QrnuBol+bO6k50PHlBp1xy55s91solZeW9zoI9DOIZQ?=
 =?us-ascii?Q?XLL0EXDlAL3djZkhmMjfp9i57CoJYIDVyNBm8iXZQvdXE+n0Tk3kVzZllYWj?=
 =?us-ascii?Q?52l8dVISrLXsTb5Cn+5WroHdUIBefQtHfuV5r1PG0djTHbnH754Rfc9kAFnn?=
 =?us-ascii?Q?tx8WxFrMCGX+sx9Rbcc1aIh8H5Q+U8+0Owb+X3xN8WNpr/LbVUWmtxFEU/Id?=
 =?us-ascii?Q?Vxq8dAg4TdbagqBJGDm/ZT4iFk49VEk5+XK8qE0Llu/3yar448dbXiHRtIFC?=
 =?us-ascii?Q?gHPF1y6tk6PU39schzx9ZB5XoQWF9mpmLoyWYnr+kU8U4sSxbJMfN+cL2Ljq?=
 =?us-ascii?Q?DmKD0PZAMniTf3BI8Z0aJ2VIfnseFE1gsv/z85XCPJa3vBiLiBYdNyDxtoQ+?=
 =?us-ascii?Q?XnNv4h3LrxDrYJuMRK7qeWUuJ+an9pKF9qK2cY2IfEwTsqLzm2QhUG8z41Lr?=
 =?us-ascii?Q?GMVvg2BZudxnDd9cEYUW/UhjqgfsSyON3uD012WmnT0PwB1OcIVoY5elkhvk?=
 =?us-ascii?Q?rN/OAjcWSihO1+bGQiDdovwnJdepdLJCokT9idU1w9HTBD7yu8WnQNgGZ3bK?=
 =?us-ascii?Q?z9VKrWhFMKPqQEXy40FweIWhJ5nd2/d29KeiqddpYBv/lBQI58qzWYkOPUCG?=
 =?us-ascii?Q?0p/ymLZsrfZpbyqsDVINGKhl8eGF5mu/q6UhqfRkV6VM/sWdrfgeh9J0R6th?=
 =?us-ascii?Q?i57Gbf5vm8V0cxGOv0+czDDmzDkYV/ISxo1h/Hf06XpFrG9+t5c/l8CPFCpn?=
 =?us-ascii?Q?kU16Rzy+kAKHyrIApdf6546a8nih2xmd0SCkry6NmfW6rbqyjekO4KWW0MdD?=
 =?us-ascii?Q?peuoChvr4Lfe/BBXd1vqU2br1chJoT2DkQ4iSxOHlsdwVcX/NY0MyfcwA52p?=
 =?us-ascii?Q?SUcu2FFiHhoHY7J+GDKeXDafNlOnSrUhraXT90yb0eAeEVc+beMONQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vCdbbniBS64NBk1208BbXDPHcV8zmJNpZ1eL4fT/SXnmdbOgim74trydqLt6?=
 =?us-ascii?Q?bkf7T2Kun7PE/G62fn290T5tEtBdhdXknFlOu8Hfoq7tb22F1Q0ktf9eI9JI?=
 =?us-ascii?Q?Dlnzv7Gqh3bdV3Rn/0XXTeSiP9311WC2xJOIm7t2NFYfAFYNSUN3/rSh68cy?=
 =?us-ascii?Q?4E3nvVXlgmEF++6NAzyR1NUrC4P6oYareKzTvv1DhunZSqOmUI00aEOFcjD+?=
 =?us-ascii?Q?Ekoj30KYUynMZtoRpkr+/FWLqEBn+8WoCLqIErfY1zF3Cnrjlken4QMvn7VI?=
 =?us-ascii?Q?P8ifZ7MajSrERg/mrSZYXWpTnWoh/qQJXTtCbwro48TsZ6t+9cjm77LsTNw6?=
 =?us-ascii?Q?UvY+3HpHdo2vGQfbMZkvy5lyAct7GuNRzjcG0oQtKF9WMJmYOKBDfvwF4ZnX?=
 =?us-ascii?Q?15fMupN+AJqfi5HRMb1toztSZI9wEEMDypR0Gusjfpu8bnW3EsxPAj6VtgQp?=
 =?us-ascii?Q?RJ4R+E454pXFC2WaVoYXiYbu2tr4GVbIHhkS13ECrQe9ZaNnlD0OdrmxmY+V?=
 =?us-ascii?Q?nTRRWLNn56X3Z57whFk+rqgIaGO+ouRZSGkbmhSxoiZLLX0+1I5a8NoAf0Fv?=
 =?us-ascii?Q?Ma+3ZCMyLNQ2NvGO5skw/8tXonnTJ1oh440BfIKH+aBHgy6x/Kl5bim6BNSZ?=
 =?us-ascii?Q?YnIy/wRPb+r+4nz7DCpTmsza5XYFF/AJkuXlGUoWspgq3szvm171dgBjXSSH?=
 =?us-ascii?Q?paJAtUHSLhEcqajIXlncAIZeAzK3NlYEqXTvfH+rUZv8vGHHK+sVm68BMpp3?=
 =?us-ascii?Q?naioJds19gPkV1suyG1whFSlf+kMrMhHmLevQGvdoeDIanKhTLH/l4jZcShP?=
 =?us-ascii?Q?eNDZEV4qHsCtxZNYFi8PZpBGw52OB6F6aMEyMrQH9brni3/8LRSDg8J25U/Q?=
 =?us-ascii?Q?SpftZ4QJI6B5D+3rtUhrQ+L0nYBidLAQMNlYv7t/R4NuyBeVzYwzGSochQLI?=
 =?us-ascii?Q?lGTqvvBg8aVjGhxFm73HXpakAQpjRtRk3b354ewicP5kefgBJUY1g1mGdU3X?=
 =?us-ascii?Q?GEL6EiZaIu/l7F0ZCacLvmMO+g78ILX7svN4r/EnZmBPyjzT3N1jU/+jIN8V?=
 =?us-ascii?Q?FF5XmMghL6IuK5jf8AuqXkb1poraAUtHOiqkwIrwmiVCcUC1atwLmm3YzBy4?=
 =?us-ascii?Q?BMtUICd3U7bEqJq6x9K66RefrOs+LkzFN6xFjRaBJgLs1Pq4ko1kxlm1C0vx?=
 =?us-ascii?Q?Knp/TLzjPfYbs44IzenD0k4yExiBuATLjE0Wo4HaI5QpW7+nxC7iEK8MJ8LF?=
 =?us-ascii?Q?K4qslYhj88bdQvjbK+8PGroQOGRj9EwQrMn1pOlp95Nlc9deCXclI+q0dpPv?=
 =?us-ascii?Q?/X65gaYZamgJRoNookY+0fnPk2fNqd3AXR3aT2OxfQb8egj8aggCMSaOJyP3?=
 =?us-ascii?Q?bAuFAWdf3/GvaZ+0TdZQ2oNhWcCeLqXYZ89xiHjeYVkKa5VLtTiHaipAMdgj?=
 =?us-ascii?Q?rrZ5Zaoe4asoAF8S+PXKTHnfP+b33XzBHZIsFqJldI5naftiXahTyw39fklS?=
 =?us-ascii?Q?AzjCwMQQM0VH3cOx+MpT6IO4k7W+q3TGsT3/Ss7aRCdQzqvK7gT8ocniBuRy?=
 =?us-ascii?Q?N/rEdXnJylmlXgYhevnixJX6E1YCt/DL+AF6xTPsZ4KVC/LYa+SnawbiM6os?=
 =?us-ascii?Q?LX/UfuMRLANLfVD7MldTWl0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae21ee40-6312-406a-c60d-08dd7b28fde4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:50:14.8399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEhlONbzGm9qeZDanoKFgHMqvmBSy9D4UOMHbUmvu8jXbudmEqKqULTNDSebivg8EhKzqE1uWX8bU/PEXAmpm3v5876WdhSAifDBni3p6UX80vuY8aet/kaOdsAwZJzC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6608

Hi Geert,
Thanks for your comment.

On Mon, Apr 14, 2025 at 09:40:22AM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Fri, 11 Apr 2025 at 19:06, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
> > SoC, this series adds driver/dt-bindings support.
> > This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.
> 
> [...]
> 
> Thanks for the update!
> 
> Can you please summarize what was changed in v7, compared to v6
> which you posted just one day earlier?
> Thanks again!

Sorry.
I posted per patch recap and not here into the cover letter.

v6->v7:

 PATCH 11/17:
  - Collected tag
  - Drop the cru->info check into rzg2l_cru_probe()

 PATCH 17/17:
  - Fixed indentation + missing space into rzg3e_cru_get_current_slot()

Thanks & Regards,
Tommaso

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

