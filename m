Return-Path: <linux-media+bounces-63957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ha3tJDkaI2rziQEAu9opvQ
	(envelope-from <linux-media+bounces-63957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:49:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9164ABE0
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 20:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=SRfKTDUL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63957-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63957-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75AD5300809C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 18:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C601419A4;
	Fri,  5 Jun 2026 18:49:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D943F23C2;
	Fri,  5 Jun 2026 18:49:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685356; cv=fail; b=X5PDCz+4YbmmSY5XR3Er3XMxt5AyEIDtvLvsTnCZokhrzRUL67aLNSeXUwWRsWJ9UoZfLWE+FZdIhgCeqZTmW7fHDsCEjef3Xts2FwjQkhF+5BJYO8NxIY+jKpAPXVSL48wTfXcyyBqBf0doNaEdf8RW+PJmyWB6UjSUHL+l/HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685356; c=relaxed/simple;
	bh=OeDwcxp6yBN02stQwSm9cyDwETwC67jaQlI29VZdFCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RqIdCjQ8vjIFbFWJMAhd5GOhrid6Az0CkG/wMpSjH1CgPKTZbKztLLOVx2mfFWNGwXdzZLJVg8vEA2Za7T1/zuNkOXchHHP4qPJ9lxLKWg9NrDAjK3LROaqXbsTiqCMcCekkqGJsIDAIdgIYSVIr/MWueiH2gnHlOpSsrzdOdR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SRfKTDUL; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It2rvo+FmekUaRcevPo3ZpUwX9o8zoJqVj/owoRbRAvrMSb+JX6QN5VXMhFpwQhDtSkBuNN3oMsTj/fSb68jzPnt1t7dse/aWSSr2mNPPhtFkdzne/hAXZcTDeOPbPTGN0jv1kktYWAX56+0n6CCJm5Yxkp6gdk3TCUcFBWV9MHem++Edw6D1RAjBIEnl+6C6HI5njrJjKPrSzL+YbutWONbkYRkxYTg5ZnSoaeECnMuMDwOZlu3oButuykpjLg8AurTSoIRo+q0J/Hho9jxKRq18qU/1+RLxVKHxlJrBOs/RjMjBEqBJNOOEG5WgpV3fa7/LsCnrUPrVT9MQdb/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTcJqh+umnHT8YPIxXTtJS/o0xHq50MLTvnYY93ENeU=;
 b=ZOVRt+gbQrt1SL174dNjp81Ge/8cdFSSHqaMdk7KwMkeSM/JNMY4ENNE92uT02puS0NpCU10N6aEE1wYXpiouR3EoMYtA5X6h6BE91uvM9ziVKS98p9JW/qDi+vY6L7zCf6OiDT2yg3cuy5GomgCLz0u7S6VdUM9ocBV2U1fFmqEJXCAS/NPD/8pR1yNMxx3HTO+wWw8N/4rTKOgb+o4eWmQu6xr773lQgRIhx7ZP8CBnlitguWsSEBFbNWXj5rGQrIpv7owPMK2UT9e35lYOVeXCBJ5Rfghfo9ud+of0wEY1aBlt7Css4WU7BYl92C3R69fT1oZDrMa0kJhs0mkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTcJqh+umnHT8YPIxXTtJS/o0xHq50MLTvnYY93ENeU=;
 b=SRfKTDULHF1p2Wroy9QGSVgBCQrg1e4rrS0favkQHO2YIkF0b9+Z+R62gkO/kr9asKQIppJGaGz8TiVE6q7aXltoYleUFP61GRtbr+oI5Sg6GxtzPI1g1eZWit/dSWVDWAyV09puK+JxbEQ8uRnKLkAA5BoIevK8CX6qaZhQHg54YenQFTwFhUozXXDSomp+DSJttIHOLkqHRdfna5WGResYSaBacF6hk3ztJt9kMInABKPOSfM4Ft//9+GS7Rc1oVF0BbQwCtIYDu9CB0sOb+MBukDjerCoND8yuK7vWlTSUy7GC/ZvKTRjNu+VB+rbVteE1LMAGqsvcLRucVZzOA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12325.eurprd04.prod.outlook.com (2603:10a6:10:630::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 18:49:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 18:49:08 +0000
Date: Fri, 5 Jun 2026 14:49:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Bingbu Cao <bingbu.cao@amd.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg <david@ixit.cz>,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Camera sensor and Intel IPU driver
 changes
Message-ID: <aiMaHmO6fQ2xkhF4@lizhi-Precision-Tower-5810>
References: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12325:EE_
X-MS-Office365-Filtering-Correlation-Id: 9531be10-cc07-48d1-5e0e-08dec333203e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|56012099006|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wRQkAX3gEVRqO2oZtQIozp6FaA+poKzfQYy4PKm5VyEnwldM8JNi9AhlGg+Mc5XsR83ZWLqW8oYz7QANIKIub+lmo8SnnXEbwnQ+9zcA/QeC8R7pjgh8IoNqbHqHXXuPRae4gqASPcklru+fI2bfZTdYdPPr57h86BSMpF18LnJrZdZjJCNnVJUJR9p8KV6Y06bYLTKPBYzmP+ehNBnKO5x3ZfvAa9KMSRbZ5hfgVK9Gdqxaytmdp3WBDZia5xx1TKxdUgB52lSrR3b3kv+M7SHi6PXdQhrNMgYebkqrR1fCmvGbJp4BAarFwwUvgUnjxpD1zjcG9SENqQJzS2sjaHQxgMxCqI4RSmCCnT3Dqf2Tr9J6n1gTXaCaOhlzOEEuy1Io6FBIT5yPtCAO+Ngo4aWwHENu0EZCRWcvUbxm2W6vjAdCkdK43FOl3352NFb5cvF8D7Vg8sAV742krL4MWqKUTOb2lpxRCn7+aBellTbrPjAwYXex/yLqAb+AcSB8icuUYeonYEurFWp5VSxImWZE/rRAcW4FmDPUnq4wRuEhBon8hlvl4tEkYd+zje6sfBumhUqsURqrA/NsUN8WFuBZIg0p+eaR7sqZwsvGp4xhY3JQaELzsmi/9gaFMqTF94DRhUBBbQDQ3jFx5bjV0fLvJg0qhvu+ZW4znqJxFvRpVCYUvwrZEnP1GEU+yraBPudHZKCf4isQtR5vnLzF2Hm6O/LF02ScwrUxhjrwh6yTg7Hsx/lBeyuFY8WgmLSL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jr+J1RbJCKhwbgtKyvQgOTdHRDdoXFZhyLvHUynSL0XpICL8wA53Kwz2BFi6?=
 =?us-ascii?Q?Pu8tyVyKGtyx3lv7eATwaX+5hZ/HpPF3HEy+OniRDZCPKmO/AQXzDlRefd/h?=
 =?us-ascii?Q?6w8I4YyTR94CCocgHWkzH+gDlbFb8xPwBFBpCRuts+44T8bc55UuZPKXkV90?=
 =?us-ascii?Q?IW9ToxvXXjNtjwp0nKrsk5Iz6dfo7bJ05S5PNERmBosn546cNBqwQpBp2mLH?=
 =?us-ascii?Q?3F9LycVaWbDaYY1dIw1W1krahZyG2hWwG/agOMoLM1Kfwh7kwiUjHPn415T8?=
 =?us-ascii?Q?+Bx7V2fuxb173AkNAf98yXNmJTeO6M7smqLBGu8Jl6mUy0YCoCzRjn8B745C?=
 =?us-ascii?Q?6nawg/RHTf/r92sJs7VMheWmhyQ4HEtlQk/WoTPEnM6A8YWgcVHosqZTMazu?=
 =?us-ascii?Q?jKcIImKWJKmqmYETCwmjUe2AByvP9EyjrTFn2MsSAz7xqY/XFj0Y5wTjdxSS?=
 =?us-ascii?Q?44+9SqgYNCx4vm0U7+29wtLtb+kH5Sg6Nibp3whUKNcp3DgyJsuDLQn3bc2T?=
 =?us-ascii?Q?Fd0DQInqv5EF8SB8l+EnhB/EdzZrGwYDmP2AzEWiZt8IiO3PSOM9Rdiph7kf?=
 =?us-ascii?Q?A8LxnkEkN0EZJIFnsdtDH7Y7wwhUIHot7Vwn43HC3haZ2btyZ0LgviIiP2pw?=
 =?us-ascii?Q?YWfaC1REl7v9CjSmXxoZ6HoA10QDKDrSzVIJfppjCRL4VsYdr5E+6sYVxLA+?=
 =?us-ascii?Q?p9eYFqaj4mR7lsKLKthxBupK+Xd12ZndiGQOHeXgQsILsLLD1PHSMIuD/tQD?=
 =?us-ascii?Q?cqSDg89QQ2lN4ZYajfQTapPnfeID4hZp7zrOfWR/GKpCN39oxMeBAb8MNdv3?=
 =?us-ascii?Q?HaQ6hn/i7qdizRNJX8pYPxe8Zu+gwOgnw59jQ00HqcU8T8bhqM9VgEFqiqe+?=
 =?us-ascii?Q?mR4xwuFybAGGvavwTDZwsUylHqwmxea5YzK31dfKPVqeLPolR51Lc2hqTMB8?=
 =?us-ascii?Q?zNi2nvBDUPg94zMVE5Zi9s0MRNImI1pCmslbbFTGwL9C9b8ZeOkkZnkrCjhb?=
 =?us-ascii?Q?4sM/3UkxfXxWRpl8lQDG4bHUis7f+W+jzBJs9rzqmzpWD4GnzxySOpSixtBM?=
 =?us-ascii?Q?OW1Fz0OYDpczjMIkbaK5qLG7LnzLsIAQCy6LCRAQoNDnDFs24v0/vxchyplo?=
 =?us-ascii?Q?3jLJ60XsVAkLlHTBe1NiIdm+pFCtX3dScb3ZD22CR1kMA4PyHUS1hCESXFqS?=
 =?us-ascii?Q?PEWSF4fH/T9nafB0MrlGboXZSwPVZyTvncXuMQ4cuiTKvSyFDJgCIvfy8FaA?=
 =?us-ascii?Q?BByOIrX/2e05uGcbinMXF5u3gEjkj+Tn8TkDos8K5RvmuCoIQ2M/nPvHJIzC?=
 =?us-ascii?Q?5FT0bYJC44WEd634VCkCKrLt0wZfV0x14iN7gAhXIJ4k3SCp6xzuSXM4rX1E?=
 =?us-ascii?Q?h7wLlukDgOnJiQMkJtXo3PGYEWjAtsNU0VvaMT1I3Kb/AkQsUgPIi9tIzU7B?=
 =?us-ascii?Q?h+ysFUyMYKLPQE14uVwL4Y3uCK5lWELTuyHy8c2DJ2tu4oyW9+wRHO3ufN4t?=
 =?us-ascii?Q?3ckfNWol36baoA2I33rRfYVI043pB4tZghkIeyucW9zn8LdM5HxFovWDvaPB?=
 =?us-ascii?Q?nk5wC4rrXgU5MfVB0eYV6NjvfQqiB6X6OSe/czXTlXP2h2fFiOTeZqBphjhd?=
 =?us-ascii?Q?5UvMiB9OXnaQHVUPtZkDFhEtZ16iCfnfW6mc5BD1+i7GUezJA9XsYziih0rf?=
 =?us-ascii?Q?/VLGt3RooWlZldlBaseOOJ1EzbZtBX9Ah+3otjOqp/AMQHD/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9531be10-cc07-48d1-5e0e-08dec333203e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:49:08.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4ELoDtb/r7F3ARY22sIDv2TGIciUagW/zk2i+ktPGgl/DnwGnipE+wgQURHOPPuGIWtgIqLEqa1H81GkZsFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12325
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63957-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:yong.zhi@intel.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:lixu.zhang@intel.com,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:bingbu.cao@amd.com,m:dave.stevenson@raspberrypi.com,m:david@ixit.cz,m:mailingradian@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,amd.com,raspberrypi.com,ixit.cz,gmail.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:from_mime,nxp.com:dkim,lizhi-Precision-Tower-5810:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,linux.dev:email,linuxfoundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07D9164ABE0

On Fri, Jun 05, 2026 at 10:49:44AM +0300, Sakari Ailus wrote:
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> Tian Shu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Bingbu's e-mail address has changed
> and Tian Shu's is bouncing.
>
> Update Bingbu's e-mail address, remove Bingbu as a maintainer from Intel
> specific drivers and and remove Tian Shu as maintainer. Also add Dave
> Stevenson as a maintainer and David Heidelberg as a reviewer for the
> imx355 driver.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Yong Zhi <yong.zhi@intel.com>
> Cc: Dan Scally <dan.scally@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lixu Zhang <lixu.zhang@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
>
...
>
>  INTEL IPU6 INPUT SYSTEM DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:	Bingbu Cao <bingbu.cao@intel.com>
> -R:	Tianshu Qiu <tian.shu.qiu@intel.com>

Need add both to CREDITS files

Frank

