Return-Path: <linux-media+bounces-14274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B191AE41
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 19:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240AE1C225C3
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 17:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9861A3BCB;
	Thu, 27 Jun 2024 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="C9V4p6LQ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2113.outbound.protection.outlook.com [40.107.92.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A971A3BA2
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719509626; cv=fail; b=gJfqJ7s1ZrgzzWV1QnHAO3hct6KF/PZAG+efH9WHX8G90JbXhGqSKDrBBHKxelGnRLWNo08IxSyGeKY0ksEfeIlz060SpUq+QW1GiGH/APK4qvxIz1RZoO4l44BYrSjpo2uDhne2u5WvXzmCVOX3W0R2Y8FfwRYBW5+pAcOiLos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719509626; c=relaxed/simple;
	bh=Uj48v68ltJz8OG9cXA61FQKsITLADcEQfJMAY61L8I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IvlhDN3ZjJ+Zj1KtfuRSHNqDqcOdQMu1OG29BX5bksmeb05z0Z4TTV3KCBVksgfyiV1Z/H2cMJsIApWEdFqpBS1cPfMuxPVviPlrTvD3GybGhUmg1aciL+hkFUzzZ+w+rP6Cph2gz/baHtRVOczBizNpJiNxgcKWRpygfJsK7t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=C9V4p6LQ; arc=fail smtp.client-ip=40.107.92.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez+5OylckDNTUaSULYHeVvqIOQG6mfMjWE0CrVgUqMQAkItTyUoVHyTZD2JX2p2s7ssnCUUsuYctZn9Iy2Ct8HaBb8NtXN86/GqGPGE0u77F20uOOvR+htxqi2uFVXDtL4B2BPKOrfgX3gvCFupRaCgs6/RYDI3F3GD5zz9tZPXgs2S27+sMMIzYqfaxu+BnZtZsj5G9USxahn21TZxRg/Y8FEWKVu4teup0FbMzYjQPyENR2+g0RgRcNiLTP2hToZ7RRjK9De0YAAwdvjp/MDAQHyL+1EVye6aje9bRjqp/lMk6aSjNqGkcmuwapNJimpIGqsZYBn05zLE1ETOK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2zEnI7/Y8ziFHDYjGw/Qdk31i9ezsD6REV7Tm+Nu18=;
 b=BV7yK60CCPf9AEfM8NJ9K2ZPVQGVDJ9nfjxMrVNIRQZ64hmVajKvpElL8Ja7q/MbWb0TrdgLoOIJKwjMJGwF8UatRcn+gNHokJYFmhRbxMMnjolJNzGhLusv+LYPSs2JOQZ8AbN4mNIhPDIgkjm/nPPQ+eRzYS2aEACfrDjSSjLHb8ehgmVG6RFLr0RfVRX7TS7HpK0Hzwi7Ms30TuXnybDSpA2B8Z3wS40TnJ0znyxhohU5vQgu79ZJ3l+7fanr7eY8csLkx7r6uDWrWVH+YVKESAvGLm8bc186zcKvCOWcf92ihK0gNGBwk2OZQfEC1/El6AVq2Ezyyh1MzJV3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2zEnI7/Y8ziFHDYjGw/Qdk31i9ezsD6REV7Tm+Nu18=;
 b=C9V4p6LQCiUUotK0NHU0GIUnWS7gZzw+bU7DEmEcxSe+3lx+L3IK2BJ9wPuBNEb6Bx2VBtdu3eyKTIJg0kdSnr5Ii8hdARx1CdAqLJEplZpOgda/FaQGx0HJwPKhyW3DsCsAQvxle/Xx/rwwUN2zfBuyczpWz/JRRZBJjyKO22I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 SA1PR14MB5281.namprd14.prod.outlook.com (2603:10b6:806:22b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Thu, 27 Jun
 2024 17:33:41 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Thu, 27 Jun 2024
 17:33:41 +0000
Date: Thu, 27 Jun 2024 13:33:37 -0400
From: Spencer Hill <shill@d3engineering.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	shill@d3engineering.com
Subject: Re: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
Message-ID: <Zn2icWuizo0WMvxc@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-3-shill@d3engineering.com>
 <2981208.VdNmn5OnKV@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2981208.VdNmn5OnKV@steina-w>
X-ClientProxiedBy: BLAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:32b::6) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|SA1PR14MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: cc68d03d-685d-4701-6b90-08dc96cf491d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?l4uakNQgWR1fXCZs2w5EvqsEmr1zxWbZ+M0gZDwFKXycIyWjJQ0UMjlzWy?=
 =?iso-8859-1?Q?GWSba6eVyi/EetzXgAnnrsRd8U0ZJE1IYvU41f43EtaNHT3J1DSgIY0knD?=
 =?iso-8859-1?Q?hw6EopUWLoelA5wvt5fdydjkBzcXX1FXgtxRlNvy+Y1uPd3Ayhu/pZDi5R?=
 =?iso-8859-1?Q?wDnSvD5HrtDrJu4VqBuZLI5yE8I8Tl/8w/oV2BLlhLPJibl3fyRJ9pVB3q?=
 =?iso-8859-1?Q?tbpvy+u+2MNBuH4CCnBNaqiRheERKlX1SAijQ5sFdQSSoJvTwVrAQBMLDm?=
 =?iso-8859-1?Q?iMdZmxuZlTZQsyL0Qih9nWKhfluRFqntyI33Vt7gCakpeVyUAeQ7/hUBgy?=
 =?iso-8859-1?Q?ueq0URa5H4XIb4yy+1wPNIiORQxMfFbmw9ntjxiAiYT1eovQv7UF2sINtW?=
 =?iso-8859-1?Q?cOp2ieNRr7eJnRhclDe/okj752Ozl1Vd7hEpy4lsT/Wu24uFr9W66ZXWIs?=
 =?iso-8859-1?Q?w7PlNc+LaTi5sQcEmr5DLmBTZO27p8Iuhs7IREBlQTJvdu26U1P3nffK9O?=
 =?iso-8859-1?Q?3MR0BVkKsbrfx8Xzrn41HPDKYEJL7Ywq41hrRlPIppIM+4ko3rG8gR6P2K?=
 =?iso-8859-1?Q?jlh7gO7a30ZpG3SfmTL/XRchxwRpPkKNBAFM6BWIN2tNfaSjljY5FWKwoJ?=
 =?iso-8859-1?Q?ZIunLhbMAhkOU8ouoWy5s3gleRnoBgm6PsUkzCg3intTw+vpMzKNjGJ9/+?=
 =?iso-8859-1?Q?h27PjxVSW8fNFM2Ouvg4hOTUdi2wCqzvjYqdo9ECtRhRJTlPOdbJNtQL90?=
 =?iso-8859-1?Q?sq5lMLFv67yLfhwKLHsu57VoOjslEQNUSOMPGNVkLQuyO9Po5BG+OLuYDM?=
 =?iso-8859-1?Q?5xTnJ5FGn0F/eq7Nk6A3dVg1pM++a/osYCAw8TjOAkNu1VK7V0TplPGLVc?=
 =?iso-8859-1?Q?RvnPTOUkG0hS30QOcfrS7CbNsINvGGzG/yJfhIRn9oldBXIoQUu8DsOgN/?=
 =?iso-8859-1?Q?soZVHurja3J1MqYL3Ew6IvVt475CdNce/scD+85KBtsDb7txmKHh2mfX0R?=
 =?iso-8859-1?Q?s4Aqcjh7dhjg+2xsfvvqm8poJewIqaRBYd3VFz68ZRl/Qc6DjD8xT6VE04?=
 =?iso-8859-1?Q?rtRYUDZ20kxHgwBoTMXXXDKLxRitInftJaIT2y3fIjfS0D910OjcWTkqju?=
 =?iso-8859-1?Q?AnF1n2E7wdVf4LOEXMqNflY9pDl+oYyssdirYck4l+BKbgGPciRI6kfGO8?=
 =?iso-8859-1?Q?yJgxkK4zD7EQEmbJcrbf1CAUyVA1d8PLReIMCxO1EjBJeviTNzpoZdYiGK?=
 =?iso-8859-1?Q?nILQ5tjuBJGqutsdaR/oJKwQQizFPLRTCO1L2MnRTq5VMFO0j+Gdu+JFfC?=
 =?iso-8859-1?Q?Kay/856X2i+FW8lOmcFktiy4pfFBPexCUXdVHgavcCjVyJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7K2471DRW1ErZvm5v+BAaY34aVE9Fkpa/5ss4BVYrJfDJsmCP0vydTOO+8?=
 =?iso-8859-1?Q?PtsnJx3kpvwdUohYErEE/ImHBbvuV7cpdo2XtUDCEbFIs2BNlL/INppE5i?=
 =?iso-8859-1?Q?uX/CszJ+d4G5U1Uv98aKYk345otpKn54n/y48ejvkrWV6vzFXSmzzZ5IN8?=
 =?iso-8859-1?Q?Ln8TsO0jS3tyG4F13In0G6ehV5ynIGoIEsGEBuCUlLUiQP8YSD3i0rk2KO?=
 =?iso-8859-1?Q?knB3s9lWdwV2uFh3ZSjYYmN0WYePYmiH6RGkJiUaJSpt6wqBw9sedcwoKJ?=
 =?iso-8859-1?Q?JEg2UOl23cCGzmipBmDYfOE3+sBJIroAaJOhwX9lRb6svYUAkOBdkU7Nu1?=
 =?iso-8859-1?Q?zIp9cJEnmAQSKwIpObV3fypZLBTQrrxNlzYFJGgi7T+ZgqNkpQdYS4fP9U?=
 =?iso-8859-1?Q?AvIJuD30QznnxNs5dNGUHdtxc3tNYP3vVzY7DbnCsg+LcjoqhB3N08P6r9?=
 =?iso-8859-1?Q?nC7RMl5EAmIybXl0rAP7rq58nOke2siovMESZeW8vWV41dKREpMR+byqXI?=
 =?iso-8859-1?Q?pFwyocHHgOtpTtL7qJZSPoUPJfrFKmLByfyyiCV5V3H7/bmDgDhRZNiy5W?=
 =?iso-8859-1?Q?nmk8zN2ACrKEekK88gzoXNVGHpbm3NR0pEJBoDgyPZYLoqpmIazztk99Me?=
 =?iso-8859-1?Q?KkLbRAezpt6myjKKQr9Zf7Sie1/CgvTLuJVf+wMn/LVwAvgE7+88CEj+eC?=
 =?iso-8859-1?Q?hf1of4cZc4K1KExO/1Zeumo9ilJAEi/0ZqU3OsmaEx6zrif9PDyb4OcJpy?=
 =?iso-8859-1?Q?RIvo60N0JlrDqH+tsUZuU/nF8+PkSOt4W2TOCx97liNCxxmNOthbBJHkON?=
 =?iso-8859-1?Q?fWVdAYmakK28y6ku69E7k2jxGk+XP1ThGFPPFSzez6gc/h7Gw3OhUytErp?=
 =?iso-8859-1?Q?BBpMAwFVT1qsAeCEKU33Dxc61MuoIkYq81bSEErYBCzt8mWCY8GcLaPzk2?=
 =?iso-8859-1?Q?HeE2Gxa5fEzb/COmhzsRxmPmXCHvBEvOSMmagUZ2ANvBb/Qo26vDLCi9gs?=
 =?iso-8859-1?Q?g7G5LWyN0WcnoDn/zG96yGzvKsNWlX6n7Fl+qvUuGsPquMxasABuK6ePRM?=
 =?iso-8859-1?Q?sex3vjDm60n7GjiPaJmqtCkkh3EzndDEvUqGD/GDSfCfMftQJtGN4/NkQd?=
 =?iso-8859-1?Q?Lt87qIUiS4RgOgk3OsAEPal4/V5/3nN6+MEO6Vd0F54kyt3a8hLiHNcE23?=
 =?iso-8859-1?Q?uLS2XoRfwasFOfDvOKoPDN/rmdWikWGM8yrvgnnU/dNEL8snydOxAnLGBd?=
 =?iso-8859-1?Q?LYNvatbIfy/Pmrd9+3NJ5CwsV87pquLa5ArL1l90SUHsTx/wgUTMJJaQbL?=
 =?iso-8859-1?Q?75ZCC37jKO7VGCqhYr9XwYPH795+FboOyqX96xIQIxE1Y+K8WDMru6kRES?=
 =?iso-8859-1?Q?q+ejj973i0vDV5anjcWhOujkAxnY6GYcDQ2zJJ/9XvDAHCHj5R18K5qE2K?=
 =?iso-8859-1?Q?QVz9ADXdxCsnLQTqwnsbRB3KaMB1jCD/oWe4oCC4PqzoI+pLy8yQU0NieO?=
 =?iso-8859-1?Q?P5Lmn9KDpJW4dSLK/XO7fdF/P4o4rCIzXxo1M2fcCo3mYuyAUC7+ZEsehg?=
 =?iso-8859-1?Q?2cvapl1GXJ3UOw6XZGR9a7pxzr2/SYFrtHH6adMFIn+ODb1zLsXj+Gprk8?=
 =?iso-8859-1?Q?v46sMexg653Ux2GzOYX4PR6+JQwoNS/Ap/iP++z2u4H0hIX8FpvbmZTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc68d03d-685d-4701-6b90-08dc96cf491d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 17:33:41.0199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6faCiA3nwxSHfUmt5Dr4mahTMRW24kOoHkbjSFaTqL+gdawtueh4k3gvOdmEeDzDsuDW7HqSqyRWXL7+JiToA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR14MB5281

On Thu, Jun 27, 2024 at 03:38:03PM +0200, Alexander Stein wrote:
> Hi Spencer,
>
> thanks for the patch.
>
> Am Mittwoch, 26. Juni 2024, 23:15:29 CEST schrieb Spencer Hill:
> > Add bindings for Sony IMX728.
> >
> > Signed-off-by: Spencer Hill <shill@d3engineering.com>
> > ---
> >  .../bindings/media/i2c/sony,imx728.yaml       | 78 +++++++++++++++++++
> >  MAINTAINERS                                   |  9 +++
> >  2 files changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,im=
x728.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > new file mode 100644
> > index 000000000000..613042ab5abe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX728 Camera Sensor
> > +
> > +maintainers:
> > +  - Spencer Hill <shill@d3engineering.com>
> > +
> > +description: |-
> > +  Sony IMX728 camera sensor.
>
> Are there some more information? Like max resolution, image format, bpp, =
framerate, etc.
>

I will add some more descriptive information about the sensor. Should
information that is only relevant to the driver be included here? Or
should I just describe the sensor? For example, the sensor supports a
significant number of different modes, however only a single one is
implemented in the driver at the moment, should I list the possible
modes, or just the supported ones?

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sony,imx728
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: inck
>
> Are there any restrictions about frequency? Like a specific set of
> frequencies?
>

The sensor must be between 18MHz and 30MHz, I will add this to the
description.

> > +
> > +  xclr-gpios:
>
> reset-gpios, see sony.imx290.yaml
>

I will rename this here and in the driver.

> > +    maxItems: 1
> > +    description:
> > +      Specifier for the GPIO connected to the XCLR (System Reset) pin.
>
> No voltage supplies?
>

I will add these.

> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: ../video-interfaces.yaml#
> > +        unevaluatedProperties: false
>
> Which data-lane configuration is allowed? 4 lanes only? or 2 lanes?
>
> Best regards,
> Alexander
>

The sensor supports both 4 and 2 lane modes, though only 4 is
implemented at the moment.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        clock-frequency =3D <400000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        camera@1a {
> > +            compatible =3D "sony,imx728";
> > +            reg =3D <0x1a>;
> > +
> > +            clocks =3D <&fixed_clock>;
> > +            clock-names =3D "inck";
> > +
> > +            xclr-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                camera1: endpoint {
> > +                    remote-endpoint =3D <&vin1a_ep>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ef6be9d95143..34fde35eb0bd 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20589,6 +20589,15 @@ T:     git git://linuxtv.org/media_tree.git
> >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >  F:     drivers/media/i2c/imx415.c
> >
> > +SONY IMX728 SENSOR DRIVER
> > +M:     Spencer Hill <shill@d3engineering.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +T:     git git://linuxtv.org/media_tree.git
> > +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > +F:     drivers/media/i2c/imx728.c
> > +F:     drivers/media/i2c/imx728.h
> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:     Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:     Alex Dubov <oakad@yahoo.com>
> > --
> > 2.40.1
> >
> > Please be aware that this email includes email addresses outside of the=
 organization.
> >
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
Please be aware that this email includes email addresses outside of the org=
anization.

