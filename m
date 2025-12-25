Return-Path: <linux-media+bounces-49520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30902CDD654
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E697A30136C3
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C81D2E2852;
	Thu, 25 Dec 2025 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u0Y4rQ04";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fLGSs25p"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCED1D5ACE;
	Thu, 25 Dec 2025 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766646343; cv=fail; b=rgLldhEWpgulf/tsrryLYtQDr1wTtVdxvvWRKjuQB/PO0ruiBorMxeLHc2L9BG397Ta1B56VC6jx9hS7UAGgfdi6VWUpYlrc9ysIz3WK2FvoGa7TdhJqBy+byGDQxMXpE4ufkAjERGYBco9tv4NhEmNaGVtjgTvApC8ETSuPPUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766646343; c=relaxed/simple;
	bh=VI789WcssYZ5Q6clDziGBwTtyARiaqqiFPelQRZVg3w=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=auEvhc7OxqpQuik4QnMWGKhzTxEiP1lJFf9cJrd1dOwilmEpWAxuFpdU8JwYZ0qeEOml2S+RzkZRsS8QYiBl06KLZBQmyqDq1A7PWkPm7FP0eqDDkRikl6ax5C9kxZKUzRyEHbr/PN4NtU9OcZw0w63lQzfQqTG5OCdCWXDf2Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=u0Y4rQ04; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fLGSs25p; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1cf2da46e16011f0b33aeb1e7f16c2b6-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=VI789WcssYZ5Q6clDziGBwTtyARiaqqiFPelQRZVg3w=;
	b=u0Y4rQ04LRxKQ69q6GhrR2Zs5mREdYFMjcXGSB4itnR9P4FLJDUS+0h5wTP7ndlsjSVXz5kJHwAuyTOwNeoyBd8vz3xwLsYsw0+OhsjTfe7m1f1C5f2YR0xJ1xO0wN3N07LwCEZ+hF/3UYKGLzHlfUjgs3HU2EKb9BezS6tnsu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:83b24cc9-d7f6-414b-81ca-918c830a30cd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:704d2603-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1cf2da46e16011f0b33aeb1e7f16c2b6-20251225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 700778074; Thu, 25 Dec 2025 15:05:36 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 15:05:35 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 15:05:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQtbgvn3oo+rAtJEQICsOJZippumRWf8oD/8QNqBLsD1OQQtM5F25ypqQZliDxeFIQ4IYQzKPyKwt0Rf8FwH5ycSXlkvY+YGn1AJWxVJCnS6neomJv98xj+TkE82lJc64LhVqQvfk1r9G2o/5snQfEG7zG9/3IOvSbenuTO2fp9o3biavW+gE8Qc7u0JMxRuJSi1d2Evojtnx7Rtp38wbH/lUWOtoWXo/VmVVFIs5S2WYZXt7CH87E6SXrSue/8E4MgtWmaAxyd34EyUr7BBD0P8LqdUhxGtJJpj1dDHCxCPouvM6e4iolFIZGwSWeIRZ6f4gy8w5QJmfKoDioJ05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI789WcssYZ5Q6clDziGBwTtyARiaqqiFPelQRZVg3w=;
 b=dQfds6sHNzAmz9Qq6zQLPDHdS6qM6BQljhf2Z6dYOckaztVo6sIZH8acA0rIfOMfCEVyIS6HIriUrQ6qDhdR9PBHCiWfbc9+7FqwVtmLFFCbxydRa+MNI1c2YQonHf1EhupHMwGhwL8HCKKwfkeJjJcwJQqbXZGASooJJe6u7fuGiRSAmbmUc/aMxHdcngRkV3vsma/Z8pSBKLwCy1y7acMvKRiTp2JvIbKwVYOSj204ypGMhEKJJUhik6lht92aXDBQuqacmQ9sWPmK3lfiQ8oaW2W5Iqb47QB7L8Oth17KDw9uPx8p/91CF/8pGNrdbGVpN+LQngLfWZ4NkzXLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI789WcssYZ5Q6clDziGBwTtyARiaqqiFPelQRZVg3w=;
 b=fLGSs25prDkxQIJ7WHFa45tM/cKsnLEKBMU7Lx7sJIPGbTra8/lGhIIZ6O6461w48E0j185nFYqMtyV6H+Xat8OL8SKM5vcsfQ0suGCPOLdNQsQFWnCwMzzP0v1OBvvw12I/+U+Y+h4AcZO6QcYZhBwXcz2+o47zS+fmIrx0RQE=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by JH0PR03MB8811.apcprd03.prod.outlook.com (2603:1096:990:a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 07:05:32 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 07:05:32 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 07/12] media: mediatek: jpeg: fix decoding resolution
 change operation
Thread-Topic: [PATCH v11 07/12] media: mediatek: jpeg: fix decoding resolution
 change operation
Thread-Index: AQHcY3DpmzTJ8O4GNkCC4HLJVQQGGrUk4mEAgA0wc4A=
Date: Thu, 25 Dec 2025 07:05:32 +0000
Message-ID: <da1ba8c74cbbd36441d567fee52072129b801544.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-8-kyrie.wu@mediatek.com>
	 <41e00b0f4c667ff8e8a8f8b81f64fe1bbca7c001.camel@ndufresne.ca>
In-Reply-To: <41e00b0f4c667ff8e8a8f8b81f64fe1bbca7c001.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|JH0PR03MB8811:EE_
x-ms-office365-filtering-correlation-id: 91e7a3ee-dea7-4c5a-342f-08de4383feb5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TWVINzgxT1hqbG9FUTVrYXUvMzgwR3dtamZnVjByK0NCemlaeVRyekNEdDZR?=
 =?utf-8?B?SFh0UDVkNnlwbHBEalU4bUVlYjRLOXFXUUlFb1lVOVlzdDlMdjVEVEhZVHNi?=
 =?utf-8?B?V3dyYVRrRTk2V3BPTkFkNGZjd1ZDbFpKK0VOVU5kUzkxeHZDd2xlOVg2S2Z4?=
 =?utf-8?B?M3ZDTTZGWG1KZDV0eXFtdjMvOXVBVlRKdEl2RWEvcU0vK2ZyU011TFdja0VT?=
 =?utf-8?B?bGdmL2JXUEdNYmt5M2xJODVnS1o4azdKMytZWmp2K3lteEpUZnQ4RW9kcVZO?=
 =?utf-8?B?TnNSSjVKSWFGenJOVVNJQkZkZExvODA2UUgzWHIvdU53WnZSRGxMeElTcHBp?=
 =?utf-8?B?ZFB4L3lQam5qaTByaXVaSWRRTU9zZ24zOHU0akJ2SVZOUlNmVzZzaFBFYkhs?=
 =?utf-8?B?QUJXVmFvZjZYZTJZSmloRkxrdER0WDZyNlF6b2NIVm03WmJKQUJnZ09oZG9T?=
 =?utf-8?B?cUJnVFZmMGVWelNrU3oyVXpqRTVLbUx1cnB0K2JFYWwrcTA5Vm9YeXNxSHpm?=
 =?utf-8?B?Y2NtbVBiVWZONW1MZWdicHRkWXFpK2lhN0tVcGFhekp2Q29CYWNCYkl4dTh0?=
 =?utf-8?B?WGs4ZnFnUGFVTXFJaTNjZGkwSlFYRmFlUEY3TFFsbTlDNHR1dXErNVp5KzZT?=
 =?utf-8?B?MVd1RGFSekhTVXAzeVp1dzVndnNFelFYM29SdEsybm9UUmpXak8yYmdLS0lN?=
 =?utf-8?B?aUZFZ0dNdmVsY2JlbDJmWVBmanZ0cVo2RmxMRU16STF5WlZsaXlLK1NOTVd1?=
 =?utf-8?B?OUpKYXN4WmVmb3dVdExnd1hwbmUyb3h3cTJtYlIvVWFJT2tKUDlpSkhnNGFY?=
 =?utf-8?B?ajJJVUVNbU5PODllK2dRcUxuWnE5SnlrZFVtbkZJY3MxWWdVaVdoaEZZaUpS?=
 =?utf-8?B?UlZRRDUxMU0wNHNDMEcyQXhoS0cxdDJ2WjNuRjVOSWtPbC9adUNuOGJOaGg5?=
 =?utf-8?B?bmp5UnZFeTYzRXFLclVNbUJHMys1S2dZVTcrTFpXaDI2a211UUNmMUtTMFJY?=
 =?utf-8?B?cWdaT1BUYTJLaGtaRjJEV3U3SUlpc3lHMFdGUWJDSXRMeXBodzhVU25mVjky?=
 =?utf-8?B?K1F2K1lTTjBvSGN2bmovT3dvcEpLOTlpRnE4SVUyMlM3cXdueWJrNENWRkJl?=
 =?utf-8?B?TWdGR2gwZTFrTGVUOHVRWjRiRHkySVNXalF0R2dXZCs5bWtad25kV01JUVFW?=
 =?utf-8?B?K29tUFYvWFZDWGxuNjh4MUxSYklPYWNQN0ZRSVFhS3VGTGpxM2VBUWMrNFJx?=
 =?utf-8?B?RFZ5UlFGSkdidUtOSTRSYTdFaEwzbG5LVEp4dWpCbGtZN3dqQnlCUVdDYUVw?=
 =?utf-8?B?eVNjQUJyL0JlRjJ1c0VYbWxERXRxaWhoRytaV3FBQ1hkQ2pPcDlpZDlXcDUx?=
 =?utf-8?B?VmJoUDVRUHRSWHRaVTBEVkVPN2tkNk5JZy9MdjRLeFZINzhrWUtnYVB3MzV0?=
 =?utf-8?B?OEpsZVJ6bURHQytJRFRjQ2lmOUU1WEYvb2VXb0F4bGhuWnJyTEoxNXhpRzNa?=
 =?utf-8?B?ZGlQWVUycm9kMVRpdGgzazJ4L0pTZVg4TDlXaGZ2YlYrWDRSRVZnQStmUWV5?=
 =?utf-8?B?WDVuUUQ0SzBYVXNiWXhydlJvNnJKMnpjR2JlTGRBOHB6L1lMcUlWTGQ5Ty90?=
 =?utf-8?B?eGFEbFRzWDBRN3ovbHV5UCtNckE0QUsxcWgrWDBZUlNkdlpwdHVWM2gzSC9t?=
 =?utf-8?B?L2Zqc1BTZWxoS2Qzdk5DWnE3UmRqRHN2QVBGQ2JsaUdmZmVnWWtMVm9GSkov?=
 =?utf-8?B?RWFvWE1JWWNkd0Q5VC9jYVJ3NXFOSTFmWlFpOUo5ZEcxZ1AzWW5LcHpRVFRG?=
 =?utf-8?B?MjBVN2gweE11TUt4RmRyMzZvZDRENC8vc2ZzQ1F6aFFhcUg3WkxPNFFTclFa?=
 =?utf-8?B?c2ZwV01Jd1VwODZZL0dWNGdhaU0va3dUV05mRnZpVTB4YWlHMklVSW9GRmFB?=
 =?utf-8?B?anFvMjFNUmV5NFJjeFJ5Q2ZkaVBSa0tibk8zUmFVdnZIcUFNK2xZZXZpS25V?=
 =?utf-8?B?NmpCVjQ1MGtkbVVjZ0dyTDNjUXpSNm0zZTZyTmlhZUxPVHVnekwxdjh0SUwz?=
 =?utf-8?B?Z1JTNldvaDRoOEw5Mkgzc01MclFyeFNUVTBrZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjUyVjRRUkM0U3llKzZ5YmNCc1ViL0pQNTZSQUxoU2FqTWIwRVBRNXVDU1Bk?=
 =?utf-8?B?Rm16amFwb2dabW9WS0dzOVlKa3F2eTFHMUwyVzl4Y3RwblNEYlVTeTF6MVEz?=
 =?utf-8?B?OFZBS1JGRVJEd0M0WmVySlJTTyt6K2hzTEt6blFGaWxsTW5QaXVvYS9meVNt?=
 =?utf-8?B?TDRpRkF6elJpYWc3RHNWMytBdTZ6bzg3Ukp2MlV2RU1UN1dkdDhtcXptSHd2?=
 =?utf-8?B?cHRXOTRVQ1MrdmhMbmRuU3k4Y3pRMzNKWXNxQis1N1h3Y0JIUmdBaTJhaVVM?=
 =?utf-8?B?REV3aGJHV0w5Ykd3TEo5WC93Q3IzdzhSdXlRQm5Xd3ZzOVdMZmhrWjhXOW9j?=
 =?utf-8?B?MWNCaitSVWhGSE43QVNwVDNYbFhjb2UrVEZSOUxmRDBzdlhJcUtTQ21yRUoy?=
 =?utf-8?B?UFBjZXZyWXNiUVpLNkhJeHFFZk9sNGw3RzR4MXYxRm0zdFR4ZVcvYURkVllR?=
 =?utf-8?B?VmM0K3kwcXVRaDBuSU9MMmxpUDAyNmpxV0RPam44L1VaZVdVVWkxOFVNbDRR?=
 =?utf-8?B?WWVYUDVNeEg1Z2J0UlMzTXNreHE3aTBLZjNOWXIvTzdaN1JaRkQ3b29DOGtU?=
 =?utf-8?B?NWp0L0lOYy8zUWk3NmZwcXVXZHRtKzZZbkhsOWR3TEpMKytsU085UzFXaGdB?=
 =?utf-8?B?cFpnVkR5RFZ1UXNoV3hLL3cramJpUkYxRjk0UlB5SCs3NHRFV3dIUkpyUjNK?=
 =?utf-8?B?MU8weE5aVVhXYkZNUFVzV2l4Y2VZOVdkY1JSSEYxaWZmNUx6bzVuYUpKbUQw?=
 =?utf-8?B?eG5PaEg4NW8vY1VBMXhQdGY0WWozRlZnRjRrK29CTFl3VkZEOHFEcGt1ZGk3?=
 =?utf-8?B?aEIrOWUxdkQyK3dVbWlhaFhTK05SS2E3aG8yUGVuRVlCYlB6T2lUamFPaHcw?=
 =?utf-8?B?STZsU29HRzVkTlpMMFFodEl2UkVGNHIvMHhuUkQ0VnhSQWpaT3RQVEJReS9R?=
 =?utf-8?B?UmZnUHJVdkl1UnNEQzZsOFFWYmFmaXBLdGhBakhKOC9LNnpUelE5K0xwVTQ2?=
 =?utf-8?B?UHFPa2REVEt5endkeWxNK1M2R0ZNVnUwV1NCYWlTcVNQcmVDV3hVOERiZXcr?=
 =?utf-8?B?dFlCVDZyMlZGdERSd1V2UVQ3cHZxZVZjSXFlak5iZndBaDhHU2ZhYVBzaGRa?=
 =?utf-8?B?OWRiKzRTbEQvVnI4a1I3NnQzZ1l2Zys1d3ZrZTlJeFh5bmozeTZTUk51ZGFT?=
 =?utf-8?B?MHBsWWlMelZqYXByNEZjZGd0MkozSTd0dHRaWGNqWksvY2g2WmZTeU5hWTRr?=
 =?utf-8?B?WjNGYjBTSFhITHFuWUdrdzJhNGM4eEg0TDRPZlJKcmlMRGxVb0lZQ0NVaUJ6?=
 =?utf-8?B?QnFzMXkzQm9IR25uZUVzcU1tcHdKNDl5NjM4YkNybjJPaWl6THZqVW1XRE1y?=
 =?utf-8?B?bGtrM0FmTFVPVE1RNitsamFDVHZtanVLMGwrRzRvK0ZVc0NzczFMWjI1M21o?=
 =?utf-8?B?VDNNRVRMUmsvOE5QeTNOcVBvYnB6OFJld1lsNFFRWW9DTmRRZjM0ekErQ2Qz?=
 =?utf-8?B?R3VuTXNQQ2VKVi9wdHk1WXhIT0ZRREoycHNiQmprOU5CL1B4V3dFbmJKd2Rx?=
 =?utf-8?B?UWR4WDlrN1p0WllYWHFQNDliNnlVOXVkcVNZWVV3VCtNWDNDR1o0OW5aYjh5?=
 =?utf-8?B?bzBzd09SUVJOcnU3SmEwZldCL3VVbWREWEFYNTYyQW81RkpjSm9rNHo5Z2di?=
 =?utf-8?B?d0JlZ1lxRmJWb2RJNGtnNjAzMlNybVNQVXM2SXdiSzg4SU5NTmViTlRzMmJa?=
 =?utf-8?B?ZUJyWDROdXovMzF1TnhkVWNtd1JjbHM0dlArWkxBVk5BU0VFMWpScnRIVFZ6?=
 =?utf-8?B?ditLK21ieHpCZDJZTllXM1Bqd3lVekU2SStKWDdWRVB0d2k2c25WbjV4c2RV?=
 =?utf-8?B?dGhQdm5sQTVHM2E5aHRReTNKTzBjU0pzQm5ldjBXcHlESlJyRE9RTytBdEhL?=
 =?utf-8?B?L3lYdTNFMS9SKzBON3NXSnJObjZFM0NhTm1nQWlhUWNnQkVpemdFa3ViZlM5?=
 =?utf-8?B?V0lsQTViTEl1MitRTFFsa0hrT3JwNjU2ZjN1WTVvV2Z3eFBMQlNGVHNhR0JC?=
 =?utf-8?B?eE5HekZ3eUhKRlY1SExYT0dMQ3l1RlBWZVFta3FFb2QrdUlEamYzemFpb0cx?=
 =?utf-8?B?WkZubjhwUFIrcWgreFkxZkZBT1FTOSt0NCtFbWEzZ3J5NFZxNWZuNDcyUEZu?=
 =?utf-8?B?eVBGN0JiRGx3SE83TmZCMVdOL00zMGJyTXpOeEU1ZTZ4RHVtalFKVjM4K1hH?=
 =?utf-8?B?NHhibXdONi85MXlMY01rNERFeFRPY0FNTGhaMmg4VmNTOHFtUEdpa2FsK3lx?=
 =?utf-8?B?L3hjdE9GZU8vazZXSlNxeUxacEhQR0lST1RBY0YvSmJLb3RFdkExUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FE716C59161EF48996734CBB46FEE07@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e7a3ee-dea7-4c5a-342f-08de4383feb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 07:05:32.5943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZ9TvLFHhu+3q0/5aW8+yjexQK+bqNoMiLG0KJLEOVSQO7wkyHrDNxfVGTdYU2Mb+GTNXgzA8FmpVH5zr5kF8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8811

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjQwIC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ3ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gMS5hZGQgYSBqdWRnZW1lbnQgZm9yIHNyYyBidWZm
ZXIgdG8gYXZvaWQga2VybmVsIGNyYXNoDQo+ID4gaW4gdGhlIHN0b3Agc3RyZWFtaW5nIGZ1bmN0
aW9uOw0KPiA+IDIuV2hlbiBhIHJlc29sdXRpb24gY2hhbmdpbmcgb2NjdXJzLCBpdCBuZWVkcyB0
byBzZXQgbmV3DQo+ID4gcmVzb2x1dGlvbiBwYXJhbWV0ZXIgaW1tZWRpYXRlbHkgYW5kIHRoZW4g
cmVwb3J0IHRoaXMgZXZlbnQuDQo+ID4gT3RoZXJ3aXNlLCBpZiB0aGUgb3JpZ2luYWwgc29mdHdh
cmUgcHJvY2VzcyBpcyBtYWludGFpbmVkLA0KPiA+IHRoZSByZXNvbHV0aW9uIGNoYW5nZSBldmVu
dCBpcyByZXBvcnRlZCBmaXJzdGx5LCB0aGUgQ1BVIGlzDQo+ID4gZGlzcGF0Y2hlZCB0byB0aGUg
YXBwIHRvIHByb2Nlc3MgdGhlIGV2ZW50LCBhbmQgdGhlIGRyaXZlcg0KPiA+IGRvZXMgbm90IHNl
dCBhIG5ldyByZXNvbHV0aW9uLCB3aGljaCB3aWxsIGNhdXNlIHBhcmFtZXRlciBlcnJvcnMuDQo+
ID4gMy5BZnRlciBhIHJlc29sdXRpb24gY2hhbmdlIG9jY3VycmVkLCBkZWNvZGluZyBzaG91bGQg
bm90IGNvbnRpbnVlLA0KPiA+IG5lZWRzIHRvIHdhaXQgdW50aWwgbmV3IGJ1ZmZlcnMgYXJlIHJl
YWR5IGFuZCB0aGUgc3RhdGUgbWFjaGluZQ0KPiA+IGNoYW5nZWQuDQo+IA0KPiBJIG1lbnRpb24g
dGhpcyBpbiBvdGhlciBwYXRjaHNldCwgdmVyeSBvZnRlbiwgMyBidWxsZXRzIG1lYW5zIDMNCj4g
ZGlzdGluY3QNCj4gY2hhbmdlcy4gRG9uJ3QgdXNlIGJ1bGxldHMuIFJlZmxvdyB0aGlzIHRleHQs
IHJld29yayB0aGlzIHRleHQsIHRoZXJlDQo+IGlzIG1hbnkNCj4gc3ludGF4IGVycm9yIGhlcmUu
DQo+IA0KVGhhbmtzLiBJIHdpbGwgcmV3b3JrIGl0Lg0KDQpLeXJpZS4NCj4gPiANCj4gPiBGaXhl
czogZGVkYzIxNTAwMzM0ICgibWVkaWE6IG10ay1qcGVnZGVjOiBhZGQganBlZyBkZWNvZGUgd29y
a2VyDQo+ID4gaW50ZXJmYWNlIikNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8
a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jIHwgOSArKysrKysrLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2NvcmUuYw0KPiA+IGluZGV4IDVmZmFlZTRkY2QxOS4uOTIzM2JiZmUyZDk3IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19j
b3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRr
X2pwZWdfY29yZS5jDQo+ID4gQEAgLTg4Nyw3ICs4ODcsOCBAQCBzdGF0aWMgdm9pZCBtdGtfanBl
Z19kZWNfc3RvcF9zdHJlYW1pbmcoc3RydWN0DQo+ID4gdmIyX3F1ZXVlDQo+ID4gKnEpDQo+ID4g
IA0KPiA+ICAJCXZiID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGN0eC0+ZmgubTJtX2N0eCk7DQo+
ID4gIAkJc3JjX2J1ZiA9IG10a19qcGVnX3ZiMl90b19zcmNidWYoJnZiLT52YjJfYnVmKTsNCj4g
PiAtCQltdGtfanBlZ19zZXRfcXVldWVfZGF0YShjdHgsICZzcmNfYnVmLT5kZWNfcGFyYW0pOw0K
PiA+ICsJCWlmICghSVNfRVJSX09SX05VTEwoc3JjX2J1ZikpDQo+ID4gKwkJCW10a19qcGVnX3Nl
dF9xdWV1ZV9kYXRhKGN0eCwgJnNyY19idWYtDQo+ID4gPmRlY19wYXJhbSk7DQo+IA0KPiBUaGUg
bGFjayBvZiB2YjJfd2FpdF9mb3JfYWxsX2J1ZmZlcnMoKSBtaWdodCBleHBsYWlucyB0aGlzIGJl
dHRlciwNCj4geW91IG1pZ2h0IG5vdA0KPiBuZWVkIHRvIGRvIHJhbmRvbSBudWxsIGNoZWNrcyBs
aWtlIHRoaXMuDQo+IA0KPiBOaWNvbGFzDQo+IA0KPiA+ICAJCWN0eC0+c3RhdGUgPSBNVEtfSlBF
R19SVU5OSU5HOw0KPiA+ICAJfSBlbHNlIGlmIChWNEwyX1RZUEVfSVNfT1VUUFVUKHEtPnR5cGUp
KSB7DQo+ID4gIAkJY3R4LT5zdGF0ZSA9IE1US19KUEVHX0lOSVQ7DQo+ID4gQEAgLTE3NDksMTEg
KzE3NTAsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdkZWNfd29ya2VyKHN0cnVjdA0KPiA+IHdv
cmtfc3RydWN0DQo+ID4gKndvcmspDQo+ID4gIA0KPiA+ICAJaWYgKG10a19qcGVnX2NoZWNrX3Jl
c29sdXRpb25fY2hhbmdlKGN0eCwNCj4gPiAgCQkJCQkgICAgICZqcGVnX3NyY19idWYtPmRlY19w
YXJhbSkpIA0KPiA+IHsNCj4gPiAtCQltdGtfanBlZ19xdWV1ZV9zcmNfY2hnX2V2ZW50KGN0eCk7
DQo+ID4gKwkJbXRrX2pwZWdfc2V0X3F1ZXVlX2RhdGEoY3R4LCAmanBlZ19zcmNfYnVmLT5kZWNf
cGFyYW0pOw0KPiA+ICAJCWN0eC0+c3RhdGUgPSBNVEtfSlBFR19TT1VSQ0VfQ0hBTkdFOw0KPiA+
ICsJCW10a19qcGVnX3F1ZXVlX3NyY19jaGdfZXZlbnQoY3R4KTsNCj4gPiAgCQlnb3RvIGdldGJ1
Zl9mYWlsOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiArCWlmIChjdHgtPnN0YXRlID09IE1US19KUEVH
X1NPVVJDRV9DSEFOR0UpDQo+ID4gKwkJZ290byBnZXRidWZfZmFpbDsNCj4gPiArDQo+ID4gIAlt
dGtfanBlZ2RlY19zZXRfaHdfcGFyYW0oY3R4LCBod19pZCwgc3JjX2J1ZiwgZHN0X2J1Zik7DQo+
ID4gIAlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGNvbXBfanBlZ1tod19pZF0tPmRl
dik7DQo+ID4gIAlpZiAocmV0IDwgMCkgew0K

