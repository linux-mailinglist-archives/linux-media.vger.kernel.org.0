Return-Path: <linux-media+bounces-62638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOpPGpybEGoYawYAu9opvQ
	(envelope-from <linux-media+bounces-62638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 20:08:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B16355B8D06
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 20:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0CFD30427CD
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 18:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111793655E4;
	Fri, 22 May 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j+Tdmb1o"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCADD357CE8;
	Fri, 22 May 2026 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472910; cv=fail; b=ndA6UF3tFUGztsOuxjbF1lBwR2Rb3dCCkMrivP+ka37exi/Ko6I9UDkMsG4qwsd54tqgbHSDG8qxM5ou9+V8hPSPRXx3KEkTm/za3XhoId5R5j2UPHn8WtQZHRNko64SNBicA03IIbHhaVVV4tVJx0kIykw4pG/EUEfvDwJlM6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472910; c=relaxed/simple;
	bh=Zdxb6QLpmHkqS30OD7y7awHSta0Gd5gouhB27jsiBGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kdff6SmPG4YjxRt5qGcEs9b+vvvhBBA7z+QWheQnf0I9L5T4it74iYiHDYpwpnW5HD3zZyvCfSF6fOgpte8BGBCGQtA0S3rpwPotvS80dIrNUvcHXCNtn9jcDs/dwuDfbhOET94A/lAwCE+T+rvLN+B2VR3jllRYkfHAVpVkaso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j+Tdmb1o; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMcqG1l+j9KKBbOhcMJHL1MoskAuD0HqyGcuYuGldqB/gcS4Gt/ypgYkGCFoz2rG87YfjKgQ9pYNGQ5cDzloEBsI64GipFY+JlhYTbSRwIS8naIAisWC763olPg7mcuVO/3aVex3NVPJc8pwYlq2zfOFqdHbvYyxyUq6UYZeDOeXWaoMkOS/mVUrbh7kfYjHRVZfXBvkvZJZSn3El8XWBgadBf2NPJTLfhOOTRkN93WeOIJO4BYbcPWNWmvqobylrqLDxdr3jNn0y+NBJ+jpU4FSI5tSoyuw3E103Gm5DyZsgN6FdKM+aRVh0w0ChKtMyTCJ67B2J2K3Yq/veHsFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUg2mikQQ5TOrWFWjUWdw4Gq/m5LrrI+dcM70HQ7L78=;
 b=Dky96kg64QV1uJKqt4dK2okmqntInDtslVVkAo/sNqwFN5kJbmcVxRzGtR1zJgY4P6wp2gqkZP7301Z+RILEF2OJCsAxqQ/SLlcvbxrcaHKfbJ2rlGZvk4nx4Z/wE0vT4C/x/gWlpL1vU71UPx1tuEzOIyEvo9vuQaHiV2JcZ+U9SE6OP8zoOSGVFK9FWk2gbl5LnEGrhFjr2n6PBMR1+P79xAdOI678tpt4EWORQ8nTiXFka8ra2u5L9ooqzYBBxKo4dmifXf0HNFK8AEbpAPS7Wv4VAzwlhAWLsYYZW03R/jdFo5mq+SBSzWLzR5QCLa59fHT7SC90Kf0LF5sJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUg2mikQQ5TOrWFWjUWdw4Gq/m5LrrI+dcM70HQ7L78=;
 b=j+Tdmb1o83ZCOTElxXWk1PuJjYG+lnRlT+l7MsUfmlo+fSMwCdXTfydKG1Ri4MSHc79bWXl2m9Pd4Te2hSYTGOazjLtvO+8/Cjymkk3UbgVXz6LrSGi4TbVADIwH1kcW/6NwucQCd2bx+/uumxmbErW/CJZ7d+w13SbIVIA2wSsGr19oFVQoBRclj4oqyfCctrCgucHK4qba0Yo9PZnQH4qwBFv//cTp301U9ukLIldEevCBgVolB9cOcaokJwXpVBZVutyef/FLhYWlUyoE+OKw4fQEbVV+XmgLc1jGD1tRhHOKPpfheLXjmueBLcvNhU3G1lQ6EGE5qKTfqh59mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 18:01:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 18:01:42 +0000
Date: Fri, 22 May 2026 14:01:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com, guoniu.zhou@nxp.com,
	robby.cai@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
Message-ID: <ahCaALRo7Nm2E-IS@lizhi-Precision-Tower-5810>
References: <20260521122646.600179-1-mirela.rabulea@nxp.com>
 <ag9S0pUw66MDUxRA@lizhi-Precision-Tower-5810>
 <162ce21f-bff3-441f-bc97-b1d20d947458@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162ce21f-bff3-441f-bc97-b1d20d947458@nxp.com>
X-ClientProxiedBy: SA9P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bb527e-4eed-4a65-66d0-08deb82c2e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|22082099003|18002099003|56012099003|38350700014|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qEX271t0O2BQ8LeiznuHLcDz6qdBB1VEytW+LeZA6bSBQ0A8JWaUKWCx0GQg1Ria8h1DUHSR0SswFrQtDPgvlBfqaara2/P1/XPK/cHVEniqqkSixVBVCuTNKGO85jZjoAmGIx0pa/p21ZuanlB+6EXRNx0sP2yCLMjvPYZbrKCySqdTq0rgoys2UDdS/GmG+VIz+MhlUzk/rJBWDnGVsqtomarF9hx8V5P3S2OYb8O7USTsGbSd0fS8CE1HTZUni2qG1b/c65CA1ZW2EAS9P49jEk7SxxJs+1LQOKuchYxQ+P5InlMyN6cRo8I3f/9IUnKxtvyGTIM/F7nO8AU6G9PIHLhsO/BQdeMxMySGzaLTt3IQXk1xi+ZJ1p3IBEACQWiS/4wffMbdz7qZOi0yMraqX5X+hjvsgR3l2jGkvo0WJ7uOIGxWQVPQ5UMTQvU+YE/rmPqLY32yzBAf4SSSmKZhZW5dx1QzC3v7aYuVyZjlQC8ff8ptQDbhvyEBvIfZBM4b+KHD6GphFa2SkttmtjZRaCem6XvS1AZBRe46jtkkvblQbvSVm4eDO1cja0E0Wsq8riY+8VEWeGu1nHWVIl/ODMBW2XeD2q9cTSLgLptomm9ZUZhj4l9alo0UoBMnRZlSMqC1FQ5+SM58LQsD5ThIGNJz2AwWaKsGnxYk3Uf7XT1o6qn3m0ZhMPcb9rgbrYWcVUSe+1dZIBm3wZQ/VSU++5ngEf6X5hRrawAQ3hPVDhbB6Q4kuhlvmrhzJ6Z2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1NSCd5ZgmfHMmb9PI5ZCFzabljFEYFQwpd1u32EP5TK/zusy6LddNhoAshw4?=
 =?us-ascii?Q?TC3f5E+XPph7htrANifQqSszQnONQnYSvuD1mt4IucW8TqcVmof/myEZjbB3?=
 =?us-ascii?Q?ZTvJCZjbhYQem/8JliYB6knl6oCOQXJqxWQrUW7mq7a3zGQicfQfVs7cuA9P?=
 =?us-ascii?Q?3M4Ew0TZfUw9EgkOaia958ZFDu7FIG0Jnf3vOGJqoVRX5TeugFXU1NMJJQhQ?=
 =?us-ascii?Q?ZGre7d0T+9ZykxtphrCGC9MaiQcuLqI8qIrHi/yGEWX9QgTkHaP7mhyr4Tlu?=
 =?us-ascii?Q?P+h1x3Pn1l9yY1igSJrWYO3oc/RkA/tXKYKQ4GB6GqgHQcVAWa4NG8EcLlUX?=
 =?us-ascii?Q?jXXQwppNEU7q0AktedyHiF0X9saS3iZnERIKjTAiIdJzJPru7EU002rhcth0?=
 =?us-ascii?Q?GC53YgRjvl7pc1XQuEzZTS2giAJFPupPL/qBQmtULerxjVczfvNJAHvq3Yei?=
 =?us-ascii?Q?42/nIxB55iTQceqwooDocFaKCpU+b+O9pbFnwldu8LAXXK0jqQBJ9VVWJZEh?=
 =?us-ascii?Q?vCtRgPOx9ZTk/QMAqRmpAn3ihGCBUtcKW8Yh1VRZuA8hAxSAwtASChI7zAeV?=
 =?us-ascii?Q?57j6OFrsFCDliAF+NJlpsNr2GC+E5zb638GNpRLFFny7MHqUBlK61wNYadaU?=
 =?us-ascii?Q?WEqpqcumSAPosv8xwyids4wxLbLqvpraOQeFurcdqEXeam70qbQfPEMT3i7h?=
 =?us-ascii?Q?ym0BzAKlC4ksJTQTMrJ9EbuJjJKhNithEUL3IVdgT+RUFW1ch2ooZ8g0BsPI?=
 =?us-ascii?Q?T7eG3Yxmn+GUyhArUTNtcdedMNVT8aZcwCPkgTOsHFIDdGAq1DmYYCQTML8y?=
 =?us-ascii?Q?KDUAFM2eygKIRJJITgShfGdMGMZLSbKT6gycH3NoWIYOsssL+LT+HoNWE5DZ?=
 =?us-ascii?Q?Lr1shUnmRYDQnJYMV+8s6RVITI4sNIsC/wvAAjOh6q5Gfx61gDU/rj9G8NHD?=
 =?us-ascii?Q?o0CzIxUhZW7zXPhbs93A6ybcVoqlYIGC1iP01LalyRTXBmtJnaXwvJjAXWrT?=
 =?us-ascii?Q?Brq+5Nc/V5iT18BPbcym8/QlyKypfZZ4UjOLHM+3Ad61zS7WQ1yB2RhpGInd?=
 =?us-ascii?Q?PWUVggtDPlkSKDsRyn9RiGoSln2S/DQC5vL3+4BeqTEaijImc+jd8kQjUmPP?=
 =?us-ascii?Q?KnzJL67sEcAs8pDmDNyT5iqeelM9s5RlkIAIvdlSk1IkDx7SGj2w5NCwlTfN?=
 =?us-ascii?Q?hG/TR0FB0s2Ba9bM0BZWlX0OsemOQHUsIjI2srs93swZDtEjGc9LXDY2JR0/?=
 =?us-ascii?Q?51R3ibsSLRWQoHbV+V1CtoFhqxJpCGyaO8xnIQdl6tLcEV7rKcPOjzqnARSz?=
 =?us-ascii?Q?MluV3oNFcBxKn38HjicS5MErWGiAoEn8xEfLga57FUd8fxl9X6x3uRMVxJr+?=
 =?us-ascii?Q?4jAcxc1z6JP9Lsek5JqaHHggDC+2VN9stZVzDKoFuia3STdUdaXOmAYArTcY?=
 =?us-ascii?Q?fVeZlcAt+p6JjpnRPQIXPjTIzvmgTpvunxhjL4Da1isIJJ/SWwPjmTtV+vPr?=
 =?us-ascii?Q?rR8NOwnkBE89+DQEaFHMB4rFeoWk6g7WtqzYcNKos4EAfOROpDR/32YW698r?=
 =?us-ascii?Q?iRAQIr/5KMFFb4UqQsoAZlEss5y0LLoX7M0ekyzfUIvdT9K/O2oqwsJHXKFG?=
 =?us-ascii?Q?f622UZQe+hoIb3dc7u//ZObOqzr5mDDEl6kStkUZJjizo+y0qfMSuO2YAx9c?=
 =?us-ascii?Q?0XvDrjjV9dt+Z+XAesjXII7b2WKb9QuncWm4/FXLpfOh7tBG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bb527e-4eed-4a65-66d0-08deb82c2e40
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 18:01:42.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpEQLUWrx1tq8zoEuHH+hhtCnAWX/lGIhD4KnGlm47LCxV/qds8HnW2vHHevcl8Tr9ullOKjx2tRcZ/BQ1Rdbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62638-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B16355B8D06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 05:30:58PM +0300, Mirela Rabulea wrote:
> Hi Frank,
>
> On 5/21/26 21:45, Frank Li wrote:
> > On Thu, May 21, 2026 at 03:26:45PM +0300, Mirela Rabulea wrote:
> > > The v4l2 helper v4l2_async_register_subdev_sensor() calls
> > > v4l2_async_register_subdev(), which is a macro that expands to
> > > __v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
> > > inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
> > > rather than the sensor driver module that originally set sd->owner. When
> > > v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
> > > overwrites the sensor driver's owner with NULL.
> > This is problem. but this patch can't resolve problem 100% because
> > many sensor driver have not init sd->owner before call
> > v4l2_async_register_subdev_sensor()
> Thanks for the suggestion. From what I see, all sensor drivers that use
> v4l2_async_register_subdev_sensor() also use v4l2_i2c_subdev_init(), which
>
> sets sd->owner. However, since your proposal looks more robust and there is
> already a similar solution accepted for v4l2_async_register_subdev(), I will
> send a v2 with that approach.

Okay, that's also make sense. let's wait for maintainers' opinion.

Frank
>
> Thanks,
>
> Mirela
>
> >
> > suggest solution like what v4l2_async_register_subdev() did
> >
> > rename v4l2_async_register_subdev_sensor() to
> > __v4l2_async_register_subdev_sensor(truct v4l2_subdev *sd, module *this)
> >
> > #define v4l2_async_register_subdev_sensor(sd)
> > 	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
> >
> > Frank
> >
> > > This causes the problem that the sensor module's reference count is never
> > > incremented during async registration, so the module can be removed while
> > > the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
> > > bridge driver).
> > >
> > > Fix this by calling __v4l2_async_register_subdev() directly with
> > > sd->owner, which preserves the module owner that the sensor driver set
> > > during probe via v4l2_i2c_subdev_init() or direct assignment.
> > >
> > > Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
> > >
> > > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index 77f3298821b5..57284b7adddf 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
> > >   	if (ret < 0)
> > >   		goto out_cleanup;
> > >
> > > -	ret = v4l2_async_register_subdev(sd);
> > > +	ret = __v4l2_async_register_subdev(sd, sd->owner);
> > >   	if (ret < 0)
> > >   		goto out_unregister;
> > >
> > > --
> > > 2.43.0
> > >

