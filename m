Return-Path: <linux-media+bounces-49648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BADCE72C2
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 16:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDCB03010CCB
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 15:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647F8329E7E;
	Mon, 29 Dec 2025 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k+hKtWGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9CA3164AA;
	Mon, 29 Dec 2025 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020982; cv=fail; b=MZOiIeGSvC+2LxuPiGAD7tlz4/lIWaaDbMHQxX79U9vuka1UBukhqu5xjQZmpyh4V38xxK9qpv50A9spmraTc1LY2tG7m66XHbW9ANW1oUOHtSUxD4aT6FmMGL1u4CAfZN//0niWxYWs9tpxtOgrzoA/oszMZvEKocADGpey9QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020982; c=relaxed/simple;
	bh=jKj8D7g+LIFGuO0qBj4xmQ9gzuH0MzgFkca26vW7jjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QmOk7Ve/Qd0sqorsh2qgNxU37Uph4lXhoZ502+nhEmIXzwYSVZSNr/DNeggWvdUIR+FAOjPgPJwskqiwHuNCJp4qRkt+XELatVu+X71RfRSsB5BSuS3BYqh7kP2b+5n/AjhJS8KaL94Ft80k/fJR+YR7QJdy95PSzrQ4T7GAGCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k+hKtWGJ; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR+scZ9dqQQPlJ39/OD9167V/A4NT8rktM0/JPtD9o1ML3rc5uLy1qg0wC/TorjQsoS4OYA0PyxolCXmI3irAOtJTDnkRQ9ecbp8UGT03CpolbjMSJY4ledLL1YT5CjKUnPrSW1LYp6TfPAI6n+ixM2a2IsEWP5I8y1At5gZFyTAT5lTp8Qb80gPxJzwN8eVkb8FLM8vlfatUT/jcNbJ7SAISmVHkWPKj/2HrVuoJEyBrP8vsEc719Cq2VNh/9gTLBN7YHeacqeYIvuoIX3ugd/nKGhdmNAwu8E/vDwLUzjwtV44m7PiR6ilaD2Qsv+W09adVPF+Mh1Hr3jSmtZGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K79kDzYu/+Ta4tsWilKV939XrPbw+1mPSC53hsg2T94=;
 b=TWdvLKhttHfrHanvCk+VqicWcoZMX324WDG0sWOB9CDJEHIlaKkKCRZuQsGijJZYqNlBMb/nB/2+ww97ym+z2+i4kow1d41ZF8cPJduFvl4SlqzjNrjBYXz9Dn4Cqu7bhXXCrqIpwxhNKErmediQkv5tX17DXrXn5nArB+nP4Nw8rpjZd1ZXZr2UNMmBk79IY4cVcbNJcr29exos6GKUpzQ18M7Z/ZGIoExZpW8rkc2TvVc9JgfDU9y93q16toTriOziOxmK9T3p7iwFqn5u7M8jxy+wBBsuGWZBLqNTN6hF0iJwZy3PutpHA4IdwjmicIXmr/xH0Xbplpz3H+4uYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K79kDzYu/+Ta4tsWilKV939XrPbw+1mPSC53hsg2T94=;
 b=k+hKtWGJq/DYzZCwxNfe+hYy+1bU37Cwg+DmP0mBm85qPsn8BqW3SsMOljyXI6TIo+XCi6Nl245zJDeOv+8WIDl3Ilnk9Nv5YtDIbYAYpOf1CkMu5+OhQaJWOwQIUT0AEehmHFuRzS3oSK21L+ekrh1uI+xutc9KZAyNc/41LFphd2LDyKc7mJEjWFEB3seX2E0KHW+2cUPUPVR/3WSjSe43jYXJhAxJtg0JJWuZK3wcMhLAUayM2qMpeji/4S7WwQIzhFYpqZLgMnNVF/bwtuKpknG+n5a++j1sg1wyPTsRcSggTwI3xPGvOz68oKw4Gcl6k2r47br/iI/JdXb7aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8883.eurprd04.prod.outlook.com (2603:10a6:20b:42e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 15:09:37 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 15:09:37 +0000
Date: Mon, 29 Dec 2025 10:09:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Message-ID: <aVKZpOKuST0s6bNY@lizhi-Precision-Tower-5810>
References: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
 <20251219-csi_formatter-v3-2-8680d6d87091@nxp.com>
 <aUV4enryGRDdIkIb@lizhi-Precision-Tower-5810>
 <AS8PR04MB9080817D9A557B9D96F55066FAB4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080817D9A557B9D96F55066FAB4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7f2129-7d1b-4560-9851-08de46ec47f3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?+SX9yQGpfPn98ZxBl7y7Pj64PS2OjA08jlB/oWoUBuMV1RnMwdUDkaAa2qgS?=
 =?us-ascii?Q?R+0kV8ryht0f0RKZj62mhf09QMwQSh56XvqQLyhOe5hXIIDJ8IjfEo3LTSdV?=
 =?us-ascii?Q?hQ+l2aoIBVxh9h/5veXcjxZCaRBhrcxGSvDD0z8YlPAoZpF1zglaxGp18wS8?=
 =?us-ascii?Q?4VJ1qK7pShgbdTeKZ70v/TyJiLEI3bX/DYEJSIQIxcSk94V5AjnfHXnIbC50?=
 =?us-ascii?Q?SmFrR7KigZNRogTxpz2I720b803/DybR2O/xzUY+M2eCHHrLiZscJ36x6CL1?=
 =?us-ascii?Q?QW4TT1qw7+iFQ2uho+HRlv2FQYl9iwdaik1a4Sz99t1mQ1XLvrbFe96PDf+4?=
 =?us-ascii?Q?6Tm9pn84mtWsshru3Lys1AskZIvT3mRzSZimFlrprLPBaDM3EcRQizr/N7mb?=
 =?us-ascii?Q?FchHxMGiIaCs4CntmjiX+Jq7v7oJm284/G94it/mDG1+8fPnnTMbu0i72Bdq?=
 =?us-ascii?Q?18CR7B72C0KnlMCGBcWK5KGx+xBSTZpD14JrGmo+B2o6740uki5jW2QwYzfn?=
 =?us-ascii?Q?RqwSw4H3eMx4O47AFqpkdXp+rupv1yMY/O/WEy1BmN3gRrwPL5v8FGH3qtkF?=
 =?us-ascii?Q?zKXUmi1dXyAlMezM28UM8FHNcjSIISMjZ8Pl4BJCji5YuOKSEqc1PkROxZeA?=
 =?us-ascii?Q?Amj8lnwMpsSm2Ko2xh1Ui5bE7ag5ecKNeH/o5wtHfg2MQ9VZ6w70W69lCuD/?=
 =?us-ascii?Q?ZmvxbqytAl0q3714ZR2xv3T+aAdUtr9MxEyJeqjvq5F6cGbppOjPTko607JC?=
 =?us-ascii?Q?bPlULXa1nMVh/R6pYtZI4MS41E09p6DBRAk51beVPq8Cu1wsgF0OWLxDXwV7?=
 =?us-ascii?Q?Vi23nBO7JxAMyQH0ie2T0SUrFtVOYQRMOx4E8k9VQA1UboMkXZAnWSmffKEd?=
 =?us-ascii?Q?FlLZrhJGNQijMwLm34baoWlgWYUiZJa2wHuDEMBMkbz4OCVAz/CNKKKbOcgH?=
 =?us-ascii?Q?6RO3YLbQn37XJb89OLiAS0ywiRaTYMUbm4dbKeETFB3gEJF2M+fGinsx9Z/e?=
 =?us-ascii?Q?QBR3yX090ZZ+0q6t3nJy2ALk0e5+2Kddl7v3dJrinIn+1BkDdwypOByHF7WI?=
 =?us-ascii?Q?/Sg+PZxK5/Atv5eUp4khf9pyM1w7ajFd5GonPXRjdsRGayjv2KKwTBnO6g2S?=
 =?us-ascii?Q?B3DUdUPgAiee/PhFlD9wwRlgTku0kDQ8wWkF0J/JXJaj/VLfgxPvkjH+kYBi?=
 =?us-ascii?Q?6iFV7JMdCGOHG+u4oOJnfOe6NLlj/tbg9ETSaVPGPN5RXFCrigk6ExCOZQDd?=
 =?us-ascii?Q?IUbVwHIk+GCeU8mhFQ5QMiOOXzNsfUesCpsLJAW8H2pErYAZR2vfQ/jVIivs?=
 =?us-ascii?Q?sY9/E4xVSucbsKKuTcw4abF6hOcAwR6pCLTCfXadlKi9UiS7jSzB4n0WcVVu?=
 =?us-ascii?Q?DzOM/Ob77pZlyp5zKoLazjNrZl3Ko4iAwS+4RicKfbTUU9/2bACMXyg0ZXT+?=
 =?us-ascii?Q?NoPLCIbK2opiX9MIECJZ2+4kHRSvhIwtE2QPXWOLH7JOAAkpPD2i3w27Ys8B?=
 =?us-ascii?Q?LTzw2PJuSqyNwPccT6oLam3BWdMzH5qX02Nl?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?NnwuEuEyrnmg+7LxKJqGISElXKjbvh2RRBwMsCWDMdWjBpUNy8+okHDsDYja?=
 =?us-ascii?Q?wRhha4siVa5z1IZpy/f4ABlpE1WOYAkpUNUWVQRlMQesCf6LhpYeFalJuxXP?=
 =?us-ascii?Q?6h6Bvww6puXkfGEMhpdBoayep1hD0KD2MEws6ZbPQA7dhRdZSQo5gDNMWBvl?=
 =?us-ascii?Q?bjuNZ1tvwzgIoRO1f/N0wu3bw/z4z4xUeD+nQkppEDx3O7ZAoiPEwhcxsKPg?=
 =?us-ascii?Q?yZhjvCdejDZOAjkalLewey6HF9wxotI5V8i7MiSvSBKi3yjoDlEkmW3VzG8t?=
 =?us-ascii?Q?bBf7nWOx2gLGBoJz0WufO4XzZKQom3WGhQZC3Sk4DFLh9JZrT6XG4KpeEe2G?=
 =?us-ascii?Q?bp5heygPN1V7jND0jZxLQZWrtTyiv9efc9EUQUEH6lKBCoviDXkyiv6AsPmc?=
 =?us-ascii?Q?Lc+ZGaSgC8awrPq/cO3J1PjoOviedr67zo3erx/2bGhvwfiE47Tm4N9fqghG?=
 =?us-ascii?Q?hZ80vZe7jHAdepk6GpMwgFi7MH3ffc13rKsyyl2+7Un/9VVwz2AKfJfTdVH5?=
 =?us-ascii?Q?1CfxGh3KvuXIdr3hVVEzGfNNRinNzi643ZC1WyHINzOMUM6BsUpLPdShxAw0?=
 =?us-ascii?Q?PLiZoQWauA8yaAksNVb7+lMwhFugNRQrU/QOWq9fyKZNBstC3V/wOVrDESRc?=
 =?us-ascii?Q?iJdSJLbGWzP/keJsJApeJa7p9ns4/e02Fa0ViZNoniYaU3542W0TDzi+1kRb?=
 =?us-ascii?Q?F44zb2iaWddssU9CnYPW+mnwqk96X+WUVEXdtmeWvKMOlWaKOTvpR9cm7t93?=
 =?us-ascii?Q?vmho5BoIQcvUdusnAtmaJ/IB/S56jaffDg5OV2MBvUyOmqDX9fgNmZGsAT2k?=
 =?us-ascii?Q?zRWE4vvLOc4dvPXESX8I9rUieeflDQ9rGju+R4OHkFUKQVO7DqjfExoJBCBF?=
 =?us-ascii?Q?9OjCSmCdRmghWdZbWSElBctkdy0egtswTDa8UHKLm6cgXL5XalXt1UD4vP0J?=
 =?us-ascii?Q?NjfqzYtEzZJO0WNsYS0XND64LzYu6lUfppU3K2e98lUjvoza3yzXPfY3DwzU?=
 =?us-ascii?Q?5hDyglnnIdzffFMEJpnp+lZIa76f5FbCvreRtM57Z5kUd/QdlqJBFl+g6HnL?=
 =?us-ascii?Q?npTsqptg+wg9TwU0lfxuKnmvLpisypcEh9esxQwrq3kwm8Eg/OLY54QULPqG?=
 =?us-ascii?Q?fKOwkdV0/1lHuL+pBtDDD2uvsCf3XWmJW3GdetaGJWxIo1DmtHwKI/7ZKDci?=
 =?us-ascii?Q?HmJc07Nj3os0Fca40iQC1zy302dN4kyTxA/KIIMllxLsD0cpAzxjIOJG0zEy?=
 =?us-ascii?Q?G8Dj7oB21Y9esMOMb8ub5zA4LtN3boWOzJiokJwCkgZ4N7UVDtyqw05L3JxI?=
 =?us-ascii?Q?wI5+gdxzxO+LyVy3zVKnI6R20BA+/Gba8C1E+sSPU7lpMYkEUeHX5K/myE4B?=
 =?us-ascii?Q?JOZHZJTHX53KVyFMbCTxiKbbSmtnzVGecY23xaWeqgCW6PWAKaa5tB8jn2fr?=
 =?us-ascii?Q?8mq42fSw27lSMsPGf2gJst6a0IkmskOzL4/sDYn8/PC6+HheFPjN5BRaf81S?=
 =?us-ascii?Q?cqyIh5Uh58Mu7mI2P6cPouQYklevj9hJEExU+jZCSuSVgkmJmYF1jjeY+x09?=
 =?us-ascii?Q?NYmLKoFmzi1ukb5wMlj5JskM3VQgqSz1ykhUIVP4k1Cs0nJrzoIvzoRfsyP7?=
 =?us-ascii?Q?mRtN3AMbZa22LzZaHN0KWYIbKhIpLsBDaK6gLDuFTlceCF58Synwx48X/fVI?=
 =?us-ascii?Q?SrUR8Mzr/OzW02o6+XXsl1Yxy986qe1vsQ4RlYgfq4dsD2ZS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7f2129-7d1b-4560-9851-08de46ec47f3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 15:09:36.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMY7DKeVIqb3Qkb1C8TawXHigHB+fn/W7nM073MfjzYT2c4UVIWdddIt60wbaLnXyuXasr9hcv+EIarOsPu1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8883

On Mon, Dec 22, 2025 at 03:29:10AM +0000, G.N. Zhou wrote:
> Hi Frank,
>
> Thanks for your review.
>
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: Saturday, December 20, 2025 12:08 AM
> > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Rob Herring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Laurent
> > Pinchart <laurent.pinchart@ideasonboard.com>; imx@lists.linux.dev; linux-
> > media@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; G.N. Zhou
> > <guoniu.zhou@nxp.com>
> > Subject: Re: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
> > driver
> >
> > On Fri, Dec 19, 2025 at 09:50:58AM +0800, Guoniu Zhou wrote:
> > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > >
> > > The CSI pixel formatter is a module found on i.MX95 used to reformat
> > > packet info, pixel and non-pixel data from CSI-2 host controller to
> > > match Pixel Link(PL) definition.
> > >
> > > Add data formatting support.
> > >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  MAINTAINERS                                     |   8 +
> > >  drivers/media/platform/nxp/Kconfig              |  14 +
> > >  drivers/media/platform/nxp/Makefile             |   1 +
> > >  drivers/media/platform/nxp/imx9-csi-formatter.c | 880
> > > ++++++++++++++++++++++++
> > >  4 files changed, 903 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS index
> > >
> > 4205ca007e076f869613032b51e8cc5bff06b98e..3878957b81156e5cb41da26
> > 99b2f
> > > 588e49521724 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -18626,6 +18626,14 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> > >  F:	drivers/media/platform/nxp/imx-jpeg
> > >
> > > +NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
> > > +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> > > +L:	imx@lists.linux.dev
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> > > +F:	drivers/media/platform/nxp/imx9-csi-formatter.c
> > > +
> > >  NXP i.MX CLOCK DRIVERS
> > >  M:	Abel Vesa <abelvesa@kernel.org>
> > >  R:	Peng Fan <peng.fan@nxp.com>
> > > diff --git a/drivers/media/platform/nxp/Kconfig
> > > b/drivers/media/platform/nxp/Kconfig
> > > index
> > >
> > 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50
> > fa4
> > > 88aee9590a87 100644
> > > --- a/drivers/media/platform/nxp/Kconfig
> > > +++ b/drivers/media/platform/nxp/Kconfig
> > > @@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
> > >  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
> > >  	  SoC.
> > >
> > > +config VIDEO_IMX9_CSI_FORMATTER
> > > +	tristate "NXP i.MX9 CSI Pixel Formatter driver"
> > > +	depends on ARCH_MXC || COMPILE_TEST
> > > +	depends on VIDEO_DEV
> > > +	select MEDIA_CONTROLLER
> > > +	select V4L2_FWNODE
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	help
> > > +	  This driver provides support for the CSI Pixel Formatter found on
> > > +	  i.MX9 series SoC. This module unpacks the pixels received by the
> > > +	  formatter and reformats them to meet the pixel link format
> > requirement.
> > > +
> > > +	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
> > > +
> > >  config VIDEO_IMX_MIPI_CSIS
> > >  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8
> > models"
> > >  	depends on ARCH_MXC || COMPILE_TEST
> > > diff --git a/drivers/media/platform/nxp/Makefile
> > > b/drivers/media/platform/nxp/Makefile
> > > index
> > >
> > 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b
> > 01b5b3
> > > 4a021dad7bb3 100644
> > > --- a/drivers/media/platform/nxp/Makefile
> > > +++ b/drivers/media/platform/nxp/Makefile
> > > @@ -6,6 +6,7 @@ obj-y += imx8-isi/
> > >
> > >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> > > +obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
> > >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> > >  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
> > >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o diff --git
> > > a/drivers/media/platform/nxp/imx9-csi-formatter.c
> > > b/drivers/media/platform/nxp/imx9-csi-formatter.c
> > > new file mode 100644
> > > index
> > >
> > 0000000000000000000000000000000000000000..5786e4690e31ee471caf82
> > 01329c
> > > 8e02a2cc0ee6
> > > --- /dev/null
> > > +++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
> > > @@ -0,0 +1,880 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> > > +
> > ...
> > > +
> > > +static const struct dt_index formatter_dt_to_index_map[] = {
> > > +	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
> > > +	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
> > > +	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
> > > +	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
> > > +	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
> > > +	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
> > > +	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
> > > +	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
> > > +	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
> >
> > what's these index value from? register bit?
>
> Yes, they represent pixel data type for each virtual channel. You could refer to
> i.MX95 RM Rev2 section "142.5.1.55 Table 913" for more details.

Okay, can you add comments said these value need match hardware settings.

Frank

>
> Best Regards
> G.N Zhou
>
>
> >
> > Frank
> > > +
> > > +static u8 get_index_by_dt(u8 data_type) {
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
> > > +		if (data_type == formatter_dt_to_index_map[i].dtype)
> > > +			break;
> > > +
> > > +	if (i == ARRAY_SIZE(formatter_dt_to_index_map))
> > > +		return formatter_dt_to_index_map[0].index;
> > > +
> > > +	return formatter_dt_to_index_map[i].index;
> > > +}
> > > +
> > ...
> > >
> > > --
> > > 2.34.1
> > >

