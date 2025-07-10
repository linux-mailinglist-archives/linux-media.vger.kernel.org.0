Return-Path: <linux-media+bounces-37246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DEEAFF9F5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDFCD1C81AE4
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 06:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFAA28727A;
	Thu, 10 Jul 2025 06:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cHQ9cZce";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="s1Ng4tyi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26936206F27;
	Thu, 10 Jul 2025 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752129594; cv=fail; b=T+yzvEC69cTe3SrsIQr6g6iWCJIBt0KhZObBCAjGLWRyrH4pLRopZf/oWo+BewxYd0XRIq/u+gy38pgTnOliDKz4IhMyw9pluEY22haef+p0/po8UTA4hsN7rzi9moLwJl10c0aZQlJbhq0SYVRv9M9vTcMFR1yAHMhFKCwwsGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752129594; c=relaxed/simple;
	bh=NqdoMNE/8v+9/3zgW1UDP1TUT7NqiZ4SX3b/El68XzQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oPV1sSvqxmI2zUzYhPgpJgzZaGviQku/ncdxjeph5NTE5w4eoX7Y6q5DmItOrQ6+7vGB2zKanCzmLurGEiHXUWtn/VNxW5qQ8TyuFs3YPXGurdUvYOZUaPE6w63nSRYdwzply0P4Doym2mO44R2qi9oO+ZPY2XIaAYZxm4YX0Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cHQ9cZce; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=s1Ng4tyi; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ab3e61625d5811f0b33aeb1e7f16c2b6-20250710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NqdoMNE/8v+9/3zgW1UDP1TUT7NqiZ4SX3b/El68XzQ=;
	b=cHQ9cZcev50nJSWxMPkYQfsmRU+vB4WfJysg0I6R1ImDTExCqSQV8eDqXb4vEEl+qezqUWUtgNh92OEX+NXsApTfir2DMnAfIy5zXwItWUEQ3ixDpotjMgH7ctbeWrMZVIperG/Z9uA2IZZK0MgCMzkISdinRT05B1rVcFB0eaA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:81e6e8c9-da65-4595-8ae9-abdb975bbbbc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:9ea70dd8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab3e61625d5811f0b33aeb1e7f16c2b6-20250710
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1145201023; Thu, 10 Jul 2025 14:39:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Jul 2025 14:39:43 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Jul 2025 14:39:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/smPEHLaMlBxcr6UIA26nhA0PCnuvTTtVGXxHdCbhj/wIkWyi8P/UR/1eMhfrOiUGQ7iBVveLRtIOHndntTHb14C8qvhhJe7mx0jXtkQpgapZewlSk5eMsRvfqdYHp0omvb5wbjuxf5rll+rLCWQoQX5oc1HT1ulexy5o7yVG0cgZbZ99V7pqZviYmin3T2qTPOCOFIV103pt5NUPiq5T5IwtFDJFCtc2aW4cy8+zbZbqe/Edb9dD1YX/HEauGQ0CVB7hl8CYHbkG9l6C3VSb06IBVNJ+5F8uzAiOyvtBgy/G2vOMRfOUo0QWjbYsHEvhNFoJ7wLJWox4hSNBzDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqdoMNE/8v+9/3zgW1UDP1TUT7NqiZ4SX3b/El68XzQ=;
 b=d6t9IMcEEgvspRuaBgJ920ueHozij6sTnTnRTX5HPIKnwgmyvNStXhrKiWLfjzEWkbAicyv3WHlfRpN9/UOvrL9lcJ+RZghX6rAjjHQuw3lQVLh2mkpDYB8JMcWCj528kjtcrQ6QeujR/sT5b6cM/E/5y+3xf261gR2ea5whDaWcB+vOF7QW9tyUzMpxMlsQTDaeggHlwBt3cYBY7nqNsvwr/jI0Gpo01lIGcxhJU+7y7ndmGzqOrhWlha/3TDQc4zlHifXikrRsdS4W5ICfQmTdPP+ID7ZGZEU46WT65QH1o9lCMlHwsJJGnhVfKH9ozM5NHs0KJk9FoEHEU1bhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqdoMNE/8v+9/3zgW1UDP1TUT7NqiZ4SX3b/El68XzQ=;
 b=s1Ng4tyiIQ4eSoZjDT1P4SHYm2sjbQAqkHh8S80iOaRtFbCD0o64pVkOGmbcGhBDx8hhbiBgNJUV6QMCwZ7cQhcoliU8yzeOemak0nB3JEvCvZI611MPsTZsSv4nBwVqz4LcygvqEdrJn4lLSndtQr6yNEhrJ1okla0CsYHwZQk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6760.apcprd03.prod.outlook.com (2603:1096:4:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 06:39:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 06:39:41 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
	<Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 05/13] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Topic: [PATCH v2 05/13] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHb7uC2vyFGIvB0q0CFcl1QyuISC7Qq7REA
Date: Thu, 10 Jul 2025 06:39:40 +0000
Message-ID: <9042c7366de45315435ef4bd43ef0c3f58b31b6c.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
	 <20250707013154.4055874-6-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-6-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6760:EE_
x-ms-office365-filtering-correlation-id: a6af90df-dfa4-43fc-d478-08ddbf7c8c81
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|42112799006|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VllOeSszT05mMERBNmlwaGllMndGSTQwM2RFVW9LK0lTc0VjMVgxTFNUSkI4?=
 =?utf-8?B?SG9oNDhIRXQ3bnp4eUdpNVdHOFhEWWJLbmk5OERNOFdXb3F6TmdDVmxkSHZK?=
 =?utf-8?B?NGlhdWlJRXNGYStnYnZKOGowTzRjblU2d3BaM3pOZU9Ob1pGSFpYeUVPdWFw?=
 =?utf-8?B?SStLcjJ5MXJ5bG1NRzFnTlZnSVUyNGJMVGtGK1FtNjVlQ0FBRElYdmlDOXVM?=
 =?utf-8?B?SjB2WDBZaUMzQVcyTjlnS2RyVVEzVmdVNGtGSGVGbFpBeEpIcDNjWnpXQ3po?=
 =?utf-8?B?aDJjRnBEV3FaLzlRN29pY0VxcG9hY0JsQVMyN1lFeFdLOXJuUC8yL0tZWU1q?=
 =?utf-8?B?V3ZNQk8waDcwV1RkYUFwQzY5cDdNeExBZ0Fpd0h1bUUwRlEveUZWMm1semw1?=
 =?utf-8?B?Mk11NDNJMnlCNUx2OGg1WCtlQTZGcHBwYStLd1dSSGVMSU1WQWpRQU1sMnYz?=
 =?utf-8?B?NEtoOHloWUNaRzVEWVhkRGdQQ2c5V1NFZCt1WjNPN2pPYWZrU1hmN3VUVzg2?=
 =?utf-8?B?RHFoMmNZdUZLcUNsN3hMK2JvaUF4UlJxS2tFRUhRRkhSYk13cVdHMUl2Sm5K?=
 =?utf-8?B?Vnk1bkVSTEpnRGtjZjVMVDV3WlRab3A2UGQ0VDQybjJxeG9xZmxpaW1MdTYz?=
 =?utf-8?B?WDFnanRCc2pkOW9QcEw2MlNod0h2bVdsMW1Ub2xDdXVDTkVuVlM3STJTS0pm?=
 =?utf-8?B?NVJzZkNaRjJwTUVNYkord1BqWTE3VWl1eEVZVC93ODg0MnZYbTNub1Q0U1g1?=
 =?utf-8?B?OVI4U0ZLVlBIZU9ZTmhBTk5IWkhEcDZFaFZaQ2tNZjdwcXh6RTZaUERYZ1l4?=
 =?utf-8?B?WkpFZ1IrcjhwYTBhTjM4bUFGcG9kWVJhU0ZTV3VkN0tTYzFwemt1M3NPSHA0?=
 =?utf-8?B?OFc0a2FyeVV1RnhRY1RhVkdlOU1lMlp3Wi9iMTJFSmVPVjNjOHdxR3h0ZmNY?=
 =?utf-8?B?VFR0bEY1cnJMMWZEeVlqRDYwRXRVUkkrSVhYNnJlNlpEdE1BakhOS0EvQUZp?=
 =?utf-8?B?ZTc3Qm1naGpVT2RkeXNSSkJwVDNjNXZwbGRFVTBwUFRkMTdxcnpVeEpFVzJR?=
 =?utf-8?B?d3gzNXhPenZaMVdWK1dlZ0JnNFNtZk85bE1HbzdUekhrUHIxSG9lbDNiakRS?=
 =?utf-8?B?cWhrYlFvZHQ3RkJpV1VoU1QvNUxMU1V3ZjVDTWlEYXh2YTRnUUZoL0tZQkxW?=
 =?utf-8?B?TlFQa0c4amw1RmJTb1pOaHFXMlpqUE54cTB3TXpPcjR4dWhPK2JBRU14UVQz?=
 =?utf-8?B?YmM4NUxobitVK1gyV2wxcllRbnVZcnF3Qnpjdjh0M24yRDF2VGdYblhSWm5t?=
 =?utf-8?B?K29HeGkvUmpOSnVnRkl0cVJnNkVaUWI4UTd1dkpRTFZkUldpcGlzRjNSY3JN?=
 =?utf-8?B?VXk1MDFnUW9wR0QvaXllVHpXZVUyV0hiazFKM3dieTVRZ0Vwam5JT29jU1BB?=
 =?utf-8?B?VFdpNTZDMWZSZHpVa1BWMVpJeVZsTVFYTzBMUmdiSEtqampwSVpiN1RiUHds?=
 =?utf-8?B?NEpxS1dIcU9NZWxVYjlmZVhjU0VmNkY0djlFL1RGRjNvdmxOSElFZGRnU0pN?=
 =?utf-8?B?NEVSR0tBamlzL1NmdHNUSmRGWTNkWFlMVkFkcjRkSlIwWFBneGdsb2tvTWdo?=
 =?utf-8?B?MDF4UmNYQzl5S2o4UUtxcUpURlFqQ0E0eHpXK2NpMWVwbjRjalYwZUtoNnJO?=
 =?utf-8?B?TDBPcTV2U3RLUUZ3c1ZsVkd6Tng5ODB5N2EzUUY0eGdzaDlDK3lNNkRZcFFu?=
 =?utf-8?B?aU5PdjdEV3YxMzJNK2EwdEVhTWxBQ0c0TS9iMXBLZUt2blJ2UnM3WXlMQm9J?=
 =?utf-8?B?YUZqK21ObEd3Z3pPUmQvYzRkVjErUDRJQUhoZHZIdnJwUlhLcHdPS05selJ4?=
 =?utf-8?B?M3NMZmJOSlJ2ZmFoZXZWcFQ0K3Jud1M2MVB6elBlaGd1aE9jdFhlNmk1cjhT?=
 =?utf-8?B?ZkVsNnB3OEpaMS9NTmpCNHF3Q1REUk5URG9ydmdaL0hYUzlrOVBwakxkWERS?=
 =?utf-8?B?WGEwRmYzZHlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2JubkZkT2lMT0hOUVRkRVZYWjI2NlRrRVA3Z2JTT0VJTVFVeis2NkF0bDF3?=
 =?utf-8?B?UjJZN3BxSEVVWHd4dXJBTDk3UW1Lb0E0TS9vYVcyZEFXNUFVVjFDR2x5TWpI?=
 =?utf-8?B?ZncyTTBpUGxDaHBMUkpKUzZCSElNK2RIbTBwdkg5ZDN5Y3BZc0h5b0t3bDZI?=
 =?utf-8?B?blRXTmdPazV1WFBCd280ZkhPTlVDQlltdlNlYTVNTW1keU9GeEs5SURtdTdo?=
 =?utf-8?B?R1hmRUF4WkhkLzN4WjcwTlcyak9PR0Z3RFU1T1NQT2pGZ01MSzJWbFB6YzRa?=
 =?utf-8?B?UXBYR0NMdnYxdWd5RE1HYXNjVnhXYWRqdzlPUnFrOVJsZnhqNWxWdVltNmwv?=
 =?utf-8?B?djlPcjZiRFhmekQyZE05SE1SdFd6KzdWYTR5dXVvdi9LUFplQy8yM3JpMFQ0?=
 =?utf-8?B?WFBNYVQ5VXhpVU83enJtaG5PZW9HcWxkSEk3RE9kMlRYbG9pTi8yZldHVVlz?=
 =?utf-8?B?RUZZUTV4K08wMkZnM2FSWXVqWkJhbFE2SWFZSlAvZlZ6akg0Y0E0ZVIxS2dN?=
 =?utf-8?B?N25WK0dHeHdLQmw4MFlPaWo4cVZFWlNTWUs3dTRjNGM5ejk4L0M2cmkwV3ZU?=
 =?utf-8?B?ZmlOdzl2QjJNUVRLaVNQd1F4dmZiVkp5TmsvekxDRjFlOU9zWlkwRmE1WFNw?=
 =?utf-8?B?NGtwTzVQNDgvVWVhK1BPeEtHZU1qUFp0ZyszWnNaOFhhcW9Xanoydm9iYTRP?=
 =?utf-8?B?Q2NjNFp1VXJ4TlJ3N1dabFhyZ0Z4K1FyYXlCcEYzSmo1WFFLWHlINnExRi9R?=
 =?utf-8?B?TnFuRlB4NVhKQVNzRy8zK1dwVm0wTE1nclUyaEQ1cnd4UzNuczc2SmZqMC9y?=
 =?utf-8?B?Yjd5Tis2cGo1NGRnc1JuSk9XL0tkb0RLRkRZU3lNcTVQU2ZyM2JTaTFaMFEx?=
 =?utf-8?B?ZkxkTnpuU25wd3BQYXIxOUNQNXJnL2lzcHR3YWRjV1hEUjFSdE5VZFZmNlA4?=
 =?utf-8?B?QzhUS0VVVi9iMEVlbHlIeTZXbVdHekRlb2hGa0g1SUg0MjM1a3Fkdmk4dWo3?=
 =?utf-8?B?MGRUZUFmaUdBMlhuTVA5dTJsb2hXZVhXMGZib09vVjZ3Wm5GdEtGTVZmeEdB?=
 =?utf-8?B?aTRlaEVyU0R1blkwdFpYRkZjZ01MWmxYazdtNndub0tRMjA1eXZRSmtDcnp1?=
 =?utf-8?B?N0YycWxGY2JtZG5jN2FYOVR2c1pmZ3V3ODd4TjlJNndaN09Ubnk4SXFSZ1Av?=
 =?utf-8?B?WUpkV2FMcXBFK3M5aWNvbzhGWHhMTXRkNEhxS1RMcXI5SmtpSFlxL054bUFs?=
 =?utf-8?B?SGFlZnhjcER1U1d1eG9TeXFoYWRjQ1crYld1cmpmdCtrd1h3eDdIZkVIZVc3?=
 =?utf-8?B?SHRBdzBtdnM0MkVnaE1LMTJiK0ZWaTd5U2k1dEc5enRLNzBpNUpWazRFTXdE?=
 =?utf-8?B?Mm16RXhJeUtLalY2WTNYQmp2RW5GczdFNWVuVzgvd0twaUZmc3BibE1jTDg1?=
 =?utf-8?B?YXMwbWp6VDBIOG5EMjVFVnNtYUg4MjBrc0gzTExxVGp0WXAzMWNPODY4c2Vr?=
 =?utf-8?B?bDNyMVg2VHpQWkdOUnJYNllFSXRoMTROK2c3ZDhEb0YrRE9WdUVjT2dlcXk2?=
 =?utf-8?B?andYckxUREUwa0VBVUF6OWVBTkw5b0RXdXJlMnhuYVJIeFh5YW10L0ZkeTZX?=
 =?utf-8?B?MkllQjNzcEdLc0pZVzNiQy9lYnNtZ3JHWVRxNE1tTE5IUk9QMmt6QklYb3FY?=
 =?utf-8?B?NmJQYXVoU2V2TnNMdDlzRnU3RHY1bmVxR0JPYVUzUHFDb2hwMFIvbGNDWTBM?=
 =?utf-8?B?MWRLbkxCZlhFa3doYjVHWkEveEZ3cmFlNjY1SnlIK0dhSllQYXlRNHhhNk04?=
 =?utf-8?B?VmFKLzFPeEJpWmR4ajJHSFdpVVYzeVlYaVg2QkhEaDJXZUlCbVVRdUhBYWZZ?=
 =?utf-8?B?dHlKL0ZDVHdGbW1qUjJHMUxjem04VnNqNVVtcW5USEFkcENIZ3N0WWZ6VWgv?=
 =?utf-8?B?ZENzTjJZRDFQOE1VbDFOYmx5UFNGaFFjYXh4R0YxY2tjeXZzaG4xYlJGeGRD?=
 =?utf-8?B?YzJRczNhSFBNSHRGRDdLY0tjVlVmOTN3SnhMZ1pTUUEvR3Bra0E0ZHI1T2Iz?=
 =?utf-8?B?a1BzWUVueW9LRGIvNjVaWDVIODJLcXJiYXJMZFpUK3E5ajJlQlE3SlNjRXN4?=
 =?utf-8?Q?oF1tJm/VGVcEaK+r8g1vBct6P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D13498253B1B764EAE87B39F22757752@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6af90df-dfa4-43fc-d478-08ddbf7c8c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 06:39:41.0256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghBQXYdMb9xNvIxEoOL4ODvDXd+3MxSmWLZvr0HkehQUsf9TTteTRJUtxvWZn3fto88bXd3YcU/o+u4f8o8o2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6760

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
SW50cm9kdWNlIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBzZW5zb3IgaW50ZXJmYWNlIChzZW5p
bmYpIGluIHRoZSBTb0MgY2FtZXJhDQo+IHN1YnN5c3RlbSwgZm9jdXNpbmcgb24gQ1NJIGFuZCBz
dHJlYW0gY29udHJvbC4gVGhlIGRyaXZlciBtYW5hZ2VzIHBhcmFtZXRlcg0KPiBjb250cm9sLCBt
ZXRlcmluZywgc3RhdHVzIHRyYWNraW5nLCBhbmQgaW50ZXJydXB0IGhhbmRsaW5nIGZvciB0aGUg
Y2FtZXJhIHNlbnNvcg0KPiBpbnRlcmZhY2UgaGFyZHdhcmUuIEl0IGludGVncmF0ZXMgd2l0aCB0
aGUgTWVkaWFUZWsgSVNQIENBTVNZUywgYnJpZGdpbmcgY2FtZXJhDQo+IHNlbnNvcnMgYW5kIHRo
ZSBJU1Agc3lzdGVtLCBhbmQgcHJvdmlkZXMgVjRMMiBmcmFtZXdvcmsgc3VwcG9ydCBmb3IgZHlu
YW1pYw0KPiBzdHJlYW0gY29uZmlndXJhdGlvbiBhbmQgdmlydHVhbCBjaGFubmVsIG1hbmFnZW1l
bnQuDQo+IA0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF83eC9jYW1zeXMvbXRrX2NzaV9waHlfMl8wL210a19j
YW0tc2VuaW5mLWh3X3BoeV8yXzAuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
aXNwL2lzcF83eC9jYW1zeXMvbXRrX2NzaV9waHlfMl8wL210a19jYW0tc2VuaW5mLWh3X3BoeV8y
XzAuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDc1NQ0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmEzYzky
NmNjM2NlZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvaXNwL2lzcF83eC9jYW1zeXMvbXRrX2NzaV9waHlfMl8wL210a19jYW0tc2VuaW5m
LWh3X3BoeV8yXzAuYw0KPiBAQCAtMCwwICsxLDE5MzIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsvLyBDb3B5cmlnaHQgKGMpIDIwMjIgTWVkaWFUZWsgSW5j
Lg0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
ZGVsYXkuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L2JpdG9wcy5oPg0KPiArDQo+ICsjaW5jbHVkZSAiLi4vbXRrX2NhbS1zZW5pbmYuaCINCj4g
KyNpbmNsdWRlICIuLi9tdGtfY2FtLXNlbmluZi1ody5oIg0KPiArI2luY2x1ZGUgIi4uL210a19j
YW0tc2VuaW5mLXJlZ3MuaCINCj4gKyNpbmNsdWRlICJtdGtfY2FtLXNlbmluZi10b3AtY3RybC5o
Ig0KPiArI2luY2x1ZGUgIm10a19jYW0tc2VuaW5mLXNlbmluZjEtbXV4LmgiDQo+ICsjaW5jbHVk
ZSAibXRrX2NhbS1zZW5pbmYtc2VuaW5mMS5oIg0KPiArI2luY2x1ZGUgIm10a19jYW0tc2VuaW5m
LXNlbmluZjEtY3NpMi5oIg0KPiArI2luY2x1ZGUgIm10a19jYW0tc2VuaW5mLXRnMS5oIg0KPiAr
I2luY2x1ZGUgIm10a19jYW0tc2VuaW5mLWNhbW11eC5oIg0KPiArI2luY2x1ZGUgIm10a19jYW0t
c2VuaW5mLW1pcGktcngtYW5hLWNkcGh5LWNzaTBhLmgiDQo+ICsjaW5jbHVkZSAibXRrX2NhbS1z
ZW5pbmYtY3NpMC1jcGh5LmgiDQo+ICsjaW5jbHVkZSAibXRrX2NhbS1zZW5pbmYtY3NpMC1kcGh5
LmgiDQo+ICsjaW5jbHVkZSAiLi4va2RfaW1nc2Vuc29yX2RlZmluZV92NGwyLmgiDQo+ICsNCj4g
K3N0YXRpYyBzdHJ1Y3QgbXRrX2NhbV9zZW5pbmZfY2ZnIF9zZW5pbmZfY2ZnID0gew0KPiArCS5t
dXhfbnVtID0gOCwNCj4gKwkuc2VuaW5mX251bSA9IDQsDQo+ICsJLmNhbV9tdXhfbnVtID0gMTEs
DQo+ICsJLnByZWZfbXV4X251bSA9IDExLA0KPiArfTsNCj4gKw0KPiArc3RydWN0IG10a19jYW1f
c2VuaW5mX2NmZyAqZ19zZW5pbmZfY2ZnID0gJl9zZW5pbmZfY2ZnOw0KPiArDQo+ICtzdGF0aWMg
aW5saW5lIHUzMiBnZXRfcG9ydF9udW0oaW50IHBvcnQpDQo+ICt7DQo+ICsgICAgaWYgKHBvcnQg
Pj0gQ1NJX1BPUlRfMEEpDQo+ICsgICAgICAgIHJldHVybiBGSUVMRF9HRVQoQ1NJX1BPUlRfQV9N
QVNLLCBwb3J0IC0gQ1NJX1BPUlRfMEEpOw0KPiArICAgIGVsc2UNCj4gKyAgICAgICAgcmV0dXJu
IHBvcnQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBtdGtfY2FtX3NlbmluZl9z
ZXRfZGlfY2hfY3RybCh2b2lkIF9faW9tZW0gKnBzZW5pbmYsDQo+ICsJCQkJCQkgdW5zaWduZWQg
aW50IHN0cmVhbV9pZCwNCj4gKwkJCQkJCSBzdHJ1Y3Qgc2VuaW5mX3ZjICp2YykNCj4gK3sNCj4g
KwlpZiAoc3RyZWFtX2lkID4gU0VOSU5GX01BWF9TVFJFQU0pDQo+ICsJCXJldHVybjsNCj4gKw0K
PiArCVNFTklORl9CSVRTKHBzZW5pbmYsIFNFTklORl9DU0kyX1MwX0RJX0NUUkwgKyAoc3RyZWFt
X2lkIDw8IDB4MiksDQo+ICsJCSAgICBSR19DU0kyX0RUX1NFTCwgdmMtPmR0KTsNCj4gKwlTRU5J
TkZfQklUUyhwc2VuaW5mLCBTRU5JTkZfQ1NJMl9TMF9ESV9DVFJMICsgKHN0cmVhbV9pZCA8PCAw
eDIpLA0KPiArCQkgICAgUkdfQ1NJMl9WQ19TRUwsIDApOw0KPiArCVNFTklORl9CSVRTKHBzZW5p
bmYsIFNFTklORl9DU0kyX1MwX0RJX0NUUkwgKyAoc3RyZWFtX2lkIDw8IDB4MiksDQo+ICsJCSAg
ICBSR19DU0kyX0RUX0lOVEVSTEVBVkVfTU9ERSwgMSk7DQo+ICsJU0VOSU5GX0JJVFMocHNlbmlu
ZiwgU0VOSU5GX0NTSTJfUzBfRElfQ1RSTCArIChzdHJlYW1faWQgPDwgMHgyKSwNCj4gKwkJICAg
IFJHX0NTSTJfVkNfSU5URVJMRUFWRV9FTiwgMSk7DQo+ICsNCj4gKwlzd2l0Y2ggKHN0cmVhbV9p
ZCkgew0KPiArCWNhc2UgMDoNCj4gKwkJU0VOSU5GX0JJVFMocHNlbmluZiwgU0VOSU5GX0NTSTJf
Q0gwX0NUUkwsDQo+ICsJCQkgICAgUkdfQ1NJMl9TMF9HUlBfRU4sIDEpOw0KPiArCQlicmVhazsN
Cj4gKwljYXNlIDE6DQo+ICsJCVNFTklORl9CSVRTKHBzZW5pbmYsIFNFTklORl9DU0kyX0NIMF9D
VFJMLA0KPiArCQkJICAgIFJHX0NTSTJfUzFfR1JQX0VOLCAxKTsNCj4gKwkJYnJlYWs7DQo+ICsJ
Y2FzZSAyOg0KPiArCQlTRU5JTkZfQklUUyhwc2VuaW5mLCBTRU5JTkZfQ1NJMl9DSDBfQ1RSTCwN
Cj4gKwkJCSAgICBSR19DU0kyX1MyX0dSUF9FTiwgMSk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2Ug
MzoNCj4gKwkJU0VOSU5GX0JJVFMocHNlbmluZiwgU0VOSU5GX0NTSTJfQ0gwX0NUUkwsDQo+ICsJ
CQkgICAgUkdfQ1NJMl9TM19HUlBfRU4sIDEpOw0KPiArCQlicmVhazsNCj4gKwljYXNlIDQ6DQo+
ICsJCVNFTklORl9CSVRTKHBzZW5pbmYsIFNFTklORl9DU0kyX0NIMF9DVFJMLA0KPiArCQkJICAg
IFJHX0NTSTJfUzRfR1JQX0VOLCAxKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSA1Og0KPiArCQlT
RU5JTkZfQklUUyhwc2VuaW5mLCBTRU5JTkZfQ1NJMl9DSDBfQ1RSTCwNCj4gKwkJCSAgICBSR19D
U0kyX1M1X0dSUF9FTiwgMSk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgNjoNCj4gKwkJU0VOSU5G
X0JJVFMocHNlbmluZiwgU0VOSU5GX0NTSTJfQ0gwX0NUUkwsDQo+ICsJCQkgICAgUkdfQ1NJMl9T
Nl9HUlBfRU4sIDEpOw0KPiArCQlicmVhazsNCj4gKwljYXNlIDc6DQo+ICsJCVNFTklORl9CSVRT
KHBzZW5pbmYsIFNFTklORl9DU0kyX0NIMF9DVFJMLA0KPiArCQkJICAgIFJHX0NTSTJfUzdfR1JQ
X0VOLCAxKTsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJcmV0dXJuOw0KPiArCX0N
Cg0KI2RlZmluZSBSR19DU0kyX1NYX0dSUF9FTih4KQlCSVQoeCArIDgpDQoNCmFuZCB0aGlzIHN3
aXRjaCBjYXNlIGNvdWxkIGJlIHJlZHVjZWQgYXMNCg0KCVNFTklORl9CSVRTKHBzZW5pbmYsIFNF
TklORl9DU0kyX0NIMF9DVFJMLA0KCQkgICAgUkdfQ1NJMl9TWF9HUlBfRU4oc3RyZWFtX2lkKSwg
MSk7DQoNCg0KPiArfQ0KPiArDQoNCltzbmlwXQ0KDQo+ICsNCj4gK2ludCBtdGtfY2FtX3Nlbmlu
Zl9zZXRfdG9wX211eF9jdHJsKHN0cnVjdCBzZW5pbmZfY3R4ICpjdHgsIGludCBtdXhfaWR4LA0K
PiArCQkJCSAgICBpbnQgc2VuaW5mX3NyYykNCj4gK3sNCj4gKwl2b2lkIF9faW9tZW0gKnNlbmlu
ZiA9IGN0eC0+cmVnX2lmX3RvcDsNCj4gKw0KPiArCXN3aXRjaCAobXV4X2lkeCkgew0KPiArCWNh
c2UgU0VOSU5GX01VWDE6DQo+ICsJCVNFTklORl9CSVRTKHNlbmluZiwgU0VOSU5GX1RPUF9NVVhf
Q1RSTF8wLA0KPiArCQkJICAgIFJHX1NFTklORl9NVVgxX1NSQ19TRUwsIHNlbmluZl9zcmMpOw0K
PiArCQlicmVhazsNCj4gKwljYXNlIFNFTklORl9NVVgyOg0KPiArCQlTRU5JTkZfQklUUyhzZW5p
bmYsIFNFTklORl9UT1BfTVVYX0NUUkxfMCwNCj4gKwkJCSAgICBSR19TRU5JTkZfTVVYMl9TUkNf
U0VMLCBzZW5pbmZfc3JjKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBTRU5JTkZfTVVYMzoNCj4g
KwkJU0VOSU5GX0JJVFMoc2VuaW5mLCBTRU5JTkZfVE9QX01VWF9DVFJMXzAsDQo+ICsJCQkgICAg
UkdfU0VOSU5GX01VWDNfU1JDX1NFTCwgc2VuaW5mX3NyYyk7DQo+ICsJCWJyZWFrOw0KPiArCWNh
c2UgU0VOSU5GX01VWDQ6DQo+ICsJCVNFTklORl9CSVRTKHNlbmluZiwgU0VOSU5GX1RPUF9NVVhf
Q1RSTF8wLA0KPiArCQkJICAgIFJHX1NFTklORl9NVVg0X1NSQ19TRUwsIHNlbmluZl9zcmMpOw0K
PiArCQlicmVhazsNCj4gKwljYXNlIFNFTklORl9NVVg1Og0KPiArCQlTRU5JTkZfQklUUyhzZW5p
bmYsIFNFTklORl9UT1BfTVVYX0NUUkxfMSwNCj4gKwkJCSAgICBSR19TRU5JTkZfTVVYNV9TUkNf
U0VMLCBzZW5pbmZfc3JjKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBTRU5JTkZfTVVYNjoNCj4g
KwkJU0VOSU5GX0JJVFMoc2VuaW5mLCBTRU5JTkZfVE9QX01VWF9DVFJMXzEsDQo+ICsJCQkgICAg
UkdfU0VOSU5GX01VWDZfU1JDX1NFTCwgc2VuaW5mX3NyYyk7DQo+ICsJCWJyZWFrOw0KPiArCWNh
c2UgU0VOSU5GX01VWDc6DQo+ICsJCVNFTklORl9CSVRTKHNlbmluZiwgU0VOSU5GX1RPUF9NVVhf
Q1RSTF8xLA0KPiArCQkJICAgIFJHX1NFTklORl9NVVg3X1NSQ19TRUwsIHNlbmluZl9zcmMpOw0K
PiArCQlicmVhazsNCj4gKwljYXNlIFNFTklORl9NVVg4Og0KPiArCQlTRU5JTkZfQklUUyhzZW5p
bmYsIFNFTklORl9UT1BfTVVYX0NUUkxfMSwNCj4gKwkJCSAgICBSR19TRU5JTkZfTVVYOF9TUkNf
U0VMLCBzZW5pbmZfc3JjKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBTRU5JTkZfTVVYOToNCj4g
KwkJU0VOSU5GX0JJVFMoc2VuaW5mLCBTRU5JTkZfVE9QX01VWF9DVFJMXzIsDQo+ICsJCQkgICAg
UkdfU0VOSU5GX01VWDlfU1JDX1NFTCwgc2VuaW5mX3NyYyk7DQo+ICsJCWJyZWFrOw0KPiArCWNh
c2UgU0VOSU5GX01VWDEwOg0KPiArCQlTRU5JTkZfQklUUyhzZW5pbmYsIFNFTklORl9UT1BfTVVY
X0NUUkxfMiwNCj4gKwkJCSAgICBSR19TRU5JTkZfTVVYMTBfU1JDX1NFTCwgc2VuaW5mX3NyYyk7
DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgU0VOSU5GX01VWDExOg0KPiArCQlTRU5JTkZfQklUUyhz
ZW5pbmYsIFNFTklORl9UT1BfTVVYX0NUUkxfMiwNCj4gKwkJCSAgICBSR19TRU5JTkZfTVVYMTFf
U1JDX1NFTCwgc2VuaW5mX3NyYyk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgU0VOSU5GX01VWDEy
Og0KPiArCQlTRU5JTkZfQklUUyhzZW5pbmYsIFNFTklORl9UT1BfTVVYX0NUUkxfMiwNCj4gKwkJ
CSAgICBSR19TRU5JTkZfTVVYMTJfU1JDX1NFTCwgc2VuaW5mX3NyYyk7DQo+ICsJCWJyZWFrOw0K
PiArCWNhc2UgU0VOSU5GX01VWDEzOg0KPiArCQlTRU5JTkZfQklUUyhzZW5pbmYsIFNFTklORl9U
T1BfTVVYX0NUUkxfMywNCj4gKwkJCSAgICBSR19TRU5JTkZfTVVYMTNfU1JDX1NFTCwgc2VuaW5m
X3NyYyk7DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWRldl9kYmcoY3R4LT5kZXYs
ICJpbnZhbGlkIG11eF9pZHggJWRcbiIsIG11eF9pZHgpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKwl9DQo+ICsNCg0KI2RlZmluZSBTRU5JTkZfVE9QX01VWF9DVFJMKHgpCQkoMHgxMCArIDQg
KiB4KQ0KI2RlZmluZSBSR19TRU5JTkZfTVVYX1NSQ19TRUwoeCkJR0VOTUFTSygoeCAlIDQpICog
NCArIDMsICh4ICUgNCkgKiA0KQ0KDQpBbmQgdGhpcyBzd2l0Y2ggY2FzZSBjb3VsZCBiZSByZWR1
Y2VkIGFzDQoNCglTRU5JTkZfQklUUyhzZW5pbmYsIFNFTklORl9UT1BfTVVYX0NUUkwobXV4X2lk
eCAvIDQpLA0KCQkgICAgUkdfU0VOSU5GX01VWF9TUkNfU0VMKG11eF9pZHgpLCBzZW5pbmZfc3Jj
KTsNCg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQoNCg==

