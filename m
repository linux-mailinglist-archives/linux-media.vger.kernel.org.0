Return-Path: <linux-media+bounces-52894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NN+AREzk2mE2gEAu9opvQ
	(envelope-from <linux-media+bounces-52894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:09:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF40145247
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 489283086360
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EBD314D13;
	Mon, 16 Feb 2026 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rt03O3EN"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0564E314D3C;
	Mon, 16 Feb 2026 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254143; cv=fail; b=mep00rfExPiT3kE6T114eBWCSt/tihH/sYcsl7lV5x3lq8KZ0TUXDo46Zy0cet6vC+mGzKdnl6HuAkdoCG1nZfiXcyyKQMVT4LCCTZi87/2Ebr9Hx8jecKskc4dxkLFBmeeAqKO9Q1k4qBmFiqsQzZu5yznsVii7XlTVyFOiq2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254143; c=relaxed/simple;
	bh=imhpLYNGslprxyjpxKo06cXqy9ZegFcyYf/DxYB4g+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m2UtcHoooDoNXj2En4WXbOEN2nYRhKa30hJMBdPvF9m2yOeC8eM8ygPlg7brEGj1V6j93RWJ1Vhq9sKnSgUHzkFFwTA0RKHu2CT8Y64SlDUkemcfeLfCaB0u0H4gQ/NTVgiiFFM4LJit32rKSob5cy14Hhwd/nHvBUQRQbRrzHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rt03O3EN; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ik72hindg/XUJbekvjJ8pSFX9pyZzvxjSV18WsFxA/O1n07W01DlfinA+OcmnFFyEZCAs3dpTySkxCcafxkPeV052rFJn/xTmIbmXOojFs/Di8b8JzE+0MyoH/FijsqyAGZwFdYsCS58FdhyeEYvkPXs/jDULO0u/NrtplBpXZ4dVmJbiaPjxRFUo5Bp4IPFTphH+keh8RnnzQw7uiEESdYuMAcnH/0FDdjZPnPjVNCQJzBmU9ZnTQ7cRQrAvBoSONKsCK6MbUlE+5ngpySWxn0pv6Dz7i1l3fNL/w2qcYHOl7csvWQ/w1D5jwi2t3xI5M40FSx6+CIbqPE0G4e39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZKZERZRuUlQCYBtz3fBtGG5Y0uK5ZmBrWqvX910svM=;
 b=jnRvMs5GaSKxt70sAqP0aOMsQ91WifJiZzomXU6+vv3iKwshfZu17rBnQN38+36od2pNHy8opPY6ZWnNI46623yKlzCjHw1meKpcXl49cNa49vrvgEWX+HT/dXMFc0yazisOhR5DrwjThMPHCx74hh//REGkWRusqfsPCrpSfoNlmI7/hySDO0pGrukTMWKkns66YH6xILq3ytPaaEPOp+amqsplgh3OUripOUKIUNefAJ15awfVX+QH9GjdTe7MQzIfocGH/1xga8HeX1yfp9VqmuY3hONFFxWEoRNJ6mKJoADeLTHw3Nfpfamj2ZsD7zCndKl6NG0Q7SGwRRIhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZKZERZRuUlQCYBtz3fBtGG5Y0uK5ZmBrWqvX910svM=;
 b=Rt03O3ENQeZ1xsKFrnBh7ifWy0RvZ46FvKPgaN2mXB14yCIGuFp1xrXBRV27wjgt65gPC1S3ctZbisCosZFZU3KH1VRIWhd23hEoizf9YS3cyt3hGY8fdzd2ZjP81E5sGOkAU1MFxt5gqyUFFMjp1lDDEVCLGTc2OtAUqwHA52WB7wr++ufXjjH/M6kGlcGasdW5bpZ87b3UOyuE5AfgWV7VNO++O4Rf+1whBfu/ZQUxIb0fxsfuZ3ugE0x/UTYp8mRR7+mILj5VP52lee+fZ78Jbk8uM7Xpp8HJsOTQ6GQq0kymcQ1WPVs6xzpf2ojGvzEeSPSIKHEK6NS2PQnHIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:17 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:17 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	chester62515@gmail.com,
	cosmin.stoica@nxp.com,
	adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com,
	Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	jkangas@redhat.com,
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 03/13] serial: linflexuart: Check FIFO full before writing
Date: Mon, 16 Feb 2026 16:01:55 +0100
Message-ID: <20260216150205.212318-4-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::10) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 679668fc-6de1-487e-53fe-08de6d6c6011
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGtJYUhjekU1SHA2UUJ6am5LVWpXYndWSWhWM0d1ZnozcTB5NVlETUVycGYw?=
 =?utf-8?B?MnQ4cGVFNUNUdTNQTDJaTlEwblJxT0E3dVJPdXBTT0lqSkFidFpBeDVWK3Iw?=
 =?utf-8?B?Rm5pNmJvNUxhRmtiS2F1djFENzh0Q09JNzFBcjVuSFFWVzdQSEJleElwNGlm?=
 =?utf-8?B?bU1RWmVFWEhpQ0Zxc1B3dXdhWnl5bGhWd2xReHpHajhmTEtZMTc0VEl2WVB1?=
 =?utf-8?B?Wnp0MGVnaktjMTdFUjd1V3BIYms1Ri9lM0FaVWt1aUZvdFJIaUpreHlQZ1VQ?=
 =?utf-8?B?S0RqbnlMYUVBcWhoTGN0M3h4THBpYkdvUWFpaUltZE4yZi83M3NGQVFCcGpI?=
 =?utf-8?B?S3E3N0dWR3hYa3NPV3J3Uk4wWTlvaFREUG40UkI3dkZvZXRteTVJM2NjRmJs?=
 =?utf-8?B?K284dG1BaHlZeTMzeGIxQi96MlRhaVFwMU5hL1J4VUN3aU0zTm51azlUT2l0?=
 =?utf-8?B?OEQ3MFVDaDNCek9rckQwR3BNL1N2K1ZyTW4yclptUHRteGdrN0cwTEl2Z05o?=
 =?utf-8?B?STJKNFliczR0TFRNL2FONzNtVjNvaDl4Yk9ESTBITUJTUS9sWnN2YTNxY1Jn?=
 =?utf-8?B?Y2dwZmhYcWkra0RuMUdaT0NERWhCTjRlSmxIenhJeHdoTFVIYnAyNlFlczBX?=
 =?utf-8?B?QUgxeXNFc0tycW1HcC9IODBGd0czU0lidmgxZjNBL1pkZUM0cDJ1YXlaV2NU?=
 =?utf-8?B?Nzl0THo4a1Nwb05ua2U2ditHc0lNT0wvMjN0T1Mxa0FvaTBVR1RGVWFXNGhQ?=
 =?utf-8?B?VlZ3VlRPQ054UUNoWThRTTBtc2NKQWVJNWJXQURhRTNRanlZSWVWeVY3VWRN?=
 =?utf-8?B?R0YzNkxCR2xzZFNmR0pjQXpHQUZkOFRxQndkZUhqakhPb05abjdrNW5TM3Vt?=
 =?utf-8?B?RmVCeGFTdFdDN3RWZjY4dzdPOVY5OVdWckxkN2diUzZaU3ZDUlNLNUx6M0p2?=
 =?utf-8?B?RCsxWkFxMjN3WkRLVW9MbEtMVEprU2dRT0pQamV3ZmxnRDRCNmFkT1pJamE1?=
 =?utf-8?B?N1JIV2dTcFNkaEtRcEgxY2hVVk9oMHM3WjFNSndmWHBtbGsxT2Q5QmgweFBy?=
 =?utf-8?B?VW9lenNVMUJTaEJqdnlmSE1HYlNudnRkMkgxTFY0ZWQySXZRaUM3RjdsS1Np?=
 =?utf-8?B?Y2RFem5FaE53VUliRTE1NUhiRnJXbU1tSHRubnVXbHhQUVFIV0ZiYzhLR1k1?=
 =?utf-8?B?Z0FSNW9VaXJTSXF1T3M3SGJnQ1RJNHRyNXFXbzhKMWdjMWNQdEp5NHRzWnBK?=
 =?utf-8?B?WVZrVmNtT0RvbHltZ09xRTZVQVp5SmdiSFJkeis0Mkw4aVdDeTJXQlEzUG8w?=
 =?utf-8?B?VWxpWEtTd2dMRFZLY215Njg4amE3dGRhaU8zQ29KUk8wQnVmS25EcDNXSXJW?=
 =?utf-8?B?ODFwSk9MT0I5MjZHRlJEMUxIM2UvM1JsMmdsU1JaTUZZck1BdlF5M2FkSjl4?=
 =?utf-8?B?UmtEbVNKZzBTNHJBOXYwNWZtaWgwOGZ5YWQ4Mko3cUdkWW5tU1JEUzFrc2Q4?=
 =?utf-8?B?N1JkNHVBN25KZWxqM2h6clcveHBEVzUwTU42NkVaRjBNVE84SmxNWjd1YVRD?=
 =?utf-8?B?bnZ0aXI5L011NngreWp4bFJqdCtvdHU2YkZoamptWHpnVmpHSUJxanNJM2ZY?=
 =?utf-8?B?L1JQdXIxWVlYTUVvcmVFNkFPSGFuNUxqL1F5MmVucitzcWRXZXJZNnFObXR2?=
 =?utf-8?B?Z3M5dUtTVmtSWHVUaDBraUVDYzF1Z3Zxejh5cW9pZWloSmptd0JMbjNVVisz?=
 =?utf-8?B?UTJBZEhxeFlZSEZHNTdCdkdSNGdWeGNDKyt3ZFczR0NhbmdOWHA4R3RwU2tZ?=
 =?utf-8?B?VDhicnNoQkc0eWs5TTB5VzVlOFEvSWEySnZiYzhQK3lLSFh2ZVgxUEVuM3h6?=
 =?utf-8?B?bzFKN0xiVTg2Qk92VGl2bDQwR2hUS0lHdUFkSUtkOTVCVWtHZWx0bGFKQ004?=
 =?utf-8?B?WU4vcWU5ekNIRmcwKy9VY2MvT0MrZUtNNkEzLzlWcENoUk1yT05xcjZrZ0N2?=
 =?utf-8?B?MG5COUNkVVJqWURXYlFxdzhmdEFNUzFmU0w2THRoZE5QeXd6UDE4WmJHVCtF?=
 =?utf-8?B?M1pqdjlrait1aXBId0tIcjc0TE1WdWFSQmMyQ2NvL3doRXI5cEJCWHJ3ZnJ2?=
 =?utf-8?B?QXZRZTNPdlpSRnFLZFB3SklVMFFFSUhwL3VJaXBiUitFQ0dRQ3ErMmpvMita?=
 =?utf-8?B?MUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUphWXVNL2t6aVBCVk83eWpsMW5mTjRCcFg1OW1INHYvRHlpZWNZR3hNTzc2?=
 =?utf-8?B?ZHlFSFlHODk0VWtLSTkyajJtV0xWOGFNdjMwcXJhTG8waW5LRHc3akVwL25j?=
 =?utf-8?B?SHBRV2Z3VHJlaXl4SlJidHgwY3hWU2tFS01TUE5jL21Ka0txMjU3T2ZvRlR1?=
 =?utf-8?B?WU9pbDNJZy9SUzd4akRUT2JYSHhxelZ0QU1lam1pT29SSmR6ZXd2NGR6YzA4?=
 =?utf-8?B?L2VhS25ZYjBteUtyVTJZUlpLWEdtSExZQ0wxKzA4ejI5V01CNWdzbHEzb2hz?=
 =?utf-8?B?aGJ1WVRleHlUK3hiTyttMWRGazhLZDFqeVg1ekV2WlpqMDBWVVFZd3lUTnRV?=
 =?utf-8?B?U2ZwTHo3VXgxU05NLzgzeS9XMUg3Z3VURWJyK0xBeEdmdE9YZStlY0JyTWUr?=
 =?utf-8?B?RThmd1NuZ05pbXg5T1VJRjdSWFNIa0hEdHBJTktCRkV2R1A5Y2ZxNktBN0pj?=
 =?utf-8?B?YWd3N0RTZmQ3MWZwc2paSGtJcnZDMXBTdnc1SFpHSWR3eXYvSjIybDFMdE11?=
 =?utf-8?B?T3VEREc0OGp4K3N2cTMyWDgrU01RZjk0eHdhUHlYejhMWlkxSWExcGVKSkZk?=
 =?utf-8?B?UkRhWmcyYk4wdkpzYWY1MStFMWJlMWVZakd4UTFQQXZObUNDWU1hQnF5WDh2?=
 =?utf-8?B?cWxtdlZsQ1FnNDdWQTNtYzZScG1LNEhPZjhod2RZYWpNdTNzdXZWRlY3QTFB?=
 =?utf-8?B?VFZqc2xkbjdkWEY1am5XTHdZQ0QrbjZJcEJJdUxnbW44dTFKc3JoNVl3M2pZ?=
 =?utf-8?B?a2d1WjlBOTI2cjNaSHQyV3BXdlp6cEtOQUJYdHJxVVd0S1BMOUpwczlwNFNW?=
 =?utf-8?B?MFpIOU52c2twTVRlV3QyODB1ZzdkYTdoWGw0QWw0Mll0aWVMUjZnK1IyV0Ft?=
 =?utf-8?B?MHZDM21wVmNMZTlLaFdCdWpQRGpVQWxKRzBnd25WS2Y0dzRiRTBDNXl3akRT?=
 =?utf-8?B?QXZCdDc1Uzd3QkJQY0hVeTNneTFUQ2xRdlhqT0Y0TUp1ZDBYbGR1NGl2KzRR?=
 =?utf-8?B?ZmdLbWk0MDZjOE02Vll2MXZ0MDg4VExiUFhsck4raStZTWtNamxEV2tWdWpU?=
 =?utf-8?B?UkVwRmV2TSttalBhd2lwVlB6MkM2aXpBVFVjcm9EMUcvNitBMld3ZGxJUjNl?=
 =?utf-8?B?aklFR3JTbHluWVpZWlRjaVNXRG9PYS9QTlVSY2xCaXVKOTg0aDZta3Z1TnM1?=
 =?utf-8?B?SUNZK0JudVZSblVjeDAwQVpkT3NFY2VUNVlFcUZCdzNqc2YyMzZrdEJvdklq?=
 =?utf-8?B?OFNwK3JnYys3dTU5cXhTRFBzUlk1L2xpR21yQnFqcE5ZbXdUR0NXVnhwMWFU?=
 =?utf-8?B?SXZUUmVLMkF0U1d1eEt1R3Iwdy9DVFhHSGFGVGpJWVJoSlpBZ2FNZC9qMGtj?=
 =?utf-8?B?aWlUOUd1cERTN2V4Y2xiN0J2MUc1bDIzME9ZYTRTRldzdnZhU1RsVXFOMmJa?=
 =?utf-8?B?VU96dFNma0VZeE9HSCt3Z0R0REtSVFd2VFVWeU81T0NERDFIZ2F4c2RXTkhM?=
 =?utf-8?B?eDllQ3dyakFCSGJPZis2S0svRGpGeTh0MGpDbFlJZk05Y1lyb2hENG16cVkw?=
 =?utf-8?B?ZGVORVQrMjFnR0ozYU9KNzE0Z20zMUxuc1Jwd3kxZG9YQUszb1oxbjVBQnNp?=
 =?utf-8?B?VUh1ZkZ1MGI3U25WWjZRRzE0Wm1MSVRDejlFOCtqN1ZaVVZmTlIvSW9TdVQ4?=
 =?utf-8?B?REdUeEh3ZTc2VnZHNDVXd3lDdktBS1NmT1V6ZE1BWDJRZkc5YUJLQjQ2WmhU?=
 =?utf-8?B?QlE3TW1wKzBLQTdWVzNINFZFU2JBM0c4SFdRSHd5RnVjUmIzSEV0REorSDVT?=
 =?utf-8?B?OW51TWk5alFVcm9VNU9FdUQ2eENYTmhNYm12RGlRb3NuQ2Fpd1VQRnFSVkdi?=
 =?utf-8?B?YXpjc1d1aGtNUmxiZHlrOEdIS2IyMXlGU2s0ekkwckdkaWNtWWhTYkI2a25R?=
 =?utf-8?B?c2lJSDZNMTBjaGdNUlJtUUtNVUU3NEJ6R0twckNVUG00cWcrUzFJMnhKQkZZ?=
 =?utf-8?B?RHRKRnpqWVg2Vlg3ZTRRYXprS2poVkJ5ZUZRSjA5Q29CMXphV0lDM3pzOVB2?=
 =?utf-8?B?LzJJY2lQZzA2T1M0TURVZHRoeGdXd0lHb0tQaEFYaDJyeExNUExIL09FQ1Na?=
 =?utf-8?B?aWtaMGJmeWlVOVJmUTJYR1VUdFJmUnJoMlZPYVJBSXVIUm1ERWZSUlAweGNy?=
 =?utf-8?B?YjFaNHlYdENjMW5mVnlvaXkzYUsxR2hJaEFKNG9QSFlnUFVHVFB6Z1czR0x3?=
 =?utf-8?B?UGx2eHBFbVIrOHRkNE1NY2lsZU9ZNnl0WmtscG5GMFhrR2xHL01yV1dJbHlN?=
 =?utf-8?B?YWxpQTV1aUNubTZOMDJ2S1Ntd2xwK0F4SVM0V3V5VFdQRC8xbmp3Z0FNZG5G?=
 =?utf-8?Q?LUQdSshPPcSi/xas=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679668fc-6de1-487e-53fe-08de6d6c6011
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:17.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrUwUUD7xOXwENIqcgC8yAyrIcwilmRwz8MhYxd6yg2d4A1L307JG4pCv14zybhGEeXlvxKCpIHDK3p27VGHyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52894-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 5FF40145247
X-Rspamd-Action: no action

In FIFO mode, the transmitter FIFO should be checked to ensure it is not
full before writing a character.

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 016011fd8760..9111e7af62ea 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -555,22 +555,24 @@ static struct uart_port *linflex_ports[UART_NR];
 static void linflex_console_putchar(struct uart_port *port, unsigned char ch)
 {
 	unsigned long cr;
+	bool fifo_mode;
 
 	cr = readl(port->membase + UARTCR);
+	fifo_mode = cr & LINFLEXD_UARTCR_TFBM;
+
+	if (fifo_mode)
+		while (readl(port->membase + UARTSR) &
+					LINFLEXD_UARTSR_DTFTFF)
+			;
 
 	writeb(ch, port->membase + BDRL);
 
-	if (!(cr & LINFLEXD_UARTCR_TFBM))
+	if (!fifo_mode) {
 		while ((readl(port->membase + UARTSR) &
 					LINFLEXD_UARTSR_DTFTFF)
 				!= LINFLEXD_UARTSR_DTFTFF)
 			;
-	else
-		while (readl(port->membase + UARTSR) &
-					LINFLEXD_UARTSR_DTFTFF)
-			;
 
-	if (!(cr & LINFLEXD_UARTCR_TFBM)) {
 		writel((readl(port->membase + UARTSR) |
 					LINFLEXD_UARTSR_DTFTFF),
 					port->membase + UARTSR);
-- 
2.47.0


