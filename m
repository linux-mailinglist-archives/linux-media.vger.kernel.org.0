Return-Path: <linux-media+bounces-42696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5320B80C3E
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E683ACE66
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0292F49E4;
	Wed, 17 Sep 2025 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AuVSsEoz"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F2341343;
	Wed, 17 Sep 2025 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758124448; cv=fail; b=KC+C0FMdpyhXLiPnm0mKG7tW3uvyitZuoYiQwexa/3fR6/P7eaV/lDz9SJJobYbqzIs9ao1NwD4EBtI1h/q3U2EAFOSLdLSGPsxD14O0wF8/AAK8ZskgMq8r1wiecjAqxur9fczgX7MqL6rOQVrrDKskkn264iM13Ka/sT1YIzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758124448; c=relaxed/simple;
	bh=gcGPrJVU4H+Urv124Z3FwUYtk1bh8Zv6sFHHqyoxtzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bZjWwvRR8/UQ5uzq5qBPPu1FHvXqBw2fUu1v6gtZG0QTdnFIHTri4EAHPZWmiyplGLssAGOb85zN9zxgXMxkvQRTyKTHwzlJ6jDheBCShFNLa+gGvnNdMkGbgZR9KItTHDIZfx/np4FO0ICNKLojM+IRKdu8PWq5NVj6NSh5x9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AuVSsEoz; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCJvP+XEfafLrFtGSlkcwb87pBRJPo5gkL7bULRE9Acc7wTXlHmI5umkAu4TMkEV01smAEBOvDTlOtuT0MI5++9p1ayrHIu17rrHdNN2FnRww8wHwDK+vbbuSH5pHXd/kZFryH37ILN8oLMK0n6BsCSoTxBPiHTTIXODb0lxTU/Hy1Jh6t/WHideocP+5mE3OIeq84DZxEh5HHcqIatqjSbdW5rCzSxrGSpkjMUaXD/InoSwvRov/fJjMV09fKXx+gx0v2TNtNoxhsOHVxKpAbQJ74ZmovupD/MH8ry25S3ZQc6NrxC5AW0okXAn1xzcNSPqPAeMuV9SOpLYuzKtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzcIASX6MQvdQw/Z1fRytkXBMlH8XuDqlGIN6FANLEk=;
 b=ytUP+ssz0a+9XZ3KMirplrvOsXfBLiuV/UyJqqqu3P0R/0NQocRvAa8HxMvfaMYp0Q91M7GtkqsPbKzMvg8CMzE6nPXghTHM6ERMMn8nvdNVaxgss2UeGq+KoiDzaB87PgoqfLchqpw4ACm5f229JaDQeEcOi1rCpJVmWOrx78EbBLlAIsuTd9aCfXMFSF/LqDZZZS9zoG1LEcrfciLjRpdMLbqMzDZ68jeoEGGBEjISVVtnkYj/24fYdjkX1BsxiPx3BGYHSok13AMcno8JZZOwbzxOA278Bl/BrJnHTX38WgimEwx/YVpBnvZ199LI2Pea7zKP8g+OFked29uHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzcIASX6MQvdQw/Z1fRytkXBMlH8XuDqlGIN6FANLEk=;
 b=AuVSsEoz+dL69TAOGwizzxtKlvfa/JaQ9GTk4R7JWb5yNldGoBShQq4LxguZGnydSURv3VGDh5NYVTW+M3y6QECquIbdnMWrX/s5cx9E9NCk0C3P+JGKFF3NlBodcvnx6KVzxgbErzDxsnFjvlEL/sK+WN3X5xKuSvpkhkLzapFZ9lri1kNStOXWOJgB9m0AypD+Zf6i43+SdSDnyOtoCo4F7f2MQpHlf2TH0AC+y6QfmjhHldFVf437CiGzQuxwjzf/I7BuSZcO3dh/Fv6qqa0WTr5FqzWDHX0qC+CxoJm+1Ga6QsbTP4z8Dkbmp+ulZImXwD4p4wnixxwhdcVkXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11291.eurprd04.prod.outlook.com (2603:10a6:150:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 15:54:00 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 15:53:59 +0000
Date: Wed, 17 Sep 2025 11:53:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v6 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aMrZjcB4zDMw7s/G@lizhi-Precision-Tower-5810>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
 <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>
X-ClientProxiedBy: BYAPR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::21) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV4PR04MB11291:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e8b359-9b87-440a-e3dd-08ddf6026a99
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Rehgh52jRSI6pwfpXAUHn69rPhUWKmRmY+DoX/52qeR0mb8PUe+mBd34AsAZ?=
 =?us-ascii?Q?jfCvP++FVYUoGcpK4TEkBGHEghAh8OjZ5eNWXUU4MEWRgixRljLcz6b4tToI?=
 =?us-ascii?Q?c5dt5Nd8uklaAqW5uGKGAHRCAUcdg/dfECwGCdzGfAY6G8ZRTOcXFgOTqcmK?=
 =?us-ascii?Q?ZucGGiDq17oNv6tzF/p25ZgjKQs6SClvm6XAZQAsOlvFwQDbBWFt8PJY1mOd?=
 =?us-ascii?Q?oq2r2Y6gZu35TILnwg8Ke81dxgMn0ltCo5uu6CYYj0/3C9dapSxKq6kXIqux?=
 =?us-ascii?Q?kZyxwHrbinrXDXbgZzUrgsIyrixwpger97KcBZpn69iNFZtx/47lV5JNfWFH?=
 =?us-ascii?Q?kEcplLocIvuK/i8E/UjLNqNzb8HiETXCI1u0RVqCz/qm6hGqgpdutUwHTHuF?=
 =?us-ascii?Q?S5SXpLgyYezcIh3nQTH+/f0bCnoTKcxehxGcLAMAel6yVQSr7hPgz9VUAvZS?=
 =?us-ascii?Q?V8E6ECy677NsxQafytZmcneLXtioe7nnySgGs53j7GpYjfnRhi/QdtFge3ST?=
 =?us-ascii?Q?HwIN4cIDpLktqvWJb0ZqOMNh7a7WDUXmsAIzUPmmx0JjNpBSF9emOc3j6He3?=
 =?us-ascii?Q?khvsneIz7I5O+nh8oG6mA/JH2FqXJL+DaBpu+iYDYjjQ0GR09Ar1iKJbaR5L?=
 =?us-ascii?Q?0xWpazpGPhfwpBGLc/arx24/bnnCP2ToINyXbyU0pI9PKMEpHytTiTnmVzB+?=
 =?us-ascii?Q?7SFuFSzTtm/n8rSq6apy7lTeimoG4Ji96Y/AE1AfbhUZDPm3Cj6RjYKCFFXt?=
 =?us-ascii?Q?eNDCIlzR+ymd3LAIunYkLnvxi4M8AioQR9HwFAfo4RmBbpvWUpJFScryLYLH?=
 =?us-ascii?Q?ygb1K/o4VodQeNczyGxY+Zmbloh7NXpccfGwnYmfhV5JyBMQbQVOXJ0NRIDY?=
 =?us-ascii?Q?arLXvUYGf+uKjOjQ378VY7I6GVVLarwQUMgP/6mpPMsjwt1B1tQLRvrKKL4O?=
 =?us-ascii?Q?xJdzdnxqw7r+x9v4+lxuYz5ITNKreNx1AMxIFypFACx/uG3VXB/f+KWxGLjB?=
 =?us-ascii?Q?mrGVKYRpr9mS6Qrl/ZfK3NmNm7y8pltIwqFS2FvdxXCPaCsdIozWK2gyGuum?=
 =?us-ascii?Q?COwZZkcZnn2/50qJqrnTp7/XDUeoYUVPTFg5TDrg3RlKA3YTo0MHGc83jle6?=
 =?us-ascii?Q?b5Yf6IcZUKf1npiu8SjwOlN8SEqe4B8rETjaTAPgkDwuBaVjvdfwyLRSASVd?=
 =?us-ascii?Q?UJtkTg3eoaJWxV+xIAyLLIiV6+VDs7bs0YEbDyADkugIkkZbY+5Uq01lENPa?=
 =?us-ascii?Q?6czXcIIAfYxDQrbxiubOeVtrLR5ga9nsALQtkzFf6jxvzjWot7TplAcSfZtb?=
 =?us-ascii?Q?G8amw4/OuH1+BlSxzjNBhilFmK6hleI6c6n7rA+GLCNymLv/93KYv4CKbY04?=
 =?us-ascii?Q?JGpIjK96UeRrf62GztyfP4dTnlGahvXiPX9v0+fB/JuPfq9yOpBwBiZvaMUX?=
 =?us-ascii?Q?WyJsDxGxOEs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2g+rEPGFf7XWQvyV9+CbWV6Q/iTVjv7Sef2q4OyUeXm28cHJdNlOyGmVr9i0?=
 =?us-ascii?Q?6OsOlu1nIQ4jR8Yo8wOb4zfRTHe05EPeKnJpPzXG/ejGhR2eZpLeWuUX6DOG?=
 =?us-ascii?Q?N0yO8H9m535lMjEJBpvpuLNfVzlma3ot1yz9ytIEerZsVtGyBOjAIR2cnbYx?=
 =?us-ascii?Q?Mm/WUw9Knu1l7seUdEYFj1NqGX0hje1sAKo8K2cdHP0s9XA5rIpoetBX9Zg9?=
 =?us-ascii?Q?EzSBPDjCR3HX8JiLc21zPQlTgEbZdkn4iAwD8yh/VsXICmJXW8wpxL6zBguw?=
 =?us-ascii?Q?eLgImIhRV85Kp06dH6nklEpE1s0sETAbTE+2y1UjNP8LK9tnN3mdLxNDats8?=
 =?us-ascii?Q?CZ+28wV0e7baDFsYeMtuQwjHYgxk/o9/4IDaI+QdzRXQSLAQ77fAw+LZGNbV?=
 =?us-ascii?Q?fyFgQewDOYnVtyTq+P9Nj30dPJNISvP1h0ydl0pXiIvfby+V0Mv8uAogd+nA?=
 =?us-ascii?Q?TSdppq8Yn0JJXSppg39/+Pqqmpr1s5X5EYX7/aatbC4pB/zGbzq8gzh/sRxw?=
 =?us-ascii?Q?jf7NFV4CGDpw/ZLPlyvGj9Pj2MKtrP8kjkWG0ez7uFqVs1yfav0mQikArx6Z?=
 =?us-ascii?Q?zRP5MhDKAq3yTbp7sU37QXpCsvcOYYLN1qL1Stz62I+7AKpT3pQCn77cHBw0?=
 =?us-ascii?Q?Bjw8R85qKzXFgTErrfFWgJUCZKAnHi09LG0qzw4b2OiLqJaERYO4vfBVnJen?=
 =?us-ascii?Q?9mQx52Pm0LFBkB5//JDMCMSh13EzIBQCf5OmDskRJx8pAdm0H/y3m0K1QLiK?=
 =?us-ascii?Q?F8MkwaqSd5PHeAwED8093VcjIR+esQem46yCcgRUggngKxI1bpvYTxDND/jr?=
 =?us-ascii?Q?7fe5c5YeYF+tDD3r0maW/VgDrCLZMy1Jy76kOLMrcISgeJFSvXhg50lJ2H7U?=
 =?us-ascii?Q?ypGigjoIdiDJImCf8rsMrNtXTbtLAnEdyGey6MSKQ/XMVaN3xJjUJ4AGmFS/?=
 =?us-ascii?Q?pyLIf8L9NGiMQ6UxNN7oH45fHnkDpWkHMiaV1uyc6fo6RtA/eNuA7vAcqTwa?=
 =?us-ascii?Q?lwlnJONq4Sgrm+az1cW8ebYON8JZ8k2SGTghZdpugWFXk5qRlmjFbW45fpcN?=
 =?us-ascii?Q?XKktzS0623JmPTpqk9fUip8prTwRXJfRXggX/NpJyVyPRapuTBgLm3Lpcbck?=
 =?us-ascii?Q?Yo65nO3xqNfp9e+mSxaFxApsDf8cGtbr1wbW87J14Vq5n+7rQAYcBLzrKA3p?=
 =?us-ascii?Q?iUL3ruCkPDC/XzU+j0LK3y7GmUy+q8wzLS0do5ju+X8KqVhWZV6759QU+0gX?=
 =?us-ascii?Q?2Km32cDpa0542ksUfnOmxMuvjISJyFpjSn5t36mb0m4JH0SpCAja9vHizibn?=
 =?us-ascii?Q?J+Uo0N8AqvV8YYsUcYnpc+G3Wvf9lm74437Mgs2t+WlIpkvAq8uOU+4rGJWu?=
 =?us-ascii?Q?32EtZmCFNDdG+5it+DalSWCyRIcJyWCr7tZi2ipzESyXjB1Izf0FroPCw/pV?=
 =?us-ascii?Q?MYIQI8Acdkd8Pl+UedQqKimi65yK/YKNAEneazBxOJOaiWOi4Zvbqz/L3OHw?=
 =?us-ascii?Q?w6/6gasecqH0imsu6qAL4e9BRqMJEvAmLNXwU4TAWjaJavlAty97dX3D0pTC?=
 =?us-ascii?Q?6alRZzbepgQ8iZ0/E7VvFu7Hjqbz62gUqYW/K7/U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e8b359-9b87-440a-e3dd-08ddf6026a99
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:53:59.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3yQLGZTK9VhdmdX+ggC3o4+oaozjAxCBmN4SyL16oSDYJpkgYj994NPXsRn5lgjOvr68YpvEfaCzlXzuY/W+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11291

On Wed, Sep 17, 2025 at 04:14:50PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> clock as the input clock for its APB interface of Control and Status
> register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> same restriction for existing compatible.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

There are long discussion at previous verison.

For refer:
	https://lore.kernel.org/imx/20250903192142.GA10637@pendragon.ideasonboard.com/

	compatible string "fsl,imx8qxp-mipi-csi2", has clock A, B, C
        compatible string "fsl,imx8ulp-mipi-csi2", has clock A, B, C, D

	clock B is special one, driver need know clk-freqeuncy. Other
clocks just enable/disable.

	The program module is the same.

	It is not important about if fsl,imx8ulp-mipi-csi2 need fallback
to fsl,imx8qxp-mipi-csi2 since driver has to been updated, only one line
additional change.

	To keep simple and strangh forward, don't set fsl,imx8ulp-mipi-csi2
fallback to fsl,imx8qxp-mipi-csi2.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..da3978da1cab75292ada3f24837443f7f4ab6418 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
> +          - fsl,imx8ulp-mipi-csi2
>        - items:
>            - const: fsl,imx8qm-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2
> @@ -39,12 +40,16 @@ properties:
>                       clock that the RX DPHY receives.
>        - description: ui is the pixel clock (phy_ref up to 333Mhz).
>                       See the reference manual for details.
> +      - description: pclk is clock for csr APB interface.
> +    minItems: 3
>
>    clock-names:
>      items:
>        - const: core
>        - const: esc
>        - const: ui
> +      - const: pclk
> +    minItems: 3
>
>    power-domains:
>      maxItems: 1
> @@ -130,19 +135,51 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - fsl,imx8qxp-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-mipi-csi2
>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1
> -    else:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1
>          resets:
>            minItems: 3
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
>        required:
>          - fsl,mipi-phy-gpr
>
>
> --
> 2.34.1
>

