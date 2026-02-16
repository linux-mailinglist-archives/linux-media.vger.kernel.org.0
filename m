Return-Path: <linux-media+bounces-52913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMRFJPY3k2mV2gEAu9opvQ
	(envelope-from <linux-media+bounces-52913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:29:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F08CC145989
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DFA1301ECFB
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B46329E5C;
	Mon, 16 Feb 2026 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UUJDXdrM"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73C18C2C;
	Mon, 16 Feb 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255627; cv=fail; b=rjwOFAPhkFvU6FFQEEAQt8XfO9Jf8RVKzMhT2/Doo8mPgR+ZVDiqk6FrX1wfuw8qME/yytELy6UmaClI8E/XFbTuFNBJdUa2Jm0Hw2V5I0LvrguyCMT4/3FDk6+toiSUiW4gHFejULU0kxYSpBr6lywuflyFS8m1SLz8DtAM604=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255627; c=relaxed/simple;
	bh=IlQVEyJW9yK9OgCR5/aOJe52tQue4cjArJ9sqOfqheg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LPzXi4tWULtEIZ6TamG6DOFV+k+WKlHC1WsD5TNuunRPVDhH5jwAm6R9+fayrL7lgkb6WD38mKua70ArtK9EDocF+pabF/qQJ7i1PgFui1CL9JHrirD19Y76DJ5cI1YYiLAme+RdTCJtlkRrUQZYWaJj0R74HbX2ThDdm3BVZ4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UUJDXdrM; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODsKYQ/DHwT2VcQd9MgI8dXOWXkQotK9N93z1NMX+lRd+vkWNH5yTxYODM3ab5Jsz8AvCYKQaaExWU/HyuNmMIwDUcForoHZY9z51+SQmQQaecy+//02qLCnE6L6Wy7Ygrovv3utw/RAPyhVnaSPsWt8DC3WzqwrxRO+W+KGuwyFUtvBNaLTq8U3SEnFgsKQ6+xBYUAsT6scyoj7LRynjGssu+wsHTD1XYkNUWF0Lr5KDvQNeOq6+ktC4QC7BwWjm5inuaO+yi4EYji8t8hF1X9e3OeoGZ1acjrMO3LZg4/7LSmx+UPCsthSDnMzLDcVgxfcvOIz3jXGUiMFjLFVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlQVEyJW9yK9OgCR5/aOJe52tQue4cjArJ9sqOfqheg=;
 b=nM5mHEsZeZpZLSxi47+dcpK6MiuwflQnhGlTa+PhKjKCV7V0aaImjqc8xVuoKuPNu5FWvlgosG7PJp+AyBanNInxwJwhu4/A8f7SrCbj/lCpvBYA8QKhiy2Gt24JF2rezt5Abo4rfeRiyKshpePFXA5r2UwMlQ5vL0tvWw0N2vVkBIpAtifhiPYbMb9Rw7EKuxmekW3Hj8lD/zq1L2TIggCC/fbWT/LBpB0lTWfrVRGlba1cq0ygT8RKn/XdJ9hszqN074oMwv6zY0G+X34WqBI6P3mUTEdNgBg44bBm3ayL934D2ofNHxwE/bjH8qtD1RAVl02EBTu4JV7PuzoF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlQVEyJW9yK9OgCR5/aOJe52tQue4cjArJ9sqOfqheg=;
 b=UUJDXdrM5l149QWzB9k2lies5ebUb4ZvuDfyg5ONlVz9BW5ijXP3oissj5IzPd2DEcIA6zSBjC6FQAMzG+lad5iYRvo4T0JODmMNVBPC01L30R0fLuyw/6R5gNO8DMzTs8DQ7XAzpD4YyaCs5GwNhzIJ2+mpXuXMQc8OjSrLhnG1Afsk1gvPOEa5l1Prm9EPJjuKxzK5OTply3zh5zyTxkXz+7KaRdFW0sH19QH8XqxQpD4kvcSZyrWEK8nNkd0gXfwQgUWmmY1fovJwnUN6OQbO2EAxnHW/f+rSUe9CnpD6ZYw2O05AI/3n5BY1HUh8xdw1aXdgMOE2GZW8whnu4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DUZPR04MB9746.eurprd04.prod.outlook.com (2603:10a6:10:4b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:26:59 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 15:26:59 +0000
Message-ID: <5c0251b6-5228-4077-a21f-4da179949b90@oss.nxp.com>
Date: Mon, 16 Feb 2026 17:29:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] dt-bindings: serial: fsl-linflexuart: add dma
 properties
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-10-larisa.grigore@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260216150205.212318-10-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::34) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DUZPR04MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7249b8-6c07-4ed4-aefb-08de6d6fd37c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amsra1o0OVlhZ1o3YWlzMkxFQmh6bnUzMHk3UXMrR2FjZTYzSzg2STF2ei9V?=
 =?utf-8?B?SUJhWnhPdlhuVFR2SkZvU3lEWWFqTGp2Zy8yaW9oU2JoMjdGa2pja2V1bnov?=
 =?utf-8?B?UDc1VGxNelFQUU9GYy90aU1SVW83eXFJL2dYVVp3Vzk0QkE1ZTVrWEo4KzRk?=
 =?utf-8?B?elRQL0Z0Wm9XbXVHelkwSjdTb2x1MDR1ODhDWXRhWVNNYjArQlRjOGl2YWR0?=
 =?utf-8?B?S1k2UWxoTmdtKzVWNDBlQmhGT2krZVhqOVduRnByMStEVm5odEFGazZvM2lo?=
 =?utf-8?B?Z2lRWjN2M0d3N3U0VDZwckNPWXdGd1JlTlU3aHoyRnlkQVRHY0xhQndwN1kr?=
 =?utf-8?B?SGlyVGRONnBlUUZKTnljYUxoSGIyMmhld2Vudm1mbUJ6ZHd6Tml5VC9WdXkz?=
 =?utf-8?B?N2RvU0pRQkJDaTYwWVc2S1ZyK2hTN3Z3OWVpdmlxeEtsR0E1RmdTVDhXRGY0?=
 =?utf-8?B?RjIwVWpaRFNqS1NsNitvbDA5a3BwNDNaNGZSaUVqTjF0NG1HVGhXYkV6Q09P?=
 =?utf-8?B?SFk0bUh3MW1uWFV2UTFKdHpZeHZISEl6VEVBek5kTHBUcFZPdzR4dU5HL2Zr?=
 =?utf-8?B?RTdVNDZ0QmU2eUlTWUhTUUZVSWFNMDNqRlI4QmlnSG5RaTlVYi9yNHliQTBM?=
 =?utf-8?B?bUozeWZzQVlDOXFXZUtieUg4K0pndGtLTHVhZGc4ZVkyb3ZmVE42SmJRdDhx?=
 =?utf-8?B?ZkFWdjFvWTJGTXdXamtZbDRRQzlpc0lkZkNyWHdRaFVpKytQcENPNEdYM1ll?=
 =?utf-8?B?MXdOb0FQcXZ5dEo4NWlvbWY4anRBOFJVYURkU0cybWVYRWN0aWxzaEsycklF?=
 =?utf-8?B?VkMyTFNDdDVFL0J6Nkd6R3YvdVFCQWFoWlYrTFY2Wk5CTzE4akxzSGNESmFs?=
 =?utf-8?B?VzE3aEtmSEZVemNYWWkwKzNEQmt6VEdRbCtjdEtPbXpURVhrVDhPK1owV253?=
 =?utf-8?B?RDROSjRPWTczaXVSRzFTeHF3Z1FmdjFRWUV3MHdnc0xpRVAyRWdjYzVHTDJi?=
 =?utf-8?B?WVlNbU1rQ29WZ1J2NDJsN3VSUTU1T1RYaitiZjBObHI3N1FNc1JNUHNpZ01I?=
 =?utf-8?B?UU55bk9IUUZOYVc3ZEQ3NENkSm5KVjhPWWpOcUVLdEZ6V3BucnZDWEU5OUUz?=
 =?utf-8?B?UTFBdGpmZkVSaXVZVzh1dzdBVGpVRitGS0l3bTNoM0k1RGZNaDYwSlFWUURx?=
 =?utf-8?B?MUhueGJ0ckdKM0V6cUt6Njh5cXAzR2dQK0hTSzJUVHlTdWhtRVBtM3ExN0U1?=
 =?utf-8?B?ZFpVallvVC9nNzFnR0xKL1UyMmxKNUtvbEh5QXZ0a0FPeUZGNDJHQmdtTWZK?=
 =?utf-8?B?cHpsdnMrTTJ0Y21jOXRndzdiTnQzWDNzWlVuSDNTL0Y5QjhxamxCK1ZWdEp2?=
 =?utf-8?B?MjFJRWgzd1NtT2NJNDNqU3hMa1BMRTVEcXRES0N2ZHBudWZKdnQ5MFEzKzM4?=
 =?utf-8?B?anV4RlRnMGhxWkRqT1ozNnJtTDZZazZVNHFxc2ZsTkkvSVlBV0srenVJT1Z1?=
 =?utf-8?B?T3BnRFlFRWZDb0JlTnlkSjVhZ1NESFZ0bWdqVHFPNXBlNkVNdmlCZmx6OVEz?=
 =?utf-8?B?VW9hRWhlM1JSR2Q4Q3RMTE1RQnpUTU1TQXZhUUFUUStrN2hqWHliNDVyY0RF?=
 =?utf-8?B?NHFxWWcwWFVDTjltSGkyZFk0UFJsRVViRXUwWTNTNndSL2RHWlB5VG1kTytx?=
 =?utf-8?B?MkYxc3BwRWIxL3hySDNjQUluOGNEV210R1ZiYlpLQjBJYWN5UThXZ2k2SzBV?=
 =?utf-8?B?d2JBdGprVEJlOGx5QW42UXBWY0piZnZSbzdGOXI4cGpCbVJlbTdZcXZrSlRS?=
 =?utf-8?B?Q2ltLzJTb0NJcXZWakVyWjdxRE1xMy9pdzJCaXA5MzdCSE9UQnRTR2hVRnNU?=
 =?utf-8?B?V05zemFyblBsODRqQTBwNWxPYmtoUHNQRUozKzRMcHZQWkdwVzJxb3ZZWUlx?=
 =?utf-8?B?WDRNOWsxYkg5UXBadjhraTR6eXFUakhZcGdOK2lqMFpFVnk1dml1c2cyQ3Bv?=
 =?utf-8?B?V253cmJCL0lMWnJlRXlCVzBReHZ1NDRLRE5WOERWeW50MXhiNjRtUzdYL0Nl?=
 =?utf-8?B?RkNXUWdpdXpDQm13cU52ZnJDeUEya3dGOUx0Vm1YaFNFTGlWVElaU3FrdkJR?=
 =?utf-8?B?RVl0alRQWWs4cEFPQ09SejcxNVhGeWhZL0szTkhoa3Z2L2hCWTVRT21DbFBr?=
 =?utf-8?Q?Q4XTmyA8LcgjWWU+bzt7Oyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ci9tSkltUytMVURWTEhFY3ZFNmZLYU1JTWg4a1VNRlVHdGZYeUxobFpGWTAy?=
 =?utf-8?B?TENaVEx4WGc5T2MwTUZYZlZXL3Z0VUZqZXZHeVM5ZnVVSjJZMmJ4UWI5aGtY?=
 =?utf-8?B?WEJ1RWtmdWg4Vi90bmZSdW5CbDA1b2x1bnlzSlljalJNNDRhM1U4WElKcnFq?=
 =?utf-8?B?YlNxaUxxckhpYTZ3cm1ZV1dnekRXdUl5enV2bFk5Q1lKdXZhQm1NcDVob3Za?=
 =?utf-8?B?b2V0YjBDRk4zcXNleTVuQ2xTalhPUHdyK2s5NU13TTZ5eXpRK1F4SHNtYklS?=
 =?utf-8?B?YlJrTXNuMDVmL1lJb3hGbUNENVZkWXJvNTFLTmdnUVVidU5mSElob25xQlcz?=
 =?utf-8?B?QkY4RXUvNWtvTHJQdldjdmtsb0NtaGpQQlhucHd2am1JdkNGTHdPTm9xVi94?=
 =?utf-8?B?VjFLaE1MQ0swWExUa3RwZ011NlRRLzNSY1dNc0ZLRzNhMTUwNmFNKzM0SXg3?=
 =?utf-8?B?LzFaWW9pTlJnbFJYS25MNDc2eTJWMnJ1Vk1lbk9reHhESHpmLzZkNHdwZ0sw?=
 =?utf-8?B?R3g3TG9kb1R5VEFTSnVmZS9FNUlidGlvN0plc1l4ZDlhZThDZDN0WDhGTTIr?=
 =?utf-8?B?cGNkMTdYNUV1Y093SjVlaFphK0NneXV3WVA4QnB6RGt3VnRVd1VFZnN3QUIw?=
 =?utf-8?B?Sm10TFRQTTN4VU1ycGxTc2ZGRm9zZEpzeDJaaDlQVWhRUVNUVDhLOHY4QzFy?=
 =?utf-8?B?MjBNbHB4MFZTeG9JcXJ6QlZxM3FUUXFDdFV3RDljZG11VjdUd1QwZ3FVVVp4?=
 =?utf-8?B?MG1VM2VpZ21MbE9yUkJsa1NENE13MVNWcFB1dnQzekJ1Q2VyMUJXNjBwZS85?=
 =?utf-8?B?QVBhMVUvQ05UODdPTTBhbEJSYjNvTDdWYktoTUtEdG9EMXFOWWxaa1h2a1Iz?=
 =?utf-8?B?a2svZWx6NUVPTFIvUVV4TjlKUjBUQXpHeGg5NWxUYWhvOFlkamFmU1pCRzFU?=
 =?utf-8?B?TDVDa2h0dEppWVBtN1JISnliVjhNUjBvK1UyVnpycFhFWU9SZVMrWlVDQTlH?=
 =?utf-8?B?aW9rN1pDU1FGbU9EcnRLZDNiQzQvUkY4enlMU2pHUXJWUVRYbis5SkpnS1gy?=
 =?utf-8?B?OVlLRGdSeWI4UDRESk9oMG5GK2t0Y0JadmVhOUhiZWU2QjJKNHo1ZDJzZWFq?=
 =?utf-8?B?ZVBUWW83WEUvWFZabU5ZU0N3eWdZZEViTE9KL2tVTXRKYjlVK01MN2VDU2hq?=
 =?utf-8?B?TU9uOTRkWUdJWjNtYUxId0NCZTVvQUVzMXNNbElTbS9NbkVtZlUzUmFSakU0?=
 =?utf-8?B?K1g4QnA3NEFBMDh1ZUVRakNTczlPZS9kWmpweXloSXE2UitLUHBwTHEwU2ND?=
 =?utf-8?B?OWt4dmxma2w3SEdQYllWMDN1QUgrSmZnaVRRRmlIY3h0ZWpOQWFDQ29HUzJu?=
 =?utf-8?B?WVpsYktNdUNGMWduZnl4NTI1ekJ4RjJnZkN2Vk55MmJ0eEtnZEJncVpwWjZu?=
 =?utf-8?B?bWpxWmY2RHk5TkhWWmdIU3c2eklyODRsc2d6Nmg3aTUzL3VNQjlra2xnSnMw?=
 =?utf-8?B?czBhQjR4NXRhRWhzTU9PTHRXTWNpMW5LdXkvdUJQdVFmYnpZemNUbmFLS0xW?=
 =?utf-8?B?RUlxOVNrN1lRNGhXdlVjeHN6cXdvTlJrTTh1NVNQUUZCTlVXUzdNdVRUWXhT?=
 =?utf-8?B?ejRNRDJXUlU1MVNRS051ZUF3bXh5SFkraUNNYVA5R3dKY0NVdWZyemdmK1BM?=
 =?utf-8?B?d213YVYvYUdWbVBXcmlqbHBwemNXRm5BMWJLYXdjTExRODJEdHZTcnEwd2ZD?=
 =?utf-8?B?VXRXY01NNVUyK2dNeTF0dlIvdHpaY1JVNGtxeFpXYzkzNXFpS1lOaW85TzFC?=
 =?utf-8?B?eEdsSWEwOUVURkZvcG43Vk9OU0dqSDh5WmRaUTg2aFA3MDA3OXQvdTlmSTZn?=
 =?utf-8?B?QjRzSlFvSEUvYjAzZVNoV2FlY1h1TUI0UUttZ0NVUmZpZ1hqOTZsem50Vm9U?=
 =?utf-8?B?NTNJZWJoOEpTQUxhdHVudWtXeGxXZ05BWTVhVzFTY2FEN1FpQ2lsL0JoMkI2?=
 =?utf-8?B?ekZOeG9wYUt0Z3ZIM2ZpM3FFOU4xLy83Zkh5VzZFdWo1QjRIaVFXZUxHeWZw?=
 =?utf-8?B?ZVNGem9xWEVEYThlYmJ1WnA2QmZWc1Z5RHNQbFoxTkhjWWRjMVZLaHJBcUhQ?=
 =?utf-8?B?N2tOcGRGbklmcVcxUjJVVzNyV1NNS1NEQm8rZFk0RUQrRjNGTDc3OW9ManBj?=
 =?utf-8?B?dDlXeWUxVE9mb1VxSTA3dVQrY0hSVWV2dUNGcmdxUjFkVmVkeldLVFEvUHgx?=
 =?utf-8?B?YVpMZmhIQWxJM2d4Q0FWcnJTQ3hjWitHTjVYN3RDakZ5Um44bEI2SXppdWlV?=
 =?utf-8?B?RGRCRHIzbzB4eTlRMXIvN2FNVHFhM3lmTVEvOTd6OSt5MnRRdm8wdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7249b8-6c07-4ed4-aefb-08de6d6fd37c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:26:59.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBsqMBg5MZmHqInQlhZYl0WQgvNvxHW9mjkikn2WGh2pLv/mdM671SHJ7mci/KxjfgVknvEdc8KWGoGnBMLV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9746
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52913-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aka.ms:url,nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: F08CC145989
X-Rspamd-Action: no action


On 2/16/26 17:02, Larisa Grigore wrote:
> [You don't often get email from larisa.grigore@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>
> Add 'dmas' and 'dma-names' properties to describe optional DMA support
> for RX and TX channels in the LINFlexD UART controller.
>
> This allows the device tree to specify DMA channels used for UART data
> transfers. If not specified, the driver will fall to interrupt-based
> operations.
>
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

If both of you worked on this patch then the last lines must read:

Co-developed-by: Radu Pirea <radu-nicolae.pirea@nxp.com>

Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>

Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>


See: https://docs.kernel.org/process/submitting-patches.html


