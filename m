Return-Path: <linux-media+bounces-58776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIkZOmoK32n3NwAAu9opvQ
	(envelope-from <linux-media+bounces-58776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:47:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5864001C4
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35E6A3050C2B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D922433A014;
	Wed, 15 Apr 2026 03:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QY1Glyb8"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4C34BA50;
	Wed, 15 Apr 2026 03:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224723; cv=fail; b=I2TijD4EAA9ZRy9HztFL91JReS/ntK/G+/4pJ0+qnKKDmb17XmMOMaZPdBfjUK85bFppy/HXOjTsDP+KSHpu8JITytmw/5YGBlEjf4Ppfz4tIwAtJa5oGOHPsQZortRz9HG8kmGGaL7hp34ZIbWqwDwkmsItBeL/SceacD4wKi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224723; c=relaxed/simple;
	bh=PvRxGN/bOsaHmWd24MhEdHNKOF9JiMqrU6U70YOV+5k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KFOcMujvbfmK8x13QIfRe/TAP4hoR/A8pFTLJUrr+96tN6dcNR6WwuCUc11a5JcXHPQQLFQbLZzT6IW8av7utVtyV6UfSDVAHjTwEyFTRMcMrXhsVXqEuUTAe2VcTpaZAisoMqf5voMbTez9iQGqMweQLuYxEZTNHgilD37VUdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QY1Glyb8; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbMF5tlqgC/y7SncC2WuNFEKXc35PUyzP7cdqVVl8R9wbngoatHp1HM+TNxPJwRv8Lzdbh4Y8WO9dWWPLNAPocCDZodREeLqQ2kdx5W8pgPc/1y2uq0q+G15VAd8q4iC8EontNReMfU3PN+LhIPPjQrpZ/PSY5Jq/M/0l+CmNGWynG7/g2+laCyFD6KMfjTbXF8bT0DWRqPj51QnBRy+xKZfk+ehKA6kNEWNdpp3QA/vO2g8xTJh4IVnKo2QIg8vQp1UdLfg+/Cqs4mevR8qlOB+zGWOb+Hvwbkuti7YUNbbvp2thLBjDBpB0wDTnqJ+YELEQA1HdtNo3lPwZNeT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV4Ouw6alnbJ3USQGJVQ3Lv7hA6N+l+mWBI1AUxY9Xg=;
 b=XWRdLJrDMne7Txg7rZXSUG9eqASs1cM1vtTlsPXMnYl5+rjBp0hclsReFypjtn+PwsJwVZJ6VtmSy4U3SF3lLpxLUMAE/QkgHDlOWuiyzaVFw+nivyAWLsD7T6Rl9wnmRT1BVsNRuoF+FyssvfTp50wvaJaLC11gdRwX8LUkFonNBeOei9hKhDbp5Z782Dk6qHRb2XlVrhO770a25urltG6VN3o5RwjzolwATALU5lqNFnhqAtD9omjRJ71rfHihC8cGUTOn25hHDKcj2S5CAtwk4L9pg6O7PrEZcj9t9dgh3GT2KGc0ua0oGXSvmjkXvn30vd0Q78jkZDxHSufr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV4Ouw6alnbJ3USQGJVQ3Lv7hA6N+l+mWBI1AUxY9Xg=;
 b=QY1Glyb8B+x795lrxTPL4ntwOVsnUq9P7wrui0uJqLws00xRr583MyPQomOVwd3ul7/k2W1Q0Dzkk0vCpxc3jzPoU51lPFz5a4yr7cVl4VoAHsI/V1DbZEngvBCsbg8hBn6boDqy9voT1kKDwWHMP5IULeHqOiUsledBWvZerfHINuKZ+u6Mws1AEVCvA9OQmzQYmpYjitJje5QQZJLMw0p79dLgUPnJ74KjwIuZ5dFbLlQYafFAVNr7Af/2/DsNUsL2NaV5/eGEdeQCd2j8u52kmDXnBYamBNq9uTHK939D2IJCL9vOwi/ydpYxqh78LMvXfr0kKEziJdb/HkNTxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:44:59 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:44:59 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 15 Apr 2026 11:46:55 +0800
Subject: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-csi2_imx95-v1-4-7d63f3508719@oss.nxp.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
In-Reply-To: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=1233;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=PvRxGN/bOsaHmWd24MhEdHNKOF9JiMqrU6U70YOV+5k=;
 b=n5IKQb/7Ww6wKS9EwkYlLggQwiCleB0rRmhoV1MJzoaulk7MEf4BRLRqrEcl06HOeEA64ZcIf
 a037eil05/hBLqmlxv3Bmp2Q3Yq7YMsbZ4sow1uGeTiYQ+oljAmz2nr
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e20c44-1022-477c-d471-08de9aa15e3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 IbyUzk2dgXgukFzTEUVGB1fccP8M5lbN1EUdF+AHHig7YIAfzy9qJ1pSM611e1qUreSIchQQfyl7osea4p8FsMy2NWGXBjvliVJ3Aw1sncouGqIfa4HXc2ZE7qRj1se5sqd6NiYmCJwIfoKcEKvDc/vDULE7AuJ4jSfHDE1L3Idp5tS3DBvo80uhEQo/zwGhk6L+wdM4524EfsRXik1gJXXxajjzKduQzn7fTTOxDx6yTnNpUoDmOyVucNxuQUrxnsePFXivUsrp6b2goALFgJLycYKPAahIU7JwsMSD0KQOoe8Aor8q8m0OIkuXPt0JqBkdBAKGApRMqxoHwy5pdR4WhepFdeUX40CAeyB5nUiDTa+sxT1f8dYEwcEQJUj95Z2Uk+Y0HgLdINP3+E6xoxBcq50upwZ8xFe59TgmXJDcCogm0LcGPe5zIY5pBGmsjwwLnOggcyjI2M2zoPBzI6MqFHV/+L7rhK4aT9tEi/ycsHlzMM39Li52IounNahUZoCzZQEHdGheppeRmyhxJshQY743Uf05HG4TI1Y4rbkRsbcIc+6dwVaab4aayN6GFLOAPbDDnpI0ZipAwas5vq5SErgfVRCkPY948e6w5Fb9avnTcljUDG6MHQnU4jY2IvJK1EhmqsKD8xHfMkwj7HWZbUJVT+P8+en8Evi5o3BR3w5+1iBrhjn15EsSo8GunPfU+sY0qdhdNvV0rNBqyUyJ+ZKfm1ahpT6O39ZChz1ci07t/oNvZky7Kvy4avYz0tGheRKQ3ok69yQILExZpggPAYEmYQs/q2oUQ2jOYk4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NGF4MVEva3lpVFMrcUlmc2IwTzE4QWdzUy9hS1BESllqUUtCK0hIbGV5YTEv?=
 =?utf-8?B?bzJJWTdwVmJ2ejhzcXAzcW9aT1NETlVMSm1Qek9UN1I2b1FjSXU2ZGRyQzRG?=
 =?utf-8?B?V0Fma3k4ZHRjcncxQ2JWRjh2bmo0Q2hhYzZWVnE5b05Ea3BBdnluUjNhQlAw?=
 =?utf-8?B?WGNSdXZ3Zkc4a3VnOHlLWE9HWGROMEVkOWVRc0tJdDJ2THFPNEVjd1NYcHR1?=
 =?utf-8?B?UERmV2JXNi9yQjFZTDZybm90dWd5cVFpRGNEUGZnM1JIdTc4UGM3dFU3VWI3?=
 =?utf-8?B?UklmdGJsQmRUUnZ5eUFmOEIxVjdPamdGbEtkck5uSlpqeDB2WGZobVhpVGND?=
 =?utf-8?B?Ti9qS3cwN2ZrYkZDUlMxamkzTVBBeVJPOHY0ckFBenhmZWhKUWdnZ0F0cDJN?=
 =?utf-8?B?ZHRxV1ZRbzF6cS8wNVFGTWdOMnVpcWo5eVhlYTUwTkw1aUFXd29JZEtRV3ZR?=
 =?utf-8?B?T1R0RXJJcGRmQ3BxZ2luYXRsU0VDSDAxYm1wOW1QYlpETlQ3S0FycTJtUTNu?=
 =?utf-8?B?cldyWWYyeElkZU5kRTEzc3pOTEZ5eHkyTFNXeHNlVXFVV3FWUEVEaDFXZXNE?=
 =?utf-8?B?M1ZDS1RYTkRiZW5md1A2OGJNK25PUHhhQ0t5N3VkNldLK3VXckhvY0tqK1ls?=
 =?utf-8?B?NlRSa0RaazV6VWxOdGg5SE9ZbnVoajlNU1FzRnhqcTNDbkdqVytEc1NiaVAv?=
 =?utf-8?B?U1psRVgxSUdVYWNPazNXWHJ6MWhWZHZGQ1VtVmtSeGRLb0pyeFcyZmI4eWth?=
 =?utf-8?B?Z1JHb0xvTnFTcUF3OVhZRFgvUGFsRmMwQi9sZlY2cXFab0NQR3pSQzVDUzhH?=
 =?utf-8?B?R1hSbzdjR25ET0s3dmEyUVdjTjYvMU1qcUtJdk1qNWFsTGloeFdaTW9UUEJN?=
 =?utf-8?B?UDRibXBhZXU2YnBPQ29wOTdRcUZEaUh5WjN3Zm9PcTZmL1hyRWpmcks0bEF4?=
 =?utf-8?B?ZFdHZjV5aDJUbmlzNzdCSUNsUUVsb2tkbVBwcjlaUC9MUEpWNTVNa2hqS241?=
 =?utf-8?B?WlcweE5kU0hTV2pwTGdYcm8vWXhBQm1KZStVUG9SVmlkWlRlTmZzbkFDa2hl?=
 =?utf-8?B?QzBNSG9Td0Qybk1pSmZlN2xVSWlIY1h3TkpiWHc3cWJVSWFzeXFtMVQrbXdT?=
 =?utf-8?B?TzFHVWZOU1dldTRGUWJoSkRKM013UGRiaFlnK29SU1VLb0VVWU5YRjdGU1lH?=
 =?utf-8?B?TWkxSzEvT2pML2VNVDdBc29kYlNScjRLYzRRQ25SclhDSmgyM2pyM21WVWh0?=
 =?utf-8?B?dFo3MWlvWUgycVJzT3BrZXE5bkpiMnlPdFdjdG9BY3hQVElsdWtLY09WUStk?=
 =?utf-8?B?dmVIdXdTS2JQMVp2QkhqNWVFVm5xa0d2NktvTndOeE55Qlh4QXNpaGh1SnAr?=
 =?utf-8?B?SmthcDI2QlJoUWZLcUlSSTFOQWVIZFlQSTJFVmtQY1NPdWE0NmluZ2UrOGJG?=
 =?utf-8?B?SG04VHpqYWJhTjA0cVdhNFNqSDhwYWhPcXEwSjcxSlZVUDFkZWkzV092aHdT?=
 =?utf-8?B?dEo2OFRJSEdnTEZnRTBYT0ptUkRQQ3Baek5sR3VlVWgyMFhtYTN0bHBQUFdn?=
 =?utf-8?B?bDRxbzdNQkdHdnY4RWdiQUgwQmt6S2hFUTBDZ004WktvNWErM1RROXhxemJp?=
 =?utf-8?B?QTdObGpiN3BLREJaeGREYnNsc1B4YkJzeEtXMEM5S3dGZkxxZGVyVlY1SmRZ?=
 =?utf-8?B?Y21TTEVWM2pBaU54YmZOMUdDRUNweTY3c3UyS3hOR0hPZFdPRUNzUFduQ0Ni?=
 =?utf-8?B?RHQ2a1BHOEI2NVRkVUlHT1V2eU0yVzRFMzNYcnRqL3d0bUFZa0N5K05MZlNC?=
 =?utf-8?B?dlQrSmU0RkppNkRtYTZCdklEaW9GUEdFWUMzZTRQalpWY2pYOEU1MUE2Sysr?=
 =?utf-8?B?MW9VdlRTR2Y5MjdPSUR4SVRqMi9TZ01kYXB1SEtnMHpneDJvOUZkMklNUm94?=
 =?utf-8?B?NFRHVW5WS1k5bzUvZG9GM3Y3NE15QWgrdXdweGp6UGk0c1RCdElRajV0Zit5?=
 =?utf-8?B?WGlIU0Q4b2RNT1R4c2dkWGE1Tkx6Q1pNMGlFTEJQQU9KanRGK2tJOXA1b1pu?=
 =?utf-8?B?OWwyaU1MZ3A2S25sU1M3R2E1WnRYUHhFV0s3VTNLQVJlUG1BL0p2eVYyenhp?=
 =?utf-8?B?cmVBZk5PZWM5d2hzWWIzUm5Qd2xVdnI1aWxlMDgzYTkvMEQ4VEtrc29VREN5?=
 =?utf-8?B?bi9PekFYYXhuQkd1aFBGeDlncVNDK0l4SEpXVlRzWVEwSDN6a1cwWGpzSVo1?=
 =?utf-8?B?T25YUWk5UGxDaEZYRzdnUjFnSDRTVy9EZ2FrbUFhQkdWTFhwYUNhMkhjRUpm?=
 =?utf-8?B?OGVzN3ZwV3RDRGlPNlQ3clNnVWFwTGFTcXNWcmdQd2RLZkRZZkd6Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e20c44-1022-477c-d471-08de9aa15e3c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:44:59.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOcCQIeC7t3XCjMFi8tLM42yx2OgFP4OIfjmcnC0MZa+c2W+25CGa10BDJEyaGLoLH6YrMSJVAHhA84eQaTkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58776-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF5864001C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
only difference being the use of IDI (Image Data Interface) instead
of IPI (Image Pixel Interface). The binding constraints are otherwise
the same.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..78371e039e55 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - fsl,imx93-mipi-csi2
+      - fsl,imx95-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -124,7 +125,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx93-mipi-csi2
+            enum:
+              - fsl,imx93-mipi-csi2
+              - fsl,imx95-mipi-csi2
     then:
       properties:
         interrupts:

-- 
2.34.1


