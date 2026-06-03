Return-Path: <linux-media+bounces-63645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ig7zIi+EIGpZ4gAAu9opvQ
	(envelope-from <linux-media+bounces-63645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 21:44:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F308B63AF3D
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 21:44:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b="JJhl2T/A";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63645-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63645-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 889AD301FAA7
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 19:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FB948BD5E;
	Wed,  3 Jun 2026 19:43:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1D37DE9B;
	Wed,  3 Jun 2026 19:43:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780515788; cv=fail; b=NiF1Ane22E86unAWsgL0XeFkO8euCmAsvjj1jiV2RKfKK7zZ9srK48CgjeoSioBlQLOnR9ENZqLehnALWriativVtuu1NYlbNMGcImRV3K/47Q+EEQ6NwbqtQVf8dGOrBfbOW9FYsQpBP6Vs1LH/+uKu56KupDriRh2Fjyiv094=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780515788; c=relaxed/simple;
	bh=aB13LgVq/L2DWo0Ekuvdvi4g8/M3R7VwwsF4+qquw34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=THqc3RReR19V38fKx6SoxcByfSIeyukBUIh9pYBU4KFzlN5tVxT5QbYuYEMDautWoeXyrfGbDsLX/Rz933Q1dXlmGYuiJH6Moq3MNq03ENM6TIvA0bYPetVqAJ/RNV6NOEhpELexjW6J9PqkehlWw35isodJbAY0iI4dDN+HsgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JJhl2T/A; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHlgF30iZXmiVMUQ5V9B2lgTtUy+WMYjcXqMORIqBN3Az0g//lJSkC59PcRkBbn5Euc1+pBSFzDnRtBWD5bSeypB0oG2YQtvdoEma9e7Vl81707twTRa6ICV0dOFkale45eY/tx07peg9fHduAJQC1frJJCoXbaAZGun0fgvpCnnqpC960NgsQrr2C1WUa4yr04zUnKR4CrxCyjlLVxrjUJBc7wlBuGyFr79Dk8q3v/jAjeGDvENV8lb8y1/TnyYuQdC8u7LqoLJj/jazoRB54RNrxm1DL5dD4hF8+e0mdSxGYz+3EIlGgST+1HUchVGjRwWc4NOjGtsVQzKQmDcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yduLVxmi2GLphC9IxM2vMmrnnn8YFAzxNdAvoes5T4c=;
 b=ab4V+2EZyDnfWJ++Iq0rxR57kxf9Qh4Da3g5KxccfDlKNoIWmT0Fgu5gAOoK+3MB6IcsBADKpT2uas3jwOFhWv8U+YxEYiRB9sY961KT4fnd/PQOMR9Au1PRLzaNJhGUBtFDYlXEmxuDKWFlZPgxirHSnwIbZa+GpiKrxWDjHuRxQ2Q1ny2GnU/SEpEgwBfj7hXRH6pUKKiUj1KvXFO0d0wlfFlcmT3Sw6OtRgtQMDjsK337k3ThcBCpoWi5hihOdZanl96DpCgXzuj4gamHm35m3xw2g7FLVi3Ln7kCbKvXim1DIROh+J7MWWmDlb5YXGeFmisqQLZhkNuv8kBSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yduLVxmi2GLphC9IxM2vMmrnnn8YFAzxNdAvoes5T4c=;
 b=JJhl2T/AXk3E93bc/lxc9CIQkh6zCB/TGPQfS9OTBDm+5/V8Y/NL6WZGAq56o7evolxwu8mXuNSnXh0OkvuXXMkYM16UvKDpAgZyvF4oa7Dm9F+0foelB/aDGeQJ17jBUGiN5BF+C7bsFoBuqERldY+3Wnzq7nB6KuClpJvXdKqi7RmkMWWtDaumS5uWqFoS0fKRO9chMtMu+/l0S3by/K9IhTVHg00ipKDmhLH4lsRrNqXF6HRLUUcn3NE8ucrIiKn5o1Fy6xXog94FpPhWbFDTW4OfmRNcggTko04zd7keMTegBWZkB62SatXt/2s2MG/nXCus/wgq6WyF9U8msA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:43:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:43:03 +0000
Date: Wed, 3 Jun 2026 15:42:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Message-ID: <aiCDwpd9rsPf1FxR@lizhi-Precision-Tower-5810>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
 <aiBqGVR11AZ-QI26@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiBqGVR11AZ-QI26@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SN7PR04CA0165.namprd04.prod.outlook.com
 (2603:10b6:806:125::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: cbef7c54-56ed-4239-fdfc-08dec1a8536a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|22082099003|18002099003|38350700014|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 nUPT1SRAOCDHx02EXrSk0EkAy0wwgI0pkZsHpvZCjIMGI9Pmvx0mVIpAm9dW3rNhIjo3pdchUwTJ0EjHb06Y1tFgoknepocipTIpzSoeusX7z9RNQDEi0j/xHRpCvWhhdda/71y6QAG0Q3IoxJGNom3lfxBzSD5TVHrSE888GcmKLdots/mIJvqB3MpjADv13dSUQRex5ecikQuWxMVYt+N6NohtOG2meZAiSchpCe/DetiKm7UOy4uYcXbGKpXSR/sWsPrfRKDoO70Hou1iWRN/LD3yLqcRw15e0fYyQUj2EYSaWFn2tnuxTg6mdE3swobuE4Up2PQYTJQvT7LLtpUAvqXHu+TzH3ttoBeb8Q9ovf3aJY2pYXuYssnhx9DqWtDeVO3+6XNR48yLfbKwubVCwuMicNYLMfNz8l/6thuJ64sVx/oNTK0AkU1ZQBGluOrK81mUbl9+TgYjadakh9StP26zkyBQgit6y8VZmuhRdEgcn2ae6o9bujkfxEf+neHhHWWGMM9P5E7iSgnEWQI2aC71T4AQBgkwVC6vLrEHlJiIWVcfJ3lZ9tLDwDD11IBzJNX6F+iwPknnJiubZUjplg+APNNzI5P0+vCRBohweNJF/Y3lAfMTE7dMl9m8DjfGGs/236L9asH7z9buTtbZjBcxP9pmJX2UZJ5lq/kRNnAjl/WoCb25lxqI+lDcNhVKFMOIiG4xBlbdHmwdOAo8Pd6coinm+whkUDew81dhX1x2V6D6LSSUljXXi9+q
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(22082099003)(18002099003)(38350700014)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uHWcGGTqrRpWPf8CYSJcEvA3WGgzyVLe9XcNUWpCr2Lvg7yGVGL07IMCUVu/?=
 =?us-ascii?Q?4HbgiXfYFJ1smuFcAo8JOsaK7B33je6p0Y4RWv6gbOXp1GyRc7NrQkZmx1RD?=
 =?us-ascii?Q?vgiN4WtBCQMh2EXP7ZBBsEfKPGVH5NyAhCuDzRHZ8GsjhJo6err/bzYNzSre?=
 =?us-ascii?Q?xendYUEMCpDQ8wAR0z/hQlU7Iq+w4+1nYLVQa8AjoRUH9kN3QHI8cX4DLNNy?=
 =?us-ascii?Q?Jgd9UH65RzcBbdb2Yg2eukaQQRDCucMUCl6oSQgDW6orVE8DxmJnC1GBTC5A?=
 =?us-ascii?Q?Wp0zFGKBxqXxnRKZ51RgGN00Xgj/OafP0Plb47yCRWbj/hXL112lJwzcPwhL?=
 =?us-ascii?Q?ppGqGTIc0B8GJrIbgi+Ay/Mpp9j95zSw7ULTyU8YBVxcGS7zown/F4/UnMyl?=
 =?us-ascii?Q?Gbt+HV6MuSPsiMNdmlvbW8amRuNcb2EgsCiU76ivmob7IDcUnoUoxq/IBF78?=
 =?us-ascii?Q?pDaPwEJfDotr357FnWffwS79DQr2ZwkAi6mlFlHB8FDZA+oibBihV8Vl4ab0?=
 =?us-ascii?Q?MNA9PAAb+kaJLtDYkzzmVA/uZafZi/UZbro2a8sBsH/WaqZ6TwgoCjuDEeDO?=
 =?us-ascii?Q?zbPTTx+QceVv9wzIzMDxmBn5q/R5RVj1Gct/jNTvhYjfWQyTZEN4Dc3YFMSf?=
 =?us-ascii?Q?lZujHrJbD1dKDUEnS5ICoPJUP+xMjaXoewu407lobh/S05M5U/ALfpmJYiAh?=
 =?us-ascii?Q?XZ99WOQgT/ykStl+2lbWkc1t1YnnYKn0iqWT2DsTzf864qLDnVmg5K84yHpm?=
 =?us-ascii?Q?C339xTvtu3pIltl5fRItMllWtuyInQtj5TGOL2/6Hd8CFE3QJn5Uus5oylXC?=
 =?us-ascii?Q?B6zZv7VFNqQRRzEiCB0j+CICYfwP3gWoGTGiHBk6g/qiFKb+5b5zm00qdGeL?=
 =?us-ascii?Q?kGjj6QA/vIhFkWe77gpdaFMGvWhXdWcMLnoYiCQXDhIBFqmB1jnaD9iYGog5?=
 =?us-ascii?Q?/gPcKswLjEXQwvUnrq0DdRrvupOyTV4hJHBZIdpXR8pZSMCx2IginII+91+Y?=
 =?us-ascii?Q?LCdeyagzLwr32znNDXTyihHP+vLQPjPMsdFmHn6scfDmhjN3lymVYbAu7kL1?=
 =?us-ascii?Q?gxn0BrqZdLkVkKewpSdlfkpjNkcNy2KtvwPmXWGS4/UDquzuPJHF2isUzfGc?=
 =?us-ascii?Q?J1Cw1DHqVRXkDTJ+a5Xs9iSc+GPJgaJ2XVsHIZFlNVNvYUbITdYfZltwD7Mv?=
 =?us-ascii?Q?KGOg+Wy2w7LS0wORIq0llIGfCcrjEa5cbEzIqqycqcgKe2+odt7SvAlzVCOC?=
 =?us-ascii?Q?8sL5TxQcaHSUnmxmnegFjbfxYSx2I6pvkCrhuuqqe+ZaMbgHjCX7jReT7v/O?=
 =?us-ascii?Q?kUxqcZ1kKFiig2iVTJFSUnI1CUiSMukee1aN0G7AyKpGHGg875aS8ePxsP+H?=
 =?us-ascii?Q?1liIs/b2tlzjCobG/eAEwZq2iUme1kgYy0AW/PPvepkNmNL2NErWl+Z/aitu?=
 =?us-ascii?Q?vixd1uUNwibWKhsATVDE3zsVfOMJLc/zaAYWPRoesGkOa3WTaR3dC1FcbD15?=
 =?us-ascii?Q?BCD1pNyBSRQUIb1VoeNEOE7yJj4a9wxAuHkt/rFcczbHa5faCIGkkWLNZSgO?=
 =?us-ascii?Q?mI/8EEpo97EVozDmwULdDgosUv01mb4aoZcDAchZv/cwZuBj72mfBQphGTZa?=
 =?us-ascii?Q?PAsXYajud6xfmoulSpQzXyCADxWz5cSHefzG+XRgL36JTjrUiwmbwT2+eFaH?=
 =?us-ascii?Q?dRVvABfxeQ6cAklDMAq2/ZHbftHwN6S+aOfcr4a4cSyLxuj2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbef7c54-56ed-4239-fdfc-08dec1a8536a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:43:03.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42G7gMEziClagU5ZZMzi+t6YWjir0K5VETIF0Zsrvrkpx44vyTozjceTSjVswoAttX54gUYHsRwdAzFcb2qqSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63645-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:from_mime,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,posteo.de:email,linux.dev:email,lizhi-Precision-Tower-5810:mid,puri.sm:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F308B63AF3D

On Wed, Jun 03, 2026 at 01:53:29PM -0400, Frank Li wrote:
> On Wed, Jun 03, 2026 at 12:15:40AM +0100, Bryan O'Donoghue wrote:
> > At the media summit in Nice this year we discussed that cross reviewing
> > from different people on LKML was lacking and desirable. Laurent suggested
> > NXP/Qcom do some cross pollination.
> >
> > Happy to read and review NXP stuff in that spirit.
> >
> > Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> > ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Laurent and Bryan O'Donoghue,

	which qcom part I can help review, I can add myself as reviewer also.

Frank

>
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index efbf808063e50..8436428865aac 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
> >  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
> >  R:	Rui Miguel Silva <rmfrfs@gmail.com>
> >  R:	Purism Kernel Team <kernel@puri.sm>
> > +R:	Bryan O'Donoghue <bod@kernel.org>
> >  L:	imx@lists.linux.dev
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >
> > --
> > 2.54.0
> >

