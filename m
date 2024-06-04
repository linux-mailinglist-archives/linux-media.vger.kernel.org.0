Return-Path: <linux-media+bounces-12496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F848FA9C9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA0781C20D82
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EBB13FD6D;
	Tue,  4 Jun 2024 05:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ThzMeHuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A313E052;
	Tue,  4 Jun 2024 05:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477908; cv=fail; b=XDbFgw+/5pEyQCZKQocUCa4NAQsTPidRpl/q6qMsyOvnK8EBlLYeWCqnb1DjcUtp0mYyVDyAXzmYSY6Pe98FSdYZhjfUhoy5tvm9bV8F19+/sbv13ODfT61JVSZaUYZTahGZFpVN1GrIhICxNkN0WGzWuU1qIyDd0QFM+3Tdm6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477908; c=relaxed/simple;
	bh=cv0fou/XWV81AXyGQz0fk1wU/LNHDn7XpV3UNu8iWlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSZuDSZOxI4MczYYGqPqgHshjvEIRl+/f+254hs82CNgy6CQxocbtwAHAMJXsL3BuFxzvm0d5tJR/MvwFXTGDGjFzx+Ka27Y0pBrMUV0D1k0hakXAoqrrF2ppfZAN3FFq02PecjjH9A2iXRgBs3Jvr9pm8Bh4c/0zPdQIjbz+4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ThzMeHuZ; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7TsZMhaRKSUeMsBFzndR1YCcKppbHf31y3lq6blmQM9QT02IaK6HvN0skJub/GVT7XJ2oTh1mLjn7n2rfXxm4kJuzLCazSzDq+tnUOmh/0d1eotgXfy8PS6bsZ7X8prgyUCMaCw6NfWkVmpCoF2e666CR/iI3Sps3IrBElpduDF3c+0RwIZBBgjkOPmAZuEK3yaVnc6MJxAbOksZpnv+qzGCrdCAIAIh6rAmgVaPXu0MuS/QLoF9oe1mVc5wjnpSOkdSkftrZMlyimYXCiWP93MhEbUA+Mk8mi/H29MRsjUzNeaqM+aq+d6HKJUhPOmCggAwjdSH3pwYEebYCvLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHIeEa0zLSmQQFnKk7KsbDjHEmwlqEJ2wWNK4xLlky0=;
 b=PuHbIWwsENGX1kFLf/TF6tYLhCeGz97xpFfYZUSrbVMWgpsM+bm++9M4ue+ReaRsCSTz3rtDCBRiuw6tPYOktNHayJipb9M7V8J8DLrRHynApcrQNaR32RcFtRkpER5gESEwSphXswonBIsch2iJF0gyjRzTOU7r8IsxHZA4tgRx6UntDD1llrslBM6CD3e11SujNexP8dg8CHZezj4DWC+PGWGBScMDSMVQL8gJdYHElQRsp4eTy/1giEiaKlnHD3qoHYN7DwmOlhlblV9dybLaesoy+Zr+AwbngCxVcvAae43v7BkuvOO49jRVGDaGJaEn4m2Oa3vDqw0lZ+9MHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHIeEa0zLSmQQFnKk7KsbDjHEmwlqEJ2wWNK4xLlky0=;
 b=ThzMeHuZZvvpbc5djke4Dd8Ttn+j+iF8K3MkwreFCddVl0An1jcIbLalD9DjV4q8RTCcCbFU7sRswb4wSPN7SkSByEI0LmY43nxIVq0EQ9Q7q0fZ6U0zBr23sME/kHylJdnXRegfm1Xr4+VXNMvZO7QJXOd1BnHpkfwOR7s6uus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1537.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.27; Tue, 4 Jun 2024 05:11:43 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:11:43 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v3 3/3] media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition
Date: Tue,  4 Jun 2024 14:11:20 +0900
Message-Id: <20240604051120.9441-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
References: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0068.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::11) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1537:EE_
X-MS-Office365-Filtering-Correlation-Id: 8081110e-3bad-4b19-07b2-08dc8454d2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y9Sh8bj+S+wNoSOsz0TU8cYG89uXzDFH0qM7BACzwRovCFR0p4cifmOQuJ+C?=
 =?us-ascii?Q?Q5jiGa1zusrHXbtQ9R+E+1rD+GGQkVt6OojhIpqnDXl+nE6eR4jJWRpFV2BA?=
 =?us-ascii?Q?hkc5yAOcNj68sHnoxRCzLxjddlQi4PrYOf6e5FoLcCukpAHs2KUFhvuxWoZm?=
 =?us-ascii?Q?5VzGtPAt56Qug0XoekvVbP02DYIrd4rpu+AdIS/H0Wsn7alADcOBfyDqiLwn?=
 =?us-ascii?Q?3YN8gAtKf663F9kaRWn9vw8/Z7mJqr7WIod9BqCNqKBqoeha1ySMBIBGlPCl?=
 =?us-ascii?Q?Frij1XjiNJy7shnJgdzqSZ5f5E8WnaZtWZfFheCJCcAtKs2g/K8ieD/JauFa?=
 =?us-ascii?Q?WmOn7CQh/vDuOyYOnGi+AsMZXiMYV8sNdQWoOdWjs6exTRhygFuHEo33s3TK?=
 =?us-ascii?Q?j5EivBeIHXEmgP0bBa1WL0NNvcoNbV4OpaDUBpWIQGJVILPiVzS1Bt3bSpIu?=
 =?us-ascii?Q?h9eRI8CiQwB+ZMe46rksx4rRoDUZchHJYbsCALJNid+dJJU4UGoBy31uVqsV?=
 =?us-ascii?Q?Q3i7efip08kkW96qkrdKd+DqKVzrON/wnKQhLArGKpJlsg7qD05FYutunIE6?=
 =?us-ascii?Q?ogEn6iO0VFOCHkSFLmk+WWu6DbcP0y2+2G+eeJN+cPhfsxwy53h5uhKQvfn/?=
 =?us-ascii?Q?su1aRWWgxcgT6J200edyE2QTmU+ceZcFRBMCB6EyQYVjV25eOsJfoHu21u8z?=
 =?us-ascii?Q?QJbRGMmiX0h5i/XtDVNU8COR071H8/ZmkOS76UkYL2qQFJ24SrG597sWzFiD?=
 =?us-ascii?Q?eWaZtGD6iNQvfgEzIR7OQWrtFkbqRV71Pe5fmMdV2MM1BHFc0AfS54ZuUyPN?=
 =?us-ascii?Q?p/goRsO/nfV901cG81A6E7BjKvp2B4RK95m4Xgb14JaB9IF9g1gK0yotChOQ?=
 =?us-ascii?Q?S07+qNzoBbqRzTPYxgBkHen/GBLWUpYWSfp20wN8EzogrcZ7A6vSSaV3t/4g?=
 =?us-ascii?Q?qhk9IsXEDnycONn63FrkU+MbWBxbIVKB5jUtKPulk1+E4U6Za0JoRzT+TGn1?=
 =?us-ascii?Q?JGEjsjGTJTvuF4yRBvksOYAdJq9mvMjUZPQRJfmHsaRgHX9uPUcuApuOiZ3w?=
 =?us-ascii?Q?gonn8imFPxRL73bwZpMl7CqICY3zDKya9fmWpq8+nuY/XRSnSP6PYlvi3SHI?=
 =?us-ascii?Q?Kt3aQf0tY0N+wmnz8GboLpoxQBlGmwWmfVVh76hJcYZWxSgMY5KZirG3JwkQ?=
 =?us-ascii?Q?jioB4Kp8wbuG0FPDtLwEzHZvuFIeD1KvkL46EV2DYCu7jKVwJyT8ysix1ShS?=
 =?us-ascii?Q?K2FppKCjkdl/UYGmH3qi0gcfaXe6e9P+HkOEoxoTruu2LAHGKdqhDF3LZH26?=
 =?us-ascii?Q?1RbUTKZqq4REAF5HhpMkZQ7biJJ8+tVScxs2enp0qhKCLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBydkJ0bjAJI3YpFkYJFQS2K8bmoXP7WV93M4v8CpmTxeERTK622CWCuWHx4?=
 =?us-ascii?Q?DjkB2+2vH5UmbhjY8j1QnHGGv7dQrKjA6hd0zAyq93+cNa268pqru8OJoygr?=
 =?us-ascii?Q?5UtDrrFsUPIRb2vkG0zGClkzmS4kAznAsxbjjeeWqKG+jwj9YUukZzFdWDl9?=
 =?us-ascii?Q?uuo69bWoaiSiCg8gXQO5gRdAHNHvJDmKT0SneprG7uAgaDgEhSBbPm7exEx0?=
 =?us-ascii?Q?dnRp7YuHgZvinDmUayWeAMyYAqBaowO+Q2ar1pbJy20SkyBKRxsC8cQmNvRS?=
 =?us-ascii?Q?LvYpT1DWctplu7yFIOt1DUluBrq2q5UTD7gNslCJllr542X/VYwkeBLlTVHR?=
 =?us-ascii?Q?tmtiHFIV8SXLHrwc1WkFUK2KQVW01EQ3Wwf0s7UM4NV6Z1rLnLfoDtP3huRx?=
 =?us-ascii?Q?K/VRGo0KB5VsWHb7xKh2IbD/abFM/xDp03DCuDiEoETXOKiDKAwLkIdduPe5?=
 =?us-ascii?Q?QbCqpO0YbiwSyV30ybdIkqWQZaufUxXaKzVh0Yej1S3H6nG9nOn2xIF4CG2N?=
 =?us-ascii?Q?tZ18jMcq55uc/hY136ZnCPRfXcL6CmhROTzVjpHEaEswpXldBwoCyFJc1zD0?=
 =?us-ascii?Q?96wpimBQjbTlXvwGl+vKK4J7sxGiUo5B8SgaZEhJg6DAFXeVXBc707gCuew3?=
 =?us-ascii?Q?wXNa7esxgetmTrSMXCbQzM4QVNIiXcSfHlbdVRZEYUvVlRpwDEKLtiMO+Jv3?=
 =?us-ascii?Q?iVLdrfW7KFRonmYxNrqrwl/QnLV5LuiMoWlTNvfTVW7SYEirlqEs366k1Otw?=
 =?us-ascii?Q?NTmNkI9q6jHizebj87ZdYDkYTsTxNTKOEJ9hYSLRC5lc8HQDt4NGaU+cIK9f?=
 =?us-ascii?Q?v6N4LhPurxGWlsf0Urf3go7uBjNJ5W9qyMjLElKhUnvMVVsu18u+LYV142yn?=
 =?us-ascii?Q?l1x7C4W2Vn+oPg5JbJoDReJM2yu8pQSMUN5M970GY/ILu8FbNFJ/+yDm9ZXo?=
 =?us-ascii?Q?XrgNxzHOZGdvXGUsf/I7UIIU//nyGtaFMTAY/BY1Te+vKDJ8zilXVPRRGy0b?=
 =?us-ascii?Q?Gxe6H2bt/bZD16PpC9z0ncX90lxSuJbYhDqHc8v/ec9pM2aHazDa3ibkblUA?=
 =?us-ascii?Q?JFxkjWhT8gk+RoVSzENRwxlATAF1L3FZpNCCWIdposaNflkhq5GD+fITmboa?=
 =?us-ascii?Q?4J2qpHo/jvRfTMkb2LF/It2x7mL4ztqRMDOLEWcDSYrNvic1bpyxDQK4/DT5?=
 =?us-ascii?Q?mld7ym9Z64esKuXh1LukeS248KCL8knUttZ93rw1BFIjUTzCcd/+ZP5AC2tZ?=
 =?us-ascii?Q?n3MjsCrcFPBCWoDRbI+3KfMS8MdbuWTG2xNeqPAokuJkOzI+4BRjucndRJDf?=
 =?us-ascii?Q?KIbFyS2P4Eped2AUwFYpFETx7RWBRR6iy3YRuvpN1zVW3RekcqqT2EKXWZ3s?=
 =?us-ascii?Q?KwomvTHzAA8CqVVBcyoyV11W2Uj+3G2Kapb5t+TOukZgt9iqvkcGrbx5Oa1t?=
 =?us-ascii?Q?kI+B8DLNyvYMSiTqocxnbfEwG8VPZ4KcJgvpodOHPuSK+V/d6BbAsuZvIuij?=
 =?us-ascii?Q?0ZyTsyhkK9RMBghar2vqoVcs9BwuJyyozQkokz8kkleGypkjqzZaTvtJ0Ej2?=
 =?us-ascii?Q?+sLpmhtpoOWxt5FghBmuufdocAv7anzKTb6h49mhpvAxovj0k3+evuckU6Z8?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8081110e-3bad-4b19-07b2-08dc8454d2e4
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 05:11:43.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60RQYxpmB8ddwGp4oH6WoayX0+b0/h8nEUo+x/c80/zjawoTS7+mcuMn9Z5Mml+bywUy8BuziITFf4EfeHvvRckXbelsj11S7riY25loIbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1537

V4L2_TYPE_IS_OUTPUT() returns true for V4L2_BUF_TYPE_VIDEO_OVERLAY
which definitely belongs to CAPTURE.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 include/uapi/linux/videodev2.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 51da63173a98..9e2bccaea462 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -171,7 +171,6 @@ enum v4l2_buf_type {
 #define V4L2_TYPE_IS_OUTPUT(type)				\
 	((type) == V4L2_BUF_TYPE_VIDEO_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE		\
-	 || (type) == V4L2_BUF_TYPE_VIDEO_OVERLAY		\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY	\
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
-- 
2.25.1


