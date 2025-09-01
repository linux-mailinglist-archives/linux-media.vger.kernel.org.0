Return-Path: <linux-media+bounces-41391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A19B3D9E9
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C164F7A7F62
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C66260563;
	Mon,  1 Sep 2025 06:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GsFd4jD8"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157F25F7A4;
	Mon,  1 Sep 2025 06:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707970; cv=fail; b=Mv6DPaK9AfJRsJo7CYmb6qNjx2cHAoi3GR1UGfEc9CK5tt9DUk8tWUdW7J+Z7aZJXy88KtqIQ18lKlOMXCNTQHCOTqytVSKKsGfVa61u04m4fRv84af4JrbD8BUfCFITp2fSqza3p3+cliHrKBIiZN9FZc4jWZ8NS2CM0RqQc5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707970; c=relaxed/simple;
	bh=KJ/sPmzIr+v7+lVJwiQ/KsAVMVTwzTynycZSiPF3+qo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FDk723iNDDse5r7mZc/MqCxsXscyXFC2VgP4DRi1AlY4EiE9CqGkOLAuXqzSpgJ1tKqMMwaHtUO9NQtib3Z8q2+H1sG7i5yyAaatYFt7W2R1ntgJdmfoTfeaCumcayhste08rGvbo8VVetW2Drf1MgmfWvcxsB4S4cyNf2Y0TBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GsFd4jD8; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrRBcfi6VW8unzk1CnXjFQk0IpnD0hi+MR0THJB5GpMWF1XwNJbSOxo48jPAlv1SuWAPkLo/dg5Ew6+shtywNOlYESzFiNOS28o7V4sl0WRuW3hLe3vFo26zlhuU7wZCAgx6ffpxipzF04Sy6jxuw8KVnJITJMVpwjQe4SQf4o9IttFt4PLAqr5BafbgB5xxciq5zqRDDJaBx6aurFwg7XkU1xCmwaDaOlo8L/ygaaDkh22Um+hXcuUF0LGUnHnMsxMsLSdwshRDCUZyxKqdHMTcivwE2VYfNGbj0WO4FQNBiw9LV3gE3+V6B36lZUNddk91dh8+de4rXu6zl9e2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb+l/R8zOwRvkT9LYdrq24LjORR7d8woY/BTReeQKQI=;
 b=laL4c6fDrJlosJXBXTDiLxTdngqL3D4EfkobdPgOa7LJXZTD7OZtTjh5wK0zaeJ+4NWgoaZKMq44ZynbnUTpVfQA9XiK4L/bfHcBJSxiOWYiBFlMCPc2NyX+L86U/xMns/tSgYLhdWsMhQy4PQqRjcHACAwW9rDVqcLU79JW8LBJrsD+xz81k8d8sOZnUTKciHudx+oMsVobMc1QdMy2HP9vxQlve8tg+WBspQoqYPDDvdXzpjJUow5FugqlZJt7XodWB+g0gGwe9AshNQRV4ptAtXBu1ERUHvvEFvvzqvEr/lhDVZXxgvn7RmvHxXjJZuTkTp1wAz9gBNVf0AdWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb+l/R8zOwRvkT9LYdrq24LjORR7d8woY/BTReeQKQI=;
 b=GsFd4jD8005uov9JLUYoDLL/zWe9C3CdFPiHosc9hyRJnFRlOGh23UvHpD+hlvkQl6sbxMPvOYwSAJdNcdP4/pubWQQvPV9MK8ocaYQPQSM46Sc4zEbyjvEiQnIEf4Zn8TUqyA5kSnOg7uuWX28QScdRfR5kA2volXLICoML9bzr+a88matOgsc9PTDGYnLCd0pMqWj5HQjA67Teh+zi2xlOd4XSI+EiZUZcL8uJaQQAOR9JqSPi4xGWHCAnavWwZRNRpWiy+zfacNlKq21rjPF3HUNg7gANJoHzF06CLJXu7JtaiZ2y/8hfU9hi0LQsBmfYd6ZzRedlX9KrO4QHQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 06:26:06 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765%2]) with mapi id 15.20.9073.010; Mon, 1 Sep 2025
 06:26:05 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 01 Sep 2025 14:25:31 +0800
Subject: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-csi2_imx8ulp-v5-3-67964d1471f3@nxp.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
In-Reply-To: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756707946; l=1321;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KJ/sPmzIr+v7+lVJwiQ/KsAVMVTwzTynycZSiPF3+qo=;
 b=rRDLRs3ldQy05MiUIrZ/BhjjsYZU1PB15xczuX5pkTsI+ZLVz5VFX8oh22AVFN/BvKNamw61P
 Bz00GtPrHfYAWdbbKGZXwfhiL9z1kO2O90M/LTARfDrq79isAtttj+X
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bccb3c2-48cd-4dfe-151b-08dde9206e34
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?K3RZeDBQdDExL2VuZjhnczcwZ3BBK0w5MjkyMVUxd0VjVzVheGk2dW1UbUNX?=
 =?utf-8?B?TDN6VllCeEVOM2tMaS9zOE8ybko0S0xCWXJSQjlwbW15NytRODVxWGd3UG0x?=
 =?utf-8?B?S253WjViWDJnTVlCVnptQ0NWT054N3kxVGxCdG9INitPYnJ3aFpPN2RpNGNh?=
 =?utf-8?B?ZTNGMitSaHZiMEQzRFo0bW1GN1djNTFWbXZVMENudjN4SG9DRjNDMU4yeWFx?=
 =?utf-8?B?azdNa2VlTjF4QmMxc3dRQzZQcVBxVStSNzhtdktTZ1c1VFFLK0toZG9zaTVw?=
 =?utf-8?B?TVozMjZxRExwajFpOWFEUVYwNWtrTjZibVZpSmZxSERBcVJWNjVvM1ZHbkd3?=
 =?utf-8?B?SUFwQkZNSVN5NVYveFBobFdSWVlZNGk5N3luWkFMOThYcUpJTVlQSVh5cVpw?=
 =?utf-8?B?ZUR0NHEzVFo2OGw2b29hK0tKeHpCaFRqR1IxRkVrc3E1bHBaVlE1c0V1SlhJ?=
 =?utf-8?B?eDVjMUhyeFpPRTFONDI4dzZTbjRFTkZnSjh6SUZYVDhqQmtSZVN4c0RzZG9K?=
 =?utf-8?B?SnY0bmlFS05na0o3TE9sY1F1Uit6b29NOS9LMmp0UXIxbmVtSG5XOTc0dmox?=
 =?utf-8?B?dXlHbjhJK1l5eC91aVpJcC9BWTJ6cVpua2RmMmk5dldOdXZ5czd6WWdDU2dC?=
 =?utf-8?B?N2FaSjYwZUU0VkhORkJydFJHaDRpMUd4K3dDOXZHaUkyQ0Q0R0tRUC9NSkl0?=
 =?utf-8?B?UEVOenAvYWxLY3dWRGx5Y2hoNWhpb05XelgyNGNMSUlBQ0pZKzRCYm9WYlp5?=
 =?utf-8?B?MUJkbzFXY0d4bS9XNXRXbm9BS2ZDc3JpSmFjMC9ndW9uaE9HRWk2d2ZvbWhy?=
 =?utf-8?B?TFF6TEFXRU9PdzRFeGM1RmlBK1hXWEliS3k3UUFpbDZMc2NnbS85ck0wQkFy?=
 =?utf-8?B?NjdpMThpbkFmZVYxbFBtN3VzZWhMNjhKbzhOT013aDliR0RzNmtrQVdaQ3pM?=
 =?utf-8?B?NkV6Q01FRFZ0OHUvZE1udFhxdnFCV2h2TmdEM2FFdnFscVJwM2JrenB4Rll1?=
 =?utf-8?B?U21aNW5PVTQxK0VZMlpWcTZDVHRiNENFVjhOcmlRR1R2T2htanZGSVkvdStJ?=
 =?utf-8?B?aEc0MFVhSnJCcTRLMTR4K0FPWCs1N08yK0xURy9qbFFidGJLUlBwVE9rd2kr?=
 =?utf-8?B?Q0ZVbXJMZXNMWWpxM1NZM2JqUFNVcWRmMU5PUmNpcTBMMis2OW5pTjY1RmRH?=
 =?utf-8?B?R01BemFiNmtxaEQ4b3E0NUMyZ0VHa29XWWM5WmpEWXBtQmowK01MVkJ4MWcw?=
 =?utf-8?B?dWdEZ20yMGJ6aGZoa3NGcndNSy9MMnFOZktTMFJUVGdjUXZXZVh6S3pzN1pM?=
 =?utf-8?B?Q1luVFNtcHlPRlZRQmp0VGpQT0RZVUpuc2g2bHVwN1pCc21KNXJxeEpBWjVH?=
 =?utf-8?B?SkhpVytIWVhTTlJwSW1pT01uUnA5UzhlaHdTYyszVVU5NUJoWW5HMVpjTkU2?=
 =?utf-8?B?N0F1dDdGYjFFaFc2a2k0T3o4SGF5MGFscU5vdHM1NTBpVzlzNGdnZ2lWOVNz?=
 =?utf-8?B?N3ZsaXJnbk0zcG9sTmFEOVhMQjhDTkxPcjg4TXRNWjNyMlhUZFRoblZKYjlv?=
 =?utf-8?B?YURIZWpGWU90aEFmTUZKeFNzQVlLSmZmNUxoRmxjY3pNTlNMQ0h3Uy9ibk9L?=
 =?utf-8?B?dTE4V1RTOVg3U3JKRzAzejloMERxMUxVRXJzVVZjYXdBV0x6dXhIOGljNGVR?=
 =?utf-8?B?SzB5Q2F2K21tVStvTmdWMGJwQzhLeWRDMVdhaUM5YjNpQkRTRlRRSzVyc0c3?=
 =?utf-8?B?UjFEV3U2aHlOWVdFYTc4TDdYTDZIeS9DRzRGckxrV0c2bk5oK1pTanBKOW1r?=
 =?utf-8?B?N2FSQlFwckowOWJudVE0bFl0MDQ2cDM5dHFBRnBoZElMRDJ1MExZY1hycWhW?=
 =?utf-8?B?elZRUHRMdzV1VVA2cHlSRFN1NVVLWmFRaXpPUnRUNXVjWlUxRjNYVFBRdEFG?=
 =?utf-8?B?T3BVbDVoSHVSbnVBWS94aFZrS2dZNUQ4NFpqdFA5UlJmYk0zY0lvdjBvVUVR?=
 =?utf-8?Q?cvNycwckvSgNn6UcaoshY4+s+V9Bzk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WUxxOUxBWGtNY3RyMUpWUE82ZDgwaCthdzkvbkJjSE5VbFpLalJ0MHMwN0NU?=
 =?utf-8?B?NlQvbVNBS1hCbWhjVHJUeEI5azlwdWRQdkJzV2JUU0thWGRxYUdxYnMxNVVY?=
 =?utf-8?B?eFUvSkJ1WkVOQWJRZ0k3Y1EyTmU3NUxLalBPUlhJUjgxc2tKaUkyT3U3UzlX?=
 =?utf-8?B?SmNDcmhoZnY1OCt3RWE3ZkVURzJTYVF6Ym9ZZmdOUkhCUGJPV29ha2YxbU5W?=
 =?utf-8?B?SnNWdTI1enhFN0YwcmZSd2dMMlo0RFBJK1JlNjRMT1RPZWRXQXZEdEtWREpn?=
 =?utf-8?B?NEg4SmJDM3VMTU5YMExPVENJQVhmK0ZuYkJNdklBUTJJOVlBU1dxSEl6RFZN?=
 =?utf-8?B?WVBSNWxkVGpBNkVteE9UNFJ1aEVGWjhXZTJrQTBvbjg1cUNJcHA4SXc0RDhi?=
 =?utf-8?B?Rm0zTTFWNzhuUll1UG50SkdrV0xHOW1ZQytjM2ZTRllxQU9oaTkvd3A4S1c5?=
 =?utf-8?B?UUcrRTQ2WGlCWXEwUmlNekFZMWRWbDRpaUpJSmRmV2R0aW5JTFdBT3ZYVTkv?=
 =?utf-8?B?SlFIOFRycFZ4K0dsb1ZYWWVFWGUvREdiaFdHejJxbmNGbUF3Q0kzUnQzRk5G?=
 =?utf-8?B?ZFJjVFA3SEo3UUNBRzRFTE1jdFJtQXAxMDBBOWdhWUNRcTkxZDByYUU1V2ZQ?=
 =?utf-8?B?WTQrTnQ4T0xCMFlMU003Ym9GWUZFZGlOQWVZZ3dKNkZpRGpDR1FJYU9ySEN1?=
 =?utf-8?B?RzNzYTZDdWRaMFV4QU5EM0dFdm1aSm9XQUFZaU56SlZqUS9vMmcwZE11RXIz?=
 =?utf-8?B?cDEzdXhIQmxrZW9ZaFZMSmpBdE5TdERmRzNwQmdId04zd0k4YnZDUVZjblFO?=
 =?utf-8?B?dHdRbU1Oc2hGV0tHTkhrb212ZXBHcXRqaVdHQmo0b25Qa25ZTW53eE4zWWdP?=
 =?utf-8?B?bm9jM2hpdVBYcVZyZndXNXFGb2IzcDlyMTNJQzlZQ2ZRS1JaRmpXa3FoN1RD?=
 =?utf-8?B?TUpZekNkSjlGaVRnR0dLQ1duWFpjL3UrSXBqdjJGbkMxNE5rMnFuZitvNnEv?=
 =?utf-8?B?cEt5SGp6Q3VhMitEMzFMWlVvS0pVOFpyTnJxcDZzRVpueUJaWTdEK3gxWFow?=
 =?utf-8?B?NUpmQVdyNCtYRC9NajdzREE5ZTNvcC94SHZXN1hCWVNhTG1Tc1Baa2dEaEgz?=
 =?utf-8?B?dEtnMWxXMk9tZWFreU1GWnoyeGNoT1RNRUtxVUFJVHFjbVpXNm9Ca01pbkFm?=
 =?utf-8?B?RWhZUUJub3lETEFTOGo2K2t2NEJ3OERlZDQ4N214QXBLT01wS0g2ZkJqSzg4?=
 =?utf-8?B?M3FOemgyaEJURWVZVDBHSEtWaXQwTXUrWHlLWkU5RUpFYWlWM0dJMDlsRGhX?=
 =?utf-8?B?M1JUamJ5dWRUTXZWajZleUcwTUNjc0dqdVNVNlFvYWM5alkyK0IyL25sQVdG?=
 =?utf-8?B?cDVNSzA0YWo5TXRxc1pwRS9kd0hGNjdSMWRiSFJ2YlNOK240N3h5d0RFa2VZ?=
 =?utf-8?B?MEQ1TzRIK1JDWWlmankvd1dkaWk5d3dJeDN3UjJXY3RhcS9KYVFkWUVpVk56?=
 =?utf-8?B?Mkh3d1J5UXhWbktuM0ZmVGo3RlZKVHV1bFV4VU9IR2JReFpJazBDYysxN0dz?=
 =?utf-8?B?cWdLdE1CVDB1M2QzTUROenBrY3ZsYmQ5UXAwSU8xTmJHa1p6T0RZRjJUM2Y4?=
 =?utf-8?B?U2t3SUhDMDFKa0NIdzFSRmVOcml0dFJUVlhjcE80NWQvR0d3RXhMVy9QTnRS?=
 =?utf-8?B?OWo2Q0prZ09GdEJITkZmaWl1UEpwUW5ta1k4YzkrdCtrQ2dGR1kwZHFtaE1B?=
 =?utf-8?B?UjVFTmFGVHdsV1dmOWNzK09TcFlhdlBMeTRaRjl6QXpmeFc2clNDMXNMeFg3?=
 =?utf-8?B?U2gvT3RWMGtjSW5qTUVQbTFXSTFlWmN2V3AwbXdMb3k2eUtndjNOOE5TS3Iz?=
 =?utf-8?B?dVRhTmgvL0NzWThwMHdMbjl3Y0wwLytYVVEvTmVaejBYaWkwNFJrTUxwWDRF?=
 =?utf-8?B?MmZodEJlVUdJbm1FQWNCVk1DNE03TllHd1VDN3hhcnhaa1YvSS9QbzJDZ0V0?=
 =?utf-8?B?WlRNMm12dG5BWVhVa2hSZmk1MDQyTzRWZmtLWWZGWnUrWEcyTUhCSmRBZ3Nx?=
 =?utf-8?B?VFJOT3pCOEFHeFI4SlZrY1E4TVJ6M0ZPVlJUWnF1VlBtQUo0cFp1SC9Jc3BV?=
 =?utf-8?Q?gtwAdXppzgZPerSZP1RpNL4Oi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bccb3c2-48cd-4dfe-151b-08dde9206e34
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 06:26:05.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zm6p+QCwn7MAeEIwuUAIzVJJXhYGYHzO/RG1sNNW4XnorxCynOqK6tYgrG/unWyce8kXuk/acgW0nXFyMdtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


