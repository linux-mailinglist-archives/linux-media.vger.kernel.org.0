Return-Path: <linux-media+bounces-16861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714B95FF3A
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 04:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEEEEB20F4D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 02:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEB3168B8;
	Tue, 27 Aug 2024 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rkiK7sqT";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FDC8+EHV"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FC6C8FE;
	Tue, 27 Aug 2024 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726580; cv=fail; b=AuYPp4kYFLQIrHsLHVTzae5HvYfhgnKUqkpufQyER1tAOnlMEuHFac9Lv4o4nZER7v/Uy4xehE95uHF7QniiOQcnKoouqqOW3zWzuvcqYDoEhyZ8n+zIUepGC9CesCh/40a9EWV1q7ZGQO7KR5SE7LYl+67QJfy81QTS0HvUdtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726580; c=relaxed/simple;
	bh=dq6psp70j9mG1kgaiShG6AguzJAhRCJiLWZjVtGKjvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uy2d7ea9o6V/3GkCEJBVvxn/PhYQ5NmZvHTMNDzWj5kRamMWb/FEVsKl5KqW2MbxCccC0jnNYoN0CRGasRbP3ZaBMGeQGteV2mD/EjlozZB+qxOC4Bibu55R/6314gOXuU03fMaFi4JWqpw3ZUN0zwqDCFtdYbsJ49j74G/pqXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rkiK7sqT; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FDC8+EHV; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0e245a5a641e11ef8b96093e013ec31c-20240827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dq6psp70j9mG1kgaiShG6AguzJAhRCJiLWZjVtGKjvk=;
	b=rkiK7sqT7X0gRpP0xvIFA1XewIDA/sCAqohLUK8IrH0kgqUZeveBauddqCnLJjvG6TIftFck7Y1aqVEMmZkUw3KZdhsnsbdmY/0TjoNwyzW/rJ6k8CtrZM1osgWdMnb2AzOQgJBYFUr9dm8mCMMAG+fO/y+Bnh3GfQ83aB8DwQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:77dc6320-e23f-4aab-b213-4097db796a6a,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:1250fabe-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0e245a5a641e11ef8b96093e013ec31c-20240827
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 226908805; Tue, 27 Aug 2024 10:42:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 27 Aug 2024 10:42:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 27 Aug 2024 10:42:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IskoLQeGmlwN/4dxZA89VllIntBpvbdnNzr4A1fHGuv6vkQUnwdzl/REXSyBG4QBNAChJrj0K0xECzGCDiy8UqnLrpW425ctc7n928ZfO7IB8ZBxz/ObbrvoNBtPkKggI4KBiAKbI0jGZVo9gLDRSfiEC0ewB0CcoJEFzMaY6KjceBfkEeRo7IVURcHsuOKRj//2E5DcG+dp4e+JpDD0c4yIKYZ+k3dI15+nakWQ+F+PHbkyYyxhgp8XoJlufwQNvhieu3yLPhYOs5sXcA80hQsjf4a9b0HvqGeMAosESu2jiH12lKZ7x1Bk3jc0/9soaNfBlrPjGee8UBjVSthQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq6psp70j9mG1kgaiShG6AguzJAhRCJiLWZjVtGKjvk=;
 b=jCm/nVUNipN7mHyyE/QAgSobHv6iUtls5tgUwmDj6NNe8duKNMJyFB9f+dKxtE6OOKwNclFP0HUftP2C5IWVtD5o14Ye7pzI8Rpx66a2oPpvxW7iFLDXjxJeQNdryhkugAnZNnuNFWtSfFCeV/MJdISneUV+NUsnSSIYn5HkQKsyFve9jdHstT0EstIRc2KvdGqiAfER38Ym1IWM9oYNbM1gcdwnxPyBqC+MtyWbI0OTjDNd1gDU2NvKyrRn8U9qDy7ZhFNHT9ZQP4x/5Dt5orgr0lKKPXzCSDTnFFw36mXp/zp4I47nVRPayo5GxQoKK1OFj3UZu0Te6KNRq1GIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq6psp70j9mG1kgaiShG6AguzJAhRCJiLWZjVtGKjvk=;
 b=FDC8+EHVIz6I84lTGrnjMdQ3D4x2Fbw8+yh/sqHo+NyYA5+/JHidtarX9NTFIi7hXb88mOHaz0XJt0c6ax8305yJfLYLUoZ4LbrATG97G8ncGbUWaXqSiqi+fKn7FBVODsFRU9WfG9sPdrvk1UUkO6ZrEnI/c63q9wxk16iPEJ8=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by SEZPR03MB8137.apcprd03.prod.outlook.com (2603:1096:101:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 02:42:48 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:42:48 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [PATCH v4 3/7] media: mediatek: vcodec: flush decoder before
 stream off
Thread-Topic: [PATCH v4 3/7] media: mediatek: vcodec: flush decoder before
 stream off
Thread-Index: AQHa6KN3gUSEIAjT2EiLKZl34cD7FLIzirCAgAb5oQA=
Date: Tue, 27 Aug 2024 02:42:48 +0000
Message-ID: <243c9caffe72bfa13b65b636fb0fcb76c360996f.camel@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
	 <20240807082444.21280-4-yunfei.dong@mediatek.com>
	 <20240822161145.jv7i45wlajcxpazw@basti-XPS-13-9310>
In-Reply-To: <20240822161145.jv7i45wlajcxpazw@basti-XPS-13-9310>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|SEZPR03MB8137:EE_
x-ms-office365-filtering-correlation-id: 7daab593-a0d3-40c4-b4dc-08dcc641f01b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YmlDT20yc2JtY1lMc0JxTzlqQjlHUi9aL3FhYllZMGhaR1QzWHRXOTk0cDQx?=
 =?utf-8?B?L3ozc0xsRjNnV1FkK3FkeVJaejJWUjhEbXpHTXNwUDFHZ000aFkyYjlPVzAz?=
 =?utf-8?B?OTFncmJxNU5QdHJDcmN5cFBEeHA3ak1nbG5iNVJOVWhUdFUyRVZDd2tUcklw?=
 =?utf-8?B?VVVmZktlQmRxRGVaT05UdEpicENJRmRnWC8yNGZlQU90TE1nRlVGL2UzcSti?=
 =?utf-8?B?aVhiQ0FWU2JjZUJWOGVSQnNmQlRCN0I0UmtLb0haczg1NGYvTnhyZXBiM0Fm?=
 =?utf-8?B?S3YveDZVcVNnWklwMkZlMjYwNkZnaTByako5MHVUVE5hTG9CTEZROWNZamx5?=
 =?utf-8?B?UkltakdhMU9nN2RlbnRaeGhOWnJJZmdsZnV6ZHgxbkhMK2o0c0Z3SWZLcFQ0?=
 =?utf-8?B?TnFkdEgvWjlmU0hDWG1OaVltYWhVWDg2bzRBd21xRU5SN2x2bGVXcGg0Q0di?=
 =?utf-8?B?OEs0anlpU0ViWXFFK0ZoOTZIT3JCbGhhNUVjY2diY2I1clpXOTB5cVFjcDFr?=
 =?utf-8?B?SldKZXVZTUNhaWZoeGJENmRYTGZReUNYWkpPMENkNXlSQmNBamphUjRZaGR2?=
 =?utf-8?B?ZndDZmRXOHJwSjh2MCtyaXNianRPS2F6R0ZyNWhhaVJYbnFvSUFrTmVuRHdZ?=
 =?utf-8?B?RXFHNWF3RlB2UmE2bmd6aFF0YnJNUUVSZHVwaFc3dGQ1R1BWK3RDSU9mVVpx?=
 =?utf-8?B?cXFqa2VReEdzSGJIM2ZZblJiTUczSVlFVkRLb084UVllTFB0b28raENwMkt4?=
 =?utf-8?B?T2VDT3ZVeW1kaTBKV0VjbzM0aDBISUhEODdOczlyV3RxMXQvSUc3U0ZEZlpi?=
 =?utf-8?B?NmgrdlFhQU03MkdxOFlhc2Z6d0pRd1Fabi9ESm5nV2MzU3djdWNGam9iRVhK?=
 =?utf-8?B?THhXcUNHRHVYZ0hrRktjMk0zdmxneURaT1k1cFdoZ3UwYS9MSjR5ekpoOFl6?=
 =?utf-8?B?K1hyYkpJSGhibmlTbjJ6bmh0Y01TUnljL1NhWjdISUJGTndTU0V5VW12bHdR?=
 =?utf-8?B?U01tOEUzd1Nnb0lNOWdMU0ZCcDRsTzROYmtCUitaOUpyVDdpTmdVRDFXUzdP?=
 =?utf-8?B?L3YveE91NEZ4akRBVkVtOVM4NVRLSWlnczAzWjVZN0lFUzJJbHJCcmw4Z2M2?=
 =?utf-8?B?bG1aL1Qrcy9qN093dGdzMnRQRDBaN1FHK05FcmlXSkw3dXlPNURZMlRFb3NF?=
 =?utf-8?B?T1RaazU3K0locUdTTjB4VjhqS3FBdW5TT2VHQjRQcTV0aHUycEwrVkhtaWtt?=
 =?utf-8?B?R1A5aHNqYUJHamt4TEltWGc5YUowcmM4QU1VN0ZpSUZmbGdPRE5xZU9kamlv?=
 =?utf-8?B?N3JCYTdtODB0TG9ESjdmdWV6bG5Pc2VvU0Y1dEhpdlhzRjhVNkJoTkdSY0Q5?=
 =?utf-8?B?Qk05ME9sN0dDOXY1VTJCd3pEY1lhajZheHd4bTVsYnd5SjhoZ3IzbFAwcU14?=
 =?utf-8?B?c3paTFRDSVJSZFFMSGNobmk4MHo3dHJkNENEcXoyU2dUT25SMWl1K2h3S3Y2?=
 =?utf-8?B?bDBmMkdPTmhpZUoyNUJ3ajFodU5MYWlMbW0yZlRvYUFLbXhnUVRkaTZIVVVQ?=
 =?utf-8?B?MTd5a2pNWXZvVFNUVDV4NzEzNXJHMEdKc2FOdTg0bGpjYVVTSFBFRjZRQ1d5?=
 =?utf-8?B?UHFuQXpzL0ZWaTVGMHQ3Und4UzRVVks4K3l0S3J4UW1BOTlrNzhMRzhoM1Zp?=
 =?utf-8?B?VDdodGF0QUFnaUl1MWtUV1lFL1F3N3pxNEtKOHFtWTcrUGthK3NhUTdEUzVl?=
 =?utf-8?B?ZlpyZUZOV1pXL2lveThaSjA1ZHFTbnNrdDJmY1haVktwV1FoU0Eva21WZFFk?=
 =?utf-8?B?M1o3QnRZK1RYbDZEMXUzUUw2MFprNmNLOU92MXFvUG8wZURJZzlKNmxndTdv?=
 =?utf-8?B?anFJa3FSMjAzeW1TRTZSaFQ3THRzbjJwa1IrMFZ5dWVRSXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1J5OXBoVmZoTzg1TFFtRk5wdk9Td3dSc09xRklBOVE2Y0l4TGRhbXBpRSs2?=
 =?utf-8?B?QU8yb2ZYSk9qTEU4blhVekFLMmp4T3BpblJFeGxzYURvWVYxUUpyR244YW1l?=
 =?utf-8?B?OWxlV3h3UmFoQXlCNnFveEFWQ3lNRHl6SHpnKzhlY3BWLzU1YThZYS9lWkNz?=
 =?utf-8?B?eURuaWtKeWFpMjVocWxNQlVHUDhLdmhqTUxwUWduc0dwTUdvSU1oSnU1QzBj?=
 =?utf-8?B?QXc0NW93SkJSa0FMb2JrQSs2UFFuVktReWlXVU9OVkcrMmEzUWFMaGJZb2ll?=
 =?utf-8?B?YUc3U1grVThYbmpJdWFtdmNBTDFsRU1hRmdWbWlPWXp0cEM5elFwbkpmd2Nx?=
 =?utf-8?B?VHQ3bW9VNkZ1b0NpUlh1aThtZ1EvN1RQb3BxbnJDczNOYTRVQ09JSmhQcnJl?=
 =?utf-8?B?TWtHdVJZWEttN0VuNmRGSUw1UFR2V0VuelBTc0Y1ZVF6MjlUbHRhVWFOV2Vl?=
 =?utf-8?B?OTJtdlo2NFJsREdvSlQ3L1lTWjU5VmhZQnNjL1g3OFU5bW9XdUwrcXY5Y0NQ?=
 =?utf-8?B?OEhGU2RkTjl6TStwYlZYMXpUVEVoMWl0ZllwTTB5c0pJa1Rid1lZUU0rTlM0?=
 =?utf-8?B?Y3Z3WS9wdHU1Ym5mYnBFLzYxMzkyMHk3TlBKSkQwNDFpMGk1ZmpPNEZIYW9n?=
 =?utf-8?B?a0o1OEd4T1lCbWJEQ09qREI2ak01bys0eXIxUDBrYi9pS2pGa3k2SEVWQTdm?=
 =?utf-8?B?T0lJQXEvTWJadHg1SDN5Z3JSbGJGRU0wbTRNV29sRzYydFU3VGt0Q3YvaE1n?=
 =?utf-8?B?REl2Z1VteEs4Z0ZLcW5kcjR6N21QeCt4WVVSS1FwMnNBcmNreTJzMzByNHZ5?=
 =?utf-8?B?dFM1ekcweTZPNjliSm1KbUxSZGtHb1VIbXV4NWxwdUsxOUoxNy90bTJBWk5k?=
 =?utf-8?B?L3BkeFFwd3lWWGhjRStkenRMQ3N4WTd0WlE5YUhQU2NnVXFLeVYxdVZpWjEy?=
 =?utf-8?B?VVVyRzhZYVNlZXdGNzRxT0xaQkVnZmdlWUdTSHBCcHpYMjFKb2FRb1lDSVow?=
 =?utf-8?B?ZVRVV1Y3R0VFcGVYOXA0UHFFSEJ4MWNBRmRLVkNqUU9XZER3bysvcS9ub1E1?=
 =?utf-8?B?M1pvZFJ0QzA3QW0yRWluQzRDM2VDbTJmSGdYRFBEbU56U0NSZDNyYlh4c2tR?=
 =?utf-8?B?YTFpcHFldCt6RVNBSmtXRk9HNjZ4ZENtSlcyZnRWWGx0QjRRMzU4czhrZm1C?=
 =?utf-8?B?eHdzQXhiL1kxMXI5OEtKQ1JWSERGK3ArMVpxSFluTEwzUDJiOFk1QXlYMklN?=
 =?utf-8?B?RXdRY20xNXZPd3FWOHl2NlN4MExoY243M1NFWDU0SVlQeWF1ei93cE9OYkVn?=
 =?utf-8?B?d2t0ZlZiZFZjcVBUdmFWaUpiWFlmc0o2RzBpeFUwRkRYcnZaei82M3huL21P?=
 =?utf-8?B?bFBGMFNtNmcvQnFuaEgxa1RLMmYvWjlqNVI2VFdzb21TbEdsclZoa1lSaG1l?=
 =?utf-8?B?UjdQdnh3RnZLSDdDclI1bmhqYXlxdW9ETUpTazNxMFVrOTVxSE15NHYvenZC?=
 =?utf-8?B?clVzNExTaDBIRVZaUGJCRjlDZ1JobTZYMGQvT2NNMDV2TDB2eDF1WGxhdjBo?=
 =?utf-8?B?Z0RFeHhrazhKRTA5NE4vZ1dqeGJnWWxHL0Z5dUM1dW41dE5Qb1BVTmxoUC9w?=
 =?utf-8?B?ck4yUzhyeUx0QjlZNFJyeDlTMnJEWndzZkNnUUVVK2JsVXZsQXl1UlV1aEJl?=
 =?utf-8?B?Rnh2eUtQZGgxdHRJb1VMRDhyRThrcG9VSGR3TWZmQURYUENIYzM1RVVoZGhL?=
 =?utf-8?B?RUQySWtRVGVVRWl1bUgyLzh5eGlOejRRSllNeTFkcEFLczlpNkRYNFlNVVZp?=
 =?utf-8?B?dGM1WlpVRkkxUG5La3orbndxVEJoNk5mS3UwYXB0U1hRd1hKcFlrL0N3NkJ4?=
 =?utf-8?B?MjJUaEJDM0lMQ2NiRkxxbm0zOWRHMVlWcEdKN2FmZWN0dlc1TFNhY2QzZGR4?=
 =?utf-8?B?VW9aem1OL0xPR2FXN05DMHhRdVc3dlBNOUtuaHozVWJlcWVIY0plRWNEYUF1?=
 =?utf-8?B?NDBCUTNhbEhQZTR1b2w2ZkZTTXFYRG5JQXlGbkY5ZGZPc1I3aC9MN0U5bjJH?=
 =?utf-8?B?aE10REpTSHZ6OVFtZFBjVnZLbW54aFhOSk5XYmlMR2d1MW9TZlN4QlpqOEI2?=
 =?utf-8?B?YmswK0NTRk5MZy9naDFTQWs3cWpqdm9Zbi9icmI5cmtqVFF3NkZsakMycGhn?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59FBCFD78FBBB84CBD4AADE08A8DB899@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7daab593-a0d3-40c4-b4dc-08dcc641f01b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 02:42:48.2903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQAOV/aOLVm4KbNVLyuLpqYEJff+1sL6rJJpu6/8OCadkQEbMSgRnhKBDIFjfZJWsuPO+SKWx37u+JYmlGoDUHcfE4MEQe9qHuftPX/0df0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8137
X-MTK: N

SGkgU2ViYXN0aWFuLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KT24gVGh1LCAy
MDI0LTA4LTIyIGF0IDE4OjExICswMjAwLCBTZWJhc3RpYW4gRnJpY2tlIHdyb3RlOg0KPiBIZXkg
WXVuZmVpLA0KPiANCj4gT24gMDcuMDguMjAyNCAxNjoyNCwgWXVuZmVpIERvbmcgd3JvdGU6DQo+
ID4gRmx1c2ggZGVjb2RlciB3aWxsIHJlc2V0IHRoZSBkcml2ZXIgdG8gZmx1c2ggc3RhdHVzLiBJ
ZiBsYXQgb3IgY29yZQ0KPiA+IHdvcmsgcXVldWUgaW4gYWN0aXZlIGJlZm9yZSBmbHVzaCB3aGVu
IHN0cmVhbSBvZmYsIHdpbGwgbGVhZCB0byBnZXQNCj4gPiBkc3QgYnVmZmVyIE5VTEwgb3IgYnVm
ZiBkb25lIHdpdGggb25lIG5vbi1leGlzdGVudCBzb3VyY2UgYnVmZmVyLg0KPiA+IA0KPiA+IEZs
dXNoIGRlY29kZXIgd2hlbiBzdHJlYW0gb2ZmIG5vIG1hdHRlciBvdXRwdXQgb3IgY2FwdHVyZSBx
dWV1ZQ0KPiA+IGNhbGxpbmcgc3RyZWFtIG9mZiBmaXJzdGx5Lg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+
ID4gLi4uL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjLmMgIHwgNDUgKysr
KysrKysrKy0tLS0NCj4gPiAtLS0tLQ0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjLmMN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWMuYw0KPiA+IGluZGV4IDcwODBjYTNlMThiMC4uZmM0ZWUxZmI3Y2QxIDEwMDY0
NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMv
ZGVjb2Rlci9tdGtfdmNvZGVjX2RlYy5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjLmMNCj4gPiBAQCAt
ODgyLDYgKzg4MiwyOSBAQCB2b2lkIHZiMm9wc192ZGVjX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdA0K
PiA+IHZiMl9xdWV1ZSAqcSkNCj4gPiAJbXRrX3Y0bDJfdmRlY19kYmcoMywgY3R4LCAiWyVkXSAo
JWQpIHN0YXRlPSgleCkgY3R4LQ0KPiA+ID5kZWNvZGVkX2ZyYW1lX2NudD0lZCIsDQo+ID4gCQkJ
ICBjdHgtPmlkLCBxLT50eXBlLCBjdHgtPnN0YXRlLCBjdHgtDQo+ID4gPmRlY29kZWRfZnJhbWVf
Y250KTsNCj4gPiANCj4gPiArCWlmIChjdHgtPnN0YXRlID49IE1US19TVEFURV9IRUFERVIgJiYg
Y3R4LT5zdGF0ZSAhPQ0KPiA+IE1US19TVEFURV9GTFVTSCkgew0KPiA+ICsJCS8qDQo+ID4gKwkJ
ICogVGhlIHJlc29sdXRpb24gaGFzbid0IGJlZW4gY2hhbmdlZCB3aGVuIFNUUkVBTU9GRiBpcw0K
PiA+IGNhbGxlZC4NCj4gPiArCQkgKiBVcGRhdGUgdGhlIHBpY2luZm8gaGVyZSB3aXRoIHByZXZp
b3VzIHJlc29sdXRpb24gaWYNCj4gPiBWSURJT0NfR19GTVQNCj4gPiArCQkgKiBpcyBjYWxsZWQu
DQo+ID4gKwkJICovDQo+ID4gKwkJY3R4LT5waWNpbmZvID0gY3R4LT5sYXN0X2RlY29kZWRfcGlj
aW5mbzsNCj4gPiArDQo+ID4gKwkJbXRrX3Y0bDJfdmRlY19kYmcoMiwgY3R4LA0KPiA+ICsJCQkJ
ICAiWyVkXS0+IG5ldyglZCwlZCksIG9sZCglZCwlZCksDQo+ID4gcmVhbCglZCwlZCkiLA0KPiA+
ICsJCQkJICBjdHgtPmlkLCBjdHgtDQo+ID4gPmxhc3RfZGVjb2RlZF9waWNpbmZvLnBpY193LA0K
PiA+ICsJCQkJICBjdHgtPmxhc3RfZGVjb2RlZF9waWNpbmZvLnBpY19oLA0KPiA+ICsJCQkJICBj
dHgtPnBpY2luZm8ucGljX3csIGN0eC0NCj4gPiA+cGljaW5mby5waWNfaCwNCj4gPiArCQkJCSAg
Y3R4LT5sYXN0X2RlY29kZWRfcGljaW5mby5idWZfdywNCj4gPiArCQkJCSAgY3R4LT5sYXN0X2Rl
Y29kZWRfcGljaW5mby5idWZfaCk7DQo+ID4gKw0KPiA+ICsJCXJldCA9IGN0eC0+ZGV2LT52ZGVj
X3BkYXRhLT5mbHVzaF9kZWNvZGVyKGN0eCk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJbXRr
X3Y0bDJfdmRlY19lcnIoY3R4LCAiRGVjb2RlRmluYWwgZmFpbGVkLA0KPiA+IHJldD0lZCIsIHJl
dCk7DQo+ID4gKw0KPiA+ICsJCWN0eC0+c3RhdGUgPSBNVEtfU1RBVEVfRkxVU0g7DQo+ID4gKwl9
DQo+ID4gKw0KPiA+IAlpZiAocS0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX1ZJREVPX09VVFBVVF9N
UExBTkUpIHsNCj4gPiAJCXdoaWxlICgoc3JjX2J1ZiA9IHY0bDJfbTJtX3NyY19idWZfcmVtb3Zl
KGN0eC0NCj4gPiA+bTJtX2N0eCkpKSB7DQo+ID4gCQkJaWYgKHNyY19idWYgIT0gJmN0eC0+ZW1w
dHlfZmx1c2hfYnVmLnZiKSB7DQo+ID4gQEAgLTg5NCwyOCArOTE3LDYgQEAgdm9pZCB2YjJvcHNf
dmRlY19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QNCj4gPiB2YjJfcXVldWUgKnEpDQo+ID4gCQkJfQ0K
PiA+IAkJfQ0KPiA+IA0KPiA+IC0JCWlmIChjdHgtPnN0YXRlID49IE1US19TVEFURV9IRUFERVIp
IHsNCj4gPiAtCQkJLyoNCj4gPiAtCQkJICogVGhlIHJlc29sdXRpb24gaGFzbid0IGJlZW4gY2hh
bmdlZCB3aGVuDQo+ID4gU1RSRUFNT0ZGIGlzIGNhbGxlZC4NCj4gPiAtCQkJICogVXBkYXRlIHRo
ZSBwaWNpbmZvIGhlcmUgd2l0aCBwcmV2aW91cw0KPiA+IHJlc29sdXRpb24gaWYgVklESU9DX0df
Rk1UDQo+ID4gLQkJCSAqIGlzIGNhbGxlZC4NCj4gPiAtCQkJICovDQo+ID4gLQkJCWN0eC0+cGlj
aW5mbyA9IGN0eC0+bGFzdF9kZWNvZGVkX3BpY2luZm87DQo+ID4gLQ0KPiA+IC0JCQltdGtfdjRs
Ml92ZGVjX2RiZygyLCBjdHgsDQo+ID4gLQkJCQkJICAiWyVkXS0+IG5ldyglZCwlZCksDQo+ID4g
b2xkKCVkLCVkKSwgcmVhbCglZCwlZCkiLA0KPiA+IC0JCQkJCSAgY3R4LT5pZCwgY3R4LQ0KPiA+
ID5sYXN0X2RlY29kZWRfcGljaW5mby5waWNfdywNCj4gPiAtCQkJCQkgIGN0eC0NCj4gPiA+bGFz
dF9kZWNvZGVkX3BpY2luZm8ucGljX2gsDQo+ID4gLQkJCQkJICBjdHgtPnBpY2luZm8ucGljX3cs
IGN0eC0NCj4gPiA+cGljaW5mby5waWNfaCwNCj4gPiAtCQkJCQkgIGN0eC0NCj4gPiA+bGFzdF9k
ZWNvZGVkX3BpY2luZm8uYnVmX3csDQo+ID4gLQkJCQkJICBjdHgtDQo+ID4gPmxhc3RfZGVjb2Rl
ZF9waWNpbmZvLmJ1Zl9oKTsNCj4gPiAtDQo+ID4gLQkJCXJldCA9IGN0eC0+ZGV2LT52ZGVjX3Bk
YXRhLT5mbHVzaF9kZWNvZGVyKGN0eCk7DQo+ID4gLQkJCWlmIChyZXQpDQo+ID4gLQkJCQltdGtf
djRsMl92ZGVjX2VycihjdHgsICJEZWNvZGVGaW5hbA0KPiA+IGZhaWxlZCwgcmV0PSVkIiwgcmV0
KTsNCj4gPiAtCQl9DQo+ID4gLQ0KPiA+IC0JCWN0eC0+c3RhdGUgPSBNVEtfU1RBVEVfRkxVU0g7
DQo+IA0KPiB5b3UganVzdCBjaGFuZ2VkIHRoaXMgcm91dGluZSBpbiBwYXRjaCAyLzcsIHdoeSB3
YXMgcGF0Y2ggMi83IG5lZWRlZA0KPiBpZg0KPiB5b3UgcmVtb3ZlIGl0IHJpZ2h0IGF3YXkgaW4g
dGhlIG5leHQgcGF0Y2g/DQo+IA0KUGF0Y2ggMi83IGlzIHVzZWQgdG8gZml4IHRoYXQgY3RybCBy
ZXF1ZXN0IGNvbXBsZXRlIGFuZCBidWZmZXIgZG9uZSBhcmUNCnNlcGFyYXRlZCBpbnRvIHR3byB3
b3JrcyBmb3Igb3V0cHV0IHF1ZXVlLCBmbHVzaCBkZWNvZGVyIG9uIGNhcHR1cmUNCnF1ZXVlIG1h
eSBsZWFkIHRvIGN0cmwgcmVxdWVzdCBjb21wbGV0ZSBmYWlsIHdoZW4gdXNlciBzcGFjZSBzdG9w
DQpvdXRwdXQgcXVldWUgZmlyc3RseS4NCg0KUGF0Y2ggMy83IGlzIHVzZWQgdG8gZml4IHRoYXQg
dXNlciBzcGFjZSBtYXkgY2FsbCBzdG9wIGNhcHR1cmUgb3INCm91dHB1dCBxdWV1ZSBmaXJzdCBy
YW5kb21seS4NCg0KTmVlZCB0byBjb21iaW5lIHRoZXNlIHR3byBwYXRjaGVzIHRvZ2V0aGVyPw0K
DQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KPiByZWdhcmRzLA0KPiBTZWJhc3RpYW4gRnJp
Y2tlDQo+IA0KPiA+IAkJcmV0dXJuOw0KPiA+IAl9DQo+ID4gDQo+ID4gLS0gDQo+ID4gMi40Ni4w
DQo+ID4gDQo+ID4gDQo=

