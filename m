Return-Path: <linux-media+bounces-20095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C99AC753
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 12:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B393CB251EC
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE4719F114;
	Wed, 23 Oct 2024 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o3vMMRKX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hjTJoP4n"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA219E992;
	Wed, 23 Oct 2024 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677920; cv=fail; b=sR6yEwQyu46PHlA3z4j6H6NFILr9LxoQsocAnXUeZV9ccnSJ9nK0DCwRlKijxP4zI/ub5zaPjdsiQrCluuhSXTBva/qEkCzECR4L2skhRGBLMzOfPMyJJ3endAPpOiRPe2R+yq9qpI7VaWOocgp4xE2u2jlkm4trNhA1Khe9+Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677920; c=relaxed/simple;
	bh=7CP3PMoH+CeH5kFb7m/SKDcBi4HW+MEJ5cmE22qNn9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=izrVkTurd+lU4Ug+ltAVEI4l80OJOSMa3jqiqDUHFwg9QQ6QzusIxE+7GL/zXXuut6WocxmDZemsg4j0eECSKyhOk/tzWuvLy5Z59s3InqeIH87euBfU2H0Ti9PlIQd/iTM9TZeS91Z8J2dyWrmufpQlRSlTB6LtTxctaHLl1Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=o3vMMRKX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=hjTJoP4n; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4b4a1304912611efb88477ffae1fc7a5-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7CP3PMoH+CeH5kFb7m/SKDcBi4HW+MEJ5cmE22qNn9g=;
	b=o3vMMRKX582Mn9yZct3eIJCGWYWtItcpPGXz6Yvq7FmFp13SyIimzVesvL5VG4OWCJfV2yPsw8WqFYpoU26srPvt9y+I0RaX/Ugn0xebyR/kEL4eJ/szZuGbkZRg5wW7gEXGvj6tqKMMC7d7uanm24tqE6zKuFEZ4rt/7D4xud4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:8aa2e3ab-86eb-42bc-bff9-ee55b43f2e97,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c094fc2d-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4b4a1304912611efb88477ffae1fc7a5-20241023
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 408080643; Wed, 23 Oct 2024 18:05:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 18:05:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 18:05:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbcGuapQAGwq/9mFi2Dpux/Jz0Imx4BMK0j2uj0ke87FZ5xZ1m/c34koAcBanxHbGO/87JUru2v1ARLdVGXHIofIm0ilrs3kr6DZgGL0MWJ0xLIwxIvWan3m+6mNnR6zIpwesjwAa5B0hglrXfi1mV+BEJLmOgKzMsB4nTij28ES30d1HKXTYHau/5ypMEUk9eWTCLMMAauvqGFUw3hHcavioXvl2Mk2lgDC+ImbtOFW4DO/vpAtx6IHltsADNwC/GSJzpQzXtkEX6XgBqT/oT3y+zAXu+eDwAac6Pj/al4LQW+Vig3p/GD+x6BFVc3qO3c7KZ1v+7gzufwD2VJM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CP3PMoH+CeH5kFb7m/SKDcBi4HW+MEJ5cmE22qNn9g=;
 b=d0waZ3kbhEzkcyOKi2z1TnHODq9GFkd2coZrYKclpSu5/5wJMhpWhKLS7teoau6u/Ug6+AxDZLW4RHA2RvrDh57Sy6/MOAJBH44wpEaEsz8v1MJTYwvfetwMV24Ynue2uBT4wYRgjTBvOw7VGWHHLx6pBB51Kp5plMVVib0v8VDXbdfZOtuTOUeEhohRhLRJ3UOWtAOlcvfmhdxE9ZcwlH9hXMTxBENrkmSh6fWbVnRTQa6+PxmSoU9qmuElTReIFdb5LAihxOFOaQrv0QVDxvD3wVbU5vmRooU/WdZA/fhhILWu2velJYFLSQxOfg8rppr2igLXK3vpvC//+MFRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CP3PMoH+CeH5kFb7m/SKDcBi4HW+MEJ5cmE22qNn9g=;
 b=hjTJoP4nWmJVVgjnEAcPPSDhsW5ShRnzu7qEaKUt78MYBPMAjcX3j46MehlqHOuWOrj3PI6rYAZ3M6ng/7/urR+3hAMhz5wWSDLp2KfdbrtaejYdzUMosDRVC/UT01ELgv61BeAlQqbjR8BDoDA6kfxPFV1Hdxawgwlef9BJc+U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7064.apcprd03.prod.outlook.com (2603:1096:301:11f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 10:05:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 10:05:06 +0000
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
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KUMZWA
Date: Wed, 23 Oct 2024 10:05:06 +0000
Message-ID: <80f8123a12fe7706be226dc1831cf929bcd78bef.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7064:EE_
x-ms-office365-filtering-correlation-id: 388cb219-a177-425c-21a9-08dcf34a2bc9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QlNWZzN4dFZlczlCeWdQZWdPaWhqd1VqZ0lnWTJ4Vjdja3Ztc29OTVVPMzYy?=
 =?utf-8?B?cHJxc2EzUXQ5NUVXbEZwZEx2WFlVVWM3Z0JZWDBKeEVPZXBQQXpiZWxRSVRN?=
 =?utf-8?B?cHlwVEdSZFpTaW14NU1OemdTbHV2TzlRTk9qZnNxY1dwWE8rbTBJTlhtaEhp?=
 =?utf-8?B?WS9qUzNRR3E2cEc4bk5sY3cxQ0l3aDB3TlNVeFExQklocVVzZjBGWDdKNGFN?=
 =?utf-8?B?THFZWnFUaTFkVUFnQ2ZhaUp4Sks4dy9td1BPUW0wWnIzdDNHcit4RTN5MitH?=
 =?utf-8?B?ZmUzaTR3cDRnL0FOWlo2akY5ZVJLdXN3aFlNMXNudCtTYXNLY1F4Yk1zOWcz?=
 =?utf-8?B?WnJIaHBJS3dZTXI2ZURiK0phYW1pUHJ6Zk5McVV6eVQvcmtNcjVHa2E2eHh1?=
 =?utf-8?B?MU9UNStqSVp1NjZwc2FrN0plaXBlOHFKYW40Ykxya0VCc2VhdVRXOHhoZFFm?=
 =?utf-8?B?bXFyNEgwK3YxRTg1V1ZJWWRDaXljaFhyS3g4VmdRR2RkbW1Ua1M0UUxBWjls?=
 =?utf-8?B?RkM3dUVqQ21aMUhZcWxDWHh5OWZJd3p6UktiYVFybUhtY2pSS2JIYnZTWlRC?=
 =?utf-8?B?VTZ1UnUrdXdFdlhvK3ljWUJxUStUSVgrMWN3c3dZeEFBajRMaXllUVNDek1Y?=
 =?utf-8?B?My9Ob2hIZ2NhYkZnOHZYWWtTMUNBNHNhV0VjWERPWFdnczRoa0NRTDd4UXN4?=
 =?utf-8?B?OHVpSUZ0Z252TE55MFg2NW8xVXlsL3p0VUR6RjB2QTBTaC80dmdIa3kwdWha?=
 =?utf-8?B?M3lFU2RuMFg1amdZanUxckpwUUpMcjlVYmRJeTFLS3pqZWI4UW5ZdEV1Z2VI?=
 =?utf-8?B?dTEzd0wyNnpNeVA2d3ZHZnRFcXd1emI5U2xXWnZqaVo4OWRTZ2JaNnBhZ0Nz?=
 =?utf-8?B?L0JjTkF6UlRuRGptUm5GZ0xPVnF5R1lGRmxrdzhCOFdCUDk1cXJhVjFnSk1k?=
 =?utf-8?B?NnMxc0hYZjZVc1BSM2NUdHFTOWh5UGNtRzA2UmdDZWZycW5oYkJENmk3NTNR?=
 =?utf-8?B?ZWlJLzg2b2dnd01xWDlkbFJ4WFBHb2h0UUFCRUdWZ0ttUWVPK01GcWdyQUZE?=
 =?utf-8?B?M3BwTFFxMXNSb1BSWGtHQlRsNHI3N1laeUU2VWNJQnJDRWVFL09jUVJuN1Fz?=
 =?utf-8?B?VnZORWNUeE5WWG1IMFdrM3JOcVFvNFk4bU45UFpmVGRHZjltU2JHQzYyUzBK?=
 =?utf-8?B?N21pMHhzdkVNam9DalhpNVlMVlR4NjNjaXBTUzJFT3lDeXlPM1E3VGtRdG4r?=
 =?utf-8?B?aWV3Rk44SWtGRTl1TWZueHZmc2o5T0ExaTJJVUFTMG5xNncrd0gxOC9GQWdC?=
 =?utf-8?B?ZHcyT3kwbE1kQ01scTIzRlBkaTVpdUYvbFJrQjNyeW9PYmJ4S3hnQ0JKRTVq?=
 =?utf-8?B?SnN6WUdCZzQrWHpmd0J4WFg0U0VYZWZabFozYkZxWUZMU3NGdFd6eVRwZSsw?=
 =?utf-8?B?OGhnWHRmUGd2S3k2Q2F4MEt5aEl6SDhGUkxmY0tNUHcvTCtyaDlRbTR5WUE5?=
 =?utf-8?B?TkN4WGFDTk9palJsajdrbWc0NlhSUWN6dVo0YjF1TTBkWnl2ZlF5QlBrd2JE?=
 =?utf-8?B?aFJBRW1GL1pXeHRSa1hsbWZNRFUxOEIyZGxBT0J3TzQwN1R6K2FTWDNPWWVj?=
 =?utf-8?B?a1A1SlRSWEFiUDc1T2lPYTdMU2czeE11ZGo1YUpHYWViU090R2NIakZXR2dT?=
 =?utf-8?B?ZHZNUnJxdXJ2bmhoNnZSVkdNK1lYdGpDTlR3clI4K3E1cktiYnJwRGRmN3RG?=
 =?utf-8?B?QlZZOC9vMnhWejh6Yzlnams2dm42dzF0SXZUQmlBdGVHWTlxdXVkOVNObTZp?=
 =?utf-8?Q?5+rLs0pLweiGrCbKYBCaxQKgzDIbsMRZbbp6o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SE9MMVRzRlJLQ0pROE5xK215SEtDclJpa25HY1FYSUVKSVRxelFCZXE4emo0?=
 =?utf-8?B?WTlDOWdBSUYzR0J4Y2JuL21ZNGY5VEZkZzVmTytzdUNtbFBZbGJCakgyczJC?=
 =?utf-8?B?WEtVRUkvaW5Fd2lyaEo0OHJDbVQwaWNvZC9GdENKRTJvaDgvVWZnUEM2UEMy?=
 =?utf-8?B?SEIvSlFUdlRDM2tWMXllUDEwQTNnbFdxZnFKQk5lSmlNRDVEeWwxTTBwejB3?=
 =?utf-8?B?S2RyRHc5alNYWndsNFF2bER3dXM4bC9Xa2dnQXN6dVIvTkpLdHQ1SDFOWDZB?=
 =?utf-8?B?S0ErVEVXcTNremhaZldCY2UrUmZTTHFFbi8yeFNiVytUeElHUFRybEhoWFFy?=
 =?utf-8?B?M2MxR3o0UmIrN3kvVFZhV2E3UThKY1dIaHdFYVJMQzhjVUoram9UdmdrK2Yv?=
 =?utf-8?B?ak5NaFl4REx5eEY0Tm1KeTUySzVkYnd2bDBLRUNCNVE4QXR1b3RHSEVsZXda?=
 =?utf-8?B?aDlCR0VaVkVVVE9qd2lDejFYejl1UWs0MWc1b08rdnBXd0ZTblNwWVgzZEY0?=
 =?utf-8?B?OHE0U09RUm1MSEhZRHQ5RStRQnV2QTNzRWVseUJHNTZDVVN2TXJwdElsU1FT?=
 =?utf-8?B?MWZWUGtIczVZWEtIWld4MVpUNlE3T2VTRHBab2V6UFZTVVRKT3JnMFdzNzJG?=
 =?utf-8?B?Yms4ZEFoL0p2Nm0yTUlqODl5ckVnNFhKWjk5VGRZK1lnaGhaakVxVlUvV1ZP?=
 =?utf-8?B?cjc2VWtPUHp1Ylh6bU03bzNHcmlXQzZhRis4amFYU3dMZWpLcVVwNU12Q0xX?=
 =?utf-8?B?RmU2L01aTE0rbllzMGh4K003aGdMVzhyb2IrU2J2SEhTWk1DVjZYN24zVXFK?=
 =?utf-8?B?WmZGMTZsNnZOY3FHWXk1ZjNkeFVWaFAxbDZQWXFCR3QyNStwSFBVWDNyaTlJ?=
 =?utf-8?B?cS9xRDNLQm9vTlpYUVQ5alpOSmpmZ2pQQXVRL3BtUzljM1E3cEJuNnpiL2Vo?=
 =?utf-8?B?QkZLYlViWm5tdVZLTkRsUzFQY0d2N2prUFVMMnhEUFgrV0s5NVZaaDFFVi96?=
 =?utf-8?B?ZHI3Ri9yQ2t0cXZ0WElrRG1xaFJHRndlaXh5cUhZdDd6L1N6cGw0cm11bDZ0?=
 =?utf-8?B?VVA1Wm9IbjNOMG9LSlRzQXFwbFE5UVd6eEpUbXo5clVPOTlQN0FaMFZkSlpW?=
 =?utf-8?B?R2k4U3ovVWtWOGtSOUhzeDdEMElYTTBrYlREQ3JnM1lKRHVPSWZLdGI4cTdL?=
 =?utf-8?B?b1poSk05Z2twUkhvakJySGJObWZack9ENUdUdXRGVkFMZDZIVmNuL1lZQzFP?=
 =?utf-8?B?RDRpSkJEOUFTUGgvSnVpNFdHMXBxYk9HUHpSakxiUGFjOG5UbDY1MC9GTDg3?=
 =?utf-8?B?Z09UbXJodWRuZTM1OXVpUEsxVTluUnVDNUR1L2dtSzVoWnhTc0VRZEpFMGI4?=
 =?utf-8?B?eTlrK2U3bWFPc2dZK0ZhczkvYnppZm5ua2JmTTN2UU1KaWVwT2JDOEFTamc4?=
 =?utf-8?B?VDRUWjZ1R3NrbmFaYzBRVDhQa1R6ZGFTcmJOeFlKdGlJTUhwQjdINlcxQkpw?=
 =?utf-8?B?aTFyOHhleGFsd1dEeFExVXpVclM0U05sS1U5ajNzN0VTdEdoTmdkck5WMisw?=
 =?utf-8?B?L3dtRCtBaFVpUGVibFFORTE4WmluUGV6dHhCOFB3bHRrVlR2NVVpMEhZN3JZ?=
 =?utf-8?B?NmlGOTR4ZlJZZ0orVTBIejd3dUI0SXNvVlBxR1Z2cFcrNEg2amtOYTdVUG4y?=
 =?utf-8?B?eVBPUVI1bVhEZWFRZHRjcE5EdVBZNTVxdXJCdjNxZnlrdnBlNnE5dVlNL21X?=
 =?utf-8?B?QlBIMDFERjdydUtqd3RPajJzaEJ6UUFDcEJ2TkRiNUJON1pDTWtNb3I0MklR?=
 =?utf-8?B?MlpBc0ZZbm8rSVpDeWpiVUpFaEZWWm1VaXdXdWVYNEFlRFhIOEN0REVNWVNq?=
 =?utf-8?B?NVB5VWNsdlV1NHlhNm0vcVNkd1FaNlMrT1ZNZ0c2RXFwSzU3RjA4S3lEdm1E?=
 =?utf-8?B?WDFhb2w3WEFiYk1pRkcyMFFkUUNhL0FFcFVPWVFHTktCdHFkcnRwRktPUnhY?=
 =?utf-8?B?cDloZHVzUHNhcUZhdExwU3Y0VWZ2b1VkMGdrYmRlT2RpVGgwcXcyZTRUU1Nv?=
 =?utf-8?B?U0NkaWxJc0J5cVBIS3dnNnRmM08rN0pnWkl5NGxjUldQdlN6WTdLWGNHN0J5?=
 =?utf-8?Q?coC7O2Cy+R3u/oJBrNtE93e0q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F069CF83C3880B4891732863C5A927EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388cb219-a177-425c-21a9-08dcf34a2bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 10:05:06.7094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TInlXLLb6wbSKdRX/ZxkKQGlRYatetchjW4sVrpj8aMVKtIi5TTyRPAcWeaxXI9wq1zBm4WvbJXMqgodDxJZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7064
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.255600-8.000000
X-TMASE-MatchedRID: y/2oPz6gbvhm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYCQ5
	BpELg58DN51S4DAAHl+b/PTCT63STGA2IAXETeuKFYJUGv4DL3wK3iJpXUOQQxxeYFneYjlJ8ha
	W4U9IrFqlE62ViDHLlQYbMgkmYjtxmHQ8ODC8xraEJ5wBUYI5/REIZi0sLLpqBlt4RZwvTdWqj6
	Modxfe+CGNoqhINUJ6pJ+tbbRqiA2tGUuyWCB/Kodlc1JaOB1T8x+JsCOVqinzYcyIF7RSVeYHE
	PaPco6b24H8UfXjxqxQyhyHXnUlvxgHZ8655DOP0gVVXNgaM0pZDL1gLmoa/PoA9r2LThYYKrau
	Xd3MZDXs6TDoV9zlzyuB+YUUj7h/UKFS632yi9xCetV2/o64ZEtd0Ds4ObK0
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.255600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	BDC9D5AB1189E5835B9DADB65D6509734E96CE92EC729BD623EBD16F15A771EA2000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50
IG10a19jYW1fcmF3X3RyeV9yZXNfY3RybChzdHJ1Y3QgbXRrX3Jhd19waXBlbGluZSAqcGlwZWxp
bmUsDQo+ICsJCQkJICAgIHN0cnVjdCBtdGtfY2FtX3Jlc291cmNlICpyZXNfdXNlciwNCj4gKwkJ
CQkgICAgc3RydWN0IG10a19jYW1fcmVzb3VyY2VfY29uZmlnICpyZXNfY2ZnLA0KPiArCQkJCSAg
ICBzdHJ1Y3QgdjRsMl9tYnVzX2ZyYW1lZm10ICpzaW5rX2ZtdCkNCj4gK3sNCj4gKwlzNjQgcHJh
dGUgPSAwOw0KPiArCWludCB3aWR0aCwgaGVpZ2h0Ow0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9
IHBpcGVsaW5lLT5yYXctPmRldnNbcGlwZWxpbmUtPmlkXTsNCj4gKw0KPiArCXJlc19jZmctPmJp
bl9saW1pdCA9IHJlc191c2VyLT5yYXdfcmVzLmJpbjsgLyogMTogZm9yY2UgYmluIG9uICovDQo+
ICsJcmVzX2NmZy0+ZnJ6X2xpbWl0ID0gMDsNCj4gKwlyZXNfY2ZnLT5od25fbGltaXRfbWF4ID0g
cmVzX3VzZXItPnJhd19yZXMucmF3X21heDsNCj4gKwlyZXNfY2ZnLT5od25fbGltaXRfbWluID0g
cmVzX3VzZXItPnJhd19yZXMucmF3X21pbjsNCj4gKwlyZXNfY2ZnLT5oYmxhbmsgPSByZXNfdXNl
ci0+c2Vuc29yX3Jlcy5oYmxhbms7DQo+ICsJcmVzX2NmZy0+dmJsYW5rID0gcmVzX3VzZXItPnNl
bnNvcl9yZXMudmJsYW5rOw0KPiArCXJlc19jZmctPnNlbnNvcl9waXhlbF9yYXRlID0gcmVzX3Vz
ZXItPnNlbnNvcl9yZXMucGl4ZWxfcmF0ZTsNCj4gKwlyZXNfY2ZnLT5yZXNfcGxhbiA9IHJlc191
c2VyLT5yYXdfcmVzLnN0cmF0ZWd5Ow0KPiArCXJlc19jZmctPnJhd19mZWF0dXJlID0gcmVzX3Vz
ZXItPnJhd19yZXMuZmVhdHVyZTsNCj4gKwlyZXNfY2ZnLT5yYXdfcGF0aCA9IHJlc191c2VyLT5y
YXdfcmVzLnBhdGhfc2VsOw0KPiArDQo+ICsJaWYgKHJlc191c2VyLT5zZW5zb3JfcmVzLmN1c3Rf
cGl4ZWxfcmF0ZSkNCj4gKwkJcHJhdGUgPSByZXNfdXNlci0+c2Vuc29yX3Jlcy5jdXN0X3BpeGVs
X3JhdGU7DQo+ICsJZWxzZSBpZiAobXRrX2NhbV9mZWF0dXJlX2lzX3B1cmVfbTJtKHJlc19jZmct
PnJhd19mZWF0dXJlKSkNCj4gKwkJcHJhdGUgPSBtdGtfY2FtX2NhbGNfcHVyZV9tMm1fcGl4ZWxy
YXRlKHNpbmtfZm10LT53aWR0aCwNCj4gKwkJCQkJCQlzaW5rX2ZtdC0+aGVpZ2h0LA0KPiArCQkJ
CQkJCSZyZXNfY2ZnLT5pbnRlcnZhbCk7DQo+ICsJZWxzZQ0KPiArCQlwcmF0ZSA9IG10a19jYW1f
c2VuaW5mX2NhbGNfcGl4ZWxyYXRlKHBpcGVsaW5lLT5yYXctPmNhbV9kZXYsDQo+ICsJCQkJCQkg
ICAgICBzaW5rX2ZtdC0+d2lkdGgsDQo+ICsJCQkJCQkgICAgICBzaW5rX2ZtdC0+aGVpZ2h0LA0K
PiArCQkJCQkJICAgICAgcmVzX3VzZXItPnNlbnNvcl9yZXMuaGJsYW5rLA0KPiArCQkJCQkJICAg
ICAgcmVzX3VzZXItPnNlbnNvcl9yZXMudmJsYW5rLA0KPiArCQkJCQkJICAgICAgcmVzX3VzZXIt
PnNlbnNvcl9yZXMuaW50ZXJ2YWwuZGVub21pbmF0b3IsDQo+ICsJCQkJCQkgICAgICByZXNfdXNl
ci0+c2Vuc29yX3Jlcy5pbnRlcnZhbC5udW1lcmF0b3IsDQo+ICsJCQkJCQkgICAgICByZXNfdXNl
ci0+c2Vuc29yX3Jlcy5waXhlbF9yYXRlKTsNCj4gKw0KPiArCW10a19jYW1fcmF3X3Jlc291cmNl
X2NhbGMoZGV2X2dldF9kcnZkYXRhKHBpcGVsaW5lLT5yYXctPmNhbV9kZXYpLA0KPiArCQkJCSAg
cmVzX2NmZywgcHJhdGUsIHJlc19jZmctPnJlc19wbGFuLA0KPiArCQkJCSAgc2lua19mbXQtPndp
ZHRoLCBzaW5rX2ZtdC0+aGVpZ2h0LA0KPiArCQkJCSAgJndpZHRoLCAmaGVpZ2h0KTsNCg0KSWYg
dGhlIGJhc2ljIGZ1bmN0aW9uIHN1cHBvcnQgb25seSBpbWdvIHVucHJvY2Vzc2VkLCBkb2VzIHRo
ZSB1bnByb2Nlc3NlZCBwYXRoIGltcGx5IHRoZSByZXNvdXJjZSBjb3VsZCBiZSBmaXhlZD8NCkkg
bWVhbiBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gY2FsY3VsYXRlIHJlc291cmNlIHdoZW4gaW1nbyB1
bnByb2Nlc3NlZCBwYXRoLg0KSWYgc28sIHJlbW92ZSByZXNvdXJjZSBjYWxjdWxhdGlvbiByZWxh
dGVkIGNvZGUgaW4gdGhpcyBiYXNpYyBwYXRjaCBhbmQgYWRkIGl0IGJhY2sgaW4gYWR2YW5jZSBm
dW5jdGlvbiBwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiArCWlmIChyZXNfdXNlci0+
cmF3X3Jlcy5iaW4gJiYgIXJlc19jZmctPmJpbl9lbmFibGUpIHsNCj4gKwkJZGV2X2VycihkZXYs
DQo+ICsJCQkiJXM6cGlwZSglZCk6IHJlcyBjYWxjIGZhaWxlZCBvbiBmb3VyY2UgYmluOiB1c2Vy
KCVkKS9iaW5fZW5hYmxlKCVkKVxuIiwNCj4gKwkJCV9fZnVuY19fLCBwaXBlbGluZS0+aWQsCXJl
c191c2VyLT5yYXdfcmVzLmJpbiwNCj4gKwkJCXJlc19jZmctPmJpbl9lbmFibGUpOw0KPiArCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAocmVzX2NmZy0+cmF3X251bV91c2Vk
ID4gcmVzX3VzZXItPnJhd19yZXMucmF3X21heCB8fA0KPiArCSAgICByZXNfY2ZnLT5yYXdfbnVt
X3VzZWQgPCByZXNfdXNlci0+cmF3X3Jlcy5yYXdfbWluKSB7DQo+ICsJCWRldl9lcnIoZGV2LA0K
PiArCQkJIiVzOnBpcGUoJWQpOiByZXMgY2FsYyBmYWlsZWQgb24gcmF3IHVzZWQ6IHVzZXIoJWQv
JWQpL3Jhd19udW1fdXNlZCglZClcbiIsDQo+ICsJCQlfX2Z1bmNfXywgcGlwZWxpbmUtPmlkLCBy
ZXNfdXNlci0+cmF3X3Jlcy5yYXdfbWF4LA0KPiArCQkJcmVzX3VzZXItPnJhd19yZXMucmF3X21p
biwgcmVzX2NmZy0+cmF3X251bV91c2VkKTsNCj4gKwl9DQo+ICsNCj4gKwlyZXNfdXNlci0+cmF3
X3Jlcy5waXhlbF9tb2RlID0gcmVzX2NmZy0+dGdvX3B4bF9tb2RlOw0KPiArCXJlc191c2VyLT5y
YXdfcmVzLnJhd191c2VkID0gcmVzX2NmZy0+cmF3X251bV91c2VkOw0KPiArCWlmIChyZXNfY2Zn
LT5iaW5fbGltaXQgPT0gQklOX0FVVE8pDQo+ICsJCXJlc191c2VyLT5yYXdfcmVzLmJpbiA9IHJl
c19jZmctPmJpbl9lbmFibGU7DQo+ICsJZWxzZQ0KPiArCQlyZXNfdXNlci0+cmF3X3Jlcy5iaW4g
PSByZXNfY2ZnLT5iaW5fbGltaXQ7DQo+ICsNCj4gKwlkZXZfaW5mbyhkZXYsDQo+ICsJCSAiJXM6
cGlwZSglZCk6IHJlcyBjYWxjIHJlc3VsdDogcmF3X3VzZWQoJWQpL2JpbiglZCkvcGl4ZWxtb2Rl
KCVkKS9zdHJhdGVneSglZClcbiIsDQo+ICsJCSBfX2Z1bmNfXywgcGlwZWxpbmUtPmlkLCByZXNf
dXNlci0+cmF3X3Jlcy5yYXdfdXNlZCwNCj4gKwkJIHJlc191c2VyLT5yYXdfcmVzLmJpbiwgcmVz
X3VzZXItPnJhd19yZXMucGl4ZWxfbW9kZSwNCj4gKwkJIHJlc191c2VyLT5yYXdfcmVzLnN0cmF0
ZWd5KTsNCj4gKw0KPiArCS8qKg0KPiArCSAqIE90aGVyIG91dHB1dCBub3QgcmV2ZWFsIHRvIHVz
ZXI6DQo+ICsJICogcmVzX2NmZy0+cmVzX3N0cmF0ZWd5W01US19DQU1TWVNfUkVTX1NURVBfTlVN
XTsNCj4gKwkgKiByZXNfY2ZnLT5jbGtfdGFyZ2V0Ow0KPiArCSAqIHJlc19jZmctPmZyel9lbmFi
bGU7DQo+ICsJICogcmVzX2NmZy0+ZnJ6X3JhdGlvOw0KPiArCSAqIHJlc19jZmctPnRnb19weGxf
bW9kZTsNCj4gKwkgKi8NCj4gKwlpZiAod2lkdGggIT0gc2lua19mbXQtPndpZHRoIHx8IGhlaWdo
dCAhPSBzaW5rX2ZtdC0+aGVpZ2h0KSB7DQo+ICsJCWRldl9pbmZvKGRldiwNCj4gKwkJCSAiJXM6
cGlwZSglZCk6IHNpemUgYWRqdXN0IGluZm86IHJhdzogc2luayglZCwlZCkgcmVzOiglZCwlZClc
biIsDQo+ICsJCQlfX2Z1bmNfXywgcGlwZWxpbmUtPmlkLCBzaW5rX2ZtdC0+d2lkdGgsDQo+ICsJ
CQlzaW5rX2ZtdC0+aGVpZ2h0LCB3aWR0aCwgaGVpZ2h0KTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gKw0KDQo=

