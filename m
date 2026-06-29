Return-Path: <linux-media+bounces-65980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YAALHM+JQmqb9QkAu9opvQ
	(envelope-from <linux-media+bounces-65980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:05:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 068136DC70F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=FhjaGmCx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65980-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65980-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60CC930B0C43
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22793F5BF5;
	Mon, 29 Jun 2026 14:57:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0022E06E4;
	Mon, 29 Jun 2026 14:57:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745049; cv=fail; b=tuUDRgIwsi3jCduOIAk7ekwhOXjxOzssnmXCeGFbx04b3yq/9xlIQ+FrR6/kK/pKWYva/Z/dMOh5xZFiwOcjA7ltqNZOXXatfy82su1POjXv7kbrJ8ZXFjfogltltaPB5PGPEobhsY6WJZ8RQlXCf4g7ZO9/9WsSBAgM4VohGTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745049; c=relaxed/simple;
	bh=X9wEqrQpUooI+5ipJaquvKqrfxUDM5lGpf3vT0Cb8nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=diK9GQAcJwr/G+wvvgVjmExiQyOzmCB/L8nbFyZVynvcxic+i1XKAdcn4V6YAyT1KJE9zsTxVsdG6tGbu6qJKJ+1fMmLBXr0d+uQdjRneltRk4Db7YII/g6Bxns8JnR6s72SgsrdQICC/73zEXKzMsmvKv1CYcsNDm1IJvJcL+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FhjaGmCx; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq9nbpe7hRcMFdh8EkUoC/FHAZ7fuW5yNdiT79N7QEVwK4fBU8JG7Tzm/R3C1JM0EYuiMwSRLHL0eO0lB/b9ZM/s+dD9MSUdip7h+96lW/1LC6Jds3saUQZ9GLjZBf06aeAmpwADQzD5jhjPKbVpRSBdZ2qZbv0blW58C45VFTAafzHyrviZfGmHQIYNBlGrkqCcJDm4ycsCTa8dfuoqgrGoGRXi9nfKFgSrO5n3fpA6p0SxQD6ojPQBCT84NLmch4TK2F3IF/XeeVd+pwwgow1+eAGtNRWeH4PB4YYaVtND18OnN6ciM66o+1Z/ziqmxn3R9Ovuf598qewx+J3tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/u1WPi+N8qxUGERiF9DGe1utbzEb0Znb4/E4Lz+qUk=;
 b=ryE1Uy7PljkBZxctH8ILZjUfshYS+IolEXd2esPjSnVQ4rH8L7lUeJygcvWQwDFNW1TI+waX1zprrqvTeqaM2L19D7z9n6UIB/QqhDTFWhDdpWjaAP+oikSGtHmKU+2Q3CZhBC5PcqEUUS1E2SKpbjvDR1ZHw+2wrEeCLHyFTb8Adklu1+Rd6qqduLtxI7dWD3xfpkWn33ItL8oPYBHjzec65AxNFkLR2j1BBVjV5oOR3Udbb4sIoFbBAXPdomYpuqZKWRHN/bj/fJeF7fbXs5iSYX/TAYv5Kyhh7LouYFDw6NV+UBMhw4mjMYWfEPPlTflwQWfcnogVpepTob9lUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/u1WPi+N8qxUGERiF9DGe1utbzEb0Znb4/E4Lz+qUk=;
 b=FhjaGmCxYZLit0VP9n9d1BYYvZvATx9l/JbQhL2THaVf1dSmvfUwCJw+/H+MCKHu9IYmLHR+mltGpqCZkF0xET7ZeZNoiFDMw7tI+9EdvWEb8tS7MXfOiz6U3rby1FX/u54RnFWWZf6XmJSyricFH05BIAF3seukIwGLgMbzljWXTGCbxpRLH+4c2RSpME0W6q7Vgzr5eYa4ojTZAp9ZnL8uwP/6JHnr94oqGLjrudjtBXUpyBECB9ueKj3/nTN09rMSNLH6/BtOfhffPzUQ3JaGFxPQN8inZRcnkL5ghnc6UeSHmYs+pLkaM/KmCh9gvA3klk4WWFwVwKGJc8wJKA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:57:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 14:57:23 +0000
Date: Mon, 29 Jun 2026 09:57:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH 3/5] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Message-ID: <akKHyBl-Ejo41KXW@SMW015318>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0112.namprd11.prod.outlook.com
 (2603:10b6:806:d1::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: c833623d-4036-45be-f43b-08ded5eeba1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|7416014|3023799007|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 cgE43DdbqFSnps5/B1KnA+jVN421K6Q1t8+zghcweyO/Mpkq7qQgzqcV0hT7Oo4N9u3sWz1egKohpszOlfeH2VB1jOy3xZP9EDPeqVFZCzjnmvEsmmaTXFVxzG7dyCSt1JiWB6YzKIdICw6dNmKkjcZsxyh7g7xwbUeSRU1AgX8HMNeTKbXBqhpkGVtjipRIWx7j3GufCph/dv327Uw4bw5YDu6Z2L1Akex5mnoEE4XNGMLhGwDZGX4vHCn0x0DkpRjWCP7o3ER3fGU7qPwDexs4o4WDtghK83+kiLpRWPVNeFB73MD55SnJ3yXTChiISkgZLVAI/wb7GPAyjp/OuDnC2MB5UJv0GGwQ+Ugww5NX7b7IFUotvSTc6JSbnLcZCNoX9qO3vfJ55SMLuovstf2B1vHIJbh1UnVIF/WSq4OFgCxDsHEdFyfYc/x1tTjfO9DQ7/YVe9pf6YQ2WqoLma0SsYEg/YVtkGvigPeiRZ3elJknAbTns6RBLzhb9sJEVM/2UR2zCzIEPlVHezi+mg5uvhs2diIVLH7zFjIFDGZPOp6INtd0fWRZWvlqKSOJXl7H2xEo5QpapNMqE76tf7anfBsizxIPnbGFw5WvoMyGVFtKR8YjqYnDGtMaDPHsOTXjd0YFgDFdkwhgvmGHPDf7CgWBWWFg916cA8g/udA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(7416014)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qSJWsN9Ko+mK/OywH6cEjwROpXDK1NS5O0QDx9n+8tpooY1BiXQeGcxS8Jit?=
 =?us-ascii?Q?X/h9LSexUDJPw4nF9nNg2vuuU/aHe1Z4JwRlQ7KYNkOkLnJ8SqFp2laRjU4z?=
 =?us-ascii?Q?3LbWoLAA8jqmg2Vg8alyE8ABAPVLymnUdJXmxmd9FGzhhfDP/HhYvPU9Rise?=
 =?us-ascii?Q?GNvFl4eNXetoA5dURhkZz0+QeneoDFINpsV3uI2W9H3oWeAHlL+v8tsvaoz4?=
 =?us-ascii?Q?x5cAD9H9dUVBjCjA91cvdlzehT3mMVeWD3hdqvYqvFMWKYEJR2nm91uv5JY6?=
 =?us-ascii?Q?UAE8U/LtFBa+67cmIz5LWiJBYzPLdiyNGrexbeJYUPRLVfZIpCs8hMEKAsvY?=
 =?us-ascii?Q?EUekUjlZMTVxmrGkyE6XGBSvwtXfODj4H1Bsbz7Cp7Qo+zKPy0bsd9J9j7PA?=
 =?us-ascii?Q?SfZylliY93BW2e2BkzI+nZRGKfvHBmJKznBPKb2+Pk93zbtVvqdJZ1XMg26j?=
 =?us-ascii?Q?UEfIabEDDJ9D1cgW+GmEw0lGNDtdcEb8GnCbgMXJOFqRxfDF3CaYVpBnO9ZH?=
 =?us-ascii?Q?b+2Tr/PGQjL2xF7cNHkHV1S4Rl0m0cp1TYYpP20ashJnKyk9rOi0xdplraCx?=
 =?us-ascii?Q?3HOo0cmh7XBDRZCJms/0u4Bd7uSWZ6sunqRdF+9IrhHKN5qiwNT8/bk8bbST?=
 =?us-ascii?Q?S7sxyfvZ2LnQZXBHZrCMhw410G2ig6lXz6JZvlkobD/eHtddAVb9to4dI1qm?=
 =?us-ascii?Q?Xn7Q6MGszieqQUkonMtXb/kunmEtBkJyRdHgnPzCz1NHbmV/tZQ8/NlrnpsP?=
 =?us-ascii?Q?XpmsF9ZxqGHf6QgAYgyJXJ3tr7KC03+MWx7C6QcHLrXK3agSKW9L9k2kuMQK?=
 =?us-ascii?Q?M2n+f3qtUWiNd1U8lHT8o2FlMPpiiEe2HY6uQJFic5iS21rDvUO3Li0pmnvA?=
 =?us-ascii?Q?gBsdpqhAAK8otKIGVZ5REqzWeE7XxMZjLyZ/qIJB3Be4YbF1XPNclqnZFsaB?=
 =?us-ascii?Q?VS0L7WvtGqf3481TXUmIVbNj+WMfE+4irse693/oKCLGXW6ImahSY6nsBDPw?=
 =?us-ascii?Q?0LYz1j550XvciBZaQhZ5MTYcjeWgYtDuSk/CE4EmjoIixpThdOYTkCSq4h2o?=
 =?us-ascii?Q?xQwer+aqoUTxbbsHO2ViW4D5ZGkC+pMgo/JnrLRh+lcmj6tIkfZTTjL8YkHe?=
 =?us-ascii?Q?37vbllqmL9vWQ/fXN6ThlwTYRi5IIl9Hkq3zqeh6Ca92Pjdu8bvJZQ6RNRWn?=
 =?us-ascii?Q?lzsYlOKU80ndylcZjuHKRcqoqIWoitOhJHcEU1PHgIiauay95X0yRL8mLr2X?=
 =?us-ascii?Q?2M4Cmp8WCXa39cziDHR2SiuObDKTz/8p4+nEv9Hpz6iQnT1XKt7v0jZqrvwT?=
 =?us-ascii?Q?j6425C8g/ckA+eiOany/sVb5sdZHWqNZfr6kYL7sbiCg+o4SXFlan4avEyHi?=
 =?us-ascii?Q?a88xbe5HgF24lDPX8UqRSWhNJQFh8/5QosJqgbqRjN6qXpHqCa72T1ghljt+?=
 =?us-ascii?Q?xynyAZppb/e4TaVmtc85Dxyp4vmtgOPzXp4N7BTHztmF7CfQfETUgpvL5PXV?=
 =?us-ascii?Q?ENx7zyVGvISe1QawCFcWsJjdw6vorUIn6g0GWG9ef1tPsXOS50sYRer3eZLY?=
 =?us-ascii?Q?157ycazFNQN+W7NXgNhB1e7Zc2WRgtpd7nC0tf4RKN+CHi9GnU4SfwGjVdhg?=
 =?us-ascii?Q?bQfRcAxeLXRIzuzahBxktTNqGTljTj3VojF355rAh1XNDDHJPX+6YfGTES/r?=
 =?us-ascii?Q?Op0fnmlzfbLsL4JGRienVRj51xX9yrAli4Y5Oi08JZapJ6DMnP2KhV1UaKZo?=
 =?us-ascii?Q?ETECj4a5fC+IO2bj/TKegVLuo6VE2Hz/6OoLQpGoY6b6vl4mVA3h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c833623d-4036-45be-f43b-08ded5eeba1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:57:23.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDotvgrI6TMCLoqsQaio8Pak7ZG5XM6tsoppjt99Y3l1T+bwuMaxVHcIK++6aNRAwK8tz1iCU+6XdcaYKrqUW9+TRo+tOfqvYFACmBJ0NgrtzTkA/l2yGfeJLE898xyv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:laurentiu.palcu@oss.nxp.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65980-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,oss.nxp.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,SMW015318:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 068136DC70F

On Mon, Jun 29, 2026 at 03:44:57PM +0800, guoniu.zhou@oss.nxp.com wrote:
>
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
>
> These formats are commonly used by high-end image sensors that output
> 16-bit raw data, enabling the ISI to process and capture full dynamic
> range from such sensors.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 36 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 2d0843c86534..e58925d71164 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -179,6 +179,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
>  		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
>  				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
>  		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index fe4adfa3a1f0..5eb448f4c26f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -356,6 +356,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.color_planes	= 1,
>  		.depth		= { 16 },
>  		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SBGGR16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGBRG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGRBG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SRGGB16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{
>
> --
> 2.34.1
>
>

