Return-Path: <linux-media+bounces-36816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8BAF8EAF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309F51CA32C7
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD6F2EA746;
	Fri,  4 Jul 2025 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s3SZ1LBX"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535472BE621;
	Fri,  4 Jul 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621569; cv=fail; b=FuC9w4Hl3LM37sNsutrwz8mph4C9x4TFwLw8LPnUzfbHdRzpU5cb4FIFpyVe4UyWn76sFxizoW928P4cDfu9jjj5CcwrV+lYGANkVqtPpr44X27A4phiB02PeEUrgrlCtp3X0SqxtK361ksNQJw+KCmFAeiv10eNIusx6trt/RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621569; c=relaxed/simple;
	bh=aGItXK/Ama3hxEbkSoPDQ5sb1hlXJrWdhbt4nuhr8gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WFAUYdOXIDuGjq7OoVayjAUPzJg+Q7Q/yestxuLXB/o91ZaUDaDMaBa5rNZL7Ch+gYwYn394z4U1bjeS8HQ8Z4g1KZVPE1teZ0bYzRcn3gY5/kN8hI2us0VjPfUrC1SCIQL73Kog7nnS2T324Vs5rnFaj90ydbtKU+OIYIuZlEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=s3SZ1LBX; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH0McuG8gWzto9cIV8MeZjQd60WXVuFacOmBkYz9GJhxGU6/JUbxw3vnc9I98EgEMmSb/kH9oIcMVH2MNJXzSy1yAn3A1Y5c6/JrzlGYl6/xLLeyXEynMSM1KBgMSfwaLNxn736GGOCbgsTSiw7s2vIkIrlaGebxnR8uUlYGmQ4ZNrB+smSHEIunHQyd7ycnFElGLpCS46bcCWzGaxqbZlXSkcV9o56rP+u+mm6sr14H6xU53dc12STZS4se6J3O6SxvrydGVl580/vWv+kAp27BXl5kWRVkGTk/Fmpj3xurmc+uJ6Iqd4kCVKNCcNnOMsnhhvbTK0F6YRuRxpcb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raPsVFWEaCyyV8Wec/3iUFkmwSyJo7o4mHbLBHjDbfY=;
 b=RpQtNwOfZsWwKPfXP9/MqjXPzGCgVfKLK7q7s8OHg7f+wdm/+yRvvCxArobGwvn/28uNTb3I7HLm5GbXMkkbU/HlhVS/Ux+5MYOD00zv8S/lDJ1VpBVNuRCI7ImCnNPizh/SVBH3Kl+NwsbeAUjb3e427hiOkFDYn5o5bD9G3L2u6XQWYB3wTlqMG093/lY5I4PoSNIgfZ9F7OW8DuOvCHiwTy5WtVfqXQIjqw0sh5uh2lDZLsQQ5AKTpokO6uifoB14DobBw7zYYj9AjJ9AUoaO3wXUlVVNjdBVEahvdw2dOEvxP/qWpYqcJ2fK1/wMiAmEdHo/1107HD96MiwIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raPsVFWEaCyyV8Wec/3iUFkmwSyJo7o4mHbLBHjDbfY=;
 b=s3SZ1LBXEz0mgdzv9RQcmtoHwyaEZhytfJkeLCKo6jKtRp1PqX5i3FHzI5+lIIq4Q5yHM9fNpGBkiG/qJ9SBdQzZXzsCGQ/08O4A0rfjCG47Fs3WlDaxlthpfWSll40lYm/vlngGaZerrszbmm4UqFEHm/logNgch7n1oCTt9GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY1PR01MB10706.jpnprd01.prod.outlook.com (2603:1096:400:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:32:42 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%7]) with mapi id 15.20.8880.027; Fri, 4 Jul 2025
 09:32:42 +0000
Date: Fri, 4 Jul 2025 11:32:17 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Matt Ranostay <matt@ranostay.sg>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Fend <matthias.fend@emfend.at>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aGefoTAKt6yu8uc6@tom-desktop>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: ZR0P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::28) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY1PR01MB10706:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cda9722-deae-4928-b928-08ddbaddb967
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ik6WsKStNmAPYYZO4Zf1FGQnphJqUrHki7kqefqF2wUunpBvcYbWCpVDDWDJ?=
 =?us-ascii?Q?URzAs1Jq+ZwDSNHcQFcdionIlmCmuqajro8yqhdtInIt3pud1+5ke4XReuPE?=
 =?us-ascii?Q?QHMbm+uzXCNz0ROyeLSX47CWnr5vCd/XCYtaYFOT4OJdwDnRhwDxkdbRF9f9?=
 =?us-ascii?Q?I0EJU4GJzLOFJdnH/C8Pxg6zEICuBg1cQKG4W08er/bjzY/t+xSFvQ7d/WAx?=
 =?us-ascii?Q?dE28VS2s2/AatXyD2moMQvd4o0POyqEVTSLnglA9/KiFwppG9Fn6ZihDvZhU?=
 =?us-ascii?Q?r+nu+i/ko2s/fU4bXmBOtIxXBtVG9A8MP1IZXidu7TBrhioHwekX/05zJf0V?=
 =?us-ascii?Q?Ef+4w9v64L3kPzqSnh37pFYNcflvLeSjDNX7tg4+HEa71yHQhpMSeW22CTCQ?=
 =?us-ascii?Q?74bYj0uLQmpkWmyUGP71+rmfx4sZUjJx+LIrs0RwhvdlcXx0hcXxAbtfcY3E?=
 =?us-ascii?Q?50DMLtyGG6lSMCoy807n/wE8aN1g5S/GFTDtYO5fQ1kX/lgV3LFAuEjN+/BU?=
 =?us-ascii?Q?7faEm9Vuh+MQQwNgktH5A1CaCAAN3sEfYSbrEj5nyX5oO40dwnosgMfmFtUs?=
 =?us-ascii?Q?+yoQ9IU4Ry/TlAXjW5DZ4LBrjmUCdr0TDlzmKEXZAA1bSq0Cq/CYEAKwJ9/b?=
 =?us-ascii?Q?0TmIDJPz+OPQZFqNh2XTck3fRraqkB0bFVPlncP5mlHSbvD2QJJaKr4gAwWO?=
 =?us-ascii?Q?J+y9AvXNh2ViA2YUrt1woeV6GG0uUMRWh6PPEmacom5cxHHs1O8P6kFr1w7m?=
 =?us-ascii?Q?uKF5mu+fsb8xh4WmAEM5lIyPQcl77yfPRx85WsG2qn9+bOTpX2o4LPt/ZUFQ?=
 =?us-ascii?Q?99Y+ztJwkxTi6PhPb5efn4AsCkQuaPef4xLN34xbkX2AMNUveBjAPBPd0XH5?=
 =?us-ascii?Q?Op6x1a7yyFQhpwW6scb+Y/aSs1zgSlaKn9rBePsjd8zB5Y12AshOomY7vY+4?=
 =?us-ascii?Q?HAbAYxUxVqdNoVgcvxnV3f58Csq/kAnvJfQtJT7YiL0Sad5EQXKECLRJ52ol?=
 =?us-ascii?Q?hkD2/BLrmbir6vtCoNK/0vaDXeR6bFYrmVRZv6L6dObQGfperAmkQgUb2XYx?=
 =?us-ascii?Q?Vx8dRS38NpUHHcIvaKUrzOCvw4824TGwNn4Lg7TLHDmVE010XElLAG/CBkEw?=
 =?us-ascii?Q?aTqcqJNDclrChkUgw6lO6ialUQHAeaaqjdvUmeu29qW7fFYgLEz8MbJQ0k62?=
 =?us-ascii?Q?a8bSuX5df0BFiHSjHPWNHyOX39OpoRjf+uJ5OrXLavt84VKdKhRVs8I2aq17?=
 =?us-ascii?Q?XCAZjiocgew570yts2bU4Pse6jS5Gw7Yp4x6L2+U4jnafIjpotPiknO4B/nR?=
 =?us-ascii?Q?He8egdrsdaJLHOEL4I//vthPvunJEfm37e0Xd9lCKGEB73/nb9UXIwBMln8D?=
 =?us-ascii?Q?VGPLS0jd7qlbkvrKVjh5DLdc2yOvk5VTyd44w23oyk3x1mffaysH5d6RQ6cU?=
 =?us-ascii?Q?0yQmE2M6X9jR8VC0xN0bSdnyU/eHv1Q26EVFlt8vOVL9skfLTvBDBsU9Igag?=
 =?us-ascii?Q?dfcnUAX6tkVMxAQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QfnrK19IPgLtFtKK1wdRswuWoWlz83FoRGYgQXI45RhLktG4h5VLH4i3DUmi?=
 =?us-ascii?Q?VI/FkedWR7D7GL+17LWzugPdNpn3xFRBV2xjfw4+Se/m2BBKKY7NGQugKX5D?=
 =?us-ascii?Q?sX0aYoRi5Qk+Hw0c0qSlSlFiDg8n08s6O9IDY47Yj1ZfMGXs1jNaWG7dR8XG?=
 =?us-ascii?Q?WRZ7C8B2gijfJ7E/0TL9KgBDsIKA9sRsKzyoU0GdioGyY6zsxvoj6CyCx7f2?=
 =?us-ascii?Q?RN2/MnXpXN6Mus8qaQeHPDymSdglv8q862fPsQyUmmAyl57f7/0SRBWFbF6I?=
 =?us-ascii?Q?gWzJGdT5qWj/YWopMXTROR/9GK6W3QaNf+XaoTFO8xtqGColq9ME4zmQCN9l?=
 =?us-ascii?Q?P5Fw6DJuCaOQSwojZq+YPhnSEOK1lYrdHCU7m89zH6UlKk35c6UG/iKGbRt0?=
 =?us-ascii?Q?IHSO5exMbN7tWrtGmexX8qOOPMd9CvaUZNx/wyHb8T/3QgxJlHFPtt6IbjWP?=
 =?us-ascii?Q?9lgD0WA0h05HTDnaegDEJIKwhEO1O1DoPdlHg+3R0KoMnTm9toJjav+fJ1K4?=
 =?us-ascii?Q?D1xnQkB9eQt7veq8rbc25Q13SHD6NLHaH3To8HZlTFixho4Er2+Rm0hiQS44?=
 =?us-ascii?Q?piRgZ+p79YI+xY15cvDqCobVZqfD7MZCCl+rdWe4pI9mAu9tHU9QIZQ4XZ/Y?=
 =?us-ascii?Q?gGM/uN24jgWCSwC1xeks/zdTFYiOtSx7PV4fWbNOZG4ajQcWMbg0apyFRxLW?=
 =?us-ascii?Q?ZIRi8NRq3YWIX8C/bK/Vt3nC0XNXWHhTjTce4DUdVA8CZZdwMZUWftTOrEMQ?=
 =?us-ascii?Q?bxCx2E4wE6RjFUjXbuDt1cUdDpgpkSkPZ4/cMlckn7dvJGiN4dYU3iLeh1hd?=
 =?us-ascii?Q?SNEasTGHnMf3Tmp5cKhwZi/vHHaNnOJigmaWHtzSA94F06Pg/2KgduOphRWx?=
 =?us-ascii?Q?Rh+vHo3zQbyu8W6K7dOxnUlZyPSjuF985MTsg08varnK63wZtU8b9YRIIidm?=
 =?us-ascii?Q?M1+hyzlxwrFhPocHxWZlh2UHVhd1BLFRfQI2MnJECPDopWRDtymkgxo99Cs7?=
 =?us-ascii?Q?oG+H8p/LrDySfFEZQczwcJwFi7QFAk8Jtr3Ozegrsq0mc/aErj/U8GFgaAKl?=
 =?us-ascii?Q?Vnp0lG3U9eut3PFhkNg32Wvb8SxkNfvOrOsrQ+IW8iKjxjAbGIp2DTQecV7M?=
 =?us-ascii?Q?VdHbOP2a19IGqR6WeATUN1nTSHJLViiLjgUdS5UrpmZHkLpPnzhKyDmXbcLZ?=
 =?us-ascii?Q?ujgP90T3pbdNA8hPb3lY+ooZmLq4QFjt0RSEQVE5/aM/3R0/grAP0mQefPGv?=
 =?us-ascii?Q?UgAPQrM7AGpFNQ1wxDqkp2kRHtKw7aGjSMTjmhMLQuA4vtzQMf+YjATFfmkB?=
 =?us-ascii?Q?IvPRqkJNtNcmp3AHN2+cGNMfmJVSjYNXVlXQgf8on3c9gHYsQm7DYwb9EbBD?=
 =?us-ascii?Q?+IQl9Kf2qwpJ51WwxQ6rXdNJ51LqK9iji8v4qMmp+pgR/c6s/HJB4HYuLwjv?=
 =?us-ascii?Q?MvXTdwRne6epUh+Nn9ZKgBzIJBSJNmJDMv6QPC8d3dSEqo0wvvcwACWTYbHA?=
 =?us-ascii?Q?Xg5uSEJTL9SwTxZNP/PvNdV4A/yEgJD/Sz6+Vl5dM2YOYQndvL8575QJiv2D?=
 =?us-ascii?Q?WQbo1q3IE0aGRuQ7WXrUsqK8DRY8s2Oc3d1ZB8rLb48HErWGfFZVhId8xRic?=
 =?us-ascii?Q?UQNMNzPuK4tF2TcjAV9L6/M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cda9722-deae-4928-b928-08ddbaddb967
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:32:42.1345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMOCSVHfZzyWn+jLMx+GJNgJS6VshuyoF5yhnhkhNerbw1Nlm4zNGP2a2w/nn5dRow9RHSBR2IgHwv8pqMi2q6KRv1tMz9GGG5XNSfgQwi/q67hn8Ht1HHvsi5Vg5vbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10706

Hi Sakari,
Thanks for your patch!

On Fri, Jul 04, 2025 at 10:54:31AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/media/i2c/alvium-csi2.c                          | 1 -

Acked-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

>  drivers/media/i2c/ccs/ccs-core.c                         | 4 ----
>  drivers/media/i2c/dw9768.c                               | 1 -
>  drivers/media/i2c/gc0308.c                               | 3 ---
>  drivers/media/i2c/gc2145.c                               | 3 ---
>  drivers/media/i2c/imx219.c                               | 2 --
>  drivers/media/i2c/imx283.c                               | 3 ---
>  drivers/media/i2c/imx290.c                               | 3 ---
>  drivers/media/i2c/imx296.c                               | 1 -
>  drivers/media/i2c/imx415.c                               | 1 -
>  drivers/media/i2c/mt9m114.c                              | 6 ------
>  drivers/media/i2c/ov4689.c                               | 3 ---
>  drivers/media/i2c/ov5640.c                               | 4 ----
>  drivers/media/i2c/ov5645.c                               | 3 ---
>  drivers/media/i2c/ov64a40.c                              | 4 ----
>  drivers/media/i2c/ov8858.c                               | 2 --
>  drivers/media/i2c/st-mipid02.c                           | 2 --
>  drivers/media/i2c/tc358746.c                             | 5 -----
>  drivers/media/i2c/thp7312.c                              | 4 ----
>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----
>  drivers/media/i2c/video-i2c.c                            | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 -----
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c        | 1 -
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c     | 2 --
>  drivers/media/platform/verisilicon/hantro_drv.c          | 1 -
>  drivers/media/rc/gpio-ir-recv.c                          | 1 -
>  29 files changed, 83 deletions(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index 05b708bd0a64..1f088acecf36 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -1841,7 +1841,6 @@ static int alvium_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	} else {
>  		alvium_set_stream_mipi(alvium, enable);
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  	}
>  
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 487bcabb4a19..3316639b695e 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -788,7 +788,6 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  	}
>  
>  	if (pm_status > 0) {
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  	}
>  
> @@ -1914,7 +1913,6 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
>  	if (!enable) {
>  		ccs_stop_streaming(sensor);
>  		sensor->streaming = false;
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  
>  		return 0;
> @@ -1929,7 +1927,6 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
>  	rval = ccs_start_streaming(sensor);
>  	if (rval < 0) {
>  		sensor->streaming = false;
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  	}
>  
> @@ -2677,7 +2674,6 @@ nvm_show(struct device *dev, struct device_attribute *attr, char *buf)
>  		return -ENODEV;
>  	}
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  	/*
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index 3a4d100b9199..d434721ba8ed 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -374,7 +374,6 @@ static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  
>  static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
> -	pm_runtime_mark_last_busy(sd->dev);
>  	pm_runtime_put_autosuspend(sd->dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/gc0308.c b/drivers/media/i2c/gc0308.c
> index 069f42785b3c..cbcda0e18ff1 100644
> --- a/drivers/media/i2c/gc0308.c
> +++ b/drivers/media/i2c/gc0308.c
> @@ -974,7 +974,6 @@ static int gc0308_s_ctrl(struct v4l2_ctrl *ctrl)
>  	if (ret)
>  		dev_err(gc0308->dev, "failed to set control: %d\n", ret);
>  
> -	pm_runtime_mark_last_busy(gc0308->dev);
>  	pm_runtime_put_autosuspend(gc0308->dev);
>  
>  	return ret;
> @@ -1157,14 +1156,12 @@ static int gc0308_start_stream(struct gc0308 *gc0308)
>  	return 0;
>  
>  disable_pm:
> -	pm_runtime_mark_last_busy(gc0308->dev);
>  	pm_runtime_put_autosuspend(gc0308->dev);
>  	return ret;
>  }
>  
>  static int gc0308_stop_stream(struct gc0308 *gc0308)
>  {
> -	pm_runtime_mark_last_busy(gc0308->dev);
>  	pm_runtime_put_autosuspend(gc0308->dev);
>  	return 0;
>  }
> diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
> index ba02161d46e7..559a851669aa 100644
> --- a/drivers/media/i2c/gc2145.c
> +++ b/drivers/media/i2c/gc2145.c
> @@ -963,7 +963,6 @@ static int gc2145_enable_streams(struct v4l2_subdev *sd,
>  	return 0;
>  
>  err_rpm_put:
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  	return ret;
>  }
> @@ -985,7 +984,6 @@ static int gc2145_disable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		dev_err(&client->dev, "%s failed to write regs\n", __func__);
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  	return ret;
> @@ -1193,7 +1191,6 @@ static int gc2145_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  	return ret;
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3b4f68543342..3faf48f34af4 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -771,7 +771,6 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
>  	return 0;
>  
>  err_rpm_put:
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  	return ret;
>  }
> @@ -793,7 +792,6 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
>  	__v4l2_ctrl_grab(imx219->vflip, false);
>  	__v4l2_ctrl_grab(imx219->hflip, false);
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  	return ret;
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index da618c8cbadc..67e8bb432d10 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1143,7 +1143,6 @@ static int imx283_enable_streams(struct v4l2_subdev *sd,
>  	return 0;
>  
>  err_rpm_put:
> -	pm_runtime_mark_last_busy(imx283->dev);
>  	pm_runtime_put_autosuspend(imx283->dev);
>  
>  	return ret;
> @@ -1163,7 +1162,6 @@ static int imx283_disable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		dev_err(imx283->dev, "Failed to stop stream\n");
>  
> -	pm_runtime_mark_last_busy(imx283->dev);
>  	pm_runtime_put_autosuspend(imx283->dev);
>  
>  	return ret;
> @@ -1558,7 +1556,6 @@ static int imx283_probe(struct i2c_client *client)
>  	 * Decrease the PM usage count. The device will get suspended after the
>  	 * autosuspend delay, turning the power off.
>  	 */
> -	pm_runtime_mark_last_busy(imx283->dev);
>  	pm_runtime_put_autosuspend(imx283->dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index fbf7eba3d71d..970a8d89a3e7 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -869,7 +869,6 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(imx290->dev);
>  	pm_runtime_put_autosuspend(imx290->dev);
>  
>  	return ret;
> @@ -1099,7 +1098,6 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
>  		}
>  	} else {
>  		imx290_stop_streaming(imx290);
> -		pm_runtime_mark_last_busy(imx290->dev);
>  		pm_runtime_put_autosuspend(imx290->dev);
>  	}
>  
> @@ -1295,7 +1293,6 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	 */
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
>  	imx290->sd.dev = imx290->dev;
> -	pm_runtime_mark_last_busy(imx290->dev);
>  	pm_runtime_put_autosuspend(imx290->dev);
>  
>  	imx290->sd.internal_ops = &imx290_internal_ops;
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index f3bec16b527c..61116f4e3f76 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -604,7 +604,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (!enable) {
>  		ret = imx296_stream_off(sensor);
>  
> -		pm_runtime_mark_last_busy(sensor->dev);
>  		pm_runtime_put_autosuspend(sensor->dev);
>  
>  		goto unlock;
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 278e743646ea..276bf4d6f39d 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -952,7 +952,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (!enable) {
>  		ret = imx415_stream_off(sensor);
>  
> -		pm_runtime_mark_last_busy(sensor->dev);
>  		pm_runtime_put_autosuspend(sensor->dev);
>  
>  		goto unlock;
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 3f540ca40f3c..aa3fd6c6c76c 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -974,7 +974,6 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
>  	return 0;
>  
>  error:
> -	pm_runtime_mark_last_busy(&sensor->client->dev);
>  	pm_runtime_put_autosuspend(&sensor->client->dev);
>  
>  	return ret;
> @@ -988,7 +987,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
>  
>  	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
>  
> -	pm_runtime_mark_last_busy(&sensor->client->dev);
>  	pm_runtime_put_autosuspend(&sensor->client->dev);
>  
>  	return ret;
> @@ -1046,7 +1044,6 @@ static int mt9m114_pa_g_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(&sensor->client->dev);
>  	pm_runtime_put_autosuspend(&sensor->client->dev);
>  
>  	return ret;
> @@ -1113,7 +1110,6 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(&sensor->client->dev);
>  	pm_runtime_put_autosuspend(&sensor->client->dev);
>  
>  	return ret;
> @@ -1565,7 +1561,6 @@ static int mt9m114_ifp_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(&sensor->client->dev);
>  	pm_runtime_put_autosuspend(&sensor->client->dev);
>  
>  	return ret;
> @@ -2472,7 +2467,6 @@ static int mt9m114_probe(struct i2c_client *client)
>  	 * Decrease the PM usage count. The device will get suspended after the
>  	 * autosuspend delay, turning the power off.
>  	 */
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 1c3a449f9354..7d740ad3926f 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -497,7 +497,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
>  	} else {
>  		cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
>  			  OV4689_MODE_SW_STANDBY, NULL);
> -		pm_runtime_mark_last_busy(dev);
>  		pm_runtime_put_autosuspend(dev);
>  	}
>  
> @@ -702,7 +701,6 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> @@ -999,7 +997,6 @@ static int ov4689_probe(struct i2c_client *client)
>  		goto err_clean_subdev_pm;
>  	}
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 0dae0438aa80..84198613381d 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3341,7 +3341,6 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
>  	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
>  
>  	return 0;
> @@ -3417,7 +3416,6 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
>  	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
>  
>  	return ret;
> @@ -3754,7 +3752,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  	mutex_unlock(&sensor->lock);
>  
>  	if (!enable || ret) {
> -		pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
>  		pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
>  	}
>  
> @@ -3965,7 +3962,6 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 004d0ee5c3f5..58c846a44376 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -808,7 +808,6 @@ static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(ov5645->dev);
>  	pm_runtime_put_autosuspend(ov5645->dev);
>  
>  	return ret;
> @@ -979,7 +978,6 @@ static int ov5645_disable_streams(struct v4l2_subdev *sd,
>  			       OV5645_SYSTEM_CTRL0_STOP);
>  
>  rpm_put:
> -	pm_runtime_mark_last_busy(ov5645->dev);
>  	pm_runtime_put_autosuspend(ov5645->dev);
>  
>  	return ret;
> @@ -1196,7 +1194,6 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
> index a5da4fe47e0b..15912ecb8d26 100644
> --- a/drivers/media/i2c/ov64a40.c
> +++ b/drivers/media/i2c/ov64a40.c
> @@ -2990,7 +2990,6 @@ static int ov64a40_start_streaming(struct ov64a40 *ov64a40,
>  	return 0;
>  
>  error_power_off:
> -	pm_runtime_mark_last_busy(ov64a40->dev);
>  	pm_runtime_put_autosuspend(ov64a40->dev);
>  
>  	return ret;
> @@ -3000,7 +2999,6 @@ static int ov64a40_stop_streaming(struct ov64a40 *ov64a40,
>  				  struct v4l2_subdev_state *state)
>  {
>  	cci_update_bits(ov64a40->cci, OV64A40_REG_SMIA, BIT(0), 0, NULL);
> -	pm_runtime_mark_last_busy(ov64a40->dev);
>  	pm_runtime_put_autosuspend(ov64a40->dev);
>  
>  	__v4l2_ctrl_grab(ov64a40->link_freq, false);
> @@ -3330,7 +3328,6 @@ static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
>  	}
>  
>  	if (pm_status > 0) {
> -		pm_runtime_mark_last_busy(ov64a40->dev);
>  		pm_runtime_put_autosuspend(ov64a40->dev);
>  	}
>  
> @@ -3622,7 +3619,6 @@ static int ov64a40_probe(struct i2c_client *client)
>  		goto error_subdev_cleanup;
>  	}
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 95f9ae794846..6b7193eaea1f 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -1391,7 +1391,6 @@ static int ov8858_s_stream(struct v4l2_subdev *sd, int on)
>  		}
>  	} else {
>  		ov8858_stop_stream(ov8858);
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  	}
>  
> @@ -1945,7 +1944,6 @@ static int ov8858_probe(struct i2c_client *client)
>  		goto err_power_off;
>  	}
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index f4568e87f018..41ae25b0911f 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -465,7 +465,6 @@ static int mipid02_disable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto error;
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  error:
> @@ -542,7 +541,6 @@ static int mipid02_enable_streams(struct v4l2_subdev *sd,
>  	cci_write(bridge->regmap, MIPID02_DATA_LANE0_REG1, 0, &ret);
>  	cci_write(bridge->regmap, MIPID02_DATA_LANE1_REG1, 0, &ret);
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  	return ret;
>  }
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index 143aa1359aba..bcfc274cf891 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -816,7 +816,6 @@ static int tc358746_s_stream(struct v4l2_subdev *sd, int enable)
>  		return 0;
>  
>  err_out:
> -		pm_runtime_mark_last_busy(sd->dev);
>  		pm_runtime_put_sync_autosuspend(sd->dev);
>  
>  		return err;
> @@ -838,7 +837,6 @@ static int tc358746_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (err)
>  		return err;
>  
> -	pm_runtime_mark_last_busy(sd->dev);
>  	pm_runtime_put_sync_autosuspend(sd->dev);
>  
>  	return v4l2_subdev_call(src, video, s_stream, 0);
> @@ -1016,7 +1014,6 @@ tc358746_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
>  	err = tc358746_read(tc358746, reg->reg, &val);
>  	reg->val = val;
>  
> -	pm_runtime_mark_last_busy(sd->dev);
>  	pm_runtime_put_sync_autosuspend(sd->dev);
>  
>  	return err;
> @@ -1032,7 +1029,6 @@ tc358746_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_register *reg)
>  
>  	tc358746_write(tc358746, (u32)reg->reg, (u32)reg->val);
>  
> -	pm_runtime_mark_last_busy(sd->dev);
>  	pm_runtime_put_sync_autosuspend(sd->dev);
>  
>  	return 0;
> @@ -1395,7 +1391,6 @@ static int tc358746_init_hw(struct tc358746 *tc358746)
>  	}
>  
>  	err = tc358746_read(tc358746, CHIPID_REG, &val);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_sync_autosuspend(dev);
>  	if (err)
>  		return -ENODEV;
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 8852c56431fe..775cfba188d8 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -808,7 +808,6 @@ static int thp7312_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (!enable) {
>  		thp7312_stream_enable(thp7312, false);
>  
> -		pm_runtime_mark_last_busy(thp7312->dev);
>  		pm_runtime_put_autosuspend(thp7312->dev);
>  
>  		v4l2_subdev_unlock_state(sd_state);
> @@ -839,7 +838,6 @@ static int thp7312_s_stream(struct v4l2_subdev *sd, int enable)
>  	goto finish_unlock;
>  
>  finish_pm:
> -	pm_runtime_mark_last_busy(thp7312->dev);
>  	pm_runtime_put_autosuspend(thp7312->dev);
>  finish_unlock:
>  	v4l2_subdev_unlock_state(sd_state);
> @@ -1147,7 +1145,6 @@ static int thp7312_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(thp7312->dev);
>  	pm_runtime_put_autosuspend(thp7312->dev);
>  
>  	return ret;
> @@ -2183,7 +2180,6 @@ static int thp7312_probe(struct i2c_client *client)
>  	 * Decrease the PM usage count. The device will get suspended after the
>  	 * autosuspend delay, turning the power off.
>  	 */
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	dev_info(dev, "THP7312 firmware version %02u.%02u\n",
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index c0754fd03b1d..7c39183dd44b 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1104,7 +1104,6 @@ static int vd55g1_disable_streams(struct v4l2_subdev *sd,
>  
>  	vd55g1_grab_ctrls(sensor, false);
>  
> -	pm_runtime_mark_last_busy(sensor->dev);
>  	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return ret;
> @@ -1338,7 +1337,6 @@ static int vd55g1_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(sensor->dev);
>  	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return ret;
> @@ -1433,7 +1431,6 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(sensor->dev);
>  	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return ret;
> @@ -1895,7 +1892,6 @@ static int vd55g1_probe(struct i2c_client *client)
>  	pm_runtime_enable(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 4000);
>  	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	ret = vd55g1_subdev_init(sensor);
> diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
> index 5d951ad0b478..d66e21ba4498 100644
> --- a/drivers/media/i2c/vd56g3.c
> +++ b/drivers/media/i2c/vd56g3.c
> @@ -493,7 +493,6 @@ static int vd56g3_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(sensor->dev);
>  	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return ret;
> @@ -577,7 +576,6 @@ static int vd56g3_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(sensor->dev);
>  	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return ret;
> @@ -1021,7 +1019,6 @@ static int vd56g3_disable_streams(struct v4l2_subdev *sd,
>  	__v4l2_ctrl_grab(sensor->vflip_ctrl, false);
>  	__v4l2_ctrl_grab(sensor->patgen_ctrl, false);
>  
> -	pm_runtime_mark_last_busy(sensor->dev);
>  	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return ret;
> @@ -1527,7 +1524,6 @@ static int vd56g3_probe(struct i2c_client *client)
>  	}
>  
>  	/* Sensor could now be powered off (after the autosuspend delay) */
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	dev_dbg(dev, "Successfully probe %s sensor\n",
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 0dd991d70d53..1eee2d4f5b40 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -288,7 +288,6 @@ static int amg88xx_read(struct device *dev, enum hwmon_sensor_types type,
>  		return tmp;
>  
>  	tmp = regmap_bulk_read(data->regmap, AMG88XX_REG_TTHL, &buf, 2);
> -	pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
>  	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
>  	if (tmp)
>  		return tmp;
> @@ -527,7 +526,6 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
>  		return 0;
>  
>  error_rpm_put:
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  error_del_list:
>  	video_i2c_del_list(vq, VB2_BUF_STATE_QUEUED);
> @@ -544,7 +542,6 @@ static void stop_streaming(struct vb2_queue *vq)
>  
>  	kthread_stop(data->kthread_vid_cap);
>  	data->kthread_vid_cap = NULL;
> -	pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
>  	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
>  
>  	video_i2c_del_list(vq, VB2_BUF_STATE_ERROR);
> @@ -853,7 +850,6 @@ static int video_i2c_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto error_pm_disable;
>  
> -	pm_runtime_mark_last_busy(&client->dev);
>  	pm_runtime_put_autosuspend(&client->dev);
>  
>  	return 0;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index fd71f0c43ac3..a9ce032cc5a2 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -451,7 +451,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
>  	if (q_status.report_queue_count == 0 &&
>  	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
>  		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> -		pm_runtime_mark_last_busy(inst->dev->dev);
>  		pm_runtime_put_autosuspend(inst->dev->dev);
>  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  	}
> @@ -1364,7 +1363,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
>  		}
>  
>  	}
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return ret;
>  
> @@ -1498,7 +1496,6 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>  	else
>  		streamoff_capture(q);
>  
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  }
>  
> @@ -1662,7 +1659,6 @@ static void wave5_vpu_dec_device_run(void *priv)
>  
>  finish_job_and_return:
>  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  }
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 1e5fc5f8b856..35913a7de834 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1391,12 +1391,10 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
>  	if (ret)
>  		goto return_buffers;
>  
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return 0;
>  return_buffers:
>  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return ret;
>  }
> @@ -1465,7 +1463,6 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
>  	else
>  		streamoff_capture(inst, q);
>  
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  }
>  
> @@ -1520,7 +1517,6 @@ static void wave5_vpu_enc_device_run(void *priv)
>  			break;
>  		}
>  		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> -		pm_runtime_mark_last_busy(inst->dev->dev);
>  		pm_runtime_put_autosuspend(inst->dev->dev);
>  		return;
>  	default:
> @@ -1529,7 +1525,6 @@ static void wave5_vpu_enc_device_run(void *priv)
>  		break;
>  	}
>  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> -	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);
>  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  }
> diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
> index 0e56a4331b0d..45f8f6904867 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/h264.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
> @@ -585,7 +585,6 @@ static int tegra_vde_decode_begin(struct tegra_vde *vde,
>  	return 0;
>  
>  put_runtime_pm:
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  unlock:
> @@ -612,7 +611,6 @@ static void tegra_vde_decode_abort(struct tegra_vde *vde)
>  	if (err)
>  		dev_err(dev, "DEC end: Failed to assert HW reset: %d\n", err);
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	mutex_unlock(&vde->lock);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index fac7df0c4d1a..0b37f9b76da5 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -142,7 +142,6 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>  	}
>  	mutex_unlock(&core->lock);
>  
> -	pm_runtime_mark_last_busy(core->dev);
>  	pm_runtime_put_autosuspend(core->dev);
>  
>  	return 0;
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 7596ae1f7de6..8a10a36abbc2 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -951,7 +951,6 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>  	pispbe->streaming_map &= ~BIT(node->id);
>  	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>  
> -	pm_runtime_mark_last_busy(pispbe->dev);
>  	pm_runtime_put_autosuspend(pispbe->dev);
>  
>  	dev_dbg(pispbe->dev, "Nodes streaming now 0x%x\n",
> @@ -1740,7 +1739,6 @@ static int pispbe_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_devs_err;
>  
> -	pm_runtime_mark_last_busy(pispbe->dev);
>  	pm_runtime_put_autosuspend(pispbe->dev);
>  
>  	return 0;
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 8542238e0fb1..fa972effd4a2 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -89,7 +89,6 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>  			      struct hantro_ctx *ctx,
>  			      enum vb2_buffer_state result)
>  {
> -	pm_runtime_mark_last_busy(vpu->dev);
>  	pm_runtime_put_autosuspend(vpu->dev);
>  
>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> index bf6d8fa983bf..161f8919022c 100644
> --- a/drivers/media/rc/gpio-ir-recv.c
> +++ b/drivers/media/rc/gpio-ir-recv.c
> @@ -49,7 +49,6 @@ static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>  		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
>  
>  	if (pmdev) {
> -		pm_runtime_mark_last_busy(pmdev);
>  		pm_runtime_put_autosuspend(pmdev);
>  	}
>  
> -- 
> 2.39.5
> 

