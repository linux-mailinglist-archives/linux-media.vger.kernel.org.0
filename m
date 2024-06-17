Return-Path: <linux-media+bounces-13425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B790AC22
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEA592876A5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C17195994;
	Mon, 17 Jun 2024 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ZuSoltNS"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022019.outbound.protection.outlook.com [52.101.154.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576119596A;
	Mon, 17 Jun 2024 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621317; cv=fail; b=TXuVxZXP5PgvORue/Syb6Lm7sxvKpLhO5PrUrN7vx9qeAYvXIosqW4iHFnoBxf4CNBwVe2LekTRczgx1bC1OXd4r3S3u4bbK+EZ6rjMflf8l1kkWOPmh2rtJCFurp33/QGNrqfLij3cxJtkDFsafUEkv2LbPAknGQ5c0R6Ljnmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621317; c=relaxed/simple;
	bh=uk6SuBB2u+Fit9ySFu1vjc2rMhkV6UokUGyKfbhk/Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M26A8S1E7lfMtlF0KjwGZgQv6YJtDy+cYzq5JzvmQFeWgAJTh76sViFfp3mJqGbpfDFK3LzdtGa+GNSy4nRdcpTQepjdxkjLScdVFuFSDjBqckgR/klM0PjeJMBNc8ljvtIQiFx7aynRJKhHMa++h88zh48FClHizd9itu9YXn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ZuSoltNS; arc=fail smtp.client-ip=52.101.154.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5IpT/yiJ9UEYYyEpXZUsxXk4LvlhF7qyAoYYj7S/fBgvkPJF9jGf9aVIKjMT+MBbzwQ6EHawFa49XvhE8jobs4HS4TdfCGSL+lKHjUKoPEWMyWUT0AVy8Ugqrg3MVIFjmUQZDdvyL8YyrVdKWGhWB8LrML+omhH2BMf4rS4CqR7Rqc5zWUyIkALo3MGuRpf/OYE8kf1/LnoHRteLaMLJy8adFi1mQ2qXRqZOs80eQby0iE7p1lj2Aato3djSoZJa9R4+fcWLPlzW4lkDoATb57rpOyRUX867W0tD2Hg5F7QTOI2HVExH5v/Nxp2S+AEeIwy8rfhy1JeVe51QO6TxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urdNcwtB/GoxQgx35+TgZ0Zfk3vPK9oQ6i6knRNaVSo=;
 b=EkGoqjc5Sqfwm6et7c4FCl2xIXC+BjYEaGY0hGhZ6xl8BogyEO4a+GbamEZNspFAvxtjm7iDa/FdUggABfgpXR1iiK8fX2HWGRfFDuuaxBgrmNUdEgNB0zMZVQ1MpSUravxoIwIuiIV/zyRR8IzVH0YznVwPuqTDiwEPCeOltXx6jhxK8OpH0euscvUKqlf+4jp1XSAPJg/fYh/Set1l6wBJ+w5n5iybVTaIsigbJN7oeq4aSeLoY50ih6WgWvO7lYpmkEJZutEkomb+yw3XALzRucGE6TGEtgvQTHXp9uRp3k9jETFa+qQCoc2lcFUydCyyVNCsa46fnBJ6NCe4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urdNcwtB/GoxQgx35+TgZ0Zfk3vPK9oQ6i6knRNaVSo=;
 b=ZuSoltNS86lAz6XPd0DQRIl4dTklr13ijFK3vI464j6vpUamdfbxPSTkIQyIXHBxulrNxru5S+DQiKFe2oycMXGEWwLzXEu/UzAMGLLncDtynqDTpnfEyEI1nOU6rM6qPpPFino7I6G0yyZ4K/sRxJN6wvt9kqD1dnppW5X8Mxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2773.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:48:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:48:26 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [RESEND PATCH v6 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
Date: Mon, 17 Jun 2024 19:48:17 +0900
Message-Id: <20240617104818.221-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::16) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB2773:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e813e6-3f25-46c8-c40e-08dc8ebb048a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nOLsMUva9qYzxwMWREjgRpxOyAAweH2AO00AZ+TItvVmG9uIW3InYEw6e/CY?=
 =?us-ascii?Q?Q+pNIETaNstTc6+wCM4RRRB9RAdaS3W/pN/Io0U/QCxDyfOEalZkpxvhnGTQ?=
 =?us-ascii?Q?HXxhG0hVTbAOaSM0AQXjHjQN8fuQPC4BiXrkYmm60qfn/Y+/vy84PMhzfKgV?=
 =?us-ascii?Q?TuNTCMNx8CDuGXIYW2JxZHlW5zw972Il8Vn8PZgE+LFVL7SGbvLvKk2kjex+?=
 =?us-ascii?Q?5LX4SN3PO3UZI4AM/H3EGJhLaAttfluxBbucYMwG/YyrTOwM8imTbIUz8+Z5?=
 =?us-ascii?Q?HQAXjA3sU56hStJaAqIkf3UgqSUFSxNVXAhgtaUNJjaW4eADuNTRJEvOsmqI?=
 =?us-ascii?Q?9DlOjUHXnbZDEEyJ6D7t5/4ZG/woiiSTxJDHcPhun3RUDMOHLH9c+0N7vWGr?=
 =?us-ascii?Q?RPKYkzjsTs6i7KKho85QakFaCozlNgEbPb/Ot4xl+wFkhsUmWH0xq0xhOvmv?=
 =?us-ascii?Q?M1yLwzOpVsGW1gbm2U2zXclfZIcNwdoh3APBtCjRX2egayrlI0yhnGTlHtDQ?=
 =?us-ascii?Q?obDjZ8SNlkOKlsV9kS0tlEH5/8QtT7r6ES/vOlPzpZGB56TloB+X/gk5wm4G?=
 =?us-ascii?Q?XFsmQebcMcZlao2amitxUksnF4uPWjLFUUxrkTdRnCch0isue6gcWdPyPF/Q?=
 =?us-ascii?Q?zXErE/Udd4xAJ7fVDRTWB2L6qzzKeNsbDZ8kL+jES+hPcg1RUfayKWVDZAiw?=
 =?us-ascii?Q?Tb0JLqJ9l56q0QA8CTxoXY4JYN0uVauy+F0jztMRdG7ohOo/7i99skfy4FDM?=
 =?us-ascii?Q?6B+2JmhB+B5QelCGIc1GH1/zkNMDKag/N1EfAqX5NUlAIdTdxgjQrdK8kOau?=
 =?us-ascii?Q?XbY1juIVGk3Sbsi6SB3Zg3nBS7B8QOH77V2EPbe5jAOSBDOPbo//eCTtlE3w?=
 =?us-ascii?Q?+OSM5zUTKkmo1WAQ9dOdCssa6GbRD1+AYsqFw5eAolwC+VjGqI8h9kC/j0+Z?=
 =?us-ascii?Q?3smVVl/Rfeb1StVsirl6Sw4mAop4je1rYs9OPbhPpFIT+KIA+6QkVm4zOs3J?=
 =?us-ascii?Q?qn4aB/FxK5hF12no+5VUNqb7x8kg/C0Tom5Cbe7Kdaa0G3fRBEjiu8bQelRC?=
 =?us-ascii?Q?dwgzqC7X02Xku6I/i08YOhNUT3kyI/PWqXCMPIwGpMQDiFiL5iF6oRNJYGjm?=
 =?us-ascii?Q?XlGk3FlpKjPMtfRt25QwmEXrq/AvG2tR6Fu7BR7dC2N4i/LuXqD++97/TKRe?=
 =?us-ascii?Q?e7xGZX/Akmv+im/dfNaRNh1jwdjiwVSMiTtThTVHZETz472kndbgCaFpuHof?=
 =?us-ascii?Q?olwfhRMTgSoUFALDDcOce4U1Oqn/Os31Ton/s60ycPNEpaXobNy15gddqA0k?=
 =?us-ascii?Q?SV09v4hyX5vPwAlv7e3H+t9vBLAsmpwXSTIcdJUg9pfehrzOgQ9i8zydQPZo?=
 =?us-ascii?Q?s/mnsp0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l9sgo7056GEopSH2GfvSPWk9G3JeiVoXgOvMQw7F+tYz4UUFtHsmJkqO1Psn?=
 =?us-ascii?Q?oTM23Ay8Rfhoh7Z2/FhnwJztQ2b90JgGE5EO2sTtod657wkT5zb75YetJ9Pj?=
 =?us-ascii?Q?o54HBS0r/x4y9MqzjslEZTkOG/Y//5WPVrCijC9yWBlY0izX8gdDv/txn6kj?=
 =?us-ascii?Q?oy9ClXDWIFh6x67s9rjzP2QK/zdgdWhQwOCeCVvpTGkl1wqstXB1cn6X+hCG?=
 =?us-ascii?Q?+CHxDyyR8Ii9poXpJtxeZd3CsO3TNDhzpFmHUKcJ2J7NFK6ku/ddxgDicg4O?=
 =?us-ascii?Q?PYDGzat5bOyUP9eaytPReLSPL4hjuTd562/Z6uAXuTEh6Y3CxbZ7lWac8wNH?=
 =?us-ascii?Q?yk6/s+G0J2XF+tlXbONil2kvFJzK2K433FxaGbG64tbN8E73d5LDV5DAPW8g?=
 =?us-ascii?Q?oj+EOOE6M9iFMQVRPqJU8RggFJ9uB/scfTqzGZpqt3r9Dff07/W44J7z5U1y?=
 =?us-ascii?Q?bRlZ/l2wN7JSZLQB6yVB6XrVw1S9pq4XfRNf13h8dlRp7Za3COLsBTPaGE7t?=
 =?us-ascii?Q?dYBmCct5BpzId84rFjdvZ0ry8uZJlIjISW9ABG2Wyj4OzfHrQJojLMHqvfSF?=
 =?us-ascii?Q?cWQL9nU0yC7pLYfQoKpEXZUOPtpkzipGL4BY2FYYvPER8ZqGMb9aSH1ZtmEf?=
 =?us-ascii?Q?KmOBn4QaI4OGW7kTHEf8+qyd3ovJxMJOYcV8JvNnJ1xFDTGAaE559A3FLUIu?=
 =?us-ascii?Q?r/QzjO2nFoxmepUFspuuagctW1o/fqlYpQc2H0KbnUERzcOGb23E84bB3yH3?=
 =?us-ascii?Q?vDYoFQUURUJFYWtMlCAUnGZ6ZT3zSDzVSZpqym1PmAhoEyxkle5hHPPcR4Hx?=
 =?us-ascii?Q?SDx1bhwYHoZKOTaszbeJVm9Ve9wvpyxgWM+wwtSM4xoSi4kIWKg8Gmu0Vzsx?=
 =?us-ascii?Q?iL/sFeDWD9CgVCZ29CUEVuWwZiNoe8xxgv1iD/eYt3Aj7rGQTAn83krgduEI?=
 =?us-ascii?Q?aR+C9uRZ0wx9ruIUhCh97Eah/JlMPw/W6ueWgrnk+dRz0JIxQGmxkgnUAcoN?=
 =?us-ascii?Q?2bj6mbENv3KRy/UmZKBu7qgPb0EXbhbjhpiEZgz8qUIraB2f6CHsIJQ8Tzpr?=
 =?us-ascii?Q?JEAOhuSmOGdyrhgHJxG0TUdNLUsZe5C1BSLg1toV6aC+I+W1Y8PTxSFwDztN?=
 =?us-ascii?Q?Syr32IZDB4+TX/Ld36bxkcKwbdHvJEQEJYYQLwnrwN+kH+FO81QcaF2Rqk8w?=
 =?us-ascii?Q?9r5ZThLuKRdCZxuyquSh39aq8jNDaSSVVbT7cRXOWQXEHom9anZwd4jwlDtE?=
 =?us-ascii?Q?W4xEaqyXX4hK/hxViUnGCqPkEA25BB7wlXezbPjlUbUVypEdZjHPEmWQoVSI?=
 =?us-ascii?Q?srINAiUxwgQL2mzvO5Jr2Xsw5VTBIxmWYML/pUKBD9mMg+OhQCLju1mninYx?=
 =?us-ascii?Q?+G9cNujZ+quNIXdt3m9bmmhYe9dhEyVy/v6Hm5jzpR1RkMWjshnS9gLOqy4S?=
 =?us-ascii?Q?tim7aPrP9b93YeqwGg7WqEPfOY3OpQARUxQ/40W5ktWuV8CTlIJ9WLA3w9rT?=
 =?us-ascii?Q?JUmiP/BZaZ6v3DMLxgStMrWnVequAqkoNiDsxhSFjNEXHJ0ZXuGEdxhYRHTU?=
 =?us-ascii?Q?Ig1z9aGFZUfDMhXOBC6wzGbKmWgJHIU+AAE0FVf42OI4+lX4TcVUmLRfJE6b?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e813e6-3f25-46c8-c40e-08dc8ebb048a
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:48:26.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8132kjiRjHJPIhxbqK5u+tqt9tXL1Fa9SlQzexq6h2tuZPzTOTc3SIyW3eQzUfe/vSoNMRc9237u3vSCRQhZ8GWn/sRA2M1UNixYFXX6Mag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2773

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Use v4l2-common helper functions to calculate bytesperline and sizeimage,
instead of calculating in a wave5 driver directly.

In case of raw(YUV) v4l2_pix_format, the wave5 driver updates
v4l2_pix_format_mplane struct through v4l2_fill_pixfmt_mp() function.

Encoder and Decoder need same bytesperline and sizeimage values
for same v4l2_pix_format.
So, a wave5_update_pix_fmt is refactored to support both together.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |  24 ++
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../chips-media/wave5/wave5-vpu-dec.c         | 300 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 197 +++++-------
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 6 files changed, 239 insertions(+), 319 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 7e0f34bfa5be..b20ab69cd341 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -7,6 +7,8 @@
 
 #include "wave5-helper.h"
 
+#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
+
 const char *state_to_str(enum vpu_instance_state state)
 {
 	switch (state) {
@@ -224,3 +226,25 @@ void wave5_return_bufs(struct vb2_queue *q, u32 state)
 		v4l2_m2m_buf_done(vbuf, state);
 	}
 }
+
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize)
+{
+	v4l2_apply_frmsize_constraints(&width, &height, frmsize);
+
+	if (pix_fmt_type == VPU_FMT_TYPE_CODEC) {
+		pix_mp->width = width;
+		pix_mp->height = height;
+		pix_mp->num_planes = 1;
+		pix_mp->plane_fmt[0].bytesperline = 0;
+		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
+						     pix_mp->plane_fmt[0].sizeimage);
+	} else {
+		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
+	}
+	pix_mp->flags = 0;
+	pix_mp->field = V4L2_FIELD_NONE;
+}
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 6cee1c14d3ce..9937fce553fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -28,4 +28,9 @@ const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx,
 						   const struct vpu_format fmt_list[MAX_FMTS]);
 enum wave_std wave5_to_vpu_std(unsigned int v4l2_pix_fmt, enum vpu_instance_type type);
 void wave5_return_bufs(struct vb2_queue *q, u32 state);
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 861a0664047c..5901a8bb0797 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -11,111 +11,92 @@
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
 #define VPU_DEC_DRV_NAME "wave5-dec"
 
-#define DEFAULT_SRC_SIZE(width, height) ({			\
-	(width) * (height) / 8 * 3;					\
-})
+static const struct v4l2_frmsize_stepwise dec_hevc_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_h264_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_32_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_32_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_raw_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_RAW_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_RAW_STEP_HEIGHT,
+};
 
 static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_hevc_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = 8192,
-			.min_width = 32,
-			.max_height = 4320,
-			.min_height = 32,
+			.v4l2_frmsize = &dec_h264_frmsize,
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 	}
 };
@@ -234,74 +215,6 @@ static void wave5_handle_src_buffer(struct vpu_instance *inst, dma_addr_t rd_ptr
 	inst->remaining_consumed_bytes = consumed_bytes;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_NV16M:
-	case V4L2_PIX_FMT_NV61M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_SRC_SIZE(width, height),
-						     pix_mp->plane_fmt[0].sizeimage);
-		break;
-	}
-}
-
 static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -389,6 +302,8 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 	}
 
 	if (p_dec_info->initial_info_obtained) {
+		const struct vpu_format *vpu_fmt;
+
 		inst->conf_win.left = initial_info->pic_crop_rect.left;
 		inst->conf_win.top = initial_info->pic_crop_rect.top;
 		inst->conf_win.width = initial_info->pic_width -
@@ -396,10 +311,27 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 		inst->conf_win.height = initial_info->pic_height -
 			initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
 
-		wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
-		wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
+		vpu_fmt = wave5_find_vpu_fmt(inst->src_fmt.pixelformat,
+					     dec_fmt_list[VPU_FMT_TYPE_CODEC]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->src_fmt,
+				     VPU_FMT_TYPE_CODEC,
+				     initial_info->pic_width,
+				     initial_info->pic_height,
+				     vpu_fmt->v4l2_frmsize);
+
+		vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat,
+					     dec_fmt_list[VPU_FMT_TYPE_RAW]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->dst_fmt,
+				     VPU_FMT_TYPE_RAW,
+				     initial_info->pic_width,
+				     initial_info->pic_height,
+				     vpu_fmt->v4l2_frmsize);
 	}
 
 	v4l2_event_queue_fh(fh, &vpu_event_src_ch);
@@ -548,12 +480,12 @@ static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->stepwise.min_width = vpu_fmt->v4l2_frmsize->min_width;
+	fsize->stepwise.max_width = vpu_fmt->v4l2_frmsize->max_width;
+	fsize->stepwise.step_width = W5_DEC_CODEC_STEP_WIDTH;
+	fsize->stepwise.min_height = vpu_fmt->v4l2_frmsize->min_height;
+	fsize->stepwise.max_height = vpu_fmt->v4l2_frmsize->max_height;
+	fsize->stepwise.step_height = W5_DEC_CODEC_STEP_HEIGHT;
 
 	return 0;
 }
@@ -576,6 +508,7 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
 
@@ -589,14 +522,12 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		width = inst->dst_fmt.width;
 		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
+		frmsize = &dec_raw_frmsize;
 	} else {
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
-		width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
 	if (p_dec_info->initial_info_obtained) {
@@ -604,9 +535,8 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		height = inst->dst_fmt.height;
 	}
 
-	wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+			     width, height, frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -718,7 +648,9 @@ static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev,
 		"%s: fourcc: %u width: %u height: %u num_planes: %u colorspace: %u field: %u\n",
@@ -727,20 +659,19 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, dec_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
+		frmsize = &dec_hevc_frmsize;
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+			     width, height, frmsize);
 
 	return 0;
 }
@@ -748,6 +679,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev,
@@ -782,7 +714,13 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, dec_fmt_list[VPU_FMT_TYPE_RAW]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_RAW,
+			     f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			     vpu_fmt->v4l2_frmsize);
 
 	return 0;
 }
@@ -1005,6 +943,7 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_pix_format_mplane inst_format =
 		(q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : inst->dst_fmt;
+	unsigned int i;
 
 	dev_dbg(inst->dev->dev, "%s: num_buffers: %u | num_planes: %u | type: %u\n", __func__,
 		*num_buffers, *num_planes, q->type);
@@ -1018,31 +957,9 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 		if (*num_buffers < inst->fbc_buf_count)
 			*num_buffers = inst->fbc_buf_count;
 
-		if (*num_planes == 1) {
-			if (inst->output_format == FORMAT_422)
-				sizes[0] = inst_format.width * inst_format.height * 2;
-			else
-				sizes[0] = inst_format.width * inst_format.height * 3 / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u\n", __func__, sizes[0]);
-		} else if (*num_planes == 2) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422)
-				sizes[1] = inst_format.width * inst_format.height;
-			else
-				sizes[1] = inst_format.width * inst_format.height / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u\n",
-				__func__, sizes[0], sizes[1]);
-		} else if (*num_planes == 3) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422) {
-				sizes[1] = inst_format.width * inst_format.height / 2;
-				sizes[2] = inst_format.width * inst_format.height / 2;
-			} else {
-				sizes[1] = inst_format.width * inst_format.height / 4;
-				sizes[2] = inst_format.width * inst_format.height / 4;
-			}
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u | size[2]: %u\n",
-				__func__, sizes[0], sizes[1], sizes[2]);
+		for (i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "%s: size[%u]: %u\n", __func__, i, sizes[i]);
 		}
 	}
 
@@ -1564,20 +1481,15 @@ static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int dst_pix_fmt = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *dst_fmt_info = v4l2_format_info(dst_pix_fmt);
-
 	src_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = 1;
-	wave5_update_pix_fmt(src_fmt, 720, 480);
-
-	dst_fmt->pixelformat = dst_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = dst_fmt_info->mem_planes;
-	wave5_update_pix_fmt(dst_fmt, 736, 480);
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_CODEC,
+			     W5_DEF_DEC_PIC_WIDTH, W5_DEF_DEC_PIC_HEIGHT,
+			     &dec_hevc_frmsize);
+
+	dst_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_RAW,
+			     W5_DEF_DEC_PIC_WIDTH, W5_DEF_DEC_PIC_HEIGHT,
+			     &dec_raw_frmsize);
 }
 
 static int wave5_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 703fd8d1c7da..a470f24cbabe 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -11,65 +11,60 @@
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
 #define VPU_ENC_DRV_NAME "wave5-enc"
 
+static const struct v4l2_frmsize_stepwise enc_frmsize[FMT_TYPES] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_CODEC_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_CODEC_STEP_HEIGHT,
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_RAW_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_RAW_STEP_HEIGHT,
+	},
+};
+
 static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 	}
 };
@@ -106,46 +101,6 @@ static int switch_state(struct vpu_instance *inst, enum vpu_instance_state state
 	return -EINVAL;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = round_up(width, 32) * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 2;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = width * height / 8 * 3;
-		break;
-	}
-}
-
 static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -360,13 +315,8 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 			return -EINVAL;
 	}
 
-	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = enc_frmsize[VPU_FMT_TYPE_CODEC];
 
 	return 0;
 }
@@ -391,7 +341,9 @@ static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -399,20 +351,19 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fmt.height);
+		frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC];
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+			     width, height, frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -499,7 +450,9 @@ static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -507,28 +460,26 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_RAW]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
+		frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW];
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+			     width, height, frmsize);
 	return 0;
 }
 
 static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -568,7 +519,15 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_CODEC,
+			     f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			     vpu_fmt->v4l2_frmsize);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 
 	return 0;
 }
@@ -584,12 +543,17 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-	case V4L2_SEL_TGT_CROP:
 		s->r.left = 0;
 		s->r.top = 0;
 		s->r.width = inst->dst_fmt.width;
 		s->r.height = inst->dst_fmt.height;
 		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->conf_win.width;
+		s->r.height = inst->conf_win.height;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -612,8 +576,10 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 
 	s->r.left = 0;
 	s->r.top = 0;
-	s->r.width = inst->src_fmt.width;
-	s->r.height = inst->src_fmt.height;
+	s->r.width = min(s->r.width, inst->dst_fmt.width);
+	s->r.height = min(s->r.height, inst->dst_fmt.height);
+
+	inst->conf_win = s->r;
 
 	return 0;
 }
@@ -1151,8 +1117,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 	open_param->wave_param.lambda_scaling_enable = 1;
 
 	open_param->line_buf_int_en = true;
-	open_param->pic_width = inst->dst_fmt.width;
-	open_param->pic_height = inst->dst_fmt.height;
+	open_param->pic_width = inst->conf_win.width;
+	open_param->pic_height = inst->conf_win.height;
 	open_param->frame_rate_info = inst->frame_rate;
 	open_param->rc_enable = inst->rc_enable;
 	if (inst->rc_enable) {
@@ -1456,20 +1422,15 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int src_pix_fmt = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *src_fmt_info = v4l2_format_info(src_pix_fmt);
-
-	src_fmt->pixelformat = src_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = src_fmt_info->mem_planes;
-	wave5_update_pix_fmt(src_fmt, 416, 240);
+	src_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_RAW,
+			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
+			     &enc_frmsize[VPU_FMT_TYPE_RAW]);
 
 	dst_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = 1;
-	wave5_update_pix_fmt(dst_fmt, 416, 240);
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
+			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
+			     &enc_frmsize[VPU_FMT_TYPE_CODEC]);
 }
 
 static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
@@ -1733,6 +1694,8 @@ static int wave5_vpu_open_enc(struct file *filp)
 	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
 
 	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 	inst->colorspace = V4L2_COLORSPACE_REC709;
 	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 32b7fd3730b5..3847332551fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -38,10 +38,7 @@ enum vpu_fmt_type {
 
 struct vpu_format {
 	unsigned int v4l2_pix_fmt;
-	unsigned int max_width;
-	unsigned int min_width;
-	unsigned int max_height;
-	unsigned int min_height;
+	const struct v4l2_frmsize_stepwise *v4l2_frmsize;
 };
 
 static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index d9751eedb0f9..8e11d93ca38f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -30,10 +30,29 @@
 
 #define MAX_NUM_INSTANCE                32
 
-#define W5_MIN_ENC_PIC_WIDTH            256
-#define W5_MIN_ENC_PIC_HEIGHT           128
-#define W5_MAX_ENC_PIC_WIDTH            8192
-#define W5_MAX_ENC_PIC_HEIGHT           8192
+#define W5_DEF_DEC_PIC_WIDTH            720U
+#define W5_DEF_DEC_PIC_HEIGHT           480U
+#define W5_MIN_DEC_PIC_8_WIDTH          8U
+#define W5_MIN_DEC_PIC_8_HEIGHT         8U
+#define W5_MIN_DEC_PIC_32_WIDTH         32U
+#define W5_MIN_DEC_PIC_32_HEIGHT        32U
+#define W5_MAX_DEC_PIC_WIDTH            8192U
+#define W5_MAX_DEC_PIC_HEIGHT           4320U
+#define W5_DEC_CODEC_STEP_WIDTH         1U
+#define W5_DEC_CODEC_STEP_HEIGHT        1U
+#define W5_DEC_RAW_STEP_WIDTH           32U
+#define W5_DEC_RAW_STEP_HEIGHT          16U
+
+#define W5_DEF_ENC_PIC_WIDTH            416U
+#define W5_DEF_ENC_PIC_HEIGHT           240U
+#define W5_MIN_ENC_PIC_WIDTH            256U
+#define W5_MIN_ENC_PIC_HEIGHT           128U
+#define W5_MAX_ENC_PIC_WIDTH            8192U
+#define W5_MAX_ENC_PIC_HEIGHT           8192U
+#define W5_ENC_CODEC_STEP_WIDTH         8U
+#define W5_ENC_CODEC_STEP_HEIGHT        8U
+#define W5_ENC_RAW_STEP_WIDTH           32U
+#define W5_ENC_RAW_STEP_HEIGHT          16U
 
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
-- 
2.43.0


