Return-Path: <linux-media+bounces-51390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKqhLyYtc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:11:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 355957242A
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77FEF309D61B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D867534E754;
	Fri, 23 Jan 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PZFJXNYA"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCA2BDC1B;
	Fri, 23 Jan 2026 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155583; cv=fail; b=spUDAO/01ZiZ75y6UJqzmoxUkLT6fprES5mKQ1cU2Z/650p+UhFiUt8cxGJM8DG0OKLdc/PisanRq97Xm1VlMJm4pr71tu6k3asB7hjAoznCNYnyYqglwz8qgh5/+/GEWln/hOEUr2nQow3T8o79yfprnwYVd5tnAe06fjRJw8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155583; c=relaxed/simple;
	bh=D6FnK4Ofg8cimj7gQi2bQfl6i9lIlj0ppHKfWPrbhrg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mFlxvu8MGt7Pa6meRo5DCTn9XFOTQ78twoEs779NQ2B0eyLQVVqZPhkZEcuS1z3uA9Ihm5Zz4k9Oc+TxldsrqiOT6eLpheYIgLs5wdl6uZP7Y5PvXT/KIPm0e0lb6jlYXVsgJDQ00KBMc6cS+8gd7BqvDg+BI9DzLyEOpYtsbyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PZFJXNYA; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vco5X4v0pYCuQwx1xQPF9Uf8/hFE4OCxISaY5qzDprYOp2DxrRF6hF1lflfAYHe/I/VSYWcUDHMgx5awsnzLuIf2FU/iopI8uAGH1wuTHarpxdyNLUDS/rWQKzw1cx6UiVBzWP4jvFd+coUOrTp9602PM1Y3IWOZ1HakB5Lkabd7a0nvGp4xbmyJSGZrJp79Kx4nhsN2CHr+fr8tqerTX6FLf4fn5sEDhwr6dEVSifm+2Em/WE1jR643RqiIvat/m0eTQbcFbgj7qczu2epnTTqI2oVu86YRSfpnWcgu2rM3cCqnJN0/PURPr8qIcEvxHPf9TOTkmEPq18IKCO0qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ge06nRj7O0PCymGJblBmOSfTACS7KwUOntanC76Xj8=;
 b=vzxxqvquu0afoDbDZ+Twq8lEG/pvPXZLfisn4q1OyA4S/Gdv8kC4MsI8lFqx+4Kqs1l9aziRi9sklbBIFMs/rARkHsruBBNyjDqNAxuO+sYykeRvlLMr0WXNS3R6XDRn9a95J0dHNRqEYWfk89xveOEGMXnwkjwhuWFadQziYDVJueCHCOOMF/Hy+klvcT6c/xudGrfMsMIKSFBWnA2ocrkIK4JQVHx4lyXwTJudBweuKcZG2yXo3wfyMldON7ePlbEnC2SpQN8Iti8N//fvIVz9NYE2utkB0DU9kyiYSTe1MA0qs5kEJtDaWvXtPNDcYe5XPA+obvJZdwvFZfOyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ge06nRj7O0PCymGJblBmOSfTACS7KwUOntanC76Xj8=;
 b=PZFJXNYA1+ss5C8ebKEvW1PBmE2isdyBxIRwa+IbWetXNlf8YLB1TmibcrV79dOFnNr/r6uvG68Fin3ZCbVxs2wfNt1b7Y67gI33uRlBgRvO3bhu796SaZi+knRXX5tRUk0I+zbr38c3lHYyor2NCbwoYoVnO+UhLGX6Sj8lJdsbzUjyFDMZThAGwIw/5SBwb3mHRgbNL+q1AXKOP4prariRyNRUO71vNjXUByeYJQmTBh5nHtd+mnWBjvwV6PKuHhoP4Nkrm18JK0VSKfZAfKT9KMq1w6q2SncKIVQ/ttX72BMMQP6vIYjU6Ca7Kof1fKSMqDqSMBSJB3nZKVpYkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AS8PR04MB7974.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 08:06:16 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:16 +0000
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 00/11] Add iMX95 neoisp driver
Date: Fri, 23 Jan 2026 09:09:27 +0100
Message-ID: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AS8PR04MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f6aed6-c68d-4c5b-02f1-08de5a564829
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oopHku6aB5nopjT+f8w87zYsJNorPUykCUonSl7XUsFHK2fHdSwsElBXTvs9?=
 =?us-ascii?Q?jdMrSlYzTQMj/QGeUXBicwai+KKjLKpOKmr4pdPi0pe6j1Kq8a3HKJsEcmMT?=
 =?us-ascii?Q?qTIowy8NR6pcr0z3OM6aua0KJPVv3YsGWhAnexC5+a4ETaFV56SY4mqDKUxO?=
 =?us-ascii?Q?Lip9nCscfMsqsT1yslLxoT4ZnxJFJMDOhzsbagTFK+ReH+QBndmp9zmjXnFC?=
 =?us-ascii?Q?/bz7c5eV+c0Wzruu/qOWEYDwlYVQIP8ya5ZzN8MKu14WZoQ3zpA7ZDGI9cNe?=
 =?us-ascii?Q?/Q9mtv7LIPQKox/hBCCxTkHVYRnhFbofBgaeYGZj/s5Cg9Qup2qSyhbWZpmP?=
 =?us-ascii?Q?AxMPSJXJS/2WFS5t+fakHOo5MYcgHlcopXFj0QhrFoiVxlosKct/F4HeD9Qp?=
 =?us-ascii?Q?xoEP0OKXQrB7BV6bmXmabQDPQVRAp4y0ifoWen/IEUpZ0ns0B+gbyxAP1TmU?=
 =?us-ascii?Q?weTVZE+hw7KfUTDHkQ9ZOoBnFOTr+9+hyCXqFbNsiBcMMyStxl9nnc/Pt3Rn?=
 =?us-ascii?Q?C0ImIp7b26NS8l/EXvNTBQFv4Zsu1eekpStPdjmvGXR7kyDk+xGMkDfPzRKT?=
 =?us-ascii?Q?LbMZE6kamJiFRyOlpy9UGwlkmUexUZXKK4oUulobZhtcpr5jD0wHxEPIXrRm?=
 =?us-ascii?Q?6SKQ68JvykQtYd1y7/nOciXKkGxC4IfEfkA2XUVMQO7YK94HPgrrS1LPAdQJ?=
 =?us-ascii?Q?mUvQNOPUWsLo4NF6vaM0Xs4Jpn3HgzE5Rb3JiyCnej9Pv8aEBSgUDNLG/cn4?=
 =?us-ascii?Q?QU3PYB40QWmreHSkSZq8A8p3OxeEzRxMAC5eJQPI6XTzD+1eo84mCAw7pBuX?=
 =?us-ascii?Q?R0PAPphqwzZOsUNt2lwi9n6dKtaX3k+SI8uDi1MpQ6xvGWKpC5N+hDYjndQo?=
 =?us-ascii?Q?/oiV2nJL+p7btN7WXo/+ukp2na5QICNniLtKabEtlKcxB8FvVjOxrZjnYJBg?=
 =?us-ascii?Q?wXnHa88TH6G3zuR4jZia0/ZBaxOdEXZz2IRAAlBAeT97fh4yiiF0XqrBpq1t?=
 =?us-ascii?Q?JQVb1Nycp8W25aV2o00bDzND6ag+nVfUsiHuQoJwZF9EyCMOOe8zFf5Ep8Yx?=
 =?us-ascii?Q?p1Ct3WNLG+H+aU2d+NIaytQqv+awtk+WS47qakecTXG920JWULjIzu+oxVow?=
 =?us-ascii?Q?j17nvWxxVvQ7Z5EZFv+Ph7dgkh9Na9BdgXI3ue7WxRK4EuFy9YNiOt715Me5?=
 =?us-ascii?Q?mPBooHeCeiVuArejxNNbrLkfsavpAGdSTpXN0W6xykqLXboT6dVFZ/Zj4ECJ?=
 =?us-ascii?Q?eXRHT9zdNASvXoDI80teYdXxSNnDvV7PxNUPICoMNO6eUPe01dKFHT6zl018?=
 =?us-ascii?Q?hP2BYmIf3jL0kDe/LJDrruYRMwl3h/GfZqphwdJ1rcT/S7fAJbqh5xaIVjmQ?=
 =?us-ascii?Q?HtCTeEtC6Halwy3OZv9stdmn7Isj2VQVAIaqnSa/xPqdEQbBDEOZKpXTQK8h?=
 =?us-ascii?Q?2bcWyBihSgH5Af/eWEFmCB8YeXAHPN+qAZ71wTMEkRShgF1qjwCTcjFxRFqJ?=
 =?us-ascii?Q?OBDr1TQMIFE8w43JMjZT5Oodj75xA2fsIibfq8rWxSvI6isYBs7rk+GyKKts?=
 =?us-ascii?Q?zuiUoedfyrefpqLho87BChaEUH0+M0TX2uOymGvE6g/H3bMNs37ABVaJEXN6?=
 =?us-ascii?Q?ImLAr9raMQ0dLsVOOZ4CADeJ4JczWST1LB6DO6cPOajN?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BF9G05iqSTrhn6q14LROtbDMILDTyzDZ4n5mVUkfALiuvqfu2PWNSCrlQY+K?=
 =?us-ascii?Q?cbNRsFGNbhGUT9+2NHQOAgAsBPUV8tXQsRUwtY/eI0SmUnQxM2LCxss8lnpm?=
 =?us-ascii?Q?T0fRGLNaobVQGhsHozHyZIYLYxhnTaivK4bQcb68AkvAVPjj7KpU6+i978yd?=
 =?us-ascii?Q?Ren/lKdLQxv9QpkaAn7SqIK06Qp8XKDjd7zdlDAl4plz5u6iF6owCy1G261e?=
 =?us-ascii?Q?z23m9b4fxtC4fiMJf1BBoDnTqG/DJb579pbwsQdwkACrb2QUcEWkOcN0uOjY?=
 =?us-ascii?Q?pFbrYKGI5cVq65NXOxf8LRt9upb4S4/74YHwsoeE5ChPFAnoslfYVNnYu5vr?=
 =?us-ascii?Q?UxXmbMnH4hEevyvnjWcEwH9+SClUs4UMMexj88mX7GQyKvytdr7rTf3JLo7X?=
 =?us-ascii?Q?TovRtdTVpMx7SriRn5EesIpIvDQBfnvpxJQdVDU2M+1w3Jv3ZOoekOVsADYW?=
 =?us-ascii?Q?fMTQJFZCBTXnxZoNXS9IgspbrZbI8D57moDU+5Jlccjj6123DtBoCZSo34qD?=
 =?us-ascii?Q?n4jUvVV0sQTHuoZnI/MGFnw3UVn+27wm39DLlo/G37ZJ6xdIAHGAjhBPYgRe?=
 =?us-ascii?Q?zegTerm9LlRLAeoChpt57fSyoYrTJx+h661dmvVWDFTdGA9RBKafCpUHwq5Z?=
 =?us-ascii?Q?ji7/GR3xsygnwTPLk3ee1VPnnDyrUCD62NwOWC083Vc8hXLc6V245MxKk+/S?=
 =?us-ascii?Q?+j2RSGlOiOWa8mT+lWC5KJBPMPAp8cLz+e8a3C7U8hX7q39jF3apTqPJF7Bk?=
 =?us-ascii?Q?Q/0IOEas3hEenRuXTTdko4BsWv+AbO3qZDzNqoeP6k3dc2gPD4RcCBu30MOj?=
 =?us-ascii?Q?wGmL/Po4+/JhKSdrjb/b24dgxHR8X+M2CMnOgn8bnnrQHWLnZcCgB1CGg9VC?=
 =?us-ascii?Q?WdKbzphNrxRAyY83OyCo9VspORUDY+dJejhC78no6iwT6wl9SoHx3Z/4s3Ue?=
 =?us-ascii?Q?n1C6Hd4ftSABJuuBwlLoj544Kvn2hk18/7MAxo/E72YtSSFBT7//XNoyLyQz?=
 =?us-ascii?Q?aV0eUtt2HJg0JDNLEWvyVchSXGgd0/CjHnDYbs32RoJkLbo3nThXuPg9XIvx?=
 =?us-ascii?Q?5rDbmFFtZaIMjz5nQdakQH8N7NPFZ3n5wE2lpFx9csR7JWo/8pVMQkb57Sc7?=
 =?us-ascii?Q?jU37zMep2cebT0k1EMris6YcENS0CXyJZlqFIwHFp4grar6+1asbNpLNWIz8?=
 =?us-ascii?Q?hCu2twzT9w8JnEBUmb01S8IW7cjPcwk5HFCrz7vEM4rTGAr/dt9oOl3VucAA?=
 =?us-ascii?Q?ru5Ub44/kktdGas5gyc2wZDgWafTaNFT+uIvD9hJ2Rbqg7KJ75WiuHN+wjNA?=
 =?us-ascii?Q?X0+3aTkwybSNet7aJX++Ej6gtjUm2Mpv1CLQnoc7oauIwVjbCBSp2h1o9nea?=
 =?us-ascii?Q?+criAQd3bp1Zx7TFdTP0irjnM1RwwLizsfybCjMQmPESGkMUDIkFoikRTXm3?=
 =?us-ascii?Q?YpnnbafuRAgmZT2hD/kWVuBG4ND5MPQbgc/p5GC21yjBscKJ6Glp+gC7oFTO?=
 =?us-ascii?Q?gMmaDk2If9s1X7jwnBtToQFFoCR6qgLFNA7Tlcaj1VLMoZOcqz2V+T70AX1T?=
 =?us-ascii?Q?4iRz+U8EoyOfxqm6TKIqt9PcjX0YZJezzvIC3nfgOzajW5o+Lh+3+C5CG3Mh?=
 =?us-ascii?Q?Mt+jKmmSX5kHL4vpvyg5qRLBeuLjfKTPXmbEEWKLnqOmwaJILQNYhSM3eOZs?=
 =?us-ascii?Q?q8NCmSvbaiRgK7Ycp9y1UL+WqHwLJhH4aXqzDVS5xkc3FoMtOwfK0VuRLAVm?=
 =?us-ascii?Q?iK0QbYZ+EA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f6aed6-c68d-4c5b-02f1-08de5a564829
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:16.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayt8/DZjRypwqqZgGaprYLKN/A/cxa17K7iU2TNqGpW+Re74Vom4M/+WkNiwpbpGAwnd5SgoSz6dnn7Ucg5MPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7974
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51390-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 355957242A
X-Rspamd-Action: no action

Hi all,

This RFC patch series introduces the NXP Neo Image Signal Processor (ISP)
driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
The series also includes updates to the generic v4l2-isp interface to
support extended statistics required by the Neo ISP.

The Neo ISP processes one or more camera streams, converting RAW formats
into YUV or RGB outputs. Its architecture is largely influenced by the
PISP driver. The hardware supports up to eight contexts, with three sink
pads (main input, HDR input, and parameter buffers) and three source pads
(RGB output, IR output, and statistics metadata).

At this stage, both legacy (fixed-size) and extensible (dynamic-size)
parameter/statistics buffers are supported through the generic v4l2-isp
framework, similar to rkisp1 and Mali-C55. The driver currently supports
M2M operation; direct CSI-to-ISP streaming is not yet implemented.

This series is posted as RFC because extending the v4l2-isp interface may
overlap with ongoing work. If similar development already exists, I am
happy to rebase or adapt the series accordingly. If preferred, the series
can also be split into two parts: the v4l2-isp rework and the Neo ISP
driver introduction.

A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
consistent with the existing style in that file.

Testing was performed on the i.MX95 EVK using the media/next kernel in
standalone M2M mode. End-to-end camera-to-ISP capture has been validated
using the downstream NXP kernel, as some hardware dependencies are not
yet upstreamed.

Thanks,
Antoine

---
Here are v4l2-compliance test results:

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for neoisp device /dev/media0:

Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 7 Interfaces: 7 Pads: 12 Links: 13
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video0:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 6.19.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x0300000a
	Type             : V4L Video
Entity Info:
	ID               : 0x00000008 (8)
	Name             : neoisp-input0
	Function         : V4L2 I/O
	Pad 0x01000009   : 0: Source
	  Link 0x0200000c: to remote pad 0x1000002 of entity 'neoisp' (Image Signal Processor): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video1:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 6.19.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x03000010
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000e (14)
	Name             : neoisp-input1
	Function         : V4L2 I/O
	Pad 0x0100000f   : 0: Source
	  Link 0x02000012: to remote pad 0x1000003 of entity 'neoisp' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video2:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 6.19.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Metadata Output
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x03000016
	Type             : V4L Video
Entity Info:
	ID               : 0x00000014 (20)
	Name             : neoisp-params
	Function         : V4L2 I/O
	Pad 0x01000015   : 0: Source
	  Link 0x02000018: to remote pad 0x1000004 of entity 'neoisp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video3:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 6.19.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x0300001c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001a (26)
	Name             : neoisp-frame
	Function         : V4L2 I/O
	Pad 0x0100001b   : 0: Sink
	  Link 0x0200001e: from remote pad 0x1000005 of entity 'neoisp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video4:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 6.19.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x03000022
	Type             : V4L Video
Entity Info:
	ID               : 0x00000020 (32)
	Name             : neoisp-ir
	Function         : V4L2 I/O
	Pad 0x01000021   : 0: Sink
	  Link 0x02000024: from remote pad 0x1000006 of entity 'neoisp' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video5:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 6.19.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x03000028
	Type             : V4L Video
Entity Info:
	ID               : 0x00000026 (38)
	Name             : neoisp-stats
	Function         : V4L2 I/O
	Pad 0x01000027   : 0: Sink
	  Link 0x0200002a: from remote pad 0x1000007 of entity 'neoisp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video5 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 6.19.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           : 
	Bus info         : platform:4ae00000.isp
	Media version    : 6.19.0
	Hardware revision: 0x00000002 (2)
	Driver version   : 6.19.0
Interface Info:
	ID               : 0x0300002c
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : neoisp
	Function         : Image Signal Processor
	Pad 0x01000002   : 0: Sink
	  Link 0x0200000c: from remote pad 0x1000009 of entity 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
	Pad 0x01000003   : 1: Sink
	  Link 0x02000012: from remote pad 0x100000f of entity 'neoisp-input1' (V4L2 I/O): Data
	Pad 0x01000004   : 2: Sink
	  Link 0x02000018: from remote pad 0x1000015 of entity 'neoisp-params' (V4L2 I/O): Data, Enabled
	Pad 0x01000005   : 3: Source
	  Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-frame' (V4L2 I/O): Data, Enabled
	Pad 0x01000006   : 4: Source
	  Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-ir' (V4L2 I/O): Data
	Pad 0x01000007   : 5: Source
	  Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-stats' (V4L2 I/O): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 1 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed: 0, Warnings: 0

Grand Total for neoisp device /dev/media0: 384, Succeeded: 384, Failed: 0, Warnings: 0

---
Antoine Bouyer (11):
  media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
  media: v4l2-isp: Add helper function to compute extended stats size
  media: Documentation: uapi: Update V4L2 ISP for extensible stats
  media: Documentation: Add NXP neoisp driver documentation
  dt-bindings: media: Add nxp neoisp support
  media: v4l2-ctrls: Add user control base for NXP neoisp controls
  media: Add meta formats supported by NXP neoisp driver
  media: uapi: Add NXP NEOISP user interface header file
  media: platform: Add NXP Neoisp Image Signal Processor
  media: platform: neoisp: Add debugfs support
  arm64: dts: freescale: imx95: Add NXP neoisp device tree node

 .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
 .../admin-guide/media/nxp-neoisp.dot          |   16 +
 .../admin-guide/media/nxp-neoisp.rst          |  189 ++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
 .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
 drivers/media/platform/nxp/neoisp/Makefile    |    8 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
 .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
 .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
 drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
 .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
 .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
 .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
 include/media/v4l2-isp.h                      |   13 +
 include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
 include/uapi/linux/media/v4l2-isp.h           |   85 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    6 +
 30 files changed, 11880 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/devicetree/bindings/media/nxp,neoisp.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
 create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
 create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
 create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h

-- 
2.52.0


