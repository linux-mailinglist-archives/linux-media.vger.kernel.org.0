Return-Path: <linux-media+bounces-34366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D8EAD253E
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E273C3A6E11
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 17:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ABD149C53;
	Mon,  9 Jun 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d8QvzOtW"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012042.outbound.protection.outlook.com [52.101.71.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220B3398B;
	Mon,  9 Jun 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491911; cv=fail; b=Nl9/kX8R14KVoNzSneHbml7sq92/8jB5CMn2UEesVVdekR8sbb/p7f359wGEHjVzzH65RaZV2ScLDFTV2Nx/ByjHBdGKxKvTkOojya5YsJnhn1BiHa41j6AlNloqcC8JBP7vT2DBxdTmOOpMwZ/vjVBy1df8iRFINoD5ssoUN2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491911; c=relaxed/simple;
	bh=e8Av4UcQwe8GQmnhKq4UTin+PW1eWBYKkiIhx4T9EqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nLYh+JkpOLQqFXP8N53YdfcPVo2mluvl1W9UdOEyL6usMCkWuXtPlO48Ke2Vmz6qHtGiAcEdujnbPOWAV1o+kfHG6BdHIyQFPorRHRSp49RS/RDbLtDKscPANo1T0hcRv4lWCLbbHjPSXQxXYq84liWCIl4scrkc7P1F6O3Lq0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d8QvzOtW; arc=fail smtp.client-ip=52.101.71.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUtV1iLmbj3PCQKn+8WRYTESmg+r0smqOXTTxOxPGlaje28NejT3HRXVDJHDqJuxGOPpkbMpYhtQnK0HADcm6hPOQsgkuCzuGC/ce1fWO1u9LVUX1uO0q8JMkjrbn9Qw7Z7mcOlZSBvtyn9bfUj4zJLP9ppOp/A6+3xSaKBDHvPleA/wOR7rrOojPfhGfzGgu+3VYsvm15hZ66X2V3jzzIuTZfiWBdvly/zr+1JPKZDJUp2Kq+5F5SlpTV+LScN5r8eCmHMeivsE1MPh33I/I64l42r+BFC8gtUUFSEE5h0+8BlcexaB6guhknTKQcxyW70Q+OcDwHqKh4xuBfwUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF+9IFXdIt/M5G7kx71RqLrBU2nHWEK02zlrJ2CFW4o=;
 b=K58PUkveI3XCz1+44NDd1BEudpKotEiE5U1A9k/EpgELFRgZfrCqX7iaBN58IEdpTThb4aONx4jMmUdrk0LhrKwBnClR7siL+Tp28/rY+GaRzW3jmu9NU//vL0ifbUt4C6ITImvWQ1l6uuBxojjB2l/yETWzdFm+rUOQvmlkOEOZFYJtsV9x7fbCqP0d0XW2V8AjTRzQCWLayCQYD6B3r8p5adB2+/2HL48CZQO5K/u72Ef4NpeiBp5vGApxoXHE1gjKOK+Uquhc0QXzP2Hn3Og/V32Mhu/JZDdpyr+fCz6kci5080WavrqEaHprESw3BTaXAKtugRM0Pppvat/oxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF+9IFXdIt/M5G7kx71RqLrBU2nHWEK02zlrJ2CFW4o=;
 b=d8QvzOtWgnxymYgNEM1dDxg/rJjlwp4bU0grJQYQTjR6V5yK7KP4wR/Zv/iiXYnBAm0s5LeVtsTerqmsLhDpc1OjkuMguBXol6eMYIGfbNxqh6WQ+DzMPcIGVkY/U4sBYSGMdc05yGkzl+fw9pv9+k/omRxy4q2FTTXQhL0NYTAM2e66Cc5gr1bSfX1uZPXZKGws67b/dpPXSv/QzOA2MkBDKvw/bhaNG/2Lcr4UxtmOl5r6RNoJyZRDaQPb859a80ZkjRrTml/q3QUjpbiqudyz37SxbmdVlzYOUBWOfOlRcXUySQYQT3w8yM3LKciG47fJRJZlHPirGq3JDBuCeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 17:58:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 17:58:25 +0000
Date: Mon, 9 Jun 2025 13:58:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
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
Message-ID: <aEcguU9BdCeImzQ7@lizhi-Precision-Tower-5810>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
X-ClientProxiedBy: PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: acfd3930-27ef-478c-4546-08dda77f3b61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RHBKY1l4VzhuWEJGWG1XdmlGMzN5YWVTTzNjc3NTb3ZEYWFQNGZEb0tIZ005?=
 =?utf-8?B?YWFkb1czRGVOZWV3c3JuNHd5SWtkVzFzdmdMLzlZVVlFelZvWTNwY0dPaEl2?=
 =?utf-8?B?dlJ1NFZ1cHRKTzZSTWtYMEs3bGFJajFHWlhYOUl5M2tzbFZydCtQTlMrMXBE?=
 =?utf-8?B?OEI5djhsaXhycTZZTnhrSEhwZUxNK2ttNnFjUEwraTNXUUFnN3V4T1dGNTdF?=
 =?utf-8?B?dUZhRFMzaWwzbGszaGxmdWFsOEFaUzFzcWMvZFIvaldWTGxmTEY1bWFrelZC?=
 =?utf-8?B?SCtpTkN4enRRYmVVTVZNTjNWd2FqTUZpM2htY0x2aUFPS3ZEczUrZXk2d0Z1?=
 =?utf-8?B?aW9CQkJxTW5HaVU4dEwxWnNYRWt5T084YkVJTFBZZittODUwcDRIZks2SWFu?=
 =?utf-8?B?Skx3RWQydDJXZWVnN1kwSStDUWU4Rk1QTm01K1FzaXhWcldmWW5VWVRZNVZr?=
 =?utf-8?B?aFZTUkg3Q0JVR1YvdzV0Vm9PV2U2WDRjLzVvVW8vcGhYdmdJZjhjdWt3Vmtw?=
 =?utf-8?B?cEpWWWlUSnB4eTQ1akNvQ3BvdmFuMGdCQ2JSU2Z3KzJaZFEvemlRZmNoVVN0?=
 =?utf-8?B?RnFpb0EzRjhwM0FMVUhvUzBOdVZKN3pIZ2M4cUF5bkxkdVJFTVdqWFlFODZp?=
 =?utf-8?B?RnR3QmFiUzU3OGNWZ0lRZ3ZySzEzZitNYUhpMS9zZTJ1cWtGajBpbVR2ZlhG?=
 =?utf-8?B?UzI2YTE3dGMwM3VuUGp3NTVRY01qcG5aMWRMb1lvb2lHL2RZTHZCbjVTSS9L?=
 =?utf-8?B?QlpxNFpKRG8rdTkvaXZxR2p4WFJtdWJ3dGpNV3BNaHVUN1hzeG1sY1hQSk8r?=
 =?utf-8?B?YWtUb21NSUJCY1ZpdW9VM3VUWlFIWjN4WHJBV3RsNzExWlJ4blRJZG03NGFZ?=
 =?utf-8?B?dHBRa1ZVZ2RIVng5bnYxSC9qWENqbUxzYVNMK1lPN3dFRzk1aGt3R1Fscm8r?=
 =?utf-8?B?UHpvTklPZ1U4MzFDQmE2bHpGTDNGRWZIbmZaNDBWT2IvVndXaVF3UGkrNGRW?=
 =?utf-8?B?TXJ5RStpOVQ2WGx1S1lySmxTbm1rdmJibTdNeVpZVEdMMGdRVzE1WWJEaHJ0?=
 =?utf-8?B?MVVZRjNhc21rbDRrTzBaSk1lV3NwUEVkRUJQTDVFM2x2MVFmN056NGY1b21z?=
 =?utf-8?B?YlBuQUc4N2xZWWQvNlRDUFNJeG1ET0xtT3UySG8wRHh6bDlUb3h0U0xWK0Nz?=
 =?utf-8?B?K3VlWXByNE9vZGlLelpqZUxYbmpwWlE4SGt0NXVHSnVTUkwwQlAvT3JpVVhT?=
 =?utf-8?B?Z1Uxa2I3VnFVL0pBQU53cXhTTEVkZVdmNHhvRmNQNnU0OXArQUp5eWUvR3Jn?=
 =?utf-8?B?VlQrTzhjWUdiNDB3TXhjei8wV1p2SHR1aDJ3eXpnd0djNUtJM0VGbTRhR3Js?=
 =?utf-8?B?ZFcvWjQyY1JnZVpKd3IxdUsyZUxoQTJjY1pzUzNDNE5IVjQ0MUpzQ0pRQXJm?=
 =?utf-8?B?T0RtNmVOTVhsdW5Qeitzdkd1VkVSMnROb1N2MGZuRlVOdkt5bThWWFowWWRK?=
 =?utf-8?B?QUdFRDAvR0NuaUtwSXloa2JKaWlTUm85blBlbkpBYnZGZkt2S3RDZzF0dy80?=
 =?utf-8?B?MEZZTHN2Ry85WVpNelYvWTNwWkROS2ZCSERaVW5wVWx4QkJDenF2aEp6QnBS?=
 =?utf-8?B?YlM0Y2dCZVpnL2pzb3BHWGFwcWVScmNCSGVoWktKTituUHBNZ1pWRjJWRFVi?=
 =?utf-8?B?ang2ZGZZTTM2WGxKUFB0dTFBc0Z1T1UrNkNVM294K2kwbStvUEU2YXhWOFFY?=
 =?utf-8?B?K0o5RytjdEdITHloMmdaNTNQcEhsVmJDb0xyRE1iS3pCZVJuL0NNaDVWc3N6?=
 =?utf-8?B?Z3lML3lwK1MrMzZ2aU5JeVhjVUEyNEpJbTVFY25Tdm1CZ21XZDd4MjYzOXZY?=
 =?utf-8?B?enB0RTY3MXVGUlVicnZNMnZDMzRzV2wrYmNUcDB3UndjcGxCQ2VHUTF5cWEv?=
 =?utf-8?B?UFJOMGxNd0lqK2ZnR2pJZWlmb0I2Mzg2T1VYWDVYbGloTmVZODFPMU1vTG92?=
 =?utf-8?B?NklrTHBLWWd3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZDBwMytyQW02NmdhMmxWUHVXUzdTcTN6MlZuemhlYk9nSm9nODNQbVpXa1R0?=
 =?utf-8?B?amFqR1dLZC92dmpzTCt5V1RJVHpTS253QWVWdFc0OTFxV21BMStiYVMxVGEr?=
 =?utf-8?B?Z3NVQ1RUdVBpMUR3bm1tMVRLTUdsWC9Zc0JNclpFM3BpTW1pM2h4cmFzZ3JE?=
 =?utf-8?B?SXhCSnByM0NpVmVpSVE3TERTQ1oyNkplMFl0K0hhc3ZKd3Z3QmZUL3JFRk9B?=
 =?utf-8?B?Vm42NFZmM3R4NnFkcDRkcDVqUHEvZzVFejY4UlJsQzhTNkg4TTcxUnNDd3dO?=
 =?utf-8?B?VklscUpFMlp3eW5maDJBWFZKYXNiZDlvOXozVzltZnJYYjRHMm9iR002enNT?=
 =?utf-8?B?NU1RcElHMm92aVZMSm1WVE9RSFdnbUJPaFduUkRERFJIN09zY2w2eVdJcFl0?=
 =?utf-8?B?VVA0MmVXeG5yeXZVMEowbEE1eXBpZUtMaEpFSnNvTG5JaDI2SGwyMXh2TUtG?=
 =?utf-8?B?bWdhV201U2lLb3lZNk5tekJUV2JxQkVNSjZvalFxVlFHQ0VWcGV1WThGMERj?=
 =?utf-8?B?c0JZaHBjTFkyK3laRnhxOVd1Qzc1NC8yM0NGblBkUmduajNnRi9jWHRUTHVx?=
 =?utf-8?B?YnRobzdGWXI5d2todElJQzNOQ0QvQmxMZjlqaklqejI4VUJOVGhnOG5wWlJu?=
 =?utf-8?B?bXM4Y1k4a0N0b1hyMFFZcW1tUWRNSHovMWFDamVVWHBFY2pERmlrVTliY09D?=
 =?utf-8?B?K1lYZFBCemE5bTQ4enptWU5SNkJUcjBUZDdaeFZSN3lhQmJWRlNRbk1ERG5H?=
 =?utf-8?B?Vi9TSXpmY3hvZm5BT0hDZFBpVnpYV3dpa0NEQ3lmQzUvWWJ6cU10UTBTakFJ?=
 =?utf-8?B?cnJxajBibzgwamxheTh4b3IzNkZVUjEzTXp2ZFQva052VkVabENldEpjZGtM?=
 =?utf-8?B?MUJhVnhyYmJLTHJ2bGRodDR0ZjhoUFFrcVRNNEJ6R1Z2S0FEOE1QQ2xGK0U5?=
 =?utf-8?B?TVIyU0NQRzdwcjFMRlg3cjc2UmtYa29SZUZheEVHUmp2UHYyQWlkdWdVdDFD?=
 =?utf-8?B?RWgzcGo3ZUpNeXRvaUJCUmpxT21yQ3dKKyswandtWTlqUGJvc2d4TndCUFg1?=
 =?utf-8?B?bzA3SEcwMGxHUDRLSEx5cEw3cHVFanovR28vR0NraHRUajNqSGZDanlCNGsx?=
 =?utf-8?B?M0NIMmZMSFlTTlpaQzRGUktXekxMSFZ4RnJIOHpKZzJ5Z1NMNEd4SzFCQlRC?=
 =?utf-8?B?K0hTT1FqaFErYS80N0V1T3lGT0U3Y0MzQ3o2SGh6S3JiOFdMTTlWem9VdnR1?=
 =?utf-8?B?Slp0Tk9CVFNsaGN0V2RTK2FkRElCUTQ1MEVxL1M3TTRwb0JBMkhXWkROcWFk?=
 =?utf-8?B?N0JMbHZyblZaV280dm9oNFZXR0pqOC9TT09mK3lxcFp2SGpMemxaN1VLRHVh?=
 =?utf-8?B?WHV5eUQwV2dIOUI4U2EwTUJLYkZWK0p0bG9abXUrZUhzYmJUdzdkS1R0RmNT?=
 =?utf-8?B?U21kYkF3VHgwRnBaQVBQWlk3MFh6eHRYZGNIeHVSUHVlTXdDcXh6blZaVkJk?=
 =?utf-8?B?VWlHMGdzMTl2aVRZZnkvSlVlcWM0S2xCQklkemN3a21IRkgzbFNUV3ljZXk0?=
 =?utf-8?B?UVAvZHJ6N2NZZDdmQ3RwcHFEME82WmtuSmorTkp0eXZuYUlrVWtHSkNrMWNY?=
 =?utf-8?B?enZ0V2doV3VmRnFxQndrUXpjdzYyUjVIbHFtTEVtVDJaNE85eE5uQmd3cDdp?=
 =?utf-8?B?cXQrc1hySUNwU1dRcUdSQk5RZ0FlNmhkR29kNmNWR0hLaC9qek9Pb1pVa1pY?=
 =?utf-8?B?MkRkSjhRRzIxMGhGT2xsUmxydHF0VEo2WS8ySXVoQTYzWXF4Z2UvQXZlNzdN?=
 =?utf-8?B?aEdXZTlsRmlnUXRZQzhpa0Ryd2pIeGEycDVLd3B1alBPeXZrdmZDUEhEb1lH?=
 =?utf-8?B?M3A2dGptMmdVMEI3NnRoeFB4NHB4c1E1b1oxRlg4UXlYNUxzbjNHVGpRR3FO?=
 =?utf-8?B?VjJ6ZXNRVldvNDRnRjlZTU9pR0ozUGRkNkk2ZFdFRTlmWi9jMFdUdVZtcUJU?=
 =?utf-8?B?MW9GQlQxcEw2cWJKeHh5VkVpUXN5MTJybi9DbTBCa3RqL25VcHlrMkJiYkE2?=
 =?utf-8?B?SVllQ1FTQkFuL1VJQjJ1dVpFdERaM1JubHAvVlFHUEVzT1Znb0FNUkR1SW0r?=
 =?utf-8?Q?yhN1DKRT/jHITRqfU85UTRDFl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfd3930-27ef-478c-4546-08dda77f3b61
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:58:25.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz/BkRPn7SrASrKNKSsvoQWGAKtxMLNl/GDUp0L3BOTjL3WdSETcyenHoqZpFLC7P9RRtOKTxG8Yq88wEU/f8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10566

On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> On Mon, Jun 9, 2025 at 10:32 AM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > This is an integration-specific property, specify the number of
> > > instantiated channels through a new fsl,num-channels property. The
> > > property is optional, and defaults to 1 as only one channel is currently
> > > supported by drivers.
> > >
> > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > binding examples do not cover that SoC, don't update them.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > index db4889bf881e..41ad5b84eaeb 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > @@ -68,6 +68,13 @@ properties:
> > >      default: 166000000
> > >      deprecated: true
> > >
> > > +  fsl,num-channels:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: Number of output channels
> > > +    minimum: 1
> > > +    maximum: 4
> > > +    default: 1
> > > +
> >
> > Look like it is fixed value for each compabiable string, So it is not
> > suitable for adding new property. It should be in driver data of each
> > compatible strings.
> >
> > I met similar case before. DT team generally don't agree on add such
> > property, unless there are two instances in the same chip, which have
> > difference channel number.
>
> If the DT changes are rejected, can the number of channels be added to
> the data structure inside mipi_csis_of_match?  We have compatibles for
> 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> to the number of channels.

Yes, that's prefer method.

Frank

>
> adam
> >
> > Frank
> >
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> > >
> >

