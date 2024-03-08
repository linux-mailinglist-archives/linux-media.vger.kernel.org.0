Return-Path: <linux-media+bounces-6706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4EC87616C
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 10:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AECE1F228FE
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6B5537FC;
	Fri,  8 Mar 2024 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kkYYjBvD"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B91DA21
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891973; cv=fail; b=MSdLDwuIQwp3S75BSMIqSYnCnWSBWjQwfx2Ms/ZvHKFreLK8azQuHb/LB/aHW6MaotUCHRljGLKFcq413pLKYqMIiAhDi7jzBB9RbjR0NS7um+73DcaNPvswHzoJu9Oq//e+FssqXyTK/Roi8l0PixR54+be3dyZ9tNo+OPtMag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891973; c=relaxed/simple;
	bh=cBc2Z1d4h/+GFFqByp6d5XbtMCm2fRkidZLyfd0I/Fo=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=pjh5fWBDo9CfbTkWnnV1BRMZvHipSVrd28Ch4xIpq8cuRjtM/bNFpQgctl1UFCvt5PvkpxPv5Mrd1Eb9sMCY7Bgpp08siMzC90Tq9uQbAQkiLLgLOl4nm4cSOAXEBtSS8gf9U3Mw38rFSJSlV4uFMoxe0UrMZ7KSulA0mOCMTbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kkYYjBvD; arc=fail smtp.client-ip=40.92.20.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEKXaKMnXeQExlZHYF7cWCKFVuegQu8DPefGKShliDN2yHl+rqa0IQCvTWAPCoBEDrhs3W3QaQiPNPMFbSPE5yl6DO1oD/WT72RbxZylLkAgZbxG7U0T5YcVrqprMSH1dipRqFOJjsGPRqV8rshvQtV3iXrVrmix8LQLokIavNPgtiX2F2XGuWQC5quC3ldCGa+xY4GUwFOjp92jnYtJdDC2nHHP6ofsQM1Fgd6iw22CQRa7aRHuaiJa/ly/oXsS3g/zf2KpR8d/jqFwRcSe46GDcUBrVz2NDUf8FDUKbbAvIEvDtb5zvwK0GGy4GDz/Ih21yLuR/jN8PsEt4k1r8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mguPLySyQoAWbCVedn1v1SINwcvb4shDzq+VXMBbkww=;
 b=NPTc++g6p7LNvTOrf7lI1XA82cQ0QgGsPInE6sBquKusElp5TLVuG2Uzj0MD4Cxc/yih3pPekv5GwN7cAOpgINpGqXcfm+caYRNIWZQNMvVHtnI3+85IHsHV9hLDbLqtV//Maq8mRaKxR19wHUxrSgcJXBd0qrKckgZLIaqbelagbXWpePgHy28DcH5MZcbz89OYrfCQoiJtvvayOzyzYmrRtgDkEt9NdT4Iqi91ARafhoISoxb9zhgxAWvROYmiVKmfhzAlOhdkZ5RMYdLfRjS/HFaGjuKwhvqCHQdN9/JsjXrraIen7Ui+o41bIJ747+XMQLYwydKpGdTkWnnAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mguPLySyQoAWbCVedn1v1SINwcvb4shDzq+VXMBbkww=;
 b=kkYYjBvDnWbOKT+BaFQ/gnKL6wRfyCE6zd96yBUGo7Ljc5Yuj2n4O5IsKH3FdVZXyBLxuX6sqeMVvov46WImZ7ZfKz8tEmLIi9UJnoZJ2YHXRirF/S5WPjr1VS8aIXbFiJeTcL/WQGD0fJJvO5EBcto03bI3IOU2WdNGsdCCszaqV/GlOhC0SDukV9nWRs7NUH/QreTRq90xa1qs3j2zlzgpJaH6lEXIvOU451a9fV17/ULf76Wxlc1YgGfzSOBg0cvM2sfo+LZkMkMIWxReKzayRzTLtVeGPpM7Z4SY7NNbsuPs3ERW5fhxGVoo/aKQRfpjtpv99NGr5uF2n/D4pg==
Received: from BL3PR19MB6514.namprd19.prod.outlook.com (2603:10b6:208:3b9::10)
 by CO6PR19MB5369.namprd19.prod.outlook.com (2603:10b6:303:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.28; Fri, 8 Mar
 2024 09:59:29 +0000
Received: from BL3PR19MB6514.namprd19.prod.outlook.com
 ([fe80::707b:75e3:8c68:45f8]) by BL3PR19MB6514.namprd19.prod.outlook.com
 ([fe80::707b:75e3:8c68:45f8%6]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 09:59:29 +0000
Message-ID:
 <BL3PR19MB65148E663E21F7739BC39628D3272@BL3PR19MB6514.namprd19.prod.outlook.com>
Date: Fri, 8 Mar 2024 10:59:27 +0100
User-Agent: Mozilla Thunderbird
From: Vince Ricosti <vricosti@outlook.com>
Subject: [PATCH] add missing errno before strtol
To: linux-media@vger.kernel.org
Content-Language: en-US
Cc: sean@mess.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [FmNSoJC63q879qmnqzOthNtxJzarXlarKaFbIBcFy77SFHE3fXnZBk4BleFusL9k]
X-ClientProxiedBy: PAZP264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::14) To BL3PR19MB6514.namprd19.prod.outlook.com
 (2603:10b6:208:3b9::10)
X-Microsoft-Original-Message-ID:
 <33a90dd0-24bd-43d1-a698-9b62057ea299@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR19MB6514:EE_|CO6PR19MB5369:EE_
X-MS-Office365-Filtering-Correlation-Id: 5115c062-adb2-4391-69ec-08dc3f5671d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0PdmzlvPvVXciVphwxmYV3+Tvh7Z6mDvjYiaSKx7PlvsNyYRWq8X4+hgXv97Azg5lbgi+9D+jeUl4UM+b8FTldi8pvMeaNv52s2z6eVGndO30XwIMdze5H1c4U+/zO5n7Z+dmT4XWROOr9CD+uHB1X2EFb9ilO20fddzXXZ5V88xhuSOQaoOC2AgGFI/vIIxLYdbGxDHaTxUpgObOrcoeVowwaBGHF8UX6OG/cpiYem1debkXK5pQmO/Iw0AbVGyEs1uIaCuCoKO8eVghHFEHBUF8hELTZQz1XZj1i78p5LlkEdlQcFnaeeZFdSEBXgqrIjLb5dHorg2Y/OPRjj79pCn+sGBJ2SVmQIAHf+hgMERrPqr0bec6kc4fXvVmRF3BgvrT274BBTQ9813jnp8rBUX2zYg6yx+YAVDG5euG6rK9jBn616p5h9QnzyZ13WFNqDTOin0cMY1zjuMKeZl6Pd4nTZZMxtgXvY7hcHTsJWXE4vwmY3X0D9yeGbNZrL7L+4sIuO6PcYBGEUnQyULLAOTPWiPgI7l7lIRYwkmqKr5aojxFr04VgDG94CBSEOj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJnVk9IU3A2N1ZmeG1CTDBTYWJDcExtSFNOOXRjMXdQa2xCMjkxdnkrbWN3?=
 =?utf-8?B?d0J4SlV2WmZPbEVEbXFPd0FLKzU5RHhnUHE3d21Ic2FPZ2lqZlpyL2s2RXk1?=
 =?utf-8?B?NHNZWkxFMTQrRTZUY1dnTnFmU1Z3WUFXNzVCdEIxMkdoY2JnendvUTdJMWdM?=
 =?utf-8?B?T3FNd3BmUDhZQmJIVWZWOVJTMUppdEFhMEdhWDNuU0VJamxVRGlIR0NEdXd3?=
 =?utf-8?B?YS83MmtaNmZBWnZEMVZFOHE4Smd6cDZlcUtPZXE5dFltdUpnOExJa1RhWkNC?=
 =?utf-8?B?SXdha3d6NHpMc1hQeDNZdTVjNTQrWjVrNHNYODMxK2s2cktWT1NEZGZ4eVRq?=
 =?utf-8?B?VndNdkMwbTdpREJuQnhCSlZBLzBKbDRnbXZwQlJtSCsxNkluMnJTZS93S2dh?=
 =?utf-8?B?NkRNb09PSXVXK2pISU9UWGxQQTQ4SkpMYnhSQUh3L21xUmI4bHA0bjVsUHA2?=
 =?utf-8?B?VEJpWGcwMlZLd1JuVUhzOTg3TnZTa2ZZNlAwSXFYWE1lQlE5Rk5ONjRrYVV4?=
 =?utf-8?B?cDFYb0g3dFcxaGo1WE1nNDVmbVl5ckFjeWgrR2owSWZBTHlRWmp5YWJJejBV?=
 =?utf-8?B?UzJRaVArdGlGTUxEVkVXWkZEeVRXOHF1cGNuVmZla2pOMGpmU2ZhQnRSWHFs?=
 =?utf-8?B?S01odnVHajhYQ3J1YzhBNFRnYVBvWFVHb2dZdGxqL0NheitUQ0ZIWWZBbWVn?=
 =?utf-8?B?UmFVU2xIN211OFF6Lzh0dGR6Qmh0cGJ0eGhRS09JYVpzSXN4THZnZnhiU0Ir?=
 =?utf-8?B?VWk5T2lPQm9nV1hTalpwS3k1UnI5cjFuTmo5MUM4UWlOMFd2YVVoOUhDWUxE?=
 =?utf-8?B?MDRaTTY3Vm96SWw4a2Z4MFp5MFhuMXZZcU9BcHRkcDNSNE53TUxxOXQxb1Vj?=
 =?utf-8?B?UXpVL2x2SHk1YTBVNUpyVTFham04OGdueGN1U284cnRKNThLb2tPTXRXRnhV?=
 =?utf-8?B?cTdla21FOEY0SjloQXF3VndkWkYzQ2RvSXRjMHQybFIzTWJadFBWR25YZXor?=
 =?utf-8?B?NE8zZVBua1VwanRiTDVzKzFBd0dZSmptRURocEYxbjkvQmhpTXgwVU4zdmdz?=
 =?utf-8?B?VndDQittTmxKMVNZdjRPNlhsM2dhME9OSk51OTFLeStxOGxmbjhaRjBqQ2ds?=
 =?utf-8?B?YVd4K3lHLzNEYlFIQjJlVm4zUk5ETDB3Y0JPbm4vaVcxaG9mRW9GYWQ5WjNQ?=
 =?utf-8?B?VGVNNjZmLzB6cUVvY0dKYklRY0tzR2JjWWpaV0JFUFFPMzNkT2VqZnhNM3U1?=
 =?utf-8?B?UDdDWWVsaHQ3OTJVdEt3WkgrYzQ5M25xU1hDbW8wR3M0c1JZL0pvSWxMMCs1?=
 =?utf-8?B?RnFzTVRpbEV6NXgzcUVxS090UUxZYVVHV0xGc3I5bm8vd04rb3pjakNwK3E5?=
 =?utf-8?B?cHkwajN0bERaOW9ZYm5hWXNER21jTVdzZUo0SXNGeVl2M1MxYWZtNkdhZU1y?=
 =?utf-8?B?c0R5ekl0Q0c1d0p4ZFF4eFA5VlJ3QW9DWm1VSEpRQ3N6Qjl5MmZDeWxoSTJr?=
 =?utf-8?B?R3VGbWd3NHFXcWRSVFN5eTV6c2hOeTVqTEpQNGVQYU9oMjd4a2dZUmdEaDIx?=
 =?utf-8?B?VUhNbFZ2N1o2b2x5cE5pelFTb0N3SzRtSHVycHJFSjVQSGJ4US85VFdkS2dD?=
 =?utf-8?B?OERKREN1ZXBRZXJQblp5OEl6V08zT2xaTG50eHhPamZUb3FyaVk3TmJkZC9m?=
 =?utf-8?B?b1FBVGR6aE5qb3Y4QVZYcDNDeElXNnluLzZKaDNRMkNLME1jdUJ1MXZsOU1r?=
 =?utf-8?Q?MpdDx8RHPQAlRpbIXU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5115c062-adb2-4391-69ec-08dc3f5671d6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR19MB6514.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 09:59:29.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5369

When testing yesterday the latest master on my raspberry pi I could not 
send my usual file because
when entering read_file_raw the errno was already wrong (don't asky why 
because this morning it works). Anyway since strtol do not update errno 
except for overflow conditions it's better to set it to 0 as done in 
other parts of code.

Signed-off-by: Vince Ricosti <vricosti@outlook.com>
---
utils/ir-ctl/ir-ctl.c | 1 +
1 file changed, 1 insertion(+)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index c480a2b1..e662651e 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -413,6 +413,7 @@ static struct send *read_file_raw(struct arguments 
*args, const char *fname, FIL
(keyword[0] == '/' && keyword[1] == '/'))
break;
+ errno = 0;
value = strtol(keyword, &p, 10);
if (errno || *p) {
fprintf(stderr, _("%s:%d: error: expected integer, got `%s'\n"),

-- 
2.30.2


