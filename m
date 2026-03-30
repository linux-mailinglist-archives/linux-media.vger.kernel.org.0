Return-Path: <linux-media+bounces-57618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDWDM7x7ymnk9AUAu9opvQ
	(envelope-from <linux-media+bounces-57618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:33:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC435C09E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B13B3020CE6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83063D3D15;
	Mon, 30 Mar 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SrUmgeqk"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2B1F4180;
	Mon, 30 Mar 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877392; cv=fail; b=Ih2ZT3RuxHUIaClsTvHuUbAGeujf5PNKCYv1WMQWG7ikUfIF4NB+30wQ4olb/OW8wmdcxZn0gorfCzKkCXUG39NuYGk7odeEBhBHDD0rhOcRNlm+61sAKwfZIq1T0eSqbvMqhNW15eqqsJm58dYY5r/kKU5FGbZtZsWJic78fGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877392; c=relaxed/simple;
	bh=qB8Y2wyGXBupO+jQ+4NF9zDi2E8EB0XyNGwKBuB/+X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fdIYRsJfyQiOyv92aNbAEuhjHas9rwmIvvVen8jlyY+zLJbp3L/W1vGV7XzasAARXZTC/LRP5Adzckds2wxIOpTha3uRGCs88+2f7r5JIVRXRtECVrMHIzft19qARKbeWlzw9y+CqDbq/lE8SpgnvUU6FOPSxQ6QWqhrVrnFXEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SrUmgeqk; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3Mz92GVS2RMZ3ibsdzLeKmEjwLRtMCcz+Cml7mcjfFoHv6OH5pwHj1WS1uS4LJN5IDIIMmscGQEswwhHrCbLYSQjq8eriPxoIP2oqqzCfZxmZUkAZEPn6WZM1l8d0WEbeN+Pqu3OXNu3q7V4qjvdMp4MxyfbbEQUIjtkhBPNTjzRKl0SvFqtTx7TFTffTU2GTpC9f/k2dMEvWpqclHpTXdNCL0ZA8VTTLUl4XGYJooWB3We2nhsbtoSyyLvWK0JcZ6ENvNUaulSCzUyl/4YrDGa3S09Gu1mLkX5ka1V9OmoGl708D09pAll1O/FVxCMS8Ew9O9SUh754Kckxshsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgrnzJV35na5BhzeoGGyoX6sNGbOw/AmCZ+5zmklP9o=;
 b=Hh4gfF+odXVatylk9y+wZwUlnxA+e2oR6BugJh2kwkSwJ9A/Pdv3WVgOFTlcDaAXaPJdE+EXV/rwWbvGY2d9sF8fJLcxO5ahHxL1KxSBI7jdFRvi7JtOtpBf9mKPjUJzNkCDcXRqLPytrzRpdJikpZHiOkcZx2ILWVX6bWFOP3UkgzFsVI3yCxMgs3GQiKZyY0Xr1Os7bwkJlrPNm8atL4Z+Nh8nyO+hY4doscL6a5wmbj9Utn54Z/4adHf7hPMt3DMindt8DFLj25mwFcuZ4lvMOkR7WGE5hMewW3XMz+5ZZuVP5HrPAXOrTEk0GZnAkq+OZSgKbpHt5SifgYQNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgrnzJV35na5BhzeoGGyoX6sNGbOw/AmCZ+5zmklP9o=;
 b=SrUmgeqk2JbGRF4wM2hTiGybHpTGTZn3llyE2MGL/Fp8ZhhHkhy5tn7ZzaVAi89IhOr9dBiYTLRPLby70D+BgZE5KAiEGEbDLMtr2LxzVz/MfrRTEdzf1nMI3VKIBffi3RyOzkeXXmpa+eqEu4tH+v14tTzkt2D/wviMq+iuv0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB13254.jpnprd01.prod.outlook.com (2603:1096:604:313::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:29:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 13:29:47 +0000
Date: Mon, 30 Mar 2026 15:29:36 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 05/14] media: rzg2l-cru: Remove locking from start/stop
 routines
Message-ID: <acp6wLsS6Dl1iYrO@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB13254:EE_
X-MS-Office365-Filtering-Correlation-Id: ac54e0f4-a5d6-429b-d670-08de8e606975
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RMF40rj8bRx2WKsEgf33FEncclhLLiYP28XMtzzwtB78tOBIBlIJ8GKWzxgIYpjLqlU/rnXavvge+ao2I00voBuQYBTWr+GFXffvzrkG11dNqgkU+xIGx6bGe+wCBhNIHJxpbxB4Pb2VDKUAoWODPgjzh3buBfwL7GDTVXHi2DmozEoB3wcZhn4WvYAAClfj2uzEKpIPv9QbdTFpc6Hc5hvYDa3Aq4sPgp0IYQNFvIjK2Q55bgaJD5uoMwlLwgeP9bc/jvellSC+NaNTYyokqeNp8M2KOYECbLFADQ/8Xr0lOVDGIaI5ckJoPpvxgVmKeCXd0HXMdos2C6/nRI3GxD7cNGlcLyQuworVPL0I4r0gG0IayEgUlcLFsgo/rSZh5Rkvta0nEIcFH9zOf/jSku7XFZuLPBI8gfkIsLNMvtUALog/lf9peDkJgM4+Pw4vRZjIZrskYyurVAvOmTG/yErplTWWF6dSw3n8ah056gHq9CXeOj+OkUj9CM2nyV2s/BX+xN9PpgHmljxsOR5TEK7Xc59BpZJ/AkcNG8YTiaSQvX/1RHwGbOxcGht7AMr+QcslqGLmsguPslIMspu2B1UOiBE2o5D6NOLakFudt6LaxgP3VAFbOm0nwZs4B7vccoeu9alGylQPEVLJn0NRDO8Y7p5ddVbPrsmJD/OrtyqRP+uagwfbKV1JY6apayPXGL2T2j8iHfM359y9x00IA/EH4R+krkyKYTlLJiG0mzoAgLaqjyUzUvfaLO1m22wIL8Ku0583gZSZcKFryMiD2D/SEEBQ5sw7oDEBB1anaPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1PlLaWD2+WXCE/nxPzSmZP0Zl4TmAcBF6SH9XQhtct2A2tQ4P8c2v7dtpLht?=
 =?us-ascii?Q?pK72X2fPDvriDfbhrzv5LcnEjuv3Pz2fz50HxRk3pQdqmt2EPDCRQH8CnQp5?=
 =?us-ascii?Q?6HXP4CMCHQ4+9ZwgcAWBcrYG3zUtrEWgD2iGw4FBLtzrn8IWi6NQ2GQu7QCi?=
 =?us-ascii?Q?s7VyVezmZhkTlmC5Vs+pKcsm5hRDcFpHZ9hQZ6g32crjoCZVJqYGRiK5dgdL?=
 =?us-ascii?Q?LQrq8X/1hgoHA/IcJD2xkZ2j7T1FavFWBQ13oI4gvM77FY890wX32ZLw5aQP?=
 =?us-ascii?Q?2rOEJXYpCvNaxZx87pmDydSICv+do5GB8KQSW+K6Is6t1c3QcqzRH5Y5gar8?=
 =?us-ascii?Q?5WFcfNGaaxwfzX18ijqUk1FZgCX+K+86qExh5mPWXkYIiY5i/e4K6BEVRZ+Z?=
 =?us-ascii?Q?UQa5O08qyMtnUuBCeVfpf+uERz51BbG2t9aKONZ3hG4R2Zx/in3tWhaBIswK?=
 =?us-ascii?Q?wf6xBdHAmWiuFJXu6G2fJNSBud8wShsZsm/5EgtMRhhFtrYZPD5ejFmi2d5c?=
 =?us-ascii?Q?XdtNNq2k8TyAJqRdUb638OVFwerUnXx1b8JoXZB7523sWe/cTvcOCnMRk2HD?=
 =?us-ascii?Q?ZUlH9DOTBS4ug/367gv38QPiOl8TCLPRRKwPwlMjMKXCT+ydazeJx2VY/oTC?=
 =?us-ascii?Q?CEDV9fMxHAhfp1FhV+yknsK15Ho6Nite5ZXzOxShZyNBdQvYW9l+Bd9Si2O9?=
 =?us-ascii?Q?ZULZn6v5QrC2U56pOn9j24E63jaFPGbEUNcmC3+JmH0xnWlL+eyRdIsyRVTn?=
 =?us-ascii?Q?vwqmqRQPS3uY3JFI55SbMEA5osX0fufYYrw9GqWrhEMKnS8o+vKHHHCbgT9q?=
 =?us-ascii?Q?eWy8D+cTUtFJm8yxIb4BZJanAP+Ez0kOPJep/mt6WQ+uAO/VvXPyCMzKs9+n?=
 =?us-ascii?Q?sqLcz/w8ve2SuwO/poqqy6pVvTLcvr1h6fPsBhR56dhM5UkQU3DOvIsR6Boh?=
 =?us-ascii?Q?DgzG1++Ow7YHwCSEG2xEDvc/UcAZEV5b+VFyNVoLBy89M82DK/YB72CJAu+L?=
 =?us-ascii?Q?86phQZqCN8+H0g2xlcNO/2k4JXxjqNkefiTh5OyGTYAdD93EdJlzZFXY8EAw?=
 =?us-ascii?Q?tA9QFhzhqDjP2PpCx+NWCbPysM9D554s/B1iYEeM1lu3Bo3zhwBNMh8/kQc+?=
 =?us-ascii?Q?T7IzDuCP5G3dNCLBbFSsSDYGjX4uuJethsVAJcKZEX2142FIPRorsuDJOkAr?=
 =?us-ascii?Q?73rzMfBuf+yV06XF7YI7k6migS3bfJP73ylLYNd7UnpWDXQ4QGF5JR+Gu7iS?=
 =?us-ascii?Q?y5ow5lQfb2djwJ2Zu0sdGRcwekkJdiaJRld2jvDH/rSN6yYszXxVuD+0fzuY?=
 =?us-ascii?Q?xLHbVsiKR26/W6GPBBU/e1iSRnU7yoLDJLbybeTjctSG5Y7boJ8fo49Aw1T7?=
 =?us-ascii?Q?GQ6q+A23b9CR3apHs+XGVmjfvhn26VmuxoNasMb6AJpj/SjOlFcP4XQ0E4+/?=
 =?us-ascii?Q?H62M5iBAZOFX6LYI7Xx7kkHQimDMwy0yo3gahIYqDKCe0ISqAM70AqMiaCnM?=
 =?us-ascii?Q?d6Oe7EEAxMYbBlZ8pJg7LrYr+BygTcKuRs3DoZCNMDmq6vfQxU8z0pwccStp?=
 =?us-ascii?Q?W+9YfMXdaz/1QHBWnd13Kggr0GlGqFV7u10iKXQR//zK1mQdOzHTcg531A2d?=
 =?us-ascii?Q?1z3KVST2eqR9xq/OuVLJSVjw8lZEetFKYkO8GewEwwm0cgSbLqIwF+bi323Z?=
 =?us-ascii?Q?sUsmCgzIY4bmnT/sJlzGXorfVtbpo4VRJ/CB8nPLrwQnssA+Osj4nOKRYOlj?=
 =?us-ascii?Q?3woLNCdkgS8vanLeq4pstXJNtjyJB6GJfQsAMavwtoPX3NtLTDTq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac54e0f4-a5d6-429b-d670-08de8e606975
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:29:47.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZY8rB2aqk5I4KKMuHz0Li9rnrrrW9VsHSDGOCP+uEZmsH+LeFkjAncbs15PToPqg+f6WFHEcgfy6ooie2gbsuyO+fjp3gvozdEZhyHv8prNX4bc2Q0FyDz+NLUyq6tqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13254
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57618-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7DC435C09E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:10PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The start/stop streaming routines do not need to lock the whole function
> body against possible concurrent accesses to the CRU buffers or hardware
> registers.
> 
> The stop function starts by disabling interrupts, and only this portion
> needs to be protected not to race against a possible IRQ.
> 
> Once interrupts are disabled, nothing in the video device driver can race
> and once the peripheral has been disabled we can release all pending
> buffers.
> 

LGTM. Tested on RZ/G3E.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>


Kind Regards,
Tommaso

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index b041c72837c6..43b1d35fb963 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -341,23 +341,19 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  {
>  	unsigned int retries = 0;
> -	unsigned long flags;
>  	u32 icnms;
>  
> -	spin_lock_irqsave(&cru->qlock, flags);
> -
> -	/* Disable and clear the interrupt */
> -	cru->info->disable_interrupts(cru);
> +	scoped_guard(spinlock_irq, &cru->qlock) {
> +		/* Disable and clear the interrupt */
> +		cru->info->disable_interrupts(cru);
> +	}
>  
>  	/* Stop the operation of image conversion */
>  	rzg2l_cru_write(cru, ICnEN, 0);
>  
>  	/* Wait for streaming to stop */
> -	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES) {
> -		spin_unlock_irqrestore(&cru->qlock, flags);
> +	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES)
>  		msleep(RZG2L_TIMEOUT_MS);
> -		spin_lock_irqsave(&cru->qlock, flags);
> -	}
>  
>  	icnms = rzg2l_cru_read(cru, ICnMS) & ICnMS_IA;
>  	if (icnms)
> @@ -401,8 +397,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  
>  	/* Resets the image processing module */
>  	rzg2l_cru_write(cru, CRUnRST, 0);
> -
> -	spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>  
>  static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> @@ -470,8 +464,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	csi_vc = ret;
>  	cru->svc_channel = csi_vc;
>  
> -	guard(spinlock_irqsave)(&cru->qlock);
> -
>  	/* Select a video input */
>  	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
>  
> 
> -- 
> 2.53.0
> 

