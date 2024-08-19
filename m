Return-Path: <linux-media+bounces-16481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2674956F7D
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 17:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79098283BC9
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 15:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88177161320;
	Mon, 19 Aug 2024 15:59:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02hn2223.outbound.protection.partner.outlook.cn [139.219.146.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037E130A47;
	Mon, 19 Aug 2024 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.223
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083193; cv=fail; b=ThDCeSzKJmZGsjB4aW7VRiqdbh4MjX/sFR0o8R4JmXZaiMr4D4UUc3bXzSoq/TBJV3IfQPoJrUU+1SNl/kwAbZAmwtv+O+DBYdCXPTXfikYGCrvbVUWU9FC/XvPN8MD5cgDN6A21ypvf7ML4mlxVveF+87IXtnblomD950a1wng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083193; c=relaxed/simple;
	bh=BaLWt2R+o6wxmq0VSTBUW986OKa6ZAas7gYqzPY5YV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dTKW89xQzw8RdQdSnPQSHnflcRWYqq3zwsGhF9/NQnJ3PJu2w1f640pXMBnoegvysFUgvO/WyFyuxSLbIDFMhGgLsKuDNazPEapua3y0akC2Th3lyzam4Uev3FGz47ohrCaosWzTChgQod5UP0gscIi7kuqjjQHqc0VCdlm6KPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcxmrFcoXNIaUNwmRBACvw9MUTmeyKUI0n3g/prtZutw36hRKjFivQ0CZoobDVfuYCfBMZ1mpoLbzWZ4Y812jsQ+xFtxX6n5bfCc7AL/DLvlclv9cyXM+39KbfUK/C+YCx916wlBA6QDNT0Cg+z1nxwT612vWgTkALrgrwHUy60bYkAuH+Z+aoD6WzWPhRAqXMUy5JQ5Fuj8MBwo/Givxi4uqZywNaaBzPzl4CZCiYDRH7qW6VfYe8gWjdEugNdYXlxDAqGfrC56fgNnYSacrBCtayiR5VgMzKnkNAClZXTW1xPd0gMns1IRxJLrGR/GyF0FlTpL30Eci+AjxQ3GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZoWEWqCxI6L9GZ1c4RWCtpskKMrAe71LObOhGRfGs4=;
 b=SNAX7kIPEa0LtJYJoTWG4yIBpOqPxo1A5iyFjzlu27tnXTCFaY1B+zsn/OXVZTel7izJF2BvIL4tvTjPJL5Q2FvA8Y9Gk73BMN7p1Mwh2WM6kVIRSXGHciQ8P3nI4uitgGkjNH9ZN7WCxaL6YAG3tIZL2DV51kgzo7BkPJq9sAHzcRQzkjNuuOup9yjmah0ze2Bq584FXut4E35EAmNyh4eK+pNoGkkeGhzUL5XAJPqFbl4ZZQGmjusQKSf/YeJNmHk0Wl1Litcr/gLB/GYKg1aw/wa1rYXpJEnrd/CU72016+8DvstIaWPXSdSSqBH+oC5ZidXkLjJZiXooS2aYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 19 Aug
 2024 13:27:29 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7875.019; Mon, 19 Aug 2024 13:27:29 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: dan.carpenter@linaro.org
Cc: changhuang.liang@starfivetech.com,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	jack.zhu@starfivetech.com,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [v2] staging: media: starfive: Add the dynamic resolution support
Date: Mon, 19 Aug 2024 06:27:20 -0700
Message-Id: <20240819132720.538468-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <90939451-4e26-4aec-bf69-d078d88fb5c2@stanley.mountain>
References: <90939451-4e26-4aec-bf69-d078d88fb5c2@stanley.mountain>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::15) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1031:EE_
X-MS-Office365-Filtering-Correlation-Id: 4565d5e7-3b14-4219-d62e-08dcc052ac39
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|41320700013|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2oN0iJ9jdTDyH7Lo0Cf0jKINhboiEDpcMLPMgSy2FH4cXIKKRzTOiz/ST7Hg?=
 =?us-ascii?Q?TgklwZp8yy8ee7IMbSO6oNX8Qytu7gvZ2g5qmb59dOXnlXXY645U8xofVi/f?=
 =?us-ascii?Q?ZOZOvplbl3unfDaPqyYkHZUtK+XXTwtWN1FptOpm8Zj+NMky5ks3+Evau7A9?=
 =?us-ascii?Q?0WU3lfUjlt/lPP/UgvvNoJH4ppUuL0kTgebuwqoo8DJeBW9FKlKBjT7UamS2?=
 =?us-ascii?Q?tkb3Jiza69um7tAxBXLb1iP7gJ6TJDGbQjmm0FlNay5Bpf/mmd1ssdxyAKIc?=
 =?us-ascii?Q?XXKxP+QmWZmhOYxAb2qdVaC/8st7+vQh9N/kiwMnA0Ewwrq6GYVrCRVRtPrI?=
 =?us-ascii?Q?lO4rmFLWcNMYxNqHwuU3M9Ltnjg50SjTh6vHGTAEfnE1S2edGAZyl5UzpNDQ?=
 =?us-ascii?Q?N5nADj2bhxRq9xOVAVAKL/nW2i0mpQO0bBtAHvFxOpSRdLTPa/N96M9FItjI?=
 =?us-ascii?Q?qsV5Z6uev1pVpqKxr4DRQUWjx3c7U6foFp745Gap93asfegoOhRbyqeEwBA0?=
 =?us-ascii?Q?UZTEEHGEHOwohJKcOzU7yRLBqint54Cc5WVvF3+htdTquFmCcf1GnmqfUDPh?=
 =?us-ascii?Q?c2aVOBUpePsx3lLSkTH9Edlzt2iVjBi07bZc5aX1yYpZNnJeJOw0r4QBLFJ5?=
 =?us-ascii?Q?iC+xJRHmP97U+aMJsDyhn0jnPwc5ObboKRUUJatL2B3gLpPINDZEDINpf+b+?=
 =?us-ascii?Q?mD1SBk4DtgX1MlpXow5I6qrr7bJ4EXgYbFCiWvClu7cTuDhuAKHv4oHDEqmN?=
 =?us-ascii?Q?Pb6uvgz2l+RpX3Xr2s59IJeq7fo7E60VQ3lCLyjsrtDBp9IQzpW1Fn06XjMH?=
 =?us-ascii?Q?zkUOOqfQR6IJiNuo2oN6woqNcHCfUG3WMlV7WTki8LIYu0T7eBp3jwSeaDMO?=
 =?us-ascii?Q?hF2XOs+87DyVBWqj/LiebPgrAxKFy+GEgtFX4QAL52t07js7qPtx8j4lpgSv?=
 =?us-ascii?Q?4uVPlYQgyIzSL2A6Uqg163Suy/T/EIMXzRtg+uHCeFItAfjxKqhQem+Ak0/k?=
 =?us-ascii?Q?wHLG8cZuleJ1DsOztAASovMNml0M7PAqqYeOfuepFou95ce1aQzNVM9e7JdF?=
 =?us-ascii?Q?colVgIIyXKgffCjrZ3Wk9mNOt63608mImOd4bN17K0KHDSFg4IGpSfRrrDih?=
 =?us-ascii?Q?oCOyJUvLurXalCwiBfCkF/2Oyvaqu8oUVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:OSPM;SFS:(13230040)(366016)(41320700013)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l5XjsXcUj631rZUlSzZjPqqCd5H6LF7yx5yP56yUViSgjmUVNr0NhBnVe7hs?=
 =?us-ascii?Q?95D4wPhkyW3Z0VyRqostHkJNxo0cVvzifEfv5EXg5PvfFIvC0dGFVE2iMX/a?=
 =?us-ascii?Q?ZPpLvhy33x7def/1LsLCmZLi+NYrmsUQxAV+/l/mIcmuyN5h5BLUh0tQ3boF?=
 =?us-ascii?Q?Av1s0ieDf0UPIAOFZnRo4eDzlhU1JDqx3D3S0JoFmjdeUPbhoa3aa6cqr1R6?=
 =?us-ascii?Q?YoXxlxfcFFhXMLnKLSJFEw3+ckR4KpdPBoGU/1wMGco0MG0kIAqsN6BLwvTt?=
 =?us-ascii?Q?ewmMV0fJXt34pF16qPGNGGIAzIP1+BefEgs7Cd9rXpRORDifKPe4G93/614P?=
 =?us-ascii?Q?f8JafLQLhfzGBeJpB2IcV5MgTzLAbfuE1ALrSqVGpJ6tmY4r3uNpd6mjiE0M?=
 =?us-ascii?Q?GMGAt2KkBnjTsmYPncC7LaMJ61k5dcEGR13vaH/rO6+aehT+mkbAQXKsKN8E?=
 =?us-ascii?Q?hjs9KgJ9ztp1PKk+bDt4pEjjjMXka5V7oii0sBaHfjGufsr4JkXLVl3sy0wU?=
 =?us-ascii?Q?hB+h4Pri1N/uj2Vn9ZFRd33PUOhGOJRZg/kBOteTj2y/y5/JDWDUlHlcMF4P?=
 =?us-ascii?Q?jOPVjkKNu/s9sv309TE6s/9PnsCvxLRfm0TxBQB4LolPaQ6ZYVE8QzqIIYps?=
 =?us-ascii?Q?hBft/TpK71CwKGMOOHKwXxL5K3Ag9EZzpii0skGJt90ooX8xF3r6ZvGrOpKW?=
 =?us-ascii?Q?g3UbNJjbNglEirMJpvVGPHTqkf0UwnbQVWvtjMR2kaBVz708Lp7UAq5wYcJX?=
 =?us-ascii?Q?J/Lwl6+Evan4YMAFvaybeIZcrG7V3HffvV5dxBHBhxgmWCxrHjwuTzfHR6UI?=
 =?us-ascii?Q?9B1/OkagTXCrVvV98adDGugqOTC89S/8zJHhzyhckG03nL0BCNLyw27C0hEt?=
 =?us-ascii?Q?7M+mzfsmjpfrYGMONfeFAujpU5INrH4HbI63xzN+GHdP3jK0BhHUMYLY4tpJ?=
 =?us-ascii?Q?KmDRXsGUrDINKV0mg53UrKaOGizprItdU9YOlby37U3MDv+F6adfHTEwiEgg?=
 =?us-ascii?Q?247d4dkRg/QBZCr+ZWVYajfy9LCa3H/G8D6024RYh9x0/1nCRdOQ6ZhN0IAs?=
 =?us-ascii?Q?65anpWb0FLUfkTGirsWo9RbMbwWklBfIsNIhxDcDYqE0M8b9/7C+Bhhzm8e9?=
 =?us-ascii?Q?Qz0I7Zujwyc32s00RLtLSY63RSqU/NBabG7PVgcGKeXH4XAtxjMyCsJrQTBr?=
 =?us-ascii?Q?8HZRGzSQwWqo02MohOzJIpxA0yWERteZsbgI55Ys3M1lW1HDIQzHFHievmzF?=
 =?us-ascii?Q?Tb/yEwt0/+v7cjfVUxjVQsSlVkrLbDuh+2r1HJJOBs9Gz4z5vUG+PXLOOPQE?=
 =?us-ascii?Q?qpzIAxKSWAoXzOkn5AWnDPH7E14H3iNKsC4cNQdKMz08AaDS8Faosog7hVtb?=
 =?us-ascii?Q?Yj5BmILwwtr/mjpSLliXywAMSHij2F1CucSz30kbaKcY1s8IRs+86qsOt4Xr?=
 =?us-ascii?Q?R+RRbUhWDsLpGsrV55L4zBrqZxY9ErCEc7c+hOZgli+6HF73F9fTKd4x4eyj?=
 =?us-ascii?Q?MRNEh7X9QfjnJwMlQ6cTRnO+HFpv6MJK5Dy2yATJeAJ4EmQ0uTQH5s6WPJ8n?=
 =?us-ascii?Q?NbQ70QXKAO77Tn8uuNjSRKip1GV+ddc2ZfBCkdgefo9NHj5kHZ4hzb4cBXz1?=
 =?us-ascii?Q?nkPbwF+nDApzVCchpH8v4zk=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4565d5e7-3b14-4219-d62e-08dcc052ac39
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 13:27:29.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10LtAvHBA6dMjx8WZYrObwvFyCsNW7hjqgR0TtkiVpfLcpghPfhyhLxN/St5SXC52ABM0yQYgkg2FjaSdxCfq1/yvXz/Y+xzQ7+ODIKJCcDbghvE9PYO7b4AZtbdFcHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1031

Hi, Dan

Thanks for your comments.

>On Fri, Aug 16, 2024 at 04:04:38PM +0300, Dan Carpenter wrote:
>> On Fri, Aug 16, 2024 at 05:51:32AM -0700, Changhuang Liang wrote:
>> > Add the dynamic resolution support for video "capture_raw" device.
>> >
>>
>> What does this change look like from a use perspective if a user is reading the
>> git log?
>>
>> > Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
>> >
>>
>> This looks like a new feature and not a bugfix.  Please describe the bug more
>> clearly if it's really a bugfix.
>>
>
>Actually the first version of the commit had a good description.  Just go back
>to that.
>

Yes, I forgot to synchronous description.

>> Add multiple resolution support for video "capture_raw" device. Otherwise
>> it will capture the wrong image data if the width is not 1920.
>
>Btw:
>1) Don't put a blank line after the Fixes tag.
>2) Put a note under the --- cut off line that says what changed.
>
>https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>

Thanks for this.

>Please send v3.

regards,
Changhuang

