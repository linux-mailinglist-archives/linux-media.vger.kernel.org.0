Return-Path: <linux-media+bounces-5602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A6985EF4C
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 03:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 425CE2845ED
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 02:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B42F14296;
	Thu, 22 Feb 2024 02:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lwH8DigF";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cDnPnhtB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8377E9
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 02:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708570163; cv=fail; b=Xq6t7t1/XzX8UHgPRVG2Z5DnxIWWRWR66Pafb7P34WOWkOi0YaTZDBhnHkRnGgpd7pJBLShUd4p0HV23tQViqm4bsxxtbPWV3G2Wm/avEU7/8pN7YPtIp3vWbz5V6VpXL2M12CNfZggbDJ12uhHLC5mZTjnd0pHS3hPhp9OkmpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708570163; c=relaxed/simple;
	bh=qco7uv0U9RubgK3+oy5gEwkl0RK9Kkysd/d2DkqMTfM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eVrdmEh6pvTf2i3nVyWn6MFa9yUbTRHGh1oQ40cYPtTOSEE2BthIA1VojwPneYdSO7PBg0hL7h1FmxExuX0l2VHCKo2Y8heBlbk3Je5cg7CdChn0itvV+zqAz2H39EmalAo5j9KIr9MQBAm4B7oIM7hqaiN8xHs00jxC/Ru2OO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lwH8DigF; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cDnPnhtB; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f4835828d12c11eea4ad694c3f9da370-20240222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qco7uv0U9RubgK3+oy5gEwkl0RK9Kkysd/d2DkqMTfM=;
	b=lwH8DigFU4LpaW4T9vaXeYE3lYAPxe09W6bLyDMcJGgT81x5/FCVmOjeYfsAvitljcmeX7tH+I7mJwzocchIJs/m6Jln4NUskZ8XhsuBvpEosW3nIbro+RbgsChuTt5YwRXImFoFc2EkpYlATpk5H/Apnd/mRGnsggjNdVzsp1w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4b1faa68-c2cb-4a2e-94ce-c57b1cb78451,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:1c9c2b84-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f4835828d12c11eea4ad694c3f9da370-20240222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 894260220; Thu, 22 Feb 2024 10:49:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Feb 2024 10:49:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 22 Feb 2024 10:49:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq2NlvbwoCEDSkjNGTa8jHvZEpJ9zgYRMwIIQuXWV1skA3QtxDXhSnoDg4oVxY+JYRniJClFHm/JZZ4L8T/y3/eUvtud801/0sPSahAVNrJo9P5+dM13Z+bwFJabji8ltkNCHLFs87KOQprKYShKTvOqnuG6ht24JDUGssTphzhgtLPD3KJaZDTOytiPpA1milMdgeqQtPu04un2wq+noGngkzi/A/l9c3nJ87WQPBjN6mp4Gn4q5kvZUlgBHd+GkelrysjBjit8oNqrLXUiZ8vr3vVhKTibooTvD0EpUWHozA1bPdtCuVy7pvhTsTFc4mYD0UZ9xiD/N5O210WZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qco7uv0U9RubgK3+oy5gEwkl0RK9Kkysd/d2DkqMTfM=;
 b=hfviwO3OMM10+mMiQSHmHfBW3jHroiaWL1pbT3dzujPz+k6QPceLDUkg6KmsBrvsEAw0XJsGNe3gJLoRSIa7CMNidmEJcMj+I+qGL/xZcy0PtD+8MAD4BwNl3YImLwfiSCpMiZclHIF8QkuGbl7B33d+M5dNHCRv2/I1xGi/Jk8WehzEeMcNRmXFkslpTpZPNvCckpUBEYsxqmoR1r+qFvy9COzOPfVaRSsz6+wPI3orqIn2Y6vjzJzs8O5gyIfRe/HmRmU5lB3YF+rxZlzOeY2LoXDdn6Cr3VoKLKSz+BJJr6sKOKBqtx7N94fjaTTkWHN421/0Mw7BbP4MzVeBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qco7uv0U9RubgK3+oy5gEwkl0RK9Kkysd/d2DkqMTfM=;
 b=cDnPnhtBZEu4wPstTIC8OB4/Dl3xg1IyAdcfwI9v6SPz7CrKoWhSDTW+wpLnkNX1x+9DSpsNffdiaZ7vY9tcvqMkE9PBfv8JRI0FbnZ6Rs+eY4LwMnf+sPGFMVWJB4EEBRUp95n4uNvS8jqsS8fBt/2awymMpiStlVPttvV5Jj8=
Received: from TYZPR03MB7955.apcprd03.prod.outlook.com (2603:1096:400:462::10)
 by KL1PR03MB6969.apcprd03.prod.outlook.com (2603:1096:820:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Thu, 22 Feb
 2024 02:49:06 +0000
Received: from TYZPR03MB7955.apcprd03.prod.outlook.com
 ([fe80::6c9c:3a85:4f94:cee6]) by TYZPR03MB7955.apcprd03.prod.outlook.com
 ([fe80::6c9c:3a85:4f94:cee6%6]) with mapi id 15.20.7292.029; Thu, 22 Feb 2024
 02:49:06 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Handle VP9 superframe bitstream
 with 8 sub-frames
Thread-Topic: [PATCH] media: mediatek: vcodec: Handle VP9 superframe bitstream
 with 8 sub-frames
Thread-Index: AQHaYmIK9aNgSG7hEEitn/Vbi1xNMrESKzMAgAODboA=
Date: Thu, 22 Feb 2024 02:49:06 +0000
Message-ID: <b1a4230964f3949e4f24747b53264f41721f4478.camel@mediatek.com>
References: <20240218115954.4038-1-irui.wang@mediatek.com>
	 <6bed645bc3ddd51092ed8f6e49672af40735c83d.camel@ndufresne.ca>
In-Reply-To: <6bed645bc3ddd51092ed8f6e49672af40735c83d.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7955:EE_|KL1PR03MB6969:EE_
x-ms-office365-filtering-correlation-id: a5ce171e-e90f-4d69-f1b5-08dc3350d662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BPkrTVwLBwoaBsf6VO6TGp1opKb6ooiZBZ/iEMPF0D1q7XHHXVSN3wDZWGWP/YLkY3bRQCCklXAwtuDSeJ20GfoWLfjUe7CU0/REsK0dorpKUoqBhVhmRQJznxSh5+C3Qec2/m0lxZoyz1sqVxYmQaH3/0iA/a+2aX8/rzsShZ8vQJ3WYLnrw/cX0yGB191j5eWUrZnRXXDZN+A4gRdtLVMCd1XvfWtJ7d9HLvwNXXHJseGhNE/e64mGP3I4Z02EsT3AKubDnzaU4c6ahXOw7Lw+eCEMON+d6Ciu/gCxqTphckyywFNnHpx2mv0nCB71ZokLfckb1frVKffuo5tMggs2eTn61fDIlHCuWkrCIr+rWwmVVsFbzarwRyw56/N2UtYsVFIp3u3AjylD0ZFNPvQGGFeid6/xAJCmoXvlTrWB45HHC6Em5IGsH/kJmKv8zvhusR5OCejB3KkHEY050AfWvQiO+VXoNANIhG1rzQ8qX/8I0AEMrcqODW4zqNzHYpEfv3jyYDle8MZz6dfMKbI9a1GdWlfrIB89OOR9d1PfFUaM4wMGqZbGmDq9JLRa97pfkyGGVCnfJI3BhoTufvggg26RZw03/jy8vqo6hWLpVcmRfUkVAk8ckP+c5Kkq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7955.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0FQNU1qZzUyYWVuSlg0OEF1VGtieC9YZUFjRHY5OExJSGZ0RnA3QzRUa3U4?=
 =?utf-8?B?RDNpTEFEWjJ1N3R6MTRpQXE2WEdrN0pHSXUwUFFFNSs0T25xaStVMUI5VlZK?=
 =?utf-8?B?SU1TelZtckxjRWZhODZ3TWJydGc1dTNGRHJIN1JHSG92TloySFRLSmpzNngx?=
 =?utf-8?B?blprQzBwMmt2TzF4MEJ4NWc0aUdJOXBiMjA3MVRjTCtuRDhGRVNuS24rS1pK?=
 =?utf-8?B?MjY3OW5zc0Y5WTlxQXVnRGJRMHoxaG5ZTFlIL1RNQ0xkWHQ1UlNRblZxQ3pa?=
 =?utf-8?B?cmdKUzliMTlZRk9qVHIwcnkyT1UxTDc1c1kzQ2dENC9WZVJ1U2VnY1g2VlNQ?=
 =?utf-8?B?UEFTMGhBR1BGTXJseWxheU9nM09ZcWdBcU8ydFRTM0p0TDJZRTZrWDB5UU5H?=
 =?utf-8?B?WERKUU16WGlsaExYU1EwYi96WWMreUFkQkVOQTZJUEJNeTJhQlc5NjhON0Qx?=
 =?utf-8?B?OFYyN3Vna3AvMElqWUlza2VLTkx1aG9NV2VIcS8yRjUyTVEyZmwwNWpKUk50?=
 =?utf-8?B?cEhTZ3NudnB1ZXJKZkptVThOU3lDZkh4bm9JZXc5Y2R0TlZQZlNhdEhraUFl?=
 =?utf-8?B?ZmFRNUNCTFNRMEhBYWVaeGFJUnRubXpLZ1lmV3JyL1d1UXViMkVZbnRUUUdM?=
 =?utf-8?B?UWVrc01TWVZNUHl6eG5aM3pHcEhIMkFNZHAzTGMrSERzY2psc0Iwb1NURWRD?=
 =?utf-8?B?TnU2Kzk1T1RaS2hmd2h4bEJuUVZDTmxFWmsvZHgzaTRld2czbnBVREpyNlJy?=
 =?utf-8?B?cjJmREYyT2NuRUkyR0tabExTcVdDL3pFZnNjS0VtNEVINU5DWSs2ZXltNjJw?=
 =?utf-8?B?dzU4aVViYUsxMis2REJlTlBzNWVRWjhTN1lCcUU5WVhBTmtwUWQzTkdkczBk?=
 =?utf-8?B?ZHd2L1Q3N21zU2hZTElpZjVMaUxXQ2N1dEx4blkwSzBoRVo2bHl1Ty9rS2dT?=
 =?utf-8?B?ZFpQbmppOVV1bm5TZzZKS1JjcjVrWDRFa3Jkd2JQRis1cDVxSi9JUVpWTWM0?=
 =?utf-8?B?SmhXVUZmcVdaKzJCemZWbWRWL29UL0pPYmVIZnRWbXRpeFB3N3M5em5JK0tM?=
 =?utf-8?B?amZvNkQrZlhndThzc0NqK2FhdG15SGNpeStqRFR1dGZ0ejFjS2plQkR4aVFa?=
 =?utf-8?B?V0oxMjQ3T0dvTmxGR1M1WDBQWkk0clM2MjRmeHVERDJSQUxudk9UbnNPVS9P?=
 =?utf-8?B?ck53OXgzeTdxWFplQWJZOEVsMy8xVTlPSFRGcHYwL0dDMVpRL1l1OTMvdUcv?=
 =?utf-8?B?OHhCV0l5WndCSk1pNFZyNVcxckV0SmNscjFKMFcrUWM2VEhxcVBNRGpGSlc2?=
 =?utf-8?B?NStqS0pQd3Y1NGRBMmdKSmd5NXRvSHdSZW9LeDRkWE5UU09sSHlOV016L2hZ?=
 =?utf-8?B?TUFPOWl5N05KdStmbFMxbVhFMXVUb2ZIU2o4blZUUlIxUDVKSWU2UGZVd2Nx?=
 =?utf-8?B?cStkVFlrdUtGODlxakJ4Vmx4U0hWTXR5dk4xblgzeVZuRlN1U0VzTDh6WVQ5?=
 =?utf-8?B?NXcxYjZUbnJobkhPWVh2VlRBU1VzRWxKZ0tLQkJkMXJ4dk5zVWdMd2ZSSGcz?=
 =?utf-8?B?MVplZnJyMUQ0Qmt2NEJPendubDZWY0w0WHFyNzY1OUZ1SEJub0V6WnVPUjNJ?=
 =?utf-8?B?eDZCM3JMSDE5SzBUUEhlOXZTZStXT0xYVXU5eEFJKzN3N2ZEbUdrRFFXSEQz?=
 =?utf-8?B?Tk8xUzIyMmVlVm5FNHh2TEt5V1QzYmJ6aSszRFZOT2ZzeXFHR1VNQ2ZxMWFS?=
 =?utf-8?B?RG0rMWsybVZWaTQ1LzhuQnlpL2d2YzhhUTlBbFBwc280ekw3WlFFU3NjZU0y?=
 =?utf-8?B?aWg5MTZTdTBGeTlRTStaUWNGS08yWks5SUJWdk9UbEppRXArc1BjZFkzaUFk?=
 =?utf-8?B?SUJEYVozMUxMaml1dDVpSUVQTVBLVE56bGFzOWtwN2VGOVZiM2lWcWNZamo5?=
 =?utf-8?B?bjZjclBJRVUxMUxSZE1qQkU4bmd4eHVXUHo2bEFIbExkT2lOM2svYmt2ZnVi?=
 =?utf-8?B?a1NEcVNOQXg2RVZBOHg4cWxtK004VkhUeFFlTFJQTS92Uk1kS2NwNHNNSERv?=
 =?utf-8?B?VjBxVkptWW9BUlF4bC8zUGZLeVBtRG1OUWpZY3A1QU9HYUEzazgxMmVteWZP?=
 =?utf-8?B?T3ZFL2xGWE9ySUx0OVRINXlOUUQxZWNzU2FNcktyR3pWMk01TE9MTGc4SGgy?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E720568A4DFB94D88933FD7E185887F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7955.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ce171e-e90f-4d69-f1b5-08dc3350d662
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 02:49:06.6933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpc1L6tpsPCE+9OTe7WDSNkQX6ocJyOwCo8hWP2KMz+ta4nc++xJ/gH4oedl8yxt28jxaJCQZwM8ieEG4deH7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6969

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3aW5nLg0KWWVzLCB0aGlzIHBh
dGNoIGlzIGp1c3QgZm9yIHRoZSBWUDkgc3RhdGVmdWwgZGVjb2RlciBwcm9jZXNzLCBzbyB0aGUN
CnN1cGVyIGZyYW1lIGlzIGhhbmRsZWQgaW4gc3RhdGVmdWwgZHJpdmVyLg0KDQpPbiBNb24sIDIw
MjQtMDItMTkgYXQgMTY6MDkgLTA1MDAsIE5pY29sYXMgRHVmcmVzbmUgd3JvdGU6DQo+ICAJIA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiAgSGksDQo+IA0KPiBMZSBkaW1hbmNoZSAxOCBmw6l2cmllciAyMDI0IMOgIDE5OjU5
ICswODAwLCBJcnVpIFdhbmcgYSDDqWNyaXQgOg0KPiA+IFRoZSBWUDkgYml0c3RyZWFtIGhhcyA4
IHN1Yi1mcmFtZXMgaW50byBvbmUgc3VwZXJmcmFtZSwgdGhlDQo+IHN1cGVyZnJhbWUNCj4gPiBp
bmRleCB2YWxpZGF0ZSBmYWlsZWQgd2hlbiByZWFjaCA4LCBtb2RpZnkgdGhlIGluZGV4IGNoZWNr
aW5nIHNvDQo+IHRoYXQgdGhlDQo+ID4gbGFzdCBzdWItZnJhbWUgY2FuIGJlIGRlY29kZWQgbm9y
bWFsbHkuDQo+IA0KPiBXaGVuIEkgZmlyc3Qgc2F3IHRoaXMgcGF0Y2ggSSB3YXMgY29uY2VybmVk
LCBzaW5jZSB3ZSBkb24ndCBhbGxvdw0KPiBidW5kbGluZyBzdXBlcg0KPiBmcmFtZSBpbnRvIHRo
ZSBzdGF0ZWxlc3MgQVBJLCBidXQgbm93IEkgcmVhbGl6ZSB0aGF0IHRoaXMgaXMgZm9yIHRoZQ0K
PiBzdGF0ZWZ1bA0KPiBkZWNvZGVyLiBQZXJoYXBzIHlvdSBjYW4gaGVscCBtZSBhbmQgcG9zc2li
bHkgb3RoZXIgcmV2aWV3ZXJzIHdpdGgNCj4gc2ltcGx5DQo+IHN0YXRpbmcgdGhhdCB0aGlzIGlz
IGZvciBzdGF0ZWZ1bCBkZWNvZGVycy4NCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXJ1
aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9pZi5jIHwgNA0K
PiArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9pZi5jDQo+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X2lmLmMNCj4g
PiBpbmRleCA1NTM1NWZhNzAwOTAuLjRhOWNlZDczNDhlZSAxMDA2NDQNCj4gPiAtLS0NCj4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192
cDlfaWYuYw0KPiA+ICsrKw0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9pZi5jDQo+ID4gQEAgLTUyNiw3ICs1MjYsNyBAQCBz
dGF0aWMgdm9pZCB2cDlfc3dhcF9mcm1fYnVmcyhzdHJ1Y3QNCj4gdmRlY192cDlfaW5zdCAqaW5z
dCkNCj4gPiAgLyogaWYgdGhpcyBzdXBlciBmcmFtZSBhbmQgaXQgaXMgbm90IGxhc3Qgc3ViLWZy
YW1lLCBnZXQgbmV4dCBmYg0KPiBmb3INCj4gPiAgICogc3ViLWZyYW1lIGRlY29kZQ0KPiA+ICAg
Ki8NCj4gPiAtaWYgKHZzaS0+c2ZfZnJtX2NudCA+IDAgJiYgdnNpLT5zZl9mcm1faWR4ICE9IHZz
aS0+c2ZfZnJtX2NudCAtIDEpDQo+ID4gK2lmICh2c2ktPnNmX2ZybV9jbnQgPiAwICYmIHZzaS0+
c2ZfZnJtX2lkeCAhPSB2c2ktPnNmX2ZybV9jbnQpDQo+ID4gIHZzaS0+c2ZfbmV4dF9yZWZfZmJf
aWR4ID0gdnA5X2dldF9zZl9yZWZfZmIoaW5zdCk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gQEAgLTcz
NSw3ICs3MzUsNyBAQCBzdGF0aWMgdm9pZCBnZXRfZnJlZV9mYihzdHJ1Y3QgdmRlY192cDlfaW5z
dA0KPiAqaW5zdCwgc3RydWN0IHZkZWNfZmIgKipvdXRfZmIpDQo+ID4gIA0KPiA+ICBzdGF0aWMg
aW50IHZhbGlkYXRlX3ZzaV9hcnJheV9pbmRleGVzKHN0cnVjdCB2ZGVjX3ZwOV9pbnN0ICppbnN0
LA0KPiA+ICBzdHJ1Y3QgdmRlY192cDlfdnNpICp2c2kpIHsNCj4gPiAtaWYgKHZzaS0+c2ZfZnJt
X2lkeCA+PSBWUDlfTUFYX0ZSTV9CVUZfTlVNIC0gMSkgew0KPiA+ICtpZiAodnNpLT5zZl9mcm1f
aWR4ID49IFZQOV9NQVhfRlJNX0JVRl9OVU0pIHsNCj4gDQo+IG5pdDogSSdkIHByb3Bvc2UgdG8g
ZGVmaW5lIGEgbmV3IG1heGltdW0gKGNvbnRyYWN0aW9ucyBhbGxvd2VkKToNCj4gDQo+ICAgI2Rl
ZmluZSBWUDlfTUFYX05VTV9TVVBFUl9GUkFNRVMgOA0KPiANCj4gVGhpcyB3YXkgeW91IGNhbiBy
ZXZpc2l0IGJ1bmNoIG9mIGBWUDlfTUFYX0ZSTV9CVUZfTlVNLTFgLCBhbmQgbWFrZQ0KPiB0aGUg
b3ZlcmFsbA0KPiBjb2RlIGEgYml0IG1vcmUgaHVtYW4gcmVhZGFibGUuIFRoZXJlIGlzIG5vIHJl
bGF0aW9uIGJldHdlZW4NCj4gVlA5X01BWF9GUk1fQlVGX05VTQ0KPiBhbmQgdGhpcyBtYXhpbXVt
LiBUaGUgbGltaXRzIHNpbXBseSBjb21lcyBmcm9tIHRoZSBmYWN0DQo+IGZyYW1lc19pbl9zdXBl
cmZyYW1lX21pbnVzXzEgaXMgZXhwcmVzc2VkIHdpdGggMyBiaXRzLg0KPiANCj4gcmVnYXJkcywN
Cj4gTmljb2xhcw0KPiANClllcywgZGVmaW5lIGEgbmV3IG1heGltdW0gbWFrZXMgY29kZSBtb3Jl
IHJlYWRhYmxlLCB3ZSB3aWxsIGNoZWNrIGl0Lg0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcw0KDQo+
IHAucy4geW91ciBjaGFuZ2UgbG9va3MgZ29vZCBvdGhlcndpc2UuDQo+IA0KPiA+ICBtdGtfdmRl
Y19lcnIoaW5zdC0+Y3R4LCAiSW52YWxpZCB2c2ktPnNmX2ZybV9pZHg9JXUuIiwgdnNpLQ0KPiA+
c2ZfZnJtX2lkeCk7DQo+ID4gIHJldHVybiAtRUlPOw0KPiA+ICB9DQo+IA0K

