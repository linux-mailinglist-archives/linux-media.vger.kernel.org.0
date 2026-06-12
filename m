Return-Path: <linux-media+bounces-64709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZ7dD1EoLGq7MQQAu9opvQ
	(envelope-from <linux-media+bounces-64709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:40:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC37667A91D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=uf1Farcy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64709-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64709-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E118C3053BBF
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15251386C03;
	Fri, 12 Jun 2026 15:39:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7533451B2;
	Fri, 12 Jun 2026 15:39:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278797; cv=fail; b=kqRACaUXaSIvVV6U3595ZEWC0ERWB+NHt6O3O+aXifLFYi289dNkjM7WO050iESRkAIHvCA97ihFDXrALdnRdeomepFRqdCOtzpwdmaEZDFsdxMEXBpzpzIpvVaELSzES3gf2utAHMfGE65Y6ptICbuz/592ClzqTsduS9YAB6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278797; c=relaxed/simple;
	bh=fxwlYnlzIGSudUSHoSKRDdiZxr811oBDGEuXohjOHAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EfNOyF/p/s4cdbperjWIsNSrK7I7eHahdfdk+6eNEJ4rLQwDO4990uQKFZQ5nm0xyHPEXIMJ3b49j9HM5JBsXgg/q0GPPRzV2hFPKoc9q3UrYAz4Zz5987qMABYeoVeeLYTyHfDxWFt6dQPbWRyKBUXrGGPrVDcSl8fUgoBRNpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uf1Farcy; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poP8/E1oa67kY9kCqmuRZIg/lJiCIuQEPeHSVH3GiXU2+pJDtBq86wtxv5h78HlCdqxjQRqvb5q6dEdfjv/9p5eGjkZxg0c6HPd2fJEYfrTBIrLx12YhTct2QbhM0XsUjG8N4pHNaR1rW4E/vKMqNz7v0PF5WK/KW+5VfOENUNOqLpE6RQ0AyqpbiNVeHKpwLKnOX5lzvA9OYGmmyKHLiilkYGxkUlSQInuDfQgFsIrW+xdMew1Z0Ceb0xC5rJqaSnng8cf6VJ3JJLpCQ1hNTVTC74+Qy1PTq2vhzEezV6ppVlVLP6/psXUXL8YmvSYC7t5u3PEysceuww3weodL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLIVpl7hsEoZpx5GkAw/Q6TlzVU/Qzwxj/d69nt9WwU=;
 b=r60jcPXU+89dAZ8Oqi/4njx3wTeWV05AepLt1hP06bohTsZmucDCeVxQNw43/A+lHS4IYzZTmgayloL4/dt7NKflKuHJtMLktJTNhh3KiiuJV4XmOtwH6keCHCgJCr1pGTea/zGIq/iXkmixkWLKzU3ms0BBmwWOfrEQw8jIf6lPkwKqZEwxp3jHQ8JqTfFQkHf/iPvpdUM+3Wx+obBeJipb54sh2Vxaq6C7a/c9+vEHArdGEyq8gofJ2yuUyikLhSurEHNpK2cLprCh0780XUjD75DY99iOPOJZFOki0TRQrQrLbOrxdhgcd/qocniQ7k94RT3A00i0CgQhYi0Jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLIVpl7hsEoZpx5GkAw/Q6TlzVU/Qzwxj/d69nt9WwU=;
 b=uf1FarcyjWR16ib2QF01JqBTLlcR4P1oTkW7j+0/eZ//DHnehpqfNPkbnj0APBO1rgUs09QN45te7zmZM69xqy6IfHdYO1huooicZLBgaD8VOZQs/EIQEqrn9QE9T39B3hHD59t01m9xBudH+jY6KDb5E5p74yRn2RL2Fy5iTK+xYInx8KriAI1X4KeulqoiNBvBBUHNChQUAQ9CthuuviqT7bBVz6DM+3T8FWqA2avK5n1YhbN0GSrn61USEbF9wmNruZmPTQtaTDwKyjHBTEhoNntQ81dcAX8sTu7uThZFz2PHSFHqR5aSRL3mlmR2C/wbyKS+/6TpVb9aJs8ghw==
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 15:39:50 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:39:49 +0000
Date: Fri, 12 Jun 2026 10:39:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michael.riesch@collabora.com,
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com, geert@linux-m68k.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: media: Add nxp neoisp support
Message-ID: <aiwoOUlG5P--Z9t5@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-2-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-2-antoine.bouyer@nxp.com>
X-ClientProxiedBy: PH1PEPF00013317.namprd07.prod.outlook.com
 (2603:10b6:518:1::7) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAXPR04MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 83851f8c-a54b-429e-7f11-08dec898d683
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|19092799006|1800799024|4143699003|3023799007|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 LtB+OpPWcMU1tI2PzjAZGz6QS45e2giu60/u79BWFpP1qx9+gkG2FTMFPpfX5VpILpj7sYidXLhRRmoUtvRo4tmRziQvzFoTjoLRVuvkoBFQVOmV1zzyhGLIAZbSrMzPZDoQfgNTZnTOY+zpcfON2pESDNSHrpcgEJp/mEZGTrUcK541SrpA4EIdMfl42eJFSYjwd7T0/P7ltE3/U9ubMDP61BHHlDkUGhX992J88jLedWDzdhgEm7aaiR5FbxYnA7cGiDb2uN1xPkBp+OZnrj8UKm7TSbTnpchwGL3+TI5zl1x/AXlxfj0W0K6yKiTnhWy5vrHvsd4mCAJ8LnBjIv/r2AkdN+s82aBEdN4Jh/qVS2n7sBOKG6/+7LciyutgjAk6RcJdRRLYY3ASjLETC53IvLX5j1ZoRshC6W5bD6beVa+P3NpuIppdfH3+b1lnw/vP09D4UbMp6e5vKfwJ5bmtj8ydNUUQALB9G9LA7HpW5nX5xIHz67So3srjiKumfFk73J8fPxXtBnIXsfTHVMyjoLIQFTyaF4IVujpMQqXkfyCq2Bfa/OWKqePyPM7SpitHy+Ud/NRxGZPU5GS706oDbqqkrFFnmQnsprNyZQ05H9EKM5+oCfExXW4vvZsHEyixy+a5TXQj31lPxM5F9Q==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(19092799006)(1800799024)(4143699003)(3023799007)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VkmsmT3giOZWM8/tyj1ptnUdrg5LJ3picdTsimOjqJ48YJtYUIYzoCI+GMbi?=
 =?us-ascii?Q?nzRga+BNtID7QKXK7x+09JfVSrK8GNudsmDsfFPlreo0Y1/Rjzd+sQf1HX18?=
 =?us-ascii?Q?Vy52bUHSANcNYII2QPDH5q1nv0s8/BoRpTOnQIYjRFJie+looudouIrDw802?=
 =?us-ascii?Q?lK4CoJQUL1S2fD/2s5hXyyCtHKuOSA7K/y3mGoZce0+OKbqMdXWkFhQ6Cl5T?=
 =?us-ascii?Q?iKaSuVICt/OCsnMXx9JA1UrKb4JyjcN6HbeSW1aPPAnzz72aQWyhJ2JaCsy/?=
 =?us-ascii?Q?lfUbtN3u2RVs/ccIyRaMRNNnsAl4omza2+tMdfoFet+BCPMtCA4sgG9cLXBF?=
 =?us-ascii?Q?SCjxDpzxzdpPOSzK8w9a9sJCxvG3OESo/8TC7KriCYzbxwrc9cNNIVVgWOuH?=
 =?us-ascii?Q?Nuk6fhPIND1rK8ESkifH1xbeZNybh7ngs4gfoq++REWLnFW45dzL68in3iPp?=
 =?us-ascii?Q?05wgkba8y3/lgId/8P6bgdnYkUnEGi5/GdtLZK5Sa6MIcy5Gzrx08m8Fgyid?=
 =?us-ascii?Q?yyQzq3Y18aPKl8/A5CzMmY0sPVyznypGrARG4ONQFsmwJXGgyc3/bc/55q7a?=
 =?us-ascii?Q?ZTEEx3SFZ+JBYFCOCkTCVYvlCU1nY/5/udc2OkzR9iAg9koFQyVNnmfbGq6F?=
 =?us-ascii?Q?07T8vWliQVMOz2MIUpc1tZFDV+GCUzM1ShwwDdQXF2aox7mcgCJDPr342Qvs?=
 =?us-ascii?Q?qK0Dz8JD+9BUv20yOE8C8lHZc3Dkc7eYO2djxeXFs7Zld7BPBppit4en6FNX?=
 =?us-ascii?Q?ZFS4eDj3mfXmYcEijgaA330ThK8x8vT8fGXAy3KK9D6osKKLQJ1MeyF8mAQR?=
 =?us-ascii?Q?APcrZJJsA7/qrgNGEASvAqEHlwhrJF+94u+v7RzILfHPobpAcvcgOHumLcjC?=
 =?us-ascii?Q?GegBOFKhMG6DLskaFSgevb0byDUG5eroZlbiDjcNsBaXDchdNaKCjPXbkDVq?=
 =?us-ascii?Q?vylhJ+DLBdaPtQDtZXmLiijjtNE/9GkQt+tIpUoepZoMtHHaPeKCFRyeebhh?=
 =?us-ascii?Q?FjaCFxcqocIKGJTd0JrkgxDjilji18RKC0w0rzpxlYgnJAgAi5n3lH8FNw+U?=
 =?us-ascii?Q?oCK+1lVtOJ07CPm1KuJg8VdZlKbquW2ZlHGm/YkXUFMaB8U2dRv95zhK81Qd?=
 =?us-ascii?Q?gjgiNabznozJ9PDPyl1ANxjBj7S5sijV9zmrfaqKKcJtLh3LgE0QjrwRCRt7?=
 =?us-ascii?Q?Mx4/rSJ6xSdrs8ga1H+p5NrOu1Og1HNARfXJbByGQfqlftVwaCzGsk5ALAiT?=
 =?us-ascii?Q?5u8eVm3y7Pl0kYkMpuxm5hmTvFlh4OnvbFpfddDZV938PJ52EqjTFavkH94N?=
 =?us-ascii?Q?+LKwz39Wj/3+ZCitcZ1rGuAP+KjjbhLz0elxKdn8vMy1gTdcEe96d/TX9r8m?=
 =?us-ascii?Q?utKBF9jcTHk+ZcegG/WwXZUPcx+vyVOxkk+y2QaXANlUAr6KE8QoY9Uk6Niv?=
 =?us-ascii?Q?sb1O7v5mHR1CPbSBHm8ZmSjZcEy8NTeKZJlkJ++Xl4+sDWCwvQlZiz5WR9Rl?=
 =?us-ascii?Q?AUeHBPBBl6iNGwo/uUv5EwwfuPksTq1r+hJU3jiO1MoXV17BaoqUCr4pd2l8?=
 =?us-ascii?Q?EAwrGZQtLKmj4IKxqYf2XCZXlOH7MHpX5LwacYarQpQeYpK0Rh36dIus9ThW?=
 =?us-ascii?Q?trmVLxDInDBtvNeJMLu7hhF1sUOgY5Tl83Y/e7ipQqQHor0dW1TvElMo/zEN?=
 =?us-ascii?Q?GrB7TZcoP0qHRmgNTCx34RuPnh/pYqkkwHkKKxamOfEk4yOzCio5iEm7xDcs?=
 =?us-ascii?Q?cg1MuVrJj64M84osDz/FBl9R+sBFwzPvBroCxWFpHSEGt+Ap3WdQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83851f8c-a54b-429e-7f11-08dec898d683
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 15:39:49.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hEKHICGIFOzB4ovJsTGOOZWSzaEwZPOPhoi83hLpsJhm2S7aoMCKhmOTr+wlJ72S9cA8VZ9APZ0906pWOUDHt4yxTLBod6rYL8+CwLUfcQNP5jibUt4OJgutt/AAdcY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64709-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:antoine.bouyer@nxp.com,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,vger.kernel.org:from_smtp,oss.nxp.com:from_mime,SMW015318:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC37667A91D

On Fri, Jun 12, 2026 at 03:20:32PM +0200, Antoine Bouyer wrote:
> Add the yaml binding for NXP's Neo Image Signal Processor (ISP).
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> new file mode 100644
> index 000000000000..458c4e4d640d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx95-neoisp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP NEOISP Image Signal Processing Pipeline
> +
> +maintainers:
> +  - Antoine Bouyer <antoine.bouyer@nxp.com>
> +
> +description:
> +  The NXP NEOISP performs a set of image processing tasks on the RAW camera
> +  stream and provides RGB or YUV enhanced image.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-neoisp
> +
> +  reg:
> +    items:
> +      - description: The configuration registers
> +      - description: ISP local memories
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: camcm0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    isp@4ae00000 {
> +        compatible = "nxp,imx95-neoisp";
> +        reg = <0x4ae00000 0x8000>,
> +              <0x4afe0000 0x10000>;
> +        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-parent = <&gic>;
> +        clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
> +        clock-names = "camcm0";
> +        power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
> +    };
> --
> 2.53.0
>
>

