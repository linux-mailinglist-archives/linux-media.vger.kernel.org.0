Return-Path: <linux-media+bounces-57658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOT/FnSgymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B643435E753
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C42E9302199E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D03377558;
	Mon, 30 Mar 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AM6w7sbV"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB7376483;
	Mon, 30 Mar 2026 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886966; cv=fail; b=R5GCgp6XRKdijnsVvxj2wWs5RaySW4WaHwJv6ftzggNDBW90BhT5JgqUxyNNXT9cVVL/UOvmzg22NL50pCF/a4WmGomqeV2cNv2uR6vChVnBlb3HLNugqt0WAEfenJCzhq6HOg0930BHJJsGHrv2Wx+KfhiM7nrcgCG7LMKwjVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886966; c=relaxed/simple;
	bh=cKjmQ7Q3nAGoYJzgWovlEstGQHy3UtFsR7ox/T5rDkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JZxEC/ndzUtVwVd8IPDaY2ZO6Q+JDd8+TCc399AZcnHZKVzvMvLbdw+v+7xWexY+18KtC8K2DNpD3ZlYfHcl8aYl4INuicd01XERlDWuEsFRSpkXO+N0XWgVUy+e6BwkXn7nAb2nR+LY4jnk0K6UR0tUX3S4EoYGiXmzRNg9T5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AM6w7sbV; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mcwlt4r4lvIE5SDwUNO11dLPhMw2aHnSGViY6XlzFSpktfvSy33H/T9D1g/A36hoKBNPehecasgiVUygFiS/nIxWl0XjhjACDYU0MfSWRrgfoLJNvZ1sB60+Iml/JFAcFbxu1Zi15RZRxsOYkNHeCjhE6IPjPKu5ObhMrsq1H041qzE09akXAdrW7cjBEq4kxvmfhVFbA6FjdYWAGdc7+MO+/pil7tJHZZeFEaZZCHRhndAhRp7omWp4qnCPqV9GCXZPbmT0VJg0tkE7+sLoUhb0dkZYhVe7DvDvz+Kg7U3F1zcnhM/n6Kdza0wIft/qhXX4QM6mr3rxJ4sQQKSOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdEPDsxERYnjuaQiMyxdZ/8hQJMGmioafhal8atKAkE=;
 b=wEEXEz2EPYuGFjDSzR4QLY2KdKmPmnvjsJ+1noOw7GVM16JwnO2hNKY+VkoM1Qz8oimGboXJyINGIno3V5Q06VUZCLqM4Hdg9dv4sPVq0ovCXjwiBhnbeKSnlBGLtwfA8W6QH2PUsfE+FSfGFihkfPHwZJs13JRdUcxRTMiEmN2F6+8TF1nvjhxvDCl7/t/nNHvpMvnHw43RgUyLzu+F0oHy08aelsgq9dCbqZt1+SpzEUn0l1Mil5WOCH+3u+4dbxldcDuf2TNTCmZS/LtZwzXp/cGJAo8stIcpbIDqey3rHR3zxpqFePxlHeQ4DOup5WlxafDN1qLIrQRypJ8CkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdEPDsxERYnjuaQiMyxdZ/8hQJMGmioafhal8atKAkE=;
 b=AM6w7sbVotWftRfcMCZZlv3OdJ8clj2TGmpkLp/D24xSOgHMnCOUAGLJyg1UxuM3VcosiqnFZqcPUXbZrArtgaLD5cX6407iKojOBGopbolimh20ZxARGDc7nEuol1NdbWYjZVeIESkTvzpcpC6sE2xKcILbeD6LQkfLuJv2PHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB9840.jpnprd01.prod.outlook.com (2603:1096:400:229::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 16:09:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 16:09:22 +0000
Date: Mon, 30 Mar 2026 18:09:08 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 09/14] media: rzg2l-cru: Split hw locking from buffers
Message-ID: <acqgJP1unNZ5DV1U@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-9-3b7d0430f538@ideasonboard.com>
 <aebf7c60-c478-4952-83ef-d7e9cf98cd1d@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aebf7c60-c478-4952-83ef-d7e9cf98cd1d@ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: adeaa0d1-1942-4aab-f63f-08de8e76b4b4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4xzgaKJOnaBBbFPlvvy/DWhF5IoQXNA6eJqXK9y0AjxlluyW/ki/9ors6tWguD/vZ9y7BfOzmPvK+GnTZ1h82+7Ha1bRtv1/6tC/GLaSF7eGtBdv3kaLjtP8JSM9FCfI+b1jTOP+o66Td7yic4oIQrdpYx4DTKnvtY2GvaHZ74ZzrXMtWA1EFIz+l3LgeJcqrngorQXk1M0qA4LCw1V6T24/uwxp9rI6BX0jxBrwe9qIu/ygdL5aq3QGdX5xu8GiXRfnrQDGwrVIWhJFwvItBzEhKEwFNMJjbX77/s8haHYPTVMMqUtgGNP/V4dk1GGck1mSNFU6rqnC5XSpY0f5hnphSxS8uGVSX/2HnylA9RiGjNFIZb4ildz6TIOj2xmf6LtDrZrreOg9tSEU0A+3gjQ50ymvVm8YBFrepDooca9OBdIF7tJoJwn44kT+ji44BZyAArg7VpweuLyfb6po60Er0VoApfWIu8lQslDb/BwDI37xESoJZ0NBGY5us/fhtd7ot5toKwACVj8UJIrFvbEPBq6tOOOvMyZSO97vEhCXsgtqkC2F7/6Baip7FHa/2S6z1N+E6cnjeiX7qYYTnOYaGIjLfTNtKyBEDvOYnc+nrU/uttTB1mVU7VJ6rnBOlSE6bjLcgGNq0Zo4EJQAgeUV6PAoRbrap5zGTHuPuRTv20zvnaFuljyiCW5dNuN7vpXJv6aGoAOjWhU2vKlH9ZH2so5nLy+RyxQPQ9/VdE7aR0/raZ92dLx1OJ1UrCGXwV1PzA7cL9rrCpHn/1QMkMKbcOl+9e0FuIc4K/kshvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3IIt6uxC/atmq4/NW6h57VtK9UvYJVyFM6AQPrqx6uX8grwYL6WqUpBQ3YeF?=
 =?us-ascii?Q?pNpE5ELRTxsPULja7jSKDgnbUNmj+jZbhqYhIJSOG6zy1X1iWMYmOaOGcN/a?=
 =?us-ascii?Q?F8veqLxLN93wQ1oxyE2eVyJus1i97Lz2r8NVellS3dEKf0zd9GsRXUFfNxi4?=
 =?us-ascii?Q?BAtA0sUIz4pqSP+bs3Im5fxk9GmpM+jfhJipDQbO8uq+FnyiABREbB5ZeG7L?=
 =?us-ascii?Q?8Z/MSHcD11pntzlRFm40iMxLoHM8ZbGtS6kO7hYxYv/uk4ff1Nc4uOwZs8ln?=
 =?us-ascii?Q?V/IqwUJAZ9gHbARLNyei7shrcsCfeklRC1lvLU1/yG13hPSCOwbT2DWCq1yG?=
 =?us-ascii?Q?lr9L/7QkJ3xWlE+GoGgwnzJfALAlWu5mBEIjiKyDb+O5E4rff4PvD5mgMKLs?=
 =?us-ascii?Q?mh0P30+cUPHPkYUUF+alF7A20XwlF2Hjf/8EcCXVdWIjU1z9blMFbLF7RQGz?=
 =?us-ascii?Q?/p/meiH0g1ui0OOmiY9Kuk7FayX6+EooNlhYJp0s891haissLJTSTo0TPk0q?=
 =?us-ascii?Q?fZ0NAJkypw6HTh3u52ZqE1IW9MGagKjxJhI43g/U8C9CcQj0zirg9dr7gSkt?=
 =?us-ascii?Q?x/39Wu+kT0cFsJLAXTjZu6bo4VpbCNuOrPr0EOkFIdA+30EOktCpV+gYoUoX?=
 =?us-ascii?Q?9ls/kyB+saJqEvL+412IG6TgkuimcLbPqeccI/AzEUFODPOKEvSbQZQxu3jA?=
 =?us-ascii?Q?7xoCbpdH02u7METWovDvmfgVTPsyOPcXEcTuLrsYysyj4lT0bhhqNoCAAh0j?=
 =?us-ascii?Q?iC3oef/fTwv7ymg8ykjqHFCPPD9VPSj5v9mtO6J3GszuVgeaQfjBG0/keZXK?=
 =?us-ascii?Q?Xa34vOFOtcwxo8VaTLviO0piNFUgk+RpGZ6o/E3x8UAY593H1Z6OpsG55vZ5?=
 =?us-ascii?Q?lWjOhTWdjBAj9wJz+6hN5EO+WqMF4prc8L/g08xnKHRZPUT3XUW583owL+kB?=
 =?us-ascii?Q?pGMRd9bbmibm8n3WF3MyIz3l9N5E3YEVEo9or6GviclIvMdyEhXvX4fgwhIi?=
 =?us-ascii?Q?iFx4n+1HGK7akjpqHYtilOFLpQxEqJIseNCTLFhS0+/2ouhKKFarb7x8jvQi?=
 =?us-ascii?Q?jd/+VCTqScsickd3fOrxBckbzIznU8P1ALTP7gMBNXtr3sU4KlccudZ8wvv/?=
 =?us-ascii?Q?wFYq+BYXfXFhR+gm/3BdrTq3mD85tb6ZBEOiOJGUiiGbXzMBKzcFj99jugg9?=
 =?us-ascii?Q?FOVvCR0Sv88JYbDBGTGPIQjzlrIH1oRjb/XREdlciHkjtvnOL3zdpVT9Y9c4?=
 =?us-ascii?Q?9AQvaEYsMr6JP8VvnQvNszY3t0NMldDI1qx7JYmbcaChTXuT02sybCLf5Cjm?=
 =?us-ascii?Q?iwWbPnNTgp4QiV3OaB9i0sHFX465T0dzqhIpHdc42C1X3AVW1YEqhk+rFtVv?=
 =?us-ascii?Q?HjF99bsxovsaY5NZHlri2hPS6KhydQULP8xjobgez+CCaEKW/a9nChymjW0E?=
 =?us-ascii?Q?WC81nq+sd2yjnDAhzRBfLh3pFYeOxQ3nkbFmsKvF788410+BNmYA7RYS+Bg7?=
 =?us-ascii?Q?fgNo/6w/vPDsTtpecxeZpcjY8JQobEMNjCVj6DAMWda6vU97iaHti1sdlKWm?=
 =?us-ascii?Q?+YVk5/N22mLlGOKObJ72ldirOdRPY433L2xideyURuHJhbkcE0TFOLfqNvhb?=
 =?us-ascii?Q?+RcSXbd5Tktit0AiZS0ysSN2FeR2nkKU/Vl8g/mMx/tMZh+MEGDppxDWVYaJ?=
 =?us-ascii?Q?AOaLCNCYOnSvv1/QnW5A7se1YHMJMNEmpjnETJZT9GmK7gYMNX2eMAKu1ciH?=
 =?us-ascii?Q?1yPuivXxwe8VCM/LjtVKCdx6tK790b2HiRkeIXYXInJdDCL9T9Wg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adeaa0d1-1942-4aab-f63f-08de8e76b4b4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 16:09:22.3635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkbDfKi+dSJIIT2MjOeQRY28TdJWK5PQ62XZLCeWXaf5d7dDR63Y0mer1n5qNHjPJDLQVFrIYYOpKT+KWPjXerGMnh+TTTTdA1OFJoFGRKHYVh8S6Y+LM8S28p0bGAKG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9840
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57658-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: B643435E753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:19:00PM +0100, Dan Scally wrote:
> Hi Jacopo
> 
> On 27/03/2026 17:10, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > 
> > Split the locking between a spinlock dedicated to protect the hardware
> > slots programming (hw_lock) and one lock (qlock) to protect the queue of
> > buffers submitted by userspace.
> > 
> > Do not rework the locking strategy yet but start simply by splitting the
> > locking in two.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++++++++---------
> >   1 file changed, 19 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index a79b17e146bf..9406a089ec9f 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -112,19 +112,21 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> >   	struct rzg2l_cru_buffer *buf, *node;
> >   	unsigned int i;
> > -	guard(spinlock_irq)(&cru->qlock);
> > -
> > -	for (i = 0; i < cru->num_buf; i++) {
> > -		if (cru->queue_buf[i]) {
> > -			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> > -					state);
> > -			cru->queue_buf[i] = NULL;
> > +	scoped_guard(spinlock_irq, &cru->hw_lock) {
> > +		for (i = 0; i < cru->num_buf; i++) {
> > +			if (cru->queue_buf[i]) {
> > +				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> > +						state);
> > +				cru->queue_buf[i] = NULL;
> > +			}
> >   		}
> >   	}
> > -	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> > -		vb2_buffer_done(&buf->vb.vb2_buf, state);
> > -		list_del(&buf->list);
> > +	scoped_guard(spinlock_irq, &cru->qlock) {
> > +		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> > +			vb2_buffer_done(&buf->vb.vb2_buf, state);
> > +			list_del(&buf->list);
> > +		}
> >   	}
> >   }
> > @@ -198,12 +200,16 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> >   	struct rzg2l_cru_buffer *buf;
> >   	dma_addr_t phys_addr;
> > +	lockdep_assert_held(&cru->hw_lock);
> 
> I think this condition mightn't be true at the point of this commit; as far
> as I can see this function is called without hw_lock being held in
> rzg2l_cru_initialize_axi() until patch 12.

Agree.

Kind Regards,
Tommaso

> 
> > +
> >   	/* A already populated slot shall never be overwritten. */
> >   	if (WARN_ON(cru->queue_buf[slot]))
> >   		return;
> >   	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> > +	guard(spinlock)(&cru->qlock);
> > +
> >   	if (list_empty(&cru->buf_list)) {
> >   		cru->queue_buf[slot] = NULL;
> >   		phys_addr = cru->scratch_phys;
> > @@ -342,7 +348,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> >   	unsigned int retries = 0;
> >   	u32 icnms;
> > -	scoped_guard(spinlock_irq, &cru->qlock) {
> > +	scoped_guard(spinlock_irq, &cru->hw_lock) {
> >   		/* Disable and clear the interrupt */
> >   		cru->info->disable_interrupts(cru);
> >   	}
> > @@ -560,7 +566,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> >   	u32 amnmbs;
> >   	int slot;
> > -	guard(spinlock_irqsave)(&cru->qlock);
> > +	guard(spinlock_irqsave)(&cru->hw_lock);
> >   	irq_status = rzg2l_cru_read(cru, CRUnINTS);
> >   	if (!irq_status)
> > @@ -662,7 +668,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
> >   	u32 irq_status;
> >   	int slot;
> > -	guard(spinlock)(&cru->qlock);
> > +	guard(spinlock)(&cru->hw_lock);
> >   	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> >   	if (!irq_status)
> > 
> 

