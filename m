Return-Path: <linux-media+bounces-40657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06799B305A4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357D117650E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E4A2EA475;
	Thu, 21 Aug 2025 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JvFSkWSY"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7426A09F;
	Thu, 21 Aug 2025 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807377; cv=fail; b=gjjUokD4MW7AewnfJKy+MDtTX7QhXAGQQ8uomC7+BFodK6iMdx0Bts6uAFnhIfEYsi4boLPwX1giDF/d8d/huWBToztNitOzu8r1Qo9ymF/AqvUK7oL+GAWjmX7R7Yg2owpcgpW7h6JUjxVjVq0xdwVYktI9yJqqxfobyxfSsK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807377; c=relaxed/simple;
	bh=q7Jvs2EN3t/l6UXEPaNVwoXg5HqJCZIE4OJFnrsBk20=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Bk8ewaOWrsQI1cyjBlfQbLGVu4JL+E/H9EnYJDNETvFoYGGY3CxXHNi6Z00j8tUt3YYzuLaznVYtTjrCJ6mY1M3rg4FL+YsemPTdXC6W8QIEOyu0MxSvmTg40aSzY/RhSEFw5/Py+Ff9Tpx6nW2hhA46H7Rv2NLvMurd289padI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JvFSkWSY; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbcmgJLr+5PZ8WaptSwUlBiZZfhOzt1OTlq1nqXz1vgLkGxhqGMHmMxgJnU/ZU6aY8hgQyLY7sVskwW2wL2Ith7oalv04NMSU0WyUnfGDET7dyfNnCpWpYCviqZJt2L71f13bom7qoZshODQMU33BZ7BZthnJ8HLmnMtEU0QKBd1iFMsnF3RFE16bpfzekqpLs3uAW1YC9TdmSHb0ALulGUzdmsXB3W03w1TCeHycyvs+Iy789Q5XCpkdmQyV5TTXtCVfrtzo+yoNKv++Egp1d7OxTzGHPVUVM3zE+042J1Oidg5L1DriWQodpLm0sbArZBn1Jn1MU3w0fEMLpmsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlz3chFHBOFTr/RgbiC7pxggip52D9SCkMXHpZXcpjQ=;
 b=I64VTtb+DNO/5tBy4yUuAEbbJNLJW7bJIxWhCqZjSV+Dy/1LVNojHNRtNxx53CSm9Mt9zLTkqg+tbgAa0qOwlYOEZTo8vkMMWtdJvXGVoPo3SVOcNGdcKy0fb+USb2WWRuafVmpjNUjMN5MwDIlMrVNmjv2vPRVXvRtComZiL3OcafT/6xWwKxNtf7jKZSw4UE1wlaGlnF+co1FAA1Pz5QHB+6jwqhqpRKxt1deEquvKpEFfPpIxeU5iMjE4l+BJi/Y92Qy5/f3z3ZJEnO569IA8ldsU/Km7OtLH0oRMO2zQ+VgkHnTZRSnyDpeKZJ8zkR2Dt9BPWmwZ/RsJM/6XrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlz3chFHBOFTr/RgbiC7pxggip52D9SCkMXHpZXcpjQ=;
 b=JvFSkWSYJjgBAW3FqsOdW3eXzy02NnWaUeLFoSsYIkUyRnrvRDFVybUeL6SosG8GTas8K5mVz8ZjECfuEYZ/ENy0SK2Sx1GRNnRGYepzVjTKj0g7uSIZ5GVVzJaBCoH+xVXARQYbnki+yPV7amwtrEherZwftbW4XK4/ORyRbM/9jTfXS5LnuL+qvnn0MhF48aHbDZdNUjCrubwmKMTYNgppng1FlPYJDq3xNw3R5M6K6AfVrq5tOJM0GG9k6E3ezHAL0YieK7crmaMRlt6c5hR05PDik+Hi3EbjlwrN+tjwgKql3hIo6b4QMxQKl3YYqMyq1konbuNcgUQTCDSAsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 00/31] media: add imx93 mipi/controller csi support
Date: Thu, 21 Aug 2025 16:15:35 -0400
Message-Id: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGh+p2gC/0WMQQ6DIBQFr2L+ujQfVJCueo+maQCxslAMNMTGe
 PeiTetyXt7MAtEGZyNcigWCTS46P2YoTwWYXo1PS1ybGRiyGjlyIuuHUQPRojIoK9XSTkM+T8F
 2bt5Dt3vm3sWXD++9m+i2fhMC6S+RKEFiaiqYVrpshL6O83Q2foAtkNghNdj8JZalSjPZKS6pV
 OKQ1nX9AKiQ+iXPAAAA
X-Change-ID: 20250606-95_cam-b74c094ad1fb
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
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, 
 Luis Oliveira <lolivei@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=5178;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=q7Jvs2EN3t/l6UXEPaNVwoXg5HqJCZIE4OJFnrsBk20=;
 b=ZSYoEdDn91JexL8ffb8KCZbxOLIrbNk4caERxSLshuJNu1+OlUNhDBqH63DB3NXcl1Zhifpzn
 k7HkYwqm1CSBbbXA85ppyII7JfSvQNLSEj43xxz/JVmpmubiA6jyzmJ
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a96f8a4-f27d-4000-019a-08dde0ef90ab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?c2U0Ni8yNjhReU0wM3p6WktpZnpPVzNBZkd6N2dJWk03VVE1N0lCdHA4Qmtn?=
 =?utf-8?B?M2N5alhJazRlL3pTcnBlSHcya0F1QWMwLy91UFZYSTNxTURZSFV4Um9lc0di?=
 =?utf-8?B?Z1VDbW5TVHQ3Z0RuSW52RGNMYmFqeUFqV25Cb0t2VzVBa2xwcGFUaFhEbm1a?=
 =?utf-8?B?UmpEZGc2YXNCclZWdWpuenA0aXNxZy9ybXV5cW1XZ29hUzg2SXROUUhUekNv?=
 =?utf-8?B?OEdLekNlSlJUUERvWnNJYmtXUklDRzBXNmg4SjBERTFyVUhDTVZBbFRiK2FI?=
 =?utf-8?B?R0dIWjBaUlBWazd2MTZJUElSbkhDOE5BdG5OakNaVGlYZ0ZKWG5vSEFHODQ0?=
 =?utf-8?B?NS9wNUlzREs0S2FqTzh6ZWRYYmtaS2x3TE43eldqcGloazUxOEJtdThqamIr?=
 =?utf-8?B?SkUrTndLc3IwMGxwUm5FTkhrYzdaZUg5MnRqMXdpMFNEZDV6NC9BWUdrRmRK?=
 =?utf-8?B?ZUNUYTR3ZHZGUE5yQnVJNHA0V3RlUWlDS1NEbmpEbmZKYTN4VktPOGIwYnJB?=
 =?utf-8?B?RGUzNDZYYmwzRWRqKzlmV2EwK2FYSHkySXZpNUdmZFpUaUEwc1Q1UEViNnJj?=
 =?utf-8?B?NGxEWS9IeFZqekJHUDQ0czQ5aHhvbGNwMy8vcUQ2VnBWYk5LLzVKYkVlY3Iv?=
 =?utf-8?B?WGx2K0JqOEJEOVpsRmREM0ZYS25WZjNtR29zbGZmaXpnclBuRFVCRFh2SS9x?=
 =?utf-8?B?Q0tMMmlMcTRUa0UwbFpqc1B6NklGVzJXWGJNaHlwcm1SSGFxNHdaTldRUmIy?=
 =?utf-8?B?aGE1YmEwNmxHV0UrMCtNV0xTdTEyOUQ0Z1BoQ3Z6c3BxRkJua21KZGZrWHRt?=
 =?utf-8?B?d29iK3RqVGYxYi9pTnIrLzhZNHBocWMzK1o3R1RkWWUraWpxV0hjQ1NaOUl0?=
 =?utf-8?B?OGpURFd3MUhob2NuY0t5czNZMktZaDN5b0MyMzNrVThSOEk5dHRodWkrRE9K?=
 =?utf-8?B?ZTFwYUZmSjZWcUNnSTIxRyszZVp5cU5XQ1VBS1VzTjlyRVhvODBiR1l0N09r?=
 =?utf-8?B?S1UyQ2M3WXpHalZQUU81VDB6WTJMT2JFN3UxRjBHOW9DdzcvblRZaHRsVVVJ?=
 =?utf-8?B?VUI3cDRsM09aZXdQSTFVMWUzNXUrSFExNDBTS1dVUm8wT0xWaUl5QmZNME1u?=
 =?utf-8?B?VkM0ZEw1Y2MwSENDZklWaVBSUFNXS082Vy9WM2tsZ0dQZzlRa010YUhYUmJ3?=
 =?utf-8?B?YWd3MWs5T0tBVVRqcW02NjBJYUczOGVnRWpSb0djcXc2dE00QnprSlJwL1lK?=
 =?utf-8?B?ekJJSFFMVWY4Vm90L016RGZXbjlPaWxpeXdDVk03d0x1RVpqTDRZSjE3bVZL?=
 =?utf-8?B?MWdaTTNlYWxiM0J3RytWcnNvaks2bkpZL1U1NDlpQk1LRHRiQnBzckRSZ3BU?=
 =?utf-8?B?eDlHT2VPb3NDZUo0QTVmQ0NSMGJKVllnTHNZT0dERTBBQndFK1hRRCttNXE0?=
 =?utf-8?B?QzI0VnZXU2t4Ri9VZ3c4RVpyQWJLSVZHWGFOQzNoOFN0YklCL3JadmNKVmJh?=
 =?utf-8?B?UFBBa0U2Z2Y4OWR4ZWJmQTlmVHNrWTRwKzZlcThIbnNxWmVyRG91bFFqSXJL?=
 =?utf-8?B?SVZFYzh3ZWJuTVVqTmFUWlRjQUFGbWdaelB2NVNTbUYyQUs5NXlxOVYwT3pY?=
 =?utf-8?B?dm9DRWlQRzU5bVIwNTkrb1A2NjNkWDZKZ0JReWQ5VkJOa2lDM1p4MVFYczZ1?=
 =?utf-8?B?NGRKNG1pRVVHWFBMQzFOa1ZQZC96cmNiVzQ2eWtBNVNNME1Xd0FXYlpsbGRH?=
 =?utf-8?B?ZE55YXE3M2l6ekh1eGVXVVAvc3lndTF2OVE5bGhpVyswSzlGTzIrb1Byc1Ix?=
 =?utf-8?B?bDR3LytlRUlGZWNjTGtDcmJRT2JBNGluMzFIbUxvcmhrc1RpOVgxU2JtMC8w?=
 =?utf-8?B?QWhMS2pQdE5mbmZHbTNzdUM0NkVuU1UwVzRtSmZJZkswRWxxT0swcFNEWGxF?=
 =?utf-8?B?MzkwSEpNcFZYdURWRXRUeGN3bU15YmlNQ0Z0RE1RZ2wzcjM4K3dqeXdyNk50?=
 =?utf-8?B?WXh2eEZpa0xraWovbWw0ZEpmMHM3YXNKRHZBU0pnVzhjdXFiV3lFaEpRMTFw?=
 =?utf-8?Q?w4Coa5?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?czc0YXNXWHZwNFFSblJRSVBaZCtTV080RnlSRlNBNkQySndRb0dLVlo1OWx4?=
 =?utf-8?B?K2dWY0xxd1NMSzNrOVhHMzRUenF4Wm9sYjFlVDd0QkVoVmlwK2FoNGhkdFdP?=
 =?utf-8?B?cHVrVEZiSmZPdWxmeU9KV0RhQ0YwQ2Q2RkdmNHpNbzIrRjJxVmhiNzBleERG?=
 =?utf-8?B?cmRFN2o0cGUzL3VubGhQajNtdk1IemdrN1cvQXFFTHBHVkFuejZaa2JVY21X?=
 =?utf-8?B?bDdOUTNUMTdwM3ozM2YyRWxYR3IyMWJSYk9zVHM5NG8yblRIS2d5d0FNWG9N?=
 =?utf-8?B?RFJqeGN4aEIwV1hYQWhhb05MT0FXdk5STHhYUjN4NWVNK3Q1eFFIRkhzdDFW?=
 =?utf-8?B?aVoxNkt2QVVzQlhOSTR3NmEwYlVqTWY4TU9EeE43MXh3bjRKSm5oQ3RiK3BL?=
 =?utf-8?B?NHNkS2F4djZTVVpSMExQTFJQN3FZaG00czgzWC95TDRZVXR4NWFPRmtmS3ZF?=
 =?utf-8?B?cWZVQ3dBZGxmNDFVWXZaV1VQNFZma1pJZmRCc0JRTkFwZUl0bE9YNk9zZVlZ?=
 =?utf-8?B?WFVPRVFEeE1oSGJXRTFXNWxwQnY1cjNySWlmSFpsWmNRTjBmeFFiR0taS28z?=
 =?utf-8?B?OUdBRTUzRG9ZTWFBb1BjMzZFQ3VJYWlOOW9qSmZMYWZWZHpxVWl1WHo0Ykwr?=
 =?utf-8?B?OGladXVXS3czS0w2NnhZL1JoTDNTbS9hOExOcmRIV0hWUUtDRlVHVmlFTVdN?=
 =?utf-8?B?VnhvMWlocHFsd2JKdVpGcTJSRTVwZUxFdzJlY0NSWGxqQVFYWUl2QmdKNjQ3?=
 =?utf-8?B?anBJMGthMzVndWR4MDBKWGE1UzV0bklCNEx1aUtRaXFoeWVMZG9waTRZcWFS?=
 =?utf-8?B?VzZNL243Y2VSYVc0TDVmWm1kY3lHUWJLRW9YcXdaaFI1NVdlbWxRWWkrUGV2?=
 =?utf-8?B?WXlpWWs4VkRTaUQ5MUdvZ2svUmcvZWIyc2s1aUhSbHlDTmk4MDFPelhWbVhs?=
 =?utf-8?B?SlNndGZUWlo2RnpoOWVUZUpjWVhqOHJIWlpKbDM0dlkya2djaVZYMVFwK1BF?=
 =?utf-8?B?a3lzaHJsMkZqc1ZWTDNWNWR2WFFLY2g0czB0N3ZTUE1IOXc2bUYyZ09SWDJk?=
 =?utf-8?B?YlBibEVnUnJwVGN3NXlGSE9weDRsZWlXYXJsTEt4Uko2OXZmc2ZrenVVN0cx?=
 =?utf-8?B?SzJ5SHQ4WEtYSFVJRVYyYWJhSEhJdko3RjZocGdpdTBkb0p3RklLVlZYdlll?=
 =?utf-8?B?TzhXdDhEdHdCTmcySWhTUWUwK1owdDdhRzh4VWhYNmo1am4vSTdmOXlLdU1Y?=
 =?utf-8?B?bUVKUnkwMFRMR1diVllvMjVyV3R0Y1JjT0pBd0NLcHRzM3hnYlhnMkdodjJF?=
 =?utf-8?B?RU9iK2NJVUhoVXMvL0hiY1Zkd1dqNzhHblRvemJzUm9IcEMyMVYvV1J5ZnY4?=
 =?utf-8?B?dURMUW1ESVpLMFN0TmVYRTVseFppOHBsdk5DRmtjTEFhMjBrYUxBNDlWS1FW?=
 =?utf-8?B?S2k3c2lld1E1TzlzQjJMRHkySFNiMWdnblc4aGRaaDErd3VGa1VGeHBHOHJI?=
 =?utf-8?B?YmNwSUZ6VHFqWTlmS1BNWDVvSUhLTjJ5TTVWSGpXMVcyaTBrYlRLSXdJQXJa?=
 =?utf-8?B?c3R6emZGZ3lwaWNPY2JETzZsOHljNlZ6NHU5cTZ4VmlwKzB2R2FzL3oyZEdM?=
 =?utf-8?B?Q0xLZ1VNd3NTeWxMMEVxMFJ0THFCVjFYaUNIL3N0emNJcE1RNEU0MTJNMElF?=
 =?utf-8?B?N0RUbnJEakpYL3UrWWFpMmc3akRUWFhHUTVzeHZLa1ZTSFMwc09lOXRLUS9T?=
 =?utf-8?B?ZUxUVDJRdXg5R01HOWRTb3dkQllsN0hqYS94MGNOWVBIVHA3MEo2a0syYngv?=
 =?utf-8?B?akdCWDYyT01uNzh6TjZXeFdWZGhqdVFmdUJnNCtjNkJtcUgrbll3SFRLbnBj?=
 =?utf-8?B?SnkxQ09VTkJYMjJ1cDhDODdGWjJncm5YM2dzaVo0cEtPZ2E2VkdJZHE5Wm5y?=
 =?utf-8?B?M0tFTE9lanBCV0hreDFQanBQa210V3RWeWFsck9JQzl5VDVuUDRpMkJXdEI0?=
 =?utf-8?B?OC9acDFoSTlDam5neTlXY1dIS3RIdkJiY1V5T0dVdWRhUUJKNTVxRFQrVExs?=
 =?utf-8?B?dTNoeTFpMnBCdjF2ZnRPMDl2VEJ4ak5uM0h1NmlWYnJPZ2pUR2ozeUluRFlw?=
 =?utf-8?Q?q06oM2u9WH9B/xhOw460FIoHX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a96f8a4-f27d-4000-019a-08dde0ef90ab
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:08.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2geG9m5YESAslvx/ydFh2TwzHAAlnvU5kt1NYO6V6eZSxVCi7aog72CPIzSf9s+zIFLg0Dkw5On2UY/m1HO1ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Totally rewrite CSI part driver compared to V1.

This only includes CSI related patches.

DTS part: see https://lore.kernel.org/imx/20250701-95_cam-v1-6-c5172bab387b@nxp.com/
PHY part: see https://lore.kernel.org/imx/20250701-95_cam-v1-4-c5172bab387b@nxp.com/
AP1302 part: see https://lore.kernel.org/imx/20250701-95_cam-v1-7-c5172bab387b@nxp.com/
	upstream: https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/

First 3 patches add some common helper function to simple code and remove
duplicated code in difference CSI2 drivers.

Clean up stage imx6 old version csi2 driver, and prepare create common
dw csi2 library for difference IP version.

Move stage driver under driver/media/synosis.

Create simple platform driver for common dw csi2 use case.

TODO:
	1. create bus, to probe phy driver under "test_if" interface for
specific phys under CSI2.
	2. support to combine phy, (which connect to both dw CSI and DSI's
test_if). Need use DSI's test_if to config combo phy to switch to RX mode.
and also need config RX part's phy register by use CSI's testif.
	3. move other vendor's csi driver to use this common DWC CSI
library.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- update binding doc
- combine two add helper function's patch to one. and use media_bus_fmt_info
data structure.
- Link to v2: https://lore.kernel.org/r/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com

Changes in v2:
- totally rewrite, see above section
- Link to v1: https://lore.kernel.org/r/20250701-95_cam-v1-0-c5172bab387b@nxp.com

---
Eugen Hristev (1):
      dt-bindings: media: add DW MIPI CSI-2 Host support

Frank Li (30):
      media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
      media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
      media: staging: media: imx6-mipi-csi2: replace space with tab for alignment
      media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
      media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
      media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
      media: staging: media: imx6-mipi-csi2: use guard() to simplify code
      media: staging: media: imx6-mipi-csi2: use register structure to match hardware
      media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
      media: staging: media: imx6-mipi-csi2: move probe part to imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: move sd imx6's specific initialization into imx6-sci2.c
      media: staging: media: imx6-mipi-csi2: move csi2ipu_gasket_init() to imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: move number pad macro define into imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: move dphy init part to imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: use runtime_pm frame to control clks
      media: synopsys: move imx6-mipi-csi2.c to synopsys/mipi-csi2.c
      media: synopsys: csi2: Remove deprecated s_stream and use v4l2_subdev_pad_ops
      media: synopsys: csi2: Add phy interface support
      media: synopsys: csi2: Add basic v150* version register
      media: synopsys: csi2: Add irq support to record error count
      media: synopsys: csi2: Handle alignment requirement for width
      media: synopsys: csi2: Add register prefix to register field definitions
      media: synopsys: csi2: Add need_dphy_reset in config
      media: synopsys: csi2: Add default simple dw_csi2_subdev_init_state
      media: synopsys: csi2: Add v150 lane stop state register bit define
      media: synopsys: csi2: use standard v4l2_subdev_get_fmt() function
      media: synopsys: csi2: Add customize get_frame_desc() callback
      media: synopsys: csi2: Add Image Pixel Interface (IPI) support for v150
      media: synopsys: csi2: Remove source pad connected check at dw_csi2_enable_streams()
      media: synopsys: csi2: Add simple synopsys platform driver

 .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  151 +++
 MAINTAINERS                                        |    1 +
 drivers/media/platform/synopsys/Kconfig            |   20 +
 drivers/media/platform/synopsys/Makefile           |    3 +
 drivers/media/platform/synopsys/mipi-csi2-simple.c |   75 ++
 drivers/media/platform/synopsys/mipi-csi2.c        | 1260 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |  149 +++
 drivers/staging/media/imx/Kconfig                  |    1 +
 drivers/staging/media/imx/Makefile                 |    2 +-
 drivers/staging/media/imx/imx6-csi2.c              |  181 +++
 drivers/staging/media/imx/imx6-mipi-csi2.c         |  846 -------------
 include/media/dw-mipi-csi2.h                       |  120 ++
 include/media/mipi-csi2.h                          |   30 +
 include/media/v4l2-common.h                        |   30 +
 14 files changed, 2022 insertions(+), 847 deletions(-)
---
base-commit: ad0a162e543964443feec3a6a9395a64fe6c35c9
change-id: 20250606-95_cam-b74c094ad1fb

Best regards,
--
Frank Li <Frank.Li@nxp.com>


