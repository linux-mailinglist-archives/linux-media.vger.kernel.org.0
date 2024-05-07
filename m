Return-Path: <linux-media+bounces-10958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BF8BD97C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 04:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40991F21C2E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06E93FBB0;
	Tue,  7 May 2024 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Io0IGBsQ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="f/2+TEma"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9F3FB9F;
	Tue,  7 May 2024 02:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715049806; cv=fail; b=OAsQuKneJAgPViNSJrLpoJ6hyNCJDZv7DiVQhDpFu0USNLKYsRYrsAyzHEgASKXWM2hX/AxDBGuzY30fhK8GcEjYK9WyF+VjrafzW0kQnD+BztMoZMrvk54iOMH1v+DY6rG0TOIzM/k7/2vxzZLyOEWyTqMpunj017zceHcT14A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715049806; c=relaxed/simple;
	bh=FViULvA1drPZIWnLtUWESHO7gtZAw7ZjAdG5UTC0Vf4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d9uvrkYZJWFOerZfhSCl/B9q5svF0BH4OxkmzxWDmoVVl49ILoHxbsQ/WjPa3qS9IQ9I+oAYUD6RbMusx0s5J4FkaHFr4W2LDiWc5N3eGNJepYnoTXuUUCxh7+6xgGuPNZs4L3egT4hBLmkvo5PXgjFOQQRidGvHicunj47Ovhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Io0IGBsQ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=f/2+TEma; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8fa5972a0c1b11efb92737409a0e9459-20240507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=FViULvA1drPZIWnLtUWESHO7gtZAw7ZjAdG5UTC0Vf4=;
	b=Io0IGBsQFRhgFdEu4tVEWztrY4ljcUJF+YDxLX1nJj9CVGr2vEyjWnjq9r5fMxCyEikQIRM8uLghtgCqFziFFRlptyDOzN7ebxo181VgTU800lvTEOQeIgOiD4Z0Gr3FKxfQmbzNxo3ACrixbC6+Etez+07YeHFZmSnLnGvCm0U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:f4c029fd-da3f-467c-9cc2-1c286f51afd4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:cab96e92-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8fa5972a0c1b11efb92737409a0e9459-20240507
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2080105584; Tue, 07 May 2024 10:43:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 May 2024 10:43:17 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 May 2024 10:43:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDF+Cv2gYOwEO2/I5Qi688Rfkfsk5pImHnzN5Z2qtQZ33/Tg9sw27Iunj7IKwpAdAn1kNgVgGjI01xs3cX9XSw/rYODZ4U1SJhFuZ/C/U/a6A5ORusq8D0VvrI98WoBKUwc+KXImCqMldu7vME8Zlt54tWYXa4DECyktm5YLdgA8Hs5uG0rE/DCabqpuVRoR4JLXuqornF1Nm0T1bNMOc3uj47HjAfIyPGb1Jiyh/5KgOXkl3ECvPjt0o7Ee9/C9E6HAHanKwyQnTtSoI2a/GF8eNZE+9gNUqTtBkHr6I5cDBYDuvh3nca759gspx93b63zee5HBgvv7IzMTMz8UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FViULvA1drPZIWnLtUWESHO7gtZAw7ZjAdG5UTC0Vf4=;
 b=eanVh+todyCK0aT5A82d0hBsiq/7Wd6vWYAVqKDJdxHzGI1ln9Bgay5mt90Oeunyof2Z6nkMWqcSfMNyXadOnuhv6uW5MlPA1WR8MpIOc+w6GqarxfY7M2G6cWRXfyOqQ+ls8PHHdWtmULBNXBs0V8Q8FJFl5EDwvGk3CMmT/zs25+MngIowHx/0YzsXEQzmNJ7UO0vHmAAsg4S9iSL9S2VfrmrwJMy8pcxEk0FZeANlEPwtkgshSIYLTmPCwcysu6QZVbvGthIbDw32Yw2gfqy9sbLlm9IxmomNElwFzD3xsye8cErYxDO7+3l+C+jcSSiUD0iKS2Z9qgMeSwqYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FViULvA1drPZIWnLtUWESHO7gtZAw7ZjAdG5UTC0Vf4=;
 b=f/2+TEmaA+NRj7it5c/vM6CE6fZJuNnQP+7uZg7f+0LXEXoIksnM9O1SlBQ7iEHbhnthvC7MHuvLwYZ85r0lhIAxXctl7QIs+YVyRQXQOLLvHM0eZrZS7ejqyUl+RBzCXB+2OFwtZwzjoQDNK2+eEnFKgMa4DDZprfv+9MQryn0=
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com (2603:1096:400:53::7)
 by JH0PR03MB8256.apcprd03.prod.outlook.com (2603:1096:990:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 02:43:11 +0000
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::b6ef:29c8:491d:5221]) by TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::b6ef:29c8:491d:5221%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 02:43:11 +0000
From: =?utf-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "heiko@sntech.de" <heiko@sntech.de>, "gerald.loacker@wolfvision.net"
	<gerald.loacker@wolfvision.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
	<shengnan.wang@mediatek.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	=?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?= <Yaya.Chang@mediatek.com>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "10572168@qq.com"
	<10572168@qq.com>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "macromorgan@hotmail.com"
	<macromorgan@hotmail.com>
Subject: Re: [PATCH v8 0/2] media: i2c: Add support for GC08A3 sensor
Thread-Topic: [PATCH v8 0/2] media: i2c: Add support for GC08A3 sensor
Thread-Index: AQHafMtOg2iRrQtxXkCE7TFIQJ5FPLGLVwEA
Date: Tue, 7 May 2024 02:43:11 +0000
Message-ID: <7fbc367f3c3c00afe148fbf6c66325915ded0ccf.camel@mediatek.com>
References: <20240323023851.5503-1-zhi.mao@mediatek.com>
In-Reply-To: <20240323023851.5503-1-zhi.mao@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5566:EE_|JH0PR03MB8256:EE_
x-ms-office365-filtering-correlation-id: 7eeaa0cb-d145-4e71-e8a4-08dc6e3f6f76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VFpDTC95a25LNk1PV3lEbWM2VUhJekJFOVQwaHpudFNCSy9uYlh5b0hNWm5D?=
 =?utf-8?B?Qmo4a0l1RjJudnNvUmRYWm5USGRRbldKTEVOelcvYlhGaHlMaFVvSnVPZWZt?=
 =?utf-8?B?a2Y5VTEycmlPZ0VzbVY3MG81ZU1sUS82UnY0bXlGVFF2ZjNxMzJsbUpZbkVu?=
 =?utf-8?B?NmxGbHpPRjFXOGRhcTVoSWhOSGFrWThWMGE4WUR0dkdzZ3BwVlJMd3lRcldt?=
 =?utf-8?B?NjRoVGFVaGZJM2xLYW13RXhRcXRJQ2FKWjMrV3ZUanRMaVVLWVFBZ2MyL1Vu?=
 =?utf-8?B?UElzS29ZTWcrU1hiMTNYVGZad2luWHJRRHpKblNXemZFSVFTUGhuL3Jwc1lk?=
 =?utf-8?B?YWxwdm5wNUp1T2hFS2paYkp4cnZETVk4bUErVEN4WjZianFZQmROaUNieDRq?=
 =?utf-8?B?M3RaU3lkY285ZVVXcUZGaElIamlJSGhCblhmRUgybGZEczlyaE9VN3V3aFJ0?=
 =?utf-8?B?Nms0Nk5yMmQrbjR4WWR1TXViS0M0elY0N0hFaEY1N3RzTHVMWU1MSUpvalR3?=
 =?utf-8?B?OE16S2dleUVYWHRSaUJUNmpnZk9GcUlsNVczVmMwNm9nVWUyb05kNVZNaWwr?=
 =?utf-8?B?eEcyTWpESGRpNTU0OUJjSldZbHpXelVGL1UxMzUvNnZtZlZwWjdQS3MrOGFG?=
 =?utf-8?B?bEl2T255L1pVWmdNQU9UajgyaFFnWlZnWStvU241cGNSWmF6QlRPMTFWWUJ2?=
 =?utf-8?B?YTZqYzhVSUxsbEZ0aVYyMG42NytLVmxCR1ErNlpUbnJoOGM5Q2kzYjdyeWRr?=
 =?utf-8?B?NEdTa3JCUnBkbzdObnhESHJiTkRDZmxuZ3JBckVCSjNaOVptcFQ4U2tCMEhq?=
 =?utf-8?B?OEZ6Mi9JbEpnalcvMXRTM0pCbGJqTVVidVBFRWtBWU1aaS9rRm4xRzIvVmhF?=
 =?utf-8?B?NXJ1RStWMXBPemdxQW1kRy9qVC9pRWpqVmNGalh6aXhyMnF2ZkV1TmxHTjBi?=
 =?utf-8?B?OXgxTGlHd0g3K2kzQ200M3h6VFJaOFZadFo2Z1VMaU5ZM3lqTmJ4eG5Ma3RD?=
 =?utf-8?B?Z0tNZWh5WGg3Wi9iVWpIMnZ6eERtK2tkejNRTzhGamJ4VXVENG0weDF1WnBH?=
 =?utf-8?B?eGVqemJ0eUVucGhQUVMrSWtmTnc3bWdBTEZzdGpseE9NZ0Q1SS9kS2tLd2p3?=
 =?utf-8?B?dUVHMzJFa3Z4NVdoTUNwdm50QUk4Y050RkhMMjRkVXhTL3RkdEVtK1NuUkVy?=
 =?utf-8?B?Q1ZvY0pJdEJJcEhIUyttUXlOKzJzeFdhQ21TQW03c2l4b2JrZEhzL2U2SzU0?=
 =?utf-8?B?OVlTR2dxSFJ1WWVFSDF1VmhoUUVXQVBaTWxUYXZxcG1BbU5FYml3ZXZ0WVVp?=
 =?utf-8?B?RURKWVg5VGw3dmQ0eDVnSXpKUEhINDRMenVsa1pRNFI2NEg3YnJ2NUpTNTNv?=
 =?utf-8?B?YlJxUnAyM2tpemEvRVJJWkJaMDJ3Yng0R2h0Y1pDUE85SjMvOFFDVnZ5YjVE?=
 =?utf-8?B?UUhVNlBPejduaEZpYy80SmU4R3dPRWtQaDhMVC9zSllXTHY0M2Z6cmx0bUtN?=
 =?utf-8?B?d1B5NjBTUVRHL2FSdEIxZDZCdDZCbTJ4Zkt4YWs5S29HZzljbVQ0QWt4Z2NB?=
 =?utf-8?B?Zk5kWXJEbzRURXNnK1dyb3VDTFNRVjlCV2NzamZRYXJYK1dqeGxKZEJNU1Z0?=
 =?utf-8?B?L1RlVm90SnJEWmJYVmo4bUEvZlNzL1J2MlRzN3k0SUlMS2J6ZjE5bldUQ1Na?=
 =?utf-8?B?Vm16aFk1TDBxWmVjeFAzbm42WG5TU2NoZmV4VXVJSUw0Umw1N1hMTUtCc1RR?=
 =?utf-8?Q?1CWmyJ1kfG6OATN6+o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5566.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blE5b09yQzJFeXpsYlYxSkliN3YrZnV5VFFzRTJiU2xpME12enhvelpxQlN1?=
 =?utf-8?B?c0NxSlV0ZlZFcm02SW5hMWRkQXNCWWRNWHlaWDdqaXF0bGJiSnBuZkc4T1ZS?=
 =?utf-8?B?cWQ2MW9MYjFCQW53b3RxdUNJWWZxd2xrTFRqdjFoSG40eWxxWEwyTjRBWGFO?=
 =?utf-8?B?NFkyMWJoWnN0WFd0MEZsQXhwcFpsUzJPUDJMRVRPRmJuZmhyMlJiSXJVaCtI?=
 =?utf-8?B?NUtQbUVOMXVwdEY1aWdjWVRCSjk4MERMZTlOZi9XOVBBVXN2bXFUVVJqc2dV?=
 =?utf-8?B?TzFUSlZKVFFMTm14KzZFRTg3Q0RsOXduTUJBZ1lEQ1l0RXhTUTR4YjdZS041?=
 =?utf-8?B?RGpjQWdWYkE2TVRLWDY4VDhGZ2g3NkFBQ0NHeGJwRTQwUFBDSktjcStJenRh?=
 =?utf-8?B?S1RxdDgrNFdYbDFZblFTeXhKblVPdFJuQTd3NWplN3FPYlhBSXNoY2dPZHhG?=
 =?utf-8?B?alZlWVQyVmE4Vko2WEtheVJYYXhaYXFqdzhJL2hKVXJSVk9XVTYzeUp4RUl6?=
 =?utf-8?B?WjdNZWlmMDRSUkdDQlBzNmhJT09lNjBPUWZrVzdsbGpyQThyRFdRMWdRU0pT?=
 =?utf-8?B?NUtHS1VkMDBBQmRncW9xUzR1RDg5RVpMT0ZTVGY2ZFR6anpJMzI1c0JKQ1dp?=
 =?utf-8?B?TVNPMlR2QnIySFlxTTRiL3hPR09JbUxqeEFRQ2dnd0s0eU4zTkh1a1FscHhn?=
 =?utf-8?B?YnAwUG1HcEVPRFVNUDMxOGRBd1BSamYyclNNM1BvbGRDbWpUZUREYXFhMlJs?=
 =?utf-8?B?eUFmNzJ1aEE0TWZvTzJCYXhWOE5VNHE4emU3S1lnR2pKWHFPTkNWQU1yclFT?=
 =?utf-8?B?TmhjbnpvQW15LzdXTCt3VUhJUmZjeVgyWitTWWZJcVBKSmFDQlFFRTkyTjZJ?=
 =?utf-8?B?SkVvV25LT3NmaUhSNjRFTVZNUTVxWkZDQTdKTDJpSUpzWURXVVhQaWtRWmR4?=
 =?utf-8?B?ZG5UOUZVd0pLODg4cnRnQVZsWWFrZldiemtSREVsUktsUGUrQ1NIVURrR1ZJ?=
 =?utf-8?B?dnFOeHdZaGdYSHY4a0NJZk1zdTZzR2xlQVl2UXJoWTlhRS9wZGFkS1JUa2tL?=
 =?utf-8?B?SkR3Z3BOdzhwS2x6UXdDcHQ4bjRCc3hmVURIN0tnM0pIdlJsMVJFYmxjb2xt?=
 =?utf-8?B?Tk9Jc2h6OEtUS3RyR21YT2lvcWxkTXZOZ01SKzVJZVdNWlpkbWZhYThsS2J4?=
 =?utf-8?B?bjgrSG9FNzEwMFdkNGRyL0tmbllrQ29rSmh3Y1I5d3JCTVZVL3FGc0RYN0Fi?=
 =?utf-8?B?SlQrMDI4MWxLcFhkNkJ0L3o2N0ZxR1RQemlSaXN3OTRsT3gzS1dqa0NjdWho?=
 =?utf-8?B?T3kxdnlKbk1zc295bjZ6NmZaNWxMUno1bVE5TXpZb2lLOUhCN2YrclFZVUh0?=
 =?utf-8?B?aWdQVis5dklqOEcvRjZoMkd5OVpjMVl6czR1NmY5WE5lUjZrb0lSOTZ0MENB?=
 =?utf-8?B?b29yK1h6dk52bFlJMXJFQU9mVENBeUo4TUNNdENuRU1IMWNmZU9tSldzQXRh?=
 =?utf-8?B?V0N0LzhQa1QzV0crTlBvRkl6MXhnVTl4dUlPaThLS0t4TGZobzNneTM1SmF5?=
 =?utf-8?B?N2xJNDVUNW04L3RvUVhjbld5aGRUcWQyNThyQy9hWjl3bExkWng0Z29KM090?=
 =?utf-8?B?elVuVERHQ08rcWFuVFVoV0ExeitYWnRZL0VxT05OcWRGSlh1WERwWnkySi9r?=
 =?utf-8?B?bjJ2N1QxZG9Kcll5WEY5MnVxNnlDYVhoSGREd0JwSFBRdThJUlhmbFVZS2Qw?=
 =?utf-8?B?TEVhenFZUnkrTUdKNEpqQjI2YTRBanJUUi9lTnE0c1lZOGZUUWpzbXBzYzhv?=
 =?utf-8?B?ekRvVS9NRHlkNVBENzZOUlgxOUcxa2pWV0pDUitSQjVRV2lMM0NYRUtoVHJY?=
 =?utf-8?B?cXlhN1g1R2s5dkdmUFJGVmhLTEdxaTEwVVp0N1hJRUJmb2QzMUVUQWVDUkcz?=
 =?utf-8?B?SHpleFhZTTlhcVJuVEJ4cHp5Rm9MNkdyQkJwSWlMdWdrdEVBN1pyd3Npdi80?=
 =?utf-8?B?eTMxb05zbzFlTTJKalpwOXg0YkVRSkVnSS81a1p4UDZUR0hFdnJBVERzMUdO?=
 =?utf-8?B?NXJ4bm03OGxDTDJQYzV6ak8wZkNjb2UrQlZia2o4cUNueE1RblQ4K2lRL0c2?=
 =?utf-8?B?ZmRZYUxJdHh1UFNiNkJ2NWo2NFZDem1FUElOdEdvU1dobFA0ZjJnaUpnNUxj?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA60B112E19B104785B00CD14040914C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5566.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeaa0cb-d145-4e71-e8a4-08dc6e3f6f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 02:43:11.1798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcEhrW0eNH+c9eBjlh9jQ+/MvqGnl9BIheh7/FlMiztVQhG24mlpxQWlO7+oPiqTBS++Dt9TCE6tgCW4SB8zfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8256

cGluZy4uLg0KDQpPbiBTYXQsIDIwMjQtMDMtMjMgYXQgMTA6MzggKzA4MDAsIFpoaSBNYW8gd3Jv
dGU6DQo+IFRoaXMgc2VyaWVzIGFkZHMgWUFNTCBEVCBiaW5kaW5nIGFuZCBWNEwyIHN1Yi1kZXZp
Y2UgZHJpdmVyIGZvcg0KPiBHYWxheHljb3JlJ3MNCj4gR0MwOEEzIDgtbWVnYXBpeGVsIDEwLWJp
dCBSQVcgQ01PUyAxLzQiIHNlbnNvciwgd2l0aCBhbiBNSVBJIENTSS0yDQo+IGltYWdlIGRhdGEN
Cj4gaW50ZXJmYWNlIGFuZCB0aGUgSTJDIGNvbnRyb2wgYnVzLg0KPiANCj4gVGhlIGRyaXZlciBp
cyBpbXBsZW1lbnRlZCB3aXRoIFY0TDIgZnJhbWV3b3JrLg0KPiAgLSBBc3luYyByZWdpc3RlcmVk
IGFzIGEgVjRMMiBzdWItZGV2aWNlLg0KPiAgLSBBcyB0aGUgZmlyc3QgY29tcG9uZW50IG9mIGNh
bWVyYSBzeXN0ZW0gaW5jbHVkaW5nIFNlbmluZiwgSVNQDQo+IHBpcGVsaW5lLg0KPiAgLSBBIG1l
ZGlhIGVudGl0eSB0aGF0IHByb3ZpZGVzIG9uZSBzb3VyY2UgcGFkIGluIGNvbW1vbi4NCj4gIC0g
VXNlZCBpbiBjYW1lcmEgZmVhdHVyZXMgb24gQ2hyb21lT1MgYXBwbGljYXRpb24uDQo+IA0KPiBB
bHNvIHRoaXMgZHJpdmVyIHN1cHBvcnRzIGZvbGxvd2luZyBmZWF0dXJlczoNCj4gIC0gbWFudWFs
IGV4cG9zdXJlIGFuZCBhbmFsb2cgZ2FpbiBjb250cm9sIHN1cHBvcnQNCj4gIC0gdmVydGljYWwg
YmxhbmtpbmcgY29udHJvbCBzdXBwb3J0DQo+ICAtIHRlc3QgcGF0dGVybiBzdXBwb3J0DQo+ICAt
IG1lZGlhIGNvbnRyb2xsZXIgc3VwcG9ydA0KPiAgLSBydW50aW1lIFBNIHN1cHBvcnQNCj4gIC0g
c3VwcG9ydCByZXNvbHV0aW9uOiAzMjY0eDI0NDhAMzBmcHMsIDE5MjB4MTA4MEA2MGZwcw0KPiAN
Cj4gUHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5kIGhlcmU6
DQo+IHY3OiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyNDAzMDMw
MjI2MDkuMjYyNjMtMS16aGkubWFvQG1lZGlhdGVrLmNvbS8NCj4gdjY6IA0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDI0MDIyNzAxMzIyMS4yMTUxMi0xLXpoaS5tYW9A
bWVkaWF0ZWsuY29tLw0KPiB2NTogDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1l
ZGlhLzIwMjQwMjIwMDEyNTQwLjEwNjA3LTEtemhpLm1hb0BtZWRpYXRlay5jb20vDQo+IHY0OiAN
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyNDAyMDQwNjE1MzguMjEw
NS0xLXpoaS5tYW9AbWVkaWF0ZWsuY29tLw0KPiB2MzogDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW1lZGlhLzIwMjQwMTA5MDIyNzE1LjMwMjc4LTEtemhpLm1hb0BtZWRpYXRlay5j
b20vDQo+IHYyOiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMzEy
MDcwNTIwMTYuMjU5NTQtMS16aGkubWFvQG1lZGlhdGVrLmNvbS8NCj4gdjE6IA0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIzMTEyMzExNTEwNC4zMjA5NC0xLXpoaS5t
YW9AbWVkaWF0ZWsuY29tLw0KPiANCj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gbGludXgtbmV4
dCwgdGFnOiBuZXh0LTIwMjQwMzIzDQo+IENoYW5nZXMgaW4gdjg6DQo+IC0gZ2MwOGEzIHNlbnNv
ciBkcml2ZXI6DQo+IC0tIHVzZSBmdW5jdGlvbjogcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKCkN
Cj4gDQo+IFRoYW5rcw0KPiANCj4gWmhpIE1hbyAoMik6DQo+ICAgbWVkaWE6IGR0LWJpbmRpbmdz
OiBpMmM6IGFkZCBHYWxheHlDb3JlIEdDMDhBMyBpbWFnZSBzZW5zb3INCj4gICBtZWRpYTogaTJj
OiBBZGQgR0MwOEEzIGltYWdlIHNlbnNvciBkcml2ZXINCj4gDQo+ICAuLi4vYmluZGluZ3MvbWVk
aWEvaTJjL2dhbGF4eWNvcmUsZ2MwOGEzLnlhbWwgfCAgMTEyICsrDQo+ICBkcml2ZXJzL21lZGlh
L2kyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDEwICsNCj4gIGRyaXZlcnMvbWVk
aWEvaTJjL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiAgZHJpdmVycy9t
ZWRpYS9pMmMvZ2MwOGEzLmMgICAgICAgICAgICAgICAgICAgIHwgMTMzOQ0KPiArKysrKysrKysr
KysrKysrKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNDYyIGluc2VydGlvbnMoKykNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
aTJjL2dhbGF4eWNvcmUsZ2MwOGEzLnlhbWwNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21lZGlhL2kyYy9nYzA4YTMuYw0KPiANCg==

