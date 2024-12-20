Return-Path: <linux-media+bounces-23861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5C9F90F4
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0FC1897597
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FBB1C232D;
	Fri, 20 Dec 2024 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SUms+5OI"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013057.outbound.protection.outlook.com [52.101.67.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368EB2F509;
	Fri, 20 Dec 2024 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734693007; cv=fail; b=u2JwH0ImfHR50iwrSuj9yVYXodDlFIqMzoP0RCLtpj4NYXqeZVfZL3G2QUZtdvNEEVbFMXOf+uoRwK6iJcKNQVaKakDSqVuiqXphFxg55WHqM9I4P+BWJ4qfaRGF74EvY0qaFAJ80xJhci13iCEnEzX0Tpa/ci8hGMo4/+M6hkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734693007; c=relaxed/simple;
	bh=iFvv5fMLdQQX9/XMkUrHtQxlyMEP1T5MsTnca1FwOgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TW1BX1/C/DJCMlYGccHgruMFf4WDpEetQE1EXKyjyf8tU+DkVcL1tqwRPtL37QmbqQwHDRnaL4q6Wc/6r4yDDxOmcgIMHV5jCJhTjnkkERkbNzHCcsEcz+KE+OXhx83rPameMAG59efUL2rQXeavFZyUb4cQFVUfwdQoV+p3riA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SUms+5OI reason="signature verification failed"; arc=fail smtp.client-ip=52.101.67.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn9ccUY3PWkTZzWEow7BGrKMFtXfdNn8j5IE4h/LHAnl/28gvtrA3q+oCVnoEojmbkJ1p0zaadcXUemLIlHnq6z42KZeFVqhn5TKLnlUHexEodvi8d4UjJyCCNHT4gOFprDYa6e3sSmhVdNdlUsm4UBv7EX1H66ATxpKoBEVhfB14Wy5jkriSZKN+voLRKelllmio8cUKY4zWEiZ/xjQbzamKhHgsj+9ULnHLyFH9Qx01p/v/K+02ZWnxt59oytJTm8HHmedyHTJ5/MvI1IO8u+cCXIa9hQpN6Py90SKs/DuIVQV550TFaQTKb4X0tEngo/diD7sUuemYXZIhfu4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stSUrPnaszboA67vkv+00Uj1y40GNMXGfaLj2ORhGaA=;
 b=qdCSJgaxjuX4LxgaBve6bEl7Ukx7Xrx5cTJ1yN7dhXEjTxeaJ4V2A9Ckjz6GE0FOrfglFqR/53EL5NPNDV4d/PsRbfSLGSSZsVzH1qMQVwfkvVDqva4EEJhghg1Pk6DecDnAYdSq9NIU5vrWa8qdJvfadsT+yM6xNYa9+Z9yaDfiYSgtNPtR3YecroQwKnzvQZbarhTGnNa/itN3mCMbch2iSc+cQ7a0JjEhYdx0YfAQVIwRat6YVWqjezzo6sQvLyLBz8PNtKykuv0QxmVcKXuz6o7ioLNzQ6izKwSgxCkXMZW+18GKRzcNr4xOmbikq9aRYXqIx/6Dgl4/Y0dWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stSUrPnaszboA67vkv+00Uj1y40GNMXGfaLj2ORhGaA=;
 b=SUms+5OISMWHezzT/qRw5h1SZiM6KjOiTnyjjRiSbKFe3Jui6ZlO6htbwmNdTcmi4cv33LZhF0Bna4X/7Qt09vJiDL/iWIHsdlcReJ9H/BURmU9P9Y05wNos/U3QOTxFFv4/7FPwRxAdCPleiG4LkkE5JUHD73/Zli8jZdcx9/VV92NyHKIPRl5TV1oD8Ih6YR8NyYFYyWIhwos2p/V+fSXzrmf0x8j3MewWZ1XRNmZm/pwuRAwe2bgmenejVFGh4WvqgluyavatRZJehFDviLxRrvCEL50OZkwZtQ8LWHgBFxGSswBukPi+ftvGwykWnP1pzmSpFtPlyJ/u+6Uycg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:10:02 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 11:10:02 +0000
Date: Fri, 20 Dec 2024 13:09:59 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: media: max96712: fix typo
Message-ID: <km7kpbkmdzkkuta2jlr4eql437mfkpv7oeeub4iajqex3na4vr@hqyapkdocyzp>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
 <20241220104939.503547-2-laurentiu.palcu@oss.nxp.com>
 <20241220105934.GB3634024@ragnatech.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220105934.GB3634024@ragnatech.se>
X-ClientProxiedBy: AM0PR03CA0088.eurprd03.prod.outlook.com
 (2603:10a6:208:69::29) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AM9PR04MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a519f9-0161-4ea5-f0c1-08dd20e6d992
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?M3ZVieuuaX7LS105Tr7R9XM902qbvX4rkUGNrrWvyA7Pdh41INTtt+vbOM?=
 =?iso-8859-1?Q?lmabyCGsN4OTLCETcuHT+QxBQS+S9cP7EuSoQFWCdYhHswU+6Hroltjtzt?=
 =?iso-8859-1?Q?HB0tzrbQ46cmVPFOGBgQnYRBA0SZr3wHAtsqLyFmtGjm01RRYNDF/PnJKa?=
 =?iso-8859-1?Q?DWGFVYVpkmbuR82rmq9f6CKvhuv0uqgSVJTPrHV0roe8SYpCotizqlAdek?=
 =?iso-8859-1?Q?eGzMifkhKTDvjXv+H3D0IpDdr4XoTGNC6SxlRe8nQ0Z65RhH9qxWdNAzlv?=
 =?iso-8859-1?Q?SQ8CoTnAs59nej/+fQ3zDyxu6aMf8zQ45yRKlSyhTcuNtlrLfB4JMRfFSS?=
 =?iso-8859-1?Q?Fy/9xvuv+cRjbGOuM8Ae0TCm3DpjzhqTgwYQFbEmgAz2aESXMIULZlYdXz?=
 =?iso-8859-1?Q?eBg7VfchnfNj4BP7Z/ny2vTxM2zY9BxThUdXvTq/gfjZYb8+rLRNilA+GR?=
 =?iso-8859-1?Q?/fnjklzm6W8rCMNMTQPL1koZba2p73NhJkC9YPfMnT8T/BrFwBEB41v79M?=
 =?iso-8859-1?Q?P0C4giAbnqIJFJQGzGrukA06l4truMN0mvMDDAtpNdRIbTGw83LeI2FMCL?=
 =?iso-8859-1?Q?CzMJ37I3XrMrFp6OJb6a8oTy3BGWPmhYG9/okZ7ZaQZ/lbybsak9I1ZV8U?=
 =?iso-8859-1?Q?sCsagjMLdsdIMxLj/ocfxqLtbPo47XKgIXPcLC09BXzeJ7nUZTwe63kClH?=
 =?iso-8859-1?Q?+dEI7uJIzQmzuXv6mivF4HZBEYQvhrXe1yo4ip05bdSANGrUhV1D4bT1GO?=
 =?iso-8859-1?Q?AX9S66ikmlc4Q5db/hfQKWgy1uvdDWVyu0183Qr5ZcH7JLxQTBFhdAhOWm?=
 =?iso-8859-1?Q?Uxmznl09vbR6aPTjDWZ0eIOFICu/v357H0vlLBt/cxwLH1JnaHkk0KcwO+?=
 =?iso-8859-1?Q?mHIemWJikQPT4rC7R98BqAGJmORcJ3y1lfFoaUuj4+D3n2qXYnWX9dF5g6?=
 =?iso-8859-1?Q?TSosIHMmpgrLsSSwQpgiG74zlRZg0/r7m3UD1b1EPGWiTdR7yX5+XBe1iV?=
 =?iso-8859-1?Q?SLqFpEtL6LqdxwN4qZmG/VyFguwNuAjk6GlMCr40aGF3M2Xa91klrWbZSQ?=
 =?iso-8859-1?Q?7o/ut99o5RDb45+y0kkTPmRHadGN8IrL32BCp6hbOzgd7RzySRwC3Z09nj?=
 =?iso-8859-1?Q?abgqOtbudbnUJJzuJHGag3UU2aGCNzwHCVsPgO1km6hKBP6ECQREJMgLPm?=
 =?iso-8859-1?Q?7qjJCo0+iQ3/VppRBf449PX+ynRR6tWNuYhS/XdEwGkAlHHEMn15v7A92b?=
 =?iso-8859-1?Q?9yoRsBR3kAr4OaV0R6P+9SUlcH2QtswYfufVAuLX452D7CgwQtdMo8Ti3q?=
 =?iso-8859-1?Q?GppwuiUc+8F9zws0kvbWyYgNNpiW3/MOtxwLMEYJbt8+2lFHWZLOejwPS4?=
 =?iso-8859-1?Q?ttHx5nTiRu5mPoLPfVNwOGDzSiOLLqOF6G2fLaQ/HC6HBaMnwtLOM2zUJZ?=
 =?iso-8859-1?Q?MzvdEi9+jxyVDMoX9vs9ywQv31sSFaLKErwSP5mlx1nMgz0BIVbiv1eylH?=
 =?iso-8859-1?Q?TLBN9zVX5gx1IYEdTOYQYS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?U1qq6klZgrZrLIh7vWEtx0xXzjVNu7d/H0i9q71+NYzp3TP1ZGpLyD4Ucr?=
 =?iso-8859-1?Q?YajbWLKmPbZJMfvQkLEpre+IDa2kP4Hr2DyX0afit4yO+Lpq4QugyBDzyb?=
 =?iso-8859-1?Q?9jpHMyKZgz7mlvoKkqJS1I5H5+ee0xKkIOTaCzn7oTr+BlhVVzVvv40LSh?=
 =?iso-8859-1?Q?8U8/pqNTTPtmccbhSTAiY/1Ens7wd8h5SMwsOycc3DInQl6lfj4QQzIC9K?=
 =?iso-8859-1?Q?p2Ulle62O2d6o/h9bJLHp3t4OSaDnATpV9kpm4aKfAAY2SsoLV8fbrcgO+?=
 =?iso-8859-1?Q?ODvAbfGRVCAFWdk0z9JZhfNLzWh9i01YIXgmIR9krMrm5UwxzZ904tB+eH?=
 =?iso-8859-1?Q?g7uG5wgYgINf9CDzOnQCSN1IWxNrEVBLd+magNAbS1UPj26Rtr7G7t7ZQx?=
 =?iso-8859-1?Q?Q54w01bHjAPlcM3KB2EwMrollOKIRcfdy4T3dIkpowtKn4jCQmoJp8BJvx?=
 =?iso-8859-1?Q?5W9vtKqhbh63g04ytqi6pD9H8r8SBUpz7soF+fXgjh4S8ncmObZ2LVUJu7?=
 =?iso-8859-1?Q?qiFvP7eQSqBLwnf2+nWVCN2nKQ2hkAtktIxRg0Els2SdGBR10JHenauMq3?=
 =?iso-8859-1?Q?xalXxMrzEsCFsmZtm0lB7pThi08UlwjoTHwFeRXDJ6vONXLvr8yWpK54Np?=
 =?iso-8859-1?Q?azVgsbHqBW6J1Q7H66cKqS5dADn6xDfRiQcpI3ge5/KmNCUTtd5+6RIClx?=
 =?iso-8859-1?Q?9df9ueP+Z/KjU83D/XAGMddo/kxT62T9/CNmhu5zZ5crwQKA9YXiW0TV6D?=
 =?iso-8859-1?Q?tK06v9mjSQ0aq9ne9HHTn08zx5MpKn3Tb1G2nltao/t9Of96axFXoOLXtv?=
 =?iso-8859-1?Q?1aVXXadzMh3iFOwlpPXYnb9ZL/rxQU+6qg7aoAA0WItg4WnH/Ab5kHo+5q?=
 =?iso-8859-1?Q?c/FawYlltNaL1AeWEbcWLCF1lqiDYshjpHXeSHfKpYK8LnWEa9Y6ta/kn4?=
 =?iso-8859-1?Q?GGVzEsnSuGgXzs4Oh5d7YIsZnhhGqp6Y3qiP8Us+cPTdodpUj/hqTa3Q5z?=
 =?iso-8859-1?Q?9bgtrrgT07ynC4xLhMKqiyZ7MFhshqDIa4JJKfsqrSZoZzhslM7ugtwJI2?=
 =?iso-8859-1?Q?0oKfa7d4+5qdRnm8kljhOs+tkcYKz3lzh0wO3kYVZQirNFIRN8LtLAD0TC?=
 =?iso-8859-1?Q?Q3VJhU8pPq4HWWZxmM/DZ9QDycyg96sWxNStPoJ5+H2iFnuC4uFc8eG4fa?=
 =?iso-8859-1?Q?BIGpXiQk0kBxhqTmlfCsZd7ihP8uJiQJpUV8oEIzP24/zsVyh+IFsdh9QI?=
 =?iso-8859-1?Q?6AxQp7EKXyrholR68OYvub6Z96pxux179n8tzXhwi4oEmgWd19eRcBCmMa?=
 =?iso-8859-1?Q?y/d6hHET97G+V0lQADjDhiDRAcV3ez6WBZK4JB8kZinOLVQaNd5R3rRcJz?=
 =?iso-8859-1?Q?kbxjm4VSaWqnNSNy8ZaMYH35c9P7jorhSGtG01HaOp8dt8YfLosi0/8xPK?=
 =?iso-8859-1?Q?ZoliCz8/++xP3yCDoBdRrD2ajM8WcMofLqOPtmchra7Fiq6O7hm1esYhOu?=
 =?iso-8859-1?Q?zIui4qu+dZVLyDEO9ZnJ8Wyc48K5tFhf8i2oxWYhFRkUc3UTWxkypGRhQ4?=
 =?iso-8859-1?Q?j2l2wh3SyEjplwntDn/WDF4Jkqv1kR16qAnKq1UEnZzInjUJJ23ngfGua5?=
 =?iso-8859-1?Q?5CAL4xrg/5DDBwLjP/2lOweuWajzJbmRvmqqYMjUas7enMwyfiggY9xQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a519f9-0161-4ea5-f0c1-08dd20e6d992
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 11:10:02.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVSrPuY4k0RL2rAVyDWG4UwvXnezDqw3kELWVMjP0XJjugaTwlILj4YHRX2yosASPZlhmQA9fYJHiBD9SvAfZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954

Hi Niklas,

On Fri, Dec 20, 2024 at 11:59:34AM +0100, Niklas Söderlund wrote:
> Hi Laurentiu,
> 
> On 2024-12-20 12:49:36 +0200, Laurentiu Palcu wrote:
> > Fix a typo in VS_LOW expression.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Reviewed-by: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> I think your mail setup mangled my döts ;-) The Content-Type header for 
> this mail is set to 'text/plain; charset="us-ascii"' while the patch is 
> likely utf-8 encoded. Same in patch 3/3.

Sorry about that. I didn't mean to mess-up your name... :/ Apparently,
this how 'git format-patch' generated the patch header:

===
From 19c513feb2003dff89c28ef9e54c0e06929efb0a Mon Sep 17 00:00:00 2001
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Date: Thu, 19 Dec 2024 09:28:54 +0000
Subject: [PATCH v2 1/3] staging: media: max96712: fix typo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
===

It looks like it generated 2 Content-Type lines. And the last one
took precedence... 

Looks like a git bug?!? I'm no expert in this area though.

Thanks,
Laurentiu

> 
> > ---
> >  drivers/staging/media/max96712/max96712.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > index 0751b2e048958..5228f9ec60859 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> >  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> >  	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
> >  	max96712_write_bulk_value(priv, 0x1058,
> > -				  (v_active + v_fp + + v_bp) * h_tot, 3);
> > +				  (v_active + v_fp + v_bp) * h_tot, 3);
> >  	max96712_write_bulk_value(priv, 0x105b, 0, 3);
> >  	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
> >  	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Kind Regards,
> Niklas Söderlund

