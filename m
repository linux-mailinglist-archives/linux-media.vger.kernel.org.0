Return-Path: <linux-media+bounces-20469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EFF9B4081
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 03:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36C8D1C21AC9
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 02:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEC31DFE26;
	Tue, 29 Oct 2024 02:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Qk1BnZvN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ji6/PeO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEB4194096;
	Tue, 29 Oct 2024 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730169366; cv=fail; b=Su7oAfYOxgU9lEzE7A4F4P1zpr5rXjcNPh5XExzKTrVN3oNXlmPqZ1zlCi3xQW86N/HvsIZ65V2SLm26nmySBRFMoqxTWA5fYjoBAZycx4gfTuElY/q9rAXpnVXpxq6E4h9TM72ktTxHfS6Frz/Hk76HIKB4sNoxosPFyvNaVnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730169366; c=relaxed/simple;
	bh=a5sHbeUC9nnJI54B1FFEnP43fwI4Xkoc7WpnRaH6FZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JE7wr0s++B6Ej6j/kRbgSmlH9nveaHTivN+uBFdgWjKpRXy2u6NkY0ea/oFx4yfYdReAJG65Vr7M9W9yzCUGtIS4lSb/05O02by5Nzx4S3v9xteLBah7D4OWysEiZndYhGvW8AmUGEgX3HQ1RKPV26TaY9L/Xi04+7TOKgMI9GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Qk1BnZvN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ji6/PeO4; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 850f4560959e11efbd192953cf12861f-20241029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=a5sHbeUC9nnJI54B1FFEnP43fwI4Xkoc7WpnRaH6FZQ=;
	b=Qk1BnZvNDCQrhEQkAtoP+NSZ1s0osZV5HHXJCZdI/vmAwGtZvSzltMWE5OKTTx0Km7q9kRvcEBZ8K3kMdXZEknCVAqBdWwRjRMQOUuMFHbw1FUnxqLLvDjBBfaf+k7R2cQ4gE1rSR4y9YsBW2m5DUm7KOOyd/YVLyO3CeYMFNpw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:18ece390-3b81-4883-bec8-af1a224508fe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:96eb33e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 850f4560959e11efbd192953cf12861f-20241029
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 93781859; Tue, 29 Oct 2024 10:35:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 19:35:52 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 29 Oct 2024 10:35:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nbf4r2sf5dkyjmOBC7VxGtJPvrmce87zzlVIy+yKrpzwD6fBz7PtPwwZkcj2h/WBrZ4SydNyhYcgtLRmlIopngu0mIzmi0qSOj71/lNpcQkIgF+hV6bsode2a+99j2ZmO4gZVtsHb9FxDTi56QoErbYDA/JCspTQpCK5/gCaOfqZPLiRFSYZexsN/DSfps0GpcA8h2h7WkPUoobUroY0OU8O/sEzx1t3jPXZK28F6QTGvAZ19/PrW1mE8Foa+6LZ+7nmxf+nbmuzjfcJf/atxp81ojXysUno+EnsK7v+KICVAz92gBPW2hgxQj0gyP4vWhHxAouL5Bkd/c7aGakhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5sHbeUC9nnJI54B1FFEnP43fwI4Xkoc7WpnRaH6FZQ=;
 b=gx4W0Boag5k9/UPjCdLy62kzB2RAL5H3sYr5BfMi32LqdAK3SAm/MoP8a6Mr4cipzjyVF8V68sKs+8JxHRLGt+P844QwafT2NDSJoQjD4ZcMY7HHbCeWc7W9vScCIndjcFzctYnh38lLcU1H5qPmlxSecYxcOTiu4Ukm5qKeP04PA3AxSqQP4nz7McFYd7QuX56u55W20ySZoBkBrhertGtNC9p5TeLpoyzHKi6A6pTPaaz//jHrKR1DZGXqJOtsF8zP9vyLmGMe8xOaMbUKBzLdleMQTnrO7C8bUEw43AWY+O+Qc0wsbR7R2nvP3B7FKeTrtykVvgEnFDpKSudlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5sHbeUC9nnJI54B1FFEnP43fwI4Xkoc7WpnRaH6FZQ=;
 b=ji6/PeO4A5SNnHTBF2joB0C9kg2mUdvCILHi+lMaeeSpFZ3hIjL+o1+nCKd4lIGL5XiFeoNpXWhRqSI6x2q3NUqHk8dFkz1Ufv9b/IFGmZb/yjRWVR5QYVJe++jnC5NnL4/AS94qdZ2iIYnP155OJzOKB4RdD7lsePo4ee8jNZ4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7689.apcprd03.prod.outlook.com (2603:1096:400:414::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 02:35:49 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 02:35:49 +0000
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
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKdIgoA
Date: Tue, 29 Oct 2024 02:35:49 +0000
Message-ID: <a5f2c51de91f9a5bbe6f2fdcf75e93b6ff929123.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7689:EE_
x-ms-office365-filtering-correlation-id: be48871c-7a63-4fe4-559f-08dcf7c26662
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVJWVGpsN3VvU2VkL04xQ3lnZ3dUWlUxSkx1Y0Vuc1granRsczk0aVpEdEoz?=
 =?utf-8?B?OEdtNk9hNEJHRnB2SC94R2YybzdBQ1hJRUI2d2wrOGVqWUN6VVNYNTJ3Tjl2?=
 =?utf-8?B?UkFHV1hGVjBDdGJkWnJyRHVBWnBOOStpV0RpdUk2Y1BndWZNbkhTZnRTVVFF?=
 =?utf-8?B?TGpDY0hadUYxcWI0eXA1UjBTSEExcnpra1g4MEhPNkh4UTZtZUdrdjlta0d5?=
 =?utf-8?B?dVh0cHR2eWMvWW54V25LK3lUKzQwTTNCTUtybzlnZ0Y1M3pHYWM2dEhXRENn?=
 =?utf-8?B?bDE2NVYxdXI0eEZHNC92VktWTVIvTDRUNS93bmI0ekVGOVlLUTBKYWYxZ29O?=
 =?utf-8?B?M1JjQklFcmFkUlZKZVdoYjFWbEZ6K0t6b1J0bVF0WUt3T0UxNER4VWQvZEdj?=
 =?utf-8?B?SUFhTjRqL2pXTkZyVWVHOHlmZE1DaXZKd1lZWE1DV1psT0hkajErbnRNSDhr?=
 =?utf-8?B?N0ZpZ0d6MnJzNUk4LzdMT25SRVlLMGhVM1BGSHZpSks4ODJoNWk2OEw3c1J6?=
 =?utf-8?B?QUFCSDZXVlg5RlVSZGZ3cHpsU2k3b2xiQnFZbGVNeUt0K3JseldPNnFCZ2g0?=
 =?utf-8?B?c3ZnQy9QS2xwOEVSVkV5N1hsRnZVMzI1dU1vS1NQOEN6ZWtPVkROcCtZWFdM?=
 =?utf-8?B?UUU4QlJhU1luUWN4QXBwSGt2Rm16aFA2cWoxdEd5eEl1cFB1QnRoRVVCUWNu?=
 =?utf-8?B?bGNOQjJiQUpXSnBwSHU3dVo3N1A4cDY5RjZJdEFMdDZsTmNwYUNMdzNHbjFS?=
 =?utf-8?B?NkIyYkkzQTFEcGtpZGhqNUdRbVZDbTFCdDRSbnhBVG8wbDBCNXFaVklZSFo1?=
 =?utf-8?B?QkRCZTdUblpRUWVFUlVYakRjQnVQQytkYnoyNk1ObjE1d3hOUkR2ZFU2VENL?=
 =?utf-8?B?WlFNNFlYcDhXOWFnMVVCV09iako2RFZuVU1ucmdiUmRRWDB6dEE1bm80RHZz?=
 =?utf-8?B?T2lyU0pGL1M0TkczWGh4VFNpSE9pYnhnMm5BbWhSZ2xsV0Z0dDloTlZmQlpZ?=
 =?utf-8?B?Tkh2aUM0L2lyQ1pRZTdDUldMR3BEcmVqcSs3ZThCOS84Yi8ybEpUOWJaa0Jk?=
 =?utf-8?B?RmpkZFFFRFhYVVF0TG1SbG1Da2VDc1Iyak04NW9SdFNHRDNJZG5jK0tQUGh5?=
 =?utf-8?B?WGxMWEhJMDBnNDM1TEJtRkpvWTdMU3p2dnFKTGxKeHZqc3Y2SWRzZDlJbG14?=
 =?utf-8?B?Nkt2SmVUeDRCSGNKVjhLMDkzRjhCMFJWVm1XYlVFTkR3bUtCaU5VMm4xZlpZ?=
 =?utf-8?B?ZnVWQUJZcTB0Mkt0aGZtSGJJblY5V3BpMW9iL0xJZ0RkMlVuQzJPbVJsa3Uw?=
 =?utf-8?B?T080S01Zb1cxcWgzYzV4MXU5Zk5qdmhwSjhCc2pTaXlqRHl1VDVRMXVSajM2?=
 =?utf-8?B?UVlhQ3hrcjBsUjVVdkprZW9QcDZIOHdzQ3psWEtjS2VxUmJpUFJzaGhia0VQ?=
 =?utf-8?B?NzFkaWQ1NkZZZ2pITUhjTndxQTNOQkl6THppQXVTbHFDcDNxOGc4OVNUblpF?=
 =?utf-8?B?TmlaT1ZoZlRCaE10K0dKRmVPZWZValhmSm1uZFJ6elRkcnZTN1BsSUtlemZw?=
 =?utf-8?B?TitZTko4OU1YWUhTa3MrZjlEYVpIUTNBMDRYRHFWNGxDREJKSUJ1MUdrYlIr?=
 =?utf-8?B?MnlsMmJQa2V1blBmd2pONkdRaUlEZ21qWFE5THJOdk1pWElaR0pyM3FidWxH?=
 =?utf-8?B?Um83dXRBYzd5eUdMeDJlcmlTVkJ2VjNjRHJPUHpWWjBINXlCMVN2MlRRWmg1?=
 =?utf-8?B?bUQxNW5aRDc0aUV0TitTOHJlMFR6Z2hOSlZtTGViUVZQUDFiS2FyQ1loRlRC?=
 =?utf-8?Q?BgHxh5xiaF9qtHzLbSp6c5eDJyMc3F9pl2h5M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkxPT3NNUGRsOUw1OFRJVlF4U1dISUtQUmtHNGJCWU1scE9jdURNLzh1TUkv?=
 =?utf-8?B?L3VVeGZyeGtwemUveWordVA4RUlSU1BzSnlmaGt0UTZ6eG1TT3h0NGtxeFJr?=
 =?utf-8?B?aHF4REJ4blRDUFVCMVFtV2ZEa2xCazVIcWVKSy9DQVBUQUZGbVZsTXFjNEN6?=
 =?utf-8?B?N0pEZ045MTFkdDhXZmc1Y2F0MXd0d0hJVFh5cDAwM1AvempqVjNiU0t0NnZa?=
 =?utf-8?B?TGx5dGJSM0h2emdnaEErSjNKR3FXVkpmNGExNUxBMFlvUktZS1krK0JPZ21T?=
 =?utf-8?B?YUZvSHJZRjBkQTZ3YWtMNGIrbCtIbXhNTzVuQnJLOUVOcjI3NFAzWVFiVDNu?=
 =?utf-8?B?VTdhdGU2OFNTVExId01MSlBmK1gvc1BmbnVqbXdVaEwwNk1yVzhxTkZRSWJ6?=
 =?utf-8?B?K3BBN3U5Vm1kM3d1cHVIUlJ4bGhMMitzVVhZZ09WNHdLV3lIbnpJSjV4WVgz?=
 =?utf-8?B?czZvZnZaN2UvZVJaWnorUS9OK1pKZWN2bHlMTkhuR2gxVW5WejZVcGhPa3I5?=
 =?utf-8?B?T1dHa1JTU3BYNXViRkQvbTgzU1dOZkE3NVNHbFZNanpBaTdpaUdHQUY3YWgy?=
 =?utf-8?B?aGxzSHpiQ29BNTIzMEJBa0RYYWx4dk5DcTVwcUlzT2ZwcGsyNXZKSklheEFp?=
 =?utf-8?B?Wm5EK2dxUVF3ei9semU0Qm5mU1ZYZmFMRVpobzh3ZEhEY1hQS2hrTHdINnVk?=
 =?utf-8?B?Y0l1Zkl0bTBEbWcwK1p0MW9KRDNOdnhmNjZXQzUrMFhaN2ZoSXM5Z0pwc2VZ?=
 =?utf-8?B?eXd1K05oYmtlTVM3blNxYkRwLytpenlGV0g4NXlBSTNRaUV0bE0xckQ1KzBB?=
 =?utf-8?B?VkF1R1ZNVm95WkEvdVJ4c3BBS1A2U2pMNkY4KytzR2RBcnZ5d09waUdSNCs3?=
 =?utf-8?B?b3V1aFYxZ0lQUDVvdG5ZdjJVSmswL1VCMStPRHZVdTl4bkw5d0N2Ri85TFdl?=
 =?utf-8?B?TlpMdUkxK3BYVnBlTFpBcm0wT1pIaVNnNVhGUEt0dkV3YXNKL0x4aHIyVitz?=
 =?utf-8?B?QzNpeUJFdTN3VURQSHgxQVJpWjd3cEptVXVvSXF0cE45aXN3YS9kcks1WWtn?=
 =?utf-8?B?TmN2UnpabVd4WWRQeVFpcEF2cDZnVUlkTUxjUERvZVNRYVo2am1GUU5Bc2RY?=
 =?utf-8?B?NytYdi9pL2l5ZkhheWl1YzBQd2RBM1NwSStaUjZJWG1TZ1RYSGpNV2ZWL0FI?=
 =?utf-8?B?SnNBVzZOclhsSCs1V0F4d2liYUZVNWhOaDkzMTlCc2VMZEQ0OVQydzRGZk54?=
 =?utf-8?B?WnNHTkF6NU5FV0loemZoSUdCa3FUbnZrQW1NSEtkMzNtMDdVTnNxbjJYbWNk?=
 =?utf-8?B?aC9scU9uTnY3SW5WbDN3QnNzNEpGTzdHdVJBZkVpVUxmOVo0M3BwSjY4cW9H?=
 =?utf-8?B?TGdTOGg0UG1KNEpib21TZm03WDhYYnZzWXFxOFlEOUlsWDhJQlR0SWx6VXJ5?=
 =?utf-8?B?OG4zcittdUxwOFhONEV4NlFWWmdSTjg2WVJQeFRSRHFGbE0rWThVZ1drT3Yw?=
 =?utf-8?B?UjRBMllSSk5EMXdUdFZ1eXJPanVQWFBtbUhqVlNsRWdiZ0lwUzZJaEgyU0Ny?=
 =?utf-8?B?c2ZtOG9CMUxpMGo1QkdKUllhb2kxYW5UdHk5ZFNVTjB6MVFicTMvbVY5azd3?=
 =?utf-8?B?MENhcTBsTGtGMVNMYnpDQ255c2dDTzQ3QlRIRzIydFk3T3FveHJaeVA0S3lt?=
 =?utf-8?B?blJmM1Y2L3J4TUtuTG5pZjBwVDVBdHpsVWt1dFJEb2FYTGEwTkhqcGNkcUFD?=
 =?utf-8?B?dmk5ZmtSbnZGSklCY0cxdE94QnpIejEyOGlDcjdYMCtzcHdRaktQbUY1TW1Z?=
 =?utf-8?B?RWtmNVVoNHJIWC80dWZmeStOUnltQ3dHL3NZRW9uZGROa0VaaHdqZWtPOFpI?=
 =?utf-8?B?bmxTcnlobFl3YmVmTnJ2d2RTc0RZV1IzanhOZEpaSE9BUE45aDRWc3pPb3hX?=
 =?utf-8?B?VXZaeVZDU3dvdEhGeVE5MEVQdWlKS1hIbGNoTGZhMkQvWmtrRVpSSktrSEhO?=
 =?utf-8?B?QUNjZ1lXR0NjRXNiSk5JZ1ozaFU2KzRUWkhBbnFRM1BoT0ticHM1aU1BOElY?=
 =?utf-8?B?VThWNUMzQ1QycjlibHNjclRkVnBMWDBZK250T05lcnJpN3hJUFpoZkprWDRY?=
 =?utf-8?B?dlI4Ty8yZnRwOExBNGtuKzE4WWYrYkNhcVpnZzNwazkzeFMvdCtCV3o4M3dP?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01BC1E7A01E6AE4EBA7FB1F461969A79@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be48871c-7a63-4fe4-559f-08dcf7c26662
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 02:35:49.2749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GryA2mLBJIiyzFQoVnCp+RHMitYcarLh5mPUTZpiD7XHMWZxEWzhULRi0c+m9YDh4q6GQv9QOmJQq/g5cdmG+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7689

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
DQo+ICsNCj4gKy8qKg0KPiArICogTWVkaWFUZWsgVW5pdmVyc2FsIEZyYW1lIEJ1ZmZlciBDb21w
cmVzc2lvbiAoVUZCQykgYnVmZmVyIGhlYWRlcg0KPiArICogQ2FsbGVyIG11c3QgZm9sbG93IHRo
ZSBiaXQgc3RyZWFtIGJ1ZmZlciBzaXplIGFuZCBsZW5ndGggdGFibGUgYnVmZmVyIHNpemUuDQo+
ICsgKg0KPiArICogSGVhZGVyIFNpemUNCj4gKyAqIEZpeGVkIHNpemUgb2YgNDA5NiBieXRlcy4g
Q2FsbGVyIFNIT1VMRCBOT1QgZWRpdCBpdC4NCj4gKyAqDQo+ICsgKiBCaXQgU3RyZWFtIFNpemUN
Cj4gKyAqIEJpdCBzdHJlYW0gd2lkdGggbXVzdCBiZSBhbGlnbmVkIHRvIDY0IHBpeGVsLg0KPiAr
ICovDQo+ICsNCj4gK3N0cnVjdCB1ZmJjX2J1Zl9oZWFkZXIgew0KPiArCS8qKiBEZXNjcmliZSBp
bWFnZSByZXNvbHV0aW9uLCB1bml0IGluIHBpeGVsLiAqLw0KPiArCXUzMiB3aWR0aDsNCj4gKwkv
KiogRGVzY3JpYmUgaW1hZ2UgcmVzb2x1dGlvbiwgdW5pdCBpbiBwaXhlbC4gKi8NCj4gKwl1MzIg
aGVpZ2h0Ow0KPiArCS8qKiBEZXNjcmliZSBVRkJDIGRhdGEgcGxhbmUgY291bnQsIFVGQkMgc3Vw
cG9ydHMgbWF4aW11bSAyIHBsYW5lcy4gKi8NCj4gKwl1MzIgcGxhbmVfY291bnQ7DQo+ICsJLyoq
IERlc2NyaWJlIHRoZSBvcmlnaW5hbCBpbWFnZSBkYXRhIGJpdHMgcGVyIHBpeGVsIG9mIHRoZSBn
aXZlbiBwbGFuZS4gKi8NCj4gKwl1MzIgYml0c19wZXJfcGl4ZWxbM107DQo+ICsNCj4gKwkvKioN
Cj4gKwkgKiBEZXNjcmliZSB0aGUgb2Zmc2V0IG9mIHRoZSBnaXZlbiBwbGFuZSBiaXQgc3RyZWFt
IGRhdGEgaW4gYnl0ZXMsDQo+ICsJICogaW5jbHVkaW5nIGhlYWRlciBzaXplLg0KPiArCSAqLw0K
PiArCXUzMiBiaXRzdHJlYW1fb2Zmc2V0WzNdOw0KPiArCS8qKiBEZXNjcmliZSB0aGUgYml0IHN0
cmVhbSBkYXRhIHNpemUgaW4gYnl0ZXMgb2YgdGhlIGdpdmVuIHBsYW5lLiAqLw0KPiArCXUzMiBi
aXRzdHJlYW1fc2l6ZVszXTsNCj4gKwkvKiogRGVzY3JpYmUgdGhlIGVuY29kZWQgZGF0YSBzaXpl
IGluIGJ5dGVzIG9mIHRoZSBnaXZlbiBwbGFuZS4gKi8NCj4gKwl1MzIgYml0c3RyZWFtX2RhdGFf
c2l6ZVszXTsNCj4gKw0KPiArCS8qKg0KPiArCSAqIERlc2NyaWJlIHRoZSBvZmZzZXQgb2YgbGVu
Z3RoIHRhYmxlIG9mIHRoZSBnaXZlbiBwbGFuZSwgaW5jbHVkaW5nDQo+ICsJICogaGVhZGVyIHNp
emUuDQo+ICsJICovDQo+ICsJdTMyIHRhYmxlX29mZnNldFszXTsNCj4gKwkvKiogRGVzY3JpYmUg
dGhlIGxlbmd0aCB0YWJsZSBzaXplIG9mIHRoZSBnaXZlbiBwbGFuZSAqLw0KPiArCXUzMiB0YWJs
ZV9zaXplWzNdOw0KPiArCS8qKiBEZXNjcmliZSB0aGUgdG90YWwgYnVmZmVyIHNpemUsIGluY2x1
ZGluZyBidWZmZXIgaGVhZGVyLiAqLw0KPiArCXUzMiBidWZmZXJfc2l6ZTsNCj4gK307DQo+ICsN
Cj4gK3N0cnVjdCB1ZmJjX2J1ZmZlcl9oZWFkZXIgew0KPiArCXVuaW9uIHsNCj4gKwkJc3RydWN0
IHVmYmNfYnVmX2hlYWRlciBoZWFkZXI7DQoNCidzdHJ1Y3QgdWZiY19idWZfaGVhZGVyJyBpcyBu
ZXZlciB1c2VkLCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCQl1OCBiaXRzWzQw
OTZdOw0KPiArCX07DQo+ICt9Ow0KPiArDQoNCg==

