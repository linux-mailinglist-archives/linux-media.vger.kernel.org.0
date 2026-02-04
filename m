Return-Path: <linux-media+bounces-52212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJZyGfqQg2lCpQMAu9opvQ
	(envelope-from <linux-media+bounces-52212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 19:33:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F341EBAFC
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 19:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 120813055809
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068044279FA;
	Wed,  4 Feb 2026 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bEgIDdY9"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18742317B;
	Wed,  4 Feb 2026 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229830; cv=fail; b=OjhuQxdxePPGpStSGIm4E3lSo3BCGtQteL8pmuNTjM6aKLHbrxTpGrwqAPMtMNrgStgEs4mK2XrVQYL7cjb4Nb+IVW+69a3woAX0p+fXktWndDOiDlKghMin3zphbfsetIMJJvHRdPssnXpzXAf2mEZGfYLLLwaTM4DQT3JBzko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229830; c=relaxed/simple;
	bh=wu/NStYBaZYKduxxw0eVg47wEcuU8tkQ5wmY6mST3mI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NPDoQ9A7Z3l9CKyTyE1de0JxQO9eegp9607GKDy1nV4ElaC2sNiXOD+HKbyGHWYKI1b5FzPf0+KevfXtcrq/SWEUEnUbw/RlRYThkrcjuniT2rfwU08S9NjoKrK+c8TpLqFtB2OHZUXCOp7BZA5ObN8S1fBwGwnbMbz/AEqQx5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bEgIDdY9; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aisZBjXksww8JmqLjXq+bsd63eaedk0qnS/h32Yv85oFCMynXj9/2pYaoTSEdp4OeUGUcRVvjrI9sU+go/kCGaNwPnC44CEJe6D+1/YNyxXISyWoJ3iXtf9qai8PqnnxoxMz6FNwXdLJ2MgVyXqqdd7gzWYX0tQDH7kHif+s0m49uaQIiO4lvICJHAeb2wkXFV3fsEl8PMfKssj6BmaTJTi34+D83bXjt6ZoBrhGM0We35u/uOaVXi7O4TQ0+UxoGo6dB2sNEjCsClyC//f9vwqFm2cSgKig8EYWWlBFlqBdpzvJwBVPwxm5LpDY4CRaK31yYI8UfAWbwILiso1g7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTo/nfvE39iPEMA2fdBGal0DVchYFF9WsKYbSngdyMo=;
 b=AH9NKTI7GKwAlpAAOoXxmT8zDWwt5ZlvJ1gmVbl5RDZS9assVLNC056c6oSI988ltM7VD9qhGm9rGjdoy0OmElMUaLoLpPjOo8vfeL/QH822DrZntx4KLrbAm3k2Gf8INSJKmClJttem1FA3OjJ7yrO/VBOygd4G3IzLdeJ7QROOV4aSn0KnCEFOzWxj2/0xUULXopUdLFLHwoZAzws2e94vjMLCQiBpy8mfzVmpiIocfisecyaJ19M/wNoGKWdJNHEd+K+omWvePloLTqjkBTjaAk0Tp4DOV5IZaVgjkhkTYgwM0V5qkotePpeu864IcNQdT0vZ2DBTFtwazm8n+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTo/nfvE39iPEMA2fdBGal0DVchYFF9WsKYbSngdyMo=;
 b=bEgIDdY9g6xKXFPWRrokUvk4jyh520bfh2IE5NMIDG7S76DfzoCel7mu5QI76Gy+fqM3Ou3cq4CtYG0nWaH9hKUL24GhrKmi4pi6tnXo609aQTZ45AU24CVgt+75DB4OySDg9VSOGeKGH6o1KnbY5yGSX1/lbAjPkQbxPmsLpfj9kymVVwfaSUW2qrlR8P53R8EVPWaDuSnvP545NV7zKuBua65d2CrNinfIqOjsN4BhwNbGOWF+PeehVyhEyAdNJ83e2XGi0ZtTxblyU9Zle19D4ix3APuKS0oj5ji+o8PTpMjoYYco/i0fIgnWvDxDez8g8TrQAcO0PqKl8Stgug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by GVXPR04MB10045.eurprd04.prod.outlook.com
 (2603:10a6:150:11a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 18:30:22 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 18:30:22 +0000
Message-ID: <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
Date: Wed, 4 Feb 2026 19:30:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com,
 peng.fan@nxp.com, frank.li@nxp.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 niklas soderlund <niklas.soderlund@ragnatech.se>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com> <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed>
Content-Language: fr
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aYN8v3UGFKfzkl4_@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|GVXPR04MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f62525-6db8-46bf-e7d3-08de641b745b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bEpxcVNrZUNuR1RselluM0svd3BlcllFRWZUbGFJWUxXR2JFdzJsWjZTMXA0?=
 =?utf-8?B?RXdKUGo5UGM2RWNpSWw0RjYrZm5DVDRyVW5oaGhEYkdPeVdhR1htT2xGVy9q?=
 =?utf-8?B?bEYyTEJZZk8rbTlzd2NIM3Flb000cXdNelFmYUQxZkd0V1R6OGVhTEN6STRN?=
 =?utf-8?B?dmVYeW4yWUU4ak82WVdTTHcwQ3BVZ1Z6alRHazFDd2V1MC8zU2pVSEpMT01G?=
 =?utf-8?B?NWxBeDU2dWV3MnAyOEtRQ1pVcnpKWnZnRkZOKzlrSjJKN2k2N2ZXTUhubWEy?=
 =?utf-8?B?cUtkRmdtZHRaY0o0MExmK3J1UkhOR1grMzZ2NDJ1endJc2ZmbEVrWWhRc1VW?=
 =?utf-8?B?WUlJWWxId2M1K2x2UDVOQkhxNEZweG5ZNEhNSG1FSXpLUXhZZFQ2RjYwYzNT?=
 =?utf-8?B?RHVvaWJadzJQazAwVzh2dlpsbnhITUs1a2dvTElwNC80OXFrL3BUNjlNSUVJ?=
 =?utf-8?B?aGpYWWFENk5JbWV1MXB5ZURGZWNYdmRXNXJSRlY1eWV4ZW4rVVQ5ZkhIZXIz?=
 =?utf-8?B?Rjh6T3RxSnEwb1VyeW1STkZkdWVaQ2pJWWM0eW05TUphczRvOE9SRnQ0T0M2?=
 =?utf-8?B?N3I2c1V6VTRYeTM0N2ZVMmtMaE1tTDVjMk1rWFNSckk0bFhkaEgyaVhmR0J4?=
 =?utf-8?B?N2xOL2t0QlB4LzJMd2Z6Vnk0c0hGS3FleERwTENVWS8venQwTEdNc0tDWjFP?=
 =?utf-8?B?dTI3cXBaRDY3YXdMZ3c2L0Rhb2x2dmJzMENia1M2S25wUUVUUkd1bElsSC93?=
 =?utf-8?B?UWp2OWhIbDNpcnlqQ01FTU5RY1E2aE4wdStJRDI0RTE2bVVLYm4wWmpMQ3la?=
 =?utf-8?B?WUNjenU5V1FlbG1Wak95R08zWVMvTmY2blByalJFdWZnZldBVUtzZVlZNmd6?=
 =?utf-8?B?RUVvSmZaNk5qLzJObWsyM2hkZ3J2OTVYcjd0c3hleGFZOTdOb2dBSnduT2du?=
 =?utf-8?B?SHdmMElYWmJ5OGlaK3Q4bzlidUJuR2RYKzRiUVNmakxKNXovMmRxL3p0eGFJ?=
 =?utf-8?B?VGU0bXNCQzEwS3VscW44Yi9raWJuZVdzWVByQ0xyVEF4TVBOUGg2V3VtdFJq?=
 =?utf-8?B?dkJ5L1lSdjVxUGVQQUg0MFFDQXVKcjhMVU40VXBlaWw5MnI0SWxodEp4Vkxw?=
 =?utf-8?B?blNDb3ByVFVvS1IxWklyd3JMbk1KcVFzOU5zSFR2cE5uUkU1ZW1RVnVxU3RU?=
 =?utf-8?B?TWJibE5xbDdkVkd0Y092bGpkQUp2c0FlWTBidFJwS2E1VUh5eGEvU05NUmVo?=
 =?utf-8?B?WC9seUZyeGt4Smd0TzVwVkVTSk82K3pPMWM4alVyR3plSjZXeno1enBzK2JS?=
 =?utf-8?B?MW0yY0NDdE4vdVQ0NnVsVFVDZllBdDdTZFQzYWZIRDM0YXR0bjY2aEk3SzNE?=
 =?utf-8?B?M20wN0dSRnpMaEg4Y3haQzQ0aDVRYnJkZFUxTkU3NWkzOHJDU3JwOVdFZjZi?=
 =?utf-8?B?K0hqa3RLNzg4VHhjN2J4b2I5NHh5TlFJQnE0YmUvYjAzQngxSzhucE9lUEM1?=
 =?utf-8?B?UGttN05aa1g0SnFPYnJCY3hwaDNaR2t3aDNiNkNSL2NhT05WeUcybHNYQ1ZB?=
 =?utf-8?B?YWEvN2ZvYWx5eVY0M0Y0RTZROGdUUjBvYmljZkh2N2Q2WmFUU2FsRGh1M29v?=
 =?utf-8?B?Q3JqMWJnbWJzdEp3ZTA5VmZyaVpoN2tOTDYxRlJ4eW1jQXgrbndrZTRCWnlh?=
 =?utf-8?B?VVJoaTltT2tVcW1MMk9GZ010ZTl5b0lyQUpjMEQxQW82eTZ3VTZqMExSdGFK?=
 =?utf-8?B?WmRSakdTb2pNZS9mRFNnRmdhODAwakwybit0bVA0QWsvWnFYb2RWbld2QlQx?=
 =?utf-8?B?ZmdDZ1FIcFIvWEh4dGg3MGVTZjB2VTZNdTBLK3FPTWxLU2owNnphVVJvMElU?=
 =?utf-8?B?dlpsU3E2NjZjd1FvY1grNitzUG9uVmlhN0wwYmhYZkYzQjRpejBNYkVBUCtY?=
 =?utf-8?B?RlNhYTQ5djZoTlBlcEFCdnhBUkUvS3RYMGNvK3VpemxGamNka3g5YmtHVTk0?=
 =?utf-8?B?ZVVUVkI1ODA2MCs3RVBsZStLQnFKdW45RGw5OUp1dURMNFBRRUJ4a05GQTJX?=
 =?utf-8?Q?pejOm/?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?V1VhTE91MGdJVVM1OXRzUGs2UWg0VFJoaGZhSi90RGtRTFlIUVFiU3NZemtw?=
 =?utf-8?B?RmdZMWxUYzNJRUd4VjVkNkFxLytIUUkrOVBRM2twQmdLZlJoTGxiYnd6dXIr?=
 =?utf-8?B?NnZqWTg0VEovdFA0VWtGdFNKUFVkTGlzWWpQSFR3aVhBRm05cyt5UkcxTk1x?=
 =?utf-8?B?TW43bExkOTQ1K1ZCVmhyRVVyb3ozMVhUUStKV2toNldwS3Qyc0kwcHlLRS93?=
 =?utf-8?B?NXU1UUxaQnZrVDZGZ0gzeGYzdmJTYUNVRSs5V3hPYm03YmRhT3hvaVpMVVJn?=
 =?utf-8?B?c2NSaGlESVJrUW1jaWMrKzJPelcwUDVnbkNNNVZYNVNRR3dOQm41NFcvOU9t?=
 =?utf-8?B?bTNjZVRQV1k4KzNJd2FPbWZUQ3ZBNXVNbjVta0J2K1J4ZllpK0gwYXdpZE5H?=
 =?utf-8?B?WmlmM0lNQUZtbWtFN21IYmYyWVJmaU8xVytjVmtwNU50RkNrNEZoRnFIMU9Y?=
 =?utf-8?B?dzU5bmpKRUVwa1UrMzlYRVcvcnEyR3QyT2VaZkQ5NFpTWW8yRllqNmlOdlFO?=
 =?utf-8?B?Kzh0U2RSM3FvTlY0MmFKZWt5Nm8vblNhZGMrNGJwVTB1d0dSMnBDR2hOVWh2?=
 =?utf-8?B?K0Q3VUEwTXhkVUNuM2tBbThHemhHM1N6K1gyN0srVnQvME5YQ3V5SnFwbmVq?=
 =?utf-8?B?em9HcVFlWVNpUkVFQ2VjOFdLbXg1L0x5OHpUc0gxVHdnRCtCZGFUY2s2QjZK?=
 =?utf-8?B?WnFMcVcvSnFKOTByc0YvRXNwVHArdE9TZlIydEhsZzlnZzdPcmwvQzVZQUE1?=
 =?utf-8?B?S2JTMGVGSkNNcTlJbzZMV2pKQmVFdkNGOHpwWlFiZWljQTZRN2ZoV25hQUhX?=
 =?utf-8?B?cG5HZTl0U1hGSFRlSTFPK3k2b1JiRTVSNWpUVTBMay9kWlY3RWxxUWltdm81?=
 =?utf-8?B?ZlNTRW1NYUtIUzBtYjllWmMxOE1scUt1WXlIOXplam91UVg3U3FtL3NDR1Ft?=
 =?utf-8?B?RkNIUVgrV0dHQzRzZjlhajJMN2tiQXA2c1B5OHN2S1ZvUVNQTU9TbW56Nnh2?=
 =?utf-8?B?N0o1U0MzNWNVMmJIcE93bCtWeVhVSkJJMmg3a2hYdnl4Y1NzY3FkOEJVT3E4?=
 =?utf-8?B?TVg4MmlNUDZWZU5jMVJnd21WQkIybjVTV2xsQWRSYWo0QW9xanIwRjlua3Qy?=
 =?utf-8?B?eVhWS0xqWDJpSGV4RGJvdWlSZ1lpRFhVTmRmamFQdXdueVFSUmpmbEFtLy9t?=
 =?utf-8?B?U093TFRubHEwVGZFVmg1NzJMbyt2Y0JpQzJDeG1BWVRyaXBValhpZUw5cnhl?=
 =?utf-8?B?MlVzV1oxbU5nRmw2aUZkSzNXUFU3U2VqaEZER2hYN2JwZ2l0aTFMS3gvZ0hv?=
 =?utf-8?B?QUhzV01yaVFCY1EwekFsOERYeEU1TUdTRnVFTFhNWitwTGtRZisrZ254ZDd2?=
 =?utf-8?B?akY4Sk5wMi9qcE44MklVT3Ezekt5TXRGeUJsTXplV1lPYWtuR20yaWJMTXFY?=
 =?utf-8?B?ZXFjQUE1TzhoanVVTmdiTHdpdGNXeXdJNnlCVzBRcENoRDBhaW5uWXU0OFNO?=
 =?utf-8?B?TlhGUlAxWm85MXgwTVZyTFNpeVNLcVhOemljM0dRNHhwdnhPSk9WNlZXZENk?=
 =?utf-8?B?aUJhdEpEZUxjRW1PY3FjanMzVEF5emVrd25sQ1J0MjZMRy9KM2JHK2haSW0w?=
 =?utf-8?B?L1Zuam5KbFhFaE1pbGMyMFAvbEM4T2FvMEVXOEwxdC9qeDhEdEEwelZsL3N6?=
 =?utf-8?B?ZWlSVHBURCtyaTVnSWJMWTdRdlBHYVBwaDJVL0ZRbzNnRWpHNnFoems3VXRy?=
 =?utf-8?B?OTJvTW4yUHBQZ1QrY2NraHg1Q3hOMmw2Vmcva3JYSzZtS1pPSkR4aXhsL3hQ?=
 =?utf-8?B?Z0VleitDTkYyN1FiV25ZSS9RNzdhbnI1VzdoN1FtV0RQVE1jbCtnanJLQzV6?=
 =?utf-8?B?S0lnMFVjaEY5eTJJM0o2T0lVVk9sc2tzcnROWmF6UUlHdloxOTR4YUM2WG54?=
 =?utf-8?B?YWwwTVJzMTRGd0tHV1pnK1ladjlUd2xTNVRTZFZzSFRBeGFhOGFzTGZRL0t2?=
 =?utf-8?B?cVFDZkJPN2x0bEVyREFkRmhwNkVGaXZDcTBkSjdPamNFWUY1SWJjU0hiZ29R?=
 =?utf-8?B?REcwUFdUWk1NcHVWU2gzOVEyQkYza2ZWUE9ENlRld0wyUkJnTjNwTjBySlhX?=
 =?utf-8?B?OUxkU25WS3RCR040VW5tdTNCd3hLL0o5SFcrQVpvYlI1SklxY09rS3JvbkNB?=
 =?utf-8?B?UXQ2WTZBUEhlM2Q1eUZPMzdHREhkNTNWM0VRZzg5bmZaK2ozU3E3V29GaTVn?=
 =?utf-8?B?WnlHRTVNeHpyYWxuTWhlRnRab0NIbTQwNEpTQm9VaFI1Nm0zVWFMREU4L2xH?=
 =?utf-8?B?MklldG40bTkxQ3RodG1JdWhiWVUyOXNMZnowMUhmRXVuM1FnbVBOQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f62525-6db8-46bf-e7d3-08de641b745b
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:30:22.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JIbJjQgqU9rmO9+tPyYd0uEnzZ6sQrMLLzrQtjq7JggsHk2zcurRg3Gmr5TaR7svkZMjqTlua8qs4BhQyePsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52212-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 8F341EBAFC
X-Rspamd-Action: no action

Hi Jacopo

Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
> 
> Hello,
> 
> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
>> Hello
>>
>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
>>> Hi Antoine,
>>>
>>> Thanks for your response.
>>>
>>> On 1/28/26 09:17, Antoine Bouyer wrote:
>>>> Hi Michael
>>>>
>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:
>>>>>
>>>>>
>>>>> Hi Antoine,
>>>>>
>>>>> On 1/23/26 09:09, Antoine Bouyer wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> This RFC patch series introduces the NXP Neo Image Signal Processor
>>>>>> (ISP)
>>>>>> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9
>>>>>> family.
>>>>>> The series also includes updates to the generic v4l2-isp interface to
>>>>>> support extended statistics required by the Neo ISP.
>>>>>>
>>>>>> The Neo ISP processes one or more camera streams, converting RAW formats
>>>>>> into YUV or RGB outputs. Its architecture is largely influenced by the
>>>>>> PISP driver. The hardware supports up to eight contexts, with three sink
>>>>>> pads (main input, HDR input, and parameter buffers) and three source
>>>>>> pads
>>>>>> (RGB output, IR output, and statistics metadata).
>>>>>>
>>>>>> At this stage, both legacy (fixed-size) and extensible (dynamic-size)
>>>>>> parameter/statistics buffers are supported through the generic v4l2-isp
>>>>>> framework, similar to rkisp1 and Mali-C55. The driver currently supports
>>>>>> M2M operation; direct CSI-to-ISP streaming is not yet implemented.
>>>>>
>>>>> How do you envisage the direct CSI-to-ISP streaming shall be supported?
>>>>
>>>> At this stage, this streaming mode still needs to be evaluated on
>>>> neoisp. We should follow the integration model used by existing ISP
>>>> drivers to avoid duplicating solutions.
>>>
>>> Fair point, but I have had the impression that there are not many
>>> examples (if any). The rkisp1 driver, for instance, only supports inline
>>> mode although the HW should be able to do both.
>>>
>>> But any pointers most welcome, I won't claim I have the full overview.
>>>
>>>>
>>>> Below are my initial thoughts on the specific points you raised:
>>>>
>>>>>    - How shall the final media graph(s) look like?
>>>>
>>>> The media entities would remain mostly identical, except for the absence
>>>> of ISI. The topology would be a direct linkg from sensor->csi-
>>>>> formatter->neoisp.
>>
>> If support for inline mode has to be added later, the ISP will need to
>> be registered in the same media graph of the CSI-2 receiver to be able
>> to link the two, right ?

yes correct.

>>
>> How do you envision to control the ISP operating mode, because I'm
>> afraid if you register the ISP in its own media graph, you're locking
>> yourself there as implementing inline mode would require a different
>> media topology with all the implications on the rest of the userspace
>> stack.
>>
>> This might not be a problem if you know that the inline vs m2m mode is
>> SoC sythesis time parameter. Some SoCs will integrate neoisp inline, some
>> other as m2m. In this case you'll likely need two pipeline handlers
>> in libcamera, but if that's per SoC-line maybe is acceptable. The fact
>> you suggests in inline mode there won't be an ISI makes me think this
>> actually depends on the SoC design ?

Actually, this is not really at SoC synthesis time, neoisp HW does 
support both modes, that is configurable. But ISP HW can run in a single 
mode only once it is configured. Streaming mode is tightly coupled with 
CSI HW, then ISP cannot be used in M2M mode with another sensor 
simultaneously.

> 
> One small correction after some more research:
> 
> we actually already have a pipeline in libcamera that supports inline
> and (will soon) support m2m: the mali c55 one. My take on "probably
> need two pipeline handlers" was not correct then.

Yes, I saw your patchwork on libcamera about this coming upgrade. Spent 
some time analyzing it ':) Seems we are quite aligned as per my 
understanding: inline mode (i.e. streaming mode with neoisp) _or_ M2M 
mode using IVC video device from Mali. Is that right ?

> 
> As said, Mali-C55 can be integrated inline or in m2m mode and this is
> decided based on the device tree endpoint connections.

Good. Do you have an example available ?

> 
> So, if you know neoisp will be integrated either inline or m2m in
> different SoC lines, maybe deferring it to device tree is good enough
> at the expense of a slightly more complicated pipeline ?

As said, SoC/ISP HW does support both modes. But I think that the 
selection can be done in device tree too. So that after bootup, a camera 
will be used only in 1 mode.

> 
> I guess this has implications on the bindings definition as well..

Most probably yes. Can this be done as second phase once evaluation is 
completed ?

> 
>>
>> However, if you plan to allow deferring inline/m2m mode selection to
>> the system integrators or even have it as a run-time parameter, then
>> you should really consider having the ISP in the same media graph as
>> the CSI-2 receiver and operate the whole CSI-2/ISI/ISP as a single
>> media graph, where you could select the operating mode through media link
>> enablement or dts endpoint connections
>>
>> Niklas (in cc) has addressed a similar situation, where inline and m2m
>> mode can be selected by link enablement at runtime here
>> https://patchwork.linuxtv.org/project/linux-media/patch/20251225171054.1370856-3-niklas.soderlund+renesas@ragnatech.se/
>> (see risp_cs_internal_ops)
>>
>>>
>>> OK, I thought that ISI was still around...
>>>
>>>>
>>>>>    - How many media devices are registered and which driver registers it
>>>>>      or them?
>>>>
>>>> That will be part of the evaluation. My initial assumption is that
>>>> neoisp would be the appropriate component to register the media device
>>>> in this mode, since ISI is not involved, and ISI currently performs the
>>>> registration in the M2M configuration.
>>
>> Isn't the ISP registering its own media graph ?

Yes, 8 copies of ISP media graph, that can be used with the 8 output 
video devices of the ISI media graph.

>>
>> Can we get a copy of all media graphs on an i.MX95 system including
>> the ISI and the CSI-2 receiver ?

Here is an example with multiple sensors. Or do you need it in another 
format ?


digraph board {
         rankdir=TB
         n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 
3 | <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | 
<port7> 7 | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 
12}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000001:port5 -> n0000000f:port0 [style=bold]
         n00000001:port6 -> n0000001a:port0 [style=bold]
         n00000001:port7 -> n00000025:port0 [style=bold]
         n00000001:port8 -> n00000030:port0 [style=bold]
         n00000001:port9 -> n0000003b:port0 [style=bold]
         n00000001:port10 -> n00000046:port0 [style=bold]
         n00000001:port11 -> n00000051:port0 [style=bold]
         n00000001:port12 -> n0000005c:port0 [style=bold]
         n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000000f:port1 -> n00000012 [style=bold]
         n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box, 
style=filled, fillcolor=yellow]
         n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000001a:port1 -> n0000001d [style=bold]
         n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box, 
style=filled, fillcolor=yellow]
         n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000025:port1 -> n00000028 [style=bold]
         n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box, 
style=filled, fillcolor=yellow]
         n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000030:port1 -> n00000033 [style=bold]
         n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box, 
style=filled, fillcolor=yellow]
         n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000003b:port1 -> n0000003e [style=bold]
         n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box, 
style=filled, fillcolor=yellow]
         n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000046:port1 -> n00000049 [style=bold]
         n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box, 
style=filled, fillcolor=yellow]
         n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000051:port1 -> n00000054 [style=bold]
         n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box, 
style=filled, fillcolor=yellow]
         n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 | 
{<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000005c:port1 -> n0000005f [style=bold]
         n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box, 
style=filled, fillcolor=yellow]
         n00000067 [label="mxc_isi.output\n", shape=box, style=filled, 
fillcolor=yellow]
         n00000067 -> n00000001:port4 [style=bold]
         n0000006e [label="{{<port0> 0} | 
4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}", 
shape=Mrecord, style=filled, fillcolor=green]
         n0000006e:port1 -> n00000001:port2 [style=bold]
         n00000073 [label="{{<port0> 0} | 
csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord, 
style=filled, fillcolor=green]
         n00000073:port1 -> n0000006e:port0 [style=bold]
         n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 
3} | max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}", 
shape=Mrecord, style=filled, fillcolor=green]
         n00000078:port4 -> n00000073:port0 [style=dashed]
         n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 | 
{<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000081:port0 -> n00000078:port0 [style=bold]
         n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 | 
{<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000085:port0 -> n00000078:port1 [style=bold]
         n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 | 
{<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000089:port0 -> n00000078:port2 [style=bold]
         n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 | 
{<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000008d:port0 -> n00000078:port3 [style=bold]
}


>>
>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
>> that's exactly what we're working on with the context framework :)
>>

Ok. Then I should have a look to context framework too ...

>>
>>>
>>> ... since it is not, your assumption seems very reasonable.
>>>
>>>>
>>>>>    - How can the user decide whether direct (csi2isp) or indirect
>>>>>      (mem2mem) streaming shall be used?
>>>>
>>>> That will also be part of the evaluation. From dts would be my first
>>>> option, but may prevent using both modes on same platform then.
>>>
>>> Of course this depends what the hardware is able to do, but in case the
>>> HW is reconfigurable easily, I doubt that device tree is a good choice
>>> to solve that.
>>>>
>>>>>
>>>>> While it is certainly OK to introduce this support only at a later
>>>>> stage, it makes sense to consider this right from the start to avoid
>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
>>>>>
>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
>>>>> thoughts about that.
>>>>
>>>> Is there an existing discussion thread available on this topic? I would
>>>> be very interested in following it.
>>>
>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
>>
>> It's probably time to have one :)

Good. Please loop me in ;)

BR
Antoine

>>
>>>
>>> Thanks and regards,
>>> Michael
>>>
>>>>
>>>> Thanks
>>>> Antoine
>>>>
>>>>>
>>>>> Thanks in advance and best regards,
>>>>> Michael
>>>>>
>>>>>>
>>>>>> This series is posted as RFC because extending the v4l2-isp interface
>>>>>> may
>>>>>> overlap with ongoing work. If similar development already exists, I am
>>>>>> happy to rebase or adapt the series accordingly. If preferred, the
>>>>>> series
>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>>>>>> driver introduction.
>>>>>>
>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>>>>>> consistent with the existing style in that file.
>>>>>>
>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
>>>>>> yet upstreamed.
>>>>>>
>>>>>> Thanks,
>>>>>> Antoine
>>>>>>
>>>>>> ---
>>>>>> Here are v4l2-compliance test results:
>>>>>>
>>>>>> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>>>>>> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
>>>>>>
>>>>>> Compliance test for neoisp device /dev/media0:
>>>>>>
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MEDIA_IOC_DEVICE_INFO: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/media0 open: OK
>>>>>>         test MEDIA_IOC_DEVICE_INFO: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Media Controller ioctls:
>>>>>>         test MEDIA_IOC_G_TOPOLOGY: OK
>>>>>>         Entities: 7 Interfaces: 7 Pads: 12 Links: 13
>>>>>>         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>>>>>         test MEDIA_IOC_SETUP_LINK: OK
>>>>>>
>>>>>> Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/video0:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Card type        : neoisp
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x8ca03000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Video Output Multiplanar
>>>>>>                 Metadata Capture
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>>                 Device Capabilities
>>>>>>         Device Caps      : 0x04202000
>>>>>>                 Video Output Multiplanar
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x0300000a
>>>>>>         Type             : V4L Video
>>>>>> Entity Info:
>>>>>>         ID               : 0x00000008 (8)
>>>>>>         Name             : neoisp-input0
>>>>>>         Function         : V4L2 I/O
>>>>>>         Pad 0x01000009   : 0: Source
>>>>>>           Link 0x0200000c: to remote pad 0x1000002 of entity
>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/video0 open: OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 0 Private Controls: 0
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK
>>>>>>         test VIDIOC_TRY_FMT: OK
>>>>>>         test VIDIOC_S_FMT: OK
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/video1:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Card type        : neoisp
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x8ca03000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Video Output Multiplanar
>>>>>>                 Metadata Capture
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>>                 Device Capabilities
>>>>>>         Device Caps      : 0x04202000
>>>>>>                 Video Output Multiplanar
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x03000010
>>>>>>         Type             : V4L Video
>>>>>> Entity Info:
>>>>>>         ID               : 0x0000000e (14)
>>>>>>         Name             : neoisp-input1
>>>>>>         Function         : V4L2 I/O
>>>>>>         Pad 0x0100000f   : 0: Source
>>>>>>           Link 0x02000012: to remote pad 0x1000003 of entity
>>>>>> 'neoisp' (Image Signal Processor): Data
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/video1 open: OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 0 Private Controls: 0
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK
>>>>>>         test VIDIOC_TRY_FMT: OK
>>>>>>         test VIDIOC_S_FMT: OK
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/video2:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Card type        : neoisp
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x8ca03000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Video Output Multiplanar
>>>>>>                 Metadata Capture
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>>                 Device Capabilities
>>>>>>         Device Caps      : 0x0c200000
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x03000016
>>>>>>         Type             : V4L Video
>>>>>> Entity Info:
>>>>>>         ID               : 0x00000014 (20)
>>>>>>         Name             : neoisp-params
>>>>>>         Function         : V4L2 I/O
>>>>>>         Pad 0x01000015   : 0: Source
>>>>>>           Link 0x02000018: to remote pad 0x1000004 of entity
>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/video2 open: OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 0 Private Controls: 0
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK
>>>>>>         test VIDIOC_TRY_FMT: OK
>>>>>>         test VIDIOC_S_FMT: OK
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK (Not Supported)
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK (Not Supported)
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/video3:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Card type        : neoisp
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x8ca03000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Video Output Multiplanar
>>>>>>                 Metadata Capture
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>>                 Device Capabilities
>>>>>>         Device Caps      : 0x04201000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x0300001c
>>>>>>         Type             : V4L Video
>>>>>> Entity Info:
>>>>>>         ID               : 0x0000001a (26)
>>>>>>         Name             : neoisp-frame
>>>>>>         Function         : V4L2 I/O
>>>>>>         Pad 0x0100001b   : 0: Sink
>>>>>>           Link 0x0200001e: from remote pad 0x1000005 of entity
>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/video3 open: OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 0 Private Controls: 0
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK
>>>>>>         test VIDIOC_TRY_FMT: OK
>>>>>>         test VIDIOC_S_FMT: OK
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK (Not Supported)
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/video4:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Card type        : neoisp
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x8ca03000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Video Output Multiplanar
>>>>>>                 Metadata Capture
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>>                 Device Capabilities
>>>>>>         Device Caps      : 0x04201000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x03000022
>>>>>>         Type             : V4L Video
>>>>>> Entity Info:
>>>>>>         ID               : 0x00000020 (32)
>>>>>>         Name             : neoisp-ir
>>>>>>         Function         : V4L2 I/O
>>>>>>         Pad 0x01000021   : 0: Sink
>>>>>>           Link 0x02000024: from remote pad 0x1000006 of entity
>>>>>> 'neoisp' (Image Signal Processor): Data
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/video4 open: OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 0 Private Controls: 0
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK
>>>>>>         test VIDIOC_TRY_FMT: OK
>>>>>>         test VIDIOC_S_FMT: OK
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK (Not Supported)
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/video5:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Card type        : neoisp
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x8ca03000
>>>>>>                 Video Capture Multiplanar
>>>>>>                 Video Output Multiplanar
>>>>>>                 Metadata Capture
>>>>>>                 Metadata Output
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>>                 Device Capabilities
>>>>>>         Device Caps      : 0x04a00000
>>>>>>                 Metadata Capture
>>>>>>                 Streaming
>>>>>>                 Extended Pix Format
>>>>>> Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x03000028
>>>>>>         Type             : V4L Video
>>>>>> Entity Info:
>>>>>>         ID               : 0x00000026 (38)
>>>>>>         Name             : neoisp-stats
>>>>>>         Function         : V4L2 I/O
>>>>>>         Pad 0x01000027   : 0: Sink
>>>>>>           Link 0x0200002a: from remote pad 0x1000007 of entity
>>>>>> 'neoisp' (Image Signal Processor): Data, Enabled
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/video5 open: OK
>>>>>>         test VIDIOC_QUERYCAP: OK
>>>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 0 Private Controls: 0
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK
>>>>>>         test VIDIOC_TRY_FMT: OK
>>>>>>         test VIDIOC_S_FMT: OK
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK (Not Supported)
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK (Not Supported)
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0,
>>>>>> Warnings: 0
>>>>>> --------------------------------------------------------------------------------
>>>>>> Compliance test for neoisp device /dev/v4l-subdev0:
>>>>>>
>>>>>> Driver Info:
>>>>>>         Driver version   : 6.19.0
>>>>>>         Capabilities     : 0x00000000
>>>>>>         Client Capabilities: 0x0000000000000002
>>>>>> interval-uses-which Media Driver Info:
>>>>>>         Driver name      : neoisp
>>>>>>         Model            : neoisp
>>>>>>         Serial           :
>>>>>>         Bus info         : platform:4ae00000.isp
>>>>>>         Media version    : 6.19.0
>>>>>>         Hardware revision: 0x00000002 (2)
>>>>>>         Driver version   : 6.19.0
>>>>>> Interface Info:
>>>>>>         ID               : 0x0300002c
>>>>>>         Type             : V4L Sub-Device
>>>>>> Entity Info:
>>>>>>         ID               : 0x00000001 (1)
>>>>>>         Name             : neoisp
>>>>>>         Function         : Image Signal Processor
>>>>>>         Pad 0x01000002   : 0: Sink
>>>>>>           Link 0x0200000c: from remote pad 0x1000009 of entity
>>>>>> 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
>>>>>>         Pad 0x01000003   : 1: Sink
>>>>>>           Link 0x02000012: from remote pad 0x100000f of entity
>>>>>> 'neoisp-input1' (V4L2 I/O): Data
>>>>>>         Pad 0x01000004   : 2: Sink
>>>>>>           Link 0x02000018: from remote pad 0x1000015 of entity
>>>>>> 'neoisp-params' (V4L2 I/O): Data, Enabled
>>>>>>         Pad 0x01000005   : 3: Source
>>>>>>           Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-
>>>>>> frame' (V4L2 I/O): Data, Enabled
>>>>>>         Pad 0x01000006   : 4: Source
>>>>>>           Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-
>>>>>> ir' (V4L2 I/O): Data
>>>>>>         Pad 0x01000007   : 5: Source
>>>>>>           Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-
>>>>>> stats' (V4L2 I/O): Data, Enabled
>>>>>>
>>>>>> Required ioctls:
>>>>>>         test MC information (see 'Media Driver Info' above): OK
>>>>>>         test VIDIOC_SUDBEV_QUERYCAP: OK
>>>>>>         test invalid ioctls: OK
>>>>>>
>>>>>> Allow for multiple opens:
>>>>>>         test second /dev/v4l-subdev0 open: OK
>>>>>>         test VIDIOC_SUBDEV_QUERYCAP: OK
>>>>>>         test for unlimited opens: OK
>>>>>>
>>>>>> Debug ioctls:
>>>>>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>>
>>>>>> Input ioctls:
>>>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>>
>>>>>> Output ioctls:
>>>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>>
>>>>>> Input/Output configuration ioctls:
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>>
>>>>>> Sub-Device ioctls (Sink Pad 0):
>>>>>>         Try Stream 0
>>>>>>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         Active Stream 0
>>>>>>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>
>>>>>> Sub-Device ioctls (Sink Pad 1):
>>>>>>         Try Stream 0
>>>>>>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         Active Stream 0
>>>>>>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>
>>>>>> Sub-Device ioctls (Sink Pad 2):
>>>>>>         Try Stream 0
>>>>>>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         Active Stream 0
>>>>>>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>
>>>>>> Sub-Device ioctls (Source Pad 3):
>>>>>>         Try Stream 0
>>>>>>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         Active Stream 0
>>>>>>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>
>>>>>> Sub-Device ioctls (Source Pad 4):
>>>>>>         Try Stream 0
>>>>>>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         Active Stream 0
>>>>>>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>
>>>>>> Sub-Device ioctls (Source Pad 5):
>>>>>>         Try Stream 0
>>>>>>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         Active Stream 0
>>>>>>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
>>>>>> FRAME_INTERVAL: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>>>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>>
>>>>>> Control ioctls:
>>>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>>>         test VIDIOC_QUERYCTRL: OK
>>>>>>         test VIDIOC_G/S_CTRL: OK
>>>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>>         Standard Controls: 1 Private Controls: 1
>>>>>>
>>>>>> Format ioctls:
>>>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not
>>>>>> Supported)
>>>>>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>>         test VIDIOC_G_FMT: OK (Not Supported)
>>>>>>         test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>>>         test VIDIOC_S_FMT: OK (Not Supported)
>>>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>>         test Cropping: OK (Not Supported)
>>>>>>         test Composing: OK (Not Supported)
>>>>>>         test Scaling: OK (Not Supported)
>>>>>>
>>>>>> Codec ioctls:
>>>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>>
>>>>>> Buffer ioctls:
>>>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>>>         test CREATE_BUFS maximum buffers: OK
>>>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>>>         test VIDIOC_EXPBUF: OK (Not Supported)
>>>>>>         test Requests: OK (Not Supported)
>>>>>>
>>>>>> Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed:
>>>>>> 0, Warnings: 0
>>>>>>
>>>>>> Grand Total for neoisp device /dev/media0: 384, Succeeded: 384,
>>>>>> Failed: 0, Warnings: 0
>>>>>>
>>>>>> ---
>>>>>> Antoine Bouyer (11):
>>>>>>     media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
>>>>>>     media: v4l2-isp: Add helper function to compute extended stats size
>>>>>>     media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>>>>>     media: Documentation: Add NXP neoisp driver documentation
>>>>>>     dt-bindings: media: Add nxp neoisp support
>>>>>>     media: v4l2-ctrls: Add user control base for NXP neoisp controls
>>>>>>     media: Add meta formats supported by NXP neoisp driver
>>>>>>     media: uapi: Add NXP NEOISP user interface header file
>>>>>>     media: platform: Add NXP Neoisp Image Signal Processor
>>>>>>     media: platform: neoisp: Add debugfs support
>>>>>>     arm64: dts: freescale: imx95: Add NXP neoisp device tree node
>>>>>>
>>>>>>    .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
>>>>>>    .../admin-guide/media/nxp-neoisp.dot          |   16 +
>>>>>>    .../admin-guide/media/nxp-neoisp.rst          |  189 ++
>>>>>>    .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>>>    .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
>>>>>>    .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>>>>>>    .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
>>>>>>    .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
>>>>>>    MAINTAINERS                                   |    9 +
>>>>>>    .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
>>>>>>    arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
>>>>>>    drivers/media/platform/nxp/Kconfig            |    1 +
>>>>>>    drivers/media/platform/nxp/Makefile           |    1 +
>>>>>>    drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
>>>>>>    drivers/media/platform/nxp/neoisp/Makefile    |    8 +
>>>>>>    drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
>>>>>>    .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
>>>>>>    .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
>>>>>>    .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
>>>>>>    .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
>>>>>>    drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
>>>>>>    .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
>>>>>>    .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
>>>>>>    .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
>>>>>>    drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
>>>>>>    include/media/v4l2-isp.h                      |   13 +
>>>>>>    include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
>>>>>>    include/uapi/linux/media/v4l2-isp.h           |   85 +
>>>>>>    include/uapi/linux/v4l2-controls.h            |    6 +
>>>>>>    include/uapi/linux/videodev2.h                |    6 +
>>>>>>    30 files changed, 11880 insertions(+), 3 deletions(-)
>>>>>>    create mode 100644 Documentation/admin-guide/media/nxp-neoisp-
>>>>>> diagram.dot
>>>>>>    create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
>>>>>>    create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
>>>>>>    create mode 100644 Documentation/devicetree/bindings/media/
>>>>>> nxp,neoisp.yaml
>>>>>>    create mode 100644 Documentation/userspace-api/media/v4l/metafmt-
>>>>>> nxp-neoisp.rst
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
>>>>>>    create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
>>>>>>    create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
>>>>>>
>>>>>
>>>>
>>>
>>>
>>


