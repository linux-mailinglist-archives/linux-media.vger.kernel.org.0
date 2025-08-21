Return-Path: <linux-media+bounces-40626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5209B2FDEB
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CE473B45FE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038E026B0A9;
	Thu, 21 Aug 2025 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xh91MIrE"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F32641E3;
	Thu, 21 Aug 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788795; cv=fail; b=rNnd0HFbxhtv1DoNRYlafSSiczznOKhW7jffb/rVWdBploExIuo3DsPtrhmDZoYCfo0HCZyVsju705ZcX+OMtNkipTh60MZNP18kdlO2wdHNvtWO8cVMJH0kzYYqbFLfFjkjmknaT55G6taPp2OA3DRzvt2tScrJt2Y2LAGGFHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788795; c=relaxed/simple;
	bh=TnNuI2MbyUiPU6bUkgIUSr6KPOi2dcuh9QcFGw5nqok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tw9YgcXjv/jOPyHESrhG751h3nI5hyN/P8cMyQVmsCcAKiRN8J2dgcfKxa+mAwUO9qj/H++spI9Kq2yS7cQtDlf2lEWOPHvmOEbiaYwQD+V1Xj1JOPz0jyFDk19Nqc2eGyrNGkriF7mGBj4sLjKnSyHrPVS8hUyXwMs1e09mHFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xh91MIrE; arc=fail smtp.client-ip=52.101.83.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cU6JMyt228d2H7JQ7/duP7AhbDF6pkRiEN1nO7J0AupzkxwrLNBkr50OZSY2hrKlr6utx8c+nshWeo+BaEa4IlP2Kct2vFHldU/BS1G+GB0o4MC3PK+rkF5QiSv4dkJltDjxSwNhMjol267Z1cUs8w8f3MLkeGX3Wmn2v4abrL0I863d8Wzn57MMM7+PDMlEf0pTYNZ/Rx31AZWqKq4ez4SCty98NWl+ZHBnD1RAtzYvdckg8oypKe/d5jB93YWYNFHA+lpdQohJxWym9rsqIgGeIRZypnKlPWGgUWFcgNdfPjH/5EI/FdOV568AKKsPZNWw8EQayOID7Fo0qY1PSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8BWyYsGxTZdhi7dJ1w9VG92aypFhdY+3ZP17MIOpXY=;
 b=nCvd3lNWnkrMwA/rm1K9oXkc3Es9O004i52qrfc30rR96dCckeKvuyzX8yZ1qFi7YszNEd0ywW3/ozl05aNH3J0JXNY2DDlqgL19jZt3jcD3cFBTDMrrtQFAGcGA0HBbxP+xq9dD7J8JnuLz1q9M322MheQgyKICWEX+UowM8l3KNi6ziQd0jl/sixXqqFlMVOA3LyTYTajvgWOxWEIKDqqRJu/da5iLZJy6qztgJdB0UvCfjB9nKfhbXS1/Ioo5bykUoMW0CVTjcXfkKbQRrwjFOBnQsuACtO/MHuBCF0C+QvX7arawS8Zi80FQYw66zWPbBMRY8e9VwLJJEx4atg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8BWyYsGxTZdhi7dJ1w9VG92aypFhdY+3ZP17MIOpXY=;
 b=Xh91MIrEIngU6f8zRHnz8j6Ti7dmeXBYS293DKfKLG4SkFvpY1Ss6Xdzd6b9Bxy1S2Pfnsq+oJrQaEctJNRDICR6palqpEhJSz5G80V6ItG1uNaeWbSGYRM21MD7tmwdv5RnKd0Kme1NdfKeeMtAMAbWejTC2G1pWEA8Ly3/vTpWUq44S9MfIerqG2b7afKaZdrHPEaSdX8RE/Jprm22usK2yFzpek9LuxUqtMetUXHtTq1+xLLBnpbEFXFm6fsfpnhVJoWKENznOoYTzq7OaWwjCIXMT58YGl9oT9vBjl21xNRBuIuo+O322o8MzsLU0XQHqHGS/bYdW4SjztZN9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB10035.eurprd04.prod.outlook.com (2603:10a6:10:4ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 15:06:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:06:29 +0000
Date: Thu, 21 Aug 2025 11:06:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
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
Subject: Re: [PATCH v2 01/12] media: v4l2-common: Constify media_pad argument
 to v4l2_get_link_freq()
Message-ID: <aKc17encTAIsvGKy@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-2-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: PH0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB10035:EE_
X-MS-Office365-Filtering-Correlation-Id: 226a4612-f71f-4e39-fa0b-08dde0c44e65
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0RFpsoydSdX0u4nKhTV62oEReSvAbbQtgnNJ5kSEVlDh0eUYn3mqfi28xJyf?=
 =?us-ascii?Q?JaD2vkbPVGvtYbbIhDVBsZ1KriYZzgD885WtUcbDsRWYNoBxzYSBi7j8w8/H?=
 =?us-ascii?Q?h8T8ap7N+xZdQBaRsA4S3PSI8ztxeHfDGi9JsER2HsuNRj9txt6iMo/2WY1v?=
 =?us-ascii?Q?+VBA0LhRJqym3Dj1NzCZ+zlJfZA2Gnok4oLHKuPqYq2cJohXJrCbnWEnoAgg?=
 =?us-ascii?Q?6R8VjRjwN6DUT9VRi/9F9ib2SD7C2S+IMJ5J9ByeE3TVHVL1oWugy53hhS6B?=
 =?us-ascii?Q?QJviIdtt7aRG4308abd210Th3YUmi+8fOruZeMMwduDuVTIBmnqkVX14CkCx?=
 =?us-ascii?Q?fB/JU9Jpu0ordd4LIq0GGuAV4dzzwI+dfYCBeNnhGc0yWnOSZc0HJWVpojGR?=
 =?us-ascii?Q?HElXdS/pejczKVaidq8lf8u1jIU1wOKlMwBTi6ZexKrTRltkF+b+dfBrK19H?=
 =?us-ascii?Q?pe5h6EAJtrDW/uxsBS8Qun+79cbeRnV+ACQOcqYoPtNNN/wR9ngY7KvtuBw6?=
 =?us-ascii?Q?b3m2Xu6gxqJDl7FaeJlye4kJxLV4N1hStGr3zRj+bX3DOcDfSYLaRrdssMII?=
 =?us-ascii?Q?nQ97p7pTS1nAgvaXaxJI90n8+n1LdHxE6PIq4cGriowUGExEcwegtT1bAHOZ?=
 =?us-ascii?Q?AXgSJmvb+8lzYm52mZnzu7Qjo6HOx/8/FdXwjUD7gb63ggci9loSXYCMf/lR?=
 =?us-ascii?Q?IjQFD60aJTJZwc1/G28SZK94Luc+LRIBoWd2O0j4ewFlRds6yg6eWPuWt43f?=
 =?us-ascii?Q?TngnwN1Q5G8pF/KifRjIxSUTCIGDAjPhGvMU0EmSiQXwEwp1dLzmr8/Lfefe?=
 =?us-ascii?Q?CzlZe88JLjLWovPdgI3wJYyMiw3jF1KG6vwXfSCzUVNyeMI5ejwvJrvwfiWM?=
 =?us-ascii?Q?C4r+vsMTHJQwMOv8+vwkHbwWBpgzdEYFLk/EE4cJ6iR8NJGJQCGBBf9duhxy?=
 =?us-ascii?Q?+2QNJ7dq4dyb1/9yxXst8mmW+Y4JxgwykQFeV8Tm+FWjFl6IHAwTxXSKlsfA?=
 =?us-ascii?Q?nYbqseR1fkk29F2g34eFdNPNQhmxo+wzm8YQ2JaS8HFnyJjJnbZnKPJ1Yb5K?=
 =?us-ascii?Q?w3f360xuW/cvs1l7NqI18zBU0G0o/l5Ck6a+vqtk0IEJ0eookhIDU865IQG0?=
 =?us-ascii?Q?5zmNxiZxDsNtGWPu6TZxS5SPglDzxIMNIUkf73Z/Kq0JG+ThBuxFoCV/cv5q?=
 =?us-ascii?Q?yeDgJMIFT68AVwvLaoO3B+g9b6hukgY1+TfgxtgXBD/q8pjAw5iKRB3J6Ykx?=
 =?us-ascii?Q?hYDndhhxijGd3a7bSjvlGHthA7qQPlfeLLumGFbBJlfPuod1V48J+oG9pXec?=
 =?us-ascii?Q?aa0kKHpgJeN6eFm9cc58HKmOVjcztTd+Wdv/hmNK3GsMSDIdW91toHYo3Ttl?=
 =?us-ascii?Q?xHBjRjmTaKoBzoSa10G+nqGG84spobesgNx8igmBWV09gqRhvHeFs+OP//4S?=
 =?us-ascii?Q?Bus+L2crw4MizXxe4L0iqoG14TqrIXaOOJ9AcbJYnJ8501rXNFiH+Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pkO4nrF/glpi3L9/2ozibj/om8mzIj8hkUTKfe5hm2YfXi5H/IoorurCPplb?=
 =?us-ascii?Q?2vhMX1m9TkvbODOFBdlknp1ftI8WVZ5szZP64zBfMu+z8Z9MTNFmYC8cZ9Zh?=
 =?us-ascii?Q?yE0nAzi3rwchMiMgm3ihHcHjk/K9PB2bPlirCE6Vf+BZlsehQg0/lhER6Ex5?=
 =?us-ascii?Q?Ao6rRmqIPgq7DE6kLwcl5JE+qb1Yk0Dc0r7ndCleHSwZQyQmesj0kwZwFZ7W?=
 =?us-ascii?Q?AnwgttZi8MDFhlpqQ4WEmJ03HWI2hjy3ilo8mWXefPhYKcMs01TVoebj6/e4?=
 =?us-ascii?Q?crQy5lgqjqXIpRD3jLJ4TAboNDh7KM8qKR3/oBqZSDp+nlnOo/CEEDJeRlhZ?=
 =?us-ascii?Q?K2Ae0x9aGwLQn2wuDZmn5jnPgK54oHwc0ETrkJHcFukVdUmi2HknPXl6Qxal?=
 =?us-ascii?Q?sPutoORa/xGHOm2LhRSCNpFOekwF5kmYqoevxfxqlZWT1iMQm8Gdd3jF5NH0?=
 =?us-ascii?Q?jdJeJXg8SXP8wB3P5letaNnOfX3rKwPGdjt0cdeMUh4SjAe1uViqqjIJBNe7?=
 =?us-ascii?Q?pB02Qxzwct+ON9hCQaAp7ryLi7JvZL99v/y6n4mJYO0hWKWGBNo+yK/Ei15j?=
 =?us-ascii?Q?JLuzbWP7GklkL8y7pm6M+ia8tG4lenL0nTI5a63xcCoXQOdTzxGy9w+BR8s2?=
 =?us-ascii?Q?c/3x30UOset7KalK7QYwwDvQo4uOffsWrKlEaD9fZ04BCFUSkcdnuZpZAC+F?=
 =?us-ascii?Q?M/SgKuNEEOwTbzm3YXKeXSO6aECeTunPhllDZjb0B6tlx83ZLBfWruMWxPr3?=
 =?us-ascii?Q?VyQuEPLh4Sp01KL9Lto9UyxSRC0yrxDVehNRz0lBgwfxHpwdOHln9Vr/cu0L?=
 =?us-ascii?Q?W3TuA5OcUgunJLHnC4/wmA5qZAqoGXz67KTbU8l+lrkKk0a99WEaiKrFbesw?=
 =?us-ascii?Q?mXmF7y/yvD9/qfWMRAB0QJFUbLzHEym+PV08FwK55zgZyspdOKKvcjIPuR65?=
 =?us-ascii?Q?RGzsNnCI1eTucoDv4aVcE5NTibauwzpbhMFY2rlLZE/MSHrlaMM0QvIvmGVP?=
 =?us-ascii?Q?UYI7izc+XJMHfL/2cnf1ahWOmmiJLKMIpiryq6r7cLDtuN5xwef7LqLdJoF2?=
 =?us-ascii?Q?ccucfeV8/4Ego6WUYlE78jibOYqUXrRGZMUqJ6whfXaU8+vzcGMs4rFOQPXP?=
 =?us-ascii?Q?4nbMxfC1EiXA40MX/XyhcYKaIJZwYPzpAhYO3ZyYlrTcun5KewB9v2K/CFed?=
 =?us-ascii?Q?MTtibZOd6sgp09NAlV3TwcVvMG/WZcaSTEWNZRUuYNwP1z+06xsBO4sU4FmQ?=
 =?us-ascii?Q?SDVgFNU/G8Md1bNUZD1Ex7gxehS5cqAXtCDKlDHklqgy1+6Mc+lnlHFbyIcg?=
 =?us-ascii?Q?Nxu+cLXg/Ltyw7pgJGkLDSw4C2Zc61qUFWy/t+rz8rITWG6m1Do5eDOxZB/A?=
 =?us-ascii?Q?7HK/WW7pBXTtxC1nmmoQ7zgOCIBnaPBhvx+u3wofYjSCNzHEv1N1J+/TnF5a?=
 =?us-ascii?Q?k6D6CpZ2utPUF6F6hUhamYIeEs7lRrYEBMlS0KZS3PHM0Fvf4Wsb2AJCHRtY?=
 =?us-ascii?Q?14qZaKh64suEagonNODCTxW7J836/wmviHHJdFTUztvyYcBlfvHWjTfzzFYz?=
 =?us-ascii?Q?Xpnquf+nKtzlEBtdwsQz1LtgSfHmqKy9XrhoNUil?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226a4612-f71f-4e39-fa0b-08dde0c44e65
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:06:29.1529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkYJgnuaWlR5gequ/Tu6iAsSKd2RRz/hXmgFq6PVYYCm2xIb9WxbhJ3Xy3jWPK+qpYrzaYgpOPrTptnAfd9+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10035

On Thu, Aug 21, 2025 at 03:09:33AM +0300, Laurent Pinchart wrote:
> The v4l2_get_link_freq() macro doesn't modify the pad argument. Make it
> possible to call it with a const media_pad pointer.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 +-
>  include/media/v4l2-common.h           | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index a5334aa35992..4d686338e345 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -551,7 +551,7 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
>
>  #ifdef CONFIG_MEDIA_CONTROLLER
> -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> +s64 __v4l2_get_link_freq_pad(const struct media_pad *pad, unsigned int mul,
>  			     unsigned int div)
>  {
>  	struct v4l2_mbus_config mbus_config = {};
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 39dd0c78d70f..ede24e60dbec 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -580,10 +580,11 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  #define v4l2_get_link_freq(pad, mul, div)				\
>  	_Generic(pad,							\
> +		 const struct media_pad *: __v4l2_get_link_freq_pad,	\
>  		 struct media_pad *: __v4l2_get_link_freq_pad,		\
>  		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
>  	(pad, mul, div)
> -s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> +s64 __v4l2_get_link_freq_pad(const struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);
>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
> --
> Regards,
>
> Laurent Pinchart
>

