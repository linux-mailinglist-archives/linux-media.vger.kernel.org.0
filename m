Return-Path: <linux-media+bounces-63684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k9jgLHShIGoG6AAAu9opvQ
	(envelope-from <linux-media+bounces-63684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:49:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9F63B75C
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:49:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=Uqg8XPgd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63684-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63684-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCC0F3015186
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9ED4C6EE7;
	Wed,  3 Jun 2026 21:49:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74523492189;
	Wed,  3 Jun 2026 21:49:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523370; cv=fail; b=fbTlrhfLrhlE8UkyWSQIUdqKOHgrdJKRpApBWDjtbPC+wMst2JK6tbz0aUjEHUAg19c0FXxdJrDLhf9ymXehkPCsZh09plW+v/cOb6DuccRYonNaw0MsCdj4xdQpKYs18DhuHw2CmKibWOQvMPG9YejEYI681YZlTUOdNitIBPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523370; c=relaxed/simple;
	bh=k77kSTe0zkGxRepTnhP6NPquw/3Sic06OQ0rNtD/Buc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TK53gfVoh3LqMmpkr9KQBq2bNlnPnzx3Gq4sJvaDK0ztO0VHwuePEmKXUOfoiTwRdH8KZvU0qVP73O+L7jRjzsRb/fWDJb/3X/2VGlKzK5pSvyhjga+aZ3yYdaWIOmuO3yOA4Iaao/FO3INkeYF5Mb7T0g5+YfqFmp7JLNSsWRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uqg8XPgd; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5uHTBljA1BUfwEUM3G/gFuidtEAtaKV3l0HNhdlkVcZj7Ku3NP64h69MwM98JCTq8Uxyj7MNp6/dZ8DdyYZkpjVRZ4ehkrQAfRnazuHX7gVXxN+RU/f63KCEHnQ3gdC2I4xV/3cmzDmz5S2XWUNLMqAXmO5Krkas/orWSsXseuw/aYWz6eaMPcOklur/ZvNAosAQxo9FxajAJNX26i0SHfvKChkYoSFhsjtRnzL/lSm4Ni4gCacoZEDAoSJzZ+vQKBSRvGY1t1XHsKvLiFlS5f+hHQl4q7B0DF7Me1wmy7c5Vbgxx5jKfxSrfVu3EPU+YKGcX2qn1/MxXIfCUTc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=do12M2aInm/i5vNI7MRYF3OdfGy4l4ePULfrcIUIGMc=;
 b=EO0v3k/0XaqQEyUjTMaCcYTaAUN8i83jgCHIKWLYl/tqLiD3AnACBDeYw9Dtffsx4arpdB3TRkEC4eV7UgD+Xt4YiHe2p83f24IWOp0tkoDVLlAtI/EOThOHor+F1mT9/099ljbuBwmIiCwFcslCPnDPmlWtBbpbf+E6yGydGVoo8W9LkJY9Ixqm7UBl9tgtbIF2ZvLFVYuukP0zS2iEjQyLSvmkuo69kC6wz4pNitO2rWhVf7XxWLKGui5F+dOVCxwA+gNrm62Xd1GhDfYZARqpJtNMDnTr1bfk5xbb69mIJxSB4HmqfYvk4DJYT6oxzQ2xRb2wS9/QJvf89HFmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=do12M2aInm/i5vNI7MRYF3OdfGy4l4ePULfrcIUIGMc=;
 b=Uqg8XPgdyoIM3/vCBwxhfwA1ZorquobAapj0aPSWwyC4clPUNe2B9EgcrNLJa+prHAgv8ppmm1QZ1fG5P1XVGuQL3K5fMPXqKT/YQNxmnkqfKrm+0dKexynTbqOist8/Lxee0WlWatIWeZZc4Fvs7FUuSNCH69JTYK9gr0KaeMHXJQ8KPCmnf3DjESb5L6DxyO7GxGcz61JciXZJpqRTxJU5CDpADeXXD2pldHRwLSmjACobo7Lmru1cFATQhxUmF1w8ACsoBOsmBb2FaLK4DIAWMPzRexG8S66Yj+OPDnbFqJZaUtFif/2qikGM7Eo1HMa992ft5eT6GCafLokKXg==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:49:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:49:24 +0000
Date: Wed, 3 Jun 2026 17:49:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Message-ID: <aiChW5QOCeU8Qx99@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-4-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-qcom-cphy-v6-4-e50de0b557a8@ixit.cz>
X-ClientProxiedBy: PH8PR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4f8d45-6f76-46d7-76c7-08dec1b9fa0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014|11063799006|4143699003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fzrfdzZMgd6gNouNY7l3QS9mr+4rQF5cRQ46dkbgXC1pO57uJ9A3R0rOlLPKVtcdhqR6bXLf6SSAq/WBqZgR9wxljkhHjjL+Ycs7remZBQ6uvUfzhlbXa1IOGv9rr4BiMfZYEjjwvnov5GO/vo4ZLJY/1Mbe95KfZs4ft1y9k2hblgazQ1aS812ERbk1K1ReQ2hTiQ+MWmL4DJuQD5GmdiVurlA1WLYaEK479AbjxNCGf3DIRevPFM7KF3zMb476QdPFVXpzd1MGzwtZ5X+Zkfv5f3t4uUAWIDJ1CsCf6VJ+8kHfBf5+bR2KP5kPouhRNyDRNfEQL2WZESh+DxUorJjf9Lm8Ja5pMaY0XGWSKwf8+uSHkvtZhfTsK3S0Mq9sbkUEdP8NhDvjCesJyUWrG3UEOMY6mWuq5jQZXy9Mg32nTBvD8qE690UwrJbkPb5JKlSt+viXv+3SDc0XUXUy4CzYcsxCFuzekVFDWMpPWyUQ+dOF2EJx0SEqnJcFHCu4w7aA7txH/fS1CDrBrRrGGcnhdU1Ivnzned7R2/0OkFM0JlfkyOMkQ5mMcLRkZy23EsHRi/nG274HZxgzAKFQ1sfdaRx5O/S1a6iG2fbFV4TSIV6L3T9706HNPK0H0esvvgG3w7l5kSW34p5tg94SNVcKcSKPqXfpXkGP1Ojn694g4Z440Zg2CNvGshXif29IeFbja8oaftj3TDTNj36ufXMYH7KVVvwCDdDidrURnzyo15BHRpjVI34zErdleRce
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014)(11063799006)(4143699003)(56012099006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zVr+t7iwLdkUrcuzJuVooljl6teS+HXD1/9HE9qkZ7okV7dkjI4818a53605?=
 =?us-ascii?Q?3lWhkiHervDWotsIlxUSs8IXZoVMTTKUQnicpoUQ+YSNnxll/o4yFV87B5Ad?=
 =?us-ascii?Q?3JfWj9yEbd7VpwZMoVqc/V0KgREw8LEvWlog/opLd+6Uo8DU46jDgc7DX+Us?=
 =?us-ascii?Q?skA1ZOsNPFuxvU8GtT9/XNJDqqcyR2K7pG6fqf9VI1br2+YgX2dBMiS+nT+h?=
 =?us-ascii?Q?xb0SnwIviRwM1TA0/d5cPdGAJ8QaKFiKgUVn/yzK/vFIIdJBNi5l6iXgCPap?=
 =?us-ascii?Q?roScWM+4rPVCag+U6+HgBRNHHmoLuXi3NLmNkMqSJpkEmvmznqkc6P28nB2f?=
 =?us-ascii?Q?B5yP1JxLolyurURbzg1jiotKLjtS2Kfm6QVprkpr9Lkv8VSR7TxQ1BaLxFyG?=
 =?us-ascii?Q?DMXKbaVu2niE2z2whOgDfUz4Q33LmNlPm70kRXtaW4JXJI/RuqlGNzhYh4jS?=
 =?us-ascii?Q?0SddPQMxFygr/VDVWvafFHbbD/KWKACszC9Z0O3bPVJSpF5K1A3b4dejEHBR?=
 =?us-ascii?Q?TVuSjaebd0v8jeVVTAaWFNHmNxMg3fI6m6pfuTvW2kVgeEyP8nVyVFdtt72/?=
 =?us-ascii?Q?TK7OKfeMYLPtKZLMJ578XWlg4qEVvL6DLVQ3C26sg0w0hRGyf4L+4hiqZolN?=
 =?us-ascii?Q?bieXT9qKtpdpR0Uy8bf6S3mzy5HOPWnnpD9TxFEXO3jKUHw+c0xCdKUdKyp1?=
 =?us-ascii?Q?w4MCrfQW87cPJemJqukPNtkhRsrfVDeHF+n13R+jCwYPwoenFEDBDuPj2dVT?=
 =?us-ascii?Q?iK1e1U5kn3FwSnEsj9xjPD6urVHGXSv50theQjAh5J5vclp/E6dAvcoyKFnv?=
 =?us-ascii?Q?pqoPXNSy1+8M5rroZUDV8AHacSMXNaz6mMNIEBL24rEEVOMNGx1RDEy2W8PH?=
 =?us-ascii?Q?G17pIu8p3Js2yMR2nRi1giRrxC6ffGF+fYsg5M+GpQhO/SkXME123vbZ2KY3?=
 =?us-ascii?Q?S7siiqMvNGV66l2/gqwFaD7AYsdYVUqRYL9EQbFRG+QATW3JHGqweiR9tEmS?=
 =?us-ascii?Q?xYrMiVIdoM8EYoTYdPWMNNjE8HDNJf4OCFl3xzEsvPI6UYmmnYVFVPTKoIzs?=
 =?us-ascii?Q?YMx4FyoHMUnZjdZ6k1Bwn4HzXL0+vT8WG6ZXcK0tEwE8i/K5aYGn6Od9aNAn?=
 =?us-ascii?Q?bK1WQFEdKs1JvGCmM6XHNtbGU1Cy0xOFTrkFQky+onK/vZPCEW/sqrkDu5Mn?=
 =?us-ascii?Q?RizodcFYW1PsZ3aEcakBIrWp+x83OCOk1IwaJmqxu7+vHuQZtmUlSOhqG4x7?=
 =?us-ascii?Q?XE10JAianoZQAVuIHREpMKbP5dOZHpBuEhqDP79VDPftNayqaUc6St7AbwR4?=
 =?us-ascii?Q?HsjvX9aFemhIJXC3/cI7ZOAYIa9+I4Ys75euKB5y1BLJP2CjO+d00W5ozAXg?=
 =?us-ascii?Q?LET7YaLn1/6d2jgNScFOMVGbUY8Mg7lclagKQPkRT5BILEaUWu7T9bkeurrl?=
 =?us-ascii?Q?rvDYhg3hc8KweXPxOlQ9UJLFE6mA2iNDF4pertw27neMaPjoSBpIab1kuczK?=
 =?us-ascii?Q?p4k2+F7kN5HPDkNZBU3vOEMNg54zYnBjF6TGqr++MYzxybF8QB8gPQtJTErS?=
 =?us-ascii?Q?BIftwWZNjGdIi4IY7F1ojtmqzAn81VhieH9VfD0vVV//PJGkVGM9WszXSVEM?=
 =?us-ascii?Q?GVS32R32lE68azR5XSChCw99yVWImu92vk/WenFaDt+669PZkSVfAQ4UGFGc?=
 =?us-ascii?Q?Wc57E2vN1ci25XHdhyjTlAOvik7nRWO1DEVsgMoxuBmQCtLjempzFSjZv9OP?=
 =?us-ascii?Q?pgeZaGas4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4f8d45-6f76-46d7-76c7-08dec1b9fa0e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:49:24.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YY6UYHsYqBeb7FP6pmnSbtC7+s/QVx6YCNQAPo0cQNIo854XN5vC3iwDx1T6Ed1jR+iz8jkrzjBgIIOU9OWoTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63684-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:from_mime,nxp.com:email,ixit.cz:email,vger.kernel.org:from_smtp,linaro.org:email,lizhi-Precision-Tower-5810:mid,protonmail.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5A9F63B75C

On Wed, Jun 03, 2026 at 01:30:42AM +0200, David Heidelberg wrote:
> The lanes must not be initialized before the driver has access to
> the lane configuration, as it depends on whether D-PHY or C-PHY mode
> is in use. Move the lane initialization to csiphy_lanes_enable which is
> called when the configuration structures are available.
>
> Co-developed-by: Petr Hodina <phodina@protonmail.com>
> Signed-off-by: Petr Hodina <phodina@protonmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 131 +++++++++++++++------
>  1 file changed, 93 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 15876eb973718..938c365eb352f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1163,16 +1163,108 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  				s64 link_freq, u8 lane_mask)
>  {
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
> +		break;
> +	case CAMSS_2290:
> +	case CAMSS_6150:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
> +		break;
> +	case CAMSS_6350:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm6350[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
> +		}
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm8250[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		}
> +		break;
> +	case CAMSS_8280XP:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
> +		break;
> +	case CAMSS_X1E80100:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
> +		break;
> +	case CAMSS_8550:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
> +		break;
> +	case CAMSS_8650:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
> +		break;
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!regs->lane_regs && c->phy_cfg == V4L2_MBUS_CSI2_CPHY)
> +		WARN_ONCE(1, "Missing lane_regs definition for C-PHY!\n");
> +
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>
>  	val = 0;
>
>  	switch (c->phy_cfg) {
>  	case V4L2_MBUS_CSI2_CPHY:
>  		for (i = 0; i < c->num_data; i++)
>  			val |= BIT((c->data[i].pos * 2) + 1);
> @@ -1231,63 +1323,26 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  	struct device *dev = csiphy->camss->dev;
>  	struct csiphy_device_regs *regs;
>
>  	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
>  	if (!regs)
>  		return -ENOMEM;
>
>  	csiphy->regs = regs;
> -	regs->offset = 0x800;
>  	regs->common_status_offset = 0xb0;
>
>  	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	case CAMSS_2290:
> -	case CAMSS_6150:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> -		break;
> -	case CAMSS_6350:
> -		regs->lane_regs = &lane_regs_sm6350[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
> -		break;
> -	case CAMSS_7280:
> -	case CAMSS_8250:
> -		regs->lane_regs = &lane_regs_sm8250[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> -		break;
>  	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> -		regs->offset = 0x1000;
> -		break;
>  	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> -		regs->offset = 0x1000;
> -		break;
>  	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>  		regs->offset = 0x1000;
>  		break;
> -	case CAMSS_8300:
> -	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> -		break;
>  	default:
> +		regs->offset = 0x800;
>  		break;
>  	}
>
>  	return 0;
>  }
>
>  const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
>  	.get_lane_mask = csiphy_get_lane_mask,
>
> --
> 2.53.0
>

