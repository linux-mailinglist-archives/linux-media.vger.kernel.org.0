Return-Path: <linux-media+bounces-36482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18EAAF064A
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 564297AAB92
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF81930AAA0;
	Tue,  1 Jul 2025 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BJCvJknE"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011026.outbound.protection.outlook.com [40.107.130.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C94309DC7;
	Tue,  1 Jul 2025 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407623; cv=fail; b=YGg3jBpPIG2wpChS9ojfbsnV3+RsKyJJ4w9rJptUKKMqbJLGvUUVKzz1a/eEwZONYUuYKY5CkyEpq7Q//Dr8jx5U9iwNfdv/eVD+EUeYJthWI6+xkMFXsrYQYIUTC5hXj8e6JjhiQAIefUYteMfDKZFxwJPdxxjvR/ZnZnfy8aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407623; c=relaxed/simple;
	bh=Rx0BYP4uChCIjomZl1uZo5VX91hrzQ+X44bNyE2aclQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=muZZgAdU895X4S1TNsZKT2IblBQfqh5Onh6t6ER2+RhqSc0vhJAdaYEbGx75nd7JwCx59teEWnsmhKHrM5q7EMX+FLpUYBLct/azfO2Y4p9x6DF51VSEpxe8ajYKlZ/eMATxPn0TsrdNSWpabyb1CLolwBl0K5p655rkzk3deXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BJCvJknE; arc=fail smtp.client-ip=40.107.130.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3fPj7l3zPw0yal0UPkyWtP+ZOMZDVxuqKOHY6nsSSEKKQDoAon5TjlKSLjNlryiIHRz6ZrFfq7aknXWU4+3GigjMnmPtPCk6D1bM44zTwcctOx/H8Rgx8XyATsCWdsyZpQ75rulz0YrJbFCfPcGy6xnOXNhXrqwQoybTDi4BEZxeFr0kGrhnx9DXeNrGqORq82aXJIkpoVzptjI6ZCWSOJajQh/f5vweLxkTaQPJJUFMK+t7R6Tkj9miGshIXAZN9MnjqZ/lKLHvF4OIWunP48lIsFFRiWK81HZnJY8llNbFuDRWxXwngAensx1ysAT0MjEPAm5dfRgk8q56ZZMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCDJnMNNnCpnEZrjpQVFv5WSg2Oku4hMLVDHJOeaK/w=;
 b=v0sgK2FAPLmoNBD92tvawU4ofhQtBGO+pUCz5pgLWHyiQfscqa1fSOBLEL/0BeILTWudWMfkY6rWUqfA9V5UKOHOvqg/Ho6ynZgIulEvXmf2Nm4e5Lj5KXDYAn9VSYCz6vO8SffTZT7qNTf8RcMwheiY7mHj0XTalKFAkXm3Wn/Uhcmr86kaDF4PZe+2PKhok08YYx93tmYw1vg6KK4T+0WUqNI6f00m55IObp0oHvxcJRC7oToux6S2nL6n8pgWqeQ0XmJ0Nl8pSQlBgpAUsfZ3HzAHFC7YzPD1nsUg8B5rwBLIlc4wGUKS1y2Evl/srA2TVycgSzsCk9zo1cD7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCDJnMNNnCpnEZrjpQVFv5WSg2Oku4hMLVDHJOeaK/w=;
 b=BJCvJknEqs4CjTO+5vFLaIBLqQeBNgVTPK6tUTYl3EWNnSnsIYXjzTW+cLsqphI6QhGLrrv0ibyGYhhR3onfHLRW9FD9YDYnMk4jxyK8EaHRXPCnHe1bTc3pDxm1Dl4+88LA3owk+CFKNr1UDHS+MViSB9dEeVP6ypRNlA9AbsESDkqe2efYFKcMhGaQ7qRgEESZAcrdkLjjgHwe+vFsbkxPATnjydkSBrh2PuEQusP2K6pVpMRNTAWKrILG8+Wr4NNAqtTe4t7Jkg9OmkWJKQsqH0OIR5IPwfHeqEhl2NbXbkHLVrAfhEsIHjL7MsEG53q5bjIUEKNsPQ7bVypBnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 22:06:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 22:06:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 01 Jul 2025 18:06:11 -0400
Subject: [PATCH NOT MERGE 6/7] arm64: dts: imx93-11x11-evk: add camera
 related nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-95_cam-v1-6-c5172bab387b@nxp.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
In-Reply-To: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407588; l=4189;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Rx0BYP4uChCIjomZl1uZo5VX91hrzQ+X44bNyE2aclQ=;
 b=TF8UT3Dqa+bZxah6NmFT8dg/pd6RyxWJ5b/2ajPTLP0NiyLR/1V3NWYqIyYEsQUaZk+iIC2AB
 J32OYfkKcvKCJ+sW7b4IpcTkPeoe9wTlreE0JG9Ue6lEUWwb3DdfOG7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff7b1f9-5ed0-4b37-eedc-08ddb8eb9934
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S09YelFkUEt5YndJeDFnVEFoY1V5YVg3QzhsUWxQaXY5VVFyMkpBbVN2SUUw?=
 =?utf-8?B?b0RwbE83VzdnL0oyYkhicUFjTGtOaE9jUVU4QzBNTmxIUDUveWxXZHZHR3JQ?=
 =?utf-8?B?eHM1ZDhWMkpXSU9XL0JvNGtqV0dMRC9FbTR0bk16NUlCWUZXaysvTVkwbHBP?=
 =?utf-8?B?YmVvOFZkdzJUd0szbExicG5qZVlqbE9MUFV0OWNZRFBjbmFxYlBlbldVbys0?=
 =?utf-8?B?aXJEN3p6Qzd0Sm1DYXhtRTgxWHVKSXZ6L1YwZnBjZk8ybEV3QjN6UGJUMzUv?=
 =?utf-8?B?dWdiWkViQU9wOFFpYnFzKzgrVUI4NGd0K3RvZ2J6QTFXTGMwejB2VHMyVEZ0?=
 =?utf-8?B?NmpnM0YyMGJibFluNS8wUVVhL2xycXc4bW56NFB5V2VDTis2RjlTU3BkUFBF?=
 =?utf-8?B?RTgwNWJpNk56Ulk1N1FIQ21ySVd4d3NxZWplTE03dFZKanBxOHlWcjJTUUhl?=
 =?utf-8?B?LzJmRGpkTWtabDFXMWQ0SjRVdGUwWEhzdlRaZzFYRnl1SVozVzJJOGR0a1hs?=
 =?utf-8?B?MHNRb1YwRExySEJBb0lGRDMrMGZSajFJQXhwRGsydUViOWxkWXdhOXlmQmR6?=
 =?utf-8?B?Mng3SlhDMWVJUnU4YUlwbmF6VEtkMGZnQ2hrWTJKMWQrN3RuSURsaTJ0Ukht?=
 =?utf-8?B?OFNCSG41K0s5N0YvTzVkZGhwSkV2dHdtelNtUExWRGNKczZuM0I4YXRWSTlI?=
 =?utf-8?B?dlI1UUZaTDVJZ2NOTjRpMDlldVk3eERZN3pLL0dENEFHZkhrOHBoQ2w4dnVO?=
 =?utf-8?B?QWlib2Y3R1h4MUhIU3J0Um02YXZCZTU4TTk5WkxIZ0lEV0QyK090NGN4MDk5?=
 =?utf-8?B?cFppZlQ1RnVxR0Z6M2ZyN1BiT2pjL1VOUFNEaFZ5T01QcXdXYXZsR2lFaFl0?=
 =?utf-8?B?Z3dyTG1udFJ4M1FIb1dFeVNVL3NMZTR3N3o1UUVxOC9HM2J2Tlo3ZXFpd2FP?=
 =?utf-8?B?OVp5ZU5UQ284NmptT0tTSnJXUHhYTEp0VitEQlMzekVDM3FiT2grN0JWZGpY?=
 =?utf-8?B?MGZ4Nkc3L2V0TEZxQ0tLN3BaN1pwTFVnUkRya3FBN2t5c1ZRVGp6MXAwUmZD?=
 =?utf-8?B?azR4OGhHa3BtU1cremo3cG1PZllaekFHR25YWUN6S0NXWGlZenZ0Y09tRmtn?=
 =?utf-8?B?NmtBckFFSUpQOG5LSUxndXV4NGRzTkQ4QzdlSVRBZGRqSXpKb05CRlFoNDMy?=
 =?utf-8?B?RG9Nazh1VzRaWUVQQURpbDdSdGN1c0dNR2Z5Ry83SE9meUhOeEY2S1NUSU9P?=
 =?utf-8?B?NkxUT1NrZHZqckFWS2xGREhWeWNzZDlneGF6OUpmS2U5UlNtVkNzQzFIMldV?=
 =?utf-8?B?enZWM3ZmWWN0V25vZ1hQVnA0a3V1elQrZmJWMDFhTWhZa2hGNWJLSWdHQWJQ?=
 =?utf-8?B?Yko2cTBtTlk2N0lkNUt0Y3dHck41M3FqdlFYN2F3K3N0L1JLamduam9uNm1y?=
 =?utf-8?B?NHdCUGRhUEJ0ajlBalVxUkI3Vy83cTdnVFNuVWMwYjhQWHdxR2d4cWdib3Ry?=
 =?utf-8?B?ZXFYVFQzRjh0emVMTjlSek45Q3ZkbG1TRUFBeTZKWEg5anZWZDNIbTB3L25x?=
 =?utf-8?B?VGFKWWNqRkVvRFJnbzhzT2FxMHVIVFhXQmlacHNTbWtReXVEblRiWnpZQ0Jh?=
 =?utf-8?B?Mjk1ZTJBeTU3dWpBanhDOUJjR05iak5tRnR0aGhDTkhXNFJlZmNlYTdYd2RL?=
 =?utf-8?B?T1FnclpzWlZwVmsxQzByd0kxc3BRMFNRaWgreG90ZSs1L3ZLRW5wcHoxNmh5?=
 =?utf-8?B?b05ZVnBGeiswMldoN2tMUW1ZY1lEeGlBaEhhN1h1elFHZkJTMHFzMEI0aXNs?=
 =?utf-8?B?UUt5REVhTGdMWXg5RitIa0g1azMwZkFzbnVzbHlIWExyMVg5VlhJTmcwd2s5?=
 =?utf-8?B?UFI2N0xPeWpCd2lYM0g1Njk4L0ZJVS8yMXBSZnExNkxBSmFYYktnVjBhaUhV?=
 =?utf-8?B?Q0JwWlY5VWJiQUlxdTlPMW5qWWcrSUZ6VDJ3aHNkOHlGSUl2dStGZTl6NFdt?=
 =?utf-8?Q?T9vHOdQ+bdZ+MGr2icnCKqwoZz6wK8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aDNWNHpLV0R4TjFVQjFxL3Y5eWc3Ymx2Q21iSFY4T0NjM2pTRjJibzNPOGNB?=
 =?utf-8?B?dWM2ZnQ3RTBYRTk3L2VmQ2hLSXhuZzFYVTFkRER0eHVUVjBkQlZlM0pMSGxU?=
 =?utf-8?B?dGpMZ1BMVWYwK2lEM3BZSklzWUVxYWZJOTBiektlVEorcE9DQXBnaEI3RWR4?=
 =?utf-8?B?dENRZDl2SUlyL2NEMnpxVWRWb0xBck1sdVRxZ2FGV1l6b3o1azFYU2xVZ0Yy?=
 =?utf-8?B?emxNSzNrdHBwNkRkQ2dvcVV4RHJQa2ZoZ2g1Sm54aUl4b25uWmlReC9KTkJM?=
 =?utf-8?B?ZWhmOUJJMHduT3drRytNVmZ2U1haVzYwcTVyRlp5a3ZHNDMvRjhUTjR5KzlM?=
 =?utf-8?B?aGcvTTZTdkxjTTF5WGcwY0Z6UW9QK1Q5czJ1YVRCOFBGMnptU2srMWRLcUxo?=
 =?utf-8?B?MlhzQno0dk1ZZm1xREY4emJhampqRFpKK0NBeVBuTk54enAzZ2J3SkxsU1p3?=
 =?utf-8?B?dURVd1ROeHBHbXpwdERsVmp5QUx5ZUExdDJ2UkxKNElLLzFQUktQWnhIYU1Q?=
 =?utf-8?B?ay9pcGRUY2NhbGpwL3pCS2tySUt0aG4wU2pMUXNUc2gzOTdJOUhlOVZjM01O?=
 =?utf-8?B?eVMraVdjZmZBRENIY1VBOVBWUmtlTlJtQWFlYUJFNzNwS0Z6WlhMbjY0K0dx?=
 =?utf-8?B?T3JKYlJNVGg2UytSWFhvYmhjRUNvYUpKY0JZSVl0aDBOU01LNklGKytpbmlI?=
 =?utf-8?B?MXpyUWluTzhLRTUvdm81bVV0czBOVGlHaGM1eVkrdFBLeUY3ODNxOUxTZzdI?=
 =?utf-8?B?Ri9UWmtNU2ZXTHlrNkZWc250bXFMWDIzZU5JU2xlRWViTGw1cTFCZUcxN0ZH?=
 =?utf-8?B?ZGNpTFRyRjFTVWRLZVBkZ29hUWRhcFVKSlBEb1NhaWZDb3pkcU4xVW9UczN1?=
 =?utf-8?B?YnozU2NGeldFN0F1bXJoUlp3SnRya0Vsd201cXI5Tmd0SzdhUVJVMjV1b3cy?=
 =?utf-8?B?eS93QnVuV2MxRU1DQkRWYkxGVVdpRUJKUkVWMDl5YXY1S3F1eFl0T3VFVHV0?=
 =?utf-8?B?ZmFkT0puZnJyOHJvMUY5Ni85akdqdlE3VnQzQUxoRVVTV2N5alZDNDEweXZi?=
 =?utf-8?B?LzlUK28wMXNLVE1HRXVUTkJYL042c3hmRXFQOTJkWldSaTY4QWwyNGJXd3Va?=
 =?utf-8?B?NVkrcmxCRDRjNXNOeGdrb1Nuek1aREdpUDhqZ2thWll1Zzh4Zm5HdXFkSGpy?=
 =?utf-8?B?ZWpjVUNYczc4RkdQTHdudzRpVUhNeVBzWllMNDlqZ1pVT2dWR2Z1bEVDbWxS?=
 =?utf-8?B?KzM4RWpiZGx1dkd6cmdpU0dNWnh2a1R3c0xsd2llWGc5amRCdWxsaXo2WkEy?=
 =?utf-8?B?ZVZLUzQxZ2g3T1RDK1pnWFdVMnlOUThlQTZtSVI4ZWwvd3VSRDEwWkdIcERw?=
 =?utf-8?B?NjdnTjc3b1Bib3plVUYvdndtNEpTRWtvMUVKYmRjRHBERjk5R0ZPaXlOTjdH?=
 =?utf-8?B?b2oyYVhqTmN5dTdYYzlHNEZ0cmlmQ09EQUd5UDFVWkg5YkswdWdtYzBYNUlM?=
 =?utf-8?B?TEVLMXpVaGp6OVVsbUx2Qk9JL1d2L04wWTNBY2wxOVZTL0tCSHB3Q20yQ2wz?=
 =?utf-8?B?QzN5TWNpbjhxNzUrOG5FK2RjMG9CVnpzRWdQd0JwRVYxMi9PSWRLL05ETGpW?=
 =?utf-8?B?RVRyd3dRNGZNVGhTTDd1bytWYnE0QzJEWUFjOXVBVkJ5UFRCMnUySDA0dmkr?=
 =?utf-8?B?Nzk3K3VtSDVLNkNzeUJMMk85N2hNMk1XNFBwcHhhb3RPN2ZzQXBiR1NRQnZQ?=
 =?utf-8?B?L084SytqR1haM3h0aEtMK0FXWHFCZFZRcHlJem91MGJhQWNoY2Z0SHF5S1FD?=
 =?utf-8?B?cFNPbnIyZFVJMVdyRitqNkRkajNpZ2VvYTRObDJsZytMVTZGK2dQL2xvSjhV?=
 =?utf-8?B?ZU9jSkozMmlVWFUvWUJubEpPMk5OVUVTL0t6dGlzRW84Y0NMR1BCVEVpNllD?=
 =?utf-8?B?TitrTG5yd3M4dTNGQU1Kd282dGxnT0V1Rk9EdlhOSGR4SWR3S0pBZUhIUHBv?=
 =?utf-8?B?YzhTaSs3Y0dIdkxLb2J2K3VBUUZTU1hWSEFYeTgxRFNHK3RhT1VzNlFreFBk?=
 =?utf-8?B?anNJamhKTFFpU0l0R2RQTkgwb3RKSjUwNTlkUlplQWxiNzZ4ZmxINkN4dytS?=
 =?utf-8?Q?zne3A82U8f/N1MoO8am/pPYWh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff7b1f9-5ed0-4b37-eedc-08ddb8eb9934
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:06:58.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jdu1d7HURqtkw9KTBFg88X99N77ak6DG8mqNQQCcTNjv7tojpDKg7K43G23Un30RoBjrtExlT7Tx7RaCULW6gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

this just help verify camera censor work at imx93. onnn,ap1302 have not
upstream yet.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 139 ++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8491eb53120e6..25646364d6953 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -107,6 +107,42 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
+	reg_dvdd_1v2: regulator-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "DVDD_1V2";
+		gpio = <&adp5585_isp 7 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		enable-active-high;
+	};
+
+	reg_vddio_1v8: regulator-vddo {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_1V8";
+		gpio = <&adp5585_isp 6 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
+	reg_avdd_2v8: regulator-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_2V8";
+		gpio = <&adp5585_isp 8 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		enable-active-high;
+	};
+
+	reg_hmisc_vddio: regulator-hmisc-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "HMISC_VDDIO_1V8";
+		gpio = <&adp5585_isp 10 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
 	backlight_lvds: backlight-lvds {
 		compatible = "pwm-backlight";
 		pwms = <&adp5585 0 100000 0>;
@@ -201,6 +237,10 @@ &cm33 {
 	status = "okay";
 };
 
+&dphy_rx {
+	status = "okay";
+};
+
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -256,6 +296,23 @@ &flexcan2 {
 	status = "okay";
 };
 
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			isi_in: endpoint {
+				remote-endpoint = <&mipi_csi_out>;
+			};
+		};
+	};
+};
+
 &lpi2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -409,6 +466,57 @@ adp5585_isp: io-expander@34 {
 		#pwm-cells = <3>;
 	};
 
+	ap1302: ap1302_mipi@3c {
+		compatible = "onnn,ap1302";
+		reg = <0x3c>;
+		clocks = <&clk IMX93_CLK_24M>;
+		reset-gpios   = <&adp5585 0 GPIO_ACTIVE_LOW>;
+		isp_en-gpios  = <&adp5585_isp 2 GPIO_ACTIVE_HIGH>;
+		orientation = <2>;
+		rotation = <0>;
+		DVDD-supply   = <&reg_dvdd_1v2>;
+		VDDIO_HMISC-supply  = <&reg_hmisc_vddio>;
+		VDDIO_SMISC-supply   = <&reg_hmisc_vddio>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+
+			port@2 {
+				reg = <2>;
+
+				isp_out: endpoint {
+					remote-endpoint = <&mipi_csi_in>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+
+		sensors {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			onnn,model = "onnn,ar0144";
+
+			sensor@0 {
+				reg = <0>;
+
+				vdd-supply = <&reg_dvdd_1v2>;
+				vddio-supply = <&reg_vddio_1v8>;
+				vaa-supply = <&reg_avdd_2v8>;
+			};
+		};
+	};
+
 	ptn5110: tcpc@50 {
 		compatible = "nxp,ptn5110", "tcpci";
 		reg = <0x50>;
@@ -495,6 +603,10 @@ &lpuart5 {
 	status = "okay";
 };
 
+&media_blk_ctrl {
+	status = "okay";
+};
+
 &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>;
@@ -505,6 +617,33 @@ &micfil {
 	status = "okay";
 };
 
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi_in: endpoint {
+				remote-endpoint = <&isp_out>;
+				data-lanes = <1 2>;
+				clock-lanes = <0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi_out: endpoint {
+				remote-endpoint = <&isi_in>;
+			};
+		};
+	};
+};
+
 &mu1 {
 	status = "okay";
 };

-- 
2.34.1


