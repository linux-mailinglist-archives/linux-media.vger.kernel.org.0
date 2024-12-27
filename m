Return-Path: <linux-media+bounces-24108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DF9FD08C
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2091883782
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 06:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A168813AA53;
	Fri, 27 Dec 2024 06:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cXQf0Cu5";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="b0igMdE4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B212A920;
	Fri, 27 Dec 2024 06:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735279537; cv=fail; b=BSaJx4fBK/BK9Gh0fcd/UYmKoW8dHep8J5sL/Y+3Wsha7DIj0FZTmF/fTDwJmE08HFPNT1YtHcvSrESXkGf8Pbbn3Bixh5ywIVrcDN9PLB/dRUi2pLh5vo9X9vbc48VQV9Rp0p40vHliiq2nj89fORIvY4qDmaYMZ2EVgJNrd58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735279537; c=relaxed/simple;
	bh=9yh0byNiSQIRdmP7TbjYJSPcBzx7myDTUsepCSk7ruI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nSv/DxcflkvwwH61Ct6gMtc6/XdtW7BWU0dj8xWZJJF8yZHX51cZcq9v6yNyQ4ZNphtn2RdrZBDphDvvSJqCqqkhk+utCT7cSfuJ1DQ7lTLnIZrQwa4QN/hx1yOeiKOKn95KDuf8XyTyNWlFYOgExRnf40WShyaX4lC67t6q2tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cXQf0Cu5; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=b0igMdE4; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 92149f64c41811ef99858b75a2457dd9-20241227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9yh0byNiSQIRdmP7TbjYJSPcBzx7myDTUsepCSk7ruI=;
	b=cXQf0Cu5q0DE7hu/1Eidajcuyd+QMu5FBqy0sYVRhDnhlEcZYYWwN0woiiRriJiV+mF6Z4Oqli88bSJP1xLjFiYe71GsE6nwc4ZseFGef5PI/+sZ4kq267IUfFNeIE/FEbIZ1sCW7JIkP1JGd5hTYrTKToVsTgBnPyGc87KiUN8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5279cccb-a51a-4ef0-82c3-90995bab0778,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:e9f5f118-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 92149f64c41811ef99858b75a2457dd9-20241227
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 41281716; Fri, 27 Dec 2024 14:05:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Dec 2024 14:05:26 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Dec 2024 14:05:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8R9qJGgXKTDDuUJbgDW/Bu8b5v0npTIZbIM3wQEd/IjW9dkkwn/ozS6UBov0vfnTMUbHPqsaYTmI+AzBwWKzfpONl8AB3vlHpo0+dzJfXsNrK5NrXEb5RqZZwcE2PK+0gR6bAcj87PRV7pj50dDhPT45CwwJN0EHK9y5c5NMChAssmYrPrkCIcgqjCzrhOsgjF3Csa8BVT2wVH/XOh49CS6VnfdJp4EspbOpssrzovbWAnXBkVHBh6LaZoktcSORZyGpaI3yxjEvhIXM2P+IEA4k055vinSNJL/U8/9rELizr/WQormq4Tnk0TlnPB+S9TPCLotbYRT4nDzOlcJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yh0byNiSQIRdmP7TbjYJSPcBzx7myDTUsepCSk7ruI=;
 b=A62Iq3wxjtKeIcToo8z/bN7Qc2RwSFseZupizigNFBZLkHAl70GyNtRXNrZjVBqIlFfccQc6oaqanGGLplMambTgzmlHBnzF3+k+qWzUnZAk+BSQNJHUTrvFHmTCSXGFg/8xBkL1rK0xgOEmUKb1U2i7afPFgvyvsJ3ywt+djNmq/2YSybClku/gzrrKC3Ij1wnf7DZzjtLU4qjltOwcg92JqrCuzD/BHFp3t2ioeHOEaAPC6jKFVb3i3ir55FAVDqDq3wzSra4PcXEUZ4yQU5hXeDZgT1ccO8h6+o11battoQ9Df77K+vuuKC5lABGcaKI+I25DhQNdYpGfT6CdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yh0byNiSQIRdmP7TbjYJSPcBzx7myDTUsepCSk7ruI=;
 b=b0igMdE4wtVefL2XT8Q7UUA3DGhinZO9NDVHFneUgNou/pqggmQAK5LoSVUM4qRPkLzJxADRpW5mP2chbuf9QGAk7Nb4wAN4PLZDRoqeQQNrwfjW0AOgSZuKBnc9f7w0x+JlQ3GLdMoXJyMN7FeXTZ4yte1xiJUtTry6zjivROQ=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SEYPR03MB8379.apcprd03.prod.outlook.com (2603:1096:101:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 06:05:24 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8272.013; Fri, 27 Dec 2024
 06:05:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5nUmA
Date: Fri, 27 Dec 2024 06:05:24 +0000
Message-ID: <351287f9e8a118babd225fb0e484976bef3db6c0.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SEYPR03MB8379:EE_
x-ms-office365-filtering-correlation-id: d9897d34-02f8-4fa1-8283-08dd263c7409
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z3NVSnAvT1J1bGNlUzBmN2pHYU5DQm9URXpPWWxmVkdWVVVHM0ZtVFJKTVho?=
 =?utf-8?B?ZEV4ckI4OFlERFM1R3Rib3ZpN0Y3TU9IOFlzZFNSVzFtdU1HcVJXV0VRT2NB?=
 =?utf-8?B?b3ZOLzBPWWtTZ0RWRFY3cytLYUtHTzR5YVJab3h4T1hvdCsvNnZjcUlCOEhV?=
 =?utf-8?B?Y3dESmZnYzdudTlnQjVQV215K2FBR1U0dXpIMGtCcGhiaUY2dis1NEtva3BB?=
 =?utf-8?B?NEd0NCtWMTBaaVRIcUd0QkpvcloreU9ncEl2VzBIN1UyblNwdVordUliNjNv?=
 =?utf-8?B?M3ZwMXhqOEE5dkdJTCt0ekdIVEl4c1ZtYmd6ZktmUlUycFFpdWhydUxpS05T?=
 =?utf-8?B?UDlQTEZXMWlHd1U0YXVMMlFHYVJOSkJiVC9uRGl0SkE4VmNQZFZ1TWNwTzNV?=
 =?utf-8?B?d0lvWnJvbXh1elVBcmFZYXNQeFdCZEtic1ZudjVrV0kzTVNPdjlrcHA5c3VK?=
 =?utf-8?B?azh6TjNnUGhaQUxkQVlVVHZSUGhJRVhEOGg5MTJWNXNNOEZKdWJNK1FkVkw2?=
 =?utf-8?B?Y0dsZUgydHdlSW5uWFZnaFVxVzhYbjN1RTI2Y1ZQdUYyUUxxaHJuTFY1WEd1?=
 =?utf-8?B?bDVpdGhMNjlKMzJTdmlhalZMSG10M090VFJoVlk4ait4YTk5ZEpFWUhvNGlX?=
 =?utf-8?B?MmJ3OUtWRlN2czdsV25pTVczbmhJMFVuT3p0eW5IUG5HMDN2RUptdzdmRjdD?=
 =?utf-8?B?Y0VFbitQWnJ4aEdyYnlOejVydGFpWGRoVlViQjdmc3p1aW1wTHpISnJHQ3Rx?=
 =?utf-8?B?a3ozclRnT2lsQUpCWnNvaTkwZ2VyakRlREJkT2hsYkhEY2craUI1TVJBUlln?=
 =?utf-8?B?bGtUSFhjOWtIVWNzaFZiaVc1NlExZmtvV1RINEVBUFAvQ2t0UXBXUm1tMDFJ?=
 =?utf-8?B?eEpheFB2Q0ZMOG9EaS8rQUg2S3IzNWNQRnZ1Wm9kVXpFZUZ2ZU5ySEM2bldi?=
 =?utf-8?B?N0owUFlxd2pHZHdDUUU4Y3pYVHRrczM3TFY4YXlkS0FqQisxRm4vaC95L2dy?=
 =?utf-8?B?MTlzd0hqdksxbUg3V0pzSktVTUJlRFpvbHNYQXBCMnJ3SURMZzhpWWxQRy9y?=
 =?utf-8?B?cHV6eWc3ZlVvVCtWakUwcmg4bEZvMXJCL3hTZjU3VWZoUXp1NTBtZk9pSDdC?=
 =?utf-8?B?a0ozbjRZRUpSVDVGelNNK21aTVY5VXliTmtBc29RKzVkWGZiUGJjc3FkbDR0?=
 =?utf-8?B?cDEvLzQxbzJPK2UxQTdZcHIyaWVaV0lkbU9DUStpMnQ1VEpwWUJsU0prLzd6?=
 =?utf-8?B?TlY4SUY4bTJNakpBUTlkRHZlelJWWElSVWtQdjloS0VkdVJmcVQ1ZCtVSXpw?=
 =?utf-8?B?aGhmSVByU1ZNOWtHQWxiWENBYlMwbmlrVEpiQlJvKzNyTWJsU1lISmFlM3h3?=
 =?utf-8?B?RXl3dG01a1lvWWdwZVQxdXovbkc5ZVFUb0VoRG4vNnpvbVo2ckZlZ2toU1Rx?=
 =?utf-8?B?VE0yMFpDNlVuYlRVTjhBWXIrOWtuTC9rL3ptRzRKOGJqSlFpUGM2d0wrZyt4?=
 =?utf-8?B?eFdwYmFKVThQTnhOVEQrZWdEWUJTSWV4L05VK1ovMEVkQ3FIT0dFeU90cGln?=
 =?utf-8?B?dU13UUFyZlM5am1mWUkzWkFhempNL2JHdVZianF0blZkWjd6Zyt2QVV2dVV5?=
 =?utf-8?B?VWFhamFCeGdkVThPTlNhUkhvYXFtaEkzSlhXRDhSandXK25KaTZhcjN6UFI3?=
 =?utf-8?B?cXI2eHdEeFdueldWMXpmdThjTTdSRUxLaUdoMlllS0FsMnhyWmFqZGwzMG5L?=
 =?utf-8?B?N205R3phT3dCWC9SaVo0M1JVTmcyN3pYcFMwcXBMMy9YNEUyOUhIUHl1Y24z?=
 =?utf-8?B?N2ErU2k1Q2JLdzVKSTVCZ3dTNGdYZWxMcFU3SUtLSW44dmlYbWp5VllQL2FO?=
 =?utf-8?B?V1huNytqcSt4Z2tPNTVFcXVrVjNGUnV0anFCUXdZclFjMVZtcEJsbEVkeUo2?=
 =?utf-8?Q?6HSNdKfKV0JGoVKo+5rBDlwG4ZPV3Grf?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXgyRDRPMUg0dC9IOXJSelM4S1FYRkM2RWVieHpYSlFtTHF5MmdFTW1XdVVE?=
 =?utf-8?B?dWxMZHBVQ1UreUJIcnoyR3VtOEVJNnZ2OTdvdFUydUNxS3RnaUVhSnNLb2lx?=
 =?utf-8?B?U3NpNzEwdGsrV0w2a3d3VzBodWhJRUZ0U1RDeVlhRG8zTkZEZ1RpWU9TMGdG?=
 =?utf-8?B?OWlmazNLY25nNDNFenpKOTFJdnZ3a3E3anFzOGsvSWJkVFBYdjAyQnlOZ2FB?=
 =?utf-8?B?YUVqbFlmWEFhaWxEYko5UzdrMERwWHZlWkw4OXZZRnR3TW0rZXN0T3ppU1FJ?=
 =?utf-8?B?cFZlN1dvbkg4MzdQa05hZGQzdHd2ODNWZzNRTmFtR2Rva2h2bkdLUGN2STVp?=
 =?utf-8?B?d2lYUXpoMnlBL1ptUVFCS0VTNi94RUpUQkFkUzJidmVhQmdxTXdBSVFWV01G?=
 =?utf-8?B?bnhzWjJYMGdFdFBMV3NqcXptTFRocERBc2xHMkh4YkJGRHRyQzJ4aU4vUzNp?=
 =?utf-8?B?Q0IrakRBdUttVG1vZldTS0RRV21qWFVSU0phdi9ML0dNV284THUyYVhmN1JX?=
 =?utf-8?B?RjBGcmxKSGxCRm15VEQxVncvUDdPVTlZZ3lNclZNc3g1UThFSDhDWi9ZUjI1?=
 =?utf-8?B?N3VqVUlWd0E2SGlrV0ZVanZWWExYZ25IL0JPVVBjZytTMlhVV3dSbmI0b01P?=
 =?utf-8?B?bDdqYmVIZ0NqTGovWHZYbGlyOUFHbHdXcUUvZCt3VWJCQzhaMk81MUJEcW9E?=
 =?utf-8?B?eHVHT0Y1V21tTjl1T1pBVHhzSHFmYzJnakVPZDExbTlYcmtmWmFOckNMS04x?=
 =?utf-8?B?am5yZW5kVkJLam9VZlJpU3lHVjNzdGdDV1hqdnRXZVZ3aWFjTGlyYk5ZM1ls?=
 =?utf-8?B?dzJod21sYlBUQzZRbXpkZXROT3BOU2k4UFNCbURsODJuVlU4WFltdnhwNExi?=
 =?utf-8?B?czFnNjF6UjZTbWE1bU9MMjY0OUtkOVBrNHhodWFmd0hzRjVhVWs4dzNLaEw5?=
 =?utf-8?B?UGFUVnFjMWVsZFduMXBFUXpRSEhZdGVEeEczdHc4ejVpWFJnRnZBQkJqRlVz?=
 =?utf-8?B?SmVrdlYyTmI5ZDJqd3pqL2NTV3BTTm5sY3BNRnNTdVV3RXFvS2h2dVc1aDRE?=
 =?utf-8?B?THhjaWNRNWhOQkZMRmhxV1hyQ3hWcUVOK1RsOG14Z3E2TGIrWlR5Q1FIMERl?=
 =?utf-8?B?VXdPVU5BTlhvLzJCK0xKVU1CREdNSjVCQWF2RjR0aVlOR2dkZWJ3MjJUNWE5?=
 =?utf-8?B?NERkZEoyYjFYcEVOZXFCQ0VSUkVvUHQ2ODB3dis3cW12NG1BOVJ3d0xQaHdm?=
 =?utf-8?B?ZDFKdjRYNXBBRDQ4MlUwbjgybXpWRTlzMkUyOURkejdmUHVCc1hkZXY2WHJ0?=
 =?utf-8?B?Z3hEWkxKRWErZmRTYzNpUEN0VlpnbHc2NEhaaWlVRUpWcG1OajhiSDBSZHI5?=
 =?utf-8?B?VWJYK1h0RTF0TERlSUREbC9RQjh2OUtIUk9VV0syUU9lSmp4NFN1cmlGUGtF?=
 =?utf-8?B?ditBVHZlZUFnR1hkdXlJek5ML1lqa0xsQjRlVDZwTmd6dVp6bGtITjFrNnVY?=
 =?utf-8?B?SXBDZUNKSXpzdWVTaUVTSkRjQlNuZ2pmalFlWmV5RGRZeSt6TXVaU2hNRjl2?=
 =?utf-8?B?c0dKbzZNUU1FdEZvbDdxR1g4YmF0c2MzRm5xcHhWTEZYdnhGQytka0EvMmhD?=
 =?utf-8?B?Z1ZUN0JxU2tYb1FoSnZwdzZQclFETEUvWnNEajJwMEFIQVpZT1RWMGR0cjNv?=
 =?utf-8?B?aEFVbElVbU9FWXJyUWpUUitSOUFtUEJnWTB6MDk0aExvK3dielRwcTE1OU9N?=
 =?utf-8?B?TWd0K2FyV3lkamo2UzlCcHFkb0ZtWURXdVZ6Tm8zWVVxNVp3QTVpTHpKTVRX?=
 =?utf-8?B?bFNPRytKYkYzeXBJQittWkdwV2Job2lrcGJDL3RycTdCUEVqWW5kenQzVjFW?=
 =?utf-8?B?a1pnS2wyeE5LVmJmTDJNTk16Ym56T0pPTjRwdW5zUHQ1YmxjdkZmSzlLNEVZ?=
 =?utf-8?B?MUxKazBLL1dkdHF2eDFueFZLcDE1QWNEZ2hRUURiZWpCVzhpMUI3NnhWamtG?=
 =?utf-8?B?UXlSZ3JONGJXdVVuWGhVN0Q1M0VwY01PTWVjbDU5U0RBbVhoeGhhNGxFcWtt?=
 =?utf-8?B?RGlFZ3k5bmV1cDFBNXRFLzV5M0FWRHBuZ28raTgrQmIzWHFkMk9lU2ZJd1Ro?=
 =?utf-8?Q?7hQ+XXm/thwXAvF5AY99my2vn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5F14453DD82C444A8C083BBA06B036F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9897d34-02f8-4fa1-8283-08dd263c7409
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 06:05:24.2887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UF5K41gdKn4zhEBIOrk6jooM7wnoZW3NVKOhGJ/By4xdX9nm80tre9WHB1C2aQVd237tZ4+h5ciHhwq5NCG6Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8379

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgdm9p
ZCBhaWVfcmVzZXRfb3V0cHV0X2J1ZihzdHJ1Y3QgbXRrX2FpZV9kZXYgKmZkLA0KPiArCQkJCSBz
dHJ1Y3QgYWllX2VucV9pbmZvICphaWVfY2ZnKQ0KPiArew0KDQpXaHkgY2xlYXIgb3V0cHV0IGJ1
ZmZlcj8NCkNvdWxkIHlvdSBwb2ludCBvdXQgd2hpY2ggcGxhY2UgaW4gdGhlIG91dHB1dCBidWZm
ZXIgdGhhdCBoYXJkd2FyZSBkb2VzIG5vdCB3cml0ZSBkYXRhIGludG8gYnV0IHNvZnR3YXJlIHdv
dWxkIHJlYWQgaXQ/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJaWYgKGFpZV9jZmctPnNlbF9tb2Rl
ID09IEZETU9ERSkgew0KPiArCQltZW1zZXQoZmQtPnJzX291dHB1dF9ody52YSwgMCwgZmQtPnJz
X291dHB1dF9ody5zaXplKTsNCj4gKwkJbWVtc2V0KGZkLT5kbWFfcGFyYS0+ZmRfb3V0X2h3X3Zh
W1JQTjBfTE9PUF9OVU1dWzBdLCAwLA0KPiArCQkgICAgICAgUkVTVUxUX1NJWkUpOw0KPiArCQlt
ZW1zZXQoZmQtPmRtYV9wYXJhLT5mZF9vdXRfaHdfdmFbUlBOMV9MT09QX05VTV1bMF0sIDAsDQo+
ICsJCSAgICAgICBSRVNVTFRfU0laRSk7DQo+ICsJCW1lbXNldChmZC0+ZG1hX3BhcmEtPmZkX291
dF9od192YVtSUE4yX0xPT1BfTlVNXVswXSwgMCwNCj4gKwkJICAgICAgIFJFU1VMVF9TSVpFKTsN
Cj4gKwl9IGVsc2UgaWYgKGFpZV9jZmctPnNlbF9tb2RlID09IEFUVFJJQlVURU1PREUpIHsNCj4g
KwkJbWVtc2V0KGZkLT5iYXNlX3BhcmEtPnJzX3B5bV9yc3RfdmFbMF1bMF0sIDAsDQo+ICsJCSAg
ICAgICBmZC0+cnNfcHltX291dF9zaXplWzBdKTsNCj4gKwkJbWVtc2V0KGZkLT5iYXNlX3BhcmEt
PnJzX3B5bV9yc3RfdmFbMF1bMV0sIDAsDQo+ICsJCSAgICAgICBmZC0+cnNfcHltX291dF9zaXpl
WzBdKTsNCj4gKwkJbWVtc2V0KGZkLT5iYXNlX3BhcmEtPnJzX3B5bV9yc3RfdmFbMF1bMl0sIDAs
DQo+ICsJCSAgICAgICBmZC0+cnNfcHltX291dF9zaXplWzBdKTsNCj4gKwl9IGVsc2UgaWYgKGFp
ZV9jZmctPnNlbF9tb2RlID09IEZMRE1PREUpIHsNCj4gKwkJaWYgKGZkLT52YXJpYW50LT5mbGRf
ZW5hYmxlKQ0KPiArCQkJbWVtc2V0KGZkLT5mbGRfcGFyYS0+ZmxkX291dHB1dF92YVswXSwgMCwN
Cj4gKwkJCSAgICAgICBGTERfTUFYX0ZSQU1FICogRkxEX09VVFBVVF9TSVpFKTsNCj4gKwl9DQo+
ICt9DQo+ICsNCg==

