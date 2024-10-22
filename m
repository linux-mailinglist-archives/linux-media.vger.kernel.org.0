Return-Path: <linux-media+bounces-20008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727F9A9866
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 07:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2554B1C23016
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 05:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAB6130E57;
	Tue, 22 Oct 2024 05:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mxw5HH7h";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SZspovFF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737FE225D6;
	Tue, 22 Oct 2024 05:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575067; cv=fail; b=Y0lWYBCmePsMCWubyTKNL1ghV/seI1nLbsXpwuKxOGKK0iDoYXbNI55WY+KF3ic4bXdAVoPEHzXyvQhwRiqmqJZ8k0LWz6O+TCRHZ0IfIA7TjRbzdpkkIJZcWd/YwGuYeWUWHABqmhDd7BMv3qkPMeaFAopXR15j8++O7uYvrlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575067; c=relaxed/simple;
	bh=XzvyhpdkoA1HzMAzdCvKqQVxYnaoxhqgWJT93p4HLn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=luEsS5g737CGOKmq0XDWrqa5lqTTldthrJ0/cj1qk/ytDCLU+3QyHVL6yhveljbnPjftykGOFc+OBdXC8DkMGyaSNABo8S57hnsVFCjPkTH39MJXFooeCGRjmqvvz6+yklNhWtBKToO7JZ6vQ1ttjNcCLVjyfNRCYKuHBcwfpvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mxw5HH7h; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SZspovFF; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d013dc00903611efb88477ffae1fc7a5-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XzvyhpdkoA1HzMAzdCvKqQVxYnaoxhqgWJT93p4HLn0=;
	b=mxw5HH7haHDdwEandJ2/kAgTLSLFxDXEZ/8dLtpA8xwCPQ/nTPglwc+igcZOIJC0c+51oOqSWH48QtytsnbFMbyS0qEc0vAqivK1jl3v0aUUQepOXtmXNHCK6t6eToUOkEeCl2PMAvZZ4WLkO5Wg3QuhpdTSiz4fPFyzjJ84/lY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f8a11ce8-22d5-42e9-8518-a6ca204e005f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:bb1e2c0d-1043-475c-b800-3262c01ea3e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d013dc00903611efb88477ffae1fc7a5-20241022
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2086981176; Tue, 22 Oct 2024 13:30:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 13:30:55 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 13:30:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJHy58gBF2/n1he25fumXHXVbmQAPy4jyL6ssvef4yZLMP+u+E/OX18+pbBnpRFaCf9IalJDSphbBGbNqggZB/1jWeKWcnBGbhDgr++TeL7l0zUKRxqTDMTwy8ZMxiiUzVZ4l/31ogVw7bbn43MOKFYzKTD68tsaoaQabBCB3tVAre0axHHu3p87HTqlRFI6ByGs5J/dmzi7fNvc+Va1KkMV7aA3rlFczepOVSXZ5VHHp78sTwOLcLroLTm2e/1jOyXHOqx9C8Se5EwREO9NMYIlA4kU7hjKehgW6ETFwx54/fnXNgBs0bhThqBNqKvGoLo+fnQ9rMUJpIH7N62f8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzvyhpdkoA1HzMAzdCvKqQVxYnaoxhqgWJT93p4HLn0=;
 b=HuZnAC84Da10hj1U6FAyCLv+2ZdZdbEyHcGnBFYk04+wY6Fa22xk0jHEmkVGRlo7VPYyuzLYiRC72b6NcY+xS83GUGhaDvjStFiLSVetu6LiGhnjVjAMpm55Pt0QPRmX+msH4k5IIsgn1v6KEYiPkiG48so8Sb/IpR2ZVS7zVvJg/OVUJILyzYL5GzojRUTztLR5y0kJnkbhlkmCtWNXgDFEDom4seQmE/gzy58wxrrVpzO6cWdUxb13MalfpkX+9lF1Hc3TnLFDogyBknYF5z4FEhoRUVzlh+PqEFWJJGUNBQefawFx3o9rP7KBOcbB1/r0Q6jAoHldAORn6U/VXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzvyhpdkoA1HzMAzdCvKqQVxYnaoxhqgWJT93p4HLn0=;
 b=SZspovFFSgWFfUFW2l27+9/FqmcLjdtiuK8kp9y8lrmHPUCnAqLpnFqQjdutbn7AXLjuJBEBs2xI2WcW5MIdXtjdMp7w8BKuFE6qH/OLgdcv024hbJH4+9TiGkPL07dT4xzE2hXwfpL5vQea3kKc9LrYkdxCf/19MOOOq2duijw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8753.apcprd03.prod.outlook.com (2603:1096:820:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 05:30:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 05:30:50 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKSUp+A
Date: Tue, 22 Oct 2024 05:30:49 +0000
Message-ID: <bcb28a623f51f077367e6c1f4382d1a43b6c2ee7.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8753:EE_
x-ms-office365-filtering-correlation-id: 7fe3d7f7-ea63-42d5-0b10-08dcf25ab05a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zkh6U1pSdGt6alRlQjJRSmkyem9rL3duVlpFbSt4SEVKZmYweTVOVmhtamdQ?=
 =?utf-8?B?ZkJjcVE4V0p1aGgwajNpcDZMeTA2SXRTWFNXQkRvVXJuQXFtekJCeTQ3V3Fv?=
 =?utf-8?B?dWdPN2x6akNMaW9pZ0ZidTJZNFZrR3F1K3JaQ1psQ0dHZXZpTzUxemNnN3Ji?=
 =?utf-8?B?cE9EbTdva2FJZi94V0kydFljS3lPSGY4YVl2Z3hLNWRlZHVVQzFVWmtidlIr?=
 =?utf-8?B?eXJBM3k4T3hmdDU3YkE5VWdmeUxjZE8xeGRaeEtEdlpNU25FVXBJZVUwQmpP?=
 =?utf-8?B?c0w2eVZRTStqZ25vYXgxSnJGWWk4djJPT3NFUmFhczhoeXc4TlptaW8vejBE?=
 =?utf-8?B?RFN6NklMNGNoK0dabTZVMXFXZlZ0ZGJWclFpQ2JDRy84TlFGNm9HcTVlenFm?=
 =?utf-8?B?UzZPMzlnZjFoNDhpWmtmK09ZYVFiRGNPZ0lLeTd1T29LTkFTVWk5bHJyVHNK?=
 =?utf-8?B?ZTBvcGl1L1c2QVBVb0ZVL0pzdXQwR2xlSHo5V2UwUkFoL285Tzc0WHhsK3lI?=
 =?utf-8?B?Y2NLeGpVTFVCbjVBbUJsZ0JRWHE1aXhWSFhNSXJMRXByR2haS0IraTNvakJm?=
 =?utf-8?B?ZUVxUzZaMGZ6UzZuTTY2b0FVRmQybk1tZFJNUVNTVnIvd3Nic2I3Vmt4YWVT?=
 =?utf-8?B?SE9WdmhZNUlPQTkyLy9adUN3R1VoNzUyRzFRWk10bnRkNm1Ka1lJUUcxYlYx?=
 =?utf-8?B?NlM2ckN0cUZMWXZKaG5HYjVQdmxocnRMVzNHY3ZDZmlBc09ic1I3N0xJaXhz?=
 =?utf-8?B?TXExempKdUczT0JvbWU2WGJ5a0t2QXFmVVRMRTNpRFpsNjBEbC9RRVJmZzlL?=
 =?utf-8?B?VEZtMGVqaEFhaU5CRXhDOHV5RURPUkx6L1F4QTVsSG5qalRHOUI1UkNvNUFh?=
 =?utf-8?B?d0RRMXFUam1LUE5NV1ppNGUwK3k5M3MrQWNKaXhUOVFFNHlWTytJL0NGZDVU?=
 =?utf-8?B?MDN2c0VERmRBNXlOVHUvT2RkalJ6U1NzUTNNVVczclYxVFNOSGo2UTJlemdV?=
 =?utf-8?B?NC9oaTJIK2ZXUnVnaGYyZmlOWTVDdnB2VG8vcnFUOTdldlVJc1ZBVTNCTXdN?=
 =?utf-8?B?Q0lka0drUHRXTGtKQnJtdGFva3dmMnc1cENFVUhhcFNEN2JzQXlDYkZBS200?=
 =?utf-8?B?eXhZMnlWYVE1Vjh0TGoxSnF2R0RVN2xCMjE3QjU5NkFpdVJUUHpvdEFKNVlI?=
 =?utf-8?B?T2swTHdtRlF5MC85SkZjOUNndm5MK3pGWVNQRGhDQU5aQkZHN3lsMGNZb2lS?=
 =?utf-8?B?U3Z1N0RwV0lFMmo3dE9kWWRWWU5RNmI5eFB0cnV0UE04T1dQdU9veXNEb2Yx?=
 =?utf-8?B?Rzd1ME9oWWZNM2NxUzhaSzJzc2gxZXcwWGJmTXNXUWxaZ1V6L1l2elZtNG1O?=
 =?utf-8?B?U1BJR1l3bUIwRCs0SURhVkM3Y3JzS2NhQmlhS1VQRkwxdGNFaG1xTVdtVXBG?=
 =?utf-8?B?UHkyUlh0Tkd6L21GRHQ1S0RTOU8xdHRlVDhzNjViaTF4SUdoeEdtTit5Q2R0?=
 =?utf-8?B?M1VNQkxnN1duUUlNSk9LYkF0Zi9JSS92QnhVeVBFWXdpT1QvNkk5T2d0MXl0?=
 =?utf-8?B?MDN2MnZCVy9ocEp1UXRHaktycXRncnByWklPSFpNSlVvT3VpbkpoSFBuMFNI?=
 =?utf-8?B?TlVDa21ySVc4SWdSMEZWQWtFaC9pNzVTUWNScmV5a2xYNUxaUzdIanN0TnQ1?=
 =?utf-8?B?YjFIRkZ4UVdtWi9DcEM1MHh2Uis1VTB1RDVjYXhVTWJxMTJHVE9abDgyU250?=
 =?utf-8?B?eDNtVXc4T0FUVjN0dVREZSs2QnBxVGJlNzk3MXRvbnRNcVkvQ2tMRzJ6Zy9m?=
 =?utf-8?Q?6TVMIayWOHuv39yxhTYn65j6pL+tGHQURTaYk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cC9aRHd6akJkd1U0K0IzM3JTdU5ialJTZ2NET1p6bDBJVUI3dlhtZEJDTjho?=
 =?utf-8?B?bHdoUHovWG53WEVpYWpUL3BXUDJYQ0VBVEhyd2pSbDB6OU1BbGhSSDFqdVNM?=
 =?utf-8?B?WEY5dnJzc043YlRrREgzNWhLWWhuK05ydWxBK1ltQUUvdUVYMHUrSjYxbnM5?=
 =?utf-8?B?azg1bnBiaGhkZkV0ajJuTWdEdThQNG5RanFDdDZnYVFudUxOQ1lrUzRTa2VE?=
 =?utf-8?B?MkJrVk16NVRRZVVqVXV5UTBRSmwwYWNtSVFuOGZCa1FoTXk4eitpTU5NVGhO?=
 =?utf-8?B?eVN6RXlrcmVpMGdQcU1BQUVoM2dTV01wVEFPSGM1Z0xCWWZOK0hPbzZsZTBm?=
 =?utf-8?B?QWk3a2RaODJWSzI2aFBGZEtOVHNqR2Z0UHUveERld3daQUVsb21MWHZOdTFD?=
 =?utf-8?B?TDEvcEErVFpFZEJ4dWozS1U3L3lOa3Rsc0dONW9tWjBPVTljMXFqN1NlYUhl?=
 =?utf-8?B?bURZSGVpeUtHaHVUYUpDTmVWWjd3NnBMZVo0SVVmbjRDYURJcC91a3grUito?=
 =?utf-8?B?empQQ1grK242TFM2aStNRk5lVTNkODZjNnhBbkZIbVlJY1loRlhHUEJuQXEx?=
 =?utf-8?B?SVNxM2w2YS8xSFdZOEoxSFZCS3htc2lPN2owSWdOMlloUWxNV01tN0t3MFBC?=
 =?utf-8?B?K09QNExpQ2ZpaHc1T3hJRkxTRUR5UUNvdHpmcXRmbGwxVGR3Slk4WWs5b2pu?=
 =?utf-8?B?WUJzZlUwZ0xZVEJsVWc1NXVRVVQxQUJ3ZjBqRURyYWVUN1FKUkQzL0JySUd1?=
 =?utf-8?B?SDdDdTVydXFpZXhtZVJwb29hTmlNK0NlNGVHU2hLOTY0cmh5empNUENSRFJW?=
 =?utf-8?B?dWJOQmdMU090ZEN2Wk0xSWJDKzRMWXJWRG1SOFhidUlrQ2k1ZUIyd1piWUc5?=
 =?utf-8?B?Y3dycCtmZTU0TC9QMlN2TXAzUFdjeDhXYnNQbWduY2N2alFvMEJXbCtIY0Rh?=
 =?utf-8?B?YXNTekpKUkE3aHEzNHpBRlFKZzFldDlyY044YWp3QmVORVVnMkh3VGpiRlJW?=
 =?utf-8?B?SkNrRnFEcXd3YVl3cTErbjN5VzR2cWhDUmcvbjRZQmlMbnVmWXFjei9VOExl?=
 =?utf-8?B?eHFXRHgzd1h1Y1ZqYXZxZ09WMHZ4MngwWGpQZUZ3N1c0NWZuYkNHaDlPN1FV?=
 =?utf-8?B?Rlp6bThDMHV0QVpwenhWTDJXcit6cSt0Y1Z5WDF3djNCU01LeVlCZldKcnpC?=
 =?utf-8?B?ZHNIcG9rTDBFOEZFWnZjOGFPR1lyUmFoZnp5RmNtODNoMEpQaVdoNUo5TXBG?=
 =?utf-8?B?RGx2SmhhamtYVlBsOXRoODI5UkxwWnpKZjJJN3dkcG9BSm1hQkFYTUJoRGVD?=
 =?utf-8?B?MWFNZ2tpTW1UY2h3bklua2ttcWhSSXFEM0g3dUNvRkxVNWRsUjZhTmUzb29O?=
 =?utf-8?B?bW9zZnFrL2VZYlIvUWM4YkNrM0RyVlh0ODNLOU83dEVCaW10ODRPT216SVdC?=
 =?utf-8?B?SHlwVmZZNzhOUmMySjBUTW9aM0l3b08vWnoraW8rTUhvVmdRemx0bk5HNTRY?=
 =?utf-8?B?dkxWS2JuM0x2VXI4bHpxQVVqS1BOTGorc3M2K2FlZHVvYTRTYjRkSzY5VDVR?=
 =?utf-8?B?eC96S1IwWkMyZnprc3h2S0Vlbk52dHdDb1JXZGZyUTNVMndkVWsxUlZxcFhm?=
 =?utf-8?B?UFZsc0pveG00Z1FmRmVEemladkZQNXY4RkJLZGM5eFNuRVV3QzRCRnNQc1pl?=
 =?utf-8?B?Sjd1Z1I2QjZHWlpUTFg0UXZabzdTenM2ek42NlVCZGdVaDMyM1llQm9sTDFt?=
 =?utf-8?B?em9rZGR3RzhwSDI1aGloUHJHOFhQZWVkYUhickgrVXZUaC9jQXVwS21STDJt?=
 =?utf-8?B?amU0TzJ0WHVxM1ZYc3J4cHdvTnlGQVhmR0VvczlvRnhtQld1VWF0RXZQMTgw?=
 =?utf-8?B?N2VJVmcrK1JQVUsvTTViaFV2NCthL2wydGE0UFY2dFl6S05YTHdDVmovanJS?=
 =?utf-8?B?d3ErRGViV3JNQndNdzJ4VmNNcVJ5R3JNeEFSSVZhaWV3ZlFQeGlhbXZqbXJS?=
 =?utf-8?B?UkROSTZ5U2xqaVczT1dtVFFSS2Q3UTZOMUc4RWtrNDRTTTdaZ1dTNkZkRjhi?=
 =?utf-8?B?TWpsUEVPTzlrMXFoNE9vQVlSMVNvNktvRndyckhZVmhHTzBqZCtTTExpRWdQ?=
 =?utf-8?B?QTVDaHZkK2pjY21XVWJVSmt0bkp4cmlJQUJ4RlhyK0VqY2wveTdiSStuU01S?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DD30710E459A042AC875BDBE7D735D0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe3d7f7-ea63-42d5-0b10-08dcf25ab05a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 05:30:49.9326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnVn8VusfmkBgB4SnBc2crw8PBkiE0azlxjyb07J7jem6lTPN4bCPLYzLNXLJy1o+XlFgbkMsh/BtLa63j2cmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8753

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
DQo+ICsgKiAgQSBVIFQgTyAgVyBIIEkgVCBFICBCIEEgTCBBIE4gQyBFDQo+ICsgKi8NCj4gKw0K
PiArLyogTWF4aW11bSBibG9ja3MgdGhhdCBNZWRpYVRlayBBV0Igc3VwcG9ydHMgKi8NCj4gKyNk
ZWZpbmUgTVRLX0NBTV9VQVBJX0FXQl9NQVhfTElHSFRfQVJFQV9OVU0gKDEwKQ0KPiArDQo+ICsv
Kg0KPiArICogIHN0cnVjdCBtdGtfY2FtX3VhcGlfYXdiX3BhcmFtIC0gcGFyYW1ldGVycyBmb3Ig
QVdCIGNvbmZpZ3VydGlvbg0KPiArICoNCj4gKyAqICBAc3RhdF9lbjogICAgICAgICAgICAgICAg
ICBBV0Igc3RhdCBlbmFibGUNCj4gKyAqICBAd2luZG93bnVtX3g6ICAgICAgICAgICAgICBOdW1i
ZXIgb2YgaG9yaXpvbnRhbCBBV0Igd2luZG93cw0KPiArICogIEB3aW5kb3dudW1feTogICAgICAg
ICAgICAgIE51bWJlciBvZiB2ZXJ0aWNhbCBBV0Igd2luZG93cw0KPiArICogIEBsb3d0aHJlc2hv
bGRfcjogICAgICAgICAgIExvdyB0aHJlc2hvbGQgb2YgUg0KPiArICogIEBsb3d0aHJlc2hvbGRf
ZzogICAgICAgICAgIExvdyB0aHJlc2hvbGQgb2YgRw0KPiArICogIEBsb3d0aHJlc2hvbGRfYjog
ICAgICAgICAgIExvdyB0aHJlc2hvbGQgb2YgQg0KPiArICogIEBoaWdodGhyZXNob2xkX3I6ICAg
ICAgICAgIEhpZ2ggdGhyZXNob2xkIG9mIFINCj4gKyAqICBAaGlnaHRocmVzaG9sZF9nOiAgICAg
ICAgICBIaWdoIHRocmVzaG9sZCBvZiBHDQo+ICsgKiAgQGhpZ2h0aHJlc2hvbGRfYjogICAgICAg
ICAgSGlnaCB0aHJlc2hvbGQgb2YgQg0KPiArICogIEBsaWdodHNyY19sb3d0aHJlc2hvbGRfcjog
IExvdyB0aHJlc2hvbGQgb2YgUiBmb3IgbGlnaHQgc291cmNlIGVzdGltYXRpb24NCj4gKyAqICBA
bGlnaHRzcmNfbG93dGhyZXNob2xkX2c6ICBMb3cgdGhyZXNob2xkIG9mIEcgZm9yIGxpZ2h0IHNv
dXJjZSBlc3RpbWF0aW9uDQo+ICsgKiAgQGxpZ2h0c3JjX2xvd3RocmVzaG9sZF9iOiAgTG93IHRo
cmVzaG9sZCBvZiBCIGZvciBsaWdodCBzb3VyY2UgZXN0aW1hdGlvbg0KPiArICogIEBsaWdodHNy
Y19oaWdodGhyZXNob2xkX3I6IEhpZ2ggdGhyZXNob2xkIG9mIFIgZm9yIGxpZ2h0IHNvdXJjZSBl
c3RpbWF0aW9uDQo+ICsgKiAgQGxpZ2h0c3JjX2hpZ2h0aHJlc2hvbGRfZzogSGlnaCB0aHJlc2hv
bGQgb2YgRyBmb3IgbGlnaHQgc291cmNlIGVzdGltYXRpb24NCj4gKyAqICBAbGlnaHRzcmNfaGln
aHRocmVzaG9sZF9iOiBIaWdoIHRocmVzaG9sZCBvZiBCIGZvciBsaWdodCBzb3VyY2UgZXN0aW1h
dGlvbg0KPiArICogIEBwcmVnYWlubGltaXRfcjogICAgICAgICAgIE1heGltdW0gbGltaXQgY2xp
cHBpbmcgZm9yIFIgY29sb3INCj4gKyAqICBAcHJlZ2FpbmxpbWl0X2c6ICAgICAgICAgICBNYXhp
bXVtIGxpbWl0IGNsaXBwaW5nIGZvciBHIGNvbG9yDQo+ICsgKiAgQHByZWdhaW5saW1pdF9iOiAg
ICAgICAgICAgTWF4aW11bSBsaW1pdCBjbGlwcGluZyBmb3IgQiBjb2xvcg0KPiArICogIEBwcmVn
YWluX3I6ICAgICAgICAgICAgICAgIHVuaXQgbW9kdWxlIGNvbXBlbnNhdGlvbiBnYWluIGZvciBS
IGNvbG9yDQo+ICsgKiAgQHByZWdhaW5fZzogICAgICAgICAgICAgICAgdW5pdCBtb2R1bGUgY29t
cGVuc2F0aW9uIGdhaW4gZm9yIEcgY29sb3INCj4gKyAqICBAcHJlZ2Fpbl9iOiAgICAgICAgICAg
ICAgICB1bml0IG1vZHVsZSBjb21wZW5zYXRpb24gZ2FpbiBmb3IgQiBjb2xvcg0KPiArICogIEB2
YWxpZF9kYXRhd2lkdGg6ICAgICAgICAgIHZhbGlkIGJpdHMgb2Ygc3RhdGlzdGljIGRhdGENCj4g
KyAqICBAaGRyX3N1cHBvcnRfZW46ICAgICAgICAgICBzdXBwb3J0IEhEUiBtb2RlDQo+ICsgKiAg
QHN0YXRfbW9kZTogICAgICAgICAgICAgICAgT3V0cHV0IGZvcm1hdCBzZWxlY3QgPDE+c3VtIG1v
ZGUgPDA+YXZlcmFnZSBtb2RlDQo+ICsgKiAgQGVycm9yX3JhdGlvOiAgICAgICAgICAgICAgUHJv
Z3JhbW1hYmxlIGVycm9yIHBpeGVsIGNvdW50IGJ5IEFXQiB3aW5kb3cgc2l6ZQ0KPiArICogICAg
ICAgICAgICAgIChiYXNlIDogMjU2KQ0KPiArICogIEBhd2J4dl93aW5fcjogICAgICAgICAgICAg
IGxpZ2h0IGFyZWEgb2YgcmlnaHQgYm91bmQsIHRoZSBzaXplIGlzIGRlZmluZWQgaW4NCj4gKyAq
ICAgICAgICAgICAgICBNVEtfQ0FNX1VBUElfQVdCX01BWF9MSUdIVF9BUkVBX05VTQ0KPiArICog
IEBhd2J4dl93aW5fbDogICAgICAgICAgICAgIGxpZ2h0IGFyZWEgb2YgbGVmdCBib3VuZCB0aGUg
c2l6ZSBpcyBkZWZpbmVkIGluDQo+ICsgKiAgICAgICAgICAgICAgTVRLX0NBTV9VQVBJX0FXQl9N
QVhfTElHSFRfQVJFQV9OVU0NCj4gKyAqICBAYXdieHZfd2luX2Q6ICAgICAgICAgICAgICBsaWdo
dCBhcmVhIG9mIGxvd2VyIGJvdW5kIHRoZSBzaXplIGlzIGRlZmluZWQgaW4NCj4gKyAqICAgICAg
ICAgICAgICBNVEtfQ0FNX1VBUElfQVdCX01BWF9MSUdIVF9BUkVBX05VTQ0KPiArICogIEBhd2J4
dl93aW5fdTogICAgICAgICAgICAgIGxpZ2h0IGFyZWEgb2YgdXBwZXIgYm91bmQgdGhlIHNpemUg
aXMgZGVmaW5lZCBpbg0KPiArICogICAgICAgICAgICAgIE1US19DQU1fVUFQSV9BV0JfTUFYX0xJ
R0hUX0FSRUFfTlVNDQo+ICsgKiAgQHByZWdhaW4yX3I6ICAgICAgICAgICAgICAgd2hpdGUgYmFs
YW5jZSBnYWluIG9mIFIgY29sb3INCj4gKyAqICBAcHJlZ2FpbjJfZzogICAgICAgICAgICAgICB3
aGl0ZSBiYWxhbmNlIGdhaW4gb2YgRyBjb2xvcg0KPiArICogIEBwcmVnYWluMl9iOiAgICAgICAg
ICAgICAgIHdoaXRlIGJhbGFuY2UgZ2FpbiBvZiBCIGNvbG9yDQo+ICsgKi8NCj4gK3N0cnVjdCBt
dGtfY2FtX3VhcGlfYXdiX3BhcmFtIHsNCj4gKwl1MzIgc3RhdF9lbjsNCj4gKwl1MzIgd2luZG93
bnVtX3g7DQoNCndpbmRvd251bV94IGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMs
DQpDSw0KDQo+ICsJdTMyIHdpbmRvd251bV95Ow0KPiArCXUzMiBsb3d0aHJlc2hvbGRfcjsNCj4g
Kwl1MzIgbG93dGhyZXNob2xkX2c7DQo+ICsJdTMyIGxvd3RocmVzaG9sZF9iOw0KPiArCXUzMiBo
aWdodGhyZXNob2xkX3I7DQo+ICsJdTMyIGhpZ2h0aHJlc2hvbGRfZzsNCj4gKwl1MzIgaGlnaHRo
cmVzaG9sZF9iOw0KPiArCXUzMiBsaWdodHNyY19sb3d0aHJlc2hvbGRfcjsNCj4gKwl1MzIgbGln
aHRzcmNfbG93dGhyZXNob2xkX2c7DQo+ICsJdTMyIGxpZ2h0c3JjX2xvd3RocmVzaG9sZF9iOw0K
PiArCXUzMiBsaWdodHNyY19oaWdodGhyZXNob2xkX3I7DQo+ICsJdTMyIGxpZ2h0c3JjX2hpZ2h0
aHJlc2hvbGRfZzsNCj4gKwl1MzIgbGlnaHRzcmNfaGlnaHRocmVzaG9sZF9iOw0KPiArCXUzMiBw
cmVnYWlubGltaXRfcjsNCj4gKwl1MzIgcHJlZ2FpbmxpbWl0X2c7DQo+ICsJdTMyIHByZWdhaW5s
aW1pdF9iOw0KPiArCXUzMiBwcmVnYWluX3I7DQo+ICsJdTMyIHByZWdhaW5fZzsNCj4gKwl1MzIg
cHJlZ2Fpbl9iOw0KPiArCXUzMiB2YWxpZF9kYXRhd2lkdGg7DQo+ICsJdTMyIGhkcl9zdXBwb3J0
X2VuOw0KPiArCXUzMiBzdGF0X21vZGU7DQo+ICsJdTMyIGZvcm1hdF9zaGlmdDsNCj4gKwl1MzIg
ZXJyb3JfcmF0aW87DQo+ICsJdTMyIHBvc3RnYWluX3I7DQo+ICsJdTMyIHBvc3RnYWluX2c7DQo+
ICsJdTMyIHBvc3RnYWluX2I7DQo+ICsJdTMyIHBvc3RnYWluMl9oaV9yOw0KPiArCXUzMiBwb3N0
Z2FpbjJfaGlfZzsNCj4gKwl1MzIgcG9zdGdhaW4yX2hpX2I7DQo+ICsJdTMyIHBvc3RnYWluMl9t
ZWRfcjsNCj4gKwl1MzIgcG9zdGdhaW4yX21lZF9nOw0KPiArCXUzMiBwb3N0Z2FpbjJfbWVkX2I7
DQo+ICsJdTMyIHBvc3RnYWluMl9sb3dfcjsNCj4gKwl1MzIgcG9zdGdhaW4yX2xvd19nOw0KPiAr
CXUzMiBwb3N0Z2FpbjJfbG93X2I7DQo+ICsJczMyIGF3Ynh2X3dpbl9yW01US19DQU1fVUFQSV9B
V0JfTUFYX0xJR0hUX0FSRUFfTlVNXTsNCj4gKwlzMzIgYXdieHZfd2luX2xbTVRLX0NBTV9VQVBJ
X0FXQl9NQVhfTElHSFRfQVJFQV9OVU1dOw0KPiArCXMzMiBhd2J4dl93aW5fZFtNVEtfQ0FNX1VB
UElfQVdCX01BWF9MSUdIVF9BUkVBX05VTV07DQo+ICsJczMyIGF3Ynh2X3dpbl91W01US19DQU1f
VUFQSV9BV0JfTUFYX0xJR0hUX0FSRUFfTlVNXTsNCj4gKwl1MzIgY3NjX2NjbVs5XTsNCj4gKwl1
MzIgYWNjOw0KPiArCXUzMiBtZWRfcmVnaW9uWzRdOw0KPiArCXUzMiBsb3dfcmVnaW9uWzRdOw0K
PiArCXUzMiBwcmVnYWluMl9yOw0KPiArCXUzMiBwcmVnYWluMl9nOw0KPiArCXUzMiBwcmVnYWlu
Ml9iOw0KPiArfSBfX3BhY2tlZDsNCj4gKw0K

