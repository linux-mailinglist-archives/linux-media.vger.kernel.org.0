Return-Path: <linux-media+bounces-54543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MuMO7ivqGmfwQAAu9opvQ
	(envelope-from <linux-media+bounces-54543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 23:18:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B62086AE
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 23:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37131316A272
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 22:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A070D3A6F10;
	Wed,  4 Mar 2026 22:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mFtNS1MC"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC40384238;
	Wed,  4 Mar 2026 22:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661890; cv=fail; b=lOL2iE9GxvugM2UyCuaDm9hInkL3oFZeg7ZbIYBp9b5byMFb5PpswVgTenGsDINYdjsuLBFYTCf8FNY/vGLrm9zQnggiFnOBjVUK3ItF/LF3et5WxkHTko8vHS79VvgFUy1o8AIDmWb1rE4wOcFfSmW/7uKTb2cQEJT2Y+HgAig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661890; c=relaxed/simple;
	bh=tHEmlSWVpLMlv2iLmayzBXly3VH0B9UrpS79YAxwJyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G1Jwsa+P0K6rfe7nHH5LUicBL7uZ44Qp71OF4V7Q9eXaA1PfFTdqqzYoHVgDHiuLI1lDItH/4fju9vEWwT4GxJyaCRkE8kF6KBKf1wMcKFxrbNyVFVUbYCv78nOlDXqVUBapq2RiQinUJCMISlASD+fGOYjmWIE2v8geFYFg7bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mFtNS1MC; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1IeN9OvhMzQrk3zhHtRSW7GsFCsFfFC6RwiEDhVxUk3OZMfymcC+J06g/o3JytuuQiihU2mA4d3/6rET2QIGVQ32ECF3h7Tzy2iVPBuFIs/xObGNLu//OXDiRdpjAnxJLGbo/geTeCZrvHmyQXOqm141N98bbtpeWzP7/rNt7LaIyl/IKTzwt77IjYQX/6vXg9J1Di1HUw2aTsXQgu7CtdDaPkEsL4T632Zckf/dcFJ02pQ9Vd3mFH5TWSgVQevjDvMkfRzTL6nuWF87pXg94UnE8Kn2+HVxOoMkfZMLQYpZz9H3fcOMwIR2E9vZu5ZATkE+pIrAfPkPkoDbWfFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3qRt6ry4njU3gb6wcNyJVTnuqx1Jei5x/3anVRHYvM=;
 b=Yc0rSIGlpM28FvNUMCPR81kXDLEgHStEFdP66S2u1RninaFbndzINtLU8i57Y92hrjpkUrU8PnUsWrpzYe9nKYg/bK23fU0TqTPwuaxQj5Qev9EqlrhLaZOHYWqWj1CbO7WujGqQogvO8jkv/QUUeAcJ1n51y7+OKAltd4253Qgf5JoRfjhvyoUydx6Y0gJCkjhDzmHLFuJ9kvzN5KE9Lr+s5/7UJg+VMWQIoSGMMIP62Z20Vuwye819ATe5lohHrZhItaiWyDEJ6978Z3g+JxGF0q1GxXzAtmx2Gcgy2umqMhfPmAM+1ndANurQKLOi21V1/yOEozspPHHdFTeSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3qRt6ry4njU3gb6wcNyJVTnuqx1Jei5x/3anVRHYvM=;
 b=mFtNS1MC/bDtV2yiozDCLf3ooKdBDvDJCPR5kV+8MFVsABPwh7jtACcX2tBPPdqGhhRv35/23WJZcNBnZxVQtojsEh4NIQoNmQ4r+tkKaEHinVSA0hGsSA/JQsl7t7YNa9HoCbxrV8uNsO82J0FoDToXGyGieMXS+w1NmS+dVgZ5eKvLRJ/5Kqju+GJE80oPdJHbYv9tQGAtaGQ/ZAPW0Al7V67jxm13fNZMUpT30SYjyP73txVp3o16Y5JGtrq4pQmIk9XU2cbUWDwrn7zJm16U3G8t+Sr/nQq0bv+lC5ZgJaP5LDLcCRbdrHPgcFDICR9hS4l0v5Vi1d+NpIcK5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6999.eurprd04.prod.outlook.com (2603:10a6:20b:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 22:04:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 22:04:44 +0000
Date: Wed, 4 Mar 2026 17:04:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] media: v4l: async: add helper API
 media_async_register_subdev()
Message-ID: <aaisdJSsFE5-PLx1@lizhi-Precision-Tower-5810>
References: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
 <20260226-v4l2_init_register-v2-1-902d7140f9fa@nxp.com>
 <aaWO49Dga6gHgOXS@kekkonen.localdomain>
 <aaWwHlvmvvMQKElk@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWwHlvmvvMQKElk@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d11b486-3482-49c5-b35c-08de7a3a0b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	VDjnBUuim5QuZId+sOLnZ4DU2gPhVvQtrzhkyuApdCjJ28CU8SXZga9cM/WvSJpv58yrX6qNTXGwOgRGvu8db5Z3TwgMF7a8Q1lf8bcbhxmi36o1PuvJFyhYDYDAQm8JRPTykZHP/W4cVuNgy/6KloyMUAufB2VwOt4LXbNtuNCQuR/kEcr3jpHOrQ6aegUqXah0zi6QNNv4KuPZAOuflZLLVgaHm3MXtiqz80dxE5L/fsghNGbiPWVox//eYl8eYjdLUSCMy8j0MKopHBOYaBJx/19IxIALuhnLmdiKSYwdj5kd3hUG87FZZ8P9U0f/tyx+a1ih6TpL+qI07/dM5I6nmGfTabr25qHyqt2o5LL3XiDJppaTkb8uXgRpEu2cig5fiklhuTyiPPm8V7hhACkJGGaKDrzgVDyDEPzXP54kT7XjmmXOeis1k+lmVGwD0DjdBy/ujHJKXeXHzB6qQjaUR+j9IYhncrl/k3+dir/qa6JVUjBzxdiaM2USUjmR2kVMjntmXx/fPepV8W3haYQKOzEO7fhts1As2lh3A3LnKxlTd0GBj+jsxZSbCXDKTF6VgzWHlr0sykIc0qwnHVdKo2vMlrMm/g1Y01BnRKeV0JSRJq+APO/QhyfLUMIo57kt3ZI7OK9yBj88hPpJFrMpThO/N+dGkDr8TchaEa2RzYQoew+XCCqaGnu4YTLLg5swwm9whdMi1FS9vrIwMccFgO1AP/qFRmuUokOV+NHwYb1Ql/L+YStIuVbT8m14YfhFl6e2udJ2riDwQc2qkKeiwvupnGIXEs19U3xEPy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nzENjykOZIElDWW3Qt2/L/sC85aE7d6BmV5B5iWN8BCtHz15yyAnd+wgVfqc?=
 =?us-ascii?Q?/SlpC09QUNNCCW5Eqkmgtl7C7l08LsIFr6xKWbwbo3Nw5B0AudQ5KKOn02WI?=
 =?us-ascii?Q?RoWWf64PRpyc5y5z7CBEbyBe0VlgWvqu7RuIWaAGybZEASMVPrCRSJZtzsY1?=
 =?us-ascii?Q?4tgum/C/nowM/0khNhdogxAI3ueyd1giot3aLHuF437o1ktEeX34Hx8HanQU?=
 =?us-ascii?Q?EBXnYBSCYATwNUydp2IknnsJpaSTFiopu/A56xCDzPn+ul2MAP7D2MerC8aF?=
 =?us-ascii?Q?6h75GuQzMC/tne6730t3AnOvIotBL/xaJjvflmn7NySpvYs5dPQ1gdIF+HSn?=
 =?us-ascii?Q?37qQZKVzGX0NdU4U7fFQb5xIEh2zES34Eyae4groLhT25k6wYzd7B6TDo2B/?=
 =?us-ascii?Q?y0OjimS3WuRzP7KcbLWWRpdooK++jo0f6ILvk/d74ODcVM4orZKe8OO3vcWD?=
 =?us-ascii?Q?8IrzX/CtZUqrr4sB6xu9ccc+bTkiKjSQ5QD8IBB8eLGTUa/SxQFpzFN4XRY9?=
 =?us-ascii?Q?W+hePeA4cP2+cgYr+68eXo7Z8e8k0JgBj5EXyDSkHHFQZSuM577BZNdqVKUf?=
 =?us-ascii?Q?PRmcwUPhF5Z6HOVVNdFxLT0myLDysnBAwpo2sgM8bajJyGjbZFUkNTvoJU5F?=
 =?us-ascii?Q?VTlsAWDWFt/T4XBXyDfpa/hWJPxY5caS9NfDyfjRpZznyDmUch0zo1WYbSfz?=
 =?us-ascii?Q?HufpwKtWLUMa1tX4fDXJ0f8t0UvFVOLpf9r8UPmIprmFsqXIkXY5uNbuUh3i?=
 =?us-ascii?Q?WAAZ9KBlU6LInTgpbSvj8s1Nq0i+JpKemRY1Dl6WZHBSbqQSLHOHZra+vG6G?=
 =?us-ascii?Q?bWoBthM+V2ZL499PXQb+8dpo0Lpwu5gy+1hedv/boiUwC80tpFXgb/8n8Kim?=
 =?us-ascii?Q?p4MsmAMtPnkiaDLcxWJpTz0thwxRryHy/lf9HIQnjRojpX5kKXQShhkDq3jl?=
 =?us-ascii?Q?RpBNRHbWIwkdFXr5SsAv1EKc2jkfrpNG6Dq6wiG4DuO/P+5IRLsrnyUWq1P2?=
 =?us-ascii?Q?oZGP25nE+kVYnlB3tf2uiqKDZnqbp0E3IvmVC+Hh2UlxCTcPGfHpzXX2Kax1?=
 =?us-ascii?Q?9AGWxPmSOrJMiMl0qt5iR+gkBpKzYxXAZVDNHX0PDiB9dHU//B9AY+XpODB7?=
 =?us-ascii?Q?93TeYktGzgfllwg5eWGUZG4RtM64bYt5ZVxbrgqqzs7kKo8uOdPuU78I5w4g?=
 =?us-ascii?Q?glV++TFgnINhTJOEQl5E8US/X/74HxJL6c45n9Hh0nhO0+IPn1IREDniyxBJ?=
 =?us-ascii?Q?+h6DIBtwRgzyez6gH5WiegzFv80zPPdGxYDwmEhL24KHdXIZmmepZIl7n9mR?=
 =?us-ascii?Q?pROZci3gBQIfHuytiIABXGteBRJAOjxQo4ARIsw/DYZEZeTM/1WS88HeZyzk?=
 =?us-ascii?Q?9PjbOsBgxxdayJotEwp5T+NtHGoOHfEAjGn/oGn9q1AiVA0Tnh4iGHJqcIm6?=
 =?us-ascii?Q?APMi1sqfd02X4dMmXxSyFgxfi1Ziii5gsCKxJ5qwjH0ZT1gw2nzh3fDEQSKL?=
 =?us-ascii?Q?IYOSrXSA60m2PBLpT63RdbB3+BUW1xSjzrgyPaysgwdeFxHeZJVWpJJTrHCc?=
 =?us-ascii?Q?DDijZRO8TplBrx7sMXTeMGlkXHFboTAL1uZL7JM3M6M1mL7Pedg/nGGcR2S1?=
 =?us-ascii?Q?cJSEDq5XNRWbVw7YJxcWyrr56PL1t7vE5M2ul3tWDoIsjJOZnyeDhlEUInpC?=
 =?us-ascii?Q?o2bwdJwzKa4hydtxyPycXjlmOBUmCuLrRoUyvlUmGQjY1kM/NqkY4Z+P7/we?=
 =?us-ascii?Q?MN93mC2KTQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d11b486-3482-49c5-b35c-08de7a3a0b20
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 22:04:44.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi7RZWyyKuhYgzuh3CVrIbjHlkULumQxfUDLHh/XwhOUOituiVDyDV8rLbOyht25cWjeJYBNlkIRJ7999m8yjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6999
X-Rspamd-Queue-Id: 586B62086AE
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
	TAGGED_FROM(0.00)[bounces-54543-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 10:43:26AM -0500, Frank Li wrote:
> On Mon, Mar 02, 2026 at 03:21:39PM +0200, Sakari Ailus wrote:
> > Hi Frank,
> >
> > Thanks for the set.
> >
> > On Thu, Feb 26, 2026 at 05:55:26PM -0500, Frank Li wrote:
> > > Add the helper API media_async_register_subdev(), which
> > > combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
> > > v4l2_async_register_subdev() into a single call.
> > >
> > > Reduce code duplication and simplify error handling in drivers.
> >
> > I appreciate your efforts to try to simplify registering a sensor
> > sub-device, but I'm not sure this gets far enough to make a notable
> > difference: the new function calls two functions typically needed and
> > requires the driver to implement a new one for registering a sub-device.
>
> I not sure what's you means. Actually online one
> media_async_register_subdev() funciton need be called at driver's probe,
> which simple error handler much.  You can refer patch 2/3. (reduce 12 line
> codes)
>
> In file, drivers/media/platform/synopsys/dw-mipi-csi2rx.c, about 600 line
> codes, only 20-30 line related hardware register access, others is overhead
> of subdev driver.

Any feedback? Original I plan to create function similar to
v4l2_async_register_subdev_sensor(), like v4l2_async_register_subdev_1to1()
for only 1 sink and 1 source sub-devices and delete
dw_mipi_csi2rx_register_notifier(), many driver duplicate similar logic.

But slow review process and try start a simple refraction firstly.

Frank

>
> Frank
> >
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 33 +++++++++++++++++++++++++++++++++
> > >  include/media/v4l2-async.h           | 22 ++++++++++++++++++++++
> > >  2 files changed, 55 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 1c08bba9ecb91f46b7479da613d6c1688d4b0b5c..e07173f566fbd8fa332b5e58be288e806b4c0482 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -19,6 +19,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/types.h>
> > >
> > > +#include <media/media-entity.h>
> > >  #include <media/v4l2-async.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-fwnode.h>
> > > @@ -881,6 +882,38 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
> > >  }
> > >  EXPORT_SYMBOL(__v4l2_async_register_subdev);
> > >
> > > +int __media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
> > > +	struct media_pad *pads,
> > > +	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
> > > +	struct module *module)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (!register_subdev)
> > > +		return -EINVAL;
> > > +
> > > +	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = v4l2_subdev_init_finalize(sd);
> > > +	if (ret)
> > > +		goto err_entity_cleanup;
> > > +
> > > +	ret = register_subdev(sd, module);
> > > +	if (ret)
> > > +		goto err_subdev_cleanup;
> > > +
> > > +	return 0;
> > > +
> > > +err_subdev_cleanup:
> > > +	v4l2_subdev_cleanup(sd);
> > > +err_entity_cleanup:
> > > +	media_entity_cleanup(&sd->entity);
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL(__media_pad_init_and_register_subdev);
> > > +
> > >  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> > >  {
> > >  	struct v4l2_async_connection *asc, *asc_tmp;
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index f26c323e9c963065fd7c19d6d9835df1194bc069..220a302a626732e15452f3efb19b03bdc51e64d5 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -336,6 +336,28 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
> > >  int __must_check
> > >  v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
> > >
> > > +struct media_pad;
> > > +
> > > +int __must_check
> > > +__media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
> > > +	struct media_pad *pads,
> > > +	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
> > > +	struct module *module);
> > > +
> > > +/**
> > > + * media_async_register_subdev - Initialize the entity pads and
> > > + *				 registers a sub-device to the
> > > + *				 asynchronous subdevice framework
> > > + * @sd: pointer to &struct v4l2_subdev
> > > + * @num_pads: total number of sink and source pads
> > > + * @pads: Array of @num_pads pads.
> > > + *
> > > + * Returns an error on failure, 0 on success.
> > > + */
> > > +#define media_async_register_subdev(sd, num_pads, pads)			\
> > > +	__media_pad_init_and_register_subdev(sd, num_pads, pads,	\
> > > +					     __v4l2_async_register_subdev, \
> > > +					     THIS_MODULE)
> > >  /**
> > >   * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
> > >   *	subdevice framework
> > >
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus

