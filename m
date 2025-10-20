Return-Path: <linux-media+bounces-44978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4530BEF71E
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FAC21897145
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 06:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A872D6624;
	Mon, 20 Oct 2025 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="DfcpnFey"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882EB2D2388;
	Mon, 20 Oct 2025 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941074; cv=fail; b=i5D/6Amedui0QgkmTNkHxO/SozTeAJCPAbh2NNa9GCxUrcUhTfpgAjZLBTSbr4xj4XIvJf5/b1ADfx1y8DW0zisKmNehOndHrVfMMP3XwH18jMdnr6TwLfQMQCzO46r8ULA/AYxvvzf5P70rTzUl2hIwAOFuvx/7xDzlHm+H4YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941074; c=relaxed/simple;
	bh=SDvQIhKrfohicwMynsRhWpFsVnal382ZF+vGg4vMJSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bu7cqRJHSzlN3YGgcrCMgikO8Kmq91cNIPkFlp+AnKYg2kA5Vgza+Qs9pNRsp0snuZouNb0HW3WaCWF8ujMTgTLFbgiHL9/uAt5rmJh9c3z3Bjh8Cfq/HpZNK6SjQJwUtjmWqPWDZ3aZP3YCYYR/x9PF6rOVpMdlwPHlIBdmok8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=DfcpnFey; arc=fail smtp.client-ip=210.130.202.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key1.smx;t=1760941025;x=1762150625;bh=SDvQIhKrfohicwMynsRhWpFsVnal382ZF+vGg4v
	MJSU=;b=DfcpnFeyndLDgJgr3MYeUDS+ivJ72iWkp7xwNjm6zyWXIme2zsiBxsAep4LB2vgIif1vl
	jMxOxe756ctOU2U6M0QZ1G2vu7TavG7xD4tly46zr446SLVLkH/SIC2i+DaS+hcRWfd47EfD0XQVg
	j2CV90Dek5oanfuEFOrFAYefjGV3Xx/ENlULOFeth1XkIdVJqkQSJgox9xGlXaleWm4baKjtcsbSA
	G0PBAjdkgcei3l+91WSvtTqyjxN4L5Met/kbq5g5iNWvSagOvwlw++XqRESXvvR9HDKF2rgKWOKYr
	R5yPq7fs8IrzK+3XAczk0Tnb2una0D0AN4kKS/x+tA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 59K6H3J01937090; Mon, 20 Oct 2025 15:17:03 +0900
X-Iguazu-Qid: 2rWhejjBIfnzAhpUKb
X-Iguazu-QSIG: v=2; s=0; t=1760941023; q=2rWhejjBIfnzAhpUKb; m=WukTqRTZzxcsjPw9N3RgzkbMpPciMYIXEdurTbjtIDQ=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cqlZN16r3z1xnZ; Mon, 20 Oct 2025 15:17:00 +0900 (JST)
X-SA-MID: 54177326
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekN8/rX/iDCEcdEnS+gJ/mgfZPbnnIsja6ivF83yzYHv91BAunmez2KnFma9RIQJWVq/xkq48BaVRTNd1z18FjN1Del2U39pDA7lRRfGRBMNMQqAVjUik5vXpZqm3UuQxfe6P7J1+NJMRdy15grsvidyPbEf+5w02Nu84A1WkqTVn/PvCvk9SR9VxSAc5RV/1gzPr88et/SKVR/IEVeEJRH6tbjoTsDK6tAg2NuyvQUyWLyUJXddQD22Rzc40EEkCgZm5oEvwX3HuV9GcjoaxS1YvduJ+1B/rVKPPVFkKtIjR/O9b/l3wPTRXVREgBc691SAbWsRJCHowh5z8syEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0xbg0JHsI2vvH0kU7KzsVB+gknvdZWJDxUmveOxODU=;
 b=NKZWS1IKoy40kDXGWGqvCM4YvS55GaBhya9y+ii5X+OxcW66vqN/QvyIjNPBRrUk4HulpYuSJ3iUP5BWHE6+UW0UaOKBXACp335ixGaoVUHH0Cqgu0Z+hw4PI3hNLkkCSF5pDujhbB3wAkat+effYvh8pcjQyCOPDxOaHwztJolRyEnwnu9BOzHju9il6/QMTgc22Tt7bOs527qF+na+lCyCDcLN+HQl/ICYSQKhnUD6x2tPVoWdpUS7enGe7m+HA5OCxohwePn4/6TNnpF3p8KYTnRXMS/aEgMRQEtdEaxK2BqQwqFAnMwVRSUE19lQII6cUD8TrknVyg6PQ0L9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <Frank.li@nxp.com>
CC: <nobuhiro.iwamatsu.x90@mail.toshiba>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Topic: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Index: AQHcPkQbXtm1ltyMo0OHvBqVNSatRrTEL+GAgAZj7xA=
Date: Mon, 20 Oct 2025 06:11:52 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB99823396DFFF60DCF661011192F5A@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
 <20251016-visconti-viif-v13-1-ceca656b9194@toshiba.co.jp>
 <aPB16VqrMZrMNDSq@lizhi-Precision-Tower-5810>
In-Reply-To: <aPB16VqrMZrMNDSq@lizhi-Precision-Tower-5810>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|OS7PR01MB11700:EE_
x-ms-office365-filtering-correlation-id: 6fa27c6f-1486-4132-f0cc-08de0f9f9042
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-2022-jp?B?RURHbkV3RGJCME1BaFpTTEZicU1rRlRZUlhoSGVHc1Q5VjIzUFVmcnVU?=
 =?iso-2022-jp?B?T1p2UDB4ZkZvTjBaNGEzc21GQTNOYk51a3AzdWFlYngzK0Q2TjZXK2tn?=
 =?iso-2022-jp?B?WE52b0k1VXRJSDhMekgzM2MzblBhRFlRRlNVbmZweXkxcmNGWFRtcGVl?=
 =?iso-2022-jp?B?TXQ2SUtHTTVXWGNkWUhwdWZVQkJsTE5vMm5Pbm00SzNVRTc1TEp2emVC?=
 =?iso-2022-jp?B?VTJSUTJxTXRPaEVhdHlETEZLYytHNkkrZllQeW5JdUQ3R0k0OEcwRnIx?=
 =?iso-2022-jp?B?b0cwSldweDhzek1CTFl4ZWxHMFlTTXc1MGZLOTZIdnNTYXRxcW9UTHQz?=
 =?iso-2022-jp?B?Q2VuMlFFQUU3MUdwMkNlTklaVkxDSStEeDZZUWltMjVIVFJCYyswVkta?=
 =?iso-2022-jp?B?d3BVYVd0YTNXeDlVSEpMRzdGUHNCS1BFM1hEdXBnYjRQZVFkd21XMjgw?=
 =?iso-2022-jp?B?N2hkVll6MGhqNWg2YWxmSUw2ZjRzUHZON2JGWTlKNWZkM1RTVkR5Njc5?=
 =?iso-2022-jp?B?cWVuaFNYWURPQ3lSQ0M1ak1YandXM2ltQk94N1g1dEV2V3BscnFKbmNB?=
 =?iso-2022-jp?B?L3A5SkwrcHhWTnk5OTc0M3V3ZjR6Qm5wMkMrbW16c2h0UFR5elo1c0Vu?=
 =?iso-2022-jp?B?c1ZJQXJzcUdZalQwaVkrRFlYNkxEUjNleDkzeXMrSEMraStiUDFzbUxF?=
 =?iso-2022-jp?B?RUxzWTdmWm9Oa1hRWGNLYjZYdGxqY201OGl6UXlxc3o5VEswQmNQaG1h?=
 =?iso-2022-jp?B?cVA3dUwyWEZ2aVE0Mjh3SzN3MkhiQUo5NnJFOWJMUDdaQUhMWDFJNlhn?=
 =?iso-2022-jp?B?V3FUWTJjaVlrT21WQ2xkOHE0a2grQ1JUQmRDUnlWWXgyRFg2VGxZSUhU?=
 =?iso-2022-jp?B?Z0VGL2RiN3RNcWpLMlFIcXhDenUzaCtMVDJRUXlESWZUV2pVUGxlcmw5?=
 =?iso-2022-jp?B?QnRtRjVEYUZWRUYwYWpEamIxQXl6MFd4YlMxd2dkemtHYnNqRUppQ3hz?=
 =?iso-2022-jp?B?YTlTZy8vNDlJK0k1YnZUT25hUjFENU1yRHBsSTdVVGxnTFRUS05OR04x?=
 =?iso-2022-jp?B?ZCtqV1BpQSswTFZGblZLajRyVlp6N3M3WkhjNGRIWkhvd3IyK2s5Yytp?=
 =?iso-2022-jp?B?NGlIMGZtajhqQS9XaVp4dEJkejdOYzk3WmJ1UUVxdmdwenloMFhKNS94?=
 =?iso-2022-jp?B?T0xCWlVtblk4UElkaTBvaHpsOHRaUHA5L0FrbzdZMFp4RzZiYXQrQ0ND?=
 =?iso-2022-jp?B?NHFZMmRmTGtvSmFYZkFzc1U5eTBZYnY3VEw0N3ViSm50S2x3L1FFbDNj?=
 =?iso-2022-jp?B?QUl0OW0yMXkrZVNTTjFoZXRBYmh5cWlkZGdLOHR0OWN1ejVrRUZkSTBW?=
 =?iso-2022-jp?B?c2lmbzJxR1RidGpwSFpMODNwVVhva2g3WVJnaWVUZEhxNXJFVFRXbEEw?=
 =?iso-2022-jp?B?aFQ3K2NGaHVXWjhncU9JeDdFcWtjSWZENHhvNGdSYklPMUNGamJaUmRI?=
 =?iso-2022-jp?B?SHVEa3NCdEQ2UkZyUThCRGFud1dKNmlYQzh1WU55ZHBpQmN3bSttRTkw?=
 =?iso-2022-jp?B?WFBIS1dBd2IzTHFYRi9hcXRNVEErcEhmaGNLZXRFdDBiaHRSS1VHL0VQ?=
 =?iso-2022-jp?B?NENWeTJOMTJlS2ZUY2l3WUNEKy9vUzJYYk90TVc5dmV4NmlZL2ZmdTdx?=
 =?iso-2022-jp?B?TnNsMnVsNmdMMFl5K3pRakVyUGtsakxwTXBKbE9WMmNHU0hoUVA1dzEr?=
 =?iso-2022-jp?B?NHJzZ05Xb0x6S0tkMVY3Y2Y3WEk5aFpZcDJ4dnE5TWl4a0M5d1NpQnRI?=
 =?iso-2022-jp?B?UVd3Y3Q2Ry9kWENwc2Z6b0VMelFueVpMb1p1Q1BFM3VKM0k4R3RnNXRw?=
 =?iso-2022-jp?B?U04xSjdsQS9PTlViV2tFWFd2eE8wMlB0ckM1VWpLOGUvaEVVOFl1aURq?=
 =?iso-2022-jp?B?cTdLQk9VYXpNUE5OVUJLY0RKYkwvV1NGdlhtYldGSUUvR29aTDZlandv?=
 =?iso-2022-jp?B?eTVhdnA4NWlyNDFDVFMveDZBTHQ4UE5YL0N4c0lQU2hGSCtteU5XQVBW?=
 =?iso-2022-jp?B?ZkJzY0pNcWxZS0ZBdWpxZ0pZOHBsaHIzNlNCeU00LzFZTitrYjdqWnRD?=
 =?iso-2022-jp?B?OTE=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?Wis0dFdGVHgvTTJydmY1RGFsNTVUMzVlNEVSekFmbzhUZGI2S2s1cWI1?=
 =?iso-2022-jp?B?aWYwa3JTNEdYTlRjemI3TEJmMEZHLzFDVVhBdDJibjl0anJaRjJDNzFQ?=
 =?iso-2022-jp?B?WlAyUXFXWCsrM3pUTGxjbmVIMmE2V2psbG55SkZwUGtwVmY4T0Nwa1dC?=
 =?iso-2022-jp?B?RGlhVU9uTzBXSTd0Q1ZlVnV0SXh6aHJEZHpUblhDc2w3RW1HRXlENk12?=
 =?iso-2022-jp?B?SFptdFFnaGgxa3VKaldSMi9SN2hudzZ1dUk5Sjd4VlBFZFRGbU5iRzBP?=
 =?iso-2022-jp?B?bmdYcTJlcWQzd0tld3ZrUEUxbFNVcXI2bTBKODlyc3B2blN0R0pLRVFr?=
 =?iso-2022-jp?B?bTNTait4ajVoOE9sMVZPWEdIZStjZWRvTWdrc0V3K3VrZytQdHNsM2xo?=
 =?iso-2022-jp?B?NTdpNTBHRlh0SjhsS2hXMkxuOFlCbUxhelNGVjVvYnhseTFsNnM4ZDF6?=
 =?iso-2022-jp?B?WVA0MFJWK20rRFVOT2szZ2xWQkFRZjNLT0tTZ0tFRlJRc05UM2JrS2g4?=
 =?iso-2022-jp?B?L0xOUVNwTGhoVGFWUzMzSS9jRmErZGdzWUkwM2o0a0lES0xOczMveUx3?=
 =?iso-2022-jp?B?N2tSNWdGY0tzdGtGVlhKenByU3p3RS9HUENpTEJVOHZvT1RsK2pRcytu?=
 =?iso-2022-jp?B?aURYbFl0amgzbmsrdHMwUWpLY1IrL3ZRbkVHZ25WMkFNMnluM2puSmZ6?=
 =?iso-2022-jp?B?WHc1N2lhZEZuVDJoV2tSck90WFFLamIwcytIblFxdFh5d1RVUmo5MzlS?=
 =?iso-2022-jp?B?QWNIejk0d0JiamxwTE5MMCtsM2Vpak91azFRSEErdFEvM3U4aWROT0hy?=
 =?iso-2022-jp?B?Vmdlc2FmTzJWa0xBZHdZeGJRYmovNnE2aVhWWGd0S2FqaVg0ZURESllB?=
 =?iso-2022-jp?B?bXZxWVFkNSt0NFNDejV1VXlVeXB5V3pKK01FejdKc05GWTF5NS93aU1k?=
 =?iso-2022-jp?B?eHludGk2MnYzQy9MaGJZVzJSYzBEY01lVnEvTjdpVTlQUTlIYjVSYmhs?=
 =?iso-2022-jp?B?Smh2SnlEajFxcE1WSU1BTUJGeVk5QnpjdDdqV2tkeE9VYjMrZWFQQzNE?=
 =?iso-2022-jp?B?bGNOK0VoVGw3aUNJcXB1QmlSN0JSbmg0MHo4VGtlZkh4N1hIazliNEJi?=
 =?iso-2022-jp?B?UjE4OFBEYnAxNTJtVFI1Q1ZwUnZQaTcvS0JJSlhSRnNFc0U3MEVuT2NQ?=
 =?iso-2022-jp?B?UFY1QzZLZTdKSXJzZ0tFYmNsZitaL1l3YWk5aUpSd2UyZ3ZQMVpqdkNt?=
 =?iso-2022-jp?B?N1gvbkRUTnFoaS9uZ2NUZy9Ba2R6cjRGVlVneE9NSmpjWXlnRmJnNDUv?=
 =?iso-2022-jp?B?dVo3WGdUcERRZUxHQzlKT1U0Zlh4RTFMaDJkRVFrZXNHR016TTlEUGZy?=
 =?iso-2022-jp?B?ZlppKzJBN3NWZEtRelF5ZkRMYmF4WXZYTzc0VElmbERZek40MGd0dTda?=
 =?iso-2022-jp?B?N0pVMnhWZzV3QUZPOW1UZGRmT25TZ21sSTF1SktPQUdqdnhodW1QSEpH?=
 =?iso-2022-jp?B?TUtMNDBhMSt6YVBVTnBKRUFhNzlIS1IzUlpMb00vWVlTUTZFS1JQZFhP?=
 =?iso-2022-jp?B?OWZUdUpvNlRya0xlY2daKzI1SnhjMnBKdWNlZ1g5RHNEaUNDSHVXU1gw?=
 =?iso-2022-jp?B?bDVrL2JsNFUyeDhJM1hzMmg2V3I0U2dPVndZQm9RTkRwdUFMaGh3MjUw?=
 =?iso-2022-jp?B?cDllRlp3RS9JUDY1RGtiYzQyU1Eyc1lGbkhKUHdYMjNHZ3piSkR0QUlj?=
 =?iso-2022-jp?B?cC96VXJ6bWlhOU9aM2VaY3NsM0VMMXRsY0M4RnZRdlRMTlRNVzlsUVdu?=
 =?iso-2022-jp?B?cWcvM08vTHBLYlZTZFBELzl4MGxOL3l1d1RIbWZ1RXdJM3M4TUxRcDhm?=
 =?iso-2022-jp?B?U05zVFUzVzllcXc5NFlpMmJoYXc2QWcwb1ZrVnJHZWhqbUxzRnBhZVd0?=
 =?iso-2022-jp?B?eG9rZ3UvOHBPTUlRV0tjN0pYVzhNbitUODJ3V2RrYWR3RmxmRUwzRDZs?=
 =?iso-2022-jp?B?UjZ1MVEvbVBkSUR2UFVHaUZ3Zk1HdS9iQ1RHTTBSWThWT0UrSWh1SUhX?=
 =?iso-2022-jp?B?aEpvK2t1Vm1GdUNHTnlGenBzdEx6TXRNd0ZkS0Z6SG4xK1FZV0hDeGc4?=
 =?iso-2022-jp?B?Vk5xQjlHVFVrZGdSUG5JWFRBZlM5enF5Y3g0NDJmV0FHaTZibGhWYitV?=
 =?iso-2022-jp?B?MStpNTlJMUZKRTJUUUJnZjRYU2JmRmVDSGhNeDBMcDZVQ29SK041NVdz?=
 =?iso-2022-jp?B?QngxUEgwYlBCS2FJNDBMcnczbkFGc3d5ZE9qcE5SZFUvOWdjNWprSFVY?=
 =?iso-2022-jp?B?VHhRTVNVN1ZwbFJDOFhWdmxWTG1aaTdSZWc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa27c6f-1486-4132-f0cc-08de0f9f9042
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 06:11:52.7242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 742jwgQWIM04H1D2fP9k6saf6IguDs9J8G1e9QywODWNKMTj3gwg1YK6lAoefrmGFRlAVcWFWMt1Vaa38dN4caFNgdfmAsptlfYkUZh1KWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11700

Hello Frank

Thank you for review comments.

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Thursday, October 16, 2025 1:35 PM
> To: ishikawa yuji(=1B$B@P@n=1B(B =1B$BM*;J=1B(B =1B$B""#A#I#D#C!{#E#A3+=
=1B(B)
> <yuji2.ishikawa@toshiba.co.jp>
> Cc: iwamatsu nobuhiro(=1B$B4d>>=1B(B =1B$B?.MN=1B(B =1B$B""#D#I#T#C!{#C#P=
#T=1B(B)
> <nobuhiro.iwamatsu.x90@mail.toshiba>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Philipp Zabel
> <p.zabel@pengutronix.de>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
> Toshiba Visconti MIPI CSI-2 Receiver
>=20
> On Thu, Oct 16, 2025 at 11:24:38AM +0900, Yuji Ishikawa wrote:
> > Adds the Device Tree binding documentation that allows to describe the
> > MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
> >
> > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > ---
> > Changelog v12:
> > - Newly add bindings for CSI2RX driver
> >
> > Changelog v13:
> > - add entries to MAINTAINERS file.
> > - update email address of Nobuhiro Iwamatsu in /maintainers
> > - add Yuji Ishikawa to /maintainers
> > - change /properties/compatible: toshiba,visconti5-csi2rx ->
> > toshiba,visconti5-csi2
> > - change bindings file name: toshiba,visconti5-csi2rx ->
> > toshiba,visconti5-csi2
> > - change node name in sample DTS: csi2rx -> csi
> > - remove "|-" from /description
> > - update /description
> > - add definitions of clock and reset
> > - update /properties/ports/properties/port@0/description for better
> > comment
> > - update /properties/ports/properties/port@0/$ref to specify full
> > pathname
> > - remove
> /properties/ports/properties/port@0/properties/endpoint/properties/data-l=
a
> nes/description because the default text provides enough information.
> > - update sample dts
> > ---
> >  .../bindings/media/toshiba,visconti5-csi2.yaml     | 125
> +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 132 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
> > b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
> > new file mode 100644
> > index 000000000000..21fb46de5b6e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.y
> > +++ aml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
> > +
> > +maintainers:
> > +  - Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> > +  - Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > +
> > +description:
> > +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI
> > +CSI-2 video
> > +  stream. The obtained video stream is used as input for the Visconti5=
 VIIF.
> > +
> > +properties:
> > +  compatible:
> > +    const: toshiba,visconti5-csi2
> > +
>=20
> ...
>=20
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/toshiba,tmpv770x.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        csi0: csi@1c008000 {
>=20
> Needn't label csi0
>=20

I'll drop the label.

> > +            compatible =3D "toshiba,visconti5-csi2";
> > +            reg =3D <0 0x1c008000 0 0x400>;
> > +            interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks =3D <&pismu TMPV770X_CLK_VIIFBS0_CFG>,
> > +                     <&pismu TMPV770X_CLK_VIIFBS0_APB>;
> > +            clock-names =3D "cfg", "apb";
> > +            resets =3D <&pismu TMPV770X_RESET_VIIFBS0_APB>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
>=20
> need empty line here.

I'll add empty line before blocks.

> > +                port@0 {
> > +                    reg =3D <0>;
>=20
> empty line here
>=20
> > +                    csi0_in: endpoint {
> > +                        data-lanes =3D <1 2>;
> > +                        remote-endpoint =3D <&imx219_out>;
> > +                    };
> > +                };
>=20
> empty line here
>=20
> Frank
> > +                port@1 {
> > +                    reg =3D <1>;
> > +                    csi0_out: endpoint {
> > +                        remote-endpoint =3D <&video0_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 46126ce2f968..e4634a0aad74 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25979,6 +25979,13 @@ F:
> 	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
> >  F:	drivers/media/i2c/tc358743*
> >  F:	include/media/i2c/tc358743.h
> >
> > +TOSHIBA VISCONTI VIIF DRIVER
> > +M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> > +M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:
> 	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.ya
> ml
> > +
> >  TOSHIBA WMI HOTKEYS DRIVER
> >  M:	Azael Avalos <coproscefalo@gmail.com>
> >  L:	platform-driver-x86@vger.kernel.org
> >
> > --
> > 2.34.1
> >
> >

Regards,

Yuji Ishikawa


