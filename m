Return-Path: <linux-media+bounces-29690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8BA8180E
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 355B94253FD
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CFC258CFA;
	Tue,  8 Apr 2025 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JAfj2NsM"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230B258CF8;
	Tue,  8 Apr 2025 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149288; cv=fail; b=US1fQE7tRvH0c0ezBrqTTCLFH8UdObSYfr9W7zh8fPQMA33P/LpCP8lnAyZ22vuhlcJBpLqfJ4vjqKMJWTyhvcVglCiOHCtNTUc3FmNzt2z/htE5/jAGJj2fiZZUQE+ok1MrYrqLxnzdiBDfc+J/1bYkiOh1cZK9bNP2ICBiSWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149288; c=relaxed/simple;
	bh=J/vXWJ71e9iywXWc7F7QPLUcxVg/o2Yp16ibMSDuxm8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VCEjoK2tuHmQsgcCCdcVp/XGbZ4/Ms78bo021kmlewB3V2gg9NwXwr0HcH89ONezDw9MvmQZGRFB+IaH53AKxtNxPJ9EFCTXuhU9hAZSC1v8q0HdRqbfXzpliFN0OP9N1b53Pljv/x727sUeA82O5qWxJflN0eRawZC0bWiPpUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JAfj2NsM; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi0lt9C9Tx8vEYyBi6C8chzId60f58EeCa+QPlJGkNItBwCAsHO8DI7lWyBPGXaWckhYYRIrQd7tBijHv2mdHZ0duad5pEDz2TBMhgUdUxZJJ8kKsjaRcMSL+ldclVcWPVcaWXmtPzAZMgmBE0z6D090YbyQQszqmR8IJXquMhd1nAxhNFeH4HA2MbRtMyK65dJTxQnmn4D5Of7L9I6fo+gKfeHFhxzVQHjRI0XwKMXZQmCQ/6a+D/hJDAVa7SixVOX3qEhjr92iS74rbIY/NyAO1ZzozGZZ6PtJ4BcYAdDVom++9p08NT/nGFUSxARVu6+KJIgk9/uacHeRkc2XoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqnnDlFpQb10c4i+t/JGSPA0f/+UZq4ELBTIshbiaNc=;
 b=pWCqp4dNm7f97u1iDFQQgUdMCeN3CsKGKH35cQWJs39IEyAl53LXC90dpE/OUQ5bqSvc4xK5FcvqyTbH/+KbPy5OWqaDrw//be588G81ICzhUicQZfc4HVig85IeFtnju4r+8V7+Bwg1DZmx0hnbk18DB380c55CFS4dS+5AHI4gWUEw34qGRFTGux8C0LwiRW4rpcKRzd8JXYqXjCvYoj1+df7IjHUUB8v6lBPLS20BLh0W7UInlTKi9XVhE6Rkr8otJ4kanypvQXavd5YPtiPA/N0KilT7SB2NPrUN9BtRWlXqTBpW2RQOMKoql4mQk4whNxrowviGWJqPt0FS/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqnnDlFpQb10c4i+t/JGSPA0f/+UZq4ELBTIshbiaNc=;
 b=JAfj2NsMHDKPM6Pn0iOMu0vtfgfww2hNHena5YCuHr2ElMK6DUVOcGxAE0ZY8SpVXtFWKmvIcpq2txQsZpqlAN9sG0+LATSML6V63K07AknCsGkLDDac4PCKgQxbU7csGBjW8e2QOMBFUsdZqocUNcYyVFV8Lq6wIypMbDFUBofHx9pVjVNRhNiOQaJUTXa/LaHM6V1ITRxzxJ8y5DmTfrJHtr4wmNogqwA9yR7+PvxHcwwmy26hs16T+DVz96A4lcSwuLzYt6EBuoWsn9sx5LzPqRpIkvI8kgHDZBq+cJpXUSe2eWw5Zt61j3VEheYgzWOwFKBmDOJEEom3NAuLaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:10 -0400
Subject: [PATCH v4 12/13] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-12-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=1608;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=J/vXWJ71e9iywXWc7F7QPLUcxVg/o2Yp16ibMSDuxm8=;
 b=WLa/tPmqQfvzNTNSDKgkngzg6Qk2a5+cdSljNeIL+tq6l/CVsBZ8SqCPeiXhKNnq340GA2qln
 utuvuUldmeXBCFq+cSY28yQ1/CUZMn8Nwk5Rdg6XHxPh9nQh0YmyrHb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cbcd00-3daf-4ca3-8030-08dd76e7f8cd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NmpHYnNGQTk2ZElseHdIOTZBZzU0VVhCbWRqQTJGaFBmSlZ1cXlNN282ZVpy?=
 =?utf-8?B?ekFqTGJaNjNSLzF0S3g3T25rdlM5c1J5aXd6VnRwYU02eEszcFdqR0VXRHJI?=
 =?utf-8?B?V042TUFkN044NnA5SzBpdXFrekV5SHBqeW5sTjJUcTUvTkxXcjFaM0FQTndh?=
 =?utf-8?B?VTNGeWtQb0lWWk0yMVNFajk2S3VzSVdFcmZoUGVxeVJ0SEQxUnFyVHdsV3U3?=
 =?utf-8?B?TkM3dGhSYzFNeFV1cFh3emJVZWRseWJUQVVpR2s3aEJzbXZkU1hJdVcwSlR2?=
 =?utf-8?B?aHZ4clJnWnZlM0x1eVFoSXNGNmtaNG40eTcwZkE5ZEhyU2pQcURwQXBMVUV0?=
 =?utf-8?B?dnNLM1ZmWGtsM1lPdVVtMnNkY3NpSW9iaTE3NHpIejdPa0psWC95TUsxYlZC?=
 =?utf-8?B?OEgwbXF1c1ZSMFJYSmErK2h5RTZ2OVZPa0t5QWE2ZHVTc0FzMENDT00zZUhZ?=
 =?utf-8?B?M2FlV3d2L1lCZGtldXB4dEVUTVMyVTdITlZucDJxYjIrN3hvNW9UWnZaS3Q2?=
 =?utf-8?B?VnF4Z0VidGNvSU9wbndlUVdHMGlkdVZHUFR6d1ZRREFqdkViNzF1ZWMvcFM2?=
 =?utf-8?B?UmV0eHA2bVFlejczN3NTbFppbU1ac2tCMkdnTTVSS2hsMlJCZWxXSUxqVWI3?=
 =?utf-8?B?ZlhtTk8yWDZadVR3VXp0eHdSOGM1K1F1TnhDaGovempFa3hJbFcwUURYLzg4?=
 =?utf-8?B?b1dtNFFGeHcxdTdXUVhTRUJlTnAxQWtWNXdBOE9lUmFPNytwZE1acFFWQTR2?=
 =?utf-8?B?cUFHeWQvbjh1QzQxUmhWMlluWnpTVTdwL2tIMVNvMGFmWlVBL1A4NVVid1kz?=
 =?utf-8?B?eStna0NnU3g3ZEdXMlY4Qk96MkJxNGZXL3FJOWZEMVhZNnIxdk9BS2xReUtV?=
 =?utf-8?B?ZWxJbS9xUzE3S3lLeVVKQ2RVZ05KN0dJRUVpdWM4SDBzcmFGbW9qUTZRR210?=
 =?utf-8?B?Mm12YjlHUnNxQ0t0ajMycEViVytmMXhGWlczVndkVW0xdkhIRmhHS1dKMXRW?=
 =?utf-8?B?bU1FWUlMbi9lUzE2SXlCcStRc0RRQmIyNysvc2FNVzROZFU2UGd6Y2VZZlRa?=
 =?utf-8?B?YXdqS0U2WHFWdzE0UVl5My9KWW02aU8zOFJBb0MvaEpSYWZ1Z1BDZ012ZFhv?=
 =?utf-8?B?aGFlMnRQUTdDZDhaUFJGTTJCN3dHU0E2YkZMdS9nM3Q0a1hFbTBBZUd0eWl5?=
 =?utf-8?B?SHBwL3lpSVp6ZlROOFllb1R4K1lWTzNJZjE0WDduaVZjU1lMZDM3QUdQR2VT?=
 =?utf-8?B?djZDM0xoVmVzVEVPQ25TWGZhTUoxUnc4QUZ6N1BWNUdsWWl3cTBrTEE0c3Rt?=
 =?utf-8?B?YzBtMllJNmZraEl1eTVjMFdEUlk4Rm5Kc0owVTRtNTc5Z1VYN3Z5TjJ6Z2lq?=
 =?utf-8?B?ZUxqM1k1cWV2Q2RNQm5hZWNXaldFVnVRVCtNTGJOeCtjblJaVWxFK3N1Q0pT?=
 =?utf-8?B?MmM5NWl6ZWFUV0ZsRUI5dk1IcFIxTThMVFVGZ3pZRnRQUHc5RlN2MXEvN2Jr?=
 =?utf-8?B?S1Y5dGxDdzFJMnEyZXJjUSt2anpuK2lmczVFbDNvaCtvUnJxcWRCL0RBcVF1?=
 =?utf-8?B?N3N6UFhYc01OaUZNT2NuaUY1L0p2OHF2a0hSUi9zSlljNFhiVU40TzlKZ2xh?=
 =?utf-8?B?V215VFRGVUU3R1ROSkd2RTZWck5WOUtPL3NJQ1BWQVIxL2E3M1FpT0F3cWJQ?=
 =?utf-8?B?U29KRFNiSGtCbTBKZTNlNlJkRzhmVVpValZqRnFtNkxRS0ZmYVJQMGF4b0hn?=
 =?utf-8?B?WDlkRTMxZWd2Vithc2NFWnkxOHk4OEFsRGMxaWVIVnZDOHV4WERrMFV3TUl5?=
 =?utf-8?B?Z2M2b3lBdDFHVWpTVk5rT2Y5eU9FeGt5TnhYZUQ2TG1wZlM5ek9uT2k0cnkr?=
 =?utf-8?B?K3R5cXNkK2c4dTZ1Mk5qUk1JMlN1UDV2bFFEK28wY2pROXI4S2NOSXI1bEp5?=
 =?utf-8?Q?BJ2CZ83RI4+oRqHCj9KHkbIGjl6+lMaB?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?elBoRVJDQk1nOVFHNTRlWnY0cjkwdXJKM2k3d2xCU09uYTN5Q1Y5eHRXTlBs?=
 =?utf-8?B?R0JjUURqbEwzNVlBazhOZlBWOC9HMTdLZ25lZ2pwUC9kbEkzQnZoMzU5RTkw?=
 =?utf-8?B?RVJQMHI4c0ZnUmdjRzJ3Y3oyaFZCLzdQd2FtS3orWmFLU2IzZmw0VC9xWTlQ?=
 =?utf-8?B?Vkk2Yjl4WWI2U1dTa0syYkRuS1JYayttaWVjQmRxOFRyTWFzZjI2VFo2UTMw?=
 =?utf-8?B?cWFLSUpmenJ1aWpRVDd6TkFUc2FzUWtNeUludGlMMjdDalUvaXhkZGJOd2I4?=
 =?utf-8?B?cW91V2hHZ2NsRW5EajZoYUdHMkJ5ZW03TmRFUHhCTS9DTUxwQlFWb1RTRGkw?=
 =?utf-8?B?QlFKdHU1L3I5NVBldVRQdDFrNTQ1TXlmbVF0alF1RGRyVDh4OHlSMTlzeWFs?=
 =?utf-8?B?Y04xUEYvQW5CSUhZU01YcW5YWmZidnRpeU02RE9PdDZwRkE0R2NGRi9qWmZt?=
 =?utf-8?B?YjJLSmJrbHYzWFVqdzl3QzdEWWlhdG5QZ0lObnRCSDdxRFZrQWdnczVYVWNu?=
 =?utf-8?B?WGREU3lEbDlaNGptZ1ZaTnJwKzlFTGo5azExN3NQU0xlMCtPWTZQWllEYytP?=
 =?utf-8?B?elZzQlhydjloOFJnMVU3VGdZK0kwaXV1SmVPdS9PZFBtVUNlQnFYQ1VnZnJG?=
 =?utf-8?B?QXVlNHhuTWV4NlJ0aEIrbHFQRzBxelNGckhRNFNqUWlzakhKVkpjcGZoNVE3?=
 =?utf-8?B?L1h2NmFGOGhhd3JlMkZ6c2dyNXpKMUM5b3ZYN0xCNFVMSEM3bkxuTG5ud3l1?=
 =?utf-8?B?MWxHeDlpV0tmUHhhV3l1SFN3UzBuRE42QW5nRkppbUxJTmlsSmdhejNUUWZZ?=
 =?utf-8?B?VFhjUU5Pd296K0k5WVZIc2FreGYvbVhXZ0JnNEVLOE5oQzVYcCtJKzV6MkFa?=
 =?utf-8?B?M1oyL0QxYnpCRFRFNU1WTmk3TTh5TFIwU2FqNEQ5QlJWcDNoVVVRWmh5emdT?=
 =?utf-8?B?UHlIaTNIdlJOK05CQjBtU0JiTkFlcVZjck14WDYwdEszbkFQbE40dHVHZjVR?=
 =?utf-8?B?cU01T2V2YlBCZ2JtMTJmelVtRFpTU0Y1dWN3Y29zUGJhUXFhWmlTV1I4eDU0?=
 =?utf-8?B?OHhMZGhTdVZHNG5waG8xQy8vYm0zSXpsVFBHMWZESkRuOEVLenlSYTNPclFM?=
 =?utf-8?B?VGsyYTA3cTZqZXNiWldQNWhnWFQyUTFEc0N6QmVOQWYzRnFpQlY5SDloWm02?=
 =?utf-8?B?MFdvM2hNeGNQVWN6RlZNeGJZOWl0eCtCR0RvTlp1Q2NucDBPUTROeGJaazM1?=
 =?utf-8?B?STdlN1NEN0FpVEtiRlA3WlZjQVhFTjg0YXRwWUljTWZRaUV4WUpDSlNwamZT?=
 =?utf-8?B?eGpiUi96K2o0Sk5KYjBzamVYNDFHMmhVMjEwanJYbVdCb2FOKy94SnNmMUpj?=
 =?utf-8?B?dXBET01Ha1ZvOGlYM0I2eUxXeVpEeEZvUGJqak0yK09rSHhZWHFjZVVpWDJK?=
 =?utf-8?B?UmVEME5kRnZLOUVyNE5kUnlIVW5VWmZ5WU9oM3NYRVlMSXdsbmFXWURzQlZi?=
 =?utf-8?B?V25XT3BDeFJRQ1VscVZVS1JYaUkycFI1QWJSbXJXWmN1RWoyVjFiSmw0OE1p?=
 =?utf-8?B?eGtsV2V5MlcwUkEzczdkWS9wL2xwK0o1TlA2eVNrTXBwWHl3N0pTSWx1WGF1?=
 =?utf-8?B?dUkyc3lRWlJPS2VNOHFrY1BUUzZpNlJuUXJOUnlFdTFKdWl5YUlDcUE0dEM3?=
 =?utf-8?B?dmUzb0JnZjdhNHBCYjNzdzdTQm4wRnFtVkI2TTdRSmtzemxHMGF4L09MdTZR?=
 =?utf-8?B?VHF1YnAwWHRpVWxVQ2VLbWlrcWZtb0RrYm5xZXBhY3A4RnladE9VYmZTNFZh?=
 =?utf-8?B?aWhwQWJOdVgrSzJGS3JnQVpydmtUTTFBaVdWMVNMMjVnZC9zRVlEekk2V2tM?=
 =?utf-8?B?b0N3UDBVLzI1MHg4UjA0cndJV3FjMlhLMWJrQlk1WTlJK0ZRcDhPQmo2YkVW?=
 =?utf-8?B?SUR2d0hDRzRhOHBvazk5MFgyRVBNSkcyKy9WbHkyYnBlcGxpdTJyUG1jTUNL?=
 =?utf-8?B?aC9aSTVwL2xnNXgweFk4a24zN0NtVnd5UDNhY0x2QkU4eDVJMXNDL0taZE5R?=
 =?utf-8?B?eGp1ZHJtMUtpcURISnR4YzEwQ2s2Q3dyUVUvdVNQcjFUK3M1TkxsQUZTNTBz?=
 =?utf-8?Q?EGdg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cbcd00-3daf-4ca3-8030-08dd76e7f8cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:44.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVsZsWndLUF7Jmx4ocZB/lSlcQSc6RLLQ0tJu9whpIK0fGMiO5pXZbxVbPdu2vOgxaEOS+c9QsGwfEr8oIs0fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Add linux,cma node because some devices, such as camera, need big continue
physical memory.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v3
- none
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 9 +++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 353f825a8ac5d..68442c8575f3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -113,6 +113,15 @@ dsp_vdev0buffer: memory@94300000 {
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;
 		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a669a5d500d32..a378f462a283b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -56,6 +56,14 @@ dsp_vdev0buffer: memory@94300000 {
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;
 		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
 	};
 
 	reg_usdhc2_vmmc: usdhc2-vmmc {

-- 
2.34.1


