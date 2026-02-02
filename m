Return-Path: <linux-media+bounces-52041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA9JINrJgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:59:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D50CE8A6
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A27ED306D4B0
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1FE2580FB;
	Mon,  2 Feb 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WVhK4VRk"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5C26E70E;
	Mon,  2 Feb 2026 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047496; cv=fail; b=PXIb78gfjXl8UgCqgj32K8ulGH5qrU4aZ/6V1txlzpu6812Pd9AJWaRfABIs0OAT+uK4mTVs6TAhkswerT6+ZRkSDoxvbGsCG8a00vtfdBo04VMQr3dEsMUlJ8DM5z+o8uO+SwztwWKpMorCb3GOAzfoq5t++gpvPjI8q7oPKUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047496; c=relaxed/simple;
	bh=aMspm7Z/PYZCpqGe3KcrGhqcC1CxMsrY2DRm4zqAZpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XVQ3Ts6AZ/IV1sQh0zxT7Jq0ISfH1sfoE1TmRpfrZ4+FUAjfcv3yR6uC/so6wO2Hn+gSIvsrmsPfo6DmGTyotq24eIr0LH88EVI2PuHsN2IqcUDyPo+T/G6auBAmF3xzfzlhy7Vkps93gvsOLfu13itZ+cP9UTPjnULMibP8og8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WVhK4VRk; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS4DNLJIsW95ZrDB+O1a9qMtKgRt7aLF3GdyExSzUYAEdDwd3Z6WoNwaPDqPxq4rD4yYLkqmwp2qjn0tIh2tmiI/At4lkpNS6e18CpVxOGhRcP3qiozUDej5p8S6CCC8kKvw4PDIW+hMe/t2Ck/vYu9X9JNrREUjRs7JlRvV+BcJmvixYcEUx6CpJjlVTu7ojUPESi72wUnR0rxiZA26npkdnAFYBwCqNTJ9vCVkwYiEhiFGM/ZdvSjtPUnlbJaPVh/64JAcp0XjZ2/Urn4zh3mukIWR/HKwVEzL+LTyR0ZOWFIXWurjqtVvwc+XQEijmRTt26O3MSthmC4WczpQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxCvIjupyvLfKQVBwgKjJvb5RxHKlpE5Gy43LdOVSrI=;
 b=QZJLu6sUE5DS3bBJxUlTg0JCww4NARAMvt9kXdpwcwnuLV64ZrDjqYLvOYhn1vuZyUnopJu7rqjinL566Ex4+oT4NFRfmCwpTgMKRpeUpxCv6YRuEeuU2v6ESJLFS2nKE6jmPXSoLikkwat6uLQ4cDx2RKwDW+2BfosGjnCU8B5MyE6688ezve4tcJ/2w78BSprQ+pY1rmwalEhF/j2eAhttGcAoFOIuJISUZiuL7s79948XKwtliF5qRAGm0Yb1fkkVlfZ+ZIMyJ3BXW84RQPFR5Oa7irZzVHVD+g32E22NKJFYy+FFrjI5ImAAwucbiJCOPoIP7sxYe8AQ3CV9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxCvIjupyvLfKQVBwgKjJvb5RxHKlpE5Gy43LdOVSrI=;
 b=WVhK4VRkHk9k1dtz+dbQ9rTgEo9owNmExHgdRPn+Ueak0lWBjpXUm7g1IvbDl4Hfl9Duym4DIdXsyk+vUWRMm0wTVzeSah57o1/7zAqPCbW0cCxbhytby94fFlvbai+Xn3QlPjHLZSCVRnBJE1xjcGrolPT9Tik+MCuRt5ZG2T+UT3ez6cB++cmXZnpVY7EzoqmkOkoYjD3q7Gqu9bvkTttPDOvNImRk/hFYP/um/F3fxzVxDJzsorCv5DPHbdOEL5l3mCdeLEdTGoDhjDgRArmcEbQ0/vLT0oYVy9o90eLGjLSvEGEOn35xOTbEoAjPxqiSXS0u+nGZfS9ewCEquw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11305.eurprd04.prod.outlook.com (2603:10a6:150:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:51:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:51:28 +0000
Date: Mon, 2 Feb 2026 10:51:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] media: mxc-jpeg: Add encoder ops layer for
 hardware abstraction
Message-ID: <aYDH9zll5dSPZGB0@lizhi-Precision-Tower-5810>
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
 <20260202095843.1030-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202095843.1030-3-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11305:EE_
X-MS-Office365-Filtering-Correlation-Id: bb323c62-64c0-4247-c367-08de6272ed02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hFOeKjQqxuBz6PypcRaaaOk3g0m0KI3iJ+F9mKuiqL5pO5pjSWfFjpSG9HS3?=
 =?us-ascii?Q?8eOcppzyPE0Yi/mnaYzzmEst1wabaa5guENufqTt+mH5tyDdDQsLUSlfMjKH?=
 =?us-ascii?Q?YYsn6Hq5wCB1W0GYFLNiAYU86zl4uS79f0AjQs7rQoI7o7mjFed3YNdqCmLz?=
 =?us-ascii?Q?q2wgrQsn/cuanXWivd+jL6oQaK4VkiJWd785tidHDE6GOiaJR9W1u77vbwID?=
 =?us-ascii?Q?wUEuQF1sbUIkRBLZqmv2mlhtFlBMUycQ5+0pAfEcCFXdVcI8fuMBgRYBlvXi?=
 =?us-ascii?Q?79i4ruJD54vsEomwKXpWnjqSojdJuwryrFBwnXhiYTwou+4myZhYjYmU/OEc?=
 =?us-ascii?Q?jtwsR7DxbnRfBXaft1+q1U0ctQgfsz0345/BbiWacCxPDsrmhJSevNf3X3Sv?=
 =?us-ascii?Q?zrw6c7deldmBRhWt+u2B7av/hGdA3e9ENvBn13E4LJha+/XkT2qvaARrT7y0?=
 =?us-ascii?Q?chL9GbWuPAFFR9G/DbcagOwDxPtBRWWCOuNNm7OBV1MjPO8sohwpdKl/hiTN?=
 =?us-ascii?Q?49zKi0i4Dp6FolnU7zNKqPionLLcPB4gUPxaI1Xhy7eUXD8THkyP5rJjH6SH?=
 =?us-ascii?Q?CJrG4wBmA/4S6+vhjAL8/HA9N4M+zBVQGumW8UB2mhHK/sBTPtiiqvojQkwI?=
 =?us-ascii?Q?0bLmG9BJEJ91krMhVpCo6GbEZqR81Fmz8fqsVFMCENzXlU7g98T/m4p22BTd?=
 =?us-ascii?Q?YfuRkJem3w8LRgaWSq5SdsarUARivajAjnkuC9itmNIJlotYdqL+ihR3OSkY?=
 =?us-ascii?Q?sYSGh7LvqR3uiSiAJxX1Y5jiLmujlpWb+cfXOrjRU+S+jhuCAf6Q3mD+ZRQF?=
 =?us-ascii?Q?GqShTl3BGEDQ9nfWkvXbGejfgri+0M0CbT7ivUyy0P9JrQEtPdoWSpPmL8BB?=
 =?us-ascii?Q?uIgjrZ47kiEd7Ad70xqJHxqDPEB33a5ef+yj+KarBuQCuKMBo7tqj+SFr7np?=
 =?us-ascii?Q?ICksDOJj8zr/BVVhtRSsHvzUfhBizzeg2aS76VreK+Rl4xfuuupaT0XtGXXt?=
 =?us-ascii?Q?85eDNcclRFnhCj3C/fFA6beONG9zI5UzPdq7QzSiyOkEc/VbcSZV0f7q7LiR?=
 =?us-ascii?Q?SMa70D4n/13MZAQnIQMb57hSjm4mWGJ970SbGnBRfO4bZiExKfDXzcqwnAdZ?=
 =?us-ascii?Q?n4ouR7aML39kZpQGnn2A2AZc/71nV9F8bVLnTi+Y6zxB3Kbi793WR+aE7L9i?=
 =?us-ascii?Q?hnov0bk3GC3apMKbuwMhPBcV24z40RSRHa1DArcwFlNrG+trJ+c4l/As1Jys?=
 =?us-ascii?Q?i9TOJsRqvwaySxS4zog+BkAgPjF7H1z8OZfaiYwuo7vYh7xcyroN9sWj12ot?=
 =?us-ascii?Q?ihXVUN+YQq+TAd78F+5Pb2Z59GMKt8YelZcYSxGYAiJ+qenAMz2Fq70651dn?=
 =?us-ascii?Q?9oNMKqxOAvsPCRU2QChG7eMEOjfcP8cAnUdYB4NO/En1HAaFZ6WGJB5t9f6Y?=
 =?us-ascii?Q?tMpIWpcuLBA1NMqvZ1LGPrTgNTa0xAjoGAIidgw4TqqNHnMV/bOxRhLSS5ey?=
 =?us-ascii?Q?RJSvdGA1wMM98wy+ME4CPOYnG5g3z5ZeFkbPOPgwZayqgFpgIyg8GlgylUYS?=
 =?us-ascii?Q?R7x90CLGkKd2vhnrGBquRmUSiWHPOjArSoHZSks9ocIdASoBxKs403IZnxPF?=
 =?us-ascii?Q?8IESBR2xBj40dG/CJ0QH1I8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQ7XfMO4l7+WB+MOdTQhqIhLjd1iGUGN7KERcSig46+W5g8S4z+t7mGSF3TJ?=
 =?us-ascii?Q?lVSQ68A6LFFGvL0EPL2WdTAIHTKmljuAImDSlRHBeOxDBL4t6m8czedExH5X?=
 =?us-ascii?Q?XpjqhHX/aO29sPqMNJaaZlyHEeJY+xp+jdHMy3Us/mcFTb7qOZB2j+hMVq8j?=
 =?us-ascii?Q?syUg8lNP+5N7gcP0gygIxbo2KS+oEj9RGx8RAhsZeyg3xvKXOcW3BPGDloAV?=
 =?us-ascii?Q?o7f/AkWokR+6M5etxFHNlGd0q1Ytz+Rhz6LLtLZu+F3YdlhZ5cWi+GR8xgv6?=
 =?us-ascii?Q?EYm0Wz3KeWzsZWz8RnpkI7jZ7cpwhnTe2s4IIHqjyPaz23+SouASxqhqcK/Q?=
 =?us-ascii?Q?8w4O+Wsnd749/CIFqyZeqvrLpLcx5zIepC5Q1Jf9Dfti4y4xqAH9HXqoJxSY?=
 =?us-ascii?Q?WFIh5AVUIlWs47B9XuTyJYc5iwSV8RS/4+uiTYfmays+RKuaFzy8tyD6vvZ1?=
 =?us-ascii?Q?AalsJUhva55JBA+N3hxPnYHJv9uR9O7xWFC7WLM47UwdLvqspEfOFDv/6rFw?=
 =?us-ascii?Q?6jlrTZE/W1Fh0+8HfZ0eJFZzO5KOuW7JKRe5qRDqTRAqzZ2rc205/iuHVspa?=
 =?us-ascii?Q?ObGfjzEofWkrTrs8jbaH/OFbYiRdDG4dSetEHi3wBLfOLtvfYOGh6QfSxWwn?=
 =?us-ascii?Q?wQv7N22qLQBo3xr45oZ86mw4HBgByZk5becBxrX04zL/ZqEuxYbDFgG3CBUc?=
 =?us-ascii?Q?D2gmWH8/4iPPWSYciNDNP924p1Ca2aOsvZlq6y68lp4YxAvhwAeNmm/YsGuv?=
 =?us-ascii?Q?ONdE3K+irqkYdmDtvIr/oT6GAkJXWkugK6tANqfbbd4UwrBZEO2cAdSUQN/K?=
 =?us-ascii?Q?g4/9xKrDDw6QCq4OPdcBH+p6WVx0JTshAVXkE3f/IJCaGr1AT+mx/6wDU1Sq?=
 =?us-ascii?Q?vdw5SOoWOPKPDGIcQCPE5FhyVL2i6QVjEBraozYrNU7LOnmexV0tBfVNh5IM?=
 =?us-ascii?Q?zSOSdWRX6s+hmI+D22zoOrxtB77iEnD1XvvtVLCbdn4jNxEpW8SJe7mQBimW?=
 =?us-ascii?Q?a2THr+pdrAx/ZGHskMzSejRZkCd8q8Nshk/SszstaU8GTq49Nb4a5uTaMRQW?=
 =?us-ascii?Q?zpng9VJBDSYjgBnMs3Rve8PP5A3FlETVoOIejpqsmH0ni4KMENLSIkmgMm6z?=
 =?us-ascii?Q?nm/ouz9x+vHjZxn1Iya3Hq2n3WnGeFZIYRX+IA4+G9PUGp5jwiCLjXTaNkzA?=
 =?us-ascii?Q?DZmhfXz1b5Xa53IVHB6XudlVL/fbYW5noDtxaGKlkdZq+N+WEQQ2ibWk9v3Y?=
 =?us-ascii?Q?cH9X722WmTZFnoORykULBIA+Tdt40Z0gNT4u0S+wVEfiCsklldrEioKkWpIe?=
 =?us-ascii?Q?8sJYwtr7eSTP41m1HolWUF2IjHnzlJrAEBw7USpMu2L+dVy4PszuyiGH7A7E?=
 =?us-ascii?Q?f5L9HoBjXz+ohvbFH0hJcjSweohoEqaqKrVM9QCsPFT24e5tTFeRLgUOkWJE?=
 =?us-ascii?Q?OXH9PUJtAcfsWyRLk/1jri9jCqAOV9VOAKPBeBZ/gCvN0R+i3ispasb/zWfP?=
 =?us-ascii?Q?uWwpWQd+K+hW85MKRFvYj6yZLbU/Oba3Rn9dRSmPCkdwxMTcW48W//cwKkR3?=
 =?us-ascii?Q?UAGGbhZhaoZZeMYooeLeuXzUJuz9yEutzwy8jS+R+WL99GlrW8NEp7v8uTae?=
 =?us-ascii?Q?61Bak+5qPAi9xNebj9gWm8cQRioYfvH1vAMOfKPhCXGa5EhT2MDhhldqklXM?=
 =?us-ascii?Q?/hR6nMourgcmJ6/6ntxJB+lHPF4rViDqdQyoCWry6jb9OAGO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb323c62-64c0-4247-c367-08de6272ed02
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:51:27.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ilyr7mlfpK+WQtBDtKjbQTzZoLaXlKEfc0S9cF33tjchE1eYUNERPizoztSgrE1xPbkAwnScrHV/1CW9/nypJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11305
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-52041-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3D50CE8A6
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:58:35PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Introduce mxc_jpeg_enc_ops function pointer structure to abstract
> encoder configuration differences between hardware versions.
>
> Extract the existing two-phase manual configuration into dedicated
> functions (enter_config_mode/exit_config_mode) for v0 hardware.
> Add setup_desc callback placeholder for future v1 hardware support
> which will use descriptor-based configuration.
>
> Store the extended sequential mode flag in the context to avoid
> recalculating it during configuration phases.
>
> No functional change.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 56 ++++++++++++++++---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 ++++
>  2 files changed, 58 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 39022c1bf36d..ede422364f9b 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -64,6 +64,12 @@
>  #include "mxc-jpeg-hw.h"
>  #include "mxc-jpeg.h"
>
> +#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
> +	do {								\
> +		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
> +			(jpeg)->enc_cfg_ops->op(args);			\
> +	} while (0)
> +
>  static const struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "JPEG",
> @@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>
>  	if (jpeg->mode == MXC_JPEG_ENCODE &&
>  	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
> -		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> -		ctx->enc_state = MXC_JPEG_ENCODING;
> -		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> -		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
> -		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> +		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
>  		goto job_unlock;
>  	}
>  	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> @@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>
>  	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
>
> +	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
>  	/* setup the decoding descriptor */
>  	desc->next_descpt_ptr = 0; /* end of chain */
>  	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
> @@ -1335,8 +1338,12 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	struct mxc_jpeg_q_data *q_data;
>  	enum mxc_jpeg_image_format img_fmt;
>  	int w, h;
> +	bool extseq;
>
>  	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
> +	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
> +
> +	ctx->extseq = extseq;
>
>  	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
>  	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
> @@ -1369,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
>  			 STM_CTRL_IMAGE_FORMAT(img_fmt);
>  	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
> -	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
> +	if (extseq)
>  		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
>  	else
>  		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
>  	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
> +
> +	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
> +
>  	dev_dbg(jpeg->dev, "cfg_desc:\n");
>  	print_descriptor_info(jpeg->dev, cfg_desc);
>  	dev_dbg(jpeg->dev, "enc desc:\n");
> @@ -1385,6 +1395,33 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
>  }
>
> +static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +
> +	ctx->enc_state = MXC_JPEG_ENC_CONF;
> +	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
> +}
> +
> +static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +
> +	ctx->enc_state = MXC_JPEG_ENCODING;
> +	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> +	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
> +	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
> +}
> +
> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
> +	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
> +	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
> +};
> +
>  static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>  {
>  	int i;
> @@ -1590,12 +1627,10 @@ static void mxc_jpeg_device_run(void *priv)
>
>  	if (jpeg->mode == MXC_JPEG_ENCODE) {
>  		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
> -		ctx->enc_state = MXC_JPEG_ENC_CONF;
>  		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
>  					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
>  		/* start config phase */
> -		mxc_jpeg_enc_mode_conf(dev, reg,
> -				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
> +		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
>  	} else {
>  		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
>  		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
> @@ -2973,6 +3008,9 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, jpeg);
>  	pm_runtime_enable(dev);
>
> +	if (mode == MXC_JPEG_ENCODE)
> +		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
> +
>  	return 0;
>
>  err_vdev_register:
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 9c5b4f053ded..cdfefb68346a 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -105,6 +105,7 @@ struct mxc_jpeg_ctx {
>  	unsigned int			source_change;
>  	bool				need_initial_source_change_evt;
>  	bool				header_parsed;
> +	bool				extseq;
>  	struct v4l2_ctrl_handler	ctrl_handler;
>  	u8				jpeg_quality;
>  	struct delayed_work		task_timer;
> @@ -125,6 +126,15 @@ struct mxc_jpeg_slot_data {
>  	dma_addr_t cfg_dec_daddr;
>  };
>
> +struct mxc_jpeg_enc_ops {
> +	/* Manual configuration (v0 hardware) - two-phase process */
> +	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
> +	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
> +
> +	/* Descriptor-based configuration (v1 hardware) - single-phase */
> +	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
> +};
> +
>  struct mxc_jpeg_dev {
>  	spinlock_t			hw_lock; /* hardware access lock */
>  	unsigned int			mode;
> @@ -142,6 +152,7 @@ struct mxc_jpeg_dev {
>  	struct device			**pd_dev;
>  	struct device_link		**pd_link;
>  	struct gen_pool			*sram_pool;
> +	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
>  };
>
>  /**
> --
> 2.52.0
>

