Return-Path: <linux-media+bounces-31148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12363A9EA5A
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 951517A1F84
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CF119F120;
	Mon, 28 Apr 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q50TQ1KD";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vtCE/wrD"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915A8254B1B;
	Mon, 28 Apr 2025 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827843; cv=fail; b=SxJVUHDeYg24oeqSwkzg3yhJmO3kgd5mjLOYp2gF+1Klrhd1hBo94aKbBmYR77735QtB3+jP3nv+9RYv2j5r8cwLpZ9kJJLDMsB4BwQtX45Uc/4RGJncpM6c1vkh3aaZrag/enbfBnPdoIkr7PvGjiDCkOyMJpKnT9KNd/ByXow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827843; c=relaxed/simple;
	bh=O2nGNphA6t8eZ/w9yiLFptxzKF+dkxpn7SOrlXZP+RU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pHXF88rmUIqPaPdFse3stqgoSeglhlmqf5zw9gOs8EJa/ScOF/lF3J5jlYyU2n88+vzCw/ThMp0uHDvi8fCFUADy/tSD8UUeKDlTDx2adPLG6XlZCjH/oAebZ2s1DF2Arq5m6M8dvSfbVoZBo+I1a4oHC2it+uUYu3n50ezTq3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=q50TQ1KD; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vtCE/wrD; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 424df96c240811f0980a8d1746092496-20250428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=O2nGNphA6t8eZ/w9yiLFptxzKF+dkxpn7SOrlXZP+RU=;
	b=q50TQ1KDTyn/gdJO3DO/tqJ5fPsNVsaO7trfFy7Ap6EdOwmLG0+TfEzb9KXA6yKqknodb6ZULLTQNyuAypFtRi9/SQquAjeAJ+jsCFZvwYohWIjjst4/XEfmG5IFdgoOAipdydADGI3LFvl3MPgtFNE9nHQSAGOIhgDSNcqS5DQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b145101c-875a-4a5b-9291-b7181f05023d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:3896e076-5fec-4b3e-b8cb-933843551e81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 424df96c240811f0980a8d1746092496-20250428
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 762141149; Mon, 28 Apr 2025 16:10:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 28 Apr 2025 16:10:32 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 28 Apr 2025 16:10:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoZ2yZnAEmmTtnBLhEM8IzGoZC5k4dy6uLCQGopw/iamCxCFE2IARgI5AbuZgTBX0BdHoLiTSWYovYFrQ6KoKJRqKWsGqSPs5lp8QlWtYjDRF/waRqLnq4iSIcsc192ogdNeGoJ+rtT9FpUpKnTSVMrv25w3hE8ZYx3J1uVgmF8lkaMgE7K4QRSLH784ak4vmwiOCr+Pfq8dTOVLUtayzd4yrH4eD9zkdUsRaoN94QHM6hcZz+2i3xHe8AcT55+1y2QZgjQ3QvqNDwik4m8fOrZNOZfhjSJmjm71yiQOEsQWFadSTnxSVOHpSiOqvw1cjccrIG13dRYYg6r3KgzVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2nGNphA6t8eZ/w9yiLFptxzKF+dkxpn7SOrlXZP+RU=;
 b=L6G86Go/qBIedpmbhcu5NE69NAItb4Rt3kW7ByDVO3IStv7463Vq2hfmxgnqfStm6qQPp5KDgGVZu/2bQt65K2Vp+FbAvvaggFqK8S/SjC5nOzyKf42P1mPfEvlKgD4MY4NoEoWCoLBW7jA9QqkhFqYQR8cb8RSEdhKdK6TnWByvp5hs1cOLh83dWJvX8f7yE7G+SmQXHIqxZriQ7tiPfcu4v0yHKc8NpQJ9T7OmALPc4DdODQZvFgcYoSbNSEepzJvOdCqtMoF3FQWAuqfak9cufZ9aEQCCnOIDLYWzT5ENF6enMQkKydp102POEJv3+av4J/tnUF/TVJkAY+Lb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2nGNphA6t8eZ/w9yiLFptxzKF+dkxpn7SOrlXZP+RU=;
 b=vtCE/wrDeyXSdrZS8+pApoRzMrP78PqrAWYuWY74ouHPUnlwm+/xSUptcuhkOmzzVWt0TEi94X5ejuyfwo2iJKAqjS+BxycaC/MhaNBUDHpgvbCZAOtqVQOSD3r3x2Nc/AIbOZg555tjoIhtazela4NfpSOBUn7Y8leiZZ0MxCw=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by JH0PR03MB8349.apcprd03.prod.outlook.com (2603:1096:990:4a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 08:10:29 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:10:28 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Topic: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
Thread-Index: AQHbtb+JBOkotc7Vbkyf4sKVgb4bPbO4qyuAgAATVYA=
Date: Mon, 28 Apr 2025 08:10:28 +0000
Message-ID: <5735ebabb8b049bd7c8700a433bf5b073dde66ad.camel@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
	 <20250428-inescapable-smiling-oriole-bfbe3e@kuoka>
In-Reply-To: <20250428-inescapable-smiling-oriole-bfbe3e@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|JH0PR03MB8349:EE_
x-ms-office365-filtering-correlation-id: 336dbe17-0e19-4aa2-2552-08dd862c2331
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YlUyOVNYVEliMHFBOWFPakpHdTB3dU5vcGY2QzkydGMweEJNUGtUNi84aThS?=
 =?utf-8?B?SjBLN21ySi9KNDkzWVBjVFdyT1RIZ2oyOU43YmZseFRTZEcybndPRFdiVzlm?=
 =?utf-8?B?ODJqSWZjS0tIYmhCdFBLaGFFS0hkK2VYN09hcDUzdERrenlzYnZMSEtZVG9V?=
 =?utf-8?B?YkNjdVN1czZTUGszZU9WclVaWjhBcHRvaVdtWUJPQTVaRWZyTHVmeVdESEF2?=
 =?utf-8?B?MlhYa3dDSWhsZFVCcUZUVHdWenY0UmdFcUk1dm1YRnpHWXM3czk1Y09ybE90?=
 =?utf-8?B?K2hFNnRvUFBaNE5HSDZqWGllTjd4Yjh2VVRyalZMSThLT3B2d0lTMCsxQzhq?=
 =?utf-8?B?M2pPU2dOb1lXQ3VkeDZtY1U4eVlKc2ViNWVPWEsxUXRXY2RnT2hIK25Fb2Yz?=
 =?utf-8?B?dzAxY3hiaVkrRTJzZnFEMld5dU1pQVRnaFBRM01IaFNjOTIzQU5wUWhnUmJh?=
 =?utf-8?B?RWUyTWJQNU40RmdDMk02T3RWd2Q4SGcycWpMWVByWVprY2VWTVVoYWlOQWo5?=
 =?utf-8?B?QmxFLzgrbnRTWk16VkhnakZsSnVUaHpMck00NG12VWdIZkJKaVBKbUl4UlA3?=
 =?utf-8?B?U1hXVDNqcGxvd3BISGNybVJjbS8wNkN3eUY1S3o2d0V2NFZOTFdUM0JvY1Fv?=
 =?utf-8?B?bEg4VWV2Y25Ud2YzQ2kzRlhYeTZHZUttaWZtKzFsQzhMUkxlWENqRzlaSTdW?=
 =?utf-8?B?MVJDTmp6RFlUOHhhc09PLzR5eTdtakVRc2RKaTljdkpVeUZLWkkzZTdUeGVz?=
 =?utf-8?B?Wi95Wk1TSy8xQW1ubGtRZW8waWp3YVo2ZHJ0clpEM1BYakIyUFBqaCtjRTFo?=
 =?utf-8?B?RndGWW9UaFdzbXZBNzYyYzJJQkJITE9VM1ZyOVIxNEcrYjJ4Ky93SFFWUWpi?=
 =?utf-8?B?MFNmL3BibUw5V1JIT1c3dURvTUp0djBTZzYrUlg3Z054bk5MVTJ2d0c4SmVv?=
 =?utf-8?B?WWN0MVUrQWhHQjVDbUtTL1dWNmFDVzNITXRqTFhETnBmWFg3aXhrYzJ5YjJn?=
 =?utf-8?B?US9UUVgxNk81dlhBam5UbTJCcmVZSm1EbWJGZ2IreGZRV0w5TTl2NDVRMmlP?=
 =?utf-8?B?T1hXdUljOUErQXA0QXVxc3VSOVBXSWJpSUlwSk5FNHVUSGt5b08vVnplN0xj?=
 =?utf-8?B?SGs5UEZzUWp6NmJ3cGdJU3ZJNDBaL2xPKzEwMEZYbm95cTJ2T1l3LzdoUEdo?=
 =?utf-8?B?NFVqYzVOdkxuRlBLTmdpdTl6akQ2bkZtZE5hQnU4eC9JM0R6Vy9OQmI2Qlhq?=
 =?utf-8?B?YlRPZUJ5cGlDVjNZb3FEem8xVzVmaTNaaC9TQTJaVXltd00zeXM1RzYzVnRn?=
 =?utf-8?B?czBTT0hDZnBSejdvY0FEVmI3eUY0cE1GbCtlbU9YOXVHSDVzQk5WdHhXRWZM?=
 =?utf-8?B?NURuYXphSmYrSU45Qks1V0pob1dkUHMzZWc3cE1aVktVYlEvWnJ1cXpSM3RZ?=
 =?utf-8?B?MFZRdTJJYkd5UVZpcGJ3VEhlRUxGemRLQVBqOVl5Y3pEazBOV25UMHFybzVW?=
 =?utf-8?B?ZzVvN1lxOEQ2ZlZEVzRONHJIZUhzKzlLcXQ1SThRd2FQZ1A5Skg5eUg1aE8z?=
 =?utf-8?B?TElSMDdwa1A1RjJjWllBdlREUlFXVS9aenpVbHF6UDNJY1NOR2YxR1lDZTR2?=
 =?utf-8?B?SHk0bE9LNlFCSW1jZ2hZazNiaC9FRUN6UzhWODJVald0ZU5LZE5wTmR2OUpJ?=
 =?utf-8?B?K3ozR1hLRFQyNzRPUXkrcHl1cytSeVcwcHliaFpScXIrbUdQbCtPWmNYTzJU?=
 =?utf-8?B?ZG1tSWoxdE81ODBnWFQwUnM5aHlzRFdpQ3AwN0lMZlZoTEVXYzBjREh3VG5X?=
 =?utf-8?B?a2tacnRXTmFoc2JjdEh0RXpuTzJ4aHZWbFhlSlJqSlV3SnF1TmhJQ0NWTVNk?=
 =?utf-8?B?T1FLU0FSQVRXNHIwZUJ1UUdxa2xZM0ZXQVRSSFlPWTYwQS9jTS9XYUtHcUpt?=
 =?utf-8?B?WnFUR0tkS1hDMnRDR21SK0NPTkttQlZQNUdQU0QzeERDWDRwY09ZREI4RjlW?=
 =?utf-8?Q?X+ldk8j5jBHPwaY3u0Xlncd1pwv9tA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDFyUEduaUtSTDNZcGFPZTdPZTNreHhmbVRFZkpiQ0h6SGYwRXRDNExWazZ2?=
 =?utf-8?B?T0lHaXA5Wm1ZWUs0R3I2aFMwY2daMml2VlVSeUs0Mm8vaTZ1RWt6R3ByMS9w?=
 =?utf-8?B?LzNmbnNZUkFoOXd0NFE0a1A4M0FTNDJJR0ZkODRIdkZhdVo1RzUzNjR4KzBj?=
 =?utf-8?B?Tkk1VjVabTZVeU1oQnY5WEhDQnAwSkhtNkxCZmgxZGRJckZPSkp6YzZUNEtS?=
 =?utf-8?B?S09WNmZVclI4TFVlbUtXL28xSkR6RFFxYzdGSVVNZFFpcUw4MTUyNEtEVmxZ?=
 =?utf-8?B?K1hSOUpYWmNoK05nMVUxcVZVQUdRVlRjeGZTMUwxVUUwVS9sSFNUMTUzZXJB?=
 =?utf-8?B?eWlZakZzK2xabVBraXVSSitoa2c2RjUySUx4U2N0UlNoUDF1eGIxNkRnUDE3?=
 =?utf-8?B?L0llUWNycmZva1p3U2JEUmEvNXQ0VlVpUWhLZHVSYURBMTZMYXpndzVqZGYv?=
 =?utf-8?B?WnJReFVET0pvNzNNM2pPdlhOUU1ha0xsM0EyVDdXM2dmK2VsMGFYaGJiOEdT?=
 =?utf-8?B?eXViTDZOSGtDcjlhZ2NZWXZUd3pHSURhZjFoNVJPWlhabVFFMEw3RXpnek1L?=
 =?utf-8?B?eDEwRENhRWN1RTBnME1obVZGVm1XZlJuVVFaTjBrZFlYMzNJaFJYNStRVHdm?=
 =?utf-8?B?YVFRRXFjSzlrWkRSNHNYdSs3NzZyOWhUcHd5eFRFNjVZaHB3WGNCQkpYa2V0?=
 =?utf-8?B?empLYjFrVHNzaTlwSzJ1SisvM3g2ZldPbExhUFk3QVBNQWJET3hjYkNPdjdr?=
 =?utf-8?B?TmpPdlJScTgrYUtiWFk2WWdvZUlMZUk3K1E2V29keHRJdzhWNEozMXJTNTN0?=
 =?utf-8?B?MGxzTHlib0o0VFhzMTJUUFp1YTc3TzNkcGxLM3FWY0R0UXUvUzBaVHRHdHFi?=
 =?utf-8?B?N2lheXl0Zm5YSE03eFRqODJpUzVKVmlGSjVFbWVERWpuZDVxRTNUMUNvcEZs?=
 =?utf-8?B?MGNzZW9sWWtxNGdTZDdvK1k3RjJISStOT0hsTHhYMFRDYXhXWXBkZEpSZlV5?=
 =?utf-8?B?ZGE2OHU5cExkVjRYTC9LSGQyOWF0S29Wa0FybnBEcVA3MVNlaTE2QnBReklr?=
 =?utf-8?B?bVNjS25tbXp3V3hJYjRjcUhaVDlSVUcvKzY1ZENIT01UU0d3UnlINGcwblRX?=
 =?utf-8?B?MEVCWm1hcDdWUDY5cGtsQU5wc1o4U2ZDSzdIdW9IQk4xaWVCWXFtWDV2QkpU?=
 =?utf-8?B?UEg0M1BLRXJwMERNZXpjbnVha1BTdVZrZitkWU5XZmIra0U5UXNVejVZU0hu?=
 =?utf-8?B?ckJra1BtSkRXYzVBSUQwRTE0NncxY2RFMGVmTGt0dU0zbnFuYk0yQi9BZ0N0?=
 =?utf-8?B?MnVrZ3RQd2JSTHN5UHJxN1dRcVBKRkt6OXZVZ1cweFBWRTRVZ3I5bERBak84?=
 =?utf-8?B?MUZCSStMRzEyL1NxL2VTVm5aR2xmVit2QUdqLzdIdFQvbmNpbnRTY21PZ1hy?=
 =?utf-8?B?VHVVc1J4ZENodUpzdmp1aUFVOEs5Zm5BQmc0cDRWZ0xUekNCeUpxeis0Z1I5?=
 =?utf-8?B?VWUxSlR2dE9BWU5HZHpraUtkZlFhRjNkTnJ6cmQ2akkvcW1zUWo3TExreTFT?=
 =?utf-8?B?SFY1YlhGbVFWeGd3L0R3aFE3K2VteEZ2WFVncG02UDJNcG1jSk5oNG4zUWly?=
 =?utf-8?B?NG5kZDZHMlBETmJHeklzZWdNSzNzcFFraVJ2MHdDbGNpSVpsWmJuQnZXQnlJ?=
 =?utf-8?B?YTVwampubkxoWjhUMmNMNDRyTmF4MnFqZ1BiR0dabUZHTit1VEdORW5Zdjcr?=
 =?utf-8?B?OU4vaFQrZEEzb1h2RHpPcWlHQ01PcllMRXBwK0dBRDI5elJScldUQ0dldUxF?=
 =?utf-8?B?Q0J2TjZhTlNRanRpK1l0VWZuM0ptbGRtL0Y3NTJ0UGhrQmV3OS82YXVwc1NR?=
 =?utf-8?B?akg0czZXclhIa2twQlExeWVDL1Q1V2xWNE9mOHpaYTM2VCtMK2FHQmJnaitr?=
 =?utf-8?B?RERTWEhVbnJ3dDdMU3NFT0JIWlozcjhhaW42dm1CMUttSDRjU3p2TFZOQlpY?=
 =?utf-8?B?NURsUnJXQmExN1Z4Nk1PdXYyaFE2eFZKS1VHcWtFSThxNHBEeVByMEE3dlZl?=
 =?utf-8?B?TVNmVVRRVzkxL2hpZlh6Q2UxbFE0R3B1Qytpb0dDQlo3VHZOMnhOT3FtTVpo?=
 =?utf-8?Q?FUaHiSBvC+Cn7dlGe7hDCvZwb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3B9521AB1CA494398653ECBB63B9965@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336dbe17-0e19-4aa2-2552-08dd862c2331
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 08:10:28.3262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vo6Z4PupQZN99cuewzwyPftEeWL88yRqEmiu6w/MuvWHqnhm+HEyWtVUWM1R92KYIaW1Qvhl+DtR6ccDOBpNlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8349

T24gTW9uLCAyMDI1LTA0LTI4IGF0IDA5OjAxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgQXByIDI1LCAyMDI1IGF0IDA0OjUzOjE2UE0g
R01ULCBLeXJpZSBXdSB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIG10
ODE5NiBtdWx0aS1oYXJkd2FyZXMganBlZyBlbmMgJiBkZWMsDQo+ID4gYnkgZmlyc3QgYWRkaW5n
IG10ODE5NiBqcGVnZGVjIGFuZCBqcGVnZW5jIGNvbXBhdGlibGUgdG8gaW5zdGFsbA0KPiA+IGtl
cm5lbCBkcml2ZXIuIEFkZCBzbW11IHNldHRpbmcgdG8gc3VwcG9ydCBzbW11IGFuZCBpb21tdSBh
dCB0aGUNCj4gPiBzYW1lIHRpbWUuDQo+ID4gU2Vjb25kbHkgcmVmYWN0b3IgYnVmZmVyIGFuZCBj
bG9jayBzZXR0aW5nIHRvIHN1cHBvcnQgbXVsdGktaHcganBlZw0KPiA+IHdvcmtpbmcuDQo+ID4g
TGFzdGx5LCBmaXggc29tZSBidWdzLCBpbmNsdWRpbmcgcmVzb2x1dGlvbiBjaGFuZ2UgaGFuZGxl
aW5nLCBzdG9wDQo+ID4gc3RyZWFtaW5nIHN3IGZsb3cgYW5kIG90aGVycy4NCj4gPiANCj4gPiBU
aGlzIHNlcmllcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBNVDgxOTYgdGFzdCB0ZXN0Lg0KPiA+IEVu
Y29kaW5nIGFuZCBkZWNvZGluZyB3b3JrZWQgZm9yIHRoaXMgY2hpcC4NCj4gPiANCj4gPiBQYXRj
aGVzIDEtMyBBZGRzIGpwZWcgZW5jb2RlciBhbmQgZGVjb2RlciBjb21wYXRpYmxlLg0KPiA+IFBh
dGNoZXMgNCBhZGQganBlZyBzbW11IHNpZCBzZXR0aW5nLg0KPiA+IFBhdGNoZXMgNSBmaXgganBl
ZyBodyBjb3VudCBzZXR0aW5nIHRvIHN1cHBvcnQgZGlmZmVyZW50IGNoaXBzLg0KPiA+IFBhdGNo
ZXMgNiByZWZhY3RvciBqcGVnIGJ1ZmZlciBwYXlsb2FkIHNldHRpbmcgdG8gaGFuZGxlIGJ1ZmZl
cg0KPiA+IHNpemUgYnVnIHdoaWxlIHJlc29sdXRpb24gY2hhbmdlZC4NCj4gPiBQYXRjaGVzIDcg
cmVjb25zdHJ1Y3QganBlZyBkc3QgYnVmZmVyIGxheW91dC4NCj4gPiBQYXRjaGVzIDggZml4IG11
bHRpLWNvcmUgc3RvcCBzdHJlYW1pbmcgZmxvdw0KPiA+IFBhdGNoZXMgOSByZWZhY3RvciBtdWx0
aS1jb3JlIGNsayBzdXNwZW5kL3Jlc3VtZSBzZXR0aW5nDQo+ID4gUGF0Y2hlcyAxMCBmaXggZGVj
b2RpbmcgYnVmZmVyIG51bWJlciBzZXR0aW5nIHRpbWluZyBpc3N1ZQ0KPiA+IFBhdGNoZXMgMTEg
cmVmYWN0b3IgZGVjb2RpbmcgcmVzb2x1dGlvbiBjaGFuZ2Ugb3BlcmF0aW9uDQo+ID4gUGF0Y2hl
cyAxMiBmaXggcmVtb3ZlIGJ1ZmZlciBvcGVyYXRpb24NCj4gPiANCj4gPiAtLS0NCj4gPiBUaGlz
IHNlcmllcyBwYXRjaGVzIGRlcGVuZGVudCBvbjoNCj4gPiBbMV0NCj4gPiANCmh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGlu
dXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNTA0MjQwOTA4MjQuNTMwOS0xLWppYW5odWEubGluQG1lZGlh
dGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyFoRGp6eWRmMmJseUloZEFrWXNfTmJxcEVhYVdU
dW9sTGJhSExEdzhoTGc0Qko4N3I3ZVB6S2tFVC11RHcyNFU2WVhBcW1iU3hJdGVtMVEkDQo+ID4g
DQo+ID4gQ2hhbmdlcyBjb21wYXJlZCB3aXRoIHYyOg0KPiA+IC0tcmVmYWN0b3Igc21tdSBzaWQg
c2V0dGluZyBmdW5jdGlvbiBpbnRlcmZhY2UNCj4gPiAtLVNvbWUgbW9kaWZpY2F0aW9ucyBmb3Ig
cGF0Y2ggdjIncyByZXZpZXcgY29tbWVudHMuDQo+IA0KPiBUaGlzIGlzIHZlcnkgdmFndWUuIFdo
YXQgZXhhY3RseSBjaGFuZ2VkLg0KDQpEZWFyIEtyenlzenRvZiwNCg0KU29ycnkgZm9yIHRoZSBz
aG9ydGx5IGRlc2NyaXB0aW9ucy4gVGhlIG1haW4gY2hhbmdpbmcgaW4gVjMgaXMgZml4ZWQNCmR0
LWJpbmRpbmdzIGNvbW1lbnRzIGJ5IHlvdS4NCj4gDQo+ID4gDQo+ID4gQ2hhbmdlcyBjb21wYXJl
ZCB3aXRoIHYxOg0KPiA+IC0tcmVmaW5lIGpwZWcgZHQtYmluZGluZ3MgZm9yIE1UODE5Ng0KPiAN
Cj4gVGhpcyB0ZWxscyBtZSBub3RoaW5nLg0KDQpJIGhhdmUgY2hhbmdlZCB0aGUgcGF0Y2gncyBz
dWJqZWN0IG9mIGR0LWJpbmRpbmdzLCBidXQgaXQgc3RpbGwgbWFkZQ0KbWlzdGFrZS4gSSBtdXN0
IGFwb2xvZ2l6ZSB0byB5b3UgYWdhaW4uIEkgZGlkIG5vdCBpZ25vcmUgeW91cg0Kc3VnZ2VzdGlv
bnMsIGJ1dCBteSByZXZpc2lvbnMgZGlkIG5vdCBtZWV0IHlvdXIgcmVxdWlyZW1lbnRzLiBJIHdp
bGwNCmZpeCB0aGVzZSBpc3N1ZXMgaW4gdGhlIG5leHQgdmVyc2lvbi4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQpSZWdhcmRzLA0KS3lyaWUuDQo=

