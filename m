Return-Path: <linux-media+bounces-40638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D00B2FFA6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D760567CCE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89B021CC43;
	Thu, 21 Aug 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JJtRUkAO"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2A0202F65;
	Thu, 21 Aug 2025 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792054; cv=fail; b=VU1yenNlldpb/4El/3qBOF06MpnFauaHtBJSTBbgRqenmrz/2qIGaXSwlCdmwaxrSqy8YbrFmP6rEjHRp0A9/gV1xeznbvq/4XGzIzP2AFaFHf1yoyzHCdIMtoKKK2igidzpDEs7q+T1lmss2ehjnhR19HnECoKdBqAuKlLCw1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792054; c=relaxed/simple;
	bh=29TRS10nH2qkDa4ItFgh05PW2RnB+W/aCGD4BwW18hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ndX28/TR+D6+aAQdB89jYfrgYzc3L3bXe4eAmmLIPJ0THNZWcDcRevudGMPYbewSjy6Xap3LZir84vqGja01mO7veiFoKW7GXo+AGNa7xhqTDv+ZiDPOk1iTCO0Qe4F0vh0cvivKBCTeM+pRobZynlqntQiPcqe8l+5ozNy/A+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JJtRUkAO; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9vyu3Vw/eOERsf9b236XizYr3m+8qUuufl5GOl2h6s5W8LwYR5A8QbXg3HP7eeK5yOx53bOkPuE241wQN9p4IfSX5JwOSvdaBhS8Qez0HfD182eqEDHIRXv4Bsnv1N9cMId34FSSCsYZ2XjOBBcpuNXBn2K9cb7bsCEnojzju3l+HQ/e3mSJLN2PjxMq/KWxQafZMsJHF+DjX160VuwouTCx1RxfEjkcMUaMz3vhEkzSU3WpTlNv4rBkNjvLhYpTp6XUuDkQiSgEhzr7hf2c4J9EXbqAuFbR8vmdZBFPsnHE8YOeD8u9Tg9CYkGbxBEJemO9Sw5TtEhgJ//uUF0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uPLqxvV5Jk2wh9pfwGyBs1AVkDoVcGNxGvTBExDgvs=;
 b=fk4chymOryRCl87NwG00UnP5LKgcolUieh56gSSWjX9Fb/A18bCt/E0VXhpQ0U/yyWbe9Sb7e1ekC6G0LRDMPncbjU96tI3Byo5WhKg49lgiaRYfBJ7NogKAX6v47ZPtRIRR4uiugvxuQjh+GrTdAFnd7Dg8rGAL7hg6FSxnjJRfQuVzjqqVX1D7uCWxH8q+6mbIpU2BgneV/6eX1B5cuuMQStiMOXli5fZAFUKropvNhQqsRpFewGJORjzwxWRYh48PcbWpeQNlod4qT4GTzto/gdx6UM8EzFaL2ZbidqF2ae0RkT4GHt32N+eE+GbRNFdnGuj30qTu7syeTLXOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uPLqxvV5Jk2wh9pfwGyBs1AVkDoVcGNxGvTBExDgvs=;
 b=JJtRUkAOPj1c+OS4CSVVmhJH6geSHsAuKqQ8d6TE8EdWzozNwJw5kycon5qUeIgERZKRnfQQr1cbLPzXJKbDNZPxiLeetazOgAggdoRnCVWS4gLvlcT4V8k4JWVpTcqLlluYkk5h/+WfnwXzst3TTnNyVlLNVAMRRUjTNwFxqhqRNiSf4d/1FS6LN+iwC2L41WSR1zyWGSXwdk+JI+I2EMonIM6NsZfI7pmeR6XDaXxwxbXiMgPxM23WzC4XsNCwPsVy/x5qzLIzyYKQqNMz9O6gzmHZMfcP0TSk+V9jP3EVQqpwLtZLnACT6PBxn1VWhYPU8iyTl2CKlMqsbGGEFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU4PR04MB11029.eurprd04.prod.outlook.com (2603:10a6:10:590::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 16:00:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 16:00:49 +0000
Date: Thu, 21 Aug 2025 12:00:39 -0400
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
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mp: Specify the number of
 channels for CSI-2 receivers
Message-ID: <aKdCp9INuUeQVFbV@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU4PR04MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: 33280424-e2ea-49b4-7d42-08dde0cbe54e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?uDbj64vIUBBtKnyiOFrnW8fNgwpmc+hXpOtteo7qtV8FrwhzsDJ/nXX5mc43?=
 =?us-ascii?Q?PZSOQoscQHI+8ZrqMq0nJBMsNlfvuOYUu6hmhxsLXC1/kU9mgkuTTf1xXAlx?=
 =?us-ascii?Q?Yn8H/tRO9P5r6fSi/oJ4IXMXVPmKgKpyCuRurRbvzpmo8EZZzjfGQCAWy5/t?=
 =?us-ascii?Q?mIw0A6heRGjUmD/MNZrAScHtWwFnrlExaEd7TDlck/LTRyEqgtNaHH0fXHjl?=
 =?us-ascii?Q?OjZ58jvehPbhUwq0ysSSBppa1SM8zhI1tPkvAvVoK0n89Y3TXI+evSolYErX?=
 =?us-ascii?Q?i5idJvKDApUkU4StQmISb/sAAuMgRVprvvzku63l98dVvEMcMQ2Q12Go3rlF?=
 =?us-ascii?Q?JvKd0KRfh9C8ciSmPrzvlWTIIUa37UONouPXiqi4cd177eerEhbTyIH8xJb0?=
 =?us-ascii?Q?zh0rWYyylKyeOT/QfE4BNRAV6zHhYvKd/MIxmFusRXfHvBNdcxN2HemhQJZt?=
 =?us-ascii?Q?YG/ifqJdCVFcuYA4F5J4h+ag6YgjuPKwN3tafp6JlWg6KDRtitqLIFfl6kR8?=
 =?us-ascii?Q?eQeig6fb74j1DjeT84YwAL1IJdFXFFZVbeQztjyJvKzJyICDkPFolq5LgjvY?=
 =?us-ascii?Q?QZ2uqk6M9Xw55kwZE9s1bBOboDRwIozdKyz/6QUfg7ny5ucdQmRX4GXcMGbA?=
 =?us-ascii?Q?iK8PvwUsQDfgq/ry1JRMUgcaC+iGw5eE0oK29T2o+avv7nNP90z7uaCitxLz?=
 =?us-ascii?Q?rQR2mInaGTtz2OVhKuKVv4xCc3eBl302ffbMuEYjd1EE9wEmJIQsXD+ZLnHF?=
 =?us-ascii?Q?KWRo+g8QEz2cmZo7nUPogbeSLe79zpUmvemc8FZjwbVPTwc4rH2VUmS90KBH?=
 =?us-ascii?Q?hJhuQEi+pQpACoiF1pUROqSBA8RhE2yPLu+j17eEwLBq6Vy5uhEEWx++skwi?=
 =?us-ascii?Q?ajmyW1qu+jFo1sH6q3PBhLbmctQy0Qov8zRj3dpnzi7OMPR1OObvpqBzkNEF?=
 =?us-ascii?Q?R7HxSXxnEk2nO83M/oH9jo2y4hWRrx9LOeyG8ZGQeQ9X/eilgQT5W5PYsPR6?=
 =?us-ascii?Q?oWCr6oETspFcK3W1fgdd7inGFPNskYkbhYiRziKe6VPIgJ/KcclWhxy5IrQy?=
 =?us-ascii?Q?8hhiMYz8GrQH0+kNKr+zonEMyhuouZi7DVkeA2c/93PhENE5AdUZQrLvyPID?=
 =?us-ascii?Q?+jNzaPYRxocUirt89nwttLRg19o6YfLAhJJ3bEGpU8D1ShlsVLKD2RJkC/f/?=
 =?us-ascii?Q?ppnvK2TVsSLEO2NyMExNNWSBVpSiqlb6IdYqIbUb9o7zCNrbqQ8ZOytBCkoW?=
 =?us-ascii?Q?VVq+F3zpsachhJtCCickbdTZxDvzLBUHLEHhSxxe1toROB4JlxTkU+wj1GH9?=
 =?us-ascii?Q?MhDY0EcwAc7Apzx036bk6XsPkoX5uvqiThqaXZmsBXtBX7053ufAvX42i8T7?=
 =?us-ascii?Q?/o905ByzftyxCLaEezuK8W7hOAFe/4Ddl156et0KR1JRWgiPYm+lYyCPrPLM?=
 =?us-ascii?Q?te+7bUishpqs3J+nYZLFGAVT34T+QPNzKMNG+fW4aGw1dLYomt2Nvw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lxu9ybFYhNEdAeS4oayzHEFm/Ym0MQe9bauURSZ7jnmLev+zXHOOmsiY2Nym?=
 =?us-ascii?Q?dkoFtbWJeElQxamTH/XA52DlU2wHIBnqkT3DOd912cxSAQkO8Zir35zoH8n6?=
 =?us-ascii?Q?+10m3a3BxHt0bPPMIW2Qc9N55N84CdtWUtsZbZMNJ85t/W43GHby5uJF9ck7?=
 =?us-ascii?Q?/4sKOxXGM2KNjOq7HLZY8Vo/F4jf2tLIMt/Zb3HwdJ202dipBeid7lyiiSS0?=
 =?us-ascii?Q?nR+q2/1JXuPtVOjj5dBJJ0zgmaQnhiLK0vcVuGnRANy7pmyNJkGGkNiNiMDC?=
 =?us-ascii?Q?X7OVER5ZJ3v/15Nt3+04MKznvY6Hyph6fcbiUCMS88emMrggV7O4/4zrhBHo?=
 =?us-ascii?Q?11GwILcA/SxpedSV3QzqTAFGs5cu+YkhqOqa8rm7T7NhVvCQt1hcPBoUQ2J9?=
 =?us-ascii?Q?N1lbcAi1mG62EplyJ1gWlyr2OHuJHeXAzCzziXQjA2Q2XFPnCW0gUfjshduF?=
 =?us-ascii?Q?cRXE8vdtsv0THUrIsEBych6caqAm8/ua+mVxijufV8b7Qh0t1r+FvXOTicky?=
 =?us-ascii?Q?sUTcfI2Oz3Pc1fdjK3qq8/3LxGgkvBNL9u46EVKneoTvVSuKys+LWEFHGGv6?=
 =?us-ascii?Q?OWHqs43OQhJTauaLGCsVAuFbjIpjwCkYSmvWcZRyVlTAjqkREra/LcT4OQ6D?=
 =?us-ascii?Q?P/SxJ5KtnOz795YralLhxEv+xo/ASyp9hOcpwUwxC163ld3449qI48sRiiEC?=
 =?us-ascii?Q?BIU0XKGcNtsGer+VMDVmrG/nvsEYP6kVChLMjjQUdHycsjgQhXYol/VHtlBK?=
 =?us-ascii?Q?eGd91WiW7VuL5MnMPcNWNeOT6RpP4nYtiMIH3HiLEvYPEcBNZPoKKz+2joa9?=
 =?us-ascii?Q?BiTSUivlQBiky4nFOTlBShQ/8Bi86jY5k3LViErfqsFeSd1Wwr8BBFI48Kti?=
 =?us-ascii?Q?YtcB+5vkNadtwTaVk9Q2P0ftwDPSTCOs5+TWL2bvrWXqehYKrD+2hzwDEuP2?=
 =?us-ascii?Q?eT5OA7EPnUR02/0OLZYcLr6tB+8kirFyHZs4bjp8ovW/aUPJf3mcgnt5n8Cp?=
 =?us-ascii?Q?fVVkzXTOBkQw1Oi+JsDujkTuzS7NY5f3PRJOvz3A5S1VX6FqY1CUN4gT0u36?=
 =?us-ascii?Q?HHKqIbGMzKkfS1UlUBPJ94tqMIDw81RlwP4ZLDlAvEAyYwnbG9wa/HkwP6Ni?=
 =?us-ascii?Q?Ta7UvoVcZfutJeWrb7vdOK3GofkqFOIx+R6Jk0c/htsXYnE1ZWotzCzwoS+g?=
 =?us-ascii?Q?No36/6ZYyjTRGpoj7EVnj2z2YbOWY4467lVK8AQsZ1+jG3F0dJlDhmcj8KId?=
 =?us-ascii?Q?X7jkaOIk4I4MuCd4RryQ9QK4nwVtUfIukHWIRTALQfrjIpqvX5kqFOnCdAU0?=
 =?us-ascii?Q?5a1JblNCMmIfp19JNQqKiiD+NFHmQJ8lTFVM8wNXBhb8cVkINr/tZs4OdZBu?=
 =?us-ascii?Q?pvENG2DzfAGUvAp/4ygSbNeguoMzDqUxLG+hQq3mBgk8EfmQcsaAm2aut9zh?=
 =?us-ascii?Q?5i6VKjidfKDYNITJmov9n2CdgX/tCqZFwtpy5UqIQPiq0k89PpgFtVQE8I8u?=
 =?us-ascii?Q?lxoZXLpK9q6y1kKMkdhifD5O97NbeO/nlaygVlOQH7EZRf8prsblDOFQ1zDK?=
 =?us-ascii?Q?3yPgjWqyI5Tj1a6eq4sWMI+SjqpININBMX221vyr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33280424-e2ea-49b4-7d42-08dde0cbe54e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 16:00:48.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQvnRpM+v8JNEzqPQuDG48tLh+7GW6evtQ8SxsBlmBGzC/M2BLZKoqVF+ZT8pFIBgpMtDM04jCfXd+eHf54Jiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11029

On Thu, Aug 21, 2025 at 03:09:44AM +0300, Laurent Pinchart wrote:
> The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> in the device tree, to enable support for more than one channel in
> drivers.

dt descript hardware, not driver

Specify this to reflect actual hardware feature.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index bb24dba7338e..1e52840078df 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> +				fsl,num-channels = <3>;
>  				status = "disabled";
>
>  				ports {
> @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> +				fsl,num-channels = <3>;
>  				status = "disabled";
>
>  				ports {
> --
> Regards,
>
> Laurent Pinchart
>

