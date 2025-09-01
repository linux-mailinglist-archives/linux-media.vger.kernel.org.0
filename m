Return-Path: <linux-media+bounces-41386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED74B3D6B7
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 04:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CFF27A8163
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 02:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA891DF725;
	Mon,  1 Sep 2025 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q05n2Rdi";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PcIPviOg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C2A22301;
	Mon,  1 Sep 2025 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756694263; cv=fail; b=mn7TBEbr4yBWbqMTbsQNSco9TLcDOXzCzGYuRr9LirLnVVnvaBg2ekQXORUiq97NBt0y0uMvewEMRDf0dSsbWiVB/lhQ+7GLmLkCj4sAhaopNpPj2sWz9ZX6YCx1tmOnC4QsBZuekMScrPdt73y6JtRZdCI0yu3/YynyehAnlLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756694263; c=relaxed/simple;
	bh=by4t1np5TMiz03Xnnl9H5MxfOMYbbLbtSPFJnH3ZziM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V0ieWdCrM5DrV16UKVKW/nmjLRAc1G0Js0seWXCLLrPwbWf8y1KUy8F7KYP/U8BRI9aemkMIO8yRHPppgXAnXF1OjV6ADBg8b7lxSMQ67fUBuU5pvuc0akT8F2D7oMIP8DWWmTL4eN0kfAUydEqFj+q4xn2gublp3rFl8O7w95o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=q05n2Rdi; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PcIPviOg; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9b2b1bb486dc11f0bd5779446731db89-20250901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=by4t1np5TMiz03Xnnl9H5MxfOMYbbLbtSPFJnH3ZziM=;
	b=q05n2RdibHrtUkS1YXW5sTx1smUA96lVZT+6QzMLapna8ovMGXioHnchcgS+uo5txITXoIPDJFyhUP+azbHW24XKbjUMvpJkCVPA+Hl/7CHi7fjd162APaHExYuYbXylgE5hn06wiFT/slFkqV0KDXUJtIsJna2l/KkAG0TCXmc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:58d46987-2fcd-4d8f-bd7d-866cf16dd227,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:0e630e6c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b2b1bb486dc11f0bd5779446731db89-20250901
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 508600786; Mon, 01 Sep 2025 10:37:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 1 Sep 2025 10:37:28 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 1 Sep 2025 10:37:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIAJCLaHPtFp+noWQsdzswtOdfLndNy0dMywyy/AWB84O6pACstVAyy/fZqIHDzBYlWUQdGLYYeldoVEOpTgtKASneBtN6UzKddyzJMRMo2EceiqXSv/LYWSuhQvSVpCPfS78S3idls1Cqf/XQXf5TAV0LfljwetXCsXO12R61TRVsCtOruQy0MGrTbr021rAB+PWAscyU0ob+k3xqTaRB3aqyLJym1xkJXZKQ5dNxKi7gwDXl9cQ5rmZRrzdn0fzfGZJfwl04g9E0bYveKW7NUkJc8YpzbgB4deTzTWRavjVnAB7AibFbXfVYAYNAW3CwhsUYJnR094Lc0hip6vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by4t1np5TMiz03Xnnl9H5MxfOMYbbLbtSPFJnH3ZziM=;
 b=HzFhPK3EEjH+KQn8CjaY3UqhaWEMBAJn0GYNAyec2HhNhhbS9SATGyWrmJzJihF1Jx+0sZaUnauBdh7o2UaT0zKT0xZ5SIo621ga0S7N08vmlMtYblpY7hQNcTNylcnYleWowyrek2awaPgsdChGEQ6l35KvOvI7EVtykocO6WEMspQ3T/cciT6vQuK1+vzQdRyqv9YX6flCZE2/3Kn/3wbPpQsN2RrT798YgHpqdAuHBz6pBERYYsW4nYY1Wln4HFeE9pLm+RAHwkNYePKViTlUHguL5A1eVm7pHCDwAszHdOMa7tE0qraskFNWAdhpMaT8DC5X0gqKQuBrta98/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by4t1np5TMiz03Xnnl9H5MxfOMYbbLbtSPFJnH3ZziM=;
 b=PcIPviOg+Hj+QHJ2rauSO9Zy2waRjp7ycCcZa3THJoDnEJL3ClTPgA6hYMtOX2eWZyT5iSLoXO7OcDFN9V5h9r5sY0zWYMe0O0SbW0R6ViUy4mj9ZXS42NfiI6PIAfZ3vv6H+BzfJYZKW513sksI6b3r1VWlM63TGkeU/pa4WfE=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by TYPPR03MB9422.apcprd03.prod.outlook.com (2603:1096:405:314::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 1 Sep
 2025 02:37:23 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 02:37:23 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: Re: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
Thread-Topic: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
Thread-Index: AQHb9iF9+0FWJhwIhEyiLOH9aPg8Q7R6RMcAgAOhpQA=
Date: Mon, 1 Sep 2025 02:37:23 +0000
Message-ID: <dbfac6888a2c77c302265df2f90bf4aec8bed686.camel@mediatek.com>
References: <20250716071450.8214-1-irui.wang@mediatek.com>
	 <c751e015c0a9fb2ab6514a45952e01424cfbb0cb.camel@collabora.com>
In-Reply-To: <c751e015c0a9fb2ab6514a45952e01424cfbb0cb.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|TYPPR03MB9422:EE_
x-ms-office365-filtering-correlation-id: 3040a388-465d-421e-b011-08dde9007b28
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OWFoQlRiL3VyUzFXN2swcHlWdnVFZCtScWlMeHk2aUNPYXUxZGVZRVN1d29M?=
 =?utf-8?B?UnczSVhyRmJyREwyWnNDeWZINFZnS0I4UzFsN01TR1UxYVJjWGdCdm94QjJw?=
 =?utf-8?B?b1RHVTVnT09zSlpUaE9sUU9JaGppVCt4dWovKytLMlhycXZPWXFZTllmVmlK?=
 =?utf-8?B?TVFVVmRDZ0gxMisvTC8yVGxsejNFdmpjVXlwSjBjTG9mWnZ6cjNneGFablZG?=
 =?utf-8?B?RTlNV2EwSkFTdE9qeFlsTzdvZVVvd2tVeWhJV1I3ZmIxQXhhTFB6SUg3UWZl?=
 =?utf-8?B?UjlEMVh1MlNUQkFVZGUvL1VMMG9qOFZKY1NiL0NJNFg1K0oydzFiaWI3UXNK?=
 =?utf-8?B?UmJQQW5icUs2QWs4M29LZmpEdDJqVHRoVGppZkI4YksxZVFHa29lTmhtYTB6?=
 =?utf-8?B?QmxiVG5XVUZPZEsxU29UYkpKNEw3QlBMNEt2dE1YbDdaL3UreFVLb0FFeFRK?=
 =?utf-8?B?dFBtdzZBOW9UblBsMk52YWQ4TTNaVi9PZ2VrSXBTdEl1MW50QzRGU016UTZr?=
 =?utf-8?B?eEg3SkR1RFNPTHYxakYrT29YK1l2aFY3NGpUaE8wUDlScGNvVm9aNnVXVGhZ?=
 =?utf-8?B?RC8rTFhRZHhkSXRQaFp3MlFkRFgxQ0wzNE56ZWppdCtEcTNBQmsyLzNlRU5X?=
 =?utf-8?B?VUpXMFBrZlNsRyszVVpPZVExNXRBY0ltVHlMMDh4Tnd6V1psaGNPNUZLdWMw?=
 =?utf-8?B?YTVMZlhxcEJjUjIxbnZtb1BWMmkwWHNFOUE0aktod2Z5Z0RRSXZjLzQyZ0pQ?=
 =?utf-8?B?a0VBdCttZEdYc2VuNDdvbnA0OUhOQnVYZ0wrckFCUVdoZ2ZOTGFZQVY2Z0I3?=
 =?utf-8?B?ZDcvTXhBK1BJMXhGdHgwd3VkZW9veTV1WWU5cllvTXhNVkNwSjMyUk1nUU5S?=
 =?utf-8?B?d3NlbytFWVhOV1FWS3djS29QaWFwVTd1cVJiTVM2dFZFMTlFT3kybURzS2da?=
 =?utf-8?B?eUNEZDN0aXJtRFE0YTRxaDhXTGpNbGozdHAxZENhdmJBdG1DUWx0RVdaL003?=
 =?utf-8?B?bGhMOEx4VUw5aFkySWNBUXV0NXBPc04weGpIOXM0Sm5wNGhMUTB6by9jem9F?=
 =?utf-8?B?YzZ0VGE4YWlseXJvK0hYcmFTQUhZMklYRjF3L2dUcHBNRHNSMTdrc3NtaG5o?=
 =?utf-8?B?RDhhcllyK0FmRTEvK3VjQzhUMSttVnNpTUMzTWRQTHoxL0tNMlorT2s2eEJm?=
 =?utf-8?B?NTg0d3NZSitXK2wvVTBPaGJMd3JBUk5rU2w1SVY5SWFrNFBLdXYxV2ZMdTJy?=
 =?utf-8?B?cXZ0ZmU4WDRraEFQTjluSzRUN1NtOTl5U1NLY095T3JLNi8vaEhMdTNqRW5I?=
 =?utf-8?B?ckJRQ3pBWTd0aHcvQVBpdlUvOTdjTWppOVJYc1d1U0dldE9zYWtJZ1VIZGtL?=
 =?utf-8?B?dFY2S1oxZEIvVVZKSE1VUVJXcHdrVnBNeWErZjdXbWhaL0RMZTFwcW5PYjBH?=
 =?utf-8?B?ckU0YXNwSGE2RVdCN2d2T1l4N1hjcTRPOWZmQi9IVS9lQ1gzYktWZ2M5S25n?=
 =?utf-8?B?bDRtY3VEREhodUppRlFheE5yR0FEYnNZRzYxZWxkdTBsQXErYnpNRzBjTnlr?=
 =?utf-8?B?a004Wmx0YlF0ZlZxYzZwQmR4ZGI4RTFFRnZTZWpJOEh5STVIcVJLVEFyUWoy?=
 =?utf-8?B?eGk1Vmp1UVZLeFcxalJzMHgvTmlvbTZ2MTlJTEEydUZZMlJQZCtjTGs2dm9R?=
 =?utf-8?B?M3lCL1E3WkN5aXFXWkZhUWowdkdqZ21hY0d1Nko0VGljZTkzOHRNcUYwSHhF?=
 =?utf-8?B?Q0ltVmVXZkM2SlA3YnFMQkl4MGVJdXFLclpLV05RcVYwOVFPSVRSc3RFcU1T?=
 =?utf-8?B?V2hkV1BIQXdHMFlyWGxLNDJEMTRDbnBoS09lYmxSYWNaRXZtbVgyQldWM21w?=
 =?utf-8?B?L2E4eVFqbDU4WHM4OU1PbFBLZEJickFJT0tCUW9EL0tUd0JxV21TTVNIL3ZU?=
 =?utf-8?Q?vxiLV78Ulus=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGZiblFPcUdKNGplNmVWcDVWN1U2SWJjNmFSTEtESW9sRGxNS2NIN0pNbGQ3?=
 =?utf-8?B?eEY0elNqQndEQWx0VWdUOEtublZ1R1AxMUtmQ1VBbVN1aitSTWYwSE1HT2hw?=
 =?utf-8?B?M2UweldDRVBIMWI1T01XNCsvM1BWaTMvRnZNY3krcEdvRnZpOXUraWoyMEpY?=
 =?utf-8?B?UTRib0ZjUWI5MTJtLzRZOHFaOWx5M25Bc2RneXc4VTZFa0xaSW1YaFlpTXNW?=
 =?utf-8?B?c000Y2NRcE91Q1FaQ0xOa3EycEYxMTFEZ2VSQ202TW1hRzdnTHM4Z0NqV2oz?=
 =?utf-8?B?b2JNczZldis3WXRONG1wYXlHamhnNjNDRXpwY1pBUVVIZ0VML2JhNG9hRWxo?=
 =?utf-8?B?QlBuNEJ3YVBLditQck5EbzNmOTVoMC96YjQ1Zld1VGdUOWZVU0FKRUM3bGh6?=
 =?utf-8?B?U0JzT2ZZR1AwcUhSRExBL3lGSnZkVTBxMzBnRVE1OGZQMC91UlZVMHpzNUlI?=
 =?utf-8?B?d1dZcnJjWSt0dVZqRFBJeTh4QUJjcVdTeGJhamNnOFpwL0t1bmtFak4yM0RP?=
 =?utf-8?B?aFRKZ2czRFFyTVd1QUxuY1VjWUZqUVU4TUtmWjZSd1ZXMDNJTWlKZE01QlUx?=
 =?utf-8?B?RnhwQjhpOXphWVlxaVpHdmROUlorYktEd2phQkdTZGlGdjBSNFZwd3g0MTU5?=
 =?utf-8?B?czUySkVzRVZpOXJYUkYwd1dLMVlKSVpiREllV1dBR2lhR1FibUVJUlh1eUM5?=
 =?utf-8?B?UHYxRWJiU2JreVYzU0UyK1AvTGNiTkVzK0dmL2ZpcFNEQVFkNEU5cVBDcjhJ?=
 =?utf-8?B?Yi9UcFNaT2lyMTRSOHdYcDZ0R0RYWHlGajRsYVBud2REOEFoSnhYVDRPdFRG?=
 =?utf-8?B?NDFVZkdRYTJSTXZLWEdBbVMrMk9sZ0IrLy9EMmFmU0tSTHBZY0x3NE5kaWxQ?=
 =?utf-8?B?TUJSVlRPY3N3eFRsd3o3elhKQzR4ZWtzSGpEVDFkUGxEOWVBb1gxTnkvRzlT?=
 =?utf-8?B?Z3NXZEtmRlRmZkN6eXBtaXZLeWhJaXR1cyt2NUJLY3JGMm9wV25ZbFFPWWRm?=
 =?utf-8?B?QUh3TFh3Q0ZCT2dieDZ5bHpOK3RDSFhKR2ZOSzBmYUpYNEZUZFFKdmlUSzFB?=
 =?utf-8?B?QWdIUHRNUzRxY25RNFhraUdLVUllM29GNkRyQ2hJeUJqQWg2WGJ2WXB5Vy9G?=
 =?utf-8?B?bXpYb2RMN2NtcVMwd2U0MGRKRXNQZ3JzMXpTKy9MUzN2ZWpCdVBXY0F4M014?=
 =?utf-8?B?ajlzRHZKMVJGOFlndldWRld0b2F4MDdwZW5EMExaZDFPMjE5eWF5SDZqb1lp?=
 =?utf-8?B?TCtnelJKT3N6UHVSeEhLdzByNzN6SHlLdVZwUW4wQWtNcXc4bXBpRTl4MjdX?=
 =?utf-8?B?T3Jsekh5WExSYjFXNVJOMm9kbkk4YXdtdzZjUEpyWjlaVitvSmpUV3JsOStS?=
 =?utf-8?B?OUF2OGhCMmk0ZW1Ba0pWMWNNeEY2ZjdSZmRnaTMwdHVzUHBMZnRWYUlScXB2?=
 =?utf-8?B?eHRpRVpnZkxLZ2Y5SEYwL2dZYUVBbW9kUmJFKzFnYjM0RlBWWkFZdVc4TlM1?=
 =?utf-8?B?aldqWmg3YlB5OERqcHJ1TkYwUEU4WlRZeE42cWpnZlZ4TnhrZ0RoNThxRjZX?=
 =?utf-8?B?cjZYQm9JWEhRbmhRQkdwZ0JsMHdZWk9qS21PRUI4cUVBRzZKeDRocytPcGtl?=
 =?utf-8?B?aE5zUlZEbGZVakVZdVIxeEJVOTVmNHBsWDN3VnRzcURhWFdmaXVyM1dTVFMx?=
 =?utf-8?B?WUhXSFFuaml2alZsbGt0V2FSOVdoaE1IeVJSWlFLdVI5eWpiYmJJV2JsN1cv?=
 =?utf-8?B?Q2RBQXJ4Ynp5ZFhydXRZdGk2bm5OZzdDOUkyRWorUkN3U09rNXhqV1JxMTVZ?=
 =?utf-8?B?eFo0dTNwTDFoT0wyUHZBbkN4RGRGdTlsUi8wYVNyN1NPSERBYTVndEtFdmlp?=
 =?utf-8?B?ZzlVMUxNYzJZY0l2dytkVGhzRjJxazVqK3RTTnVWejRpM3krZzJRK1JxL0FD?=
 =?utf-8?B?MWZ6cUIzTHB1bSsrd21tSnFmUGxZRlFZTzM1eS8wRytZaE1GbHd4L1BncW9P?=
 =?utf-8?B?OEZXY3FlY0hQL29nWDB1SjVUZENxYlhPK01zMjMwUHBady8vOXp3RTVpKzJa?=
 =?utf-8?B?MVFYVmZWSExIOG5KQzZ4aFR4M0RFamRtOE9VbUZHeFg0TUM4OXRVSDYzdERB?=
 =?utf-8?B?WGZsMDhwTTFpUGF6VHhTVnpVMDR2WXFQZHpWQWtCZzNpbHZqTUxxUnFTaldO?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C85CB9B6E6B704ABBD4F0F74A1F3E8E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3040a388-465d-421e-b011-08dde9007b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 02:37:23.1666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pImTqUavmFZJ9zcw8Sv7B/zB7b9PeiZI/xbh2XaUucgI/R40q+f61x5j7tImtx7KDXILlbn/9zXJgEvoSkuVUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9422

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNCk9uIEZyaSwgMjAy
NS0wOC0yOSBhdCAxNToxMCAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gTGUgbWVy
Y3JlZGkgMTYganVpbGxldCAyMDI1IMOgIDE1OjE0ICswODAwLCBJcnVpIFdhbmcgYSDDqWNyaXQg
Og0KPiA+IFVOSU5JVCBjaGVja2VyIGZpbmRzIHNvbWUgaW5zdGFuY2VzIG9mIHZhcmlhYmxlcyB0
aGF0IGFyZSB1c2VkDQo+ID4gd2l0aG91dCBiZWluZyBpbml0aWFsaXplZCwgZm9yIGV4YW1wbGUg
dXNpbmcgdGhlIHVuaW5pdGlhbGl6ZWQNCj4gPiB2YWx1ZSBlbmNfcmVzdWx0LmlzX2tleV9mcm0g
Y2FuIHJlc3VsdCBpbiB1bnByZWRpY3RhYmxlIGJlaGF2aW9yLA0KPiA+IHNvIGluaXRpYWxpemUg
dGhlc2UgdmFyaWFibGVzIGFmdGVyIGRlY2xhcmluZy4NCj4gPiANCj4gPiBGaXhlczogNGU4NTVh
NmVmYTU0ICgiW21lZGlhXSB2Y29kZWM6IG1lZGlhdGVrOiBBZGQgTWVkaWF0ZWsgVjRMMg0KPiA+
IFZpZGVvDQo+ID4gRW5jb2RlciBEcml2ZXIiKQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEly
dWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAg
LSBBZGQgRml4ZXMgdGFnLCB1cGRhdGUgY29tbWl0IG1lc3NhZ2UNCj4gPiAgLSBSZW1vdmUgdW5u
ZWNlc3NhcnkgbWVtc2V0DQo+ID4gIC0gTW92ZSBtZW1zZXQgdG8gYmVmb3JlIHRoZSBmaXJzdCB1
c2FnZQ0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Vu
Y29kZXIvbXRrX3Zjb2RlY19lbmMuYyAgIHwgNA0KPiA+ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQN
Cj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvbXRr
X3Zjb2RlY19lbmMuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29k
ZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuYy5jDQo+ID4gaW5kZXggYTAxZGMyNWE3Njk5Li4zMDY1
ZjNlNjYzMzYgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL210a192Y29kZWNfZW5jLmMNCj4gPiArKysNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19l
bmMuYw0KPiA+IEBAIC04NjUsNyArODY1LDcgQEAgc3RhdGljIHZvaWQgdmIyb3BzX3ZlbmNfYnVm
X3F1ZXVlKHN0cnVjdA0KPiA+IHZiMl9idWZmZXIgKnZiKQ0KPiA+ICBzdGF0aWMgaW50IHZiMm9w
c192ZW5jX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLA0KPiA+IHVuc2lnbmVk
IGludA0KPiA+IGNvdW50KQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgbXRrX3Zjb2RlY19lbmNfY3R4
ICpjdHggPSB2YjJfZ2V0X2Rydl9wcml2KHEpOw0KPiA+IC0Jc3RydWN0IHZlbmNfZW5jX3BhcmFt
IHBhcmFtOw0KPiA+ICsJc3RydWN0IHZlbmNfZW5jX3BhcmFtIHBhcmFtID0geyAwIH07DQo+ID4g
IAlpbnQgcmV0Ow0KPiA+ICAJaW50IGk7DQo+ID4gIA0KPiA+IEBAIC0xMDM2LDYgKzEwMzYsNyBA
QCBzdGF0aWMgaW50IG10a192ZW5jX2VuY29kZV9oZWFkZXIodm9pZCAqcHJpdikNCj4gPiAgCQkJ
ICBjdHgtPmlkLCBkc3RfYnVmLT52YjJfYnVmLmluZGV4LCBic19idWYudmEsDQo+ID4gIAkJCSAg
KHU2NClic19idWYuZG1hX2FkZHIsIGJzX2J1Zi5zaXplKTsNCj4gPiAgDQo+ID4gKwltZW1zZXQo
JmVuY19yZXN1bHQsIDAsIHNpemVvZihlbmNfcmVzdWx0KSk7DQo+IA0KPiBQbGVhc2UsIGFwcGx5
IHJldmlldyBjb21tZW50IHRvIGFsbCBvY2N1cnJlbmNlLCBzbyBzYW1lIGhlcmUuDQo+IA0KPiA+
ICAJcmV0ID0gdmVuY19pZl9lbmNvZGUoY3R4LA0KPiA+ICAJCQlWRU5DX1NUQVJUX09QVF9FTkNP
REVfU0VRVUVOQ0VfSEVBREVSLA0KPiA+ICAJCQlOVUxMLCAmYnNfYnVmLCAmZW5jX3Jlc3VsdCk7
DQo+ID4gQEAgLTExODUsNiArMTE4Niw3IEBAIHN0YXRpYyB2b2lkIG10a192ZW5jX3dvcmtlcihz
dHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgCQkJICAodTY0KWZybV9idWYuZmJf
YWRkclsxXS5kbWFfYWRkciwNCj4gPiBmcm1fYnVmLmZiX2FkZHJbMV0uc2l6ZSwNCj4gPiAgCQkJ
ICAodTY0KWZybV9idWYuZmJfYWRkclsyXS5kbWFfYWRkciwNCj4gPiBmcm1fYnVmLmZiX2FkZHJb
Ml0uc2l6ZSk7DQo+ID4gIA0KPiA+ICsJbWVtc2V0KCZlbmNfcmVzdWx0LCAwLCBzaXplb2YoZW5j
X3Jlc3VsdCkpOw0KPiANCj4gU2FtZSBoZXJlLg0KPiANCj4gPiAgCXJldCA9IHZlbmNfaWZfZW5j
b2RlKGN0eCwgVkVOQ19TVEFSVF9PUFRfRU5DT0RFX0ZSQU1FLA0KPiA+ICAJCQkgICAgICZmcm1f
YnVmLCAmYnNfYnVmLCAmZW5jX3Jlc3VsdCk7DQo+ID4gIA0KPiA+IA0KPiANCj4gDQo+IFdvdWxk
IGJlIG5pY2UgdG8gY29vcmRpbmF0ZSB3aXRoIFFpYW5mZW5nIFJvbmcgPHJvbmdxaWFuZmVuZ0B2
aXZvLmNvbQ0KPiA+IFswXSwgaGUNCj4gcG9ydGVkIHRoZSBlbnRpcmUgZHJpdmVyIHRvIHRoaXMg
aW5pdGlhbGl6YXRpb24gbWV0aG9kLCB3aGljaCBpcw0KPiBjbGVhcmx5IHRoZSB3YXkNCj4gdG8g
Z28uDQo+IA0KPiAtIFBhdGNoIDEgd2lsbCBwb3J0IHRoZSBkcml2ZXIgdG8ge30gc3RhY2sgaW5p
dA0KPiAtIFBhdGNoIDIgd2lsbCBhZGQgbWlzc2luZyBpbml0aWFsaXplcw0KPiANCj4gQ29uc2lz
dGVuY3kgaXMga2V5IGZvciB0aGlzIHR5cGUgb2YgdGhpbmdzIHNpbmNlIGRldmVsb3BlciB1c3Vh
bGx5DQo+IGZvbGxvdyB0aGUNCj4gc3Vycm91bmRpbmcgc3R5bGUuDQoNCkkgaGF2ZSBsZWFybmVk
IFFpYW5mZW5nJ3MgcGF0Y2ggYW5kIGNvbW1lbnRzLiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UNCm1l
YW4gaXMgY2hhbmdlIG15IHBhdGNoIGNvZGluZyBzdHlsZSB0byBRaWFuZmVuZydzLCBtb2RpZnkg
J21lbXNldCcgdG8NCid7fScgZm9yIGluaXRpYWxpemF0aW9uLCBhbmQgYW1lbmQgUWlhbmZlbmcn
cyBwYXRjaCBhcyBwYXRjaC0yLCB0aGVuDQpzZW5kIHRoaXMgdHdvIHBhdGNoZXMgdG9nZXRoZXIu
DQoNCklmIEkgbWlzdW5kZXJzdG9vZCB5b3VyIG9waW5pb24sIHBsZWFzZSBjb3JyZWN0IG1lLCB0
aGFuayB5b3UgdmVyeQ0KbXVjaC4NCg0KQmVzdCBSZWdhcmRzDQo+IA0KPiByZWdhcmRzDQo+IE5p
Y29sYXMNCj4gDQo+IFswXSANCj4gaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVj
dC9saW51eC1tZWRpYS9wYXRjaC8yMDI1MDgwMzEzNTUxNC4xMTg4OTItMS1yb25ncWlhbmZlbmdA
dml2by5jb20vDQo=

