Return-Path: <linux-media+bounces-16880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E539604E8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 646D1B215A8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AFC19AD6E;
	Tue, 27 Aug 2024 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LAYa4RqV"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA193199E9B
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724748837; cv=fail; b=EK3vNORHPq4zCi7ljFoXrxqKSzcfnJ1op1aPLwWfiJ2VOqgyBi5cJGAzPoFGgZY3iIAXkBcc/Vv2OtOPKCJRzWoLG9s6WLjk7WUhujuI/A4xeTAe9gUV1ZrBboLslQ8a1MWgsg75Vu1yh7M0WmM4R3Q4tCKVtQvauCd+TiQnqoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724748837; c=relaxed/simple;
	bh=1bvpkvIlSZLrUF7aKS3NY5e9cM6SoJL1XO+ANQTT3zk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gMEq/1kiz/MHsVAA5ByAR3qd2QSmOq9uIQ6MZJM13Apovxzsa6yaHCujg0gnFRZaUs64XOaINxSr6WLOw5NN+bOMBD177i9rYgJisxKs1HceCJAovBakyAcO8qH84l6PLWfwIhbCDXGgIHWzlnzmTKX3HGUy4Iiv7Oy8gjc4LJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=LAYa4RqV; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1SKoYWe5KuVCCsgy0A6QcwiiRSXq3ehEFKoyvLJlR7zxZWbArHK2Fp8xCxF2HYqb5Lzwp37HgpdY+nZtA6S2ipQvNwLYS9cB5EedTFX1c35gvXsunJYg3OKcamVANSyUHT4czSAGcDaAuTnKKCsQuA+FjHMauVdT6YvVolQwf+c6+3D3v2dSldWWAbAvSSnvpESP6b7RIUpQErv0SWK3z1aE7ZmPqEEWAoPfhAutYQmyc4YFwW2Lo34TiFzg1F2tDVTXk2ZnFgxv4MEyLb5DHkSOH6/W2l4c+hHpTlwOlavq5W0Oe8WXjCGG7y2nSrekkN7hGLyRfuGjdGyl963Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bvpkvIlSZLrUF7aKS3NY5e9cM6SoJL1XO+ANQTT3zk=;
 b=eFbTCuZ3EchQ0TQkLNfEjXy75XHR1N6mXaBFD9dc0CUhl8y2Zn5fHXXG6opN4SH0saOd8p3ISRq67kHR7g6VCPtHtlMPAFWc8ugY2p9M7TQeuhsvD0wv2RHtxCmpMDASVBgPH9hi9WVVAYJKIOI/vVAfcqxviYKqqbUjhnWFSb/pnPzcL6ZLTNwdx3xgl+FywxX14favCgprRwlQTEZ9LL4f4AvYomOhfi1ZUtE2EK5iZC8cXvNJv8ICXbneUfj8X7Bt5u4PKkch5Xl9ry/cffEyUaX2fKS3upQC3bO4tagHOTTzWUH/rrKpQGzkzJPSYClmfoftEIFmeeze1w7qMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bvpkvIlSZLrUF7aKS3NY5e9cM6SoJL1XO+ANQTT3zk=;
 b=LAYa4RqVg84ypoUeZtEXTxI3KDL54Vg2idYDSozRHXVLbBVe5R6caDMocmpiUrUUOMHW477+X+KsXa2suqFTFYOWE6vvOk1rC3dwGHZEh0cPf2Zz172hD6bYi4Fl+dzALioVsPelJwghK4n7uZGT3mxUZn0UU9rISPc4IZNsGwTf7SGRFB0/yQ3m3aPgDX2wkABcXJmM2WdFjAOAxHn9Eara/0LBD0TVpLu/WZ9Gq6BDYiVlX6YtzhjZJdtXhRdlzpK2PYO5baZA2wfLU+1HwLOztpOEAID93WTfN7xPY/F6vlO4a6vSEP+bKn9YCeSqcVAuLhCK3hiyIiObOFgY/w==
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 08:53:51 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::1692:c829:d50b:8c30]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::1692:c829:d50b:8c30%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 08:53:51 +0000
From: <Hari.PrasathGE@microchip.com>
To: <wsa+renesas@sang-engineering.com>, <linux-media@vger.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <eugen.hristev@collabora.com>,
	<claudiu.beznea@tuxon.dev>, <mchehab@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/8] media: atmel-isi: use 'time_left' variable with
 wait_for_completion_timeout()
Thread-Topic: [PATCH v2 2/8] media: atmel-isi: use 'time_left' variable with
 wait_for_completion_timeout()
Thread-Index: AQHa54HhulJv+czK0kyXA9s3jTDJmrI67kEA
Date: Tue, 27 Aug 2024 08:53:51 +0000
Message-ID: <260d1afe-1d0f-42a8-b7af-f4f7a642638a@microchip.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
 <20240805215123.3528-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240805215123.3528-3-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|SA1PR11MB8575:EE_
x-ms-office365-filtering-correlation-id: a520d546-ee33-46ae-be44-08dcc675c5ee
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3NpWXAwRXoyZVhMK0U5ZDRmS0J3bC9LWWFxd3d1QWRZL1J6eFhvVE0zTk5S?=
 =?utf-8?B?OHZKS0xLNjB3dzZHMGkveTk4U1dGRnR3MkNKV1JSSmRoenVMS3dUeENtQ1JR?=
 =?utf-8?B?Zm9SVXA3MnZsMktsTFBtWmFKR0thK09tZXdvQlA3WDh1NFlxY21LdDV1VFIx?=
 =?utf-8?B?R0xRUmNncXB5VWxxS0dwOUoxWXRwVjdqd05aSERSNkhsUUNLVnhxa3VOVlYx?=
 =?utf-8?B?b2V4VXBieHNBcC9UZHRtRzk5dENqN0JNS1VjK3ZhQlh0dUswSzJPOU9jcUFK?=
 =?utf-8?B?K0tteVZRWWRlbkhTQ0lHbkR5dmdISG1Kck1PTmpJR2dnNGhHdTlJOHJxWTNo?=
 =?utf-8?B?c2cwMTNRM0ZhWFJiWms4SVJSRmZQWDJWQUtoaHVEYTZ0a1hYd2QwZ1prYU1I?=
 =?utf-8?B?OUdFdkIvelJrdmZJRnhnT1JxdWlyOG1iVDJUY2oyK0VkYTI2MkNwT3JlNDdL?=
 =?utf-8?B?N2VESTlpUll3My8vZVEvdTk2TCtuTVZGZXo1MVlrdGNkUXErWHNKL0NZejFY?=
 =?utf-8?B?QVM5aXMyN0YxKzNhM1lNQzhObkRhYVhVT2NxdW50QWhxdmJ6RXhtUkxaZ1k1?=
 =?utf-8?B?NWpXVHhiUGpPTUkzT2xLTnJOUktwRzMrODNCNE8vVmtxVGQ1UHZPNkx5TTZY?=
 =?utf-8?B?RnRHMG40T3hPNHNiQVdzeGV0OEI4TloyM3BzQnhYMERFRFNvVDlsMlVXRHpM?=
 =?utf-8?B?czEvWjBkeTBWRHZqMVVhR1IwTVZTclZoWUdScExuT2ZWeWN3Vk1OWG5qc04z?=
 =?utf-8?B?ODFML3BPUTdndFZrWk1WR1BXK2s5NXZNNFZ5L2l1NnYxZnEwU3JLU2lKUXZL?=
 =?utf-8?B?QW1HUFF3em8xVkVDNU5aM2RnVjlXQ1JpSDBjNXpLcmIwbFRTdndnS0JnTVZ0?=
 =?utf-8?B?UlBnSzNDWjRWUlBtTGYwRXEwTGJUWmU1QWtDMXIzL2JOZVJra3RwbWhmcTFY?=
 =?utf-8?B?Uk5SK2liWXdNTnAxek1QdWN4TnJiSWZiQ0RhL3d2dk1WTEcvTWJWelpjNHFP?=
 =?utf-8?B?K05IK3pZOEVFczd5MXdYVFllVTNCZzIyUXZwWGsvQjg3ckVpQytwL1lBZ1ht?=
 =?utf-8?B?YktodHUwa2FDd3R3WWVsa0xJNG1iS0E3TnRhd1BkOHRYaVJWU3FHbzBQTE81?=
 =?utf-8?B?N1ZoTTJ3MGJ5TUM5aGZYQkE5QmpyUmgwMC8wZm9UOE8zUklVNWtOZ0w5ejIv?=
 =?utf-8?B?bVhwTmVUdjY0VlhqcDRSa0hPVnhjQjBRMlFxcjJpRjZlMFZBRDJKTE1VZENa?=
 =?utf-8?B?YTFZNXVPS1JqVTUwdFFIb2ptakQzSFdJVmRBN2g5S3hIckxFamtVQ3g2NXlV?=
 =?utf-8?B?WmoralNEQlM5M0NpaE56OFNzdHRXc3F4NFZHN0kyMlJSNFU5K0dXYnR0cmJB?=
 =?utf-8?B?dmcvc0I1RE9kc3VpWitseENneHJXM2twaTB1SmZwV0F6MXgxREFKdTFROVc2?=
 =?utf-8?B?YTQxYjZhRU42K2ZXWHlYbkk3d2lUVzZ4QVZPbnN1ZVVMNXJOSDVCbE1lYVBs?=
 =?utf-8?B?WU05REtiVXQ2S0lJbEljZ0JVUDR6QXBiZE94MW5rZ0IrS3FnWStxVzdiM1U5?=
 =?utf-8?B?SnFYVFRObmxUWGRHeUNjaTZlbnpFQ3M3bGtJL0VYRmt3cTJTdTdPVnUzZTVX?=
 =?utf-8?B?OHZic0ticFRFbWxlSFBINzRpR0NvQkJnZTFLaGR5WVNSY0I2bmpURDJCYnNR?=
 =?utf-8?B?eGlCVXVUQk9ZMEpyc0lhMHgvSlc0WVEvT3BYUHVMR2JsSzByK014NTZkRUdT?=
 =?utf-8?B?bFp0WlBveElHNDhleXFkdGpuTU9uMWNaRDcrRXVuZlV3NTRnaytYQ05UYVBG?=
 =?utf-8?B?OUNYWFFZOVI3ZFp3NjhFMUJGZWNMK212Sk4zYkE3eUFQRk5VamxzTjV6UWhS?=
 =?utf-8?B?U0FVeWwvRVVGZTBJQ3RSdk1VeWVrcGRzUjBEdlpVRHdFNVE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDFXWnYwUFppRy90Q1JZcEpmQ085WlFOTkNpWlVHQ1FBU240NUVlLzdEcmtU?=
 =?utf-8?B?OVYrM1hOcXV6UEtmOERvc0piR0EzaHdJd3VIbDlDc1ZXdnNWd0ZRUGF3OFcv?=
 =?utf-8?B?endnWGtKcGtXdGk0RldwQVoxUzJhRVVuRzBSdkJEYkhDTUxmQmhKeWRtQnFx?=
 =?utf-8?B?a09OVWhVcHRzRkxTT2hjMWYrc3QzSGZqRWYrWjNTQnRQaFNEem13cVBwbGVZ?=
 =?utf-8?B?R2p5aTgzSmFPUE9na0JTZzJIT2lsTHpydkxHNWxlNEIxTjE0dytBNEVOOEVQ?=
 =?utf-8?B?anJ5TE1BN013NmxLQy9Yalc1Y0xRNnQ0eU9LUEY2aG1RTGpOUmVNOFkvZVk5?=
 =?utf-8?B?SDZHNGx6aklHdGNucjl4blZNQUpUek9MQUNJZUR4bmQ3SWF4WHl0T2VPMFdp?=
 =?utf-8?B?WHQwSHJaOUk3YXF0NVZ2S3JzYnNGdG03M092T2dqaEc2dmFseDJxVWtCWStr?=
 =?utf-8?B?Tm1iN0dEa0xtSE9EaExZYTdUMUVjSGtFd0N5UG16Tmh6dExXd3p1VUR5MXNh?=
 =?utf-8?B?Wlo0aVYydTlSeW1ha2Y5aTJtYmFUMlNBZXVSa2FXajRTWXV2UXdldkFiVUJE?=
 =?utf-8?B?cXZRbW4zbHErTUMxbHl6QnpVUncyL2NncjdRR3FrSzNHU2hWSExjenNTdjVx?=
 =?utf-8?B?NmtkYXMrZ3NMcjhjMnljdUJ6TTY0UXZGT1A3QlFWeFNqWnJFV3BoV1lxbnlU?=
 =?utf-8?B?cFlxclM3ZmdQWGxkazc0Y29uMzRjZXZFYVMvbzBpOUoyRElwNHVXSG1Qc0xp?=
 =?utf-8?B?NHp5RnhndkhkeVFyQWdiWEQvYkV6Z3hxZ0lJdUoyZ3ZWbEk2dGFLeFF6SUNQ?=
 =?utf-8?B?eXcxQ3pOemh1ZGJjcTI1RUdpRGtwdFhvSjFWZXc3Q3lIQk5tSTk3akswUjhq?=
 =?utf-8?B?Z1pDSFFDSXBMRDBwMW5RL3BVN28weDI5TjkyeWFhdVJ3Nkxldi9vOXM0eEEy?=
 =?utf-8?B?eFluSEZXNHZ1VVhuSXpTN1h4dkZmYjViODNUOVRvcFB5LzE0L1FrVXpmMWNh?=
 =?utf-8?B?QU4xTEFIMElITXlWcE1TN2tSNFNJVjdmOCt6aHgrdFZHYnVHMVNpRzBDZHJG?=
 =?utf-8?B?TDJFMnBBRHE1ZHhsbTRscFpQK3FRUVRnVU9kRkl5cHAwNnRQMXRXemFJNkhJ?=
 =?utf-8?B?ZVpLY3dIcXNGTTRzVWkzbTZJc3hIZE9laHdMT1IwcmtjaEhabXBiMG9xUzA5?=
 =?utf-8?B?SXBuWmxXS2FCTVlSZ1VxbENVY2pVeUNFUVdnOGtSUThqSHhvcHlYR1VSWSsw?=
 =?utf-8?B?MmFGQmNhMW5maVAxczFWSXdqazJubWFJS1RCdXNhTGJNZ3JSc1RpZjYrNXhY?=
 =?utf-8?B?cG03RHVoWU83R0prSzM2SUhIcFVhOTg2TDFOSDhIS3c4SXcwQkpLLzFLb3lY?=
 =?utf-8?B?QUdiM1gxK1Q5d2ZGY1M4ZWZaYVBRRlFLem1vSEszeU1RNDV2ZFJZbldiNzhI?=
 =?utf-8?B?bXp0cURwOXdTRFJoNGRDdG1TR21MaWc0YXNTbW1HSFZidXhsZS9nRzZtZHBS?=
 =?utf-8?B?d2VEZUpWeWt6MDBYU3dObUt4L3ZSRDIxQjVJdTdUQUIxbDFFTUxLSitaU1dX?=
 =?utf-8?B?cFZMZHkrNS9oVWI2WWpDNUZKUkcrZTBadXp4cVFheEszOXd3UU1nbGxmSm51?=
 =?utf-8?B?clI4NmF5YUs4NVBMaXY4WmRBV2U3RDFDN0o4M0NoNFFoZjBVb0xOUys1RlNs?=
 =?utf-8?B?dzl3Tm5YdzhDWUIrQnUxRUJuUTh6bDZ4dUd0d04rTDhEWnBJVkE1aWo4Slhp?=
 =?utf-8?B?MmlZYmlCSVpuTFcyU2VlUE92RzRPOXAweHBWZTQyMGVkdCtYb3dxL083eDA4?=
 =?utf-8?B?Q083OFd5VTZWbmtmOUpaWjBXeWlwbExUaFpDZlhRYUI0YUI0Zy81eU5UUzdy?=
 =?utf-8?B?TVRmSGM4aVRBbGMwQXNDa2FSSW4xNEF6akFOVUFwenBMQ0NQRE4vMkhnT0pJ?=
 =?utf-8?B?MkNjbDdYcmpQOTlxQmh5LzF4ZGJOWXRwb1JOUzZWcEVLWlRmZUVhb29yVy9Z?=
 =?utf-8?B?eWh2NElHSXJ0b3hQLzJsckhZRnNIN0s0WlFuWlp2L3A5M2xjZmpTM2R5M01I?=
 =?utf-8?B?c2tnYnpWZG0zT1d2WUpPVnRPWUhReDZqay81RDE5bzFZNWxxMFcyaUNaN2VG?=
 =?utf-8?B?YW1qTms5K1Y5QThrNHJ2YU9ZYnI4SlZpdDQrcmJ0K3JLdEVyWXJKSU1uMTc3?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6F6DF55BD02314999D450CB8F5581E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a520d546-ee33-46ae-be44-08dcc675c5ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 08:53:51.3701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3a4F2SvkOEpoammvaBMbr/L3SuyPEbuvVdD2Go6TCGrZCydN9GppFtK44pc5PknJvmqblriZPJT/kAEDB0h8uZEKQhkQF6+eIwsGaT/Abwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575

DQpPbiA4LzYvMjQgMzoyMSBBTSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoZXJlIGlzIGEgY29uZnVzaW5nIHBhdHRlcm4g
aW4gdGhlIGtlcm5lbCB0byB1c2UgYSB2YXJpYWJsZSBuYW1lZA0KPiAndGltZW91dCcgdG8gc3Rv
cmUgdGhlIHJlc3VsdCBvZiB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBjYXVzaW5nDQo+
IHBhdHRlcm5zIGxpa2U6DQo+IA0KPiAgICAgICAgICB0aW1lb3V0ID0gd2FpdF9mb3JfY29tcGxl
dGlvbl90aW1lb3V0KC4uLikNCj4gICAgICAgICAgaWYgKCF0aW1lb3V0KSByZXR1cm4gLUVUSU1F
RE9VVDsNCj4gDQo+IHdpdGggYWxsIGtpbmRzIG9mIHBlcm11dGF0aW9ucy4gVXNlICd0aW1lX2xl
ZnQnIGFzIGEgdmFyaWFibGUgdG8gbWFrZSB0aGUNCj4gY29kZSBzZWxmIGV4cGxhaW5pbmcuDQo+
IA0KDQpMb29rcyBnb29kDQoNClJldmlld2VkLWJ5OiBIYXJpIFByYXNhdGggR3VqdWxhbiBFbGFu
Z28gPGhhcmkucHJhc2F0aGdlQG1pY3JvY2hpcC5jb20+DQoNClJlZ2FyZHMsDQpIYXJpDQoNCg0K
PiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJp
bmcuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlz
aS5jIHwgOCArKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
dG1lbC9hdG1lbC1pc2kuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNp
LmMNCj4gaW5kZXggYzExMDhkZjcyZGQ1Li41YzgyM2QzZjljYzAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNpLmMNCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2kuYw0KPiBAQCAtMjQyLDcgKzI0Miw3IEBAIHN0
YXRpYyBpcnFyZXR1cm5fdCBpc2lfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4g
ICAjZGVmaW5lICAgICAgICBXQUlUX0lTSV9ESVNBQkxFICAgICAgICAwDQo+ICAgc3RhdGljIGlu
dCBhdG1lbF9pc2lfd2FpdF9zdGF0dXMoc3RydWN0IGF0bWVsX2lzaSAqaXNpLCBpbnQgd2FpdF9y
ZXNldCkNCj4gICB7DQo+IC0gICAgICAgdW5zaWduZWQgbG9uZyB0aW1lb3V0Ow0KPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Ow0KPiAgICAgICAgICAvKg0KPiAgICAgICAgICAgKiBU
aGUgcmVzZXQgb3IgZGlzYWJsZSB3aWxsIG9ubHkgc3VjY2VlZCBpZiB3ZSBoYXZlIGENCj4gICAg
ICAgICAgICogcGl4ZWwgY2xvY2sgZnJvbSB0aGUgY2FtZXJhLg0KPiBAQCAtMjU3LDkgKzI1Nyw5
IEBAIHN0YXRpYyBpbnQgYXRtZWxfaXNpX3dhaXRfc3RhdHVzKHN0cnVjdCBhdG1lbF9pc2kgKmlz
aSwgaW50IHdhaXRfcmVzZXQpDQo+ICAgICAgICAgICAgICAgICAgaXNpX3dyaXRlbChpc2ksIElT
SV9DVFJMLCBJU0lfQ1RSTF9ESVMpOw0KPiAgICAgICAgICB9DQo+IA0KPiAtICAgICAgIHRpbWVv
dXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmlzaS0+Y29tcGxldGUsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIG1zZWNzX3RvX2ppZmZpZXMoNTAwKSk7DQo+IC0gICAgICAgaWYg
KHRpbWVvdXQgPT0gMCkNCj4gKyAgICAgICB0aW1lX2xlZnQgPSB3YWl0X2Zvcl9jb21wbGV0aW9u
X3RpbWVvdXQoJmlzaS0+Y29tcGxldGUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG1zZWNzX3RvX2ppZmZpZXMoNTAwKSk7DQo+ICsgICAgICAgaWYg
KHRpbWVfbGVmdCA9PSAwKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRVRJTUVET1VUOw0K
PiANCj4gICAgICAgICAgcmV0dXJuIDA7DQo+IC0tDQo+IDIuNDMuMA0KPiANCj4gDQo=

