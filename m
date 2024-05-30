Return-Path: <linux-media+bounces-12257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49328D4FD8
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 18:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA30C286180
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 16:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169102376A;
	Thu, 30 May 2024 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZKY7SRrn";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OSgogXOF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B21C6AA1;
	Thu, 30 May 2024 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717086599; cv=fail; b=jOZwhYvfbEx5szXiQJ08dkXWqy4BC8EN9Bt1l1/yNIrALeKaXH9S+GqsIqOu1alazLxMJQfoCjpLzCcY1qkb0UClTeGe7+rZ6d4yTF3pQS5QutcoRdu08R4d47dN54mvjvQFzbzwBaJnEWD4I9G8JUArIdY5qyyqUdFLCDyzx00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717086599; c=relaxed/simple;
	bh=WUJstJ9qX5ZrUtN4CZyeArwarBKyrfS5GQeWBENMscM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GA2ztUhPouG0GYjM2YWRFb/9qOzm6tXcXWUw4ZSTh5JtqRyJ3qSZL8ybNHaarLK2xaPigOaiWip/ythhkEsRdqdKESBAEQB33CtPYUJPXH/sBNRx49jVK5FtHdS0OlKpCeWROwkXwKFlHy9NsSa3fLb7l0juWwmbd0aDlinkZaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZKY7SRrn; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=OSgogXOF; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d6db35bc1ea111efbfff99f2466cf0b4-20240531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=WUJstJ9qX5ZrUtN4CZyeArwarBKyrfS5GQeWBENMscM=;
	b=ZKY7SRrnbByAB+s7Yt7bTptB2rCeVnyILMxN76xb8/vaiYyysU0GeDHwGZoiZWGpgP8pdrMvXNeMqgglDDHowDOynmywrFHTQYqQyQ2E+5XBsYCgV6WghGJKnS/EcrKVk3aaZ65XN7BRZeVyy1zHT63xVV7DmcRz7LknyVbr0ug=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:a69cce9e-3214-4824-8ffb-06363b4f1525,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:31686b93-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d6db35bc1ea111efbfff99f2466cf0b4-20240531
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 723291718; Fri, 31 May 2024 00:29:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 31 May 2024 00:29:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 31 May 2024 00:29:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTuEQx0vXuQ9Q0ocpBy+qsRQtHL/V2HYXtCtF+Ye0npBjjJNvmSXbQYooN3dW0DM0h+jM/fIMRPj/rzDVk/waBa6039QU2LhBS0cjCQddzgkbjNFx2OgQbfXzk9fCMrce6WLwe0yyIeTZaA+472w34BVXxdFg1UGATVJX6dR8l0/wiIhkY48onoHWUpLIe2iAoL0WOMn2YmzQ1L5mLoxao6S/wix12iy4xnNk/JlRzJhR7TqCfiGxji19pSp4jnC8iRTGw/HoJm84nmNOX0y9sd+zdA2CI9XtSaQ51wNRIiwwtocwso0KhR9tCMJcSkp7xIzREARSerU+rqm3CCkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUJstJ9qX5ZrUtN4CZyeArwarBKyrfS5GQeWBENMscM=;
 b=kwmVepDCldY5LzhGhuAlc7QGEbbXeGQWBS8lwKO1F/vVk6abVfx627y6fpTiIShgISajHvjnn//6Nknfw5H/631E7px08YWgev5rb5F6MpwSmcZL+dfpSa5267MsG7tCFywN7TFBVPG8aP7E8sN2JdQZvRURMVy/KjLd3fjLX6jfCw2oLxFhxnBhOOIr5WhMr95zfnRpXwCa/Jz6iO0wua1493/y53blMw1dKjf8SW7xczFqzr/BeLD6IhXdE1vulXObDCz5S4T4BUFqSY6UWaXq79sYcE272oh6LY+maze7Q+ooa5YdKa38CuzxiRPDkj8t3RAFwSd5EleoodJH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUJstJ9qX5ZrUtN4CZyeArwarBKyrfS5GQeWBENMscM=;
 b=OSgogXOFyFmg/dZDdXqTOJKXL+2pH9RAnD/AjIj/C/yLv5Bae7mgPAz3reOIBMA+AN2zVzOMZZn/B7pIaH3SkLENnKk5345NYKuz9rU24jtJ/W74HzqdzMJsIQHMjMMtr1SK03L6NyODgUgwpFxT2fcZlJlcGU9Kk1zOStFcz2g=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7470.apcprd03.prod.outlook.com (2603:1096:101:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Thu, 30 May
 2024 16:29:45 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Thu, 30 May 2024
 16:29:45 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"jason-jh.lin@mediatek.corp-partner.google.com"
	<jason-jh.lin@mediatek.corp-partner.google.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Topic: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Index: AQHarvtlcrCnuWURZEyY7i7vRSJzi7GrIE8AgAEfYoCAA6bygIAAGI2A
Date: Thu, 30 May 2024 16:29:44 +0000
Message-ID: <43db5c0959b387ff049dbd285093b076ed1421fa.camel@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
	 <20240527-determined-sage-piculet-bfec4a@houat>
	 <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
	 <20240530-inventive-nippy-bee-bb6fa6@houat>
In-Reply-To: <20240530-inventive-nippy-bee-bb6fa6@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7470:EE_
x-ms-office365-filtering-correlation-id: f7e8d0d7-20b8-4c82-0c49-08dc80c5b729
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?REZpZDBlVWh2ajlvdnh5YkYzRVdzZnF5eVJHemJ5cXdQaDZPa3RBNENzNnpz?=
 =?utf-8?B?aE8wOGwwZHBTVFo3TkFNdWRxVTdmU2pvc3hjWEdmekFlUTFONDRqSEpoRytP?=
 =?utf-8?B?L09RT0E1V3Z2akJNeUJmS0hpczVDOVlZYTgvak0veXZkdGhUT20rcFNpRlBC?=
 =?utf-8?B?bk9mallyZzh5cTMra1d3d1VaNTRTaW91c2sxUGl5TlhoUEpmcGt4WHRZc285?=
 =?utf-8?B?ZXNaa2hyYWpYQXRXektEMUkvdVVvQm9LRjdNZEYxTjMxYVR2UktSeEoyVFdQ?=
 =?utf-8?B?dnJoeGZxelVzOVhoYndJTGd3cHVhaEFJaHhjbnFjck5QczBNdDlDUWY1Y2sx?=
 =?utf-8?B?NTlYb1JYbjlQOURLT0ZaSHFqWmZrSVpDSHZJS25CZkRBM09DUm1FblZuQkVn?=
 =?utf-8?B?bkpvTDZydy9tcVVQU0J6K2Uyb3J6a240N2ZycFFWU1BOUXErQ0ZlVk1jZWhm?=
 =?utf-8?B?eS9GMXJhUW1neWRaZUQ1SzJ1YmhFL0RERmowVkFFTWxUU0l3aDVNanE4dm5y?=
 =?utf-8?B?MWEvTE1wK0hJUGdHSWhSN21QVUIwbDNpaHlYbzF4WWhhbjU2NUVFTEEzdnAr?=
 =?utf-8?B?bmdxNzh1RXJ2NWpMYVovMjBtRERsaDRFVXl6MHM5MG9IV2xodFJxemhrcUlK?=
 =?utf-8?B?Q05veHIzL3J3eTJIQm45K0tJT0ZXYjV3UTcxVHI3dHQyZ1dYWHA0YUlKWVpJ?=
 =?utf-8?B?Zng3ZlIrU0hpOGM5L3JTekpRY2VUVjJPbnV2MjFQYXJUK3ZYWHl3SUlUamFh?=
 =?utf-8?B?QkZnM1gvZXlJeHVOVzNpcVZJa2lTdSsxZXB5MWFqV2JZNFVtSzdUSjBORVRU?=
 =?utf-8?B?MytLbHpCNjZDci9UazljelJSME1Tc21kQ1hVRU5jTkN2WDd6a0pQeW9Gb3lE?=
 =?utf-8?B?OVEwNDVKN0Z2ZTNYTlJSbjVXYTdYdk0zTkJsQ1dpN0JaT1NIWkhhVzQrUk1F?=
 =?utf-8?B?VzJHQ3lDZy9pWnE1ejFqSUFBVmkrdVNPa0tQR3ZobVpkUFZmd2V3RmwwKzA4?=
 =?utf-8?B?ODlYRlpKd0x0dWZJMlFJMFJqTndKRU0ralB2NUVibnpIOFI1cWY4Y2pYS2dW?=
 =?utf-8?B?c2FxZ1dGWFhEWDhQVjU1UEhIMlc4bVY1dkh1dURVNFE4Q2haZDNTbVdJUGZk?=
 =?utf-8?B?K0x4RDUvUks2bllENk11RGVOVDRJbTMyUGdtbFJ1U252bHZhd25CTWY5M0RJ?=
 =?utf-8?B?bTBtRTlrck0wN2o4OHZQazNzeWdlOE9RdmxHWnRONDJiQzVpSk1oK0ZHR3Yv?=
 =?utf-8?B?bnJWN1hzbWlmZlYyZTU3d0Z0Um1HaFoxWjR6M3hGUTlKQjAyWlZxYTV1QjVP?=
 =?utf-8?B?VWlsVXlnY3dCNGNQaUdLR3RvaThBSFdQT2htU0Rkam5FREhNdFRYa3dOT3hH?=
 =?utf-8?B?L1lDZG9Oa3FJSUR4cXFveVliNzVZWDkzZHo5S3RtcFBBUHdSZ2luSWtVNk5F?=
 =?utf-8?B?T3MyQldYenFGNXQ3UmJqc0ovRDhHaDI5WEF0V1ZBL1FBMGtneEVPajZVSnZu?=
 =?utf-8?B?SzMzVDRWbVdsUitXQjZWTXptaHVKSmdmTEZnd0Jkb05FMHJRRVlSRlg1YzBi?=
 =?utf-8?B?bml3T0FJQjRZdkJ6bnhFUE02L1VZczhkTXFSYmh2Zzl2OHVRblpDV1NHb3VD?=
 =?utf-8?B?RlVsa3NBOTk2VzVOWTBqOVluc0xXWU0zWmZxSURRdlQ2UnRHQTc2MGFLcmRu?=
 =?utf-8?B?VjVGVVV6VXJkeE5jblEwbklsSnU4d2oxZEVPSjRDV0R1L0FtNW1UU1M5Vjcr?=
 =?utf-8?Q?MSckKRwHGpbr7iRbfI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUJ3cm9NeUJtN2hYeGUxR0dLTUxYRzIzSlhTbnVPV3ArSzV3RnJ2aWkvVlQy?=
 =?utf-8?B?dWZSVkxEZVErYis5cDJpT280VGVMbzcwaGl2a2lzTS9yVTBQYkVaSklHSEtH?=
 =?utf-8?B?dm90akhzcnYzalRFWjlacFRTbnQyclFLN3ltWmp6cDA3RENDcDAyWG85R1RE?=
 =?utf-8?B?ZjZDOFZtNHBVNTYzVytmL1R4UDNYQjRIOXlYcWw3NlFrSUQrbDZnSXdlL2lo?=
 =?utf-8?B?MVptdHUrUnIwWmxmeGZUdUZFOHpEd2lkbDY2V09ZRGRJTXhXUWxRZ3hpNjl6?=
 =?utf-8?B?QTgrSnBES1Bqb1hyaWhMYmFSZkJDZmJ1Wm80Q2ZXbWlpclhtRzZncmU4QWNE?=
 =?utf-8?B?QlIwVDBKWFZ4L2hnZmk4YjBUUWZEMlFiYlBiQmtpRWw3ckZEQnBaYU5OcE1v?=
 =?utf-8?B?eWpZUnBML2pMNGN0eFE5OUh2ZVZLR2lmVlJaT2xsY1FRMG9WZk1ncGU1aTJl?=
 =?utf-8?B?N1NOeFUrK1Nvc0ZYN3pUL3BLV0YyZlBzUVFBYVQ4WVFqaDdWWnpQL3lVR1Bq?=
 =?utf-8?B?YXlDUjJIMWhkclRmTjJYV2Q1N3NXWXRnYkJ1QWxXdzBTc2RUT2xLbmQzUTAy?=
 =?utf-8?B?T0tnamNYRVBHT2FtNUROVmZMTzNTNHBCTEdaTFhKOWJkRitVZjV2UDRBQm1r?=
 =?utf-8?B?d2xwd0tRK1gvZTQxbUtkOEdiUXBPL2Rjc29IM2dqYUZSdEJ3ZW94ZDR4YlJ0?=
 =?utf-8?B?ZzVqNHlnMGtmZ0Evc0JsT1FidUFvMTdVZUJRYkRSdEg5RW0weFI4UnErNUpL?=
 =?utf-8?B?YTBGQ1lReDNYSXdVaEQ5UUlrZHlzT1dZNkt3RHRZU1JhSyttK3dJTUxMNTFk?=
 =?utf-8?B?K0U2dE1vaXJ6UXo2YTFNeXMrMkNNbFdzYlVJMEJ3dTlxKytMb1VUOUppQzdG?=
 =?utf-8?B?ZDU2REc3aVFzdjdnTmNVWnZSUjFxVEF4NEVxVWxmRE5XdnY1UnUxc3lySGJk?=
 =?utf-8?B?YWxHWVA4ME5DNlFRa2FoMGlybUNaSktjOGZXTEV5TGFaMitvbFJ6bmovc2FW?=
 =?utf-8?B?aDhjdmFPaWxXbGFxZTB1ZTgyT3p0YzI3UjZld1B6RE00cHN5cDhxbnpKcEJ3?=
 =?utf-8?B?S29ybHhJR3AwUEdUWk1oYUFlcHBOVVJJa2dMTFhEbFlUTTNHR3ZybVhkSVQx?=
 =?utf-8?B?RDJWa3N0TGVNTUJUWXgwSXAxV2VyaklMaFRKdzd0VDFJMy82a0UyU1dNSUJz?=
 =?utf-8?B?WnUrK1A3aXkvZzBadjg2Q2pjOGpjQTNRblRJNG1uNVpTMXZqK1hZaVlKbkxt?=
 =?utf-8?B?WVRveTNvWUdEcHVqbnBOeXN0NEJjLzBzQ0hEcWJTQlBwOVNlMWgwZ29sZUhI?=
 =?utf-8?B?UGhtbm95a3FwcHBycCtHbUt2RFRkRTBNblk5VWxSeHRxMEFHS280MzNYeUhx?=
 =?utf-8?B?dC95QW5YVXF6SVpGamtJOG1qNzFzRHZXbkhJOUczREp6U1U4UXZkTjBENVlZ?=
 =?utf-8?B?NnI3eDEzWW9CR3hNVlhsdG9SK1NFNVFhbEQ5TXB1VU9sdGVsZWNIeGt0a05F?=
 =?utf-8?B?VWt1cnZFekFMaUxvNHpObXhCVG9DbDdjUzRvMDVQREJNdG9ZY3FFZlRTSE1s?=
 =?utf-8?B?WitLRGtpeVBwV1cwRTl0N0N0WUNnREFQMFBPYUhxUHZoODFMK3NoWGdmOFlm?=
 =?utf-8?B?SXFCcmQvbWNUZ0c0ajkyTEc4WDVGTWtQbGtuWHlNOTFUd290emx2YkJlVFBJ?=
 =?utf-8?B?OTl2ZEhWTGlGeVB5eUJrS1ZjUWo0cXlqQTlSd3NtWlcwSXRHVHd2K3I5Zlpq?=
 =?utf-8?B?TGMrMmluV3cvNm1mUzR1ZkhMeXpKYnhiRjFPRkJENDQwRkVEUGdlZ2NOakZC?=
 =?utf-8?B?TkZ5V29RWmQzVUgwbjdyWStvTG13OWFPZ3gyZHZ3U1hHVDRUaVFuN3Q2Y0ZZ?=
 =?utf-8?B?NGF0dFpWb29rd0RrdktNSTVmTERqVld2ZHNpN1VhckhvTzc5aFE2YjhlWmhD?=
 =?utf-8?B?NHljei9rTzEwYXltV2ZIeWdrdnJXcldKU2FaQjdCd3ZIRzJjZHBRQVlWZEh4?=
 =?utf-8?B?eEY4SUpMd3FWZ1RzOTFlOFAzaWx1Q1NuZ3J3TlFTNGl5UC80N1VpdnIzZHh1?=
 =?utf-8?B?SzdwZmkwWXFCRjZCeTJSV2Y5ay92YXZRMXRnVXBIRHJvQ3kvaHh2UWZxdXdD?=
 =?utf-8?B?Qi96SHlLdzFkQy9ZL0VwaW8rOEk3QmZmVzdoZGsxRDZPRG5yenNGcFZjVllj?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBFF02052F33E94BB92760DD13221337@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e8d0d7-20b8-4c82-0c49-08dc80c5b729
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 16:29:44.8996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDo/+gkwJs3RFZUJKmnE2kSpomAm1URSmw296+yp70SjpuslmSVCFCzUWkp7wf2djXrecoZbqLf1uWpmy4RloxmGqnjUm8ysKCLWumVZric=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7470

SGkgTWF4aW1lLA0KDQpPbiBUaHUsIDIwMjQtMDUtMzAgYXQgMTc6MDEgKzAyMDAsIG1yaXBhcmRA
a2VybmVsLm9yZyB3cm90ZToNCj4gT24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgMDc6MTU6MzRBTSBH
TVQsIEphc29uLUpIIExpbiAo5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBNYXhpbWUsDQo+ID4g
DQo+ID4gT24gTW9uLCAyMDI0LTA1LTI3IGF0IDE2OjA2ICswMjAwLCBNYXhpbWUgUmlwYXJkIHdy
b3RlOg0KPiA+ID4gSGksDQo+ID4gPiANCj4gPiA+IE9uIFN1biwgTWF5IDI2LCAyMDI0IGF0IDA3
OjI5OjIxQU0gR01ULCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gPiA+IEZyb206IEphc29uLWpo
IExpbiA8DQo+ID4gPiA+IGphc29uLWpoLmxpbkBtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xl
LmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IE1lbW9yeSBEZWZpbml0aW9uczoNCj4gPiA+ID4gc2Vj
dXJlIG1lbW9yeSAtIE1lbW9yeSBhbGxvY2F0ZWQgaW4gdGhlIFRFRSAoVHJ1c3RlZCBFeGVjdXRp
b24NCj4gPiA+ID4gRW52aXJvbm1lbnQpIHdoaWNoIGlzIGluYWNjZXNzaWJsZSBpbiB0aGUgUkVF
IChSaWNoIEV4ZWN1dGlvbg0KPiA+ID4gPiBFbnZpcm9ubWVudCwgaS5lLiBsaW51eCBrZXJuZWwv
dXNlcnNwYWNlKS4NCj4gPiA+ID4gc2VjdXJlIGhhbmRsZSAtIEludGVnZXIgdmFsdWUgd2hpY2gg
YWN0cyBhcyByZWZlcmVuY2UgdG8NCj4gPiA+ID4gJ3NlY3VyZQ0KPiA+ID4gPiBtZW1vcnknLiBV
c2VkIGluIGNvbW11bmljYXRpb24gYmV0d2VlbiBURUUgYW5kIFJFRSB0byByZWZlcmVuY2UNCj4g
PiA+ID4gJ3NlY3VyZSBtZW1vcnknLg0KPiA+ID4gPiBzZWN1cmUgYnVmZmVyIC0gJ3NlY3VyZSBt
ZW1vcnknIHRoYXQgaXMgdXNlZCB0byBzdG9yZQ0KPiA+ID4gPiBkZWNyeXB0ZWQsDQo+ID4gPiA+
IGNvbXByZXNzZWQgdmlkZW8gb3IgZm9yIG90aGVyIGdlbmVyYWwgcHVycG9zZXMgaW4gdGhlIFRF
RS4NCj4gPiA+ID4gc2VjdXJlIHN1cmZhY2UgLSAnc2VjdXJlIG1lbW9yeScgdGhhdCBpcyB1c2Vk
IHRvIHN0b3JlIGdyYXBoaWMNCj4gPiA+ID4gYnVmZmVycy4NCj4gPiA+ID4gDQo+ID4gPiA+IE1l
bW9yeSBVc2FnZSBpbiBTVlA6DQo+ID4gPiA+IFRoZSBvdmVyYWxsIGZsb3cgb2YgU1ZQIHN0YXJ0
cyB3aXRoIGVuY3J5cHRlZCB2aWRlbyBjb21pbmcgaW4NCj4gPiA+ID4gZnJvbQ0KPiA+ID4gPiBh
bg0KPiA+ID4gPiBvdXRzaWRlIHNvdXJjZSBpbnRvIHRoZSBSRUUuIFRoZSBSRUUgd2lsbCB0aGVu
IGFsbG9jYXRlIGENCj4gPiA+ID4gJ3NlY3VyZQ0KPiA+ID4gPiBidWZmZXInIGFuZCBzZW5kIHRo
ZSBjb3JyZXNwb25kaW5nICdzZWN1cmUgaGFuZGxlJyBhbG9uZyB3aXRoDQo+ID4gPiA+IHRoZQ0K
PiA+ID4gPiBlbmNyeXB0ZWQsIGNvbXByZXNzZWQgdmlkZW8gZGF0YSB0byB0aGUgVEVFLiBUaGUg
VEVFIHdpbGwgdGhlbg0KPiA+ID4gPiBkZWNyeXB0DQo+ID4gPiA+IHRoZSB2aWRlbyBhbmQgc3Rv
cmUgdGhlIHJlc3VsdCBpbiB0aGUgJ3NlY3VyZSBidWZmZXInLiBUaGUgUkVFDQo+ID4gPiA+IHdp
bGwNCj4gPiA+ID4gdGhlbiBhbGxvY2F0ZSBhICdzZWN1cmUgc3VyZmFjZScuIFRoZSBSRUUgd2ls
bCBwYXNzIHRoZSAnc2VjdXJlDQo+ID4gPiA+IGhhbmRsZXMnIGZvciBib3RoIHRoZSAnc2VjdXJl
IGJ1ZmZlcicgYW5kICdzZWN1cmUgc3VyZmFjZScgaW50bw0KPiA+ID4gPiB0aGUNCj4gPiA+ID4g
VEVFIGZvciB2aWRlbyBkZWNvZGluZy4gVGhlIHZpZGVvIGRlY29kZXIgSFcgd2lsbCB0aGVuIGRl
Y29kZQ0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gY29udGVudHMgb2YgdGhlICdzZWN1cmUgYnVmZmVy
JyBhbmQgcGxhY2UgdGhlIHJlc3VsdCBpbiB0aGUNCj4gPiA+ID4gJ3NlY3VyZQ0KPiA+ID4gPiBz
dXJmYWNlJy4gVGhlIFJFRSB3aWxsIHRoZW4gYXR0YWNoIHRoZSAnc2VjdXJlIHN1cmZhY2UnIHRv
IHRoZQ0KPiA+ID4gPiBvdmVybGF5DQo+ID4gPiA+IHBsYW5lIGZvciByZW5kZXJpbmcgb2YgdGhl
IHZpZGVvLg0KPiA+ID4gPiANCj4gPiA+ID4gRXZlcnl0aGluZyByZWxhdGluZyB0byBlbnN1cmlu
ZyBzZWN1cml0eSBvZiB0aGUgYWN0dWFsIGNvbnRlbnRzDQo+ID4gPiA+IG9mDQo+ID4gPiA+IHRo
ZQ0KPiA+ID4gPiAnc2VjdXJlIGJ1ZmZlcicgYW5kICdzZWN1cmUgc3VyZmFjZScgaXMgb3V0IG9m
IHNjb3BlIGZvciB0aGUNCj4gPiA+ID4gUkVFDQo+ID4gPiA+IGFuZA0KPiA+ID4gPiBpcyB0aGUg
cmVzcG9uc2liaWxpdHkgb2YgdGhlIFRFRS4NCj4gPiA+ID4gDQo+ID4gPiA+IERSTSBkcml2ZXIg
aGFuZGxlcyBhbGxvY2F0aW9uIG9mIGdlbSBvYmplY3RzIHRoYXQgYXJlIGJhY2tlZCBieQ0KPiA+
ID4gPiBhDQo+ID4gPiA+ICdzZWN1cmUNCj4gPiA+ID4gc3VyZmFjZScgYW5kIGZvciBkaXNwbGF5
aW5nIGEgJ3NlY3VyZSBzdXJmYWNlJyBvbiB0aGUgb3ZlcmxheQ0KPiA+ID4gPiBwbGFuZS4NCj4g
PiA+ID4gVGhpcyBpbnRyb2R1Y2VzIGEgbmV3IGZsYWcgZm9yIG9iamVjdCBjcmVhdGlvbiBjYWxs
ZWQNCj4gPiA+ID4gRFJNX01US19HRU1fQ1JFQVRFX1JFU1RSSUNURUQgd2hpY2ggaW5kaWNhdGVz
IGl0IHNob3VsZCBiZSBhDQo+ID4gPiA+ICdzZWN1cmUNCj4gPiA+ID4gc3VyZmFjZScuIEFsbCBj
aGFuZ2VzIGhlcmUgYXJlIGluIE1lZGlhVGVrIHNwZWNpZmljIGNvZGUuDQo+ID4gPiA+IC0tLQ0K
PiA+ID4gPiBUT0RPOg0KPiA+ID4gPiAxKSBEcm9wIE1US19EUk1fSU9DVExfR0VNX0NSRUFURSBh
bmQgdXNlIERNQV9IRUFQX0lPQ1RMX0FMTE9DDQo+ID4gPiA+IGluDQo+ID4gPiA+IHVzZXJzcGFj
ZQ0KPiA+ID4gPiAyKSBEUk0gZHJpdmVyIHVzZSBzZWN1cmUgbWFpbGJveCBjaGFubmVsIHRvIGhh
bmRsZSBub3JtYWwgYW5kDQo+ID4gPiA+IHNlY3VyZSBmbG93DQo+ID4gPiA+IDMpIEltcGxlbWVu
dCBzZXR0aW5nIG1tc3lzIHJvdXRpbmcgdGFibGUgaW4gdGhlIHNlY3VyZSB3b3JsZA0KPiA+ID4g
PiBzZXJpZXMNCj4gPiA+IA0KPiA+ID4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4g
V2h5IGFyZSB5b3UgdHJ5aW5nIHRvIHVwc3RyZWFtDQo+ID4gPiBzb21ldGhpbmcgdGhhdCBzdGls
bCBuZWVkcyB0byBiZSByZW1vdmVkIGZyb20geW91ciBwYXRjaCBzZXJpZXM/DQo+ID4gPiANCj4g
PiANCj4gPiBCZWNhdXNlIHRoZWlyIGlzIHRvbyBtdWNoIHBhdGNoZXMgbmVlZCB0byBiZSBmaXhl
ZCBpbiB0aGlzIHNlcmllcywNCj4gPiBzbyBJDQo+ID4gbGlzdCBkb3duIHRoZSByZW1haW5pbmcg
VE9ETyBpdGVtcyBhbmQgc2VuZCB0byByZXZpZXcgZm9yIHRoZSBvdGhlcg0KPiA+IHBhdGNoZXMu
DQo+ID4gDQo+ID4gU29ycnkgZm9yIHRoZSBib3RoZXJpbmcsIEknbGwgZHJvcCB0aGlzIGF0IHRo
ZSBuZXh0IHZlcnNpb24uDQo+IA0KPiBJZiB5b3UgZG9uJ3QgaW50ZW5kIHRvIHVzZSBpdCwgd2Ug
anVzdCBzaG91bGRuJ3QgYWRkIGl0LiBSZW1vdmluZyB0aGUNCj4gVE9ETyBpdGVtIGRvZXNuJ3Qg
bWFrZSBzZW5zZSwgZXZlbiBtb3JlIHNvIGlmIGhlYXBzIHNob3VsZCBiZSB0aGUgd2F5DQo+IHlv
dSBoYW5kbGUgdGhpcy4NCj4gDQpTb3JyeSBmb3IgdGhpcyBtaXN1bmRlcnN0YW5kaW5nLg0KDQpJ
IG1lYW4gSSdsbCByZW1vdmUgdGhlIERSTV9JT0NUTF9HRU1fQ1JFQVRFIHBhdGNoIGFuZCB0aGVu
IGNoYW5nZSB1c2VyDQpzcGFjZSBjYWxsaW5nIERNQV9IRUFQX0lPQ1RMX0FMTE9DIHRvIGFsbG9j
YXRlIGJ1ZmZlciBmcm9tIHNlY3VyZSBoZWFwLg0KDQo+ID4gPiBBbHNvLCBJIG1hZGUgc29tZSBj
b21tZW50cyBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiB0aGF0IGhhdmUgYmVlbg0KPiA+ID4gZW50
aXJlbHkgaWdub3JlZCBhbmQgc3RpbGwgYXBwbHkgb24gdGhpcyB2ZXJzaW9uOg0KPiA+ID4gDQo+
ID4gDQo+ID4gDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNDA0MTUtZ3Vw
cHktb2YtcGVycGV0dWFsLWN1cnJlbnQtM2E3OTc0QGhvdWF0Lw0KPiA+ID4gDQo+ID4gDQo+ID4g
SSBsb3N0IHRoYXQgbWFpbCBpbiBteSBtYWlsYm94LCBzbyBJIGRpZG4ndCByZXBseSBhdCB0aGF0
IHRpbWUuDQo+ID4gSSBoYXZlIGltcG9ydGVkIHRoYXQgbWFpbCBhbmQgcmVwbGllZCB0byB5b3Uu
IEhvcGUgeW91IGRvbid0IG1pbmQNCj4gPiA6KQ0KPiANCj4gSSBoYXZlbid0IHJlY2VpdmVkIHRo
YXQgYW5zd2VyDQoNCkkgZG9uJ3Qga25vdyB3aHkgaXQgZG9lc24ndCBzaG93IHVwIGF0IHlvdXIg
bGluay4NCg0KQ291bGQgeW91IHNlZSBpdCBoZXJlPw0KDQpodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA0MDMxMDI3MDEuMzY5LTMt
c2hhd24uc3VuZ0BtZWRpYXRlay5jb20vDQoNCg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQo+
IA0KPiBNYXhpbWUNCg==

