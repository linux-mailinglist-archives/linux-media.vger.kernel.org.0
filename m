Return-Path: <linux-media+bounces-27094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A042A46AB4
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 20:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A653C1889551
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 19:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A29237A3B;
	Wed, 26 Feb 2025 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="KwiFyR2o"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2123.outbound.protection.outlook.com [40.107.94.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931F021C9E9;
	Wed, 26 Feb 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740597341; cv=fail; b=HdnONR91drcX1ejdNlvqnQxsjhKNY8G7/EWuldHNxMn0J39lJty/YZK/6mNQAKjQh/MrOx3Jsrld/wAFBUC6i+7ufgfxzJA0YC3sjKaBL5Vc8SNRyJPng7uMhihp737URAm4BETXFuwNlpVvhIFQElrGljKDRLDTl/iBFFGe+f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740597341; c=relaxed/simple;
	bh=SXm37egNJyjgda1voguVq5n3/aF2/KzxTNq7xRQt5B0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=EtNohXDgGbmmoQaoVyNlejN+K+kMoWoDX+8EkkmTYfLhhWg/qYYbS9FqgwJc1OEdYtf1jWzLPYF9KxiSLSWnDfSWf/DshlY8HRC7imMn1zK9BSXZ5p3nm3t3iAE4Eflo02+xVGhPw8FO8OqfbX+qEyDNzOqfV6DGwbXxBy0aGWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=KwiFyR2o; arc=fail smtp.client-ip=40.107.94.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6ylw/Z0YDUKep/i1b60X/gYDOCxm+NIIV+gWWhTotqmCsfC53U7rwcHQlKCi9QVZanH4lQnv4Mve09eC5bm7tfMedGJqJ5f+dQBJsTOFo+mfatlk9qiEsHzsd9o1wtHj9PF0PlJY3cYulLZXhMYIe117QBu4RjV+eVv3TArPP7HvqgywCXHWl4J/t2+yls9+fFAqfMm0efNr+aOdOVX1pNVRln3a97oYtCvmZVo/VESwrns3dJ/UuDvmhNaEMjHPOndvNGG7AdBhAH2CS2qyUjDWUHwa3Er8UKZJ24v5AUsi+G8Z8LYil0RhY3NG4YnTNYNaZMecm7O6lpLZtB5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeYMeuIt7VVzMaAE5T0OdiUoEep12ZWLFfgC/iY+Pd4=;
 b=oN4ozX0+kYMY5/qR48hLV0EqfBe2Cckl8jQ4BkacTysk9Z2lHmqnaNliJvS8hcJDLqQw/6jPvntLLLEuryxoiEWjxjKn3Yu7CbTbJpBq5ozYxnWQEZD7mr1dH96HdyZkm9YoARm9EZPg3bclvydQREVAcsKSyef3sqkgrsnk2WFpa0Gl9c/TzS4yC2LeFvyv0bFNmx0hNf7B2bFImtrwF3fgSBxj5R2qhcRl/3NyvuDSJIM6p+NvZrjupb7uu7bmPcjpj0qf4RLFMyDrYocHjkPe4UTOcRdS4WmMt1pssybeQ9nU/gXYzlNh18xCdYWHvRg3j/9fHGGvUT5aqqVQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeYMeuIt7VVzMaAE5T0OdiUoEep12ZWLFfgC/iY+Pd4=;
 b=KwiFyR2oM5oYdfG2I9y6EQ1gpCu8iWJga/hjLcXmafu5vG38nRj9IBK/IfKy5V0etVj96kjzl9Tg5J3RTmLnoJ8I5/10NB7HAqf0WPfgevF8553XgHgEKYcCfiD50wNQrT/G3oH4cQqFMdvCT9zCmXer2RnQnB0KYl1K2KJITuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by BN8PR14MB3363.namprd14.prod.outlook.com (2603:10b6:408:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 19:15:35 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 19:15:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 14:15:31 -0500
Message-Id: <D82M9B99ZCKJ.1026ZH6ZP2CKF@d3embedded.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>
Cc: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Abel Vesa" <abel.vesa@linaro.org>, "Achath Vaishnav" <vaishnav.a@ti.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Benjamin Mugnier"
 <benjamin.mugnier@foss.st.com>, "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
 <ab2394be-fe1c-46c1-9940-53b4ee1afc5b@linaro.org>
In-Reply-To: <ab2394be-fe1c-46c1-9940-53b4ee1afc5b@linaro.org>
X-ClientProxiedBy: BL1PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::23) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|BN8PR14MB3363:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e50615-2a47-46bc-5327-08dd5699f15e
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NUkvQkZEOFlGaDFjSVZSK1BwMFNZWnVQY0hoT1lyV0szQWI3YWtSOUpBejBU?=
 =?utf-8?B?UGt1Q2NmbHQ2TVJ4OHRhalpLMWpubjFsNWhoVWFUdk5WWW1mdld0SDY5MVg3?=
 =?utf-8?B?eTY5TWZDSDlxRkgybHczMkRyb0FLMDBjT2hhdWtyNlAvZXVkTlNHZFA1OUJK?=
 =?utf-8?B?KzdabEIrQjdLZmNkUkcyblc3bXVZQk1QeDBCUW9EM04yckpYMkU3bFlSVGd4?=
 =?utf-8?B?STNleU9Vd2tNOFVUdXFlYUxhY1QwSXFjSmlDeFFPR1dPejFSa1RFaDJNbVBN?=
 =?utf-8?B?dk1sb0tobUwwSEtiTGZmS085RFpGZFA4dGZQVWwzMHJKZkVkRXJZVm1sOEgx?=
 =?utf-8?B?bE9IaDI0MGZ1Z1ZqYTJCRC9vK3VPMXFQNUNCWnpsYVMrZzRueHpvbmlIdzh4?=
 =?utf-8?B?QlROc0dmL3BNaVMvem9CYUJhWnplSlF0eDk2YjBUQ1JEOTNTQnFCTnNINnhh?=
 =?utf-8?B?RDE0Rnd3SzA0clE4TWxySWVQQ2tzTGUvVm1CV2h6MWwvSzR6RmVRWlMwaGUw?=
 =?utf-8?B?UnlhOUI3eXl0ay9GM3dRay9rMWxjY3lDeHJqVHJ0ZG5IV2RxT04zN1dKY1Ex?=
 =?utf-8?B?eUt5QjRuWG1NajltMEk2aHg3UWwxRlorOU5OUHV1YWNGdWZvLzc3M05HWSt5?=
 =?utf-8?B?K3VaaUpXMEtQaVpjZFNESjBRMW5KZ0U5N2dGVXVwRUdsS0M0Qk1RWm8rL3lD?=
 =?utf-8?B?dHArc2lzTlE2aThEN3dyTFRHdmg4bWw4WE4zN21YL09BU1V6M1JOY2hUd3hs?=
 =?utf-8?B?VGMwQy9obWFDeEdqWjVxVDBMU2o5YzdxeEFhYmRCYnJwT2NXUUd4K3FrQ1Jq?=
 =?utf-8?B?UW5oTzN1TDEvS0RzdTVYcDFIRWdDcnJmcThxOWVtM0ZTOGtwWGF1TmVqK09H?=
 =?utf-8?B?MDJKZHVkSG5mM2d3QThUek9nTmgvTHRvRHZWTDF1K0xJMGxTdmNhWnZsVVBO?=
 =?utf-8?B?NFlnb3ljVGk0b09MdlJjMlJMUzZ6ZGQ2Mm9IQmlDQnlqUGdNb3dGdGthZjFJ?=
 =?utf-8?B?UG1LQ29YU3VBOVI0Q25YQU5ZTUZqYXdXR2hKR0dpajloZWtZN0ZHekVhU1V4?=
 =?utf-8?B?MGZKdm1GWGl5VnUzQVZoRWZmSFpBVjhyTDN4Rkw4aEgwTjVwb3VYZ3FZdDd6?=
 =?utf-8?B?c1FLYmpBYitGSUhVdEgwbVJUc3Ixbmg5amh0dXc1bm1pVjJEcFhyMEs5eDcv?=
 =?utf-8?B?aXhpanRFUzkxUDJXR3k1d2R5L1ZFOXZ2Z3FOTjBkVzNvcFBTWXVUUmJacjNL?=
 =?utf-8?B?NmtPZ0MwZjlWRlRUSjNhMjBZYWg3SW9TNzFSeWFSbzRZOUdVWDBoVkpSNHQw?=
 =?utf-8?B?RnNSSkIvY3NKQnlPUkNNc3FuNTJLZVBGLzZXQW56ZUdJOXZNVWJSVjVjNzkw?=
 =?utf-8?B?aStFWHhwN0E1dmk1cm54dzlzckRKaUdSNW9DQmZqVkxsVmkyNUQreTNEVzY3?=
 =?utf-8?B?aTVRYXFSV0o5TGFEUzE3Y0h2dHZ0RmlYNkRDYVNJZWlUZVpOUVlRbjRGTzhH?=
 =?utf-8?B?K3lvbWFSN3gyRngyS082TS83RGpBTEhUNFd3YkZLaGNVWGtCejVVY2o5Z29M?=
 =?utf-8?B?VERNTWxDV09ncHdpVGYwVDhjeGVXanN3OExCOVNEUDlEM0V4WHEvMTRXUVBl?=
 =?utf-8?B?OGsyYjhzYVNaUTNTNWs0YUovelNUMVUzSC9nbGJvSFkzbi8zc0dGcDBCczRu?=
 =?utf-8?B?TGZxcVAwcHVCOUQwZllyQkdBM2E4QmhIMU9DcEE1eEtzWFdHWEtZWkEwTDJm?=
 =?utf-8?B?bzM5Uk9JaHc4Z3JHeW8vTUNIQjNFYTI5RHRPQjVKeEJoYkRYS2ptZVlOSVZV?=
 =?utf-8?B?YS95K3ZqTjBZMVpKZW5oMmU2YXVrTERpSW9pVFRJSTg0cFR0VEhkWXdxcFF3?=
 =?utf-8?Q?mCg6WzXq2Jg8o?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VUhDSTF3aUgwQkxsbWtoN016RUt6Zjc0MEJsdWs4b3VqNDhqaFBOcHlRak0y?=
 =?utf-8?B?dmFXb2tOWmcxd2FvUXV5RFN4anc2UGJRWlVSYk1lcHR2Q25oTm9MRmtXSFo1?=
 =?utf-8?B?NmZxSVZscTNML1BsUTR3dkpnaUl1ai9TeHJjNVh4RHlhWnRxMkZIZUlmNjN0?=
 =?utf-8?B?NE9qWERPQnFMcitPOC9VNGJOajllMHdQN1R5MW5rTE91Yjh6ODdaYmVRSTZz?=
 =?utf-8?B?YmNYc3lOSGRJNDZHMGF2aTgwVnZSZTJvbWswRWorSCszaGlEVjRncjlzdmla?=
 =?utf-8?B?dnRJVWV2aVUvWUQwbDFmUzVkWElXUEQ5R0FYMjl6UTYxM0tHZUlxMDBlOWhK?=
 =?utf-8?B?MC9mOEUyN3I5SWcxMXNFZFB4aHF2d2I3aTliTzlEd1AyQ2QyVDZPWVZCdjN5?=
 =?utf-8?B?cmF6Ukl6U1pQS2tlN25wZ3VBRWVMM08rcENsOGlFcjNqWG9KOERPb0JiVGZj?=
 =?utf-8?B?NVE1eCs4N2JKdFlsYm5KdnVZaUVwUXI4ZnI0ZEg0czROMm9Ec3VQT1EycTk2?=
 =?utf-8?B?RjUzaHZLTzFIYlA3K1lJZEs3OCt4ZFNzRCtSNnN1SXFWL1hpRlc2V0Z4SXZu?=
 =?utf-8?B?WlFjRDFEa2F5ZTl0T1p3aTl4bkN0QkMwZndsZis2eWM4RUdwVGFlR1Q4akl0?=
 =?utf-8?B?emlUQ2Z1S0YvWkl2VEEzZkpYc2g3bTJoZklUays1THVUKzh6dExta2VRcjJP?=
 =?utf-8?B?UzhhcFdjNjRlSVVubGRJNWZZaXphSDY4eU41YVdrRk1KRVpqWWl1L0dEbXBV?=
 =?utf-8?B?aW82YVZlZ1RLWHB0T20zaER2NGdJQVViM095aHBYOEdQZDBHQ2FkVldmQU9r?=
 =?utf-8?B?V3YzSVFCVmZpaEdJQmRXYjVBQ1pKYklYZm9FQ2llbVFUTGR5emJLVmFEV3pr?=
 =?utf-8?B?UUgvWFZHOW1CSk13UkQ4UHZhaklpTFN2SERCYldScjFDeFhyNm1LVGx1ajhl?=
 =?utf-8?B?OEI1azZlTVR1a2dneWNIbDF2V0xGMHc4cnVCOHdsUFp1dktuRjk1TFJWVEFF?=
 =?utf-8?B?NnRqZkZnUVhFVFo1VUdUdEVsc0VaK3p6N2FyRmhTaCt3YkpWOEphZnpFYTN2?=
 =?utf-8?B?cXBUTU9XYThiRTRSWmRtM0NUVmkxdHg5eEJISW82TFMwM1FnR0wvRU43YklI?=
 =?utf-8?B?RFBGWmo2dHVOeXVwMGNNeGVsVlVXbEpsakduSldaWkxkZGpVMEFZVkZWTGNv?=
 =?utf-8?B?b3pqZnJockszd1M1ZlB6czdBKzhqREhSanV5NWlMQWdXbi90WUM1QWJmclFo?=
 =?utf-8?B?dU9WdjI1OTJxSE92WjVHT0Z4Z0dTZWFJUTBnUFZMR09aUXFIWFIzNWIvb3g4?=
 =?utf-8?B?Z1QyUTVYYXVrWGd2dVFJSXlaaFBKaEMvWnJZNHE4bGNzNWdJbU43bVJaSEts?=
 =?utf-8?B?SkFndVJHM3pYMWgwcmlXaDR1elBsNHJyUCtjcWoxT3hUOE9UZ2wyZkptTFUv?=
 =?utf-8?B?MkhpMWU1SFI2QTBNUlhYR2tkLzluMkh4MExEM2hNVGRQUC9wY1h3cDJBVjlk?=
 =?utf-8?B?TGdSOXlROVc0bXlUVEJmcWt2RmFTWERLVytFRjBBSnhXMDJTQ2xmWkd2b3Zh?=
 =?utf-8?B?elg5VmRjRTBRbGQvZllJMjR2bmJjQllNaTZMblVXdk4vdXp5a3pyN2xzTEdS?=
 =?utf-8?B?amsrT29ESG1KVGdwdWhuVWFzM3NaemQ1SEc5TER3QzlVTUhZbE1kOStRZG1l?=
 =?utf-8?B?czVIOWpwc200VzgzNmpHdkJwK1kyekxYRzQ1dER6eGpxTXdxNFJ6L1l3a2Yv?=
 =?utf-8?B?U0hSMjhEY0h0bUYvSkswSGM4Z0hxaVFUb1pBenN2Mk0ra0xWQTVIaGZXWkp2?=
 =?utf-8?B?ampjY2ErdlNqTjJMVWk4V3R2VUgrTnYvQnpiR3BYZkNQandZcUxZRG52bmo0?=
 =?utf-8?B?elN1cDhZT1BVWGkwTDBaVUJIb1dQNTZzcWJNajZJUzJrRmlTTk9wRERIbXk0?=
 =?utf-8?B?Rm9zZ3Z4MXdlbkd0cDBzTHhyZzJEbjRObVZ5aHFOalptYVFvNllqdEFvV1Nr?=
 =?utf-8?B?WXVBRDVFMXBycWtNWUtESlJYZWtEZ0hkSnpTdkd3YnQ2eTI4ZTdLT2pzSXpE?=
 =?utf-8?B?UUovNEhOTmRlaERvS2I0WG5SZkdSNWx2b2w2bVBxbncwUUV2M2taeGtzSWtj?=
 =?utf-8?Q?C7IUhFuOUIVTYZ74j0Ti1oPFw?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e50615-2a47-46bc-5327-08dd5699f15e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 19:15:33.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDHlgkQ7huXOitIJ9W00/S1cMV4vgpyral/huWKnUuW4v8c83Pz7jZWQeBHgJTSFEjnVcdk73dGSK41/dSrKcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR14MB3363

On Wed Feb 12, 2025 at 3:07 PM EST, Krzysztof Kozlowski wrote:
> On 12/02/2025 20:56, Sebastian LaVine wrote:
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Specifier for the GPIO connected to the XCLR (System Reset) pin.
>
> s/Specifier for the GPIO connected to the//
> But you could say that it is active low, for example.
>
>> +
>> +  error0-gpios:
>> +    maxItems: 1
>> +    description:
>> +      Specifier for the GPIO connected to the XWRN pin.
>
> The same.
>

Thanks, I'll make this change in v4.

>>
>> ...
>>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        clock-frequency =3D <400000>;
>
> Drop, not really relevant.

Ack, I'll remove in v4.

>>
>> ...
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 575f0e6f0532..50bff3558d7d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21885,6 +21885,12 @@ T:     git git://linuxtv.org/media.git
>>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>>  F:     drivers/media/i2c/imx415.c
>>
>> +SONY IMX728 SENSOR DRIVER
>> +M:     Stuart Burtner <sburtner@d3embedded.com>
>> +L:     linux-media@vger.kernel.org
>> +S:     Odd Fixes
>
>
> Hm, why only odd fixes? If you don't care about driver, we also kind of
> might not care and remove it soon.
>

Understood -- we've discussed this and Stuart will be able to commit to
"Maintained" status going forward. I'll update this for v4.

>
> ...
>
> Obviously. Please drop it. You can use b4 relay if you need to escape
> corporate junk.
>

Sorry about that. I can look into using `b4 relay` going forward to
prevent that message from being added to patches. Unfortunately I'm not
sure of a way to remove it from my normal mail (like this message).

Thanks,

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

