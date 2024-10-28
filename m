Return-Path: <linux-media+bounces-20361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8F9B2204
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 02:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436EE1F21667
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 01:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF68E154444;
	Mon, 28 Oct 2024 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lUUUNFlh";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WEvkCHBu"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C030224CF;
	Mon, 28 Oct 2024 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730079043; cv=fail; b=I6OBBMd/GsQIkTjTfcP2v918TA01rugD1GUUI+hFGtBYPYPBcyK9PqjaXHfqkkziQa2yzEc3K6ldckoH/Uf7YCIM9RdSLlX0AmaHqR8r4YkcdbwhND4PNH9jyuhWs/Rqbe66qdEQxYMEinov9omhpe4/eG01iuKeaPg72eeY6C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730079043; c=relaxed/simple;
	bh=t4drgEk7fWActVzRrZc4H3hRcgtoZALTEvSWlH6zNS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YOmZa3u6jdLCDR3Jda4akUQ9/3CXh0QhM5gsTh6hPxwxUG8QgBBdwDe/D88IPA+Wm5bKfwhdwZVNpMw7orVAFyjrJw6z67LoEBNXuc0hTyRw+aUcDNZvDd5RHGo8kGcPx6MPSr9RhOgr68CQOkq2u58iY73zl78t5mz2tTGTBJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lUUUNFlh; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WEvkCHBu; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 37d8924c94cc11efbd192953cf12861f-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=t4drgEk7fWActVzRrZc4H3hRcgtoZALTEvSWlH6zNS8=;
	b=lUUUNFlhi+y2l3n3XwAREz8JdsYopVFkKvtF8tQzTHfadELbTQTcJnc+SfYWaQ3+8uZmdXqJNhs+A2o5GqEXdqvw5SO8q+DYNrTJWSQh7uTAnPwpma1nmJQtCEA/pr7SXnRamCkgNWea77QnpBSiOZHQpHBKovJ3Ur8ZrlLFQC4=;
X-CID-CACHE: Type:Local,Time:202410280927+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:8dc6243e-1141-49b8-a6a1-071ac41975cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:4c84f1cc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 37d8924c94cc11efbd192953cf12861f-20241028
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1156517678; Mon, 28 Oct 2024 09:30:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 09:30:28 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 09:30:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bH+DCBUPKPZcuZiHIjPCrMOqT5TY3wI+lkfcF+P+ScFFnnaWH9Z5TuTQtFPonu2RfgAE7ZkYam7WRf7E/H+lXcNqXbaCiqEa1YYk04SL0hpDUZemN0MeVi2ggLkeeSDdfQpJnLWjTVa6fYnhU3XMq725I/ptr7fr07C3QmzkHFCKcMrP6/5KmmlGivZ+lL7CoG6Fb6zXCJxHRiAuqQHeu4ggB3AFj3CJ0cBEm+7uLGC7NyD6kOfhPHVt2EHLgLkR7ITrSDXEHP+7sysW+vZI3Fo2QIOmZUnd5ffdt+C6eogc1Oj5m2Wh82E3LHZFXKOL05goXJV23uH63mS6Lq+XDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4drgEk7fWActVzRrZc4H3hRcgtoZALTEvSWlH6zNS8=;
 b=qX94l+OPjOCNYo4hGBAUDYU1i6MtzHbvfy8gN1Xc2ZctdZ5P7pzWx+ppdHobOsV3gDJhY6EVGJ0NMb0bGFtg5WkY2R/fh34h5pa0W/sBsQCCer3fRfeCAZoDO7QzVPUze3QsJAL5BQqFK1e87RJvJ3JgaTizcDMt2KMo59QrAjP+UFrgosN3hKmHKdw4PymZiRtQgRm/k1Nw9+rcLZIeGMUxMguBaEl2dPMC+NZvK0f1j0SUpllD0dUGuu5CkzmEnwzKMsIKttGy6Cij3vNsf2vRLs/bbwV4zTKijM1w8jjg2WbqKwtf40V/OvCwS5OhjRosx6f/QRTMWwHw8M6Imw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4drgEk7fWActVzRrZc4H3hRcgtoZALTEvSWlH6zNS8=;
 b=WEvkCHBuQQGxpg109+HwFh8Lnaj6sf9BImPMTn1k32nb9hN5lg/Fzlio3HvhQ7JjaJ6uyGD9zbEZjeo5in8eG30TaM88HB4NjnP5S+BeySSBJ4auTva5v6K/dcBJpniR9OZbnTy9bsm4G9PTPX/b8BUCJ5Mg2KGacby7qJ5SAXE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6436.apcprd03.prod.outlook.com (2603:1096:101:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 01:30:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 01:30:26 +0000
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
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLKbfXKA
Date: Mon, 28 Oct 2024 01:30:26 +0000
Message-ID: <133fb2170dd636f9eaa9bf3d91f2ed10f17f1213.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6436:EE_
x-ms-office365-filtering-correlation-id: 73bc3241-1aa5-49ce-25d6-08dcf6f01990
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dURJRXFKNHFxOTl1U3NhL2ZyeEJJQmk4NGpZSHVsMlVIZGhZdE83QkdmVHdi?=
 =?utf-8?B?M1FYNzVPaGZackRkbUtZR05ha1hQTXRWL1NJaXpWTjFhTWRtWi9UZUpHVjRE?=
 =?utf-8?B?RWcwS2JEVzhibkN6b3RvclZNNzdMY1hOZ093WmZtSDhaWUdDV0V6MW9FbGNU?=
 =?utf-8?B?dm5SbE1SQUFCd0NmcEV0aVB0cVJCY0txZEo1elZCNU9VL3krMlJFR1RvY3Ji?=
 =?utf-8?B?TEg5aklBSmNhU2ZEU2NwT09nbUJmaXZvZDhrMis0T25qelN1dklmY3B5cDZI?=
 =?utf-8?B?N3czOHZQdkFLSFA4Mnd4ZzNCU2VwK2wxbm44TmY2NWNPcTF6by9JSW1wWTZV?=
 =?utf-8?B?aVdsVGs1NDhEcXB0YVMzZ1NlbGJHaG1aeGkzZmVVcVR6VzlITjNPV0xUV1Uy?=
 =?utf-8?B?NitlV2NDOFNCaTlhSWZ1UXdrWDB3eFlNaER2SmxMS1NQeE91ODJySXJZU2JI?=
 =?utf-8?B?S2JQRlhISVVpU2d3Mm55NDlGYlZxV3VudGlrQ0Qxd05Cc3NrQVgzTFkvV0NF?=
 =?utf-8?B?L0JVcGJwT0JDWXpLeFF6cnpVOUlwOEtWckE0d3prOFhEQ1RZdE1leml2S2E1?=
 =?utf-8?B?SU5WUzlLRXZheGpOYzJSbi9CMmtLMG5kUE5ZMlFqVW5jUmt0US81cEtQaSt1?=
 =?utf-8?B?Znc1NGNvVU1XOUJnUXhqdktJMk5pTDdpT2dQVUp5N2hJYVgvV3RNWGxIRGtX?=
 =?utf-8?B?bzFHaXdocGlvN3AybTZ2ejlLMDVFQmF4dHJCbTdIUldQZEZNeksyazdvcWR3?=
 =?utf-8?B?MGhsdjZla0JYVWFkb0cvbFBGa1c1VGtLOGs4U2lTc1RJWkgrUlFpTmpLNEE1?=
 =?utf-8?B?NnJIT1FMS2l6SVFpUVFLTHpvenlGUXJkSTQxaUpKSXhTWWE5T2ZOWlVya2VF?=
 =?utf-8?B?UTFHS09vTzRJMDlETTB2VDZ1RW8xWnhlUHNoTnhuSS9BSFF6ZXIwblFNZnkx?=
 =?utf-8?B?QSs4bjg5Q05EeExHNzBKRzJ0RFJkMHB5clRLVHV5UmxDMWdwb1pTYTlQRHFh?=
 =?utf-8?B?cXkxMmxCd29reUNxOC9VY3o4U3M5L3RMZ1ppTTMwNlJ0bVhDa0ZWbHpCUmt3?=
 =?utf-8?B?cU9DOHN0NDErd0Z2ZmtCdmgwTHdmR1ZRMzAySFIvZTFBVk96MHhrSnY0cXlw?=
 =?utf-8?B?UFZvY3A0V0xxa0czVmZEV0hWVjdPZlBhOVhMNlFhb1JVNVdjbmt1N2NKTmgz?=
 =?utf-8?B?cmg1eDJ5TG1DTW13UWFqMjNydlE3RDM0ZnVLNTRwMkN0b3pzRlU0WCtmYUlT?=
 =?utf-8?B?TWsxSFJ6NEhLemlINi9UeGY0dExWQmNZbHV5TnU5dlhuVnJDNGdFV3RDR0xl?=
 =?utf-8?B?enRYYzZrMUhMTE9DaUhxTitNb0xKNWhBTjFzWlpENEFTaTJ0UlJaUVFJNlFO?=
 =?utf-8?B?UWU3NUpPUFNuajByTSsxV2JXNlZFYmNob3k4M3pqazhwK09nMjRpOVJ4VTVz?=
 =?utf-8?B?NEZ1cW5kb3NERTlZdDZiV1FTZ0tFNUxCcWRWWXV1cnNaamF1Mk9jU0NhL0lJ?=
 =?utf-8?B?QXZhS0J3YlpaVWlNTDRidFNLTWozKy9TeFIxU0x0UUtwZDUxdWRsL01tQklQ?=
 =?utf-8?B?NGVzUy9sVWFaSUxLNzhmSjVHKzJzZDNmb2NlWEIyZkJMMi83Y0h5SlI2WFVp?=
 =?utf-8?B?Sk0rNHFRMW0vNWdEZEFhOUV0Mkw0TmRoeklLUmNyQ0VUUnVJekM5ZWl0dy82?=
 =?utf-8?B?dEcvWWZscldLRjVyc0Jia0hVSjRxakRoQmFONTRmdFBhZGY4VTNVRHBhU2Vp?=
 =?utf-8?B?REloakk5RGFjWlNONFZRaXdWUjBCQS9EQ3UzbzU0ekg2SllkMnVSWFllamQ5?=
 =?utf-8?Q?X3qIhmG3WsPVpMS8trPmIP6K2N/ChXqFqGGSk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3dhWE11Yzd4YVBYdHBTckoySmVFbFU0T1h6QlRXSHV0ZDhiZ2VvaW0xUll4?=
 =?utf-8?B?Mkk3SG1YazVyMkNkQUk3RWZuS1Q3dndVSG5XaENwQUozNmlzOStZYzZpRi9P?=
 =?utf-8?B?S01QM0s0Z1VLY2JOcW1kak9JWS81WGFva0RWcndMcEY2MU1KeGNJVkNUQyt4?=
 =?utf-8?B?SmoyeTZzcHVyOXAyNkJub0xzRmMxVVdyVDVJNG0xcEhvT3lqRFVyK2dRWC9W?=
 =?utf-8?B?eXEvVVY2c3Qxd3QwTmFEbE9wV1EvVmNSc0tGWFZCR0FmbGYzZU5IaG9lbnhH?=
 =?utf-8?B?YU9IbkMrU0xqdjNELzAzOFFJNm50QmFWTnBwRU1FQVpZVnd5WTNpNVBIMHdx?=
 =?utf-8?B?RXQzMjdtclZZdmUzVk9abXVqVzZEQlpRZS9MVStnZklMUnlDdEVwQ1JSZG8w?=
 =?utf-8?B?SWxCbVIrb1VIaEkrWkZUWHFtRU5Ma1diaWpHYXNrMkpWT2hlZVhnRTZCbnlV?=
 =?utf-8?B?RTdoRHZTK3ZNYmNVQTUyd3RrYUxCaFdEUCtKTGZlMXBxMnh4cDd1YUhOenVo?=
 =?utf-8?B?ZkZPUVVMZm95NmttL0lVcVNxS3F2WmM0b1N1eGcxWlZneDZQYjkvV29UMHNS?=
 =?utf-8?B?OVlLdmVLYVBqbE9CYVV2aUV0U1NsRi9SN3FqZkpTTy9XYTFVVzg4cnFlV1lN?=
 =?utf-8?B?dmhFaXVNQXowVndTV0tKVDBTRTArMUN1enBkS21raDVJQkJGZWJhVzNCaUlY?=
 =?utf-8?B?Z1lCWHVkYU8wTUVjNFFhTXhCNGExSzdGL0cvQjE4QWRIeVh4djh6Wll5ZUdZ?=
 =?utf-8?B?ZThlNStmVUJURlRjcWRLbnhjZjhZNTZEMTE2RXJCbnI2RWpSV0lBYWpFcjBE?=
 =?utf-8?B?K3IweWNTb2hpUzF1czljMkFPNkQ4YkhyT1N1TjE0QkVmaVg4WmQ3dlN1OEdx?=
 =?utf-8?B?UVNZVTVRU1d5Nk5ndGtqbSttb3FabmNNM1lES3Z4RThUTXIyTzU1S05uWGQz?=
 =?utf-8?B?VFluRUtpb2lzbFVhdm5YWkFsOTArbzdwRUErM0RwUHZ3MXVYWENjN0d5dGtD?=
 =?utf-8?B?M3dHU2pDMVB1aG1rK0ZycTZmZWpET2huVHY5cFpzK1gwMmIzVnlrQnFRSTIr?=
 =?utf-8?B?R1hsY1RaSmZDZEttcC90SGpwdkIwK0VKTHBORWF4aDZxT0JpbmNzWW5EMnFt?=
 =?utf-8?B?bWl0NFB6dnM3Vmo5dlJQYzMwUXp6dVc1clJiMlV5OUhoNWQ4Y2ZXZmV4QzEy?=
 =?utf-8?B?WjAwZ1JlOXlENDdSS0xSWHdqYlVnTzdsT3Z0SGNzLzJybFNWR0V4SklHeS9y?=
 =?utf-8?B?WUREdmNpeDdadWlJdmxjbm9WQTJqemN5RG9CeG5jSkJMcGQrUVBCYW1VKytF?=
 =?utf-8?B?bGQ1UUNkTjN2TmtiUkNVTm9adGZNeWpIWFdaWHNPQlg5VjN2elI5RGhUZ3po?=
 =?utf-8?B?MUpoVzVZUW5NWkNlNTF6NnhLN2dJSWVVV0c3dU8zMUZRMlRuOTljb2xzckJE?=
 =?utf-8?B?SWhTT1lvMTFJdEdTUDI4QlRRU0NZZHFhOFV4L04yTDFRUGtwL0xvQzhnektW?=
 =?utf-8?B?RFc0azJ5WVJsbDc0ZTc0L3dtNEZGVVc1MEJZbmZOc0pieUdjWWwrNWVybzk3?=
 =?utf-8?B?UzVacjhjaVlQVjlNV2JQdm55WjJLTkpzWGVKeUo0US8xenZXMjJWUmhtVW5a?=
 =?utf-8?B?WVFjRHVXS1lTNG5MUXl2amNISU53clgweDEyU05oalRqWHRTby9YRmM4ZWo2?=
 =?utf-8?B?S1JMS09MRXpYVWd1YmhzZFFKZnlyK2sra2lWWC9YNnhxWjh0QUpQd0Fwb05K?=
 =?utf-8?B?YjhkNmVCYitQN3hONjRhclduazJUdXhrQ241UGJQangzbWc0QWFBTThXYzdS?=
 =?utf-8?B?ajErQnM3Z1hqNGxmdWhtaGtvamNNaUo1U0ZuT1J4OVJMOEw2cGFQTHZIMEFP?=
 =?utf-8?B?QUhxWHhpd1J3MjNVZmNoUFZuWGxFYUdYZVBNM1BON2M1b3FLMnZBOFIvcExV?=
 =?utf-8?B?a2F2bDhUeTV3MHdQVlMrQXVCamVhL2t4OVZpS1hLa2dTQ0l1ZzY0YTFlK082?=
 =?utf-8?B?RmcrdVFadEJWSmlKd1kvL01jQ0FSeFpWbUdiRW9NbUZmdFd6anBxWkw2RjlJ?=
 =?utf-8?B?Zi9ERkZ2ZSttNU8rQlRyeGtvOWNYK0FjeUs3bFJoakZMZWRLL0x6Nnp3dkdt?=
 =?utf-8?Q?9IZnosi5hGftH5+MQ35XtaXSz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD84B4CAE23B7849813AFE6761006FD6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bc3241-1aa5-49ce-25d6-08dcf6f01990
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 01:30:26.0847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K9LHT7Lso6ePftSp3chr+v6kRAJnC/mNfsFP3gqKtAC9nPfFTJXgZ69R+BgF9RG3dM7xSvA9/R/T/SebB8u+yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6436

T24gV2VkLCAyMDI0LTEwLTA5IGF0IDE5OjE1ICswODAwLCBTaHUtaHNpYW5nIFlhbmcgd3JvdGU6
DQo+IEludHJvZHVjZXMgdGhlIGRyaXZlciBvZiB0aGUgTWVkaWFUZWsgU2Vuc29yIEludGVyZmFj
ZSwNCj4gZm9jdXNpbmcgb24gaW50ZWdyYXRpb24gd2l0aCB0aGUgTWVkaWFUZWsgSVNQIENBTVNZ
Uy4gVGhlDQo+IHNlbmluZiBkZXZpY2UgYnJpZGdlcyBjYW1lcmEgc2Vuc29ycyBhbmQgdGhlIElT
UCBzeXN0ZW0sDQo+IHByb3ZpZGluZyBtYW5hZ2VtZW50IGZvciBzZW5zb3IgZGF0YSByb3V0aW5n
IGFuZCBwcm9jZXNzaW5nLg0KPiBLZXkgZmVhdHVyZXMgaW5jbHVkZSBWNEwyIGZyYW1ld29yayBj
b250cm9sLCBhbmQgZHluYW1pYw0KPiBoYW5kbGluZyBvZiBzdHJlYW0gY29uZmlndXJhdGlvbnMg
YW5kIHZpcnR1YWwgY2hhbm5lbHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlh
bmcgPFNodS1oc2lhbmcuWWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiAr
ZW51bSBWQ19GRUFUVVJFIHsNCj4gKwlWQ19OT05FID0gMCwNCj4gKwlWQ19NSU5fTlVNLA0KPiAr
CVZDX1JBV19EQVRBID0gVkNfTUlOX05VTSwNCj4gKwlWQ19SQVdfREFUQV9NQVgsDQo+ICsNCj4g
KwlWQ19QREFGX01JTl9OVU0gPSBWQ19SQVdfREFUQV9NQVgsDQo+ICsJVkNfUERBRl9TVEFUUyA9
IFZDX1BEQUZfTUlOX05VTSwNCj4gKwlWQ19QREFGX1NUQVRTX05FLA0KPiArCVZDX1BEQUZfU1RB
VFNfTUUsDQo+ICsJVkNfUERBRl9TVEFUU19TRSwNCj4gKwlWQ19QREFGX1NUQVRTX1BJWF8xLA0K
PiArCVZDX1BEQUZfU1RBVFNfUElYXzIsDQo+ICsJVkNfUERBRl9TVEFUU19ORV9QSVhfMSA9IFZD
X1BEQUZfU1RBVFNfUElYXzEsDQo+ICsJVkNfUERBRl9TVEFUU19ORV9QSVhfMiA9IFZDX1BEQUZf
U1RBVFNfUElYXzIsDQo+ICsJVkNfUERBRl9TVEFUU19NRV9QSVhfMSwNCj4gKwlWQ19QREFGX1NU
QVRTX01FX1BJWF8yLA0KPiArCVZDX1BEQUZfU1RBVFNfU0VfUElYXzEsDQoNClZDX1BEQUZfU1RB
VFNfU0VfUElYXzEgaXMgdXNlbGVzcywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
KwlWQ19QREFGX1NUQVRTX1NFX1BJWF8yLA0KPiArCVZDX1BEQUZfTUFYX05VTSwNCj4gKw0KPiAr
CVZDX0hEUl9NSU5fTlVNID0gVkNfUERBRl9NQVhfTlVNLA0KPiArCVZDX0hEUl9NVkhEUiA9IFZD
X0hEUl9NSU5fTlVNLA0KPiArCVZDX0hEUl9NQVhfTlVNLA0KPiArDQo+ICsJVkNfM0hEUl9NSU5f
TlVNID0gVkNfSERSX01BWF9OVU0sDQo+ICsJVkNfM0hEUl9FTUJFRERFRCA9IFZDXzNIRFJfTUlO
X05VTSwNCj4gKwlWQ18zSERSX0ZMSUNLRVIsDQo+ICsJVkNfM0hEUl9ZLA0KPiArCVZDXzNIRFJf
QUUsDQo+ICsJVkNfM0hEUl9NQVhfTlVNLA0KPiArDQo+ICsJVkNfU1RBR0dFUl9NSU5fTlVNID0g
VkNfM0hEUl9NQVhfTlVNLA0KPiArCVZDX1NUQUdHRVJfRU1CRURERUQgPSBWQ19TVEFHR0VSX01J
Tl9OVU0sDQo+ICsJVkNfU1RBR0dFUl9ORSwNCj4gKwlWQ19TVEFHR0VSX01FLA0KPiArCVZDX1NU
QUdHRVJfU0UsDQo+ICsJVkNfU1RBR0dFUl9NQVhfTlVNLA0KPiArDQo+ICsJVkNfWVVWX01JTl9O
VU0gPSBWQ19TVEFHR0VSX01BWF9OVU0sDQo+ICsJVkNfWVVWX1kgPSBWQ19ZVVZfTUlOX05VTSwN
Cj4gKwlWQ19ZVVZfVVYsDQo+ICsJVkNfWVVWX01BWF9OVU0sDQo+ICsNCj4gKwlWQ19SQVdfRVhU
X01JTl9OVU0gPSBWQ19ZVVZfTUFYX05VTSwNCj4gKwlWQ19SQVdfV19EQVRBID0gVkNfUkFXX0VY
VF9NSU5fTlVNLA0KPiArCVZDX1JBV19QUk9DRVNTRURfREFUQSwNCj4gKwlWQ19SQVdfRVhUX01B
WF9OVU0sDQo+ICsNCj4gKwlWQ19HRU5FUkFMX0RBVEFfTUlOX05VTSA9IFZDX1JBV19FWFRfTUFY
X05VTSwNCj4gKwlWQ19HRU5FUkFMX0VNQkVEREVEID0gVkNfR0VORVJBTF9EQVRBX01JTl9OVU0s
DQo+ICsJVkNfR0VORVJBTF9EQVRBX01BWF9OVU0sDQo+ICsNCj4gKwlWQ19NQVhfTlVNID0gVkNf
R0VORVJBTF9EQVRBX01BWF9OVU0sDQo+ICt9Ow0KPiArDQoNCg==

