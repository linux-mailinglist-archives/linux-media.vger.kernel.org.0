Return-Path: <linux-media+bounces-36045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EC7AEA971
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 00:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 498BF4E1CBD
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 22:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6163A266B67;
	Thu, 26 Jun 2025 22:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hYuMtVu4"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013038.outbound.protection.outlook.com [40.107.159.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A025FA1D;
	Thu, 26 Jun 2025 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750976069; cv=fail; b=oqkezBb7WjVI8ByUCEnvnlBBNEjETWHiWiFIEvsrgqCBWO+DoXmLf80sB8gyXYRLzbWGFeFSn3Xu8jW76TWnSCiNsjq3wIQ03FH9n/tabWbIMKMm03pq6q7EuKuK8PtR4KtspkzV0UaVtrwV+AUMdDVEn8b1h/8RWpvfOSHkEbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750976069; c=relaxed/simple;
	bh=pcy0e1KiTBYCYTi4aCMExs/KF0tOkHQ4dkrORXa6Tyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=us9qKOY65ujfQZxlLcxRtuG5OOvBK7I0u+FgksTRpr9m55GJTBmiWCxgmqP3Zxh0zc4jBK3At2vEbHcAi5sPFl82wspV+lTG9jQRcCphQn3Hzjv8d25tj4LWy8i+wp/bKRq7VO4AgUQdeqS8soon0zmKBdIYYcXXmx9of+Qrv70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hYuMtVu4; arc=fail smtp.client-ip=40.107.159.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqyjKEvYBtEVsCVLekGy12fDLeA8OK6UJNaeW1vIwIOAygbkQRujsNTN5le6KNDZptf5jqxqFzpJWx6hQVKnkAa43DILyT5btNOr5cU/6By17Zx8e9Kw8+zTjqjXrbBRc4aIAL0kNeof0yrg6BFaVJLZdxOabNG6SkNkeALyfJk0jgVyuT34Qerl+HtHY+SocvE1vDVOPRFizPvSowve08EciAewexo9OzXuN3U4pwdNZtm8PB8ZnunQWXc6Tfe9mNaoGf/Ptj+mwmcbuIjF+jGdUWfzghUhhNH9lotCMKPrO61hBKlrSvH9OLTGJYlH9HdUB5+0vBj+AO0niLWEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abogjpXNPH35SKYiMdLyHxbVHxUuRF+95YfUhG/J9+E=;
 b=CDs17EcMoOiar7EKBW1rUeBAJnbWnH/Jlh2I/E8CFFbwfCHmqF5k1aQZuAomwkxmRieUy+wXgGNldlX7vmhPfJeC5AzjmPyJ260D913BykTGhqNqbz+wTPvuqo+bQ52O2cHq+3VdzIwB02TseODxxceLmjwcjGTG1MSTGfVlcvQKVexVfi3S87h4+VjnTpzf045CNm5f+KvMUYzH+iw3UvUzBWAy5+EhB9O+GKvrAPNjuAHiQTEHIyeJp98hwFKYllcCmrqlofR1fB5FNzrMWckbtyma30GIKT9skw8HIlW9eHIgMq/6LQ2MgToSTvlEe3I+R/D3Vh1MMkdFIRUk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abogjpXNPH35SKYiMdLyHxbVHxUuRF+95YfUhG/J9+E=;
 b=hYuMtVu4DjZ3PLySaGH7RR0Gf9a5Npsg3Uds6JHjce+Dh6X3fK8uZh9n68gvuj/J+4+H8+nL1yCcJ63YhNa8ZyVrCiMgWgaYUPjFt97eN3OY6IIzoM1tY1sUxlDs+X1rpAfiUP1H8lRoUbFVtM6ZVoTxF0qLczQSAF58BVLkQ/VULw9HM2yFruH2+3eQGKwLTLKKrwaJvBFdlLIBAdjAMUk5rFcr0T/rgpSuvN5TA0EihnWqAP2weYWxK1CBRbF55N0N91TN8Bt/jy3bLS/xJjDsVbOVHUPpV4sPJdnqbiYbUfndf+KmkeTDay2qVQ8Wc37Q7HAKVpdpoLizWX4j7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9747.eurprd04.prod.outlook.com (2603:10a6:10:4b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 22:14:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 22:14:20 +0000
Date: Thu, 26 Jun 2025 18:14:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add bindings for AP1302
 and AR0144
Message-ID: <aF3GN98uCrDrw7Lc@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
 <20250623224109.GD15951@pendragon.ideasonboard.com>
 <aFrxSOapkQ/QIXT8@lizhi-Precision-Tower-5810>
 <20250624185404.GD20757@pendragon.ideasonboard.com>
 <aFsAY1Nz2bIFH+t+@lizhi-Precision-Tower-5810>
 <20250626124002.GJ8738@pendragon.ideasonboard.com>
 <aF1uKaJyxFMx48HN@lizhi-Precision-Tower-5810>
 <20250626190733.GB30016@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626190733.GB30016@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d35388-2786-485b-d7c7-08ddb4fecc5a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?UozdBBoZszygJniaH8450UmdTrNElE6T/Nh3XlIhaVHq5AhMpRYdyEQC6TQ3?=
 =?us-ascii?Q?YsXBfouFp4hHh1xUaG46T81Ee7VzT13VrO3tMNBrniKXuwnEufRGlWuzOs9F?=
 =?us-ascii?Q?B3975WbJL1HeZHyVzcvy6Dbepi/1fnxBOMEsOwRy5Nh1ViuJgjzt1E3g8bhi?=
 =?us-ascii?Q?gSIZtmRgKQiXNPR5wcTdmxzj1sIrKNPpfaWYJh0cV6MI4/d1uNIVAGRCGqmx?=
 =?us-ascii?Q?4DBU47PXaFCPZW+BtbBnDRLcOnlqnXKrVJlDYDF1R8gNDrCiUzjGUY5nA69o?=
 =?us-ascii?Q?zD2PHgD7DwOWM0qmWS8c6AE9/QJf6+Pb/6fufGarIa7aWO8E9jm0VrGo4m9h?=
 =?us-ascii?Q?NCVcVsqcWzcNG5gDCSLbGpZT22TwL6g2Uj2xzPhyc7MzRRKjaeVdabqEqcqF?=
 =?us-ascii?Q?egnqM9d7jcNe7/0O7WTWfT7o+gezkYtuDDF++TWlWZPKY4oxoXLIfFXWuAkB?=
 =?us-ascii?Q?bKG5G3cNokcjkqSn+zVeOZYxj9y1NqifPoYku2nVVVE92FVRdWZ3PPIiykuS?=
 =?us-ascii?Q?gTd2B5UzOmiZQ+7FlqtxxGawpQC+NsRWoeypwcvmeJH7YVEWY7THNyGHt4Y/?=
 =?us-ascii?Q?hc0goE6kuBESC14FdUivJMqvSY4laFmPhA1+m7icQb+jo4np13aPwYKMBMVD?=
 =?us-ascii?Q?+N6qQNnFquHjfbHFLwhX5GiGrzCBm0zhKt2dFQngwYKaV4eCWrt8gA0nF55V?=
 =?us-ascii?Q?ENTVG4Gap1xBG6Nj3Nn9OCK1vMlt6Aa42NWBO5jpuNakGS89+UvnGQRk55qa?=
 =?us-ascii?Q?4nUdgm+Cp/tzdbHvpiZfyccxabq89yVx8IiQm4SV1Ql0Qzu6i9d0mZvlQjit?=
 =?us-ascii?Q?ydBUZrpOQsFCc+830m0xl1exe+z2XnE+P9MevYZJ3jkqaBaQpd3pATGBL/I1?=
 =?us-ascii?Q?TRkFSM0pQEplZXu13juqYwDQYVWLONLmojNvpkh9RMB793KtqnDy5R70/Be5?=
 =?us-ascii?Q?AP2kl210Ngt7sgfhk8abvWgXE5oJyr8PxTd40xcTdrgBlptvrDSeqJLOkv++?=
 =?us-ascii?Q?V0ZPZNuiNMgcB6u4wSmrS8AGJPoZlPdHqtY8PcdyecnVKMnDWPvPnn9AJ8dk?=
 =?us-ascii?Q?x13OAJFAw0uDwX3G3ZFFe6vK3VuNGKx9kBMCiWKaabTPMJy4MXnxKHhyiASh?=
 =?us-ascii?Q?3DJad6ikrABeH47xUis8ieDGu8UChobZgtxpxzvi/NuutGrRziGKr6p4Xubu?=
 =?us-ascii?Q?xdVJIyoHZJcjC/c1NbN14qm8s+wZPHdhY7/DmKhCNfZ7wskZGUjTCoP6x+3L?=
 =?us-ascii?Q?+V9N5c7yDGzqz9HnBrfoTzwvg9qHayNvt02zJ/CttEmGcLY4VvWvIBJnsDR0?=
 =?us-ascii?Q?ZimSvoAqlx9LJxqUG8OvMn4a3xJalXoUq/KslRNOOzg7KI+QZ6GuXPAnQPUu?=
 =?us-ascii?Q?7x/Nj/BOJj9sgF8MH+1AtD73VO2oh1CWa2MuMzozVVsA/4sQtSNvG/IvViue?=
 =?us-ascii?Q?J+VJ+IYpwGosJBXFN8c14py4D6DaGOdt?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BUe7eJ/AIdu1g6mo4N4HuJ1my1GmexB/TpzNOIQ+InBHo2+3goYvGpOQNk4m?=
 =?us-ascii?Q?R8QJ2wFTeJPAwuKaJh0ReEfLTp7AAxzQQ2eqV09Xq0y9Ok4+vvOR5i0jNTP4?=
 =?us-ascii?Q?AmkWDzMG+13sI6/BydBjk8jrEVNZkMnbpJd87DSaLCX1K3KqNS8L/g9pefDV?=
 =?us-ascii?Q?NR4Wu/aFVgHyWRxpRh0oChSNhmY4e44VEtUtAlugF9PuZaEMf77qAj7QTR8n?=
 =?us-ascii?Q?uCkFN1eUQznFezB9OCWpbGT9K1pDmjNCr4FVTLV9jSSUs7KhhCwHAwT8+Kmq?=
 =?us-ascii?Q?YcTSzm/NIPrnrNm7O9i8UZVtCczJkI4WrftSGGWRcifOO5tXFmOKT4FLmINU?=
 =?us-ascii?Q?5oVb3WwlBnRRbtf3Hv2T/8KOV4qyCAZDliaDlPfGQvupu9TiYBy+5YejNOW0?=
 =?us-ascii?Q?0XHy0rg6y3WudyIm47+2XuI/9Kqp0U8Bp7hMy4QBjxLdk88/QLlPPmafcvbK?=
 =?us-ascii?Q?6wvoT3zKHPvbWXLvmt0p6l4iq4E5aW0EOaBB6orBlePnaNd9/zaHFKF2hASj?=
 =?us-ascii?Q?zNUrNFMAhUh0fjD5FTBFeA1P7JrlC4jptWlc74dBKuBbvIZUYpH4xWzm6yhP?=
 =?us-ascii?Q?sqtuTByPKwNwXrY8j86pxGjK3nybg7oQX/GGuKWy5oWGvSBkhMofD/agS0Zg?=
 =?us-ascii?Q?Ak7x47vUWYz19KRsin5flM0TNbrAJ9qR4zpNQiIzpc5ysldK6Amb3w13YAUb?=
 =?us-ascii?Q?UIiaDKqvisdmV7aMShfEYIo0En3kFFYG1bVJwrPtp14WhVaYRROSq8+daXQK?=
 =?us-ascii?Q?debwXw94r16SKC3zlDoS9ZAe56UfxrHrtMg/xdf9c5eZNJlA3jjJ3HtlPSk2?=
 =?us-ascii?Q?R+I/of0cZNhKhlWTbE4+P7ID356c7xs2Qm8xMAKZyhnfh7QZ69y5bMAn4X2c?=
 =?us-ascii?Q?LZ10vFF+RgK1ueMYSU2yul7mhjp2wfVnES0WHLDoSw5dsJRgiJA1c7HwVI8t?=
 =?us-ascii?Q?39eNf/Ritea/0XrR+6g/DJf8Nbk/zvTsp2210vYADRsx+e/SGEF9fKkgSrMZ?=
 =?us-ascii?Q?90nOKjX90CwoifkBisuUDxQgvrpZtQ06wUTF1zjGoYnyG+NgbFkiS6gyfBgJ?=
 =?us-ascii?Q?NyOS4sRjRRQ2eeUF3RBPI/FE/RCMYLWQ38o2rMi50X99WghkFOYpX3FbdQxC?=
 =?us-ascii?Q?hpYZ0CyY+1W5S2B/r6/N8E9QGi3Y2n/w7NhAPn3Vk51SiG1TEyOFtaaXRas5?=
 =?us-ascii?Q?YUOvjedb8brIcRnT9L/hcSUohd3EJWJtvHQ5SNMJsb1BHdMDd7rKrJJiDffh?=
 =?us-ascii?Q?qZJkCZDaoHw7G9A1FKSRyycQFxhybfPlKO2NVQpOyEhz7p6+v+nh0lCcE1pA?=
 =?us-ascii?Q?35OZ8gyJGW76kcly3osyl13/1SANCxKsXcNSeZ0eN/8FMFPFZgwo+JmbwGOH?=
 =?us-ascii?Q?2FjLXGCsXbpfBBiEOV632RASzIjvlbV7DHSIP65/SBA9n43I1DBC3cQAGrxj?=
 =?us-ascii?Q?YzLLMoGVifK8Z6zEB/ucC2FRfnt7u7ItUPbMVEW2pervZfLLsOohAImQfClP?=
 =?us-ascii?Q?HiBS7KEiFgNPsrplEYxP9ZxiKacGSxd+2kUsrsnI4yCIK6AyZ8rRpdeqNJ7X?=
 =?us-ascii?Q?m8ig66L3cgDXxBm3xic=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d35388-2786-485b-d7c7-08ddb4fecc5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:14:20.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpTgQFiejwMJbwYKIO7Can4FN28U3irbeqYnvVQRpc8oQt8GYzF7GaUvzddJCC2TuuVFqTFfFcBBgxjlGjwntg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9747

On Thu, Jun 26, 2025 at 10:07:33PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 26, 2025 at 11:58:33AM -0400, Frank Li wrote:
> > On Thu, Jun 26, 2025 at 03:40:02PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jun 24, 2025 at 03:45:39PM -0400, Frank Li wrote:
> > > > On Tue, Jun 24, 2025 at 09:54:04PM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Jun 24, 2025 at 02:41:12PM -0400, Frank Li wrote:
> > > > > > On Tue, Jun 24, 2025 at 01:41:09AM +0300, Laurent Pinchart wrote:
> > > > > > > On Mon, Jun 23, 2025 at 03:17:37PM -0400, Frank Li wrote:
> > > > > > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > > >
> > > > > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> > > > > > > > connect RAW sensors (AR0144).
> > > > > > > >
> > > > > > > > Add corresponding DT bindings.
> > > > > > > >
> > > > > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > > ---
> > > > > > > > Previous try:
> > > > > > > > https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> > > > > > > >
> > > > > > > > Change in v3:
> > > > > > > > - Move sensors under ports
> > > > > > > > - use compatible string to indentify connected raw sensors
> > > > > > > > - Add onnn,ar0144.yaml
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
> > > > > > > >  .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
> > > > > > > >  MAINTAINERS                                        |   9 ++
> > > > > > > >  3 files changed, 235 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..6b745dcf3fd3f
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > > > @@ -0,0 +1,151 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > > > > > +
> > > > > > > > +description:
> > > > > > > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > > > > > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > > > > > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > > > > > > +  Frames are output side by side or on two virtual channels.
> > > > > > > > +
> > > > > > > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > > > > > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > > > > > > +  from the host.
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: onnn,ap1302
> > > > > > > > +
> > > > > > > > +  reg:
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  clocks:
> > > > > > > > +    items:
> > > > > > > > +      - description:
> > > > > > > > +          Reference to the CLK clock.
> > > > > > > > +
> > > > > > > > +  reset-gpios:
> > > > > > > > +    items:
> > > > > > > > +      - description:
> > > > > > > > +          Reference to the GPIO connected to the RST pin (active low).
> > > > > > > > +
> > > > > > > > +  standby-gpios:
> > > > > > > > +    items:
> > > > > > > > +      - description:
> > > > > > > > +          Reference to the GPIO connected to the STANDBY pin (active high).
> > > > > > > > +
> > > > > > > > +  enable-gpios:
> > > > > > > > +    items:
> > > > > > > > +      - description:
> > > > > > > > +          Reference to the GPIO connected to the EN pin (active high).
> > > > > > > > +
> > > > > > > > +  dvdd-supply: true
> > > > > > > > +
> > > > > > > > +  hmisc-supply: true
> > > > > > > > +
> > > > > > > > +  smisc-supply: true
> > > > > > > > +
> > > > > > > > +  ports:
> > > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > > +    unevaluatedProperties: false
> > > > > > > > +
> > > > > > > > +    patternProperties:
> > > > > > > > +      "^port@[01]":
> > > > > > > > +        description:
> > > > > > > > +          Sensors connected to the first and second input, if no sensor
> > > > > > > > +          connect, isp generate test pattern. The compatible string under
> > > > > > > > +          port@0 and port@1 have to be the same.
> > > > > > > > +
> > > > > > > > +        allOf:
> > > > > > > > +          - $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > +          - $ref: onnn,ar0144.yaml
> > > > > > >
> > > > > > > You can't do that, that's plain wrong, sorry. There are issue raised in
> > > > > > > the review of v2, please try to understand the problem and propose a
> > > > > > > solution there. This is not what we need.
> > > > > >
> > > > > > After review previous thread, Rob suggest use compatible string instead
> > > > > > vendor specific onnn,model property. I also think Rob's suggest is good
> > > > > > because compatible already descript the raw sensor model, needn't involve
> > > > > > new property for it and we can reuse other property like xxx-supply.
> > > > > >
> > > > > > Your concern is that port0 and port1 have to be the same. Rob suggest check
> > > > > > at the code to make sure both are the same.
> > > > > >
> > > > > > I think Rob may have method to add restriction at binding doc to make dts
> > > > > > have the same compatble string.
> > > > > >
> > > > > > Anything what I misssed?
> > > > >
> > > > > The discussion died out in that thread, I didn't have time to reply
> > > > > right away, and then the mails got buried in my inbox. My bad.
> > > > >
> > > > > The sensor node does not describe a device in the traditional DT sense,
> > > > > as the AP1302 completely hides the sensor from the host.
> > > >
> > > > Yes, but still need some informations like xxx-supply
> > >
> > > That's right, DT needs to provide information to describe how the sensor
> > > is controlled by the AP1302.
> > >
> > > > > The DT node,
> > > > > and its properties, need to be interpreted in the context of the AP1302
> > > > > DT binding. Use a "compatible" property, beside duplicating a value and
> > > > > introducing room for mistakes, is misleading, as "compatible" implies
> > > > > that the node is meant to go through the standard matching procedure
> > > > > with drivers. Sure, we could use a "compatible" property without letting
> > > > > the operating system match it with drivers, but it would still be
> > > > > misleading. I don't see any advantage in using "compatible".
> > > >
> > > > According to what I worked with Rob, DT don't care how driver probe device
> > > > driver, and what they most care is how hardware components connected.
> > > >
> > > > Use "compatible"'s benefit is if sensor direct connect to Soc or other ISP,
> > > > needn't add new property. improve reusability.
> > >
> > > I don't see how it improves reusability, no. There is no generic code
> > > that will parse the "compatible" property for a sensor behind the
> > > AP1302.
> >
> > - reuse one yaml to do dtb check. For example, new vddio-supply for ar0144
> > added. Needn't add two places, one for standalone and the other for connect
> > to ISP.
>
> But you need different properties when connecting the sensor to the SoC
> or to the external ISP.
>
> > - use of_device_is_compatible(). Anyway need proptery to identify connected
> > module. Assume we use 'module'. The property name 'module' itself is
> > equivalence to 'compatible'.  But whole DT schema is base on 'compatible'
> > to match relatied yaml file. If use 'module' here, have to dupicate all
> > property restriction at two place.
>
> Same comment as above. When connected to the SoC, the AR0144 will have a
> set of mandatory properties. When connected to the AP1302, the set of
> mandatory properties is different. This just can't work as-is. The
> AR0144 is an I2C device, and its DT bindings are meant for a DT node
> instantiated as an I2C device, as a child of an I2C controller. When
> connected to the external ISP the situation is different.

There are many sensor have I2C and SPI, for example
Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml

recently qca,qca7000 have uart and spi interface.
https://lore.kernel.org/imx/20250618184417.2169745-1-Frank.Li@nxp.com/

There are also two proptery set, like spi-max-frequency is never used
at uart.

at this case use 'reg' check if under uart and spi, but I am not sure how
to distringiush it at this case.
https://lore.kernel.org/imx/d0b13867-9aa4-4fb1-8492-0cc58e92c61d@kernel.org/


>
> >   If use module here, it may face fallback problem. If new module, ar0145.
> > we have to update binding, code and dts. If use compatible string, just
> > need update binding and dts.
> >
> >  'compatible's problem is that many people may miss-leading need a driver
> > to match it.
>
> "compatible" means *software*-compatible.

It may need more interpretion by rob.

>
> > > > > Regardless, you should *not* reference the ar0144.yaml. A DT binding for
> > > > > the AR0144 (see below for a link to proper DT binding for this sensor)
> > > > > would need to describe the device from the point of view of the host.
> > > >
> > > > DT have not concept about view of the host. It looks like hardware schematic,
> > > > just descript how difference hardware components connected together.
> > >
> > > I don't think that's quite right. DT describes the system from the point
> > > of view of the host. It's quite apparent when you look at the tree
> > > structure, devices are arranged based on what control bus they are
> > > connected to.
> >
> > This is implement phenomenon. From concept of DT, there are not such limition.
> > driver can grab some children nodes to send to remote async core, like m33.
>
> I disagree with this, it's by design in DT.
>
> > > > > Here you need to describe it from the point of view of the AP1302, which
> > > > > is very different.
> > > >
> > > > what different?
> > >
> > > The sensors are fully controlled by the AP1302. They need to be
> > > identified first and foremost in order to load the correct AP1302
> > > firmware, and also to know which power supplies to control. That's about
> > > it, there's no driver matching the sensors, there will be no device
> > > corresponding to them in the operating system.
> >
> > Actually, ap1302 driver create one device (maybe not necessary) for it.
>
> I'd like to do away with that, but the Linux regulator framework makes
> it difficult.
>
> > > The data that needs to be provided in DT when the same sensor is
> > > connected directly to the SoC or when it is connected to the AP1302 is
> > > different, as you can see in the DT binding I posted for the AR0144. I
> > > understand your confusion as the hardware component is the same, but
> > > from a DT point of view it's two very different things.
> >
> > I checked
> > https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/
> >
> > The property is the same. The only difference is that AP1302 have not used
> > all properties.
>
> That's not true. Look at the reg property. In your patch it's used to
> indicate which port the of the AP1302 the sensor is connected to. When
> connected to a SoC, it indicates the I2C address. That's not the same
> things, you can't use the same bindings.

reg can be used for difference purpose, which just index under some bus.
nxp,fxos8700, reg is for i2c_address when connect to i2c, is cs index when
connect to spi.

>
> > Assume in future, AP1302 can support over 100 kinds RAW sensor. It will
> > be big efforts to duplicate such property in AP1302's binding doc.
>
> There won't be 100's of sensors, the AP1302 only supports onsemi
> sensors, and only a subset of them.
>
> > And if there are other ISP chips, it will become NxM 's problem.
>
> Different ISPs will have different requirements. Look at the THP7312 for
> instance, it has DT bindings upstream, and doesn't need to declare power
> supplies for the sensor.

If needn't suppliers, it will be transparent.

>
> I'm sorry, but using the DT bindings designed for a camera sensor
> connected to a host to describe the same camera sensor abstracted by an
> external ISP (or any other component, really) is not a workable
> solution.

Personally I can accept any of these two motheds, The both ways is workable
the key is that persuade DT team (rob ...).

At AP1302 case, there are that many property is dupicated.

Frank

>
> > > > >  Even if we end up using the compatible property to
> > > > > identify the sensor model, that compatible property would *not* match a
> > > > > onnn,ar0144.yaml. That's yet another reason for not using "compatible".
> > > >
> > > > we can add extra restrictions here if need. onnn,ap0144, some time later,
> > > > new compatible model onnn,ap0145 appear, we still use
> > > >
> > > > compatible = "onnn,ap0145", "onnn,ap0144";
> > >
> > > I'm sorry, I don't see how that's related.
> >
> > see first my reply segment.
> >
> > > > > > > > +
> > > > > > > > +        unevaluatedProperties: false
> > > > > > > > +
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: ON Semiconductor AP0144 RAW CMOS sensor
> > > > > > >
> > > > > > > AP0144 seems to be a typo.
> > > > > > >
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > > > >
> > > > > > > Listing people as maintainers when they had nothing to do with
> > > > > > > development of a file isn't very polite.
> > > > > >
> > > > > > It is continue previous thread and copy from ap1302, If you have concern
> > > > > > I can put my name here.
> > > > >
> > > > > It's a separate binding, not part of the previous version.
> > > > >
> > > > > > > > +
> > > > > > > > +description:
> > > > > > > > +  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
> > > > > > > > +  ISP.
> > > > > > >
> > > > > > > How a sensor is used is not relevant for its DT bindings.
> > > > > >
> > > > > > DT is that descript hardware. Many sensors have SPI and I2C interface, but
> > > > > > they use the same binding.
> > > > > >
> > > > > > DT just descript hardware feature, such as how many clocks, how many power
> > > > > > supply. All of property does not related usage at all.
> > > > > >
> > > > > > Some legacy binding related usage, but that is what try to avoid now.
> > > > >
> > > > > Yes, so you shouldn't mention the AP1302 here.
> > > > >
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    enum:
> > > > > > > > +      - onnn,ar0144
> > > > > > > > +      - onnn,ar0330
> > > > > > > > +      - onnn,ar1335
> > > > > > >
> > > > > > > There's also no explanation for this.
> > > > > >
> > > > > > It is just chip's compatible string, what do you want to add? Most compatible
> > > > > > string have not descrption.
> > > > > >
> > > > > > > > +
> > > > > > > > +  reg:
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  vaa-supply: true
> > > > > > > > +
> > > > > > > > +  vdd-supply: true
> > > > > > > > +
> > > > > > > > +  vddio-supply: true
> > > > > > > > +
> > > > > > > > +  vddpll-supply: true
> > > > > > > > +
> > > > > > > > +  port:
> > > > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > +    additionalProperties: false
> > > > > > > > +
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > > > +        unevaluatedProperties: false
> > > > > > > > +
> > > > > > > > +required:
> > > > > > > > +  - compatible
> > > > > > > > +  - reg
> > > > > > > > +
> > > > > > > > +allOf:
> > > > > > > > +  - if:
> > > > > > > > +      properties:
> > > > > > > > +        compatible:
> > > > > > > > +          not:
> > > > > > > > +            contains:
> > > > > > > > +              const: onnn,ar0330
> > > > > > > > +    then:
> > > > > > > > +      properties:
> > > > > > > > +        vddpll-supply: false
> > > > > > > > +
> > > > > > > > +additionalProperties: false
> > > > > > > > +
> > > > > > > > +examples:
> > > > > > > > +  - |
> > > > > > > > +    i2c {
> > > > > > > > +        #address-cells = <1>;
> > > > > > > > +        #size-cells = <0>;
> > > > > > > > +
> > > > > > > > +        camera@10 {
> > > > > > > > +            compatible = "onnn,ar0144";
> > > > > > > > +            reg = <0x10>;
> > > > > > > > +            vaa-supply = <&vaa>;
> > > > > > > > +            vddio-supply = <&vddio>;
> > > > > > > > +            vdd-supply = <&vdd>;
> > > > > > >
> > > > > > > No input clock, reset signal, ports ?
> > > > > >
> > > > > > I am not famillar with this sensor, just extract from code. Do you know
> > > > > > where download spec?
> > > > >
> > > > > The datasheet is not public, but I have posted a driver, with DT
> > > > > bindings, to the linux-media mailing list. See
> > > > > https://lore.kernel.org/linux-media/20240905225308.11267-1-laurent.pinchart@ideasonboard.com
> > > > >
> > > > > > at least ports is needed.
> > > > > >
> > > > > > > > +        };
> > > > > > > > +    };
> > > > > > > > +
> > > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > > index d6f1670290589..1362d351f2574 100644
> > > > > > > > --- a/MAINTAINERS
> > > > > > > > +++ b/MAINTAINERS
> > > > > > > > @@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
> > > > > > > >  S:	Maintained
> > > > > > > >  F:	sound/aoa/
> > > > > > > >
> > > > > > > > +AP1302 ON SEMICONDUCTOR ISP DRIVER
> > > > > > > > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > > +R:	Frank Li <Frank.Li@nxp.com>
> > > > > > > > +L:	linux-media@vger.kernel.org
> > > > > > > > +S:	Maintained
> > > > > > > > +T:	git git://linuxtv.org/media.git
> > > > > > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> > > > > > > > +
> > > > > > > >  APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
> > > > > > > >  M:	William Breathitt Gray <wbg@kernel.org>
> > > > > > > >  L:	linux-iio@vger.kernel.org
>
> --
> Regards,
>
> Laurent Pinchart

