Return-Path: <linux-media+bounces-20017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1569A9A3E
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C42A2B20D32
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB445146D53;
	Tue, 22 Oct 2024 06:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kN0L6L4N";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MxUQ27VJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EFE13D509;
	Tue, 22 Oct 2024 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579734; cv=fail; b=BMnI/NjitdpZ+HtvJXSS6PleXc8YO38UUeL0Hs+JJkkujxxXfOTB56sexSE3Ggaui5WyTGivWmYNykZttvqrRrl6d+0abHb5BlKYspAIEbc2rYsXHYSBNc6KZq7VR9efwZe3e/v1YDvlF2viupr0eDFe8CT4/6xcgMsn255Do38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579734; c=relaxed/simple;
	bh=Ye+aZ0HZT8DHmw+nyFZosYCHNijr+PgDxknEGpW5tcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QGxRFEkM2FLQM2PEaEBJ1osbT34ILyUOVL/6M05iLfGsNZUBi9KjJpH4pYj/Vo2pfWaPcyuHG0OCrXDPPpPtVsZbDvDYT9lszTduu5HQUWf41r6v7L+dCMYolwvB7dI65T+hchlMMdfs9WlYjlCWCLb4bv2cVkU5QhvoX1YzjiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kN0L6L4N; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=MxUQ27VJ; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ada091da904111efb88477ffae1fc7a5-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Ye+aZ0HZT8DHmw+nyFZosYCHNijr+PgDxknEGpW5tcg=;
	b=kN0L6L4NbHdEJ8EHeFxW43tKLOUsvjqjoZTHNerx1PEC5c5o38Tm5sKFq+T3AuFTXPfJPuEPPwblo9/FHYOYTQh08x44ww23JQ5WulFSYrU1RvJApCU3126ALzJeytV+aNoUp5DirIpVU/0WnnNb5UrZkhm9eliux7sFoMiBuL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:4f12b1a8-4557-442f-8999-e42d3aeab7d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9feb7225-9cd9-4037-af6e-f4241b90f84d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: ada091da904111efb88477ffae1fc7a5-20241022
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1394366137; Tue, 22 Oct 2024 14:48:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 14:48:42 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 14:48:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWYXLInDkicvl1vnSAlhKQqQOy1yJblHd6CR3z/OKUctxslRR6eBEPvAzWUeVyhkB4r2FxaGcrCkTuUOdb4XtJlDc0VU97igHfLQSt4cMeMZNsUVJBGLHUQI9tOrEuVDyrRjyZIqQkCjx0qL+dXYsZ03EIYsF/k+nb42I8b206iC0h+zd29v4DvHUXILsbg2X5ujOewA8qpg+H5gAQsXFK067fwTjSq+LNarGRHkwbwhC5UM2EDG9maw9iJbaZuSb0MQIIduxui3o63akyHIX14uj/cYqd4RCb/HI82EmUOpvug2k+sa83VzuzJLqF+vi5yd8TzP586MvEHtjQjWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye+aZ0HZT8DHmw+nyFZosYCHNijr+PgDxknEGpW5tcg=;
 b=mGqvLyDvxe3J8oDb+Aq0Degqe+nuEXoULIvc7Ge7k6xEzLT0yye9Z7PiY9qlr+grNOwARXfrkfgcV4HTosPzusbKbfScfhVnSytfpNMGf/EG8c2eDlrECin6Iqw3PFqV6WxHwVOh5S8hjvNE6wvtOTfgMWKPPkEwV1KJhf4jQsvHkkvVXwDLSeHZwmjNKmytPB03dDctRnAuK08KFBQBsW5bbRVapJ4ZNYgzDzCYAYEB0ez6GjPX58C2g4SmmiHpdcsugEWUw7XlPsb8hNoAgXLrBGU0P7XwufFRHvxV+49Ab5X04UjXdl2r6qywqZbfkgEu1B8VKgG6x6aXEOOUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye+aZ0HZT8DHmw+nyFZosYCHNijr+PgDxknEGpW5tcg=;
 b=MxUQ27VJ9LOv2oMGtFB18MGtzd/qWQewUD0sQlnj4Ucglf8q0gYdJAy/TgwSa0cxmNg4FmlGN/0pYeYvtWzbjS0vzPUxAw5qX/NObHPKVpd+GqW7jeya+fktNp9al1kKQ+ZtFep0chJFweu3tZ8yZ0Y7gJVM8X6GGIQnWIV+PAY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6651.apcprd03.prod.outlook.com (2603:1096:101:81::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Tue, 22 Oct
 2024 06:48:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 06:48:38 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKSaFuA
Date: Tue, 22 Oct 2024 06:48:38 +0000
Message-ID: <b4e27ebf9abd3befd83073bb25d870abd48e7b83.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6651:EE_
x-ms-office365-filtering-correlation-id: bb521d4a-e94f-4862-7eb9-08dcf2658ed2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TzVDMmxXSGxYYXhVeklvYkI2Q2lyK1NyckNiN3REbUY2YzlNSisxUWpjdmhw?=
 =?utf-8?B?eXdEVmNWT0ZsQ010bnNxTUdEYUNHZUlRLzNnQm55QStvZnQ1djkzZFBoT1Fl?=
 =?utf-8?B?WU83UEhlN0VrNTAvZmpoRTF4WUswNi96UTArMFl0cktvZ3ZwVGhiWVBFUmRl?=
 =?utf-8?B?L0tUQUhJVTNra3VOTUtRR3lvOVlKNzVhWkpDN3R1aHFRa0xsWWlrUy94MTNR?=
 =?utf-8?B?SkNiWUFmQmdTN3NYcHZUN0RpMmtLMk9YMVdTMGNmLy9UVjZoMEdIQ3diVWtn?=
 =?utf-8?B?T2xEY25IcnJLdHcwcDhGNGxMbFMxeEpsNE9aUElpMTlQZExCNXN6MW5wejZE?=
 =?utf-8?B?NHdhQ0xuL2twZGZNQzhqU1lsbHNGSkd0M3hvQm1VcmlQZVAwMERNV0Zqa1Zp?=
 =?utf-8?B?QzJpcVVobUJVK29HOHdub2FIRW80QWxlUW4zall2cnZaNzNFY3FITFBZbVhj?=
 =?utf-8?B?OXlKK0lXaFRpZDhCNkRKdTFTVVltY1lWbTE1SU5udmw3bHpmUjFQeGE4bkNU?=
 =?utf-8?B?TzRLNnlzWndtOEtCTVJXNFJmRlU1RzVVWERVYisvOFJ0WTlaSGVSaDF3aEZm?=
 =?utf-8?B?VG4zS3h4QndkQWZ5L2FOMTdUQlNrSFlnQ0ZEaEQzekwwNWV5ZjJoczhaSnNa?=
 =?utf-8?B?OCt4b2swNDBNczBQQlBvdEdvSWVxVENJU1ZuVnZycytmM3owRFNtZjJ6aU1t?=
 =?utf-8?B?VVF6NHNUeHE5KzZJcHE1MmNHK2VKbUk1ek81MGZKbzZLallNb24rYkVKT0py?=
 =?utf-8?B?T0pWeGE0ZHBycWdQblF3dk1aQXB5UU96bGN4VmxhMm5LMmh3aHNkeldNYzdr?=
 =?utf-8?B?RXJTT2NBRkhCblFaR1MwbXVMQVBkRWhIQis4WG5hMkRTeXZYbzVGQ2crT3ZY?=
 =?utf-8?B?RnpCODFPK2RaekIxRlhxWldUVnpyVXBIV09vUy8zREY1cExvc1hueUkrSExJ?=
 =?utf-8?B?bWVucStrajJCME5id2tjVmw4SlY5WnBFUEJ3MTdXaGJkbXpueU1WTm5JN1hQ?=
 =?utf-8?B?UStmbG1WaUhRT25LeXZtTGtKOWlLTkIzVTd4cFZZdktIK1krbEpXOGRZdXVp?=
 =?utf-8?B?ckMxUEdsUWtzWHRkbDlLcHRNZTJHQXcrdGY0MGh5RmpCMUtYTjFzaG9iVWVv?=
 =?utf-8?B?ZG5nSTVES0ZwN2VRYVpUbElOOGs2dUdsQ3NKMkQ0U1AveEtBZlV3UXFQeXdN?=
 =?utf-8?B?MUZyNjlicXJBZjlqVmwxeWgvSmxXYnBISDYzam9CdkRJamtpL3hjMndmWHY3?=
 =?utf-8?B?cnluYUd4eEN4TmZUTFc1c2s2aFgrWmpZNnlvOUVmQUxDMmNDMXdQbzg5MWZ2?=
 =?utf-8?B?enNxY0srSlJUbHhOSWprT0JhODloNGxtUVNRakJEWlpLODhkMElIbnQ3VFNN?=
 =?utf-8?B?aFFidm9PYit5S3FiMFZWcmhwSUFUeHRJZWFnUHZDaTRnNjRJcHR5RTFEdFJy?=
 =?utf-8?B?NVBmRG5HZ1EwbURaUzB1YWNwZUZOQmxmbUlUOE9vQnJTTHJ6K3pjS2JCbjN5?=
 =?utf-8?B?clozbHFNMHBncXk0R0w2di9xQTdDeVpZYis5eWxmeU1KS0NDK1d2RWY5Q1pt?=
 =?utf-8?B?VmpsR2FMcXB1SFB1dHdzZkVFQzB5eVdwbEFuL0JPUFN5RCtkeE5ETUttSU9C?=
 =?utf-8?B?OVRPN0Riakhvc2NTTzVaWUFwL3czQktFWUJDVU5NNVNaVWN4TFExQk53NWZH?=
 =?utf-8?B?RS9EWEFCY3lRR05EemxDc1dLVzJRdnk3WERNRkxKcUpJT3BSSXhWK0E2bmp0?=
 =?utf-8?B?R3F1cjM0Z2Jsb2FqMXRrRTRnQktUVWhTRXdLY3VyN0ExcTZGTnpCbFhwcDBG?=
 =?utf-8?Q?knspy9D49fb5mu+5bGQdIJeQQQmL3vwViL8Aw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z01yWm1aYTAvQWtUQUNUUkNQYWFEQko0alJTYkM3TXpjWldJcVl5Rm1FLzBt?=
 =?utf-8?B?K1Q2U04xamJuUXk4Q1p0Y1ZTOG5peThBOUZTL0hLS1hML054LzhucmthN3Bw?=
 =?utf-8?B?WEZVbm82NWM5eUt0UWU2VFJ5K3UrYjdLb2Q3NHRTU0Q4YnQ0RGtMUldkSjY2?=
 =?utf-8?B?UnI4Vkg4bVdTNVU1ZGNoUm5LNWFuWmp1SEtkMTJpY3hEQ0FKd1VNaExQU3Js?=
 =?utf-8?B?YkZsbDhhZTh6eGs2b2V2ampaN3BTWDVYR0dITEIwYTQ3YTBoRHVVelQ3Q21P?=
 =?utf-8?B?QWlHcmJrc2V4TUN5bnRUME44bjZUcWdWVVBmKzgvWVhEWEFGR3J4N3E5UVJ0?=
 =?utf-8?B?UEpVaE52UWtyRGphVGFPNWVEK2wyaWpqNE1UWkZ1Z2NVWm5PYkc2dzR5MU1s?=
 =?utf-8?B?OFAydnJ3aUJRTGltMTZLNW5ESXorcVErS1VVcFlSS1JYanFLOFljbjd2ZzJP?=
 =?utf-8?B?LzFBNzBwbE43bUFIZDdyVUxTSmt3NEh6UXFjZ2pLK0JqaUd6R2lBRVlEY3By?=
 =?utf-8?B?RnRHLys0d1FneSthbjN4VXhzc0oxbEc2VmY5OTFXZG9mcy9ZcVRWaG56VUo4?=
 =?utf-8?B?ekhIVE9uSjZjbkNjUWNSc013WTM1MzFVb0NuNEgwTGJWdHR6QUpnd0NGdlU2?=
 =?utf-8?B?Sm5NSW9aem9PM1paZDBrZmlmRHFCbEQ3T01ZYlBydnhXYk8weXlwQjNnWDBu?=
 =?utf-8?B?MFJrNFFRZkZYaTA5MmY3c2JFczJCSEFDOVB2YkVZTnpPUm01VkNFRmlGVnU0?=
 =?utf-8?B?L09jNVhCL0FCTGc3bzV2eC9nWlQxM2RPczR1alJSei9Zend2QVRrQVdMcFoz?=
 =?utf-8?B?Y3Rlcm1aalEzakVFRkVrMktDclUzSFdVaVF1aEM3b0tyN0cvVDczQ0hCSlpJ?=
 =?utf-8?B?NDJMeDJzNHU5L2hseXhYekpLQUducUNVTml3ZkRReGl3dkJZOEpZVHhRL2Z5?=
 =?utf-8?B?SVdzQk43dFJKUG9YeFlvVnBYRGZCUzd0ZjI3dlNZTmt0Zm1hK2ozNnN1bU5R?=
 =?utf-8?B?Q2ptN0F2dUFyeWs0RGRjdlZGQm1WWHNPYWlPSVowaEVBRTJuck5GTEpuMnFl?=
 =?utf-8?B?UzZKcytPekxvZGNGUzF2bXIzcTBpRmh3WWZTcm9IdUloOGVnRldYUG1GWnhJ?=
 =?utf-8?B?dDdXcnhkUXlkVmM0d1loZnkxaU41Unp3TEp1VlFTb3pCdGxUS2l6eWtsNXNC?=
 =?utf-8?B?czNqRkwrTXZEMmtYTkg0OFVJcytFOGJ4M0hEMXN4aVJhbHhqK2E5TXBJdC9U?=
 =?utf-8?B?dnJuUENidSt5RUNsRVlDZ1M4MzVGT2ZhRWdrbUdGSnFqUTA5cEQzZlJ2NUR6?=
 =?utf-8?B?WmdSOWtRS2RsQkhySlhFODVKWmJhV01HUE12RUtzRnJJN0NpR281aEYyR1pC?=
 =?utf-8?B?UDhEdXgwY1REYWhUM3R2UXk5WXc0YWEyZ3VVazJuZ3E3eUE3UFQvcy9ESTFS?=
 =?utf-8?B?RWdnQW8yMlZCS1RUYWlJcG1KblJrT2JEODNvMXp1cmx4VWFjRXV5T1VTQ0Fy?=
 =?utf-8?B?ZzFwYVNWYVVjT2xKUytycm9XSENlYkVZSTk0YjFsSSs4WGtJdE8xMVFYRXkx?=
 =?utf-8?B?V1FnSkRiUEdta3lmckRwUkpaQWhucjlkcXd5UnpyNzFoY2JETXp5OTk2bEVJ?=
 =?utf-8?B?clIxTUg4OUpBSkdsajlxcXJVUGt4UCtsZlJmQjJkcGJHV1p2YXYrSXBMb3ZE?=
 =?utf-8?B?SUN2MlRtZVh0VWY0SEhXSFNJQVp4dGlZcDBOekozaURFTFNoNHZnSVlFcG9H?=
 =?utf-8?B?ZlVQWkdFbXNPWDc1RWozM25rQzZhM1VGZWMvVk1WcGZzMHRxc1hjajZTS01j?=
 =?utf-8?B?cUdRc2oyRWZwVUtKRXpHM0RCamNJZkY2cGw4QUt1QXhaRDlwRXprUHVybmRP?=
 =?utf-8?B?eUY1ak5hSzMxdTB1VU1VdU12K1AxUzd6VDJ0YlYvbFI0R2xvNm9tYTR2UFNL?=
 =?utf-8?B?RVV3aEVlYzI4Wmx0b0NEUkhoT0I1S0RXSXdyR016aFBFTlQ3RFYrVmZlQktF?=
 =?utf-8?B?MGx5ZDdmK1NBcERFM3VnellqdllQRCthWFlPelFvWkVjQnI3WGdOb05QZFd1?=
 =?utf-8?B?RTk0cHBiZ3V5MkZ2UDZhNmY5VU9sYVJBZDRmYkZtYllpNkpOQ1hGQlA0Zmln?=
 =?utf-8?Q?qu6pfDHkE2rLTlsx0mYgasA2X?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C87D4F04D41B404C8574F47480F9FB27@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb521d4a-e94f-4862-7eb9-08dcf2658ed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 06:48:38.0930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQ/rc5E2JQrrJmOi4FexLdWOQQ4fOs47/oafJMlakfBqbi7Si5m6z27EDnTPqY75/uJiA8nEv2dndYwifk62PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6651

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdGF0aWMgdm9pZCBtdGtfY2FtX2NvbmZpZ19yYXdfcGF0aChzdHJ1Y3QgbXRrX2NhbV9k
ZXZpY2UgKmNhbSwNCj4gKwkJCQkgICAgc3RydWN0IG10a2NhbV9pcGlfZnJhbWVfcGFyYW0gKmZy
YW1lX3BhcmFtLA0KPiArCQkJCSAgICBzdHJ1Y3QgbXRrX2NhbV9idWZmZXIgKmJ1ZikNCj4gK3sN
Cj4gKwlzdHJ1Y3QgbXRrX2NhbV92aWRlb19kZXZpY2UgKm5vZGU7DQo+ICsJc3RydWN0IG10a19y
YXdfcGlwZWxpbmUgKnJhd19waXBlbGluZTsNCj4gKw0KPiArCW5vZGUgPSBtdGtfY2FtX3ZicV90
b192ZGV2KGJ1Zi0+dmJiLnZiMl9idWYudmIyX3F1ZXVlKTsNCj4gKwlyYXdfcGlwZWxpbmUgPSBt
dGtfY2FtX2Rldl9nZXRfcmF3X3BpcGVsaW5lKGNhbSwgbm9kZS0+dWlkLnBpcGVfaWQpOw0KPiAr
CWlmICghcmF3X3BpcGVsaW5lKSB7DQo+ICsJCWRldl9lcnIoY2FtLT5kZXYsICIlczogY2Fubm90
IGZpbmQgcmF3X3BpcGVsaW5lLCBwaXBlX2lkOiVkXG4iLA0KPiArCQkJX19mdW5jX18sIG5vZGUt
PnVpZC5waXBlX2lkKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiArCWlmIChyYXdfcGlw
ZWxpbmUtPnJlc19jb25maWcucmF3X3BhdGggPT0gVjRMMl9NVEtfQ0FNX1JBV19QQVRIX1NFTEVD
VF9CUEMpDQo+ICsJCWZyYW1lX3BhcmFtLT5yYXdfcGFyYW0uaW1nb19wYXRoX3NlbCA9IE1US0NB
TV9JUElfSU1HT19BRlRFUl9CUEM7DQo+ICsJZWxzZSBpZiAocmF3X3BpcGVsaW5lLT5yZXNfY29u
ZmlnLnJhd19wYXRoID09IFY0TDJfTVRLX0NBTV9SQVdfUEFUSF9TRUxFQ1RfRlVTKQ0KPiArCQlm
cmFtZV9wYXJhbS0+cmF3X3BhcmFtLmltZ29fcGF0aF9zZWwgPSBNVEtDQU1fSVBJX0lNR09fQUZU
RVJfRlVTOw0KPiArCWVsc2UgaWYgKHJhd19waXBlbGluZS0+cmVzX2NvbmZpZy5yYXdfcGF0aCA9
PSBWNEwyX01US19DQU1fUkFXX1BBVEhfU0VMRUNUX0RHTikNCj4gKwkJZnJhbWVfcGFyYW0tPnJh
d19wYXJhbS5pbWdvX3BhdGhfc2VsID0gTVRLQ0FNX0lQSV9JTUdPX0FGVEVSX0RHTjsNCj4gKwll
bHNlIGlmIChyYXdfcGlwZWxpbmUtPnJlc19jb25maWcucmF3X3BhdGggPT0gVjRMMl9NVEtfQ0FN
X1JBV19QQVRIX1NFTEVDVF9MU0MpDQo+ICsJCWZyYW1lX3BhcmFtLT5yYXdfcGFyYW0uaW1nb19w
YXRoX3NlbCA9IE1US0NBTV9JUElfSU1HT19BRlRFUl9MU0M7DQo+ICsJZWxzZSBpZiAocmF3X3Bp
cGVsaW5lLT5yZXNfY29uZmlnLnJhd19wYXRoID09IFY0TDJfTVRLX0NBTV9SQVdfUEFUSF9TRUxF
Q1RfTFRNKQ0KPiArCQlmcmFtZV9wYXJhbS0+cmF3X3BhcmFtLmltZ29fcGF0aF9zZWwgPSBNVEtD
QU1fSVBJX0lNR09fQUZURVJfTFRNOw0KPiArCWVsc2UNCj4gKwkJLyogdW4tcHJvY2Vzc2VkIHJh
dyBmcmFtZSAqLw0KPiArCQlmcmFtZV9wYXJhbS0+cmF3X3BhcmFtLmltZ29fcGF0aF9zZWwgPSBN
VEtDQU1fSVBJX0lNR09fVU5QUk9DRVNTRUQ7DQoNClRoaXMgcGF0Y2ggaXMgdG9vIGJpZywgc28g
bGV0IHRoaXMgcGF0Y2ggc3VwcG9ydCBiYXNpYyBmdW5jdGlvbiBmaXJzdC4NCkxldCB0aGlzIHBh
dGNoIHN1cHBvcnQgb25seSBNVEtDQU1fSVBJX0lNR09fVU5QUk9DRVNTRUQsDQphbmQgYWRkIG90
aGVyIHBhdGggYnkgb3RoZXIgcGF0Y2guIE1heWJlIG9uZSBwYXRjaCBmb3Igb25lIHBhdGguDQoN
ClJlZ2FyZHMsDQpDSw0KDQoNCj4gKw0KPiArCWRldl9kYmcoY2FtLT5kZXYsICIlczogbm9kZTol
ZCBmZDolZCBpZHg6JWQgcmF3X3BhdGgoJWQpIGlwaSBpbWdvX3BhdGhfc2VsKCVkKSlcbiIsDQo+
ICsJCV9fZnVuY19fLCBub2RlLT5kZXNjLmlkLCBidWYtPnZiYi5yZXF1ZXN0X2ZkLCBidWYtPnZi
Yi52YjJfYnVmLmluZGV4LA0KPiArCQlyYXdfcGlwZWxpbmUtPnJlc19jb25maWcucmF3X3BhdGgs
IGZyYW1lX3BhcmFtLT5yYXdfcGFyYW0uaW1nb19wYXRoX3NlbCk7DQo+ICt9DQo+ICsNCg==

