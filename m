Return-Path: <linux-media+bounces-20660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 767FC9B856E
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 22:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94DE51C2164D
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 21:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668841CBE97;
	Thu, 31 Oct 2024 21:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="cc/XNQPr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2102.outbound.protection.outlook.com [40.107.247.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82F1BBBE0;
	Thu, 31 Oct 2024 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730410732; cv=fail; b=OYeKOE4j3rmwpOPxCscSnQl/zVUjMhdCQLjuni+0f97j8i8TFtVMF5typRerfsZfMwJw6vwDWRyWu7YLlo9nCFV6fhwVKj/EjyNfr+qoKPRaV9zkFGICeGq+flS9bXaVzM80fGeZTqiJHhmstI0FPhDbOfFxw6FWvEIvFQD4mI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730410732; c=relaxed/simple;
	bh=ilYbkdTzJRHyZcjlxhv09ArptiLTerZbQJ/zHu9qmsY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IwnLA8gdHtJjvytDTij8vgaTuNyLuW9D/077xKdAkyDbUcL3Aa9Mgw6nLt1yGdIeAXRgcx0xBgN9773hc16PuTqkaFCNd/K3iuBgKpgcjF/Aor2+Tw4cjeEw9xne4nz81+9wGg6OQONQdplnMhZSQqMhQPmOcDagTTtvDzXuC6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=cc/XNQPr; arc=fail smtp.client-ip=40.107.247.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3mxiKTGPpj4Iz5MJKiggQBXbVqQQSiQaf9UcWITc2B6qYuPRoyOpVNg1mTWxAeZF/V5zpJHu0YUPD/9Of8lcoFF4LVpzR2HVAELk1yTAAC035trdu4msoxEwtJ3wBokBmHvWxEfVPzYPrUnSWToROAkmmoBMCh+LPO7nsCxBwhZSoa3Ln5qgJXoOW+Mmrz5sPSWl1WkGqimoEAKTtqkYII62G2XnO+bnX0jpNaA5e5kzTLJt0N9XLK6b6xKupYEb+1MpdZ3X9GF/Fy/2+uovp6qqfsH9GInc0FPGQ0TXy3eCLJhClY0ECQ33aB2Fwjy0clIKmV/et+cJjXs4nLq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm9L+S/bLxWXABGN1FKuzvytmZ8XPnl8EmukfvAKxuo=;
 b=sZHb5lEA8EiEMQpaTXRodvpTB0Y7C1/LRr50hkyPBSSSz08epN4PIhLo5761CGTUAI2gMSVdaqnBGbP81nR2mm7YOEvJ53PTy47uuF1xU4PwW8buNKcaS2GZ+kv4EOWXcITur+SIIOBI26/yn/MzoVvHVkouPBBZdDhFQ1Dyx61hxwdY8ucI1YQRFjeAl7wRibd4ReT5IeuqY0jC8gLXPYbQGYKohVQfnp7auWuYPOvCfS1UvnWCJAeJLQ3pZKmtGWWI31Dd+dgjXuT7nT3J/BhSRraTEte2jQUDdWQO0nSEstFfzEqF2opzKt+QYNUnk2E0aNo0InjAS4Oovhwqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm9L+S/bLxWXABGN1FKuzvytmZ8XPnl8EmukfvAKxuo=;
 b=cc/XNQPrm7CgFsVAG+Hb+8SVUgMfRwHTQjtjFVfitrw8MWx47KS0gnz5shfzZRnt2LJWfhNlf6XJYzZWJOqGlPsFHugAYMbxxL1V8CL/nVqVc4GN53q6WQYeGOHq15y0AS9kvCLmVNBIW5qXxBThPbLZAVih2V+0zMEywTL56bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB8737.eurprd08.prod.outlook.com (2603:10a6:10:3d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 21:38:43 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%6]) with mapi id 15.20.8093.024; Thu, 31 Oct 2024
 21:38:37 +0000
Message-ID: <02802b4a-af44-45ef-892d-870423fc8a38@wolfvision.net>
Date: Thu, 31 Oct 2024 22:38:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: imx415: Drop HAS_EVENTS flag
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 Martin Hecht <martin.hecht@avnet.eu>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Julien Massot <julien.massot@collabora.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nicholas Roth <nicholas@rothemail.net>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029225632.3019083-1-tomm.merciai@gmail.com>
 <20241029225632.3019083-3-tomm.merciai@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20241029225632.3019083-3-tomm.merciai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0046.eurprd03.prod.outlook.com
 (2603:10a6:803:50::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd12252-3fd2-4e95-c11c-08dcf9f46117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjRPN3VNK2dWeVZKcnBzakNWbGNFZXM1S09ObCsrRG9MaE1OMXR4SDlSb2Ns?=
 =?utf-8?B?N2NGdTc3VTR4TGNiL3BEdUNicCtoTUM3Z3NmVU11VlhNY0x0dzk2Y091NTRZ?=
 =?utf-8?B?MUg1VXEveFphcThJc1BHditJdXFaNnJ3NXliQVozMW5VTzlZczBiT3Zjc1lJ?=
 =?utf-8?B?NHNvVEs0c3QzMHZiSUQ1SGIxMHZNcHpMRUJKMW9ScG16bEthV1RoOWdHbzFu?=
 =?utf-8?B?WVZzVzNtUytMclM3blNyaFBIclc3TkhYZnl4M2pwWWhDMzhYZEU5djdHd0Rt?=
 =?utf-8?B?QTJGMW0xNzNsNjZEZ3Nsekp2S1RxL1I1cGp1Qi84QU56WmFCVlNmWlJ0dHRm?=
 =?utf-8?B?WEY5R1Rla2g5TXE3cythSjFuc3dEd1kwc0M5YkkvNldrSkFHd09TWjJPdjM0?=
 =?utf-8?B?QytPc281YVRXWGc4Tk5OVVhlOFMwVUhxRmZBd001ZXdjMHYrQTE1aHBONlI1?=
 =?utf-8?B?a0drc0o3UmVNU2lSWnVVL0JIWVhMSDBzREM3NG9tYmpkL21QcVhWZHpvaW1m?=
 =?utf-8?B?c3B0UnJlN3AzTVpwQ2VnZExrdkNpdVZLMHg0bXJWUng3NERnTk82dmQyTGVu?=
 =?utf-8?B?dlE2UGxhVUdVQXV2QjVLUUpGQWExajdyQVhjQS9kRzlMNGtIN1k5UGViUkxk?=
 =?utf-8?B?b2laRVVUSGJwTDNyQzJGS1VyYkZmL1NzVEpCTC9iekpXUmYyQ0prbkNMT1NW?=
 =?utf-8?B?S2xRaGEvRVkyUmFTTXUrcUFGZ1g0YkxQY2RBOU9IYUs1SEE2U2pYVnoxZE53?=
 =?utf-8?B?N3BwcTJ2SGE1aXBJTEdsaWxsT0M1NzZnMUdodzMvbFlMdGlmdFkvQStUOTVv?=
 =?utf-8?B?a21UWnpQR3ZrdXNyQkUwNnlNR0Noa3dIaStWL2RscEhuWmhBODFwdG9YODZH?=
 =?utf-8?B?eWR5SGVVdDBoWmd4Ky9EYVcrelZPOU52RHpTcTJaT1BWZ2oyaDZiSmxFYWU4?=
 =?utf-8?B?ZFVsbVc5ZnZ5dWxuNnAveDlKTGl1YTlWZjBLbVNCMlR2NVFCV0FYdzNvNmNN?=
 =?utf-8?B?Z1RzZk1RZ3BBTGRRaCs4emhKVzRMV2ZQZTFwV0xZVnBlVitoQjBvNTZVVkRY?=
 =?utf-8?B?UUtyb2N0NEh4bHhERURwTEUzd2Yyalp1YXhReDJiakw5M2t4aG1OVlNRbXVr?=
 =?utf-8?B?VXRLbU9SdmZya3ROZmo1M3d5U2t1TlNGQkt6bFJvU2Z1a3hlVjdPVkphMUtz?=
 =?utf-8?B?MXBUY2djbnUrb0hySU9MNE9KNXV3aHdubUVmZ3ZaWTJ6eUsyK0YrTUtLQ09C?=
 =?utf-8?B?c21TZGxvMEhEYTRIaVZSMmpKWEc1YVV0YVZBc1RHc0lLQ0tjZHI1VUdaSW1K?=
 =?utf-8?B?T3ZIdEJDZE91ODh2Vkg5dGRGMGZ4QU9GUnpaZTZGNmZ3d1VRUWdIS0JhRXRz?=
 =?utf-8?B?Mk1QU3hoeVBTWlBvanN0dm16RGpicVlqMHh6c3FBR0ZDd3JYd0ZlbXJvdUJw?=
 =?utf-8?B?Y094VTI0RVljbEtlcFRRNWJ6eCs0c2tJb0RodHhxeERuV2xlQ2pHV3dvMHhM?=
 =?utf-8?B?OWNpcTlGcXhHL2kvWFVldzFIZVhVWEZCNnBaaXRFcFBxODRKRVBoR013V3Ez?=
 =?utf-8?B?YzJrR1JrQWUxbXh2d3pZeDh6OWplT0xTcFh0c2RzU21VRHFQTjkzMEtJWGk3?=
 =?utf-8?B?b216Uk5CanlOWVpTMUxnRVlyMWcwbE1ORnY2bUN4VncrM1ZTVHZUKzI0Uytr?=
 =?utf-8?B?d1B2MVY0RnpjYTZlY3BUQVBTenE3R0RHU01wM3hENVRMN0ptWUl1dHg4MGE0?=
 =?utf-8?Q?WRUzH+u32tnv0DI6J4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW13czBkU0pYMzROWFdTdmttWEFDNjFrekJBcEFKYWZTajdtUGpYbmtpMjFW?=
 =?utf-8?B?ZXdzdFBFT0RrVHpXUU8zZUJGNWxML1YvZkEyV0FteEhNODlyY2I2Tnd1RjB5?=
 =?utf-8?B?aEpDMkhta082TzVrY2lOOHczeWRCbTNNeHIrRUd4bHNZVjhLd1psWms0Mlhk?=
 =?utf-8?B?S2MxdCsraWFMTmpGc1dXT2V3eXluWnFWNUQzU3NaZjJoTlBaRVJSa2YzUTRj?=
 =?utf-8?B?a0U4ZjE3WTc5UDJCR3plTG81Rm40MHMrRWtwVVVDMmI3RlBMYzg0RWw0UlF6?=
 =?utf-8?B?VnJnRHVSUXRsaXFwSElPY1YxZXM1UlA4aGRrSUp3ekl1VnJ5aHNSRjkyMEw2?=
 =?utf-8?B?VlhFcEI0dm1IclZaeE4vM0JZSFZyK3NtVGRla28rd3V0UjZFcU91RVBCYVNH?=
 =?utf-8?B?c3czazVsbEN2R0Z4ZlN3Z2Z2QUtOdERpQkNBa0NDQWYvbS9HRFN1dXNEVTNt?=
 =?utf-8?B?bXBPYUZ2YzJOMFNVMERTRDFVekJxU0Zoa0dzUHNTVGVtdFlYVCtLZ3doU3R4?=
 =?utf-8?B?Z0grZFVEK0tlMUhYeEViSzB0QTJvQXdRSVFMdW5LaDhZWWM2QTRqK0pwSVZ4?=
 =?utf-8?B?cFdRdUt2SUFmOHErVy93UFJuRXNnRWVZWFNwMkVXRC9OWGVuMHNhbm5BTk1u?=
 =?utf-8?B?bW9lSisrWkp5S011ZDZPZFoxRW9KNndMeVpNWTFrUE9RVElkaXhIVjJBZlov?=
 =?utf-8?B?MGdNSlptd3BOUHA5cEhMai96V0ZacVNJRTF2ejBPS3J4QVlZakZuc3VPNU5W?=
 =?utf-8?B?Y2JaTDg5RzROdlJXUW0rT3ZoZnpGVVJBTXVmdldnK0xpSlVKZ0t6c000MUtV?=
 =?utf-8?B?NUZIdzRJeHpzMXorNEtjYS8zSjk2YW82cVQxc1FwUS9kSVdQaEtSWm1RK2E4?=
 =?utf-8?B?eVdEaVRjbW9sbHJnaXlzSERBbkQ2cEsyVm1WRlBZdC9KU1ViOEFpbzRnNWlD?=
 =?utf-8?B?ZjZwUVlmWWpuemNvV2QrVWVOemdqbktRY0p6NXdtUXQ1Z2FFS1F5UlJ5M2N4?=
 =?utf-8?B?UC9oQXJlN25ZUGFYNnpWU0pvdHZYc09QRVFGTU40d1RIZUcrZkM3TVlBcmd1?=
 =?utf-8?B?cEp4TmhUNVFGcVFkbVFJUGNOVU5ZdytXMTZRcTBOTU51K0FxNWpkUW9XVEdR?=
 =?utf-8?B?T0w1anBZZjRLcGhnNGduT1hiWVVIa3NYUDA4WmcxRGR4MklWV0padW5nRVlJ?=
 =?utf-8?B?VVdoaUZpNGNPek4vN2s5aW5NUlZUNmY4emFjcng0bXcwcDd6K1FRRTduZ0xj?=
 =?utf-8?B?aXZIM0RWOVdYdmpESms0eWdoY2lUL05WRnFML3phWW1xaDA1OWJyMmd2dUll?=
 =?utf-8?B?QkxPRkRacFNYOXNEWjV4WlZjYjVHNkRNVzBGcytLanAyNDAxdEd4Ky9Ld25R?=
 =?utf-8?B?b1hPTERKelZZNm1Wc2k5L3ZnL0xmdFdXcm56WlJBQjhET1VuOUxYZjRidjQ3?=
 =?utf-8?B?MTlRaUFBeUpDOVNnMDdNVjV4SVBqVHBNbEpnVDJRZVh3dm5IR2lkb3U4R2pK?=
 =?utf-8?B?ZytndFp4VzZtbVJJTlhjZWtkNHFZVWxKK2pMalFMUXR2R1FQWjZXeHNPajh5?=
 =?utf-8?B?cUVvQmVsRUVVUWhMOTgxcllkaG5TV2ZiM2lVZXNzSXUrUUtyUm5WaVlROWo3?=
 =?utf-8?B?RG5VYmF2VHlPRUFIdXY4RkluTGNadEt2eVpVYW5uVjgzNGowVHJmVDZXRUxa?=
 =?utf-8?B?dWFBdHRqSFN3NENJYUVQUm9rdVhrVWRxak0xYzNCTnlTS1phdXc5OXZvUTUr?=
 =?utf-8?B?aWVpakZYSG1pdjdxUnlPNnZMR3RoT1pnT3RIaWw4b2ZrbjlTTnQyS0R0a2du?=
 =?utf-8?B?UGJ6V3JRVEJEVEkzcFpyRnAwU1NwSDZpWXU0TTY5UXFzMDNPbEZRUHozMTZn?=
 =?utf-8?B?bW5IMXc5TXNWNUJBb1ZyNFVpNDFmOHJOUnNDOTNpNGs3WDhZbEFZYnhwTnVp?=
 =?utf-8?B?Y3hZb2ZSaUtCQmx6Vjc4U2VVdzBMYjBVSGNDSjRsZUE5RSsvN2swTmJFSzAy?=
 =?utf-8?B?TVBoMHM1NjJJM3YyZURNTUt2N3NkMlBKbmwwVWkvQ01DWDZMVUtrOHA3NU1z?=
 =?utf-8?B?cjF3N1RGcnM3NmtLTzE4TFVuMWprOG5QandZMUluTysrWUl2bmVIVTk5M2Ji?=
 =?utf-8?B?SkN0SG9GN1NUSFFHVk11eE11QmZSUEhJaExBa2dxMmhtN0lWREFwRHFQUDhW?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd12252-3fd2-4e95-c11c-08dcf9f46117
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 21:38:37.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2wHLfteNipD9Ml+XCZTEZbZoe79RZHgZjsnlJ9yVch0IvQJ2xSyLNhOw9PgwEsXVqgP7yFGKFCp2r5YR2FQhR0Tcp06IxdPz3DOxBqVGKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8737

Hi all,

Sorry for the recent HTML mail. Let's try again -- hopefully it works now.

On 10/29/24 23:56, Tommaso Merciai wrote:
> v4l2_subdev_init_finalize() already sets the HAS_EVENTS flag if a
> control handler is set. Let's drop the HAS_EVENTS flag.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks for the patch.

Acked-by: Michael Riesch <michael.riesch@wolfvision.net>

Best regards,
Michael

> ---
>  drivers/media/i2c/imx415.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index a20b0db330d3..3f7924aa1bd3 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1113,8 +1113,7 @@ static int imx415_subdev_init(struct imx415 *sensor)
>  	if (ret)
>  		return ret;
>  
> -	sensor->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> -				V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sensor->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sensor->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&sensor->subdev.entity, 1, &sensor->pad);

