Return-Path: <linux-media+bounces-57638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGv+BkyNymn09gUAu9opvQ
	(envelope-from <linux-media+bounces-57638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:48:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EB35D252
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 631D730B896D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FEA308F3E;
	Mon, 30 Mar 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R8gDMbRx"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E532F6900
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881536; cv=fail; b=Ff+RBvZFwTN/2ZsknMybM+M7whMsoAcz2/oqGMP8oa4BARiSAgg5oqT9b0fDE2BEwdwhK7JXG9VGP91A1FG3XXQ96thK0vvxio4y+vF67dEQ/xPXjcXxYP8j7Rhs+G7FOc/pjVMVXr0HFWECB20wmzH9Oru7zbCtf81Pm/3Bja0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881536; c=relaxed/simple;
	bh=pUXBy/THuitYLf7bglcnLPu2Hj9MFG8cN1xugMzO2OA=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uIqcAxKS4qcZjLrFTbUKCV9R8yIyEUf2c4UbO8NBotd491f1toreaYn4CdDXlNFvOvYU+J1ma58fHo9KUZfVihXyevjCsugYkzN7CXk9OZKf1e59aYjEyDOs4EYZff/kGFLK/TESpSjj1H0c+iC7oJazxCt0TvDyLbg1U0L8HO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R8gDMbRx; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJyuxOgRvew7gS0M8TLiolwosgcboRC8/rPIXQzoq31e8+sIWS5jcvv+HPHzY9mEU4e2ceWFTw2zSnxk3k17FZ5uOZhcggPOL9OrNiDo4lVT7D2ClQl4NW0fYkx2OhyF2GKkrkfIhw4uOYU5sn+uJt1X+Qyg96aqVu0csVs855D10XoufscZYF6ErKNtoMCnnhCJXC6wXVwGEQFBoKmKzrUbU7DQZuRQYAZMHwZsClwW3HTjYM5Y09HToW1qawKi+O9QmGltIoZLxKh99V7TmMQ0rqEKFvjsqIaHbKWfa7rwbAc6IQaOx2VmJRqt4O+PZ0/0p7W7BW9ILuOFNubqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM4C+JzbwHzCU5WlxMyAnCyOnhBDCuJp0A7/Exnjk9g=;
 b=cG4i288R2JEJgQLErnHV3rkGwYOwLMJAnnAKLIK3X9rRUT2W4Zop2A5PoHB9OEd9sbkwDzL5mQj282ZnmZ+iXeHgY8aKo4XqKCpE3F47sdQiG2EkbeuKbB3FKK9XKYFugHNHiTw6oBpo5hU03FRW3hbDacfV81PK0L1f6LEfVaFjgyw5Xg+uNeJwB+IV7ZLnx4h0FinpceqThQ0blBFp80+KHQqGIT48oJeZxdRz/QsTVj1yJvWlygJ75onZFxGeaz7KllrNg8IJZ+JXb/G2XDfPTy1e9ylrilpUJEN6AnGDLU/RzJqRX43qJIDQx/KEpnohdArSTm8HIV82qr5MbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM4C+JzbwHzCU5WlxMyAnCyOnhBDCuJp0A7/Exnjk9g=;
 b=R8gDMbRxQFCotunQpNGe8ijdyC34noGFVZKIudGuu7BDiBoL5SvnHDLjVhKkrB3NXJoqEsoAW+PTSpv8MLVxRIm2V9jiLIZxF7YbbVEybr0LEVZQS6Bbon+LTsknkk8rXsCEXKXGeDDriunFFhXhS1chbSj0Wkgp0lrMnVZAVQc1VZ3G/8/FE4HIqzP67AolUGepkdB3unDT5Xg3C30uFpmYmYgmSOI6C2rramKz/rlrEQ0Q2MGHomk10SaXDg3FhZ9brQzK5EIHczTtF8cGJZOLD+OsG+0di8/g6MC6lYnP8t86VTZwsu6v97RdF6UtPxRUOEFoY0eg36FnalqE7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9587.eurprd04.prod.outlook.com (2603:10a6:10:317::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Mon, 30 Mar
 2026 14:38:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:38:51 +0000
Date: Mon, 30 Mar 2026 10:38:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Message-ID: <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <aXOoc0lvAtPt0fAL@pengutronix.de>
 <aco5Ei1B4vJWKMMj@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aco5Ei1B4vJWKMMj@pengutronix.de>
X-ClientProxiedBy: PH0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9587:EE_
X-MS-Office365-Filtering-Correlation-Id: e3333bbc-ab51-4983-8723-08de8e6a0f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tDQ1Dip3G4fX+ekK0afRZcN20qBq0NLxLuCDcXtQO5Z2FbwEMLVzL0tH16CxilQHiwdb4xk3nYUaGg3pp0SWLvcKLTeS5SHYhlceyBhQ51ruvjNr0nSz6GQQXOx8MRYAYxLX9p65V7IpQpUVZVggkhSKr2OK2tEcbIFkYVhJ8DrbY8ajLRyHwJIEVEklF9bw4VarXbtf8Swb0czAmb512+O9rtZ92OlotK4vUH6DD60UGAXtDl1E9X7m4dA8Hldi+bFsxCMxguAadgc/aw7s55k7X2uMTwvqrcl8g+ADn81jscMCRLRizZtqj0CmyGQ/cYE9fkwiSCBn0L/DQqCSfjm6X6ATM8auimeP06zf7Ue0aWZuYXzmkX64uCDkS2mIeLM9No0oF0YDxqWsEtCQ9Tfk7NZdSBjsz6OQgGwReGK5PVD45L9txKl2SbxgQn0mXyegkpEMRF4Gvvl69nxk4B4lO3mPwIi5qXF7ZRzukCiLh2EIxqhVMgNa1A0O+7jlgkztImHyTeTOEQ0Zw9trSJXiwNzKNCgdLtivtKQ8MHri0paXsjkK9MVBxEOBqZ1jbgRyXIQeQlLIGd2XS663BYzXBgt3AK5osSlUzKVfl3fymd/1l9yarETrZ0AOlzTCWnDKNGKZqWTzeOXL12Jpubo+gFQCxsS34+zQptO8Nt4xHoljGksplJTB8rqbbslTQow9t0B29nQ1OmiGj3K8aI5OnTJRlY7u3DiV8o4j2ogVzBk4FcAKeACg8q0yATHK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HXv1YNO9TsolJJr+qbUxaqZJHYHydOjEOigLmjvE0NvGZUK4zjy7sDwbik4j?=
 =?us-ascii?Q?2J81cIJnz0ehXHkzu5rrLmIw2b82cAV1B3ZevGDF9E2+KHYfzx/nC92ikecb?=
 =?us-ascii?Q?VgjffeXDFN8J3PyrHqSFQv3BLkgBtNj4zuqCELBSCFobw3DKmcRIyTQ6OgC4?=
 =?us-ascii?Q?gSt/BUTuTbhDr2FO9kLkUG6CoTyAwmz6mc/K5/UJ0rD5psLnfQXqyMPxXc+N?=
 =?us-ascii?Q?f9VS9L7E2UZq2XDpijns+DQd7TWlk4g2uWiJNU7WPGzBMQEQzHmne5rOuMND?=
 =?us-ascii?Q?W6lxE6Trx3FJnsuaFESvsd78IQ5+aNbUUDfTc8qsbGEw0GHbajDQGlPFwSXh?=
 =?us-ascii?Q?MyYy4axIWBHI12Rj9WwOH54J4P/jfSLScVFgAouerqQdOcI/PuV9Unz3WRlO?=
 =?us-ascii?Q?QvhVeyaSHr40kPGAzKY70X6a2/Hk+P86J6Mo9YZ8uvzc1OGaUkk8yQ8ENESh?=
 =?us-ascii?Q?K/ewKQ9/8kxSYz59zu/s57Iy+9hAV1/5swxqaYVZA1TtVRSTdoDoBlMX4XPl?=
 =?us-ascii?Q?eFLQvMs2qJcgagtYNNkLaQ8GZVcaoYOo9YYKFs4nZJFygzF1amM/eKIMqp5i?=
 =?us-ascii?Q?xX2bleg6B9o+SWyCh1v71hPfgnXdb7o7ff4EpZtKwDaXYrH0DyQnTciFnpFJ?=
 =?us-ascii?Q?+V9f18Y+qLCN14d1G8MWpPbT89ykcfFPHqUWrxl0eUrpOfyrjBFRncqYr1I1?=
 =?us-ascii?Q?t6w4XAxnZM4tsadJ4yvRKqN/OGQlfsP3HV2+Ynaq4Z2GeZR7lqvgw2in/iyn?=
 =?us-ascii?Q?EM7IvafsvPOMqNZSydGT6nU9eSwfafz0GjOskyYDt1DzcTRczAQ0DrIFHDMx?=
 =?us-ascii?Q?seGv8A/SZ071pVjvaZMDbrOOpAk3cshEPxKNZIyt9wWngQ8Aq3PnDCxcXDc5?=
 =?us-ascii?Q?ZqHv1qvaDBpjQtNmWw2iXGZDs4D+z3fy76UZnfgTG+s2haUKcPuF/tiUUubA?=
 =?us-ascii?Q?wdAag21OzJnQnzazhtlcVJAOQuVl1lLBHUCBzGZWwnjtf2e+R742Ul5oK+kK?=
 =?us-ascii?Q?QgWP85uzvshHTcFTAeoYP6pMD88+nqfiL36VrrT9wvwiieAJ/JJtbsjMyBfJ?=
 =?us-ascii?Q?Ep0JztNEgDnwnBYl0fHmzwiWOYZSfnX/TPuFx8SPqWNw5oyWr4kC0ApmNgHx?=
 =?us-ascii?Q?J6+bAguBFtG5bEGmP2TxL0SGkEC+oka+N0NuT6EU9TUhPCr9exSE0nHbMWHn?=
 =?us-ascii?Q?u+5gtPq0G4rWRu6ceGB9RAU35A0xr7hH1EcDvKxMl2DkSdI91X2wefgbLV4Z?=
 =?us-ascii?Q?/HvpGWnOK7mBHlHqzNTig7mWLoXiSW3FDo4ccYpD7vnGwNVz2ZjTRLkJzIDR?=
 =?us-ascii?Q?P3LK6kZNuWjPGLqRGWwCvsj5EeOcGnpPt29GmpNDXeRu0J7hH23O4rEMqCjN?=
 =?us-ascii?Q?+sefwM8Fzw4zIKgz5g+ekp5bvnz3zGbk8WkKDufo9+pf0Gyi4fM5vbXlXqKa?=
 =?us-ascii?Q?qfiPSAAxLGEMETZemwq0eiLp5Ldm/mH1o66VC1GOyRN5nzgkEsT2/gRDjHOt?=
 =?us-ascii?Q?9Q93B3BsN/MgZilWnIFas0RjQji8qw83kyWw8Px9qX/ejdmhQO5RS0isAxg/?=
 =?us-ascii?Q?f+rXynks+PodznpRLIVSCvEKQXJUr9Mb9SbJn6cKrykp0rcbKleaM3Dlv4Pr?=
 =?us-ascii?Q?Mo0UEH/09yCT6EX/qEzlg+nsHw6QPHrqs5phXcBXIgCB6Xpo5ijtR4zorQNb?=
 =?us-ascii?Q?/o3G944JHlM/P9T6TmDm5CUNeGJPyKOZQOkJbWheSFR/i8YF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3333bbc-ab51-4983-8723-08de8e6a0f8f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:38:51.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qb1WG2CWfvfxn3z6TYV2ew1ZDkDyVPppcsW83ncikYDs/pV/uNpfvho6PxROegs6XAmgUvVvLMhh6/dchG58uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9587
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57638-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:dkim,msgid.link:url]
X-Rspamd-Queue-Id: B77EB35D252
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:49:22AM +0200, Michael Tretter wrote:
> Hi Hans,
>
> On Fri, 23 Jan 2026 17:57:23 +0100, Michael Tretter wrote:
> > On Thu, 18 Dec 2025 10:23:48 +0100, Michael Tretter wrote:
> > > The imx media device currently assumes that there is only a single media
> > > pipeline. However, the media graph has multiple imx capture devices.
> > > These may be started separately on media pipelines if they don't cause
> > > conflicts in the media graph.
> > >
> > > Move the media pipeline from the media device to the capture devices to
> > > properly track and handle multiple media pipelines for the imx-csi.
> > > Refactor the code to start the media pipeline from the driver to help
> > > the reader.
> >
>
> Could you take a look and apply this series for the imx-media driver,
> too? The patches are already reviewed by Frank Li and Philipp Zabel.

Michael Tretter:

Sorry, I will take care imx's stage driver. I already sent pull-request,
which included your other two patches.

Do you have others patches, which need me take care. I am not sure if
there are chance to send 2nd pull request for 7.1.

Frank

>
> Michael
>
> >
> > >
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > > Changes in v2:
> > > - Improve code readability in Patch 2
> > > - Update commit message of Patch 3 as suggested by Frank Li
> > > - Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de
> > >
> > > ---
> > > Michael Tretter (3):
> > >       media: imx-csi: move media_pipeline to video device
> > >       media: imx-csi: explicitly start media pipeline on pad 0
> > >       media: imx-csi: use media_pad_is_streaming helper
> > >
> > >  drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
> > >  drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
> > >  drivers/staging/media/imx/imx-media.h         |  7 ++++---
> > >  3 files changed, 16 insertions(+), 11 deletions(-)
> > > ---
> > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > change-id: 20251107-media-imx-cleanup-9022d941ae44

