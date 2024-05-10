Return-Path: <linux-media+bounces-11316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE3D8C2339
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576201F21EE5
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 11:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBB5170884;
	Fri, 10 May 2024 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="KF9e0wMv"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32D16FF5B;
	Fri, 10 May 2024 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715340204; cv=fail; b=r0Lu0wL4RYehB76ZRksKMTnuI/AA5mVvuSxWY5pMVlEYp8y4/+4stBHfsTSrhVNR3K0eKw+V8DfRpQuRmWN18aRTgbcFxi1SuTFeCr2WdOWAZ6qGWCKKFKW7g3QFpzSN4uylXp0o7A/jOzbKtKFEOY5Bl2ZvnjlhCvI3Vt9UQ6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715340204; c=relaxed/simple;
	bh=sPD6+YGlDMWDRGEEUeou4zIHNyQcJ1mIkNhi6TA2tTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agoLmo5SSt1EWlnIAaSfLHfHj483+L7Whm/NL0IadsPqhv/YomLI6tf8eNIl+r7vYUfvdS+GUNsddLbJaptUSHu/PA8Zzaxrr9N4b3yUn+u1wbIHAQ4cNM6SyGau1Nis+BgrHocxEG/t8t3voFwdqmi/ZLBmDnv4lCzxTRDL27U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=KF9e0wMv; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKWL16iLPxSXu2NPce0xUxSpiqfHROe2m/AuWeU1GmLX2LQDgaeS55v1nuhIZJXYjB8JgLc9qSBX57so1qYWPEnDdEHZiLfBoS+I4jHUr2j5PXsIiTnlPcFZAfR546eVzBZtAIR6uORmhXqHY5Bv4n1bpBpfOdKhtTcwKMH627qteT5poMuRptJlC2Cxi1X4XeMc7apFxh5zpVXSSOvZ6ravYrpqPPwHmIPi8UnJYAbR/BYgH18OqpX67t2Hu53H2nwJhZj3I7nJ0qHRS2ucW5tdcZX1AnNQNKWgrUAqq7hcSWmDD1s2a7KCUnmGHicZHq6sEWWo0tkwdBkUL7KTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIuLWFkQPpa3wN+Kc/MaH+1CyTD/wOpW2RSQCbprehw=;
 b=S111mev4M7frKRufQEjM/7NI+DMjnbL8pv5PsYND6BoZzPZSfbd5ubARkj2irQo+8qgGGB/++IzcYfLU6QCifgSovHh5CVxscoGJN36Wr+l+WkRaqn9G0q40WSvxEONidG9Ihobi6NvZ+gPxJZoA4jzLMSgs5hwW5X7883buZYQWGEao+D6fCnE5GXheDpoM445b4qhbCPuhH4QgSFtaeDb90RqV84cMgGLgpEQ1BF5jIo1sNddbv1P+LkI6Qgvp0+Eg130SG3DeuxvqGqlyANWU/qYSIAYmlenOk/ONAXPuiR+KM5lTz+ttZQf2rFpsuW5nVFlKT0XlWjIJotH5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIuLWFkQPpa3wN+Kc/MaH+1CyTD/wOpW2RSQCbprehw=;
 b=KF9e0wMvO9An2m9zYOzPZBgCn2QWkalTNvm0JYZ76JD+tRz48QVgzMqseYaFDBm7W1E96yTtBweVQnm4tmuAhq6m5ZPVFkRaDFLCDjoAlJ1G5WgqPdapH9PzxHiAobYZazYZ5GWEsafq4W2gxICzzvI1tNSxn+oBPIKl1K+T+WI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2862.KORP216.PROD.OUTLOOK.COM (2603:1096:101:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 11:23:02 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 11:23:02 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
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
Subject: [RESEND PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Fri, 10 May 2024 20:22:50 +0900
Message-Id: <20240510112252.800-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::7) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2862:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c4cad8-9e19-4006-bd45-08dc70e38e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E5hLe4/NOZvHR5eaZsVht4rIj43cnMcGL1aYbbCH2tRqkwZCK+lTJkFD39Xc?=
 =?us-ascii?Q?vNcyV/LuDt1LBYkiG88h/JQTbM9AMAuTcDbyGBS0ttLAxzT8eUoASlovOKPI?=
 =?us-ascii?Q?EvJ6x4m2u07UR3Z5tcu+utP+yDLg6xknUG6khQjGMZTmGLrJ4L5/kKrKWpXS?=
 =?us-ascii?Q?kgEczhDgaYb5tXpzIFAv44qKhQ6fZO50qfk06YdY6aOCMjnWXQtA+24hRNan?=
 =?us-ascii?Q?17a5XYE9uI62B8PeUcFUuxpqpXpJUcoUNTTFRbPfeYvVA0ah7QLD/25pcGDL?=
 =?us-ascii?Q?Di5yedv/3mWWnV/IFflrFYUQju61n+Ia6eWGPGo1RTsRT4e9w9f+26o5Q2qe?=
 =?us-ascii?Q?YChmXXxqh1ZSLVvfYx41rKw09MBEKXtV9j2Bhs2R7huYKhOWFLa7M4IroETA?=
 =?us-ascii?Q?dAwefDstTiS9e/6Ep7dqbBvMzWJmigNmsnIoFVjg1Pzt7x41a8h5HmSmLVsB?=
 =?us-ascii?Q?f7/0uk5hZ3O3D6nRp6a6SFp2FariciaMiOtS1YQopCJIObkqmy1Zl9frcTpE?=
 =?us-ascii?Q?607gZ11Pagk4B+V5PhefTc+tFDon+HHyX/H1gNFPBf3OnQTEn0GKRvC8MXWc?=
 =?us-ascii?Q?9BPSBDB1LFoWV05Ec64SXqxu22qODdynK69TZ+3o2PVBc6J2urnlMEAz5z4L?=
 =?us-ascii?Q?yrDe4heBd3THtb2d+P2yz+BBl+G3gjoy6QjMIlvv6+styG2W7xxF+aqlzCfL?=
 =?us-ascii?Q?/jHNkprPxoxzmyzxcwUNzZ9fxhrDX6GDpB7mOhsACo5FCzMb2gJ1O3XVGxVX?=
 =?us-ascii?Q?jRHMoLB1E+eQIsKy0v59xKrybh0TzQiqswJsTMaZrlmZ9nVdK7uUws6jg2l3?=
 =?us-ascii?Q?2TVoBTjqGU1FusGZFZLy2Zt/Ypoo17D4XjbB06FuMutbY5/JvDJPrIMfdB1A?=
 =?us-ascii?Q?uAtyYYKHImxovaXfLzG/qbLFU7rv903fgx2CQKDcc3yfLvyWWlUUGioikOop?=
 =?us-ascii?Q?lSUvZItG2IUKxILfzUE2vZJ0x9/lYwUR/GWF5+C3Dd+mb6tEpsFWADFIE3kj?=
 =?us-ascii?Q?b/UD3rGPiLgQ094aimSgRu59kenMBe/Ph7bnS72gQ3dupR6OKGhYq1pDX4WT?=
 =?us-ascii?Q?Uszu3jVe9L2McYOq9wVis6R6HCmeBYV2xd380Ktp8mT7lBXoS4KWwm1BFFKh?=
 =?us-ascii?Q?vzoEWN96xaEUDbenqfHClZPj3IUPVAGbsaHe8hzhzoT1qkoEKw99OOHPTO5f?=
 =?us-ascii?Q?OXj9DyblTT1qV4oVK446bPRITHnfjANSh2eRZ8m+utVHElceIUdDkU33W8Ty?=
 =?us-ascii?Q?h5CmxIN/85exAihkadAC4zsE9LDDmZurhK3lRbMDq3Kfn7wpPhmOH09rqfM5?=
 =?us-ascii?Q?zrVqW2oLN/8iPTzdvyrlGLnX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Jbk9s0IlnIrNEGMHT6IiG844wq7UvM6SZ5sW1RY7jKb6SVhj2awp0uZv4n/?=
 =?us-ascii?Q?UEgWaETMUwv4/lIE/j/cuQzmANlwX4v6d2EeFy+8aBmuYWPagYwUpq9LtwEH?=
 =?us-ascii?Q?ZfCKebojFG4VpRK+d26eUAkK0uSxqohe6hTzvBKy41CpR2ANuHWO1D7cp+zT?=
 =?us-ascii?Q?n8664gKtRl87YLS4NsdRNZlHJ3nV7/wXSVZPjL8fmx4hVDmp3WVUN/mSdGbf?=
 =?us-ascii?Q?o26Xqy2XkmAX1LoG65hCsMN8VHKG166CYhlpoHkjWOio+IyV5z4g05omcj4Q?=
 =?us-ascii?Q?ZSjBIrMGNONKzXbnda/dVVuet1nS53xxjSARmnC4QDXXGACJeMeY6a8F3UvF?=
 =?us-ascii?Q?REqdRxgIFWLGIyuJ59Bu3YXE8aEL3kI1K7X9mb6O28oTEeE/jY7YrSXfQf4F?=
 =?us-ascii?Q?kVWOPzbVBfG2zoAGWsF7GpFNjvfyfMOdjBrZ05NwLNnbiN02WRO8lcT3AEGU?=
 =?us-ascii?Q?R+rfFsm6QEY1+Pzc7IqHYDUeLqyuoH+noY0FIc7LRrp0ES+R8xIMq/+jwc6z?=
 =?us-ascii?Q?bhKOjgoUd8skdI5BFxcKq7IlxeS7HXM/aZcqtCbRsH9MCr0rMjy6us8FIEGn?=
 =?us-ascii?Q?EkSRA/Br2HwyuUL9NRV9rmEOWtr693NGci1FQnDWeI1i9X+z8fS5uZ3zSLMX?=
 =?us-ascii?Q?dEnDaKxiqHqjKGxL1Ra2Ua+TaLVKL9nTKh4YTN3BdgE2gSf7lhhx+Kr8sARW?=
 =?us-ascii?Q?/Lpa7Nmp4qYPWuMn/gO1KXRF/WJ5b3vokl3pWXcu3xcd+IrzujLsuqZaCrEH?=
 =?us-ascii?Q?aGHDUE73FuLQUC6gGquCnL+JYAUGj5S8S8o2e5h4nkqXrJK6xQ9Eqf3mxVPb?=
 =?us-ascii?Q?uTBcblv1toYgkOze9zM49jHNsV1Z95v+c9G13Ye/vlnqd2skBXXNSrjiN5Cf?=
 =?us-ascii?Q?r8qTcc0kflebMNqnN5NyNy0W8KjZUKrsESN0LkQmZyffUum+9k/lrLwIcEyY?=
 =?us-ascii?Q?vNAoh/WgRe4fqYGBSf9BkCW/y1n6LbDcQbBRhjkHQmranp9A14qzoLvlIR4k?=
 =?us-ascii?Q?0y/Cv+w0MA/ww/dLqrCoYBhiQq6N10ErF2C8Iz8LXzzVfsiUn8weF0aWkYfd?=
 =?us-ascii?Q?Spossinw+6BSMjqiXrFwQGNgS5OK91pQgd38X1kEWcjtdDwHf0jkx9R4AW39?=
 =?us-ascii?Q?ci4V1OhUzoCe3+pbdDjHVT1Ds/8kt2VOSEipm4RKc+2n0RataZbRWVrF1uza?=
 =?us-ascii?Q?HYISoSrxJGVuK1P+cdPregRBOr0MUVib4snAjsUauWw35f9HjKWzrF8/cdzc?=
 =?us-ascii?Q?BYtX8rY5gkEgx1pkq8F4q/2zjR1BthlVzByJV6VXg99VE3NPZvmJdBms5Y4J?=
 =?us-ascii?Q?EXYUliQ1o4PK+4UGhObdmGrbgw19I6fHEGPFRWpkN39BHI34vTRj0WC9Gpnn?=
 =?us-ascii?Q?YFaS2Q+mYtdtwWisTriL9MY0ZdkMi3IkzPRIcb3bxaU/tVkAtm7ecA+YDoAd?=
 =?us-ascii?Q?p/yG/cH5ZDEAgCD3JdB/GL7tCq892IUImkDUAzGz97rfwHk4oVspHQsgitkF?=
 =?us-ascii?Q?fjybWdn34tKukS2Le0Wh7IgBTPPv3mjI9BgNgofizSgBA843bMyNi6inFVgG?=
 =?us-ascii?Q?nGSk/Y0fFCCoHBAVlkR+YOfjFi6hD5R+PetDyNeF3pF3xMiXurb39+fIEdJB?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c4cad8-9e19-4006-bd45-08dc70e38e38
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 11:23:02.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIessfaONly4lAA2tZB68nCRB+zZCA0HrUI+isdOw4XK+PwOVKid4y6jFPKsLEu4o6gogNaGrb9kxQ8o+TlpAfewKy2AGLK9g8U50NS2AaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2862

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for runtime suspend/resume in the encoder and decoder. This is
achieved by saving the VPU state and powering it off while the VPU idle.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     |  4 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 16 ++++++-
 .../chips-media/wave5/wave5-vpu-enc.c         | 15 +++++++
 .../platform/chips-media/wave5/wave5-vpu.c    | 43 +++++++++++++++++++
 .../platform/chips-media/wave5/wave5-vpuapi.c | 14 ++++--
 .../media/platform/chips-media/wave5/wave5.h  |  3 ++
 6 files changed, 88 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index fff6e66b66e4..791b1f0e3199 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -1084,8 +1084,8 @@ int wave5_vpu_re_init(struct device *dev, u8 *fw, size_t size)
 	return setup_wave5_properties(dev);
 }
 
-static int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
-				size_t size)
+int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
+			 size_t size)
 {
 	u32 reg_val;
 	struct vpu_buf *common_vb;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index c8624c681fa6..861a0664047c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
@@ -518,6 +519,8 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	if (q_status.report_queue_count == 0 &&
 	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
 		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
+		pm_runtime_mark_last_busy(inst->dev->dev);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 }
@@ -1382,6 +1385,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
@@ -1425,13 +1429,15 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 			}
 		}
 	}
-
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 
 free_bitstream_vbuf:
 	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
 return_buffers:
 	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 }
 
@@ -1517,6 +1523,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	bool check_cmd = TRUE;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1540,6 +1547,9 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 		streamoff_output(q);
 	else
 		streamoff_capture(q);
+
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
@@ -1626,7 +1636,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
-
+	pm_runtime_resume_and_get(inst->dev->dev);
 	ret = fill_ringbuffer(inst);
 	if (ret) {
 		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
@@ -1709,6 +1719,8 @@ static void wave5_vpu_dec_device_run(void *priv)
 
 finish_job_and_return:
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a23908011a39..703fd8d1c7da 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
@@ -1310,6 +1311,7 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret = 0;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
 	if (inst->state == VPU_INST_STATE_NONE && q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -1364,9 +1366,13 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	if (ret)
 		goto return_buffers;
 
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return 0;
 return_buffers:
 	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 }
 
@@ -1408,6 +1414,7 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 	 */
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	if (wave5_vpu_both_queues_are_streaming(inst))
 		switch_state(inst, VPU_INST_STATE_STOP);
@@ -1432,6 +1439,9 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 		streamoff_output(inst, q);
 	else
 		streamoff_capture(inst, q);
+
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
@@ -1478,6 +1488,7 @@ static void wave5_vpu_enc_device_run(void *priv)
 	u32 fail_res = 0;
 	int ret = 0;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	switch (inst->state) {
 	case VPU_INST_STATE_PIC_RUN:
 		ret = start_encode(inst, &fail_res);
@@ -1491,6 +1502,8 @@ static void wave5_vpu_enc_device_run(void *priv)
 			break;
 		}
 		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+		pm_runtime_mark_last_busy(inst->dev->dev);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		return;
 	default:
 		WARN(1, "Execution of a job in state %s is invalid.\n",
@@ -1498,6 +1511,8 @@ static void wave5_vpu_enc_device_run(void *priv)
 		break;
 	}
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 68a519ac412d..325e311cdedc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include "wave5-vpu.h"
 #include "wave5-regdefine.h"
 #include "wave5-vpuconfig.h"
@@ -145,6 +146,38 @@ static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 	return 0;
 }
 
+static int wave5_pm_suspend(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	wave5_vpu_sleep_wake(dev, true, NULL, 0);
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static int wave5_pm_resume(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+	int ret = 0;
+
+	wave5_vpu_sleep_wake(dev, false, NULL, 0);
+	ret = clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+	if (ret) {
+		dev_err(dev, "Enabling clocks, fail: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct dev_pm_ops wave5_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
+};
+
 static int wave5_vpu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -268,6 +301,12 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
+
 	return 0;
 
 err_enc_unreg:
@@ -295,6 +334,9 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 		hrtimer_cancel(&dev->hrtimer);
 	}
 
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
@@ -320,6 +362,7 @@ static struct platform_driver wave5_vpu_driver = {
 	.driver = {
 		.name = VPU_PLATFORM_DEVICE_NAME,
 		.of_match_table = of_match_ptr(wave5_dt_ids),
+		.pm = &wave5_pm_ops,
 		},
 	.probe = wave5_vpu_probe,
 	.remove_new = wave5_vpu_remove,
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 1a3efb638dde..b0911fef232f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/bug.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
 #include "wave5-vpuapi.h"
 #include "wave5-regdefine.h"
 #include "wave5.h"
@@ -200,9 +202,13 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_sync(inst->dev->dev);
 		return ret;
+	}
 
 	do {
 		ret = wave5_vpu_dec_finish_seq(inst, fail_res);
@@ -234,7 +240,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
-
+	pm_runtime_put_sync(inst->dev->dev);
 	return ret;
 }
 
@@ -702,6 +708,8 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	if (!inst->codec_info)
 		return -EINVAL;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
 	if (ret)
 		return ret;
@@ -733,9 +741,9 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 
+	pm_runtime_put_sync(inst->dev->dev);
 	return 0;
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5.h b/drivers/media/platform/chips-media/wave5/wave5.h
index 063028eccd3b..6125eff938a8 100644
--- a/drivers/media/platform/chips-media/wave5/wave5.h
+++ b/drivers/media/platform/chips-media/wave5/wave5.h
@@ -56,6 +56,9 @@ int wave5_vpu_get_version(struct vpu_device *vpu_dev, u32 *revision);
 
 int wave5_vpu_init(struct device *dev, u8 *fw, size_t size);
 
+int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
+			 size_t size);
+
 int wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode);
 
 int wave5_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_open_param *param);
-- 
2.43.0


