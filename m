Return-Path: <linux-media+bounces-40035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E719B2926E
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 11:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1731898D93
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 09:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BF9224896;
	Sun, 17 Aug 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="GFpxC4zU"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013027.outbound.protection.outlook.com [40.107.44.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DCE1A841E;
	Sun, 17 Aug 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755422996; cv=fail; b=ImWac0i3ahiubXIcocW5lzWKw38TC2i4VWLEyb9vWvsZFgOCRfpeXk1XlSQ4va8Ui0RVPmtEUSj6u7uCBfCxQ0k1hSio5eQt3YRgEyufhmKgiQsWg1b8NxH6gSyvPlkXl69TuHxqFTMWR/76weVN6T6S0VK16eLK6IaAgs1tMv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755422996; c=relaxed/simple;
	bh=32osoICVIV6a0WUVtcKTXFijWatWl2Bp/TMmZLeEYGY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FHOoVXvQRClitsSxMo1Va7XcmuwQLajmlA4th0jRhhKSzbqz0SpBdSFNuqbeGVzJuM8NQizFMgSxWKlnbZXFUTiyHOh3PU51GOmaFWqijrWrdBcwK+oZlgewZ1XfXurNsMDb1AlJOOkyNmQoWvgclJxuCYsmZKAk56vY3ZIu+hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=GFpxC4zU; arc=fail smtp.client-ip=40.107.44.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7m9pLSwjxibccQiiUuvvXcYsZjrICyfrdQxyhgawRIw5Ib3DRnZL9UepWwQ/ZDNNvpuO1j6GP10NzvqPttb5+XbXtM5OfQLa9GOxVqNmXTj4nuDEbK3JV6yjNNH5Fai/EZ9/GSuo5wC8cUeAO8tHyCAPcXKvaGelFLS38peAl+xYR2CaOmQHKheiUMA/ED2t+yC3R/55TidOAR7Jor16IL2vX24kWacrpRPRgFznJ0trMtobpULkXYG87TqR/bRbsWSbRXqU30jxmK5viS9fVdwlJdBcQ+8DvHKWaskhcXX7FzgBLQjqNpWny/myxEO2UcB8xO4WM/5BGyj+gw6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yul5VYtD5+ihW/a3O8jB8NcouS7DtX4szKeGXqGwsn8=;
 b=Ttsv5a3zQjBzAmEFbTOEjG+anBffbo1hr0Jxhl9t4p3IWAZnuiML+OklnyHtBoydoGPJUfckR/hbFmj70P67Txiiz+UrPCJwZNWxxB0QHvsjxV8FmY5Crkof04+Kz13DtuWwhURs5BkF4VZSCvjAG0XYFolKZFMCfQUQtEftajC+a4DZ+4GcnUr3uKlavjBssqcl9kORg4WhVhyFozOEi9eVBmCczvvOV0ci4S/cpc0KOZeDW/FXjMbnlGjM0UD6uULwPmMJbOMa6kh/uJTw9UDpxBC8NKFHSvPGitLZYU/LG1AlcWxwEM78LrSvpuS5IgPtEgq5TRuUxcjsiCUrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yul5VYtD5+ihW/a3O8jB8NcouS7DtX4szKeGXqGwsn8=;
 b=GFpxC4zUYMWbObjajx58+3Ltx6ebixrvjjQGU62QPFN/SoxJSPoCzZadRIuPcSYtIy7GZ5yy18+I4Kk1TBY2lffxILJRMwcSSjA8gYtXyHJTudjYp7r42EYi3l34Fea64CnPBWyu1GhA5SecKgNJ3HoM5qAyNW0L6aZPMwfgyiJYf9DmNONrtNZss9UaQAz++DbBrhSTmlAfa/dsWcjJCzcauxiYG2joDC4aomkRGgHatqbcOZtly0jGEaMj0GoGaLe0v1WAJRZ9sj+N+lLoBaqf8e0KB2qdflW/IhzzDVUVzp8hmex6sIRfb7f7TLaGDZUoHp+MgrJLZIFMLqwezA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KUXPR06MB8097.apcprd06.prod.outlook.com (2603:1096:d10:52::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.21; Sun, 17 Aug 2025 09:29:51 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 09:29:51 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: use kmalloc_array() for array space allocation
Date: Sun, 17 Aug 2025 17:29:39 +0800
Message-Id: <20250817092942.95053-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KUXPR06MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f084fe-4a69-4278-84c7-08dddd709dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rzFDACburCWGK/+gFfE7KIlVdKIU18YlLXaV1CK/8W3t99Z5inP8kCtbJr4l?=
 =?us-ascii?Q?yzk1lrl9G+P2UpYOltmjpUr5BB/nVWlmRu8GVHxSB+0UeDMR5z8mhOC7X1Vw?=
 =?us-ascii?Q?QcOJ1JxJfTvNICSnlyeaXVloajljcPGASw62MlQOBhtS3dxGDdouxlKWo6ig?=
 =?us-ascii?Q?pQaRZ9DkcjpkKMXLY9bf7fYQrI9nIrLSzNx0LomeJQ7e+L/sAc5Ci3k1dfWE?=
 =?us-ascii?Q?Rqzet1lHkfV1LfhOBF2lKZpKC5GlhmR7ygbegzXvAPWYP+rX9wjAlzU3jPI/?=
 =?us-ascii?Q?zVF9gHR94kGCLxwcPixf/AKszO1L4yLIKCaYaDsxHYK0YzOF/qQFh6H6N/6j?=
 =?us-ascii?Q?+AJ7EYYXu2sLFc3LWATvbO5E/4AJS6aZqu3/rfMvUXwkpJ10P6zzzg7p91wP?=
 =?us-ascii?Q?ZxHfMoPenlT7PENlGlNPnRg3B9a4b0trx5Quy6KRE3WvcM7G0qEv2exPffNr?=
 =?us-ascii?Q?qflfsej6Ptzi/EXFsESDVuErQghsLt+SlKHrMG+RX2BXWtNNMzEeczIakLp/?=
 =?us-ascii?Q?tOFJkdJpLLwbkcDWqVJBiSVyMp6x0U8F+ulbhQcUsNk+kJdfYKPQx8F+3taj?=
 =?us-ascii?Q?0+wWhBHOB8OtT3foPBgjwzyvLg1RIkocypPERVGD95qZZDAH5ZkU0dK0Papo?=
 =?us-ascii?Q?EuXHSqRBXyGyfK/gXBHoJX4r/qhfAe7iWbVGOqx0MZSz0zJZdcWnQBOMkpvp?=
 =?us-ascii?Q?8j8Wo8AkO9277c+E65v//RUip90H4l7nChGS3r6Q0N6H5YnDm3sVHosN6FQf?=
 =?us-ascii?Q?92Iyq4pu0W369Ni9mMFlaomgBAxMYLNdbEW0D0XlLkG/wwhpJhow0alnBQ3r?=
 =?us-ascii?Q?uVLhIz/ijha8MRkUF3t+JvmcpI6pKb1LbCoZt8sWj6YD/IRY68fRNzVexUMZ?=
 =?us-ascii?Q?lGXDKPAFs44kA579xVNzr3A9tqwEPAmSR0l8H8BRrSbZhdOrP/FXBCSDrs+r?=
 =?us-ascii?Q?bjgFvXgdEjPlkX/9guTN3+MKz8ECb8dFWbUritgKwgsKstUIfHigN05/Uows?=
 =?us-ascii?Q?WrrcBAQVilQkISy2beyIhWyYRO7cAe84wxtnRHz2hxXNfK42rICHb3XJmpjK?=
 =?us-ascii?Q?v1/gx9lAARLMC9wDxOdiohqwAYVom8NspZY3BE0bLaytwxlVoi4YlqjyNpcY?=
 =?us-ascii?Q?a1S6thXyphTSmwoXxQ1ozR3jpSr81n9Yleq2pmBIHY4xZgq5LZVaq9PIKNV5?=
 =?us-ascii?Q?wFfe/IUrRiKwT45NLFiX5DQi0rhz9dNYbQsBBa2yYTJjCGGqdsr5u5K77n4N?=
 =?us-ascii?Q?sSFczai66jECPIm7/+UCr95ynHi0QkVdlwayqPmTCIlbXRivX9b2kEsk0ILh?=
 =?us-ascii?Q?vA8UpJc1/Wfw81nUzM/vSWpx+QBmttp41CL5EZwI6KSUIp7lc8W2zKoGtXyT?=
 =?us-ascii?Q?3uAAJW4BbkbHeek66vWTjxVGKdx/iW8iw5zNHLp62GU/xuRUmKA5q0jy1VxU?=
 =?us-ascii?Q?KScPckx2eQRMp8EfnZG3hKUrJj9w2wBCoWWJMFhrKxdOHiEIRDhms875f3vo?=
 =?us-ascii?Q?d7Jk95+ozqXNzHU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VM/iCODIow1N7O7oFKf5Qxw2d7KyCWtTObV5Sjo6pnEgs4GBH92aYVAUzV11?=
 =?us-ascii?Q?aXC+rRiBRNOeVmygQaCcyi0h4kWL82uvv/4zt4Ir7xFZuJc9J/celpTBAIxL?=
 =?us-ascii?Q?HUJzjpV8SZx1vGJgIUXU1wE0hw2PXHHlnICU4TH5FMuN5wGb8cHImD+zXEE7?=
 =?us-ascii?Q?mIUo4ePo5pBSnEv273Jhtx+4gYj9Rba6eZKVnHlv8UxB0c2xZLnwFWULVYwS?=
 =?us-ascii?Q?VnkM+qaFFZUtAaJRqfWiTxq5PpE/fLLQsgG2DGNiQquRdQEZOm37MTeG4C+Y?=
 =?us-ascii?Q?CKKqS0guGyTptQqUlsNT4SKbenk4HzQdD2y98zZTw76msYBDHdfTZ6D1lnt2?=
 =?us-ascii?Q?T92k0L4pSf1bPVOU0yBSdJgWt3w0FVL1BSAMAPUG+fFEJnuiYK+lwWZmKudI?=
 =?us-ascii?Q?Pcdm3fwGFs+uipUu79K5Tt61WKK+JpYPWRNG47OcnbPlEFnEKORBvX+gjytR?=
 =?us-ascii?Q?jcsfVha8734AvCTctCCmWEx2448KrJBnW0vsugljc4Y+Eh2wTlvDRAx8Z6Ue?=
 =?us-ascii?Q?mmCV/1jM6RtRry2B0ndDtan7RlMdSFfhgNYWsQ3ULF0ocIx+OYgySaAQTVZI?=
 =?us-ascii?Q?nSWA6bb9jq9iTfLl27/+dQXNkFpZny0k9/CmODI2pfLBoA4G13m2DjjNJCG3?=
 =?us-ascii?Q?Y8d36i1c87zlGmf0qJ5OjqUcmysdjN5wNp4UjBNxFVkKbnCk4DJetEgK8MfO?=
 =?us-ascii?Q?x27bY511K5Qqcfx8asSad2euQ7DyZpWyjcmij5wrVVbkYa0SZ5juVZV0PaL3?=
 =?us-ascii?Q?bxUs3CRk/6bfEV/g/Kv62kpR/bfViRPyczpYCshLZeQa7L4ajPXRjXj995ag?=
 =?us-ascii?Q?TE3UjxyVI7z/9Cc7c35icq4X+pjwErd3aKwiVf84sqc30H0pJOubaQIthwIY?=
 =?us-ascii?Q?H/YyWmzqHDWHumn0k2bw8Ihj+wMvGPaNSlMWFFXLad+nnmN/MtD2pd0+1MBq?=
 =?us-ascii?Q?4DycjBT2DbQGFfryQPygNN3NMPdpliX6mtR6kYTfn1H28DvtviGkjIvdnW7M?=
 =?us-ascii?Q?675fboTjfGiai83t0+3v1yUtSLcXQb8z2jnLyaB9JO58qHcdQ3nKZehcyOeV?=
 =?us-ascii?Q?BjFaDVQBd2iuWNw02ovqcQ2AbDAcLGSAwC/QmK6F5bRqv55JFL/TEskOOkZr?=
 =?us-ascii?Q?vp0ed8b5VcmpIXC7wAHpBxJKlReH4Hi3zGn3JSmgh5QyfKLhzD1Kpbj97NiH?=
 =?us-ascii?Q?i5IE6v7Y++n7vyrMgequAaSJGHyKOYWttZvWo8+umG6D7tY701pSsfps/d3f?=
 =?us-ascii?Q?Tjmpil6scymrJD+rsAKQS23XCO0QaIByGKExNHO8BTG+Z4Lm0Du+gF2bfwQK?=
 =?us-ascii?Q?aT2rRXv/rhfLJTaeuAnkeQyS6gcHhhde0AjwBkH4UGwFDLDkgkeN/440LzZW?=
 =?us-ascii?Q?69lBtY23GbReAoC/9Y9EYLEoLmbecbU/tTJHj/Qmqu8cX9A1a8AIH8SEri2D?=
 =?us-ascii?Q?arSgCfgoGB4+TU/E8v5kMZDhe0dY7AfcR8GzTb5WZ+V2BfQczbRPFekgFfSW?=
 =?us-ascii?Q?6vYzwYbm+5pvzb90xTVFuYEYkjV4zYuO0j6+EKhOdS075HQWwvQ393p2FqBD?=
 =?us-ascii?Q?qd4HtFlU2Wvs+Oz0RG0aYO4+9sfZzr4VaMcoLh/k?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f084fe-4a69-4278-84c7-08dddd709dcf
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 09:29:51.1697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2EQv0xOF/Jm1INrQbp+IMugfnwTG3W7cym6qBDHWbb+KskNrQ/ByEW2Hu0K0t6NGeYtS/RX5c5ZMMQl7PM+TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8097

Replace kmalloc(count * sizeof) with kmalloc_array() for safer memory
allocation and overflow prevention.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 52 +++++++++++-----------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..f7ce2872ced7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5821,36 +5821,37 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_array(descr->num_stage,
+				       sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage,
+						 sizeof(struct ia_css_frame_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage,
+					sizeof(struct ia_css_frame_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage,
+				       sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage,
+					       sizeof(bool),
+					       GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5977,29 +5978,30 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage,
+						 sizeof(struct ia_css_frame_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage,
+					sizeof(struct ia_css_frame_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage,
+				       sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage,
+					       sizeof(bool),
+					       GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
-- 
2.34.1


