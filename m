Return-Path: <linux-media+bounces-42718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87104B84A4B
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 14:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B7172A4C4E
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 12:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F29303A31;
	Thu, 18 Sep 2025 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NFviHywO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8791EB36;
	Thu, 18 Sep 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758199577; cv=fail; b=i+lxihrvYaB87ypCEaq5M7F8iyHJ3FpWJZeIz94RmmBbbT9AOkvXWDqWzyktnT6A3eeZ8oKRAGyQGAwxfpnw81nRJZbF1sG1NUwzlp7y8JXj27v6VPD3neTZXjkEicygXs9kadylBtXtJstGIl3Wjb3Hh6mLuwQOzHH0oCQZx4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758199577; c=relaxed/simple;
	bh=NMLQ21X0ENukJRfLMC37ezowSiYl0KSpfQ4yBygi6ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q9kHE7mu1C7gq8VQnD18R5YysRAicBk1CZ3xIBYxcjuw0fG5qdspMaBPNtQ+RJVFXuxVbEDGCU8HH8NHWu/f3Cd+acFEUhCqE0XK14+Y2uwMOoEk7ULjhj5FzCLLivCMCr4t9YA/V0nWT9Cbra002fjQ3K/yDmFEBFK8rfOSBo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NFviHywO; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ICIGYs022006;
	Thu, 18 Sep 2025 14:46:04 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxm0mxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 14:46:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccFWxpmJ3f/JGiwMwi+yOlHHYxARQjNyOJXR678n1c++IsvFLwPMyp7g8GmupY+bI8MxjFQrf4fE+TqAroX/3UoCABNX10Int3NncMtIOkLp4GU1anC16CG2wqV20/z8+78p+JN5PEumqpXEptdL5CqTOXSAz7seKvJdPYbDpne/ajk/kZOHmKw+sORhtz3CRpwnSaFNsh+9EnqxtxK7SIXOT1OyjjLC44PEwMH9/HaZLq7bIyB+JmaKBMw9OSLNh5gt/SNjAwEtN8X7YlzEjcoOC7dpoucAExzuDuI900z2qCsn+/K1OnhEoVYoTC6GTtC5IYZ2UpJ2YU7aLpetdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL2t5Yo48zvS2ciKNxomcixtpYKk+//I0Fe9eqfT8Vk=;
 b=Zba9DKJ6pCcXBmMfcRcAhThO0tlJUgfXfRbjwrNfDs2GljwJNpfOqE+roEAZSjKiMyqB7dqHfH3SB38cTlRzVmNAHYjNgfQG2VLL71R3IIZyfiuxiSJyHVeNU8AFenUSKIYkgc9cNgjGqJ+ZPI/68XA0bCls1kVr3S43v6QttCRIUQVOYFbJs+rHD75bqOgJfcBE+G4+G5dVWwaQ4186pWuH/6irDMO0yCSZ5B+v+6jCoNSlc2BB8Q0mgBxEM/botXSqUf+A//pTa1zw/eUlL/lfNpG1EnkpUZe49aptnTVhEF2D0QbxbbbKlq3KW+RGb1cspPxXyw4q87ztiklGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL2t5Yo48zvS2ciKNxomcixtpYKk+//I0Fe9eqfT8Vk=;
 b=NFviHywOSvxr2SnQAvqGF7vSiqslIntfRKTA8eH9hb/XWunW9P5yYBv9rUDmkTWASkdC+tUGshIrf1jvuWsawDAYpH0dBAdvQFVaOXv2I16/MuiwzXNbYBxmxfOZI0yLnCcxS9xfZTmDVhJp1b+LB+n+FAbgNAc7xlv9dWz0S9m8LpCLztyE7ObVEDvq+5NZfXWsOspD4HRw5pG0dNJvOxB/i2cUbK5YLBehjwr9qFEvAaraADuwLupBKeysXp2P7MrkulXGzf+5nyKSxbIe6XXWC8s9ElJYVDpDcD2btW/E4cmSgQIMffbL4+Yw1RhtayGUci5CWuBIeWuCH87u7A==
Received: from AS4P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::19)
 by AS1PR10MB5746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:46:01 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::9c) by AS4P192CA0025.outlook.office365.com
 (2603:10a6:20b:5e1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 12:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 12:46:00 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 14:38:57 +0200
Received: from [10.130.78.106] (10.130.78.106) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 14:45:59 +0200
Message-ID: <81c24fde-9b0c-4da3-bdac-67a7460819d4@foss.st.com>
Date: Thu, 18 Sep 2025 14:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: i2c: vd55g1: Support vd65g4 RGB variant
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|AS1PR10MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2993c6-b12e-456a-5d06-08ddf6b15237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTRHZ3Z1OFE4RXdXSW8wRWdXVnZLOTBHaVZmbHM3bllORUJRdzNWOFViSUJS?=
 =?utf-8?B?aGtqQXk1Z3c3QXp1QjgzWk45N2FheHpnU0s5SXJXaHFtaWRIOXlWUmtQZER5?=
 =?utf-8?B?OThISkJLNFYwanRFT2dZWkRFSEtOdzA4M2pEWlRRTTZReXlqVG8wY2NyanYv?=
 =?utf-8?B?SkhqMTkrWkFyTlBiY2ZzVW9xSkhNQnZScCttUkVaS3dZVEdMVUt2clBBdmkx?=
 =?utf-8?B?eDgzTUVIS0lEVURSMlBQakxOQnkrNW1YSUZNYW9yTmZ2L1RhQUV3UmNRMFdh?=
 =?utf-8?B?WW15dUVtU0FySUVydXIzOFI5eWFEVFlXZk9sQWdwbmZUME9JZ1hXMk5FWUhB?=
 =?utf-8?B?YkxTRDh2cCtjVGlnd3ZkZW1KUWVMc0N1OHB2SUxXaUJBeURqR3A5aHI4NWo2?=
 =?utf-8?B?aVZqaXR3VXZSNU9hWTVQd25zU2l2djVNRWRsUXFzaSt0OGYxQW5ROEdFTlNE?=
 =?utf-8?B?OXdZc1RuQlZ1WFVtc0VnZy9zWDhUYk1mQVhpWVlwNEVqRlZTNUtpeUpTMVR6?=
 =?utf-8?B?Z2xCQU95VldFYzVrY2dIWmVEcGNSRjA2NVVBZ29QMUhVZDl4S1I3dEs1ajJ0?=
 =?utf-8?B?bWxRWFZpUnExbDg0U0pWYlVlWnlEVzRtNWIwVDJnK05wZEZXUDBZMkZvOGJ2?=
 =?utf-8?B?cFJhTlp4N3kwUDRvbzllYWtkbDZxUGUySkZlUmNJbGpZam5tYnVkQ01zK0FV?=
 =?utf-8?B?enhVTURvdTROeEEwdmkrbVlCZ3UrbEpNWUhtSGJOZWxOQkpWYzMxK1FJWm9j?=
 =?utf-8?B?c3NheCt4MUoyaWFVOFZ1ZVV5QjBXZlVuTXQvRFdmNElndGVjbkNNdlhlQ0JP?=
 =?utf-8?B?UldQMzVXOTRCVU1OMGlDS3p6NEtmWDhBUGNBMmYybDJWWVlHUi9HbCtrWHJ4?=
 =?utf-8?B?ZFBNVzVVTmlCZWIra2xRZTk3aHdFdXlZMnB2RmhpUHp3U1dzalMxN24xMTc1?=
 =?utf-8?B?U0RkL0RETUJmbTNoTmhoY0pyc1BEanZUWGRFTkhnNnozWE5HaDB4OTJQaFF1?=
 =?utf-8?B?ZEdXdngyTW5xQXdqeHlCN0tCdTZtYklsS2lmcjJwWTFRUVF5YW9VOXp2ZkNt?=
 =?utf-8?B?NHdzODFVb1Y2OWpGR3BEN1ZJUzdzTVlVeFhrdElPSTR2aWVYdDBxaVlSbWVm?=
 =?utf-8?B?TkpINEQwSWJ3N09FVVhjS0dzdnZlVzBSSG1vb1d2bW1VUHRPdXJyekRlN2JD?=
 =?utf-8?B?bEQ2OFQ2QnhsSlZHMTFEWUMrVG5ZUSs3ZDY2bk93R0J2VkkvUkpzL1RRTC9C?=
 =?utf-8?B?ZHdOQ2Y4bXpwU3pkc0RwNDFucU9Ncms5L0dLaGRkdGRFRnhjbnJQaU9EYU5I?=
 =?utf-8?B?ZHFuQm9ic0cyUE5pb0wzQVlQRi9rNER1cHdWYkQrYkpKWmdDdUpWK3kxVDAw?=
 =?utf-8?B?R0p5b0JVdE0wKzdnSHh5R0p3VmZtMG9jblJUN1NRUkUvN0Y1Yjh1RDBXRUVq?=
 =?utf-8?B?SnZUZEg4b09HaHQwS3RnYXVGeDQ1QWh5Ti9aUmxrQmZtZGlkUUw2UXY5dEUv?=
 =?utf-8?B?cXYycmpiRFhsOWtHZEpFenZRbnZFVEs3QmltbHM0RVFuN0txNWt2WHlKd0tW?=
 =?utf-8?B?VnBVbGgwc0Y1N3Nydmo2KzE1ZmptVGxDSVZjQk5jNFk3V3VhU1ZVTjNubVM4?=
 =?utf-8?B?MDlwM0RZZE9CeHpZcnJoL3lScXBKdnVEbG5rdDlEbkZreTd1clhRbURCRW4w?=
 =?utf-8?B?M09FenVUY1BtbmsyajFtWkpaTUZFbUIrNmE3ZkRvWmd0WmJjeSt2UVQ1S1kw?=
 =?utf-8?B?UzBYVWZ6OERNb3B0VXFUazFPbFVUL0NkYUwwelU0eG1sUXA5Vm82b01YaDdL?=
 =?utf-8?B?Rml1a2srY0JvMllBQklhVTljYUI4Sks1ZDhKcTZWdS9xajV1UlprQ3BjNVh6?=
 =?utf-8?B?WjVHVEpLSVlJdzJ4UTBtYWxvNE9WWE43dG1rNTZ3elFHNFhSblNHSjdHRzNh?=
 =?utf-8?B?a1drQU9TSVdldFRkOFpmYmhqZnRSU3hwZ2VmaG1zN0l0U3BxV01yWjdxQ3JP?=
 =?utf-8?B?TGZwdHYyTUtmb2QvL3J6eWdKbG9HLzZ3ZEZOSEsyTlg3d0dXL2FwM0lNTldj?=
 =?utf-8?Q?RPsE3r?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:46:00.4639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2993c6-b12e-456a-5d06-08ddf6b15237
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5746
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7wJwbvcAB+9P glhyJycKdTctxdSQo2ATKzbKIiBnX3UjfrL86Iy+kkK6W/NDivIL5zBMwYp0KT4G3bxyeMnp3g9 RmSdDwcqmRwPlQsLpUjQmvFkH1ezRErLFBabYrFZLiwjSQc7CRV1+Kxy+EXjLcchdjbZCHi2W+z
 2Q34rrc1kTOjC2ZVV3ybj3duedjrstf34niNWK0ileZ7rvvqvHHdMms1rqKq3d5SFqcGt9/D8fZ dH0bgtrnJh63oDz8svK6vxZ/oujZ3kZDP5PShT0spnMsy5aO4dojoqeo/YsDzdwCmis2icefuoe EKO8TRgdniCMLYP3d67abnVlD7PukLR2ALvSIF7Uv4Wi6z6kYnHlc/FR3nzwUUcs9mnp53Wb0Wr dPW4DmHa
X-Authority-Analysis: v=2.4 cv=JYq8rVKV c=1 sm=1 tr=0 ts=68cbff0c cx=c_pps a=7WY7GTgoQuM1Lo32AUII8A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ulpFtCY-0pAA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=ClRX9533aplJ_G3jfB8A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: d-u4JNFDiHj-vUMSFfbcQ1H4LneFcE6l
X-Proofpoint-GUID: d-u4JNFDiHj-vUMSFfbcQ1H4LneFcE6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

Hi Sakari,

On 8/19/25 16:47, Benjamin Mugnier wrote:
> This serie adds the support for the vd65g4, the color variant of the
> vd55g1.
> 
> First patch is the device tree bindings update, while the second is the
> driver support per se.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Is there anything blocking for this series ?

> ---
> Changes in v2:
> - Fix smatch warning about vd55g1_mbus_formats_bayer potential overflow
> - Fix vd55g1_mbus_formats_bayer dimensions
> - Link to v1: https://lore.kernel.org/r/20250819-vd55g1_add_vd65g4-v1-0-b48646456c23@foss.st.com
> 
> ---
> Benjamin Mugnier (2):
>       media: dt-bindings: vd55g1: Add vd65g4 compatible
>       media: i2c: vd55g1: Add support for vd65g4 RGB variant
> 
>  .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   6 +-
>  drivers/media/i2c/vd55g1.c                         | 234 +++++++++++++++------
>  2 files changed, 172 insertions(+), 68 deletions(-)
> ---
> base-commit: 2412f16c9afa7710778fc032139a6df38b68fd7c
> change-id: 20250818-vd55g1_add_vd65g4-8e8518ef6506
> 
> Best regards,

-- 
Regards,
Benjamin

