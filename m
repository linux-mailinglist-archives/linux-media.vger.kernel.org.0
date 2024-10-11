Return-Path: <linux-media+bounces-19364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1F999951
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 03:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1175E1C2235E
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 01:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3719C8C7;
	Fri, 11 Oct 2024 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EaH2MQr+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YkmAA5ML"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C66FBF0;
	Fri, 11 Oct 2024 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728610165; cv=fail; b=JlvMInxEiXW3sQ5Y87N3IJaUxMG/d31M1AlMAlaUHikZ0eFFt09xncwK3zJpdiKKU2aX34FxPuYjvL0WWWXfbUYYuHMHVIj1muAVGXmhxEWE2ktbuzR5nbxmu79bNhLVkDn0AIPTCYm5mun9lsMSOWiB+FpuO0fNaj+lzaguHv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728610165; c=relaxed/simple;
	bh=gkk2po+HFW2jAPVJ7pW25ocQ4+bfWOzKkAqWUtaRjw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ii5XLZVqK6jRkwY9YPyUAUuZIYURgLetT3g0CcdLXOSEPU1MDb0c6+5eW4W4QcuQZYOFGILuXu6Jj3HX2/8HpmeVvk43bkBUNn2YA75TvkdvW4mvA+kqPksrSarA2JWOGVpMHC8NcTogYuiQfAHxZOnW1Q4BWJb9Z+9fzcAhxDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EaH2MQr+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=YkmAA5ML; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3760fb74877011ef8b96093e013ec31c-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gkk2po+HFW2jAPVJ7pW25ocQ4+bfWOzKkAqWUtaRjw8=;
	b=EaH2MQr+WGXIDFIfINPqABUtobmf0Q0wLejHt1+QxjT+wChGZCt8MM5DUc3QWBM7RxwYnksH8lJuNlTFHCGV2Kjb+X12ARl9fE/quHoldvw1gyIo6Rkdm+djadL6ClrjLx82GZp1jlMq2BfhvXtp6jSIABcqCUrg1UnCWofTpvU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5c80b544-2c03-4fce-abd9-08ef2c1cf852,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:5d909b26-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3760fb74877011ef8b96093e013ec31c-20241011
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 108176833; Fri, 11 Oct 2024 09:29:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Oct 2024 18:29:09 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 09:29:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+NdDt3e4mWQsYOafgHEhEwQovGATnZ97/0WSUxY6enl2GUYJY2rRHSVNYXlAHnBLl1uOO6hsAvlyfieBu9VhZLHIyJq/vwrLAHYbpAHN7wTx7csLgSUC2FZGYMGY5ZHh7URJonQP/job1voCtc13nFRiVj0psR3jANkSGyYW5ad9NPNK22Uh+qFCblEFItl1z5H/itSdugcF2/6LRvYaMxtM5qAREvGsOdGNDvdppL3XgBTMShup4jTa4UEF27mXc4PjLFrkh2zyFrHhmjM1oYvko2eVFFXam5JL1ipgU13lBio6UyEGCuBDSnEM+DEFHzszm3EjoJiXlesJjkNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkk2po+HFW2jAPVJ7pW25ocQ4+bfWOzKkAqWUtaRjw8=;
 b=r92OKfnnlVlKu67uGzys9hawwfGdtnpIN5stx3I0ytXQrZyYkRMI78pcYfExT+PevYm8EaO9zlujPz9QEBlnn9MURd/BWBUPn7WL1yVoegFJFmlbfkmEC1mlawrpiUjuQHWuN2vAICY1ayVS73EAP48z01KU+i/tMDxou7m2LU6BxVYmYCekmygaVFkEneIqf5wRnGwTE0TQSTJPb/vqJIaloJWJjWY7Fn7oZFnmqAJv1/wi+mLMs8y8zC+fFYMjJd8XCw/lhiTiOMI4pb5spzM78llmCO+B2PCCEyXbEckedBB89vYcXGWg5GncksAQrwpHEyHZtZXIKsQCFz3Z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkk2po+HFW2jAPVJ7pW25ocQ4+bfWOzKkAqWUtaRjw8=;
 b=YkmAA5MLLbGcks4++fAAdqlFOkY0hp5BAMKoClpBrN0zc+x26KPiIxm4bNJrx6ruV/2Fq/tDh/yFWIphkBASSup4SNWJVYDOdzLyK4JPHuXLJ/roi9F3AqGheCkXuseYKT26U068EJUX6tDEe3qy6lu++Ntm1HpZYTzePcEhl0w=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7470.apcprd03.prod.outlook.com (2603:1096:101:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 11 Oct
 2024 01:29:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 01:29:05 +0000
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
Subject: Re: [PATCH v1 01/10] dt-bindings: media: mediatek: add camsys device
Thread-Topic: [PATCH v1 01/10] dt-bindings: media: mediatek: add camsys device
Thread-Index: AQHbGkcqBeP8ybzzkkuuOw+G7YHzMbKAxVqA
Date: Fri, 11 Oct 2024 01:29:05 +0000
Message-ID: <e1422e090c4c979a1c7a3620c4dc6c259e48cf97.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7470:EE_
x-ms-office365-filtering-correlation-id: 0920878a-2db7-496a-ea3c-08dce9941859
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TnpVVEhWbjRORFNQTUVDbzUxOCt3cGsxaVpHYUpLSFdERGNpd1VNNUsyNGdr?=
 =?utf-8?B?QVFpWVgrUjVnaUx1VDc0OGxWNVFTQnZOZFlJSHhiTDk4ckFmMmFZZDJXYWwy?=
 =?utf-8?B?VWc0VVJ5cm95ZFhiaVNsUDdObEFwakpxMUliVkhrSHpvN2o5SmJXWFIrTzgy?=
 =?utf-8?B?Zjd4OUZUSHoxVVFCOEwraE44V2ZZR3BURkhtbXZvQnp2NERyeVJER1JnT0lp?=
 =?utf-8?B?eXluMzlYZDI2ZUd0MGZJOUM1T2YySUlURkdraStJRHFRUE80VXNEQk94WnRH?=
 =?utf-8?B?a0hWbTQ1d2Z0NUVJMWR6Vk1neHpuNDlnQ3UvQ1NTVTdIdjdCdEZhRnd2Z0d4?=
 =?utf-8?B?anYrYWNGSUdzQTBCVTZ4TlRTWVR1dG1vTzVBM1B6OHZpanlnN2lZa1Z3OHlD?=
 =?utf-8?B?OXVJMVlyK3JkT25jQlRPbWVZbjhXUVF2OXNuTGF0Rk4wMnVRUjVMUVRDTnpO?=
 =?utf-8?B?V1BHNjVOVHNEYzZidHJDVmxpbnMvaFlyL051ZjBJeGZDQVlpNnlJVnlld2tY?=
 =?utf-8?B?aVZZdEluOHJ6a2VmZWt6SzZYMldsN0loVmtmaWV5SnhXbkJ6NVRPaWlMYjF6?=
 =?utf-8?B?Q0FKUFFsWWxlUkhSbXA1eW0yZnNTQ25QU3R1ZFhrOVJVUVl4OGlTMyszcEZZ?=
 =?utf-8?B?dGpWcVQvcVFIUjJrNUNLcGdXU3ZRYWowV0ZZU0JhbXdhOFRjWDVvNXRpN0Nx?=
 =?utf-8?B?SU15REpmZHBRbzhMQnBzYnoyeCtad09EUUNHajBXNFNjWGtWNHZrdHlMUTM1?=
 =?utf-8?B?bVNYUDVFbTYwQ2tPbDZ6NjNHR3BJQVh1TWpnRXZ0dElxcE5KQVlRd1owTWxY?=
 =?utf-8?B?NzlKVllPQUVxbnk2M1ExZ0xhaVZWczVsK0NUWXNMVGpER2N3WXZQQkpkRWI5?=
 =?utf-8?B?QXZPMjVTVEkvbG9QZkdqaXZFd0ZjazdKZ2pnOXFsTzhnSW1ucVROVm1oV0N0?=
 =?utf-8?B?REdyS3hOMGZKL01rRE8raU9CUXI4MzBKS1FvVERST2ZINVRHTU9ERFVJM0Q1?=
 =?utf-8?B?RjZmV2NUSjltYjVhSDVQS0xsUWQ2RFExMTlGVWRLM1I2dm8vcHp6c0dkbS9t?=
 =?utf-8?B?aE1xMmlmVGxCU3dTR0szeHNnYWlEZFh6V2ZsOEZkOWNzdU9BRlJ6QU5rb29I?=
 =?utf-8?B?UE5UNzlQTW9mMzlhQ0EvWWJkeFB3MjlKZTk5MUVxWjFtL00rbng4Z21JODFw?=
 =?utf-8?B?T3pSeTBGT1N5WUpkaktNYkdtVlVXdS9sWVlPNC9jMHdzU3o2Z1FLZXNmaEln?=
 =?utf-8?B?WmE3TTJ4T3duM0wwdTByZjhYeitiM3RzcW0vNXVYZjdLUTRSci9xZnlnb3JT?=
 =?utf-8?B?ZGhZeEQ1Zy9pWFdyWjNVS3FHc1hYbFdDR0t4MXNqQlhzN3VORUpldlFFQ0hq?=
 =?utf-8?B?WUJqQ2xmUGpvNXFiY0FmYUdNOUp4QitzK080QkxDL0JVVS8yY211c0wwa3VP?=
 =?utf-8?B?Q3dvUHlleThGKzlBY1JFZldNZjRNZnpSVjVDZjZUU1B6M0hieWhIVHZsTm9i?=
 =?utf-8?B?bEFLcDNuMmZ2MVo4UDBnWWtRRzJCUHRtUlN3VWZTQWhsdG5WQWxERVlSQnBX?=
 =?utf-8?B?NEc5WFlka1dibUdKWmNxZ0M1a2c2WkQwYzZVU2lCOTk2bkdBMW1KalJkd2c4?=
 =?utf-8?B?bjZRZ09hZENMQXlaZ2lCZkpiYm9BYXNwVU0xWnp2cys1Mm5yaVlPRU5weTR0?=
 =?utf-8?B?SUhqUFZKN2M3UGVMeitqeGtkd0ZUazVqSlVUQmxTY2RrV0dNanMzZFV4bHhU?=
 =?utf-8?Q?RouLFRzGgj704KfH10=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU4zVzhYcEM1cmV5OFRlbERLcjM2R1h1NEhPQy9xcEFzQUR3Qzk0RHM4bkpv?=
 =?utf-8?B?KzM5UGxVMWNhZzJOUnNCSzhyN2hrMWgxcmNCNWRqVHlCRWErUFJud3JvcXBV?=
 =?utf-8?B?Yk1IOEFGMG1uTmJaVEZOdkZLS2xpaytKTENJRnFIL3pTUHNqUjFCRzhETnVI?=
 =?utf-8?B?YnZUMUJqQTFFeUxTVi9LZEgxcGlnSTlLamdwdFEzMU9EYTFjRXo3N3JnNVhy?=
 =?utf-8?B?RDMyMENBVE16bGRTTzdUdDN6N0hHWmtERXowVHN2MEh5WFBmZkhPeXN2eUt5?=
 =?utf-8?B?RzJxK3B4SG42dXl1L1cwSWZOTjFjMElEZ3J3SnhlMW53Z3ZRYTcvRmtKeDZr?=
 =?utf-8?B?Ukh0Q3VyYWJzUmdlMWhtemdtK1A5TzhET0tVN05VR0xFVDd3cnlXcXU4Zk1T?=
 =?utf-8?B?QnZmeHBVSTBmaHhNcVFkT01CWGlmOFJuUVpGRVNsaDVjMTZoV1MyNEVVb0JI?=
 =?utf-8?B?QVdOVWFUcnFZSDhtNVRyWVhoSm5aTm9yQXJQUHhEaEJJc0pUSitFR0U3UE1a?=
 =?utf-8?B?T0wyR3k5alJ6eUNXcFBMWHA0ZlR2cW9RdWdMVC9tVTIza0ZoY3lieEhmTUh2?=
 =?utf-8?B?dW5IdVBoeFdaR1ZJOFFhVWNPUFFmMXBIeTJaWFdOZkhSREhPUWRzZjQwMHZK?=
 =?utf-8?B?MWpNUEZmMnF6MzVFZU5LU3BjcXlTeEYzUU1QQVhOazN6T2NyZXZBLzNHNFAv?=
 =?utf-8?B?a3pzYll1MGRlSGRMY0duR2wyU0ZuaTQ2SWRyTkszS2g4akNiUDQwRFlOaVlo?=
 =?utf-8?B?UWhDNnN2aXdnVWV4SWx2d0QwK3MvdUpoQ2pMUzZqQUhLcFcvM0VUTTlBMTgr?=
 =?utf-8?B?RjQwTVNDMnRLS2huS2hHZStyRVdoSnorWENiVFdaTWhBZzcza0h5YXBLT1Ev?=
 =?utf-8?B?TnZ2SEhFM3hPWktTRHpDSE5Obitmam91MndKNkcwZFpkOFk2SG1ZeVRHTERh?=
 =?utf-8?B?V2RjaEhmd0I3VXZZT21vZ0pIRGFyZjE1SHFodWVFVHlkbVlrc3E3VE16TUZn?=
 =?utf-8?B?dGhnS3oySVhGR2QzRU83UVVpWGpFbW1uU3hkVXZmWFg2YVpHV0FRczBPL2hN?=
 =?utf-8?B?UnR3Q1dMWWQyK1QyU0R0T1FnNzh6SDhSQkwyb3p5K1FHak9QaTVsYm9LL2dK?=
 =?utf-8?B?NXRkU1NBc3Jhb290V2hnMVgwVnBEeXl1TVZZNWJPZS9JaTd4WEdMSDFZTUVV?=
 =?utf-8?B?dm5uK0Myb0hLa0JJUlM0TFo0WTJVWS9GTk5vTnJPNm9OVVFPWGF5ek9DeUZh?=
 =?utf-8?B?K2ZmcUJUcnNpamZXTWo2bmFqWFlUOERlenRUcTFlL2FLd01GYlRBS3dGWElN?=
 =?utf-8?B?OUpFSHEwQm5sZmdTQ2luUmVhdHM5NFpsK2FUYWZ2WGJ5Y0Nqc1dtdkRWMFd2?=
 =?utf-8?B?MWZCdkMzYzA1SmJQVURzU3BReEhpUjg0WlhiRzU5R3J0V0FSTWo1WTFPWE53?=
 =?utf-8?B?TTg0QUNCQlEwZ3ExK2ZRV2J4TGs5dWROa0VsWVpUOEFxMkw4bG95NmNrNWVJ?=
 =?utf-8?B?Vk43cmV6VGF5cktQdzNaSDZLMlc3Rk9WKzJYcXFOZUg3bXNQcTBZVGEzM0Uv?=
 =?utf-8?B?NUtuZ3luLzVycnkzWEZkdUUwVXFuckQvOVU0eFUyNk1GTjNMSTkvejVFeGNP?=
 =?utf-8?B?NHZ2bVBRVlFxVU9wYzhSU1Y4Z2UzMjh4ZHNyN0ZGQlFTUmJJVDFXZFplM0h0?=
 =?utf-8?B?Tkx2cGZxWnppZzZRRG9taEZuWSszRWJSSjAyaTZQUWtwRUZGaU54Q3BtdkxD?=
 =?utf-8?B?VnRHSlV3NHk4YWd0aUp6R0k1QkZ4MEtnVGVKYmV1Y2hDSGpnSmtMenVNMVl1?=
 =?utf-8?B?V0cyemZUUXIzWHU5K2dqSFo0VTVveEQ1NjlzN0JsTVpXbEx3NFNvRkdXb1o3?=
 =?utf-8?B?Sk45TklvWTVWbG9TN3EvVGV3WmJTbWhuRVA2MWtzSUFKL2lOSUVnNERlbXNj?=
 =?utf-8?B?eXZxMjZYbVF5WTUyakw1UUM2YzBqWmMxUVJvTFU3UTJkdFVjK0JXV2xzWGpk?=
 =?utf-8?B?WjZkem1HN0NyUGh0WEUrODJWb2dpQkw1Y0FZWnJ6Y0xpWXNFTlc2bGo5RThG?=
 =?utf-8?B?MXRVSDR5bnJWVDNBSG93MUlFME02ZkJwWEg2Rmt2cFAwZTFnakF5VHZ0YWhj?=
 =?utf-8?Q?LZgB0DFg9yIV/MKyzLCKrtD5Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8572AB7548C5D041B4B549B9E8B80443@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920878a-2db7-496a-ea3c-08dce9941859
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 01:29:05.2313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BL2U9xArnyoKJfO8T8psNb9NcP0Ik1Frc461VgUfNt1kA/XExMVjD3+ALqlz3dtAw6tUFbkACbdzRX1sUW8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7470

SGksIFNodS1zaGlhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiAxLiBBZGQgY2FtZXJhIGlzcDd4IG1vZHVsZSBkZXZpY2Ug
ZG9jdW1lbnQNCj4gMi4gQWRkIGNhbWVyYSBpbnRlcmZhY2UgZGV2aWNlIGRvY3VtZW50DQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1oc2lhbmcuWWFuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgLi4uL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbS1yYXcueWFt
bCAgICAgIHwgMTY5ICsrKysrKysrKysrKysrKysrKw0KPiAgLi4uL21lZGlhL21lZGlhdGVrL21l
ZGlhdGVrLGNhbS15dXYueWFtbCAgICAgIHwgMTQ4ICsrKysrKysrKysrKysrKw0KPiAgLi4uL21l
ZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbWlzcC55YW1sICAgICAgIHwgIDcxICsrKysrKysrDQo+
ICAuLi4vbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssc2VuaW5mLWNvcmUueWFtbCAgfCAxMDYgKysr
KysrKysrKysNCj4gIC4uLi9tZWRpYS9tZWRpYXRlay9tZWRpYXRlayxzZW5pbmYueWFtbCAgICAg
ICB8ICA4OCArKysrKysrKysNCg0KQnJlYWsgZWFjaCBiaW5kaW5nIGRvY3VtZW50IHRvIGFuIGlu
ZGVwZW5kZW50IHBhdGNoIGFuZCB0aGlzIHdvdWxkIG1ha2UgcmV2aWV3IHByb2Nlc3MgZWFzaWVy
Lg0KRm9yIGV4YW1wbGUsIHRoZXJlIGFyZSBmaXZlIHBhdGNoZXMgZm9yIGVhY2ggb2YgY2FtLXJh
dywgY2FtLXl1diwgY2FtaXNwLCBzZW5pbmYtY29yZSwgc2VuaW5mLg0KV2hlbiBJIGZlZWwgZ29v
ZCBhYm91dCBjYW0tcmF3LCBjYW0teXV2LCBjYW1pc3AsIEkgd291bGQgZ2l2ZSByZXZpZXdlZC1i
eSB0YWcgb24gdGhlc2UgdGhyZWUgcGF0Y2hlcy4NCkFmdGVyIHlvdSBzZW5kIG5ldyB2ZXJzaW9u
LCBJIGNvdWxkIGZvY3VzIG9uIHJldmlld2luZyBzZW5pbmYtY29yZSBhbmQgc2VuaW5mLg0KDQpJ
ZiB0aGVzZSBhcmUgY29tYmluZWQgaW50byBvbmUgcGF0Y2gsIGV2ZW4gSSBmZWVsIGdvb2QgYWJv
dXQgY2FtLXJhdywgY2FtLXl1diwgY2FtaXNwLCBJIGNhbiBub3QgZ2l2ZSByZXZpZXdlZC1ieSB0
YWcgb24gdGhpcyBwYXRjaC4NCkFmdGVyIHlvdSBzZW5kIG5ldyB2ZXJzaW9uLCBJIG5lZWQgdG8g
cmV2aWV3IHRoZSB3aG9sZSBwYXRjaCBhZ2Fpbi4gVGhpcyB3b3VsZCBzbG93IGRvd24gdGhlIHJl
dmlldyBwcm9jZXNzLg0KDQoNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNTgyIGluc2VydGlvbnMoKykN
Cj4gIA0KDQpbc25pcF0NCg0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssY2FtLXJhdy55YW1sDQo+IEBAIC0wLDAgKzEsMTY5
IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkNCj4gKyMgQ29weXJpZ2h0IChjKSAyMDI0IE1lZGlhVGVrIEluYy4NCj4gKw0KPiAr
JVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbS1y
YXcueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWprSG1xdHhPc3Q2RHY4OFJhRS1zczlWYXhL
eEZvNEZ1UGwxc21YVEVua2lpalU3alM5bmtZR0JQb0xyOGc0SmkyZFpwYl83TEhXckxwSXl1MnFv
UG5oS3Z6V1EkIA0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01n
MEFSYnchamtIbXF0eE9zdDZEdjg4UmFFLXNzOVZheEt4Rm80RnVQbDFzbVhURW5raWlqVTdqUzlu
a1lHQlBvTHI4ZzRKaTJkWnBiXzdMSFdyTHBJeXUycW9QZktWQmRUdyQgDQo+ICsNCj4gK3RpdGxl
OiBUaGUgY2FtLXJhdyB1bml0IG9mIE1lZGlhVGVrIElTUCBzeXN0ZW0NCj4gKw0KPiArbWFpbnRh
aW5lcnM6DQo+ICsgIC0gU2h1LWhzaWFuZyBZYW5nIDxzaHUtaHNpYW5nLnlhbmdAbWVkaWF0ZWsu
Y29tPg0KPiArICAtIFNodW4teWkgV2FuZyA8c2h1bi15aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4g
KyAgLSBUZWRkeSBDaGVuIDx0ZWRkeS5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gKw0KPiArZGVzY3Jp
cHRpb246DQo+ICsgIE1lZGlhVGVrIGNhbS1yYXcgaXMgdGhlIGNhbWVyYSBSQVcgcHJvY2Vzc2lu
ZyB1bml0IGluIE1lZGlhVGVrIFNvQy4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0
aWJsZToNCj4gKyAgICBjb25zdDogbWVkaWF0ZWssY2FtLXJhdw0KDQptZWRpYXRlayxtdDgxODgt
Y2FtLXJhdw0KDQo+ICsNCj4gKyAgIiNhZGRyZXNzLWNlbGxzIjoNCj4gKyAgICBjb25zdDogMg0K
PiArDQo+IA0KDQpbc25pcF0NCg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbS15dXYueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay9tZWRpYXRlayxjYW0t
eXV2LnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4z
MGRmZDVlNWVjYjENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssY2FtLXl1di55YW1sDQo+IEBA
IC0wLDAgKzEsMTQ4IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyMgQ29weXJpZ2h0IChjKSAyMDI0IE1lZGlhVGVrIElu
Yy4NCj4gKw0KPiArJVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL21lZGlhdGVrL21l
ZGlhdGVrLGNhbS15dXYueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWprSG1xdHhPc3Q2RHY4
OFJhRS1zczlWYXhLeEZvNEZ1UGwxc21YVEVua2lpalU3alM5bmtZR0JQb0xyOGc0SmkyZFpwYl83
TEhXckxwSXl1MnFvUHlTNWFzamMkIA0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3
ISFDVFJOS0E5d01nMEFSYnchamtIbXF0eE9zdDZEdjg4UmFFLXNzOVZheEt4Rm80RnVQbDFzbVhU
RW5raWlqVTdqUzlua1lHQlBvTHI4ZzRKaTJkWnBiXzdMSFdyTHBJeXUycW9QZktWQmRUdyQgDQo+
ICsNCj4gK3RpdGxlOiBUaGUgY2FtLXl1diB1bml0IG9mIE1lZGlhVGVrIElTUCBzeXN0ZW0NCj4g
Kw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gU2h1LWhzaWFuZyBZYW5nIDxzaHUtaHNpYW5nLnlh
bmdAbWVkaWF0ZWsuY29tPg0KPiArICAtIFNodW4teWkgV2FuZyA8c2h1bi15aS53YW5nQG1lZGlh
dGVrLmNvbT4NCj4gKyAgLSBUZWRkeSBDaGVuIDx0ZWRkeS5jaGVuQG1lZGlhdGVrLmNvbT4NCj4g
Kw0KPiArZGVzY3JpcHRpb246DQo+ICsgIE1lZGlhVGVrIGNhbS15dXYgaXMgdGhlIGNhbWVyYSBZ
VVYgcHJvY2Vzc2luZyB1bml0IGluIE1lZGlhVGVrIFNvQy4NCj4gKw0KPiArcHJvcGVydGllczoN
Cj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBjb25zdDogbWVkaWF0ZWssY2FtLXl1dg0KDQptZWRp
YXRlayxtdDgxODgtY2FtLXl1dg0KDQo+ICsNCj4gKyAgIiNhZGRyZXNzLWNlbGxzIjoNCj4gKyAg
ICBjb25zdDogMg0KPiArDQo+IA0KDQpbc25pcF0NCg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbWlzcC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21l
ZGlhdGVrLGNhbWlzcC55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uY2UzNzhkZGJkNWJkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbWlzcC55
YW1sDQo+IEBAIC0wLDAgKzEsNzEgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiArIyBDb3B5cmlnaHQgKGMpIDIwMjQgTWVk
aWFUZWsgSW5jLg0KPiArDQo+ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVk
aWF0ZWsvbWVkaWF0ZWssY2FtaXNwLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFqa0htcXR4
T3N0NkR2ODhSYUUtc3M5VmF4S3hGbzRGdVBsMXNtWFRFbmtpaWpVN2pTOW5rWUdCUG9McjhnNEpp
MmRacGJfN0xIV3JMcEl5dTJxb1BnOHp5NTY4JCANCj4gKyRzY2hlbWE6IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWprSG1xdHhPc3Q2RHY4OFJhRS1zczlWYXhLeEZvNEZ1
UGwxc21YVEVua2lpalU3alM5bmtZR0JQb0xyOGc0SmkyZFpwYl83TEhXckxwSXl1MnFvUGZLVkJk
VHckIA0KPiArDQo+ICt0aXRsZTogVGhlIGNhbWlzcCB1bml0IG9mIE1lZGlhVGVrIElTUCBzeXN0
ZW0NCj4gKw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gU2h1LWhzaWFuZyBZYW5nIDxzaHUtaHNp
YW5nLnlhbmdAbWVkaWF0ZWsuY29tPg0KPiArICAtIFNodW4teWkgV2FuZyA8c2h1bi15aS53YW5n
QG1lZGlhdGVrLmNvbT4NCj4gKyAgLSBUZWRkeSBDaGVuIDx0ZWRkeS5jaGVuQG1lZGlhdGVrLmNv
bT4NCj4gKw0KPiArZGVzY3JpcHRpb246DQo+ICsgIE1lZGlhVGVrIGNhbWlzcCBpcyB0aGUgSVNQ
IGF1eGlsaWFyeSB1bml0IGZvciBjYW1lcmEgc3lzdGVtIGluIE1lZGlhVGVrIFNvQy4NCj4gKw0K
PiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBjb25zdDogbWVkaWF0ZWss
Y2FtaXNwDQoNCm1lZGlhdGVrLG10ODE4OC1jYW1pc3ANCg0KPiArDQo+ICsgICIjYWRkcmVzcy1j
ZWxscyI6DQo+ICsgICAgY29uc3Q6IDINCj4gKw0KPiANCg0KW3NuaXBdDQoNCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay9tZWRp
YXRlayxzZW5pbmYtY29yZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrL21lZGlhdGVrLHNlbmluZi1jb3JlLnlhbWwNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iYzUwOTk3NmE3OWUNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVk
aWF0ZWsvbWVkaWF0ZWssc2VuaW5mLWNvcmUueWFtbA0KPiBAQCAtMCwwICsxLDEwNiBAQA0KPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQo+ICsjIENvcHlyaWdodCAoYykgMjAyNCBNZWRpYVRlayBJbmMuDQo+ICsNCj4gKyVZQU1MIDEu
Mg0KPiArLS0tDQo+ICskaWQ6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRpYXRlay9tZWRpYXRlayxzZW5pbmYtY29yZS55
YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchamtIbXF0eE9zdDZEdjg4UmFFLXNzOVZheEt4Rm80
RnVQbDFzbVhURW5raWlqVTdqUzlua1lHQlBvTHI4ZzRKaTJkWnBiXzdMSFdyTHBJeXUycW9QeW4w
ZGtaQSQgDQo+ICskc2NoZW1hOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJi
dyFqa0htcXR4T3N0NkR2ODhSYUUtc3M5VmF4S3hGbzRGdVBsMXNtWFRFbmtpaWpVN2pTOW5rWUdC
UG9McjhnNEppMmRacGJfN0xIV3JMcEl5dTJxb1BmS1ZCZFR3JCANCj4gKw0KPiArdGl0bGU6IFRo
ZSBzZW5pbmYtY29yZSB0b3AgdW5pdCBvZiBNZWRpYVRlayBJU1Agc3lzdGVtDQo+ICsNCj4gK21h
aW50YWluZXJzOg0KPiArICAtIFNodS1oc2lhbmcgWWFuZyA8c2h1LWhzaWFuZy55YW5nQG1lZGlh
dGVrLmNvbT4NCj4gKyAgLSBTaHVuLXlpIFdhbmcgPHNodW4teWkud2FuZ0BtZWRpYXRlay5jb20+
DQo+ICsgIC0gVGVkZHkgQ2hlbiA8dGVkZHkuY2hlbkBtZWRpYXRlay5jb20+DQo+ICsNCj4gK2Rl
c2NyaXB0aW9uOg0KPiArICBNZWRpYVRlayBzZW5pbmYtY29yZSBpcyB0aGUgSVNQIHNlbnNvciBp
bnRlcmZhY2UgdW5pdCBpbiBNZWRpYVRlayBTb0MuDQo+ICsgIFRoZSBzZW5zb3IgaW50ZXJmYWNl
IHNlcnZlcyBhcyB0aGUgTUlQSS1DU0kyIHRvcCBSWCBjb250cm9sbGVyLg0KPiArDQo+ICtwcm9w
ZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNvbnN0OiBtZWRpYXRlayxzZW5pbmYt
Y29yZQ0KDQptZWRpYXRlayxtdDgxODgtc2VuaW5mLWNvcmUNCg0KPiArDQo+ICsgICIjYWRkcmVz
cy1jZWxscyI6DQo+ICsgICAgY29uc3Q6IDINCj4gKw0KPiANCg0KW3NuaXBdDQoNCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay9t
ZWRpYXRlayxzZW5pbmYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9tZWRpYXRlay9tZWRpYXRlayxzZW5pbmYueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjM3ZDk0MTM4YzU1OA0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay9t
ZWRpYXRlayxzZW5pbmYueWFtbA0KPiBAQCAtMCwwICsxLDg4IEBADQo+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyMgQ29weXJp
Z2h0IChjKSAyMDI0IE1lZGlhVGVrIEluYy4NCj4gKw0KPiArJVlBTUwgMS4yDQo+ICstLS0NCj4g
KyRpZDogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLHNlbmluZi55YW1sKl9fO0l3ISFDVFJOS0E5
d01nMEFSYnchamtIbXF0eE9zdDZEdjg4UmFFLXNzOVZheEt4Rm80RnVQbDFzbVhURW5raWlqVTdq
Uzlua1lHQlBvTHI4ZzRKaTJkWnBiXzdMSFdyTHBJeXUycW9QVmtMdGE5TSQgDQo+ICskc2NoZW1h
OiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFqa0htcXR4T3N0NkR2ODhS
YUUtc3M5VmF4S3hGbzRGdVBsMXNtWFRFbmtpaWpVN2pTOW5rWUdCUG9McjhnNEppMmRacGJfN0xI
V3JMcEl5dTJxb1BmS1ZCZFR3JCANCj4gKw0KPiArdGl0bGU6IFRoZSBzZW5pbmYgdW5pdCBvZiBN
ZWRpYVRlayBJU1Agc3lzdGVtDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIFNodS1oc2lh
bmcgWWFuZyA8c2h1LWhzaWFuZy55YW5nQG1lZGlhdGVrLmNvbT4NCj4gKyAgLSBTaHVuLXlpIFdh
bmcgPHNodW4teWkud2FuZ0BtZWRpYXRlay5jb20+DQo+ICsgIC0gVGVkZHkgQ2hlbiA8dGVkZHku
Y2hlbkBtZWRpYXRlay5jb20+DQo+ICsNCj4gK2Rlc2NyaXB0aW9uOg0KPiArICBNZWRpYVRlayBz
ZW5pbmYgaXMgdGhlIE1JUEktQ1NJMiBwb3J0IGZvciBzZW5pbmYtY29yZSBpbiBNZWRpYVRlayBT
b0MuDQo+ICsgIFRoZXNlIHBvcnRzIHByb3ZpZGUgdGhlIG9wdGlvbmFsIGNhcGFiaWxpdHkgdG8g
ZGVmaW5lIGVuZHBvaW50cyBhbmQgc2V0IFJYDQo+ICsgIGNvbnRyb2xsZXIgZm9yIGNhbWVyYSBz
ZW5zb3JzLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNv
bnN0OiBtZWRpYXRlayxzZW5pbmYNCg0KbWVkaWF0ZWssbXQ4MTg4LXNlbmluZg0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiArDQo+ICsgIGNzaS1wb3J0Og0KPiArICAgIGRlc2NyaXB0aW9uOiBNZWRpYVRl
ayBDU0kgUnggcG9ydCBuYW1lDQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvc3RyaW5nDQo+ICsNCj4gDQo=

