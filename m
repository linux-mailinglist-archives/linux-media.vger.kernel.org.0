Return-Path: <linux-media+bounces-61199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MErxG2WNAmpouQEAu9opvQ
	(envelope-from <linux-media+bounces-61199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:16:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4D518CDF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41482301F481
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFDB346A19;
	Tue, 12 May 2026 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GVnbBkQe"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10433BBC0;
	Tue, 12 May 2026 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552155; cv=fail; b=hzVGyD4UxTgYwfZKSwW82eSylPIVKzhcPHCoNiIv3z2zQIH6uGlpkgtZYONuJa6ARVEQMJU2UcEQMAyj/dpkaguZbu+eT6MGINxxLQmbsQ8RzbmRMEK3Drh02gDs1QcrVWpT+YC1IHrdPvlN5XHTrGOb3g9pbwnc5dqeHB+m8FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552155; c=relaxed/simple;
	bh=fUzZSkXvv5Y7p74npXcECcxT1oIAfAAwRM5u//bu2Dw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CeRXvT1YM+8zoIIF3GrUkr/tYkgzJThzH1nLJmcRyYzreYq0Z21MGSn1lmpwXHZN46POv+UH4+GCsDZUVV6Dn8VAb+RB9RbYIDHyfJouyNVOgiMJoILYVpqtr+zEqO4h4u/kX+pjQ+e1afbKMuwroigKDgK8JITxdebk1INQwnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GVnbBkQe; arc=fail smtp.client-ip=52.101.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOxUAEE4BvVGatp4VNeAtQdUy1cSO3EYyZ1mMrLrO/JtYPdEKhInoPka3V8larocAQlz10zbIwxv5Lg2ouBRuiDaESC5tLMvwHYRTNEITGu1X9udIpjPUGENVM6hPT6HyL7xnfmqARUoRZVqMPgU0GZdAaCV8lp20mg7XYS0oq8TzH7Vc7uavhnfCMMqBxSoSraJt630+lI+GB1hsTrlkqM5G2XNiUftgpAccL38uLD1eBi2CF7W5s2wywRJ79nP1SGAERjXVv5/lY6VNX1iHqrMOAWE0SLLL1FyYpBZqThMN5Un4/csJ7/815D2aAC9ntxnb5vCs4+FobaqH6zwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7On1g7UK4emWbIkTMV7hZ9nh3ffnrtBOHqX2nkDYCpg=;
 b=cOFCJohbPioWCdaWgUWnR342IOympxHi7cQrpLmUGjjoupi75CbYOXpENVP1cc3pw+sgXObHYJt/O+7qnbDq6UOHecjZELVQiIdrgpdc523Rm7pWo33xwQrGBoSoxdeedCsqQiMc2pTPeQeaAIQVhQxUo3BYUUwDKlY5Wpkg5YPZ9LWmxVq4rSHc7hY8q02NsCvq05AElc2b7n4u0az3sjgQoEHIhiVtd8jxoVdEM/Jdt5zQMdzElA+nOrHBxVf/vGuY2AvQLO5E4aVmoQOFT3+Qftu0FZqWJLdGpmNA8a+j67a67btxlZigOHtKUwel1DzKqEko7sqKlL5me2E0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7On1g7UK4emWbIkTMV7hZ9nh3ffnrtBOHqX2nkDYCpg=;
 b=GVnbBkQeo+iJ/PbMm7/VFp6YvjsQLYugvrEWlxYNAjniJMHtluGFyIwqBPTmZW1+rhZ7TxKq7Sr52U+2HgEIvnkw8V3j/FhttNAvJNClVlzKdjXL3hieGg7kbRRUSguLJDpr9V0MA4N7tRd3g1Mbqx/dj5OOcKgVu6X9nJTlxTQ8f+vdOCVqC7fJ56cpgx/NF60zoGag/WPePF/Z0fRIEGgSeveWLTBV0WGu8K1qO3j+gqgHr7Ly6o/0aJXqtj761tXaWoTfHlotctWWc9u6HpmrJTKPOeekd1P46VxAEkjJAx0lDv1+XB4hl8XBrhAthkKXV+PJMS1Kp3rMTXNOoA==
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 02:15:47 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 02:15:47 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "G.N. Zhou"
	<guoniu.zhou@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [PATCH v6 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Thread-Topic: [PATCH v6 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Thread-Index: AQHc4bU+aKYyErTm80uq3vc4RFQ64g==
Date: Tue, 12 May 2026 02:15:47 +0000
Message-ID:
 <DU2PR04MB9081F09027BDA09394D52251FA392@DU2PR04MB9081.eurprd04.prod.outlook.com>
References: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
 <20260511-csi_formatter-v6-1-01028e312e2b@oss.nxp.com>
 <yez4p77eclr4hfhb5ytyr64ponp4plpefxhfszqfvdinpvamuv@jod7fsgilowq>
In-Reply-To: <yez4p77eclr4hfhb5ytyr64ponp4plpefxhfszqfvdinpvamuv@jod7fsgilowq>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB9081:EE_|GVXPR04MB10899:EE_
x-ms-office365-filtering-correlation-id: aef805b6-ab95-48a7-1e5b-08deafcc6172
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021|22082099003|18002099003|56012099003|11063799003|3023799003;
x-microsoft-antispam-message-info:
 B+9LBhGwupcxq6UB9pLWcxvhn8RYLwrdRP4fLGK2bgbk9hBXEK8j+nCCzw3xVGewWThPSgyFtJLrqr47nPQIYHWpiWbf0UDaK52UfaFoV6Lw7PeKlke5BC8zFhgy47/P8Sg0wbP8o2/8NAk9yNW1VhCyoYohEMiSoSZU7NrnVKvEdiPJjypDnJONd0xIReTuTKycTIemipypDQXTiy+np6y6NmOgEwbDhhLgS9wNaSMmaD8sUhH0nIhrKIk8bht8BrbwTj/3F6xAGCLWzShrHyA3YvLJh/pQOoqF7q+jD/velQfsm754WdH7QM0HqWYKIXqLslgTa+ImkI9Z170LNojs8NNO5Au7Nn+8cVGnWA0NkENepo3Vl9Yfwl512JA+6RSWin3GKR6VeABzodQUtasjxVNalq25gPZI+s6esEELaHgxPDmkTte8stTWfjt7Yr0sLPq5gXvlEsXLNaO6wBnm/WtjFPjhSp6CFj2e8z9LUh2ZqL0bZlWh2zDU2YTAJxUNJ/crmo1tYHiFfnbP1Y0C5JB9bBt368z44FDbYvjLZ6+8iKMzkyeW2GUUbqQuRLpNnP20OVnkqZqYlMYHGxMf1JLBpnXmrjwRby5qq/Ll3X3mOXI1DenV1IA55BJLOHGeR9gBSISf+KlqMzsRgcrhcQR325fXHUa/67JoCOm1waKXWEBXAnM91ybm5AdQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?InaE2vhD2R3F9gpFH66H+tyWA3nX+gsU7ccDukJKxSWZykMsRi0vmqGiwjVT?=
 =?us-ascii?Q?MvvjV7mNBVDUD72sxilC/sdh2VH2H4GJ8WGiS60vKZEiAlbDblen9LPXPGv4?=
 =?us-ascii?Q?U53ETQbmU4quRmluuGPKyRI29tViahqUFj26oXBC3SX9ArP/wTG625sZ3CBF?=
 =?us-ascii?Q?NLrMcxOWVIt/4kkkupPgWVP8Lll/cWcm8H/JMdMzAe49/T4CLQnQswO9Dw+M?=
 =?us-ascii?Q?f7IZlI+udpHkD5X9y32puEY33MtJM4/t2CwdP/Qrufkl9utETO2/dmx9KubF?=
 =?us-ascii?Q?cKU5mqYnD1BEvizMI/ot11ZXvsa6oDqHObiSrYFOXHIqGeUIxPe9TyEzTJFx?=
 =?us-ascii?Q?1puFUAwxr6cEJP9dHkVMs20R8pAkXL9tILyWt3D39uZRl5cnYEiXIafVRzNO?=
 =?us-ascii?Q?9XYDp0954pp47yGF6qV9zP4G0gdnGnr7eJVo48N8hsi+qx0cnZKP2yLhK8gt?=
 =?us-ascii?Q?im/8q3y7W2+cDTPRJkD1y8OyV2Sm8lA/Xr1bUC+j6JnwPXjhCZFBkID2w4N5?=
 =?us-ascii?Q?i24C6iQkk0t9t0H6wcz6k0195zEonsNra3vU9GnPrHX3wvVpwW+Vh30uV0IJ?=
 =?us-ascii?Q?naw49lF4SitBnSB9T2uHaBTUka7SbTUoD0kK48oKrhFIWxLDIWcaHGFMSepd?=
 =?us-ascii?Q?UMPwVV8Pgzb9b8lydLbkjDjvthhOQG74AIA+5BMAYJVvsW4RrGJ9OgX3YJD7?=
 =?us-ascii?Q?OCx9SWatF+8MJkBprmBas7pKuOhRbEIyvz9OaqtyQvnicQXkMEy73snw6xre?=
 =?us-ascii?Q?1O3XAll159Ol9BJvHBORqzrD2hyc6vDObt0tmETnPfixdwEtXk5wTI/CGMc3?=
 =?us-ascii?Q?PvE+NYP04qCRzLII1A/1Dx3KaHMrQlCJpy3y/C7l8r4GgF68gvzCsyWbrqzx?=
 =?us-ascii?Q?AOD6Qk7l/631Pr1Cc5LPMGJ/of08a49arl6hPqMy7rmFI93FQqeb2+6fSTlh?=
 =?us-ascii?Q?4MeNmMi1Yyfa5PeeDiuuhWMJWsxq0AaPKILCJMN4Z/6G/0DqeLe9VF42dHlb?=
 =?us-ascii?Q?KKMCTCzQT07SHUbtrT0qUPfzCLehtZq5iKfSrIIMXYu6P8za4gNQfUY/3l/l?=
 =?us-ascii?Q?Jk0HR1HN80JBA94zbJvqC5VAolyYYn6xOTiIgAFXSHLUd4K+6h4XAe7lBMif?=
 =?us-ascii?Q?295TQdgbSHLHSQBmusgpWI9XrlfaOX1wSLy5YqKENrLnUrBA8gqkP3X34XA2?=
 =?us-ascii?Q?gvKsC2aga1wF0X1AGdJoxmUFVnnMjUjrexuACZyaGQ6Ny2wlPQBWwNvZe3sj?=
 =?us-ascii?Q?G1Q/pK1HwuOKUpMRi4izJCjcU3lwcaB6AycdUDA5/xr4WkfMP1IeGeJoWhCs?=
 =?us-ascii?Q?b9ZByxGA9YLDRaMKRWEcoest92Jc1U9pfqzleul3C+kgUmxf2GMKxmqxeDFk?=
 =?us-ascii?Q?7QVozdFDOJK25ixcLuOCOewRwnKuln9o6eygTggD+ohlVlfdenRvedtjGA7X?=
 =?us-ascii?Q?RsTeuhuEdUR1xtkHinYtCYRc87rDicVwU7y8Y0gz/jfxzSU7vy2AvMRz7j18?=
 =?us-ascii?Q?A+eBT28PhM8rVX5XnSD/u3qrpL8OejbUwDtAnEBX8h6FuMmnxqOuN8zUSBIZ?=
 =?us-ascii?Q?dQSxiND3nbce2twNtTk8Vy9MFPBqffaMFk8Hlr6fWOBRufeSZyxK+7VS4spY?=
 =?us-ascii?Q?kje8dTPm/QylxNP1PDFooFG8hvGzbFhrsleqOgKSXddAM5mj5Lh9PxOCj8TU?=
 =?us-ascii?Q?ef8IINYNyltRJ2X2FYfIZRW6ggGe71C4NqArh5kT5zL+f5E6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef805b6-ab95-48a7-1e5b-08deafcc6172
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 02:15:47.5616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvLC0f7n6wZDZKQEn/7o3mdxHieP8c/bYw1A+4qwGbQsSoGu5UZlojD9RfbtBpdZH3Ikvo2jOm/d5BWH3+w9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899
X-Rspamd-Queue-Id: 3BD4D518CDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61199-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,lists.linux.dev,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Macro,

Thank you for the review and the valid point!

> -----Original Message-----
> From: Marco Felsch <m.felsch@pengutronix.de>
> Sent: Monday, May 11, 2026 7:46 PM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Laurent
> Pinchart <laurent.pinchart@ideasonboard.com>; Frank Li <frank.li@nxp.com>=
;
> imx@lists.linux.dev; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>; devicetree@vger.kernel.org; linux=
-
> kernel@vger.kernel.org; G.N. Zhou <guoniu.zhou@nxp.com>; linux-arm-
> kernel@lists.infradead.org; linux-media@vger.kernel.org
> Subject: Re: [PATCH v6 1/2] media: dt-bindings: Add CSI Pixel Formatter D=
T
> bindings
>=20
> [You don't often get email from m.felsch@pengutronix.de. Learn why this i=
s
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On 26-05-11, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The i.MX9 CSI pixel formatting module uses packet info, pixel and
> > non-pixel data from the CSI-2 host controller and reformat them to
> > match Pixel Link(PL) definition.
>=20
> Sorry for chiming in very late, but can you please provide on which
> i.MX9 devices this formatting module is present? I've checked the i.MX93
> reference manual and found no info instead I found a CAMERA_MUX register
> which does something similiar but is not the same. Please provide a more
> specific compatible if this IP is only be present on i.MX95 devices.

You're right. I initially used "imx9" because this CSI formatter  IP is pre=
sent on
both i.MX95 and i.MX952 (not on i.MX93 as you correctly noted). However, I
agree this naming is confusing and could mislead people  into thinking it's=
 available
across all i.MX9 series devices.

I'll change the compatible to "fsl,imx95-csi-formatter" as the current driv=
er=20
only supports i.MX95. When i.MX952 support is added in the future, we can=20
extend the compatible string accordingly (e.g., using "fsl,imx952-csi-forma=
tter"=20
with "fsl,imx95-csi-formatter" as fallback if they're compatible).

Thanks again for catching this!

Best Regards
G.N Zhou

>=20
> Regards,
>   Marco
>=20
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87
> ++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> > b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> > new file mode 100644
> > index 000000000000..774d37d2b987
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.y
> > +++ aml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX9 CSI Pixel Formatter
> > +
> > +maintainers:
> > +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> > +
> > +description:
> > +  The CSI pixel formatting module uses packet info, pixel and
> > +non-pixel
> > +  data from the CSI-2 host controller and reformat them to match
> > +Pixel
> > +  Link(PL) definition.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx9-csi-formatter
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: MIPI CSI-2 RX IDI interface
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Pixel Link Interface
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> > +
> > +    formatter@20 {
> > +        compatible =3D "fsl,imx9-csi-formatter";
> > +        reg =3D <0x20 0x100>;
> > +        clocks =3D <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> > +        power-domains =3D <&scmi_devpd 3>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +
> > +                endpoint {
> > +                    remote-endpoint =3D <&mipi_csi_0_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +
> > +                endpoint {
> > +                    remote-endpoint =3D <&isi_in_2>;
> > +                };
> > +            };
> > +        };
> > +    };
> >
> > --
> > 2.34.1
> >
> >
> >
>=20
> --
> #gernperDu
> #CallMeByMyFirstName
>=20
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    =
|

