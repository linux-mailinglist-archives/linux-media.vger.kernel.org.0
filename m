Return-Path: <linux-media+bounces-15325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E493BC5F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 08:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9EDCB237C5
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 06:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDB416CD0D;
	Thu, 25 Jul 2024 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ZNUCPlpM"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021106.outbound.protection.outlook.com [40.107.42.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159C15FD13;
	Thu, 25 Jul 2024 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887860; cv=fail; b=fPlXqYKwTgr8qkhc/IFSJSVSJGlopn8XV7pDayiAsLS2NvvbWmehDu02jpn0Nlv0o0TpnuOpakNWJ11uGZYt0L85Hf7VI77J4g/AzsrvZdBs6KxZMyHqt/Yrme2t+ZS3hmiY9qj6ENBOfPWYbxWr327PvIERB2avQBACALS+LnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887860; c=relaxed/simple;
	bh=D970LIGCthGR0/ri/6BUJJAKhO2QNrqEJvBqMuiTp5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e5W0cMfcQu8hPtw1IfK3iY9kZgUL6dPQ/glu55yPT+FGTU/MycV1yMGHldZuzvt4abw+I8oIRbpP3QW/uRdy+8jEq8TeD3lIuZtmaQy4NIKZHvG+KnVzlI3vZksLH491S2vYzR9+caRs5n/JzpqwR3Rf09JXBflf3uTQ3qQ8GwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ZNUCPlpM; arc=fail smtp.client-ip=40.107.42.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaPAN9TIPuFIF7VJNHMhfE3a8ROu69YiVGs/lwoCUDTsmtghjFNxunnHMaVXotUF4DZFTtImEQbJe9RA6431QlT1u1/Ta9L7EUNGu9vWbJhxI4JuPuwtz8r3R3HfmOc2P8+jDQgfMjkL+5RW0hJAIE+NBHvXwBEpni9dEFILv3yR1xE2Jb/kT/sxp1+jkRKIEj9q0nhiLKk8rjcMLKcterDvz/WopOwiJJSzrq2URCoyV2yeFbu8oI6HuDtosI+6HH1TO+CwxnWv8w3Psv92i5Z2y5qfuGpwAa1S0387qSOzYw6B1G+uc5gpaVpME1twV+GdWG7rLUhxTN4VueD+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgcflCY42THp8S1Gu+oZl2RHDtAv7azYbU8IBdtVXkM=;
 b=TuA0urpilnjYZtAGZzIwSCPouhvokE6XL99M/BuUjexAkxYKEhKahTT6nRUJ4gEtHTNOWiVhIvqVJGavY/pixKO0Pb60M1YQI8KXQZIm6ixqaek4OESAeosGuvLEuaWBUYInAWQI+9yU+LsQ0bt2st443C8v4pIx6+M/C8wcXViyqbrp1oTDTCcdgP34p3e1lyqwODeYQPBWjBaedqRSZsrYTQAJSvijLrbMzfihDdtl34GXZAqQ/YjMWWndWVne5x2JBjvvji/jJFrJYD0ctB+8TunfLQBxmk6oNdEEArmggtFRNtUq28GLX/SExdQEZlm2Rng0gJE9NS55gB+RqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgcflCY42THp8S1Gu+oZl2RHDtAv7azYbU8IBdtVXkM=;
 b=ZNUCPlpM6KhydQegSmBul0w/tf0njINW9gqUeVG0+3Mqy5Q27HA1V3/renaWmNWeOn2CInttxC3BFvxwrUO2LcDdyVjyDzGJyjhMC+ystr0+0dD+2kAH6f8exVc8vRjJsaCSNIAefct64/Zdw+bOHTTijO7daULeRH53HBJ7nmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1880.KORP216.PROD.OUTLOOK.COM (2603:1096:301:d9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Thu, 25 Jul 2024 06:10:52 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:10:52 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [RESEND v3 1/3] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Date: Thu, 25 Jul 2024 15:10:32 +0900
Message-Id: <20240725061034.461-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240725061034.461-1-nas.chung@chipsnmedia.com>
References: <20240725061034.461-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0009.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::15) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: 4518fe44-f213-47ad-2545-08dcac70898b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JrOKFAnjbdEV4IAxUNt8JK1E57Tz80BiCYup4GOtNvUxT583pnLQfV3UpeOC?=
 =?us-ascii?Q?+rWnv7GrpbT5/rOWEe5E7ZA4qyUNt7POfbY7QaeyYEx5D0p+uFOP3HUbzDHN?=
 =?us-ascii?Q?F8V3hVvWaVm7uhCL8ONUdLP6n2UXRr0D5iCoTScApiGBWhk7mp5CBwnDAvWP?=
 =?us-ascii?Q?5T5DO95AcDHL720ZBxzi4PZQ0hTPy79aiQqoB4eEKUtCx4dQ9aO+BepXAKJ2?=
 =?us-ascii?Q?L5ZJCC0aCiRNpRSaJ9uGiwtEpg4HohaKSjFbHc3OPz8APyieqSoYGUY6/uYx?=
 =?us-ascii?Q?2Ni+oKVlvCta2LgNjR+XA+9e0JxIaNK/oWD/YPxXaMcC0LsQN+kw7jhg4rH8?=
 =?us-ascii?Q?zf4gi4ZwhNdXBLRlhD2T35p7cXRJN15bnPV6EyUOm+FnVjUyCZvqe1hf01ZG?=
 =?us-ascii?Q?GrOnOnXAI1RKfWgKkdBXcUy070voapyfTCAwvgC22oN2RzzBRMdMicnmpDve?=
 =?us-ascii?Q?GcnpPBrumqqhqZ6/JKGUrVU3rrNIz9WaiCngwkpo/PxhBrfGjQq0TXzgyGpI?=
 =?us-ascii?Q?XIds9XCKpU1TWGaWaWeAop312tTcHhMf+MnvWVr/U+NvnH/DnbakuXIH3EIr?=
 =?us-ascii?Q?KCvtXGSmT2U6SfUn69nBaLv3gAS9GFDXGiwLZLa3zK5PHqhlS448pREjHd32?=
 =?us-ascii?Q?TTSP+VjNvS+3nSGWVGe2PTgf7shb8OgMAlvJRBbYFLNSBpHTZmx4oC+Yc1YU?=
 =?us-ascii?Q?rxYpLoTLXAnbJ5k6HSQc1a06+HgGgYrMvJzMP1cm51zb95VkJlXelc1jCKLa?=
 =?us-ascii?Q?WNgJc/KjQQ2zT1G9vaV3ZmnMOAMbTyS0vdheR2E42ufbGZpAIG6s4YutrUZs?=
 =?us-ascii?Q?HTjCsiYhZHKPKoAmLIvbbYN7TpjgIiNScLIQZmgM9miq8Vl6UwOHSOZUQ7gW?=
 =?us-ascii?Q?aY3Qk/sJmuKTHPlWkqzQDNE/sazsIPOH5EHFKoI6Y9nFk+NeC1hvAUStzoo8?=
 =?us-ascii?Q?9vNeSa2UuXqIBSfG4bdDm2J3ruROvg1VIJR9YIEGFVpJQBToOlmU3tNlpMjq?=
 =?us-ascii?Q?i7rT5vY/3jsyFVXmQgqml9m4zImeEJHP2ys2u42p4fKaAb9b6b/L0Wv5v/gk?=
 =?us-ascii?Q?3Z3P/KYV8kNJ8hb8KmHrcOL8YxtgdqJigmjjP6onb2keBuvuIaDJdaFefiXZ?=
 =?us-ascii?Q?51qJASpv7ucfgCkUppdrFyUxlI+S7ClCdwJy9XubRW3nlBD5z8REOFkLDcb2?=
 =?us-ascii?Q?RVSxYKdmSlg9ZqhutkszVEdOygsnx6FENub9nMUVqFInWJthQF4zc+TbrWih?=
 =?us-ascii?Q?bt+fRpAR1Ka72HLr33UK6kOauaA6LcV2ImuwW6KkWF8VIDwoUGKUrYsOEdji?=
 =?us-ascii?Q?JizqT2KHF2c7BdPY/DsTBZwiaBwfxaJZ4ickJYY4+cRHSsbXPrPMyeWldATR?=
 =?us-ascii?Q?s0cqvKPRoVjF4QLHmB0Jp9c+GFMGUuilGtbazkKTe6cAG8NM4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8XU83G+lO67iXcfjOEXtQHrO4Afe/7isBO38su2so9r8rLXzw3h5aUXgSxm?=
 =?us-ascii?Q?JsDtX2p8uNbpBZawtul/jhfz3NdcVLE0fAwhGQv4uORSHHhzAoKe/oWU6bjz?=
 =?us-ascii?Q?wLN3eEztqNxTektJyKM4Sr2WMEepoIcU1igr7/wWLo4UNkbQxHYqgzHcUZzm?=
 =?us-ascii?Q?zyarKxGgBSndWfTev1xklzHs9LETcQioORKvvtw9uCmQKfD6Y3AmzRypVBKg?=
 =?us-ascii?Q?aMKJlKJ8WS5RbH8WDbX/nETFySTzkMCTgUkTYnuKdP09DTgXU0Pdwgr0Lmql?=
 =?us-ascii?Q?irGtk2+1zAsFLnOo2AcOzIcQUleGR34dV6NVx6JDbrk2+IT9E65axyXKmOn1?=
 =?us-ascii?Q?0/NNdjx03VWl5ybEKold/OGh3x9gtFWJ4WL94WG5x2HKyGwJloE0GLhHlBpP?=
 =?us-ascii?Q?/CPOuRQgYd7MSq7wSSs9oj/1pc4LZwjllBFzTtTGtTrD2Ps3I5XvV424hv8R?=
 =?us-ascii?Q?4NTQCtuDISRFdr9t5HRGZ/E5kybB6I4yb6xIzjlZyyuthDDILQ0xHyzGX8AO?=
 =?us-ascii?Q?7e3NUF9fIx/Ymc6KZ+0QFmUiln8ogC+ZnYjVkWLfAmZ9RHgiiv4r9HllzxRt?=
 =?us-ascii?Q?OKWKZfJ2HLX2clawya+rvXemvFTaTVJLxJGi7N4LLZZFxmEAajZN9+r/RyLD?=
 =?us-ascii?Q?RCZR5Zbz6inNjmhO9hgseGAhjFZ8fZ/wYeNbIb5jfcTOHtjlEn2XwfabWzLz?=
 =?us-ascii?Q?tdZL3u1ctcahnPzIg3jBQpGsWEmwCXoeHkifdr+HvjY5ZrqNQpV5bT2slnpl?=
 =?us-ascii?Q?lVSBJzeRj/VDjoDKeNcMCwUyolZyh+SMwiOD6J5RiKwiZc2SnqzepP9tSytG?=
 =?us-ascii?Q?C3aKFdMr0IRxTt3iZJVV1uvmT0nsFWWzoy1Jm5/xBkDFaaOodOjCGVSsO1Xx?=
 =?us-ascii?Q?izc4hxlwBlbZHzdF0l108iOfZQS/HScxy7LSHc813pdmn+qEQm1fJSraVNPj?=
 =?us-ascii?Q?zDQ5lJw3cOoiZR7m6o8hNW7OkA91vVzK74YQhOIxcUtzwclYeKjLh85j++Vo?=
 =?us-ascii?Q?gHvTLSwNyz2Etz2Kby0CS+5RBU59H6KSwRMgIE/ajQWuo+A0MRxYlcQYsegG?=
 =?us-ascii?Q?jZoLyb8EKohbWCwgok0+Owm+41LEj6w4AY5BY83lhWX3irRpbjoL9yAKp2y/?=
 =?us-ascii?Q?IK5NebvnKLg1PyS1mI7GWs3pp3XcgKXf+7IzjUZipBu5T2xuCx/JJJk9CiBo?=
 =?us-ascii?Q?ra1sYZFOYbN/WEPd06KuRObsWmuUa2yYNSOM1PBevzNDkBMCQCjbFZm0dPUl?=
 =?us-ascii?Q?CdZkqSiheU9i1T7AyprRkmoaAj3qrn/OvIr/bjpIDuPXPu/Obp9i7xvEX1GH?=
 =?us-ascii?Q?iGe/kuzhGtU8iCaD77xqtqCQ/701a8mBLMu2M3u4LcpCcvlCDBTQzL863Y7+?=
 =?us-ascii?Q?Ilh1A/le1YASnLVutIg4jfwkaFMDsx2tyRw3j73tfl5kxspvbmm8G/iEtOOX?=
 =?us-ascii?Q?vOxfzSFnMyT0Hken6RrN0k3H6HYtEfQeQQ8KyKVF+S9d2KMwEv26JRJ4bwWw?=
 =?us-ascii?Q?KKh+83K1KHQ+aafY2wqArjVI7j6jqWYHrdaPmFjYf0mEcaxa+ebj1ncB1Fb2?=
 =?us-ascii?Q?O9RJ0+DDS+9l7t3R4XSkIlbOeW8BdwrRx8pRIU3bOOW6FHC4vnKrGksvvEPZ?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4518fe44-f213-47ad-2545-08dcac70898b
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:10:52.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhqX1nzy9I5EfYC6yUYDLby7eoSNg33PWMKoo8N/jlgIznV7D/qmNLkJdYPdQLKm54a4Z0SkHMDIeSsUxrg884n4NFFfN5tOONytSfpH1S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1880

Explicitly compare a buffer type only with valid buffer types,
to avoid matching a buffer type outside of the valid buffer type set.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/uapi/linux/videodev2.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..8293b2197ea3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -153,10 +153,17 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	/*  V4L2_TYPE_IS_VALID and V4L2_TYPE_IS_OUTPUT must
+	 *  be updated if a new type is added.
+	 */
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
 
+#define V4L2_TYPE_IS_VALID(type)		\
+	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE	\
+	 && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
+
 #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
 	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -171,7 +178,8 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
+#define V4L2_TYPE_IS_CAPTURE(type)	\
+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
 
 enum v4l2_tuner_type {
 	V4L2_TUNER_RADIO	     = 1,
-- 
2.25.1


