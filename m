Return-Path: <linux-media+bounces-27101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E33CCA46DFE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 23:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9BFB3AD743
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 22:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20011269806;
	Wed, 26 Feb 2025 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="e6WvRyGh"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2139.outbound.protection.outlook.com [40.107.244.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBF225402;
	Wed, 26 Feb 2025 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607223; cv=fail; b=Hli0NhJFAZwxNJedu/lRkxymXmvIhNQxWu5FS5cYcp1XxUtZ1vvjRZFG1DdediEBXUQZsoaj8CFS7C4GrinC8vVl4Hf9xA67Dl53lhT1SXHtkC0tF/LWHN80lO644xVSffFuSviTBs0UoxvcZNlHlMBbUN7rLwTbUR0MAeErCFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607223; c=relaxed/simple;
	bh=LUrutgQzFmoGHCU+RYGu7x3QlA2cOqh+IY+1Knuft4k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=F3koYLOlYABxxf6EFTSo1b6QxV11nON5cUi6OTN4IK6movJjhpalSKkgC/aEJULlJrlGn06hPWI4iHdsI3Z9jLC/ozpY+B76a+xNX8YY8U381plkonhf+5S5TeuHHGhEMZkQRWWEMEa6U0l8kteXaTMPq6GqbnxFb9h4c5FeiVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=e6WvRyGh; arc=fail smtp.client-ip=40.107.244.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryel/WsYlNA995NzdZOv9vmToRkqDrfkOlXKo7n5+TJECSINajSuJqcUcq2E1frByiKvUvSC0u5TetRhiLJFmGJRhJhjCbkIp5ArXdB8y0G9FEsBcfa5a8lw014eUyC/i0ZPfrKcqwR3YGJDZnL2CBY6Z0OHZfEOtcw3u6BKBXIgxf8U98A4GWRzNqQJ9xHMNLyXTlatFA4+3OAZx9FR8GMTPDkldOD0U1E6XZlujfJh1bEIjTYYKw2nyuzKVWqdSsU3el3D9Q4LJPFndvOUpRgUuGgAwR8iQEo3zD+pBEMbXnrRQcrENwveoBHwaSn2EtyJfTWHxSfVni5GB8TF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW/Woo6c5agD4xv+d70qR/lBa9GUBJASAd11Fcu2+gE=;
 b=xx0AKew4PcjyMC2SFKT9/z8fgmOneHdDjKWHWvzuu1vI+S8by6VQora4amQwvJo+wAIhu9X8HsNZiM5cjGoF9f6DP76xuv2YziQRoo+d+BKn/Fk21a3+4V2k3l1YhCaD3MGXc27IEqPim4j0D/fhrR+EQ7I9qS/3GNtUGInE6PjPelZOIunAgKVJNDG1nuCfgem5PwQFtEN0gLVczdoCrhIOTk0kgY1kmhNO9PTZIqgW5PvMAKJIcsLXtfHKPacyYf7Caziqlo3h0kBtxwFoUwAmLeBl6WM6J3iZ6+9c1PG2aX7KCtz47u5glW/hAnbt5+E7ZOZmnOjYS4h2i9ZEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW/Woo6c5agD4xv+d70qR/lBa9GUBJASAd11Fcu2+gE=;
 b=e6WvRyGhUlVfrFsDrrfZPr2XgsBuUsTuu1X57AJZR5ZBV2RhEFR1tERf6A21QooGUfmNDde4Oabfc46QjzjJddMaW6/hQsYqm5b9PP2+97MaYo6m3V0pcXRskzLP5X3JxSximfjOpWHHq4YB/LiU1y4T1cRo1IDs6u0PzMm5aKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by BL0PR14MB3796.namprd14.prod.outlook.com (2603:10b6:208:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 22:00:19 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 22:00:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 17:00:16 -0500
Message-Id: <D82PRG5YKVY3.2LA5FS553O91J@d3embedded.com>
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
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for
 fusion 2 board
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
 <83f805b2-afa7-4939-87c5-840d9aaf2443@linaro.org>
In-Reply-To: <83f805b2-afa7-4939-87c5-840d9aaf2443@linaro.org>
X-ClientProxiedBy: CH5P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::17) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|BL0PR14MB3796:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ecf52b-7fba-4e22-c48a-08dd56b0f5b7
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Wm9NU29KcEFyMFJyWkJsL1RzSUF4TFQyZy91cGtBcW1DYS9PWTNqcCtRMWdQ?=
 =?utf-8?B?dnh1aXg5dzJveUpvZWRYLzRqSUgyeVZmR2E3cWJjYVBqbmdjRG9GK2lmRzh1?=
 =?utf-8?B?QWpDRlZVUVRZcWdjTVN1UmhQb1JhaG82dW5XRS91V2ZMakl2VWpNTlN6bnJY?=
 =?utf-8?B?S3lKR0RGQlFiakpoSW9DeXdoak1LaUpsM0VUOWFMZVdLNDJEN1lYMEUyNEp6?=
 =?utf-8?B?bCttckNmR3JlVzFDamp1aGxoalNER2ZDSk0yR3NLUGVIVURCK1VLK0JoOVFO?=
 =?utf-8?B?WWZ5UjBIQWZPZEcvdzhxTFgyaDM3dmJ6WHNpS2d4ZElBQURVNXRNSmR4Uzk0?=
 =?utf-8?B?emRIVGNGZGpUeHF4OG1ZTzNuRGZNQkN2bnlUR2VaZC9ia3dSY0pIVzI5Q2tm?=
 =?utf-8?B?RVlCbzA2TDB3Z2F6Rjd0ZVpHZzNyd2tERUtmNWdIQmc4Y0ZVcEhrTHpxZ1cy?=
 =?utf-8?B?bzBVcWVIZEh4b2M2RXJNTDRNaXZaL1V6NEZ6aXAvQ0h3QXZCQUJVa1REU0Fj?=
 =?utf-8?B?OHRrTEk1aGYyKzFkOFQzRGFqUmk3bVZrSHRSNFpqdUh1dnR0YU1nenJ3ZGIr?=
 =?utf-8?B?YlozenpvN2xkaGYzQWpPc282eFR5MTJuODZhQmZxMm16WE9TU1dPci9HVGQ4?=
 =?utf-8?B?UTk3RWVZN0NvWW9ZWjZFbkZlMWpNakRlOHJNR3dDK3l3NnEyK0ppTE8yOUZR?=
 =?utf-8?B?b3hsK29QSkdMbGxOVzRyKzgwWkc1TGpncElhQWlkVitCaHNiYWNnZ2h1OXZ1?=
 =?utf-8?B?Ylh2SHhkNTRpWVpBbTJjTVUwaGVUR0dsS3dzeWJoSGQvYVUrOS9rS3dwS2JS?=
 =?utf-8?B?QjYwOERaenVuVFpUeUdmYllmbHIxNForNStvNEVKNisyVWRyR3RqMkg5QWRa?=
 =?utf-8?B?SkpMUUhva3dzQ2pNTWZaUjRCcEVhekZKdnBUVUxtVWlUWmxiK3pxTU5mWW8y?=
 =?utf-8?B?amJBNEF1VnpEaTNkaTFQZll6a3MydWJKQ3d3c2FnR1d4TmhGOGc1Zk4zVUNy?=
 =?utf-8?B?WEVFRy9BTUM4Qi9SVWdIY2JIUm5EdVlGajlZQzNZOUdIVnNZWVlmNGFOekNH?=
 =?utf-8?B?ZlhhV1VNOHhSaFdNSFUyaUo5OWpxUEhGT0dNZEN1emxyWDExWEpCaUU5SUJM?=
 =?utf-8?B?MTFySDFxMUthZzhCeUtKLzhpZW0ycVdiVWNSQmJQVVNuU1ZMem9YdTBSeHFM?=
 =?utf-8?B?bFdXMm9IMHh6bkwzcUY0Nk9XSjhCdW9vZXZmV0VnWlV1ZEd3NjZ3WkRkekVV?=
 =?utf-8?B?d1VDZTNrM1E3TGh2VnlUUXhuTHljNUJpMUZnN0ZxN29pazZLT0kwQjFiVG93?=
 =?utf-8?B?ejZpY0M1T0tNbmZHRlhFME5VdkFXSlNhL1NsWDJ6MmNnSC9xb3dQaHBxZ2Uy?=
 =?utf-8?B?QktzY3UySDh2alN0cis4MUN3NnR0cWl5OTA0ekp6YWNrYnI1QzNRWWY2ZmlH?=
 =?utf-8?B?bkhMWG5wbFJBcmdwVllIeDltaUZaa0xSYU50T1cza0tML1lpbS9PQjNoVmFY?=
 =?utf-8?B?VmhQQks4UDRSZHdCS0FKdUNyUVh4SSthMnJYSWYzdGJUSlJEZW9BMDUxQmQv?=
 =?utf-8?B?T25TSjg0MXRSR2tvWmVkU0JuWFRreERnaXZmL3JJYytNcVpaTm5hQUxnbVNF?=
 =?utf-8?B?elpCalNMVWV1NUZDeGp1VXl2SWV6K0YrNm5aUWlWUkI5L1gyeElJUWJJNng0?=
 =?utf-8?B?K0kza0x0RVIyS2RyZ3lYNWx3OGg5YzJtTEJSUTd1L1dDNVViNGw3aEY2eFIv?=
 =?utf-8?B?V1lES0xwZW13aGppN0d2dW9YVWFXRVowc3pmOS80WTBpYzFyTzFvQUM5WUVP?=
 =?utf-8?B?UlU2RUFBazNJT2VLdGw0R2NFd1lMNkFYWEFQeFliMVNtV2tHdElUenlYRTFG?=
 =?utf-8?Q?jBu1rgtYEpSWa?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YnVJbXVMMkpOTEJ6MWtZYVp6YTFackI2RmhTcTRZSWxYZUlyUjhQZFhEOU1L?=
 =?utf-8?B?OVBYWXM4ZGRFUEF2dVNsaHQxS3pneEcwcWhBcXUzaS9MOTVTeXdLWDhQTzhp?=
 =?utf-8?B?VGJ2TmdXUkVaQTA2dDFUQkk2RmkxeENNc3pTL1VQa1o1SERNdUxOV1ZmS3Fz?=
 =?utf-8?B?TkloNGRDdWQ1V3MxbTJqdjdUWXd6TjVDeDVhbzR1U0JwbVpGWFFsZHFVUnQ3?=
 =?utf-8?B?eHFiT0RGcFNOZ0lka2xFVWhoNkFXRjNKS0cwZnR1aWlBOXBHbmNnVENqeG5F?=
 =?utf-8?B?SjlVN2poZGorNDU5UmtLdVBGNWt4UjBBZks1aUlJSWtRamNwSHh4bHNxOXZK?=
 =?utf-8?B?aVF1NE1pMGRVTi9qSzBkYVFpdEZtcTJzKzZsT0hoaXRYaW5WOGRSUnlQdDRm?=
 =?utf-8?B?RjlYYStJeitSaTJFMTVVVno2NlYwTEx6VUlaZ1hxaXBDdUhzUUxrZ2x3YXZM?=
 =?utf-8?B?eTdaOVJQWVpVc0xHRk9BRVd4VWgwS2JiVHNKZ0xHYVIwazVValRwbC9nT1VE?=
 =?utf-8?B?Y24wRjdGamJIaFlTK094Z1hJL1QyUWJVNVRHcUc2dDVUa3B3TlVhQW9DOU5O?=
 =?utf-8?B?TzM5WGNlbUtLREtaNGZVLy8xUnQwRysrTmZHMHRDRWFpc29YTnNRMGw0bmkx?=
 =?utf-8?B?dXhUQ1YwaUxhenJBNkxXYXZObXpWc3NYcnNWZldaOC9kVElub2NGZTVYR2wr?=
 =?utf-8?B?M1RkZ0h5MTJFR080ekpTdGFEbjhUVjdscFU4UXFHZGtoWTBvWDQvWXZaUGp1?=
 =?utf-8?B?aUYrRk54VzZoNENwZFkwTG54ZWVUVmQzMHVZL1AwMW9UV3RlVmRzTitKNTRs?=
 =?utf-8?B?Y2pnMTRZOTRwZGhOV2o5QXdDQ041ZHhHZjl4VCtGM09vMWVjemhDeXVjc0h3?=
 =?utf-8?B?K1JnbVdRSkhRSldhRWhLU3FnYnllQTNaMnF0K2pnUDJMcEk0ZTdlSjFIbWNH?=
 =?utf-8?B?ZDlkNEpRQmtBY3N5SkxDT2UxZWEzUjdNUzhVek01bDFOK3IvWENkVmVVUVhC?=
 =?utf-8?B?bmE0eHpuTjh3TTcvWjJ2RGp5UldjdytkdkN0aTlPTWNlSWFFRWErcTNHbXZw?=
 =?utf-8?B?a05KTlRtcjVIVmc3d1lxRFdlcmdGQjI0QWdLckMyUHhNSGRBVWNHZ2s2M01U?=
 =?utf-8?B?Nzh3OCtoV05pSTdiMGhnSDVDZXBEL3pYOU1zVHg4ZnV0NExMY2phWldkSC96?=
 =?utf-8?B?ZlBMbkxIbVJ3SVpVMXU0cG5ac0RpaTZETnlqYmVNOTY3c1VpTGJQdHBnWnJU?=
 =?utf-8?B?VXJvTk44dDdKMnZITkU5aVEwcFV1a0FTNHVwUGZCUUU3YjE4RFVlUU8xZE9J?=
 =?utf-8?B?ekxzYmVZL1B2bXdWeUxYbUZXa0txMXlqMjdaWWRRVzNpVTNNTjJXNFg2ODBG?=
 =?utf-8?B?MFVGWjN0M0dIamxhVndVY2RJWnVqN0taZ2I4ZTFmc01rbFdUNTFBNnBuNXlB?=
 =?utf-8?B?VFg1L3l2RHd4TWN0STZZUkJyR2ovdVlubVBJdHQycEF6cUxicUpyZ1RtZGt5?=
 =?utf-8?B?MWpySHk0TFQyM3dZREwxRkRycm1VRGpJZ1RzWlg2dHZrOFNRVm1USlFYTW1E?=
 =?utf-8?B?VXAycXhtTUVuRjJqYjdMcVhFVDBtbmQreWFBejRrTFh6WTRGOGltNGFsN0sr?=
 =?utf-8?B?WDdhS0gzTjJjODNRRE1uZy82WERTcDBkSDh2Y01HczNrUlZIQkNaUzV2Mkll?=
 =?utf-8?B?c1ErbUR2N2tRblV1RkREaGhRKy80UnNXcFU1bVp1Y044NWdHajZ3QzhvVVFw?=
 =?utf-8?B?QWxHbXFycDRDUklNRlFyYmQ2WmplWFJ0UjRySy8zVFVKUVNHNUtpbFRmQ0VR?=
 =?utf-8?B?UVBub3FaVFQ3bjN2S01MTTFTQmJvcnNSVjVyMGp0MlgwbVJqQzU1RjZoMjQw?=
 =?utf-8?B?R3hseWlvRzh3dWJZclRDdWIwb2hodmFkeTl0RnhOVHlxaWRQUmlBaFJXU25I?=
 =?utf-8?B?WTQ4NGJRWWdEd3JjN1llZElMdW9BaXZaamJjQzZSK3k0cUZiNWVFL0ZQeHZ3?=
 =?utf-8?B?c0EveC8rb29td0tiNVNEVXlFeWswaEJCNzh5SENWQWx3WDZzK2FuSHNkM0Z5?=
 =?utf-8?B?OU51ZHhaWnVQeWtVb29Fd2VENUZqM1BUMGVnMVA3aW5rM2NCeDZ6aXU1K2wx?=
 =?utf-8?B?ckMwN2dwUG5GS0thWDN3d21RVWlROHNhNjF3VlBiY095NzVLWWxvQ1c3ZW1r?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ecf52b-7fba-4e22-c48a-08dd56b0f5b7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 22:00:19.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZZR0TdpSP68+AnnwPemd2HYTFEGO6OyRaSikXLYbc7CyHp/QokKbNsakIQOorEvm5TM65LP/zRGKn+A3hM2Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR14MB3796

On Wed Feb 12, 2025 at 3:13 PM EST, Krzysztof Kozlowski wrote:
> On 12/02/2025 20:56, Sebastian LaVine wrote:
>>
>> ...
>>
>> +
>> +       i2c-switch@71 {
>> +               compatible =3D "nxp,pca9543";
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +               reg =3D <0x71>;
>
> reg is always the second property. See DTS coding style.
>

Ack, will fix in v4.

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

