Return-Path: <linux-media+bounces-29452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A36A7D3EF
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 08:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 594B1168E16
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 06:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F85224B1A;
	Mon,  7 Apr 2025 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="axzRchQy";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="u5bsS+p0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60715E5C2;
	Mon,  7 Apr 2025 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007088; cv=fail; b=mMwYjEi5fKRCZoNabXgtbyeHoBnagCiTmGZ7DNAdjEdgA6D0Cshxny9ohO0I0/LnKWFodtvo8nZoTrHYbPyP+GkMpXT0NQl70n/M+IBXz8LpvFD2rUXnoLXCpZkPJ/PXl1b84BX9eCyGfRfCObu2fowN6qxLpHqgfHn8M3yx6VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007088; c=relaxed/simple;
	bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kB85HSPn6+KvaVtQhuKYoRX2COTEzNB+qif0PE15nfV6EQ+I4d/H5dQcxEvAfWpyZYisq/59vrqJ15F3vSPp2jDiMWx9oOSwkKdI3u08HiHDDNkz88YOnzeknJlpY+3s+z2uymD948CFgoxgQu2zvqVtnA0y08ooL7CtMYY0P2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=axzRchQy; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=u5bsS+p0; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fb8c732c137811f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
	b=axzRchQyqmTh+fdCfsN7nfuQJqpmlCIKRlVn4lZ9UJ+H0oO883D2oUKg2pmuD+pInvWGvX+kJDSrKWGthWvmHuxqpmgJnUL93g0f3grZ5YBdF0LJZd4ZF8wxveX12ILk0q4IqMOlWF1k20cn6sHDYMioFzdF1YbTKz/c62+G2Io=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:68cf292b-9890-475f-8edb-ac25d7a3f46c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fe67c3a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fb8c732c137811f0aae1fd9735fae912-20250407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 78538384; Mon, 07 Apr 2025 14:24:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 14:24:37 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 14:24:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vna8OJOaUzjxd2tCPky9plrIY5LM34kYF5xfA+Mbm3NMzU6N+66s46ZQTboJQgCfsrS2q9QxMEO8tIuaPyCiRHE63dlNH0d52O6YjTIqvwrycX30bZZ/bOrCAuZFoCLNC2H3sJ2tSLnx1JLycWAlDRyhm8d1HzoZJPpdJ+VZg57uuYVK3SH/GxtVkT1iDkpOwxRF3aksTQJ/N5npkzIoErdFoGiW+r12ovucLe6VeOzROLUIMHIiaWhalM7KvonpXarvBJCh04dH2bwaGLNpwTsj5XTrCt23LupJfW3o1QmBlHDduvASZc8QE3EMmMvq0GQrzYnrmvxiUfCUW8+Ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
 b=uVOoTh4fdiO5ubiK9NtrQYHsbIhbxsy60MWx42tUNSqam1vLBQ11ehIPZ8uMNzVILQHAAOUAzE1v8IEgjwhKbocPaYC7C4zCaXIH8aEch2Fdl8XfHpTyT2u/5FM4zoke08sz0/UTitk4WSFKa5dIa7mQKISdefU7RmoSTxQR6P95Oag0J2seR61BsJpcrOLZSAD+qA7Vri0Zkclg+zN+9TUZ+oMWfnZHD5TwqI7XOAHhw0889YmWCVcTIEIAko8KpvrnX7/w4x/hyJh8wk5a2j8HvAZNofADL1od0tLTrqufIiw+H86E+YoHuKSbhtpDxG+Q8JWIXkri5m5tjy8r6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
 b=u5bsS+p0X/fabuYPgjUC8Ve1Olh7DxHHHk9P5WRnnXqlt39GBBK9EkLwvQuHBkEGKjHnt/px02UgeI+US1dyJ4ARsD7CaHaK1CGXv6aMSwS+41dTJh2Qm7c3sBEDHL5d/uLaoVSmefo8vtaT3cFwgB+m/yjn30CeS9c6ynNM7a0=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB7893.apcprd03.prod.outlook.com (2603:1096:400:452::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 06:24:34 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 06:24:34 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND,V1,01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [RESEND,V1,01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Index: AQHbYv7iZciBiJhPPkyQCCByNSw0trMPn/QAgIilgAA=
Date: Mon, 7 Apr 2025 06:24:34 +0000
Message-ID: <545fcf458d79e1ad1e4a9f1b6b81f32504a6886a.camel@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
	 <20250110012749.30072-2-kyrie.wu@mediatek.com>
	 <e6019aea-b097-4a24-afd2-e1d638a5a8a7@kernel.org>
In-Reply-To: <e6019aea-b097-4a24-afd2-e1d638a5a8a7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB7893:EE_
x-ms-office365-filtering-correlation-id: bccbb55b-e907-4ddc-1449-08dd759cdd1d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OTZGbkFIYWU0ZGxmTERaL1BSVm1lVGxYT3lBemc0TjVpencwUmNGcjF4aWpi?=
 =?utf-8?B?aTkrNUV0clkzTGVMZEpZdWpqYlhOcUd3K0tSOXhVbnJIeTIycFBVb1lHY1hN?=
 =?utf-8?B?Q0dRTlFrU00vdEYwdjFGUVpDRktTNzdyTG41VHoweUhWSGRNem9rUFlQY3Jo?=
 =?utf-8?B?V3NWMFl3OXY2blBwVkZ5T1FBK0drUVZmbWJXYVQ3NVZNcXg2dVRYTXFhVzV2?=
 =?utf-8?B?YVZaSWl1NGJoVHMzL2gyaDlvM05nK1N1Z3MyQk8xZWpjc0Fjb25PdzVncmxm?=
 =?utf-8?B?REdhU1hDc1NobG5uM3JzVDdNbVY2QkJhTkxZZW8vVkNXeWYvYm8xeVpDd0FB?=
 =?utf-8?B?WTQ2RG9MQnNTUzVJYk0xREs4VDh0bFY5eGdJRTlqVEJjVXdCTmJhZndGUXV1?=
 =?utf-8?B?TjczWnV2U0FDVU9jR3hkSlNZZEE4NU5CQzQ5SEl6S3FmSjlzV1lyVWJmU0dK?=
 =?utf-8?B?aEs4am91U3ZHVFJVQ1VROUVwSVJFZnErdWpnTEdQak9ac2RudEFxUjN3QVJX?=
 =?utf-8?B?ZTRMWkN6ZWRKOEhIZG1YTlZSSktCaGxpbEtFa1ZQZXczdEl2Um92aFhLc3dF?=
 =?utf-8?B?ZCtuUXBGaGVyL2VJcnJlVHNtNXNpcXhvYlVoV3R5U3hja2hoeXJ6WFQ0NTJi?=
 =?utf-8?B?eXZPWjk2by84U1VjcDF5THUyVlgvTnJjeXRoSVN1Ny9GYXN5Q2p0MWFTaGhq?=
 =?utf-8?B?eTJWRWp3VE9KR2hXTnhUbld2SG5ITnJrNkxJR0wrb2RrWVU3cXpVb0I5d3lZ?=
 =?utf-8?B?U1A5SmdIMlY3THBhQXVxMHV5NEJDakw4SmtIb0lHVEhoRXdRVmVLZVI1SDlW?=
 =?utf-8?B?ZWxpTFpLYWkwSFh2ZDJES3VxSzlxbm9SSWs1b21uVU1MTEpPaWpsTXZxOXYy?=
 =?utf-8?B?VHVIUjUrUnhub2U5eFB5bVNqSzJIaXZZZXRmd3ZJaGY1YjZIbzRCVllUUjN1?=
 =?utf-8?B?ck15cGdFMXpZaXZ0UnZlQ3g3dHk1cmthZDBqanM2cEQrV0hiSUwyNXp1RUQr?=
 =?utf-8?B?YUdkWVFoU0JQYTdhZUFudU10TnFsRkJEbWxpZmZJQmg4ci9ubkFkbldIR3ZU?=
 =?utf-8?B?Qit6bXpHbllpOTZmNUZEUEU0NWM4T0lqekk5QWoyWjAyb0gvZVU5WUZ6SnI3?=
 =?utf-8?B?ZzFMYSsyTldMV2V1aWg1Vmh4Y2JoTk54YmxxdVZreEppQldxcXEwcDBnTzlG?=
 =?utf-8?B?cWxkbUFWOWZvSjFka2d4QWJWT1dsMHBrNkFKWEJlWnc0Ty9lV08vY09IaEN2?=
 =?utf-8?B?SWhtYVg1YitjTldyb0xpRjlabGxqV2s2L1gwZzQrbEUvRlZwMGVSMFFadU5j?=
 =?utf-8?B?bkNxTXJRcGpxMWp1Q0NMZk5uYUpuL1dkWkJSOGpWM2xwZE01RlBEeUlsbDJN?=
 =?utf-8?B?SVR0ZElMQkRrZHFPMEdsUUxZdmFCR1p3RGEwUnpBZjhOTWpFVVVMT3pLME1B?=
 =?utf-8?B?VnVJSy9nV1h1ZGFySmJIU2xlK3o1dml6SHBIb0dHN1BteE5kQXFtUkxrVVha?=
 =?utf-8?B?T0dXbDNBREh2U2kwWWxEVy9tVXYwL3ZXVUtpVWlaVHoxTGd1UGV6T3hKY0c1?=
 =?utf-8?B?Z0xvNnVRY0lLVlZnUHR4L1pPdCtBTCszbEVaeXVEcEVwZ1lyTEM4OVpJUTR6?=
 =?utf-8?B?WlZTOWtIck1IRlFJSnRhNjNtQUNuTUdEVFVsRzFFV0lWYWZka1RGb0xFcWhN?=
 =?utf-8?B?MGt0clhmTnQxQVFzR1Zra1UycEk1VDNPekVxY0h4dnIvTEVPc1o3dHQrSDEy?=
 =?utf-8?B?NVBHZ0ZRQnA1L1IyU2twTm83SjJ5R0xDbTJxdEc4aU9LUTE1bnNFNHVXRzA0?=
 =?utf-8?B?NGtkU1BTMVMvM3ZJVmJQZWV2SGQyNzViSW8xTnUvYmF1UFh0MmNVakNnK3RW?=
 =?utf-8?B?VEo4Q1dPTFY0aVNlak1WUEtRQzZ0b2RsWDlnZm5PblJxS3ZndEtjN2c4Wk55?=
 =?utf-8?B?a2dXQ0czQS9icGRIck1MRjNJTUVwMm9aeXoxOElXVXdWSjQyMDB3alJLN09M?=
 =?utf-8?B?MlNra0hSVFZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tnp2M0JNNW9xKytCTVZTTk90UFBYSHRPQ1M3YnptcG5GVHFyQkJDZXpGdlVE?=
 =?utf-8?B?QXJTcE13QVZvUGpjN3VHWDZ0YldOUGY4VVpuRkFqVEZHYld4V1dYSnNjSU5n?=
 =?utf-8?B?aGQ2RUxvcTliNmMyN1d1Wlk5UzFycjlWdk1oWXlRb3B0MXg5bFhtMlQ5Znh4?=
 =?utf-8?B?aFRxSFdaSitnaE4wdExDVlAvSmQzZ0gwK05kZmRIVXB1a3RqazVEV1BmSlhn?=
 =?utf-8?B?YllqbXk2K2wzSUpCL1dFWHFxcjBYL0syRnBxQjQyT1k4ZHQxNXNXdko0Q0ZQ?=
 =?utf-8?B?WDVDaGQyWW1peG1LaWpWTmRCdy9Jdm5xa0lsQWRsclZWRWJKWVpDellxRjlB?=
 =?utf-8?B?YXpPVXVrcS9DVkpQNVdJWXZLWCt5b05reDhyZk9DT1RVdUs1RXF3emVsaGZu?=
 =?utf-8?B?dTdqUnBZNkpDdzhTd1pyL09kK004bWloY3FJM0haQ2RRdzBUNHhySHhTZ3ZL?=
 =?utf-8?B?dWs4ajhzUWlSYnJmRCtCNXF5WGczREJiSkhFZEZmNVcvMzczZWhOak1UQzYz?=
 =?utf-8?B?SFo2SGhCdG8wRkRtbUpqUFNtL3Rya3MxL3Z0UkthbXVSVGJEYWdRQng5Zm1r?=
 =?utf-8?B?L3ExWXBqV2p5WHlWZWJaYU1KSnJkMnVWV0krelgrNm1XaHlUZTNOamRZVmU2?=
 =?utf-8?B?OHVVdzVjN1BTWURuTTRkUi82Q3VBWWZzQzdQYjI0MkNjYUdMM0lnMitpNEQ5?=
 =?utf-8?B?UlN0VDFpQXFLaE9FSE9mYUhyVDNqdyszYnJXNUpqVGNEajkwNkh2RzM0QmdB?=
 =?utf-8?B?VVRjZEJvVnp2RW9oUGw4WmRRcDRtTHVORDRmZW83c01IVnlJaXNlci9MK1No?=
 =?utf-8?B?SXVvSEZiOXZON09ta3J1Qm41SFpkNzhEZjh1UkVGUGFkMXNEYlJRSnhnZi9a?=
 =?utf-8?B?U2VFVysrejlaU3Q5MjRNNUZvbEgxOGRmRWtUUnZ4dTlOU3JIeG13b1ZhVTNW?=
 =?utf-8?B?bW1rVnl1RU5zTjBLZ3dDVzl2M0ZGdWkyRjhHSTJBdDFoMEVhemdzSEltMnpT?=
 =?utf-8?B?UXkzOFBLVXhmVFFVTjdwZ0lDTWY2azNUTTVLMHdMQnptUksxZmp6L1FCaW1x?=
 =?utf-8?B?ZGNBQk5rdHdEQllmRTBkYmRkRDgzaklQdTMxcHBVTVNpVjk4cUQ4QVp5cVUw?=
 =?utf-8?B?cjRlNWhaMldnT2lPZE8yMGJjd0lQR3BZZWZrSzhybEszOFpqTXZMNXFadVcv?=
 =?utf-8?B?UjREeElGeEtQTlI3TVZ3VlVoWDd2TDJZZEl4YkExQXN0K0VLREpFZnV5Zy8r?=
 =?utf-8?B?dzIxMU1BZUkyM21mblV1UFF5MDV6Ym11NWRjY0k5OWk4U3VGc1lKbWRFVlhz?=
 =?utf-8?B?M0szTXh2NkFUQVlCekt1WmtnUDhDalV5NitpQlJ6b1FxbEpPOWE0MldrTDZY?=
 =?utf-8?B?TW40TTFzMmdQanNxVjRGYnU2RlAxbkJ6OVBYTlN5Tm93RzVLYmNKdXhUKzBF?=
 =?utf-8?B?T3NzQ1EvdU1aSE13cTBvOUhxZmRGWWVzSkxMMmVrSitKUWtZbFdRMUx6dUtQ?=
 =?utf-8?B?NUUxVUZMbnhoU0lVZlErVkw3VEo5QVJJakNURVdZaHRTdnJWK01POXBtNW9a?=
 =?utf-8?B?dWg1UWQwbmZSVDlSN0RoZkRTNmMxc2JrSjJERE1NbmJWVmJUb2hvTjRUYzJw?=
 =?utf-8?B?OGJhUnBJRWU2RUxaZHFkd1dNbEhxeFRoZ3AwejYwMDJmY2JCbHUrNjZQTmFR?=
 =?utf-8?B?S1d1WHhDYWZobU5SNk9wb3NvbWVybjNXSE5ZNVFiZjdPRGIyNzYwRUVLZUZn?=
 =?utf-8?B?VkNRS3lZVlI4QXFIc0luTTh5R09sWENUZ2YrNkJnYlF6enRDZmV3WDZtVWxM?=
 =?utf-8?B?eWNSU3FlbXB0cFh5YWt6b0NtZ0hubk9pano4bWNkMVNKY2dMOUsvU2pkclJM?=
 =?utf-8?B?RTlIOVR3VzU4TUlBck1GUmcrMjhhSjNSTUIvSlBKc1B4SEZrVWUyYlhNOG5k?=
 =?utf-8?B?MDdmT0pQdldEWTZSYmxxZ1dvVDN5VTM4ckVqTnM0cnI0WW1yUFZQQmpUNyt4?=
 =?utf-8?B?WG13TnpTRkNpUTZ0eVo0eENhNktjb3ZjWFpWdElvRWQvVlE1aUQ1enhDdWtl?=
 =?utf-8?B?L1F4Q3Y2WElENUZsWCtnZjlHQ3d6N1FTR1poU0syRkhPOUpCUGRseGVnTFls?=
 =?utf-8?Q?KJ2AiWzAKa3KXqQCDAZtW7y0F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05908A6CE8993F4FB779E56BEEE0FAA0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccbb55b-e907-4ddc-1449-08dd759cdd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 06:24:34.1454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sraQmrgShOquc6amvc8AUHYA8bBJevVovPx0CNJjOS2GiZOS50S8K6Y1p32+1OnrWYrFIhi+kaNEMLkWM293XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7893

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDA4OjQwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDEwLzAxLzIwMjUgMDI6MjcsIGt5cmllLnd1IHdyb3Rl
Og0KPiA+IEFkZCBtZWRpYXRlayxtdDgxOTYtanBnZGVjIGNvbXBhdGlibGUgdG8gYmluZGluZyBk
b2N1bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBreXJpZS53dSA8a3lyaWUud3VAbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gTm8sIHdoeSBhcmUgeW91IHJlc2VuZGluZyB3aXRo
b3V0IGltcHJvdmluZyBhbnl0aGluZyBoZXJlPw0KPiANCj4gWW91IGdvdCBjb21tZW50cy4gUmVz
cG9uZCB0byB0aGVtLCBpbXBsZW1lbnQgdGhlbSwgbm90IHJlc2VuZCBzYW1lDQo+IHN0dWZmLg0K
PiANCj4gTkFLDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpEZWFyIEtyenlz
enRvZiwNCg0KVGhhbmtzIGZvciB5b3VyIGtpbmQgcmVtaW5kZXIuIEkgbWFkZSBhIG1pc3Rha2Ug
aW4gdGhlIFYxLCBzbyBJDQpyZXNlbmRlZCBpdC4gSSB3aWxsIGNvcnJlY3QgYWxsIHRoZSBjb21t
ZW50cyBpbiB0aGUgVjIuDQoNClRoYW5rIHlvdSENCg0KUmVnYXJkcywNCkt5cmllLg0K

