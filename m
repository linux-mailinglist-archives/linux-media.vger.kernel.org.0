Return-Path: <linux-media+bounces-43350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E950BA9F52
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 18:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34EDD16CBD0
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 16:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DBE30BB88;
	Mon, 29 Sep 2025 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QKXq8/Wn"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7619F40A;
	Mon, 29 Sep 2025 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162151; cv=fail; b=Jdr4oEF/vYCwePFdyJGNMi7JpBhU8cI0Je2XIaDnfmY84qrprotVfjbKIbssUQhCMq7glLoK7jmA9bqUtlNQzw0Qnh5b30uUWJsRSd5c7y5ZyopvfdB1YlYLC9VsqaqHa2QeW87ON2ltAPBpUkKNzvQaPsjo0cliDCXVn+HVZa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162151; c=relaxed/simple;
	bh=F3nrHvkoss3AJ4/eTQplGtTtNRm6Df2fXx0OXXrnKfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fTm8nlmTIfKZhwC67E5QqoxVfXruR/bclNT0h3TaEjz0+nIQxi5t8lN+f/EJ+xSgTPjk2NsDevb+3Nzzo2MxjrXqAnuyrbcWI0wvOoUoYRM/06dOU8f7KYRxvYkI22P3Lv77UAkKAj1LVzSze5yTHObNiAzKluPgJwuEL+KsBgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QKXq8/Wn; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM7dMfreRBU/YaX48Pf3FK3JelVXcX6qG+P65KKs4eCD/vvxDIbE47YA5P3jdIgKAGioLh9CeuI6qlEwMpy3RSIO/vEHg8/wdT4D3Q2m6UNMMGw48bHnGXkOaxs12/g5IxumH1Q8TVTdF6cvBpQSnqMdDm55+TuJVT2sgx4sNCxC+bEgQ0Lkc7c5oZ9L+CMYxox2bfVa57TDRhlQnAlMOJ50phcZXhnE2KK50b98MhMsvdVsn/o2v0tGocqx3tcuUWqcf0eGPg0016+Uekqdg3kdJwXAgoLfZd4FfzbtUMPoS8FslKNpIk/eSZx5n+5f05BurwslTi9oY4XdfEMIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMJZzTWA/SgClv/ILUYyDwlOR3k1TOlOIdNnab+VcbM=;
 b=GQZio6wSV7ZAlchYqroxHOCUlwfM49yF4EXZTDaHUUlgLN9OLssXbJBDcyBOB4jbNRrna8Z6LzYech6/4LFj7DMyCvPDh7QQLqOx/nCDd4SR+TohVACd/9VCLQfZnW1RPDwMRhV49ijNCX8KlwTcyMYuQsrvizmS866ASNaovyb7U/jFY+k+E4CS0kbwt/a1Umyz6rz9rV4peLGpSMKTMEg8x89sWp1wC2D6X+bETyjaDxTWQ1oGMbU2e5rtnVy5ZNdiPQ5LS0WN22e4mZ4J/gE0UxtSvm/xNFFelvMFFJqQp6INrXlr1HdhR3HT3eR95k2V1UWvIRmVBtFoxNTCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMJZzTWA/SgClv/ILUYyDwlOR3k1TOlOIdNnab+VcbM=;
 b=QKXq8/WnkAeJwa+zIFRKZr7ISDhSDOg2FdIR9XGgCAUPpcrY942uoIFwPaMEwzbBmfLjgcPhTx4yo5sYRWnPeRbC/vxjlNFr8Hy5O8gyLnXoD1x/Rrc52q4U6pJAjA3OEwX6NgjQebo4RF2z8qtSBn/zo/tXeI4VfZbDRRz4Y+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10245.jpnprd01.prod.outlook.com (2603:1096:400:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 16:09:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 16:09:00 +0000
Date: Mon, 29 Sep 2025 18:08:46 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: rework rzg2l_cru_fill_hw_slot()
Message-ID: <aNqu5LXUcQjx4H6w@tom-desktop>
References: <20250918-rzg2l-cru-v1-1-fe110fdb91e5@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-rzg2l-cru-v1-1-fe110fdb91e5@ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10245:EE_
X-MS-Office365-Filtering-Correlation-Id: dcac3f6b-4bf6-4be8-c8ca-08ddff72805e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzVPGY/eD07ZELXhGnsPFjLad53vsrChlbgdZs1nswGHBKG4TqcUJFnsvomv?=
 =?us-ascii?Q?9l9MqdVj1xazrOWs5pncaiB9SIJlt+9APofU+YrufL1uBU117uEtv6hXNEfY?=
 =?us-ascii?Q?hm8O/q/JMRn0M0vsZ6e3pMgQwhn23XAn87NTXRJeqvlBTD7aptkhFAlstcG3?=
 =?us-ascii?Q?anspwco3K5Vd3tE8eZd/YuJG4zh1UY9knJAfy7B0RogwajRi/f8Crhc51Dn5?=
 =?us-ascii?Q?w9A/+maRXq01j2Cq0dvELFIkUFmVZiPKc6izeB3yYF0uhQfwQxWnIKvi3pW2?=
 =?us-ascii?Q?h7dYd/Rqgf6fBYdIyRBu54CgvqdlNhEJumb9ILWvCvAMsM/pgUfcvVYgLcny?=
 =?us-ascii?Q?a0A5VVDhyluEOjkUVLJYgnfnmqr58gzJx4SSDLGP1iCRxSuS2orVTxaN6RJi?=
 =?us-ascii?Q?FqHzvY4yNI9Vk8t9dvbOskYrx10+tw+Qm+H2bXuPyGKujTMRFHGJ8Gi2kxAD?=
 =?us-ascii?Q?FCbOgTCSJstPnErwtm5ISX1tuAMAW89U1B+vMWb6gPxBSFnV+UwxL/73Qbe+?=
 =?us-ascii?Q?wQQqnWnGmB4lKBRx+xJLMs68ObhadUqwJLFwNicpyJy8bv5//pysrqm4pA5S?=
 =?us-ascii?Q?2+qNgRtCnpfzHRqu/65z/Hy6kM0RE2LP/IWF7Z2hcyF/YfA7GaD4XVjG4rar?=
 =?us-ascii?Q?K9KfsP+yNd5B3b8i2eeh7Pdq6cGxVLQxTM6SvM6VgBAuURyYGibnYYGBBRMg?=
 =?us-ascii?Q?M/866t4R3uBNiZILq0pkg4/LwqMUtj18MDNa5BnYCOtRMOuRp/US4JW2fxqI?=
 =?us-ascii?Q?HkaH8QG/h8BRixFiIfyUcQtfLCcBoHHCiTs+W0n5scS/ADkdzLwhXlFRf4bk?=
 =?us-ascii?Q?nLehNGoaQs20F9hGc+LRcCbFslM4YUmQJ41K5XVbyDGtLEjCd/IVN2lNRJzm?=
 =?us-ascii?Q?m6TMI8WsR3Va38TO+fAaYMUoOaugT/nv8NySGuAXVkk08Gcm7HFdu+aalV/x?=
 =?us-ascii?Q?1CdItYqp/pfBLBoklqMRNuX2vfIZYicbsJ/a4fzGjcOysHfzYG46UdXIJyzb?=
 =?us-ascii?Q?qOn6L/UHjpvPslkhhKgeXmHKHU1DqaQwWkrkZmpffh8x34KYe+mm8+hge0Tc?=
 =?us-ascii?Q?Nl2rPeMM6/hxXMVaDXx7MxRKN3mCvkvUbzAFshtv9y/rhgnCYnXwtqjrmUiQ?=
 =?us-ascii?Q?roREkUM5unhB/D0giKzXEUdzYMBPKPZ/bSOD6UdDDPqSLxDkWItGM/4JWiqK?=
 =?us-ascii?Q?2lJMxFIPXeBP810iZWbVhEL7uu/hnXj92bNbWEOU55isuRz29BF1vA2WSEru?=
 =?us-ascii?Q?0ZbnrzZ1difZuDUxBseoTWiwczcvEnBgMXr72N/QpcAOANnKI+LEbYnIqPE+?=
 =?us-ascii?Q?Ux7WxuGy3NuORU/Qx8fPaDg4PcW3FHebbnDgixGIdEpNky/i8aAVNFbTVEhn?=
 =?us-ascii?Q?Pmvdol2iYoryH3cRcJ9V48YQmYo080bhNg4DiTaeyNwIQEyVUHcdTGRSTNHB?=
 =?us-ascii?Q?ITIeK1gjpE2aLlYRvbixbpyY7L1/ZbLleeIdugKcZC0G7l7+0Mc8E6j0BZOR?=
 =?us-ascii?Q?NUYTiA7w7VfOk4y1a5m6khptU/35H2Gs+z+a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gOBH3PfdevzIYpFysrmbKpNubKzJ2RZNPyNez6nZBMgYwmlNZlYkCSA5fDk1?=
 =?us-ascii?Q?PlnR+y7YbKZerGESMR0UnfQotd1YprbG1u7Ut73ewCDQW0vmVM6oE8MRyKIZ?=
 =?us-ascii?Q?2BZCtW8GsBalkapxhOJ3eMm+c3onpNWSN/G33hGTwu3AxEr+w7g2KSBOMfam?=
 =?us-ascii?Q?Vhw6t+PTXpEhp3+4uRGyES4qaAuaUINu/r7tB1E3yX+o+rIff6j9n4NNiQxk?=
 =?us-ascii?Q?ST1nnm3x/g43bys/Xvm19ypz2ak4SVSlHufcG2LBpGsRPi1eyIUW7rfJu5we?=
 =?us-ascii?Q?l9C0ZtBqDBgrW3LUlMMqz5L/ClRMAvLkUIfiNDsspa5q3CAHwA1XkZw1LMtV?=
 =?us-ascii?Q?qXFycA3qk6lCrMvPNA0yEkcvhIGv2dAg59X62ManYcBoFOm5T9Yd/o+Vz6cP?=
 =?us-ascii?Q?uVcS/9dHKCZwAVbNAuiUE1cDhBSR6D1UBx4Mc5HMDG9xYT2KvpLHyPbsxSAd?=
 =?us-ascii?Q?O3ozYbUpYYgCCC1Dkrj/0DBgFOFrN5O6TOFbyhpaU1CJbrt0lrYXq9Mgb7SO?=
 =?us-ascii?Q?J9rGaytOVHc5SLndmb0V0ZrhwSin3eebFAf0VUaqtMDP33y2u8QRid2ptkjK?=
 =?us-ascii?Q?8jOveNKqdXEgligS6zlBXkbxssL5V/DR8kPS7dBfreS9X3A9IifTPA3sI6zy?=
 =?us-ascii?Q?R3ah1d7J+0KvsAurLCYoeRkdoVzm7LAFWTzlQWaQxW1LfAqBO3x2MZhbdEL1?=
 =?us-ascii?Q?gdhoud9Id8vRBDStiyWZITjnNrvTwGWWSl/7TK7qpXt7OfTFlHSrP1I2Xr6g?=
 =?us-ascii?Q?5BFkP1w905Tr1OKm7yXoLH7vbRXyugc9IM5x/XTAnFcpph9uvSpCLqgolbCt?=
 =?us-ascii?Q?K4AH9yXFzZEN9NdFOfIR6DhKY7dmdK7V0herZsQaBT8djHLNJMjl/CcPRw61?=
 =?us-ascii?Q?qgQwesKGttOtbsWvGlu3pQK0/VuHl3s7wbNfA8nC+vtxwJK+6zL8v8wXtbx7?=
 =?us-ascii?Q?UtvsSuvCnJuzzOfvOWoiRmyIK3I5HlGS76nRupZG8SL5e2Ei8s9D291GSiYc?=
 =?us-ascii?Q?ha3eFzcYWoeql6tBmGDq4dnC1hmeuI8ry/71wh3eOhubwTENFX5RUt05JmMs?=
 =?us-ascii?Q?mpwNuKQSBHOa0LLZ+xSBXpYGs2qKNT84bDB1921bkI0AA2SaBaWniUC9BZnk?=
 =?us-ascii?Q?diVSq/OuFKdjZQzmUozPwZB14wxCu0i1VGXCRsfozN9vHuKRScO3JALQRMV4?=
 =?us-ascii?Q?r3CJQQ+AFPQ1gtilGXCX76rIPD7xM/ggUg/f6OM0TxTq5ZoVrqetwUri7hLa?=
 =?us-ascii?Q?XQ1uQ/qpwmDKsDr55DMDuwRnoy5OKzCGpEIyXL+aybvfw5Cx2LAi5uwvcF4N?=
 =?us-ascii?Q?+5gUeD53/QotaMwlqB0/yHK4rFYCdeYGgDUx6xOxuHRu/x2rQSsKCIck8Nc/?=
 =?us-ascii?Q?GnGKnPoEwT+l7bDF5NzFiCcp6ntBQTQ0j6alYGi5JJFaFE2/ln7iUZNyIs8A?=
 =?us-ascii?Q?x7kXjH2hxYZ/eXtVWXrZWTovXDZDV9eQpHhYKEETtUCHKyFySDKGnKWvClIg?=
 =?us-ascii?Q?ggtJbPuzONuWeDIe/fVDI2bjSJqhEV8fnxrQXmgCVbycXH6BCt5Z9EqcocxJ?=
 =?us-ascii?Q?7E/OCBqVZ9db0zbfB1qZstx5Mf1b+U4sjcYMmRDgb1kU0gzix9AV0Fi0hhCX?=
 =?us-ascii?Q?dfkF1M71VuEabH02gf32FJg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcac3f6b-4bf6-4be8-c8ca-08ddff72805e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 16:09:00.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nI+jc2+TAihvl729wkL7y6kUZGHpKGiLNwurkGTXbCOQyR6vounxVoqzw9wHnbPY6Ikq39WGysvhtW86bXd6P3kN5xwgIyIKTMTHTxTNQkLypCbZQN3NZtpMyvbEanwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10245

Hi Daniel,
Thank you for your patch!

On Thu, Sep 18, 2025 at 01:08:55PM +0100, Daniel Scally wrote:
> The current implementation of rzg2l_cru_fill_hw_slot() results in the
> artificial loss of frames. At present whenever a frame-complete IRQ
> is received the driver fills the hardware slot that was just written
> to with the address of the next buffer in the driver's queue. If the
> queue is empty, that hardware slot's address is set to the address of
> the scratch buffer to enable the capture loop to keep running. There
> is a minimum of a two-frame delay before that slot will be written to
> however, and in the intervening period userspace may queue more
> buffers which could be used.
> 
> To resolve the issue rework rzg2l_cru_fill_hw_slot() so that it
> iteratively fills all slots from the queue which currently do not
> have a buffer assigned, until the queue is empty. The scratch
> buffer is only resorted to in the event that the queue is empty and
> the next slot that will be written to does not already have a buffer
> assigned.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 63 +++++++++++-----------
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 941badc90ff55c5225644f88de1d70239eb3a247..9ffafb0239a7388104219b2b72eec9051db82078 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -192,45 +192,47 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
>  }
>  
>  /*
> - * Moves a buffer from the queue to the HW slot. If no buffer is
> - * available use the scratch buffer. The scratch buffer is never
> - * returned to userspace, its only function is to enable the capture
> - * loop to keep running.
> + * Move as many buffers as possible from the queue to HW slots. If no buffer is
> + * available and the next slot currently lacks one then use the scratch buffer.
> + * The scratch buffer is never returned to userspace, its only function is to
> + * enable the capture loop to keep running.
>   */
> -static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> +static void rzg2l_cru_fill_hw_slots(struct rzg2l_cru_dev *cru, int slot)
>  {
> -	struct vb2_v4l2_buffer *vbuf;
> +	unsigned int from_slot = slot;
>  	struct rzg2l_cru_buffer *buf;
> +	struct vb2_v4l2_buffer *vbuf;
>  	dma_addr_t phys_addr;
>  
> -	/* A already populated slot shall never be overwritten. */
> -	if (WARN_ON(cru->queue_buf[slot]))
> -		return;
> -
> -	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> +	do {
> +		if (cru->queue_buf[slot]) {
> +			slot = (slot + 1) % cru->num_buf;
> +			continue;
> +		}
>  
> -	if (list_empty(&cru->buf_list)) {
> -		cru->queue_buf[slot] = NULL;
> -		phys_addr = cru->scratch_phys;
> -	} else {
> -		/* Keep track of buffer we give to HW */
> -		buf = list_entry(cru->buf_list.next,
> -				 struct rzg2l_cru_buffer, list);
> -		vbuf = &buf->vb;
> -		list_del_init(to_buf_list(vbuf));
> -		cru->queue_buf[slot] = vbuf;
> -
> -		/* Setup DMA */
> -		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> -	}
> +		if (list_empty(&cru->buf_list)) {
> +			if (slot == from_slot)
> +				phys_addr = cru->scratch_phys;
> +			else
> +				return;
> +		} else {
> +			buf = list_first_entry(&cru->buf_list,
> +					       struct rzg2l_cru_buffer, list);
> +			vbuf = &buf->vb;
> +			list_del_init(&buf->list);
> +			cru->queue_buf[slot] = vbuf;
> +			phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> +		}
>  
> -	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> +		dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> +		rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> +		slot = (slot + 1) % cru->num_buf;
> +	} while (slot != from_slot);
>  }
>  
>  static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  {
>  	const struct rzg2l_cru_info *info = cru->info;
> -	unsigned int slot;
>  	u32 amnaxiattr;
>  
>  	/*
> @@ -239,8 +241,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	 */
>  	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
>  
> -	for (slot = 0; slot < cru->num_buf; slot++)
> -		rzg2l_cru_fill_hw_slot(cru, slot);
> +	rzg2l_cru_fill_hw_slots(cru, 0);
>  
>  	if (info->has_stride) {
>  		u32 stride = cru->format.bytesperline;
> @@ -652,7 +653,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	cru->sequence++;
>  
>  	/* Prepare for next frame */
> -	rzg2l_cru_fill_hw_slot(cru, slot);
> +	rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
>  
>  done:
>  	spin_unlock_irqrestore(&cru->qlock, flags);
> @@ -752,7 +753,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  		cru->sequence++;
>  
>  		/* Prepare for next frame */
> -		rzg2l_cru_fill_hw_slot(cru, slot);
> +		rzg2l_cru_fill_hw_slots(cru, (slot + 1) % cru->num_buf);
>  	}
>  
>  	return IRQ_HANDLED;
> 
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250918-rzg2l-cru-0554a4352a70
> 
> Best regards,
> -- 
> Daniel Scally <dan.scally@ideasonboard.com>

Not reviewed yet, sorry.

But testing on RZ/G3E I'm getting the following:

[  288.873715] rzg2l-cru 16000000.video: Invalid MB address 0xeacc3e00 (out of range)
[  288.884665] rzg2l-cru 16000000.video: Invalid MB address 0xeae57e00 (out of range)
[  288.967963] rzg2l-cru 16000000.video: Invalid MB address 0xe9957e00 (out of range)

Tested using:

media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/1280x960@1/60 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/1280x960]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/1280x960]'

gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! video/x-raw,format=UYVY,width=1280,height=960 !  videoconvert ! queue ! glimagesink sync=false

Let me gently know if I'm missing somenthing.

Thanks & Regards,
Tommaso



> 

