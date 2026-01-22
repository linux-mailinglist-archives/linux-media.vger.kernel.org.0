Return-Path: <linux-media+bounces-51319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPLhMLfPcWnSMQAAu9opvQ
	(envelope-from <linux-media+bounces-51319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:20:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59B6276E
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E98764FA337
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C7F47DD7C;
	Thu, 22 Jan 2026 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HzjmUpmn"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9736656C;
	Thu, 22 Jan 2026 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769066350; cv=fail; b=Xb2LaspWX4vBwDmUXzYzo/ZQhixsU+zeK+bW8wJi6R08hE0aO59WrluMITOFu9qmbL08XHa1Ny3FWPC1+imYQypUIU3jjB5K7fOjSLgcbw5ORFkhoHr93zoQv5SJ9Vs7tsqnAzRM7QWOf14/j03Imo3zGE3THhXKGgGwuASKYq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769066350; c=relaxed/simple;
	bh=F5zo4+94rg8myuA9IuuWYzbfqn8WsuupN1qYWX1mTow=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=FaLWrwnk7iYxXDbjOuZA/T5pUHng0Q2nH3GeXWGwTzrqNhKOwUyhb8Ls+Kr/+YSmcsUE3jPggKSRiZVGxVFYUvL2i643fBRJ+g43N6j2gUm1muEdgU4LxWseuKqY24mBodqJZCH6k5Hq54tYOE9I0bVa5l0W1uYA+SLLm+wU8jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HzjmUpmn; arc=fail smtp.client-ip=40.107.159.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITGH/7+TxDWU3z8pWQRbl4vYWrWIIcY/MnCG1XT1h1CSGGH3U8qfChmsDQRx+MuaXCezfd4Q+9e44wta+n91HkHy5FrvWPD+9WcANlCJ7hIFmCYZ0iN4a6v95qVZGlkMYKt0zUeMJIP9B3IoPzy64pJjg0dAVJPAoBage1srGioc95s9sgU1x5u4CLQJLN4jvVoWhUcHopHqrx+QLuiOYb/cP6tuTAeNrVdHcsWO3SG41uzt+bN4OBbkRD++4Ee/pPgIYcIvomp88P36zUZZShBhZkgqHDV1jetrBIe8wtDcbS/HhZvEpzHqH6yRndqmCiR6X8Vy+krCXZgO6ID3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymzPy6uuH2mE3CHaRk02ShEYeDo9y4mW09tQnuakhf8=;
 b=DCZGMpYfEqAXgcxXr7AtGk9jsUmfp2s9G4j8vgDO4CZd1C47wh+opoi6IZTzeaWJF/YoO/6cZds4kli4NerX1jbVIUqKaY4/PkomXWBFNw6GFbuRnnTrmXOcmjH99QHNwI4pp7EQrG5p2qVsUF2QC+yvyUxAvH8UEKnN6JmP2W+QP2fuJhai8pMYPDKWxP98AMp9qUAjWWeerxkZMOoPSE7WqF7i7RxpG0ZiCfrsbPlXpANDRq71Bjcv+TyPKmwVC0Wwmgi8fPjHGNQY0W2NVhnpz3hSltph2Ws1GO6W1ItJUofLGuZl67ytvJBUqeEGbZeB/yLa/te1tJ2h9YQv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymzPy6uuH2mE3CHaRk02ShEYeDo9y4mW09tQnuakhf8=;
 b=HzjmUpmn24vUrmySZuW18DOsqhw1O8xRN0txc68pDYUmyk+D5hddkYX/H0sL6s1dKhEzFNvP0QLHok22fcumkOE3xwzdj1LhR8OKDGwOY2DSuR9bRa/arQRVm1/zuDqjg42hpBain4qONqtxHvyPFn5jGkpWnabXDxyZVRkNDhQrpIula+HRnMY+oqjbc06lax2CMLpFQo9skb/qN2Lz8kPB8HjoSOH33kjjIY8pv9ciOFeDHfy96QrVyBX3lXVyuLLSgE5qtjzlkCWzePJwcCc6QKRi1cx3by2Q75sa+/LaIaHpUI0mD7fpxjjYhHSkqClEHMumBg/NYqjm3oQGqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB6798.eurprd04.prod.outlook.com (2603:10a6:803:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 22 Jan
 2026 07:19:00 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 07:19:00 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 22 Jan 2026 15:18:18 +0800
Subject: [PATCH] media: nxp: imx8-isi: Fix potential out-of-bounds issues
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-isi-v1-1-c3ec6e264f13@nxp.com>
X-B4-Tracking: v=1; b=H4sIADnPcWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMjXaAKXXOTNAvztKQky0SzNCWgyoKi1LTMCrAp0bG1tQDI+nE+VQA
 AAA==
X-Change-ID: 20260122-isi-74f87fbb9a6f
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Frank Li <frank.li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769066338; l=3545;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=5Kl4zqc+D1XgdRkWbOSPGBFPxaWuXKkD63qeX3qCU30=;
 b=zN9azu23mnmqNXbsIn1CH9lkvY4yn/UXfEV95cjmhlEVT610UDUNdRUvAte7OKf4pCl8pgYXw
 UM4o4L5TmqZDjb9Ll7eVgxGpQTelWKKAZgAZ4TvMIVRsaWBstSGmhzD
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 115a4d6f-00d3-4ef1-bff0-08de598683d6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UmFhbEtDc1Q1WVZnWG1nNGtxcnFiMjExZ01GZGl1Q01zdDVnS1JHVXFjMEph?=
 =?utf-8?B?NmNrMk1EaG15TS9aeGZiaWs4ZysvTEs0bC9oTDg3a0dJQktwS3dLU1dGSjNG?=
 =?utf-8?B?MVBVRnJPbXIrQjk4S3pRQnVNbXpuYzVEUWN4dmU0L2w4c3RjWDJiWWw1TkZr?=
 =?utf-8?B?Ym9nVEZ0elJQSVl3eWg3dWpjRzBUYTBmMUdUZTJSWlhVellYY0pTNkZwZTZM?=
 =?utf-8?B?UldOaU14STh0MTdGdFlNbng1Y1d0K1M4ZHhhN1VlTnFSQmpkRVc2REdHN09X?=
 =?utf-8?B?QlZ3Q3MwbWpjWHQ3RFhEd1FlWWVkaDRkSWM3ckg5OFQvM2NwUWtUU0lkY3BK?=
 =?utf-8?B?TnByOWFVSWVHbzl1MlYzWlJFRjlxNFI2WTZsZEh2cHQzY1VUcTNRbUFPNDhz?=
 =?utf-8?B?S01tRktQSGxLUzh3QWMzOFNmUmdscFRBaW92NTlPcjVqckxZMlRVSld1YWdL?=
 =?utf-8?B?U0tBZ21SblhVa2gzT3hMR0tvZ2dJRW1vbDRvZThCSm11TEFqYUIxcG9mTWtu?=
 =?utf-8?B?REhwK0V4Mnp4WEhxZTc5eTJTa1dXcHZtamxVdTZRTE9BaGJnelljdjBkdlpp?=
 =?utf-8?B?OHlCT05QQTN0OElZUnRGVXZVNkdxVzhmV2gwQkszUXBYMnRRaHNkUTA0Tmwx?=
 =?utf-8?B?QlE5YXpyckQ3WTlEL0Nuc09iREh0Z0Y0SUNBZFk3RFRXV3RwWDgxazE5NWho?=
 =?utf-8?B?Wmo2VVl0Z0dTd1hGNzRpWXpIZzNwS1hWb0o5TDQ1T2ZIT1M2YTBhN2laZExy?=
 =?utf-8?B?cHBSdjQ1NHFPdkRkeHZhRWN3Wk1abzJtRVp0UklhYlFZeTdWRkRHSnUrS0I5?=
 =?utf-8?B?Z2FlbE1aSnNiZHVrTXByTnN3RHc0cjFlMDBKdTdYbW5HV2c4Mm5xbURIMVJW?=
 =?utf-8?B?U1NCTW5jKytOY0pxdVRxYmZRL3RsclBaZzVzL0xWYktKQU56Tk1WSk9aM2Rn?=
 =?utf-8?B?ejZqVU8yaHhFemxlS1FDQTN1UVdNcGZEUnFwSUttamRiSFgvOXZmRTloL1o1?=
 =?utf-8?B?bHpXS1JPYXJUaGdLNFd4a3dmOHFjU2xuYjNtS3NiMlMrcXhIR08vRzJDd1U0?=
 =?utf-8?B?MXdBKzh1Um9ROWo2bDBwL2VqWVdNRnJOdVNVSmh6OWRZNFpIdjVrNGJIT2hZ?=
 =?utf-8?B?c3dCNUpLY242M0ZMWmhuU0dUKzRENWJjZWVXTnNpbmtEVmZxb2RpU3hURGJY?=
 =?utf-8?B?ZFlzYTE3SnRMMVdmNkxMY29UNm9tMFFrRzAvZnUyL2ZMTVgxQk13bWRkZjB4?=
 =?utf-8?B?dFdqd1BhUmEzeXU5Mytvc1BnanhENVh1QUthZHMzVkRlZ1JqZ1FTSnBuUUtY?=
 =?utf-8?B?WHFLSERTZzdVb09Bb2NPcXZFLzJqdzliNU1weTZWQ3Fna0tWamVXc0pJMjIz?=
 =?utf-8?B?ZXNOT0pCWVByUEprSEZKMXN4QjFYYkgwUEFCWmw4bmxIVENXelI5WkNKTDJv?=
 =?utf-8?B?OFM2ZUdNU0JPMU1QV2tuR2NZNGkvNzd6TENtVENuQmhSTVIrR21aNko3TFhW?=
 =?utf-8?B?RW5MOWRMN2F5dU4weFFPZ0JyOFNINjdNQThBVktTRFU0ci93TS9CdXZhemRv?=
 =?utf-8?B?Y3NuZFpQMGNtd3M4MWhab3NBcmFtQmkyb0lCdWhiQ2U0LzRuTFFVb21PUGJR?=
 =?utf-8?B?Y1k1UEFnajJ3a043SFd1NVpWWi9ISUg3NkpLaWp3QXAvODQwL2RIdjNWMVJL?=
 =?utf-8?B?OHNadjd2MkZ4Nmo3RS8zdzd2bS8wYnFjaHY2Q0lFTUVQTHNxTmcrdVlab0tP?=
 =?utf-8?B?UUExWDk1d1cwVnZrMEhvcy9qSUZ2OHNORHZHWVNJZTJPZ0VoaTlmSk1rY1Bp?=
 =?utf-8?B?YmxzUk9iMWdTbzRpVXZPNDMwdHp5eC9LMFpJNzY5UURUMVNWeHpFMVJIL1dm?=
 =?utf-8?B?RXUzSFJXSGJRUEorTmR2Q3l2VEtqRmFWbit2L21XNUo2c2pieXBvSDlUazg2?=
 =?utf-8?B?VG5ZTGIxZDAwNU5tL1NDWDRzenFtOEhGQUcwQmk0MVhKVHhSSlJoK2NNYUE0?=
 =?utf-8?B?b2JUS3FLNTExT1NtNU9JQ1pPY0taaE8zU21FbjNxMm5BZHl3ODBrODExQUpw?=
 =?utf-8?B?NytvL20yRWM1TGt3UXU4TC9jaW11cCt5Wmk2L0R2N2RIY2hsZS9nbXZyQ1Rh?=
 =?utf-8?B?aEIwVG0xR0p1WFdDdlh0VjAvbHBkTmpTZUJxTldxcktXdnpZbjhHZ01VQmRz?=
 =?utf-8?Q?SEYYvMF6V7JoEgOISn/WURO6+0iMR1Ebg0p0uEfTJoaO?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MXI4dGlpMUcwUEdiWW9WMDBCUTBBaWxod3BRaldyVGpsVElZSFMzZDQ4Znpx?=
 =?utf-8?B?bnBxamQvWVpWdjc0VFZ0OUNJOHRJd0JkbFN3OXFsTHZRbE5TRGM3aENyWml0?=
 =?utf-8?B?bHF1cDJidWhPbEFaenp4Wk44VGhLemQ3QTc2eTBsd0tXdGMzMjBOUDgwbDht?=
 =?utf-8?B?NVFpdmE2Y29jWXBRY2RhcjFxMlJlSzJJZmgzcDRUS2xIS0xpSy9LUi9Dckxq?=
 =?utf-8?B?YTRGbWM5QWZtcU9Wc1EveU1yVzFPY3IzVlIzZ0d3dlZpTVdSNzhQbThzYldy?=
 =?utf-8?B?eHp0U2d2VmZia1BINVllYkVnNVBoc1NmdCtnWjhBbnJsajZLcVhueGxuWEp4?=
 =?utf-8?B?K2pmc3VGVXBnT1Vvd3FmNWJyN0RWVHdZZnh3WEl1YjhmNllsUkc5VzQzalpT?=
 =?utf-8?B?L1J6MHpBNk5tdG11TmZaV1g3dkY4RVBvdE1ITHhocnlZWEpSaTUydHdDZDNu?=
 =?utf-8?B?bmszYy9keGZpdVhvMjVrbjZyQXpBUzVXTC8rQ2xXTWUwR08yVFVOTGF3Wktu?=
 =?utf-8?B?UEpNYnRFODVmMFJ6N3FOWkRURHc2M2htMkZlanFXZFR4ZjZ0NU8zNVk2aUxC?=
 =?utf-8?B?UzJpVlg0TVNVRlF2dWhBY2I3ZkVlOStUYzRES0p4UDlqUzFqV2pvcmpJV2Ur?=
 =?utf-8?B?ZENtQ2dEZVBoUlpUWXVLZWVwRGdvanFQaEJBR3VRR1p6UzNuRW5jK0VYWWtm?=
 =?utf-8?B?N3dETzhIREdrYWQycXA5cVVrT3JMZ1J3Nnd3TWJIS3Z5SC9yRjdUbndCL09x?=
 =?utf-8?B?ZUZJdXlFZ25KNWlkelZUNGIrVHcvU080L0c3NXlXM2hob3VpNEp3aStnM2VI?=
 =?utf-8?B?d2l1STR5VVljcjUyRU0rb1pKbmRBYThnZThHZHRCNFRRamVmT21xTXgyYzI0?=
 =?utf-8?B?TVBnK084Ujl0M3NsMGhPbjNXWkNKVXNZM2dVaWJydHNNazRtcXVJRkVFOFg4?=
 =?utf-8?B?WE5HS0l3OHkvOVZjYnNrd3l1QlFyOEFrT2ZLV1g2S002KzYxVTdsWWs1eUtp?=
 =?utf-8?B?NTR4K0lWcVAyaGhyOWxMZVQyclRGTTdHQjlFeUhhZmVZNHAzOEt1MDB6R2Jt?=
 =?utf-8?B?bnFlandzR2QzbU1oYThrRFRFZWliMVVGMGRYbjlDRjgrRUN4eDBXNDVzWldP?=
 =?utf-8?B?M0s2SHJybjFHRGFrYnFBejBNekZtT1RYRmxnNC9IQ0NoTW9xUlhWYWkzOWlO?=
 =?utf-8?B?djZxWTlVVW02dHJPdGVLMDh2MHQxd0o0MzhNcmJYZDdoQ0dNOWtRSkdyTjBL?=
 =?utf-8?B?Zm14dTZ6eEtMSHNENU5JZjRxdDl1T203YmFnSHFXaVc0U0dITnFZZEUxT2Zs?=
 =?utf-8?B?VmVVWnVhQmp0d3RWcXBkT2tqMTE4RUFGM0xWajA3cDdvZllqTU9JZFlrNSti?=
 =?utf-8?B?VjZFbkVpTGI5QTFvOVV0Z3JpMElSMHBFT2psd0xwVGVjdjBndVE1ZkVXUUlH?=
 =?utf-8?B?OWZTVzRxamhXYTdnYmNGSkhQT1F5QWFlQndMNU9HU2lrUHZRMDRGZzdiZGZM?=
 =?utf-8?B?TEhVbWtPV1k1TEQxbzhaZXBnRHF0TGQvUTB3T1lyWkg3S0lOQmVIYnNLVFJu?=
 =?utf-8?B?VndURCtxNnordVU0cklmSi9BZ1J6dWdLTjE1ZWJGQkkvVDgzcTBuYUJFOUVv?=
 =?utf-8?B?NFpXeTZ1dWxQMzUvZFgvbDZ2QlJ1U3hndW82N2lhSStDemxjMTJIVW1mY29S?=
 =?utf-8?B?MEJvanpIVldFbDNZNm1ia3ZndHQvdXVLR2t3Q1gzZVBqdmtUVzQzajEyVHIw?=
 =?utf-8?B?aU0wditCSWNYclRqMmlmYlI0YjlHdGJ1Q28yZWJ6R3FnNHJZemhkN2IvYWxl?=
 =?utf-8?B?d09PcXMyUVlUYVNBVmtSZnpHQ0NKYkFnVStqWnBvbm5mdmlWN0NzV0x5cW5Q?=
 =?utf-8?B?cEd0Mm5oQkQweGhOeHRYb1lnQTZlT0tydmZ5KzhCZFRFRHVxQUJaQ3J1RkVX?=
 =?utf-8?B?ajBRajR6bUdmN3ZiZ0RiWi9aVGxZeExXSmxMODF4VVlIQ1puNHB2azc1RGl3?=
 =?utf-8?B?REtGd1NwYTNTQWdIWnFNY0EvdlFVbE5WVUpKN1FXaHNSL2p5QnFFUWE0SjBS?=
 =?utf-8?B?aFRwYTl2WG1RaEtvUlA3VDVVd1lvQUpKempXUitabkRDTXRielljZWxlMkNy?=
 =?utf-8?B?QWhzUU5jcVZBLzZhenJHcnoyYTNSeGpUeWZLMTBWbkppQVNzSU9JRnY5clBq?=
 =?utf-8?B?Rm1TUTlSTHM3REhFV2h5c1ZPVUoxQWpyN3BNQnBObC9nanYzNGlOTGdRcXRo?=
 =?utf-8?B?OXFNRnVmL1pIN2V5V3lPbXB1M0JQYi9mU05Hc2Evbitzb3ZuVzJqWXB2amZs?=
 =?utf-8?B?STFSaFFyVWR6MmxRQXoyMVp5MzZnbUJUOGw3YktsSTRRNnJEUEVwUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115a4d6f-00d3-4ef1-bff0-08de598683d6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:19:00.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wKVqiczY/4DndDmBwkmlNXOjYPqmYVGLf2XiuLnpFrtLLmGoINiov9TBkbYIFuLtj8S1OZMmvmT3RSNJbBDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51319-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 4C59B6276E
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The maximum downscaling factor supported by ISI can be up to 16. Add
minimum value constraint before applying the setting to hardware.
Otherwise, the process will not respond even when Ctrl+C is executed.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 11 +++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  |  6 +++---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  6 ++----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..cf87f1da6b83d398e4433c4c62395e2fdb7c8d3a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -59,6 +59,17 @@ struct v4l2_m2m_dev;
 #define MXC_ISI_M2M			"mxc-isi-m2m"
 #define MXC_MAX_PLANES			3
 
+/*
+ * ISI scaling engine works in two parts: it performs pre-decimation of
+ * the image followed by bilinear filtering to achieve the desired
+ * downscaling factor.
+ * The decimation filter provides a maximum downscaling factor of 8, and
+ * the subsequent bilinear filter provides a maximum downscaling factor
+ * of 2. Combined, the maximum scaling factor can be up to 16.
+ */
+#define CLAMP_DOWNSCALE_16(val, max_val) \
+	clamp((val), max(1U, (max_val) >> 4), (max_val))
+
 struct mxc_isi_dev;
 struct mxc_isi_m2m_ctx;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index f425ac7868547da401e86ce5a9b70a9890e72541..8860d89713667d06abc94e6024526fabac46feb7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -509,9 +509,9 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
 			  const enum mxc_isi_video_type type)
 {
 	if (type == MXC_ISI_VIDEO_M2M_CAP) {
-		/* Downscaling only  */
-		pix->width = min(pix->width, ctx->queues.out.format.width);
-		pix->height = min(pix->height, ctx->queues.out.format.height);
+		/* Downscaling one-sixteenth only  */
+		pix->width = CLAMP_DOWNSCALE_16(pix->width, ctx->queues.out.format.width);
+		pix->height = CLAMP_DOWNSCALE_16(pix->height, ctx->queues.out.format.height);
 	}
 
 	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..c3ffc8a38d1269c0a4e6493b4d75690f01cc87bb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -647,10 +647,8 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
 
 		sel->r.left = 0;
 		sel->r.top = 0;
-		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
-				     format->width);
-		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
-				      format->height);
+		sel->r.width = CLAMP_DOWNSCALE_16(sel->r.width, format->width);
+		sel->r.height = CLAMP_DOWNSCALE_16(sel->r.height, format->height);
 
 		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
 						    MXC_ISI_PIPE_PAD_SINK);

---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20260122-isi-74f87fbb9a6f

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


