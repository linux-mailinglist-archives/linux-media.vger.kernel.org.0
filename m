Return-Path: <linux-media+bounces-14273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9472491AD9A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 19:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6371B2671A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 17:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C90A19AA77;
	Thu, 27 Jun 2024 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="XzkYdIcT"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2102.outbound.protection.outlook.com [40.107.237.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42095198828
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508283; cv=fail; b=IeHMheH7EZf9C7E6gR77D1MCQbjusAW1ZLfTCgmNGTE9HELxPHZH/fE9r3GjGgYekK6NBMqVPxBlWYwHTIfEZTdgV8o9ewCEsmbN+w3kVKcKm9EQBVpGG/cGZaBUzbzR0OCC2oCMWBT52E90qdGlIexIQxBTdspylWML9C95QQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508283; c=relaxed/simple;
	bh=KfqMIv8zPKtW/WEtFrrGy/9Bmh7hZ291x5GK6AK4zXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f50vCz/TkUGxCej3bjjEeLEkz/EgyPUAQDp+TmDZ0s7ENWW/RjmTFuL55UoKgssTqcWp3FmTB+ED486bbfN2/EZqtTknsN9AGSLoRqpFZwVss/gZXAGfGbAwLHh7xeEupHLXO7uq1zOv4QPx3hgLLL/dTWEE6yZpOJascM0Ik24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=XzkYdIcT; arc=fail smtp.client-ip=40.107.237.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4Cg+2UZxVAU8TRUwrty10e1Dnxk35MYQXI/Ic9QFR9l6SM2ffljITgEWnWLIUxWOCudxlyup84MGGWE3totIELy/I8FL+VeJmSTC8tt7PA+dfaieRW605XhamRweBmC03Jn3yQHND/d/IsBYU73C7dfYzfjUADTRNQnmzBP0j0kJU2+GAcOsAS5I9uSq88/QTWgXXGBqDM9+llBM1c6zExSNcoFVq3PsMF5j8RF5y+xTxJ0FE3wNI9eLolg6UEow6p/FHZgS16hDOnsByqaO/ujFETVVi5d2pC5VMCvL4LuEYl+bBXMnRqE30/TsCsbCkptE9kFYdW8cAsJDT6F9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWkCUcSpbA28V5Y0lxdXMw/ScU13qc13jEY2qcucYDk=;
 b=VD9xVYj/eweAsLZuStcS1C0cebPNX+QmG/IQZFQXMRf7zSE/sRK3BD6y8WPjd3v1Fj3H9CIBwT72jhEU2+CgvQPZTLqoRMj36fQ1RFVeB2OcN1j7GVcig7mx/MPHKiAFalAnK+O/KUrk6n+M4Z9TVr5jtTepz+yv3a+0UeqMCMsKxRMgPgLWs7UCDEb0vr068vuEZ21pK9jHcgwnKDySnKVX/1A02yPLelVSF2oiVuvCvmZlq9g9FpzMI5Bclfsd735vyVrdAGvVJuFPtfn2e4Hfmzlfuk676QGmqr/4rlAhWW27OGOyQ6SnmFFV0A2fiNFMWKB+BKhf9AUWH7ps3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWkCUcSpbA28V5Y0lxdXMw/ScU13qc13jEY2qcucYDk=;
 b=XzkYdIcTA/PyU5UoO4ADDFUBBb9v7aCDih/nsiyFeNRrSgCU3hbO21F05qGjD0NYTrwI5g4X9KGfxash+9q+n4051r3ORI0GdkEzuNCg4s2XMBqE/dgS4GNQiWOjZxyPiaXrmRqQVaMQi79cZ6VatAu97bF0hfuiIHB9FiQ/t3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 CY8PR14MB6219.namprd14.prod.outlook.com (2603:10b6:930:97::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.25; Thu, 27 Jun 2024 17:11:18 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Thu, 27 Jun 2024
 17:11:18 +0000
Date: Thu, 27 Jun 2024 13:11:07 -0400
From: Spencer Hill <shill@d3engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	shill@d3engineering.com
Subject: Re: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
Message-ID: <Zn2dK8ZA3eFLk4Dd@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-3-shill@d3engineering.com>
 <308624fd-f62f-47fe-a615-69df0a8d270d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <308624fd-f62f-47fe-a615-69df0a8d270d@kernel.org>
X-ClientProxiedBy: CH0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::30) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|CY8PR14MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b05a83b-73d2-4180-e8fc-08dc96cc2859
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nE/imiDqTsHfuege5Diz6ElOyZjZek1HQzW6DmuElQ3wSjXnOrD4tH4sHM/O?=
 =?us-ascii?Q?8l2rVfkhT+fIamWC7gp9NVkScpcJqfExaWEI5x+WTZQLYs7+4SqvBkVUev2t?=
 =?us-ascii?Q?WuryRKhY89cXoqswLldiailItKP9Wf0ehAgQg/57m0xW6m3CZJZJsxFAyIn9?=
 =?us-ascii?Q?2WO8UNcbOXk+4sLjH6IDbYGfLraU7wu/nkvUb4NuFcZTM5SezMaHdlsOn1OT?=
 =?us-ascii?Q?Zn34IzoDF+N/lOE38Tlrp5z8kZ41B0JBOZMkqZSEyZC7SVH6WzwIULTMYFZa?=
 =?us-ascii?Q?cw415sBU4XCPZ1IFfg5LeQyRjYuh2cA6ANKtMHa3WCd5H8hXvp8TqrYsFFcV?=
 =?us-ascii?Q?+hwFreIYjx9pNZ+CBDqahRKfZ7cmvAEOah6AWPLWwh82bF3mIxpMoRwcjFJv?=
 =?us-ascii?Q?YHM4pvNTkafs+utccbCLc5ZuriVedGZ+SLSO2FfMUjYVWl525EVKjkGGevw2?=
 =?us-ascii?Q?zt2s85d9akfipH5F3nzYbzWxz6UOpqW5GJ+lbqDaxV9Vb+ngcRqxMnmNicce?=
 =?us-ascii?Q?tkkC4brY/099pMuorP9q7w4WzlUp5us1rAl2msi9qjOK/+jK1+PVlEXMDbmB?=
 =?us-ascii?Q?YMkF/IA9Sv3MXnSrlyvUrKEKE5qiPMj9vhSbU0q2Prn+18U1yF7CeCS89nzz?=
 =?us-ascii?Q?yh/vOcpqnnFVG9gDNpdlCmII60lI3S7oUDxq60Y1CsPJOL6Rq9WN1ULG0Q+3?=
 =?us-ascii?Q?GEHo5Fd41d7i05C9paDwonNYbskCAiAwvXyrvOPxneSlCsspnhmxORhoOhMK?=
 =?us-ascii?Q?wkU0ipNwjNGi//OziyheC8nMFzADh4YoSCf4RkeyHW0ZHqB+NqkGFjlNgT7N?=
 =?us-ascii?Q?GpHeiVht5elDOZF9YU9773pJmByUab4JaB2TxfNu5vOhhzrQDaOIEjwGCF/1?=
 =?us-ascii?Q?kW8rQkHDJtU6eQpjx2A9LRYBdUSrRK3AabmeBZt3q8hT+xiesYGsbn8kP5w+?=
 =?us-ascii?Q?gavBYOn4bcZSUcU9F68lmsLkkghPI6T6B5M70WEl4Q7DTl9wD4pBKCB9RfWl?=
 =?us-ascii?Q?AExO7qClQmzhQIgACUOrv3FppCYL8+ByXY1acEPW6uvs9xo4rkBmD9aOUNmr?=
 =?us-ascii?Q?yXivshzYi2qfD3o2iRrGFWxd6I7tjtO3u1FL+nsTVspddxk16/2A484TxAyW?=
 =?us-ascii?Q?AaaBuzDMbljyvfNZghbLq3YgSgN0vHMzxJMSerEpo7n7AUjB9WIIe+JS2fKe?=
 =?us-ascii?Q?r/7BWOeMXj6AQ8zP2AMgI7idmrkmOoiUgFGHE4LmreVn7JPLFu7qnigY/1uZ?=
 =?us-ascii?Q?NXhx5ASNSIxHLiQASMsL3kqMcvbnMTyQSI3X5Jv+Hx5MLEAq2dzGh5b8UQdV?=
 =?us-ascii?Q?ZVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iqNUH8pNob09qC8jQyydDrvIHzME03XfyP+6Gos7tzkcR7y4597UY/u8UByF?=
 =?us-ascii?Q?SH8uX6JpW1852w+EnkyW6k1a5QAt0jza8BReo85r48peCJOQWhE0aX5mqcRA?=
 =?us-ascii?Q?ITWqZmlZ+TS5BswIjeDtKbmZA3jLy0h4MZugIaw0l/qziMDMuhy8YiY7Fmst?=
 =?us-ascii?Q?tRT/FjYF58/A3PkPrG4nCBobZKnbjmBK1FjJj7WykNvIgvXoHmkkHG4K1Ijw?=
 =?us-ascii?Q?3jgjlrkNNXslJcDJi5BG2ZEw2zMVhgk71Nn/wNpKGgdIyLZmIxHL1AF3d5Hh?=
 =?us-ascii?Q?fi6CG3PBKXgaMOm6M0PU8jNDgYOXB/O5dQ5rshBjamRxcsggJYFEaC03a9WO?=
 =?us-ascii?Q?aoxqVjCjQk48MadvHPSwUmkBR8rGXcQYFk+EedDmOzSY8HKT1/tCYuE+Sy4G?=
 =?us-ascii?Q?MzN5/iMPI5dyOsy6j71XdzcPh4hwmg6J2i9EqSHgcjhikgDWw1tCI8/iGg4p?=
 =?us-ascii?Q?whlf6Jc4cBR7FH+Si5uOSFtFMd5Q6pLf4DBpKSM9kbvvaWgUWYG5fZ+GNYOa?=
 =?us-ascii?Q?8gWKfUYL0Q8AIy2dpE6Ak/qblHMGtnaW1SwStq9BKpQY3wtKJw2oajMScfwR?=
 =?us-ascii?Q?h/OCBy16g4uDMmjraYgDtmiSTOTl8cR2azvKQ/0T65ChLZHv/ImfQHrh8C62?=
 =?us-ascii?Q?Ai0v5VAAanOnOgerGE+Gt8T+MkYivVWC2P91dSODeZ1EFEvmzmEpL/KSqIwV?=
 =?us-ascii?Q?Qk22OskNpnCdeJZPjGLVrMtYLosHuQ7tCpAvYlAa33NTmeRhcpe9RFp9fVI7?=
 =?us-ascii?Q?N0IY3UVD9mQPQjSyOb9Z1pg9wdTJQLrxYgy5LMkjX3JWiFB76xD2u8nE496v?=
 =?us-ascii?Q?j4kJzsjj8I3+6YFNYYZdl9iiOuLmu2TvDlGq2F3Gg8XYueQdX875nctgRr2P?=
 =?us-ascii?Q?7ulEiqgN6isEb52DOdDG6nnrEOs5q05yakwzAYkN2GJj3eXNCQ/RoXKw+Iuq?=
 =?us-ascii?Q?S31mnK6fcizwUsO3qyLBw4ASQRuufuXoV/m6R6wisnKuObNeTE+QsOL2CxA6?=
 =?us-ascii?Q?3lpPoI8c5PSnY7mRNj2e/Prl2Qhnp1J0wFkVwmu1xYoyK37+8FAS7BhmC+58?=
 =?us-ascii?Q?2blz5ohApkSkHBgk2DFZxQxoAMO4vDwNojjzNIrPYOg/BkRcRDe/8yJQfkv5?=
 =?us-ascii?Q?WMa4XnIHBOcH07V0R+UIU+Lw35ccmnZsKYSkIfp7iHWZ2/AcecE9ApfS8hfT?=
 =?us-ascii?Q?000ep3mG10hPzgt6zDD3TxAFXh1+4jGTmupwIgA7ZOztMcggw1CKH99QYHIl?=
 =?us-ascii?Q?Pylj0z4zDtMg2aY3LbA5+qVEdX2gCnhJzL3y0fgw1kXP04b502rIXBFo+rAv?=
 =?us-ascii?Q?cD/HxOuMD+QQODayrmZml4JLVF5Xdsh5YVr9wwjan3iSTdkrjKI59uqu1GmK?=
 =?us-ascii?Q?KkApXawgXEKmpWAO3X768rPClicCLcZJAB93ErFgLTl9tozgt/SzOv3majup?=
 =?us-ascii?Q?0ZduM7ozh6vAJTU4TsUCuA8NKF2S74KcTtcJ5jW8kNgHqyUyFRv7Brb4x5Xa?=
 =?us-ascii?Q?CDJyiGsvqhC640m1vn2kQ55Moe7dcUzYGDtX5QQarH9Sw4s338tnSmx6BBB3?=
 =?us-ascii?Q?eveQfT0d7mEYzEL1u7oEqrW3zJTu+XQvEsTrV1X1fsGYBeOEdy67w3Srpj3U?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b05a83b-73d2-4180-e8fc-08dc96cc2859
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 17:11:17.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c/bNQGPKPtx8JQ+uxv+I6kx3YDjr0Ub8xazFxwTSEPm5fZPxBE6lB0ZVRC0SsI1dGGL+T7Gv5gimObKw8Anlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR14MB6219

On Thu, Jun 27, 2024 at 08:52:47AM +0200, Krzysztof Kozlowski wrote:
> On 26/06/2024 23:15, Spencer Hill wrote:
> > Add bindings for Sony IMX728.
> >
> > Signed-off-by: Spencer Hill <shill@d3engineering.com>
>
> Since this was not tested, limited review follows:
>
> > ---
> >  .../bindings/media/i2c/sony,imx728.yaml       | 78 +++++++++++++++++++
>
> Bindings are before users.
>

Sorry I am not sure what you are recommending here, should I change the
order of the patches so that the dt-binding patch is first?

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
>
> Do not need '|-' unless you need to preserve formatting.
>

This will be needed once I add more information.

> > +  Sony IMX728 camera sensor.
>
> That's duplicating title. Say something more about hardware or just drop.
>

I will add some more information about the sensor here.

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
> > +
> > +  xclr-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Specifier for the GPIO connected to the XCLR (System Reset) pin.
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: ../video-interfaces.yaml#
> > +        unevaluatedProperties: false
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
>
> Drop this T:. You do not maintain that git tree so it is already covered
> by subsystem entry.
>

Okay

> > +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > +F:     drivers/media/i2c/imx728.c
>
> .[ch] or *
>

The .h file will be removed in an updated patch set in response to other
feedback.

>
>
> Best regards,
> Krzysztof
>

I'll make these changes

Thanks,
Spencer
Please be aware that this email includes email addresses outside of the org=
anization.

