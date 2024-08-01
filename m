Return-Path: <linux-media+bounces-15687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B1F94498F
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 12:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8C6A1C2562A
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC05D18452B;
	Thu,  1 Aug 2024 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="A4wCxmeE"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp [210.130.202.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2287170A32;
	Thu,  1 Aug 2024 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508949; cv=fail; b=itMIXJeChPwnist395tirZQAmEAQqcWkO0WWlxmzOVbcao+K64Ejl20c4YPZ1I65g7TvVJ45saclhdaqW4c8HNOY8JJJgfIlfpFHJfJVfFXzujPhu7WF6gGKr3E82KClj8xYEZFrf7Eti7iPXK0cEVjJYGPuPquW/Y4NWbWYrMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508949; c=relaxed/simple;
	bh=eJO6KVW2IA+jhHZA0d1oXlIobJ9iznOhbacjBurM5Wo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cS9O4u++g/YujVweIxx/paK+ZB8mj2VZSEr1c39dLa7aqWPTVOC896k+vZ36YYq8ABtfrZDBOLtRGWncs7WVGmKqfBKL1PJZTPcva2CoBxzfMr/6zEZ8CIjyvUL0l9j0WkpZtL161jqOqb4XhX7L2YxQXAKioxw9hsfoYOiXaEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=A4wCxmeE; arc=fail smtp.client-ip=210.130.202.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 4719QnVN1337537; Thu, 1 Aug 2024 18:26:49 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1722504346;x=1723713946;bh=eJO6KVW2IA+jhHZA0d1oXlIobJ9iznOhbacjBur
	M5Wo=;b=A4wCxmeEJV5r1BtNgTCqpbFjj785BX4fjBXsRukoIOqHGNtfMglC47XB7yoFOq/r3Vx2B
	vQHyZ4rZRyBdac7W3pQs2l4A7oDQaVB2kEir6pRx5i06U0QUmG//2RfyYOjlK6GZ+KXz8+Crs39lJ
	VJpsfW1I1hzoJQecF9RLvTtdzXgogMDd45ISfEKde2Faoja1eC3TkVo6Us1d7HCpdZ8/hW8xPJ7JS
	AEW5gglgCppEEY3ZX8b1s5TFFekOWHsXkmdqacO4HrmZwTF1cB9h6xh5zPPFZKr0FZgHswhe5h1wr
	md5p+NpTkXtVaTEnuVUtKERcYFUi33o6gzAsf1MrVg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4719Pj7a1684441; Thu, 1 Aug 2024 18:25:45 +0900
X-Iguazu-Qid: 2yAbuqbyj945JpIaCE
X-Iguazu-QSIG: v=2; s=0; t=1722504344; q=2yAbuqbyj945JpIaCE; m=n+2uhMQVrIpsJXrbOKiLyq28IhbvbL3g3thz3NiKfek=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1800) id 4719Pgx34091514
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 18:25:42 +0900
X-SA-MID: 27794407
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qARF8tBOaRJLJkzHdDnDUP3HhQo7ejUj2n2fgnMejcMOyfrUl0rS89Bw1q78RYobVUXtXoPRgJCdjfqPfeyAE61U3MdG5it21xpWOszJYml7KJtKOM+9KsDFTGBNmLKlZsg4mmhcsn7d/Qg+5eZrRX9wBiA1mEWo+MkikKfZ1SjhEJscV8glU5L1hKF54SmkmbKd9F32ry9Qp+AwTkhluzhg7NaiB/K/sS78gq/4P8mjzZ8RkSK/dqP0mXgCK1MKttPl1LZqk15hTCzgEtKxjIPxLX1tyddOXPHJ85lZLSR75e92rYnqZbZ13t+kJ4Ja30KQ5TWznN2RDaNViHGlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJO6KVW2IA+jhHZA0d1oXlIobJ9iznOhbacjBurM5Wo=;
 b=XrPzMLWl/6RtXcMtz4hD0LJv/bR9E+QmnSzqi5t5zVYfCE8B/xRspLT+veSWoXsuA6OiwytEnmn+Rvgew9FSpXJjrQ1lDpwGti6aGQCtuzYxXRrww8+kSJ7NuFWPw4tJUrdfeQocxtoqbCRnyVzCyvnP4dLJ1Dj/YNWvudJsqyreRCL89Q7mja2r4vl921rDqFe1HJogD5gzEarg6gg68rkstPQuMpp6u9ktIjpzb+gaAnxaIcEII/kU47J86gTV6SGPK8GTe6k8njrX6XlSCuUZnMPMmwqJkpaE0v5PlfIFjhUCWo29I9ChjcGsT7CzcO9lESnZHJx8iiSH6zc/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
CC: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <broonie@kernel.org>,
        <sakari.ailus@linux.intel.com>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v11 2/6] media: videodev2.h: add visconti viif meta buffer
 format
Thread-Topic: [PATCH v11 2/6] media: videodev2.h: add visconti viif meta
 buffer format
Thread-Index: AQHa0ZRCD4fJdzFxsUCGPXOkczYTSLIC73KAgAAAZwCAD1TAoA==
Date: Thu, 1 Aug 2024 09:20:35 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OSZPR01MB942779F5FF6F97FB01F03F7D92B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-3-yuji2.ishikawa@toshiba.co.jp>
 <20240722151035.GA31490@pendragon.ideasonboard.com>
 <20240722151202.GB31490@pendragon.ideasonboard.com>
In-Reply-To: <20240722151202.GB31490@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9427:EE_|OS3PR01MB6545:EE_
x-ms-office365-filtering-correlation-id: 9f96703f-3008-4df1-9e14-08dcb20b333d
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SFhPV1NJZWlPWk4xQlhQcTFpbTR5cUdBaG1GdFBBUXNicGJEbHZ4Mkhqc0Qv?=
 =?utf-8?B?blFnOXlFcStROUN6elViR3NoZmNlSithOVVxQmRzcnBZdXYyOGdvMlVSYXo0?=
 =?utf-8?B?K2JJSmVFb3BEMVRraEhYcUo5VlpHeWhGOUtzV1EyT1VRZEgyTm1JdThRTVFq?=
 =?utf-8?B?b0t3VC8yUmJ2ZEpYdEYzVmhMMmhTbm9HZmxuQWRreDZZczRzZ3pxZ2tabWsz?=
 =?utf-8?B?L29NTUxxdyszeTZEU1hpc01mc09VVThReVVINWlmVXFhOUd3YnJLUysvdUZk?=
 =?utf-8?B?aGxkTnVkcWxaU2NjOXE5dkpzMzJrS3JwYUIzZnFVVDJwN21XWUNlZkJKT29Z?=
 =?utf-8?B?SWRWRVlaQWowaVF0aVJuVnR0N2JMejFYTTVrYUpRQ3dlQUwwVHVwRjl4VlpC?=
 =?utf-8?B?U2dMR2U1NWpobzJ3ZGRaVW4xQVZ5OHVUd3JvUUtBRkgyeTgzTlM2eThXdkZC?=
 =?utf-8?B?S0RQc01rd2dzcjl4ZVM2c1VGMTY1K0hqejVKSS8xTDVPK1hBSkE4a1lOZCtB?=
 =?utf-8?B?cFFMdmJoU1RmejJod2VMRmxYeDJQZWhvdnJuWTF1YWZNZFUvTCtKVUJiU29X?=
 =?utf-8?B?ZzJydHduZVJibDV4d3FJRUFMRmt1ejRwRXRYZjR3MUM4WDBIWDRCM3poOUJU?=
 =?utf-8?B?OTJTeHB6THhab2tnR1ZvTEZBZ3pnNFcwSS9ZUGEramMxdkRBUGd1WWx4Zy9r?=
 =?utf-8?B?MXluQzRSeEczRHRiYnRxa1VqUWpPR1FlWG92WHNUWHFUZFpqZGRWVDB5Qld2?=
 =?utf-8?B?OWwzT1FQa1dlaTJOQmpmOWRlTk5jT05aazgvb1d4Tnl1V3lhQmVMMWlqN244?=
 =?utf-8?B?eEVoV25ib0pIanJDaThDdVBQV1h2SXl3ek9UMllUdy9QR0UyY0Y4eC9hZ3Zm?=
 =?utf-8?B?VWlwTndlUm1laGRRenJ0Sk5lcUpaZ0R0aFNON2M2L2szRGxoalQ0ZFAxekww?=
 =?utf-8?B?ZXhLT3B5QkU0MEZKc2lQVFFONnNlbncwOG45VHNVeVlIRkFXSlRPT0IzeEpl?=
 =?utf-8?B?YXhmNnYvSFliWEFlbnE5YWZKY2MwWHlmbGFzMU90U3Z2Tk1KeTZKdldhd29m?=
 =?utf-8?B?Y2RpOFJMRitteFNBM1oyZ3IyV1N0Y291OWdtQUp1aDRzRjBIamM3VnNsWXg0?=
 =?utf-8?B?WE5KY2t2ck1FbjVpUFh3VmtjcFQ3MTVIQndRekkzRGlpQ0JlMVdDZUoyeTA3?=
 =?utf-8?B?N0p2Y010WHk5cTZXMTQ2Q2tPSGFid1YyanVHdWkvNTBFTEtFd0h5cHlZZ21x?=
 =?utf-8?B?enFVNFIvOEZjUUVlZUc1ZjlRQzdoSnpXSExMLzRSczZ1MFRHMTBYTElvcE1K?=
 =?utf-8?B?clljZFJneGpETCtVNVVrS1BablZpQVg0cEdoV1lZS3VucTBJeXQ3R05WdDYz?=
 =?utf-8?B?ME83YmZ0RnMzeEJYR1VuSjFhMUp3TkpqSEVud0o1OGNrbm1QTTN2YUEzaGJp?=
 =?utf-8?B?WGJmZ0xXTitqQzd1S00xdnpJVnBPOVFSa2NGQTFNcXdGOGlqcEZ3TERYbmdn?=
 =?utf-8?B?eXBPV2JQRG9URHRoV2FURkVROVJLSjdVc0d1S2dxcUdpMCtvT1Nsc3BiejBX?=
 =?utf-8?B?enNhRDg2d0VJSEo2cTlwditEOEN5L29XRGpKL2ZPVlQ1SDMxQ1JwOGxQdmQ0?=
 =?utf-8?B?d3M2RWlnNytiYkh6WDlmTW9nazVpOHU1eXA1RjZhZkxxQ1pnMExIWThveDhF?=
 =?utf-8?B?ZVJvaTFVbDFwME9QdS9wUnU4WGl5alhHNXREV0gzZEcrSXM0dG9IVzJ3MFBC?=
 =?utf-8?B?cEF5Y0JvZXhGeUJUR0lBM2N5N25senhwSklJem1lSkZBdXNUbElERFFzR1Fx?=
 =?utf-8?B?WHZqWGZjZ0s1UFZYUUxQSnZhMVlVZWdyZlZualRHbzJqdEwyL24vOXlWRXds?=
 =?utf-8?B?eGROQjRxalpaQnVYTE9NZ0dHdHBkekJqbXEwcmNraWU4UUE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB9427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RGpEN1YzSXUrdGQrV1dCV1lKYUgrL3JsemNKSnBSWlZQenRYM0lDVHVpTUtj?=
 =?utf-8?B?Vk5rbGRaMnpHNC9ldG1qT1E1ajVyOW1Rd0hjOVBDdjdYYXMxc3V6UVM4L0x1?=
 =?utf-8?B?cjdtcU0vS3pobmJndHp6aVB3ZVE0aU0wLzBoYnFWNnBVZjBHcFc5ZVpkS0tG?=
 =?utf-8?B?eU9PS2pzZHVVblR3My9tZHVvZ0F0OEU1OXQ1TEUrQmh4T2ZIQnNJekp4WFlB?=
 =?utf-8?B?NnFydWx6M3Y0bWlPZXR3YTdKeDhjL1FuZkliWGd5ODhvRzZ5Y3NnaERraHcr?=
 =?utf-8?B?d1BVWUtoYkRidUt0WEJ5bzNDeGVQbHUva2crNERxc2JVa2lwNFBxUjJEK2ky?=
 =?utf-8?B?WisxNUtmMGdJeUFWdm9PVlpYbHRldDI4cFlYVTZTS2l0aGM4ZDFWaWl1OXBU?=
 =?utf-8?B?bjFyMERjTmEyRTB2WTNhNm8vcWhRWEpnS1lrTGRwTUh3WFU5N2JJZmhUZ2FG?=
 =?utf-8?B?RG1vRExaSTJ2NkNqMmxVbnBEWFRhMmtUVXV1ME1LTk40SGFuQTZUMUgza3ly?=
 =?utf-8?B?Q3JIK1dpTitTZ0FBNkFJSzNCNHZ1bHpDNGN3bmh1d01zaHlZaHRCYlA1OVdy?=
 =?utf-8?B?bVV3NG1vMEY3SXdzUC9SVk1Id0liUXBkbFpRRkhHQXlZL1c0MnpIaVdLckJE?=
 =?utf-8?B?VVpqR2lCOWRsMUMrZjlDSlFiSjlUL3FXOGlGUnQ3RTlnbTg3WktEODFyQ0xC?=
 =?utf-8?B?WFduM3BtWFZvd0pzSi8yZHBYM3J2eUZYZjJlUXFUK3hiRGFCMWhweitGNTBq?=
 =?utf-8?B?c2hGVy9ySm5BQmlMZ2tidGFmZE11MlRlNUJpUzMyMldUTzBHaHU2bU9FdHIx?=
 =?utf-8?B?T0d4NnNpaXFCRlpwM0xqZldGV0VONFBqZ2ZmM2crMTl5TmFLRWhaYUVXZDJh?=
 =?utf-8?B?SFZmNm9TNENOUEQ2VG56Y3pzc3N2U1lvNmU5dkRtdEF4NTQ0aGlGcEZUTjlO?=
 =?utf-8?B?c3h5bytQbDUyMUg1cW95VENua09pZHVHaFhCYWpTdjJQckdGamVvamxFZkxW?=
 =?utf-8?B?TThCeGR2NVM5eUNqTmdGT29TVVUwUTd2a0ZKY0dmc3VtMUlLV3RPT1VKOHY3?=
 =?utf-8?B?d2ViK3FxNHViQTZHQmxLN04xcXJmd0tLMEw5cEdMdkZNdktKeGw1RzFka0FI?=
 =?utf-8?B?cDIxQ2hwUEtrRlBEMHUxKzdmajN2cjhVV0s0dVZUbXVJVnhTcWd6ZFRGOTRv?=
 =?utf-8?B?SE9Rek4xRUdBSXZzWURVRG12Rks5bXJyZllUNWJVQTlQaHVBMmptWG9aT3l4?=
 =?utf-8?B?bnJOY1Rtc0NldFY1aHJmTjIxRGRQZDFHZ2N2KzQ3SGdWc0NxUC9qczhpRE5u?=
 =?utf-8?B?QmcxL2pJZ1JiZm9rV200ZlJQazFpL2E2VnNOM0laTTBDN3FYMnB6c1pxQmdk?=
 =?utf-8?B?REZoUVpOV0lQRHlidFp2blhYWFpUNGkvWmZLU0cwMkx6aHA1L2NNdi9lTGhU?=
 =?utf-8?B?djU1ank4SkZPcGhFU083TXdCWkJQczBaK2JsbEw5WUViV09NK0VRRnpBaVV0?=
 =?utf-8?B?SUNnUHZUVEltMlVDNW4zZW9kZ2pEWnZTY0Y1R3RRaVpCVzRNQ29FbWNqeFU4?=
 =?utf-8?B?bmNqNnJVQTM5aWZrT1Y2NVo4Qm9HY2VDdml1K1BNQS9iKyt5c3Q2MFc4azVQ?=
 =?utf-8?B?aXVtWDJ3RG9oQUNVZTYrUCswMVdIQXJoYThnWGk2ek9WTEhTeW9QU3lRQlcy?=
 =?utf-8?B?bEhUVkxLdEhxVExBSjB6Y0s5MDlSZ1oyOGdVWFlhaTBUWUhKZm0zanFoTkVr?=
 =?utf-8?B?bWY5SCtSWHpjamZacENGdVI5QmlHMXN3blNadFdta1JxeWRzNU8vdVAvYjg2?=
 =?utf-8?B?OEJHZG42K3dTaG5jbUNYN29pVDY5M2hNeG15aTRFQlh2aVU5d3J0OHpUTWd3?=
 =?utf-8?B?VUFIeGwzdWRiRWl5cEwyb25MVmhXUERnbEhybHBxWjI0RGphWHViVzM0QkhB?=
 =?utf-8?B?dVBWczVUZUo0c1o3TkNjRmlraVFtVitPa1B1YllEVHlud3dBTWg2VTFpdkEz?=
 =?utf-8?B?M05wUVRhcWI4aGNhelcyS2FBSkx3Zkp2K3cvSHgvcmxieTBoRi9jTVZpOG15?=
 =?utf-8?B?dDRnVnUvRmpBdlNhTjRvYjQxSFVyZFpqc1hnREJnQm9hRGp2eVVleERscFZ2?=
 =?utf-8?B?ajZoQjdkYWFhTDBiM2cvQlBWaDhVZzhVSVIvV0Ywa3JTU3IrempSUGlFeUh3?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f96703f-3008-4df1-9e14-08dcb20b333d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:20:35.3678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X91JgvHLXvsAxsP8Rp4AWS2VR6BIzMdXJK9CtYwTJ+/huleZUlcVipW1Q9hhQewWVAcNHOYidPvsL6L7l00Rh45QgA3IQQ1E4NqJWjYOxEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6545

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBjb21tZW50cy4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkg
MjMsIDIwMjQgMTI6MTIgQU0NCj4gVG86IGlzaGlrYXdhIHl1amko55+z5bedIOaCoOWPuCDil4vv
vLLvvKTvvKPilqHvvKHvvKnvvLTvvKPil4vvvKXvvKHplospDQo+IDx5dWppMi5pc2hpa2F3YUB0
b3NoaWJhLmNvLmpwPg0KPiBDYzogSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+OyBN
YXVybyBDYXJ2YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5l
bC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBNYXJrIEJyb3duDQo+
IDxicm9vbmllQGtlcm5lbC5vcmc+OyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5p
bnRlbC5jb20+OyBpd2FtYXRzdQ0KPiBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8
tO+8o+KWoe+8pO+8qe+8tOKXi++8r++8s++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3No
aWJhLmNvLmpwPjsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDIv
Nl0gbWVkaWE6IHZpZGVvZGV2Mi5oOiBhZGQgdmlzY29udGkgdmlpZiBtZXRhIGJ1ZmZlcg0KPiBm
b3JtYXQNCj4gDQo+IE9uIE1vbiwgSnVsIDIyLCAyMDI0IGF0IDA2OjEwOjM3UE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gSGkgSXNoaWthd2Etc2FuLA0KPiA+DQo+ID4gVGhh
bmsgeW91IGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPiBPbiBUdWUsIEp1bCAwOSwgMjAyNCBhdCAw
OTowODo0NEFNICswOTAwLCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+ID4gQWRkcyB0aGUgVG9z
aGliYSBWaXNjb250aSBWSUlGIHNwZWNpZmljIG1ldGFkYXRhIGZvcm1hdA0KPiA+ID4NCj4gPiA+
IC0gVjRMMl9NRVRBX0ZNVF9WSVNDT05USV9WSUlGX1BBUkFNUyBmb3IgSVNQIHBhcmFtZXRlcnMN
Cj4gPiA+IC0gVjRMMl9NRVRBX0ZNVF9WSVNDT05USV9WSUlGX1NUQVRTIGZvciBJU1Agc3RhdGlz
dGljcw0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1amkgSXNoaWthd2EgPHl1amkyLmlz
aGlrYXdhQHRvc2hpYmEuY28uanA+DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGxvb2tzIGZpbmUuIEFz
c3VtaW5nIHRoZSBjb3JyZXNwb25kaW5nIGRvY3VtZW50YXRpb24gcGF0Y2gNCj4gPiBpcyBmaW5l
IHRvbywNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiBBY3R1YWxseSBJIHNwb2tlIGEgYml0IHRv
byBmYXN0LCB5b3UgbmVlZCB0byB1cGRhdGUNCj4gZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1pb2N0bC5jIHdpdGggdGhlIHR3byBuZXcgZm9ybWF0cy4gU2VlIGNvbW1pdA0KPiA4ZjZjMjIw
MjIyMmZhIGZvciBhbiBleGFtcGxlLg0KPiANCg0KSSdsbCBhZGQgc29tZSBvcGVyYXRpb25zIHRv
IHY0bF9maWxsX2ZtdGRlc2MoKSBhcyBkZXNjcmliZWQgaW4gdGhlIHNwZWNpZmllZCBwYXRjaC4N
Cg0KPiA+ID4gLS0tDQo+ID4gPiBDaGFuZ2Vsb2cgdjEwOg0KPiA+ID4gLSBhZGQgZW50cnkgZm9y
IFY0TDJfTUVUQV9GTVRfVklTQ09OVElfVklJRl9QQVJBTVMNCj4gPiA+IC0gYWRkIGVudHJ5IGZv
ciBWNEwyX01FVEFfRk1UX1ZJU0NPTlRJX1ZJSUZfU1RBVFMNCj4gPiA+DQo+ID4gPiBDaGFuZ2Vs
b2cgdjExOg0KPiA+ID4gLSBubyBjaGFuZ2UNCj4gPiA+DQo+ID4gPiAgaW5jbHVkZS91YXBpL2xp
bnV4L3ZpZGVvZGV2Mi5oIHwgNCArKysrDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlk
ZW9kZXYyLmgNCj4gPiA+IGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oIGluZGV4IDRl
OTEzNjJkYTYuLjU2MjAzOGYxNDQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGlu
dXgvdmlkZW9kZXYyLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIu
aA0KPiA+ID4gQEAgLTg1OCw2ICs4NTgsMTAgQEAgc3RydWN0IHY0bDJfcGl4X2Zvcm1hdCB7DQo+
ID4gPiAgLyogVmVuZG9yIHNwZWNpZmljIC0gdXNlZCBmb3IgUmFzcGJlcnJ5UGkgUGlTUCAqLw0K
PiA+ID4gICNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9SUElfQkVfQ0ZHCXY0bDJfZm91cmNjKCdSJywg
J1AnLCAnQicsICdDJykgLyoNCj4gUGlTUCBCRSBjb25maWd1cmF0aW9uICovDQo+ID4gPg0KPiA+
ID4gKy8qIFZlbmRvciBzcGVjaWZpYyAtIHVzZWQgZm9yIFZpc2NvbnRpIFZJSUYgc3ViLXN5c3Rl
bSAqLw0KPiA+ID4gKyNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9WSVNDT05USV9WSUlGX1BBUkFNUw0K
PiAJdjRsMl9mb3VyY2MoJ1YnLCAnSScsICdGJywgJ1AnKSAvKiBJU1AgUGFyYW1zICovDQo+ID4g
PiArI2RlZmluZSBWNEwyX01FVEFfRk1UX1ZJU0NPTlRJX1ZJSUZfU1RBVFMJdjRsMl9mb3VyY2Mo
J1YnLCAnSScsICdGJywNCj4gJ1MnKSAvKiBJU1AgU3RhdHMgKi8NCj4gPiA+ICsNCj4gPiA+ICAj
aWZkZWYgX19LRVJORUxfXw0KPiA+ID4gIC8qDQo+ID4gPiAgICogTGluZS1iYXNlZCBtZXRhZGF0
YSBmb3JtYXRzLiBSZW1lbWJlciB0byB1cGRhdGUNCj4gPiA+IHY0bF9maWxsX2ZtdGRlc2MoKSB3
aGVuDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0KDQpSZWdh
cmRzLA0KWXVqaSBJc2hpa2F3YQ0K


