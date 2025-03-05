Return-Path: <linux-media+bounces-27572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA01A4FA85
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0993A9A7F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DE82063C6;
	Wed,  5 Mar 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MiGQlj/E"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A3205E0B;
	Wed,  5 Mar 2025 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167876; cv=fail; b=tmlRZcpqD6Glc97gePe+Fh4rdoZ/NdVoP4VXuFq/3CGYkvUtDrgEvfNHpdKuAPNdqzruNpiGyWkqX6LcbM/O+8Kuw1oFxWlk0koKFS1xzq9i9K1+yZqpzW/xA0VqO5HLky4QhzZx9wmU095qNZ3Efe4Td4Fk3+q+b29sei+1Qlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167876; c=relaxed/simple;
	bh=6LSdBQ+Rz2HfvKxv8lhYp7KR3FtVBbSfhZhx04RTm+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eJgQ5ZHPBpPiBvol2Hc2Hgaz9yzVnwOIEStWbyFPOy9c/dD2I+09fZXrgy6uXb2yoBXluBRDshVitBe5/2knoC0tFXKZZcPQntpwzTlvfuS0c8EFgKA28felYBzjOQdraRKFju662xbJEjVMF4yFLK4ld7eiLeRe/oZOFJc/J80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MiGQlj/E; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eV1Ryt61RZwif3kLZZ7RZrvMkrnJLGXHghYTsjsnr7Udtg7Dg3X6D9w0SQ6sQUYondXnlGjkYu6gN7J2jW6qSZ9gD6gMs3z9f4PrcWsMiox3nR5lwT6t7S89QJ316pqORilhD3TDcDHRDGN9SncQ9Q7o1akeTRGRzTZ96gJKTwsXCj4NgP+kPxXhN0hc+EwDMVdCULy1u1EbQI03uigm140YZ5whmjt19Le6NYC7OM9fT3o3En6ZoKC1sinsMaciH8pJxucR1GLEWE+emeEawqManXoIbDnmb34wwLJpmztXvIeRGVS0vK7rG/yv/LkMSkQePgK9/yflbLYDAqzSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShSA5rg94rZuOua8xWQtP1KJVmFiPdb+PRqp1BZYbDI=;
 b=ySgJKN92uuRt9gPs1QYMAl/k6ar/218RUUK1fuzvaPthr20hQdjI3lyGp3I91FA4sr/ew6TGeWDe7J6MpHmYlyplzWUbOVFWjiquRp0Wy3nlBX2W779fSlw70AKF7KddSIxhY+WJkV88qPbkCredjosf6lZJkn7p3H4LJs7BrAyBhGnMI/nMOd6lZNgJhe/BQj+dNTPDuubokE0vCxmrqfnVe0ZVb5c8dVH6ae6xOhxzmdeQuB5bznhJwUb70vYvc1uUKUOIpYZIBAg9BmlfxTvyO5hwgS2sKubprN/jr8hGYwe01kEep5/Vv1Na/81qPr7cLb6EjrsvPxo5YBNQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShSA5rg94rZuOua8xWQtP1KJVmFiPdb+PRqp1BZYbDI=;
 b=MiGQlj/Ed6Zc7KAVs6+F8GSoSvJq38imiS01Z4GJDX+hMIlEAIB1f4u3MGJoQGUVsldUHhxlbMC621111OjT9fAQFSsUxHQ4Y4h8aJDpX9LbEmW3lTw5JxJE3JgRbsRW/irKD+cg77WR0W69g9znjoDb72f7f4ikaeOli6JBvYuriDSia2mveh4cOKg1WotPrnkWPNJngAPmUwvmM9Ff4DVqgFBX4UIfACQeSQu1v5NpLdeX1geah9Xn++jXnT/V/MBQl4UFFxtqr9AyWi4NkIqEDo+Rkcyy+pMH9nU/xL+U8CgtQthjyfyj/z9Pw0u2DrNuRLTyBZeqNq1UwPqheg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:44:29 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:44:29 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com
Subject: [PATCH v4 3/4] MAINTAINERS: Add entry for OX05B1S sensor driver
Date: Wed,  5 Mar 2025 11:43:58 +0200
Message-Id: <20250305094359.299895-4-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305094359.299895-1-mirela.rabulea@nxp.com>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::25) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bec130b-81e2-4a13-ebf0-08dd5bca5303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6pynWXTGnSn7UItzmTQRU3toP+qghGxXTyXYCc85FEwRHxFWwIO7gyIvDwXS?=
 =?us-ascii?Q?oNPGS6NW3I0LCt+0YhEPz5rKXCT5/Vw6uJ0fN/NlWa2Mj2hryPq3VTS/TUVa?=
 =?us-ascii?Q?mxOudiYq3MkRH53FB1nrIu2PeUSB/b3ZK7aIwUakfcPZKSXIeegqdRddKCcL?=
 =?us-ascii?Q?iQt+D8XqXIusbJXxy81p1uL/5lMmJ99JSiXSkVpjXneZ5Bm7vceejMpcLLdN?=
 =?us-ascii?Q?+d/e0HfzPY+m8dyVnny8KxyYpfML3tLk2SSLJb2PrXzA+TFxYS5vp414geqX?=
 =?us-ascii?Q?mvxbUajU3kJJITrjOfM4+RRZRyKJBJyUTtZyeVMoIaDd/iawO/3ZkIRQ2Iob?=
 =?us-ascii?Q?WSlAKVr03OZvdJmzjAgnHDzBRjoCu5V7VZ6XEXf9gTnoADm47N8ed4w/y3z+?=
 =?us-ascii?Q?IKqajw1ZrNeb/fmkAJyO+yKU1UcL5le+W1N8EGXqZ8WofvHStBMiXRSsxhrX?=
 =?us-ascii?Q?CXx+HfMzYQ7fbLcORV1Voi+0CWz/75qe1tbDSm9kQwhjlTwe784RsCEYMHlt?=
 =?us-ascii?Q?2c9YUCVMVFSPm6mcozgIYDaZPSYJJbRoSbpKjJ5SkgGhWdQQNe9cwZL4j0/v?=
 =?us-ascii?Q?2O0pDvd6ddNFWr2M/ADfOia89EbavhpPA0QlzC8iho2MjL9qdaFVxtsbqdYS?=
 =?us-ascii?Q?B9h3aDCE6ENzThSzEMY0kqBeE8YhJBUJTHnL1GeSN1D+epjPDVu2ewu/l4vS?=
 =?us-ascii?Q?21Oq3chYhKY5QuCcmvQEq3wqhalX3GHk6mNTGZc43bYu/Q1wRT5U4+SFfme/?=
 =?us-ascii?Q?UHA12NfkNgOZyITneNQylww+9ScwpJ/wwvLNmE0xarRdRCculXomaTVf5Wuz?=
 =?us-ascii?Q?SqcZYBDoEwW/JJp5wNX8Ml7Zl8YpYRC9Yz/uxz2tOVwxHXmv1EhaMsRQHjXM?=
 =?us-ascii?Q?WhDCQHFtRuncKoc+XCXlgJdsFtf0vxqSPShaz+hYSN7oxzDHdoOcwzpuhAoq?=
 =?us-ascii?Q?LED2kbGj5idLZsh9DX9p0QOJB7358Lijg8vpOdEKga7Sm4XAmII3laGCahp0?=
 =?us-ascii?Q?yMjJ+GcFtarYwMNb9EZrNKRS8CgaNRv1MSBT5go7JeUF8jEQWUUMaGLOhCR6?=
 =?us-ascii?Q?QKnBB9X5XmRn84d5w8NhNou6L8SAqfSZ4WaTk9hyKilp+8lfLAeQ7NZ2RLLL?=
 =?us-ascii?Q?b06o0rLxd3DEMGVkg+cdQpPpvVtNY+dQmuI3k8TVTKDY64vdcVQ/JMi96sMW?=
 =?us-ascii?Q?fI1uUpB4KKv1eb87n78bFXvlgoV4I5oC1ujU1zCMY47f+t3adV1pzoP2Xi4x?=
 =?us-ascii?Q?WdB94Shb/OXoMYAvKo/IzbK4xy9ykekc7Sko3DIGcGq9VYiGvLKsylIDzTnq?=
 =?us-ascii?Q?/ZjOu4TiLDQEeqec8ja7J0P9M57ZZ9ycP08jh5nOyxP05QWa3acHZhUN5MOT?=
 =?us-ascii?Q?Sz8fXa+ElNZtC1POE/fPrqzbUjVUmcO1/iZbOXe9RNLMTQjGQIVVbjuVSWbl?=
 =?us-ascii?Q?cuFVuY0VBP44EB60qW6oqA2U3gfhrNFx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5ytA61CblI49pmh+vAR5KGMXSnGKYkU9GgzTvP1QtO5spsnoGStfDvH3JpF?=
 =?us-ascii?Q?DPoLV8l3s4BoGJGfjgVTQzPjXte8UJjsmw7fElL9YItGZv1tsL8ER8NsFcNi?=
 =?us-ascii?Q?YAU2iVCcN47fDA5eFsew038406IEkKu+yhCHIqXq1FbEL+/jJztL3HEMz2Ir?=
 =?us-ascii?Q?UQSsN65Hq6E+PBKip9f/s9TAalnEkWsQiiGD2ZcOYjNK2FdNlvdV5VFje29K?=
 =?us-ascii?Q?zc5UjSgjb1tssZiv+KZ/5q6OxcbDyFshNUSrV7vDJxLH1XD6ps0OctD/4puN?=
 =?us-ascii?Q?8wD5rqRTa4hYM0cIPihehKyXqxxM04t8MYsqRjTW+mOcaRVSobMJ0dRQtmJY?=
 =?us-ascii?Q?AdUq9GUA33RhiBTGSJ94vfwKrW5eYPS0Kb1yBwsIRMj+H4xY+GmN1n/pWVTl?=
 =?us-ascii?Q?DgUEbeqghYi3vlYDZHr0jesDCvvnow3eJSmJmZMXRCOo5jNFryr/bE2OAEIL?=
 =?us-ascii?Q?0SwWvuT65sQ8uSOBXBXd0LNXkaResZfZynGl6gR03UiXEJvUiIdFeX/7RW7A?=
 =?us-ascii?Q?4CYi7fYuOHyOgbtZToVJ0wYeJtsLYn7qcwp5exnj88eMmVnBCpTwHSogxQxJ?=
 =?us-ascii?Q?1Hvx9hTeU9oJbC1dDIgRJkbAoxLLKL1hZW67taz65t9y8wYe8vdCaR2upBxb?=
 =?us-ascii?Q?g2El4+fRJKt9AAmsqKARrx13yGyr/iyC7oTZcbUxwyB87sn6Q4ldrgRwylJc?=
 =?us-ascii?Q?cAU/ZL7U8Y0Y9sYHlei3g7ZKWR6Gd3zcheTHwsSVxTN2DkC7/Jok9GFcaQpG?=
 =?us-ascii?Q?u8zb1HL8614PYsqtnrZkXITrC1+WPvabLsv2ADCbW5T9gv03DO5jr1wFnJxy?=
 =?us-ascii?Q?U+CiHpAZdll3Cg4Dc9I24g5dmGiUfxBBRkdPXG1SAKtqsc/hFB7JwLDsXET4?=
 =?us-ascii?Q?ZvHwCA2kdElbVbOzlzEFgr2mZTexL0IG+vJsdZ0Y8KS6F4L1blX9NuWLwlEq?=
 =?us-ascii?Q?EmQozp+2P3BgtSuUXt1kQv+6xVrTBmGokYnw+7lqTzEcJnJABaeun9cNS0r9?=
 =?us-ascii?Q?dt4Nf8HMX6oeTCs6FW6YcK0v8x1+zmQcsZq/AREAm7KDvhp7qBON8Yf+IIe0?=
 =?us-ascii?Q?uABWVopuCt42dqvUv0LHotbABv03f8VhdzmdE2ZtvDuxoRE51sGbtHg0vAAj?=
 =?us-ascii?Q?R4VrwOQUSs3SsEaYEnhHXJcU69bYLWQosNiRNfAEzXqThBTOV0vCTfECUBHR?=
 =?us-ascii?Q?CSu36H28CULk+sNZRFaLN1JZmji6GFbuejEdHfSNN438yixVuO+QVPlajOLI?=
 =?us-ascii?Q?DTepLkMORiUZsrwQ0JO6a68S/4xAQE6T4T4D3WKtezs3OUQm9zv80C+K+6fV?=
 =?us-ascii?Q?pj0Bd6FhleLl9nlyx7xfjUdssE3p5lNclw8Uca3RNKzpSRFxmNZnLOCPHZ3c?=
 =?us-ascii?Q?4WTFjS15ZMASmkwVZaokmNQXr+3eWFCxC7bClp1xjxweNFh71/KmdCl3maCR?=
 =?us-ascii?Q?2ej1Go/8JG0o5lhfnw2JpNMTS+YVcE46yA+IE0eg3UnQQEk3VtEmgadlIxrJ?=
 =?us-ascii?Q?X5A8eCCay7PSCl7zddMOCi2EbRGuu3SVdWPMLSCxUDl0cmF5or67VjTm5HJu?=
 =?us-ascii?Q?EUyIgE/eiy+8wlsvINwR4+p6vZdby0l5iiH9xBrb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bec130b-81e2-4a13-ebf0-08dd5bca5303
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:44:29.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPT3qyG7LA9N2AVc3xNauhorzoMGOrZSk/kvsH4o0AwYw0AD2Wl5xTQKDumH+pf5ZcSK5CW3Wh/6NXVfHyWleQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

Add maintainer for Omnivision OX05B1S sensor driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v4:
	None

Changes in v3:
	None

Changes in v2:
	None

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c10a18fac78..a9d0fa44403a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17635,6 +17635,16 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov9734.c
 
+OMNIVISION OX05B1S SENSOR DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+R:	Robert Chiras <robert.chiras@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
+F:	drivers/media/i2c/ox05b1s/*
+
 ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
-- 
2.25.1


