Return-Path: <linux-media+bounces-52921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPguFklDk2kP3AEAu9opvQ
	(envelope-from <linux-media+bounces-52921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 17:18:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC32146030
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 17:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26A71304E833
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0220331A46;
	Mon, 16 Feb 2026 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S3vmyOvC"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34921B185
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258569; cv=fail; b=ouRBYqdVLUP/ziQstDf1R2BiKMmgPdRxtPzYDFdf3wMLCFmFufwPlgrXi+ZB403gR83OdZlFDK58BR+UFt8Fr4oTMn7KSID8LE1cxoa/s4Wq37GGpK8BTvbTglRt4LFGGh9i/5dFedlyxR5jvcHS9h9Ty91aJJzYGNyHFIpPQn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258569; c=relaxed/simple;
	bh=dxkBn2TqxvYQA1h/TBTFitGo3ybHyhpnDNbv3O/DLU8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ondy/roEal1Wu4ck5kslPXfyULcUB3j0ZWPFS9+1HwI5GcIOCsK3aFndyx3xhlii5Vm4Jo4rNwEn3RgQWMWQuXkJshHUB0KuNxXBzuLf65r3LPpxKZ5hiK5VhPdaPDnlIJBHcJxJcIty1RXjGH7oqaCqqO//S9G2yQYT9OWGxd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S3vmyOvC; arc=fail smtp.client-ip=52.101.84.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNNYJvBs1oDXyBFdkVUqy8WHfWfjEnnf2r4gU4QtnbyvS/6ATi2pmekwIt9vsmWjgfHwwsNn360TAn546hN5iYZz2D3FYGWHoRQm81xB3qCLNQ+CzHcmYdzbqh7u/jKcBKbRyWKPWmJnABH9RfdY5ZxlIGtb+Yxr9TLyEOqaGBtN8tnsMZp0gqaBnD2np5fGxo5/FP9jFuMaCoOMRRilMV1PmgZ00WiQHFgzvC/jbO5dFzFxM1GlJnw7H9nxbPFAfybuTsbaPWav0H40TcS4vxTXa39X0fXJnEpXdKL4cWXtSLvSqBYlYQAqkO88IMNLy0gzm7hVsU6+bYwcqUDl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjSBWrF3taRgqUj8/m25IriY9CgVSxOQvdmjaF3vDQw=;
 b=JHKoGP9MLNhbVD2rN4xezOIdiw+7SkfPfxK03Y/HqRPc7Ze/vovbXZYSioiPyyonDod0gW4s4ER2YSYHgFIKKCKopRAXYjpWR5xRQmsb9Xmgbv111uUdBA69Ci0NnjO//4LSrrJMPL1YsNwfC1cc0V5+2voi62m5u9FimQEMx2krtORBQQVxdxF+T2akdoKrHG0PeKzNZw7J69ks0bcSWES6CWcxAkuKMyYi80nslg+71pXwFNlc/K4oO7a6qkataEmxtKZbrymRCMZxSW2kXFTKAVle0+QQylt4SzFGBfSFb3XE5Sw6NwR7ibaQASFIX9sdSq6qLv3LOFpMGBiELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjSBWrF3taRgqUj8/m25IriY9CgVSxOQvdmjaF3vDQw=;
 b=S3vmyOvCO7nrg85eiuknstZW6MMJLn2vJCNaGmKVFjWy6COZS9fYsGYk08e21Gpx8WAyus3nu76/dy6azU30z78Rqz4p3Sk+sTmhh4BucFMsUWwSvKwwsoaZSQ/tJMUTQb4OxBE7SG9c5DOqAoVmqM289t8MkweDoBLLp5SlzWjrx1/Maean49XeyHJogR3TXcx4QQKy4aJrZGbIaDaOX7A4r3QRuiQiSVs0o/Hr/Xok9MneK0leYrlwj4x81YmO1D41QeQprUZuAwE/5iy7l7YioURw0qT3Hfs5F/dtgVVTrs8F2vCVBRJu7nJCNGU8JbP/gjbpkrK9Zm/TiONmBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11960.eurprd04.prod.outlook.com (2603:10a6:150:2f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:16:02 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 16:16:02 +0000
Message-ID: <9db77489-4070-4a15-a733-01befbbef0b1@nxp.com>
Date: Mon, 16 Feb 2026 18:20:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_active_state
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-13-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::14) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11960:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a678d5-1a21-4621-750a-08de6d76adde
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NUE4b2lPVEN2b3BiWmszZFlLV0tLMFFSdEFNelFmbEt2M3E4TitmOTNMZ3Jj?=
 =?utf-8?B?eXg0SEdwMS9KWFRWN0NmNjJjaE5KZVd1cEJTYWdxQkFGaU40ejJvR0RwSGNm?=
 =?utf-8?B?YzBpdmEwSXh4RU93ditoQzJxSmJseEtxeEtYNjN0Y1Z6QUN0VjJBSGpUT2F0?=
 =?utf-8?B?L3V1RkNFaThEKytMeCtJdTBrbjJRcGtnNjdESy9tbzRMT1A3MjJ5TGdOUG1h?=
 =?utf-8?B?MTRZUzNLS1VIR0ZSQU9PTlpvbHFpWkc5NUFMdVNuU3hUbDRUMU5uMXpFNzli?=
 =?utf-8?B?dWtnQ2dZdXJYNGNTMGRaTnNGK0hKbWM5NHFNSHB5YTRiRnNPaENtMjlDVTBx?=
 =?utf-8?B?VkR3Q2FoZnRZTEhBY0tVQjg1K0pvSGIwMC9Qem9zTGxSQlZ3YmlEQmM2MW1k?=
 =?utf-8?B?U1ZMMFlvb1B5bVBNcXRibzNmaFBnYkhMN0dpNXhNRHA2d2FkbDBSaUdCbW5i?=
 =?utf-8?B?cHNONi9COVBkbi82dzZLQzIwRUQveWNiaGg3UHQ2Um4yeDNIUGFxOHNXT1RD?=
 =?utf-8?B?blZjMThUZmFkMTNHdnBkbElobWNVaFh6Z2VZazJLS3FxSzE1elpTSEphSld0?=
 =?utf-8?B?L0lMcklISmtpQ0NsTURXMzdFRG1wOEx4L2tvbHVLQzYyeWpqbHNoaVgrSGk5?=
 =?utf-8?B?RnhzNFl5THF3YnlOcmJ0b1UybFdVdlNhR0hDTFlyK2hONjlpeG05WXBiaENG?=
 =?utf-8?B?ZUUzcExONERoNElIWi9XNE5XYmpESXlQS2E0bmthYkZidjJkaVZHQ2Q5bnBC?=
 =?utf-8?B?bkFIa3NEK1hjNnFjV3FJb0dKZm93aFhiSlRFNEgvVG9zdUFyVmJqaC90UHlK?=
 =?utf-8?B?dnZlYVBmTEcvdER0Z281b1IrSm04dHh1dDJ0T2x2Q2F0b211aE5kMkg2S0xv?=
 =?utf-8?B?eXdhQVNiSzFhOUVYVVNPV2E5VGVsVlJXcFhVaTllb2RTTG9haXdISXNTV1B0?=
 =?utf-8?B?MlpEYk1BZVkweFptVEc1dW0zMjliTS9nNStSK1JGVGlaaHU4UWpZcXhvT0h3?=
 =?utf-8?B?L2dRb1NITGNHRkxYUXVNVGxXemhUMzJzWmE5eHRmbURRSkNscU5yM0xPdUc4?=
 =?utf-8?B?Y1BJNDJxN29LUmE1dWZXNWpML21QYytRRWhlbEppVEYvb3JHUzZDZjk4OWk1?=
 =?utf-8?B?OEszb1UxZUdMMVVKOFhVVENOci85d1JEUUNaZG5ROTQ4Rm9LSnpRZks3Tk90?=
 =?utf-8?B?WTlrY3Y5NXN1Q3JjRk4rQjZBVzZySmpoT3JIQmt1MWx3aklmeFZ1N3Bvcm1M?=
 =?utf-8?B?LytDdnZ3VGFLRG5MYm1XdVl3Rkl4Ti9rMWV2NE9aODZXTDQraEVwTVF0OWwx?=
 =?utf-8?B?ZnloYzJ5cDlPajlLOGcwSlZGK0ZXbXplY0hZTXhVME1BWGlBWFpWVFU2Y2FU?=
 =?utf-8?B?QkhFMlMyRkRJQ2tZQ2Y5RllFUVNmNkpMMmJKaHhrODRKT2FUT01jRjBvN0dz?=
 =?utf-8?B?cGtXdUJSWCtaVnk1bzNKWHhPbVlSaS84NlpVNU9OWmU5OWdlelp0VnB6cWRN?=
 =?utf-8?B?SGpheUwybEZEY3pyTlVtVzROQnN5U2txazFuYk9ocHBTL1JHZmRMMm5qUU9i?=
 =?utf-8?B?NHR5OU9DZ00yWnAxRys3ZEV5NC9PRU5kMThPZStZTjlzTEtXMjB0RkdJRXBp?=
 =?utf-8?B?Rlk5OEJraTFBblNQSVdsNnBIVHhGKzJoZWlNeVlCQ1NNZU9HTTRKWEl4ekkx?=
 =?utf-8?B?MDh0MGhtZU55M2Nud001MFphaVFoY0FvRUFXb1pVaEJWK3lzUnc2ME1zNnlX?=
 =?utf-8?B?TlYrcWtiUzdBdjBCZ0ZMOEVZUHFHSGx6MlRiSWpQcDVLU0N2SkNURE1TbGM0?=
 =?utf-8?B?ZUxGdzUrekxvdGJ4M08zTGEvWFhBRnYrYktpaS9ZcHNhQXdqNDh1Zk4rWDJV?=
 =?utf-8?B?aytUYTVWTVpYTGtWb21tVVdnUkVEazJURk1WT2VweXhvamtPSEpuR3UrOXZC?=
 =?utf-8?B?bnVsZnBYTnJzcXRoOXZnNy90dG81ekJXL25CWGRpSFFyVEw5djhJWVF4STR0?=
 =?utf-8?B?bXFpcEc5TE54T1dybldrTTJpRlJOY0ZQSjVxQkF2bW9zWGlhN3M5NGVPUGtH?=
 =?utf-8?B?WHRrZ0w0TFprc1R4Z0JFakwzWHplTFQ0ODBtRUNzVGJ3M0c4VWVzUzFiNmdG?=
 =?utf-8?B?ZkN0d01qYTN0cklVcEd5Zk5yWDFZZFl3bTB6b0wwdzk1UjVrb0RvMER3VjJo?=
 =?utf-8?Q?KaR3kLJI3Yb4Voga3ZwqZVw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UXcrc0E5ODNaT3cyVTRLdEpUNHRvVzQ4WnNLOGd4aVIrdmR5MGY5eS9vMlFY?=
 =?utf-8?B?OVE1dS9UUFJoWW9WdkdSbE1MemowbjhndlRvRU1NeG5yRWFBUVE2TGlhMndj?=
 =?utf-8?B?NFJjMkdrb3gwQTJMa2xvRi9Ubit6dmFBRnc4dUtjMnBUZE9vOWhtZjJHNEds?=
 =?utf-8?B?L21KMVQxTHlyY1Y3c3o5akpkaFQwN3lhS1JCWEVWejNBUUZXTXNQSGNra3lZ?=
 =?utf-8?B?aDA1L2NtUklCVGIwdUYrNHRQL1FaS3cvMy9DdTNtcmdCcFBkTnd5bFlrZzdR?=
 =?utf-8?B?Mk9zNXUybTBOdHdZVjQ3Ry9NL29CRnY3em9Qamc3djF1eXhmYnJWZ1hueWg0?=
 =?utf-8?B?dmM3QnNYeTZBN3o0bmduT3l5aTJkdzhaSUcxYkw5WEVlNVhCNHo2NEZ1N2hs?=
 =?utf-8?B?RXhRRE5pUFY2L1dtZXBTa1l1Ym1PRVJsNG8yTGJiRVBlcG5CUlVwQnZmeHI5?=
 =?utf-8?B?S2ZRNGJ0UjMrbUxMM2d0UkU3VlBvL0RtUFdjY2dLZUpmVzdoOUhZdG11SUIr?=
 =?utf-8?B?eldNbmJrMStUeGkzMHJ2VnRkNDM0VDgxTUliR3JGbWJmOUJLQ0Y0Y21zaENK?=
 =?utf-8?B?QXlLYko2WEtId2tQVkhJSzlURU5YWXpFWjd2UGRKWDJDdWplcFFpVTUzR3VI?=
 =?utf-8?B?TGpMakVjRFM5MGx3OUtuQlB5SFp6L3N1YmwyLzQ0YktvNVVteFB1Y0xwVnhn?=
 =?utf-8?B?M3VTaEZZNCtkbWwreWtPbS9qc1FPQ203TVlZcjBLandHMnhpeFlHVEVyRlZU?=
 =?utf-8?B?MDNzVmRSdDZINFBjUGYxWEg2T0grMHV4b1MrMlpMUXYyMGc5VVkvM0xWZ0No?=
 =?utf-8?B?YjB3ODBYMUNvRStHVDlQTUF4VjExNmllajZkQTJjb01YN3NhWE1GY0o1RTNZ?=
 =?utf-8?B?c211dmFwVzJHTEhMSGtuVjh6L3R1YWJJZWtvNDNzWGRqS3lrdHpmbHB2bjRP?=
 =?utf-8?B?Z2ZZYUk2TlQvd1VjS1dyK25ESlZFaHppemZoT1ZNcTkzQmlGVm5nZXRweW9p?=
 =?utf-8?B?NlYxU2REcjZDeGFWL3JRNG4xL2tkRm1HTUFpbXErZ3F1NGtDSVBnVnFkR25S?=
 =?utf-8?B?Q09KQ1dwTnI4am5xWmZMWSs5Q2lkblBpaFhIZzBGV2Y5SVhpQ0JTajBzeksv?=
 =?utf-8?B?ODZmcGZpRStGT0tnYllmd2tPYkxEM0wycHpjWlNXcjBsMWJoVDdPNnpjbUMr?=
 =?utf-8?B?WGZCRHdhRFNZRGFSR0xQbjlLYU1SajJDNm5UYlFxbUdja20xS0x5SUg5bjc4?=
 =?utf-8?B?SnF3dzFoa080ZFA4M2tuNWNNNGhZaEFyL0JtT1dadU1aWEw1Z09PQzlBWURr?=
 =?utf-8?B?ejVuZFFqaHNsSnYyenQ2NkJhYkVrTVZ1Q3RRQnRvL2NPVnNxR3c3YTBHNG5q?=
 =?utf-8?B?MnA4QnBtRXdDbUI2cFlnckVXaWQ1aWFPTGFWRFdDZTJyZGxnMFlsRE4vUElk?=
 =?utf-8?B?RDcyMUJpTHo4bHJsdCsxRWVrc09LR09OME84ZGl3WlFvblRtbFZQekJVVUFG?=
 =?utf-8?B?QVJzbjZJL3J1bW5wSnQ3WmJjTHRZcUpUNWhFYk9oZk5oMXVlVDhFZ3ZZdmV4?=
 =?utf-8?B?UmpDOUkyMVd4ODRYbXB4ZGp4NUVRS3l3K1UydGE4eVdHZVQ1SEtmc0MyeGNL?=
 =?utf-8?B?eFJGMGhzZDBleTVlS3VQZ1FlK282Zk1KbVMrV0VWYTRtWjBnZTNKUllNK21v?=
 =?utf-8?B?Z3JKRHpmOTVXdk1uNEdOMUNBUjNRY1FjL1JMWEt2MkVvS0xTWVFpNGhqbzBW?=
 =?utf-8?B?NDVrS1kxUThEa1pOWDJKdWovb3RzWUpXZ2hlWHdmNW1FY0JwRFRkenhoOFl4?=
 =?utf-8?B?MENmeUtlV09XaXVZNW43dWJrZnFFRGJ5UUhsc1I1cldPcFB1Zk9QT2YrbW1M?=
 =?utf-8?B?dlVQUklMNDh4OVVDNmRpZnA1MGpjN0FCMTgzbm5PaUpWYytCR3VEdVFSVGtP?=
 =?utf-8?B?aUxMWVNCbXVXa0YwM2J4OVRXdzZ3RzVpbkhVODhkRWdRcVVpQ2VDeVdxVmhQ?=
 =?utf-8?B?ZGsvWUV4eFRYaWIvRzRYcEY0MC9POXdmeUlqcW04UVpoamtzZkcvazhzcWNN?=
 =?utf-8?B?SlB4bm5laEdrRXJ2b3lvZEdDdWx4TWJCYjNBWFZkOXRPRENmWWxjVndJaE9F?=
 =?utf-8?B?RHViUG9oMkRhMjNybGNydC82WTNFcUExNmorZ0lCbVM2NGZGb1BJTzBrZ3NR?=
 =?utf-8?B?RktETWtpMllpNDFzbXBYUUZZMzZHMDY3UkY0VnUwRDNrR0t3U1piVCt2YWhF?=
 =?utf-8?B?WXhuT3NFbGRhSkZ6aldubjd4ZTlrUnkvSFhCYWRsYWpHYWdlMmxaUUlpbm94?=
 =?utf-8?B?K0pmMjM1aHIzNk53TzRoYUdQNUNzNTd3UWtrV2xvZXhFRzl5OWdtQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a678d5-1a21-4621-750a-08de6d76adde
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:16:02.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrBya4CjkOD6wRoUs9XfH6/whzFNr1uIYytVCRLzZiZEFWRXWe4z6PBzKl+KKc3FMb+b2H3QLyMmeHMiL7xOTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11960
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52921-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 9EC32146030
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
> take struct v4l2_subdev_client_info pointer as an argument.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   include/media/v4l2-subdev.h | 49 ++++++++++++++++++++++++++++---------
>   1 file changed, 38 insertions(+), 11 deletions(-)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 20cf0560c7f9..b22b05534447 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1912,6 +1912,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>                  __result;                                               \
>          })
>
> +#define v4l2_subdev_call_waive_fourth(first, second, third, fourth, rest...) \

waive is not very suggestive, maybe use drop instead?

Regards,

Mirela

> +       v4l2_subdev_call(first, second, third, ##rest)
> +
> +#define __v4l2_subdev_call_state_active(call, sd, o, f, args...) \
> +       ({                                                              \
> +               int __result;                                           \
> +               struct v4l2_subdev_state *state;                        \
> +               state = v4l2_subdev_get_unlocked_active_state(sd);      \
> +               if (state)                                              \
> +                       v4l2_subdev_lock_state(state);                  \
> +               __result = call(sd, o, f, NULL, state, ##args);         \
> +               if (state)                                              \
> +                       v4l2_subdev_unlock_state(state);                \
> +               __result;                                               \
> +       })
> +
>   /**
>    * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>    *                                takes state as a parameter, passing the
> @@ -1930,17 +1946,28 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>    * active state, lock it before calling the op and unlock it after the call.
>    */
>   #define v4l2_subdev_call_state_active(sd, o, f, args...)               \
> -       ({                                                              \
> -               int __result;                                           \
> -               struct v4l2_subdev_state *state;                        \
> -               state = v4l2_subdev_get_unlocked_active_state(sd);      \
> -               if (state)                                              \
> -                       v4l2_subdev_lock_state(state);                  \
> -               __result = v4l2_subdev_call(sd, o, f, state, ##args);   \
> -               if (state)                                              \
> -                       v4l2_subdev_unlock_state(state);                \
> -               __result;                                               \
> -       })
> +       __v4l2_subdev_call_state_active(v4l2_subdev_call_waive_fourth,  \
> +                                       sd, o, f, ##args)
> +
> +/**
> + * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
> + *                                   takes state as a parameter, passing the
> + *                                   subdev its active state.
> + *
> + * @sd: pointer to the &struct v4l2_subdev
> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> + *     Each element there groups a set of callbacks functions.
> + * @f: callback function to be called.
> + *     The callback functions are defined in groups, according to
> + *     each element at &struct v4l2_subdev_ops.
> + * @args: arguments for @f.
> + *
> + * This macro is just as v4l2_subdev_call_state_active(), with the exception
> + * that it passes NULL as the client info to sub-device ops that need it
> + * (currently pad ops get_fmt, set_fmt, get_selection and set_selection).
> + */
> +#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)            \
> +       __v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
>
>   /**
>    * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> --
> 2.47.3
>

