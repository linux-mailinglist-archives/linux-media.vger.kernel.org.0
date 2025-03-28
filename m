Return-Path: <linux-media+bounces-28932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF17A74D0C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 15:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E9D188EAEC
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCA81C4A13;
	Fri, 28 Mar 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pl8R/JgL"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18619993D;
	Fri, 28 Mar 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173159; cv=fail; b=R4IwrlFTlrQceqAWxMYW82WVL9SmxMX0nQEezR3iaOWA2CuM9EVu6SXeDmjN9qw3xKN9r9fD2PhXD/gpGgwTFzkDiYPsgdSrxhMxhsYUJ+mgfAj68dlB4Ku+mtDUH4FG4ra4GD9x6wP2q0yOcbUgxTAr5dH0KHVaZPuN2tVOq4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173159; c=relaxed/simple;
	bh=FpKsBKtJMGImtsY+YPzMIuSEVtxpikckn+ylzLbWm/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aWJ/dGdoi35QQVg89ivNGdbUAYE8n0+vn9emlrOb0SA92pdI42n0eAqGj/bI5IoufTLY0VPkbJbXMoDWUXSHrcPgVPVOa/4MQUmfuZR7U6mJGlG8kCSxcSddYRT7p64PBLx/tmzsjRKe9QOo6y9fHZFB8HDfgFxJD8gTb63wly8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pl8R/JgL; arc=fail smtp.client-ip=40.107.130.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMk4iuWyemTHk8qIS9qDYAoGXEgQi2D4iYsL7sehIrw17gdxy+hqhczPHcPkeJs2iDJTqgnPm+hRf+ZCvLOAA3fD9GNLxhd8c9S6KtxuOEvM2MaCXQGjqQBOp3Fplyp+Ie3tE1UU7cJvYTgggHaj6+gkx+TynQBZI9L+jMTWHHKnqx9X4umHKSwSLkSepO7mhua8lJdHOM+TK7k477cVHLyJWrDraEC6P26+JSzRnrwWaCyqwNH/FylResONb9Nizeeh6Sj87HJ3HRWGq1aZJcs4LPLkarXFvI4MttdahbEGuqWEOwzdoVrhSQfKEUdeESXI907U67zZ5ykYseqEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tT1V6pPuBEPU8q3KLKlMQzLplaMEvf6pW1/iNApxRY=;
 b=TSl9EpZYDE9b4VbE1rvL6zDfydcKoJAXUeItgWjJyNFKZAz+Sg5Fg/8XCBEFUC20ruj9d+JHcUNTTTfJVVP+3PKBIv77qYsiGnnCVpjOk8PtBg6O9ZSTLMxR66Xe0I5A0Xy/sB9ai55EPFga+5A+VyzoUg7amVYqwFuE4L0keqexgFu4Ey9hAoNM2jtodzr1FRUJBl7B83kE+Lm6FSg9tU381LjzXVz6L/OIL+Du5veInO2DUKrcjijU5PWVioyWOm7cU3QvoITVPyU0wilPojl6qSrtAC7HdtohsSZ9wK8BHLKTRjk1JK/Oagg899qKa6roSUAlL8zKxHfZR/IEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tT1V6pPuBEPU8q3KLKlMQzLplaMEvf6pW1/iNApxRY=;
 b=Pl8R/JgLAjd249NkG8L0TwMbV7hioF05LzbDgXWLmn8oUpRYEQqY3DjzRc+Uxc9Xao8OifY50QebMzbaH0y9ytC916Tt4g5AEYqQj3J/twY81iIY6Lle1JXodVZIc5MFIjjpzUHWEUGJRMA6Ls+Z8E6kt6x+B6h6v9JsOGKhYdEJqECHGJkIc9OdOy4bdLRd5gDExapQZ1Jn6MwgjgvzkJCcZrZuynbhR1uwcZ8dbRmt5rXITUXgSRBeQCqBNlXK79XzTmkvVau/ai6icWxih3Pq51QxUISJPGm35JKxEXKBcuuKmTFrovSzSPl+wrsrTuHIvZ/849VSaGHBFycGIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB9415.eurprd04.prod.outlook.com (2603:10a6:102:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Fri, 28 Mar
 2025 14:45:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:45:54 +0000
Date: Fri, 28 Mar 2025 10:45:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328063056.762-4-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: c1204bf0-686a-4473-c6b0-08dd6e073dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9iJhlWGZ7WGoPtbynH/dvOj8PAtZM9N/IxagYxiHqaM54eNw9wXm6bTvI8h1?=
 =?us-ascii?Q?aw8UMpaPVuODYdB61T1w3Va+z3hEaaGUuxQdct08Z5LExLmcmJfwOccb/pXw?=
 =?us-ascii?Q?vi8Uo+W//yNP2pF5vVRgncxnymJy/GYm6ndDcjTYGhOvKUJYn9QkWz0CKsob?=
 =?us-ascii?Q?dsZyd2wepVdhLznC89HxHoXeT2OAQ+YqrMVGGgw6CP15IrDZxYar2SOQy7j8?=
 =?us-ascii?Q?oNe1BHtTkPyhVwaVWxhBt/QycObiNZ/NNA0qc0666+VvBRC3IuJa4zJwjg9/?=
 =?us-ascii?Q?b2jRjuAn+ntA9X7TCy1HJHEDlbbYXWgNNujGhd+CVYXLCLV2xCZ2KEgLL1vS?=
 =?us-ascii?Q?FEOGz3Bm6edEGjYvn/qnVn9uEvtKmetGjBUO1eykCoL0pDxrwrCed70pRnhD?=
 =?us-ascii?Q?dNAY4rLaUkVrGFguCWRDL1Q6zTULmz1UHZV3ITM29L3H7wT+Pdbtb4YYpa3N?=
 =?us-ascii?Q?CHCJiPPQn2Bu8KqH6yMT+7HMzCvab0H3wP67p3JzWLi7Kep+inOWLQo/B/a2?=
 =?us-ascii?Q?OAoin2Vb6T43ZVuvsBvKnZSp9np+jrZzzFImk+wYrvCTGJhCQPXsR7zUy33E?=
 =?us-ascii?Q?XeblQtbhnyckivDd70h7mNcvGMGVKiYMX+yQ5UAoWwo1TyIv8dUrZp/NwVjt?=
 =?us-ascii?Q?wzWoW9HvXvHLRjvI/ALJ3Oweph4QyilQIop8iTIGAkPYZ2aotItEgVmDf7/6?=
 =?us-ascii?Q?AUEYpPo6ESJ0A/JICI62agFvqLb+t6EgQwVnqAAfG5Rq7QKUlFhTQ9T4d5ZH?=
 =?us-ascii?Q?uUJevioLA8wS1/xxhJERFlT/DKQXGqd0TiA1L8HbxYzDBunOq7tdBAFL1K04?=
 =?us-ascii?Q?hSHQaacnzlizqbGlYsSU7bS03ficYhKdBN6d70YExxsWN/7GPdXKlGfty03b?=
 =?us-ascii?Q?hOJAEUpgOoOdwHlXsEzy2y8CJU+b9gKmHizB8ASUW2iJig0p0R/tQB6DO6Jt?=
 =?us-ascii?Q?tixty+S9NTFELg/cUojlkjqWcJjjIJuCeS1q9G+15OsyYDnPr2TDvnBoV/6E?=
 =?us-ascii?Q?A/FR4QUdR+w5PMrcsiSg/fo9+f9X+Fiot0W57JNrXCpYVIzLKZ6W1bjQegmn?=
 =?us-ascii?Q?Q/9oe9ARPIhcfad4L9sw1ZWpQzr5JwXj0KB8FxGu36J/r9m/SZtd5HFxF4Gt?=
 =?us-ascii?Q?rBM7vGtzCQOJhBpAfuLOl7tUFG8qc+qE1mSNESHsvZEjswhIaatv3Jo8Vp1E?=
 =?us-ascii?Q?fKrQYzWizaL6TD0H+7Pfx0Q7Rc7H8RhmcaNENXTDYQebAqnARwZ6DfqogSdL?=
 =?us-ascii?Q?wPwEh7W8DxJ0SJ8r/AbNwhlnvtGwp6MFbFDSpInp3LEmi+atuQ/ZEAEIH3Rk?=
 =?us-ascii?Q?gGKgoTThpviAByPLt8RLgv/7E+ZD5TGjsE+dV2yS6yHM8kN/J2/FLg+vTBsN?=
 =?us-ascii?Q?CNglyDLuWxaHTyHxIGQm96BhTyBNmxsFBK7AQ6ifnsSNLdx7Y2FTwK8/Vuny?=
 =?us-ascii?Q?UqpmCd3Q8SR+agx6U+hVNIAOODGW3fcu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?STo+NiY9Aekr6WCv+yH1rHaXrnZxt68xS1XWo061gnqEGwnWcC24ZaB0Atsa?=
 =?us-ascii?Q?txzUREj7n+v8eB/pZsMqfNa44/opayZPgRV78K+tC+9QZSbXN087V/+rtVtu?=
 =?us-ascii?Q?/VfrgLKJ6oxlogNkyPPzfMfWUrRB8S+fC16MAcpSc89PoP5wl2UgFPWybrL7?=
 =?us-ascii?Q?SkvmKnzuLCSy3MOS5gfpWNqPHoxVXjZmzDbxtguJbvosBTjmRFyTgYT7pQj1?=
 =?us-ascii?Q?32VgcgRbxkAt8gAkqBu3Qo+S4n5s5dEUvV2u5D0UyrBnn9O6x1PCUpg+Si8L?=
 =?us-ascii?Q?GAgY7X5UHWdvg2LSpTDJew3y1IQ0KhBab2Uc0D/uGdZilPovuGh8w2sK2sVC?=
 =?us-ascii?Q?kwgBRsM2ZeimQv/NrfIMS8wREajBlzBAUsXB7KEnr0vMZv/VWEmKS32Srz62?=
 =?us-ascii?Q?lPY7QgEm0bWn5CFe+lOiYJE8fU3/x3U+hbNTe7ULcwfuNr9sLWVNQHTlPK+9?=
 =?us-ascii?Q?r0HZZDCA/OHGt0Bd2JQf0DUhPak14NBhZF/ZGYlyTpl5ZXKDLUVnJEvbPMb2?=
 =?us-ascii?Q?9NXDy7b++JjbKIvmsE7bQROtE0lGxv9EOg3yyiEWLmdPaD8LF8NKV81xpf5K?=
 =?us-ascii?Q?QyMQ5JY9WOKux5vFfJiEpS6CJC8ebToSaEUfvwwPsaukblxpx8DVZcXdXIFz?=
 =?us-ascii?Q?uxHukHTFR8h5MfczaJCprpaAcO1H72bdqeobKtZx2vDA2AwxbyrYDyLU5Znp?=
 =?us-ascii?Q?6faRuEbqlxOc0rdq+oZtdWBf+M5cz83CbOLXpu34jhK4mh6MLjAFYE4ZgFKj?=
 =?us-ascii?Q?a2q7/ucPsUOxum0GRhVV/XkWjvq4M7KhS2H66lmnR/pLqxuBKZEu18LJM3Zk?=
 =?us-ascii?Q?JHXLzJTb3hUlHaFjotDXta04Y/qew63Jg9oD9pllbudy3Dzp1XGaeb2YKDqt?=
 =?us-ascii?Q?uny8d6ObTku7NJgVifs/6MgPZO62T0cjWZFqS4iikL2yrolJ4OKTru9GdyTP?=
 =?us-ascii?Q?vFfBBwEWxrqYorKZXvJWQ889OWGa2M5xXVEUh74NmVUA2+rrBZHcD7468xtH?=
 =?us-ascii?Q?g5mzXDF69Cg0YiMjrhnKgSNDWS2prRtlaKOaYJJ0nLhlQI3WxuxDv2J82G0e?=
 =?us-ascii?Q?KUJ/kScLt3ocMgEHzx9HvzA8ouamgickd1iqG6EO0JAYOWAphAJbKGRbzkfB?=
 =?us-ascii?Q?1TrC0VY3n52D2Zwupx86z4GEm+eMrxtWP62WGppGRl6JpHKuZR8CS3MJMTiw?=
 =?us-ascii?Q?um8MTh9NxOttDfY98o67mUgJ5QkEW+ABl2zxo6k1OMy7XKIdN5EUFd+AnAVb?=
 =?us-ascii?Q?GvyQEnppKsSSRfoyww9+Sa3DcqYdkhx/vWe15RhROHbKB0piR7hh/StORUDD?=
 =?us-ascii?Q?hB7QCOiVq2N0INTzI7XJJoN5tbItGywg9LxreQ1kluSytLr4MGNt+Sc7Nfdv?=
 =?us-ascii?Q?cdbS/V/4DpeoDlWTD6ZNECWWI8VLkgMQ2ldKT9aM0VLBXq551KtH3x4XMlfA?=
 =?us-ascii?Q?5sb8TKfVHsgHcell5Pn+TaxVUQlFF6voI1Mx6lIwZ+DAyshWmE+k2B2gKJhV?=
 =?us-ascii?Q?lNGaFCYGJQWM40gODQxadqEP9QVY3bEmzNysSSiRgyDlb98HV9kd4mjORhXL?=
 =?us-ascii?Q?hS4SAzT3NL7HDIhIai7ZWFWEaR7DWgMfOgnFM/8n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1204bf0-686a-4473-c6b0-08dd6e073dd4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:45:54.0431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHxhbOFbXj2bhGCVhT8WfBL+/z54g65qSGESG9YV/hJZONQ2tLuBTvmFsKBRatIzICnndmcfukKnHrw7Qpf3fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9415

On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>
> In other words, 2 frame done interrupts will be triggered, driver will
> ignore the first interrupt,

Does any field in linked descriptors to control if issue irq? Generally
you needn't enable first descriptors's irq and only enable second one.

> and wait for the second interrupt.
> If the resolution is small, and the 2 interrupts may be too close,

It also possible two irqs combine to 1 irqs. If I understand correct, your
irq handle only handle one descriptors per irq.

Another words,

If second irq already happen just before 1,

1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */

Does your driver wait forever because no second irq happen?

Frank
>
> when driver is handling the first interrupt, two frames are done, then
> driver will fail to wait for the second interrupt.
>
> In such case, driver can check whether the decoding is still ongoing,
> if not, just done the current decoding.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index d579c804b047..adb93e977be9 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -89,6 +89,7 @@
>  /* SLOT_STATUS fields for slots 0..3 */
>  #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>  #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>
>  /* SLOT_IRQ_EN fields TBD */
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 45705c606769..e6bb45633a19 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>  	return size;
>  }
>
> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	u32 curr_desc;
> +	u32 slot_status;
> +
> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> +
> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> +		return true;
> +	if (slot_status & SLOT_STATUS_ONGOING)
> +		return true;
> +
> +	return false;
> +}
> +
>  static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  {
>  	struct mxc_jpeg_dev *jpeg = priv;
> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>  		goto job_unlock;
>  	}
> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> +	    mxc_dec_is_ongoing(ctx)) {
>  		jpeg_src_buf->dht_needed = false;
>  		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>  		goto job_unlock;
> --
> 2.43.0-rc1
>

