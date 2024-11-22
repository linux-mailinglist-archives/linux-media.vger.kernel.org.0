Return-Path: <linux-media+bounces-21797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C09D5BCA
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BBE91F2203F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8AE18308A;
	Fri, 22 Nov 2024 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hJqtuWzI";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UgovHcXs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF0187879;
	Fri, 22 Nov 2024 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267150; cv=fail; b=j8bufBUrx2vp7j8poWexo6EH/yLtInW2PP3j+w8aaoIQHz221qFTMI+ZnakitFSIq89C4TQrS2Ck2BDP5iNLt4ylaGHi1FNcYPw5dqVz/Z191V1jJsoHGqm701RskMJxAr8/VUQlaN/jUMoRPzpx8PrytnDfaZFM5/FZBMzT5LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267150; c=relaxed/simple;
	bh=lbqLAsumKtnyN5jvsmICVy2NfQjOZ0lfSw7DHdYwPD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ICohC2WPjNiE6anOIzlTntrtIXPdWZrvOB4upoGcF0lhsah71n6ylmXqFbzP1zTQ4DEmr0AzceICSkQpzkPV+iMIilM4a4Xgy/IWGQKzsiE3jSLu5H7VMxa8d162xIZbfQ7WvKvDFye9yLvqd20sebHUKjwBX8rf6O+GXsqbVs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hJqtuWzI; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UgovHcXs; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d10f47fea8b211efbd192953cf12861f-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lbqLAsumKtnyN5jvsmICVy2NfQjOZ0lfSw7DHdYwPD0=;
	b=hJqtuWzI/Xg1J6id18xbGgWdo+88yl15cApEC5cnJ1r8HnuJk3IjhLM0AawddtiR/HL6ocSYttmBiAewkGmKoy4cXlG07JAbOVh7kXJ7ZyFGoelDLYK8U2yBMJjTEgzUJfXjHrtojKggLEUuOwAzkpVTXpHtk/5zoaJ6VQpF7VM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:d50cfeb3-2040-4ddf-a6ad-58b94b1f188f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:3b5d3bb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d10f47fea8b211efbd192953cf12861f-20241122
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1948281951; Fri, 22 Nov 2024 17:19:03 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 17:19:02 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 17:19:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQtKb3j4l4IEgZbTVW1Wq3ZJ36qSSwr49xRxjDDuVUdc08KrV72x6kGG59u3wuo+3qr94bx1uT3+aa/IN9hH1vYoEXhgxi47Pe8PzgzgdLYQd39IVU8MW/JOJ1lAOrSk9W6SdEGXS35SMZhMmHFJ+/2LnByRqvywydyad+VbJVXKAgsNb3SuU2PP5TNPc1GNwvMQtejFKR+L7FGel1LxnOZ5enpKou4a4zeGIJJveKL/p5l8qedO/Ho8vj0B7gFJNip2SY0hUhiA1e9VKUMoe5CevL0yyR3qTZprGAXu3HK2AQUtja6A6sE1mjD3FAGZ2WJYRY5V9I0tc1lVNRnAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbqLAsumKtnyN5jvsmICVy2NfQjOZ0lfSw7DHdYwPD0=;
 b=X32NyXcKh0pwtBI3kLjWkDajR8781esAGmwkSxOJ2WMpNwNoh0ICPxttxe2SC7eIfLkJ/GiRA0TvoJ3XF6ECVGbeHYX4bWVC4LuvUq8hW9ElrkUTEZdfB0owyJDvDPnsU+BTEwD0ASZuTrZGoOsdDjNE+71LmZOdCf7Y7uKSldqN5nQXbpwA8cPOHOO9fDhW+cZ+P/JmPS8Vd+MKrat2CDj/6h/4DTxIYkwtDuGuGtusR3KHMFBzdSP/PRNf5YNUDHlnasMt2uZV1tzQk7fDpn3J8kRJRJZt/Hhv9Ome6nocg1g5sHtCVw6Kn2sDtioWHHBTVsMKasF1oNUZBEcMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbqLAsumKtnyN5jvsmICVy2NfQjOZ0lfSw7DHdYwPD0=;
 b=UgovHcXs43Ljo+Vp5VntqlOP7xaUVt0SkSS5tCLsJLCORrIrEgri6R0GjDDRdaU/+FOW5UBwAVdhRylf1HYN32pM2V1Wx6OJpO2feFusbh/aAZdoaU4pJxpPBsmr6+TUVz/PrGjYIkaLlDIy8rtp48QCA4ZYsAd0cUySamT7qGk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6699.apcprd03.prod.outlook.com (2603:1096:101:6a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Fri, 22 Nov
 2024 09:18:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 09:18:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLDBzaA
Date: Fri, 22 Nov 2024 09:18:58 +0000
Message-ID: <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6699:EE_
x-ms-office365-filtering-correlation-id: 894eee7e-e818-49ab-80fe-08dd0ad6b21c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YUoreUF4ZWJLVU5GcXIzZ2NSREMrQmFGOE1xaVdEbnhjaFI5RlZJOHBES3Fy?=
 =?utf-8?B?VU0rK3VDUEFkcENJbFYvL0hhOXgyQ2t0QkpNaVFJQlhwNms2aDVTU1lqSWV2?=
 =?utf-8?B?RlZVUTZuOTRBQ2F3cXBsYjVBWldhNjgzd1o4Q3dQOFh1Q3RIU2pBM0MxSG9p?=
 =?utf-8?B?UmVSUWZsWWc0Tm5BeE04MHZ2UGpwZTMraWRyS0QxNDNvMjBkdmw5T2htMG94?=
 =?utf-8?B?RnNVbkgrbnlKR0d3NTFpYy9xS0JGZlVFNkp3Yk9WM0JJS0lWZDk3ZGhlYVJH?=
 =?utf-8?B?UGFxd0NxT2NMcHpZM3pUOVhncjRzTkdyaVdJZXBaQ2dhMGtCOVRUcENIZDJx?=
 =?utf-8?B?MGhLV3ArbUQvdmpYa0lraEljSUhsalZPVnhNVW1DNmF2Tk5qUFYvd1Zmb3V6?=
 =?utf-8?B?WFpEUW0xZnIvRlRDb2p1RXlVUlVsZWRoMjF4TU1xYjJ1Nkl3dU9vOE42WGh4?=
 =?utf-8?B?Ty9NRnMrOE9jZWZaanRVQmNFR3VLcHFjRDFibmpHMTc3dytqamYwSmtENmQ5?=
 =?utf-8?B?cStBeXBob1pXMm15NG5IZnN6eUtyYkJTQUxqdEQrVDhPU0p2Mm9lUk56UCtV?=
 =?utf-8?B?ZE14QWozeGJHZEl6WmJGamtaZ0QxRld2YjMxK2xtZU40K2lPNCszOHU4eDl1?=
 =?utf-8?B?MGllVEpwM2xySm0xOHhrWFdjUHQ5TUpaQWVFcTg2UnNTZ1dseldPRzI3RzIy?=
 =?utf-8?B?N3NiVzAvdXZSSXEwZ212SER5aHhmbG12RmZCYlBDYWJNQVhKSnAyZ1dwR2h2?=
 =?utf-8?B?SUhZbUU1N0FhTEltcHZOL2FVbWZpaFhvQVRCa1RLRllxeExvOXZQeS9ab2tG?=
 =?utf-8?B?c3pHZW9wR3RkaThtYTFaRC81WkEwVVNVS0sxSHNJRTE4UlpRWkF2VThKcVhP?=
 =?utf-8?B?dzhGcW9kL1dSVlltMlhUREhTeGREcWRkdEp4aTZaMGNlQjA2ci9FMmtQR0RX?=
 =?utf-8?B?bHZLL0hCL3k5dmNweUR6azFVbzg5WkZqQmtFZ0pYR0dXcTVDYnVxTE85SWE5?=
 =?utf-8?B?SS9DNTJtd2RhbFN6di8zWWxNUzNTZ0FLNW9zU1lqcm50WW03NTJLOVZTUjZt?=
 =?utf-8?B?aHpYU3lrYmFNaXB4QlRkRk96dDJ4ZWV5NytKc0cwVmxDb1JaUVE1OFc4Y1ZC?=
 =?utf-8?B?Mmg5S0VtcFJpZmIvbys4RDNvcXlmaTllcHNIQ2pCZ2NXZTcxYyswMzBHTVlM?=
 =?utf-8?B?QkkxUGZmZzBkYU5aQVlZWFRlOVNJcGFiVE9uZEdQNXZvUVlScDliOWo4ZHh5?=
 =?utf-8?B?d2xKdHlIeGVwUWJMRU53QUdzNjh4cVFJdlJzeEpiQXkyYWtTRnFQVUVkY2xX?=
 =?utf-8?B?UW9CMU9yV0RrQUppNkxHTFp5bU93dVAwanNzTWxmMFJDZ3dhajUwaXdibEdC?=
 =?utf-8?B?TGpIU1orMlErbUdzb0tuUURjNnMzd0hwL2xaV0FMVlFyc2VoUE9xOUdyOCtJ?=
 =?utf-8?B?VXFDMmRsVS9UdEVUc1hDUHdTczMvaXgzNzZVZ1orZnM1VGllS3c5SjNtMHV6?=
 =?utf-8?B?bkJ6dnQya1o5azNPTVhKYStscitxS204WWh2STNlZ0lLS0ZuS3owa2Y5ZUZS?=
 =?utf-8?B?aXlzZkFFZU5Genp3TWhIZGhNSiszVUF0YjJuQlRsRTFybVJtTGw4VThpMWRh?=
 =?utf-8?B?YldLRERBRHRYUDFMUlJzQ0UxeDNlMFhPQ3VVcVB6cjZmMk4waHF4Mlc0TUp3?=
 =?utf-8?B?SmU4MlFUaVU5b1FTekYrc2d5QWxyM3Y2MWxvYm5JbUk2Y2pTdFF2dythSEwv?=
 =?utf-8?B?UURWZlR6emM3Q2pXbEFLZmNnRElvVXA4TmlFMDYxNzZkUVJlS1NJQ2dJaWM4?=
 =?utf-8?B?clBrL2tlWWowTmpSUVN5dVJneWs3MzBHQzlCTEtja1RmQlhwTDk2VnlzeHA5?=
 =?utf-8?B?L3h4T0pCSGNqa1QycDFKWE5wVmRnTU8xd21UWHRWMXN0bUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnRPK1FwaDFZWk1ad1MzQVY1SHg1dndwOXlWQWhjZmp1TmluWm1uN1ZKTlhV?=
 =?utf-8?B?ZXY0Y1hrQmlZWWNQeXg1cjM0bmQvOXB0VDByeUZqOGkxZUpodFpnRDI0SlN4?=
 =?utf-8?B?bDZGSkQzaEJTVzFDK0FCakQ0RUNxZ05nbmhWZ2htei94U2pJMFJSaHlhR2tt?=
 =?utf-8?B?NlVOWEswQTdTMjlwZDFpRkMwUmtKZGpsK0ZrWCtsRi9RUUlLWmdzM3Y1cERo?=
 =?utf-8?B?cU1FbzFPZXZzakRGK2F2ZmZPVEEvQ3krYWdOWDVhRWkvQWcxZjQ1emxKRUd1?=
 =?utf-8?B?QzhNT24yR1lBc1pydllRbVVYQytURVJRejk4OE80cUg5YXhaL0Y4eUYrOElx?=
 =?utf-8?B?dkZkbHNvaURmeExoQkdNNkZ1YWlROU56V2VmTkZJb3BYeVdFV1A3elZvYlZp?=
 =?utf-8?B?NFhsdU4vYUdtMWVoY1g3Wm1UZytMTUNCZytxOEZCV1hOZkMrMHo5SUNCOG1s?=
 =?utf-8?B?MnpUYTlkNnRJUnM4ZWtYUVRSMmJUWHgxOE1HVnlnenFkU1dzaENQN0ZlN000?=
 =?utf-8?B?bmZYeDJoTjA3N3hPU1VXQTVoNXJtak1VSzFzTU5FQm9nYXpLTlJjeUtuaFZo?=
 =?utf-8?B?M042eHF6WGNpa1lrUG4wN0UwM3M1Y1JHaGpSNWlQNkh4VVhlVmQxOUU3VC9V?=
 =?utf-8?B?R1U3VVE2VzJxc0JJRlc1d1JBMjBMVjkyUlIvTHdReTlUSE8wR2lBOW5CaVpo?=
 =?utf-8?B?UklKRHJsQXQxckFIT25TN0FzUjREYzNmaTgvNmo2TFk4UGZjZHlIZjZWZWYv?=
 =?utf-8?B?bzNYZklqVWxiS3hOSEU5RWZxVmRkR3BiZmU2N0dsQUovTjh3enNPMVBJWlJP?=
 =?utf-8?B?cE00QklrdGcyU0xkT21lajVNU05VNklQK1JjdUpkTU5xeHpZMDdxZXpxRnV3?=
 =?utf-8?B?UzVaWmFrYnlsTko2bktBVERkZFZBc0dldktWTFVCOGlWZmxVeHp4VGpOODNZ?=
 =?utf-8?B?Vnkra2wySkxoVDl2aWxqQ1pkSXJsdHFzWVFmU1lMNFZMek95bk80TzlGTTU3?=
 =?utf-8?B?T3U3STdlSHE5bDVLa1RBN0tNZG5SdWYyZVRNNnZVQVlZV1cyVTBCeFBJMUk1?=
 =?utf-8?B?T2t0TStWRFcxdGIzRjVrRFZXQlc5ZmNxVVhpdVcydlNlZVhMS1JSU0ZBa09q?=
 =?utf-8?B?ZTFZaEZRNlIzWWJKT3htZVV0diswSGZDK2pxWFRubm0vSmdiUG9zcVV3YXBs?=
 =?utf-8?B?b2t6MFpOMDVNQ0U5dlI0MVFKellTOGNxaWZUeTRmTzM0ZFFmT3Ntck9lZUZj?=
 =?utf-8?B?YWdmeVk0Z0g3ZEg1VjF2aFF0MHdSU0JNUUkwdGtmTncxODErVUFURDJJSjFo?=
 =?utf-8?B?L29qeGdKL0lDUFYyK29Cbi9uL3gvTkxqTGh5eDM1R3V0QXJ5VXFsWnZzdG9Q?=
 =?utf-8?B?a1Q5S0tMd2ZPSTB5bVZOb0xOakdNeWZMZFRtZWllVWx6bUIwZ3FDSS9UeHhT?=
 =?utf-8?B?WWtDaitnbmZmbzBVelJNSTRGcE92SGpaRFl0R0duMlhUMUxDOTRuc3hJZGtT?=
 =?utf-8?B?VHlxdjNSSDlwMFlaTGFmZC9kS1I5dDN3c2tGaUpSd0wwME5Id2NwY3htL3I2?=
 =?utf-8?B?VVhraGFUTVNLbW5sY1VCMHc2S2ZjM1NkWE84eE1nZTUwU2RLemphbGdTUnZX?=
 =?utf-8?B?aUpJL1JwakRIQ2xSbkw4MEdnOXdldEJnQ2JLM29tV2JtbVdmc0RwM1BtU0s1?=
 =?utf-8?B?WS8zYmtNQkVEV0dzSllzTnJnUVlkZjBHZXBQcXdOWG5aaDFVajYwT3lBL3hB?=
 =?utf-8?B?WW03V20xTGZyQlFqU0FUVnRRSGRqWEx3YTZWUXNuWnVkclUzbnRQVlZWbGQ5?=
 =?utf-8?B?L0l5LzVuUHQ0L093aTFZV1dHK3lqa3VyTEpReUJuS0VCWEdpa0lNaVpmRm5x?=
 =?utf-8?B?S2tUNzNkeHhoSGtEVzdSZzN2VUF4d3c5bU8wajRpdCtDYkpmUjFUVC8yVkRM?=
 =?utf-8?B?U25BRncyNlB4ZTJGdVFtZm9lN0FzeEpYZ0drNml2SVRQeFlDZk4xTmFnVk9n?=
 =?utf-8?B?OTZtQmpDUmIrYjI4U0pkQ2l2OUdoSUpTdHpITnk3ZXRGSG9iYzBPUGNqSXJD?=
 =?utf-8?B?bEgvTkxyd1huNDZGcktUZVU3WE0ycFdBVXdVVC9Ub1Y3aThZeE5zQVBVN3dn?=
 =?utf-8?B?UURmdGRONzdMNGt2Mk1SQkMrelZOdXgyKzUxcXVLblArY1VKN1hwNnU5T2RB?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <042E0A2070761249BE9240822205C162@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894eee7e-e818-49ab-80fe-08dd0ad6b21c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 09:18:58.3471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMHvT2Kxivuw9zBjudbCP6CU5ZI7cVFyS4RHcsVkFMwqDTNhBWWthZpRmlIH+7S5/6sPEAvEtcbPmKt/pEOocQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6699

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIHZvaWQgbXRrX2NhbV92YjJf
YnVmX3F1ZXVlKHN0cnVjdCB2YjJfYnVmZmVyICp2YikNCj4gK3sNCj4gKyAgICAgICBzdHJ1Y3Qg
bXRrX2NhbV9kZXYgKmNhbSA9IHZiMl9nZXRfZHJ2X3ByaXYodmItPnZiMl9xdWV1ZSk7DQo+ICsg
ICAgICAgc3RydWN0IG10a19jYW1fZGV2X2J1ZmZlciAqYnVmID0gdG9fbXRrX2NhbV9kZXZfYnVm
ZmVyKHZiKTsNCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArDQo+ICsgICAgICAg
LyogQWRkIHRoZSBidWZmZXIgaW50byB0aGUgdHJhY2tpbmcgbGlzdCAqLw0KPiArICAgICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZjYW0tPmJ1Zl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gKyAgICAgICBp
ZiAobGlzdF9lbXB0eSgmY2FtLT5idWZfbGlzdCkpDQo+ICsgICAgICAgICAgICAgICAoKmNhbS0+
aHdfZnVuY3Rpb25zLT5tdGtfY2FtX3VwZGF0ZV9idWZmZXJzX2FkZCkoY2FtLCBidWYpOw0KPiAr
DQo+ICsgICAgICAgbGlzdF9hZGRfdGFpbCgmYnVmLT5saXN0LCAmY2FtLT5idWZfbGlzdCk7DQo+
ICsgICAgICAgKCpjYW0tPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV9mYmNfaW5jKShjYW0pOw0KDQpJ
IHRoaW5rIGZiY19pbmMgc2hvdWxkIHRvZ2V0aGVyIHdpdGggdXBkYXRlX2J1ZmZlcnNfYWRkLg0K
QWZ0ZXIgdXBkYXRlX2J1ZmZlcnNfYWRkIHRoZW4gZmJjX2luYy4NClNvIHNxdWFzaCBmYmNfaW5j
IGludG8gdXBkYXRlX2J1ZmZlcnNfYWRkIGFuZCBkcm9wIGZiY19pbmMgZnVuY3Rpb24uDQoNClJl
Z2FyZHMsDQpDSw0KDQo+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2FtLT5idWZf
bGlzdF9sb2NrLCBmbGFncyk7DQo+ICt9DQo+ICsNCg0KPiANCg==

