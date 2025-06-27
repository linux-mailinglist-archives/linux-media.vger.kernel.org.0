Return-Path: <linux-media+bounces-36078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48918AEB360
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 11:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B320B3BE4B6
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 09:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30A8295D87;
	Fri, 27 Jun 2025 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cxsxaPso";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dKekmubL"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707521DE2C9;
	Fri, 27 Jun 2025 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017810; cv=fail; b=M6TVoSWdjnYBIeqYELVxMas0FBk/ntpbCUP3BHdGqZKJjfukL/atc2QsUWFLi7LoWt6rvAZlcuVm02ObpYjeP8F5c/md/Ei3zOStmrAcVNs3gmDdx6x9+iiq1k7iH8Kk4zQbP59RPv3ai9R8WidVSQCfxSmHGJj03LCxMaGg8Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017810; c=relaxed/simple;
	bh=KGUz9w9Yqdt3yb+B4ELVxIUYRQeu7a7e/Na4brlLuGc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HhEqXMJoTHcVMR3Bf7zGsY1WWpSFshfEXG/hMQrCvJ643N0sPi5MuVdsvGsqW7fwibmZsvHQdf5gEJqF5RbTyr7T3htpFyKX5/J3LGiONQ7OhyAr/PSe5vwmQeX1CURYGZIr57Upp84EbPNiubFe99wJgo4OGpXHZ5qze4saMqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cxsxaPso; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=dKekmubL; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 181e0c3c533c11f0b1510d84776b8c0b-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KGUz9w9Yqdt3yb+B4ELVxIUYRQeu7a7e/Na4brlLuGc=;
	b=cxsxaPsoIgwt6yjHYLxQmfazYLbkRLRWX4kOIQAxsXIbrFheXJMCkPxgrI+vy9iQ5wSYawkXyb3VvsUL8KjNfkvfpr/+VSr/M1Y3LiOpwtyrqjqtOI6KA29c9yRGY/IR9hnzwFN13PZW/dOUbq3XXJLTDK7/dimpEGJZsCWbLtw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:cd6d1384-5f8f-4fbc-906f-225c54e35054,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:13e64482-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 181e0c3c533c11f0b1510d84776b8c0b-20250627
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 275329273; Fri, 27 Jun 2025 17:50:01 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 17:49:58 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 17:49:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY4DMp+3e+gvsefiGaWCpmUxZmj9AgWUTbfk4s3QTAIvmmur5HuKDaj6zeBTEF7AZny18lAJLHePLRI0jmc0xepnPKy6gSnB25cOmboWdJQjROz+79K+8R0XpsvjFBNIfC1201BmeQpaKVDrh/bCMliB8/onsNMJSdZe33QJj8d3oVmnryfgDoukROSGHS3UXeKTVNjyeSvKfxmKZHHjv9qWL5deY09nXQniKN9Fscm3iRr4lubpr5F+nzNTBnsuy9Xw/8qe2UBYh44jzh7OoKK8JVkOyoVFN8lqyViyCUgXu06E2lhXdVi32O/CJYVxR9u1pbcA45kGJ7KUjHW7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGUz9w9Yqdt3yb+B4ELVxIUYRQeu7a7e/Na4brlLuGc=;
 b=Gfp4ESIXj4p2KCEc0VSU2tEmAcEAXViES09IS9JjqNxfqVV8B7fB+er6ucyyO/EgFun8R/DET9bswGIzZ5nHbHySJEAeKM15/JxA/Tvw4fmLYEdzt2/4QY+tg+qAHpYHr2eDc9cvE+cK7J+AFxhuSWh33U+/YqahfeFK5fwCoMoVuR5Cju/JVPugOWtCxDXXDzp8g70FYl2szsYRx2t9AQUP6Pop69UnPba34tYCjddHJq3sbbloBBH6GOfCScpSP21Pid5y6TBBTkc6WSfKHuOickQ5EwrEG3iXtYA9CZt8S+FsEzZUidnLaFsHTkS+vVYCAq0NR+zV6l7LcSrAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGUz9w9Yqdt3yb+B4ELVxIUYRQeu7a7e/Na4brlLuGc=;
 b=dKekmubLc9CcH2wNEVKPvzywU7b1k0KSm0O7aoVmZygyknU6ERDX0TOrqNgK6fnru+09uZ/cWyJpQDwiYb2DpUdh3HJmo2NgZ8wv6d3eWOA46et10s4oNjJdyWwHJW48U6jDxTgiOcbZgaSmvXV4rwVJtOHjS6FbDtxXx0UpZvo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8265.apcprd03.prod.outlook.com (2603:1096:101:19c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.20; Fri, 27 Jun
 2025 09:49:57 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 09:49:57 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
Thread-Topic: [PATCH v6 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
Thread-Index: AQHb0xuHKjY3aYfJfEi3b0MrpGis37QW63KA
Date: Fri, 27 Jun 2025 09:49:57 +0000
Message-ID: <84f2670464757a7e58cca7e9715a8e9ea6bf274d.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
	 <20250601173355.1731140-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20250601173355.1731140-8-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8265:EE_
x-ms-office365-filtering-correlation-id: 1c7b6740-79f5-4de5-ce06-08ddb55ff9b0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVd1NnNjcExRMDVtRDdjN2c5Um5OcDNkWDVYT0ZHZGEvZ0FxK1BUS0o0Vzhk?=
 =?utf-8?B?Z1ZyazlleWdzdGlVSFViWnFHZHJQeTZ3Y1Fwc0NLUDBrdXpyMUx0ZjBzaTJl?=
 =?utf-8?B?MnBjME84Y0Nrb3NBTDFETjUzSGEySm4ydGR5NlQ0dzBXY01hZjYwOGdQM01M?=
 =?utf-8?B?WHJaNkVNZ2wrdDBQYmtRRk5qVHpycHJLQ2R5OVBuTHNObjVlUFdJSEtwbVhs?=
 =?utf-8?B?WXZnUWFxNk14UGRmR2N1WWg3bG9lVmQxWTVVcGVMSXE4akpyNmhDNzRqemxv?=
 =?utf-8?B?NG1OUURGNzJJd2l3SmpoRGdLUk1qUHhOdkF3RTMraVd2eTJvdVNGN1Z3QTRE?=
 =?utf-8?B?TzdEN1JaOVQ5MXYvOHU4dnh6RTVXeU14eGVQSllaTDR1cnRBTEdudWM2bzBJ?=
 =?utf-8?B?azA2a0FHY3hXdVNTQi9jbDAxaVRWTVZsenl5OVdDUmxDQSsrb1J0V0tzdHI0?=
 =?utf-8?B?cDF0ZktZL0ovN21FS1JReWcyQjFkbzZGMmhXVUZHWVk0bXlqS3BaclNPd3g3?=
 =?utf-8?B?NEtSYW93YVd6TCtzMGxGNDFQdkYrT0hnNGJFdnFrd2dPNHZOUUtQWXY2S0Rh?=
 =?utf-8?B?bVBlZ01xdWhNZS96TEF6UThiYjE5aG1wTGw3MlFkMis4UDRydnhOZlJrclB2?=
 =?utf-8?B?OGhZMy9kZGludXJnYkhWczdUWDlZVHppVUtnZEdWbmtFbFU4ZGk5cHhHNE1m?=
 =?utf-8?B?V0djNjJqMEhrZURKWWhVcGtSRGVIbnhTZG54Qi9sTmRxQmZaTUpXeWxsVExU?=
 =?utf-8?B?em52dUYvNzVONVZtTlZvVWJ0Yko5NXBZZGVZWGYzY0owVGVQbTVoNDVRUnFC?=
 =?utf-8?B?L0xEUjdMb3JIdEovYzZuaWxLNVkyN2lERGN2UUJEd242SVlxdzdpWDJGMExr?=
 =?utf-8?B?eFNHUEZpUFlaUlVyWkw4b1JONE94V0xDMnZIdmlvT1pxUWdvblorRHgrRUdE?=
 =?utf-8?B?NFU2bFJnbjAvWU5sVHNxS3hYMVNkRlJWcFRIMmpOK1EwWnIrbkpsNDhhbVVY?=
 =?utf-8?B?dDg5Qit4cElCMjduNzFTcVloT1FFT0FHbzJJcGUrUEQwSEN3TmFQL1I3eU5F?=
 =?utf-8?B?YzZEdEVRVGorY2N3RzZqMzU0M2JDbnBuVDNIa2dsTUZPdFlyU1NyTXUvUFNO?=
 =?utf-8?B?Vktua2VVNUFBZWdyNTAzaE1nMFo3VXBySjRYZ01SQVVaNXRZZ2dqbjZWbkpu?=
 =?utf-8?B?bUlwTFpVRVNpZWR4NlpobUt0VjF6SzQ1ZHB3Z1J0aXVCc0ZrOEJTRHJzdDdp?=
 =?utf-8?B?M3RvWGVGNEFrUHR1VXY1TURsZmtYWnBEbTRiV3MrTHhTR3gyU21qZXBpdEd5?=
 =?utf-8?B?ZUEwMmdLT0h1M3NSekVGMVpGZEdtVGd4Q3RwN0lZSktRTjF6YlJsdXFGd3Rs?=
 =?utf-8?B?aU84cTlRQ2dZcWpENFNzcG1mR2hxRENtUG11SDRJd2VPMlpSMk51R292cWJ3?=
 =?utf-8?B?aFFGVFdTempqQ3VlT3VlVzBrbktBRGxXd3JIeFpVMGdIYmNqUDloVFF5QUF0?=
 =?utf-8?B?N2VtMHpnS0o5bVlQZlpVN1hVVTRkT3V5aUFVcWZZTlZxeTVKdmNLa05qRUdR?=
 =?utf-8?B?NGFiMDdvNU5yTXpXVkRnS1RERms5ZUNWVHpQSVJvV3BKTHVrYVpCYUFCTE1G?=
 =?utf-8?B?dUhwTUJIdTU2d3VzQ21HN2VUenRlUHI4WE9QSWk0YnZvV2MwNkNscXQ0QWpo?=
 =?utf-8?B?SUVSUnF1Qjk2dk1ZVHQ3QlV5eTlDeXdUUGxMSWRJcUdBR0VOODhWalpUanh3?=
 =?utf-8?B?ZGprcTNNT1dId2U5RXIwTUU2OFREWGVEVWQ2VWZpL29aNWdVL3p0czA4cXVx?=
 =?utf-8?B?OXpJNXdzRWx0OE41R3JMb3lIY2JnaG5sQktYblRuL2IrTFZBVUpac2Jnd1Rk?=
 =?utf-8?B?emJNQ1ExSCtpajU5ei9XWmp0eFBRYjF5WXVIUGU5aGE0T1VkdVFaYXFsVit3?=
 =?utf-8?B?VXhjaTZncDhyS3hVS21FaG5HUm5icWVrUXp6Y3BsWVJPZzZLWU1ZcXEzaldC?=
 =?utf-8?Q?RWmzJEDxv0m/fMj9qnJKVwNv9SGK8s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1EvdTY3YURVSE03dUdGZnBMcENIZkZhTVN1N2NUcldVTGd6MytpQkUwUnVQ?=
 =?utf-8?B?RGVGajJ5OEFPUVR4aVVCTHdpTGhCYnczM0R0WDc3ZTFUZW1PeWRzeUZVSjVy?=
 =?utf-8?B?S1NITkhQOUhuWHpRSG9xejBYSE5NUk9sellKVmlPVW5nZmhjNGc0bEc3T1N5?=
 =?utf-8?B?Sm82TnorSDVlTzM5VlJYd00xQUVVUlNER29JVFQ4MzVsQkpCR3JrTi91UEh3?=
 =?utf-8?B?azVhM3lRT3l6RGtaMHJJNWFaeFBkaGVIVWZsS1dYOGVKU0FpNnM1UDk1WFpF?=
 =?utf-8?B?a29IQ1NQNGRGcFNaMUxnT1ZoSXNZRUQzQ25HTElwRlZTMUN1UkpUTTVRUFVV?=
 =?utf-8?B?T0RocU1wR3JzcndFTW9pb2dzaGppOS90T2tZcE40S2Z5TjdKaEVzSDhQeC8y?=
 =?utf-8?B?NW5YQVFYd3VxNm1vNEtlMzhyUFRxL3RMR0FMaDVTOE5DMWM3STNmNG00OVMz?=
 =?utf-8?B?UVJzaitKcTBFTGgzTzVqWGFUTFBnemVuUFhhSXNCOEJ3VTVQUExXRDVtWWxD?=
 =?utf-8?B?NktlLzdSb3NjS1dNazZBOWwxZ0kxV2tFZi9hdWZmbkN2N1dFQ1h0YzY3dVRC?=
 =?utf-8?B?Ylp6WlMydFlCbkxvOEorblhYcDRiZ1hQTllxYmRUaG1KbmF2MkZjbGpUU1Fj?=
 =?utf-8?B?MWQrTXV3Uk4xdDg3d25TclJrbFR0a3FsMlh2MmRyRkhIRC8xbnZYcitObk9B?=
 =?utf-8?B?VUtoOE8zZmg4ZlNUc1o2RS9FVE83d28wZnlOUmRzOEMvb09saFpzYUhOQzRS?=
 =?utf-8?B?cTdudkNmT3drbXRjQUVPSzhFdm93UE0yZEJmdFhiWHA0OXdQZEVqMzZXa08y?=
 =?utf-8?B?T1N0U3FrSUxQbXAvTmRrV25tVVk0QWZwUEpRSnNLME5yU0ZrZEVvZ25NOXdo?=
 =?utf-8?B?S01YMkFQb3JENmMveDUvWlRKQ3FCanR2dmp5Q3dld0FnT09yVzVKV05RNFo0?=
 =?utf-8?B?VXBhaUV6SUlsbk1yZHhPbEs3Mk5jYmZuZEhTb2hJNlRyZ013bVJhTVpFc1RU?=
 =?utf-8?B?Q0dRenpnaCsvam9xQkxTQ21CRzdrTllueXhUVjh5enBJOE9nMTc1b0JkL1ph?=
 =?utf-8?B?QkFKZkEzNFlSL1BKc0RleXNlK3FaREZpS1p4RFh1NFMwc1h3M2VnWHpER3o4?=
 =?utf-8?B?a0ZKMXVxWG1WcW5XM25MYitIb2NsUWI3WUNxL1ZlZTZLQ05qVEVaS1ZIWTQ4?=
 =?utf-8?B?MWs3eUg4azlDOGI3ejVtRjhwSE5RVnozTXJZUXVUOWxDMkxFOG54aDkvYzk5?=
 =?utf-8?B?RTFOUzEyVXVTU2dzb2d0V2ZhT2hTTE5hbFhGZzFlbGNJTzdFNEZFb0duS0dp?=
 =?utf-8?B?cWUxN0FVUml5UHdHelArUzBndVYwcGpJcHBCTUpaYzVRa0EwZERsL2ZGNlpa?=
 =?utf-8?B?OXh6d0hWRm02WG5NaGlDc0R4RU1YSWdCbTBuWWVJeGJ6eHZJenN3QUpFNm95?=
 =?utf-8?B?QlF0V29QOE8zdXpiRUZNcFg2aFI4NDhtQXdYTUZrTGNFM0JaYjE0VDlsZVFO?=
 =?utf-8?B?bG45NlBLNlJpams4blQ3TGgvNVNUeFQ2UFBuR05kVkJwWFBUMURxdnpSS3l6?=
 =?utf-8?B?ZmUyakVBbkg5YTVVbTRjWUpvQUFQZkJsbTkydzBJL3RZbVN2OTJQbUZ6V3Fx?=
 =?utf-8?B?cFNOakZQbTNrenBlT1N2U3dZQVdLNHBXbndwTFZkeitSL2wrOGdEQXhJNzZI?=
 =?utf-8?B?V2NnY3RBRm01T0lycEUrTWkxTkRuQlBvWVJuNjN0VnVuMmhrWmlQMlQxbWE4?=
 =?utf-8?B?TXlZVTBpS1lHbDV2MGZRN1hMSk9RaXFTVGhpaVNzTC9RT3hETkdGMGJOSW5J?=
 =?utf-8?B?OURiNENRb1lqMElDdjY4Z0JGVEZrK1R0QS91TkowbHh4WTZFM1RSekthTjhD?=
 =?utf-8?B?MDVKSEJlWUw1a2M3Zjl6UkV6UCt1ZFhVVUxhZkRGWnV2dVMyb2tNZVNMRGN4?=
 =?utf-8?B?eVZsQXVnVHVlYUdyTWhaRjdadG83RzFMK0Q1R1g5QUp0UlZjWFBrU0VmTHNY?=
 =?utf-8?B?U20xKy9Kc0h1Qlh5WHoxNHpObUpkNnpkZW11dXA4UWNjdG54QVFUaWNBcjVv?=
 =?utf-8?B?Nnp6cTEvVGQ2dGQ4dXJwdkRaS2ZrVXYveWx6ZXFTdjdFYUQ2N3djbDBYa2hs?=
 =?utf-8?Q?xosHIqfab1x9gOFxOaRAn1n3y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2FA7EB6A245054BAF2FA369A01A4619@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7b6740-79f5-4de5-ce06-08ddb55ff9b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 09:49:57.1933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGZrvQE54Dy4wUQdOg0NYdTVw0DqKvZn41P9+pUkwO7aIZV6OJdZQWrqC8bHDmK8dYNWgj6h5nfUpso6T3qOyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8265

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFRoZSBHQ0UgaW4gTVQ4MTk2IGlzIHBsYWNlZCBpbiBNTUlORlJBIGFuZCByZXF1aXJlcyBhbGwg
YWRkcmVzc2VzDQo+IGluIEdDRSBpbnN0cnVjdGlvbnMgZm9yIERSQU0gdHJhbnNhY3Rpb25zIHRv
IGJlIElPVkEuDQo+IA0KPiBEdWUgdG8gTU1JTywgaWYgdGhlIEdDRSBuZWVkcyB0byBhY2Nlc3Mg
YSBoYXJkd2FyZSByZWdpc3RlciBhdA0KPiAweDEwMDBfMDAwMCwgYnV0IHRoZSBTTU1VIGlzIGFs
c28gbWFwcGluZyBhIERSQU0gYmxvY2sgYXQgMHgxMDAwXzAwMDAsDQo+IHRoZSBNTUlORlJBIHdp
bGwgbm90IGtub3cgd2hldGhlciB0byB3cml0ZSB0byB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIgb3IN
Cj4gdGhlIERSQU0uDQoNCkkgZG9uJ3Qga25vdyB3aHkgeW91IG1lbnRpb24gU01NVSBiZWNhdXNl
IEdDRSBhY2Nlc3MgRFJBTSB3aXRob3V0IGFueSBpb21tdSBmdW5jdGlvbi4NCkl0IHNlZW1zIHBy
ZXZpb3VzIFNvQyBtYXkgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLCBob3cgaXMgaXQgc29sdmVkIGlu
IG90aGVyIFNvQz8NCg0KPiBUbyBzb2x2ZSB0aGlzLCBNTUlORlJBIHRyZWF0cyBhZGRyZXNzZXMg
Z3JlYXRlciB0aGFuIDJHIGFzIGRhdGEgcGF0aHMNCj4gYW5kIHRob3NlIGxlc3MgdGhhbiAyRyBh
cyBjb25maWcgcGF0aHMgYmVjYXVzZSB0aGUgRFJBTSBzdGFydCBhZGRyZXNzDQo+IGlzIGN1cnJl
bnRseSBhdCAyRyAoMHg4MDAwXzAwMDApLiBPbiB0aGUgZGF0YSBwYXRoLCBNTUlORlJBIHJlbWFw
cw0KPiBEUkFNIGFkZHJlc3NlcyBieSBzdWJ0cmFjdGluZyAyRywgYWxsb3dpbmcgU01NVSB0byBt
YXAgRFJBTSBhZGRyZXNzZXMNCj4gbGVzcyB0aGFuIDJHLg0KPiBGb3IgZXhhbXBsZSwgaWYgdGhl
IERSQU0gc3RhcnQgYWRkcmVzcyAweDgwMDBfMDAwMCBpcyBtYXBwZWQgdG8NCj4gSU9WQT0weDAs
IHdoZW4gR0NFIGFjY2Vzc2VzIElPVkE9MHgwLCBpdCBtdXN0IGFkZCBhIDJHIG9mZnNldCB0bw0K
PiB0aGUgYWRkcmVzcyBpbiB0aGUgR0NFIGluc3RydWN0aW9uLiBNTUlORlJBIHdpbGwgdGhlbiBz
ZWUgaXQgYXMgYQ0KPiBkYXRhIHBhdGggKElPVkEgPj0gMkcpIGFuZCBzdWJ0cmFjdCAyRywgYWxs
b3dpbmcgR0NFIHRvIGFjY2VzcyBJT1ZBPTB4MC4NCj4gDQo+IFNpbmNlIHRoZSBNTUlORlJBIHJl
bWFwIHN1YnRyYWN0aW5nIDJHIGlzIGRvbmUgaW4gaGFyZHdhcmUgYW5kIGNhbm5vdA0KPiBiZSBj
b25maWd1cmVkIGJ5IHNvZnR3YXJlLCB0aGUgYWRkcmVzcyBvZiBEUkFNIGluIEdDRSBpbnN0cnVj
dGlvbiBtdXN0DQo+IGFsd2F5cyBhZGQgMkcgdG8gZW5zdXJlIHByb3BlciBhY2Nlc3MuDQo+IFRo
aXMgMkcgYWRqdXN0bWVudCBpcyByZWZlcnJlZCB0byBhcyBtbWluZnJhX29mZnNldCBpbiB0aGUg
Q01EUSBkcml2ZXIuDQo+IENNRFEgaGVscGVyIGNhbiBnZXQgdGhlIG1taW5mcmFfb2Zmc2V0IGZy
b20gdGhlIGNtZHFfbWJveF9wcml2IG9mDQo+IGNtZHFfcGt0IGFuZCBhZGQgdGhlIG1taW5mcmFf
b2Zmc2V0IHRvIHRoZSBEUkFNIGFkZHJlc3MgaW4gR0NFDQo+IGluc3RydWN0aW9ucy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jICAgICAgIHwgNiAr
KysrLS0NCj4gIGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAxICsN
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+IGluZGV4IGUyZWExMmU5YWVjYi4uNmY0
Yjk4NzkwNjllIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJv
eC5jDQo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gQEAgLTk0
LDYgKzk0LDcgQEAgc3RydWN0IGNtZHEgew0KPiAgc3RydWN0IGdjZV9wbGF0IHsNCj4gIAl1MzIg
dGhyZWFkX25yOw0KPiAgCXU4IHNoaWZ0Ow0KPiArCWRtYV9hZGRyX3QgbW1pbmZyYV9vZmZzZXQ7
DQo+ICAJYm9vbCBjb250cm9sX2J5X3N3Ow0KPiAgCWJvb2wgc3dfZGRyX2VuOw0KPiAgCWJvb2wg
Z2NlX3ZtOw0KPiBAQCAtMTAyLDEyICsxMDMsMTIgQEAgc3RydWN0IGdjZV9wbGF0IHsNCj4gIA0K
PiAgc3RhdGljIGlubGluZSB1MzIgY21kcV9yZWdfc2hpZnRfYWRkcihkbWFfYWRkcl90IGFkZHIs
IGNvbnN0IHN0cnVjdCBnY2VfcGxhdCAqcGRhdGEpDQoNClRoaXMgZnVuY3Rpb24gZG9lcyBub3Qg
anVzdCBzaGlmdCBhZGRyZXNzLg0KU28gSSB3b3VsZCBsaWtlIHRoaXMgZnVuY3Rpb24gbmFtZSB0
byBiZSAnY21kcV9pb3ZhX3RvX2djZV9hZGRyJy4NCg0KPiAgew0KPiAtCXJldHVybiAoYWRkciA+
PiBwZGF0YS0+c2hpZnQpOw0KPiArCXJldHVybiAoKGFkZHIgKyBwZGF0YS0+bW1pbmZyYV9vZmZz
ZXQpID4+IHBkYXRhLT5zaGlmdCk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbmxpbmUgZG1hX2Fk
ZHJfdCBjbWRxX3JlZ19yZXZlcnRfYWRkcih1MzIgYWRkciwgY29uc3Qgc3RydWN0IGdjZV9wbGF0
ICpwZGF0YSkNCg0KSSB3b3VsZCBsaWtlIHRoaXMgZnVuY3Rpb24gbmFtZSB0byBiZSAnY21kcV9n
Y2VfYWRkcl90b19pb3ZhJy4NCg0KUmVnYXJkcywNCkNLDQoNCj4gIHsNCj4gLQlyZXR1cm4gKChk
bWFfYWRkcl90KWFkZHIgPDwgcGRhdGEtPnNoaWZ0KTsNCj4gKwlyZXR1cm4gKCgoZG1hX2FkZHJf
dClhZGRyIDw8IHBkYXRhLT5zaGlmdCkgLSBwZGF0YS0+bW1pbmZyYV9vZmZzZXQpOw0KPiAgfQ0K
PiAgDQo+ICB2b2lkIGNtZHFfZ2V0X21ib3hfcHJpdihzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCBz
dHJ1Y3QgY21kcV9tYm94X3ByaXYgKnByaXYpDQo+IEBAIC0xMTUsNiArMTE2LDcgQEAgdm9pZCBj
bWRxX2dldF9tYm94X3ByaXYoc3RydWN0IG1ib3hfY2hhbiAqY2hhbiwgc3RydWN0IGNtZHFfbWJv
eF9wcml2ICpwcml2KQ0KPiAgCXN0cnVjdCBjbWRxICpjbWRxID0gY29udGFpbmVyX29mKGNoYW4t
Pm1ib3gsIHN0cnVjdCBjbWRxLCBtYm94KTsNCj4gIA0KPiAgCXByaXYtPnNoaWZ0X3BhID0gY21k
cS0+cGRhdGEtPnNoaWZ0Ow0KPiArCXByaXYtPm1taW5mcmFfb2Zmc2V0ID0gY21kcS0+cGRhdGEt
Pm1taW5mcmFfb2Zmc2V0Ow0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTChjbWRxX2dldF9tYm94X3By
aXYpOw0KPiAgDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEt
bWFpbGJveC5oIGIvaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0KPiBp
bmRleCA3M2I3MGJlNGE4YTcuLjA3YzFiZmJkYjhjNCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L21h
aWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+IEBAIC03Miw2ICs3Miw3IEBAIHN0cnVjdCBjbWRx
X2NiX2RhdGEgew0KPiAgDQo+ICBzdHJ1Y3QgY21kcV9tYm94X3ByaXYgew0KPiAgCXU4IHNoaWZ0
X3BhOw0KPiArCWRtYV9hZGRyX3QgbW1pbmZyYV9vZmZzZXQ7DQo+ICB9Ow0KPiAgDQo+ICBzdHJ1
Y3QgY21kcV9wa3Qgew0KDQo=

