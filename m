Return-Path: <linux-media+bounces-50105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A335ECFC7A7
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 08:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3D3630B8FE0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 07:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D70285419;
	Wed,  7 Jan 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XftRN4qX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732228642D
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767772581; cv=fail; b=jM+v1Uf8L0xQMYXduaORVsdZvXB+eCZqMBLOfaEqi0R5bwB6ZdOXZJb5NcDCtpdHW7k9Lpl7QYfmFObM1pWoXMsF0AMo7sWeqnaFP1JTSTOFoglAe5OiqPkkpsk9C/C63Ts0emgyzbAu/NJF7O5aSNtk1ANt0n469UE9Sz5ncn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767772581; c=relaxed/simple;
	bh=Qy+pdK45jdV7zHptV2Ip0ANWgccWO5btP5VkIQnnoZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G+h9whXhOB1q2sDbftMcfj0q+2cmcDx8Wg61GF6Kl0q3bG69cYXij3mZo1nwRpwvseEdbbSg3wskZM9g70+wqaA66wbLR8Q8Wcw4Dmol0TAdpsucH2HSL3s8ii92FrDZvr0IyC71XuTwbJKwB0Foge0wpcu3cAsw7frd56Sn3jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XftRN4qX; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6077i8rw2922507;
	Wed, 7 Jan 2026 08:56:12 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bh6yaj025-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 08:56:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRE/EfE1g8lNR18XIXiGyKtTIdW3oewfp4sxHW3WkQDaM9fZfDUw3G3BEiWqvtsCZFmLajVACuLrBzBZbh0bWPZcsxhO46WSV8jG9peaa44LKpZTeapWpIqpcoFOMq6Dqhf3x7Hh3mwyBkZV3j6UJaCAcSQ6PjgA88q2V4hv1tOfJDqmRLgKzLhOzKKDMXKVA7A9ocz9HDf1QTfDG1RzR1L9112wnRydVUQClciekQsrAUcex4/wmeSCuyoSPpWDb6LQl8Xud9l3RTOwNqC5cGRcaO1Q8aaobGtQnD1d9CrBl3Ru0B/e/vcX7YLENX29BdwdcDIjd9xLeKtmuirXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzpkkvLcjBGlj2/GQtJjbeZHL8M+aJyMXgNSj4oDrf8=;
 b=uiWqxMk/8hyu9a6lOvb3vrBmnsP4g5herCKvnGPnq9t9U6X28oKoJv6ZjwwFAF2pz1OgtmdvVy902cBUURcW7iy2NyTCoMEugkyYoHR1oCAAQEXzRmTuhqxXoX05MPYH8CSDOLpURjp1gOjFALK9oWZMOxRAtMPyKGL4Zz+uvwrihGE9avrxXaB/2QKTjjuMQaB7jSl/xQJomhfml6HQ1kBbRkZbd+PNYCB6pLhsOEFOlXngIL+q1JrYfnGBDrbBlCk+L3PP+b+OESQ3OnWZbqFGF1Bvy7BDuf4dy5f7fBqTlx0Z+k4Zj0BpM1Ydp/Wj5iLpprRZHzd3YIf5eoYn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzpkkvLcjBGlj2/GQtJjbeZHL8M+aJyMXgNSj4oDrf8=;
 b=XftRN4qXMC80d/ZE4/zoAXa960sa7bqlU7hfJv4C59LEq0ay8kXbma6rpTTU+adDZfDr1R2p1b3i4YDjIVcvjUX7IlNilnNfs75xA8eLtic9WxMSsU4YFy+CQk/uMrw3fE3P8uOJznCwsL/+HCg9EjWAMa7ntOk3Kj6fjckHPYmqU2hNYr4SHM2rIfSaeLk27VU6o4EEmY4j995GY2QCzeTfHAn5IbS1oG2mLHyb+zbmgeatcAeV8cDbrdRWYvRKxgl4JRST8DjYXBLekJ7znmWHuWzh/KlD99mmG5NDaAdOFKrCW/+19IfXNl5/tGA4FI+ivFSTazmY4657pSw6Vg==
Received: from DB7PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:10:36::19)
 by AM0PR10MB9672.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:741::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 07:56:08 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::4f) by DB7PR05CA0006.outlook.office365.com
 (2603:10a6:10:36::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 07:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 07:56:08 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 7 Jan
 2026 08:57:21 +0100
Received: from [10.48.86.207] (10.48.86.207) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 08:56:07 +0100
Message-ID: <c835dbbe-7046-4763-832b-cd81a3b54147@foss.st.com>
Date: Wed, 7 Jan 2026 08:55:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
CC: linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
References: <CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
 <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
 <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com>
 <96dc1231c7d18f8106e4b5e56a336add377ee235.camel@collabora.com>
 <CAOf5uwnofTZ1ARzqAD0Tevz_gX1w=Uv5b7Q8=-ZnwQpioZvXuw@mail.gmail.com>
 <4158785f415986924f916f4bfe1988376806f8ed.camel@collabora.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <4158785f415986924f916f4bfe1988376806f8ed.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|AM0PR10MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1e50f2-c821-43db-59fa-08de4dc237b3
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bkx0MG5jekFjRnFQTWc3OWpsTG9wazluYTdhdVNiTldwNFY2THFSWVBLaU4v?=
 =?utf-8?B?UE9YK0NvMmZsWW56R0MzVWRnY2NQS2c4NUlhRUlhMmpseVpPQVk4N1FaUE1z?=
 =?utf-8?B?MnozTXBNaGl6UFhiN2NGU0dWNGRxVWtqQ2F3M0JtaGdEQ1RiQTB1UWIzRnRp?=
 =?utf-8?B?SFNMUVYwZzNCTEU2d0RpV1FrT2NaSERENmQvS1lGSEQ2eFZBVFMwZHRFZHUz?=
 =?utf-8?B?dll0L1NKMG0weTZyeEdqTGFObXZ4TXN2V08vMUVhRE84YnRSSGhPbmdyT1cv?=
 =?utf-8?B?OEl2cm1HVmw1MDh0dzV0TTR1RkpSYmxPeWVlQXQxcllvRWVLWWlGUHM1b3ZK?=
 =?utf-8?B?dXBrdThrc29ocHQ4bGw3Q2R4WjdVOUF0UHNwaVhNZjVGSEJneEFMNytQYkd4?=
 =?utf-8?B?Z1lMT0RDWVRCc0sxZTFPZHB4djZ4NHBTbjRXSlloODFONFowbmFFUDEwTE9y?=
 =?utf-8?B?czlaUjhFK0h2dS9mNFlpZnVtVFZ0QzRPTm9kTEllNE43dnJ4SU5UMVFGUFUw?=
 =?utf-8?B?VjBDcXd5NnlGYXJFekpFQ0ZXUDhGQjVwZ1FrYlJvTlR0cW9KYTFOZXpKOGI1?=
 =?utf-8?B?dVZ6cVU5NXdpbElTM0JtR2hXMmFVYjZ1bzdWYzhrS2tFaXhFSkZMcDFhVktI?=
 =?utf-8?B?RVY0WE1mUmVjbmMzNHU1WmVvK04xRS9QSkRFc2IwZkVlTXpZeVFsekZaSFFt?=
 =?utf-8?B?SG9sY3ZKMG81SUwxSitpZUZHSjdVOTJSY3pQS1pjTVZsVWdkNzNYTTdwQTEw?=
 =?utf-8?B?L2RCeXo3cGk1UUtGWk5KdlR5YzJtS3RJbWRQU01Oa01vSUo5NnJJK1ZjOXpy?=
 =?utf-8?B?cnA3UkFTUHp5L21VYkhZZXJBNGNQbkxNTUFIZXNwdkl1WTNFckh4eUU5b2h5?=
 =?utf-8?B?d0N3bkVvU0JEMFlRUkZLOVNDZ1BiR3JuN0Jka1JNSUFid3FxZmlBeGhVYUg3?=
 =?utf-8?B?ZmlZZTFpVjlVOG12SWJsbkJlZnZReTJGU1dtWVNwazUrazBBY1BUZTJ3K0dk?=
 =?utf-8?B?Q3VRRnNFRW1ScUpKaGJrdTV1bXpVTkdwNHFRUUJQVXk4WDNTb1RKYi85Sjli?=
 =?utf-8?B?YXQ4WEdESWNCcy9tRGt2dk5Fc24wa2p5aG1wcG5ET3orT3QvYnlKN0JPMEVG?=
 =?utf-8?B?bUpMT2xKMlJ0NGNhUGpRSmw1U28xOEJVKzNkSkpncEdGTHRZM09VR2JmZitZ?=
 =?utf-8?B?NTgrbVp4ZzVwbS9VTE1wV2xXSlpvTHVTeGNXRzB6cTJOOUowK1JiajNtaVg2?=
 =?utf-8?B?amJLWmg4ODU5VU9yK3VKVUU4bkNBWjgwWUtML29Qc1MxamdseDN2dTRFR0Rl?=
 =?utf-8?B?K2YvVWJxYmhycmUySExxeFI1Zm1wSUVyVWdtWnRrZkgvNTRRbzNlVU56MWxU?=
 =?utf-8?B?enhycFZkSmpGaXVDbzQxQzhZbWx4M1l0ZmZMUVo0Vi8wU1VMVHhUWFUzeE5Y?=
 =?utf-8?B?ZlB2cDRVWHU5RzdFQlR6RWlZckNtK0U0NVU5OFA2N09kd2MrNUJUdytmc21y?=
 =?utf-8?B?U25XZExpdE9ydTdVZzI1ZGxYQlIwbndIT3dQYXRtejBWR3VtVmx6c0dlc1Zr?=
 =?utf-8?B?bjJySEhMR1V4cGRrQ2ljRjlNNGhQazVLZFFNQnlrNGdtcU1ZbHJqaTBvVW1p?=
 =?utf-8?B?VmhsckppVCs5b1NCL0Vkb0F3b0xtYUM2T3U1ODNDUTZSaDZvb3l2aktVSEwv?=
 =?utf-8?B?aDArZ2pVcG9mZkdsalRKc3VlOFgxVVBVZnRSMVFURkVRMGxkSlpMY1BkK2lR?=
 =?utf-8?B?TnJqUFFVOE9zb3l2cjRXU1Y3OXV4dkVNSXlkQmNpZ1Vaay9FMG5NenhzcW5t?=
 =?utf-8?B?OCtwUWQxTVJRaWVnYVdCYjRDb203TTQ5VUxtMzZBN3ZoWDExRTR5ZXh2OUFN?=
 =?utf-8?B?UzRJWVdYUFM2QWhhVTAwQnlrcnlzQ1ptZDhWditEYkZYSmhiUG43ZHN1QmRr?=
 =?utf-8?B?SmYxVys1d2ZKaG5EZkJxdHJuYVA4am1UNGs4M1plY3RHSjRQamp2QkVKRnY4?=
 =?utf-8?B?YzBiVjhYcG1Va3R6NXBxVkJFVkxHRDFWUVFhcUk1WENJTmhpS2xHK00xMW00?=
 =?utf-8?Q?dhBmea?=
X-Forefront-Antispam-Report:
 CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 07:56:08.5618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1e50f2-c821-43db-59fa-08de4dc237b3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9672
X-Proofpoint-GUID: HRjE7P26ITZ3vAQfk3ugKJLsLfDebs1-
X-Proofpoint-ORIG-GUID: HRjE7P26ITZ3vAQfk3ugKJLsLfDebs1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2MyBTYWx0ZWRfX7IGpey6sHwiG
 0WyeUC0FK3oiWnUUQHoLm67mdBb8vu6AGamCfrJAGPjGmr3V6V5jtWEzrnO4Y4FfvaZhltHZ6aO
 sIfBfRhMaOpSO+szS78BjR9Gj5gRM8rVfV+P3ThK3nO618kvvfanEhstmp+a9a5HufIa3gZK31e
 Fgh5OOieZvB7/rBL0yrXKFjpI+CeQSvHS3BA0TiUa6W2QZQ/Pp41P12vbMni/vFELn3UtcfeUIX
 ekuQgDJwthOKCeqE7sqj/ER1Qh+y7qEDtZmYYmz+EFazY3nZZ4A/EFv/VEKeVrhHzvEQbooJG3h
 wrpggttz8HL+0+eG80kSEeXTQFvucgoUi4NYNYqv+v0Q2pdYoUHso7XGFyb1LvV0ldDliIboWMP
 5E2Ofnl9Nuftd76avUkLRpVnEcBnPtLjIxoVBknjZa1E/BNWm2uZIfxj24+6QDZCmvouh1yGwJI
 +kWiHfoORZzT8OAMUww==
X-Authority-Analysis: v=2.4 cv=MY1hep/f c=1 sm=1 tr=0 ts=695e119b cx=c_pps
 a=T38ZVIHQc1O2jE0KAdCSkA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ljw7rlW6FSYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=rfZIK_W7AAAA:20 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8
 a=tLo5K1PXgFhq3j1-XtAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070063

Hi Michael,

Sorry for late reply but my foss mail account was out of order for 
monthes...

As you know -but Nicolas may not- I have added the jpeg decoder support 
to upstream hantro driver here: 
https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/media/platform/verisilicon/hantro_g1_jpeg_dec.c
It has not been yet upstream but I hope to push that in coming weeks.

Compared to the code currently available on github, the restart marker 
interval support has been added, this is the same fix that the one you 
shared previously.
I have an additional fix about support of unaligned resolution such as 
800x600 or 1920x1080: will be part of the upstream serie and pushed on 
github.

About NV16 and NV12 decoder output: these are the only one output format 
supported because STM32MP2 doesn't have G1 post-processor support, so 
STM32MP2 G1 decoder only output the "native" JPEG encoded format on its 
semi-planar form, either 422 => NV16 or 420 => NV12.
As most of USB JPEG camera are streaming 422, no way, we have to deal 
with NV16...
Unfortunately, GPU sub-system doesn't support NV16, so waylandsink 
cannot handle NV16 directly: a software conversion is needed, so we come 
to the pipeline that you have already shared:

v4l2jpegdec ! video/x-raw, framerate=30/1, width=640, height=480,
format=NV16 ! videoconvert ! waylandsink

with a big performance penalty of software video conversion...

BUT you can limit the performance penalty by forcing NV12 caps after 
videoconvert:

v4l2jpegdec ! video/x-raw, framerate=30/1, width=640, height=480,
format=NV16 ! videoconvert ! video/x-raw, format=NV12 ! waylandsink

Doing so, we switch from a costly NV16 => YUY2 software conversion to a 
light-weight NV16 => NV12 conversion.

With my Nexigo930 HD camera I can reach 720p@30fps:

$> gst-launch-1.0 v4l2src device=/dev/video7 ! image/jpeg, width=1280, 
height=720, format=MJPG ! jpegparse ! v4l2jpegdec ! video
/x-raw, format=NV16 ! queue ! videoconvert ! queue ! video/x-raw, 
format=NV12 ! fpsdisplaysink sync=false text-overlay=false 
video-sink="waylandsink fullscreen=true" -v

/GstPipeline:pipeline0/GstFPSDisplaySink:fpsdisplaysink0: last-message = 
rendered: 93, dropped: 0, current: 30.99, average: 30.00

Hope this could help.

Best regards,
Hugues.

On 9/2/25 16:55, Nicolas Dufresne wrote:
> Le mardi 02 septembre 2025 à 15:30 +0200, Michael Nazzareno Trimarchi a écrit :
>> Hi Nicolas
>>
>> On Tue, Sep 2, 2025 at 3:13 PM Nicolas Dufresne
>> <nicolas.dufresne@collabora.com> wrote:
>>>
>>> Hi,
>>>
>>> Le mardi 02 septembre 2025 à 15:01 +0200, Michael Nazzareno Trimarchi a écrit :
>>>>> If you only have one format support, you don't need to force anything in
>>>>> GStreamer. Some extra information about Hantro post-processor. When used, you
>>>>> need to provide 2 sets of buffers. The decoder will still produce NV16, and a
>>>>> secondary set of buffers is (in parallel, pipeline mode) written back into the
>>>>> format you have configured on the PP register set.
>>>>
>>>> Those sets of buffers are provided by gstreamer or how does this
>>>> handle in practice for
>>>> other decoders?
>>>>
>>>>>
>>>>> The post-processor can also be used in standalone mode, but this feature is
>>>>> often fused out. In that mode, in can input interleaved YUV, as often produced
>>>>> as raw format by USB cameras (and most cameras using serial links).
>>>>
>>>> Much better. Now I need to understand better about the two set of buffers
>>>
>>> the V4L2 API does not have the notion of primary vs secondary buffers (unlike as
>>> an example Vulkan Video, which is 20 years younger :-D). So we endup hiding the
>>> primary buffers inside the kernel driver [0]. Just notice the this allocation
>>> allocates reference buffers for the decoder, and the decoder actually allocate
>>> the final buffers. This is quite convoluted imho. Note that some important fixes
>>> have happen on this part of the postproc code (which arguably still need a lot
>>> of cleanup, a proper split between G1 and G2 (and merging back VC8000 into G2
>>> since this is largely compatible).
>>>
>>> https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/next/drivers/media/platform/verisilicon/hantro_postproc.c?ref_type=heads#L224
>>> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/db300ab0e9d38b1e1b0b561333b66a5beacb9994
>>>
>>
>> Ok, I read the code, but I have some doubt:
>>
>> - the NV16 and NV12 are both available as the primary buffer for the
>> decoder but you don't know until you plug the camera and start
>> streaming, so I suppose that in this
>> case the size of the primary buffer should be computed based on the
>> biggest format.
> 
> Since JPEG is a stateful decoder, it needs to implement the respective portion
> of the stateful decoder specification. In short,
> 
> - Userspace should prepare the OUTPUT queue and provide a first buffer
> - The driver should parse the frame header**
> - The driver should notify that the resolution/format has been found
> - Userspace will enum or get the information and configura capture queue
> 
> 
> ** JPEG is the only codec we allow in-kernel parsing to take place, other
> codec must defer this to a firmware or implement the stateless spec
> 
> With that mechanism in-place, there is no need to allocate bigger then needed.
> 
>> - I think that hantro_set_reference_frames_format assumption is to
>> keep the one supported from decoder and match the first one match the
>> bit_depth,
>>    so it can set as reference the NV12 and not the NV16
>>
>> Is this correct?
> 
> Its the bitstream that dictate which of NV12 and NV16. The main issue you are
> facing is that only bit depth (8 and 10bit) has been implemented so far. There
> might be more work to support 422. Note that G1 is unique, since the decoder
> part already support 2 formats. Though, in mainline we did not expose the tiled
> format (8x4 tiling). So if you have a 422 JPEG stream, your choices are NV16 or
> 8x4 NV16.
>>
>> The postproc_enable happens if we have prepare_run it means that the
>> buffers are allocated already but the buffer will be known only when
>> someone
>> enqueues them to the decoder. In such a scenario is there any driver
>> already solving it?
> 
> As this code have only been used through the stateless specification, some work
> will be needed to support stateful for that context. CODA960 support might serve
> as inspiration.
> 
> Nicolas
> 
>>
>> Michael
>>
>>>
>>> regards,
>>> Nicolas


