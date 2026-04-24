Return-Path: <linux-media+bounces-59469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMaLFh7r6mnCFgAAu9opvQ
	(envelope-from <linux-media+bounces-59469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:01:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4D45991A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD42D30058F2
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D5932AAC6;
	Fri, 24 Apr 2026 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OtfxO+Dk"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85383246E8;
	Fri, 24 Apr 2026 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003282; cv=fail; b=uElJVJGWhnzUutZ6dae6VvQWN3zyHF7Xpja0Rj3JS0zJc53lcN+Mqb8rYZnlGsIZ2ocJ+fMPlUTVXal1cogIQ8YzzJhwxV81BslbX0BV21/vvMAHq1MKncEBmio5az0iKv8Dt3FtqGA7PU98Db5SU9I63zu8b1J4wmwvweB+WJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003282; c=relaxed/simple;
	bh=NhAcVFzwyo5GxZ5pErwaqH4+KEdRw8qt4bkTyqZ7Nyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GeUckTfSDU1jHq0msYWkOwv3gM+rxoGJgxBbh41yZOONgUunXOYmgQS+ZkYSFdXYN0avhBW7q4D8Mp4rNn6OKtgKLP8GDDrqcaKk+Oc3PRIDow1gWE3I5FDB2s5YTTH9sx8g8SszfeC+l0y+j9MacfMif8heAnrJWKM3Itu26Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OtfxO+Dk; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op9sMv8dYpnn23YBgFjf8/FaeDQ/u9tG0L5t84lcXChdIvSY8sNfjT2Tl5npS/oJTJiCMxW9AwhIAZuwE5lkX5GPnKIj64lq7Bixpc++++Bt+bN2cGNwWS7ftY02H7iY1aU8ZN6N/ULV1TUbfIr6OdO23VEssIS5Thnh2/VcIIP7ROaY0t70Abd5UbHzqvx6ETTpcniRRkF8LskVKtztmBx9Gi+4xytp7c44XRghes9QaZMbs1EduqjBDK8bkoiX/yr/PixHx4TNKzmExCA92w/DI5mozci36NptuvoowFN/sLBQRM1Rho0fSw3GsKeMNqnB2FTV2BqbWeY/3YhCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpujrs8/T9khqz4kOMB5b5eQ6mfTFRAxAEUhHY8iLsk=;
 b=khublKBFhWoef8skdWj4ft71gdKXftbOORzUbvtOdEN5vppnBXxGFIqs1x8MFXYs5Z3QZ3r5gPGsoq65JhTJCo99j0+afniSTvaUUd+WNwXYVULfNtiHNKg0vNCipCmfm2qBLjK+K/z32xjaIuhkSteshxbiWHubUGCvzznly+pt9dzAlAIpMVeLyZCMRb52IXCJzV8bB39WZ6ZZ12ikoh4QJMH8DQ0gYl3HmxOXEaxyBQvvuu8tU3lMMdUCqT7U6j/CHEtj+ijLsrI8wkVetnoE08/HZrZpd62rHg3m1SJchsFdJB6Dz3QoecGphM2sm03rDd/OaaKTtIYxIP1mVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpujrs8/T9khqz4kOMB5b5eQ6mfTFRAxAEUhHY8iLsk=;
 b=OtfxO+DkwYu5zZn6iRM5neYYywiXdNO21AmrxQbN7kwtEMZc0hakq4yy/gMpb59pfyMMr+/aEz0ZVQ3k69XmmhXlb6z4+XmDmb0yWS+Sxyo4DkNRq9Gtp8jyMD93NoqfJDC2/MTkmgPTBYHXURy6vQ0JEMtJNz2eS0J9OQuDsbldzHW0gwmn2isV9Yty2VaqjuSAZk1t0CVA2G5cxMO1colZd/r27kv8wC5Io85e0r6cgb6VnQOHOWh+pqXV0jfb6KTYXVK3A7oIqsgEcVW/q3izekkYDnFU+CmcPelKgj34dB6jmqiKL/C9urF04bAyeMMqDjiGI319u9TeyZTqhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRRPR04MB12618.eurprd04.prod.outlook.com (2603:10a6:d10:1d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 04:01:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 04:01:17 +0000
Date: Fri, 24 Apr 2026 00:01:10 -0400
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
Subject: Re: [PATCH v2 4/7] media: synopsys: Add support for multiple streams
Message-ID: <aerrBngobmHHktNU@lizhi-Precision-Tower-5810>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-4-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-4-934c02f3422a@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:806:120::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRRPR04MB12618:EE_
X-MS-Office365-Filtering-Correlation-Id: a2915731-aee3-48b1-79c5-08dea1b622cf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|7416014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 X+RkutpdpUC3S4m8JVNuAUvjcOBzUA/bHdLFS6zkKV9NpsQb1OakQ6StAcfB/yti6YS4njE+WDaqzzCfh7rsMlzCUrXazeTKHrUji4JaDEdigBa/Yfxx6EEXUjBYhAN6tP1cmh/DN+IqJdQ/pDeDkrtZS6pXMCGPgy7MRFrpDM4k3DG6JmbJ7KyDq0Gdy7UgUhSMWwG6R6Tb1Fbpc3fMfnuqA5rrzNTZW7dHjLtYQH9TMxUUzZY6e+jF+OFZcfY1H0EwhKrsPuZgh6XWBS/k5KQhtXqzHmn7QDdfbtS4wCrowboX12Y2Jo/l0q63CyyG9rMiQ3xbxa3VoyelGv5xhRXyL5/LNpHlbnPaLPmojOwUPLVhCR3iTEbbX5OsRjx9rud9UIBXsPtfksP+BEpJmVZ707tl7K4zyr8IZ3msRr0aBblMlOaDXKOGdxzqJaVj2sQfohapFriNtk0c8i/bjzPELpA8IpIEOfHYRBlwUhezJwowMuA6Rb055vegNJ1dS7NZ9El+mrLGUtINtfP197bCYMfxf9gD7uRyZwH902jFM4iRTJbkjB/KdL0frXQPJ7NMHKoG425YuaOavX5j69ix++0jhifw5k3CxQkoHUmlTeEZSAdtTIBb/kRaJ1xTI/LSa8oJkcUu+EZAv2Js8GdXuTOfIyaRCU09ND2tge2FZQTKxexLfAjQ0IiZSqHwA2X8i5rl9Wz7rQIWpGhGw5QePQUhm0lyWzYOuVy9JY2r6ov74mpVQwB5rNq0dwwPOVt0yyPgx0ty5xUsByOTnMeM8bWSngD/FhDxAmTRDc4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(7416014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gBHNxBFNoSDGgC9r1mB/0b8W1wQ9Uiey+wxgKZbDGDvAk8zGvE/8MK6GqmhK?=
 =?us-ascii?Q?UXbxoZyfWNUKjnkm699VhMxUFCsPmju8aiQrII8YBe4wXaHCvTIUNxmr6W6z?=
 =?us-ascii?Q?aKZ4K1JG2VbGEihSfRpOtCeGMjAz4s8wLgrQ5Zxpx7s/lJBHVGwm7uW3oLq5?=
 =?us-ascii?Q?bm4c4IIzgznpEcZ+E8FoclrVeGMZsSQ4SrQNag2IxpaGPSoUEs6g6vtK657E?=
 =?us-ascii?Q?Ga0PbXMw7noCOk0oKCcD9m9qXJN7ODLXEeY7GzybgrZ97dumNyN85M1+/Swh?=
 =?us-ascii?Q?BC4OcnTTkKb0nsfazGGGWf2wgfv6Bsyu8S0a5iPVY4HkXzW2yiyAzCvCId3a?=
 =?us-ascii?Q?pc1Lk2gtjJKwkfwRGOI0w3Bb9lRrG5HFEfVeswCBdSrpKBkLXz0BOkFE88/Y?=
 =?us-ascii?Q?zcyqw6sz4b4kfSl0p1GOxC/VYhoJlWqCFqIEgXmKIqbULy4V9RZdPKTzDqaG?=
 =?us-ascii?Q?Y0UhcaZoJUlFemrXJILzoXaX/B+pkebCd0ZSKikWnGLG8LkF0GawO5F0JbZx?=
 =?us-ascii?Q?eT/w6GDsK4tvHzA3IfWBt60g1lPBvzHUqqxHtMrCk7bFJ4pY5Y1EnbS9l+B4?=
 =?us-ascii?Q?qCNkmWeMz7HBljLVRWmkRuYlH3qxsLEWPHDBjpz77F0rsJ7IKFJQ7hHmUfgx?=
 =?us-ascii?Q?fFPnlNTt7p8aIUt2d9l4mWuuMuCbgsPQx0Fue1Pi0EiMpgts38XhTW2SFBlc?=
 =?us-ascii?Q?w9DXIho46zgHRU0a7mkc2XLr9LBzK11ecQrQ6dEIdr8LxBkQJuLXSewVXZ6z?=
 =?us-ascii?Q?9jtdWpx30TstoLeUqjuG8bDyybLD8w8FArPbW43pSgKI9Tyz18r3aqa88Q9M?=
 =?us-ascii?Q?Gs04AU/vY9wjq0R1tVxinouozOCG0ZRGM/5z5VspzYlcP74hnYmgqT0a1dsL?=
 =?us-ascii?Q?7L3L9pb7sF0Ip9jllgq4Yc2X4CjmNs0Sk3rKcdgQSXUiuNx4mjKsZ4aFjShE?=
 =?us-ascii?Q?xQlkUMpqLUYBV1xA3TrDN4FIl2lDNUqvbXB3QchlCYcSvRzIqThHzFcO36IA?=
 =?us-ascii?Q?JjwqdXBnOCUsS0qiSmzm2XFZcWKT8KzlOP1/B3mvP1GTmwJEmTxjEW9rMjaW?=
 =?us-ascii?Q?p0WnQmijbiULeVEGGZdQ0/SZZMQTPqtcG/zJyNh2KL4JhVjLVUc2MgX5ZO4H?=
 =?us-ascii?Q?B4zXRRqooBSXXUp1FCaNz1JZvYzpAbUqBDePzAIUByOyFxUHiIbPO3Ipxhf9?=
 =?us-ascii?Q?Bnp1k3u9lPw0bo/Ow+IdsbDUv/1EfCuDiQIkfnr5ZawR28v51kvD6uhYh1OH?=
 =?us-ascii?Q?OWoLFJJmneUmlH+i9cGLxbAcQjSfKF/nfUPNzYfG+y54OpneIBR1JYrzswIL?=
 =?us-ascii?Q?rMP/KNcWqEADQtveDfqeLEfYKubLlIhmW2ZBKoDhy/6brSNBHtTsV56AMlZk?=
 =?us-ascii?Q?T8Y0OrC+8b0/OTpThVfvz5TT8K+D0vVJwWS5lDFke4Rc7eQqnyNtXXV3TlVT?=
 =?us-ascii?Q?vpCND0U/kukFEzAIltj6OKicfXX8FUZtouXBge2YWp+zVJIL+IHC/fhn0azz?=
 =?us-ascii?Q?bE7BgNUslFdJUCiWHQn+JEjxQYfzlShAaYA8XWoihYm9yPKk7m+Y2IXsnQ/6?=
 =?us-ascii?Q?TCBgF03+SyuRPezZs3s+cTaoNpxyGO/X1ICNIn/1Fdzf1GR+nV/Rw1rmsM3O?=
 =?us-ascii?Q?i4IGaNNaaJ3gawPi4ILjfzAy3cAjAQtgXgugi9y19Ll3bG3w64rbI+CYpOK2?=
 =?us-ascii?Q?53ZbJGs/bDy+LjF3634WyNy7jnFT6w5ukHfi1qnhFr0sNnTI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2915731-aee3-48b1-79c5-08dea1b622cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 04:01:17.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7NNNH0MxLqUkxcNyxvaiRSR7puLkwiT1V1K4dPKe8jwCcxlOVLHhWHc5XHMXJcH/wYjona3ISU+oykU7dYwqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12618
X-Rspamd-Queue-Id: EEA4D45991A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59469-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 04:22:59PM +0800, Guoniu Zhou wrote:
> The current driver only supports single stream operation. Add support
> for multiple concurrent streams by tracking enabled streams with a
> bitmask and only initializing the hardware once for the first stream.
>
> This enables use cases such as surround view systems where multiple
> camera streams need to be processed simultaneously through the same
> CSI-2 receiver interface.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Simplify error handling by keeping goto labels instead of early returns
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index d572d2eb3bcb..5a2e74d055c0 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -113,6 +113,7 @@ struct dw_mipi_csi2rx_device {
>
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
> +	u64 enabled_streams;
>
>  	const struct dw_mipi_csi2rx_drvdata *drvdata;
>  };
> @@ -537,20 +538,26 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto err;
>
> -	ret = dw_mipi_csi2rx_start(csi2);
> -	if (ret) {
> -		dev_err(dev, "failed to enable CSI hardware\n");
> -		goto err_pm_runtime_put;
> +	if (!csi2->enabled_streams) {
> +		ret = dw_mipi_csi2rx_start(csi2);
> +		if (ret) {
> +			dev_err(dev, "failed to enable CSI hardware\n");
> +			goto err_pm_runtime_put;
> +		}
>  	}
>
>  	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
>  	if (ret)
>  		goto err_csi_stop;
>
> +	csi2->enabled_streams |= streams_mask;
> +
>  	return 0;
>
>  err_csi_stop:
> -	dw_mipi_csi2rx_stop(csi2);
> +	/* Stop CSI hardware if no streams are enabled */
> +	if (!csi2->enabled_streams)
> +		dw_mipi_csi2rx_stop(csi2);
>  err_pm_runtime_put:
>  	pm_runtime_put(dev);
>  err:
> @@ -577,11 +584,16 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  					       &streams_mask);
>
>  	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +	if (ret)
> +		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
>
> -	dw_mipi_csi2rx_stop(csi2);
> +	csi2->enabled_streams &= ~streams_mask;
>
>  	pm_runtime_put(dev);
>
> +	if (!csi2->enabled_streams)
> +		dw_mipi_csi2rx_stop(csi2);
> +
>  	return ret;
>  }
>
>
> --
> 2.34.1
>

