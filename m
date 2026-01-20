Return-Path: <linux-media+bounces-51143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEbRCRnbb2n8RwAAu9opvQ
	(envelope-from <linux-media+bounces-51143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 20:44:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 839934AAAF
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 20:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 446C7A2863A
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4773A33D505;
	Tue, 20 Jan 2026 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h5soSAEL"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6E33B6D5;
	Tue, 20 Jan 2026 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928411; cv=fail; b=WQ5LHBndVzMY+bD99IcOXfNlJzO5GV6wTYJEjJe4k9fQRzuYD80QbXtG40cjAmEvZki+elLvm/yVpk4Gw/nTLAj79vi99Es2R5vve0sCva5Y5W6y3JvBHfXMzP2pAKogBR5wSsVfwXv4USABGiodLc5+bUnsp80j09e6RMnYHZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928411; c=relaxed/simple;
	bh=ZvOYJxMXHR6VJoqtl33AbLvELM5GDN6cpMPpOsBA8Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WesXSoSY3NSzLsltap98Kp9k8lSwcguegVqTfc9kC4HPGBfYcZz4USoKUTdUqahpEgheBcKl/8lMaTvYx9ItlOZ8OAZ0cZkbGlAkbEVJ7hTrY7OguJpVb3xuHrJr4U+QwmtXIIxDDcvawvyjAs7Y/kNSU6BG/v+U+N2wm+58vK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h5soSAEL; arc=fail smtp.client-ip=52.101.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n069s1djt8V047I4N/mp4nwfHVpejtF0RaCT3RsNjTqTn5+1ub/CYkaPr78ba5Nu2PfZmvY03u5oNmALYAR9WSMakWcfyaiuxeeM5Tm8vvnZ6ZRZ+KRJct8JXV/maRpIU/ptTafvlXj5PTO+khs3T0cuAkRvIiOlzAXLK+KgPmC+Tn7n/pg0qSn5HFicn/AuWf1ID6FnCBm69Ngcc6EiE/drxXk+Py8ouaPK1c+z6fRiAa7uysWKUDK0PeVgIKthdFqWRbQWl9Hjj7EzZC3bWgZqiTznr/+Mo+/ktM4iWKvJNYE/zqg8d4fmnZU7bBYpuXFacy+FUO7VJrf82djzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnTkjcrLdIvff7zfVxLrAnu1nObdwt/iZtg17ii8hUo=;
 b=N1pDjDUNqoo4zVkTM7KH0WYKHlr8O2h/yuY+vu9/xo2e0tnr434REh87rY8ZqWRjrHmSIpH2iT7JooDP/ImfUdSkr78SwHsYEpffCniNgt2Cdsmv9MDUCn9RWn1kso8yj3iU0eJfDT0kR7P+dhkkHXxb5XKmOY/2qP850bBNA1fNouSfjhsJc0WlQgGeHm+fkYGjeXKv4cVTsxe+32dS4txMS1M8xmmlBPbr6LvNpg5t2mnCRA9pRTBcJ/C3SR5ooC5g+d0fdITwjgNX2yxnyPlkU5NUO0XEbaFWlMIjuarWjn9Q1D4ekFHjunoYJz6wywkkoBqd2jfPCMRv4bJpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnTkjcrLdIvff7zfVxLrAnu1nObdwt/iZtg17ii8hUo=;
 b=h5soSAELj4IUJwkIC78VhARV9gNvjWXMGEdyLVIVnhoj41J6YjVfYmQ5OHaaOSt92du49y+Ef95Qo6+iF0B7CC8e6nyPbOaJ0JJAzgLFtTvKrIv0mOcSdtvQZrTKf1+bERHXhucl5ZVuGsEuYur138oRynH/4Wbq/77stvHmXbXVaTatnFUiC2Wy/aKAhYgbFGEQRPqczLSO7jAN+onH6Q1UU8j5ydlyL50gNnlFh9bBZN8iQDFWn627pHrOvPfAaOHRV1LK4UlmOns84OTT6p5+5AMgip6Y2K58vIHPjAPcIwYaTEPvs2w3VkR/AvOvexCd0aUSnte/+mt2YXZ7gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:00:04 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:00:04 +0000
Date: Tue, 20 Jan 2026 11:59:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
Message-ID: <aW+0i3nyeSGCzKf9@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
 <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
X-ClientProxiedBy: PH7PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:510:325::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: c53b3989-e92d-4967-1d18-08de58455b9d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?nd6h2+4Jy4S1W+mlOLZDXvBokDVQXFBOirxSBkWtmBGOmpGmgHlmBOeQSS75?=
 =?us-ascii?Q?nEN9Hi6KrJvN7Hb3xPzUc+x7EUmPr5MGYmsgIO5rmbNB8d603Zge7u8FWkUB?=
 =?us-ascii?Q?NgEkT6gg3ofs/QYF1ged1JM5Gyemoir9tl0YFO4qWSdgd91UsJQpy2rlOpuf?=
 =?us-ascii?Q?S7lGMQr00WnZpz2q4Q6oL0d1mJO09HImTR/qI35PBSh2ls0nBYLLMa3bw87Y?=
 =?us-ascii?Q?1nS+zVNB5eOyr3ROfm6hZ9HVHvsz0oWoPefoCkrS+g3txF59R+/iadEFOsHN?=
 =?us-ascii?Q?2dSCmP4hzlx1+C1zLM8hrBWIpmAxYWetU+eG3IyrOQQWEjfU4cDUqbCJCzFv?=
 =?us-ascii?Q?qfTiVudKMBYtIRZyiLEFmaTipjRnYhoAqC6dAMPI65FP+VrJY5cYx1JgSJk4?=
 =?us-ascii?Q?vBB8LZNU0BiG7T4LDq5XQWxGlPrhxqh2NoTo38s/DGv/wCw7YAvCGBSgPat6?=
 =?us-ascii?Q?lxXcyqOD/PvWHamZEHCoTCw1r1R0PJ4FQ6Uu2/6zkcS+PfBr3qlzPHfmPzbv?=
 =?us-ascii?Q?dbSrgLHXOEfQqrxi5vGOqwpwH/eOsJSoyey26e9bUDWe894igx7qZH55z346?=
 =?us-ascii?Q?D8GfgyV9vOUjUn5DhoewC+SuAmA7ffky08XES3BkNB/CJ4QfiF5th0BhQeVT?=
 =?us-ascii?Q?oJr+lNGkAI4//Lq4W72Wp5qEMcuzDl1zAXyKSSZzx7vdPKVVxh3hHkMDqZFf?=
 =?us-ascii?Q?j2WIpxhynGm6esJ5iOQjDGrUzZdLMuaG6uaGT+V5nDnCAwQX81EGckYWTiRu?=
 =?us-ascii?Q?bjmZI/9t5i5d5lCdWFO0s/g9C4gtn6mbSxs3KAsLTaaTrD+UfiQHUKqWXCWv?=
 =?us-ascii?Q?g/VeYUp9i0S/EgSk+rzYKNQnDQcd3U/m2RitWu5N+KqhBB3J9K0R30mtwVXb?=
 =?us-ascii?Q?MvZ+tKLWVNpqGt8I30ZQqKvLvi9966/2AJzqbHzzpgeSq/9ZN5EJLkvsh7UD?=
 =?us-ascii?Q?f8iLIzMMerLuDvzZAlK/+p9FF25dWQ1D3BzCurEYz2YVELqvk6WIo02ReZ1e?=
 =?us-ascii?Q?oEHATEo7/hefzh4jBJ7bKAi8Tcdn8rOBoan5bewS7Ig3Xyg2VakB6JVG9o3H?=
 =?us-ascii?Q?beGYr+NtAZzgYGrBA3BisME2twt6hWRlqJIbPXKbHCYzkVjNI9nNWaGObLm9?=
 =?us-ascii?Q?KQ1RymYq6lYl1tUyXdj4npm347ccTpIR9neXoNdBrrB+f9EocXF8apLpf7+Q?=
 =?us-ascii?Q?9ZloVrjTdl3CLiqn85tPQkEKqWQ98R/IN25CpaZfadtRFz2YUEHjdo2LQQ2P?=
 =?us-ascii?Q?cT2ZNvbkv9T9hcMo2GKVf79romGCl9Np42fIuFhDU4ClQFqVWrjxF+oNMTGr?=
 =?us-ascii?Q?Q929XGW6CJowzNs5+wUHyeNFCp38VDh2EjgZKZ0ccTNZe6WMlMUu21AiEXOh?=
 =?us-ascii?Q?EdQHdMEvepXylAhWkaI38Sv2cEdwlld6NiO/FEqPrDYTFwCH7woT1/PKKFyo?=
 =?us-ascii?Q?cSvrkyb4uXMQB9oOnzqiFTuPIvroSI+6/IxNlK4EKMPd6D3oStxwsrpY0CMY?=
 =?us-ascii?Q?9HwgVAWjsGKshvGuofLIWzuuPIk1AfOq/iVHaIjQwuog98NbhePpp0zKK8+R?=
 =?us-ascii?Q?NxHBC0FedoVFX3JGkRbuh/wStN3RBjUTMq275bp1nfR01SEkh8SlVjJH0umc?=
 =?us-ascii?Q?mODWUvck3yNHj0VnYo+ssMg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/25a6jxc68cmHthXm2NGBoxt2r0qWPMJhqOX0P36bzw+t0mzK7NfQvhn30Wc?=
 =?us-ascii?Q?1SXqY65dhXvW6jzhxKmnD1V2PqvcVA0Pw62UC64NiEsC1KjaO6hOyH5fk1Ma?=
 =?us-ascii?Q?pGcSIlNEs4R8fRNLynzhMMSCZKz5Ng4Evn/N61UoK4cm5R4fTvBU07cEcyVV?=
 =?us-ascii?Q?jsRiMPrg3cR5PuU1mF+EPy/YvoWD8XfAttdm6ycrB/KBYrZnENvXXM9bXv8v?=
 =?us-ascii?Q?73IbXaxcHenlPQrUca9SNrPbMzHbGIsVPWwwG3G951Mdk9zFGmqj2y5NJeRe?=
 =?us-ascii?Q?0a83Z3bsOPSoISJqHWn+26FTcO786gMTVFbkkTnsVfImZsqM2EvogQJq5VVR?=
 =?us-ascii?Q?YyfzC+x2tNCI1/I4Y0rLP8R1yUYvix6DlYxOStoCKdQhSppoJFjqR8mqybcK?=
 =?us-ascii?Q?JtnqeGYUJMDHDnsu86YJ6JA+JABQv8TqrgdSJLpvsLzwbeEvU242z+zap8MV?=
 =?us-ascii?Q?EYIuzwtXVfMaXy8qsftwRZ5pLK/aHEYptkweL9ub+BIK85GNwJScWFZAFSoR?=
 =?us-ascii?Q?JzUgCT5zzLaTLki/Kpvb0uYRxVd7XUjVRisL079E96v5HRdm/EkIPC9r3K+F?=
 =?us-ascii?Q?8mQRn3hGqF8aorjrmjAQW6k03FH4MpP//8wr5NgCPP5PLblh8udtRLrOGumv?=
 =?us-ascii?Q?gfN1Jr1MhyIZoDCQNf2rTHm2xVC/SpAdXGstzpvZCibXMCpzW/mcaPB4wsby?=
 =?us-ascii?Q?0b/fKpqugJYxAtYhAXUtxi6pyJS22iJTUpq3yfWMZLteOch1byiN5jTzi1Bu?=
 =?us-ascii?Q?h1HkLf8UAK1Xi8PdtoXy9LR+no151NN5xkI9hxQztuNQPEAihlpCciB1Cbwr?=
 =?us-ascii?Q?DUvJEJtnmTOn7wXxet4yOFkZUVhhRyOSAmit4rCq/UB7fXCyV4lFUqWMuhX/?=
 =?us-ascii?Q?q0+lUbMpGNUuq5x8gDPvz2j7OMo1er2bP/LA88urpUW71jVdL7MNIEZkUL6l?=
 =?us-ascii?Q?EqjprfRUySqGdpVmg3fCr2jtsOCUoJMx9LqJXC88ZgMrR/CWSXTIcjB9h21P?=
 =?us-ascii?Q?v5kUPedUJl7pnltldAYyVwL5yI8XrKob+TaKfmzzlUdMohW1gS27IyWgojDF?=
 =?us-ascii?Q?ZmBWYS8QBYTl4h1S/fOtihCYa3i4Rt2iYYHcUtGwmiq42kNg16R12n6F9XKH?=
 =?us-ascii?Q?SpTGEnZexll1tSEZxPGVgeNzN0CIVh3LUCbZdbjtB29elICHjG9kHJldJ72d?=
 =?us-ascii?Q?2ouiWu0xc+hpUnltXyaa9KK6Ch5nxggqyLfh5Yk7BTSEJ9g2VWpK+cznoljS?=
 =?us-ascii?Q?pQJ7dG05Ws1aFihplVQQVAOg4F4d9+g3p+Mh11alhCotvjmdk/idd/zkx2eS?=
 =?us-ascii?Q?55y3K9db5OJupzXquuZQb3O5dMQm0kMThTUcy2CpUbgVKrfaXqPTEdLf/89W?=
 =?us-ascii?Q?kxpDQfczskL8aYu9w2hx0JgqWEvq1Qs07KzmlFRF+aw+jlWTphzgZhF97kaR?=
 =?us-ascii?Q?s4g0jt9qLnjEmXi3RbIWGftuBqKzaVFexq+ZvFw7yMTq09xgcBQ4x+jelFOY?=
 =?us-ascii?Q?VS8YtzOLeLyhDlDfASj+6QB3lxehuE8Ewe0suS06hoz00KXKl1whq9wcqUy9?=
 =?us-ascii?Q?s0fr4eEtXdtMTGgjdGq/nYay5uJpk97X4daNToi2WLFK219EgJY5NmRmoShG?=
 =?us-ascii?Q?rOW38qgojmr0KTmzcsSqIx3umNlGmAZfwDw2lXX7tOfG8vcQ4azZH1IBOnir?=
 =?us-ascii?Q?AmozncaMXkVu4r/c2fbUYWVjRwk34w4nOr6fY1IXC0CL+m4r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53b3989-e92d-4967-1d18-08de58455b9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:00:04.8618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqp3mmuzd2DE+7Hj2Di5gjub0x3iL5DVLKiHbIKjggT5Giz3Slpmny7HRqz+YbMcBkmUfbBP0cB1xH/1UjYicw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51143-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,nxp.com:email,nxp.com:dkim,intel.com:email,linaro.org:email,samsung.com:email,wolfvision.net:email]
X-Rspamd-Queue-Id: 839934AAAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 01:22:28PM +0100, Michael Riesch wrote:
> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> one input port and one output port. It receives the data with the
> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>
> Add a V4L2 subdevice driver for this unit.
>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  MAINTAINERS                                      |   1 +
>  drivers/media/platform/synopsys/Kconfig          |  18 +
>  drivers/media/platform/synopsys/Makefile         |   2 +
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 726 +++++++++++++++++++++++
>  4 files changed, 747 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d1589feaf95..62ccdc72384d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25369,6 +25369,7 @@ M:	Michael Riesch <michael.riesch@collabora.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +F:	drivers/media/platform/synopsys/dw-mipi-csi2rx.c
>
>  SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>  M:	Jaehoon Chung <jh80.chung@samsung.com>
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> index 4fd521f78425..e798ec00b189 100644
> --- a/drivers/media/platform/synopsys/Kconfig
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -1,3 +1,21 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> +
> +config VIDEO_DW_MIPI_CSI2RX
> +	tristate "Synopsys DesignWare MIPI CSI-2 Receiver"
> +	depends on VIDEO_DEV
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> +	  one input port and one output port. It receives the data with the
> +	  help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> +	  the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
> +	  This is a driver for this unit.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called dw-mipi-csi2rx.
> diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
> index 3b12c574dd67..e0232ee23304 100644
> --- a/drivers/media/platform/synopsys/Makefile
> +++ b/drivers/media/platform/synopsys/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += hdmirx/
> +
> +obj-$(CONFIG_VIDEO_DW_MIPI_CSI2RX) += dw-mipi-csi2rx.o
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> new file mode 100644
> index 000000000000..29119a1a8d38
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -0,0 +1,726 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synopsys DesignWare MIPI CSI-2 Receiver Driver
> + *
> + * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + * Copyright (C) 2026 Collabora, Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define DW_MIPI_CSI2RX_N_LANES		0x04
> +#define DW_MIPI_CSI2RX_RESETN		0x10
> +#define DW_MIPI_CSI2RX_PHY_STATE	0x14
> +#define DW_MIPI_CSI2RX_ERR1		0x20
> +#define DW_MIPI_CSI2RX_ERR2		0x24
> +#define DW_MIPI_CSI2RX_MSK1		0x28
> +#define DW_MIPI_CSI2RX_MSK2		0x2c
> +#define DW_MIPI_CSI2RX_CONTROL		0x40
> +
> +#define SW_CPHY_EN(x)		((x) << 0)
> +#define SW_DSI_EN(x)		((x) << 4)
> +#define SW_DATATYPE_FS(x)	((x) << 8)
> +#define SW_DATATYPE_FE(x)	((x) << 14)
> +#define SW_DATATYPE_LS(x)	((x) << 20)
> +#define SW_DATATYPE_LE(x)	((x) << 26)
> +
> +#define DW_MIPI_CSI2RX_CLKS_MAX	1
> +
> +enum {
> +	DW_MIPI_CSI2RX_PAD_SINK,
> +	DW_MIPI_CSI2RX_PAD_SRC,
> +	DW_MIPI_CSI2RX_PAD_MAX,
> +};
> +
> +struct dw_mipi_csi2rx_format {
> +	u32 code;
> +	u8 depth;
> +	u8 csi_dt;
> +};
> +
> +struct dw_mipi_csi2rx_device {
> +	struct device *dev;
> +
> +	void __iomem *base_addr;
> +	struct clk_bulk_data *clks;
> +	unsigned int clks_num;
> +	struct phy *phy;
> +	struct reset_control *reset;
> +
> +	const struct dw_mipi_csi2rx_format *formats;
> +	unsigned int formats_num;
> +
> +	struct media_pad pads[DW_MIPI_CSI2RX_PAD_MAX];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev sd;
> +
> +	enum v4l2_mbus_type bus_type;
> +	u32 lanes_num;
> +};
> +
> +static const struct v4l2_mbus_framefmt default_format = {
> +	.width = 3840,
> +	.height = 2160,
> +	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_RAW,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +	.xfer_func = V4L2_XFER_FUNC_NONE,
> +};
> +
> +static const struct dw_mipi_csi2rx_format formats[] = {
> +	/* YUV formats */
> +	{
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.depth = 24,
> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.depth = 24,
> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> +	},
> +	/* Bayer formats */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +};
> +
> +static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
> +}
> +
> +static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
> +					unsigned int addr, u32 val)
> +{
> +	writel(val, csi2->base_addr + addr);
> +}
> +
> +static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
> +				      unsigned int addr)
> +{
> +	return readl(csi2->base_addr + addr);
> +}
> +
> +static const struct dw_mipi_csi2rx_format *
> +dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
> +{
> +	WARN_ON(csi2->formats_num == 0);
> +
> +	for (unsigned int i = 0; i < csi2->formats_num; i++) {
> +		const struct dw_mipi_csi2rx_format *format = &csi2->formats[i];
> +
> +		if (format->code == mbus_code)
> +			return format;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct media_pad *source_pad;
> +	union phy_configure_opts opts;
> +	u32 lanes = csi2->lanes_num;
> +	u32 control = 0;
> +	s64 link_freq;
> +	int ret;
> +
> +	if (lanes < 1 || lanes > 4)
> +		return -EINVAL;
> +
> +	source_pad = media_pad_remote_pad_unique(
> +		&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(source_pad))
> +		return PTR_ERR(source_pad);
> +
> +	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
> +	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
> +	if (link_freq < 0)
> +		return link_freq;
> +
> +	switch (csi2->bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
> +		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> +
> +		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
> +								 lanes, cfg);
> +		if (ret)
> +			return ret;
> +
> +		ret = phy_set_mode(csi2->phy, PHY_MODE_MIPI_DPHY);
> +		if (ret)
> +			return ret;
> +
> +		ret = phy_configure(csi2->phy, &opts);
> +		if (ret)
> +			return ret;
> +
> +		control |= SW_CPHY_EN(0);
> +		break;
> +
> +	case V4L2_MBUS_CSI2_CPHY:
> +		/* TODO: implement CPHY configuration */
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
> +		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
> +
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
> +
> +	return phy_power_on(csi2->phy);
> +}
> +
> +static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	phy_power_off(csi2->phy);
> +
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
> +}
> +
> +static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static int
> +dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +
> +	switch (code->pad) {
> +	case DW_MIPI_CSI2RX_PAD_SRC:
> +		const struct v4l2_mbus_framefmt *sink_fmt;
> +
> +		if (code->index)
> +			return -EINVAL;
> +
> +		sink_fmt = v4l2_subdev_state_get_format(
> +			sd_state, DW_MIPI_CSI2RX_PAD_SINK);
> +		code->code = sink_fmt->code;
> +
> +		return 0;
> +	case DW_MIPI_CSI2RX_PAD_SINK:
> +		if (code->index > csi2->formats_num)
> +			return -EINVAL;
> +
> +		code->code = csi2->formats[code->index].code;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_format *format)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	const struct dw_mipi_csi2rx_format *fmt;
> +	struct v4l2_mbus_framefmt *sink, *src;
> +
> +	/* the format on the source pad always matches the sink pad */
> +	if (format->pad == DW_MIPI_CSI2RX_PAD_SRC)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	fmt = dw_mipi_csi2rx_find_format(csi2, format->format.code);
> +	if (!fmt)
> +		format->format = default_format;
> +
> +	*sink = format->format;
> +
> +	/* propagate the format to the source pad */
> +	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!src)
> +		return -EINVAL;
> +
> +	*src = *sink;
> +
> +	return 0;
> +}
> +
> +static int dw_mipi_csi2rx_set_routing(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      enum v4l2_subdev_format_whence which,
> +				      struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&default_format);
> +}
> +
> +static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
> +					 struct v4l2_subdev_state *state,
> +					 u32 pad, u64 streams_mask)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *sink_pad, *remote_pad;
> +	struct device *dev = csi2->dev;
> +	u64 mask;
> +	int ret;
> +
> +	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
> +	remote_pad = media_pad_remote_pad_first(sink_pad);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
> +					       DW_MIPI_CSI2RX_PAD_SRC,
> +					       &streams_mask);
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto err;
> +
> +	ret = dw_mipi_csi2rx_start(csi2);
> +	if (ret) {
> +		dev_err(dev, "failed to enable CSI hardware\n");
> +		goto err_pm_runtime_put;
> +	}
> +
> +	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
> +	if (ret)
> +		goto err_csi_stop;
> +
> +	return 0;
> +
> +err_csi_stop:
> +	dw_mipi_csi2rx_stop(csi2);
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +err:
> +	return ret;
> +}
> +
> +static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  u32 pad, u64 streams_mask)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *sink_pad, *remote_pad;
> +	struct device *dev = csi2->dev;
> +	u64 mask;
> +	int ret;
> +
> +	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
> +	remote_pad = media_pad_remote_pad_first(sink_pad);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
> +					       DW_MIPI_CSI2RX_PAD_SRC,
> +					       &streams_mask);
> +
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +
> +	dw_mipi_csi2rx_stop(csi2);
> +
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
> +	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = dw_mipi_csi2rx_set_fmt,
> +	.set_routing = dw_mipi_csi2rx_set_routing,
> +	.enable_streams = dw_mipi_csi2rx_enable_streams,
> +	.disable_streams = dw_mipi_csi2rx_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops dw_mipi_csi2rx_ops = {
> +	.pad = &dw_mipi_csi2rx_pad_ops,
> +};
> +
> +static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = DW_MIPI_CSI2RX_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = DW_MIPI_CSI2RX_PAD_SRC,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.len_routes = ARRAY_SIZE(routes),
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +						&default_format);
> +}
> +
> +static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
> +	.init_state = dw_mipi_csi2rx_init_state,
> +};
> +
> +static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
> +					 struct v4l2_subdev *sd,
> +					 struct v4l2_async_connection *asd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 =
> +		container_of(notifier, struct dw_mipi_csi2rx_device, notifier);
> +	struct media_pad *sink_pad = &csi2->pads[DW_MIPI_CSI2RX_PAD_SINK];
> +	int ret;
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
> +					      MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		dev_err(csi2->dev, "failed to link source pad of %s\n",
> +			sd->name);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations dw_mipi_csi2rx_notifier_ops = {
> +	.bound = dw_mipi_csi2rx_notifier_bound,
> +};
> +
> +static int dw_mipi_csi2rx_register_notifier(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct v4l2_async_connection *asd;
> +	struct v4l2_async_notifier *ntf = &csi2->notifier;
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev *sd = &csi2->sd;
> +	struct device *dev = csi2->dev;
> +	int ret;
> +
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!ep)
> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
> +
> +	vep.bus_type = V4L2_MBUS_UNKNOWN;
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
> +
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> +	    vep.bus_type != V4L2_MBUS_CSI2_CPHY)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid bus type of endpoint\n");
> +
> +	csi2->bus_type = vep.bus_type;
> +	csi2->lanes_num = vep.bus.mipi_csi2.num_data_lanes;
> +
> +	v4l2_async_subdev_nf_init(ntf, sd);
> +	ntf->ops = &dw_mipi_csi2rx_notifier_ops;
> +
> +	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto err_nf_cleanup;
> +	}
> +
> +	ret = v4l2_async_nf_register(ntf);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
> +		goto err_nf_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_nf_cleanup:
> +	v4l2_async_nf_cleanup(ntf);
> +
> +	return ret;
> +}
> +
> +static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct media_pad *pads = csi2->pads;
> +	struct v4l2_subdev *sd = &csi2->sd;
> +	int ret;
> +
> +	ret = dw_mipi_csi2rx_register_notifier(csi2);
> +	if (ret)
> +		goto err;
> +
> +	v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
> +	sd->dev = csi2->dev;
> +	sd->entity.ops = &dw_mipi_csi2rx_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +	sd->internal_ops = &dw_mipi_csi2rx_internal_ops;
> +	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2rx %s",
> +		 dev_name(csi2->dev));
> +
> +	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
> +					      MEDIA_PAD_FL_MUST_CONNECT;
> +	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
> +	if (ret)
> +		goto err_notifier_unregister;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_entity_cleanup;
> +
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret) {
> +		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
> +		goto err_subdev_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +err_notifier_unregister:
> +	v4l2_async_nf_unregister(&csi2->notifier);
> +	v4l2_async_nf_cleanup(&csi2->notifier);
> +err:
> +	return ret;
> +}
> +
> +static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct v4l2_subdev *sd = &csi2->sd;
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_async_nf_unregister(&csi2->notifier);
> +	v4l2_async_nf_cleanup(&csi2->notifier);
> +}
> +
> +static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
> +	{
> +		.compatible = "rockchip,rk3568-mipi-csi2",
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);
> +
> +static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_mipi_csi2rx_device *csi2;
> +	int ret;
> +
> +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
> +	if (!csi2)
> +		return -ENOMEM;
> +	csi2->dev = dev;
> +	dev_set_drvdata(dev, csi2);
> +
> +	csi2->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi2->base_addr))
> +		return PTR_ERR(csi2->base_addr);
> +
> +	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
> +	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> +	csi2->clks_num = ret;
> +
> +	csi2->phy = devm_phy_get(dev, NULL);
> +	if (IS_ERR(csi2->phy))
> +		return dev_err_probe(dev, PTR_ERR(csi2->phy),
> +				     "failed to get MIPI CSI-2 PHY\n");
> +
> +	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(csi2->reset))
> +		return dev_err_probe(dev, PTR_ERR(csi2->reset),
> +				     "failed to get reset\n");
> +
> +	csi2->formats = formats;
> +	csi2->formats_num = ARRAY_SIZE(formats);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable pm runtime\n");
> +
> +	ret = phy_init(csi2->phy);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to initialize MIPI CSI-2 PHY\n");
> +
> +	ret = dw_mipi_csi2rx_register(csi2);
> +	if (ret)
> +		goto err_phy_exit;
> +
> +	return 0;
> +
> +err_phy_exit:
> +	phy_exit(csi2->phy);
> +
> +	return ret;
> +}
> +
> +static void dw_mipi_csi2rx_remove(struct platform_device *pdev)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = platform_get_drvdata(pdev);
> +
> +	dw_mipi_csi2rx_unregister(csi2);
> +	phy_exit(csi2->phy);
> +}
> +
> +static int dw_mipi_csi2rx_runtime_suspend(struct device *dev)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(csi2->clks_num, csi2->clks);
> +
> +	return 0;
> +}
> +
> +static int dw_mipi_csi2rx_runtime_resume(struct device *dev)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	reset_control_assert(csi2->reset);
> +	udelay(5);
> +	reset_control_deassert(csi2->reset);
> +
> +	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2rx_pm_ops,
> +				 dw_mipi_csi2rx_runtime_suspend,
> +				 dw_mipi_csi2rx_runtime_resume, NULL);
> +
> +static struct platform_driver dw_mipi_csi2rx_drv = {
> +	.driver = {
> +		.name = "dw-mipi-csi2rx",
> +		.of_match_table = dw_mipi_csi2rx_of_match,
> +		.pm = pm_ptr(&dw_mipi_csi2rx_pm_ops),
> +	},
> +	.probe = dw_mipi_csi2rx_probe,
> +	.remove = dw_mipi_csi2rx_remove,
> +};
> +module_platform_driver(dw_mipi_csi2rx_drv);
> +
> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.39.5
>

