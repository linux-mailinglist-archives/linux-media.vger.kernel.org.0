Return-Path: <linux-media+bounces-52920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mICIGDo9k2kg2wEAu9opvQ
	(envelope-from <linux-media+bounces-52920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:52:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7D145CC9
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E90830162BB
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D0E2745C;
	Mon, 16 Feb 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I8NZa+WE"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95BE330667;
	Mon, 16 Feb 2026 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257142; cv=fail; b=AtjOkaEaddi7gttgUHBOhKo17qzAHLmjdeORWcaFx/ElrUH7+q/kbWAQuzqZzVhDOQmv1ZR2YsZls1RtjmdSjaxweqEkzhcwUf5/CDFvTj2QWxV3H0VFph04JpH+cI14cwdg8Fy5PVLD8/6zFfHkwEfNG7rHkORe5KgqIPbWa5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257142; c=relaxed/simple;
	bh=btA12CWBON+Sfh1cNBavg6+GICU5cUNyWhR1NBGvG/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sCpMClJBYPpOyBvJd7vBwSaJ2DHUnJGgVtSsuW7RBEXNgMYRV8C9HATuaIG1LSlsx5tsbtD1BK8c6sBummA1iqfQ56lshg8JVl+1Ds6Eir51NghY2szQJrRY+cBvoWpIZ++BicCfwl7tDgkoC1/pikM7S0rCOsDqxaTYdktuAWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I8NZa+WE; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM/elingkvLho7xwyyKv6femoZjjsgWOjLdC2SkFepthoNzdHVlBPyCFDwNNUR6eszWXTO/4G6LprLO8SXwygdZiRhpr1YeqV76oNzCCBUY0UbF3/7cLsKxbuwlanh4IhhICXcRD5BVwMqTYMn346dtzQ8NaAipyPq65AyJE7pcVW8Lmgp3oC60VRwPXOkuwZZXjo3lwLknlJ/KdDKdgJTUQW6V1IUqlj3xC+tt4tDUrxhzg1qOxCdkOhKGN1xTiCT0Me3SDzD+G3M8/EgbVOkweKsSGzkonMHY1nNuj76b48tn2hGn9Y06CXTFLlCGuavxuabQ9mEdSIm/xFXrNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD5xWHMajXqRIAR/ZyL9vvuHjG+gt6rApJ8AOyoRlS4=;
 b=b4aIiUdtMM0NFnTIx5Qg1JdGTkBXV4HEtDyvE3D1dY176fkwmFDPOI3MjvDn3RvhOb4M1ncfS5Ey7nDTEQLs/Jy2mut2H0nX5BQjk5uVsp7Zpn4XxuYqTI2GP/M+2N0MKHDiGbiRUb0Qzp0mUiUH4l8EiUfNPqOK4EmZTgSocSnxJRmSKDfAHvAw7Pdhq12iWMFAfPE/lX2orPe0a4SgOLeB54LrYwFuvy/+4QBarPrSGC6/cbjfUlSJE9GyBqpn72D6WUyLTQb+09HW8YcoMe4RG0XPYOeV4S+A6400T1LotjNDey95mJtoA8QQ844r9qJ4rdhJLkir5YgzAIpaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD5xWHMajXqRIAR/ZyL9vvuHjG+gt6rApJ8AOyoRlS4=;
 b=I8NZa+WEf0iByxAfsSoCj7K1dM93A2b1EKCZAspf9aKjawmM1gM+zkjFWGBJg5fGZQ3VwWx++Macj6ZheSSmkO6LxPsfgYZGKjIdYRGraVfl8hPdBqwEnUTbKgvqtRhdybYuQOC846HjMtNxEpVwiVo7WqGR5DoeXroaA6SzaQAALQVNBeqmchBxHZsFaOM0TkMVLddY5LDHzRplyUL7eS5S1ONFZ7bkRY/yj2FBRkwcdTo1AOyYrj/smpeTaBXwvkXd+uemlHGzHpTaTSX3niXM/h+F045UztpV5XILsiuONT95Keod1PkqXMw+s/Rjkq6j7EC/de80qhqcWu00ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6995.eurprd04.prod.outlook.com (2603:10a6:208:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:52:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 15:52:17 +0000
Date: Mon, 16 Feb 2026 10:52:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
Message-ID: <aZM9JyKn_5q8fTa_@lizhi-Precision-Tower-5810>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-5-8be6039f44c6@nxp.com>
 <50a82e17-1666-4ef6-ab6e-c0be3c780a0d@collabora.com>
 <e06feb9d-47cd-40e6-8c43-b24ff8a3e800@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e06feb9d-47cd-40e6-8c43-b24ff8a3e800@collabora.com>
X-ClientProxiedBy: PH0PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:5::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: eadbb53f-0c13-497c-877b-08de6d735c74
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?vztDUD73kN03ddV4kfpNXCleWi5kLEqBRsE8gDXO/S7YG0KuCY2HBfMJyDyx?=
 =?us-ascii?Q?CENz7+f4/yS1TyV01hFYzcSZzmpsCb/D8V5oQapWcrcgWpPnLAnrNVTreiJP?=
 =?us-ascii?Q?xCNJJcnfLkavhcRmZW2n2eQhHiXpAQgYPMu/yoRFVQzzsSg6VBHwLZYI7eEP?=
 =?us-ascii?Q?aKGxSfP6Jll5dJbn8HNkMHQZeD/t+UaOcy4tB+Mic81gwgX47xE2Y2qK7vf3?=
 =?us-ascii?Q?5a7z9zQzHQDFe2E517EzEcyPDL+fSKGx66RYidUPkMOorV4cQHl7EnCRsvDi?=
 =?us-ascii?Q?dTTnA1plFfxSMc6Q8xsLKZ/r1vOTtY1yTVUe8NB+jBbpChNcBn0/Ahwo8amc?=
 =?us-ascii?Q?T4DorVarWMcyNrrZMHhUAz4SCOSKehpKx2LLvTSiNTdgH0vX/kN+RpiJV0qq?=
 =?us-ascii?Q?XIpgbwtgyHtYC14WH6jx+p6HraBfU4PmHHGANVjP82saActXtyrg9TDYyi61?=
 =?us-ascii?Q?mpiVAmRDMGCsZvLNkTbFkp1sHWp7jNutGW8XZnQx/27pmzUWWpKHO/XN71qa?=
 =?us-ascii?Q?H/Hc8lVc3Gw/FQDEdNn/ExIpYBQwyUqzaPgt+MwV/xgspXMQsri7A7Z66F5y?=
 =?us-ascii?Q?j/ELBOPcw0bbtYJ/q5qJPGGal94O+l8Fly5/4b9QYixIdz/rTi8R8ZCox77k?=
 =?us-ascii?Q?M/wtwxHD2FpQ1UhWpQLhNNeGTe93NDOKhnvXvk7NKMFgC6GhNmdl0W+0TVh8?=
 =?us-ascii?Q?n4LaBGWD/swRV3c07ehdXeDq3OvhtrFLQbraboKpPJT2L+n77/OPhoINR3Sz?=
 =?us-ascii?Q?GwiWeeJ7yQBOqqymqaXhI33UqDgMPnwtSt/6iG04nvOo93WFKqHDS7QqX6In?=
 =?us-ascii?Q?9uDHQwRKFO+Sw7c6cf96SnOYhYIsC5qNJKGzpQI1M9dXi/2kfBv+WrDlm149?=
 =?us-ascii?Q?jHFlVNMWgl8RTvCTxPI9Wb3xHYvxg0ynUxvF5jC5D3T8TS8yofIPaIvm1QT4?=
 =?us-ascii?Q?yoPxDXCjIS+tOADt8U6BiJALJoKr1Htl6+rLLnJpDn6ham/D5zxxn0g2Xcj+?=
 =?us-ascii?Q?eS3n7YDGro2GdwvkTS4UIGINuUWQbfpnAvPousc2cpD8WJCWMWi+9JSZNgVJ?=
 =?us-ascii?Q?B8CRq8CTONOJ7P3SS3qLDY/H8SyQWsoXvwa7BSgjqocnJ8d0dnP83k+InnKP?=
 =?us-ascii?Q?o61ESyV7aXgyCa+MLg5iih6JOwEjFyWO+vxa39bGaJziY7qnWAjTzCrimnuM?=
 =?us-ascii?Q?fuUT5UZTfpQspZgdf1x1vguR+yMMxZ7EIpGhKsfhYZlGSXJFZKieeq9Sgy1s?=
 =?us-ascii?Q?jUtsWBg8ncixctyTYym7+4pd3sKKycclbJP3WoZfh7CytXgjVBEOUP7YOaML?=
 =?us-ascii?Q?fmlHB4Kq8dDP+7Yr8A5etxr1ertPp7M2ikHRi8cXNF3QqLqLGb640LqP2iab?=
 =?us-ascii?Q?EU1AAGncr3yzZbitf7NhoehS6cbpnKLtWNxiXxLEhRs85b2Opb9VSuFpWjfg?=
 =?us-ascii?Q?BxiqTduHONBb6p2uzSdc43bQ8sR5bbotRSiAH8QXEf5Nkbq0dBRSLJHIPLpP?=
 =?us-ascii?Q?nTkeFSq+nJVZcZKF3jb6f4dxo4vZhQu6mo1IfTT+zWgOyi6QDDXNWyO3Imn0?=
 =?us-ascii?Q?ZzTNOqwRiWf7gA/5wPtqMkF9KC9HFxZWvlpjRWeUAUatyjx8F5PX1OXvhwVa?=
 =?us-ascii?Q?DOQ8C6T0dIfcJUW7U02RStk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Eqv+G8dWPnM+yijYDUUAQIjN923j6XTEXaOXYMgJgnygiJBB6Et5pWwFGB0z?=
 =?us-ascii?Q?Jxv9xjylzhUmZQrBVDkY52/5sR79oUg5WdEb8IoOXKboOkkB/oUBwFgxJcOJ?=
 =?us-ascii?Q?5CRMWHGelsnsuSgj4nPBo9u5BK8GQqkdYABqp2Mp2/qoBZM9FD6c0+UWHxrf?=
 =?us-ascii?Q?OouSpih/rMI6KDiBpSjL+rAj1z77rIHPdcv6BoQ/CmN/2O5pWhD7c5H7vwxr?=
 =?us-ascii?Q?ic2k+w2SYMEnhFBILniknHAfCwJUVNmuyfupf9EZ6n8zskYXzWbETzkU1HKJ?=
 =?us-ascii?Q?EInSRtvjzkPNx2MCCJhtrLfFI/8NC0g67orrm5Edi/vGFkW3OtBu2kCKO1Bt?=
 =?us-ascii?Q?ZT6PH7WAwthi6jnG3S9wI6J1U/a3BZcz1g8GXsoNCHthinbX+PZLETNlzbju?=
 =?us-ascii?Q?AJPmZGa6ubpXO9dqsSg6NdJ127cgQT40yZHE6UdCSp1/5RVsH+kDbLiDvgpn?=
 =?us-ascii?Q?zJU8BQAItm5bJv1U2+TVKvCeXnklj0deDjBTt3wDZK7pW0c2k4YVlfH/AMiN?=
 =?us-ascii?Q?GIt4CaQkBgU0KdG6XzjEH6yIzWhRpbjAnW9eFQdfFjszmUiGCVpiHoOcQOVW?=
 =?us-ascii?Q?Qf/ratMhUDD1f0q0S8tAI1smHPpEceViSH03p6RMWTu0Ze89cR5CSxo05sgq?=
 =?us-ascii?Q?rhHJljSMPXXmVrZIZvw1maUn99TRtLb928yJUpelqADScz6GNzPYVGfIcm1s?=
 =?us-ascii?Q?iJHsQZZFoaoiUWNFpymRwZHJGP/8S3IY1aKbftYo6aqdRWCK27R1xeUx27aY?=
 =?us-ascii?Q?pSoDh89bs63CwW1vXo++mmDVhWWPIoH74vhRoFG8j99e48rLVJ+xL7cvkiWl?=
 =?us-ascii?Q?aM+m5p2H+P7Fp5EhcgTdHG1p8HvHOGgnf/E286z6iKemHM0pWUxsvW7pG5aA?=
 =?us-ascii?Q?QMQd1dqdEcFAshmRXLKVeKaX62elJQiH0kqSyfQ1CGAOSDwJqYu7AF8oQ5J4?=
 =?us-ascii?Q?V0ZaQkU6RyzUg+72RwHjU5WZvNuQo09Gnfnc+TEX/Z3teZJrtJ15qii18Fd8?=
 =?us-ascii?Q?x7pHEuYQuPRZ6xWwAWTP7WpJTJSCuay9Xsu+QdfnNvhfrXlm/BWUc+hZqCBy?=
 =?us-ascii?Q?wuTS4/gohGL2bUtkB9FHUnRkgpiscMJCYqhTpSCiqdPyuuuYXkAAWocig2aH?=
 =?us-ascii?Q?qAQmCRTye1oC2j2dY8hDCVz8i9qeAmJI3jjVZrjjdi8AZ7WUZBEB7NFLc+At?=
 =?us-ascii?Q?I9JvweTFK3b+yRhEknZ27mUalR/qIpZcsZuGFpX1zJUazIJcX3/+r78NQ90F?=
 =?us-ascii?Q?1V2vhp1yQErTrjIj4zzkbxnN50G5fWeBeZs/QfkssJFYU5hAq8raZWRWTSKB?=
 =?us-ascii?Q?mMrt2dvN9O+JT2BmBSzSWm4ixItNL43Q1s6jlDS6OV03Fx7EFNNgtvse1RPr?=
 =?us-ascii?Q?+GNQNq/KBdGIqfMKRM9fj5CIVnUibSVKCrCRHo+qaZaLnxEb/95OuabxDil4?=
 =?us-ascii?Q?eq0WeG6BrKQLgAp018IQyxasd3M4KCmbb3dK2+E+DJ2gaJuuj7jDafEa1cbW?=
 =?us-ascii?Q?IvaQbtT6YOswt4fI9i+W602bWrC3rOew9zywrfmA0386VCH6+6dQUwjO0LSm?=
 =?us-ascii?Q?tgpmXaTrV4jMERpNJXQCfOQrWEs9z1oaSiZLFh9vFSbb1ogOKubf+qKDJjUw?=
 =?us-ascii?Q?pdSpz1mWL9o7Z45mGD8BvGQo3O2Ef6EFmsxpJEGaPelPHmrAQVEb7i8YgFI+?=
 =?us-ascii?Q?t3Nl95rUrImz6E9bk0LaWwK9o89kkTAXjPwhBNReE6UDihZ8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadbb53f-0c13-497c-877b-08de6d735c74
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:52:17.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoY3vIh5RwoLy1kI2oxrT6JbHREFB2BifdPOShfD4M6KjRuT/ctY7JWipBNAZYZ2kEKM/ftL2p0D4n1oPBgYlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6995
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52920-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: C5B7D145CC9
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:22:13PM +0100, Michael Riesch wrote:
> Hi Frank,
>
> On 2/16/26 09:31, Michael Riesch wrote:
> > Hi Frank,
> >
> > On 2/13/26 21:25, Frank Li wrote:
> >> The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
> >> Rockchip RK3568 implementation.
> >>
> >> The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
> >> "fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
> >> rk3568.
> >
> > RK3568.
> >
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > With that cosmetic fix,
> >
> > Acked-by: Michael Riesch <michael.riesch@collabora.com>
>
> I just recalled a conversation with Heiko we had off-list a while ago,
> and back then we kind of decided against a snps binding document and
> compatible, since the integration in the respective SoC (family) varies.
> Thus, we went for a Rockchip document (which shall be extended with the
> RK3588 variant of this block, for example) and thought that any other
> variant (e.g., the one of the imx93) could be documented in a separate
> document fsl,somethingsomething.
>
> Seeing that interrupts, clocks, and resets are different, I would
> recommend that you add a new fsl,... document.
>
> What do you think?

It is depend on how much difference. Conside Krzysztof Kozlowski already
acked. we can split it when more soc will be added, if-else branch become
extremly complex and abstract more common property likes dwc usb at that
time.

Frank

>
> Best regards,
> Michael
>
>
> >
> > Best regards,
> > Michael
> >
> >
> >> ---
> >>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
> >>  1 file changed, 45 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> >> index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
> >> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> >> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> >> @@ -17,6 +17,7 @@ description:
> >>  properties:
> >>    compatible:
> >>      enum:
> >> +      - fsl,imx93-mipi-csi2
> >>        - rockchip,rk3568-mipi-csi2
> >>
> >>    reg:
> >> @@ -26,14 +27,23 @@ properties:
> >>      items:
> >>        - description: Interrupt that signals changes in CSI2HOST_ERR1.
> >>        - description: Interrupt that signals changes in CSI2HOST_ERR2.
> >> +    minItems: 1
> >>
> >>    interrupt-names:
> >>      items:
> >>        - const: err1
> >>        - const: err2
> >> +    minItems: 1
> >>
> >>    clocks:
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: per
> >> +      - const: pixel
> >> +    minItems: 1
> >>
> >>    phys:
> >>      maxItems: 1
> >> @@ -88,10 +98,43 @@ required:
> >>    - phys
> >>    - ports
> >>    - power-domains
> >> -  - resets
> >>
> >>  additionalProperties: false
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: rockchip,rk3568-mipi-csi2
> >> +    then:
> >> +      properties:
> >> +        interrupts:
> >> +          minItems: 2
> >> +        interrupt-names:
> >> +          minItems: 2
> >> +        clocks:
> >> +          maxItems: 1
> >> +        clock-names:
> >> +          maxItems: 1
> >> +      required:
> >> +        - resets
> >> +
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: fsl,imx93-mipi-csi2
> >> +    then:
> >> +      properties:
> >> +        interrupts:
> >> +          maxItems: 1
> >> +        interrupt-names: false
> >> +        clocks:
> >> +          minItems: 2
> >> +        clock-names:
> >> +          minItems: 2
> >> +
> >>  examples:
> >>    - |
> >>      #include <dt-bindings/clock/rk3568-cru.h>
> >>
> >
>

