Return-Path: <linux-media+bounces-60627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPgKJaBP+2lFZQMAu9opvQ
	(envelope-from <linux-media+bounces-60627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:26:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B14DC229
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D25EF302AB70
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B1D48032B;
	Wed,  6 May 2026 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nj7uqnBk"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFAC47DD75;
	Wed,  6 May 2026 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077554; cv=fail; b=FNoxskzQpqmT+trX+Wb/viuScmP66n8TI5ActNV2luD897k9XNYKdYEHAAcesyOvrFy3Y2Xni8g4aolLbeP9V4GA+39ZHLbuQkg/TvSyWqQ8WIDJ8FaHzVn0eLDNmpabRVpbEfJgBbYBndYxyn7KU1mt6GK1gbVPw5iDcERfEO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077554; c=relaxed/simple;
	bh=yHk0so0uWcVHUC2W0TUQcyUIUbTijwywPnEiG4htpJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z7YeMuj3LypPsWCPv2TM6zhR9B9L5L1MHLp3WW/41rlKFqHwVXK2AzyTUG1zAReh4J+93miiypWTJ5scwAbIpRH9f4of15eDQWtGz4XNMfEP9Vvvf8i3qNS+xUp1mo1WXGyKbT6C813wLAv/5Bz5IwxJcppcO8MDhzVGsvqWfls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nj7uqnBk; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMtIjPbnr0DsuxW8QcbXqpZsEmHUyRrYiDT522Y370j6UzOx7cZMBmfAhW4gZnITQ/iwqzz+0SUEbKPFRrjPSZUevLZiLf8ly7bjPNy3rdqFwwfGuKrRDXakywDJ5UnDNcs3/eiZi7rHMup0V2/hjMzKzf1PfqKs88ew57ZDzQLnIMRvT3yCU4LdIFVc8TNWOGyH5P0kwy4S8zQHH4HfrojkpOPn/7K4LqQvSu2lXl5OIWwKYb/7XqM+ruZ0FMPPnEaK4amr6FNMgoXS5bbnpbIbUBo/vNoMl12XpEecS+qSAK4mEN4tQhBbqm8/bFAlEakDEmnqkedMZELjxKpVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIu47DBO/nzlAsA7zcloIiEcrMey/XY0iX122acTz0o=;
 b=G9ql83sMQl7mxPcaX99RbeOp4ozplcA3WZ8bQ9pJfKS/v6orfeAmx/Z5e4CAitOtulv9Fe2Z/HUkuLB9OGUo5S8MvyLfx5UfVcj9jkQ5cyBcaNA7JzIT3N4Eyu8nJlNSed/FCtyQwSffcZe64BbSOmeSrQVZ8w87AhqBh4l2Nss/0GYMaPBIB0w3FRNMTmGKMvVmHA5wWYykY1E6h++VyJik27f799ta8YGdV4j4TUe9/r6VwRfXLQRLCwITn/cWMDhctwMol0QHRveuUWfe7ZaDL0EWgwGeYXf2jG7/JTqaXO0SnBDKy3KPPhhF81KUpfkVLw+GEcxj+QMexuNzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIu47DBO/nzlAsA7zcloIiEcrMey/XY0iX122acTz0o=;
 b=nj7uqnBkgnJQ+izxMtHj27N/BpBpEEK2XWUiszLR/4kIjGo22+CxgYLzKSP25u8Sgo5Huh6Hx6XYKl2Q7PjUrhdEelXFlQWSdnc5W/5NuDFfFuzfy1yY8W/FV9pkKw/mC37C8vcj++MIU2BE6EONRTzwOcTVaIcxHytmNUpHVih+HFkyT5qp0uufwccaYdBHEgWx56JftjizJFm1sPBnRCAkVty/OJqQejbRR05Wx5N4um0Vo47gN5NldoHjwmop7LCXUHyGK5if92uFtmvkzXcR3yyrTqIzn3Jq4FoBNuAtefyeyjIuk/PC7Pz4sWau6Zm+J6xsb/KuCnTnfiGhhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8049.eurprd04.prod.outlook.com (2603:10a6:20b:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 14:25:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 14:25:49 +0000
Date: Wed, 6 May 2026 10:25:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
	s.riedmueller@phytec.de, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: imx8-isi: clean up already-initialized
 pipes on probe failure
Message-ID: <aftPZtqFrhhcMPCr@lizhi-Precision-Tower-5810>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-5-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-5-xiaolei.wang@windriver.com>
X-ClientProxiedBy: SA0PR11CA0117.namprd11.prod.outlook.com
 (2603:10b6:806:d1::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 9adc09c1-43f3-47f4-63b6-08deab7b5e97
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 wTW0z0ohsJ/E0vWll2lzTWPahuEabQEgPmL5R0ElnYRfXLSbq3yF/sE5f8NrEOlntRD5IyF5M1uxE28Nz0iXZYj5VrleiqTzqQ577MuwL+RWfmk0DuhQ4KXHQ6zu0G0iBgzhy4sERs074kakbyS5v7oOxQRf8ESlulK2EtYAKNic/HS+1KqiPD86D2HvHt3eBwQLtd1HS4mEH39Mw5v6NASU/DD0r/7qQ0a3Owe7tB8bveN0qsQn8GHjtR0+/mnJOh93cabX7w+UvJ6g39XlkJhe67hfB9DGtsOMexaKJl61ylQoTOEAqv6vkykLE1AJUZTWAQFQLjGG2WPvC9DSTw88beRGndMQhsJJq4B+JOU7fnlMBM/8iCzBAC1FMrbbVFyoed+vXL0Re+f2wOCvLSgMJk6dCcsz4d5vGUH/RC6DLiTARX9zK6TK86LFJoZlU/sJVB09zZKGfdaqMt2hl0y7jaqbmFAiDsd8/AAFBA56yGbZJqSFEoiT88TQ01opFSbNukopk1O8IVatny/zBR9Kvhlltw8fb9tuk8294KlA9sfQs8dESGeI4a7dg9Urdrf+v9GGhMB262cTtvXP/IIp09IBFomhJeHBNZxU6jDWpHYJW140tIErjNs0wAUQptmrREwpem55m6FOLyx/cTkRHjEQudjLACXLIKovi8Rq5oATJ3Lbwh/KZOevqNba9O+Rlk8MRzrepVFFQkEQD4KVwsLDhG5n4CUshnuVqxoYOZhq5mEaHX6tUafh6Vh/
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Z45ZP1tA+jkXbnr7A+i+rDKEOJBNGvsBdXtics7PURuumaSXLPKRnNmaotws?=
 =?us-ascii?Q?hUJ11A9fKSb/KG/K+P7Q/Um6mrqDz7Pc5Z2l0CkE4iunjO49DS4+JnrOQeu7?=
 =?us-ascii?Q?N4BeYSNB4GfeHvSKKuOkFDarIdEr7J/4wAC6sCu65U8NrSs5JtT/MOIEAg+P?=
 =?us-ascii?Q?F/D3Gt84+ioyw1CiYQ+gGNS+m9uvqlUyTSrRV96+v4sstCQ/kJrEjxceIhXi?=
 =?us-ascii?Q?JwzhGZ55iLoMEaX3e00w52VLSmiZBD2EZ6Kw8+jm+2Bkx8TFH7gpdRq35vjM?=
 =?us-ascii?Q?ZlKIw+bKi7B0zVC7bgyDZONfzdIpuMzg0RCk/ckw4SpLNfsagV4+8SpxOdPC?=
 =?us-ascii?Q?n9Yax9DkQaZnq/yBcGZLu/CwmO2UZsPJ3dPPDO33IbCp98NI1/PqcrU+EvyT?=
 =?us-ascii?Q?bJURqi6/SKOXQdEDUkvUsHzm9kp9lyO07Y2IHNoig0yNnbHcoGdoOlwGssVb?=
 =?us-ascii?Q?g2HZ8ZH5bFZoZYuz23vomHd3Hme+Nnmme96foxUJA4WTnLDv3wPjErzBMNON?=
 =?us-ascii?Q?ZglP8IgaiY1EM0AQyIZNAKOYFTyPbMkLpV8oWEjsDgK+Ay7RxSge6zQLEoZW?=
 =?us-ascii?Q?29NIhtA84xnhEeZHvADkWlMLSmMW11/fnhGtcNJnHHIEqrVSrwrXJSqr8EeJ?=
 =?us-ascii?Q?5P0eR20rkBzq1GBjTlvuIPM9W0cuct3oR8jKqtelUxFzr5u6vZKqcHdJDx/8?=
 =?us-ascii?Q?2VwdHZO+TuBry8QDQf+tRP5SQAntTWoLdTaUEb+pyCyZ0zaf1LlQ8FZxGDTF?=
 =?us-ascii?Q?XbMfWnTHLvzyO4axf6uvCGxf953SPO+hoqrGXeUVx1VRP7qoUYhmrJsSLAmR?=
 =?us-ascii?Q?gOco12pzM3uOm2FoG4evgn68xztuU2pO8obaXFAbToX9a1th9OYvkrMLBNE9?=
 =?us-ascii?Q?hd7BX9/49bEmnHw4RqXS4sG/JmNVSBkidyQWVpanSyDOYtVKX3yuVsn8wDmU?=
 =?us-ascii?Q?/p8UyoH7rQ0pdqf4acBMCvQuZ2DMGEFCgwSyY0wK+FVFOBbHWmWAHS6ABSkm?=
 =?us-ascii?Q?2TlRbSVk6tDpU2a2dstgNB7xCVCuKwgC7SlXG55bgZZxNUYNh2FezyI+nSmA?=
 =?us-ascii?Q?1nrtE/a8M5ftMomyuAWj+aqZncyyWt1kbDKpL+fnblthO2wwN1Z3VI5fOhaM?=
 =?us-ascii?Q?oqZX1DlneVLlqFTbOnHLznkCCywx6Ur6tWbV13ZRTbxgbRM4+SAEix7YmBqb?=
 =?us-ascii?Q?Uyi8/O6NdHOMpfPNJW2GWmiJbh5Tfzx+cEHcYWT5wpIlqJ0hvl5sOmJcO91Z?=
 =?us-ascii?Q?LRfUySX+BWnigoohBv382Bxc4tSC/EcEUmIKq0JQtHP++okO84+YxkjZunLi?=
 =?us-ascii?Q?cxF9Ci1yQ8GkLUqI+4xZyYpokCFXzvIqCpIw1azHQKydZ+KYIaIfLU7LynO7?=
 =?us-ascii?Q?s/CNsGcC5S03MAl2+m9DIILZVT3lKPFmhUglvBOY0UGrQmcTa0by8OqwJSOX?=
 =?us-ascii?Q?EqI495MKlO5/ObmP/3iWe0abmXURc2LM+7OGKLpRebi3uG9/mH31Fy570ElS?=
 =?us-ascii?Q?c/BARxOuKNfxC33UyKdOdjMkwKqbVTATnf66iql14Jk0rsEXwv26xmK7wZtW?=
 =?us-ascii?Q?G2ljMAQkKF+f7x2uvIklS59iftw94hlbT34rs3ep3jKkp6vcq6cmKwU1eolW?=
 =?us-ascii?Q?ZDrMhz3qXW0+H/e5vrxVdIQGK7lzAkGVTruDiCcZ5THwsXBnr1/krfbjQ8Bc?=
 =?us-ascii?Q?u4W8VeX7bQHs+um7DbvhK6OgTOqf2H3SqllBF/MRBGhJuRuc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adc09c1-43f3-47f4-63b6-08deab7b5e97
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:25:49.4494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDE80GTVqqod63K4hbJ6p98CiLBsC2Zzz4g9P6sfrzOqK6X6ZGY4mQiHFGJz7w3YqXz3sUKafGRktIUcVP98Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8049
X-Rspamd-Queue-Id: 7D9B14DC229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60627-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,nxp.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 11:12:10AM +0800, Xiaolei Wang wrote:
> When mxc_isi_pipe_init() fails partway through the channel loop or
> when mxc_isi_v4l2_init() fails, the already initialized pipes are
> not cleaned up.
>
> Fix this by calling mxc_isi_pipe_cleanup() for each already-initialized
> pipe in the err_xbar error path.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2b76fb9c18f6..8533a979d60a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -539,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	return 0;
>
>  err_xbar:
> +	while (i--)
> +		mxc_isi_pipe_cleanup(&isi->pipes[i]);
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>
>  	return ret;
> --
> 2.43.0
>

