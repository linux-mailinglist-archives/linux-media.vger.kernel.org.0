Return-Path: <linux-media+bounces-52531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO6cHaFni2kiUQAAu9opvQ
	(envelope-from <linux-media+bounces-52531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:15:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC611DB9D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8DF930842CB
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE77438A71C;
	Tue, 10 Feb 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dc8cvAMH"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0750387370;
	Tue, 10 Feb 2026 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743572; cv=fail; b=YweDl8HlATJSzcrLkgXkBKCP9bBfG9iYDjpn9V9Gpowimth9kJ4oX3gtADx1a7PSf6Rdx9oVaNWFmdbWimFQQwUFmhj2lElGU/vGJ/I5+nJ0/PWX/aYfOyvzZzQy/HdCHRtjX1VE7TniN6bL1qUlXdQBEgouDIS7Rtl5zxQvc/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743572; c=relaxed/simple;
	bh=4ueeQ4UKtiWsgy7pVP38+O00HOR0aB/HwcJmtQSha64=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HFfnDXb21XC9ytj3xgIXrEhRdL7SUZz99s593q45iQzt3bv1r84AcsJJ0jQR0tyCP4spcM3Gf+O2My40UanpJMsi+y+3btKBbG/QG7vZZHTg4NzxH024E/f6VU1VqgWnopn5pMoYRERrt88Tqk8IrO98QUy3c4YRvDnGCoLo87o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dc8cvAMH; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbyq8/yh9DdE3n7pdOe6meMjN9NDZTGWnFnIZ32eEb/A0v54X17IiRk7KwnfU2GNfKcggp8daVdECqIP7ByovfzgXNB0JOmjuqdB9yp5gMTPGIG/BgGXOIYtPtxalwy5/flAv8ty6JVMVmcLHdKHVjvXGuYy9MaL1ZveqCIajREFO5uan1PtimturQYmPHiZD+SuUIM5XoziQ0oMAupmLYWQP3NqGnW6qsjimKj1SlF3a517TkmGA1Yr+KzRdqhSuDjR7PC4vdVjUev4XBxrzxAvFfDVsmx6q2+dKgEkztmEEPOL1As0Px2mkDxd7tQNqOjzTUFuu+i8+31+WCzfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7bwOYBaShPpdQnqn5rJkyrCzVzEIqRpIToeQ6EOAhU=;
 b=jpj97dfuhAFR9cOWIxUyqghlkPab4kcOrlbkRpgMzXyOhHGnpf+oUwYXK4OxNvvHc1U+FFr6K6GUUCez9P/S7GbT1fdobNFyMCFWsluzhCK4d+nhl/aDmaH+klq+qzPyuqiEm5EBYyl09+6slTt6Y9cqGoS5MMPp/vpASEV1Bz5Q8b4LOpgI37nYmi028KgrVruhPewUxSgi0sO+4trD2I2owUm4JRvV+cdhNKrg3gIZPzxxpRpZ2zoEyLHC51nr9wycJA52Rt8n93MYbF49fV3+vQ0Lzb76ydrDh7n5if2bJZVtlX01AL/aCJhtGjOC7Y6UJW64lBEIRwxYkrRpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7bwOYBaShPpdQnqn5rJkyrCzVzEIqRpIToeQ6EOAhU=;
 b=Dc8cvAMHdSGiF/TE4L/EZe7sbFhtxJxQYXzU4RIQg8hxpuU/oTGP9W4shEQV3ZgjlmIETyXJEaKHrFewZhT2Azi5qbmSgPaApQ69sGX+BTN7HFKaQw3mY0g6WriypEgfCeC4Zfmmx243doiNeB4gLtP3PTi3Y1EpWNJIAKlqeFRQeHZBmPE2ax0I0NyigTtt6i3XKmaL7Gf8XLXvSNFvpNoOROec7AJmaP3rK7y8TNMcg80Ej3YshqZtDDEWrs7BNbhEcxfAFrhNd1odNDrdVRMg3q6vzgZx9F4j1AbPb+sSLZ7WRTS3xtMm6czZCdWqkuCE5blKPLVyl9k4UM0ofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 12:11:10 -0500
Subject: [PATCH 3/6] media: synopsys: implement .get_frame_desc() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx93-dw-csi2-v1-3-69667bb86bfa@nxp.com>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=2135;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4ueeQ4UKtiWsgy7pVP38+O00HOR0aB/HwcJmtQSha64=;
 b=w+5LF2iCtYldUo8l/CuBgkzoauWLfWP7kS237xHHvOfZPaL91HoqQtkNzdcFTsOMjwp9L1Z0s
 rE51/hl417KDG4li9qYIG0gB3Xkps7PuF1cE7oxscg7hJ6tNNltTQfr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: ed79fb4f-9305-4b7a-295c-08de68c77403
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NGxpdmdqVDlwUEdLdnR1aHFLUzgxbkhlMXloVEpMU24rZXUxRVFhU0RzQWRD?=
 =?utf-8?B?cHN0YW9GZWllWGlQelZFSjNYUE50U0ZQL1hWR3FFajBhdFlVYVQzbHd6WGlI?=
 =?utf-8?B?cytxNlQ2b21pTmFLMGlFSS9GV1RLWHdtd04vZHR3c1ZJYnF2UW1pTXBMSUN1?=
 =?utf-8?B?dzBVOG5oUTBRVDhzRzVoMmZWUmc5Y1d6LzE3UVlQTnQ2ekZ5NUtrQnZBY21Q?=
 =?utf-8?B?bnB2bWJ5RGtNSGExclhDU1pqR2Vld0lhNTFuRnRUcEM5cU5FaHBOcVJPVzJy?=
 =?utf-8?B?NTJ1MzFrWEt1R3g5RGNuSDZMcmRQcmZMNU9ITStyVVo5VFdPQW1rVURvd0tU?=
 =?utf-8?B?QUQzK1BXb0pxV0RpeUNKWnRLc2JqRmpXc3hMZENEQTZBTVNOaFNwcklNamE1?=
 =?utf-8?B?NHdJelBvTnZNUFE4VStqSTRKTStRKzgycjJ5a1hXckdqRVo0TWh4Nm9jaWV5?=
 =?utf-8?B?aWdTTSs3akdNV1lRTisyeStkaTA5QUMwdVpQMnhrVDNONU1TZThybHpwZGVS?=
 =?utf-8?B?WWJLdVFhNnVhdHZ6dytFbE5Ob0ZGMGRmWEhRSkduS3VDWHBCdGxsaVZUQ3pl?=
 =?utf-8?B?Y3hXUi8rZlJ5Q0N0WER5VDJNQ3FwV0NpbksyNm85aTArL2Y0aFB2NHZYVklB?=
 =?utf-8?B?QXhUbnY1aFB4MDR3NXhnbjJhNG9uWkdrWTV1b1BCZDZaM0NDSmJmaWRKV09R?=
 =?utf-8?B?bVhkOGx1ZUxyY2w3ckJNMzZCUi8wOVVlRWt3QkxwYnM2bzZxMVhDaDhWMGR5?=
 =?utf-8?B?MHBUaG45WHZFS21NR0RRVFpJZ2NlZTdpbTJ4dGpMRDNsVWJOVGMzN3NWWW5t?=
 =?utf-8?B?Sjd2YnI4SmFRUEdTdzgzcmhMTHltQ3FzSnBIQWVxcFV2cG9RN3F0dnZ5emRU?=
 =?utf-8?B?RzJMWWt0c09CNGlKMGd2L3ZHaGZDQXlQRlIyRFVqQkVJRk1iZjNYM29WM2Nl?=
 =?utf-8?B?VE5GUkQ5STJSMUtLb29MV0M5L0cvUzRFNnd6TTRUckR6cElYNlQ4ekFmNmxX?=
 =?utf-8?B?UmNwUXN6NHlQUkorOHk4b3ptYmZ0N3gvNEtYTFFOUFNsY05qRWF1NnBHQkZl?=
 =?utf-8?B?Sm51ZnZjU2htQlJJL1VnVHhCRHdNRmpRdlc0Qm12anJBTW1GVnpPQ2tjY21T?=
 =?utf-8?B?K0dFQ01SeElYdkJmVGY5NnVjNEtMczdScWhYZkpLWmQ2a1JqeVlDZjdBaG9J?=
 =?utf-8?B?emJ3bVorSjZvK1dFeEJWaUJkWmlKakpWaWdnNUxvdkZ2STRZVlpqQmhncFFj?=
 =?utf-8?B?a3RMdFgzT05oZzhTVE8xbnJyMTkxNElKRmhJaE5LWTIyaHRwNnNZVjVDemNt?=
 =?utf-8?B?NjdNbHZhelRIY1pzZFhuZmI0OVoyWGpPYkVjVjRBVHhrSW4xMTBBUlRFUGhH?=
 =?utf-8?B?MkhNbGJ3TllORVB6akkzaW1TZ1BYbEE1REVPRVY5amhIa0FxbzVmNEhsRzlr?=
 =?utf-8?B?NjhKMEpkU0E3akJVMGs1dGRaQVNZWnh3SExCR01mUjFpemZyeG45UHhsQ3hD?=
 =?utf-8?B?bldYSGZRVUcxcVJVam40MElGSkZHTnFzWkVlMmV1REdnRXdIQ2dibnVaMlU3?=
 =?utf-8?B?OWlSOE5xWlFwZ0M3d1JrSkRLSUlmTmhKWjBIM01FRGRmeHI4ZldKYmhVQ1hH?=
 =?utf-8?B?S09nVUY4MVVHcjAwWno1T2hUZGlGalpoWEc1MFQ3YVQ0MzRtY0UvN1YrRmdC?=
 =?utf-8?B?MkR3dmFSUjdHNWFTUXpaTlNiNHJYQ0pWYUY1R01Vem9DcXU1K25jQ3BjWEdw?=
 =?utf-8?B?M2t3a0JRb1hlbzRjS0xKQTRtcHF2MFUweTJCR0Vac3lwY0F6bk45NFZ4TFpG?=
 =?utf-8?B?S0QzMis0b3lLaEtTS25RVFV3bjRWK3FXWWZOeWVQVExrVEJmMis2LzdacWhx?=
 =?utf-8?B?QmEyQjdqUUVPRmpXdDF6aG1PMzdHZldkUXROZkl0cG1uak94VnFiU3JMRWxY?=
 =?utf-8?B?cTJpOVlYQ3Y3dGJXNkdUQS9oUTJlZWh0dzZ6TzFSNVppRy9tb2Y5a2VoaTdU?=
 =?utf-8?B?T2xGWEtGcDN2OTFTeXBmNUJGdHAyVHVOb3Njak53STBBZEQzNVlaY0dkVVQ4?=
 =?utf-8?B?ejRqTHkxMEpob0xCY2wwZnlkcGxlMnREQ2NiTVdrUDAvcy9CRHl5dDQwY3gy?=
 =?utf-8?B?aE1ZbW5DVENXTGUrYURmMGUyaHhtbWZNS3VtT0gxQ3RLLzliMkdRcGd0WTVL?=
 =?utf-8?Q?QgapZL4+2vUs8Qti5a1rQZ4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MkZHTWtlOXVMWEFsc053R3AweSt3alhCMlBhSFZUcklsdG1UWjNlcEJoK0xi?=
 =?utf-8?B?b1d2OU5DM3JXcm0yZFU2bTVEMVd3ZFlnVnNnUW5VSGUzc3RLdXAzVytReFpi?=
 =?utf-8?B?bzBDU3JPZXpzRjJZcGJ1dDcvaXBMSmdpVmZTZlMxYUdaZTZJK2NuYmovdjVC?=
 =?utf-8?B?a01VdndIYUpDQW1pUG9VQ1FTOWVTNUFjeVlZOFBwWVFTQlVTcXZWQzB0ZnY2?=
 =?utf-8?B?S1huUkplMzRMTlhnMzQ1OExENis5OVNvQmx6V1duUGJhOEtqWExwT3BWUmxt?=
 =?utf-8?B?QVZvR1JnMlJMNzhGM29UNnAyQW9TOEFUdGI0TE8yTGtjcTNkdk1UYjZOV1N6?=
 =?utf-8?B?dHFxbTNwNDZxRzFyK1cybmJ1WXN4YU1XYkphaUpDVVR1cElxOXYvZGRMN1lS?=
 =?utf-8?B?NjU1YldvenFDVWlFM2xmL3d4WTI0SFk5YWFBdkx3bTFhdXhSUkdwb1RiQkFV?=
 =?utf-8?B?WkRFSWtEZTQwZFgvcTJWcGN2WDVQVE5yeUoyMHZyYnFISnljLy9OSG16ZGFp?=
 =?utf-8?B?N0V0SGE1Z21RejdaUHNmcWpLcmVGWlB0Wjhmd0pQK3p6MC9wQmxoRms4aGVr?=
 =?utf-8?B?Vm1DWkcvbDZMVXJVUy9ickpTa3huMGg5dHhwMElOZ0xOdGc1TkVEcmJJOUtQ?=
 =?utf-8?B?ejd4a3FzZEhUZDlDeUl3eVF5aEpaSlVQekdKamthN1BtQUtSTEpqajBKcTZX?=
 =?utf-8?B?Y21VUEVrVlBjODNudFVwSG1CY3hCSUhNejlzRi9mQXJqNGdpWk85ZDMvbE1M?=
 =?utf-8?B?U3Yvcmp5QllPSktHQVRhYzljWmdsdUo2L3BSU2JVbVVHSjVnbWFTY3JLK2pu?=
 =?utf-8?B?Q0NWZExuZTJYVEpid0FSOVlDMERSKzUwWlA2cksxaEFHRElJM0xWMnUvbWlJ?=
 =?utf-8?B?dVB3NTAycG1LRTNkNCtrVEdzM0lCWFYxNUpoRjZOWCt5Qi90Q1FlbHhhM1R4?=
 =?utf-8?B?UlI1dzZWcnYyd1Z4ZklvOFRFb2hnREhuYkU2MExSWFNpSXJzTlFCSmRzSHlh?=
 =?utf-8?B?K2RsL0Q4L296WlZya1R6ei9aY2htR2xiUzVpUGIwMVdnYlViZ0lOKzZXWlNR?=
 =?utf-8?B?SEFUS3hkdlRpS21zVGFNdGsxM2tHSUowOG5CdXNLc2tpRWlQUG9tZkJwRzRr?=
 =?utf-8?B?eEhPeUEzK1JrWXRTUzJPU3BVaFFIQjRVN2xiWktSV2Z3S0N6WHBnU0YxclRW?=
 =?utf-8?B?VUkvSzBYTU8yVmpDTDFkanJKaG5WbnFUMGV0eVZwQTVqSlc5akppb3JNYU1U?=
 =?utf-8?B?ZE1teldod2tCVjEyK201dFpibjAvQ1lHbWpUZkdUa0RQT2ZUWEYzZzQ4Q0t5?=
 =?utf-8?B?QlhRS1lnT24xQmdrbXFyTUhIUTZPWlpmalU3d2NEeVFxRE9jQk1SS1hKQStN?=
 =?utf-8?B?YnRvdzF3Z1VqbnRKaGM0OTVEc1VuMXBtYTZWUE92bFA0KzgxL3NnL1FycUcy?=
 =?utf-8?B?bW9CQ0tTMW1SM3dPYm5aNjV4elB2RWRVL3VyNmVhL0E2Zys4VERCSE1nalFi?=
 =?utf-8?B?VC9Oa293aGY4YUwwT0NiVnhKZVE5ZEZMUEQ3SmFlMUxCOXdkOUp2QkVTOS8v?=
 =?utf-8?B?bm5QcmdEb25MUXJQMGJ5RWdxRzlJMlM2NzJwSTdCY2pJN3VML3MweUFuaktR?=
 =?utf-8?B?MUIrcDB5YzE2QVpqV1BRY0NOQTJxaXpQYllyaXpCZU1MTExaVXh2YUFRVWZS?=
 =?utf-8?B?TGtWSVhmMXpUOVZQOE5lZFZqdmpZN3A1Vk10Wmc4aWZPWlRidFp6T0Zhc3lI?=
 =?utf-8?B?aTh1cVBuQ3NtM1c3aFVHY2ZhczErOUhKTXVLR0Q5OHRMYVJNd1k5NTVKd21F?=
 =?utf-8?B?ZkU1NDVJNUozbDJUYXYwK2xZNnA5QnhlYVAzbVRYRTVuQkpEUlQzNFhmZU9a?=
 =?utf-8?B?MjZoM1VVQ01FdURLNGtVVGV4aHdPc1kyVkFsTm4xb1BvMUg1U1h6Q2pJRCtt?=
 =?utf-8?B?bkMxNUptejY5VzgxZHhsS1VBSFJha1JQTnRFbmxkRlpkTHhaVEk1cStNamtr?=
 =?utf-8?B?dW0yZ2hOMEhQdTlEVEZza1VaZ25TZjhaZVdDaUwrMHhJaHlwdjVDdG83NDUx?=
 =?utf-8?B?SkV5WEx6V1NPU0k1MjUrVzVaSW9hZWF4VlYvOGNXVVlJWk9uek43anZYOVU4?=
 =?utf-8?B?SEFxd25OQjhRV3k5cUNvanlid09vdktSWGJyNTJ3WjQ1NjFUS1ZnQTNRa2lp?=
 =?utf-8?B?a3RkdTNYa0tEUXlxUGNoM3NvMVRWRWFOL0EwSFFpVVNqeXM3Y0plNmdpOVlR?=
 =?utf-8?B?VXdnaWlYYjdlNVlaNllEUXFKaW9kMXdSMlZhc3lMRkF5ak5jNk1EY1hESFNs?=
 =?utf-8?Q?c4DUdAFquuDf41AapD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed79fb4f-9305-4b7a-295c-08de68c77403
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:39.2879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOouLPrAGFhDAVKcak2/j5+xPwh5Gp26qrLR3ZGPIwWdovymjvUn6SNKYLUtm6vG2jF/DFIW30m4JAUrzu9+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52531-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: E6FC611DB9D
X-Rspamd-Action: no action

Implement the .get_frame_desc() callback to fetch information from the
remote endpoint.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 61cd7f491b3d5b8a37707b23ca03ce709b40a79f..4ad4e3b23448affeeaa932a706653818ba4019ba 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -70,6 +70,8 @@ struct dw_mipi_csi2rx_device {
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev sd;
 
+	struct v4l2_subdev *remote_source;
+
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
 };
@@ -431,10 +433,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int
+dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			      struct v4l2_mbus_frame_desc *fd)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+	struct media_pad *remote_pad;
+
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
+		return PTR_ERR(remote_pad);
+	}
+	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
+	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,
@@ -487,6 +510,8 @@ static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	csi2->remote_source = sd;
+
 	return 0;
 }
 

-- 
2.43.0


