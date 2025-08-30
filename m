Return-Path: <linux-media+bounces-41369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 450ECB3C946
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 10:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D33D7A6C47
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 08:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8202D26CE1A;
	Sat, 30 Aug 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="nPqNChiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013027.outbound.protection.outlook.com [40.107.44.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF49C2FB;
	Sat, 30 Aug 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756542324; cv=fail; b=VqGe4idtA2eS7aJJjV0UcWVhMiZxgE034tH373OZ95zMh6l7kQAeAHwk1KNRrN522BsEXTVHCHXdou0XAq/ECdpCSccJavKshK9Dy9G8fyxn4TPbSIcQ7x/NsXJr2NvSF8+BVpBslvdKDbOS7Kcwk5PIFRNgD8F/df1W8xLbkWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756542324; c=relaxed/simple;
	bh=0Vn+ynz51W50SO7l02EXcaGm1pZto5LgbpdiQDrDnT0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fqa6b4nw5IszrUEF9s9GivDJRQF7VHZWmqTao7jd/XqO3dNbamuSObuQjGbkeNW9j5JxXaEwshepm5lNxqC2WWLWzyQWn8ZAtIS5d1oh4POkoIrQy1wYrNjVf/9vCKs6Pwvyqy70ltR4pHZEWoPuT+z0wF3jENsUFHS7X3fxsbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=nPqNChiJ; arc=fail smtp.client-ip=40.107.44.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz8zR5M9x+c0C51FaD8A5LpewYAERewFgRgPGgfwd/cIJibVowbFrduurybCkKH1G/SBPyMy69GKvqMBNybLTlEkzp23/he1w2lX6XZGx4ci/4p3funxWb+CsiMSkd701zfrggs2kJhevZSm18iKfHo6kepza+TAtSVSb4yuOYMoWbtV4naz2kyUlV/sf8en6vehPD7zEhmf6v+x6HMij+72WeinpupErpt6L1/JrCzwIXCAxGDNGueMbHXZAFsbKhyHtoGQ34xXhWSYF50k9WygrFH8GHlReyslItCs+N6wuiz013UedGrY57oVxy5LkYVIipTlJIAKvp6I5c/+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vn+ynz51W50SO7l02EXcaGm1pZto5LgbpdiQDrDnT0=;
 b=m/gVL3KUUy6sgKeMBPLhzg8u6jYtmYiHnhN7yVPVJDYq3R9OX58IBgNavjI/KO2BXO6L83Kz8h0ERzA2BVER9YUUPtWwddeycTclPU0EkmKe081OyssInVCeZNgrA3H74we7OCIMcVYNImaidG2u3sPkCaQLnP3Y869QHOeYnOSeTx1mrWd+heFg1Nq97tf36KJ80r+z7p9iX8OZBKOHARWFMsB8DT5icls605rpL708y/eaGob2l53/2FWm2w2eBgGJO4LZRhSPd/+1Sf/eNlVtt8kntGdCm93Q86dNsa14h1sCOw7kZM7tZsJm3xkRGYS/JjEDmYe7sHEyawE8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Vn+ynz51W50SO7l02EXcaGm1pZto5LgbpdiQDrDnT0=;
 b=nPqNChiJY2wownMxfG3kp61fZvrBybbUTswoF4PerPGkNlsR5f1CATLlm7ALNl5Jv0EEQ15sDyHb1R49ZLsAJjrDXgxfq29L/juLNcy7AE+6STTgt3yYBHY7iKj43xIwSoFCXhFIYCbgFbgsSCCddHgksfV7MCN5KIXaSfFaSTYZGLRi9sm1YJDXuZisCtXjIf7iFlFNWvVz6g43bO+0lD8l3Le1OdjnYF4rH761YGBEa25fHHv8GcDK70L1Jh6SKYs2xn9D3d8D8d0FbH9383shpauh+A6NKvW3BlyZKK7O2M4GqcZFN8Qs7zyaCkMJ+YgfVeGA43wPgu9hrp3Qkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYUPR06MB6027.apcprd06.prod.outlook.com (2603:1096:400:351::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.21; Sat, 30 Aug 2025 08:25:18 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 08:25:18 +0000
Message-ID: <536ceeac-a180-47e1-9664-a047929ec3d7@vivo.com>
Date: Sat, 30 Aug 2025 16:25:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
 <d76038453bfd06ea9d0c90e7583078abc85ce280.camel@ndufresne.ca>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <d76038453bfd06ea9d0c90e7583078abc85ce280.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYUPR06MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe3eb96-aa29-4a18-4137-08dde79ec102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWFleEtHOVcrUnoxN0xBelk2Wk9FYmRSNDEyNzQxOFQ0b2d2RWpRY1lNWHlO?=
 =?utf-8?B?V3B1SXY1UFY0bTEyMUVWWU9YQnVlWDRmKzJFUFAxWHAzY0IvS1V3VUp4ekFY?=
 =?utf-8?B?bXF2cWcrVFQxVVRSdHJWejIvTW9ReFV1UFRoV0hueHRQQnVTcGdCMENPSTZX?=
 =?utf-8?B?N3FsMWN5VHpJcnQ2VlJkN3VPYXZkSEozbS9GYlRPeGdQSTVUVjY4YnQwTkZ1?=
 =?utf-8?B?UEo3V2R1a0g2RE9EZDBmS2hqU0NtczhDZVlBcWxjU0g5eTg4OEc2aEZCSHlS?=
 =?utf-8?B?WnpaZkpzSGlMdWxYRi8zc2poWW43M1JGa2FrRlhYdjgySGpFMk9kRGpOR3Na?=
 =?utf-8?B?VDdwRW1Ma0NPRXg5K2tjOU00aTJzeG1tdVJGdEZyUnE5QUh5bURPVkkxRnFi?=
 =?utf-8?B?bkNBS3lCMzJkZTBvQ1BZSW14TVVqYWNGdm1kelFxd2FKbkord291Q2NCbEhI?=
 =?utf-8?B?bVBDUTBwMi9pOFVJM1c2SFhhb3pXSmd6cndNdVpiVCtqb3dONDVPTnBqRUdk?=
 =?utf-8?B?cmViMkVCVGN5M0pUa1lMZWRoci9qZjU1bjIrclhTSWRHV044RlhGVjY4Sldu?=
 =?utf-8?B?MVo1ZnN2LzNYTjJINHZ4bzlmY25YOVhQZ1VBcUwzcVE0NjRUWnlXcEdtOWJO?=
 =?utf-8?B?QmxDTjMwMjB3STcyTFFDTks3bXF2SFZER2daQ0RscUMvUXNuTFA2dU4rVXFL?=
 =?utf-8?B?dnJPMzZhcm5OWkFvT2lMNUJacnlIKy84YXo4SnZFOEFQNnhLM01QdTd3Wm5o?=
 =?utf-8?B?N1FnVGp4cDdZeE5CK01PaE9GRmFlZENDZmRZRzhsSHJuK3MzQmg0dkNOZFlk?=
 =?utf-8?B?OGRxa01aTmE5RmNuQ25mQ2hzWVRJdWx6QUJ6UWhHK3BGS09ERUx6OVMybE5j?=
 =?utf-8?B?Z1pzZXZBSTJ1b2pUZExYMCtlTVJja0t0MTNkcGNoVUlCS2FpMzNYdWJqMnkv?=
 =?utf-8?B?MU1LVThFOGt1d041Y1FNMHc1WXJxcG9ZazVtNytteEU1Q0d3amNGbVhUZ3ha?=
 =?utf-8?B?Q2Z3c0Z4QW45U0dMNmZsQjgyNm9EYWpzaG5oRlpuandOYkhyVE1NdWtLZFVH?=
 =?utf-8?B?eVRCbVVWN3hVdGs5aVBxblN4Tlo2UkpGL00rQjREU2xkSzdqRS9oYUgrNC90?=
 =?utf-8?B?cWs4NmdxOGdNZTJNcU1NV09SMkQxN1M4WXpoTEVCdElRUmVZRDlGazFLUUZa?=
 =?utf-8?B?QzVPSFpZYXIxUzdlZFFtUkZVWUJMTk5nRG1hTW52Qkw4WmFkSlA2Z0xINW94?=
 =?utf-8?B?djJHVi9OclZsVVJ3S2lET2VWZEF5SFJRWXh3TTdyeC9rYU1uSHo5KzNRYjlS?=
 =?utf-8?B?ZU1CU1gwSmFFUXpiRm94Nk5QcEszeS9DRjNoWmhUZ0tzUmt3Uk1EaENNak5h?=
 =?utf-8?B?ajgwamNXdTRwbXdJb0VXN1R4NkhEa1J2RFlCbGlvZzA5QnZNTkNwNWVVb1pk?=
 =?utf-8?B?YkZUQnFKY1cvMWRsbzlYdy9jS1pKcjRmamM2dHBiVTRNWllEVDdDbEVHQmJq?=
 =?utf-8?B?RmE1anEvQUhpc1pFTkdSMndDZ3VmdmZKdGdkT1pFZHpLTUVBaWR2Y2pJMlRp?=
 =?utf-8?B?MCs0dlVRaVc4c1lPNHphbEh6dkVkK3huNkV0cEthQ1VzQ21wQnR4MnRmMy8y?=
 =?utf-8?B?SEFndjBIM0xMaDVERWpFVjFEenQxMHpLWnJaQy9jdTlrdWU1d05Wcmc2WE04?=
 =?utf-8?B?RjVZYXozOG1pTmV2MkwrckZuOERMRStSRitlZzh3dVdNUVhKMzBHdnJXLzlx?=
 =?utf-8?B?UWQxNnNBUDhVL21ZSzFDdFhWZ3lxeFNqbkJlcEZvZUFDdmIxWmJ3RUx4WXMy?=
 =?utf-8?B?ZkxzUDg5bzdlUWZodStMSWhvRU5IRGdqQVRsVmMxUDVoRFgxTUtCT2h3QUxk?=
 =?utf-8?B?TUFxbnAzdXdYVzZUL0dWcjI3TEh6N1BreHhIYUdrazlIRDRFbk5vRDgvZDZU?=
 =?utf-8?B?VkNadWNNcjlONmlDY01ERjRWUndaUCtYQUJwZFdwZ1NHZ1FsU05KRmJ6ZGQ3?=
 =?utf-8?B?c2d2WWt3emRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czlvUmNEREVLMlhMNVhlSlA5UGs2bHdUd3VpUms0QmVHYi9iZjBXSnJuMGtE?=
 =?utf-8?B?RTJvMitRSEVlRkYvY0cxQmVCTEhVeFJuTStrNUxud3Q4anFVQ0k1cmgzTFpl?=
 =?utf-8?B?YlJhUVNKcVMzclVtWnZFSzBIaHhrcDRuNDJJTVdkQllEOU9pYk5TOElRV2ox?=
 =?utf-8?B?eG9VL0tMZm5FaTllcFlXK0tyUk1mdnpwYkZxRTl1VVFYc3ZiOEZXOXRWcngr?=
 =?utf-8?B?S3Z2emk4SWlSUm5RYnJHc1V4a09aVEhEcmdPalBPcjJVMXFIdXgxMm82MkJa?=
 =?utf-8?B?ZGhPQkM4RDlWT1psWFA1V0lESVFrL09tMVVqeDhwQnppdUI1Zkd5aFI0Q1NM?=
 =?utf-8?B?SGJTSUVwUC9ZK3VJYmZJZXl0YVQ5cXI2VTFUVVdMZ1dWLzBsYUNTWmlkS0dn?=
 =?utf-8?B?b0h5eDZ5TnlJc3YvUjVTOHlidFRUajl3dEVJNVJzYlZrVXZTdFEzMm9Mbldx?=
 =?utf-8?B?RmJkZmFFU3VRZy9rZ0lWWmJ5VTRRanEzMHdHUHB3QXM4S2NGVkNNa0YzZ0pE?=
 =?utf-8?B?OHd1UzFaMzRlY2ZQTHNkdHlCeDIvL3NoWmw5TVRCOFlzOTE1VFh1VVpiUDF5?=
 =?utf-8?B?Y1ZNeDJwazFRVU5lei9BUkg3WWQwT3RCbjliZy83MklYS0hUK3VxZWVNWUFO?=
 =?utf-8?B?MVBwUU1TYzFtMGsyMDJHc0Q1YmJyNTEvNWpzRDcyMzU4VXh0VUErOEtmQjd1?=
 =?utf-8?B?alBjSGt0MTc1UXBLZ0xSVlZmZGxaMmFhVXVmb0tHUi9CbTV1c1phV3hBYUlm?=
 =?utf-8?B?a3BwOUVHVmluaWJGdG1udW9ZT0djbjV4WWZZMUJuL2xUWE5wWXQ1Qmh2YUFS?=
 =?utf-8?B?cEloOFlIV1prRDgyak04U3N2UWprVjloL1VrZG5TSmsvdEczc1FHSXVVcU14?=
 =?utf-8?B?d2pTc2pPR1lnV082NWRIemtvdlRmRkQyYzg1M3ZrVFRxaVBNdnZiVUlPVmVn?=
 =?utf-8?B?R2daLy96TEQrR3VKdGl3N2d0YTFHTEZ5UlBVZ2NNdTdMb1gya3ByM2E1a0dQ?=
 =?utf-8?B?bHVGWUVmcUdrVHVqaTBuMmprN0xSTXdZMVp0T2dlVXdScVhwYTQyMkFCMFcx?=
 =?utf-8?B?TFF6eHRwRk5UNW8rWkZ1aWNjZmtObkZQVnlFdVZqNW84SW02bXRpYTRRczhm?=
 =?utf-8?B?dE9rbWd3V05NWmFwcnEzYnEwbzVJNHR5MnBtK05ZaGwrSlJXV2tDdmFLa01z?=
 =?utf-8?B?QVQ5NXpySTFWUGFFYSt1a2FmQndleTRqaEs2Sjl1Wk5kN09hNTNvOC9TK3VP?=
 =?utf-8?B?cVkxN2tuSTJzWSs4Q3cxOHp0YSsrZDgzaUIrV0duT0V1UHhQSS9kSjdvRWlH?=
 =?utf-8?B?ZzVzVWowdldEeXBCTmNmM1ovTUpyR244WDJVZ0E3Um5RMjJlY2E4c2lPR0Q4?=
 =?utf-8?B?NjdBMFBWSXJYaG9FVUplbDZwL0RURjh2NkFtTElDVU85SHNnd0NCaDB1WEFS?=
 =?utf-8?B?K0kzRElPZURrVVUzUllON0phZk9NUFhESmVNWXdTVTEzdHNwTkpYT01mWVRN?=
 =?utf-8?B?UmYwemdZUjFiUFcwWUpiVkJsVTc5a2U0YytxYnI0R1c4T3FMUnhDSEVuUGRM?=
 =?utf-8?B?VzRQNk9zeVpJTFgyM2ZKV212U2hhVllrTkZYNFpRd3JLS3l2bkt0SXY1bnVF?=
 =?utf-8?B?YUdlRm5zZVg1N29yYjFUa1FwRHpWMUc3dU8xZ2FNUi8zMHVlYWFId0EwNlpF?=
 =?utf-8?B?YURMTVIzMk42ZXlMMEljWi9FQm5HUU4yVXJiU2xxS1g3VnFhZkdTV1A3UDRL?=
 =?utf-8?B?RVBWUmpxTWVGV0xQcEhvbGMwTzhCVWxjWWJBd3gxaER1cWxxQTl2ZUFkUkhZ?=
 =?utf-8?B?dmlCajJXdU5aZFp0ZU5Edm9qYi9JWHpnaVFRelRTM28yenREZFhaZ0F6RjJi?=
 =?utf-8?B?SkZNcDBLMEgyTVhydFoxWFpPVEUwUStzVGRVL3RzMnllNG40VUIrYjJDZGZt?=
 =?utf-8?B?Nk1tVWw2YSt3Rzg3T1dzekxuaUlKTzYyTW5neENmd0VXNjl2RVg3ZC9Zalk3?=
 =?utf-8?B?MGkzaVROckdWNCs0NDNyMlBTK0JNeWY0UHZUUDlDcnRseVR4ei9IMmFaQUpD?=
 =?utf-8?B?Y0N6L0d2ckdOMEt0c0wxZm1ESWc3aXowM2hyNis5bGFkVzRmQ3FZWjl0dVlv?=
 =?utf-8?Q?f4wUSnvd5uRRJ+jJa7YSP7k57?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe3eb96-aa29-4a18-4137-08dde79ec102
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 08:25:18.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY79IPZzVwvY8DRoBBmnejPuQMO0at3Hw27h60/1G7OHrjQTKNmbLFvid6xydrjGc72ZcyMFZ99ky83ro3Audg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6027


在 2025/8/30 2:49, Nicolas Dufresne 写道:
> Hi,
>
>
> Le dimanche 03 août 2025 à 21:55 +0800, Qianfeng Rong a écrit :
>> Based on testing and recommendations by David Lechner et al. [1][2],
>> using = { } to initialize a structure or array is the preferred way
>> to do this in the kernel.
>>
>> This patch converts memset() to = { }, thereby:
>> - Eliminating the risk of sizeof() mismatches.
>> - Simplifying the code.
> Last month, Irui Wang sent an actual fix [0] for uninitialized data in this
> driver. Your patch seems to be related, yet the previous fix is not covered and
> this is not marked as a V2. Since this refactoring collide with an actual fix
> that I'm waiting for a V2, I'd rather not take it and wait.
>
> Any chances you can respin this with a second patches covering Irui's fix ?


Thanks for taking the time to explain!

If there are conflicts, please ignore my patch for now, as it might
not address the actual issue. After Irui's fix is merged, I can
update my patch if necessary.


Best regards,
Qianfeng


