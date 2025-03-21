Return-Path: <linux-media+bounces-28571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F5A6BE52
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2705117C249
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBC01DEFD7;
	Fri, 21 Mar 2025 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="HFmvDoZW"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C18F6B;
	Fri, 21 Mar 2025 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570921; cv=fail; b=WVsdhcDZD1QxWazswuRc4u//tAiKs+YV1hTZZzM1LrtMtmZgUn6Yv9tLZL6cH9slUb0kAP1+yDI7VPNV8KkG9EqfkodiL5nozCDNmtuGYlBp/KofMrcz8bEcdyWaJVgeAiH9Vp6lYyv/ulJD8uhufddm4UwcC/EdmuZxE9zcj5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570921; c=relaxed/simple;
	bh=GT66OR/TfXZosDmgwJpVpX16ked7tqlzXWaQ5RY1zGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ea/ZDQQS4V3FJo1HoQ32IIp14eF9w5J+oOVfIt7h2zg9MXIfUID0I+PPXllEiWIx+2rhB7LOHmNxUiJIHTw+e9+0XsxZMc8ytSAoDaws+D0utqo6h3E7iJu5tPSbV1rK2by+ndMx7rs+FV/XIE3uVSx2TsBwQbeGnHPNSQw0Jfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=HFmvDoZW; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQ/I5Tb2vqol/9OwJYVKzMjqOeYQcQOrO7RLGkfl1/9baJRLu7BGnM927+52R1F+qq9w7ilwr+TLVZvK5cAOS40Bho3TpNF6hMPDKmSTbMnn5DningEIdSFZfQO0u0Nq1vc/xovAAm4VDHGOvkmAK9wn61l+3z6pE9H16ukTQOdV/9/vU2szVQNsHVL7GFJ7bN1r5k67rRuUOGKQ2hIrS4Gu2scnB2BwvzOOD7aJ5TXbpbtK5qn7phcgTbqJF+qFre8tDZAktxZxVg15jXRRXhwcioS/aui3t2BlAMsKVObDgnRVr6ZmBvxB2EnUTZuC2h5wRCojUndo2Zmzb3NhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5y3Rrf8ArReGueGgxWiorizW1VB8KJ41hSwaVlC0bk=;
 b=qcayoOjpYJ8anv3Egmt6Xgv8mgR2iGzriPIsmCKVUpEYj5cMqNkPmJVt7XRDhwJ5IWNfmAuP5C6ZtFf/B89Tnx2BeZ9EH1tSS+xIsNBejtNGJHMMk1Vw2bJLTdEwOzEjKfq/7Xlmj7D761lG+MQH834tLJ8Rn+nlG9+pURh2D6cIrr0T0nOPEkraa5cGKJU59Oz+lIbnQ5tTnGCf+etoizFCoWSPWhHW7shP0fQVKYzMwFcTtO41QjxJ8qWcHgcarPNfosJBOtPxWIRLpCZ0bF7zFo/fsJij4Be0evQkQW8DYdHcLo0nMgYWAhX9D8Z1BXZjSQjHNOtMGC496NtgDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5y3Rrf8ArReGueGgxWiorizW1VB8KJ41hSwaVlC0bk=;
 b=HFmvDoZWKjTVfVuU3nUhJ24kqzNcm6unpa4V3SFOyldC3NoV0kJLwuuagOJT0FF+J5/PGI7Zl3oQ4S6PruZbfAyueuw+7iHELyakIxX1nvN69M7Vs0ukIxs2YpS72+aLeBCNGXGjsOthkdJq5Vw4ieNXGPvboy5BMuYhloxmXoUlR3acrNyywWTICbFiVhXUVAa79JFZcJgBjfyrTLbGLDpJ288BsVIO76H4HPIZcfcQyVE350xpAxfSrTJkyElt6/Wkl61cFgUF5M7SS/8WGfqFQjkcKLPQ6euc/wU+fCdBX7yIcLzxq0ivJtYlN3A9hm0ccwh7vuN2LysC5+Wnlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8752.eurprd03.prod.outlook.com (2603:10a6:150:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 15:28:34 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:28:34 +0000
Date: Fri, 21 Mar 2025 16:28:23 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <Z92Fl+85ZpJmRL0F@mt.com>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
 <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
 <Z8r21Z2HthBwGDSq@mt.com>
 <Z86-AFnPQ2wXKidi@valkosipuli.retiisi.eu>
 <Z9RKllMJ0Duac83Y@mt.com>
 <Z9RP5K59sZwuphIc@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9RP5K59sZwuphIc@valkosipuli.retiisi.eu>
X-ClientProxiedBy: ZR0P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::9) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: d74c6ca6-e420-4f8f-30b9-08dd688d0b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HrDKbbjkel17aYrEXebiN9Ej9xlpn8A512Us+YZDMTtBLlwuo17/aeanXoaP?=
 =?us-ascii?Q?9EuCnnj/WHD0FOK4ilwtV9NWiy4YDj1uXQBhEebrDvB18xhSal+0Q60Bkcfw?=
 =?us-ascii?Q?a2h5gmZSYMfqAo894ZCh1xBmyUwCSAKTqU+V5CyhDCFeufSEoQYaOdwaT16e?=
 =?us-ascii?Q?bEFVR9dMFV45zH6NOuDW5qfjnpvaeliur2JR5SYp9ZDi6OR/02dVQa23flkV?=
 =?us-ascii?Q?Tw2KonVyrCCRPydTYNDfUCrdRMCLp7421zVGHBTApL14Sl0dOpak4jpWP1Gf?=
 =?us-ascii?Q?WAJdZLR1yXeuyLHGO08WWk/rIJtKfBBDnYbHlqprv19O+kQBp8UseRF2CtCt?=
 =?us-ascii?Q?fdLmtM9WEBu8eL16hGWWoWRMTxkO/ie0XbbhDW6AAf9GgbHmGd4a72JCaEPv?=
 =?us-ascii?Q?lmZ9afjFVUfDuZJHHnueT/FaIPDJJNIfUY1iJ9baqFpHvI5DS6P+yA5YlIUA?=
 =?us-ascii?Q?Hmy7NkLo5MACRQzyPAz21DkWItOFAWHJpRex3Q4k8CIkS2xo46Kr3c4vTNm4?=
 =?us-ascii?Q?YO2YEbLxPfJA4a9PDWEdFGDjModhhIuAfUf2wZPggZWVmQ6hRwnfuXX45JNk?=
 =?us-ascii?Q?IciNs5008i3FZ38yIbT5XymvqwlzmfeY3ZTTQwP9yFBoWGTeyCtP1qsmjUkw?=
 =?us-ascii?Q?0VJlTc83/r72xUMk8PuwCCjZUm3SPS5K8HomuuFDDzmK5W1EqN5gBLaLcDju?=
 =?us-ascii?Q?4xlq3VSCzbly6JhGRroXAiwNfokPkGgzkrL2hXBRQ0vuXv2enwZdzahSC6J8?=
 =?us-ascii?Q?pleZpj4Y3PQoHCGxxM2XnGjVm3721DfU+Lw4xgsJU+j6ZOmG5eavxG5AlAGe?=
 =?us-ascii?Q?GwcZCTEpldvkEvCa8W7rs3+dYjBwz74OD3Df53FmnZCs76DUWiR00PuK9lHJ?=
 =?us-ascii?Q?B7qgIBSxcVuozeCCIWoRxR42S8WUD7VWh8RNAXEsz9VHUOHBkLu0u4Fa4VK3?=
 =?us-ascii?Q?VzAJ6aGhhsypKVz2Xz0P175S/mY+NVbmLuIUqZLrMHEG4ZGR66sBrj7hg23L?=
 =?us-ascii?Q?g3V+aUgLelMemeP6Ir/sctopn2pa6GmOKVdbBEbXKEXg+agsZTcl2HYQPptB?=
 =?us-ascii?Q?XyzkoZqNcr+iWnR8dDaDpjnBlFWPAvNoF7IgsHiwn4WcJSwo9Grn1oppzt+c?=
 =?us-ascii?Q?DrWDUpqqTk5Np44lF7hpm0u1Dq3+Nq3upGsKRRhX3YsQh/P3wHDVgrVe87jn?=
 =?us-ascii?Q?v2IpSOwxgagcYiyKNeWm/7rhD5BYjRTMyXQhrJQZ2oGvIqVcwtQd94/FtYMC?=
 =?us-ascii?Q?IldOoKkfgKr3ZFKi3/sTbzuUkyfezoK6s2SiuXH1TwCvtcHyqAjrzyq0Pnnq?=
 =?us-ascii?Q?NxKWF/mu+Ke+Y3UetgCHG+KM/n5Mx8SoGS0t5OkhO0Q/yZgTcgsASQUZ1aic?=
 =?us-ascii?Q?IMyJTh1naEwghQ/aougYsadfWTboYfSNd035ix6F0iijMa4Yz6VFrrMBMuTe?=
 =?us-ascii?Q?EuL+D3OueFeGqqCuWaUjoYhuH0xvYvHx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1PtvRGrJsiOuj/AH9M8x6O300blhERcsrFiwP1Ny5BAjrsb1ki13r5y6806l?=
 =?us-ascii?Q?wCc2nBUZOn8EKs/GDBWBlvCGiEBKO+jSBxqsnD8e1bxAtZbZN7Iw+nhL5ZVG?=
 =?us-ascii?Q?gKla49Gi71hNq4R/pb9CPJwQjUcr4UjAgb+WGroJjkanu+eOuvOz+mLq1Bz0?=
 =?us-ascii?Q?a/J5658P05M+dZG3hdZJsWd/Vf8yIVflcxUxZj1sYzU6hcPpzuCR4GkPAxHA?=
 =?us-ascii?Q?nqa44gEaj5QDRL3Xcm14EmWDYm5gwafM2uCM7+8ZzjCzmXexUqgKA/40293L?=
 =?us-ascii?Q?KY1eVHI0oNtxdKaOwBeT0cer1tn2dhiQUVAhLOe2D1RR/aYrjFXI+/zaQnDT?=
 =?us-ascii?Q?0Bnh1RaAWuWas4oBLf/v9VY8RDTggIBeA6F4vbVHMQLxIpY1s0YPt69kUq6v?=
 =?us-ascii?Q?nTHyTkZAJ3x0WKf3kw+inumRc8qCyioCYfBkXwK576Wv8qCorrdLZv0Fb4gz?=
 =?us-ascii?Q?E8XIsPp0QqwR3Jyi8f0U6vXNu6QEJRN6rg6FVYXETMAtnKToF5YmJiYa76N8?=
 =?us-ascii?Q?Eq5k9cDTujl74u2BcGt52yIpSQjZnetEHjhhR79KxP2dcUZivUYONkfnEa9R?=
 =?us-ascii?Q?S0r4O382kk9J2mWGrKL9Aw+cFSuhjPRa5nbH+OUV7ewsQU4yU+jjiFhscdqH?=
 =?us-ascii?Q?qpqDBDYfEKV0slSDbcXxqY2aVtxsW3icOwgbJCHeC6osJbbtRI/Nc8S/Rv+q?=
 =?us-ascii?Q?AmbsC3XVWGwbbbb+c8oG9kaG9ROGamWMelM1GeErwyvzMsvT2RrGBN49hSEH?=
 =?us-ascii?Q?glRCl5q7WC04wnBy8hf+jCHayED+kqLy1vmnGCpoczSJMYrDygYBu37ssZbT?=
 =?us-ascii?Q?65DjLk5m9/EAR4MYtG/KUNQxH1yvdwQ0xifC83Uh8c5Rkh/mrfDPpxD/4pws?=
 =?us-ascii?Q?tOL3o+q//we1fepOBDjQnj9sEVI3rccWqREBGxpV5ZJVtn4HDjLk/I5Nznl9?=
 =?us-ascii?Q?9E4TrdVoSWVc58udsOw41kNsf2ddGD99C285vHL3pzIgYPK+bce+YoHVWXyS?=
 =?us-ascii?Q?iC+WAWcpeu15gzg56gj3xdbp/5PUmD+/tsGCMO1SKZMBdvzGUXDJITcOBI0m?=
 =?us-ascii?Q?sqEvAJThTZB1izj19F8abWFMJjog4EUjb+4hj1aXAw1C0IWQC+3BkLaDptlM?=
 =?us-ascii?Q?mfZStZsVtgzGb+y1C3ZKGP+seMOM6hrP+skdS8iWFvDioZxX2nbgMlxdbxMR?=
 =?us-ascii?Q?aeivdB8dTww0OMcs/+O2H4EJ6AWBIXBVScMt2So3Oyt0d0qUGPt+/nGQU4bi?=
 =?us-ascii?Q?jABBVZIb+vW9tQFIKdwOPZBi3dQuEnA9o409IzrVOYa3M1aAIVtoyzYnfVJD?=
 =?us-ascii?Q?s13ijN0okBwPgU+YDcn0DIjC3T3EjYYjw0sGfsw5/7izukeIIMwbEYELQDV+?=
 =?us-ascii?Q?XYjVQUVRRRH8ZaISHjLv4mK75nyqsKAFtnGS8r+kBGCsEHhgST9vUX6Kg2kW?=
 =?us-ascii?Q?5gOTZLqIZW6N1IVBzigrSpPNMcmbMGD25mKvwlbnjGNlPDeuDI9VKK9k+9mk?=
 =?us-ascii?Q?vbA1zbE3ky2i7L6AhW6qqBMVOgzRfa6wdH4YK9udHNnQtXx82fah9Tj50bMF?=
 =?us-ascii?Q?K0OaeE9hKFQEB+r1eJ4xyB5CHVhy96rDTvfEXSGD?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74c6ca6-e420-4f8f-30b9-08dd688d0b2c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:28:34.5324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /V83NLp252sjX9xC25NtBP4Fgpk3gQba5jqUnlZr/a8WxI2r0R4J3AuSSKOuV5FXr+lvaLSOcb1ATODVwS8ymg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8752

Hi Sakari

On Fri, Mar 14, 2025 at 03:48:52PM +0000, Sakari Ailus wrote:
> Hi Mathis,
> 
> On Fri, Mar 14, 2025 at 04:26:14PM +0100, Mathis Foerst wrote:
> > On Mon, Mar 10, 2025 at 10:25:04AM +0000, Sakari Ailus wrote:
> > Hi Sakari,
> > 
> > > Hi Mathis,
> > > 
> > > On Fri, Mar 07, 2025 at 02:38:29PM +0100, Mathis Foerst wrote:
> > > > Hi Sakari, Hi Dan,
> > > > 
> > > > thanks a lot for your feedback.
> > > > 
> > > > On Thu, Mar 06, 2025 at 09:13:46PM +0000, Sakari Ailus wrote:
> > > > > Hi Dan,
> > > > > 
> > > > > On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> > > > > > On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > > > > > > Hi Mathis,
> > > > > > > 
> > > > > > > Thanks for the patch.
> > > > > > > 
> > > > > > > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > > > > > > The imx-media-csi driver requires upstream camera drivers to implement
> > > > > > > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > > > > > > implement this function are not usable on the i.MX6.
> > > > > > > > 
> > > > > > > > The docs for get_mbus_config [1] say:
> > > > > > > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > > > > > > >             The media bus configuration is usually retrieved from the
> > > > > > > >             firmware interface at sub-device probe time, immediately
> > > > > > > >             applied to the hardware and eventually adjusted by the
> > > > > > > >             driver.
> > > > > > > > 
> > > > > > > > Currently, the imx-media-csi driver is not incorporating the information
> > > > > > > > from the firmware interface and therefore relies on the implementation of
> > > > > > > > get_mbus_config by the camera driver.
> > > > > > > > 
> > > > > > > > To be compatible with camera drivers not implementing get_mbus_config
> > > > > > > > (which is the usual case), use the bus information from the fw interface:
> > > > > > > > 
> > > > > > > > The camera does not necessarily has a direct media bus link to the CSI as
> > > > > > > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > > > > > > between them on the media pipeline.
> > > > > > > > The CSI driver already implements the functionality to find the connected
> > > > > > > > camera sub-device to call get_mbus_config on it.
> > > > > > > > 
> > > > > > > > At this point the driver is modified as follows:
> > > > > > > > In the case that get_mbus_config is not implemented by the upstream
> > > > > > > > camera, try to get its endpoint configuration from the firmware interface
> > > > > > > > usign v4l2_fwnode_endpoint_parse.
> > > > > > > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > > > > > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > > > > > > configuration.
> > > > > > > > For all other mbus_types, return an error.
> > > > > > > > 
> > > > > > > > Note that parsing the mbus_config from the fw interface is not done during
> > > > > > > > probing because the camera that's connected to the CSI can change based on
> > > > > > > > the selected input of the video-mux at runtime.
> > > > > > > > 
> > > > > > > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > > > > > > [1] include/media/v4l2-subdev.h - line 814
> > > > > > > > 
> > > > > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > > > > ---
> > > > > > > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > > > > > > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > > > > > > index 3edbc57be2ca..394a9321a10b 100644
> > > > > > > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > > > > > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > > > > > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > > > > >  {
> > > > > > > >  	struct v4l2_subdev *sd, *remote_sd;
> > > > > > > >  	struct media_pad *remote_pad;
> > > > > > > > +	struct fwnode_handle *ep_node;
> > > > > > > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > > > > > > 
> > > > > > > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > > > > > > field to zero this way is redundant, just use {}.
> > > > > > > 
> > > > > > 
> > > > > > I was going to respond in much the same way.  This is equivalen to:
> > > > > > 
> > > > > > struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };
> > > > > 
> > > > > Thinking about this in a context of parsing the endpoint, in fact the
> > > > > bus_type should be specified. Presumably the hardware is D-PHY, so the
> > > > > correct value would be V4L2_MBUS_CSI2_DPHY. This way
> > > > > v4l2_fwnode_endpoint_parse() doesn't need to guess.
> > > > 
> > > > I think we must use "bus_type = V4L2_MBUS_UNKNOWN" here:
> > > > 
> > > > The i.MX6 has two types of camera interfaces: Parallel and MIPI CSI-2.
> > > > They are connected either directly or via a video-mux to the CSIs
> > > > (See IMX6DQRM.pdf - Figure 9-3 for the connection diagram)
> > > > 
> > > > Pre-defining V4L2_MBUS_CSI2_DPHY here would let
> > > > v4l2_fwnode_endpoint_parse() fail if the camera uses the parallel bus.
> > > > 
> > > > We could distinguish between MIPI CSI-2 and Parallel input by checking
> > > > the grp_id of the upstream device like it's already done in
> > > > csi_get_upstream_mbus_config().
> > > > But for the Parallel case we still can't know if we should set bus_type
> > > > to V4L2_MBUS_PARALLEL or to V4L2_MBUS_BT656 - the i.MX6 supports both
> > > > formats on the parallel interface.
> > > > 
> > > > That's why I would argue that v4l2_fwnode_endpoint_parse() must figure
> > > > out the bus_type from the fw node.
> > > 
> > > Right, nowadays you can indeed do this -- it wasn't a long ago when you
> > > couldn't. I presume the bindings do specify the bus-type property is
> > > mandatory? Where are the bindings btw.?
> > > 
> > 
> > From my understanding, it's not even required to set the bus-type as 
> > v4l2_fwnode_endpoint_parse() will try to parse the endpoint first as a
> > CSI-2 bus and in case of failure as a Parallel bus if the bus-type is
> > unknown (see drivers/media/v4l2-core/v4l2-fwnode.c#L493).
> 
> It only exists for compatibility with old drivers. Do not add new users for
> this code.
> 
> > 
> > About the bindings:
> > 
> > There are bindings for the MIPI CSI-2 receiver:
> > Documentation/devicetree/bindings/media/imx.txt
> > I think here it's not necessary to make the bus-type property mandatory
> > as the imx6-mipi-csi2 driver enforces V4L2_MBUS_CSI2_DPHY anyhow
> > (see drivers/staging/media/imx/imx6-mipi-csi2.c#L677).
> 
> That seems to document a CSI-2 to parallel bridge, with support for four
> virtual channels. I'd suppose you parse the ports knowing which interface
> they use.

Yes, the video-mux has 5 input channels: 4 for the virtual MIPI channels
and one for the parallel port.
I now used this to determine the port type before parsing the endpoint.
If the parallel port is used, I must try to parse the endpoint as
V4L2_MBUS_PARALLEL and as V4L2_MBUS_BT656 because both formats are
possible on this port.

I submitted an updated version of the patch.

> 
> > 
> > For the case of a camera with parallel bus, the camera endpoint is
> > connected to a video-mux and not directly to the CSI. Therefore, we cannot
> > make the bus-type property mandatory on this endpoint as it this wouldn't
> > apply to other use-cases of video-mux.
> > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > >  	int ret;
> > > > > > > >  
> > > > > > > >  	if (!priv->src_sd)
> > > > > > > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > > > > > > >  
> > > > > > > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > > > > > > >  			       remote_pad->index, mbus_cfg);
> > > > > > > > -	if (ret == -ENOIOCTLCMD)
> > > > > > > > -		v4l2_err(&priv->sd,
> > > > > > > > -			 "entity %s does not implement get_mbus_config()\n",
> > > > > > > > -			 remote_pad->entity->name);
> > > > > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > > > > 
> > > > > > > 	if (!ret)
> > > > > > > 		return 0;
> > > > > > > 
> > > > > > > And you can unindent the rest.
> > > > > > 
> > > > > > I was going to say this too but then I thought actually this needs to
> > > > > > be:
> > > > > > 
> > > > > > 	if (ret != -ENOIOCTLCMD)
> > > > > > 		return ret;
> > > > > > 
> > > > > > Which is weird.  Better to break all the new code into a separate
> > > > > > helper function.
> > > > > > 
> > > > > > 	if (ret == -ENOIOCTLCMD)
> > > > > > 		ret = parse_fw_link_config_stuff();
> > > > > > 
> > > > > > 	return ret;
> > > > 
> > > > Good point. I factored out a helper function as suggested.
> > > > 
> > > > > 
> > > > > Indeed. get_mbus_config() presumably wouldn't return an error but
> > > > > correctness is usually a good idea.
> > > > > 
> > > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

Best regards,
Mathis Foerst

