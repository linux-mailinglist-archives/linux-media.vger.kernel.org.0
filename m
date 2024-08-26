Return-Path: <linux-media+bounces-16833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34B95F44E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BDE91F22DB3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C08318D656;
	Mon, 26 Aug 2024 14:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VvGHQ7HO"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B21553A3;
	Mon, 26 Aug 2024 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683701; cv=fail; b=LG+OxoEXqzt3CUh95B9Cd3AcidYd28aIwN9EZdj/UlxJl06xLmz2wyizM5TVLXtc3tu99CFCuNNJXTsH1cjspxmmqyDQTJYcLlpXYt9GrsJMVm15nU7vvYVPTqVoDgzve9pJAQhLGzQ3NzpU+XtoPUMjUQU1BX+BFzcAtZj7JkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683701; c=relaxed/simple;
	bh=SYUdaDeX9jwia+Asnlm/jUsSt8ZWh6rOzrSJXqgOPt8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JSDH2DSlUUDsjCjIbXyXW1covfZ8uIplOCzFIZY6VnUed3cBgyP3xSDMlFF8l0HjWNJBgYt8rvGNsnmH7R+e8Ygmv6eH5GCdj2S0QHvptHWPnToRqwKiCJO89kUcaGfj5YT1/NtjJgUDwCoRbRaKk5ZJYvk14ruGyXKFDrS72X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VvGHQ7HO; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtIbaJRTZqL01JgJDSLFQxsp9ihf1mfNql9OfbOqlIa8e8NLougogBEDg/BaCMseIqknKGUFSKJAYuIR2cylzhpuGDo+L+X0XrCf3tV+IL8r7Lmp54S0UBMND2ldJornkxEJvPVPxplI/LOzu0BIUoaoSy9xlYEStcKy1kwVOgVhlDg8OYUdR/xnJGGjqMDHDnggIbKGjAzztshbpFuTI2mBfufAD5wDuIcA+z7/mefYKPNT3eQWiITCKrRL/FTZRhu+4WPeudHt21r9OrOCgLVzhdovJm2DX7SVKIH5WLU2DdioYxGnwbblz5fj3IZEep8Jd9QEKhvx73z3x0TdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYUdaDeX9jwia+Asnlm/jUsSt8ZWh6rOzrSJXqgOPt8=;
 b=CK6xbZxm2UMzHvwbEyyJTs6Jk2VjDs/VpUL0u5BoE7Pzq7bVEOf54fGrNX6W8Jk2p6Ovu6lop/FjVRcPMsAx9rIjiaMVVUcIFpZLhoZGYZBPcEPTFBGPBfrJTGzxfKYoOkMCXOZCu9nE+CPRkmE1kvrDWpEq+Nu+c190QezNWKDEGWh/vG7gTbK/w8wrvU8GIiGTOctkYhXk8mz0f/szIj3eb/jbLCOZtnUjQdvuuk8PllI4AIjGrITrfc0co35caagSBsnVZ4czhxylqMehB5Nv4tgpd8Dr0FXQsMYAxeQu4caEMwzOL0Wb+sVUfi9Vc2S2coJ6axtNIDdoB4+RVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYUdaDeX9jwia+Asnlm/jUsSt8ZWh6rOzrSJXqgOPt8=;
 b=VvGHQ7HOkxrt5Ym9MWPRKVEr7pZOfsIgEnOD7ySUm4UNvhS/a/YLWEI8cpUpCQVjPmwCy05X+xI9l2PE7QDZac99eSEcF9H8jlMgcab5besxDwwclssqZGLLLrY3ZA/rMEj+as62t+iC/jxpnMPyUUmrUTqzYs1ELuLo8qbTFcs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10637.jpnprd01.prod.outlook.com (2603:1096:400:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:48:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 14:48:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
 Gen4 family
Thread-Topic: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
 Gen4 family
Thread-Index: AQHa98aLBhHV4ZgAf0CXbLQtvdKTk7I5nggg
Date: Mon, 26 Aug 2024 14:48:07 +0000
Message-ID:
 <TY3PR01MB11346E6810025CECA51A86B53868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10637:EE_
x-ms-office365-filtering-correlation-id: 89c75654-ff55-4577-910a-08dcc5de195e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlUxK3VBVWhWSUVIUmV5QURHSE1YcGVqSmVSSFpJN1F2L2dGbE90RG1kbnFI?=
 =?utf-8?B?aWY0NmRyRkVzUHBDcjcycElSK0JqSk55bzJ0bEpGQWRaVkdLRnFFa0pOQ1d3?=
 =?utf-8?B?M2ZpQTJqVXQ1VGxHTVJGN0NReGtvTG5GTjhsYVlwNjRtemRhK1AzMWl1Zytx?=
 =?utf-8?B?V1NON1V5a28rZXFodkZNbDRjTGlzb3QyV1V2NEsxRG9FdEw4NE96NDJXVGht?=
 =?utf-8?B?OFZiNG9DMms4UHRWSXQvcXdFQVZYUEMvYkl2T2FXSE0xeHQ3NXNDdUhxYjZs?=
 =?utf-8?B?STI1d1l4SFIxblZvZ1IrV003Z2R2TlQ1bER3TysvZmh0d280ZGhWY211ZHhX?=
 =?utf-8?B?L2pjdHoydDVyeEZvd3BsTVBsOWRkd0ZMcDdGNFkyOUgwQlhRYWhaZ1lEM0px?=
 =?utf-8?B?QlNkd0JpbFcrMjRZZnRkc3FHTGhIVFg3UFhQY3JIbjhZblUrRmovaEtTQiti?=
 =?utf-8?B?djUzNnB2Wll4T2Rsb0xCQkM5bERJbWJSU1dKY04wNVhWbEJBYzZKSTdpWEF3?=
 =?utf-8?B?VkUxV205SmJsTHNaaHQyMG5CVllaSWx6VXFRUlhBYjBvZ0V0RWpweDdBRSt1?=
 =?utf-8?B?U3lkZ3Jpb2ZubEo4akZkVzVZUDhQa3BtSnZFeGw2TCtHcHhMWFdjejYwdGJ4?=
 =?utf-8?B?NngrN2o0ZkpHUHA3YzRlL05sSzZ6M2tEZGU0S042VEpPcndCeFVlakVEb1VJ?=
 =?utf-8?B?b0hiRFNPU2RGaGdHLzg3NlFpeUJEWHo2U2szcENjYnpTSFFqUzVjZEowZ3U4?=
 =?utf-8?B?SERMQWE4RDBMbmZmRHhscllaVEIzR2xLSFZJL3JleGJSTHVrOGt2OUJNaHp0?=
 =?utf-8?B?TkdLVUhQNytpb00wNmp6QXVxcUhRd1BZVWl2Q2J1YWRmZ3hHZjdabzloOWpZ?=
 =?utf-8?B?bjFrVUJobHp5SUhPUm1WNEVpS3pXbWVqYUhFUTZ1NllCcDRLMUdmT2pabEVX?=
 =?utf-8?B?MnFQVlZVRlgxbGlqQTlKUnV3aEFIR3Vzb3lGLzc5NmRXekF5REJGWUNFcnBJ?=
 =?utf-8?B?NVA1QzZwaFZDblI0K0xML0pVMDd1WXVoamVyMEwraUQ1dXNNMjkzYWJNYVEw?=
 =?utf-8?B?cUduWTFRclFHVmpJY2tmdHNSZ3F5V0NMd2NhNDlGb3VGcnlXM3o5MlNPdW95?=
 =?utf-8?B?KzFOU0VkaDRoVTYvUjJSQUEwL1VKRGNuZDFrRVBSZmNyYXlEYkx5NEtYT2ow?=
 =?utf-8?B?UkZFYTZ2VGNTeUd5dEVha3lHQ3ZGczllSFkrV3lEOXFsVjBXNlgwRXRyOHVt?=
 =?utf-8?B?bTlaU2VSdzBMaEp2Y2pvUnBZWStkTXUvUDdWNExCUUp2dmk1enY4MWZVb0J3?=
 =?utf-8?B?M2s1bHA5clZIeDBzOUMyWnRqMElXMTRVd2JWZTV6ZVhOY0VCeHN5a1FnUndY?=
 =?utf-8?B?REdsMTVkM3VsTDA3YUtuUVFtMFp3ME12amdpa05tbXlWMDd3LzFOT1dRS21Z?=
 =?utf-8?B?RXVIUHZkL0ZDa3F5dGNVajIzQ0tKZWJCL1M5MGc3SXhLejVScDZlemh3Yzdk?=
 =?utf-8?B?cUxvYnhVVTNURUFNek9RZ1ltaG1jL2dmS2hYRnRUbEZzSXE1ZFRmZFNLQk5K?=
 =?utf-8?B?NWNhTW5GWWFZVk92MFdteUJ1RCtxdmIxYVhJN1ZYWXJ4T2NraFI2dVNUWDZq?=
 =?utf-8?B?cVE1a1ZJM2o2eUlMRjJ5SENXUjlUQXpnQmJyUUFIa0ppS0g1MzJiMXZpZUoz?=
 =?utf-8?B?Qk4yWUVGTGF0dGFuRDRaYzNKTE84bEc4amdKNTdYaFJSWlhtYWVIMkFlSjJ5?=
 =?utf-8?B?NHp4ZnJOV2t3OGZteG9nUjBPcHVZMkJEVmtseTZ4dzVXR0lxOXZzdXZNWlh1?=
 =?utf-8?B?Q29mNmVSWmJUNUt4WktZUGFJUkpvMklmT1RHUmZ4azIvN1RjN2dKRXg5Y1d6?=
 =?utf-8?B?RlM2ZE1aMTErU3Nnc2ljanJraWNqTlJTcGtSa1RCczVNZWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXpQWHQ4TDBuS1NKdW5BR1h5ajY4aXM3OXJueHU1RnorcGxjOWthM2RGZ2x2?=
 =?utf-8?B?UEhaTVQ4YVdTcTVpWTNjcy9BNWJvTHR6VHVCNVlMOEo1cDJmTXdicEJDVkoz?=
 =?utf-8?B?MlprWk9LbjE5aDZTZWFSaDZDYytXQVRlbDgwcXRGaGVJb2lNcWJTQWNiSVFB?=
 =?utf-8?B?R1I5aDdDSUEwcStiQklqZUlmNmNoZ0Z4SWtJNGt4SXZadmtBaDZ0c1BaK2Nr?=
 =?utf-8?B?WGx3SnltdjhaeE5QTHhKakdVTDd5SFdQbVhwcmhES0lLa2N6dnJab2o2WEVs?=
 =?utf-8?B?NEwwSGxPYXdRa2hpUHVYcEx0a3d1K05oMURhcDRsTHlUa3lGQTVwR3NnR0lx?=
 =?utf-8?B?anZLQ29rZE9ZN1FBS21kaGwwWXkzajg2dlNNTTNrUERWeWlNcUtybW9QSUhl?=
 =?utf-8?B?NkFiNjlNYUcvQlRsU25DdmNKZnFOSlJONng0TU93TkNmUFZuUDVmbVNDL2dy?=
 =?utf-8?B?RStnVE5HRGt5RENCdkNyZXFQMWh6K2ZNQ1d3OG54RnpCbU9PYURwOTA3UmVn?=
 =?utf-8?B?QVFOZEFzZFBGRVRGT0hGdGUzUmwyb1NHcUhPaFYwdTgwaDJQWGVjRXFXNHlx?=
 =?utf-8?B?UkJXODlFWW5od2JWdFYvTnpXUzhKZlMxT00xSnVKWG9mSENRSTBOVVdVWW5x?=
 =?utf-8?B?U3hmemxXWU1PVXBKNHhkUitBcXpISVdzMmpOL3dSVFIwTXV6Z052aXpXWnA4?=
 =?utf-8?B?UUdLWnBia09MVUloTDR1M00rS0xxTnBhT1JzR0RoNkJYRGVWaVh6TEFtWEE3?=
 =?utf-8?B?STFVeis1dWpWNWVsSFJ2MkxJNGhlWDhmSTV6TXN4SGtzaUZLUEIzcXR1c3Nj?=
 =?utf-8?B?ZjJac3hKMHQ1OC9acU1uYXV3aUVjbDZRTU50V1BOTm1ZaHdFL1ltRmhGS2x1?=
 =?utf-8?B?WEFxcER6L1ZoSHpLc2NlMGxqTkl1QzhUTmMvSXhsbHhoSnh0SklCV2t1MVBp?=
 =?utf-8?B?OVZjRjdjS1JuNFlBeTgydld3RmY3WHg5NERKVTh2NkpFNUFuM004OTZKTUxw?=
 =?utf-8?B?Yzl6Zjl4SGRNSmpLK2l1R3RzZm85U2VSdVNrT1JsQUdlbkhpdDN3QzhiTDlX?=
 =?utf-8?B?NTAwVW9DYTNpb2Q0OXhsV24zczJEMTNTVUxsMDFXN3VuZDNTZTdwZ0RJd0J3?=
 =?utf-8?B?cmsxNFlKSExUallQdktSNHJHMldGcHpyZmErYXVxaTQ1WUpUNWxxai9IWVRz?=
 =?utf-8?B?bitNNzFoSHI0azlialk5TFdOV3NtcDlzZWRFd014M0t3bElPRkVtZC83RWJH?=
 =?utf-8?B?UnJDUWNvajBZRzVSWisxc2s4c3Z2UU5ZNElEcVY4cGY5QVh5WndGNUVsdFZr?=
 =?utf-8?B?M2ptRmRibHhGMk9wN1hpRlZHOFRQc2ZHK0dtL0RIVkM3dWkrQUt6ei9ISVBL?=
 =?utf-8?B?NGp5SXhMeG04dldJeDRaUTVQVUpuNVVsVWZpVFgvaDViUTBqN3RLa25mMGJI?=
 =?utf-8?B?SndHcC90WGdsUXpzeTdORDRsZi9QTTBuQ0ZMbGNDRGhoN0c5SE5CMzMzeVR4?=
 =?utf-8?B?OEd0OHJmQzVMNGhjVHpNVk9adFk1S1F0UzV0eEpzSTNKRkM2UG1MTE44TGho?=
 =?utf-8?B?dExXOTVuSG5LWHBjK3ppRzM1bVozYm9MN2l6Y1ZNOTR5TXJyOWM2TGlhVUNH?=
 =?utf-8?B?Z3UxUUdYOFcyN3pJTWFmM0dVTGp2OE5tSHc0bmVoTnZXM0FJYzM5YmhIMXVO?=
 =?utf-8?B?RERDQnJTWWIvb3RNbXVFdE9OczZJMGlzYldWczRqWFROOFdrNlBGV3VEYTNJ?=
 =?utf-8?B?Wi8yQU9nNEJPcmpUaWVLOC96Nms4N0Qxc1JMTGtuNlRPNXF2S000T0FEaDhX?=
 =?utf-8?B?SVRxM2VZNlk3V090NExPV3NkM0k4T3MyZU0vaEJuZUFHanAzR01ZcDREMFpq?=
 =?utf-8?B?U1EybXAvbzJSMjU3eUVTeEIycS9Hb0dna29GdjFDR2RXOG9EbG5rZ1l2UTl5?=
 =?utf-8?B?NncxSmpCZjJObSs1UnhnanZMTUVMWWFjYjJ3WVFnQStqOFBHVE9xc0NlTndy?=
 =?utf-8?B?SjV3UnpjTEE5TFprT1BScC9QMDRvNFhNZTUxOTJvTy85N1ZpbGxwYkJlSGpt?=
 =?utf-8?B?dmdndXJwbnpKM2lOSmkva3E1dmRFQjY0UmlQbjJJL0RlTG5mamliMGNBSk9V?=
 =?utf-8?B?OFhQdjBjb0hPZktQWGpxekNZd1lZZWROMHhOQlRiaTBna2hISmJpcmZVdnVn?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c75654-ff55-4577-910a-08dcc5de195e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 14:48:07.8581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aPaGBl8XfO3Qvbnsrf8Y6iOFGiVGv4dJTNY8RH4fkF8SFOC9tEEYKcRzGtEwlN4eX/dqy0TzKpEjVnNfv5ZtY//owwZfWog+XFr8WFpBMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10637

SGkgTmlrbGFzIFPDtmRlcmx1bmQsDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMu
c29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAy
NiwgMjAyNCAzOjQ0IFBNDQo+IFN1YmplY3Q6IFtQQVRDSCB2MiA0LzZdIG1lZGlhOiByY2FyLWlz
cDogQWRkIGZhbWlseSBjb21wYXRpYmxlIGZvciBSLUNhciBHZW40IGZhbWlseQ0KPiANCj4gQWRk
IHRoZSBHZW40IGZhbWlseSBjb21wYXRpYmxlLiBUaGlzIHdpbGwgYmUgdXNlZCBpbnN0ZWFkIG9m
IGEgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgZm9yIHRoZSBuZXcNCj4gR2VuNCBTb0MgVjRNLiBU
d28gR2VuNCBib2FyZHMgKFYzVSBhbmQNCj4gVjRIKSBoYXZlIGFscmVhZHkgYmVlbiBhZGRlZCBw
cmlvciBhbmQgdGhlaXIgYmluZGluZ3MgbmVlZCB0byBiZSBrZXB0IGZvciBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xh
cy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+DQo+IC0tLQ0KPiAqIENoYW5nZXMgc2lu
Y2UgdjENCj4gLSBSZXdvcmtlZCB0byBhZGQgYSBmYW1pbHkgY29tcGF0aWJsZSBpbnN0ZWFkIG9m
IFY0TSBzcGVjaWZpYyBvbmUuDQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5l
c2FzL3JjYXItaXNwLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yY2Fy
LWlzcC5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3JjYXItaXNwLmMNCj4gaW5k
ZXggNDUxMmFjMzM4Y2E1Li42NTA0YzcwMjVhNDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vcmVuZXNhcy9yY2FyLWlzcC5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vcmVuZXNhcy9yY2FyLWlzcC5jDQo+IEBAIC00MjksOCArNDI5LDExIEBAIHN0YXRpYyBp
bnQgcmlzcF9wcm9iZV9yZXNvdXJjZXMoc3RydWN0IHJjYXJfaXNwICppc3AsICB9DQo+IA0KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmlzcF9vZl9pZF90YWJsZVtdID0gew0K
PiArCS8qIEtlZXAgdG8gYmUgY29tcGF0aWJsZSB3aXRoIG9sZCBEVFMgZmlsZXMuICovDQo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OWEwLWlzcCIgfSwNCj4gKwkvKiBLZWVwIHRv
IGJlIGNvbXBhdGlibGUgd2l0aCBvbGQgRFRTIGZpbGVzLiAqLw0KPiAgCXsgLmNvbXBhdGlibGUg
PSAicmVuZXNhcyxyOGE3NzlnMC1pc3AiIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHJjYXItZ2VuNC1pc3AiIH0sDQo+ICAJeyAvKiBzZW50aW5lbCAqLyB9LA0KDQpOaXQgcGljazoN
CiAgICBDb21tYSBjYW4gYmUgZHJvcHBlZCBmcm9tIGxhc3QgZW50cnkuDQoNCkNoZWVycywNCkJp
anUNCg0KPiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJpc3Bfb2ZfaWRfdGFibGUp
Ow0KPiAtLQ0KPiAyLjQ1LjINCj4gDQoNCg==

