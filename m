Return-Path: <linux-media+bounces-65053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e1/pCRCDMWoLlQUAu9opvQ
	(envelope-from <linux-media+bounces-65053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:08:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C8692C3F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=DkHlLLfr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65053-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65053-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4958430579F1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9368E47B401;
	Tue, 16 Jun 2026 17:06:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F8A47AF42;
	Tue, 16 Jun 2026 17:06:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629611; cv=fail; b=gR8MiFG1V0UPoTjKlbCziYzq5tc1gnaJRQc6Li8ZlkKW66OW/TbiMbcH9MeQCodXrglcWC0d5H7qbCEXExoeVw4oAfbV9A4WEbgYUFr5MuaClB5TqluVdWUdOLBakej7O7ZqQWurtf9qjdc6WBOhDDz1uYCh7fapHjIDyq48/m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629611; c=relaxed/simple;
	bh=a4vIihh54B8hNFJakXzc9I2pMFBjPngEITK1hlyCJ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JHN0UTOwFAo14dI1hwGff2L1mMV9jFhPr7mwvo7CZ+H0RolHPsF1/Y0z4TuDBZtgc7t4ElQM/LJbK9hpqcDIMUlFiSC6vVmDC8OSG0XsN1hcoX7sVJT/sT/YTBibGAnw85L3Fe6GQC1Xg6XN6ffSie+ZcgOm5GFKJxgS7x2Rbe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DkHlLLfr; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlOWl8r23UnbUdEvENBjwjR5vmU9ZByGL+lK0TDn6t0MPH+YsafmrBIgu0zgL/qnabFZhQhRtYcAdzU4sqOAoDaHznHwZUm51WElFAW+M6/R7/gtpRKCdAXwO9qEvPPxSthkvcApgZ64GCFe3urx6pS3NX93iXEAhZHsbbbRQYl1casSQTDlBop/WDT9cyIU39ttfqYyHWspcMpHawz+pRG5UAEUqR0ZpFPfkQ7wtD6ueSM0tvvGc1NuviI8uzWu7HdeJy0ezhN2V4USO8MR2jz1rZgbFZKKCPk2LrRYJsHOGDiMYtMxxF0eRNaN3UOY+HcsSazUgQczlivdyR5PQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9chuVajygDbMOhx7/W1rSCW57bd5FKC+3ds2V243a+E=;
 b=E5cvDGO06Ftyw9nkdlxH3PLVvMAkmytcoTo4zDn4xT0zX4fiNHmH40O/Q4COws9VW5dLyHgTUbeTNawtzWZ+9cgivhUwOoOMz+u95yS0UxWXNPHLab7mDuXY5S6KAe5HekA5s+K2ZqU4seuX6kCqAkWtQLRShQYAZoOP42S53HrCshZa5ygDrZ+pvhA5e+uH392NsYn6TqjWWlFElY2fGAkSmL6bUyfPV67flb6Le+9pMkMDpZyS0krZDnCuglYsO7AK+rHSiUohozIu05yoHNBysmkUsp2pAPg5CZtRKjxmzsegasoYwfjlKXjPo78f7XMRhd6EQ+abbKuyC+9Jhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9chuVajygDbMOhx7/W1rSCW57bd5FKC+3ds2V243a+E=;
 b=DkHlLLfrXujzE4mRKjIvR1j2qoi27ow0gZm4cEN/lS8H8arRlKjDVUX4DdzOHTqbkzRuEEPzh7aPEEYtenk8X32JYysttweFHL5GiG48av8HoGUBKdQocznpeD181oKokde5JttQOjlseCDCJPGoMi3IVNPjraQDHedPRgyphUA=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] media: rzg2l-cru: Drop stop streaming function
Date: Tue, 16 Jun 2026 19:05:34 +0200
Message-ID: <20260616170542.447804-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: cfac26cf-f37c-4554-95b8-08decbc9a662
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	QhOK1Sh8yWgQaYn3flSyA08aXSnx7QhdDsRutCNmkGXobV6CxJ1aCj2+QC4/aFcrK2na/boSOVZBD5vOSQo8h1WRVafddGO6/9OMF+EdA7uMwovwx6JhLXenvGs6zKuwGCw6vxuK+g4j4c15NyqxplRuM6SKf33bU/+GOQsb+NmQHe5j/McO+oqlKQmr5k4asUb3th1L66Cu2xGNhBarzGLXIKE3OnXVq5C+O/e7jJ+OMo05Jb68k711Ma8NIUoD+L1yFykqv5rHgr34Vh9J1qukzsbNwHueACGqktAVp1vXVrHJqsgi07ebJxYxD9A6V2FM1wKyTP9F+4sV2W+sxG2adI4tZqRiPcEmfPABN/r1YTdWBGcTvaflK7FZaix7JqAPU1icqkmHas2RRlOOFwLwo8C7pvD8XblPJE8XUcfzANw2h66TZS5ftm6xR1ObKjiZrQFN1uzgI7oNS4z0h/YdNTlw+P/qBl4clLgOllsL5v2MFddxNpd2BXIPETT3rnhgY/qG3xSoI/C5HXb0TCiVzdKHVGqVsUztBCAcCyI44jKr0KbuOvXeXKwfLIVvwC0rRBoTzaZvEvE2v/QZLEUygppAk7+iPDYDIkXDipKA3xEsiW0WnjNiNCtO7yg6AKIp3RpoE+kTC15wDphKNzxUhOX83RTYtd4yjHeWcglYTRE2iZ9nZtzAXhYUFkW7+amrZDRNc2evZ1nx42TdiedBgem9tjQZdtzeO6KZKPPfQp0X6QTGoTIJ3NB+8sz8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a927xRdoYMDV7ZMpyMWwlD/hVev02kpNZndPHp/nly012FPmXZK3DP7J/bWp?=
 =?us-ascii?Q?8ZS4Bg30U2hDNRx5vB4+fd1dDDeLmMhFd13tyL6Xk3v5FaQmS+ij7DURjLW3?=
 =?us-ascii?Q?Of/Kkn4lwu15w03HyL73sfwh3ebXQ/SZHTdd3dZlW+yOEK61WSsTaserO+Hm?=
 =?us-ascii?Q?hXrOL8MhLZbk5ka3iA5ItVN2Q7/skEZ8eaosPCCmp4LkgCJIMJ2QijSxvUqv?=
 =?us-ascii?Q?yInm+C4EeZWL1cLIA7IDXIe3Ogu3FdNO/MKP/leB5As1rdCOGFgsrJdLKYWA?=
 =?us-ascii?Q?773U+5TKClyay9hLFBD+XxPlOwEmsZyAXLX55ZBaUWcypmuY54wHfnIHxauA?=
 =?us-ascii?Q?m/7nPBggKl32BIkd83y6x4UW/GFV9HBvcQMXev5fxxz11TPTFp25Ohwu4DW/?=
 =?us-ascii?Q?nIkgG3GZy7I0dW97N3ZV55zhY+KNRDUTgAyD76JrrVW0vMycvMESLoN63SIv?=
 =?us-ascii?Q?un47+wx/MYOPxlUVD4j20KyA0aT09Lk2irJddOmyIjzOkcalyZISKEgXUKe9?=
 =?us-ascii?Q?gj6Xv2cNLB5O0phZoIlKPdFKPVXvLt9wLwnc1fdFCqwYz6AFAV4MmHAATUp1?=
 =?us-ascii?Q?sFixk/vaGOHWEKUX2opQEcHGvYnOleysNwu2rHpf4wVo1YfrDY7g2JA/Dvae?=
 =?us-ascii?Q?jHanFTd0SwiFk5wGL2BNdF9sdOMlH/HQio4jEMcjs5b7Bwh/iA/MUfLkQUF6?=
 =?us-ascii?Q?JjpBWedtY71UiFSkkAm1wOzzZUN6lUNDX0TYBZSsn4QKwbDqAo/oLocZdXAO?=
 =?us-ascii?Q?Nce91uIUJYW76NYBnr6azrUDnPKnUQ1/F3Sn9tUDtjyH5x2dqClrZbgtlZUG?=
 =?us-ascii?Q?g2qwDwvECJAsNZCR516M+DXZxvKrAn5STVGwyRH3HyStyVg158GwF+0CZiQ0?=
 =?us-ascii?Q?MuXMphhXaFTYfB5/iUpxHPtvIakFmA23EdOQ3Pe5cmlqrYKbirmoo+Do9LIl?=
 =?us-ascii?Q?24wCCjw90EK+ohsyCZ9E/epG0uM0f78ShZSl8e9Ved6hqzgUClBUlT6IuW62?=
 =?us-ascii?Q?XJ1FPBx4DX7V1kC+ZxaxjxbEytdgV2q8xyQh7OCGzzjOoi8+58IxUze/bzZQ?=
 =?us-ascii?Q?ysoIl8yYqDFSSwww3SoIox4uGR8ZHrJJblgiUif8b7h67sszlXyE5wFR9v8A?=
 =?us-ascii?Q?jBz0fwo6OfnqVsQ/Kz+0/T3yV97xwTd1c9l+jpcyZm+XGRjIeyn3BVGJuV+V?=
 =?us-ascii?Q?3/VldIRfhEHdBxiYJWvcIi5CkwzJcPyNn4Zz52T8gEeKVIDC4i74t8Pyoosi?=
 =?us-ascii?Q?nfbrZfWCQhc4wD8noDHCskTMYkKixpc29ILrMTVN2n/ltngHme5gXiX6zx8w?=
 =?us-ascii?Q?bmM2Zh8OQ0PKXwKp/0dR+VFIIKcWJH49wkCX8R0IkGoSBRxghOGcA1h6ds/t?=
 =?us-ascii?Q?9d0Xw5pjejewWy1LxoKYgVZNkL+CSW1ogiZe1BoVDBo8xdI2MQcZyTne0ls+?=
 =?us-ascii?Q?P95rOmmzm1umvFHhmOCxHCb7kr0GHbPytYdlAu/hVBvMXySC3UDuYSpyUAzk?=
 =?us-ascii?Q?Owp8466954gPYc5ljGsrxKVfdnS43zoOxvCTn83kgPlBwdDk0qXwmBC72Cab?=
 =?us-ascii?Q?1b4Sm+13I9+dtD1P4QUa7CKLsRdgejScJOkMSOnu6Ew1N5GDlopzEVnXdMe1?=
 =?us-ascii?Q?96riVTnwFtrJiPTNEvRCcg7xKtX0vxaH8GS8Sa5SwxfC7pFi2iASUA1Tsvr3?=
 =?us-ascii?Q?TjeW+yKpQzHt04eXkXp2ZB/jNIR7ZbpyvXnSZye7rLeZ054qscJuwiDAjplh?=
 =?us-ascii?Q?Ami7nqJmTuxDLjZUE4D84nSFlSCKB0z0uu3PrKCtFHb7K0hCmb64?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfac26cf-f37c-4554-95b8-08decbc9a662
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:47.7193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XFptgub6XeNLif0kiWpMKD47EsiaOSzwGWXKd/U5K/o2IxmizCsiwmJH3AvY5KnqpvT9qZuXMuhNwepTbKAVuH0v/T1S4EVwk24TfYgm278F6J59qmiZmvpYMTYqTpS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65053-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC0C8692C3F

Drop rzg2l_cru_stop_streaming() function and replace that with the
direct call to rzg2l_cru_set_stream(cru, 0).

This is a refactoring with no functional changes.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index bf61a74f8f74..e283d9b69342 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -583,11 +583,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 	return ret;
 }
 
-static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
-{
-	rzg2l_cru_set_stream(cru, 0);
-}
-
 irqreturn_t rzg2l_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
@@ -736,7 +731,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
 
-	rzg2l_cru_stop_streaming(cru);
+	rzg2l_cru_set_stream(cru, 0);
 
 	/* Free scratch buffer */
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
-- 
2.54.0


