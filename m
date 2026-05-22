Return-Path: <linux-media+bounces-62637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G7GLKWcEGpuawYAu9opvQ
	(envelope-from <linux-media+bounces-62637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 20:12:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D251F5B8E06
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 20:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 611A73060493
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 17:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B4535E947;
	Fri, 22 May 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HuguZg1u"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A72110E;
	Fri, 22 May 2026 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472269; cv=fail; b=nH+vC3WDX3v7B1HtMB+/4Jv37ZUBU4gtGW9RThg6hmOi5V4TlUNiaSLttWXHcmnv7vyxe4eS7EJni04Jp1QDmrywUIDFyIjWIRrFRDzibFAz1aW4sFP2AJVWNRH3ciZT9uV9WnbDXYP/rUYfnI4YYHBB/Mctl7YwYGOHPl5s0VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472269; c=relaxed/simple;
	bh=e6JQH7KJih2jcwWXzhzU66y+jFd3YHy2t5zNjwLIeDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L20wtV/YD9gT4jb2Lm4O/AGLSpQjqrUnDCfg9yi5xK5D9lKHw4fJcklcQlCd/ZwXJV7xfRwRDCsWvm/sP4sDq/gAlf00CV7EY4/PssWdA7YR4vG4wW608MjTNHJX1FMhshyngWMFZFcBm61h96E9U1R34GcBkv13VhxNvRJ/K+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HuguZg1u; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G62S9U+qukmTPeppwS7XWHRyo0Fziqx8/X7I9htLOF8sJibFu6i6vz/ktk8dBEZptAFDXRZNUU8tkaEwCcRxJ5vqBglYVID46GNrSKXTufRuqwmECUnG5BnaBHF27aPIWfiYFaPHf5qFwFZH8koAZK8fTHShBAzF/204fT1ewjHiQ7b7RIJJIoKSNyLq4L7XoIea0chzoE+Zov3UVHkp6KS8JtRr1McNcUB6fBaIyXKYtLSJoZ+kAJ7oN0u/PHZvhheXeFsDuasbWVsJBfQyoSL8DycBvZGvTMyaSoF5UBbcJSCzbpql6XyEc5ddTXKn1kdMFyeBGV3HQ5JTy5q1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTvd8UouejsWGIQnEQgLfP6YkGdQJF7JF4TZCJfsHPA=;
 b=hpYjuFmanKxKMrOYaDBG2pcj8Ipn9U1h6wbrs2+iJ5oVYh5vUwhd70Ea+8R5enjlpU6SO6nay1Dpvvv9CdedJKGYy8q1EBoPT/ThQYNaR4QTrCVPX9VlMV/Mj34PYXfRCC9jpRnle19OdATp0YC3lm5D4r8KZk8lG5tzE+rxLLfmHQJuF9Zs4lsvv+5hH9CITl/ZZefKWIVS47EOUtC7ld2atU1Ziy4aVp/kN13dA2oHkidF29uQsgtlRgblPhx0HeQMFfcIgsTq517yqT1Mi178YlM7/CzsRkuwe9CuGCjueQK63Lq3vmLtG3eLtpXOxrEwB6kr6Kw2fyj52u2Z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTvd8UouejsWGIQnEQgLfP6YkGdQJF7JF4TZCJfsHPA=;
 b=HuguZg1ud8ccWMF0eBk3bIfQpyfdGukk+6PO525AvaWP7uiqQGOsxzJJUiSAjcJiH07kL2FKZuq2G5373B1K0YHeG3pZLPW1pEQINS7VacpIosSeIK9sAbEBzrxuiB0CW/hdgWAZxu2wSTUyfTnd6LBG0nbpYcLjwULa7rxWhIEHHkAI8eMh3hH9C05N/DnOO7s1+BzemP7kqdy3xNICl46r0g0tDzO9cnYsjeB/T/+NnAOESmEj8RpTiUX2mdA3CK/ROebi8YZli79x3GTi/R21eG4M5XblZRhu11J0YSRUBZXYMNhmCTC6mZWLn7zy35AmbfJtyQzZsk4v+m5Gyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11783.eurprd04.prod.outlook.com (2603:10a6:800:2e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 17:51:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 17:51:02 +0000
Date: Fri, 22 May 2026 13:50:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com, guoniu.zhou@nxp.com,
	robby.cai@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
Message-ID: <ahCXfRmvhINIBi_3@lizhi-Precision-Tower-5810>
References: <20260522143120.690330-1-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522143120.690330-1-mirela.rabulea@nxp.com>
X-ClientProxiedBy: PH8PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:510:2da::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11783:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d0eaee-62aa-4019-5b72-08deb82ab050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|22082099003|18002099003|56012099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	EkzrxlC86b+WsewQNSOYPzTHNwR5q1RFd/SPmL3NFDeT4/8Nw9Ri3n4oZlk+y6JoFnycJ5RLR5OBw7j+wfbgjPHg3Enttxjt1x8m2rO4g6yUFeWL9aOtPhZyLDUzYewFa2QSmKHCB5usnsVn9ghiYn9ZtI1fqS/pnVg2YRu7Fzyw6t9GTHVyJJsQkL1IZg4q9q7DLfxhYtT1Gtv65Glk+rZScYGjtIej7CYIUZmJr06qlFBVyxDn1+0myLzGj2Ge8OhwiCsy7GfFJTDHUQEZBDlc2m162tBvL2xkwF+drhN28bNvot0SegrqU9rLo//4++rHBW2XOjUsI8Md6as56p9zafg4Vdn+eT6qeX/+QywIQm0FFlMM4/32Eu6qE7ckwKJiN2ijqMJpIAWwXJ9pf97X4FOLYv39qT9vi0z/CiU2CauU/sPSWT/t2kmh4TorOUmH6gxe3EZqzPZ/wTozNdDHm5ubHLGWzpGMA1WIthiiK9LJbPNzO1858GVymZNVVMBp3qMb5CV0Q2KispZh7tqsDnHcze/i2UUd5BgCUWUrOrSOsa1dQf6j9bWDfZAqb0S5EXTb1Ae7dSBX3vBqYaZ6Zs8ZMx+2Sb0NR962Q7xLNEqnCGNeSbJMf5TFbaNSljgUwVCLJz+bHGQUGHHMnLDZ9tXeJrq50B/qmZeSnltlFS4Lg3hxcpluobFRR/EWAm/+TANlwAf0C0dDHtXC4/QahHsVFFYvfzyvC/ryYoQkiC+WIFJGhVlij0I/zoxy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K1jGDLCkXhHf7b7plRA76/nk11ULuxha3RjW+nfGL4AKVqtJGxM+Td5OH5fF?=
 =?us-ascii?Q?y16Ne8LYYFVuJFsgWt6ZQoj/VqwFpYS8DZZsbB2qv0W0ZMe6D7toaj5kpTwH?=
 =?us-ascii?Q?heTWVA56wYdnou+IEMEJgy88c1RhS+zAKirVnCKQrDFryRGEaQ0VsAVhHtNA?=
 =?us-ascii?Q?tqTog1ErkQKaCeernp9t15Wh2wYkXHWK4nBLk/U/+L1jTCY6dChh3cQSPCAK?=
 =?us-ascii?Q?cInY157Wqvy11gTmIM7Yc9qJe03SDjrRUNXyu3Hpj0UOisUS8YZGya+QswlX?=
 =?us-ascii?Q?C7Cer0rTKWuXrnPguOG2A2MdgQ4CqiJYK+NbcoECCL9Eeg42CGDeBMO53Yn4?=
 =?us-ascii?Q?0B3cmZmcQ6glenS+equ/THht1g5YpLu/9JuuZXWuaqSUK/kDjVPDH0u4ZPDH?=
 =?us-ascii?Q?G+mYQzj+PjUK6tdmX6FZsx7+pXe0Qw39O+01GL2GuO2bGYtPLaRU/W7K3UEB?=
 =?us-ascii?Q?vqq/axBzulHiNEMsgGdJT3jrAcEeG5q1FERGDpvz+BRIDXqhCS0ossyRKuCh?=
 =?us-ascii?Q?Hqi6DHkqyjK/G8hQeYh8m7a+ZKRLAswxx1bTDUifacxSwq0A0E7tpNvSPsXN?=
 =?us-ascii?Q?s827vAZgNnyr1C5HHZeN2sPlYK0vihn+FebKJoA9aYnqALdPci8QPEQ8iCfd?=
 =?us-ascii?Q?psidIXd2/mC1dE515duOU3P+DZoLeURcnYxjsF+WmhCplZo/N+srXkOjorBr?=
 =?us-ascii?Q?PO0mzwYL66KNzyzKiFFwdK+JUoBtnWZL2MKLBpJQfRe3LoWeLJUVLYQik8GP?=
 =?us-ascii?Q?TrV/YCky3N5d3W1ySGPhpmgwkuEFqbJbIgKqAtBSD2/YO6vCIAV5/4ka6hyv?=
 =?us-ascii?Q?GzsLmhRCEoDDGm5bmhSfgxNVesHJ0llaHpS1gBzDwYTVIfu736NlYhhgBUvZ?=
 =?us-ascii?Q?+x/e9AINgpMhP9osfTc9NwNa28TQQvT9ZgyX4nW5IEtoW+PaTGo0J+qwEQCf?=
 =?us-ascii?Q?gw/9R7G111/FxULpGa13uYsWIIFTtJj+rr24V4XalRCiQsR4OhLgltQhGSJ3?=
 =?us-ascii?Q?2pgAjck1NhQ2Q3tNu+MdPcPMB8TbONoy+m9TJB6FendV51ADYIffIDxkXZp8?=
 =?us-ascii?Q?KkieWUwH2iW48FI5m6K8lHOxDf1cswPLfD0VYQJtIK/N7gwUp13udbnglr9q?=
 =?us-ascii?Q?15CgneyP5VZ1xZ+ySqUsOx5EFaRzPmA+A/A2a13FWKm7v50zBeLmie/ieioG?=
 =?us-ascii?Q?GOioLcUkcXDUco5YejxrDKjgHRZumOCkDgbeB+YIdKXIihRorb2eyPyh3HEd?=
 =?us-ascii?Q?Z/5+j6vIkof/XFoHr742LyzOleRDjh1jOpVqK+NdcM7dW/GxhYIgf8F2z30y?=
 =?us-ascii?Q?3bJku7jOC8TT+ipD6jZ6CUnwFDiPIVFltGIpuuFMopBZCPcLVTtteUwJac1d?=
 =?us-ascii?Q?sBf5bzqlRNatjZ6wI4bumK7UjCOZ55zgYP/1BFGwOTK7+s9M+Un/nO75MFl6?=
 =?us-ascii?Q?RPbNbiy8Fc/vIafOmQjvYNmLukvmHR25Nxo66LFurUNBjfKsmxglw+EioNr6?=
 =?us-ascii?Q?Tiz4qNhBveN1DT3PTQqRrPsYq+HCqfGMfSaEgUBZ2kvSr9p4imuh9FPGMrNc?=
 =?us-ascii?Q?bkRvZ341IY9M+usuNa8FL47Ebux7n8utaXJJ4Anuc8wYr6160PwDAGqpPSW8?=
 =?us-ascii?Q?SV+pOMrQkoa1PPi+6zRl0N39iZiyFDELfXz/Qzwir1BR32GdPyu3s+o/dU9M?=
 =?us-ascii?Q?ElYVJfWYFUhr3+nOa6X3cRUUfJCsRyTwdL211FlrnHfOax5g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d0eaee-62aa-4019-5b72-08deb82ab050
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 17:51:02.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGqb2IVi4P1RStHFE0vdU4+/kyL2wHkzBsdYOocGih+wJU5i0h1zeIZrguSLwyNV0grdSux/dNlYIE4NroJGoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11783
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62637-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D251F5B8E06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 05:31:20PM +0300, Mirela Rabulea wrote:
> The v4l2 helper v4l2_async_register_subdev_sensor() calls
> v4l2_async_register_subdev(), which is a macro that expands to
> __v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
> inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
> rather than the sensor driver module that originally set sd->owner. When
> v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
> overwrites the sensor driver's owner with NULL.
>
> This causes the problem that the sensor module's reference count is never
> incremented during async registration, so the module can be removed while
> the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
> bridge driver).
>
> Fix this by renaming v4l2_async_register_subdev_sensor() to
> __v4l2_async_register_subdev_sensor() with an added explicit module
> argument and introducing a wrapper macro:
>     #define v4l2_async_register_subdev_sensor(sd) \
>         __v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
>
> This ensures the sensor driver module is properly referenced even when
> the sensor driver does not init the owner field before calling
> v4l2_async_register_subdev_sensor() and prevents premature module removal.
>
> Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Link: https://lore.kernel.org/linux-media/20240315073125.275501-2-sakari.ailus@linux.intel.com/
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v2:
> 	Do not rely on sd->owner set by v4l2_i2c_subdev_init(), introduce v4l2_async_register_subdev_sensor wrapper macro
> 	Added Suggested-by: Frank Li <Frank.Li@nxp.com>
> 	Added Link: to Sakari's similar commit for v4l2_async_register_subdev macro
>
> The v1 patch is also valid, as from what I see, all sensor drivers that use
> v4l2_async_register_subdev_sensor also use v4l2_i2c_subdev_init(), which
> sets sd->owner
>
>
>  drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++---
>  include/media/v4l2-async.h            | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 77f3298821b5..62a3a452f788 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1256,7 +1256,7 @@ v4l2_async_nf_parse_fwnode_sensor(struct device *dev,
>  	return 0;
>  }
>
> -int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
> +int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module)
>  {
>  	struct v4l2_async_notifier *notifier;
>  	int ret;
> @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
>
> -	ret = v4l2_async_register_subdev(sd);
> +	ret = __v4l2_async_register_subdev(sd, module);
>  	if (ret < 0)
>  		goto out_unregister;
>
> @@ -1300,7 +1300,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
> +EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
>
>  MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
>  MODULE_LICENSE("GPL");
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index f26c323e9c96..54a2d9620ed5 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -333,8 +333,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
>   * An error is returned if the module is no longer loaded on any attempts
>   * to register it.
>   */
> +#define v4l2_async_register_subdev_sensor(sd) \
> +	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
>  int __must_check
> -v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
> +__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module);
>
>  /**
>   * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
> --
> 2.43.0
>

