Return-Path: <linux-media+bounces-62428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAahL2XMDmpoCQYAu9opvQ
	(envelope-from <linux-media+bounces-62428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:12:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B375A201B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 498E8306EB23
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753DF383329;
	Thu, 21 May 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AtUu322U"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348E374758;
	Thu, 21 May 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354463; cv=fail; b=bEf8qrvVcw/Bhu5SIa/LTD6JXVTyN5yFHZ2i9e1VfPBgFgDfXMBUjuHkR2gqLctUVNbc2EPceS+sT22r5d4ot5j/2ZujbVoFK5nzFDU+FVagMSS/zwy/neVy6sffU7g2N2CBNwMyDzqq9bbdc8VKXiB/ZDj6EalVtpAlqLUKGKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354463; c=relaxed/simple;
	bh=AwcrFzcWudNZburQvtWYCWJyRTyvAezqremiN31u2+E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lmzeoVwQ9b3zVbpjA5Z5GisNpeI5XyD+/VgM6SPh12Le07D+U7v25T6FZNLzH/oq0Mze0J3mPJCgnqBDcOBnDutyY1oIO/IkjuhSe2nvSzM8OOF2YmVbIch4cnPwab8Ry3FpcwPM9tJdqAdqVHvlSI3Z2sPPCfa0n4UZV4j6SEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AtUu322U; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiZnaRe4hKlUSu0mUNhVMaHC2LHBPAuuPQMgpY1g+0L0QVrOuCaXf6wXd7QQ52uxf0C2gXFPHdX0I2H1uXRs/O2aIeZ2gFRfWd6IL1swRzUP5mDJksvwwUU3e3DXEP2wXrE0ZWFTsajS6PIBPM+hYkf5w2U5sejhfZuDw8lXtL7Q0jKH/PlSiZyPLIsYOhu1pVoNGxCtrhb6YmHwq5UbRoSkChHYZLIaqW1elMY7NhZKmlzcSzsSmVFefgO9vP9iW9lMSjNxPSWmVc2H0qSvb+WndG1l2FjG4R5l6PwqW/j+MAJras2xlVvGuqLcFC0Ev76uU04tFDJ3BzdGJMfWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeeAPEbPZ0YkC+eMb+Mwxfw43DMsqEAYdMcvZN7lSb8=;
 b=nYmqnYPGp+Wn/VGwTT6T4rrg87ixOQlEq7SNF5BirDcvXZ5iM2b/19Igwn2XV5X8gzLpjjgfPbSbCl29MKzTm+n/SlkyQi6ToilCnMi4NITN5Rrt1RT9mkHpHJIOWQ6AXxSLBtdkCaU4Rl5wOK1Kng0wYvk7WXNcPBWH43LhRAC0QoZxLRrV/IRNATqLJZOVpm2EYgdhl2ThHfGDCcWvcijkifk/g0Ys4+54IJWiID2JRRWZHmDzDMFkd88SW0SU6Nl7ocA0I0+7u+CpGGu5LdPstQfU+BYayh/050TlvFH6MVNNEHlPaUCeZ01Rk3l6l3Xs7Kg1Jt8jmBRarFankA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeeAPEbPZ0YkC+eMb+Mwxfw43DMsqEAYdMcvZN7lSb8=;
 b=AtUu322UUKLGZQktqVtQ82tnm7odlVh6VbOjFKXR55opVqBD2KBU4D0OdYhWFrVdCz3VPY2Qh1mw93vezi07UhDKaXzluAAfS2Xxe4pTCO3BTp/O22m7pWOaxPY3FB7Rqv1wSexe/LvOpYZgTqKe3es4jkgc/FQlpGWhRwD1XtyLuP3+mgzf9q7Se3uwNML2yiT/MEpxTCdbt3JHKRiMhDs6aGEmh0uycCryVVlkKIZrVmWRZUsf8BetVcKGjABkPUVl7fEhRNwuuYitFv+RuQZYiOa6Nzm82KnDLhN5wd39Z6EnKpYBdSUCuumsjctjbtpf6kydpo4rdJPjzY+c5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB11467.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 09:07:39 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 09:07:38 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 21 May 2026 17:10:05 +0800
Subject: [PATCH v5 2/2] media: nxp: imx8-isi: Add virtual channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-isi_vc-v5-2-a38eb4fcd58e@oss.nxp.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
In-Reply-To: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779354625; l=10399;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=zzRGyQyt6Dy94J3DrdiiKwNjjqK+wngDnAO6UylWkeo=;
 b=u/xoKezxlg8LEKGR1SgzzGlKS2+8wAWy4BZxmd4oxk5hWH+gI+quYCzXqTJsI7u2lvf+gMOrl
 5WGHgYEHGwiChwr5vkU4enkVZsW23kcIkLMc0EKjD4G/XGODnZ+NSLt
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS5PR04MB11467:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df8530e-bd19-4b2a-500f-08deb718678e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|18002099003|22082099003|56012099003|38350700014|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
 UkY+O9Ib58FaLY/DUNI0mmEUDF3dvl7mcgsnaXpMwkNHRwzkUgwlnIgb9AJ0RUfFWoxYTLGWPR5b1Khg19WBiWELMXi4ZE7taDFgWpZJWfR0lEBm5tNVnbjv26CXkmnZ9ugsEVsHEbcY2aE4QmD3aJFl9UQ51zQPHHlphvu0TA+zz04eCEb/k2DmHKRsizE1yRBfoJmWwEyjnxnSCkx8PVovBqmOgatV2dr0HHS8ZNGuXlruRjmd4rTSqc6haygj3cYfybcje0+gToyX0Ix7sgCzDeoJ5xqfbOzDJe7Xpu441GjYkAdm6Rl8neHoqmAS+LxJ0hpXTFx4VSl7Zhgyr9lzMNArE8xa5hhVJO806cRBw3vRGcrsQpLC1RKCojqMSj3NWwTrVQSSXzEWfHhk1mhTYkEU/baiWrjWhxPt/E7IND9h0w2s3LFYwnj9UImGuEfMlgqGdbMlwKGExebWh059ZvtcqrpYSNejtSPBiDAG+Ig45h0Xqzh5WA4A/+ugWBUYYm1OHyPTSMvGPhVUbwNbEyPvBmlrfLqOZea0bGfriY65K9t0usDGM8uXSr0BTCNFI6JfeSAh49bUHs4SMDNUNvfpRS880SEn1B4ZaZZAf2iwbc3WIO3QCWV4ZyHyo4waEv0qovrZ4YF8F+DXE/u4RH6fxU34ihKbvsngj880ScYOsb6CjqcwpFi9MVAkevnxKahVRYbSyaAefytfuIKTpIZ2KPhJTYtFsBwTaFD/tWhU4dXFjloEXgnkWBNe
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MTBYdWtwV0ZrU09nc1FSVXpWZzZ1enVmZ2NsZThHSmRhQ3p4UXUxOFZRMVk4?=
 =?utf-8?B?Vis2TkM5VGZ5OFBoSldIaHByZHR0bDl6YU8xRGR2SVBZQzJvcHpQVnliYXdM?=
 =?utf-8?B?bkgyNDdnOGRlNi9qcEtDdzg1YTcyNTRkWDdsR25jd2VtbXh5ZUZDSGRuaHNC?=
 =?utf-8?B?WjcwOFl0ajl1K3hBSmtjbUJRa3BVMmlpR3c5YVRuckl4T2pLT2ROKzNralRV?=
 =?utf-8?B?aWZWV0lyQWd0cUVaa1hhTExOS3JpeWhMNVk3RktSZkczZyt6azFPdFBKTzdL?=
 =?utf-8?B?aU5SVG9sbTFINXFkMnpHWGhyNko1S3BxUUc1Ymo0TUF2Yjl1UjNKVms4OGNo?=
 =?utf-8?B?VURScDZXcXc0ejZGaFhTS0pPdVJaUFI3dlJPREZycVUxSlBVMW9sUldhTUlY?=
 =?utf-8?B?ZW1YQldZVkhySnhMaVhIMkdXaDlhQUN0Q3lCOWlLMEpzWFd5Vml5WVVXOEZD?=
 =?utf-8?B?dHVQVHZlRFhMNFoxOHlRTjhZY3poV1N0ZW02MTJRMGc2NjNTWEpmZGNuLzlY?=
 =?utf-8?B?c2tDeTIyc0Fpa1dML202Tm43cWdLRnhHMWZjSndtYW9zeFkvTHNMZmRYbFFo?=
 =?utf-8?B?YkU3NkI5Q3daMlk2OUI3dGwyVFpsTzJjQnF2c1dpOCtSQmpkRHZpZXRXYXlQ?=
 =?utf-8?B?ck13SWV6bzNvZEl5YXJ3RysvbjlIL2c0UGxVZ2ViNlFpUVA2ZmJST3ZKYS84?=
 =?utf-8?B?TlA1WFNJUXRPZC9zSnVuMFc1VVU1VGFUQVdrcmFNSmZoaUVyR2RocmpINUZ3?=
 =?utf-8?B?TUdqdWsrS0RTRHFhVm9CSHU5RWhLZUZ3TUx3aHkrN3lBZG1OV1VQNDdGalZo?=
 =?utf-8?B?bFNDbmVJVVRzZFVIcmZDU2FyMmFCUVlzeHE3YS9ibGxLUUxESURzR0I4NGtL?=
 =?utf-8?B?S2pqZUNNbVdUWC9XOHhlem44UGZMTUJCSk1OREh3VThJcGRUT2VKQjVFaWw2?=
 =?utf-8?B?QnN3NkR3dWh6SDYyUHhtTWxGQkVsUmkzOExJeTdUWGJxcUlOUWx3K2xxakN4?=
 =?utf-8?B?ZXh6azRHeGQ5MWRFRUZhVzY0SG9tNktXc2FBRngzSDRJQ3ZRNnJXSzlsKzVh?=
 =?utf-8?B?YVNsUms4TGtsSHZHek8rdnRsOU85NUpJMjI4dUFmY0tPandFekYyNVUzbmk0?=
 =?utf-8?B?VUZRNHBtMmEySEVGRC9oYzlaTkttVHlJRk5haGVzaGlwaGRaN0F5TDkzR1I5?=
 =?utf-8?B?UVMvSXQ0K01ycGFYcWNVYlhURG9vRTF4RGtrdDdFUEMzQUFuNVN0STRNZVlX?=
 =?utf-8?B?MkpPWm96eW9GZ1Bzc2tjeWxKaHJvd3RyRTFydmFQMzNZK256UnRLZUxySTlj?=
 =?utf-8?B?V2RqSmlUcWdkTHU5cGZnT3AzenVQVFpndWJQZFQ2UmtWcEIxNjI4UTY4d3N3?=
 =?utf-8?B?am5MaE9pVzl6eHhYMTJ4bWYvQmlMNkozbW92a1VFMFRUcG9xdkU0R3JyR2Q2?=
 =?utf-8?B?MXplaDBPelYwWDNTdENHeC92cGxwaXcxT2V5c2VCZGZkVXFnR0pCSGtTd0hG?=
 =?utf-8?B?cy8vVnFXUHFTaVBvTmxwQ3pySW1CUlE1MXNvQkduRW5tMUdSYXIyeHN1eU5v?=
 =?utf-8?B?SUxwd3AwWDB5OW5oeTExOThWWnBmVVFyczNuQUthMDFGNTU0ZTlhNDE3R0tL?=
 =?utf-8?B?NkpSK3NkOHRSR0VmUm5BUUdydThTWmpITDBteW05UUhMcWVyQjBXb1hlSnlH?=
 =?utf-8?B?ckkremRKci9nV005cXRQNUJ0N25JREU5SFJGRXNMeWk3b3AxVU9pc3VNMlgz?=
 =?utf-8?B?ckpHYkQ1Z1Ftdm1ybHlrcXdESDFKY0RYemFhUWllbWg2a2ZnN2JUMkVzZTdr?=
 =?utf-8?B?bUFseW0vaGRHaTlueEFiSTlGZ0N2WUh3K2docHovK2psOHAzSFhmdFprYW42?=
 =?utf-8?B?bnQwVlVlQk00TUd6OVpoTXhoOHlGZE1peW9CQTVxcDZPSmNLUWw3cmZJWTRy?=
 =?utf-8?B?YStNNTUxQWJSUUsxWmRPRjd1eXJUK3cwaHdMbUNueXBaNHE5U1VEREl4a2Uz?=
 =?utf-8?B?TDZkMUpHNnMxZXVwcE9NdWtmRURIVnFpWnM3amJCZFRybDlGTC9OQk8ySUw1?=
 =?utf-8?B?M2kzdUsxaUpkRVVoTllGY2gyUEg0V0xJdE8ycDZvclFVYWxlcE8vSUZ6QjZm?=
 =?utf-8?B?MS9uTmZrWGFqUEp5VG9BYVZKZjZrbERwQitMQldtZkhaWFp5YUhsZkUyRklM?=
 =?utf-8?B?ei9lTXY3bUI5Mkx3YlVVR1hiWGZib1RMYjJEeFBObXc4RTExY2FrcVpGclVu?=
 =?utf-8?B?UVUreE5VLzcxc2o2SzNmdEVZdit3bC9yRGd4WU81R1k3MUV4SDhGd2pGdy9m?=
 =?utf-8?B?K1lXb3N3dDgxMVQyMERsL3k0UmVielB0L0JPdE1LQUlqSGYyWUlzdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df8530e-bd19-4b2a-500f-08deb718678e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:07:38.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqkV7pTkpxjnh3MIXJPfbqIMrYQ1bZI1RGznqfKD3XW0NgeKVRZVKroN4MFQ5OdJmlxGchQ+XQrBPAEXlZpjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11467
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62428-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 62B375A201B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI supports different numbers of virtual channels depending on the
platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
virtual channels. They are used in multiple camera use cases, such as
surround view. Other platforms (such as i.MX8/MN/MP/ULP/91/93) don't
support virtual channels, and the VC_ID bits are marked as read-only.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Return -EPIPE instead of -EINVAL for stream configuration errors
- Clear VC_ID_1 after generic mask to follow generic-then-conditional order
- Pass vc as function parameter instead of storing in pipe structure.
- Drop get_frame_desc fallback as crossbar now implements the operation
- Remove redundant num_entries check in mxc_isi_get_vc().
- Set vc to 0 for M2M as it doesn't support virtual channels.

Changes in v4:
- Fix VC boundary check: use num_vc (virtual channels count) instead of
  num_channels (ISI pipelines count)
- Set VC to 0 when frame descriptor has no entries
- Move platform-specific comments to block style to fix line length warnings

Changes in v3:
- Add num_vc field to platform data to indicate VC support
- Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
- Set VC_ID_1 only on platforms with num_vc > 4
- Improve mxc_isi_get_vc() error handling
- Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 17 +++++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 50 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 ++++--
 6 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..837ac7046cf2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -318,6 +318,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.model			= MXC_ISI_IMX95,
 	.num_ports		= 4,
 	.num_channels		= 8,
+	.num_vc			= 8,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
@@ -329,6 +330,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
 	.num_channels		= 8,
+	.num_vc			= 4,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_qm,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
@@ -340,6 +342,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
 	.model			= MXC_ISI_IMX8QXP,
 	.num_ports		= 5,
 	.num_channels		= 6,
+	.num_vc			= 4,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 14d63ec36416..2957119c81f2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -169,6 +169,7 @@ struct mxc_isi_plat_data {
 	enum model model;
 	unsigned int num_ports;
 	unsigned int num_channels;
+	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
 	unsigned int reg_offset;
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
@@ -377,6 +378,7 @@ void mxc_isi_channel_unchain(struct mxc_isi_pipe *pipe);
 
 void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
 			    enum mxc_isi_input_id input,
+			    unsigned int vc,
 			    const struct v4l2_area *in_size,
 			    const struct v4l2_area *scale,
 			    const struct v4l2_rect *crop,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 0187d4ab97e8..a98d7bec731d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -301,6 +301,7 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
 
 static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 					enum mxc_isi_input_id input,
+					unsigned int vc,
 					bool bypass)
 {
 	u32 val;
@@ -312,6 +313,10 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
 		 CHNL_CTRL_SRC_INPUT_MASK);
 
+	/* Clear the VC_ID_1 bit on platforms supporting more than 4 VCs. */
+	if (pipe->isi->pdata->num_vc > 4)
+		val &= ~CHNL_CTRL_VC_ID_1_MASK;
+
 	/*
 	 * If no scaling or color space conversion is needed, bypass the
 	 * channel.
@@ -338,7 +343,14 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	} else {
 		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
 		val |= CHNL_CTRL_SRC_INPUT(input);
-		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
+		val |= CHNL_CTRL_MIPI_VC_ID(vc); /* FIXME: For CSI-2 only */
+
+		/*
+		 * On platforms with more than 4 VCs (i.MX95), the VC ID is
+		 * split across VC_ID_0 (bits 7:6) and VC_ID_1 (bit 16).
+		 */
+		if (pipe->isi->pdata->num_vc > 4)
+			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
 	}
 
 	mxc_isi_write(pipe, CHNL_CTRL, val);
@@ -348,6 +360,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 
 void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
 			    enum mxc_isi_input_id input,
+			    unsigned int vc,
 			    const struct v4l2_area *in_size,
 			    const struct v4l2_area *scale,
 			    const struct v4l2_rect *crop,
@@ -374,7 +387,7 @@ void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
 	mxc_isi_channel_set_panic_threshold(pipe);
 
 	/* Channel control */
-	mxc_isi_channel_set_control(pipe, input, csc_bypass && scaler_bypass);
+	mxc_isi_channel_set_control(pipe, input, vc, csc_bypass && scaler_bypass);
 }
 
 void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index a39ad7a1ab18..291907ef44cb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -144,7 +144,7 @@ static void mxc_isi_m2m_device_run(void *priv)
 			.height = ctx->queues.cap.format.height,
 		};
 
-		mxc_isi_channel_config(m2m->pipe, MXC_ISI_INPUT_MEM,
+		mxc_isi_channel_config(m2m->pipe, MXC_ISI_INPUT_MEM, 0,
 				       &in_size, &scale, &crop,
 				       ctx->queues.out.info->encoding,
 				       ctx->queues.cap.info->encoding);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..03e0115b5b5a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -232,6 +232,47 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_pipe, sd);
 }
 
+static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	struct device *dev = pipe->isi->dev;
+	struct v4l2_mbus_frame_desc fd = { };
+	unsigned int source_pad = xbar->num_sinks + pipe->id;
+	unsigned int max_vc;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
+			       source_pad, &fd);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get source frame desc from pad %u\n",
+			source_pad);
+		return ret;
+	}
+
+	/* Find stream 0 in the frame descriptor */
+	for (i = 0; i < fd.num_entries; i++) {
+		if (fd.entry[i].stream == 0)
+			break;
+	}
+
+	if (i == fd.num_entries) {
+		dev_err(dev, "Failed to find stream from source frame desc\n");
+		return -EPIPE;
+	}
+
+	max_vc = pipe->isi->pdata->num_vc ? : 1;
+
+	/* Check virtual channel range */
+	if (fd.entry[i].bus.csi2.vc >= max_vc) {
+		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
+			fd.entry[i].bus.csi2.vc, max_vc - 1);
+		return -EPIPE;
+	}
+
+	return fd.entry[i].bus.csi2.vc;
+}
+
 int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
@@ -244,6 +285,7 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 	struct v4l2_subdev *sd = &pipe->sd;
 	struct v4l2_area in_size, scale;
 	struct v4l2_rect crop;
+	unsigned int vc;
 	u32 input;
 	int ret;
 
@@ -280,8 +322,14 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 
 	v4l2_subdev_unlock_state(state);
 
+	ret = mxc_isi_get_vc(pipe);
+	if (ret < 0)
+		return ret;
+
+	vc = ret;
+
 	/* Configure the ISI channel. */
-	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
+	mxc_isi_channel_config(pipe, input, vc, &in_size, &scale, &crop,
 			       sink_info->encoding, src_info->encoding);
 
 	mxc_isi_channel_enable(pipe);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 1b65eccdf0da..e795f4daf3ff 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -6,6 +6,7 @@
 #ifndef __IMX8_ISI_REGS_H__
 #define __IMX8_ISI_REGS_H__
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 
 /* ISI Registers Define  */
@@ -19,9 +20,14 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
-#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
-#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
+/*
+ * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
+ * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
+ */
+#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
+#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
+#define CHNL_CTRL_VC_ID_1_MASK					BIT(16)
+#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
 #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
 #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
 #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

-- 
2.34.1


