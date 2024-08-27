Return-Path: <linux-media+bounces-16865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD8A95FF79
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 04:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCCD71F23357
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 02:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45593182B2;
	Tue, 27 Aug 2024 02:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hWudFVeV";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ViQmAk4v"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596B1AAD7;
	Tue, 27 Aug 2024 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724727548; cv=fail; b=G7D4tH/cAYwLQTOuNZoj0uhM3+fI2YPd07VFEqtQf1UTZw8SDK4apBoGt15bcIVMqpnhMyKQr5IQ4hD+p1PoacfSEioqLdBtUcbGnAbHNkr+pTMoGFwY/jbCFvD/CfD/UCHxBR4VtoGl4n2nIGbKQETwrrfBu9RRhhSh7eIbMlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724727548; c=relaxed/simple;
	bh=908xWec7psfsRtW+49gHHtmj2XaRfu4HIKRLLnfY+WQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uuslKeeYbIicy/1KQMsZkOGNtkF3ALfVsaoLFj0tFgqWZFzLu8Cp/uFcCpDPY3473ji16bMcdyLbja2JXHim9qbw0S+aX9ZRDCJplk/duDUjDF/NLUImdBSTeCSNSZJmsLMim8SEqTifNidrSG4VRYn8jDQPhGZJiwq0svRju20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hWudFVeV; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ViQmAk4v; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4dcbfb20642011ef8593d301e5c8a9c0-20240827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=908xWec7psfsRtW+49gHHtmj2XaRfu4HIKRLLnfY+WQ=;
	b=hWudFVeVzHVeDz/OzBTK1sc+Hfr47WGLgUOo6vGfyrqD7tHsYEvIvHRVCLG/T7edr1nT6nkYaiNSFrEv6nB6OcnXJNMnFggWmUlHUI2Qi336T9iDdISBi6dvOrkP0GDMz5CADYzQHc/932kuoI/r/1WAqyE1doN8CNIvQHrPqHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:01d72394-202c-4366-938d-95bdc200f8b8,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:7c88d714-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4dcbfb20642011ef8593d301e5c8a9c0-20240827
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1694287026; Tue, 27 Aug 2024 10:58:57 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Aug 2024 19:58:58 -0700
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 27 Aug 2024 10:58:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSWsqAQtfkbZ79pWFy3ajm4bgPCAz3FSHsexWB/+NTIDkCAZbmYH6kHIGVbeC41uGjBD1z/TqeR+hJlY2EcLgCFQ3MQtM4A40L/HeaGT7km/AoGUpC2MFNPzDgCPioXO3BhMyovNm20MzvnQhTJx75Pm/MuZpuhbHGe3XQl0ciXbyBrg8yUwQFDtEjIKoWbEfqbbs7uZtn3aujSWH4KtchTptbzA9r1gAto+lgMlEA9IX5hoYCF2Cgwg0OhCdhXP85kXL1p6MfGRCOQ6wwC5L1d7d2LAgfaoX/7xQoTiAPZv7X/Tg2cmrao4rKQbTo3IkETEh2tDsFUBZhhqdlz0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=908xWec7psfsRtW+49gHHtmj2XaRfu4HIKRLLnfY+WQ=;
 b=Tlki1VFSyubgam/3p1Lz9tq0Q+Kyp40q8RtqOCd7nEVQqC9t8oryjO1+Mj3hzdEYnPhLsWWxZ3OE0DHpbLatkiMH8vNFUgwNi1FClWU2jXWBBw1zWuglOSYw1rQ/OYtkHl39f7XwU2b9UI9DGaLTV1Aem/GySQyj1pLNEVAdzK4K1ljgwEGeLt/J5ZFI4bHYXVncTmezcy1ckEOjNZ2ug9GSkZk6z+c+FvARnqERZAfsId/wOqexVetYq2ApXNlWKsGgOXHO7MA1jsnZcZV166ebQxOhRNC0MtohrOxez9j3sLtk7VevkyUXNiw3iyHuV458OeytR77K7FUhZC0AUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=908xWec7psfsRtW+49gHHtmj2XaRfu4HIKRLLnfY+WQ=;
 b=ViQmAk4vrml6d4T17bc2delAdbo12624wCvquwnmPFhBxl77lUvCo0URoY1PptHp73vQIg/TtFES5uqJO5fisVysNRPlIb5o+710D0yAxS5swmSnXNsuxUkDqetvPdyR3X69N7xfu/D25ozmglMt+b/2318SLDEKRzIiHwbntyc=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by SEYPR03MB6996.apcprd03.prod.outlook.com (2603:1096:101:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 02:58:56 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:58:56 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
Thread-Topic: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
Thread-Index: AQHa6KNT8A91YPEu7USNz2xHos0eNrI1FaeAgAVzLoA=
Date: Tue, 27 Aug 2024 02:58:56 +0000
Message-ID: <66ec4c23ed61e51c7906fc2e86dfc20437bd45ac.camel@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
	 <20240823154523.fucqvc4cnqk5jrlg@basti-XPS-13-9310>
In-Reply-To: <20240823154523.fucqvc4cnqk5jrlg@basti-XPS-13-9310>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|SEYPR03MB6996:EE_
x-ms-office365-filtering-correlation-id: 84b774ce-3ea0-4400-083a-08dcc64430f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c2JuN3VNN0RNckdTMFJxRnpJcE1TVUF0R1dsWFdHaXY2bFlrUzg4dkRBNzEz?=
 =?utf-8?B?dHZ6SlB0bDlQMjFoQlp1OUZ2alVsVHBuRmhkeUVnbHV3OHVmUXExWWQ3bjVs?=
 =?utf-8?B?ck5tc2ZYV3Z1L2wwTlgwR05kRlpGSzZYL2VtVnJOZlEvZ3hmNzV1SDJWbkdp?=
 =?utf-8?B?anlFK0ZZN0tUWHk1UlYxM20reG9TWFdhUGtHQU14MkNjNW9KNitqdzRrK05m?=
 =?utf-8?B?Y2hiUzVqL3JsNnhXREI0UldoWGl0MEJQbjlLL0FmYnpxaWEzL0pPamYvdmpj?=
 =?utf-8?B?aFBFY3lBTmFkRFlGdytmaTBmODRUZG9tVUVCSzhzWkxhbGFsR2NMNFZKTnFP?=
 =?utf-8?B?VnhIazZlNEYxM2lTOWsvZFljak96MWMzbk50RWZyY2FCNXNEZlZIZDErc2M0?=
 =?utf-8?B?M2MxTy85OFJRNUNzdkxISks5bFh5Y1k3Smt1R2RkOExIOElveGgvdlBQZ3o4?=
 =?utf-8?B?cWJoV205VzdXNkN5eDVRQURZcnhhdFJIZjY0Y1hkSjRiNVZabWlLa2hWS1Bo?=
 =?utf-8?B?cGpWSnQvbE53QmVheGNpanBOeHRuSjhEb1dHakpyZ1pRUlN1SUtoaldxUFlo?=
 =?utf-8?B?bnFYcU42NEpKMGZMRjFSZHk2bE1NMmIrOEh1T3UycjA3N0pZazR3a1Jhalpk?=
 =?utf-8?B?VzlGU044UGkyZzN5N3A5cllMdDhsaUFTSEx1ZWhhbklMQk85UTU5KzFENG9T?=
 =?utf-8?B?Vkd0T25zUVJUNS9xTEp0NEVQTzB1bFlqck1IdnJJQVZZRVFSbHArQkNqSkNU?=
 =?utf-8?B?SlZEVFBZNjYvK2NHaEZWcFVMczNtd0VveUUxT0FuWStSUmtpOXZZdFJLMTl4?=
 =?utf-8?B?bCtMUm9vRTlUbWNVSXpYUmxhY29HWVk3WkdQZUdnbHBUQ2R1Tm90ZGl4U0V4?=
 =?utf-8?B?NTJLQVAycjV6YVhyeFQrT1dXanVmTFpkZFIwVUdlQWNPUW9WRkMxdWtnNHpB?=
 =?utf-8?B?cGdTczdvZzdXK3B6M05ISGVHMjdoc0RRUFdLdGZKYjU0WXZOdzJmUEE4anI1?=
 =?utf-8?B?SGx3aVF0dXpWU28xZW0zOTFKZVRrUkg4Z09nc2F0ZmVNOURZOHczb1NaTFlT?=
 =?utf-8?B?ZU9qMlFud0JwSkRCL2Y4S2JwL2Y1QUh1K1F2enJQMlVyQk85V2treVFRSTlo?=
 =?utf-8?B?RWpxK216NWVxN0d5VmxtZkNhYmdNV2IrWW5LMlVMWTFIbGxhYmxETld1NzVI?=
 =?utf-8?B?eHFxdVBRK1VHVzlWV1pzbjNMUkd1V29FcVptUTRsaGFFMEJzaWJUVkNHTEtz?=
 =?utf-8?B?UmpnZUZnUUFYL2FJM2pmLzh2WXg3RDRuMUh1cTFLSjNJbFcrQk1TNCt1T1N5?=
 =?utf-8?B?S1JqMXdNemFsN2JsQ2FRNVN3c2Z5alBqV1J6K1hrNnNweDdhek1TN3gvMnRG?=
 =?utf-8?B?R25vNkhtTDBnc2RwSDgvbFV5NWNZMkUvL0VieFliSzJrRm9QV0s3dGE4L0ts?=
 =?utf-8?B?bzhYaGNabHd3Vk0wVWg3OXRDRWpiemJpWVVwU2w0WDcwRDRDQVBQbDdJU3dT?=
 =?utf-8?B?cnpBaGZpOURmQnFaK2lYSCtUeVBuRnorNHhhSWtMeEp6MElBL2VCM2dqbkpl?=
 =?utf-8?B?OEFCZ0tRQ0NsYThYVFVJM0l0TVBPNitldk11Vk5EUjVQZzRhM2ozaVdGaXZ4?=
 =?utf-8?B?b1NMQUcxdXlabzlraXN6K0Y5eHN3MllIYmlBWFFwT2FacjA3bEFEUUNZajd5?=
 =?utf-8?B?SnJpdGZCblAwTXp5ZTk0cGhjUUxveHRXREh1cEpmZXpaMHlDbHQvM0lLVDVE?=
 =?utf-8?B?QUZDUDY3K1l0UUtUWjUrbkkwN3cwcW1KMm5LR2h2V2VrNjNyQVhpbFRUQk0r?=
 =?utf-8?B?R2wzMmEwQjhQWDhOR09EUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTRNUXovVzJ3VG53UDNob2RjbUpjTU5hczgwM0J4TWtiUjlNM3hxdWRUOVBh?=
 =?utf-8?B?ZitjUTdjT25RY2VhOUt2Z3J2ZXd5Z25raGdTY3E2TE5nRFpDYVNXeG1nSFZI?=
 =?utf-8?B?MzZmdHZZL1VGai9oUmppclNxRTQ1MFJaK2VicDBsZnEva0Y5RmV5QkQvVnlo?=
 =?utf-8?B?ZXdSZGVSdkpJSEx0YUVZYnpwSmlzajU0SzY2OVRrQkVOWnBqOGoxdHkxTzla?=
 =?utf-8?B?ME9SVjhLU3Q3WnVIVkFIN0RZREhJVU5JTVJLZDlhTWVybjAvR2Nremw3Vlo1?=
 =?utf-8?B?MDMrNmoxeE5qdUN2M0NEcno1MXpkUTdaNENkVmhyUEhCRDFZTS9QaDkwVGRE?=
 =?utf-8?B?OERLKzVBblIxbWFjMVFIVFVvU05SejVabFdCdU1XdldLaGtvdGxuRURzdmc5?=
 =?utf-8?B?VDBEY253K3lRc2hVSU5ZRWQ5ZkdqR0VLMTNmU1ZISG40cS9mY2UwT1JGZ1Q2?=
 =?utf-8?B?U250ODNZN2wwbE5kd0gvemFSMVYrY1Y2bklEOGkwVkdmQWVwYWNPOSt2RFFp?=
 =?utf-8?B?ait3RVNuYUxHQVhubXU2ak5oTzVhK3dtYklKWHpNR2Q3VkdjUzhvdW5WOVJU?=
 =?utf-8?B?Uy9mNW5WczRKM0ttTmpUQTUwYjE2WTBDVUgra0RKNmVtU2I3RVFBellQb2wr?=
 =?utf-8?B?bno3SEJpTXlYNDU2NUFiWlJUWmlRZmNqa2xTLzE2WkphYkJBeDExOGVnR0Nx?=
 =?utf-8?B?UUlXZDVrdHpNRGdackRUK3VMb1pWYTczU0JvV2tBUHMzYzJScVFUcHR3cmZh?=
 =?utf-8?B?OU5FVWFHeUt1Y3JPWENVQlZoUk9xTm9sV1pEcmEza2wwQm1UclRtWjdWYjZL?=
 =?utf-8?B?VlU2NmJtVWMyVzZ5YndEb1hjKzE2Q0FrMWlFaDB4eGJWRCtqWlpNcVlQdzBv?=
 =?utf-8?B?WjYvTCtTLzJoWnNsbzMzczNYZzUveTR2cmJQM3UySWxYN28xNWRXMkFDemJ6?=
 =?utf-8?B?STZwUEdMSjZ5TE9iZld4d3IyTnlNV1AwUDF0dkg0enNyYklFWE5nc09LbEkr?=
 =?utf-8?B?YzBjVnZMMHdDSkdMWlBEWjZPVXVTL2hKVkV4VjRKd0pNQTJKZVRkTzlsMmdH?=
 =?utf-8?B?NDV4QXMwQm9ra1ZHNFA4K2E4elZxcXZMb0ZkNkpiQWVEUmI0WnZzQ016OERL?=
 =?utf-8?B?aExZaHlUZDVoVmNDUXQyRXRPTEdBNTFlOXQ4OEd5R1JGRnRjSWxDL3R5Q3BY?=
 =?utf-8?B?RStvK3piMjdTdGlpcFM1T2hSUEsrd2hvZUh4WjNVY3JJbXBTNjU3OTZCTTZW?=
 =?utf-8?B?MXNoeWRya1prejZ4NTFwa3VyeGpHaDBzZUZ0Q2YyRk9LdGdWSmR4K1hPeFVI?=
 =?utf-8?B?ZnJiRFVBOHNtVS9MVktuR1Bha2NRakF5V0Q2YTduWE5DaUVYUXFVQVhVb1hB?=
 =?utf-8?B?azI2M2xtakNEdDZROExkM0xYRHIrNkdBbUhnNmlxVEhWVVAxc205eU9oZE5z?=
 =?utf-8?B?a3FoY1QyS01SWjBIbTZobTArY1JyZUpMVU80UWNBaWFjY0pVc3E2Y0dmNkZC?=
 =?utf-8?B?OUx5cTJLNWxoYytFaWQ4czFkWTM4d3F6QnlOcGw0REhHMTJlajFiU0lTc21Y?=
 =?utf-8?B?WnV2eVFzalF2ck9GdDNvTVByaFJPM0pOZTdrSDJqOUlNcjV5QmRBMis1QVQv?=
 =?utf-8?B?dktSdTFuaVJrOHE1dENBby8vbXMwTWNSMFU0VUY1ZVNTOTg3WjJ6TXF2bFgz?=
 =?utf-8?B?SUhvR01wd3ZJaXB0bWpJTW0rWHZ4Q2VNZTI0WW5qSk1lZ0lSY1piS2h4QWlk?=
 =?utf-8?B?NjdEY0hsRm9YampYWlBhMTdRTzBab1llNmx5SC8yUDBZcUR6NWQzbUNlbjJu?=
 =?utf-8?B?ck41UGhtcTg0ZFpYa2V0Y2p5WTl4MTZ0NVZuZnJmSDFtcnF2dGpGQ3I5Y0da?=
 =?utf-8?B?MmdvVmY2SUZJZ0NYeElJYlM0SmlQalZPVkJ4VlMvOUtqZ1IxVFJZRTlQWkFY?=
 =?utf-8?B?ZEJUemVwSU1oaVVHcXU0VnM1TzlhNGJnVXNlWGg1aEVIRHdESDM4MVYvZmxw?=
 =?utf-8?B?VjlyK2dWQVRlM2VDSk9yVlJvL0YxeUtjNXorNHlVMWtaYjdOUUFkaHM0WDRW?=
 =?utf-8?B?TVRack1TK3hqbTV5aE1ab2NqN2dXYWxQZWE1VXRzZ2c1aDI1QjV5UmFJb0xW?=
 =?utf-8?B?U01hclh6RWc4dWxsTGJ6dDNhc3hGaUlzdWYyUmJKNHR0ZzQ1cW5IcU51Tk5Q?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04E035EFB990154EB4E3B189E009930E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b774ce-3ea0-4400-083a-08dcc64430f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 02:58:56.0655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z17U1ne2b7hXrONDaPH6D7n9aOg105dP4aoRYGulfoRHy37f7PTcROa7S9ehPdE8IZwl5OkBgctSu45+kWvUZ8y5gSzGDShXbQzdQ0YSvCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6996
X-MTK: N

SGkgU2ViYXN0aWFuLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCk9uIEZyaSwgMjAy
NC0wOC0yMyBhdCAxNzo0NSArMDIwMCwgU2ViYXN0aWFuIEZyaWNrZSB3cm90ZToNCj4gSGV5IFl1
bmZlaSwNCj4gDQo+IGdpdmVuIHRoaXMgbmV3IHNlcmllcyBieSBIYW5zOg0KPiANCmh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhL2xpc3QvP3Nlcmllcz0xMzQyN19fOyEhQ1RSTktBOXdNZzBBUmJ3IWg0X19i
U0NfUlgxZXJaQ3E1d3ZaYmpSUXJtUzllY1h5dHdqY2RMYzlzZ2pCZ2ozYnVVQzhKclVHNzhyaHRF
c1hBTjZ2bVpFaE0zdFd1bUZRNTBSNU5jUl8xaGJxTHlZbFNnJA0KPiAgDQo+IA0KPiB3ZSBtaWdo
dCBhY3R1YWxseSBiZSBhYmxlIHRvIGZpbmQgYSBtb3JlIHBlcmZvcm1hbnQgc29sdXRpb24gb2Yg
dGhlDQo+IHByb2JsZW0sIEknbGwgd29yayBvbiB0aGF0IGEgYml0IGFuZCBnaXZlIHlvdSBmZWVk
YmFjay4NCj4gDQpJIGFscmVhZHkgZG8gc28gbWFueSB0ZXN0IGZvciBkaWZmZXJlbnQgcHJvamVj
dCB3aXRoIHRoZXNlIHBhdGNoZXMsDQp3aGV0aGVyIGl0J3MgcG9zc2libGUgdG8gbWVyZ2UgdGhl
c2UgcGF0Y2ggZmlyc3RseSwgdGhlbiB0byBjYWxsIGhhbnMncw0KY2hhbmdlcyB0byBkbyBzdHJl
c3MgdGVzdC4NCg0KQmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gUmVnYXJkcywNCj4gU2Vi
YXN0aWFuDQo+IA0KPiBPbiAwNy4wOC4yMDI0IDE2OjI0LCBZdW5mZWkgRG9uZyB3cm90ZToNCj4g
PiB2NGwyX20ybV9idWZfZG9uZSBpcyBjYWxsZWQgaW4gbGF0IHdvcmsgcXVldWUsDQo+ID4gdjRs
Ml9jdHJsX3JlcXVlc3RfY29tcGxldGUNCj4gPiBpcyBjYWxsZWQgaW4gY29yZSBxdWV1ZS4gVGhl
IHJlcXVlc3Qgc3RhdHVzIG9mIG91dHB1dCBxdWV1ZSB3aWxsIGJlDQo+ID4gc2V0IHRvDQo+ID4g
TUVESUFfUkVRVUVTVF9TVEFURV9DT01QTEVURSB3aGVuIHY0bDJfbTJtX2J1Zl9kb25lIGlzIGNh
bGxlZCwNCj4gPiBsZWFkaW5nIHRvDQo+ID4gb3V0cHV0IHF1ZXVlIHJlcXVlc3QgY29tcGxldGUg
ZmFpbC4gTXVzdCBtb3ZlDQo+ID4gdjRsMl9jdHJsX3JlcXVlc3RfY29tcGxldGUNCj4gPiBpbiBm
cm9udCBvZiB2NGwyX20ybV9idWZfZG9uZS4NCj4gPiANCj4gPiBQYXRjaCAxIHNldHRpbmcgcmVx
dWVzdCBjb21wbGV0ZSBiZWZvcmUgYnVmZmVyIGRvbmUNCj4gPiBQYXRjaCAyIGNoYW5nZSBmbHVz
aCBkZWNvZGUgb3JkZXIgd2hlbiBzdHJlYW0gb2ZmDQo+ID4gUGF0Y2ggMyBmbHVzaCBkZWNvZGVy
IGJlZm9yZSBzdHJlYW0gb2ZmDQo+ID4gUGF0Y2ggNCB1c2luZyBpbnB1dCBpbmZvcm1hdGlvbiB0
byBnZXQgdmIyIGJ1ZmZlcg0KPiA+IFBhdGNoIDUgc3RvcmUgc291cmNlIHZiMiBidWZmZXINCj4g
PiBQYXRjaCA2IHJlcGxhY2UgdjRsMl9tMm1fbmV4dF9zcmNfYnVmIHdpdGggdjRsMl9tMm1fc3Jj
X2J1Zl9yZW1vdmUNCj4gPiBQYXRjaCA3IHJlbW92ZSBtZWRpYSByZXF1ZXN0IGNoZWNraW5nDQo+
ID4gDQo+ID4gLS0tDQo+ID4gY29tcGFyZWQgd2l0aCB2MzoNCj4gPiAtIGZpeCBmbHVzaCBkZWNv
ZGVyIGlzc3VlIHdoZW4gdXNlcnNwYWNlIHN0cmVhbSBvZmYgY2FwdHVyZSBxdWV1ZQ0KPiA+IGZp
cnN0bHkNCj4gPiAtIGZsdXN0ZXIgdGVzdCByZXN1bHQgc2FtZSB3aXRoIHYzDQo+ID4gDQo+ID4g
Y29tcGFyZWQgd2l0aCB2MjoNCj4gPiAtIGFkZCBwYXRjaCA1LzYvNyB0byBmaXggZGVjb2RlIGFn
YWluIGlzc3VlDQo+ID4gLSBhZGQgZmx1c3RlciB0ZXN0IHJlc3VsdCB3aXRoIG10ODE5NSBwbGF0
Zm9ybShzYW1lIHdpdGggbm8NCj4gPiBjaGFuZ2VkKToNCj4gPiAgMT4gLi9mbHVzdGVyLnB5IHJ1
biAtZCBHU3RyZWFtZXItVlA4LVY0TDJTTC1Hc3QxLjAgLWoxIC10IDkwDQo+ID4gICAgIFZQOC1U
RVNULVZFQ1RPUlMgNTkvNjENCj4gPiAgMj4gLi9mbHVzdGVyLnB5IHJ1biAtZCBHU3RyZWFtZXIt
VlA5LVY0TDJTTC1Hc3QxLjAgLWoxIC10IDkwDQo+ID4gICAgIFZQOS1URVNULVZFQ1RPUlMgMjc2
LzMwNQ0KPiA+ICAzPiAuL2ZsdXN0ZXIucHkgcnVuIC1kIEdTdHJlYW1lci1BVjEtVjRMMlNMLUdz
dDEuMCAtajEgLXQgOTANCj4gPiAgICAgQVYxLVRFU1QtVkVDVE9SUyAyMzcvMjM5DQo+ID4gIDQ+
IC4vZmx1c3Rlci5weSBydW4gLWQgR1N0cmVhbWVyLUguMjY0LVY0TDJTTC1Hc3QxLjAgLWoxIC10
IDkwDQo+ID4gICAgIEpWVC1BVkNfVjEgICAgICAgOTUvMTM1DQo+ID4gIDU+IC4vZmx1c3Rlci5w
eSBydW4gLWQgR1N0cmVhbWVyLUguMjY1LVY0TDJTTC1Hc3QxLjAgLWoxIC10IDkwDQo+ID4gICAg
IEpDVC1WQy1IRVZDX1YxICAgMTQyLzE0Nw0KPiA+IA0KPiA+IGNvbXBhcmVkIHdpdGggdjE6DQo+
ID4gLSBhZGQgcGF0Y2ggMi8zLzQgdG8gZml4IHRpbWluZyBpc3N1ZS4NCj4gPiAtLS0NCj4gPiBZ
dW5mZWkgRG9uZyAoNyk6DQo+ID4gIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBzZXR0aW5nIHJl
cXVlc3QgY29tcGxldGUgYmVmb3JlIGJ1ZmZlcg0KPiA+IGRvbmUNCj4gPiAgbWVkaWE6IG1lZGlh
dGVrOiB2Y29kZWM6IGNoYW5nZSBmbHVzaCBkZWNvZGUgb3JkZXIgd2hlbiBzdHJlYW0gb2ZmDQo+
ID4gIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBmbHVzaCBkZWNvZGVyIGJlZm9yZSBzdHJlYW0g
b2ZmDQo+ID4gIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiB1c2luZyBpbnB1dCBpbmZvcm1hdGlv
biB0byBnZXQgdmIyIGJ1ZmZlcg0KPiA+ICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogc3RvcmUg
c291cmNlIHZiMiBidWZmZXINCj4gPiAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IHJlcGxhY2Ug
djRsMl9tMm1fbmV4dF9zcmNfYnVmIHdpdGgNCj4gPiAgICB2NGwyX20ybV9zcmNfYnVmX3JlbW92
ZQ0KPiA+ICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogcmVtb3ZlIG1lZGlhIHJlcXVlc3QgY2hl
Y2tpbmcNCj4gPiANCj4gPiAuLi4vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19k
ZWMuYyAgfCA0NCArKysrKysrKy0tLS0tLQ0KPiA+IC0tLQ0KPiA+IC4uLi92Y29kZWMvZGVjb2Rl
ci9tdGtfdmNvZGVjX2RlY19kcnYuaCAgICAgICB8ICA0ICstDQo+ID4gLi4uL3Zjb2RlYy9kZWNv
ZGVyL210a192Y29kZWNfZGVjX3N0YXRlbGVzcy5jIHwgNDggKysrKysrKysrKysrKysNCj4gPiAt
LS0tLQ0KPiA+IC4uLi92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfYXYxX3JlcV9sYXRfaWYuYyB8
IDE4ICsrKy0tLS0NCj4gPiAuLi4vZGVjb2Rlci92ZGVjL3ZkZWNfaDI2NF9yZXFfbXVsdGlfaWYu
YyAgICAgfCAgNCArLQ0KPiA+IC4uLi9kZWNvZGVyL3ZkZWMvdmRlY19oZXZjX3JlcV9tdWx0aV9p
Zi5jICAgICB8ICA0ICstDQo+ID4gLi4uL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVx
X2xhdF9pZi5jIHwgMTkgKysrKy0tLS0NCj4gPiAuLi4vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
dmRlY19tc2dfcXVldWUuaCAgfCAgNCArLQ0KPiA+IDggZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0
aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gLS0gDQo+ID4gMi40Ni4wDQo+ID4g
DQo+ID4gDQo=

