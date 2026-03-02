Return-Path: <linux-media+bounces-54104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INlcE2mxpWk8EgAAu9opvQ
	(envelope-from <linux-media+bounces-54104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:48:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A57961DC27C
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E9A83087D20
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 15:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F43411635;
	Mon,  2 Mar 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SAQhESTd"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762C411628;
	Mon,  2 Mar 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466220; cv=fail; b=iA62ngFGbwBUe150J7AAiZWgTHIxb8RC7NmrxS793bDIA4fYwJut4W8C/d/TSBEvEDIwAwvhoNDQpGgxW33KwTvMm3fgfIWsbEhMBTCIcJgeMS8rIhQonCwkzbLOgJL7IBF8+Ak6PspqCxDJPLGeA1UBpQkniDMiJ7S831WV8iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466220; c=relaxed/simple;
	bh=w3I5P63QOC2YV1zJ94RX6yjZGCCjB/2tH+0RsU8WOiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=he4gA6PUPi5W7rg+5ExTtx+7kxefSq2fdHrlsI3o/VYpZxK04+YhfBmjS6D6g1C6T4h3Wtg6oaABUK7FlGuvDwYwd7AaWpoFPYu4CiDbwb89ZiEy7vNnXRbQgN+/BYVLtfK+CpmNUXRETe9Y/V8RWzK+Ecan3aKh3NNCq+4N17Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SAQhESTd; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjZQOB1lWgrcUYwz+B9DwVWEyKccMqPycaShTd0kVceHP8lYWUWj1voVKd4vwJr/bgabEMxk8828CxGBbDj0T4O0AaIvfG1j8bdGFr86cM8ovkr4gcHYXMygvPmDDp0U7OmL6uIBvYx+Ex2IIm+sSRfm+FtUc7LL9Kx4XlKNchTMuYmROg0XTnX1IPUiP35z2XE0gAFVgXQrlOtdb5ZmqBewzLPva4B6NQdIBFF6HQB3rBiXqd4IMC4GgXG/AnsO2IGWZFp561YdvTHfpemHmj5NkkNUOxgthCK5d+dZNx1roe1rlDu+x4O6FY4+vV9bHR1wO9eX83Er8f4qxsqJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSFmvdlhGCeahKa2JjmAOArabeUyFmNJM0CIjqSyYO0=;
 b=A5kBMOm4mc9qC6INKLu+/VYbPP7Pwk1zGcM2p5rCm2zXRIsgYw8hi7+nK0qPHS4pJ3RD7ItvgVvEYQeLcc8bgNSNMueXV7hXV2KyjY01/wuIvxiqh3P2u2to8uu3MqOmPHFyd2RvdH/KW3dSoZreH9STdbK/CEx8/gVYMXvDx74/ocqfwHQNSZBK0EWbPlQbxjsj8zRj/irdcCqpJT+3TCswMDnl+CLdT8ogmyf7xRUajOkEOutMhh7hKOrReIHmVH2R6dJRs1EaQAkMnFv29tz/bpFBhrSBOsbszLSLvdu+6OX/H+5BlIxLE7ckbzxKBNYF3Ko/4DUvGxJBi5ua/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSFmvdlhGCeahKa2JjmAOArabeUyFmNJM0CIjqSyYO0=;
 b=SAQhESTdNc6S+zRuMBFGB3zLL6u90agD1xx/6MZEkQS9izso1DL0jUb58gwNYUepx/nGV3bYarWyJnp6qHELabuiJd+MAcAh/2JMOJ16BmYGYZJUuHiNqFkN5MOV5gSATV3NQc42DxxoOoKD3Dg9TwZaYrd9qmJye8IF46yn4Q8THkeGILZe8zISQBXIeizItC0qiOw7nutGxqWpnfzLQYo5d7UM4jdBitLmMq0a2MUn4ru+CIhpPClwPddKZ/R50FU27WB1CP7LdVgl9oBIY7eIOLzh8XYsgNi8bfioM02QO2H4VwWXMfJUJHKNCCNvs7K7H7tBxWATATQHCo9n7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7846.eurprd04.prod.outlook.com (2603:10a6:20b:2a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 15:43:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:43:34 +0000
Date: Mon, 2 Mar 2026 10:43:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] media: v4l: async: add helper API
 media_async_register_subdev()
Message-ID: <aaWwHlvmvvMQKElk@lizhi-Precision-Tower-5810>
References: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
 <20260226-v4l2_init_register-v2-1-902d7140f9fa@nxp.com>
 <aaWO49Dga6gHgOXS@kekkonen.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWO49Dga6gHgOXS@kekkonen.localdomain>
X-ClientProxiedBy: PH7P221CA0060.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 666be8cc-ac6a-4559-b993-08de787276ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	IddVPdEXeeGB8LZf04zj5umOvbCS0sxaDJkox1ncGR2GZhWKEW7gEVlbVBFP+bozBXleCZHPSZUs4XBrGS2RhODsV5LyqX+vMI4XgjBDhaMyktxX17BR1YlflVevwJMpDubf+vSDrSKLWTxxoDzlZq9D/4UsDKJhup4e/5Jldw2+DteVn/ZLDhHc+RtWvj81z9C2VdozY3mWsFzpj9DrSc1IXESt8VhxNyfyq03ONu+xazKzIl4Ogk+4g503w9sWzzS4ER4lZ0yfNPQBfjIEhfZ9RhAREL/rkYy0HLk4xlQ3FoxJFhfbNYY/hSy6x+P6RAWD5/LyndGzcqbV8t0QjYhM4K8ROaBiBk+N/aB3/TpEFg/8ZbSm+DaG+Y/MoN7wdQCc/oXiUT7j9s94GZVK9ctxSCfHT0T8RIyXX55lTAsfJc98ymKu02FuKBgfu9vjsj27LnHqpNg9zLyEfET284ht8hZJCEaHuJVRmR5UiiWMkRr87TqLSW3bhQisskN9ZKQQGZo3H3IsgUib8NDrk8AxIXLCQ8UnImdZmoAm1daDsWrPRSaBqvmA6ul/xZ5wO9kwZsptAB5KH0j/jGqCj5q1nHnN5M3zqW/fWiiune6HhuE8Gn0f9cP2xMVewr+87R3ExQaraFfhdPr1Hk7Gd0AdKtC69avpIy+hNvcHv2RxztcnXxqHBvcqWbp5wXfuqA78X8Pu0P+8MPM8dvqc3MMncQzIdxGvZHV3cYQC6v1KT12rZf8DtdIHpZjH6wzPndP35XE/Q4e0BEuk0KN78FTrmmer48ra67cFKsoB/K4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wizfi3u6IT+F6oMNHUqzSX/r+w+q11vuwd2uqf+9Ro15LPRZPSBHKq4/EKkT?=
 =?us-ascii?Q?ia9CbcsUKTk9RH4HvI2g7T0uWaklwdyd7cIkocfN8Xag1R+PkwfFdiOrjacP?=
 =?us-ascii?Q?QksKk5ajEMKq9R2sL+c8DgxYIGxD/yLfiFRCBiX+lveYmrCEWt+/aLvoJR59?=
 =?us-ascii?Q?nupElJ7wWnRtd9spNeoXTC6sKdCXlHcqkRK1j7Z8GNbUhxL5fIADEoHBypHC?=
 =?us-ascii?Q?6Hawd5z98dOR1vyMXAo2eSDHa5SWEW8AxtlR/24ikh25PS9Sp4ZRdNTHyNEb?=
 =?us-ascii?Q?e6xFyUzxGfQFF4o3BVA/o/e4hYPQMunvlPSAkXde1zo8TGQA/jwYg0FXowNt?=
 =?us-ascii?Q?uMBypwuk/Bdm+pquhT2ckMyz93Nxqborlw5qVOwt+TjsQkMsLAqVPliugOPZ?=
 =?us-ascii?Q?pya26NVL/3Fjs4JM4OmvuQEKzhWHjg31QFeTDpOXnv2Y4/sjQkajpXUo6oNZ?=
 =?us-ascii?Q?vJtcIBRsAlZuTpXEueH1vIAyMRx6Ucl4ae0pXW25XjhMGZ3SHNg2hXVee2li?=
 =?us-ascii?Q?3MPusohR1sbl6L6ImFzFrWiHNSAbeA/+lgqn1AQ8Sq9vlTQdKJl/dheLMZR6?=
 =?us-ascii?Q?Hb55T3JXivZkOwSwl6NLeuA+xFVOA1PdNA0tUIOlhfZwkZI3rJRF74D8DBaL?=
 =?us-ascii?Q?Lnq5T4hDckmRqFP8gZE+tDZUXEan88EBWpmpmIqKVXPyJVZOi1kk19vYxFeJ?=
 =?us-ascii?Q?XUKa8M6qFS6sY9T5Ipzhq5WrxmlbErxiUS5e9et80vUtsYx1NToRtrhwjf8U?=
 =?us-ascii?Q?BePnZtGhBKTJD3IyfUFQ4DGp3FP+zRPLTHMYVwxGosMy9X8GRxkax1COnU7q?=
 =?us-ascii?Q?1FLPb9j3y0ZogJ+Mph6/IWa0jwwguVuHjtLJdasbbE3r2WMaZy0C6GfAyxyX?=
 =?us-ascii?Q?25r/kxaCnkOJl+CJEG097Z0lMGtwCTWU9jK4Vx1HudmEFZL/Qce1tKr6FlSO?=
 =?us-ascii?Q?UAo+369hU267IsXUofIOPzOeDpjs8GeXysNookmq/Z4UZQ7ajm05kse25mS/?=
 =?us-ascii?Q?pYyi37M2v4xIht0ri2LCCIzer8qsruKhXg6RnDLIZuAVuHdS1Y1mkGlne2tf?=
 =?us-ascii?Q?JwZoMxNzgKmWU7Px9wBRdsSbOtzvTITdmG4qqoIEsg1nEr+j5VpAT2Wq3weU?=
 =?us-ascii?Q?OYVAR+Fnj+rVGJCTCBevPJFIh6WQ2gKnuNABwc3yEUx2z+TEXkJze9Atliep?=
 =?us-ascii?Q?ZM7l8j20gJwRwGTNu9l8wA7FgZmRDHJTngjAnmuNwZbkyxchJzwqejafX3kJ?=
 =?us-ascii?Q?b/J6W2O3028iAAWHneOsQdlwGWazPteZia7FRqdEw9aKsX6ihVhV2XLE3tK7?=
 =?us-ascii?Q?ImERFwjVTIaTGlMRqikPEiY6cppWQn4/dLHASfOS1chk428Z+Atk9XDDdRtP?=
 =?us-ascii?Q?U30/AtdqFVKPO8bh2hX0r6jTymoVHpwwLd3eDFeobSs6ZdhmIeiMrktM2rnb?=
 =?us-ascii?Q?RH/PZ8gJxtq9S7HxR8UaaY6AGiRnzhq6rbdQ8tSKofDJAyJTpdPDR1axbzD5?=
 =?us-ascii?Q?Zb6AXwTOUlcDjOR5JzMPIhLwBWRANbXjlhBqbKcH1v8GDmmi/jeLBAhggb8H?=
 =?us-ascii?Q?FrngiHYPmx4x+H9rvzVhu9/F3JFBi5AULBZ7T8X74PGtSe20XYWw9A1ftXhE?=
 =?us-ascii?Q?fun274JCMxBcKZ/g7E5mccFdxuPpBQSTNfUUYQBHpUO5eqnf1Qe5ljIP7PY6?=
 =?us-ascii?Q?NaN85wBoPDjr3htdOnRyKVOWH1uUQKrrDQtlnPXeGGQemzVC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666be8cc-ac6a-4559-b993-08de787276ae
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:43:34.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzhgDuQPEHjAhRpbYpIEk8MLqrGxVKBj9y4L+LzdmMf9HHu7o3DGSc7h/tG5ynLiKXbt+LXD9Yi5hcWcJrRnQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7846
X-Rspamd-Queue-Id: A57961DC27C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54104-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:21:39PM +0200, Sakari Ailus wrote:
> Hi Frank,
>
> Thanks for the set.
>
> On Thu, Feb 26, 2026 at 05:55:26PM -0500, Frank Li wrote:
> > Add the helper API media_async_register_subdev(), which
> > combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
> > v4l2_async_register_subdev() into a single call.
> >
> > Reduce code duplication and simplify error handling in drivers.
>
> I appreciate your efforts to try to simplify registering a sensor
> sub-device, but I'm not sure this gets far enough to make a notable
> difference: the new function calls two functions typically needed and
> requires the driver to implement a new one for registering a sub-device.

I not sure what's you means. Actually online one
media_async_register_subdev() funciton need be called at driver's probe,
which simple error handler much.  You can refer patch 2/3. (reduce 12 line
codes)

In file, drivers/media/platform/synopsys/dw-mipi-csi2rx.c, about 600 line
codes, only 20-30 line related hardware register access, others is overhead
of subdev driver.

Frank
>
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 33 +++++++++++++++++++++++++++++++++
> >  include/media/v4l2-async.h           | 22 ++++++++++++++++++++++
> >  2 files changed, 55 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 1c08bba9ecb91f46b7479da613d6c1688d4b0b5c..e07173f566fbd8fa332b5e58be288e806b4c0482 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >
> > +#include <media/media-entity.h>
> >  #include <media/v4l2-async.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -881,6 +882,38 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
> >  }
> >  EXPORT_SYMBOL(__v4l2_async_register_subdev);
> >
> > +int __media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
> > +	struct media_pad *pads,
> > +	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
> > +	struct module *module)
> > +{
> > +	int ret;
> > +
> > +	if (!register_subdev)
> > +		return -EINVAL;
> > +
> > +	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = v4l2_subdev_init_finalize(sd);
> > +	if (ret)
> > +		goto err_entity_cleanup;
> > +
> > +	ret = register_subdev(sd, module);
> > +	if (ret)
> > +		goto err_subdev_cleanup;
> > +
> > +	return 0;
> > +
> > +err_subdev_cleanup:
> > +	v4l2_subdev_cleanup(sd);
> > +err_entity_cleanup:
> > +	media_entity_cleanup(&sd->entity);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(__media_pad_init_and_register_subdev);
> > +
> >  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >  {
> >  	struct v4l2_async_connection *asc, *asc_tmp;
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index f26c323e9c963065fd7c19d6d9835df1194bc069..220a302a626732e15452f3efb19b03bdc51e64d5 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -336,6 +336,28 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
> >  int __must_check
> >  v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
> >
> > +struct media_pad;
> > +
> > +int __must_check
> > +__media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
> > +	struct media_pad *pads,
> > +	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
> > +	struct module *module);
> > +
> > +/**
> > + * media_async_register_subdev - Initialize the entity pads and
> > + *				 registers a sub-device to the
> > + *				 asynchronous subdevice framework
> > + * @sd: pointer to &struct v4l2_subdev
> > + * @num_pads: total number of sink and source pads
> > + * @pads: Array of @num_pads pads.
> > + *
> > + * Returns an error on failure, 0 on success.
> > + */
> > +#define media_async_register_subdev(sd, num_pads, pads)			\
> > +	__media_pad_init_and_register_subdev(sd, num_pads, pads,	\
> > +					     __v4l2_async_register_subdev, \
> > +					     THIS_MODULE)
> >  /**
> >   * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
> >   *	subdevice framework
> >
>
> --
> Kind regards,
>
> Sakari Ailus

