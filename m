Return-Path: <linux-media+bounces-19844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDB9A393A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 10:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4CED28482E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777FE19004D;
	Fri, 18 Oct 2024 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kVuOEg4F";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FEkaSYPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C218FC80;
	Fri, 18 Oct 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241679; cv=fail; b=BIJDCrKbWi5dPqb7HQgycu8cv7/dTTXDSSIr/CMJCDWg2uZvtv+C9u+b2aaJY9JImk5uUOjWck9dEuqibCxWVdVz2gz6laBk+EWK7g3eGdF/iVKiuivLH8ETveZoZznSD71yZHqj6LetWwevdkXIFZRIaMK9labii9NCE/PSzlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241679; c=relaxed/simple;
	bh=b/+QW+uIJFAUE9xmu3Ht64kKl8SBl6IfjnPdT/FBT5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VskqWdJBYB7bHnrpHol1nsq9xfRc7wzd4dYmZUMxq0txtSNRpEgRdlyr7gcBBjyGNyJ91GR1LIkH9S84gvSGlz8awYVfJZGAdL2pWoyC7bH5bzXaP41wSDGlv0JcPY6w3nrZGf0lWdrsadjdzOVEFMhVjmujVNtIrSaFiB2qQRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kVuOEg4F; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FEkaSYPP; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 93eb3c748d2e11efb88477ffae1fc7a5-20241018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=b/+QW+uIJFAUE9xmu3Ht64kKl8SBl6IfjnPdT/FBT5M=;
	b=kVuOEg4FXIoaS9YTn6rjnHG6WWktgU4oWIIOTE1TrR8z6dzsP286pl9ckB8ktosUYAImiigOfcfWZHbJUKTj8CrwqzoJTwtWMFpGzRkLZE+q9dcGgvLgHuFgUscGBRBPHM0Fo6IpAp5D9QiEI7afWoTMC6kHENMJT41b6aMVOJ4=;
X-CID-CACHE: Type:Local,Time:202410181654+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:1816f850-71c9-4e5c-aa06-13e8b2aff704,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:50ef4625-9cd9-4037-af6e-f4241b90f84d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 93eb3c748d2e11efb88477ffae1fc7a5-20241018
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 979441660; Fri, 18 Oct 2024 16:54:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 18 Oct 2024 16:54:23 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 18 Oct 2024 16:54:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj9qMzeZHvy1rwGU+YXfAZPNBvJ/Iv+hxaafLXyRlt/e2X72eedug9k+1Tf78n2Y7GF0ztFaBGELwQzo2tdUhouKLg0O5mQfaEVUGu+6zZZzBqy5JzVe8EZDz5XTBDZf+XXots1+tYaaZ7Dir374RWqIE4x6IkL3wBANNOL+9amSDO7//lgZxecHdszt38pxAIyHI7zXD6U+D8n3/GoKOa3JKV9QAEPhSuYQb3B+WPp2q+gZuyVs6I2gN8Y9qtimbBIGoPC7dQbhPnVhSAfQ86UEykT5WWR70DSnIxMMBlwyQ76JE/i8No4jPUuxcuJukXZ1b28M4GSHAVx4j5Pq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/+QW+uIJFAUE9xmu3Ht64kKl8SBl6IfjnPdT/FBT5M=;
 b=svT+nAqr/Nm8KJ0FH0ywVlHW55c5kdYwkvu8AbeVAz/CWSdfELdCkZP9FA020qPMAYguFz14jnVxf+4uf36DcPYFn257VCMLFUOyQcDtQ1lSYBmk1BFrJbBO5svAa1RXuml87lFfY4BO/vU2l7kXNik7uvf8T0RoPvkHHHzrI4nW9Nbo0XJ1AMoULpvkLyH7Wnj0ul38XWckah8PGlFIQDzYkO2bm+LsTMl6zVwZrqTGPTxL4+Hidctl7hI5VO0Eb5PdpA7jcCzF5k2Qq0VS/dFGivuVaqe58U6ciUrEaGZ6489PvtTBgwXytaCzJnaYeVI+JUOkD5HFMyH5esuiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/+QW+uIJFAUE9xmu3Ht64kKl8SBl6IfjnPdT/FBT5M=;
 b=FEkaSYPPk25ZCWPzzahBFJl2VB8ftiXGXDzJkT09pbr/LojoFOk5UNn6g1rndeZ++hFdDrTgGaT9iFOzLduFcGyZCfr9Rz59AST5Bc3xbxk/2J5477HtUvE+AOFgEpfF6dPYRYik/fLGyY5zozi0qi8+WxoGW6SlTFZh79IIe30=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7916.apcprd03.prod.outlook.com (2603:1096:101:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 08:54:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Fri, 18 Oct 2024
 08:54:20 +0000
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
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLKMQiiA
Date: Fri, 18 Oct 2024 08:54:20 +0000
Message-ID: <5b3144b7080410192477f5113671c2910329be67.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7916:EE_
x-ms-office365-filtering-correlation-id: f96eabac-31c1-4a85-adeb-08dcef5274e8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZTk0UmJqeEY3R0d4azE1WGVObnRKTGV5OE44V2NsbjJUYmpLeEsvMUIyWEJF?=
 =?utf-8?B?MVFSZS9pTTZnVVdKa0wwM3VwRy9wVU1DQTNPbFZNZlF6TTFQUG1hQnFmcVp4?=
 =?utf-8?B?Z2JXR3NwdE5pd2tKak9yYkRNU2FuL0ppaklpbkxjcXMweXVYRHRSZzV5TGF2?=
 =?utf-8?B?dWVSWlUwRzVxM2IxbTNldEh1RVlQdXdsOVVWM0dzbGpnVi9mRXk0WWZJSU1i?=
 =?utf-8?B?QU96bGx0WHo0NE1lSkFHMytoMDBnSjNzbGZyOTAxS2pjZi9WZlVZQ2VjMXN3?=
 =?utf-8?B?Z1NsS3U4VTI3dTVzQ1kwMXJUMGcrQUhMS2FOSVhHVFE1VGdGZCtXVkx6Q2F3?=
 =?utf-8?B?MC9CWW9ZRTAxaFdoS1ExMUNJa2dpVktlZTBNUEtCSFI5RFNPZjJmcCtTcUlO?=
 =?utf-8?B?QjM5K3g5SjdOeUFlNlhwdHhzTXpHMS93RnYrU2xTYjQ5WlROVDRiNS9Ca2tQ?=
 =?utf-8?B?eGZYMU5pQ2lTNGNBaCtEdWMybW5Hd09LaEV0Znh6VUVvQm85UGNmbFRoNEJx?=
 =?utf-8?B?Q1B3UTk1WXgxd1NrOGEzc05SUU9PUGhYRXRkYkdWa0dSdk84S3BWYnhkcXpJ?=
 =?utf-8?B?eUk0dVp5TC9kRUxqU0Ezdk1GeFgyYzg4Rm5USVIrS1g0V1RpUXpvcjZrTjZI?=
 =?utf-8?B?cFkrcXhZajNpTDAxOEJJYlRUM0FNNTI2K0g2bElwblE3MGh1ME9xcUQ3bXVr?=
 =?utf-8?B?dytMc1hBUDZoTDZ3blUwVnNiekY4TnVXZ0doQkk3bTdnM2d6QXlXc3ZMUmNY?=
 =?utf-8?B?RkZ6T0RrWWRoanZFOXR4a1VjWHBSMytBc05ZM2JNMXMyMlN6U2VIdkJ1WUVz?=
 =?utf-8?B?aS9EOUNjcEc4ejdDZ2Z4dCtFNmFiaGV4ZGJvcXdoMllDZzJlZW84NjB6RGNF?=
 =?utf-8?B?OCtaN3kzSmVPYXFIL052b2s4V0R4Y3RMVEVBREIySVJxd1VvZHY5VG9OZmJU?=
 =?utf-8?B?UTVUeTJjaXAzMDB6SktjUjhESVFzRTBQVVVGSXN4VCtnZWM5M3FFUFZxbGFI?=
 =?utf-8?B?OG1wSnV3OWwxcURMMHB5elZram1uSmNJNzZuN05zQnA2WVFaUW1GZjJrUWYr?=
 =?utf-8?B?UURjUFRZYjJMUHNaU2RrVVhyV1VUd2w3ZFJhTFRoL0dCVkY3djh2QUxiOEFh?=
 =?utf-8?B?SWZGbHNKQ2MwMWRzd2ZlSDBlMW9Lam9sR0p2OHdENEpOeFhUMzVJLzlMRlA1?=
 =?utf-8?B?VUpWTkllN2pxUEdwbk4zRVIwMUF3b1ZqVm5FMDVtZmIyWTZUaVJnV3VSMDJ3?=
 =?utf-8?B?bDl1TWZsREQyalR2My9sbUJxQkpWd3dKN2RZUUxNNnAwbll5cWVxV3hKSXRy?=
 =?utf-8?B?TFpXZVBKclpraSs4NVIweVhtYXozeG5UVS81c09IWGZ3b1lRbnlJSHppZHdE?=
 =?utf-8?B?VzlkcEpKQzdVMitlSnJTZ3lCdkpIdHBKNkxoUCtLVmhULzh0UndSVDZnVE1k?=
 =?utf-8?B?eVFaYWI5ZG5paWVzbTYzbWRpV0pJdTlneVNRbVppQ0NtdkMwQ0ZZQ1FKS1U1?=
 =?utf-8?B?WmJuYi9DS2o5c3dRWEtNVS9NcTh0WHZzaExoTWZXSDROTjZac3dYZ0l0cTl1?=
 =?utf-8?B?VDZ4eDlTT1ZLSlB4SnUxSlA0ZlNpZDBQbGpCQkZjeDQrT2Zqa2JQbStrZmZC?=
 =?utf-8?B?MmhuZlJZRlZqZ0hvNlpKb29iL3NLUWdHQ2p1RERWYUNZTWRLVHpEQzNZOFRG?=
 =?utf-8?B?bzg2ZGdtQnZmOFFJU1Y1Tkp6RVEzc1ZyRTNDbzhyL0MyUW5TQ0ZvdUhnMEta?=
 =?utf-8?B?QWtpUTdORklQcGdlRy9PNVZHYm1VK2FwczlpQS8vUFVFc3VScHVwNW56N09G?=
 =?utf-8?Q?NJOEk8nGeNItf37YqxuDKN/7b0CfbKf3UK564=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2x1N2JmT1RKRjExVXdWa2ZLb2MvU202L3VvUVlTcTYvd1Y0bDRrTFFMZnJw?=
 =?utf-8?B?bk13dXROeUZHU3oyQnNxVmR5UHkwZUZtS3JBNGpqOTkvUTFzQ2tRRkRvcEl0?=
 =?utf-8?B?a2l5TlpWOUxpVU9lWFFwaFQxU25ya2dxYVdwTTFZU3FFY052ZGFydWRiK24z?=
 =?utf-8?B?dkZKa3lPSXl4RkMrajNGM0NDb0RnaU00S05oSmY3aEdmWTJqTk4vd1JNWGZQ?=
 =?utf-8?B?cXZjeUlMQUZKbDhZaHcrR0Z5d24wRHJSODcrb05yVzM1c2JoUjV1OGNJL3I2?=
 =?utf-8?B?UGpaMURpRzU3aldXVWt1bTdqRjcxQ0dCK3BPZGVMU0dmWmtmRG1oOXZPcGxO?=
 =?utf-8?B?TS80NHM5ODFLS0RlY1p2cUtiTHlFTC8ySlZvYlE0bFRHSzIxOEZnVUpNaUds?=
 =?utf-8?B?R3RnZ0dBMzZXZHB5OThxV3dLQTlZa1ZDUFc3U0g3ZzkwZkRsNSt3ZklZTmVu?=
 =?utf-8?B?OExrUmZpdUxtUnFUQXFsNW5LUG5hTExkRkVqSHhSbEhEL0ZpZEg4T0RkQm1m?=
 =?utf-8?B?bGYwQTlUV1VnVjZpVlBuQXh1NnRxS21FajlaTlV4OTZLOVB6TnprNjZqV0sy?=
 =?utf-8?B?dkw2Y2Y0VHFqM0MycUREVDJ1YWt6Q2ZoWXNZZVQ0NkphSlZnQ1BxRDJIRlVY?=
 =?utf-8?B?S1dFUDJ5K3d1Ylo2VGlkbGtNNnVuYy9mOEtEdk1aYVJTaFVkdmxQK3Jwclll?=
 =?utf-8?B?SVg2a1Zsd08wRGdGQVlVaVVNU1h0ZXduQXk1djNhOGNXenhaQWNJTlBqaS9Y?=
 =?utf-8?B?NWNSTW14cjNJT1ZMTkVuZHhEZ2xHOTVXb0ZMS3c4d1JoWHNKL0ZWbVhFMzVG?=
 =?utf-8?B?WWx4YkY0UVAvZzBkNURJZ21OSUJEZ2lVV0U0algzcDYrdnJtN2ZxUSttRE1a?=
 =?utf-8?B?L0FmMU1RbFA4eHVSTzkzNjE4VnBoeXcwUDJwQlFtUVBuWEMvcGc3dThhN2tI?=
 =?utf-8?B?eTdGRVY4S3kyUVp0T3hFTzg5MVo3VVRDRUc0RzZ3aGpTejNwZFhUK0tqRFhF?=
 =?utf-8?B?UEQ3dWRuTXRxTWFyTkZaYmttL0x3cy9NWTBIY3VOcEsvYlFMQ3laSlNSS1Vu?=
 =?utf-8?B?ZkwxWVBJUVBFVUkwUG12TmNFSzZEaEoxVzNPRFJWSVBEZlFVQVVKUUNxWE1x?=
 =?utf-8?B?MC9FSUxYYXZiL2kybXdjUFpFeXR1M3RUNTJpRU9sMktpVThkL1ZiWlc3TW02?=
 =?utf-8?B?YXU2MHptcEFxYkdMOHU4ZElkK0pOU24zUTl1WkN0dnlFSnpCcU0xT2ZEQmZ4?=
 =?utf-8?B?WEsrTnBMdWt3cFY2NTNOdExFZkZjTkRrbkdiZjNyZzJidUhKSDdsL0tzbGpF?=
 =?utf-8?B?QzJ1RFNPODVXQXNWM1NoTWJrUnU4ejM2NzVmMyttSUFXRWZhcmVDdDJ4Zzh5?=
 =?utf-8?B?eFNGVmE1YVdVTG9YazBNRldwd0tsQnpyZUZWampjdGdjaW1RMUhxcXB2WTl2?=
 =?utf-8?B?aUVDTDFKVlA3RjV3YkpUK1pUS1hCcW9tQ014WGdwWTRialU0L0laaCt3ZHAz?=
 =?utf-8?B?VTl6amthdHY3eFZERklMUFhJcUpXTEpzY29zbzA4TUd6VEJ2ZzhCZTFaOWJ1?=
 =?utf-8?B?eG0rM0VSenBXSWM4aUgwL25jSUhRZEpXU3l2Y1hPVmpOSnlJSFBMUHljdUJI?=
 =?utf-8?B?RU1vdndPK3JmVjZmd3E0QzJuVW1DdWdaOHJZQlVQVnB3dGQwelUvcUJESklP?=
 =?utf-8?B?elhsdmVVZ2hOR1hLNGcrQVlyeFJVNnFET2o1MzJ1eW9uYi9yOTgxZnVIS005?=
 =?utf-8?B?Ri8wdG41RkFuNXh1S2tsQXJMOFl0S3c0cUJ5dnNBVU9pbWYrbVdZaEFQWHEx?=
 =?utf-8?B?T25VTTJuTTBuNU5wSWZvR2huT3BJRC9XQ2RPN2svVnRvT2Z2b3JDKy9aN2Nv?=
 =?utf-8?B?VHZNbDMrZFljd2RJaGQxSjRlbHNJcW4xWk1YaFNiV0RrdnJuY2w0YkY3MGo1?=
 =?utf-8?B?MlNlYXhPMGhCbWc3MmxPNTJ6aHhSY0thZ1M4Z0NhOU5JUWY5MS95N2NiVVhQ?=
 =?utf-8?B?YWc4dm9YL1d6bXoxWkF3MjQ5L1BhNUZqSGlOeGU2SVBHUmlXYjJhem9zNEpM?=
 =?utf-8?B?N2N3cjR2dGVmM3VXZEpydFJwc3RaWXRiZ2QzMFcwTFNXc2x4VThDK3JPMmdy?=
 =?utf-8?Q?ITFAGv8nB+Aj1+L6ZhWb6AVB3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBC12352CFF3574988112CA094110344@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96eabac-31c1-4a85-adeb-08dcef5274e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 08:54:20.6998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3SKzg2hNGB8nmqF+WhBXd1qGea648L9Yv97pBdEbB/I7FSfV4WGNguQRuCyMGAlxM4/nwjLPArJzgNg56WpiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7916
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.761300-8.000000
X-TMASE-MatchedRID: QfHZjzml1E9m6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYPuA
	5hg2vazcZc34la8q513oOFZKBrFWj0ILcl5xUj1W+Fq9Vk/m1NrXAvRa0tfJGj6DYdLKc78CCHM
	QRF+BpazBzvpXANyG1fh+HUxllt9Smxh0gY/o+VlPuMJi/ZAk8TuvYa1v2IFh82HMiBe0UlVQqT
	fsthoSXLbU2xtg+L3DsSlcUk53GMm6Tcnzd5LWmRuZoNKc6pl+pfVcx39Kq+6jpurG4S6tlKPFj
	JEFr+olFUew0Fl/1pEBi3kqJOK62QtuKBGekqUpI/NGWt0UYPDzIsnUj1Uj3DXCZSDbAuIdkPu0
	Mix0fTdjQqCvEF8MUN3BmUlFpLXo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.761300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	F2A0983B7972197CBAC45AAA3BC5D69BCB77DBF37425E6AEC56A83C6FCB4EE912000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0YXRpYyBzc2l6ZV90IGRlYnVnX29wc19zaG93KHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4gKwkJCSAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBj
aGFyICpidWYpDQo+ICt7DQoNClNlcGFyYXRlIGRlYnVnIHJlbGF0ZWQgY29kZSB0byBkZWJ1ZyBw
YXRjaC4NCg0KPiArCWludCBsZW4gPSAwOw0KPiArDQo+ICsJbGVuICs9IHNucHJpbnRmKGJ1ZiAr
IGxlbiwgUEFHRV9TSVpFIC0gbGVuLCAiVGhpcyBpcyBkZWJ1ZyBvcHMgbWVzc2FnZVxuIik7DQo+
ICsNCj4gKwlyZXR1cm4gbGVuOw0KPiArfQ0KPiArDQo+ICtlbnVtIFJFR19PUFNfQ01EIHsNCj4g
KwlSRUdfT1BTX0NNRF9JRCwNCj4gKwlSRUdfT1BTX0NNRF9DU0ksDQo+ICsJUkVHX09QU19DTURf
UkcsDQo+ICsJUkVHX09QU19DTURfVkFMLA0KPiArCVJFR19PUFNfQ01EX01BWF9OVU0sDQo+ICt9
Ow0KPiArDQo+ICtzdGF0aWMgc3NpemVfdCBkZWJ1Z19vcHNfc3RvcmUoc3RydWN0IGRldmljZSAq
ZGV2LA0KPiArCQkJICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiArCQkJ
ICAgICAgIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGNvdW50KQ0KPiArew0KDQpEaXR0by4NCg0K
UmVnYXJkcywNCkNLDQoNCj4gKwljaGFyIGRlbGltW10gPSAiICI7DQo+ICsJY2hhciBjc2lfbmFt
ZXNbMjBdOw0KPiArCWNoYXIgKnRva2VuID0gTlVMTDsNCj4gKwljaGFyICpzYnVmID0ga2NhbGxv
Yyhjb3VudCArIDEsIHNpemVvZihjaGFyKSwgR0ZQX0tFUk5FTCk7DQo+ICsJY2hhciAqcyA9IHNi
dWY7DQo+ICsJaW50IHJldDsNCj4gKwljaGFyICphcmdbUkVHX09QU19DTURfTUFYX05VTV07DQo+
ICsJc3RydWN0IHNlbmluZl9jb3JlICpjb3JlID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJ
c3RydWN0IHNlbmluZl9jdHggKmN0eDsNCj4gKwlpbnQgY3NpX3BvcnQgPSAtMTsNCj4gKwlpbnQg
cmdfaWR4ID0gLTE7DQo+ICsJdTMyIHZhbCwgaSwgbnVtX3BhcmEgPSAwOw0KPiArDQo+ICsJaWYg
KCFzYnVmKQ0KPiArCQlnb3RvIEVSUl9ERUJVR19PUFNfU1RPUkU7DQo+ICsNCj4gKwltZW1jcHko
c2J1ZiwgYnVmLCBjb3VudCk7DQo+ICsNCj4gKwl0b2tlbiA9IHN0cnNlcCgmcywgZGVsaW0pOw0K
PiArCXdoaWxlICh0b2tlbiAmJiBudW1fcGFyYSA8IFJFR19PUFNfQ01EX01BWF9OVU0pIHsNCj4g
KwkJaWYgKHN0cmxlbih0b2tlbikpIHsNCj4gKwkJCWFyZ1tudW1fcGFyYV0gPSB0b2tlbjsNCj4g
KwkJCW51bV9wYXJhKys7DQo+ICsJCX0NCj4gKw0KPiArCQl0b2tlbiA9IHN0cnNlcCgmcywgZGVs
aW0pOw0KPiArCX0NCj4gKw0KPiArCWlmIChudW1fcGFyYSAhPSBSRUdfT1BTX0NNRF9NQVhfTlVN
KSB7DQo+ICsJCWRldl9pbmZvKGRldiwgIldyb25nIGNvbW1hbmQgcGFyYW1ldGVyIG51bWJlclxu
Iik7DQo+ICsJCWdvdG8gRVJSX0RFQlVHX09QU19TVE9SRTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAo
c3RybmNtcCgiU0VUX1JFRyIsIGFyZ1tSRUdfT1BTX0NNRF9JRF0sIHNpemVvZigiU0VUX1JFRyIp
KSA9PSAwKSB7DQo+ICsJCWZvciAoaSA9IDA7IGkgPCBSRUdfS0VZX01BWF9OVU07IGkrKykgew0K
PiArCQkJaWYgKCFzdHJjYXNlY21wKGFyZ1tSRUdfT1BTX0NNRF9SR10sIHNldF9yZWdfbmFtZXNb
aV0pKQ0KPiArCQkJCXJnX2lkeCA9IGk7DQo+ICsJCX0NCj4gKwkJaWYgKHJnX2lkeCA8IDApDQo+
ICsJCQlnb3RvIEVSUl9ERUJVR19PUFNfU1RPUkU7DQo+ICsNCj4gKwkJcmV0ID0ga3N0cnRvdWlu
dChhcmdbUkVHX09QU19DTURfVkFMXSwgMCwgJnZhbCk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQln
b3RvIEVSUl9ERUJVR19PUFNfU1RPUkU7DQo+ICsNCj4gKwkJZm9yIChpID0gMDsgaSA8IENTSV9Q
T1JUX01BWF9OVU07IGkrKykgew0KPiArCQkJbWVtc2V0KGNzaV9uYW1lcywgMCwgQVJSQVlfU0la
RShjc2lfbmFtZXMpKTsNCj4gKwkJCXNucHJpbnRmKGNzaV9uYW1lcywgMTAsICJjc2ktJXMiLCBj
c2lfcG9ydF9uYW1lc1tpXSk7DQo+ICsJCQlpZiAoIXN0cmNhc2VjbXAoYXJnW1JFR19PUFNfQ01E
X0NTSV0sIGNzaV9uYW1lcykpDQo+ICsJCQkJY3NpX3BvcnQgPSBpOw0KPiArCQl9DQo+ICsNCj4g
KwkJaWYgKGNzaV9wb3J0IDwgMCkNCj4gKwkJCWdvdG8gRVJSX0RFQlVHX09QU19TVE9SRTsNCj4g
Kw0KPiArCQkvKiByZWcgY2FsbCAqLw0KPiArCQltdXRleF9sb2NrKCZjb3JlLT5tdXRleCk7DQo+
ICsNCj4gKwkJbGlzdF9mb3JfZWFjaF9lbnRyeShjdHgsICZjb3JlLT5saXN0LCBsaXN0KSB7DQo+
ICsJCQlpZiAoY3NpX3BvcnQgPT0gY3R4LT5wb3J0KQ0KPiArCQkJCW10a19jYW1fc2VuaW5mX3Nl
dF9yZWcoY3R4LCByZ19pZHgsIHZhbCk7DQo+ICsJCX0NCj4gKw0KPiArCQltdXRleF91bmxvY2so
JmNvcmUtPm11dGV4KTsNCj4gKwl9DQo+ICsNCj4gK0VSUl9ERUJVR19PUFNfU1RPUkU6DQo+ICsN
Cj4gKwlrZnJlZShzYnVmKTsNCj4gKw0KPiArCXJldHVybiBjb3VudDsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIERFVklDRV9BVFRSX1JXKGRlYnVnX29wcyk7DQo+ICsNCg0K

