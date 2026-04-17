Return-Path: <linux-media+bounces-58997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGfIAicN4mkg1AAAu9opvQ
	(envelope-from <linux-media+bounces-58997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:36:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0241A2C1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3564A3028012
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BB03B7746;
	Fri, 17 Apr 2026 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lgvqgbQS"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273923B7B9E;
	Fri, 17 Apr 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421866; cv=fail; b=fbGjQoszLfPKV9gBi5S4xsaEoUBGXkNR4r8FQN1YhL8QYZ0yA0RHcnqPkN0XGRXSUYCJfRsPvgo+ZXYRLmYvMknnCjQC2ANah7JcY1n18KgWvLTrenuvsE2LFu/N+AZuvGP+F7yIk8klQLCSAlFoKIIK69SYWYi1s1H1WBSl490=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421866; c=relaxed/simple;
	bh=Up9roBhVRJIS+nF+M4K8k+3POiL6SKz8x17fKwaYZ24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pNdx00FgBmDshlLovA0kfsj+9BX9PAH16gccpqyk9XcC3LkDidEK1dC4SXfBJjRbhbKbFhvuUhnKl3F5lWhaLHoeSpQt4oVdAxiN51j3KUsxemMygv7ES9X+jHuKSoDNEuOJlBeqd7HEauBXmfFoNfvHVq/E43nGyEYPGAc0D9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lgvqgbQS; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goxJmfY0jH7Gpyr8gmSxL9g0vuzwUpy24EhwGZB+22v3dypHZ/XvFKq8ImAhUrEwHpuDvEYaYF94rez03Y6lDHL8umBZxe9gnf6DSphMnRz5tHdGUurKE+OXqV3ydVgyytiO2nZtDsbQ/kJ8wofMNaZeuPP0vBmG78qA9mjpjolBR5xTUpnhH2G75XTWmgzVRrYb7Chqz7vpV7eZ6jgxDhQi7SyZk7RjxVIoi1MBUA4oEFBO8oT8f4MQ6WwstqVbmF3lhKz4SRI4fq//rylBfUKg8RgyYBmdxcSclXqZrschrm5VtS4rK8BR/+LphAqokIaFT5oNU9iN7mqkf2rU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V0sKRaGugdPRfgBxOWGPVQJT/lDSXt8mAzgJrdxpYk=;
 b=odYitE0fRZ+YMJ31upiMdH6hw5VidNHBmG9Ku5kTjiN2PXC6oBt103mPUlWSLpiKS2La/NWozyiHl81jSYLfA9ggmeJ8usT0/3EyGedq6zO2L6hvMX4/mWyNGBo+dNu7oCiJPKhgi/ufIEs2Tf9YlOhbC9rTXCLzd/fcpBRtkkwXtm5rSyuELpbVAMurEvb1VlR/y2p57vO60CMOoavGSMa8QPRL/coynfXtEBCwZiHHRByDAr3pw4Wk3so/rmi4WOTdu4vzB27wBTSuBDjV0I9RPsfI50L72IXps43qLs3K/QbX1gY6Y9ZE8EGgM5zukPdDhMkSPP7gjsQarfDemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V0sKRaGugdPRfgBxOWGPVQJT/lDSXt8mAzgJrdxpYk=;
 b=lgvqgbQSoyZigZ81WWmrkBOdu5IaP4v6dS0IS5cYjCl6Sz3LktgsdPAg4JpIWH5Dt+82N1skL5XcX1i+hVBKxaNidVOlo0/+fYuOmGLdfu2+lQkKBygM01GeF/pB1LSD4PlDnobiMF1XGG0qJf/Azay/3BTEuRSLXVT/74XLERSzq2YMHhEciX/pdoKw5hGDesoOZ3dT3SvtpdS90tdmiqMEZiJ7ywgeK3338JBqmW4nGr3Ag2uD6hGOe/fA5+FkiBIeOSt7BejpKKPP55G6F4z8QbWG6iVBy2hRrdGOm5EB5dz/+Bepp4uycYBxiVXys1moGpOFJPEoA+64fHGQ9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 10:31:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 10:31:01 +0000
Date: Fri, 17 Apr 2026 06:30:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
Message-ID: <aeIL3XFtLrPzEK67@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-4-7d63f3508719@oss.nxp.com>
 <20260415-glaring-premium-nuthatch-ce00fc@quoll>
 <DU2PR04MB9081CE0130B8924A2B3C9E14FA222@DU2PR04MB9081.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB9081CE0130B8924A2B3C9E14FA222@DU2PR04MB9081.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH2PEPF0000385C.namprd17.prod.outlook.com
 (2603:10b6:518:1::6a) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 476f5a97-18e2-46e2-b5bd-08de9c6c6bf2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 3mMZfgOUGgJxEYmNa+gszDtSEaeaf/8bxMtytkJ+YPHYZ0Dp0HllC+J1cjtrtIPBydLn4f6HtZ0iOc9mFvRqKECGRXZqqwSByRnETFGoRNvKqX6s2eevCwh7M8hwRffMn/uvT/akNldkGi/y5ihju/0gimTR8hY7hQSbzoHmrAfLjqTsJqrxoxy6IrVKeDMrg53h5Td2AQTkS2U6Yp4t6TC2wnEepHnfY39Pv30Cnv+l/cJFjtN/zO2T80e4BI/K8adz6w4ktqVQdO9kdkpA9VMkZDvZFb1+eQYE4o/iuTJTF9+sPEUyZsVOoUVFamHCNg9GHTJHBC52oOXQWt/ZHOwLBda6ohKmK+taiPAa73DkDKil71Lg3qVprs+n6gpdlQBYNi7tEbpd/qtBs3pAWQyn83s+FA5GMDehzJO/ab1i/F++tfpZDGFBdLHaoyshaLzmoGfWFXJSQsbxsIB/tcQJw1+7x6XhaioIri0UpZkrIy7o/b270XDZq4HtBEUXwaccNrF6rdKP5Yv2jtCSPr1tbSNYW865/ayhHt3zorm7Z+4dhf+tnz6b2bfmK/m6nNVXHWurv/ftM3GOsTgFROR0snaAWkrBzPdAmLmvFXxDZWuJIaxnfgUplth9sRtV0HyuKG4yzF78xOEgy8nnJki+0Qn0ZVL2oRq5Ml0qpsrfXyFrCg1S4hAgKHOROiK/ycS9x+djO99IjEnK+3svrpkXbLkRJFsyj5nINsUfClBr3jQZ5i69wuQtBXGQUpTLaDk26qFXv+0wU1ON+Beve644fXOEkUm6nJJ/FYYbt7E=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LJkDx5oSwh5eKtkgdDI7/sVt7Z/YgMV+0ZVkuMWNOmWNiWk2Yu+hryS5Fhga?=
 =?us-ascii?Q?5KeWye7jc4oh3IFDj40GNnRuRcmdLaxUHGes5ldFieIdc4iectFoR2fo+BkV?=
 =?us-ascii?Q?Yfy2WraIgLUvBDzCXfcTSCru5ZAcCMTOPz9Ri80JDKJlP6y9JPv4UYv3mgU1?=
 =?us-ascii?Q?r+kuyDP59EhL2QpVkkERXN5+INEvFN+c+7j0+4Atryct5SJ0stWDg/92Fc8s?=
 =?us-ascii?Q?OyJmZN+KEUlzm86pmytb5JIWbistA/YBfK2Ec+f3djmRXKMFE/x6PUchhKOH?=
 =?us-ascii?Q?aRo+B6h9nIL8qeLf/SHtyzVwV6GTGmSu2qw2uWrp3YBiuR58GKAe470sxtVs?=
 =?us-ascii?Q?yN+wWgHWXVwnMYZdoLD/0ACF+Fn2INdvhphHVFodJmy23ap7rQ7Vqxp6uGX1?=
 =?us-ascii?Q?jNLBYmJwOu3rdQfcB1onDcCoaHVNYr6ok1YzRuBWpvsjhMI6Uv6eeKckEsW/?=
 =?us-ascii?Q?xXLc+38pK+QW/OUL+UJVniBqOaS9CYLPkfYFMWJJwxxKGMU+ep40464fnFvK?=
 =?us-ascii?Q?3CX6tHgmvtj6VM2DnWuaEinAwWfTwl1cLFsTCmTQYVcmwgu3fB55j+cLZi7a?=
 =?us-ascii?Q?6G5eIEwZ6Hvr1vaoDm/WTzs693lxShsMcZUdmSijQzkFMIf2eDoMRQA1tRTD?=
 =?us-ascii?Q?NH/awiZZm/VWPe2zPvJ1JdMYVI6/2WPykLA7UG1kOEGQ980Te+NOv8jo+uch?=
 =?us-ascii?Q?r1jVOOQZwa9PsoHGqIOLr5XhZ1LPbPag3p22zLjAjH01Rum8o9XJaaqsm4Pm?=
 =?us-ascii?Q?kSVeXWscmcnQOMZTMznPH0QlPfQU5TfubBzbY9IM/a/HoJHPnNTqlN4qMMpw?=
 =?us-ascii?Q?flgOvmRXWFOF/0SwzQEfhDM0aXcOYRJW4XslhMHbIq5jfFnJrTqgNAkYNbBB?=
 =?us-ascii?Q?2I7Z2F6qcMD2pk5B3pdwSh5B1p0JuQWE5WrBq/UaHh4V9J94+DFnK1mF+isH?=
 =?us-ascii?Q?X99yTvizT3QsgfE1bUOBfogNfVscEq0YJVOq87Wlpi4JV3P2NimUaqorzF2V?=
 =?us-ascii?Q?2WoQz27nhy9EIFrRBcod5Agq6ylr3XryXPiJn9XAmoFm1hdkoy39bwtL+wT9?=
 =?us-ascii?Q?E8Zddu8C1HeQMwFkDNPhWZCzYl6tvy16gTEtJM2D41sdvX+U0gzj55XoiOCz?=
 =?us-ascii?Q?84JMA/wAKyxK3udm7JOwRjOFJSyE02ozpPFs5hVbd/iwvLiNZFYwaV0nzIkz?=
 =?us-ascii?Q?ShG6zh6A3964iLp98WsBw60Z5/MLCPtjK3I1TBJh0j3jKm3B4yn2dZ0XZJPd?=
 =?us-ascii?Q?NPcQQYHMdwfGeAta/eb1jnKBaCMjFuHOojqFHEY1ZLPalWt5Du3ovuEUbONu?=
 =?us-ascii?Q?0YJhETaIcqPEKdOcpuT3OLVGXOOLOTSVBWUI5eXbUUHfe1gfOEtVTsz9ENk1?=
 =?us-ascii?Q?0s2obxd2LbeXunwsvG+3OPPtjwcQ8FmykoovkEULbTMmppaQOV7al+vDqvZg?=
 =?us-ascii?Q?GLePNOR3LNmAaC80RjPLA0NM33kT7bBk+GzwiYYl6V/Pj2m9NPUm3IQvBSp0?=
 =?us-ascii?Q?d14Vpc3OlIEYywSkmAuUBo2L58Rpb4u5M8f/+6WI7HJq8Cm71kFvS2gMAHfi?=
 =?us-ascii?Q?KRZYzNsVU/gxiupYM9gDBGQLpCoRmwPqzuz3Kw/2bM29jSP8JmNuHCuGPsKe?=
 =?us-ascii?Q?78OGDR8IRMwi9Q7zluTDHOxZc2F4rGJHO+HzhAVxEFknt/IrPXgGgCtUoZ7G?=
 =?us-ascii?Q?pW+D1tN74q1XObdoFyGxCscELm5YGKRyRHCQUmrpN2aPNLMRsvBGu57uQ0gN?=
 =?us-ascii?Q?Y/yf3VxyWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476f5a97-18e2-46e2-b5bd-08de9c6c6bf2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 10:31:01.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVKsjz65cpXyXQBBVoI2mDlSDWZFt7q4NnuEzAbgRydG+oDGqPYZ+C5iCYYT1Z5ePeSiTu+ape3wvAdHQUTFtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58997-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,linux.dev:email,collabora.com:email,ideasonboard.com:email,sntech.de:email]
X-Rspamd-Queue-Id: 7AD0241A2C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 09:21:44AM +0000, G.N. Zhou (OSS) wrote:
> Hi Krzysztof Kozlowski
>
> Thanks for your review.
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Wednesday, April 15, 2026 4:10 PM
> > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: Michael Riesch <michael.riesch@collabora.com>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Heiko Stuebner
> > <heiko@sntech.de>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>;
> > Frank Li <frank.li@nxp.com>; linux-media@vger.kernel.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev; linux-
> > arm-kernel@lists.infradead.org; linux-rockchip@lists.infradead.org
> > Subject: Re: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
> >
> > On Wed, Apr 15, 2026 at 11:46:55AM +0800, Guoniu Zhou wrote:
> > > The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
> > > only difference being the use of IDI (Image Data Interface) instead of
> > > IPI (Image Pixel Interface). The binding constraints are otherwise the
> > > same.
> >
> > Nearly identical with some difference really, really suggests they are
> > compatible. Express compatibility or explain why they are not compatible
> > (difference between IDI and IPI unfortunately does not help me).
>
> You're right that they are very similar. The key difference between IDI and IPI
> is in the software interface:
>
> - IPI (Image Pixel Interface) on i.MX93 requires software configuration through
>   a set of registers to enable the interface and configure data routing.
>
> - IDI (Image Data Interface) on i.MX95 is software transparent - it requires no
>   register configuration and the data routing is handled automatically by hardware.
>
> Because of this difference in register layout and initialization requirements,
> they cannot share the same compatible string. The driver needs to know which
> interface is present

Just include these key information into commit message to do judgement
it is not compatible with imx93.

Frank


>
> >
> > Best regards,
> > Krzysztof
>

