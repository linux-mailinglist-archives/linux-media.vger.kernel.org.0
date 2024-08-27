Return-Path: <linux-media+bounces-16919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC39608C4
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B14DFB230B7
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 11:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA601A0739;
	Tue, 27 Aug 2024 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a/ms7qol"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72DF1A0707;
	Tue, 27 Aug 2024 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758390; cv=fail; b=EQW287BfLaVCCfvnsyeOrZIrNCSJfzs8SBl8H7H7ktwbxnmQk2+rSrdNg/J9JSI6WhiDPUijQfVESZpHYO51fntp/KBPbPc/sONF004ZtE8o5ffuCofpIZK/ismwtzbuXNLykyQi5wsXjOFLzmSWi6H5goeuMfYdof52UgEvDxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758390; c=relaxed/simple;
	bh=DPjM0DLRc1aMH2TbuCyk0NoV1Dcn9f7e6OJ7UwutWCo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QwXR5kbzNg0l22xI0q6OO8nvtar9oxRg7uHhe8IZyvC0LaBBuUV1jjtWhlEi/d+v38d8d35XZc+X3AM4133Mib7N7mUO83bCyOdyLx8qS82oUo5SjmWAUF22at8U+liWxSoRz9asCLUad/iE7JZd8EarShFHGEFLYNFignYobRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a/ms7qol; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMzzPiHiP67WJFq4Ix6l9bHD3m/+jk2vDmWZpmt3e3+qKrbNUvIPWZio0opiRJgiB6CzWmVgBCrHyeH6OsWuFbRCCwvh+XoroX1f+XXo95q7X8K6/pEw8TRo+k35fToM6j9wLjzsS3qD91mbrKwjmX0985bUsx2oA3Ue2uKczoYCN7Ja3zsrDWO3SiTHiJ2d08ESOFA/iLaMzIqyYAlxKWVEQ8ehuNKnOR4G4TQNxsF/cUrRAHbmSjwmY1G9zAIIg23isJNQ96UX7e8frOM8bivuii8pshV5Br0xvMJymOLs0U9zfj8ZYbigF3uxkIOlQ0UK9SITyZw4vFr7vn9GGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPjM0DLRc1aMH2TbuCyk0NoV1Dcn9f7e6OJ7UwutWCo=;
 b=zHev3dRRPc9sr+KRh6l4bjNLuhmBjFdKCQO3vPyy2Wv9/LN8L2zfi1ATUPRZRKsIZXFRGyw5D2dD1b7vVHG3BNXNzlfzTGb8P2+ePcRYEupeKpmnmYfhbzHpfyYDr1NoBV3Yp+wyVBuNsBUHG79ki7EZSqzJr6PlQ8LI+WiDOtykxPZczfpzKkCw9NPYbrhPaMDfBAhQ0uCEMw8HLe7TerJlCalIBbmzgUQ+EoNWovC97vPNegpWa1bVP0BFne+l+MgUrRLcVWRTQWKBScW1/2l1nVsLABwLYOwZ6W9IoWJsXqgApv3jtiREO+IFTshi83926vzQY0D7/bmtMpGyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPjM0DLRc1aMH2TbuCyk0NoV1Dcn9f7e6OJ7UwutWCo=;
 b=a/ms7qolQ7kGs19iFoFrWm+m+nPive1ESPwiUeR2RPltgl8W4AwCV6YNETXtb17b2Xn7Qt+6o+dMnloyUJlzi0R6FquxW5ORCfDD+9exIz00Wge4xpTb3g0CjNxXCNIoxj4m9Bk7cfo3uEAZBD2f5qV8I23YH1v7GAmKgqJ3+so=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12332.jpnprd01.prod.outlook.com (2603:1096:405:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 11:33:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 11:32:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
 Gen4 family
Thread-Topic: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
 Gen4 family
Thread-Index: AQHa98aLBhHV4ZgAf0CXbLQtvdKTk7I5nggggAEkcgCAADa3kA==
Date: Tue, 27 Aug 2024 11:32:55 +0000
Message-ID:
 <TY3PR01MB113469AE85C026B65B7D0D8D686942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
 <TY3PR01MB11346E6810025CECA51A86B53868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240827081336.GF2636928@fsdn.se>
In-Reply-To: <20240827081336.GF2636928@fsdn.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12332:EE_
x-ms-office365-filtering-correlation-id: 60f9264d-e5a4-446a-199c-08dcc68bfedf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SnFvWHZkTEZ0czN1WDlvMnFWeDBIWTBuUWNzUWRoM2lXNkNtb2pTRkM4NUdE?=
 =?utf-8?B?emUwcElpMWN2aEhXM1FWaUQrRnU3Vno2Wnducm5pemIzTm9jSjNDaVA0M212?=
 =?utf-8?B?ckJFc1lNbFJVcnpyaFB5cmRSQk1tSHBWNFRHUWlMdmVBVUFuTWRvVFhMVnVT?=
 =?utf-8?B?Qy8yb2FxVCtzZWQvZkNWUkNDQlVXZ0VUZHNWM0lrWElMRGQvejRNVzR1b05k?=
 =?utf-8?B?QjJGUk9oTkpkUS9lZEdmTlEva3d5M2prTmx2UUNKOUxOYlB0azNqWFhYbUpk?=
 =?utf-8?B?Zkp6enh0ZzR3L0N3TnlxMmtKMXRxeWdtZVExSTJEYXpRNE0ySkluU1l2WFE5?=
 =?utf-8?B?ZThlY1FERVh4ajEvTVlQMU1ja0FDR2NKSHRsUXhyT0lzS3JSZFNGcGZIK1M4?=
 =?utf-8?B?RlVUWkZiVmMzMGFjcyszWi9ZRGJ0anRPd0toendYR1l2WUJGMWl4RGR6dDR3?=
 =?utf-8?B?ODRNVVUwbDBDUFh4aE0wTmFCdTd6T20rcy9LU3F1cDFtdHhnTFRUUGpkY2h3?=
 =?utf-8?B?cVc3ejJvTVBPNGtSckZrS0Jjcm82U0RhSnkwbWJiTXR0RTJhb1pwNEVJM0pG?=
 =?utf-8?B?a3B3VHQybzZxb0grVEdMRTJGcnJuZjhjdEtJd1d0RzdZQngwdk9SaHJCRStT?=
 =?utf-8?B?VDEvSld4SExKM2w0NGJQWVpSTWlqT2dnUjdlNUtaT0VhdEgwZjQ1THFuSStl?=
 =?utf-8?B?bEszRjFhNEFRYkxpRjV6d3AveHdpRW5zdjlDRTQzSnVQaDBwa2FraWkvTFNL?=
 =?utf-8?B?UnU4MTAzMU5FNTFLcGRPWlFGb2hBSDNIOTV3OWx6OXlnb1JDTXRYMEowaUlM?=
 =?utf-8?B?TVlDSERMSElLZUQrZ21NYi9UbUdoamU0UnRLaC9XcVlwWWF4OU9jT3FJbmJU?=
 =?utf-8?B?aS9TLzVmZW9hbkgwUHd6YmFTYzVSejVCaW04b1RNUU1aaHlHN2paQW0rM2RK?=
 =?utf-8?B?VFdIVzBHZlQwaitBN3Q3Zm5qZXdveWNsRTVPZHIzamV6Q1p5alFJb1JBeDlk?=
 =?utf-8?B?SUxXQ1VtSjJISnRqOFRPaVZGTmJrUFdIQ1ZLMUZta3k0NDlOWWh3Z2l5Tis5?=
 =?utf-8?B?NHlvNFIzR0NUbDFBM3lhejcyblVtL2VHSGFnMjhKRERaMGFoYVJ5c1lZS1ln?=
 =?utf-8?B?dit5RWxhbVZjamY4UUgyaVVKdHRpTy9GRjcrT2JFOWhNTDZZR2Y5eDZJeHdP?=
 =?utf-8?B?N2x3MDBvdzhDaUd4TXhZcnE4U2hLWUI5WWZNZ0dRcDhua2lXaGIrU1NZVm1T?=
 =?utf-8?B?d2ZxUVRFWEVFeEE0NDJUN3JkRzROVjVTQW4vN3dtYktjZy9tR0hYbFd0RWRK?=
 =?utf-8?B?ZEtDekNSdHBRTXAxUVRDRHZvSHp4dnpJbEtvZTZ5ZkhDSUdYU1VHbWduclR4?=
 =?utf-8?B?NG1meTZLMFlQTm8rL3BCUHQ0NmRWNFRqYTJKZytrMUVkYlNHY0Fta1VLMXZD?=
 =?utf-8?B?QXJJN0xVUXJtM3JTd1VvVXlSRWc0TkxWd1g2Ty96UHhwNUN6QjVqV2M2ZWIr?=
 =?utf-8?B?elpaT25pMXhJQ1l1Y1YzSTNEaVRYazVQS1E0QWJoY244WWJtMldRMWREbWpQ?=
 =?utf-8?B?eVN1enVJWGV1ZzU5N3ozTzBmT2ZWejE5eEE0ejVEZkVUMmozOW1XY21WM09W?=
 =?utf-8?B?amdrTURPSHVmSFRqYk9vdXlrS205a0VKaEs4dVo0Y0RraFVkYjZOZVV5T1M2?=
 =?utf-8?B?blh6VXlDeWZzMlhXWnBkK0k2RzUyV09IdTUyNGhNUnlBNkJPOTJZZ1Q4QVNp?=
 =?utf-8?B?R3RkSmtxS05nanY4Q2NEblZJeDNKTXpBZUxuRWp1Q3Z6WTdQS1pLYnNncm5N?=
 =?utf-8?B?UjZ2bk1IaFNsOFl6ZTZKTXd2bnRDM2Q2QXBGTHhnL05TaHhHT2I0Nmk2d2Yz?=
 =?utf-8?B?b2xkWUphWWx3YzJTNzBIbDdkK3pBeFc2UFpSSWhwZlJtdnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmFPTTFwR2puT1crdEp0K0pTVUdxcWo3WXZEcXVjaXVkSENrNkxsd1pEMjQ3?=
 =?utf-8?B?cnNXbEFPQVdZZno3R3A4MlFTNjdVTm5YU3VZQ0xCOG5uc2FoMXlvVXZjU2Fy?=
 =?utf-8?B?VFRBMERFemFWYmt6eXNBM1dsTEoyc1B3SHpPUXp2d3RaKzlmSThSd1U0bGF3?=
 =?utf-8?B?cW9sZU13QTh0KzFtWkpaTDlpTi9mbkJ6UTJYaDNMK1ljZG11QzRIN04xclFz?=
 =?utf-8?B?OVd6Q1E2UWQzQU9qT3kwS3BjVElNb1JlWitrZ2ZhMUxGdXgzc09CZVVOU3M4?=
 =?utf-8?B?SUJ2MGdZd2VFd0VqNE9wZFl2aE5CWFBEZjl1ampLVXBDTHdvM3FyVkozRlhB?=
 =?utf-8?B?STZuQ0FWV1lqRGZrTXpObHlyY3daY1l4dllGYkJOc3Fwby9UK3Y3d0pKQ2N2?=
 =?utf-8?B?WDV0SXN2Vk1XZEdhQlA0a1drUTdyQVBFVjRPTXRsRlJlOTd1QlBRaUlXUjNH?=
 =?utf-8?B?RkljUkw4bmg3OENQemdSKzZmM0I5dGx4L3YxL1VqazA3REwyL0dqdlMvbUJh?=
 =?utf-8?B?WFNYaVg2VGpxZGljNTJtak1WVnIrRnd0Z0k1TmV5amxKQVE1OU52WGtQMEww?=
 =?utf-8?B?YzY0SnJFTVhTV05CKzJ0SGI1Rnd6VFArZHhWZHRTWGdkTVE2MXBPd0F4VkhF?=
 =?utf-8?B?SHRtSHpleTRzLzZuMXpXWElndnBLYnQwSVIzQnExSHhucUNMUm5zS1NubUdF?=
 =?utf-8?B?ZTlEZXh3NVhJcjdyU3UzZWlRdWZpTDI4VlZvV01kdjVscGJ1QVJQS3NONi9J?=
 =?utf-8?B?MTJxbXExakFmZG1iN295cmdWUkowUEtvTHJLd00vaUpiMmxUYTVjNWczYTRz?=
 =?utf-8?B?amFMb3FiWllQZ2hLcW92ZmxTVWlKdVVwUzd0TjZ5STJDZ3ZldEoyUVpoTldt?=
 =?utf-8?B?OVRNamJNU3NFa3ZicWNvMDM2eUFFeVpuVTRjaWFsL2hPbTJIVUJZZThiUDE0?=
 =?utf-8?B?YjFlaldKaGlWUkJoVm1vUEpIUzJSV3d5WXROeTZnQ2NXakM0VUkwRzFsazhE?=
 =?utf-8?B?WmVTL09ycVpUb2puYnVYSHlSc1lYd09pd3U4cjVtZnhVNFVuU1BXMWwvakNN?=
 =?utf-8?B?dEcrRFhMQW1DVmZ0YWl1MDNHQnV0QTROdFNVYkNQYmRBYjI1N3hzbVMvNGpC?=
 =?utf-8?B?azNENlZ0cFd1MTRya3REaHArM2hadmRJTklDTTIzVWpTNUhjMXRVNHRKMXUw?=
 =?utf-8?B?N2l3ZzVIZ1lsU2JzM1lia3lFSE1MSnNsVG9ldnBNN1pab3ZYZU92cEZkZno1?=
 =?utf-8?B?TDA3MUliODBHQURTaGc2SHlGRkVWdHEvMUxCQ0Q4eUdqc1g5cG84OEljVDBh?=
 =?utf-8?B?dEpYRkl0em1pVmtkK2lvUEtjV1BjNnlWMWVPZ25kcmN3emg2T0RrNDBYMW9w?=
 =?utf-8?B?ZmtLVlZJYStRL0pKdkhVbXBQcVRQT0R0djVVY0VWempFamluZ3BJL2w2bDVi?=
 =?utf-8?B?SjJ4MkhmMEd5bjJuaUxQMzFKNEdRL25GZlFFUE5hbVJ6c01Hc2Z1OTV3dnNa?=
 =?utf-8?B?NzlaQmhOYU9yUUMrMmVxNXc4VjByR0J1MTRXMjZEL3hjZGFUcno5YkNBQ0tt?=
 =?utf-8?B?aGNyNU1KNyt4UzJEMHFpZW5CYjVaSzVjam91c3A1aXpnYVRaQUtyT0RydjFX?=
 =?utf-8?B?QlZmL0NKZDBCU2M1SWdRWm1LVjdLZ2dTaVJUUnhFbVh5TEttdlBVbnBKazdY?=
 =?utf-8?B?bFFjenhJdTlZTGJraElsWmxpam9YdDJsMjBBbGQrNmsrOEI0NFA2bUJQRml3?=
 =?utf-8?B?Z3FUd2NleWVONXNFSnVMVFJhdDdMRklTblF0WEhveGdVM1R1U2M1c2t4TTQw?=
 =?utf-8?B?QjVPSjhzWWlUejA3NkhHNHo5ditOcWdxdHkxdUhXRk0xdkRnVlJOdkJ2LzY4?=
 =?utf-8?B?N3dEbmJuUFhjNUUrb1FMNnlSZHlzMU9ralphRFdKcmEwMW5VbVlTQnNLRVVk?=
 =?utf-8?B?TVZlM2dYVE1aV2htTE9ZRGJWOTAycjRTOExTK2srK1BPNExqNFVDbkFBODhZ?=
 =?utf-8?B?VWo2WFlPZXFmWmNCNkhuK1BNYWcxNnhGYm5Xcy9ZWXZjaWI3czlnZU9KaWV5?=
 =?utf-8?B?UkFRRDdDYnVMeWJPK21nREpqeDRsQTl4K0dLcWM0S1NLSmRIdDhud01iMjNl?=
 =?utf-8?B?M0diSFhhZGFENjE0MUpNSzZVS1dUYlp1YzZXbzVlYTZqR2p0Z2F5Y1c1VkZI?=
 =?utf-8?B?VXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f9264d-e5a4-446a-199c-08dcc68bfedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 11:32:55.8016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sM9QJDoYFBiWy0eRu/odFeDfZI+IBUXaSckj+QPL/nWvVwqBOXDrr1Nc2CUreHdee1KmMy4glKTjQCucY6eC7l4HNxga/LFrB0enUbsd+EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12332

SGkgTmlrbGFzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pa2xh
cyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiBT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMjQgOToxNCBBTQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDQvNl0gbWVkaWE6IHJjYXItaXNwOiBBZGQgZmFtaWx5IGNvbXBhdGlibGUgZm9yIFIt
Q2FyIEdlbjQgZmFtaWx5DQo+IA0KPiBIZWxsbyBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IGZlZWRiYWNrLg0KPiANCj4gT24gMjAyNC0wOC0yNiAxNDo0ODowNyArMDAwMCwgQmlqdSBEYXMg
d3JvdGU6DQo+ID4gSGkgTmlrbGFzIFPDtmRlcmx1bmQsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRo
ZSBwYXRjaC4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZy
b206IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNo
LnNlPg0KPiA+ID4gU2VudDogTW9uZGF5LCBBdWd1c3QgMjYsIDIwMjQgMzo0NCBQTQ0KPiA+ID4g
U3ViamVjdDogW1BBVENIIHYyIDQvNl0gbWVkaWE6IHJjYXItaXNwOiBBZGQgZmFtaWx5IGNvbXBh
dGlibGUgZm9yDQo+ID4gPiBSLUNhciBHZW40IGZhbWlseQ0KPiA+ID4NCj4gPiA+IEFkZCB0aGUg
R2VuNCBmYW1pbHkgY29tcGF0aWJsZS4gVGhpcyB3aWxsIGJlIHVzZWQgaW5zdGVhZCBvZiBhIFNv
Qw0KPiA+ID4gc3BlY2lmaWMgY29tcGF0aWJsZSBmb3IgdGhlIG5ldw0KPiA+ID4gR2VuNCBTb0Mg
VjRNLiBUd28gR2VuNCBib2FyZHMgKFYzVSBhbmQNCj4gPiA+IFY0SCkgaGF2ZSBhbHJlYWR5IGJl
ZW4gYWRkZWQgcHJpb3IgYW5kIHRoZWlyIGJpbmRpbmdzIG5lZWQgdG8gYmUga2VwdCBmb3IgYmFj
a3dhcmQgY29tcGF0aWJpbGl0eS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaWtsYXMg
U8O2ZGVybHVuZA0KPiA+ID4gPG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+
DQo+ID4gPiAtLS0NCj4gPiA+ICogQ2hhbmdlcyBzaW5jZSB2MQ0KPiA+ID4gLSBSZXdvcmtlZCB0
byBhZGQgYSBmYW1pbHkgY29tcGF0aWJsZSBpbnN0ZWFkIG9mIFY0TSBzcGVjaWZpYyBvbmUuDQo+
ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci1pc3Au
YyB8IDMgKysrDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4N
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci1p
c3AuYw0KPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci1pc3AuYw0K
PiA+ID4gaW5kZXggNDUxMmFjMzM4Y2E1Li42NTA0YzcwMjVhNDAgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci1pc3AuYw0KPiA+ID4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3JjYXItaXNwLmMNCj4gPiA+IEBAIC00Mjks
OCArNDI5LDExIEBAIHN0YXRpYyBpbnQgcmlzcF9wcm9iZV9yZXNvdXJjZXMoc3RydWN0IHJjYXJf
aXNwDQo+ID4gPiAqaXNwLCAgfQ0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCByaXNwX29mX2lkX3RhYmxlW10gPSB7DQo+ID4gPiArCS8qIEtlZXAgdG8gYmUg
Y29tcGF0aWJsZSB3aXRoIG9sZCBEVFMgZmlsZXMuICovDQo+ID4gPiAgCXsgLmNvbXBhdGlibGUg
PSAicmVuZXNhcyxyOGE3NzlhMC1pc3AiIH0sDQo+ID4gPiArCS8qIEtlZXAgdG8gYmUgY29tcGF0
aWJsZSB3aXRoIG9sZCBEVFMgZmlsZXMuICovDQo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyOGE3NzlnMC1pc3AiIH0sDQo+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxy
Y2FyLWdlbjQtaXNwIiB9LA0KPiA+ID4gIAl7IC8qIHNlbnRpbmVsICovIH0sDQo+ID4NCj4gPiBO
aXQgcGljazoNCj4gPiAgICAgQ29tbWEgY2FuIGJlIGRyb3BwZWQgZnJvbSBsYXN0IGVudHJ5Lg0K
PiANCj4gSW5kZWVkIGl0IGNvdWxkIGJlIGRyb3BwZWQgZnJvbSB0aGUgInNlbnRpbmVsIiBlbnRy
eSwgYnV0IHRoYXQgd291bGQgYmUgYSBkaWZmZXJlbnQgcGF0Y2guDQoNCkFncmVlZCwgSXQgaXMg
YSBzZXBhcmF0ZSBwYXRjaC4gc2luY2UgeW91IGFyZSB0b3VjaGluZyB0aGlzIHBhcnQsSSBnb3Qg
c2ltaWxhciBjb21tZW50IA0KaW4gb25lIG9mIHBhdGNoZXMgYXMgInJlbW92aW5nIHRoZSB0cmFp
bGluZyBjb21tYSBpbiB0aGUgdGVybWluYXRvciBlbnRyeSBmb3IgdGhlIElEDQp0YWJsZSBtYWtp
bmcgY29kZSByb2J1c3QgYWdhaW5zdCAodGhlb3JldGljYWwpIG1pc3JlYmFzZXMgb3Igb3RoZXIN
CnNpbWlsYXIgdGhpbmdzIHdoZXJlIHRoZSBuZXcgZW50cnkgZ29lcyBfYWZ0ZXJfIHRoZSB0ZXJt
aW5hdGlvbiB3aXRob3V0DQp0aGUgY29tcGlsZXIgbm90aWNpbmcuIg0KDQpDaGVlcnMsDQpCaWp1
DQoNCj4gDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gQmlqdQ0KPiA+DQo+ID4gPiAgfTsNCj4gPiA+
ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCByaXNwX29mX2lkX3RhYmxlKTsNCj4gPiA+IC0tDQo+
ID4gPiAyLjQ1LjINCj4gPiA+DQo+ID4NCj4gDQo+IC0tDQo+IEtpbmQgUmVnYXJkcywNCj4gTmlr
bGFzIFPDtmRlcmx1bmQNCg==

