Return-Path: <linux-media+bounces-11311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9448C225D
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F8A1F22443
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE4B165FD7;
	Fri, 10 May 2024 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vrmediasrl.onmicrosoft.com header.i=@vrmediasrl.onmicrosoft.com header.b="k32QmKQW"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2107.outbound.protection.outlook.com [40.107.249.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105FC7EEF8
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 10:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337771; cv=fail; b=oDvVgKmNZmN+CPO7lg4JByxeiC1qZGIP6yIXWHkFnlcAcVJSpR+0w08zuqkc88udAU88ZsCXfzBXiYokvzee6O7x/qTLv9o/weKlnn9vD7I+si0UHozmT7duqVLJHkS6UGf0GHt/ohmXdPN7tVfm7vTJpBtnAYHkKOYc5FoYYOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337771; c=relaxed/simple;
	bh=cVvyLLP97uYlIpScixikmlGDmNnud3GvtcN8ahPB8+Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L/pm4joJNF22q5XAsl0389aSiqgW1UFfjXCRFtlGCiDNa3CPmuHr+Ecn8If9+/lO2yj673ZDQrIvEyu6YiSKbXPQISbfXny1CRQynkFOKtZ5Ow2aNte7ChL/jgHt3k1LxNiXQgzhSqOSsDIiWy40fS6/RFfleD7egsIf4UL6TGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vrmedia.it; spf=pass smtp.mailfrom=vrmedia.it; dkim=pass (1024-bit key) header.d=vrmediasrl.onmicrosoft.com header.i=@vrmediasrl.onmicrosoft.com header.b=k32QmKQW; arc=fail smtp.client-ip=40.107.249.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vrmedia.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vrmedia.it
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY6yUlQcFPBIHjA2S3HnPg6PRFJhb6acSB5hzNJyf2DfhXlzjSxgqge61lirSFtwx+9fK42EdXE5hC9PNgn4Ei2+4pGA13N1dnWAkySUXaRQZwfIS6w29e+2XCPgW1M2dCp9qsKeYUF5cGfssTepPafzTzWlmToRhWSrJPh3g41D/IFnxzmhEowmYedlja8SEHi6K2AbzO14dP9bi/gLtRXy0YvuTdGZR1o1+E0IVpHWUXnooep+lL2Bd3/V4Sd8Ewl0Ksm5SAPwjTcLr3QNoyOIJMckopINh52a11hWXQvQ0is8eQ+nAw9HNMEHRcgT+XYhD+p0o2TzIKlEVXzcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVvyLLP97uYlIpScixikmlGDmNnud3GvtcN8ahPB8+Y=;
 b=XdymLfiI4bggbF0poKv35bR/RgbNwFBWrPoj5IgrO/MNuImCnbM3r61SKYdHUNsfIsTMmz+IQeDjsEl4bAJr9juT5b9JnUaAVMNsXZDInKqyzpfOpBk07+SygU+DIBtOpeXKg8pUf/FYxDfFvkkDdFglZ1r29ebl8UWxkERdgzjN9L2wAQ1IlPVq/GwOYqCEbBNmKbBwQH8wy95KoyUSd+EtYmk/Jt4CrRMKHha5XOtdITp8oFU5c0SIMpqYTyxXsXGHNDSy8wYeE0pPW4F+sT7fZCXop4z/vODQH40Eo6bl3kOg7x6kpAbh+Q5/nrR8EHb61R+gQNx+OTPmwIeFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vrmedia.it; dmarc=pass action=none header.from=vrmedia.it;
 dkim=pass header.d=vrmedia.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrmediasrl.onmicrosoft.com; s=selector2-vrmediasrl-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVvyLLP97uYlIpScixikmlGDmNnud3GvtcN8ahPB8+Y=;
 b=k32QmKQWnEgSMeITx7Je1Fp6wYm9Gy9EMx4yqUnaFSwVXlRA/zDLzOl0ZzWUGP1GITs7Ua7we/nel32g90exSPFR9ibAzzcP51cbb/jsGG2ghYertIwepCYmWKuUz+9PTmQjMASLurm1kS6nAGQ7S1dFNOZQd2Q5yHUbTMl4caQ=
Received: from PA6PR03MB10496.eurprd03.prod.outlook.com
 (2603:10a6:102:3cb::15) by DBAPR03MB6501.eurprd03.prod.outlook.com
 (2603:10a6:10:191::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Fri, 10 May
 2024 10:42:44 +0000
Received: from PA6PR03MB10496.eurprd03.prod.outlook.com
 ([fe80::b511:fb3f:60da:3492]) by PA6PR03MB10496.eurprd03.prod.outlook.com
 ([fe80::b511:fb3f:60da:3492%3]) with mapi id 15.20.7544.041; Fri, 10 May 2024
 10:42:43 +0000
From: Alessandro Longobardi <alessandro.longobardi@vrmedia.it>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Franco Tecchia <tecchia@vrmedia.it>
Subject: Reducing Decoding Delay with h264_v4l2m2m on raspberry pi Zero 2
 (bookwrom o.s.)
Thread-Topic: Reducing Decoding Delay with h264_v4l2m2m on raspberry pi Zero 2
 (bookwrom o.s.)
Thread-Index: Adqiw67NwmlJ9dqjTbCpPV5f97yrjAAAxsaw
Date: Fri, 10 May 2024 10:42:43 +0000
Message-ID:
 <PA6PR03MB10496A3FF3ADC31B5C3D31DE980E72@PA6PR03MB10496.eurprd03.prod.outlook.com>
References:
 <PA6PR03MB1049647A33345EA7C1461EBFC80E72@PA6PR03MB10496.eurprd03.prod.outlook.com>
In-Reply-To:
 <PA6PR03MB1049647A33345EA7C1461EBFC80E72@PA6PR03MB10496.eurprd03.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vrmedia.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA6PR03MB10496:EE_|DBAPR03MB6501:EE_
x-ms-office365-filtering-correlation-id: 04c2846b-9a7c-4e23-aa4c-08dc70ddec99
x-ld-processed: 33bdb1e9-5134-41f6-935e-3fdcf56b6b63,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?NHNpRlUyVEJ0WW1xYnZaQktKcTVMM1BCc2pXVTBuVStVL3FscUFMeHdU?=
 =?iso-2022-jp?B?QUU0TUpaUlZhUEtjeGRHRndTMng0VWV0cWJZR3BFUGg4cGxDRFRaZTJH?=
 =?iso-2022-jp?B?VnZDcjdqVFNkRnAvWGY2eThlUGJpZkhyT1lNM04rZDJaUFhybmtwdUFD?=
 =?iso-2022-jp?B?S0tyZEUrdDYxS01WOUNTVlhqcGJSMENRNVZqSkJFcnZKMStIdVBLNGla?=
 =?iso-2022-jp?B?U2NNOGZLSHVuazh0UU4yOVZFeGtWaFI2ampLV3ZqeHMvVkxxV3lRbU1r?=
 =?iso-2022-jp?B?NVExalk0ZDYrRktjUlN2YTlURWpETHovOEZIckRjSEJVT3M5cjN1UWFs?=
 =?iso-2022-jp?B?R3hPUlM3ZVp0MUpWWTUrZW1qK2pVbUdyeXMrRGs4SklxRzlveVMyaCsz?=
 =?iso-2022-jp?B?MXlKa2RxZmRKbWIwTURQWHNYL3NzS0VieCt2YU9XOVlLV2Z1Q1EzQ2Nx?=
 =?iso-2022-jp?B?YkN3QldnK2Y1eVV4Q2VTTXZnak12OTdEQkdxa1hQOFNmRStUTHRBampp?=
 =?iso-2022-jp?B?SzM0UnhzenBISS9PKy80Q0taUnNyMFVwZGcwUDJLU2QybnNWeDlVdmRp?=
 =?iso-2022-jp?B?cGhuSDV3YnJyL3VlTW93S29GSDhuVGs5WStQcjFDbkpvaktqdG50VmZD?=
 =?iso-2022-jp?B?aUlrcGVrUEFreXRBaHFmbEZ3djlYUU9reXY5Ynd6SUFaekZQQUZucmxR?=
 =?iso-2022-jp?B?bHJ3alRWYk5WdkJFNURXSFRScjgvVUJLK1AvYnFLNTVVdjFEM3Zhd05q?=
 =?iso-2022-jp?B?dmplVWpoRzc2UmM0SEZxYlE1NzUrcHNuVStqQ1laZmtSemdJbWN4WEtY?=
 =?iso-2022-jp?B?a3cvMmNCaXh0ZVhYYW5jZlp4LzJXNzRVR2dOZzhZb2VhZStYUkpNZWFp?=
 =?iso-2022-jp?B?dXk1SDRLZUtDTU51d09jbnJwUFRsZXRCVi9MRm9MQjJJdHV2WFJnbW9O?=
 =?iso-2022-jp?B?VERZbFh2NXpTRmNqWmZEbzQ5ajF5OTFUVWc5ZlNpZ1hENWdoUTZkaXkv?=
 =?iso-2022-jp?B?Mk1DS1NSSW5zU2hEanAvekVWbDVWeWJSSEd2NzNnL3duU09DRHRoNGZP?=
 =?iso-2022-jp?B?bUFTTmg1dzdveVAzWGxCK3dMQ1Jvb0ovM2xESnE3Qy91UU5TS2c1SitJ?=
 =?iso-2022-jp?B?TEEydHp4cnBsVG1xSFBQdE1pVGdkM3NRTmQ5dVZHcmxrZUtqRjVTNlpN?=
 =?iso-2022-jp?B?UXZMeUNCaEY5TnprdnBXcndkZDBjUG5iN3EyWjlPV2JwaEo0RzZMYklo?=
 =?iso-2022-jp?B?THNxczJ0ek00cTA1TWlDOGhxUGdpR3lnSjgrWHg1ZWd2ejVyUjZ4akpu?=
 =?iso-2022-jp?B?d01WeEIzWjFqek1KSzNlUVN3WGh5UGE1bUdSUXlkTENqRzdIQm5MdHlP?=
 =?iso-2022-jp?B?MllHeHZOR3lnaXk3SE9CdFNQeTlUajFrSEZOREJiL2dqeldZK240STZU?=
 =?iso-2022-jp?B?eE1FTExJa1JmTGRMWTZBZVU0L1EvNEQ0NHZSSnVkTU1ZQzAyK0IwMzd3?=
 =?iso-2022-jp?B?NCtKeTRpSmhaZXIzNW5mWGhOTjhLM1NqUGhRMU9hREVZeFVGaVMrenVU?=
 =?iso-2022-jp?B?OFg2bXA1dFk4ZS9mVjBLTXB2cmpGMG1NU0lBQWhFL3drWlJ4MWJ1M2Zl?=
 =?iso-2022-jp?B?RWVYWXhWZy9pdlcySW9OSktrK0NFYWNSQUpOL1crRjR0MHVXdVFyS3U4?=
 =?iso-2022-jp?B?MnVWMHovZVhsZi9UTFcxV3Vyck1nRU5NTldCMFJnQjNVdThoU2NwbUJs?=
 =?iso-2022-jp?B?TzZ5MzhPUEEzUHVoOVhZbGhCcXppN0swUXBSMG0rME9nSTdXNG9mZU5v?=
 =?iso-2022-jp?B?WDdZWmNmMk5xM0lGTTRLbTVrSEhOM3BGSHIwNzh2U0Y2dEYxaC80dUpR?=
 =?iso-2022-jp?B?PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR03MB10496.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?aTY4Y3VHc0ZibTl3cnBnQ21lT2EzdEdGWTdEcWl5YWxZc1Era3YvK285?=
 =?iso-2022-jp?B?cFZXaTZqZ1pDajZYd1JZSmJiZ0J4V0cxWVVnTUgyYjNMcWZDd09TUjNY?=
 =?iso-2022-jp?B?V1ZWVUxxVHNMbkd5OXl3ejlULzJmQVFLNHRBaWN2ZHFESStQM2VvQTYr?=
 =?iso-2022-jp?B?R05QeGozODBXb25KMU94cEk0eXYzK0V4ZUx6dDNYNDRueE9RNUwzRFJy?=
 =?iso-2022-jp?B?NWM1SEFEUklTLzVCTW5reGtaYUl5Y0hRR2xWN3VqTlZMaWlGU0tYaUdw?=
 =?iso-2022-jp?B?OXgvRmdzSkp0aWp6aXdDNTJQeFI1TWF3Q1JKVTlmYVFaaURaWVFYcDA0?=
 =?iso-2022-jp?B?Z0VTZ3RnaUZySEcwRWdaUGJKa1NzaHJNS3JZUjViZDlWWlljN2gvTUtr?=
 =?iso-2022-jp?B?dytVSDZXQWNUeVZpM1l3alZTa29PcHg2UjdjVjl6dGIvUnIvNUEyVU0w?=
 =?iso-2022-jp?B?c2N1dUNNVklIendyWW5rcWxvR21tVDJMUHJJM2ViTFRDU1dzcUovUTFY?=
 =?iso-2022-jp?B?dWFMdTl0L084MS80RUJtSUR2cWNkRXVHcWFzQWdpbVBWWnpoOTBEd2Z1?=
 =?iso-2022-jp?B?aE1mUnVXbFNiOFQ3SklNNUtSaDVjWTVFOFZxNVF4Z2FtZExCRmRPRlpL?=
 =?iso-2022-jp?B?K1grTGIvdW5RTjRWczdteTlObGxlVDFHc1VDbURmOXE0MjloQU5jaVRB?=
 =?iso-2022-jp?B?NzRiUnVSdi9qOVkzTGNGa3cwVzh1b3lxZHZBZHRmc0h5YzJPQzNESFNx?=
 =?iso-2022-jp?B?RmJWWjYzQk4reFNvbXBQSXRlWWMxZWxBckx4ZmxXaXZrTjkxSGs5aVV3?=
 =?iso-2022-jp?B?dHBmd0JCSGdZR3RCT3FJRkFvZEYzNWhMcVRtSi9IYkJiMEptOHVsYW83?=
 =?iso-2022-jp?B?S0hGZzI0RUZBRzViZkpCbHc5TW9ZbmphY2FqcUZOUlNwSW11Nk9Wb3JS?=
 =?iso-2022-jp?B?RHlVK2I2RjI2K01IajhKeWU5bHdhZjZMbDl6Q25ld2pCWEVGQVMwS3dv?=
 =?iso-2022-jp?B?M2hudlhENWhQQnFCR2dPSWdHVCtpT1VucDRTRUVPQkNrT2hURkhlM0E4?=
 =?iso-2022-jp?B?UEJjRXJCVFZ5SDdXZmhrclBwZDVQbWRUWEJJcXVqMUNKUGVuMFFpMlo3?=
 =?iso-2022-jp?B?ZU1mUERSVGxSaUhqZ0pUZjBBcVhwUHNmc2h1RmdUWVY4TDJZak0wWldT?=
 =?iso-2022-jp?B?ODcwUU4rc0tzTnJ4d0YzTWkyUzdqQ1hPU0t0blhOU2NaQ2xJNDFGVkI4?=
 =?iso-2022-jp?B?Z2VqdzUxVGVIazhpN2RxaDBWWW1HNUkyeStscmpVRkJrSHRZbU1hdlho?=
 =?iso-2022-jp?B?Rktyem13dEVXRlM2S2hISXFYZG1NaFpPL29LNk93YS95eWd4K0JPTTc5?=
 =?iso-2022-jp?B?eVJGNXhJYndWSk9NOFQrQmxydTRFS1FjNXJQRjlIUWVkMStNTFhoMHRK?=
 =?iso-2022-jp?B?TDJiVE15Z0FxUGF2QlZGdlQrUmJITjZHM1l0UjMyc3pTc0hHWDUrWEtL?=
 =?iso-2022-jp?B?c2h0bUpZaHpFUDRFK0FVeEo5S3VsUmRkZnByOUR6M1gxcDNKME5OVjg3?=
 =?iso-2022-jp?B?RkJYZWQ0ZmVPdHN4akVlS0c1Q1FJbFV0ZCtENjZrcndNbjVZQ3JQb0Jy?=
 =?iso-2022-jp?B?VEdsbkdsTlA4dWFGcFlGeFY4YndZUExvampVUVVVczArMXRwcUNzditV?=
 =?iso-2022-jp?B?eitOZ21qYnNtS28rUVd2cHBhOFB3T2dyQnFJVkplY1ZNZGk1M1JHRnF0?=
 =?iso-2022-jp?B?YWJDREROWkhFdDhHN0g1Q1FMY1Y4c0M1aTNEVldVZjNkWEpBM2h3Umtn?=
 =?iso-2022-jp?B?TzhPTUVqa2VKdFVhdDVVVW1lTTAxamtybHo3VGZUdEMwNkpxOUVWdVFz?=
 =?iso-2022-jp?B?UzlJeVl5T2xHM0xNWW1XdGZUYldMWWpubzhoeXluZmFJYWFsdGRQTitY?=
 =?iso-2022-jp?B?eE5sV3UrdEJvNWtJTjB6dTdmQ1hRdGxCYTJNZUZvQm1QZU84RUQ0L3FI?=
 =?iso-2022-jp?B?c3VNQktGQXVhbnA1SjJEOFBlazF6YTh4REdPVVlTcDhFcXNPYmJLNlNl?=
 =?iso-2022-jp?B?K2pvaFVyNWNQcktSSElic25rb3R2dGNZWVdHcWgwV1lsczkzd3EyZGx5?=
 =?iso-2022-jp?B?UDdVd3pMVGY4UWM4cmNSOHRWQTExSXM0bFFaWU9FcmtLL2xRMitCTmJP?=
 =?iso-2022-jp?B?bU95UkJaWWRaUm9yay9sQVdKc0dSV2I1dGtmYXNKaGhVNXpockpRTDFu?=
 =?iso-2022-jp?B?YXNYT1RML3lQOWl6YjdoTVo4a2RxZFU4ZDE4a0tTakRPblM1Y3lTSUM4?=
 =?iso-2022-jp?B?NTBXRjhPMFowMzZlNDRHOENCZkpDanIvMEE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vrmedia.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA6PR03MB10496.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c2846b-9a7c-4e23-aa4c-08dc70ddec99
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 10:42:43.8822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33bdb1e9-5134-41f6-935e-3fdcf56b6b63
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZdNHvdDUrgVKO0uztTi9ajbP1EPNiyJg//76b1G+V14Nhc2lmVaSHaGvWRuwwiMde9naZAYoPcQKI10kXcZrh01wgoWeIj6ZI0ER064nZNmIKVjM6Lqg8RCBj9JEoKzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6501


Hi,
I am using the h264_v4l2m2m decoder with libavcodec on a Raspberry Pi Zero =
2 running Bookworm OS. My codec has the AV_CODEC_CAP_DELAY capability set, =
which means "The decoder has a non-zero delay" (reference: https://ffmpeg.o=
rg/doxygen/6.0/group__lavc__core.html#ga3f55f5bcfbb12e06c7cb1195028855e6). =
I have observed that the decoder stores N encoded frames before outputting =
a decoded frame, and the value of N varies depending on the resolution, wit=
h higher resolution leading to a larger N. It means i have a delay in decod=
ing about N*time_per_frame (e.g., at 25 fps, time_per_frame=3D40 millisecon=
ds).

Is there a way to reduce this N value?

I am using an h624 1280x960 baseline streaming, I am observing that it stor=
es internally 4 encoded frames before outputting a decoded one (check the l=
og below):
AV_CODEC_CAP_DELAY is set for the codec.
Codec Format: h264_v4l2m2m
[h264_mp4toannexb @ 0x68201020] The input looks like it is Annex B already
[h264_v4l2m2m @ 0x68200490] probing device /dev/video1
[h264_v4l2m2m @ 0x68200490] driver 'unicam' on card 'unicam' in splane mode
[h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
[h264_v4l2m2m @ 0x68200490] probing device /dev/video0
[h264_v4l2m2m @ 0x68200490] driver 'unicam' on card 'unicam' in splane mode
[h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
[h264_v4l2m2m @ 0x68200490] probing device /dev/video31
[h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec-e=
ncode_image' in mplane mode
[h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
[h264_v4l2m2m @ 0x68200490] probing device /dev/video18
[h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec-i=
mage_fx' in mplane mode
[h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
[h264_v4l2m2m @ 0x68200490] probing device /dev/video12
[h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec-i=
sp' in mplane mode
[h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
[h264_v4l2m2m @ 0x68200490] probing device /dev/video11
[h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec-e=
ncode' in mplane mode
[h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
[h264_v4l2m2m @ 0x68200490] probing device /dev/video10
[h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec-d=
ecode' in mplane mode
[h264_v4l2m2m @ 0x68200490] Using device /dev/video10
[h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec-d=
ecode' in mplane mode
[h264_v4l2m2m @ 0x68200490] requesting formats: output=3DH264 capture=3DYU1=
2
[h264_v4l2m2m @ 0x68200490] output: H264 16 buffers initialized: 0000x0000,=
 sizeimage 00524288, bytesperline 00000000
[h264_v4l2m2m @ 0x68200490] Driver 'bcm2835-codec': Quirks=3D0
[h264_v4l2m2m @ 0x68200490] Profile -99 <=3D 0 - check skipped
[h264_v4l2m2m @ 0x68200490] Format drm_prime chosen by get_format().
[h264_v4l2m2m @ 0x68200490] avctx requested=3D-1 ((null)) 0x0; get_format r=
equested=3D179 (drm_prime)
plane_id: 61=20
sending an encoded pkt, tot_pkts sent: 1
[h264_v4l2m2m @ 0x68200490] output set status ON OK
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
001 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000001 =
count=3D1
Execution time of decode_write: 4.303000 milliseconds
encoded pkt -> decoded frame: 7 millisecs
sending an encoded pkt, tot_pkts sent: 2
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
002 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000002 =
count=3D1
Execution time of decode_write: 0.648000 milliseconds
encoded pkt -> decoded frame: 4 millisecs
sending an encoded pkt, tot_pkts sent: 3
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
003 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000003 =
count=3D1
[h264_v4l2m2m @ 0x68200490] Dq event 5
[h264_v4l2m2m @ 0x68200490] V4L2 capture changed: alloc=3D0 (32x32) -> (128=
0x960)
[h264_v4l2m2m @ 0x68200490] Source change: Fmt: YU12, SAR: 0/0, wxh 1280x96=
0 crop 1280x960 @ 0,0, reinit=3D1
[h264_v4l2m2m @ 0x68200490] capture: YU12 20 buffers initialized: 1280x0960=
, sizeimage 01843200, bytesperline 00001280
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 0, ts=3D0.000000=
 count=3D1
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 1, ts=3D0.000000=
 count=3D2
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 2, ts=3D0.000000=
 count=3D3
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 3, ts=3D0.000000=
 count=3D4
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 4, ts=3D0.000000=
 count=3D5
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 5, ts=3D0.000000=
 count=3D6
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 6, ts=3D0.000000=
 count=3D7
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 7, ts=3D0.000000=
 count=3D8
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 8, ts=3D0.000000=
 count=3D9
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 9, ts=3D0.000000=
 count=3D10
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 10, ts=3D0.00000=
0 count=3D11
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 11, ts=3D0.00000=
0 count=3D12
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 12, ts=3D0.00000=
0 count=3D13
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 13, ts=3D0.00000=
0 count=3D14
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 14, ts=3D0.00000=
0 count=3D15
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 15, ts=3D0.00000=
0 count=3D16
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 16, ts=3D0.00000=
0 count=3D17
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 17, ts=3D0.00000=
0 count=3D18
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 18, ts=3D0.00000=
0 count=3D19
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 19, ts=3D0.00000=
0 count=3D20
[h264_v4l2m2m @ 0x68200490] capture set status ON OK
Execution time of decode_write: 70.186000 milliseconds
encoded pkt -> decoded frame: 72 millisecs
sending an encoded pkt, tot_pkts sent: 4
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
004 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000004 =
count=3D1
Execution time of decode_write: 0.636000 milliseconds
encoded pkt -> decoded frame: 30 millisecs
sending an encoded pkt, tot_pkts sent: 5
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 1, ts=3D0.000=
005 count=3D1
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 1, ts=3D0.000005 =
count=3D2
[h264_v4l2m2m @ 0x68200490] ff_v4l2_context_frames_set: HWFramesContext set=
 to yuv420p, 1280x960
[h264_v4l2m2m @ 0x68200490] Decode running ////////////////////////////////=
////////////////////////////////////////////////////////////////////////// =
=1B$B"+=1B(B- FROME HERE I STARTS RECEIVING DECODED FRAME, THEN MY STREAMIN=
G IS DELAYED OF 4 FRAMES.
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 1=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 0, ts=3D0.000001=
 count=3D20
Execution time of decode_write: 0.964000 milliseconds
//FROM NOW I AM GETTING EXACTLY ONE DECODED FRAME FOR EACH ENCODED PACKET (=
AS EXPECTED)
encoded pkt -> decoded frame: 2 millisecs
sending an encoded pkt, tot_pkts sent: 6
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
006 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000006 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 2
h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 1, ts=3D0.000002=
 count=3D20
Execution time of decode_write: 1.181000 milliseconds
encoded pkt -> decoded frame: 3 millisecs
sending an encoded pkt, tot_pkts sent: 7
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
007 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000007 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 3=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 2, ts=3D0.000003=
 count=3D20
Execution time of decode_write: 0.883000 milliseconds
encoded pkt -> decoded frame: 2 millisecs
sending an encoded pkt, tot_pkts sent: 8
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
008 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000008 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 4=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 3, ts=3D0.000004=
 count=3D20
Execution time of decode_write: 42.602000 milliseconds
encoded pkt -> decoded frame: 44 millisecs
sending an encoded pkt, tot_pkts sent: 9
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
009 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000009 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 5=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 4, ts=3D0.000005=
 count=3D20
Execution time of decode_write: 0.948000 milliseconds
encoded pkt -> decoded frame: 7 millisecs
sending an encoded pkt, tot_pkts sent: 10
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
010 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000010 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 6=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 5, ts=3D0.000006=
 count=3D20
Execution time of decode_write: 0.993000 milliseconds
encoded pkt -> decoded frame: 2 millisecs
sending an encoded pkt, tot_pkts sent: 11
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
011 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000011 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 7=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 6, ts=3D0.000007=
 count=3D20
Execution time of decode_write: 1.356000 milliseconds
encoded pkt -> decoded frame: 4 millisecs
sending an encoded pkt, tot_pkts sent: 12
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
012 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000012 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 8=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 7, ts=3D0.000008=
 count=3D20
Execution time of decode_write: 15.023000 milliseconds
encoded pkt -> decoded frame: 21 millisecs
sending an encoded pkt, tot_pkts sent: 13
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
013 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000013 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 9=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 8, ts=3D0.000009=
 count=3D20
Execution time of decode_write: 18.632000 milliseconds
encoded pkt -> decoded frame: 27 millisecs
sending an encoded pkt, tot_pkts sent: 14
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
014 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000014 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 10=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 9, ts=3D0.000010=
 count=3D20
Execution time of decode_write: 8.249000 milliseconds
encoded pkt -> decoded frame: 12 millisecs
sending an encoded pkt, tot_pkts sent: 15
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
015 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000015 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 11=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 10, ts=3D0.00001=
1 count=3D20
Execution time of decode_write: 9.017000 milliseconds
encoded pkt -> decoded frame: 15 millisecs
sending an encoded pkt, tot_pkts sent: 16
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
016 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000016 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 12=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 11, ts=3D0.00001=
2 count=3D20
Execution time of decode_write: 0.882000 milliseconds
encoded pkt -> decoded frame: 2 millisecs
sending an encoded pkt, tot_pkts sent: 17
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
017 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000017 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 13=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 12, ts=3D0.00001=
3 count=3D20
Execution time of decode_write: 1.041000 milliseconds
encoded pkt -> decoded frame: 5 millisecs
sending an encoded pkt, tot_pkts sent: 18
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
018 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000018 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 14=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 13, ts=3D0.00001=
4 count=3D20
Execution time of decode_write: 0.865000 milliseconds
encoded pkt -> decoded frame: 3 millisecs
sending an encoded pkt, tot_pkts sent: 19
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
019 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000019 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 15=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 14, ts=3D0.00001=
5 count=3D20
Execution time of decode_write: 6.163000 milliseconds
encoded pkt -> decoded frame: 8 millisecs
sending an encoded pkt, tot_pkts sent: 20
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
020 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000020 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 16=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 15, ts=3D0.00001=
6 count=3D20
Execution time of decode_write: 3.917000 milliseconds
encoded pkt -> decoded frame: 8 millisecs
sending an encoded pkt, tot_pkts sent: 21
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
021 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000021 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 17=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 16, ts=3D0.00001=
7 count=3D20
Execution time of decode_write: 1.443000 milliseconds
encoded pkt -> decoded frame: 4 millisecs
sending an encoded pkt, tot_pkts sent: 22
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
022 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000022 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 18=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 17, ts=3D0.00001=
8 count=3D20
Execution time of decode_write: 10.558000 milliseconds
encoded pkt -> decoded frame: 13 millisecs
sending an encoded pkt, tot_pkts sent: 23
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
023 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000023 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 19=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 18, ts=3D0.00001=
9 count=3D20
Execution time of decode_write: 1.837000 milliseconds
encoded pkt -> decoded frame: 5 millisecs
sending an encoded pkt, tot_pkts sent: 24
[h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.000=
024 count=3D0
[h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.000024 =
count=3D1
frame received ! type: 0 ,keyframe: 0, tot frame decoded: 20=20
[h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
[h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 19, ts=3D0.00002=
0 count=3D20
Execution time of decode_write: 1.110000 milliseconds
encoded pkt -> decoded frame: 3 millisecs
=1B$B!D=1B(B

Thank you,
Alessandro Longobardi


