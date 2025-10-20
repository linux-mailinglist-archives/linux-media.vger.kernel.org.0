Return-Path: <linux-media+bounces-44980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B64BEF749
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BFF1897CE2
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 06:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B432D73B0;
	Mon, 20 Oct 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="Sx086JsY"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1121.securemx.jp [210.130.202.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BCD2C21FA;
	Mon, 20 Oct 2025 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941307; cv=fail; b=KRodzNT/zuFbA5hPxNheBtVXDdSLMOv44lJH+0jlls1q9CnO1FYjkhPMIrjMnaMihaGu2AN5f2446zRPHjEYZ+Ul7KnmZdzcDe1bmQQ3AmItZBJVr6sZqtSVbcG6x1PeBtsQZjbt2LFRTTfdQoiMhVl0Se7LqtB1nf5h76a1bIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941307; c=relaxed/simple;
	bh=I/70lExqPfaNMNmVETFKwZl0moaBNqK9yKdT5XLI7MQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X4aDRZ97GA/lAfqTjRADRTzlKzdeMKrnPFQbTLvdcQp0Ae3LkRD1L02MzHu4z9X40dEL+3knxmsnscB8uEZVGsScSCuN0SSQRii/Rub6+PVJ29pycb4JoKqLMVCjDoWk1tL08G7T7KpcyTZUQhYvU1VT9uBFmvwGBElbt6PUV1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=Sx086JsY; arc=fail smtp.client-ip=210.130.202.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key1.smx;t=1760941277;x=1762150877;bh=I/70lExqPfaNMNmVETFKwZl0moaBNqK9yKdT5XL
	I7MQ=;b=Sx086JsYuR+Y8EBC/KuLwG7+FLUh0unBaODERcQh0/g/1bkq+PboGHNO/nR7dZqxLCHlb
	veqRD+x2tGoPLsPyLo5rp3x0Ba+REjCENDhB9dZlyLLeyotBO/eahd6AwNvtHwQkrZQFi81QGQ726
	v326yOURd4FVVvkUqjhM9CNbZwp8QX+9+gh6yuueYECAecnTu3w2KUFs5b6rBpgwrn5k5EfzSqtR8
	fINh+mFg99gDI3IQxTn+1qaz1jH8VIzHRPdFWsM9c03QJ3vh8kfE65Xq/0AZvjRetySd7e3FSGsMH
	+6zsruT37RrDB7Dr6uFCbSmRO6y0VbQOWM32UnJtHA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 59K6LFTx2556873; Mon, 20 Oct 2025 15:21:16 +0900
X-Iguazu-Qid: 2rWhTMh0bUApfuhInU
X-Iguazu-QSIG: v=2; s=0; t=1760941275; q=2rWhTMh0bUApfuhInU; m=HP7KThoQz4zP6aQsuOrrRf8EYEKT0a8g5dP607soNug=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cqlgF2jd0z4vyh; Mon, 20 Oct 2025 15:21:13 +0900 (JST)
X-SA-MID: 53278981
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVtrBH1vbsdHYfz4j2ATAmNboXcm4gQeFP0ZVdu2LioXcVgc0buoAt2HRyoLp1LcJa3v8FxQf4WT0zAHD/R6LbVbpo7GNruBMpKopvbbN3OKU+FYNKWmYKMtBejQITJtutHBEuyX+X8sEb50SNMNjhIHOVs2PzUHiEw6gdwAw9H7X4ddqkg+oo7D3G9bC592Va7xbT/deWcgNaCFhuD5P15eZJf+TiVOa2LNCfo0rB45Y35tON35ICGXRYAcHEZwRshyU51RxA1jJE2XLGz20EAwhRI3r117xLiyBTj2/F9ahaRUemX51vcyGCsdhpFKYxAW82szhiGuz4+pKzK4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/70lExqPfaNMNmVETFKwZl0moaBNqK9yKdT5XLI7MQ=;
 b=F9jaFqcJuqa5A+eR7LlhzipmRTDU+JR8k8EDsF5Wq49U8vF12ztEwG+VFsXbeD30XonOiRwIWMESQ7XvY7k1kEnzAj5UFnI4Z4XcOeMqXkPPkKLtYkWMo8EaZClBrGItMDAC9GyDrA5YpG1tXZ7DZMtgugsoEHjuSv9MADkhuxm5jchEnDFLt10ngqRfb7GNkmqvQDA1jtd9OgFNefbeWHKrTZFX8tsMsW2jhUHoDmlUGVEnOmjdK41EGHcq1Y5U5vPEmtHfqtWVKTQdiCOispLZVrbTFj5PfyJhvQvX8KPDXGeAKT+ce8ljeuqDYbPnmfvqj70mH1TzeosjlLVH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <krzk@kernel.org>, <nobuhiro.iwamatsu.x90@mail.toshiba>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Topic: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Index: AQHcPkQbXtm1ltyMo0OHvBqVNSatRrTEUmqAgAZCiFA=
Date: Mon, 20 Oct 2025 06:16:04 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB9982C8570878DFAB956A1B4192F5A@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
 <20251016-visconti-viif-v13-1-ceca656b9194@toshiba.co.jp>
 <97184b19-156c-4c42-ac8a-dc9800ea64af@kernel.org>
In-Reply-To: <97184b19-156c-4c42-ac8a-dc9800ea64af@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|TYTPR01MB11067:EE_
x-ms-office365-filtering-correlation-id: 099b61dc-12b4-4b04-7e3b-08de0fa0265c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cHB3Y3hNUC96WVEycUY5N2FQazhBb0Q3ZXBaK09mWllneklQWlpnZkxSSjU3?=
 =?utf-8?B?Yzcrb1NZSVVOZVlJT3JGc1cwRG85Ry9lVC9TVU5nN1hJcmU2aUdmYTdNcUE2?=
 =?utf-8?B?TDJHSzJLdk8vSVpOWlJNdVpoMmxoakdPZEkvczBsUEhTajFoYlBFajduNFFn?=
 =?utf-8?B?S1poZk5jRzJabHduOVRXK1ZST3NxcjdqdzZoZUhxMHVaSVBINVR5c0I0SmtX?=
 =?utf-8?B?cEpYKzRPWWVXNkxYc2dLSXdYa3B5RVAwUUQ5WTBrbXZ0N1V5dGZ0akZ2RnVB?=
 =?utf-8?B?cnBveEI1VmFVZXZNenBMZGpxOE1HRnV2ZTJkZkRLdVBFTlZ5TFRmSDRlczJt?=
 =?utf-8?B?S1cwNXhtdGZtMEx6Nkt6ZFRFaWYrNkVJeGNNcXZjNDVXdWlkWE12SHV0UTEz?=
 =?utf-8?B?dy9DWEViblFCa3BTNTMxaUlaRnVDVDZEU0pWRi9BYzlTZXBCTkp2ditrQUV3?=
 =?utf-8?B?bWlhTUlZbTFlK2VlN0xHcDdsK2pXallGWUZJR25yd0FscGNMc1V0YXJyTlJX?=
 =?utf-8?B?blZiUFRhYVlVZGttYmsvUGlvdVZBVWxkVEhZVUQ1cnlDNGFCcDM2dkdZQjZC?=
 =?utf-8?B?RTZxQnpnclVJWFVSUlFndTViaDJsdUl2QWM2M3lVamVwYU11TGFkQmpJcWFC?=
 =?utf-8?B?NWJncFdRM2t0SVFNVVlya3p6cUxETlZQcXpOdldISHNmdjRwOVlmSzlCV0lN?=
 =?utf-8?B?a3BwSkMzOWQ4QitwTUJrNUpyQ3dYR0lxRkx3MlpIREs4bmdDbzR0NHNJdW52?=
 =?utf-8?B?eHVFcVBIV0h4NzJ6VXY3aGYwNmVGaWhoNGFKeGhCVWdaS0w0ZWZIUVlKWVhn?=
 =?utf-8?B?a3dWUUR3YTdCaUVnRlhjeTNndE1IakZ5aXBSY2xNOHNnRGs2enVMTmlkRGlV?=
 =?utf-8?B?clREZDUxUG8yZTkwbXltVVFsb0tZZCtZRXgrNzA3U1VpNlpmTjNsdkh0ekI0?=
 =?utf-8?B?ZDB3cE1idXlpbVM4RkF0b3FYMVlQL29ROHErQ1k4b2pEQ0xkajZ3UndwcnRV?=
 =?utf-8?B?NGluMXRIQ3J4WmxLNW0rYlFvL2ltclNIODVmTFlyTkFDaWx4dUVwVVphbkk3?=
 =?utf-8?B?MGp4bElQTDR2OGRKNlRGZlhBbkQzd3lDSUkwVmRMUTl0dFJ5b09oazhZNzV2?=
 =?utf-8?B?YlJlbndkYzYwWEFsKzBVUEF5ZnJJOURHYlprKzB1REF3R1pRNjFxaGtMRm5Y?=
 =?utf-8?B?N0tvUGN3TmYvRnh6RExDZnd5OFRzVkZIK2lPWFA3TTZoNVhQYzdqVVBRSVFp?=
 =?utf-8?B?azVyMDRYdFVOd2o2bkdEZEovR25tM1VlY083NjdUNXhTQlZyQmFpellVa2Fs?=
 =?utf-8?B?Si9VblpXWHRBL1FYSHNJUStQQnhsbktIMWY4RjRZbzJVQkpHell1V1Q2U1pt?=
 =?utf-8?B?eENKQWlQbjM1Zzk5OTVlWkFtU3ViS3hGcDZoeUNIeXRSc3l6Yjc5ZUlyVVdT?=
 =?utf-8?B?YTJuUVdaS0hlbnhqOENpRjRqTDZwUzZVRVVvVnR4TzExZjFzQnd2VytIZTAx?=
 =?utf-8?B?cXBlUHpuTVJOVys3eXFEbzNGTE9IT2xUMlQrcGYzUWZCWU5zckZBUTlZRXdG?=
 =?utf-8?B?ckJSVGpnYkcrcC9xMTRwQnROb0JJQlFGcHc3WmdMb1lLeTFta0xzVnBNRllZ?=
 =?utf-8?B?OWxCYm1tMDVUdWdPU2tvQXhjS3Q4aStwZ3lJZSs2d0VjV2VDcjFBeDFyNmg1?=
 =?utf-8?B?aDhpNERBMWFHRlBhU2gvaWNINXQ0eHcvREtqdnkyL3ZtT1gvckEvOWNRM1Vs?=
 =?utf-8?B?S2ZsQ2F2d3VwWUtUZnpLd3owaGk0S21NY0s4bWVMTVNnWml0cWVScDFneTJp?=
 =?utf-8?B?STZvQldFQ29KaTZrU1dFZHRzdEN2Q1ZOSW5neUN4RGZhWGFNbjNSbStzaU0y?=
 =?utf-8?B?ZlBRUFl1Y3pPbFpqSkhXemNNVktzVXE1Ym9xLzljdFRybWlNVUFLeGhsYTVC?=
 =?utf-8?B?ZnNhRndzOWZXdTRNZVg1SktZdkZReFJ1MkE3VkgzU3JDc2duK2dMZGZjSlBD?=
 =?utf-8?B?QVJXZGhSb1YwU2NGR1NIUHY2MEZGQ0NVMkl6ZStnc293dkF0RVF2d3N0YVVW?=
 =?utf-8?Q?IBHDL3?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aUFzTnRWWE4vMG9TTjNhUDdwQzBmV053a0hha0xNUEErNTE4MTFka2ZUL2Iy?=
 =?utf-8?B?blc0bjNUNkxFNks1ZmJOdGw2c2o2enhJR2pZczFIMTlpS012VGZCTnNFNTVH?=
 =?utf-8?B?ajJQODdjVG4zYVgwNERnY0lZR3pRM2I2WXI3VTlWN1JSQjh3cllaNXJRZUpY?=
 =?utf-8?B?cjdnUjJpN2lpZ2JOcGIvdmh4VWRkS3RqTnFpajViKzNReXBjRG1zb2pKWGlh?=
 =?utf-8?B?NUR6Tkg4bDJhSFpyRytNMXQ2Ry83RERoTGxIYitMdllSQ2RZVFNsODRKWHRL?=
 =?utf-8?B?anRsOWpNS0VkZ3FLSVl0YWRKcUpXV2xEYTdhRXBrQjI0Tm5OV1NUdy9naDhq?=
 =?utf-8?B?cFRHUHZzendhcWZJWDNIZVB5eExMZXI0cTlIekxzVkIvcExqZmJ5a09BZWx1?=
 =?utf-8?B?ZWFmYytsQ2gxNUNob0R6Q0Y2c0tNNDhkeGhrakZ4S2Vxc29TUE5LSHZnWG90?=
 =?utf-8?B?ZzFvZ0tvYThPZjkxSGJoa3ViSkgwbmQrZEg2a3AwcmZlclNQWFZWMExjQUZz?=
 =?utf-8?B?Tnd1bndadkE5akFpbmRaR2IwRjkySmZuQU15aWJHK1Nkd21KeHVBdE9ieFZX?=
 =?utf-8?B?SXJxMUlPdmo2SWFVUUhldWpyVzcya2ZwSVZIOUxIRHkyNjB1Z1BzZGZIeG9B?=
 =?utf-8?B?L0dpMExoRTgxTHU5dHdMRTRvaHUxSXhrblQ2YTk2c1dROURSOElqaEFYTVBG?=
 =?utf-8?B?QXh4YnRTazBZM3ZhSWJESjlPR25UbERzayt1QVVKT3NNM2E4WlB1OHUzeVRV?=
 =?utf-8?B?alFKQ3YreDBwZUo0cXA3N21IYnQ0bjV2MS9peFh4R0lLQzE3T0dsTWVPekpY?=
 =?utf-8?B?WnRnaitrdE1wbk9kdndsMXRpdEF4ZUR0TzNLRWh0aDNUSjNVMXZMeHNLVW9G?=
 =?utf-8?B?eHRaNFpacVRtY3MveGxrZlhhRXZMNmNHaEo5b25PWmNrWnlid2Fad2xsczFB?=
 =?utf-8?B?TjdURzhzWmlIcEZDb3MwOUZoSUJQV3Q0N3cwbzNLNkwrYWRWTFJ5WlRCMzRh?=
 =?utf-8?B?clJra1o0aWZGSWh3MVIwbkY0RkRsMnpBc3JWeEg0OVl0eWZqNFNINStyaE02?=
 =?utf-8?B?dkE3WUFha0pWZlhZQjMxU3NpS0gxN2F0RXE5dnpqeWFiYlBaR0gzeFMwQ3gz?=
 =?utf-8?B?T2NTdDhlZzhnZnJTWk8vWXBFbUlhNThMMS80S1VscWE3cnFnSStBeVpvbUNn?=
 =?utf-8?B?YnNZVTNLRmR1a0MwZXA1L2ZrKzdJNm42bThRaXZZa3BGY2M0K25HSkp0WGJl?=
 =?utf-8?B?SWMydGdTd0hoMkt4K0s4bTdyeWZ3UEhBczdrcG5iTExVWjlBVWVaQXZsSG9P?=
 =?utf-8?B?VDR5UkVYMnFoZEtsR25LUGN5K2ozWkZEa0NjbUx0eXR4VnRnZnRLVDVJbkFv?=
 =?utf-8?B?ZDFjeFk5WkVVTmducEdITkZwYXRnYTJCN0JMTU1qazRyVUNyZ3VVU1hHSzE0?=
 =?utf-8?B?bFlveWlJVGlDSUhaVnZwRWMyV1cvQjFPbSs2dDZHMUZIL3hJSGxIaFdSb2gy?=
 =?utf-8?B?K3NtWnoyamE5L3JRUDM2Ukx4VFhaR2ZHSjVDRXVnKzZNbFh5cmsra2pXTWN6?=
 =?utf-8?B?WDR4NzlkaU9oZG1BM2wrclBkRmpheHBYbFM0dGhGUG1ibjRKMC9TV2tmVWhL?=
 =?utf-8?B?MHZ5WmQzNmREV0NNU2RjMlVudzJBWCsyaXVMMFBjZDlNWGVLUmFMUE5vUUVK?=
 =?utf-8?B?cnAwSEROV1hyRGw3a1dJb3EzWklyYnJzcUg2VFRCVVZwY3h2VGpRS3RGbUNI?=
 =?utf-8?B?eUkvMFN2eC9OeWV2K1dSZVBlT3dZNUxBVkJOSzIweWZrZU9RaXRZVmM3Zkxo?=
 =?utf-8?B?K01KV2xLSGdnNmF3RUM1M1dZdlNGTGNUUnVTQ3pTTk5hNmRIWEc2cTY4RTZn?=
 =?utf-8?B?ME9ObUxZSTZHS0dlNmdrMWxBZWlJdTEyWmNsRUo2UVpUdlBKSjgwcUplVEpC?=
 =?utf-8?B?Zm1qdmNETThFSDZJZjhPemx0dDRzbmJ1MnR6dkRDaWJ1TS9mdnNsTVNQcVh2?=
 =?utf-8?B?b09SeXk3ZzFDR2NHQllBMU9laUs1aVp4QjNZaGNJT2Vhd3lTMFB0T2luTTVX?=
 =?utf-8?B?VmlJVVBZdUlib2Q5K0NscUlCbUY2QVM1emxwVEpGTlRHQkx3MlJMWFQzV0dK?=
 =?utf-8?B?T21ZcWppNWc4UkQvNUlNSktUVDJMM2FWQnpEQy9iK1BxdmxHb3NyT2pQWFlT?=
 =?utf-8?B?c2c9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099b61dc-12b4-4b04-7e3b-08de0fa0265c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 06:16:04.5251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HjKzIQ4neeyL1DOZ9pGtpBNEXYG3eCaAkEWF3Y4yCSp8k12hxJsz3Rm+nbIcPy+8rVbjUJ+rjuKbqEfuaGrGluNIrxd3DXBEXKWJLgyoTl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11067

SGVsbG8gS3J6eXN6dG9mDQoNClRoYW5rIHlvdSBmb3IgcmV2aWV3IGNvbW1lbnRzLg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTYsIDIwMjUgMzozOCBQ
TQ0KPiBUbzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKWoe+8oe+8qe+8pO+8o+KXi++8
pe+8oemWiykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+OyBpd2FtYXRzdSBub2J1
aGlybyjlsqnmnb4g5L+h5rSLIOKWoe+8pO+8qe+8tO+8o+KXiw0KPiDvvKPvvLDvvLQpIDxub2J1
aGlyby5pd2FtYXRzdS54OTBAbWFpbC50b3NoaWJhPjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+
IDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6
eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxj
b25vcitkdEBrZXJuZWwub3JnPjsgUGhpbGlwcCBaYWJlbA0KPiA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMyAxLzdd
IGR0LWJpbmRpbmdzOiBtZWRpYTogcGxhdGZvcm06IHZpc2NvbnRpOiBBZGQNCj4gVG9zaGliYSBW
aXNjb250aSBNSVBJIENTSS0yIFJlY2VpdmVyDQo+IA0KPiBPbiAxNi8xMC8yMDI1IDA0OjI0LCBZ
dWppIElzaGlrYXdhIHdyb3RlOg0KPiA+IEFkZHMgdGhlIERldmljZSBUcmVlIGJpbmRpbmcgZG9j
dW1lbnRhdGlvbiB0aGF0IGFsbG93cyB0byBkZXNjcmliZQ0KPiANCj4gIkFkZCIuDQo+IA0KPiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNi9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9wcm9jZXNzL3N1Ym1pdA0KPiB0aW5nLXBhdGNoZXMucnN0I0w5NA0KPiANCg0KSSdsbCBmaXgg
Y29tbWl0IG1lc3NhZ2VzLg0KDQo+IA0KPiA+IHRoZSBNSVBJIENTSS0yIFJlY2VpdmVyIGZvdW5k
IGluIFRvc2hpYmEgVmlzY29udGkgU29Dcy4NCj4gDQo+IA0KPiAuLi4NCj4gDQo+ID4gK2V4YW1w
bGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3Rv
c2hpYmEsdG1wdjc3MHguaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ID4gKw0KPiA+ICsgICAgc29jIHsNCj4gPiAr
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9
IDwyPjsNCj4gPiArDQo+ID4gKyAgICAgICAgY3NpMDogY3NpQDFjMDA4MDAwIHsNCj4gDQo+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIGxhYmVsIGFwcGVhcmVkLiBJdCBpcyBub3QgdXNlZCBh
bmQgaXQgd2Fzbid0IGhlcmUNCj4gYmVmb3JlLiBJIGRpZCBub3QgYXNrIHRvIGFkZCBsYWJlbCwg
YnV0IEkgb25seSBhc2tlZCB0byBmaXggdGhlIG5vZGUgbmFtZSB0byBtYXRjaA0KPiBnZW5lcmlj
IG5hbWVzIHJ1bGUuDQo+IA0KPiBEcm9wIHRoZSBsYWJlbC4gV2l0aCB0aGVzZSBmaXhlczoNCj4g
DQo+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+DQo+IA0KDQpJJ2xsIHJlbW92ZSB0aGUgbGFiZWwuDQoNCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClJlZ2FyZHMsDQpZdWppIElzaGlrYXdhDQo=


