Return-Path: <linux-media+bounces-37725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29009B05029
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 06:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21E3A1894299
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 04:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9376B2D29D7;
	Tue, 15 Jul 2025 04:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xh4bBxhC";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Yfa7uuM6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6352D29C2;
	Tue, 15 Jul 2025 04:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752552451; cv=fail; b=lTYwsBgcfdwUeHm67zCw0K0FO0q51AmCiQDa2z9tV1juJYO7jAIak5CBURxWJ2+OApEXOSNx4qCD5zmvfHpeQ0tWrsCdzneM8tu1H9EtZ+Y6ZTnt8yePZgz5+vfAhL4QNov9lBirhG/fw05+mON4ExIXfNAYPwX/okxkovTRVAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752552451; c=relaxed/simple;
	bh=VMpTCsKf0JVjHYRkFf3TVP0YvcYeQeoh2OaTQzDYyY4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WOkGCMhU1ChNK/0x0QKdYY2xHAhPkuVQd2Gvimk02TVY/46YzWkLKEP9+l/dUJcI2mGg6PjR3qVmELr/danMeNG95YOLVvIa68Ex2bm+Xey1lq+bSlYwQwrISAzkdOqRr5jrHbdJ1Iq5PDiynTGUf8Io4OMVI+QljZ/ZH/TYzHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Xh4bBxhC; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Yfa7uuM6; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 35422aca613111f0b33aeb1e7f16c2b6-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VMpTCsKf0JVjHYRkFf3TVP0YvcYeQeoh2OaTQzDYyY4=;
	b=Xh4bBxhCkWDk45JWpW06ZiG+n69PgK2wOtwh2n7cYzCWhrQA5B6H8dZQMkInyo7euXRnO1ZMi1PTgGehdOPqaAB6+ZLyiBycoo5IhB8+8+np6FUC8g1vUuu9/ixummElcUomMSOnH3xumsmniELDUivNxa7DfuEfnRXttRM8FPg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:661df75b-134d-48f6-b7a6-046f2bbc70a9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:759f35d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35422aca613111f0b33aeb1e7f16c2b6-20250715
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 912437521; Tue, 15 Jul 2025 12:07:22 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Jul 2025 12:07:19 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Jul 2025 12:07:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icZG9MvQPnP07maXebXasMXofF4hG74mVf74kS4+PoHNhYeHUnt/XJWGB9UagypA1+Y2gTwEUkH7V14Bb1gp2j8sVwZ2AslLYrO60Ttrk9itl2QpimYsnfwWghAw3GIW+9UPQicBOo2znbjlMtVIB0/52lka7TlCRO+geCGtZJeYntFRTGsWZl9SimIOcGBHzKbwJE4NUNXRryXKmhVhzFKNK7Omwg1gkD1PztDD/Rr15Ykt9teVy4Byv5CvniwD3jFiZky+GF6rwPy6s/SnJpETUeXZpM/KMzIWBkaZyGzEhU3qf6rzxC/qd7fiSWxsrRzkV7nQVuBYA5Bgc0SIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMpTCsKf0JVjHYRkFf3TVP0YvcYeQeoh2OaTQzDYyY4=;
 b=dHFhK2eSHoY8Hix/Xfe492becdgQ8C4ZcH9/iFZ2XuDGk0tclCbKYsyb5qjNnu/6pXRHtOj0XHaNfDOQtQwmAarirkHFP1ySjnBFnlelcRWWnzFZDyWS3Kauskpa/q8gXoADNPO40X6kHdG1dLrnHqZfZt64gg90X3TGLD3iUMpfyETZpHqQCvGRua9OTvLGxqk4BDpn0k1h44ERAMnnAJxvZzMTl8g6WGJoRHMjjS5MhwU7E+v39s6orGqVhaL1aCaWZ5X776b4S8TNl8VSYxKeI+067EBYgfR3RpqTGobsEy3jvUlItn+/H4gHU2PmGR7LjCLyw8oiiiBFYpDERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMpTCsKf0JVjHYRkFf3TVP0YvcYeQeoh2OaTQzDYyY4=;
 b=Yfa7uuM64GbvTzDoaBVFpidWTUZUimZVoTfNQmvl6CnkO3OeSjCVm72GdXba/nYFgS6pVjUYADC1lC/uMLrHA7rp+m7bQFOfY/e72wafXQ27myztExbnn0+XGoZkRNSKF4Jv0Ng9Bvqyp6lmq3FUF7eHb2s6JBgIXU3AktVgaGs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KU2PPF162C0C937.apcprd03.prod.outlook.com (2603:1096:d18::409) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 04:07:17 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 04:07:16 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
	<Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 07/13] MEDIA: PLATFORM: MEDIATEK: ADD ISP_7X CAM-RAW
 UNIT
Thread-Topic: [PATCH v2 07/13] MEDIA: PLATFORM: MEDIATEK: ADD ISP_7X CAM-RAW
 UNIT
Thread-Index: AQHb7uECzs/3OrsZgU+Nid/a2FRqp7QyniOA
Date: Tue, 15 Jul 2025 04:07:16 +0000
Message-ID: <0f17057cbe2bbef55328c242134aa71f660d4403.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
	 <20250707013154.4055874-8-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-8-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KU2PPF162C0C937:EE_
x-ms-office365-filtering-correlation-id: 7ad236dd-a3d7-45b0-4fbc-08ddc35515f3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUtSMXRpU0VENnUzZDQvWnpXVEpMTi9MUlBPMXpxMkYzTSttSkNQdUl2aElV?=
 =?utf-8?B?Mk56NjVxSnVuZjFDTjFzZU1tVG5aSEJtaXVQOU1KYW9sZ1pERmJ4Z2lYa2Zu?=
 =?utf-8?B?VzVjdk05U3l6NUVqYWxSM1hQdlpJMXh0eE5HaVFGc0llenptMm9aRy9mRkRT?=
 =?utf-8?B?U3BNZHlYY3Z5TUFIYTUxYml4ZkZMM3ZQUGp3YXdaZ2hlbktXdmxOOE5VVDUy?=
 =?utf-8?B?d2ZSa2tMckhycURDWWpXZG9uRGNTY09PeHdwcGV4Rmo5VjBPQTlwcjFBd0dK?=
 =?utf-8?B?eE5iU1dsZGFBOWV4aW5DRlcveGlLN3ZMZnpBK0t3eHA4bnl5Z01pbStiNGV4?=
 =?utf-8?B?dU4wTjZHMGdueUVRYnJzQW4rTmpKdHpaWXFIR1lxL01YMHVEUE5ZQ2tNMFkz?=
 =?utf-8?B?UnhLU0FOR0l3NFRyaXo1bG5lbkIrYjR5SkJQYnEyaFZycExIVnY5K0xvRTlL?=
 =?utf-8?B?YjZ2bExwRlZuTER1UTJ2WURubi9lMi9MbE5WSll3UE91eDNUMWZWLytIUkkv?=
 =?utf-8?B?L1h3cmg3VjFrZ2M4blBTVXF0a2drcFlEb3VkcGtTOWJhZVlYcnRScUxMWFFB?=
 =?utf-8?B?VFVjK0Z0MU8zd0dZdkxEYjU5NFRiaVdMeHYwbVFNSmFmSUdTQ296Snl0RE5G?=
 =?utf-8?B?Ui9iQkhjOWNTUW9Lbk9tRHN0V0JObG1uQUlDeHpKbWVuNGwyQ053TGt0cFh0?=
 =?utf-8?B?VmFuc1lrUHFxUXlEWkdpRngrdER5SitLem81YVdqT0dtbzJXdHlMdG5kNjR4?=
 =?utf-8?B?b1lGeVA4Y2luMGFwdHYvQlhpblNCWW9nK05TaVdJZjNEMUxEM29SaFZxSUtR?=
 =?utf-8?B?S1BscG9maDNEMVk1YXh6RzNqZUd5UDRHMXBzWXNCY1FBU3hwUEFSRG9OazNn?=
 =?utf-8?B?TXptM1paeXVNWVRRNUpmeWtPRDE1bDd2bzJoQ2JuOWt1ZGswa0ZmRXhmVlpS?=
 =?utf-8?B?dVFJRkpBRUdwVDdyckdrVFVpWE94bjJMOWtvbndBQm5pY1BCZHpzam9mMDJ3?=
 =?utf-8?B?ak42NmZWMFNYMlkyNU9iZWJnMVFXT2FNaVVtUDlZLzlmL0M3Q2dQOE5JNEoy?=
 =?utf-8?B?MEN2N3lQR2tzekFYc2dUQnpaZG44eEpXdXlidHhvMVkvOE5wdDg1QjlrQ1NS?=
 =?utf-8?B?UnVQamJpa1BLSDYrSG1uVmVIaWMreEN1ZDlGODFSTFlhL0lhSzIyZFI1R1U4?=
 =?utf-8?B?dUd6UGYxNG5GQURwUVhFcEJCZnFuVlZvRklzNVFtVHRlQnFQNEF2OUpCOFk3?=
 =?utf-8?B?SzQxd0VERGJLNWZFTVl1VDh3YjMyUzQydXFTdlNKRnl2MmRhWitOM29rd2M0?=
 =?utf-8?B?NzNzRDFrNkdKejZOOFc0K2hDT0J4emN6TExiVFJtd3Y3dlFNMU5GS1BVNTV4?=
 =?utf-8?B?K3ZrcnVnOFdUYUNRUGtrd3k2aTB1QUUydjY0U3ZYeHlHd2Z3bC9uNEJvVW4v?=
 =?utf-8?B?Q0lpMDI2ei9tQ1BzdUNaREg0LzBsdE5MbTJDUlZIbkpPZ0YzNWtGRVY1TXdE?=
 =?utf-8?B?Y0tjZW5UWk54L1VhODF5dGN6Q0l4RElXa2I4RHhPMSt2aFQva3dHU3hHRzlF?=
 =?utf-8?B?d2pkU250eUpTQTdBQmdrQlY5VlpSNkFYQWN4WGpteEI4T1VjeUdScXdEN2E1?=
 =?utf-8?B?ekwyeGI3SkY1V2Y3cVlzZlhFSTNORC95MUpzZlIvVDV5MkxqNDBFNGhXL3JC?=
 =?utf-8?B?SWdpYk16czJma28wRk1IcHdEY016RkZwV1NYNmh0RVJLbFROM0JycUhVc3k4?=
 =?utf-8?B?Wk9vOFBacitKMU1QOC9DTXpCam1hL3hYeVBIT2lkOTdYOVpQbldDWXM2Y0xD?=
 =?utf-8?B?VmpzWnJGdm9hVDNqSU5DVFhaUzhpcW5RZzBBakNocDJwSy9nZURpdVJWKzY5?=
 =?utf-8?B?UEV6c2NkdmErK3hCTm05L2U3V1lTQy9Bd2lRcEFqRWtjMDBNaWtYNTY5c2du?=
 =?utf-8?B?ZmJHS2ZaT3U4VHBLVVAyL3ljcFl3dWxKWmJNRS9TTWNBQ2ozdllNbVN1Y0hK?=
 =?utf-8?B?ZGh6SElQOXR3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODg1Zjd1ZElHcTh6eFlNbUNvRGNHbkJlWDdqdTl6SnVEL0c5SldsOEZkSWRC?=
 =?utf-8?B?cWdJR0ZZQmZJajQzbFNjTll4N000TWxWTDA1QXhkM01tS2FHTDJJUnFOdmda?=
 =?utf-8?B?ZWVhMnVqUEUzOTAvdVg1Ky8zSHF6L0J6cEg2QkRITGIxZ2FCT0NOM1NKelFr?=
 =?utf-8?B?Rk1lV05YNVVmcVpJa1pWeld5R2hjei9QaTlsbkp0V01XRVBDLzhWanpJSXBs?=
 =?utf-8?B?UE4yWG9wdVV0VGhNWTFHcHZ5SnNFL0xoK09adFhoa2FJd3ZwZDFHanhKdkZm?=
 =?utf-8?B?NzEvUDRUQmNLSTk0QWNGQitXRVFjSC9PNmVodzcyWGJvUmg3Q1NiejNaY3ow?=
 =?utf-8?B?SGV0bEUxVUdOQS9zMU5tUm5IUXBhcHlxUW42YTlsTTR4Zy9MVDFuT3NuK0Nu?=
 =?utf-8?B?cFp2UldJc0x5dlE0TXNvM2F1QmNrYktTLzliN1hDcldPL0lYZWJuQ1lpcGlp?=
 =?utf-8?B?ZWlhaUFKY0JVenJYUWM5cVVNbGJaTEZIdk9NdFNQNVZrRXc2Y2VVSW9NMW1k?=
 =?utf-8?B?Szk1MDl2WGxGaE4xRDVNeXZwUTc3d3ZGdm9IMHJhQUFaOCtYelJEZDNyaWxK?=
 =?utf-8?B?TDVHWUVCZkVGbHVydXNXOTNhbU5uOGNQWUZFekVJMUdvN1Nnb28rckwzL3hy?=
 =?utf-8?B?Z3BhZ3REOVNNUGY0bWd0OWZUN3Q3Y2p0dlFlWjVoa1RudzZqVEJiSDJwZ1hE?=
 =?utf-8?B?UVcveG56VEYvNm9iclZ2UERWVXh6b09YVlpmcVpjd0xMNFdsTzlhZWFHYml0?=
 =?utf-8?B?WTlZcHFaZ01HdTJFeXVTQUNPSTFIVG5Cd1F4RmNsUUlvRnhtMXJlaVNGWnE2?=
 =?utf-8?B?YjBKeFQ1TFNPNFhpZEF5eUNhZDRGWWZmRXQ2TWxKZXFGQVVPS3NqamQxcnl6?=
 =?utf-8?B?Y1ZraEppS2pDMUQ0L0hJa1VtcHdGd1lyQUFneDRYTmZ5K2hNeUk5bVplTnVZ?=
 =?utf-8?B?RE5VRUdlK0JCcWppd3hSR1dVSC9saE5ocFNVRjJPQURzNEVPWUZyNUFUQ2tN?=
 =?utf-8?B?ZTkvMHdlRVcyWE9md1VqcEdFQ0RudFpJTUVlbndiY2tNVlBJUllBZFpicG1S?=
 =?utf-8?B?L3hzTElab1psOVgxQTl5a3JGdjhPUUdBNUpjSFB3VndPeUZ6ZXNXT3R1STZU?=
 =?utf-8?B?dXJJdkVrTGhuMGh2c0dlQ2swRURnOVhHck9IZEVTKzAzcnZlUXV2cHVpcHdS?=
 =?utf-8?B?Wk55c2NiS2M4UlV4eDFieEZIRW0vMzVsYXlodm9WYjJMMGFFUkVwQXRUbUFB?=
 =?utf-8?B?bU43SHlPOG5MNEZSOXRzL0dQaitBZ3RyNXRGbU83Y1pPcDlLcWl6aHlvREZn?=
 =?utf-8?B?SFhFdHlnYUVJVW9Bdkp3N1UvanB3TCtNZFFPcURmbnJ1Z0lWdjNFemZFMDgw?=
 =?utf-8?B?b1hsc01QejREOHFLZWQvcStUeW1CeGR5S3lZcXNWQlFrbUN3TGVrdHJCSENQ?=
 =?utf-8?B?bjlZd2pHVE1iQUg2U3dYOCs5bHN5djMrVkQwWnQvVmE5OFFaV3VFNkkyRWd5?=
 =?utf-8?B?Qkhrc0RkRGNycXNoN1hGdXA2TWY5cnM5Y1NoRTJjQzQxRHMvZVFuSWZ6VHRJ?=
 =?utf-8?B?d0xKMTFkdWxjSHptc3RLc0pPSTJxVTltSmFvSkNubDQ3bmxuamVnNEdSZzY1?=
 =?utf-8?B?Ylc4cEtyVURLQ3ZhTFNNeUlQbm5LZUM2V3VoU0FJNlphRXQwYlc4LzlDYjhB?=
 =?utf-8?B?Ykovclg1UDZtU3dYTkMrZFJRSzVDc1NjR2Q4VXNtSWtTeFI3anZYSjdKVkpJ?=
 =?utf-8?B?aytOVlpMOTR4VVJNK1d4YlZaeitNQ2dra2FycnNQWllYU3pNOW5IVHJmZ2FL?=
 =?utf-8?B?d0hFazk4NWVpU001UkFmQmw5bXR0NHVwS1ltOVhITzhnM0pXYnZlZWtJcEUz?=
 =?utf-8?B?a1l5VldBaWIwYklyejlTajJCU3pvQlgya3I4ZEVUUmxlWE9UZmVyTzMvS01M?=
 =?utf-8?B?UW1WbGxkSmpIaDJ2S0R5MFVsclB6TSt5cXNMK255aGJyT1RpZklaUGp5K1J0?=
 =?utf-8?B?NUlHWWJ1TFFmK3ZHQW1JaGtmeGtvZHAwUzlrQUtKWEVXVnZ0YjdDOEh5dTlM?=
 =?utf-8?B?dUxEeE9WZ3EwQTlhOWFUVmhUemJvQlFwbFdQdzZjK2hOVm5pTytCRXFhaHVE?=
 =?utf-8?Q?X7A5x+ThWmJ2T2RAwtW7lkrMc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02A1DDB1C3FAB44DA96208E6FA2C2A2E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad236dd-a3d7-45b0-4fbc-08ddc35515f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 04:07:16.4175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQV8UhPXSODJmWM5CDa+gznV+fZ7QYpRBO+OGa0jBUvL6xFaFS/XVVnzrhSesDNMYc/WeCJNpRmSTQMZtjzjEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF162C0C937

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
SW50cm9kdWNlcyB0aGUgSVNQIHBpcGVsaW5lIGRyaXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUCBy
YXcgYW5kIHl1dg0KPiBtb2R1bGVzLiBLZXkgZnVuY3Rpb25hbGl0aWVzIGluY2x1ZGUgZGF0YSBw
cm9jZXNzaW5nLCBWNEwyIGludGVncmF0aW9uLA0KPiByZXNvdXJjZSBtYW5hZ2VtZW50LCBkZWJ1
ZyBzdXBwb3J0LCBhbmQgdmFyaW91cyBjb250cm9sIG9wZXJhdGlvbnMuDQo+IEFkZGl0aW9uYWxs
eSwgSVJRIGhhbmRsaW5nLCBwbGF0Zm9ybSBkZXZpY2UgbWFuYWdlbWVudCwgYW5kIE1lZGlhVGVr
DQo+IElTUCBETUEgZm9ybWF0IHN1cHBvcnQgYXJlIGFsc28gaW5jbHVkZWQuDQo+IA0KPiBDaGFu
Z2VzIGluIHYyOg0KPiANCj4gLSBSZW1vdmVkIG10a19jYW0tcmF3LmMgYW5kIG10a19jYW0tcmF3
LmgsIGFsb25nIHdpdGggcmVsYXRlZCBjb2RlDQo+IC0gUmVtb3ZlZCBNMk0gcmVsYXRlZCBjb2Rl
DQo+IC0gVmFyaW91cyBmaXhlcyBwZXIgcmV2aWV3IGNvbW1lbnRzDQo+IA0KPiBRdWVzdGlvbiBm
b3IgQ0sNCj4gDQo+IEhpIENLLA0KPiANCj4gTWF5IEkgYXNrIGlmIGl0IGlzIGFjY2VwdGFibGUg
dG8ga2VlcCB0aGUgaWQgZmllbGQgZm9yIHRoZSBmb2xsb3dpbmcgcmVhc29uPw0KPiBXaGVuIHRo
ZXJlIGlzIG1vcmUgdGhhbiBvbmUgUkFXIGVuZ2luZSBvbiB0aGUgcGxhdGZvcm0sIGhhdmluZyBh
biBpZCBtYWtlcyBpdA0KPiBtdWNoIGVhc2llciB0byBtYW5hZ2UgYW5kIGNvb3JkaW5hdGUgZGlm
ZmVyZW50IFJBVyBwaXBlbGluZXMuIEl0IGFsbG93cyB1cyB0bw0KPiBjb3JyZWN0bHkgYXNzb2Np
YXRlIGV2ZW50cyBhbmQgaW50ZXJydXB0cyB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIFJBVyBkZXZp
Y2UNCj4gY29udGV4dCwgd2hpY2ggaW1wcm92ZXMgY29kZSBtYWludGFpbmFiaWxpdHkgYW5kIHNj
YWxhYmlsaXR5Lg0KPiANCj4gV291bGQgeW91IGFncmVlIHdpdGgga2VlcGluZyB0aGUgaWQgZm9y
IHRoaXMgcHVycG9zZSwgb3IgZG8geW91IGhhdmUgYSBwcmVmZXJyZWQNCj4gYWx0ZXJuYXRpdmU/
DQoNCllvdSBjb3VsZCBrZWVwIGl0IG5vdy4gSSB3b3VsZCB0cnkgdG8gcmV2aWV3IHdoZXJlIHVz
ZSB0aGlzIGlkLg0KSWYgZXZlcnkgd2hlcmUgaXMgbm90IG5lY2Vzc2FyeSwgdGhpcyBpZCB3b3Vs
ZCBmaW5hbGx5IGJlIHJlbW92ZWQuDQoNCj4gDQo+IEV4cGxhbmF0aW9uOg0KPiANCj4gUmVwbHkg
dG8gQ0s6ICJSZW1vdmUgcmVzb3VyY2UgY2FsY3VsYXRpb24gcmVsYXRlZCBjb2RlIg0KPiANCj4g
VGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uIFRoZSByZXNvdXJjZSBjYWxjdWxhdGlvbiBj
b2RlIGlzIHJldGFpbmVkIGV2ZW4NCj4gZm9yIHRoZSB1bnByb2Nlc3NlZCBJTUdPIHBhdGguIEFs
bCBpbWFnZSBzdHJlYW1zLCBpbmNsdWRpbmcgSU1HTyB1bnByb2Nlc3NlZCwNCj4gcGFzcyB0aHJv
dWdoIHRoZSByYXcgcGlwZWxpbmUgYW5kIHJlcXVpcmUgcHJvcGVyIElTUCBoYXJkd2FyZSBjb25m
aWd1cmF0aW9uLg0KDQpJdCdzIGJldHRlciB0byBoYXZlIGEgY29tbWVudCB0byBleHBsYWluIHRo
ZSBwaXBlbGluZSBhbmQgZnVuY3Rpb24gYmxvY2sgaW4gdGhlIHBpcGVsaW5lLg0KV2hlbiBtb3Jl
IGluZm9ybWF0aW9uLCBJIHdvdWxkIGdpdmUgYmV0dGVyIGFkdmljZS4NCg0KPiANCj4gUmVwbHkg
dG8gQ0s6ICJJdCBzZWVtcyB5dXYgaXMgYW4gaW5kZXBlbmRlbnQgZnVuY3Rpb24uIElmIHNvLCBz
ZXBhcmF0ZSB5dXYNCj4gZnVuY3Rpb24gdG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guIg0KPiANCj4g
VGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQuIFRoZSByYXcgYW5kIHl1diBmdW5jdGlvbnMgYXJl
IG5vdCBzZXBhcmF0ZWQgaW50bw0KPiBpbmRlcGVuZGVudCBwYXRjaGVzIGJlY2F1c2UsIGluIG91
ciBoYXJkd2FyZSBkZXNpZ24sIGJvdGggYXJlIGhhbmRsZWQgYnkgdGhlDQo+IHNhbWUgaGFyZHdh
cmUgYmxvY2sgYW5kIHNoYXJlIHRoZSBzYW1lIHJlZ2lzdGVyIHNldC4gVGhlIHl1diBmdW5jdGlv
biBpcyBqdXN0IGENCj4gZGlmZmVyZW50IG1vZGUgb2Ygb3BlcmF0aW9uIHdpdGhpbiB0aGUgc2Ft
ZSB1bml0LCBub3QgYW4gaW5kZXBlbmRlbnQgaGFyZHdhcmUNCj4gbW9kdWxlLiBTcGxpdHRpbmcg
dGhlbSB3b3VsZCBub3QgcmVmbGVjdCB0aGUgYWN0dWFsIGhhcmR3YXJlIGFyY2hpdGVjdHVyZSBh
bmQNCj4gY291bGQgbWFrZSB0aGUgY29kZSBoYXJkZXIgdG8gbWFpbnRhaW4uDQoNCkkganVzdCB3
YW50IHlvdSB0byBzZXBhcmF0ZSB5dXYgZnVuY3Rpb24gdG8gYW5vdGhlciBwYXRjaC4NCllvdSBj
b3VsZCBhZGQgaXQgYmFjayBpbiBsYXRlciBwYXRjaC4NCkZpbmFsbHkgdGhlIGNvZGUgd291bGQg
YmUgdGhlIHNhbWUgYXMgbm93Lg0KRmluYWxseSBpdCB3b3VsZCBzaG93IGhhcmR3YXJlIGFyY2hp
dGVjdHVyZSBhbmQgeW91IGNvdWxkIG1haW50YWluIHRoZSBzYW1lIGNvZGUuDQoNCj4gDQo+IFBs
ZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgZnVydGhlciBzdWdnZXN0aW9ucy4gVGhh
bmsgeW91IQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogc2hhbmd5YW8ubGluIDxzaGFuZ3lhby5saW5A
bWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKwl7DQo+ICsJCS5pZCA9IE1US19S
QVdfUkFXSV8yX0lOLA0KPiArCQkubmFtZSA9ICJyYXdpIDIiLA0KPiArCQkuY2FwID0gVjRMMl9D
QVBfVklERU9fT1VUUFVUX01QTEFORSwNCj4gKwkJLmJ1Zl90eXBlID0gVjRMMl9CVUZfVFlQRV9W
SURFT19PVVRQVVRfTVBMQU5FLA0KDQpGb3IgY2FtZXJhLCBjYXB0dXJlIGRldmljZSBpcyBiYXNp
YyBmdW5jdGlvbiBhbmQgb3V0cHV0IGRldmljZSBpcyBhZHZhbmNlZCBmdW5jdGlvbi4NCklmIHRo
aXMgc2VyaWVzIGp1c3Qga2VlcCBiYXNpYyBmdW5jdGlvbiwgZHJvcCB0aGUgb3V0cHV0IGRldmlj
ZSBjb2RlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCQkubGlua19mbGFncyA9IE1FRElBX0xOS19G
TF9FTkFCTEVEIHwgIE1FRElBX0xOS19GTF9JTU1VVEFCTEUsDQo+ICsJCS5pbWFnZSA9IHRydWUs
DQo+ICsJCS5zbWVtX2FsbG9jID0gZmFsc2UsDQo+ICsJCS5kbWFfcG9ydCA9IE1US0NBTV9JU1Bf
UkFXSV8yLA0KPiArCQkuZm10cyA9IHN0cmVhbV9vdXRfZm10cywNCj4gKwkJLm51bV9mbXRzID0g
QVJSQVlfU0laRShzdHJlYW1fb3V0X2ZtdHMpLA0KPiArCQkuZGVmYXVsdF9mbXRfaWR4ID0gMCwN
Cj4gKwkJLmlvY3RsX29wcyA9ICZtdGtfY2FtX3Y0bDJfdm91dF9pb2N0bF9vcHMsDQo+ICsJCS5m
cm1zaXplcyA9ICYoc3RydWN0IHY0bDJfZnJtc2l6ZWVudW0pIHsNCj4gKwkJCS5pbmRleCA9IDAs
DQo+ICsJCQkudHlwZSA9IFY0TDJfRlJNU0laRV9UWVBFX0NPTlRJTlVPVVMsDQo+ICsJCQkuc3Rl
cHdpc2UgPSB7DQo+ICsJCQkJLm1heF93aWR0aCA9IElNR19NQVhfV0lEVEgsDQo+ICsJCQkJLm1p
bl93aWR0aCA9IElNR19NSU5fV0lEVEgsDQo+ICsJCQkJLm1heF9oZWlnaHQgPSBJTUdfTUFYX0hF
SUdIVCwNCj4gKwkJCQkubWluX2hlaWdodCA9IElNR19NSU5fSEVJR0hULA0KPiArCQkJCS5zdGVw
X2hlaWdodCA9IDEsDQo+ICsJCQkJLnN0ZXBfd2lkdGggPSAxLA0KPiArCQkJfSwNCj4gKwkJfSwN
Cj4gKwl9LA0KPiArCXsNCj4gKwkJLmlkID0gTVRLX1JBV19SQVdJXzNfSU4sDQo+ICsJCS5uYW1l
ID0gInJhd2kgMyIsDQo+ICsJCS5jYXAgPSBWNEwyX0NBUF9WSURFT19PVVRQVVRfTVBMQU5FLA0K
PiArCQkuYnVmX3R5cGUgPSBWNEwyX0JVRl9UWVBFX1ZJREVPX09VVFBVVF9NUExBTkUsDQo+ICsJ
CS5saW5rX2ZsYWdzID0gMCwNCj4gKwkJLmltYWdlID0gdHJ1ZSwNCj4gKwkJLnNtZW1fYWxsb2Mg
PSBmYWxzZSwNCj4gKwkJLmRtYV9wb3J0ID0gTVRLQ0FNX0lTUF9SQVdJXzMsDQo+ICsJCS5mbXRz
ID0gc3RyZWFtX291dF9mbXRzLA0KPiArCQkubnVtX2ZtdHMgPSBBUlJBWV9TSVpFKHN0cmVhbV9v
dXRfZm10cyksDQo+ICsJCS5kZWZhdWx0X2ZtdF9pZHggPSAwLA0KPiArCQkuaW9jdGxfb3BzID0g
Jm10a19jYW1fdjRsMl92b3V0X2lvY3RsX29wcywNCj4gKwkJLmZybXNpemVzID0gJihzdHJ1Y3Qg
djRsMl9mcm1zaXplZW51bSkgew0KPiArCQkJLmluZGV4ID0gMCwNCj4gKwkJCS50eXBlID0gVjRM
Ml9GUk1TSVpFX1RZUEVfQ09OVElOVU9VUywNCj4gKwkJCS5zdGVwd2lzZSA9IHsNCj4gKwkJCQku
bWF4X3dpZHRoID0gSU1HX01BWF9XSURUSCwNCj4gKwkJCQkubWluX3dpZHRoID0gSU1HX01JTl9X
SURUSCwNCj4gKwkJCQkubWF4X2hlaWdodCA9IElNR19NQVhfSEVJR0hULA0KPiArCQkJCS5taW5f
aGVpZ2h0ID0gSU1HX01JTl9IRUlHSFQsDQo+ICsJCQkJLnN0ZXBfaGVpZ2h0ID0gMSwNCj4gKwkJ
CQkuc3RlcF93aWR0aCA9IDEsDQo+ICsJCQl9LA0KPiArCQl9LA0KPiArCX0sDQo+ICsJew0KPiAr
CQkuaWQgPSBNVEtfUkFXX1JBV0lfNF9JTiwNCj4gKwkJLm5hbWUgPSAicmF3aSA0IiwNCj4gKwkJ
LmNhcCA9IFY0TDJfQ0FQX1ZJREVPX09VVFBVVF9NUExBTkUsDQo+ICsJCS5idWZfdHlwZSA9IFY0
TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSwNCj4gKwkJLmxpbmtfZmxhZ3MgPSAwLA0K
PiArCQkuaW1hZ2UgPSB0cnVlLA0KPiArCQkuc21lbV9hbGxvYyA9IGZhbHNlLA0KPiArCQkuZG1h
X3BvcnQgPSBNVEtDQU1fSVNQX1JBV0lfMywgLyogYWxpZ24gYmFja2VuZCBSQVdJXzMgKi8NCj4g
KwkJLmZtdHMgPSBzdHJlYW1fb3V0X2ZtdHMsDQo+ICsJCS5udW1fZm10cyA9IEFSUkFZX1NJWkUo
c3RyZWFtX291dF9mbXRzKSwNCj4gKwkJLmRlZmF1bHRfZm10X2lkeCA9IDAsDQo+ICsJCS5pb2N0
bF9vcHMgPSAmbXRrX2NhbV92NGwyX3ZvdXRfaW9jdGxfb3BzLA0KPiArCQkuZnJtc2l6ZXMgPSAm
KHN0cnVjdCB2NGwyX2ZybXNpemVlbnVtKSB7DQo+ICsJCQkuaW5kZXggPSAwLA0KPiArCQkJLnR5
cGUgPSBWNEwyX0ZSTVNJWkVfVFlQRV9DT05USU5VT1VTLA0KPiArCQkJLnN0ZXB3aXNlID0gew0K
PiArCQkJCS5tYXhfd2lkdGggPSBJTUdfTUFYX1dJRFRILA0KPiArCQkJCS5taW5fd2lkdGggPSBJ
TUdfTUlOX1dJRFRILA0KPiArCQkJCS5tYXhfaGVpZ2h0ID0gSU1HX01BWF9IRUlHSFQsDQo+ICsJ
CQkJLm1pbl9oZWlnaHQgPSBJTUdfTUlOX0hFSUdIVCwNCj4gKwkJCQkuc3RlcF9oZWlnaHQgPSAx
LA0KPiArCQkJCS5zdGVwX3dpZHRoID0gMSwNCj4gKwkJCX0sDQo+ICsJCX0sDQo+ICsJfQ0KPiAr
fTsNCj4gKw0KDQo=

