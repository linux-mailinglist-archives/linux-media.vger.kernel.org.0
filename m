Return-Path: <linux-media+bounces-66461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YLNOJUnFR2oYfAAAu9opvQ
	(envelope-from <linux-media+bounces-66461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:20:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5ED7035C0
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:20:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bp.renesas.com header.s=selector1 header.b=cn9mvDDJ;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=renesas.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66461-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66461-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C53D3025C21
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 14:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AA03DD516;
	Fri,  3 Jul 2026 14:17:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759613D9DB4;
	Fri,  3 Jul 2026 14:17:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088231; cv=fail; b=QY8eEvOuGV1WPsH3mpZLiN4V049kdPaPniXMC3k6LrL4WMhqegmHX2iZZ+3UMfLYUYr5YRft9wxhfrAY+n0cUS4UGi49r+aWc4tZhN7fUEivvVP+tyMkE1rWSaju1kWrAjYSkV6xY0b0L2nHsc3SnxiwxJIk1zXxrn85yChCntE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088231; c=relaxed/simple;
	bh=1Hw+5mkdtyNUjijkhYaWvfIjxZX6SEl4DUv+h9x5e28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a19SVxOmn2Xd9jTkkaTi2LIWmnDDv+2+DvsJMzsWr4xENUxpwnp/vc7AbPFEPwJ5dmQSQE/XRwWTgpWdNLqTyTwgTk78SUm5Yq5vZiqujCA69S9M4VEcwjeFg1so6KLt7CUM8ZBKFCinEMaMq0Ypkxgc885Guasc/WM1Nx073tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=fail (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cn9mvDDJ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYDWuzBW/80yI3womZq1IbBhuilvfxh29g/h+q8Z2My0LWIGR5bj1DeRqIGuDyRZpWw/uqFAMlYHId8T8zDn/wenTUECX7H5gZ8QDXuP6JuQREtaNiUuTbSsatFifkhb55nZvWDpVX8T8ae6zDSznZLg6b+xl3kI68XGa1hgckLJbfawHWTo4/iP0hqb/ltGOUZB81gc7vhdOYGnDauckjsRhG2izhLWnU7B2E9VCYkZV4gHh8UUN0EP1KyKgF/L6KK8UrkLMzpal2kfywrBVKQF7vbR9xlWgUhezwNbJxlj2/qf4z9LT8yCwLdvxOquiQ3JbGUujjQMrj812cYoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmN9NAVuasnACS2tIaZyQ86C/smh4APhEkWN9kFwH8U=;
 b=SvUK4LmU4sc5THgLF7rey8BWltPS1oGP8+E5IuhukoRxE7B8EVcrWO15wtkba17UgUVnGDhay+GO1uHVUUVApAFrqNGC3GFZkrWj6j7x/cnC31Hav0K/p9e7NF2qkB9kBTlI1nQ2+kR4Gkpy3Dix73vev5/hhc1BG1eb8iScEI72hulnNWcLEwG2oRutAven6VUFJmKAeXjqLJauDyKoWd/hETUs8xSWIO8V29ZtSy3o+RxGA9tYaLmKtc5JkzADJWYIlLqyJz4IBK6IZXy1dzY3S55sXduNu5Wr0w37R3qPQ9L4O+AoK4gayIXVVXRmXgIqwdhv6rh/uougJZM4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmN9NAVuasnACS2tIaZyQ86C/smh4APhEkWN9kFwH8U=;
 b=cn9mvDDJpzKgHhFXS/fhLHTf8XTM6F82pyvfRFLnGGNMR6MORag3Fh7qL9ov2Tq6oOvhu+aw3ZbTjfOBZLR7qEoejFw40YgDiXWG5eVVXcPruf5FnzbwFtMgjaFrop7cwPLkaeuT7PWcIsxQKTEXDEbMPIY/Pts5aJPrVD8tH5A=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB15922.jpnprd01.prod.outlook.com (2603:1096:604:3d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:17:04 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 14:17:04 +0000
Date: Fri, 3 Jul 2026 16:16:48 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v2 2/4] media: v4l2-common: Add kernel-doc for
 v4l2_fill_pixfmt_mp_aligned()
Message-ID: <akfEUDVXIXDU2GCu@tom-desktop>
References: <20260701165003.1495035-1-tommaso.merciai.xr@bp.renesas.com>
 <20260701165003.1495035-3-tommaso.merciai.xr@bp.renesas.com>
 <8d336c44-1fe9-4f9e-8d00-3e1d735e40b7@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d336c44-1fe9-4f9e-8d00-3e1d735e40b7@pengutronix.de>
X-ClientProxiedBy: VI1PR06CA0181.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::38) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB15922:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2dcc5a-8644-4f41-53c7-08ded90dc18b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|23010399003|366016|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 IkNmY2SnsAL6CnAMJvYaMur+pLV5qCjZcUUrLhQT/JKqr6ke069/HmrGBOLPItx6K0gMg9LMGDPuH+SYp6SSR9Rjj86Ioo4D7VMUQ/4oPpA4q5LjsJsaW4trZdtm9H3yAGLVb5Xd4RXqzaECvr8aAa4ueS6U04NLNyUiZxVXYL3I2FqbsCHbLB6BdJC9Xh54vMyMcpAyEFiza1Dj+mN/sxH8F33eQSS6nuJ057CRPg/cOY5aLNitVonJXMeRHyyilHzDeLQVzoV7+6PUSnPoQ5JZtcrNubbKT9xEWvYoiWMMeW041Xt9kU9S0DGaqhGBu3YDecLVvfW8C4OWtjtZqzfK+fBH786VwgFTMv8eqBsO+XyH2wNaeRm9B7NXtLp6iPhfRuH6GJQvzVHXGO8Nlkx697zeKYS5oCSbuP/YlxuDQ381Yyd0W3oar6N9asqIqhXj2dRb7vL21Y8jzHshGb4u8RPV6QKpRIzglatrf//jSV900URTp2ps4Rod0hbKwVEnr7RHwXxBF+Vw7SzVS06LVhAOXH79kQUxlP1UuJXHz+qiRkB/On5uT54cy3MgYocqIbzFNatUnzb+aylbys5GmshqsVAT0vCR1suErHaZFN8V7T8zjEuvs0e4jsJbtnD2HJtre8AtxPeENjY1r69R9yDmOui5ohY8JPUA1CEH1XDv09sY2kPaR8D8a2j/7lzqus/AfbYqj2cH2yDs3nK7iiydzo/W8iKkAXjdO2w=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?QFK1V8Wya0WgI9sHQSdtcl2TME65pXd6E0HmKP6nPSQdJJJJSgP4hsLZcj?=
 =?iso-8859-1?Q?vI+BhpurqyRhO3V3yd5DvRN6VScsxMvlh3UZnjCPjdZVycP24759XrhCYD?=
 =?iso-8859-1?Q?ebpd1qIt1miQNHbBVo4rjZdELxv9Uwrwvd3IXXgoBF4xDMixYQs5h6M1c2?=
 =?iso-8859-1?Q?ml7qwctoGIWRy0FBv0fiXA3DqulvBlB/qX0Jx9cPWBI2Jm/z/s59HjZJAI?=
 =?iso-8859-1?Q?xPuLP9lMzxCi7eoqEHYKMUCAxxmzJy6N5HFnbDoaXLPcI+W/33cZfWkCag?=
 =?iso-8859-1?Q?c2BUtIebD5q0T5eSFSc0h0+dGoWwNjGj/3GS1YmFn0qJlOZzlXcFMwY5w9?=
 =?iso-8859-1?Q?+u4f6gJx3Q2SgslQh47YBClkCrm5k70k2EUI9zzGuPJM4H8g3saRdZmNRX?=
 =?iso-8859-1?Q?5rPkhwQpgiuz3+sBsl3bJHvSOvpvj0TsYY4hF7ven7XubdPcjhI6P8OIRR?=
 =?iso-8859-1?Q?gW49e3ns7XJYJ2XO4/fA6UGUOjj1yyyNlF3ZuRxk55SigYS9AC7DdfmlSG?=
 =?iso-8859-1?Q?zeumox37891aLr/AiHXjXl9qIvNcRUguG9PNrurXLlwP9yX2BO+BehwvBi?=
 =?iso-8859-1?Q?CcZKytcPCCWADeRyW/xw3sqHSnoEkdL79xmCPBjQ7+GLLDBnRyxgDtJo33?=
 =?iso-8859-1?Q?rEd1hb7nch1vaKxQZqyvF3YeMTXN7X+8+NeMOiAgWfT8DgpgSF1gibCz6+?=
 =?iso-8859-1?Q?uNDpGtXSF7fHI8gruj6Z8G2mnkkc2bQmUgguX0P7adTlACx8EEzT3tLK94?=
 =?iso-8859-1?Q?6u5oee+78XxpVV7sYIt7B0aZc9TRmrm1IV5tRSuYfaKzB8guCV06kTdsvL?=
 =?iso-8859-1?Q?sEut0XeaDQ3pTz/fzFJiZ331qTz9o18iO6O6yo1ye2ORlyYO8grzaR4duu?=
 =?iso-8859-1?Q?igUKlWHsFwsewApkSXdC60tgM4aHoOdZZlWnlq4xKCymws6p6e9Q1IxrzV?=
 =?iso-8859-1?Q?0Ettcep74i2nqe8K4uzrQOVlfopTNneCdtbpYEEwjXMQLmTRcxekDN3BrC?=
 =?iso-8859-1?Q?XnwZmBmqh/UAB0EvVfbnlZ8LO442lVLGFjfNQGlxdebOp/wBIZiucFxU+S?=
 =?iso-8859-1?Q?KpmkM0y/5/TlLVO3vwT4KFU9FAV3zcqz9TpEbfixEVEGzPkV2fnJkKjy+t?=
 =?iso-8859-1?Q?6V/JAglTDyOMsQclhlJqDeUvF2nLpxY/QtWRPkFQHicHcSiW4IMmyfUhJW?=
 =?iso-8859-1?Q?vFHbYVBmEq3VokNl9RBA9WwWT6NdVECN3RqfKS5tDQkt1gshWxs275X8Ce?=
 =?iso-8859-1?Q?IENp27BuQrUfs/euM5Q8yfx8thdiSJsY5E9wbUgNHLDKsKJLX3ATtHqf7x?=
 =?iso-8859-1?Q?kuiK/s7osomprVhtdEirgi6t5NFt4XEP9hXVLR5098Go75bTj2xvH0cKLh?=
 =?iso-8859-1?Q?GQWV+E1gOprGCef1k+ua2HuXh1rp31fwH+E65Fam5kN4eOq82EFVAnUgCw?=
 =?iso-8859-1?Q?RU4ourrLzXZe86MtYILnRq7ecjk+KUBlHLk84HC7iYmnqRzI/sBvdysiIu?=
 =?iso-8859-1?Q?Ru92KWoI7b0KmBhGIz37gFPthRmBp28/ioHIYjciw+CgLUgsLpFzvqOEDw?=
 =?iso-8859-1?Q?dMRDtMC6jTB+ZiNdJ10xruc80KzScZhyQGaek7ZynvKpl9hqAHcG8ETPpK?=
 =?iso-8859-1?Q?sblSumRcI6Z4dumMF9QQGjxFSTPrpVzPvMBe2mF4hqbnLBEEP7YYziIApP?=
 =?iso-8859-1?Q?nJ7AOyFCTlqJMO/I7oEx7VX4XL7gPCRsiUuDJRderV7TQpVzsqjVG/elzo?=
 =?iso-8859-1?Q?V0ELxVFzxjU4AomXfcbyBGORu4vCtAcV48CCsFL/72Pr1yz3bpP5BYz9OM?=
 =?iso-8859-1?Q?qUPy/2ShuQ2GxW8k/x1DcrkPV9c97ayLQLob6OjHBgCVRBXjjfOZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2dcc5a-8644-4f41-53c7-08ded90dc18b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:17:04.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8r+Jn1Cc0C+7pRbdWtJshdl3nYGPWLKZQRH2Kr/lZKdjaRNBjKofl6STtlVoW9WcxuzD5cDrzVWz+b2TZzoeeCB7wvCUN1E/5IPz1wwNeiDr40rPgIjLDwhWd/jKbEL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15922
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-66461-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mehdi.djait@linux.intel.com,m:nas.chung@chipsnmedia.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,ideasonboard.com,kernel.org,collabora.com,linux.intel.com,chipsnmedia.com,crapouillou.net,pengutronix.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE5ED7035C0

Hi Sven,
Thanks for your review.

On Fri, Jul 03, 2026 at 02:14:55PM +0200, Sven Püschel wrote:
> Hi Tommaso,
> 
> thanks for adding documentation.
> 
> On 7/1/26 6:49 PM, Tommaso Merciai wrote:
> > Replace the bare placeholder comment with a full kernel-doc block
> > documenting all parameters, the function behaviour for both single
> > memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
> > formats, and the return value.
> > 
> > Signed-off-by: Tommaso Merciai<tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >   - New patch
> > 
> >   include/media/v4l2-common.h | 27 ++++++++++++++++++++++++++-
> >   1 file changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 749fe38c134e..db59dda578f0 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -557,7 +557,32 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
> >   int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >   		     u32 width, u32 height);
> > -/* @stride_alignment is a power of 2 value in bytes */
> > +/**
> > + * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
> > + *	stride alignment requirements.
> > + *
> > + * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
> > + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> > + * @width: image width in pixels
> > + * @height: image height in pixels
> > + * @stride_alignment: stride alignment in bytes; must be a power of 2
> > + *
> > + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> > + * stride alignment.
> > + *
> > + * For formats stored in a single memory plane (mem_planes == 1), the
> > + * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
> Given that the v4l2_fill_pixfmt_aligned helper is added later in patch 3,
> don't you want to move this patch after adding the helper?

You are correct, thanks.
I will move this after adding the helper in v3.

> > + * is set to the primary plane stride rounded up to @stride_alignment, and
> > + * per-component alignments are scaled to keep chroma strides consistently
> > + * derivable from the luma stride. plane_fmt[0].sizeimage covers all
> 
> No, it's the other way: The strides of all components are aligned to the
> @stride_alignment. To keep the chroma strides consistently derivable from
> the luma stride, strides may be aligned to a multiple of the
> @stride_alignment.
> 
> (feel free to use the above if it sounds good)

Thanks for the clarification.
I will use your suggestion in v3.

Kind Regards,
Tommaso

> 
> At least I read your text, as if only the y stride would be rounded up to
> the nearest alignment and for other component strides may be scaled down to
> 1/2 or 1/4 of the alignment. But most of the time the y stride will be
> scaled up (e.g. YUV420 or YUV410) and in rare cases (e.g. NV24/42) the
> component stride is scaled up.
> 
> Sincerely
>     Sven
> 
> > + * component planes.
> > + *
> > + * For formats with multiple memory planes (mem_planes > 1), each plane's
> > + * bytesperline is independently rounded up to @stride_alignment, and
> > + * sizeimage is set to bytesperline multiplied by the plane height.
> > + *
> > + * Return: 0 on success, -EINVAL if @pixelformat is unknown.
> > + */
> >   int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> >   				u32 pixelformat, u32 width, u32 height,
> >   				u8 stride_alignment);

