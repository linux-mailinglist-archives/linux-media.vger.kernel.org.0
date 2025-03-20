Return-Path: <linux-media+bounces-28515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B79A69EDC
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 04:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DCA91899BC0
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 03:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A58D1E3DF9;
	Thu, 20 Mar 2025 03:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sl50cpp3";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UuuWd9xK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420617BA6;
	Thu, 20 Mar 2025 03:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742442507; cv=fail; b=q5XEmhtuiDdx2QGiw4vOhikv51611tDzE2JhVWBKB2cywplFjcIT1N3xuBNZzLeDBwwPU2rXfvOWrPbVaZAordweua6jBBXlWVVmegka2bnQFZ06VHk0JlzB5VslJ/a7+wBd7QrEVGht5YEUobIruq6tRQ3RFh/6nMYI6lWWNWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742442507; c=relaxed/simple;
	bh=OaNZATjo2+9jJEzAeMLNqRTMypRBx58mtpsxefTk5Oo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bzysC0GGporm0AAV2UtGicp2ZnEbGGGdxU4PENUH+wOuImnXPyEbyMiQmJn3H2cbFJBMecE/T1x0z8/55TmvlvMhSR1fgA7P5Fw6+T12tdHSaj1pOXuZ1k/4/3905jU1hS6guagRerkEk/TA1W5OSK8xYANMJQxGwtoXqj2/S7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sl50cpp3; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UuuWd9xK; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 299b8e54053e11f08eb9c36241bbb6fb-20250320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OaNZATjo2+9jJEzAeMLNqRTMypRBx58mtpsxefTk5Oo=;
	b=sl50cpp39dUTvlLtKFmKMItckLf5OHe3zxjPjnwbzWwDgj+R0LZ+t1f0HFq1JJmtiC1rnoFVlYiZeZi4B7dpDNfPXAEQUCQcLJ9iRIDMe1FdYBLQCg1Ster1PS3eeJBuc20pJfnNZ/8WRzG7CWNSbOaSWIPci0XLVGg7Kt0R+C4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:73cdae42-9aba-426f-9c84-408ea7cac1aa,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:eb38c841-b9d5-4efb-8cbd-6eb0b75d20c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 299b8e54053e11f08eb9c36241bbb6fb-20250320
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2043379632; Thu, 20 Mar 2025 11:48:19 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 11:48:18 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 11:48:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKTr/MFDo8yMVe7xvk1dJW+cD5FyL6pLZrNPJ9qxXQdU+rQlIm8yIk1QRIe4E4Orz/NfbWjYz1xxy1zT/vfbNKytXj4GDapGoJW8s5WYCo7k6a9hZGNnuQzDpC0vdTjdwDI3sup5DTrG7JZLeTdL1a0EmdXbR859Dze3VqIN2hTBwCXZRD53nb8EC7djpk0H1fAyKyrKywbOz/Bp8LL9whnnOjK7OryHKeNyUaheXCI8L5v7KzvyKXp771nejx+HwEVnSiDCL7LHc+I5ibpSWSLnECd5lyq2VAnaJDn64T3YV4VLmfkxWnTJXdXl8Tbrv5IKbZTf7b4seNMZMj7IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaNZATjo2+9jJEzAeMLNqRTMypRBx58mtpsxefTk5Oo=;
 b=T6vegkcgpfsjhjQA16Q2RdOQ47JDdBQWf19Nq7G4AbIPQqxX6+3INNe7KLhm3tg49JUTUBl+bSyidutIlF4Ujijq6HcO5FRpTUqnCVdFfW5BRxXMEkOVcdm0Y3SdzHvgxe+BAq9JRvGeagAq0ja+LyGmEEFhOxbGNDo7PlQcABuyVThtVk1DgkP4yzsNk1A268lp8jhuskG02BUY/fbJtiJggICYauRIUJHDfpKOiqxYfkYwGWuJAmGFh38QOBW2nIgyWzGegd8Gnvnr7UQD2cQtVB2VuHmH1lffD9qo8r4NtmHmw4ASGPF0osRnDF4lYWQxYQswVVYfDV7pcyrX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaNZATjo2+9jJEzAeMLNqRTMypRBx58mtpsxefTk5Oo=;
 b=UuuWd9xKp2/2tOlSgXiVOTHIU//UWuAx7x+E/skDp/r0g8uUAQXnqKG7SRV6TYTyqhF0ZrgQiujkTfMf5Rck1kbsVKXMhvx/AVJaplcegALaMJImxmSjcHMn2IsqKrXLOJzFfv2VkYmwTIAn1LXFvyrJ4Brn5qibD5J5hOczGM8=
Received: from SI2PR03MB6613.apcprd03.prod.outlook.com (2603:1096:4:1e4::12)
 by TYSPR03MB8506.apcprd03.prod.outlook.com (2603:1096:405:5f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 03:48:15 +0000
Received: from SI2PR03MB6613.apcprd03.prod.outlook.com
 ([fe80::b84d:f66c:289f:cb54]) by SI2PR03MB6613.apcprd03.prod.outlook.com
 ([fe80::b84d:f66c:289f:cb54%4]) with mapi id 15.20.8511.026; Thu, 20 Mar 2025
 03:48:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v8 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Thread-Topic: [PATCH v8 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Thread-Index: AQHbbNbRC906LnN3Lke2gJ1B44z527N7vB+A
Date: Thu, 20 Mar 2025 03:48:12 +0000
Message-ID: <05bbdb1a73b6a89928f41fe122c44d0ed60bce91.camel@mediatek.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
	 <20250122-add-mtk-isp-3-0-support-v8-2-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-2-a3d3731eef45@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6613:EE_|TYSPR03MB8506:EE_
x-ms-office365-filtering-correlation-id: fe06fcd4-15ae-4a04-24ad-08dd676209b1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dTlsdnNLSXhtUG1MRE5DMTBtZlU1b3UrM3MreFE2VGltS2ZhaDVkWDdKZFhp?=
 =?utf-8?B?dVg2QzYrYkJwN0VTa2lCNDFTbjloeG11K1dpWUpzay93d0xQMDluUGdqWFJn?=
 =?utf-8?B?d0t0NElYNEp2NnJGUjdUcVhYMGh4QVB1Ui9pYk5tTS9CbzZBY1JmcXJjTFhF?=
 =?utf-8?B?R1drd2w1RXNvQW1rVGw3TGV2b1Z1UXNicGcxNlV2UEZsRDg4TFBDM0p0L0Zn?=
 =?utf-8?B?ellCMHBlVjI0bVovR3FTTVEzNFU4WVY1blVCRjdPV0gzSXpKaUI2QWtwL1F2?=
 =?utf-8?B?NzRIOC8yU0dDaFdZNXp5YVZTemM1ekRBTDRPNFEwc3RpVFJCMVgvdFVJclFv?=
 =?utf-8?B?M2dFaWczYVRUcHRMOUVVRS90algraEN6K1BwekMwcmRSLzJQSDhpOGdodWxa?=
 =?utf-8?B?Y2dWcUk5Z3NaNUZrZ1pKV283ZnJzZndqcFdXTU9tWlpJeDJNNE5tVEMvL1oz?=
 =?utf-8?B?cVpKUVB1cjhKSkFXTkJoSGlId2g0LzB6blc3TlBsTWI2ZWdrS2ZKamFLaWNL?=
 =?utf-8?B?Qkhsc3Fva2FTT28wbGlGU0hNNUtsQ0J3Rk05NzVxRldNblpGb2NKL1UyUkVr?=
 =?utf-8?B?MkZTZDJiSENHeFV5ZVpBVS80Nlc5alZFRFNKcm5HQWJjMXJZVGJHVVo3U082?=
 =?utf-8?B?TFZ4TGlwbWgxS055Q3o2UmxMVDdxenNmN0k2NGZRR2JkRzFTSTFsdDJxRUlL?=
 =?utf-8?B?VFBhcG15TjZiOHFRQXFuODZORS9EYXhrd1ZtTjNncEppSTZLK2plZWo3VFEr?=
 =?utf-8?B?VzR2Y3JLNEM5TjJrRWtsRXRjbGR1aWpxUWI3OFhSUUIxbjdQUVlxNTFHVS9M?=
 =?utf-8?B?cGp0VVFSQnhlTGo5ejY4dFVtQmRhS2JrTG9QQ2dSenh6TzFwbmdubFdHTlo4?=
 =?utf-8?B?Wnh2Y0lZZnJVRkNnb2p0S08vWEk2MHR2ZmtKMlBXNnpKVTNwK0JZbE9xK0s4?=
 =?utf-8?B?a1lhaFhaODN4V0crbUQ2cnZrMXZvU2JtWTNHUjhWeVBiRzVtMCsySjNwVTh6?=
 =?utf-8?B?NW9KTEp3Z0h6WENWbk0xVjBpT1RQZm9NcFFOWSsyR1ZWbGVtQ0hBei9hNkx5?=
 =?utf-8?B?Q2F3U2UwSUNiVlNzS1VlSU9HazBZLzdjcUJJSW5hT2x6aXhrc0Nta2ZLOHJm?=
 =?utf-8?B?Z2JuK2syRm00WEg5ZjB6L1VjRE45MkxmMzhGRStKVEc5aENIRFBSeG80TUNR?=
 =?utf-8?B?U1U5UFM1Tjl3b005VU8yYU82MjUzQnZGYlFJRURTZytCUlUyMGpsQkgrZlVr?=
 =?utf-8?B?QmtFVjJxQXdZVVp1ZS9qMnVzWExBRjZVQzhDUVRzekV4S1FneWkreUo0RGhZ?=
 =?utf-8?B?Y0lucmpOcmlCekV0SzVXSGh3NDREU1JrbUg0NGp0emd3ZHhINFRKVHUrbUIz?=
 =?utf-8?B?c1gwaE1nZ210UnVQeHlQMWFOdmY3L0V0OER6eEpzRi83eVdBUGt2ZVZTN3ky?=
 =?utf-8?B?bnhKaEtOVU90UTVoa3lvWEI2Vll4NHlOVk9BaXFrWm1hckdwTzhpbzZJY2JL?=
 =?utf-8?B?ZTBnMUtQelhBcVFCQkdyaTBTcWpnNFlYS3loMkJObC9kek14TkJCS2FPVGlO?=
 =?utf-8?B?dDVFMnUxZTV3eWlJS3BXTmVtOWxQZlRGTit5UmJ1TjF1ckFJenovS3hzbEM0?=
 =?utf-8?B?Wk1hdVZZMUZwcDBKeVNpMjBDTHhzWmt2eWI0eEdPZnlWNGhDMHlNQURianJr?=
 =?utf-8?B?WDJzTXczenRnWTRFSks5bHd4QVpDd3lzL3lsS3ZyNUd1RC82akVMbDAxbkRC?=
 =?utf-8?B?STVuQzd1aURDczdheWVId25NTVRxS2Nkek4raWxxUUNicXNzN29IRjhtVktX?=
 =?utf-8?B?ekVrVkhWOEd3eVNTVFQ0MWkyQUR2SDYwRDlxdUFyYWt1c0kvWDJlVUV0aGJ1?=
 =?utf-8?B?Q0ZpK1BlYTVzMUZWVlMxSGY3Qit2WU85QTBjK2lFSkR1UVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6613.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXR0S2NjZm42WHVjYit1SHZXWHNkei9xR2pIWG5heUE5VmNjK3hQd0tiK25K?=
 =?utf-8?B?Ry9jbS9uMWliZzBiNFJ4cVhDNDhUMlByUFJxR0VwN0x4U09DS3BPdEdNbkdh?=
 =?utf-8?B?bWYrZTg2V2xKN3BhUDRyU2FiSkJvL0hZQWZ1c25FK3RvZExwQ2I5Q1hHd2Mw?=
 =?utf-8?B?UFBzcDFCVEZaNmRTQmRRUldWYnM0UlRrQ0dld25ac1d6VGUrK3RXbGhieW15?=
 =?utf-8?B?eGxiQmlVWUNkcWk4aUhyd2NwT2JYbncxWm0wYndseFlBbHAydnJtVmo2YlpO?=
 =?utf-8?B?ODdPTkd3d3dVcTZKZnd4U2QwaWFRZVZwNW9JOVo3RXAyQ3N2emJmNFRrOGpH?=
 =?utf-8?B?ZXN0OERFZjB4YnZoaVRSSVFaQTdKbUVndXpiOW9PVmhDck5rVDI4b1gwSlB3?=
 =?utf-8?B?c3hISjdURndzZDZaM0FFRzAzanlLUW1ldGdIb3RQOTBkbGFmRU1rUWhJV240?=
 =?utf-8?B?WWNwNXAyTy9vMSs2bzJlM1ZTK0F6Z0ZZMGNMNnFQb1plMFVrbEJ0d3gxNHVz?=
 =?utf-8?B?SUVtKzEwV3M1MWVPZnhPUXdxd1Y5YTloM3BSa2dIcnppbHJ1RHdHVkwrRG5S?=
 =?utf-8?B?Mm1uMlVTTTBZYlM5eE9IMWVMckErOUpxTTBzdDM1RGphbE1hSjBsVVBKOXRL?=
 =?utf-8?B?c1RJdXEyTTNnM1dZMmJHQlBBWVVQRURQRVd2azdGenhKTUduOFJKRlBlZldn?=
 =?utf-8?B?d2g5TVk0OWZhN3k0TVIreEtHUnVCeGIwVnhLbEFmaWVTclhKbURGYUI1ZkFr?=
 =?utf-8?B?bGhkZjgxRHNzWWQxNWpDMGZZajBRa1pUbVFINU04c0czcDgwSXJvTklvRHlk?=
 =?utf-8?B?YU5mUnk4ZmNwMGprN21XVkpaSFNrWkloOEorcXFFbHRFbmJRSndsOGgydytN?=
 =?utf-8?B?SWJ0M25XRVN3UkJzNzZVZDV6eVR1Q1F5ZUpnbm5NTUpVd00zOFJoc2xyVEVY?=
 =?utf-8?B?Sk1Gcjdoc3lqTHFzTytqb1dETzRrSlRPd2RoQ2ZPblM1b0Fqb1pKSVJJYlor?=
 =?utf-8?B?OGh1ZXFBYTMrQUkrcU9EZkdENlE2NkpFMXB2Y0cxTmpySlA3eS9reG9LK0h3?=
 =?utf-8?B?MlVDeFRxTFFzWFVqODhJb3JRQmt1TkNUMVdEZGRQdVlqamFTN3pGSmRPV3hT?=
 =?utf-8?B?N0dtLzJqUnV6eXlPTWZ6UlhCQTJLK1h5SjEweitLZ1ZZRndQTGcvR0FqSU9s?=
 =?utf-8?B?aVM3KzNBNVBBSENTZTZFOC9DU0JvQkZZcGFsUFpKanpqWTJvYXNUNEtBdTV1?=
 =?utf-8?B?cHN5SloyaWJuU1A5MXJycjRWb0ZIbnQ1djFkTk96RGNMT01Wc0gxWmxVRTFw?=
 =?utf-8?B?M21sN0hoNFMxYTlpbGs1SEdzVzlCVlFVQWhKQWl5cE1KVEI5M2JaYWRBR3dN?=
 =?utf-8?B?ZWJkdmF5NGVCVXp0OXBNWWRIZnlpSzNHSDEvVFNpWjZXVlkzSUVxMEJ2T2R2?=
 =?utf-8?B?dkU4TTZzQkNscTZpeCtGcXZVYzhzc0NhRjNxSEJXSTc5clplbkV4ZXZYU3Rq?=
 =?utf-8?B?dGMyRUdnODRBZUNFWS94VllJMTBJSm1HaXVoK2tubDAyaVI5NHMvaEZaL0hl?=
 =?utf-8?B?SHY5YTVJaG1lYUsyMUlZenVua1p3TzF5TFRjQ2tXZi9XamhMUkIxeEtiSnNC?=
 =?utf-8?B?bkdMVTIxNzg4WWxQL0owWnRzSGsrcGdsZzNxaEZBTzROZTBxeWNES1FrdEhL?=
 =?utf-8?B?SjZldGxtU2VZazFUeG5sVm9xSjd4UzRoNERjWlVLbnY5SnVKME9YRjQ4L1Qz?=
 =?utf-8?B?Rk5BRHI5TlFEYU9jL2szWUltRUpKVmsxaDB1NHpmRTZkOEs4VEVTVWhPR1dz?=
 =?utf-8?B?WDBCaFVQL2wrd0lxMWMzcXZTN1R1T0RwcUtuQ0o0OE9CSlZsYitPdzJNMGF4?=
 =?utf-8?B?NlEzL3hjd2hTZVdXanpRQ1ZydUpJOEd3Q1NSQjIrQnpCeHRsa0N5ZlROdnhn?=
 =?utf-8?B?SWdySlMrY2tUQS8rM09XSi9jR3F5NGM4WnM4NXBhQUZMN0NyTjlGclhvNnYx?=
 =?utf-8?B?aFZKdUt5Vm5iTWRDZTRrZllWMnQ3Q0NpZnU0Q2tRVjhrYkJ4Nm1taVlaaEVW?=
 =?utf-8?B?WW5yZnZ5RXpsb25UTnFPVW9MOXQzRzNkemEvNzM0aHpBemlPRC9JejQxZldF?=
 =?utf-8?B?Z21EVlZpSXRnNi9YWGYwY3FEeFpVWnpram9nai9yVWRYdTBPUUh4ZkhBN0Z2?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <060BBEDF4181B447AACAF0FD72FB199E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6613.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe06fcd4-15ae-4a04-24ad-08dd676209b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 03:48:12.3392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwBLE6bsD00uSH7OGjW7wACOJvnrbJgU8XSeihHws4hi8NVALCHv+eHAWEtqUsXp1eo7dAQiGcGCoAkKKGbv+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8506

T24gV2VkLCAyMDI1LTAxLTIyIGF0IDE0OjU5ICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29t
Pg0KPiANCj4gVGhpcyBhZGRzIHRoZSBiaW5kaW5ncywgZm9yIHRoZSBJU1AzLjAgY2Ftc3YgbW9k
dWxlIGVtYmVkZGVkIGluDQo+IHNvbWUgTWVkaWF0ZWsgU29DLCBzdWNoIGFzIHRoZSBtdDgzNjUN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBiYXlsaWJyZS5j
b20+DQo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0K
PiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBoYW5AYmF5
bGlicmUuY29tPg0KPiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgzNjUt
Y2Ftc3YueWFtbCAgICAgIHwgMTA5ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgzNjUtY2Ftc3Yu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxt
dDgzNjUtY2Ftc3YueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi43MjNkZjdjMWE5MDBmZjZiNzJiZTA4
NGUwOWRmY2YwMTkwZGVlNjJmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODM2NS1jYW1zdi55YW1sDQo+
IEBAIC0wLDAgKzEsMTA5IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyMgQ29weXJpZ2h0IChjKSAyMDIzIE1lZGlhVGVr
LCBCYXlMaWJyZQ0KPiArJVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL21lZGlhdGVr
LG10ODM2NS1jYW1zdi55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchaVJ2eFluVDdaWERQNEtu
Y0hfSkNVem5aRE9SejFkR0VuTHg0QTRfNXplVGtDX0U0TldEa0JJQnlfUlFxT3h1bGFCcVFHMkxm
OHdYZzR5dG1kQSQNCj4gKyRzY2hlbWE6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdN
ZzBBUmJ3IWlSdnhZblQ3WlhEUDRLbmNIX0pDVXpuWkRPUnoxZEdFbkx4NEE0XzV6ZVRrQ19FNE5X
RGtCSUJ5X1JRcU94dWxhQnFRRzJMZjh3VWhSejBSSmckDQo+ICsNCj4gK3RpdGxlOiBNZWRpYVRl
ayBDQU1TViAzLjANCj4gKw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiArICAtIEp1bGllbiBTdGVw
aGFuIDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+DQo+ICsgIC0gQW5keSBIc2llaCA8YW5keS5oc2ll
aEBtZWRpYXRlay5jb20+DQo+ICsNCj4gK2Rlc2NyaXB0aW9uOg0KPiArICBUaGUgQ0FNU1YgaXMg
YSB2aWRlbyBjYXB0dXJlIGRldmljZSB0aGF0IGluY2x1ZGVzIGEgRE1BIGVuZ2luZSBjb25uZWN0
ZWQgdG8NCj4gKyAgdGhlIFNFTklORiBDU0ktMiByZWNlaXZlcnMuIFRoZSBudW1iZXIgb2YgQ0FN
U1ZzIGRlcGVuZCBvbiB0aGUgU29DIG1vZGVsLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBj
b21wYXRpYmxlOg0KPiArICAgIGNvbnN0OiBtZWRpYXRlayxtdDgzNjUtY2Ftc3YNCj4gKw0KPiAr
ICByZWc6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBjYW1zdiBiYXNl
DQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBpbWcwIGJhc2UNCj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IHRnIGJhc2UNCj4gKw0KPiArICBpbnRlcnJ1cHRzOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+
ICsNCj4gKyAgcG93ZXItZG9tYWluczoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIGNs
b2NrczoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNhbSBjbG9jaw0K
PiArICAgICAgLSBkZXNjcmlwdGlvbjogY2FtdGcgY2xvY2sNCj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IGNhbXN2IGNsb2NrDQo+ICsNCj4gKyAgY2xvY2stbmFtZXM6DQo+ICsgICAgaXRlbXM6DQo+
ICsgICAgICAtIGNvbnN0OiBjYW0NCj4gKyAgICAgIC0gY29uc3Q6IGNhbXRnDQo+ICsgICAgICAt
IGNvbnN0OiBjYW1zdg0KPiArDQo+ICsgIGlvbW11czoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiAr
DQo+ICsgIHBvcnRzOg0KPiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRp
ZXMvcG9ydHMNCj4gKw0KPiArICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICBwb3J0QDA6DQo+ICsg
ICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiArICAg
ICAgICBkZXNjcmlwdGlvbjogQ29ubmVjdGlvbiB0byB0aGUgU0VOSU5GIG91dHB1dA0KPiArDQo+
ICsgICAgcmVxdWlyZWQ6DQo+ICsgICAgICAtIHBvcnRAMA0KPiArDQo+ICtyZXF1aXJlZDoNCj4g
KyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gaW50ZXJydXB0cw0KPiArICAtIGNsb2Nrcw0KPiArICAt
IGNsb2NrLW5hbWVzDQo+ICsgIC0gcG93ZXItZG9tYWlucw0KPiArICAtIGlvbW11cw0KPiArICAt
IHBvcnRzDQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFt
cGxlczoNCj4gKyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL21lZGlh
dGVrLG10ODM2NS1jbGsuaD4NCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9pcnEuaD4NCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbWVt
b3J5L21lZGlhdGVrLG10ODM2NS1sYXJiLXBvcnQuaD4NCg0KVGhlcmUgaXMgbm8gbGFyYiBwcm9w
ZXJ0eSwgc28gZHJvcCB0aGlzLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9wb3dlci9tZWRpYXRlayxtdDgzNjUtcG93ZXIuaD4NCj4gKw0KPiArICAgIHNv
YyB7DQo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiArICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwyPjsNCj4gKw0KPiArICAgICAgICBjYW1zdkAxNTA1MDAwMCB7DQo+ICsgICAgICAg
ICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODM2NS1jYW1zdiI7DQo+ICsgICAgICAgICAg
ICByZWcgPSA8MCAweDE1MDUwMDAwIDAgMHgwMDQwPiwNCj4gKyAgICAgICAgICAgICAgICAgIDww
IDB4MTUwNTAyMDggMCAweDAwMjA+LA0KPiArICAgICAgICAgICAgICAgICAgPDAgMHgxNTA1MDQw
MCAwIDB4MDEwMD47DQo+ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTg2IElS
UV9UWVBFX0xFVkVMX0xPVz47DQo+ICsgICAgICAgICAgICBjbG9ja3MgPSA8JmNhbXN5cyBDTEtf
Q0FNPiwNCj4gKyAgICAgICAgICAgICAgICAgICAgIDwmY2Ftc3lzIENMS19DQU1URz4sDQo+ICsg
ICAgICAgICAgICAgICAgICAgICA8JmNhbXN5cyBDTEtfQ0FNU1YwPjsNCj4gKyAgICAgICAgICAg
IGNsb2NrLW5hbWVzID0gImNhbSIsICJjYW10ZyIsICJjYW1zdiI7DQo+ICsgICAgICAgICAgICBp
b21tdXMgPSA8JmlvbW11IE00VV9QT1JUX0NBTV9JTUdPPjsNCj4gKyAgICAgICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JnNwbSBNVDgzNjVfUE9XRVJfRE9NQUlOX0NBTT47DQo+ICsNCj4gKyAgICAg
ICAgICAgIHBvcnRzIHsNCj4gKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4gKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKyAgICAgICAgICAgICAg
ICBwb3J0QDAgew0KPiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47DQo+ICsgICAgICAg
ICAgICAgICAgICAgIGNhbXN2MV9lbmRwb2ludDogZW5kcG9pbnQgew0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzZW5pbmZfY2Ftc3YxX2VuZHBvaW50PjsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgfTsNCj4gKyAgICAgICAgICAgICAgICB9Ow0KPiArICAg
ICAgICAgICAgfTsNCj4gKyAgICAgICAgfTsNCj4gKyAgICB9Ow0KPiArLi4uDQo+IGRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IGE4M2RiNDFhZTBlOTQyN2U5
ODNlMDJmMDFhZWNiMDgxOTNkYTNjZDIuLjkzZDU5YzI0YmVmZDk5MGFiZDk2ZWY1ODU2MDc5OTJh
NmIyMzFiNzIgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5UQUlORVJT
DQo+IEBAIC0xNDc1OSw2ICsxNDc1OSw3IEBAIE06ICAgICAgTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiAgTTogICAgIEp1bGllbiBTdGVwaGFu
IDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+DQo+ICBNOiAgICAgQW5keSBIc2llaCA8YW5keS5oc2ll
aEBtZWRpYXRlay5jb20+DQo+ICBTOiAgICAgU3VwcG9ydGVkDQo+ICtGOiAgICAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODM2NS1jYW1zdi55YW1s
DQo+ICBGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLG10ODM2NS1zZW5pbmYueWFtbA0KPiANCj4gIE1FRElBVEVLIFNNSSBEUklWRVINCj4gDQo+
IC0tDQo+IDIuNDcuMQ0KPiANCj4gDQoNCg==

