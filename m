Return-Path: <linux-media+bounces-20379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779B9B241F
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 06:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8122D1F21526
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 05:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22DA18C911;
	Mon, 28 Oct 2024 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bcCU8dpd";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="inny4BeE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EF170A14;
	Mon, 28 Oct 2024 05:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093157; cv=fail; b=T5LM69jqMQQSJlR2XJa0ryK59r6RqaZDzEV92sCPsA76aWr+GGYRIWrmjsjwWHNjpJiZD+2rsYA81oUBq6mmzRCp5LXAuWaN8rOvf0Feudydm0IpM9uAV2HC4pZG8anxPMcBkNtgUvOBFflXzSj7nXFyjxv5Mv1u3kGU9Wel6eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093157; c=relaxed/simple;
	bh=VTr10uYgFguXGzgawNSgAycW0bOcEzhzqKqPImrOmXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L2ERjht7t4OXIHjKbccQfx8v8oncd7peykS+PVpYkCgwtFsLNweilBOcjKyFU0v1Kd7gTaCpQY7VsofnuHp2gZcltoEGyATxUZ55UVuw1meWAPJXzwGH4uvePcRx+Sp/hA5vq9GFWMhOQ0PGgSfM3BlWDBlcTlEiSfKrTsaOBv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bcCU8dpd; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=inny4BeE; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 177ad7f094ed11efbd192953cf12861f-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VTr10uYgFguXGzgawNSgAycW0bOcEzhzqKqPImrOmXo=;
	b=bcCU8dpdpzajBUEYS4TQpbqfRh3R5vZWF1Vt046NA1+L9shgLoG1TZW7EI8tm4TCL7UUOGM2+OUn2T82CZ0R0JBkqBGU2fhpNPYwiRr4wISF/nYZD845zrHkSByLCEqnsWMKbQwIAVVJVUu6FMHsus2hFkdXj6byKdrHR/7uMsQ=;
X-CID-CACHE: Type:Local,Time:202410281320+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:16d739f4-71e7-4b45-98e2-8a227fb7be9e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9850342e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 177ad7f094ed11efbd192953cf12861f-20241028
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 537191637; Mon, 28 Oct 2024 13:25:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 13:25:48 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 13:25:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C85UJZGHccUbAvOuJUFnd05YY+hVEXvAbmS42uABxnM4eEhoC4JPOO/MDuVsqukufa2Ioie+rljqU7RkN5fDhM8ihrZUlE3usm90Vx0Q6SUACswWSLP4k0zordFIQSGB8bSCpkV/hOm/A42u+GtBUZRtTjp3yHdoT+AQPXyjGfdXq9+xtW93UmJUbn5m5Lb/U2EO29zYErdX/UEPzMN+mRA44O5sCbCrCXftVpzk3NDghBh5gAv9nGny5qZb66nWR5yi5kRHv5+yQOzuAOJkKc1ELElPmfaql6VzcG4qkoh+Nj62qNjIKH7HkqxPLzRjmEIqCPUOJc5YYqueWNdFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTr10uYgFguXGzgawNSgAycW0bOcEzhzqKqPImrOmXo=;
 b=u52L+/VZG+EYuyJ4ABpLhaBrEzsB58ax4F4A2mX+jOxc7naf0/KUH5A7DqXZgxGf0US7Xh/ara3un2I1Wqtxoip9//NybQPRYSnaXCGr2hsKyLUWhgupYqt6tJzAzaVszmKTJrtfPaoZeRv+0Q129l+tZtzq5Q7KfEz57PCW6nMwNZcdj0DtFhg69zQyRW1jvWbUCnUMZzqfKOfGNYDGABsN6ZBCrvLZvX1goR6yS4A4PI+Hd4rkB3JJJomfpmhZuJfT6JhiQ5rt075m/8mGpLkwKkAt1QhJ8V9+N/AFGEago5IrxgOj//EClRjaRpnNLxaH1v9GZCi6WJvNfflAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTr10uYgFguXGzgawNSgAycW0bOcEzhzqKqPImrOmXo=;
 b=inny4BeEi61/Zq0RZg93Dwa11J1lsrlG1ninpVcz1rmFZWAjgniLdjwFRpOBvK+5xHdJjuf2uLkepT4YsP8Q5/kWZH/iRKji+LKD3/4Xo/Z9jnSp3DSe9SxZjssLQKy4ooxT6bSINeUEo22TFHr9AS/17j7CmreDRug/G7R4M3c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8158.apcprd03.prod.outlook.com (2603:1096:400:471::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 05:25:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 05:25:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Thread-Topic: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state
 ctrl
Thread-Index: AQHbGj2y1UKRq3h+wU6S0U6tpTQ9lbKbvcmAgAABZoA=
Date: Mon, 28 Oct 2024 05:25:43 +0000
Message-ID: <6ebd023637e80bf24662975b61cd37077a251797.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
	 <1e6d50edc8c14313cdf2bd1b9d33e94e88ed2770.camel@mediatek.com>
In-Reply-To: <1e6d50edc8c14313cdf2bd1b9d33e94e88ed2770.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8158:EE_
x-ms-office365-filtering-correlation-id: 3fb61f1d-d3f0-4dcf-d01d-08dcf710f836
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eWhEMnZJRlZmZDZXR1dlMmVQSWNPSHdIK2dEN3NrQ0tkZjVLaS9xVUdJeW9G?=
 =?utf-8?B?ZGZnalBEYVFHSGRYellEV0VEeUsrVG1lVDBLVFhNcGJRcFBZM2JsbFBtQ2x5?=
 =?utf-8?B?L1c3aDNWUGZnV3FFUTIvVENrWEMyNXVRVnRIK2R6NEVGNmc2WjdPZmZKSlVK?=
 =?utf-8?B?YXREQWRWbUY5Tk42MkNFdDh2TS93ZkZ6TFBUelMzVkV6TTVEdHRpaHVIMHpZ?=
 =?utf-8?B?RUNIUEs1WGNFdG5xa1UyU2QweThaY2hoVDg1YWk0UEZuV0dnalJwVGNuYWRw?=
 =?utf-8?B?TFVuSWNxcElmdjlVNk1OeUJ1TnpPbzdEdURwMFExYzQ0bFZsTWh1TkVvcFZ1?=
 =?utf-8?B?WkhDUUhwcmxtR1BnNWtTYVdOR1FXbTJsblVybFQ3K0tIS0RGS2JvQ2NLdEtm?=
 =?utf-8?B?elpxeCtIbCtLN0IwTmpId0ZiMStmc2k2RCtxcTNXWldYdWtPazEvRFVlTUxG?=
 =?utf-8?B?Q2dTK056VCtsQldZTVlaUmZERVd3MVFIb1h5SjhEczQ5S1Y5Sy9Nek8vRFFJ?=
 =?utf-8?B?YkpOMUpRWlJZVi8rUDZ3VDBWcnc3R2dFZ1NhWlpVQ3NjNXgwbisycFBtN1NE?=
 =?utf-8?B?RzkyRmtXZkl3Z3dTeFJudnZjaGg1LzRiWVoxR3d5Z2xJUEM4QUtUbjdrcVJl?=
 =?utf-8?B?N1lQdm5vc3VWNzhuSkRHUU05WE5EVFB5dWdEanJnOUJrdlRRaW1DQlJXOGtB?=
 =?utf-8?B?ZGgwdnJnVm4zOUtYUWprQlkrYklLbS81WmlONDNsVkVJVU9ERjk2UHVnelcx?=
 =?utf-8?B?UnFrZ0hFMXBKYmZqRUJsUlJDdWxTZ2xpTHF0MnZJYzgwSTJNMkFPLzkvV2tR?=
 =?utf-8?B?dXNIdm16TitwVFgwQ3FnNXhkODVNNU9SNGd6bmtEUDQzaFBTeGxjd091QTVx?=
 =?utf-8?B?ZENJSHVRdjZkK1BPcjhHQUZERkFKaW85VUpPVFJvNVhrTWt6c28vTUlhaWpx?=
 =?utf-8?B?RXpqQ3VSTVRtaks5V0RTZ2hSYko2M0x2N3ZySFBtZ2NZcyt3S2VnMGFINWRR?=
 =?utf-8?B?dUEvbUp5am9UdUdpZnRrME9URUE2cnVWQlk5bHF2N0VIWUV3Z2M0MHlXb0do?=
 =?utf-8?B?cHJnK1NEaExCaytPTWhpZEgxRmFNTVVuWW03OXVra0pteEJiYkZTREpSZk0y?=
 =?utf-8?B?QzdmTGM2L0VBUVBEczF4TFVjMFIvZ0Q1eXIyUmlNYkZPRUxQbHRFRTBEdTZh?=
 =?utf-8?B?dlVUd2tJSkoySHVWbXBRaEFwYkl6SzdFMU1iU3NoNkIrd2s0NFlRU2Q1Q1Bn?=
 =?utf-8?B?N0hPc05pZjBZWlM0RDUzbFNqMzRGc1dPcTdWeUZSVVFtZFFaSlE0YmNpMnBm?=
 =?utf-8?B?aUwySzBPMUsreWVLSFYrZjVrazlrNWVVMU1sMlp1YzB0NUdNSU9hbU9Tb1hB?=
 =?utf-8?B?OS9GUjliTEdNcHFIRVdCMll6eFVPSUZpYkYyWm9Jb2hzQ2dodlpoWm1NeFpw?=
 =?utf-8?B?Q2xwNXFOd1VEYzhvVWxROTc5eS9UeHdWSDBrNzNMNVI2MUxBTGdMeUxIamJH?=
 =?utf-8?B?bUx4eFhka1RMSkhZUkNidERwQkU1Q0R0VUNCUkc5alNBRURvcVA1RmYxUlYw?=
 =?utf-8?B?VEp3N3lHd2M2bWw0VEwzSkpLaVl4MG9MZzE1QW1EallKNnBTb09kSjh3YlZn?=
 =?utf-8?B?NDBydmtqRUxPYVUvYm9yUUhDUlNYeURRNk8weG9qTlFvTFFCUlRKUEEwTXZX?=
 =?utf-8?B?ZkFld1pTc05uNllWWjV0Z0JmMndtb3dQSzdwWmpkUmdkbGtNRHVmeVFDa212?=
 =?utf-8?B?NHcrbmh2SXdycVRYdHpRSjlYSGJHSkUvV2JWUVJuN0w4U0l6d1MxQ1dtcEZR?=
 =?utf-8?Q?0ft1jRZ4gRO9UAmSaw+VQnb8I+nuTh7B55knY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2Z0VU81SzREZjIzKytwbjhvRnUyNFdvNnJCT0V1aG1OZWUzVzNNTnBmYkds?=
 =?utf-8?B?NnREajk0eXJaSU1jYzFOY24vV2JlYkl2TGRGbk5UdnQ4MURNbkhQMFhPbDRB?=
 =?utf-8?B?OFBMTVdhbUFSWEU4UW43d0dsZXdEa2s0MnY4eHhmTFM4RXF1UDhONlJvTTRw?=
 =?utf-8?B?L3lJcm9XbDBEQ0lKd1BTcm01YjhTU05Xdjk4c3VZMm9yRGFyNVJSOWFBWHcx?=
 =?utf-8?B?dnFGQllrbldUREpMTFlVTjdrNnRjSWp2ODdwMHkyTFQwZ1hyQnU1UkltTjhB?=
 =?utf-8?B?eWU0OXJlZTczWTR1UjFEdU5MeGNxVU9sc0l4Sm0yRE5ZM0NhZVV1eGpZZVc2?=
 =?utf-8?B?UnhsSUlLK1c4dUxoZGpVRDhtcFJuWjVxSk9ubEoveE1zeUpNUE5xcW9JaDR6?=
 =?utf-8?B?SjdxM3FwbXFvNjlNMngvTlV4Y0d4Q0x0Q1dMdHBNcUh1SDNGbHFrZWRwSXgy?=
 =?utf-8?B?cjlrTnBUUmhPQm83a2ZKZW0xNThablpwT1cvZXg4Y0UyaHFnZ0JzSHJtT0ZZ?=
 =?utf-8?B?eDZJR1RqVkJMZ0NybEFIeittZ0MwZENPakNEV1l3TU5kbGN6VEFlTXcyWkdI?=
 =?utf-8?B?TG1EUlZWN2x6QWdqYmE3a3pzVkVzcFBRUThaVG1jZkdnNGhDRS9wODQ2SERK?=
 =?utf-8?B?Zkl6VDBoRDBBa1JkVVpNckQrLzkyV2NmR3AreGladjZmcTNlOUJwT3E2WEdm?=
 =?utf-8?B?dG9NOVpacVNQcXFwWjdwVEx2LzVIVHAwV3FuTmlsUXZaSjdlNWJoMnhwTGls?=
 =?utf-8?B?T2Q0a1lEM1ZLUGgzblg0Q1hMNWlhOHVrTm9PdndnR0VlR0VhK0NhdFNOMXo5?=
 =?utf-8?B?azVGZk5ObHpyNStWNVMvUTdncGZnNk5KdldlUHZkUVVvV25PT3JNTGpxSXNo?=
 =?utf-8?B?UzJoeGJveGxIMjFvd2JMUUdLT2RGSjNmdzlyRGthNXV1dXFvY0NraklQUklF?=
 =?utf-8?B?cG1XdGtyKzlJblZoMldJSFlxdlF2dWFzNlVRZGVNRWhlcklCbnQvdXdKS21O?=
 =?utf-8?B?SVpqYnNtK3F5L2dKZTZPYklxSmhFRmIydVh1QU53c05iV28xK0ZtM1kyNjJp?=
 =?utf-8?B?cGhFZi9seitybWZoVkQyNXEvbFJzNEVwNHRqdXZ3bm5qMm5pNWJuQ0xGdTdi?=
 =?utf-8?B?Z1ZNbEZYVDV5UlR6Z2syaXZCdzdpRkVDQ3pCeS9lZzdQK2w5RDR2SWVGRmJZ?=
 =?utf-8?B?Tlo5Q1lHWjQzUmg0S28wVTBKaXF0U3NrN1RjK09iaHZyY3Z5SGhFKzRuYU03?=
 =?utf-8?B?dk9ZMG5pU2N4QzBsMGtuZ2c5enZacnRVY3J1RkZoT0xKK2txdEl4S2lIQklV?=
 =?utf-8?B?dmQydWFwVHZseDJpRzJqNjdHcUtUUlM3WTJJN2ZYemNNRHZUU3lWck95amhz?=
 =?utf-8?B?cjZhQ1J6aUV0YzZ4eWNneTNrZCtVRk4za0t3NmV3SnI4MmpXQ0FNamxJbys2?=
 =?utf-8?B?ZHUralgyQkxCUnFhak9wcEtkaDB2T1VyODFtZzRxWmNCQmQvQzlmV2JWdjlO?=
 =?utf-8?B?UnFMeTlEZytZZzh3VnpaaS9hSUFQN3FFRC9qVDBSZlo5QjZ4ZVJkSll5ZDFl?=
 =?utf-8?B?T3h0ZWZTVHhVQm9Ubmo1OXQ3RFQ2SGYvRmlKcjVhMjBiTUdCUWRVTzNJWlhJ?=
 =?utf-8?B?anBJKzdaUGhkeHhVNTJ0MHhnMC9CajdzV3BISFF4RVlNUGpMT0FrSWJpNXlU?=
 =?utf-8?B?WkVuZjYwOC9USzJJWmZ3eGhnQXRFOEI2eTRHakx6dnc5TncxRlFRT0Fua2hL?=
 =?utf-8?B?MlZmbU16K1h3VUFOL2tDYjNZRlBsaVlhWmxMZ0hQWklycGVKYjVuYmhvTjRC?=
 =?utf-8?B?NTl0VFFCdWFFeG83USt1UUdvRmpTdDVxTHNSU2NtRXFJZ1FpSzVMSm1FYTBO?=
 =?utf-8?B?WmE0NmVvR2JJSEhqSVUrNFkxdE9mZkZiNE1IYlRKN3VMcWE4MVR2bGNtNkhT?=
 =?utf-8?B?MDRUbm96U2sweFdQZTZwSFNNZjJRRnUwUldHUS9NOEdTWW5yR0ZQUWl2dmd2?=
 =?utf-8?B?SlJwdld1UkUxMDY4SEora1FNeTFVMkc5eFFpLy84Y0owTlNFSitubzJ5TG5o?=
 =?utf-8?B?TGU2ZUpNZmJmNU1zUkRJdHBCMlJxYVZVZnRyMEhYMDR6b0Nhb3ZQR29Ha3Qw?=
 =?utf-8?B?WXZmVllvM3NYcWtrVHVoUmR6MGgwcW8xT1pzdEU2Y0JPVEc4QXAzV0ZlenA3?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <234C7C009C4B15429E900B8DD53FED2F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb61f1d-d3f0-4dcf-d01d-08dcf710f836
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 05:25:43.5445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUDJ3S7t9GeeiJAyLTbq24ZGCGAO0L6BhKACrqL83oZYvTNIO4q9+IUOiDxhYO8C88amqF1ZSnlqaRmcDzhDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8158
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.736200-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfj4OiVTWoD8RCa1MaKuob8PC/ExpXrHizyX0aNVfPpyq/Ax
	2yQOAW2940NH+QBQ1HKMyv4sRvPuVBFetKpHyMm5z5rIW0RbS5gc5VtPyiEZ4XvsbfoZixUTVSd
	AA6mVeIbMAS+aj7ouPI3/d0NuPcI1QkfxbJAyTm6eAiCmPx4NwMFrpUbb72MU1kTfEkyaZdz6C0
	ePs7A07QKmARN5PTKc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.736200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	03373147F6518987C2EA55CFAEAD4A4B82C312F1B8ACB3EF836462776FDE56292000:8

T24gTW9uLCAyMDI0LTEwLTI4IGF0IDEzOjIwICswODAwLCBDSyBIdSB3cm90ZToNCj4gSGksIFNo
dS1oc2lhbmc6DQo+IA0KPiBPbiBXZWQsIDIwMjQtMTAtMDkgYXQgMTk6MTUgKzA4MDAsIFNodS1o
c2lhbmcgWWFuZyB3cm90ZToNCj4gPiBJbnRyb2R1Y2VzIHN0YXRlIG1hbmFnZW1lbnQgYW5kIGRl
YnVnZ2luZyBtZWNoYW5pc21zIGZvciB0aGUgTWVkaWFUZWsNCj4gPiBJU1A3LnggY2Ftc3lzIHBs
YXRmb3JtLiBTdGF0ZSBtYW5hZ2VtZW50IGVzdGFibGlzaGVzIGNvbnRyb2wgb3ZlciBJU1ANCj4g
PiBvcGVyYXRpb25zIGFuZCBldmVudHMsIGRlZmluaW5nIGRpc3RpbmN0IHN0YXRlcyBmb3IgcmVx
dWVzdCBoYW5kbGluZywNCj4gPiBzZW5zb3IgY29udHJvbCwgYW5kIGZyYW1lIHN5bmNocm9uaXph
dGlvbiwgZW5zdXJpbmcgZXZlbnQgcHJvY2Vzc2luZy4NCj4gPiBUaGUgZGVidWdnaW5nIG1lY2hh
bmlzbSBlbnN1cmVzIHN0YWJsZSBvcGVyYXRpb24gYW5kIHRpbWVseSBkYXRhDQo+ID4gY29sbGVj
dGlvbiBkdXJpbmcgYW5vbWFsaWVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtz
bmlwXQ0KPiANCj4gPiAraW50IG10a19jYW1zeXNfaXNyX2V2ZW50KHN0cnVjdCBtdGtfY2FtX2Rl
dmljZSAqY2FtLA0KPiA+ICsJCQkgZW51bSBNVEtfQ0FNU1lTX0VOR0lORV9UWVBFIGVuZ2luZV90
eXBlLA0KPiA+ICsJCQkgdW5zaWduZWQgaW50IGVuZ2luZV9pZCwNCj4gPiArCQkJIHN0cnVjdCBt
dGtfY2Ftc3lzX2lycV9pbmZvICppcnFfaW5mbykNCj4gPiArew0KPiA+ICsJaW50IHJldCA9IDA7
DQo+ID4gKw0KPiA+ICsJc3dpdGNoIChlbmdpbmVfdHlwZSkgew0KPiA+ICsJY2FzZSBDQU1TWVNf
RU5HSU5FX1JBVzoNCj4gPiArCQlyZXQgPSBtdGtfY2Ftc3lzX2V2ZW50X2hhbmRsZV9yYXcoY2Ft
LCBlbmdpbmVfaWQsIGlycV9pbmZvKTsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2UgQ0FNU1lT
X0VOR0lORV9TRU5JTkY6DQoNCkNBTVNZU19FTkdJTkVfU0VOSU5GIGlzIGFsc28gbmV2ZXIgc2V0
LCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiA+ICsJCWlmIChpcnFfaW5mby0+aXJx
X3R5cGUgJiAoMSA8PCBDQU1TWVNfSVJRX0ZSQU1FX0RST1ApKQ0KPiANCj4gQ0FNU1lTX0lSUV9G
UkFNRV9EUk9QIGlzIG5ldmVyIHNldCwgc28gZHJvcCBpdC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENL
DQo+IA0KPiA+ICsJCQlkZXZfaW5mbyhjYW0tPmRldiwNCj4gPiArCQkJCSAiTVRLX0NBTVNZU19F
TkdJTkVfU0VOSU5GX1RBRyBlbmdpbmU6JWQgdHlwZToweCV4XG4iLA0KPiA+ICsJCQkJIGVuZ2lu
ZV9pZCwgaXJxX2luZm8tPmlycV90eXBlKTsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1bHQ6
DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiAr
fQ0KPiA+ICsNCg==

