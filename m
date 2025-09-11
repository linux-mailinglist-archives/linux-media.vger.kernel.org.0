Return-Path: <linux-media+bounces-42366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D3B5382B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 17:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851BE18930E6
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7B0352FE9;
	Thu, 11 Sep 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C6w8A73a"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B66322536;
	Thu, 11 Sep 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605786; cv=fail; b=D5jO7po3bPNQyDeSEvBeJpqkm5v44s16ZoW6Tz6cX83ELfLNwGvxLN2oOjeXcNAAFzsXPCsrUW2HyQcJy6pOzfNWQkpukpFUrVf6K7Gd+4c2hfW17yCOEPKgoptWG5H1cTmqPxP4/dgUpxJ7U+/cY+LT1OJdhgulpftGUQTI5FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605786; c=relaxed/simple;
	bh=kzjG/DnUnsJCwK+j4pZke3oJNPdcDmqObTnxBGL756E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ARLOvR9MD+POTlKUKfXBoS9k92PuyJRyrv3iNRUJaTodl7yLXHsBFXZ3k8UVAZnyET7/DavSmrgt78HQJpIJSnHmszJt5XTGWIx5JRFu8uQFheSIrgIGRhGmktln5YP0LzHQev9e1qlXAuHzHqaDQVFrSA+c0p3toxLy70uQro8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C6w8A73a; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+HR92Er4DeX5i/R3zR8LQoP+I56la6KGk1ozSPES4y23TQKaB6KDZ8zBni7UPvsjNRpS9VcvLtaCGYx5RFXfc+2/3CNZJ32P65xyZxFTDEGzjZ6ZI7AnFfnPkt/6DPEhske/YRPBWugO9euL9b3/WOzhuc5S9IThcWPkN/oo13l7UX44vFzCiGnsf0/N2XABVySQ0GDTj0HQiFIWUNZ9zOVDwlKQIrqi0IKciV4YXXRu3SAk+mqkwb+qTH+m/A+c0Wk2dLjYBj834BcyyNyw2aZIXCv91mdn4/1s8dhFTOLa2uGfzywMXWt9QSB7/YyLsldtBtGDGhXb8MjXozHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRbndY2ppD2vdkWzYhggzXNrZclMmLOaLopyIpNVKSU=;
 b=Sa3t4SkFXQyMSP1nUqwVemQSD+tqfgVSyYiUbNQntbLskStTeG7vBqVy8XaeSlYk92W6N0YQytVXSsSeDuGvGTfZ9t+4ziJXE901CYvFBwIyWZUdrriNL7gr/Nq85Asy+riYQIlMWPDthQlfPzndq3aN5N7aY+/wRFDwiK60cdXE5Fx6Zq0LQXAEEUXm95KEFrCWm9pZ+2YJrZi8XjVncAaO0Eri0Al+h/iqsBHKwQNl6gk7Wv9DglG6PrsG3t6ci5UUkbLn7M0qFJ1uMbwPC2SB0KJ0rgMOTF2lr6D91HMUQCo1exnsAz+tUoxxU1XdAfS5xNVvSZ0P7jf4K0tPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRbndY2ppD2vdkWzYhggzXNrZclMmLOaLopyIpNVKSU=;
 b=C6w8A73aaHQWqROXwC6//qtO0Bs1nWcRHEsPug2t4z7jg1eEMdFj9LeUzCfxJqBl2yjk/2Eh9Bj9gjqwgB22FEiT3yskUGVw92int/r7QkR7i9p1hWTRMDPLKEIo0QGgrC7pr71uS3nfo/UNVzZNIChmDIcvVqvhlSmRI5b8jhHg8DnvPDT85/VJlK2njjWo2qv4GvdGCLg+wGGptzV2avg3d7Njz5w1E6HzQBDapSMzaf/7lzGxvY2xU/uI+GkKY5ERwRQRhnQyUmd2s9NnwxAFoTkmkWVRxEaBMHDN+72HxpqE9uplO9MkMzAWuMJV6zyYmqGzYgvzARyv7ipRjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8248.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.16; Thu, 11 Sep
 2025 15:49:36 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.015; Thu, 11 Sep 2025
 15:49:36 +0000
Date: Thu, 11 Sep 2025 11:49:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 00/31] media: add imx93 mipi/controller csi support
Message-ID: <aMLvhdJRGHM+8yIH@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
X-ClientProxiedBy: PH0PR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:510:f::18) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d63617-cc93-4a72-d7ba-08ddf14acf40
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?8cFjLdlRzbn9399XgyZlXk765g9K3oYJj2Y57jOxQnOoEVFwbrWV7e5Bm7gy?=
 =?us-ascii?Q?lVKLA678IlUt++VXDPTkq8PGai7QMbiKNaVRKibff0Bb4ydIRJWfx7W/qp/e?=
 =?us-ascii?Q?KfHRKRfVu3F0a9OhfE2T2f340a8qzG2yk79YOqAkE9IZ6bTpSaasEZoGp80q?=
 =?us-ascii?Q?35xEu9rWpramsbFykaWxIP9DLQW+KVewlzV1qOU8tl6btx+2l9736pXyoteN?=
 =?us-ascii?Q?RVEYkJVNoWI99HAU89O+RU9ct3o7aKsb0BSj5DhU+lRuTd1kKHfJWZQk+Gf3?=
 =?us-ascii?Q?lKfJwQn88svLZfXUGecC7dybxPATS3f/UM2jD0aLDP/LurP1pTdNuPXwvbhy?=
 =?us-ascii?Q?ue+mplnMwL2Dxjxg7NLMzQKPoVECBGmM92u1DmSMBLZdUgWpWhVKyZNlPigN?=
 =?us-ascii?Q?ocXocnSUrG+3av6mu62V4UJmcRbd02K3ZkdiS1OlNbss3VArr+zb1u30/L67?=
 =?us-ascii?Q?KOPalPyeJJ55T5svo1sUbRo+l6avSs8GNQsEsKn4Dna0K+5m+SkCUAyVRIQr?=
 =?us-ascii?Q?qM/9BFmoBNct6L06lViftrwrenUM0JNFbNPtKKcvvYIncrklvCcL6F1upEib?=
 =?us-ascii?Q?DO/Cty2QhhOF/dRbYOqyrmNCu/0vJj6rvMRQq6sVxfa8YtPFpIPLxfLAjDMd?=
 =?us-ascii?Q?T18agfLPlfkKkEApEZubOk8DMLftuehbB77g1NaGFksRKH7VecrTDWb1rCw+?=
 =?us-ascii?Q?0pvq2awznVFvp5azCADiM32f/cp2B5GFqpkjL0eWzmfaZbslNLiPTE3nufoG?=
 =?us-ascii?Q?sDJDTAPQYDVc/uMhLnxq829hIYsN9kwF9b5J3D2cL9tmUhaGE1TIkuJbdO23?=
 =?us-ascii?Q?prMExXq5mS/WpJhfQPW6bYyQunHzMDjJdLU+4wHAvA587npp/Jm3DhgjZcdU?=
 =?us-ascii?Q?33VxNRDmoTEck4V46hUzjFPlUjJIRihB78Z5hOlDUlUlhmt3kvXhaQ4eVyLj?=
 =?us-ascii?Q?wiSItGFVa1EdW09QVMnBEDg7cZIgwLrOpzNNtap3hDubrC5LDVFshFPmHRBk?=
 =?us-ascii?Q?6Ng2dsRReVrP7OuJbmYiZbmA1e96/+Q2zVoUYn6QXicMvbU6xfRe2RAhjkYX?=
 =?us-ascii?Q?ZAM73Luh0l1nbDR8BN1w10tVYGa5pzTynALwnr4/6r3Z585upIx4xq/D2gJk?=
 =?us-ascii?Q?oQWMlmLBeEc/RcsUj/y9ejoogGM1pLgul6evlStoOjTvk8LbjmqFlKVDIBw3?=
 =?us-ascii?Q?OcHB5SBL+3j0U8DVNibDhrr+DevQF2+ak17oZZdL9pv6UV9YG3lffyhnEHev?=
 =?us-ascii?Q?f7Auka+fg1k+oF1xxvaf4y4DfxsPjww9xradHLGLWDAtkfm/ze+gkf2Kv0WP?=
 =?us-ascii?Q?VpWNuztE6iidtK6AadH44q/YqXL4Mk2ttwniFUP9SHox/SQfnaskaNvSa9zL?=
 =?us-ascii?Q?NhQxA5dNcK7CBPcicmYw6vkvg05B/vdow02MJflXtLBTb/H0giE2vILsJE1a?=
 =?us-ascii?Q?Nn73/hCA3w0dQ1yM6Wb994kmNSTmeUjkavFvzasajCtP8e9R6TFT+vVFn4Yo?=
 =?us-ascii?Q?5xHNG68+7L6yis0nF0wAkqbYLW9KZb1sjKUC?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5yxTW2n1R8J/oItIh9IMyFybLQ62j3TOz1tZ3EkEr3ZJhlBnAb/59QXRq9N0?=
 =?us-ascii?Q?NbeB5sXUThdrVLnHRRJJUv5X+IOfZEZQGBdM5B6VeEfg3Xx8CQcya2kApi3u?=
 =?us-ascii?Q?4Q4naH1KMVH0qYsglLxt9R52UBIfdjS5OkDNMV++Buh0oNSBoawTOmSMNfpL?=
 =?us-ascii?Q?CthTPmivoZtqVe6W+dMnqeSF/cxL/3IbT/YmSeWweOiQ2vfYQC5mJVitwLAq?=
 =?us-ascii?Q?w0wSkTGXdORWGp3FN4f2dCFXb7KW4xAVdwVW/agLGRghJAY0TpV4ivvdCeUl?=
 =?us-ascii?Q?lkzu5rPRtK1oBYPrulnyVAbEi+TwCtxtWk2rdz3LY65k7rC4+DLxAIJSTqg/?=
 =?us-ascii?Q?nXzFFcvD7nC/E/vTFC0PUD6xhkh8VEoUSpmUFY21oNMhtauRTXWPVGylnLtz?=
 =?us-ascii?Q?jxJgY7oSjCZAbeu2w95G76HlRQw3AI6oeL4wc/JncwXUlXKcc3baCrYskmy5?=
 =?us-ascii?Q?7mcqDgyJrIi5PUZ24X7NR9cFHb0ABptrJDoFLRMC+2twsMbc0T5tlhx8cus5?=
 =?us-ascii?Q?vIidhJnnwZbWgbNij0WrgK2qfBt542XnhulbQL0o5KwnJJMtz6uHcsW3Lbz8?=
 =?us-ascii?Q?9/4L+aMj0A/7hkPzmUEGDMwFZ0PhNbQNkPEo+Xzvackuybz7ujIkWfiS1FjG?=
 =?us-ascii?Q?VaxigkmqaUodH5oV+/u+uu+SpMUbpvvx1fspu3Swk2GlSxMoBnETFqIPcNEx?=
 =?us-ascii?Q?rOeVfSkYyncpLAQ7Nbs/t6s9rccPlj0GvZu759UCcpKK8uMQpWL3dDb9qWuW?=
 =?us-ascii?Q?FGtBooAfaejmkzql0YK5PqtwsT5pslOnzUfBW9j7C7nQ4lP8evp/qhH7g2q2?=
 =?us-ascii?Q?FxKipVGEQm0DOXx6dcBzMwAPwLs0K7JMyQNUkGgw60Q/OnU3h0WYf9OKcs1I?=
 =?us-ascii?Q?kJpwxuCgf+wgg8+BHOkaXr+X1UJD2OfBavD57xO2GQTNzIABKcccOtGCWxW+?=
 =?us-ascii?Q?qp2kAH19WrG/kAbUEr40RLh5IqKwNE6kyr10HVaIwB63bZZezKeeZaQ6tR4Q?=
 =?us-ascii?Q?dC7fFAznqbzLh+ib4kNDnFdY9zlXFuW4Lu+CcVQfDlZjZbqybmdaH4+gBfQZ?=
 =?us-ascii?Q?LINgpoe6zxeadAJxKteXC2gJfrkik6EXJkNbYn+9NjVTdEqpuNnnimQxyUee?=
 =?us-ascii?Q?2nBvjwIbkxn63UxG6VLvY0HJPyzn82VhLj8G8H0JPGgYRcxdvQ5h2wIZ7zdv?=
 =?us-ascii?Q?2kz/bjZfzpIxauPeqEzQ3/fmFJYZ70QJnTH7JpQjNSSYld0zuMGb8T1GN2qS?=
 =?us-ascii?Q?QBQ16MQkOxM3RKUdotFkNBh7CvA6lYNlDWmKZJgtxqhJLXdcvmzOx/h06G90?=
 =?us-ascii?Q?Z+P0qhyFjx71O6GVINS1+V7+8khaH+bs6dVZIlWa/JKopKg+7+q3A97PNb6J?=
 =?us-ascii?Q?zRCkWEY3JnjE2+o1Aa9xiibgFQ5rWP1mgwroTNCPoBGPdNVGX19AIGKDd7Ai?=
 =?us-ascii?Q?ZNLxJjYII6j/t8s+jqr8M75kBBWegpdQjrjY02d1dgYSc2kybLqzqaq7Yly/?=
 =?us-ascii?Q?a82mWXe+VR2Sukut6LwJ2X6gLihihlhYFnkV5cygLiKb15j5OZztmhto5GCl?=
 =?us-ascii?Q?DjJO/okqXnB+fvXwjdazm+M5ZmhxCPqh3x/aC/k8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d63617-cc93-4a72-d7ba-08ddf14acf40
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:49:36.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZyQf94by45J6Vy3HA9Xg3YPzvNZPPDyY8mU/1kdISaaxGVsylVOZrHGr4+bcw+6q23hJFTEQ9BLDDApjhxQSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8248

On Thu, Aug 21, 2025 at 04:15:35PM -0400, Frank Li wrote:
> Totally rewrite CSI part driver compared to V1.

Laurent Pinchart:

	can you help review these patches? especial first two patches

media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()

After that, I can start do more code clean up work.

	all of "media: staging: media: imx6-mipi-csi2 *" are trivial cleanup
patches.

Frank

>
> This only includes CSI related patches.
>
> DTS part: see https://lore.kernel.org/imx/20250701-95_cam-v1-6-c5172bab387b@nxp.com/
> PHY part: see https://lore.kernel.org/imx/20250701-95_cam-v1-4-c5172bab387b@nxp.com/
> AP1302 part: see https://lore.kernel.org/imx/20250701-95_cam-v1-7-c5172bab387b@nxp.com/
> 	upstream: https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/
>
> First 3 patches add some common helper function to simple code and remove
> duplicated code in difference CSI2 drivers.
>
> Clean up stage imx6 old version csi2 driver, and prepare create common
> dw csi2 library for difference IP version.
>
> Move stage driver under driver/media/synosis.
>
> Create simple platform driver for common dw csi2 use case.
>
> TODO:
> 	1. create bus, to probe phy driver under "test_if" interface for
> specific phys under CSI2.
> 	2. support to combine phy, (which connect to both dw CSI and DSI's
> test_if). Need use DSI's test_if to config combo phy to switch to RX mode.
> and also need config RX part's phy register by use CSI's testif.
> 	3. move other vendor's csi driver to use this common DWC CSI
> library.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v3:
> - update binding doc
> - combine two add helper function's patch to one. and use media_bus_fmt_info
> data structure.
> - Link to v2: https://lore.kernel.org/r/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com
>
> Changes in v2:
> - totally rewrite, see above section
> - Link to v1: https://lore.kernel.org/r/20250701-95_cam-v1-0-c5172bab387b@nxp.com
>
> ---
> Eugen Hristev (1):
>       dt-bindings: media: add DW MIPI CSI-2 Host support
>
> Frank Li (30):
>       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
>       media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
>       media: staging: media: imx6-mipi-csi2: replace space with tab for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
>       media: staging: media: imx6-mipi-csi2: use register structure to match hardware
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
>       media: staging: media: imx6-mipi-csi2: move probe part to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move sd imx6's specific initialization into imx6-sci2.c
>       media: staging: media: imx6-mipi-csi2: move csi2ipu_gasket_init() to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move number pad macro define into imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move dphy init part to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: use runtime_pm frame to control clks
>       media: synopsys: move imx6-mipi-csi2.c to synopsys/mipi-csi2.c
>       media: synopsys: csi2: Remove deprecated s_stream and use v4l2_subdev_pad_ops
>       media: synopsys: csi2: Add phy interface support
>       media: synopsys: csi2: Add basic v150* version register
>       media: synopsys: csi2: Add irq support to record error count
>       media: synopsys: csi2: Handle alignment requirement for width
>       media: synopsys: csi2: Add register prefix to register field definitions
>       media: synopsys: csi2: Add need_dphy_reset in config
>       media: synopsys: csi2: Add default simple dw_csi2_subdev_init_state
>       media: synopsys: csi2: Add v150 lane stop state register bit define
>       media: synopsys: csi2: use standard v4l2_subdev_get_fmt() function
>       media: synopsys: csi2: Add customize get_frame_desc() callback
>       media: synopsys: csi2: Add Image Pixel Interface (IPI) support for v150
>       media: synopsys: csi2: Remove source pad connected check at dw_csi2_enable_streams()
>       media: synopsys: csi2: Add simple synopsys platform driver
>
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  151 +++
>  MAINTAINERS                                        |    1 +
>  drivers/media/platform/synopsys/Kconfig            |   20 +
>  drivers/media/platform/synopsys/Makefile           |    3 +
>  drivers/media/platform/synopsys/mipi-csi2-simple.c |   75 ++
>  drivers/media/platform/synopsys/mipi-csi2.c        | 1260 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c              |  149 +++
>  drivers/staging/media/imx/Kconfig                  |    1 +
>  drivers/staging/media/imx/Makefile                 |    2 +-
>  drivers/staging/media/imx/imx6-csi2.c              |  181 +++
>  drivers/staging/media/imx/imx6-mipi-csi2.c         |  846 -------------
>  include/media/dw-mipi-csi2.h                       |  120 ++
>  include/media/mipi-csi2.h                          |   30 +
>  include/media/v4l2-common.h                        |   30 +
>  14 files changed, 2022 insertions(+), 847 deletions(-)
> ---
> base-commit: ad0a162e543964443feec3a6a9395a64fe6c35c9
> change-id: 20250606-95_cam-b74c094ad1fb
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

