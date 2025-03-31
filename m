Return-Path: <linux-media+bounces-29013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA04A75DBD
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 04:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DFD01684EB
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 02:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739A981AC8;
	Mon, 31 Mar 2025 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="gp/7Hb3v"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2137.outbound.protection.outlook.com [40.107.215.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35763D69;
	Mon, 31 Mar 2025 02:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743386961; cv=fail; b=TXkEeA7Joki9JeR/dZz2NEy0vnvHc6uLwwR9LYZ/mcdOUMTxeTTJXRO+hMO7krW8B1sx21+B2BMyRQ4UPtmRkuUSL5jyB9D1iWvGR8mgjKQcaePHZTO/WemNbAOF2ot3c2TAFSguN1tZilURt/YxkPtf/Zt7nVVXAvpqsbuTGn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743386961; c=relaxed/simple;
	bh=HmLSMjPP/88gqeXB1sYxyQw9a5STD+5AijMxW625OKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rg/4yUcc0mHT+I25ijGthka1skQ2D3WORTEHn1ZqEGfTiQ3hvQePh3dmGuDIxESEbkmbJaK2wMsAbsEm+hP+K/a0/DtYJyUejM42gH1twiNc2FafShqeNQIbK9pscx/qqP22zQ834LswVM/DiFz9EhmwRIWV7rKZ8E+EAGQt/M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=gp/7Hb3v; arc=fail smtp.client-ip=40.107.215.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaTUuX5+v/zC8uKP1HhJCVjdICCJ4KfGDMqIRIoAfI+xAHwBDanHkvvWjKbbPc5P6aCm5RqCdq2R0lujRahcCzGUft6MuUJ+rtQVUUfHjMbxYbqHcW1pDwFqn+A0ZdS/ynpexMYvk5orhkI5hQu9ef6uKgfnh8V18C3MhiWvK0Ub+eOs2Eo7ZoAgjICJa0wSTZu3cnK/BBKuSKjTTb7aQqe9Ra5cSnsAOhUB9GfB6CAmrrbrU+4+F6l4Cd34/JYDN2XNPhTbGbGdx+KhVPaIsnGtSNyfOnA23xG1sNsF/G/TRwldlxsJ+iF1KSKSNg5UCH8KfI41iwSalPzuvCebgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN8zYKNcFfnhjDTGtB4ICvIczTtKlOJ/yY5zufwdw2M=;
 b=ynDTW7TOnkZ9uvui50fYuydgi5AX4qtoTo1IdmyqgtxXzD6l8WZmsmmZaomVWvTnUZ/+3WOtIZihkMeFYpjTUrdAexP3WkH+eQAcAeyH/Md+t1slBHjfOUlpl5AQ2sJwFT6+yKPDoOz/UOiBC4IEWYN/Wb3EyKncCtjdxEA6VsbfL4mTKql5laJMo9lN8XW5KceCQ0ru/w+nvaTvWN+O5Y5eMsyx3+rdax/4d9qsP1E5aLwqcyp+ugpj4ep/QBGPL0bPsp6qD83QkW6jR4cJlsg9JYnLVnGHVEp/2TV1u5QBH3FzzJ+k4dKxS/TvAaaw81H7YDth8Z57TG88DdFyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN8zYKNcFfnhjDTGtB4ICvIczTtKlOJ/yY5zufwdw2M=;
 b=gp/7Hb3vXavMXb33jHg8G/guoxFfg2V3aWtMUf8K2/sucqSVAIj03+8yiDTnCxh8FTyqoXhyLRxrb5DehAmVuyD7boCxlffn8UZhR+v2v7n2WOFTh6Vkht15WtOEMKezJlJQ5/OEP1Au3CGDEm+S0Wq4rIO6BeEpExyox6w2oQkwaibhlpKmYSEneA1kp6Nhpila6PcVTBjvzlzmAi6mTjymEr8bzz5mlHjp51cPrOa1w//BMsixsMNGURs0b7rG1E5BLvBYlDHy/h+9lSz70+Vu1Fc2/LC8EFA8w9pHZEYXPHgoJ0S+1VB9ZvQ4QF4hj5rdr8fYLrsC/bBUNUKSvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEZPR03MB8664.apcprd03.prod.outlook.com (2603:1096:101:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 02:09:14 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 02:09:11 +0000
Message-ID: <547512d6-f3fd-4e04-8036-e4188d26de6e@amlogic.com>
Date: Mon, 31 Mar 2025 10:09:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] media: platform: Add C3 ISP driver
To: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
 <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0125.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::29) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEZPR03MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 079ef714-32ff-473c-7c97-08dd6ff9072f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXUzaEtheUIvU0RReHFjYVFqNUZLOG5GL2s4NEpseThYVU4xWVhKdDZlNjVE?=
 =?utf-8?B?dklvRGFVaE1ld0doZ2NSTDhDSmdFeVdUdzZQcmJwRys0UGoydGF0RFRCNXpY?=
 =?utf-8?B?VUNIVzlhdnpjNHBybzNLU0FicmtTMHp5bC85d1ptU1V6ZGhsTkRTeXJWaWJZ?=
 =?utf-8?B?MWhXVStlMEppeEJEUmYwMnFxejdLRFV1SVF5dXZDYmREOFE2R0NQelNFUjBW?=
 =?utf-8?B?amVXNkZNb2NJejczNGRJU3ZOVERLQWg2TVRCVnF3WEc0REVvQ3loenlQc2Ns?=
 =?utf-8?B?WlBySmxmMUtpUy9zWXR4S2ZZTXYwOWhoSDNRM3pSYngrZ0FPckk5VVNOU1Ew?=
 =?utf-8?B?WWJ0QzZDZjc2S2lyVDhZMXZlVGtXald4QVRlMGRhTTBxdVZmRUlyUDVleW1i?=
 =?utf-8?B?OTFVcHlrUGVhcU9DK0hDUmplWUVzbkhKVVJjSGNoOFMxYk5HU1NxNDVseUtW?=
 =?utf-8?B?QmVSRTNjT0dybzVUTE9GdmpZMlRrQWVSTU5HQ3c1U2VucEQ1a1ZrUkdvaWpk?=
 =?utf-8?B?SkV5WkZpLzJZeml4ZWp5S1dIZWRxNWtoMnFxQ2tsWEdqd24xemFtMWtPdEV5?=
 =?utf-8?B?eTYvWUhITjBpUXlrejhVQmdia1QweFJDUHRTTmF2Nk9EemVLVGY1WWtPS2hz?=
 =?utf-8?B?akVyaWFiYmRoQ0VuNm0weS9QNU1qQWZHNHArR1Y1T2VnbFVabTlSZkdXWjl3?=
 =?utf-8?B?R0FYWlF6bFNvV2ZMeUFsYXpRUW9INy9HckFkRnJSMnpHRnNZS014U1JiU0pT?=
 =?utf-8?B?aXVqYzc4WjFMdWd5d1pVRk41dGxyOVZpMUFRMFF1NWlOWU5RRzVVemFhY3J5?=
 =?utf-8?B?bUZVVTRPbWdXNXEwQ3J6anFlWW5WNjJyWHVpUlNaQnBLUGpoKzlvbnJ3cHBV?=
 =?utf-8?B?MC9UZWN6cElHalNMS0w0cWx6b2JKc2hXNWYyQmJRQkkySUt3VVR1dlMzNElL?=
 =?utf-8?B?WkNMNVUvNlNyZ1c3aUNFNFkyMG4xZDU5NG1sSXVHTmFiZFRUOVprWC90TkJZ?=
 =?utf-8?B?dWxESGZTSjRuVXdVSWxZeXBtazEySktEMk1qUDNMOUhVNnFNeGI0WGpQbGI4?=
 =?utf-8?B?MDArL0hsN3NYb0g0S2RjUnNRcnVTZlhYZ0JjUkdtZWZBYm9rVTZZeFV2Wnh0?=
 =?utf-8?B?Ylkvc3FZZEphc2IwYzJNT2p1a1pmZ2dXYXVjVkpOT1lWbVh1ME16cTVGcHJi?=
 =?utf-8?B?V3pGVE1URG5jMXA5VFd3TVNiNVdzZFlCaVduMms3czRWdzkrVng2Q3RYZG1Y?=
 =?utf-8?B?Z1ZKTUFiTmR1clRrbmwxVTRub1dwK3oxdWVoSGYzL3pTZ3d3TWtQVEhnSy9S?=
 =?utf-8?B?UVdld3BRU2JVUVZ5T2tqYW9lL2cxc2FTTDQwYVY5Zi83N3pwczBTTDljTHFp?=
 =?utf-8?B?dzhoWGwvOU5ZdFU1cmhQSXp2Nmd4RlZWTk9zZy9XZDJINUNwazZvVmhYSWU1?=
 =?utf-8?B?NVlRSFJuSklvY3hyRzFKOEozaWFQN0gwdzFYOHhQaHBJNHNMVXM0OFpEaVNE?=
 =?utf-8?B?Q3RXTjJPaXN0NEJSajdKK09DQ2xMYW9EYVFiV00zb2xzMmRPSUkzNWZjNnh1?=
 =?utf-8?B?ZEJrMHA4Qk15U0pJcEFESjVQa1RLYTBNbTFmeFprQ2xUVy93UHZXcWxHMndK?=
 =?utf-8?B?b3NiT0lGdzlUQU5NMjcwRS9EVTZhNmFnWGZuRVdlK08xTUt3UG1JV0EyMGhL?=
 =?utf-8?B?OGtXRloySFIzbGx2eDNPdDFxUUN1bVhTeWZDdEJ2VVlMTlhUVlFTQzl2QmhI?=
 =?utf-8?B?bXI2RXhObC81T1hqekVtV0lzZGFWa2xNYUFPdWFac3RVTVY2VkY5eFZ5dWsr?=
 =?utf-8?Q?ki+1GkGRU5+SII/78JXQbwjYKOz8oxu65o7oA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vlo5MXg5NjhQZ0FORC9ZTXp3eW5oRi85bm5MVS9sUG4zSFpKWS95aGlHd2lK?=
 =?utf-8?B?cTNWVmxrSkhEdlZLa1pQM0FURlJiN3JvdzdadHlBQitiTHVLSm1OMW1RREUw?=
 =?utf-8?B?MERzRTNDVTFkSlFNbkZNbVN6a215Y3Iwd3hCNU9xbDExZkZqNFdsekdXVDNy?=
 =?utf-8?B?d2d0NVl4NDI0bkR1c1dVZ0dCQ1hCb2wvaFBLZUxRREtaMTJjbWxTcFdjRW1x?=
 =?utf-8?B?VGREYUlSRWNOYnUyVU1sQ3RIN1V3bWpIZXNSdnc3Vkcvc3ZJVjh6ZGk0K3pT?=
 =?utf-8?B?NTJ5K2FySDNPcHFCaWx1RkpkNms4VlpnSmpWOUJWczVsQ3k5MnJTNTJwRXFG?=
 =?utf-8?B?VlZDVnhjd09zMDJzMk9YN3gzUStxSW1TdWVOalBVY2FhbnYzZEQwdmpnQk1B?=
 =?utf-8?B?czUrVk5QTDhpMzVWRGZpdzJFVW5Qd1JGcC92SU5GVFZRT3Q5OHg1VmxaSnhp?=
 =?utf-8?B?ZGh3eUV1cG4zaE1Xeko3UDUzUG9mcDZmMEg4MzkzVStQUHJwSnZHTFFCL1VL?=
 =?utf-8?B?Q3NORExicWFRa2hpdVBhMm1halNSMnFLRjh0QmRqUXBiUWxLekxDMi84TTBJ?=
 =?utf-8?B?WkY1K0lSTXg5K1lLK2pTZXNuaDFFa1RmZXZCWlNFWWZNdWRoVkNRUXNEdnk4?=
 =?utf-8?B?RUk1c0NsdUpiNGhGYW8zaEticGpUMkRDV1JCVnQxbDRKM3RGWXVncm1wZHln?=
 =?utf-8?B?dXZreEJpSSs4TUEwbU5LWWxsUXUyTHVKamM0KzE5L3E3Q1pBRlllZmxBc3lK?=
 =?utf-8?B?bGhiTkZyaGwyVEt0eHNlYXhaY1ZPcjNlWUQ4eFowcW5sZ0xlbHkyU3FkTTdC?=
 =?utf-8?B?QWFWZXBPVU1LaUdwak5PZFQwVS9BdnRQZTJONjFvK3RDL1A3dWdjRm9qN3JQ?=
 =?utf-8?B?TzkzenQ3SnZwL2FjL0VENzVYdWMwbVR4RG1YM01OVTRVZE9Ta2ltNWtsQWhx?=
 =?utf-8?B?WjZpc29iNDZYMkRDcWNGaWtSR2ZNd2NMN296RXhpSzZlTG42MzE5MnhFeFJx?=
 =?utf-8?B?cVdrK0l3UTFKd3BlWW5xV1hYTlZ0RE05OC9NNWtvVXZseXo4RlRoWVZ2NzZP?=
 =?utf-8?B?eG1qNVFwWDlSSlNRL1F0alRPalFOb0YwQzhKWWNCZGVYT2wzUysxcG1MNWU3?=
 =?utf-8?B?N0J5S0lVc2VCeHVPVGQrMCt5RTBuTm9tKzhLQWpaNjF4eUNydno1OGo2d0xu?=
 =?utf-8?B?azlzYkExMVlQVURML3BRTWo0NWVGaElpeEpuUEV3WTVNWXhJZXlXSEg0Nld3?=
 =?utf-8?B?L3JrRGQ4Z29UVFhHVEY5NGxWUXdNZTFxSVRyc3ZHZmRCQUJYR2FGVkFabkNV?=
 =?utf-8?B?RmRCc0RPNzJVZkYvdGtjTzhpd0Vic1hCTWZYaHo4bUljMjd1Q0tsL0ltVzEz?=
 =?utf-8?B?Vm1CMldMa016dnQ1Zko1L1M1cXljVElRZWhuNG5uWW5GbW1ibk93ZkR6M0Vx?=
 =?utf-8?B?QmQwc0MzMWNCV2JMdUxONmVyRitnVVY4WXlIdmZ4am5RYkl4WDkreHY4ODJ1?=
 =?utf-8?B?Szl3dkxIQy9GeDB1KzFBdVErK3B1UnRwUEtlY1VMNmZTWWNLY2ZndE94WXlM?=
 =?utf-8?B?RFJkUHkzbWpZNWQzQ0pxSVZKbWhIdVJmQWNPbnlTeFEyL2ZSVDBFZ0d6b01G?=
 =?utf-8?B?MUI4WlgvbEdhZ01lT0JsUmdCUlFDQ3JLVnk2c2tpb01rYWEzdFYya1lIamQ4?=
 =?utf-8?B?WUp5eXFSVVVaOEtwNXJ6QW9WNFN5S1pNQ2NWSTZGazRUTUIrR1hkUVZZZ0Np?=
 =?utf-8?B?TWlMQjd1Q0E3c2kwSzhrVEpnUlMxTzFDeXkwekpkeW43a1B1ZFlsWEJ4UTVL?=
 =?utf-8?B?azdUZ0I2ZStXeWtJWUJEOXRiK1R1WlZyUVJRam1jSU9NNW8wbkRpQ215S1hK?=
 =?utf-8?B?bFJ5OC9IRHlaejNFb1V6TWQ3Q2FEUVU2NDk0cnJTTUhWUlRVelRqS2lvQVEy?=
 =?utf-8?B?ZnJNTURZWkZEQkxxd0V1Z280SXFyV01ES25hMVZzMUVYZytFL2UvbWtSTjRy?=
 =?utf-8?B?cVVGS0lvQWErYlQybVZMUFNtMGZSOE1TUTFGOTkxbFpGZ3A5bmNJME05RWVs?=
 =?utf-8?B?TjhrL3ZuajY1cVM3NXhqNkFJMEdYUG9iazlJTmI3MU9DQjZudkJuRnZsZDBo?=
 =?utf-8?Q?sLc+5siZg+8H9it6jLX+CYHhc?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079ef714-32ff-473c-7c97-08dd6ff9072f
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 02:09:11.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lE79Rp0qTbqR3KITF30e/IZCHINr5Rm0+w18RjTRDxTtHzVlFHylJlMmQpBv0udZNGbKlAr40mXXi3l8wFk5Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8664

HI Markus

Thanks for your reply.

On 2025/3/29 18:23, Markus Elfring wrote:
> [You don't often get email from markus.elfring@web.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
>> The C3 ISP supports multi-camera and muti-exposure
>                                         multiexposure?
>
Yes, will use multi-exposure.
>> high dynamic range (HDR). It brings together some
>> advanced imaging technologies to provide good image quality.
> …
>
> You may occasionally put more than 60 characters into text lines
> of such a change description.


Will check this issue.

>
> See also:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n94


Will refer to this description.

>
> Regards,
> Markus

