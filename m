Return-Path: <linux-media+bounces-13173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1B9068A8
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 322C8B25486
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622D13E888;
	Thu, 13 Jun 2024 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JrfGPvn6";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WzB7XBDO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7DC13E038;
	Thu, 13 Jun 2024 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270913; cv=fail; b=pEemPiDsV48v+GlmKegE/QXUq6DjpeCj6OlQS9h6aQpWsnP+AxZ142k3SHcuy1o6JryH9m9Cl124Bnk4N9yb/Z+ASbJicHMnnbFKF/oP5KElLTGMcSw/SP7HEhPvu/wvpBn98cooiRVp/uvHbrMFIgQRIKDKOOWM+lw/hld8I5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270913; c=relaxed/simple;
	bh=c/bvd+wMxy+/QbDEqTfdoMHoaNgfclIQqQu8C2ycoZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TfCkIzX5Lf5opkFNMFdP44wGzgkStGZ8A+5zWMLzjdds1WQciweayR3W0pu5w4vLBPTZtCGlP7WHA9TNy8rolrshP1VA02ICo2I5BkuMg+1vLnLUEfnNUX3/M7OTMSfWblDe1iEq909klmnBbZ3Qu1oS0e31VAE7WcjKey7/hJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JrfGPvn6; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WzB7XBDO; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 469a1dee296711efa22eafcdcd04c131-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=c/bvd+wMxy+/QbDEqTfdoMHoaNgfclIQqQu8C2ycoZ4=;
	b=JrfGPvn60+RR3/zKsap5JA7zRnyoOrJh6Bp3bdE+CqAtt0CW7htKZTWjHj2sUUzENTyQbl1b0q68amwyBPnxOHhO1fS+shCBBW+csNswksM94BdutHjzIpjzjJU7N0GFrP+OM7gr94gFJgvVsTT2RmrGhSFyFZN9M+CAK2vLURk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:1c2b973c-6c3f-4579-afe2-13f8ebff29ff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:60fd0a85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 469a1dee296711efa22eafcdcd04c131-20240613
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2080084230; Thu, 13 Jun 2024 17:28:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 17:28:19 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 17:28:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDgUmKPmjI6jbGBvHIBJssr4s4RuilMyWvYdqXbSbPW7bepztNfTTe3zWgl8SuILt+UC3HevkNeg37qP55XdjXEX0nHaPF4vnm9VMNAQLOc0oV6np/VX1hrmM9v6ljyYSCchu0iyBgdTgftAbBdMtr8zMRXHvolmEeH/jvOgRyMfCLMTSWTkrrXu0gy6HGbvhkHo9jwqBnUXd3aJ1G5x9riApGjzSQeY51IHZhaaE1Ocrf78wLq0xelRTjaLweSdNcjM97bTKwwjWJJzJqoXWGGEUHy8ourhLkE5K47XJ4Ng2POeEPE0PJT53b+JhZJf5IX/ru9/wmcjgdqSi3I8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/bvd+wMxy+/QbDEqTfdoMHoaNgfclIQqQu8C2ycoZ4=;
 b=Wut+NLN/qKnAQ+46EW9kN0PHUJ0Y5EEEo8qo/wV2PFPjDXIE8xAs+MGa6m1N7AlwtQxea9ceXIezNmro51jgNr624iyAjgDyBvKGIBIM9PSFI2oRd5Wu564rEOsFZIFp/GUNOybTIvwY/evlyNPrOFIw1ZXvmj8FQL8dEiiAN797O2U1V4EwJ6egBO1Y9Jbd4jP/Be2lAJZ4j0efkJ9hRYJBznKVRq19Lm3MY48w3lFN6YqJqPMPZv4s6Ab0eGMiRqw8lee+WXNjaZsRtZMF1pmT6ujhpQZw8UubIuP0vLEVgZ6qCW3YESyDB8ppvQZ92wD1DTHXzkoavWMWbLGXbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/bvd+wMxy+/QbDEqTfdoMHoaNgfclIQqQu8C2ycoZ4=;
 b=WzB7XBDOnG5OGIrAmHbmvDLvtc+C3gbhQoIt1XVmmniiTFsAZL+jS43Z8bELXMOIfZuKWcZiMB6V1nj7wqrSCGRQZ0O5aKDSI9t7/NRonO4AjJRl8aDzCCI1Ua2wjhJkq7sAHzss01lk/+welh4nc93MOPHYNJXSTd6GX8x3jEg=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by KL1PR03MB8799.apcprd03.prod.outlook.com (2603:1096:820:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 09:28:13 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.021; Thu, 13 Jun 2024
 09:28:13 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "andrzej.p@collabora.com" <andrzej.p@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [PATCH 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
Thread-Topic: [PATCH 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
Thread-Index: AQHaavWfoJ/oW9t8PkCrph5H3rWpH7FU8JWAgAEsMACAWKGMgIAXU8kA
Date: Thu, 13 Jun 2024 09:28:13 +0000
Message-ID: <65288fe9501236eaf4296f5841ca2d834d96c303.camel@mediatek.com>
References: <20240229095611.6698-1-yunfei.dong@mediatek.com>
	 <20240229095611.6698-2-yunfei.dong@mediatek.com>
	 <4949bd54-8c32-4490-ab19-d38796d29ac1@collabora.com>
	 <9ba79ccf849054974a937d1d605910cf4c8552d6.camel@mediatek.com>
	 <8a007787-c648-4ae3-829f-7a0b17dd9a89@collabora.com>
In-Reply-To: <8a007787-c648-4ae3-829f-7a0b17dd9a89@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|KL1PR03MB8799:EE_
x-ms-office365-filtering-correlation-id: 51d06e7e-c17a-43b8-c81a-08dc8b8b2628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230034|376008|1800799018|366010|7416008|38070700012;
x-microsoft-antispam-message-info: =?utf-8?B?SjY0RGxwYlhCbm11K1FSU05kV3V1Zjhwb05UMkF0MGFiemdlSk1YcnVqbUU2?=
 =?utf-8?B?N1A5WWc4N1cxenMwbys2OXNVZitHZS9BMjhqc09LdkU1RDBWSlh5SEkzZUVN?=
 =?utf-8?B?NEgzTWpaRmVCM1habGxFY01LdnVhYVFQaVNTVmhhbVR6Qkk0YmE1KzBzVlBP?=
 =?utf-8?B?dUprNk50bW1vazhLTTc1MmZoMXI2MW9TNGxRZnRIQlJwZnVETTVGWndqTWpT?=
 =?utf-8?B?eHdUU1pKT1NHY0o0bDZkK1VsVEh3dm5ZTTQ3VDV2ZXJ0TklMVEZYRm56eG1J?=
 =?utf-8?B?WFBzczVFMjFBV3JlaEtwdEhmWkhEQWhyZWFCam5ITGhmcitZYkFXN0p2RTZx?=
 =?utf-8?B?R29iN3dMUGxHS2dXWVZSamFUVzNPcGgvdklUYUVPQUVPNU14Q0pTUERHYmJu?=
 =?utf-8?B?ajYwUlBITEQvNS92MWNrVmF2TzloM2VLbHlUcW80KzRZU0tOb254Nzdob3BD?=
 =?utf-8?B?aXhiNjR2YnJpdjl6ZmM5dU1qbXhNZWZyTUlqa3JXL250RkQyS2FrbE9xZTh2?=
 =?utf-8?B?S2NSWUErRGs5T0lyekhsbDRBcW1JYlVxTlNaMWNBSlprdjgxOVFkY1FIb3Y0?=
 =?utf-8?B?QkJ2WmdnTnJjRnB2YVdFS0JUbThWRE9GdVNJbThUUDFGSXlIVEtESWNSS3VV?=
 =?utf-8?B?TVkxZUpjMy9ydkpuMmNZVlN6QlNnNjhRZURSYUdvMlkxVWc5NkNHbm9HN2xU?=
 =?utf-8?B?c3pHZEQxSW9YOC9ySm9XbzZaVUtGY0c2bExJekFTTU9aY2xsS1BFVXJBUEZ2?=
 =?utf-8?B?am40YmZKbXlWb2FnNDB3WTlTZHlDYWd2Z21Mc3VCMXlrMzRCRkh6S085c0dH?=
 =?utf-8?B?V0tlV25Hd3NWWE01WUpGNVRRK1NYNWR5Q05RY3dlTkR0Z3NncHBzVTVrMnlq?=
 =?utf-8?B?SDVhUUxTVWs5STY5bnc1WVhJUExXeWdGM1FmZ2JsNkxGZW9zbC9rNjFyMXR6?=
 =?utf-8?B?cEtMV0pvazRZbHUvaStCOVczSStjNmdOSW92aDhDZU1PM2xScmVxWEhQWVVF?=
 =?utf-8?B?ZmNDMVpJMGMrYjNYeDkvcHZVeEZyOFVad2ZhRVlydm8wbmV5NHdEOU81c0hs?=
 =?utf-8?B?a1U1clpyUDZwWFZ1d0VsMUNXZVBoTklTM1Y5L0lRWTNnQ2d5SURBRldYNVdF?=
 =?utf-8?B?UWNtU2FlbmVuTzNwSVdkNmVKYklYNmp0eitBZm43dUUyanB0STJFckwrR3lp?=
 =?utf-8?B?Z2pFWFEvSGpYWStFMG9IZFV1QURuTTJiUzBMNlc1U042b2JuVFpkOEdpc0tQ?=
 =?utf-8?B?eHg1Rkx5RC8xUGFoSWlhbzg2RTI1OStSaXpVUktHYmZSSFNmZWNEY3JYZ2Qx?=
 =?utf-8?B?YkF1SmNFaWxGMm8yMW9GY0tuTnhIUG5oQUIxdElqQkUzZnBPdFIvUDhmeS9G?=
 =?utf-8?B?UllpSVVWUU85QnhaK0ZMSklpWERyUERMOUFwTXdwT3pQcXpIRVZJNGlIdEJx?=
 =?utf-8?B?TlRXNG1sbzVvazE2OHhEaDNucmZZZ0d6SFRUa0Nxc3QzNTJVQ0crZGw3RVN1?=
 =?utf-8?B?MldwRURXWW1PdHlTTG1rcWtVK2o4aHh2bWdIRm1VZnQxcmlBWUhoNHltMStZ?=
 =?utf-8?B?M1NVa3NYaE9TS01sd2h4Yjl6cHV2aVd5RGtPYzErYjRYT2hteHcvRTVrby9G?=
 =?utf-8?B?cXFpOGtDemg3K1g4R1NBUFlNMmloZmpJMTM2TXJLMDc4NG1aSEtrRkhscEky?=
 =?utf-8?B?QjVVVzNCQmdaOGhFbXN0ZmlwSzZaUno4N012V0ZkTkxmdkNxTVh5T0lyZndF?=
 =?utf-8?B?U1h1WFB1SXpvNzFnUWxVeUx2R0xoOThqbWVGKzNuK1VkM2F6R1FsMGtBN055?=
 =?utf-8?Q?IgD+C1nvbEVz2VLTlTThCaKpzVRfqeRDB9NWE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010)(7416008)(38070700012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkQxM2FMLzN0WmVXV1ZoWFZrTEZDMDYwZWM2L3hTUnF1MFFyN3MzdytxL21p?=
 =?utf-8?B?NlQwMk9EOWYwQytlWDJOazhscFNsU3ZKOXRWSld4NHpkWEc2NTYxNklFczNN?=
 =?utf-8?B?S2NVdHlXdmRlSmxtcWo5Z1A3aXZVdjBUSkQ3OXdjUWhqblJSdmlmMEswVFh5?=
 =?utf-8?B?YWN6MnpyVERaNXNSZXZSWThSYytYK0RFSzYxYVNURzk2UzhtOTZtV3JBTCtU?=
 =?utf-8?B?dzNPQlRqTllBSjFtZmNEa2kwb1hYanU1ejg0M2RWcXZLVTduWHBJalJya1dY?=
 =?utf-8?B?bXc1WnFNMmdNQyszY3FPTW5LN2dEajFhc1dIRTdYUVpaaUJHQklENXl0ekJv?=
 =?utf-8?B?NFBSZytTSmtQcjB6MFJDczI1RDdKZXA3TG9WUU1SNDJhODBUZk5IcVpsbm5S?=
 =?utf-8?B?bXkvaHVQZVgvZ0NLbzVmQi9vQ0QzWk5rdTJMSlNQTC9uSXdLQW56ZG5vMHlu?=
 =?utf-8?B?SVFOL2hBamhUMlcwNjgvVGsyWUw0YWlkVlVzMFFqalZuTVpaTXlEcTRVUzRr?=
 =?utf-8?B?d1lKZVBzLzhLT2tSakI5ZGs3MExaS1FCazR0dC95VGhpWHRqOXJxZGFYT2l2?=
 =?utf-8?B?UzZwbHFlRTNaYWZlMGg3OSt3NThnSFFYT3JLZFJkWEJWOVZENW5GOWpCRVBi?=
 =?utf-8?B?RW55Y3lmNEdFVE9jUHBSbDJ1bCtCSzVDV3FLUHdZMmgyVVFFM0c4T0tTSTVU?=
 =?utf-8?B?a1JCNVhySG5qdFNUcm1vL1JBRmpmMEtuQyt1UHFFUGdXamtrbmliUVlBZkY2?=
 =?utf-8?B?Ukx6QVJMaXhBTDNoNVVTc1FDZ1ZjZmVod21OS3ZVb1BBeUpvSHpwcUtWQ3dt?=
 =?utf-8?B?Q0ZhNnpCNHpIWldSM3lwR1pjcEppQzk1VzVpMXlXcUxYN3dXMy9KdUZrL1R1?=
 =?utf-8?B?bjBJTzNOdjhYeWhheHZYUTFTbXRicVZKR2dBaEhEVHVlN200aU1DbzE1bllo?=
 =?utf-8?B?emM3TWdIRVJXWFBsTUkrbHNFYzNQSEc1TTJxeFdxY3NaSXN6L0tQcjEyMmhx?=
 =?utf-8?B?MWRaYUw3dThVTlNFc29jaGc0U1ZleFRWcUwyZlJZUjREaTNyNnJXaWlhL1VH?=
 =?utf-8?B?azhmNUV2VEtQMFdtRnZQeDNJN21aK3NtNDNFU2UybFFEd25ITVhCeXY0L25j?=
 =?utf-8?B?dDBCU0FHMnh3K3N3bDVFOS9yMVlOTVBReTF1cm1qSFdPbGs0Zkh4QWJqT1Bj?=
 =?utf-8?B?Tm5Ecm96OU5XM1RkRXpBclZ1NWZFVytaTXpjZStmSFUrUWVBcUYrVjRTalFo?=
 =?utf-8?B?ak51dUdnc3IxZWtIa1F5NHdSdUtZMVdLTnh3aDhlaEwrNHBPblVQWU50Vmxs?=
 =?utf-8?B?L1o3YVJvMDlxa0FaSUFEa29BRStwVHpsWjc2Q2dsVFNYamM4NzViWGZuSThB?=
 =?utf-8?B?dnNianpwOXFxaXQ5bFVkQlVxdTZlYU1nRVVPWHNrdXdlcEFxK2JWaER4ZGdm?=
 =?utf-8?B?NlVabHovYTBwS2EySEZPWS85ZUE0WVF0SXdtUXM2QjV0K0dqc05jaHByVSsz?=
 =?utf-8?B?YzN5b2pmTVV5ZGxjUVZMaWdhb1MrUGxvcXpXMlkzWXFCN0RMVXFrWjg3UE8v?=
 =?utf-8?B?ZWllZlNpSU1Ranl4dUlydmJtQ2FxczlnQzN3WmRzR1Evck9qU3Rsc3diVENU?=
 =?utf-8?B?V0huekpCcmVWbTdyR1RWR0tFbGtwWEYvYWNGRHNiZjFtbVZpeFdIUFJCS0pP?=
 =?utf-8?B?dGY4ckVhbE5VNmUxb3kzSXpZb3FQL3RkT2FpVWg4UVBmazVxL0pwT2VjZWtT?=
 =?utf-8?B?YkRTcjB4cnM1NjZSL3NiRHE1d2MzR1BVWU1EeVYwb09URWtxZW5MOGZONnU1?=
 =?utf-8?B?YmpUMmVyUWk2Y0hXcUVJZnV2eXlNRVU0WEllZ29kOVNQUHh0YmJ4M05zKzV5?=
 =?utf-8?B?VloxOW5KL05SSTh1cmhOUTFNM1V2Y2hoVHVTNC9rYXBwaCt6YWYyYnIrdXdn?=
 =?utf-8?B?b2VaNGZsL1I5SHRCOHFIVWtJb2FYZzUvaDZmTU9iTk8wVm44L0o5Ymxabks2?=
 =?utf-8?B?QllWZGo0bGZsaVJLNU1IK2VhN2lQaW9XaVB2WWk5WW9XS1pVbFlnRFAyZWZI?=
 =?utf-8?B?WGg0VjgrVW9GVWZBc2VRa3FIVnVvVVkrUk0vZkEzdVd4cVcwYUo2Q3phemFw?=
 =?utf-8?B?V3BQOUE0NU9kM0k3Z2M2ZkdZODlpRjhHRVJqTDJ1YjRRbWlBbGFqYldwNFAx?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94F3085FE74033489138237334D4030E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d06e7e-c17a-43b8-c81a-08dc8b8b2628
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 09:28:13.6059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/YomE6bWGdSWeIRxQUK5q1R9aUYYKaGzwZshzX604QW5EBzbRoKUdiprYAdch7wOOiVybprzuq+a6ZNyOGRBJahdyn5TgqDKJUQ/iOWzsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8799
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.332300-8.000000
X-TMASE-MatchedRID: hls5oAVArl+nykMun0J1wpmug812qIbzjLOy13Cgb4/mNRhvDVinv5uF
	UwGzWVrTDbltkMkn7HLp59W9qUX4aKh+3Rlbev+JMJoQm3jo+mk+0OxGJE/R32HZ+cd7VyKX9Gb
	SSaq0f4MFVbTXBS8fnTjzq+x6e1nvaTkWqXcVprvk7k9yXJiqqmjdirk8LAsCEvoxTu3fj1sE5j
	CiZNRtO9l36EZnn3iW5hbLzcHLb1bh8RW9qY6+G2wbuvhCHs3cTI0NfY99MMnfc2Xd6VJ+yslO1
	4E7OluCjbDnIcru8iCui0EVZK4raEL9tcyTZdAsgxsfzkNRlfLdB/CxWTRRu92KvEVWmYr1hvNV
	y0YmGLsGvOp19Nj0vn3Eu2w5na8l2RustYJMVbCwYyrs4//izQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.332300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	E5A504FEA45CA32CB463A26095A910C6025E53BFBE96AEAB97660B70BA61B1272000:8
X-MTK: N

SGkgQW5kcnplaiwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2gu
DQoNCk9uIFdlZCwgMjAyNC0wNS0yOSBhdCAxNToxNCArMDIwMCwgQW5kcnplaiBQaWV0cmFzaWV3
aWN6IHdyb3RlOg0KPiBIaSwNCj4gDQo+IFcgZG5pdSAzLjA0LjIwMjQgbyAwNTo0NSwgWXVuZmVp
IERvbmcgKOiRo+S6kemjnikgcGlzemU6DQo+ID4gSGkgQW5nZWxvR2lvYWNjaGlubywNCj4gPiAN
Cj4gPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3aW5nLg0KPiA+IE9uIFR1ZSwgMjAyNC0wNC0wMiBh
dCAxMTo1MCArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiB3cm90ZToNCj4g
PiA+IElsIDI5LzAyLzI0IDEwOjU2LCBZdW5mZWkgRG9uZyBoYSBzY3JpdHRvOg0KPiA+ID4gPiBG
aXggc21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmcgZm9yIHZkZWNfaDI2NF9yZXFfbXVsdGlf
aWYuYy4NCj4gPiA+ID4gTGVhZGluZyB0byBrZXJuZWwgY3Jhc2ggd2hlbiBmYiBpcyBOVUxMLg0K
PiA+ID4gPiANCj4gPiA+ID4gRml4ZXM6IDM5N2VkYzcwM2ExMCAoIm1lZGlhOiBtZWRpYXRlazog
dmNvZGVjOiBhZGQgaDI2NA0KPiA+ID4gPiBkZWNvZGVyIikNCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+
ID4gPiA+ICAgIC4uLi92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfaDI2NF9yZXFfbXVsdGlfaWYu
YyAgICAgICAgIHwgOQ0KPiA+ID4gPiArKysrKysrLS0NCj4gPiA+ID4gICAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRp
ZmYgLS1naXQNCj4gPiA+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0DQo+ID4gPiA+IF9yZXENCj4gPiA+ID4gX211bHRpX2lm
LmMNCj4gPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNv
ZGVyL3ZkZWMvdmRlY19oMjY0DQo+ID4gPiA+IF9yZXENCj4gPiA+ID4gX211bHRpX2lmLmMNCj4g
PiA+ID4gaW5kZXggMGU3NDFlMGRjOGJhLi5hYjhlNzA4ZTBkZjEgMTAwNjQ0DQo+ID4gPiA+IC0t
LQ0KPiA+ID4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29k
ZXIvdmRlYy92ZGVjX2gyNjQNCj4gPiA+ID4gX3JlcQ0KPiA+ID4gPiBfbXVsdGlfaWYuYw0KPiA+
ID4gPiArKysNCj4gPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0DQo+ID4gPiA+IF9yZXENCj4gPiA+ID4gX211bHRpX2lm
LmMNCj4gPiA+ID4gQEAgLTcyNCwxMSArNzI0LDE2IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4gdmRl
Y19oMjY0X3NsaWNlX3NpbmdsZV9kZWNvZGUodm9pZA0KPiA+ID4gPiAqaF92ZGVjLCBzdHJ1Y3Qg
bXRrX3Zjb2RlY19tZW0gKmJzDQo+ID4gPiA+ICAgIAkJcmV0dXJuIHZwdV9kZWNfcmVzZXQodnB1
KTsNCj4gPiA+ID4gICAgDQo+ID4gPiA+ICAgIAlmYiA9IGluc3QtPmN0eC0+ZGV2LT52ZGVjX3Bk
YXRhLT5nZXRfY2FwX2J1ZmZlcihpbnN0LQ0KPiA+ID4gPiA+Y3R4KTsNCj4gPiA+ID4gKwlpZiAo
IWZiKSB7DQo+ID4gPiA+ICsJCW10a192ZGVjX2VycihpbnN0LT5jdHgsICJmYiBidWZmZXIgaXMg
TlVMTCIpOw0KPiA+ID4gPiArCQlyZXR1cm4gLUVCVVNZOw0KPiA+ID4gPiArCX0NCj4gPiA+ID4g
Kw0KPiA+ID4gPiAgICAJc3JjX2J1Zl9pbmZvID0gY29udGFpbmVyX29mKGJzLCBzdHJ1Y3QNCj4g
PiA+ID4gbXRrX3ZpZGVvX2RlY19idWYsDQo+ID4gPiA+IGJzX2J1ZmZlcik7DQo+ID4gPiA+ICAg
IAlkc3RfYnVmX2luZm8gPSBjb250YWluZXJfb2YoZmIsIHN0cnVjdA0KPiA+ID4gPiBtdGtfdmlk
ZW9fZGVjX2J1ZiwNCj4gPiA+ID4gZnJhbWVfYnVmZmVyKTsNCj4gPiA+ID4gICAgDQo+ID4gPiA+
IC0JeV9mYl9kbWEgPSBmYiA/ICh1NjQpZmItPmJhc2VfeS5kbWFfYWRkciA6IDA7DQo+ID4gPiA+
IC0JY19mYl9kbWEgPSBmYiA/ICh1NjQpZmItPmJhc2VfYy5kbWFfYWRkciA6IDA7DQo+ID4gPiAN
Cj4gPiA+IFlvdSdyZSBjaGFuZ2luZyB0aGUgYmVoYXZpb3IgaGVyZSwgY2FuIHlvdSBwbGVhc2Ug
ZXhwbGFpbiB3aHkNCj4gPiA+IHRoaXMNCj4gPiA+IGNoYW5nZSBpcyB2YWxpZA0KPiA+ID4gaW50
byB0aGUgY29tbWl0IGRlc2NyaXB0aW9uPw0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIGRyaXZlciBh
bHJlYWR5IGFkZCB0aGUgY29uZGl0aW9uIHRvIGNoZWNrIHdoZXRoZXIgZmIgaXMgTlVMTCBhdA0K
PiA+IHRoZQ0KPiA+IGZyb250LCBubyBuZWVkIHRoZXNlIHR3byBsaW5lcyBhZ2Fpbi4NCj4gPiAN
Cj4gDQo+IE1heWJlIEFuZ2VsbyByZWZlcnMgdG8gdGhlIGZ1bmN0aW9uIG5ldmVyIHJldHVybmlu
ZyAtRUJVU1kgYmVmb3JlPw0KPiBXaGlsZSBhdCBpdCwgaWYgZmIgaXMgYSBraW5kIG9mIGEgYnVm
ZmVyLCB3aHkgbm90IC1FTk9NRU0NCj4gd2hlbiBnZXRfY2FwX2J1ZmZlcigpIGZhaWxzPw0KPiAN
Ckxvb2tzIGNoYW5nZSB0aGUgcmV0dXJuIHZhbHVlIGZyb20gRUJVU1kgdG8gRU5PTUVNIG11Y2gg
bW9yZQ0KcmVhc29uYWJsZS4NCg0KPiBSZWdhcmRzLA0KPiANCj4gQW5kcnplag0KPiANCkJlc3Qg
UmVnYXJkcywNCll1bmZlaSBEb25nDQo+ID4gPiBUaGFua3MsDQo+ID4gPiBBbmdlbG8NCj4gPiA+
IA0KPiA+IA0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPiBZdW5mZWkgRG9uZw0KPiA+ID4gPiArCXlf
ZmJfZG1hID0gKHU2NClmYi0+YmFzZV95LmRtYV9hZGRyOw0KPiA+ID4gPiArCWNfZmJfZG1hID0g
KHU2NClmYi0+YmFzZV9jLmRtYV9hZGRyOw0KPiA+ID4gPiAgICAJbXRrX3ZkZWNfZGVidWcoaW5z
dC0+Y3R4LCAiW2gyNjQtZGVjXSBbJWRdIHlfZG1hPSVsbHgNCj4gPiA+ID4gY19kbWE9JWxseCIs
DQo+ID4gPiA+ICAgIAkJICAgICAgIGluc3QtPmN0eC0+ZGVjb2RlZF9mcmFtZV9jbnQsIHlfZmJf
ZG1hLA0KPiA+ID4gPiBjX2ZiX2RtYSk7DQo+ID4gPiA+ICAgIA0KPiA+ID4gDQo+ID4gPiANCj4g
PiA+IA0KPiANCj4gDQo=

