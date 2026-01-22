Return-Path: <linux-media+bounces-51359-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGfoBQ08cmlMfAAAu9opvQ
	(envelope-from <linux-media+bounces-51359-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:02:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35A68468
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 16A224EC532
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CE9358D2F;
	Thu, 22 Jan 2026 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nERk3qkd"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C1331A6E;
	Thu, 22 Jan 2026 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093473; cv=fail; b=j/1DX4g2eMNhrzELWaPZUGRtQjhCwIWLEoM74dKG4Mwpwy29ATVF5KneGSRa/GV7mSf8nMdtdIFwuwQWc257GSRCg48ff9GQT24o5TySHmQXGKk6p1pzIGy/ygCF6rsys/6gVz3rxVSfgJGGi4JiE/QLHAlApq2vudkArK0gcvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093473; c=relaxed/simple;
	bh=KAWrxcqP3WhLqCnJcXmtQvTW+8OxzBbY9fqjtyl4FXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N4J3r+hvtBbpJXcqwsPxeVNOWZDcqWWIx04WN4IFmObAOK5VfiV7JatNrq/lUswIjwJy2r7hZ1NiKAs4xnAkGn/YMWnV3m2OwTQ43FgOJIalWoYsu7/b0sLbLcVnsUh/VDLZKDBe12S86VDon7Mm4EqX7sM83R8mYnl/Ccy0ETM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nERk3qkd; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQFOGqAKhcrjmqWHGJ1HFPQTwY0pw+PqgFyBx63zCRP/u5vfZ3cqTFW19JtMVzIQ5eUPP4YUOAf5u/AY/rkFmYeT0b42KeIWFXaKTvdZhLj3WfOwq365uZUvmCwn/LAtgjBAhAivfG2gEF2WP3oCpQMo7VXiUNwnB1pgdMMSY8EBpgVdjCwxPGtRcbCP1N9pPWQDwFhes1GfinAwIBRvTA61Im0cdbdKhmauC2VsVZ7kI6cHnYo+Ngg4Naz2BJG6jfHo1yjpUBsLPdZ1hb3VOh1nnPpco/P80wLncR08CJ2DgiWhGIcvS4Jpgqnmr1/2acJb+R+idGZWnJI4wGu3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9DAoYnzC3Tekox7XcWebl6UCRH9Vy45Ju298aOF2UU=;
 b=mEv2cGyytKWH88jC1hSCDznJ1KdqVt9k2g7QJV8O4NUHVJ8oqq9Uz1RJeLGMf04TEjm/JI+SJOtC69ee8lM/5N156eV971Ce+/4gE1hWR8d67K5hRzMib77nVzeUjAwrcwxZLl6q4JoYCKnOhY2Jpca9V4z9TWEvFbXob41LBObfR68ewq/VNgRYFKEbNV5Ikb37tK1FQaMKb9djqnClKkszwuXkIhs/cE4xgYHzyRrW5Ff98mxqEdJ+7OBezVhgsDHqigPepsSE6IYurd++NibY6kRY4liRu6c5HleVYhjmk9Dq+YkYekDnFwcAPllWubNp5sxcT4WhM2J3IhimXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9DAoYnzC3Tekox7XcWebl6UCRH9Vy45Ju298aOF2UU=;
 b=nERk3qkdZNu9XL6/73yDBtRsMMq2Dj0pfoVuYcUxAdsl/xYZARdvX4s9oPY+cqoVYNJzX1nOJK85GJj0MhuAQF+C9fJczsDiyOcbypllgLs6BsgSlxih1RGEGQxXbd4JSqqdaKzsTGR9YV6zkbGm9tRVl4CkJCynkBt72mjbgNkmCOMiBV5De73K62d81x9TLoSetQBQVE9aPaNj+eYXdOvfHfMqZKuSysROV1+qXk3oBEJSU+YemSA6GpMf7G6lB9lyq5MxA8XI8djvJVlehcxHLvINoDiEOo4JOR48sYPaQtdT0pw2ien8nY/ms9qUVQ+G0XiBlSxugVJccKoTCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by DU7PR04MB11161.eurprd04.prod.outlook.com (2603:10a6:10:5b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:51:05 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 14:51:05 +0000
Date: Thu, 22 Jan 2026 09:50:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Message-ID: <aXI5UF9/snwtzpot@lizhi-Precision-Tower-5810>
References: <20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com>
 <20260122-csi_formatter-v4-2-6f6fcad1c33a@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-csi_formatter-v4-2-6f6fcad1c33a@nxp.com>
X-ClientProxiedBy: BYAPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::43) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|DU7PR04MB11161:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ad0e4b-11ec-4364-e598-08de59c5ab96
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?N9/UkK43s1risUp5i9fd/kzmiX4WnsGlz0PIbe4zrOXe7LXfUEwt2ImaZjJD?=
 =?us-ascii?Q?vQhbcjEz7zYvC5/Pev60NkSBYv7DDVzEOKeo9AumdMJYkKkkdla8KRgWiVkP?=
 =?us-ascii?Q?u2jE9ziIYJzmi4Jet8VawlYaLfymlm9LHpGeRaKMRW7gFMBwMvlQrIgoFPSs?=
 =?us-ascii?Q?Y+QB+VVE/4bP4OVvyO14mo7kYowI07rrYeOjgMqW4LKZKa2gdYp/6LRli66h?=
 =?us-ascii?Q?h2N8dmYYCRtuhnUkhiA0pFJf+IhoIbQiu62gQuuSqZxTlV4/UX+XFkCfDlt+?=
 =?us-ascii?Q?MSUGZBbOQTAancO+wiY9hnbjU8pd1UzUyv9Th483tsOgI5a+9jnlRWWUd1AM?=
 =?us-ascii?Q?aZxPbX79YTdln4P6VJKI3Zv6GFhDpRB2ItMU9qibKEBc/kfndKDQCnSz0Zxy?=
 =?us-ascii?Q?1bYeQwIhbLsSJxVmehYbZb5kSzEmUoReWrWz4e2mGKjSvWbKxNsR4bcnB3jB?=
 =?us-ascii?Q?hgIT5uROaLUxbLDLdlL09W7cy5GWDraRhBadfsTKfJzowduONW+Czwg6461f?=
 =?us-ascii?Q?DsuznjiemFCFAT58Ofqrd0J2cSCSq8Y+gjI+aLo7h8xiL1L0avB+JF3lfOaJ?=
 =?us-ascii?Q?wZ8dvMwzqfjEmtsKoZisayNmWocpbgfj7FEioTfyJALNl5ui0c5z7Pn6Jn1G?=
 =?us-ascii?Q?KrO+9jJYvnEzG1ASAryT9W300gbgvgSv9MDJWctsk9DL3Oi/sSMDFYEupG+7?=
 =?us-ascii?Q?7D2G1LxkdUWyinn7AooPhq3H8ofLGdhd4CE8SccNEjtZn+vDivpqAlPHQmcr?=
 =?us-ascii?Q?QvqgMA32PCpNq3FdCcHTVZoUAu+ua1i3anmgnWARC/m8ACjCldUhwVPLD+7N?=
 =?us-ascii?Q?UiQ1ADqBzmMHGT0zjIRpE/aATjxuUo0BQpUMg2DgraF12LRCgfuOkrHQ4zLT?=
 =?us-ascii?Q?Q6/adRRWA+F9NoJh4k5f3MglmoFnTHUaMjy1VPi3w8KCvfkz+iWVNzT39dh0?=
 =?us-ascii?Q?nYKuMW/vnyQpmzHc380OFD6wdIf8UeLOW7HuYvZ6uJmWAo3gt1YtvAqgLdTo?=
 =?us-ascii?Q?ZRb1+9Ha0JwO2fa/JFAynBGlQG2/V8fLD907uLX/Jyjt5dXU6SKB9kv4x/Of?=
 =?us-ascii?Q?2Y1pGRwTc2TbxLqwXt5c1sJrVTz+VXqMFc1jF6f2lpct5ZL73eNYdbS2uVa7?=
 =?us-ascii?Q?zkufpbQGxvABYrMCXNxj/qLTstC3FJBVpDc2R3qGR9wtJA6HEZpzrBo8MouN?=
 =?us-ascii?Q?wN7WHWPaQ6g4wIYY7ysNVa2FYNggXIN7J2ZeKAWPUso5dNPQ+piQvlqjqYFa?=
 =?us-ascii?Q?Kuc2fk143DBtcK0SOcs+oqPYKVE01lIYfpfbcJaAWH/H7GNeBElITVil72po?=
 =?us-ascii?Q?vNpJ0afmVk6jJxeXtLeYbqCB+xA8hyOfcZo+IN5QS62Xo7FWkezf5PRbNy3o?=
 =?us-ascii?Q?luNKyBUqsc9Yt2fmasrg+3cUBwK6KHqUwqQQ0hoHA64EXqHF0mPSWY1SCX9+?=
 =?us-ascii?Q?MSEXzNMRxJBl2STPbPEDsw981WvlmZ9Ow0ht2j8FXVbkQ1VBzW1xkWZ14ocp?=
 =?us-ascii?Q?npUjx9jJorIO6UOYz+qFG83zic8GeeGxWsvTlf9iRFmgl2EcpzvqjJ/ibbGQ?=
 =?us-ascii?Q?TXl9JS5z9Iym2fF+oI1Q1Xt0Banpiw7xE6b67bOVwVmVkT3tHK0PJaZkWGK/?=
 =?us-ascii?Q?Dj+XmRWTkSxwTf1kk3lf9oI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VtWWesajxAzz+IWZplVWSQJDoZTci4ZjVVfS8T5158cWVjZF6LxUtTS6BiqG?=
 =?us-ascii?Q?l9NwGhTXj3/SopaizA5XvLstlv1/pOj3AHJtlm3oQLDI25QunYuj5Zuk0ntt?=
 =?us-ascii?Q?Zt0aSIlX9o/rZHGbhQY4aHMgy+mByBsZU3MdTUzuqg42CYxHGj1eZrrNBXt4?=
 =?us-ascii?Q?coDMnHUzhoTNopCrwgYzSd3SfQyohXLq4KmAtdecl9rxPUujkFU8j9xbX66o?=
 =?us-ascii?Q?jKVhHzl/zpt1yJ9uOQOHnAwbRDWhyioiqWAh543McSPt+sSTO9JiBMtA0bML?=
 =?us-ascii?Q?KeECVhh2SMool/Z8yTwjowPPSA7MjtJWLXNi2COiuwryxmfbrk+JsAF8TUog?=
 =?us-ascii?Q?bbeF6pAITSkp4zdSklbbD6JF069UzwMcFgKn9Il7A9yVZ4e7YGISdl8vm3K6?=
 =?us-ascii?Q?QET2T8LPoXsBSYJvNDT5jsyQnBzWWZacNpRR5jUN9S5ZEg8bo8Fa/wm7AKtn?=
 =?us-ascii?Q?jfxKsnbPe0FfZD0DIVAdjJpLFffsyVSqYDLPPNzUEDRMh0nPIOHM+R1THszk?=
 =?us-ascii?Q?VgIfedoFU3DvPrnyHuXUVsjmH6CnbxXqQi7XBS/Lc3hKjWElqzltK03w+BuR?=
 =?us-ascii?Q?D9Y7VXCF6fdZMkLimE2EkYwOvhNiN8Dm19tOCUjVUzh1qFDGfRT/9mNnzJIY?=
 =?us-ascii?Q?owfG7+qWc1SOOKl+9Tjeru1U74l4t/vkJji4U3mxLpWJY1zi1bmVbNQI+4zm?=
 =?us-ascii?Q?UscpSNDWT0Vm7o8vB/t2qDlpjX2l5PnC6Fgs9RHCDo4i7Jsi8RyqzloNaHg5?=
 =?us-ascii?Q?5OJ7P9xgBib8MvSM/Ezt8D3yXCZZz/JFh+XApKSnb6TdZ1UI67WRc3OJz++j?=
 =?us-ascii?Q?LUW0hCugNMs3fIdcNQAdnCRIYOTxE1SET4WD+wnKB7UshHRWkho+rstYaUii?=
 =?us-ascii?Q?r59AUoCLJrlQjDKEeXGvqOLTLB1ThqqLDHHAm6y9EUBS8W9J2aKTXUs6XwfV?=
 =?us-ascii?Q?1FudQ1mWgMh7FN1WFaTtE28KMgafxO4ZA6Yj63xpQQTz48LO1gDbVMPq8Z54?=
 =?us-ascii?Q?5e8LGflq5s2ElAN/5Qg2l5/fC0fpoIL2wWqdZtNYmv5xD6XMZo8tU2Jdwzqf?=
 =?us-ascii?Q?DciUtdaAPAvVePcooPLDtE4A43dcQTjuzlamyAN3PjJ/bNQEyJe4uIl+kRo6?=
 =?us-ascii?Q?HVyPPHb0appcm4mFbeiZhERzX6SAFevAuuOM9FLpmUls/zQZXoi8+o0v9W3b?=
 =?us-ascii?Q?+/+oM+IDfGnrtlaT9Ayz+qDCYwFMR5nyiDCZzVwJQxUlYoDmTww1T4AibhBJ?=
 =?us-ascii?Q?+uTzB6fDcFVsui+2zyStujTHZ+n19zWGUUM8p/fpF1uVTvN42RfaxtHtoW1C?=
 =?us-ascii?Q?2b3toF3fs07TNv/zJ/4yTd0D00XcqLAWSS6vJIRvfBUXRn4p2cXGZ/wGQEqX?=
 =?us-ascii?Q?QIMcg15eE/DHQMPvyFGKSW76iPh7Uv3bSBAaQgO/yinrz5D5UKNKPrbTddGT?=
 =?us-ascii?Q?o9cxYW2e58DOs2T+FsvySLxKFyYAGatuEAM1vtvYlQDF1Zur5qSDTLckT7Lf?=
 =?us-ascii?Q?3dFNgh057akulkik4xlb2sPsRlsKaZ1Rvwa4loapIcPH7uTuGf9VWTJkOqPG?=
 =?us-ascii?Q?6RfQc0Zs8shENUYEveezH3S54l8C1qRba/0l1gfXDJLBWNmfDGboVbDusrwk?=
 =?us-ascii?Q?YWgGbKjfPhubPMV/71uPCXmlaW1nbsL9K/Vs11s1JdtXH++KB2IHsSKJfFAm?=
 =?us-ascii?Q?Dmp/+MoTo9rp/s25EOQHBV1PMz+Rfln18i6GgMz5FnmVpqq01MBz1jYJyU9h?=
 =?us-ascii?Q?BIXutn52Tw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ad0e4b-11ec-4364-e598-08de59c5ab96
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:51:05.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoncD+iZdfq8sCHwBjmIo02octponI/aJm2rTAfJSpPp5cL6GFitHHyxJhu+8kDKB+CZUILSgUhdiWqTZVxH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51359-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linux.dev:email,i.mx:url]
X-Rspamd-Queue-Id: 8B35A68468
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 03:49:35PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> Add data formatting support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  MAINTAINERS                                     |   8 +
>  drivers/media/platform/nxp/Kconfig              |  14 +
>  drivers/media/platform/nxp/Makefile             |   1 +
>  drivers/media/platform/nxp/imx9-csi-formatter.c | 884 ++++++++++++++++++++++++
>  4 files changed, 907 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5560da0deb716c247c9bf8f245e7bbeb9b69e788..c2c80148e8b225768d32e3069cc4a70115ae21ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18867,6 +18867,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> +F:	drivers/media/platform/nxp/imx9-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:	Abel Vesa <abelvesa@kernel.org>
>  R:	Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50fa488aee9590a87 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
>  	  SoC.
>
> +config VIDEO_IMX9_CSI_FORMATTER
> +	tristate "NXP i.MX9 CSI Pixel Formatter driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver provides support for the CSI Pixel Formatter found on
> +	  i.MX9 series SoC. This module unpacks the pixels received by the
> +	  formatter and reformats them to meet the pixel link format requirement.
> +
> +	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b01b5b34a021dad7bb3 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y += imx8-isi/
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..80f7f6fed91c5f7b3851e5f428ca22a8d84f400c
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
> @@ -0,0 +1,884 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
...
> +
> +#define CSI_FORMATTER_PAD_SINK			0
> +#define CSI_FORMATTER_PAD_SOURCE		1
> +#define CSI_FORMATTER_PAD_NUM			2
> +
> +#define CSI_FORMATTER_DRV_NAME			"csi-pixel-formatter"

Only use once, so needn't define macro here

> +#define CSI_FORMATTER_VC_MAX			8
> +
> +struct formatter_pix_format {
> +	u32 code;
> +	u32 data_type;
> +};
> +
...
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +	struct v4l2_subdev *sd = &formatter->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
> +	sd->internal_ops = &formatter_internal_ops;
> +
> +	sd->owner = THIS_MODULE;

This is not necessary.
v4l2_async_register_subdev() will set it.

> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS |
> +		     V4L2_SUBDEV_FL_STREAMS;
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->entity.ops = &formatter_entity_ops;
> +	sd->dev = formatter->dev;
> +
> +	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
> +				     formatter->pads);
> +	if (ret) {
> +		dev_err(formatter->dev, "Failed to init pads\n");
> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
...
> +
> +static int csi_formatter_system_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
> +		return ret;
> +	}
> +
> +	return 0;
> +}

These two function is not necessary if use
DEFINE_RUNTIME_DEV_PM_OPS

Frank
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	clk_disable_unprepare(formatter->clk);
> +
> +	return 0;
> +}
> +
...
> +MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

