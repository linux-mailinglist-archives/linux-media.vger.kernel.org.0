Return-Path: <linux-media+bounces-14370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D591C7F7
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 23:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5502BB23DF2
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 21:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A837F7F7;
	Fri, 28 Jun 2024 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="vYwhF+wZ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2110.outbound.protection.outlook.com [40.107.102.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD497BB0A;
	Fri, 28 Jun 2024 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609438; cv=fail; b=h28smC8nGwOVJptB2fMu/8pEvWX1MpL6He28YDNSpirXIMUWUbN+kL7LPlEG8vgVxdx1RH/ZR79CYKKVbjMYsNWfZes5dcvtT992+o8MTUC5+Qg6sh6Q0TgAn4YOJD4nEzZoY7yGl6DijnMkZuArbnM6jZva2hnP9x3bAdsEtSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609438; c=relaxed/simple;
	bh=fAWf46ncXXb9dmffePnSvfIo9PFaHGPbEWh7okKhwGM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l+iI3uSYgGtFyDtWoKR7n1MJmtzKckYdtIK81qtfNwPdJR3IwI1wG+LnfLGU9l3ePWXnnL22S66BmXYlvEhUwiMw7+TgqA2TESFW5WkN31rB7vKcRMJEeOsm1glKnf/G+Bl9ZwGBs/zZPwM7k/dA2yaOxXE12aZcmH4VkEuqVz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=vYwhF+wZ; arc=fail smtp.client-ip=40.107.102.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcAV5I3QwPaUwzV7dwKL8pRq1hDq4m9EuG6i93LJJwJB2yu9d7GuX0yWd1niYJ+Q9+WdEnapUefnFb79CmBQgtH+spHpL62n9AW/yLs9UZWriVaRb4MYYIEh3BDc9oqz+cgOwOXGWXcAgyVEnITv+8hw1dfFRNILg88Dqs+cQmBw9qIgH07aQWg+pipnZDEUYHBpZsTNBPwmntQUqDy1JVpyoM59jeitkFKmeqOomzTipWL5o8iepFWYe4X+KX6lSkJ6/lJWThNmg6qRd+Y7U9UmoG1jZ5O7UjPrdEptwLpE89gUd+U785IyNJXXr68OnWxZcBMfvKOdLceKnMomeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNkm38ZURXntlQyXUM7MtRje49xmRoDMoSU1iHVyhuU=;
 b=Q4nwn+jvyv+17v5zbEZz4gIxRk748GuX5Bhye2xGckPPRRmQvk7CFDsIN1hTRm9wJDlTvTTt22vVxTam7ZeKx9PBiods/+tVJ4QTYLt6QfpnV/b0v86+NLy1ALo2iDWS0WWBBkLd67kvTFFrT34ncHM4IhjpZnTN5wLCGE1AIC33s/6SLMbzW3OLxyc7ZngGCfjBCfw6FL92ZMBQedU6X3CWXPumFdvu8W3tOzNCecKmAMnNjUDfArjEdQwGgSjkwCtNO38P3/byxHSzmrW+4jzh+c2+lS2omUay03AraZnKdpYQHQCaepmsCVtW4YGK1DToj3Y41Dmavh4xd9hAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNkm38ZURXntlQyXUM7MtRje49xmRoDMoSU1iHVyhuU=;
 b=vYwhF+wZs79LfeiI/KYAjlbraMWR7qte4cOPw4Afe/UsOcKJcmBQY1cCbIASVFMyAmkr0FhLV78WHqvELp/nM5XZ4iovLTc9mrdRwistP9RlzgoBrvtj3N/ocGK7jY+/tPOa4Qxtfd64AbwTogz29BbklXEtviJUbcqyRzkv3yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 BN8PR14MB3314.namprd14.prod.outlook.com (2603:10b6:408:78::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.8; Fri, 28 Jun 2024 21:17:13 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Fri, 28 Jun 2024
 21:17:13 +0000
From: Spencer Hill <shill@d3engineering.com>
Date: Fri, 28 Jun 2024 17:17:00 -0400
Subject: [PATCH v2 1/2] media: dt-bindings: Add Sony IMX728
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240628-imx728-driver-v2-1-80efa6774286@d3engineering.com>
References: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com>
In-Reply-To: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Spencer Hill <shill@d3engineering.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719609428; l=4031;
 i=shill@d3engineering.com; s=20240628; h=from:subject:message-id;
 bh=Qz911O+Q7Llxm35ZGzaCO5leDDGhmHT0rY7rSuvLaqs=;
 b=4+EcCQ8Sk4zrGKBHJPnx7GJ5XjOygz7ea2APzX7Lnlb/z5tSKNnKN7OaaZnT7gAmMpVdNCzBt
 WxVlnrZ8za8B6RPspL9IjMkLT2wJgAv2Gw82kUGig+ZoZwok5JcP4rD
X-Developer-Key: i=shill@d3engineering.com; a=ed25519;
 pk=WiUnCaWmHh41mktqx3wOb/1u4lviNHgPHRL6fwkHnsY=
X-ClientProxiedBy: MN2PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:208:23b::32) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|BN8PR14MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5dc40c-c89b-4cc6-caca-08dc97b7ade9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXhmMCsrR2NHZzArTERhR3NZcXdXTkFGQ1NOV2FiZHhiM2czdUV6VVRkRHov?=
 =?utf-8?B?bk1wSjFodEM1ZU9FQ2tDcHpvOW51cFN4b3liYVo0YnIyVFUxRnN4VkxIeG1J?=
 =?utf-8?B?YlQwVG5qcVpTNUxFZEExQitUTmEzR0t2MmZYYUxtQWJkNG9kR3k4aDBnc0s1?=
 =?utf-8?B?SHFYclFwSDMxcnViOXdQaUpNNVZqdVI1eGYyTVJSd0VaMVBzbTVSa2R3V3V5?=
 =?utf-8?B?TUZHeCtlR3NKcXRHdFExdmJUY3pBMTFHTENLdkxEQ21HK1JqbjFUSTBENUt0?=
 =?utf-8?B?M1pNUkxralZ3NFdJekpRS3EwaEJPM3pGR3dtVGhnU1phVGlZRUlLWFNIUHJI?=
 =?utf-8?B?R3hTRWJUeFFtNWE5RDhOZG1Fd2x4d0ZxS3phQVRkTC8wdHlIWmN2SWRuZGxu?=
 =?utf-8?B?QWZpMG1MamlDRHB2ZnlTQThxb2g1eHNWVFhvdWd5UDBjajlzQ2R0eTVYTGFu?=
 =?utf-8?B?ckc2MERTck8xQk1jV01TZXhQQmM1MkNraFBjUmtoM3Z2ZzZ6ZXp2RUdwVkhj?=
 =?utf-8?B?T3pvZFdFZk1Dekg2bkZpMTZrUmNsWkF0b0Z3aVVsT2ZGbkZiQmNpMWduc2VK?=
 =?utf-8?B?ZTQ4cGwvUHFOM2EySHoxRGRwemlJNzhUMDVUbXNKLzVVME42SmtCSmxpR0FJ?=
 =?utf-8?B?UkhUUUNOSGlJNGg4VTltK2pSMWYwVmlwQmI0d1BOZGVndk5TVlNZVHMzQWFu?=
 =?utf-8?B?N0dIeG4rcWgyNWh5MnpkZUJDdFA2TytKMERCYUFScnlEOTNEeFQ0S3dsUEVO?=
 =?utf-8?B?eURZTjRTWVRBRXNobVF0Z2VVb0JpVFk4VG5FMW01UFF3Nng5TjZMNFB3WUMr?=
 =?utf-8?B?akdqSUU4cEFnT1puMHFVdno1b0h2VVlmbm5WUDZNOUErWGVnSWdCQlZSNDlx?=
 =?utf-8?B?WHlVbkorWVpPZ2JtUkpZNnRxM3BIdTNpQ1Y4dkU5OStOZTZpM0wvOVEwb0Jk?=
 =?utf-8?B?UUhEWVJDMXMwZkVIckZLaHpXeWxucWhPWkw5OVZ6THhmT29hczZTZ0ZtTWMy?=
 =?utf-8?B?Q1FWQUtBVkdJT2RjQkRNL1lUTUttcTZEY2lpRHM5MHlTRWVvNTN1SjZyOE9t?=
 =?utf-8?B?L21DNVdWdjIvVDZkQm9EYVgrZU13ZkZ0RWlNSUdFdDNuM1F1VXhEaVp6b1Js?=
 =?utf-8?B?TzVkbUx2RHdsbkwyWitZMzVjcGZKeGxvbnFvM0lBSTNCUER5UW9EVjY0cGF3?=
 =?utf-8?B?Z0djTkRnRUEvMDNDNkptRDYraVBrYjJlMmU2djB4dCtoQkpQMUVWODlQR1ZU?=
 =?utf-8?B?Z0Nqay9PUElySlJMTGJaUFdQc2U3Yk52NGw2NFdES25rQkZjS2ZuS29SdzNv?=
 =?utf-8?B?MW54VEttc05ESXNIdFdnVk4rM1lvK1FETkNxcUtiODh6WU8waEJHUVh1YXZn?=
 =?utf-8?B?QWVUcFYzN2F1dGhwcDN5M1ZnekNGWG4rOEJodHp5SmlnSmxhYzNSQ1podDRh?=
 =?utf-8?B?ZVExY3BFUDlXMkZhc1dxeDZQaUVMZnQ1V294VERIWGtad2FSRzlJUlZhaDBt?=
 =?utf-8?B?Y1d5WCtUNlB5ZTM2SCtkVGtpMjVqMUd1RFJocENidWVFQlg1TXdLUVVhV0E2?=
 =?utf-8?B?WkprcG5sd1M3U3ViN09PK3dNNXNVTFR0VDZFTm5UT3BNN2h2bHNabFhrM3l6?=
 =?utf-8?B?dk15bm5Gd3VYRVVlUml1QmR1ZVJCa3ZBMEZ5cDltaTlZWTY5b0pVakhiWEI5?=
 =?utf-8?B?QXhCZlpUaDNvK2ZGK0RwWENqdFBMaHh3UkZzNGJXR1Zscnd2a3I4RE5VNW00?=
 =?utf-8?B?a0hDc1BSMlZ3dUFsUWNkVGNaR3Q5d1Q0b0w0dVEya1ZWVEJrV0grYm1QdjBK?=
 =?utf-8?Q?nH9rWzL1l1AJ6B752N6Ue4jTg9CXfwcWQh7T0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjJqaGRMQytTckFlNnpRNTZBREF6MFNIV2psdWNCcGpZV29aaXBXT1RHOHJw?=
 =?utf-8?B?TmJJOTdnT0t1S24velUyWXJ5SHNNd3M4Si83dythR2pzdlpDWWtUT3ZRZE1p?=
 =?utf-8?B?T2tpZTc4amRkV2tueHJBQ1lnOGxVb3hxdSt0ZnNkRXkxMHRaU2p2eGlJVkYw?=
 =?utf-8?B?SFlMZ1AveDNZSmRxeFY4MFVPOWdMODYvV2lMSTlRak9LOGhPN2o3V05rMnFO?=
 =?utf-8?B?azdJZkc1TTZVdGxJbktIYUFmejFPTW44NXQ1d2ozV3FkbVk3K2R6ZWJuNlR0?=
 =?utf-8?B?TEdaV2ttT2czSm5HWGdoYmVKbVJmZnEwNGJtazFFU2NjeWZzbjhqN1BnMStK?=
 =?utf-8?B?UEVSc1Bwc2FJMlkvZDlKOXlqZ0hvRmNhUCttSHpkTzZ5ZGFkNXVqWWxGanpW?=
 =?utf-8?B?dDVBa0J4NUVhZUpZU3pwOSs3c1pvTzg2b2NtZlNwbENoWUgvNHFrYXZlT1Ev?=
 =?utf-8?B?aGJWQUp4Y1I1TTVCNjVobjNUdVcxVFQxdTlmNTBuRU9UdURQVkR3cFVWbWJB?=
 =?utf-8?B?a05ZeUpLOW1aWHp3eVd0V09oMjhxNEZtWXA4TjA5ZVJjYjhLNElSMGJiRHdJ?=
 =?utf-8?B?U21iZnFYM0RnUjZIMnUwQS83VFVKQ1BTWGIzcEMvSks0S1Y2ZkxycDJxVXpx?=
 =?utf-8?B?QVo3RXlDSkY1NnFBb3o5a3Qvd3lqZTJkcmtCQmU4YWhnMzBOU3pxQTlyZ2Vp?=
 =?utf-8?B?RFhYbW1jYXRGa1ZyMm9ac1ovUkppTVZGWlNWVHRwUVA3Nm1PMEsva3YyVENM?=
 =?utf-8?B?OEhmTzlVYzR4OG50Z0paVEYxdkhHeCtDK0FubkdUaDI5Z1B5RzBkaXNzakRE?=
 =?utf-8?B?bitGTTVuYldkeHFhdnFRbmZRVWZWU2ZEMEpsWFo5bWJhbGxVdmVmOWNyZTYv?=
 =?utf-8?B?Q1VEdFlWNU9pa3pxSlh4ZjF6Smd4Sy9oK3JMeWVXM25ZVjQ5UjhlSDRvdnB0?=
 =?utf-8?B?NEovRmo3bG5WbTR2YnMwWG5BeU82eFQ2R3VvOGZ4NEJJc1EwVUFMWEVjSE9H?=
 =?utf-8?B?T25zYllDd3lrS3RvSHJsTnhDK1dGNnBQM2lBbnVNQWZsSElzRkJyVDQzOTBV?=
 =?utf-8?B?NGExSDBKSmRHeEFoaG16ZEZMdFIrZnhweVhONXBuTkliTWJtTmpibkNjYTFp?=
 =?utf-8?B?ZGtRT0FlVmZsY0xqOEFkMjRGekNMTzhRd0dPSmJ1ajlwNzlLVENUQ2VUMURu?=
 =?utf-8?B?Qi9rTFJ6YjUvTlFIUEdWTStNNzJURnNuSlBoOWx3dGtDenMwajkyWnpxa042?=
 =?utf-8?B?Tld0RityVk0ra25kdVFHR1FFKzErYVNpUzdnVVFpTHZIK2VkMkdPdmxOaHpS?=
 =?utf-8?B?cTE0UTAxTnBYempPYW1KL2w1RTBXTkowSGhQNkd6WTBibHNrQzh2QkxrZVBp?=
 =?utf-8?B?TXAwZFNxSkRyTTVIWFd4NVE5L0YrTjBkYkRJVWM1eGJjS0ZLTFY4UDI1d0hv?=
 =?utf-8?B?QzlYVFo3amFxNVlSSFZXLzJkSWkxek15UittOHdVN0QrMUlpcVJyd09JTVp4?=
 =?utf-8?B?Z3IvdEV1cjVaMHFJb1BIbmN5TXA3U3cxdXpqdUxUc0lJNmdtOUU2ZStwRURX?=
 =?utf-8?B?RU5rMXJhRzdPUWMzT2E3NEpNbUwyaVBoajJ5ZW9jdTIrb3R3MTFIVExxNUk2?=
 =?utf-8?B?amVRdVlGU1BqMzhrOThxa2N4N05TcGtzNCtTbjJjV1RQYWorVWw5RVVyTVJk?=
 =?utf-8?B?YTJmTVY4NlcwVjFHTXpvNWJTNy82ZzRseTRhdEVNTUZvNlpLd2ZNZ2xqZGFL?=
 =?utf-8?B?V3YvVlpwQWwxamQxSXkxUDVzY1JiMFRYb0w0aHZPWUNJb3hmRWtBRHFXNVBs?=
 =?utf-8?B?d1pSUG5KeFZ0OWhMVGlseGo2N2ZJV0o2U3pjQUd2TGYzUitQakVZeFp0YllH?=
 =?utf-8?B?OGhwQmpuT1ErMlFnYzFHYXJiVHNwQmk5ZlFxVVdER3BBd2xyVk00MEdyOVBL?=
 =?utf-8?B?SFFxMlEzNWJ1aFJFaWN2MThoOGE4eGFwcmIzK3pqY0ZXMlRNcTV4b0Zwa2d0?=
 =?utf-8?B?aEJPSTQ2SnM0MU5GY3VKL0d3MElCcFNuamJZUjF4NUgrdUFadno4bG9YNkVY?=
 =?utf-8?B?clRTbCtTUmVrYWpGS3BmNVRuelVudFZrUHM4MytZZ0Z5WW5keStRcXIva2VH?=
 =?utf-8?B?eDhiMUErQmVReTloVGdDZitMUWVxYkh3YllHM2tiRDFrMEZkQlRiYTJSSmVu?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5dc40c-c89b-4cc6-caca-08dc97b7ade9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:17:13.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewDmY9dzqEzXLx8tQVWeSevaOyx6WLpJyaLvK7vCId4DTLjPdLHHPAVBMH485Uyq6bh0EvVYIZERLlzpBj0EWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR14MB3314

Add bindings for Sony IMX728.

Signed-off-by: Spencer Hill <shill@d3engineering.com>
---
 .../devicetree/bindings/media/i2c/sony,imx728.yaml | 119 +++++++++++++++++=
++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 126 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
new file mode 100644
index 000000000000..1b14dbcc473a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX728 Camera Sensor
+
+maintainers:
+  - Spencer Hill <shill@d3engineering.com>
+
+description:
+  The Sony IMX728 is a 1/1.72-Inch CMOS Solid-state image sensor with a
+  color square pixel array and 8.39M active pixels. It is programmed
+  through an I2C interface.
+
+  The sensor can output up to 3840x2160 at a maximum of 45 frames/s over
+  a CSI-2 serial interface. It supports RAW24/20/16/12 and 10.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx728
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Clock frequency from 18 to 30MHz
+    maxItems: 1
+
+  clock-names:
+    const: inck
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the XCLR (System Reset) pin.
+
+  avdd-supply:
+    description: Analog power supply (3.3V)
+
+  dvdd-supply:
+    description: Digital core power supply (1.1V)
+
+  ovdd-supply:
+    description: Digital I/O power supply (1.8V)
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: ../video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                - const: 1
+                - const: 2
+              - items:
+                - const: 1
+                - const: 2
+                - const: 3
+                - const: 4
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        clock-frequency =3D <400000>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera@1a {
+            compatible =3D "sony,imx728";
+            reg =3D <0x1a>;
+
+            clocks =3D <&fixed_clock>;
+            clock-names =3D "inck";
+
+            reset-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
+
+            avdd-supply =3D <&camera_vdda_3v3>;
+            dvdd-supply =3D <&camera_vddd_1v1>;
+            ovdd-supply =3D <&camera_vddo_1v8>;
+
+            port {
+                camera1: endpoint {
+                    remote-endpoint =3D <&csi2_phy0>;
+                    data-lanes =3D <1 2 3 4>;
+                    link-frequencies =3D /bits/ 64 <800000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ef6be9d95143..a2811249ac8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20589,6 +20589,13 @@ T:     git git://linuxtv.org/media_tree.git
 F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:     drivers/media/i2c/imx415.c

+SONY IMX728 SENSOR DRIVER
+M:     Spencer Hill <shill@d3engineering.com>
+L:     linux-media@vger.kernel.org
+S:     Maintained
+F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
+F:     drivers/media/i2c/imx728.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:     Maxim Levitsky <maximlevitsky@gmail.com>
 M:     Alex Dubov <oakad@yahoo.com>

--
2.43.0

Please be aware that this email includes email addresses outside of the org=
anization.

