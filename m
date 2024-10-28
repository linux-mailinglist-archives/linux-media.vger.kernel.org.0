Return-Path: <linux-media+bounces-20380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 556209B244B
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 06:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE821F2194A
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 05:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE5118CBED;
	Mon, 28 Oct 2024 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KKxCKzpa";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="IX/O8pFR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA81DA5A;
	Mon, 28 Oct 2024 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093659; cv=fail; b=UJNouXrGdPZe1zyDV/G3KM0jGFSMPIbfVpvP+U8QKxdZpP3AjS5MlyRp3CSgz+fE1xFzLgmb/1Q0D3TlsbJ+8ukez+pwfro8wrB7tz+LgwwOVT78aczLBNf5on1f/82a+yQao+HF+wSGMDRSxuZnGZC4X1hMIeJRkH/ga1jkKWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093659; c=relaxed/simple;
	bh=+r+fAd4vNxm6/AO4W7MSpl4pT+vNd9ypdUN5u8/jpXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WB4L4ssKapeWtlox1p1t1Z8wOtXnHJ3QJwqcpo7C+2n7WiQ+0ADRJZAZDhlMN3uixa/zscgzU9mnmcy0Fr2ExwIbPNQ+uOJlVgDuJmNNoq4yVw4vcP4reZaZm1TFjn9QDWwRyGILCn7wo26HppshXdYSG/JMAA97/Yxv/amWzy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KKxCKzpa; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=IX/O8pFR; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 421c13ce94ee11efb88477ffae1fc7a5-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+r+fAd4vNxm6/AO4W7MSpl4pT+vNd9ypdUN5u8/jpXI=;
	b=KKxCKzpaPa0DMu/QOTU6D89wY616DjvHHWd6PXk+ar/ie44CkkEfAj0ZruHJhapZegwxghsvF4VUudGQ9AELcEbmqXxztjRTMdheInnISG0JKByk3hyd5JSuf1Hhl90IEYIe98bKVsD05sES0PBMn+twPsO4BfvQt4fF/t765u4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:7ef00c4f-3e5f-47d2-b3b4-b36bb957e21e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:557b342e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 421c13ce94ee11efb88477ffae1fc7a5-20241028
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1812202449; Mon, 28 Oct 2024 13:34:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 13:34:09 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 13:34:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ7chN3EN4kA6gJJf0rFHJ+jvrNFZQV72Sh6b7y7rfKYEdqhfLUy7UGqFaF+o+OrWl87nBdSf99rshelJa7h9ribZbTKCdp01Z+UjMLg0V1Qh0r0nhObdrb+5Hs9kFRNf4CH1VgzWFDtB1NBbLRaaHadWsj3mMUg9J/IXS5obbPfq1PV0Lxz6uV0ZSEcDWjhcZILEJNHEOyjQgvfx+dn5gk1qhxzw0rhLvUQmgUBN/A7Bnil4Dj8uHeUKoYjnTL0u/V00uMjI2bq8GvthRtmcHbWHLcJPWeFeAyqTBM6P0YNnTHIpivjxqkffiiTQks9zfBWavV4zCgzfO9tBMdW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r+fAd4vNxm6/AO4W7MSpl4pT+vNd9ypdUN5u8/jpXI=;
 b=RflnaROGh/aipkJ8TPBHRdFVksZ1z1Uy2FcamhsfDhqXjgDOK6maUlmrYt31lj7lRqWGajzTd4tWhUxScIG1LURCo8nxt/uTSi30pc8h9IaYL2euYLxmbrJ3baFGd8VqkDitOX5L0dI2sWqr5QHaP8TO6+lWt5hjl/l2Kmc6LxT6mTXqm1n6RmiaM7RJVa0Aw/FdexViUsIlw6hBdYVly+Gd5ZJ+s211Qz95jEG23aCuRnuzK5rzwA9eGsbr98L6ScA4Il7Xtg7S2Du9rDdPob7sRL//+iut0aMYoJGqgimt07zGj9TXME+Dj9OusodhZcDQcfgL9EqyrEjxeBJktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r+fAd4vNxm6/AO4W7MSpl4pT+vNd9ypdUN5u8/jpXI=;
 b=IX/O8pFRpPxaKuPOGK9eKwH7Xgrh4L1M62JiUUQKY09Jzwmai9+Y2SUQ0jllSxLMDTlf+2aJmuFfmY51e2hTtchzPlrQIciNo3H1BFPQu7Ifn2dMv54i2uvVmLPLaatzzbqXu7/pwVHsx02tyUrUD2XIrCqgd0WsGmJ0lVi+tGE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8204.apcprd03.prod.outlook.com (2603:1096:101:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Mon, 28 Oct
 2024 05:34:04 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 05:34:04 +0000
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
Thread-Index: AQHbGj2y1UKRq3h+wU6S0U6tpTQ9lbKbwYOA
Date: Mon, 28 Oct 2024 05:34:04 +0000
Message-ID: <ec7f2fe029cfebc06e047f9f91f8e37c671a8ceb.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8204:EE_
x-ms-office365-filtering-correlation-id: 7ebab8d9-1453-4b6e-d2f1-08dcf7122295
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?alhDdFVYclhBZkcvTFAyL2ZZWTJ1Ukl3cStLeTUzc0xiVDhxb0NoMGQ0RFl1?=
 =?utf-8?B?aVptWVMvdG9IM1pwL091QkY2dk45aVVqbGQzdmFLV2ZnYTRhcWhoQ0hlV3VI?=
 =?utf-8?B?VytzaEEveldyN21lcFhvRWdtd2FCbDk2WVVoMjgyell3VS9PaHU4Y0RCb2E0?=
 =?utf-8?B?Q1lBZTVjVUdJenpEV3doYTFwY0FRU0YwY1dPSjB5ZmdIb01UcGRFZlNPVGdn?=
 =?utf-8?B?a3JBTHh2YVZSLzdWUm1sQnNVYzN0amlUNWJDS1ROSHdXTytlSkhxZDNqZmFm?=
 =?utf-8?B?WnZzUU9wV210bExkaUJWaE50Nld6ekMyeW1zV3NtdkVCU1Y0NVJSMTJxaWNx?=
 =?utf-8?B?dTlTeWVpd01QZjVabWx3UWJCczlQR0FraUNrMnpwWG1SaDdDLzZML253ZTRI?=
 =?utf-8?B?OGpyTXBCaEgvaXE3QldmNEZnNC9DVFRiZ3lWT0JOUUdDUldzY25jSVR3MTdB?=
 =?utf-8?B?Qlh5cWdyRnFTczAvcURlQTZqeHovTHdQN0JybC8wSUtTL2ZZdlpRemJTVWc5?=
 =?utf-8?B?ZjdxQ1pKODhSWXhqd3JXMytwWWpDMUNPWjJ4MktXMGpPL2tCTkdvanJoYmlV?=
 =?utf-8?B?c2VxbkV4UHRJZThFU3NoV2t2YkUzcExyZHRCang1VEpZSUFobGJMM2ltVnZT?=
 =?utf-8?B?cXo4S0J5T2c3RTB4aHpDNWJaRmM0NDUwL3JNa3RZc1RXdWlPVTRpVDZYS0lq?=
 =?utf-8?B?M0loTmJIeEJpeEFYbUhPWEpUbit1QXdJRjRzYXJmd3VWd2dkU0szT3EyMnZj?=
 =?utf-8?B?TmN5MGF5S2VtWDdMVUJEMlJFcWhLR21Uc3RXOEQ2RFh3N0lPVzlxY3J1WGNS?=
 =?utf-8?B?d2U1Nkc0Y0tzZlZFV3orc3hSbG1WSENyWUJiaUJVRjhEc1AxMTEwVXIxc1Zp?=
 =?utf-8?B?cHVCbk1Ed2Nhd0tRSytJcmNVWWtEazFyUGp4Q0doUE1yd0JlWFVzTmhXZ3VN?=
 =?utf-8?B?dHd5ZHVIbk5vUklPZFNVRWduWUlDZ3crbFBLQk9sTm1oRnVwaXFaWXlIYWpr?=
 =?utf-8?B?NkZlQjZ2RSt0UE9Ndy9qU2FDamtjRG00SzIwVlc3M0s3THpMNDJmL1UyaTM5?=
 =?utf-8?B?NzRrVWdtblVjbndscmNRSE4wRGlIUnNqdmVsaEx1dUVxS2prb2QzMVFBZURM?=
 =?utf-8?B?cGNjTUh1TFB1eTBDNEt3bEg2THZIaUdZOVpYUi9LUEF2NGZETmF0Rkx0M1Qr?=
 =?utf-8?B?MCtOMFhsczNYVGFoRWpCb1pCMUJNbG9ZK3FXWnI2K0NsVzZEUDkxUUxWakpL?=
 =?utf-8?B?K3Y5WE9lak92V3RZR0NhbmdtSDdnemxhTlZPbmh0eENsRmo0aFo1KzhNKzIx?=
 =?utf-8?B?WWR5YTk3QjE5Q1V0eml0K09DR0RoMDVZb2RtUEw5RHZPRDNVYnNIUFlCclBo?=
 =?utf-8?B?ek5rclZ2SEtmQ0YwVDBEeDVPVEExaTNsTlhlSnEvVFhiVXRMenZIeFVaWlpI?=
 =?utf-8?B?NUhRNDJQQmhZYm1rTDFTZUNDbHI1UEtGa214OHZ6NGJmREJZczc3WmRFc1JS?=
 =?utf-8?B?WEtqQ3pqK1hjOGNjNFkrQ2VRRDZxMStJVmR3VUxsakZRaFh4bmFFc3Q4NzZ3?=
 =?utf-8?B?azlodTlYemtQQ1pkMy9oYWYxWUpRVUh2VUdFVUVHSUhWOUdnUjdjaCtLdUNV?=
 =?utf-8?B?RmxKaWhFZTJOVFZ5YVlBeFY1TC94T1Q1VkwvSnhPYnptRW43c1hQZWFJK1Bt?=
 =?utf-8?B?Ym1wWVFudUoxZmNBdEhzOGdpQ1kzRXBnbTlELzlYV0JveTBoTlJLQ3h5dGRq?=
 =?utf-8?B?bFVmSERkMHVMMjhtYUVzYTk0QlZ6L1ZNZEplNWFNK2xDeVFBdisvaUsxYzdP?=
 =?utf-8?Q?VEtmfwKxVrIWJzXJc13XE8WUNwh210wwQLyLs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmJtOUo2RWd5Yk4vSDc1eVVPMm84OExYNk1qMStDZENZWTNIdHdsOU5rMzQ4?=
 =?utf-8?B?WWhOUVN6VUFCaEU4dldCc051NTFYL2JhY01IVFZFb2pBRllYUmQ4eDRDaWMv?=
 =?utf-8?B?dEovd1Q1VThBU0ZWOEFYUHVISGFSZ0h5YlA5RE9jSnh2VXh2ZWhTNTM5bzJC?=
 =?utf-8?B?NUdxOFM5NWVUZEVLUENsakNUYVViaHFsc1FYZklXazdaQmtXZGRXUjlCVkE3?=
 =?utf-8?B?Nzk5UTJzUnR1S1h2RTJ4Z1J0SWRTVDhmOUZxbXFGSE52b2lodE5JeDloRjVN?=
 =?utf-8?B?M1BkR0ZNSlh6WlJkMTd3V2NGQXFUS3pCRElPU3hEZEowWnAxTUFIR1dLYkda?=
 =?utf-8?B?eXNiRTNuYVBCOTJKKy9QUmh1R29mOFRINS9rMmdBQVo5bmpmRGJ4bTJNc3Zj?=
 =?utf-8?B?MEJodFdERGxHNFVScHdYdTFSL2VKdnkwSmdkVlVDNzJuLzd0aGRrTjVOTXR5?=
 =?utf-8?B?cUo3NDBqdzROWmhhWVVNOVIvcjUzL3VJdWxFSlo0YWpENVdkcCtjWFQ4ZU4w?=
 =?utf-8?B?ekhidW1Za3dESGpyRHdlbWt3T1F4MG4yaUZhVkorbW9LcDRCUTlDb3lnd2xB?=
 =?utf-8?B?TGFwWkdzUVl5dkFzeXcveHRNUlh6Y3MzbG5QY2VpT2E3RUhPMWJQbmtPYmNs?=
 =?utf-8?B?ZitFNVRqbVBVWVN6aDJoTG93Y1JhOEw2Q2xGd2ZGaHVqQTJsWGJtSkVVVklF?=
 =?utf-8?B?d2ZWS0l2aHBqVFh6anExbkdlVElxZHpjd1RyTWlhLzFKY1pZNXVnOWhGcU1t?=
 =?utf-8?B?OW9ESmdjdEhXRG9mVHpndFBBMWd5d0JDQVRkVERFR0F3c0N2a1lIRjR4QU52?=
 =?utf-8?B?SEYyWE5wNTNRR1FqNnFiOEFhUjVybXI5Wi96RWRQK0FSNnVVYVhNU2x1cmp5?=
 =?utf-8?B?UnpaOEc4YXRIU1cyMjBvWjR0TTJuMThaaW9FaktHWk40TEp2YkhGZWlmQnlZ?=
 =?utf-8?B?dHBlWXpiNkl3Yjluamt5Um9VN21wa1RyRlJ2bGl0TXVVV2ZoamVYUldydGlQ?=
 =?utf-8?B?WGw1UjhsQVBvN1BidHZtUSs5M2xvVGJidzNwanNpazdpTWUyYktxUm05akRM?=
 =?utf-8?B?ZVdCZDhGNExRK1I3NkNzbDBJOFFBUFI1ejJVc0NPZlZsYzNJVTFZanZEaG1J?=
 =?utf-8?B?ZW1jTTNaNVFMUmQ1L3pUWlJqRjNEYnNBTHRMT05mcTFia21HNVNVajQzL3Fz?=
 =?utf-8?B?aHRWcUJ3QmlHN2w2TmpFb2xLQ3dMK1hMVEJkYkRFMmhFSkNTNTVZbFUyODZD?=
 =?utf-8?B?MXhVUFZLSVpPRk9SU3dWMEE0YmN0OTdqa1JZZ3NoaFR1MURTaGNRODZza2VE?=
 =?utf-8?B?MzZNbFYxVWMvRnlJKzZMWGxjUVNmL3lJOUxJZGM1YUMwb2hIM1hnT0lta0dk?=
 =?utf-8?B?ZmJaNlRmUU9IeXpOcUovckJaZGZNMm95ZHBPbHlNemNoK1JPSXNxSk9IWWNj?=
 =?utf-8?B?WVo5ZWVoUUFhdnhsVStlZm5PemdzbUd3alVRVlNjV2N1S2p6WEdwWTUrZUtX?=
 =?utf-8?B?TW9OcXMvVVVVQzhncXBmb1hWZlpYUXZkME9DUlFibFpHQ1BwNUpjWWlCRFdw?=
 =?utf-8?B?SzIwWFF3LzFYMC9pc01xNXpNWjBnak4ra0VxK2VuQjh4clZiVXpONkN0RkRT?=
 =?utf-8?B?NFRSNkNna0gyQTh6UVhQTVZ0K1czZmp1TTdXWDhPQU9FWVlKUXRJUXRqNTFD?=
 =?utf-8?B?RUV4Um9NOEpURnFXWkthN01zdHZqV21CL2VpRS9PMVpKcld4aVMzZm9ERFVR?=
 =?utf-8?B?RW5PdE5RTjhET3p0U3JJK2lrVG5MZWRTSmpjdzFWck14RUY5UU5OTmxwbjFC?=
 =?utf-8?B?QmFzV0MzcXV4c1RzSUJZWlNRdkdUWVhSQ21GT0R4K1FVSlBpTTNTM05ScGQ3?=
 =?utf-8?B?d3RjcnAydnFuR1BNdzRmRWUwL2U1VkVIWmpsWVlmaU56aVJOeEJKLzlhSGdG?=
 =?utf-8?B?ai9SMU9LcFVKbzZic2E1Szl0UGNCdy9CRWZ6VEpzVVJtYnZzZ296ZWp1RG9v?=
 =?utf-8?B?MXkxYUNhb2NDUlZPbEkzbzNaMyt4T3NGR1plMGh5N04zdExxS3Z1QlJFdkcv?=
 =?utf-8?B?YnBBS1J4cXdCT0k3eXNmV1cyazQ0eXNXeGQyd3o5THFQMGhNSHZYRjRQWkhE?=
 =?utf-8?B?UUt5NnY5RkxQS1RhYkVNVXhpNVovOFlGczM0VGhXMjIwUG05ck9zdHozRjlV?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9983BAF160D6F48A2FF98640BB5F23B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebab8d9-1453-4b6e-d2f1-08dcf7122295
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 05:34:04.0866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01rOdJDcsggFdYjAcqT+Jwjkkf2HuxuiuM6eQOt2xq8UFkSaciR1flafOZdjEY/kgitFL4ToBzo2iLPYlild+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8204

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHN0YXRlIG1hbmFnZW1lbnQgYW5kIGRl
YnVnZ2luZyBtZWNoYW5pc21zIGZvciB0aGUgTWVkaWFUZWsNCj4gSVNQNy54IGNhbXN5cyBwbGF0
Zm9ybS4gU3RhdGUgbWFuYWdlbWVudCBlc3RhYmxpc2hlcyBjb250cm9sIG92ZXIgSVNQDQo+IG9w
ZXJhdGlvbnMgYW5kIGV2ZW50cywgZGVmaW5pbmcgZGlzdGluY3Qgc3RhdGVzIGZvciByZXF1ZXN0
IGhhbmRsaW5nLA0KPiBzZW5zb3IgY29udHJvbCwgYW5kIGZyYW1lIHN5bmNocm9uaXphdGlvbiwg
ZW5zdXJpbmcgZXZlbnQgcHJvY2Vzc2luZy4NCj4gVGhlIGRlYnVnZ2luZyBtZWNoYW5pc20gZW5z
dXJlcyBzdGFibGUgb3BlcmF0aW9uIGFuZCB0aW1lbHkgZGF0YQ0KPiBjb2xsZWN0aW9uIGR1cmlu
ZyBhbm9tYWxpZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1o
c2lhbmcuWWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtlbnVt
IE1US19DQU1TWVNfRU5HSU5FX1RZUEUgew0KPiArCUNBTVNZU19FTkdJTkVfUkFXLA0KPiArCUNB
TVNZU19FTkdJTkVfTVJBVywNCj4gKwlDQU1TWVNfRU5HSU5FX0NBTVNWLA0KPiArCUNBTVNZU19F
TkdJTkVfU0VOSU5GLA0KDQpPbmx5IENBTVNZU19FTkdJTkVfUkFXIGlzIHVzZWQsIHNvIGl0J3Mg
bm90IG5lY2Vzc2FyeSB0byBkZWZpbmUgTVRLX0NBTVNZU19FTkdJTkVfVFlQRSBiZWNhdXNlIG9u
bHkgb25lIHR5cGUuDQpDQU1TWVNfRU5HSU5FX1JBVyBjb3VsZCBhbHNvIGJlIGRyb3BwZWQgYmVj
YXVzZSBvbmx5IHRoaXMgdHlwZSBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gZGVmaW5lIGl0Lg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiArfTsNCj4gKw0K

