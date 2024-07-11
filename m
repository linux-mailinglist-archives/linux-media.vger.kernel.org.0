Return-Path: <linux-media+bounces-14891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90F92DE03
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 03:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E69D1C2147B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730AC8F66;
	Thu, 11 Jul 2024 01:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uf8rtzOR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TsLSvHd8"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC17F9;
	Thu, 11 Jul 2024 01:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720661752; cv=fail; b=qkhaRUnpCPm7fvBXa9v1a/B/GrFADDGGx3QhmfVJtDNQhBB9fjORBCXl9CLCiVcxvtCiJvs8v9vI7AYL0E6uF7uWcqFDfHesD5Q23XXhpFNwYvogDiarn8AvPzScgLAiOiR3IGF58r55K05r+7XSltMCZSMv8BVcTOUqaAlhaSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720661752; c=relaxed/simple;
	bh=NiojM0sNcvCVMSwQmdSYXYdimYRmJyxX0i/f7v1QpBs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WFCV7yMKzu3ScPKyyq56i9gHroEW7WvZb/TR+X5Bat0VoaW7I7i9NwF3ser0a0liSvjnOEyJWU7Z+UVsjfQ9dXdoRF3Xa0IhZyFq7eHgoLXVyPl1zeBisEL0gdDfUJU49c/qU+igo+aRXRAvnvkKHIktTxXato7z3qHk+oNyZ1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uf8rtzOR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=TsLSvHd8; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e2c3edca3f2511efb5b96b43b535fdb4-20240711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NiojM0sNcvCVMSwQmdSYXYdimYRmJyxX0i/f7v1QpBs=;
	b=uf8rtzORf+g4QTymxCWG4fhGMbav0VZMIjr1V4Aqsu2vY/MhQdpyN2tE3IHrji0rxVULELl+4SnZH4WDBjJ8oQ3rTWR46a2L603/Za9nTnId9+6MvV+XzjEoaz5A/xFKf/2vJ0VWL/lJh+TMm/pHIgrf3V2gEogo5Kok+y+XBGw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:11d9b259-75bf-4251-a4e6-8e19e0940bde,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:ba885a6,CLOUDID:daaa2745-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e2c3edca3f2511efb5b96b43b535fdb4-20240711
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 228292724; Thu, 11 Jul 2024 09:35:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Jul 2024 09:35:39 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Jul 2024 09:35:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwGgRsVl7SnVGbijSC+fnF6hX/QS5CRQFS77VcTNWnvT2IktVAFCelLw0J/NfZVBbUKlDayMbGTF9It4LXbN4Dq36CnhnOBZcxNDdhbvmLwl5oD5/jS9KRvpcU7AvcQ3UiLVGYlx9UgsD0GhLRV9t+g6DPVmckkd8UxM/73tF1Ce23WgR2eVQrQD9mJGYqealLQKR1Mrwm1zeuX2IasRohxTzKrunRXC9Cux2QmtnpBSl2FXlzO6+fmFEJqTDIVZvaNxojuM6OnC9XXeJT7JN1eaf8KuRuoBHLTz9I+QGkg0U8wK8TeEnebCNLeSmGRGlhJoJnn5zPAExwQst94vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiojM0sNcvCVMSwQmdSYXYdimYRmJyxX0i/f7v1QpBs=;
 b=FvNOhYsQioi29btMbPn+4bKsaUB4yDMkBNmfD2UVdhFClod3xvFBXtE9+EYGg1JZCjZ8UWYf2TAwGCWFEAi0k1PRydjrKyyiAiOVD94GUWdFwA1svf7MbIGUOcBz48wKs0iym8+l2Kiz3gt8POM81P1dwmy3qe2fOojst8uXr7k1IVjbn8jzcZ3YpPbFDBTrvMEl28VKTpxLERiq5wezI2K0g+pt4o14P6bgST+anAyO0mcvH1w6nsZaF2PW44iZwS0fy1iT+OWkqSkq/4LDwEIDHDl/OVgCj/QPrBnurypfhJD33ZTGu6Yfch04LjIgf7mYhq4nS9nXx7poO0tenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiojM0sNcvCVMSwQmdSYXYdimYRmJyxX0i/f7v1QpBs=;
 b=TsLSvHd8VFnVtlW5wpWh6T80GVO0+bzn/9wO6tYlFrZ8uH4Eu65MK3w3rYnXwVVuJa1M+0XZpmQDVxYFLULW7iWLgyemS+0J+y7h8Q66rYSNs6uGmONDrJtk4k2o/GJgknAKuLvBxMQDpp04zosjLx3LgsHP2i8gz2OWFYQ3gd4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SG2PR03MB6658.apcprd03.prod.outlook.com (2603:1096:4:1df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 01:35:37 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 01:35:36 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
	<fshao@chromium.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: media: mediatek: mdp: Change
 mediatek,gce-events to reference
Thread-Topic: [PATCH v4 2/3] dt-bindings: media: mediatek: mdp: Change
 mediatek,gce-events to reference
Thread-Index: AQHaTmLZbtjRH8OJ4EOUuUqI8sZ5ubHxyHqA
Date: Thu, 11 Jul 2024 01:35:36 +0000
Message-ID: <76c805db1a10a555ba6aa152ad38ed7a05b45bef.camel@mediatek.com>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
	 <20240124011459.12204-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20240124011459.12204-3-jason-jh.lin@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SG2PR03MB6658:EE_
x-ms-office365-filtering-correlation-id: 3ab6b0d7-e2e7-4d9c-b1d8-08dca149c3b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1JkNXJXQTdnZXd5WjVwMWdOUFBUS3ZXejZnZ3M5d0ZJcjJQeEpJQ1JvSkpz?=
 =?utf-8?B?emJQZ20vVUFLbGI0ZGdtZm9Hd0g1WXZoZjV0NEVTRmhiQWxEOWVxNzhtUWl1?=
 =?utf-8?B?dFluRk8zdVNST2NGU0VJdUVZSHBmYnhHUS9FSkhLMXhFVU8vNURmUmlhUXI1?=
 =?utf-8?B?M05NZWJGVFlKa3NYSjREWnJpYWs1bjcyMXRPZmxld2k1UGJUa3ZUTEQwT3Bh?=
 =?utf-8?B?ZWh3VHhsTk1uciszYTZmTDI0VkZwbjRJU1VKRDJDeUpyMkxUcy8zbVZYUTJ6?=
 =?utf-8?B?T0xtRk9qWmUrVHVJdUd1aThjTlZLUTNreVI1cXF4SEdoOTMrQnlnSWtzL20y?=
 =?utf-8?B?OHJUY3IxenNYY0p3WCt1ZVJhbmI5MVBaVDNjYnF2bFowb3pMZ2V1aTVmNkZX?=
 =?utf-8?B?cnVabCszcFo3eHJEbXNMR1JEb1NER0RUZHl1OEN1UHVlSmRpRnVLYVM0VkMx?=
 =?utf-8?B?YmEwdUVDNWd1OVhnT3R2dFp0djBLSHJ0aWgvWHR3UlNoRm5jU1hPQmN3UnlJ?=
 =?utf-8?B?ckJpbm5TbXNlWUdUcG4rVzFOaWhQWHo1YmdGV3FGS1N6ZHBXUHQwZGZ0bXk2?=
 =?utf-8?B?TDkwbDBLSnpQd21MTFFMZGhqVTBDRmc3YUgvb29iNmpwZDFnUk00Z3pEcXdX?=
 =?utf-8?B?QlVqUzlhVXRGT3JHRjZtVGhZT2lYYkxCazFVMnVvZXJBc0VUZjU2czMzY1VF?=
 =?utf-8?B?dXp6TlBlYUM1aTJpSGtqNStUKy9EeC9CaWhFK2diekQ5bElJRUZuWTd5eklZ?=
 =?utf-8?B?SUpmT2pyM1R3SGpsNWNBMFlxWXVId09Td0pzSHZjc2JOd1pxWjBXLzFpNTYv?=
 =?utf-8?B?U0t3L2xGZ2pKcWN4bkVvcnZ1LzNTZlRMMHpFZlhmY0F4VUhqRUF6Z2xobzNr?=
 =?utf-8?B?Y3U1WGVWYWdpbFIwdmVEUzhRK3RadEJHV0hGNmk3bEVpNUVQanhuTGJ3cTNJ?=
 =?utf-8?B?QmZ3YUd4WkQyYkhBWnYxZU5ac0tVQkcxczlvVVVuQTJ6cHl1U0czWFN0K0pj?=
 =?utf-8?B?OTZMclRXREZrUGc4SUlLaFBQanJrbmZ2bW5mZGJ1Qzd4Y3daVDVKUS9rekp5?=
 =?utf-8?B?VUZRMkxuSzR6VVUvdFhVUGJHZWpUZS94TURTRU1tMU42MWEvVkJJSWdBRVd6?=
 =?utf-8?B?bGlxZ0NkTG9DWU5DRTByMEs2aWltOTUxR1JCdUR3TXVVYVlnOG9NRkVoSmNq?=
 =?utf-8?B?b1QzUTBMdVdncXFlMjVaSkhVWWRVVTVzdk5GLzhsdFVJVVN1RnRJazcrQTRs?=
 =?utf-8?B?OVdvN24xWnBJdmJUQnFnV2l0S1pyVkpRM09FTytQMzFiRU5XUFN6dDg3R1lt?=
 =?utf-8?B?b2Q1T1JyRlVjWGJWQzJJYlhzeWVqYXIxbDFYSHFjZVZWYjNoN3p1bjVmVHdj?=
 =?utf-8?B?VTgxZ1NTczB2cWpxNmJoOURweFZXVkI2czI2M1d2ekdkQTZBekFneFZlQ0J3?=
 =?utf-8?B?V1dRci8rb2Jzc011L0swTHdSK1F2NVNvdWxSL1RtQzhyN3NLejZZVGhSYnls?=
 =?utf-8?B?eTJNdHJNbWxQS0MvOWp5dXJhYXFCek1aOTRpeDdEam14QitxL21NN2tVZGFa?=
 =?utf-8?B?K0tyUmZxUTIvYndQL2gwd3dHZ3gybXFFcDk0SkRqdFJsV2l4TXo4OVk2TW1k?=
 =?utf-8?B?TG9oVlorQWhRM1FEcjhrZ0pQQ2todzJTSjJTVGxZZWx2blNBd3VkZy9OSmx6?=
 =?utf-8?B?Rjlhck1kTk5oZEpqc2ZqS0pXZkIyT1ZEVmhzcWxvOGZTUFREblY1MHlVOEdM?=
 =?utf-8?B?endCZmx2eDRqVHJ2ZlZ4bDU0cjR2Z0h4S2Z5WmdTZUJjWWtwbFhsNVdtV0kv?=
 =?utf-8?B?RS9CM3Q2dU83am1QbVIzYWlPSTQzZ2RjUzMxVUsyM0p2QTZweW5Nd3BzMEds?=
 =?utf-8?B?bHJ6MGgwUFRXZDk3bHNJbGhCTkcwMDlRSG1UeFpyR09Oc1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckY4N0x0ZVl4cDhSVFZMbTRnbnAzQUM3RWd6Yno3dEZQTHErYXNYc040UTMy?=
 =?utf-8?B?ZWtpZHZ6cE52RlFINlZBbDlBTHF2Tmx5RWVMR2JRVVB5YmVUQ3ZyMjV1dlR1?=
 =?utf-8?B?UzFKZmNZYklTK3BuQXprajgrY3BjMktYbzZIQXVHTTFHL2ZreWsrNUZ6SVlQ?=
 =?utf-8?B?SzIzNkcyY241dWk2M0l2VXoxVUFXRjJldlVOYi9nUUZRNFVXYzlsU2g0U1da?=
 =?utf-8?B?eXgxVXdybW5Ob3lobGlqSE9nSlY1R014MVRtT0dTWDUyeGdwSmV3cysyK0tq?=
 =?utf-8?B?QlNyK1pFV2QrSmNqTnpWSXVpOXVZdXVjZmZPMTF2ako4M0c3ZWpHMFlnbVRw?=
 =?utf-8?B?YzdRY09tNHR2R3NIQ2FTdEY0RUdUSEd0S2VFRTh4eUlJNjBuK0R1b3BpYW1t?=
 =?utf-8?B?UTRxSVJaRXhBNmc5b0dweXhtaUpnY1RpN1g2RFNNVTRCd0ZSbVAvaUJaa1Vp?=
 =?utf-8?B?TVNINU80Rmw4TDY2bTVGcEY2OVZ6U1M5cHAwTzkyYWhnZFFpeTlLK25FQVNr?=
 =?utf-8?B?NzRZSHkyV1RON0tGbExCUXZ1MDBxOTBYVVJlWG1HWUViVUI0MTNOM2VsUFlR?=
 =?utf-8?B?UWNDRVlrTDlOQVBXbVllM2svcXMrMk5nNDRndldFanpLMG9XekpxK0g0ZlJk?=
 =?utf-8?B?RjFFbDMxQk8xL3BzRzF6SUUrYWYzRkRqd05XT0dIcUtEU1Z4TFF2S29TY256?=
 =?utf-8?B?dnpwSndiZXZqNTU0QUZCRkhqWXVJbFF2TFFTZzI5U0xDUVNhbmxqNW14b1F5?=
 =?utf-8?B?eFVuN1hXd2xoUktHd0JyYXZtbjMvQWJ3SEhaWXU3cGVGSE9qRDVJcTRDMGs4?=
 =?utf-8?B?NlVUK0F0ZklMaEQvRFJhOEI1TTdoMmZGUWNybzJwQm5PWEEzTldnUWplRlhQ?=
 =?utf-8?B?ejZKTk9NeC9DK01tb1Q0Tlk2MnpHMzYvdGNKWTdwb3VIU0xEWFpWNFQvVURR?=
 =?utf-8?B?c1hUdlJmbFhBdEVjZ1FvTXVWVEc5QUpkMGVpMGM1TWxVeVd6T0JsNDhSdVBp?=
 =?utf-8?B?MlRiK3Qxd1l6eTdlNFdaVVgvTWVZeUl0byt2VktCWWpOOVZhTE1kRFhLVlV3?=
 =?utf-8?B?aUozaGNDUEtQcXRUbzB3U0hFdCtlTW9qdWJJcGgrQkRQUXlucVltZTZDTjZY?=
 =?utf-8?B?bGpzbEVXTmtXSnpnNjFPek9Xa0lSVmZ6RytVRnE5RkFxT0NSUmkrQkc0QTBD?=
 =?utf-8?B?UjRPMWRTNmtzWnU5Vkg5VURiclQvcmNwNmtHdmxLNTAxNHlwMFUrY2MvS1ph?=
 =?utf-8?B?QU9oL0JFN1d0VmFtNFNYOHJBdHdNZnF2WldWaW1IMzlXYVVwT2wyWGdYb0U3?=
 =?utf-8?B?RFVrY3FHdExqZjE2cUc4cnlRRzBjdDVpZy9SZTBTZkZKcVRvSXQ0aTVIN0Rh?=
 =?utf-8?B?cklVeTU1NmFlSDBUZmFWUkZvNE9YQlZMdXl0dyt1Uk1ZdllKdld0SndiVmtz?=
 =?utf-8?B?a0ltaVdLeHFWYm9YTmZUekl4dmlDVkdXYWVZWFF3TjAzTTBpOE5ZamNVWFFQ?=
 =?utf-8?B?SUpTeHViOE5pQ2twZHJyM0VpWHcvS2pKTkMzQk9lSHRPWjBZb1g1TzFsN2l1?=
 =?utf-8?B?N0JzR3ZLclFDMksrUWVFelErVkM3cHo3d1hOekZzTWUrekwyblFlTThwT2NR?=
 =?utf-8?B?SHlWTkpyQ1NranJEZW9HMGFiRnRDSkNhbjBuNTVIMU93VUExc2tjZnNFQ1FF?=
 =?utf-8?B?Y0hoUGRSZmp5d1htU1BucFdpT2h1U01FeG5oOFAxTnJlWWkybXF5K3p5ZHVp?=
 =?utf-8?B?WmV2VFYybTBORFZyZUh4VnFSNXBRc0UrSDJPdzRtaE1UUzZ0c1ZWeXptdHZh?=
 =?utf-8?B?NlpGK0xIdVFUbGpvc05ybUFkeVFJUHdVV0FLUWNuUGZvWGxBQjVxNUZSWnBk?=
 =?utf-8?B?U0ZBci8wMW5CN3BPVjI5aHM3a1VCTUFjeW9SbXpGazRjZjZFSWp2aUNzWG9V?=
 =?utf-8?B?akpMTGFlL0pzZ2g2cTN4UExLc0VwR3hoeVJ0akg1MEw4RVZRcWdtS2JFaU83?=
 =?utf-8?B?ZGtidm9rWFNKUk5Sd1EvaGsrMW42Zm9haXlnbDgxaUh3NnY3RDMzL0hxZ0xn?=
 =?utf-8?B?emhFWkdVM0lEZlp1dXVMRDVFT0x5dkwzbDF1ZEo4VisrcWFPSUd0b3FndGho?=
 =?utf-8?B?TGNlVkIwc1l5TnBEa3VoSk9xZ0QxQzk3MHdhK2RCdmV5dVFZdTg4eHBWeGEr?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC472B22B2BF6A4096BEA39F96F1A083@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab6b0d7-e2e7-4d9c-b1d8-08dca149c3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 01:35:36.7463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ozs8JkvrBDnbKxAtgADqvyJmeUpce4V8kTasiQdB71OKqn+Oc5vkMtBECkYpgjP9PUs1PRrKb7AYTvbQi3i9UN3BZYjxH+oIJGFr+FiOGrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6658
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.295800-8.000000
X-TMASE-MatchedRID: nVQUmLJJeyYDJrf2+hNOhbxygpRxo469m0H2L3kjQgqo+b+yOP0oGMkU
	hKWc+gwP+BmvCg26LIz4exig1DmiEWJZXQNDzktSH5YQyOg71ZYW40XiUkbrG1mmz7LVVfOpCx5
	3vGB6GzT3B+HtdwJeNOLMOJyauTQr1r+MhmhnIoWO0rt0LpQGeX0tCKdnhB58pTwPRvSoXL2y5/
	tFZu9S3Ku6xVHLhqfxIAcCikR3vq8Q2EoSaMdX1EMF60niIPNPiZc8crBgHd+BN27T1YWQj9XOY
	kkDSfb4
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.295800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	8A339668DE29194CB5DDC48CC65A2195D3134BDB0E507D13919D17D3276060AD2000:8

SGkgTWF1cm8sDQoNClNvcnJ5IGZvciBtaXNzaW5nIENDIHRoaXMgcGF0Y2ggdG8geW91Lg0KQ291
bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzPw0KVGhhbmtzIQ0KDQpSZWdhcmRzLA0K
SmFzb24tSkguTGluDQoNCk9uIFdlZCwgMjAyNC0wMS0yNCBhdCAwOToxNCArMDgwMCwgSmFzb24t
SkguTGluIHdyb3RlOg0KPiBDaGFuZ2UgbWVkaWF0ZWssZ2NlLWV2ZW50cyBwcm9wZXJ0eSB0byBy
ZWZlcmVuY2UgbWVkaWF0ZWssZ2NlLQ0KPiBwcm9wcy55YW1sDQo+IGluc3RlYWQgb2YgZGVmaW5p
bmcgaXRzZWxmLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5s
aW5AbWVkaWF0ZWsuY29tPg0KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4NCj4gLS0tDQo+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWss
bWRwMy1yZG1hLnlhbWwgICAgICAgICAgIHwgMTEgKysrLS0tLS0tLQ0KPiAtDQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sIHwgMTIgKysrKy0t
LS0NCj4gLS0tLQ0KPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd3JvdC55YW1s
ICAgICAgICAgICB8IDEyICsrKystLS0tDQo+IC0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+IHJkbWEu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxt
ZHAzLQ0KPiByZG1hLnlhbWwNCj4gaW5kZXggNTlkYjgzMDY0ODViLi40YTI4NmQ0NmM4ZWUgMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlayxtZHAzLXJkbWEueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1yZG1hLnlhbWwNCj4gQEAgLTQ0LDEzICs0NCw2IEBA
IHByb3BlcnRpZXM6DQo+ICAgICAgICA0IGFyZ3VtZW50cyBkZWZpbmVkIGluIHRoaXMgcHJvcGVy
dHkuIEVhY2ggR0NFIHN1YnN5cyBpZCBpcw0KPiBtYXBwaW5nIHRvDQo+ICAgICAgICBhIGNsaWVu
dCBkZWZpbmVkIGluIHRoZSBoZWFkZXIgaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+LQ0K
PiBnY2UuaC4NCj4gIA0KPiAtICBtZWRpYXRlayxnY2UtZXZlbnRzOg0KPiAtICAgIGRlc2NyaXB0
aW9uOg0KPiAtICAgICAgVGhlIGV2ZW50IGlkIHdoaWNoIGlzIG1hcHBpbmcgdG8gdGhlIHNwZWNp
ZmljIGhhcmR3YXJlIGV2ZW50DQo+IHNpZ25hbA0KPiAtICAgICAgdG8gZ2NlLiBUaGUgZXZlbnQg
aWQgaXMgZGVmaW5lZCBpbiB0aGUgZ2NlIGhlYWRlcg0KPiAtICAgICAgaW5jbHVkZS9kdC1iaW5k
aW5ncy9nY2UvPGNoaXA+LWdjZS5oIG9mIGVhY2ggY2hpcHMuDQo+IC0gICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5DQo+IC0NCj4gICAgbWVkaWF0
ZWssc2NwOg0KPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUNCj4gICAgICBkZXNjcmlwdGlvbjoNCj4gQEAgLTk2LDYgKzg5LDggQEAgcmVxdWlyZWQ6
DQo+ICAgIC0gJyNkbWEtY2VsbHMnDQo+ICANCj4gIGFsbE9mOg0KPiArICAtICRyZWY6IC9zY2hl
bWFzL21haWxib3gvbWVkaWF0ZWssZ2NlLXByb3BzLnlhbWwNCj4gKw0KPiAgICAtIGlmOg0KPiAg
ICAgICAgcHJvcGVydGllczoNCj4gICAgICAgICAgY29tcGF0aWJsZToNCj4gQEAgLTE0Miw3ICsx
MzcsNyBAQCBhbGxPZjoNCj4gICAgICAgICAgY2xvY2tzOg0KPiAgICAgICAgICAgIG1heEl0ZW1z
OiAxDQo+ICANCj4gLWFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiAgDQo+ICBleGFtcGxlczoNCj4gICAgLSB8DQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRw
My0NCj4gcnN6LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
bWVkaWF0ZWssbWRwMy0NCj4gcnN6LnlhbWwNCj4gaW5kZXggZjU2NzZiZWM0MzI2Li40Nzc0ZmRk
ZTFhMWIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sDQo+IEBAIC0zOCwxMyAr
MzgsNiBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgNCBhcmd1bWVudHMgZGVmaW5lZCBpbiB0aGlz
IHByb3BlcnR5LiBFYWNoIEdDRSBzdWJzeXMgaWQgaXMNCj4gbWFwcGluZyB0bw0KPiAgICAgICAg
YSBjbGllbnQgZGVmaW5lZCBpbiB0aGUgaGVhZGVyIGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLzxj
aGlwPi0NCj4gZ2NlLmguDQo+ICANCj4gLSAgbWVkaWF0ZWssZ2NlLWV2ZW50czoNCj4gLSAgICBk
ZXNjcmlwdGlvbjoNCj4gLSAgICAgIFRoZSBldmVudCBpZCB3aGljaCBpcyBtYXBwaW5nIHRvIHRo
ZSBzcGVjaWZpYyBoYXJkd2FyZSBldmVudA0KPiBzaWduYWwNCj4gLSAgICAgIHRvIGdjZS4gVGhl
IGV2ZW50IGlkIGlzIGRlZmluZWQgaW4gdGhlIGdjZSBoZWFkZXINCj4gLSAgICAgIGluY2x1ZGUv
ZHQtYmluZGluZ3MvZ2NlLzxjaGlwPi1nY2UuaCBvZiBlYWNoIGNoaXBzLg0KPiAtICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQ0KPiAtDQo+ICAg
IGNsb2NrczoNCj4gICAgICBtaW5JdGVtczogMQ0KPiAgDQo+IEBAIC01NSw3ICs0OCwxMCBAQCBy
ZXF1aXJlZDoNCj4gICAgLSBtZWRpYXRlayxnY2UtZXZlbnRzDQo+ICAgIC0gY2xvY2tzDQo+ICAN
Cj4gLWFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArYWxsT2Y6DQo+ICsgIC0gJHJlZjog
L3NjaGVtYXMvbWFpbGJveC9tZWRpYXRlayxnY2UtcHJvcHMueWFtbA0KPiArDQo+ICt1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ICANCj4gIGV4YW1wbGVzOg0KPiAgICAtIHwNCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRl
ayxtZHAzLQ0KPiB3cm90LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gd3JvdC55YW1sDQo+IGluZGV4IDUzYTY3OTMzODQwMi4u
YTMxZjNmNWFlYTk2IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy13cm90LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd3JvdC55YW1sDQo+IEBA
IC0zOCwxMyArMzgsNiBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgNCBhcmd1bWVudHMgZGVmaW5l
ZCBpbiB0aGlzIHByb3BlcnR5LiBFYWNoIEdDRSBzdWJzeXMgaWQgaXMNCj4gbWFwcGluZyB0bw0K
PiAgICAgICAgYSBjbGllbnQgZGVmaW5lZCBpbiB0aGUgaGVhZGVyIGluY2x1ZGUvZHQtYmluZGlu
Z3MvZ2NlLzxjaGlwPi0NCj4gZ2NlLmguDQo+ICANCj4gLSAgbWVkaWF0ZWssZ2NlLWV2ZW50czoN
Cj4gLSAgICBkZXNjcmlwdGlvbjoNCj4gLSAgICAgIFRoZSBldmVudCBpZCB3aGljaCBpcyBtYXBw
aW5nIHRvIHRoZSBzcGVjaWZpYyBoYXJkd2FyZSBldmVudA0KPiBzaWduYWwNCj4gLSAgICAgIHRv
IGdjZS4gVGhlIGV2ZW50IGlkIGlzIGRlZmluZWQgaW4gdGhlIGdjZSBoZWFkZXINCj4gLSAgICAg
IGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLzxjaGlwPi1nY2UuaCBvZiBlYWNoIGNoaXBzLg0KPiAt
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQ0K
PiAtDQo+ICAgIHBvd2VyLWRvbWFpbnM6DQo+ICAgICAgbWF4SXRlbXM6IDENCj4gIA0KPiBAQCAt
NjcsNyArNjAsMTAgQEAgcmVxdWlyZWQ6DQo+ICAgIC0gaW9tbXVzDQo+ICAgIC0gJyNkbWEtY2Vs
bHMnDQo+ICANCj4gLWFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArYWxsT2Y6DQo+ICsg
IC0gJHJlZjogL3NjaGVtYXMvbWFpbGJveC9tZWRpYXRlayxnY2UtcHJvcHMueWFtbA0KPiArDQo+
ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ICANCj4gIGV4YW1wbGVzOg0KPiAgICAt
IHwNCg==

