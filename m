Return-Path: <linux-media+bounces-16707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FD95DF7F
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 20:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786911F21904
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 18:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA1D56742;
	Sat, 24 Aug 2024 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="teFtjvDY"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0014A85;
	Sat, 24 Aug 2024 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724523252; cv=fail; b=lzO0FdRRW+xtPKUCZjcW7BLpObfITTSP2GGT5cutpuEXyhE7kY/x3lbvVHVA37efzvVEP9h37VeZ/5mQrqLG+7zGHni9rKftrPjk0+xTaMxLhUj6tjtJPYDmXwfQzIY2C+e3quiodrs5/cc1ggcnd+QXg6dhJ9vQaIHzK2KhDKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724523252; c=relaxed/simple;
	bh=zuguwlgiF0t4uChR1z/frkXIbp/cYSwCsHXpqpE6Hw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CxDZ7lKabLeapW2BFA0FhD6a/Im/8nSp8l2xmGZrHBE1xRHGwe3BfJRjvBWUEndchg1rrJguC6FnAtlSEZEo2Ez3k9xM40vl0FpYmkNULUraE+/p40V1cfl6xlZ80x1iQ6QkvXSlIdfzwbh4nEHh0dD7QIkDvaX/np4ptYIFaII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=teFtjvDY; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjsADeaRMfIqY+4+tFXKAs+pOAGjygCWCKwhPraWpTZ4XUheaPknIK1Dlc+AFLJP3o+fHbu6vqL18CpNxMRgT8zmb6jruvQrEOae6J2sRlN2gjE23Z7xpdg1Y0m/UtzBzdQ4sOP0XUyjBMZz9n9C6vvLvB9Oy8av8dO1WhLXJLlNG5BPp7bbCPeH99nIDQm+s0WVOHhrA+/z5LYLCD9FTgZreaPtfAZSGrya5O+28aHidG2PIBTXAfTroqO1FQsn4HO/nMESonzvGPyAAvzl4uCjHDeebdTkvlSztAVYlEGnBTTDEQM8tClDFT8KTnFOlIgzk4VTQ0K25Xeyn84qiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuguwlgiF0t4uChR1z/frkXIbp/cYSwCsHXpqpE6Hw0=;
 b=c9l5D4s8N2N9U+y10j+T/G5lx1qxJnKDcvyfRF8le23Q6Dh0eI21t08dxbjQNOaPb7xxd7u2QPbEf618rS0zCIoPdqM1kGP3z5xQ4nLzdURVmDo95xvPz4/3/QNMOXvYXszkLGJbmNCKBdBARlndeGdKTo5fwmr+a+nmaqk0T+hPPi6dY/OmtNBQIal9jladT8vZliwoM3m7i9EFg07X8JBjkey5CHhAkFG4MRW5hh2yrLTIiXgw+C2reOOPV84K5E9G9fgwSL7vozjx9LSbi9QXjmUbreATBJFmrxDBflUaNWd0o2Fzvs+cyxUJ4837ac5OLxgsTKZAlObaA2ooxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuguwlgiF0t4uChR1z/frkXIbp/cYSwCsHXpqpE6Hw0=;
 b=teFtjvDY7yQlk05zO9XYr28BH2GDg3XV1m3ch3SK6E7FiFtg8Csi8lfKNahvrmlQ7a2/Uo++3tVaf0OGPBiubtjcmg9c92eegOdsYZ7/+X36jKeqc2AiAhqeBnskInICNj0bBM1B5e+LP7P4a0Cdp4A6f1H986P3PPJn+a/C8qM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10889.jpnprd01.prod.outlook.com (2603:1096:400:26f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Sat, 24 Aug
 2024 18:14:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 18:14:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob
 Herring <robh@kernel.org>, =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund@ragnatech.se>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Thread-Topic: [PATCH v2] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Thread-Index: AQHat3DU9UcAKLTxl0KePlBhGKrH0LI1dU2AgAG+XoA=
Date: Sat, 24 Aug 2024 18:14:04 +0000
Message-ID:
 <TY3PR01MB11346F1E7DD030DED6A7E71AF86892@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240605175010.405638-1-biju.das.jz@bp.renesas.com>
 <20240823153533.GQ26098@pendragon.ideasonboard.com>
In-Reply-To: <20240823153533.GQ26098@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10889:EE_
x-ms-office365-filtering-correlation-id: ded8e1e1-1142-4ee3-8df8-08dcc4688984
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RVZwWjN0anZpMTVzL3Z5MXU4Q0VaUVRJbnhCVnc0VEhYRVNrQTNnSE5RVFRE?=
 =?utf-8?B?dmQvTEZEUzFadDJ2L29pbUdFYU03VTlMVVIwTzhoeG8zT0lFWEJFNGV4L1NZ?=
 =?utf-8?B?RUxvL2ZWWG9iTGZiY0c0UEY5cTNMTEdBWStTd0wwRTdITFlTUGtKa3I5Q1VD?=
 =?utf-8?B?TUltTWl0YzZUTVU4VGZBSk11NnBVQlp1V1dlajVIVTk4dFBxY3ZjOTBKL0Vj?=
 =?utf-8?B?VlMwWDlLZ2dYNlI0MVdiOVU1YnBnOVJKeGRnZDY1aGJCM3VmOHpEVFJ6MDdu?=
 =?utf-8?B?Z0lZbkNlU2V3enZ3aWdXUGdwM3Q3WEdDMEF0MUg2MW5ZemtiYzVmSzU3MlBm?=
 =?utf-8?B?OWY1RjZpbkNKRDEzT2tvNTJqMTBuM1Y1Vjd5RWw1elhHeHlVOTd3WVFET0VH?=
 =?utf-8?B?OFJaZ2JBL3hGT3pobHZkelREeDB3eUZOenhkaWQ0Tm5KdDlSWUU0WU9XSGd0?=
 =?utf-8?B?Uk9OazVrN1AzMThpdm9seExtRlRUWkFzeWpHS295Z0IxdGp3c1VHUmwwaEt5?=
 =?utf-8?B?amRZUTdVeU44UU05Q0VMVm5vSGlYaDA4WFgxRmp6empwWGZFT2FKTDVPaGZ3?=
 =?utf-8?B?TVFFWjlqZlcyTHZJZ29wUDBiNlFYZS9ybjJvc3R4RzdWVVFmRk1uRmhPZjB3?=
 =?utf-8?B?cjhFRkx1TmJpYkNST3JzWmJ5Z2NEWkRlV0tQOURxOEJVeldWV2JiMm1yRUdM?=
 =?utf-8?B?M24wY2NsL1VFNXVDUGdrMEtPdnFrdXJJMGhHVDZFVjJqMTJFU3d5Wmd6aG5m?=
 =?utf-8?B?TEZJR3ZacVpKaXBBM0l0a005dmswVHdWSFM5R1FZSjV5N0FMcE4zNXI2WUsw?=
 =?utf-8?B?dC9jVHR6N2drNE14RXFHTVBFczk3MmhPMFdxaE9Oaktpd0Z3aFd0NTlGaWh2?=
 =?utf-8?B?L2ZVMVFIbHl6L2RoWTU5M0pKbFZqWHc3NnJwY1RjM0lnd3UzSmhXMWhXZVFk?=
 =?utf-8?B?RHlSbXVhSTJodmRmN0Uvamx1RGRXa0dWaVVsYVIvWnRpZGxHK1RvNlcxN2Vu?=
 =?utf-8?B?QmxCT0pvRVUySVpvdHlaMCtxT3p5bUxMOHlySk4waS83NFFGWTliYzFwcXB2?=
 =?utf-8?B?b0lndmlHSWpJRlhvcDd1cHlhODZZNFlXRG5rMGdnRHAxTGFzbWtmQXREMmZV?=
 =?utf-8?B?MFNGWWU1SEFlWlE1Uit5SmE4K3NER3RXTW9BdXFWNmU2OGM0b3JWL3hibStC?=
 =?utf-8?B?TWdlVElYVzRUamI5d1FLazJucEhlREF6U3g4Ym5vK0I4UEovZW8rV0NhOVpz?=
 =?utf-8?B?QklLOVdrcmFSb0hiOFdMSFVjdXZqU1pNK1VBRG9xQVFqZ0ozOGV1a1ZVMFdj?=
 =?utf-8?B?M2RQcTJGYUhFZS9SMGZEcWR5djV0VTE5b0J1ZHNRS2hyM1lSejdhQW9yS2lF?=
 =?utf-8?B?YkJkTkFkZ1JQa1g0dFlTVUsvUDRCZ1JBUGdxY2hKbE5UV0R5OC96Y0IrelR5?=
 =?utf-8?B?UlV1QTV6UWlta2RLOFJzV3NXNlNRMVRvanNFNjBnT1g3cXNnb1h1N0JNWHEv?=
 =?utf-8?B?TGJNUkhGem42cW1zbTE1aG9lTUhBOVBCTzhaMGVoVEJQRFl5YjZhem9rL2U4?=
 =?utf-8?B?OUlGVmJWWVhDOHlkcE9tRUMzSEpjYzhFVkVGN1UrVkNYWExGS1BSRGZwZWI2?=
 =?utf-8?B?YitvMmJnaGhmbzdVcG9yRjFRRmRtb3JXRElxdjZlaWhGOUpLa05tTitFVko0?=
 =?utf-8?B?cVdWckdJQXJQaDBGWC8wbE5hYWRaV1FQMG16Y3RPQUNtdnZoZDRsS3RUZHhh?=
 =?utf-8?B?c09xVjVmRTRxVDNxY1BMNkZuRHZyUWU0cUFvNGJpbVV0Ullvbm5qdmpMR3lI?=
 =?utf-8?B?dGhSVkRmRWJUcVkxWTl5bm56T2RtYmNmNXhjN2JKeW5MRGtsWENwa2F6M0FR?=
 =?utf-8?B?a0xRcE9KQVBKUDIvVUQxWkFTd2t0T3M1clcxa253M2tyMFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YkxsNldaakVGSkxXOHBUaGtxZXVMY0IxOEdGMHhXYmRKUVo2VGpPSEZSYnl5?=
 =?utf-8?B?WnRmZHZFZmRaWmZYRExUNjk0cjhpU3EyK3FYSTZMQWJMOXI4OVV2d0IyMTRQ?=
 =?utf-8?B?aGhYQXQrMmZVTWhWeXBRSW5UbVY1YVN5em9sN2JwUGx6QVhKUldNQmxmVVBy?=
 =?utf-8?B?bGxHc1BhY2xGcGE5RE1FUmJhaEJIV2s0MTZ4d1BVa0FsV0tKMmxFS0pFN2Jl?=
 =?utf-8?B?enlzRDNMUnhVT2ZRRXNNOVZYZVF4b2tMYmh0eXQzdkFVR1ZraWE0cDBNdCtP?=
 =?utf-8?B?bEZBZ3NZWCtuSm1LVTY2K2d1U3l1RE0vUVhnajBUdTVrTWZHTUF6LzJSSUMy?=
 =?utf-8?B?Q2lwdFd0dFBxZXJIVXVzWmpkK2ZXR0gvK1pNYXZDaUdXeEs5STBSWXZlRDZt?=
 =?utf-8?B?aGN2Z0VycGVvMFFkU0tpL3l2d0xqeCszRUZERm4wTXI1V3BwSU50blZSSTJk?=
 =?utf-8?B?REd2cmZzSk1QZFpId3ZldTE2TTlDaUw2Y2xFaWZjVWpJMFVmMmZxTjZKMlBW?=
 =?utf-8?B?aUFmUGpEWGNPUnNpUzUrKysvaUJTYStxekpWR00wMjJKYUpaWlZIczRSREtF?=
 =?utf-8?B?NTE5SWptVDZmZEY1OG1VNjR0TTRlYVhhVkRqdlVUMFhWQzNSdCt6WWtkVFlm?=
 =?utf-8?B?OTJqZHYyM1BESGtVeXVtWEgzTS9DT0VXYjNIVlBZTUVORElDNzV3RVVTbm5n?=
 =?utf-8?B?MGlLVFNyVXFSeUcwR1FJUVhMNXpSSTRpVFlpZmI0T2FXdVBEV2RBeE0yOXBN?=
 =?utf-8?B?TXlyNzFhMGpTaGFJL0FuVk9laGpDR0M5NjZZODRFK2w5Nm5leERpTEtYakFt?=
 =?utf-8?B?RkZoY0x0Y3lDUUQraU9xSHl6bXkwR0l6Z2RnZlh5UVo4Z0NZQ2xuTkJrUE51?=
 =?utf-8?B?R2hvWjBCVThPQnlHMDM4UExaM1pBQ1FBbkN6MFRZUm5vaDJPQXRDVDQyc1Nm?=
 =?utf-8?B?OG9HSitSODdVaHhmL1F5ZVA2WXd3MU9CVTk5VVhIM2FUd3FqMGxGTklEdHQ0?=
 =?utf-8?B?ZUl5c0NLbkFlRndFeTd3UjNBNU9WRWI3WGl0K2lnSDMxcGFkdTlXS3pmcjh4?=
 =?utf-8?B?aHBoaW9WRmx0RzNJTVN3d0xnUkg4VTc0bVU2NUJYaGFxdDZQZW5vWUtWZTZR?=
 =?utf-8?B?VnY0di9oaGxUOWFzV2o5TTduMEptNzgrbkxxR1RSYTlsYmFXUnV3ZnpjdE1x?=
 =?utf-8?B?QnRBcTQrbCtBSFJiTVdiR2ZsMWI0ZEE2QnRJZ2ZMTVppR1lXNjlGM2xyd09Z?=
 =?utf-8?B?Y0Y4Rk5JV3MxMUxtc2w1MklqSVUrcFVHejZEaEcvQUxrV2QvNDcvbXl2bTlH?=
 =?utf-8?B?blMxb1JYemYwQW9kNHVvWTRPTDFCOTlqbVg3S01Ya3IrNmcrd21NYWIxRUJn?=
 =?utf-8?B?anU5SkppWkp3Wm1VQTFIeEtpUE5qeFVOaUtLK0FUTjNyY2Nwa2VleTVqN201?=
 =?utf-8?B?VW5neW1hRlRWaHpidXdqN1pOUmpabnJhaXlTeVVxVU42dUU4Tk1tU3FvbldQ?=
 =?utf-8?B?Rkk2bktEVUFRTzlrQnNETUdDZk1MOG8xOVhsY3NpeHdNT2FmS2ZCZ2FwdFpL?=
 =?utf-8?B?MkVscGN6ZUJOZkpHSmlLYW1SenA4U2JNWWxBSG9BSlZYWjA2anlOSFFoYmhD?=
 =?utf-8?B?NUljWWJvTXBpTjRneHdMU01sSmtqV0ZBeHV1MDY1Zys3aGJrQytTdDBNSEQ3?=
 =?utf-8?B?dytldnJ5eHBGem1KMTJuN05yNEF6RjVkbS9Ba1pyVTlnZ3VEWW5pU0JFUVVF?=
 =?utf-8?B?RW9PLzFvdkZsVnZPbmtBVWorNXhIV0ZWaGtpZ3IwempSelBRTU9ETDJML1pB?=
 =?utf-8?B?K3VzUktySWpyMFhiQWNraitMZmo4UjFZVnl2VlA2OWUrQ3FtSFY4U2V4MDJD?=
 =?utf-8?B?WktrSmNDZ3NHV05oM01IZWI1d25YdlFhN2xOSjlEMVNBWVhScE9NNnFwcGdE?=
 =?utf-8?B?UC9YSlp0OVo3cTlkNGF5TzBrZWtZajZiSTUwQSs4MGNrTjlidUdOajBMbHgv?=
 =?utf-8?B?UUdMc2VpUGRaVGJleUNKRzFaVW84STR3V0dodVQvNVlndHIzajZtN0Ezbzd0?=
 =?utf-8?B?MmtrVXBSR0QwV3FnK3o5RjM0SUgzbkVUNndDL1Fiam0rdUFjUG5adUgwSk1X?=
 =?utf-8?B?a3hhVy8zRGRPSXlBK1JzSDg5azJ2cmZXL24reTQzUG9hVTBCN2xLa0tlWWE0?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded8e1e1-1142-4ee3-8df8-08dcc4688984
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 18:14:04.2086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnASryBwT1MsqlT17SPF/j/GufEj/2R9ZRa3VL0LwnFlhnptO8qTT22hKObmNMKq0B3sGe46HPlzoWF8r8XrolKrT0dplazU/c5xVSBqx2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10889

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyMywgMjAyNCA0OjM2
IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIG1lZGlhOiBwbGF0Zm9ybTogcnpnMmwtY3J1
OiByemcybC12aWRlbzogTW92ZSByZXF1ZXN0X2lycSgpIHRvIHByb2JlKCkNCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFdlZCwgSnVuIDA1
LCAyMDI0IGF0IDA2OjUwOjEwUE0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IE1vdmUgcmVx
dWVzdF9pcnEoKSB0byBwcm9iZSgpLCBpbiBvcmRlciB0byBhdm9pZCByZXF1ZXN0aW5nIElSUSBk
dXJpbmcNCj4gPiBkZXZpY2Ugc3RhcnQgd2hpY2ggaGFwcGVucyBmcmVxdWVudGx5LiBBcyB0aGlz
IGZ1bmN0aW9uIGlzIGluIHByb2JlKCksDQo+ID4gaXQgaXMgYmV0dGVyIHRvIHJlcGxhY2UgaXQg
d2l0aCBpdHMgZGV2bSB2YXJpYW50IGZvciBtYW5hZ2luZyB0aGUNCj4gPiByZXNvdXJjZSBlZmZp
Y2llbnRseS4NCj4gPg0KPiA+IFN1Z2dlc3RlZC1ieTogTGF1cmVudCBQaW5jaGFydA0KPiA+IDxs
YXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4g
djEtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGhlYWRlciBhbmQgZGVzY3JpcHRpb24uDQo+
ID4gICogTW92ZWQgcnpnMmxfY3J1X2lycSBmcm9tIHJ6ZzJsLXZpZGVvLmMtPnJ6ZzJsLWNvcmUu
YyBhbmQgaW50cm9kdWNlZA0KPiA+ICAgIHJ6ZzJsX2NydV9wcm9jZXNzX2lycSgpIGluIHZpZGVv
LmMgdG8gcHJvY2VzcyBpcnEuDQo+ID4gICogRHJvcHBlZCBpbWFnZV9jb252X2lycSBmcm9tIHN0
cnVjdCByemcybF9jcnVfZGV2DQo+ID4gICogUmVwbGFjZWQgcmVxdWVzdF9pcnEgd2l0aCBpdHMg
ZGV2bSB2YXJpYW50Lg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY29yZS5jICAgfCAyMCArKysrKysrKysrKysrKystLS0tDQo+ID4gIC4uLi9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jcnUuaCAgICB8ICA1ICstLS0tDQo+ID4gIC4u
Li9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jICB8IDE4ICsrKy0tLS0t
LS0tLS0tLS0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjMgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9y
ZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY29yZS5jDQo+ID4gaW5kZXggMjgwZWZkMmE4MTg1
Li5iODBlNTk2MGI4OGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9y
ZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNvcmUuYw0KPiA+IEBAIC0yMzksMTAgKzIz
OSwxNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX2NydV9tZWRpYV9pbml0KHN0cnVjdCByemcybF9jcnVf
ZGV2ICpjcnUpDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpcnFy
ZXR1cm5fdCByemcybF9jcnVfaXJxKGludCBpcnEsIHZvaWQgKmRhdGEpIHsNCj4gPiArCXN0cnVj
dCByemcybF9jcnVfZGV2ICpjcnUgPSBkYXRhOw0KPiA+ICsNCj4gPiArCXJldHVybiBJUlFfUkVU
VkFMKHJ6ZzJsX2NydV9wcm9jZXNzX2lycShjcnUpKTsNCj4gPiArfQ0KPiA+ICsNCj4gDQo+IElz
IHRoZXJlIGEgbmVldyB0byBpbnRyb2R1Y2UgdGhpcyBpbnRlcm1lZGlhdGUgd3JhcHBlciBmdW5j
dGlvbiA/IENhbid0IHRoZSBleGlzdGluZyByemcybF9jcnVfaXJxKCkNCj4gZnVuY3Rpb24gZnJv
bSByemcybC12aWRlby5jIGJlIHVzZWQsIGp1c3QgZHJvcHBpbmcgdGhlIHN0YXRpYyBrZXl3b3Jk
ID8gV2l0aCB0aGF0IGZpeGVkLA0KDQpPSywgd2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24u
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gPiAgc3Rh
dGljIGludCByemcybF9jcnVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgIHsN
Cj4gPiAgCXN0cnVjdCByemcybF9jcnVfZGV2ICpjcnU7DQo+ID4gLQlpbnQgcmV0Ow0KPiA+ICsJ
aW50IGlycSwgcmV0Ow0KPiA+DQo+ID4gIAljcnUgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwg
c2l6ZW9mKCpjcnUpLCBHRlBfS0VSTkVMKTsNCj4gPiAgCWlmICghY3J1KQ0KPiA+IEBAIC0yNzAs
OSArMjc3LDE0IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3J1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gIAljcnUtPmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gIAljcnUtPmlu
Zm8gPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7DQo+ID4NCj4gPiAtCWNy
dS0+aW1hZ2VfY29udl9pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+IC0JaWYg
KGNydS0+aW1hZ2VfY29udl9pcnEgPCAwKQ0KPiA+IC0JCXJldHVybiBjcnUtPmltYWdlX2NvbnZf
aXJxOw0KPiA+ICsJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gPiArCWlmIChp
cnEgPCAwKQ0KPiA+ICsJCXJldHVybiBpcnE7DQo+ID4gKw0KPiA+ICsJcmV0ID0gZGV2bV9yZXF1
ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsIHJ6ZzJsX2NydV9pcnEsIElSUUZfU0hBUkVELA0KPiA+
ICsJCQkgICAgICAgS0JVSUxEX01PRE5BTUUsIGNydSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgImZhaWxlZCB0byByZXF1ZXN0
IGlycVxuIik7DQo+ID4NCj4gPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGNydSk7DQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJs
LWNydS9yemcybC1jcnUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6
ZzJsLWNydS9yemcybC1jcnUuaA0KPiA+IGluZGV4IGE1YTk5YjAwNDMyMi4uNzI0MDVlNjMyYWNh
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY3J1LmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
cnpnMmwtY3J1L3J6ZzJsLWNydS5oDQo+ID4gQEAgLTY4LDggKzY4LDYgQEAgc3RydWN0IHJ6ZzJs
X2NydV9pcCB7DQo+ID4gICAqDQo+ID4gICAqIEB2Y2xrOgkJQ1JVIE1haW4gY2xvY2sNCj4gPiAg
ICoNCj4gPiAtICogQGltYWdlX2NvbnZfaXJxOglIb2xkcyBpbWFnZSBjb252ZXJzaW9uIGludGVy
cnVwdCBudW1iZXINCj4gPiAtICoNCj4gPiAgICogQHZkZXY6CQlWNEwyIHZpZGVvIGRldmljZSBh
c3NvY2lhdGVkIHdpdGggQ1JVDQo+ID4gICAqIEB2NGwyX2RldjoJCVY0TDIgZGV2aWNlDQo+ID4g
ICAqIEBudW1fYnVmOgkJSG9sZHMgdGhlIGN1cnJlbnQgbnVtYmVyIG9mIGJ1ZmZlcnMgZW5hYmxl
ZA0KPiA+IEBAIC0xMDUsOCArMTAzLDYgQEAgc3RydWN0IHJ6ZzJsX2NydV9kZXYgew0KPiA+DQo+
ID4gIAlzdHJ1Y3QgY2xrICp2Y2xrOw0KPiA+DQo+ID4gLQlpbnQgaW1hZ2VfY29udl9pcnE7DQo+
ID4gLQ0KPiA+ICAJc3RydWN0IHZpZGVvX2RldmljZSB2ZGV2Ow0KPiA+ICAJc3RydWN0IHY0bDJf
ZGV2aWNlIHY0bDJfZGV2Ow0KPiA+ICAJdTggbnVtX2J1ZjsNCj4gPiBAQCAtMTQxLDYgKzEzNyw3
IEBAIHZvaWQgcnpnMmxfY3J1X2RtYV91bnJlZ2lzdGVyKHN0cnVjdCByemcybF9jcnVfZGV2DQo+
ID4gKmNydSk7DQo+ID4NCj4gPiAgaW50IHJ6ZzJsX2NydV92aWRlb19yZWdpc3RlcihzdHJ1Y3Qg
cnpnMmxfY3J1X2RldiAqY3J1KTsgIHZvaWQNCj4gPiByemcybF9jcnVfdmlkZW9fdW5yZWdpc3Rl
cihzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1KTsNCj4gPiArdW5zaWduZWQgaW50IHJ6ZzJsX2Ny
dV9wcm9jZXNzX2lycShzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1KTsNCj4gPg0KPiA+ICBjb25z
dCBzdHJ1Y3QgdjRsMl9mb3JtYXRfaW5mbyAqcnpnMmxfY3J1X2Zvcm1hdF9mcm9tX3BpeGVsKHUz
Mg0KPiA+IGZvcm1hdCk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jDQo+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBpbmRleCBiMTZi
OGFmNmU4ZjguLjE1MTI4NDRmZWNiMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBAQCAt
NTI3LDkgKzUyNyw4IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX2NydV9zdG9wX3N0cmVhbWluZyhzdHJ1
Y3QgcnpnMmxfY3J1X2RldiAqY3J1KQ0KPiA+ICAJcnpnMmxfY3J1X3NldF9zdHJlYW0oY3J1LCAw
KTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBpcnFyZXR1cm5fdCByemcybF9jcnVfaXJxKGlu
dCBpcnEsIHZvaWQgKmRhdGEpDQo+ID4gK3Vuc2lnbmVkIGludCByemcybF9jcnVfcHJvY2Vzc19p
cnEoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSkNCj4gPiAgew0KPiA+IC0Jc3RydWN0IHJ6ZzJs
X2NydV9kZXYgKmNydSA9IGRhdGE7DQo+ID4gIAl1bnNpZ25lZCBpbnQgaGFuZGxlZCA9IDA7DQo+
ID4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICAJdTMyIGlycV9zdGF0dXM7DQo+ID4gQEAg
LTYwNyw3ICs2MDYsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcnpnMmxfY3J1X2lycShpbnQgaXJx
LCB2b2lkDQo+ID4gKmRhdGEpDQo+ID4gIGRvbmU6DQo+ID4gIAlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZjcnUtPnFsb2NrLCBmbGFncyk7DQo+ID4NCj4gPiAtCXJldHVybiBJUlFfUkVUVkFMKGhh
bmRsZWQpOw0KPiA+ICsJcmV0dXJuIGhhbmRsZWQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMg
aW50IHJ6ZzJsX2NydV9zdGFydF9zdHJlYW1pbmdfdnEoc3RydWN0IHZiMl9xdWV1ZSAqdnEsDQo+
ID4gdW5zaWduZWQgaW50IGNvdW50KSBAQCAtNjM3LDEzICs2MzYsNiBAQCBzdGF0aWMgaW50IHJ6
ZzJsX2NydV9zdGFydF9zdHJlYW1pbmdfdnEoc3RydWN0IHZiMl9xdWV1ZQ0KPiAqdnEsIHVuc2ln
bmVkIGludCBjb3VudA0KPiA+ICAJCWdvdG8gYXNzZXJ0X2FyZXNldG47DQo+ID4gIAl9DQo+ID4N
Cj4gPiAtCXJldCA9IHJlcXVlc3RfaXJxKGNydS0+aW1hZ2VfY29udl9pcnEsIHJ6ZzJsX2NydV9p
cnEsDQo+ID4gLQkJCSAgSVJRRl9TSEFSRUQsIEtCVUlMRF9NT0ROQU1FLCBjcnUpOw0KPiA+IC0J
aWYgKHJldCkgew0KPiA+IC0JCWRldl9lcnIoY3J1LT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBp
cnFcbiIpOw0KPiA+IC0JCWdvdG8gYXNzZXJ0X3ByZXNldG47DQo+ID4gLQl9DQo+ID4gLQ0KPiA+
ICAJLyogQWxsb2NhdGUgc2NyYXRjaCBidWZmZXIuICovDQo+ID4gIAljcnUtPnNjcmF0Y2ggPSBk
bWFfYWxsb2NfY29oZXJlbnQoY3J1LT5kZXYsIGNydS0+Zm9ybWF0LnNpemVpbWFnZSwNCj4gPiAg
CQkJCQkgICZjcnUtPnNjcmF0Y2hfcGh5cywgR0ZQX0tFUk5FTCk7IEBAIC02NTEsNyArNjQzLDcg
QEAgc3RhdGljDQo+ID4gaW50IHJ6ZzJsX2NydV9zdGFydF9zdHJlYW1pbmdfdnEoc3RydWN0IHZi
Ml9xdWV1ZSAqdnEsIHVuc2lnbmVkIGludCBjb3VudA0KPiA+ICAJCXJldHVybl91bnVzZWRfYnVm
ZmVycyhjcnUsIFZCMl9CVUZfU1RBVEVfUVVFVUVEKTsNCj4gPiAgCQlkZXZfZXJyKGNydS0+ZGV2
LCAiRmFpbGVkIHRvIGFsbG9jYXRlIHNjcmF0Y2ggYnVmZmVyXG4iKTsNCj4gPiAgCQlyZXQgPSAt
RU5PTUVNOw0KPiA+IC0JCWdvdG8gZnJlZV9pbWFnZV9jb252X2lycTsNCj4gPiArCQlnb3RvIGFz
c2VydF9wcmVzZXRuOw0KPiA+ICAJfQ0KPiA+DQo+ID4gIAljcnUtPnNlcXVlbmNlID0gMDsNCj4g
PiBAQCAtNjcwLDkgKzY2Miw2IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3J1X3N0YXJ0X3N0cmVhbWlu
Z192cShzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwgdW5zaWduZWQgaW50IGNvdW50DQo+ID4gIAlpZiAo
cmV0KQ0KPiA+ICAJCWRtYV9mcmVlX2NvaGVyZW50KGNydS0+ZGV2LCBjcnUtPmZvcm1hdC5zaXpl
aW1hZ2UsIGNydS0+c2NyYXRjaCwNCj4gPiAgCQkJCSAgY3J1LT5zY3JhdGNoX3BoeXMpOw0KPiA+
IC1mcmVlX2ltYWdlX2NvbnZfaXJxOg0KPiA+IC0JZnJlZV9pcnEoY3J1LT5pbWFnZV9jb252X2ly
cSwgY3J1KTsNCj4gPiAtDQo+ID4gIGFzc2VydF9wcmVzZXRuOg0KPiA+ICAJcmVzZXRfY29udHJv
bF9hc3NlcnQoY3J1LT5wcmVzZXRuKTsNCj4gPg0KPiA+IEBAIC02OTgsNyArNjg3LDYgQEAgc3Rh
dGljIHZvaWQgcnpnMmxfY3J1X3N0b3Bfc3RyZWFtaW5nX3ZxKHN0cnVjdCB2YjJfcXVldWUgKnZx
KQ0KPiA+ICAJZG1hX2ZyZWVfY29oZXJlbnQoY3J1LT5kZXYsIGNydS0+Zm9ybWF0LnNpemVpbWFn
ZSwNCj4gPiAgCQkJICBjcnUtPnNjcmF0Y2gsIGNydS0+c2NyYXRjaF9waHlzKTsNCj4gPg0KPiA+
IC0JZnJlZV9pcnEoY3J1LT5pbWFnZV9jb252X2lycSwgY3J1KTsNCj4gPiAgCXJldHVybl91bnVz
ZWRfYnVmZmVycyhjcnUsIFZCMl9CVUZfU1RBVEVfRVJST1IpOw0KPiA+DQo+ID4gIAlyZXNldF9j
b250cm9sX2Fzc2VydChjcnUtPnByZXNldG4pOw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+
IExhdXJlbnQgUGluY2hhcnQNCg==

