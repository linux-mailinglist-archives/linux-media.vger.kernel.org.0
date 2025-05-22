Return-Path: <linux-media+bounces-33081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A1AC05AC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D9117AE57B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42889224B0C;
	Thu, 22 May 2025 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="GxEUDqX5"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022136.outbound.protection.outlook.com [40.107.43.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19374223DC3;
	Thu, 22 May 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898788; cv=fail; b=MCsNqZJlITRNZ5rY7hBm++l1heq1p+tfwMK61wufhBWAIJ7R6vhIpwj26M9m9bHr4tIkbzXhc6VJc0FTdz7tpCT/lpyZ7Gqfe5e+ZshlOoEE/dXaLeaSrFE+6n7Q5RjR3Mi5nCU72LjpB/Qqd0Khsau85PFrZM4zCOU5DBt+8CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898788; c=relaxed/simple;
	bh=AH5fObUc+zqLV+I2Jr6qGKTDpLnptyB51QwBL//qg3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q06RBA7p3dr9nNZHXMomspfDffkPhGX3Kk75Po8BcmVSxbYBD61KgIaDCmfPdDz0cG/JtukXX+nM70PPHATuokzDT+5zJi3PgRzQ0DqZAkNOllchhq9hBmWoELRmw6rXq4Gg7mVPArgn6+PzgZBIEWLyISlIyX7+IZEBoCEoplY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GxEUDqX5; arc=fail smtp.client-ip=40.107.43.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haHbVaiJnJN1aeupWdyfmW85b/d7leCaf7OCJSDYUrUOtA5Mw4SoGjJi+7ow/jUgs77jNNrUiMwx3JfvjFy9wur2JsVVIzbooXTOgKLPgx+iTjGvK7aMuWL4Nilv9i9LyRJJNfW60j6h8Yq8t/wIV+6ALMLvQHVnwBkleszdUxLhv5EWNru/dlLDuylvh2LVIBSDODwfmuHCqvEuo+3X87HGiPmZlLkek6yc5wtHR2ek8aI1NZ6QKE+TGRn7eEqDAU4yOfnmFniaafbFuaN9eMFRJglwIWYOepDvsUa3vvGRYsnC6FHnJ7UbLNVP0pZtObDfcuy4XpA2R4z9BgXdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggZ2ztAzqLB1oq/qfR/EnIqKJxoc/27dmch8qEAQFJA=;
 b=VcDgCO1UfJ57fFtVZxhkD5GXoxQzYGXOuHURYXHLkjVS8zDE80Yml551OSxh9FAYCfg1OXxU28hV+QWmELvgM0lMtZYXx4IjqLt3GmGKWrLFVX9VRDOtMmEn59w9DArujUYb7HtOURMbX/JfAkxZfBZ19SZcUbSYpDaSKTZUghC4Awep4Fe0Iiq3G3weLVs0Et186kiNBumzj0V1imEOl7guDNvl/EByaf9YfJKQzPbNJpteJXvaLZDQZiclcYPDMzbj3t/GDu1jGo2aXyGasIEIkwtgu/6vXLhU4zs5lNcHgNF+rEvI/F/Hv1vCRu9aybSDXMdfsLiFUs48tsRIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggZ2ztAzqLB1oq/qfR/EnIqKJxoc/27dmch8qEAQFJA=;
 b=GxEUDqX5aHPMmmZbZRP+dXIfu3LuV60x/j+3mK5jNzvxrC34jBoqjxb2ahiBvJS1z7tRKfCp6LgGb9ehr5gsSbBzy/J3Bb3agq8o5Y+A2kBJwgHSi6TPk93d8tCTnhIA8pYdZixjd57S3fhr6LdTolat/0sWCGHJOtgH5UddwFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:18 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:17 +0000
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
Subject: [PATCH v2 5/7] media: chips-media: wave5: Fix not to free resources normally when instance was destroyed
Date: Thu, 22 May 2025 16:26:04 +0900
Message-Id: <20250522072606.51-6-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PUYP216MB2872:EE_
X-MS-Office365-Filtering-Correlation-Id: 049203d9-b941-49de-c816-08dd9901f13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N+rRl7GadCBII0TKKjn5m1NfwSZQ2xFshAbSgZRVieWoorOOJ4gOIzK5nGej?=
 =?us-ascii?Q?gIoT1bWp3z26cDmRVLMYWIuMsP5URgyTQBxuY6O6JxcMOQayxCd30Gei51Ee?=
 =?us-ascii?Q?iEIHRNvRW5A2GwDGj5ZxHtnH2LwLIco0WVq2KQozteBXxeq29cT05QaJcdhJ?=
 =?us-ascii?Q?f+yTQhMHBCEywu8NEhaVEJKddg3oSCzO5A3KsyRirApxX3C0bJJY2jRssHga?=
 =?us-ascii?Q?mkNqlrVBk4fZBRjoBWn5ouhJw7RcavV9FxJBrCD7mLl2GgSw4DuABo0o2Hvo?=
 =?us-ascii?Q?r3ap9RKgCgyjTKtbeiEiltjJa+3eJYeayLxMMHS3BC9LPhkmq0zXA/fSTqh3?=
 =?us-ascii?Q?bYJNdZrQ3kmguqI7AQYyG3q215eiYLwLd3eI6jpGF9fTsUHalTu+0bltmkT+?=
 =?us-ascii?Q?PiqlweBw5yyDOBHCwVaX9hyDOAn66MiK73oxlFbBIivgXuUcSMQYrfxr7WAa?=
 =?us-ascii?Q?/7AALhFltmMEPX652RoNiOcMqyPiSwtRi3PImaUGWVmW7MTES2o3zONvtnVD?=
 =?us-ascii?Q?yVX9rYTusQQAB7W6vFkQN4UY59l4S1h1I+dtTguDF5mMPTwwYURNQMTy2T1V?=
 =?us-ascii?Q?f4Kq8BS5YACE0TT3LQxkraCARuhdCnmLSGx7jCfOstb6WewVy/8sZ9GJZ9m7?=
 =?us-ascii?Q?9S0psVbV/5yfItHEm3BbOKFsBL3dIIRhapOrPkFsqiMshWzij0jYb9ya3k1C?=
 =?us-ascii?Q?bFa91i3KHEwynM9yiWz0WYSHIILdBGHED18Z6RiOxcJn1DD1Mw8QHsZfrCqx?=
 =?us-ascii?Q?s5LwH0VeQOcODHp0Lh3FgP0WCT0J9/YsaHesGeblwtrIX9MCycRLrWu3CNVp?=
 =?us-ascii?Q?Cl6v7B0vgxMdZ3IEd6tmnzXfiHJ4ap6+6BAz6L51CVYkjsnu5qUcMGTvPhHe?=
 =?us-ascii?Q?Ey/P2GDyHQyqaVgloS8qJm7rLivFsH+5cZ33MatgGlcQPLFMj5XfVUVzm/qQ?=
 =?us-ascii?Q?NgoSA2h4F3CpUTAcCrjrr2h7wc4c4xX9DrsMw5YBkV9siz6DsQxf4lD4hywK?=
 =?us-ascii?Q?tgnfM4tD+VBrcRBzlpHukGck87dBApgqOK4LnT9z4V3VoNhunVVxJZaWFaMB?=
 =?us-ascii?Q?Txf+w7535O22W1TmD9eZDYKSQhQrpdNLUHu77/g25p6FwvfQSB7CyH9gmge7?=
 =?us-ascii?Q?fXLsnPzYdWglgg2P/aePuQnPL10CDVajBym6GPvzroXRok+F1+CVaT5Wsq1G?=
 =?us-ascii?Q?DtItSP0EY9JMnOxfUTSyu6ul75d4mIdajsxcbAt/ZoIsRPoCwgL9/46PGpgT?=
 =?us-ascii?Q?9nsTPCg949s6ZewL0XjAD4m8nR5HXf70V+RYv7O3714ylVXnXEw04/2R5wS/?=
 =?us-ascii?Q?FqoqttHRCLa40qathd8p0iBJgbzs3IyM7Ae4IJRyDyYLeu1VS+D05xxMrcuu?=
 =?us-ascii?Q?sosjSjGH3IAYXVaH28hY5PQnEVAM4nlq5kwVcmaWhr61kUspWn6Ivz2hrYTu?=
 =?us-ascii?Q?CVfHX1n6fCZNjAmYBknrqPNAAthb0YGhd7XYRh5Eds9qBsycX885KQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEbjqE2xEvndpnswS54X1eDxmZW6fY7BmbmDHZV+z+o5TBOVI+vh7boJMnS2?=
 =?us-ascii?Q?bdphQdlRq+jQqWCk5d7xCXkyLXBUR8dMPPnl92Ny1B7mtLriPeLh4zfJuHx6?=
 =?us-ascii?Q?dsfg/QQE4BNXrvrQru4q5e8tKseP+JtynFMLBTTK9dEKp97iDIuIWzUEQx3Y?=
 =?us-ascii?Q?SfHuhW1J+RcfFHYjmFsKZ9+qQz1k6Qe68My/iNytD7NgI9kAQoWSX8K2HG5B?=
 =?us-ascii?Q?SQ02WL8CipoAFpd9AJgOKs5GciB0pxsZO/0WCISThbATn2Tuqatw4iYT1j4S?=
 =?us-ascii?Q?KbcNZvR+uP4nOL7RNF7ntjPDiTQit7iV54bmxwvARII0MhUYC5CbCKgdeVJF?=
 =?us-ascii?Q?2GhQFx+EC9/6w321N9vTCUefd1vno8QCAAk7KCvkd2/23G11Tk8ca2POIX2V?=
 =?us-ascii?Q?zqwfMtNqAGK1Qwe0gsh1uKhKevLcWk5rJTudXNlrIom+HD4QhgArOyK085hp?=
 =?us-ascii?Q?bkCZlNxkFzhuAX4DqBci4f7EDXFRx/w/RnA/HD3ZDFRe3qcAy8V/f7S9vxV3?=
 =?us-ascii?Q?hIu7I7QyDrSSmU83mK0hwRef71gDFZ1JN0Ip0+khgjpL2FBhnuSOmSF/Prpv?=
 =?us-ascii?Q?C/b4PF8gcUoSyMO39p8gcBmGmdZW5YZfqevzjonQQTYCNu8Pviy/WzyCodEr?=
 =?us-ascii?Q?SiB4Vlzjvj5nplzGPmvchEmHaPfG5/ueN+OC6Dsq4EvnqfVk0JDxMTThL4XL?=
 =?us-ascii?Q?EMo7TkHwWDdgqM2Me1yqxuy2dK/+U/opbRWfkLBFkn3L1/meGtJaXyjeESrg?=
 =?us-ascii?Q?5O8uLOoQI+vyedCr0+qVojZwVxSQ1m398t59Sxbo+ufar3ZceUuxGAn2j43j?=
 =?us-ascii?Q?DLhcy6Ad06tc5BrhC4W6NlFp6yPkyMwjNhvzOYrNv/Q3t1bpBP0KjiWOrrSV?=
 =?us-ascii?Q?4q1vE09NkEF+9RSFXrTHvDi8+jgjomSSgSO4czjhSm/KD+2rUD/1UKLZSl7S?=
 =?us-ascii?Q?sNS7yt+7pzBt/MDRYocX19JfIx38TZflLaqYIbK+ye5JWsLOOX8T1RTRgJAI?=
 =?us-ascii?Q?XHRI72kUszl3QCKG0PQf6r0iANjtXcYVaIUwm2LGiU5xxRu8KNE+PpILrseR?=
 =?us-ascii?Q?3q5qGuORS2j4BK6Xiv0tGyxfLyi07rhvfgG2lvD9AoAq2ijl0id6nwKllyKf?=
 =?us-ascii?Q?X8wLV+LmvSERR8U83NhWHSjzlipzvb0rDIOP/h6Nhkt6JufYJxMx8rbx5yym?=
 =?us-ascii?Q?9jLWBE9rvs5uJkxSn/WuCOyZEnp0/j+mnCL0r3vnDbMs6rmLXsQzjrsXwVct?=
 =?us-ascii?Q?BREQdnzHm7cc72142PnAbXdyGjs5rprLCzZLncfsyA0Kh7YJVmcr17nRn5Oz?=
 =?us-ascii?Q?qu4Xdyw1bbsAnRb5GE6j4O3pcF8XOcnUWmAQEVQxQNMlPpSGVw0tK6MHOfmX?=
 =?us-ascii?Q?f8eZnAHANFwYxq4Lssxboea4XXuSrjrS9SlgcZv+kelQPJWbmnRvYKTbCqdy?=
 =?us-ascii?Q?QmKZ+rQ0xWemm71S3ZCTVOgDEo4nnoSw8ig7BAq1pGTv/5eAlnK/mI8S8/rV?=
 =?us-ascii?Q?fYSd6wJkoM8TFASqN2N9d8ppn9udLhc1xJyr9XieLzF60n+CuM253eK3takm?=
 =?us-ascii?Q?5Lxcrbrmd72xWyA+upsAogVvopUFhJAt9fKRBGTk0aVTgX+Zf0nHybAx80OK?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049203d9-b941-49de-c816-08dd9901f13a
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:17.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2oQjpoFwAVZfCM4vlkSPmBwhCSxj44P8suUuml3XE3+a68UW35HkMATdnrMi8ExQ+XO+xM7kRrhKD4hnR+K0qJ+4qrp3u9bj47Km+N8tsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying performance patch, there was a problem not to free
resources, the root cause was that timeout sometimes happened after
calling the wave5_vpu_dec_finish_seq() when application was closed
forcibly,so if failure reason is WAVE5_SYSERR_VPU_STILL_RUNNING,
the wave5_vpu_dec_get_output_info() should be called to flush videos
decoded before closed.

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


