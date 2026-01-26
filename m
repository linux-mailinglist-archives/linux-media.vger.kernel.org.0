Return-Path: <linux-media+bounces-51583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHC3HI6gd2kCjQEAu9opvQ
	(envelope-from <linux-media+bounces-51583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:12:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 290818B56C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30D6E30166CA
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 17:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EB134AAEA;
	Mon, 26 Jan 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BDJJt+0r"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859533A71F;
	Mon, 26 Jan 2026 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447556; cv=fail; b=OovJY6xIctooctn0vS6FatyTxe2TmJ5AdzZ+z2SYdGxnbseJzYkhAANYF8Who4hQRPp6pTx5DvUmGbRBpvOaoSMxlLEjTI0HHYtWVhJid8jsvGKx91IbTkyClzryc1q0qNOWy/AFpnPaY2rTdbL/P9KSnYLEwh7L7ib+Vyw39ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447556; c=relaxed/simple;
	bh=6gsyOerEuCH/h0d+Hvg6ZrD6lsT06DD0pUKt0lXpaHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XUBdzG05odwap20Fy8GfiPzEQajHwMY0LkzfTb4gTZaDQOjaxafp04FSDu02qaEETi0jN/Y0oIg8ZzjoyS9V3cbdULsAxoWuHDPra52qKhNcOsp6vUNvJO2cnQSH/8PlvIyFo8hpKv/3rkDlnUBzhonDic0DrOkMHUwMO0H7vnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BDJJt+0r; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3H/Ae9LBz1hgHKmAWHHUGKwLYdW62M6jaeQbjmzFHR/mwMZKOCQNo0cvMFnmJZTkJqnR3Lxps+Vf9na2GAv/VEZtX4/9pGxS4VSSAZSgLLelPumaSlhPc4N5vsu6kFZ2LcZ3FO8Rf/wLU3jN/B/dw9e7FOtgU9lU5ZoPdrHWzVM+y+0NMjCLlPLv6GGKJsTD5EgQPdtVMu4/OfEvGGSmF1Kl6eK2zeA2OEVvufXGd+4HCLg/2IulnZlesj/vEozRAIKFoPWT5oWv97Lae2OiWR3Xvt481m538kV00PuuINtiSBPKBGfwxVqgrO41rYAuKbOkk0wWPkN+grBeEO7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBylTv7JioS9YEOprNrbLeTbzV04zUKiC/wbmtfSX6c=;
 b=sCnpqOBR7miVW4W6dljAz8l//TPRDhLjvdc0OzJIPOk/dMI5e8rpjEtJFa/NiDaI9iK9KAXfJWrGQs5yXNyTH32MljmVxrgRC6VgH43+TEwrmflWQINPpmckXBvyk54Un1Unsk2N1xouvtxXQUh8w1NdhGgLqvjAAWQ8PolwmOM3GlfzI+bx2ZlpA0w8idaxCtxi62QdLi3Hv7o5sT+DQngtalOrPBxjQHiZLdDRpp/ohpDBMqdP96oN06EzL0rK8Lk3FlO5JwblpQ7qZUgmC/aa0xkW9/JDihT0vVCyWc5vzn6jn5dVXH7yLAr+eYDHW419x+oYP5nAGchmOZuD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBylTv7JioS9YEOprNrbLeTbzV04zUKiC/wbmtfSX6c=;
 b=BDJJt+0rWgJyztWCMkc074HDv1tDtBKCB4WrcV1UzEh6vd47W0gPw7vByvYLLmnzl0WXR3TVvf3eFNKu9bgzWm+M3sMpLsS7HaIBZ7v2vycYeUffYGPXJ/AeONvc6o8NvVrh2DUcO5pMiQzP/L/g5JX7mSrkAW912UIgakFBQ9A/HfB12K+QkrSDfTRk3jU4Kbu5tzrDbuSTiVPT/GuDPVTZxxL0Qh7HyQsZQs1PqzWTE027BZW9ozvunKaS5ChlnkY/rrtKBYdg6CIRw9ePQzILi5y8IJDWrebcCmOPQFZ+Fitr8zDLLe6GeaFN2fDqs23U6b5DJbZ2+dWsUI2qow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7116.eurprd04.prod.outlook.com (2603:10a6:10:127::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:12:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 17:12:30 +0000
Date: Mon, 26 Jan 2026 12:12:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 05/11] dt-bindings: media: Add nxp neoisp support
Message-ID: <aXegcnftIYVejwEX@lizhi-Precision-Tower-5810>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-6-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-6-antoine.bouyer@nxp.com>
X-ClientProxiedBy: BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26)
 To PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6c9a56-016e-4a1a-ee6a-08de5cfe1680
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?op4yGNqagOfUITmdHDARh2y0/VwIWgilW4m1CxRkgVTvR70Jdi4/pP8o+/uU?=
 =?us-ascii?Q?lj/HBio44Fg8OKo6qCXLA1b9XXTSHa13oq6SPRbMw7VKezJ1NqkI4e3kkBmS?=
 =?us-ascii?Q?uBUQOCOMa++7CQ4CukUSTS730COzIle2uJ/Wf6el7sMtoec3WVm8gEDgIiG6?=
 =?us-ascii?Q?S3w+7ugMDRok7rDEZXKMCFybvAQzf+wC5qKKCzchLCi2v+dli/8BSzGowtPB?=
 =?us-ascii?Q?BNbp+Pmm9B03KaQgPsNLbhZVCfdFeYebliKWr59ZTzj0APaWS7BToV2r+Tlo?=
 =?us-ascii?Q?mr3Q1c62vrrfhVymBuYsRkQmpevSLEWazt4i1hsc2vIjheYaLWEqNxE9JOd4?=
 =?us-ascii?Q?UVaiRihyAlZLRJsEZn/j5Kri6rIKYgEdeFR4xGGpuxQqyYOY6CpfYOzXj+7G?=
 =?us-ascii?Q?wyRBiPYVCjlE2nARb2Zuz2nWQ4lzkXu5mTu7oEa6hS266iDLtSMLf+kbfz/l?=
 =?us-ascii?Q?culfz3tXCjOXjsEozlwJDW670y8jAiNrB/D2I0mEuobEVg3w56r9PF2Vik8w?=
 =?us-ascii?Q?izDsc6Dcny4o4OHm30iLt3KyhhZ9P4Zo69E/XcsOZHV6lJCymUWjpbK0cyDP?=
 =?us-ascii?Q?BuzcIyOg6JEOip+/0TJO3FuNM/u1pWUx5z9/ATqoJqMA7EZHfghcKgjNsI+d?=
 =?us-ascii?Q?oXREeTb/u1WZcHAfjS62+1R1ilzLgIsy8ODLr2O9I8kMEZ9OK3eOwufaxxQ1?=
 =?us-ascii?Q?b9gvfNqQQDdPEyxcbT0PZkclVBS6yGbulhwke3hqRIfuWjuFOmstpSePrRfN?=
 =?us-ascii?Q?kY2FOTwwlpeG9A7JID5dmD7MW1H3HjEbJSmvDoHcqaJYrysgfiDVePPGxJxd?=
 =?us-ascii?Q?7KcDblK4H0uIpMPpxlmVliPLnUtFy6aZOMlMNREOnhXNG5gEgAHwA9WTJLKl?=
 =?us-ascii?Q?JPqVn7JvabFJRtuDvnxOLHfmuax5QBQOzgQvBo4orlfLAwpHc9+mw2WBo45h?=
 =?us-ascii?Q?wXp9TK69pXWSIszoHj+ddu+MCoVJhBACc4TzsSqwCdGp7JEkihg5PGoA0hzP?=
 =?us-ascii?Q?HJRS4hsp2Jn27inokbNf7P38V3CduW5zalN41GMC8SDZrRIakJgEpnkS8icb?=
 =?us-ascii?Q?wSRfEcyiDpqXnnzauygUxBUCCzoMLRY1ppBb+VnivsDtYhP736RHsy5TgEJo?=
 =?us-ascii?Q?sC7QMcIEtRJd1Hmw/elK554G75q37zIgx1mtY/LWos6DPp3fDYPe10+U0/OO?=
 =?us-ascii?Q?fy1DxdTkByW//gAxoSk8uZQ91IoTSwzRi03RAKRrYpmnoqkSCdIbaMeOYbHl?=
 =?us-ascii?Q?bUIAdHGJKKe/hgWI+R9hJFmKYOOwEFwv7Oo5rA31IntcwjoHXHDMYfFcqnsW?=
 =?us-ascii?Q?u7QAT9xOUE+S8FGlv0skpeKIjmUhucrxUAM2qzybBcIAAM6Ybzd1QVjhAfse?=
 =?us-ascii?Q?STbwI57HHFeOnLGH+MLhdukhIZsC+72RyFfypQ+Rtdr9CTZd0ZQckKV0vN9S?=
 =?us-ascii?Q?GHxWQBKmpEKgKcSS/CHtvwudrBWIBp274fvJXa9aLSqpcWEIHptp5vn90JZH?=
 =?us-ascii?Q?xGB3RbAS1LM1ANAOIEucusz3TluYi9JZJxhbxICHx2iiuX37IJE+Ib+ywUx/?=
 =?us-ascii?Q?fkqntIZbrZLI8CI3854L8SZrNTFYcC7rIbOiOKPc?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KMvtWGrjpYgqxnIV5fYN7XHadvA4ZQmO3mtY/9SEFuIDgJ+6WJsUa+gFkaYg?=
 =?us-ascii?Q?3D4bOBqWdyAhXQswryTyFln2Ii4UvrccmC5atdpTyy9BSBb8ns5KxDR0gGVD?=
 =?us-ascii?Q?V9gJI0r9QegkhvCGadVs5amExNBB/030ap3Ru8b88PPWh0D8BaFesf7qncd/?=
 =?us-ascii?Q?E9uCp91tl7xa0ZVya6Ci15wIwWUDsQD9COpSTfW4kK7MdLP5LYhw2CdB9RqC?=
 =?us-ascii?Q?Ze6ywgF00NCTrKnwjhL92Y9jKS8H5HERHZTrYRkGWG0i5XiQ2YAl3L1GiCOc?=
 =?us-ascii?Q?VzPxmhNgg7CC4JFV9rLffaZrrVSkYy63R2PmriNTPrQywjBvlKjcB2zq13tB?=
 =?us-ascii?Q?k5DxyV4sD3DH1UVQE7vUhIEd65kOcPCzcB1DmdUabm+sgGmwUYyHXMnQSASI?=
 =?us-ascii?Q?ksc1vnf1YGn8F988/SwbtnHFNudxKFxJ2vMgA6qPDtV5GSbeJJmhXqj4wYeH?=
 =?us-ascii?Q?nJr42Htm5IcjTNC+v77qvNR/fudGoFKACGLP7Cbvvdfo6hsSUk9qUCIXF3DS?=
 =?us-ascii?Q?xKn9rXaHu6TOkQV/fCRVzwzBBkuHBUSss1NDohBh3mi3xHV3YCJ4xCzl+Jx9?=
 =?us-ascii?Q?X1jUAOCue9FQ8qtSEcuNKdxaM4jFjIySkp9SHNl2ifqw1VAagGRcsdv0/iXU?=
 =?us-ascii?Q?xiWI+8eIio5p0HfV0vzJUGX9K0cKEtDgY7yAvK/1iqnSI38UT0D4o52zfGvg?=
 =?us-ascii?Q?K+yQqUgawqU2wXv+h8Gv9C1vmzI83smjKO6BQzlT9tnnc0kChqRGprofBbfT?=
 =?us-ascii?Q?uHR8uios+4CxxeCB1fQr11QelQPvD0kiMJjN3xBYYRjN7DEkWfAmGxaKhcSh?=
 =?us-ascii?Q?L/x1xrgMDN0l10ncTsms8zXzAPyxoWed7YJ+dHZawp+dKQMJ0ADoAgLhwCwa?=
 =?us-ascii?Q?iSTDo+5nFa753XWW0rukeMla12WXtKoWTlhqKNPNgds8r4aubW/uBxDiUdH4?=
 =?us-ascii?Q?F7KPzmZj45pSdFlaLYmsPsJkx1HP2lNJd2B2iKu1of7x6qujdVZKkL0bJGMW?=
 =?us-ascii?Q?ucVW9EzrFfUFq4l2jSExFXuRJu7ECwfoQJ7nXjvB4BXN7lKs5HFDlE8aelXs?=
 =?us-ascii?Q?1qu4AE2Ne3KiOazMWPpUU3rfVtI6pLvOzvj+uyGrKixYhXktOUeAijyVoAOE?=
 =?us-ascii?Q?nrzLvSTeiULlZg2GZFXEM8X6auy749pPqimfUj66SWV7iWX6J5BC5P4kQD6M?=
 =?us-ascii?Q?HDc292UKLvYonClkFI9RXYzD03R9H3r3h/IM3XE5x9ahV/6alZy5qXvszoFQ?=
 =?us-ascii?Q?8tGsmHisKKcRlDLfJIFOb9yKkIHYiyJGeT7RilTfry5sBcMUTyDe0ougGEro?=
 =?us-ascii?Q?gd+qo7POPmrShWb0CenEbXWuNXURUHL5nluAjnWGP+r4g8PiBW0JaoEH2Qcd?=
 =?us-ascii?Q?ksIvUKBMH3kq77VvRr6bNdTooZfNMO8TjpoxgJwWJ91DWV/ZQYZnx9JP94Wk?=
 =?us-ascii?Q?8KhlhS/uz8A3ZCEbWPYmNVqsU6knEiUEeGnjpZQWVQl2e33luoyviNc+4/zX?=
 =?us-ascii?Q?O71Wv5Lj64OsQf6jY0nIZYTC01bJQqEXsfDE2W+JbdZJVCtTPTNHpm14LY8D?=
 =?us-ascii?Q?ACj7CHY7VhSquups3j+PUS03ETJZXE2de1PrYl7nedK3ZqXSD0nUDfeJoagJ?=
 =?us-ascii?Q?xtk/5Ssrr+Hv7UNnu8skf04utoa7WxtS6Ny7t7Fp2ZW8s16NakzUtRmghKRM?=
 =?us-ascii?Q?XY3dEwfY6J0PBm7dEUjqE0xqw5qsItEbxLctG4QpboxCCjwb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6c9a56-016e-4a1a-ee6a-08de5cfe1680
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:12:30.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: houcauZgMp2S6404gPTOQEPIq2ZweCP/GoW901G82AeOxx+HVPPgR7t2p+diqk9tWza0kDcy9dTcMQPd/4ACRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51583-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 290818B56C
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:09:32AM +0100, Antoine Bouyer wrote:
> Add dt-bindings for NXP neoisp module.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,neoisp.yaml | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,neoisp.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,neoisp.yaml
> new file mode 100644
> index 000000000000..4dc9fa5a03b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,neoisp.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,neoisp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP NEOISP Image Signal Processing Pipeline
> +
> +maintainers:
> +  - Antoine Bouyer <antoine.bouyer@nxp.com>
> +
> +description:
> +  The NXP NEOISP performs a set of image processing tasks on the RAW camera
> +  stream and provides RGB or YUV enhanced image.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,neoisp

Don't allow use generally name for compatible string.

One option
	nxp,neoisp-<version number>, or use below one as fallback,

oneOf:
  -  items:
       - enum
          - nxp,imx95-b0-neoisp
          - nxp,imx95-a1-neoisp
        - const: nxp,imx95-a0-neoisp
  - const: nxp,imx95-a0-neoisp

Frank
> +      - nxp,imx95-a0-neoisp
> +      - nxp,imx95-a1-neoisp
> +      - nxp,imx95-b0-neoisp
> +
> +  reg:
> +    items:
> +      - description: The configuration registers
> +      - description: ISP local memories
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: camcm0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    isp@4ae00000 {
> +      compatible = "nxp,neoisp";
> +      reg = <0x4ae00000 0x8000>,
> +            <0x4afe0000 0x10000>;
> +      interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-parent = <&gic>;
> +      clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
> +      clock-names = "camcm0";
> +      power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
> +    };
> --
> 2.52.0
>

