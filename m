Return-Path: <linux-media+bounces-29826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D051CA83569
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE4019E5A2E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AE68633A;
	Thu, 10 Apr 2025 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Q1qp/yzu"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32561ADC6D;
	Thu, 10 Apr 2025 01:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247323; cv=fail; b=oeOeLN4/Rsoy9rR9mgUGqGkWWvT/5HD8bubtruCEuYBPA6lxLbnK5Ct+QPXprJzJw0KvoW5aC41G6JZDExL6Aq+4uUe9XRADxlBHQP52ijxMdd/DKMFAhUCOWox8OncpUsCWSIHZX55gD+HI9mIil40nlhpLMW0EiVlfyedrWGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247323; c=relaxed/simple;
	bh=7Y6Ne4JqlIIf7pmUS0K7qCOkTENhjLfN9zZ3V1fzuBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=shrNpZsNMkkbbSvXmZFQ6AOnw18XU1UO722wphLbruVl2R2MNnI0cGGMRDRn0q4nK+9FgvjK6O5UvsbOoUpiSvWUvBPk5mwUuMrSC9nvvs/Qoa8H4nFFox/ZY0ZFGc4Eyrz4pX31CiXPtdWWayYrW/+4PDyS4RThVVblB4rSXBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Q1qp/yzu; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7GzH/TkOSrH88hljDlKVTbx812Hyrcbvz3m+p+9o8X3tfwTepB7GVZka0wheO/eOnFL6ZRaQZQoBeU4y5xzl9IzdCI0GyNXN2q9rnyL4GbuZpcmiIRZzyLioV31xdhANADTnFDHQXl/I0kKMR+cqjzMJxYFzBx11iF2tr75miR4zgZSX1JsIck58TAnxNLziF/GZfDgjk+u/4l+jZrPtzSKBPl7dzvu4wia4XwR/PTBPbVy6mNEfVYnNW9C9HuHgUgn9wJ25wRZn4cIet6lVWt1BMzRHwNb5QD9dGJBxNmeEYTbL3KZRBEDEwQyx6F8/Xm3T008lCaDghSLXkG8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmdCXJlkt7j09vBMuBe9gdri/287jZz4+x6tJne3UWs=;
 b=ha4ZwWwAC71Fy3bXSlYjrmGTPTR2Y/zzJ+IpI1+rTfHL8zHOEJFhQOi63dQEGFetm4hQyk5KegsNm1Kbek99LhP/L4awHwVu4et8Yi2lsDnrvk/bQgmPmkWkksWcGeH8rjro/6ZvGYtdWBOhIoMgZavIxCsRK+OdlcqpfjGZvzuKdx2kDYtng/YFL3jwv8iAYpQX8Jug1yvJnCK3k9dJJ/eIud9i5HPvyeO2dI9Gz1z+GfUYmelJlqJKYyvb2kFZoC6lpDOpBbGBm8pdMKG/tJlVM9djwhrp19UWTRFwUniYcntWz5dPi4njh3jITcSxzadwt7PI36S5F+IeznbDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmdCXJlkt7j09vBMuBe9gdri/287jZz4+x6tJne3UWs=;
 b=Q1qp/yzua1ue5vuQD9PPc7lHSbtAginscr+05ftqKCtwsxFAA3h17W1OAaEuqmgjURr6M4bVJBgwK9mAOXdGqyvqHAG5YIxJh/agXJvT631EUPUXomOAHySn4e3UD0f0ANufsuxdJjp9sE17fxAxX/0kWLuK+DsF+gk4gHsJeEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB1403.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 01:08:33 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:33 +0000
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
Subject: [PATCH v1 5/7] media: chips-media: wave5: Fix not to free resources normally when instance was destroyed
Date: Thu, 10 Apr 2025 10:08:19 +0900
Message-Id: <20250410010821.52-6-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
References: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB1403:EE_
X-MS-Office365-Filtering-Correlation-Id: 2091e289-6dc0-49d8-e813-08dd77cc3691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iGg2xxM6WagttCcEdUybLaZrJgUh0ThoG2stSIDITW9G6YMDoSe/jig3Dmpv?=
 =?us-ascii?Q?dDCsuucQeB2ocgbz+ceLlaJMWqwxuw+SadAe7rgBGg6Lm9ommsbjNqjA3q7U?=
 =?us-ascii?Q?3BSuKvvK78THfOScAwDH+A+1sHbu5YrwEahhR+iQJ7gAg3EWgYDhz85T0Fe8?=
 =?us-ascii?Q?/B2WAxFCHXoWEOoVtK8FUSDXMb/h0/E9xiWTC8XeJNZw7LM1vbdieUmPZQ9u?=
 =?us-ascii?Q?oZ1MhYoRK4Ra+gMRFsO+QuYg5912dzwz25HRIvoPVOOT4p14L+wY2+seMumg?=
 =?us-ascii?Q?+ZIGgcbfF9AZpu47VZC5V3wvoUEU3JNUl5Ql+FLUClBEwMx03PsvIgW4OlRg?=
 =?us-ascii?Q?408TMdSsbtX1VuatxNXwGO17cCI6IhZbxXBhbek5+3bv/oLrMeNke4lA1UYM?=
 =?us-ascii?Q?BBJR1zp/uHGtu0C3XZ2ZjeD0IowlLfhiIREiQufAUjPDHuvakjPX34Ci5/pX?=
 =?us-ascii?Q?3iq6NesZfypDZy4IAf7GiIcxLkrUxypbo38HcW/7TFCMholNyvtlrZ/Ysu0q?=
 =?us-ascii?Q?VIMg6Bx5uS7OgJsvxFOpUiux1Uoedl/hkTifOHjI/IGKEzYf/LpxCmuMH4Zh?=
 =?us-ascii?Q?P6Sq0TgeXGFonVSK16KnJJeOA4Kf6HdO6QNfz7uggrA69gRIeYmnnVbvX/5O?=
 =?us-ascii?Q?coIGN606bJV1zjrbzG1h6VpVA0IwDfJLLNuT43D58JyDtMTVdmGDNvp5Ewzg?=
 =?us-ascii?Q?c7NTZ7rGKuAEqtBdMqNEX08ku9obmXG9/J1Ek8Nazi3EtV1JsOmIN5vBRjE1?=
 =?us-ascii?Q?Ruiu0kDEFvhPJc1Hj/PraR2+yGx8MJXS73d4QXHnUflIxENQLQjbgqktq9mD?=
 =?us-ascii?Q?KTc7A+6aT584eE1RfCxANWfL0qHFIUfNF7LU/lnThb4G8eBQn3jqArBcZE9p?=
 =?us-ascii?Q?3cRZj7BU6QRMgDeijbEBtgUHUiZ2+ndcZw8Am0kwTyPCXUHS5ktKUitE3yqi?=
 =?us-ascii?Q?6P1y4kCIEdpAGwgkDid5Rbld1maPStQ4Hohf82j7k5GwCNETNX5H7C2wN1C+?=
 =?us-ascii?Q?VPFVU+0Dce7qiyfCJ85Pd7ULtzBS8E+IIFlXtvpFxzBZ7JI7L1WfyFRHlSkr?=
 =?us-ascii?Q?08Du2wSyZ3Lbz5beJA8ftiVJJKABPPxnFz/EVBeWIH/3K9vsm5wR4Nole6iw?=
 =?us-ascii?Q?meRP1HfwMGZW6Q4am4TZX8E3P5jWTG5bsR6lYKQelG2CdyS36hOekTts8uWn?=
 =?us-ascii?Q?7yTgawpHpASvQZHHE9oZtUDwKQHgPPPU83JAFN3d7W/JavlIdMLcdcYP+Ev2?=
 =?us-ascii?Q?4oWeYUDWlW5Gvm2tzGDcDVhu5bRq4gQ8fOcHYTpPTnaQmY2edqfXN5ToyPm6?=
 =?us-ascii?Q?C5ObWyftjx91gZSNS/F7dxg3yqq9rd3ZK4XAYxkdjjmaPuE0oJxGZj3crTNV?=
 =?us-ascii?Q?W0/CUGxHozoJ4bwKANDDHYT1ZSkfHHDeGfZYpcnbNjsheMlodPSq6voGVjIR?=
 =?us-ascii?Q?uH+//Eyg+aUukhZMjSgEClKQu525sFkCpyN0X22o8sgeOGru7SU6lQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ChKu6VGXuRsq5odLVgnmWDqyDsVeE2jtEkwdL9LUsrW8+87YLfG7htQen4LB?=
 =?us-ascii?Q?M+6ms7T6YwsKRqltkD6ii2k07e2edj4kMmAjTWhuueoUywC51AXqLvVJdxFy?=
 =?us-ascii?Q?w9P/TwTL6lB0kHgRXofPw0kRImBccew4DXVLGFf0sAigDt7lrLxhs0CwBAq3?=
 =?us-ascii?Q?aBr0Ypw9fMQj+hTROQ+DXYxKRW9gLCB+lQ3XwEJ8P2mJfydMcYYQRv0Halul?=
 =?us-ascii?Q?yXrqYSlwJ3eZLyG3Y5zkrwkO6UYF1o53wVMVijLBmdbdgq+4ax9ob/NVAqdo?=
 =?us-ascii?Q?8AUCTp88L6xG3aiz7JisrQO27gZ7tQYfE3wmZxBbrYnQ6A3MQ9a46fNuRecS?=
 =?us-ascii?Q?YGah+M6Y4HppeR/NDK2ISrCMfpaZOBOx4HfVj5wyDhdgKVHevufv4K6OfvLJ?=
 =?us-ascii?Q?XSwK7Ij+p/Ov464r7AYkU6wWPU3/JzVUReLyov67d30/gTCOg79ovzG4rEUW?=
 =?us-ascii?Q?YEq1s2Z7D92lX1Km+VhjO188wYPvLgLTkgsoJUAJyjKYNm5w/e1l1pAOgjnT?=
 =?us-ascii?Q?zL7VbtP2Q3iRpcV9X+6mA3J3F+PKmTUFrrN9beZfo/rIVTePhuxaEtZg3NtU?=
 =?us-ascii?Q?uS5IqBqQY+MDXsi1hLEs6xkyKoZLGYjIXI6LhLNzXK40XGuYMp9W2ubnOJ0V?=
 =?us-ascii?Q?hFgifxsRfxZC+h754mwobdNmviu2Gdy7seGaUFYeb7HuqdhAQRXgNHP8xG3u?=
 =?us-ascii?Q?ingqnRoPFFC1IaNnL9fv/gYeVTmP7twzuMvbAx70lA4Am/ee1QQ39UUOzQhQ?=
 =?us-ascii?Q?ROUFAzB9s6jUFmo9QNj6GNMOzN1Ou6P5r/xnTGXM9JFOL3Qeg0ZVKwbSQJQA?=
 =?us-ascii?Q?+dsW5ysi5xJf9a/9CwIohwNDkChPJuf3Klx7TzwJG4XEoheeovqe0b1Du2ru?=
 =?us-ascii?Q?ZZG/wsg5bC3ERlB0wmW35ZX/Lne8RnfwE0ZCaEbKy6VdcCQFUlztB2aslkTD?=
 =?us-ascii?Q?tD9ebfhEr7dqHc1K6bdKiwi2zXs3A+CbpqH24MU1WL3NpVF2ySGUDZivdix/?=
 =?us-ascii?Q?KAbJ8v0/go6Ku8K/tLR3d9sMIQoKFv23DCKTV2xPd1kVyLm3+J2u52hu6VI2?=
 =?us-ascii?Q?gMAD1Jp6BgpXKfUlYBNdHJ3tadfyqrRaSy7FQCDDuJ8JWhrtU5d3D/lSFioi?=
 =?us-ascii?Q?AuOSAs8P8bzyz9ogKo946kiZFQ1yiziAucxYjuO3ydcY3F0n2v/ZJ5wOP+xM?=
 =?us-ascii?Q?wEhITMykWqglHov7PX015AZEw+pK85tAm8IpBuJ4Frmjg3vDr6debP0qbe9c?=
 =?us-ascii?Q?NO3J+rtLWa7hXNxkO0+bqx9xC8gIVp/WjXgZESk1BhrpE6aI3ZrKZJD+4n9w?=
 =?us-ascii?Q?Ew892c8anIquLCxzqqvEHdXdLYgCOdxmdY7JZbJIzg+VQ79wR52YD81bVT7y?=
 =?us-ascii?Q?n7ogenWntfFD/ondABET2bqAV0m9espKBVlWqQku+AJMyo5LCFPx5NLiLjr5?=
 =?us-ascii?Q?3SQUDxCybZIsiQcYEpgFg8MYwW5/Eq/7I4g0Sv+ANnOTAat1yEsGCp5fVwuC?=
 =?us-ascii?Q?FwLwiSg1/ed41bG5dLyH5/7j2ngRUkUu9UpQnaX8PC2IA447a2zqMr44GwSp?=
 =?us-ascii?Q?qyJcKqdfQxrle5F1e+CVxEdEy6L1octI0cZCKrj3b7AiGyHqu1jStXyjy790?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2091e289-6dc0-49d8-e813-08dd77cc3691
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:33.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feY8mqmM9gAUEFK/wtEvOECyNqyisJNKiDLPGiSt+AtIQcJTpnjk5n4ngMKCEDZmmazZj1QiD8GrttUpgeoB7kwZA5rytKXdDWFCpFUUjfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1403

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying performance patch, there was a problem not to free
resources, the root cause was that timeout sometimes happened after
calling the wave5_vpu_dec_finish_seq() when application was closed
forcibly,so if failure reason is WAVE5_SYSERR_VPU_STILL_RUNNING,
the wave5_vpu_dec_get_output_info() should be called to flush videos
decoded before closed.

Fixes: 15a4f7492acc ("media: chips-media: wave5: Improve performance of decoder")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpuapi.c | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 68d86625538f..d7318d596b73 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -209,6 +209,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int i;
 	int inst_count = 0;
 	struct vpu_instance *inst_elm;
+	struct dec_output_info dec_info;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -229,11 +230,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 			goto unlock_and_return;
 		}
 
-		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
-		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
+		if (ret == 0)
+			break;
+
+		if (*fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
+			dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
+			goto unlock_and_return;
+		}
+
+		if (retry++ >= MAX_FIRMWARE_CALL_RETRY) {
 			ret = -ETIMEDOUT;
 			goto unlock_and_return;
 		}
+
+		mutex_unlock(&vpu_dev->hw_lock);
+		wave5_vpu_dec_get_output_info(inst, &dec_info);
+		ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
+		if (ret) {
+			pm_runtime_put_sync(inst->dev->dev);
+			return ret;
+		}
 	} while (ret != 0);
 
 	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
-- 
2.43.0


