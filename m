Return-Path: <linux-media+bounces-45138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A6BF76A8
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 17:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4FEFF5072E8
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AC2339B54;
	Tue, 21 Oct 2025 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C1T0XG51";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wcWjxA9i"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDC1EA7DD;
	Tue, 21 Oct 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060794; cv=fail; b=Rxv8xi7TXTD/+8TPy4wrOLg0Qks82mmU6WrbqTh763hHR1wQ4e+HDGrIQ8ef8vqQcm7wPyHe56InR/k5l35gLb3SnjhPY0Roc6HB6Y5LahGoLwSqI4bpZM2s9KMaDj5gi6mYmY4FZfw/h0gmMRFQokpMp14xudYY+FAbEbOd/Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060794; c=relaxed/simple;
	bh=sS3RZSuOfazCbYTaUGCBQecNQO38CPczmPK97kJAOm8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cJAoDsHBsWXhmm1zCVFGLMDBOiIEsNpoCQxhxjAGQrGEB7ZDX0SVLKa1srwYsy/sCVnQ+nWn+5FZqLNhTihmrhPzH8MkeRxyzJ31NNsUqySOAn/qXgY2145/7r09o2221t+0PpEzQUz1jQLYrK4APaE2Qa1N/VVoK1MqbH3zNDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=C1T0XG51; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=wcWjxA9i; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3b1a8aaaae9311f0ae1e63ff8927bad3-20251021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sS3RZSuOfazCbYTaUGCBQecNQO38CPczmPK97kJAOm8=;
	b=C1T0XG51IUc04NP+7YK9QCzn4YOB2phiOedWLSYEMlVaD93rh606YohIaRlsG5LwtR6gL9gQDEJ0Mzk3ZD5ML8iFopiioJBsoYHUpTq7moLOcIyIb6Bq2r/sSoVtL7DdkaAQZBudCrTEq596yXQSMouZzkwZfvDy4KeKz04MCqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fcf90a34-d90c-4241-98e5-0df84489c046,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:dc1bad58-98d8-4d0a-b903-bc96efd77f78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b1a8aaaae9311f0ae1e63ff8927bad3-20251021
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188037243; Tue, 21 Oct 2025 23:33:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 21 Oct 2025 23:33:00 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 21 Oct 2025 23:33:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb/P9liHHmWdx7qsV/eNc1QGcPvWawqr9MNUNIPApbbkBWY4LFhUqeY7uIuxq9BXQyrbbInQxbxGPQcbTuCO9om2TgJv+DIheNo0V1SLM/VHg3rsURqhxb3pSmHLBPUbFuQyKSWXNMt3f2zPv9L3c6gGGNGi7/aKgEVoHX2OB01rnRa8mnjMFcKwqfh1XzC1qJ+bRdFy6Sw1gksAHAj0uPxYU1QFIJVmsHpal1m4oVA8FGWoFbTnVemiMqrUy8UUdZ8jMrNvgQsNbWinDTYMPNdyEp6lD+g7DLP7RQx5m8yAp09KHUA5pro13GMjewRAH0jv0Pry6uUCjNQLopWiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS3RZSuOfazCbYTaUGCBQecNQO38CPczmPK97kJAOm8=;
 b=pcDBo+POBy5qorjJHzEecpql57eFzdbEhttj16M1d818F/R3gK2jnHJeXDhnsqEzrEx39qdFGDbYERpG2aGjK971uqwvxieLy+AWKDMrk/rbUpTtakFgN0JcW1jWd4XUw3TufEK8zkEiSrjZJ2nCpbyIPT5+TqKx4hsKptRCRWg+WGrnwdnEg6vX6PMLpIyZeVzPJpfch9UA/b1S16vG8BR73oDJT4yW4LWF2K32axr3+aG79Velaaf9octypx5mo0F3zPvWgqTVGkLoqL9rL1mpGkVtWDrz0kSkZOZNJE+sM7whIH8+dYXhj26fTZS+Q8qW3fRbcurk/JEMt2Izqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS3RZSuOfazCbYTaUGCBQecNQO38CPczmPK97kJAOm8=;
 b=wcWjxA9i9G39SQ0nOmWwslbVDejbNgBGPhVG9SYI3g4OkP6OijjD4I6sRWNd9+oBaHwYTIocOFUCbCMjiS1Ddji9h846+vQ8n+Oj1kv97ZsCSNlfhpPYogDASiXTtGHn1wOG76wwV/yRcFNy0ToFhf5v9q5/Zf3+rB/a0DupxGc=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7632.apcprd03.prod.outlook.com (2603:1096:101:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 15:32:47 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 15:32:47 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"jason-jh.lin@mediatek.corp-partner.google.com"
	<jason-jh.lin@mediatek.corp-partner.google.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v8 00/20] Add GCE support for MT8196
Thread-Topic: [PATCH v8 00/20] Add GCE support for MT8196
Thread-Index: AQHcPzJopFpOGWtjOU61xXgID6WjO7TK05EAgAHt8AA=
Date: Tue, 21 Oct 2025 15:32:46 +0000
Message-ID: <a8d250f1281e6e188793c975dd26547fb681de81.camel@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
	 <f0cccd9a-21fe-4496-b6e3-6f4a8beec158@collabora.com>
In-Reply-To: <f0cccd9a-21fe-4496-b6e3-6f4a8beec158@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7632:EE_
x-ms-office365-filtering-correlation-id: 58901047-e83b-4e13-10fa-08de10b71626
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZnJORTBkWEF0SzJlSXFqK2tRMlZiODhqTDFTMmdMK3JOcTBhKzZBNVlTOGNS?=
 =?utf-8?B?djJRU1BqZkpzMzdNaURPZ2VGMHVtM0VSUmRSejY2aWNPSVltWGZKOTNvMFFV?=
 =?utf-8?B?YmZhSFZ4UXJVR1l6M1dia3JYbS9oUXFwTHBwYjRlWndnOU5UcUVOaklJejFk?=
 =?utf-8?B?NW1wL29CaTZZMVROMkd1UklvWHArNDVsSys5T0VRS3AxS1Z0OGQzNHltNGRl?=
 =?utf-8?B?UEdNeUFmS21OU09PMXR4dGZYVm9ReUE5ZnBjaHRSak9KQzJobC9KaDh4RkRU?=
 =?utf-8?B?T1FjWmNXUWkyV3p0NlRBMHBCSXR6RitOWUUvNlJJL3lrOGNhRHBQdTl5OVZj?=
 =?utf-8?B?WUJqc01PYzVSVjJXRkNZK3VLMmhBakNhZTRHU01OTVoxaE1pWHQwa2dLYlFV?=
 =?utf-8?B?SHR4RStiOVUxMWlYeEhjQVQ5ZWZJYnd3aURnTFN5dG9NVk41RlFKTlVNVldz?=
 =?utf-8?B?S2hwQ1ZqbUhTUm9CTTFJa0JkazE3TGJoZ3Nyb0xveVFTdURiL1p0NGxUdXJ6?=
 =?utf-8?B?WHZIc0EwRFBVNWIvUHNvajRlRVdxTzlOSVpUUEllaVZFL0RZZjYxb29hWVBO?=
 =?utf-8?B?RzhxL1VOU1RVMlBQRWlpbDRscDFHQk1pYktUcUk1bWtWUWFmV0FuOGRyWExl?=
 =?utf-8?B?VWFmMnA3cm4wdUpKLzNaL1hGSHM3UExKZjJLazlQS2N4TWtqYWxvT2U1TmtF?=
 =?utf-8?B?cldNdEtiT09qMGFlb3A3SllXSGNWVFkrZDU5Zkp0cnF5ai9ybHNMU1lWb25S?=
 =?utf-8?B?OEhZMHc3Z29TcWRBT2phQ0lsRURBbXhFamplTytSRGZLSE8vSzlxRnFpU1Z1?=
 =?utf-8?B?RWtVWnFiUDhlbTFrT2dOOFpPTm9ualhCaEtGc2UvQzBrcUVkUHFFUkZaNitL?=
 =?utf-8?B?WmppZEw2RWo5bVVFUkw0aXRmc0FlMTlWWUhscVlDKzdaSVdLeklBRFNhR1pP?=
 =?utf-8?B?bHJUcklMREdRdHdIeHdKVjZiSDBQYnVET3dxTkQ0eEJhZjBkVTE5UGMrSVAz?=
 =?utf-8?B?WG9xSVFxWE0vTG5wNWhhdCs2a1BwUnVteXh1STJhWjJwUHdWNlBVNVl2SHQ5?=
 =?utf-8?B?NEcyeURhV3h0akE4bm8wc2FrNlhVWnpzeFlsNndtTk8rTWVZLzBEWlFxa2xO?=
 =?utf-8?B?VzZOMmppRzh6bUpoU3lRVWl1Z1A5Q0lGUVJKeTdudkMrUXU2N1l6MXJTY1pL?=
 =?utf-8?B?QlRzdkxoTGRFV1BKajNUanpCNE93Zkc0d0RpYjR6Qnpad1k2R2xXblJ4RDlD?=
 =?utf-8?B?ZnFCK2NFR1llZk4wMy9BUU5zV2lLUzU1NG13Y09pOFJxYlZaUitwRmQrcTBN?=
 =?utf-8?B?U0dNeW5HaDJOa2ZiN3RUd2QxWUFrZjNyeko2MS83MVlwbVBYZFJDYTFlV3Zw?=
 =?utf-8?B?TDlZZjVDM3hONEJGMXErOWtaTnlOTjRTaVNqOVdTejJXaTVteHlDQ3NxaGhV?=
 =?utf-8?B?eXlWSHVBWm9IYmxHb2NPOEVCTFA0Ri9tV2JJK2U0VnEreFNtTUxSRXM5d0NU?=
 =?utf-8?B?QUVEM0FwS2Jpc3NQbGJIT051WllTbUlXOVVBUEJoRk95SHFhVHUxUWhUc3Fs?=
 =?utf-8?B?dmxpUCtPbjR0SFRsVlRDRCtCMEh1amtXZm1DK21uRlloMUQzRlFnTUhIcmNZ?=
 =?utf-8?B?eDh3Si9YT2I0amVGbGpDS3ExaGhFZng5UkR3ajloRkNPczdxTzg0TkhSaTJ2?=
 =?utf-8?B?cDlhZVUyeWsweXF5R1lSamJ1R1RyUjRtM1hyRTBncFV1RVZCMU9KU2UvNGhv?=
 =?utf-8?B?dW9SeWtGVzJ6cVFLa0wra09RcGF4THBjVnJnSXZXdktDQzhuNnZIb3BuR253?=
 =?utf-8?B?MXEvdGRvYW5sWmNkZ2NtMkJjSEhFNGFXVldKcG5DcU56QmhyMGRVVHhsLzFI?=
 =?utf-8?B?WUtFMGpqa2lQL1pXYlBTRHJBQjVrT0J6Y0lHK0VOZ05zbXkzWTlmWEVmeHk4?=
 =?utf-8?B?azJNUmhRMEdyek9JcjBqQ2kySUhkb3hZTzNUY1pNSzU3c2xISnR5U3Q0NG9S?=
 =?utf-8?B?bitmNXFlR1hvQ0dMaGxkZjRnMU9WWVZMZ3VGSU52TGhjNzk5NStDRU9VY01x?=
 =?utf-8?Q?dObJG4?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UE84dW00TnlSM2JYOEMvOFd4ZnlhSStnMUx0T29ENktITTBTTHg4dEhPMURJ?=
 =?utf-8?B?Z2dNNVdrZE0rNlM1NWRyYzBLY2h2ZXk3ZkF4RGZMQkVlb1k0bmhNMjZCRjQ2?=
 =?utf-8?B?SWRlZDFoMzQrcGExUnNUcXpvQzdTRitMWTlabjhmRDVHb2dFaGJqSFllc0Nq?=
 =?utf-8?B?T2xRNU9ieUVERlJlaXdmRzJjSlArK1RScERoVHpycVkrRDE1NWRoRTJ3aGpU?=
 =?utf-8?B?NTZwZ2paLzg3WldpaEhZRE03N1drZmxKa2xKU01ZUVF5UzdpK09sbkQ3a0Z5?=
 =?utf-8?B?RGQ5aDl6TVE1RFRJVVBBQnlpbUdtbHdQNWNwR3g2YXF3cnZCOFMreVR3Q3FQ?=
 =?utf-8?B?T0xjN0hTQzkwOHFLWEc4M1orWlpxWktia0NoZFZGRDlTSlYza2VYbFNQSXNT?=
 =?utf-8?B?a2dPSS8vYmplbFRvRy9mcURzQmEvd3NyNjl6L1BxMUdlOE11UFhBTGxncnBY?=
 =?utf-8?B?aGwrb0ZyRmdwS3VBZTM1eFpEeTRHYUJ6d2hhN2pJNHNEWHU4ZkU2TXV3Z0Mv?=
 =?utf-8?B?UytuQklaQ1NRL3FBaUdJQk81dmxsdGNZUlhyaURGOFFPcVhhSnJsTG9aVi9r?=
 =?utf-8?B?YXdDM1NEanh2cG05NVVmNmNCR0YxL2FZVUU0Y2lTTFQ5N1ZyWEthVnpiWnJx?=
 =?utf-8?B?cGxUVklmNzEwQjFBSGFuelUzV1lKK1VyOHRVbU52a2M5TCtaN3Zpd2MvRnQ4?=
 =?utf-8?B?NlBuaEZpWTJGYWdMTks2UHFjYWlVMnlMeThCS1I2dDc0ZldHOUNkUmRxOXk0?=
 =?utf-8?B?K3lOdkFmNVBLMHdmUURKZHRIdUhZWEpJRG9TdFNqcTMvVFYwY08vYWovVHAw?=
 =?utf-8?B?ZkU4blZhME40SGQ5NCtqeHBtd2NnWUZmeWw2NHRFRmkzVXB3cWVIQWgzNHp6?=
 =?utf-8?B?SWxDcXZFM1RrT1dVUlVWSGI4ZFhoRFdtREhYc2ZHQnRWVkNjNVRIUm5VcXR6?=
 =?utf-8?B?Vkhkc2tjV2xqUDlhbUhhNFMrUUpzY1kvT2pnc1dTejdrdDJFQzhEV2pmTzZp?=
 =?utf-8?B?Z1IxWG1ZOVk0M3hIS0hwelR6OURoZkxZNFI1OG5LbWRDTTcrTVhXTVRmOHlI?=
 =?utf-8?B?VUNDYmMzdTZVU0xPSlRHeW5jQlV2K3ZSUzVKSmVqTEw5cXRxakRKOGdyVXE2?=
 =?utf-8?B?RHpDaWJ6a2I2OWdCS2dzR1Joalo3OXZzdUFrMERydEl0TzVHM2J2THhYVDJw?=
 =?utf-8?B?eUM0QkNkRDV6dFMyMUFjc0tNdlQ1Q2QwZmZ5dVFIL0F4cU81a1ZnV3VzZS9p?=
 =?utf-8?B?QVp3UW8zbE9GRmV3T3ByajZRUmlDSGQra1lBcFp1OXRhNzFTTkhXaStKTEly?=
 =?utf-8?B?UkZ3LzB2cEMrNDROakpydnlUZlFvd0VGMWdtRm02WTBlN1dEMXIvYlZncVc2?=
 =?utf-8?B?SUNUTWlFZTFlYzh3Q0JhQWRCU3d5MG85dHFWb2FLM1U4ZTkra1VVcTAxWkpj?=
 =?utf-8?B?bWVOa21tT2NaSGFnQUhodkV0NVVmVXloVm9ZbGtmOHl2MCtwSytPUGZzQSto?=
 =?utf-8?B?T0E2N2hZRUZ1V2wrNEMvS3ZveU1LcmJYeUxzdmQzTzYvQS9PZWVQT29qcys4?=
 =?utf-8?B?OU5kUEZYU0RZaCs5L2lRQ3FENXFzaWlDV2lhYVZya3JQblBYRURlMGxydEM0?=
 =?utf-8?B?ZnJ2NXhZbFVESG1nbnczNXU0N05zd0tXaE56cml2ak0rOCtXd1FrVWRtcFBZ?=
 =?utf-8?B?UkdXdldrZExpTVltaklJYThKZ3lhWEdEdUYzR29qSVNQQWdESU9jWFJkRldk?=
 =?utf-8?B?TngzRDc5dnROQ2pKbjJURWc2QjUxMlJMQ2lJSnpuZVhBNTVmcnpXK21BWm9m?=
 =?utf-8?B?Y0lqaGdtckJLejJoY2UwSnU3MzhLTXZ4QnlDamMvRzUwN0svOVU2YkszSGZy?=
 =?utf-8?B?eUd1eWUrT2J6Nzl3eU1UTEFTdWNnbUVDTU1TN0NsZEFUS0JaNXBzWk5yU2t0?=
 =?utf-8?B?ZDA3c3pRdEhyendrS056OEhaL0NYbUt0Njd6TTdVdGZqR0JKT2JvMEwrcS84?=
 =?utf-8?B?TUorUVhkRFZDL2UwTVVteHM4TFZLVGErbFR0TDdGbCtSc1NaTldmUDlqb2ZH?=
 =?utf-8?B?SUFzdVhqOFlsd3V3OWtOOVNCNE1HdnlkcXVZa1dmQ1BVajVUR0IwSUxScE1J?=
 =?utf-8?B?TERpakJQNEhyTlZDNzNnL1JSSlFXUTFnNjZRTTNiVW01TW9YYy9VYXZuQXVL?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9DA51CE000F3443A5298A51960CDBB2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58901047-e83b-4e13-10fa-08de10b71626
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 15:32:46.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqE9KHHGw+Gielh6txXMut0qANkHid5FKXA10peRRG70lcbpp+Pkv+PoVXPF3jT3WyMXprKSVekZ8eNL49e54aBokI2+yQ7MyUlzETr6zbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7632

T24gTW9uLCAyMDI1LTEwLTIwIGF0IDEyOjA0ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTcvMTAvMjUgMDg6NDQsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IEZyb206IEphc29uLWpoIExpbiA8amFzb24tamgubGlu
QG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2gg
c2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UODE5NiBTb0MgaW4gdGhlDQo+
ID4gQ01EUQ0KPiA+IGRyaXZlciBhbmQgcmVsYXRlZCBzdWJzeXN0ZW1zLiBUaGUgY2hhbmdlcyBp
bmNsdWRlIGFkZGluZw0KPiA+IGNvbXBhdGlibGUNCj4gPiBuYW1lcyBhbmQgaW9tbXVzIHByb3Bl
cnR5LCB1cGRhdGluZyBkcml2ZXIgZGF0YSB0byBhY2NvbW1vZGF0ZQ0KPiA+IGhhcmR3YXJlDQo+
ID4gY2hhbmdlcywgYW5kIG1vZGlmeWluZyB0aGUgdXNhZ2Ugb2YgQ01EUSBBUElzIHRvIHN1cHBv
cnQgbm9uLXN1YnN5cw0KPiA+IElEDQo+ID4gaGFyZHdhcmUuDQo+ID4gDQo+IA0KPiBPSyAtIGFm
dGVyIGFwcGx5aW5nIHNvbWUgbGFzdCBzbWFsbCBjaGFuZ2VzIGFzIEkgcG9pbnRlZCBvdXQgaW4g
ZWFjaA0KPiBwYXRjaCwNCj4gdGhlIGNvZGUgaXMgcmVhZHkgSU1PLg0KPiANCg0KVGhhbmsgeW91
IHZlcnkgbXVjaCEgSSdsbCBmaXggdGhlbSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IFRvIGVh
c2UgbWVyZ2luZywgdGhvdWdoLCBJJ2QgbGlrZSB5b3UgdG8gc3BsaXQgdGhpcyBzZXJpZXMgaW4N
Cj4gbXVsdGlwbGUgc2VyaWVzOg0KPiDCoCAxLiBBZGRpdGlvbiBvZiBuZXcgZnVuY3Rpb25zIGFu
ZCBzdXBwb3J0IGZvciBNVDgxOTYNCj4gwqAgMi4gTWlncmF0aW9uIG9mIGRybS1tZWRpYXRlaywg
bWFpbGJveCwgbWRwMyB0byB0aGUgbmV3IGZ1bmN0aW9ucw0KPiDCoCAzLiBSZW1vdmFsIG9mIHRo
ZSB0ZW1wb3JhcnkgZnVuY3Rpb25zIHRoYXQgd2VyZSBpbnRyb2R1Y2VkIG9ubHkgZm9yDQo+IG1p
Z3JhdGlvbg0KPiANCj4gVGhpcyBnaXZlcyBldmVyeW9uZSB0aGUgb3Bwb3J0dW5pdHkgb2YgZ2V0
dGluZyBqdXN0IHRoZSByZWxldmFudA0KPiBwYXJ0cyBmb3IgZWFjaA0KPiBtZXJnZSBjeWNsZSwg
YXZvaWRpbmcgcG9zc2libGUgY29uZnVzaW9uIG9uIHdoYXQgdG8gcGljayBhbmQgd2hhdCBub3QN
Cj4gdG8uDQo+IA0KDQpTdXJlLCBpdCBtYWtlIHNlbnNlLg0KDQo+IEtlZXAgaW4gbWluZCB0aGF0
IHNvYy9tZWRpYXRlayBhbmQgbWFpbGJveCBhcmUgZnJvbSB0d28gZGlmZmVyZW50DQo+IG1haW50
YWluZXJzLA0KPiBhbmQgeW91IG1heSBuZWVkIHRvIHNwbGl0IHRoaXMgaW4gbW9yZSB0aGFuIDMg
c2VyaWVzLg0KPiANCj4gSSBiZWxpZXZlIHRoYXQgd2UgbWlnaHQgYXQgbGVhc3QgZ2V0IGEgbWFp
bGJveCBpbW11dGFibGUgYnJhbmNoIGlmIHdlDQo+IHdhbnQgdG8NCj4gZG8gdGhpcyBpbiAzIGtl
cm5lbCB2ZXJzaW9ucywgb3RoZXJ3aXNlIGl0J3MgZ29pbmcgdG8gYmUgZm91ciwgSQ0KPiB0aGlu
ay4NCj4gDQoNCkkgdGhpbmsgSSB3aWxsIHNlcGFyYXRlIHRoZW0gdG86DQoxLiBBIHNpbmdsZSBm
aXhlcyBwYXRjaCBmb3IgW1BBVENIIDIvMjBdLg0KMi4gQWRkIEdDRSBzdXBwb3J0IGZvciBNVDgx
OTYgKGluY2x1ZGluZyBwa3Rfd3JpdGUgYW5kIGp1bXAgQVBJIGNoYW5nZSkNCjMuIE1pZ3JhdGlv
biBvZiBkcm0tbWVkaWF0ZWssIG1haWxib3gsIG1kcDMgdG8gdGhlIG5ldyBmdW5jdGlvbnMNCjQu
IFJlbW92YWwgb2YgdGhlIHRlbXBvcmFyeSBmdW5jdGlvbnMgZm9yIG1pZ3JhdGlvbg0KDQpJIHRo
aW5rIHB1dHRpbmcgdGhlIHBhdGNoZXMgZm9yIHRoZSBzYW1lIHB1cnBvc2UgaW4gdGhlIHNhbWUg
c2VyaWVzIGlzDQpiZXR0ZXIgZm9yIG1haW50YWluZXJzIHRvIGZpbmQgdGhlIHJlbGV2YW50IHBh
dGNoZXMuIEJ1dCBJJ2xsIHRyeSB0bw0KcHV0IHRoZSBzYW1lIG1haW50YWluZXJzJyBwYXRjaGVz
IHRvZ2V0aGVyIGFzIHBvc3NpYmxlIGFzIEkgY2FuLCBzbw0KdGhhdCBtYWludGFpbmVycyBjYW4g
cHVsbCB0aGVtIHRvIHRoZWlyIHRyZWUgZWFzaWVyLg0KDQpSZWdhcmRzDQpKYXNvbi1KSCBMaW4N
Cg0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0KPiANCj4gDQo+ID4gLS0tDQo+ID4gQ2hhbmdlIGluIHY4
Og0KPiA+IDEuIFVzZSBmdW5jdGlvbiBwb2ludGVyIHRvIHNlbGVjdCB0aGUgY29ycmVjdCBDTURR
IEFQSXMgd2hlbg0KPiA+IGNoZWNraW5nDQo+ID4gwqDCoMKgIHN1YnN5cyBpcyBzdXBwb3J0IGZv
ciB0aGUgSFcgY29tcG9uZW50Lg0KPiA+IA0KPiA+IENoYW5nZSBpbiB2NzoNCj4gPiAxLiBSZW5h
bWUgY21kcV9yZWdfc2hpZnRfYWRkcigpIGFuZCBjbWRxX3JlZ19yZXZlcnRfYWRkcigpIHRvDQo+
ID4gwqDCoMKgIGNtZHFfY29udmVydF9nY2VfYWRkcigpIGFuZCBjbWRxX3JldmVydF9nY2VfYWRk
cigpLg0KPiA+IDIuIENoYW5nZSBjbWRxX3ZtX3RvZ2dsZSB0byBjbWRxX3ZtX2luaXQoKS4NCj4g
PiANCj4gPiBDaGFuZ2UgaW4gdjY6DQo+ID4gMS4gTW92ZSB0aGUgcmVtb3ZhbCBwYXRjaGVzIHRv
IHRoZSBlbmQgb2Ygc2VyaWVzLg0KPiA+IDIuIEZpeCBidWlsZCBlcnJvciBmb3IgY21kcV9wa3Rf
anVtcF9yZWxfdGVtcCBwYXRjaC4NCj4gPiANCj4gPiBDaGFuZ2UgaW4gUkVTRU5EIHY1Og0KPiA+
IDEuIFNlcGFyYXRlIHRoZSByZW1vdmFsIG9mIGNtZHFfZ2V0X3NoaWZ0X3BhKCkgZnJvbSBbUEFU
Q0ggdjUNCj4gPiAwMy8xOV0gdG8gYQ0KPiA+IMKgwqDCoCBzaW5nbGUgcGF0Y2ggW1BBVENIIFJF
U0VORCB2NSAxMC8yMF0uDQo+ID4gDQo+ID4gQ2hhbmdlIGluIHY1Og0KPiA+IDEuIFJlYmFzZSBv
biB0YWc6IG5leHQtMjAyNTA0MjQgKyBwYXRjaCBbMV0uDQo+ID4gMi4gU3BsaXQgYWRkaW5nIGRy
aXZlciBkYXRhIGZvciBNVDgxOTYgcGF0Y2ggdG8gMyBpbmRlcGVuZGVudCBwYXRjaA0KPiA+IMKg
wqDCoCBhbmQgYWRkIG1vcmUgZGV0YWlsIGNvbW1pdCBtZXNzYWdlIHRvIGVhY2ggcGF0Y2guDQo+
ID4gMy4gUmVmaW5lIHBhc3Npbmcgc2hpZnRfcGEgYXMgdGhlIHBhcmFtZXRlciBpbiBBUEkgdG8g
c3RvcmluZyBpdA0KPiA+IGludG8NCj4gPiDCoMKgwqAgdGhlIGNtZHFfcGt0Lg0KPiA+IDQuIFJl
ZmluZSBETUEgYWRkcmVzcyBwb3RlbnRpYWwgaXNzdWUgaW4gY21kcSBtYWlsYm94IGRyaXZlci4N
Cj4gPiA1LiBDaGFuZ2UgdGhlIG1taW5mcmFfb2Zmc2V0IHJlbGF0ZWQgbWJveCBBUEkgdG8gcGFz
c2luZyBpdCBieQ0KPiA+IGNtZHFfcGt0Lg0KPiA+IDYuIEFkZCBuZXcgY21kcV9wa3Rfd3JpdGVf
cGEoKSBhbmQgY21kcV9wa3Rfd3JpdGVfc3Vic3lzKCkgQVBJcyB0bw0KPiA+IMKgwqDCoCByZXBs
YWNlIHRoZSBjbWRxX3BrdF93cml0ZSgpLg0KPiA+IA0KPiA+IFsxXSBtYWlsYm94OiBtdGstY21k
cTogUmVmaW5lIEdDRV9HQ1RMX1ZBTFVFIHNldHRpbmcNCj4gPiAtDQo+ID4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9wYXRjaC8yMDI1MDQyMTAzNTY1MC40NDEzODMtMS1qYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tL19fOyEhQ1RSTktBOXdNZzBBUmJ3IWhpVHdrRTZ1dmdIdDlSRl8yc1pmTDdwQUlx
TVIyX2cyOGh2TmtxZkNOUEN2QmhqQ1hWcHRHMTRzVDhRU1Q5WmdqM253b3BhOWV3d1VBa2JXbmx5
eFVqSzAxYjVUWXdEVnZRJA0KPiA+IA0KPiA+IENoYW5nZSBpbiB2NDoNCj4gPiAxLiBSZW1vdmUg
ZHQtYmluZGluZyBoZWFkZXIgYW5kIGFkZCBhIGdjZSBoZWFkZXIgaW4gZHRzIGZvbGRlci4NCj4g
PiAyLiBSZW1vdmUgZG90IGluIHNpZ24tb2ZmIG5hbWUuDQo+ID4gMy4gQ2hhbmdlIGFkZHIgdHlw
ZSBmcm9tIHUzMiB0byBkbWFfYWRkcl90IGZvcg0KPiA+IGNtZHFfcmVnX3NoaWZ0X2FkZHIoKSBh
bmQNCj4gPiDCoMKgwqAgY21kcV9yZWdfcmV2ZXJ0X2FkZHIoKS4NCj4gPiANCj4gPiBDaGFuZ2Ug
aW4gdjM6DQo+ID4gMS4gTWVyZ2UgMiBkdC1iaW5kaW5ncyBwYXRoZXMgdG9nZXRoZXIgYW5kIGFk
ZCBtb3JlIGRldGFpbCBjb21taXQNCj4gPiBtZXNzYWdlLg0KPiA+IDIuIENoYW5nZSB0eXBlIHUz
MiB0byBwaHlzX2FkZHJfdCBmb3IgcGFfYmFzZSBvZiBzdHJ1Y3QNCj4gPiBjbWRxX2NsaWVudF9y
ZWcuDQo+ID4gMy4gUmVtb3ZlIGNtZHFfc3Vic3lzX2lzX3ZhbGlkKCkgYW5kIHN1YnN5c19udW0g
aW4gQ01EUSBkcml2ZXIuDQo+ID4gNC4gQWRkIENNRFFfU1VCU1lTX0lOVkFMSUQgdG8gY2hlY2sg
c3Vic3lzIGluc3RlYWQgb2YgdXNpbmcNCj4gPiDCoMKgwqAgY21kcV9zdWJzeXNfaXNfaW52YWxp
ZCgpLg0KPiA+IDUuIE1ha2UgdXNlIG9mIENNRFFfVEhSX1NQUjAgZGVmaW5lIHRvIHRoZSBwYXJh
bWV0ZXIgb2YgQ01EUSBBUElzLg0KPiA+IDYuIFJlYmFzZSBvbiB0aGUgbmV3IE1BQ1JPIGluIG10
ay1tZHAzLWNvbXAuaC4NCj4gPiANCj4gPiBDaGFuZ2UgaW4gdjI6DQo+ID4gMS4gUmVtb3ZlIHRo
ZSBjb25zdGFudCBhbmQgZml4IHdhcm5pbmcgaW4gZHQtYmluZGluZ3MuDQo+ID4gMi4gUmVtb3Zl
IHRoZSBwYV9iYXNlIHBhcmFtZXRlciBvZiBDTURRIEFQSXMgYW5kIHJlbGF0ZWQNCj4gPiBtb2Rp
ZmljYXRpb24uDQo+ID4gMy4gTW92ZSBzdWJzeXMgY2hlY2tpbmcgdG8gY2xpZW50IGRyaXZlcnMg
YW5kIHVzZSAyIGFsdGVybmF0aXZlDQo+ID4gwqDCoMKgIENNRFEgQVBJcyB0byBhY2hpZXZlIHRo
ZSBzYW1lIGZ1bmN0aW9uYWxpdHkuDQo+ID4gDQo+ID4gLS0tDQo+ID4gDQo+ID4gSmFzb24tSkgg
TGluICgyMCk6DQo+IA0KPiBTZXJpZXMgMSBzdGFydA0KPiANCj4gPiDCoMKgIGFybTY0OiBkdHM6
IG1lZGlhdGVrOiBBZGQgR0NFIGhlYWRlciBmb3IgTVQ4MTk2DQo+ID4gwqDCoCBtYWlsYm94OiBt
dGstY21kcTogUmVmaW5lIERNQSBhZGRyZXNzIGhhbmRsaW5nIGZvciB0aGUgY29tbWFuZA0KPiA+
IGJ1ZmZlcg0KPiA+IMKgwqAgbWFpbGJveDogbXRrLWNtZHE6IEFkZCBjbWRxIHByaXZhdGUgZGF0
YSB0byBjbWRxX3BrdCBmb3INCj4gPiBnZW5lcmF0aW5nDQo+ID4gwqDCoMKgwqAgaW5zdHJ1Y3Rp
b24NCj4gPiDCoMKgIHNvYzogbWVkaWF0ZWs6IG10ay1jbWRxOiBBZGQgY21kcV9nZXRfbWJveF9w
cml2KCkgaW4NCj4gPiBjbWRxX3BrdF9jcmVhdGUoKQ0KPiA+IMKgwqAgc29jOiBtZWRpYXRlazog
bXRrLWNtZHE6IEFkZCBjbWRxX3BrdF9qdW1wX3JlbF90ZW1wKCkgZm9yDQo+ID4gcmVtb3ZpbmcN
Cj4gPiDCoMKgwqDCoCBzaGlmdF9wYQ0KPiA+IMKgwqAgbWFpbGJveDogbXRrLWNtZHE6IEFkZCBH
Q0UgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24gY29uZmlndXJhdGlvbg0KPiA+IMKgwqAgbWFpbGJv
eDogbXRrLWNtZHE6IEFkZCBtbWluZnJhX29mZnNldCBjb25maWd1cmF0aW9uIGZvciBEUkFNDQo+
ID4gwqDCoMKgwqAgdHJhbnNhY3Rpb24NCj4gPiDCoMKgIG1haWxib3g6IG10ay1jbWRxOiBBZGQg
ZHJpdmVyIGRhdGEgdG8gc3VwcG9ydCBmb3IgTVQ4MTk2DQo+ID4gwqDCoCBzb2M6IG1lZGlhdGVr
OiBtdGstY21kcTogQWRkIHBhX2Jhc2UgcGFyc2luZyBmb3IgaGFyZHdhcmUNCj4gPiB3aXRob3V0
DQo+ID4gwqDCoMKgwqAgc3Vic3lzIElEIHN1cHBvcnQNCj4gPiDCoMKgIHNvYzogbWVkaWF0ZWs6
IG10ay1jbWRxOiBFeHRlbmQgY21kcV9wa3Rfd3JpdGUgQVBJIGZvciBTb0NzDQo+ID4gd2l0aG91
dA0KPiA+IMKgwqDCoMKgIHN1YnN5cyBJRA0KPiA+IMKgwqAgc29jOiBtZWRpYXRlazogbXRrLWNt
ZHE6IEFkZCBtbWluZnJhX29mZnNldCBhZGp1c3RtZW50IGZvciBEUkFNDQo+ID4gwqDCoMKgwqAg
YWRkcmVzc2VzDQo+ID4gwqDCoCBzb2M6IG1lZGlhdGVrOiBVc2UgcmVnX3dyaXRlIGZ1bmN0aW9u
IHBvaW50ZXIgZm9yIHN1YnN5cyBJRA0KPiA+IMKgwqDCoMKgIGNvbXBhdGliaWxpdHkNCj4gPiDC
oMKgIGRybS9tZWRpYXRlazpVc2UgcmVnX3dyaXRlIGZ1bmN0aW9uIHBvaW50ZXIgZm9yIHN1YnN5
cyBJRA0KPiA+IMKgwqDCoMKgIGNvbXBhdGliaWxpdHkNCj4gPiDCoMKgIG1lZGlhOiBwbGF0Zm9y
bTogbXRrLW1kcDM6IFJlZmFjdG9yIENNRFEgd3JpdGVzIGZvciBDTURRIEFQSQ0KPiA+IGNoYW5n
ZQ0KPiA+IMKgwqAgbWVkaWE6IHBsYXRmb3JtOiBtdGstbWRwMzogQ2hhbmdlIGNtZHFfcGt0X2p1
bXBfcmVsKCkgdG8NCj4gPiDCoMKgwqDCoCBjbWRxX3BrdF9qdW1wX3JlbF90ZW1wKCkNCj4gPiDC
oMKgIHNvYzogbWVkaWF0ZWs6IG10ay1jbWRxOiBSZW1vdmUgc2hpZnRfcGEgcGFyYW1ldGVyIGZy
b20NCj4gPiDCoMKgwqDCoCBjbWRxX3BrdF9qdW1wKCkNCj4gPiDCoMKgIG1lZGlhOiBwbGF0Zm9y
bTogbXRrLW1kcDM6IFVzZSBjbWRxX3BrdF9qdW1wX3JlbCgpIHdpdGhvdXQNCj4gPiBzaGlmdF9w
YQ0KPiA+IMKgwqAgc29jOiBtZWRpYXRlazogbXRrLWNtZHE6IFJlbW92ZSBjbWRxX3BrdF9qdW1w
KCkgYW5kDQo+ID4gwqDCoMKgwqAgY21kcV9wa3RfanVtcF9yZWxfdGVtcCgpDQo+ID4gwqDCoCBz
b2M6IG1lZGlhdGVrOiBtdGstY21kcTogUmVtb3ZlIGNtZHFfcGt0X3dyaXRlKCkgYW5kDQo+ID4g
wqDCoMKgwqAgY21kcV9wa3Rfd3JpdGVfbWFzaygpDQo+ID4gwqDCoCBtYWlsYm94OiBtdGstY21k
cTogUmVtb3ZlIHVuc3VlZCBjbWRxX2dldF9zaGlmdF9wYSgpDQo+ID4gDQo+ID4gwqAgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTYtZ2NlLmjCoMKgwqDCoCB8IDYxMg0KPiA+ICsr
KysrKysrKysrKysrKysrKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRw
X2NvbXAuY8KgwqDCoMKgwqDCoCB8wqAgMTIgKy0NCj4gPiDCoCBkcml2ZXJzL21haWxib3gvbXRr
LWNtZHEtbWFpbGJveC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExMyArKystDQo+ID4gwqAg
Li4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jwqDCoMKgIHzCoMKgIDYg
Ky0NCj4gPiDCoCAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb21wLmjCoMKg
wqAgfMKgwqAgNiArLQ0KPiA+IMKgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAz
LWNvcmUuY8KgwqDCoCB8wqDCoCAyIC0NCj4gPiDCoCAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRw
My9tdGstbWRwMy1jb3JlLmjCoMKgwqAgfMKgwqAgMSAtDQo+ID4gwqAgZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLWNtZHEtaGVscGVyLmPCoMKgwqDCoMKgwqDCoCB8wqAgODIgKystDQo+ID4gwqAg
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA4ICstDQo+ID4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICstDQo+ID4gwqAgaW5jbHVkZS9saW51eC9t
YWlsYm94L210ay1jbWRxLW1haWxib3guaMKgwqDCoMKgwqAgfMKgIDE5ICstDQo+ID4gwqAgaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaMKgwqDCoMKgwqDCoMKgwqAgfMKgIDg3
ICsrLQ0KPiA+IMKgIDEyIGZpbGVzIGNoYW5nZWQsIDg3OSBpbnNlcnRpb25zKCspLCA3NCBkZWxl
dGlvbnMoLSkNCj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTYtZ2NlLmgNCj4gPiANCj4gDQoNCg==

