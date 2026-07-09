Return-Path: <linux-media+bounces-67185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TRbNKii8T2r+nQIAu9opvQ
	(envelope-from <linux-media+bounces-67185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:20:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8F732C39
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:20:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="g7B/RcX4";
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67185-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67185-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 575EE30D4B8B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369E8375F8B;
	Thu,  9 Jul 2026 15:10:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FF36D506;
	Thu,  9 Jul 2026 15:09:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609804; cv=fail; b=mxYIcbwXz7nnGcII1IIfkQO44MWy4Hj5CQvYIOyuEVyNfwMG440tOOBlKID8/APX3BfOpR7wIGhuDCDKjhSs3qgNMXcXmpppfKnvOGZEZdBawnd75W7C2+q2qng4CKqDogCKv5bLcGQvSJNuDojHRefqG642/b+fCH+fGSsqR8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609804; c=relaxed/simple;
	bh=cPRtIZDXQYv+1idV4aX6eNYeuFGm0eTLfBqwpXJocjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JLR8kBHDuNRkPMFsO2mq7qM0UGreW8a/NSxDKDNkDGtT74dPTiWYIscp3yTJ/p5wYtmEydz//EHdnw6WZxqZZ3/GZA6dSH0JLZ4JSs7Voem7i3Ym7Ab0u0fuu8rLpEFMYsVDmJoaeJpNyX4s+bA+C/5b6Fi+j5WSSeV8Lc4iulY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g7B/RcX4; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2ftXiAfCIrPIilmbcZc/iHrFiDcmKBATbVb1SDfKCtdFlzx1gMmsSaFz68OpXSP0K4dvKOp/bo+q9mj+oKKhOFPfGGBsx0rZYbJuZgPvQW3AsCRwCnTulFmnPTQQdQlGOD6XELzSoWn5G2d/ywVuayL9P+lp7ScIXjsHw84nqRq6ygDUyZfSiGo2CUmAV+3817nJ7uwWgX+uOcyZxHYrZXXdVXTMDFLuIZtvpLH4UzvysdPAoZdkWK1LUNeVTIjB4Ce+R/mPnJ92VWerMDEUQyTqK7x9FpntgZa3vshutnx3gk8mUueYCJ3PCimjGtguhu25cnd6ubVTQSTQsBPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guc+ZLFmP/rtb8/Qi+LTfSLe5b9cMglyaU7Mvrl9FE8=;
 b=p8icJNnIZO62SlHm2OGY3A9SiprPNNRd2FhtT5eHYhRZKcR1PODo+J8Mt6doZ2lciXAFqZPVk0Jy0bXMswL1P5hdzrgW9jMDo4HCDcYF9vWKx3TVZdZcMGeznfMCtqg9y/3vu3aQTVCDJYLHzGFp8PyxBacZydaBfd1qfg8TtFHtGXrAm561PddRLIw7pW6Df4jEauHNjcG7cbtBaq0HMSYKuBXmUbpHY4d7QksqPBfnrbOAxWTjM0bHfvNWW22v+88WUE9PjYtvgVS91KsQYmGsQ6iCvcGVh/hGT9Xs35GAj5pLu25oDOxPwHkcxvJ9lOA9VT3Vh9JSwT017FQzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guc+ZLFmP/rtb8/Qi+LTfSLe5b9cMglyaU7Mvrl9FE8=;
 b=g7B/RcX4ooHLWh1Wq9Drz7X/wPt8zdKQInqcKUjj8PSRL0iS+2S99C60W6EgfM7FkgLpOwcTWeMv6zBtpZKcTtCsNS62yvghOYbRLsPAqdMZRKMHiSdvTXS+aSP/REg36z8ER4PAESiaj+sgaOJE/F35ZIXzKl/ifoaWYlZSeWc=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB17244.jpnprd01.prod.outlook.com (2603:1096:405:330::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 15:09:54 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 15:09:54 +0000
Date: Thu, 9 Jul 2026 17:09:37 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add
 v4l2_fill_pixfmt_aligned() helper
Message-ID: <ak-5sUtCYZzM22HU@tom-desktop>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9pPzjABetdgUiq@zed>
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB17244:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e30fd3-1d81-430d-42d5-08deddcc21bb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|38350700014|3023799007|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 NzmWdI5fuz/LIRf6/79zr1LqwUmmoAydNG5eFszy/rK2rxuuTPDhyAW/NNozzqKvxWYeR+I+00vU+Y+s5ZfBZ0NeQjMPSDSS39qBZyr8pNA6EzvrhRJO3NBNtyBvQD3FUs8ZY97T/xzHAEb2JlE3Am+hbOBLD+BraQroYgjxlN00fRwDzYHSixMhK+nzIAEKNbnd92ZnS3aiOmbm6jOKY+EUrRdgNBeFWMN3shP92rz63K3W3bbxXGgt1aHvfkbZDfeCn/fSiQCpeh+I/RWUZba2T0ryHRYN2jFeTmWhhwpY0ENloe1djn3oHbXcuWHfXkp6CKAcBqD9/lsMzrpdt4pX6TrlKV5CXve8+X5NPg3HYAKgAHinBbtiMaO6Nr0n7C45JXAcaIBUuEPCsS5BU8jOE2nXUO1B9KLY3cvBNIL0xyO4wkr+1jkL20tXVxp7h5A3arG9lDegcEgHRLV8GE9bY7uFL6hCMcW5NSc1lrQp8+/IpP5Szv3I3hwPgGKQpDdqutPzHj/O5xpW6W+sQArd74zPifKIgpKM1nMDrskG2zDdGGkdPn+tvdcbmFJD2u0d1lq6u/6TuxzkULcBQrxQaqBGdYEt/1MNwXK/v2bg6xMUfmsH4ZwCrzmHPU5pS3Cnr2pd07gaDlWl+BSyyh6o/O0biQnwk6uf2zIsgu9sOx7Nr+2xxwldWgoH2F2465oBMnlTNxjiF5tnHjbsXw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(3023799007)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?35q5f4hNy11kJwF8ht4RDrOrTEN0m0KdL0aIUz5HlP79ooHnFH1INWmjpiuA?=
 =?us-ascii?Q?9HN+RJKAsR/e2AfnrZRSp5D8BKf3jg8zIp3y8b1Bm9SrxezN8pQXiXU2vPX7?=
 =?us-ascii?Q?4p4g2YVNS41IK7NIOTYiG8KNeVdrvR4bssXXH3LskI+pGPbnN8wUOdk5iEDD?=
 =?us-ascii?Q?VoVEr9syqliSxFPuJXAZi6stC1Zkdn7hpvsCZmjLJ25VnR/gBrMwZNtbUgg6?=
 =?us-ascii?Q?lHeFpWf1b0mXkreRIc3che4NfXDycysoLfmKJc9a/pE9eoofH4eAIsjaVD9y?=
 =?us-ascii?Q?9ytcpxQ0jh/ivIbPQy+7SNlR/yIeM5SXF8cwcprESGdjTLNHle6eCk3sQGMV?=
 =?us-ascii?Q?41NkoAmORFoJSzc5+8J0qUUYLvLjK6EU3rmpnlf7vZTdExQ3VhljMEratSOO?=
 =?us-ascii?Q?X0/AbRJ1On7EAb6YZftsCGKlYWxEE8idhRan0CoXOqfe4kRPT+6dcNGp+wPy?=
 =?us-ascii?Q?DsXGHHLV9iZBFwy5H4ySrLNual0EEBvcisMHaOLyaln5Xe6OE3PEP/AjNQ4R?=
 =?us-ascii?Q?ogEi4nHrcDOBdoyayIAtCjVL2xCdxcqgie1zZJNrw58VsAASvMtuIFZ9pMpH?=
 =?us-ascii?Q?6pdjEU0XTl9CCK6UvkjtqJ++TIkJvyPsdAVL20pDC5vyT2mQ7su0iAS/cdlI?=
 =?us-ascii?Q?1qxVmNsRhzDqT9ulsC4WGZUWzokUrexVsXYXBpMAySnSQqEgigTamD/T2OyP?=
 =?us-ascii?Q?vSSvWQh9ol3shgcmcbfog2X2gUd/kWwHti8SciCQavm6tn7ijddkC/aWEbL8?=
 =?us-ascii?Q?wjgDuUHgbxTc29MXv9NA9/aYTCyKXvmf+W2HemsfItFvGRTE0AppixaYY3Cl?=
 =?us-ascii?Q?LEmEO/lJwAOCHaZPnL4sGxZoIrq28e+z7QSXIQ92Q1f2JqZ5VAgaoibmOcuO?=
 =?us-ascii?Q?JqqZlYrnXTb+WVOu5HlIkmwCoo9l+nYI9LPlZ+DCOwUyV+lwpmvHKriTQ3z4?=
 =?us-ascii?Q?z5sexYO9InXKnJbqHjq5kEzmnP/u+v7LvTK8EKr9+W7a2FzFUINCZ/rdTO3F?=
 =?us-ascii?Q?UHkEsWPz05pK7sKjb5drw289H3Szkg9D83+7qL6o4ldIGfNPDdJPknLaE0Ie?=
 =?us-ascii?Q?7jmLqq7YfIUa8B5WhC5gUAGWWBXnZbuKv4aw3zETXWivyodJZdoFz2+2t7E2?=
 =?us-ascii?Q?SHCFWbY86vblPI3x/XiztxXy2Ew4I2r2MtM88RiKhZEQImARRtp1FezYE07O?=
 =?us-ascii?Q?j7jcEModbOLapOeSLVG3mh4WGHcE7Y28cu1kC/PkrgwZH7Fl4H182j9SF/Pc?=
 =?us-ascii?Q?qmr8b/B1pjQ7IFD5rgJ+MBLj0HSEM9HYQfzajTeoIjEsadEOF5PUm8vJh8aL?=
 =?us-ascii?Q?CIBHiOlDbLDWevkg61CN+SPEhbhNB/Io5wawrhgdgNwSc21mbTt00tdw2mu2?=
 =?us-ascii?Q?yNW/8yiJXXNFvUCSouX+NKRHtUBrtyzAXemYS/shDi7suaFoAtDl1iFW672s?=
 =?us-ascii?Q?AYIQ13xY+Lrj8VVWN89drAxWHPhcxr45qYiy4AJK2/oL2AscrGiTPf4DpeIO?=
 =?us-ascii?Q?j5+DO97XyqW63Qmn8ioWELEGWNKH5OewOQouwCy0DmbFJTFxQvCQl98GjeZT?=
 =?us-ascii?Q?RPP/c4ESQpyBszwAYxuyCWwvI7IYHCoqsb9LSgc5HL6QXbAhJIPpIqemgjTj?=
 =?us-ascii?Q?1GhxDfW4Xuc2MT1jbjyHNFAHgjWPx93n5xsUuILOCC7F0cQY5x/3OOJrm5z0?=
 =?us-ascii?Q?U1/cNAdM2Qt30Qf4WF+DlCIg41efSbaNxWtmTi/CgpcGBUom83dtm7bsd2gp?=
 =?us-ascii?Q?mSCYLwOtw1aCSHWTf9mra2EUP4OAFkMHlfTmudKw3/2vrxBYqX8O?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e30fd3-1d81-430d-42d5-08deddcc21bb
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:09:54.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqLfpshsmhLvUJNVrBnYV4jGDRWvzwqrJh/NbQ2CudqrTQr4X5AGvLydNKUwsUL6E8SRTx/4za72nYC5FG5qq4eKazOhJ0cfXUFLf18fg3si8oGlgd76Rke2d4mVNOF+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67185-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,collabora.com,linux.intel.com,ideasonboard.com,pengutronix.de,samsung.com,crapouillou.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,ideasonboard.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,tom-desktop:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FA8F732C39

Hi Jacopo,
Thanks for your review.

On Thu, Jul 09, 2026 at 11:35:58AM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Wed, Jul 08, 2026 at 06:14:03PM +0200, Tommaso Merciai wrote:
> > Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> > that accepts a stride_alignment parameter, mirroring the existing
> > v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
> >
> > v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> > with stride_alignment=1, preserving its existing behaviour.
> >
> > The new helper is needed by drivers whose DMA engine requires the
> > line stride to be a multiple of a specific value, such as the
> > Renesas RZ/G3E CRU which requires 128-byte alignment.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v2->v3:
> >  - No changes, just moved to from PATCH 3/4 to PATCH 2/4
> >
> > v1->v2:
> >  - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
> >  - Add v4l2_fill_pixfmt_aligned() helper documentation.
> >
> >  drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
> >  include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 54995ba8c20d..2ce4f1c20fbc 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
> >
> > -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > -		     u32 width, u32 height)
> > +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > +			     u32 width, u32 height, u8 stride_alignment)
> >  {
> >  	const struct v4l2_format_info *info;
> >  	int i;
> > @@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> >  	pixfmt->width = width;
> >  	pixfmt->height = height;
> >  	pixfmt->pixelformat = pixelformat;
> > -	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
> > +	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
> > +							stride_alignment);
> >  	pixfmt->sizeimage = 0;
> >
> >  	for (i = 0; i < info->comp_planes; i++)
> >  		pixfmt->sizeimage +=
> > -			v4l2_format_plane_size(info, i, width, height, 1);
> > +			v4l2_format_plane_size(info, i, width, height,
> > +					       stride_alignment);
> >  	return 0;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> > +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
> >
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >  static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 749fe38c134e..be4dd9762196 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
> >  const struct v4l2_format_info *v4l2_format_info(u32 format);
> >  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
> >  				    const struct v4l2_frmsize_stepwise *frmsize);
> > -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > -		     u32 width, u32 height);
> > +
> > +/**
> > + * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with stride
> > + *	alignment requirements.
> 
> nit:
> I was about to suggest "No '.' at the end of the function's brief to
> match the existing style" but I see the devm_v4l2_sensor_clk_get_legacy
> has it. However the majority of the other functions don't, so maybe
> consider dropping it.

Ok, I will drop it in v4.

> 
> > + *
> > + * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
> > + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> > + * @width: image width in pixels
> > + * @height: image height in pixels
> > + * @stride_alignment: stride alignment in bytes, must be a power of 2
> > + *
> > + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> > + * stride alignment. Only formats stored in a single memory plane are
> > + * supported; returns -EINVAL for multi-memory-plane formats.
> > + *
> > + * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
> > + * rounded up to a multiple of @stride_alignment. For formats that store
> > + * multiple component planes in a single memory buffer (e.g. NV12), the
> > + * alignment applied to each component plane's stride is scaled relative to
> > + * @stride_alignment so that the chroma stride remains consistently derivable
> 
> Does this rather mean that
> 
> "For formats that store multiple component planes in a single memory
> buffer (e.g. NV12), the alignment applied to each component plane is
> the first plane @stride_alignment scaled by the plane's sub-sampling
> ratio" or have I mis-read this ?

Yes thanks.
I will update this part with you suggestion.

> 
> > + * from the luma stride. @pixfmt->bytesperline therefore reflects only the
> > + * primary plane stride.
> > + *
> > + * @pixfmt->sizeimage is set to the total size in bytes of all component planes.
> 
> maybe s/component // ?

Ok, will drop this in v4.

> 
> > + *
> > + * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
> > + *	memory planes.
> 
> Do you need this tab ?

Will drop this in v4.

> 
> > + */
> > +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> > +			     u32 width, u32 height, u8 stride_alignment);
> > +
> > +static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
> > +				   u32 pixelformat, u32 width, u32 height)
> > +{
> > +	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
> > +}
> 
> All minors or nit-picking
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Kind Regards,
Tommaso

> 
> Thanks
>   j
> 
> >
> >  /* @stride_alignment is a power of 2 value in bytes */
> >  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> > --
> > 2.54.0
> >
> >

