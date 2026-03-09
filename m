Return-Path: <linux-media+bounces-54971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKSRE2HurmkWKQIAu9opvQ
	(envelope-from <linux-media+bounces-54971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:59:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D123C478
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F182C30A9A9E
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32C3E0C51;
	Mon,  9 Mar 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S+L8f5d2"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2573DA5A8;
	Mon,  9 Mar 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071671; cv=fail; b=ZaV/EEXN+o9xzXS2TDV8h93A5es0mDnJqtq8qoy4wSF0SxX0s9P7azTrC9PeFRMdMc3Xaweps8MMgjSUtwyscBUbc2RanRRIOB+1v8rx00bIDfQLGRHeBay/KpT6RgI0TpStUaBDWnhECk7cGil7nsE75i1oxkm1kIYz4azDdX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071671; c=relaxed/simple;
	bh=T56+O/gV3YGI1SPnikzwT56Gi16FdQl0MyGKJWH4Gl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YmGqS1KoG/Ich6aoaQ8JxnnEyL22jBSRY1uP3Gsc56Hzcj9OEUiaCUXFpzYgNqpesOfXI78NsVsepx+rHv4/80fVQVW3Pe0+NdsPLguHm8EtSi4ldSlEutnmferFAOrwTNRiY6erDJDke5Y8n/YYiTOSQo2Dzp5xMAMXRNGcFDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S+L8f5d2; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caRTnyzC1hqr+2PR5Dbti3Hu+b2rQJmOzhX8GqxPpu6+4S68Mi1dBSU5yBQzroIzqY3lQAeepSg1Tsq4oh0yd7JgKYRtYTZq9VgZ/mG9U2Uq4ffvjwCvrcXLmjsDA7EAcs0qrDBUp0/qgB8M53ucCtvGATRWoWnl2b9vQis8hd99tT0T7gjdJLD8it5EM0RsIg4hdk8iezWodwUImVcATgzTGuVanG5xrrNGGlQvPXsEcXOn3Rd7vAbbBj2USAzvIUp5hagv9cb7wDHY77bYFtD7AuW/jvfg0mx+wDRcjBIQHdCSlYNvv7l2C960heMGHiWvyq7gTWzXPgANXlVxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdbvGrVH2yMgMDRB+YxDHGAbmep4Kjf6MOzjQ3ke/FQ=;
 b=wwVDXjEJaLYkAEGxKGqZMxQr/SRTJiSinKbwJZ13vxv+RN0NOn1a010M6AOO0vGMy+FsMoqTfZR29aFUayVKdHACoWExxzvZ0ZqESI8toZOrbFoLuJliTdSfEagr74PVEw4PmWDTseX8BYggGxMcBW8DfkRoCCXdRBJLHKgvlsbRq8F5MVcyGUuot/b0xWDxkG4CyOzV1/xanyzCOpgDrPery1qAG80oYrbPkiDpfrNYqcV+L3gaeHlwPxtdjcbfrVxsevMmNuObW47jpweKJMnwnW8baVhRnzTnDZHz4w8OZPM62Ptbo4F6l3aThkvw8NW3iQ40ZS8OJmdVrygMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdbvGrVH2yMgMDRB+YxDHGAbmep4Kjf6MOzjQ3ke/FQ=;
 b=S+L8f5d2Z1XKlJTL3T1xhom2QnnZ2Z1IapvOAql0E43QIXu3JEJiHxrCB9RbUW5QBebI5ZId/u7jjrP9UduqmxBSC4jLqbDJLqRZJFCNC8DCrpfVe3ok7GEhvRKQVGUPv9pdLOF4yEfvy0+uwSXkrj01VzUuuW8mI6ZIZfW/UJwcpJrRsuGekvnKI3pescQ7qktPfhp4nYihqgZDMjMSeBCn9aDNDkdMCW0Jr3ER/N8BkbExu1yBd7PP3mw5fd91CkkeMlUnEeXOTcGDHi99+syAHbLB1wkC4+7DqNMjCJ9D46iw6jZlg7nRSSnCt1QfBd1F6Lf/m9T4kQeF/bVYMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 15:54:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 15:54:26 +0000
Date: Mon, 9 Mar 2026 11:54:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] media: imx-jpeg: convert kzalloc() to devm_kzalloc()
Message-ID: <aa7tLI_S2VYrrKdL@lizhi-Precision-Tower-5810>
References: <20260307210404.1428894-1-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307210404.1428894-1-sanjayembedded@gmail.com>
X-ClientProxiedBy: SN6PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:805:f2::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4c6df2-0380-4d92-a902-08de7df4242b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	BFBi9EhGo7LRf49u756bU8lhNwPosQheWR8Ew8nfxJ3ers5xPpuEsByncSWrdJP9jtD3Qs4AkTKP1ktgWZrY7Uuu6+O19cyus3huDksUS22QderzG3sHysl2Ezeru73Nzi/Jb9ydevFw0VHTf9R7bNFImzHlDpfXoPK/JFC7Cy1zoSuNdDqfMZC6t48oDw5pee2m90yedQlJydTbw5uMijSIRYCoCz1Ls5TlGHMJkjMOskhiRqjK5E7nC+2/YZNo+BCKf/tVQ6nrXXBvFpT2LChZ98HG4KHwm2ec5RXo5OptrDH6eHWk2ZIJQiMkjECktiqAix5w5r+P2IwrBRdOwCGIbgNJRVGoT0QD0XiXtJVahMvFZWhRr8sf1peeh2Hopg+h31GGFVKRjd/JLxV8GZOlX+YMOo4dpcTnDQ3LtMGrprQzwM6LPo4Tb5B6pz0xxvAUwmgERw1rK0GaEDl+AlDlHsZHPXpbGPRlLf47MLqhTb3AWo6D1ixRdlbUsGIgONaxFqyeSoZ1jYaRA8bI5E5aj+pcpB2KbLRf6v1zNG7GFgrFS1CX/22oKrenYV10e1Xdy+WGG3jpS6E99t53GoDOgmrY4NcRqWlGHfmCLYhbBNA5piRVDFKyEb6keHg69v5pgWKulx2zyynRL/c0H71p0bPB+cSiVcLfjhzmcXxe18MHhrA0qUNMmVzdo6kBG9C/i04DFbnXbRkkwcxJueGSEISuDxvndvlgg8Lx4e7AZFuoEGO7LEKlhJGnN3pLHxCWSHY5XfLfXeybdf1NUGhMa0VvG9/HktFIB62pEoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aABvtIwbZv3+1Zx6YqqCtJN6Gn05Svb2iN0Elsxf283jRsvcVl2Jz3rQnWOb?=
 =?us-ascii?Q?52cxgosZPlLE+5IUe6EoBX18u7BAI7k9LCg+Ssc+VJSXow+i22FeLPsiAoLS?=
 =?us-ascii?Q?jt+d9OOVvp7JwAywrchUJN4RIsixK/L3RlBN0Q60wR2ZCp9K5WAmIbYJapJr?=
 =?us-ascii?Q?DegN3TNaE4RTqcd/Db06lTJjDi6HZvLtHnUTG/Ad+Y25cupkbQiNjCbn8rDg?=
 =?us-ascii?Q?7gBvP0SNM5ZgQKqKKozqRwjPCfRQHpUcxoMi5oxsxo9voApjnPw6OgwJVgBL?=
 =?us-ascii?Q?Z6PZH8EEVF1jpZFBl9loCrXTv9oyz+1AxsC2FYmiGmbz2Tco6bB8fogWp9JL?=
 =?us-ascii?Q?N0AcTyX90tQjHiLT0q9yZqg0agHVytHDMbiqsRQDTm5KwZZOR7fRTsOOohGm?=
 =?us-ascii?Q?KSYUKHJIklUT0Wg7VpEIHIMQDN5mfhssRVCMkRBHlbAYdyVtuwEJ5GNf180b?=
 =?us-ascii?Q?TbxHLTyALn1uiLcjJ+gJVrTLN4QbcSkWW/uLXRlfaZ1esp2+4fYRTgKNkhPO?=
 =?us-ascii?Q?nA7+A6QWE0s7/UeEJ/3MN+WaX3tIGn061WYTNTwcZfVmYkwT7NHTRDXIAnU+?=
 =?us-ascii?Q?D5DDXWhgoYURpmjUHV+EOqnaqK/+DBKflWlBXHFbKD5UF+2uzfJGsQS+B84o?=
 =?us-ascii?Q?yrgAVsJ71x6lKtSNNCXv+WJnml98m6h8G+Jt0Iifgj87CvC+Br1omdXtaxSO?=
 =?us-ascii?Q?Wqzm0GMTUC+11zJbNnHtPLm6Wy/hR326nvs45d2xMufEyXcRNiYc+F68tE0x?=
 =?us-ascii?Q?AJdoAuB8yZ7nRn/GxLY+YQKhLAdNZAA1H5DI+hDHgTdqPG1OItj95M3owAT5?=
 =?us-ascii?Q?qSzLa0Y+zhCjZNnNzAnqJmWGDGme3dIwuhVzUf/izOgSqavnssGiYZOgfT2W?=
 =?us-ascii?Q?t73OKRMb8ABkffrnujGbQu0mkfOvpA5UGY7M9zycTmHvcw19xcWUySikIoi1?=
 =?us-ascii?Q?jQPymx86qbjWa7q4tucOGVKoJsfBIKG4q+03Qac6hCRFHdAtoV+akHoeRp7T?=
 =?us-ascii?Q?d4KRAfY+S692lBwftpN92dvX3GhFFGOlOkvblBDlNMYwOkYpA5axnJP/6aRk?=
 =?us-ascii?Q?GH4bt7MfE+D0hCTKVAVSNGuLLJf2Mv/t48jPvE8u1bhXYgLGhh+ZsUPmqL1v?=
 =?us-ascii?Q?/MazIrSVGl+bsdz+ES3i1w122EnHpfY7XB5HNTVuHzxv8QQxYICz0nXzv/7p?=
 =?us-ascii?Q?GpGdiwFWtYBYTUBe1B6UKSgNyFQiKqalcoZqIgRT+Euj/iJ+Vgtvf+ZVuKOL?=
 =?us-ascii?Q?tcCR669QfMy5KWYXz+QAE6IOPSUPnU7Gr9PJGbLua+iJWXrprlKVBLBZorPb?=
 =?us-ascii?Q?aQ9N4u/PUAC0p340Ed9m9C0NZVnAmfL/HUjWTIs6UY2+sdRBVu2IRKcXyuKj?=
 =?us-ascii?Q?ZdllylHyN3VG8c8PPyaPWL0GFALx846zEEJK2P43En7OrnIKViVTMZ+g7zMy?=
 =?us-ascii?Q?51CwssownXcJLrHEORJbasig+uMvouI+LznJy1hvZnmR/dCaXlcFXps9R5LQ?=
 =?us-ascii?Q?6XTtzOTAaawpdKjCp/0roTFWB7hB3W6VBf9pQkGiz1Wn/Q9Eo83F/yIPbJPq?=
 =?us-ascii?Q?Hd1nZcWA4nG20N2iL/CkPbfTwk+tqHSyax1znGpvO2usrTj3M3TFL4EJiEJG?=
 =?us-ascii?Q?CC+mFCn9AXCz1jGKxgViznOLTrBRWr9qamWrEBFkGbz28lnSYQ+8eYaDGQAW?=
 =?us-ascii?Q?+FKVbAdvuokpNtQuZbvr2pcHqD7IB79qM8XOBKveDDHpxkF3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4c6df2-0380-4d92-a902-08de7df4242b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:54:26.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twzFU6iZVWbM61vJ3DnnvqSDcWklbW9SfaQ8P0iJtWOFsMGqSAry5emEYw1gomjVRUHa667ItnzRfr2TCQo+Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053
X-Rspamd-Queue-Id: AA5D123C478
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54971-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,linuxfoundation.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 02:34:04AM +0530, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> The driver allcoates memory using kzalloc() and frees it in the relase
> path. since the allocated memory is tied to the lifetime of the device,
> devm_kzalloc() can be used instead.

static const struct v4l2_file_operations mxc_jpeg_fops = {
        .owner          = THIS_MODULE,
        .open           = mxc_jpeg_open,
        .release        = mxc_jpeg_release,
        .poll           = v4l2_m2m_fop_poll,
        .unlocked_ioctl = video_ioctl2,
        .mmap           = v4l2_m2m_fop_mmap,
};

Look like it is not true. .open() should be called only when device open,
not at probe()?

Frank

>
> Using device-managed allocation simplifies the error handling paths and
> remove the need for manual cleanup.
>
> No functional change intended.
>
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index b558700d1d96..bd4b5f08a85c 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
>  	struct mxc_jpeg_ctx *ctx;
>  	int ret = 0;
>
> -	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
>
> -	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
> -		ret = -ERESTARTSYS;
> -		goto free;
> -	}
> +	if (mutex_lock_interruptible(&mxc_jpeg->lock))
> +		return -ERESTARTSYS;
>
>  	v4l2_fh_init(&ctx->fh, mxc_vfd);
>  	v4l2_fh_add(&ctx->fh, file);
> @@ -2246,8 +2244,6 @@ static int mxc_jpeg_open(struct file *file)
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	mutex_unlock(&mxc_jpeg->lock);
> -free:
> -	kfree(ctx);
>  	return ret;
>  }
>
> @@ -2754,7 +2750,6 @@ static int mxc_jpeg_release(struct file *file)
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
> -	kfree(ctx);
>  	mutex_unlock(&mxc_jpeg->lock);
>
>  	return 0;
> --
> 2.34.1
>

