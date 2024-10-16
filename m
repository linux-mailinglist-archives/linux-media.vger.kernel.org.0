Return-Path: <linux-media+bounces-19711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D999FF9D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94C42B25D67
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D0C17CA1D;
	Wed, 16 Oct 2024 03:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rV5brAUv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UhtKljGy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A8521E3B6;
	Wed, 16 Oct 2024 03:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050212; cv=fail; b=OcgiuYwTlBYlIQyYgO/UN7MrwHmqbZ1JYq90VVYo/LfOxp1iHtzVEC4K4ajUlyWUNRv8qe9kYKuNsjepg5xWN0jRQt/tLFS5QGSITYJysBGXOt96CBEwx2xdDrSKyod+hmGRxGcrUJABgzPHkYc28apdVRSmRScDFhSyLPbtI/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050212; c=relaxed/simple;
	bh=9zUv1Yg9i2jAlqwyhGCFNvO7gQmna21wqHZhu6k0too=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UeQfEJjJxC4EWVbNCEqfl/BQ85OM+kM1wioPeKIzjVz3Bw3MoWtMqlQeXSNj/Jwfb8ZYZ7jXOKGR0mdVHJ/4aBNmUHZUR6zbv/v6gx27dp4sHZhAZngk/w47DxQUcOD4BJUYTzW12nV/Ke3xDTTYAhyiYcYL/sYWHGwzpph0IfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rV5brAUv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UhtKljGy; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ca7149b08b7011ef88ecadb115cee93b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9zUv1Yg9i2jAlqwyhGCFNvO7gQmna21wqHZhu6k0too=;
	b=rV5brAUvvj9jtR9f+w1Z3gJXsixHRijZ3lIDw07EWfa/PdN7XyYEtBJ0J2kDR1qqfanoxlApoPaOZ7cpG7J5e9P8d4bthpWgKBdemPkBFJM/nMccs9UnMeoPpLxENBIv/HI29WFB0nDIylb3A0tx60piS3q0BOTGekmgJa+bA/w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:551d0481-7719-434a-9507-90c6f4040d12,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:6a4a5341-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca7149b08b7011ef88ecadb115cee93b-20241016
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1144412018; Wed, 16 Oct 2024 11:43:22 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:43:20 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:43:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiT5+zwZ0EA+62NfoEiqlffAgsmP3Tf2GeFmfo4HbTW24Pg7VWcfb/On8RBBn/ATI7zBiMEs624TjgTUcSSPo1Uu9TIYQqg0k8MPC4xQUVDkOC7A1qkEoGxV+2Ys3Kw8WkGBFtlqpvy8k9D7qs0J+BgJ2X5fcxD4cDk4gsXNJQ5Nlk7DxeY91JHxSvkzVrq1/95ooxUPsmPUp5cZQVOylPeaJzXEDUC8C6enAyfCP8S+IpTlTp2Qyudg3cOnNmAAAwxDZBKX5PB73QeeysrXus3Hs/E/8WqFCxlAEZqdnnynXtrJ+jXkiJiJoBu9TDwHW54BB8dcpItlVvVl6NNP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zUv1Yg9i2jAlqwyhGCFNvO7gQmna21wqHZhu6k0too=;
 b=iCLI0pSHk6qt0djlewpbNT9ou8WbokE+NwDAfbOZl1/w/8s+rZ8gktnH5ku3MkMumoIwaXUFcQTAJ0DMU2RIJ9IN9sjQjxdPAgJfJuSuSnix49dQju5oUsN4pfg2BdybLucfmnwqi9dJ8Bs9sqqwOytR9vNlGGux1tIwAjq+rKS5u7hnj08hB1v0ODYJP0foiyoRDwmvR4toMjcvi8TVPBFukeH/zt1kLmhiz4OI9lnEMgSUp0j3E3lgj1p9iZrBXiTCRYWJYHPqFymlDiyAvGbWwcxJsGcCcOGVX0FVShh15DhCjVcPyBavtCcZJZZ9TpyuaGK87iqOkJaNhCiEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zUv1Yg9i2jAlqwyhGCFNvO7gQmna21wqHZhu6k0too=;
 b=UhtKljGyV6/wkXFg3oPeaJUH6fAc3a9HJf2DvqhPxuyzW37d+HjDe0I7nfcqagIlx1mAmexkmRFAvmETL67gnRqEnKIQyZi1fPcfpqtsSrr2pkaCQZxVHAGQMQ+a0NB9ckaRl4EC4QpMiVrIR8xh/BL13fBy9oQWUxi2SYuxjCw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7235.apcprd03.prod.outlook.com (2603:1096:301:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 03:43:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 03:43:17 +0000
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
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKIxpUA
Date: Wed, 16 Oct 2024 03:43:17 +0000
Message-ID: <c976a3b11f88dc5896862b6ad3e0be772a6b2f45.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7235:EE_
x-ms-office365-filtering-correlation-id: 55291396-a558-4c7b-1881-08dced94abf1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZDR1eStFRXFmOXRtTDBOU2dFK1M1T2hXWHhOLzMwY1BjeVp4NE9lQnN1Vi9w?=
 =?utf-8?B?dVQ5OWZMRnVBc241ZUNzZ2V0cU0xNkpqbnpYKzVBUWJFOGRCdzNKWWUwRDlY?=
 =?utf-8?B?RHV6cVJ5YVViR2J4Q3ArcFFGdmFuQnRpN2RNeVpWb2VTZi9TSHJxNTdZNkdo?=
 =?utf-8?B?c0hJNW1sdG5Ic0N0NUI5bFRtUXRlQmdLaWV3NVhUSGtjUGVEOW50QlkzNzZ0?=
 =?utf-8?B?RzBhWHlPT2pxbkRXc1hKUk83akQ1VGliUlE2VzNuVzNvNytEUTgvSjloc3JH?=
 =?utf-8?B?RzFLVGpBb2M5bzRVNmxscWhOaDk3OTIrSDVtVkQyUVZ2VWhqWXRwNTNYeGYw?=
 =?utf-8?B?YVZaVFVMM3IrbGd2RS9LNDNSVGNlVE1UcStkZGhTVE1SQnhOY011YTJ1cE1h?=
 =?utf-8?B?MWcyZk15MXFxV29PbFhadVQ3VnE3TjdTcU1JUjUzdjV0UkRFNXZYT0pteVpF?=
 =?utf-8?B?amNOU0Z0cXd6REc1WHh2cUV2NmdRZ1M5K3V2ZThGQ1laS3BjTEgxVUJQMG13?=
 =?utf-8?B?SnIwVVQ0K2V0K2Q4dGFFTmNVU0xmV3pCbU8vSXpyUTJkWHc0SzRVcHEwMDMx?=
 =?utf-8?B?TEw4ZjRrUG9oMjFsZVd4NldGVWluaytBQkxRTmZEZUVPYzRRY3JVSk5TOFFP?=
 =?utf-8?B?YVN4dHVmUTkzT3k4ODNRK0FsMzQwbDl1TE9RNkcxdjcyRHF2Vlg3dnNDNXZS?=
 =?utf-8?B?REFVY3hPZ0tVWk1kZ0VkaWtuTHhyL29OS3hhVmJvNmlGaTZyVVNzbytncGt0?=
 =?utf-8?B?UjlDb0R5TzdJUVdzMzZaeXo0TWhHdC9rdmJyT0VmSkl2YmVwdlZXeVdWV0Z4?=
 =?utf-8?B?UE03NFdBZ1dwaEZuaEZZYkRjdHY3bDN6SllxaFNMYTY2a0Qvc2lRejhYUDBT?=
 =?utf-8?B?TDltOC9nSGw0TGNXays3RGE3VUZiZ1gxSWRXTVBUWmI0ZmFzdDVjb3REajhD?=
 =?utf-8?B?VEphc0cySW45WTJMUTlFNzdRbVR5eC9aL1VsYlF3cndYbnBIaUtMVEZDUTlP?=
 =?utf-8?B?ZlVLcHRoa21VbVBkQjFFS2p5UWViVVFJNjNpU0FyWnJ4UmxRM2xwb1BTclNk?=
 =?utf-8?B?VUxvS1kzWEJmZmJVeFpDL25FQUhwMSs4ZjFxaUR3UEFaWHh5ZWNtRldGUFNR?=
 =?utf-8?B?VmU0bGlLL1ovZUZxS2ZVaUx5a2RVQndDdXZVMCs2bWh4SENxUFU0bUJzcUsr?=
 =?utf-8?B?VG1xVGhySmVPcFpURXBsZFVqZGRrZ0daaVFVbEFMSDZaY2FBS0FIOGZHZDNR?=
 =?utf-8?B?b2t1M09Wck95NzlBbDdORmZUQ3gvWEl2S0FkTGRDV3ovZWFQbDNnM3ZGQ2tr?=
 =?utf-8?B?U1JydEhDZjl4YXR2cm9QU3lZeW5OZmMxa0lxVm94TUxocGNUZjQ1cnE2QU00?=
 =?utf-8?B?bXYzaHhsL3VYSFpDK0szVnRYdkxUMXNudWl6UmRLSng1Y2lkQndTM1hGRWFG?=
 =?utf-8?B?OStxeUwxcVJzSHF4QXdMVUlucEkxSmVzUFFINlNoOVJJbzJuUHdSamg5MGEr?=
 =?utf-8?B?aVNqYnlLK2pPN041L3Z0T3AwNUlWbml4WjdKQ3RPSWFxcXV0N1B1WmRpU1Bu?=
 =?utf-8?B?b3llR1pkaE5nZjl6anRuZVY3ZC9RYlkvYk1TYllUaENLZDlwWHAwdFBTZGpF?=
 =?utf-8?B?L0Frc2hlcXZpbG1jL0ZvZWZyWFhvYzN2S2R1bmpJUkZxelVpQS80QVFxN2t3?=
 =?utf-8?B?ekh2UzhHT0VTV2xXMGxBYnRlSFpvemxrdk5oSExMendocHN4UnZiNDVYVDNH?=
 =?utf-8?B?Mm9Ra0p0UzZkYkRHd2NiN0NXaW1MNjJ3TE5lVy9OWmZiTVVHa3ZTeEFicUFP?=
 =?utf-8?B?TXVud1pPcTB2Z1p2T2MyUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azFubUZCMklLT1l0YnhhcUVwVEdKeXVaaktsT1dBeFR0OGlmaDdVTDEzb2FM?=
 =?utf-8?B?MzBkMERaZlJIWFovekduQlF1WTI3VEQrSEdKY0xjNlZtOENZa3RZdlNnN1Jw?=
 =?utf-8?B?MEl1cWpOd2ZSNmMyMUtOOU5MUWk0TnRtY2JMdm91QyswTFV5TmtmbTA5U1By?=
 =?utf-8?B?TlhSSmVxejFLR0gyR3IxeDI5TXI0b0l0MXcwZUJoUGdXdzdQZWJhQ2lnUDIy?=
 =?utf-8?B?TktHcXd1azI2aW8vZzRHU0FhM0h0MHY0ZkVzdk1OczVjb0xKc3cxQ0d3MGZm?=
 =?utf-8?B?a3lZTjVQYUM5S1ppUzdyR3JJd2E3VFRITFVyS2t1UDZIOFhHTVNiMWxuTCtD?=
 =?utf-8?B?OVh3NWNOM1hMekpKNXZERzZyZ0U5K2ttTmNsTW02bXZjVEtPT0ZvbHJncjN6?=
 =?utf-8?B?SkFjWTE5WGptTFJHTUVYSytobFY3dzl5aGpoanBncjA3bktacUNUUDRTVEFw?=
 =?utf-8?B?UDlCYVFqN1lCSFBHdzVJN3V6WVpLZ2JZY29zMFhJOEJFSDY4cENQMjJ6elFK?=
 =?utf-8?B?SzJkd0pJejFDdndHWGxJK0l0Q2NuVS9RR0ZuankySmtHTGFKN0JDR3MwbS9P?=
 =?utf-8?B?enFlMjBkdFlMam9wRENkRnhzSjlNWGliU3A4K0VCUTE2ZXhpUnVKWXFGVFJB?=
 =?utf-8?B?b0Y2b2xqcVoycEl0d08rSUU0QkZZV0hZRTFUUk1jbTdZb05pWWNSZnRjanA5?=
 =?utf-8?B?YW96eTc0U0trZHN4T0pqZ05VRlZSMGJhMSs5WDBRbEphTlRralhmVWxja2Z6?=
 =?utf-8?B?RlR1OW5haEpFYU1aQVZtQ08wVWVYWWhJM0h0S1prRzBLUEVnUm56eVZ2QUlX?=
 =?utf-8?B?YzE2Q0wvTVhrRUtsdVZUdUNuZlExaitETncrcjRwZFdXREF1YUM3OEQ4bG1o?=
 =?utf-8?B?Wm8ybXBBRU5NZS90TzBMdDhpSmlVRVNkbUw0aUY2b3ZDajYyMTlzM3ZBYjZn?=
 =?utf-8?B?VktZUllDdUJ4TGFWV2NiRmlJQi9oZXNSU2d4ajA1aktNNUJLTERxUDBKRWY4?=
 =?utf-8?B?T2NlZFFMN3kwd2lTZlFXaFYzMWRIQ0VhTnhjT2owNHdNY2tXOXczSHhLUXBi?=
 =?utf-8?B?bzZtVm5UWk4yeCtQT09nUWs0ZjhXRnY4Sk83WUl5U3dzUHdkdHdOWm9SZlBo?=
 =?utf-8?B?VER6OFVLeE5FOGx3cXplSGZvbzRibjhXNlNIRTFTUFN1REEvT3c0eVJ6TEt1?=
 =?utf-8?B?YmN5QjdMZlVEazlEMnRRSGZETjJhTzQzcVVzdHVkeDRTVVdRRHVJWUJJR09i?=
 =?utf-8?B?S3J0QU9oaFJiTjZIbUdBUFBBV0JOK0M4RzRKSGFWZWdaa3JrSWZyRVVIbEJQ?=
 =?utf-8?B?eDF5Z2NHT3hSZCtGUU9sNXF0RDFZaCsrbFRSVE1nOHl1eWZMSW1xNUsxY3Nr?=
 =?utf-8?B?K2NwRDBNQjY4QkJPZ1NjY216V2ZwZFI2bTlkUGc1R0tNWnZZTUwwSWVVUHJR?=
 =?utf-8?B?OGVUaVdQUWhWbFpIY1ovNnJmUWRBTDN2WE5aVnpGc0ZLcFZoK0VsQ2Z2L0NF?=
 =?utf-8?B?ZFd6bGlzeVdFNHRSZno0ZDJTaWI3K2trQjJQMXIvc05LMEdtL2lZYTVSQy8v?=
 =?utf-8?B?SThIQ29yTXkrS213cG1zMWhEaEZrODhLNVUzQ0lxdEdSREl6djVUNFk4WmZI?=
 =?utf-8?B?QktvMXlXREtpVm9JQ3BRKzhFSWI5UEF4K2pMQVJIQ2tpYmtCRXV6d1BiSGZa?=
 =?utf-8?B?QXpnWFc5d1dGaTBSanR3bWRvVGEzRjMwN1VKOXVsZE1uMGdmWVNSWnZ1RHgz?=
 =?utf-8?B?dmtzRVE0aS9UVTJyNGtYOE54bGJnc2FnQkppaHh6S3ltY1NmT1hRMVdqc2RW?=
 =?utf-8?B?MTZ0dzdzUVhZbU4rMHIrbHk0elgvNitaUFBwbzI3QVIvOGpLRGVMNXBzQkQ0?=
 =?utf-8?B?YVlGeXJZSVJJMU0vYVl5YUN6MGJHVExaNEY2bG13SUNhTUg0UERkM2ZjRjBp?=
 =?utf-8?B?K0RBSFpicm9kVGZFY3lhYVBPdVp1MTA3YTRrc01pbG1qbGR5YTNmVmR2NXpm?=
 =?utf-8?B?d2ZXd2hNd2dXUUZqUXROcHZKdk5jcExWRVFScElxZmdmOThPNGZONG81eXQ1?=
 =?utf-8?B?SXBzWm1ndFB4MlkzdTVQUUl1eDVwcFZ4SVRZVllPYTVORkoyTXNXQnpGS0Fm?=
 =?utf-8?Q?8FbCQ64ePtJLhv+7TxVk/6hs+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6894EB1B13F6BB44AB516F8165ECC795@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55291396-a558-4c7b-1881-08dced94abf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 03:43:17.5396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3YVHO5IYmp19qWfq9D0B5Ll0TC+DAjihrt4GwNXJUJoXfRgkeAybF6hqvVp/Aqtmw3gHinxDLC3kb0IOmajqcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7235

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
DQo+ICtzdGF0aWMgaW50IG10a19jYW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9kZXZpY2UgKmNhbV9kZXY7DQo+ICsJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4g
KwlpbnQgcmV0Ow0KPiArCXVuc2lnbmVkIGludCBpOw0KPiArDQo+ICsJZGV2X2RiZyhkZXYsICJj
YW1zeXMgfCBzdGFydCAlc1xuIiwgX19mdW5jX18pOw0KPiArDQo+ICsJLyogaW5pdGlhbGl6ZSBz
dHJ1Y3R1cmUgKi8NCj4gKwljYW1fZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpjYW1f
ZGV2KSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFjYW1fZGV2KQ0KPiArCQlyZXR1cm4gLUVOT01F
TTsNCj4gKw0KPiArCWlmIChkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldiwgRE1BX0JJVF9N
QVNLKDM0KSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICIlczogTm8gc3VpdGFibGUgRE1BIGF2YWls
YWJsZVxuIiwgX19mdW5jX18pOw0KPiArCQlyZXR1cm4gLUVJTzsNCj4gKwl9DQo+ICsNCj4gKwlp
ZiAoIWRldi0+ZG1hX3Bhcm1zKSB7DQo+ICsJCWRldi0+ZG1hX3Bhcm1zID0NCj4gKwkJCWRldm1f
a3phbGxvYyhkZXYsIHNpemVvZigqZGV2LT5kbWFfcGFybXMpLCBHRlBfS0VSTkVMKTsNCj4gKwkJ
aWYgKCFkZXYtPmRtYV9wYXJtcykNCj4gKwkJCXJldHVybiAtRU5PTUVNOw0KPiArCX0NCj4gKw0K
PiArCWRtYV9zZXRfbWF4X3NlZ19zaXplKGRldiwgVUlOVF9NQVgpOw0KPiArDQo+ICsJcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gKwlpZiAo
IXJlcykgew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgbWVtXG4iKTsNCj4gKwkJ
cmV0dXJuIC1FTk9ERVY7DQo+ICsJfQ0KPiArDQo+ICsJY2FtX2Rldi0+YmFzZSA9IGRldm1faW9y
ZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQoNCkkgY2FuIG5vdCBmaW5kIGFueSB3aGVyZSB0byB3
cml0ZSByZWdpc3RlciBvZiB0aGlzIGRldmljZS4NCklmIHNvLCBJIHRoaW5rIHdlIG5lZWQgbm90
IHRvIHByb2JlIHRoaXMgZHJpdmVyLg0KVGhlIHJlc3Qgc29mdHdhcmUgY29udHJvbCBjYW4gYmUg
c2V0dXAgYnkgb3RoZXIgZHJpdmVyLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCWlmIChJU19FUlIo
Y2FtX2Rldi0+YmFzZSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gbWFwIHJlZ2lz
dGVyIGJhc2VcbiIpOw0KPiArCQlyZXR1cm4gUFRSX0VSUihjYW1fZGV2LT5iYXNlKTsNCj4gKwl9
DQo+ICsNCj4gKwljYW1fZGV2LT5kZXYgPSBkZXY7DQo+ICsJZGV2X3NldF9kcnZkYXRhKGRldiwg
Y2FtX2Rldik7DQo+ICsNCj4gKwljYW1fZGV2LT5jb21wb3Nlcl9jbnQgPSAwOw0KPiArCWNhbV9k
ZXYtPm51bV9zZW5pbmZfZGV2aWNlcyA9IDA7DQo+ICsNCj4gKwljYW1fZGV2LT5tYXhfc3RyZWFt
X251bSA9IE1US0NBTV9TVUJERVZfTUFYOw0KPiArCWNhbV9kZXYtPmN0eHMgPSBkZXZtX2tjYWxs
b2MoZGV2LCBjYW1fZGV2LT5tYXhfc3RyZWFtX251bSwNCj4gKwkJCQkgICAgIHNpemVvZigqY2Ft
X2Rldi0+Y3R4cyksIEdGUF9LRVJORUwpOw0KPiArCWlmICghY2FtX2Rldi0+Y3R4cykNCj4gKwkJ
cmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwljYW1fZGV2LT5zdHJlYW1pbmdfY3R4ID0gMDsNCj4g
Kwlmb3IgKGkgPSAwOyBpIDwgY2FtX2Rldi0+bWF4X3N0cmVhbV9udW07IGkrKykNCj4gKwkJbXRr
X2NhbV9jdHhfaW5pdChjYW1fZGV2LT5jdHhzICsgaSwgY2FtX2RldiwgaSk7DQo+ICsNCj4gKwlj
YW1fZGV2LT5ydW5uaW5nX2pvYl9jb3VudCA9IDA7DQo+ICsJc3Bpbl9sb2NrX2luaXQoJmNhbV9k
ZXYtPnBlbmRpbmdfam9iX2xvY2spOw0KPiArCXNwaW5fbG9ja19pbml0KCZjYW1fZGV2LT5ydW5u
aW5nX2pvYl9sb2NrKTsNCj4gKwlJTklUX0xJU1RfSEVBRCgmY2FtX2Rldi0+cGVuZGluZ19qb2Jf
bGlzdCk7DQo+ICsJSU5JVF9MSVNUX0hFQUQoJmNhbV9kZXYtPnJ1bm5pbmdfam9iX2xpc3QpOw0K
PiArDQo+ICsJY2FtX2Rldi0+ZG1hX3Byb2Nlc3NpbmdfY291bnQgPSAwOw0KPiArCXNwaW5fbG9j
a19pbml0KCZjYW1fZGV2LT5kbWFfcGVuZGluZ19sb2NrKTsNCj4gKwlzcGluX2xvY2tfaW5pdCgm
Y2FtX2Rldi0+ZG1hX3Byb2Nlc3NpbmdfbG9jayk7DQo+ICsJSU5JVF9MSVNUX0hFQUQoJmNhbV9k
ZXYtPmRtYV9wZW5kaW5nKTsNCj4gKwlJTklUX0xJU1RfSEVBRCgmY2FtX2Rldi0+ZG1hX3Byb2Nl
c3NpbmcpOw0KPiArDQo+ICsJbXV0ZXhfaW5pdCgmY2FtX2Rldi0+cXVldWVfbG9jayk7DQo+ICsN
Cj4gKwlwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiArDQo+ICsJcmV0ID0gbXRrX2NhbV9vZl9y
cHJvYyhjYW1fZGV2LCBwZGV2KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlnb3RvIGZhaWxfZGVzdHJv
eV9tdXRleDsNCj4gKw0KPiArCXJldCA9IHJlZ2lzdGVyX3N1Yl9kcml2ZXJzKGRldik7DQo+ICsJ
aWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWwgdG8gcmVnaXN0ZXJfc3ViX2RyaXZl
cnNcbiIpOw0KPiArCQlnb3RvIGZhaWxfZGVzdHJveV9tdXRleDsNCj4gKwl9DQo+ICsNCj4gKwkv
KiByZWdpc3RlciBtdGtfY2FtIGFzIGFsbCBpc3Agc3ViZGV2IGFzeW5jIHBhcmVudCAqLw0KPiAr
CWNhbV9kZXYtPm5vdGlmaWVyLm9wcyA9ICZtdGtfY2FtX2FzeW5jX25mX29wczsNCj4gKwl2NGwy
X2FzeW5jX25mX2luaXQoJmNhbV9kZXYtPm5vdGlmaWVyLCAmY2FtX2Rldi0+djRsMl9kZXYpOw0K
PiArCXJldCA9IG10a19jYW1fYXN5bmNfc3ViZGV2X2FkZChkZXYpOyAvKiB3YWl0IGFsbCBpc3Ag
c3ViIGRyaXZlcnMgKi8NCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiJXMgZmFp
bGVkIG10a19jYW1fYXN5bmNfc3ViZGV2X2FkZFxuIiwgX19mdW5jX18pOw0KPiArCQlnb3RvIGZh
aWxfdW5yZWdpc3Rlcl9zdWJfZHJpdmVyczsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSB2NGwyX2Fz
eW5jX25mX3JlZ2lzdGVyKCZjYW1fZGV2LT5ub3RpZmllcik7DQo+ICsJaWYgKHJldCkgew0KPiAr
CQlkZXZfZXJyKGRldiwgIiVzIGFzeW5jX25mX3JlZ2lzdGVyIHJldDolZFxuIiwgX19mdW5jX18s
IHJldCk7DQo+ICsJCXY0bDJfYXN5bmNfbmZfY2xlYW51cCgmY2FtX2Rldi0+bm90aWZpZXIpOw0K
PiArCQlnb3RvIGZhaWxfdW5yZWdpc3Rlcl9zdWJfZHJpdmVyczsNCj4gKwl9DQo+ICsNCj4gKwly
ZXQgPSBtdGtfY2FtX2RlYnVnX2ZzX2luaXQoY2FtX2Rldik7DQo+ICsJaWYgKHJldCA8IDApDQo+
ICsJCWdvdG8gZmFpbF91bnJlZ2lzdGVyX2FzeW5jX25mOw0KPiArDQo+ICsJZGV2X2luZm8oZGV2
LCAiY2Ftc3lzIHwgWyVzXSBzdWNjZXNzXG4iLCBfX2Z1bmNfXyk7DQo+ICsNCj4gKwlyZXR1cm4g
MDsNCj4gKw0KPiArZmFpbF91bnJlZ2lzdGVyX2FzeW5jX25mOg0KPiArCXY0bDJfYXN5bmNfbmZf
dW5yZWdpc3RlcigmY2FtX2Rldi0+bm90aWZpZXIpOw0KPiArDQo+ICtmYWlsX3VucmVnaXN0ZXJf
c3ViX2RyaXZlcnM6DQo+ICsJdW5yZWdpc3Rlcl9zdWJfZHJpdmVycyhkZXYpOw0KPiArDQo+ICtm
YWlsX2Rlc3Ryb3lfbXV0ZXg6DQo+ICsJbXV0ZXhfZGVzdHJveSgmY2FtX2Rldi0+cXVldWVfbG9j
ayk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo=

