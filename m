Return-Path: <linux-media+bounces-29838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA4A8374C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B3D3B2515
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81132202F95;
	Thu, 10 Apr 2025 03:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="V6E0H16F"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C9202979;
	Thu, 10 Apr 2025 03:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256425; cv=fail; b=bJOJUn33rlYYS4dfNzesmiCqDAK5lefUKvfRvyenoNKmc+mG/ys8sCI3zg/zArgoteZQvOD7ghLpaQR7pol0lN6+OKkjXNtKhLlmTPYEmRmzUJhs8vvXeVwy+tVO9BV/hSzYcV0XZHfvglo6+BhPJQMIHufwYaKK+AlBCIT8AlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256425; c=relaxed/simple;
	bh=Ik9WKF13N07blOblz661ZgD6mKBNeoY/0oMx6ZlcT70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YEWLDxWIfMBLUJWmHQbRznRegCD+rTUXmLdxzaV7ACB9DGouelHJWCRrVQ/fHd89W7bn+z3BO48PNvFWwR+O4ka9RvztTHjlCuA4n2BDKPWpHa3Dn5niJ46Hh/ucPoDQ3b0nvIptOqDK1wAbuu2q1BPZ1DfsYkydy01JcgevP6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=V6E0H16F; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neAU3vl3buGQUAUlY1kvMwUNK5nwc8aEyoxfxC9OGtkmYZWU248LLDr9YPuDOWWiJtQ5Ziu8AZAjH8jgPdiBplWAjzIxvI9gqdFlBNF4zlcknsNpgXqlg6GHvFhE0bYfg7joax9dklliF1mB9c/w3LotFc6Kfv8ARjAF2vLT3NCpJ0PeAUpo7hBPOteLTdGQ3NQ9Rpq/YLCBhzrZstEQ4oOd4a5rGUyYN2o6amjjXIZIBu0Cwhi2O0FIVl6U6lJ5BZonJm+EjjQo4gu3NCvy5U2pBTYz6UPqCDLsHGps6CwT/SyaJZlvTV83mRt1MRZnjOL3RwTaR82mccLUyNhtFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cmghElbMgWV0U/7xBb5cJpCTSBslUZ7KGLFXsxFmi8=;
 b=ZbxoDT+LbELUTPy7vQgsdxTqzQAgEIh735PUQoYzV2lSZ3P/8L+OgzZ4rUWJPRnJcDpWTQJTsS9RIulUgMMT3fAvLEeprn+XrPMvNXuEy7eXi7bH3k/YM6ARHOe1luw2sC36ByUoqNbt3VVTtZSBJrxFPqkeJp27nwXJ30a0scXlNdy1dEXUdkeYS8zGJYEk3IutvZLvSvfiUKz+nWhKfRlKK4RvcRF5j8Usihp+bWI8p05ulfGP/X4aaF7yin2GW+0HvuK7SdHXfzfPxDInsppTRiEzPdSdRW5Wj9I9KthyDdzwL2p43UgynurGMaeJZFdKC46b2nNT/a25sR70UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cmghElbMgWV0U/7xBb5cJpCTSBslUZ7KGLFXsxFmi8=;
 b=V6E0H16Feu7yYlSCbOZeqIpruoH3t1L7lIGaOhJRwJR8pAWVMl4FDkFNoYP3KFxuxZD2YTXeTFw8zdMDLr6XTjbTWFVE88K2uYd0R7HgXPVkfAtB9AwpdKhkBwqtlHTP3VMNy7aVJZqwx/kuPmjuX0KY6QI5oFKOMT1ZmCIntDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by PU4P216MB1439.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:12 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:12 +0000
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
Subject: [RESEND PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever state is changed
Date: Thu, 10 Apr 2025 12:39:59 +0900
Message-Id: <20250410034002.88-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0051.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::12) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|PU4P216MB1439:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a2bb1f-75af-442b-823f-08dd77e1663d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mGCtRMJZZfkmvBzn3Q0ZqQijWRc1Gt/JMLfw59gnjo1MviAUxLUEPKSYqlXT?=
 =?us-ascii?Q?Xt50zqjN9KZ627ZtEFlj+dQrfyspAhwTlPSgQmaRY/JmNicpkglVZpoisCYM?=
 =?us-ascii?Q?U1pVvzNUsZwDhJFJr4gzA6Q+SwbZ4mb6gS+mRiKBjNGNul1hL44CxsPlUn02?=
 =?us-ascii?Q?NY71KfVWPm4HOHDIPk9UUCwBXYWqdNt2/3jdkI3jfCLwmd0YZ5OFh6vsD1iZ?=
 =?us-ascii?Q?2iMQ4e1KPa9rS2ZZMTcNbE5lP0/vrfkZUHReE2YtIBpFoB2tzkPp2lQdFeUd?=
 =?us-ascii?Q?c16RO9Lv7U3AeGHPWYakodA71PUmf46XXfY5vV1HEeBFki1ddTcUkJ/UV6kp?=
 =?us-ascii?Q?8Ji08ic4puyz94vof97ck8DTEZtFzMMqkK+xPKa8KUa4X+MC/7dAYZxoVMmj?=
 =?us-ascii?Q?mTkRUomWCgsZyjOghuL/daLB+CTBXN4HDGfjf8Ewxge3Me9Jx0soLehbZgHA?=
 =?us-ascii?Q?O93NDW+drsDdDFiyA82h1lgX3AHz/oKnDXzTSbxkTPLOfrpAo4zB8uiJH3W0?=
 =?us-ascii?Q?cMPylY7OJdwmxt4Cxx2+IUVb4WRmZNkWOKOM8LDRDZAYWO0P8cR8GPcZI0W4?=
 =?us-ascii?Q?OIZ9JxnqUhKzCjZE//UkX/AjvjOFE8XP4WXq7Srygw/ZVssAgHnyz8KZfda4?=
 =?us-ascii?Q?6M6453uFtRWDt7dgZtciDhW8qe/ulK5/YGj7DV57lr6WL5/4j29ypVZEnlD6?=
 =?us-ascii?Q?ZtzpIUraReSAFWg883ZierZCOngtaHbklwAgO3Nc2hrnFIzurU3xqswWnhI+?=
 =?us-ascii?Q?IiXqzskb0+vE/gWMDZv9C3k62aF+a+hHkPLU8uYQU3cO183/J8OAYhhPcivI?=
 =?us-ascii?Q?fkrM55jl0DaHKQCy4SrHprT6eEL3Bf+22c9pxe3FPrSrTy40lzoOMH2ohPDn?=
 =?us-ascii?Q?R3QxJSdRmAHqkjnYngg763ToUXrBzNUuA8zOwmZQcIQf7Keewkag/WxQfUAi?=
 =?us-ascii?Q?WjvzjwwOjHuEOfjmyjxhmv3z2MAkU6+xE4TtbJqatfU38BIAKW54stHTurEe?=
 =?us-ascii?Q?0yRiBpO3il2H/mYyHL57pHTm8bIJ6EcVRPStpIHtVCHHKxpoBRfaamCg3NP2?=
 =?us-ascii?Q?DwXgXnoUKczARNUKo5yxhErFByC3f6yqdznEfLcvaPNW59wX0kQV0vOorw3f?=
 =?us-ascii?Q?LjOs7q7e7i4+3VqyvK8hRTcHlPDhCPafhK0rVmy5/jrHsjdOnzSn+n+gZu5i?=
 =?us-ascii?Q?6jBNrphxdi6onIftAzPFPJNMYEF1LhyskScBjPntfEaHCDIp7R6XMMI2zrlb?=
 =?us-ascii?Q?+oaojvSmlIP+mSk40JQeDkI5JlOHtOVbv2vhxEDfMWqWtqKaLlfkAkm7Cddj?=
 =?us-ascii?Q?mE2X8enQ9bNX5E58Sz4vshBqSJ478nXScJkYeFQU/aIluChjtAQNQUFyp0Ei?=
 =?us-ascii?Q?VXQwo1eRsoxrd3Zmz4QlEbLXhJefi2gWZdSnTr1qJHu7+Qb25EdDZvR8xh3y?=
 =?us-ascii?Q?r5P3Gwk2TJz584xM2n9vSIZrsnqEiB8U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?22XuU1xcsSm/wnzdEKthisodiLzA2weUj7cyhfSAyGPeBVCKRukxXbzgGJBf?=
 =?us-ascii?Q?61tN3K8luItW/vgN4Hwg7k0yGJXYz1yMCIjEZNOCndb0fArDhvqJnuwbAQKq?=
 =?us-ascii?Q?Nx3vYKE2I5f4yoeA4omqb+HDTGdc/78w2TyznKUJE4CpDf8dU4rx8e/0D3Uw?=
 =?us-ascii?Q?Zcq/JAS/l6Gv4fORMjLUu4ug8viVOPe/xcGiXs3x4Gq6szs44OfM22LR6W8l?=
 =?us-ascii?Q?ICqXXWtJ4xLYCwFuK5hwnd7yci4rYCwmo7Xmow+HRnww025JJOGUyfVy6X/s?=
 =?us-ascii?Q?T3hkEGcukREK1mCZPJkqa38QXXxoW+oaJih/mIYC6Mrlmr1rkhCEPMiqqxqj?=
 =?us-ascii?Q?nGSjR9xQ2PPr3ne1fpQlJcqxiEIlR2HHwNQPs/KYgnYFoTPPZe8Vy8UEwaQn?=
 =?us-ascii?Q?ud2lKnJPXKU3sciLtDJaH7AvhKiQ+vRa+oXAWtKvLG9kAqTfT+8/XpI1nH+n?=
 =?us-ascii?Q?67rUpM3pNCc0PPhUaPn+JPIqwVQgR5kNf552/C7rf7MSxWvXsoaiVc8srwGO?=
 =?us-ascii?Q?T/ZweVLtl9iQDoiDS9Tq9DYeHdzxmP5UqNoAP4FlJ6OlkhKUTqvURHOEWv+m?=
 =?us-ascii?Q?1AjpI9Bb/B+fJiK2T43/v7msgbOZwq7u/kzM0O6ejnmBwgb5VONN06kWeHGe?=
 =?us-ascii?Q?Mla27d9F/uQ1J/Nnm6QYMOy8YotTvUyfLiej41qAF6epXn/I1ADnmD82x1YR?=
 =?us-ascii?Q?XHYjbhrXd01mrFFnpO9Bnw50vfxJPJQVryZF494o0icfilwcCvqOFYwiQ2D2?=
 =?us-ascii?Q?8JFXhiMvIdec/vjMx2nsNd2nuHFgFyx4pbGvoeflcn7DzXgGMvxqM9AaJ9gT?=
 =?us-ascii?Q?s88cWd3f4qkVwv4tvE6JlmwSox/JGGW+1ZwINOffG3ZU4UqGBGPQtXGmj/k8?=
 =?us-ascii?Q?OePIQ42/u88W9MjAuIr0/pT+3P68ZaVG0o+hRUCs7sObqSCDECB33Alh1uxC?=
 =?us-ascii?Q?jE/ZudoHQ3z/cyWwtJskk24+ahIz4Im9dtq9VeA6hUixHbXXW6zqBt4c88ZX?=
 =?us-ascii?Q?dFw9d8UvC25k1aPyHzSWtWjk05LfE4Xv7B9+gc4jb8uDLbApQOuxdcNi8ZVp?=
 =?us-ascii?Q?dB1sWIhDY56yfjFclhqghbc4ezDMd+SxRU0ec2iFFy9LjVy3SesMalC7wBNw?=
 =?us-ascii?Q?8KEfjDouOQ0Johzq5UMBb7N6UxVDMTEb48Hvg8RxEvxfKxLpjSEzCIDemGAQ?=
 =?us-ascii?Q?XVyTli0yKhuRnjhdp4tScZY0BYTWWzhQ1TVAfTLb50DtbXCPsQyLnWRpe2Fu?=
 =?us-ascii?Q?ZB3kL6gNp+r4EWvE8MCCU1gsdl9HFRuvpW33KWFVb7bPxKDX4DE4lK1Pq7rs?=
 =?us-ascii?Q?6MNYMEonD0xUm0xKdstpUAWWb1+gF7+3Dq6cyFcvH09TpYsAISCR6//t1wpA?=
 =?us-ascii?Q?IV0TNiK4pkbPgw3/j9X3vFi00phjreIXr1/R9OegZgmdgLm2/eqDTMHDQ8fx?=
 =?us-ascii?Q?xlJZ6CRz2l196vtOoO+RDMAiAPHJj6cBeqQqCqlXtRXk5wY6vylmWoqJ2JTW?=
 =?us-ascii?Q?V3NMvPXDPElRZ50mTlvI7qzyboTMvxyTfhjAGZG0K8O7ouI2neSsDPwI93NI?=
 =?us-ascii?Q?ZHVxeDlEOevUtY24+/g2o+spyQChJvKJD/v8e53F0y20yJlK0BSZudWcdYAj?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a2bb1f-75af-442b-823f-08dd77e1663d
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:12.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+V03oXCyvDcdjaVk/zJqFF+7yVkr3un4nC6gVVofJ327JFsZPr/H3MH76r5l9izcG8xGteDFIwigD2T/qB4JQtPMZJcCDedWLzFgcM5EV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1439

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The device_run and finish_decode is not any more synchronized,
so lock was needed in the device_run whenever state was changed.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index e0f4b11ee464..485320db9bdc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1577,6 +1577,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
@@ -1617,7 +1618,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		}
 
 		break;
@@ -1628,8 +1631,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
-
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
 		 * active until this decode operation completes.
@@ -1643,7 +1647,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
-- 
2.43.0


