Return-Path: <linux-media+bounces-40687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD295B30615
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40B87211E5
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE48537F210;
	Thu, 21 Aug 2025 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Beg6JjIL"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093DE35FC21;
	Thu, 21 Aug 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807561; cv=fail; b=g7da6CHwnHa7nMLr+zubCDH9gEF8GMxkRwDF6aKjluXoikNqqCzBbBMm1Dr8fDpW9S8Ptpm5KoLSyVbAnbpkT/QDIFdo4HhNsaNgVIlX3LSf1ZePMq+c8bAuApuWhyLf33yrM1+rl1+sV9qEj3zCgeKrQvo9xQ6rnjvIWY7+Xgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807561; c=relaxed/simple;
	bh=Ag9nOnfiNl255Z/8uV4MDE77idoaoGDH/nePpztgNkE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UVjhDiAn+20aOwq3Vw8iAZxc6O0onCqTbNkLdWAD5v2XrRbfXSTBtSgUPU9krQFV1AFpOMxy7Ub06WN+H8exeIWwpS3fV/+tjgCksXw7TfsoN9POnwtu7z/7Khlt8nm+31NL5bwRUIs4Q9abFyMN37rxLoNIy0Wd6tI4fH5IuXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Beg6JjIL; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQh/j5Skhw3LoEpkxpkkVQWVEy99pG+56Kfd0oz5cUrjtXzPkvBifkLRAV7Vbohu113mpgLeXQR3wKf8qXJ2FxS7agKseCYs7OEhzvMDUcWYLcjV0dW3QvGp2q+ffXUtbZC4uFS1VY/0Gv+T6CSR1uWDAimbb8NklAzHjOFnHAd/uQOV0cI4cJVpDsrW7onyc6+8RQD54mefhqfKx+Ib3qSAWt3PudiS4I3AtDqrG6rrY40hKMo0bXurG0chyCsv0tHK2VWI00Mv+dXPqA8Y+7tHnqDpK5cAVEHf1J0kurmEcyZQaDZ7+FVUeJMHCQPEy8sy5Ppu8bHe7BnM251Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOjStedagn0a7Crc8liM4rlJBF43/uvGuUCflfIyP9g=;
 b=MgvxMsrK7vCB9ztDUCR5g6ZW2bpzyHuaVjttQFJZyfelBXJrDbBQr4WglEPWzdwTN0nd+kQznMO8XYyqt5jCWuuDToDYnwwAUDc9gerx/To5j6chjObbdD+TFmnOrW8Y387/L1G/ZF+oW267SmhQag3BmyXpXVA4JdWt0bIbNAw7qES7J09qAxTichJ4nvhVICbTZteglGur6/L3mhTnqSoGYfhKnLTlwE1nGsPkjUYRbl0R2w4cEeCz5dsE5VOUZLwoL1y62WITofn73uHnpJWWmO3Bsyz0r2VrskHb/cidL083wkeqyApDGs5dbxFG5uQej0M2u+MsA0g9sdC6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOjStedagn0a7Crc8liM4rlJBF43/uvGuUCflfIyP9g=;
 b=Beg6JjILyV//H6BlMEVvRgGXp6UP6+mhWa4hATuxGLoUzne8rl0MxdyJY2lJYIqx1Ie1PLMKAcTnPm10aGCal53JJkjd0pADYX4TaUMUrxW3nbNgCxRiLpQMeTXUPCiMeu56tSvLpXFs9pfiQAoU2W8UDdlBkleNagcxsJto2vbpxNBCTpDL7cZ+j+WDy8ukHgoDKUvhAAyM5LY7uNTNbtp2xvovCfEuL62pdIIssZUnOaVdT10qj1Bwb76lUxVj82y780xC4/IpspgC+3C7K/SZ2P+Ygivgw4AdUMUpod51bthSgTKIGdZBkmWe/92c1WrlIfs35kjHfmN6J2RP9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:19:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:19:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:05 -0400
Subject: [PATCH v3 30/31] media: synopsys: csi2: Remove source pad
 connected check at dw_csi2_enable_streams()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-30-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=2239;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ag9nOnfiNl255Z/8uV4MDE77idoaoGDH/nePpztgNkE=;
 b=EirUTGedqBJZMhNaFdpKBq+InMA95M3SU0+kZ0QUfiRJndqFMbdkcsR78qtmYBeHUioW4pY4R
 v689PwdFocXCCnidMEjF1gM+Cts4s9MlaoRxE+CTbWnw4MHQQqmcywg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbae4b3-472f-4b96-c5fb-08dde0f00089
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?REkzbFpIdWNwemFTNDNuTVgrdDRyZWFCc25MaFdsamJEMXd0TDhCeVM5V0Qr?=
 =?utf-8?B?SCtmU3FnUjBTNU8wZ1Y4UWNyMjNGb2U0Qk9NQmN4dW5KUFlJRmJkcjZhMkNh?=
 =?utf-8?B?OFB3M2Y2bXB2aFlBb0lRYkI5YVZSZFFQMlZBQXA0L2tsM1cxbUhwTkFZWElW?=
 =?utf-8?B?cm9sanhKOGczQis5bXlZT282MllzS3hBY2xFMHRYNmx1VkFGckhrMGhmRU90?=
 =?utf-8?B?OXJ2Y1kyOFBIQkJQZ0VzT3JVZnN0WmZNT1pnUWZ4Um5wbURaTW1mSDJTT2ow?=
 =?utf-8?B?aVh4cXYwZFZRdmk2N2lIdDNRaGlGRDB5cmRvbjE4RWtDOU9tK0J3SXNQMzhJ?=
 =?utf-8?B?dERwR2ZNMExjTjdCR1V6c2JTYzNpbUpBUFVzLzFhQmNFMGRKU1JzS1B0N09F?=
 =?utf-8?B?ZlVYSThhSmFwRk1kM29VaW9wcGRwL1J0TDduckZ0dmJsbm1XNllMeGNvem9L?=
 =?utf-8?B?T29uZ3d4MFUwTzFQRk8ralJucDdWU1hnTFVzS1JkT0JqSDkvalpEb2l2a0ha?=
 =?utf-8?B?ckZkRXNHUERJMWgyQ0VsU1ZmT3F2SkZENmtOT0RZQjUwOHYzakljTHB4OTFo?=
 =?utf-8?B?S0k3ZzhmMXdkcWxUQ1hoUUd4SjBicmZTYUs4MnpKdTVnMXdCaDQ2KzlCcVY5?=
 =?utf-8?B?aGhXOFRZYjZDZFBJbGJYMzNwd1M2L3pTNVduaFNyblFGVnVWaEhWamxKTzNw?=
 =?utf-8?B?b0dIZVVLUWlIRGdWVWpaZ05MdDU1a2U4aTFqWU9nWHkwZ2ZFd0VaMXo1WitV?=
 =?utf-8?B?OEtDWkdIdE9qQkNuZWlTeVpKbEVOS3Q5UUtkYjZucDMwdU0wc3FhK3FkNC9C?=
 =?utf-8?B?dWp0cndOWWxielZYaXJNanRNZk9GS05LUUxrSHRhaWdHY1pRZmtHazNrS2ZU?=
 =?utf-8?B?U2pyWjNTeWMxODMwNWFiZ3p5QzRiSVBGUmI5NVA5RzdTdEwrRmhaN2l2eXh3?=
 =?utf-8?B?aUwzbld4RklsU3pBZnlscm9NM1k5VTlobXdjcEQ4VVVlSGJVY0lVRXR6ZWll?=
 =?utf-8?B?bDUrV2xlK2IvcHhuVHRLUlE3YU5KUERFbFJCMndveGh6NXpOaVJFY1FaaElw?=
 =?utf-8?B?a2tkQ3dBUGFhMkZZZlNJZ0ptUFkvcmRxdzFFWE5GNlFpdjdnbUdLUk9IdzRr?=
 =?utf-8?B?UkZFR3gzQnpzamlhYnpVbWQ0TXAxN0lzYnpMM29ReS9LV1RlSXZyZE83S2p6?=
 =?utf-8?B?UTVmUStjWXZ2TTZTa1k0QlRWMWV6MzR2bFVEdk5rMlR6bElCWEpHV1h3ZmVi?=
 =?utf-8?B?WDRhSWZnNUR4WGRJR0N5b21zYTEzUTdkQzZJNFpSYnR1NXNGRHpIYUV6T0ZP?=
 =?utf-8?B?dzZINGFMc2JVT0xyM29PbjlmbVdxUnY1K01xZmlPRTRvT0RnL2lVY0Y2VkxF?=
 =?utf-8?B?aFp0N2FydFc3WUQyak1XMVp1eVdLa0hwSkdJTVR1K053b0JRNm9ucTN0WkRy?=
 =?utf-8?B?enBWTHRIdlVia0p4VWc4MUk5bHBYMEkvZ1E2RUs4alpQVXdIWGF1YitvMVR4?=
 =?utf-8?B?MkI0akZLVWlPT3RqaXhJcmdTbFlDR3FicjNmeUJRcG8wV1RXbXZia1RQRnRy?=
 =?utf-8?B?THhnTG5YbVVRQy9obkx2LzJ2TWpWTHZWWmtEaUZlU3JnNld3R24rM2Z5ZTA0?=
 =?utf-8?B?T3FPUHZ4cW11UWt5N1VlTHYzQ0xqOWIwYjQ1T3cvRk1GMmJxRzhPU3VxYmhN?=
 =?utf-8?B?U3QwVFB3bUxTSnJFZWdxbGFRQzFYWHg1czQyTWtYTHNTdlp3WFZxbmEySm1F?=
 =?utf-8?B?dzFNeEZzZGhPQ1QwQVVkSG1NaVluRmdGb3R3QzhGUloxWUlNdmtreDZwUmFP?=
 =?utf-8?B?YUpaTUVKcFNFajFkY3dpVUVZb3JsMmtmZEsyRHI0ZkxWdFdZZVFQSXZJb1JV?=
 =?utf-8?B?aUNUcnh1UnMvVFFUczJEbzllZmdDYTdiSzRCWFpoVVZ6bUFnZ00wWFFiZ3Ft?=
 =?utf-8?B?R0dYUnpaYzM1N1RGd2ZrZ2NwbzVHT09GNmlCN2ZjTXBxUGVZZnFvenNwc20r?=
 =?utf-8?Q?XcUtDx0o3lVQv3grWcROO4SiyG+MIQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?blFscWkxaUNuSjg5SGZ2ZVBrNkZ0eGx5bUJBNVp1N1F5K3R3L2tXZnlPNGZQ?=
 =?utf-8?B?djJjWXcxZXEycVdSaFY0WFRpallraG8yZUJ2TXovREVxM01OZm5PRTdxc3V1?=
 =?utf-8?B?UzhNUjVSZitIVWFxdlZlUDdxb0FqSU1OUWpiVmlDNUsrVy9zM2tlb0Q3b1Ir?=
 =?utf-8?B?NDhtN1F2U3MzVGlzRm9pKytsNXo2aEZoSFMyY04wNmMyejY4NlhJWGxPOTJz?=
 =?utf-8?B?cFdzMlI5eHVqUnFtSUpJaUZwY2ltU01sTjROY2hRcjd5WG9lYkJzWVAxa1ZR?=
 =?utf-8?B?OWg4Q1YxbXVDaTJ5cERVdW5nRVhOU1dPRi9qYU5pREw1M05oeCtaR2hNT09I?=
 =?utf-8?B?ZkFPWHhuYVFjeXc0S3FyaXVZWnlmeEp4SVh1cjdqYXdyeHFETFhjdlVjTGRm?=
 =?utf-8?B?MkFzbVJib1pWR01GMk5HSGtYWWs2S0FDTFNlUlhyVFdsbzE3bjNxREVhTDAz?=
 =?utf-8?B?OW8zS2hJdVhXYTJUdGFXd3lxdnJvOEVCVkNLTWxzUklrTUY3S1dlMnJNYnUr?=
 =?utf-8?B?S2Q4c3dtcTY1cG5TZW8wci9HQVpLT1Q4OGFFVHpPbUJwNUJxQ283YVlzV2Ew?=
 =?utf-8?B?dTNJbmZ2RVRNZENnZGJQbmsyUlM2b08xU3BJVjVrTitQUXROYUkwdFExTXRV?=
 =?utf-8?B?L3diSTh0dUhoaG5Dd0NWZzhGV3ZjT0JvY0RjYWhnY3JWa1NHT1FULzdndTlz?=
 =?utf-8?B?UUllOWFhMGhOS0hodUFydDljNHFQNFhkY0t4TU9XbjcvWlRPOGpNVjc0RW1p?=
 =?utf-8?B?SVZ5c1lySC92Uml5UXVWN2ppTFFoN2dBN2k0aUpQdmxlZUZBRWhxb2xsRlk2?=
 =?utf-8?B?dVZmMGRVUkgzTDBvQmVzWXpmQ0JRRXZaMDZJNHk5OHE1NVBTMHNBclAyQVQ1?=
 =?utf-8?B?Ymd3S1BnSFFsSnpjaFZxaDBUb1AyUFRaWHJQcVNIRVBQRHpTZEFkWVZPWFhV?=
 =?utf-8?B?Ykl6N3lucCtZbFdMcXBFeFdadEtlQkpqQUJBYWwrbmIzSTB6QVZxVlk1VnF5?=
 =?utf-8?B?R0NrdDZrMklzdm9GR3NhMVVVdjRZYkRyb3BXano3NjNuNGFNRm5ERENVYWZv?=
 =?utf-8?B?bUc5TlB5VDc2V0R3b0NCTjI5UmxxTFdTZ3JEMHBuWDV4enNEWElnb2pEQnVx?=
 =?utf-8?B?dkNaVS9UOFl6Tm1sK01mOVdBak1UNXBRNFE5OXkrVlRiZjg4dzhGNnVYVHo1?=
 =?utf-8?B?U1lNdnFkQU5NbHBnZVAvNFhFUDBYOUFpRm0xazhsZWloeWZWbEtJTHNoRTJa?=
 =?utf-8?B?SVpiVWM1aHRqVXhPY2hLNFlvRnIxeWFhbmdDM0J5RVpVOWVlUDAyUHZkdXhW?=
 =?utf-8?B?QnZQZVpMTktsRnlZUmMyWjIrai9zWExMZVViNjJMNHUxdVpTMFV6YVJCNlZz?=
 =?utf-8?B?ellYSC9waE12YlUzTjArOHJTN3FLZUJObUdpZ1IvOExLZXFBWDZ0L3FmOWJr?=
 =?utf-8?B?dk1DUDl2NXRqVWlJZ0IycnNobDVkeExDcG9HWXdYYmJmOEhLMDNpNlZiTDhL?=
 =?utf-8?B?cGQwZENoVmR1NDFicmY4WHFRM1hEY3d1OGlPbHFMa3hIYW5lc1pxc015WG5w?=
 =?utf-8?B?UEZ0akZDUFZoTWIyU055QUhCNi8xOGtqbEJQQkNMY3hHMnJNa0M1V2NrQXRX?=
 =?utf-8?B?NjVITEl1SGRHUU1UdjJBTEtyUEhlbno4TTNVa29NSjZYc3dZZEFHTkhDemdD?=
 =?utf-8?B?WTRsbVl4eEZQMFFQTTdxTEkyQkEyZnZ3K2NIOERkVU9iSVdrSnkvZGdNMjV2?=
 =?utf-8?B?WU03OW55Q3d2eG9qN2ZiZlM4OU16WXVPMGNYM1lCaHZTcXBaTVltV3d0eE1t?=
 =?utf-8?B?TzZibXB0MS9GeTJmRmpta1Z6STMvZDFETUlrTFltTEtCbUNzYytHd2swTktu?=
 =?utf-8?B?TEdkWm1PVEtldFIrUEZuMUlrSjBFMUg4Z3Q4dGFSWDZEOXUvejVtOEphQzdC?=
 =?utf-8?B?eGI4YlNWOVNtMytyMEl3MC9icnJnUTVVaTdNbkJ0bVVaaC9mTW12UDRrSmpt?=
 =?utf-8?B?cXVXK0JuUTF4ckNKUm5vR1NITmpPb2d6Y0hrRkxpRUJ5Q2Y0eFFPV1pQWWNp?=
 =?utf-8?B?d09zRlNuUS9VVUhJZm1hRmp5cXFITnBQWFVWWFFnQlNBZGcxMWNXNFNxazhM?=
 =?utf-8?Q?QmVs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbae4b3-472f-4b96-c5fb-08dde0f00089
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:19:16.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cROeGMfix2clTjZD9c9UpTNQqImMZbC7awNvQdFFjfim7ky5pQt5SIf9gYS1WDkJ8p+/moe4W2VxWMTs449/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

link_setup() callback is not called if remote linked subdev use flag
MEDIA_LNK_FL_ENABLED.

Driver needn't track if source pad is connected since framework already do
that. So remove these check and related variable.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 21 +++------------------
 include/media/dw-mipi-csi2.h                |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 8ccd3d4960801cccd8d24647f726e4653955f90c..66207a601c228bfd3d79b7a2053458870622b039 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -710,18 +710,12 @@ static int dw_csi2_enable_streams(struct v4l2_subdev *sd,
 				  u64 streams_mask)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
-	int i, ret = 0;
+	int ret = 0;
 
 	guard(mutex)(&csi2->lock);
 
-	if (!csi2->src_sd)
-		return -EPIPE;
 
-	for (i = 0; i < csi2->num_sink_pads; i++) {
-		if (csi2->sink_linked[i])
-			break;
-	}
-	if (i >= csi2->num_sink_pads)
+	if (!csi2->src_sd)
 		return -EPIPE;
 
 	if (csi2->stream_count)
@@ -773,16 +767,7 @@ static int csi2_link_setup(struct media_entity *entity,
 
 	guard(mutex)(&csi2->lock);
 
-	if (local->flags & MEDIA_PAD_FL_SOURCE) {
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->sink_linked[local->index - 1])
-				return -EBUSY;
-
-			csi2->sink_linked[local->index - 1] = true;
-		} else {
-			csi2->sink_linked[local->index - 1] = false;
-		}
-	} else {
+	if (local->flags & MEDIA_PAD_FL_SINK) {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
 			if (csi2->src_sd)
 				return -EBUSY;
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index d1afd8c6d95457c28d7e1de6935908437372572d..977a9e27cc50ad6ecfb47ebf8d42f115bc51c1ae 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -75,7 +75,6 @@ struct dw_mipi_csi2_dev {
 
 	int				stream_count;
 	struct v4l2_subdev		*src_sd;
-	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
 
 	struct dw_csi2_event		*event;

-- 
2.34.1


