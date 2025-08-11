Return-Path: <linux-media+bounces-39447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB90B20D14
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 17:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84B9163C39
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1259E1E5B73;
	Mon, 11 Aug 2025 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iLwzgwRF"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325341FF7C5
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924762; cv=fail; b=Y+owIm+EG5kGFOtAJMJ30emiKO18N1kanx21buyQXtFhLZM0TpUVtOiDV3uN7/VdeTPOoeGsgbCK/65oyuFAjIPtHlZEipw3BzW6Swu25SLf3FFmJLaJGYyI5eEf1bQj+jbdFZ8fWN9TPBKPC8D/yvzHjPhN1NdwIIiTMEfwK/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924762; c=relaxed/simple;
	bh=T96DwL1/7097pUBNgWsrm9g3YmW/AprKgHelQNj1rnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MPKr9mI+kntOGoWgGHnX0+EzAylafmJBvjpLAuphNTTUeWYPNw1DgpM6SD+9TUHdh96sfdA8kOkvhwP5S3QHKoyslzuMZ+MIi9tu8OyXi5ncrn/Nq8zlN1SdERjZKaezIifDXNj1Tb40osl84QJkq/un1nhWdBdEMz/x1XjxmNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iLwzgwRF; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2JHlLbAXf3Z2en9x3sThWSCKMS8KpGz33iJLTEpzg7XpCFVMblBVSpJ4iZgwlTE1IhQDy3VtbXYpnjmEqAWA7Na315FQfj9mF3fIx+Z+22nmKcF17I5IoxnNd+g6LfM/liSr1Uz9vymOR/pwuZsLnjZjAIybj6liWzjNuLJVfggP2bD8wWmpjwNKw+UJUuMD964ARzvvU/DAXB67caY+IpQbLpLQqJFegE+r9HvbIW6eQNX1OIMNia0XUHZx14+ns/QIo+73Ct+quvLKv6hBK885tBmCYfVNMb9U4EMJdLz6RNCBapFHdcXu+MaIkKp1eGx1SJXsD9vqNYSv5wNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cUdTYj6syPmsOgg+Sp5sHZvmi9KSVOMZ6liSkc9LmA=;
 b=CPhGIxTi+TrjuoPR1HbycthnoN3lleWlo33qjQc3ejX7AB8ELo63gqaSbRTeihHSHgoHn15wQwC7FVKYCuibMvXv29yVzh5plMYkQwy+n3kGt8Zhiw5z99nO3Qq8kzJampGe/IKg+YCstpa5l714/BZgBDgEywOXO10tn6fIu9G1Pufe9PchViIS4qit8+9f0BfNF/OoPSjLvegZIWdT53nXM/291uA/Ih2Z+kW9+ztpENZ9/v3qaqVg0K9e6XPk3P60tMAviPp10T4EQ/7syi69cVUCiMz3z+1a4C4gppLWsGQ2JkpsGMP776bgdB2gEkWiPQAw/KgNgrOtWkGp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cUdTYj6syPmsOgg+Sp5sHZvmi9KSVOMZ6liSkc9LmA=;
 b=iLwzgwRFaho4sM774roa8x0S8rAxyONmLiN3/4eVsXu63dCSUBSwwo7wZoYKVjGwHbTn60eB/zboulbwfYDprBMkabltBqWXerf2s/C5eyAkviduSlGuh3U4mt6L6NeEhqA7RDjFiWmYxgmeVsQfS0B/S6O/aLBhXZte5+MwQn2O3kt8f4q5xwV3S2pqGE4vPAhySZ4PMOF2SLzu4dDVzKU1WmKp4x0Um0o21pxkBr99j8H+j0gO+CJ20mbLTGl/BasoX4DZ4FG4eFbCSbHCj9EE3JtqaPf2ij2d/qqZZDsIBwPxjtGcGT+73ceSvi6kP85g/HL0Wwd/dC3s24vKjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7453.eurprd04.prod.outlook.com (2603:10a6:800:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 15:05:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 15:05:56 +0000
Date: Mon, 11 Aug 2025 11:05:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 46/76] media: imx-jpeg: Access v4l2_fh from file
Message-ID: <aJoGzfPc9+91PEoe@lizhi-Precision-Tower-5810>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250810013100.29776-47-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810013100.29776-47-laurent.pinchart+renesas@ideasonboard.com>
X-ClientProxiedBy: PH7PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:510:339::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ae19ae-2e37-4b6d-711e-08ddd8e892c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0xlly14wnjK9SYX1/4yo8E/q9DlFE8RRmcqdL69rk2Dnz7f1IMB0PjSN9iUB?=
 =?us-ascii?Q?xKzPoUOlJDOaDpEycGiqiecxi7tJOtkfUF/S8HR87hY577k3tb9vSk4pGTCz?=
 =?us-ascii?Q?PwRWx4tZJaIiAIgiLSKT3y4UrGU6clZ1/9zuykKX70hWcSDchOQZk5lTtZWI?=
 =?us-ascii?Q?chfBGwXFkIrqFVa3KHHtsaYIoWJ318OCLyviGcdeven8K98FXTn/Fs9oiAY2?=
 =?us-ascii?Q?ehzENqFyekLv/8Zi82pXeTI+WT0arwd76JF7o+7bq00RNp7JnOUw4e97oLky?=
 =?us-ascii?Q?1fkGEUW3imUngqBlXAf/cGoGY22nGUhozMIzzCrOKu8WBLjO7vUs2j9Squc4?=
 =?us-ascii?Q?HhDMucDZg1Tw2RDUHNtsZUsyLO37tPwAdaNTeEYrbil317QfTGYJTS0F0PpE?=
 =?us-ascii?Q?4MOT0tY1gdWxhEX7NltzXSwenLVCtODEcnfw0xYJ7bdjxlPKtVThbM6w7HPq?=
 =?us-ascii?Q?lsBoR0EfU9oD9u+CW15Wiida6bq2/smMrcRrR1bWrqGI3GchQQD+s+ivwIJC?=
 =?us-ascii?Q?xkC5kVd2WsNGBC3r6wuOJmO/bdvzGEuGkNNEpzBYzOvIxPH4hFavpaS4jX+b?=
 =?us-ascii?Q?my5loZx40XVf0eIx86NV33IhMBl0Gme2OSUK1/dUvfJhvxzrtK8FK0oDndo9?=
 =?us-ascii?Q?8/Dbza2o6AdhZX9DFR5FiQ+fCzDcXwU4s2y6deld53R0I95d0I6wsgBlKc0a?=
 =?us-ascii?Q?N4dWlUi+pT9APS7SKngiG+ApckijCHGACNtKcxzTNwPBbizjtss1TJFQvOeN?=
 =?us-ascii?Q?FksGKx9urimBaVxKgzdmWb/iSI3JSfDMemMdUw1Su8ad44H4pd3kfJD55ieE?=
 =?us-ascii?Q?N/ri3tcUc1mrVZuYWpq4GnFjMQOWlgWSr6I0wrfG3BavtOZF9C5ujGDMkAvq?=
 =?us-ascii?Q?T88fGPAbK7ErLhF47foSIWYDNXEqf7o8vgwrX2jLIRfaPwaAQPX2ejVBbkSk?=
 =?us-ascii?Q?N4rAtPzdjt9NzFjOWm9GY0HCBY+miXYZGsnBmkZI0sVFH7E2bcS3JQ4CKWc5?=
 =?us-ascii?Q?0JerXaJF7o1xNfL0JInUAXxC8DW9LzG6w9ntv5a7ee0bt6csvY3bbIql8cE7?=
 =?us-ascii?Q?n0uqgAnW78L+PmZ1gKZ/crSBE3YeLq9PPGM3k0OLxiOnvccDlcxTlZEcQ+qY?=
 =?us-ascii?Q?iRDRD3eWDFlIiigByp+cv0ACS2tLCVH+nMhDK2YgV1wiKh3iDy1tWwqTrjs3?=
 =?us-ascii?Q?s2jtFFLeYcOzn8Yf8e59PuePWarYoBKWcyTXWQacgiLi0WxaGIeOMhDBo/N8?=
 =?us-ascii?Q?fyHr3Opq8xcUD6hql2CnG7LQ43qI/IPw9U5ClXf+e3AGUGHmc4ZJphm1V+m3?=
 =?us-ascii?Q?rcx0Z4QJcB7dyT67Zd2xjsMUsexW5itXCpAABlx5OEv8JDDiKZDSWMhBJl4n?=
 =?us-ascii?Q?6RtuuUBDt8SnvjhgmgmKE3uVIyt4ygxUVpaqglDiB2259AC5xV91zZeLQ0MQ?=
 =?us-ascii?Q?EOJr+io2I6qbNgrDNbSmm9dhTaL9dwaXSNquJlns5aDTIRvGMFAKgQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?us1e+Aqhl818F/WZvqbi59TIwPzwMiC947tFgod8GKPN136H3xX4Qfnuk+f/?=
 =?us-ascii?Q?Py6ZGS2M81m4md2a0O+cSJ5wWVfRqM/P/9xA8Ambrh7L60ZvT7j28fkntR7T?=
 =?us-ascii?Q?RsBB2CjJh4AqV/2HjszJl3NS11euqsv62Ej7V3bWXCrqd5G2kilQEM80/r/y?=
 =?us-ascii?Q?cPevPLlbH0WCprQeCN9e7GS6KdOGudLwXALvBjTee9wiRaXE46L3t0CSzmG0?=
 =?us-ascii?Q?65Wro0XU0zcw/E1ikA826hYzMDaTSn0a7zbJoxhyzqP/poax3I0dlZT3fn9a?=
 =?us-ascii?Q?ptEonFyfGsVL8hpNQ2wJicAZHegCeCL8FeRRN0n5DDoT5aeP0jyLMN4jLLX+?=
 =?us-ascii?Q?IDpO/eyw5ZR1Wbqh3ZMxKQhf68CrW2Lapi2A7AuCnO44U6Kd4h0BaTPpvseF?=
 =?us-ascii?Q?rO0mgy8q8K+j5muK3WlDx6i02PfrUFLHgHPo16CSluM6DqGb5mvLTgik3gXN?=
 =?us-ascii?Q?foxOWgEwPNiOnQ3iJ5Y50spr8IjgqzNOaDURFOpWmB6cMquLDeJDzQgzveaz?=
 =?us-ascii?Q?j/TtV2ewUX+hGhmZWbOD4C7FK0bmmqHVFAX0E7rzxMLk4pQroTn+yA/zM+en?=
 =?us-ascii?Q?YXXDMuAoeT4S70liBX0Fvb60rkpRDePrQS2O5/9r0qF7GMnJMH5KUJ/nrpDj?=
 =?us-ascii?Q?Cl1l7OKNANYWDfQDDhSnwaV7/SVdOc7KE9KF91hiME6LnyZ+4DKit4ZTWaNL?=
 =?us-ascii?Q?5CmQINaA4oMpsmxuhwDgNW7sRP52+veIdehvqDxuSNdYqvbTk1S501aQwy6P?=
 =?us-ascii?Q?+9q7GIEZdvwLZkSPZH12iJpwei3DVQDXaHLKspXR+0mjoUkak9X/MAYOEXtx?=
 =?us-ascii?Q?iuhaYQDAKAuxVsOAlu95iyK/h3qbCK5+F3AQRYC/bIlDZNBR8dQohkbND5dp?=
 =?us-ascii?Q?e8HuaqIvXXRtakCzeHXshNCk5zfzJgJxPdkAR1wmuFJoI7SeJXDuHTaodlqg?=
 =?us-ascii?Q?jlk2XkdVAi7gsC/MIMj25ksyVOlXg/yNToW7ZbPI60Zu4cGycUs9r0E/88Zu?=
 =?us-ascii?Q?SYZilDZ0+Jbxqt1Mv50Ps/gQth1423lfhx1f3xLoUkxdmeJ6mKWkjxyzrGtz?=
 =?us-ascii?Q?O0wDjssXT7Oo10YwCvQ0lMTNI2WMm4MTaepxM7SyEMVZXKvGWVJLRbP6OY4c?=
 =?us-ascii?Q?1fnolFUIJFQRgImSZNcsbMUvBqLauKPVYyaHcpKKZnlVMcV+AxxfgY6FBHN9?=
 =?us-ascii?Q?hMbEYOFZbNlAOKiHTDONC3X6uN7/LjrnvbPVC1b0CEiiSWjgazhXHWIIqcwd?=
 =?us-ascii?Q?vtDAPwW+HN4z2Ej2Q1ltwkSJi/6Ra5CX+eNUjsDOY/Eg9nUevflQdow6vUtd?=
 =?us-ascii?Q?//ePfX2B/6KI2mZiOc/TOB0UkE9AxRDIBqa02iERllr0cjST32C1736sahfC?=
 =?us-ascii?Q?Bdv+hsvvxJojihGEa+hNEQo7fQOn2q2VWyXHytpIBmNCWzOJBvPq0c6iQulR?=
 =?us-ascii?Q?9UCvNrxCAcqdFtPo7n8HV/lXaGUrWutWrcqa9lIfJnU1YclGnqx8BFG+ThOV?=
 =?us-ascii?Q?4cH1VPbmI4E+CVM3XmYkfKBH1JiPfMOjzio62N9+2xtz7UPgQlMNXevkzpTa?=
 =?us-ascii?Q?zm5i5ysc3cCoJr0CyOdQdguISfBAw0vllf5DsRRU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ae19ae-2e37-4b6d-711e-08ddd8e892c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 15:05:56.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TChpWw5zh3Q/Kq6qRIjlphvim9L1tHwX4vC64ycKSFM9i+AJXbOQwfMZdcI5m5J6r60vt8heGrRzlf8+wrfUkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7453

On Sun, Aug 10, 2025 at 04:30:28AM +0300, Laurent Pinchart wrote:
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
>
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
>
> - Update file-to-ctx macro due to removal of fh-to-ctx macro
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 35 ++++++++-----------
>  1 file changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index a34e644b2cb1..df3ccdf767ba 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -644,14 +644,9 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>  	}
>  }
>
> -static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct mxc_jpeg_ctx, fh);
> -}
> -
>  static inline struct mxc_jpeg_ctx *mxc_jpeg_file_to_ctx(struct file *filp)
>  {
> -	return mxc_jpeg_fh_to_ctx(file_to_v4l2_fh(filp));
> +	return container_of(file_to_v4l2_fh(filp), struct mxc_jpeg_ctx, fh);
>  }
>
>  static int enum_fmt(const struct mxc_jpeg_fmt *mxc_formats, int n,
> @@ -1610,7 +1605,7 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
>  				struct v4l2_decoder_cmd *cmd)
>  {
>  	struct v4l2_fh *fh = file_to_v4l2_fh(file);
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	unsigned long flags;
>  	int ret;
>
> @@ -1643,7 +1638,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
>  				struct v4l2_encoder_cmd *cmd)
>  {
>  	struct v4l2_fh *fh = file_to_v4l2_fh(file);
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	unsigned long flags;
>  	int ret;
>
> @@ -2260,7 +2255,7 @@ static int mxc_jpeg_querycap(struct file *file, void *priv,
>  static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, f->type);
>
>  	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE) {
> @@ -2300,7 +2295,7 @@ static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>  static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	u32 type = ctx->mxc_jpeg->mode == MXC_JPEG_DECODE ?  MXC_JPEG_FMT_TYPE_ENC :
>  							     MXC_JPEG_FMT_TYPE_RAW;
>  	int ret;
> @@ -2441,7 +2436,7 @@ static int mxc_jpeg_try_fmt(struct v4l2_format *f,
>  static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
>  				    struct v4l2_format *f)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>  	struct device *dev = jpeg->dev;
>  	struct mxc_jpeg_q_data tmp_q;
> @@ -2460,7 +2455,7 @@ static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
>  static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
>  				    struct v4l2_format *f)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>  	struct device *dev = jpeg->dev;
>  	struct mxc_jpeg_q_data tmp_q;
> @@ -2512,20 +2507,20 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
>  static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
>  				  struct v4l2_format *f)
>  {
> -	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
> +	return mxc_jpeg_s_fmt(mxc_jpeg_file_to_ctx(file), f);
>  }
>
>  static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
>  				  struct v4l2_format *f)
>  {
>  	int ret;
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct vb2_queue *dst_vq;
>  	struct mxc_jpeg_q_data *q_data_cap;
>  	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  	struct v4l2_format fc;
>
> -	ret = mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
> +	ret = mxc_jpeg_s_fmt(ctx, f);
>  	if (ret)
>  		return ret;
>
> @@ -2554,7 +2549,7 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
>  static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
>  			      struct v4l2_format *f)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>  	struct device *dev = jpeg->dev;
>  	struct v4l2_pix_format_mplane   *pix_mp = &f->fmt.pix_mp;
> @@ -2592,7 +2587,7 @@ static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
>
>  static int mxc_jpeg_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_q_data *q_data_cap;
>
>  	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE && s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> @@ -2621,7 +2616,7 @@ static int mxc_jpeg_dec_g_selection(struct file *file, void *fh, struct v4l2_sel
>
>  static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_q_data *q_data_out;
>
>  	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -2649,7 +2644,7 @@ static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_sel
>
>  static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>
>  	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE)
>  		return mxc_jpeg_dec_g_selection(file, fh, s);
> @@ -2659,7 +2654,7 @@ static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selecti
>
>  static int mxc_jpeg_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  {
> -	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
> +	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
>  	struct mxc_jpeg_q_data *q_data_out;
>
>  	if (ctx->mxc_jpeg->mode != MXC_JPEG_ENCODE)
> --
> Regards,
>
> Laurent Pinchart
>

