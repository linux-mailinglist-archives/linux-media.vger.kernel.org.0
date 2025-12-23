Return-Path: <linux-media+bounces-49380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B225CD7A06
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 02:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A182A3060F2A
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 01:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1412248A8;
	Tue, 23 Dec 2025 01:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CwGP/3xb"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37BF142E83;
	Tue, 23 Dec 2025 01:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452746; cv=fail; b=Vopj+HvdLRE/hux7hbV29rgGUtw0Sbt02RANcMveR6kMQ7lHmvy6RgK8Jta31HVxPKl1isxzUgMntu9+Vln7hJFb+zSCB7MEpK/KimMmWqT4HGKk6vxYEIbOO/vzZ17DZDcXpg01EfDmw9vowXkU8UP6xh4Q4Zua20pD9/bodM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452746; c=relaxed/simple;
	bh=u8rZbjrZKFl8v7z6tljjDY2yGq6YrKQ6w8Ksjy3eMtQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyZh8DZ0w+G79BMEiB7ilGBW6nGcbgoTLH3qVQ0JeWoHR+D86qx/Hj0AjlRHdBOvm5UhRB4PNBS4CzqRg5q6ktJGfHlFxutbAjJsT+7lIr6SkNx/hS/J7C+YPnx+xkv9qC99V/tp09IwZ4blNZrDywVSRMTsKN5rb0CTibLvno8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CwGP/3xb; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeJX1NqOkGwKrrI9uce0wLEauAUrWVbT2U2t2IZX5SquAYxQeSIa2Nsytd8l+sDMvqXMxB0052udP9VcTFsPf678UiM3STCGYwCPngIcBnrdFYxO0zZb70b624noQ1naZMZqX3W/wdbd1UkUmBEE+EsUQbRlRx02+P7mPesNsTZKpJGgtxxREXqOi5QI80MTCIZzGq7wkWQpI5GblFVGqmICXE76XrfsKO44TZD84baug2YtxYBXh99qyoK7e2KBLq6laD3086+ZulefjWzjIuuHE7LSMOm4+Um1+lv9JTTgR+2m5IG5wpxASuNSYkCXqlA/7t8Y0YWRGJYdKTZbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elNwXEdcQcmASuYwS+WJw0qhcVX8URIeM6OQYsLi/MY=;
 b=ZRZWAOakY5lnAUO6sVyZXK9As/jEZYzYsnUBlbI/fSDHUHlZoGpOGHi3REw0yD8WDQCSwzkVeNwTom8/k1eAkFZP4HGulaHYChSOhYTSVFhC6Rwmp6Rq1z8sBmJq8FW3zodqJhTFOLmAmJHNNB0nyg1U9CvU7zAERZ1gJ0Lo/GhyKaCU7tPAwmpNSs0KRX/YJK0uPH5c3+ao9A36u2IisKmVj9VI7tehFvvcwJKkQ6F1mcHgsWguZTYTN8S/Ny3FGnG+LHlV0PRjF6NUkX/Rv60QtyNEkI9Yji8VTq+U0JZJjBoqMxz/vjCis97Xs4UbdTZUGkk/HcSgZjKRyIGEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elNwXEdcQcmASuYwS+WJw0qhcVX8URIeM6OQYsLi/MY=;
 b=CwGP/3xbhVidSyB1bfQm2dDeNG5bSgkaoKJmTkmcB+dqLlONHx3MZp3VXNhdjXIZUdM4BmcKB9LPeqD935yXYPzI7zF8XPtefJvPB6XioNTX59RKeVNjmdoDkNpxOu1Tg+g9aWoreeF/pzSzvsqTn9H97XGwzyTONmniaMDpZD3VdWmgaQ9GefVXuKrszpuMI2gEg5au1V/rcZ/VpxYOcemaaCEM712RUuArQoYzDvwsSiCNfNd0mZfobLoOv37YBlFs9hE678VCRJtYcezArGCqv0ewCdG+Gm15HpQk3tE0VKBEDkaCJFhItE6Eov4fObvD/benRnw47mxrWT0aqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GVXPR04MB11523.eurprd04.prod.outlook.com (2603:10a6:150:289::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 01:18:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 01:18:57 +0000
Message-ID: <1261af9b-339a-4081-ab95-ad8a4d05636d@oss.nxp.com>
Date: Tue, 23 Dec 2025 09:18:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amphion: Use kmalloc instead of vmalloc
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 Frank.li@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251222084912.747-1-ming.qian@oss.nxp.com>
 <de871401c693088783de5ad8068533ac532a9f03.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <de871401c693088783de5ad8068533ac532a9f03.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GVXPR04MB11523:EE_
X-MS-Office365-Filtering-Correlation-Id: 570583c8-b813-4ac6-dcab-08de41c13e7c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elh0akxXR0lzOEg0ZTdtaGxmdjNTbHFMRVN1VGhtZ29qQXo3bzk5TWtucnIr?=
 =?utf-8?B?NFY0NnM2ejNTMlFQMXQ2eHJEZ0UrL3J6MXZvdUFkTkZJTTk5a2xHbXRYUm5P?=
 =?utf-8?B?L0s2U2RQNlBlVWcrZ0psZHZBSGJGdzVHeWZsZlBEOWNidXhjZXhlRTk5a3A4?=
 =?utf-8?B?SnpTTkFxR3pJWWc4WW9tVjlBbFcwTWhOL3p0TnB0YXgxaEc5Zk9QZ2RGMjhy?=
 =?utf-8?B?dlZ5Y1NqdHFMNTJVOVlqdmFTQ2NrRW5zVW02YUtvalYrd2publB5S1p3TzlO?=
 =?utf-8?B?YklwUGRYbW15aHNTSlZpZy9uOVVmY3JvSU9VQWVTRmU5bk83dWpFTDhvblBL?=
 =?utf-8?B?cnlnbjBkTHhMTUFMOEMyaWxvSityNVd4YnN4VWg5MldtNnFvYW0wREhtYTRn?=
 =?utf-8?B?cnNpKy9CTk1yd1VGek4wamV4S3VIcWJMOHRXUzc4cUFEWGdVeStZNGw4K3p5?=
 =?utf-8?B?R3BRbjhuVGRMeGxEVTd6MXVWRTE5T3VIeUI4OTd2V1FnY3I5d1JKd3B2QkQy?=
 =?utf-8?B?QzZQVnNva1djOW9zTFJLYkZQUHUrTVpjSEJZNUpTcjNPOHZvN1ZXS0oyejRP?=
 =?utf-8?B?MTZ0c05NM2FWODd4UmFWQ09VNEVpYnJmYnpLYjhTSlhzUDNnSHJwYTVNT3lO?=
 =?utf-8?B?RzJMWHptVmFEcmo5ZFJnTmRGeVU4UGVhaWxnanR6aFF5V1pQVHBxRVRlbUwx?=
 =?utf-8?B?UTJubmk2MXFBME1SdUJ6cmxPdEduM20zdVhKRk1RSVNGL2piWHVKVE1kMjhV?=
 =?utf-8?B?akFSZVovaTdyL0RVbW1zR3lmektsQ1hINmZzWUZHSWh1US9Ub1RMZXNUVUFB?=
 =?utf-8?B?dlhySzhhYVdpeU9iVS9mNUFtM28wL1h6OFBYWGYxelNlU1V6a2kwd2JRWHlY?=
 =?utf-8?B?RXdPNGFWem5KWUVaYXZMWUdZQ1VIK3o5YmN5c0JpaXJKUnJXclJ3TUlkYXp6?=
 =?utf-8?B?c2JzZ2JJT0tZYmh5a1AvYnp3LzZ3V2d1RlZXZWNjckdMK0hTbE4zWTJDMStR?=
 =?utf-8?B?Qkt6OUtHc1VzMEN4WksybTJjc3AxQUJlUHZLMXFsRzJPMnpEb05HbjNrZi9U?=
 =?utf-8?B?MkljcHgwTy9EdWFFSFFCUkoxMXBzdnE1aHliaDdrU0FXMlRObGhCbzdlZEhM?=
 =?utf-8?B?bmNkZmpoaEpVYXBZdVUvNGE2Snl0em5SV1ZuK01FTnFCeUUxSStsOGNiTUhZ?=
 =?utf-8?B?ajVqaHpWYVlQOG1RZlpxdms4US9kbzduUmt5Z3FRY010NmYxbjJzeVNkdmhH?=
 =?utf-8?B?b3NwaGxRWFAwL0x2MmJ0OWZKdzdMRzEzUHltanBaWkRXckpnQUs4aEo2S0F6?=
 =?utf-8?B?WWlyRmFtVEVTV1hTcE5adTd0d1VqajVSMWVCdU1xTjA1U0lNYVovZHZXdUw3?=
 =?utf-8?B?dUVIVlRYOElUZG9ZNWFscUFwdXZ6QlRnT25ta3AyUWlScitXeS83OVZ3Nlpk?=
 =?utf-8?B?Zk1VSDVjQmNxZTJyaEpTQTU4WFU2WDhVWUdBMW9Gd3EzaFpRQ2ljTGczb0Jv?=
 =?utf-8?B?QldXMi9nQmI0am01NkF6NFBQQXQ5bU5kVVRLaUpWaVh5aGlydkViN2NCTUVK?=
 =?utf-8?B?MVBMUHBweW5KVWNhSkdqNGVSQ3Fwd1dXUEc0SHpXQURsR2JyM09GU2pWOXlD?=
 =?utf-8?B?RUJVNnNzT0NzVzk5dk8raXh0N2pqTTg3NjlTVGZxbU9lbmJuZXBrd0krQjg2?=
 =?utf-8?B?QURBSjY2Skd3WHBTMVRmMVpjM3NCclRCS0toa0ZKb2p1M29yN2NySzVWNXlO?=
 =?utf-8?B?clZMcm5jMkIxL05iYkczU0NnKzRJQWNhaGlnMWk0NnZwYUJCalh1aHprbXp0?=
 =?utf-8?B?SkpWaFhXTkFGYy9MWE9SUW12MTBsYUJCcnpPbEpzZXp6c1hFbURhR2ZsVFhz?=
 =?utf-8?B?cVo3aW9OTUtnMmZqT2s4N2hmRUFlYnJ6ZUJidUM3c0pTMnlWeXROUWgvdWcw?=
 =?utf-8?Q?r1sp3UCwgDHu2ixshv7HP1aVXdMtrd+b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFN3YjBpeVE0dks4eVVsNU5JRkZjV3QvR0xxU1RNcWpJa3BRR3RhcFpDY2lz?=
 =?utf-8?B?S0pUTFpqWXBFUnJET2NuMWxkcFRyL0dhN2NDMXRGTEdUN2dzVXdadEcrWGpN?=
 =?utf-8?B?bzRUOVpGNEt6QTBkbUFLamZDRmNJL1UzTDhKTHE1UVhPdVFHbjdzTkFpWkEz?=
 =?utf-8?B?QmZmVURBQkhLTnV1WDI5RitSMEVicWRVTDFUcnFLSmFjUUE5aTZrSUoyd2li?=
 =?utf-8?B?U2N2UGMwVWE0TFphd0Eyb3JQQ0pyUHArcURQcERibG5BNkZERkxjbnFHTFha?=
 =?utf-8?B?VzF2WFpjalVqZkRpeGt2RWttUDBnRUlkTjJNMGdGM2hBczZWTit6dk1jY1Iw?=
 =?utf-8?B?eERlR1JWUHU1V2wxVkU0MGZhYlFqa3E2MkpTSGNZbnJkbGtmVkQ2MmFaa0xu?=
 =?utf-8?B?NkVlMGk5dGo1cjFNMzljcmlKNHF2RlQrdEFOWUxEYnpodkFBNDJqcFV1cCt3?=
 =?utf-8?B?a0YvOTZ0ekJzZUNKLzR1WkNBV1J3dnRDU0ZBcXhOZW95OG5hdXJlaDJ6ZHI0?=
 =?utf-8?B?Y2lwUVFaMEJYR0Fib01RWU8zcVhCY0lDM1JUMGhVWmJ3NnBrRzlpaHNmaTNi?=
 =?utf-8?B?N3dQeWxKOWF5azZNZjFRZ0pGNllDUXl5ai9rbWVkaGFpVjZmazVWQkZYWDhw?=
 =?utf-8?B?WFg1akJEYlVVTG9XT1hYY3RrZ0hGVE9YdGJrSTlGdTJPN1JIMFQvbnZlM2pF?=
 =?utf-8?B?ejVxeGE0MndmT1ZnODJNZllFS1ErUldaZk1qOG9XUHp0bVlIVDNGYTUwTk1K?=
 =?utf-8?B?Tk1ObS9kZ242SUp3K3RTNFJBemowbHV2TmE4Tm90OW80a2FJUXRkejl4UG1z?=
 =?utf-8?B?cWlWTEdTb2VOUUU0MCtQeExtRVBkdDh5amYxem9NM3UwVjR3ZWZvbVE5TURY?=
 =?utf-8?B?SE9GNGZlQk5OcXBRNitwamRzRU1HTjZ3ZDU2WloyRnYwZE9lVTNTQlVQdGg2?=
 =?utf-8?B?a25aQ21PWTMycGl2QkU4NlFzNEtQdTJSL3BmRUtzbkYzd3dIWERIOWpJS0F6?=
 =?utf-8?B?MFhOYUR2ZDJHQksyOEM3cG92MC9mU1E0cmROV0IxbjZMTkE2RTJwTmdkajhZ?=
 =?utf-8?B?QmNnbEh1bytvS1ZsaWVTTTh1a0ZBN2h0eGRqbm9vTFc3SUtucDViL0ZtWmJ4?=
 =?utf-8?B?RG8yeTI0Ty9YbzIvb1M1VkpQK0h3TWtuZjVmMFRWeFFuaDFZMTdYNWxtVXNj?=
 =?utf-8?B?M2NlazVNYU4wQjNnMmhFYzN2dU1sL3l0dXFORDF0TUgwTTd6MlJnZVpoWWo4?=
 =?utf-8?B?RGdYVlB4M3dyYzY2NnN5cGcwMlZOeUFaQWFFb3dQTzM5R3I0OWU3Z3RoL1VC?=
 =?utf-8?B?a3JNWWpjVmpwSlpNcDlVMlRGTnc3azlXZUU5OGlkZmdmNkFXYk5EbFVMWW5s?=
 =?utf-8?B?ZmkydngyM2Y5ZVQ3TEZXWDN2RXhHU1NMcTVYKzhVUnZpenRFd1BtNWNEdUFS?=
 =?utf-8?B?L0p0QXZlM3ZKVlpSVFdWL0E1NVYwVWk0SGVjN1RFVDV3T0EvbUswYUtOenho?=
 =?utf-8?B?OEJOSC9jVE8xTHl3R3YwNjc0cjhISEFkc29SVHVweDBTMkxLVERYWUFOWFlU?=
 =?utf-8?B?OGZRWlVxVkFlU291TjdheVRIYmhsMFJCTGJrYmtqOExxRUwrQy9CaVZNVWpj?=
 =?utf-8?B?clJFc3VpamlVN1FrWHozR0NWOHhSay9BOEVHZHZ4ditZb0p4RkRUcXUvWC9K?=
 =?utf-8?B?WitpWDBBcVd5dVB6L1p5WUNTQVY0ODNlTXgzQ3Axd3hGcENBRE5IdjlWd2Ja?=
 =?utf-8?B?c1VRMWtURmJVZFBYNHZURFU1Q0w1RGpNU1diRlkrNlFHWm5SUjVncnpDVjBW?=
 =?utf-8?B?Y3J1a3RneldjNytwckZTYlo0QzZQNFVNQWRXN29FR2hDWm1XcUV5SS9sZnhL?=
 =?utf-8?B?T2svZjlTMUVpVzV4eVpWVmdvSWlvYXM2clBrTzQ5dDV4MXd2Y0tmcFNXLzdP?=
 =?utf-8?B?VktwRW9wL05tM2htclhyV3M3VjZ1SkxjVTFGMkxHWm9FZW1BSHc4eG5ZekNp?=
 =?utf-8?B?dS9PdjZFaDdHY3dqWDZic3FIYmRnWjgrS1NDYW1CbVh3MlNGNnR4NFZkSFVn?=
 =?utf-8?B?eTA2SjRoN2VDeVpDV3RKeGhlRmxxZnRoNC9ob0d6aVZETCtBRHJ3Z3F2MFJv?=
 =?utf-8?B?Zi9ZSWxQTG8xK3hNckRNYkhwVXA1eGRnTWd5V2FWTGw0ZUl0aTc0S0pqcGhk?=
 =?utf-8?B?RGovMW1pM3NhbDN4Um94T3c4bGFCN2c3L0czMlJGSmVKNCttaWJod05ydlJs?=
 =?utf-8?B?aGRxZGNERG9Hc3NPTWZhVWY5bkNGYk9NOUhkajdzUit6Z21qM1V2b08vWGFu?=
 =?utf-8?B?MGU4YzBORWRnRXhWK053OE9VSWg0ZE1MaWplME5STEhHM3ZiczRoQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570583c8-b813-4ac6-dcab-08de41c13e7c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 01:18:57.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7fbNHW2z/Yx90IAT7blvkq8DlgsVB848Afq1ca0yOhS0VIJtRFAf40SFr6xAjW3wXEKBtuxZD3PkpELUGNjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11523

Hi Nicolas,

On 12/23/2025 6:35 AM, Nicolas Dufresne wrote:
> Hi,
> 
> Le lundi 22 décembre 2025 à 16:49 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Replace vmalloc/vfree with kmalloc/kfree for allocating small
>> driver structures (vpu_inst, vdec_t, venc_t, vpu_cmd_t, and
>> frame objects).
>>
>> vmalloc() is designed for large memory allocations and incurs
>> unnecessary overhead for small objects due to virtual memory
>> mapping. kmalloc() is more appropriate as it allocates physically
>> contiguous memory with lower overhead.
>>
>> ftrace measurements of vpu_alloc_cmd() show significant improvement:
>>
>>    Before (vmalloc):  35-72 us   (avg ~45.7 us)
>>    After (kmalloc):   11-26 us   (avg ~16.8 us)
>>
>> This reduces allocation time by approximately 63%.
>>
>> No functional changes are intended.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> 
> I don't see this patch on patchwork yet, I don't know why. Did you get a
> notification or anything ? The patch looks good to me.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 

I did not receive any system notification or reply.
It's currently in patchwork, and I'm not sure why there's been such a 
long delay.

Thanks for your review.

Regards,
Ming

>> ---
>>   drivers/media/platform/amphion/vdec.c     | 16 +++++++---------
>>   drivers/media/platform/amphion/venc.c     | 20 +++++++++-----------
>>   drivers/media/platform/amphion/vpu_cmds.c | 15 +++++++--------
>>   drivers/media/platform/amphion/vpu_core.c | 11 ++++-------
>>   4 files changed, 27 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
>> index c0d2aabb9e0e..7a1c58cac02d 100644
>> --- a/drivers/media/platform/amphion/vdec.c
>> +++ b/drivers/media/platform/amphion/vdec.c
>> @@ -9,7 +9,6 @@
>>   #include <linux/list.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> -#include <linux/vmalloc.h>
>>   #include <linux/videodev2.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-event.h>
>> @@ -17,7 +16,6 @@
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/videobuf2-v4l2.h>
>>   #include <media/videobuf2-dma-contig.h>
>> -#include <media/videobuf2-vmalloc.h>
>>   #include "vpu.h"
>>   #include "vpu_defs.h"
>>   #include "vpu_core.h"
>> @@ -1642,9 +1640,9 @@ static void vdec_cleanup(struct vpu_inst *inst)
>>   		vdec->slots = NULL;
>>   		vdec->slot_count = 0;
>>   	}
>> -	vfree(vdec);
>> +	kfree(vdec);
>>   	inst->priv = NULL;
>> -	vfree(inst);
>> +	kfree(inst);
>>   }
>>   
>>   static void vdec_init_params(struct vdec_t *vdec)
>> @@ -1909,13 +1907,13 @@ static int vdec_open(struct file *file)
>>   	struct vdec_t *vdec;
>>   	int ret;
>>   
>> -	inst = vzalloc(sizeof(*inst));
>> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>>   	if (!inst)
>>   		return -ENOMEM;
>>   
>> -	vdec = vzalloc(sizeof(*vdec));
>> +	vdec = kzalloc(sizeof(*vdec), GFP_KERNEL);
>>   	if (!vdec) {
>> -		vfree(inst);
>> +		kfree(inst);
>>   		return -ENOMEM;
>>   	}
>>   
>> @@ -1923,8 +1921,8 @@ static int vdec_open(struct file *file)
>>   				    sizeof(*vdec->slots),
>>   				    GFP_KERNEL | __GFP_ZERO);
>>   	if (!vdec->slots) {
>> -		vfree(vdec);
>> -		vfree(inst);
>> +		kfree(vdec);
>> +		kfree(inst);
>>   		return -ENOMEM;
>>   	}
>>   	vdec->slot_count = VDEC_SLOT_CNT_DFT;
>> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
>> index aced76401b69..9e5cbc2b0d3f 100644
>> --- a/drivers/media/platform/amphion/venc.c
>> +++ b/drivers/media/platform/amphion/venc.c
>> @@ -13,14 +13,12 @@
>>   #include <linux/videodev2.h>
>>   #include <linux/ktime.h>
>>   #include <linux/rational.h>
>> -#include <linux/vmalloc.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-mem2mem.h>
>>   #include <media/v4l2-ioctl.h>
>>   #include <media/videobuf2-v4l2.h>
>>   #include <media/videobuf2-dma-contig.h>
>> -#include <media/videobuf2-vmalloc.h>
>>   #include "vpu.h"
>>   #include "vpu_defs.h"
>>   #include "vpu_core.h"
>> @@ -844,7 +842,7 @@ static int venc_get_encoded_frames(struct vpu_inst *inst)
>>   					       v4l2_m2m_dst_buf_remove(inst->fh.m2m_ctx)))
>>   			break;
>>   		list_del_init(&frame->list);
>> -		vfree(frame);
>> +		kfree(frame);
>>   	}
>>   
>>   	return 0;
>> @@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, void *arg)
>>   	if (!info)
>>   		return -EINVAL;
>>   	venc = inst->priv;
>> -	frame = vzalloc(sizeof(*frame));
>> +	frame = kzalloc(sizeof(*frame), GFP_KERNEL);
>>   	if (!frame)
>>   		return -ENOMEM;
>>   
>> @@ -912,9 +910,9 @@ static void venc_cleanup(struct vpu_inst *inst)
>>   		return;
>>   
>>   	venc = inst->priv;
>> -	vfree(venc);
>> +	kfree(venc);
>>   	inst->priv = NULL;
>> -	vfree(inst);
>> +	kfree(inst);
>>   }
>>   
>>   static int venc_start_session(struct vpu_inst *inst, u32 type)
>> @@ -1067,7 +1065,7 @@ static void venc_cleanup_frames(struct venc_t *venc)
>>   
>>   	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
>>   		list_del_init(&frame->list);
>> -		vfree(frame);
>> +		kfree(frame);
>>   	}
>>   }
>>   
>> @@ -1151,7 +1149,7 @@ static int venc_process_capture(struct vpu_inst *inst, struct vb2_buffer *vb)
>>   		return ret;
>>   
>>   	list_del_init(&frame->list);
>> -	vfree(frame);
>> +	kfree(frame);
>>   	return 0;
>>   }
>>   
>> @@ -1309,13 +1307,13 @@ static int venc_open(struct file *file)
>>   	struct venc_t *venc;
>>   	int ret;
>>   
>> -	inst = vzalloc(sizeof(*inst));
>> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>>   	if (!inst)
>>   		return -ENOMEM;
>>   
>> -	venc = vzalloc(sizeof(*venc));
>> +	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
>>   	if (!venc) {
>> -		vfree(inst);
>> +		kfree(inst);
>>   		return -ENOMEM;
>>   	}
>>   
>> diff --git a/drivers/media/platform/amphion/vpu_cmds.c b/drivers/media/platform/amphion/vpu_cmds.c
>> index 5695f5c1cb3e..ab69412e0aa7 100644
>> --- a/drivers/media/platform/amphion/vpu_cmds.c
>> +++ b/drivers/media/platform/amphion/vpu_cmds.c
>> @@ -13,7 +13,6 @@
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>   #include <linux/delay.h>
>> -#include <linux/vmalloc.h>
>>   #include "vpu.h"
>>   #include "vpu_defs.h"
>>   #include "vpu_cmds.h"
>> @@ -84,13 +83,13 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data
>>   	int i;
>>   	int ret;
>>   
>> -	cmd = vzalloc(sizeof(*cmd));
>> +	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
>>   	if (!cmd)
>>   		return NULL;
>>   
>> -	cmd->pkt = vzalloc(sizeof(*cmd->pkt));
>> +	cmd->pkt = kzalloc(sizeof(*cmd->pkt), GFP_KERNEL);
>>   	if (!cmd->pkt) {
>> -		vfree(cmd);
>> +		kfree(cmd);
>>   		return NULL;
>>   	}
>>   
>> @@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data
>>   	ret = vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, data);
>>   	if (ret) {
>>   		dev_err(inst->dev, "iface pack cmd %s fail\n", vpu_id_name(id));
>> -		vfree(cmd->pkt);
>> -		vfree(cmd);
>> +		kfree(cmd->pkt);
>> +		kfree(cmd);
>>   		return NULL;
>>   	}
>>   	for (i = 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
>> @@ -118,8 +117,8 @@ static void vpu_free_cmd(struct vpu_cmd_t *cmd)
>>   		return;
>>   	if (cmd->last_response_cmd)
>>   		atomic_long_set(cmd->last_response_cmd, cmd->key);
>> -	vfree(cmd->pkt);
>> -	vfree(cmd);
>> +	kfree(cmd->pkt);
>> +	kfree(cmd);
>>   }
>>   
>>   static int vpu_session_process_cmd(struct vpu_inst *inst, struct vpu_cmd_t *cmd)
>> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
>> index 168f0514851e..85cc4a14f8ed 100644
>> --- a/drivers/media/platform/amphion/vpu_core.c
>> +++ b/drivers/media/platform/amphion/vpu_core.c
>> @@ -17,7 +17,6 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/firmware.h>
>> -#include <linux/vmalloc.h>
>>   #include "vpu.h"
>>   #include "vpu_defs.h"
>>   #include "vpu_core.h"
>> @@ -265,7 +264,7 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
>>   	INIT_WORK(&core->msg_work, vpu_msg_run_work);
>>   	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
>>   	buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
>> -	core->msg_buffer = vzalloc(buffer_size);
>> +	core->msg_buffer = kzalloc(buffer_size, GFP_KERNEL);
>>   	if (!core->msg_buffer) {
>>   		dev_err(core->dev, "failed allocate buffer for fifo\n");
>>   		ret = -ENOMEM;
>> @@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
>>   
>>   	return 0;
>>   error:
>> -	if (core->msg_buffer) {
>> -		vfree(core->msg_buffer);
>> -		core->msg_buffer = NULL;
>> -	}
>> +	kfree(core->msg_buffer);
>> +	core->msg_buffer = NULL;
>>   	if (core->workqueue) {
>>   		destroy_workqueue(core->workqueue);
>>   		core->workqueue = NULL;
>> @@ -308,7 +305,7 @@ static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
>>   
>>   	vpu_core_put_vpu(core);
>>   	core->vpu = NULL;
>> -	vfree(core->msg_buffer);
>> +	kfree(core->msg_buffer);
>>   	core->msg_buffer = NULL;
>>   
>>   	if (core->workqueue) {
>>
>> base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce

