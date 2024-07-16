Return-Path: <linux-media+bounces-15031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3B931E39
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 03:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 056ABB21F68
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 01:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E673FF1;
	Tue, 16 Jul 2024 01:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="fWpQN0Cx"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022112.outbound.protection.outlook.com [40.107.43.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3633EA;
	Tue, 16 Jul 2024 01:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721091759; cv=fail; b=sWG6Y+UgjUXKPW7i1dIyxTxx7HgdhL/uDN7uo9UkfdS+tJDb2+i2D9l6VXxKxKoYOuWql263OpxknHpEZGkzJiIK3Z3UboQKtudIwy1b3OfV90e8C+7SaoRZjJ0GD0iEQI5usGlQsKYIKbi5Z6smvQHmJT06MrdJlQXJZ0x3TeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721091759; c=relaxed/simple;
	bh=8y6ZJug+y52X6j52sc732LE5GjIol4REhXCbKMwMfkQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gb8scOL1udkPMI/d9mLKSW+Y1wRLkYDYuzlO24kWeTgoPbeSX6I7q6DpGaxzSm852Jco6C1ZNII3NHVwAZ9rsrUSiJ7uhnOmXo6T3E4tDnNIdM48QiZcHRxD5HAouIZG5uWiny35DRhSmop+ANzJsERsC4Itz2HhbLMnlUH0mMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=fWpQN0Cx; arc=fail smtp.client-ip=40.107.43.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3E7oRNMKDd8MuxSP2qytSdZnpKXKqGdrwOsdVkL+lVVLYYqtyVmFv8e+rqQtOEHquvTpnDSaSMvln2GpuU8bbnQk7pV5ITK318CFB3/52/0RfF5Rk1Q1mINj30Vmw/UtIxk4HaMY45gjzw4VjcefMwrBS7tSF6gVkxJb6PB8Ar9ju5p1rq9OefTTLt9OV+H/ytHbLyNl26UG1rO7KBs4DGE9Wj0ngpmjtw313Ynh+6osXhYzxG9ydRxQmaEZy+lIodeMAvW1vyIUlgaHTuVqNlP9xt1p+U+QYI2aPtj57tHgrM3MUsYYz6mV8H3dDUVBzNLpKBjIfOqVvMfupPyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y6ZJug+y52X6j52sc732LE5GjIol4REhXCbKMwMfkQ=;
 b=xADy9SyJAvshk2pILi2hzQDM9vw6vx5WqjiBkXeGgrUQ46bFCKEMjUSEYhmBxit0hNElSncqhew7BNKCflWSPcxAmpuqqDYIdnjIwMFTlyqTyXuUOlNDwNHItqSAt2o3D/VvNfnUaJKoRntTAjeoPFzSaM3vQAWV/bmOowsUJzOt6WCpk0gyk25yROPn2hWpVjaMzxgVxEOfd1HJdTVZiHnId23FpkFV1bOaO8KGWhKK3o9RRIKtP7pXURHWQIYwni/HLSTADHMyrVr0YLUG880AYDGl8nnGXF24g7XAA0hEJv+8f50gbXsINLxYikg6jpP3DqK23eXFydhXpxw1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y6ZJug+y52X6j52sc732LE5GjIol4REhXCbKMwMfkQ=;
 b=fWpQN0CxONyQOK4lKEl+I8NbaF7QfmhmAZI7y08PGWNa/DBu2ccydVve7dTd9j48DekeYCx/VggRv1F1jZCotIB0DwY6vGid3R1Auu6DNjOLlqrRAvB+SDuMEscp910KmWCGM8byFLbY+TYYGNm76UVHtQohK4zMiMlcN7U9K8E=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1580.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Tue, 16 Jul 2024 01:02:32 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 01:02:32 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Devarsh Thakkar
	<devarsht@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>, Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Aradhya <a-bhatia1@ti.com>,
	"Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index:
 AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbCAAATQUIAAoAiAgABLagCAAAQsAIAANdIAgCHPqoCABXMZgIAAhQsQ
Date: Tue, 16 Jul 2024 01:02:31 +0000
Message-ID:
 <SE1P216MB1303BD27042E889B9CDC07E4EDA22@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
	 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
	 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
	 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
	 <SE1P216MB130382E16D0CCD27341D535DEDA62@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <58ed6e3b06e6f156af9820b29d78cbd79d8e719f.camel@collabora.com>
In-Reply-To: <58ed6e3b06e6f156af9820b29d78cbd79d8e719f.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1580:EE_
x-ms-office365-filtering-correlation-id: 72e8098e-39c2-425d-39e2-08dca532f8c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?amFKby95aWtKcnRmOHJJQTYrUXBaaUlzN0paWGFjMXNETFRvbjlQbFdrQmNa?=
 =?utf-8?B?K0dneW1wV01sVWFSY0svWloxL1ZEZ0MxR0JUTTJoN1RIaUNhNGFhaGwrUFlk?=
 =?utf-8?B?SjRROVh6bHpOWWlCeGNpaXFoelpjeFJ3QXZramNvSHJidUFsbW43eHZ0QkZs?=
 =?utf-8?B?c2ZYN1V6TVQ0VC9BaGdUYTRxclZlMGtEY0xvT2drOUhGdlplcDlvZDIzdzBX?=
 =?utf-8?B?NEpLT0JmeXlhNlNWZlk0L0k1N2xvUVVmY3NNVThrK3dXQXV0Z3phalNTbnRO?=
 =?utf-8?B?U0cvQUtCUUUzcktTUFFDTk1HV2FIOW9hWFdLeXVZaUtKa2FldFBBOFNXSzFC?=
 =?utf-8?B?N0FqOHdTck5jQ3J3T2JPK3NVcmlzWHlwN2VnUURhaVFuMnMrY3puYm4wdHlk?=
 =?utf-8?B?T05FeEJST0ZWM1MyWjhZeUtUODMvTGUzRzJsZVAwSEM1NVF5NDBsZzFkdEMv?=
 =?utf-8?B?c29wanFqZmRyZDhXVnBieWlOOThoajAxdkd0VFRkbVFlUE12TWcyU3pvWSs2?=
 =?utf-8?B?bG1IU3JpbXI2MUY3V3FWb3FpMWRCbng4U2QzM25pbDY0U0pRalBpSXhWM0pE?=
 =?utf-8?B?ckJEaVpTc1Rzc1J1TlhnWVA1OVBwTitOZ1RJMitDcDBEeUU0blR3ci80dnI0?=
 =?utf-8?B?S3B4SlFQaGQ2aVBza3JEb0lvTG95LzlDUzE0RVF2dm40bUdBMlhLb0RQaWk1?=
 =?utf-8?B?c2tOK09JLzBuNUJlVHVWOGNEaTUxNDQ0TmVua1NEUjdnZUd1ZEIvNHp1UEtJ?=
 =?utf-8?B?dmdYeWNadFFOMWlaa2g0cFM5TlBXRkxNSGtpWEVYWkhHTmxUYlU4aDczZmFq?=
 =?utf-8?B?eEFpSlJxVlJ0ODNVSEZlamZTSnRYSkJtdUt5dXVpQlVSNlNNSGppZmlvMDVD?=
 =?utf-8?B?RjFDazU3NWFlNERMUVBJMFl6d3FWWDR3MnE2OGhLa3VlZG95bmhON3pCTEdn?=
 =?utf-8?B?eWpYWDVGeE0wMlJ2WG5DWi85L3dUbHN2b0VjTUpJTUc0T2pGTTVXYldTN2JG?=
 =?utf-8?B?R0RpVTZwcFAvcFhUL0RYZDZaZmpSdTBFbzBESCtOOWFtL0R2MlFRcHJtS2w2?=
 =?utf-8?B?RXBDNndxWW1LZlFlTXBTSndXN0Fzc3dlem9ScTVzZU1PbzRyWURTNWx4R1Ex?=
 =?utf-8?B?V2QwRnhRblBPeG1qanV6WlB2bzFHc1RSUFpjQ3l1eFh2Q1dLYWgrRGgwUm1l?=
 =?utf-8?B?Qmk0bWxOcnM4YmppTVExSkVLWFJvMGNMbng3NTFFL1ZOZi83QWs1Rk1iS0xO?=
 =?utf-8?B?N010RWhVWVFlOTZsTkZZRllJekg3dzI3R2FIN0YxRjVSSWRBK3pKT1ljSHpX?=
 =?utf-8?B?YmZpZFNUZWlNa0QwZkVUbGtCVCt3anBBb3dTY3VWeGFpSGhGYmo4UzNVc3RP?=
 =?utf-8?B?dzEwZStycmJNTGVUZXIvSXY4RTMrK0NlRVEwR2oyZjZzcjRMam10UWxsSmIz?=
 =?utf-8?B?WVVFZDB4U0M5VmRDUEZtZExiRGlUK041REoyeEtWcTFIVkdIajNScGZtOWw3?=
 =?utf-8?B?N3EvMHFuYVBreVEvVVFCYzJuenZQdXVBbHRFYTNpZlUvc29lZHJkenJvNU5r?=
 =?utf-8?B?aWh3aXJCQjgzTjZjNlQ5VmMyMHFLMkxNZmVKQm9RTTVZSDBjUjUxOWtrVkxN?=
 =?utf-8?B?NUwyRjhhZWhHbzRWUXJCcUJVQU1VRERvQ2Y1TVc0VU0vQWducGVRRHBZcksw?=
 =?utf-8?B?VHZ1WmlheHBubGFXTUJ4UkhzQ2pqbFZDOHY4STBpNi9kTjMyZUhia2JWcWZu?=
 =?utf-8?B?anRMRmVqZ1JOV25DclhIaDhZam9tRlJOamx5Q3ZSVkNNaE9PSmxqOWcrQ1dN?=
 =?utf-8?Q?QDoUap5/5YS+pILUFwMIxwHeFgRfsn3OY0YzE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0Vmc0hWaENrSXNLSDF5cEVrdjByNEorS3I2VU1lKzNyZFF5d3d4RGZlN0tQ?=
 =?utf-8?B?UElnZDZLTlRWcXFlNXhpTXF1c3dtQmFvV1RESUVSVXlsSERXNmw4UmlBVm96?=
 =?utf-8?B?c2dRclVHZVI5bVRBbnR2MVg0elJsaXRCYkV4ZWJOdmVGeUM4ZTlFTkZZK1hG?=
 =?utf-8?B?amhYQ2ZCLzVvMUNmcXBXaEhVTUJROHo1ckhaa2ZxQVpnZXF6U3A2WFdva1lJ?=
 =?utf-8?B?WWYrYUxwYmtQUkhucytpeXpEVUozdnhnWENWRHhwdk9BK0ZrQWJiTEJIbE5j?=
 =?utf-8?B?MUw0QzVFSWtWM3c2d25LU3R2bXFZeTFMaUN4VStONmR2dkp1SkZWUU14S1JQ?=
 =?utf-8?B?Y1VXVWUrQmErbW95MnZXUGRmVVFkMUJQUXhQWXh3ME9LM2tnckZ5VDl3VUwz?=
 =?utf-8?B?VFNSQkNwbk1VSUc0aWF2b3JCWmhPSU5tUFBlZFhBQXRYMXA5Qi9Dc3IzNHVl?=
 =?utf-8?B?Q3hvZTdhWWJTa21QL3MxMjhNd2EzS2N0N1h6UEdUQk56ZFlwZk5pL0JyeVY5?=
 =?utf-8?B?cDEwWUZiRjZlNm1uR1paeG5oT0JqSVI2TzBMcDZVUEdCMCt0S1lYQWQ3Z3Rx?=
 =?utf-8?B?clVlT2kxRlBsV0M3bjM1WERYa3J3d3hLNVZOSnNUWWowbEhINjVESFFDbExB?=
 =?utf-8?B?RDAyYXkzYjdPand6KzZJTmhKNVZZU2o2ckx4NDhyL2RuL1djRW95VS9YZERC?=
 =?utf-8?B?KzBxZWZVMDBsY0FNOXhwVkZFd2wyKzZMbW9xUDFiM1ZoTUlQUWtJcURzeUkv?=
 =?utf-8?B?bmgyWU1zT29oY3BMb3EzblV2MStRMzl3NzgzdkdLYnJxVmZIbHBLRG9hTytD?=
 =?utf-8?B?dFpaMnM1b0dyanIvZm51WnJuM0ZrT3dmOVpZa2NPR0RkZUhXYUx1NitEdTVW?=
 =?utf-8?B?K1Q1clN2YjRzNG54TlZRb0E4VWNwdERTUk5jOE5WQVlWNmRGb3NjSTdtZEdz?=
 =?utf-8?B?US84eHJkcDFIZFc2bDJwWnliMXFDWkcyY0twMGVDWE96bDBkOW1hV2R3NHlP?=
 =?utf-8?B?RmxjTG1WUVd2MVFhcWdOcDhyQjYzaGFZLzNUY2lrenQyOVhPcmJHNHpNUUZY?=
 =?utf-8?B?ZktnM0xJVDRVcU9VOHdiKzlWYVFTaGtvS2lEK3dXNjN0UER2RUdteDFrNmpo?=
 =?utf-8?B?VzVkVEs5eWJuMUN3N2RnZnh4S1J3ZzlVZTdKSGF3QVBKY2hsVzB3dVNsbk5E?=
 =?utf-8?B?Nys2VDUvV0tqczlYdU5EWXNjRlhWY2JwTGs2Wjg3SlEzbEkwUG9lRS9IeHhS?=
 =?utf-8?B?bjVYZFBOckp2L2ZnOEE4R01DRFRBRTRvMzNhVDlsMlVmNTJ2ZVA0aXQrUisz?=
 =?utf-8?B?bk9wem1tRzVYZTZ3TmZncFJDazJOalg0ZGpMNjNsdHV2Vmc3UUhjRVZqbDNq?=
 =?utf-8?B?UFdHWFppWTdweHFNNmFlWXZvRlZtSDlGVXlLdHZGeWxnYVdjK3FQMnc3cUc5?=
 =?utf-8?B?c0pVRmNyUG1EQVdmVVlvUjdzNGFJeng5Z09wWFpZdGl1T0c4NHRTRDljS054?=
 =?utf-8?B?Q0Z0ZmUrcnVTckRZWW5EbG1XQ09WbG91QkNtZVgrb013ZnhHRE1RZjQxcmlZ?=
 =?utf-8?B?ZWNqSm9ISmVuMzZuWGp6Wkd0VGg3MmVPYXFOQzgwQVYrbUMwa3BjV2NLRFEw?=
 =?utf-8?B?T1gwLzJmSzF5TitPdDVOYSs0ZStSNG5zSXBWVWpDbHBPR01aUEozT1k4Q01n?=
 =?utf-8?B?Y3AveUZKNEkxbTFreXJ0OEdVUDluMzh5YWhqV1BITmdDeXlkQ0w4d3hPNEcr?=
 =?utf-8?B?Rm8rRzhOTDN4dHhhNTR1dHN1UTBIeHkrTjFmTUVsT3BXZ0Z4SU5OMFFYL0VU?=
 =?utf-8?B?YW1PZTNyVHVQRjZKWEg3Qnp1SmpXQ1hzZzgvMG5wZTVkV3lRN2srN3lmekx3?=
 =?utf-8?B?RW5obFRrS0VHRUdQL25JQWpxZUJMamt1OFFBOWkzNzh5R0g4N0pkMURPcDVE?=
 =?utf-8?B?aHBmWCtKQnhvQ2pPU21NN2FadUtzWXlIdDRTSGVJWUhzeXNZSm5vNVdYTVFV?=
 =?utf-8?B?RDlUSmdMcTYyR1BpTVdlNW1SVGY0aXpuRlVMaG11UzlzcGJhbDB3UmJDZFYv?=
 =?utf-8?B?NkNmeXpQUUg1TVB6NGtHVHVqQndPUnVEZ1JOL01IdjhRc0I2eFpCRXlXQkUw?=
 =?utf-8?B?ajRHWVp4Q3V3amtEWWtZSFQ1bXZvREkxYmhabmFzWDd1RkppRHAxK3FTTG1G?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e8098e-39c2-425d-39e2-08dca532f8c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 01:02:31.9769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQBz45x8oaeeHSveZAynHS9nrVZ/1x2DU83VgENyw88yxSTtW1w8POTANBDBRghPnoQCPN+R1Nno8yFaI9i8SezwbjHdx0HiJB2U4UOf35k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1580

SGkgTmljb2xhcw0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBj
b2xsYWJvcmEuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDE2LCAyMDI0IDI6MDYgQU0NCj4g
VG86IGphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+OyBEZXZhcnNoIFRo
YWtrYXINCj4gPGRldmFyc2h0QHRpLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsgc2ViYXN0aWFu
LmZyaWNrZUBjb2xsYWJvcmEuY29tDQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGh2ZXJrdWlsQHhzNGFsbC5ubDsgTmFz
IENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPjsgbGFmbGV5LmtpbQ0KPiA8bGFmbGV5
LmtpbUBjaGlwc25tZWRpYS5jb20+OyBiLWJybmljaEB0aS5jb207IEx1dGhyYSwgSmFpIDxqLWx1
dGhyYUB0aS5jb20+Ow0KPiBWaWJob3JlIDx2aWJob3JlQHRpLmNvbT47IERocnV2YSBHb2xlIDxk
LWdvbGVAdGkuY29tPjsgQXJhZGh5YSA8YS0NCj4gYmhhdGlhMUB0aS5jb20+OyBSYWdoYXZlbmRy
YSwgVmlnbmVzaCA8dmlnbmVzaHJAdGkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JFU0VORCBQQVRD
SCB2NiAyLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgcnVudGltZQ0KPiBz
dXNwZW5kL3Jlc3VtZQ0KPiANCj4gSGkgSmFja3NvbiwNCj4gDQo+IExlIHZlbmRyZWRpIDEyIGp1
aWxsZXQgMjAyNCDDoCAwNjoxMCArMDAwMCwgamFja3Nvbi5sZWUgYSDDqWNyaXTCoDoNCj4gPiBI
aSBOaWNvbGFzDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+
ID4gPiBTZW50OiBGcmlkYXksIEp1bmUgMjEsIDIwMjQgMjozMyBBTQ0KPiA+ID4gVG86IERldmFy
c2ggVGhha2thciA8ZGV2YXJzaHRAdGkuY29tPjsgamFja3Nvbi5sZWUNCj4gPiA+IDxqYWNrc29u
LmxlZUBjaGlwc25tZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+ID4gPiBzZWJhc3Rp
YW4uZnJpY2tlQGNvbGxhYm9yYS5jb20NCj4gPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBodmVya3VpbEB4czRh
bGwubmw7IE5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNvbT47DQo+ID4gPiBsYWZs
ZXkua2ltIDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgTHV0
aHJhLA0KPiA+ID4gSmFpIDxqLWx1dGhyYUB0aS5jb20+OyBWaWJob3JlIDx2aWJob3JlQHRpLmNv
bT47IERocnV2YSBHb2xlDQo+ID4gPiA8ZC1nb2xlQHRpLmNvbT47IEFyYWRoeWEgPGEtIGJoYXRp
YTFAdGkuY29tPjsgUmFnaGF2ZW5kcmEsIFZpZ25lc2gNCj4gPiA+IDx2aWduZXNockB0aS5jb20+
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1JFU0VORCBQQVRDSCB2NiAyLzRdIG1lZGlhOiBjaGlwcy1t
ZWRpYTogd2F2ZTU6DQo+ID4gPiBTdXBwb3J0IHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUNCj4gPiA+
DQo+ID4gPiBMZSBqZXVkaSAyMCBqdWluIDIwMjQgw6AgMTk6NTAgKzA1MzAsIERldmFyc2ggVGhh
a2thciBhIMOpY3JpdMKgOg0KPiA+ID4gPiBIaSBOaWNvbGFzLA0KPiA+ID4gPg0KPiA+ID4gPiBP
biAyMC8wNi8yNCAxOTozNSwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gPiA+ID4gPiBIaSBE
ZXZhcnNoLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTGUgamV1ZGkgMjAganVpbiAyMDI0IMOgIDE1
OjA1ICswNTMwLCBEZXZhcnNoIFRoYWtrYXIgYSDDqWNyaXTCoDoNCj4gPiA+ID4gPiA+IEluIG15
IHZpZXcgdGhlIGRlbGF5ZWQgc3VzcGVuZCBmdW5jdGlvbmFsaXR5IGlzIGdlbmVyYWxseQ0KPiA+
ID4gPiA+ID4gaGVscGZ1bCBmb3IgZGV2aWNlcyB3aGVyZSByZXN1bWUgbGF0ZW5jaWVzIGFyZSBo
aWdoZXIgZm9yIGUuZy4NCj4gPiA+ID4gPiA+IHRoaXMgbGlnaHQgc2Vuc29yIGRyaXZlciBbMl0g
dXNlcyBpdCBiZWNhdXNlIGl0IHRha2VzIDI1MG1zIHRvDQo+ID4gPiA+ID4gPiBzdGFiaWxpemUg
YWZ0ZXIgcmVzdW1wdGlvbiBhbmQgSSBkb24ndCBzZWUgdGhpcyBiZWluZyB1c2VkIGluDQo+ID4g
PiA+ID4gPiBjb2RlYyBkcml2ZXJzIGdlbmVyYWxseSBzaW5jZSB0aGVyZSBpcyBubyBzdWNoIGxh
cmdlIHJlc3VtZQ0KPiA+ID4gPiA+ID4gbGF0ZW5jeS4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkg
YW0gbWlzc2luZyBzb21ldGhpbmcgb3IgdGhlcmUNCj4gPiA+ID4gPiA+IGlzIGEgc3Ryb25nIHJl
YXNvbiB0byBoYXZlDQo+ID4gPiBkZWxheWVkIHN1c3BlbmQgZm9yIHdhdmU1Lg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gSXQgc291bmRzIGxpa2UgeW91IGRpZCBwcm9wZXIgc2NpZW50aWZpYyB0ZXN0
aW5nIG9mIHRoZSBzdXNwZW5kDQo+ID4gPiA+ID4gcmVzdWx0cyBjYWxscywgbWluZCBzaGFyaW5n
IHRoZSBhY3R1YWwgZGF0YSA/DQo+ID4gPiA+DQo+ID4gPiA+IE5vcGVzLCBJIGRpZCBub3QgZG8g
dGhhdCBidXQgeWVzIEkgYWdyZWUgaXQgaXMgZ29vZCB0byBwcm9maWxlIGFuZA0KPiA+ID4gPiBl
dmFsdWF0ZSB0aGUgdHJhZGUtb2ZmIGJ1dCBJIGFtIG5vdCBleHBlY3RpbmcgMjUwbXMga2luZCBv
Zg0KPiA+ID4gPiBsYXRlbmN5LiBJIHdvdWxkIHN1Z2dlc3QgSmFja3NvbiB0byBkbyB0aGUgcHJv
ZmlsaW5nIGZvciB0aGUgcmVzdW1lDQo+IGxhdGVuY2llcy4NCj4gPiA+DQo+ID4gPiBJJ2QgY2xl
YXJseSBsaWtlIHRvIHNlZSBudW1iZXJzIGJlZm9yZSB3ZSBwcm9jZWVkLg0KPiA+ID4NCj4gPg0K
PiA+IEkgbWVhc3VyZWQgbGF0ZW5jeSBmb3IgdGhlIHJlc3VtZSBhbmQgc3VzcGVuZCBvZiBvdXIg
aHcgYmxvY2suDQo+ID4NCj4gPiBSZXN1bWUgOiAxMjQgbWljcm9zZWNvbmQNCj4gPiBTdXNwZW5k
IDogMzU1IG1pY3Jvc2Vjb25kDQo+ID4NCj4gPiBJIHRoaW5rIGlmIHRoZSBkZWxheSBpcyAxMDBt
cywgaXQgaXMgZW5vdWdoLg0KPiA+IEhvdyBhYm91dCB0aGlzID8NCj4gDQo+IFNlZW0gdmVyeSBm
YXN0IG9wZXJhdGlvbiBpbmRlZWQsIHNvIGEgdmVyeSBzbWFsbCBkZWxheSBzZWVtcyBsb2dpY2Fs
LiBJDQo+IGJlbGlldmUgdGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQgb3RoZXIgZHJpdmVycyB1c2Vz
LCBzbyBzb3VuZHMgZ29vZCB0byBtZS4NCj4gDQo+ICoqSWYqKiB3ZSBkZWNpZGUgdG8gZ28gbG93
ZXIgb3IgZHJvcCB0aGUgZGVsYXksIHRoZW4gSSdkIGxpa2Ugc2VlIHNvbWVvbmVzDQo+IGJlbmNo
bWFyayB0aGF0IHNob3cgdGhhdCBkb2luZyBzdXNwZW5kIGR1cmluZyBwbGF5YmFjayBkb2VzIGlt
cHJvdmUgcG93ZXINCj4gZWZmaWNpZW50bHkgd2l0aG91dCByZWR1Y2luZyB0aHJvdWdocHV0Lg0K
PiANCj4gTmljb2xhcw0KPiANCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiBCdXQgcGVyaGFwcyBhIHNl
cGFyYXRlIGlzc3VlLCBJIGRpZCBub3RpY2UgdGhhdCBpbnRlbnRpb24gb2YgdGhlDQo+ID4gPiA+
IHBhdGNoc2V0IHdhcyB0byBzdXNwZW5kIHdpdGhvdXQgd2FpdGluZyBmb3IgdGhlIHRpbWVvdXQg
aWYgdGhlcmUNCj4gPiA+ID4gaXMgbm8gYXBwbGljYXRpb24gaGF2aW5nIGEgaGFuZGxlIHRvIHRo
ZSB3YXZlNSBkZXZpY2UgYnV0IGV2ZW4gaWYNCj4gPiA+ID4gSSBjbG9zZSB0aGUgbGFzdCBpbnN0
YW5jZSBJIHN0aWxsIHNlZSB0aGUgSVAgc3RheXMgb24gZm9yIDVzZWNvbmRzDQo+ID4gPiA+IGFz
IHNlZW4gaW4gdGhpcyBsb2dzIFsxXSBhbmQgdGhpcyBwZXJoYXBzIGNvdWxkIGJlIGJlY2F1c2Ug
ZXh0cmENCj4gPiA+ID4gcG0gY291bnRlciByZWZlcmVuY2VzDQo+ID4gPiBiZWluZyBob2xkLg0K
PiA+ID4NCj4gPiA+IE5vdCBzdXJlIHdoZXJlIHRoaXMgY29tZXMgZnJvbSwgSSdtIG5vdCBhd2Fy
ZSBvZiBkcml2ZXJzIGRvaW5nIHRoYXQNCj4gPiA+IHdpdGggTTJNIGluc3RhbmNlcy4gT25seQ0K
PiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gWzIwMjQtMDYtMjAgMTI6MzI6NTBdIEZyZWVpbmcgcGlw
ZWxpbmUgLi4uDQo+ID4gPiA+DQo+ID4gPiA+IGFuZCBhZnRlciA1IHNlY29uZHMuLg0KPiA+ID4g
Pg0KPiA+ID4gPiBbMjAyNC0wNi0yMCAxMjozMjo1NV0gfCAgIDIwNCAgICAgfCBBTTYyQVhfREVW
X0NPREVDMCB8IERFVklDRV9TVEFURV9PTg0KPiB8DQo+ID4gPiA+IFsyMDI0LTA2LTIwIDEyOjMy
OjU2XSB8ICAgMjA0ICAgICB8IEFNNjJBWF9ERVZfQ09ERUMwIHwgREVWSUNFX1NUQVRFX09GRg0K
PiA+ID4gPg0KPiA+ID4gPiBbMV06DQo+ID4gPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2Rl
dmFyc2h0LzAwOTA3NWQ4NzA2MDAxZjQ0NzczM2VkODU5MTUyZDkwDQo+ID4gPg0KPiA+ID4gQXBw
YXJ0IGZyb20gdGhlIDVzIGJlaW5nIHRvbyBsb25nLCB0aGF0IGlzIGV4cGVjdGVkLiBJZiBpdCBm
YWlscw0KPiA+ID4gYWZ0ZXIgdGhhdCwgdGhpcyBpcyBhIGJ1Zywgd2Ugd2Ugc2hvdWxkIGhvbGQg
b24gbWVyZ2luZyB0aGlzIHVudGlsDQo+ID4gPiB0aGUgcHJvYmxlbSBoYXMgYmVlbiByZXNvbHZl
ZC4NCj4gPiA+DQo+ID4NCj4gPiBBZnRlciA1c2VjLCB0aGUgaHcgZ29lcyB0byBzdXNwZW5kLiBT
byB0aGVyZSBpcyBubyBidWcgaW4gdGhlIGN1cnJlbnQNCj4gcGF0Y2gtc2V0Lg0KPiA+DQo+ID4N
Cj4gPiBUaGFua3MNCj4gPg0KPiA+DQo+ID4gPiBJbWFnaW5lIHRoYXQgdXNlcnNwYWNlIGlzIGdv
aW5nIGdhcGxlc3MgcGxheWJhY2ssIGlmIHlvdSBoYXZlIGEgbGV0cw0KPiA+ID4gc2F5IDMwbXMg
b24gZm9yY2VkIHN1c3BlbmQgY3ljbGUgZHVlIHRvIGNsb3NlL29wZW4gb2YgdGhlIGRlY29kZXIN
Cj4gPiA+IGluc3RhbmNlLCBpdCB3b24ndCBhY3R1YWxseSBlbmR1cCBnYXBsZXNzLiBUaGUgZGVs
YXkgd2lsbCBlbnN1cmUNCj4gPiA+IHRoYXQgd2Ugb25seSBzdXNwZW5kIHdoZW4gbmVlZGVkLg0K
PiA+ID4NCj4gPiA+IFRoZXJlIGlzIG90aGVyIGNoYW5nZXMgSSBoYXZlIGFza2VkIGluIHRoaXMg
c2VyaWVzLCBzaW5jZSB3ZSBhbHdheXMNCj4gPiA+IGhhdmUgdGhlIGNhc2Ugd2hlcmUgdXNlcnNw
YWNlIGp1c3QgcGF1c2Ugb24gc3RyZWFtaW5nLCBhbmQgd2Ugd2FudA0KPiA+ID4gdGhhdCBwcm9s
b25nZWQgcGF1c2VkIGxlYWQgdG8gc3VzcGVuZC4gSG9wZWZ1bGx5IHRoaXMgaGFzIGJlZW4NCj4g
PiA+IHN0cm9uZ2x5IHRlc3RlZCBhbmQgaXMgbm90IGp1c3QgYWRkZWQgZm9yICJjb21wbGV0ZW5l
c3MiLg0KPiA+ID4NCj4gPiA+IEl0cyBpbXBvcnRhbnQgdG8gbm90ZSB0aGF0IGhhcyBhIHJldmll
d2VyIG9ubHksIG15IHRpbWUgaXMgbGltaXRlZCwNCj4gPiA+IGFuZCBJIGNvbXBsZXRlbHkgcmVs
eSBvbiB0aGUgYXV0aG9yIGp1ZGdtZW50IG9mIGRlbGF5IHR1bmluZyBhbmQgYWN0dWFsDQo+IHRl
c3RpbmcuDQo+ID4gPg0KPiA+ID4gTmljb2xhcw0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gUmVn
YXJkcw0KPiA+ID4gPiBEZXZhcnNoDQo+ID4NCg0K

