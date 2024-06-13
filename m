Return-Path: <linux-media+bounces-13155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D290659D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6BE1C21DA7
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 07:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6B013C80A;
	Thu, 13 Jun 2024 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ThOT3If8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="S161H7QQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD313C9D4;
	Thu, 13 Jun 2024 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264962; cv=fail; b=j3sSozazYKoT6CghVf3JNrnGpkLHtcNCe++n8INwOrUaV5R2mKiHaoOlChgEW0anCBFPPh2ACpQdF96PtgLHPv/Z8t7aNJkMAvyVabGsAuecm+7tsUMwfwydc0/JWFilKBfMeTK5QFdXS7KtY7AWFZ96bXRQrYgEP8VV2sCauVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264962; c=relaxed/simple;
	bh=sKfndYeftqzFMNn/3+jhQGXCnMZ05D7cHV1SjFHuqNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Li1UqAzxfbbmtHsN99p0eoZAGp7CuWfknqxonCzdBYzBoZJPZwzk3jKfTYv7ls+LWBDcT2pIFsS01M7SBCgN4SeCTbozY+rJjjaysn+CY7rkhPPysP6eK07NP8gCvsPcxdJV+xi8ON7qaOlyEHSUEGTyoTWemw2LTF/lNT51EUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ThOT3If8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=S161H7QQ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6d531d4a295911efa22eafcdcd04c131-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sKfndYeftqzFMNn/3+jhQGXCnMZ05D7cHV1SjFHuqNk=;
	b=ThOT3If8AjmqLQQHJ+BJjyoe9mKiWD4db5+SYNwRouyqwQLLGYxZgG8ttptpj9cztExl8s8yEW7urglj6noYqWQM8Vm9/DQiJW1ksS9nxsqwqY0IyiM8uzhsAHgsoJqEYDLQbmuSpUhmHUbIELy4V55fUsdWUS9XxuLacqKKU9c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:35728873-5918-4a5c-b03e-7a703a61c727,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:107df093-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6d531d4a295911efa22eafcdcd04c131-20240613
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 115815991; Thu, 13 Jun 2024 15:49:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 00:49:12 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 15:49:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0SxXT954DnXKaMteIdZO7j26CpyKprqhwNJbRITBkiGs5SBXfVRTdT0WB0x9Rq/h3JRU7TI1OPbbjMzItx8ktSB5AW+/e+CPotBTkbTnaZm7BGwRnYoJDbp5sudT9uTY1hgJZ+XBpmi10rrpvNVntu6t4tUC2eNFRHIAwllyVnKlWeJKc7BSucGXqQOpibRo/uyZD+Ef2wypVX/r1A0MDObnstFtEsIDnrOKcLHG/zdmPzhnzk/xY8NbeLhguxawumhyDYTMn9LHNymQZuL5yZ4e7ZRJABmjQ8SgmkojMgoBJiS1H8v2bUvsgn0tB5cGkPqR/bBck22QhSpbdPmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKfndYeftqzFMNn/3+jhQGXCnMZ05D7cHV1SjFHuqNk=;
 b=IL4cf6aTluyncaIcfCZqnv0AUOSbDmPyyblQsblX/CwWp/qOX8fSSM7VvjyJ8gOahnN0kACLKMhUqyX2EfPktNPotmyH6fb0+rcMEYHfEas2yLWjLaJ09cMIvr1eaExmFZGe91G/J6DQEgC8zp2mCw9WfSC8xqbYexdjkFF1s/J3PYuZb0OQWNc5NSRCrkG+4fSgxuM3PltDBCOTAgKWrePQeEjmvJs+1OJzc0nIjTmyaoEVzKb2ZXK+mozmTY8e+fmzEJosY3DLrxSW9Aw+Qo01Bwkks7o11kHuq1IceRZARcSJxYYzD1zwsDs5xcHjZmbFeDDapl1hhBcQHDuIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKfndYeftqzFMNn/3+jhQGXCnMZ05D7cHV1SjFHuqNk=;
 b=S161H7QQ481BjQTX7U101bNQ6D0usIbrgCiSCz6xP8J7i2RSpMHuJ86NTmp4zFpXNencHo4wSfu8rzO3et49bT0+K7LVpAvVMLRavTcNEVb+3ERepzfojL3Gbyo8CQjFW6irg2xFeXjyC0GNwPKFqQR+dj2CdtjXCQKW1vp1JVk=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYZPR03MB8803.apcprd03.prod.outlook.com (2603:1096:405:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 07:49:07 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.021; Thu, 13 Jun 2024
 07:49:07 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [PATCH v2,4/4] media: mediatek: vcodec: replace
 v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Thread-Topic: [PATCH v2,4/4] media: mediatek: vcodec: replace
 v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Thread-Index: AQHadgUdegHHcYyYAUu6c5+YdQrNGbE5J7CAgIy4mgA=
Date: Thu, 13 Jun 2024 07:49:07 +0000
Message-ID: <0f6897a6e080b63873b997ec54e65707d15c7c0c.camel@mediatek.com>
References: <20240314114452.17532-1-yunfei.dong@mediatek.com>
	 <20240314114452.17532-5-yunfei.dong@mediatek.com>
	 <69C5D24C-D33A-4F1E-B9A9-6C32AB1951BA@collabora.com>
In-Reply-To: <69C5D24C-D33A-4F1E-B9A9-6C32AB1951BA@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYZPR03MB8803:EE_
x-ms-office365-filtering-correlation-id: 8f93c4fa-34d1-4f3d-a4ab-08dc8b7d4de0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230034|376008|1800799018|366010|7416008|38070700012;
x-microsoft-antispam-message-info: =?utf-8?B?bUxXSDlYbTJOMWpKTERiK0JEZU9LOTVlaWp2Y09RM1ZlN3o0YnVkVloxcXpW?=
 =?utf-8?B?Q3RTakxKRWRIZysxbE9ya2wrSkdNaHptOWlvWEp6Z1ZpTmY2UCtSL3N0S0VB?=
 =?utf-8?B?UmxxZ2JIRXNvRThkR25TbWg5QzFjSk45QzZldHdGYk13bmpEN3d0eWlxRS9v?=
 =?utf-8?B?NUxya0E5VUtOTUY3eXdGM1JuUkxmWFhLOHE3T1RYTVJpTzY4d0IxQk14ejhq?=
 =?utf-8?B?NGlZSlNTZDVQbkp1alVQS01tRWIwTzg1R3NIYzZCeTRGcjk4UnBSWFlFRFhx?=
 =?utf-8?B?dTFsdjFaeHZjZlJqUHBFQ3pjdU1zSmlUQ1BmdXZqeU10SmFPMTExVjZwTUU2?=
 =?utf-8?B?N0R0WHo2WWNYbDJHVzlmTWhMSmxVSzJkT05obXRjUm1xTHYwWE1KR21OS2Zm?=
 =?utf-8?B?K0ZaVlhIYmF6clBoU09CNVV2L0hHc1lmbDArZVdyaEFVMTFHOVduTGwvZmRN?=
 =?utf-8?B?QnVUaEtsNWZScU9wS3duN01WbHZ4Vy9OTjN1bFNRM0FQVHVXT2ZZWmhBT0ZI?=
 =?utf-8?B?VU9jbXdJSWlYK1lLMHEzdzBLc3AvYTZleEl1T2lMTnVLbUw1cFBKMWx6REFL?=
 =?utf-8?B?NHF4azZTMFpzekpEaDE2cUF6ZGkyZGFqeWVuaG9MSWZRcjlNR2Q2cTdxUDZ5?=
 =?utf-8?B?WEJJdTluVWZFTFB1bFFHM01HajdwQWxSRkhETEs3V2ZrOW9iNVJUZmY1Q1ZH?=
 =?utf-8?B?M0lBL2dvQ3EwT2lBNEJERFV5NTJqMEpYTTVBMFJDWnZ1ZXpwckhOZDR4dnZj?=
 =?utf-8?B?SGUvdmdub3JIRGg5RWsxUEIrbE1jSzN4WjJlcVd4LzdsWEVtc3F2eDRrcnFj?=
 =?utf-8?B?YW0rZUZFRjJPYWdBRkNySVhUckRjMUJNb1lTZEFrSDA3T1BrMFhDczZIOFor?=
 =?utf-8?B?Zmhka3lsMUhBNVQrRnF3K29FZjBhakpNRzQ4QlAxeGlKUXR4YzZZZGliMFpZ?=
 =?utf-8?B?U05EZlkvVjc5UDJyRUVhWHlpNEhsRWNzdHgzM29ZWWQrK3ZNUitlcnhQK2wz?=
 =?utf-8?B?Vy9LcnFKTm4vaU5XZHQ1ZTRYTTV3VHRyMitWNHVIZDlqMUJPZjF5dFh3ZDRC?=
 =?utf-8?B?cUlDNm5MVVFXSXR3VU9CdEdZazBkR1Y0SDFmZHRqMkNxTjI2M2hQSnd0Q2dv?=
 =?utf-8?B?R0QvUVVtdFJUVVQ5VkdsWW1lbEN0bGRqNHVoRXlNZDRldC9BSEU2b1BoemVH?=
 =?utf-8?B?Ky8ySFlhS2RCRmZrdWMwTFMvZnRTc3lqdHQyTVFTc25seWt2TWV4ZTY1UVBS?=
 =?utf-8?B?RWpKMGtpSURNWXlUZnZGMDQ0RTgxT0c2akRFYWhlRndkNk04NEl6emxIcmEz?=
 =?utf-8?B?NkQxWmgxcGU3U3R5VlpSMm0vSkNyeFZ0QzNjRVR4OXBIS2Z0NEd3NnJMenls?=
 =?utf-8?B?djRReU1sTGEzUHp3QmdOcjArdFUxa0lzT0YvUHRhSXZ1SEp6TGlvSlZ2OVFE?=
 =?utf-8?B?VXdiOE00L1Z5SXZxSGx4STRPUTBsM09DNHM0eXovSDUxZUI2ZDBxam5zd3l0?=
 =?utf-8?B?VE5aS1VYb0t0V2ZKMDVqM3hZcVQ3ZFBVUmpsZSt2Ly95OXY3N2JGZU1NNVU4?=
 =?utf-8?B?S3cvYVBhLzZJY0dvUUVoWHJLcVlyVFY1c292R1VoeHVISGlNWkJZWjN1TE5h?=
 =?utf-8?B?c1FmaDhQRmZsdXNvM1AwV1o0VEtEL0oxVG5YZGl2V0tvZGdaL21PWU1NN2I4?=
 =?utf-8?B?bGdFbnFIVzdyRFNYZWxvNUhWbDAzRHFVWkJtTTVoTDgxam1lb1o3M3ErcWVP?=
 =?utf-8?B?U1ZJKzZicmt3U2FEQ1Nxai9HQ0tHa1ltNVlLc2dudmRiZGs3UFdCRGNPa0I1?=
 =?utf-8?Q?6xJLWMeG59gJM0FfxX/1prEcKcI8c9zfWKG7I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010)(7416008)(38070700012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2c0WFpuSEVlMkNzQlk5blJaWXJqOVBNTHN0eEpCSlZSUG1lWEZCSElnUFFF?=
 =?utf-8?B?VVRYVW9POTEzY3V6Wkl1VERXRTRjZGFkaUhReFg0UGhnQUFvblg4aVpra1Vs?=
 =?utf-8?B?d0s1OEJJV1pPZUVPT1lRZ2JPRHFVOS85M1U4bzdHSEw0WTFWSm9KcEF3a1Ir?=
 =?utf-8?B?ZHJkelRRVStEa0FudUlZK1hnZE5qUkt0aHNOd1VXeHpCVm5ERnl5dW5kOEo2?=
 =?utf-8?B?UG5oSHpGRXAyUDYxMEVhNzJvVHRwbXZseHdWZ0V1ZGJTbloxT3ErZVYxOU5z?=
 =?utf-8?B?TlhpeHpJZGFDWFpsMXZ1VFZtaHQ2L3R5dDJHWmxuMWpqNWh5RGFQWHJTVERP?=
 =?utf-8?B?MWZtdVZPVk9kVUN6eE5EK3VXNzJHdHJFN0UzZnY4SDRMVUhiSjNuWmVXWFBm?=
 =?utf-8?B?WE10WnlxRXZ3MTM5dm02RjBFTnNPY2dzd3NyOXdicTBKY01jQkk5Smh2Y2I3?=
 =?utf-8?B?VDFSL25paHArZHdDbmJyZEpVdGZsK0ZsNDFRbVVpTkl1UHJwRm1pQ2xqMkVL?=
 =?utf-8?B?bDdqd1UzVnZBdFBGVTF0TEhvekdtbjhaQmIrcUtzWWYySnIvYXJ4Z2hrMWJk?=
 =?utf-8?B?SlFEMlEzaUJwZDd3QjRYZ2RQU1VNREoyMGJCOUNXbDBUOTF3TWNwREg4SVQw?=
 =?utf-8?B?REZSb3JsL1JuQ0ZEVVhTeEJETHZkMlk3QnJyd2FQTkVVd3BWenBPcjJyTXlz?=
 =?utf-8?B?dkttM0xYaGpUa0J1Q1J2YThLMTJycEZZOUYrem55Wm1BNk16dk1pOURpZTBz?=
 =?utf-8?B?M2pmMFQwd2xzN1FSZ0d0bTU2YkFrSld0RVNhK25LQzJYWllONXB5b1RLMVVG?=
 =?utf-8?B?TFEyNHFUTGNNai9uYjdJa2x6S0U4WDVVR3BhREpobUxLSm9BSXczc2ZSbDhl?=
 =?utf-8?B?REw3S1h3K2xCbFlXYlJtclQxdE9Gd1J3S2pFcGt0WU5nNlB4Nzh6M2lmU2lB?=
 =?utf-8?B?NlVwd1hjVVNPRC9CaHJKd3Fxd2M1cjMxVllGR2pJOFVmWDhMRVd0c1BJajBi?=
 =?utf-8?B?cE1BQkMxcEJSd0tIenNNTU5UdWpnd2FmR3ZDVnNMb3FrNXN1RFZsYzFZQVo1?=
 =?utf-8?B?TXJwNjZYbGpPcFVXdTBST0ZHOGlKOUxLSDU2S1pCT2o3emVtUit0VXhDcjR3?=
 =?utf-8?B?Wlp2QlZ2OGlLaGJBdWNnMWtFRG1QYTRMNnNHNTNCZjFFME43anFtY3NNTmRV?=
 =?utf-8?B?dnFHS2tUQS9rV1dDTXhRZllrUnR0dkZ6MTdxU2J5U3hrSzF6SVZnTEJlTENi?=
 =?utf-8?B?RHdHRVZ5SUh6SXVBZDAzMWhRL1kwVVJnaTVKWUJmTkJEa0RNazRhUHk0Vmtk?=
 =?utf-8?B?UUhzbnhZWlZrSUFvOGRkbG5KZ1VZU0wwUnhJYVhRd2p4M21wdE4wLzJnS2F0?=
 =?utf-8?B?UWVERWJFVUxxanVJVm1LQ1FBTWRmeUJwOXZyS3pIUHQ4UmpHejJEYllaVEV4?=
 =?utf-8?B?eXNreUpodGxHdHVNcTlUcnhOSXFGRmtPdVBmSndxUEsydFY2cnJiUVB3dlRB?=
 =?utf-8?B?L2ptMkp2Vmw1SXErWFdkZVdYaUhyczZIZWM5T1dIUzY4ZngwbUVFN3gyNmpj?=
 =?utf-8?B?eTRSendtN0tBZFFsajJVL0l4ZjFQdlc5N0x1cTdab2VOYzFyUEo3M3d0MXFK?=
 =?utf-8?B?NGgvL0NwUFJZZlBEVWs5Mkpya2YvWS9IR3I5ZXNkZ3lGaUlOWVdWem5xTE5q?=
 =?utf-8?B?SGdsRnU3SzFxazlDNm9GenI2Q1kvcVU4OG16Y3BEZTl0YVMrTG5VTHNsNTUv?=
 =?utf-8?B?Zm5RaERMQ0FqYUtPOG44eTRSYzc0cTB5YVFCVms5cW1aRDZhOFVjU0ZlZGt0?=
 =?utf-8?B?ZFNDNWF2dmF6bVo4SXBMY0xVdVBLSm5IUWxXMXFBS2IyK2ljT3FLYTVsVGxE?=
 =?utf-8?B?U24wckpCTVFJQnBnOU5ZbklkLzV6NjBhQjlna2NJdHZlS2NnNFFGaHlXeWts?=
 =?utf-8?B?b3pWZmZiY2ZyNThjaEpqM1BrM0VNN0c2NDhzOHJaRGlBYmhkbHRwd2h2NjVD?=
 =?utf-8?B?aEw3ZUFTNURBK3dWb0VTbkdySThZQjRBb1h4ZENXVGo0dXZ4R2lSMkErTURi?=
 =?utf-8?B?WmdCTVFxOStYMERIT2RiMERHSjkxRTlpUFhtaGx0NFJPVlQ3bDl6ZHVIWFdq?=
 =?utf-8?B?TkJseFR5NkVzNG1hYnlhc0J4YjZ2VkVXWnIzSGhrelozTnpOTW9rUWZOa1Bl?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9AD914EA2C8634A863968992706BF7B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f93c4fa-34d1-4f3d-a4ab-08dc8b7d4de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 07:49:07.2893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UaXHSubrc61JaNdyNKpjc6mJ48xsmrrVXgbSx220Tey2nzoCL/4alZSzcyBv8Xa5FQc411f99ERl1VVu8pnP19cjykZR+J9S/daJGOB95wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8803
X-MTK: N

SGkgRGFuaWVsLA0KDQpTb3JyeSB0byByZXBseSB5b3VyIHN1Z2dlc3Rpb24gdG9vIGxhdGVyLg0K
DQpUaGFua3MgZm9yIHlvdXIgaGVscCB0byByZXZpZXcgdGhlIHBhdGNoLg0KDQpPbiBGcmksIDIw
MjQtMDMtMTUgYXQgMTU6NTIgLTAzMDAsIERhbmllbCBBbG1laWRhIHdyb3RlOg0KPiA+IE9uIDE0
IE1hciAyMDI0LCBhdCAwODo0NCwgWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNv
bT4NCj4gPiB3cm90ZToNCj4gPiANCj4gPiBUaGVyZSBpc24ndCBsb2NrIHRvIHByb3RlY3Qgc291
cmNlIGJ1ZmZlciB3aGVuIGdldCBuZXh0IHNyYyBidWZmZXIsDQo+ID4gaWYNCj4gPiB0aGUgc291
cmNlIGJ1ZmZlciBpcyByZW1vdmVkIGZvciBzb21lIHVua25vd24gcmVhc29uIGJlZm9yZSBsYXQN
Cj4gPiB3b3JrIHF1ZXVlDQo+ID4gZXhlY3V0ZSBkb25lLCB3aWxsIGxlYWQgdG8gcmVtb3ZlIHNv
dXJjZSBidWZmZXIgb3IgYnVmZmVyIGRvbmUNCj4gPiBlcnJvci4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+IC4uLi92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MuYyB8IDIyICsr
KysrKysrKy0tLS0NCj4gPiAuLi4vdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX2F2MV9yZXFfbGF0
X2lmLmMgfCAyNSArKysrKystLS0tLS0tLQ0KPiA+IC4uLi92Y29kZWMvZGVjb2Rlci92ZGVjL3Zk
ZWNfdnA5X3JlcV9sYXRfaWYuYyB8IDMzICsrKysrKysrLS0tLS0tDQo+ID4gLS0tLS0NCj4gPiAz
IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNf
c3RhDQo+ID4gdGVsZXNzLmMNCj4gPiBpbmRleCAzMDYwNzY4ZTBlYTkuLmJiMjY4MGYzZWM1YiAx
MDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiArKysNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zj
b2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiBAQCAtMzI4LDcgKzMyOCw3IEBAIHN0YXRp
YyB2b2lkIG10a192ZGVjX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QNCj4gPiAqd29yaykNCj4g
PiBib29sIHJlc19jaGcgPSBmYWxzZTsNCj4gPiBpbnQgcmV0Ow0KPiA+IA0KPiA+IC0gdmIyX3Y0
bDJfc3JjID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGN0eC0+bTJtX2N0eCk7DQo+ID4gKyB2YjJf
djRsMl9zcmMgPSB2NGwyX20ybV9zcmNfYnVmX3JlbW92ZShjdHgtPm0ybV9jdHgpOw0KPiA+IGlm
ICghdmIyX3Y0bDJfc3JjKSB7DQo+ID4gdjRsMl9tMm1fam9iX2ZpbmlzaChkZXYtPm0ybV9kZXZf
ZGVjLCBjdHgtPm0ybV9jdHgpOw0KPiA+IG10a192NGwyX3ZkZWNfZGJnKDEsIGN0eCwgIlslZF0g
bm8gYXZhaWxhYmxlIHNvdXJjZSBidWZmZXIiLCBjdHgtDQo+ID4gPmlkKTsNCj4gPiBAQCAtMzYz
LDcgKzM2Myw3IEBAIHN0YXRpYyB2b2lkIG10a192ZGVjX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1
Y3QNCj4gPiAqd29yaykNCj4gPiBtdGtfdjRsMl92ZGVjX2VycihjdHgsICJ2YjIgYnVmZmVyIG1l
ZGlhIHJlcXVlc3QgaXMgTlVMTCIpOw0KPiA+IA0KPiA+IHJldCA9IHZkZWNfaWZfZGVjb2RlKGN0
eCwgYnNfc3JjLCBOVUxMLCAmcmVzX2NoZyk7DQo+IA0KPiANCj4gQ2FuIHlvdSBsZWF2ZSBhIGNv
bW1lbnQgZXhwbGFpbmluZyB3aHkgdGhlICE9IC1FQUdBSU4gY2hlY2sgd2FzDQo+IHJlbW92ZWQ/
IERvZXNu4oCZdCBzZWVtIG9idmlvdXMgdG8gbWUuDQo+IA0KTmVlZCB0byBzdXBwb3J0IC1FQUdB
SU4gY29uZGl0aW9uLCBjaGFuZ2UgdGhlIGxvZ2ljIGluIHBhdGNoIHYzLg0KPiANCj4gPiAtIGlm
IChyZXQgJiYgcmV0ICE9IC1FQUdBSU4pIHsNCj4gPiArIGlmIChyZXQpIHsNCj4gPiBtdGtfdjRs
Ml92ZGVjX2VycihjdHgsDQo+ID4gICJbJWRdIGRlY29kZSBzcmNfYnVmWyVkXSBzej0weCV6eCBw
dHM9JWxsdSByZXQ9JWQgcmVzX2NoZz0lZCIsDQo+ID4gIGN0eC0+aWQsIHZiMl9zcmMtPmluZGV4
LCBic19zcmMtPnNpemUsDQo+ID4gQEAgLTM4MCwxMSArMzgwLDIxIEBAIHN0YXRpYyB2b2lkIG10
a192ZGVjX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgICBjdHgt
PmN1cnJlbnRfY29kZWMgPT0gVjRMMl9QSVhfRk1UX1ZQOF9GUkFNRSkgew0KPiA+IGlmIChzcmNf
YnVmX3JlcSkNCj4gPiB2NGwyX2N0cmxfcmVxdWVzdF9jb21wbGV0ZShzcmNfYnVmX3JlcSwgJmN0
eC0+Y3RybF9oZGwpOw0KPiA+IC0gdjRsMl9tMm1fYnVmX2RvbmVfYW5kX2pvYl9maW5pc2goZGV2
LT5tMm1fZGV2X2RlYywgY3R4LT5tMm1fY3R4LA0KPiA+IHN0YXRlKTsNCj4gPiAtIH0gZWxzZSB7
DQo+ID4gLSBpZiAocmV0ICE9IC1FQUdBSU4pDQo+ID4gLSB2NGwyX20ybV9zcmNfYnVmX3JlbW92
ZShjdHgtPm0ybV9jdHgpOw0KPiA+ICsgaWYgKHZiMl92NGwyX3NyYykNCj4gPiArIHY0bDJfbTJt
X2J1Zl9kb25lKHZiMl92NGwyX3NyYywgc3RhdGUpOw0KPiA+ICsNCj4gPiB2NGwyX20ybV9qb2Jf
ZmluaXNoKGRldi0+bTJtX2Rldl9kZWMsIGN0eC0+bTJtX2N0eCk7DQo+ID4gKyB9IGVsc2Ugew0K
PiA+ICsgaWYgKCFyZXQpIHsNCj4gPiArIHY0bDJfbTJtX2pvYl9maW5pc2goZGV2LT5tMm1fZGV2
X2RlYywgY3R4LT5tMm1fY3R4KTsNCj4gPiArIH0gZWxzZSB7DQo+ID4gKyBpZiAoc3JjX2J1Zl9y
ZXEpDQo+ID4gKyB2NGwyX2N0cmxfcmVxdWVzdF9jb21wbGV0ZShzcmNfYnVmX3JlcSwgJmN0eC0+
Y3RybF9oZGwpOw0KPiANCj4gdmIyX3Y0bDJfc3JjIGNhbuKAmXQgcmVhbGx5IGJlIE5VTEwgaGVy
ZSBkdWUgdG8gdGhpczoNCj4gDQo+IGBgYA0KPiAJdmIyX3Y0bDJfc3JjID0gdjRsMl9tMm1fc3Jj
X2J1Zl9yZW1vdmUoY3R4LT5tMm1fY3R4KTsNCj4gCWlmICghdmIyX3Y0bDJfc3JjKSB7DQo+IAkJ
djRsMl9tMm1fam9iX2ZpbmlzaChkZXYtPm0ybV9kZXZfZGVjLCBjdHgtPm0ybV9jdHgpOw0KPiAJ
CW10a192NGwyX3ZkZWNfZGJnKDEsIGN0eCwgIlslZF0gbm8gYXZhaWxhYmxlIHNvdXJjZQ0KPiBi
dWZmZXIiLCBjdHgtPmlkKTsNCj4gCQlyZXR1cm47DQo+IAl9DQo+IGBgYA0KPiANCj4gSSBtdXN0
IHNheSBJIGZpbmQgdGhlIGNvbnRyb2wgZmxvdyBoZXJlIGEgYml0IGNvbmZ1c2luZywgc28gSSB3
b25kZXINCj4gaWYgdGhpcyBibG9jayBjYW7igJl0IGdvDQo+IGludG8gYW4gaW5saW5lIGhlbHBl
ciB0byBjbGVhbiB1cCBzdHVmZiBhIGJpdDoNCj4gDQo+IGBgYA0KPiAJCQlpZiAoc3JjX2J1Zl9y
ZXEpDQo+IAkJCQl2NGwyX2N0cmxfcmVxdWVzdF9jb21wbGV0ZShzcmNfYnVmX3JlcSwNCj4gJmN0
eC0+Y3RybF9oZGwpOw0KPiAJCQlpZiAodmIyX3Y0bDJfc3JjKQ0KPiAJCQkJdjRsMl9tMm1fYnVm
X2RvbmUodmIyX3Y0bDJfc3JjLCBzdGF0ZSk7DQo+IA0KPiAJCQl2NGwyX20ybV9qb2JfZmluaXNo
KGRldi0+bTJtX2Rldl9kZWMsIGN0eC0NCj4gPm0ybV9jdHgpOw0KPiBgYGANCj4gDQoNCj4gQWxz
bywgSSBkaXNsaWtlIHRoYXQgdGhpcyBhcHBhcmVudGx5IGZhaWxzIHNpbGVudGx5IGlmIHRoZSBw
b2ludGVycw0KPiBhcmUgTlVMTC4gSXQgaXMNCj4gbm90IGNsZWFyIGF0IGEgZmlyc3QgZ2xhbmNl
IGlmIHlvdeKAmXJlIGp1c3QgYmVpbmcgY2FyZWZ1bCBvciBpZiB5b3UNCj4gbGVnaXRpbWF0ZWx5
IGV4cGVjdA0KPiBgc3JjX2J1Zl9yZXFgIHRvIHBvc3NpYmx5IGJlIE5VTEwgYXQgdGhpcyBwb2lu
dCBmb3Igd2hhdGV2ZXIgcmVhc29uLg0KPiBUaGUgbGlmZWN5Y2xlDQo+IG9mIHJlcXVlc3Qgb2Jq
ZWN0cyBpcyBub3QgdHJpdmlhbCwgc28gaXTigJlzIGdvb2QgdG8gYmUgZXhwbGljaXQgaGVyZQ0K
PiBldmVuIGlmIHRoaXMgbWVhbnMNCj4gb25seSBsZWF2aW5nIGEgY29tbWVudCBvciBzaW1pbGFy
DQo+IA0KPiDigJQgRGFuaWVsDQo+IA0KSW4gb3JkZXIgdG8gbWFrZSB0aGUgY29kZSBsb2dpYyBt
b3JlIHJlYWRhYmxlLCBhZGQgc29tZSBjb21tZW50cyB0bw0KZGVzY3JpYmUgdGhlIHJlYXNvbi4N
Cg0KQ2hhbmdlIHRoZSBjb2RlIGZsb3cgdG8gcmVtb3ZlIE5VTEwgY2hlY2tpbmcgYW5kIHRvIG1v
cmUgdGVzdC4NCg0KQmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gPiArIGlmICh2YjJfdjRs
Ml9zcmMpDQo+ID4gKyB2NGwyX20ybV9idWZfZG9uZSh2YjJfdjRsMl9zcmMsIHN0YXRlKTsNCj4g
PiArDQo+ID4gKyB2NGwyX20ybV9qb2JfZmluaXNoKGRldi0+bTJtX2Rldl9kZWMsIGN0eC0+bTJt
X2N0eCk7DQo+ID4gKyB9DQo+ID4gfQ0KPiA+IH0NCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRl
Y19hdjFfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFfcmVxXw0KPiA+IGxhdF9pZi5jDQo+
ID4gaW5kZXggZjI3N2I5MDdjMzQ1Li4zMzljNWM4OGRhMWEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRl
Y19hdjFfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFfcmVxXw0KPiA+IGxh
dF9pZi5jDQo+ID4gQEAgLTEwNTIsMjMgKzEwNTIsMTggQEAgc3RhdGljIGlubGluZSB2b2lkDQo+
ID4gdmRlY19hdjFfc2xpY2VfdnNpX3RvX3JlbW90ZShzdHJ1Y3QgdmRlY19hdjFfc2xpY2VfdnNp
ICp2c2ksDQo+ID4gbWVtY3B5KHJlbW90ZV92c2ksIHZzaSwgc2l6ZW9mKCp2c2kpKTsNCj4gPiB9
DQo+ID4gDQo+ID4gLXN0YXRpYyBpbnQgdmRlY19hdjFfc2xpY2Vfc2V0dXBfbGF0X2Zyb21fc3Jj
X2J1ZihzdHJ1Y3QNCj4gPiB2ZGVjX2F2MV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4g
LSBzdHJ1Y3QgdmRlY19hdjFfc2xpY2VfdnNpICp2c2ksDQo+ID4gLSBzdHJ1Y3QgdmRlY19sYXRf
YnVmICpsYXRfYnVmKQ0KPiA+ICtzdGF0aWMgaW50IHZkZWNfYXYxX3NsaWNlX3NldHVwX2xhdF9m
cm9tX3NyY19idWYoc3RydWN0DQo+ID4gdmRlY19hdjFfc2xpY2VfdnNpICp2c2ksDQo+ID4gKyBz
dHJ1Y3QgdmRlY19sYXRfYnVmICpsYXRfYnVmLA0KPiA+ICsgc3RydWN0IG10a192Y29kZWNfbWVt
ICpicykNCj4gPiB7DQo+ID4gLSBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpzcmM7DQo+ID4gLSBz
dHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpkc3Q7DQo+ID4gLQ0KPiA+IC0gc3JjID0gdjRsMl9tMm1f
bmV4dF9zcmNfYnVmKGluc3RhbmNlLT5jdHgtPm0ybV9jdHgpOw0KPiA+IC0gaWYgKCFzcmMpDQo+
ID4gLSByZXR1cm4gLUVJTlZBTDsNCj4gPiArIHN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiAqc3Jj
X2J1Zl9pbmZvOw0KPiA+IA0KPiA+IC0gbGF0X2J1Zi0+c3JjX2J1Zl9yZXEgPSBzcmMtPnZiMl9i
dWYucmVxX29iai5yZXE7DQo+ID4gLSBsYXRfYnVmLT52YjJfdjRsMl9zcmMgPSBzcmM7DQo+ID4g
KyBzcmNfYnVmX2luZm8gPSBjb250YWluZXJfb2YoYnMsIHN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1
ZiwNCj4gPiBic19idWZmZXIpOw0KPiA+ICsgbGF0X2J1Zi0+c3JjX2J1Zl9yZXEgPSBzcmNfYnVm
X2luZm8tDQo+ID4gPm0ybV9idWYudmIudmIyX2J1Zi5yZXFfb2JqLnJlcTsNCj4gPiArIGxhdF9i
dWYtPnZiMl92NGwyX3NyYyA9ICZzcmNfYnVmX2luZm8tPm0ybV9idWYudmI7DQo+ID4gDQo+ID4g
LSBkc3QgPSAmbGF0X2J1Zi0+dHNfaW5mbzsNCj4gPiAtIHY0bDJfbTJtX2J1Zl9jb3B5X21ldGFk
YXRhKHNyYywgZHN0LCB0cnVlKTsNCj4gPiAtIHZzaS0+ZnJhbWUuY3VyX3RzID0gZHN0LT52YjJf
YnVmLnRpbWVzdGFtcDsNCj4gPiArIHY0bDJfbTJtX2J1Zl9jb3B5X21ldGFkYXRhKCZzcmNfYnVm
X2luZm8tPm0ybV9idWYudmIsICZsYXRfYnVmLQ0KPiA+ID50c19pbmZvLCB0cnVlKTsNCj4gPiAr
IHZzaS0+ZnJhbWUuY3VyX3RzID0gbGF0X2J1Zi0+dHNfaW5mby52YjJfYnVmLnRpbWVzdGFtcDsN
Cj4gPiANCj4gPiByZXR1cm4gMDsNCj4gPiB9DQo+ID4gQEAgLTE3MTcsNyArMTcxMiw3IEBAIHN0
YXRpYyBpbnQgdmRlY19hdjFfc2xpY2Vfc2V0dXBfbGF0KHN0cnVjdA0KPiA+IHZkZWNfYXYxX3Ns
aWNlX2luc3RhbmNlICppbnN0YW5jZSwNCj4gPiBzdHJ1Y3QgdmRlY19hdjFfc2xpY2VfdnNpICp2
c2kgPSAmcGZjLT52c2k7DQo+ID4gaW50IHJldDsNCj4gPiANCj4gPiAtIHJldCA9IHZkZWNfYXYx
X3NsaWNlX3NldHVwX2xhdF9mcm9tX3NyY19idWYoaW5zdGFuY2UsIHZzaSwNCj4gPiBsYXRfYnVm
KTsNCj4gPiArIHJldCA9IHZkZWNfYXYxX3NsaWNlX3NldHVwX2xhdF9mcm9tX3NyY19idWYodnNp
LCBsYXRfYnVmLCBicyk7DQo+ID4gaWYgKHJldCkNCj4gPiByZXR1cm4gcmV0Ow0KPiA+IA0KPiA+
IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVj
L2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFf
DQo+ID4gbGF0X2lmLmMNCj4gPiBpbmRleCAwZGVkYmMzNjgwZTguLjI2OTdlMDRmNDMxMyAxMDA2
NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVj
L2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiArKysNCj4gPiBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVj
X3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBAQCAtNjkzLDM5ICs2OTMsMzQgQEAgc3RhdGlj
IGludCB2ZGVjX3ZwOV9zbGljZV90aWxlX29mZnNldChpbnQNCj4gPiBpZHgsIGludCBtaV9udW0s
IGludCB0aWxlX2xvZzIpDQo+ID4gfQ0KPiA+IA0KPiA+IHN0YXRpYw0KPiA+IC1pbnQgdmRlY192
cDlfc2xpY2Vfc2V0dXBfc2luZ2xlX2Zyb21fc3JjX3RvX2RzdChzdHJ1Y3QNCj4gPiB2ZGVjX3Zw
OV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UpDQo+ID4gK2ludCB2ZGVjX3ZwOV9zbGljZV9zZXR1
cF9zaW5nbGVfZnJvbV9zcmNfdG9fZHN0KHN0cnVjdA0KPiA+IHZkZWNfdnA5X3NsaWNlX2luc3Rh
bmNlICppbnN0YW5jZSwNCj4gPiArIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqYnMpDQo+ID4gew0K
PiA+IC0gc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqc3JjOw0KPiA+IHN0cnVjdCB2YjJfdjRsMl9i
dWZmZXIgKmRzdDsNCj4gPiArIHN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiAqc3JjX2J1Zl9pbmZv
Ow0KPiA+IA0KPiA+IC0gc3JjID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGluc3RhbmNlLT5jdHgt
Pm0ybV9jdHgpOw0KPiA+IC0gaWYgKCFzcmMpDQo+ID4gLSByZXR1cm4gLUVJTlZBTDsNCj4gPiAr
IHNyY19idWZfaW5mbyA9IGNvbnRhaW5lcl9vZihicywgc3RydWN0IG10a192aWRlb19kZWNfYnVm
LA0KPiA+IGJzX2J1ZmZlcik7DQo+ID4gDQo+ID4gZHN0ID0gdjRsMl9tMm1fbmV4dF9kc3RfYnVm
KGluc3RhbmNlLT5jdHgtPm0ybV9jdHgpOw0KPiA+IGlmICghZHN0KQ0KPiA+IHJldHVybiAtRUlO
VkFMOw0KPiA+IA0KPiA+IC0gdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoc3JjLCBkc3QsIHRy
dWUpOw0KPiA+ICsgdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoJnNyY19idWZfaW5mby0+bTJt
X2J1Zi52YiwgZHN0LCB0cnVlKTsNCj4gPiANCj4gPiByZXR1cm4gMDsNCj4gPiB9DQo+ID4gDQo+
ID4gLXN0YXRpYyBpbnQgdmRlY192cDlfc2xpY2Vfc2V0dXBfbGF0X2Zyb21fc3JjX2J1ZihzdHJ1
Y3QNCj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4gLSBzdHJ1Y3Qg
dmRlY19sYXRfYnVmICpsYXRfYnVmKQ0KPiA+ICtzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3Nl
dHVwX2xhdF9mcm9tX3NyY19idWYoc3RydWN0DQo+ID4gdmRlY19sYXRfYnVmICpsYXRfYnVmLA0K
PiA+ICsgc3RydWN0IG10a192Y29kZWNfbWVtICpicykNCj4gPiB7DQo+ID4gLSBzdHJ1Y3QgdmIy
X3Y0bDJfYnVmZmVyICpzcmM7DQo+ID4gLSBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpkc3Q7DQo+
ID4gKyBzdHJ1Y3QgbXRrX3ZpZGVvX2RlY19idWYgKnNyY19idWZfaW5mbzsNCj4gPiANCj4gPiAt
IHNyYyA9IHY0bDJfbTJtX25leHRfc3JjX2J1ZihpbnN0YW5jZS0+Y3R4LT5tMm1fY3R4KTsNCj4g
PiAtIGlmICghc3JjKQ0KPiA+IC0gcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyBzcmNfYnVmX2luZm8g
PSBjb250YWluZXJfb2YoYnMsIHN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiwNCj4gPiBic19idWZm
ZXIpOw0KPiA+ICsgbGF0X2J1Zi0+c3JjX2J1Zl9yZXEgPSBzcmNfYnVmX2luZm8tDQo+ID4gPm0y
bV9idWYudmIudmIyX2J1Zi5yZXFfb2JqLnJlcTsNCj4gPiArIGxhdF9idWYtPnZiMl92NGwyX3Ny
YyA9ICZzcmNfYnVmX2luZm8tPm0ybV9idWYudmI7DQo+ID4gDQo+ID4gLSBsYXRfYnVmLT5zcmNf
YnVmX3JlcSA9IHNyYy0+dmIyX2J1Zi5yZXFfb2JqLnJlcTsNCj4gPiAtIGxhdF9idWYtPnZiMl92
NGwyX3NyYyA9IHNyYzsNCj4gPiArIHY0bDJfbTJtX2J1Zl9jb3B5X21ldGFkYXRhKCZzcmNfYnVm
X2luZm8tPm0ybV9idWYudmIsICZsYXRfYnVmLQ0KPiA+ID50c19pbmZvLCB0cnVlKTsNCj4gPiAN
Cj4gPiAtIGRzdCA9ICZsYXRfYnVmLT50c19pbmZvOw0KPiA+IC0gdjRsMl9tMm1fYnVmX2NvcHlf
bWV0YWRhdGEoc3JjLCBkc3QsIHRydWUpOw0KPiA+IHJldHVybiAwOw0KPiA+IH0NCj4gPiANCj4g
PiBAQCAtMTE1NSw3ICsxMTUwLDcgQEAgc3RhdGljIGludCB2ZGVjX3ZwOV9zbGljZV9zZXR1cF9s
YXQoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfaW5zdGFuY2UgKmluc3RhbmNlLA0KPiA+IHN0
cnVjdCB2ZGVjX3ZwOV9zbGljZV92c2kgKnZzaSA9ICZwZmMtPnZzaTsNCj4gPiBpbnQgcmV0Ow0K
PiA+IA0KPiA+IC0gcmV0ID0gdmRlY192cDlfc2xpY2Vfc2V0dXBfbGF0X2Zyb21fc3JjX2J1Zihp
bnN0YW5jZSwgbGF0X2J1Zik7DQo+ID4gKyByZXQgPSB2ZGVjX3ZwOV9zbGljZV9zZXR1cF9sYXRf
ZnJvbV9zcmNfYnVmKGxhdF9idWYsIGJzKTsNCj4gPiBpZiAocmV0KQ0KPiA+IGdvdG8gZXJyOw0K
PiA+IA0KPiA+IEBAIC0xNzk2LDcgKzE3OTEsNyBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNl
X3NldHVwX3NpbmdsZShzdHJ1Y3QNCj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFu
Y2UsDQo+ID4gc3RydWN0IHZkZWNfdnA5X3NsaWNlX3ZzaSAqdnNpID0gJnBmYy0+dnNpOw0KPiA+
IGludCByZXQ7DQo+ID4gDQo+ID4gLSByZXQgPSB2ZGVjX3ZwOV9zbGljZV9zZXR1cF9zaW5nbGVf
ZnJvbV9zcmNfdG9fZHN0KGluc3RhbmNlKTsNCj4gPiArIHJldCA9IHZkZWNfdnA5X3NsaWNlX3Nl
dHVwX3NpbmdsZV9mcm9tX3NyY190b19kc3QoaW5zdGFuY2UsIGJzKTsNCj4gPiBpZiAocmV0KQ0K
PiA+IGdvdG8gZXJyOw0KPiA+IA0KPiA+IC0tIA0KPiA+IDIuMTguMA0KPiA+IA0KPiA+IA0KPiAN
Cj4gDQo=

