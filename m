Return-Path: <linux-media+bounces-64694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWI2JWwKLGrMKAQAu9opvQ
	(envelope-from <linux-media+bounces-64694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:32:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51E679DC0
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=As1MnKbl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64694-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64694-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D93C32294FA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9000B3FE66F;
	Fri, 12 Jun 2026 13:21:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B13F0A8C;
	Fri, 12 Jun 2026 13:21:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270483; cv=fail; b=OfWyvpUMgM4khqs3pIVTSJHRvVCR54+ISdN7s11MylYZ2Nng6LHl6pDl2eESGzKWpJxVwVwS4WvwgCPDbmeLV+a9f6fWwQkUO9urNG2KikvdW4W61O9RnVMs7Smy+PZfqoLmHS40mt/B0GXlwzMh7T+MLYuFdwkTkzF7AtsSsLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270483; c=relaxed/simple;
	bh=NKFZBh5eEqMdFSPzfdiwZboC/iv6NJIhgpLAK6HVA6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k7saqej1UjaENLqgIsEMZIDGhSgJKriKfrYH0OIg4UcgMwFubQRpdJc190+43vJUavb6sR6wZ6xkpqV1zTJWeZdPYz0/kSelJ152aKPcxplAul/bqcOYdzdSDt4Po9+ZQhdWAfNe12neJKG/OFAGIsaoXjeh7/NdICFsIrvtL24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=As1MnKbl; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdV31MU09u0oimTGcPh+GnjZuYoes8qdjAUlbQpse9tPL9Ie7AaCbCTPU4qOZr24jIcQe1O8nbqYIgVIcq0Rqyix5K4wNbMWVdQTtpVewKZP9fyrdCBuvpTvQ9joyk/urGN6O2swJ5sCZdgSqJZ9sNBOr3zfQ6zVGP6imtXVxuizlM65H+iIrggc3iUtJy+E8ftJwWmDMKKi7yOkmPKIB3Dbg5EFqUsChPoAUcE5nemHVc3DeagACAsVOfGxcFI9zL0cQbW95irbmRKLSjdTINMyd1T0RWzW/3FuDByHgi3OUR2D/nPUozjbHoNSz5Rnd4fAstdyFVJTXesKjwEbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HSGMdhFrDuRwOFoVKQmfsLq1sKPYFdWYuS2UWJhgY0=;
 b=ThNOExQqh2yuPOwJMujcMaLdOFaQeNWovOt4J9rQ5lMVy8w5AQWOQUueDknqDU9cvQL7snSU7TGUURgIcebI/moTFHDZ93AExxdSewjbXK4v39LrRapTnldXI3ZTG1SFSPukaW2U57/SW9q83h5mUju+/AGWTHcxvCCX3bu54NfEo87JCnO7HCwrd30rUfH6SbmGDqkvh8jOopq1PagrW+wvtcgR488F2lTce6mqkUVuNp130u23IwUDya8xlXvzBq45x5xRE8E9WrGmXyzjE5z58L39OlB7rVsQz4IHXzI0GX3KuA3WbWfXYV8No/rpAuTvG+p0UzGmt9qq1qw2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HSGMdhFrDuRwOFoVKQmfsLq1sKPYFdWYuS2UWJhgY0=;
 b=As1MnKblQ43VQA8xu48nNhMWxg17vZxxDjTcFYWc2OXX1RbMlTSoRL9gBvQGaizPN/w5pG2Eqs5jyk1v+trSy5+KxBocwnRTfryWs6RPmXu2Ta6U+UxrEsm32y5JwSoRjajBorp6Wpt3edyAoneeFJMlb0332+QN++75ktlQP/ihswsjFZSalDZF5A6l2d6z9WOcmzq5xeicrj1CdTN+pgz9CqGHLdSQT2gQ9ZjIyET7ZOa8WIf3uZLhXbPGtcxmK2kArKHa7nBVEleT08t8gRctH/dI73gk6/HhvY49NH/yZAG7Qg57VgeIKqSTTNJ5dfs5QcovgNvnfDMLWfkHow==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:20:58 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:20:58 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v3 6/8] media: platform: Add NXP Neoisp Image Signal Processor
Date: Fri, 12 Jun 2026 15:20:37 +0200
Message-ID: <20260612132039.2089051-7-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::7) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: d69b85c0-800b-496e-fb17-08dec8857076
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|4022899009|376014|7416014|366016|23010399003|13003099007|921020|6133799003|18002099003|22082099003|3023799007|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 iGcnruIvxb/oGDgjfGWHs9iOzmSM8bC2GdAAf3cTfR4rFQknvTzYLygpoNNpFJtXzqfQ68EIPFd2RwARz+lg67KvGiY07KVzIX7BUVHomReKxIE6inIzDfplPOBk2FS8MMA4YdGjm91Ls+eYj6kPVeGE/bUUgTDnpMoGqjOnsYrs39L5P7nMfEzE4P3HS3PMbtR17Qwx9lLnlYwcm9ifEhzwztxhbCvHKSqR/bhdbZbjJJvCGwOuIKIKnMRjnMOoPmaxw/9lYlOtqQQGhYihnnJQdlikhGSw+yw8zS13QFLL18TJmMzqbDNIo+korWO1UNtDlPmkRAPTNle9f1V5/KbZsBoNoG4YTF6fAOVUNikQGz9+x4sjJlqVlC6NSSZ2ZlUfdx8l0VScJ5/x/jfrVtqJGlYGljEWHBCuzqna0eQ4pF59QhO0H1O16Q6QxsOpiu3cCWO4VKf0QZb9Q/Xei8WNH2gsXzpm4eh5UH/eJA38d2V+8YD/F+9edBUe4tI2WvtENKoGcKA0dJFxPpbqmr6Nl8g5GlysB2+fSIrDJQXPBirPda5SeuFwdME5HHOBVKqXyiJXU4gRYTURncY2SFOF6GUD5g8k7DSOhoz/Rj3D06axs2cjnsgp//rTcHiwf3rOVkeMReIHS9BDi28qFXkq/TH+6g+ZupHmDl8eFqK9ZEbgNMcxAKlK4ZHsb2fD
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(4022899009)(376014)(7416014)(366016)(23010399003)(13003099007)(921020)(6133799003)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+xOqv/LXXWcwFWsRdHI9yQ0VgCwHI7iopodylyova8yBO8jzgxSZK7mF3BzS?=
 =?us-ascii?Q?8bwXFzC+Lw/mVQyUd7/oSqkPzFr74WPwtR1/2E0yxXD16LbLTQdagjjm5aph?=
 =?us-ascii?Q?sNDgDHJaMhLcgnGcKqC6jjDnYk4bmLPJOVKdFC0OobTahbg5r2MpOVzENRfz?=
 =?us-ascii?Q?Z5KW7DAsN2APqVhHFh5gGIAtVFPYniAkxT/XsxUa0/bKZOT/JPZPPN7/YYM1?=
 =?us-ascii?Q?BLKwn1VuqOLelmeQ7/M7suYlD7gtNaPAvTeYuCv49BwYoSes2jIYqhBqqLzV?=
 =?us-ascii?Q?+fU2hKYO37LnvsNXLj67BT9UXSP4jkUP7REqAx1UdY5hGp6+IWai/5ylCldF?=
 =?us-ascii?Q?ouKnCajl9zf36acxv9yBBXA6Vwjv9kfvT/pfjzLQZ0sTvPyS3ysx+855ka7q?=
 =?us-ascii?Q?TZS4fLrBYsDxxxkgL/owF5IZDnEguTy2oW+gYe2uY3EotAyGoY0lE4MdsCRb?=
 =?us-ascii?Q?GMkQMWrQL0sc9KW+vr64eIctwrDZhjKRd9c9n78I+nAAbH2Mfaiy7e3J68gf?=
 =?us-ascii?Q?Q3Fu9pkBYBmIvcsVUaHm1H6IcSgnNa1xg7Jh7x22q4bg5JsOah+focSmHrGI?=
 =?us-ascii?Q?Z9DReySnM0KPI7Cb3RUqgIfkDo54TaYcOEvJRo4qfCPuHyYrtfbrd2meI8xf?=
 =?us-ascii?Q?bx4vw1RenW7npA9thA/pH6HEccC3yNeCBYsFgrFHFhKk9ILkQHqxjs9pH2Sb?=
 =?us-ascii?Q?X0p8DfI4U/jamHKvx3a58i8DwagqEq0Ba+BZZ23d6Y8913BWJ8sO2EE+KWQZ?=
 =?us-ascii?Q?hB2Ob5Q/z3yL8hfqvqFmfPNzbq9TI9kQb38jlM+ZannwGgHXMSoVTsWOiVVp?=
 =?us-ascii?Q?z6H10u6p56XviFF32v8GH+PFtLWD0lioOa0GH3J4xDD2RZ2uSj1EAx9EIkPZ?=
 =?us-ascii?Q?W0ikzoNeLij8UhHXfvoNmktGFIJb9VWg/IDyUlY860Gx8tX03ih7V0YlgpDd?=
 =?us-ascii?Q?6eap68NDaEmE9xIzpbZiNUK5Li1Sg3uQrn5W99b+pqvswP82dJZfF8h5j4+g?=
 =?us-ascii?Q?MWcl68rf+WR/y9PIZeTj29PL5n9kyfD3YgHBAMdjjhHz2dVR6xSQnsOYYYIB?=
 =?us-ascii?Q?gz1U0SQ4A+eeojOsqHrIqGDI9XGywE7XFqqvbw8RH4rJbfl58qRrGcOUbw2a?=
 =?us-ascii?Q?fIvq+Fulg54zNitYb7CglrJ0nxzvwP+ieMGRHnl7dRy192sjbGxSbaRUHaur?=
 =?us-ascii?Q?bgcca5uhcGKvIJsP5xydAIB7icKZy71/n7F4ZSeIxevJk44cMtqADEg6XrgD?=
 =?us-ascii?Q?UnfDcifYW0/J5SrKJVCH7RntqevJ9qw4nreO1FcPZRXwgAFBQLDYUD9U02IX?=
 =?us-ascii?Q?CrD9zf1OHpNAWa0WW4anYHoRa+QHTD8guod8vNs44l0NpG2M8HEbNHoDGPay?=
 =?us-ascii?Q?eGjn1WQaUH/Gp9m0KaS3VdAP2ezRN5jvQbZ8opE/2LmhjDunXAlMcZOOAV2h?=
 =?us-ascii?Q?CYQvCuAsRtrrrWHdPo2y/rk/2Fbl3zvYpPaoXba/phvenWT0LnVmzuJ7/zTr?=
 =?us-ascii?Q?KRnj+GPHNpV4O46zbiJCHoQ2lzvSM9oa3zSv+T2m28efVniU71Ixg6qt5yN2?=
 =?us-ascii?Q?ZFl6qKSYZS7rbpYV4JjTgHrnARCrTfsJT0gHlIU/H4oS2vC/ajB7gyMmTK7T?=
 =?us-ascii?Q?X5OmtDkSHrT4l0GtL7PeGNsDUb4Jevx9CXjNWh0FtpQHLu+xTf0APa/lugKJ?=
 =?us-ascii?Q?/zigPVRSSBaWygHKfNab/266IQjSW1ms2mXgjeGxvdGKZHp4sVHJYGuA9DQR?=
 =?us-ascii?Q?Yk6H7lh4zQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69b85c0-800b-496e-fb17-08dec8857076
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:58.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3KaVOjz09A7a3OzBibVEQx3AA28rMqPPDgmK9+yTu1506m4S6fFZ9NLL/i4+YeMyVDwHOzo2FtG8qntSVr4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64694-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:antoine.bouyer@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE51E679DC0

First NXP neoisp driver version with the following contents:

This driver was initially inspired from raspberrypi pisp_be driver. It
reuses same approach for ISP job scheduling.

The Neoisp driver supports:
* 8, 10, 12, 14 and 16-bits RAW Bayer images input.
* Monochrome sensors input.
* RGB/YUV, IR and Greyscale output formats.

The neoisp features are:
* Provides single context to limit amount of v4l2 devices.
* Supports M2M operations.
* Support SDR and HDR modes.
* Supports generic v4l2-isp framework for extensible Parameters and
Statistics buffers.
* Provides a `core_media_register` API to register neoisp's media entities
into another media graph.
* A module parameter to run in standalone mode with its own media device.

Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 MAINTAINERS                                   |    9 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/neoisp/Kconfig     |   17 +
 drivers/media/platform/nxp/neoisp/Makefile    |    6 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  249 ++
 .../media/platform/nxp/neoisp/neoisp_core.h   |   30 +
 .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2635 +++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_ctx.h    |   77 +
 .../media/platform/nxp/neoisp/neoisp_fmt.h    |  495 ++++
 drivers/media/platform/nxp/neoisp/neoisp_hw.h |  557 ++++
 .../media/platform/nxp/neoisp/neoisp_main.c   | 1907 ++++++++++++
 .../media/platform/nxp/neoisp/neoisp_nodes.h  |   54 +
 .../media/platform/nxp/neoisp/neoisp_regs.h   | 1465 +++++++++
 14 files changed, 7503 insertions(+)
 create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
 create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_core.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a727d4920fae..85a5a73e0e1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16274,6 +16274,15 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/dvb-frontends/mxl5xx*
 
+MEDIA DRIVERS FOR NXP NEOISP
+M:	Antoine Bouyer <antoine.bouyer@nxp.com>
+S:	Maintained
+F:	Documentation/admin-guide/media/nxp-neoisp*
+F:	Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
+F:  Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
+F:	drivers/media/platform/nxp/neoisp/*
+F:	include/uapi/linux/media/nxp/nxp_neoisp.h
+
 MEDIA DRIVERS FOR NETUP PCI UNIVERSAL DVB devices
 M:	Abylay Ospan <aospan@amazon.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e2..924307e6660b 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -67,3 +67,4 @@ config VIDEO_MX2_EMMAPRP
 
 source "drivers/media/platform/nxp/dw100/Kconfig"
 source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
+source "drivers/media/platform/nxp/neoisp/Kconfig"
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb713652..f5d91598fc8b 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -3,6 +3,7 @@
 obj-y += dw100/
 obj-y += imx-jpeg/
 obj-y += imx8-isi/
+obj-y += neoisp/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
diff --git a/drivers/media/platform/nxp/neoisp/Kconfig b/drivers/media/platform/nxp/neoisp/Kconfig
new file mode 100644
index 000000000000..643b03f18d88
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_NXP_NEOISP
+	tristate "NXP NEO Image Signal Processor (ISP) driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_DMA && PM
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_ISP
+	help
+	  Enable this to support the NXP NEO Image Signal Processing (ISP)
+	  module present in various NXP SoCs. This module offers multiple
+	  functions for processing RAW images and generating RGB or YUV images.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called neoisp.
diff --git a/drivers/media/platform/nxp/neoisp/Makefile b/drivers/media/platform/nxp/neoisp/Makefile
new file mode 100644
index 000000000000..7652df785e98
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_VIDEO_NXP_NEOISP) += neoisp.o
+
+neoisp-objs := neoisp_ctx.o \
+	neoisp_main.o
diff --git a/drivers/media/platform/nxp/neoisp/neoisp.h b/drivers/media/platform/nxp/neoisp/neoisp.h
new file mode 100644
index 000000000000..a777625974fe
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP main header file
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#ifndef __NXP_NEOISP_H
+#define __NXP_NEOISP_H
+
+#include <linux/bits.h>
+#include <linux/media/nxp/nxp_neoisp.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "neoisp_hw.h"
+
+#define NEOISP_NAME			"neoisp"
+
+#define NEOISP_MIN_W			64U
+#define NEOISP_MIN_H			64U
+#define NEOISP_MAX_W			4096U
+#define NEOISP_MAX_H			4096U
+#define NEOISP_MAX_BPP			4U
+#define NEOISP_ALIGN_W			3
+#define NEOISP_ALIGN_H			3
+#define NEOISP_DEF_W			640U
+#define NEOISP_DEF_H			480U
+
+#define NEOISP_SUSPEND_TIMEOUT_MS	500
+
+/*
+ * 16 controls have been reserved for this driver for future extension, but
+ * let's limit the related driver allocation to the effective number of controls
+ * in use.
+ */
+enum neoisp_ctrls_e {
+	NEOISP_CTRLS_SUPPORTED_PARAMS_BLOCKS,
+	NEOISP_CTRLS_COUNT,
+};
+
+static inline bool format_is_monochrome(u32 format)
+{
+	return format == V4L2_PIX_FMT_GREY || format == V4L2_PIX_FMT_Y10 ||
+		format == V4L2_PIX_FMT_Y12 || format == V4L2_PIX_FMT_Y14 ||
+		format == V4L2_PIX_FMT_Y16 || format == V4L2_PIX_FMT_Y16_BE;
+}
+
+#define NEOISP_COLORSPACE_MASK(colorspace) BIT((colorspace) & 0x1f)
+
+#define NEOISP_COLORSPACE_MASK_JPEG \
+	NEOISP_COLORSPACE_MASK(V4L2_COLORSPACE_JPEG)
+#define NEOISP_COLORSPACE_MASK_SMPTE170M \
+	NEOISP_COLORSPACE_MASK(V4L2_COLORSPACE_SMPTE170M)
+#define NEOISP_COLORSPACE_MASK_REC709 \
+	NEOISP_COLORSPACE_MASK(V4L2_COLORSPACE_REC709)
+#define NEOISP_COLORSPACE_MASK_SRGB \
+	NEOISP_COLORSPACE_MASK(V4L2_COLORSPACE_SRGB)
+#define NEOISP_COLORSPACE_MASK_RAW \
+	NEOISP_COLORSPACE_MASK(V4L2_COLORSPACE_RAW)
+
+/*
+ * JPEG, SMPTE170M and REC709 colorspaces are fundamentally sRGB underneath
+ * with different YCbCr encodings. All these colorspaces are defined for
+ * every YUV/RGB video capture formats.
+ */
+#define NEOISP_COLORSPACE_MASK_ALL_SRGB (NEOISP_COLORSPACE_MASK_JPEG	  | \
+					 NEOISP_COLORSPACE_MASK_SRGB	  | \
+					 NEOISP_COLORSPACE_MASK_SMPTE170M | \
+					 NEOISP_COLORSPACE_MASK_REC709)
+
+enum neoisp_fmt_type_e {
+	NEOISP_FMT_VIDEO_CAPTURE = BIT(0),
+	NEOISP_FMT_VIDEO_OUTPUT = BIT(1),
+	NEOISP_FMT_META_CAPTURE = BIT(2),
+	NEOISP_FMT_META_OUTPUT = BIT(3),
+};
+
+enum neoisp_node_e {
+	NEOISP_INPUT0_NODE,
+	NEOISP_INPUT1_NODE,
+	NEOISP_PARAMS_NODE,
+	NEOISP_FRAME_NODE,
+	NEOISP_IR_NODE,
+	NEOISP_STATS_NODE,
+	NEOISP_NODES_COUNT,
+};
+
+struct neoisp_fmt_s {
+	u32 fourcc;
+	u32 align;
+	u32 bit_depth;
+	u32 num_planes;
+	u8 pl_divisors[VB2_MAX_PLANES];
+	u8 bpp_enc;
+	u8 is_rgb;
+	u32 colorspace_mask;
+	enum v4l2_colorspace colorspace_default;
+	enum neoisp_fmt_type_e type;
+};
+
+struct neoisp_dev_s;
+
+struct neoisp_context_s {
+	struct neoisp_hw_s hw;
+	struct neoisp_vignetting_table_mem_params_s vig;
+	struct neoisp_drc_global_tonemap_mem_params_s gtm;
+	struct neoisp_drc_local_tonemap_mem_params_s ltm;
+};
+
+/*
+ * struct neoisp_context_ops_s - Context related operations across HW revisions
+ *
+ * @get_irq_status: Read irq status register
+ * @set_irq_enable: Set irq enable register
+ * @clear_irq: Clear irq status register
+ * @adjust_gain: Callback to adjust gain for data alignment
+ */
+struct neoisp_context_ops_s {
+	u32 (*get_irq_status)(struct neoisp_dev_s *neoispd);
+	void (*set_irq_enable)(struct neoisp_dev_s *neoispd, u32 val);
+	void (*clear_irq)(struct neoisp_dev_s *neoispd, u32 val);
+	void (*adjust_gain)(struct neoisp_context_s *ctx, u32 ibpp);
+};
+
+struct isp_block_map_s {
+	u32 vignetting_table;
+	u32 drc_global_tonemap;
+	u32 drc_global_hist_roi0;
+	u32 drc_global_hist_roi1;
+	u32 drc_local_tonemap;
+	u32 drc_local_sum;
+};
+
+/*
+ * struct neoisp_info_s - ISP Hardware various information
+ *
+ * @blocks_list: The list of ISP units supported by an ISP version
+ *
+ * This structure contains information about the ISP specific model,
+ * like parameters block list.
+ */
+struct neoisp_info_s {
+	const unsigned int *blocks_list;
+};
+
+struct neoisp_node_desc_s {
+	const char *ent_name;
+	enum v4l2_buf_type buf_type;
+	u32 caps;
+	u32 link_flags;
+};
+
+/*
+ * Structure to describe a single node /dev/video<N> which represents a single
+ * input or output queue to the neoisp device.
+ */
+struct neoisp_node_s {
+	u32 id;
+	s32 vfl_dir;
+	enum v4l2_buf_type buf_type;
+	struct video_device vfd;
+	struct media_pad pad;
+	struct media_intf_devnode *intf_devnode;
+	struct media_link *intf_link;
+	struct neoisp_dev_s *neoisp;
+	struct list_head ready_queue;
+	struct vb2_queue queue;
+	struct v4l2_format format;
+	const struct neoisp_fmt_s *neoisp_format;
+	struct v4l2_rect crop;
+};
+
+struct neoisp_buffer_s {
+	struct vb2_v4l2_buffer vb;
+	struct list_head ready_list;
+};
+
+static inline struct neoisp_buffer_s *to_neoisp_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct neoisp_buffer_s, vb);
+}
+
+/* Catch currently running or queued jobs on the neoisp hw */
+struct neoisp_job_s {
+	struct neoisp_buffer_s *buf[NEOISP_NODES_COUNT];
+};
+
+/* Records a job configuration */
+struct neoisp_job_desc_s {
+	struct list_head queue;
+	struct neoisp_buffer_s *buffers[NEOISP_NODES_COUNT];
+};
+
+struct neoisp_dev_s {
+	struct device *dev;
+	struct neoisp_info_s *info;
+	void __iomem *mmio;
+	void *local_mem;
+	struct clk_bulk_data *clks;
+	s32 num_clks;
+	struct neoisp_job_s queued_job;
+	bool hw_busy; /* Non-zero if a job is queued or is being started */
+	u8 media_registered;
+	struct list_head job_queue;
+	/* Protects "hw_busy" flag, streaming_map and job_queue */
+	spinlock_t hw_lock;
+	u32 frame_sequence;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl_handler hdl;
+	struct v4l2_ctrl *ctrls[NEOISP_CTRLS_COUNT];
+	struct media_device mdev;
+	struct neoisp_node_s node[NEOISP_NODES_COUNT];
+	/* Global lock for the node queues */
+	struct mutex queue_lock;
+	u32 streaming_map; /* Bitmap of which nodes are streaming */
+	struct media_pad pad[NEOISP_NODES_COUNT]; /* Output pads first */
+	dma_addr_t params_dma_addr;
+	u32 *dummy_buf;
+	dma_addr_t dummy_dma;
+	u32 dummy_size;
+	struct neoisp_context_s *context;
+};
+
+static inline int neoisp_node_link_is_enabled(struct neoisp_node_s *node)
+{
+	return (node->intf_link->flags & MEDIA_LNK_FL_ENABLED);
+}
+
+/*
+ * From the Reference Manual, we must always access the NEO registers using
+ * 32-bit operations.
+ */
+static inline u32 neoisp_rd(struct neoisp_dev_s *neoispd, u32 offset)
+{
+	return readl(neoispd->mmio + offset);
+}
+
+static inline void neoisp_wr(struct neoisp_dev_s *neoispd, u32 offset, u32 val)
+{
+	writel(val, neoispd->mmio + offset);
+}
+
+const struct neoisp_fmt_s *neoisp_find_video_capture_format(u32 pixel_format);
+
+#endif /* __NXP_NEOISP_H */
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_core.h b/drivers/media/platform/nxp/neoisp/neoisp_core.h
new file mode 100644
index 000000000000..5f035e14f34b
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_core.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP context definition
+ *
+ * Copyright 2026 NXP
+ */
+
+#ifndef __NXP_NEOISP_CORE_H
+#define __NXP_NEOISP_CORE_H
+
+/**
+ * neoisp_core_media_register - Register neoisp subdevice into another media device
+ * @dev: the neoisp device pointer
+ * @sd: The V4L2 subdevice which shares the media device to neoisp core
+ *
+ * This function allows a V4L2 subdevice sharing the media device it belongs to
+ * with neo isp core devices. Thus, the neoisp graph can be registered in that media
+ * device, even thought it is independent without any media link connections to the
+ * other devices.
+ */
+#if IS_ENABLED(CONFIG_VIDEO_NXP_NEOISP)
+int neoisp_core_media_register(struct device *dev, struct v4l2_subdev *sd);
+#else
+static inline int neoisp_core_media_register(struct device *dev, struct v4l2_subdev *sd)
+{
+	return 0;
+}
+#endif
+
+#endif /* __NXP_NEOISP_CORE_H */
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_ctx.c b/drivers/media/platform/nxp/neoisp/neoisp_ctx.c
new file mode 100644
index 000000000000..9d13eb7b732d
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_ctx.c
@@ -0,0 +1,2635 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NEOISP context registers/memory setting helpers
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/media/nxp/nxp_neoisp.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "neoisp.h"
+#include "neoisp_ctx.h"
+
+#define FIELD_PREP_S16_CONST(_mask, _val) \
+	FIELD_PREP_CONST(_mask, (_val) & GENMASK(15, 0))
+/*
+ * This is the initial set of parameters setup by driver upon a streamon ioctl for INPUT0 node.
+ * It could be updated later by the driver depending on input/output formats setup by userspace
+ * and also if fine tuned parameters are provided by the camera stack.
+ */
+static const struct neoisp_context_s def_context = {
+	.hw = {
+		.pipe_conf = {
+			.img_conf =
+				FIELD_PREP_CONST(NEO_PIPE_CONF_IMG_CONF_CAM0_INALIGN0, 1) |
+				FIELD_PREP_CONST(NEO_PIPE_CONF_IMG_CONF_CAM0_LPALIGN0, 1) |
+				FIELD_PREP_CONST(NEO_PIPE_CONF_IMG_CONF_CAM0_INALIGN1, 1) |
+				FIELD_PREP_CONST(NEO_PIPE_CONF_IMG_CONF_CAM0_LPALIGN1, 1),
+		},
+		.hdr_decompress0 = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_HDR_DECOMPRESS0_CTRL_CAM0_ENABLE, 1),
+			.knee_ratio4 =
+				FIELD_PREP_CONST(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0_RATIO4,
+						 1 << 5),
+		},
+		.hdr_decompress1 = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_HDR_DECOMPRESS1_CTRL_CAM0_ENABLE, 0),
+			.knee_ratio4 =
+				FIELD_PREP_CONST(NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0_RATIO4,
+						 1 << 5),
+		},
+		.obwb0 = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB0_CTRL_CAM0_OBPP, 3),
+			.r_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB0_R_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB0_R_CTRL_CAM0_OFFSET, 0),
+			.gr_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB0_GR_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB0_GR_CTRL_CAM0_OFFSET, 0),
+			.gb_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB0_GB_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB0_GB_CTRL_CAM0_OFFSET, 0),
+			.b_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB0_B_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB0_B_CTRL_CAM0_OFFSET, 0),
+		},
+		.obwb1 = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB1_CTRL_CAM0_OBPP, 2),
+			.r_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB1_R_CTRL_CAM0_GAIN, 1 << 8)	|
+				FIELD_PREP_CONST(NEO_OB_WB1_R_CTRL_CAM0_OFFSET, 0),
+			.gr_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB1_GR_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB1_GR_CTRL_CAM0_OFFSET, 0),
+			.gb_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB1_GB_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB1_GB_CTRL_CAM0_OFFSET, 0),
+			.b_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB1_B_CTRL_CAM0_GAIN, 1 << 8)	|
+				FIELD_PREP_CONST(NEO_OB_WB1_B_CTRL_CAM0_OFFSET, 0),
+		},
+		.obwb2 = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB2_CTRL_CAM0_OBPP, 3),
+			.r_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB2_R_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB2_R_CTRL_CAM0_OFFSET, 0),
+			.gr_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB2_GR_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB2_GR_CTRL_CAM0_OFFSET, 0),
+			.gb_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB2_GB_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB2_GB_CTRL_CAM0_OFFSET, 0),
+			.b_ctrl =
+				FIELD_PREP_CONST(NEO_OB_WB2_B_CTRL_CAM0_GAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_OB_WB2_B_CTRL_CAM0_OFFSET, 0),
+		},
+		.hdr_merge = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_CTRL_CAM0_ENABLE, 0) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_CTRL_CAM0_GAIN1BPP, 3) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_CTRL_CAM0_GAIN0BPP, 3) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_CTRL_CAM0_OBPP, 3),
+			.gain_scale =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_GAIN_SCALE_CAM0_SCALE1, 8) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_GAIN_SCALE_CAM0_SCALE0, 1 << 12),
+			.gain_shift =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_GAIN_SHIFT_CAM0_SHIFT1, 12) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_GAIN_SHIFT_CAM0_SHIFT0, 4),
+			.luma_th =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_LUMA_TH_CAM0_TH0, 4),
+			.luma_scale =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_LUMA_SCALE_CAM0_SCALE, 1 << 8) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_LUMA_SCALE_CAM0_SHIFT, 8) |
+				FIELD_PREP_CONST(NEO_HDR_MERGE_LUMA_SCALE_CAM0_THSHIFT, 8),
+			.downscale =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_DOWNSCALE_CAM0_IMGSCALE0, 8),
+			.upscale =
+				FIELD_PREP_CONST(NEO_HDR_MERGE_UPSCALE_CAM0_IMGSCALE1, 8),
+		},
+		.ctemp = {},
+		.rgbir = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_RGBIR_CTRL_CAM0_ENABLE, 0),
+			.ccm0 =
+				FIELD_PREP_CONST(NEO_RGBIR_CCM0_CAM0_CCM, 1 << 8),
+			.ccm1 =
+				FIELD_PREP_CONST(NEO_RGBIR_CCM1_CAM0_CCM, 1 << 8),
+			.ccm2 =
+				FIELD_PREP_CONST(NEO_RGBIR_CCM2_CAM0_CCM, 1 << 8),
+			.ccm0_th =
+				FIELD_PREP_CONST(NEO_RGBIR_CCM0_TH_CAM0_THRESHOLD, 0xff000),
+			.ccm1_th =
+				FIELD_PREP_CONST(NEO_RGBIR_CCM1_TH_CAM0_THRESHOLD, 0xff000),
+			.ccm2_th =
+				FIELD_PREP_CONST(NEO_RGBIR_CCM2_TH_CAM0_THRESHOLD, 0xff000),
+		},
+		.stat = {},
+		.ir_compress = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_IR_COMPRESS_CTRL_CAM0_ENABLE, 0) |
+				FIELD_PREP_CONST(NEO_IR_COMPRESS_CTRL_CAM0_OBPP, 0),
+			.knee_point1 =
+				FIELD_PREP_CONST(NEO_IR_COMPRESS_KNEE_POINT1_CAM0_KNEEPOINT,
+						 (1 << 20) - 1),
+			.knee_ratio01 =
+				FIELD_PREP_CONST(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0_RATIO0, 8),
+			.knee_ratio4 =
+				FIELD_PREP_CONST(NEO_IR_COMPRESS_KNEE_RATIO4_CAM0_RATIO4, 8),
+		},
+		.bnr = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_BNR_CTRL_CAM0_ENABLE, 1) |
+				FIELD_PREP_CONST(NEO_BNR_CTRL_CAM0_NHOOD, 0) |
+				FIELD_PREP_CONST(NEO_BNR_CTRL_CAM0_DEBUG, 0) |
+				FIELD_PREP_CONST(NEO_BNR_CTRL_CAM0_OBPP, 3),
+			.ypeak =
+				FIELD_PREP_CONST(NEO_BNR_YPEAK_CAM0_PEAK_OUTSEL, 0) |
+				FIELD_PREP_CONST(NEO_BNR_YPEAK_CAM0_PEAK_HIGH, 1 << 8) |
+				FIELD_PREP_CONST(NEO_BNR_YPEAK_CAM0_PEAK_SEL, 0) |
+				FIELD_PREP_CONST(NEO_BNR_YPEAK_CAM0_PEAK_LOW, 1 << 7),
+			.yedge_th0 =
+				FIELD_PREP_CONST(NEO_BNR_YEDGE_TH0_CAM0_EDGE_TH0, 20),
+			.yedge_scale =
+				FIELD_PREP_CONST(NEO_BNR_YEDGE_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_YEDGE_SCALE_CAM0_SCALE, 1 << 10),
+			.yedges_th0 =
+				FIELD_PREP_CONST(NEO_BNR_YEDGES_TH0_CAM0_EDGE_TH0, 20),
+			.yedges_scale =
+				FIELD_PREP_CONST(NEO_BNR_YEDGES_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_YEDGES_SCALE_CAM0_SCALE, 1 << 10),
+			.yedgea_th0 =
+				FIELD_PREP_CONST(NEO_BNR_YEDGEA_TH0_CAM0_EDGE_TH0, 20),
+			.yedgea_scale =
+				FIELD_PREP_CONST(NEO_BNR_YEDGEA_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_YEDGEA_SCALE_CAM0_SCALE, 10),
+			.yluma_x_th0 =
+				FIELD_PREP_CONST(NEO_BNR_YLUMA_X_TH0_CAM0_TH, 20),
+			.yluma_y_th =
+				FIELD_PREP_CONST(NEO_BNR_YLUMA_Y_TH_CAM0_LUMA_Y_TH1, 1 << 8) |
+				FIELD_PREP_CONST(NEO_BNR_YLUMA_Y_TH_CAM0_LUMA_Y_TH0, 10),
+			.yluma_scale =
+				FIELD_PREP_CONST(NEO_BNR_YLUMA_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_YLUMA_SCALE_CAM0_SCALE, 1 << 10),
+			.yalpha_gain =
+				FIELD_PREP_CONST(NEO_BNR_YALPHA_GAIN_CAM0_OFFSET, 0) |
+				FIELD_PREP_CONST(NEO_BNR_YALPHA_GAIN_CAM0_GAIN, 1 << 8),
+			.cpeak =
+				FIELD_PREP_CONST(NEO_BNR_CPEAK_CAM0_PEAK_OUTSEL, 0) |
+				FIELD_PREP_CONST(NEO_BNR_CPEAK_CAM0_PEAK_HIGH, 1 << 8) |
+				FIELD_PREP_CONST(NEO_BNR_CPEAK_CAM0_PEAK_SEL, 0) |
+				FIELD_PREP_CONST(NEO_BNR_CPEAK_CAM0_PEAK_LOW, 1 << 7),
+			.cedge_th0 =
+				FIELD_PREP_CONST(NEO_BNR_CEDGE_TH0_CAM0_EDGE_TH0, 20),
+			.cedge_scale =
+				FIELD_PREP_CONST(NEO_BNR_CEDGE_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_CEDGE_SCALE_CAM0_SCALE, 1 << 10),
+			.cedges_th0 =
+				FIELD_PREP_CONST(NEO_BNR_CEDGES_TH0_CAM0_EDGE_TH0, 20),
+			.cedges_scale =
+				FIELD_PREP_CONST(NEO_BNR_CEDGES_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_CEDGES_SCALE_CAM0_SCALE, 1 << 10),
+			.cedgea_th0 =
+				FIELD_PREP_CONST(NEO_BNR_CEDGEA_TH0_CAM0_EDGE_TH0, 20),
+			.cedgea_scale =
+				FIELD_PREP_CONST(NEO_BNR_CEDGEA_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_CEDGEA_SCALE_CAM0_SCALE, 1 << 10),
+			.cluma_x_th0 =
+				FIELD_PREP_CONST(NEO_BNR_CLUMA_X_TH0_CAM0_TH, 20),
+			.cluma_y_th =
+				FIELD_PREP_CONST(NEO_BNR_CLUMA_Y_TH_CAM0_LUMA_Y_TH1, 1 << 8) |
+				FIELD_PREP_CONST(NEO_BNR_CLUMA_Y_TH_CAM0_LUMA_Y_TH0, 10),
+			.cluma_scale =
+				FIELD_PREP_CONST(NEO_BNR_CLUMA_SCALE_CAM0_SHIFT, 10) |
+				FIELD_PREP_CONST(NEO_BNR_CLUMA_SCALE_CAM0_SCALE, 1 << 10),
+			.calpha_gain =
+				FIELD_PREP_CONST(NEO_BNR_CALPHA_GAIN_CAM0_OFFSET, 0) |
+				FIELD_PREP_CONST(NEO_BNR_CALPHA_GAIN_CAM0_GAIN, 1 << 8),
+			.stretch =
+				FIELD_PREP_CONST(NEO_BNR_STRETCH_CAM0_GAIN, 1 << 8),
+		},
+		.idbg1 = {
+			.line_num_t =
+				NEO_IDBG1_LINE_NUM_LINE_NUM,
+		},
+		.demosaic = {
+			.ctrl =
+				FIELD_PREP_CONST(NEO_DEMOSAIC_CTRL_CAM0_FMT, 0),
+			.activity_ctl =
+				FIELD_PREP_CONST(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0_ACT_RATIO, 1 << 8) |
+				FIELD_PREP_CONST(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0_ALPHA, 1 << 8),
+			.dynamics_ctl0 =
+				FIELD_PREP_CONST(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0_STRENGTHC,
+						 1 << 8) |
+				FIELD_PREP_CONST(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0_STRENGTHG,
+						 1 << 8),
+			.dynamics_ctl2 =
+				FIELD_PREP_CONST(NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0_MAX_IMPACT,
+						 1 << 7),
+		},
+		.rgb2yuv = {
+			.gain_ctrl =
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0_BGAIN, 1 << 8) |
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0_RGAIN, 1 << 8),
+			/* Constants defined by V4L2_YCBCR_ENC_601, full range and
+			 * formatted in s8.8. This matrix will define the gcm.imat_rxcy
+			 * as its inverse.
+			 * https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspaces-details.html
+			 *	{77, 150,  29},
+			 *	{-43, -85, 128},
+			 *	{128, -107, -21},
+			 */
+			.mat0 =
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_MAT0_CAM0_R0C0, 77) |
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_MAT0_CAM0_R0C1, 150),
+			.mat1 =
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_MAT1_CAM0_R0C2, 29),
+			.mat2 =
+				FIELD_PREP_S16_CONST(NEO_RGB_TO_YUV_MAT2_CAM0_R1C0, -43) |
+				FIELD_PREP_S16_CONST(NEO_RGB_TO_YUV_MAT2_CAM0_R1C1, -85),
+			.mat3 =
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_MAT3_CAM0_R1C2, 128),
+			.mat4 =
+				FIELD_PREP_CONST(NEO_RGB_TO_YUV_MAT4_CAM0_R2C0, 128) |
+				FIELD_PREP_S16_CONST(NEO_RGB_TO_YUV_MAT4_CAM0_R2C1, -107),
+			.mat5 =
+				FIELD_PREP_S16_CONST(NEO_RGB_TO_YUV_MAT5_CAM0_R2C2, -21),
+		},
+		.drc = {
+			.gbl_gain =
+				FIELD_PREP_CONST(NEO_DRC_GBL_GAIN_CAM0_GAIN, 1 << 8),
+			.lcl_stretch =
+				FIELD_PREP_CONST(NEO_DRC_LCL_STRETCH_CAM0_STRETCH, 1 << 8),
+			.alpha =
+				FIELD_PREP_CONST(NEO_DRC_ALPHA_CAM0_ALPHA, 1 << 8),
+		},
+		.cas = {
+			.gain =
+				FIELD_PREP_CONST(NEO_CAS_GAIN_CAM0_SCALE, 1),
+		},
+		.packetizer = {
+			.ch0_ctrl =
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH0_CTRL_CAM0_OBPP, 6) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH0_CTRL_CAM0_RSA, 4) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH0_CTRL_CAM0_LSA, 0),
+			.ch12_ctrl =
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH12_CTRL_CAM0_OBPP, 6) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH12_CTRL_CAM0_RSA, 4) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH12_CTRL_CAM0_LSA, 0) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_CH12_CTRL_CAM0_SUBSAMPLE, 0),
+			.pack_ctrl =
+				FIELD_PREP_CONST(NEO_PACKETIZER_PACK_CTRL_CAM0_TYPE, 1) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER0, 0) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER1, 1) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER2, 2) |
+				FIELD_PREP_CONST(NEO_PACKETIZER_PACK_CTRL_CAM0_A0S, 0),
+		},
+		.gcm = {
+			.imat0 =
+				FIELD_PREP_CONST(NEO_GCM_IMAT0_CAM0_R0C0, 256) |
+				FIELD_PREP_CONST(NEO_GCM_IMAT0_CAM0_R0C1, 0),
+			.imat1 =
+				FIELD_PREP_CONST(NEO_GCM_IMAT1_CAM0_R0C2, 359),
+			.imat2 =
+				FIELD_PREP_CONST(NEO_GCM_IMAT2_CAM0_R1C0, 256) |
+				FIELD_PREP_S16_CONST(NEO_GCM_IMAT2_CAM0_R1C1, -88),
+			.imat3 =
+				FIELD_PREP_S16_CONST(NEO_GCM_IMAT3_CAM0_R1C2, -183),
+			.imat4 =
+				FIELD_PREP_CONST(NEO_GCM_IMAT4_CAM0_R2C0, 256) |
+				FIELD_PREP_CONST(NEO_GCM_IMAT4_CAM0_R2C1, 454),
+			.imat5 =
+				FIELD_PREP_CONST(NEO_GCM_IMAT5_CAM0_R2C2, 0),
+			.omat0 =
+				FIELD_PREP_CONST(NEO_GCM_OMAT0_CAM0_R0C0, 256),
+			.omat2 =
+				FIELD_PREP_CONST(NEO_GCM_OMAT2_CAM0_R1C1, 256),
+			.omat5 =
+				FIELD_PREP_CONST(NEO_GCM_OMAT5_CAM0_R2C2, 256),
+			.mat_confg =
+				FIELD_PREP_CONST(NEO_GCM_MAT_CONFG_CAM0_SIGN_CONFG, 1),
+		},
+	},
+	.gtm = {
+		/* Fill default global tonemap lut with 1.0 value (256) */
+		.drc_global_tonemap = { [0 ... NEO_DRC_GLOBAL_TONEMAP_SIZE - 1] = (1 << 8) },
+	},
+};
+
+union neoisp_params_block_u {
+	struct v4l2_isp_block_header header;
+	struct neoisp_pipe_conf_cfg_es pipe_conf;
+	struct neoisp_head_color_cfg_es head_color;
+	struct neoisp_hdr_decompress0_cfg_es hdr_decompress0;
+	struct neoisp_hdr_decompress1_cfg_es hdr_decompress1;
+	struct neoisp_obwb_cfg_es obwb;
+	struct neoisp_hdr_merge_cfg_es hdr_merge;
+	struct neoisp_rgbir_cfg_es rgbir;
+	struct neoisp_stat_cfg_es stat;
+	struct neoisp_ir_compress_cfg_es ir_compress;
+	struct neoisp_bnr_cfg_es bnr;
+	struct neoisp_vignetting_ctrl_cfg_es vignetting_ctrl;
+	struct neoisp_ctemp_cfg_es ctemp;
+	struct neoisp_demosaic_cfg_es demosaic;
+	struct neoisp_rgb2yuv_cfg_es rgb2yuv;
+	struct neoisp_dr_comp_cfg_es dr_comp;
+	struct neoisp_nr_cfg_es nr;
+	struct neoisp_af_cfg_es af;
+	struct neoisp_ee_cfg_es ee;
+	struct neoisp_df_cfg_es df;
+	struct neoisp_convmed_cfg_es convmed;
+	struct neoisp_cas_cfg_es cas;
+	struct neoisp_gcm_cfg_es gcm;
+	struct neoisp_vignetting_table_mem_params_es vignetting_table;
+	struct neoisp_drc_global_tonemap_mem_params_es drc_global_tonemap;
+	struct neoisp_drc_local_tonemap_mem_params_es drc_local_tonemap;
+};
+
+union neoisp_stats_block_u {
+	struct v4l2_isp_block_header header;
+	struct neoisp_ctemp_reg_stats_es rctemp;
+	struct neoisp_drc_reg_stats_es rdrc;
+	struct neoisp_af_reg_stats_es raf;
+	struct neoisp_bnr_reg_stats_es rbnr;
+	struct neoisp_nr_reg_stats_es rnr;
+	struct neoisp_ee_reg_stats_es ree;
+	struct neoisp_df_reg_stats_es rdf;
+	struct neoisp_ctemp_mem_stats_es mctemp;
+	struct neoisp_rgbir_mem_stats_es mrgbir;
+	struct neoisp_hist_mem_stats_es mhist;
+	struct neoisp_drc_mem_stats_es mdrc;
+};
+
+static dma_addr_t get_addr(struct neoisp_buffer_s *buf, u32 num_plane)
+{
+	if (buf)
+		return vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, num_plane);
+	return 0;
+}
+
+static u32 *get_vaddr(struct neoisp_buffer_s *buf)
+{
+	if (buf)
+		return vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	return NULL;
+}
+
+/*
+ * Extract offset and size in bytes from memory region map
+ */
+static inline void get_offsize(enum isp_block_map_e map, u32 *offset, u32 *size)
+{
+	*offset = ISP_GET_OFF(map);
+	*size = ISP_GET_SZ(map);
+}
+
+static inline void
+local_mem_blk_write(struct neoisp_dev_s *neoispd, enum isp_block_map_e map, void *src)
+{
+	u32 offset, count;
+
+	get_offsize(map, &offset, &count);
+	memcpy(neoispd->local_mem + offset, src, count);
+}
+
+static inline void
+local_mem_blk_read(struct neoisp_dev_s *neoispd, enum isp_block_map_e map, void *dst)
+{
+	u32 offset, count;
+
+	get_offsize(map, &offset, &count);
+	memcpy(dst, neoispd->local_mem + offset, count);
+}
+
+static inline void
+reg_blk_write(struct neoisp_dev_s *neoispd, u32 offset, u32 *src, size_t count)
+{
+	size_t size = 0;
+
+	while (size < count) {
+		neoisp_wr(neoispd, offset + size, *src++);
+		size += sizeof(u32);
+	}
+}
+
+static inline void
+reg_blk_read(struct neoisp_dev_s *neoispd, u32 offset, u32 *dst, size_t count)
+{
+	size_t size = 0;
+
+	while (size < count) {
+		*dst++ = neoisp_rd(neoispd, offset + size);
+		size += sizeof(u32);
+	}
+}
+
+/*------------------------------------------------------------------------------
+ * Extensible parameters format handling
+ */
+static void
+neoisp_params_handler_pipe_conf(struct neoisp_context_s *ctx,
+				const union neoisp_params_block_u *block)
+{
+	struct neoisp_pipe_conf_s *pc = &ctx->hw.pipe_conf;
+	const struct neoisp_pipe_conf_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->pipe_conf.cfg;
+
+	FIELD_MODIFY(NEO_PIPE_CONF_IMG_CONF_CAM0_INALIGN0,
+		     &pc->img_conf, cfg->img_conf_inalign0);
+	FIELD_MODIFY(NEO_PIPE_CONF_IMG_CONF_CAM0_LPALIGN0,
+		     &pc->img_conf, cfg->img_conf_lpalign0);
+	FIELD_MODIFY(NEO_PIPE_CONF_IMG_CONF_CAM0_INALIGN1,
+		     &pc->img_conf, cfg->img_conf_inalign1);
+	FIELD_MODIFY(NEO_PIPE_CONF_IMG_CONF_CAM0_LPALIGN1,
+		     &pc->img_conf, cfg->img_conf_lpalign1);
+}
+
+static void
+neoisp_params_handler_head_color(struct neoisp_context_s *ctx,
+				 const union neoisp_params_block_u *block)
+{
+	struct neoisp_hc_s *hc = &ctx->hw.hc;
+	const struct neoisp_head_color_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->head_color.cfg;
+
+	hc->ctrl =
+		FIELD_PREP(NEO_HC_CTRL_CAM0_HOFFSET, cfg->ctrl_hoffset) |
+		FIELD_PREP(NEO_HC_CTRL_CAM0_VOFFSET, cfg->ctrl_voffset);
+}
+
+static void
+neoisp_params_handler_hdr_decompress0(struct neoisp_context_s *ctx,
+				      const union neoisp_params_block_u *block)
+{
+	struct neoisp_hdr_decompress0_s *hd0 = &ctx->hw.hdr_decompress0;
+	const struct neoisp_hdr_decompress0_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_HDR_DECOMPRESS0_CTRL_CAM0_ENABLE, &hd0->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_HDR_DECOMPRESS0_CTRL_CAM0_ENABLE, &hd0->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->hdr_decompress0.cfg;
+
+	hd0->knee_point1 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0_KNEEPOINT, cfg->knee_point1);
+	hd0->knee_point2 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0_KNEEPOINT, cfg->knee_point2);
+	hd0->knee_point3 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0_KNEEPOINT, cfg->knee_point3);
+	hd0->knee_point4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0_KNEEPOINT, cfg->knee_point4);
+	hd0->knee_offset0 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0_OFFSET, cfg->knee_offset0);
+	hd0->knee_offset1 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0_OFFSET, cfg->knee_offset1);
+	hd0->knee_offset2 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0_OFFSET, cfg->knee_offset2);
+	hd0->knee_offset3 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0_OFFSET, cfg->knee_offset3);
+	hd0->knee_offset4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0_OFFSET, cfg->knee_offset4);
+	hd0->knee_ratio01 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0_RATIO0, cfg->knee_ratio0) |
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0_RATIO1, cfg->knee_ratio1);
+	hd0->knee_ratio23 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0_RATIO2, cfg->knee_ratio2) |
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0_RATIO3, cfg->knee_ratio3);
+	hd0->knee_ratio4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0_RATIO4, cfg->knee_ratio4);
+	hd0->knee_npoint0 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0_KNEEPOINT, cfg->knee_npoint0);
+	hd0->knee_npoint1 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0_KNEEPOINT, cfg->knee_npoint1);
+	hd0->knee_npoint2 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0_KNEEPOINT, cfg->knee_npoint2);
+	hd0->knee_npoint3 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0_KNEEPOINT, cfg->knee_npoint3);
+	hd0->knee_npoint4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0_KNEEPOINT, cfg->knee_npoint4);
+}
+
+static void
+neoisp_params_handler_hdr_decompress1(struct neoisp_context_s *ctx,
+				      const union neoisp_params_block_u *block)
+{
+	struct neoisp_hdr_decompress1_s *hd1 = &ctx->hw.hdr_decompress1;
+	const struct neoisp_hdr_decompress1_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_HDR_DECOMPRESS1_CTRL_CAM0_ENABLE, &hd1->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_HDR_DECOMPRESS1_CTRL_CAM0_ENABLE, &hd1->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->hdr_decompress1.cfg;
+
+	hd1->knee_point1 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0_KNEEPOINT, cfg->knee_point1);
+	hd1->knee_point2 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0_KNEEPOINT, cfg->knee_point2);
+	hd1->knee_point3 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0_KNEEPOINT, cfg->knee_point3);
+	hd1->knee_point4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0_KNEEPOINT, cfg->knee_point4);
+	hd1->knee_offset0 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0_OFFSET, cfg->knee_offset0);
+	hd1->knee_offset1 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0_OFFSET, cfg->knee_offset1);
+	hd1->knee_offset2 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0_OFFSET, cfg->knee_offset2);
+	hd1->knee_offset3 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0_OFFSET, cfg->knee_offset3);
+	hd1->knee_offset4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0_OFFSET, cfg->knee_offset4);
+	hd1->knee_ratio01 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0_RATIO0, cfg->knee_ratio0) |
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0_RATIO1, cfg->knee_ratio1);
+	hd1->knee_ratio23 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0_RATIO2, cfg->knee_ratio2) |
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0_RATIO3, cfg->knee_ratio3);
+	hd1->knee_ratio4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0_RATIO4, cfg->knee_ratio4);
+	hd1->knee_npoint0 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0_KNEEPOINT, cfg->knee_npoint0);
+	hd1->knee_npoint1 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0_KNEEPOINT, cfg->knee_npoint1);
+	hd1->knee_npoint2 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0_KNEEPOINT, cfg->knee_npoint2);
+	hd1->knee_npoint3 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0_KNEEPOINT, cfg->knee_npoint3);
+	hd1->knee_npoint4 =
+		FIELD_PREP(NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0_KNEEPOINT, cfg->knee_npoint4);
+}
+
+static void
+__neoisp_params_handler_obwb(struct neoisp_context_s *ctx,
+			     const union neoisp_params_block_u *block,
+			     u8 id)
+{
+	struct neoisp_obwb_s *obwb;
+	const struct neoisp_obwb_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	switch (id) {
+	case 0:
+		obwb = &ctx->hw.obwb0;
+		break;
+	case 1:
+		obwb = &ctx->hw.obwb1;
+		break;
+	case 2:
+		obwb = &ctx->hw.obwb2;
+		break;
+	default:
+		return;
+	}
+
+	cfg = &block->obwb.cfg;
+
+	obwb->ctrl =
+		FIELD_PREP(NEO_OB_WB0_CTRL_CAM0_OBPP, cfg->ctrl_obpp);
+	obwb->r_ctrl =
+		FIELD_PREP(NEO_OB_WB0_R_CTRL_CAM0_OFFSET, cfg->r_ctrl_offset) |
+		FIELD_PREP(NEO_OB_WB0_R_CTRL_CAM0_GAIN, cfg->r_ctrl_gain);
+	obwb->gr_ctrl =
+		FIELD_PREP(NEO_OB_WB0_GR_CTRL_CAM0_OFFSET, cfg->gr_ctrl_offset) |
+		FIELD_PREP(NEO_OB_WB0_GR_CTRL_CAM0_GAIN, cfg->gr_ctrl_gain);
+	obwb->gb_ctrl =
+		FIELD_PREP(NEO_OB_WB0_GB_CTRL_CAM0_OFFSET, cfg->gb_ctrl_offset) |
+		FIELD_PREP(NEO_OB_WB0_GB_CTRL_CAM0_GAIN, cfg->gb_ctrl_gain);
+	obwb->b_ctrl =
+		FIELD_PREP(NEO_OB_WB0_B_CTRL_CAM0_OFFSET, cfg->b_ctrl_offset) |
+		FIELD_PREP(NEO_OB_WB0_B_CTRL_CAM0_GAIN, cfg->b_ctrl_gain);
+}
+
+static void neoisp_params_handler_obwb0(struct neoisp_context_s *ctx,
+					const union neoisp_params_block_u *block)
+{
+	__neoisp_params_handler_obwb(ctx, block, 0);
+}
+
+static void neoisp_params_handler_obwb1(struct neoisp_context_s *ctx,
+					const union neoisp_params_block_u *block)
+{
+	__neoisp_params_handler_obwb(ctx, block, 1);
+}
+
+static void neoisp_params_handler_obwb2(struct neoisp_context_s *ctx,
+					const union neoisp_params_block_u *block)
+{
+	__neoisp_params_handler_obwb(ctx, block, 2);
+}
+
+static void
+neoisp_params_handler_hdr_merge(struct neoisp_context_s *ctx,
+				const union neoisp_params_block_u *block)
+{
+	struct neoisp_hdr_merge_s *hmg = &ctx->hw.hdr_merge;
+	const struct neoisp_hdr_merge_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_ENABLE, &hmg->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_ENABLE, &hmg->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->hdr_merge.cfg;
+
+	FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_OBPP, &hmg->ctrl, cfg->ctrl_obpp);
+	FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_MOTION_FIX_EN, &hmg->ctrl, cfg->ctrl_motion_fix_en);
+	FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_BLEND_3X3, &hmg->ctrl, cfg->ctrl_blend_3x3);
+	FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_GAIN0BPP, &hmg->ctrl, cfg->ctrl_gain0bpp);
+	FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_GAIN1BPP, &hmg->ctrl, cfg->ctrl_gain1bpp);
+
+	hmg->gain_offset =
+		FIELD_PREP(NEO_HDR_MERGE_GAIN_OFFSET_CAM0_OFFSET0, cfg->gain_offset_offset0) |
+		FIELD_PREP(NEO_HDR_MERGE_GAIN_OFFSET_CAM0_OFFSET1, cfg->gain_offset_offset1);
+	hmg->gain_scale =
+		FIELD_PREP(NEO_HDR_MERGE_GAIN_SCALE_CAM0_SCALE0, cfg->gain_scale_scale0) |
+		FIELD_PREP(NEO_HDR_MERGE_GAIN_SCALE_CAM0_SCALE1, cfg->gain_scale_scale1);
+	hmg->gain_shift =
+		FIELD_PREP(NEO_HDR_MERGE_GAIN_SHIFT_CAM0_SHIFT0, cfg->gain_shift_shift0) |
+		FIELD_PREP(NEO_HDR_MERGE_GAIN_SHIFT_CAM0_SHIFT1, cfg->gain_shift_shift1);
+	hmg->luma_th =
+		FIELD_PREP(NEO_HDR_MERGE_LUMA_TH_CAM0_TH0, cfg->luma_th_th0);
+	hmg->luma_scale =
+		FIELD_PREP(NEO_HDR_MERGE_LUMA_SCALE_CAM0_SCALE, cfg->luma_scale_scale) |
+		FIELD_PREP(NEO_HDR_MERGE_LUMA_SCALE_CAM0_SHIFT, cfg->luma_scale_shift) |
+		FIELD_PREP(NEO_HDR_MERGE_LUMA_SCALE_CAM0_THSHIFT, cfg->luma_scale_thshift);
+	hmg->downscale =
+		FIELD_PREP(NEO_HDR_MERGE_DOWNSCALE_CAM0_IMGSCALE0, cfg->downscale_imgscale0) |
+		FIELD_PREP(NEO_HDR_MERGE_DOWNSCALE_CAM0_IMGSCALE1, cfg->downscale_imgscale1);
+	hmg->upscale =
+		FIELD_PREP(NEO_HDR_MERGE_UPSCALE_CAM0_IMGSCALE0, cfg->upscale_imgscale0) |
+		FIELD_PREP(NEO_HDR_MERGE_UPSCALE_CAM0_IMGSCALE1, cfg->upscale_imgscale1);
+	hmg->post_scale =
+		FIELD_PREP(NEO_HDR_MERGE_POST_SCALE_CAM0_SCALE, cfg->post_scale_scale);
+}
+
+static void
+neoisp_params_handler_rgbir(struct neoisp_context_s *ctx,
+			    const union neoisp_params_block_u *block)
+{
+	struct neoisp_rgbir_s *rgbir = &ctx->hw.rgbir;
+	const struct neoisp_rgbir_cfg_s *cfg;
+	const struct neoisp_stat_hist_cfg_s *hist;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_RGBIR_CTRL_CAM0_ENABLE, &rgbir->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_RGBIR_CTRL_CAM0_ENABLE, &rgbir->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->rgbir.cfg;
+
+	rgbir->ccm0 =
+		FIELD_PREP(NEO_RGBIR_CCM0_CAM0_CCM, cfg->ccm0_ccm);
+	rgbir->ccm1 =
+		FIELD_PREP(NEO_RGBIR_CCM1_CAM0_CCM, cfg->ccm1_ccm);
+	rgbir->ccm2 =
+		FIELD_PREP(NEO_RGBIR_CCM2_CAM0_CCM, cfg->ccm2_ccm);
+	rgbir->ccm0_th =
+		FIELD_PREP(NEO_RGBIR_CCM0_TH_CAM0_THRESHOLD, cfg->ccm0_th_threshold);
+	rgbir->ccm1_th =
+		FIELD_PREP(NEO_RGBIR_CCM1_TH_CAM0_THRESHOLD, cfg->ccm1_th_threshold);
+	rgbir->ccm2_th =
+		FIELD_PREP(NEO_RGBIR_CCM2_TH_CAM0_THRESHOLD, cfg->ccm2_th_threshold);
+	rgbir->roi0_pos =
+		FIELD_PREP(NEO_RGBIR_ROI0_POS_CAM0_XPOS, cfg->roi[0].xpos) |
+		FIELD_PREP(NEO_RGBIR_ROI0_POS_CAM0_YPOS, cfg->roi[0].ypos);
+	rgbir->roi0_size =
+		FIELD_PREP(NEO_RGBIR_ROI0_SIZE_CAM0_WIDTH, cfg->roi[0].width) |
+		FIELD_PREP(NEO_RGBIR_ROI0_SIZE_CAM0_HEIGHT, cfg->roi[0].height);
+	rgbir->roi1_pos =
+		FIELD_PREP(NEO_RGBIR_ROI1_POS_CAM0_XPOS, cfg->roi[1].xpos) |
+		FIELD_PREP(NEO_RGBIR_ROI1_POS_CAM0_YPOS, cfg->roi[1].ypos);
+	rgbir->roi1_size =
+		FIELD_PREP(NEO_RGBIR_ROI1_SIZE_CAM0_WIDTH, cfg->roi[1].width) |
+		FIELD_PREP(NEO_RGBIR_ROI1_SIZE_CAM0_HEIGHT, cfg->roi[1].height);
+
+	hist = &cfg->hists[0];
+	rgbir->hist0_ctrl =
+		FIELD_PREP(NEO_RGBIR_HIST0_CTRL_CAM0_LIN_INPUT1_LOG,
+			   hist->hist_ctrl_lin_input1_log) |
+		FIELD_PREP(NEO_RGBIR_HIST0_CTRL_CAM0_DIR_INPUT1_DIF,
+			   hist->hist_ctrl_dir_input1_dif) |
+		FIELD_PREP(NEO_RGBIR_HIST0_CTRL_CAM0_PATTERN, hist->hist_ctrl_pattern) |
+		FIELD_PREP(NEO_RGBIR_HIST0_CTRL_CAM0_CHANNEL, hist->hist_ctrl_channel) |
+		FIELD_PREP(NEO_RGBIR_HIST0_CTRL_CAM0_OFFSET, hist->hist_ctrl_offset);
+	rgbir->hist0_scale =
+		FIELD_PREP(NEO_RGBIR_HIST0_SCALE_CAM0_SCALE, hist->hist_scale_scale);
+
+	hist = &cfg->hists[1];
+	rgbir->hist1_ctrl =
+		FIELD_PREP(NEO_RGBIR_HIST1_CTRL_CAM0_LIN_INPUT1_LOG,
+			   hist->hist_ctrl_lin_input1_log) |
+		FIELD_PREP(NEO_RGBIR_HIST1_CTRL_CAM0_DIR_INPUT1_DIF,
+			   hist->hist_ctrl_dir_input1_dif) |
+		FIELD_PREP(NEO_RGBIR_HIST1_CTRL_CAM0_PATTERN, hist->hist_ctrl_pattern) |
+		FIELD_PREP(NEO_RGBIR_HIST1_CTRL_CAM0_CHANNEL, hist->hist_ctrl_channel) |
+		FIELD_PREP(NEO_RGBIR_HIST1_CTRL_CAM0_OFFSET, hist->hist_ctrl_offset);
+	rgbir->hist1_scale =
+		FIELD_PREP(NEO_RGBIR_HIST1_SCALE_CAM0_SCALE, hist->hist_scale_scale);
+}
+
+static void
+neoisp_params_handler_stat(struct neoisp_context_s *ctx,
+			   const union neoisp_params_block_u *block)
+{
+	struct neoisp_stat_s *stat = &ctx->hw.stat;
+	const struct neoisp_stat_cfg_s *cfg;
+	const struct neoisp_stat_hist_cfg_s *hist;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->stat.cfg;
+
+	stat->roi0_pos =
+		FIELD_PREP(NEO_STAT_ROI0_POS_CAM0_XPOS, cfg->roi0.xpos) |
+		FIELD_PREP(NEO_STAT_ROI0_POS_CAM0_YPOS, cfg->roi0.ypos);
+	stat->roi0_size =
+		FIELD_PREP(NEO_STAT_ROI0_SIZE_CAM0_WIDTH, cfg->roi0.width) |
+		FIELD_PREP(NEO_STAT_ROI0_SIZE_CAM0_HEIGHT, cfg->roi0.height);
+	stat->roi1_pos =
+		FIELD_PREP(NEO_STAT_ROI1_POS_CAM0_XPOS, cfg->roi1.xpos) |
+		FIELD_PREP(NEO_STAT_ROI1_POS_CAM0_YPOS, cfg->roi1.ypos);
+	stat->roi1_size =
+		FIELD_PREP(NEO_STAT_ROI1_SIZE_CAM0_WIDTH, cfg->roi1.width) |
+		FIELD_PREP(NEO_STAT_ROI1_SIZE_CAM0_HEIGHT, cfg->roi1.height);
+
+	hist = &cfg->hists[0];
+	stat->hist0_ctrl =
+		FIELD_PREP(NEO_STAT_HIST0_CTRL_CAM0_LIN_INPUT1_LOG,
+			   hist->hist_ctrl_lin_input1_log) |
+		FIELD_PREP(NEO_STAT_HIST0_CTRL_CAM0_DIR_INPUT1_DIF,
+			   hist->hist_ctrl_dir_input1_dif) |
+		FIELD_PREP(NEO_STAT_HIST0_CTRL_CAM0_PATTERN, hist->hist_ctrl_pattern) |
+		FIELD_PREP(NEO_STAT_HIST0_CTRL_CAM0_CHANNEL, hist->hist_ctrl_channel) |
+		FIELD_PREP(NEO_STAT_HIST0_CTRL_CAM0_OFFSET, hist->hist_ctrl_offset);
+	stat->hist0_scale =
+		FIELD_PREP(NEO_STAT_HIST0_SCALE_CAM0_SCALE, hist->hist_scale_scale);
+
+	hist = &cfg->hists[1];
+	stat->hist1_ctrl =
+		FIELD_PREP(NEO_STAT_HIST1_CTRL_CAM0_LIN_INPUT1_LOG,
+			   hist->hist_ctrl_lin_input1_log) |
+		FIELD_PREP(NEO_STAT_HIST1_CTRL_CAM0_DIR_INPUT1_DIF,
+			   hist->hist_ctrl_dir_input1_dif) |
+		FIELD_PREP(NEO_STAT_HIST1_CTRL_CAM0_PATTERN, hist->hist_ctrl_pattern) |
+		FIELD_PREP(NEO_STAT_HIST1_CTRL_CAM0_CHANNEL, hist->hist_ctrl_channel) |
+		FIELD_PREP(NEO_STAT_HIST1_CTRL_CAM0_OFFSET, hist->hist_ctrl_offset);
+	stat->hist1_scale =
+		FIELD_PREP(NEO_STAT_HIST1_SCALE_CAM0_SCALE, hist->hist_scale_scale);
+
+	hist = &cfg->hists[2];
+	stat->hist2_ctrl =
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_LIN_INPUT1_LOG,
+			   hist->hist_ctrl_lin_input1_log) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_DIR_INPUT1_DIF,
+			   hist->hist_ctrl_dir_input1_dif) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_PATTERN, hist->hist_ctrl_pattern) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_CHANNEL, hist->hist_ctrl_channel) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_OFFSET, hist->hist_ctrl_offset);
+	stat->hist2_scale =
+		FIELD_PREP(NEO_STAT_HIST2_SCALE_CAM0_SCALE, hist->hist_scale_scale);
+
+	hist = &cfg->hists[3];
+	stat->hist3_ctrl =
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_LIN_INPUT1_LOG,
+			   hist->hist_ctrl_lin_input1_log) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_DIR_INPUT1_DIF,
+			   hist->hist_ctrl_dir_input1_dif) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_PATTERN, hist->hist_ctrl_pattern) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_CHANNEL, hist->hist_ctrl_channel) |
+		FIELD_PREP(NEO_STAT_HIST2_CTRL_CAM0_OFFSET, hist->hist_ctrl_offset);
+	stat->hist3_scale =
+		FIELD_PREP(NEO_STAT_HIST3_SCALE_CAM0_SCALE, hist->hist_scale_scale);
+}
+
+static void
+neoisp_params_handler_ir_compress(struct neoisp_context_s *ctx,
+				  const union neoisp_params_block_u *block)
+{
+	struct neoisp_ir_compress_s *ircomp = &ctx->hw.ir_compress;
+	const struct neoisp_ir_compress_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_IR_COMPRESS_CTRL_CAM0_ENABLE, &ircomp->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_IR_COMPRESS_CTRL_CAM0_ENABLE, &ircomp->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->ir_compress.cfg;
+
+	FIELD_MODIFY(NEO_IR_COMPRESS_CTRL_CAM0_OBPP, &ircomp->ctrl, cfg->ctrl_obpp);
+
+	ircomp->knee_point1 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_POINT1_CAM0_KNEEPOINT, cfg->knee_point1_kneepoint);
+	ircomp->knee_point2 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_POINT2_CAM0_KNEEPOINT, cfg->knee_point2_kneepoint);
+	ircomp->knee_point3 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_POINT3_CAM0_KNEEPOINT, cfg->knee_point3_kneepoint);
+	ircomp->knee_point4 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_POINT4_CAM0_KNEEPOINT, cfg->knee_point4_kneepoint);
+	ircomp->knee_offset0 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0_OFFSET, cfg->knee_offset0_offset);
+	ircomp->knee_offset1 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0_OFFSET, cfg->knee_offset1_offset);
+	ircomp->knee_offset2 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0_OFFSET, cfg->knee_offset2_offset);
+	ircomp->knee_offset3 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0_OFFSET, cfg->knee_offset3_offset);
+	ircomp->knee_offset4 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0_OFFSET, cfg->knee_offset4_offset);
+	ircomp->knee_ratio01 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0_RATIO0, cfg->knee_ratio01_ratio0) |
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0_RATIO1, cfg->knee_ratio01_ratio1);
+	ircomp->knee_ratio23 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_RATIO23_CAM0_RATIO2, cfg->knee_ratio23_ratio2) |
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_RATIO23_CAM0_RATIO3, cfg->knee_ratio23_ratio3);
+	ircomp->knee_ratio4 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_RATIO4_CAM0_RATIO4, cfg->knee_ratio4_ratio4);
+	ircomp->knee_npoint0 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0_KNEEPOINT,
+			   cfg->knee_npoint0_kneepoint);
+	ircomp->knee_npoint1 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0_KNEEPOINT,
+			   cfg->knee_npoint1_kneepoint);
+	ircomp->knee_npoint2 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0_KNEEPOINT,
+			   cfg->knee_npoint2_kneepoint);
+	ircomp->knee_npoint3 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0_KNEEPOINT,
+			   cfg->knee_npoint3_kneepoint);
+	ircomp->knee_npoint4 =
+		FIELD_PREP(NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0_KNEEPOINT,
+			   cfg->knee_npoint4_kneepoint);
+}
+
+static void
+neoisp_params_handler_ctemp(struct neoisp_context_s *ctx,
+			    const union neoisp_params_block_u *block)
+{
+	struct neoisp_ctemp_s *ctemp = &ctx->hw.ctemp;
+	const struct neoisp_ctemp_cfg_s *cfg;
+	const struct neoisp_ctemp_roi_desc_s *croi;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_COLOR_TEMP_CTRL_CAM0_ENABLE, &ctemp->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_COLOR_TEMP_CTRL_CAM0_ENABLE, &ctemp->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->ctemp.cfg;
+
+	FIELD_MODIFY(NEO_COLOR_TEMP_CTRL_CAM0_IBPP, &ctemp->ctrl, cfg->ctrl_ibpp);
+	FIELD_MODIFY(NEO_COLOR_TEMP_CTRL_CAM0_CSCON, &ctemp->ctrl, cfg->ctrl_cscon);
+
+	ctemp->roi_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_ROI_POS_CAM0_XPOS, cfg->roi.xpos) |
+		FIELD_PREP(NEO_COLOR_TEMP_ROI_POS_CAM0_YPOS, cfg->roi.ypos);
+	ctemp->roi_size =
+		FIELD_PREP(NEO_COLOR_TEMP_ROI_SIZE_CAM0_WIDTH, cfg->roi.width) |
+		FIELD_PREP(NEO_COLOR_TEMP_ROI_SIZE_CAM0_HEIGHT, cfg->roi.height);
+	ctemp->redgain =
+		FIELD_PREP(NEO_COLOR_TEMP_REDGAIN_CAM0_MIN, cfg->redgain_min) |
+		FIELD_PREP(NEO_COLOR_TEMP_REDGAIN_CAM0_MAX, cfg->redgain_max);
+	ctemp->bluegain =
+		FIELD_PREP(NEO_COLOR_TEMP_BLUEGAIN_CAM0_MIN, cfg->bluegain_min) |
+		FIELD_PREP(NEO_COLOR_TEMP_BLUEGAIN_CAM0_MAX, cfg->bluegain_max);
+	ctemp->point1 =
+		FIELD_PREP(NEO_COLOR_TEMP_POINT1_CAM0_BLUE, cfg->point1_blue) |
+		FIELD_PREP(NEO_COLOR_TEMP_POINT1_CAM0_RED, cfg->point1_red);
+	ctemp->point2 =
+		FIELD_PREP(NEO_COLOR_TEMP_POINT2_CAM0_BLUE, cfg->point2_blue) |
+		FIELD_PREP(NEO_COLOR_TEMP_POINT2_CAM0_RED, cfg->point2_red);
+	ctemp->hoffset =
+		FIELD_PREP(NEO_COLOR_TEMP_HOFFSET_CAM0_RIGHT, cfg->hoffset_right) |
+		FIELD_PREP(NEO_COLOR_TEMP_HOFFSET_CAM0_LEFT, cfg->hoffset_left);
+	ctemp->voffset =
+		FIELD_PREP(NEO_COLOR_TEMP_VOFFSET_CAM0_UP, cfg->voffset_up) |
+		FIELD_PREP(NEO_COLOR_TEMP_VOFFSET_CAM0_DOWN, cfg->voffset_down);
+	ctemp->point1_slope =
+		FIELD_PREP(NEO_COLOR_TEMP_POINT1_SLOPE_CAM0_SLOPE_L, cfg->point1_slope_slope_l) |
+		FIELD_PREP(NEO_COLOR_TEMP_POINT1_SLOPE_CAM0_SLOPE_R, cfg->point1_slope_slope_r);
+	ctemp->point2_slope =
+		FIELD_PREP(NEO_COLOR_TEMP_POINT2_SLOPE_CAM0_SLOPE_L, cfg->point2_slope_slope_l) |
+		FIELD_PREP(NEO_COLOR_TEMP_POINT2_SLOPE_CAM0_SLOPE_R, cfg->point2_slope_slope_r);
+	ctemp->luma_th =
+		FIELD_PREP(NEO_COLOR_TEMP_LUMA_TH_CAM0_THL, cfg->luma_th_thl) |
+		FIELD_PREP(NEO_COLOR_TEMP_LUMA_TH_CAM0_THH, cfg->luma_th_thh);
+	ctemp->csc_mat0 =
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT0_CAM0_R0C0, cfg->csc_matrix[0][0]) |
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT0_CAM0_R0C1, cfg->csc_matrix[0][1]);
+	ctemp->csc_mat1 =
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT1_CAM0_R0C2, cfg->csc_matrix[0][2]) |
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT1_CAM0_R1C0, cfg->csc_matrix[1][0]);
+	ctemp->csc_mat2 =
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT2_CAM0_R1C1, cfg->csc_matrix[1][1]) |
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT2_CAM0_R1C2, cfg->csc_matrix[1][2]);
+	ctemp->csc_mat3 =
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT3_CAM0_R2C0, cfg->csc_matrix[2][0]) |
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT3_CAM0_R2C1, cfg->csc_matrix[2][1]);
+	ctemp->csc_mat4 =
+		FIELD_PREP(NEO_COLOR_TEMP_CSC_MAT4_CAM0_R2C2, cfg->csc_matrix[2][2]);
+	ctemp->r_gr_offset =
+		FIELD_PREP(NEO_COLOR_TEMP_R_GR_OFFSET_CAM0_OFFSET0, cfg->offsets[0]) |
+		FIELD_PREP(NEO_COLOR_TEMP_R_GR_OFFSET_CAM0_OFFSET1, cfg->offsets[1]);
+	ctemp->gb_b_offset =
+		FIELD_PREP(NEO_COLOR_TEMP_GB_B_OFFSET_CAM0_OFFSET0, cfg->offsets[2]) |
+		FIELD_PREP(NEO_COLOR_TEMP_GB_B_OFFSET_CAM0_OFFSET1, cfg->offsets[3]);
+	ctemp->stat_blk_size0 =
+		FIELD_PREP(NEO_COLOR_TEMP_STAT_BLK_SIZE0_XSIZE, cfg->stat_blk_size0_xsize) |
+		FIELD_PREP(NEO_COLOR_TEMP_STAT_BLK_SIZE0_YSIZE, cfg->stat_blk_size0_ysize);
+
+	croi = &cfg->color_rois[0];
+	ctemp->croi0_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI0_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI0_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI0_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI0_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[1];
+	ctemp->croi1_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI1_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI1_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI1_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI1_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[2];
+	ctemp->croi2_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI2_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI2_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI2_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI2_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[3];
+	ctemp->croi3_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI3_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI3_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI3_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI3_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[4];
+	ctemp->croi4_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI4_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI4_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI4_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI4_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[5];
+	ctemp->croi5_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI5_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI5_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI5_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI5_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[6];
+	ctemp->croi6_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI6_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI6_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI6_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI6_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[7];
+	ctemp->croi7_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI7_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI7_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI7_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI7_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[8];
+	ctemp->croi8_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI8_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI8_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI8_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI8_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	croi = &cfg->color_rois[9];
+	ctemp->croi9_pos =
+		FIELD_PREP(NEO_COLOR_TEMP_CROI9_POS_CAM0_ROVERG_LOW, croi->pos_roverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI9_POS_CAM0_ROVERG_HIGH, croi->pos_roverg_high) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI9_POS_CAM0_BOVERG_LOW, croi->pos_boverg_low) |
+		FIELD_PREP(NEO_COLOR_TEMP_CROI9_POS_CAM0_BOVERG_HIGH, croi->pos_boverg_high);
+
+	ctemp->gr_avg_in =
+		FIELD_PREP(NEO_COLOR_TEMP_GR_AVG_IN_CAM0_GR_AGV, cfg->gr_avg_in_gr_agv);
+	ctemp->gb_avg_in =
+		FIELD_PREP(NEO_COLOR_TEMP_GB_AVG_IN_CAM0_GB_AGV, cfg->gb_avg_in_gb_agv);
+}
+
+static void
+neoisp_params_handler_bnr(struct neoisp_context_s *ctx,
+			  const union neoisp_params_block_u *block)
+{
+	struct neoisp_bnr_s *bnr = &ctx->hw.bnr;
+	const struct neoisp_bnr_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_BNR_CTRL_CAM0_ENABLE, &bnr->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_BNR_CTRL_CAM0_ENABLE, &bnr->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->bnr.cfg;
+
+	FIELD_MODIFY(NEO_BNR_CTRL_CAM0_OBPP, &bnr->ctrl, cfg->ctrl_obpp);
+	FIELD_MODIFY(NEO_BNR_CTRL_CAM0_DEBUG, &bnr->ctrl, cfg->ctrl_debug);
+	FIELD_MODIFY(NEO_BNR_CTRL_CAM0_NHOOD, &bnr->ctrl, cfg->ctrl_nhood);
+
+	bnr->ypeak =
+		FIELD_PREP(NEO_BNR_YPEAK_CAM0_PEAK_LOW, cfg->ypeak_peak_low) |
+		FIELD_PREP(NEO_BNR_YPEAK_CAM0_PEAK_SEL, cfg->ypeak_peak_sel) |
+		FIELD_PREP(NEO_BNR_YPEAK_CAM0_PEAK_HIGH, cfg->ypeak_peak_high) |
+		FIELD_PREP(NEO_BNR_YPEAK_CAM0_PEAK_OUTSEL, cfg->ypeak_peak_outsel);
+	bnr->yedge_th0 =
+		FIELD_PREP(NEO_BNR_YEDGE_TH0_CAM0_EDGE_TH0, cfg->yedge_th0_edge_th0);
+	bnr->yedge_scale =
+		FIELD_PREP(NEO_BNR_YEDGE_SCALE_CAM0_SCALE, cfg->yedge_scale_scale) |
+		FIELD_PREP(NEO_BNR_YEDGE_SCALE_CAM0_SHIFT, cfg->yedge_scale_shift);
+	bnr->yedges_th0 =
+		FIELD_PREP(NEO_BNR_YEDGES_TH0_CAM0_EDGE_TH0, cfg->yedges_th0_edge_th0);
+	bnr->yedges_scale =
+		FIELD_PREP(NEO_BNR_YEDGES_SCALE_CAM0_SCALE, cfg->yedges_scale_scale) |
+		FIELD_PREP(NEO_BNR_YEDGES_SCALE_CAM0_SHIFT, cfg->yedges_scale_shift);
+	bnr->yedgea_th0 =
+		FIELD_PREP(NEO_BNR_YEDGEA_TH0_CAM0_EDGE_TH0, cfg->yedgea_th0_edge_th0);
+	bnr->yedgea_scale =
+		FIELD_PREP(NEO_BNR_YEDGEA_SCALE_CAM0_SCALE, cfg->yedgea_scale_scale) |
+		FIELD_PREP(NEO_BNR_YEDGEA_SCALE_CAM0_SHIFT, cfg->yedgea_scale_shift);
+	bnr->yluma_x_th0 =
+		FIELD_PREP(NEO_BNR_YLUMA_X_TH0_CAM0_TH, cfg->yluma_x_th0_th);
+	bnr->yluma_y_th =
+		FIELD_PREP(NEO_BNR_YLUMA_Y_TH_CAM0_LUMA_Y_TH0, cfg->yluma_y_th_luma_y_th0) |
+		FIELD_PREP(NEO_BNR_YLUMA_Y_TH_CAM0_LUMA_Y_TH1, cfg->yluma_y_th_luma_y_th1);
+	bnr->yluma_scale =
+		FIELD_PREP(NEO_BNR_YLUMA_SCALE_CAM0_SCALE, cfg->yluma_scale_scale) |
+		FIELD_PREP(NEO_BNR_YLUMA_SCALE_CAM0_SHIFT, cfg->yluma_scale_shift);
+	bnr->yalpha_gain =
+		FIELD_PREP(NEO_BNR_YALPHA_GAIN_CAM0_GAIN, cfg->yalpha_gain_gain) |
+		FIELD_PREP(NEO_BNR_YALPHA_GAIN_CAM0_OFFSET, cfg->yalpha_gain_offset);
+	bnr->cpeak =
+		FIELD_PREP(NEO_BNR_CPEAK_CAM0_PEAK_LOW, cfg->cpeak_peak_low) |
+		FIELD_PREP(NEO_BNR_CPEAK_CAM0_PEAK_SEL, cfg->cpeak_peak_sel) |
+		FIELD_PREP(NEO_BNR_CPEAK_CAM0_PEAK_HIGH, cfg->cpeak_peak_high) |
+		FIELD_PREP(NEO_BNR_CPEAK_CAM0_PEAK_OUTSEL, cfg->cpeak_peak_outsel);
+	bnr->cedge_th0 =
+		FIELD_PREP(NEO_BNR_CEDGE_TH0_CAM0_EDGE_TH0, cfg->cedge_th0_edge_th0);
+	bnr->cedge_scale =
+		FIELD_PREP(NEO_BNR_CEDGE_SCALE_CAM0_SCALE, cfg->cedge_scale_scale) |
+		FIELD_PREP(NEO_BNR_CEDGE_SCALE_CAM0_SHIFT, cfg->cedge_scale_shift);
+	bnr->cedges_th0 =
+		FIELD_PREP(NEO_BNR_CEDGES_TH0_CAM0_EDGE_TH0, cfg->cedges_th0_edge_th0);
+	bnr->cedges_scale =
+		FIELD_PREP(NEO_BNR_CEDGES_SCALE_CAM0_SCALE, cfg->cedges_scale_scale) |
+		FIELD_PREP(NEO_BNR_CEDGES_SCALE_CAM0_SHIFT, cfg->cedges_scale_shift);
+	bnr->cedgea_th0 =
+		FIELD_PREP(NEO_BNR_CEDGEA_TH0_CAM0_EDGE_TH0, cfg->cedgea_th0_edge_th0);
+	bnr->cedgea_scale =
+		FIELD_PREP(NEO_BNR_CEDGEA_SCALE_CAM0_SCALE, cfg->cedgea_scale_scale) |
+		FIELD_PREP(NEO_BNR_CEDGEA_SCALE_CAM0_SHIFT, cfg->cedgea_scale_shift);
+	bnr->cluma_x_th0 =
+		FIELD_PREP(NEO_BNR_CLUMA_X_TH0_CAM0_TH, cfg->cluma_x_th0_th);
+	bnr->cluma_y_th =
+		FIELD_PREP(NEO_BNR_CLUMA_Y_TH_CAM0_LUMA_Y_TH0, cfg->cluma_y_th_luma_y_th0) |
+		FIELD_PREP(NEO_BNR_CLUMA_Y_TH_CAM0_LUMA_Y_TH1, cfg->cluma_y_th_luma_y_th1);
+	bnr->cluma_scale =
+		FIELD_PREP(NEO_BNR_CLUMA_SCALE_CAM0_SCALE, cfg->cluma_scale_scale) |
+		FIELD_PREP(NEO_BNR_CLUMA_SCALE_CAM0_SHIFT, cfg->cluma_scale_shift);
+	bnr->calpha_gain =
+		FIELD_PREP(NEO_BNR_CALPHA_GAIN_CAM0_GAIN, cfg->calpha_gain_gain) |
+		FIELD_PREP(NEO_BNR_CALPHA_GAIN_CAM0_OFFSET, cfg->calpha_gain_offset);
+	bnr->stretch =
+		FIELD_PREP(NEO_BNR_STRETCH_CAM0_GAIN, cfg->stretch_gain);
+}
+
+static void
+neoisp_params_handler_vignetting_ctrl(struct neoisp_context_s *ctx,
+				      const union neoisp_params_block_u *block)
+{
+	struct neoisp_vignetting_ctrl_s *vignetting = &ctx->hw.vignetting_ctrl;
+	const struct neoisp_vignetting_ctrl_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_VIGNETTING_CTRL_CAM0_ENABLE, &vignetting->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_VIGNETTING_CTRL_CAM0_ENABLE, &vignetting->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->vignetting_ctrl.cfg;
+
+	vignetting->blk_conf =
+		FIELD_PREP(NEO_VIGNETTING_BLK_CONF_CAM0_COLS, cfg->blk_conf_cols) |
+		FIELD_PREP(NEO_VIGNETTING_BLK_CONF_CAM0_ROWS, cfg->blk_conf_rows);
+	vignetting->blk_size =
+		FIELD_PREP(NEO_VIGNETTING_BLK_SIZE_CAM0_XSIZE, cfg->blk_size_xsize) |
+		FIELD_PREP(NEO_VIGNETTING_BLK_SIZE_CAM0_YSIZE, cfg->blk_size_ysize);
+	vignetting->blk_stepy =
+		FIELD_PREP(NEO_VIGNETTING_BLK_STEPY_CAM0_STEP, cfg->blk_stepy_step);
+	vignetting->blk_stepx =
+		FIELD_PREP(NEO_VIGNETTING_BLK_STEPX_CAM0_STEP, cfg->blk_stepx_step);
+}
+
+static void
+neoisp_params_handler_demosaic(struct neoisp_context_s *ctx,
+			       const union neoisp_params_block_u *block)
+{
+	struct neoisp_demosaic_s *demosaic = &ctx->hw.demosaic;
+	const struct neoisp_demosaic_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->demosaic.cfg;
+
+	demosaic->ctrl =
+		FIELD_PREP(NEO_DEMOSAIC_CTRL_CAM0_FMT, cfg->ctrl_fmt);
+	demosaic->activity_ctl =
+		FIELD_PREP(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0_ALPHA, cfg->activity_ctl_alpha) |
+		FIELD_PREP(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0_ACT_RATIO, cfg->activity_ctl_act_ratio);
+	demosaic->dynamics_ctl0 =
+		FIELD_PREP(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0_STRENGTHG,
+			   cfg->dynamics_ctl0_strengthg);
+	demosaic->dynamics_ctl0 |=
+		FIELD_PREP(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0_STRENGTHC,
+			   cfg->dynamics_ctl0_strengthc);
+	demosaic->dynamics_ctl2 =
+		FIELD_PREP(NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0_MAX_IMPACT,
+			   cfg->dynamics_ctl2_max_impact);
+}
+
+static void
+neoisp_params_handler_rgb2yuv(struct neoisp_context_s *ctx,
+			      const union neoisp_params_block_u *block)
+{
+	struct neoisp_rgb2yuv_s *rgb2yuv = &ctx->hw.rgb2yuv;
+	const struct neoisp_rgb2yuv_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->rgb2yuv.cfg;
+
+	rgb2yuv->gain_ctrl =
+		FIELD_PREP(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0_RGAIN, cfg->gain_ctrl_rgain) |
+		FIELD_PREP(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0_BGAIN, cfg->gain_ctrl_bgain);
+	rgb2yuv->mat0 =
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT0_CAM0_R0C0, cfg->mat_rxcy[0][0]) |
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT0_CAM0_R0C1, cfg->mat_rxcy[0][1]);
+	rgb2yuv->mat1 =
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT1_CAM0_R0C2, cfg->mat_rxcy[0][2]);
+	rgb2yuv->mat2 =
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT2_CAM0_R1C0, cfg->mat_rxcy[1][0]) |
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT2_CAM0_R1C1, cfg->mat_rxcy[1][1]);
+	rgb2yuv->mat3 =
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT3_CAM0_R1C2, cfg->mat_rxcy[1][2]);
+	rgb2yuv->mat4 =
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT4_CAM0_R2C0, cfg->mat_rxcy[2][0]) |
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT4_CAM0_R2C1, cfg->mat_rxcy[2][1]);
+	rgb2yuv->mat5 =
+		FIELD_PREP(NEO_RGB_TO_YUV_MAT5_CAM0_R2C2, cfg->mat_rxcy[2][2]);
+	rgb2yuv->offset0 =
+		FIELD_PREP(NEO_RGB_TO_YUV_OFFSET0_CAM0_OFFSET, cfg->csc_offsets[0]);
+	rgb2yuv->offset1 =
+		FIELD_PREP(NEO_RGB_TO_YUV_OFFSET1_CAM0_OFFSET, cfg->csc_offsets[1]);
+	rgb2yuv->offset2 =
+		FIELD_PREP(NEO_RGB_TO_YUV_OFFSET2_CAM0_OFFSET, cfg->csc_offsets[2]);
+}
+
+static void
+neoisp_params_handler_dr_comp(struct neoisp_context_s *ctx,
+			      const union neoisp_params_block_u *block)
+{
+	struct neoisp_dr_comp_s *drc = &ctx->hw.drc;
+	const struct neoisp_dr_comp_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->dr_comp.cfg;
+
+	drc->roi0_pos =
+		FIELD_PREP(NEO_DRC_ROI0_POS_CAM0_XPOS, cfg->roi0.xpos) |
+		FIELD_PREP(NEO_DRC_ROI0_POS_CAM0_YPOS, cfg->roi0.ypos);
+	drc->roi0_size =
+		FIELD_PREP(NEO_DRC_ROI0_SIZE_CAM0_WIDTH, cfg->roi0.width) |
+		FIELD_PREP(NEO_DRC_ROI0_SIZE_CAM0_HEIGHT, cfg->roi0.height);
+	drc->roi1_pos =
+		FIELD_PREP(NEO_DRC_ROI1_POS_CAM0_XPOS, cfg->roi1.xpos) |
+		FIELD_PREP(NEO_DRC_ROI1_POS_CAM0_YPOS, cfg->roi1.ypos);
+	drc->roi1_size =
+		FIELD_PREP(NEO_DRC_ROI1_SIZE_CAM0_WIDTH, cfg->roi1.width) |
+		FIELD_PREP(NEO_DRC_ROI1_SIZE_CAM0_HEIGHT, cfg->roi1.height);
+	drc->groi_sum_shift =
+		FIELD_PREP(NEO_DRC_GROI_SUM_SHIFT_CAM0_SHIFT0, cfg->groi_sum_shift_shift0) |
+		FIELD_PREP(NEO_DRC_GROI_SUM_SHIFT_CAM0_SHIFT1, cfg->groi_sum_shift_shift1);
+	drc->gbl_gain =
+		FIELD_PREP(NEO_DRC_GBL_GAIN_CAM0_GAIN, cfg->gbl_gain_gain);
+	drc->lcl_blk_size =
+		FIELD_PREP(NEO_DRC_LCL_BLK_SIZE_CAM0_XSIZE, cfg->lcl_blk_size_xsize) |
+		FIELD_PREP(NEO_DRC_LCL_BLK_SIZE_CAM0_YSIZE, cfg->lcl_blk_size_ysize);
+	drc->lcl_stretch =
+		FIELD_PREP(NEO_DRC_LCL_STRETCH_CAM0_STRETCH, cfg->lcl_stretch_stretch) |
+		FIELD_PREP(NEO_DRC_LCL_STRETCH_CAM0_OFFSET, cfg->lcl_stretch_offset);
+	drc->lcl_blk_stepy =
+		FIELD_PREP(NEO_DRC_LCL_BLK_STEPY_CAM0_STEP, cfg->lcl_blk_stepy_step);
+	drc->lcl_blk_stepx =
+		FIELD_PREP(NEO_DRC_LCL_BLK_STEPX_CAM0_STEP, cfg->lcl_blk_stepx_step);
+	drc->lcl_sum_shift =
+		FIELD_PREP(NEO_DRC_LCL_SUM_SHIFT_CAM0_SHIFT, cfg->lcl_sum_shift_shift);
+	drc->alpha =
+		FIELD_PREP(NEO_DRC_ALPHA_CAM0_ALPHA, cfg->alpha_alpha);
+}
+
+static void
+neoisp_params_handler_nr(struct neoisp_context_s *ctx,
+			 const union neoisp_params_block_u *block)
+{
+	struct neoisp_nr_s *nr = &ctx->hw.nr;
+	const struct neoisp_nr_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_NR_CTRL_CAM0_ENABLE, &nr->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_NR_CTRL_CAM0_ENABLE, &nr->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->nr.cfg;
+
+	FIELD_MODIFY(NEO_NR_CTRL_CAM0_DEBUG, &nr->ctrl, cfg->ctrl_debug);
+
+	nr->blend_scale =
+		FIELD_PREP(NEO_NR_BLEND_SCALE_CAM0_SCALE, cfg->blend_scale_scale) |
+		FIELD_PREP(NEO_NR_BLEND_SCALE_CAM0_SHIFT, cfg->blend_scale_shift) |
+		FIELD_PREP(NEO_NR_BLEND_SCALE_CAM0_GAIN, cfg->blend_scale_gain);
+	nr->blend_th0 =
+		FIELD_PREP(NEO_NR_BLEND_TH0_CAM0_TH, cfg->blend_th0_th);
+}
+
+static void
+neoisp_params_handler_df(struct neoisp_context_s *ctx,
+			 const union neoisp_params_block_u *block)
+{
+	struct neoisp_df_s *df = &ctx->hw.df;
+	const struct neoisp_df_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_DF_CTRL_CAM0_ENABLE, &df->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_DF_CTRL_CAM0_ENABLE, &df->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->df.cfg;
+
+	FIELD_MODIFY(NEO_DF_CTRL_CAM0_DEBUG, &df->ctrl, cfg->ctrl_debug);
+
+	df->th_scale =
+		FIELD_PREP(NEO_DF_TH_SCALE_CAM0_SCALE, cfg->th_scale_scale);
+	df->blend_shift =
+		FIELD_PREP(NEO_DF_BLEND_SHIFT_CAM0_SHIFT, cfg->blend_shift_shift);
+	df->blend_th0 =
+		FIELD_PREP(NEO_DF_BLEND_TH0_CAM0_TH, cfg->blend_th0_th);
+}
+
+static void
+neoisp_params_handler_ee(struct neoisp_context_s *ctx,
+			 const union neoisp_params_block_u *block)
+{
+	struct neoisp_ee_s *ee = &ctx->hw.ee;
+	const struct neoisp_ee_cfg_s *cfg;
+
+	if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
+		FIELD_MODIFY(NEO_EE_CTRL_CAM0_ENABLE, &ee->ctrl, 0);
+	else if (block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE)
+		FIELD_MODIFY(NEO_EE_CTRL_CAM0_ENABLE, &ee->ctrl, 1);
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing else to do */
+		return;
+
+	cfg = &block->ee.cfg;
+
+	FIELD_MODIFY(NEO_EE_CTRL_CAM0_DEBUG, &ee->ctrl, cfg->ctrl_debug);
+
+	ee->coring =
+		FIELD_PREP(NEO_EE_CORING_CAM0_CORING, cfg->coring_coring);
+	ee->clip =
+		FIELD_PREP(NEO_EE_CLIP_CAM0_CLIP, cfg->clip_clip);
+	ee->maskgain =
+		FIELD_PREP(NEO_EE_MASKGAIN_CAM0_GAIN, cfg->maskgain_gain);
+}
+
+static void
+neoisp_params_handler_convmed(struct neoisp_context_s *ctx,
+			      const union neoisp_params_block_u *block)
+{
+	struct neoisp_convmed_s *convmed = &ctx->hw.convmed;
+	const struct neoisp_convmed_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->convmed.cfg;
+
+	convmed->ctrl =
+		FIELD_PREP(NEO_CCONVMED_CTRL_CAM0_FLT, cfg->ctrl_flt);
+}
+
+static void
+neoisp_params_handler_cas(struct neoisp_context_s *ctx,
+			  const union neoisp_params_block_u *block)
+{
+	struct neoisp_cas_s *cas = &ctx->hw.cas;
+	const struct neoisp_cas_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->cas.cfg;
+
+	cas->gain =
+		FIELD_PREP(NEO_CAS_GAIN_CAM0_SCALE, cfg->gain_scale) |
+		FIELD_PREP(NEO_CAS_GAIN_CAM0_SHIFT, cfg->gain_shift);
+	cas->corr =
+		FIELD_PREP(NEO_CAS_CORR_CAM0_CORR, cfg->corr_corr);
+	cas->offset =
+		FIELD_PREP(NEO_CAS_OFFSET_CAM0_OFFSET, cfg->offset_offset);
+}
+
+static void
+neoisp_params_handler_gcm(struct neoisp_context_s *ctx,
+			  const union neoisp_params_block_u *block)
+{
+	struct neoisp_gcm_s *gcm = &ctx->hw.gcm;
+	const struct neoisp_gcm_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->gcm.cfg;
+
+	gcm->imat0 =
+		FIELD_PREP(NEO_GCM_IMAT0_CAM0_R0C0, cfg->imat_rxcy[0][0]) |
+		FIELD_PREP(NEO_GCM_IMAT0_CAM0_R0C1, cfg->imat_rxcy[0][1]);
+	gcm->imat1 =
+		FIELD_PREP(NEO_GCM_IMAT1_CAM0_R0C2, cfg->imat_rxcy[0][2]);
+	gcm->imat2 =
+		FIELD_PREP(NEO_GCM_IMAT2_CAM0_R1C0, cfg->imat_rxcy[1][0]) |
+		FIELD_PREP(NEO_GCM_IMAT2_CAM0_R1C1, cfg->imat_rxcy[1][1]);
+	gcm->imat3 =
+		FIELD_PREP(NEO_GCM_IMAT3_CAM0_R1C2, cfg->imat_rxcy[1][2]);
+	gcm->imat4 =
+		FIELD_PREP(NEO_GCM_IMAT4_CAM0_R2C0, cfg->imat_rxcy[2][0]) |
+		FIELD_PREP(NEO_GCM_IMAT4_CAM0_R2C1, cfg->imat_rxcy[2][1]);
+	gcm->imat5 =
+		FIELD_PREP(NEO_GCM_IMAT5_CAM0_R2C2, cfg->imat_rxcy[2][2]);
+	gcm->ioffset0 =
+		FIELD_PREP(NEO_GCM_IOFFSET0_CAM0_OFFSET0, cfg->ioffsets[0]);
+	gcm->ioffset1 =
+		FIELD_PREP(NEO_GCM_IOFFSET1_CAM0_OFFSET1, cfg->ioffsets[1]);
+	gcm->ioffset2 =
+		FIELD_PREP(NEO_GCM_IOFFSET2_CAM0_OFFSET2, cfg->ioffsets[2]);
+	gcm->omat0 =
+		FIELD_PREP(NEO_GCM_OMAT0_CAM0_R0C0, cfg->omat_rxcy[0][0]) |
+		FIELD_PREP(NEO_GCM_OMAT0_CAM0_R0C1, cfg->omat_rxcy[0][1]);
+	gcm->omat1 =
+		FIELD_PREP(NEO_GCM_OMAT1_CAM0_R0C2, cfg->omat_rxcy[0][2]);
+	gcm->omat2 =
+		FIELD_PREP(NEO_GCM_OMAT2_CAM0_R1C0, cfg->omat_rxcy[1][0]) |
+		FIELD_PREP(NEO_GCM_OMAT2_CAM0_R1C1, cfg->omat_rxcy[1][1]);
+	gcm->omat3 =
+		FIELD_PREP(NEO_GCM_OMAT3_CAM0_R1C2, cfg->omat_rxcy[1][2]);
+	gcm->omat4 =
+		FIELD_PREP(NEO_GCM_OMAT4_CAM0_R2C0, cfg->omat_rxcy[2][0]) |
+		FIELD_PREP(NEO_GCM_OMAT4_CAM0_R2C1, cfg->omat_rxcy[2][1]);
+	gcm->omat5 =
+		FIELD_PREP(NEO_GCM_OMAT5_CAM0_R2C2, cfg->omat_rxcy[2][2]);
+	gcm->ooffset0 =
+		FIELD_PREP(NEO_GCM_OOFFSET0_CAM0_OFFSET0, cfg->ooffsets[0]);
+	gcm->ooffset1 =
+		FIELD_PREP(NEO_GCM_OOFFSET1_CAM0_OFFSET1, cfg->ooffsets[1]);
+	gcm->ooffset2 =
+		FIELD_PREP(NEO_GCM_OOFFSET2_CAM0_OFFSET2, cfg->ooffsets[2]);
+	gcm->gamma0 =
+		FIELD_PREP(NEO_GCM_GAMMA0_CAM0_GAMMA0, cfg->gamma0_gamma0) |
+		FIELD_PREP(NEO_GCM_GAMMA0_CAM0_OFFSET0, cfg->gamma0_offset0);
+	gcm->gamma1 =
+		FIELD_PREP(NEO_GCM_GAMMA1_CAM0_GAMMA1, cfg->gamma1_gamma1) |
+		FIELD_PREP(NEO_GCM_GAMMA1_CAM0_OFFSET1, cfg->gamma1_offset1);
+	gcm->gamma2 =
+		FIELD_PREP(NEO_GCM_GAMMA2_CAM0_GAMMA2, cfg->gamma2_gamma2) |
+		FIELD_PREP(NEO_GCM_GAMMA2_CAM0_OFFSET2, cfg->gamma2_offset2);
+	gcm->blklvl0_ctrl =
+		FIELD_PREP(NEO_GCM_BLKLVL0_CTRL_CAM0_OFFSET0, cfg->blklvl0_ctrl_offset0) |
+		FIELD_PREP(NEO_GCM_BLKLVL0_CTRL_CAM0_GAIN0, cfg->blklvl0_ctrl_gain0);
+	gcm->blklvl1_ctrl =
+		FIELD_PREP(NEO_GCM_BLKLVL1_CTRL_CAM0_OFFSET1, cfg->blklvl1_ctrl_offset1) |
+		FIELD_PREP(NEO_GCM_BLKLVL1_CTRL_CAM0_GAIN1, cfg->blklvl1_ctrl_gain1);
+	gcm->blklvl2_ctrl =
+		FIELD_PREP(NEO_GCM_BLKLVL2_CTRL_CAM0_OFFSET2, cfg->blklvl2_ctrl_offset2) |
+		FIELD_PREP(NEO_GCM_BLKLVL2_CTRL_CAM0_GAIN2, cfg->blklvl2_ctrl_gain2);
+	gcm->lowth_ctrl01 =
+		FIELD_PREP(NEO_GCM_LOWTH_CTRL01_CAM0_THRESHOLD0, cfg->lowth_ctrl01_threshold0) |
+		FIELD_PREP(NEO_GCM_LOWTH_CTRL01_CAM0_THRESHOLD1, cfg->lowth_ctrl01_threshold1);
+	gcm->lowth_ctrl2 =
+		FIELD_PREP(NEO_GCM_LOWTH_CTRL2_CAM0_THRESHOLD2, cfg->lowth_ctrl2_threshold2);
+	gcm->mat_confg =
+		FIELD_PREP(NEO_GCM_MAT_CONFG_CAM0_SIGN_CONFG, cfg->mat_confg_sign_confg);
+}
+
+static void
+neoisp_params_handler_af(struct neoisp_context_s *ctx,
+			 const union neoisp_params_block_u *block)
+{
+	struct neoisp_autofocus_s *af = &ctx->hw.autofocus;
+	const struct neoisp_af_cfg_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->af.cfg;
+
+	af->roi0_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI0_POS_CAM0_XPOS, cfg->af_roi[0].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI0_POS_CAM0_YPOS, cfg->af_roi[0].ypos);
+	af->roi0_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI0_SIZE_CAM0_WIDTH, cfg->af_roi[0].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI0_SIZE_CAM0_HEIGHT, cfg->af_roi[0].height);
+	af->roi1_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI1_POS_CAM0_XPOS, cfg->af_roi[1].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI1_POS_CAM0_YPOS, cfg->af_roi[1].ypos);
+	af->roi1_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI1_SIZE_CAM0_WIDTH, cfg->af_roi[1].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI1_SIZE_CAM0_HEIGHT, cfg->af_roi[1].height);
+	af->roi2_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI2_POS_CAM0_XPOS, cfg->af_roi[2].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI2_POS_CAM0_YPOS, cfg->af_roi[2].ypos);
+	af->roi2_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI2_SIZE_CAM0_WIDTH, cfg->af_roi[2].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI2_SIZE_CAM0_HEIGHT, cfg->af_roi[2].height);
+	af->roi3_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI3_POS_CAM0_XPOS, cfg->af_roi[3].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI3_POS_CAM0_YPOS, cfg->af_roi[3].ypos);
+	af->roi3_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI3_SIZE_CAM0_WIDTH, cfg->af_roi[3].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI3_SIZE_CAM0_HEIGHT, cfg->af_roi[3].height);
+	af->roi4_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI4_POS_CAM0_XPOS, cfg->af_roi[4].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI4_POS_CAM0_YPOS, cfg->af_roi[4].ypos);
+	af->roi4_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI4_SIZE_CAM0_WIDTH, cfg->af_roi[4].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI4_SIZE_CAM0_HEIGHT, cfg->af_roi[4].height);
+	af->roi5_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI5_POS_CAM0_XPOS, cfg->af_roi[5].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI5_POS_CAM0_YPOS, cfg->af_roi[5].ypos);
+	af->roi5_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI5_SIZE_CAM0_WIDTH, cfg->af_roi[5].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI5_SIZE_CAM0_HEIGHT, cfg->af_roi[5].height);
+	af->roi6_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI6_POS_CAM0_XPOS, cfg->af_roi[6].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI6_POS_CAM0_YPOS, cfg->af_roi[6].ypos);
+	af->roi6_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI6_SIZE_CAM0_WIDTH, cfg->af_roi[6].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI6_SIZE_CAM0_HEIGHT, cfg->af_roi[6].height);
+	af->roi7_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI7_POS_CAM0_XPOS, cfg->af_roi[7].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI7_POS_CAM0_YPOS, cfg->af_roi[7].ypos);
+	af->roi7_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI7_SIZE_CAM0_WIDTH, cfg->af_roi[7].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI7_SIZE_CAM0_HEIGHT, cfg->af_roi[7].height);
+	af->roi8_pos =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI8_POS_CAM0_XPOS, cfg->af_roi[8].xpos) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI8_POS_CAM0_YPOS, cfg->af_roi[8].ypos);
+	af->roi8_size =
+		FIELD_PREP(NEO_AUTOFOCUS_ROI8_SIZE_CAM0_WIDTH, cfg->af_roi[8].width) |
+		FIELD_PREP(NEO_AUTOFOCUS_ROI8_SIZE_CAM0_HEIGHT, cfg->af_roi[8].height);
+	af->fil0_coeffs0 =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF0, cfg->fil0_coeffs[0]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF1, cfg->fil0_coeffs[1]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, cfg->fil0_coeffs[2]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF3, cfg->fil0_coeffs[3]);
+	af->fil0_coeffs1 =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF4, cfg->fil0_coeffs[4]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF5, cfg->fil0_coeffs[5]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF6, cfg->fil0_coeffs[6]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF7, cfg->fil0_coeffs[7]);
+	af->fil0_coeffs2 =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0_COEFF8, cfg->fil0_coeffs[8]);
+	af->fil0_shift =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL0_SHIFT_CAM0_SHIFT, cfg->fil0_shift_shift);
+	af->fil1_coeffs0 =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF0, cfg->fil1_coeffs[0]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF1, cfg->fil1_coeffs[1]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF2, cfg->fil1_coeffs[2]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF3, cfg->fil1_coeffs[3]);
+	af->fil1_coeffs1 =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF4, cfg->fil1_coeffs[4]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF5, cfg->fil1_coeffs[5]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF6, cfg->fil1_coeffs[6]) |
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF7, cfg->fil1_coeffs[7]);
+	af->fil1_coeffs2 =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0_COEFF8, cfg->fil1_coeffs[8]);
+	af->fil1_shift =
+		FIELD_PREP(NEO_AUTOFOCUS_FIL1_SHIFT_CAM0_SHIFT, cfg->fil1_shift_shift);
+}
+
+static void
+neoisp_params_handler_vignetting_table(struct neoisp_context_s *ctx,
+				       const union neoisp_params_block_u *block)
+{
+	const struct neoisp_vignetting_table_mem_params_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->vignetting_table.cfg;
+
+	memcpy((u8 *)(uintptr_t)&ctx->vig,
+	       (u8 *)(uintptr_t)cfg->vignetting_table,
+	       sizeof(struct neoisp_vignetting_table_mem_params_s));
+}
+
+static void
+neoisp_params_handler_drc_global_tonemap(struct neoisp_context_s *ctx,
+					 const union neoisp_params_block_u *block)
+{
+	const struct neoisp_drc_global_tonemap_mem_params_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->drc_global_tonemap.cfg;
+
+	memcpy((u8 *)(uintptr_t)&ctx->gtm,
+	       (u8 *)(uintptr_t)cfg->drc_global_tonemap,
+	       sizeof(struct neoisp_drc_global_tonemap_mem_params_s));
+}
+
+static void
+neoisp_params_handler_drc_local_tonemap(struct neoisp_context_s *ctx,
+					const union neoisp_params_block_u *block)
+{
+	const struct neoisp_drc_local_tonemap_mem_params_s *cfg;
+
+	if (block->header.size == sizeof(struct v4l2_isp_block_header))
+		/* nothing to do */
+		return;
+
+	cfg = &block->drc_local_tonemap.cfg;
+
+	memcpy((u8 *)(uintptr_t)&ctx->ltm,
+	       (u8 *)(uintptr_t)cfg->drc_local_tonemap,
+	       sizeof(struct neoisp_drc_local_tonemap_mem_params_s));
+}
+
+static const struct neoisp_block_handler_s {
+	void (*handler)(struct neoisp_context_s *ctx, const union neoisp_params_block_u *blk);
+} neoisp_block_handlers[] = {
+	[NEOISP_PARAM_BLK_PIPE_CONF] = {
+		.handler = &neoisp_params_handler_pipe_conf,
+	},
+	[NEOISP_PARAM_BLK_HEAD_COLOR] = {
+		.handler = &neoisp_params_handler_head_color,
+	},
+	[NEOISP_PARAM_BLK_HDR_DECOMPRESS0] = {
+		.handler = &neoisp_params_handler_hdr_decompress0,
+	},
+	[NEOISP_PARAM_BLK_HDR_DECOMPRESS1] = {
+		.handler = &neoisp_params_handler_hdr_decompress1,
+	},
+	[NEOISP_PARAM_BLK_OBWB0] = {
+		.handler = &neoisp_params_handler_obwb0,
+	},
+	[NEOISP_PARAM_BLK_OBWB1] = {
+		.handler = &neoisp_params_handler_obwb1,
+	},
+	[NEOISP_PARAM_BLK_OBWB2] = {
+		.handler = &neoisp_params_handler_obwb2,
+	},
+	[NEOISP_PARAM_BLK_HDR_MERGE] = {
+		.handler = &neoisp_params_handler_hdr_merge,
+	},
+	[NEOISP_PARAM_BLK_RGBIR] = {
+		.handler = &neoisp_params_handler_rgbir,
+	},
+	[NEOISP_PARAM_BLK_STAT] = {
+		.handler = &neoisp_params_handler_stat,
+	},
+	[NEOISP_PARAM_BLK_IR_COMPRESS] = {
+		.handler = &neoisp_params_handler_ir_compress,
+	},
+	[NEOISP_PARAM_BLK_BNR] = {
+		.handler = &neoisp_params_handler_bnr,
+	},
+	[NEOISP_PARAM_BLK_VIGNETTING_CTRL] = {
+		.handler = &neoisp_params_handler_vignetting_ctrl,
+	},
+	[NEOISP_PARAM_BLK_CTEMP] = {
+		.handler = &neoisp_params_handler_ctemp,
+	},
+	[NEOISP_PARAM_BLK_DEMOSAIC] = {
+		.handler = &neoisp_params_handler_demosaic,
+	},
+	[NEOISP_PARAM_BLK_RGB2YUV] = {
+		.handler = &neoisp_params_handler_rgb2yuv,
+	},
+	[NEOISP_PARAM_BLK_DR_COMP] = {
+		.handler = &neoisp_params_handler_dr_comp,
+	},
+	[NEOISP_PARAM_BLK_NR] = {
+		.handler = &neoisp_params_handler_nr,
+	},
+	[NEOISP_PARAM_BLK_AF] = {
+		.handler = &neoisp_params_handler_af,
+	},
+	[NEOISP_PARAM_BLK_EE] = {
+		.handler = &neoisp_params_handler_ee,
+	},
+	[NEOISP_PARAM_BLK_DF] = {
+		.handler = &neoisp_params_handler_df,
+	},
+	[NEOISP_PARAM_BLK_CONVMED] = {
+		.handler = &neoisp_params_handler_convmed,
+	},
+	[NEOISP_PARAM_BLK_CAS] = {
+		.handler = &neoisp_params_handler_cas,
+	},
+	[NEOISP_PARAM_BLK_GCM] = {
+		.handler = &neoisp_params_handler_gcm,
+	},
+	[NEOISP_PARAM_BLK_VIGNETTING_TABLE] = {
+		.handler = &neoisp_params_handler_vignetting_table,
+	},
+	[NEOISP_PARAM_BLK_DRC_GLOBAL_TONEMAP] = {
+		.handler = &neoisp_params_handler_drc_global_tonemap,
+	},
+	[NEOISP_PARAM_BLK_DRC_LOCAL_TONEMAP] = {
+		.handler = &neoisp_params_handler_drc_local_tonemap,
+	},
+};
+
+struct ycbcr_enc {
+	/* Matrix stored in s8.8 format */
+	s16 matrix[NEO_GAMMA_MATRIX_SIZE][NEO_GAMMA_MATRIX_SIZE];
+	/* This range [-128, 127] is remapped to [0, 255] for full-range quantization.
+	 * Thus, chrominance channels offset is 0.5 in s0.12 format that is 0.5 * 4096.
+	 */
+	s16 offsets[NEO_GAMMA_MATRIX_SIZE];
+};
+
+struct xfer_func {
+	s16 gain; /* s8.8 format*/
+	s16 blklvl_gain; /* s8.8 format */
+	s16 threshold; /* s0.16 format */
+	s16 gamma; /* s1.8 format */
+	s16 gamma_offset; /* s0.12 format */
+};
+
+static const struct ycbcr_enc enc_lut[] = {
+	[V4L2_YCBCR_ENC_601] = {
+		/* BT.601 full-range encoding - floating-point matrix:
+		 *	[0.299, 0.5870, 0.1140
+		 *	 -0.1687, -0.3313, 0.5
+		 *	 0.5, -0.4187, -0.0813]
+		 */
+		.matrix = {
+			{77, 150, 29},
+			{-43, -85, 128},
+			{128, -107, -21},
+		},
+		.offsets = {0, 2048, 2048},
+	}, [V4L2_YCBCR_ENC_709] = {
+		/* BT.709 full-range encoding - floating-point matrix:
+		 *	[0.2126, 0.7152, 0.0722
+		 *	 -0.1146, -0.3854, 0.5
+		 *	 0.5, -0.4542, -0.0458]
+		 */
+		.matrix = {
+			{54, 183, 18},
+			{-29, -99, 128},
+			{128, -116, -12},
+		},
+		.offsets = {0, 2048, 2048},
+	}, [V4L2_YCBCR_ENC_DEFAULT] = {
+		/* No encoding - used for RGB output formats */
+		.matrix = {
+			{256, 0, 0},
+			{0, 256, 0},
+			{0, 0, 256},
+		},
+		.offsets = {0, 0, 0},
+	},
+};
+
+static const struct xfer_func xfer_lut[] = {
+	[V4L2_XFER_FUNC_709] = {
+		/* L' = 4.5L, for 0 <= L <= 0.018
+		 * L' = 1.099L^0.45 - 0.099, for L >= 0.018
+		 *    = 1.099 * (L^0.45 - (0.099 / 1.099)), for L >= 0.018
+		 */
+		.gain = 281,
+		.blklvl_gain = 1152,
+		.threshold = 1180,
+		.gamma = 115,
+		.gamma_offset = 369,
+	}, [V4L2_XFER_FUNC_SRGB] = {
+		/* L' = 12.92L, for 0 <= L <= 0.0031308
+		 * L' = 1.055L^(1/2.4) - 0.055, for L >= 0.0031308
+		 *    = 1.055 * (L^(1/2.4) - (0.055 / 1.055)), for L >= 0.0031308
+		 */
+		.gain = 270,
+		.blklvl_gain = 3308,
+		.threshold = 205,
+		.gamma = 107,
+		.gamma_offset = 214,
+	}, [V4L2_XFER_FUNC_NONE] = {
+		.gain = 256,
+		.blklvl_gain = 0,
+		.threshold = 0,
+		.gamma = 256,
+		.gamma_offset = 0,
+	},
+};
+
+void neoisp_ctx_set_default_context(struct neoisp_context_s *context)
+{
+	memcpy(context, &def_context, sizeof(struct neoisp_context_s));
+}
+
+/*
+ * Set pipe conf volatile settings (i.e. buffer addresses)
+ */
+void neoisp_ctx_update_buf_addr(struct neoisp_dev_s *neoispd)
+{
+	struct neoisp_job_s *job = &neoispd->queued_job;
+	struct neoisp_pipe_conf_s *cfg = &neoispd->context->hw.pipe_conf;
+	struct neoisp_buffer_s *buf_inp0 = job->buf[NEOISP_INPUT0_NODE];
+	struct neoisp_buffer_s *buf_inp1 = job->buf[NEOISP_INPUT1_NODE];
+	struct neoisp_buffer_s *buf_out = job->buf[NEOISP_FRAME_NODE];
+	struct neoisp_buffer_s *buf_ir = job->buf[NEOISP_IR_NODE];
+	struct neoisp_node_s *nd;
+	u32 ibpp, inp0_stride, inp1_stride;
+	dma_addr_t inp0_addr, inp1_addr;
+
+	/* Input0 specific */
+	nd = &neoispd->node[NEOISP_INPUT0_NODE];
+	ibpp = (nd->neoisp_format->bit_depth + 7) / 8;
+	inp0_stride = nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
+
+	/* Input0 - Take crop into account if any */
+	inp0_addr = get_addr(buf_inp0, 0) + (nd->crop.left * ibpp) + (nd->crop.top * inp0_stride);
+
+	/* Input 1 specific */
+	nd = &neoispd->node[NEOISP_INPUT1_NODE];
+	ibpp = (nd->neoisp_format->bit_depth + 7) / 8;
+	inp1_stride = nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
+
+	/* Input1 - Take crop into account if any */
+	inp1_addr = get_addr(buf_inp1, 0) +
+		(nd->crop.left * ibpp) +
+		(nd->crop.top * inp1_stride);
+
+	cfg->img0_in_addr =
+		FIELD_PREP(NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0_ADDR,
+			   NEO_PIPE_CONF_ADDR_CONVERT(inp0_addr));
+
+	/* Handle hdr inputs */
+	nd = &neoispd->node[NEOISP_INPUT1_NODE];
+	if (neoisp_node_link_is_enabled(nd)) {
+		cfg->img1_in_addr =
+			FIELD_PREP(NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0_ADDR,
+				   NEO_PIPE_CONF_ADDR_CONVERT(inp1_addr));
+	}
+
+	nd = &neoispd->node[NEOISP_FRAME_NODE];
+	if (neoisp_node_link_is_enabled(nd)) {
+		/* Planar/multiplanar output image addresses */
+		switch (nd->format.fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_GREY:
+		case V4L2_PIX_FMT_Y10:
+		case V4L2_PIX_FMT_Y12:
+		case V4L2_PIX_FMT_Y16:
+		case V4L2_PIX_FMT_Y16_BE:
+			/* Monochrome formats: only output channel 0 is used */
+			cfg->outch0_addr =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0_ADDR,
+					   NEO_PIPE_CONF_ADDR_CONVERT(get_addr(buf_out, 0)));
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_NV21:
+		case V4L2_PIX_FMT_NV16:
+		case V4L2_PIX_FMT_NV61:
+			/* Semi-Planar formats: both output channels are used */
+			cfg->outch0_addr =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0_ADDR,
+					   NEO_PIPE_CONF_ADDR_CONVERT(get_addr(buf_out, 0)));
+			cfg->outch1_addr =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0_ADDR,
+					   NEO_PIPE_CONF_ADDR_CONVERT(get_addr(buf_out, 1)));
+			break;
+		default:
+			/* Interleaved formats: only output channel 1 is used */
+			cfg->outch1_addr =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0_ADDR,
+					   NEO_PIPE_CONF_ADDR_CONVERT(get_addr(buf_out, 0)));
+			break;
+		}
+	}
+
+	nd = &neoispd->node[NEOISP_IR_NODE];
+	if (neoisp_node_link_is_enabled(nd))
+		cfg->outir_addr =
+			FIELD_PREP(NEO_PIPE_CONF_OUTIR_ADDR_CAM0_ADDR,
+				   NEO_PIPE_CONF_ADDR_CONVERT(get_addr(buf_ir, 0)));
+}
+
+void neoisp_ctx_update_gcm(struct neoisp_dev_s *neoispd,
+			   struct neoisp_context_s *context,
+			   struct v4l2_pix_format_mplane *pix_mp,
+			   enum v4l2_ycbcr_encoding enc)
+{
+	struct neoisp_gcm_s *gcm = &context->hw.gcm;
+	enum v4l2_xfer_func xfer = pix_mp->xfer_func;
+	enum v4l2_quantization quant = pix_mp->quantization;
+
+	int i, j;
+	s32 value, tmat[NEO_GAMMA_MATRIX_SIZE][NEO_GAMMA_MATRIX_SIZE];
+	u32 tmp;
+
+	/*
+	 * Colorspaces definition are extracted from kernel documentation:
+	 * https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspaces-details.html
+	 */
+
+	/* Transfer function */
+	gcm->lowth_ctrl01 =
+		FIELD_PREP(NEO_GCM_LOWTH_CTRL01_CAM0_THRESHOLD0, xfer_lut[xfer].threshold) |
+		FIELD_PREP(NEO_GCM_LOWTH_CTRL01_CAM0_THRESHOLD1, xfer_lut[xfer].threshold);
+	gcm->lowth_ctrl2 =
+		FIELD_PREP(NEO_GCM_LOWTH_CTRL2_CAM0_THRESHOLD2, xfer_lut[xfer].threshold);
+	gcm->gamma0 =
+		FIELD_PREP(NEO_GCM_GAMMA0_CAM0_GAMMA0, xfer_lut[xfer].gamma) |
+		FIELD_PREP(NEO_GCM_GAMMA0_CAM0_OFFSET0, xfer_lut[xfer].gamma_offset);
+	gcm->gamma1 =
+		FIELD_PREP(NEO_GCM_GAMMA1_CAM0_GAMMA1, xfer_lut[xfer].gamma) |
+		FIELD_PREP(NEO_GCM_GAMMA1_CAM0_OFFSET1, xfer_lut[xfer].gamma_offset);
+	gcm->gamma2 =
+		FIELD_PREP(NEO_GCM_GAMMA2_CAM0_GAMMA2, xfer_lut[xfer].gamma) |
+		FIELD_PREP(NEO_GCM_GAMMA2_CAM0_OFFSET2, xfer_lut[xfer].gamma_offset);
+
+	FIELD_MODIFY(NEO_GCM_BLKLVL0_CTRL_CAM0_GAIN0, &gcm->blklvl0_ctrl,
+		     xfer_lut[xfer].blklvl_gain);
+	FIELD_MODIFY(NEO_GCM_BLKLVL1_CTRL_CAM0_GAIN1, &gcm->blklvl1_ctrl,
+		     xfer_lut[xfer].blklvl_gain);
+	FIELD_MODIFY(NEO_GCM_BLKLVL2_CTRL_CAM0_GAIN2, &gcm->blklvl2_ctrl,
+		     xfer_lut[xfer].blklvl_gain);
+
+	/*
+	 * Quantization
+	 *
+	 * The quantization is amended by transfer function gain.
+	 * The default quantization is full-range for RGB formats and
+	 * V4L2_COLORSPACE_JPEG.
+	 *
+	 * In limited range the offsets are defined by standard as follow: (16, 128, 128)
+	 * for 8-bit range while ISP offsets are defined for 12-bit range.
+	 * Hence, the offsets defined by standard should be multiplied by 2^4=16:
+	 * (256, 2048, 2048) for 12-bit range
+	 * The same quantization factors are applied to Y'CbCr for BT.601 and BT.709:
+	 * (219*Y, 224*Pb, 224*Pr)
+	 */
+	tmp = (quant == V4L2_QUANTIZATION_LIM_RANGE) ?
+		256 : enc_lut[enc].offsets[0];
+	gcm->ooffset0 = FIELD_PREP(NEO_GCM_OOFFSET0_CAM0_OFFSET0, tmp);
+
+	/* Chrominance has the same offset for full or limited range */
+	gcm->ooffset1 = FIELD_PREP(NEO_GCM_OOFFSET1_CAM0_OFFSET1, enc_lut[enc].offsets[1]);
+	gcm->ooffset2 = FIELD_PREP(NEO_GCM_OOFFSET2_CAM0_OFFSET2, enc_lut[enc].offsets[2]);
+	for (i = 0; i < NEO_GAMMA_MATRIX_SIZE; i++) {
+		s32 factor = (quant == V4L2_QUANTIZATION_LIM_RANGE) ?
+			(i == 0 ? 219 : 224) : 256;
+		for (j = 0; j < NEO_GAMMA_MATRIX_SIZE; j++) {
+			value = ((s32)enc_lut[enc].matrix[i][j] * factor) / 256;
+			value = ((s32)value * (s32)xfer_lut[xfer].gain) / 256;
+			tmat[i][j] = (s16)value;
+		}
+	}
+	gcm->omat0 =
+		FIELD_PREP(NEO_GCM_OMAT0_CAM0_R0C0, tmat[0][0]) |
+		FIELD_PREP(NEO_GCM_OMAT0_CAM0_R0C1, tmat[0][1]);
+	gcm->omat1 =
+		FIELD_PREP(NEO_GCM_OMAT1_CAM0_R0C2, tmat[0][2]);
+	gcm->omat2 =
+		FIELD_PREP(NEO_GCM_OMAT2_CAM0_R1C0, tmat[1][0]) |
+		FIELD_PREP(NEO_GCM_OMAT2_CAM0_R1C1, tmat[1][1]);
+	gcm->omat3 =
+		FIELD_PREP(NEO_GCM_OMAT3_CAM0_R1C2, tmat[1][2]);
+	gcm->omat4 =
+		FIELD_PREP(NEO_GCM_OMAT4_CAM0_R2C0, tmat[2][0]) |
+		FIELD_PREP(NEO_GCM_OMAT4_CAM0_R2C1, tmat[2][1]);
+	gcm->omat5 =
+		FIELD_PREP(NEO_GCM_OMAT5_CAM0_R2C2, tmat[2][2]);
+}
+
+void neoisp_ctx_update_hdr_mode(struct neoisp_dev_s *neoispd,
+				struct neoisp_context_s *context)
+{
+	struct neoisp_hdr_merge_s *hmg = &context->hw.hdr_merge;
+	struct neoisp_hdr_decompress1_s *hd1 = &context->hw.hdr_decompress1;
+
+	FIELD_MODIFY(NEO_HDR_MERGE_CTRL_CAM0_ENABLE, &hmg->ctrl, 1);
+	FIELD_MODIFY(NEO_HDR_DECOMPRESS1_CTRL_CAM0_ENABLE, &hd1->ctrl, 1);
+}
+
+/*
+ * Set Head Color selection
+ */
+void neoisp_ctx_update_head_color(struct neoisp_dev_s *neoispd,
+				  struct neoisp_context_s *context, u32 pixfmt)
+{
+	struct neoisp_hc_s *hc = &context->hw.hc;
+	u8 hoffset, voffset;
+
+	switch (pixfmt) {
+	case (V4L2_PIX_FMT_SRGGB8):
+	case (V4L2_PIX_FMT_SRGGB10):
+	case (V4L2_PIX_FMT_SRGGB12):
+	case (V4L2_PIX_FMT_SRGGB14):
+	case (V4L2_PIX_FMT_SRGGB16):
+		hoffset = 0;
+		voffset = 0;
+		break;
+	case (V4L2_PIX_FMT_SGRBG8):
+	case (V4L2_PIX_FMT_SGRBG10):
+	case (V4L2_PIX_FMT_SGRBG12):
+	case (V4L2_PIX_FMT_SGRBG14):
+	case (V4L2_PIX_FMT_SGRBG16):
+		hoffset = 1;
+		voffset = 0;
+		break;
+	case (V4L2_PIX_FMT_SGBRG8):
+	case (V4L2_PIX_FMT_SGBRG10):
+	case (V4L2_PIX_FMT_SGBRG12):
+	case (V4L2_PIX_FMT_SGBRG14):
+	case (V4L2_PIX_FMT_SGBRG16):
+		hoffset = 0;
+		voffset = 1;
+		break;
+	case (V4L2_PIX_FMT_SBGGR8):
+	case (V4L2_PIX_FMT_SBGGR10):
+	case (V4L2_PIX_FMT_SBGGR12):
+	case (V4L2_PIX_FMT_SBGGR14):
+	case (V4L2_PIX_FMT_SBGGR16):
+		hoffset = 1;
+		voffset = 1;
+		break;
+	default:
+		dev_dbg(neoispd->dev, "Unsupported pixel format %#x\n", pixfmt);
+		return;
+	}
+	hc->ctrl =
+		FIELD_PREP(NEO_HC_CTRL_CAM0_HOFFSET, hoffset) |
+		FIELD_PREP(NEO_HC_CTRL_CAM0_VOFFSET, voffset);
+}
+
+/*
+ * Update relevant IP parameters for monochrome sensors
+ */
+void neoisp_ctx_update_monochrome_fmt(struct neoisp_dev_s *neoispd,
+				      struct neoisp_context_s *context, u32 pixfmt)
+{
+	struct neoisp_demosaic_s *dmsc;
+	struct neoisp_bnr_s *bnr;
+
+	dmsc = &context->hw.demosaic;
+	bnr = &context->hw.bnr;
+
+	if (format_is_monochrome(pixfmt)) {
+		FIELD_MODIFY(NEO_DEMOSAIC_CTRL_CAM0_FMT, &dmsc->ctrl, 2); /* Monochrome format */
+		FIELD_MODIFY(NEO_BNR_CTRL_CAM0_NHOOD, &bnr->ctrl, 1); /* 1-pixel Neighbourhood */
+	} else {
+		FIELD_MODIFY(NEO_DEMOSAIC_CTRL_CAM0_FMT, &dmsc->ctrl, 0); /* Bayer format */
+		FIELD_MODIFY(NEO_BNR_CTRL_CAM0_NHOOD, &bnr->ctrl, 0); /* 2-pixel Neighbourhood */
+	}
+}
+
+void neoisp_ctx_update_packetizer(struct neoisp_dev_s *neoispd)
+{
+	struct neoisp_node_s *nd = &neoispd->node[NEOISP_FRAME_NODE];
+	struct neoisp_packetizer_s *pck = &neoispd->context->hw.packetizer;
+	u8 obpp, lsa, rsa, type, order0, order1, order2, a0s, subsample;
+	u32 pixfmt;
+
+	if (neoisp_node_link_is_enabled(nd)) {
+		pixfmt = nd->format.fmt.pix_mp.pixelformat;
+		obpp = nd->neoisp_format->bpp_enc;
+	} else {
+		/* Force dummy buffer configuration to YUYV format */
+		const struct neoisp_fmt_s *fmt =
+			neoisp_find_video_capture_format(V4L2_PIX_FMT_YUYV);
+
+		if (!fmt) {
+			dev_err(neoispd->dev, "YUYV pixel format not found\n");
+			return;
+		}
+
+		pixfmt = V4L2_PIX_FMT_YUYV;
+		obpp = fmt->bpp_enc;
+	}
+
+	switch (pixfmt) {
+	case V4L2_PIX_FMT_Y10:
+		rsa = 2;
+		lsa = 0;
+		break;
+	case V4L2_PIX_FMT_Y12:
+		rsa = 0;
+		lsa = 0;
+		break;
+	case V4L2_PIX_FMT_Y16:
+		rsa = 0;
+		lsa = 4;
+		break;
+	default:
+		rsa = 4;
+		lsa = 0;
+		break;
+	}
+
+	switch (pixfmt) {
+	case V4L2_PIX_FMT_GREY:
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
+	case V4L2_PIX_FMT_Y16:
+	case V4L2_PIX_FMT_Y16_BE:
+		type = 0;
+		subsample = 2;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 0;
+		order2 = 1;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_NV21:
+		type = 0;
+		subsample = 2;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 1;
+		order2 = 0;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_NV16:
+		type = 0;
+		subsample = 1;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 0;
+		order2 = 1;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_NV61:
+		type = 0;
+		subsample = 1;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 1;
+		order2 = 0;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		type = 1;
+		subsample = 1;
+		/* Set channels orders */
+		order0 = 0;
+		order1 = 1;
+		order2 = 3;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_VYUY:
+		type = 1;
+		subsample = 1;
+		/* Set channels orders */
+		order0 = 1;
+		order1 = 2;
+		order2 = 0;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_UYVY:
+		type = 1;
+		subsample = 1;
+		/* Set channels orders */
+		order0 = 1;
+		order1 = 0;
+		order2 = 2;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	case V4L2_PIX_FMT_YUVX32:
+		type = 1;
+		subsample = 0;
+		/* Set channels orders */
+		order0 = 0;
+		order1 = 1;
+		order2 = 2;
+		/* Add 0-padding */
+		a0s = 8;
+		break;
+	case V4L2_PIX_FMT_VUYX32:
+		type = 1;
+		subsample = 0;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 1;
+		order2 = 0;
+		/* Add 0-padding */
+		a0s = 8;
+		break;
+	case V4L2_PIX_FMT_XBGR32:
+		type = 1;
+		subsample = 0;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 1;
+		order2 = 0;
+		/* Add 0-padding */
+		a0s = 8;
+		break;
+	case V4L2_PIX_FMT_RGBX32:
+		type = 1;
+		subsample = 0;
+		/* Set channels orders */
+		order0 = 0;
+		order1 = 1;
+		order2 = 2;
+		/* Add 0-padding */
+		a0s = 8;
+		break;
+	case V4L2_PIX_FMT_BGR24:
+		type = 1;
+		subsample = 0;
+		/* Set channels orders */
+		order0 = 2;
+		order1 = 1;
+		order2 = 0;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	default: /* All other pixel formats */
+		type = 1;
+		subsample = 0;
+		/* Set channels orders */
+		order0 = 0;
+		order1 = 1;
+		order2 = 2;
+		/* Remove 0-padding */
+		a0s = 0;
+		break;
+	}
+
+	pck->ch0_ctrl =
+		FIELD_PREP(NEO_PACKETIZER_CH0_CTRL_CAM0_OBPP, obpp) |
+		FIELD_PREP(NEO_PACKETIZER_CH0_CTRL_CAM0_RSA, rsa) |
+		FIELD_PREP(NEO_PACKETIZER_CH0_CTRL_CAM0_LSA, lsa);
+
+	/* Keep same ch12 lsa/rsa config. */
+	FIELD_MODIFY(NEO_PACKETIZER_CH12_CTRL_CAM0_OBPP, &pck->ch12_ctrl, obpp);
+	FIELD_MODIFY(NEO_PACKETIZER_CH12_CTRL_CAM0_SUBSAMPLE, &pck->ch12_ctrl, subsample);
+
+	pck->pack_ctrl =
+		FIELD_PREP(NEO_PACKETIZER_PACK_CTRL_CAM0_TYPE, type) |
+		FIELD_PREP(NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER0, order0) |
+		FIELD_PREP(NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER1, order1) |
+		FIELD_PREP(NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER2, order2) |
+		FIELD_PREP(NEO_PACKETIZER_PACK_CTRL_CAM0_A0S, a0s);
+}
+
+/*
+ * Set pipe conf fixed settings: image size, bpp, line stride, and dummy
+ * addresses.
+ */
+void neoisp_ctx_update_pipe_conf(struct neoisp_dev_s *neoispd)
+{
+	struct neoisp_pipe_conf_s *cfg = &neoispd->context->hw.pipe_conf;
+	struct neoisp_node_s *nd;
+	u32 width, height, obpp, irbpp, inp0_stride, inp1_stride;
+
+	/* Input0 specific */
+	nd = &neoispd->node[NEOISP_INPUT0_NODE];
+	width = nd->crop.width;
+	height = nd->crop.height;
+	inp0_stride = nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
+
+	FIELD_MODIFY(NEO_PIPE_CONF_IMG_CONF_CAM0_IBPP0,
+		     &cfg->img_conf, nd->neoisp_format->bpp_enc);
+
+	/* Input 1 specific */
+	nd = &neoispd->node[NEOISP_INPUT1_NODE];
+	inp1_stride = nd->format.fmt.pix_mp.plane_fmt[0].bytesperline;
+
+	FIELD_MODIFY(NEO_PIPE_CONF_IMG_CONF_CAM0_IBPP1,
+		     &cfg->img_conf, nd->neoisp_format->bpp_enc);
+
+	/* Configure registers */
+	cfg->img_size =
+		FIELD_PREP(NEO_PIPE_CONF_IMG_SIZE_CAM0_WIDTH, width) |
+		FIELD_PREP(NEO_PIPE_CONF_IMG_SIZE_CAM0_HEIGHT, height);
+	cfg->img0_in_ls =
+		FIELD_PREP(NEO_PIPE_CONF_IMG0_IN_LS_CAM0_LS, inp0_stride);
+
+	/* Handle hdr inputs */
+	nd = &neoispd->node[NEOISP_INPUT1_NODE];
+	if (neoisp_node_link_is_enabled(nd)) {
+		cfg->img1_in_ls =
+			FIELD_PREP(NEO_PIPE_CONF_IMG1_IN_LS_CAM0_LS, inp1_stride);
+	} else {
+		cfg->img1_in_addr =
+			FIELD_PREP(NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0_ADDR, 0u);
+		cfg->img1_in_ls =
+			FIELD_PREP(NEO_PIPE_CONF_IMG1_IN_LS_CAM0_LS, 0u);
+	}
+
+	nd = &neoispd->node[NEOISP_FRAME_NODE];
+	if (neoisp_node_link_is_enabled(nd)) {
+		obpp = (nd->neoisp_format->bit_depth + 7) / 8;
+
+		switch (nd->format.fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_GREY:
+		case V4L2_PIX_FMT_Y10:
+		case V4L2_PIX_FMT_Y12:
+		case V4L2_PIX_FMT_Y16:
+		case V4L2_PIX_FMT_Y16_BE:
+			/*
+			 * Monochrome formats:
+			 * - output0 is used for Y component
+			 * - output1 on dummy buffer
+			 */
+			cfg->outch1_addr =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0_ADDR,
+					   NEO_PIPE_CONF_ADDR_CONVERT(neoispd->dummy_dma));
+			cfg->outch0_ls =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH0_LS_CAM0_LS, obpp * width);
+			cfg->outch1_ls =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH1_LS_CAM0_LS, 0u);
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_NV21:
+		case V4L2_PIX_FMT_NV16:
+		case V4L2_PIX_FMT_NV61:
+			/*
+			 * Semi-Planar formats:
+			 * - output0 is used for Y component
+			 * - output1 is used for UV components
+			 */
+			cfg->outch1_ls =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH1_LS_CAM0_LS, obpp * width);
+			cfg->outch0_ls =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH0_LS_CAM0_LS, obpp * width);
+			break;
+		default:
+			/*
+			 * Interleaved formats:
+			 * - output0 is not used at all
+			 * - output1 is used for YUV or RGB components
+			 */
+			cfg->outch0_addr =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0_ADDR, 0u);
+			cfg->outch0_ls =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH0_LS_CAM0_LS, 0u);
+			cfg->outch1_ls =
+				FIELD_PREP(NEO_PIPE_CONF_OUTCH1_LS_CAM0_LS, obpp * width);
+			break;
+		}
+	} else {
+		/* Default dummy pixelformat is set to YUYV */
+		cfg->outch0_addr =
+			FIELD_PREP(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0_ADDR,
+				   NEO_PIPE_CONF_ADDR_CONVERT(neoispd->dummy_dma));
+		cfg->outch1_addr =
+			FIELD_PREP(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0_ADDR,
+				   NEO_PIPE_CONF_ADDR_CONVERT(neoispd->dummy_dma));
+		cfg->outch0_ls =
+			FIELD_PREP(NEO_PIPE_CONF_OUTCH0_LS_CAM0_LS, 0u);
+		cfg->outch1_ls =
+			FIELD_PREP(NEO_PIPE_CONF_OUTCH1_LS_CAM0_LS, 0u);
+	}
+
+	nd = &neoispd->node[NEOISP_IR_NODE];
+	if (neoisp_node_link_is_enabled(nd)) {
+		irbpp = (nd->neoisp_format->bit_depth + 7) / 8;
+
+		cfg->outir_ls =
+			FIELD_PREP(NEO_PIPE_CONF_OUTIR_LS_CAM0_LS, irbpp * width);
+	} else {
+		cfg->outir_addr =
+			FIELD_PREP(NEO_PIPE_CONF_OUTIR_ADDR_CAM0_ADDR,
+				   NEO_PIPE_CONF_ADDR_CONVERT(neoispd->dummy_dma));
+		cfg->outir_ls =
+			FIELD_PREP(NEO_PIPE_CONF_OUTIR_LS_CAM0_LS, 0u);
+	}
+}
+
+/*
+ * neoisp_ctx_update_w_user_params is used to update the context of the
+ * queued node with user space values.
+ */
+void neoisp_ctx_update_w_user_params(struct neoisp_dev_s *neoispd)
+{
+	struct neoisp_buffer_s *buf = neoispd->queued_job.buf[NEOISP_PARAMS_NODE];
+	struct v4l2_isp_buffer *params;
+	size_t block_offset = 0, max_offset;
+
+	if (IS_ERR_OR_NULL(buf))
+		return;
+
+	params = (struct v4l2_isp_buffer *)get_vaddr(buf);
+
+	if (!params || params->data_size == 0)
+		/* No relevant parameters in this buffer */
+		return;
+
+	max_offset = params->data_size;
+
+	/*
+	 * Walk the list of parameter blocks and process them. No
+	 * validation is done here, as the content of the parameters
+	 * buffer is already checked when the buffer is queued.
+	 */
+	while (block_offset < max_offset) {
+		const struct neoisp_block_handler_s *block_handler;
+		const union neoisp_params_block_u *block;
+
+		block = (const union neoisp_params_block_u *)
+			&params->data[block_offset];
+		block_offset += block->header.size;
+
+		block_handler = &neoisp_block_handlers[block->header.type];
+		block_handler->handler(neoispd->context, block);
+	}
+}
+
+/*
+ * neoisp_upload_context is used to write all parameters to registers and
+ * memory.
+ *
+ * The register copy starts from PIPE_CONF.IMG_CONF offset, up to the latest
+ * writable register in AF unit.
+ *
+ * The memory copy is performed by block, because base addresses of the LUT
+ * are not continuous.
+ */
+void neoisp_ctx_upload_context(struct neoisp_dev_s *neoispd)
+{
+	struct neoisp_context_s *ctx = neoispd->context;
+	u32 *src = (u32 *)&ctx->hw.pipe_conf.img_conf;
+
+	reg_blk_write(neoispd, NEO_PIPE_CONF_IMG_CONF_CAM0, src,
+		      NEO_AUTOFOCUS_ROI0_SUM0_CAM0 - NEO_PIPE_CONF_IMG_CONF_CAM0);
+
+	local_mem_blk_write(neoispd, NEO_VIGNETTING_TABLE_MAP,
+			    &ctx->vig.vignetting_table);
+	local_mem_blk_write(neoispd, NEO_DRC_GLOBAL_TONEMAP_MAP,
+			    &ctx->gtm.drc_global_tonemap);
+	local_mem_blk_write(neoispd, NEO_DRC_LOCAL_TONEMAP_MAP,
+			    &ctx->ltm.drc_local_tonemap);
+}
+
+#define NEOISP_STATS_BLOCK_INFO(block, type, ext) \
+	[NEOISP_STATS_BLK_## block] = { \
+		.size = sizeof(struct neoisp_ ## type ## _ ## ext ## _stats_es), \
+	}
+
+#define NEOISP_STATS_BLOCK_INFO_REG(block, type) \
+	NEOISP_STATS_BLOCK_INFO(block, type, reg)
+
+#define NEOISP_STATS_BLOCK_INFO_MEM(block, type) \
+	NEOISP_STATS_BLOCK_INFO(block, type, mem)
+
+static const struct
+v4l2_isp_stats_block_type_info neoisp_stats_block_types_info[] = {
+	NEOISP_STATS_BLOCK_INFO_REG(RCTEMP, ctemp),
+	NEOISP_STATS_BLOCK_INFO_REG(RDRC, drc),
+	NEOISP_STATS_BLOCK_INFO_REG(RAF, af),
+	NEOISP_STATS_BLOCK_INFO_REG(RBNR, bnr),
+	NEOISP_STATS_BLOCK_INFO_REG(RNR, nr),
+	NEOISP_STATS_BLOCK_INFO_REG(REE, ee),
+	NEOISP_STATS_BLOCK_INFO_REG(RDF, df),
+	NEOISP_STATS_BLOCK_INFO_MEM(MCTEMP, ctemp),
+	NEOISP_STATS_BLOCK_INFO_MEM(MRGBIR, rgbir),
+	NEOISP_STATS_BLOCK_INFO_MEM(MHIST, hist),
+	NEOISP_STATS_BLOCK_INFO_MEM(MDRC, drc),
+};
+
+static void neoisp_ctx_get_stats_blk(struct neoisp_dev_s *neoispd, u32 btype,
+				     union neoisp_stats_block_u *blk)
+{
+	switch (btype) {
+	case NEOISP_STATS_BLK_RCTEMP:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG0,
+			     (u32 *)&blk->rctemp.stat,
+			     sizeof(struct neoisp_ctemp_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_RDRC:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG59,
+			     (u32 *)&blk->rdrc.stat,
+			     sizeof(struct neoisp_drc_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_RAF:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG61,
+			     (u32 *)&blk->raf.stat,
+			     sizeof(struct neoisp_af_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_RBNR:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG79,
+			     (u32 *)&blk->rbnr.stat,
+			     sizeof(struct neoisp_bnr_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_RNR:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG81,
+			     (u32 *)&blk->rnr.stat,
+			     sizeof(struct neoisp_nr_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_REE:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG82,
+			     (u32 *)&blk->ree.stat,
+			     sizeof(struct neoisp_ee_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_RDF:
+		reg_blk_read(neoispd, NEO_ALIAS_ALIAS_REG83,
+			     (u32 *)&blk->rdf.stat,
+			     sizeof(struct neoisp_df_reg_stats_s));
+		break;
+	case NEOISP_STATS_BLK_MCTEMP:
+		/* Get ctemp stats from memory */
+		local_mem_blk_read(neoispd, NEO_CTEMP_R_SUM_MAP,
+				   &blk->mctemp.stat.ctemp_r_sum);
+
+		local_mem_blk_read(neoispd, NEO_CTEMP_G_SUM_MAP,
+				   &blk->mctemp.stat.ctemp_g_sum);
+
+		local_mem_blk_read(neoispd, NEO_CTEMP_B_SUM_MAP,
+				   &blk->mctemp.stat.ctemp_b_sum);
+
+		local_mem_blk_read(neoispd, NEO_CTEMP_PIX_CNT_MAP,
+				   &blk->mctemp.stat.ctemp_pix_cnt);
+		break;
+	case NEOISP_STATS_BLK_MRGBIR:
+		/* Get rgbir stats from memory */
+		local_mem_blk_read(neoispd, NEO_RGBIR_HIST_MAP,
+				   &blk->mrgbir.stat);
+		break;
+	case NEOISP_STATS_BLK_MHIST:
+		/* Get histograms stats from memory */
+		local_mem_blk_read(neoispd, NEO_HIST_STAT_MAP,
+				   &blk->mhist.stat);
+		break;
+	case NEOISP_STATS_BLK_MDRC:
+		/* Get drc local sum stats from memory */
+		local_mem_blk_read(neoispd, NEO_DRC_LOCAL_SUM_MAP,
+				   &blk->mdrc.stat.drc_local_sum);
+
+		/* Get drc hist roi0 stats from memory */
+		local_mem_blk_read(neoispd, NEO_DRC_GLOBAL_HIST_ROI0_MAP,
+				   &blk->mdrc.stat.drc_global_hist_roi0);
+
+		/* Get drc hist roi1 stats from memory */
+		local_mem_blk_read(neoispd, NEO_DRC_GLOBAL_HIST_ROI1_MAP,
+				   &blk->mdrc.stat.drc_global_hist_roi1);
+		break;
+	default:
+		dev_err(neoispd->dev, "Error: unknown stats block id (%u)\n", btype);
+		return;
+	}
+}
+
+static const __u32 neoisp_stats_blocks[] = {
+	NEOISP_STATS_BLK_RCTEMP,
+	NEOISP_STATS_BLK_RDRC,
+	NEOISP_STATS_BLK_RAF,
+	NEOISP_STATS_BLK_RBNR,
+	NEOISP_STATS_BLK_RNR,
+	NEOISP_STATS_BLK_REE,
+	NEOISP_STATS_BLK_RDF,
+	NEOISP_STATS_BLK_MCTEMP,
+	NEOISP_STATS_BLK_MRGBIR,
+	NEOISP_STATS_BLK_MHIST,
+	NEOISP_STATS_BLK_MDRC,
+};
+
+void neoisp_ctx_get_stats(struct neoisp_dev_s *neoispd, struct neoisp_buffer_s *buf)
+{
+	struct neoisp_node_s *node = &neoispd->node[NEOISP_STATS_NODE];
+	struct v4l2_isp_buffer *stats;
+	u32 *blk_list, count;
+
+	/* Check if stats node link is enabled */
+	if (!neoisp_node_link_is_enabled(node))
+		return;
+
+	if (IS_ERR_OR_NULL(buf)) {
+		dev_err(neoispd->dev, "Error: stats pointer\n");
+		return;
+	}
+
+	stats = (struct v4l2_isp_buffer *)get_vaddr(buf);
+	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
+
+	blk_list = (u32 *)neoisp_stats_blocks;
+	count = ARRAY_SIZE(neoisp_stats_blocks);
+	for (int i = 0; i < count; i++) {
+		struct v4l2_isp_block_header *header =
+			v4l2_isp_stats_init_block(neoispd->dev, stats,
+						  neoisp_stats_block_types_info,
+						  ARRAY_SIZE(neoisp_stats_block_types_info),
+						  blk_list[i], NEOISP_EXT_STATS_MAX_SIZE);
+		if (IS_ERR(header)) {
+			dev_err(neoispd->dev, "Error: initializing stats block %d\n", i);
+			continue;
+		}
+
+		neoisp_ctx_get_stats_blk(neoispd, blk_list[i],
+					 (union neoisp_stats_block_u *)header);
+	}
+}
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_ctx.h b/drivers/media/platform/nxp/neoisp/neoisp_ctx.h
new file mode 100644
index 000000000000..41575c2dfef6
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_ctx.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP context definition
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#ifndef __NXP_NEOISP_CTX_H
+#define __NXP_NEOISP_CTX_H
+
+#include <linux/media/nxp/nxp_neoisp.h>
+
+#include "neoisp.h"
+#include "neoisp_regs.h"
+
+#define NEOISP_HDR_SHIFT_RADIX	5  /* Hdr decompress block ratio field format is u7.5 */
+
+/* Block offset */
+#define ISP_OFF_POS		0UL
+#define ISP_OFF_MASK		(0xFFFFUL << ISP_OFF_POS)
+#define ISP_GET_OFF(x)		(((x) & ISP_OFF_MASK) >> ISP_OFF_POS)
+#define ISP_OFF(x)		(((x) << ISP_OFF_POS) & ISP_OFF_MASK)
+
+/* Block size */
+#define ISP_SZ_POS		16UL
+#define ISP_SZ_MASK		(0xFFFFUL << ISP_SZ_POS)
+#define ISP_GET_SZ(x)		(((x) & ISP_SZ_MASK) >> ISP_SZ_POS)
+#define ISP_SZ(x)		(((x) << ISP_SZ_POS) & ISP_SZ_MASK)
+
+#define ISP_MAP_TUPLE(x, y, z)	(ISP_OFF((x)) | ISP_SZ(((y) * sizeof(z))))
+
+enum isp_block_map_e {
+	NEO_CTEMP_R_SUM_MAP = ISP_MAP_TUPLE(0x0, NEO_CTEMP_R_SUM_CNT, u32),
+	NEO_CTEMP_G_SUM_MAP = ISP_MAP_TUPLE(0x100, NEO_CTEMP_G_SUM_CNT, u32),
+	NEO_CTEMP_B_SUM_MAP = ISP_MAP_TUPLE(0x200, NEO_CTEMP_B_SUM_CNT, u32),
+	NEO_CTEMP_PIX_CNT_MAP = ISP_MAP_TUPLE(0x300, NEO_CTEMP_PIX_CNT_CNT, u16),
+	NEO_RGBIR_HIST_MAP = ISP_MAP_TUPLE(0x400, NEO_RGBIR_HIST_CNT, u32),
+	NEO_HIST_STAT_MAP = ISP_MAP_TUPLE(0x800, NEO_HIST_STAT_CNT, u32),
+
+	NEO_DRC_GLOBAL_HIST_ROI0_MAP = ISP_MAP_TUPLE(0x1000, NEO_DRC_GLOBAL_HIST_ROI_CNT, u32),
+	NEO_DRC_GLOBAL_HIST_ROI1_MAP = ISP_MAP_TUPLE(0x1700, NEO_DRC_GLOBAL_HIST_ROI_CNT, u32),
+	NEO_DRC_LOCAL_SUM_MAP = ISP_MAP_TUPLE(0x1E00, NEO_DRC_LOCAL_SUM_CNT, u32),
+	NEO_VIGNETTING_TABLE_MAP = ISP_MAP_TUPLE(0x2E00, NEO_VIGNETTING_TABLE_SIZE, u16),
+	NEO_DRC_GLOBAL_TONEMAP_MAP = ISP_MAP_TUPLE(0x4600, NEO_DRC_GLOBAL_TONEMAP_SIZE, u16),
+	NEO_DRC_LOCAL_TONEMAP_MAP = ISP_MAP_TUPLE(0x4A00, NEO_DRC_LOCAL_TONEMAP_SIZE, u8),
+};
+
+/*
+ * Neoisp context API functions, used to configure and update a context from
+ * the params buffer, to upload a context into HW blocks once image processing
+ * can start, and to capture the generated stats once processing is done.
+ */
+void neoisp_ctx_set_default_context(struct neoisp_context_s *context);
+
+void neoisp_ctx_update_buf_addr(struct neoisp_dev_s *neoispd);
+void neoisp_ctx_update_gcm(struct neoisp_dev_s *neoispd,
+			   struct neoisp_context_s *context,
+			   struct v4l2_pix_format_mplane *pix_mp,
+			   enum v4l2_ycbcr_encoding enc);
+void neoisp_ctx_update_hdr_mode(struct neoisp_dev_s *neoispd,
+				struct neoisp_context_s *context);
+void neoisp_ctx_update_head_color(struct neoisp_dev_s *neoispd,
+				  struct neoisp_context_s *context,
+				  u32 pixfmt);
+void neoisp_ctx_update_monochrome_fmt(struct neoisp_dev_s *neoispd,
+				      struct neoisp_context_s *context,
+				      u32 pixfmt);
+void neoisp_ctx_update_packetizer(struct neoisp_dev_s *neoispd);
+void neoisp_ctx_update_pipe_conf(struct neoisp_dev_s *neoispd);
+void neoisp_ctx_update_w_user_params(struct neoisp_dev_s *neoispd);
+
+void neoisp_ctx_upload_context(struct neoisp_dev_s *neoispd);
+
+void neoisp_ctx_get_stats(struct neoisp_dev_s *neoispd,
+			  struct neoisp_buffer_s *buf);
+
+#endif /* __NXP_NEOISP_CTX_H */
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_fmt.h b/drivers/media/platform/nxp/neoisp/neoisp_fmt.h
new file mode 100644
index 000000000000..954961403eb7
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_fmt.h
@@ -0,0 +1,495 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP supported formats definition
+ *
+ * Copyright 2023-2026 NXP
+ *
+ */
+
+#ifndef __NXP_NEOISP_FMT_H
+#define __NXP_NEOISP_FMT_H
+
+#include <linux/bits.h>
+#include <linux/videodev2.h>
+
+#include "neoisp.h"
+
+static const struct v4l2_frmsize_stepwise neoisp_frmsize_stepwise = {
+	.min_width = NEOISP_MIN_W,
+	.min_height = NEOISP_MIN_H,
+	.max_width = NEOISP_MAX_W,
+	.max_height = NEOISP_MAX_H,
+	.step_width = 1UL << NEOISP_ALIGN_W,
+	.step_height = 1UL << NEOISP_ALIGN_H,
+};
+
+static const struct neoisp_fmt_s formats_vcap[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,     /* 24-bit BGR 8-8-8 */
+		.align = 32,
+		.bit_depth = 24,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_RGB24,     /* 24-bit RGB 8-8-8 */
+		.align = 32,
+		.bit_depth = 24,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_XBGR32,    /* 32-bit BGRX 8-8-8-8 */
+		.align = 32,
+		.bit_depth = 32,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_RGBX32,    /* 32-bit RGBX 8-8-8-8 */
+		.align = 32,
+		.bit_depth = 32,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,      /* 12-bit Y/CbCr 4:2:0 */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 2,
+		.pl_divisors = {1, 2},
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV21,      /* 12-bit Y/CrCb 4:2:0 */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 2,
+		.pl_divisors = {1, 2},
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,      /* 16-bit Y/CbCr 4:2:2 */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 2,
+		.pl_divisors = {1, 1},
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV61,      /* 16-bit Y/CrCb 4:2:2 */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 2,
+		.pl_divisors = {1, 1},
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,     /* 16-bit YUV 4:2:2 */
+		.align = 32,
+		.bit_depth = 16,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV24,    /* 24-bit YUV 4:4:4 8-8-8 */
+		.align = 32,
+		.bit_depth = 24,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUVX32,     /* 32-bit YUVX 4:4:4 */
+		.align = 32,
+		.bit_depth = 32,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VUYX32,     /* 32-bit VUYX 4:4:4 */
+		.align = 32,
+		.bit_depth = 32,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,     /* 16-bit YUYV 4:2:2 */
+		.align = 32,
+		.bit_depth = 16,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,     /* 16-bit VYUY 4:2:2 */
+		.align = 32,
+		.bit_depth = 16,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_GREY,     /* 8-bit Monochrome */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 1,
+		.bpp_enc = 6,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y10,     /* 10-bit Monochrome */
+		.align = 32,
+		.bit_depth = 10,
+		.num_planes = 1,
+		.bpp_enc = 4,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y12,    /* 12-bit Monochrome */
+		.align = 32,
+		.bit_depth = 12,
+		.num_planes = 1,
+		.bpp_enc = 0,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y16,    /* 16-bit Monochrome */
+		.align = 32,
+		.bit_depth = 16,
+		.num_planes = 1,
+		.bpp_enc = 2,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y16_BE, /* 16-bit big-endian Monochrome */
+		.align = 32,
+		.bit_depth = 16,
+		.num_planes = 1,
+		.bpp_enc = 2,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}
+};
+
+static const struct neoisp_fmt_s formats_vcap_ir[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,   /* 8-bit Greyscale */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 1,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y16,    /* 16-bit Greyscale */
+		.align = 32,
+		.bit_depth = 16,
+		.num_planes = 1,
+		.is_rgb = 0,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_CAPTURE,
+	}
+};
+
+static const struct neoisp_fmt_s formats_vout[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,   /* 8-bit Bayer RGRG/GBGB */
+		.align = 32,
+		.bit_depth = 8,
+		.bpp_enc = 6,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,  /* 10-bit Bayer RGRG/GBGB */
+		.align = 32,
+		.bit_depth = 10,
+		.bpp_enc = 4,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,  /* 12-bit Bayer RGRG/GBGB */
+		.align = 32,
+		.bit_depth = 12,
+		.bpp_enc = 0,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,  /* 14-bit Bayer RGRG/GBGB */
+		.align = 32,
+		.bit_depth = 14,
+		.bpp_enc = 1,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB16,  /* 16-bit Bayer RGRG/GBGB */
+		.align = 32,
+		.bit_depth = 16,
+		.bpp_enc = 2,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.align = 32,
+		.bit_depth = 8,
+		.bpp_enc = 6,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.align = 32,
+		.bit_depth = 10,
+		.bpp_enc = 4,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.align = 32,
+		.bit_depth = 12,
+		.bpp_enc = 0,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.align = 32,
+		.bit_depth = 14,
+		.bpp_enc = 1,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR16,
+		.align = 32,
+		.bit_depth = 16,
+		.bpp_enc = 2,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.align = 32,
+		.bit_depth = 8,
+		.bpp_enc = 6,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.align = 32,
+		.bit_depth = 10,
+		.bpp_enc = 4,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.align = 32,
+		.bit_depth = 12,
+		.bpp_enc = 0,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.align = 32,
+		.bit_depth = 14,
+		.bpp_enc = 1,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG16,
+		.align = 32,
+		.bit_depth = 16,
+		.bpp_enc = 2,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.align = 32,
+		.bit_depth = 8,
+		.bpp_enc = 6,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.align = 32,
+		.bit_depth = 10,
+		.bpp_enc = 4,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.align = 32,
+		.bit_depth = 12,
+		.bpp_enc = 0,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.align = 32,
+		.bit_depth = 14,
+		.bpp_enc = 1,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG16,
+		.align = 32,
+		.bit_depth = 16,
+		.bpp_enc = 2,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_GREY,      /* 8-bit Monochrome */
+		.align = 32,
+		.bit_depth = 8,
+		.bpp_enc = 6,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y10,      /* 10-bit Monochrome */
+		.align = 32,
+		.bit_depth = 10,
+		.bpp_enc = 4,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y12,      /* 12-bit Monochrome */
+		.align = 32,
+		.bit_depth = 12,
+		.bpp_enc = 0,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y14,      /* 14-bit Monochrome */
+		.align = 32,
+		.bit_depth = 14,
+		.bpp_enc = 1,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_Y16,      /* 16-bit Monochrome */
+		.align = 32,
+		.bit_depth = 16,
+		.bpp_enc = 2,
+		.num_planes = 1,
+		.colorspace_mask = NEOISP_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.type = NEOISP_FMT_VIDEO_OUTPUT,
+	}
+};
+
+static const struct neoisp_fmt_s formats_mout[] = {
+	{
+		.fourcc = V4L2_META_FMT_NEO_ISP_EXT_PARAMS, /* NXP Neoisp Extensible Parameters */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 1,
+		.type = NEOISP_FMT_META_OUTPUT,
+	}
+};
+
+static const struct neoisp_fmt_s formats_mcap[] = {
+	{
+		.fourcc = V4L2_META_FMT_NEO_ISP_EXT_STATS, /* NXP Neoisp Extensible Statistics */
+		.align = 32,
+		.bit_depth = 8,
+		.num_planes = 1,
+		.type = NEOISP_FMT_META_CAPTURE,
+	}
+};
+
+#endif /* __NXP_NEOISP_FMT_H */
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_hw.h b/drivers/media/platform/nxp/neoisp/neoisp_hw.h
new file mode 100644
index 000000000000..afd097de8503
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_hw.h
@@ -0,0 +1,557 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP hardware structures definition
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#ifndef __NXP_NEOISP_HW_H
+#define __NXP_NEOISP_HW_H
+
+#include "neoisp_regs.h"
+
+struct neoisp_pipe_conf_s {
+	u32 reset;
+	u32 bus_param;
+	u32 xfer_dis;
+	u32 unusedw0[1];
+	u32 csi_ctrl;
+	u32 frame_num;
+	u32 shd_ctrl;
+	u32 reg_shd_cmd;
+	u32 trig_cam0;
+	u32 int_en;
+	u32 int_stat;
+	u32 csi_stat;
+	u32 img_conf;
+	u32 img_size;
+	u32 unusedw1[1];
+	u32 img0_in_addr;
+	u32 img1_in_addr;
+	u32 outch0_addr;
+	u32 outch1_addr;
+	u32 outir_addr;
+	u32 img0_in_ls;
+	u32 img1_in_ls;
+	u32 outch0_ls;
+	u32 outch1_ls;
+	u32 outir_ls;
+	u32 skip_ctrl;
+}; /* 26 words */
+
+struct neoisp_hc_s {
+	u32 ctrl;
+};
+
+struct neoisp_hdr_decompress0_s {
+	u32 ctrl;
+	u32 knee_point1;
+	u32 knee_point2;
+	u32 knee_point3;
+	u32 knee_point4;
+	u32 knee_offset0;
+	u32 knee_offset1;
+	u32 knee_offset2;
+	u32 knee_offset3;
+	u32 knee_offset4;
+	u32 knee_ratio01;
+	u32 knee_ratio23;
+	u32 knee_ratio4;
+	u32 knee_npoint0;
+	u32 knee_npoint1;
+	u32 knee_npoint2;
+	u32 knee_npoint3;
+	u32 knee_npoint4;
+};
+
+struct neoisp_hdr_decompress1_s {
+	u32 ctrl;
+	u32 knee_point1;
+	u32 knee_point2;
+	u32 knee_point3;
+	u32 knee_point4;
+	u32 knee_offset0;
+	u32 knee_offset1;
+	u32 knee_offset2;
+	u32 knee_offset3;
+	u32 knee_offset4;
+	u32 knee_ratio01;
+	u32 knee_ratio23;
+	u32 knee_ratio4;
+	u32 knee_npoint0;
+	u32 knee_npoint1;
+	u32 knee_npoint2;
+	u32 knee_npoint3;
+	u32 knee_npoint4;
+};
+
+struct neoisp_obwb_s {
+	u32 ctrl;
+	u32 r_ctrl;
+	u32 gr_ctrl;
+	u32 gb_ctrl;
+	u32 b_ctrl;
+};
+
+struct neoisp_hdr_merge_s {
+	u32 ctrl;
+	u32 gain_offset;
+	u32 gain_scale;
+	u32 gain_shift;
+	u32 luma_th;
+	u32 luma_scale;
+	u32 downscale;
+	u32 upscale;
+	u32 post_scale;
+	u32 s_gain_offset;
+	u32 s_gain_scale;
+	u32 s_gain_shift;
+	u32 s_luma_th;
+	u32 s_luma_scale;
+	u32 s_downscale;
+	u32 s_upscale;
+	u32 s_post_scale;
+	u32 s_line_num;
+};
+
+struct neoisp_ctemp_s {
+	u32 ctrl;
+	u32 roi_pos;
+	u32 roi_size;
+	u32 redgain;
+	u32 bluegain;
+	u32 point1;
+	u32 point2;
+	u32 hoffset;
+	u32 voffset;
+	u32 point1_slope;
+	u32 point2_slope;
+	u32 luma_th;
+	u32 csc_mat0;
+	u32 csc_mat1;
+	u32 csc_mat2;
+	u32 csc_mat3;
+	u32 csc_mat4;
+	u32 r_gr_offset;
+	u32 gb_b_offset;
+	u32 cnt_white;
+	u32 sumrl;
+	u32 sumrh;
+	u32 sumgl;
+	u32 sumgh;
+	u32 sumbl;
+	u32 sumbh;
+	u32 sumrgl;
+	u32 sumrgh;
+	u32 sumbgl;
+	u32 sumbgh;
+	u32 unused0[2];
+	u32 stat_blk_size0;
+	u32 unused1[1];
+	u32 stat_curr_blk_y0;
+	u32 unused2[1];
+	u32 croi0_pos;
+	u32 unused3[1];
+	u32 croi0_pixcnt;
+	u32 croi0_sumred;
+	u32 croi0_sumgreen;
+	u32 croi0_sumblue;
+	u32 croi1_pos;
+	u32 unused4[1];
+	u32 croi1_pixcnt;
+	u32 croi1_sumred;
+	u32 croi1_sumgreen;
+	u32 croi1_sumblue;
+	u32 croi2_pos;
+	u32 unused5[1];
+	u32 croi2_pixcnt;
+	u32 croi2_sumred;
+	u32 croi2_sumgreen;
+	u32 croi2_sumblue;
+	u32 croi3_pos;
+	u32 unused6[1];
+	u32 croi3_pixcnt;
+	u32 croi3_sumred;
+	u32 croi3_sumgreen;
+	u32 croi3_sumblue;
+	u32 croi4_pos;
+	u32 unused7[1];
+	u32 croi4_pixcnt;
+	u32 croi4_sumred;
+	u32 croi4_sumgreen;
+	u32 croi4_sumblue;
+	u32 croi5_pos;
+	u32 unused8[1];
+	u32 croi5_pixcnt;
+	u32 croi5_sumred;
+	u32 croi5_sumgreen;
+	u32 croi5_sumblue;
+	u32 croi6_pos;
+	u32 unused9[1];
+	u32 croi6_pixcnt;
+	u32 croi6_sumred;
+	u32 croi6_sumgreen;
+	u32 croi6_sumblue;
+	u32 croi7_pos;
+	u32 unused10[1];
+	u32 croi7_pixcnt;
+	u32 croi7_sumred;
+	u32 croi7_sumgreen;
+	u32 croi7_sumblue;
+	u32 croi8_pos;
+	u32 unused11[1];
+	u32 croi8_pixcnt;
+	u32 croi8_sumred;
+	u32 croi8_sumgreen;
+	u32 croi8_sumblue;
+	u32 croi9_pos;
+	u32 unused12[1];
+	u32 croi9_pixcnt;
+	u32 croi9_sumred;
+	u32 croi9_sumgreen;
+	u32 croi9_sumblue;
+	u32 unused13[1];
+	u32 gr_avg_in;
+	u32 gb_avg_in;
+	u32 gr_gb_cnt;
+	s32 gr_sum;
+	s32 gb_sum;
+	u32 gr2_sum;
+	u32 gb2_sum;
+	s32 grgb_sum;
+};
+
+struct neoisp_rgbir_s {
+	u32 ctrl;
+	u32 ccm0;
+	u32 ccm1;
+	u32 ccm2;
+	u32 ccm0_th;
+	u32 ccm1_th;
+	u32 ccm2_th;
+	u32 unused0[1];
+	u32 roi0_pos;
+	u32 roi0_size;
+	u32 roi1_pos;
+	u32 roi1_size;
+	u32 hist0_ctrl;
+	u32 hist0_scale;
+	u32 hist1_ctrl;
+	u32 hist1_scale;
+};
+
+struct neoisp_stat_s {
+	u32 roi0_pos;
+	u32 roi0_size;
+	u32 roi1_pos;
+	u32 roi1_size;
+	u32 unused0[4];
+	u32 hist0_ctrl;
+	u32 hist0_scale;
+	u32 hist1_ctrl;
+	u32 hist1_scale;
+	u32 hist2_ctrl;
+	u32 hist2_scale;
+	u32 hist3_ctrl;
+	u32 hist3_scale;
+};
+
+struct neoisp_ir_compress_s {
+	u32 ctrl;
+	u32 knee_point1;
+	u32 knee_point2;
+	u32 knee_point3;
+	u32 knee_point4;
+	u32 knee_offset0;
+	u32 knee_offset1;
+	u32 knee_offset2;
+	u32 knee_offset3;
+	u32 knee_offset4;
+	u32 knee_ratio01;
+	u32 knee_ratio23;
+	u32 knee_ratio4;
+	u32 knee_npoint0;
+	u32 knee_npoint1;
+	u32 knee_npoint2;
+	u32 knee_npoint3;
+	u32 knee_npoint4;
+};
+
+struct neoisp_bnr_s {
+	u32 ctrl;
+	u32 ypeak;
+	u32 yedge_th0;
+	u32 yedge_scale;
+	u32 yedges_th0;
+	u32 yedges_scale;
+	u32 yedgea_th0;
+	u32 yedgea_scale;
+	u32 yluma_x_th0;
+	u32 yluma_y_th;
+	u32 yluma_scale;
+	u32 yalpha_gain;
+	u32 cpeak;
+	u32 cedge_th0;
+	u32 cedge_scale;
+	u32 cedges_th0;
+	u32 cedges_scale;
+	u32 cedgea_th0;
+	u32 cedgea_scale;
+	u32 cluma_x_th0;
+	u32 cluma_y_th;
+	u32 cluma_scale;
+	u32 calpha_gain;
+	u32 edge_stat;
+	u32 edges_stat;
+	u32 stretch;
+};
+
+struct neoisp_vignetting_ctrl_s {
+	u32 ctrl;
+	u32 blk_conf;
+	u32 blk_size;
+	u32 blk_stepy;
+	u32 blk_stepx;
+	u32 punused0[3];
+	u32 blk_c_line;
+	u32 blk_c_row;
+	u32 blk_c_fracy;
+};
+
+struct neoisp_idbg1_s {
+	u32 line_num_t;
+	u32 curr_line_num_t;
+	u32 ima_t;
+	u32 imd;
+	u32 done_stat_t;
+};
+
+struct neoisp_demosaic_s {
+	u32 ctrl;
+	u32 activity_ctl;
+	u32 dynamics_ctl0;
+	u32 dynamics_ctl2;
+};
+
+struct neoisp_rgb2yuv_s {
+	u32 gain_ctrl;
+	u32 mat0;
+	u32 mat1;
+	u32 mat2;
+	u32 mat3;
+	u32 mat4;
+	u32 mat5;
+	u32 unused0[1];
+	u32 offset0;
+	u32 offset1;
+	u32 offset2;
+};
+
+struct neoisp_dr_comp_s {
+	u32 roi0_pos;
+	u32 roi0_size;
+	u32 roi1_pos;
+	u32 roi1_size;
+	u32 groi_sum_shift;
+	u32 gbl_gain;
+	u32 unused0[2];
+	u32 lcl_blk_size;
+	u32 lcl_stretch;
+	u32 lcl_blk_stepy;
+	u32 lcl_blk_stepx;
+	u32 lcl_sum_shift;
+	u32 alpha;
+	u32 unused1[2];
+	u32 groi0_sum;
+	u32 groi1_sum;
+	u32 unused2[2];
+	u32 stat_blk_y;
+	u32 curr_yfract;
+};
+
+struct neoisp_nr_s {
+	u32 ctrl;
+	u32 blend_scale;
+	u32 blend_th0;
+	u32 punused0[1];
+	u32 edgecnt;
+};
+
+struct neoisp_df_s {
+	u32 ctrl;
+	u32 th_scale;
+	u32 blend_shift;
+	u32 blend_th0;
+	u32 edgecnt;
+};
+
+struct neoisp_ee_s {
+	u32 ctrl;
+	u32 coring;
+	u32 clip;
+	u32 maskgain;
+	u32 edgecnt;
+};
+
+struct neoisp_convmed_s {
+	u32 ctrl;
+};
+
+struct neoisp_cas_s {
+	u32 unused0[1];
+	u32 gain;
+	u32 corr;
+	u32 offset;
+};
+
+struct neoisp_packetizer_s {
+	u32 ch0_ctrl;
+	u32 ch12_ctrl;
+	u32 pack_ctrl;
+};
+
+struct neoisp_gcm_s {
+	u32 imat0;
+	u32 imat1;
+	u32 punused0[1];
+	u32 imat2;
+	u32 imat3;
+	u32 punused1[1];
+	u32 imat4;
+	u32 imat5;
+	u32 ioffset0;
+	u32 ioffset1;
+	u32 ioffset2;
+	u32 punused2[1];
+	u32 omat0;
+	u32 omat1;
+	u32 omat2;
+	u32 omat3;
+	u32 omat4;
+	u32 omat5;
+	u32 ooffset0;
+	u32 ooffset1;
+	u32 ooffset2;
+	u32 punused3[3];
+	u32 gamma0;
+	u32 gamma1;
+	u32 gamma2;
+	u32 blklvl0_ctrl;
+	u32 blklvl1_ctrl;
+	u32 blklvl2_ctrl;
+	u32 lowth_ctrl01;
+	u32 lowth_ctrl2;
+	u32 mat_confg;
+};
+
+struct neoisp_autofocus_s {
+	u32 roi0_pos;
+	u32 roi0_size;
+	u32 roi1_pos;
+	u32 roi1_size;
+	u32 roi2_pos;
+	u32 roi2_size;
+	u32 roi3_pos;
+	u32 roi3_size;
+	u32 roi4_pos;
+	u32 roi4_size;
+	u32 roi5_pos;
+	u32 roi5_size;
+	u32 roi6_pos;
+	u32 roi6_size;
+	u32 roi7_pos;
+	u32 roi7_size;
+	u32 roi8_pos;
+	u32 roi8_size;
+	u32 unused0[2];
+	u32 fil0_coeffs0;
+	u32 fil0_coeffs1;
+	u32 fil0_coeffs2;
+	u32 fil0_shift;
+	u32 fil1_coeffs0;
+	u32 fil1_coeffs1;
+	u32 fil1_coeffs2;
+	u32 fil1_shift;
+	u32 roi0_sum0_cam0;
+	u32 roi0_sum1_cam0;
+	u32 roi1_sum0_cam0;
+	u32 roi1_sum1_cam0;
+	u32 roi2_sum0_cam0;
+	u32 roi2_sum1_cam0;
+	u32 roi3_sum0_cam0;
+	u32 roi3_sum1_cam0;
+	u32 roi4_sum0_cam0;
+	u32 roi4_sum1_cam0;
+	u32 roi5_sum0_cam0;
+	u32 roi5_sum1_cam0;
+	u32 roi6_sum0_cam0;
+	u32 roi6_sum1_cam0;
+	u32 roi7_sum0_cam0;
+	u32 roi7_sum1_cam0;
+	u32 roi8_sum0_cam0;
+	u32 roi8_sum1_cam0;
+};
+
+struct neoisp_idbg2_s {
+	u32 line_num;
+	u32 curr_line_num;
+	u32 ima;
+	u32 imd;
+	u32 done_stat;
+};
+
+struct neoisp_hw_s {
+	struct neoisp_pipe_conf_s pipe_conf;
+	u32 unused0[22];
+	struct neoisp_hc_s hc;
+	u32 unused1[15];
+	struct neoisp_hdr_decompress0_s hdr_decompress0;
+	u32 unused2[14];
+	struct neoisp_hdr_decompress1_s hdr_decompress1;
+	u32 unused3[14];
+	struct neoisp_obwb_s obwb0;
+	u32 unused4[11];
+	struct neoisp_obwb_s obwb1;
+	u32 unused5[11];
+	struct neoisp_obwb_s obwb2;
+	u32 unused6[27];
+	struct neoisp_hdr_merge_s hdr_merge;
+	u32 unused7[46];
+	struct neoisp_ctemp_s ctemp;
+	u32 unused8[23];
+	struct neoisp_rgbir_s rgbir;
+	u32 unused9[48];
+	struct neoisp_stat_s stat;
+	u32 unused10[16];
+	struct neoisp_ir_compress_s ir_compress;
+	u32 unused11[14];
+	struct neoisp_bnr_s bnr;
+	u32 unused12[38];
+	struct neoisp_vignetting_ctrl_s vignetting_ctrl;
+	u32 unused13[421];
+	struct neoisp_idbg1_s idbg1;
+	u32 unused14[107];
+	struct neoisp_demosaic_s demosaic;
+	u32 unused15[12];
+	struct neoisp_rgb2yuv_s rgb2yuv;
+	u32 unused16[69];
+	struct neoisp_dr_comp_s drc;
+	u32 unused17[42];
+	struct neoisp_nr_s nr;
+	u32 unused18[11];
+	struct neoisp_df_s df;
+	u32 unused19[11];
+	struct neoisp_ee_s ee;
+	u32 unused20[11];
+	struct neoisp_convmed_s convmed;
+	u32 unused21[15];
+	struct neoisp_cas_s cas;
+	u32 unused22[28];
+	struct neoisp_packetizer_s packetizer;
+	u32 unused23[29];
+	struct neoisp_gcm_s gcm;
+	u32 unused24[31];
+	struct neoisp_autofocus_s autofocus;
+};
+
+#endif /* __NXP_NEOISP_HW_H */
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/media/platform/nxp/neoisp/neoisp_main.c
new file mode 100644
index 000000000000..b08995403c59
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
@@ -0,0 +1,1907 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NEOISP main driver source code
+ *
+ * This is a derived work from the PiSP Back End driver
+ * Copyright (c) 2021-2024 Raspberry Pi Limited
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/lockdep.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "neoisp.h"
+#include "neoisp_core.h"
+#include "neoisp_fmt.h"
+#include "neoisp_nodes.h"
+#include "neoisp_regs.h"
+#include "neoisp_ctx.h"
+
+#define NODE_NAME(node) \
+	(node_desc[(node)->id].ent_name + sizeof(NEOISP_NAME))
+
+static int standalone_mdev;
+module_param_named(standalone_mdev, standalone_mdev, uint, 0644);
+MODULE_PARM_DESC(standalone_mdev, " Create standalone neoisp media device, default is 0 (off)");
+
+static inline bool node_desc_is_output(const struct neoisp_node_desc_s *desc)
+{
+	return desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
+		desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
+		desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+}
+
+static inline bool node_is_meta(struct neoisp_node_s *node)
+{
+	return node->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
+		node->buf_type == V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+static inline bool node_is_output(struct neoisp_node_s *node)
+{
+	return node->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
+		node->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
+		node->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+}
+
+static inline bool node_is_capture(struct neoisp_node_s *node)
+{
+	return node->buf_type == V4L2_BUF_TYPE_META_CAPTURE ||
+		node->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
+		node->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+}
+
+static inline bool node_is_mplane(struct neoisp_node_s *node)
+{
+	return node->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ||
+		node->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+}
+
+static inline const struct neoisp_fmt_s *neoisp_find_pixel_format(u32 pixel_format,
+								  const struct neoisp_fmt_s *fmt,
+								  u32 size)
+{
+	u32 i;
+
+	for (i = 0; i < size; i++)
+		if (fmt[i].fourcc == pixel_format)
+			return &fmt[i];
+	return NULL;
+}
+
+/*
+ * The gain adjustment should be done, as the 12-bit format is managed in a specific way.
+ * LPALIGN0/1 bit field is used to select LSB or MSB alignment. However, LPALIGN0/1
+ * is disabled for 12-bit operations and data is always aligned in the following manner:
+ * d[15] -> d[4]
+ *
+ * In this sense, a gain is applied to the HDR Decompression block to align the data on d[19] for
+ * input0 as other formats are defined. As the working BPP of input1 is 16-bit depth, the data is
+ * already MSB-aligned and do not need an extra gain.
+ */
+static inline void neoisp_adjust_gain(struct neoisp_context_s *ctx, u32 ibpp)
+{
+	struct neoisp_hdr_decompress0_s *hdr0 = &ctx->hw.hdr_decompress0;
+
+	if (ibpp != 12)
+		return;
+
+	hdr0->knee_ratio4 = FIELD_PREP(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0_RATIO4,
+				       16 << NEOISP_HDR_SHIFT_RADIX);
+}
+
+static void neoisp_fill_mp(struct v4l2_format *f, const struct neoisp_fmt_s *fmt)
+{
+	u32 nplanes = f->fmt.pix_mp.num_planes;
+	u32 i;
+
+	for (i = 0; i < nplanes; i++) {
+		struct v4l2_plane_pix_format *p = &f->fmt.pix_mp.plane_fmt[i];
+		u32 bpl, plane_size;
+
+		bpl = f->fmt.pix_mp.width * ((fmt->bit_depth + 7) >> 3);
+		bpl = ALIGN(max(p->bytesperline, bpl), fmt->align);
+
+		plane_size = bpl * f->fmt.pix_mp.height;
+		if (nplanes > 1)
+			plane_size /= fmt->pl_divisors[i];
+		plane_size = max(p->sizeimage, plane_size);
+
+		p->bytesperline = bpl;
+		p->sizeimage = plane_size;
+	}
+}
+
+static const struct neoisp_fmt_s *neoisp_find_pixel_format_by_node(u32 pixel_format,
+								   struct neoisp_node_s *node)
+{
+	if (IS_ERR_OR_NULL(node))
+		return NULL;
+
+	switch (node->id) {
+	case NEOISP_INPUT0_NODE:
+	case NEOISP_INPUT1_NODE:
+		return neoisp_find_pixel_format(pixel_format,
+						formats_vout,
+						ARRAY_SIZE(formats_vout));
+	case NEOISP_FRAME_NODE:
+		return neoisp_find_pixel_format(pixel_format,
+						formats_vcap,
+						ARRAY_SIZE(formats_vcap));
+	case NEOISP_IR_NODE:
+		return neoisp_find_pixel_format(pixel_format,
+						formats_vcap_ir,
+						ARRAY_SIZE(formats_vcap_ir));
+	case NEOISP_PARAMS_NODE:
+		return neoisp_find_pixel_format(pixel_format,
+						formats_mout,
+						ARRAY_SIZE(formats_mout));
+	case NEOISP_STATS_NODE:
+		return neoisp_find_pixel_format(pixel_format,
+						formats_mcap,
+						ARRAY_SIZE(formats_mcap));
+	default:
+		return NULL;
+	}
+}
+
+const struct neoisp_fmt_s *neoisp_find_video_capture_format(u32 pixel_format)
+{
+	return neoisp_find_pixel_format(pixel_format,
+					formats_vcap,
+					ARRAY_SIZE(formats_vcap));
+}
+
+static int neoisp_node_queue_setup(struct vb2_queue *q, u32 *nbuffers,
+				   u32 *nplanes, u32 sizes[],
+				   struct device *alloc_devs[])
+{
+	struct neoisp_node_s *node = vb2_get_drv_priv(q);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	u32 i, num_planes;
+
+	num_planes = node_is_mplane(node) ?
+		     node->format.fmt.pix_mp.num_planes : 1;
+	if (*nplanes) {
+		if (*nplanes != num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < *nplanes; i++) {
+			u32 size = node_is_mplane(node) ?
+				     node->format.fmt.pix_mp.plane_fmt[i].sizeimage :
+				     node->format.fmt.meta.buffersize;
+
+			if (sizes[i] < size)
+				return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	*nplanes = num_planes;
+	for (i = 0; i < *nplanes; i++)
+		sizes[i] = node_is_mplane(node) ?
+			   node->format.fmt.pix_mp.plane_fmt[i].sizeimage :
+			   node->format.fmt.meta.buffersize;
+
+	dev_dbg(neoispd->dev,
+		"Image (or metadata) size %u, nbuffers %u for node %s\n",
+		sizes[0], *nbuffers, NODE_NAME(node));
+
+	return 0;
+}
+
+static int neoisp_node_buf_prepare(struct vb2_buffer *vb)
+{
+	struct neoisp_node_s *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	unsigned long size = 0;
+	u32 i, num_planes = node_is_mplane(node) ?
+		node->format.fmt.pix_mp.num_planes : 1;
+
+	for (i = 0; i < num_planes; i++) {
+		size = node_is_mplane(node)
+			? node->format.fmt.pix_mp.plane_fmt[i].sizeimage
+			: node->format.fmt.meta.buffersize;
+
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(neoispd->dev,
+				"data will not fit into plane %d (%lu < %lu)\n",
+				i, vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+
+		vb2_set_plane_payload(vb, i, size);
+	}
+	return 0;
+}
+
+#define NEOISP_PARAMS_BLOCK_INFO(block, type, ext) \
+	[NEOISP_PARAM_BLK_## block] = { \
+		.size = sizeof(struct neoisp_ ## type ## _ ## ext ## _es), \
+	}
+
+#define NEOISP_PARAMS_BLOCK_INFO_CFG(block, type) \
+	NEOISP_PARAMS_BLOCK_INFO(block, type, cfg)
+
+#define NEOISP_PARAMS_BLOCK_INFO_MEMS(block, type) \
+	NEOISP_PARAMS_BLOCK_INFO(block, type, mem_params)
+
+static const struct
+v4l2_isp_params_block_type_info neoisp_params_block_types_info[] = {
+	NEOISP_PARAMS_BLOCK_INFO_CFG(PIPE_CONF, pipe_conf),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(HEAD_COLOR, head_color),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(HDR_DECOMPRESS0, hdr_decompress0),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(HDR_DECOMPRESS1, hdr_decompress1),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(OBWB0, obwb),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(OBWB1, obwb),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(OBWB2, obwb),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(HDR_MERGE, hdr_merge),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(RGBIR, rgbir),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(STAT, stat),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(CTEMP, ctemp),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(IR_COMPRESS, ir_compress),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(BNR, bnr),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(VIGNETTING_CTRL, vignetting_ctrl),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(DEMOSAIC, demosaic),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(RGB2YUV, rgb2yuv),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(DR_COMP, dr_comp),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(NR, nr),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(AF, af),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(EE, ee),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(DF, df),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(CONVMED, convmed),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(CAS, cas),
+	NEOISP_PARAMS_BLOCK_INFO_CFG(GCM, gcm),
+	NEOISP_PARAMS_BLOCK_INFO_MEMS(VIGNETTING_TABLE, vignetting_table),
+	NEOISP_PARAMS_BLOCK_INFO_MEMS(DRC_GLOBAL_TONEMAP, drc_global_tonemap),
+	NEOISP_PARAMS_BLOCK_INFO_MEMS(DRC_LOCAL_TONEMAP, drc_local_tonemap),
+};
+
+static int neoisp_params_node_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct neoisp_node_s *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	struct v4l2_isp_params_buffer *params = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(neoispd->dev, vb,
+						   node->format.fmt.meta.buffersize);
+	if (ret)
+		return ret;
+
+	ret = v4l2_isp_params_validate_buffer(neoispd->dev, vb,
+					      params, neoisp_params_block_types_info,
+					      ARRAY_SIZE(neoisp_params_block_types_info));
+	if (ret)
+		return ret;
+
+	vb2_set_plane_payload(vb, 0, node->format.fmt.meta.buffersize);
+	return 0;
+}
+
+static void send_frame_sync_event(struct neoisp_dev_s *neoispd)
+{
+	struct v4l2_subdev *sd = &neoispd->sd;
+	u32 sequence = neoispd->frame_sequence;
+
+	struct v4l2_event ev = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.u.frame_sync.frame_sequence = sequence,
+	};
+
+	v4l2_event_queue(sd->devnode, &ev);
+}
+
+static void neoisp_reset_hw(struct neoisp_dev_s *neoispd, bool is_hw)
+{
+	u32 bit = NEO_PIPE_CONF_SOFT_RESET_SOFT_RESET;
+	u32 val, count = 100;
+
+	if (is_hw)
+		bit = NEO_PIPE_CONF_SOFT_RESET_HARD_RESET;
+
+	neoisp_wr(neoispd, NEO_PIPE_CONF_SOFT_RESET, bit);
+
+	/* Wait for auto-clear */
+	do {
+		usleep_range(1, 2);
+		val = neoisp_rd(neoispd, NEO_PIPE_CONF_SOFT_RESET);
+		count--;
+	} while ((val & bit) && count);
+
+	if (val & bit)
+		dev_warn(neoispd->dev, "%s reset incomplete\n",
+			 is_hw ? "hw" : "sw");
+}
+
+static void neoisp_run_job(struct neoisp_dev_s *neoispd)
+{
+	/* Update queued job context buf addresses */
+	neoisp_ctx_update_buf_addr(neoispd);
+
+	/* Update queued job context with user space values */
+	neoisp_ctx_update_w_user_params(neoispd);
+
+	/* Upload context into HW registers and memories */
+	neoisp_ctx_upload_context(neoispd);
+
+	/* Kick off the hw */
+	neoisp_wr(neoispd, NEO_PIPE_CONF_TRIG_CAM0, NEO_PIPE_CONF_TRIG_CAM0_TRIGGER);
+	send_frame_sync_event(neoispd);
+	dev_dbg(neoispd->dev, "isp starting job\n");
+}
+
+static int neoisp_prepare_job(struct neoisp_dev_s *neoispd)
+{
+	struct neoisp_job_desc_s __free(kfree) *job = NULL;
+	struct neoisp_buffer_s *buf[NEOISP_NODES_COUNT];
+	struct neoisp_node_s *node;
+	unsigned int streaming_map;
+	int i;
+
+	lockdep_assert_irqs_enabled();
+
+	/*
+	 * To schedule a job, we need to have 1 buffer for any enabled node, knowing that:
+	 *  - Input0 is immutable, so it must have 1 buffer.
+	 *  - Input1 is mutable, so it is ignored if not used.
+	 *  - Params and Stats are also mutable, but enabled by default.
+	 *  - Frame and IR are mutable; Only Frame is enabled by default. At least one
+	 *    of these 2 should be enabled.
+	 *
+	 * If all the buffers required to form a job are available, append the job
+	 * descriptor to the job queue to be later queued to the HW.
+	 */
+	scoped_guard(spinlock_irq, &neoispd->hw_lock) {
+		if ((BIT(NEOISP_INPUT0_NODE) & neoispd->streaming_map)
+		    != BIT(NEOISP_INPUT0_NODE)) {
+			dev_dbg(neoispd->dev, "Input0 node not ready, nothing to do\n");
+			return -EAGAIN;
+		}
+
+		node = &neoispd->node[NEOISP_INPUT1_NODE];
+		if (neoisp_node_link_is_enabled(node)) {
+			if ((BIT(NEOISP_INPUT1_NODE) & neoispd->streaming_map)
+			    != BIT(NEOISP_INPUT1_NODE)) {
+				dev_dbg(neoispd->dev, "Input1 is not disabled and not ready\n");
+				return -EAGAIN;
+			}
+		}
+		node = &neoispd->node[NEOISP_PARAMS_NODE];
+		if (neoisp_node_link_is_enabled(node)) {
+			if ((BIT(NEOISP_PARAMS_NODE) & neoispd->streaming_map)
+			    != BIT(NEOISP_PARAMS_NODE)) {
+				dev_dbg(neoispd->dev, "Params is not disabled and not ready\n");
+				return -EAGAIN;
+			}
+		}
+		node = &neoispd->node[NEOISP_FRAME_NODE];
+		if (neoisp_node_link_is_enabled(node)) {
+			if ((BIT(NEOISP_FRAME_NODE) & neoispd->streaming_map)
+			    != BIT(NEOISP_FRAME_NODE)) {
+				dev_dbg(neoispd->dev, "Frame node not ready, nothing to do\n");
+				return -EAGAIN;
+			}
+		}
+		node = &neoispd->node[NEOISP_IR_NODE];
+		if (neoisp_node_link_is_enabled(node)) {
+			if ((BIT(NEOISP_IR_NODE) & neoispd->streaming_map)
+			    != BIT(NEOISP_IR_NODE)) {
+				dev_dbg(neoispd->dev, "IR node not ready, nothing to do\n");
+				return -EAGAIN;
+			}
+		}
+		node = &neoispd->node[NEOISP_STATS_NODE];
+		if (neoisp_node_link_is_enabled(node)) {
+			if ((BIT(NEOISP_STATS_NODE) & neoispd->streaming_map)
+			    != BIT(NEOISP_STATS_NODE)) {
+				dev_dbg(neoispd->dev, "Stats is not disabled and not ready\n");
+				return -EAGAIN;
+			}
+		}
+
+		/*
+		 * Take a copy of streaming_map: nodes activated after this
+		 * point are ignored when preparing this job
+		 */
+		streaming_map = neoispd->streaming_map;
+	}
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	for (i = 0; i < NEOISP_NODES_COUNT; i++) {
+		buf[i] = NULL;
+		if (!(streaming_map & BIT(i)))
+			continue;
+
+		node = &neoispd->node[i];
+		buf[i] = list_first_entry_or_null(&node->ready_queue,
+						  struct neoisp_buffer_s,
+						  ready_list);
+
+		if (!buf[i] && neoisp_node_link_is_enabled(node)) {
+			dev_dbg(neoispd->dev, "Nothing to do\n");
+			return -ENODEV;
+		}
+	}
+
+	/* Pull a buffer from each V4L2 queue to form the queued job */
+	for (i = 0; i < NEOISP_NODES_COUNT; i++) {
+		if (buf[i]) {
+			list_del(&buf[i]->ready_list);
+			job->buffers[i] = buf[i];
+		}
+	}
+
+	scoped_guard(spinlock_irq, &neoispd->hw_lock) {
+		list_add_tail(&job->queue, &neoispd->job_queue);
+	}
+
+	/* Set job to NULL to avoid automatic release due to __free(). */
+	job = NULL;
+
+	return 0;
+}
+
+/*
+ * Try to schedule a job. If neoisp hw is free, and a job is ready
+ * move it into the queued_job, and launch it.
+ */
+static void neoisp_schedule(struct neoisp_dev_s *neoispd,
+			    bool clear_hw_busy)
+{
+	struct neoisp_job_desc_s *job;
+	int i;
+
+	scoped_guard(spinlock_irqsave, &neoispd->hw_lock) {
+		if (clear_hw_busy)
+			neoispd->hw_busy = false;
+
+		if (neoispd->hw_busy)
+			return;
+
+		job = list_first_entry_or_null(&neoispd->job_queue,
+					       struct neoisp_job_desc_s,
+					       queue);
+
+		if (!job)
+			return;
+
+		list_del(&job->queue);
+
+		for (i = 0; i < NEOISP_NODES_COUNT; i++)
+			neoispd->queued_job.buf[i] = job->buffers[i];
+
+		neoispd->hw_busy = true;
+	}
+
+	/*
+	 * We can kick the job off without the hw_lock, as this can
+	 * never run again until hw_busy is cleared, which will happen
+	 * only when the following job has been queued and an interrupt
+	 * is raised.
+	 */
+	neoisp_run_job(neoispd);
+	kfree(job);
+}
+
+static void neoisp_node_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct neoisp_buffer_s *buffer = to_neoisp_buffer(vbuf);
+	struct neoisp_node_s *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	dev_dbg(neoispd->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
+	list_add_tail(&buffer->ready_list, &node->ready_queue);
+
+	/*
+	 * Every time we add a buffer, check if there's now some work for the hw
+	 * to do, but only for this client.
+	 */
+	if (!neoisp_prepare_job(neoispd))
+		neoisp_schedule(neoispd, false);
+}
+
+static void neoisp_set_default_context(struct neoisp_dev_s *neoispd)
+{
+	/* Prepare the job context with default one */
+	neoisp_ctx_set_default_context(neoispd->context);
+}
+
+static int neoisp_prepare_node_streaming(struct neoisp_node_s *node)
+{
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	struct neoisp_context_s *ctx = neoispd->context;
+	struct neoisp_node_s *in0_node;
+	u32 pixfmt = node->format.fmt.pix_mp.pixelformat;
+
+	switch (node->id) {
+	case NEOISP_INPUT0_NODE:
+		/* Preload default parameters */
+		neoisp_adjust_gain(ctx, node->neoisp_format->bit_depth);
+
+		neoisp_ctx_update_head_color(neoispd, ctx, pixfmt);
+		neoisp_ctx_update_monochrome_fmt(neoispd, ctx, pixfmt);
+		break;
+
+	case NEOISP_INPUT1_NODE:
+		/* Prepare HDR mode */
+		neoisp_ctx_update_hdr_mode(neoispd, ctx);
+		break;
+
+	case NEOISP_FRAME_NODE:
+		in0_node = &neoispd->node[NEOISP_INPUT0_NODE];
+
+		if (node->format.fmt.pix_mp.width != in0_node->crop.width ||
+		    node->format.fmt.pix_mp.height != in0_node->crop.height) {
+			dev_err(neoispd->dev,
+				"Crop & output sizes don't match - w/cw: %d/%d, h/ch : %d/%d\n",
+				node->format.fmt.pix_mp.width, in0_node->crop.width,
+				node->format.fmt.pix_mp.height, in0_node->crop.height);
+			return -EPIPE;
+		}
+
+		neoisp_ctx_update_gcm(neoispd, ctx, &node->format.fmt.pix_mp,
+				      node->neoisp_format->is_rgb ?
+				      V4L2_YCBCR_ENC_DEFAULT : node->format.fmt.pix_mp.ycbcr_enc);
+		break;
+	}
+
+	/*
+	 * Check output modes (frame, ir, dummy or combination)
+	 */
+	if ((!neoisp_node_link_is_enabled(&neoispd->node[NEOISP_FRAME_NODE]) ||
+	     !neoisp_node_link_is_enabled(&neoispd->node[NEOISP_IR_NODE]) ||
+	     format_is_monochrome(pixfmt)) && !neoispd->dummy_buf) {
+		struct neoisp_node_s *in0_node = &neoispd->node[NEOISP_INPUT0_NODE];
+
+		/* Allocate a single line dummy buffer as line stride is set to 0 */
+		neoispd->dummy_size = in0_node->crop.width * NEOISP_MAX_BPP;
+		neoispd->dummy_buf =
+			dma_alloc_coherent(neoispd->dev,
+					   neoispd->dummy_size,
+					   &neoispd->dummy_dma, GFP_KERNEL);
+		if (!neoispd->dummy_buf) {
+			dev_err(neoispd->dev,
+				"Unable to allocate dummy buffer\n");
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static int neoisp_node_start_streaming(struct vb2_queue *q, u32 count)
+{
+	struct neoisp_node_s *node = vb2_get_drv_priv(q);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	struct neoisp_buffer_s *buf, *tmp;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(neoispd->dev);
+	if (ret < 0)
+		goto error;
+
+	ret = neoisp_prepare_node_streaming(node);
+	if (ret < 0)
+		goto error_streaming;
+
+	scoped_guard(spinlock_irq, &neoispd->hw_lock) {
+		neoispd->streaming_map |= BIT(node->id);
+		neoispd->frame_sequence = 0;
+	}
+
+	dev_dbg(neoispd->dev, "%s: for node %s (count %u)\n",
+		__func__, NODE_NAME(node), count);
+	dev_dbg(neoispd->dev, "Nodes streaming now 0x%x\n",
+		neoispd->streaming_map);
+
+	/* Update queued job context with current driver configuration */
+	neoisp_ctx_update_packetizer(neoispd);
+	neoisp_ctx_update_pipe_conf(neoispd);
+
+	/* Maybe we're ready to run. */
+	if (!neoisp_prepare_job(neoispd))
+		neoisp_schedule(neoispd, false);
+
+	return 0;
+
+error_streaming:
+	pm_runtime_put_autosuspend(neoispd->dev);
+error:
+	list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
+		list_del(&buf->ready_list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	return ret;
+}
+
+static void neoisp_node_stop_streaming(struct vb2_queue *q)
+{
+	struct neoisp_node_s *node = vb2_get_drv_priv(q);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	struct neoisp_job_desc_s *job, *temp;
+	struct neoisp_buffer_s *buf;
+	LIST_HEAD(tmp_list);
+
+	/*
+	 * Now this is a bit awkward. In a simple M2M device we could just wait
+	 * for all queued jobs to complete, but here there's a risk that a
+	 * partial set of buffers was queued and cannot be run. For now, just
+	 * cancel all buffers stuck in the "ready queue", then wait for any
+	 * running job.
+	 *
+	 * This may return buffers out of order.
+	 */
+	dev_dbg(neoispd->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
+	do {
+		buf = list_first_entry_or_null(&node->ready_queue,
+					       struct neoisp_buffer_s,
+					       ready_list);
+		if (buf) {
+			list_del(&buf->ready_list);
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+	} while (buf);
+
+	vb2_wait_for_all_buffers(&node->queue);
+
+	if (node->id == NEOISP_INPUT0_NODE)
+		neoisp_set_default_context(neoispd);
+
+	spin_lock_irq(&neoispd->hw_lock);
+	neoispd->streaming_map &= ~BIT(node->id);
+
+	if (neoispd->streaming_map == 0) {
+		/*
+		 * If all nodes have stopped streaming release all jobs
+		 * without holding the lock.
+		 */
+		list_splice_init(&neoispd->job_queue, &tmp_list);
+	}
+	spin_unlock_irq(&neoispd->hw_lock);
+
+	list_for_each_entry_safe(job, temp, &tmp_list, queue) {
+		list_del(&job->queue);
+		kfree(job);
+	}
+
+	if (neoispd->streaming_map == 0 && neoispd->dummy_buf) {
+		dma_free_coherent(neoispd->dev,
+				  neoispd->dummy_size,
+				  neoispd->dummy_buf,
+				  neoispd->dummy_dma);
+		neoispd->dummy_buf = NULL;
+	}
+
+	pm_runtime_mark_last_busy(neoispd->dev);
+	pm_runtime_put_autosuspend(neoispd->dev);
+
+	dev_dbg(neoispd->dev, "Nodes streaming now 0x%x\n",
+		neoispd->streaming_map);
+}
+
+static const struct vb2_ops neoisp_params_node_queue_ops = {
+	.queue_setup = neoisp_node_queue_setup,
+	.buf_prepare = neoisp_params_node_buf_prepare,
+	.buf_queue = neoisp_node_buf_queue,
+	.start_streaming = neoisp_node_start_streaming,
+	.stop_streaming = neoisp_node_stop_streaming,
+};
+
+static const struct vb2_ops neoisp_node_queue_ops = {
+	.queue_setup = neoisp_node_queue_setup,
+	.buf_prepare = neoisp_node_buf_prepare,
+	.buf_queue = neoisp_node_buf_queue,
+	.start_streaming = neoisp_node_start_streaming,
+	.stop_streaming = neoisp_node_stop_streaming,
+};
+
+static const struct v4l2_file_operations neoisp_fops = {
+	.owner          = THIS_MODULE,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.poll           = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = vb2_fop_mmap
+};
+
+static int neoisp_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	strscpy(cap->driver, NEOISP_NAME, sizeof(cap->driver));
+	strscpy(cap->card, NEOISP_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(neoispd->dev));
+
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+		V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+		V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS |
+		V4L2_CAP_META_OUTPUT | V4L2_CAP_META_CAPTURE;
+	cap->device_caps = node->vfd.device_caps;
+
+	dev_dbg(neoispd->dev, "Caps for node %s: %x and %x (dev %x)\n",
+		NODE_NAME(node), cap->capabilities, cap->device_caps,
+		node->vfd.device_caps);
+
+	return 0;
+}
+
+static int neoisp_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	f->flags = 0;
+	if (node_is_meta(node)) {
+		if (node_is_output(node)) {
+			if (f->index >= ARRAY_SIZE(formats_mout))
+				return -EINVAL;
+
+			f->pixelformat = formats_mout[f->index].fourcc;
+		} else {
+			if (f->index >= ARRAY_SIZE(formats_mcap))
+				return -EINVAL;
+
+			f->pixelformat = formats_mcap[f->index].fourcc;
+		}
+		return 0;
+	}
+	if (node_is_output(node)) {
+		if (f->index >= ARRAY_SIZE(formats_vout))
+			return -EINVAL;
+
+		f->pixelformat = formats_vout[f->index].fourcc;
+	} else {
+		if (node->id == NEOISP_IR_NODE) {
+			if (f->index >= ARRAY_SIZE(formats_vcap_ir))
+				return -EINVAL;
+
+			f->pixelformat = formats_vcap_ir[f->index].fourcc;
+		} else {
+			if (f->index >= ARRAY_SIZE(formats_vcap))
+				return -EINVAL;
+
+			f->pixelformat = formats_vcap[f->index].fourcc;
+		}
+	}
+
+	return 0;
+}
+
+static int neoisp_enum_framesizes(struct file *file, void *priv,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	const struct neoisp_fmt_s *fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	fmt = neoisp_find_pixel_format_by_node(fsize->pixel_format, node);
+	if (!fmt)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = neoisp_frmsize_stepwise;
+
+	return 0;
+}
+
+static int neoisp_g_fmt_meta(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (!node_is_meta(node)) {
+		dev_err(neoispd->dev,
+			"Cannot get meta fmt for video node %s\n", NODE_NAME(node));
+		return -EINVAL;
+	}
+	*f = node->format;
+	dev_dbg(neoispd->dev, "Get meta format for node %s\n", NODE_NAME(node));
+	return 0;
+}
+
+static int neoisp_try_fmt(struct v4l2_format *f, struct neoisp_node_s *node)
+{
+	const struct neoisp_fmt_s *fmt;
+	u32 pixfmt = f->fmt.pix_mp.pixelformat;
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (node_is_meta(node)) {
+		if (node_is_output(node))
+			f->fmt.meta.dataformat = V4L2_META_FMT_NEO_ISP_EXT_PARAMS;
+		else
+			f->fmt.meta.dataformat = V4L2_META_FMT_NEO_ISP_EXT_STATS;
+
+		return 0;
+	}
+
+	fmt = neoisp_find_pixel_format_by_node(pixfmt, node);
+	if (!fmt) {
+		if (node_is_output(node))
+			fmt = &formats_vout[0];
+		else
+			if (node->id == NEOISP_IR_NODE)
+				fmt = &formats_vcap_ir[0];
+			else
+				fmt = &formats_vcap[0];
+	}
+
+	f->fmt.pix_mp.pixelformat = fmt->fourcc;
+	f->fmt.pix_mp.num_planes = fmt->num_planes;
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+
+	if (f->fmt.pix_mp.width % 16 != 0 || f->fmt.pix_mp.height % 2 != 0) {
+		dev_warn(neoispd->dev,
+			 "Width and height must be a multiple of 16 and 2 respectively\n");
+		/* Round width and height to their respective nearest multiple */
+		f->fmt.pix_mp.width = (f->fmt.pix_mp.width + 8) / 16 * 16;
+		f->fmt.pix_mp.height = (f->fmt.pix_mp.height + 1) / 2 * 2;
+	}
+	f->fmt.pix_mp.width = clamp(f->fmt.pix_mp.width, NEOISP_MIN_W, NEOISP_MAX_W);
+	f->fmt.pix_mp.height = clamp(f->fmt.pix_mp.height, NEOISP_MIN_H, NEOISP_MAX_H);
+
+	/*
+	 * Fill in the actual color space when the requested one was
+	 * not supported. This also catches the case when the "default"
+	 * color space was requested (as that's never in the mask).
+	 */
+	if (!(NEOISP_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
+	    fmt->colorspace_mask))
+		f->fmt.pix_mp.colorspace = fmt->colorspace_default;
+
+	/* In all cases, we only support the defaults for these: */
+	f->fmt.pix_mp.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix_mp.colorspace);
+	f->fmt.pix_mp.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix_mp.colorspace);
+
+	f->fmt.pix_mp.quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(fmt->is_rgb, f->fmt.pix_mp.colorspace,
+					      f->fmt.pix_mp.ycbcr_enc);
+
+	/* Set plane size and bytes/line for each plane. */
+	neoisp_fill_mp(f, fmt);
+
+	return 0;
+}
+
+static int neoisp_try_fmt_meta_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (!node_is_meta(node) || node_is_capture(node)) {
+		dev_err(neoispd->dev,
+			"Cannot set capture fmt for meta output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	f->fmt.meta.buffersize = v4l2_isp_buffer_size(NEOISP_EXT_PARAMS_MAX_SIZE);
+
+	return neoisp_try_fmt(f, node);
+}
+
+static int neoisp_try_fmt_meta_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (!node_is_meta(node) || node_is_output(node)) {
+		dev_err(neoispd->dev,
+			"Cannot set capture fmt for meta output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	f->fmt.meta.buffersize = v4l2_isp_buffer_size(NEOISP_EXT_STATS_MAX_SIZE);
+
+	return neoisp_try_fmt(f, node);
+}
+
+static int neoisp_s_fmt_meta_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	int ret;
+
+	ret = neoisp_try_fmt_meta_out(file, priv, f);
+	if (ret < 0)
+		return ret;
+
+	if (vb2_is_busy(&node->queue))
+		return -EBUSY;
+
+	node->format = *f;
+	node->neoisp_format =
+		neoisp_find_pixel_format_by_node(f->fmt.meta.dataformat, node);
+
+	dev_dbg(neoispd->dev,
+		"Set output format for meta node %s to %x\n",
+		NODE_NAME(node),
+		f->fmt.meta.dataformat);
+
+	return 0;
+}
+
+static int neoisp_s_fmt_meta_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	int ret;
+
+	ret = neoisp_try_fmt_meta_cap(file, priv, f);
+	if (ret < 0)
+		return ret;
+
+	if (vb2_is_busy(&node->queue))
+		return -EBUSY;
+
+	node->format = *f;
+	node->neoisp_format =
+		neoisp_find_pixel_format_by_node(f->fmt.meta.dataformat, node);
+
+	dev_dbg(neoispd->dev,
+		"Set capture format for meta node %s to %x\n",
+		NODE_NAME(node),
+		f->fmt.meta.dataformat);
+
+	return 0;
+}
+
+static int neoisp_g_fmt_vid(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (node_is_meta(node)) {
+		dev_err(neoispd->dev,
+			"Cannot get video fmt for meta node %s\n", NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	*f = node->format;
+
+	dev_dbg(neoispd->dev, "Get video format for node %s\n",
+		NODE_NAME(node));
+
+	return 0;
+}
+
+static int neoisp_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (!node_is_capture(node) || node_is_meta(node)) {
+		dev_err(neoispd->dev,
+			"Cannot set capture fmt for output node %s\n", NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	return neoisp_try_fmt(f, node);
+}
+
+static int neoisp_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	int ret;
+
+	ret = neoisp_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	if (vb2_is_busy(&node->queue))
+		return -EBUSY;
+
+	node->format = *f;
+	node->neoisp_format =
+		neoisp_find_pixel_format_by_node(f->fmt.pix_mp.pixelformat, node);
+
+	return 0;
+}
+
+static int neoisp_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+
+	if (!node_is_output(node) || node_is_meta(node)) {
+		dev_err(neoispd->dev,
+			"Cannot set capture fmt for output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	return neoisp_try_fmt(f, node);
+}
+
+static int neoisp_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	struct neoisp_dev_s *neoispd = node->neoisp;
+	int ret = neoisp_try_fmt_vid_out(file, priv, f);
+
+	if (ret < 0)
+		return ret;
+
+	if (vb2_is_busy(&node->queue))
+		return -EBUSY;
+
+	node->format = *f;
+	node->neoisp_format =
+		neoisp_find_pixel_format_by_node(f->fmt.pix_mp.pixelformat, node);
+
+	node->crop.top = 0;
+	node->crop.left = 0;
+	node->crop.width = f->fmt.pix_mp.width;
+	node->crop.height = f->fmt.pix_mp.height;
+	dev_dbg(neoispd->dev,
+		"Set output format for node %s to %x\n",
+		NODE_NAME(node),
+		f->fmt.pix_mp.pixelformat);
+
+	return 0;
+}
+
+static int neoisp_g_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = node->format.fmt.pix_mp.width;
+		sel->r.height = node->format.fmt.pix_mp.height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r.top = node->crop.top;
+		sel->r.left = node->crop.left;
+		sel->r.width = node->crop.width;
+		sel->r.height = node->crop.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int neoisp_s_selection(struct file *file, void *fh, struct v4l2_selection *sel)
+{
+	struct neoisp_node_s *node = video_drvdata(file);
+	u32 winput, hinput;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	dev_dbg(node->neoisp->dev,
+		">>> Buffer Type: %u Target: %u Rect: %ux%u@%d.%d\n",
+		sel->type, sel->target,
+		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		winput = node->format.fmt.pix_mp.width;
+		hinput = node->format.fmt.pix_mp.height;
+
+		/* Left and width should be multiple of 16 */
+		sel->r.left = (sel->r.left / 16) * 16;
+		sel->r.width = (sel->r.width / 16) * 16;
+		/* Top and height should be even */
+		sel->r.top = (sel->r.top / 2) * 2;
+		sel->r.height = (sel->r.height / 2) * 2;
+
+		sel->r.top = clamp_t(int, sel->r.top, 0, hinput - NEOISP_MIN_H);
+		sel->r.left = clamp_t(int, sel->r.left, 0, winput - NEOISP_MIN_W);
+		sel->r.width = clamp(sel->r.width, NEOISP_MIN_W, winput - sel->r.left);
+		sel->r.height = clamp(sel->r.height, NEOISP_MIN_H, hinput - sel->r.top);
+
+		node->crop.top = sel->r.top;
+		node->crop.left = sel->r.left;
+		node->crop.width = sel->r.width;
+		node->crop.height = sel->r.height;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(node->neoisp->dev,
+		"<<< Buffer Type: %u Target: %u Rect: %ux%u@%d.%d\n",
+		sel->type, sel->target,
+		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops neoisp_ioctl_ops = {
+	.vidioc_querycap		= neoisp_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= neoisp_enum_fmt,
+	.vidioc_enum_fmt_meta_cap	= neoisp_enum_fmt,
+	.vidioc_enum_framesizes		= neoisp_enum_framesizes,
+	.vidioc_g_fmt_vid_cap_mplane	= neoisp_g_fmt_vid,
+	.vidioc_s_fmt_vid_cap_mplane	= neoisp_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap_mplane	= neoisp_try_fmt_vid_cap,
+	.vidioc_g_fmt_meta_cap		= neoisp_g_fmt_meta,
+	.vidioc_s_fmt_meta_cap		= neoisp_s_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap	= neoisp_try_fmt_meta_cap,
+
+	.vidioc_enum_fmt_vid_out	= neoisp_enum_fmt,
+	.vidioc_enum_fmt_meta_out	= neoisp_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane	= neoisp_g_fmt_vid,
+	.vidioc_s_fmt_vid_out_mplane	= neoisp_s_fmt_vid_out,
+	.vidioc_try_fmt_vid_out_mplane	= neoisp_try_fmt_vid_out,
+	.vidioc_g_fmt_meta_out		= neoisp_g_fmt_meta,
+	.vidioc_s_fmt_meta_out		= neoisp_s_fmt_meta_out,
+	.vidioc_try_fmt_meta_out	= neoisp_try_fmt_meta_out,
+
+	.vidioc_g_selection		= neoisp_g_selection,
+	.vidioc_s_selection		= neoisp_s_selection,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+static const struct video_device neoisp_videodev = {
+	.name = NEOISP_NAME,
+	.vfl_dir = VFL_DIR_M2M,
+	.fops = &neoisp_fops,
+	.ioctl_ops = &neoisp_ioctl_ops,
+	.minor = -1,
+	.release = video_device_release_empty,
+};
+
+static struct v4l2_ctrl_config controls[] = {
+	[NEOISP_CTRLS_SUPPORTED_PARAMS_BLOCKS] = {
+		.id = V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS,
+		.name = "Neoisp supported params blocks",
+		.type = V4L2_CTRL_TYPE_BITMASK,
+		.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	},
+};
+
+static irqreturn_t neoisp_irq_handler(int irq, void *dev_id)
+{
+	struct neoisp_dev_s *neoispd = (struct neoisp_dev_s *)dev_id;
+	struct neoisp_buffer_s **buf = neoispd->queued_job.buf;
+	u64 ts = ktime_get_ns();
+	u32 irq_status = 0;
+	u32 irq_clear = 0;
+	bool done = false;
+	int i;
+
+	irq_status = neoisp_rd(neoispd, NEO_PIPE_CONF_INT_STAT0);
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FS1) {
+		dev_dbg(neoispd->dev, "Neo IRQ FS1 !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FS1;
+		done = false;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FS2) {
+		dev_dbg(neoispd->dev, "Neo IRQ FS2 !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FS2;
+		done = false;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FD1) {
+		dev_dbg(neoispd->dev, "Neo IRQ FD1 !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FD1;
+		done = false;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_STATD) {
+		dev_dbg(neoispd->dev, "Neo IRQ STATD !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_STATD;
+		done = false;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_DRCD) {
+		dev_dbg(neoispd->dev, "Neo IRQ DRCD !\n");
+		neoisp_ctx_get_stats(neoispd, buf[NEOISP_STATS_NODE]);
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_DRCD;
+		done = false;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_BUS_ERR) {
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_BUS_ERR;
+		dev_err(neoispd->dev, "Neo IRQ BUS ERR!\n");
+		done = true;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_TRIG_ERR) {
+		dev_err(neoispd->dev, "Neo IRQ TRIG ERR !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_TRIG_ERR;
+		done = true;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_CSI_TERR) {
+		dev_err(neoispd->dev, "Neo IRQ TRIG CSI Trigger ERR !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_CSI_TERR;
+		done = true;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_S_FD2) {
+		dev_dbg(neoispd->dev, "Neo IRQ FD2 !\n");
+		irq_clear |= NEO_PIPE_CONF_INT_STAT0_S_FD2;
+		done = true;
+	}
+
+	if (irq_status & NEO_PIPE_CONF_INT_STAT0_BUSY)
+		dev_err(neoispd->dev, "Neo is busy !\n");
+
+	neoisp_wr(neoispd, NEO_PIPE_CONF_INT_STAT0, irq_clear);
+
+	if (done) {
+		for (i = 0; i < NEOISP_NODES_COUNT; i++) {
+			if (!buf[i])
+				continue;
+
+			buf[i]->vb.sequence = neoispd->frame_sequence;
+			buf[i]->vb.vb2_buf.timestamp = ts;
+			vb2_buffer_done(&buf[i]->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+			/* To prevent double buffer handling in case of spurius interrupt */
+			buf[i] = NULL;
+		}
+		/* Update frame_sequence */
+		neoispd->frame_sequence++;
+		/* Check if there's more to do before going to sleep */
+		neoisp_schedule(neoispd, true);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int neoisp_sd_subs_evt(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+			      struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_core_ops neoisp_sd_core_ops = {
+	.subscribe_event = neoisp_sd_subs_evt,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_pad_ops neoisp_sd_pad_ops = {
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+static const struct v4l2_subdev_ops neoisp_sd_ops = {
+	.core = &neoisp_sd_core_ops,
+	.pad = &neoisp_sd_pad_ops,
+};
+
+static int neoisp_init_subdev(struct neoisp_dev_s *neoispd)
+{
+	struct v4l2_subdev *sd = &neoispd->sd;
+	struct v4l2_ctrl_config *control_cfg;
+	struct v4l2_ctrl_handler *hdl;
+	u32 i;
+	int ret;
+
+	v4l2_subdev_init(sd, &neoisp_sd_ops);
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->owner = THIS_MODULE;
+	sd->dev = neoispd->dev;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	strscpy(sd->name, NEOISP_NAME, sizeof(sd->name));
+
+	for (i = 0; i < NEOISP_NODES_COUNT; i++)
+		neoispd->pad[i].flags =
+			node_desc_is_output(&node_desc[i]) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, NEOISP_NODES_COUNT, neoispd->pad);
+	if (ret)
+		goto err_media;
+
+	/* Prepare Supported Params Block control */
+	control_cfg = &controls[NEOISP_CTRLS_SUPPORTED_PARAMS_BLOCKS];
+	i = 0;
+	while (neoispd->info->blocks_list[i] != -1 && i < 64U)
+		control_cfg->max |= BIT(neoispd->info->blocks_list[i++]);
+
+	control_cfg->def = control_cfg->max;
+
+	/* Create custom controls */
+	hdl = &neoispd->hdl;
+	v4l2_ctrl_handler_init(hdl, ARRAY_SIZE(controls));
+	for (i = 0; i < ARRAY_SIZE(controls); i++) {
+		neoispd->ctrls[i] = v4l2_ctrl_new_custom(hdl, &controls[i], NULL);
+		if (hdl->error) {
+			dev_err(neoispd->dev, "Adding control (%d) failed\n", i);
+			ret = hdl->error;
+			goto err_hdl;
+		}
+	}
+	sd->ctrl_handler = hdl;
+
+	ret = v4l2_device_register_subdev(&neoispd->v4l2_dev, sd);
+	if (ret)
+		goto err_hdl;
+
+	return 0;
+
+err_hdl:
+	v4l2_ctrl_handler_free(&neoispd->hdl);
+err_media:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static void node_set_default_format(struct neoisp_node_s *node)
+{
+	if (node_is_meta(node) && node_is_output(node)) {
+		/* Params node - exensible format */
+		struct v4l2_format *f = &node->format;
+
+		f->fmt.meta.dataformat = V4L2_META_FMT_NEO_ISP_EXT_PARAMS;
+		f->fmt.meta.buffersize = v4l2_isp_buffer_size(NEOISP_EXT_PARAMS_MAX_SIZE);
+		f->type = node->buf_type;
+	} else if (node_is_meta(node) && node_is_capture(node)) {
+		/* Stats node - extensible format */
+		struct v4l2_format *f = &node->format;
+
+		f->fmt.meta.dataformat = V4L2_META_FMT_NEO_ISP_EXT_STATS;
+		f->fmt.meta.buffersize = v4l2_isp_buffer_size(NEOISP_EXT_STATS_MAX_SIZE);
+		f->type = node->buf_type;
+	} else {
+		struct v4l2_format f = {0};
+
+		if (node_is_capture(node))
+			f.fmt.pix_mp.pixelformat = formats_vcap[0].fourcc;
+		else
+			f.fmt.pix_mp.pixelformat = formats_vout[0].fourcc;
+
+		f.fmt.pix_mp.width = NEOISP_DEF_W;
+		f.fmt.pix_mp.height = NEOISP_DEF_H;
+		f.type = node->buf_type;
+		neoisp_try_fmt(&f, node);
+		node->format = f;
+	}
+	node->crop.width = NEOISP_DEF_W;
+	node->crop.height = NEOISP_DEF_H;
+
+	node->neoisp_format =
+		neoisp_find_pixel_format_by_node(node->format.fmt.pix_mp.pixelformat, node);
+}
+
+/*
+ * Initialise a struct neoisp_node_s and register it as /dev/video<N>
+ * to represent one of the neoisp's input or output streams.
+ */
+static int neoisp_init_node(struct neoisp_dev_s *neoispd, u32 id)
+{
+	bool output = node_desc_is_output(&node_desc[id]);
+	struct neoisp_node_s *node = &neoispd->node[id];
+	struct media_entity *entity = &node->vfd.entity;
+	struct media_pad *mpad;
+	struct video_device *vdev = &node->vfd;
+	struct vb2_queue *q = &node->queue;
+	int ret;
+
+	node->id = id;
+	node->neoisp = neoispd;
+	node->buf_type = node_desc[id].buf_type;
+
+	INIT_LIST_HEAD(&node->ready_queue);
+
+	node->format.type = node->buf_type;
+	node_set_default_format(node);
+
+	q->type = node->buf_type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->drv_priv = node;
+	if (node->id == NEOISP_PARAMS_NODE)
+		q->ops = &neoisp_params_node_queue_ops;
+	else
+		q->ops = &neoisp_node_queue_ops;
+
+	q->buf_struct_size = sizeof(struct neoisp_buffer_s);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->dev = neoispd->dev;
+	/* Share neoisp lock between video devices */
+	q->lock = &neoispd->queue_lock;
+
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		dev_err(neoispd->dev, "vb2_queue_init failed\n");
+		return ret;
+	}
+
+	*vdev = neoisp_videodev; /* Default initialization */
+	strscpy(vdev->name, node_desc[id].ent_name, sizeof(vdev->name));
+	vdev->v4l2_dev = &neoispd->v4l2_dev;
+	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
+	/* Get V4L2 to serialise our ioctls */
+	vdev->queue = &node->queue;
+	vdev->device_caps = V4L2_CAP_STREAMING | node_desc[id].caps;
+
+	node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(entity, 1, &node->pad);
+	if (ret) {
+		dev_err(neoispd->dev,
+			"Failed to register video %s device node\n",
+			NODE_NAME(node));
+		goto err_unregister_queue;
+	}
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(neoispd->dev,
+			"Failed to register media pads for %s device node\n",
+			NODE_NAME(node));
+		goto err_unregister_queue;
+	}
+	video_set_drvdata(vdev, node);
+
+	if (output)
+		ret = media_create_pad_link(entity, 0, &neoispd->sd.entity,
+					    id, node_desc[id].link_flags);
+	else
+		ret = media_create_pad_link(&neoispd->sd.entity, id, entity,
+					    0, node_desc[id].link_flags);
+	if (ret)
+		goto err_unregister_video_dev;
+
+	media_entity_for_each_pad(&neoispd->sd.entity, mpad)
+		if (mpad->index == id)
+			break;
+	if (output)
+		node->intf_link = media_entity_find_link(&node->pad, mpad);
+	else
+		node->intf_link = media_entity_find_link(mpad, &node->pad);
+
+	dev_dbg(neoispd->dev,
+		"%s device node registered as /dev/video%d\n",
+		NODE_NAME(node), node->vfd.num);
+
+	return 0;
+
+err_unregister_video_dev:
+	video_unregister_device(&node->vfd);
+err_unregister_queue:
+	vb2_queue_release(&node->queue);
+	return ret;
+}
+
+static int neoisp_init_group(struct neoisp_dev_s *neoispd, struct media_device *mdev)
+{
+	struct v4l2_device *v4l2_dev = &neoispd->v4l2_dev;
+	u32 num_registered = 0;
+	int ret;
+
+	mutex_init(&neoispd->queue_lock);
+
+	/* Register v4l2_device and media_device */
+	v4l2_dev->mdev = mdev;
+	strscpy(v4l2_dev->name, NEOISP_NAME, sizeof(v4l2_dev->name));
+
+	/* Register the NEOISP subdevice. */
+	ret = neoisp_init_subdev(neoispd);
+	if (ret)
+		goto err_unregister_v4l2;
+
+	/* Create device video nodes */
+	for (; num_registered < NEOISP_NODES_COUNT; num_registered++) {
+		ret = neoisp_init_node(neoispd, num_registered);
+		if (ret)
+			goto err_unregister_nodes;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(v4l2_dev);
+	if (ret)
+		goto err_unregister_nodes;
+
+	return 0;
+
+err_unregister_nodes:
+	v4l2_ctrl_handler_free(&neoispd->hdl);
+	media_entity_cleanup(&neoispd->sd.entity);
+	while (num_registered-- > 0) {
+		video_unregister_device(&neoispd->node[num_registered].vfd);
+		vb2_queue_release(&neoispd->node[num_registered].queue);
+	}
+	v4l2_device_unregister_subdev(&neoispd->sd);
+err_unregister_v4l2:
+	v4l2_device_unregister(v4l2_dev);
+	mutex_destroy(&neoispd->queue_lock);
+	return ret;
+}
+
+static void neoisp_destroy_devices(struct neoisp_dev_s *neoispd)
+{
+	int i;
+
+	if (neoispd->context) {
+		dma_free_coherent(neoispd->dev,
+				  sizeof(struct neoisp_context_s),
+				  neoispd->context,
+				  neoispd->params_dma_addr);
+	}
+
+	v4l2_device_unregister(&neoispd->v4l2_dev);
+
+	if (standalone_mdev)
+		media_device_unregister(&neoispd->mdev);
+	else if (!neoispd->media_registered)
+		return;
+
+	dev_dbg(neoispd->dev, "Unregister from media controller\n");
+
+	v4l2_ctrl_handler_free(&neoispd->hdl);
+	media_entity_cleanup(&neoispd->sd.entity);
+
+	for (i = NEOISP_NODES_COUNT - 1; i >= 0; i--) {
+		struct neoisp_node_s *node = &neoispd->node[i];
+
+		video_unregister_device(&node->vfd);
+		vb2_queue_release(&node->queue);
+	}
+	mutex_destroy(&neoispd->queue_lock);
+}
+
+int neoisp_core_media_register(struct device *dev, struct v4l2_subdev *sd)
+{
+	struct neoisp_dev_s *neoispd = dev_get_drvdata(dev);
+	struct media_device *mdev = sd->v4l2_dev->mdev;
+	int ret;
+
+	if (!neoispd)
+		return -EINVAL;
+
+	if (neoispd->media_registered || standalone_mdev)
+		return 0;
+
+	ret = neoisp_init_group(neoispd, mdev);
+	if (ret)
+		return ret;
+
+	neoispd->media_registered++;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(neoisp_core_media_register);
+
+static int neoisp_init_devices(struct neoisp_dev_s *neoispd)
+{
+	struct v4l2_device *v4l2_dev;
+	struct media_device *mdev;
+	int ret;
+
+	v4l2_dev = &neoispd->v4l2_dev;
+	strscpy(v4l2_dev->name, NEOISP_NAME, sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(neoispd->dev, v4l2_dev);
+	if (ret)
+		return ret;
+
+	neoispd->streaming_map = 0;
+	neoispd->dummy_buf = NULL;
+	neoispd->context = dma_alloc_coherent(neoispd->dev,
+					      sizeof(struct neoisp_context_s),
+					      &neoispd->params_dma_addr, GFP_KERNEL);
+	if (!neoispd->context) {
+		dev_err(neoispd->dev, "Unable to allocate cached context buffers.\n");
+		v4l2_device_unregister(v4l2_dev);
+		return -ENOMEM;
+	}
+
+	if (!standalone_mdev)
+		return 0;
+
+	/* Prepare neoisp media device in standalone mode only */
+	mdev = &neoispd->mdev;
+	mdev->dev = neoispd->dev;
+	strscpy(mdev->model, NEOISP_NAME, sizeof(mdev->model));
+	snprintf(mdev->bus_info, sizeof(mdev->bus_info),
+		 "platform:%s", dev_name(neoispd->dev));
+	media_device_init(mdev);
+
+	ret = neoisp_init_group(neoispd, mdev);
+	if (ret) {
+		dma_free_coherent(neoispd->dev,
+				  sizeof(struct neoisp_context_s),
+				  neoispd->context,
+				  neoispd->params_dma_addr);
+		goto err_group;
+	}
+
+	ret = media_device_register(mdev);
+	if (ret)
+		goto err_media;
+
+	return 0;
+
+err_media:
+	neoisp_destroy_devices(neoispd);
+err_group:
+	media_device_cleanup(mdev);
+	return ret;
+}
+
+static void neoisp_init_hw(struct neoisp_dev_s *neoispd)
+{
+	u32 val;
+
+	neoisp_reset_hw(neoispd, false);
+	neoisp_reset_hw(neoispd, true);
+
+	/* Disable bus error if eDMA transfer is used */
+	neoisp_wr(neoispd, NEO_PIPE_CONF_REG_XFR_DIS,
+		  NEO_PIPE_CONF_REG_XFR_DIS_XFR_ERR_DIS);
+
+	/* Disable debug */
+	neoisp_wr(neoispd, NEO_IDBG1_LINE_NUM,
+		  NEO_IDBG1_LINE_NUM_LINE_NUM);
+	neoisp_wr(neoispd, NEO_IDBG2_LINE_NUM,
+		  NEO_IDBG2_LINE_NUM_LINE_NUM);
+
+	/* Enable interrupts */
+	val = NEO_PIPE_CONF_INT_EN0_EN_FD2 |
+		NEO_PIPE_CONF_INT_EN0_EN_DRCD |
+		NEO_PIPE_CONF_INT_EN0_EN_BUS_ERR |
+		NEO_PIPE_CONF_INT_EN0_EN_CSI_TERR |
+		NEO_PIPE_CONF_INT_EN0_EN_TRIG_ERR;
+	neoisp_wr(neoispd, NEO_PIPE_CONF_INT_EN0, val);
+}
+
+static int neoisp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct neoisp_dev_s *neoispd;
+	struct resource *r;
+	int ret, irq;
+
+	neoispd = devm_kzalloc(dev, sizeof(*neoispd), GFP_KERNEL);
+	if (!neoispd)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&neoispd->job_queue);
+
+	neoispd->dev = dev;
+	neoispd->info = (struct neoisp_info_s *)of_device_get_match_data(dev);
+
+	ret = devm_clk_bulk_get_all(dev, &neoispd->clks);
+	if (ret < 0) {
+		dev_err(dev, "Unable to get clocks: %d\n", ret);
+		return ret;
+	}
+	neoispd->num_clks = ret;
+
+	/* Get regs address */
+	neoispd->mmio = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(neoispd->mmio))
+		return PTR_ERR(neoispd->mmio);
+
+	/* Get internal isp memory address */
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	neoispd->local_mem = (void *)devm_ioremap_resource_wc(dev, r);
+	if (IS_ERR(neoispd->local_mem))
+		return PTR_ERR(neoispd->local_mem);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto err_irq;
+	}
+
+	platform_set_drvdata(pdev, neoispd);
+
+	ret = devm_request_irq(dev, irq, neoisp_irq_handler, 0,
+			       dev_name(dev), neoispd);
+	if (ret < 0) {
+		dev_err(dev, "Failed to request irq: %d\n", ret);
+		goto err_irq;
+	}
+
+	pm_runtime_set_autosuspend_delay(dev, NEOISP_SUSPEND_TIMEOUT_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "Unable to resume the device: %d\n", ret);
+		goto err_pm_runtime_disable;
+	}
+
+	ret = neoisp_init_devices(neoispd);
+	if (ret)
+		goto err_pm_runtime_suspend;
+
+	spin_lock_init(&neoispd->hw_lock);
+	neoisp_init_hw(neoispd);
+	neoisp_set_default_context(neoispd);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+err_pm_runtime_suspend:
+	pm_runtime_put(dev);
+err_pm_runtime_disable:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+err_irq:
+	dev_err(dev, "probe: error %d\n", ret);
+	return ret;
+}
+
+static void neoisp_remove(struct platform_device *pdev)
+{
+	struct neoisp_dev_s *neoispd = platform_get_drvdata(pdev);
+
+	neoisp_destroy_devices(neoispd);
+
+	if (standalone_mdev)
+		media_device_cleanup(&neoispd->mdev);
+
+	pm_runtime_dont_use_autosuspend(neoispd->dev);
+	pm_runtime_disable(neoispd->dev);
+}
+
+static int __maybe_unused neoisp_runtime_suspend(struct device *dev)
+{
+	struct neoisp_dev_s *neoispd = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(neoispd->num_clks, neoispd->clks);
+
+	return 0;
+}
+
+static int __maybe_unused neoisp_runtime_resume(struct device *dev)
+{
+	int ret;
+	struct neoisp_dev_s *neoispd = dev_get_drvdata(dev);
+
+	ret = clk_bulk_prepare_enable(neoispd->num_clks, neoispd->clks);
+
+	if (ret) {
+		dev_err(dev, "Failed to resume device. Could not re-enable clocks.\n");
+		return ret;
+	}
+
+	neoisp_init_hw(neoispd);
+
+	return 0;
+}
+
+static int __maybe_unused neoisp_pm_suspend(struct device *dev)
+{
+	struct neoisp_dev_s *neoispd = dev_get_drvdata(dev);
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(NEOISP_SUSPEND_TIMEOUT_MS);
+	while (neoispd->hw_busy) {
+		cond_resched();
+		if (time_after_eq(jiffies, timeout)) {
+			dev_err(dev, "Failed to enter idle on system suspend\n");
+			return -EBUSY;
+		}
+	}
+
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int __maybe_unused neoisp_pm_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+
+static const struct dev_pm_ops neoisp_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(neoisp_pm_suspend, neoisp_pm_resume)
+	SET_RUNTIME_PM_OPS(neoisp_runtime_suspend, neoisp_runtime_resume, NULL)
+};
+
+static const unsigned int neoisp_blocks_list_imx95x[] = {
+	NEOISP_PARAM_BLK_PIPE_CONF,
+	NEOISP_PARAM_BLK_HEAD_COLOR,
+	NEOISP_PARAM_BLK_HDR_DECOMPRESS0,
+	NEOISP_PARAM_BLK_HDR_DECOMPRESS1,
+	NEOISP_PARAM_BLK_OBWB0,
+	NEOISP_PARAM_BLK_OBWB1,
+	NEOISP_PARAM_BLK_OBWB2,
+	NEOISP_PARAM_BLK_HDR_MERGE,
+	NEOISP_PARAM_BLK_RGBIR,
+	NEOISP_PARAM_BLK_STAT,
+	NEOISP_PARAM_BLK_CTEMP,
+	NEOISP_PARAM_BLK_IR_COMPRESS,
+	NEOISP_PARAM_BLK_BNR,
+	NEOISP_PARAM_BLK_VIGNETTING_CTRL,
+	NEOISP_PARAM_BLK_DEMOSAIC,
+	NEOISP_PARAM_BLK_RGB2YUV,
+	NEOISP_PARAM_BLK_DR_COMP,
+	NEOISP_PARAM_BLK_NR,
+	NEOISP_PARAM_BLK_AF,
+	NEOISP_PARAM_BLK_EE,
+	NEOISP_PARAM_BLK_DF,
+	NEOISP_PARAM_BLK_CONVMED,
+	NEOISP_PARAM_BLK_CAS,
+	NEOISP_PARAM_BLK_GCM,
+	NEOISP_PARAM_BLK_VIGNETTING_TABLE,
+	NEOISP_PARAM_BLK_DRC_GLOBAL_TONEMAP,
+	NEOISP_PARAM_BLK_DRC_LOCAL_TONEMAP,
+	-1, /* end of list */
+};
+
+static const struct neoisp_info_s neoisp_imx95_data = {
+	.blocks_list = neoisp_blocks_list_imx95x,
+};
+
+static const struct of_device_id neoisp_dt_ids[] = {
+	{ .compatible = "nxp,imx95-neoisp", .data = &neoisp_imx95_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, neoisp_dt_ids);
+
+static struct platform_driver neoisp_driver = {
+	.probe  = neoisp_probe,
+	.remove = neoisp_remove,
+	.driver = {
+		.name = NEOISP_NAME,
+		.pm = &neoisp_pm,
+		.of_match_table = neoisp_dt_ids,
+	},
+};
+
+module_platform_driver(neoisp_driver);
+
+MODULE_DESCRIPTION("NXP NEOISP Hardware");
+MODULE_AUTHOR("Antoine Bouyer <antoine.bouyer@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_nodes.h b/drivers/media/platform/nxp/neoisp/neoisp_nodes.h
new file mode 100644
index 000000000000..54986fe13b33
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_nodes.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP nodes description
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#ifndef __NXP_NEOISP_NODES_H
+#define __NXP_NEOISP_NODES_H
+
+#include <linux/videodev2.h>
+
+#include "neoisp.h"
+
+static const struct neoisp_node_desc_s node_desc[NEOISP_NODES_COUNT] = {
+	[NEOISP_INPUT0_NODE] = {
+		.ent_name = NEOISP_NAME "-input0",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+	},
+	[NEOISP_INPUT1_NODE] = {
+		.ent_name = NEOISP_NAME "-input1",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
+		.link_flags = 0u,
+	},
+	[NEOISP_PARAMS_NODE] = {
+		.ent_name = NEOISP_NAME "-params",
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.caps = V4L2_CAP_META_OUTPUT,
+		.link_flags = MEDIA_LNK_FL_ENABLED,
+	},
+	[NEOISP_FRAME_NODE] = {
+		.ent_name = NEOISP_NAME "-frame",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+		.link_flags = MEDIA_LNK_FL_ENABLED,
+	},
+	[NEOISP_IR_NODE] = {
+		.ent_name = NEOISP_NAME "-ir",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+		.link_flags = 0u,
+	},
+	[NEOISP_STATS_NODE] = {
+		.ent_name = NEOISP_NAME "-stats",
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.caps = V4L2_CAP_META_CAPTURE,
+		.link_flags = MEDIA_LNK_FL_ENABLED,
+	},
+};
+
+#endif /* __NXP_NEOISP_NODES_H */
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_regs.h b/drivers/media/platform/nxp/neoisp/neoisp_regs.h
new file mode 100644
index 000000000000..8323250b6da6
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_regs.h
@@ -0,0 +1,1465 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * NEOISP registers definition
+ *
+ * Copyright 2023-2026 NXP
+ */
+
+#ifndef __NXP_NEOISP_REGS_H
+#define __NXP_NEOISP_REGS_H
+
+#include <linux/types.h>
+
+/* PIPE_CONF */
+#define NEO_PIPE_CONF_SOFT_RESET 0x0
+#define NEO_PIPE_CONF_SOFT_RESET_SOFT_RESET BIT(0)
+#define NEO_PIPE_CONF_SOFT_RESET_HARD_RESET BIT(1)
+
+#define NEO_PIPE_CONF_BUS_TXPARAM 0x4
+#define NEO_PIPE_CONF_BUS_TXPARAM_OTLT GENMASK(7, 0)
+#define NEO_PIPE_CONF_BUS_TXPARAM_OTHT GENMASK(15, 8)
+#define NEO_PIPE_CONF_BUS_TXPARAM_POSTQOS GENMASK(23, 16)
+#define NEO_PIPE_CONF_BUS_TXPARAM_BSIZE GENMASK(31, 24)
+
+#define NEO_PIPE_CONF_REG_XFR_DIS 0x8
+#define NEO_PIPE_CONF_REG_XFR_DIS_XFR_ERR_DIS BIT(31)
+
+#define NEO_PIPE_CONF_CSI_CTRL 0x10
+#define NEO_PIPE_CONF_CSI_CTRL_VID0 GENMASK(4, 0)
+#define NEO_PIPE_CONF_CSI_CTRL_VID1 GENMASK(12, 8)
+#define NEO_PIPE_CONF_CSI_CTRL_SSEN BIT(29)
+#define NEO_PIPE_CONF_CSI_CTRL_DEVL BIT(30)
+#define NEO_PIPE_CONF_CSI_CTRL_CSI_EN BIT(31)
+
+#define NEO_PIPE_CONF_FRAME_NUM 0x14
+#define NEO_PIPE_CONF_FRAME_NUM_CURR_FRAME GENMASK(15, 0)
+#define NEO_PIPE_CONF_FRAME_NUM_SHD_FRAME GENMASK(31, 16)
+
+#define NEO_PIPE_CONF_REG_SHD_CTRL 0x18
+#define NEO_PIPE_CONF_REG_SHD_CTRL_CTRL BIT(31)
+
+#define NEO_PIPE_CONF_REG_SHD_CMD 0x1c
+
+#define NEO_PIPE_CONF_TRIG_CAM0 0x20
+#define NEO_PIPE_CONF_TRIG_CAM0_TRIGGER BIT(0)
+
+#define NEO_PIPE_CONF_IMG_CONF_CAM0 0x30
+#define NEO_PIPE_CONF_IMG_CONF_CAM0_IBPP0 GENMASK(3, 0)
+#define NEO_PIPE_CONF_IMG_CONF_CAM0_INALIGN0 BIT(4)
+#define NEO_PIPE_CONF_IMG_CONF_CAM0_LPALIGN0 BIT(5)
+#define NEO_PIPE_CONF_IMG_CONF_CAM0_IBPP1 GENMASK(19, 16)
+#define NEO_PIPE_CONF_IMG_CONF_CAM0_INALIGN1 BIT(20)
+#define NEO_PIPE_CONF_IMG_CONF_CAM0_LPALIGN1 BIT(21)
+
+#define NEO_PIPE_CONF_IMG_SIZE_CAM0 0x34
+#define NEO_PIPE_CONF_IMG_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_PIPE_CONF_IMG_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+/* PIPE_CONF ADDR registers contain the upper 32-bits of the 36-bit address of an image frame */
+#define NEO_PIPE_CONF_ADDR_CONVERT(x) (((x) >> 4) & ~0u)
+
+#define NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0 0x3c
+#define NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0_ADDR GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0 0x40
+#define NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0_ADDR GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_OUTCH0_ADDR_CAM0 0x44
+#define NEO_PIPE_CONF_OUTCH0_ADDR_CAM0_ADDR GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_OUTCH1_ADDR_CAM0 0x48
+#define NEO_PIPE_CONF_OUTCH1_ADDR_CAM0_ADDR GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_OUTIR_ADDR_CAM0 0x4c
+#define NEO_PIPE_CONF_OUTIR_ADDR_CAM0_ADDR GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_IMG0_IN_LS_CAM0 0x50
+#define NEO_PIPE_CONF_IMG0_IN_LS_CAM0_LS GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_IMG1_IN_LS_CAM0 0x54
+#define NEO_PIPE_CONF_IMG1_IN_LS_CAM0_LS GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_OUTCH0_LS_CAM0 0x58
+#define NEO_PIPE_CONF_OUTCH0_LS_CAM0_LS GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_OUTCH1_LS_CAM0 0x5c
+#define NEO_PIPE_CONF_OUTCH1_LS_CAM0_LS GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_OUTIR_LS_CAM0 0x60
+#define NEO_PIPE_CONF_OUTIR_LS_CAM0_LS GENMASK(31, 0)
+
+#define NEO_PIPE_CONF_SKIP_CTRL0 0x64
+#define NEO_PIPE_CONF_SKIP_CTRL0_PRESKIP GENMASK(15, 0)
+#define NEO_PIPE_CONF_SKIP_CTRL0_POSTSKIP GENMASK(31, 16)
+
+#define NEO_PIPE_CONF_INT_EN0 0x24
+#define NEO_PIPE_CONF_INT_EN0_EN_FS1 BIT(0)
+#define NEO_PIPE_CONF_INT_EN0_EN_FS2 BIT(1)
+#define NEO_PIPE_CONF_INT_EN0_EN_FD1 BIT(2)
+#define NEO_PIPE_CONF_INT_EN0_EN_FD2 BIT(3)
+#define NEO_PIPE_CONF_INT_EN0_EN_STATD BIT(4)
+#define NEO_PIPE_CONF_INT_EN0_EN_DRCD BIT(5)
+#define NEO_PIPE_CONF_INT_EN0_EN_BUS_ERR GENMASK(19, 16)
+#define NEO_PIPE_CONF_INT_EN0_EN_CSI_TERR BIT(29)
+#define NEO_PIPE_CONF_INT_EN0_EN_TRIG_ERR BIT(30)
+
+#define NEO_PIPE_CONF_INT_STAT0 0x28
+#define NEO_PIPE_CONF_INT_STAT0_S_FS1 BIT(0)
+#define NEO_PIPE_CONF_INT_STAT0_S_FS2 BIT(1)
+#define NEO_PIPE_CONF_INT_STAT0_S_FD1 BIT(2)
+#define NEO_PIPE_CONF_INT_STAT0_S_FD2 BIT(3)
+#define NEO_PIPE_CONF_INT_STAT0_S_STATD BIT(4)
+#define NEO_PIPE_CONF_INT_STAT0_S_DRCD BIT(5)
+#define NEO_PIPE_CONF_INT_STAT0_S_BUS_ERR GENMASK(19, 16)
+#define NEO_PIPE_CONF_INT_STAT0_S_CSI_TERR BIT(29)
+#define NEO_PIPE_CONF_INT_STAT0_S_TRIG_ERR BIT(30)
+#define NEO_PIPE_CONF_INT_STAT0_BUSY BIT(31)
+
+#define NEO_PIPE_CONF_CSI_STAT 0x2c
+#define NEO_PIPE_CONF_CSI_STAT_S_SL_LP0 BIT(0)
+#define NEO_PIPE_CONF_CSI_STAT_S_SF_LP0 BIT(1)
+#define NEO_PIPE_CONF_CSI_STAT_S_DO_LP0 BIT(2)
+#define NEO_PIPE_CONF_CSI_STAT_S_LOC_LP0 BIT(3)
+#define NEO_PIPE_CONF_CSI_STAT_S_LO_LP0 BIT(4)
+#define NEO_PIPE_CONF_CSI_STAT_S_CMD_LP0 BIT(5)
+#define NEO_PIPE_CONF_CSI_STAT_S_LL_LP0 BIT(6)
+#define NEO_PIPE_CONF_CSI_STAT_S_DATA_LP0 BIT(7)
+#define NEO_PIPE_CONF_CSI_STAT_S_SL_LP1 BIT(16)
+#define NEO_PIPE_CONF_CSI_STAT_S_SF_LP1 BIT(17)
+#define NEO_PIPE_CONF_CSI_STAT_S_DO_LP1 BIT(18)
+#define NEO_PIPE_CONF_CSI_STAT_S_LOC_LP1 BIT(19)
+#define NEO_PIPE_CONF_CSI_STAT_S_LO_LP1 BIT(20)
+#define NEO_PIPE_CONF_CSI_STAT_S_CMD_LP1 BIT(21)
+#define NEO_PIPE_CONF_CSI_STAT_S_LL_LP1 BIT(22)
+#define NEO_PIPE_CONF_CSI_STAT_S_DATA_LP1 BIT(23)
+#define NEO_PIPE_CONF_CSI_STAT_S_STOP BIT(31)
+
+/* HC */
+#define NEO_HC_CTRL_CAM0 0xc0
+#define NEO_HC_CTRL_CAM0_HOFFSET GENMASK(1, 0)
+#define NEO_HC_CTRL_CAM0_VOFFSET GENMASK(3, 2)
+
+/* HDR_DECOMPRESS0 */
+#define NEO_HDR_DECOMPRESS0_CTRL_CAM0 0x100
+#define NEO_HDR_DECOMPRESS0_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0 0x104
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0 0x108
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0 0x10c
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0 0x110
+#define NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0 0x114
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0 0x118
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0 0x11c
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0 0x120
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0 0x124
+#define NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0 0x128
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0_RATIO0 GENMASK(11, 0)
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0_RATIO1 GENMASK(27, 16)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0 0x12c
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0_RATIO2 GENMASK(11, 0)
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0_RATIO3 GENMASK(27, 16)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0 0x130
+#define NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0_RATIO4 GENMASK(11, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0 0x134
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0 0x138
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0 0x13c
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0 0x140
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0 0x144
+#define NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0_KNEEPOINT GENMASK(19, 0)
+
+/* HDR_DECOMPRESS1 */
+#define NEO_HDR_DECOMPRESS1_CTRL_CAM0 0x180
+#define NEO_HDR_DECOMPRESS1_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0 0x184
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0 0x188
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0 0x18c
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0 0x190
+#define NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0 0x194
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0 0x198
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0 0x19c
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0 0x1a0
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0 0x1a4
+#define NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0_OFFSET GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0 0x1a8
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0_RATIO0 GENMASK(11, 0)
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0_RATIO1 GENMASK(27, 16)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0 0x1ac
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0_RATIO2 GENMASK(11, 0)
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0_RATIO3 GENMASK(27, 16)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0 0x1b0
+#define NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0_RATIO4 GENMASK(11, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0 0x1b4
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0 0x1b8
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0 0x1bc
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0 0x1c0
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0 0x1c4
+#define NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0_KNEEPOINT GENMASK(15, 0)
+
+/* OB_WB0 */
+#define NEO_OB_WB0_CTRL_CAM0 0x200
+#define NEO_OB_WB0_CTRL_CAM0_OBPP GENMASK(3, 2)
+
+#define NEO_OB_WB0_R_CTRL_CAM0 0x204
+#define NEO_OB_WB0_R_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB0_R_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB0_GR_CTRL_CAM0 0x208
+#define NEO_OB_WB0_GR_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB0_GR_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB0_GB_CTRL_CAM0 0x20c
+#define NEO_OB_WB0_GB_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB0_GB_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB0_B_CTRL_CAM0 0x210
+#define NEO_OB_WB0_B_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB0_B_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+/* OB_WB1 */
+#define NEO_OB_WB1_CTRL_CAM0 0x240
+#define NEO_OB_WB1_CTRL_CAM0_OBPP GENMASK(3, 2)
+
+#define NEO_OB_WB1_R_CTRL_CAM0 0x244
+#define NEO_OB_WB1_R_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB1_R_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB1_GR_CTRL_CAM0 0x248
+#define NEO_OB_WB1_GR_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB1_GR_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB1_GB_CTRL_CAM0 0x24c
+#define NEO_OB_WB1_GB_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB1_GB_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB1_B_CTRL_CAM0 0x250
+#define NEO_OB_WB1_B_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB1_B_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+/* OB_WB2 */
+#define NEO_OB_WB2_CTRL_CAM0 0x280
+#define NEO_OB_WB2_CTRL_CAM0_OBPP GENMASK(3, 2)
+
+#define NEO_OB_WB2_R_CTRL_CAM0 0x284
+#define NEO_OB_WB2_R_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB2_R_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB2_GR_CTRL_CAM0 0x288
+#define NEO_OB_WB2_GR_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB2_GR_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB2_GB_CTRL_CAM0 0x28c
+#define NEO_OB_WB2_GB_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB2_GB_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+#define NEO_OB_WB2_B_CTRL_CAM0 0x290
+#define NEO_OB_WB2_B_CTRL_CAM0_OFFSET GENMASK(15, 0)
+#define NEO_OB_WB2_B_CTRL_CAM0_GAIN GENMASK(31, 16)
+
+/* HDR_MERGE */
+#define NEO_HDR_MERGE_CTRL_CAM0 0x300
+#define NEO_HDR_MERGE_CTRL_CAM0_OBPP GENMASK(3, 2)
+#define NEO_HDR_MERGE_CTRL_CAM0_SAFETY_ON BIT(4)
+#define NEO_HDR_MERGE_CTRL_CAM0_MOTION_FIX_EN BIT(8)
+#define NEO_HDR_MERGE_CTRL_CAM0_BLEND_3X3 BIT(9)
+#define NEO_HDR_MERGE_CTRL_CAM0_GAIN0BPP GENMASK(17, 16)
+#define NEO_HDR_MERGE_CTRL_CAM0_GAIN1BPP GENMASK(19, 18)
+#define NEO_HDR_MERGE_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_HDR_MERGE_GAIN_OFFSET_CAM0 0x304
+#define NEO_HDR_MERGE_GAIN_OFFSET_CAM0_OFFSET0 GENMASK(15, 0)
+#define NEO_HDR_MERGE_GAIN_OFFSET_CAM0_OFFSET1 GENMASK(31, 16)
+
+#define NEO_HDR_MERGE_GAIN_SCALE_CAM0 0x308
+#define NEO_HDR_MERGE_GAIN_SCALE_CAM0_SCALE0 GENMASK(15, 0)
+#define NEO_HDR_MERGE_GAIN_SCALE_CAM0_SCALE1 GENMASK(31, 16)
+
+#define NEO_HDR_MERGE_GAIN_SHIFT_CAM0 0x30c
+#define NEO_HDR_MERGE_GAIN_SHIFT_CAM0_SHIFT0 GENMASK(4, 0)
+#define NEO_HDR_MERGE_GAIN_SHIFT_CAM0_SHIFT1 GENMASK(20, 16)
+
+#define NEO_HDR_MERGE_LUMA_TH_CAM0 0x310
+#define NEO_HDR_MERGE_LUMA_TH_CAM0_TH0 GENMASK(15, 0)
+
+#define NEO_HDR_MERGE_LUMA_SCALE_CAM0 0x314
+#define NEO_HDR_MERGE_LUMA_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_HDR_MERGE_LUMA_SCALE_CAM0_SHIFT GENMASK(20, 16)
+#define NEO_HDR_MERGE_LUMA_SCALE_CAM0_THSHIFT GENMASK(28, 24)
+
+#define NEO_HDR_MERGE_DOWNSCALE_CAM0 0x318
+#define NEO_HDR_MERGE_DOWNSCALE_CAM0_IMGSCALE0 GENMASK(4, 0)
+#define NEO_HDR_MERGE_DOWNSCALE_CAM0_IMGSCALE1 GENMASK(20, 16)
+
+#define NEO_HDR_MERGE_UPSCALE_CAM0 0x31c
+#define NEO_HDR_MERGE_UPSCALE_CAM0_IMGSCALE0 GENMASK(3, 0)
+#define NEO_HDR_MERGE_UPSCALE_CAM0_IMGSCALE1 GENMASK(19, 16)
+
+#define NEO_HDR_MERGE_POST_SCALE_CAM0 0x320
+#define NEO_HDR_MERGE_POST_SCALE_CAM0_SCALE GENMASK(4, 0)
+
+#define NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0 0x324
+#define NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0_OFFSET0 GENMASK(15, 0)
+#define NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0_OFFSET1 GENMASK(31, 16)
+
+#define NEO_HDR_MERGE_S_GAIN_SCALE_CAM0 0x328
+#define NEO_HDR_MERGE_S_GAIN_SCALE_CAM0_SCALE0 GENMASK(15, 0)
+#define NEO_HDR_MERGE_S_GAIN_SCALE_CAM0_SCALE1 GENMASK(31, 16)
+
+#define NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0 0x32c
+#define NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0_SHIFT0 GENMASK(4, 0)
+#define NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0_SHIFT1 GENMASK(20, 16)
+
+#define NEO_HDR_MERGE_S_LUMA_TH_CAM0 0x330
+#define NEO_HDR_MERGE_S_LUMA_TH_CAM0_TH0 GENMASK(15, 0)
+
+#define NEO_HDR_MERGE_S_LUMA_SCALE_CAM0 0x334
+#define NEO_HDR_MERGE_S_LUMA_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_HDR_MERGE_S_LUMA_SCALE_CAM0_SHIFT GENMASK(20, 16)
+#define NEO_HDR_MERGE_S_LUMA_SCALE_CAM0_THSHIFT GENMASK(28, 24)
+
+#define NEO_HDR_MERGE_S_DOWNSCALE_CAM0 0x338
+#define NEO_HDR_MERGE_S_DOWNSCALE_CAM0_IMGSCALE0 GENMASK(4, 0)
+#define NEO_HDR_MERGE_S_DOWNSCALE_CAM0_IMGSCALE1 GENMASK(20, 16)
+
+#define NEO_HDR_MERGE_S_UPSCALE_CAM0 0x33c
+#define NEO_HDR_MERGE_S_UPSCALE_CAM0_IMGSCALE0 GENMASK(3, 0)
+#define NEO_HDR_MERGE_S_UPSCALE_CAM0_IMGSCALE1 GENMASK(19, 16)
+
+#define NEO_HDR_MERGE_S_POST_SCALE_CAM0 0x340
+#define NEO_HDR_MERGE_S_POST_SCALE_CAM0_SCALE GENMASK(4, 0)
+
+#define NEO_HDR_MERGE_S_LINE_NUM_CAM0 0x344
+#define NEO_HDR_MERGE_S_LINE_NUM_CAM0_LINE GENMASK(15, 1)
+
+/* COLOR_TEMP */
+#define NEO_COLOR_TEMP_CTRL_CAM0 0x400
+#define NEO_COLOR_TEMP_CTRL_CAM0_IBPP GENMASK(1, 0)
+#define NEO_COLOR_TEMP_CTRL_CAM0_CSCON BIT(4)
+#define NEO_COLOR_TEMP_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_COLOR_TEMP_ROI_POS_CAM0 0x404
+#define NEO_COLOR_TEMP_ROI_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_COLOR_TEMP_ROI_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_ROI_SIZE_CAM0 0x408
+#define NEO_COLOR_TEMP_ROI_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_COLOR_TEMP_ROI_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_REDGAIN_CAM0 0x40c
+#define NEO_COLOR_TEMP_REDGAIN_CAM0_MIN GENMASK(7, 0)
+#define NEO_COLOR_TEMP_REDGAIN_CAM0_MAX GENMASK(23, 16)
+
+#define NEO_COLOR_TEMP_BLUEGAIN_CAM0 0x410
+#define NEO_COLOR_TEMP_BLUEGAIN_CAM0_MIN GENMASK(7, 0)
+#define NEO_COLOR_TEMP_BLUEGAIN_CAM0_MAX GENMASK(23, 16)
+
+#define NEO_COLOR_TEMP_POINT1_CAM0 0x414
+#define NEO_COLOR_TEMP_POINT1_CAM0_BLUE GENMASK(7, 0)
+#define NEO_COLOR_TEMP_POINT1_CAM0_RED GENMASK(23, 16)
+
+#define NEO_COLOR_TEMP_POINT2_CAM0 0x418
+#define NEO_COLOR_TEMP_POINT2_CAM0_BLUE GENMASK(7, 0)
+#define NEO_COLOR_TEMP_POINT2_CAM0_RED GENMASK(23, 16)
+
+#define NEO_COLOR_TEMP_HOFFSET_CAM0 0x41c
+#define NEO_COLOR_TEMP_HOFFSET_CAM0_RIGHT GENMASK(7, 0)
+#define NEO_COLOR_TEMP_HOFFSET_CAM0_LEFT GENMASK(23, 16)
+
+#define NEO_COLOR_TEMP_VOFFSET_CAM0 0x420
+#define NEO_COLOR_TEMP_VOFFSET_CAM0_UP GENMASK(7, 0)
+#define NEO_COLOR_TEMP_VOFFSET_CAM0_DOWN GENMASK(23, 16)
+
+#define NEO_COLOR_TEMP_POINT1_SLOPE_CAM0 0x424
+#define NEO_COLOR_TEMP_POINT1_SLOPE_CAM0_SLOPE_L GENMASK(15, 0)
+#define NEO_COLOR_TEMP_POINT1_SLOPE_CAM0_SLOPE_R GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_POINT2_SLOPE_CAM0 0x428
+#define NEO_COLOR_TEMP_POINT2_SLOPE_CAM0_SLOPE_L GENMASK(15, 0)
+#define NEO_COLOR_TEMP_POINT2_SLOPE_CAM0_SLOPE_R GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_LUMA_TH_CAM0 0x42c
+#define NEO_COLOR_TEMP_LUMA_TH_CAM0_THL GENMASK(15, 0)
+#define NEO_COLOR_TEMP_LUMA_TH_CAM0_THH GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_CSC_MAT0_CAM0 0x430
+#define NEO_COLOR_TEMP_CSC_MAT0_CAM0_R0C0 GENMASK(15, 0)
+#define NEO_COLOR_TEMP_CSC_MAT0_CAM0_R0C1 GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_CSC_MAT1_CAM0 0x434
+#define NEO_COLOR_TEMP_CSC_MAT1_CAM0_R0C2 GENMASK(15, 0)
+#define NEO_COLOR_TEMP_CSC_MAT1_CAM0_R1C0 GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_CSC_MAT2_CAM0 0x438
+#define NEO_COLOR_TEMP_CSC_MAT2_CAM0_R1C1 GENMASK(15, 0)
+#define NEO_COLOR_TEMP_CSC_MAT2_CAM0_R1C2 GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_CSC_MAT3_CAM0 0x43c
+#define NEO_COLOR_TEMP_CSC_MAT3_CAM0_R2C0 GENMASK(15, 0)
+#define NEO_COLOR_TEMP_CSC_MAT3_CAM0_R2C1 GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_CSC_MAT4_CAM0 0x440
+#define NEO_COLOR_TEMP_CSC_MAT4_CAM0_R2C2 GENMASK(15, 0)
+
+#define NEO_COLOR_TEMP_R_GR_OFFSET_CAM0 0x444
+#define NEO_COLOR_TEMP_R_GR_OFFSET_CAM0_OFFSET0 GENMASK(15, 0)
+#define NEO_COLOR_TEMP_R_GR_OFFSET_CAM0_OFFSET1 GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_GB_B_OFFSET_CAM0 0x448
+#define NEO_COLOR_TEMP_GB_B_OFFSET_CAM0_OFFSET0 GENMASK(15, 0)
+#define NEO_COLOR_TEMP_GB_B_OFFSET_CAM0_OFFSET1 GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_CNT_WHITE_CAM0 0x44c
+
+#define NEO_COLOR_TEMP_SUMRL_CAM0 0x450
+
+#define NEO_COLOR_TEMP_SUMRH_CAM0 0x454
+
+#define NEO_COLOR_TEMP_SUMGL_CAM0 0x458
+
+#define NEO_COLOR_TEMP_SUMGH_CAM0 0x45c
+
+#define NEO_COLOR_TEMP_SUMBL_CAM0 0x460
+
+#define NEO_COLOR_TEMP_SUMBH_CAM0 0x464
+
+#define NEO_COLOR_TEMP_SUMRGL_CAM0 0x468
+
+#define NEO_COLOR_TEMP_SUMRGH_CAM0 0x46c
+
+#define NEO_COLOR_TEMP_SUMBGL_CAM0 0x470
+
+#define NEO_COLOR_TEMP_SUMBGH_CAM0 0x474
+
+#define NEO_COLOR_TEMP_STAT_BLK_SIZE0 0x480
+#define NEO_COLOR_TEMP_STAT_BLK_SIZE0_XSIZE GENMASK(15, 0)
+#define NEO_COLOR_TEMP_STAT_BLK_SIZE0_YSIZE GENMASK(31, 16)
+
+#define NEO_COLOR_TEMP_STAT_CURR_BLK_Y0 0x488
+#define NEO_COLOR_TEMP_STAT_CURR_BLK_Y0_BLKLNE GENMASK(15, 0)
+#define NEO_COLOR_TEMP_STAT_CURR_BLK_Y0_BLKROW GENMASK(18, 16)
+
+#define NEO_COLOR_TEMP_CROI0_POS_CAM0 0x490
+#define NEO_COLOR_TEMP_CROI0_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI0_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI0_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI0_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI0_PIXCNT_CAM0 0x498
+#define NEO_COLOR_TEMP_CROI0_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI0_SUMRED_CAM0 0x49c
+
+#define NEO_COLOR_TEMP_CROI0_SUMGREEN_CAM0 0x4a0
+
+#define NEO_COLOR_TEMP_CROI0_SUMBLUE_CAM0 0x4a4
+
+#define NEO_COLOR_TEMP_CROI1_POS_CAM0 0x4a8
+#define NEO_COLOR_TEMP_CROI1_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI1_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI1_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI1_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI1_PIXCNT_CAM0 0x4b0
+#define NEO_COLOR_TEMP_CROI1_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI1_SUMRED_CAM0 0x4b4
+
+#define NEO_COLOR_TEMP_CROI1_SUMGREEN_CAM0 0x4b8
+
+#define NEO_COLOR_TEMP_CROI1_SUMBLUE_CAM0 0x4bc
+
+#define NEO_COLOR_TEMP_CROI2_POS_CAM0 0x4c0
+#define NEO_COLOR_TEMP_CROI2_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI2_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI2_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI2_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI2_PIXCNT_CAM0 0x4c8
+#define NEO_COLOR_TEMP_CROI2_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI2_SUMRED_CAM0 0x4cc
+
+#define NEO_COLOR_TEMP_CROI2_SUMGREEN_CAM0 0x4d0
+
+#define NEO_COLOR_TEMP_CROI2_SUMBLUE_CAM0 0x4d4
+
+#define NEO_COLOR_TEMP_CROI3_POS_CAM0 0x4d8
+#define NEO_COLOR_TEMP_CROI3_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI3_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI3_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI3_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI3_PIXCNT_CAM0 0x4e0
+#define NEO_COLOR_TEMP_CROI3_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI3_SUMRED_CAM0 0x4e4
+
+#define NEO_COLOR_TEMP_CROI3_SUMGREEN_CAM0 0x4e8
+
+#define NEO_COLOR_TEMP_CROI3_SUMBLUE_CAM0 0x4ec
+
+#define NEO_COLOR_TEMP_CROI4_POS_CAM0 0x4f0
+#define NEO_COLOR_TEMP_CROI4_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI4_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI4_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI4_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI4_PIXCNT_CAM0 0x4f8
+#define NEO_COLOR_TEMP_CROI4_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI4_SUMRED_CAM0 0x4fc
+
+#define NEO_COLOR_TEMP_CROI4_SUMGREEN_CAM0 0x500
+
+#define NEO_COLOR_TEMP_CROI4_SUMBLUE_CAM0 0x504
+
+#define NEO_COLOR_TEMP_CROI5_POS_CAM0 0x508
+#define NEO_COLOR_TEMP_CROI5_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI5_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI5_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI5_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI5_PIXCNT_CAM0 0x510
+#define NEO_COLOR_TEMP_CROI5_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI5_SUMRED_CAM0 0x514
+
+#define NEO_COLOR_TEMP_CROI5_SUMGREEN_CAM0 0x518
+
+#define NEO_COLOR_TEMP_CROI5_SUMBLUE_CAM0 0x51c
+
+#define NEO_COLOR_TEMP_CROI6_POS_CAM0 0x520
+#define NEO_COLOR_TEMP_CROI6_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI6_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI6_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI6_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI6_PIXCNT_CAM0 0x528
+#define NEO_COLOR_TEMP_CROI6_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI6_SUMRED_CAM0 0x52c
+
+#define NEO_COLOR_TEMP_CROI6_SUMGREEN_CAM0 0x530
+
+#define NEO_COLOR_TEMP_CROI6_SUMBLUE_CAM0 0x534
+
+#define NEO_COLOR_TEMP_CROI7_POS_CAM0 0x538
+#define NEO_COLOR_TEMP_CROI7_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI7_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI7_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI7_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI7_PIXCNT_CAM0 0x540
+#define NEO_COLOR_TEMP_CROI7_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI7_SUMRED_CAM0 0x544
+
+#define NEO_COLOR_TEMP_CROI7_SUMGREEN_CAM0 0x548
+
+#define NEO_COLOR_TEMP_CROI7_SUMBLUE_CAM0 0x54c
+
+#define NEO_COLOR_TEMP_CROI8_POS_CAM0 0x550
+#define NEO_COLOR_TEMP_CROI8_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI8_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI8_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI8_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI8_PIXCNT_CAM0 0x558
+#define NEO_COLOR_TEMP_CROI8_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI8_SUMRED_CAM0 0x55c
+
+#define NEO_COLOR_TEMP_CROI8_SUMGREEN_CAM0 0x560
+
+#define NEO_COLOR_TEMP_CROI8_SUMBLUE_CAM0 0x564
+
+#define NEO_COLOR_TEMP_CROI9_POS_CAM0 0x568
+#define NEO_COLOR_TEMP_CROI9_POS_CAM0_ROVERG_LOW GENMASK(7, 0)
+#define NEO_COLOR_TEMP_CROI9_POS_CAM0_ROVERG_HIGH GENMASK(15, 8)
+#define NEO_COLOR_TEMP_CROI9_POS_CAM0_BOVERG_LOW GENMASK(23, 16)
+#define NEO_COLOR_TEMP_CROI9_POS_CAM0_BOVERG_HIGH GENMASK(31, 24)
+
+#define NEO_COLOR_TEMP_CROI9_PIXCNT_CAM0 0x570
+#define NEO_COLOR_TEMP_CROI9_PIXCNT_CAM0_PIXCNT GENMASK(23, 0)
+
+#define NEO_COLOR_TEMP_CROI9_SUMRED_CAM0 0x574
+
+#define NEO_COLOR_TEMP_CROI9_SUMGREEN_CAM0 0x578
+
+#define NEO_COLOR_TEMP_CROI9_SUMBLUE_CAM0 0x57c
+
+#define NEO_COLOR_TEMP_GR_AVG_IN_CAM0 0x584
+#define NEO_COLOR_TEMP_GR_AVG_IN_CAM0_GR_AGV GENMASK(19, 0)
+
+#define NEO_COLOR_TEMP_GB_AVG_IN_CAM0 0x588
+#define NEO_COLOR_TEMP_GB_AVG_IN_CAM0_GB_AGV GENMASK(19, 0)
+
+#define NEO_COLOR_TEMP_GR_GB_CNT_CAM0 0x58c
+
+#define NEO_COLOR_TEMP_GR_SUM_CAM0 0x590
+
+#define NEO_COLOR_TEMP_GB_SUM_CAM0 0x594
+
+#define NEO_COLOR_TEMP_GR2_SUM_CAM0 0x598
+
+#define NEO_COLOR_TEMP_GB2_SUM_CAM0 0x59c
+
+#define NEO_COLOR_TEMP_GRGB_SUM_CAM0 0x5a0
+
+/* RGBIR */
+#define NEO_RGBIR_CTRL_CAM0 0x600
+#define NEO_RGBIR_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_RGBIR_CCM0_CAM0 0x604
+#define NEO_RGBIR_CCM0_CAM0_CCM GENMASK(15, 0)
+
+#define NEO_RGBIR_CCM1_CAM0 0x608
+#define NEO_RGBIR_CCM1_CAM0_CCM GENMASK(15, 0)
+
+#define NEO_RGBIR_CCM2_CAM0 0x60c
+#define NEO_RGBIR_CCM2_CAM0_CCM GENMASK(15, 0)
+
+#define NEO_RGBIR_CCM0_TH_CAM0 0x610
+#define NEO_RGBIR_CCM0_TH_CAM0_THRESHOLD GENMASK(19, 0)
+
+#define NEO_RGBIR_CCM1_TH_CAM0 0x614
+#define NEO_RGBIR_CCM1_TH_CAM0_THRESHOLD GENMASK(19, 0)
+
+#define NEO_RGBIR_CCM2_TH_CAM0 0x618
+#define NEO_RGBIR_CCM2_TH_CAM0_THRESHOLD GENMASK(19, 0)
+
+#define NEO_RGBIR_ROI0_POS_CAM0 0x620
+#define NEO_RGBIR_ROI0_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_RGBIR_ROI0_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_RGBIR_ROI0_SIZE_CAM0 0x624
+#define NEO_RGBIR_ROI0_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_RGBIR_ROI0_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_RGBIR_ROI1_POS_CAM0 0x628
+#define NEO_RGBIR_ROI1_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_RGBIR_ROI1_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_RGBIR_ROI1_SIZE_CAM0 0x62c
+#define NEO_RGBIR_ROI1_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_RGBIR_ROI1_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_RGBIR_HIST0_CTRL_CAM0 0x630
+#define NEO_RGBIR_HIST0_CTRL_CAM0_LIN_INPUT1_LOG BIT(0)
+#define NEO_RGBIR_HIST0_CTRL_CAM0_DIR_INPUT1_DIF BIT(1)
+#define NEO_RGBIR_HIST0_CTRL_CAM0_PATTERN BIT(2)
+#define NEO_RGBIR_HIST0_CTRL_CAM0_CHANNEL GENMASK(11, 8)
+#define NEO_RGBIR_HIST0_CTRL_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_RGBIR_HIST0_SCALE_CAM0 0x634
+#define NEO_RGBIR_HIST0_SCALE_CAM0_SCALE GENMASK(23, 0)
+
+#define NEO_RGBIR_HIST1_CTRL_CAM0 0x638
+#define NEO_RGBIR_HIST1_CTRL_CAM0_LIN_INPUT1_LOG BIT(0)
+#define NEO_RGBIR_HIST1_CTRL_CAM0_DIR_INPUT1_DIF BIT(1)
+#define NEO_RGBIR_HIST1_CTRL_CAM0_PATTERN BIT(2)
+#define NEO_RGBIR_HIST1_CTRL_CAM0_CHANNEL GENMASK(11, 8)
+#define NEO_RGBIR_HIST1_CTRL_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_RGBIR_HIST1_SCALE_CAM0 0x63c
+#define NEO_RGBIR_HIST1_SCALE_CAM0_SCALE GENMASK(23, 0)
+
+/* STAT */
+#define NEO_STAT_ROI0_POS_CAM0 0x700
+#define NEO_STAT_ROI0_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_STAT_ROI0_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_STAT_ROI0_SIZE_CAM0 0x704
+#define NEO_STAT_ROI0_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_STAT_ROI0_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_STAT_ROI1_POS_CAM0 0x708
+#define NEO_STAT_ROI1_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_STAT_ROI1_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_STAT_ROI1_SIZE_CAM0 0x70c
+#define NEO_STAT_ROI1_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_STAT_ROI1_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_STAT_HIST0_CTRL_CAM0 0x720
+#define NEO_STAT_HIST0_CTRL_CAM0_LIN_INPUT1_LOG BIT(0)
+#define NEO_STAT_HIST0_CTRL_CAM0_DIR_INPUT1_DIF BIT(1)
+#define NEO_STAT_HIST0_CTRL_CAM0_PATTERN BIT(2)
+#define NEO_STAT_HIST0_CTRL_CAM0_CHANNEL GENMASK(11, 8)
+#define NEO_STAT_HIST0_CTRL_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_STAT_HIST0_SCALE_CAM0 0x724
+#define NEO_STAT_HIST0_SCALE_CAM0_SCALE GENMASK(23, 0)
+
+#define NEO_STAT_HIST1_CTRL_CAM0 0x728
+#define NEO_STAT_HIST1_CTRL_CAM0_LIN_INPUT1_LOG BIT(0)
+#define NEO_STAT_HIST1_CTRL_CAM0_DIR_INPUT1_DIF BIT(1)
+#define NEO_STAT_HIST1_CTRL_CAM0_PATTERN BIT(2)
+#define NEO_STAT_HIST1_CTRL_CAM0_CHANNEL GENMASK(11, 8)
+#define NEO_STAT_HIST1_CTRL_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_STAT_HIST1_SCALE_CAM0 0x72c
+#define NEO_STAT_HIST1_SCALE_CAM0_SCALE GENMASK(23, 0)
+
+#define NEO_STAT_HIST2_CTRL_CAM0 0x730
+#define NEO_STAT_HIST2_CTRL_CAM0_LIN_INPUT1_LOG BIT(0)
+#define NEO_STAT_HIST2_CTRL_CAM0_DIR_INPUT1_DIF BIT(1)
+#define NEO_STAT_HIST2_CTRL_CAM0_PATTERN BIT(2)
+#define NEO_STAT_HIST2_CTRL_CAM0_CHANNEL GENMASK(11, 8)
+#define NEO_STAT_HIST2_CTRL_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_STAT_HIST2_SCALE_CAM0 0x734
+#define NEO_STAT_HIST2_SCALE_CAM0_SCALE GENMASK(23, 0)
+
+#define NEO_STAT_HIST3_CTRL_CAM0 0x738
+#define NEO_STAT_HIST3_CTRL_CAM0_LIN_INPUT1_LOG BIT(0)
+#define NEO_STAT_HIST3_CTRL_CAM0_DIR_INPUT1_DIF BIT(1)
+#define NEO_STAT_HIST3_CTRL_CAM0_PATTERN BIT(2)
+#define NEO_STAT_HIST3_CTRL_CAM0_CHANNEL GENMASK(11, 8)
+#define NEO_STAT_HIST3_CTRL_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_STAT_HIST3_SCALE_CAM0 0x73c
+#define NEO_STAT_HIST3_SCALE_CAM0_SCALE GENMASK(23, 0)
+
+/* IR_COMPRESS */
+#define NEO_IR_COMPRESS_CTRL_CAM0 0x780
+#define NEO_IR_COMPRESS_CTRL_CAM0_OBPP BIT(0)
+#define NEO_IR_COMPRESS_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_IR_COMPRESS_KNEE_POINT1_CAM0 0x784
+#define NEO_IR_COMPRESS_KNEE_POINT1_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_POINT2_CAM0 0x788
+#define NEO_IR_COMPRESS_KNEE_POINT2_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_POINT3_CAM0 0x78c
+#define NEO_IR_COMPRESS_KNEE_POINT3_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_POINT4_CAM0 0x790
+#define NEO_IR_COMPRESS_KNEE_POINT4_CAM0_KNEEPOINT GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0 0x794
+#define NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0_OFFSET GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0 0x798
+#define NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0_OFFSET GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0 0x79c
+#define NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0_OFFSET GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0 0x7a0
+#define NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0_OFFSET GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0 0x7a4
+#define NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0_OFFSET GENMASK(19, 0)
+
+#define NEO_IR_COMPRESS_KNEE_RATIO01_CAM0 0x7a8
+#define NEO_IR_COMPRESS_KNEE_RATIO01_CAM0_RATIO0 GENMASK(15, 0)
+#define NEO_IR_COMPRESS_KNEE_RATIO01_CAM0_RATIO1 GENMASK(31, 16)
+
+#define NEO_IR_COMPRESS_KNEE_RATIO23_CAM0 0x7ac
+#define NEO_IR_COMPRESS_KNEE_RATIO23_CAM0_RATIO2 GENMASK(15, 0)
+#define NEO_IR_COMPRESS_KNEE_RATIO23_CAM0_RATIO3 GENMASK(31, 16)
+
+#define NEO_IR_COMPRESS_KNEE_RATIO4_CAM0 0x7b0
+#define NEO_IR_COMPRESS_KNEE_RATIO4_CAM0_RATIO4 GENMASK(15, 0)
+
+#define NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0 0x7b4
+#define NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0 0x7b8
+#define NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0 0x7bc
+#define NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0 0x7c0
+#define NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0_KNEEPOINT GENMASK(15, 0)
+
+#define NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0 0x7c4
+#define NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0_KNEEPOINT GENMASK(15, 0)
+
+/* BNR */
+#define NEO_BNR_CTRL_CAM0 0x800
+#define NEO_BNR_CTRL_CAM0_OBPP GENMASK(3, 2)
+#define NEO_BNR_CTRL_CAM0_DEBUG GENMASK(10, 8)
+#define NEO_BNR_CTRL_CAM0_NHOOD BIT(16)
+#define NEO_BNR_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_BNR_YPEAK_CAM0 0x804
+#define NEO_BNR_YPEAK_CAM0_PEAK_LOW GENMASK(11, 0)
+#define NEO_BNR_YPEAK_CAM0_PEAK_SEL GENMASK(15, 14)
+#define NEO_BNR_YPEAK_CAM0_PEAK_HIGH GENMASK(27, 16)
+#define NEO_BNR_YPEAK_CAM0_PEAK_OUTSEL BIT(31)
+
+#define NEO_BNR_YEDGE_TH0_CAM0 0x808
+#define NEO_BNR_YEDGE_TH0_CAM0_EDGE_TH0 GENMASK(19, 0)
+
+#define NEO_BNR_YEDGE_SCALE_CAM0 0x80c
+#define NEO_BNR_YEDGE_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_YEDGE_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_YEDGES_TH0_CAM0 0x810
+#define NEO_BNR_YEDGES_TH0_CAM0_EDGE_TH0 GENMASK(19, 0)
+
+#define NEO_BNR_YEDGES_SCALE_CAM0 0x814
+#define NEO_BNR_YEDGES_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_YEDGES_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_YEDGEA_TH0_CAM0 0x818
+#define NEO_BNR_YEDGEA_TH0_CAM0_EDGE_TH0 GENMASK(19, 0)
+
+#define NEO_BNR_YEDGEA_SCALE_CAM0 0x81c
+#define NEO_BNR_YEDGEA_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_YEDGEA_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_YLUMA_X_TH0_CAM0 0x820
+#define NEO_BNR_YLUMA_X_TH0_CAM0_TH GENMASK(19, 0)
+
+#define NEO_BNR_YLUMA_Y_TH_CAM0 0x824
+#define NEO_BNR_YLUMA_Y_TH_CAM0_LUMA_Y_TH0 GENMASK(9, 0)
+#define NEO_BNR_YLUMA_Y_TH_CAM0_LUMA_Y_TH1 GENMASK(25, 16)
+
+#define NEO_BNR_YLUMA_SCALE_CAM0 0x828
+#define NEO_BNR_YLUMA_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_YLUMA_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_YALPHA_GAIN_CAM0 0x82c
+#define NEO_BNR_YALPHA_GAIN_CAM0_GAIN GENMASK(15, 0)
+#define NEO_BNR_YALPHA_GAIN_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_BNR_CPEAK_CAM0 0x830
+#define NEO_BNR_CPEAK_CAM0_PEAK_LOW GENMASK(11, 0)
+#define NEO_BNR_CPEAK_CAM0_PEAK_SEL GENMASK(15, 14)
+#define NEO_BNR_CPEAK_CAM0_PEAK_HIGH GENMASK(27, 16)
+#define NEO_BNR_CPEAK_CAM0_PEAK_OUTSEL BIT(31)
+
+#define NEO_BNR_CEDGE_TH0_CAM0 0x834
+#define NEO_BNR_CEDGE_TH0_CAM0_EDGE_TH0 GENMASK(19, 0)
+
+#define NEO_BNR_CEDGE_SCALE_CAM0 0x838
+#define NEO_BNR_CEDGE_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_CEDGE_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_CEDGES_TH0_CAM0 0x83c
+#define NEO_BNR_CEDGES_TH0_CAM0_EDGE_TH0 GENMASK(19, 0)
+
+#define NEO_BNR_CEDGES_SCALE_CAM0 0x840
+#define NEO_BNR_CEDGES_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_CEDGES_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_CEDGEA_TH0_CAM0 0x844
+#define NEO_BNR_CEDGEA_TH0_CAM0_EDGE_TH0 GENMASK(19, 0)
+
+#define NEO_BNR_CEDGEA_SCALE_CAM0 0x848
+#define NEO_BNR_CEDGEA_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_CEDGEA_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_CLUMA_X_TH0_CAM0 0x84c
+#define NEO_BNR_CLUMA_X_TH0_CAM0_TH GENMASK(19, 0)
+
+#define NEO_BNR_CLUMA_Y_TH_CAM0 0x850
+#define NEO_BNR_CLUMA_Y_TH_CAM0_LUMA_Y_TH0 GENMASK(9, 0)
+#define NEO_BNR_CLUMA_Y_TH_CAM0_LUMA_Y_TH1 GENMASK(25, 16)
+
+#define NEO_BNR_CLUMA_SCALE_CAM0 0x854
+#define NEO_BNR_CLUMA_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_BNR_CLUMA_SCALE_CAM0_SHIFT GENMASK(20, 16)
+
+#define NEO_BNR_CALPHA_GAIN_CAM0 0x858
+#define NEO_BNR_CALPHA_GAIN_CAM0_GAIN GENMASK(15, 0)
+#define NEO_BNR_CALPHA_GAIN_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_BNR_EDGE_STAT_CAM0 0x85c
+#define NEO_BNR_EDGE_STAT_CAM0_EDGE_PIXELS GENMASK(23, 0)
+
+#define NEO_BNR_EDGES_STAT_CAM0 0x860
+#define NEO_BNR_EDGES_STAT_CAM0_EDGE_PIXELS GENMASK(23, 0)
+
+#define NEO_BNR_STRETCH_CAM0 0x864
+#define NEO_BNR_STRETCH_CAM0_GAIN GENMASK(15, 0)
+
+/* VIGNETTING */
+#define NEO_VIGNETTING_CTRL_CAM0 0x900
+#define NEO_VIGNETTING_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_VIGNETTING_BLK_CONF_CAM0 0x904
+#define NEO_VIGNETTING_BLK_CONF_CAM0_COLS GENMASK(7, 0)
+#define NEO_VIGNETTING_BLK_CONF_CAM0_ROWS GENMASK(23, 16)
+
+#define NEO_VIGNETTING_BLK_SIZE_CAM0 0x908
+#define NEO_VIGNETTING_BLK_SIZE_CAM0_XSIZE GENMASK(15, 0)
+#define NEO_VIGNETTING_BLK_SIZE_CAM0_YSIZE GENMASK(31, 16)
+
+#define NEO_VIGNETTING_BLK_STEPY_CAM0 0x90c
+#define NEO_VIGNETTING_BLK_STEPY_CAM0_STEP GENMASK(15, 0)
+
+#define NEO_VIGNETTING_BLK_STEPX_CAM0 0x910
+#define NEO_VIGNETTING_BLK_STEPX_CAM0_STEP GENMASK(15, 0)
+
+#define NEO_VIGNETTING_BLK_C_LINE_CAM0 0x920
+#define NEO_VIGNETTING_BLK_C_LINE_CAM0_LINE GENMASK(15, 0)
+
+#define NEO_VIGNETTING_BLK_C_ROW_CAM0 0x924
+#define NEO_VIGNETTING_BLK_C_ROW_CAM0_BLKROW GENMASK(7, 0)
+
+#define NEO_VIGNETTING_BLK_C_FRACY_CAM0 0x928
+
+/* IDBG1 */
+#define NEO_IDBG1_LINE_NUM 0xfc0
+#define NEO_IDBG1_LINE_NUM_LINE_NUM GENMASK(16, 0)
+
+#define NEO_IDBG1_CURR_LINE_NUM 0xfc4
+#define NEO_IDBG1_CURR_LINE_NUM_CURR_LINE_NUM GENMASK(16, 0)
+#define NEO_IDBG1_CURR_LINE_NUM_DBG_HIT BIT(31)
+
+#define NEO_IDBG1_IMA 0xfc8
+#define NEO_IDBG1_IMA_ADDR GENMASK(11, 0)
+#define NEO_IDBG1_IMA_NAME GENMASK(20, 16)
+#define NEO_IDBG1_IMA_RDWF GENMASK(29, 28)
+#define NEO_IDBG1_IMA_WDWF GENMASK(31, 30)
+
+#define NEO_IDBG1_IMD 0xfcc
+
+#define NEO_IDBG1_DONE_STAT 0xfd0
+#define NEO_IDBG1_DONE_STAT_VIG BIT(0)
+#define NEO_IDBG1_DONE_STAT_IRCOMP BIT(1)
+#define NEO_IDBG1_DONE_STAT_HDRMERGE BIT(2)
+#define NEO_IDBG1_DONE_STAT_BNR0 BIT(3)
+#define NEO_IDBG1_DONE_STAT_STAT BIT(4)
+#define NEO_IDBG1_DONE_STAT_CTEMP BIT(5)
+#define NEO_IDBG1_DONE_STAT_OB_WB2 BIT(6)
+#define NEO_IDBG1_DONE_STAT_OBWB1 BIT(7)
+#define NEO_IDBG1_DONE_STAT_OBWB0 BIT(8)
+#define NEO_IDBG1_DONE_STAT_HDRDECOMP1 BIT(9)
+#define NEO_IDBG1_DONE_STAT_HDRDECOMP0 BIT(10)
+#define NEO_IDBG1_DONE_STAT_HC BIT(11)
+#define NEO_IDBG1_DONE_STAT_RGBIR BIT(12)
+
+/* DEMOSAIC */
+#define NEO_DEMOSAIC_CTRL_CAM0 0x1180
+#define NEO_DEMOSAIC_CTRL_CAM0_FMT GENMASK(5, 4)
+
+#define NEO_DEMOSAIC_ACTIVITY_CTL_CAM0 0x1184
+#define NEO_DEMOSAIC_ACTIVITY_CTL_CAM0_ALPHA GENMASK(8, 0)
+#define NEO_DEMOSAIC_ACTIVITY_CTL_CAM0_ACT_RATIO GENMASK(31, 16)
+
+#define NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0 0x1188
+#define NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0_STRENGTHG GENMASK(15, 0)
+#define NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0_STRENGTHC GENMASK(31, 16)
+
+#define NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0 0x118c
+#define NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0_MAX_IMPACT GENMASK(15, 0)
+
+/* RGB_TO_YUV */
+#define NEO_RGB_TO_YUV_GAIN_CTRL_CAM0 0x11c0
+#define NEO_RGB_TO_YUV_GAIN_CTRL_CAM0_RGAIN GENMASK(15, 0)
+#define NEO_RGB_TO_YUV_GAIN_CTRL_CAM0_BGAIN GENMASK(31, 16)
+
+#define NEO_RGB_TO_YUV_MAT0_CAM0 0x11c4
+#define NEO_RGB_TO_YUV_MAT0_CAM0_R0C0 GENMASK(15, 0)
+#define NEO_RGB_TO_YUV_MAT0_CAM0_R0C1 GENMASK(31, 16)
+
+#define NEO_RGB_TO_YUV_MAT1_CAM0 0x11c8
+#define NEO_RGB_TO_YUV_MAT1_CAM0_R0C2 GENMASK(15, 0)
+
+#define NEO_RGB_TO_YUV_MAT2_CAM0 0x11cc
+#define NEO_RGB_TO_YUV_MAT2_CAM0_R1C0 GENMASK(15, 0)
+#define NEO_RGB_TO_YUV_MAT2_CAM0_R1C1 GENMASK(31, 16)
+
+#define NEO_RGB_TO_YUV_MAT3_CAM0 0x11d0
+#define NEO_RGB_TO_YUV_MAT3_CAM0_R1C2 GENMASK(15, 0)
+
+#define NEO_RGB_TO_YUV_MAT4_CAM0 0x11d4
+#define NEO_RGB_TO_YUV_MAT4_CAM0_R2C0 GENMASK(15, 0)
+#define NEO_RGB_TO_YUV_MAT4_CAM0_R2C1 GENMASK(31, 16)
+
+#define NEO_RGB_TO_YUV_MAT5_CAM0 0x11d8
+#define NEO_RGB_TO_YUV_MAT5_CAM0_R2C2 GENMASK(15, 0)
+
+#define NEO_RGB_TO_YUV_OFFSET0_CAM0 0x11e0
+#define NEO_RGB_TO_YUV_OFFSET0_CAM0_OFFSET GENMASK(20, 0)
+
+#define NEO_RGB_TO_YUV_OFFSET1_CAM0 0x11e4
+#define NEO_RGB_TO_YUV_OFFSET1_CAM0_OFFSET GENMASK(20, 0)
+
+#define NEO_RGB_TO_YUV_OFFSET2_CAM0 0x11e8
+#define NEO_RGB_TO_YUV_OFFSET2_CAM0_OFFSET GENMASK(20, 0)
+
+/* DRC */
+#define NEO_DRC_ROI0_POS_CAM0 0x1300
+#define NEO_DRC_ROI0_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_DRC_ROI0_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_DRC_ROI0_SIZE_CAM0 0x1304
+#define NEO_DRC_ROI0_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_DRC_ROI0_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_DRC_ROI1_POS_CAM0 0x1308
+#define NEO_DRC_ROI1_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_DRC_ROI1_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_DRC_ROI1_SIZE_CAM0 0x130c
+#define NEO_DRC_ROI1_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_DRC_ROI1_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_DRC_GROI_SUM_SHIFT_CAM0 0x1310
+#define NEO_DRC_GROI_SUM_SHIFT_CAM0_SHIFT0 GENMASK(4, 0)
+#define NEO_DRC_GROI_SUM_SHIFT_CAM0_SHIFT1 GENMASK(20, 16)
+
+#define NEO_DRC_GBL_GAIN_CAM0 0x1314
+#define NEO_DRC_GBL_GAIN_CAM0_GAIN GENMASK(15, 0)
+
+#define NEO_DRC_LCL_BLK_SIZE_CAM0 0x1320
+#define NEO_DRC_LCL_BLK_SIZE_CAM0_XSIZE GENMASK(15, 0)
+#define NEO_DRC_LCL_BLK_SIZE_CAM0_YSIZE GENMASK(31, 16)
+
+#define NEO_DRC_LCL_STRETCH_CAM0 0x1324
+#define NEO_DRC_LCL_STRETCH_CAM0_STRETCH GENMASK(15, 0)
+#define NEO_DRC_LCL_STRETCH_CAM0_OFFSET GENMASK(31, 16)
+
+#define NEO_DRC_LCL_BLK_STEPY_CAM0 0x1328
+#define NEO_DRC_LCL_BLK_STEPY_CAM0_STEP GENMASK(15, 0)
+
+#define NEO_DRC_LCL_BLK_STEPX_CAM0 0x132c
+#define NEO_DRC_LCL_BLK_STEPX_CAM0_STEP GENMASK(15, 0)
+
+#define NEO_DRC_LCL_SUM_SHIFT_CAM0 0x1330
+#define NEO_DRC_LCL_SUM_SHIFT_CAM0_SHIFT GENMASK(4, 0)
+
+#define NEO_DRC_ALPHA_CAM0 0x1334
+#define NEO_DRC_ALPHA_CAM0_ALPHA GENMASK(8, 0)
+
+#define NEO_DRC_GROI0_SUM_CAM0 0x1340
+
+#define NEO_DRC_GROI1_SUM_CAM0 0x1344
+
+#define NEO_DRC_STAT_BLK_Y_CAM0 0x1350
+#define NEO_DRC_STAT_BLK_Y_CAM0_BLKLNE GENMASK(15, 0)
+#define NEO_DRC_STAT_BLK_Y_CAM0_BLKROW GENMASK(23, 16)
+
+#define NEO_DRC_CURR_YFRACT_CAM0 0x1354
+
+/* NR */
+#define NEO_NR_CTRL_CAM0 0x1400
+#define NEO_NR_CTRL_CAM0_DEBUG GENMASK(9, 8)
+#define NEO_NR_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_NR_BLEND_SCALE_CAM0 0x1404
+#define NEO_NR_BLEND_SCALE_CAM0_SCALE GENMASK(15, 0)
+#define NEO_NR_BLEND_SCALE_CAM0_SHIFT GENMASK(23, 16)
+#define NEO_NR_BLEND_SCALE_CAM0_GAIN GENMASK(31, 24)
+
+#define NEO_NR_BLEND_TH0_CAM0 0x1408
+#define NEO_NR_BLEND_TH0_CAM0_TH GENMASK(19, 0)
+
+#define NEO_NR_EDGECNT_CAM0 0x1410
+#define NEO_NR_EDGECNT_CAM0_EDGE_PIXELS GENMASK(23, 0)
+
+/* DF */
+#define NEO_DF_CTRL_CAM0 0x1440
+#define NEO_DF_CTRL_CAM0_DEBUG GENMASK(10, 8)
+#define NEO_DF_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_DF_TH_SCALE_CAM0 0x1444
+#define NEO_DF_TH_SCALE_CAM0_SCALE GENMASK(19, 0)
+
+#define NEO_DF_BLEND_SHIFT_CAM0 0x1448
+#define NEO_DF_BLEND_SHIFT_CAM0_SHIFT GENMASK(5, 0)
+
+#define NEO_DF_BLEND_TH0_CAM0 0x144c
+#define NEO_DF_BLEND_TH0_CAM0_TH GENMASK(19, 0)
+
+#define NEO_DF_EDGECNT_CAM0 0x1450
+#define NEO_DF_EDGECNT_CAM0_EDGE_PIXELS GENMASK(23, 0)
+
+/* EE */
+#define NEO_EE_CTRL_CAM0 0x1480
+#define NEO_EE_CTRL_CAM0_DEBUG GENMASK(9, 8)
+#define NEO_EE_CTRL_CAM0_ENABLE BIT(31)
+
+#define NEO_EE_CORING_CAM0 0x1484
+#define NEO_EE_CORING_CAM0_CORING GENMASK(19, 0)
+
+#define NEO_EE_CLIP_CAM0 0x1488
+#define NEO_EE_CLIP_CAM0_CLIP GENMASK(19, 0)
+
+#define NEO_EE_MASKGAIN_CAM0 0x148c
+#define NEO_EE_MASKGAIN_CAM0_GAIN GENMASK(7, 0)
+
+#define NEO_EE_EDGECNT_CAM0 0x1490
+#define NEO_EE_EDGECNT_CAM0_EDGE_PIXELS GENMASK(23, 0)
+
+/* CCONVMED */
+#define NEO_CCONVMED_CTRL_CAM0 0x14c0
+#define NEO_CCONVMED_CTRL_CAM0_FLT GENMASK(5, 4)
+
+/* CAS */
+#define NEO_CAS_GAIN_CAM0 0x1504
+#define NEO_CAS_GAIN_CAM0_SCALE GENMASK(15, 0)
+#define NEO_CAS_GAIN_CAM0_SHIFT GENMASK(23, 16)
+
+#define NEO_CAS_CORR_CAM0 0x1508
+#define NEO_CAS_CORR_CAM0_CORR GENMASK(15, 0)
+
+#define NEO_CAS_OFFSET_CAM0 0x150c
+#define NEO_CAS_OFFSET_CAM0_OFFSET GENMASK(15, 0)
+
+/* PACKETIZER */
+#define NEO_PACKETIZER_CH0_CTRL_CAM0 0x1580
+#define NEO_PACKETIZER_CH0_CTRL_CAM0_OBPP GENMASK(3, 0)
+#define NEO_PACKETIZER_CH0_CTRL_CAM0_RSA GENMASK(10, 8)
+#define NEO_PACKETIZER_CH0_CTRL_CAM0_LSA GENMASK(14, 12)
+
+#define NEO_PACKETIZER_CH12_CTRL_CAM0 0x1584
+#define NEO_PACKETIZER_CH12_CTRL_CAM0_OBPP GENMASK(3, 0)
+#define NEO_PACKETIZER_CH12_CTRL_CAM0_RSA GENMASK(10, 8)
+#define NEO_PACKETIZER_CH12_CTRL_CAM0_LSA GENMASK(14, 12)
+#define NEO_PACKETIZER_CH12_CTRL_CAM0_SUBSAMPLE GENMASK(17, 16)
+
+#define NEO_PACKETIZER_PACK_CTRL_CAM0 0x1588
+#define NEO_PACKETIZER_PACK_CTRL_CAM0_TYPE BIT(0)
+#define NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER0 GENMASK(9, 8)
+#define NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER1 GENMASK(11, 10)
+#define NEO_PACKETIZER_PACK_CTRL_CAM0_ORDER2 GENMASK(13, 12)
+#define NEO_PACKETIZER_PACK_CTRL_CAM0_A0S GENMASK(19, 16)
+
+/* GCM */
+#define NEO_GCM_IMAT0_CAM0 0x1600
+#define NEO_GCM_IMAT0_CAM0_R0C0 GENMASK(15, 0)
+#define NEO_GCM_IMAT0_CAM0_R0C1 GENMASK(31, 16)
+
+#define NEO_GCM_IMAT1_CAM0 0x1604
+#define NEO_GCM_IMAT1_CAM0_R0C2 GENMASK(15, 0)
+
+#define NEO_GCM_IMAT2_CAM0 0x160c
+#define NEO_GCM_IMAT2_CAM0_R1C0 GENMASK(15, 0)
+#define NEO_GCM_IMAT2_CAM0_R1C1 GENMASK(31, 16)
+
+#define NEO_GCM_IMAT3_CAM0 0x1610
+#define NEO_GCM_IMAT3_CAM0_R1C2 GENMASK(15, 0)
+
+#define NEO_GCM_IMAT4_CAM0 0x1618
+#define NEO_GCM_IMAT4_CAM0_R2C0 GENMASK(15, 0)
+#define NEO_GCM_IMAT4_CAM0_R2C1 GENMASK(31, 16)
+
+#define NEO_GCM_IMAT5_CAM0 0x161c
+#define NEO_GCM_IMAT5_CAM0_R2C2 GENMASK(15, 0)
+
+#define NEO_GCM_IOFFSET0_CAM0 0x1620
+#define NEO_GCM_IOFFSET0_CAM0_OFFSET0 GENMASK(15, 0)
+
+#define NEO_GCM_IOFFSET1_CAM0 0x1624
+#define NEO_GCM_IOFFSET1_CAM0_OFFSET1 GENMASK(15, 0)
+
+#define NEO_GCM_IOFFSET2_CAM0 0x1628
+#define NEO_GCM_IOFFSET2_CAM0_OFFSET2 GENMASK(15, 0)
+
+#define NEO_GCM_OMAT0_CAM0 0x1630
+#define NEO_GCM_OMAT0_CAM0_R0C0 GENMASK(15, 0)
+#define NEO_GCM_OMAT0_CAM0_R0C1 GENMASK(31, 16)
+
+#define NEO_GCM_OMAT1_CAM0 0x1634
+#define NEO_GCM_OMAT1_CAM0_R0C2 GENMASK(15, 0)
+
+#define NEO_GCM_OMAT2_CAM0 0x1638
+#define NEO_GCM_OMAT2_CAM0_R1C0 GENMASK(15, 0)
+#define NEO_GCM_OMAT2_CAM0_R1C1 GENMASK(31, 16)
+
+#define NEO_GCM_OMAT3_CAM0 0x163c
+#define NEO_GCM_OMAT3_CAM0_R1C2 GENMASK(15, 0)
+
+#define NEO_GCM_OMAT4_CAM0 0x1640
+#define NEO_GCM_OMAT4_CAM0_R2C0 GENMASK(15, 0)
+#define NEO_GCM_OMAT4_CAM0_R2C1 GENMASK(31, 16)
+
+#define NEO_GCM_OMAT5_CAM0 0x1644
+#define NEO_GCM_OMAT5_CAM0_R2C2 GENMASK(15, 0)
+
+#define NEO_GCM_OOFFSET0_CAM0 0x1648
+#define NEO_GCM_OOFFSET0_CAM0_OFFSET0 GENMASK(12, 0)
+
+#define NEO_GCM_OOFFSET1_CAM0 0x164c
+#define NEO_GCM_OOFFSET1_CAM0_OFFSET1 GENMASK(12, 0)
+
+#define NEO_GCM_OOFFSET2_CAM0 0x1650
+#define NEO_GCM_OOFFSET2_CAM0_OFFSET2 GENMASK(12, 0)
+
+#define NEO_GCM_GAMMA0_CAM0 0x1660
+#define NEO_GCM_GAMMA0_CAM0_GAMMA0 GENMASK(8, 0)
+#define NEO_GCM_GAMMA0_CAM0_OFFSET0 GENMASK(27, 16)
+
+#define NEO_GCM_GAMMA1_CAM0 0x1664
+#define NEO_GCM_GAMMA1_CAM0_GAMMA1 GENMASK(8, 0)
+#define NEO_GCM_GAMMA1_CAM0_OFFSET1 GENMASK(27, 16)
+
+#define NEO_GCM_GAMMA2_CAM0 0x1668
+#define NEO_GCM_GAMMA2_CAM0_GAMMA2 GENMASK(8, 0)
+#define NEO_GCM_GAMMA2_CAM0_OFFSET2 GENMASK(27, 16)
+
+#define NEO_GCM_BLKLVL0_CTRL_CAM0 0x166c
+#define NEO_GCM_BLKLVL0_CTRL_CAM0_OFFSET0 GENMASK(15, 0)
+#define NEO_GCM_BLKLVL0_CTRL_CAM0_GAIN0 GENMASK(31, 16)
+
+#define NEO_GCM_BLKLVL1_CTRL_CAM0 0x1670
+#define NEO_GCM_BLKLVL1_CTRL_CAM0_OFFSET1 GENMASK(15, 0)
+#define NEO_GCM_BLKLVL1_CTRL_CAM0_GAIN1 GENMASK(31, 16)
+
+#define NEO_GCM_BLKLVL2_CTRL_CAM0 0x1674
+#define NEO_GCM_BLKLVL2_CTRL_CAM0_OFFSET2 GENMASK(15, 0)
+#define NEO_GCM_BLKLVL2_CTRL_CAM0_GAIN2 GENMASK(31, 16)
+
+#define NEO_GCM_LOWTH_CTRL01_CAM0 0x1678
+#define NEO_GCM_LOWTH_CTRL01_CAM0_THRESHOLD0 GENMASK(15, 0)
+#define NEO_GCM_LOWTH_CTRL01_CAM0_THRESHOLD1 GENMASK(31, 16)
+
+#define NEO_GCM_LOWTH_CTRL2_CAM0 0x167c
+#define NEO_GCM_LOWTH_CTRL2_CAM0_THRESHOLD2 GENMASK(15, 0)
+
+#define NEO_GCM_MAT_CONFG_CAM0 0x1680
+#define NEO_GCM_MAT_CONFG_CAM0_SIGN_CONFG BIT(0)
+
+/* AUTOFOCUS */
+#define NEO_AUTOFOCUS_ROI0_POS_CAM0 0x1700
+#define NEO_AUTOFOCUS_ROI0_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI0_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI0_SIZE_CAM0 0x1704
+#define NEO_AUTOFOCUS_ROI0_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI0_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI1_POS_CAM0 0x1708
+#define NEO_AUTOFOCUS_ROI1_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI1_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI1_SIZE_CAM0 0x170c
+#define NEO_AUTOFOCUS_ROI1_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI1_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI2_POS_CAM0 0x1710
+#define NEO_AUTOFOCUS_ROI2_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI2_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI2_SIZE_CAM0 0x1714
+#define NEO_AUTOFOCUS_ROI2_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI2_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI3_POS_CAM0 0x1718
+#define NEO_AUTOFOCUS_ROI3_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI3_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI3_SIZE_CAM0 0x171c
+#define NEO_AUTOFOCUS_ROI3_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI3_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI4_POS_CAM0 0x1720
+#define NEO_AUTOFOCUS_ROI4_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI4_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI4_SIZE_CAM0 0x1724
+#define NEO_AUTOFOCUS_ROI4_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI4_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI5_POS_CAM0 0x1728
+#define NEO_AUTOFOCUS_ROI5_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI5_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI5_SIZE_CAM0 0x172c
+#define NEO_AUTOFOCUS_ROI5_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI5_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI6_POS_CAM0 0x1730
+#define NEO_AUTOFOCUS_ROI6_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI6_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI6_SIZE_CAM0 0x1734
+#define NEO_AUTOFOCUS_ROI6_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI6_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI7_POS_CAM0 0x1738
+#define NEO_AUTOFOCUS_ROI7_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI7_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI7_SIZE_CAM0 0x173c
+#define NEO_AUTOFOCUS_ROI7_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI7_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI8_POS_CAM0 0x1740
+#define NEO_AUTOFOCUS_ROI8_POS_CAM0_XPOS GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI8_POS_CAM0_YPOS GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_ROI8_SIZE_CAM0 0x1744
+#define NEO_AUTOFOCUS_ROI8_SIZE_CAM0_WIDTH GENMASK(15, 0)
+#define NEO_AUTOFOCUS_ROI8_SIZE_CAM0_HEIGHT GENMASK(31, 16)
+
+#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0 0x1750
+#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF0 GENMASK(7, 0)
+#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF1 GENMASK(15, 8)
+#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)
+#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF3 GENMASK(31, 24)
+
+#define NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0 0x1754
+#define NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF4 GENMASK(7, 0)
+#define NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF5 GENMASK(15, 8)
+#define NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF6 GENMASK(23, 16)
+#define NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0_COEFF7 GENMASK(31, 24)
+
+#define NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0 0x1758
+#define NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0_COEFF8 GENMASK(7, 0)
+
+#define NEO_AUTOFOCUS_FIL0_SHIFT_CAM0 0x175c
+#define NEO_AUTOFOCUS_FIL0_SHIFT_CAM0_SHIFT GENMASK(4, 0)
+
+#define NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0 0x1760
+#define NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF0 GENMASK(7, 0)
+#define NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF1 GENMASK(15, 8)
+#define NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)
+#define NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0_COEFF3 GENMASK(31, 24)
+
+#define NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0 0x1764
+#define NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF4 GENMASK(7, 0)
+#define NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF5 GENMASK(15, 8)
+#define NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF6 GENMASK(23, 16)
+#define NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0_COEFF7 GENMASK(31, 24)
+
+#define NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0 0x1768
+#define NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0_COEFF8 GENMASK(7, 0)
+
+#define NEO_AUTOFOCUS_FIL1_SHIFT_CAM0 0x176c
+#define NEO_AUTOFOCUS_FIL1_SHIFT_CAM0_SHIFT GENMASK(4, 0)
+
+#define NEO_AUTOFOCUS_ROI0_SUM0_CAM0 0x1770
+
+#define NEO_AUTOFOCUS_ROI0_SUM1_CAM0 0x1774
+
+#define NEO_AUTOFOCUS_ROI1_SUM0_CAM0 0x1778
+
+#define NEO_AUTOFOCUS_ROI1_SUM1_CAM0 0x177c
+
+#define NEO_AUTOFOCUS_ROI2_SUM0_CAM0 0x1780
+
+#define NEO_AUTOFOCUS_ROI2_SUM1_CAM0 0x1784
+
+#define NEO_AUTOFOCUS_ROI3_SUM0_CAM0 0x1788
+
+#define NEO_AUTOFOCUS_ROI3_SUM1_CAM0 0x178c
+
+#define NEO_AUTOFOCUS_ROI4_SUM0_CAM0 0x1790
+
+#define NEO_AUTOFOCUS_ROI4_SUM1_CAM0 0x1794
+
+#define NEO_AUTOFOCUS_ROI5_SUM0_CAM0 0x1798
+
+#define NEO_AUTOFOCUS_ROI5_SUM1_CAM0 0x179c
+
+#define NEO_AUTOFOCUS_ROI6_SUM0_CAM0 0x17a0
+
+#define NEO_AUTOFOCUS_ROI6_SUM1_CAM0 0x17a4
+
+#define NEO_AUTOFOCUS_ROI7_SUM0_CAM0 0x17a8
+
+#define NEO_AUTOFOCUS_ROI7_SUM1_CAM0 0x17ac
+
+#define NEO_AUTOFOCUS_ROI8_SUM0_CAM0 0x17b0
+
+#define NEO_AUTOFOCUS_ROI8_SUM1_CAM0 0x17b4
+
+/* IDBG2 */
+#define NEO_IDBG2_LINE_NUM 0x1fc0
+#define NEO_IDBG2_LINE_NUM_LINE_NUM GENMASK(16, 0)
+
+#define NEO_IDBG2_CURR_LINE_NUM 0x1fc4
+#define NEO_IDBG2_CURR_LINE_NUM_CURR_LINE_NUM GENMASK(16, 0)
+#define NEO_IDBG2_CURR_LINE_NUM_DBG_HIT BIT(31)
+
+#define NEO_IDBG2_IMA 0x1fc8
+#define NEO_IDBG2_IMA_ADDR GENMASK(11, 0)
+#define NEO_IDBG2_IMA_NAME GENMASK(21, 16)
+#define NEO_IDBG2_IMA_RDWF GENMASK(29, 28)
+#define NEO_IDBG2_IMA_WDWF GENMASK(31, 30)
+
+#define NEO_IDBG2_IMD 0x1fcc
+
+#define NEO_IDBG2_DONE_STAT 0x1fd0
+#define NEO_IDBG2_DONE_STAT_AF BIT(0)
+#define NEO_IDBG2_DONE_STAT_GCM BIT(1)
+#define NEO_IDBG2_DONE_STAT_CAS BIT(2)
+#define NEO_IDBG2_DONE_STAT_CCONVMED BIT(3)
+#define NEO_IDBG2_DONE_STAT_EE BIT(4)
+#define NEO_IDBG2_DONE_STAT_DF BIT(5)
+#define NEO_IDBG2_DONE_STAT_DMAP BIT(6)
+#define NEO_IDBG2_DONE_STAT_NR BIT(7)
+#define NEO_IDBG2_DONE_STAT_DEMOSAIC BIT(8)
+#define NEO_IDBG2_DONE_STAT_CSC BIT(9)
+#define NEO_IDBG2_DONE_STAT_DRC BIT(10)
+#define NEO_IDBG2_DONE_STAT_PKT BIT(11)
+/* ALIAS */
+#define NEOISP_ALIAS_BASE (0x2000)
+#define NEOISP_ALIAS_SIZE (0x150)
+
+#define NEO_ALIAS_ALIAS_REG0  (0x2000)
+#define NEO_ALIAS_ALIAS_REG59 (0x20ec)
+#define NEO_ALIAS_ALIAS_REG61 (0x20f4)
+#define NEO_ALIAS_ALIAS_REG79 (0x213c)
+#define NEO_ALIAS_ALIAS_REG81 (0x2144)
+#define NEO_ALIAS_ALIAS_REG82 (0x2148)
+#define NEO_ALIAS_ALIAS_REG83 (0x214c)
+
+#endif /* __NXP_NEOISP_REGS_H */
-- 
2.53.0


