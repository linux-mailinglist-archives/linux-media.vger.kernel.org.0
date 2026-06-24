Return-Path: <linux-media+bounces-65510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kFd+NjCGO2riZAgAu9opvQ
	(envelope-from <linux-media+bounces-65510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:24:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FF6BC221
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=DCYFTDU8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65510-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65510-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E1E33052E49
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C1D3AFB1A;
	Wed, 24 Jun 2026 07:22:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122AB3AEB38;
	Wed, 24 Jun 2026 07:21:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285723; cv=fail; b=iD8HqiU2jLp+m4EDkh2RYD9/8+YVmfGM9az26VZoxEBbuvf9/xl8Gscw7Rdby6xTfkY1JZ/4tM2eZfZEB7eMW/mpeBJ9zLAZzRn1PU/riEoJbJJ/dkfYBE+2ktyeWAybfwvYVh3LZEMrEqW1LthsFNbDvwxcF1uwb+nTNBZrdOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285723; c=relaxed/simple;
	bh=5Hmrjp01hDMn+Xo04rzEqZneTEdjA0jQwp6WD2+/HF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mLPIagj+/rliSaVuBngXEn4AyCxYrhUulQW4r+1wJtXyL74RsjeAkpNoAQkIVnYHuy5H841C1HmI9HrVS1AiIDfyUdlWy00s9Cu8TODbkhWrv5V2RujXqDvpyhpe+Lur08WRBZFBPkFhr5sviRiXQP/i8EynlzQNHKIC/LuInzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DCYFTDU8; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFIMyFpVzUh3tO6KmWdPAbnd7doDr0mM6HD4qPkRCRsmDWbda3D16a9iFUBxyLT0MxpMu5MEQDH0oa4iGTY4gw7ppA7/fQtK45qpTTU4+1q2/G11mmgIQb/pwU4Ysx3jHpfy9pWImVQNJex9QRIvBvNro2VAy3BoB+xVofK+wZX40xUNd4KM1ww1v/xuEImjJdT8AvDS3MSvqaG0JJ5GbAoSD55HfmEq2rXrdPuK6LVa94XQW8BQ/auNq2KV/0yoGgsrXI5ZN6f8BAJSd+JvmzOF8KWvxuQICj8XZOFROM5RxF3zFa+EVLu3TmMwxMB96igtnBQ1X2K7zsX1saYzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJp+FskcJzi6zPtOQmUraXnbp0YPahLgBFMlKidlN8Y=;
 b=af0UQnsPc4hMWX75rsBxBUIn/Ym451mqneL0PytaSAZ0KQkvSNlpv9XXvqk0I8WqKeMTG8g0li55+vxTTJ2lTuqn78QZHetN04aFJQ+QfVPPlNyLdPtRqyVBNrZUN5Xi5cVR/6Ewx0Tqm2H3BcyyIYiImMpAOgCbAow9r2RUwT/xqfnGQhynYkwm/c3NXuQtF9UK/xapUttYix6gLUi8yEDmdzoBHd/5s6vVTrL70qCcVWK9a04v5JQnHJNLy1XOIBZ80HldPy9NBhZhGSj35bD8+UQgUu2gvJgvOWWZ+Pph70FqGPGjcp274o1apdHIjIPWmhuvHKtNia7b8VgDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJp+FskcJzi6zPtOQmUraXnbp0YPahLgBFMlKidlN8Y=;
 b=DCYFTDU89g4YlXbQCm7lord2wD6EDle5nOD4oQy7xuP1ydmAju2ZGu1Z4K7jNLfYpcNen1qvyiTYlKnO2yMr3t0JdcjE5El2hRw0cCIcHh1KSs0IKo0CTNvLZfS6lLA42l2eLfpGxQNDa3dVnSnqX3omvIt0JdvCHAqYXcZqiJA=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:21:01 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:21:01 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec node
Date: Wed, 24 Jun 2026 16:20:43 +0900
Message-Id: <20260624072043.238-10-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260624072043.238-1-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::10) To SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1c8::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2440:EE_|PUUP216MB3514:EE_
X-MS-Office365-Filtering-Correlation-Id: f8414741-1cf8-4d4f-bd2a-08ded1c1250c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	77iV/cpusQDe6tc4FefBpYJ6KCwd9Pf6bX/LfbtiHpk9Fh9H3XYQ6oC+PAbhwF+mW991o6O326txWpyXRBX/qB9+7KNmiRXGz9nojZYlp8eyHRksBgoBa/59ptw7BrB0YxWGvhNHCYs5mJrhfHvG2EO/51HXuvNvQUo1gsx35kHHlecQDsGxMuRJVJaJAW2EgdWBptxmxCrP2klRAVQiqFh6amEaQxBEpJoxwgrRk92us2nqr7WupAFR9l0cdshGlnPrWlYslR4F9GN04c0zJ7H0ROctsqgpp7gOZWCQ24U9BfDl4p8bsrfn/shj0dMqu7DcYGfIs7ziF7JH9Sa3vKEv3UyzO3OFSxuYh7SXRa6pXa+T6ZNxP/WM+WhjMSHtg6mjw7jSfI1vQEUMD1H7QGSAtm8b9x/3UEffElw7d4n6L/S2lvZgO397Qf46dlJIgImmZ60YtooRXDMTssObYwPf4FdLymAp+0cKOThLTAh9YyAkKcwK6AoOCna64X7EwvdH1Zfz+scibbW5KxFMOCSFKBr4Ldbq+MPYLxWEWLrL2H3Ia1+u7EvDWYZt0L7aeyE+WUWQv4B7nMo5olP6WT7uzaAtA332MWlOoxM9FISS0936sYTdov9oOPtE2bd2MHKDkYYDtT8jNRdW4L/CHb1zm9/pxwYOtQs8ZKKwlD7kij3BrsCoHM2iQ5gI0ODATrsO+DsmA7c70mDVw1wBvOO59l7EfCu97Az/RU9yEeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sgsHYKKecwl3pFdxVp9llQUImzfLXlt4OHEi+jyc0XaTB2DcskT8Hot/aLoV?=
 =?us-ascii?Q?eTNVgcBpz5zszpafbUYNkxFgK0qY+elUjw0mdaOcoxs5Enn2KItrSQuiPbh+?=
 =?us-ascii?Q?SfKoodKt/uc5SNtdU55WfadjsuTdmwtEAM1OjTwNXTOas7TirT2va6zBtgQo?=
 =?us-ascii?Q?nbmyWeBZ+Sidq5yNCyHe//Ijsa+tXZKF1/hUi1lDJifCpEstEnpsSxPBuR0H?=
 =?us-ascii?Q?qBe1VIrZ6c/fESTtxDL8r3tvCpJ9wo6eRmIBFDjiBgcnvPr5QujZOX3xabMh?=
 =?us-ascii?Q?cH2+n4MdYuuxQ4onsdaWehX2QDKa1wOZbr2f94mE1FYbTX0DkmZPMe6csMrS?=
 =?us-ascii?Q?fg5G0gXcAQluK7vvIBtn+AY+xc0vsUEPlJsbiX+82bvV9DtrBj+nDolrKekU?=
 =?us-ascii?Q?nQTdxNAuOPD/hvwPH8bVXzCYElPjL7GhqTPOuoGOqqCl96ekbde4bp0bttYm?=
 =?us-ascii?Q?dy35ZIvb+oyi5st0SH7eu4TDj9TloieiUGUXSJqp/e5Pl7n6e9Pk75EGSt/p?=
 =?us-ascii?Q?gH5Q7rUKc21fQnxk4JrhjyUThiDS9erco+9iqMLlaSat11DagSAh+Dfs/l6r?=
 =?us-ascii?Q?81ZLK6nPZTo/dSUyb0/myM+Xo7NP8/yJCDT9vLpvuFR4h4bf5PdqD+yGER0/?=
 =?us-ascii?Q?luUZCkvtvh6/G8YiemUV65biSbB6lm1jemph01DfsEkzCDbxVihIGbmlM3St?=
 =?us-ascii?Q?FOAxW14gclyFJsSMcPwM3/wVYveafGotvDrME7RSdC3PmAsBVmSCxnnze2HY?=
 =?us-ascii?Q?/vJ36ke46mj0PNGAGBL6Jb3xfTNLJC7g1Y/DuL9xYtP/ksa5rkHe4OCWzNdx?=
 =?us-ascii?Q?kFJKMScJ/iNXEovX2d7y15F9dOWPGXzeSR5FwySzpcqg6EXL33+lRWC58Rnu?=
 =?us-ascii?Q?CCu9wGP09PBXYzu1THoKbAy3csovyxZ+kmYSgew7JI3bsgv+9jhrWCi4JEUl?=
 =?us-ascii?Q?iXJalrH/9a1yBt6uhnRV1gXEtbNf4wDqE9CXYyIwHZHvmL2FT0ig2eK4tdK4?=
 =?us-ascii?Q?7Rk5AdxhA/0JGm+rhHMesZjQOnM2pGWzo5NVbFrvr4CbwGsRXY02YOKdBaDQ?=
 =?us-ascii?Q?daNCI7lZPkiK4Y64/f3YTkErE7THrgfq28iL2jekrnemmPq3gxZ78zMjRWUu?=
 =?us-ascii?Q?wyRxM4TuCDGKpqQVlMybLSmrOWRbmleUVJ8j2u0wRF1eCmXtDkpW+gwLc5ZW?=
 =?us-ascii?Q?P0IHSdtEJcjlengs2doK+3yI7XnAvxg8PlPYOqw0G2RIUUekgvZWhq3ms21J?=
 =?us-ascii?Q?9cuSM1rIMZTDc6l50IoJwigpxg9+VTTx7xZEgHu+LB9vAaTsxCGiR82ZXTO1?=
 =?us-ascii?Q?UjajYERox+kvqWKTy8FniZRSHpKJQIyZW7/2AkhmZG70SUHbKieR+rNAsdA2?=
 =?us-ascii?Q?4SksYFq2z76YiblC3LT8ejwqeVIbDwBCsiy3k+7n97aVmOxkEDdl8ZwwFd+s?=
 =?us-ascii?Q?o9g7qPLMOJAeQEZyDcPXIe7N5CyeIJ4DpkP4GRP851Vg+LCqb3AehcmouhvU?=
 =?us-ascii?Q?58chbH8bLXdBihBrTLDSEHOjQIT1Pg16z3brjsFoFGX9XLKeCAy53E9jRxZs?=
 =?us-ascii?Q?i5cQvvUCE75mLMGO67JPQk04VPSRLxXMkqzgkLJ0oTxbgERLnTn5FsEGrr2Z?=
 =?us-ascii?Q?re9Bal9SJLN+UON3fgF4OyLgI5S6V9f1hwgkaJHVh27fvJq+OOu8gHXpap7j?=
 =?us-ascii?Q?1D48hDiShW7kbZ+7yajvaIbVDhkKP7EGqmaOkcw3n0P21mUpYECGkb1w4gTa?=
 =?us-ascii?Q?I8yhGVeGKLMB1J+CXWrgfvMGHlOUJ6A=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8414741-1cf8-4d4f-bd2a-08ded1c1250c
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:21:01.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u90OSW8KYjw1J7dVvOe5rRe9Fk9KB1g/Kvtb5vpMhOZA9sPafXAze26MgupZ9UTccu+ObjyspQlrbHMVuN3ubX7EQWOkL4TW+936yqI9gCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65510-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 741FF6BC221

Add the Chips and Media wave633 video codec node on IMX95 SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 11 ++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 36 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..7edd1c69966a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -76,6 +76,11 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -1142,3 +1147,9 @@ &tpm6 {
 	pinctrl-0 = <&pinctrl_tpm6>;
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd..f0b2bc2be907 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -2012,6 +2012,42 @@ vpu_blk_ctrl: clock-controller@4c410000 {
 			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
 		};
 
+		vpu: video-codec@4c4c0000 {
+			compatible = "nxp,imx95-vpu";
+			reg = <0x0 0x4c4c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+			clock-names = "core", "vpublk";
+			power-domains = <&scmi_devpd IMX95_PD_VPU>,
+					<&scmi_perf IMX95_PERF_VPU>;
+			power-domain-names = "vpu", "perf";
+			#cooling-cells = <2>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			interface@4c480000 {
+				reg = <0x0 0x4c480000 0x0 0x10000>;
+				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c490000 {
+				reg = <0x0 0x4c490000 0x0 0x10000>;
+				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4a0000 {
+				reg = <0x0 0x4c4a0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4b0000 {
+				reg = <0x0 0x4c4b0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		jpegdec: jpegdec@4c500000 {
 			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
 			reg = <0x0 0x4C500000 0x0 0x00050000>;
-- 
2.31.1


