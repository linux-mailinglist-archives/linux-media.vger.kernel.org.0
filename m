Return-Path: <linux-media+bounces-11590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A675B8C843F
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 221171F23C05
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE5728680;
	Fri, 17 May 2024 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WtFz99ny";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Er9ysGbB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4E23772;
	Fri, 17 May 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715939629; cv=fail; b=StCL2psnjqTRLXjw36MqA/ODk6YS2eAx87O4hHxyK5qdgI0LvMNEt2ZlaxgS3v+ggpN/vNr3zMjKlDIxzGM+R0Mfp+4Aj4Y1OBjtXHNk47aDBHUiQAgp14L5IbXn9gfMt/aCeVk6YyGjNwiuR0NjE4lDiA1nbsVGAd7cdeUqBQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715939629; c=relaxed/simple;
	bh=qdycJ3nJnCErfe2VeNDYTztDsm+tFutqaCBYvPtDjm0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S54yJUXi3S7/CQSIKqo6ye0au8ZWg/LRMyiYI2Icmr3W97KeYccf5pJFvRsx2OBOOZtfT835ztWW0x8c2B5VhqTRMg4eDnVlBkz1Kp2K5ZXLo7aWZt6o4OTrMDt1PJ8qnmbGcmQTqpLiUcH5ZcHjskRbfUDEUdmCSImoQAqnwrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WtFz99ny; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Er9ysGbB; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 52d0d9b6143311efb92737409a0e9459-20240517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qdycJ3nJnCErfe2VeNDYTztDsm+tFutqaCBYvPtDjm0=;
	b=WtFz99nybPbelHdD8OwoBZQG7KTxNaFnMBKwXfLuC9KX+yBkggybaTiMF/Oaw6TaJTAW7WBSUn3mzE4tN1VmljJn81eXXcUjmiCIbYCWf0Zqd3gXEHAW1WP1pDr5zlxijlAB8KjcWqmD0/TnkiECDNH97w8hE4mRznZUxDGjiXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:c2af1860-1008-440e-b309-92bcbda8334c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:eb28fb83-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 52d0d9b6143311efb92737409a0e9459-20240517
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 710521424; Fri, 17 May 2024 17:53:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 17 May 2024 17:53:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 17 May 2024 17:53:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxldpK9rmzb7PX1JqyuJP0jTBt6sAu+/iOHfyxDoelefdkbzCzHE4zx29PUqL4GpqEaUiZkeN3P3G8T6LG+zowfGzyeqxcekmqvoNipgAEDpE2+rPqIVbFl0SHdRTGb14T4Ol+tnD3IXeJditPHtcp+LaXpvfp4hL1dtcLceaFMZWhKcVy2kgxt3ELXfCmiwUCaLsk8jv+WfyeKwC+2fBEjp34kx7dW5ACloV4SfewPXG/1CROGmw2CtDhGaEOBbkX10Jb8wssSNkdlfW4qv8/yUwA98IbUKBuDXINjfvx+R90c0U9o1AYdLwDtwtDEWqZG3bcPmzPMBboFiPyzVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdycJ3nJnCErfe2VeNDYTztDsm+tFutqaCBYvPtDjm0=;
 b=Yrx9DBafatOSSBAgqQKXJAX258Za9ksdy9Vo9myMVelv8yeeZD/clc3H6zlWDbT73DG0/YJ0Xlvg+V3iJf33PwIUE19HwZdDcqQY2kaXRBnDedRn37yVKyNxGAjxaU7GHkTxbVvLRQjef130Q5zypD9XAe1E9kK6cSkJe+Cn66/a6DSWudJqPxUCHSxjkjgqyEmlR9HEuyMi/ihMUapleWhflR1njT+9JNs+bMG8ZQUkdfEB06KUoeO1N32GkEfJdri727lQzmtl1REHyHF7JkL8T84xZaIR7B/ZgfI6ySWBFS5c1I2NAKdd3Dif5PHvTKUN997O5xj8934EyL5d7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdycJ3nJnCErfe2VeNDYTztDsm+tFutqaCBYvPtDjm0=;
 b=Er9ysGbBJpw5/eC+dHswsS/Suxpp7m2SDRkqtR63khGzW5RGRfwS1YF7k89wXgtvOqJe8aa+Sf9W2VcKm/M7dvZB+JCX0TED6YJUn6bMP11xZNWUGLlGdBCC+u5p0xvJXzEzhCRvR0emu4A342O3M0p5bKFfSvWwQ8XYzhB0Z6M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7772.apcprd03.prod.outlook.com (2603:1096:400:428::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.12; Fri, 17 May
 2024 09:53:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 09:53:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tfiga@chromium.org" <tfiga@chromium.org>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "wenst@chromium.org" <wenst@chromium.org>,
	"jstultz@google.com" <jstultz@google.com>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	=?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "tjmercier@google.com" <tjmercier@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6, 19/24] media: mediatek: vcodec: disable wait interrupt
 for svp mode
Thread-Topic: [PATCH v6, 19/24] media: mediatek: vcodec: disable wait
 interrupt for svp mode
Thread-Index: AQHap4vHZLNttpOGTki8Nip4rAYFBrGbMQoA
Date: Fri, 17 May 2024 09:53:29 +0000
Message-ID: <81b099b1f70253501c39b7d538f9759c64bc880e.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
	 <20240516122102.16379-20-yunfei.dong@mediatek.com>
In-Reply-To: <20240516122102.16379-20-yunfei.dong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7772:EE_
x-ms-office365-filtering-correlation-id: 5710680f-e9c3-4e23-ab6e-08dc76573481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|7416005|366007|1800799015|38070700009|921011;
x-microsoft-antispam-message-info: =?utf-8?B?OUU5U2M2WjlrUEJ1ZUZRbUk4M0FQNmFLT1F1K1ZIWHBQa3k4c081VFQxQ0Fv?=
 =?utf-8?B?d3hkYk5pR1MwVnJ5SFA4b3NnWXZEUlhGemVqUGczZnNaeVJoN0FRV3ZxVkh3?=
 =?utf-8?B?TTFocHF4SjhEckphR2xyWUpkY2hhWDFVSEZwd2o2UUM5NHM4RlFBY2JsQjhH?=
 =?utf-8?B?ckF5MWV5UUwwZVBiTDZZdktBRVVCN29MOHhpUFdGOGRMVXl2YTAra2FjdnNw?=
 =?utf-8?B?b0tJcEh0RTZiVXRxQm1wOU94ZTN6YzRRWFUxbFhPd0hneXJ6MjJzWVRKNUtB?=
 =?utf-8?B?MFp3YlQ5Qm44aWpHNlNtYW8vL0QxN2xzMHZSUWN0VE84ZkRJZ09zRjRLSEFr?=
 =?utf-8?B?VWp2WHlrSytFVzJ3MmJUdXlUUmRVb1F1dUxrY1kxS2REbmw3cStJVHJuK004?=
 =?utf-8?B?ZzNua3BQMnBWekdGWmk5NmJzQzJ3VTJ1M216RnNhQVhRelhBeTJyWFRDdXNn?=
 =?utf-8?B?Z0tSWG1PWERoMk43bDZQRDFnMG0wYVNPNjBIeFVucWkrYTJnSGFqb3dCN1Fq?=
 =?utf-8?B?TG5COXNoV0Nnbk9Mb3hwOHIrdEdsOTBRb0E3M2RlRUQrMGRMcDhrWnVJc0pO?=
 =?utf-8?B?cjdaZGw1eHZHTEtxNnBGS2taQmNLN2s0eDQ5VWExTENjNGFFZndaWklFV0ps?=
 =?utf-8?B?MnBFSlJ4TmlJTWMzdmw4WTN2cXIxS1ltZjVNNnhwNmFrSklWcmJ0SEtucEJ0?=
 =?utf-8?B?MytZYnE0a2tFU0M0ME5KbHlBM1EyYWdUT2ZDK2FVS2ZtWlNGQlYrTG1lT2hn?=
 =?utf-8?B?bGNGNHRNTWwvMHZ0a2t1a2VidEFrdDc1dEF2bDJGZmpZb0V4Qm9oWU9QK2RH?=
 =?utf-8?B?alVhZHZybnpkYTNmdWlER1MycHhLL1ZrbzZueC9VWTlvN1pOTWJKWlRLb2lJ?=
 =?utf-8?B?N29uemkzWm9UemNwby8rLytpZ0F0N3QyVWNzYzRQaEZaRkI2NmlOcnlrWlU3?=
 =?utf-8?B?NGE3bDRIN2tYRTlRNkxSQTlwaUhYZWJad2YzaDE3RDkwRDBEdHQyaWpOazBE?=
 =?utf-8?B?ZUI4Y1YyY1J6UVErSUowT1gwZnk3Ylk3VWQxaDFDZGd4Zm1vMnRSZDJNeTdy?=
 =?utf-8?B?S0dDM2F1dURWWm9mWjUyZk5YSHRsejErN1BVNXZ4bW11THZwT2o5cnpGMWxC?=
 =?utf-8?B?eHFyMFVma1NpcjhxaWRpamdNcERDMDZKYTdWWE1jZ3FTOTZrblE2R3VFOWNX?=
 =?utf-8?B?QXdVbnBJS0xabkJoaFlmVmZYQU5RNEdWU0YxK1k4RmtvZzBuM0FROUVRVWZO?=
 =?utf-8?B?VkJ0dnRjVUtiSThnZjlMQXl4M0p5WGVZODlYT2U1ekxWUFF0QlVuOUo3QWZW?=
 =?utf-8?B?c09uRnlrMW1xTy9EaUJqZlJ1NDF4OWJDYkdUWjZYNHdjelZaeUMzV3FQTVBz?=
 =?utf-8?B?TGIrTHlVU1VSd1RnanBXQUVodmxDcWVBZk0xZVpIREVMOVZsOTI2VldydnJ2?=
 =?utf-8?B?aWxNd243azRjZlZ2RC9Gc294YTkrQXMwOFFFUkdSakNqQ25pOXJ1eDZGRzRM?=
 =?utf-8?B?L0dYWFFRUHVrNmNoMFhaZy9TRytkalFFQUJCNFpBNk41S0pYQnArZ2JsU25J?=
 =?utf-8?B?VDBFQ040UVBXSTdXT3RwS1FsVlcycWpYNURzcG1NcGFBeWdReG1rQU9QNnFD?=
 =?utf-8?B?WGtaYjkxeGYyS0xxRTQ1eFlwd3ZwUTVSc0J1eTY4SHNRWjAwWkdnVFBtcEll?=
 =?utf-8?B?SzhWVWZLaDRDdmtmYXY0NkNnMElMb2J0aUZpbjR3ckRoSHc0Zy90ckJDcFVM?=
 =?utf-8?B?WDJGUEN1T1hSWjhjSjhSOVE5VFlrK3JNcndZOVZQdG81aU5OUUM4ckxaWklY?=
 =?utf-8?Q?vKEEt3s41aHBngyY1rvCSao46dr1V0tShYuP0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWllUFFMT29Ub29HcGF0VjNrbTZKaWxUYkorVG1KQjJBZDVLd0gzU29ibGR0?=
 =?utf-8?B?bnlmU0pnTVJQTWtpM2UranhsRENSQktabDVLSjNaL1FsWHkzdTUxV3NHOVls?=
 =?utf-8?B?V0hQWHBRQWk2anEyK0ZJWm4xSEs0M1YxbjllZHowUUZ3bzVpNVpkZXVVZGc1?=
 =?utf-8?B?am8xalFrL2g0YWNlNFJpc3A3Mmx3Nmh2ZWVXR1E5b0ZjZmk2b1ozSDVoWW80?=
 =?utf-8?B?ZkpZYjYwZUxFNGJnUHU4clVZQTl6QjRaYVFDeDhwOGsyVVBQNlV3MVMyckZu?=
 =?utf-8?B?bDQ1bkIwVVVhV24zYUh4eURReGRxYythVjNiWU82VGc2S1VRWVFiS2JacW1v?=
 =?utf-8?B?bVBNQ0NKWElCNVZTZ3JwZm54TTN4WEg4L0hXRTh2S0xKTUFmR3REckU5NTV2?=
 =?utf-8?B?clM3V2M1SnAvb3JHNU5lVTQ5RU9SZlBBZk5xemg1T2RJR2JQWHNzR3lCWCtv?=
 =?utf-8?B?U1VvWXhwQWxON055OEI3cXg0cG1walNaLzJUTXdMd0pBWjJzZ1MzL1NkVFoz?=
 =?utf-8?B?STBkd3FucWMwanF0NjFVTE5Mci9veHZJOU9PemlQMzRvY0JUeENwYzZyQ2d1?=
 =?utf-8?B?bDFMemJwQXVxdWRYUFBxY0tNWW1kY29tTlFMdDl4QUtUV0Z5SUxHbGE4ZXV2?=
 =?utf-8?B?OGdvc3NjRUxDVnFBOTJra09aQ050TmpMcVp2L2dBb1JlS05oZG40b2RMNWpS?=
 =?utf-8?B?MWRtM2JNeURiVE5zMlNxUVJmRlhqdTlwTHp6NDFGSzRDa3R6Z2MwSGlSRmUx?=
 =?utf-8?B?MVdqajI2ZnVBTDJsWS9Pc21zV3F4SUxQMUhMOFRDMWhOSGFVdUdlbzFnWGli?=
 =?utf-8?B?dTdjSWcvUnFCbitsQ2Voa2VudFJMUlFpSFVMc1Rod25uakxpQUVtcEcvZWlI?=
 =?utf-8?B?YjNXdDZPYmYxeVhHZlVCWFppbDFuZ2pYdEx1eEVvaUhRTzJpRjc3QXYybmQ4?=
 =?utf-8?B?a1dGM05UVitQdTZhOHhtczZMZ1lKaU5mYUMrcFBrSHRNcFdRNmNkTHNqY3Vm?=
 =?utf-8?B?SXZjYXR2RjNKRmxiTklXUER4Z2w3eXpKWlBBekxNemJCODNmZk85RzRZTC9w?=
 =?utf-8?B?MUVqeGRLU21TMHM2UytXK2RMWkg2WVM4c2JjR0FjNmRKOGdPQ2FsUU1iMVBq?=
 =?utf-8?B?c3R5TWN1dTdvM25jYWtCaS9uUFJTYTA2MjN3Nkl5TjdiZzZRRk5NVmNvRm85?=
 =?utf-8?B?Mi9UU0REWU1BUDJBa1dlN0IyaFVIVXhmUERVaDlMMXZZQWRrVHVhQ0ZBZmFu?=
 =?utf-8?B?cHJLdSt5b1B1TWVOVldGREZ4Zzl2cE1sMGJzQm1kVG5QM1crYzN3L2txcndB?=
 =?utf-8?B?b09hd0FFMXlrU3VmazdaRGRMYzhMOXpFTGpxUS8rTkxJQ1A0SWpxcHN6ZjBp?=
 =?utf-8?B?OWJaUTd0RFNWaFAraENCZCtBLytuMDFuWFNWaXdhZ05WazhVOElvR0NMbSsr?=
 =?utf-8?B?eWN2dWxNZWdJTzVIZmhuRk9vczE0U0czVS8xNllKUWRHcmVMdkkxUDhzRWQ5?=
 =?utf-8?B?c1FWMjJxTFAyQndzdUswQi94eEZRdmd2RFZsNXB1czhSU0VRVmE2Zkxiem0w?=
 =?utf-8?B?VkFybHFWbkM0THlXNDllYTJKQ09KL2RWOTlaZ0Q5aWxSeXh6MjBvaDFsdkNx?=
 =?utf-8?B?MXQreWFwMVBwbUtOSEk5U21UZStUUzlxOGhwY25VZkVqUHhRbUN6ZkVpbUdY?=
 =?utf-8?B?eWtSMysyVzJNcWNPbVY1Z0RJOWU0S1VnSld1cVlLY3dCUjZFdXdxb0l2aEE4?=
 =?utf-8?B?WWRnb1JrbTJuOS9ydXlCS1QvVVJocTV2YjlJS1hZWWlhQStRblNNS0xUbGJD?=
 =?utf-8?B?S09sblUveldJNDBHWTdVbGpodGVOalJWMzlUSmNKTHRNejdLUjZ3R0FuQnVu?=
 =?utf-8?B?Y2FiZmR5bkg0SkJ5M0JwYlJHOEszV0tjWkVwUC9rc1Y1MXFyVkEzTlJKZ2xa?=
 =?utf-8?B?T01ZWGJ5Sk5JZ2VwWU40UXdycEN4OUh3MlBjMDIva3IwSEE3SEUxR1hqS2ZD?=
 =?utf-8?B?ZXRHNjdUVHZaYm44cmorRVNjV3JMbUhRaTkrQ2Nua0JJRS9rMFl5QnJLYkFQ?=
 =?utf-8?B?dmV6MWxJZ25jd0U3UFlsRVlsQ0hqdjNTMGFyVDdwYzJUaHNIT0VRUEhOOW5E?=
 =?utf-8?Q?f6V3cOEpt8yO2x/t2/VSA4qpN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E3D4F45D241444EB4FD8F5AC5E66D06@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5710680f-e9c3-4e23-ab6e-08dc76573481
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 09:53:29.4437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SklzAa6zOaUpneFqggP7pEAr+Dhm6rZUCo+COY9DMpYE2xGRJL8As/7P8z3iX/sunEgvyAamvwiBPUlwhjTkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7772

SGksIFl1bmZlaToNCg0KT24gVGh1LCAyMDI0LTA1LTE2IGF0IDIwOjIwICswODAwLCBZdW5mZWkg
RG9uZyB3cm90ZToNCj4gV2FpdGluZyBpbnRlcnJ1cHQgaW4gb3B0ZWUtb3MgZm9yIHN2cCBtb2Rl
LCBuZWVkIHRvIGRpc2FibGUgaXQgaW4ga2VybmVsDQo+IGluIGNhc2Ugb2YgaW50ZXJydXB0IGlz
IGNsZWFuZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdA
bWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIC4uLi92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19ody5jICAgICAgICB8IDM0ICsrKysrLS0tLS0tDQo+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWNfcG0uYyAgICAgICAgfCAgNiArLQ0KPiAgLi4uL2RlY29kZXIvdmRlYy92ZGVj
X2gyNjRfcmVxX211bHRpX2lmLmMgICAgIHwgNTcgKysrKysrKysrKystLS0tLS0tLQ0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVy
L210a192Y29kZWNfZGVjX2h3LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zj
b2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2h3LmMNCj4gaW5kZXggODgxZDVkZTQxZTA1Li4x
OTgyYzA4OGM2ZGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfaHcuYw0KPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2h3LmMN
Cj4gQEAgLTcyLDI2ICs3MiwyOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX3ZkZWNfaHdfaXJx
X2hhbmRsZXIoaW50IGlycSwgdm9pZCAqcHJpdikNCj4gIA0KPiAgCWN0eCA9IG10a192Y29kZWNf
Z2V0X2N1cnJfY3R4KGRldi0+bWFpbl9kZXYsIGRldi0+aHdfaWR4KTsNCj4gIA0KPiAtCS8qIGNo
ZWNrIGlmIEhXIGFjdGl2ZSBvciBub3QgKi8NCj4gLQljZ19zdGF0dXMgPSByZWFkbChkZXYtPnJl
Z19iYXNlW1ZERUNfSFdfU1lTXSArIFZERUNfSFdfQUNUSVZFX0FERFIpOw0KPiAtCWlmIChjZ19z
dGF0dXMgJiBWREVDX0hXX0FDVElWRV9NQVNLKSB7DQo+IC0JCW10a192NGwyX3ZkZWNfZXJyKGN0
eCwgInZkZWMgYWN0aXZlIGlzIG5vdCAweDAgKDB4JTA4eCkiLCBjZ19zdGF0dXMpOw0KPiAtCQly
ZXR1cm4gSVJRX0hBTkRMRUQ7DQo+IC0JfQ0KPiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJh
Y2spIHsNCj4gKwkJLyogY2hlY2sgaWYgSFcgYWN0aXZlIG9yIG5vdCAqLw0KPiArCQljZ19zdGF0
dXMgPSByZWFkbChkZXYtPnJlZ19iYXNlW1ZERUNfSFdfU1lTXSArIFZERUNfSFdfQUNUSVZFX0FE
RFIpOw0KPiArCQlpZiAoY2dfc3RhdHVzICYgVkRFQ19IV19BQ1RJVkVfTUFTSykgew0KPiArCQkJ
bXRrX3Y0bDJfdmRlY19lcnIoY3R4LCAidmRlYyBhY3RpdmUgaXMgbm90IDB4MCAoMHglMDh4KSIs
IGNnX3N0YXR1cyk7DQo+ICsJCQlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICsJCX0NCj4gIA0KPiAt
CWRlY19kb25lX3N0YXR1cyA9IHJlYWRsKHZkZWNfbWlzY19hZGRyKTsNCj4gLQlpZiAoKGRlY19k
b25lX3N0YXR1cyAmIE1US19WREVDX0lSUV9TVEFUVVNfREVDX1NVQ0NFU1MpICE9DQo+IC0JICAg
IE1US19WREVDX0lSUV9TVEFUVVNfREVDX1NVQ0NFU1MpDQo+IC0JCXJldHVybiBJUlFfSEFORExF
RDsNCj4gKwkJZGVjX2RvbmVfc3RhdHVzID0gcmVhZGwodmRlY19taXNjX2FkZHIpOw0KPiArCQlp
ZiAoKGRlY19kb25lX3N0YXR1cyAmIE1US19WREVDX0lSUV9TVEFUVVNfREVDX1NVQ0NFU1MpICE9
DQo+ICsJCSAgICBNVEtfVkRFQ19JUlFfU1RBVFVTX0RFQ19TVUNDRVNTKQ0KPiArCQkJcmV0dXJu
IElSUV9IQU5ETEVEOw0KPiAgDQo+IC0JLyogY2xlYXIgaW50ZXJydXB0ICovDQo+IC0Jd3JpdGVs
KGRlY19kb25lX3N0YXR1cyB8IFZERUNfSVJRX0NGRywgdmRlY19taXNjX2FkZHIpOw0KPiAtCXdy
aXRlbChkZWNfZG9uZV9zdGF0dXMgJiB+VkRFQ19JUlFfQ0xSLCB2ZGVjX21pc2NfYWRkcik7DQo+
ICsJCS8qIGNsZWFyIGludGVycnVwdCAqLw0KPiArCQl3cml0ZWwoZGVjX2RvbmVfc3RhdHVzIHwg
VkRFQ19JUlFfQ0ZHLCB2ZGVjX21pc2NfYWRkcik7DQo+ICsJCXdyaXRlbChkZWNfZG9uZV9zdGF0
dXMgJiB+VkRFQ19JUlFfQ0xSLCB2ZGVjX21pc2NfYWRkcik7DQo+ICANCj4gLQl3YWtlX3VwX2Rl
Y19jdHgoY3R4LCBNVEtfSU5TVF9JUlFfUkVDRUlWRUQsIGRldi0+aHdfaWR4KTsNCj4gKwkJd2Fr
ZV91cF9kZWNfY3R4KGN0eCwgTVRLX0lOU1RfSVJRX1JFQ0VJVkVELCBkZXYtPmh3X2lkeCk7DQo+
ICANCj4gLQltdGtfdjRsMl92ZGVjX2RiZygzLCBjdHgsICJ3YWtlIHVwIGN0eCAlZCwgZGVjX2Rv
bmVfc3RhdHVzPSV4IiwNCj4gLQkJCSAgY3R4LT5pZCwgZGVjX2RvbmVfc3RhdHVzKTsNCj4gKwkJ
bXRrX3Y0bDJfdmRlY19kYmcoMywgY3R4LCAid2FrZSB1cCBjdHggJWQsIGRlY19kb25lX3N0YXR1
cz0leCIsDQo+ICsJCQkJICBjdHgtPmlkLCBkZWNfZG9uZV9zdGF0dXMpOw0KPiArCX0NCj4gIA0K
PiAgCXJldHVybiBJUlFfSEFORExFRDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfcG0uYyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2Rl
Y19kZWNfcG0uYw0KPiBpbmRleCBhZWZkM2U5ZTMwNjEuLmE5NGVkYTkzNmYxNiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtf
dmNvZGVjX2RlY19wbS5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfcG0uYw0KPiBAQCAtMjM4LDcgKzIzOCw4IEBA
IHZvaWQgbXRrX3Zjb2RlY19kZWNfZW5hYmxlX2hhcmR3YXJlKHN0cnVjdCBtdGtfdmNvZGVjX2Rl
Y19jdHggKmN0eCwgaW50IGh3X2lkeCkNCj4gIAkJbXRrX3Zjb2RlY19kZWNfY2hpbGRfZGV2X29u
KGN0eC0+ZGV2LCBNVEtfVkRFQ19MQVQwKTsNCj4gIAltdGtfdmNvZGVjX2RlY19jaGlsZF9kZXZf
b24oY3R4LT5kZXYsIGh3X2lkeCk7DQo+ICANCj4gLQltdGtfdmNvZGVjX2RlY19lbmFibGVfaXJx
KGN0eC0+ZGV2LCBod19pZHgpOw0KPiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJhY2spDQo+
ICsJCW10a192Y29kZWNfZGVjX2VuYWJsZV9pcnEoY3R4LT5kZXYsIGh3X2lkeCk7DQo+ICANCj4g
IAlpZiAoSVNfVkRFQ19JTk5FUl9SQUNJTkcoY3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5KSkNCj4g
IAkJbXRrX3Zjb2RlY19sb2FkX3JhY2luZ19pbmZvKGN0eCk7DQo+IEBAIC0yNTAsNyArMjUxLDgg
QEAgdm9pZCBtdGtfdmNvZGVjX2RlY19kaXNhYmxlX2hhcmR3YXJlKHN0cnVjdCBtdGtfdmNvZGVj
X2RlY19jdHggKmN0eCwgaW50IGh3X2lkeCkNCj4gIAlpZiAoSVNfVkRFQ19JTk5FUl9SQUNJTkco
Y3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5KSkNCj4gIAkJbXRrX3Zjb2RlY19yZWNvcmRfcmFjaW5n
X2luZm8oY3R4KTsNCj4gIA0KPiAtCW10a192Y29kZWNfZGVjX2Rpc2FibGVfaXJxKGN0eC0+ZGV2
LCBod19pZHgpOw0KPiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJhY2spDQo+ICsJCW10a192
Y29kZWNfZGVjX2Rpc2FibGVfaXJxKGN0eC0+ZGV2LCBod19pZHgpOw0KPiAgDQo+ICAJbXRrX3Zj
b2RlY19kZWNfY2hpbGRfZGV2X29mZihjdHgtPmRldiwgaHdfaWR4KTsNCj4gIAlpZiAoSVNfVkRF
Q19MQVRfQVJDSChjdHgtPmRldi0+dmRlY19wZGF0YS0+aHdfYXJjaCkgJiYNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92
ZGVjX2gyNjRfcmVxX211bHRpX2lmLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9pZi5jDQo+IGluZGV4IGYy
N2QzMjZmMDBiYS4uMzE4Njc3N2RjYzEzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9p
Zi5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29k
ZXIvdmRlYy92ZGVjX2gyNjRfcmVxX211bHRpX2lmLmMNCj4gQEAgLTU5MywxNCArNTkzLDE2IEBA
IHN0YXRpYyBpbnQgdmRlY19oMjY0X3NsaWNlX2NvcmVfZGVjb2RlKHN0cnVjdCB2ZGVjX2xhdF9i
dWYgKmxhdF9idWYpDQo+ICAJCWdvdG8gdmRlY19kZWNfZW5kOw0KPiAgCX0NCj4gIA0KPiAtCS8q
IHdhaXQgZGVjb2RlciBkb25lIGludGVycnVwdCAqLw0KPiAtCXRpbWVvdXQgPSBtdGtfdmNvZGVj
X3dhaXRfZm9yX2RvbmVfY3R4KGluc3QtPmN0eCwgTVRLX0lOU1RfSVJRX1JFQ0VJVkVELA0KPiAt
CQkJCQkgICAgICAgV0FJVF9JTlRSX1RJTUVPVVRfTVMsIE1US19WREVDX0NPUkUpOw0KPiAtCWlm
ICh0aW1lb3V0KQ0KPiAtCQltdGtfdmRlY19lcnIoY3R4LCAiY29yZSBkZWNvZGUgdGltZW91dDog
cGljXyVkIiwgY3R4LT5kZWNvZGVkX2ZyYW1lX2NudCk7DQo+IC0JaW5zdC0+dnNpX2NvcmUtPmRl
Yy50aW1lb3V0ID0gISF0aW1lb3V0Ow0KPiAtDQo+IC0JdnB1X2RlY19jb3JlX2VuZCh2cHUpOw0K
PiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJhY2spIHsNCj4gKwkJLyogd2FpdCBkZWNvZGVy
IGRvbmUgaW50ZXJydXB0ICovDQo+ICsJCXRpbWVvdXQgPSBtdGtfdmNvZGVjX3dhaXRfZm9yX2Rv
bmVfY3R4KGluc3QtPmN0eCwgTVRLX0lOU1RfSVJRX1JFQ0VJVkVELA0KPiArCQkJCQkJICAgICAg
IFdBSVRfSU5UUl9USU1FT1VUX01TLCBNVEtfVkRFQ19DT1JFKTsNCj4gKwkJaWYgKHRpbWVvdXQp
DQo+ICsJCQltdGtfdmRlY19lcnIoY3R4LCAiY29yZSBkZWNvZGUgdGltZW91dDogcGljXyVkIiwg
Y3R4LT5kZWNvZGVkX2ZyYW1lX2NudCk7DQo+ICsJCWluc3QtPnZzaV9jb3JlLT5kZWMudGltZW91
dCA9ICEhdGltZW91dDsNCj4gKw0KPiArCQl2cHVfZGVjX2NvcmVfZW5kKHZwdSk7DQo+ICsJfQ0K
DQpJbiBzdnAgbW9kZSwgb3B0ZWUgZHJpdmVyIHdvdWxkIHdhaXQgdGhlIGlycSwgYnV0IHdoeSBv
cHRlZSBkcml2ZXIgZG9lcyBub3Qgbm90aWZ5IG5vcm1hbCB3b3JsZCBkcml2ZXI/IFRoZSBub3Jt
YWwgd29ybGQgZHJpdmVyIGhlcmUgZG9lcyBub3Qgd2FpdCBhbnl0aGluZyBhbmQga2VlcCBnb2lu
Zywgc28gaXQgd291bGQgZ2V0IHRoZSBmcmFtZQ0Kd2hpY2ggaGFzIG5vdCBiZWVuIHByb2Nlc3Nl
ZCBkb25lIGFuZCBwYXNzIGl0IHRvIG5leHQgbW9kdWxlIHN1Y2ggYXMgbWRwPyBUaGUgbm9ybWFs
IHdvcmxkIGRyaXZlciBkb2VzIG5vdCB3YWl0IGhlcmUsIGhvdyBkb2VzIGl0IG1ha2Ugc3VyZSB0
aGUgZnJhbWUgaXMgcHJvY2Vzc2VkIGRvbmU/DQoNClJlZ2FyZHMsDQoNCkNLDQoNCj4gIAltdGtf
dmRlY19kZWJ1ZyhjdHgsICJwaWNbJWRdIGNyYzogMHgleCAweCV4IDB4JXggMHgleCAweCV4IDB4
JXggMHgleCAweCV4IiwNCj4gIAkJICAgICAgIGN0eC0+ZGVjb2RlZF9mcmFtZV9jbnQsDQo+ICAJ
CSAgICAgICBpbnN0LT52c2lfY29yZS0+ZGVjLmNyY1swXSwgaW5zdC0+dnNpX2NvcmUtPmRlYy5j
cmNbMV0sDQo+IEBAIC03MjQsMTQgKzcyNiwxNiBAQCBzdGF0aWMgaW50IHZkZWNfaDI2NF9zbGlj
ZV9sYXRfZGVjb2RlKHZvaWQgKmhfdmRlYywgc3RydWN0IG10a192Y29kZWNfbWVtICpicywNCj4g
IAkJdmRlY19tc2dfcXVldWVfcWJ1ZigmaW5zdC0+Y3R4LT5tc2dfcXVldWUuY29yZV9jdHgsIGxh
dF9idWYpOw0KPiAgCX0NCj4gIA0KPiAtCS8qIHdhaXQgZGVjb2RlciBkb25lIGludGVycnVwdCAq
Lw0KPiAtCXRpbWVvdXQgPSBtdGtfdmNvZGVjX3dhaXRfZm9yX2RvbmVfY3R4KGluc3QtPmN0eCwg
TVRLX0lOU1RfSVJRX1JFQ0VJVkVELA0KPiAtCQkJCQkgICAgICAgV0FJVF9JTlRSX1RJTUVPVVRf
TVMsIE1US19WREVDX0xBVDApOw0KPiAtCWlmICh0aW1lb3V0KQ0KPiAtCQltdGtfdmRlY19lcnIo
aW5zdC0+Y3R4LCAibGF0IGRlY29kZSB0aW1lb3V0OiBwaWNfJWQiLCBpbnN0LT5zbGljZV9kZWNf
bnVtKTsNCj4gLQlpbnN0LT52c2ktPmRlYy50aW1lb3V0ID0gISF0aW1lb3V0Ow0KPiArCWlmICgh
aW5zdC0+Y3R4LT5pc19zZWN1cmVfcGxheWJhY2spIHsNCj4gKwkJLyogd2FpdCBkZWNvZGVyIGRv
bmUgaW50ZXJydXB0ICovDQo+ICsJCXRpbWVvdXQgPSBtdGtfdmNvZGVjX3dhaXRfZm9yX2RvbmVf
Y3R4KGluc3QtPmN0eCwgTVRLX0lOU1RfSVJRX1JFQ0VJVkVELA0KPiArCQkJCQkJICAgICAgIFdB
SVRfSU5UUl9USU1FT1VUX01TLCBNVEtfVkRFQ19MQVQwKTsNCj4gKwkJaWYgKHRpbWVvdXQpDQo+
ICsJCQltdGtfdmRlY19lcnIoaW5zdC0+Y3R4LCAibGF0IGRlY29kZSB0aW1lb3V0OiBwaWNfJWQi
LCBpbnN0LT5zbGljZV9kZWNfbnVtKTsNCj4gKwkJaW5zdC0+dnNpLT5kZWMudGltZW91dCA9ICEh
dGltZW91dDsNCj4gIA0KPiAtCWVyciA9IHZwdV9kZWNfZW5kKHZwdSk7DQo+ICsJCWVyciA9IHZw
dV9kZWNfZW5kKHZwdSk7DQo+ICsJfQ0KPiAgCWlmIChlcnIgPT0gU0xJQ0VfSEVBREVSX0ZVTEwg
fHwgZXJyID09IFRSQU5TX0JVRkZFUl9GVUxMKSB7DQo+ICAJCWlmICghSVNfVkRFQ19JTk5FUl9S
QUNJTkcoaW5zdC0+Y3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5KSkNCj4gIAkJCXZkZWNfbXNnX3F1
ZXVlX3FidWYoJmluc3QtPmN0eC0+bXNnX3F1ZXVlLmxhdF9jdHgsIGxhdF9idWYpOw0KPiBAQCAt
ODMxLDE2ICs4MzUsMTkgQEAgc3RhdGljIGludCB2ZGVjX2gyNjRfc2xpY2Vfc2luZ2xlX2RlY29k
ZSh2b2lkICpoX3ZkZWMsIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqYnMNCj4gIAlpZiAoZXJyKQ0K
PiAgCQlnb3RvIGVycl9mcmVlX2ZiX291dDsNCj4gIA0KPiAtCS8qIHdhaXQgZGVjb2RlciBkb25l
IGludGVycnVwdCAqLw0KPiAtCWVyciA9IG10a192Y29kZWNfd2FpdF9mb3JfZG9uZV9jdHgoaW5z
dC0+Y3R4LCBNVEtfSU5TVF9JUlFfUkVDRUlWRUQsDQo+IC0JCQkJCSAgIFdBSVRfSU5UUl9USU1F
T1VUX01TLCBNVEtfVkRFQ19DT1JFKTsNCj4gLQlpZiAoZXJyKQ0KPiAtCQltdGtfdmRlY19lcnIo
aW5zdC0+Y3R4LCAiZGVjb2RlIHRpbWVvdXQ6IHBpY18lZCIsIGluc3QtPmN0eC0+ZGVjb2RlZF9m
cmFtZV9jbnQpOw0KPiAtDQo+IC0JaW5zdC0+dnNpLT5kZWMudGltZW91dCA9ICEhZXJyOw0KPiAt
CWVyciA9IHZwdV9kZWNfZW5kKHZwdSk7DQo+IC0JaWYgKGVycikNCj4gLQkJZ290byBlcnJfZnJl
ZV9mYl9vdXQ7DQo+ICsJaWYgKCFpbnN0LT5jdHgtPmlzX3NlY3VyZV9wbGF5YmFjaykgew0KPiAr
CQkvKiB3YWl0IGRlY29kZXIgZG9uZSBpbnRlcnJ1cHQgKi8NCj4gKwkJZXJyID0gbXRrX3Zjb2Rl
Y193YWl0X2Zvcl9kb25lX2N0eChpbnN0LT5jdHgsIE1US19JTlNUX0lSUV9SRUNFSVZFRCwNCj4g
KwkJCQkJCSAgIFdBSVRfSU5UUl9USU1FT1VUX01TLCBNVEtfVkRFQ19DT1JFKTsNCj4gKwkJaWYg
KGVycikNCj4gKwkJCW10a192ZGVjX2VycihpbnN0LT5jdHgsICJkZWNvZGUgdGltZW91dDogcGlj
XyVkIiwNCj4gKwkJCQkgICAgIGluc3QtPmN0eC0+ZGVjb2RlZF9mcmFtZV9jbnQpOw0KPiArDQo+
ICsJCWluc3QtPnZzaS0+ZGVjLnRpbWVvdXQgPSAhIWVycjsNCj4gKwkJZXJyID0gdnB1X2RlY19l
bmQodnB1KTsNCj4gKwkJaWYgKGVycikNCj4gKwkJCWdvdG8gZXJyX2ZyZWVfZmJfb3V0Ow0KPiAr
CX0NCj4gIA0KPiAgCW1lbWNweSgmaW5zdC0+dnNpX2N0eCwgaW5zdC0+dnB1LnZzaSwgc2l6ZW9m
KGluc3QtPnZzaV9jdHgpKTsNCj4gIAltdGtfdmRlY19kZWJ1ZyhpbnN0LT5jdHgsICJwaWNbJWRd
IGNyYzogMHgleCAweCV4IDB4JXggMHgleCAweCV4IDB4JXggMHgleCAweCV4IiwNCg==

