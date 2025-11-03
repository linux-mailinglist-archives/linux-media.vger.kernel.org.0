Return-Path: <linux-media+bounces-46171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326EC29CC4
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 02:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29EEA4E9F82
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 01:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E862B2798F0;
	Mon,  3 Nov 2025 01:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cGOkoTnq"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ABB29408;
	Mon,  3 Nov 2025 01:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762134320; cv=fail; b=cbV6dj/B/HIuRgq87W0MdLj2PrrC19h+onk0CmKa8o29i2JrPAvNiTNlthl3eVkNe2qZdWgkOlAJGXloclKp/KyoDXbLtQso2OR8D7laJSH8Ruy4oYZpcgl66XY0Cvq0/nSkqVGvTkYrt0QpLV+UcL3kAHhFJBTGjBwcxzi+c8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762134320; c=relaxed/simple;
	bh=J557xwA68mFoqd6vqfBmJEzQbutK4LDz8azAFxjooM4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xy2ZUwjXqGb9pbAds+/BMVwtfmn53RKXIk14UMGsiJ1GvEsHnCmH+WAuqpAosLhguXLmrxn9XGL6i3W3za7+RGcAtm+9n3ehDk5bZ4vfPawC81rGfHe9H/fCKTcEfwn+4z89d8EoGRQm/7FSfoUM8VkDWkw8kMgEyaMi9hOj0GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cGOkoTnq; arc=fail smtp.client-ip=52.101.84.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGK88fjnllgq4PjS1LB5eEAkfafsusDBnNQdmZe2ue2rguORC+CLUDFM4r691HLL3Rq6iGgcpBmq+PI6+3l9l5cHLrWuu4zTRwwkOBkE/cFF8ZRjsJzxJnN3OauMj4UR5JbxG9ZHH/goVSu3IShWZbWWeOPv+vQcNwOtWBbaQmQzToFxQ8sgnEH6JqIF5ttz5GXjzoL1SZ6yqqtx5JUWWdoZ09jIPF19dys8XM7hHJnaYr5jw5ztMV6VVxr6Eiz8RP3WcUUts4XLcJbb2x3YYedYT7Av4BzjMxftZ8pUI1Ki2feubeHdUwAg9jhxlAaE1muboO/ZZ4KiZziaLP8q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6eaJGg5qZeqGW/UuMfi9OioezVgZQYvdNPVZUVH1NI=;
 b=we0cidbZJd/EJWflVE6dN+k2ywqLDRFBAD7zmPb0rpDFwkp1gzktqHw4Qhuf/g2g1nkbKmoBHDZREXP3m66od9rXRrlKD1LFgX1EtZFeejsPNr+MIKGkAxmnIylpItz9DN0TuHJn7xHcok2tzX5ca7NlbhnmVdMxmG3KtwQc5nIiOHWN8pHCb0igBc5skX/OsEV/NZo+Di4iLRXFLfxZokWqa8vcNBdVyScXKgkXhTWdLvUFUuffco+lfcQUl1rAepfYWojkNrb8aM26qSKdb9ldh0EHtEDc4EonkpJGEdJ3tfAF+N9lLoZYAzQRu+RmKU1QJlGWzJeWj1Ou6EnD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6eaJGg5qZeqGW/UuMfi9OioezVgZQYvdNPVZUVH1NI=;
 b=cGOkoTnqTUEw45pH9bm7rRM4rTMO12tVH2rfPzQ6c6rEB5bG6SrsHCtdl8wY3Jg6jVE8S//sVRq+w8gE+kEjQgYyKzs+QmIiKsKueW02Wd4P+bT9l5wZl6eMHkNg3rnQdJk5xwcWpuURP7IHGxR7qofkjlrF85ECJZP9R7xfysNlSeQZPfaJ5fMhyob6PzDZNBk9P3nBOpSdilD8fthf1jgicEVudqd4fykqlM2bC+7qaNEIP5UxjoEYJMm4VXdq/fD+vraSWJdOuxB173dBKvkLfIMHYBVeNsfZcASd5ZXmMCHoaK2i1NBUuzTtmc8Sx8XxsBlGD8cP1HQ36kzhew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7485.eurprd04.prod.outlook.com (2603:10a6:800:1a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 01:45:13 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 01:45:13 +0000
Message-ID: <0c68a2c0-7e30-46da-abf1-759a7dbb7ecf@oss.nxp.com>
Date: Mon, 3 Nov 2025 09:45:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: docs: dev-decoder: Trigger dynamic source
 change for colorspace
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250418085422.193-1-ming.qian@oss.nxp.com>
 <20250418085422.193-2-ming.qian@oss.nxp.com>
 <4d1260be46be22d7b40fab9788763af796d118dc.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <4d1260be46be22d7b40fab9788763af796d118dc.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6e3b1d-d9f7-4133-e6ff-08de1a7aa14f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnRqaGo0b1FVV3ptNm9kdGNhT3V0SzI3SGpDVTVOWFZTVTZqRjBhQUYwVzlK?=
 =?utf-8?B?R1daL2JIU0lwLzkxcnhBZnRLSk5VZFJaY3VJUDRvZkZXeHE3ZUlwdFkrNDgz?=
 =?utf-8?B?UkxQQUkyRjZmNnNzVE5acmc2K29XV2dOL05KL3dHNzJxNm1xZlNLMVVOenNU?=
 =?utf-8?B?bkh2akxHem56UWVsOXpodlQ5WnFvazB1QUxXczlFMWFzQ0RkbUQ0MnQxZXRi?=
 =?utf-8?B?Tmp4enAzQnBuSng3TTVHUlo1QzdkK0dCUVY0WGJCSkVXU1FwaWJDalZNaSs3?=
 =?utf-8?B?d2NFdTYrOWJXUEtZWGN1KzNLdnZ4R1JPVlM2bVBEbzJud0c3K2ZrUnc4NmNI?=
 =?utf-8?B?cXRPR0cxMDl5SjVYUjZqYkNGOXZZMy9jQThmR3EvVWFUSDFybG9DZWxaM0x6?=
 =?utf-8?B?UGErL05ycm9XbGNBaHNsSitTeVJmUG5rUjY4YWl1SXh6alFpR3NQb2ZyMXI4?=
 =?utf-8?B?M1pGKzB1QWJqaGU5UjIrNnY4K1p1c29LTU9LeVhUalVQMTFFYVdpcG1HY2dT?=
 =?utf-8?B?SXpUVzhLMDlhcmF2WU5maGg2SXcrQnhkYmk2V01lR09xMWFPTWY3RWcvYlpw?=
 =?utf-8?B?N3FacVo2Y2ZnLzFBYm5VblhqZjV0QXl5VXptbWx6a1dPMWh0V2NjQjdWbzJG?=
 =?utf-8?B?a0NudVIxY3V2ZGJiTThEdnYzUUhqdExQWUs5Q0NlWG02TzN3TmJhRndxT29R?=
 =?utf-8?B?MWlYUVhEY1RxWnFrTHRXM1hmUDVGbUQwWVQvN1h3L29sYmJ4QWpNREh4cWdq?=
 =?utf-8?B?NDJReUVaZjFNckUxY3JaWVdJd0FmMHE4UmJ6b1JnZXEzRkZ2SUlRT1pvSVJl?=
 =?utf-8?B?M21aOVVaeitsZEJNaXpxeGUxbzBBeXY0b2tDWk5iQyt3eWhFbko3MGxWaGc3?=
 =?utf-8?B?bGNXMUtwRW1TNVlhN3crMW50M3U0THMvamR0Ry9wNkdHbG9JU1BKUDBKVDVi?=
 =?utf-8?B?TnJhZ2ZrOVpSS2VqY3lvMVJEaGFhaVo1dE5IZGZPN1JRaHA1NWNhdmlWZS9Z?=
 =?utf-8?B?UXhEeFZDUGZ1SW5qYzVDV010RHIzMVdCRXAzQkl0Qm8vai9TZlNpTDlERU1x?=
 =?utf-8?B?Zng0VXlab2RhcDVkUDVMZTVzelJTUHRXYjlUMkphdlAwcEk5REZqNHR6S1pW?=
 =?utf-8?B?YXJ6cjJRUnhpV25hQTROQ3JRRUdOYUwzOVNNV1NFQVk3OVhkaVZXdWNtbFhC?=
 =?utf-8?B?RWVsOTc4UC9OYzhEM2U0NS9DSjV3VWd3N1cyUXVyUlpnR04wSzJDcU5DeStD?=
 =?utf-8?B?aEFucDc5UU9XYnNxeHkzNEQ3djBubHVrRER4STNubzZ3eVp1bmpOcElHKzlR?=
 =?utf-8?B?NG1kYjE1OTlBN3hGaDY0anRob3lSNkJXNStWWi8xWEltKzVlUlhCWW9pV2lB?=
 =?utf-8?B?MVRGZThvYXZyNGpWRHU3T0lCaFY2ZGtPTmdOa0oxNERjcnlzOUJudWhqK1dQ?=
 =?utf-8?B?dUhkQmdnRnhPSUZQVm5MQzBDWjMvNEFXWHJ0Q0MxZ3ZITlJ1M3VXVXA2TS9q?=
 =?utf-8?B?R3dlaHI3cjFDUGpUMFFvdjhMaWVWVHo1bTFLYm92Rm5zbjk3Unh5dVJnVG1N?=
 =?utf-8?B?Vm9UVkFpWEl1NGxlakxEMWozc1VkQlJtOEFEbGg5eHpZNGc0cjhQWUlJd1JE?=
 =?utf-8?B?ZXdsVmx3czFCcDhZM09zVVZQRFFmV2IvQkVxZEFkYW5QbkNwSk9CelU4Qy9W?=
 =?utf-8?B?YlB0S0h6a252N2ErZnd4NmZsck5aeHJmQXhoTk5SNHB2UktiRG1PVnlDQXZn?=
 =?utf-8?B?Qzg2dE1sTmZZbWdjRmpFMEoyQ1RHS1JZWnBkd0JJTjdtOXh1QSt4bThPVVRx?=
 =?utf-8?B?a2tWblQyaWRWSzAzaXIxYldaRmxXVWk3RFRwcnYzWWxXK0dzQ1c4ampnUXNO?=
 =?utf-8?B?NEZLK2VVMmhNYmd0dnNTVFdQaFRGUlZ1SUVaTUNDcTlNZ2s4N3Q3M0pHa0ls?=
 =?utf-8?Q?qwBCP6HnyaNRglUUZ/Jrv0iiTe8O2dpC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnJNVGZqR1R4bVlDYWxwYXI4K0Y1SHBMTS9HQXJ1SDkxc1JuU3laanhJTmhU?=
 =?utf-8?B?RStIS3lDdTNZKytkUzl3dW1OU1lGQmN5QmpsaW1USUVUWG5ETzZtblhwZWVu?=
 =?utf-8?B?cVFDdG5nRnNuZm1WSW5POVNjaklqYXdHd2pkek1RalZwa1FGWVpLZlJWSlZP?=
 =?utf-8?B?Rlg4TkdIeUZDYkR1dGdReGZxUGt6dTBlYXErbno1K1czdGFtM2JiTTBmeGYr?=
 =?utf-8?B?dkdLcVVxY043NmtjZEJvQWhpd2RkQTM1dEs4ekZGUlNKNlM0QTR1NjU0U1V5?=
 =?utf-8?B?SnZKVDh1VzdRQ2luTEZXVERxS1hNTmZpQzZ3VmdUUFNuUjZSK2U1Z1BmR21k?=
 =?utf-8?B?OE1SK3hBalFqK05xaUM0RmROSU03U1c4SHJpQXU0cTMxWGlUSzJaNktNR1Vm?=
 =?utf-8?B?MjV3Q29sU2lOYTJnNjRUSGtvaisyV3ZlOVVXakJJdWFLZ09PeHhBTHA2TDEx?=
 =?utf-8?B?aklteU5zc1Vrekx2V1FPdGFURDlLVTNWVFcwTHRObFllWjFpODlaQ2l2SjNm?=
 =?utf-8?B?U2xDTjdTV2RSZ2NldzFOR3RqQktlVGJuUnd0U24wQlNhejgxdnh5OG9qYTY0?=
 =?utf-8?B?NXFxMkxONGFVYWV3NE5JVnkxbEtsaE1OSWQrVzJFWUFZNHVnWUk5Q2dIbHFj?=
 =?utf-8?B?NWhzSWcrRUFVb09BVUo3bkVOUi9oTG1JTUtMWVJuWTlnTUp2U0VoYWJ5YWFP?=
 =?utf-8?B?bXJ2TzNWVFZYaTlkdkVGdi9nMzVVb2JtRjl6R3hIczVCV3FUcjhBSmtmMXBN?=
 =?utf-8?B?UjhranIzU0JXcVVQek9TZ1NNYU5HTVl1ekY5ZjB1NFBETFZuallEbmhnWnJM?=
 =?utf-8?B?Qzd4QThRcmVFcmxndGs3KzF5STlPOW4rYmlETzdQR1VqTWM5RXg5bTVSY2dU?=
 =?utf-8?B?SVRwZlBlZUZQUW0yMFpFbDY3Uk9UcndaQk03MFJRTGJTWFJWdEczaU1Zamoy?=
 =?utf-8?B?N0xUdlRMN240dUFibVJQODlLMzRuTmZUS2pRSkNXaXRrclQ5NWthaWRiQWxJ?=
 =?utf-8?B?OUFKQW04eE5QQzZqVjNaVHQ1aTlFdkNmbDlVaC9zakswT1U0VW9namtmM0hS?=
 =?utf-8?B?d2IrQmZYVGg5elJIU2g1WGVxbzg0d2FFcEtocm9iVFRXeGMyKzlrNThtNmZW?=
 =?utf-8?B?L2RBZUxrdEtkVFV0U2dHRFlvVFF6YVpyYUl6cVdTZGlmRmEvbGFyYUhGUkZG?=
 =?utf-8?B?Wmp4S2orS29Xb3pHOVMwMVhPMkhtTzBaQUpGUEh4K3JrMTJMZU55TXlmUXM2?=
 =?utf-8?B?K3pIR2k5dGFmUUlOeGRpdkFzSHdrWmNUYUpqcHZ1TmlPeEJid2FPZW55cFNP?=
 =?utf-8?B?VVBhL2FRUXkzeFRpRmp2TkVuSzlraUFkQ1ZZZ3pjbldmancyRm9zVjcwM1l3?=
 =?utf-8?B?b2lLeGFoZDF6MmJGQlNIQjJxSGxGWmF4WmEwWXJLNjNncjdVbWZ0WU8vZGtR?=
 =?utf-8?B?amZEWFBzems4bm4vazQ5SGRVRE82S0g3UUZtZmZoL0tZSlptdTZBK0w0aFp3?=
 =?utf-8?B?ZzhBZ1IzUHYveXRIcldOZFlEU2I4V0hDWG4yTnpxMVRhemZsQ2JEbzF4bjlI?=
 =?utf-8?B?V0lqVDNYSlhMNzcxa2JBNnhOdDNVNHlGZVhJbFlzT2RNU0dVWE1rNmsxK2xK?=
 =?utf-8?B?dWpUTlpCeXFQaUJ3cGpGNFRUd255OXJQUGt5ck52SGF6R2VGbzBuSmgrLzJG?=
 =?utf-8?B?TXV5b1NLOUliQkJWdmE3RnlTM3JBS0VrMzBSNkd6ZkNSRFZzdGpkTmZqSW54?=
 =?utf-8?B?RkdldWV5S3djcm9tNVY5cjRHSzZmZ3RmNGVicy9COEU4Vkx0cmtmRTFJOEll?=
 =?utf-8?B?Q3N4dHdZc0ZEZFZvZ2F1cEQvYkZ6WGU0Z2pVSmxEV1NjN1RsRHBiSkNPalFK?=
 =?utf-8?B?R0N1VE8veVZzbHhiejgvUUUxdXFvR1A3ZGVadXI4UW9venliMThXbDJNaXlt?=
 =?utf-8?B?VDQ0M0QxQUxxbVpINEhrTExVZkUvdnVrQ3FqNVZkYkNzUHpIYTZFNE1uay9C?=
 =?utf-8?B?T3BweUYwb3JSUE0vSXNHYm12Qk1Mc2x5RDIvb0VEbGtlV1c4Y2xXWTFNK3JF?=
 =?utf-8?B?dUZmS0FUZXZKbWlLd1oxU3NOTCtVUGt5ZGNndW1jZzFCNmdubk5oejJDUVo0?=
 =?utf-8?Q?X+r/VmS5lpHBM37hAwRFEYj6o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6e3b1d-d9f7-4133-e6ff-08de1a7aa14f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 01:45:13.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+4BYbHE6luWMSXuh26B0VtKuxFPptudu+rd+uf2y/P35FySbPl8KtTO3d/wiki4sNbElA0yCyxiNrcR613L2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7485

Hi Nicolas,

On 8/1/2025 11:23 PM, Nicolas Dufresne wrote:
> Hi Ming,
> 
> Le vendredi 18 avril 2025 à 16:54 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> If colorspace changes, the client needs to renegotiate the pipeline,
>> otherwise the decoded frame may not be displayed correctly.
>>
>> When a colorspace change in the stream, the decoder sends a
>> V4L2_EVENT_SOURCE_CHANGE event with changes set to
>> V4L2_EVENT_SRC_CH_COLORSPACE. After client receive this source change
>> event, then client can switch to the correct stream setting. And each
>> frame can be displayed properly.
> 
> sorry for the long delay. While reading this, in any case userspace have to read
> the new format. Why can't userspace compare the old and new v4l2_format and
> decide to avoid re-allocation that way ?
> 
> There is also backward compatbility issues for driver that was sending
> V4L2_EVENT_SRC_CH_RESOLUTION for colorspace change before. Despite the costly
> re-allocation, userspace only watching for V4L2_EVENT_SRC_CH_RESOLUTION would
> endup not updating the colorspace anymore.
> 
> Combining both would be an option, but then V4L2_EVENT_SRC_CH_RESOLUTION means
> any v4l2_format changes, which is awkward. What do you think of leaving to
> userspace the task of comparing the old and new v4l2_format ?
> 
> Nicolas
> 

Sorry for the delay response (I don't understand why I received this
email several months late.)

I agree that comparing the old and new v4l2_format is feasible. And
there are currently four conditions that can trigger source change.
- coded resolution (OUTPUT width and height),
- visible resolution (selection rectangles),
- the minimum number of buffers needed for decoding,
- bit-depth of the bitstream has been changed.

Therefore, comparing only v4l2_format is insufficient. This is much more
complicated than checking a flag. I'm not sure if existing applications
have already done this.

I also think it's OK for driver to send V4L2_EVENT_SRC_CH_RESOLUTION for
colorspace change, This will only incur additional allocation overhead,
without causing any functional issues.

Therefore, from a driver perspective:
- V4L2_EVENT_SRC_CH_RESOLUTION for format change      OK
- V4L2_EVENT_SRC_CH_RESOLUTION for colorspace chagne  OK, but 
re-allocation cost
- V4L2_EVENT_SOURCE_CHANGE for colorspace change      OK

from a client perspective:
- V4L2_EVENT_SRC_CH_RESOLUTION without compareing format    OK, 
re-allocation
- V4L2_EVENT_SRC_CH_RESOLUTION with comparing format        OK, 
additional support required
- V4L2_EVENT_SOURCE_CHANGE                                  OK, 
additional support required


I believe that adding a V4L2_EVENT_SOURCE_CHANGE flag will help simplify
the process and will not cause too many backward compatibility issues.

Regards,
Ming

>>
>> So add colorspace as a trigger parameter for dynamic resolution change.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v2
>> - Add V4L2_EVENT_SRC_CH_COLORSPACE for colorspace source change event
>>
>>   .../userspace-api/media/v4l/dev-decoder.rst     | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> index ef8e8cf31f90..51d6da3eea4a 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> @@ -784,8 +784,8 @@ before the sequence started. Last of the buffers will have
>> the
>>   must check if there is any pending event and:
>>   
>>   * if a ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
>> -  ``V4L2_EVENT_SRC_CH_RESOLUTION`` is pending, the `Dynamic Resolution
>> -  Change` sequence needs to be followed,
>> +  ``V4L2_EVENT_SRC_CH_RESOLUTION`` or ``V4L2_EVENT_SRC_CH_COLORSPACE`` is
>> pending,
>> +  the `Dynamic Resolution Change` sequence needs to be followed,
>>   
>>   * if a ``V4L2_EVENT_EOS`` event is pending, the `End of Stream` sequence
>> needs
>>     to be followed.
>> @@ -932,13 +932,17 @@ reflected by corresponding queries):
>>   
>>   * the minimum number of buffers needed for decoding,
>>   
>> -* bit-depth of the bitstream has been changed.
>> +* bit-depth of the bitstream has been changed,
>> +
>> +* colorspace of the bitstream has been changed.
>>   
>>   Whenever that happens, the decoder must proceed as follows:
>>   
>>   1.  After encountering a resolution change in the stream, the decoder sends a
>>       ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
>> -    ``V4L2_EVENT_SRC_CH_RESOLUTION``.
>> +    ``V4L2_EVENT_SRC_CH_RESOLUTION``, or a colorspace change in the stream,
>> the
>> +    decoder sends a ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set
>> to
>> +    ``V4L2_EVENT_SRC_CH_COLORSPACE``.
>>   
>>       .. important::
>>   
>> @@ -946,6 +950,11 @@ Whenever that happens, the decoder must proceed as
>> follows:
>>          values applying to the stream after the resolution change, including
>>          queue formats, selection rectangles and controls.
>>   
>> +.. note::
>> +        A ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
>> +        ``V4L2_EVENT_SRC_CH_RESOLUTION`` will affect the allocation, but
>> +        ``V4L2_EVENT_SRC_CH_COLORSPACE`` won't.
>> +
>>   2.  The decoder will then process and decode all remaining buffers from
>> before
>>       the resolution change point.
>>   

