Return-Path: <linux-media+bounces-39160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F79B1F0D1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6001633FD
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE26528F51F;
	Fri,  8 Aug 2025 22:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qc5Ze3zw"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC128ECEA;
	Fri,  8 Aug 2025 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692850; cv=fail; b=ojDLwZ1yn+fPMjaxmy8BMzBsjrHI7iVGZReC8GVS49dljW/Q2mfH+JglbkDioOF9rM0xrylMWBsIah9+KoxcuAGCzrdLa7qLai4e8LFt5JcNI/UJYPjMWOHWlK9dyrgQ0LK1zwgz3b+PM6SyHB+XO/pyJzour3P24HQgx2CzmjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692850; c=relaxed/simple;
	bh=pcEmQ3slwZ1HH5Sh3FwVF7VbGrfeu2oBAhyDJTJmllE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mnZmkVoYhEGIr9s9WrZdlf4k7gKNCULoQzkw5yvHSNepDXSNbGxNToyBwBa9RGfekHiuTxTcAmEXTZ8tO2NL3w9sx7hOncdxFqYe7xtlJWe8P0qR0pp/CL1Wweiw1yXXEjD01dXUXOZrNgSjMWkZEU3F8iQ5QaDK2tYiL4n8Bjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qc5Ze3zw; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0dIQfBa81ppp4k0QemUZi9FI3yqbQSVj7AelPYOFQzRgQbNXMdC8dzAXiQ7nEy1yW+y5WDprLG72Xg1tHJN2y8yeAwjfekFE3ngvom7QJeUpeQxeOyNb2/iJari8gb73itAWTdYjmt85UuDP8LlsxG3xLKFoZQ9gvmzZe7ab+2KyGkgK2WkyIQzrmg3e9Hp+HqmyvzHU5pjSj5qP3WNPVqyb2Ho/vmR2pQxIICBYTusa+ewRNveFueeDiA4wM37/SVqZIhXhxpXEGffI/anp3CB176bttpDnP4cshdEkWHN2xYSBh1M+F6Wp+LiqlFGwg89tgaJEwytxX2VsQM6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxwXh2akl2sJJGHlTgi1fGb9wxwum5aGVk/XjrPAIAU=;
 b=XBKvwNefFBl1Z1gP44npOt8fqjgT7Bbdv8xBAbMVQk7SrnaDRk2doWVyLTElX51s5R4AbuO9b/0Dvq70lMI5fdEAlwspNqdulUXP5EVu2D3KfuyzDdnOhUaYfeQwDhw0wBKOaABNM1zU9u4EtZNOKFhGzTtSmDP4eL7mwVenEtVgLJ+veoFM14jDao1pd951yoDqPb2IbbBU9RPZSEDh6l1pgXcRoMAmra/ysBC1UeQE2XTYQ4ubYvV/ONtS4dZnssKF/g+ua8LGBep+gKZgJKf2Mqmm+E1iZiYOrKoqTlMOGoZ7NPIDYPuNRLlxTW/w61K4CmLIh6R1osPcGctnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxwXh2akl2sJJGHlTgi1fGb9wxwum5aGVk/XjrPAIAU=;
 b=Qc5Ze3zwM0q3fau8abcJPb2fcj9J+qmNXWN/WLJ30BConDf9YWfnAgzgrsxMWjOOIjH3DOP/dz77h5uW03BNg2m45LxppRGr/iAN1GX5NaV45v996HAVK6qk1YDSxWFfmy6P1C8gJnFqo8s518SmkT6i0IsvVRleoIxTgu9I3xAp4ygs/eJ3MXiSQNVAkFTHrS4LqYtMjXxYLxR+gNe23TPvzg73C6El2gaaqQEmxHcsDdaBp2DI6Utwk+H72EQSXeO2o0fknxs4tl3YeG53NJXQ9fmdzowUaFijQuUlm1N4cO5l9tpMzAxZxcTVRlw2xDUc+fpzx5oKQupvw5N1bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:11 -0400
Subject: [PATCH v2 08/32] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-8-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=1395;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pcEmQ3slwZ1HH5Sh3FwVF7VbGrfeu2oBAhyDJTJmllE=;
 b=LuGZA7YKr65sSc4p3EA42qEjytWw6A2OSWxVr1Cyy5BJp7agTr4Vwz8ccPWwOg18fgIf0p7gP
 a0CSSw1QTBaAYUrnwn64JsmyvHg4ieGxeN+X22vz3vOp3jE4vxk6Djw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 88bf02e0-3d65-4038-bb1b-08ddd6cc9ce8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eHp6NEpweGlxaHk0YVprUnJFWUwvamRUUjA4MlFyNDhyMnJmczNUcmxPRmV2?=
 =?utf-8?B?WGhWYUdiL3g4c3NEc0VjZ3lsUEp2SmxpeFZzSnR4K1RZa21wVXNjRWNhUkJR?=
 =?utf-8?B?U1lmZXpqOHZINHBpeEVBMkloMm9QMjJlODN0dEJveGVzREVWWVh1NDN2NUVY?=
 =?utf-8?B?cGtwd0tEUnkxLzR6ZVhtRUF1aVk4SjlqK2UrWFlPSTBzYlFidXM5VThEbzlS?=
 =?utf-8?B?VU13aU1IRHVVQTlqV1ArTkJ3aWxXZ3o3TEV1cGEzcmZzaWs3WXRCaGcwcUhi?=
 =?utf-8?B?UlNrb0VZTnE0eHBPYVJ3ZndkeTk1eFdEZGwxWVloN1hLUitLM2hPVVZGRENL?=
 =?utf-8?B?RlN4b3VBbXcwREkvUnpYdE5TenNSUElCQVV1YkxlcWFSbnNacGY0YmZyd3ow?=
 =?utf-8?B?WWdDbVQvYUhOM0R4TzBETnlZaDVZemZSRVlCR0hGRkFEQ2FIVTdERUVYS3Jz?=
 =?utf-8?B?Sm9QUXRpMFdYQkhjVDArWGlFQVk4dXRzbWZHVHY5cHVyU2JJbVRXTW50K1Zs?=
 =?utf-8?B?K1BIR2paNGxSSUk3SkJTU3U0dEFSZ2JIay80Nkh3dUhxc0dkM3hsRG5wL2E5?=
 =?utf-8?B?eGRNZWRkcDJmeFhRYmtCRWM5WTYwQzA4ejE0VVIvV0hCV2RuT3BFb3BmTUZ2?=
 =?utf-8?B?T1YxdTVjaWZvMVducFF6WWhDdUtNOTNzTFJNM3Z5OU1oYjYvTWNmTU5BSmZ2?=
 =?utf-8?B?OW1keEk3OW1aYW15UVhCUkhtdXNwT25OZm5UZGw0VTIrRnpQZmZjbzd3RUVY?=
 =?utf-8?B?M0lWSzRpOC9jQjNvTHlvR3F2b2swWGRjVk9tUm5nTmY0M2JwQVhlQ29Gck50?=
 =?utf-8?B?MHBXdVpuK2t6bGdQd1dLNE9UeU5sb3ZwcVl4Skc3WWZ4QnFkN0VuNFNDcFJT?=
 =?utf-8?B?YWxQU3RjKzJibEp1UHg4bGQ3OXBPZnZHNEV6elpJZEE0QWNoYjFzbFIwdVhq?=
 =?utf-8?B?elNWekRUVFZmMDhFK0dSajB3UHhycTZwL1dGdWxuZWY2eENYek9ORGpLVGEy?=
 =?utf-8?B?WDlkWVgzTE9mV2Z5TmRaZFdtNHRGUUp2RjZuNzJSNkd3OHlFa1AzQmRwd0N5?=
 =?utf-8?B?L1NadzN2b1FlYlcxV0hJU3hEUzQ3d2NXaTkvUEVLNWhIMS9sbnFFK2R1UXNz?=
 =?utf-8?B?YW1jemVwaENuUCtZcFFKclZoTllHZ2tpeGdueURqejNXNlZJRGU5bTlzakxP?=
 =?utf-8?B?cVZvdW1wZGdoQTFHNkhNSTZsUXNuczhJd2oxUFk1QXoyQWU3V1J2ZHhsbWN0?=
 =?utf-8?B?cGc5TTJuMTVJa1JHWXl1VWRRZElpcGVrMTVuc1NvWnpSYWNtT1JmeFh5Uk44?=
 =?utf-8?B?b1VyZFE4WDVVQXNVUWNRTHRrdFlMd3lTUXZWRy9vVloxdjFITHF6d0tHV1V0?=
 =?utf-8?B?cnRQNUo5bVEyM1YxaEhiZ0ZPWE9MSGo0b0wxWlVjOHdpOVBFaVpKWVgzZUpZ?=
 =?utf-8?B?QXZicXBCZGdIc0RhTDlNMG9HaWtkdENORVNCdzhiUnJMdTkraXBXUStqRkdp?=
 =?utf-8?B?TGVKck55YmxCQ2hUWHA5Q3kwbkRDbURGc2dvdkpRSGpxVEFjOEtHSVFadUk2?=
 =?utf-8?B?RzJRQStvVE95NlVsZFlUNHdUV0RBSmlrOWJ1bkFqbVBsZVZGNEhMYkZYdFdU?=
 =?utf-8?B?N2tYOW1OUXhJUDRIU0tlQVozL3dvaWxMVk16YmhKb3E5VzY2aFhIMitHdVk2?=
 =?utf-8?B?clV3Z01pcE5Lc0lDbnNNZVdnQyt5VzVOSThKQzVyMHk2ZS9pK2lsMEk5SDc3?=
 =?utf-8?B?Ukg2d0NCR2pSWm5zYTQrWnJQSDlHcVpyNkZvVm1hZ3BOZGVvejdRMWJ1aHF6?=
 =?utf-8?B?UERBUFVGMWU0UktqUDhqNm9rMENWVzZCbnpKZ21PU2VCMHlLOGlWejE0QVYx?=
 =?utf-8?B?V1Axa0xpWkVDeHBWa1RZaEhZVFVyWDVYdTlvMlZOa3kvRXJUYklobGwwVDZo?=
 =?utf-8?B?aWdpMUtwQ0lpSDBpWlVLTWlTaDhTdWxKV3RhbW9DQ3RQZUU4dnBnMmJzZGlt?=
 =?utf-8?Q?xSzyY6vLD8BWS9tYdM/QCNdhiNRtOM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UWMxbnhjME5CSnBCMVAyVjk5akUvOGpUdTVBWnE3UHlMano5WGJsTzFZS0VY?=
 =?utf-8?B?VXBlNGNVdUNFK1hmMUVWVHV3SFJWbC9rbnIwZVcrNlpmUFZKdDk0aVRCZ0lq?=
 =?utf-8?B?LzZ4QmJ2QVMrbXQ3azdNLytQOXRRS0NZMkpubnM0eFZSMzJKaGpQTXlxbzJX?=
 =?utf-8?B?Q0d2K0Z6cms0SDlNdTdRUmZGN3VaRUFCN21hc1FxZmVZY2hudTRGbW1vbXQ4?=
 =?utf-8?B?Q3F6YkgwcHRoa2doS2xaWXNlTlRmTXJzWGx4NGhmTWRQR1VOWXB0ZmFXNENq?=
 =?utf-8?B?K0R2OEVIUmJVSmxuKy9BckgrRm5pZlYyWXVoaFh0SXJLT2o5QlVIZ0QzdU5S?=
 =?utf-8?B?THZGc1pvRHBWRngwR3ZWSkNnSTdWV2V0WXhQWXMxbFgvY2RaSUExbVFrN1h1?=
 =?utf-8?B?VnA4bkplSXhWNGtxUys1NDhzL0JkTGVoNnEvamRSbEpSR0ZtV2RQYmI0MUZX?=
 =?utf-8?B?c2JWWUlTRUJHZ1pBc0hsUEZNcnp6cnA3bnRhQ3o5QlRCNGVlc0xVV3RkRlZv?=
 =?utf-8?B?VWZqNVA0YlJVUHNGcVdvaTBmaFlmMjlnNU4zZDlXQlpIZFpkS1BUbGdqYSt6?=
 =?utf-8?B?ZFNuOXkyZjJpOVNvVnAvZXE2VTF2bjVWRjNsOHFUZmdhajMwYW9sMzRQeG9j?=
 =?utf-8?B?YndrcVFtTUVLU0dsYnYxUlpyT2ZhVHJhUCtnVHJ6VTMvZ3NWM01tZUpGVTVk?=
 =?utf-8?B?RDlFYm5heDZGei9BRnNKWVJiTWMzeFh4aDg0T0pMY3h0RzBTUnhGRUIwQnhO?=
 =?utf-8?B?TEZhalNzb3ZqSXpZTTM5Tm5XOEppQjNzQzNFV094dXdURm5lc2Q0N3BLOUZu?=
 =?utf-8?B?RFI3TTUyNkorTWdMdS9FZGFsSmhoVlBtVjBwdmdzVDdVT0xqTmM4UmRzZk1Y?=
 =?utf-8?B?U05SWG1McnJwUjBFQWpXcTE0eVhDblNpd1A3bFlMc1VWRW9tMmE3T05LMDQr?=
 =?utf-8?B?aVBuMUdlVWtpRkF2dVordU1WUHRiUlkxZUp5WnBudlJOcld2d29OSDlCYk1S?=
 =?utf-8?B?UVQxMVk4blNNWXhkODBYOFA4WFdiQ1E2ajhqdFNsQ0Y2elJBZnRzOWZmcmJB?=
 =?utf-8?B?OHZ4QUNaWG5RTE9Yd0c3NDEzWXRFN1l6a1pXRC94eDZqalh2SFp6cnBKdHRh?=
 =?utf-8?B?MENVeXY3SkpFQ3hlQitmeVBKSi9LT1lTSkVHU2NZSk9xYkE3YnlkVWVMV3dH?=
 =?utf-8?B?V0JZQW1TUVFzb1lXaUxOMDl6d3VWQUZRQlRIRDgzbVFmRFhoeTRTbUlhWnBT?=
 =?utf-8?B?d0lPRDU4SjVzTGwwYyttRFlBOUloeUpSbDJHNEg2WDVCYlYwWHpSclNmeW1a?=
 =?utf-8?B?dkNyTjJqTVd3WDhyVGFoVmJpcjNmOFdKR0Y2V2VmSDZhS2RObFpqTVB6Umt6?=
 =?utf-8?B?UHFuajRBM2Y5aEE1T2Q4NE9MNDhaanhhbU1lL1gxV21jb0ZSaWtGeHFOOGpl?=
 =?utf-8?B?c1RSdjBZN040RjFtOGgwdnVIVFppejZuMnUyTGpDd3o2TDUrbFhuWktDamdu?=
 =?utf-8?B?aE50ZlFHS1NMbDBmQ01Cc1VqSVR6KzJxRGVZRjhHcjJkQTYwZTRIeG40YkYz?=
 =?utf-8?B?dzhuMkJtYUFYeU8zZW5Ea2djdFNjQllBQThIL1FGeDhCS2RGRWx3ckpsZ1Jo?=
 =?utf-8?B?Z2Z5ampWdUwxT0VUZTIyc0orM0hwME45alkyUFB6WmRJV1JTTThxa0xNSlVk?=
 =?utf-8?B?bytvOHNaRHVIMlFJU3hiaTQ4MjBUVk4vbXlhK29SWlBldTJnMjVMU2dDSzQ4?=
 =?utf-8?B?cE04cTRTbGM0Ym1VOEo0THZaMXV1WklwekcrZGcrSFFva1FWYkNtbWRKakZJ?=
 =?utf-8?B?bHhuWGJjMjlIT2RaN1Q5blE0UkpkZXYyOXFWV1EwaStmYXFxNlBMajJjWWN0?=
 =?utf-8?B?ZkFQZy8vWWhDL2U3ZXZwc0tyZHYxaFBmdWk3Si8wbDYwSFFFV1EvS3p6R05M?=
 =?utf-8?B?M3UvY2xyZy9uVk1hY3FDKzN5VUgramZlblRKRmtVWDZyWnFUZVpPUXBxbi9G?=
 =?utf-8?B?aXhxek1kV0NLd0xwdlBwL2NKSTBjTnlzNTQ1ZTN3eWNVRmc4WVZWTmpMaFVp?=
 =?utf-8?B?RFNHNnhMVkZObktCWUhHbldnZ3p5VWhveVdJLy95MEJ5UzBjU2k4ZVVDY3o0?=
 =?utf-8?Q?vBILudTziv0QgMcEJ3B+7qMcD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bf02e0-3d65-4038-bb1b-08ddd6cc9ce8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:45.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9pOg0DHoWcfl5unkC9BtoCvQPIgFY5calcUSo01iwD7ySqYbfbhKHghqh888+ia/c3ZpLqcqKEMl0qNlmClUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Use devm_mutex_init() to simplify the code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 32ddcef7ec8535a44e121754bb621c0d2e226369..72ede5ebf4d4c426e62cf288225a2b2dd7cfe1bd 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -771,30 +771,21 @@ static int csi2_probe(struct platform_device *pdev)
 	if (!csi2->base)
 		return -ENOMEM;
 
-	mutex_init(&csi2->lock);
+	devm_mutex_init(&pdev->dev, &csi2->lock);
 
 	csi2->num_clks = devm_clk_bulk_get_all(&pdev->dev, &csi2->clks);
 	if (csi2->num_clks < 0)
 		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
-	ret = csi2_async_register(csi2);
-	if (ret)
-		goto clean_notifier;
-
-	return 0;
+	return csi2_async_register(csi2);
 
-clean_notifier:
-	mutex_destroy(&csi2->lock);
-	return ret;
 }
 
 static void csi2_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
-	struct csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_async_unregister_subdev(sd);
-	mutex_destroy(&csi2->lock);
 	media_entity_cleanup(&sd->entity);
 }
 

-- 
2.34.1


