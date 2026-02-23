Return-Path: <linux-media+bounces-53185-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD6CHZZLnGnYDQQAu9opvQ
	(envelope-from <linux-media+bounces-53185-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 13:44:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6117659D
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 13:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5CCA304F50B
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 12:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A818366543;
	Mon, 23 Feb 2026 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="crRUmBYq"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F2366DA6;
	Mon, 23 Feb 2026 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771850310; cv=fail; b=M+boWt4FpyTglnGOsVSjnfg2y6JC//7/o9Y7sbGwjMbqX9hGGT+KrznFgRpv6wonBrXTbpoBp7pa8fYyuSmomDhikHlINLdyLhOxd44u14tyuN48ZkIIXi/92jexMnlO0aN1PnnPZLjGscfFjUkqDK9O/YqpJDzK7qrSSpgaz+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771850310; c=relaxed/simple;
	bh=5ZiaSVK+imEmS1uhooc4u+UecdrdPmpgpVnwgMB+XJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gg/AVjRn1BMRw16yx7qQkPju6n9yt4sl2nrUOPlr9dwSb3j3tQZC+noDx3A0xXmogKQJso0P26KAb0GG44okkEVCnGuJAdKWKPVvOKZ9KFwR7/eXtxUpdKTigyu4v4B8KlSb7as/l3vpGdn5PqVzEPkTWSXw7HGff2zqIqPvBBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=crRUmBYq; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQx6+YMfEJHSA3HMIY1l/fbaY6rzg9FHcTFgk/sMXUjkQvCsxErGwcjNr+5nuElZqOMXbYZnd4ijpj6dnRp0e21OTIRe/IJO4pHrwDEjMLY8Vv4QXlDSbAuXMRThhv+vzfD+hPFpFgUeBdXde/PbM5R4xoGlDoXvn9ewfNEDPW+wXI0jBRRXsS6JLgUWt1K7RIItk+rY2fLTrrdGM9FRModAIsVAlGr0bIQWxfXvMw3tXMsxmMvohfodIR0GtskauKMO4uaDpJBdDO2sdjSjyB8kPKHJDrt7ca6cyhWfPFacl5LcMC4ziq61j63wDptBBV6aQIVR5PqvJf6wyWQ2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdtMoFY7jpdri5DKx+hRSklL8Eopx1FiaLchneQzf+U=;
 b=BZ0aZs5qiNPQh9JsR4jUo+XfYdJCLM4gJCeDUuCTa3oSpFWqUade+M5Fse7Bx9b+1cEAhcNWr/P0Xn5GwLH6YjWl/jaG5CuiHComHJqIN/K40f8ggctk/ExVpn0EpBM9/FkA173irXZ4fD6zb2HxmEd1Jt2WoCy7kA2rc01/X0sjj0cZPKyuk8VRUxFDGsNVT5VYvdKb50TdNvHO7+LsxbryDBvCHIJ37my2EhiwuGJtDdSsaZHPaI2/N/FLgiJ7EqvrBwvzCxBEHKctQ5pmlRdPXC/xMsyBLpSu1T7zTJLvA2dbQfd23zcYM2G2KAqX7vM574eCLGhIL3XWa6DH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdtMoFY7jpdri5DKx+hRSklL8Eopx1FiaLchneQzf+U=;
 b=crRUmBYqGIoJyNg6AD6YUJ5ljrkvDQFdiv/z0JPQYo4dUEhsrNFlL6zwknC+rzS51P/HlW24tofGqRN40HnZny+UPhw6eqrP+zDEs4GjqMilCkHcgyi3FNt4L0W1QAY3K7VcMCQAPZ8olcnY/d6q21UWJDb172VZ2cf+Utn2DUmMkbovVpxRvvbUc5dEbqVl7CfRdSjSHgiRM+HfLNZLVr9gosZ9+hXTM4o20qtWN1HnZRRA/BrBjvAoKjI3egaROyO+EVfTF1zN+2vClp8ZY2NZT7TOSkay0fiJWgkoixCxiBndXqX6geaOGoQ/d2mpbfCc5NqEBcgqQ8E0VMkR/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 by DB9PR04MB9403.eurprd04.prod.outlook.com (2603:10a6:10:369::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 12:38:22 +0000
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::b387:72c6:e33c:8656]) by AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::b387:72c6:e33c:8656%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 12:38:22 +0000
Message-ID: <cf9c2d21-fc0e-42ad-a554-b1d47549bc54@nxp.com>
Date: Mon, 23 Feb 2026 13:38:20 +0100
User-Agent: Mozilla Thunderbird
Subject: [RFC v1 00/11] Add iMX95 neoisp driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 niklas soderlund <niklas.soderlund@ragnatech.se>,
 Anthony McGivern <Anthony.McGivern@arm.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com> <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed> <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed>
Content-Language: en-US
From: Julien Vuillaumier <julien.vuillaumier@nxp.com>
In-Reply-To: <aYRSMXHjFC0M_DM_@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::35) To AM9PR04MB8147.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e0::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8147:EE_|DB9PR04MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: fb70be0f-977b-49b0-0054-08de72d86dfb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eDJjWmxYT3Azd3hpQmtQNjVmRjM3ZHBwTmtsRjBBUDVXcnNlNGN0bFF6MXB6?=
 =?utf-8?B?ejhlbllrNW8xTUh3bEhJc25MVmRXUGFhWklOQkZ3MlM5NHdyUlJaZTJ6MUNG?=
 =?utf-8?B?UG9PMWtLcC9aQVg4Y3V2QmRmYXNyWnA5NVpuV0U2NktKRnJLcHdPYjJPR0I4?=
 =?utf-8?B?ZC9Cc1dKUXkrRk5SZW41REZFOHptWGg0bWhyd2UzQy9YTVo2OGhqQWRyVWRK?=
 =?utf-8?B?aHBlOHI3SWNOekhwNytUWHQ4TW1sT3l5OUlvNDUyamF2V0tUMFliZnRTN1Fz?=
 =?utf-8?B?dlVOT1FicHBva0VWQ0VETU5ESlBGNmxEaHFINGovdmpUblM5UHhzOWl5eUs1?=
 =?utf-8?B?dmlFMGNLOVVORlhsZGV4eDVYcFFnRzQ0THdiZjBUSTVORVUvZGJJQ2k5bTBW?=
 =?utf-8?B?aGZ6eW90cDZsUEJOajd3T25ncndGanJKcktmRS81cnhsWEYvREFHVTJsWEpP?=
 =?utf-8?B?OWhCUWJZV29CWHNIaFBVS05seU1yZS9keHpsdHBRK1lYWFdJdXVzcWhHMnAy?=
 =?utf-8?B?TGdUeWFFQzFFVXRiYWhiQlEvOVFXcnYyQzR4YzRhbjFZQzVSSkRzaFFXWGt5?=
 =?utf-8?B?MGgwRDRqUjJyQlliTXZWVWM3S21JYVJYY3YrWnJoQnZ6bEpCZk9FWXl1bEkz?=
 =?utf-8?B?VFNzN1M3S3AzS0tvNTlrczRVSkg1bTlvYmErYTMyMUFiMmRNRjFUVis4a3JQ?=
 =?utf-8?B?RTVMNk9VQVVOdVQxWkE5VXoxakNhclVFNjU2MC9zbjM0TUdlR2NZMDBqbXBL?=
 =?utf-8?B?eG9wVTZFWDMwY0hVQWZtNTNpL0tvNTFIandDaXRZcnQ1bjNiZnVIUTF0a1Rl?=
 =?utf-8?B?RVk3QWRjZUFyNmFFeFNON2Z5ZDJXeFd4NGtSejRyQklXcGtMZndKWUgzWUhJ?=
 =?utf-8?B?emtGU2daUTVoeWFzbEdISXZxYXJyNWVqQWZPc3IrNGRNekNnTExqbEY0cFNC?=
 =?utf-8?B?c2lpdlpQemkwU1pRcDh3a3ovM1dVekJEdmdwU1lsRmluU3cwQXFqRFNXTGd5?=
 =?utf-8?B?WCtLZFZMTUtXNFBueTZ2ME8yK3l2bjZGZnNxamZLVEkxZnNqOXdwNGdobHJM?=
 =?utf-8?B?RFRCdnBoWEh0bXk1OHZQK2xVMXdhWmZZMnlXWjR1RFNRNUlJWUR1TE9MQnJo?=
 =?utf-8?B?SGNQdVZFN0tzdmRDWXRQaXZjUVJNNGdxUlRkSmE2YnZ3YWJJOXdaNzkxWEhK?=
 =?utf-8?B?bVpPRTJhY0NVc0paUTVTeXQvd2FZQzBWd21yaGRheFJobU85WHY0ODNlTFdD?=
 =?utf-8?B?d3Nub1REWnh5cElHQis0WWZ6SHJ0S0EvUXhOUVNjcDJsam01ZGlCSi9reU1h?=
 =?utf-8?B?VlhZYXpVaVVoTVhrcHBPTnVEcVYwbFdtWlQxUTgySUNXTCttbXlZUFpIUC8y?=
 =?utf-8?B?eHRQcm5KWXdlRHdKZFV5aW1jTUtaWHhZRGxyQXM0eUpieDB0bitWb1lndEEz?=
 =?utf-8?B?dlBkVnEydEh6SXA5RjdLWVpMRUJPTm1IdEs5T0xZTjlIWnQ5cjlab240dWdZ?=
 =?utf-8?B?czhLWDFLdW91bFNNK0t5ajdjQlV0UzdCaHpiN3d2QU52cU8wOU5GdG82TU5W?=
 =?utf-8?B?QWh5RFBpRGs4ZDlsREppclZUejY4dlZNa1FiZUptYVh6QUpXb0s5QTdIcFdu?=
 =?utf-8?B?THJOeEx0Y05qSVV2UzJXQUk2TjZXN1dHVGhEVjZhdXJrbytJMVNLSWVIaVF1?=
 =?utf-8?B?UXlFeVo3WEhJY3E3Y3k5V2U2OEdLdFNiWDZZSy82RkJTNk5iT0liSVR0dUZR?=
 =?utf-8?B?dWFCcjRQMnozV3hhV1M2NmExbG9tVkRESzJ4QU9OSU8rYTJRQkt3djArMmti?=
 =?utf-8?B?U2hsS0hYckhxNWhpSzdHU2RDQjFrS25MUFJjcWZLc2M5ZThWc1IyVnR2aDFo?=
 =?utf-8?B?SGJhdXd5TSsybWMrcjdadEpaeXlsMkxIeGlVZUc3UE1hMWxScXBhT25ZUkNJ?=
 =?utf-8?B?Z0FBdjhqb3VBRUxrcVREQXcvMC9DdTRzT1FSMFNXNzlVVW83U3hscTFJSXMy?=
 =?utf-8?B?eEZRN0xDTGJ6U0UyRFRWeTBsUUw0dEd3K1l0V1hJUlExZjVGeCtpeklGSlZH?=
 =?utf-8?B?WGJXbm96cUhFZnlCMzhER2laaGFRcWdlL2NGUHhXMW13bjVhaklMUllub1hh?=
 =?utf-8?Q?kkxc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?K0xveWt2anVhQ2VoVVRhVDJJaHBMeUZjOUY2ekdJNno2NnhzVU1sV3Jjdk1F?=
 =?utf-8?B?Ui9pamp0WEh4SnQvQU1uM3dJb2FteS9qTkRmOFp4ZVZZK1pNUzRRaUh3RWtl?=
 =?utf-8?B?NlArWXE5SFBIekZrS2NZSGRveGZ2M0RCMEpyYmY3UngveGxrbWo3ZTBmNVNB?=
 =?utf-8?B?dTN2dmtGek5Sdlp2eGZQQnltRmRKMDhmWENGc00yRzI5Y1NYVUJlanRtUWlU?=
 =?utf-8?B?bHRXV1F4UnRiZDJ6dVZwUEswQVc5MUdYVjU3cnA0dWFPRHZnem1NMTc2bk5l?=
 =?utf-8?B?NGVyVjZLQ2hta3ovMWY5YXJlZ2ZBTnJaSG1PQ3grWkVkRGhpZ1BwazA5THhN?=
 =?utf-8?B?UDBhcGlMcWlsbzhrNE96NTM4Mmc4VnpKWmZhRTQ1UEJnUDQxMTlyTWE1OTlp?=
 =?utf-8?B?MXRLOXBYdjRyRUVzR1oxakV3cXhUS0xsY2VCNjVRQ0k4MzFpNkNNdUdEQ3R3?=
 =?utf-8?B?cG1qUDNHaHg0WGJDbHkwTlZQcGtieHQreDlTMlc1MVAxTzRwYXhjaXVTMVlT?=
 =?utf-8?B?OUthZlQ4OU9ZNGNjRUJyM0tNZ1F6aFFsOHFEVVZNdTB5RG1JdGQ5a2ZmSDRS?=
 =?utf-8?B?eUFYKzZqbWpxdUdCSXlveTNmNkRLMTliOU5TYTNSbFBTV0pRakFGNVAvbCtD?=
 =?utf-8?B?TnhhalhwWjhReVBpRkNXalgweXFCNnlSSFBZcS9sM1BGc0xnbzBqd2UxOEJp?=
 =?utf-8?B?dUttVVplaWJaVW5ieGNabUpTOHBZRG81SUtRT1RmY0V6V3l4alZvMU8rYWNG?=
 =?utf-8?B?Y2UwZXZWajlVbUNweXM1ektvL1Q0c0JvbnlldjAzTEVFWkMrSDlrbjlCL2FQ?=
 =?utf-8?B?cHlRcEFiaVlydnp1K2QwSWtDdVQ3NUFHK3FpTTFIYVl3UTRyS0JtaVl1S1dR?=
 =?utf-8?B?aWxkYkoyTHN0bXA1VHhtQ0hYdTR0TUo0dVpadnJjYy80Z2gzT0hva3pCTUd5?=
 =?utf-8?B?Z1FoOTZ4eGJLSjBHd01pU1Y4ekgvUTU5ang5UTBnUER2QjdQTGFvY2FyaUlC?=
 =?utf-8?B?L25BdGtoOG9ZT1A3Zm5nUmNuQUNRUVNLTVlrUFJkMjZGT2x6RnVlYmNDNmJE?=
 =?utf-8?B?WmlwUWFuNUJ3N1kwQ1NUQjlVcGE0Qmk3eHlSY0lvOUNSZnJDZ3F5b1RQcUJ1?=
 =?utf-8?B?WWhQMFQ3MU9JRjVXSGlpMzdQd2JrSEJPQnNNbTFvUlpIbEswMWtYZmZ3MkJ1?=
 =?utf-8?B?ZXBjSEpIVVhaU3pWcTVrNVBMWHRxbGRMQnRzaUlmbmFPV0xmUUVDRTMvSVFi?=
 =?utf-8?B?MHc3TGJyblFjblhVbitSMHhlRlJiT3UwMUY1Y2ExOVVhRGxjaWtnZ0ZXZGdE?=
 =?utf-8?B?WVFQR0dFRXVORkt6U3pwRnNmL2dhdTdLVS9adHdEWlNtd0RMellPd0F6bDU2?=
 =?utf-8?B?clpMVStJeDdSZlVNLzcrNzNockEvTldibXhmKzN6clJxZVRQUVVERDdFZTZV?=
 =?utf-8?B?dUlHeHorV0Fpb2NwWTNiS1ppNjBJNnNQSlBXeEhJWHdwY0pWVFAvenFNaVJw?=
 =?utf-8?B?cGFldkdoYVBKb2k2enAzeTBwVkFqaGRvWnFkbTlNQThKaUhlOFB6ZXVWeU9E?=
 =?utf-8?B?QUh4bmExbUtCL2YrczFPT213NWdiSDVncjJIVWtzTUtZQllhdmtUMXgvMHNC?=
 =?utf-8?B?QVhqRzFzdHZIeWdHYVBwckloN2xITXI4eUgvR3ZBUXY1eS9QSXFGNFVmM2Jj?=
 =?utf-8?B?WFVsTGE3NjN3NTg0OWpRRlFRRjIycGJlYWo0R2dTWjNmZXVjc1ZSWXpkam0w?=
 =?utf-8?B?cVhYSGxvQjlVSW1KNTVNa2puanFzeW5zZ0NZL09nRVMvVUZ3SlE2YWV1M2dQ?=
 =?utf-8?B?blBOV0w0UVI1Z1pqa0crc05LRzY3bnhPMWl2c3F3VFNjOFNhbU1CMzdMSkJS?=
 =?utf-8?B?UWQ0eGZpVjB0SjlubDh5anJwUHI5d2o2ak1ERXd6OHlRM1htMGltUm80VG10?=
 =?utf-8?B?WG1sMm42eUY4dXBUVGFMaHlMdXpwUlZMMHJ1dFJsYjlEV1dxeGdYRHRzb2Mr?=
 =?utf-8?B?ZnZJUWYxRjFUdytydW5RQ2hYR2I3TGFZWll5Y2JzRXI5RFNOY3JhS3NnMU85?=
 =?utf-8?B?N1RSSGpsTncvWDhuNmc1Mk9vVXl1czRBb2FONXVxU3BkMUc0MnVvMk9KQ25U?=
 =?utf-8?B?LzV1YnBsZTQ3ZndNcFVrYW5MV1k5emI3ZjRIRXVlU0NWWk8wQzVNcjdlenRM?=
 =?utf-8?B?SEVsaVFDUmRjWjZBNjJob1NYMWs1aUNYUVk0aU1BcndoRDFCc0JudWhROGps?=
 =?utf-8?B?MWJhekQ3U2lDZFVmYng0eEZscEd5cnZYYzczajRkVGdJdGorWHczd2dYZ3V6?=
 =?utf-8?B?LzlFRC82ZzFjODdkbDVCaUNWR2RDa1hCbGhnRG8xb1ZydE1Eak9vMkV2ZFl6?=
 =?utf-8?Q?SfWZ80coWebGh2m8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb70be0f-977b-49b0-0054-08de72d86dfb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 12:38:22.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7ANYgptcr6RYPUlSN6O4P7z1QSisAZplQ/1O2hxxZK+MvymkbWkbvMdWA0e+QyRIpOf1kUZzoGNDdQxiLtnuDk3nItX8kh5aESQ4Q8+2Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9403
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53185-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien.vuillaumier@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BF6117659D
X-Rspamd-Action: no action

Hello Jacopo,

On 2/5/26 10:40, Jacopo Mondi wrote:
> On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
>> Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
>>> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
>>>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
>>>>> On 1/28/26 09:17, Antoine Bouyer wrote:
>>>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:

<snip>

>>>>>>>     - How many media devices are registered and which driver registers it
>>>>>>>       or them?
>>>>>>
>>>>>> That will be part of the evaluation. My initial assumption is that
>>>>>> neoisp would be the appropriate component to register the media device
>>>>>> in this mode, since ISI is not involved, and ISI currently performs the
>>>>>> registration in the M2M configuration.
>>>>
>>>> Isn't the ISP registering its own media graph ?
>>
>> Yes, 8 copies of ISP media graph, that can be used with the 8 output video
>> devices of the ISI media graph.
>>
> 
> I suggest you do what RPi does. The mainline driver only registers one
> instance and they carry a little patch downstream that implements the
> for() loop where multiple instances are registered. Duplicating media graphs
> is not desirable (at least in mainline) as we can have ISPs with 256
> contexts, we don't want 256 media graphs.
> 
> A framework level solution with proper priority handling and job
> scheduling is what is required and that's what the context work should
> end up being.
> 

One system use-case for the platform is the support of 8x cameras 1080p 
30fps using m2m operation.
Requiring a downstream patch to register multiple ISP instances in order 
to support the multi-cameras use-cases may not be the preferred option.

What would be the issue with having multiple ISP instances created by 
the upstream driver?
Alternatively, would it be an option to have some mean (device tree, 
module param...) to configure the number of media graph instances 
created by the driver?

Thanks,
Julien

>>>>
>>>> Can we get a copy of all media graphs on an i.MX95 system including
>>>> the ISI and the CSI-2 receiver ?
>>
>> Here is an example with multiple sensors. Or do you need it in another
>> format ?
> 
> No it's fine, thanks!
> 
>>
>>
>> digraph board {
>>          rankdir=TB
>>          n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 |
>> <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7
>> | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}",
>> shape=Mrecord, style=filled, fillcolor=green]
>>          n00000001:port5 -> n0000000f:port0 [style=bold]
>>          n00000001:port6 -> n0000001a:port0 [style=bold]
>>          n00000001:port7 -> n00000025:port0 [style=bold]
>>          n00000001:port8 -> n00000030:port0 [style=bold]
>>          n00000001:port9 -> n0000003b:port0 [style=bold]
>>          n00000001:port10 -> n00000046:port0 [style=bold]
>>          n00000001:port11 -> n00000051:port0 [style=bold]
>>          n00000001:port12 -> n0000005c:port0 [style=bold]
>>          n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000000f:port1 -> n00000012 [style=bold]
>>          n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box,
>> style=filled, fillcolor=yellow]
>>          n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000001a:port1 -> n0000001d [style=bold]
>>          n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000025:port1 -> n00000028 [style=bold]
>>          n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000030:port1 -> n00000033 [style=bold]
>>          n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box,
>> style=filled, fillcolor=yellow]
>>          n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000003b:port1 -> n0000003e [style=bold]
>>          n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000046:port1 -> n00000049 [style=bold]
>>          n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000051:port1 -> n00000054 [style=bold]
>>          n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box,
>> style=filled, fillcolor=yellow]
>>          n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 |
>> {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000005c:port1 -> n0000005f [style=bold]
>>          n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box,
>> style=filled, fillcolor=yellow]
>>          n00000067 [label="mxc_isi.output\n", shape=box, style=filled,
>> fillcolor=yellow]
>>          n00000067 -> n00000001:port4 [style=bold]
>>          n0000006e [label="{{<port0> 0} |
>> 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}",
>> shape=Mrecord, style=filled, fillcolor=green]
>>          n0000006e:port1 -> n00000001:port2 [style=bold]
>>          n00000073 [label="{{<port0> 0} |
>> csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord,
>> style=filled, fillcolor=green]
>>          n00000073:port1 -> n0000006e:port0 [style=bold]
>>          n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} |
>> max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}",
>> shape=Mrecord, style=filled, fillcolor=green]
>>          n00000078:port4 -> n00000073:port0 [style=dashed]
>>          n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000081:port0 -> n00000078:port0 [style=bold]
>>          n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000085:port0 -> n00000078:port1 [style=bold]
>>          n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000089:port0 -> n00000078:port2 [style=bold]
>>          n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 |
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n0000008d:port0 -> n00000078:port3 [style=bold]
>> }
>>
>>
>>>>
>>>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
>>>> that's exactly what we're working on with the context framework :)
>>>>
>>
>> Ok. Then I should have a look to context framework too ...
>>
> 
> Please, I hope to be able to resume working on it sooner or later
> given the right use case.
> 
>>>>
>>>>>
>>>>> ... since it is not, your assumption seems very reasonable.
>>>>>
>>>>>>
>>>>>>>     - How can the user decide whether direct (csi2isp) or indirect
>>>>>>>       (mem2mem) streaming shall be used?
>>>>>>
>>>>>> That will also be part of the evaluation. From dts would be my first
>>>>>> option, but may prevent using both modes on same platform then.
>>>>>
>>>>> Of course this depends what the hardware is able to do, but in case the
>>>>> HW is reconfigurable easily, I doubt that device tree is a good choice
>>>>> to solve that.
>>>>>>
>>>>>>>
>>>>>>> While it is certainly OK to introduce this support only at a later
>>>>>>> stage, it makes sense to consider this right from the start to avoid
>>>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
>>>>>>>
>>>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
>>>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
>>>>>>> thoughts about that.
>>>>>>
>>>>>> Is there an existing discussion thread available on this topic? I would
>>>>>> be very interested in following it.
>>>>>
>>>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
>>>>
>>>> It's probably time to have one :)
>>
>> Good. Please loop me in ;)
> 
> You are in, this is the conversation ;)
> 
> It might be a good discussion point for the media summit in Nice
> co-located with Embedded Recipes if people with interest in the topic
> will going the be there.
> 
> I'm also adding Anthony from ARM as I know he's going through the same
> inline/m2m duality you're now facing.
> 
> Thanks
>    j
> 
>>
>> BR
>> Antoine
>>
>>>>
>>>>>
>>>>> Thanks and regards,
>>>>> Michael
>>>>>
>>>>>>
>>>>>> Thanks
>>>>>> Antoine
>>>>>>
>>>>>>>
>>>>>>> Thanks in advance and best regards,
>>>>>>> Michael
>>>>>>>
>>>>>>>>
>>>>>>>> This series is posted as RFC because extending the v4l2-isp interface
>>>>>>>> may
>>>>>>>> overlap with ongoing work. If similar development already exists, I am
>>>>>>>> happy to rebase or adapt the series accordingly. If preferred, the
>>>>>>>> series
>>>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>>>>>>>> driver introduction.
>>>>>>>>
>>>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>>>>>>>> consistent with the existing style in that file.
>>>>>>>>
>>>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>>>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>>>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
>>>>>>>> yet upstreamed.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Antoine
>>>>>>>>
>>>>>>>> ---
>>>>>>>> Here are v4l2-compliance test results:
>>>>>>>>
>>>>>>>> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>>>>>>>> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
>>>>>>>>
>>>>>>>> Compliance test for neoisp device /dev/media0:
>>>>>>>>
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MEDIA_IOC_DEVICE_INFO: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/media0 open: OK
>>>>>>>>          test MEDIA_IOC_DEVICE_INFO: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Media Controller ioctls:
>>>>>>>>          test MEDIA_IOC_G_TOPOLOGY: OK
>>>>>>>>          Entities: 7 Interfaces: 7 Pads: 12 Links: 13
>>>>>>>>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>>>>>>>          test MEDIA_IOC_SETUP_LINK: OK
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video0:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04202000
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x0300000a
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000008 (8)
>>>>>>>>          Name             : neoisp-input0
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000009   : 0: Source
>>>>>>>>            Link 0x0200000c: to remote pad 0x1000002 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video0 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video1:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04202000
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000010
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x0000000e (14)
>>>>>>>>          Name             : neoisp-input1
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x0100000f   : 0: Source
>>>>>>>>            Link 0x02000012: to remote pad 0x1000003 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video1 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video2:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x0c200000
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000016
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000014 (20)
>>>>>>>>          Name             : neoisp-params
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000015   : 0: Source
>>>>>>>>            Link 0x02000018: to remote pad 0x1000004 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video2 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK (Not Supported)
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video3:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04201000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x0300001c
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x0000001a (26)
>>>>>>>>          Name             : neoisp-frame
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x0100001b   : 0: Sink
>>>>>>>>            Link 0x0200001e: from remote pad 0x1000005 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video3 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video4:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04201000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000022
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000020 (32)
>>>>>>>>          Name             : neoisp-ir
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000021   : 0: Sink
>>>>>>>>            Link 0x02000024: from remote pad 0x1000006 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video4 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/video5:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Card type        : neoisp
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x8ca03000
>>>>>>>>                  Video Capture Multiplanar
>>>>>>>>                  Video Output Multiplanar
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Metadata Output
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>>                  Device Capabilities
>>>>>>>>          Device Caps      : 0x04a00000
>>>>>>>>                  Metadata Capture
>>>>>>>>                  Streaming
>>>>>>>>                  Extended Pix Format
>>>>>>>> Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x03000028
>>>>>>>>          Type             : V4L Video
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000026 (38)
>>>>>>>>          Name             : neoisp-stats
>>>>>>>>          Function         : V4L2 I/O
>>>>>>>>          Pad 0x01000027   : 0: Sink
>>>>>>>>            Link 0x0200002a: from remote pad 0x1000007 of entity
>>>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/video5 open: OK
>>>>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK
>>>>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>>>>          test VIDIOC_S_FMT: OK
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK (Not Supported)
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0,
>>>>>>>> Warnings: 0
>>>>>>>> --------------------------------------------------------------------------------
>>>>>>>> Compliance test for neoisp device /dev/v4l-subdev0:
>>>>>>>>
>>>>>>>> Driver Info:
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>>          Capabilities     : 0x00000000
>>>>>>>>          Client Capabilities: 0x0000000000000002
>>>>>>>> interval-uses-which Media Driver Info:
>>>>>>>>          Driver name      : neoisp
>>>>>>>>          Model            : neoisp
>>>>>>>>          Serial           :
>>>>>>>>          Bus info         : platform:4ae00000.isp
>>>>>>>>          Media version    : 6.19.0
>>>>>>>>          Hardware revision: 0x00000002 (2)
>>>>>>>>          Driver version   : 6.19.0
>>>>>>>> Interface Info:
>>>>>>>>          ID               : 0x0300002c
>>>>>>>>          Type             : V4L Sub-Device
>>>>>>>> Entity Info:
>>>>>>>>          ID               : 0x00000001 (1)
>>>>>>>>          Name             : neoisp
>>>>>>>>          Function         : Image Signal Processor
>>>>>>>>          Pad 0x01000002   : 0: Sink
>>>>>>>>            Link 0x0200000c: from remote pad 0x1000009 of entity
>>>>>>>> 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
>>>>>>>>          Pad 0x01000003   : 1: Sink
>>>>>>>>            Link 0x02000012: from remote pad 0x100000f of entity
>>>>>>>> 'neoisp-input1' (V4L2 I/O): Data
>>>>>>>>          Pad 0x01000004   : 2: Sink
>>>>>>>>            Link 0x02000018: from remote pad 0x1000015 of entity
>>>>>>>> 'neoisp-params' (V4L2 I/O): Data, Enabled
>>>>>>>>          Pad 0x01000005   : 3: Source
>>>>>>>>            Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-
>>>>>>>> frame' (V4L2 I/O): Data, Enabled
>>>>>>>>          Pad 0x01000006   : 4: Source
>>>>>>>>            Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-
>>>>>>>> ir' (V4L2 I/O): Data
>>>>>>>>          Pad 0x01000007   : 5: Source
>>>>>>>>            Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-
>>>>>>>> stats' (V4L2 I/O): Data, Enabled
>>>>>>>>
>>>>>>>> Required ioctls:
>>>>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>>>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>>>>>>>          test invalid ioctls: OK
>>>>>>>>
>>>>>>>> Allow for multiple opens:
>>>>>>>>          test second /dev/v4l-subdev0 open: OK
>>>>>>>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>>>>>>>          test for unlimited opens: OK
>>>>>>>>
>>>>>>>> Debug ioctls:
>>>>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>>>
>>>>>>>> Input ioctls:
>>>>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>>>
>>>>>>>> Output ioctls:
>>>>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>>>
>>>>>>>> Input/Output configuration ioctls:
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Sink Pad 0):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Sink Pad 1):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Sink Pad 2):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Source Pad 3):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Source Pad 4):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Sub-Device ioctls (Source Pad 5):
>>>>>>>>          Try Stream 0
>>>>>>>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          Active Stream 0
>>>>>>>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>>>
>>>>>>>> Control ioctls:
>>>>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>>>>>          test VIDIOC_QUERYCTRL: OK
>>>>>>>>          test VIDIOC_G/S_CTRL: OK
>>>>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>>>          Standard Controls: 1 Private Controls: 1
>>>>>>>>
>>>>>>>> Format ioctls:
>>>>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not
>>>>>>>> Supported)
>>>>>>>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_FMT: OK (Not Supported)
>>>>>>>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>>>>>          test VIDIOC_S_FMT: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>>>          test Cropping: OK (Not Supported)
>>>>>>>>          test Composing: OK (Not Supported)
>>>>>>>>          test Scaling: OK (Not Supported)
>>>>>>>>
>>>>>>>> Codec ioctls:
>>>>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>>>
>>>>>>>> Buffer ioctls:
>>>>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>>>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>>>>>>>          test Requests: OK (Not Supported)
>>>>>>>>
>>>>>>>> Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed:
>>>>>>>> 0, Warnings: 0
>>>>>>>>
>>>>>>>> Grand Total for neoisp device /dev/media0: 384, Succeeded: 384,
>>>>>>>> Failed: 0, Warnings: 0
>>>>>>>>
>>>>>>>> ---
>>>>>>>> Antoine Bouyer (11):
>>>>>>>>      media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
>>>>>>>>      media: v4l2-isp: Add helper function to compute extended stats size
>>>>>>>>      media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>>>>>>>      media: Documentation: Add NXP neoisp driver documentation
>>>>>>>>      dt-bindings: media: Add nxp neoisp support
>>>>>>>>      media: v4l2-ctrls: Add user control base for NXP neoisp controls
>>>>>>>>      media: Add meta formats supported by NXP neoisp driver
>>>>>>>>      media: uapi: Add NXP NEOISP user interface header file
>>>>>>>>      media: platform: Add NXP Neoisp Image Signal Processor
>>>>>>>>      media: platform: neoisp: Add debugfs support
>>>>>>>>      arm64: dts: freescale: imx95: Add NXP neoisp device tree node
>>>>>>>>
>>>>>>>>     .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
>>>>>>>>     .../admin-guide/media/nxp-neoisp.dot          |   16 +
>>>>>>>>     .../admin-guide/media/nxp-neoisp.rst          |  189 ++
>>>>>>>>     .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>>>>>     .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
>>>>>>>>     .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>>>>>>>>     .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
>>>>>>>>     .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
>>>>>>>>     MAINTAINERS                                   |    9 +
>>>>>>>>     .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
>>>>>>>>     arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
>>>>>>>>     drivers/media/platform/nxp/Kconfig            |    1 +
>>>>>>>>     drivers/media/platform/nxp/Makefile           |    1 +
>>>>>>>>     drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
>>>>>>>>     drivers/media/platform/nxp/neoisp/Makefile    |    8 +
>>>>>>>>     drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
>>>>>>>>     .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
>>>>>>>>     drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
>>>>>>>>     .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
>>>>>>>>     drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
>>>>>>>>     include/media/v4l2-isp.h                      |   13 +
>>>>>>>>     include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
>>>>>>>>     include/uapi/linux/media/v4l2-isp.h           |   85 +
>>>>>>>>     include/uapi/linux/v4l2-controls.h            |    6 +
>>>>>>>>     include/uapi/linux/videodev2.h                |    6 +
>>>>>>>>     30 files changed, 11880 insertions(+), 3 deletions(-)
>>>>>>>>     create mode 100644 Documentation/admin-guide/media/nxp-neoisp-
>>>>>>>> diagram.dot
>>>>>>>>     create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
>>>>>>>>     create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
>>>>>>>>     create mode 100644 Documentation/devicetree/bindings/media/
>>>>>>>> nxp,neoisp.yaml
>>>>>>>>     create mode 100644 Documentation/userspace-api/media/v4l/metafmt-
>>>>>>>> nxp-neoisp.rst
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
>>>>>>>>     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
>>>>>>>>     create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>


