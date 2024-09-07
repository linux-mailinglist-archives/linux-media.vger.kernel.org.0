Return-Path: <linux-media+bounces-17865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F5970092
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 09:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7961C21CB8
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 07:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0934314600C;
	Sat,  7 Sep 2024 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vz6v0kK2"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1241BC23;
	Sat,  7 Sep 2024 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725694111; cv=fail; b=kGRe9BTSqvcdhlZAGiX+WaHofUmIRqY49wqPmQ8COqRRPwLLdvlqm4EV0X1AGZXXsJj8bYHs9f7ze5gqZ8O6fq4dR0wzcmcg/TeTJccuLDrYGcnzGrMJy0gtLoWWoIUk3AoZ8cd2WFkrtn33dcynitks8vsM0BL+o0+DXC/u5Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725694111; c=relaxed/simple;
	bh=kyBAi9eoJUzz6jNYrDPDZ+DsnzxDirzi3MN96NHWFcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jWhwZcKxPk88t7zc23gWUGVSM6GKurI/8ciGeKa53O6BsH4x7YJGqTSPbabd4j7a7fFHE3bmsF2X4ip+tQdqXRu3Q3Xvg0DJsej8tMeStc+xKHG35gDavTX0ByM5S5AkhI+u0M9H2N/nGU3DkJ/+h/BtqNgb3aaADHavjc6onY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vz6v0kK2; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsB89Gcgfj7VQWRO9ItZRzTFItxnU/T8HlK12IRHVyimZP42jmuMTh7RiI0DTGfStO0NW+t0ZSl1Ww3jRwu2l7QfpS0jj+Vwa+U0U/rJNTfmZxiLH2YG44qcTVmTQj72g7S8n6CCgIpxrMAcWfL8qH3zYxQVgLd33FJawjS+gPY7csS6iQ6VGpbwmZmc9emMpf3jlhFp0f5YcflN6NRbptFIo5NgrRXved+FDf9/kP45BGsmiOxHlExmE7N+muRFt10yK1ypoHjZOkUcwVDitG2nEIb44eaNS7fM+9Z4wRyemZ+8B0fzlaPpyiel8gct7Rnkms6ZvU4AiHXIeHeL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyBAi9eoJUzz6jNYrDPDZ+DsnzxDirzi3MN96NHWFcg=;
 b=i+o1uK71MB0EbdeGNf44Q0IAcLzTvVaXtrHIHzWFEklT3tD3MNSwci3qItNgggxwdrGp8HQme3brTTTRwDhmWAoN9Pnq1BRu7pTUsB9hd0iYETva7IqLNeZh3LIM5YixkBOgHiaa1sjYVtiY0cssRuN1tTeDuSpMloeJEAk2gTEvYICPfmO16vgglhXCm1mfpnxRkR1/Ox1fy6Kayuu4BlAho1ImsiA5IgqynxA5NV7GQAurMZxGg96rCiei5xtcmgB3Mc/lIBfgGD9ZVvDfvXC+kXBFDyUN6eI28Lgwb7XW+Vklf3A37YxJQfFTXYlCKIun1Q0geu9rI7fUlfsWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyBAi9eoJUzz6jNYrDPDZ+DsnzxDirzi3MN96NHWFcg=;
 b=vz6v0kK2P2RiNdYr3VDDSs8FotNw5cDS9zztU0MgVosg6k8KQfDFFoYtIivV8ZCFG4hATmjKuiNxFgl/ndgaMezA/iG3szBu46yg2FQjPNu0YQfQkDotmaLDcLjQf+ATo9gPGLKBMpedd7g1XfsMxDGXX2ZLnqg8AA3ZMxD8RNQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8619.jpnprd01.prod.outlook.com (2603:1096:604:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Sat, 7 Sep
 2024 07:28:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 07:28:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Hien Huynh <hien.huynh.px@renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Fix the comment
 in rzg2l_cru_start_streaming_vq()
Thread-Topic: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Fix the comment
 in rzg2l_cru_start_streaming_vq()
Thread-Index: AQHa/4ZJc447+Zp78UiJ+EBqhiLfo7JLc/0AgAB6vNA=
Date: Sat, 7 Sep 2024 07:28:13 +0000
Message-ID:
 <TY3PR01MB1134601C75125427794EB493D869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240905112508.160560-1-biju.das.jz@bp.renesas.com>
 <20240907000434.GI27086@pendragon.ideasonboard.com>
In-Reply-To: <20240907000434.GI27086@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8619:EE_
x-ms-office365-filtering-correlation-id: 9a770d39-b2f9-4b60-e5b8-08dccf0ea25a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TW54aDFtKy9ZT0JTU21zWHgxNjl3WktlYWdQWG96cEZLdGRvcmhBZHdPRkw1?=
 =?utf-8?B?czk0T2Z0WTQvVmlkUjFCbm1iOCttc3JxaGxhSlRIOW5rbnd3YVorc2Y4SjRT?=
 =?utf-8?B?OXVWQXpKZllQNUFZWGFjNk85ZWUrWFFZWWdOS2ZrbzJUWnhRSG9QZVErMjcx?=
 =?utf-8?B?emtKM045U1lyMDFHMmpVZyswSGVxM29qY1pjUFZJTzZpRzBhSnZVbG96U1lz?=
 =?utf-8?B?Z2NoaUxna1pROXd5ZUVoN0J3emZtQTZCMExISGNqWVo0cDZPRmVYVVJ6ckVO?=
 =?utf-8?B?QlBrdThDam1LWFh3NVo1VFd3SkY4WWhXcWVEK3dwZjNrOEJlUW1CdXMwZTBY?=
 =?utf-8?B?OHJRNG11UWVpNzJyUlp2cW5VYTZ3OUErVGVFMXFlLzh5ZUR2Qkgvc2tNMnFW?=
 =?utf-8?B?S2xHTzdvQTNZNFhVQjJGYWtiMU5RelJJYXBEUXdJL0xjTk1DVmlCdXV6b2to?=
 =?utf-8?B?OGxoYVM3NnJyRXZ4UXF4ZlRNbUhjV1U3ckdRZFFzWDFqdTc1L3BRWnNXRXAw?=
 =?utf-8?B?RDMzcVBtYWxtc2xjVExQOURMN3lKb3lPRy8yY1ZkMFhmOUlDWGtvQlFGaFA2?=
 =?utf-8?B?Vkg0Y2FRZE1sQTYyay9GOGRRS0tOTGdnRVdFRFVNNGZ3YzE2OTFFYy9yVU1F?=
 =?utf-8?B?MUIwYWEzNnh3U0ExZUQvNmdTcVR0aERsUm9yUWhkaHR2d2tZbkdBcThCTEhE?=
 =?utf-8?B?cCtNaGVFeFNXeW1iR3g2QWFFNGxyUVRzT1FZckhDOThWd3B4UnNOVUtSYjBL?=
 =?utf-8?B?NVFyTlgwVHVNV0FnVElESTRaOS9SQ0k2REtHdFJSTW9CQ1lnOEVpRkMzbk94?=
 =?utf-8?B?TFFmak54ZC9McUw0cXRrc3A1Tzd0ZWRKckFVQXBOUzhLU1lMYnRDdWJGWmNy?=
 =?utf-8?B?cTIzRkpnLzhLcmJSYnRYMUZ1aDVqNHVNMjZORHR1bExXOG1LMGk3NHpFYnNW?=
 =?utf-8?B?bHBiS2VHSEt5NVl4MUlsYlJvNWI5UUtCSkdLK3gvc0I5dXpMK2lsbXVMTFVD?=
 =?utf-8?B?VlJkTkdnVnhucGU3RTJLSHN1a1A1SDBjRXdvbUo1K2JFS3g2ZEROcDg2TDdu?=
 =?utf-8?B?dzFHRkUvcHlHRjdzL3RHT0VUT2l3MlhTWjRueFVMRjRBY1pEQWsvZklMZnNp?=
 =?utf-8?B?eVBvZ1pnWnZ1Z2laRnJlU0RKVVpobCtaSCswM3pQdEpqWmlFYisvQmpBSFpW?=
 =?utf-8?B?S2lrMG9EVXNBUTFpSEJTWkxHUHVzckt0cFBFdnNXT3hrS0pJd3J4NHZMTHRa?=
 =?utf-8?B?WmpjVW40ZWNOQW0rNEp3VVd0WGQ5N3duM1BOd09QVE5WTEJIUjhhYVdBUEtQ?=
 =?utf-8?B?eTVsYUZ4SkVmWmZrVHVUTGNOMmNhNVJFTjNGOEdqTitLdkJsVkljbnZta0ly?=
 =?utf-8?B?Vm9GcnUvK081c1ZMUVBBTVJYYzBtQk9PZGFEZGhEemxzSU9DNndKdWZVSzI3?=
 =?utf-8?B?ZUF3QkVENjl0RHJKRDdRemJzd2JaVGdXQjlwdm1MSnZaUzRwVFBnWFVaWDlF?=
 =?utf-8?B?UmV6Y09wSmhZK1BPOEhrZ2duWGdoOE1CKzN1RkliZVBRTUNkYUd5SWdQY3pi?=
 =?utf-8?B?R25qdGlpSHBTSlM2R3hSUlBDWXZhMVR5TTNXK3Y3dUZsVXR1eFNxRkE2NFpa?=
 =?utf-8?B?OWE2QnhqN3FvK3o0My82MzhaQ2U4bWpXaSs0YnJHSS9pOFdRWEwycEVrcVpN?=
 =?utf-8?B?U0dXMXlxWk9Sc1RzdzlYZDdXQXJseU14S3Z1dmd6bllEbVRhN2lxZFBFeWh2?=
 =?utf-8?B?cGhUWTUwQ2NQcllqdno5ZlRZNzhLWk9IZmZlbW00c0tLeGpSM2k5TURmT3Nz?=
 =?utf-8?B?SDlpT29VRHg4bU40OFBvS1dLbTlBYS8vcUZwVmZqbTRKTEcwbXdrTmlKOWFa?=
 =?utf-8?B?NjJVK3c2Yks1NldVb0VoOVI5bS9US3Y5bzFENldMRUJvK2dxMXdrbGFMc051?=
 =?utf-8?Q?08qiFmDHt7c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDZaSEx1UFNmOGdWbnlwVHhyZCtYZU12MEhZMzBqNHc3aStvd01oVENBY3Ja?=
 =?utf-8?B?WGkzWTVMcVRUekJuaE9URmFQNVYvb3ZTOUxBbGpyd3VoUUZ3VGVtZ0UyQXRP?=
 =?utf-8?B?YTdFMFN2bWJJYmhQNjRXSlQ5dFlSdlo2dWpZampMcDc4aE9JUlBoS21DeDVS?=
 =?utf-8?B?K0tLN2pwQndVQTdDbk5ISXYzajdmQlN2U0RuMXVQbUFtSUVmY3orTFFHNUQ3?=
 =?utf-8?B?ZU8wLzNPdUZ0U3ZyQXp2dXpuU0ViZm44VG0rT0NEZzRaaE9FL0NUK1hrR2Jw?=
 =?utf-8?B?eGcxM2R4NGFoZzQwY3I0eTA5VHBSVHQvOTZ2c0tWd3k3bFlEaEF4VU5kTkRw?=
 =?utf-8?B?aFpYZ0tCV0hSWURBUnZQbDJDd2RmWE5HMm1lTUpSTDlDNjYxdlpodHdJYlRp?=
 =?utf-8?B?bzFxYkF0Q214czBzZU4zNVFiUjluTEF3N1BvbnF0dERPaEdrdDBRRW9wcGpJ?=
 =?utf-8?B?Qm9pUTY0K0l5cE9sZEUrWU16T2JVbytldG1EdngwMGQ4NDU1c3FGVEcySzNs?=
 =?utf-8?B?V3d0RUliY1NLeGR5Q0NJQldoT0ZIUkRHMG8xSzlqM3JqVjdiRDJNRzNvaHNP?=
 =?utf-8?B?dWRaRWZLQkVrQkNobmhPY010YllTeVJ1VzdyU2pUOWNiS3h0QmZmZEdtRkwv?=
 =?utf-8?B?b1dtdlczYWxldGZ3eWlrQVRZaXc1OGZsZU9Ybi9IWFZTUEpjRFV4VkpzcDJn?=
 =?utf-8?B?dW9qYnFMQmdBVDRXLzVJbFptNlZkWVVIaG91a014N3ZRTFR1aEQ1RG0wWE1z?=
 =?utf-8?B?THdxNFR4cVd5VUc4dVRlek5CRklxcXFqQ2JOemhNSXVjUVMrM2tzdno4QmYv?=
 =?utf-8?B?bmo1NUJNNW1ZQ2RIbnJqc3FtbGcvdC9KcENGZmVmems0Y3FRbWh0QU9Gdnls?=
 =?utf-8?B?VnM1c3Y1WkFNVFljeVQ3RkNiS28wdmlKSkV2dWtzSDJJMFY1T041TlhnakhT?=
 =?utf-8?B?MCtkSEg5b2NsNjlKT3ZyeGlnNUdNVU9LdVlmaGgzMzYzdGNEMFlZVWQxb2Q0?=
 =?utf-8?B?Qm1KS1dadEdxSWk0NU5kMGpIN0lHZUI2L1U5M3E4QWZRSEYvVm9PdG8yNzVV?=
 =?utf-8?B?dU1YRy9mVEZzMi9qd1cxQU81TEVuSHgwRnp2MW1sSGk1Z0tDRGpKWmkyM3Ft?=
 =?utf-8?B?WEFzWG50OEpQQktqYklHUWhoaVFEc0l4TzcvNk1Ed0lzSmVKaFlrRWdsREcv?=
 =?utf-8?B?SmZQN1hoVGdBWmFyVTZWeGFQdEptSHRkOXdsUndUOXRTeU4yVG02cW5XenpZ?=
 =?utf-8?B?Rlg2TXdJUUIwOHV3MHNtWGpZeXlydTdqV3ZHWGUrMzlkenJva1p6NVlvRkVn?=
 =?utf-8?B?VGROV090MXQ3YVovQ2pRN24xRnpJMjkvendaMlpzZVFFS05oWEUzKzRTZjFh?=
 =?utf-8?B?WWxya2s1VzdWYW41MTJrRXVvNENSWXB5K1YyeFY5R3N2VWhQRmRVT1JlQXdT?=
 =?utf-8?B?bkcwOWlwNWIrdmh5bUVKMXpLN0cwRHNhQ0RjK3ZBN0FGeXNnU0hLczBxN1pa?=
 =?utf-8?B?VFhLVE9rYmtib3k0MXdZN3dBQlVDcFZJbnlyZXdVRWNRUUdKL0I5Z0RTelZ2?=
 =?utf-8?B?T2tod3hBVmJrZGk5elMvQW9aZnFIQUxlK21HenNqU2dQWktCZWpGTUhLWnEw?=
 =?utf-8?B?WUhhd1g4S2Z6bjNaclZqR0lRM0swcGRrOGdpVmRtZEliRFBoTVpYODhZbmtB?=
 =?utf-8?B?aHVBUHNDenAvSmFhek5qZ1FMcXVXOUtNS3hoQ0hpanhVeG0rNCt3T2ZXR3BY?=
 =?utf-8?B?d3lCTDh5TnV3R2Y2Ym5SL2pDT042cnEyejJEcE1uVU9uakxpbTZwYUd1aUNi?=
 =?utf-8?B?dEJ5eXNDTFFKK1FwUEZVUlhESFdpVkJiejlFVjNBbkZucUtJYVk0VTNSdk9T?=
 =?utf-8?B?Q21VQmZRSHJieTM2R2o2QnhwOStvOE1UU0FmeGdROGVnL1VpZWUyZld5OU5o?=
 =?utf-8?B?MXd5K0FIdFZnMHh2T1ZmSEgyTXVhSWhSY3J3V1AvNjh1SEFaNnpTdjdQWWFP?=
 =?utf-8?B?Q1FjWitiem9FbzgxQVNxV21Nc2FtUjNhd1J2dmRZYVFZYUUvWUJaWUJCTXRa?=
 =?utf-8?B?OFVtaktHVFVXQ3hJaUVpdVhydUwwUU9nS2E1cVFtdGNvOUZCYWlLaHhmbWYz?=
 =?utf-8?Q?vZpisPPao8r50c3bD6cCM4evI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a770d39-b2f9-4b60-e5b8-08dccf0ea25a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2024 07:28:13.9683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYNNnzEG+vtX/vMAatwWHeKXfxJ6rCLo7AaqTclZA/3AkVfb9miSHvsmpyTKc7nfbepkyvOakRjduChlPBk1SfSokt09bWdWrMSIca9AELc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8619

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDcsIDIwMjQg
MTowNSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTogcGxhdGZvcm06IHJ6ZzJsLWNy
dTogcnpnMmwtdmlkZW86IEZpeCB0aGUgY29tbWVudCBpbg0KPiByemcybF9jcnVfc3RhcnRfc3Ry
ZWFtaW5nX3ZxKCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aC4NCj4gDQo+IE9uIFRodSwgU2VwIDA1LCAyMDI0IGF0IDEyOjI1OjA1UE0gKzAxMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IFJlcGxhY2UgImJ1ZmZlci4iIC0+ICJidWZmZXIiLCBmb3IgY29uc2lz
dGVuY3kgd2l0aCByZXN0IG9mIHRoZQ0KPiA+IGNvbW1lbnQgYmxvY2tzIGluIHJ6ZzJsX2NydV9z
dGFydF9zdHJlYW1pbmdfdnEoKS4NCj4gDQo+IEkgdXN1YWxseSBnbyB0aGUgb3RoZXIgd2F5IGFy
b3VuZCwgc2VudGVuY2VzIHNob3VsZCBlbmQgd2l0aCBhIHBlcmlvZC4NCj4gWW91IGNhbiBnbyBl
aXRoZXIgd2F5IGFzIGl0J3MgeW91ciBkcml2ZXIuDQoNCk9rLCBJIHdpbGwgc2VuZCBuZXh0IHZl
cnNpb24gd2l0aCBzZW50ZW5jZXMgZW5kIHdpdGggYSBwZXJpb2QuDQoNCkNoZWVycywNCkJpanUN
Cg0KPiANCj4gPiBSZXBvcnRlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZlbEBkZW54LmRlPg0KPiA+
IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1p0V05GdXc3MG5rQjM3RUtAZHVv
LnVjdy5jei8NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gVGhpcyBwYXRjaCBoYXZlIG1lcmdlIGRlcGVuZGVuY3kg
b24gWzFdIFsxXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDgyNjExMDc0
MC4yNzEyMTItMS1iaWp1LmRhcy5qekBicC5yZW4NCj4gPiBlc2FzLmNvbS8NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5j
IHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
cnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVu
ZXNhcy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+IGluZGV4IGJiZjQ2NzRmODg4ZC4uZDE3
ZTNlYWM0MTc3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNh
cy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+IEBAIC02NDgsNyArNjQ4LDcg
QEAgc3RhdGljIGludCByemcybF9jcnVfc3RhcnRfc3RyZWFtaW5nX3ZxKHN0cnVjdCB2YjJfcXVl
dWUgKnZxLCB1bnNpZ25lZCBpbnQgY291bnQNCj4gPiAgCQlnb3RvIGFzc2VydF9hcmVzZXRuOw0K
PiA+ICAJfQ0KPiA+DQo+ID4gLQkvKiBBbGxvY2F0ZSBzY3JhdGNoIGJ1ZmZlci4gKi8NCj4gPiAr
CS8qIEFsbG9jYXRlIHNjcmF0Y2ggYnVmZmVyICovDQo+ID4gIAljcnUtPnNjcmF0Y2ggPSBkbWFf
YWxsb2NfY29oZXJlbnQoY3J1LT5kZXYsIGNydS0+Zm9ybWF0LnNpemVpbWFnZSwNCj4gPiAgCQkJ
CQkgICZjcnUtPnNjcmF0Y2hfcGh5cywgR0ZQX0tFUk5FTCk7DQo+ID4gIAlpZiAoIWNydS0+c2Ny
YXRjaCkgew0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

