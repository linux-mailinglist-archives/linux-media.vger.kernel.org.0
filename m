Return-Path: <linux-media+bounces-28448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C5A682DB
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 02:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA77E174387
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 01:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE9624EA88;
	Wed, 19 Mar 2025 01:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WeKtc3Oq"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021078.outbound.protection.outlook.com [40.107.42.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988524E00F;
	Wed, 19 Mar 2025 01:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742348748; cv=fail; b=P0TWXFYeRxOEJ0Sr0AGSSggZjUkOs0KDlRv6V7hcTVwDP9p5aUHit66uHqvB9hUN+t2N2fg0w2vftu0cRYM8Od78Ghc0qVjgSGFkUhE6wOgQ+3cC5ONKeMxx7ZuWyiOfknn93WRSie91ldD88qPxWzyeQtWvEJTmPWwDb77rf9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742348748; c=relaxed/simple;
	bh=pxQM3WlXCt+XSf7TsiRFRKKuetpgmuFqKEm6MUOQPvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PlqDkBkCYEogc9e6gPwf7kptxoQNOqKRN+DcpJwN1aaO7jAduVPKclpL8QqqAFotCWk62z0KuTFhs3Ph+307w3O6cgvbZi2ezQzdNiAQ/5J1Cpxs6FFlDkDnpHEC0EOM3nlfRghWLfqQ+QEScyfkrgw4eBuXkEKWIE75L++BdGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WeKtc3Oq; arc=fail smtp.client-ip=40.107.42.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmWtDiJbVQVcWJ025JRIWOchNlTI6Sh8YMsHm4M3YLk3w1LTzMzlXI4mzQ/oJ5eWEmfh1lR2/Wrazc8mOlIwL92ruPrvr94N3iIm6trsSAZWSFhKTh4rh+9Ci6XCgz9HbtEWsKFTzdslBHhKxxtbXTqoL0lfKVrOeljSb61drg5y5IkFo0LTJHw4hS7gnZWtHkHYMhjQt4uvtcfv46nxBdSNrkBHTw76mKqeyw6/N8fxz40Ld1Eg0HKHX+pRSAS5bbe/nvWgTScWm6wpXwUAszSyXJNcJ0XkfbGNdGhbx7ai1upUHXKG/0NWvIShZ3tFZfOPsbDGfs8w15EX8YT5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoAvaduAXIQYB63kjKsKfS9DSlA1sQE2RtSbhz2TA3c=;
 b=CY2neZAIlSQI9Rnx20RhvKgho/kmA6asqhtDSxdEpneu3PHAZMGg9Torr8auxagP2Evspe9n96g6HvCXjBRnf7YNax38oaPF4mDmB7KoxjqWA4ujnIraheREfXT8DQW7qzY6dl1PmUNJks21M8hGiqd2/7KcorHBryQBgWtCTp3xzWvj3fchXIUZOkIgBdDqZlcuFKYMa3YBs3liRoEfld8sD2Et8VjMSecocwk0C3aRpuUefZKPWpAj/bhOP6b7ASx0pwyPWpAq3874bYgrYxvH8Db6GlnEk9ctuMXoVabhVSEZ52TFgJ5BIHtJIyDBNRovw9+xiltmaGCGqoGgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoAvaduAXIQYB63kjKsKfS9DSlA1sQE2RtSbhz2TA3c=;
 b=WeKtc3OqA3JnfkAKd3mXgnEwBjA9kQ90gAvg8IFNdyXLP+GZ3aPqt0kH1wK+mP3Fda3C+EpGdeFrL+Wb+ZNqem6UMSfmYU0KP0N5S4+y43YK2aNFJG9iw89y1xMQY3M9a+z/5YzFmW2V2F/fPPp9u/oOGVZyoB4FNdU8ytDA5RY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2121.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 01:45:40 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 01:45:40 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 1/3] media: chips-media: wave5: Improve performance of decoder
Date: Wed, 19 Mar 2025 10:45:28 +0900
Message-Id: <20250319014530.61-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
References: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2121:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e3d410-4563-431b-714d-08dd6687c121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/gpXWa8dRn3jOJ/ILkLxRa+/SVZmO2k7JIqV9rgGpUC/T2KRC0nFG1AAlmzN?=
 =?us-ascii?Q?A4SeOMG6bB0J3Fs5yzTY1bkyTWbFLmAb88q/SyXslfR8SlUdgwQwOFPbFodN?=
 =?us-ascii?Q?I5pkSdA1VW0RVpDghAz/3WBy639ntlDe57Fhv0cZO3svEqUkkfU71NtXfq5p?=
 =?us-ascii?Q?6wYYEanGh6RHjQuUSLGkXGaenReMVJpf9IAf/PMhIByB0o7msycMpBAo8rcT?=
 =?us-ascii?Q?wcCq+sLRLIcnfXSeimkwNhe+qM/4LP7NXKt0/2mw5RIROhkmYGHXkN45ahxH?=
 =?us-ascii?Q?uUze+yvI67OnYuw8b0ll8bfPSZrO/10y5rI7YuCX36S9nPm5mMrKMyQMpv6R?=
 =?us-ascii?Q?dzyR1O+bFLVaDy2K49fWVSq5EiZouYZtup22eb85BOt+Vc5LkS6BeszPBFpD?=
 =?us-ascii?Q?uDo0oR4Gl/1iUhEdBJLOU6apObymakI4rLS5r/O0kIckNZVdDIPCUS/JEV1D?=
 =?us-ascii?Q?oNkOTGJ/6MHDwWttuSoRWPs7mV2rYmuRgCZ5v1cf0nzpArL34A5ceX10UGOR?=
 =?us-ascii?Q?MgY2qb+Fvla2jIdR4hTw13eAaSZEgd+c3/wHu42OG4Lz3vu8DAdpFamJ2xeP?=
 =?us-ascii?Q?vXuEkGTA97JcVcKmsoKY2FZkQdTKG1q8A6qKJ1Ml0AJZ9BvIa+McTYQvmdsh?=
 =?us-ascii?Q?E9MmVJHF/ZHQgOhMfP7uaC4X63zEWoR/mhCu9rama5WDqv9kK2M2K2STJCZO?=
 =?us-ascii?Q?ONl3kwdEPf5HU/sYrvKD1HxrVFchIssk6eLuarLEDoKadZQDytHlN042mCbI?=
 =?us-ascii?Q?1aRxdI26tJA8IOH5PRRty91mRkmo72M+k5I+qSwtSPvLrS8H5Pz5B2hD8R75?=
 =?us-ascii?Q?45UO2QD1JczS2NRAbrpt2rUTvJygOxRIGBEtqyk5I9BwMo9Xcgw3GJjjgAtV?=
 =?us-ascii?Q?bLjPxMCAJ2ajdcuQMwepV69WNBZxS4MOngqaYia1dRyX8XItrTrCINDxEvSr?=
 =?us-ascii?Q?c+Ede4ffDGGFZoxpSgNVccFXlP8DMrtGgHAzGczCD3jy2sbHdKsUpaQ15tiX?=
 =?us-ascii?Q?fY8LKZYP6wlnWCnsDtzcEZJ5Glbc6H31yorxN21A2E7n2q561kPWfeivsIsf?=
 =?us-ascii?Q?7hLpWsV8KTQh2Kd771PVZqtp8VXgZeVlrubYCS/Un93GEWSJumNfaoDKVPa7?=
 =?us-ascii?Q?r3NPObev6ou11i0+UcLDnfAsanXby6mSi8ZZxguX05DfjLVLs5Aqap5v+BxH?=
 =?us-ascii?Q?63Y/sUMBU1M9EgLi/EvQgECzgBFV6UnbbCsgyYZ1KSbaZIewVLmP/3KP3gbJ?=
 =?us-ascii?Q?lWt8FdhpyjUxwHbbnO9jmqdW0SiruGW9l+F7bhmP83c/oT4z5e48RIDMrAEB?=
 =?us-ascii?Q?1R70rB1ZQyADBvf5jNEMNcpi1FYZqwGpyLUBgM56J2dNvPBne5Pdrj6vAQFE?=
 =?us-ascii?Q?xYhuEwfe8qLwIADOTy9w4FKHB98TwItIzj/VQr1G7Jo3T8t0e+SGjAfEfb5W?=
 =?us-ascii?Q?/1FoUpYIy+q/PT77kOd6SuNk+LvMxt3Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NSyxhNES/ds2u5086cpDsVB4Iq/S9zDmqXaiQ5gyUHGwXlQmO3WjVrHB3ghQ?=
 =?us-ascii?Q?51GSiRO8HkLVt57upMPWw6kcAtqXFAhP/Z2o6BcxMHpOExZRG8lJYD5doON5?=
 =?us-ascii?Q?S9Gwdh0XgnkFixvf+TVgSyuRRgXo+YYzBw3cSKCkr8wgqOVWgfb90bvKISL9?=
 =?us-ascii?Q?sdH6aw4KHPwZGwaeAoQZFxe3Vlb1qWPd1VkunRY6NSMiihbedE0HJPHjHXSK?=
 =?us-ascii?Q?1aD6Cw1vwLB6MjFeb6O2LaxAhu3BzwIrGOmdq1OtJIu7QZ/++38tAKI3FedC?=
 =?us-ascii?Q?GIyFeAME3spjJf1Z43pqhA+YZyDRK88bxZr/mBIubHmFnGIlyfhWd4qy/laZ?=
 =?us-ascii?Q?EQ0AVu8X/Q1X1Vb8FhxNZpcW8TgRppHKIjdYEEbR0z+dSJGvt+95oiWbYpob?=
 =?us-ascii?Q?URklKGML8VkhPJO6FOGlXVzrGjoq3I4yKPi56oZw9lAijZTssiSV4RzgbE+H?=
 =?us-ascii?Q?XWa2hW2nKAgCZWhViOF3g8sXguxSual7J9MMaAwbRvBm0qhu73vUs496oPd4?=
 =?us-ascii?Q?nUA7ZVWbFW9JDZ09YjnE+3U1tZF/7RnrFKD71ZPi9zJtZUz0hzJKoRo5YiPJ?=
 =?us-ascii?Q?+Te1YgpGy1CuUfpQnagYdokbpkUhAhxr0ZnwsugSBrCSp0vcP6TpMrpqWV+f?=
 =?us-ascii?Q?BWKe5XvhOD1vx4/44zSsduPOzXsNkuIjlIB+ILjjo3k5f/Uyr2fyhBn8M55O?=
 =?us-ascii?Q?mafd8Dh3qsG3kdyhnP/yCUiRsq1PefUblEb6M9eIPgYNJg1U751/FwPETZF0?=
 =?us-ascii?Q?L5+RNqFvptYIlIAoPhV2KHQVqv6LDtMoxJU8xsQBX9kKdBSDvxLgcZRwHbxp?=
 =?us-ascii?Q?bNLNBXqA2p8nAhjtSdDT5TwLjZggILJbT/ob0w7ULKNhIbavNkMFgcdjJZMn?=
 =?us-ascii?Q?AGsDDM1b+6vu04S4Ckuo6GFi0YUISH2Aoku49geTe2jKJuaF6csHBkOovd8B?=
 =?us-ascii?Q?KLcX5NvpUNXvsLzxK3Q5KRNCIJfcBsO6opvFgbnfYxGtGt18Rm3UuAF5qkjo?=
 =?us-ascii?Q?PixrJb71C950atncJgZiJSVWnH6B75vMfSEZolg+6LAdxbwmUZ0umIpa01he?=
 =?us-ascii?Q?Kzh+V2BNxvkvTLy4Bd7Dhj0lGJjMiEWLkpzTFHYMk5ZfeA8Pgt8ITGOv+fnO?=
 =?us-ascii?Q?uJx7mq1X8bMsNXw5G+PktAy10Jrd4f1dOn/SU0nzFqZZvGub9OMa466sBvsY?=
 =?us-ascii?Q?jlpIJlk4ClvQ3LJv2xkph70GhjQrVriavZNBh4vXToDBxSk1pNhg9xGYwLjh?=
 =?us-ascii?Q?w0hTEKwOG19MKVAE8Bg8wA4w9PGXoQ+zYfD5C6QFfOQNKLS+PqB7VFSi4Gj0?=
 =?us-ascii?Q?cE9RTL8vLS1hJuGiitvT+FHP+wZFEYvfVVNv9OtSYbWuWgc6kI0VPYj495H7?=
 =?us-ascii?Q?G6iCLVK3LkhPMxPY/UAbXRm3qNqTW5AlzDgLwdh0eO2L/y/kD2gXxnC/HfFO?=
 =?us-ascii?Q?E0lXO60gV0DynqVKjU9+4/p43QY8u2R774C2M0m43uASdt0WzLxtXhReqNLW?=
 =?us-ascii?Q?CyGAWu2VG5Gu+O/3D1SRs+uABBVIcR1DxqciEMsserjVTc3qa8m/Yk594AJu?=
 =?us-ascii?Q?cH3mf6EHbqArIErZwkPj4hm9VH7XMXN/3mjzqdHPxDdyWgp1iM892Enm6YA9?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e3d410-4563-431b-714d-08dd6687c121
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 01:45:40.5199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPJnt+LjwxzG/ZefdW8TjFYBUsemwBdU40xeHoH1NxxfR+wV6wlQffqD7vFu1bKCYtFbeBSZ8TLD7OTep0Hqm1sGPhlhv65FAweih+TepIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2121

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The existing way for decoding frames was to wait until each frame was
decoded after feeding a bitstream. As a result, performance was low
and Wave5 could not achieve max pixel processing rate.

Update driver to use an asynchronous approach for decoding and feeding a
bitstream in order to achieve full capabilities of the device.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 344 ++++++++++--------
 .../chips-media/wave5/wave5-vpu-enc.c         |   3 -
 .../platform/chips-media/wave5/wave5-vpuapi.c |  25 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   5 +-
 4 files changed, 211 insertions(+), 166 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index fd71f0c43ac3..5975cafefb6c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -230,12 +230,147 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 		switch_state(inst, VPU_INST_STATE_STOP);
 
 		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 
 	return ret;
 }
 
+static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
+			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
+{
+	size_t size;
+	size_t offset = wr_ptr - ring_buffer->daddr;
+	int ret;
+
+	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
+		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
+		if (ret < 0)
+			return ret;
+
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
+					     buffer_size - size);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
+					     buffer_size);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fill_ringbuffer(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	struct vpu_src_buffer *vpu_buf;
+	int ret;
+
+	if (m2m_ctx->last_src_buf)  {
+		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "last src buffer already written\n");
+			return 0;
+		}
+	}
+
+	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
+		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
+		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
+		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+		dma_addr_t rd_ptr = 0;
+		dma_addr_t wr_ptr = 0;
+		size_t remain_size = 0;
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
+				vbuf->vb2_buf.index);
+			continue;
+		}
+
+		if (!src_buf) {
+			dev_dbg(inst->dev->dev,
+				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
+				__func__, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
+		if (ret) {
+			/* Unable to acquire the mutex */
+			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
+				ret);
+			return ret;
+		}
+
+		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
+
+		if (remain_size < src_size) {
+			dev_dbg(inst->dev->dev,
+				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
+				__func__, remain_size, src_size, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
+		if (ret) {
+			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
+				vbuf->vb2_buf.index, ret);
+			return ret;
+		}
+
+		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
+		if (ret) {
+			dev_dbg(inst->dev->dev,
+				"update_bitstream_buffer fail: %d for src buf (%u)\n",
+				ret, vbuf->vb2_buf.index);
+			break;
+		}
+
+		vpu_buf->consumed = true;
+
+		/* Don't write buffers passed the last one while draining. */
+		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
+			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
+			break;
+		}
+
+		inst->queuing_num++;
+		list_del_init(&vpu_buf->list);
+		break;
+	}
+
+	return ret;
+}
+
+static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
+{
+	int ret = 0;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	u32 fail_res = 0;
+
+	mutex_lock(&inst->feed_lock);
+	ret = fill_ringbuffer(inst);
+	mutex_unlock(&inst->feed_lock);
+	if (ret) {
+		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+		return;
+	}
+
+	ret = start_decode(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev,
+			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
+			m2m_ctx, ret, fail_res);
+	}
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+}
+
 static void flag_last_buffer_done(struct vpu_instance *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -347,7 +482,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
@@ -441,20 +575,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		}
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
-
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_mark_last_busy(inst->dev->dev);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
-	}
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -794,11 +914,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
 	}
 
 	if (inst->state != VPU_INST_STATE_NONE) {
+		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_src_buffer *vpu_buf;
+
 		/*
 		 * Temporarily release the state_spinlock so that subsequent
 		 * calls do not block on a mutex while inside this spinlock.
 		 */
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
+		if (vbuf) {
+			vpu_buf = wave5_to_vpu_src_buf(vbuf);
+			if (!vpu_buf->consumed)
+				wave5_vpu_dec_feed_remaining(inst);
+		}
+
 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 		if (ret)
 			return ret;
@@ -1116,115 +1246,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
 	return 0;
 }
 
-static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
-			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
-{
-	size_t size;
-	size_t offset = wr_ptr - ring_buffer->daddr;
-	int ret;
-
-	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
-		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
-		if (ret < 0)
-			return ret;
-
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
-					     buffer_size - size);
-		if (ret < 0)
-			return ret;
-	} else {
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
-					     buffer_size);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int fill_ringbuffer(struct vpu_instance *inst)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
-
-	if (m2m_ctx->last_src_buf)  {
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "last src buffer already written\n");
-			return 0;
-		}
-	}
-
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
-		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
-		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
-		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
-		dma_addr_t rd_ptr = 0;
-		dma_addr_t wr_ptr = 0;
-		size_t remain_size = 0;
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
-				vbuf->vb2_buf.index);
-			continue;
-		}
-
-		if (!src_buf) {
-			dev_dbg(inst->dev->dev,
-				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
-				__func__, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
-		if (ret) {
-			/* Unable to acquire the mutex */
-			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
-				ret);
-			return ret;
-		}
-
-		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
-
-		if (remain_size < src_size) {
-			dev_dbg(inst->dev->dev,
-				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
-				__func__, remain_size, src_size, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
-		if (ret) {
-			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
-				vbuf->vb2_buf.index, ret);
-			return ret;
-		}
-
-		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
-		if (ret) {
-			dev_dbg(inst->dev->dev,
-				"update_bitstream_buffer fail: %d for src buf (%u)\n",
-				ret, vbuf->vb2_buf.index);
-			break;
-		}
-
-		vpu_buf->consumed = true;
-
-		/* Don't write buffers passed the last one while draining. */
-		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
-			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
-			break;
-		}
-	}
-
-	return 0;
-}
-
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
@@ -1236,6 +1257,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	vbuf->sequence = inst->queued_src_buf_num++;
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	INIT_LIST_HEAD(&vpu_buf->list);
+	mutex_lock(&inst->feed_lock);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 }
 
 static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
@@ -1362,7 +1388,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 				goto return_buffers;
 			}
 		}
-
 	}
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
@@ -1385,6 +1410,13 @@ static int streamoff_output(struct vb2_queue *q)
 	dma_addr_t new_rd_ptr;
 	struct dec_output_info dec_info;
 	unsigned int i;
+	struct vpu_src_buffer *vpu_buf, *tmp;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+
+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
+		list_del_init(&vpu_buf->list);
 
 	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
 		ret = wave5_vpu_dec_set_disp_flag(inst, i);
@@ -1481,10 +1513,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
+		    q_status.report_queue_count == 0)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
@@ -1577,13 +1607,23 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
-	ret = fill_ringbuffer(inst);
-	if (ret) {
-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
-		goto finish_job_and_return;
+	if (!inst->retry) {
+		mutex_lock(&inst->feed_lock);
+		ret = fill_ringbuffer(inst);
+		mutex_unlock(&inst->feed_lock);
+		if (ret < 0) {
+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+			goto finish_job_and_return;
+		} else if (!inst->eos &&
+			   inst->queuing_num == 0 &&
+			   inst->state == VPU_INST_STATE_PIC_RUN) {
+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1619,7 +1659,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
@@ -1634,12 +1676,14 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
 		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 			return;
 		}
 
@@ -1650,14 +1694,22 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
+		}
+
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+		} else {
+			inst->retry = false;
+			if (!inst->eos)
+				inst->queuing_num--;
 		}
-		/* Return so that we leave this job active */
-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-		return;
-	default:
-		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
 		break;
+	default:
+		if (!v4l2_m2m_has_stopped(m2m_ctx))
+			WARN(1, "Execution of a job in state %s illegal.\n",
+			     state_to_str(inst->state));
+		return;
 	}
 
 finish_job_and_return:
@@ -1676,10 +1728,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		return;
 
-	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
-	if (ret)
-		dev_warn(inst->dev->dev,
-			 "Setting EOS for the bitstream, fail: %d\n", ret);
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1755,6 +1804,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
@@ -1830,9 +1881,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1e5fc5f8b856..cf20f774ed1b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1774,9 +1774,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..c1737fac6edd 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -233,6 +231,16 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
 			ret = -ETIMEDOUT;
 			goto unlock_and_return;
+		} else if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING) {
+			struct dec_output_info dec_info;
+
+			mutex_unlock(&vpu_dev->hw_lock);
+			wave5_vpu_dec_get_output_info(inst, &dec_info);
+			ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
+			if (ret) {
+				pm_runtime_put_sync(inst->dev->dev);
+				return ret;
+			}
 		}
 	} while (ret != 0);
 
@@ -249,11 +257,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
+	mutex_destroy(&inst->feed_lock);
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
@@ -720,8 +724,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -765,11 +767,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..6ca1ddc67c64 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -163,7 +163,7 @@ enum set_param_option {
 
 #define BUFFER_MARGIN				4096
 
-#define MAX_FIRMWARE_CALL_RETRY			10
+#define MAX_FIRMWARE_CALL_RETRY			30
 
 #define VDI_LITTLE_ENDIAN	0x0
 
@@ -812,6 +812,9 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool retry;
+	int queuing_num;
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
-- 
2.43.0


