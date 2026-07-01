Return-Path: <linux-media+bounces-66261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ULbqK2BIRWoj+AoAu9opvQ
	(envelope-from <linux-media+bounces-66261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:03:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA16F01FA
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:03:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Uk2+x6Za;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66261-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66261-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 060BA309CCB2
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74833382398;
	Wed,  1 Jul 2026 17:02:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9B3349CD2
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 17:02:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925326; cv=fail; b=E90iW7K3prVKx1k2Z1xA/L0X1NXD6FWDF/WOfC4G2HbnyJkOiUrPXsWmtGHXxllPJkPAx89C1QZYLf173eVbVX2e40L/AO/GLPesCofbEkF/wonK/STk8GoXreAy1hSAXofjINRLU7rHEbwhxfo/CrrN71RFNoNVkxrglBc0YiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925326; c=relaxed/simple;
	bh=nnZcQLD8zTbgZdfSLJonUL8LwAMiDzjtgZ71JsRzyG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lks2K+exzAAttIyzTMC2HcnoA/TXJ2X+ukedpRQiqfq8NgmoVDpvu7Z4ODgpDmHgae6QJilV5kVJS5xwIJW0HWC5kbCpT+9JKZcDtHcIkFIwaqsGfAmqSUZwQVn7+lHbZvpeNR4CdJodOBI+eJkIUOwgO6GyfJ2Rv95RCsrDrBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uk2+x6Za; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clIRPYaRVRdEgoqzs8RpXSus1We9rmj5fa5ylnDufSOU5/mrkr++alcCNQb/rRd/OAegncQC94gRlsKYwdiLkkbGtyvZ0Unmpv3dznS6SWLy2BmLbB4oHzoEjKJwC66/KUjsLtlR6oK7oKzCtkGlZsKE3lt6KbpOD635Bj1xP7lQ7MPdk1MdOhpuq/q/vbdthguP3/DfdcTuxn57dskTZnNed6Kkfu7e3gVzCc1rbKBi+9BkpKhPbNXlO7mibwbXmG198MeaRLj5eVT3PIBD8pxNAtQ2u4yg55hnOLfK8rR3EIvJGCzArC/bSOE21DON3gYlQ3cfECpnQQLaoiZ+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnZcQLD8zTbgZdfSLJonUL8LwAMiDzjtgZ71JsRzyG0=;
 b=gl3fHlOabm22kieRkH/ivGF2dz7b7/ZyuBL6U5+Hr3ABnbQohegNohDouUwt3Cdg3ov7GFvI7VXzvSGPSgM/kX5KGdzuuxWy9qZRjA0wlOBBW6v0Ze+7VlfxXfb5JTL/uG70TaUSkbTqbaf5Vo9OGxjovGY2hWI+5m6UUF2B/RZBPjxOMPKLbPAU6yzsOf1L/ynGI9gRJ2yFJU16txQDIVY4zaq9b7C4d0ej6DD1OYo4WT50mtiIkhSRfhBah2Ke6GduUEaEAwJT9hrPJJLBwKbAiI5/g2SFF7TBWY6JlPWQmr2dGLG2QjmZIAzcmLzmdKf8jrUvlxsDtFVixqB08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnZcQLD8zTbgZdfSLJonUL8LwAMiDzjtgZ71JsRzyG0=;
 b=Uk2+x6ZaXFgLF9P5Pi9djL/7eYvrsd9YMbYbYtbTRs7EeeCBhx84F8KC9trPzZvVsuKGYRTJmi7i1vUQpzk3Boje9rBSeoYV8Ev3K31nAVIPj1UyTF9Av6PdJBpjm7Q7xUyOVsFpoGBHu/FvWob4gR2r0qcd4//tzA5TCYdze4HGZ9zyolH9QNYeCgQIvMYksvBt3wICwpXY6p3ZoACfjyuGi1QTiOcgzsy3n8JolpkujlgeU+bdNkN4IpsISMKHL2B+cfqzBuBTC1QTzoNfFAPEr6amq5VCIGcCGKnum2Jj1IG0/c4Oxh3v7jG+jstZ81p8z7IEaxevuhDCnfDEPw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 17:02:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 17:02:01 +0000
Date: Wed, 1 Jul 2026 13:01:52 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 16/16] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
Message-ID: <akVIAPk0FAldk4vJ@lizhi-Precision-Tower-5810>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-17-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-17-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1P222CA0153.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: f41ef23e-454f-4c0e-6dca-08ded7927810
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|7416014|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 NLt2SKDZ/+XJRB094EL3bMwCw+A48kqVJEiws+uo1fdJIbkbmYjaZ7Stb6LC15nKAZr6RxgMkXfCO/eJzRMw46UAjV3oiGKFQAkDSSxRbiqAHTMXjLfGqNXJb9bnGee8F8JWA75o44QRyZsnAJpJ/EGE/DQ4MIrsDEIBQUQNOOZpzlveRYqqOYRiy2znnKz4pn5b8k6Xu7TowABSBPGsB0kJa+Pm5mZp0tfravZzBHoB/6v1z6ldoxm2bvbTBY0EUF45ZwSBQ0AYyJBaDhnqTubZA1EzRfuwNSl6MuMlrHzJwf+87L81yxLBynbGvl1fgWVeKzwRZyxAhUGr+zBJkogk8FTQhLlFl5zTnik2vr2AZIwZyNeklDUJWen43otXWHCjfqxa/NRHkjig/XTMte29pmPxQE+gd/WtewP1G7Mtyxf6TukY5bdOr0vr0YTICe3H4+ODZqI58etJC3CABufldjoOsVGrwtEpJaLU0/+Cup/GPAOXQOjTx+V/YtSsRqNngkfxHLdyrWXuvvXYRZwJiUe6mXDwTCtatHqY5zEoNnoQMpXX/ivo2WsO7kt+N3PH5pj+QLHSP8mSSfY8RZE+FUYB+232zFMoMt0rq4kyYwODMRtuSDiN95j5fNIIRwKiuiWeIEn+pSKTcTVKoWXCvgFXi2dJ0Pa8lAm2Pig=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(7416014)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CYBmV1y8GIP3z+QsSRzwGD/8DhS4hi6x0hJA0QpKsVUoUpwamwYqlM2gI9P2?=
 =?us-ascii?Q?YEgaEOBJ0yLL1unH561PLcgzThyrHc2AmjJ9j7d0yEV7m8HDNIbqIwv+GS4P?=
 =?us-ascii?Q?h4lPXbXFE6prs1Y5Dy37Pjo1GdehpNKmly+9Cd5egPpK2qAzsID5MGXiSzIJ?=
 =?us-ascii?Q?y7AOyCBuBhdhS2au5zOurz16mw7dCFzMHWuNjNII38j92qBe3j4LlVg5B273?=
 =?us-ascii?Q?YSW2ChDv8KBFmwk2Jkq7mNIUNNTCQ6N0pYPDGZy3PneSAyPbK65NyVPJYGbh?=
 =?us-ascii?Q?S595cJiZHwWaXrqpbVYoux8hW+e110E92uXI50NwJ30HjNpshXium+N0v/FK?=
 =?us-ascii?Q?mtvmivmP4hktqeQGg47AguhOuPcasqQ6NOeduX4dMIipaJkS3MVn2af2cFAY?=
 =?us-ascii?Q?wgxhMdTUVvt7kXkO+W9UQ5Rb9lRR8WtraweawZf3hWxy0GvGMmB4Do2l+jRv?=
 =?us-ascii?Q?wpI3tFNCXYd1ixmO5Ah9SfCi0jpTYWGtkR2Ubar6RUlcoqwGSk+MA779zvhS?=
 =?us-ascii?Q?4qLu6sfFLN2Pr2ctA3YjMtMGbz5hKnUQil8Y2Jsh357pic5HAxd2G18mZGNO?=
 =?us-ascii?Q?xzcESO6u4ZpK00Fsfphrzi+XGGKZSt+h7EQuch1eSygcvy+B14SU1wx5UbQK?=
 =?us-ascii?Q?7jBxzS3v19EI93nT7wljIHNZfUWUxxjqrmY5l8fROrqGrEcfH9SgCcIb1ldA?=
 =?us-ascii?Q?Tr9XYRm+kvFjcaMmMAVy3zIC04M1QHspca+dTG1S/4A34P00Umoltq5xcZFj?=
 =?us-ascii?Q?Qm0bHEvgFrKE+tdEkErvdqgeqdpMjbZJSwTEQGOhtDaFr0XlOqS/GzkVz11S?=
 =?us-ascii?Q?k1e9LSYv5VRNcgmBz//SO/Wo0NuAbbDkkZajzqZtk1GAY8OU77LnsMrMNHzO?=
 =?us-ascii?Q?K5Zj0MkAuVxZ76G7P29cQJkNr/zVwbfLJ8R2NHqSiJVMiVcLq89ZseMUOrDz?=
 =?us-ascii?Q?MqzWQ9JUbnPa7sa7QJYcKtoiSujuEdA3qZy8w1ZmKhppfKEs1eKZuB3EJzqS?=
 =?us-ascii?Q?30VfqQU/6EYOJg1NC6Gb6uwER9YWTDEh19IKORVOh3TYDUwomZs35zjhao/J?=
 =?us-ascii?Q?hsQrSgM32xmNNZM5BPCuchBJ6L/fzyaaWvdaEM6a19H6W/kySOpRDSRZMoKY?=
 =?us-ascii?Q?/WHGbnQ5kbZoTk4P9hWB5tNAnUtG/8LBQFbJlhP2pogN/zw61eeKKbuv5xO6?=
 =?us-ascii?Q?Jwl1KW9xTe29DClo+2yWoOoODzXjus8OkjG0wW23TBXgwaQgbX/5Res8wEtF?=
 =?us-ascii?Q?yfSmTPl1sN65eb0KTqpH5sFL+NJ/z/zT4EAtTpB/igWPS5Nrg7tyRJ3PqaPA?=
 =?us-ascii?Q?ZsQnZzuuaza/W2LhCaGjXd/VsfVdH6Lep5rFT4RxUbZYc574WEepbOCF4i/E?=
 =?us-ascii?Q?FMO9LM2SXyeMW+5G9t0073/8HeJz4XxPxeQ/0fRepY2QoIH5nFitFf2SHLt8?=
 =?us-ascii?Q?nstsHgBBdsOuYmCq7xznwgb3j/RlQNFg3eTb+Ja9pL8KRE6ALs3hd5/lQqbu?=
 =?us-ascii?Q?foOVCkpOBcFwqnclLOm4nwLXwd9qnHkXrWPtu0rQOPkh8PtF1rm/Lv4MJQFX?=
 =?us-ascii?Q?jjIZ8dMrubei3Jws2NASLKwDy2RLJVvnScZXf/TdAv3pQoPRpOT/XiMpovTV?=
 =?us-ascii?Q?fyuSHPr4UXpzbr/vs3MzbVztMKH4aEXsg3BeXQFqbclAXm4LtErIzZSGpvvN?=
 =?us-ascii?Q?q8p3a6fxoGOmVkl2b9egXEwZsplDepaJEZx84b2PsT0lLyJQ2/fEV67dphys?=
 =?us-ascii?Q?t9Un0xz2yJ4wxRc9LfRbTTYE3BG00WonNTDiFXJZpmh9hmTlZD/S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41ef23e-454f-4c0e-6dca-08ded7927810
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 17:02:01.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/qZFHgqX5JmfgUWxrYfIMH0zoESFKG8JbDUpP+SbgOTuDFJ0aWkeJ/Xg5ZNCeDi7pIUSTC0IMGercYKJGdl7+L79lEiB1LsC9jg9PC5V7aTkYdoWJJCbslx6N/PTV06
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66261-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DA16F01FA

On Wed, Jul 01, 2026 at 03:26:34PM +0300, Sakari Ailus wrote:
> Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> set_fmt, get_selection and set_selection sub-device pad ops. The client
> info struct will soon be used to differentiate UAPI based on client
> capabilities.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This patch is exact same as

 [PATCH v6 15/15] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops

Frank

