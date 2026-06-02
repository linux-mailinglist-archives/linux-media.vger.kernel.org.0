Return-Path: <linux-media+bounces-63340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEfcKcZDHmraiAkAu9opvQ
	(envelope-from <linux-media+bounces-63340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 04:45:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1496F6275D4
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 04:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E12030C209A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 02:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E3F36309B;
	Tue,  2 Jun 2026 02:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kpgQ2IXF"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C833B6D6;
	Tue,  2 Jun 2026 02:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780367908; cv=fail; b=FFt+a7vZwrrCyImRe+VDduMCpudTZd+BYaZrtgo4Qp+1o1wD+hH105rfbcvY8uKud0trEPMiXSluwAQe8rMXI8cTPaA3wplBMeB3wu52heVtdDX7h3AXw65U0nymorlrtCBs2PV1sqQHHDLysSqYuhV5ETfUD7fH9sfJs4JwfyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780367908; c=relaxed/simple;
	bh=vRRWyy+BlhFzATTDES+4TgRxhYU7SRbKXyhOuhOoPCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dy6hbYLl1z2u0+CTasWXJ74tnjhXLnLvIxMn0qKI0WjV5dkNbG/gRvGMbygJXF7ma+9tQERQMv8ttnVdh3TDAXfHCFWXoUkWhPsxDGUnGkODJondFHKYxpRpHepzk7YLgbDswTbnZaKMKO4kdbRz+JzBkuhGQEScpJxu79bp74c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kpgQ2IXF; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYKBqArHTdxkG/+GMFg2Q5hRx2zHsJ/SBqBJyTfyeV1vsvFnbs+ZPsrUEiYWPQjC3WItI+cBO/sEmTI9YXK3iyo/IBYCIZiVcypv/OBf59hS0/AZzI01a0UdK+yi6BGgNqhFGimqelmPr5wvgyphGXoCDp7Oddv+htSUy/urDlRzsn2zopXt16kkQ1nG0tPR3GGyeC9sjrJuqNexL7u7WctUyDgw8vPb6EBYXR3m6Cy7I8VYaePJ3X8nMIRbWYk9kH1fByVgESB3wIQq+zsuXRP2qXzCGkgBh0s2Su4XlejEjpttHGFDQihPp4QUC9NQdlQUbDm+8oe5aAIXCibewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DipMtYXgiBiD7BFkDhb+3F5xo8dqtxW/rmu8Ce3iBEo=;
 b=lXPlMcqmjRfOrFgryP9YTYp1PDtFqpmoci9YFmVEDpDQcFqh7XZ/Nz89a37uSod2Yn/dx+Om1tmfJXeAG78wUqxYk0rct7+JJ+/+c0JUCcvKqV7Jvs0Fk9cGdFiKgipLi0r+OVykej5XQW4KR7GUf/I/ep6ZBdrPjbxmkVfvKUiRLJaU62xgpQUXU1s3zdvKjVsDkqfastVe3LXzO46RWG7SPNE5LN8V3UOY4cH1RRTOrs9ePb2VQdMyVZMKMnGLOIfqruzR5IxGgAg6FwsXUWlMuSy1IEwy53+RWarL5ssSnCgsa3s6c4BfzBcfptjYQFi5yP4qZs+9xRy1kuAxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DipMtYXgiBiD7BFkDhb+3F5xo8dqtxW/rmu8Ce3iBEo=;
 b=kpgQ2IXFgujKjS0d/FOpLp10a+KcgkCLnoMVRPawjnPcV8huG5MvsidmNlFKezuvtPwdziWN92y5eQ3SlYmjcrNqlls/g7xS+oPsITGACLWxmsYsxIopRN39/gSLu02L+tjv4gS7ktdXgdLIiNzozZuanR2xRyEAJwH+iaaTgyxMvGOaqtAdaIVSEwt/t0aCpSKx1yqqBzWcQm8HEqC03VrV3YnXB3yqpGIXdq+NUQWCfIxuSUa2lWKfEbKnfz8CT2W+T3phtGpr9Ntwabd95J1RCJwnu1yP2f/FF/NUXUxOlIFZmqWph6hsqF8JbRLVJFXwMt8eki1yRig3BwbNqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10390.eurprd04.prod.outlook.com (2603:10a6:800:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:38:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:38:22 +0000
Date: Mon, 1 Jun 2026 22:38:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: bod@kernel.org
Cc: p.zabel@pengutronix.de, xavier.roumegue@oss.nxp.com, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself to dw100 as reviewer
Message-ID: <ah5CF5vx-GzhJRke@lizhi-Precision-Tower-5810>
References: <20260601155059.1332290-1-bod@kernel.org>
 <20260601155059.1332290-2-bod@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601155059.1332290-2-bod@kernel.org>
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10390:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d35186-0d33-4f0c-aa47-08dec05003bf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|18002099003|22082099003|4143699003|11063799006|6133799003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 XfVxStMQogROBvQ4WHoaCgFYzSPr1pN3/sF18u/YznvKfg16Co/SCxWyX9Yd0U6O5V5vvAAMVjTVYgVrEdXYWwy7pNIrZ3iQSgV7lRT78zm9q22kfD/WBG1OoF/Oa6iHgNhPVEyZpEZqP0wJhRHKJdgeJOpYAbGoLNRKj6TmN9DBb+wawTbz6ENj3k1iXnrM0aSY/dWQEzFQEAlo33gE9PRWg4F7EqrO3pWgGwjwKiCM2RqDYYFboqP4jiCwuSiwA64sgHKVBzH15wMVomFODWiISPoX/B1dN7YVYyQYov8ixQVi5F1LHA6H0BfEDqeunVpthQn/k4xlDKTwiLZU616qukBy59hk1ueb0p4VR1GfB+/cR1NqmhkA4V6zp7Blua6mQXVcjldmokE95gWotNZfNgpoafw1ra2eVleRzXLCIXlMP96lH2nUgzsXJ0QIarZMCvlyRNTgrdkm6hwiw+vnMK93SMGeMjBfBCFYASEtcEw/tCz5oOy8GVJgA0d0wJJjBFjTowsZ5aWIW88Qnz75tnR4ud5EsH9n69hp5IuorSnNd6+Ngpjb3ua143GDf/ld5iognh9dCEJSMHObDy5RgwRJm6sUfibBhZq2ltkS3yglgKGtsVxokfdkku783mIFwA4X0hkx8W+AJOddK40dzLZE/vIBrKEo13JSHQyXQdch5NWgAHTcrwIirVkbOmWsX1Dy4dG4aAWzHI7sY/PgDYWD1MOUgWAr9qJmsJSFSG2MlluyCOn1R6PCqAsd
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MPfZ7pedDH6Zexsz00g4Ke6zs4hfPVwEGIUGMddNgarYi2HWP3bh5dzJPV4e?=
 =?us-ascii?Q?SB3bMfTOszfqf4ikR7KFrLRCv3mUBDky38B2Yg7KhUDfgpEdJG+JO+Yx/vw9?=
 =?us-ascii?Q?QmdsP0qeIibwTBj3Bvo0OgbF4Bye/fjWp8Sn/jqpxpNj9uMg9wqfIT1ihp6j?=
 =?us-ascii?Q?Jq9HjFhk1Ysd4jpbmpIzB6R+jRLMKPYBdndvYKEdEMYvWZCZpxMbZiU+K9mM?=
 =?us-ascii?Q?fIOCOwUwNkmZodPNe2NdPOaz4WDUrZ28wXtiazjbSDnpFOSmBod4O0QkEBkz?=
 =?us-ascii?Q?qotie37c2VTxnDm3GY2Wy/EyoPTYo2PchsuziXpxQD5+skojuPkd9KMZPikp?=
 =?us-ascii?Q?reH/bQ3Hdtyn2G4QrQu/+GCIZsN0N5yF5pyxtKbDzQuBwu6kYJcMtrXREgz5?=
 =?us-ascii?Q?X4sel15PSeprMhlEKmtEniGpc/vIM9plmqa1NKDBgDrV60Q8767Kke0RxDXE?=
 =?us-ascii?Q?d4L7SJqNHT/oD+R2P7dpv/CrGMXmLNpjKH6XWN4AAVuZapyQE3sd9JRzdXkz?=
 =?us-ascii?Q?psKsX1HDVNvvsaZMsuzsNIM+jPSCVSxlxk7E7b9UnRlmDSza5kkcRFL/VMvJ?=
 =?us-ascii?Q?8GCR0YnsBdw0CcRbp2H4PZOZBIRPbw354Qew062W6iT02z/BXCZBW7SwZIxe?=
 =?us-ascii?Q?XBOmLobNjPDZNULrVY3W4psE+GYmoJrbKP0NaWZWi5pohmkP000TYqTHko6K?=
 =?us-ascii?Q?cBEQfywrLu/IprKSqnPJRaPX1OIXvKGCvNKgLjqP4N7FBWRebUUYxnhPJ0bh?=
 =?us-ascii?Q?y5dbqC7Up9lPQgqKTg8aLXSx2XA0CkVLMIAw0Wz5Yrj/d/onBZSzgMz3YHpd?=
 =?us-ascii?Q?mQK02Lpg6Zo3uWZjvxPGAeJt9A0uGvha8EtPAX/hFJIqVwByvGY0Fm8PlGgT?=
 =?us-ascii?Q?c+kC0tU9NS+O7opqIicM5bnk4Bcqy4L8byuHb8YQfrZkrBk4ndiCe509bwpQ?=
 =?us-ascii?Q?gPP/d6hT8VSjEm+072sC9N3j6awE//omCiBgYWnCkdW884Gq3Gb77xDdes5M?=
 =?us-ascii?Q?K7phXIOodTwX+ymLFxUR7/RO98tHkY+VzkY+fk0FsMtIYqlM3tAjI9UNuT4R?=
 =?us-ascii?Q?9gTl6n4XkSYzpFs3MHpUQYxUv9nko6yCaILZoaRVcFZbye4SFGs4ft2TttXp?=
 =?us-ascii?Q?+k04MrqsT/g+LpLSfF2UAJIyv7+RvOP4TkE3ACsNnd7PjVs48CNW/FE/OvXa?=
 =?us-ascii?Q?FMEhHUyjU2Al5L6Pdzz0ewT/AhKQQrsErXLQqVz8DI0SZyLS6Zw9/3x0OEP5?=
 =?us-ascii?Q?ozqwuw/ixqQPkIEh18q3jLt7nUOEKvoztKINznjGPm7rtE5f6O+l+oabCBpF?=
 =?us-ascii?Q?khx1icytvENhb2P/FGUbQGmtszLptBL/c+bxrEJ05lulW5qI+w4WVTdimXS3?=
 =?us-ascii?Q?xdFbts0zVL1jQPL+A1OPvJ1oXH6+q/Ove7wUOjF09OznYapri8mrPoBtMU/2?=
 =?us-ascii?Q?FDjk3VD70IX+TGZJAEB4/Y3acXqVCy1qysGplcZmaXFoeq6qtT24UVg7MuMp?=
 =?us-ascii?Q?99TFAg+rX24QEtY1L0ABOcymtcTAiVVIdNxRBidT6EiqDetyBoLv9PNX49AA?=
 =?us-ascii?Q?IC95VPYJjRegDlIkYERE8ll3rrNUXnSQNbo+tt/DD+sSSQDmVDypeAgn0HrS?=
 =?us-ascii?Q?z86DvnzEn0XOIAH81nIKPsuRNz/pfMqrOX8/IcV0ZB81kTxP3itCpWLXW39R?=
 =?us-ascii?Q?IbGUC/50uRiVL+KtsMFugxVx6LOAcu9pQv/IPV1DI/uiQYjF7mo4xt2i/eWE?=
 =?us-ascii?Q?6yVBnIW6lQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d35186-0d33-4f0c-aa47-08dec05003bf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:38:22.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRZBtI+wSW3x9tqC1Bjpg2SCwbg17ndleKMUTNviGRGTpe6c32/hvd9aP2g5J988zB5kr8QF9CWMksrcC8j4Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10390
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,oss.nxp.com,xs4all.nl,ideasonboard.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63340-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 1496F6275D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 04:50:59PM +0100, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bod@kernel.org>
>
> To facilitate cross-pollination between one arch and another I'd like to
> add myself as reviewer to the dw100. We discussed @ Nice it would be
> beneficial to have different maintainers reading/reviewing things not
> directly inside of their remit. This driver was mentioned, I'd be happy to
> join in.
>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Thanks quick response. See previous patch's comments.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec0743b41a463..35368c2ff0ca6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19243,6 +19243,7 @@ F:	drivers/media/platform/nxp/imx8-isi/
>
>  NXP i.MX 8MP DW100 V4L2 DRIVER
>  M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	linux-media@vger.kernel.org

Please also add imx@lists.linux.dev

Frank

>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
> --
> 2.54.0
>

