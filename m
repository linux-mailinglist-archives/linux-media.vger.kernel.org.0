Return-Path: <linux-media+bounces-58895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN9FEhPl4GlhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:33:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE640EDE1
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6673D31917EA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45493BD226;
	Thu, 16 Apr 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="dLvpiWyF"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022075.outbound.protection.outlook.com [52.101.126.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C5937C924;
	Thu, 16 Apr 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345907; cv=fail; b=g9tVsUmBe1UxETemeluNTqtjsCm4UO6hdj/oUaNhadOedcG2h4pLxnK9Q9EItEiwlqb8kDTP028opmVEgRhDXe2LKk76Y7IHTDlx8z+BNF1mNc1vvztS/Y62J/kWKsMqkxTB66fvjSm3KXNQAu1VWtRukmmy//J8cEh7HAWHuJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345907; c=relaxed/simple;
	bh=XrKx/tBYQ4eYvvYkq63KNBM2NEEGnEq3hCKT1KgwXCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KLwcCC2d+ct65qiTrg6uHE/bLZ+fWUMPLt65XM9CkaZ06MmEL6n0lwnPupW7WXezRXgXtJsDE901B3oYpEUFNm5tyWZyfH++Ml3+EoKIrHheXleVMRu/9DT/AYT0fYcQpEwEqQgkdtVjWxZeR4PV8kIewfXRv9JeHmPPGEi7/pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=dLvpiWyF; arc=fail smtp.client-ip=52.101.126.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubAxjWrqS14FQjZ46v33z+x/exqkwaaf1rDpl26tAhOH5akse+AQuG1kHP+6zIITtmHaHGo6198vfiVM48RRBG+SBS+CU1MWdmDHaLubjpcdV+M4ivzU3zzh/v8J6cefS0h+66CCo5jMWgvUr+zg2RFE5YHmTdXEP3xdpQyR5NieAZBKf27Bo5xGWoP1bKj+IvGA+SDf/FBXF7IgDv3oXSrArOdbwNCNwIUqwBVJbH4iZ7vH2StXyG0/Zp1hnAVobAdK9DwO2OGiAH2FJ+IvwPR8VPxCorEWzen7qK8zdiK8YTBWG91Qbv2y0ZOEjG1JZ3LgC2tmGQ91alONuv6Ymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb+ybnVMWHSgleIwVQ3/TzrQ43Xb0vCaNUu4zJHWvnc=;
 b=tvWTidA3z4w/1AuqS/yVLQqtTEYRCI2wo0ABB7CSm6fnmqVF1YQr4vg4+a5BnMfWkwXJqQ/DI8HUGeIy9V24AH391uJTtRyxgIpfk3JcIRwr/IpV2MyphKn6M9WGP9/pkASFC8res5v9f87P6OR1OX11SrK6bfFkjGE7SJ/5v6ukIrXeuIpwXOAv1jDjt+Tri0xkXD5pV5XqUpHuDxxyzdNBkroy4cR80pznvBLcB4vmgyKut88vj+x4pZXaguI7R+chFofEWJnUD247jXsUK2H/cBO/SVEt4ULWpgMaAhW4nGFhOaXMNrb5u+naEhicheqwcpjuSPDobT2dhEpHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb+ybnVMWHSgleIwVQ3/TzrQ43Xb0vCaNUu4zJHWvnc=;
 b=dLvpiWyF/SuUJwSjqOq4/G+SQq4VfNHRa5RkZckT+o89FagAO6157klfDvBzdvtlPOVLSXUEdb4MFDiUFbecOYgmt+fqV8VhOhC9lqA/djQCf9K5hZD+OtZi8c82CrLZITGSw60lus+FRgsDEkitPqAThlCQ8uyF34Wsa/bhIBVC1d91vqNj+Y9qQrHoaWl5CsoFV3QnNwZTRbmuWeNEsfUZj/ZrpF0wy24ZzYvJIllxoV41+8D55LPy1gwc2Ny2iYWnLOegl0O1TUXKqUEowDEbOo9cBCGgDKS2vTGY6OrTvtrGvDPB+El7kWpaK7KB4YWLljCn/JR6CjygFC4akA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by OSNPR01MB7554.apcprd01.prod.exchangelabs.com
 (2603:1096:604:31f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 13:24:58 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 13:24:58 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH v2] staging: media: atomisp: fix map and vmap leaks in stat buffer allocation
Date: Thu, 16 Apr 2026 21:24:50 +0800
Message-ID: <20260416132450.2546774-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260416072731.2489513-1-hhhuang@smu.edu.sg>
References: <20260416072731.2489513-1-hhhuang@smu.edu.sg>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|OSNPR01MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: cec91fc0-f08f-4bc0-5ef8-08de9bbb8e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|786006|52116014|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	s+P+5rcRLUF95Fstlnm3CTNU9QdXduoBfjjF3tfuwhcJ1+KN0e9kXsjE0QBGNj2iUYTBdtRWmUdS+0zGndG3gp0gm7z5M0oV+yNbAdApzoYjBCbO6SFuNNsFYaBls/4WF0E8rE/E9rmHjEZAjUn3MU6leMIlPj0L2qMuzJj6Y9b/exYwTz0SwL5HwpR7RqEmoeDH/yk84ClBUJSqMA75S8BRcnn6sakcj8aJ2jZIp2b+1nLDbhMIJ1E54ZSBgDNc0OFis2J+BWCP6y+/HHtKMy7029XsAtW0bBpZ6MHN5pOx2nqTfjLWxQrj8Jtxsymk+5qxaEZwaXAU0k7/xYgSV/ON1fAg8wc4+z9rvFAXLlPq6Oe7SfOix1Kc+U9Eu6QJ6Yk5H2lAbCKGECEAQyaaFFuAC6Pcb5XyA7qPlbZptqYnxx2y29OCo/7/chyeZaaQNT+o2EGB7Tk+8CGUKAAkc4e1L0NZRZAm1eP/+1kG2A6PrVTzRBy+dm1Q18GPUZaNKbfbHCZfm7jcvJnYJ+Vckt0wKT+Fg/jEr1ybRI2Znf7IfnZyqpHq+bUbCIRAhoB49/XlD6AkLNdxMfTSiYey6ZzP7ejOuGh6SiQRnPY+SMAUNocTRU0oWflsQGxxgs/wMH0mOP/DgQi0gVDQzw5UzlmSwER4W30Z4I7uunkge9yCuN1tbfa3PP0Uxs2L03G2z/ZnZiBnwVXzoqZ/3VRZdWwPL35Uidil30GydS7/C4r+q8/iNjNNRK+5f8TMbCxbTlBefT4rgIXMmb3wBSNgCQzd9GxBRuOMtI68UT+jvT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(786006)(52116014)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EFOz4iy36Auq0EkK6CuoDHF2EYh+kNZKBJK+GFfEGLvlIg/RKHXQEipHBiu6?=
 =?us-ascii?Q?1jS4cAVFjGdsxQaytff8PnrrSR3TQdQCFXg/ktF4SP3h5S/iqQlFVJ0IBCiV?=
 =?us-ascii?Q?TWhxbiIUfhj+W2ooXpvNexlCJ8TqhR7JHT2W82VdmTaYwgDTbAlUukMBJOn0?=
 =?us-ascii?Q?qobwi27v2Sn++l6hApv6Gi7+jR4AgZ6v2DkfmyrFJNqGAfuyd7TA4xMpU4cB?=
 =?us-ascii?Q?/GKa7qhCQiYFd5/S/mhwVTCrJ5mA5wDz8oecn6z/vzyCXWFDqJfRzQPKtQkW?=
 =?us-ascii?Q?rLjodjxSEJHGnDHfFgkkcivrIm1jMbvLw3Ziami8rBBlUbt9m5UZD8zX0Njl?=
 =?us-ascii?Q?4vCIZ0hQn6/HL7/Vv8nUCpnwB24bBr19nBdlMN4iMgu3ha4i1DaM6o6AP5Pq?=
 =?us-ascii?Q?9A5oEZg+QvmzqYZjUZ55BEnX8lmfY30OcSpgvDOfn5n7KDpQQKvY/wh4rFk9?=
 =?us-ascii?Q?EN8rRd1FM5RrP7CR5Ju2LcHOiDpLWIx3QdlKERQKEzmZ/qaL+2qHDl+7t4oX?=
 =?us-ascii?Q?yd0g2ZwBQUF3zyygXjTd3a0ZEJ6tTTDZ9UNeOkXswLypzEjiGNouTkGKhBss?=
 =?us-ascii?Q?7MwciTfB3Cqu8/wkTcAsx+ZK66zKZUPZ50IgdDn2PotjrRTnQlz5Ju0IgZJ7?=
 =?us-ascii?Q?JOIcganftdYM790mZLAozpEfUZAPzyUqveUUTjVqqluaEI+16vefBU4mxmlk?=
 =?us-ascii?Q?/XzP+8lBCSmhZ//qA0KnyEVljyD7Hi4dmIXlJ3cLPxaXg/ETEIpyalJfaZjN?=
 =?us-ascii?Q?/xpmw4yAjvnVdZA6FDfG9LK7WVXpMMPV2qIb8EdWgzIIh33m5oZGbnxuwN1p?=
 =?us-ascii?Q?EsI3BZisKiBshGjIG/S0TdkseNXhbl5ycv4BK0e5dGySRUb78dynzd1/gpih?=
 =?us-ascii?Q?1+VpT2aLww0QF42vmgQGl7AcvQWw/Zbyz3hFPlbc0Q+Rbs7zGE5eR92OT+zI?=
 =?us-ascii?Q?/DUbU4TSRK24dmKCUryfIwbKmoxFeYMdp/UrloCuhenGLVPMdAx5BVaDSaDu?=
 =?us-ascii?Q?PTZCqEMfw9Jo7bymoeBFRnneVH0ZMLCHtP2dN9mVvwUuhHWB+6HheEFdXxhf?=
 =?us-ascii?Q?rGRQoxHcY+5WsyuXWFueDxNiZJKDd7KcL4DsWT9D3zkHzU2iMd0AohtWozF+?=
 =?us-ascii?Q?/4PdrpAQ4i6PhT9yy6LSea2VSt1J/qkfQJVQPPNRHfgfkL0CkCxwiPz5/oh8?=
 =?us-ascii?Q?6QTYRy2Nk0x7HwRxKJJWbYpSdbRjiQP3U2nhFF/S7Djj3W2Etz1FSlonrWU6?=
 =?us-ascii?Q?4F1G0Iqd2/Qny4XlSeQ9bVzrk4mQONvEN2v0x2IQHwtPHm+l+0dK3X5prhVP?=
 =?us-ascii?Q?tP7txlZ78PO5l8+kc7lXfPZOwTP+J6JPmSEk/dcEW4K26UcMlik4S8HR1IUs?=
 =?us-ascii?Q?up6dBItBJedD5sNcYpdhGkONTWtaC71mhSFZPD3VPO2GF3imnrsfhDQF9HsX?=
 =?us-ascii?Q?c5t3cof93BXRQ90v/3eXVCnyeS/MCU/w8EzDvYdLvImXPTzJdcIP0ovbbJpB?=
 =?us-ascii?Q?mTonvFUCuBBQ1Vk0QwlHvnEQNiUpsTAtXPdXULjkeUok8Ey7shb9YErstJpC?=
 =?us-ascii?Q?Uy6Sg9xl5REcdlZVX/OErNPmFbzbOhoXqz3nlPx92oRmZy7ZPOMK01vUjR8B?=
 =?us-ascii?Q?txWSpWGbG0veoITkQCjn86PrFqLfMULHUpCyQUHTxHMfyPwWS3/KjuUAelb8?=
 =?us-ascii?Q?VufoBu1cPghGJvvIYE99xvvMRTt5Q0wOHTOWoF9ouBFZNpHtqSERgAFoWWQR?=
 =?us-ascii?Q?WinzS2QH9A=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: cec91fc0-f08f-4bc0-5ef8-08de9bbb8e1f
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 13:24:57.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjvYJBtiSM6ibvxCoVmwRMbQHfIv4nRRvgdOSRNyooCBMor6UgkjD/wx/wZfs3hOGQCO6+9XBdU5qcUZz2lDWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7554
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[smu.edu.sg,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smu.edu.sg:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58895-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smu.edu.sg:email,smu.edu.sg:dkim,smu.edu.sg:mid]
X-Rspamd-Queue-Id: 98FE640EDE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are memory leaks in
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.

In atomisp_css_allocate_stat_buffers(), s3a_map is allocated by
ia_css_isp_3a_statistics_map_allocate() and its backing memory is
mapped via hmm_vmap(). When dis_buf allocation fails, the error path
frees s3a_data but does not unmap or free s3a_map. Similarly, when
md_buf allocation fails, neither s3a_map nor dvs_map (and their hmm
vmaps) are freed.

Add the missing hmm_vunmap() and map free calls on both error paths,
matching the cleanup order used in atomisp_css_free_3a_buffer() and
atomisp_css_free_dis_buffer().

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
v2: Reword commit message per review feedback. Remove unnecessary
    NULL assignments on error paths.
---
 .../media/atomisp/pci/atomisp_compat_css20.c      | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..27e6f6563f14 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1116,8 +1116,11 @@ int atomisp_css_allocate_stat_buffers(struct atomisp_sub_device   *asd,
 					dvs_grid_info);
 		if (!dis_buf->dis_data) {
 			dev_err(isp->dev, "dvs buf allocation failed.\n");
-			if (s3a_buf)
+			if (s3a_buf) {
+				hmm_vunmap(s3a_buf->s3a_data->data_ptr);
+				ia_css_isp_3a_statistics_map_free(s3a_buf->s3a_map);
 				ia_css_isp_3a_statistics_free(s3a_buf->s3a_data);
+			}
 			return -EINVAL;
 		}
 
@@ -1131,10 +1134,16 @@ int atomisp_css_allocate_stat_buffers(struct atomisp_sub_device   *asd,
 		md_buf->metadata = ia_css_metadata_allocate(
 				       &asd->stream_env[stream_id].stream_info.metadata_info);
 		if (!md_buf->metadata) {
-			if (s3a_buf)
+			if (s3a_buf) {
+				hmm_vunmap(s3a_buf->s3a_data->data_ptr);
+				ia_css_isp_3a_statistics_map_free(s3a_buf->s3a_map);
 				ia_css_isp_3a_statistics_free(s3a_buf->s3a_data);
-			if (dis_buf)
+			}
+			if (dis_buf) {
+				hmm_vunmap(dis_buf->dis_data->data_ptr);
+				ia_css_isp_dvs_statistics_map_free(dis_buf->dvs_map);
 				ia_css_isp_dvs2_statistics_free(dis_buf->dis_data);
+			}
 			dev_err(isp->dev, "metadata buf allocation failed.\n");
 			return -EINVAL;
 		}
-- 
2.50.1


