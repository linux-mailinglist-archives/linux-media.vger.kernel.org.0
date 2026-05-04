Return-Path: <linux-media+bounces-60317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEWWG+jH+GlQ0gIAu9opvQ
	(envelope-from <linux-media+bounces-60317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:23:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B64C14E8
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 661263007A60
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 16:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAD43E3C45;
	Mon,  4 May 2026 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e1CN3pxe"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510CD3E1D10;
	Mon,  4 May 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911772; cv=fail; b=eNIftLAml4PrrGmJwukmGaga7xAuxCjtjQ0YiEkSMNux1+ujt8Q7sToMr+b+DJ/fUHJy2+6R6n4pvUxzheu3HA7TUwlT6mqRL+Sow8yF1vXUYwNn/zecvyeIcL6vzLllM4hDCb68aQNj/3t+2dtRsD9/JtV11TaVMLPCGdFiIcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911772; c=relaxed/simple;
	bh=Pneo8A2VoMdtGBa4RmbEOUXhj7LGHoPBolpP8xkX4zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a5APDohniSlgpZdbl4JrqO2XeFUuvtbQxuxJ+rgfxTpkCCoJeVq8voogb31Kw16ynS0ys8q4iRr0oflyFehJN5VTOhqaaKtrSawRVJMBTBTvp7MVnzc1GEMgVvvJVmbIN2P1dF7yntpt85WMF5OTFl1BnM1HULcMLGUQeCdZEpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e1CN3pxe; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLlg8EMCJkITN1THRZoIbpJ74vqxifcJr18Ly+q/JM6apwx+8uGeOXxAlq/azu1AyJTwjQRNZ8+nLWOw5ONGdHr/ZXByUXQ1p19v47PC73VF/yciuav42taiBhBng6oQFF/VEt6deDRupQAcuC4d2ok7axlSJKCtkEh7tFucxw3fJYlyoJdVLkJqTJclcgH5hEJquyAf4n7VXGiVB/eKxAhcfjij6Fwpx2hb8jNT8Lw/c/TSuC//YlX8zDG4bSrYYf5uVVDSUE+kWBXjYB9JaUeCD/W0MCJuJG0bZ9PCX2tfGi7cv68Y/DU7dnsWD9i7sVEoUhs5qY6EPFiqDBT/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0Adqd/alGRHTMfCfP/jhy7JGtX4Uz81j0BSxJh1JVQ=;
 b=oEG+gHUZ41hiN7UVtip58WxcI5oGD3Wwtmd6vE7VNbhKKfcjG8xi736bKti9QZxd+tSQKA9TXQN7mThoNBRh+qqgPZVkboJnaQy7kZORLx6cElzqHp5Ye3u0EA1ihpAwIqT9wWpDlJ2PiHTNqQ1RLfZNr++xBX5Si6iFObJVp+jnc+TP59CWI+fSkhCaEb037dzmuwhVQHxPwqfqdYlGfKeVamnLeMpgkRRa4M1esfV+gKMkKr8Bi6Kir3Tvvyon9i4ry582QsmhGiERomekeparqAgardnVs74TOsCLwQTT81pBWBj2JHSd+GaklgQ4rAkMvjPT7usvwm6F2aZzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0Adqd/alGRHTMfCfP/jhy7JGtX4Uz81j0BSxJh1JVQ=;
 b=e1CN3pxetv8LHrCiqlO9neOkWhS6UVDFNKBaNOtCOhMs1O9WDWYuSiETFBinGLWqFfiw/fmqymhxBIy8kT3nDfErKWq2437FjIrFpgPUhIJz3ol3gDIGpOWAjT0QM8btNPJUPNC4PTC1qvTX+a6+FWR5sEEEsl9zPcX8GjeHnVJUgn4VgAW6a5BvmvQECg9we4Dgz2Lgew7vj0JqCNkNAcC+j4oyVms4GqBzZdv7faip7ipvO4cEwLrbkIVUkYOfJhwiv9gO2U8E/8d3LtRSJLAOWWFXjlLK4qOBPthX5LzXfRpdVw4rwxH4DomTt9j37IlpyqtCG6miiQyFtOAz6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB9052.eurprd04.prod.outlook.com (2603:10a6:10:2e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:22:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:22:46 +0000
Date: Mon, 4 May 2026 12:22:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
	s.riedmueller@phytec.de, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] media: imx8-isi: add missing v4l2_subdev_cleanup()
 in crossbar and pipe
Message-ID: <afjH0HcMoklVjUkt@lizhi-Precision-Tower-5810>
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
 <20260424231926.406079-3-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424231926.406079-3-xiaolei.wang@windriver.com>
X-ClientProxiedBy: SA0PR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:806:d2::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f6d7a8-ddd3-4e85-b9c4-08dea9f960a5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 FeSFEI9cse3cblbaO/IYyLCr7eMCH5wn+JsOu01iyw5+Jk45Q9Gbl/c5rz8pP3/zXMcZ9bcNY/FoaIsWC4OdKxBZTpvST0G2iXxC8B14QjanSAMt5qY488KYXVVeEHAIIqOXHNNtun9cLkI4UMt1tlSEmezXO9dGG5wDlMwTzAz2VB3EGLn9rkczpF7LcPZ5rtGfE2jFydC0EvOxocco3vFfQyY9AaxPE0aYXK5KNnmGaGYxkmUX+MYTKMx3uULxIRhn5cmVSfjNjOWO9gr7afwYeyLvRIx2dNNNZdGLrc1eiVhUyuuzzxdyv1Mti32B+fh5PAz1rqDlhtNabxuXd2PYrKT2aZUU+pLn1pxkak3uu4u78iMulna/8JpsyK0N4F82UTAE6KG+bCn5o1GalZR3p78bPG3bd6kC+zeA/AbUGH51sFldICApHZGUqABezq5NAjd45hxWkJIYDsj1WMmOjXcfdVoEyOcA6u48HVS3zmGnLfGEWom71DYZkymaxDokdZZawOYie3wCgTUV6QZkaBJIyYzar0RSMnpQECkkuLyIFcLrWUielVOg9d28APd4EitNRmQCjo/0hAgEFTLz29W7e9MpPg8fquyIH/fjP1JmLeGpAsfnKPqcdP3iYDLkGZKz77Z/cP/IQx4uu9sQnkq38S7V+kRZsceQxb161KaXqTVt6L6cr9jOB2DDjQu1l2hepve4AMQxMQgRrBc53AoGOJQQJpNS5OwSLUd0cLsfAh5JTwnJBHuPuD+X
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nLVld0Lq40KITI93e7ZFUxXG808j2biYhLcRLlHmzWjkmYiV0oMz0MhHnvyO?=
 =?us-ascii?Q?2SgjLQ5KSbyXEfcjZXra4GBtsVeeZa2Tr/ZZ4IFnm2KxFaxAz45w25I6c+kd?=
 =?us-ascii?Q?0fFCvIoNquHHicQFcheuuTDtX3UYziABGGC2E4c/AzB3QqjzUv/xx+Pba/9u?=
 =?us-ascii?Q?0Igg6k2cURwZCaY/lH74W88lhLaH9tBAKkSN5hRNwlbBmIE6AEbyiZ370ydE?=
 =?us-ascii?Q?xwOzGEGXFWtaMXUoYaNzhdLlr+XQzjKtHVOrATBRLGukB1jVIK1lk6Hfx3MP?=
 =?us-ascii?Q?ZbZjz3fcQNU5xrHFK7/hGwC7XJlNtA+YlCBfzEEEWvUbpL2wbId7gMGWB9JV?=
 =?us-ascii?Q?KjY2N7yy8h3/aJcwjuztVlMY7R9xtZPp99PB9XnVtXUMXknOo6Hcm9gu2MvD?=
 =?us-ascii?Q?Y6/Rj2e8b6vW+aGnlY4zQ2iXTuqPPfPWQutJ99br6geOJJMz3LI1MPwcAafi?=
 =?us-ascii?Q?fpd37DvVAS1p3GwEiYJI2wzRhGoDmSjtNy5X0x0LQZtsUGhIhJtJ4VuOzXHd?=
 =?us-ascii?Q?9sR7Q2l0WcNzlROywzsEo9Q7Wd7qxdIYu6oNJ3Qbxrq98B8pVOxPnhng5tZZ?=
 =?us-ascii?Q?9pS8gizcrnOI4FoS1sA8MfaPI8f5OiJEpxMOw2Eze6b3QOIRFKQkpY8L4kA7?=
 =?us-ascii?Q?gMpV/J5SMeeYaOXOignPJdeadTp8guvPaw0g7rP9QxMDf4vu6rYNKyxDwmI0?=
 =?us-ascii?Q?lBZwboNtffVjxoMcIUbavKx4A8ZEprTnc5jP4cww6jf4JAdiBJxrT0iqlILF?=
 =?us-ascii?Q?unEsv8sxEC1AJtJB4etKRMGayYC4QlnYgRIZH2/Bx0zu5bpiL7L4tr9rv55g?=
 =?us-ascii?Q?6CIkKg9KFrGDvizCocRbFuwKJtXopAFoQC1aPkFxfXxe7iHC0F6Sgg09Y4lQ?=
 =?us-ascii?Q?iGdRrm6AiBP5iG+7zw8PWrs5QvT6GlBJE8OKJk5bfhjyARjjFd6Ot64ACYBt?=
 =?us-ascii?Q?ZDOE0HsvlmpwFN8+tzyzt9LC6+Q6l7Wp9jMv7GZb3hof/6xTyI0mkfGudv51?=
 =?us-ascii?Q?WnDs19v6pFnIbK0z6AnK0cYE+mbi5yQM2G19ekNxcuHdBTDaMZEtYIYQ2w93?=
 =?us-ascii?Q?TeDrMLao+w1v8QGZxvxlu5HTqdj4RrENjjBCc7nfr8Ua2ABEZlp+ZEGcvgU/?=
 =?us-ascii?Q?WulR7dINO+ErbkSqER9bYpgkwihjRzvJOy2nykiaPWqma2m3C8zZ6cejD7LR?=
 =?us-ascii?Q?esZAhaouHrXXx7dCEyJsJch+8xMIH3yaVsRWogrs5zeVjbEVeNC25x1CpZtT?=
 =?us-ascii?Q?a5Ua8L9skogEGlppHL5Ojj/zHqDm9I8t0C830ZmlceIj1OnR24IfEYJ4aGHW?=
 =?us-ascii?Q?eGGOZu8wL/jGAanQNFdPx2ExKjDcA8juXwAzrjCGoSmb2KJBCBiJ+xIzTdy+?=
 =?us-ascii?Q?Yh7qWocEimvNGICDAa+IZSZcBYLTbJE56st7tbYfk7M2eCX4Ke9ns/SgjZNa?=
 =?us-ascii?Q?Cpp3P+eJ0K1BrlKH5TLZbt2sCg+eO/s4yd29XqhpjXVZ6NyDr2SBzRODykiF?=
 =?us-ascii?Q?uAPGjR6j+bpRPCpfHTMyno8vh0qlGvjxcC5JjEHbmBHzRLvDucF+io1gsaJf?=
 =?us-ascii?Q?lfH3bz2TMc1lOsSTRgZYiXR+KKS+mCizjVU3MN+aoQnz0h8aoKNR57+X8ugI?=
 =?us-ascii?Q?JzEsYOAQIZZqffNln5iKYX1a4cAglxoVXrQ+bt1dLCib8xvou3M31k5eNQRK?=
 =?us-ascii?Q?U7mQecXTSBYFj7XB2ORbg6C6fitirWqtQzFeH5Vuinhe/Zs5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f6d7a8-ddd3-4e85-b9c4-08dea9f960a5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:22:46.8337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+svPH6SseGVI41Euky6Jy/95y/QTdHjU+1fqSQUKQ/O9i2zypduRNYp58Sylwtxbfj+WrlyO4gFmr0eyBYnVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9052
X-Rspamd-Queue-Id: 7B6B64C14E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60317-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,windriver.com:email]

On Sat, Apr 25, 2026 at 07:19:25AM +0800, Xiaolei Wang wrote:
> Both mxc_isi_crossbar_init() and mxc_isi_pipe_init() call
> v4l2_subdev_init_finalize() which allocates the subdev active state,
> but neither mxc_isi_crossbar_cleanup() nor mxc_isi_pipe_cleanup()
> calls v4l2_subdev_cleanup() to free it.
>
> This causes a memory leak on every rmmod, reported by kmemleak:
>
>   unreferenced object 0xffff0000d06fc800 (size 192):
>     comm "(udev-worker)", pid 254, jiffies 4294913455
>     backtrace (crc 36eeae58):
>       kmemleak_alloc+0x34/0x40
>       __kvmalloc_node_noprof+0x5f8/0x7d8
>       __v4l2_subdev_state_alloc+0x1fc/0x30c
>       __v4l2_subdev_init_finalize+0x178/0x368
>
> Add the missing v4l2_subdev_cleanup() calls before media_entity_cleanup()
> in both crossbar and pipe cleanup paths.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..c580c831972e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -491,6 +491,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
>  {
> +	v4l2_subdev_cleanup(&xbar->sd);
>  	media_entity_cleanup(&xbar->sd.entity);
>  	kfree(xbar->pads);
>  	kfree(xbar->inputs);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..cb50af2270f6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -819,6 +819,7 @@ void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
>  {
>  	struct v4l2_subdev *sd = &pipe->sd;
>
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&pipe->lock);
>  }
> --
> 2.43.0
>

