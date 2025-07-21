Return-Path: <linux-media+bounces-38126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DEB0BBF9
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 07:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A89189A323
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 05:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FA1218ADC;
	Mon, 21 Jul 2025 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oSzTwfmu"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7EF1F03C5;
	Mon, 21 Jul 2025 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753074498; cv=fail; b=l3oE3FalZi7YwIGooebu3xTWZRCLDE1PkLIHQBKvIH9E3Z1MXt22HC9LAYjcG7CChZYlqJnRy3kNAy51oRsIKeNcYcCI1jfKl6PBK+zDucCIMxx6cllysdNhoev+jfcQGQ7icgT+1D/G+o5kE1hhh45o4twj/CNei+UDr+2iKqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753074498; c=relaxed/simple;
	bh=7RN4265aImB3U4h+D/Rc+iQIFjg7nE3jG3OphpVysBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q5f/smaLS4b5G3jpXxzISCxWA+bvVh1qWQ4AkR23QT9kLubNXwnx0NR+mLmh9wsQdgNJR2zWhF33mbeCtKfSQGP0OB67zuA1GSYWshWzDNzTp/8KCJPhSPnnLuZcdpRCgh86gfcg+fwBJyukhqN8+QS25Im23OcLcjbDqeMqK70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oSzTwfmu; arc=fail smtp.client-ip=40.107.130.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RH3cFvZf5V2ovsdOHEYpLS/TbSg/7al+pDoWal3NqHII8ljQZ5SdEkh5Q6D1q+dpAJhAovpgtNdmai4rAMX9rDpHRdSC2+FkYG+qz0PYC41srZQ7RUcKxXZSLmjL+d6ZKhIiQzSUnMbZtqkoT8BoxLbl1+AahHclQseV6wTfEPMABWzPl3eR6DrZmgrF2eug+NTwBGuR1pIZi5ucOGe1j604vL9/BCBSgQ8xQtZrY7Rh+weyI8W8olBWCGHS0XfEw0W1V+6C6j1CkZoaxykdl5LiAAQARdVhSRI4hePrTwnYomC1qaQTQstRT8vyvw9sG9eak/jhjHdGx+XUaA/MvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sSLCENJhs4WawRLjs8puSvIIanB/KfjsAFzyupBUvc=;
 b=mNC4rpVXKZFNQEEc8cXe8uAxzEuwCznLUm7PGKYseAvzJ62k8NKjPUq6uWv2lbmWfY6WgjDgWN4a19YR0sk5BfP1Xp7ND1Bn4TDSmMqVaiiI5UlFyGsN420cQqWUqzJbWDeMrbpL5m4M7OZt5S3vFSbUWlxDTKetytdM0F0sOruKHWB5igrXCNzZj+JR5B24C7LvPxF3cwEQDZ65rI4bnj7LGZlfN5u8Cv0XHRgdm93vZX+kVHVSkwy3ao4CTfxk7mji1e1NNwsdsMC1SitHL1fcdEvlTTjJMU5bekkap8qCuLyzWoIWoHIKma5N/v8FnhzoqNkXncFHON19G0uNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sSLCENJhs4WawRLjs8puSvIIanB/KfjsAFzyupBUvc=;
 b=oSzTwfmuG15A+lLNOm6t+yZT7dpVRUrCLavEx64BszURNceOozudPJuT0XVnooWJpMZiGBxf+/WBhjO342PXNZQaqsv3stPkVWmfbRcPpQBduV6BXUAJpkq4BFfWpE8Auez6qrK0dsYUp+ukSDiR+FN4Dk2WZg8Ho2rYvfqMWRa9GxSuFuUJ+A4vxZCFFHw33MftHOopzMrfepDqru0/UfongMjp1XBv4oJu7mLO7S7QEnKnWyJiDrtFtqBWYMls8Bj1NHY8mIHrah2fLhPPwJMIQlHxDmSh4k8oYtZY5dzzMyq7avNvsYnYw17ncLril41N3JEgKuhBhxMNzhDYJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 05:08:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 05:08:12 +0000
Date: Mon, 21 Jul 2025 13:02:57 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: stk1160: Restore deleted comment in
 stk1160_fill_urb()
Message-ID: <xvj4llvckgxorozvk4bexcsdawohe5n3bbfsk4pmwg75rp2spk@2jy3qugcfiaa>
References: <fdab5e2d-47b6-4551-8aa8-3e90b2207a75@sabinyo.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdab5e2d-47b6-4551-8aa8-3e90b2207a75@sabinyo.mountain>
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: 472e3aa8-eca4-4857-e2ae-08ddc814975a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AQG0rOP52feXfwkEeoi1uSpC/GenPT2HmIEX5k4p1u5ZEEyBLTAtgQOeGNuT?=
 =?us-ascii?Q?8tvRqgvQMrkGOMoQ/C5pDFWXYy/yAdFoX1PIncXfnl6r9OFXFW1qyqJmGUQa?=
 =?us-ascii?Q?1shBfAkv+38JXeru3KgscD9H1U4lkgsdekWwghZLw7vDS0I1D9i/kRSBJmyW?=
 =?us-ascii?Q?myOOo20n33IHzkFZaD55HchyhiyxEv0yfv8JZc3UEVGernI7sXdZUnYngeG8?=
 =?us-ascii?Q?KtiH5lEGAwN/XK6+lesJQJifByMBhA1euywdbrJV11fzlxkaJyafiRP8hWbO?=
 =?us-ascii?Q?htt2HQ5pCiZChXdfwucVDM3xcf+YwZHM4CaSGs9mhw/CYe69DK0dViOD8ZAf?=
 =?us-ascii?Q?JHC8qxZFKq86zsukZ09mIEp5TLsUXtd9iOwIHCEqPmndqpY+R23yA1rpr+vP?=
 =?us-ascii?Q?+sUgw6rIR+LRa0U0TibVxHS1zzBQ6XJyzSHvoSicR80HYrnqB/SWQRzY7BYd?=
 =?us-ascii?Q?t/wuRQscmEBi6DY31FxYpzDFlZHI4wlBqzfLbPTI8Y0M0Fl8S67AucyPMx8H?=
 =?us-ascii?Q?UMPdWjQ8wrpOwSrh61g1zCtQHxQI+8CcEJ7FQ69icgFay7mbgDnacaCDT5Br?=
 =?us-ascii?Q?yA8ycD59WOofBgtOJ7vy28+N3TNuNVRjTPO9QYbVvWTRPMAqFS2Mv5JlgBDi?=
 =?us-ascii?Q?skh2AC/gC05kCyQc2EHaM9Ai61OFKoDF8LgTBC15iF0A1WZefMHOMBKOIDry?=
 =?us-ascii?Q?X7ofVbxwCjsBOFYxwmIs8o+2kUcTd/LpL7dh632K/CsuMXw6oHsp+41F/IEO?=
 =?us-ascii?Q?6Pm4OHeJL7ibBsk4py9SW9+QTMeWWcGDEnJQwz6D2R0o07pg7fawUnpc7vNO?=
 =?us-ascii?Q?FzoZZwlevgzysnE506N0sJa2fPqpitQ2N9jDNvnBOt8Y+SBxDIg2ZRXsWWiP?=
 =?us-ascii?Q?WhpdcpKS1MRQnTdXD8klJdn2+HUArME3/TZsdzgbkugMeTSjqYItxsc9Eq95?=
 =?us-ascii?Q?dDmGARFumBGsinAeeXn5PoDGltGgXfkLHIGBfMX4IB7va2OvisRD8R71GJ6j?=
 =?us-ascii?Q?VobZVxri3TstuVz8EINhRl1Hu76Rk/pQ9OsAnW3+tBBJbnnmG/67HKwRgVSa?=
 =?us-ascii?Q?hxWFFnWMyi2yKhA92ClqA/7+/g5gCUIYZoDXVqJhtdFLMwJsIUh8LCCX8Tdp?=
 =?us-ascii?Q?sXSblX6IWdx4xqEEGMk2VKfbpC0LcJkABW7qpF/KYWd2rkbJsHNj+kXZB9pf?=
 =?us-ascii?Q?+z1bfTlGUWVKeCod5KVOA7XnYtvzZBrLNHZMwfKsqt++gsyvh/gq94T4Sms0?=
 =?us-ascii?Q?YIy2+XJ9FsBjjqrbxQh8/ivAOR+SEL4LLoYfcvQoihq3R4TgDi+Gs2tWbuSn?=
 =?us-ascii?Q?hln73n0cO5MXH46ZzARzUjhsJq5ptSOjmYmF+DlSyIEJD+P0z+wIuTO2PoPt?=
 =?us-ascii?Q?FrCkXqyaosAMDiaxEewPTlmFubMVTkOyj+yxpeYwDhDJpZg9Pvl8Z92HJ5bX?=
 =?us-ascii?Q?RwkRVIKR6up7+4AWBZwNFw8kPDaN4J2rQzKViob7VCSfpkf0+TAmLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZQMTPJKrMLpBhRWZTSLufckg+ZR3A3kyB7WXTpKvh69BXx7N7jUbmeX/Pi6?=
 =?us-ascii?Q?dwCzxD3zbNURTl7JCg0x/dbrvmEV/6eR15EASEc4V5mqJVzyFLdKYvoP2Bc2?=
 =?us-ascii?Q?zG22C5V+gSK9GBEMRJVW/GiPoVdotSc8oYA5ffLTDlMCIOsc/HeI7ePWWkx9?=
 =?us-ascii?Q?r1eMaCOg+o1Zh58w8wtyS+hKcJrQS0u5QORPp/+VllNeS6Ex4+mYPfgsVtyo?=
 =?us-ascii?Q?MQXGDPtLY026DMxsCVvUt3ajwdSuHy+2Ob8FDT8T+hJLNnk2SbCebhHQV32K?=
 =?us-ascii?Q?A/oSqdUotkqRtpDgha4+I+rx6oB/fY7iIqo+0d/p94S6r++czdMCKHrnzNjo?=
 =?us-ascii?Q?+HF6c33B7rCUuTY7fjNuyLezQMEwoL0Ib7ilGa1i++r81pFYF6hKFtM1H5fN?=
 =?us-ascii?Q?/wpiS9iasvChpMbL9tUs6HaBCq1ACzpROlOjOQqMve+PvdJmtNIJ5DFUdjui?=
 =?us-ascii?Q?2lwdyX0/5uqKtRv47PZgLreqmYy6YsSobKX1A0oD/Q9XRE5RBagJi8H/4zv2?=
 =?us-ascii?Q?EqS3Rk4AAOR01c2SMXHqCdtPd+AHym8jAyv8VI5VJLJ/20ycvpMaPBJcRYzF?=
 =?us-ascii?Q?C5cH85r4XqNWo0+g5dxly/0hnnOiwISrpKpFB7T04PMfokb0MiljanGia/uS?=
 =?us-ascii?Q?PcMLXgjoyeHeQepn8Aj25S9qLx+o9ewzcGJ7OJTfHS4WqDxewmgacLNM/3wF?=
 =?us-ascii?Q?D3hH9eDCdWC5egua0eki2jqkJFnG/ud8mVs1JjzH8iJsqRSAPJb6V2c8LuYw?=
 =?us-ascii?Q?1dDB56/Ig6OqQQjHq4nraB7Sdm6zRssOZYbSauJEQwNUIJXys6IF3fsVgbxX?=
 =?us-ascii?Q?CEO6VD/8peJBLQRQgHY6UntqxcEUOa4YKu0PodA7WEYjmijMMvaJCct1QibU?=
 =?us-ascii?Q?e+OTI4uaCPt033V4Rh/q/hfnZ9VS8U4D6ACtAH04avZ+NAQGfjceggoY5T2h?=
 =?us-ascii?Q?Y/1XjVSNtioyKdVEWdWmHw1BtP8PcQqIriEKX8Jh6F98E6225MH8A5a/3gIU?=
 =?us-ascii?Q?olROLEBjr15VmFgkli0f8+qoDjNJp4vvEEx/KMJcMRAe6qbnCjPXjK6gEM4Q?=
 =?us-ascii?Q?dyO/0Fy7HNpKjrf2+qToLXeSrI0OHqEeizHPg/m4N76d30kUGmvsewWspu6Q?=
 =?us-ascii?Q?ZCBVAy6ueJ05nj54YdlnfhZp6V+mrXcSidsp8knH78V9pC26/5V12xKFJnov?=
 =?us-ascii?Q?ZHI9ctXVXUi1XIX4d8RGTgcPshqJgcP5nLmofzMx94B9lNMKee/N/YxFBa+U?=
 =?us-ascii?Q?P+6P9C8pbHr89GcSlnqOZGkiXL3ZUGRLRVQA/XOxiOmnqDW9eeE3PfiHhWoD?=
 =?us-ascii?Q?y4teOqegh1YWAihSOVZBNPm2MZwFCB9riN4P5hOSjqipVIFzAjaTNgEJFOMo?=
 =?us-ascii?Q?LvA30xSz3yWODng98LXS8Nw+bjUuoQg2swdVd1Vi54/vJ9WJxxhaB0dI88wD?=
 =?us-ascii?Q?Bc2xpn6DlRNRo3//pGrW39mUlPRx6DCzDhXKKafhEmqK71L8yzqLJAskOwCp?=
 =?us-ascii?Q?NZARa6UreeLbvaYwo6E9LmRl+TaWTc8KHmlAL1boWuywjDBSiG6WADuYFZc7?=
 =?us-ascii?Q?v09JOGfGDN0K5epnRaD1l1EyB7IgGkiMOyrrZ+Ne?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472e3aa8-eca4-4857-e2ae-08ddc814975a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 05:08:12.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWMo4aihdS8jes0/Hqpfx1w6EWzGycBs6POHUfPbBXrLPa0MBUbegvAC8kKvSHvXWe+fSSYMr9x+OT0oWGfhuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365

On Tue, Jul 15, 2025 at 06:00:32PM -0500, Dan Carpenter wrote:
> This comment explains why we return success when usb_alloc_noncoherent()
> fails and I think it's helpful.  It was deleted during a recent refactor,
> but let's add it back.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> ---
>  drivers/media/usb/stk1160/stk1160-video.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 416cb74377eb..3e6bffd49346 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -408,8 +408,13 @@ static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
>  	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
>  							 GFP_KERNEL, &stk_urb->dma,
>  							 DMA_FROM_DEVICE, &stk_urb->sgt);
> -	if (!stk_urb->transfer_buffer)
> +	if (!stk_urb->transfer_buffer) {
> +		/*
> +		 * If the buffer allocation failed, we exit but return 0 since
> +		 * we allow the driver working with less buffers.
> +		 */
>  		goto free_urb;
> +	}
>  
>  	stk_urb->dev = dev;
>  	return 0;
> -- 
> 2.47.2
> 

