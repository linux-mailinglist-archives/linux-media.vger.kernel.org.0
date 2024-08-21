Return-Path: <linux-media+bounces-16551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFED959364
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 05:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01C68B22387
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 03:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D090B15855F;
	Wed, 21 Aug 2024 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hIYXwEUK";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SBYFgWRj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A414C5BD;
	Wed, 21 Aug 2024 03:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724211854; cv=fail; b=jU6BpE2PIowsgUH6nwTfUZajn+ZhX+wMwZK4ESkohvB6y4KRiVYXGMiA95ZhS/Yaj23ZEN3yXeeCN3rbc8MEFfime/w1qNFU6uKSxapqgMLDMR/0LvaVaMhRJLKVjSmY8PUDZpCa9LNDxgZ0wazKtUn2f3NmXzhUMSwnxKuT9To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724211854; c=relaxed/simple;
	bh=Ia/Hqa/lAxB4LCwj21QfIWRe4113el0fV/IiAAa4oiw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jVXcdG70R4UvJT+f8QYEgL9Qi4A5x4St9IICdvbs8Z1wYwcZ2USWbi9zv0UWZZZPtnkigp8TlUC/i32tyQr3WKqYuUyfl1rg1ElSL6/e3kRmes2R8N4d+u+onpFIy9mpwWVr1X7+aPU57ifcV3RmIUw9aMDbGQfw8bjFr42YNqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hIYXwEUK; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SBYFgWRj; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9c89e0525f6f11ef8b96093e013ec31c-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=Ia/Hqa/lAxB4LCwj21QfIWRe4113el0fV/IiAAa4oiw=;
	b=hIYXwEUKi2jW6C2gjxaiOONlW8WoCCP8D6yHja+38TY9y2auORs/4aUL2MQDxq6okT4yb26jn/HoSEvbIiUx1uDmRj+MIAb08j0nEcLNViPtwWuogFq78xIq5FBptDgVZJY1fMwv2nOcPIoWv7ZPIhYLsixkOe9ARrSOu3Hi9Dk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:85dd45d5-933a-4cc7-afc2-728b54f01da1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e781aebe-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9c89e0525f6f11ef8b96093e013ec31c-20240821
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 779597400; Wed, 21 Aug 2024 11:44:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 11:44:04 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 11:44:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnnS4vKrgP3JCq+qvBOJXHNxpKEfFwWLnFsokDfStQyDPwyu5opDHx1Nm3AxM0JbfB+SYlZXCXMeuEAPTLCJT7NF6S5zNlRHre98js/O3rj8jpk1SHPKf7cruF/DPpS7rfyIohs0CWxCM5rFC/zZEUwP5jQkiVGUqTEI0ylggm8l0rh3dKRsJFkepW3ponchv5Axr1nMCc6bFcBWea6hEVvuxn/4ZfRhSBfp/t0YhRFU7w6QLpMdP9TS1qFOL/VvszPyvCkXU/wuNAX+SN5zB1vL1+DxnAHCf2yyow4k2iajkiq8t6U5rmLZ9C0ALHQmVaw0HUnPGi+NID900LFOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia/Hqa/lAxB4LCwj21QfIWRe4113el0fV/IiAAa4oiw=;
 b=MxtD/Fi4G1XYB/Qr8cPZZB9et3hqVuLMEvYJAVAIHuiI585OLeRaoUiNwCFC/pYT3fJGtR8dzsqG3SZ9V7D3doaTY5+36Doorf3kUf9eNaEbNNkdDNW6g6+TAKcNMdXdSswQ+TX0xefduTlUKLEqGSohXt+HX3b6bhhWutH2QECGsjM26sOO6YAn5C8MxFESodNMa8kShBYB/63Ki/u/q1gCrCI51ns9ltQUtsCkBXNNBffC5X0NNonWKYJxQigwn2O6E/ULrrapzlv1DKsq9lwaRFtzVwcd82+4vFt0PSQJwXhcydUOz8FpM2HwdOuvL5x6FrxK4RjoblvBRbolGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ia/Hqa/lAxB4LCwj21QfIWRe4113el0fV/IiAAa4oiw=;
 b=SBYFgWRjcOwK0d6oM+iQ4O0eCraonQtMxMH3sWVSPld/TQeCha0XBXhsiAhqAeN/HApO1AIjahXuWvp2PswYCU0uM7fYGNCA6dxV1nvfQQF9bMHK6eXnctNI0sT8sj0PeScc+yENaRBxq+UfLtyu4WXPE/qjuWjQalaEyvrHH7E=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6465.apcprd03.prod.outlook.com (2603:1096:101:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 03:44:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 03:44:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "benjamin.gaignard@collabora.com"
	<benjamin.gaignard@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain
 control of cmdq_pkt_finalize()
Thread-Topic: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain
 control of cmdq_pkt_finalize()
Thread-Index: AQHaZaXYtP+8+9hIl0yZSAvleBI2BbG7SX6AgHbj7QA=
Date: Wed, 21 Aug 2024 03:44:00 +0000
Message-ID: <6f6c2bb63b4d0a2a5efa295b756ccfda5a0f3ac4.camel@mediatek.com>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
	 <20240222154120.16959-11-chunkuang.hu@kernel.org>
	 <657ef910-e6fd-4791-988e-4aba03104c20@collabora.com>
In-Reply-To: <657ef910-e6fd-4791-988e-4aba03104c20@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6465:EE_
x-ms-office365-filtering-correlation-id: 53e171d8-6078-4245-60ad-08dcc1937eb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?V0NSYloxN3FiNEo2L3ltdEFSdkxTME5DbldUOWVzaWdmWkVyOFpGalQ4SzdR?=
 =?utf-8?B?cUNBQ2pMVGpqdVhuSnRMTG9zMlhRNWMvY2UvUW5ncXVxQzRlNmZ5TERldFp4?=
 =?utf-8?B?TmlNcHlsMXFhSlNpRjY4SnM3bWJVYlpxeGJEL096R3lpdldSOE92TFhCWU9H?=
 =?utf-8?B?bVNSTG1ocmg5OVdLYkwvbWpYc2YxWjN0dTgrd2tOT3pwUnZ5UFFGNFZuN1NC?=
 =?utf-8?B?SzFZVm5CVEhQallnRTgydXZjQitEbHNLV1RHSWs1bWZnS0FqczJhaDJVL0Qv?=
 =?utf-8?B?L2ZqOCtIRGt4NEhNSGU2WDFDZTBiL2VpblZXb2NOakhHY3dJMkxYcHg1aTRI?=
 =?utf-8?B?YjFGYjlvQzUzR2p0cW04dmNjdWRJZk9WaU5YR2lYdHFadS9KeXdBcS9kc2ti?=
 =?utf-8?B?Y3RmYzQ4TGVZSTV4bS82akh1NWpRc2tRTnY0U3Z5aEpzbVV5MHA1emlhY1pn?=
 =?utf-8?B?TU9ERUlYbmZHQisvVXdXN0pqTFJVT1ZZYXQ1U2RQdXV5Z0Y1c0RQODU1bDhw?=
 =?utf-8?B?T2tPMEtMWXlnYWlFUzFCUFdxNDBXUDVuTkI3QzZSTDhlM1VlTnlOUUtBOER5?=
 =?utf-8?B?cGpONDlUdG5KMXk2Q3N0cHVEV29nbHZGcmwwNk1VYnZEWDNRSXdwQVFRdWdF?=
 =?utf-8?B?Qko3N1hrWWY2ZXdETElyM1luamh2NVRaQmF0UDZubUJvdmorLzdCQW41eHZk?=
 =?utf-8?B?cmJ2ZjAvK3VWakIyd0tHdFFmQm5OeCs2enV0NVA1YUIwb3JqVzM1eWVPVVI5?=
 =?utf-8?B?RXkzSjRyR3lOMnlMczhFVEFQazFwNzFDOExtN3pWWFBtV1IrNFg3Z0oxcy9m?=
 =?utf-8?B?S2JwK1pUanVPOWFjYkRmdmZ4Vi9Vbk5ZcjgrTnMxZTFLZ25SSGJBOXJGY0NG?=
 =?utf-8?B?cVlkNlBTRG12dDFseG5oWWY3M1BmZGFubG03MmhKS2NocWNoWGpiVENJZ2NE?=
 =?utf-8?B?aExVSUZtbzhNQW1pSGtRV0I0WkNocTVFTG9HVXhBcW51OWRMc0NkWnlvQTcw?=
 =?utf-8?B?aEI4YzE5dEtCNSsyN1BRbGRwRDY5amJIMU5ZbDJ3eU4ra2lRYWp6RzdTVGZN?=
 =?utf-8?B?Z2NaWVhPaHlVMHJCcXM0U0g2QkppdGpwUENyY1dPdmU2Wk9ZNW1aS1N1OXFi?=
 =?utf-8?B?Q3M5bm5yTjdkTlVoVW84ZUxmTHdaZ0kxUzU4ZXJDU2VibFYzV3VpK2RDcnpH?=
 =?utf-8?B?T1ZtdXc0NkJXcnQ3dkE0YUREK2JwSXNGUGVOcVhlMFc5NHhHM2JVaUlCN2J3?=
 =?utf-8?B?aXNXVm50MS9KK2hZK3lDNlErQzd6U3dFY3pWaG9abGlmUjl1VCtVcVR1aG5x?=
 =?utf-8?B?ck8zaVk0bGRGVm9JTzZmUVdaWUY2R0h4MDV1ZFI1ZjRqZUJGb0tXRmgxL0p5?=
 =?utf-8?B?VWFpL3ZESUxVVmlndmpwSkwzdUFCa3NOMk80eXo4RjVLdkZ1VkhrOW12Yml3?=
 =?utf-8?B?OS8wWVh5bkRoNTdaL0R2bDZJMmpNdGZZbmFGRGlPWkd1a3JvRXJrUmJMc2dZ?=
 =?utf-8?B?bkZqaEx4N1ZNNFM5dU9kcUpkcHpLQkt4WWdmL0FYK2plZFVUdjg3TTdoZlB5?=
 =?utf-8?B?L0NUUW1vWlorTlZic0gxK2NHaU9CR1VuZWZwUVp2SnYrblVxSU1SeG9TaVY1?=
 =?utf-8?B?N1ZUWW1mQXBRR2NTUDI0QWQycmd4YVh1dmN0d0NFNHp4dGQ4WHBOVDN6U2x0?=
 =?utf-8?B?allqaFI0NndQMlJCZnhORFJHcjVvQWlIOGNjeWZoQmpEVVd2WU83Sk1KTlYz?=
 =?utf-8?B?b1B3cmE3Ti9OZ2JSbTdXd1Flbjh0SkxSVDB2OTFmNzNwL3luYnRFNDR3cDB0?=
 =?utf-8?B?cExtck5tL0hTbFplRVMxYjBCUzBtQ3VvbEFXZXlVTkNwbCtHYzk2aFBiRTFh?=
 =?utf-8?B?RnZqWE1rN3YrUFJGY1JmN1hYY2dBcHVTcnBIVFh6L1BscFNid0ZieE9hTjJY?=
 =?utf-8?Q?yi3/gTypUOg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEhLN0ova0RhR0pzeU5HREtyMGk0MDZVT0hBblA3ZGllS3F3RXd3WEpoc3U0?=
 =?utf-8?B?YXVxVFBrbXZDWTYxSEc0SVg4b2NhOVZPb0FhdlBsMUZJL0RsT0pmZy8xUDIz?=
 =?utf-8?B?M1RMdE9ISjRCYUpxeDA0SHlRZis2eVg4NnZtc08rb3JnQWZ4bjNudWp1VFhv?=
 =?utf-8?B?S1NFeUkwMlE1MWd4cE8rYzF5WDdtZkJDUzQ1Yy83dytzVER3YXdHREZ1ODR1?=
 =?utf-8?B?MURDK1MxOEtFRHVBQ2lYRUlaRHBiaW5ibVFIdkxJdncrVnNzTTJyRnAzRWdM?=
 =?utf-8?B?R0ZIVHppWDMyTFJPalNQeCs3Ym9ma3k5ZWRMcWNOd1U1TE9nZ0xobkpYQ3Vw?=
 =?utf-8?B?QnNDWHIxendEdVhVanVRYy81NmpweTFkMzJraHFtbU1JVlVYdXJQR005eU4y?=
 =?utf-8?B?WkZHWWY3RHFoMXJKUU9XYkl0djU0U2dXTEtWL1NuaHBnNUMwamRVSWdRbSs5?=
 =?utf-8?B?a0p2RDVDbm9UaU51Qmtuc3RIM2UrTTNYbzhyelh6ZldEcWlRNE1GYkQ5bnVq?=
 =?utf-8?B?MnVKc1VXRzRUZk1Ua0NTelNtWEIxNlNyUGxSK2RNYVR0QWw4SkZCSkk2b1Zn?=
 =?utf-8?B?bG5JSjdndkJwV2Nxa2pSNjNVRVBqaHhTbTZWUHZETy9NQXYwOWhKS2RZL0V1?=
 =?utf-8?B?OVlRWU5hei9TS1J2WlQxb2s3VHZySDAvT3V6d1d5cnRRem5RS2c0MnBjUjF6?=
 =?utf-8?B?VnRwQk9WTlltUlV5L3pLU2pha0J4TW16RTNxN0gxQTlla0t0UFNKNmJkUG1T?=
 =?utf-8?B?OVNuN0ViVW1qWmdHMCtCYjhyRThRYnliNXBpQk42QmRCYVNZYzZhL09FVGJD?=
 =?utf-8?B?eVJ3VFE5QTZEN2pNcmdCNUVNYnpRaFZ5QWpGYlg5RWJRc05LS0hTOHE5cng4?=
 =?utf-8?B?YU0wMHZ5cGdnSkdURGxZbFNEZVc1bVRjTDg5WjFKMU9yRkkraXAycEQwYlpT?=
 =?utf-8?B?TnI1YlZnZ3ROWGM1WmlCMVZFUjdwZGJGT3pNTHhsYS9NbzdNTWxrcm1DNElX?=
 =?utf-8?B?YzhEYktYTEsvL1Q3MlNTekx4ZlJzMHJZNnBEUW5ZZUx6cFdqYi9oU0JDb0hn?=
 =?utf-8?B?cXNOR29MdlFJODA4ZFF2NU1rbTA4cnNvd3M4eDkzYWtsU05LQkFVZFJBemth?=
 =?utf-8?B?SG95VGhNWGxyZ3Y0R2d1Y09wazQ0a1JibkQyWVh1ZGNQZWJjaUtzQlphK1NJ?=
 =?utf-8?B?TzFVcytBY05SaTB3N2ZDYjgwUmZzWFBkOG5CcFBKVk1TMHZkdzFFNWErMFZa?=
 =?utf-8?B?OXBZcXBBM0ZQUzIxdHdGY0thTHhyUE1jbk1zeXNYTzdTd05VSnpoZjFFY0hW?=
 =?utf-8?B?ZnptSUtxdi9ITit4R2V3UURZcE1OS29LemNYUHA4aGc5YUM5VjlWSS9SY3h1?=
 =?utf-8?B?a0FsTWJJOUR6VDdwb3J5UGNXaC83TXZhQkhJMmFyanQyOVRkRU5lcy9CN01I?=
 =?utf-8?B?WHVRVlI2cnlNN3JES2IyRGNDdExPS243MlJ2ejU1R1JDcElJTTlQNjdTdjky?=
 =?utf-8?B?Z2oyYi9JZ09FSDVHOUhYUDd5TFl5ZDIwSGhlZk1JQVJWMlpFN3l1UWZQWjU0?=
 =?utf-8?B?ajhvNk5KdXNaQlF5Z1ROMjdqOHVmRlljTVl1K1BmZjhvSzZMbVRwZXhBbDY0?=
 =?utf-8?B?aUM4Y3ZmcjRidGxhL0dzMUN6Z2NrVG1ING5BdjZpNFVESGdHaFJnd0tvd3Rk?=
 =?utf-8?B?Z2ZUeHFkeGRMMGlTdmNTSU5HR3hzYjFZeVFTekU4NjcxbDYzMFRoVUJTd2hY?=
 =?utf-8?B?ZTdsdDVESnplTTBwRlFZSitwWGZMajFiS2Z6NUx2RWM0N0ZmZHIrZkxQMU1w?=
 =?utf-8?B?em5kSjJOam45a1IyMEdNRFg4cFF0UjVmMjFoVVJoZ1VITFFPazhHa2ZYYS9F?=
 =?utf-8?B?dENjUitNMGNMSC83a29UNHFtZk03S2RNUzRvZ0JzVTJEWGQzY3k2MUk4TEY2?=
 =?utf-8?B?SWY5VFFZcWt1NnFxQzIvTmhxNVJNMlI4dmRvMks3ZG1xdlpia21sR0tLL0hE?=
 =?utf-8?B?WUp4SUxHRmJkYi9ScHE5dlhVMFRzaHRncThzM2RDRTg5amxhY1FvQkVzRnE2?=
 =?utf-8?B?bHVkL1hPakdHUzUyVEo2ZHZSOG9yenkxWlpoNTB0dlp4ak41dHlwUVplZTdF?=
 =?utf-8?Q?6X+3Uih/MQMVfLaGec9hGfljf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AA56D7297E13A4CAE3B12D8C2236F99@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e171d8-6078-4245-60ad-08dcc1937eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 03:44:00.9454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgwFLeXmnEY0Wha6oV4ey1mJbWIYyC6TBVbvQXju6OUZCG8xokXdf6N2iG5XBNWVr2Y+wpTNgYXTnhB0pFCLOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6465

SGksIEJlbmphbWluOg0KDQpPbiBUaHUsIDIwMjQtMDYtMDYgYXQgMTQ6MDkgKzAyMDAsIEJlbmph
bWluIEdhaWduYXJkIHdyb3RlOg0KPiBMZSAyMi8wMi8yMDI0IMOgIDE2OjQxLCBDaHVuLUt1YW5n
IEh1IGEgw6ljcml0IDoNCj4gPiBJbiBvcmRlciB0byBoYXZlIGZpbmUtZ3JhaW5lZCBjb250cm9s
LCB1c2UgY21kcV9wa3RfZW9jKCkgYW5kDQo+ID4gY21kcV9wa3RfanVtcF9yZWwoKSB0byByZXBs
YWNlIGNtZHFfcGt0X2ZpbmFsaXplKCkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jIHwgMyArKy0NCj4g
PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMg
fCAyICsrDQo+ID4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY29yZS5oIHwgMSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KPiA+IGluZGV4IDZhZGFjODU3YTQ3Ny4u
YjcyMGU2OWIzNDFkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jDQo+ID4gQEAgLTQ3MSw3ICs0NzEsOCBA
QCBpbnQgbWRwX2NtZHFfc2VuZChzdHJ1Y3QgbWRwX2RldiAqbWRwLCBzdHJ1Y3QgbWRwX2NtZHFf
cGFyYW0gKnBhcmFtKQ0KPiA+ICAgCQlkZXZfZXJyKGRldiwgIm1kcF9wYXRoX2NvbmZpZyBlcnJv
clxuIik7DQo+ID4gICAJCWdvdG8gZXJyX2ZyZWVfcGF0aDsNCj4gPiAgIAl9DQo+ID4gLQljbWRx
X3BrdF9maW5hbGl6ZSgmY21kLT5wa3QpOw0KPiA+ICsJY21kcV9wa3RfZW9jKCZjbWQtPnBrdCk7
DQo+ID4gKwljbWRxX3BrdF9qdW1wX3JlbCgmY21kLT5wa3QsIENNRFFfSU5TVF9TSVpFLCBtZHAt
PmNtZHFfc2hpZnRfcGEpOw0KPiA+ICAgDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IG51bV9jb21w
OyBpKyspDQo+ID4gICAJCW1lbWNweSgmY29tcHNbaV0sIHBhdGgtPmNvbXBzW2ldLmNvbXAsDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGst
bWRwMy1jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY29yZS5jDQo+ID4gaW5kZXggOTRmNGVkNzg1MjNiLi4yMjE0NzQ0YzkzN2MgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNv
cmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGst
bWRwMy1jb3JlLmMNCj4gPiBAQCAtMjMxLDYgKzIzMSw4IEBAIHN0YXRpYyBpbnQgbWRwX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJCWdvdG8gZXJyX3B1dF9zY3A7
DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gKwltZHAtPmNtZHFfc2hpZnRfcGEgPSBjbWRxX2dldF9z
aGlmdF9wYShtZHAtPmNtZHFfY2x0LT5jaGFuKTsNCj4gPiArDQo+ID4gICAJaW5pdF93YWl0cXVl
dWVfaGVhZCgmbWRwLT5jYWxsYmFja193cSk7DQo+ID4gICAJaWRhX2luaXQoJm1kcC0+bWRwX2lk
YSk7DQo+ID4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWRwKTsNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUu
aCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmgN
Cj4gPiBpbmRleCA3ZTIxZDIyNmNlYjguLmVkNjFlMGJiNjllZSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5oDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUu
aA0KPiA+IEBAIC04Myw2ICs4Myw3IEBAIHN0cnVjdCBtZHBfZGV2IHsNCj4gPiAgIAl1MzIJCQkJ
CWlkX2NvdW50Ow0KPiA+ICAgCXN0cnVjdCBpZGEJCQkJbWRwX2lkYTsNCj4gPiAgIAlzdHJ1Y3Qg
Y21kcV9jbGllbnQJCQkqY21kcV9jbHQ7DQo+ID4gKwl1OAkJCQkJY21kcV9zaGlmdF9wYTsNCj4g
DQo+IENhbiBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgYmVjYXVzZSB0aGlzIHBh
dGNoIGNhbid0DQo+IGJlIGFwcGxpZWQgb24gbWVkaWFfdHJlZS9tYXN0ZXIgYnJhbmNoLg0KPiBU
aGUgY29kZSBsb29rIGNvcnJlY3QgZm9yIG1lIGJ1dCB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gYXBw
bGllZCBpdA0KPiB0byBwZXJmb3JtIG1vcmUgY2hlY2tzLg0KDQpOZXcgdmVyc2lvbiBoYXMgYmVl
biBzZW50Lg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhL3BhdGNoLzIwMjQwODEwMDkwOTE4Ljc0NTctNC1jaHVua3VhbmcuaHVAa2VybmVsLm9y
Zy8NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEJlbmphbWluDQo+IA0KPiA+
ICAgCXdhaXRfcXVldWVfaGVhZF90CQkJY2FsbGJhY2tfd3E7DQo+ID4gICANCj4gPiAgIAlzdHJ1
Y3QgdjRsMl9kZXZpY2UJCQl2NGwyX2RldjsNCj4gDQo+IA0K

