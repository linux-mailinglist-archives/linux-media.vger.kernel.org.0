Return-Path: <linux-media+bounces-57163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB5FL+lcxWlM9wQAu9opvQ
	(envelope-from <linux-media+bounces-57163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:20:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9F338477
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 566363081031
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509E24035D0;
	Thu, 26 Mar 2026 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RazeuMtE"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720283932C5;
	Thu, 26 Mar 2026 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540693; cv=fail; b=pvxSYhMe48TIWGOkVlAr5li9zOZ2phd3/+2r61AtX1PYdZQSYPwnCJvAB73hLv/H4faJ91KNzI9gVqr3uZQJZmbLzNfgqdFhZzNC92kmzXZWkNdc/hcL424h3aG1umUeAG9eHebaPUtU0iuatMv4WrBR4KJZpTQCo9lp+dNUBZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540693; c=relaxed/simple;
	bh=cA+5ujOV+gUIFLAo4QOH+rj9MqqUzzJkEEGG9dItTYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DjAHd+R7/UejyiQoN186WtY8f8ok3WKhggB61CDQfxvkbYmM6IkypUPoCrHmeu9AuB2G3AVUTd+IQc4ReDKFSrctkEJ7DASTMIyA16EP2E8t1y6+zKspRyjtfxROqdn/GXfXwXhsLzkPFBQCMyVT0cKOpVjDGIGgAzyKkxcqxKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RazeuMtE; arc=fail smtp.client-ip=52.101.69.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP0n/3N++xMIUdS7tTEK+3Xvl57waFiRRkShvX7Cmm9ufcNHiwnRuEw6NE1Pu/ekJ3GNA9VX+RqUzQ1AOhARcoETpne9M0wqVpnIU+tYd/DcaX7GBoDXY9OkmgqlWMFvvksuFsVvvzsjMjlPbajrqUxzNeMI/s8yVjPDFenJ1B2G7Ier716w+TroNlBqysXHIFZbv8e1ZS9vGkMn94WffyUIJ6wWVICrCrhDN6W0JAZqvTuecO1Lig9nUntUKnnSDZnMcWw6GTaiLsr8wZxc5W7UfeAqzuqGc2P33WJcPLBEZ22mPve6T515pb4fjPeK6uAnLjKBgJPnvdG8IUNmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JZ0FfDdnlixNx4zFT8GXGx6gj+gUGUDPyPY70mgnqo=;
 b=OBvzrQwqb3HihKW6oy0eDziFdU1iGup7JIcedDacVBCw5UaveY+VIlK8yX/IuMraTMctSHpeKiFkE0Vjmrys3cVxlmRQXqh0EMAS2Tq1QB45ruShQN+1+2P3iwoz440QK2pOLxKnbCZWW0Fr/cpxdzFD07fW66qJ1I9kmWMMAmp0k07B2MeWl0UVTQXEylDJooh4K7RxBYYMcujje7E+KY5IhfgxNrryoMwgOZMvQhLbdztdfrwW/mVFS3jyzb1CJ4omyukeCQXtf4d4F1/OtA/aXiree08TVanMtbFienEQ/94QrvQyHUNBaYfy8DiaAhq58uZ3E08Z1p34yfu0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JZ0FfDdnlixNx4zFT8GXGx6gj+gUGUDPyPY70mgnqo=;
 b=RazeuMtEnlcbLWAgfo8kP6fBqJgL4ZyK58BdlAWs1QM8vzrMi3vM63F+ISUVUWxtUR3ScXaj2yba0B4IxMtTWjBS1OAgBeAHkVCVXfIHWU4NLjBDFHEg8zBme9gkIKRB+S9kumeTuZgS6+P2VZKeienTnGG2JStP8aZOeRIbr7IJuaj8ttHklH6WyCeZEpC9j1gfxKyG0yk/Yt1vJI59vzbeag89X3ajFDQgGNjMuJiqTsJbIMs4v4ZIQ0yAMYcAExhgQXrOzHVrja9gUfD405eVssLwBaxeo7H+WVr/HshXtY70AsrppyZCXcqP7+wS1CznqMfAaRRDgNtj7p8J4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8680.eurprd04.prod.outlook.com (2603:10a6:10:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 15:58:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 15:58:08 +0000
Date: Thu, 26 Mar 2026 11:57:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v10 0/5] Add MIPI CSI-2 support for i.MX8ULP
Message-ID: <acVXhxohG8RS67_U@lizhi-Precision-Tower-5810>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
 <177453839102.4969.6512848643800500076.b4-ty@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177453839102.4969.6512848643800500076.b4-ty@nxp.com>
X-ClientProxiedBy: PH0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: d588cc2a-66ea-4eb5-10ab-08de8b507919
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 PsRm69/SBh3QBlCmKzOiyfVToOiihOwur2A34ycFvtkZHlXr81iUUm7Nb8yY2pHFA1I7NiIc+lpEKp10CTDKVVNcTYrVr/z+AZMH6mfo9di3dujyKYlHmtV5hqHgB+p9Exi8L1RHXa0zOT4sP4vmpOImtQCKwM+zwrY5NeVGKPMsG0PSGkKmnFF6aouZRZWq2wyMvcXQs9ReiB47jX3Groi8xMNIqColY6V5v1aFBikX5gsa/0DsLBj0smjWFspRFkHzDNRvLkaItR7AZnNkf42xlkEBUM8eN5+EswhSbbr3PQaG5a7K+T9lNSE9yItPfC/8VVsMkDw6Y3w8jQ+Hsnba0mOMCk6Re0V/ny9x2sphZrx7VPVwG4teDRGCfTHQnlFGmAZEDuRy4AMr6RrlkcBNfH8mFpqeAZV1LFIiEQetcuzW7yE6+GYxjyjCeCtKSVuK1T7T7TiRHkIOSI1URGTr/YRaqaypfNQxko1mauFVRUSnV6GQzu9xTkTe8iBPVkzOpMo5pRvWQuoTSiZrXSIcWPh0KZVyX0er64fk8tbHHqjWYAnQL/ZgpJD6zszS6z8oaf9sXlG0feI2+9hKDDZppk9ogfoXGCk9+YfeakXiR2ov3CEf/p8tpB1VLBXfTdBT3sM7ZyXOvxa5h02ijMYmaBAkHS61iLrJ/9ERRpEEUgqYuXA6Oc+6cPmpxiuDoCaHZcfYSWtrurCIrE40ULJ7PYOaGhQfUs0iyA1MeX+zs7wL6jw1avXvKmzWHyWaxrmFtnkrMXII5ATmh9qTlRvnilOHFB2DH+JibFFvY3O3Ts8tFRU3H9MV/kiDRcuH
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2gNUspJfN1GF5NTYltQQtDE4+EyuvmWrG10FTpjM36A7BCfsyqEXCQbLxSgO?=
 =?us-ascii?Q?e7Cm634OzPb9S+WfFp4Mq3xEDCIyw6BHtZt9iGJBCwrNi/67vDClUKAJEnvi?=
 =?us-ascii?Q?rynNf8JwFgUf+mwFcgFTeEydybzo2wZHUc2+AAT81o0S1M7OFatoIq6Cgxvd?=
 =?us-ascii?Q?LQfIZCPmSJBvFXjGHVv4x31nGdk9X94CoicQEo5p065MH1pgDAjpgozQIgOo?=
 =?us-ascii?Q?8YcznbGw+NiOYHzzaLVFK7ieDtX1qoUGyXU+m/1PhukuzYssgA5cbhz3aWSb?=
 =?us-ascii?Q?HUDziYu4sZK5MSyKXklla1vYrzLXtIaqcN3Hc8LJM2mSEiaYyrrALajG1uy8?=
 =?us-ascii?Q?6ycKivxNnrPpW1PpQ5ZIXnPmoRFsP8gIN7ACuHHaIFVlZyRpFZHM9BiruehT?=
 =?us-ascii?Q?ay2Ul0Rgx1rZFPP4PiGt3ogrnqnfptfpdlooQGRUBQxiggLvhG5frZS98HIt?=
 =?us-ascii?Q?gG+1J6oXwX3XVcqCr+3XIGribf4Ux+u0sTJtU7unB/EyGISZtjwSBxtvmtTU?=
 =?us-ascii?Q?iC3n2lYahwomgzHjaXgmt0s6I9tGkL/Iv/pUL2kM2i/O3IbRqLX5jpssl2Ea?=
 =?us-ascii?Q?9hHshUw4NUkKPKSJ46EYbPqUy8SjbnSpvxHwgvpWNT5GzEsBhKJu6HAH3ghj?=
 =?us-ascii?Q?d/fpeuReMoK9WAra8S6fKIBNVkWpmxQO8wCvNqij91hFQdyx8b9zUWC/DRjH?=
 =?us-ascii?Q?GB98pWDB+lbg0kr+PnObqjTbXqlQQs8JyFGGPCrMUYducYp3f6Bfe2FGGh0p?=
 =?us-ascii?Q?Nlt8A/tNr3D9+g7OMWVZkeOQ7Hdz2pYmeZ/yWBuWjJfUFIXHE6/RctTwB67u?=
 =?us-ascii?Q?0SvFNb1ffBTUgJpfKHQcwn0yHyDJ7rwf3VONVK8ie3O/VdmLSmsTqRDzwEJJ?=
 =?us-ascii?Q?+CU3r7UKHO4qbxmJ5IepA3xcfYw0TEawyKXLHpX3iU+lT2fKhmBKRvLODQBb?=
 =?us-ascii?Q?p7JIn12GIvCAbEkzsF+Mvsk2E3829kXQ9g4vumBEAtZN75TxoaSpt4vsUNsg?=
 =?us-ascii?Q?89RMXCayErzRFFRR54i3UiH3SK8Xli0TL0Hfrxi0wKqY3oYaherp0jxeYEHo?=
 =?us-ascii?Q?7RgtDeiOA8stqk5fa2JUwfFo5b0nhGzcA1mmoIUVX+d/bSlglziX/syQ2XAr?=
 =?us-ascii?Q?vXgLwMMOj7PPxTqnU8qkLB1/uzHK7H6wmKx0D9sNY/jsLj84ahngQqJMDn35?=
 =?us-ascii?Q?LLBb8YoQzBfHdrnaHpCNw7RtjzG/j2bZQFWVRf50Me05nQzJZc58E4PUUM1i?=
 =?us-ascii?Q?vO6wvsCoRAW1oaB/JSCsSfKF8a5Q5FltzPEiqEvRums+BKd0iWs4xZn80upC?=
 =?us-ascii?Q?sfI+p0Io6T3TlPpFCDPADXljsWV6Su/NNOkOmtt2fXa3qveB2Al/mkQouNHM?=
 =?us-ascii?Q?k2AXebMOEINVxBbL72WBXxJCnF05MOZQbRwQqSXIL1PMjXFTREI8e7zQmENc?=
 =?us-ascii?Q?p5LnYeNP3HyFuHSonmwmtOafcxJ3pyPJ1hPIbvNqbgYEpNpSKa9YOWm+ealh?=
 =?us-ascii?Q?agkPfp4soUmb0kgYytBYjVxENBW5uxEU52NLYTWPXBJnhabu7QcljIVWevDS?=
 =?us-ascii?Q?rvnMgub2JcwhdISWzYrL+mDiDL0tiMwis+NTdh4Fz6ooZeLnQmCn5UFAe7NT?=
 =?us-ascii?Q?evAayikazwiihRN/WZHOU3fKOiolEX1YwVDB3sGfmtmWkwkwfQmA8XOqVy1C?=
 =?us-ascii?Q?WCQhq8tiAo6cLKzc3LrRr1W3xpb2obT5NauVGnAJh+QqZa/6v7YWOxpgPgCG?=
 =?us-ascii?Q?Jc4hPSYPwg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d588cc2a-66ea-4eb5-10ab-08de8b507919
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:58:08.0390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QWJcIRRtFI1VhbbQFIziRuFY0WU0HYRq9k0F+JfN4sW/dxnttwDsc72cECOe7KNXYUNmvUq0BRePMfybHMetQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8680
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57163-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,posteo.de,puri.sm,kernel.org,pengutronix.de,oss.nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: BCE9F338477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:20:54AM -0400, Frank Li wrote:
>
> On Fri, 05 Dec 2025 17:07:42 +0800, Guoniu Zhou wrote:
> > The serial adds MIPI CSI-2 support for i.MX8ULP.
> >
> >
>
> Applied, thanks!
>
> [5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
>       commit: 73f3ca0f85285b2fc4ea05affb9a44bf899cd595
>
> Add extra empty line between reg and child node.

Guoniu Zhou:

I have to drop this one because miss <dt-bindings/reset/imx8ulp-pcc-reset.h>

Do you miss some dependence?

Frank
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>

