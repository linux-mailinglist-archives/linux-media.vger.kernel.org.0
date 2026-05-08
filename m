Return-Path: <linux-media+bounces-60887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIbbL8FS/WmKagAAu9opvQ
	(envelope-from <linux-media+bounces-60887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 05:04:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 280FC4F0FA8
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 05:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B39273034A84
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 03:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E902C11CF;
	Fri,  8 May 2026 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="opXUbY/v"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D42C21C5;
	Fri,  8 May 2026 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778209414; cv=fail; b=WwDYgXDfkzcCYBko93EdWY6kYz7gaxEPuwzpDurWGxNdtiglkHXIbdA0BlNrTtrPY3D8lWm5ESF870LxEBeLTrhRjExqAHEUGav0VFYWBkijSWti8L+1k5DpDyA4rxVR/IHSkQiCkWAHO+IE4Cslfr4r2JlmsGhaZOJuHjKLOyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778209414; c=relaxed/simple;
	bh=IEb/FTGmm5kgXuu4PCb8VrGPbCx8qPaOEnMalBeKlrg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=npXmb+dXq5e1r+22Wdp0Tz54KBDb6zIDpa7b3/Qm0sQJMdGiWukztHNFFCUsuYCJKKLuFddG7KHqjAB93+dlOR4FcSa6gIkhs6N9x3kKOArBmTn34H07oPpXCTzRlRwkZwVHioYplWL9xgSqqKmXwcZYsRFBc/Idyx9AVsHVag4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=opXUbY/v; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUZf9CpMFv93G7ZPprtHA220Nd41Z42nqdm0NIs2ih8wKCj+HIUkfe2sgKhfn1RiSBqd6GCUZ0xr7nycI+zcSx32Td7NB5rVG591Sjb9hU1PKs7VaN0PnslgrumLWNlHHD8AVqwQqSp+jF1gtbGe6B8VSD7gifF1AaiJKRjdt2Q/Wqyk4fkpEEy9EhXyAu3ZtRFPJ2pGzpiOzUNjXCOHUE8m4b9Wqq1rnElkLXkhtuc/vcolOU/cYP+fjsKx0RaoWAWeEhkcoYOo1+KIzdPnqb0hnYOFPgVxJZRdnBN9i/P6I0ybV0FT3yzC6k0LUWtqrLKekOKDGfAcBJ0oZ4Trpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K35khRLceDr+6zShZI3xTfvOyYzLrLjP6dW5aGDQNS0=;
 b=yMWZeOV4M1opakcBkmxxQs1AWZo7lkzboltza+gekHtbQplGjUojKO0BaFFDnHvDUFNperQQZamNQED7ugzQlrvDStBnoAUlu1A/GRIlTTW5OV77rNTnN9Tb4X0OW03LYCPMeJ+cnN3d0d4SQv+LsBHlvH7Vl1uHXAKKjpncF4oAzp1aPDFYyIY6yUJAqOUZ6HUHkJlfxUydH91uLgzgPSQ3vp8tqorsJdvpTg3SdSHFlru12de2WqU7PC4+8EIUA6W6VpOWhfeQu6tbizW12dTUfGG0z9MMZL2/hHmsGHCMKmXHUD9wlQRd6/xajd+MaXOkCnszS1dd/beefjf1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K35khRLceDr+6zShZI3xTfvOyYzLrLjP6dW5aGDQNS0=;
 b=opXUbY/vVSrQzkV0xDFSgt4c6D/9K/hQXcJLtlQG1XdQCK9pvZ1DeIJjOsfaxc3+HBBaOe5sztFRT/94vHU8PXlZyvaN1KgjIafNO3d5dj0g+QDE/frWAYrIQJeJx1sJPDhErT430ajlBH59WNMKeK1I2F0qUQRpV/wO0oiQ7c6CEuVH3CyFYqFikVck14zmKzuAzy1pi0/nlwlX/Iq4PsSswS27B4QKUEACzhtMpY9K3Be5XHSEgzXMp+Lthu7wHkwsKYzDiHZbdSrHuLkskTCUhoBf/iB/2ktOi2WaYptWOdCfpIzSBnyrDmPUzryPLxR011VClnv2mWnSWXgnNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 03:03:27 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 03:03:27 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 08 May 2026 11:05:41 +0800
Subject: [PATCH v4 2/2] media: nxp: imx8-isi: Implement get_frame_desc for
 crossbar subdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-isi_vc-v4-2-feee39c63939@oss.nxp.com>
References: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
In-Reply-To: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778209560; l=4693;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Q/MsgM4hDAsxIxSkzC1KPUa783btZ/YZkbXM6+6/5Zs=;
 b=+LtT5k+xllJOooEbnS6LMkd8zXL30dvb4B3+eexNONx9L+WK12gljoUOQz1VTJOwB+TDVJiGb
 5lpFLrdlZRnBPt4KdglkIAMQIypm/Cuk0As5ud30D7jCcXtez7HcA0b
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9ff403-97a9-4bf9-7e11-08deacae5da5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|18002099003|38350700014|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 c9l+1LiKRsO4Mqgn49+wMPNtp3WWKTMno+dIXVTdsdm4NfDCqLWDa7l/Us5K1KPj5Fx+2uiqt9HebTFWfXaZ1TinE3eTWcvjrfRbCIzLGv5tT6rZbhqDlfYYSaCpgBLJ7p9/2UVnOcTGotTIcBkp0WvsUKb2SwC56OoMYNnzjqv/FyzTGvwOxoMMDaXQbUiM45ZfV3psWtAiXV+3ZAKACgIIOhbg3tRj7kkWfdFoJWOubTCqmjuhYmOLj82O2MLub3A997qLvKVcQf83fubx7bUMlhuupBcyS7ExedDrgwCXG/+WSTnkgZdKn0T/klqrAwMvYT7hgB3zTob2wZLvq8Zdx8OqgUrAJvBP9MxyOXPuaxhiFd3Z/zSLJXfKI1BxY7Vg9Kg/hAbIgnRJxEOnDwecMNzQgV0fT0bkjZfjMhKbQ7Ko4W4uMHnZWWNJnBCB1T/8WWEg1H8+vwC/C1iY1aljc7dxSeXDz4wPHLeNmnFACGAouDOOiMClfQdPSDRZ7Apyt/w8N736DTR7Wz+7gR9RyZo1Mb+Kpirx3y2aSgAKib/O/btR5lcgjRZTajF5MBp4Sq2PPYQUubD0CAyMA9DFrAZjQWMfBUdmopRlwtkyiCakNq5UJLYJMgeWu8PHnpoF+Qa9HaM+wpXwJL5D9E9MadFuSgWMuv23kkAX7yASuKx9OLgdI4Vh5XEc3Qa31E1j7NLtxSDULCilVwYzC7hz1kc3Oxo2TNNTxXJgt1I3mLWcFC/M+un6bJRBlLCg
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(18002099003)(38350700014)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Qk9ERGxCVXFhdlZtUVR5NEV1aDIxQTVib1YvSlF6aXgybXVMckk3UHJEWHhw?=
 =?utf-8?B?MTJVQlYxb2pDTFNKeEZTbUlNS3VvL2R6cjR5QUZUS2xzdlhNNGtRcGVSQUg2?=
 =?utf-8?B?UEQvSE1MU1ZtOUlZZEZ1WjNVYkw4VU1YMkN5WWFNTUJLc0VtMm9ZMnZsQXlz?=
 =?utf-8?B?VzJMUkxkTjhlSFFRM0ZJSVhjZjhwa2hxeWdkV20rTFdFTDFnNFRhdHhMQ2ZE?=
 =?utf-8?B?SjFvcHFPejFrL3Q2RWRsQWkvbmVBQkVKMWwxRUx5ZTg3cmFFTjNlL08raGsz?=
 =?utf-8?B?Y3k0dUpUc0xhSDdZOTdYUEh2UVpud1prV2dYY0JPZ2JYSElYKzVpNzZnOFdP?=
 =?utf-8?B?MXVWaFF5ejg2ZmEvVGVSUkM5RUlHZ3ZIUzh1K1oyYVJKb0R2bEhhL3pYamxV?=
 =?utf-8?B?b1Rhb0dmbFhpb3dBTmVnclhvSmNSVDVLcGtCYlJ2dE52dGdOdUljTzhVNktO?=
 =?utf-8?B?a0FFQXlzMmFuekMrRUVUdm1uZWsxUzRTNDJVQ0FtOHhXU09GaUtNbXlFR2pk?=
 =?utf-8?B?ZWZOdnZTdDduemtHOEZXOWJsVUxvRGRMd3JoSTAxdXlxZzBKYXNVb3BrZ0tO?=
 =?utf-8?B?ekgxQXJXb3NOSGNpaFJmWlJmK21SMG5MUE51M0g0K09XSlBJZjJGT1hqUExl?=
 =?utf-8?B?Mk9Pc1FnY2k3RUgxYituV1NGc2MvZ0wxSXVPQzdrVzZCSDVIM3g1b05sRUlo?=
 =?utf-8?B?em42K0JMQ2NLa2R4T2NjQWE4S3V3NVVQTmtadCttT3cyYzd0WW01SmRzN1N1?=
 =?utf-8?B?M1kyVFdjejQ5azJYNTRxYVg2QWEyd3pSNXE5cmFPMXZ0R0VuZXhTTEUzRzRt?=
 =?utf-8?B?Y3cvRVl6NWlZSGVLMnVZV3NoZnVqQXVDeUJDcnBRRk1BMDJZNHBuOW42OW1Z?=
 =?utf-8?B?TWNCOTRIZUFPNHZhZDB6TUU3UEcwWCtBbjVLYzRxTUc2dG5zRjdsSnNKejN1?=
 =?utf-8?B?WnEvcCtIbEFWTlg2ZmlEVDJoeGhTeFl3WFhEUjRENGJlQTBpekxOaE8va2Fj?=
 =?utf-8?B?Y2pTUGR0MGhreEpZRkNSdUZGbmV5TGQ3YWxqR0pJNk9rNVRvNm1CNVdnZWJN?=
 =?utf-8?B?am8wOUliSktWbU5FbFBUdlVLaDdSb3c0TnlwS3NFbFZOakdYcWtUdm84U3g0?=
 =?utf-8?B?NmpoajhGc2pJWWRRNEtmRWN3Wm9Qbko5MGdaN0xESFMrWENCU3dkTjRuTWRr?=
 =?utf-8?B?cmlDR3BwUUh4K0ZTUFQ3elU2UnFBZzdvVkl3VFIvYlZQMmE4czh6Yml0NGFS?=
 =?utf-8?B?ZWpoaUdIRTd3cVlyU1Y5QTA0UE41NHM0a1VOMDVSaVVCSVhrRjFSOVdoV3V5?=
 =?utf-8?B?STVvZHhhMUhrcks5NVJDdkFuU2pEZ0phUjBKVlk1dzB4QlR2R2FuYXNDVXZk?=
 =?utf-8?B?TG80WkdGV09DSDF2QlEwelo1bnIvUU1oWFliWFg5d3NDbldobzZEc0EybHNS?=
 =?utf-8?B?cHlRR0JmZUZibEJOUTRUSkticGpLc0tLeVhQV1dCak5YaU9sM1VoNlZXTis3?=
 =?utf-8?B?S29FWWFaMVRwbW1NVkgzeE9LYlNzTVowa3RhNFF4dXp1VkJuR0JuYjlKaU9G?=
 =?utf-8?B?V01sUUNjMWp5eXgzN21yUFoyWkdiQjBaRlJ6NUdpbEUwQmlmK0EvT3o3Q0Ir?=
 =?utf-8?B?VEVzUDBHTHdNa3c0Z2tlQXBQOC83YTZBdk40Wlo4VDR1RXF5ek10cWdUYU5E?=
 =?utf-8?B?cmF1SjlMN3Y4bVJ6U3c3YlBKL2hwV1RoY0c2Y0lrcEoyWGczQkpKTy9kaFhC?=
 =?utf-8?B?SFBPNFc4Mm5SNHNBVW5MUENQUzIwcU8vYVNIUzJRWTBWUTJOTXQxSGJtUkFw?=
 =?utf-8?B?ZTNBVkRhdVZndE9MQmNMTW0vbFo0Uzk2ekxTUmk1Q2I5RDczVTJObEhodUxK?=
 =?utf-8?B?ZHNzRFZIc0pPTVpUSTYyTStSN3llcHRxY3Q4YmRWS1lCTXFiN0xaWFJnQVIx?=
 =?utf-8?B?QVRXWmYzWmUyM0lKMDJUb2lBbnY0R1M1ZFV3SVljTlV4Vm92UFZFTTZlUWcv?=
 =?utf-8?B?VzdMY0JlSGhZK3NDdkJNU2E4cEtMbGRLU1hGbHpLWFFicytVODBuMDR4UUhk?=
 =?utf-8?B?Z21XUjNkeE4relU0ZFlaNVBLdTgwQitYVnlOOHpzV2EvOUFRM1dXVXNKRno5?=
 =?utf-8?B?b1loeENVUzBrYk1nWkhaZXkwanF0c3ZIajRtMVBqMWYzZEZOdk93Sm1BWWdW?=
 =?utf-8?B?V0tZN010QXZDNnBDaFZydEVXQlVjY3YrOVNZMk9EdFFLdU9PRUJHN0xRbzlY?=
 =?utf-8?B?TmtPd3hKbWR0OTNaMTV0WXZWVGpKVUhsaW44MHZ2ZC9uaCtpUTNIclQvOS9R?=
 =?utf-8?B?UnZaenFCMEp3VzJkN3Axcy9OTEJheHZML0hXT0pkU01uamIrMG8wUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9ff403-97a9-4bf9-7e11-08deacae5da5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 03:03:23.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7mgs+nzLIudpZixWTgRH4RT97HJZqxMRQV5fl/YUUejxH8F5o7P/Zpx2QuORkoyaN1MalvjYkpWfQ6ZXVQXgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006
X-Rspamd-Queue-Id: 280FC4F0FA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60887-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Implement the get_frame_desc pad operation for the crossbar subdevice
to propagate frame descriptor information from the source subdevice to
downstream ISI channels.

This allows the ISI driver to retrieve virtual channel information and
other stream parameters from the connected upstream, which is required
for proper virtual channel routing on platforms supporting multiple VCs.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Use %d instead of %u for ret variable in error messages
- Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue

Changes in v3:
- New patch added based on feedback from Laurent Pinchart
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..b5eff191b2d5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -306,6 +306,103 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int mxc_isi_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct device *dev = xbar->isi->dev;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	if (pad < xbar->num_sinks)
+		return -EINVAL;
+
+	memset(fd, 0, sizeof(*fd));
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	/*
+	 * Iterate over all active routes. For each route going through the
+	 * requested source pad, get the frame descriptor from the connected
+	 * source subdev, find the corresponding stream entry, and add it to
+	 * the output frame descriptor with the routed stream ID.
+	 */
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc source_fd;
+		struct v4l2_subdev *remote_sd;
+		struct media_pad *remote_pad;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		/* Find the remote subdev connected to this sink pad */
+		remote_pad = media_pad_remote_pad_first(&xbar->pads[route->sink_pad]);
+		if (!remote_pad) {
+			dev_dbg(dev, "no remote pad connected to crossbar input %u\n",
+				route->sink_pad);
+			continue;
+		}
+
+		remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		if (!remote_sd) {
+			dev_err(dev, "no subdev connected to crossbar input %u\n",
+				route->sink_pad);
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		/* Get frame descriptor from the remote subdev */
+		ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
+				       remote_pad->index, &source_fd);
+		if (ret == -ENOIOCTLCMD) {
+			dev_dbg(dev, "%s:%u does not support frame descriptors\n",
+				remote_sd->entity.name, remote_pad->index);
+			ret = 0;
+			continue;
+		}
+		if (ret < 0) {
+			dev_err(dev, "failed to get frame desc from %s:%u: %d\n",
+				remote_sd->entity.name, remote_pad->index, ret);
+			goto out_unlock;
+		}
+
+		if (fd->num_entries == 0)
+			fd->type = source_fd.type;
+
+		/* Find the source frame descriptor entry matching the sink stream */
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream)
+				break;
+		}
+
+		if (i == source_fd.num_entries) {
+			dev_err(dev, "stream %u not found in frame desc from %s:%u\n",
+				route->sink_stream, remote_sd->entity.name,
+				remote_pad->index);
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		if (fd->num_entries >= ARRAY_SIZE(fd->entry)) {
+			dev_err(dev, "frame descriptor is full\n");
+			ret = -ENOSPC;
+			goto out_unlock;
+		}
+
+		/* Copy the entry and update the stream ID */
+		fd->entry[fd->num_entries] = source_fd.entry[i];
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->num_entries++;
+	}
+
+out_unlock:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					enum v4l2_subdev_format_whence which,
@@ -404,6 +501,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
 	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mxc_isi_crossbar_set_fmt,
+	.get_frame_desc = mxc_isi_get_frame_desc,
 	.set_routing = mxc_isi_crossbar_set_routing,
 	.enable_streams = mxc_isi_crossbar_enable_streams,
 	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
2.34.1


