Return-Path: <linux-media+bounces-64691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ibBIK9kHLGrJJwQAu9opvQ
	(envelope-from <linux-media+bounces-64691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:21:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B4A679BA9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:21:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=R3BsGuRP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64691-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64691-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C133C3002F6F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7740E3EDE54;
	Fri, 12 Jun 2026 13:21:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C639C3ED5BE;
	Fri, 12 Jun 2026 13:20:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270461; cv=fail; b=PrzXYXsK1feZapNRjtLjIosukAKZoU6ktyqsciXdm34ilauJ2SYWtMy/za5Oz57ojEGtLhAEuculdeLb74d9wBWZDxWYtYZwPxGByD/aH5ZnY+Yh2S/dbn3+9TxoZA8JDfU4ocAVtZNWxibTUzr0cPKMcMwFPe1d4PgJe0I3WiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270461; c=relaxed/simple;
	bh=Eb+ROArPlZwaikX7ZHwvVK6KPrJti5o1939Jt6zokBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c4gbGbtORdxgHMmNvFA2GikgPnf3cwzf/pgPT5YYHWa71KpdttIcGUh7Q8kek5v8OeIW+uI/oGioRqdaDztH7kltos2z/jeNFayD5jxqD6y2uscYI1mJd+NJBBRIHJmpw3rAxmYEpkgN7P/Me7+c6Qn+m0v3TM5i6NYMTJvU9C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R3BsGuRP; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLRbia45zQS36ywfQUDx5uM5fu5ym0/HKR7Dv/tPjZEVv8I1PD64csWMecUzpNgWSzPDymi3PbGlfTnqFjigpSjmN7Irt9vJo/Xy+lM5SEyxhnMiwagPghskpgx3GYBsjtXah6gUaEHL16JwJimusUI+nRexrYUSEJE21EdgbTBh2lH5okrPZu2Vwb8xP0xGJyQTDHgEyigRqhtNTBANm64o26AWQaWGcYYzVT/ejoxFkwg5MLt9n/XT8ydUD9L9pX6amfkO1uGILV5QRLkTGaoJap1xk5ujbkT5aJrWXmXfP9juOx0KZorOXmVa5xbYvR2DajXtuFhOmiZE8emKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHWV3gRupX+AHVICQwWzT/H+/0hT8aV0cZ6MT8xnZZw=;
 b=fdWQel22Uyw690SM2mEiUJU9zmNfSVZmJcma7gnIoITcaFFJs0sl5x2HU43esEy4l3KJL2LOMs3OR68pCuaAabeHc+fh+oIz6RA+j/yl8M2vjDaAYhGCk8sZoroJvH3nMcv8OSvlQzWLCn7QRoOV3/tcc6wTyzfrJsPirq8rT02J1xUqOio9cLHH6hIyz59BRE7HrABrUeq3j4maNXszTxgA/pNcap0hfAHwLMtt23YjUAoTt01g76rRkJP9KzZYNduc9ewSxmdLSzm3BtJJYJezFMICSAOmEpzDKr76t7EB4R4SxNrH+hh6BjiHIj3cZSng1oxqLT41Q5aaLgGorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHWV3gRupX+AHVICQwWzT/H+/0hT8aV0cZ6MT8xnZZw=;
 b=R3BsGuRP68znml6Kur8CBkRE47vNOeEEcBJPCP55d73M2PhYnyhiy0W+s5WQklcaloyxBols2nYIe71eAFDrICuENwtVQCtJjOLxAX5g2tK1yxJ3hFz+9xuaHP0jCg0hT0LF8hxE3bAPIgpvT1UYnXZi5kRKODdjhyP/inUqzTahAgB7MSgD4c4NQki+V0A07E5svxMEQzPMIXj0ivrYRR7N9LcwdX2x0Wk/LlkRLS4qH5BMw+HQnz3oUy/BTA5tg5OO51B5BjGNgOcLPmMkZpi4iBrqx9gdQRC0dqaDfywoj3Bjb5vqlkZjqc1EUqhzNxPeXFi2xCTKhjxSLDtIkw==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:20:52 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:20:52 +0000
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
Subject: [PATCH v3 3/8] media: Add meta formats supported by NXP neoisp driver
Date: Fri, 12 Jun 2026 15:20:34 +0200
Message-ID: <20260612132039.2089051-4-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::20) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d788f4c-2031-43df-07c3-08dec8856d1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 RsYtq5QYbyOG4SedJkhUE2uOK4hmtQt91uTH3L1R17DM1lBb4CWsMUYQczchN+rKbiIVx1n6mOA3tpGJHu6pFxuWFNUYGkkopMZ9/xKUIuxM9g2JXEef8Lqy77kRygNcZvNzxNgssr6TShlgu44Ri3m/vc6QBy+caFCTAJBs4UpWVEOJCWJoWoTe1+tejMwXC+BxDe6Eae9JZDXcMykKiuqEFXG2ChSRKjrL2FeBmDlnONoIWoeyEyDMEaNy0/eQ5u8DG0xaOOjjYUdhHZ+spWRhidzs/OGnQ6zSTMaPxgD/zdvNkzlPJM06289JhoEv6hPzem7sI3HG9AyxFB2rHIPEIToeikKF3Aj8ANvq9Np0UQXiENuza/RZEuNshAZONCG60eAZIbtL8Zz2m7TtgEKlZDV0xn3mSktaqJ8PaR01uT2IRQbXgqFcpa6axKPKV+4JEzZ9mwcVHCGLjT3nEbVe0bHAjvFMHMTOYCcB6TnZXrSScv9rAqHJWVxo+PIBWtlPkdcpWHCUDB/ie9C0P82iC/r0Xs2mybioRU6CfXQ59YH8roNqIQGDZsvUC3eljDFPLF6qal521DK3z74BowWAK87yajt7/jWziYh+mzEi9lBcVFKqdrcx200PPSlZR0VUSIwXvY8ga2mb9SEvd6HQyQ7RGd/7ncg8ppYTcVBfGvp5rHZTy8M6WZsj0eVYNCrB3ACHQ5XJMo/T2K2n6lOQKKJmet8AhM5kHyeutUE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?r01lxVQM/V+dWgXH60q5jyIfkLYX04Gzf4FBfKR7hOFdt/MRrX+XEEO8b+QN?=
 =?us-ascii?Q?BDkA35DidfRSJ+eDJZ8mDKffxapPqhS9NcfK2VfTrgx2c5pMy29ZMdjxcrDf?=
 =?us-ascii?Q?3RhK6bVx2LEGuxzANSdAcPHf4p8blpJ9FNX8fSvyGRtm+QWtQHmky5eIXgVI?=
 =?us-ascii?Q?IH4Py2xV0PnRebANvoTw5o+ojqrb2ayC4GlgtuSQqvdhQBtyXEGmNore+sOe?=
 =?us-ascii?Q?I7zFAhoNQEzZ2Bky16PkIY91AqJhFe6Z3Lj2bTbgua980LjNQ+DQRcMKWlXJ?=
 =?us-ascii?Q?9BjbHepOmojoD3ZbGavHexaFIpCmLOIrY5RMKPGecB7C5ISX2GaNVFZCVwTj?=
 =?us-ascii?Q?WL/Q4iVGzeXxcLqh6wM3Gtnx4vI/vCPrTHdJvP7ujRaSx8ZZNxbICiF1HYWN?=
 =?us-ascii?Q?CsSBo1YuXNDJipSHDeulkU/rwUQfnd5Zj8iWrZolIIIW5oK1+/JFVScKkpiL?=
 =?us-ascii?Q?7yjL0mgoAm/EQDulzM95o/GBZzrlHPWGHN0jArmzv/s8HC1BIMR6W+b1KB7q?=
 =?us-ascii?Q?jUCutSkg5Kfp2dkmpHd4yf+PoWbT3pYkA8/o8X8er9GoxhwcA6iDc4FY9Ak1?=
 =?us-ascii?Q?WDmIsv9/qrjQlqIoeoXfpSXmAwFxuim8HMExpv+TV1LF9He81hmftzP2jllo?=
 =?us-ascii?Q?kuAuA0KsimzJPj7Pjea2ARCrbzMaF+dNcR+jO1vQExhpDW5mEPcelA1n6q9k?=
 =?us-ascii?Q?dVCQAS5sK+9BJm3zW0oopCgbqhjffhWxp8/p0MgYQlcq6gLFxe1aTgoagds1?=
 =?us-ascii?Q?AbbXUZLCtfc65eIBtPCKaJ45yVFF3jIzxdjr5qIjCfsa1m1ykkKra/3PpXgA?=
 =?us-ascii?Q?4kzaHDf5xCdcPzR1KclGMLrwtv3S23WH+xH3+fuCKAQalL+NRRq4PSilbYhg?=
 =?us-ascii?Q?jym4X2fGf8ABcTL6l4Es/T05rMJffq/h+8UZoEbdWNijL5sxEIjlx5w3QQ6E?=
 =?us-ascii?Q?pQ8/+4pNCFgmRVoYXrFJmVf+Xec0830QOewUBzqDB8ri87hBM6MwOi4j0JhA?=
 =?us-ascii?Q?yC9xx4t2k4PnyhgPb3L0gKBJBhTiQiYm0TePrxjXi7hUYZwbTRKxYiscYgup?=
 =?us-ascii?Q?K7fotLS2cpXWyPCMOBv9NlJX+OLbA8HRJcaCoggGR3ndxkSjrJQIjYDZhhDS?=
 =?us-ascii?Q?k7lJm/3uRZg2oUb535GgkYnzX+sfwxz8CwrGERRcIWrvq6l76lLQwtfvgrs1?=
 =?us-ascii?Q?Rk4u6trlFMOIxf1TstWoOw45aDXzcjisXNPm8rpAYHyfa3EfMyQCeL07OWt0?=
 =?us-ascii?Q?oPtMW+BOd7yqAvhaGP5taa+8R/49gmj+nNG754BQknFdfnfJ6z8FX0E+eWP8?=
 =?us-ascii?Q?CM9/HaJS87y9WfLw2g3oOkrr4MIPl566bu7mQ0yrKKF3/5gFTjqwHZFMcd+s?=
 =?us-ascii?Q?2qH/BI2EVAqkumaaY+bH2YckOEUrTmXHknxUw7QDlD/M8r1zAQQ0vSG8S+7t?=
 =?us-ascii?Q?RRiLVKRccEXJkk34X+9BWHi4OCJ+L4MBs3DoE+gXXNpowxJcvfEZEvuRCHCP?=
 =?us-ascii?Q?FtQRHI8Jrot8MeKQxNRZN80wuDYM/LhzyTz0WhXjXMnS/D5eZ2NIu2RooCNx?=
 =?us-ascii?Q?QOnxWIstyd6Uzvue2zL0iehM2qtnemUqsy64iqaLs1Z6d2KR1suY2c7MjOI7?=
 =?us-ascii?Q?cetC9kXVDcQBB5NhbpG6ZCnNVkjPImY9EYr+HGJdONlwlplst9/ZweugDDJU?=
 =?us-ascii?Q?rCcwX78S3+N+q/27jDX1SxP/RE90wUOEpFP2bze8l2Iv5cvI95O1NP5dVhh6?=
 =?us-ascii?Q?KcM3FilGwA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d788f4c-2031-43df-07c3-08dec8856d1e
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:52.1747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOlLG/HJUEF/OisjG0xOeLXK5BRbSCOtl9+Y+ulOtin4FwtD/+iFUYY0weW3nHe5/phSntYar4gDTmR35pDb7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64691-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,nxp.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1B4A679BA9

This patch adds new v4l2 meta formats definitions and descriptions used by
neoisp driver for the parameters and statistics buffers:
 - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
extensible parameters structure, supporting a non-fixed-size buffer and
changeable ISP configuration blocks.
 - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
extensible statistics structure, supporting a non-fixed-size buffer
and changeable ISP statistics blocks.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..acc60dc69d31 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:	descr = "NXP Neo ISP ext 3A Parameters"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_STATS:	descr = "NXP Neo ISP ext 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..e1656520b312 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for NXP NEOISP sub-system */
+#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS	v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Extensible Parameters */
+#define V4L2_META_FMT_NEO_ISP_EXT_STATS		v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Extensible Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.53.0


