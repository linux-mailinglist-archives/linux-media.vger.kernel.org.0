Return-Path: <linux-media+bounces-49075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E6CCC89D
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 16:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E052E304C9C7
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462F734C141;
	Thu, 18 Dec 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MAIiPwQV"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505034B185
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072124; cv=fail; b=be6VcHWsh6GMWO8emp6OVcdyJXdKk6ReUPheEIKUOBLs8BQaod49qaYeQ9krp4qAZnOA6LDSCusb90gSJh/76RUctjcIsMG6q5FE+amKi8yBnPLziKXGgseaWaMD0S/qF1/DYWqMi/xGg0Dqoo8xIUJPaKmBLVemqqL5giYep9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072124; c=relaxed/simple;
	bh=ZEh6vFcZaV7lFGAbC1r47C21Ppp7Mqw9e7ZSEOSZ0VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mhozX3K0dvjnRy7vpTeNBMZQ+QsnX14ZmpcJjmil+10E/9hUriMpjaLhyLOHuzjJcrgbG1IcOJD/wjs9K8yI7mj78BQtrA0+pZ65pl8gul7+UZk75E5EOwib1WmHfT7MLdW9d1gw/wohKtP2xDYTbtgEtqZ0vZbK7qY5wmH9EHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MAIiPwQV; arc=fail smtp.client-ip=52.101.72.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAW5+LPiWZL7SIbe0HDhNL+g0B1HOdISIA0VhZdcplAaLj6+daY4YOVw1Eu7srJmnz+pmQCc0xJk/Jfmd1gf0xUrmjufYJxqhGygjMTdLlo27DtMbipnlZDQ7U8NOyy2R7Rur+hYcMzl1Fq+13b1qKi/Ax8nJauxTQztJbQlvuW3Z/0sli9WkerdM759/ebYJ1Ev1bb/yba576aZdORek695KYk9fp2KT2ZMl97guRST3cB4bHOH+j00MorFHom6xUiLFIw0K3hBvgrYT+amlFiXeq8z4DSFiAfl05DRnNq4HrRlPm9Z9HUuaSjQPaQ3oVD4fxnCDUsrfPf9P+AKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6BHkF+Rrn+ag54JCru9oS14GbGeUMI86q2Vu7+sBvs=;
 b=XEip1vmQyaSb4MNWPCkGXackMlE3fnVM+tdkUa12DaS0CTVcsjrLnfFobHfsZRyV7fZpUnjJHfn23Vux1xHcaqwaLufpvGLkcBjI8WVTA3bRcpHHgGQSVHbLcJLsSddx9S1nIoi9T2eAZvEgylh0dMvdxaPKyJqvY1JEsSiVfpp7lLInDw+zh4VIua5y/4qQUA3sBGOPpGM/XPPTtek9+dCaFXnxrYAWCEC/6uYyA7iLOgzi99XCt/6qqwmGYoaRZHEsPMPreHIRlc1NBi2q/1w8z4LVNGy3OkzZy4UW+FfORaA+9c05rJ6NqsP/HKixyUNf7BGajv+7yriiggur0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6BHkF+Rrn+ag54JCru9oS14GbGeUMI86q2Vu7+sBvs=;
 b=MAIiPwQVRQ0srnCXwm2Ub97NoQo3NayVEdVt669VHhZpQG3RxLgF2KiiHjlQRmkbDWpD4oFdEoluiSSX7OIG6rvQ7K3mtDPPeJa+pxcnT88UrX/PHb2JjVkLf4kmXAxfY8XpfSwVZqfe9PBcFCSgsVLXSi1nm8b8yDsdZwQC179kGyye+6kiO9aDAGxGF3jM7vwaoM3+39IcA08nHlxirVERNcrhj8dmKpxcKnCSw2AaQLlL6k4UjQTiMx8bfmmkm86EotsIC77GCbznrHsimOJy19G/xRCbwZQW7ST+itSPzyXRCgA9JvcBCoD4fqY9NMjMcAqpqEkIwsvjWmhcSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:35:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:35:19 +0000
Date: Thu, 18 Dec 2025 10:35:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/3] media: imx-csi: use media_pad_is_streaming helper
Message-ID: <aUQfLLVHSHD2RIDT@lizhi-Precision-Tower-5810>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <20251218-media-imx-cleanup-v2-3-9e3e3c269f7f@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-media-imx-cleanup-v2-3-9e3e3c269f7f@pengutronix.de>
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dc5066-e607-42a6-2291-08de3e4b0cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2uc1Sm4WSaM8KC+H2RV46dbmZbp/TVQtn64sh0KFpRTzW7Fji/I/Ax/9O+2l?=
 =?us-ascii?Q?SqDtUU34e7yfy2gP/Tr7j7pyTXQ5s/7yCL81yoMHFBz5nM2bEXseQLgMYFAU?=
 =?us-ascii?Q?AjOOcMDuPEO9z5G9H7g9t1JQQI2m0MEyT2BC1gC8zIQ88WZRjBhiQ3zElmVa?=
 =?us-ascii?Q?HwC7jPIDJBsVLYNzUhk/OghRqJB9KnTM6yjF4kfRGdiKoFWRg3DtkbARTeSb?=
 =?us-ascii?Q?p+RiXjOXE/D6iVlqunh5kKg6eU9EX6GkCOZ2Kkw2/elkjcl296GH+0AOyPwv?=
 =?us-ascii?Q?c9lbJ82dLzwuGUJJKOlNtDXnvDxQtqH8Ip2awvUDM3N/p2dXsLgQ++3qK5Ys?=
 =?us-ascii?Q?WgeNx4MgCCgg7sQIcC61j1yApKlOKX1cJBBVDVPZzp6oNkcWXSBSEpJ+Iw4H?=
 =?us-ascii?Q?3hiSvT7kY6DSQO0x4iYTjljkeVrCXhKy/RCRhOFStk4rxWbPYYnHLKazKG3z?=
 =?us-ascii?Q?V5FABNDjguwa/4vI6mCkRHXndHogUgzPRY9e2/T4OzjEm9sjUeQNDK2jw3R+?=
 =?us-ascii?Q?A1HHls9Zla8tIGH86rYhetAIbeX75sxKcwRd1x3onqKDRcDlnysUtHPBSXtx?=
 =?us-ascii?Q?d4Mii2s98bsU55h1kU3Rvpyb3knHDaz0u+yFlEssv/J521hPnyQ9kb6/I+wR?=
 =?us-ascii?Q?ZDJF55bSd2MF5bFUV1d7EZSnT5JHQ1dL76QGckPtpcW8U/7NmWvflroB8BaP?=
 =?us-ascii?Q?hWF/mZN/X64q2i6qwOqgOL3quibvxeqJ+e+Jwr/17B0pYmbeD6FccD0fyvVG?=
 =?us-ascii?Q?LVgBBg3MOhrcLcWPMnv2khyrTKZ4dklkyqHzDwIGWyapKUTjIpW8gE9+WbNh?=
 =?us-ascii?Q?eLVjM+nu0qt9mYIy3EjkLPAVonYZ6VDtNGCsBuHlUfWoI63O+N9bQmCKGsOA?=
 =?us-ascii?Q?OMRLpOwzdRjIvB/bfda7zof7DK2iISnEc5sU9I1rpk6/7NSSIH89L4TQec/8?=
 =?us-ascii?Q?0pQZdBiAnXxrCyRrxnzYWfOpsaJxuZrrdyR5jKpoHCssLW5P+biPufb9EPtV?=
 =?us-ascii?Q?ErQWiWY4gakuMfGGYJ+/udAxyavN6b6XTEDt6xyHcnnKqWWi6dZOBpDpzIvP?=
 =?us-ascii?Q?cD48pgTzmq5vMBHZFWgNnrheNtQjorGi9hx0H+mgFKcNCDaGM4TW5FcRhqhd?=
 =?us-ascii?Q?nyD1+qMOZcmB1rIvsM5+WWGznChQT40bjAb5MHMbNFPsZVnRgbvoIun3eG4j?=
 =?us-ascii?Q?EOMTAESpM67uIQFMCZlH9lhooOg+Kdn/bUJ0gMYVvpY0JZQIC68Dl52cel9U?=
 =?us-ascii?Q?V4rhyMjjtKgoikIEnc7WJarogbTzifAW5vKeF/W0jM+vh7kokHY8cdlJANGa?=
 =?us-ascii?Q?3lQROjrnlV/iysQzInb9aPMNMj426ydPaD2UOzKJ9kNLdH4YfURewaaqWrGG?=
 =?us-ascii?Q?d1EeK1dYGa1gwBpPtM2AcO9KHUY9+UcGG8t9b+qWZPBaSePlZ3mAcFqPz0lj?=
 =?us-ascii?Q?ofOwAh3qoyzdE7lv51lJg2SnGWxPgnV68pd69aylC4m7kjo1hJVEDkm7tc54?=
 =?us-ascii?Q?FMjPGgTgs3dtOFekzozZDAqK3b/HG1qCuYbz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pGVDtkbaOSsv+AbqKp92htx0zX1gSaNA9eGbBD5jKmXdV74JD9+bz72oMxbP?=
 =?us-ascii?Q?uLMTiA81nl3u2vhlwTVIpenE/5NfcNte3aL25YI/LNIAMp1IHARlWNgdLGWO?=
 =?us-ascii?Q?F8t2IKMjOMn0Mn9x2Y80wZwRIePXcfTFRBDbxhJ/LgOSYiAKxtMwe0Fzl9Cl?=
 =?us-ascii?Q?RipVp/UHd49yVay69rSXS3t68/O3cUnbsVZ7hfFQGr0nBt7cRkKNKf8rqMW8?=
 =?us-ascii?Q?fKAaMbsrhdksYJXZ2oRYW2SARwR2OEfWzyPFrERwmr10PRfKQGdV59Qi09xE?=
 =?us-ascii?Q?428NLfEWQ8Aibpi3dSwJPIBe1GYGY1h4yf4SVIw/jx4RFtsz8hXeNhhgXRyF?=
 =?us-ascii?Q?/PsxqE4TMkh+Q1skkwbI3xPQfvO9gj3fdlJdaRlqCb+6JW3GePPAcuWLPz6n?=
 =?us-ascii?Q?hLNGStjezK8pegkB2bWYzDzK2Yls4OgOrzT8+z/FnBpN8NC+nRz6eKZ2BagO?=
 =?us-ascii?Q?TMsl7twXtaejfLxmvpYGiFlz2f4rM0MQJC5qT9cbAGMgwo8TkINX8oFlWW35?=
 =?us-ascii?Q?qr+8nQ6XV/fHd2PUicobYcpxgWb41rh9sBZeuXqzf7VqgfrvuAZ01YmEpI75?=
 =?us-ascii?Q?20UTijaCDH6/ZaqRCRa7UmKqJXzrf7NEdFOlLBP0Uvx7WxA5rSrxX2vMt83D?=
 =?us-ascii?Q?EgMI9l2J3acVbne/AvrGMRff6CoZPYVLhCG08sviaL8pbOHvDwnEyjwSTzRt?=
 =?us-ascii?Q?cFB3L4VMXY995iZgrpIYTyoexpm01gJIdUcQ+dDLQTNkmLXLZUJkvOANNQWf?=
 =?us-ascii?Q?eFcgYVOd2xNAFSjDjrrFvBrNnF6GhgBAmGhMkXard0hI11nzkBvfpqfn2VKn?=
 =?us-ascii?Q?qdwRj912obgDk7B1kh9nE97uLmfw8YWOYH4AlBOGMwx6SBbQCJFu1kjdtYap?=
 =?us-ascii?Q?26Ho3D+UNPnALTeBnWmm4HKkDu5/nQjfbF4F0q4YsJLWXes0tpNxHLX2ZG19?=
 =?us-ascii?Q?Ryr4ivABTSTSUDy8fVeADfCLLIh1WAKKhttctLrx629kLaSmAD4APgFCwtco?=
 =?us-ascii?Q?3UUPe/FS3PLko9T3Ml2S+/kbLCUxqpI5qkAM2vJi+LGqq2RvLDGj6g7Rzbh3?=
 =?us-ascii?Q?2ISXMK3x/3WynRdLPtLX0mqwODmqwAAPz7luksPVJ+4Ns6L+WOD4reoVVggF?=
 =?us-ascii?Q?nzVxFKj7FQmXhmglVhewVYkyMVx3K9t3hbdkGdhUJ1w4b7STbgiDSJgaNXma?=
 =?us-ascii?Q?dK6CvEN/t/vlxZQ3Y1XDSYQdY65KPF3IPNh/xaRNXPs9WuIrM9e5Kd65pEzi?=
 =?us-ascii?Q?pSiCFvVR9J2fS5A8pPko8hCp3kTR1+JY1/lwD3SUtoC6HHN1E/Wf5+LPuTF5?=
 =?us-ascii?Q?NeXz7dLHLrEogu6Yfe6czOe0ppC0yxRtdX+kxVaR7h81E9xSs3kb7x1TFM9+?=
 =?us-ascii?Q?9Nlkpd3ZMzYrfmG4no9TtZnhWnviAkHyi7U2fTYldyZ3nIWl6Pc6JcdvLupS?=
 =?us-ascii?Q?QGTdI9J9EmE9Cw+c0deiyue3ETx09kWpJkg5U/bMxS0MDNapTDDl/E6Pe1/1?=
 =?us-ascii?Q?kF78Gx2mYLDi6SKTTy7Givyqj+YWDeEkJMD8pGP/9i0Zq8ebaZYRffIXbsS8?=
 =?us-ascii?Q?CliP5bdj0axvA8L7D1FsIULkvmOsrLLeJxPMxBrp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc5066-e607-42a6-2291-08de3e4b0cfa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:35:19.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqcYh+AL4Akg8Va7zqR5nabS7GQQd/RKQarjYW0w0MhI51OvgpGKLGB7mgAMihzOgJq6u2HpxWCgio2SUqzuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055

On Thu, Dec 18, 2025 at 10:23:51AM +0100, Michael Tretter wrote:
> The media_pad_is_streaming() helper is explicitly intended to check
> whether a pad has been started with media_pipeline_start(). Use it
> instead of relying on the implicit assumption that a pad with a
> pipeline is streaming.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

 ---
> Changes in v2:
> - Update commit message as suggested by Frank Li
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index bd9af147a801..1a2e5e40c99c 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -774,7 +774,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
>  			__media_pipeline_stop(pad);
>  	} else {
>  		v4l2_subdev_call(sd, video, s_stream, 0);
> -		if (media_pad_pipeline(pad))
> +		if (media_pad_is_streaming(pad))
>  			__media_pipeline_stop(pad);
>  	}
>
>
> --
> 2.47.3
>

