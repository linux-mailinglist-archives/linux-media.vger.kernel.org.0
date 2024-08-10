Return-Path: <linux-media+bounces-16078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605594DD02
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 15:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26162825EC
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 13:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D7F158866;
	Sat, 10 Aug 2024 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="eiT44TQ8"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2120.outbound.protection.outlook.com [40.107.96.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A80158551;
	Sat, 10 Aug 2024 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723294848; cv=fail; b=sd9Kvbsk09yDp9jEq+bzOoXSoB2H1W4psjJVGvKZeGd0efMEwgY2q3NihNP/6SymtlRf0R2QN6CEcgaxT0JjpIz+gEiike8vUg02/9bvitmEcKTz3vRiAYnhDF6lPPYLe+8y1nTojlHk5EaFDZKMiolHQ+WUKqJhdX9mag70g2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723294848; c=relaxed/simple;
	bh=aiG3fFUvEhpOvnc89YtbGsCg9FYvfEmjpC3aXZCmfsY=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K6JGQESJewVWOlYpSCv3+y4Dht0Rel0RgI9UnzOhI/ZAR6eJ7yrwMQOw5N8uV/08e/u0h2oFPVpNibDnjn1YbaHJB7PwXk8Wy9aMSfItLF33571dZaGkO2q0Vfp6hvA3yQ9Oni988eW6xuyVGh74hZqtMXDNovl3E+UVB8Y/HSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=eiT44TQ8; arc=fail smtp.client-ip=40.107.96.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaRSIafqYHddJn98umXbdD2U9Pl2ne/tuhFwevoFVdxxvLQ7XEmjBsBhfu0fep1F6ptNEZsgyv/XQrUAm0+9CeOnESHKyiIO75e0RGNh5Fj92LkcSLDx2DqKnnqCu1fpnpf4ILefBNE4RNrBKu++4nQxn7ENJvJJaHqRi2mdMTY83YHESpqOH88mIpj6XjTPi3xhbhVntlXzPjaiItek/eRFxuGWzrY9PDsCVoUSfuMBysolVnTmz26mQBwh4QgnCfWG35/QP9AGmGfHujlMHTLS9f+00T2AvL6VtfyfRWfIn70lUpIt2YPlUCZ+JSYTsy0tmVKEiV3dwl3nnhoTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Oi4oYQnOzlG1npA50Az2S6pQzNYOO829BJQuYECgo=;
 b=j0mPDDHNM7IhaZspt9IxJUwqTITfd+av4Gx//CtTxIgEa/tpiJVs9KLEgs1cX6tO6bnFIg6KSs3cyBK/WEKBS6Cx8oO4KkBUEg4I3MNwKFi8q2DEx/Ia7hJe3W0UHSSf7fTAyHD4VYIc2w8dgiUjvnePo54xaGStl3pR7DjifxqinH0G8PmRzoQcl7vhEBNfnLAs6HdwcLzhPoAc9HOhaLoSzsc4HiJzynhpWHkDi/rg6uy2MoaFT871QMsKAiyzSCjtC0pG7tx0mSvIF9tlf/DcxoTD0U8LeraM7gFac6Bsewbu1jSBfMVO1/i2Db3jseSIbtRVuhhwx13bXVo7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Oi4oYQnOzlG1npA50Az2S6pQzNYOO829BJQuYECgo=;
 b=eiT44TQ8ewk0JazsOvNvoKuOc6uDPSCrJWGIrUclvGelBG7bDgJrItMa3ET0fQrFF6Vth/zGQyxmFmx4BYA2Z3AczJ/f3CupJgSh0JlXj3VvXdQwXB6xuYkJkKBv4bgVn73kUNbgtUkjaB0bzHGsIaAqt+RH3wJBdl7fmc4OB5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by LV3PR08MB9290.namprd08.prod.outlook.com (2603:10b6:408:216::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Sat, 10 Aug
 2024 13:00:44 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%4]) with mapi id 15.20.7849.008; Sat, 10 Aug 2024
 13:00:43 +0000
Date: Sat, 10 Aug 2024 14:00:36 +0100
From: John Keeping <jkeeping@inmusicbrands.com>
To: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] media: rockchip: rga: fix offset lookup
Message-ID: <ZrdkdA-RJOqZNcUT-jkeeping@inmusicbrands.com>
References: <20240806094842.248775-1-jkeeping@inmusicbrands.com>
 <ZrYoT7HmTc7OT2Y4@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrYoT7HmTc7OT2Y4@pengutronix.de>
X-ClientProxiedBy: LO4P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::8) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|LV3PR08MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a27e71-3da8-4918-ebb8-08dcb93c7188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3WB48AvCejzx9lcVjOV8xDa42cuLYdVKcT9tEGr5EE5tZEdnKsTOd6r9e133?=
 =?us-ascii?Q?iwz20CLrkJjKF3asXxLGYLXLz3l1pzWVlYdLJYjkMI+sXu50OnVpCsEj1nIZ?=
 =?us-ascii?Q?k9qhX1aoMfyb8tLD/6AH3HMirSSL59atGZSX1U8aeme2ef58t3CkytGS2mXt?=
 =?us-ascii?Q?eZpekkjaAXriKwL94VPox+R6GHQiGu3MDOMCpfSN+6obmMqSv0obhUIBYY5d?=
 =?us-ascii?Q?wHC0Fif7nsBwmgrMLNzIJyj4xOT/bH+yFbeLoFN7+is85pgCVCGFGsuf5Xl2?=
 =?us-ascii?Q?a0RRTwSgtofGzmIxoruC3c/XLxYnVsGDMPgszU1GPyVDMVh64Td5osrmsEcA?=
 =?us-ascii?Q?2gAoerDPWvczT7d98TouNS1iukIFYrQDXL/2Q78Ivi1E232Jpi1i1q8XoJ2z?=
 =?us-ascii?Q?5u1vJZlqrYUgXfeQelKOPuFqVA5uJbzrQa0dbFCCttdhMvSSMYWDJ9wfnu41?=
 =?us-ascii?Q?7s2aSKHgnDWbO6mPViUL4eisZUyR7AN+wZ0dSCA/RZvuvCDAG7DiyIpASE3I?=
 =?us-ascii?Q?iU+MhX7af8MIMYgA3UPMGoDbZwh5SF0OR6puj/HSmQQrRF9Fzr7Q5lJdZbV4?=
 =?us-ascii?Q?nYFt6pd3K3hTGTPGCBbmQ9ktaVkPNgS0oO04vUNm5uiqJy70VAI6LKINmFuM?=
 =?us-ascii?Q?cZZklVHqJmIHa4Kbn/WHlfgtAxOJzyzy8QHDMl/pfqRZphn0U8NgqGJbM8OT?=
 =?us-ascii?Q?5UFHTrPHPWVnaySYEgmJIJoV1gHHOezqzfeBYpw+gZPOrH6x3ItARBqlJEJZ?=
 =?us-ascii?Q?6qvCc7VMBaL3av8UE8kxi+AEMTkKFBlN5Rnd80nZwsFsKylBnuWQD10OBbQS?=
 =?us-ascii?Q?vPJR/yOpSI0gquk0fuEew5iNMBiDNbObYHksmyIwdj0tccLU3gzsWhfYuYpJ?=
 =?us-ascii?Q?TNLfzcsCn2mh296Z0RvgIqo7sBqdRMdVrm9/LLgH6Nqd0vADXYUhxlG8Setx?=
 =?us-ascii?Q?aX+2p81dDhtDrhAsxQwq2NNQJEyPhjFphHvV7cR4+78SbPKQll8q8bDueKJP?=
 =?us-ascii?Q?g+9H8hEvFNoh1cS0Uk2Dzcwus6gKP7cwHc+0x/Tpgs+L0Cmlz3U/4GnfwpnF?=
 =?us-ascii?Q?JDtm9weUKxMP3rl2TYJvkkmEx+cwimh9ySDnr/OnK7Aq5EBwj52GpI2uGX13?=
 =?us-ascii?Q?EX7Z8TzsW/9gNkMRwRvFGFsIzZhpiDGQ0hwlH+zjeEfdPaFxcLKiuR6hj810?=
 =?us-ascii?Q?sBow1DRH6dyd+G70ZmEIUgR5+0YEGsSY90Kt2pKmC1bS/UT8OpEnm6gfJuzX?=
 =?us-ascii?Q?sCTeWw0m96xqkXoa9hXsrG3PpHa9j3DbW26HIP792YmEhbPZF0IrES8eDiS/?=
 =?us-ascii?Q?BVn0+MNAeWB0ObB94SRJIFmNJrL8ZDq0TjlGCdUyynDpw+WEWeC13mL/jyHb?=
 =?us-ascii?Q?Y8MuJEol0FNn7cz75aPgTnGTLnD3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s7/sW42ncBaenD7VUNfbk75JSSfs+SDufKt41TjLs9javEMnmvzyooekirPc?=
 =?us-ascii?Q?uujEIUO1dCHPXvNj8hDR31zxCpWdSvZJJKOUxSRv8U5PDOt4qtqCkFqBRe46?=
 =?us-ascii?Q?UMEijlGqYNKqtHzVlr1kIMDW4W2SYIkXVbeHbFLP88LQ2yrmvsC56YkStgze?=
 =?us-ascii?Q?WjdZlRS0AYmAZE7/I6xNQqYWVy3m8xyiQocY3bsizwp9UNnV2GqqVGrJWlkk?=
 =?us-ascii?Q?/B7/3pb5Ygtt3b/T1VQkkFY0lMhAaVHR2QNNQNMUP6bFErDVeihgzbFRfpKl?=
 =?us-ascii?Q?N4YSNsE6n7ergYD9QIYmgsGMEytUU5HblbA02EfQv7JWPHd+AeRUglF5Flt8?=
 =?us-ascii?Q?D7jUDOBvlRHzbt41k1fdIml3lduSPZ3UAAiixiCAxVujjetr97eVf6LI2d2L?=
 =?us-ascii?Q?40klmBHoNvcDS3Jh/hNlZ2A9o+tYdVbf7/O3vJebADKRZcyxmJeA7p8v2ouS?=
 =?us-ascii?Q?Yh8rLgCwjfRv4r95jc5Tlc3nXp1OozKw697RBazfR3FGW4U89xIjfVomXL3b?=
 =?us-ascii?Q?ndKHhnVcfxwKUaOiM/aOswPvf3s9YwbHcsq/lxDbGs9tDBKvWpShZGQuv/JA?=
 =?us-ascii?Q?nzneT5bqDin6Y7vkEG2vPTMws4iNUxFsW8+1JG8kc8yTWP91uFdDe+rBPVBf?=
 =?us-ascii?Q?HdPpwTA3W6zCi/SX3SijMNePrRd8t0KJ9BESlx3BwrVRYKWtySMsDtuEdQEe?=
 =?us-ascii?Q?QDWD97j8mWXIUOaBPON3A/WKYI0FoKzO7k2cGSn56U0F3M6dcmXOZ05DFM1H?=
 =?us-ascii?Q?OBYyVWEO0IAuNmvIpXfbs1trTgerhYyXl7LufKYhJD56cOzr2yK7liWtU/81?=
 =?us-ascii?Q?0qB9vBtqIkhac75Uu1tEcZJuad/w+32blx5UjyOCRQ8gQnrZEsbB6SWeNTUK?=
 =?us-ascii?Q?swIVot9dAB89S1gMUoN0HTv2slW4XSmkkqV1f1dtcqCzXftK0PgmYh54wjZJ?=
 =?us-ascii?Q?VXQNRKAuEwkZDzr/A2Es6ymnLoQnVCx0t5ZxrYH/g1T1koc4hX0FZyUv6pUp?=
 =?us-ascii?Q?itDkQKU2M3BGHBJmzD48+P+WHwmpG7xhYr4bnuZ9o7uGF6TFW0iRz7xAOVwb?=
 =?us-ascii?Q?KvxvfGHPQ7iEsOo8VGTc87gJMXgzSn+PXF4xIA5Js0BpKt4F4td1TmzZfLKM?=
 =?us-ascii?Q?VgJhJcJnKA/fCZt1/o3vJ/HgJETF2MVGkLLYAJRbXKaCK2SnzLXThgLuBtVz?=
 =?us-ascii?Q?Ci2gZz84cAo5IH7h7zEziTTugn/4AOXjzZbosbY7O/HGVxwCofADCBKBqQKF?=
 =?us-ascii?Q?+WyZMuwF/l6rynVdd0xMXq9jl6RjY/AGUH7gX3OpTGGNE/VtqJTXbvUV2a03?=
 =?us-ascii?Q?+TaTo40+GByBxbU5IXUDTNf1lQnjFitv1yT3OND2txrYvEIscCvUzcUxb78w?=
 =?us-ascii?Q?iphF2WbNKSlR/C26Puc7t9jblcIQlLzjOkAE4MSkb+TjxG64wEKkFH3YNQjw?=
 =?us-ascii?Q?lB3x/ugETczXQXf5xr9oCCOqB1CA+USohdVhpbCB7T5ugV8t6iQQlUeOm3SU?=
 =?us-ascii?Q?PblwcmQ98usFbngHpF2GQFBOa0HSLwbYygfxvCxaLxDDw2t4D2CzVWx0TAmP?=
 =?us-ascii?Q?8DyL3ony6H9SmOF6tknpkeFyCHgoMJ+86R1aBBtZujtn61MEGuCFsFk8N6OX?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a27e71-3da8-4918-ebb8-08dcb93c7188
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 13:00:43.5234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7D1pLb5Qz8azlPshb6PtIcHA2sgvwoBE9fnE6XAu8vShKohNNNMsadfSxY0lGO8VEZ7p4zyL0rnzC8vXx+iY7nRGz6xv34io29p4oWxg9yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9290

Hi Michael,

On Fri, Aug 09, 2024 at 04:31:43PM +0200, Michael Tretter wrote:
> On Tue, 06 Aug 2024 10:48:41 +0100, John Keeping wrote:
> > The rot_mir_point_matrix is arranged with the rotation values in rows
> > and mirror settings in the columns.  Fix the order of indexing to match
> > this so that the correct values are used.
> 
> The table and indexing is correct. The rows (second index) contain the
> mirror modes and the columns (first index) contain the rotation modes,
> and the table and the indexing are correct. If you read the columns, the
> corner moves clockwise, but if you read the rows, the corner moves in a
> z or s form, indicating that these are the mirror modes.
> 
> It's probably worth documenting, how the table works.
> 
> However, there is a mixup of the arguments between the call to
> rga_lookup_draw_pos() and the use in the function.
> 
> The function definition is
> 
> static struct rga_addr_offset *
> rga_lookup_draw_pos(struct rga_corners_addr_offset * offsets,
>                     u32 rotate_mode, u32 mirr_mode)
> 
> but it is called as
> 
> rga_lookup_draw_pos(&offsets, mir_mode, rot_mode);
> 
> I think, fixing the order of the arguments in the function call is the
> correct fix to your observed bug.

Ah, yes.  I'm not sure how I missed that.

I have confirmed your suggested change works and will send an updated
patch.


Thanks,
John

> > 
> > Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> > ---
> >  drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> > index 11c3d72347572..b7d51ddb10fa4 100644
> > --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> > +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> > @@ -97,7 +97,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
> >  	if (!offsets)
> >  		return NULL;
> >  
> > -	switch (rot_mir_point_matrix[rotate_mode][mirr_mode]) {
> > +	switch (rot_mir_point_matrix[mirr_mode][rotate_mode]) {
> >  	case LT:
> >  		return &offsets->left_top;
> >  	case LB:
> > -- 
> > 2.45.2

