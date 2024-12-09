Return-Path: <linux-media+bounces-22847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E69E8B0F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50FFB1884421
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 05:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DB81C3027;
	Mon,  9 Dec 2024 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="RzjR36cV"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020135.outbound.protection.outlook.com [52.101.156.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FFE1C1735;
	Mon,  9 Dec 2024 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722631; cv=fail; b=gpYtWsKe0JBz1emVt7eOzgfa6DvWdTFFw3XxtJRuoPAYbjryYa8LeTIqjOKZyW7MIBm/D7QsPBFTeXyYzY7mSpR2AlyzthjjaPPLk/zohtNnJwdzx2APXofmq8OG5Ji8nAgQ1Y4P1RZfR2XkhjMYnSmNKW3+REQHMPOG1NZfRKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722631; c=relaxed/simple;
	bh=l0MYk+Aj9/Vn7n02An380977NqMYy50Molt51e3mp3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rk/dbQHBGH20JgK0SnqoqImZpCY6+Gc5aOvqdicrkp4FJDwZoIR5zBQKgf8jRUcBNsBfyy/ISc2MtOy85fABJiTI2Pys6ArjdSIYwmebFT7+8a9qBqgt/bzbIhCPsFJqfdTtwXrX/r7LNtSh0bKR0fvEHh6rbnTPsU1urHnPE9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=RzjR36cV; arc=fail smtp.client-ip=52.101.156.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgqkBcr7SWVBo0uWu4bMxleVBJmzbaxLBdT9qHvLUS/q1ihYorP/qHC9NMjnbzWQceyaV+ZtRq6v4+fvVvOwFp9CTNV0eHuB2m1jAifx7qU5LslPzs56cfkoUAIaKojdpGrYtV7hDMaLQeUH0NU52MwZRi/VKKlG+UB+iktm+uLISwISuVjFpofxzdZ1/CfI+YpmUxY2EB1lnjcAkppz5PIyWm7EZgOgNl+VM/CmINQm/3nwXzVY0zfAJ+pO/z/iVK2cI9HR3sz5Hb3c4YjW9I63IR86lARAna1PmO8P6eibnwSlX0yaFKNXYj8j1wecH/O+s18m9Pz1fCA13vjknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSjBMLJcReMsnoPmaWU1x1en8DS9v3tPPVaV1ajT12k=;
 b=ktKU7nk85c1yra22QaS/0CrnktVFWUAPir6o5FNr7M/H5xlKfPjxivqsCdXQvor6yHurzcjygSkbEQ3PGP+mwdrjxKEXjcVkB/Oim3uBpI+c0T3LbsR8hflWfWXKvwDVpg8sFQsBj7nldotESaBgCkCVjIFj1K4BcdttOsK5OyMk1G4jL7S63N4q6r6IM9GXCIWwLBnaOOAJiI11Elb7GGMLvyfuofmkVRoSxqB639phKvOlYv1mxQcxW3XpIQLp8AlDt68VEUBWi58uLGxHvI4J/z1KkM7ltyzlt3T8DiXFoCpYBDJiTBoQRRZ8eswJOap4q7KbIM6wQSX0eQ4Uww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSjBMLJcReMsnoPmaWU1x1en8DS9v3tPPVaV1ajT12k=;
 b=RzjR36cViDojthoLZ+Ott1a1cAn6M6fFtMFeRg3E80SVDOo3vqHUy0koRFfYzjFyNZzaA+mHHJt1UH0np+P4pC7WF+ZI1vCPb1KKjnJyBeKTbiZtpPbgL5uyh6VV2n+ijMQogArwm/Hkp7Drp03v8gbE1CFA7vNRQqn4O6bTmwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB1671.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Mon, 9 Dec 2024 05:37:05 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 05:37:05 +0000
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
Subject: [PATCH v1 5/5] media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster
Date: Mon,  9 Dec 2024 14:36:54 +0900
Message-Id: <20241209053654.52-6-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0219.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE1P216MB1671:EE_
X-MS-Office365-Filtering-Correlation-Id: a48fe459-7017-4eed-3869-08dd18138412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F1J+4FWetDSkyuuv+eVKeiDPPQUxGMSQoOhEhJ5oPeq4zO5kIvuCQUfvPfUW?=
 =?us-ascii?Q?BEngR2uZ6fVm3qu7jgHD6vO1qDgD+iHh3xHQ6ybj26pH72HBHskypYi2+1qX?=
 =?us-ascii?Q?mG9auREjLS5HR8yHaIK8exbv+HS+cVLBlrO7Kq5HsrQG1ZajXBMAp6uk3J8V?=
 =?us-ascii?Q?lTWvKqpXl9kjYcL7mPB8VrquHfUwmcQ/J2OnUdwwNRU0+J7F15ThC1Jhw+QN?=
 =?us-ascii?Q?Ly7APwEGJPt3WdkMAyRXfxzSTfX4LPoZRvV309McZrFONogZ00Wd7g45VptH?=
 =?us-ascii?Q?9DJnnTXKD+jyJsHP+OhdVkm8ka8/RWGN8VHJpcgZmJQ3rVkOU+Z7rAE962qR?=
 =?us-ascii?Q?csz6RcJ37OfJgzxrWgEo7TnanxILEt5gKLeSKQrk9h0hIC1yQLmr2t1p43Wl?=
 =?us-ascii?Q?NjhfaTEYW345dem0C1soCq+NBoDU+ALsiTgHxx2R7cddairEQdpqAy5kqcsw?=
 =?us-ascii?Q?fFeb9iw7UBbJ5T+gFHjJQefkg6bgN/tNaf4Ef/yAobX/FVIF9uS4k5cEklDQ?=
 =?us-ascii?Q?Y8o/3C/2k0Up1ra4k8Kg57M+TAS53R3aDNujXIPqGa/peH1ELF1wzA2QeZaD?=
 =?us-ascii?Q?4t8gFXwbyA0ld4OSYl4QyUtAy7aasRoGiaX/+IjrSnYazwx3MOVdbbC1KhMy?=
 =?us-ascii?Q?VYdyhDKkVThFLAR6+DXen/KRS2lZmewHF35ihMydWT3UofaBZLGvyk2WBYpt?=
 =?us-ascii?Q?tDtcs7IFW4CQg5rwIJUEy+X1HfXS3I/hlkHsI/P5KQ6VE9nYfAcR/G2t2W4+?=
 =?us-ascii?Q?25/KJQVq2NHmeRh5Dpksok+JVbRDR3jM6jiRd54euwXoNEtE/Ql9/Egk7FHD?=
 =?us-ascii?Q?5UuUpQblZkuMHuitW236T3cFZk71cEfx22QzQTzC+2BgG5u21mfzODIn3Ah1?=
 =?us-ascii?Q?CbtTKZ0MUJrJlM2vUrEjZDI+3JktF6LX8umNkE86gPUD7ZruAMeixf+dOprg?=
 =?us-ascii?Q?zChkIQMtj+jnB2rZWojrgYhaCxo1ScxXaxlIlVIHVq93aseXZjJlMPzGNXKD?=
 =?us-ascii?Q?W3MLDWYIMXsinr6I4dgIEyF89NemqMdTp2zzZtG5HDzdeJGCehWcVuY4eyNS?=
 =?us-ascii?Q?cpft5Qy+VJKM56ZZlfsKGKlb06vBBA6h0GfnO3/duHxB2EClDRqSy2VZWtcw?=
 =?us-ascii?Q?yPBI1n9Y8t1Hk57f+E/NdGO/l+o/FHzhplN5vriKFiU1ReJIi5pjVzG8X3yh?=
 =?us-ascii?Q?Ad9b4hxxwhWT8vxvh4sQfqt56l4lPbibpLu5JmSJm77d6b8sCV1lMCJIvGOj?=
 =?us-ascii?Q?9vqJRJq6M10dV2J1WWFbEgBJSun6z2myOeWR7etmyzwM8qmT6swV4qGjloEX?=
 =?us-ascii?Q?B9nNFwd1ys4gmM2+HMtEOmOtF2IES32XE7xaca853ZkNGwpNk5L2/c5hkg2z?=
 =?us-ascii?Q?n3YFsThcYeFzKAwoJXefHMvHfzS1iXXGpZoYeoE+nDxP4ymFlA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/PTvW1ED/1wLszwcnb6thieC/kkHU0BB3pGkTGK9wyNjdvlqR6pdxb7nAyYV?=
 =?us-ascii?Q?qNEMN6PgrbTOh/IDmsuvj5RE0Zx4zaZQq+XNQu6ayzme6dhZTv3ONnEowlS9?=
 =?us-ascii?Q?5obzCoDgLDqM5vYzPDcxFZR6V0Ndks/ZrUDzGT2UxQrFVCeAicBCA8eJYq5J?=
 =?us-ascii?Q?l6sdTLzToLuH3m9J+ZrfnC7m70n6aKRKbiwlKRKZCDKmvw9EJIZiazj8GGpK?=
 =?us-ascii?Q?yoHufMbVRmzz2IHVY24HytAJXltil/VsncrO71gzqGAHDz7oZMDkAX1vE5kJ?=
 =?us-ascii?Q?5m8tgxCOOcOrWeya8BKcxnkcQZaRBOVqFMr2NadKIuCRlZpgtdUMFEiBZal9?=
 =?us-ascii?Q?8y3ZCnvPnwqUawvlbp9i9iSFzNEpxhTb+rFshNulY8PJC7Ru0uYfZIl/J5UN?=
 =?us-ascii?Q?fRaBGRlgeDFJekQsHuOIMXFu1exbcjjKvRu/1vTCX/P+QsEvanIxEzFCZkQr?=
 =?us-ascii?Q?1hIx7m/PLp4FUMqc9srPklRY/HMcXtqNXH4QDPdFy18dnlER/Q/VkkAkaIOn?=
 =?us-ascii?Q?XFRO1csxrDSg1IqDPf54041PS97tvCsJ0dLIJSxXdLzFV4AJkMTAzI1MvWDX?=
 =?us-ascii?Q?p2GQae98QmHxfaJyUMTfgwzi0Ex9LGdb52kPE+c/G47HGM+bsUxxoMrUQq5o?=
 =?us-ascii?Q?qrSXvn6E6wfd7MixiWOGRh5dgF00HO3FfgQ7x0PHx5mfs5edf6hPBlGQ3IoH?=
 =?us-ascii?Q?DLBvoOKdsBE40o2tGt4G/kqlF7A28RH2+FR4/JgXuN+YnqvIZkqPke1VP3Sj?=
 =?us-ascii?Q?2M77BTSCi3ztrKzD7okwRM/L0LCheZ5EtKxmW1FYkXOel3jy94CqDRaQG2K+?=
 =?us-ascii?Q?Ayg+rWtyLiWXlimCkIW5v0PszUo8D0y6h06Vw0v0hu0Ox1JvcZHTiHHBuwJ3?=
 =?us-ascii?Q?kFSTzILILdbUURZ89XNgmMdQGAYyW24ugBgGXZTnmPgGAdC2M5QecFQW32kn?=
 =?us-ascii?Q?S0iAtClZlLKmjOzzgcONvNcu9U55SncOONfLjZ3HlOxyMK3Hiqyz7jIniDE+?=
 =?us-ascii?Q?y/amekj654po1/E0PdIOLtUiXE1ZfD0ivFhz4M6Er255fPwluA5oBjxir3/c?=
 =?us-ascii?Q?YHNA//vO2GZbX9bgzLThe+y3nG5g9+CxfkKW5PHJ9BIXLhwushrpeQF6yr9D?=
 =?us-ascii?Q?86RrGvkbWgz7n9IFbwkzLI4fFl27VUKUpIANIvc2eoHictB5WRjUQVK4pFx7?=
 =?us-ascii?Q?fjsLYqaPDjGUcTPJ4fCEhwYn5Ee6nzhqn5rtZXiV6WLwlu3WrS5f8vQzLlja?=
 =?us-ascii?Q?tushpaZJUHN+gK5CVc9SddDjKhUny720rQYH/qVT0wvobT9hPHr+9FbsTjBl?=
 =?us-ascii?Q?gRYsmKsW4lJtFrUTOrQ1qqxf5JKuKcrXc/WkBF0bxkEgOUA9nzx4Y0VpoFZ2?=
 =?us-ascii?Q?/ZLx4s24hmm6mdEwuBXj5FNLYJNeJ/8ND1gUQJ3FbI41DST69DkJZdXaCAXB?=
 =?us-ascii?Q?yQlLaRNjk78P/XDZsglaXRpYe8IbNnXfoxcYsSINXPWJQL8hlZL6nK6CXIXk?=
 =?us-ascii?Q?56VxstYzzOKnK720JS+9zjGbzxwhVOH+3NbxHkWXZjYlJDGNSfhKfqMFiOlB?=
 =?us-ascii?Q?xIB/AgY59lyI4kKdsa49g8yox0yNc3rjS/JxBDkJUHmxh9E1UWu1L+lB0sxQ?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48fe459-7017-4eed-3869-08dd18138412
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:37:05.6683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtOXowMvcs4l3+ePNN5obsVoDS9Fo/Y+kqPV1/iUz6B5SUJmVySMJiI3Jr5Qoss8s3qxGyrtZEFQtRtXbv0ldyMKuLIsLUXCuDljdvG2QXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1671

521C Wave5 variant does not support 10 bit. When 10 bit support for 515
variant was added, the code which returns an error was removed. While
testing 10bit hevc fluster on the 521C hw, timeout happened.

Fixes: 143e7ab4d9a0 ("media: chips-media: wave5: support decoding HEVC Main10 profile")

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index ce3fc47dc9d8..28462e01ca27 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1406,10 +1406,24 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto free_bitstream_vbuf;
 	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		struct dec_initial_info *initial_info =
+			&inst->codec_info->dec_info.initial_info;
+
 		if (inst->state == VPU_INST_STATE_STOP)
 			ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
 		if (ret)
 			goto return_buffers;
+
+		if (inst->state == VPU_INST_STATE_INIT_SEQ &&
+		    inst->dev->product_code == WAVE521C_CODE) {
+			if (initial_info->luma_bitdepth != 8) {
+				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
+					 __func__, initial_info->luma_bitdepth);
+				ret = -EINVAL;
+				goto return_buffers;
+			}
+		}
+
 	}
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
-- 
2.43.0


