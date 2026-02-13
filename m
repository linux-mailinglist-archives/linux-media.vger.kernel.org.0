Return-Path: <linux-media+bounces-52679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAfdCOqIjmmJCwEAu9opvQ
	(envelope-from <linux-media+bounces-52679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 03:14:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D361325F2
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 03:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E16B430867D6
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 02:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B08238C15;
	Fri, 13 Feb 2026 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hFJFZJtU";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GsBCqoRj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8663817555;
	Fri, 13 Feb 2026 02:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770948828; cv=fail; b=lqZe8+YN/+GvE0SoMJmv0rxlY2jMN3o0IXzFW6ZKUQ5pTLbrwbZfUXsTX4u/vpmYjBbGHErbjVgijw0mV7BfvgZ8UEO1fOv8TedktwrFKNZ4lM/e7T42dkoYVxVkiLZyrZnvOvamSKX1At9u+QjdeWNSWSWkn8aHMc1D7Y6Ioig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770948828; c=relaxed/simple;
	bh=MaMT4NFEhQbsydcANDTnhgax3enzSuWCs/JvlQsgAO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pq1vG140VKHv5if57fEVeSZz0CI+2vL/A7tZxVUNdd9NgK1HMv19DdWkgSJIWU+gaUO6vwIYUlGmWXJRuk1kbMxQ8PWo3I7+z76nK4fTaQGYJJDoKEKiJZFtWkCJG5GG+S71YS9+l6Wmr7GguPxoABxkPKjqy/Uq1EAdA/Bn7CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hFJFZJtU; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=GsBCqoRj; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9ba3deba088111f1b7fc4fdb8733b2bc-20260213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MaMT4NFEhQbsydcANDTnhgax3enzSuWCs/JvlQsgAO4=;
	b=hFJFZJtU4ZLCNqdlAVXhYpsP70LHiE/V0frvNrs4ELjiO2F5y3r8jr5nd7dNRlbzs9wNBeFCxoLPRFW2LF2yIm5UoEGqlSJmiBL6zha7NmqXQ3b45CAUgVebNuA1eiQsnM3yQFxwLjNd2lYYdA4CdMGNRQL4jbRDDFiPthE34HA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8d3ed0ba-0e3d-4a74-a6b1-41bc9c632b62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:05bd3e5b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ba3deba088111f1b7fc4fdb8733b2bc-20260213
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2095419577; Fri, 13 Feb 2026 10:13:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Feb 2026 10:13:37 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Feb 2026 10:13:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeDDnzbWk/5HTbINr+q6XxrCTd2y+mjJ8iHXUDzSmtbCH6MqxXBuUrU7SEey+cDlKtaE8tcZ+cMwg+aFvrFWpXCaAkxrOyqDbHEJxIznzyFFroJK+aXu4ZB0GTG+zEhq6RjqjD11AVDWMTyq/3MnlMytBGbJxHhYTHJ0e0e92CY/r5sTZMTmGyn/TWqmgITWJ2X+haCgz61vcRX1JQPoGPvjxRzzzPwMrGwV2JLomngMANTgUpJc3pB6dsdQFFQalN9MqcLsAP+BqUz429ixPQqnXkEX2fWQk+s2j4qOYWxPFFHKPqOz3puvlCNvdLzD3JsmjZsfN1iSJj/lorJF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaMT4NFEhQbsydcANDTnhgax3enzSuWCs/JvlQsgAO4=;
 b=ho+V2UpByymoR3DuKnWpBfvnGsu79LVdRuShQYQbX2L1JacmGNX7QggPdZ/XprHeeLjugeQj8/ecqwL7CCwx1bfPxhs9DNyLyH6+HfVCZCmE/vv7QD9jBOTIPoGL5Q9kE3RAUuT4LY3LMgT64Ckbjuw59pZIogY7SCjb73A9RqW8b3z7IHcArV8q2MdEqPOSjBH1mr1x3QiAn04t1rsXyqelriY0vRqHvxMUcpKqJB5iiwGTSrejUQy42jevoNYXgT2CMQBZDzW9WJZawMzP7+FLvCNrBPxUsexQlpBIC8r8+O8CzazIsSk36ct2WtWnoUMbEJ6081iUf1oi2XuhRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaMT4NFEhQbsydcANDTnhgax3enzSuWCs/JvlQsgAO4=;
 b=GsBCqoRjxizVqjmod1Y22o26wM428vIMK/qBHqDboSF3P/0vjpT3856JpsfKYfKFLVBwS5Nq3PbTh504dkoDwwZQIwzDM5odcl67E0qMdmwCJaQHN6NK7vCengKWELyhdI2V4/GHGDCk5CSfJnGMeTM8viPMoHMvg7UyM8jEYag=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by KL1PR03MB7108.apcprd03.prod.outlook.com (2603:1096:820:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 02:13:33 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::561:2228:21d2:4b9d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::561:2228:21d2:4b9d%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 02:13:33 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"nhebert@chromium.org" <nhebert@chromium.org>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder compatible
 to support mt8196
Thread-Topic: [PATCH v3 02/14] media: mediatek: vcodec: add decoder compatible
 to support mt8196
Thread-Index: AQHcmxlKHr/u4ntzYUWVLjmpGIZInrV/SMQAgAAtXoCAAHBcAA==
Date: Fri, 13 Feb 2026 02:13:32 +0000
Message-ID: <44d55b13e2e9f8bbc57240c560eb5c70750e77fa.camel@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
	 <20260211054149.27249-3-yunfei.dong@mediatek.com>
	 <6176231.DvuYhMxLoT@workhorse>
	 <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
In-Reply-To: <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|KL1PR03MB7108:EE_
x-ms-office365-filtering-correlation-id: a5416d7f-2dd6-4e4f-d404-08de6aa57ccc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?azdmbmk4Uk9Pb05XWkl3dUhsOUFxT0hMVlVzdU9jUDM1V2RZWlBoZzRyUVd2?=
 =?utf-8?B?dkZXWHFBcGlPYW5hQWgrb205dE15dnQ5R2p6SlNPYmVrV1VGakRZMHZuMjRG?=
 =?utf-8?B?T3NVQjFocVFqVDN3YlNoOElRcFNnYkhLRWY3ZkJXZVRtNDc3cGxzQmZSeTFK?=
 =?utf-8?B?d2FVNnBWY1ZqcVNmYlJTcktDTW5ablZkcmJxNlpFTUhkWnovYTRXRzVPdUdZ?=
 =?utf-8?B?ajdOUG9lZWZMczdhY1pGUEVRNysxUU11WHZ4alpGNkZ3VFhoUEFKc0xuVHRG?=
 =?utf-8?B?YWRzYU9WTTVKZ3BmayszNDVWdFF3WWNYZlA4aXl6RWhyelYxaWdjd3JRSXFT?=
 =?utf-8?B?VkdhVlcrUWYydXhpUGJVVWdaUXJibGZjZlJoS05pYjJrYlpJemRqVHQ5aStT?=
 =?utf-8?B?eDVNQWJRMzlaUnk1dk5TQ0lqQ3hTK0xDV2QwZndmNDNucUF1L1dlKzRncS9l?=
 =?utf-8?B?bDNFODE5YVJXeWZvVnBtSlFYUmNyVWsrZXo5Yndqc3VRTnRmeGNaNjB3ZGJK?=
 =?utf-8?B?aXk4V3pSOXNWN0FaMFVyMXRHY3BjUjJVeTJqaktKV3ZZZXdiaEN0KytjaFRL?=
 =?utf-8?B?OEtaeFJPZmJkUnUzMjkwNlJtWVF6VXFTL1NIZDBmM1NWelJpcE9NU05wNHha?=
 =?utf-8?B?MUcwUHdycE1COENTYUx3Z3J5M3h5emlwUFhuZm1kekkzTGdwbXlackhhWVhM?=
 =?utf-8?B?ZjNha1hyV0hsOUpaYldqcUJmZmxacGlreUVHNGNXcS9Wbk5oNXFxSEg1cGJk?=
 =?utf-8?B?ckM5a1gwL3FmeWNCejRhQ09IRm52UE5aL3ptK1hGR2Y1RDNaT0l6R3dVV3RR?=
 =?utf-8?B?em9WemNEdmxFSVBEUE5Qa2RlODFuNGN1eDNTa3Q2OWRJRUJtamFEWHB3bzF6?=
 =?utf-8?B?ekVRTHdZMG96VTlFc0F2M21VTENVNUU3cVYzRDRMNkg5YUFtYjI2dHJuRlhx?=
 =?utf-8?B?R2FZazV2QW5laFljaWt3NjdXWmxwdjJNTWsxd3ltZkU1Wll6Mzl6M2FOUjQy?=
 =?utf-8?B?eVFZOEhPVWNvMTF6OW5NVDNYU1Btbk4zb1kxd2xUVUNhZHBpQVBNRU56OTBX?=
 =?utf-8?B?VnorYjlvUUtrTENIbGkrSWkwZVpxcm51SWV0My9FYXRtT2xva3JYTU9BZzlk?=
 =?utf-8?B?Mm1WVHJ2TmJMeWRRQTBrZjZ3QURRbkk3aWJWcld1aHZyRERQMEZWY0Zid2ZP?=
 =?utf-8?B?UnNWUE5iSUtIM3J2aEtUbmlGamJia1ZaWkFVVVhmakF4NkRUaU0wenlOS09E?=
 =?utf-8?B?WWRhWm51eEkzSTAwU1BWeHZRbXd0RUFxN1lYMm42NW03dVNscHc2Q0g4Uyto?=
 =?utf-8?B?Z3hUUzBtNGhoZ1NHOFQ4Zm9ZTWRmcndYZzBXdjVOVHRIL1B2VXlmNTlMMS9U?=
 =?utf-8?B?RXlGb1p0NVpHMEdNYlN5aGRnV2xPeFFwejh4NkxJOHZpcmFReThoMCt3Q1Fx?=
 =?utf-8?B?Y3NGNk9VZklVNzJzakJtd3R6T3V2engwcHMyTlQ3YTJXd1BwRXo1NUNQQzc2?=
 =?utf-8?B?eDV2TmpCUzFVWUZXVjdYVW1mZXBjazU0d3JVUjZMbzdlbFBnZE84aGZXZmFh?=
 =?utf-8?B?UENjU3Q4b0JqQnhtN0JDdzVXRWZZSENqdmdlbkNhZnJ2UHJaL1BOVDNhZ05L?=
 =?utf-8?B?ejFTV1IwZS93TTRQTUg3SVpkOXFsYVdkczZueTJPaWZWWktqSTE2eTZ2VCsy?=
 =?utf-8?B?QmlGc3d0SDNvb2NJYTBtSXhYT25rVmJ2cUNXNWt2dGJUanpGYzhQWFJ4WVhI?=
 =?utf-8?B?YjhDMmNsdjFkRzYxL2FtMy9qeFpRVkJrSlp4bDZCTTVjRFBqNzBqeHFnMy9Z?=
 =?utf-8?B?RmFXYy8xcEYvVkNkZTZMRjJoOW1DT1lDeHF2MStyNzV4SlZJeitNNkY0bGkx?=
 =?utf-8?B?bFNmb1hXdTlDRDdvNitNSjRTUEh4d3dOOGJMS2R2NTlucXFvM0MxRyszRk11?=
 =?utf-8?B?TjFIazZHQ1E5TU9jNk9hRnBwS2NSTzBIbnpPTllGVGxLOHlaa1VFTVZrME5o?=
 =?utf-8?B?VExWcVBCendqeEQ4aWV0KzRQZElUd2hJelh1c1dvQmk3ajhmQUM5UEhnZ3k4?=
 =?utf-8?B?SG14QVpQeE5RS3lwd0ZGUnVxdUJVdURvNDU5WmxwL045eVljaERaWURyd3Ju?=
 =?utf-8?B?TDV4d0hlTi9ZYUF6MWpoM1BZdTltZFF3bGloNE5HNlZUSG9NVW5tZjgzVXZE?=
 =?utf-8?Q?Of7pIO9+pI1ojrGpBC1bJJIlDVxgCUfmdiLZKbhT+chF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXgvbVpMd0c5VEF5cXJJQXNCbUhiK2FQYlRudzYwYWMwbGlhbUlXM2Q5NGNW?=
 =?utf-8?B?Q2g0bWk1TElYSTN0c1RHRE4vMTErT3ZGNlhpRld2V2dXNHhDZ2tJRWQ0Vjdu?=
 =?utf-8?B?V0JFYnRTalVxYzlia3pwRVJvd094bytuUHFsSHRSRkR6VlVqbmRNdW1MeFFj?=
 =?utf-8?B?dStzUHVJeC9lY3FhSSsvV3oxVHhPVGc1S0t6OXRLcFJtanczaXkrMFUwam10?=
 =?utf-8?B?MnB6eTVhR1NUdDQwalp5Tm40eVVENHFVL0sxYTNLVjA2WEFMTmFoLzBKMlZk?=
 =?utf-8?B?YXFTalVOUFRPUXZDblVxTk1OREx2NG1TOEVPRnhMcVBTMFIrNkhPNGt4aXc5?=
 =?utf-8?B?STQ5OHl2TW9WdFVPelovQnl1ZEU1R3VKdE1oOStzWGxGVUltUGxZNEk2Rmpq?=
 =?utf-8?B?QVdEVDJzcXl0ZVlraHZsaE1ma1ZHQTlDU3RnT2hiQTZIRWtFUmhWSFpHaXVU?=
 =?utf-8?B?WHAycEJFUkZGRnQ3YjZBS3hyY1czeXNnWGRxV0pxVkdpT3NXbUdjS0NZL1pv?=
 =?utf-8?B?b0J5K013SU1VNFZTY3VwcDBBQjFYcWhZaERORTBLOXUyUVFPMWlNalJYbGcy?=
 =?utf-8?B?b2RhVldqSFg1WlZxcUtzRHdISFNveGdlUVNQd2lmeFFLNTRyN01raUpzY2tV?=
 =?utf-8?B?bk5weHBoTXU0alV4S0tjdEo3RG1IbC9VaVRkNnhkdEEvT0xNMmVmVE85NWsy?=
 =?utf-8?B?cUFrcGx2djdOSTNESHJHc1RDdENxeFdXZlJId1BlK21VbzBHT2F6MEJCUUVo?=
 =?utf-8?B?YkV4aUgxK01OYzhYamdRdE9hc3VCSno4U0JYMnpsRnZyNUtyQmpXYmZSeEF1?=
 =?utf-8?B?WEVnK1g5ME5oTnB3d2N1MS84U2NqZ255Z3hRdkRyanl4V0lXVVhCWTkva1h2?=
 =?utf-8?B?RFgzNWIzUkRzSkhnczcxNGYvSWJKYUhJbXFKdVdmOXZ4ZW16UzFLT2xjazBr?=
 =?utf-8?B?MS8vUTExemtPdFFxVVRQV2NYVmNoYUJ3R0ZEdmZmY1Iyekh5MVQrcHhiUEFz?=
 =?utf-8?B?OW9MeXNjRFRUb3pjSkkxd0xvOUV5Q3NjRGVtVjBMNi9uUlVoWmxsNkpSc2R3?=
 =?utf-8?B?alpFSmlaUEdFVHFUUmNIb00xbUJJWGYvYklDWVBnWEdRb3ZCSDBacUhrWHpF?=
 =?utf-8?B?eERuR1YvdlZIRlZYSW9ESE94ejdjYUJISll6ejA1SE1pTGhxbWJyWEUzMlZY?=
 =?utf-8?B?US9PaXgwc09BVGFkbzFxa09SMW5VZFRMVk1JYk5BWmZmVy9DVElGb0oyenph?=
 =?utf-8?B?UThSbUdQUk1acHdwaUZubGhwRk9Sd1J3WmxUQUJEb2RkZnZZUkk2UTU1M0tt?=
 =?utf-8?B?aEhmU2pOak9EQ2dJQURWb0VTdHJhbERxM25xOU5UL2N1VlhaeXQxTDhxMC9v?=
 =?utf-8?B?Uy85elNsSFYrUTV4ZmY5dXp2WTZtVzcyQ3ZpZER0STlxSDEwQXp6anc1R0Y4?=
 =?utf-8?B?WEZXYzhrZ2liOHRKaGhaRmZFdVlrUWt3M1I2b0p5NFE5NTc1c3B6bi82NHJz?=
 =?utf-8?B?THNrU1hTdjhBUDEvdmJ3RFZuVmNLdkhTeXlIa3FhVnZLc0pZaHhkNG9uNXA2?=
 =?utf-8?B?K1BRc2FiLyt6U3BhWk9aaWZEcWdoTFhhMW9tQkdETGVKYUtiUGd1d2ZlRjVN?=
 =?utf-8?B?bzNDTWk4dFlWLzFBZEh4NytnbWpGTktlVEdKaTJ0RXVueGlMclRsL1FSWi8w?=
 =?utf-8?B?K1FHK0hyb2g2aVMvTGJMVjc3bUh0VTA3VHR6czlzMUFoMUpDZlc5UDRFb0x4?=
 =?utf-8?B?eVBzRlNwY3dnZXorNFdyUEcwN1FSazZjRkkrQW5mZExQYTkwWHp4N0Y3ZHll?=
 =?utf-8?B?cmZUWnpVZTZOQk5nam9yM1lQVFU0TDdKSFo2OWtQMk13TUxHR2llZWF4WmU0?=
 =?utf-8?B?ejRiZnZTRnZRa2VtRzlnY2xxWEgvZWJKZVd6MlVUNkV2SmVuakN6b1dYbXcz?=
 =?utf-8?B?ZEFPVnVlT2kwUlVpakpmRkwzVDVsZzdQWUpHWEltQWZrOHJoTXZndGU2cU9H?=
 =?utf-8?B?eHB0Mk53K2UxWmpQV2RzZkQ0UzZEQml2Tzd1bXpLTjVGazdyT0NDaWcxRHBt?=
 =?utf-8?B?RkYyTUV4bzZZTWpNL3Qwbks3ck1odmFITEFLZU8yY1NMR3ZmOXJ0ZGFrbS9T?=
 =?utf-8?B?eGZlM0hHMStTbzBuTFRtUjYzY2Z0RS9MVXI0Z1VhZGExQWZwRHNyeTI2Nlph?=
 =?utf-8?B?Y0xIa0Vwbk14aEgxR0M4TVFoMFk5bG1JQUhXRFNkbFlVVjRCb2FXeEoyV1Vi?=
 =?utf-8?B?eW9pOTl6SmVTenE3dG9qbWRYR3RwYlpuL3h2a2RkZmJZU3B0SnE2cmVWeHd0?=
 =?utf-8?B?U2JtZDNZcWttZWdVUkNCWTVIMHRIR2ZpZmVmYmMxUnZUa0NtZmlOZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEB4DA0960B240469162C7E231DA108E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5416d7f-2dd6-4e4f-d404-08de6aa57ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 02:13:32.8377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TdZqZ0OQUH/x6H4lelw2ilzIj3X2EwIKZu5MGtRMKsKg8HYce36+fSsHmWYLBdf1gjOkDelSBbHBYhl1i67eh3AjwLB2yCQMbnBQSeE/9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7108
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52679-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lists.infradead.org,chromium.org,collabora.com,xs4all.nl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,mediatek.com:mid,mediatek.com:dkim,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Yunfei.Dong@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 76D361325F2
X-Rspamd-Action: no action

SGkgTmljb2xhcyBEdWZyZXNuZSAmIE5pY29sYXMgRnJhdHRhcm9saSwNCg0KVGhhbmtzIGZvciB5
b3VyIHN1Z2dlc3Rpb24uDQoNCk9uIFRodSwgMjAyNi0wMi0xMiBhdCAxNDozMSAtMDUwMCwgTmlj
b2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gSGksDQo+IA0KPiBMZSBqZXVkaSAxMiBmw6l2cmllciAy
MDI2IMOgIDE3OjQ4ICswMTAwLCBOaWNvbGFzIEZyYXR0YXJvbGkgYSDDqWNyaXQgOg0KPiA+IE9u
IFdlZG5lc2RheSwgMTEgRmVicnVhcnkgMjAyNiAwNjo0MToyOSBDZW50cmFsIEV1cm9wZWFuIFN0
YW5kYXJkDQo+ID4gVGltZSBZdW5mZWkNCj4gPiBEb25nIHdyb3RlOg0KPiA+ID4gTVQ4MTk2IGlz
IGxhdCBzaW5nbGUgY29yZSBhcmNoaXRlY3R1cmUuIFN1cHBvcnQgaXRzIGNvbXBhdGlibGUNCj4g
PiA+IGFuZA0KPiA+ID4gdXNlIGBtdGtfbGF0X3NpZ19jb3JlX3BkYXRhYCB0byBpbml0aWFsaXpl
IHBsYXRmb3JtIGRhdGEuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBEb25n
IDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vcGxhdGZv
cm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgICB8IDYNCj4g
PiA+ICsrKysrKw0KPiA+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9t
dGtfdmNvZGVjX2RlY19kcnYuaCAgIHwgMQ0KPiA+ID4gKw0KPiA+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQNCj4gPiA+IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19kDQo+ID4gPiBydi5jDQo+ID4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZA0KPiA+ID4gcnYuYw0KPiA+ID4gaW5kZXgg
M2I4MWZhZTlmOTEzLi5kOWY3MjI2OTgxOTggMTAwNjQ0DQo+ID4gPiAtLS0NCj4gPiA+IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19kDQo+ID4gPiBydi5jDQo+ID4gPiArKysNCj4gPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19kDQo+ID4gPiBydi5jDQo+
ID4gPiBAQCAtMzQ3LDYgKzM0Nyw4IEBAIHN0YXRpYyB2b2lkDQo+ID4gPiBtdGtfdmNvZGVjX2Rl
Y19nZXRfY2hpcF9uYW1lKHN0cnVjdA0KPiA+ID4gbXRrX3Zjb2RlY19kZWNfZGV2ICp2ZGVjX2Rl
dikNCj4gPiA+ICAJCXZkZWNfZGV2LT5jaGlwX25hbWUgPSBNVEtfVkRFQ19NVDgxODY7DQo+ID4g
PiAgCWVsc2UgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKGRldi0+b2Zfbm9kZSwNCj4gPiA+
ICJtZWRpYXRlayxtdDgxODgtDQo+ID4gPiB2Y29kZWMtZGVjIikpDQo+ID4gPiAgCQl2ZGVjX2Rl
di0+Y2hpcF9uYW1lID0gTVRLX1ZERUNfTVQ4MTg4Ow0KPiA+ID4gKwllbHNlIGlmIChvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShkZXYtPm9mX25vZGUsDQo+ID4gPiAibWVkaWF0ZWssbXQ4MTk2LQ0K
PiA+ID4gdmNvZGVjLWRlYyIpKQ0KPiA+ID4gKwkJdmRlY19kZXYtPmNoaXBfbmFtZSA9IE1US19W
REVDX01UODE5NjsNCj4gPiANCj4gPiBXaHkgaXMgdGhpcyBlbnRpcmUgZnVuY3Rpb24gd3JpdHRl
biBsaWtlIHRoaXMsIGFuZCB3aHkgZG9lcyBpdA0KPiA+IGV4aXN0DQo+ID4gYXQgYWxsPyBZb3Ug
Y2FuIHN0b3JlIHRoZSBjaGlwIG5hbWUgaW4gdGhlIHBsYXRmb3JtIGRhdGEgZm9yIGENCj4gPiBj
b21wYXRpYmxlLA0KPiA+IHRoZXJlYnkgYXZvaWRpbmcgYSBtYXNzaXZlIG9mX2RldmljZV9pc19j
b21wYXRpYmxlIGlmIGJsb2NrIGJlY2F1c2UNCj4gPiB0aGF0J3MNCj4gPiB3aGF0IHBsYXRmb3Jt
IGRhdGEgaXMgZm9yLg0KPiA+IA0KPiA+IFRoZSBvbmx5IHBsYWNlIHdoZXJlIHRoaXMgZnVuY3Rp
b24gaXMgZXZlbiB1c2VkIGlzIGluIHByb2JlLg0KPiA+IA0KPiA+IEp1c3Qgc3RvcmUgaXQgaW4g
eW91ciBtdGtfdmNvZGVjX21hdGNoJ3MgLmRhdGEgc3RydWN0IGFuZCBwdWxsIGl0DQo+ID4gZnJv
bQ0KPiA+IGRldi0+dmRlY19wZGF0YS4gTm8gbmVlZCBmb3IgdGhlIGZ1bmN0aW9uLg0KPiANCj4g
SSBoYXZlIGFscmVhZHkgYXNrZWQgdGhpcyB0byB0aGUgZGV2IHdvcmtpbmcgb24gc29tZSBvdGhl
ciBNVEsgY29kZWMNCj4gcGF0Y2hzZXQsDQo+IGFuZCBJIHRoaW5rIGhlIGFscmVhZHkgcG9zdGVk
IHNvbWUgcHJvcGVyIHJlZmFjdG9yaW5nIChidXQgaGFkIG1vcmUNCj4gY2hhbmdlcyB0bw0KPiBm
aW5pc2ggaXQgdXApLiBNaW5kLCBZdW5mZWksIGNvb3JkaW5hdGluZyB0aGUgZWZmb3J0IG9uIHJl
bW92aW5nIGFsbA0KPiB0aGUgaWYvZWxzZQ0KPiBwbGVhc2UgPyBXZSBhcmUgZG9pbmcgdGhlIHNh
bWUgY29kZSByZXZpZXcgYWdhaW4gYW5kIGFnYWluIHdpdGggZXZlcnkNCj4gc2luZ2xlDQo+IGlu
ZGl2aWR1YWwgd29ya2luZyBvbiB0aGlzIGRyaXZlci4NCj4gDQoNCkkgaGFkIGFscmVhZHkgY29u
ZmlybWVkIHdpdGgga3lyaWUsIGhlIGhhZCBjaGFuZ2VkIHRoZSBjb21wYXRpYmxlIHBhdGNoDQpp
biBtdDgxODkncyBwYXRjaCBzZXQuIFNvIEkganVzdCBuZWVkIHRvIGFkZCBtdDgxOTYncyBjb21w
YXRpYmxlLg0KDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgt
bWVkaWEvcGF0Y2gvMjAyNjAxMjcwMjQyNDguMTg0MDYtMy1reXJpZS53dUBtZWRpYXRlay5jb20v
DQoNCm10ODE4OSdzIHBhdGNoIHNldCBpcyBiYXNlZCBvbiB0aGlzIHBhdGNoIHNldCg4MTk2J3Mp
Lg0KDQo+IHJlZ2FyZHMsDQo+IE5pY29sYXMNCj4gDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9u
Zw0KPiA+IA0KPiA+ID4gIAllbHNlDQo+ID4gPiAgCQl2ZGVjX2Rldi0+Y2hpcF9uYW1lID0gTVRL
X1ZERUNfSU5WQUw7DQo+ID4gPiAgfQ0KPiA+ID4gQEAgLTU2MCw2ICs1NjIsMTAgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiA+IG10a192Y29kZWNfbWF0Y2hbXSA9IHsN
Cj4gPiA+ICAJCS5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC12Y29kZWMtZGVjIiwNCj4g
PiA+ICAJCS5kYXRhID0gJm10a19sYXRfc2lnX2NvcmVfcGRhdGEsDQo+ID4gPiAgCX0sDQo+ID4g
PiArCXsNCj4gPiA+ICsJCS5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni12Y29kZWMtZGVj
IiwNCj4gPiA+ICsJCS5kYXRhID0gJm10a19sYXRfc2lnX2NvcmVfcGRhdGEsDQo+ID4gPiArCX0s
DQo+ID4gPiAgCXt9LA0KPiA+ID4gIH07DQo+ID4gPiAgDQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4g
PiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zj
b2RlY19kZWNfZA0KPiA+ID4gcnYuaA0KPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2QNCj4gPiA+IHJ2LmgNCj4gPiA+
IGluZGV4IGM5ZDI3NTM0YzYzZS4uZjA2ZGZjMWEzNDU1IDEwMDY0NA0KPiA+ID4gLS0tDQo+ID4g
PiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zj
b2RlY19kZWNfZA0KPiA+ID4gcnYuaA0KPiA+ID4gKysrDQo+ID4gPiBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZA0KPiA+ID4g
cnYuaA0KPiA+ID4gQEAgLTI5LDYgKzI5LDcgQEAgZW51bSBtdGtfdmNvZGVjX2RlY19jaGlwX25h
bWUgew0KPiA+ID4gIAlNVEtfVkRFQ19NVDgxODggPSA4MTg4LA0KPiA+ID4gIAlNVEtfVkRFQ19N
VDgxOTIgPSA4MTkyLA0KPiA+ID4gIAlNVEtfVkRFQ19NVDgxOTUgPSA4MTk1LA0KPiA+ID4gKwlN
VEtfVkRFQ19NVDgxOTYgPSA4MTk2LA0KPiA+ID4gIH07DQo+ID4gPiAgDQo+ID4gPiAgLyoNCj4g
PiA+IA0KPiA+IA0KPiA+IA0KPiA+IA0K

