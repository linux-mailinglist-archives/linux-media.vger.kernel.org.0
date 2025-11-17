Return-Path: <linux-media+bounces-47190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B67C627E9
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 07:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973953B3693
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 06:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764192874E0;
	Mon, 17 Nov 2025 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bgIkK50G";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RQYMvD6D"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB2314D04;
	Mon, 17 Nov 2025 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763360147; cv=fail; b=OVpvAqXROySg28W0t6KUK2/OT5AX2KAj5kU8RNiADxpHX6mcqN8KakhjoiSlGd+PM//e5TSeQTRWInYbmDNlOCmXE9+9prp616sKeAzAQRMsJLnQBOImckVF2yfhKpsu/5ZVbh8j9/0AeJLONJJ3SIZSxxVEOWvDIxR4AKCmxAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763360147; c=relaxed/simple;
	bh=IjPevtEQxiQliJBph0EocyhZxb6UKNqdoHs5kbdWa6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WS39dhvpuxHe3IUUqeQ53vOLX6h7pXu+BSZYBORxOsvSYxU10c3jmWfjntp9/4/dKHlN7fx2e86LIo18tRR+jwuaISe+IN+L1wbVtEgW8oXcGVZxTfd7j/pvCubMk9RV4rdmHvKn8OaSrZ7qzpQedODiy/yu8L8ynZwnE2YAdzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bgIkK50G; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=RQYMvD6D; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d7810178c37c11f0b33aeb1e7f16c2b6-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IjPevtEQxiQliJBph0EocyhZxb6UKNqdoHs5kbdWa6c=;
	b=bgIkK50G88sTtiQsAbbSxS9RioRu2zoaRODRou3KUSh7gN3VNvsx2drzZUfwVVw8pJZXP2RqgU1XP8EivHEDLqv7Im+j5xWWi0w1NwXUmC7vxOA2K7uQRDf8oUsgGnCnOjEYkGvp5F6JK9yZiwyOi93t6zWIEWvLuQdzQqwTaxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b1f22e15-30e3-472f-896f-b6571d08e24d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:ed928392-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7810178c37c11f0b33aeb1e7f16c2b6-20251117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 312455509; Mon, 17 Nov 2025 14:15:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 14:15:39 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 14:15:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQjmpFT02rua0RzsN4iBx8jXYeC1YW+WPN3EBQkkRkg2nPLPoTvvBYEzZayKX7pa4SMXmXOOnqbZ+aTwSCjSKW1Hz5s0EiWZDYqAkDbt1yZA6E4VmI8H70tdyFzAKgu2MYv1Hh46c6iwHmvQpJTM5utQSda14BPm052pHOMhS7c10JLw+dHGD5wBv5ypaRuD0a/IiipYy+JtGdECAr8/3HKDkIOqMw09O+5hxvYHwXudH4JykeQZMn2Mchkz+aIAVXEXsgZdaPJFFdJOYGkDJoDglbM+g9kWP0JvJOGwjTKR9d+Gc205GLlMtrdcedoi+t4dLiODNxhnyHmYkCoVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjPevtEQxiQliJBph0EocyhZxb6UKNqdoHs5kbdWa6c=;
 b=K1xITBcQAwrmP1kfXf5Owwv0wT4d6UyMX1OYeqHuq+w3vexSoBTk+NPyKYgYEq0Ho/EW2smaX0cCCMAs4MFnLYdyQS94a0/0azyOFDCshU5GqWiWIKLJHxtONIcWy35bwkr777coaKjXiMU/lFpGPFJp66SZmQjlUwNt+SGR+krDNM7tbz84h7B6mTzYVbJ9ZsY1MdN2c4meJmEz4i4y0UStNZOEQCff1fQgOwrE51u9Zi4KhOcZV/RDr3x7s8OaBRFH2fmLBUUK9CwDbJDV9lUEBc5bSWDuNanbznfKv+Uhgn4F9SPrJDmXZgSt20sBxzNjVdjU9myO5HEk7zj4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjPevtEQxiQliJBph0EocyhZxb6UKNqdoHs5kbdWa6c=;
 b=RQYMvD6Dek/kktw+e+8uFwtjAwTCZvo206Gk5Xo32mZtPGyLOy3xDBTsDs1tb9ue2PFpEF2LfNBzqLcV03X1AITy8e+PwMurI9G5Nnn7YNQmflLFOxF6qJuGFfetEdSXHcvSSQ5xdk+UCDyBLDN+C84C3ZqVsICAV/O3G6d/oas=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYSPR03MB8468.apcprd03.prod.outlook.com (2603:1096:405:5e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:15:35 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 06:15:35 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 6/8] media: mediatek: vcodec: fix media device node
 number
Thread-Topic: [PATCH v5 6/8] media: mediatek: vcodec: fix media device node
 number
Thread-Index: AQHcTuSnAn0AlvqeakmCxNIBbmnfQrTluuUAgBC6fAA=
Date: Mon, 17 Nov 2025 06:15:35 +0000
Message-ID: <ffa2db69d5c43ed2e84d167dfddb10c380a01e16.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-7-kyrie.wu@mediatek.com>
	 <b5daa900a1af6f379d5fb9757d2712102ca0fc51.camel@collabora.com>
In-Reply-To: <b5daa900a1af6f379d5fb9757d2712102ca0fc51.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYSPR03MB8468:EE_
x-ms-office365-filtering-correlation-id: 09a40745-917d-43b5-9eca-08de25a0b887
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WEE4NklQQStnK2d4NXVOdzVPUUNydm5IQWV5eTg1MC84ZmFOZElBZnZpa3la?=
 =?utf-8?B?OXU5L1ZkVDVnWVhMeUdLTXN2eE1lOFNPSEtHalZObXpGYWE4MGlvWmtuVnIz?=
 =?utf-8?B?eVJnc3NTZ2ViMVBuOERRdGwyMW5Pa1ljRURaaytUTW1wb3dqSVAxVjRlNy84?=
 =?utf-8?B?dU1Tc2FxSEVXY0VISktRWVRNOTJTMEN3Tys3MkZ1MU4yZDRVOFBYeE1tK3dx?=
 =?utf-8?B?S0dUQmQybnRnREU4S1R6dmFSMXJhdTZvRTMvQVlyRVNGNjRVaWJzQzFpQmZN?=
 =?utf-8?B?T284bGZxV3hQSGxuRll3M1JUSXI5TTZSTmRJNE1JbzZTZjgydTByM3VGTHdI?=
 =?utf-8?B?WGJROFlNVWtrQ0VoaG1rRVdtTXJRWFBJcVpqR2tLdFdrckRjWnNnV3BUbjMz?=
 =?utf-8?B?MjVhSE5JNWlDVzIwd3RkV2NIcVp6c3VVYjlLakQvZUFKK2piOHVzWGhWcEVn?=
 =?utf-8?B?ZzZCNWwwemtrVTRNeXR6VGRrNUZ5bUdxdVlUKzNISzlaVVdudFF4REw3Mk9D?=
 =?utf-8?B?VVpNLzgzcTJlZFNpVmlUby93VGY0Z3ZZQTZiQU9JQndJbXE3VkdPWjMxNENk?=
 =?utf-8?B?dllXZzM2bXRKTWhBK1paU2xmTGozQzBIVmNTUDJkNDUydlJ2SGcwM3FkOG5t?=
 =?utf-8?B?bjJCMVo0Z3FtZUlwbGJPN2hFK0loMXdMY01nbWZmWkJWdlZKQzNxM0pXbXUy?=
 =?utf-8?B?TUdOdjd4Q1VkZ1FiOFFIUk9DZnQycjkxSUVWWHlyRVhVUHlOOElPRmVRY3hH?=
 =?utf-8?B?ZlpndlhIUnJ5SDJiN0ZFOTgvYUR1QUdlVHF6MjluNW9NNWlyKy8zUnpOVkov?=
 =?utf-8?B?alQ3N3V1c2F6ejZ5QXJXZkFPeldta2VWR2VmTHcwRmh5QzBMSnFjUkJ5QWQy?=
 =?utf-8?B?NnpkcGtqN2FzengyTU9tRksrMzJmV3hXT1MzazRBQ2M0a1hGTTNRWGJCc0VG?=
 =?utf-8?B?VjYvOVEvb2pWaFRVNnJzZ0RVZUpqQk0wcFdwTWRNTzA2MWd0WUNNWHFXYURY?=
 =?utf-8?B?U1J2RmEzZFFXRzZ0SUFBdlZFdldsVHRlejVPUnNyWUplS2FiN0NzMS9wdWFO?=
 =?utf-8?B?SllOR1VkRnBHWWZYVTE4STZ6S3p3VjFOZ2NHU0JVU2NIZExmaFNMV1c3RExG?=
 =?utf-8?B?bHljWjMyYUlXdC8renJueU1JRndNY21sbU96TzVXdkJMemJBVThZR3Z2bW52?=
 =?utf-8?B?WXRlL1g1RlI4NnJnVlpvMktjc1BMRGV6b05YQkdPeVBXSll6a0xDa2VJRWFV?=
 =?utf-8?B?UnU5QmJ6ejM5S1Q1b1pmaVFaM2pCWHRrZTNCcWZqclhRL3RGdHNQUytQVnNG?=
 =?utf-8?B?NzAwUStQNDR5cGFQS2ExZ2pxNTNmR282dmI2bUtTRXlFTSsyWU81cU1qOGpS?=
 =?utf-8?B?eGpJelhpQUNJbzhNWEpoc3Y5SGo0QXBNOWRnTmhhSHlKMk9wR1Q4RWZqRDlF?=
 =?utf-8?B?Q2ptUFdpbUxZQm5WVFR4Mk5CUkIwdlZGMUZVSTRSVzVOYWN0QXI1UHQ0NTVE?=
 =?utf-8?B?U3BwTFhMSlBqdDJDcDZyclVoOXl5UG95ZkJVNWN0OExvLzU3K2FWRTJocU1w?=
 =?utf-8?B?TDJzdTlTRDA2YzdUVWpqcWVySkZHY2J1NVNUVWtHMkhOc0tTWHQrbnR4ZTRQ?=
 =?utf-8?B?S0xncm94RUtzOWRJYTFObU1kclpEbzRCekl3allheGwxV29oUVdkbENRcWY0?=
 =?utf-8?B?MitjcXdLN245eWZSSDRoMEE4ZTRlVkhnZnRmQ0FhQk1yWU10eG1ielNMN1Jw?=
 =?utf-8?B?NTFlcDlTTithOXZDRElmVU53RG5Za1FhMDZYRHdlblREL1RReENuOUFWS3Ra?=
 =?utf-8?B?a3h5VGUyVm55RjVEblMwZHhQM0NpS3ljYk5QaGdja1JRMUoxZ3FCQlIyWml1?=
 =?utf-8?B?K1RJbERLOHQ5RUF3NEMyQlhWcDJqWXRxZi9DQjRiVHRpK0FPaUhtTTJPM1pD?=
 =?utf-8?B?aDNRUHVhMGUwZ3F4eGJ3eHFUNWEzREtHSDZMeEM2VnhLUUxBMExRc3JtMjdK?=
 =?utf-8?B?TjdKT3BqNFhPbjhsWFo3RGMzSUpRMXdmOWR5Y0dLZWgrQmdhYmFPaXlHNHk5?=
 =?utf-8?B?SVhRMkY3NWZRNmppRDRtKzYyckZST2c2UWQ2dz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG9sazJZbVZsbzBFL2ZVK3RUeGxrWE1zU3BtVHh2a05DcXN4WjFHWVRmcVBC?=
 =?utf-8?B?dE9neTZGUnQzR29qRTkxK0w2WnNmbHFSV0dWU2Qzblp0ZGpvZE4rWFkwdEFG?=
 =?utf-8?B?eG1vWWYwQ244MllkcitLZlpNSmdNczdBK1BVOEtjdk5KM1Jkb1huWmNzSnNS?=
 =?utf-8?B?MkM3amErbFhHMStHOUpXVU5YOW1sYWlWVEE3YXNYdVZMdzJmYTBVKzF3Mmhj?=
 =?utf-8?B?VmJHN0dLUS83ZEZLeHNSb2FvbWZ2azFHTkg1Z2dtNE55VHNNWlIwSVR6WFZs?=
 =?utf-8?B?T0xHa05ybU1zRTEwOFl1Y1Y0RXo1aktNb3BvaDQ4OUYzTmd6KzJlWkNIOTZP?=
 =?utf-8?B?WVdmVWN6M2F6eXpia1pXSERRbzFyQlkyZk1FOXNkYU1Ob0tyMDlQRTZLSGVX?=
 =?utf-8?B?dkFCWDBIV05KT3FIdGRwOHI2dGVSWEZqaVNWcWY0dE9xcU4wL3llK0l1V1Yz?=
 =?utf-8?B?K2E2ekJFaENGQWFIQWZLTHJ1QXJFMG5VRHMzZVF1VkR5aUJtTDRzNDRqYzdk?=
 =?utf-8?B?a1QwcmFzMG5qSHdxWjRUQjU2Mk81bEhRb3NKTjBiUmdGYXZ4R0NVZVB4MU90?=
 =?utf-8?B?cFI1UEZZQ0xEeXI2RUFMb2t2eUFlN1c4YkpvT0FNRGx0VFBXSVozc2RIUWxy?=
 =?utf-8?B?aFg1VkZma2tGV0FnbUZ6cC84TDFSc3JDL1JpVDc4RnZ3M2duRDVMQnUvRDMx?=
 =?utf-8?B?aXpLMHVwODVYM0NhUG5zVXVIU0RGYWNlSXQrUTFJNmhMS0tPaW1qWWxqRzZx?=
 =?utf-8?B?RTAyZng3MFlCaDFBMGU2L2kxam9qK0J0QXNqZmJhQnNqRnlZbkZqRzYveUNo?=
 =?utf-8?B?eTg5VUc1cTVDSnIwYktJMWFHYmZXN1lpeTlQcU9hMkZlNXFxRnJ1R3ZoN01G?=
 =?utf-8?B?WDVIOHp2S1JscDhyNzFCaEl2MzkrSEpqRVcxMU9KeTZUV3Z6RWJEZWxta1d6?=
 =?utf-8?B?NTUxTUEzaE9NeTNvY3V5YmRlMFZkbU44K2FxQ1NTTXNmY3FaMjM4Umd4Um9S?=
 =?utf-8?B?dlAxUWFidGZOR2VNRys0WHZMNm5MNzJpMEhJRkNHc3RPczIzckF3Q1hDSTB1?=
 =?utf-8?B?b3l0QnRPUEZROUwyKzU3ZnNVcWpuMDhzQjZwRUlQNmYwOCtxK0ovdDBRNDRQ?=
 =?utf-8?B?azJJRnBJZ2ZDU0FuUy82UUJUOERvbWhBc0JxeHZnb01aQkpDZi8zOVozNWlI?=
 =?utf-8?B?OERBeFE4OUVnVW1Zb0JEVFp6SjZBelBtYXVxa3JvQ0UxS2ppUjdvT0dibTVp?=
 =?utf-8?B?N2c4ZGIvN244Y2JyUVlWVEYzdWxueVpsUFFvcDlkZHQ3YWZzSVRla2g4QUk2?=
 =?utf-8?B?amJCZlhMWStVdzBLK01IVHlPZ3NEblVqekFiaGxhV0dCU3hqWWY1MmM3VW1w?=
 =?utf-8?B?U1JUWHFFT0tOWVFJWCtvdG4vS2JGdU1rSUF1S3RwbW9jZkYzTCtTeVY1c2VE?=
 =?utf-8?B?OVM0SzNxVVQrc3dXeng0TmQ2aVZsMTFvZXJrUE5VWnRLc3RaZ1ZQUVkrRVdF?=
 =?utf-8?B?M2JCVXpyaGtKa01vUjNPbVFkSVhBRE5MRCsrWkluK2g1STRhV3BIYmIrMnB3?=
 =?utf-8?B?djk2WDdDTGdqQ2JXYWVUa2g5RjZJMmN5cnNEOWNqL2xPdTB2SWdYVUpRM0Jx?=
 =?utf-8?B?MEJvYTVKMVgwbTFmZjkwTkh2c1BHQ2dXQU5hSzMxbW5BRUpHMVdmYmtyNC9u?=
 =?utf-8?B?blp6VG14dzV1ZkxxQTNoZDI3U0svaVpDcGd0MHZ1TmxpcE9sQVdFZm1OUXBP?=
 =?utf-8?B?OEVXRkVETnhLaENIUmFnSGZzTnpFR2pMajRKaHBheHlick4yWi9NUXM3VU1Z?=
 =?utf-8?B?bC9BeXJVTlVqN3B6a2NraksyWTZFOGIzQXVrU0VPN1FNd1B5TVYwU1NrOVpp?=
 =?utf-8?B?eXNpeVZQUXdWQVhKaGtkQlJ3aTdNNkFJNmcwcFJwSnBsMVJ4dlRUeHgxL3ho?=
 =?utf-8?B?RGNybGNFb1hnWEtXZ3p2eWxwN0g5VjNydzM3T21uWDRyWW5oc2NuUVZLWmtL?=
 =?utf-8?B?NjBjT2J0eXZ4ZDlBVVRTTFc5d01qY1hKc09jRUU0eVlPemZXSjlUbURVZkpM?=
 =?utf-8?B?NGxZYTczckpVRWRmQlhoTCtCOVd3WGhWcVNBY1ozOUNHNHZta0VWTk1FeWlx?=
 =?utf-8?Q?wNfBzT8FJ66oZG1hEjKW10gsN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46EA2E510948184E882D7466BD3AAB40@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a40745-917d-43b5-9eca-08de25a0b887
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:15:35.4036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+kxEeyfIjBFyPIWLdlrEbFwq36dn9XqbknJrHwU6XhOX9w6Ti9HjfItdaIQNUiA/2dLJVCn9UIlp3a0hMMdiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8468

T24gVGh1LCAyMDI1LTExLTA2IGF0IDA5OjQ3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IGZpeCAtPiBGaXgNCj4gDQo+IExlIGpldWRpIDA2IG5vdmVtYnJlIDIw
MjUgw6AgMTQ6MTMgKzA4MDAsIEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiBjaGFuZ2UgbWVkaWEg
cmVnaXN0ZXIgZGV2aWNlIG5vZGUgbnVtYmVyIHRvIGEgY29ycmVjdCB2YWx1ZQ0KPiANCj4gWW91
IGFscmVhZHkgc2F5IHRoYXQgaW4gdGhlIHN1YmplY3QsIHRoZSBkZXNjcmlwdGlvbiBzaG91bGQg
ZXhwbGFpbg0KPiB3aHkgdmZkX2RlYy0NCj4gPiBtaW5vciB3YXMgd3JvbmcuDQo+IA0KPiBOaWNv
bGFzDQoNCkRlYXIgTmljb2xhcywNCg0KSSB3aWxsIGV4cGxhaW4gaXQgaW4gdGhlIG5leHQgdmVy
c2lvbi4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUNCj4gCQ0KPiANCj4gPiANCj4gPiBG
aXhlczogNDFmMDNjNjczY2I3YiAoIm1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiByZXBsYWNlIHBy
Xyogd2l0aA0KPiA+IGRldl8qIGZvcg0KPiA+IHY0bDIgZGVidWcgbWVzc2FnZSIpDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNf
ZGVjX2Rydi5jICAgICAgfCAzDQo+ID4gKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVj
X2Rydg0KPiA+IC5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5jDQo+ID4gaW5kZXggZmNhNjBlODFl
M2M3Li5mM2U0OTU5NzYwMmEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5j
DQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5jDQo+ID4gQEAgLTUxNiw3ICs1MTYsOCBA
QCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICAJCQlnb3RvIGVycl9tZWRpYV9yZWc7DQo+ID4gIAkJfQ0KPiA+ICANCj4g
PiAtCQlkZXZfZGJnKCZwZGV2LT5kZXYsICJtZWRpYSByZWdpc3RlcmVkIGFzIC9kZXYvbWVkaWEl
ZCIsDQo+ID4gdmZkX2RlYy0+bWlub3IpOw0KPiA+ICsJCWRldl9kYmcoJnBkZXYtPmRldiwgIm1l
ZGlhIHJlZ2lzdGVyZWQgYXMgL2Rldi9tZWRpYSVkIiwNCj4gPiArCQkJZGV2LT5tZGV2X2RlYy5k
ZXZub2RlLT5taW5vcik7DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAJbXRrX3Zjb2RlY19kYmdmc19p
bml0KGRldiwgZmFsc2UpOw0K

