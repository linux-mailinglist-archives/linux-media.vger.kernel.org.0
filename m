Return-Path: <linux-media+bounces-38250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36400B0F1B4
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1ADC5643D5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B542E5415;
	Wed, 23 Jul 2025 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eUuwpQLY"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C22E4990
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271710; cv=fail; b=cHjwBv9AtaXTxJGFvj83h4UsavIHRALHCsiVjw7vQ9JgzTMRF4vDBtL2hFFcaSq18X/1sxBWuMmhed656bgzP7cxeG+vaeUSYgdG//SqVT3aOK5QWIB16m81SQiOq6j4YBj8+RyR+Z2rcsBy9v5IWUas/VBIoCuDj6MOy+jdSkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271710; c=relaxed/simple;
	bh=im9HeK9ihwZ2hXPj7bnNDw2j7laZrarmtVifmatrwBA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I/YZ7aIeSD6+ML/FNWmKOF/WH8NFiGcvnt/OU372WTQAK17y1wke6HJJjXDnjsSnok56hi0d/y1XLg2NUwU0o3joiRCb/wVS77tavqH30fnZBkNCztPUvyQ/Mx2UfUnRa+7n0NPBdFjUdm6O0giUE3vCI418PcEYPkPANnymxu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eUuwpQLY; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnfZOUH/UroEp1c/smfDxtpmlMEZpKSIXUlbfmpH6fqZ1J4I7b8qDycKCGQLHEfsOe7aRJELyvPDH2rdRf/MYQrw4Wxjmn1CFOgYoreaTEOHtHBZbcpfgg+06qbVpCbZPCF0/1a4Ye7HFoypxGmibPYvel7Is1lKGUE9jkRG1ynBPdEdBoIPHOyO0Ka+ki/HNVB3a8aS6slzQbaH8ZhtlqQ5eckLfT3MBvUJrGbNBxkykQ+xHaaE3vXMDKeKAl6CCG8iprk5E4ahGXIDWyYrqvRs9f2QeKu0Q7ZJxdiKJqSYi+eDkNtvejRcd40wsG0d+58BYm8u2vyTJ+G8yQBVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms72z7jbRgDAbB0/of323dlJKVlTqbaz5NYCy657AEQ=;
 b=pIQ1odsQsbcsv6IF7F1OL+Eosk24hy2cImP6aZeIbfZZRL6IDwtrkXVzSVONvkom6qWMGdXnWpdsnFpXiNXgUJObTT/XzoA6zE5WtShNgRgb8rpIuhRgQ/+tRWUrIjqb3D50GCsw25oT0YUxprYY5OFa9DJH7TJIaLmr/DgYJYk834Hu18RFw8feD0rUwdHrD3zJEynfPIvxBVrnmJNZRfPc11LFuOEPs9KNzRandu2JjkUMEokp8AFVwayhPs18NS2eTF0aYnCK6c7CRNwt4SeQ5cJFWPTVp5aH2ZFxoXXHO7+mwqfxJRHl5WJIHBUe5a9taxjT/NJlFIs0ZnVxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms72z7jbRgDAbB0/of323dlJKVlTqbaz5NYCy657AEQ=;
 b=eUuwpQLYjEZ86aaIQ1HoiGT7hUe5hPqiKBWTN614GlJiYZQuFmozbS2aUgKOWrz57LXjRK51l/dmMzTfPqiCc7ZJZQqzL1BhwgtNJWBJf72eTkMoOi4urcVjgGd+lXI1duaAtF391xeVeVvqRnpfcd9l4w9nE075sBJKKEb+MlrEb1cOjBE/Hk4G6UUP8rXiQU4Yjf0U+ByT1xs9rQrRrCzWjr2fpZuOR3KOBV/AZMCCDz2eNnNgDGho9QlfAYm8HCIuMpY+JQA4JaET8v9IobntvFttkUveFJEV6DzGLzSJTvozigCN2DxjKVynW0ZHiNTC1FEnYCaYPSEvc0J8uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 11:55:05 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 11:55:05 +0000
Message-ID: <0268741f-379f-4b30-8a71-122d6bd33471@nxp.com>
Date: Wed, 23 Jul 2025 14:54:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 25/64] media: Documentation: Document non-CCS use of
 CCS embedded data layout
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-26-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-26-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0038.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::9) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a52ce34-d688-404c-762b-08ddc9dfc337
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZG5hNHJwK2RzZVcrZlVGRmpLYTN4d3h6b1pQdkpyNEJ2dzBJVVBEanlrM0Zx?=
 =?utf-8?B?a1o0d3NEc0F6eUlwT0V1Z2RXUzRNcDAwY3lackxSMDJYb0pRbnFlcTBtN1o3?=
 =?utf-8?B?RHVtbjhRUjNTQjUrZGFhS0luSDJDYTBLY0gyMk1Xdm1KS0NkWXJ4ak15ZlVW?=
 =?utf-8?B?K3lWZkhNM2tIMG0yTWVPVnd3RFpFL1FKWnl1QVJlb2QzbXlQNzZyWGo3YXd2?=
 =?utf-8?B?UXlhU2VkSzA3MXRqUXVNRHBVVytyalh4S2xGSTZrb2NKUWZ6Z1l0VE1FOXBK?=
 =?utf-8?B?bzEzTjV2dlc3TWdldmxjTzZVTEM2bjNtUFFzZmFzZnlXVzJrdHNydllObk40?=
 =?utf-8?B?ZzZtT2Uzd1dRc0FyWTduVEFwd3RvL2VCWVFDY1JCYjBnUFNIZnN5YjRnUDB3?=
 =?utf-8?B?Z005alB2WFUyTVJQNzBBQ2FndFlwbEJ1WGc1Zzh5cXJsTFl6TWxGQVBMVWdi?=
 =?utf-8?B?NVdYczJ1ZGNSMGZTWW9CTStLdmxiY3hITnJ5UDNmSkRFTXl5Y1JoTEd1N3dG?=
 =?utf-8?B?NWZBR2V5MW91enEyeTEydmJwTk1QQ2VDbEN3dE82MzAwdGdBeXRmTUN2b2Qx?=
 =?utf-8?B?VW56Z3BaTzB0YUJVRGpHWG5ONjRETFpPTmp4ZGhkV1hJaTUzYXliTEdNTU1G?=
 =?utf-8?B?UFR0dzRzS0QwdHlibWUrcDUxcEs0Rjdoclo4R0ozSFpsSFhwMjJLSkNhSDhq?=
 =?utf-8?B?cGlnNGNTdEJlbmkvaGFjNFlhZUszdlNHQzh6RDgydjFxV280dWRBSGxQWWQx?=
 =?utf-8?B?V3dlZjdCVWdOQTRVaEpCeWZoN2wrOFpSSmxUMEJXalptNkRhRmFpamlBbFl0?=
 =?utf-8?B?VGRsS0NvWEFvMVpiRFdiZzlSbGdBbk82VVZsZjhZZXpvdnJHMS9tNkpvakNa?=
 =?utf-8?B?U1EzTEdBMW5SOXdEakpaV0gxQnZLcjZVeldIS0tSR3FwanR2STJGSFp5NHlq?=
 =?utf-8?B?WkprcWlLUFg0Wmo1Zm1iM0VBSWpGblZ4czRaVUEzSmlmUHVqbm01VXgxUmlh?=
 =?utf-8?B?bkE2ZEdib0w4dUsvTEtvamwvT205dWd5amp4WUJDVzVreHRhS1I1QmFtdmxD?=
 =?utf-8?B?Z0lsT2NwbFlkRWlxd1NhRVZUNVFFcldJdzRCT1AwdnQ1WUlET3hjaDIvTDJW?=
 =?utf-8?B?ZzlPRHAxSmZZRnhLNkF4NG1TeUhtNjZ3Y0NIcEQ4bEE4VjR2Q2RnaUxJYlZN?=
 =?utf-8?B?QXYydTVLMWhuQ1pHeVp0NFZrNmpsMk52RWNJc1Y3c0tGd0d3M0RvT3I4UXAy?=
 =?utf-8?B?MURpNVVZUDJjZ3FkNmgzWWdDMFYvdC9aaFhaeXZKNjJjV1BXMkhFbFRYZlVD?=
 =?utf-8?B?RVBkL01HN3lCQjNZcUxoNkpqL0ZMZ2Y5N2ZnN212VXF1TEZmY1FyeG54MXEw?=
 =?utf-8?B?MlV2Q1hnb3U0c1lIb3M1UU52eVJ4QzZ5dmFSN3JlR1NrbXMyMWh0aDlqTEla?=
 =?utf-8?B?b0xleDErSWVaUFNGZkNHdkJZdkdMbjNDMnRDMDJMSUEyS3JKdVBLZTRRUVYy?=
 =?utf-8?B?QnJWVjkvUjdhYXgvTit3RzlhV2dsTDd2aUF2eE9ubFRNS3piYjdocHZhdWhE?=
 =?utf-8?B?VFY0dXAyZVV1bGc1Wlo5OHFxdnhTUTJFcUxrdWJGbEtxTWFmbkxxd3BsTlpD?=
 =?utf-8?B?NSt0aVFaWlNGcFl1N1h1N3Nza0phRjlucVFvY2V6bzlkaG9Hc2FUdW5oK3JI?=
 =?utf-8?B?cDg5Mk91WGFnVDFIVURORDRpTEdSNDhLS1dnS2pJdHZ3enQyQUVWVmR4U2Qw?=
 =?utf-8?B?TGJzZjNYQk1yVkJCQUd0UjhxUks3ZmZUNU92aTFraGUwVFB1VXhFditRSENW?=
 =?utf-8?B?YlhJNHRTVjNWMU5XdGZVQW5BY1V6Q3pKQStLL0syRVpVeE9FL0hiakUwWG9p?=
 =?utf-8?B?VlA1NFVrTFhVYmpjdGxvWGZDeFZvYmVnaThVcUhkRGxMdm56eDhiYXhFTFpL?=
 =?utf-8?B?Mm15U1VJNGpwbFJENy9EWTBLU2VtdDYzN0VUVEN6aUl3NjFoNlIyeDR6aE5V?=
 =?utf-8?B?VStxYTFucEJ3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?emhMS1hpRnNMOFNmNDJ2cENiMjJnaTVQYk9kKzRETHduVWtpamhBSENaZytl?=
 =?utf-8?B?Q0ZOOEs3Slhaekd2MDUvbGVmbUt2ZnUyVVNIdXg2ZytRSm4xZ0lhT0Z1NlBJ?=
 =?utf-8?B?dWt6dTNpTEp3c2VSc25YRXdlTjFCeTdpdytIZVprZTRydnBuTXlBZytyZGcr?=
 =?utf-8?B?V29EdVZ5a1BqWDdNYjEvNDZ0K2VNY0ZTRGRKRmtUS3pUekpBSjNZbVZTelpT?=
 =?utf-8?B?TXMxVVlkMGVrb2NzVWlKalp3TDdqQlRvcjhXekVkQWZmb1B1aFZnZm5TSGpB?=
 =?utf-8?B?eHJEdEZaV1Q1akZKN09JTnE4NFZyRGdZSEtnOGppY0xLVzg0SlNRUVRUcFM3?=
 =?utf-8?B?ejNOVnhsVCtoVHo4dm9tU1VHbkdkUXJLWVFtL0lEWVpQNkdNUWMvcGZwdVlj?=
 =?utf-8?B?eXQ0MUFtcVpZSnNISlc2SkFMNkk0a0NQbjVOU2M0U0F2eS9ucWFOeTVZWHM2?=
 =?utf-8?B?UjBJMVM0eUJITlZncWVOdm9vV1Y1dzR5STdwbWNhYjQ3c0xyL3NrUGZDSW1N?=
 =?utf-8?B?NHNqMGtRWWdyMmZ0eWNreWt1eDMzNmgvRTZWZGpUNWhvN3h2eWpmcEFJMGtJ?=
 =?utf-8?B?UFB3TUJEbUdPWWRIa2dQWjBsQmZDRlZFaFhLR01oTkJ5Zjd4L1lIb0xwMkZ2?=
 =?utf-8?B?b3hsKzdES0hSazB6R0I3SUx0eVA2WTByaUdHZ0hodVd1K3MwcUhNQ3JjYks4?=
 =?utf-8?B?VlkvdXdsblhsNmpsYTIzOUtsS1pacE5KcmtqL1A2eTR6U3JSM1VSMHNUaVFo?=
 =?utf-8?B?dnlOeUVta2dTM0NDNDdKTEZDUUhWN3lFM0FiLzZFYUMyU0ZkdkRVbm8rMEVV?=
 =?utf-8?B?THZXdUQ4cWVOV0VnaFBRMGViQ0RTaFJVQ0hUSFJjZUg0L0tzeEU0VHk4YlE1?=
 =?utf-8?B?Z096bERDWndGYjAwNlJDUndoaGxyM1llTGJRcmZ0V1dCdm8wTzZkRTdQK2xR?=
 =?utf-8?B?cXhkNzNWYXljK2t4TUJvWEY1VGJzNk9HQTBBdnBNa3R3WlJTWUQ5enZEZ0FR?=
 =?utf-8?B?OTgvY3JaUjVOYTJyazkrM2VUc3VSM0ZsK2d6bklHbjJ6am4xTWJIb0kzckRX?=
 =?utf-8?B?SE9RTlV6TnA4M25FNXZYanNvdHFtYzVyZ2I5YlhxeDRnUmhOVlR0eitKNHdu?=
 =?utf-8?B?OVpyYlBDdXlWTzJGRy9IamVkNTJJZ2JyelYxZ0UwaFpWc1VrazlEYWYrSk5T?=
 =?utf-8?B?V1BhcEFpNjBEVnhJSGpHOEYxNzQ1ZXIxa0R5b1l1djBudFJNVmZKZnlhTDE3?=
 =?utf-8?B?V25OQlhlMndPakpZUkE0eThFMDlmMkVrZkgwOVNMSUFzM001eGU5Y0hLcEpu?=
 =?utf-8?B?WnViL1RuWFB2eFdxczI2a1JYcGNLOWR3dVpVZGt6bVgyZmhVWHVqK01MaDNk?=
 =?utf-8?B?YWR4QkVkSU5tYmpaU0J6VnZETlRhL0pwSm1Lb0dxZWFZZG9wZE1OVHhBTEp6?=
 =?utf-8?B?VkVWLzJrRi9iSEdtbGJyK05tRXVoRUR2em5rclRvc1U5b1dIVVdTOXpNb3c4?=
 =?utf-8?B?YzhidXZab3Z6cFRtTTdaYlF2YlBBRkJudEdTalhFb0gyMEZCUTZLWGpBaS9R?=
 =?utf-8?B?SUYzWDB2QWE2SHlVTVdZVkdDcUtkL0cxT1dWUEhrWUJjL3UzZ1MxbGdqaEow?=
 =?utf-8?B?aGtVK0E4cVRvSDlWZzV4MlRISkJvbzZRelArMCtYRWNHNmRuWTBzSng0eUJn?=
 =?utf-8?B?UDN3US9sdjVWeXkwbmZ6dzY1RlpCSG9ZT3F3OWgxNFZKUk8wbGwzNkU2aFJ5?=
 =?utf-8?B?cVZVR1JObUx1N0o1c09USzY2eStUUFcvZU85cnhwMU5qVGlRdnIvM1FOSlBk?=
 =?utf-8?B?d1VIV2p0dC9sWDhLdFdza2JBV2p6Mnp1OFhFWURxdU00Zm50N21WN2tmWktN?=
 =?utf-8?B?RlE2UUVwSFJjWG11N3ZLWU53ZCtLektRNFJ3MmFBRkJlUU4xb3REeHlsWWEy?=
 =?utf-8?B?NWVRV1hsYXpUSGZsVXRsMWUvTzFqWUF0b3FtdjBlY0M1L0I4ZmtDL0c5NzJi?=
 =?utf-8?B?L0w1V0JZWnY0Yk85czFneHhwdWVXMmo4bkFNbnV5RVFud2luYWh6NEhTRm85?=
 =?utf-8?B?ZXBPTzN1ZGVjWncxeHVKYm95U284NHFtQUVhRm5OY3hGc09FSVd5S1Vici9j?=
 =?utf-8?Q?4CVhr9TZKhisAcbCMfLOi6xgO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a52ce34-d688-404c-762b-08ddc9dfc337
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 11:55:04.9010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLV0n7QA/Q5O0v01cIWRquhV7YxeRxAg2krzhqmH2IX/Qu+u1ogVe88MqVu3QlAG9Hq068MULjzitprJFF5gfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> The CCS embedded data layout has multiple aspects (packing, encoding and
> the rest, including register addresses and semantics). Explicitly allow
> non-compliant embedded data to use the two former to reduce redundant
> documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   .../userspace-api/media/drivers/camera-sensor.rst    | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 450e5940c6e7..d9589ad80204 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -136,3 +136,15 @@ In general, changing the embedded data layout from the driver-configured values
>   is not supported. The height of the metadata is device-specific and the width
>   is that (or less of that) of the image width, as configured on the pixel data
>   stream.
> +
> +CCS and non-CCS embedded data layout
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Embedded data which is fully compliant with CCS definitions uses ``CCS embedded
> +data layout <media-metadata-layout-ccs>`` (level 3) for :ref:`the metadata

It this was menat to be a link, it is not working in the generated 
documentation.

Also, there probably should not be any mention anymore to the "CCS 
embedded data mbus code" below, since I see you switched to generic code 
+ layout.

Regards,
Mirela

> +layout control <image_source_control_metadata_layout>`. Device-specific embedded
> +data compliant with either MIPI CCS embedded data levels 1 or 2 only shall not
> +use CCS embedded data mbus code, but may refer to CCS embedded data
> +documentation with the level of conformance specified and omit documenting these
> +aspects of the layout. The rest of the device-specific embedded data layout is
> +documented in the context of the data layout itself.
> --
> 2.39.5
> 


