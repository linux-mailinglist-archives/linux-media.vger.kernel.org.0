Return-Path: <linux-media+bounces-59471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKhULiHs6mnCFgAAu9opvQ
	(envelope-from <linux-media+bounces-59471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:05:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2517459A44
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E65B30055D5
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A7E3264CC;
	Fri, 24 Apr 2026 04:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iQ38444A"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865B32695F;
	Fri, 24 Apr 2026 04:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003518; cv=fail; b=iHOzOv24F9228sIO0eS+hg376HJzc7kLtoEq1ioe4X8yh1QU3x0dUbgZl54OPTN+X/HyZ+ZclGAddtuiqG2JaVsbHE6O6uClo5uphMo74c81C02UnotuB/lTUk0gVTrwN6HY6B08RgN7/uWmN6oG3T6DlSs5WD57fI8/6Rr6smE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003518; c=relaxed/simple;
	bh=1Wl4dsDYwGfsYD8H6FIePGln+fTrramnmypuJsatICY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a3HSJzK+p55Uj+PQIyCV8QsfGOwa/q8bFoV3AsIb6Egc/9nZYrb7HboBwoZ4tS7TnXFZACRt1HDx/VHJu4BG77dWkiAstju0nbnZFccLGMAGQJFJF6x8Ko1Iha05GGj5sSVPCbTkDKkImoYIeudygbbvvZf/dD+dkr3A+nUNCn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iQ38444A; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seTzOxE3MXKBub7awaF34Cz2TkGltKEYpIkC07gO85gHU4Logs7+2KAt4KGXcxTbcZs+WiBRDUUa+RtAv3FMaglG9ATZAPIQudJqDFRcbx4edKQ8YHC+zPPEmSo6HqA/YsO3Ti1uGQjNPXsDvZu7l+3HUlL0LnNZhptmy8GpZFHvEyztySF+2AnkMnhFj+Ukv0w6BFL7H6uOngBMuwLwRSX5MEa1cnrDprnG45Jak5Da2JlVVFkO/R8TpX3D/EgLCsJa9Ffao5E1DbLmjpqsjJ1FfgVaHEVlTjELstgfvnoWBKi+OAl4+d2TUbWnndNOb+dx7YAd+4QOtopS6DNjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35G4XE/mIKGPsswZXiJ7PZUjKNqMilFlyMRO4sj9X70=;
 b=BfTmVAKXU+H3FmNSiL0CeYt9r1qtIXct1RjN81SVREaaHT5g7sSCjfDB0RguhpGfH+tzYOiafHUsd9mNgkYeNaPqBaL5Vl3sp0MFx0wf2OEVEvGpe7d5d7IC7YNXoQ3KysYdcz/lFBNiSgcIXI3hdYIBHZPQfFhPVt+4M12y4hym8hUef4+mf38xeYCHLuFx6+SFjMc09EU0fiQ0TV8ispt4mnFQDViihCLZkJ5ANj7RaxV+H0N00mW4hZ1IoFbHlF2HkdEitva6T3Fwmbmi4xx+OTDV3Icg8kjH3BvRUXmnry71ysQXd9ywS2UoVMi6K9d5avjFs6M8VnlnL4qG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35G4XE/mIKGPsswZXiJ7PZUjKNqMilFlyMRO4sj9X70=;
 b=iQ38444ASl2a7Xfejb9GZakyO6wNTgT1V75BD4E0u/Yz7m0L/No8kDK/CGR4Bsp6ZuCxHCpnKr2WUKzOhKvFPaKf7E5Go+20C0GREl8vVNQ90tEWj/6p5YuWRFKtz0XbJt1DfFO66gvpnE8yS8x8Xt25MvzVkqWBMraXArBrKnRhP7/Ljqoiapisx2AUsoiRQjo0VJSJ/4ehcxDt873dAMH8uw46fY16nXLquXhtyB9M65hBCYZpbJSN2JjAtyt8cps37f7lsiqwuwUOboJVbU9tHZ8cQOSYa1z/FNud/tzPNKDV6JPV+oXoB/4OZobo9C/k4dKwlpjXRN1vY3LA2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRRPR04MB12618.eurprd04.prod.outlook.com (2603:10a6:d10:1d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 04:05:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 04:05:14 +0000
Date: Fri, 24 Apr 2026 00:05:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 6/7] media: dt-bindings: add NXP i.MX95 compatible
 string
Message-ID: <aerr8XazTpavGP5K@lizhi-Precision-Tower-5810>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>
X-ClientProxiedBy: PH8PR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRRPR04MB12618:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7a0fc2-4266-4f2a-88a0-08dea1b6b033
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|7416014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 TZSn4Tutz3JudH3tLJNiURPtSegYTI6kCK3knkC+yfwjq0rfL+iiC61IXVee3K7720N/ZbV5pXnPPIJyYFG40k3AKZ0ok0LYVsFhgc+4AvhXVHwcGp8Cf6eOAgBTDhvFBK1QZrGkHwuVF6kzGzRsRDPx1zkZi+BB4+Vk4GdqNitVXsCkTJEsUkGc6sVyKfFq3gYkMoZKtOvsZANwoGBdcWRC2Id1QZzhR8zH3jj/2gVgCJARsPakfPAYiV14twQc8dHzkaFRi6lQFRaTrGyqP9u804vilSuJwCSim7aJ+IzWR9FC7vlaiLNOlFCuTmky19EfOauDNv6POjZKOsqaIZcQzwLol9G9lplUe7AiPgTN91JsbLpb1w+EFzUuTl94aDDUxqhoN/bE/+cAXiGXZLbg5jFCAjyFlbRZTlwiYXBnFStNhzKxpgPBN3a5W/YbIZkOP1e+4aibgChiJIdaGvQafxr7hZ+P3OISYlldnxlgQbdyyi35PL/W632Q1sQMays+UWY5AXwcPnYsDhqP6qLXynpdiGwGrzpr5gJS42FeeW8O74y/BIEG2nVxenQT4SvH54DQQoiaa2Rqxh08pSo42MvjSO1yAyg50kzwU+4VMsxQTNztJIjxYPWi12/P+4YzHOSQfqLqr1FbRNtkRF73tgbl4Zcs3j7j41yxi1vQJd0QwcarrESGjANwMsAaLKZRoBM13BJ6lFQ+dTmylWj516NzTsuToA3NHcMjXiT9xuHRQzBIWa+o6xzevplE7b+iBNYENiIg70YhmcMDEh5dQArN1AM1LHXGHfoqeiM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(7416014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zmDVMleLd+o0zrozun4QMO4zOfl2sqoPu/urhEz5ptZPtZbvwPlTNtNxVgBy?=
 =?us-ascii?Q?ZMGNiDgDMMjKcK9I94rWSLFIi6n91iB78IxCkDxj9ToGxBQAQ1VEKXx4vXpF?=
 =?us-ascii?Q?+/Q6xGXKVYN5bCg/4PgY8RgNGvK3VU0MXOchuh4AHw8aU/CPyJ1tQTwvyF6m?=
 =?us-ascii?Q?ZTYhsk/MxEY0CjpSfeVLNEmCYbaaUaEYgyC32t40d9A69zFec57PjgQ/GA09?=
 =?us-ascii?Q?RtvFmE11m7KGTfDFvfltwRIwE6qSLidxOTBMUQW3yHTePEOrgbijlTdwD+/8?=
 =?us-ascii?Q?vA8oiaL+5TQNpfcRZjiqusHK0X0CKjz14LOb5Av/qscVqtthMwvh0Lafe8PW?=
 =?us-ascii?Q?XLtRil7Y1KFRidv/dVWCSZ90GNUhLHTWkvdEv+iG0WFhXP4NIsM6AIS/q7d+?=
 =?us-ascii?Q?cY3JRMbYI+0F4a5eHBA7WnIwPauRnc+iDGP9sJOV4w0j0RrI1T+1xHCL1u+4?=
 =?us-ascii?Q?yHv6urQcOh91IPsuPe24W5keqsGyc1pLYEg7Io28dEoK4zLfxbaWvFlDZX9J?=
 =?us-ascii?Q?gcalO0lBCjO724UL9JnM486xc2sAHW5VkFI+JGyN3u4M/tB2Le873osKaxU6?=
 =?us-ascii?Q?KbX93bQe0HTTIf0KlcIbHRlEAyWPbWcyrVFeyhPBadplaJkeqA0LdJ6XD39Q?=
 =?us-ascii?Q?KlramV/18fIU8U/lYINZsnqAsab0irfFGf856dKKcf1XTyB9vfniBu8WFohH?=
 =?us-ascii?Q?xYhLn3nnu0vvmqxq5tQxhTaFmziK37zlZfl0NtwGEqLT64Yd22EAT27OrDJ7?=
 =?us-ascii?Q?kEksDp9EWdMqOfSOL0FWV6WXuFUzWP7CLWJQYLI9wMPm0gI5GhikDNm9wR7Y?=
 =?us-ascii?Q?qM/db2esqOygnaxmk81SiOHFRkXNq64rJNjp8/kOcENIXxaGPUvZ/baubgU5?=
 =?us-ascii?Q?lu0tCqOrPs4LR/wMRj8x/J//f50mc4J+BQNsLmD4tdtyzb8XX/qqZRvEa7nR?=
 =?us-ascii?Q?YevCdmcnP1/UPou2NjPLhRaYN6ZWRZ8tQxsuHXGb8TK6LiM69IpOc0TcOn3u?=
 =?us-ascii?Q?xkWnbHjrLUZW2KH7r9U7s80IXoVb7fqR11T+G1tWr1GWxEsQh4VgFv+MWPHG?=
 =?us-ascii?Q?tADMkFuWM4nzn8Z2SeQ1vofy6OxN4NAD/m1jlX63DUVjyW+zRTW+5bNM05V8?=
 =?us-ascii?Q?FuHQZWdvLHePWxkGrvL6eRfDkLBDeoEqBEZ9APtRaTIYcEeE15PPqrelvkni?=
 =?us-ascii?Q?+84akvpkoHUI5f46Z+Iz1oTLAjWrwAF9BtOjD+/eZuy9RgZHiFhhTGtlB3sS?=
 =?us-ascii?Q?zZT13RSduWFaRZg7VxXtMxfhNog1/9YYDqwWSVRzWbuyrKkxn6wXfDueA4D1?=
 =?us-ascii?Q?wcoqxZR9F/FupkZx9iDEMEx3x51JqQWAQe8tUyWLMC/Ff7BgpQjX3sueiKK7?=
 =?us-ascii?Q?NOzrf0LYfCH2GDyssgoN99++fNCHFiC2A9IYqq0j8J+FeEnalb6qriCKI9Cp?=
 =?us-ascii?Q?utG2Ik+6LNnPNo2B1FnF5qE+D8//jMmU2Crk/w2gbiAHidIsUEy+2o3Egkbu?=
 =?us-ascii?Q?ENBAahW8gXjucDyUxivZiS734cBGHzvoL3/MjYr1PJJkpblpNAOVZXwYaCPk?=
 =?us-ascii?Q?0U7MaH7E4huSma80EOyVW0JohfzL09UaSZQg1oWyHBnnoATnr8XVrZK2pjkG?=
 =?us-ascii?Q?GthO+ApPKYahaPlWN9PzPd5mhNBdQs1O/e0rswizoUhNrB+klImbBUrJy16D?=
 =?us-ascii?Q?Lc33tyRqIUlY3mbaiPOASbdnQU8BFJI5n38bDEqg88WvDOM6Vv5Z0l19XZGZ?=
 =?us-ascii?Q?OTvBqt4G+Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7a0fc2-4266-4f2a-88a0-08dea1b6b033
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 04:05:14.7163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3F3hEuYKB9K6a7vjFtwiuh6JNEO+WBlIhsu3FBCT0PUsrczn9cLGcwLRwTG/C2ImajjPF9JGvwql2ljkSapUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12618
X-Rspamd-Queue-Id: A2517459A44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59471-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 04:23:01PM +0800, Guoniu Zhou wrote:
> The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
> main difference being the data output interface:
>
> i.MX93 use IPI (Image Pixel Interface), which requires:
> - Pixel clock input
> - Software configuration through registers
>
> i.MX95 uses IDI (Image Data Interface), which:
> - Does not require pixel clock
> - Is software transparent (no register configuration needed)

Nit: Remove "Is", just "Software ... "

>
> Due to these differences in register layout and initialization needs,
> the two variants cannot share the same compatible string. The driver
> needs to distinguish between them to handle the interface correctly.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Add dedicated constraint block for i.MX95 to reflect different clock
>   requirements (only per clock needed vs i.MX93 which needs both per
>   and pixel clocks)
> - Update commit message to include more details about interface differences
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 4ac4a3b6f406..4e0bc75c2136 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - fsl,imx93-mipi-csi2
> +      - fsl,imx95-mipi-csi2
>        - rockchip,rk3568-mipi-csi2
>
>    reg:
> @@ -135,6 +136,21 @@ allOf:
>          clock-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-mipi-csi2
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names: false
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/rk3568-cru.h>
>
> --
> 2.34.1
>

