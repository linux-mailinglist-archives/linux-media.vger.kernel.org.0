Return-Path: <linux-media+bounces-20014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9309A99C9
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B106C1C215A3
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6BE142E9F;
	Tue, 22 Oct 2024 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bDg7TzPw";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MuNvw2Kx"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985DACA6B;
	Tue, 22 Oct 2024 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578615; cv=fail; b=mWY1U5zJ2Ks/YnZ1gtkQV+UkX9YH1vk6dwxYXO0OFE4SRdp3azr7ADU2px/ogIm7HEh95wPSkPHhBCVVGddsVrKJhYwJ3CTOIVBOpIwCbu2krD25ueymk4EYD2c0EkdU8D2RlAlUw9YmKVZN/gpNL0VSSasE2T2vaXGNjJ/cnWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578615; c=relaxed/simple;
	bh=f27gIEHXQ5sZd2tEBZaG/67sQ0pEHrM431CmszP40kA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CaKcY4hlaQq/DzUkzfH69Emv9Th5p1V7y3/oZ6MECfpx33uANxDXjMkOLyphOJ6+UUqdpHcXdQ8cbGxAZu4YqoMHh0p64r1uymNiJhjYBZwZ/wKS0MPXkgdedTgQHOBgu2mqcyoqEU3DVpWw4TfucmnHJHavhivyNHkB7VOsrWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bDg7TzPw; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=MuNvw2Kx; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 15397e40903f11efb88477ffae1fc7a5-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=f27gIEHXQ5sZd2tEBZaG/67sQ0pEHrM431CmszP40kA=;
	b=bDg7TzPwoymdPeKsmGjb/YPDUe05JvM87hWNve/4FSS/5ypI/CCt9+3Vys95MaAsAX8+lYBoCPcmUsJtjeeSVFJYRJi4lBlHJO6l0kAdIk6P5uvmPvnsxDGSO9pyVnWOs8Ju/eKXJGvcEwLd0BuzOT2uM+AKl3pD/bz4jxE18tI=;
X-CID-CACHE: Type:Local,Time:202410221414+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:9a0f9ed5-fcc1-4966-a139-1157a7690099,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:35de2c0d-1043-475c-b800-3262c01ea3e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 15397e40903f11efb88477ffae1fc7a5-20241022
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1451420454; Tue, 22 Oct 2024 14:30:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 14:30:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 14:30:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQolqo98PNysmlKb/aCzZU9bolgUMfX7YNtrqmLnEfhwN4QxqSZKLJScLQ3iqU/cdCTl3eV/Wp5w7Z5bmtKCF+SZbOqHvyeKdxCptQlLUQvpCIljrNXYsB2kAEcFMA/en9C3WFSEruj0h1AstemXGMPiHQ19LznpYxi6zvcWcw+GYIPSeNqTq1Xou3LdIkc+pdFHiE7fdNyd9zKGeGn4JKMkiLQrZXk1cT0VndVbyKqvRnzILDSHCZRUBnfgi2RScWRkRO+B/KaJ3Jw7kT6vgyO5LeA80qaw+apgSWZ/xTSrle3xxlyL5FipHIBwuHGI+miNMJtHCyoB3kQYREgu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f27gIEHXQ5sZd2tEBZaG/67sQ0pEHrM431CmszP40kA=;
 b=Atf01+6zWfhyirORcos/vlMnLSgRKRJAqxppACHnG6QW0b8cR4xBJNrsmqHE5+g1af6P47UDMbB/U9oDCPawLwhPY4wVPYzm21lA7psEReDKyv1oSNcHTzsPi6PC39sBAVcEH5/Q6RwVeCwZWcSy0u9mfga6o6CZePFMK3TuxGdj4ggtW6xemtIjb39nCXNYRnvuOlIyJ3JsN1iUjk+5HUbg6dFUrITmtmYQvgrO8TrgdvtKt4sXq6ALANYYNTRUKq2iiXbGccP4m91eiGOHjuqiMdzUBpW18rgZ6dYinqNLMmnfIxtzhG9RgQ2GqJkeuwohBv6TLvgcjvwR0R1Nlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f27gIEHXQ5sZd2tEBZaG/67sQ0pEHrM431CmszP40kA=;
 b=MuNvw2Kxs8LyxtJMDiOD91J7Nh5yCdlbyQOM9GrQ0ptCJ7qzGuNteoR/N7SfSqU4PogDvTG8lUeadftHklhTQobnr4H+VHQ8Oz3WSx6+wlTW4a6RRR1hrkY2FkW1+T1EsqiICtPp/LoFqcSgfwOnqHyuAhFnm3DMUez7BDrZnIE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8575.apcprd03.prod.outlook.com (2603:1096:604:279::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:30:04 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 06:30:04 +0000
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
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KSYyyA
Date: Tue, 22 Oct 2024 06:30:04 +0000
Message-ID: <5eabc3781ec8d65363f2cb7207e66703f3cd0c17.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8575:EE_
x-ms-office365-filtering-correlation-id: 8bee2d58-030b-48a2-9bf7-08dcf262f70f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ekRvMWNodjlrQmVieUVCK3NHSFJXT3dxVEhuOHp6c2Urd1B2dEhXZVlHS0hp?=
 =?utf-8?B?UVJ4SmFGOEVFZFhmZFIyS1JIVDl3UGZGbUFleDRlbHVuYVdvZDFUcTVCOUpu?=
 =?utf-8?B?OTNUV0Q4M2U0anBpVFcyeVZpRElnSzRBMHBYVTMxNXYxOS9XZ0JOZVBkOCtj?=
 =?utf-8?B?bGI1VlYzT01kTGN2d2tCSTdwQi82QVYrMFdkK0ZkbHZ2U0g1amRWWHFza0NI?=
 =?utf-8?B?Ym9ZemRTQTkyWEZWSFFFOC9TczU3VXdHVlRxdTZwemRSNFpDTlU2UTF3Rm92?=
 =?utf-8?B?YlVsZGVNQnRKTk1XYktkN3lWWGJPdUhKM3gwMHNyYUVBazk1cHRMM2YzRGF1?=
 =?utf-8?B?WlNXYVozaXU4V0RNaDlwZDNGTWIxMWM5MldiRmNsVkNHSDJUcTVTKzBaOUF4?=
 =?utf-8?B?Rml3Z0NDUXpyaXV1ZHFEQnRvc2ErNktLbktZSjhjM2ZzN3loNWtVYnQ3M3F6?=
 =?utf-8?B?MzNBcW9IR2JZRS9NdVBVUGUyM0pCTjJTRHdIZFZhcHdjN2loTUdUalNLRHZG?=
 =?utf-8?B?ZmxnaVQ5QWxleUtldkM1OWtNR0tUK3FwcjZveGhOTnVUSW1kUjFETFB2dWd6?=
 =?utf-8?B?TWtHWnJCUVVRL0N5bjh5S1JwREJzbWdySE1HUjlnVW92NXl3cUI5OXptTHNl?=
 =?utf-8?B?cGU5VXpIajlwYU5qSWZtVGQ5SnVRRzNOc2ZVWW1kR1RWelY0dGRtOVRYTGg4?=
 =?utf-8?B?N0x5NUZyVGp4azcwY1A2aFN1WHNjeVB0SUsxdDJoVW1oZkhXaFlsQjZqbytz?=
 =?utf-8?B?dTIrZmhTQWZSNzVVRjlJcFpxeVlub295V2wyRnJaOWl3WDQzZTZRa1AvMndk?=
 =?utf-8?B?dmZYZ29tWUR0ZmNGL0tZRE9TM1JxM3R3OTEyQ25paHJYcWFxZ0lmb0VTNE50?=
 =?utf-8?B?Q3dHRlV4cmllQ1NsMGx0K1V3NjgvYlk5WEE2bmFoYUcxUjhXZS9ZOFErU3BM?=
 =?utf-8?B?VFRSTGdvL291WWVvTUwrSy9wU0x0Um9vMmlWeHhCOEllRjI3eXkzM3FKR0pn?=
 =?utf-8?B?VCtCQ2lWb1ZocHVtL2tyaU1nVkE4VjE5VS80b1ozMkFOMXl6aTJRYlEyVGxL?=
 =?utf-8?B?dnRuRkllZWRrb2tCd0tiV0ZSazBxcGV3d3d6cHlRRWlnTGp6WXZQVUVmZTEx?=
 =?utf-8?B?ZDZQWS8rNzlmdTBjWWd2elJxRDhKWlh3b09wcGw4VzRVZndOekpjMlBzTUlk?=
 =?utf-8?B?UWtWV3ZVNkhpc2RTeVVWcVVtem5wWkJCd1Z0NWxBUFhMNHM5ZlREczRtM2oz?=
 =?utf-8?B?V012VUpPUzVHZjhrT2xkR3p1aG1ud0NGNG9YemZMTjBhTklWZWh2M3R4Z3VW?=
 =?utf-8?B?SFNhRitkMGFzTFhWUHBibDR3R1RRYkxtNittV28wSnNNYmQ0NGNjSm1CM21o?=
 =?utf-8?B?TlZtU0k5WWd1SVNXRC82Nm10Qmo5S2xmcWhGYklWNVd4ZC9ocnRMUk5qSm1E?=
 =?utf-8?B?V3hYVzJBZmtHWVhFVmxSdkJubmhPVWxlOC8xRjJCa3N0eGgxZE4yVi95TmNC?=
 =?utf-8?B?ZkRLZUp1eGtrd0JyaUZJbm1QVU1qVmMzUWdFOEsrMnpLM0o2YjQwUXZVYjJN?=
 =?utf-8?B?alJjMXNZa1dwRUY0MHR3WnhRbjVPQ2ZhYWZLTGJ5MXpMQzcxa3ZEWHFMczVF?=
 =?utf-8?B?UHBZNU1HK3BhckNDdVIwaDRRcm1zTVh6emhFZ3N4dGlyWXRDeTJyUWxmSkdP?=
 =?utf-8?B?UDdISVlCWTE5OGdscFpNL1ZxUS9KZStLUWdubXI5Z0J2YzBEWndLa1VFckUv?=
 =?utf-8?B?ckN2MVJOaGVSOGdOY3dPb25sVnZnUW9uZTVKWEdtWE9ZdllKalZaTmRCbXcw?=
 =?utf-8?Q?ChF93bUPv6XqJJvaW9TQ9KOcC0cmGmnyH7M8E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEI1VDcyTXhSdlBGVE56VGJQeTFiWG43b0pNUHI5Y0luRG1FQVpLeW96R01h?=
 =?utf-8?B?ZStpNFo0a2ZuSXNxZGlyYVJIUkpPNXRVenFranpMc2pGdXJqQ00wMGh4NkFa?=
 =?utf-8?B?RmZuWHUxMGNocUxjdlA3SWdURk9uU3phVTcrYm1iM1MwVk9CV0hicFh3R1R0?=
 =?utf-8?B?N0d2dmtIMEdHMkx1NmFHekpPZ1NqbVVpTE5pbnkvdkoxdzlkdnJ5eXNkczdv?=
 =?utf-8?B?MXMwdGUrZDhCcDEwUndYS3QyOUEvUS9RUEZTMU0rVE5XNVoyaXZ6cU5USWpD?=
 =?utf-8?B?eVB6OCszRjlxUm1jQzRqTG1mR3FXTDJsbWQybnMvbURWOGVKN0NudVNwRlRE?=
 =?utf-8?B?T1FyRkRjS0p1Y1FUdGlub0NXM0JTWTVWSFhWN0hmWFVDejdBcmlsWDhEcmtH?=
 =?utf-8?B?VllPeWs1S0tONlJvNUNHZEpBU3NGRnZwdU41K09RTE5YUWdwU2FTNC9zejBM?=
 =?utf-8?B?MW5SNGJPTHJqajE5b1hwMUdpSXYrL3pCRUM0MWFjbzg4c2JLUFREcXZJckpY?=
 =?utf-8?B?bWFnT3BGeTdmTmpnTWhsZm4zZ0w1NVRpRHdFaWdGUmgvWjdVQU01Q0pFbi8v?=
 =?utf-8?B?NkZIV1U1eWxldnV2K25SZkZVbjFlL2x6eklLVVZWR1JoSmQzMjl5RTkzR3pa?=
 =?utf-8?B?ckR1QzN1ZEZ1MHBKamdQRzJzVW16SktNM3lnUXhCYTl0M2dSL2NwZXFLYyta?=
 =?utf-8?B?ZFJaMUc2S2QxRU5VTCtCaUQvVG5jVzF2NlpKckl0cWl4RkdpaWJVTzc2SzdE?=
 =?utf-8?B?T0dDalV4cmpVMnZUUWNOVHUvM01QdVdLdHpuazFDdFE4azh0bldURDFibjRI?=
 =?utf-8?B?ZmhUWE82WS9FNmVvVjlyWHNxNVU5N2tpSFNETlMzNlliRjJQb3d0bmpJK3Bp?=
 =?utf-8?B?eGUwSTFRZG0xQmVpSzhhZUN1cXlseW9HYXVrb0dzandJb1JvTUdCbCs4VEJt?=
 =?utf-8?B?L3pUanRUK2hERGdkOUhVeCs5dnRrUWluejlRYTJkN090RXN5TTgrb0NmTVR0?=
 =?utf-8?B?YmFDN2hybmFpWFJUa1gzb3NBd3YvUDQrdEI0K1RmWlpwbm9VM3RzSGRWNjQz?=
 =?utf-8?B?WmlIa1QvWW1zQW84d3p3a045QjZoQWxCb0s1OTAxVklsNXpoKyszRlMzcm94?=
 =?utf-8?B?ektIM3AzY2d3OGZ2cUZaZWFkSFVYOTZZNURGL2w0QW5PaTNPZC9VQWltcEdn?=
 =?utf-8?B?TjA5WFgydVhiZ2t1T0p2bSt0UHhtakNmVHZBWHNvcTZUblZ4RUhsUjBUOWF4?=
 =?utf-8?B?TXFhN3pZcE8rUkhuWGV4WktyV0JoaHJ3d1VJeit4LytHUEVIdDFoeFFTN3U4?=
 =?utf-8?B?SFpBckVXZHMzN0ZOZXZkaDNtOXE4RmdZVmVydjVpakJLdnZzLzNicTRNaUVy?=
 =?utf-8?B?NjVJdW5OeFlWOUlFcC80UFN0QlVuT0w4UE0zd3NQV3A0OUxNRmRhYnJOSjd5?=
 =?utf-8?B?QkF1Umpqelg1RWVRMTE5UVFZVm50UStiZHMwanhXR0FGMXM0eVpka1hzVlJY?=
 =?utf-8?B?eUQxdUZucUZRK05mby9GZkZrRlYxeDU4N05ERGYzaHFCOUlTSUV4RG5wcEVS?=
 =?utf-8?B?M0NsNW1iOVBKUXpGaSttdWs5SU1maysrTXU2QURrNjYxN2NLOXErZ3N6V1R0?=
 =?utf-8?B?NzVJMkFTT1djd3NNVlNmZGpaNWd4cjJESUJiOTB1bjZhT0NyNGFVM0RpMXZ4?=
 =?utf-8?B?MXVGcENTUzgwQTdRL0FGMWQ3aHVMVzZjUlJQdTk2SE52RjJCR3VwdUZKSmha?=
 =?utf-8?B?TmR3dGV6V2d4TDlNRkd1dVBEclp2Wm51RWs2NUhSUjc0MFBndEduenIzU1N2?=
 =?utf-8?B?UkFFMUxKakpqd3FPVHV1ZnZCZFM1UkFBaWlxc2JQM1I2a0ViYnhCQlNvRkZh?=
 =?utf-8?B?cWNIT2EwUTJjUlZpUzZSS3d5R3RtdkhXblhWcTd6cmxRNmU5c2RZK1g5Qk1x?=
 =?utf-8?B?TDB2b2tPcG9la3FQYm1PWWVIOHFVYzBoMVVCM3gxSGhhQVhoM3VPRDB6SmtU?=
 =?utf-8?B?eW0yUTRwTjJtRjB4V0picUFXeVZ2YWVSaC8wZm1vMUZCb0I4QkZMdEN3d1Ay?=
 =?utf-8?B?b2NtMDcyaWljVkk0c3NtNk9oT0h4a0tObmdpaFdyUE9BY1UvMmdBdDBLVHJr?=
 =?utf-8?B?c3BhYTRqbWtyaTN0VnRQQUJ6QUZwS2M1Wml1R0RwU3Q1Ykp0SjdjaHBuV2dK?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBD2EF234B12E942A969D8B38B37FCCF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bee2d58-030b-48a2-9bf7-08dcf262f70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 06:30:04.4957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3lKBSZhC97NKNP0YZ7X83ZXlm461X8jj5MSkqhXzWJV5cZ8hpvG9lTFqOGt6dCSBqLNRZ1m2dFWDGD2ekJtzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8575

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+IAkJCXNpemVvZih1
MzIpKQ0KPiArDQo+ICtlbnVtIE1US19DQU1TWVNfUkVTX1NURVAgew0KPiArCUVfUkVTX0JBU0lD
LA0KPiArCUVfUkVTX0JJTl9TID0gTVRLX0NBTVNZU19SRVNfQklOX1RBRywNCj4gKwlFX1JFU19C
SU4wID0gRV9SRVNfQklOX1MsDQo+ICsJRV9SRVNfQklOMSwNCj4gKwlFX1JFU19CSU5fRSwNCj4g
KwlFX1JFU19GUlpfUyA9IE1US19DQU1TWVNfUkVTX0ZSWl9UQUcsDQo+ICsJRV9SRVNfRlJaMCA9
IEVfUkVTX0ZSWl9TLA0KPiArCUVfUkVTX0ZSWjEsDQo+ICsJRV9SRVNfRlJaX0UsDQo+ICsJRV9S
RVNfSFdOX1MgPSBNVEtfQ0FNU1lTX1JFU19IV05fVEFHLA0KPiArCUVfUkVTX0hXTjAgPSBFX1JF
U19IV05fUywNCj4gKwlFX1JFU19IV04xLA0KPiArCUVfUkVTX0hXTjIsDQo+ICsJRV9SRVNfSFdO
X0UsDQo+ICsJRV9SRVNfQ0xLX1MgPSBNVEtfQ0FNU1lTX1JFU19DTEtfVEFHLA0KPiArCUVfUkVT
X0NMSzAgPSBFX1JFU19DTEtfUywNCj4gKwlFX1JFU19DTEsxLA0KPiArCUVfUkVTX0NMSzIsDQo+
ICsJRV9SRVNfQ0xLMywNCj4gKwlFX1JFU19DTEtfRSwNCg0KRV9SRVNfQ0xLX0UgaXMgdXNlbGVz
cywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNLDQoNCg==

