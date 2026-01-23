Return-Path: <linux-media+bounces-51392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC9vAg8sc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:06:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D18722D0
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A50830078BD
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCB1340DAB;
	Fri, 23 Jan 2026 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AVvlU6WS"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084A33EB09;
	Fri, 23 Jan 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155586; cv=fail; b=pjzUPDwZQB5xaZZmjIZ1EbYpwo60LUG9jsMOTz8/DHujzkc0Sg5+Owz2wPJkPQudJuEO7OGKPWFqMRzYN27cvpwVE1CiGD+Gq5MvYgPi9VKFq7GzUwJXn50PLQtraU2DdBDBy2T9P+u+Y8Z6Uo8CEP+KVDV63n1BTHyupEz8+2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155586; c=relaxed/simple;
	bh=yA8mJWYUQt8QkX95vu6Y30VTaDJZwo30ECOwLiht3N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EUTdZ3VUiHjd0xrl2OaM/bwa0cKkfMLDHG5/5Rmjiw770bQaJ7p0WRzQ7J8aqnUzbVjYh7CgJ/vIyEhJwQKSXuEY/sW9yfccP8ENOrn6Tt0hZwYDK4D5qEjm/LGW3V8uAqS5L4EVoLqYukUPMNKkeXXY9xmW4Z+jx+z3FrI4jz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AVvlU6WS; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Te0m8GPt+6cT+NtMm2tkyDbixrcDtK33jYWhUFykBI2bygPrPEdHe4RlohZxmi9dRBh2zyT8DW0HUU6iITfwQqieUcsLaUZ4PzP5GO54K6nDLY4cZmglgTi1huQ4uPsIIwKQesJoJOARXdh8adWBKjvUHbtP0gnA4uNKyCUtkV1JLkY/rJZWfBLYU9EuR6kIv75kRwU5OsXOQS6Pbd0SaHxUGczfD/amcIW8w5QPVqo0wjzUDDjiLjTSlbIgbuayuqznumZXr2v7yiAAV8IdGxHwhVlbm6qu14E4ksZnwOE9PGuuh9HsmlzWZOOdtxadbuozutXB5FzP7YMay1/d+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvUi5TFlScof0fEnlRtvFyObMHeHnfHxenbPI72oqt8=;
 b=siCmAHd6G3PvqNlgNXjbxlHnWfSzmQkvgosXnZrPDJQRd3OB4JkI8ryys2QEFTh6fYq8YcJUB3+AX27khJHm9142UtSKQBm+68RzIaE/EEBaoIVG6OdknefFvbhxMNQ8Zzc5H/BXmMl6IS0VEg2Qg3a4DxRIJM0C51w9R4ih6cRJCUPNzJFG+Wi4S1l7wWbWFsrDHr1Rh7BpqRMriFXyuyUbfhJJDi5WAQMRXD5kh++rRSjbngY37kJ4g+Iwk/yUT8KUECH6xoDtkdrGcTk5aKd9iq6jQxgubcVRdXKBfwJWLqAadBpE1wLkHoAXlp7fvRn+V++MmnTRaZM/EjR4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvUi5TFlScof0fEnlRtvFyObMHeHnfHxenbPI72oqt8=;
 b=AVvlU6WSf5AkxCBffAW9kSt7UK4p1hq1CxNa+VJJPSfZZx/XF95oyK9Vx7BCNcLmifluV4t8vCsMO42pZDhdQ5MiDnGgbLJNQ4j79sLySIw+Pb/jCGzES9v3gkSkNyn0kk9C6lp2EGz3eCOXeYgewTr+y7GwC3ofwha6aoFMu2bOUfjfq/UkQ4BiLLeQDlFtTxmGLyqGyptbdhgmp3ZcfDZ9j4yJydrXkwpxsSWAsuKpafyQMIsHohfPnC2/39ekRxuye0yyhFQlVUFpFCFLlJZTriWP1zjpnNjssyd72WpDqrPWWNX/MtMMX/+SfWnAqGP3bIq6DXR0brmGUXdy5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:21 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:21 +0000
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
Subject: [RFC v1 03/11] media: Documentation: uapi: Update V4L2 ISP for extensible stats
Date: Fri, 23 Jan 2026 09:09:30 +0100
Message-ID: <20260123080938.3367348-4-antoine.bouyer@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e04d26c-c574-44f2-c47e-08de5a564b26
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?+Wzc5I60YN2zi1WyKW9dxYfiku8ozgL9NIsGVMmWCfCYJXoGYpmJatyzLKN7?=
 =?us-ascii?Q?+WN3lDJg5e+AvuZNswAHxX1iRN+2DffFQSyqZc+Sb5nI0KQHu3z2t8i9RtUe?=
 =?us-ascii?Q?9RwGFC5lsiVf3rnjCa2b7rnx3JtczPHBarl2TihIROouOljMEig0PWlcY/OU?=
 =?us-ascii?Q?iAJC3v+9R+PfhvnhdS+D4updky1+Lnkhv55z6srYfSCZQU4BwoowHrhGtoXU?=
 =?us-ascii?Q?QgsBSxgasQWeFfFmgiD8iafJe+aRtZFmwdfH1V8H0dPpOZRX1GyuxTgiCu76?=
 =?us-ascii?Q?0W3/B/wRqUqEPCwDqIc6cbzdklgnS3sCjsRcIEN8vO4LK8zaSrdpQlDWab+n?=
 =?us-ascii?Q?Ae4cJ5Z/Zs5baxSeyK+/WwSnDltZgHAG9y4zp89e0/bMQflNxV1W3Pg7BA8I?=
 =?us-ascii?Q?BG/QZGRh6SJOzTIHrfnf7270ZJria4o8Fbsg0QzubtrPB7rv4WUpp3szgDUL?=
 =?us-ascii?Q?2LnQEdZ9QJw+IoYeurTvbNOPYB1sdLuVlCy1DwGLdQb8HikP9aKRBx5pTGs0?=
 =?us-ascii?Q?Uhw93om+9pJ03K+8kaQPRprMK/lKDgNG1DierKiR6YROwEedELMgIdFoA79O?=
 =?us-ascii?Q?Lq5UyYkJiKOUimE8fpvXhMUE4VZQ28oHLo5AB7PA0Y5Ez9v8mf7G2MYHby/h?=
 =?us-ascii?Q?ZAjB8yhcbmPas+AKCiravj4bvF/JuA6ksj/Krix5kFcYWM33qLV9StqTDLkz?=
 =?us-ascii?Q?X3mgshJdPffZtgA0WHFXFyo7evlI5iw6TwEILfICXgRdfdGTUI5VEqr7hQqU?=
 =?us-ascii?Q?4nc0+WNKMZhDzCBoiVdOdAY9AaFjzpHhbdQNJ3zYY3dQEAfYww3QcAOw87ZF?=
 =?us-ascii?Q?JQH5B+wcLo28YefPKk3lAzXuhmvHmGFUD0zsZiKCH4RgaX7aVIyT1WdRjUwG?=
 =?us-ascii?Q?nL/RPlvirL9Uiu4bnWRXnQ+6ORzQiCtMOES2z08FPmp3kLTNfvcs2pRMwjFY?=
 =?us-ascii?Q?ZLRlopsWMaDknhzWIPTDE+y9CdEFYJCoXHQVDgbLK8Fu6ZG/fseS97hte4r5?=
 =?us-ascii?Q?lPLusiSHpjcCDD6xpXbDg8fiVpFZ8uMc7zz25L+6gxgDijOS4kDhuYuPLTAo?=
 =?us-ascii?Q?AC9+5w/jW9sJfkd4sWDn3QNADlKLeH8g6akM+cMVEkJCsLVCxLWmozRDJqba?=
 =?us-ascii?Q?M5j5+jJqapcHUGCnmJvP0/kU3FRDmiY5i2OrfWKgLLcMWTVWfhezrgk+GvXO?=
 =?us-ascii?Q?MdPG/FZYA1yNMc4M5VN5GQzzCRw+WExyF6jhs9Jnd6tuURaZU3gwVZoovQLb?=
 =?us-ascii?Q?bVS3JsLjwI6OABOCuozbJrwCz/H/NmvxjuWCFYqzTEHyEt8Lhxd7whOtHStj?=
 =?us-ascii?Q?wamyhG2kQnyBY3eA6tdQcL3lpsEEAuCPMjGJJaryslNnlXxKsrDu7Ko8mtAT?=
 =?us-ascii?Q?eAxd0/26ZM+l5p8YBxbR4kA5xbkE+4RGK+KgeYfvL9cvszfIs/rZXVLR5rOx?=
 =?us-ascii?Q?VuQL1peoJ3mk03ASzJgyY1TUSFnoAQiPiFaCUCkrLvnDvZQgkqJEXTEDT4Tm?=
 =?us-ascii?Q?JsOvuSA2/EKC6bD0co4Ne86FuRhIvnQApww2hDWzg7RmwzZjeHCwr6CHcL89?=
 =?us-ascii?Q?XE2PkOfHV+OMFjDV8GfEun3gUtwTZ4WCDMN4AHdvc9Mc7qTjXSgm/Wq+m4/u?=
 =?us-ascii?Q?Xltn5rbSC5IoiMN+Y9rn0iihfthzH5AU0auf/kYcH9dl?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ig3jNqCdRn9geEPa6mOjUh/P6UFAWXZDWNKq+moaQWtn09369sfPKeyhSnoU?=
 =?us-ascii?Q?tiPZMrQGgvT9hReVtjj51OvMQYjgkl4MzDjfBwL1IEUYjZJFEyk9saXohHlD?=
 =?us-ascii?Q?GQJmqECKYEfHCqLVm0q5AQPEZ2FXpazCktmqwx6FCzaEE1l6SgyXbB0ghkxI?=
 =?us-ascii?Q?ljnzFUYrLzbsrX2djy6KxqEUjOBrdB5lMGdpqeZ7bLxhoPCnIjJtEtLR/A3k?=
 =?us-ascii?Q?7Cx2JptQL7G5Ruz7UDygtpSZgCWAdlgkR7WqIYFH0Z0YxAgqlghFQ5pIfedb?=
 =?us-ascii?Q?018fkmG31fyBJ/dmZxqcVnYjl8ftk+xp8hwbx1iNqpFgWXe8rTCK3W7aiNRG?=
 =?us-ascii?Q?mwvHgWJgQUXJVauNXTyopBkW+bHRkmsI4w1juTA/xMOn8BahDXupblQ3jutA?=
 =?us-ascii?Q?BYCMnV0uljvux5mwDWeAH4Ar7QfBiuVLSZ0Z7Ehsf6/QgLFDyboE2PtfFysr?=
 =?us-ascii?Q?u6dJkYjtMsrXUINw0cFgRlk3Bm7SZ+TtsCODVF3dfc3gHS038AiaOE04G5VZ?=
 =?us-ascii?Q?UIXDJx2G+TAQXPBpudmq/X900tGCuoy0P8+YJT0/Q62bln2Tz4Vzd59PTjIp?=
 =?us-ascii?Q?0ttHVZUE3k+9Yec2215ayOLaYIOmp6ZriLMXmqS3/jZ695c51wg5eL5Bm8/Q?=
 =?us-ascii?Q?j1ibeOemT8abGCQVcNApj5A5BGymOK2woM3JvVQnW8pONoluch7kCnbAvnMb?=
 =?us-ascii?Q?J4B0meHPjQTN9bOnGAyv3OPTwaRBGuue5YPKlf6IflYW2F4+njyjcpmrGDwI?=
 =?us-ascii?Q?02wzEeB0zJLtS4RVB9z3E9ZqxarD+cQPwLwVMxKpNFLsA/KTe0wx4Bc61ahe?=
 =?us-ascii?Q?eq0VmAoFoRKFMGT6qmnKl6Tb0QHLBMT4Qs3mBj5Ut4xwEpZjqV0+3tME7bLL?=
 =?us-ascii?Q?lLRYfx27yffQpHFbnL5xia4Pmfu8oIVjPzAiNkYX3ydYw9qAhSti5XZmtwNI?=
 =?us-ascii?Q?ZnyhFbg0I6uc3gop6klE9/5D8GImz53AV+gk75SQxbOV46SGKiWoWxv5Sm1q?=
 =?us-ascii?Q?kDba3UDV71uRHsJCryx7umO2qhYaEI6RXD8dnGUQ7hl/8PFyl1KnmHtafG7m?=
 =?us-ascii?Q?x8EV4Qc/VQjNfxnl9sOFc92Cof1UUOsx3/zRJdQff8nakw2zdJzu08pqORBS?=
 =?us-ascii?Q?Xuk6sjcj3mCyiNrfScMX5DQkJs4Wsahs51wA93/TxT7HdeYmepBZlFbarzW6?=
 =?us-ascii?Q?+Kx2GNvdNLnY0FYadtDehcnWqCwH3xy+lfilBnRp1mqOK1x2gL8HmTjd43Ty?=
 =?us-ascii?Q?H2uzPLlvkYiahUpxKRcgB/3V6BsFSsuXxYDeirYioUpin+BTSkBZaq7f7eN2?=
 =?us-ascii?Q?qTD9w7lJ1H+nM1UBoSmWtbtBEKbMaDoEorT9ruzYD59NV8UfkTlh0WFLi/3c?=
 =?us-ascii?Q?5F82oRaCANXFKjWFtc1LLCHl/yEnp+e+e1aGAc/sD7hcRJFn51XYGM/11dzy?=
 =?us-ascii?Q?g2CNwUPERyig0EXyttqQ3N/4Z1miy2RO7u3aj/+vE1uYCSTQxHg5nVZ/70NO?=
 =?us-ascii?Q?NV7Fug0AcxXn1B0cH/5zadV9+2lnhHIoTqiHpJOu03rYWqApQM1+jwGac/7Y?=
 =?us-ascii?Q?FLeeLe5nQ3/sI9JzbfwKwS+tmhw9RGTRCP05S3m96UExnUaXOwEaOzCcPcYn?=
 =?us-ascii?Q?L/h6m34W8B8lagBUiHoRMYOfuTrSb8hCXAoPpNMjK+4345wt1NbvY7ig3sYN?=
 =?us-ascii?Q?ttKbzDhUgh4c/VvG+gnZWlDO+9nteYqK9GEgo48n6dlEMyJv3guKTF3H059y?=
 =?us-ascii?Q?NrTlgvdOkA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e04d26c-c574-44f2-c47e-08de5a564b26
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:20.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 195AmShFwjudS0L83y13/qkZvMBgojXeyoCOW/ein0AE9AhMYVc33ZKH6N7v6Hjuddg6NkdMTZGHBmPymR5DcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51392-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: E5D18722D0
X-Rspamd-Action: no action

Add driver documentation for V4L2 ISP generic statistics format, mainly
copied from the generic parameters one.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../userspace-api/media/v4l/v4l2-isp.rst      | 42 +++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
index facf6dba1ca7..9024c6998b2c 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -32,8 +32,8 @@ types.
 Userspace applications are responsible for correctly populating each block's
 header fields (type, flags and size) and the block-specific parameters.
 
-ISP block enabling, disabling and configuration
------------------------------------------------
+ISP parameters block enabling, disabling and configuration
+----------------------------------------------------------
 
 When userspace wants to configure and enable an ISP block it shall fully
 populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
@@ -59,7 +59,43 @@ definition without invalidating the existing ones.
 ISP statistics
 ==============
 
-Support for generic statistics format is not yet implemented in Video4Linux2.
+The generic ISP statistics format is similar to the generic ISP configuration
+parameters format. It is realized by defineing a C structure that contains a
+header, followed by binary buffer where the ISP driver copies a variable number
+of ISP statistics block.
+
+The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which
+is followed by a binary buffer of ISP statistics data. ISP driver shall
+correctly populate the buffer header with the generic statistics format version
+and with the size (in bytes) of the binary data buffer where it will store the
+ISP statistics data.
+
+Each *ISP statistics block* is preceded by a header implemented by the
+:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics
+data for that specific block, defined by the ISP driver specific data types.
+
+Driver is responsible for correctly populating each block's header fields
+(type, flags and size) and the block-specific statistics data.
+
+ISP statistics block configuration
+----------------------------------
+
+When ISP driver wants to share statistics from an ISP block, it shall fully
+populate the block statistics and set the V4L2_ISP_STATS_FL_BLOCK_VALID
+bit in the block header's `flags` field.
+
+When ISP driver wants userspace to ignore statistics from an ISP block, it can
+simply omit the full block, or set the V4L2_ISP_STATS_FL_BLOCK_INVALID bit in
+the block headers's `flags` field. Then driver can omit the additional data
+after header, and set block header's `size` to the header structure's size only
+in such case.
+
+Setting both the V4L2_ISP_STATS_FL_BLOCK_VALID and
+V4L2_ISP_STATS_FL_BLOCK_INVALID  bits in the flags field is not allowed and
+userspace shall not handle it.
+
+Extension to the statistics format can be implemented by adding new blocks
+definition without invalidating the existing ones.
 
 V4L2 ISP uAPI data types
 ========================
-- 
2.52.0


