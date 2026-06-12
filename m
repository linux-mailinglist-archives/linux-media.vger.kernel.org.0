Return-Path: <linux-media+bounces-64689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 37ffLKUILGohKAQAu9opvQ
	(envelope-from <linux-media+bounces-64689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:24:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CD679C42
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:24:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=JdE9btX7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64689-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64689-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68118331AA78
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63DE3EDACB;
	Fri, 12 Jun 2026 13:20:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CAE3ED3BA;
	Fri, 12 Jun 2026 13:20:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270454; cv=fail; b=reCbO3iOAS53sOqFm4S4neMnb0sXdl/y37sJEhd0zAKNUVp5Ku1JGf8erCJalya5TbXjLfN6gkvBUlq1OVFs+T9x/zAF0jp7ChM/s0+R4tDLHfEdJz8aLAMaPx38pn7OgmwID9V9BoOlr5rlW+0NNlvjUziGI4PGIbpZ0Lk/XKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270454; c=relaxed/simple;
	bh=eYNfLurK286fJvZyKW3NZxKIvsueugnvR3kUNaHz3yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qDuVkSkqML7aH2xyp3HRrItssFWl1nXldY/CjdkkNW3Xmx80y3T1BNLz2vkNzZCCdLIE81LfQvOCG0Rr1VEi734yen0X5fBW2ehSg0sxS4foNzi1xgL0Hhgx+B5jAX3lDGyH3ImMfcY69G4xDU6xVV69kDRnzq9HvZHuBl1hYbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JdE9btX7; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayiadlRQ17plxylF4fr5uBgMEpKktrlSzZ4NJhsYN/VO3MFxNc8KGEtB+8cH2HkVvX2nOUORwZ7ieSNAcl4PjaMmXB51tA0/IpOuQt6SoXvM+xA51f6qcThRxwF9AXxvSTBUHQPApuZMNS2k2FrGMQg9bgWpfXdM9/KHUTgBkwiBnLvMFWVgTsGBqyLAemlitFKtbTYTVVo2KabtJgXRpFa78BOASdfRSUovVhWWHhzbN09unEvnngJydirddAW5QS6hcDLMWpPEDBiS50eba4QN3T2dsSPF8Ef8wRCZqXHrRIqL2bG3c3mol6bQ1/VJJxjb+b1w5Tpn4jiP+g672Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7+/PrI/CHd1t5lfruSMnN7Tk17vorCA4fbH59otp24=;
 b=YuGO0yS31UhVOQYavEIx0hkEPSegZ8030FwOVcyt9nEmZXpTNsz5P6jwqwmdww2sXxIJN0dBy9GCklaMR9TBIEcJHFj0DL5fB+LuBLiNq1dYQm38qAecvp4vG2Vpo5OirFc2Qz1Odt7MmUNiUwjenc0vGqNAXgHMg10AkaF6//91W3SyGOMpD6yjPNZWiN7GHscqTxYjcq+g8B0l2wTDkJf0OePWo4lp4V1S6NyOYrla42pOcf1vcdwPTGtETi0kZ6mmHLvEvfmtMKCoTo2LU67G9h6wl3czwVhtQRgwdD/Df4Uj4MvLQdw9hpas/AOwjM3dGgyTRn1kAysrYxI0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7+/PrI/CHd1t5lfruSMnN7Tk17vorCA4fbH59otp24=;
 b=JdE9btX74lOq6DztiDeJwjTBkUvhfFaAAdDcHBu7iHOu08eOF41JFwEnhdfjZbIGnu9ED2lYDePyPkneY0PMLdbWm0DeK3g6JgtNnrjwJRDQv4HITILGq6xCoE8vXmbJh5uD+z7ApIAEvAXe9qQHYqXhaHgTAIcscrxm4EsUIyIFMprVOh4hgDwIhlwO/I1ArboDTzj/BZTDRcuIKOe6WPExbwScfdVlX+qVpEg+98u1fGAKMdmjSwXYVtqF16Ylec3y6/cyflKVS8AweaRX1dEOVraf8FLvz15gbETPah7+cUx8Ckx8QXWZ09HBXClHOcKeLtXFmD2hngbFB3NZFQ==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:20:48 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:20:48 +0000
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
Subject: [PATCH v3 1/8] dt-bindings: media: Add nxp neoisp support
Date: Fri, 12 Jun 2026 15:20:32 +0200
Message-ID: <20260612132039.2089051-2-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 415c3150-a828-4625-748e-08dec8856af0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 KUEh+5K0dUsBZUZ1iPMFaZKSIw3TsAwIEIrRoM/HPQIGD0pFC7//nZtDvEypD5jL/ji7Pf56jsF0PGB+bd8ez52PiZT7UTwdbuvEcfPXleMIiwSOjfK08YNwRpMOiyEU6Yz8ca1fAt4C2RNcPKylN/JoxQ5CyDBZkY6/wGYZdrzS/AAVL+0s1PZyvrzjNDuHYR1CsTRyqKQmLLkWfA2WZbZzVN6Hj7XFRM7Mh2dXXwhIDlnC3fOrDFajkr8/kTnvKMuxPzpEw4xGlj1LBUX1xgDMHpFIGdlydDaasezS5uOsNv/VQ6fwmJFJ36N7hG30qnTUIzlWx5gX2eJ6M/0yiKMBIsY5G4Jazz6rWTB7Rppvh5yOhnf/w4JawJ+Gora0QXIHoUW4mfwt19vo7g3nPd/u5SgghMlVc4HgOQkQqxm2fD4I1loiTc/QzCSRTE0lLFnmF0Q1E46tzXZrMaEQTua1Ur3B2eQclDZbfsEPgQw+Y6686npH/7k4dVz/kx4k1EaRTYzCHNiA1ih08dWYsAtW/cDKhd881ZZZVHlYXkWVaW+aWts3IFsMq9Ms5yvlvTIwZ1+KdUhqkUa/ew4DV5MJC29mX2ar9S4Ui8C5eJxtM/n1mEd5SyJPqytOt8EJ7JWwUlMJUTxLE+zgPr1GbNpc4YQNG9ul0pp9pzlhLVkXE6ep6XKii3Oib6hhXLNl
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uUn4yDWQ0MNiMYuvzECrm6wb/O5J2aQmF9+hvsLnp5/v2cSl1edzIMahDV0z?=
 =?us-ascii?Q?ejszwSnlMsabpKDHuwZH7EwQLOwaIJNWODrMAhPTVhrM9DfH86mFqnJyiB6z?=
 =?us-ascii?Q?WE5gURxUiM96t8WMoKKW7YGbCGaJKBV/jQZF/9Tb1B6PUiGSH6f/1wcO75iH?=
 =?us-ascii?Q?+XzCUP/+pr7IXbcQAmGRCfwXXNVryARODrsjwMCktCxMNUDFqOmJA2hjcFr0?=
 =?us-ascii?Q?4S6fLIKt5DPw1FKqzb9g0O1H4lpt+2M+BWmhKEzuSBEaBvOioqFkypm1PGYN?=
 =?us-ascii?Q?OwK+eDYMD2CRXXa846ojrJjOBx0Lwyh8S8UpHnysOxZoSFUh2qyI6ST49+xq?=
 =?us-ascii?Q?AjYdwRIuqY0NTamusN6yKrvjwMonFiMmbQq7jPe66MuJBgB0qOV/txaTgQQj?=
 =?us-ascii?Q?Nb7VQSqYGmEKcL2HLg9EYbU7bJO4PbyT6+SJajQ0RCVsEFRPNhhyZM81naNT?=
 =?us-ascii?Q?tlLxqauQ5Cs9ln3zmfnJSWIux4JOknkM7YiPSzh+tfXQiyyC++xlz4TlTv67?=
 =?us-ascii?Q?5d7BiLT1tTV9n2Ek47AbnfBrnnztKxTmU/SYomVA4D4/xqV5qGadn8MKu/vy?=
 =?us-ascii?Q?Oc8+740wBoJJn7U4H1O6E5m1YJeHNHFstYxzIf+Zz6CmBiDmuZxzNtUdKnCD?=
 =?us-ascii?Q?jXSI2Y7j0zm6a4H5PxoNvAbJPpX5eEy+UE0lZeJnMb34lMG63ylZT7I3w+mC?=
 =?us-ascii?Q?wGF74VmWHIPnQuwaN72Fmffh99Kv7YQr+AzQAgOpEKLnlSoZsjzVHYGhVid8?=
 =?us-ascii?Q?74ZxITFVpfy134pmASMdKy5DJQJwcv9qhXVKmoFU6QUSRkXjwlh+d1vJxKc/?=
 =?us-ascii?Q?KJm9vgp4kFnTFI6/7cXHDRlMtGINrCobcfyYoODKc3TYeyTnJ9BvZ3KrsACj?=
 =?us-ascii?Q?Z7/g7Rl/myHphTV9SRULndpUd4zxu0d4qaL8DFtENq7NoFKr+fOPAjhEY9jW?=
 =?us-ascii?Q?IDO40tMKU2qsvTN5ksRy3lTH9fQH0mbjgl2es1RrBruxKsKGmnCbBrnRcZOI?=
 =?us-ascii?Q?GwsYnjb9BDY9ulkeQ43c1G4+TCa9CJJpQZy2YQU3w5VQYsau13UbdQ9/cmUM?=
 =?us-ascii?Q?kfFlwfLQN0TxamlnFyUcrMi7aUlI3Mp6mC36DwdABSE3rRpkuaZt1Ul3pfZ0?=
 =?us-ascii?Q?KEZqXcQPEN1F4OiONKnSjDmKL85pU2JyWZMU5Lndq8obgrKG8+rWZ0SXIElR?=
 =?us-ascii?Q?i+uvFTbJD7XhQuJ7kL5sXqldD4jUyVn2rdr52vkjbvbrIkBBgjz4LWwmBtNd?=
 =?us-ascii?Q?48abePGY08piGB+v5rx7in3GsGJCq+cIA0Bl2lCgAAhJqemyvX4Yb295aT2N?=
 =?us-ascii?Q?KmKPFYzp2aaYdG4qRJdvomZyoC6V1CNKG88s4GSgibaV4ejiowWUOAS3lnp/?=
 =?us-ascii?Q?ueDBkb6Rdeze9mJ4UQ+HEdkBH5aC2Jt7orz3Z6qfqEh1hBK7h014+qQ0eQYD?=
 =?us-ascii?Q?N8qwVW+R28YHGP/zsGHipJhyFXVkHnMc0mNOqzjH37jFfiZEvs2VzC5KvYMm?=
 =?us-ascii?Q?bDptA+k7eqGVOVbDgV/hcQZK3EGW9ZVkkkgVBJCxqkmDfsl7LjH+aM6b7lpl?=
 =?us-ascii?Q?6a56MGNVfuWOUDezJapnHB2+p4wcQSjliwHAxneWolN89IRrollbyPy2GMsP?=
 =?us-ascii?Q?gkizqS5w+wdMoGpwhpNu/g6f60jvNsGsNuiuFI55SnL73jn7BSRDRHBm6qkh?=
 =?us-ascii?Q?u0AxjHqua65dj12+bwrd+ZAuuFnYksEBFHnMXzDioQESjKzRcZkRu0IJnFNI?=
 =?us-ascii?Q?YRpjADagiQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415c3150-a828-4625-748e-08dec8856af0
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:48.5330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBluzfoJ4Yw3lip6NZPwYSzCYBPiXF1P42hacw2tmDP1MDzCb9nfUIKWPU5esxCfTjQnqhvaLAyqkUZ87Lagsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64689-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,nxp.com:dkim,nxp.com:email,nxp.com:mid,nxp.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 340CD679C42

Add the yaml binding for NXP's Neo Image Signal Processor (ISP).

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
new file mode 100644
index 000000000000..458c4e4d640d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-neoisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP NEOISP Image Signal Processing Pipeline
+
+maintainers:
+  - Antoine Bouyer <antoine.bouyer@nxp.com>
+
+description:
+  The NXP NEOISP performs a set of image processing tasks on the RAW camera
+  stream and provides RGB or YUV enhanced image.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-neoisp
+
+  reg:
+    items:
+      - description: The configuration registers
+      - description: ISP local memories
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: camcm0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp@4ae00000 {
+        compatible = "nxp,imx95-neoisp";
+        reg = <0x4ae00000 0x8000>,
+              <0x4afe0000 0x10000>;
+        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&gic>;
+        clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
+        clock-names = "camcm0";
+        power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
+    };
-- 
2.53.0


