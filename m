Return-Path: <linux-media+bounces-51389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGn2Ewwtc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:10:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F04723F3
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C069F30579F6
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FE83446CA;
	Fri, 23 Jan 2026 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nkfxO8OG"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521C33C53D;
	Fri, 23 Jan 2026 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155582; cv=fail; b=Ju3lb8itK55rNctgFV+wlY/jBn5qHKHPVGXiqSr9tqIiCquMKyfRGHbyCEPKGIRgziwseQFdiFHUqMZdCan+s4pZnTRdOYWRbUC1rxVm+pPq1awhp2PM3lZ271e8LSm8w9T2ef+ysChnpEROv9cZkH9GoFWoaM+kEaebhD5J8N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155582; c=relaxed/simple;
	bh=t+cn0Kj3R8F7IjjL3bAIqL8WhZlGQXcN1TGOSEh0b5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R9q3/6HR1feOMN4EVMWGd7NDkU+sPCaaZir6lQURM/4/V+BkRQHfWY26erRI6ZlCv5o4h7WypJnOdWaPmx0Tcaml64B5TYoI6xzb9VXNtC8uuBhhJgiUktqNsnopB5am054+NUA/gUdQ+EJhRyZb2oqtJnl4oVbQqamUvb2dvzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nkfxO8OG; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/l9PjJH63Z6zNI5cjQPz8b9z3po4u/L6KnZtkQq/Bgayvbjis5oDpzwKNdsPL1MfD1MwXp3qIcpVc9mnoNW+ADmaEUFyKkJXOuCVnh39FPkuPt3b4QrHlOmPgw0ZYZdQlpcR6HaMs1EpWvjh/FJ/o2xomgQUiubmOyI3glM/1V3c91BLbWi+EIvEQBESWUR/m6dUit/chXlG7Ry9VHUckoxw7fzaEoIaoEJ5gw4jOz13qpoFTmDuSH+CXy+VrLDOm+tLqwaNUf5pr4RabtE7c4L6utKvQl83BqosDQ+SzKJymcqXbN0liYrvqnPYptuxAQTMM/xij9BjLev6OFuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCqTEfTykEiz2CNjpeF8sSdmKnv+ngiRI6OD1IcW20g=;
 b=mZRhfOPfGj49T+dYdbSAeT50S15VIbE5TfXAZA66zQxDdbAgYOI2TMc6FXj/JpP8iVKFAgGnXTOM6mywbgJMvNxhRpBG3jUK02hnYHysp1VbzMkQmBKaOJxnEdW0Bh0qSRU+SnJ2S8R3OMyBrRZ7k5Kk4n0ppZapTq9YChgPsxt0RHp5omwW3ALgMPpk7uoY+sXQdbamwquXzD7d0k+bQsFTOu01E+KWRfKl2QsYHZFpTkPf8tPhyg/3fZ/7YKAsdLTEOLB4BOxxzOzhtq4/URBvn5m3hQNjGdhrZH+09ZuMKBPFMQGtoiGSDrYURB2prrch90DRY1GYMTleJEdoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCqTEfTykEiz2CNjpeF8sSdmKnv+ngiRI6OD1IcW20g=;
 b=nkfxO8OGEEFM19mJdSMPONB393xWImkzeSapBPtD5xmpRwBIqqMZ+LTCYNBWr+PPZ8tDU8JmXbwCoUgmJn8GRguks4QQUcaiTfS+aPLDyUcIDwqx0VOXEGPAFud7j0RtfINh+3T8HFdLPeUEsuDZ1ZP4SuuRLd5xnB9wMTtDg0j2WhrL3IdusHCy/8PNoEYhNYFqw/PYPGcpIhLhPJx8Fcga8tKVdoU4GAdHOG53MkqUjs3zlT4DzNs+p+bQG0b+sidEQPqglycc1fs3bWnqTWC09fARWvit7Zjha+lFHky0/WbZVHt8FBCoW8FwY6AwFgkoliyBSUOa4NAUjd37LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:17 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:17 +0000
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
Subject: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
Date: Fri, 23 Jan 2026 09:09:28 +0100
Message-ID: <20260123080938.3367348-2-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: e213c87b-2f02-4d61-e2b5-08de5a56491b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/woFGUCNnZ8OIPd+hX+ZaD1kGhdaKzNI61mNrRO4Cd+v8CjXAvVgVNn1fXXC?=
 =?us-ascii?Q?s5lIUqOds8+t3YsliI6G46tq0TLXv5dhmkG94jz4FtBxntJ8QHkW5TCvCXhO?=
 =?us-ascii?Q?72XOT1YECkjaNhmdzwEDuWOfbUcB8ub1LvPe+sA/qHnZ2mZbVz+p3xq4pKU4?=
 =?us-ascii?Q?5eygHjbucpGW3kpfWLI6Knyec89tzjQg/dPLVmRslsQtzKEk7kvlGSK/YHGS?=
 =?us-ascii?Q?6CzbVRMwXGRskzySF5u/A/RfOe18FeJSD329OQC1YQp/mYyhqoiHlmgLZdcw?=
 =?us-ascii?Q?K/7Ueb9JEo/GhJWMVTK5cJNKj2VPlNlRcGTCnq0YmVyxzsQoSf5vqTjPmT6E?=
 =?us-ascii?Q?JwNrZB/uHMOKD3hOYGxK7b+HUFOOpxCITxG5QkaTfAoPFEwy1uWgykhIaW9O?=
 =?us-ascii?Q?t/zuJ6VndlL39Ii36d2mktEj5r7+ABgQpiK03wyWgwoZcOFm6RAQ6N6eNvIM?=
 =?us-ascii?Q?yc6TaA4jrI5gZhp7CjD6usDv2QJ2b9vPxXjoVrwTlC29Gy09WamFDYY7IbZ1?=
 =?us-ascii?Q?L2G8Oaxj9ePtuVTo61jYlOj48ufgLQN9G11wkZXWfixZTrMIuPvrQyOBDftU?=
 =?us-ascii?Q?FawD89Tt0lyVWPxReptozBNa/Av0yoSh0pPOo3WNlMApaXqWVvADJl3cuBhC?=
 =?us-ascii?Q?u7oMhR8vx7DA5GJpw7Wq63xA39X1sXu/WyrJK5RfTJbUhL/qzK9qUQrgnplY?=
 =?us-ascii?Q?5fcEglGqSHdHPUL426QD1ggTgUxpTgZmu6Zgqxyb1SKAh3Ipor8qWdjCJEiJ?=
 =?us-ascii?Q?RJhkDH7KeqWZQ7d+RyLnkMZALG0W78/gl+T1mH12Ed6cHa27ODiOw7SSfVNp?=
 =?us-ascii?Q?MXR88JEh+HBtklG20hVmxyEdoiicYUchw60JkXs9cgu7qsEwQ6JzzgvKBbgO?=
 =?us-ascii?Q?fOxhMfhuzDsiNIQ/Da/URmP0QXrJbNh7ERsHtZKZfLZQ/MsNquyl272zcobq?=
 =?us-ascii?Q?Pu2WliY5s6OoGB7hO2TE5qB+mi2e6O+5aBynfdajCESHjoExwcULuTEaLHRC?=
 =?us-ascii?Q?W1BSlMHxdoCX4DZe3TPB5wvfCoWYqnLNR2v+INlfkPG8fD+Kj9esK9WokaUK?=
 =?us-ascii?Q?ESAJcTgf/qys9GuNjabO6ty2ChL9y8PJNO2FBUW5NRxIqRVkrx2O04glFhyl?=
 =?us-ascii?Q?HeuHzkfHO0HFPxFzqVhSzH5chYL8tX8jEFCgT1fSNIAzWVE52g9nF9DiwrLn?=
 =?us-ascii?Q?kxGjWCw++ijRetzrRA9w/SQZIBQs0D742s+tAtAOKYXhPR5Zu7hxH3/Hclvo?=
 =?us-ascii?Q?d+p43a6dqV8Y256IH88Wx4XykjEkLdlCSdfoyeVNrEIYN0sRorMyM1zX6NMh?=
 =?us-ascii?Q?j2IFOQ/BeZrYFpmCu6/lvD/2xGtN2BmgBWrSNzqfUe5PxzH9S4l15U6ERADl?=
 =?us-ascii?Q?NUajWu1rso5ZreKKDs1auwFkScy8XP2aNNizxhzGALctFyNUUcrujJJGi8aF?=
 =?us-ascii?Q?5nrRIaGxOedgNtsqOS/WlkZ+CNff8DRKKaAp3gdD+48gK2MRe1q6SExdBnMS?=
 =?us-ascii?Q?Tg1EGTgB3yvpx0Byfx5snAgBmguQ3ejn9AO+pYMo7/voymYE7etlYrMqSxXy?=
 =?us-ascii?Q?mqwXMIa2AfkoPhi2LefxhAp0CK3QIOz2QKqXI75sySRGTcsvW55ZRkb3Dg07?=
 =?us-ascii?Q?P+JcEcUalJIm1ICCRPXn2G2ykx9/8O1OdfTEebWYFm+8?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6VyQiOsOvsYNhhjWLU9kGNCN1qydim7x2sRPzYi1UAYILbIANm9CSlvBrsXP?=
 =?us-ascii?Q?xRJH77tB9awYY36pUVO6AEQOn7C7F2wI6Fw+64W96d3nX2Phk+rULfcXet55?=
 =?us-ascii?Q?RgVAPJBJ0r+9orRM7DwUmBHJUhUC9WIwnN0fIm8lC4WaSizADK2Rm13G0CLM?=
 =?us-ascii?Q?z/bxG4UCPPLqhK4RXvCC+KcIcgcdlMlp0OyhkH8qZsAo6ZkVwgKLbHimaeUk?=
 =?us-ascii?Q?I1PPb5iexYPB35xFdmj1j2/8hwExuzPkidNEwJ/yszbOzfxzcr+ORjyZoUk9?=
 =?us-ascii?Q?dgXoEzXAdbNJ0uiuUMv6jXKPNQB0yPpR95UsA+Ehu0IZVYZ7kRx/WBmxyt2z?=
 =?us-ascii?Q?/7gelDPrNZ3gY53iHL8IB3MuD86usdGEB91bbOeL35HZ6bxODRWaxJUWKKWr?=
 =?us-ascii?Q?YgqyqbWeme3YgObmcRHbDy8aDJDL3paQtESNOzCsD9S0aKvjzxKR+o4l/1Y2?=
 =?us-ascii?Q?DuqoO7+i5gEzT+3DhDPB2fxnCTYdm6RrZ+vWsFvgojM5vEvozzoBjpXjLZMD?=
 =?us-ascii?Q?Y+F/UCFKMna5tXheYAIuVFDO61bGcC/0zR4dT4qoB6cYN/0jV1Ssz4GA4ex0?=
 =?us-ascii?Q?Pf3rQEMQu9Iao1EX1VwYz7WgGBqNSjwfBIFWm9v7GpWtS/kL3o8VXWfJcbf/?=
 =?us-ascii?Q?TP9P1d4j2FPNCj1sEKQrsIC7dMnLd0XuoMtPNG5xoQJ3DLRAt9Oyq/IhPn1Q?=
 =?us-ascii?Q?+iE+UHaVnIftb77FnpqI7VsRIl8ffoxB7iPQ12opIMSHdY3uVKGShLuwUlQg?=
 =?us-ascii?Q?0pfTJfE07y3JpHO/dAIZAbN9ORocKWZrr3/DUNMcRAVJ8/6i0Cx3nbAlhq3w?=
 =?us-ascii?Q?Xl0rmnSswQPz8fIrUJViIC3cZ+zHFQNYTgjI/7Tm58Sy9Bn0J7ZfSeUIjtv7?=
 =?us-ascii?Q?X/xIFxuMUmGXDqyzMisMP3vF40D7sNlhQIReIlj2O68b4FxmwGz/ecuvRprB?=
 =?us-ascii?Q?hNVJUnisZCD3+4x4DT7r7CmV0GPzBmUyJu+veSzshWhxQElM7QSTgw1n6HM7?=
 =?us-ascii?Q?VUcZ1FFKe7Tbhw+tKT7BLnBFR0EiQGh1c59piNO6stv7eR9J8LbMOAauKH9x?=
 =?us-ascii?Q?dSHtaLvfARGdd6HB+euDgTl1nyo/Fwgx/uJ2BenYTZakbVqnw4XRpQKLn7nW?=
 =?us-ascii?Q?PGSXQTSN07MdMt0zm/77ijqCRYIBotLMTcgAqv6VKwCrV8mYMq6bIh+0LI38?=
 =?us-ascii?Q?88tfYWFaQV63wCmeVrWhkDp1gPRfGGktXPZ6jzZiTUINGKbruXG3OcVbxddK?=
 =?us-ascii?Q?4Vbb0mvrc0+jhHzs3ui5SJnFAcS7LJtXcnIrcBuiya0eKAdy7Z857PleON/d?=
 =?us-ascii?Q?06NlZp/7KNzf3tzWXzYDld3yD/n2GxUQWo6oGmTj4e8byy1XP1fWYN4GxQgE?=
 =?us-ascii?Q?vzKfRB2qYn7Gl/+UHK1tAgyrm2+7cXPmd80eH6AQEo2xa9USaaRG9WpEEr8N?=
 =?us-ascii?Q?+3MxRq3g2YOsXK0ToTip5g+BRwIA9ssUeUW9RmtcpNGaHXUw/jGoxUNOhxJa?=
 =?us-ascii?Q?DYaWPqzCSDm5Ik/T/4kX58xod6TnsMZkuPEFZItHyV3YZ2FLFZE5y5EoV7pP?=
 =?us-ascii?Q?QkYEOBoLiVr2MvgdKqeo/0BJnTgz+e1ozu5gHrPm8wQ+X9TZeoNNRaNwljY+?=
 =?us-ascii?Q?byPFiPzbrJRBI6tgzvrh5f4IXlqIRkWxDJAb39NFPr+k/2T5IIN92o/DrcmF?=
 =?us-ascii?Q?YX43ru74BGt2LuBT5eno0mxAqJApoTfafUf5TjWVX4t//Z6aPRS9odCHyhfa?=
 =?us-ascii?Q?bSqzw2k4Hw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e213c87b-2f02-4d61-e2b5-08de5a56491b
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:17.6402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb6tukg8ZCTyC90pZOZLcyXdGv99NZKU2B3iU+RrYB0CTVTPw3dKw5PQS1E5BRj/kNkHVZ7UnVZXWULr1F2Yxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
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
	TAGGED_FROM(0.00)[bounces-51389-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9F04723F3
X-Rspamd-Action: no action

Extend the v4l2-isp extensible format introduced for isp parameters buffer
to the statistics buffer as well.

Like for ISP configuration purpose, that will help supporting various ISP
hardware versions reporting different statistics data with less impact on
userspace.

The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
definitions, with similar header, versions and flags. V0 and V1 versions
are provided to match with params versions. On the other side, ENABLE and
DISABLE flags are not really meaningfull for statistics purpose. So VALID
and INVALID flags are introduced. Purpose is to force ISP driver to
validate a statistics buffer, before it is consumed by userspace.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
index 779168f9058e..ed1279b86694 100644
--- a/include/uapi/linux/media/v4l2-isp.h
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
 	__u8 data[] __counted_by(data_size);
 };
 
+/**
+ * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
+ *
+ * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
+ *			       (for compatibility)
+ * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
+ *
+ * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
+ * both V0 and V1 refers to the first version of the V4L2 ISP statistics
+ * format.
+ *
+ * Future revisions of the V4L2 ISP statistics format should start from the
+ * value of 2.
+ */
+enum v4l2_isp_stats_version {
+	V4L2_ISP_STATS_VERSION_V0 = 0,
+	V4L2_ISP_STATS_VERSION_V1,
+};
+
+#define V4L2_ISP_PARAMS_FL_BLOCK_VALID		(1U << 0)
+#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID	(1U << 1)
+
+/*
+ * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
+ *
+ * Driver-specific flags should be defined as:
+ * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
+ * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
+ */
+#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+
+/**
+ * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
+ * @type: The statistics block type (driver-specific)
+ * @flags: A bitmask of block flags (driver-specific)
+ * @size: Size (in bytes) of the statistics block, including this header
+ *
+ * This structure represents the common part of all the ISP statistics blocks.
+ * Each statistics block shall embed an instance of this structure type as its
+ * first member, followed by the block-specific statistics data.
+ *
+ * The @type field is an ISP driver-specific value that identifies the block
+ * type. The @size field specifies the size of the parameters block.
+ *
+ * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
+ * driver-specific flags specified by the driver header.
+ */
+struct v4l2_isp_stats_block_header {
+	__u16 type;
+	__u16 flags;
+	__u32 size;
+} __attribute__((aligned(8)));
+
+/**
+ * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
+ * @version: The statistics buffer version (driver-specific)
+ * @data_size: The statistics data effective size, excluding this header
+ * @data: The statistics data
+ *
+ * This structure contains the statistics information of the ISP hardware,
+ * serialized for userspace into a data buffer. Each statistics block is
+ * represented by a block-specific structure which contains a
+ * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
+ * populates the @data buffer with statistics information of the ISP blocks it
+ * intends to share to userspace. As a consequence, the data buffer effective
+ * size changes according to the number of ISP blocks that driver intends to
+ * provide and is set by the driver in the @data_size field.
+ *
+ * The statistics buffer is versioned by the @version field to allow modifying
+ * and extending its definition. Driver shall populate the @version field to
+ * inform the userpsace about the version it intends to use. The userspace will
+ * parse and handle the @data buffer according to the data layout specific to
+ * the indicated version.
+ *
+ * For each ISP block that driver wants to report, a block-specific structure
+ * is appended to the @data buffer, one after the other without gaps in
+ * between. Driver shall populate the @data_size field with the effective
+ * size, in bytes, of the @data buffer.
+ */
+struct v4l2_isp_stats_buffer {
+	__u32 version;
+	__u32 data_size;
+	__u8 data[] __counted_by(data_size);
+};
+
 #endif /* _UAPI_V4L2_ISP_H_ */
-- 
2.52.0


