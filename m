Return-Path: <linux-media+bounces-40217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ED0B2B82C
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 05:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED222560A02
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 03:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C80430C34F;
	Tue, 19 Aug 2025 03:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B5IjKgZU"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC827AC4D;
	Tue, 19 Aug 2025 03:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575953; cv=fail; b=OZH+C2b6NW7kk+ZPRL77pNu4yAv8gdTzKlVy3JMerqyDCWwNCueziSCbCtMvod3lpbG3MZvYgZhaQV1HqxREWkMNCNLDLKIHvfdZJa/elm1QgyNoiAy1EtQV3locFxzAX0GXWqz/K27reo1CZA+TzgA1BCp4+kHZI2u3Yee/sX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575953; c=relaxed/simple;
	bh=Lpb7htGkFdNybOjgJujHXOSQ3a3TSezCcwo+sLlxIXI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n+W2CmWeV0tgOCrxKWMeZMGw/aT4r4oCPqiQKzuvRj9rLwqxmmaGwKj9YTozm5nMKnyudJjVP5YBUn1h0+P7l2nBIo05zEfYCvRITCKDecPq5yJgInKhFEcA0dg6PhfdZWERSDckd+gVj2Wx2I97kpemRIol2F+vINNAdOp94gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B5IjKgZU; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIJrxVnhYLrtqkfFvub03GhMHmg1OJLZKqvmtu6bMvmTxPoEVOMGmYPl0G9J2KjK0y+IeZj9aoiGikV0SHPXajbHj0XC6gWI38E2fETsK1gT5gr/3Ik23eGTCoe3QACAJKTtoAxIjSkinzsbe+HiobhHM6s9ChbtkoRFfoBkxM+RYOwA6uHn7nvJHbIlNikeGcnW8fsceKcK7x77yDZv63Qgr9olDMj5CXhQNtCgq1lmYWXoCV6wLGnJYZfaUYWl/q0T3lMX1tUUG1KyK9pSKAUbK1XFQOkUcTNN2Nk0EdaKmk8M62JLsNGV7KuteKzi9DF6cocrGM4E6BY4r/CR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATUZy++b886fUrBFWYiXAL7GC9Jfg/ObaCgxKL7fBQI=;
 b=KAQ2mwqXfBEUVCmjEbHDA2HZIbQmPDDJ1A05RHQw7Z/0BRA2mTvzyvDNmJLsCoUgFWCUbdgdY5Lkm0e8ZqL/FXjbdiddOMBntmmZ3UeisXRXKOUwBtxjYpgkdVK9Jlb8i8b7HnUDgaHMoKEXu+PWQstGUgdK4oubQdoFluRLFtz3Xr7W1B7IbLd7bjnHCHeYHqRLYllwhkucEX9g/RBz5F8TH3HfbnL/W+ilPgtlAIcgzwFB3Mv1y3Ve3zUWiD3AfOpnpRv5eLt/HUYoLIJqmBR1zllPAe6r1WDjzLSv4iklIKYjZzMhmQhDL7AgdOgoKm8BTPDR75dnXUWPKXid2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATUZy++b886fUrBFWYiXAL7GC9Jfg/ObaCgxKL7fBQI=;
 b=B5IjKgZUbyURmIXb5mrDFKaYNBkZKrqcJLbLUbiail4JCPFg1cxWTi1deB7/1sootYQTS+QcDBdor4Of0Sx+lYwueRgCdPce4GQKXdlJCakMhOQg63AKciViKrCukR9TozQi3fbauYTbngMBYNORnDTcqTAsXvNFid1h9hdOhqCJVrx3a2TrC9N/JmE+/GmA8R8pL1NiP+iZxIK1JDjnP8l5AFCe3Jwkw/RJKPNiXMYLi9VOk5uXuxyXl/T+t+flAJYafqy9o1uo78A3gKJemLWdRq2YMT7u1zvVYedfuYd+6Ekbx3u0G0hGx++2bHCxIa6LL6P/Wvknxjw8QVOVWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 03:59:08 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 03:59:08 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 19 Aug 2025 11:58:01 +0800
Subject: [PATCH v4 2/4] media: imx8mq-mipi-csi2: Add output filed in
 csi2_pix_format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-csi2_imx8mq-v4-2-c16b1d8f88a9@nxp.com>
References: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
In-Reply-To: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755575933; l=3105;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Lpb7htGkFdNybOjgJujHXOSQ3a3TSezCcwo+sLlxIXI=;
 b=57T+zVq3nMCThY+cZtkxW05s0NWoA565MySpoUuetn1G6dGit+S6HK63MwGr/BOaJD8CRSahU
 tin3IT+yvUxCQBL7Npyxk5penoG330r83LU+ROSZ1tx8hpmHYp78wEl
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4e465a-7581-42f0-3cd4-08ddded4bf60
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SE1NQUs1Wm5HZ1NzcjJsWnJiKzBid1B6bjV3NzhlaWZuZFNQUDJWeDNsRDE5?=
 =?utf-8?B?bHJNVGNtNTZqMVR6S09rckpmcjFVK1VKc2liTll4dGpGcjhEK0FFaXl1TGJO?=
 =?utf-8?B?ZGdJSVNpZ1FQYXhERnl2UTQrdmRkVWdTeU1hWFlabUR3N0J2RlVQL1dUVFlN?=
 =?utf-8?B?NDBZQndFMFhwQ1Q4N3N6UnpJUWF3ZjZLVGI3ajBhZ09NY2pJbzcxYWU3TnFs?=
 =?utf-8?B?WDJsTmZ0UExmOS9KQ3J4Z3ZSWUlmSnBPUHFJSTB5K3R4VUVLUWxuVnNKMGpW?=
 =?utf-8?B?UmFkYityQTNIWllaMnppaDJUNlhFWWt6NHl3YWxHdk1ZZjlGd1FRbXBkT0Rz?=
 =?utf-8?B?MDJBd0NIc0h5OWllaUFJL0VQK1dQK0Zid1dURjU3YXNTTjdYbThnbFNGa2U4?=
 =?utf-8?B?NW44YzFhVUxJdGRxbmR0MnhKMm9NcmovYzhhUmYya0NDckpOM3gzOWwya2Yy?=
 =?utf-8?B?N05KOUVCMWttUkpCbGplKzlUbXlvRDAzc2J5ZXZaM3NRMHZUMGNlaDh5YTNI?=
 =?utf-8?B?Z25LampGME1taXdNK2xvd1BhUVR5WkNXcUQ3c1FjZ1B5SU5IbUFPTHdQbS9q?=
 =?utf-8?B?ejRmK0ZpdXJGVDA3clA0U1U1ZUluSEFIbDR3ZFN4cTNlcEhIUFdaeDQ4djg3?=
 =?utf-8?B?NG0vaEIvOE8zVU5xSGF0WDl0S3RjaGZSVzAxa2VmWDNBcVV5NnBmQkJBWE1I?=
 =?utf-8?B?MzZzOU1mOXIwS1YrUWpxc2ZwY2JlWFlyaEFyc3gwTWdWQ1RrRHRmb1F5bnhP?=
 =?utf-8?B?a01rdEJsbDJUbkxLMkNNWU5VbjJySmxlQ080ZjFjcU41enN4ejhvdW40SGc2?=
 =?utf-8?B?WVgrVExMaGRqUi9nUEU0RVk5cmsvbnkyZHlEckZ1VTdodGdJQnJCQllucmJI?=
 =?utf-8?B?dDlnTmxqUXRFK0V1eERJSXNDWFJLaGQzU21zSmFxWTdBMmpNVERaeVYrVmFN?=
 =?utf-8?B?NlJ5eGhPVWJWSTJOOGl5Z2VnQ2JSOVRabGVTZGpFNTI1bGZNQUFlT2JXSDdT?=
 =?utf-8?B?TGNtWDRPY3l2MW1aYU1lQ2JheXpUdzFMOGRVbEhza2d4bnpFanlBUUh5Y0VJ?=
 =?utf-8?B?SEhhTWhPOHlCdFZUeXYxTGFsNnJTUHE1Qm03dm5EQUY5RGlsQTRaVlR0NHN0?=
 =?utf-8?B?ZjQyNXNXbG5PM05XTzdDbStEOW52ZDk4YTlVZ1ZKM3NSQnE2c2Z0OXZ1STJI?=
 =?utf-8?B?eHpCMFBIYUd6STE4dVdvVjVOR0lkaWtwWTIxZ1Z1R1o0bXlscVZmOHZrSGtn?=
 =?utf-8?B?QUhWRUxKR2F3QTRONG9jVEhPcGtuQVZuUDdBU04xYlhIY1o0YXpFK1pUTi9r?=
 =?utf-8?B?N0pKTjJNaUttQWxtZXZUYTcvMXdQWksrUWxmZjA4VW1mL2RLYnJuSGFkbnhC?=
 =?utf-8?B?bDlCYlhyazFhZUJDa1pRZWEwcVhvTnpxTnFBMzVsMXg1TlcwTGk1MW1PRUkr?=
 =?utf-8?B?aWpnY0o5bTgwWnNoS1BBOW15ZkxuUW15TlFMUU0zRW5oRVR0dmpXZ2FNNFFv?=
 =?utf-8?B?MHlBbVVZQktiOUFPN2tLdHZkaExMTGNuYmJ3K2JLaTFCSldXSk8rMjFNK0Vr?=
 =?utf-8?B?MEVYbHZwaktwdkUwQVlRMWhNcjYrNWJ5bnhuKzE4TzJha3RUZy9SSHRRNHZT?=
 =?utf-8?B?Z1NSZlNRKzJobVNraGVheXVHSHZSR1YzemppZDVnZ3IxOVI1b1BzdWQ3N01y?=
 =?utf-8?B?aGEyNkVkTXRpWTFYK1RGQzhIYXBmRkhGbUgweE00NzkwOXVheURCcW16OVd5?=
 =?utf-8?B?Rmc4RXFJRmx4Vmd0WDdCQjJBZ1MrT016UWZQRFRIMXpmZlJjQURIRTQxSW5l?=
 =?utf-8?B?dzVFbU9nbzlGU2JUUEtIUkVNb1JSMUdTc2xXVnMzWkVyMVBpdFlraVdtYS9L?=
 =?utf-8?B?UE9hQk94VEprNEU1Q1N1Uk8ybjB6QnlFNVUvNks3b3F6UUxWKzhNWlp5NWxo?=
 =?utf-8?B?cFV0cStqeStiNVpxMmUrYkI2Qkp5bkUrTzMvS3M5SFUwb2RZTmxWd2J5TjNi?=
 =?utf-8?B?UEtqc0RkTlpRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bUdyTHNiNmRXQ0pWZUpGYnlCMGdxd1NkV1VLaUdhbHFlUXlJMlJxNm9ZMzJB?=
 =?utf-8?B?NW0xS09KNWU1SVppMkdkK0ZORXR0WmxIWE4xUHYyNmhTZmtpUjl4U1dkSEFr?=
 =?utf-8?B?d1RWVmJCZ2E4RTZrVzQzcm0zZ0ZyY1d2ZXdvMFdWamNhQUFGVWYrck1qMXA4?=
 =?utf-8?B?VVZCZlBzeXVhUXZ0ejA0dG9jaWtncTFJM1dzOU1ZY3gzNVJLbmQ2a1ZwSVBa?=
 =?utf-8?B?UGdpbXM1ZXBhdGR4MytmcTkyQkU0QWhMT21pNGYrdzU2eENMTXdPU0RucU9J?=
 =?utf-8?B?Tml0amNNL1lmTXdzelEvTzNsd0tEWHUvODF2TGNheENCRlZKeW1WZEkwMnN1?=
 =?utf-8?B?dEFOTy9aRjVwYXhSWGF4ZVNkR3FCVmltRVlMaHIrK3NqbHlqYUJvOFU0RFlR?=
 =?utf-8?B?aFIrSmROVTVjL080T3QrYnpSaXJYdGlMNE9iRThidDUxL1l6WG8vSGZHK2ZY?=
 =?utf-8?B?WmswYXZ1SzF2bWhEazVmWlcrbDZxbDNXZ1A4cW0rTGhRMzBkTm1xMnZkamRh?=
 =?utf-8?B?MDVpUEorVlpNdXVGeGNYd1ExekRGZ1N4K0xEZ1Bya0ZnZVRKaVVZY09lMEll?=
 =?utf-8?B?MjgzR3loTFcwVFFkNlBNVDVpK0VzcjJ4NDRVbzg1UUlvb1l2U2pNS2JsL3k1?=
 =?utf-8?B?eXlVV28rcE84QkZuSG1DYTc5TWNsc25wdXY0VDU2L1MvQmh6OFV3cVJYbkh5?=
 =?utf-8?B?dDBGTS9lSys2NzJjNDNkMy8zbmxzbHdXU0hxU1ZqY1F3TlZQaWVXNzNBbDAv?=
 =?utf-8?B?QlVvRFcyMGNudU50djZPakhid3JRQ0toeW95ZnhobWVhY2lEeFhXQUlrbHVS?=
 =?utf-8?B?VW9ZeStUaGpDbXNDVFhhdEJVOHJDb3lvMWpFTDF3K00rbHRkaThHMUl5MHlG?=
 =?utf-8?B?QndYQ3U2MmkwZFJqbkZBaE9jM01jODY0NkwyeldpNDM5Y21QdnZ5YS8yZnkw?=
 =?utf-8?B?TlVCQ1dhZG55cGtSd0hqSFVReTllVFZEblhSTEtmVFRWdm9GUHJkM3ZDRzZM?=
 =?utf-8?B?UlI0czgxMnpUdS9kcWUwUE9CYU1vV3A0cmJhdWlMNk5zQ3l2c3V3ejhLNlV5?=
 =?utf-8?B?SlFQSGZXckQrQTZJTU1wWGxoMHI2UTNuaG1ONHRzcXBTWktNS1BEUmZPUS8v?=
 =?utf-8?B?QVRVYS9RdXI0Rzd3Z25CYXRNZ1ZHUlo1eU5NZS9KSndvZnRybzdUY2VMSTM1?=
 =?utf-8?B?dG4wMk1HL2FOUHNkKzRZK2pLaHk3V09XUnpZMUhGSlNvM2RubEpIQVVlUzdj?=
 =?utf-8?B?SU1MWmhNbDRFYk5OeW9PaDJqaFBBb2ZxSk1kSzB2Qm5zRGdLQnpuS1gwamNF?=
 =?utf-8?B?aFdPU1FqYmVPRkdUWldXMHZEWm5naHNkYStpVEJHT05CS0pqdjc0UHB2bU81?=
 =?utf-8?B?MEZpRjlDbjQ5YjVzZUd0S3BIK1RYTzZnaytkY2MvRTRDYTZXMEw3bWVqQ1ZF?=
 =?utf-8?B?NlBYNDVyNTdJNTA3b0w4a2FoRWVTWDR3ZXZpbjlaNWRGeEpFS283S3lzTjUz?=
 =?utf-8?B?MEMrSzBmZTBndGZqMEVYaTFvUTJqYjdlcXBoTDZuOU03TlI1SFRBcm5ieExY?=
 =?utf-8?B?YzBxWk9pMnlYRmRnTVlIUCtiMVI1L1Bld1hzcXNJQUp0cW00RUd3ZU40Mi9N?=
 =?utf-8?B?UXB1M2JiM3ZULzVkck9KWk1mcGczaXVydVR6WGVXM1p1cHBTYlZBYmpHSEEv?=
 =?utf-8?B?dzlVeE1LMG5oTE1aanJhd3RobHhoL0o1VmxwbEt3UTdrOVUxbnM1eVV5NGt4?=
 =?utf-8?B?SDNrVUhRcCtSamJKS0hyTzF4T0pTb1hpWmNSZUdvSzdIQWR6THUveFhNb3RL?=
 =?utf-8?B?a0RFUFgxWnErMlRobklUZk5JeFJtcDBOdnYyanVoS0FsRXFIdGlZSDJqc09R?=
 =?utf-8?B?VzBvR2FobFFqMmQxc3ViOHFtUGxXcVEzMDNqZzRCNVhBM2gwQ0RVdjNaaGQw?=
 =?utf-8?B?djY1cWRsUEx2T01iN29ISXVQYXRHV3F6NDd1bml6TFI4R201WHZoL0V3aUtl?=
 =?utf-8?B?bDRtcGxmV2hUa0ZOMGlDekQzandDemxOdzNaRFV3RXNZT1Vxam03N2VCdWVP?=
 =?utf-8?B?MzRsM3hXaDFmSTl5Y0tzN2d3Nmovd3lGeTRuejYvS2VlOTl3dEJ3MDA5RHBm?=
 =?utf-8?Q?agXyms2JgwpTT3DSbGeYEerYq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4e465a-7581-42f0-3cd4-08ddded4bf60
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:59:08.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT8xrjIhzHbFmErLPufGDJCY3WCaXcm1/bgwtLvzXdHfGmV2rhZA4g3qdk7INfNl80FnEF2rcBJVOoOcjUPiBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

Add output filed in csi2_pix_format since the format on the
source pad might change due to unpacking.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 85700655ecad334c61e9b5f9f073e10b6db2618f..43d766b95eb42b21be893ddfda44119101c9afe3 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -139,6 +139,7 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
+	u32 output;
 };
 
 /* -----------------------------------------------------------------------------
@@ -262,48 +263,69 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.output = MEDIA_BUS_FMT_Y8_1X8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.output = MEDIA_BUS_FMT_Y10_1X10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.output = MEDIA_BUS_FMT_Y12_1X12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
 	},
 	/* YUV formats */
 	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.output = MEDIA_BUS_FMT_YUYV8_1X16,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.output = MEDIA_BUS_FMT_UYVY8_1X16,
 	},
 };
 
@@ -634,6 +656,9 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
 	*fmt = sdformat->format;
 
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = csi2_fmt->output;
+
 	return 0;
 }
 

-- 
2.34.1


