Return-Path: <linux-media+bounces-42746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7946B88430
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D77A4E364D
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7312E974A;
	Fri, 19 Sep 2025 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="f4MxwtCq"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021100.outbound.protection.outlook.com [40.107.130.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280682E8B94;
	Fri, 19 Sep 2025 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268256; cv=fail; b=eydhCE78mJb9ZiuC16eEDU2stzBpkERDIYLvsF2m6hv9c4+ej+nqNuB5iVfvrxe+FlnCmwW73E9aytu81zHYGjkYZ1U3bpZixN3OL/QzHqwU78+7eawwJK5eUKh6vLWPnwkU5ZGi7GJNK9EDBDvU5/CC2d1odc/qf29Cy5G5PII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268256; c=relaxed/simple;
	bh=3s2orEdmqd/nDwJNUpZifsrvyQexG8GYfI2UmIzG16w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AoP7e9YWHUOUinvPFZcXtpkgMjPBZFbiES0+aghvP9Zr0HjVvp+OHEu3BLyUrz2SdbTz2Qq1llG5IAIlVv3qjlPRXC2DTyDAhgqEyE0HePt9iKOmOuzoU1L9/epjXfc+JLDGvBAcceBemJi5vosX/3pDc3QTbOUBYCPonhmYBsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=f4MxwtCq; arc=fail smtp.client-ip=40.107.130.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpTyWC3KOrOYivlIQlvEVQfkmRSCdnGMS0thQ0OREksAL6sYT+25a6QABkCOCmb5eR+yfzGJWI8XHrIp1P7N1KoWGch14E16/XZZ8ozNaAU31yt02tG5iQ+FWwKmrj4WzhB8u0EWYf7fgyGAZ9IDfGGbu1NYi9RyKHn3aXzFfgBOboIvlZyz/G3mzPCZHLygxLrHzbR3oWbDVjDAQUe5Q9ifj+KmWMGNtNiTT0t0Ocf+aQjyygmtSHVFpGb/dEcrkF+xPTchv5eHVZ6d4j84172xP9LeTl/QEP5rATLiDeNSBsc7oLGdQ0iEi8Tg9e7pwELxTcEQ65lyWvId1ffbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FmW0XrRv5pWbj8Q664a6LdlvW6r5e9Zwf8Ki9h6kmk=;
 b=UbgcrAgWdcNhCeugqx7tfkrff8lMWPYHG4nCrk48TysL9QAj7tlJx2nkD1NDbyTrptsbvxE/FcUgSAdqQ3jzbAs5VTfldXc3T8gSIQTSUNM/insACjs2yet1SYdoS02dXJVjAebyIn/vqUKzps7hbPaIKrgBJJZ6GvAJm3M1vCYG0zPdMzsEYsWcDxOt3t7pUXiASVDtUTB3AQCIKaxrjhsPozkuRDkL68SN4dp7+xAJ9zF3JxkJ8loiAB70kwGL7986MhD3iHdBWV6cV5QNOJUWk7FQDcKTBoHMZm15cwXw9NrO62o1nE1VLmzeV+8LtgKyLjHgYOJVBERQJTpAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FmW0XrRv5pWbj8Q664a6LdlvW6r5e9Zwf8Ki9h6kmk=;
 b=f4MxwtCqISgH2Ykcfy8O63eQpdkuRKPhKCJmGTLhAW8aDJdHRhns+qfnmn52QLBv4NPetDwsKHDhsVdzZQcktMvLfOqXIpe/bggZ891290cMGpZo8+V0xBCdjDqf2DMKSAHMdFIOVG5awNOEyFPmKxFl8p19tdJAB9ho6Fa8+Q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by PAWPR08MB9029.eurprd08.prod.outlook.com (2603:10a6:102:341::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 07:50:50 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 07:50:50 +0000
Message-ID: <5e8fc627-f139-4a80-8f35-ed1563c83944@wolfvision.net>
Date: Fri, 19 Sep 2025 09:50:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/17] media: rockchip: rkcif: add abstraction for dma
 blocks
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-9-af0eada54e5d@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240220-rk3568-vicap-v11-9-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To AS4PR08MB7735.eurprd08.prod.outlook.com
 (2603:10a6:20b:512::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7735:EE_|PAWPR08MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1c8ef2-10c5-42c8-f212-08ddf75140b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0FNM08rK2lIcVNuYm9ZakFMcmNsNEROUVhFd3REWmRMZFFpQ284dmRDQk5J?=
 =?utf-8?B?WjJpa0JGUjQvZTFrL1JxSUJXN0M3UGtVMzRiV29YMFRZUlpjekpHV3VHZi93?=
 =?utf-8?B?SDlrbjV1Rm00M20wdDNiTGp3WVplMWJmUHhEVHhwclBDbkVFSUFQdGxJVVlE?=
 =?utf-8?B?eUJsMnN3Qi9HK2xOMzl4Z2Yvc0M4NGtaUmJVSW1VY01Od3l4MEVHVzcyM2Jz?=
 =?utf-8?B?Q0JFMlhTVEYySEhtbTNHclpsOVh4MHRiVUtZTUVBc0hUaWt3ZnMyK2Z6NE45?=
 =?utf-8?B?TU5pQ0hscFM4aEpFWkRMc0xHcTF1bXN5NHl0QjdYZ0tHc25hOEZNVXptaFNo?=
 =?utf-8?B?bUZnTzVyNEFJSWp1NUtoeGpidU9DQmxSMjQvbXIxUzc5UG1sR2xJUCtIUUE3?=
 =?utf-8?B?N2N2WG15YzQ3SlVvdEFTdExZUUFsZCt6dGRxdzR4YTQvWXhNZVNRaXFjVGFo?=
 =?utf-8?B?VG1QZ1ZzRmk5M01OcXNjTUFGblJvNFl6dTV4MmZ2eFYyRXdvK0RRa255Ymgz?=
 =?utf-8?B?WHFqWkxVcDRFVU5rTTM4MVZtWmZlVEh0bC8ySE1sOG8xUUdXdnlVeFpJdnZo?=
 =?utf-8?B?aEpNaGdzbzBGWVcwUVFsekdjV0RObGhPRDluNlRhYjIxWEg1azF5VllpQlhG?=
 =?utf-8?B?c3hYblRuRHVOTmQ5akVaQWxZY05aN0t5akZqeFBZZHBRamFIbG5DTzJhVXZi?=
 =?utf-8?B?dFFUYUZ4dmdYQ1FMME51M0l3NENTTkdSWXdkN0d3SHU5R1VNdng4Mi9acFR0?=
 =?utf-8?B?VDI4bldJZC9BOUVLdit2TVJodG12aXVMTlRJRVUrZVpONHVLS3NrdVFYcWJp?=
 =?utf-8?B?RVhmbHJNRkZwOWlYRCtIR1VCaDRQdjNubzBTdHF6ZFB2M0N4MEtxYVBZaGpn?=
 =?utf-8?B?Z0VVTWFRQkJNZDNRZUtRVWZRMjIvdUdWVXBRZjlldVkzWmRlS1N5SU1LYVB5?=
 =?utf-8?B?YzY5TmY3L3lFS2ZFSkJuVWIxTEtFU01NeTFaQTgwa3c4ZnZ3T29yQkd0RkJj?=
 =?utf-8?B?UnY4aFVjTDdoTVVCcElERzVYcGcxa29zblFhdUhNR2IvdUVLUVFxUmlQbSta?=
 =?utf-8?B?by9abjJ0VEVFUFgwcVZCU3VwQkM5NkxMSnIxSWlDOElYUW1MOTNhcnBZZ29H?=
 =?utf-8?B?eHpldVFnRHViZG12cXpHVG5WcEdYYXF1TlNSbTIvZ0IycEFaZGdxNkFldlB0?=
 =?utf-8?B?SzdrRi9iU08xRFB0bGpqVHlIR09udFZtWDlCbU1Kd2o1andqWndkR0o0MHdr?=
 =?utf-8?B?b0hGRjVxcHQwZ09EanpWc05uNFNSMkdxSUtrVEhwYVBZKzN5MlVhY3VaeWw3?=
 =?utf-8?B?bHRrM2ZUZUJWeHdXMzd0eFBLbGxFYjNGTGRJcE04NmJpK1MyQ2xHQyt3OENm?=
 =?utf-8?B?TXNEZ0dkOE5sM0pQckh6TWoxSGVUZDhqYmxKR2t5TXg5ZVBGUUIwQVFkdGh1?=
 =?utf-8?B?dURIVXpOOXZXREFmYlFzYnloR1hsY2ErWDRSR3NkeWZRSC81RjJkMHc1UDdo?=
 =?utf-8?B?L0RTRHdDRVNHSFVQM201Y3JuQlczcGJYOGRWekZVS2o1cS9HVXpOVEIzUTh5?=
 =?utf-8?B?OUxESVRtOWp5WDJrMkpndG5ZY1M1OWIweEc5bTdFL0Fac3h6RE1HV3NQUkMy?=
 =?utf-8?B?MzZwSk91YmlLcUpENGNRUlpVZ0lUMkdvc1FZQW1Nd3ZOSmxIMU1CamhiTDFV?=
 =?utf-8?B?czlTTDF1YnlzM2lnWlo1UTYwaEsyNUZUT1I4RXViNEpUd2xKVk9JbUE1c2Nz?=
 =?utf-8?B?ekoxUWJJTFdyN3JmSGozRU5RaUZWWEtteVo2Tjd6a0gyTzh4Vzk2OEpkeGkw?=
 =?utf-8?B?VjFBMFluTW1qOTR3R1AyeXNUbWQybkViU3lzeXBKVE9raEM5a2M4eDJ2Y29X?=
 =?utf-8?B?dEVyU1Y3RDRFQ0pHZEpPV2s2VUVLNXB6Qk54VWowdXF2U05xYU5mRUdtOW5C?=
 =?utf-8?B?SFVjUW1WVW9lQWNUdlQrL2I4U3pXS1dhTzNEVDZkTGJMcVZid053djBlWHV2?=
 =?utf-8?B?cmRTT3N6YTlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjE4WjM2ajh3LytNL1pxY2R0d1c1NHptZU5waUFJb1VHK3JSbjBkQ00vbVJy?=
 =?utf-8?B?M05tYkZZUVd2VkJkbmduWGJaQklySldHT2JhWUUwYUdNMWtiMzZxTTV3ZDJG?=
 =?utf-8?B?NXRoY2VMb1QxQy9LY2VrWEhuY1hUM1BsR25BdkM2WDh2enY0SDFpWVBzeEtl?=
 =?utf-8?B?aEFlN1pxSVpxT05sNmRYSFhtMTNyeEVBWlZEL2FCSk1lQkxpaS9EaFpoZWo5?=
 =?utf-8?B?N2xDTUl0b1NkU01xMzR2TVY4ZnY2K1QwOWltZnQzWUxHaUxJZ1c3R2FuSEVW?=
 =?utf-8?B?d3dEbzljdmhlRWltR1h1K0NQZjdtd2lMb0xjYlUxaXdrZit3cUEycGxKTmVv?=
 =?utf-8?B?RTBsTHJuQ0prdkg1ekpPT0ZqcjVHdWlzNjhtUEdKT3ZqNHZpcHhyWnBLWFZ0?=
 =?utf-8?B?VnlVdXNOZU94cWJOUExHMVYwbyt0RE5SUWVYWFBjU0dCa24ycnNQT2tDOWJR?=
 =?utf-8?B?VmRoRkZRUmM5b3NNYnQwdHhUWG5lcE0yS25NM3N2eVlyWnorUXRXQlFDYkVz?=
 =?utf-8?B?SVRaUWlUTW91alNYbkdqTFNUZFByNHlEcVJpWWNwNDVONjVkNXlwQ00wejlj?=
 =?utf-8?B?bXZUaWlLdXA0Q2gzVTNPWUpRL3kvRjBpQ3pXcG9JL3hPK2UwR3Rza3ZuWTFQ?=
 =?utf-8?B?UEw3ZENvWEhPay9vSEZ5VWJTRUVuMFc4UzM1bWdLVWxSNzZjOUM3QU5IYUN0?=
 =?utf-8?B?UXA1U1F4YlNZSFFHSkFFeitrRjc3NWw2QUFWa2xlNS9SS1NiK2NQNXhtRmJm?=
 =?utf-8?B?QndtdUVOT3pnbnRZbSsrRzdhcjJEdkhaRE00bDAxdU9ZcFU1V3NERFhFNk9a?=
 =?utf-8?B?UExDdGhZRXZYY2xzR1piZVZtSE1RRnM3L2tqbVgvNGxaVndrRVZrMmpDajVl?=
 =?utf-8?B?dHFBT3huTXdvTmx4SllDTDdtWnJrekxOM3BkSlhDZHNuNHU1TE81akRNS3B2?=
 =?utf-8?B?WXcyMnR5a1BBMjcySFBMMlNNQWc5SDdINDBxaHMzcXhqdW1TUVZQMDBrQS9z?=
 =?utf-8?B?SEFnMWxYc1dQSDJWdWtXbmVFZG1ZSWRjdGZRT0ZWVE00UXpPVnpEWG9MNWU0?=
 =?utf-8?B?VXhCNG44a2gvdlpIdnRDdHdXdS9tbVJ3K0hRVGY2dk1HZmpNdGNOODFhS253?=
 =?utf-8?B?aitWSW90UVVxVGdHTy9IVy8zcTluR0dwc3NMdGVpU3VLYUlNOHdXVmZnZC84?=
 =?utf-8?B?UWk5RGIwNnI0TEYzTlVRaE5uTnJ4VGZMYU5VVzhpZWZqTGlNS0FuZW5jclJk?=
 =?utf-8?B?NmU2eXRkTzFRVUJrS0ZFdGFxNGtrWEEyM1RUS0RKWFJaTjFmbUFNQSszZGNj?=
 =?utf-8?B?Wm9jcURUSzNvak0vZzNNWmxtZml3Y2VvSFM2TXY0SktsQ1dLRWtVRk9Td3Qy?=
 =?utf-8?B?RWF4TFRoN0t0amd0WU1mdzQ4NDJNWHU4azd0dVZDZWp1OG12VFk3dUFjcUxE?=
 =?utf-8?B?WVhFRkxCWWhQTzhaSWlIZkZ6WUV6QzI5d1Vrb0Y0V1pLZHgwcStqbGozVzh2?=
 =?utf-8?B?WmorVFpsM0NYbUhMNWMzTkpqWnRXTVdqNWphVFhFRGd0bnhxQWVVbEFXRjNJ?=
 =?utf-8?B?WlhXMW4rZkc4RHVHaHA4WDZKSXd0cnpnZDk2WUk1M0RCOGhIbjhaUllpRWNO?=
 =?utf-8?B?MjFXKzA1ci8wZk5yV0xyWm9jY1FPWk5oQy9RWkQrK0Zha21BRXhvSXZsYXNj?=
 =?utf-8?B?RExwbGNhNlRrZk5BV3BhZjA3RlNseEIyWEpKS3duMUtKaHdSR3lMcHFxNVh1?=
 =?utf-8?B?TG1BbnNJNUlnVEtVMU90dUFQYmJuMHd5cFBPOWQra0ovK1RWUjBIY29iVzVi?=
 =?utf-8?B?dGZudHZjMzYxdTlLMXZVbE5KWEVIK1pPclZDdnppZnh6N0w0UEVOSEtua1pu?=
 =?utf-8?B?U0c0Z0JyQXQ4cDNnMlNuZGlQNWZqL0Y1aDJyV1FxUkF2T2pydVUrVHVFaklF?=
 =?utf-8?B?alRyMnpVbVYzVk5lV2FJVjZHRkZqdDdFK1BDeTJZMHVHRlVUR2NEWGRmYUhH?=
 =?utf-8?B?dWtGSGJyQ0M5KzhJcXo0RUNBL0Mwd3Zqd0JyUWZhK3pXdHNtKzNVQ0E2eEVV?=
 =?utf-8?B?ekZxUzl3SXo0bktxbFdOUU1JWjN3UTRLaEdEL2RGL2o3VU9YYVJuK2RPZ1Js?=
 =?utf-8?B?eVl3RDh5QlVZeWsyelBSdFFjUHU0clZrOTBxbDNKOUQwN2t2dlpjWHZLV1Nv?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1c8ef2-10c5-42c8-f212-08ddf75140b8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:50:50.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjXixhd6b+t0wjb/CfVkyNe5eAhlKxfMqxE1nyGh3c2lp8m4Fl2aWqcgVCIbimKcTPlZ6YdxfY2bZFp3LiWE6TqKnYA/7Il2uuJJkGwZGuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9029

Hi Michael,

Am 17.09.2025 um 17:38 schrieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add an abstraction for the DMA parts and the ping-pong scheme (a
> double-buffering mechanism) of the different CIF variants. Each
> stream is represented as V4L2 device whose corresponding media
> entity has one sink pad. This sink pad is connected to an instance
> of the INTERFACE/CROP abstraction.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |  67 +++
>  .../platform/rockchip/rkcif/rkcif-interface.c      |  37 ++
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++++++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
>  5 files changed, 773 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> index 9d535fc27e51..256335d95050 100644
> --- a/drivers/media/platform/rockchip/rkcif/Makefile
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
>  
>  rockchip-cif-objs += rkcif-dev.o
>  rockchip-cif-objs += rkcif-interface.o
> +rockchip-cif-objs += rkcif-stream.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index a3e052ad885a..395ec7e7e13b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -32,6 +32,14 @@ enum rkcif_format_type {
>  	RKCIF_FMT_TYPE_RAW,
>  };
>  
> +enum rkcif_id_index {
> +	RKCIF_ID0,
> +	RKCIF_ID1,
> +	RKCIF_ID2,
> +	RKCIF_ID3,
> +	RKCIF_ID_MAX
> +};
> +
>  enum rkcif_interface_index {
>  	RKCIF_DVP,
>  	RKCIF_MIPI_BASE,
> @@ -62,6 +70,19 @@ enum rkcif_interface_type {
>  	RKCIF_IF_MIPI,
>  };
>  
> +struct rkcif_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
> +	bool is_dummy;
> +};
> +
> +struct rkcif_dummy_buffer {
> +	struct rkcif_buffer buffer;
> +	void *vaddr;
> +	u32 size;
> +};
> +
>  struct rkcif_input_fmt {
>  	u32 mbus_code;
>  
> @@ -69,6 +90,12 @@ struct rkcif_input_fmt {
>  	enum v4l2_field field;
>  };
>  
> +struct rkcif_output_fmt {
> +	u32 fourcc;
> +	u32 mbus_code;
> +	u8 cplanes;
> +};
> +
>  struct rkcif_interface;
>  
>  struct rkcif_remote {
> @@ -78,6 +105,42 @@ struct rkcif_remote {
>  	struct rkcif_interface *interface;
>  };
>  
> +struct rkcif_stream {
> +	enum rkcif_id_index id;
> +	struct rkcif_device *rkcif;
> +	struct rkcif_interface *interface;
> +	const struct rkcif_output_fmt *out_fmts;
> +	unsigned int out_fmts_num;
> +
> +	/* in ping-pong mode, two buffers can be provided to the HW */
> +	struct rkcif_buffer *buffers[2];
> +	int frame_idx;
> +	int frame_phase;
> +
> +	/* in case of no available buffer, HW can write to the dummy buffer */
> +	struct rkcif_dummy_buffer dummy;
> +
> +	bool stopping;
> +	wait_queue_head_t wq_stopped;
> +
> +	/* queue of available buffers plus spinlock that protects it */
> +	spinlock_t driver_queue_lock;
> +	struct list_head driver_queue;
> +
> +	/* lock used by the V4L2 core */
> +	struct mutex vlock;
> +
> +	struct media_pad pad;
> +	struct media_pipeline pipeline;
> +	struct v4l2_pix_format_mplane pix;
> +	struct vb2_queue buf_queue;
> +	struct video_device vdev;
> +
> +	void (*queue_buffer)(struct rkcif_stream *stream, unsigned int index);
> +	int (*start_streaming)(struct rkcif_stream *stream);
> +	void (*stop_streaming)(struct rkcif_stream *stream);
> +};
> +
>  struct rkcif_dvp {
>  	u32 dvp_clk_delay;
>  };
> @@ -88,6 +151,8 @@ struct rkcif_interface {
>  	enum rkcif_interface_index index;
>  	struct rkcif_device *rkcif;
>  	struct rkcif_remote *remote;
> +	struct rkcif_stream streams[RKCIF_ID_MAX];
> +	unsigned int streams_num;
>  	const struct rkcif_input_fmt *in_fmts;
>  	unsigned int in_fmts_num;
>  
> @@ -98,6 +163,8 @@ struct rkcif_interface {
>  	union {
>  		struct rkcif_dvp dvp;
>  	};
> +
> +	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
>  };
>  
>  struct rkcif_match_data {
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> index 06386144b70c..ef07759604a7 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> @@ -140,15 +140,41 @@ static int rkcif_interface_set_routing(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>  
> +	for (unsigned int i = 0; i < routing->num_routes; i++) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (route->source_stream >= RKCIF_ID_MAX)
> +			return -EINVAL;
> +	}
> +
>  	ret = v4l2_subdev_set_routing(sd, state, routing);
>  
>  	return ret;
>  }
>  
> +static int rkcif_interface_apply_crop(struct rkcif_stream *stream,
> +				      struct v4l2_subdev_state *state)
> +{
> +	struct rkcif_interface *interface = stream->interface;
> +	struct v4l2_rect *crop;
> +
> +	crop = v4l2_subdev_state_get_crop(state, RKCIF_IF_PAD_SRC, stream->id);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	if (interface->set_crop)
> +		interface->set_crop(stream, crop->left, crop->top);
> +
> +	return 0;
> +}
> +
>  static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
>  					  struct v4l2_subdev_state *state,
>  					  u32 pad, u64 streams_mask)
>  {
> +	struct rkcif_interface *interface = to_rkcif_interface(sd);
> +	struct rkcif_stream *stream;
> +	struct v4l2_subdev_route *route;
>  	struct v4l2_subdev *remote_sd;
>  	struct media_pad *remote_pad;
>  	u64 mask;
> @@ -157,6 +183,17 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
>  		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
> +	/* DVP has one crop setting for all IDs */
> +	if (interface->type == RKCIF_IF_DVP) {
> +		stream = &interface->streams[RKCIF_ID0];
> +		rkcif_interface_apply_crop(stream, state);
> +	} else {
> +		for_each_active_route(&state->routing, route) {
> +			stream = &interface->streams[route->sink_stream];
> +			rkcif_interface_apply_crop(stream, state);
> +		}
> +	}
> +
>  	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
>  					       RKCIF_IF_PAD_SRC, &streams_mask);
>  
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> new file mode 100644
> index 000000000000..ce8a743ed5d0
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -0,0 +1,637 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "rkcif-common.h"
> +#include "rkcif-stream.h"
> +
> +#define CIF_REQ_BUFS_MIN 1
> +#define CIF_MIN_WIDTH	 64
> +#define CIF_MIN_HEIGHT	 64
> +#define CIF_MAX_WIDTH	 8192
> +#define CIF_MAX_HEIGHT	 8192
> +
> +static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct rkcif_buffer, vb);
> +}
> +
> +static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct rkcif_stream, vdev);
> +}
> +
> +static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	guard(spinlock_irqsave)(&stream->driver_queue_lock);
> +
> +	if (list_empty(&stream->driver_queue))
> +		return NULL;
> +
> +	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
> +				  queue);
> +	list_del(&buffer->queue);
> +
> +	return buffer;
> +}
> +
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	guard(spinlock_irqsave)(&stream->driver_queue_lock);
> +
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +}
> +
> +static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
> +					      enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb2_buffer_done(&vb->vb2_buf, state);
> +}
> +
> +static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
> +					 struct rkcif_buffer *buffer)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb->vb2_buf.timestamp = ktime_get_ns();
> +	vb->sequence = stream->frame_idx;
> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
> +	stream->frame_idx++;
> +}
> +
> +void rkcif_stream_pingpong(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	buffer = stream->buffers[stream->frame_phase];
> +	if (!buffer->is_dummy)
> +		rkcif_stream_complete_buffer(stream, buffer);
> +
> +	buffer = rkcif_stream_pop_buffer(stream);
> +	if (buffer) {
> +		stream->buffers[stream->frame_phase] = buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = false;
> +	} else {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> +		dev_dbg(stream->rkcif->dev,
> +			"no buffer available, frame will be dropped\n");
> +	}
> +
> +	if (stream->queue_buffer)
> +		stream->queue_buffer(stream, stream->frame_phase);
> +
> +	stream->frame_phase = 1 - stream->frame_phase;
> +}
> +
> +static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> +{
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +
> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;
> +
> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1])
> +		goto err_buff_1;
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> +	stream->dummy.vaddr =
> +		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
> +				DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (!stream->dummy.vaddr)
> +		goto err_dummy;
> +
> +	for (unsigned int i = 1; i < pix->num_planes; i++)
> +		stream->dummy.buffer.buff_addr[i] =
> +			stream->dummy.buffer.buff_addr[i - 1] +
> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
> +
> +	return 0;
> +
> +err_dummy:
> +	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[1] = NULL;
> +
> +err_buff_1:
> +	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[0] = NULL;
> +err_buff_0:
> +	return -EINVAL;
> +}
> +
> +static void rkcif_stream_return_all_buffers(struct rkcif_stream *stream,
> +					    enum vb2_buffer_state state)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	if (stream->buffers[0] && !stream->buffers[0]->is_dummy) {
> +		rkcif_stream_return_buffer(stream->buffers[0], state);
> +		stream->buffers[0] = NULL;
> +	}
> +
> +	if (stream->buffers[1] && !stream->buffers[1]->is_dummy) {
> +		rkcif_stream_return_buffer(stream->buffers[1], state);
> +		stream->buffers[1] = NULL;
> +	}
> +
> +	while ((buffer = rkcif_stream_pop_buffer(stream)))
> +		rkcif_stream_return_buffer(buffer, state);
> +
> +	if (stream->dummy.vaddr) {
> +		dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> +			       stream->dummy.vaddr,
> +			       stream->dummy.buffer.buff_addr[0],
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +		stream->dummy.vaddr = NULL;
> +	}
> +}
> +
> +static int rkcif_stream_setup_queue(struct vb2_queue *queue,
> +				    unsigned int *num_buffers,
> +				    unsigned int *num_planes,
> +				    unsigned int sizes[],
> +				    struct device *alloc_devs[])
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +
> +	if (*num_planes) {
> +		if (*num_planes != pix->num_planes)
> +			return -EINVAL;
> +
> +		for (unsigned int i = 0; i < pix->num_planes; i++)
> +			if (sizes[i] < pix->plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +	} else {
> +		*num_planes = pix->num_planes;
> +		for (unsigned int i = 0; i < pix->num_planes; i++)
> +			sizes[i] = pix->plane_fmt[i].sizeimage;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_prepare_buffer(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkcif_buffer *buffer = to_rkcif_buffer(vbuf);
> +	struct rkcif_stream *stream = vb->vb2_queue->drv_priv;
> +	const struct rkcif_output_fmt *fmt;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	unsigned int i;
> +
> +	memset(buffer->buff_addr, 0, sizeof(buffer->buff_addr));
> +	for (i = 0; i < pix->num_planes; i++)
> +		buffer->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
> +
> +	/* apply fallback for non-mplane formats, if required */
> +	if (pix->num_planes == 1) {
> +		fmt = rkcif_stream_find_output_fmt(stream, true,
> +						   pix->pixelformat);
> +		for (i = 1; i < fmt->cplanes; i++)
> +			buffer->buff_addr[i] =
> +				buffer->buff_addr[i - 1] +
> +				pix->plane_fmt[i - 1].bytesperline *
> +					pix->height;
> +	}
> +
> +	for (i = 0; i < pix->num_planes; i++) {
> +		unsigned long size = pix->plane_fmt[i].sizeimage;
> +
> +		if (vb2_plane_size(vb, i) < size) {
> +			dev_err(stream->rkcif->dev,
> +				"user buffer too small (%ld < %ld)\n",
> +				vb2_plane_size(vb, i), size);
> +			return -EINVAL;
> +		}
> +
> +		vb2_set_plane_payload(vb, i, size);
> +	}
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static void rkcif_stream_queue_buffer(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkcif_buffer *buffer = to_rkcif_buffer(vbuf);
> +	struct rkcif_stream *stream = vb->vb2_queue->drv_priv;
> +
> +	rkcif_stream_push_buffer(stream, buffer);
> +}
> +
> +static int rkcif_stream_start_streaming(struct vb2_queue *queue,
> +					unsigned int count)
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u64 mask;
> +	int ret;
> +
> +	stream->frame_idx = 0;
> +	stream->frame_phase = 0;
> +
> +	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
> +	if (ret) {
> +		dev_err(rkcif->dev, "failed to start pipeline %d\n", ret);
> +		goto err_out;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(rkcif->dev);
> +	if (ret < 0) {
> +		dev_err(rkcif->dev, "failed to get runtime pm, %d\n", ret);
> +		goto err_pipeline_stop;
> +	}
> +
> +	ret = rkcif_stream_init_buffers(stream);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	if (stream->start_streaming) {
> +		ret = stream->start_streaming(stream);
> +		if (ret < 0)
> +			goto err_runtime_put;
> +	}
> +
> +	mask = BIT_ULL(stream->id);
> +	ret = v4l2_subdev_enable_streams(&stream->interface->sd,
> +					 RKCIF_IF_PAD_SRC, mask);
> +	if (ret < 0)
> +		goto err_stop_stream;
> +
> +	return 0;
> +
> +err_stop_stream:
> +	if (stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +err_runtime_put:
> +	pm_runtime_put(rkcif->dev);
> +err_pipeline_stop:
> +	video_device_pipeline_stop(&stream->vdev);
> +err_out:
> +	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u64 mask;
> +	int ret;
> +
> +	mask = BIT_ULL(stream->id);
> +	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
> +				    mask);
> +
> +	stream->stopping = true;
> +	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> +				 msecs_to_jiffies(1000));
> +
> +	if (!ret && stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +
> +	pm_runtime_put(rkcif->dev);
> +
> +	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
> +
> +	video_device_pipeline_stop(&stream->vdev);
> +}
> +
> +static const struct vb2_ops rkcif_stream_vb2_ops = {
> +	.queue_setup = rkcif_stream_setup_queue,
> +	.buf_prepare = rkcif_stream_prepare_buffer,
> +	.buf_queue = rkcif_stream_queue_buffer,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.start_streaming = rkcif_stream_start_streaming,
> +	.stop_streaming = rkcif_stream_stop_streaming,
> +};
> +
> +static int rkcif_stream_fill_format(struct rkcif_stream *stream,
> +				    struct v4l2_pix_format_mplane *pix)
> +{
> +	const struct rkcif_output_fmt *fmt;
> +	u32 height, width;
> +	int ret;
> +
> +	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
> +	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
> +	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> +	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> +	if (ret)
> +		return ret;
> +
> +	pix->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_try_format(struct file *file, void *fh,
> +				   struct v4l2_format *f)
> +{
> +	struct rkcif_stream *stream = video_drvdata(file);
> +	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
> +
> +	return rkcif_stream_fill_format(stream, pix);
> +}
> +
> +static int rkcif_stream_set_format(struct file *file, void *priv,
> +				   struct v4l2_format *f)
> +{
> +	struct rkcif_stream *stream = video_drvdata(file);
> +	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
> +	int ret;
> +
> +	if (vb2_is_busy(&stream->buf_queue))
> +		return -EBUSY;
> +
> +	ret = rkcif_stream_try_format(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	stream->pix = *pix;
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_get_format(struct file *file, void *fh,
> +				   struct v4l2_format *f)
> +{
> +	struct rkcif_stream *stream = video_drvdata(file);
> +
> +	f->fmt.pix_mp = stream->pix;
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_enum_formats(struct file *file, void *priv,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	struct rkcif_stream *stream = video_drvdata(file);
> +
> +	if (f->index >= stream->out_fmts_num)
> +		return -EINVAL;
> +
> +	f->pixelformat = stream->out_fmts[f->index].fourcc;
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
> +					struct v4l2_frmsizeenum *fsize)
> +{
> +	struct rkcif_stream *stream = video_drvdata(file);
> +
> +	if (fsize->index > 0)
> +		return -EINVAL;
> +
> +	if (!rkcif_stream_find_output_fmt(stream, false, fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width = CIF_MIN_WIDTH;
> +	fsize->stepwise.max_width = CIF_MAX_WIDTH;
> +	fsize->stepwise.step_width = 8;
> +	fsize->stepwise.min_height = CIF_MIN_HEIGHT;
> +	fsize->stepwise.max_height = CIF_MAX_HEIGHT;
> +	fsize->stepwise.step_height = 8;
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_querycap(struct file *file, void *priv,
> +				 struct v4l2_capability *cap)
> +{
> +	struct rkcif_stream *stream = video_drvdata(file);
> +	struct device *dev = stream->rkcif->dev;
> +
> +	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
> +	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops rkcif_stream_ioctl_ops = {
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_try_fmt_vid_cap_mplane = rkcif_stream_try_format,
> +	.vidioc_s_fmt_vid_cap_mplane = rkcif_stream_set_format,
> +	.vidioc_g_fmt_vid_cap_mplane = rkcif_stream_get_format,
> +	.vidioc_enum_fmt_vid_cap = rkcif_stream_enum_formats,
> +	.vidioc_enum_framesizes = rkcif_stream_enum_framesizes,
> +	.vidioc_querycap = rkcif_stream_querycap,
> +};
> +
> +static int rkcif_stream_link_validate(struct media_link *link)
> +{
> +	struct video_device *vdev =
> +		media_entity_to_video_device(link->sink->entity);
> +	struct v4l2_mbus_framefmt *source_fmt;
> +	struct v4l2_subdev *sd;
> +	struct v4l2_subdev_state *state;
> +	struct rkcif_stream *stream = to_rkcif_stream(vdev);
> +	int ret = -EINVAL;
> +
> +	if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +		return -ENOTCONN;
> +
> +	sd = media_entity_to_v4l2_subdev(link->source->entity);
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	source_fmt = v4l2_subdev_state_get_format(state, link->source->index,
> +						  stream->id);
> +	if (!source_fmt)
> +		goto out;
> +
> +	if (source_fmt->height != stream->pix.height ||
> +	    source_fmt->width != stream->pix.width) {
> +		dev_dbg(stream->rkcif->dev,
> +			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
> +			link->source->entity->name, link->source->index,
> +			link->sink->entity->name, link->sink->index,
> +			source_fmt->width, source_fmt->height,
> +			stream->pix.width, stream->pix.height);
> +		goto out;
> +	}
> +
> +	ret = 0;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static const struct media_entity_operations rkcif_stream_media_ops = {
> +	.link_validate = rkcif_stream_link_validate,
> +};
> +
> +static const struct v4l2_file_operations rkcif_stream_file_ops = {
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.poll = vb2_fop_poll,
> +	.mmap = vb2_fop_mmap,
> +};
> +
> +static int rkcif_stream_init_vb2_queue(struct vb2_queue *q,
> +				       struct rkcif_stream *stream)
> +{
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = stream;
> +	q->ops = &rkcif_stream_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct rkcif_buffer);
> +	q->min_queued_buffers = CIF_REQ_BUFS_MIN;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &stream->vlock;
> +	q->dev = stream->rkcif->dev;
> +
> +	return vb2_queue_init(q);
> +}
> +
> +int rkcif_stream_register(struct rkcif_device *rkcif,
> +			  struct rkcif_stream *stream)
> +{
> +	struct rkcif_interface *interface = stream->interface;
> +	struct v4l2_device *v4l2_dev = &rkcif->v4l2_dev;
> +	struct video_device *vdev = &stream->vdev;
> +	u32 link_flags = 0;
> +	int ret;
> +
> +	stream->rkcif = rkcif;
> +
> +	INIT_LIST_HEAD(&stream->driver_queue);
> +	spin_lock_init(&stream->driver_queue_lock);
> +
> +	init_waitqueue_head(&stream->wq_stopped);
> +
> +	mutex_init(&stream->vlock);
> +
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING |
> +			    V4L2_CAP_IO_MC;
> +	vdev->entity.ops = &rkcif_stream_media_ops;
> +	vdev->fops = &rkcif_stream_file_ops;
> +	vdev->ioctl_ops = &rkcif_stream_ioctl_ops;
> +	vdev->lock = &stream->vlock;
> +	vdev->minor = -1;
> +	vdev->release = video_device_release_empty;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	video_set_drvdata(vdev, stream);
> +
> +	stream->pad.flags = MEDIA_PAD_FL_SINK;
> +
> +	stream->pix.height = CIF_MIN_HEIGHT;
> +	stream->pix.width = CIF_MIN_WIDTH;
> +	rkcif_stream_fill_format(stream, &stream->pix);
> +
> +	rkcif_stream_init_vb2_queue(&stream->buf_queue, stream);
> +
> +	vdev->queue = &stream->buf_queue;
> +	if (interface->type == RKCIF_IF_DVP)
> +		snprintf(vdev->name, sizeof(vdev->name), "rkcif-dvp0-id%d",
> +			 stream->id);
> +	else if (interface->type == RKCIF_IF_MIPI)
> +		snprintf(vdev->name, sizeof(vdev->name), "rkcif-mipi%d-id%d",
> +			 interface->index - RKCIF_MIPI_BASE, stream->id);
> +
> +	ret = media_entity_pads_init(&vdev->entity, 1, &stream->pad);
> +	if (ret < 0) {
> +		dev_err(rkcif->dev,
> +			"failed to initialize stream media pad: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret < 0) {
> +		dev_err(rkcif->dev, "failed to register video device: %d\n",
> +			ret);
> +		goto err_media_entity_cleanup;
> +	}
> +
> +	/* enable only stream ID0 by default */
> +	if (stream->id == RKCIF_ID0)
> +		link_flags |= MEDIA_LNK_FL_ENABLED;
> +
> +	ret = media_create_pad_link(&interface->sd.entity, RKCIF_IF_PAD_SRC,
> +				    &stream->vdev.entity, 0, link_flags);
> +	if (ret) {
> +		dev_err(rkcif->dev, "failed to link stream media pad: %d\n",
> +			ret);
> +		goto err_video_unregister;
> +	}
> +
> +	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
> +		  vdev->num);
> +
> +	return 0;
> +
> +err_video_unregister:
> +	video_unregister_device(&stream->vdev);
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&stream->vdev.entity);
> +	return ret;
> +}
> +
> +void rkcif_stream_unregister(struct rkcif_stream *stream)
> +{
> +	video_unregister_device(&stream->vdev);
> +	media_entity_cleanup(&stream->vdev.entity);
> +}
> +
> +const struct rkcif_output_fmt *
> +rkcif_stream_find_output_fmt(struct rkcif_stream *stream, bool ret_def,
> +			     u32 pixelfmt)
> +{
> +	const struct rkcif_output_fmt *fmt;
> +
> +	WARN_ON(stream->out_fmts_num == 0);
> +
> +	for (unsigned int i = 0; i < stream->out_fmts_num; i++) {
> +		fmt = &stream->out_fmts[i];
> +		if (fmt->fourcc == pixelfmt)
> +			return fmt;
> +	}
> +
> +	if (ret_def)
> +		return &stream->out_fmts[0];
> +	else
> +		return NULL;
> +}
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.h b/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
> new file mode 100644
> index 000000000000..e50c9771f1b0
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Abstraction for the DMA part and the ping-pong scheme (a double-buffering
> + * mechanism) of the different CIF variants.
> + * Each stream is represented as V4L2 device whose corresponding media entity
> + * has one sink pad.
> + * The sink pad is connected to an instance of the INTERFACE/CROP abstraction
> + * in rkcif-interface.c.
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_STREAM_H
> +#define _RKCIF_STREAM_H
> +
> +#include "rkcif-common.h"
> +
> +void rkcif_stream_pingpong(struct rkcif_stream *stream);
> +
> +int rkcif_stream_register(struct rkcif_device *rkcif,
> +			  struct rkcif_stream *stream);
> +
> +void rkcif_stream_unregister(struct rkcif_stream *stream);
> +
> +const struct rkcif_output_fmt *
> +rkcif_stream_find_output_fmt(struct rkcif_stream *stream, bool ret_def,
> +			     u32 pixelfmt);
> +
> +#endif
> 

Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Tested on Wolfvision PF5 (with Wolfvision PF5 IO Expander).

Regards,
Gerald

