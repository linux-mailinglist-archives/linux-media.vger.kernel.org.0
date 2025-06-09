Return-Path: <linux-media+bounces-34361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2BAD227C
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 17:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655293A2CA5
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 15:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5FD1FBE80;
	Mon,  9 Jun 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GGRilc9n"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5812AE6F;
	Mon,  9 Jun 2025 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483161; cv=fail; b=mFAHr5DR4FlcdbUqtYj5Uz553oU9AMTkzTxiz0N2c8k3eAGT04UvkrmAjKLz8SGdg11oONA6e4zb18XmQGDqlghHg0Gubo1V2HxjJisvpat9mN9fO0C9fJiHljme1qeYzrId9eeEBTwa9gYScmFBCBNcsEYFBcqooPyza+pUml4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483161; c=relaxed/simple;
	bh=dUyDKj2LEvLJVizdaJEPVC9zr+K+KzVzmPyCNTOPmQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZYa5uDnBj5zd5aQDgFO+BDIrgVvxgBbQbQOVEOQAWQiSfEJtF0dAwuZiVlwliu7G527ziLP+66kiUMq/8xiiO67tS/Rs0aqBX9HG+FKje3K+GX4pbZORrTqiUJ+zYRXouVmH1NlDyfp+orA4KiY16tjREg+HYjN4424bPLIqadg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GGRilc9n; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RddYwCtrsY2HkYaVg8Eo6hPu8++AgXR3ilU8pL+6WUaJBEZUO6cpn5jVrLtXiRUc6D99GLPHcGRBWOSPJMaDdkpDLMC6p6BwP864v37wU3oZ5+OM/IzeakaHLAbCnIQbq8kyBlOfTYrWv3OYES+9sAWPupJKTb6M3WVFTJug+bAzC+aDqeL5LKG2F7bdb2IPX77PA264D5HLq9DCeaZA5yWJEbsdbyimZkosazhGAn4DgOuCLGJbcPK1q0OY9SvmezYoMUsOcNZynqMH4ZWGI9mueFRuMLuEYsd53ksiLvoqF79WOVo/Y8XiXeEwjrRXHs9FYw7b5wxruYU/oaX5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm9UCsKso0k5tLRupEKlKr3OimTG61DNDfXjblVVtVM=;
 b=C8nCZOSDpYrRm431QuHMTct0FnVPWDsOJEd5C+8mAdTBUKijHNklUsx1n/XTbOFblz00nVd1SM0KUEWMRePXfUYhoQt9XUClBZPVMsT1k2uPVG9vf5A80YFHNwZxz0+0Fm8/4ESgl/6G2WHvNPQe0PK0UMSdo0TNTxKIgzLQVAYjCrdtzQyVvPpMeW1dXb3kyaay3k2LZrmDr5SRrKF5p0xTB6spaRx0CH+glFwLTRTRDK5pN7tJfikzWLpMBSr+Daw2IHKBPCZs9c1XkLURUweu55aO1wcULIvTS+P4l0zn7bMBLYTXnabAiodmdoDfJvltirpasx0qj1VA/oQZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm9UCsKso0k5tLRupEKlKr3OimTG61DNDfXjblVVtVM=;
 b=GGRilc9n893plX111HRsbFevmtDC2t7bVSrWk+16R8EFvSlKln1ky4iRuaqpto7rRh49+0+cluoCxk6A43k1sVIzOBSiCH+/U9XhqaXhz+UrXx+F25qLahVmq8gAlCIjulzVpkrvJSYPScSHs8cjjYaB1I4TUTnQWkTACEdHr/AvwiEld74jAJRfJjFNi3ws051bYMnu+ZL5hE0hk9l/FJbiG1zcB4JpnRhaezrttWBjOx44aBiSwmkWKbJU1aPQS17qrzojgEhsFFOnb0QVNXcxp5x0tVedvh5RSTmjllXy45JiQNPVEzBxRSrqnRA0GgaMa8bgSKkjWsDniEx8iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10803.eurprd04.prod.outlook.com (2603:10a6:150:227::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 15:32:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:32:34 +0000
Date: Mon, 9 Jun 2025 11:32:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10803:EE_
X-MS-Office365-Filtering-Correlation-Id: 4931ae15-d32d-43c9-9d98-08dda76adafc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?m8xRMK1pI1+9q0MFMBUrlzjfXtt+yslbWdK8WeNK0oXnz1uyFwrv4/VZqyVR?=
 =?us-ascii?Q?+n65YhYjj7eAWS67ZJVIVURPwFkmiOtQfm+hsk3Fv2MHKGNyfp4FXCJYtRAT?=
 =?us-ascii?Q?H4LXxYHgjAtXFqs5614+RdYqWRRPaH9kYNYMaxyUvs2AgM09L3v0oiotoLga?=
 =?us-ascii?Q?OQHCuFmvBblfyt39N35ohihguYqyFZvHA0rbMEhtMe+88bBgSK30y8Lf/0BS?=
 =?us-ascii?Q?JEQBU4lrICntavEyL206UqWvMZBahuQC3sK5YJhRJX3MbpHvWq73BXmB42br?=
 =?us-ascii?Q?/cERzTIjDyHuTtAalL2FJM7wMGM+v0v5vwtKOxHG7+oqp6jjJWAWNyQu1L5s?=
 =?us-ascii?Q?DyDnXioVo+fGeSXo4rldFNzinKhV8meLQ9NFlLxNSwdlQPiLWObDQYPL7dCa?=
 =?us-ascii?Q?FFsqBpLiVdJv7gB21hQZ6NpLJMiZvyeEmaEfEnqzY2zzSwGIlg0TCNW3tyuW?=
 =?us-ascii?Q?jD0vY5ihOLguw4Ya6GAW4XCSTOOZ02VhqY52hveXQCZ1E95NOfG0gkMEytSC?=
 =?us-ascii?Q?ecX8im3edPey6FS/ZwqQdPSSf9gnngQ6nzLW/PU3yWGFPPr5ceAG3hMcPYCd?=
 =?us-ascii?Q?dRiFl/gAmPsYu9mnLJwReWUY8McQ9QW7OneWfvubqaI/coeaBTO2BRz8pCVn?=
 =?us-ascii?Q?Icg95Xptfy0iL3W4eSermsbs7RcejRuRdtp0VghmiypwrJvpy4OJl6VAP2Ep?=
 =?us-ascii?Q?izk4bV99LIPxJtpay14nP+qs0LRVaKA5uuWK8V4O/y7cuDwgRAqwgEtA2Zca?=
 =?us-ascii?Q?3WC3Rc2wrnW5vR4GiPmxIJOQ/qy0iA16yhJWjYbn0L+l7L59pG/cPSBT4wb/?=
 =?us-ascii?Q?0izV12yRJUpj72Qi7CzXy4H5J/7ig5kz2d5zRTnHRRpE3I2wCAY+KJUQpUrp?=
 =?us-ascii?Q?u8bd7EaPSU8V65x08JQFg2a//yabvBnnMussmMfZNTDlOFXR8CZ5J2qg4g6C?=
 =?us-ascii?Q?70FTU1yyIKlY/+D9GzfDgM6TraFfQlrIZc89VXryZ1TpIN4pS3h9XnFtLIfz?=
 =?us-ascii?Q?t/wCS7JjduL9Vp2nzlCyfRqMqdNtUEKwAU7SXxebtdB3/drTS3hZXLo+bU8N?=
 =?us-ascii?Q?TphsoOelKhkNHExgGi5EkirTVwWPnVh+41FKsS1Nhcp/KWjDl31b3a4lJcGM?=
 =?us-ascii?Q?hld7Ooz5MxQTmG64IdNEptvMPSiO76N6jHGdqNEAYZWxnwH2PEEJJhY3Z3h8?=
 =?us-ascii?Q?h5RsyVWlnqG5vZGOcd6JaxRoJbMKC8KWiVp/+KJ678T9ndvFWs2kIEACNHRE?=
 =?us-ascii?Q?nh90uxF1/kxyAnIPZeGyHusqcSx/JWmW5EUozA99BguiQxdDXNk8Jt9VrjHA?=
 =?us-ascii?Q?jVYg2ZMI3Za2yhOnH+qnsrMXdim9lvGD9Uj61K/JDrXUNny4x74u8gZLrGDg?=
 =?us-ascii?Q?rX8mtB4B6olu0koCRxlPocQkbGwwKA9njDEwU3zNP/gqC6pdWO7plSVqBSyC?=
 =?us-ascii?Q?/fHAuSeRKkbDy4s4j6b1U7KydTIGY5c9eRnQFZ4CyNyrq0Jm7T/5nA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CwRqKdLAKh4bH7IAD3tx00HFTaTrdAG09Uj96AfzAvMwHZpykxw8uu/hnXqR?=
 =?us-ascii?Q?2G4Sks7jOcRl9ViemwozvzhvvcIAeyLr4OZ3JoXAyct+sLo5vr+PWfdTJn1v?=
 =?us-ascii?Q?8epRM+13ch38jZttgEMi1Sp3xaDC9/+FFhZPjxCmiyJL3qVFQTFMjjFmwQ/H?=
 =?us-ascii?Q?R+mhh/Iy4w3IOxGfZ4FFYgZFRgJObPITU7noiOlCXMUUitJkQdc1oBLbbIlQ?=
 =?us-ascii?Q?UmCmwDxnb6fq2yQg0xQM7nfhvWP5MyIqfv2twfaI++RW/UDbVYkNWwwHa7KN?=
 =?us-ascii?Q?AFsEuD8tUFAZaenNifVg53OhshqISZlu7iYStP1UCmJm+1WHqeVuVhq2U83+?=
 =?us-ascii?Q?qABI8ysnU/kfkFsVYmFAUwKu6StRiFU/Qd7McTxOKJDMk/+LZdAW/uublXPN?=
 =?us-ascii?Q?8FDzdWa4ULBwQPfAbuu+DISRDV63RrOyuyJwMixJV2jv5VoQGnl+J2kvrGxL?=
 =?us-ascii?Q?utSLj8lyEDRegkK2OHUB3/zET79txu3yRiZw8GmPSGq1XdZyWRsNSPVXwaHv?=
 =?us-ascii?Q?511s8fj70dVQRipof23c5mZ/GXRykY6yz+u0RtBXT1HvRIxYgOkmIY/7VA5W?=
 =?us-ascii?Q?TYsRHshJMeoD5cocchg3LcDtHA7HvWfthYVkkLtQqGY1h1X/K3xNdT7Se+9v?=
 =?us-ascii?Q?w1h2V9l5jcwNs0n8lK6AjcXses/UEb6sKtpCytxD4SUoNcCXWZSESJOoC3qs?=
 =?us-ascii?Q?5ixEfDmH0LaddQSCVetQ/AAVW2IdL9jfYNgETTBkfLfDQwOLkvFqydFE44Ts?=
 =?us-ascii?Q?unFRX08i3aufK172Xc/+NKs6d94k3gH3XEOPvL7O8duHSMomfrIHvjGv3NRj?=
 =?us-ascii?Q?rE2kA039DI3TbB8q4mQ1o4V1pcsRXDUnJTAB14qWU6ovE3iibS6Y24fSX8V0?=
 =?us-ascii?Q?S6rkvsUO87cVtxtsU4kLmkt/EwF25iskRt1xEpCN1X2kKahwMoSnd05GpPmZ?=
 =?us-ascii?Q?HwFAZxcl5qsWGftAViO+ISJW27WCzKm56c7nUoIQJTdg1GdXzMD4xtpIoCV8?=
 =?us-ascii?Q?K4W0JVuSEvMjzVd6h99e+SQnHiLj5fvvHu7BJMMu9x1hMvd+FB7nCNCucZXd?=
 =?us-ascii?Q?7a71AHLKSNV4E4WUsskXo3NwRNyVSdqfKwthR2KalNsBy3Oi8q/JjENzsyIh?=
 =?us-ascii?Q?nFdhThS9UZ+N+afkxHYDCF18z+d0MzbmYMVitHHbvH/pmVjdtLHS/IZQO0pz?=
 =?us-ascii?Q?IAsw7cVA8L+2IkUehBuKoPDTAa/dgL9pbN4ku5VdvLh5wqcy0B8u+YBp9tBp?=
 =?us-ascii?Q?rxsexfrV/crLHJKzs142RULKwA284Vze+/f8XeHkgJ1gtVT6gdTS/W+sXO8t?=
 =?us-ascii?Q?i93Ukb4uTkgMjEb0u8189stXOw26Ib5UaY0siTA+7bKAl9AKPg8r5ZEas7iA?=
 =?us-ascii?Q?M9ynxX0BMi44DZMLMNSGBW+ZSbLeRVcj+p/JfxCWGw0zQRYWdm/jvSNCRV3y?=
 =?us-ascii?Q?SqvTBCGOjD04S2boHMJhGL7ic7abI7+q1Bg0kM23TJvUGQuSjL21ZNf10Xou?=
 =?us-ascii?Q?v8EbDyEocTgcczEPln1IkVLIxkF1OAxqXx8XweV9b+seQLnrVIVVud4nsQZw?=
 =?us-ascii?Q?3qdmL96byuhLsNpWEt1T+7vtzXVIrdX5/zbWSaEQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4931ae15-d32d-43c9-9d98-08dda76adafc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:32:33.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obR+BZn05OM/gEeifuPKLSTUUSXQLrzMoxS+gOnrfglYmkYAa3m3jW5yXpst2vjIl9TEFU6crTGVcJjJMjDRHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10803

On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> The CSI-2 receiver can be instantiated with up to four output channels.
> This is an integration-specific property, specify the number of
> instantiated channels through a new fsl,num-channels property. The
> property is optional, and defaults to 1 as only one channel is currently
> supported by drivers.
>
> The only known SoC to have more than one channel is the i.MX8MP. As the
> binding examples do not cover that SoC, don't update them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> index db4889bf881e..41ad5b84eaeb 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> @@ -68,6 +68,13 @@ properties:
>      default: 166000000
>      deprecated: true
>
> +  fsl,num-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of output channels
> +    minimum: 1
> +    maximum: 4
> +    default: 1
> +

Look like it is fixed value for each compabiable string, So it is not
suitable for adding new property. It should be in driver data of each
compatible strings.

I met similar case before. DT team generally don't agree on add such
property, unless there are two instances in the same chip, which have
difference channel number.

Frank

>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> --
> Regards,
>
> Laurent Pinchart
>

