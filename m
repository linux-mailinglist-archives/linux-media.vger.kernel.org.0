Return-Path: <linux-media+bounces-66259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JQdzKE1JRWpc+AoAu9opvQ
	(envelope-from <linux-media+bounces-66259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:07:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E86086F0293
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:07:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=n7VDM5dK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66259-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66259-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F151B314FE8F
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520F7382383;
	Wed,  1 Jul 2026 16:57:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A58380FD6
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:57:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925073; cv=fail; b=euqI9nCnonQ8U971W+t0MFTYLrX2Tr/6LBCe2CbqNnVbNp0VhSEcynrknrBo864cjLRhXOIVtAOrPH3bsz7u6mdpJcdB7yVOj7vH7ogrlSgWAdiAzFTNzSehkBy2cvaQql+/vmVF7sCMuVQQXO/cxU1fQz1GFcRK4fQ8O9RnTZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925073; c=relaxed/simple;
	bh=GPfWRgJJtPlSiLw0mbQdBZ7rGBH0fyOvr/QbHAvYg+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UQD4CbQFRBUfwmNg26YYX6KgxB2HNWNw1jff5SrWi4DchPOiW++/KLLFbFbDQ5p6gGi+G3Gd37k5cqgootTXU4Cl0u0cirFL8ptO5jRmO433gzRmlwIHn3BJPxyZbeIzg1gpLNJlx9EdAPUsQtgJpCnLkgeAPbAMkOKBJ0RIQq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n7VDM5dK; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVz3i1QLxYHOFKpoezK3vx0hBmSYPWsSMy6QEIEVjG6PapvJQvaCLMo+tgq5lWzWr/mHWOOD5lOHqcZwAW3R1/FnYH6mu5Uwm0gldQ+qYIqJfUdd8Mb8HCT0G01M0bHFSIaBBydMVZt2NiSI1ITFbYWW8BhM3P+c3Osvw4UPRUkKg+n2J3MFXCheF+CIlZEm8e4Cmr21AqeI71SJQiXdigxBQe30TIjqVS6r8rgsmTRkK59omPvrRe6uZYXGCuekF1LWluG57L7vEn4FT1BgCndk3hWImPhvFvhEWVqMHcZOBB00vyEW4P9MuMVsO014v7TepzdBqR0263beBym49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMvGg4rSvvPHwiN6vjr54q7EC3IqLd6uTl4lMYeNwqk=;
 b=T83LMOFGs8HriLakCqDkJ9GL1uBqFEToiJLtLhmnoxiABNDAkIJXurWPASt1SVI3qaseypbBCsJoyTIzixFmmgzLvSLoLyQ2tL88M4jmzaiSBNZRvorUKySkHPXwn1fjQDTHHUGyLWTg57vZ6ebHl0Vot2k0C+eTRzaCH9LuYcDjeSxUqCSa5003ud6pR3PBMIY5It3x6VWtzb/meyQLdDhbI207xH1R4C0yB4TBbsyTWZV+2CdboWnvxdZiq6+JyCotQn7m1yimKDVfcLv67ZC95H01NEdha5q2MZK+/5Q0Z8yALKxIzP7CgLIlDEwAcZHfuGlEq05qprkui0A6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMvGg4rSvvPHwiN6vjr54q7EC3IqLd6uTl4lMYeNwqk=;
 b=n7VDM5dKWryuUA3E5cfC2wjP84uSTBhLcyZ4yn/iS26PeWFKpz2A5mUub2ErDJ74QHEPOaX+zLaGeSek+P7nnYx/fn6llqk2lqfFn2CndvWnLwrDhjvXdjUC5svW0pyiQ0XXDAz3o0TFLEylE58VJ8gn+SQdxQ3D6KB0WMPYWwHPxhH+nVfkwF/x7fJDTVHK8N48P7p4wyv3VjaPq0xXFLQgn5QbpYz9JjTuXK7GJmLTWME0Qh6949x1Nt07DVDiz8WaWixrKobsybHO29Fp9xw4n2k0fxkqED85wljiyE5N8l7BNyZIUJRiRnn2+cWnIlxtaotJ4dZdgCmOzk5hwg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7321.eurprd04.prod.outlook.com (2603:10a6:102:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:57:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 16:57:48 +0000
Date: Wed, 1 Jul 2026 12:57:36 -0400
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <akVHAKPeDNzcqTIV@lizhi-Precision-Tower-5810>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:510:323::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c45910-a586-43e3-0d7b-08ded791e154
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|7416014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 3QxQV6hfBUlTkT5d3enQj0lUF5i8m9/F2RvvpGkTdjm3EXrTUt/vu5YHSeLJVALZu9bretYSI8A05/lp+Fj60T7t83kRXE3qhfipMpSQ6kEhw3DqBwxZK8NTdYgoX7piJMrt8D7lqQ5NZCxDwtQiO3R3dIY2cMSF3eFWx/C/KGzfR/vjRzdm3ye/0QAi+Mu6t0zKZF6p6iD6pSgMqODAp5JSjcIvgSyPOoVsQp+1r6jdVYOtk89VyaS4P1qUH44I5zXA7pZ4OwNhkrZaZ+pR2nrYU+lhBfevuQG1IXCk8atL5QkV4vjda4XsqRU5XIHLj12wwfIQJHLWneALNYIhYm3Zipw+4wwEcUZqfLOWF+h5zKimVnBQMLg+pXrsGfMBFzAftq4GSUIZxjw/cUSbI8bWYZ+fK+UYSzc+YQy4ocLxxqcycITzTlrekpjk1mqH50uauT0FHcCyq0j8lgOwJbG3RJtOMhoDrjfBRYJ8fiyrrpn0y0TxIIfTxDtNmxPwPc9vQaxCqUFReOqAk+wj0+v2qc/PlgaasbnUJtpCbp3L4lPJdj1Z6pzi5hpoto1RHS9LmJRNdmtP9tUjV4LmKoNmKUQdL/jTrmfoIzn5yK6DIaFmZE0nDvHD6q0LDlLGNUcKkrLxBxufKEmpriRslUieAbGAGMtLH5kyb+Ozrmw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(7416014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?q1DJvLOS5Mgn5FU4ETxs9R2FJ2bGb5Ewe7+7fg8enbx7680n3U6DWqop0uZ2?=
 =?us-ascii?Q?lj2P6nkIjClpLtm8frI8ql3euSVcJ/zq8WqXr4S536VJ/RRqKZU9+UIZWvpr?=
 =?us-ascii?Q?KDc9gq28idRHNL/WYq8zzzrwBPYasLCRQfKGEhgQy1mA/wppFoUgANKry/Gz?=
 =?us-ascii?Q?2RzbyfkqaPOT1LH4tNjCbuH7zMJw61RO+bs89NmL81uBhujXk9Bjv50FCCk+?=
 =?us-ascii?Q?J8MWF7uCUun5H27+MOEYI09gjmFlHM2sgWFAhmqaHm6LuevBeAEW8wrxE++b?=
 =?us-ascii?Q?rafhSUK3RTLn2125yRyYlyshYSpua1SLBSmsQHeGs3JP4cOXg+2TREaEWFtU?=
 =?us-ascii?Q?fDP6uVw/TngwGzm6Db6D6U7NimTHm5XmWOnNOKWFhgeTXCzYKkCzFMYAQ1lG?=
 =?us-ascii?Q?AQ5rc9m/Tfg57HqHtkf4v9WPpnRUJ9wlwCIcU29pXJAnAql0EVR0o+d60zrl?=
 =?us-ascii?Q?TYYBnVwlpqeE+MjM+ZsrtLLZcsRxJE+cDEoaW5712vpWcYSX0DG5sOCjcHtB?=
 =?us-ascii?Q?m29LT2b4YR1OgHnGepYB+rPK/kAXn910lWTXvRvK7+4IFIeJNhs+wtZ5a53Q?=
 =?us-ascii?Q?WpdgmV/A9jxc6DZmW6sTc0ziEUzWACLUacJ7uxlCkLGRJgacB8uBll4J0NRo?=
 =?us-ascii?Q?fXAQVmx08nW4Dxqp2YRsnntsPWp5EQNb7Bzbny0Kkd/bYyTFlr0PjvWJGvUK?=
 =?us-ascii?Q?WutW0OwMmOVD8jC4YaJdUcQJQXEcHWD4aNu11/LTFParn5kVymi0t5I13UkD?=
 =?us-ascii?Q?wmfgpsGHALoADK5VtgQZNwkq0n3tA99CIScBBdFNXIlnpN6+Ap8LUU6wolh5?=
 =?us-ascii?Q?WSWksM2TSEfx0apM5TYtJ4Wa217fBbXSRv4oARgidPU5RAdsi+53l/vIxpxI?=
 =?us-ascii?Q?kzSdJMvaL92FsTvZ3PtB63HdD6j35fuBh/7I862gGM9xTUTXTU2HwMJnsM1H?=
 =?us-ascii?Q?Wj2DKYRd6V+OGtREf+4eXJzGcn3lfaKzLw2ciIsfjREJSKnAxcoftRQMAtC6?=
 =?us-ascii?Q?PuQ/fpGgHxXxJGAcFq8vAbgJiN+pV2mdN1u58iL6qnuvHYH9d7C+sfxjdvA0?=
 =?us-ascii?Q?M1A8r3mNbDw7DmfpREOSXU+SZDJTBVwhqnw9IxBhsB7LD0l4B1iSy3ZvvIIg?=
 =?us-ascii?Q?Do04f4Vgh88S3SjiAbPxzgRu4YpXodssQ+Wr2tE1k8X4Ej6SSelG2CKZYfKl?=
 =?us-ascii?Q?ICtSk/BM7qFDETeqifmlVQHQKBBtXY3WykRwps2M/dkiCtZv0PbmYlmteL+z?=
 =?us-ascii?Q?rtOAcKlWxUFs9+XBYGP7AHOFQBRJWkh+Vd+LKgKonYraM6emOr61sAOVVcTL?=
 =?us-ascii?Q?NhUI7KzxHJkCxPbJGKx35fLPNx8/ENrhA7fhFex3mmnIeM1/AX+1aNwlf+x0?=
 =?us-ascii?Q?gaGgUktMTnJCaW7obOdFbVnWxwF6YQjtfoTTd0NRGjWNLK0575NAwrw2gY/e?=
 =?us-ascii?Q?DpOJ/E41DMgWkuNXF73nkLwLeOII2l8cZgoFgdWVgSpTJV2NVWO+cLjJtAqx?=
 =?us-ascii?Q?+E6mXTYyNejkjftlSf3FSKt/9UwXpbxR3IWHf8uzvG3C5wNsfDUg7CZLCVgc?=
 =?us-ascii?Q?8IcIpuM+MRsLw0c698BcKtdvhThyqul+EcodJ5hgMXStl+AHo4Bg35zN1JoA?=
 =?us-ascii?Q?XyT60qhUCcj2RgvURaDa++UTAR2Jib7LNbGY6ecIIS5mnDg5FzApmGzso/f+?=
 =?us-ascii?Q?+PDSn2tQ1KxQ37Ig5c/Nd2LUYSDaqyLR6ORvLsiDZg4ykkTUQ+wC//kJ9UWU?=
 =?us-ascii?Q?jCTX+M9nZn0zJOwbt+v6lpGiG8lt9E5SRzMYy3AQ4U6ZXykWK0DC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c45910-a586-43e3-0d7b-08ded791e154
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:57:48.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGxSfcINvoCnUzIxY+evtCnCvuL7MkbLRfO+J4AwDEIlGti4E8CM+cGbYiqEl5Ofe9tYr7rPVkk8F3luXSwkQEC8+ekwnHr3i9vAt39p8L4e+6Fjj7w5BPd+Pg8lD9yX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7321
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66259-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E86086F0293

On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> Add v4l2_subdev_call_ci_state_active(), and
> v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> take struct v4l2_subdev_client_info pointer as an argument. These ops
> cannot be called using v4l2_subdev_call_state_active() or
> v4l2_subdev_call_state_try() as the client_info argument precedes the
> state argument.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
>  1 file changed, 74 insertions(+), 21 deletions(-)
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e08615179e7b..056eaa949786 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  		__result;						\
>  	})
>
> +#define v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \

Suppose this macro is internal used. is it better and __ prefix
	__v4l2_subdev_call_drop_fourth

Frank


