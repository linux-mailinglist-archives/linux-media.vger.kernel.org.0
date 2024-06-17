Return-Path: <linux-media+bounces-13424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8E90AC43
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F63CB26AC5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98206195978;
	Mon, 17 Jun 2024 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WsAxxuM+"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022019.outbound.protection.outlook.com [52.101.154.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3581957FF;
	Mon, 17 Jun 2024 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621315; cv=fail; b=YP4041n/iq1/e+ZO+55fCj8k7xcjsuIDo5GdpuwffK/w2P8QgpNfa7TqV6nVu6e+e2x4YNDeS38JkBvPc7dnUzx8Dx7r739d+cBzAtR1cHZpgQTzYJBB8hJ6jcE7qFsh7r7e/r2AGEqVIP0FX5j/ei/E6+27JImc8ipJrfn6Fyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621315; c=relaxed/simple;
	bh=VMtPjfoOC0XTH+riNVMx8QR0jvlY6HzL+4rikDpX08E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WAK2STqi9hSR6liwcu9iR/qkCOaACiH2+DZCIzrI75lQO3UfhMXydi3izQImMZjfIRG4ntrGSUyLUzGinaeWdgh5w9pYEBqSOElBXXdCoGjKtZJJ5uzP+KB6wtFrz+eDMOwI13J5xM/PXYMiNyigWRg/j6oRA/2vdu+T0ycAMWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WsAxxuM+; arc=fail smtp.client-ip=52.101.154.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzNmREfQea/iX7gb1X/I04t4A8/piE7MH/O87eAE7Kja3saX6Gx5vHKTXF99gRw/nPK1q+qzKEVzUrBppji3SNZG3IHDjnhVqJs9iLLYm8eRM+6tEI/Whokvx2d3HGwlQMj9DXlsbuj2GkAlI8FwhgoLxMUjGUNAVGU58yUaKit71fH6CAFad+lnEwGigy4roI+07EL+eDF/Ahi33mIszYFzVSeWya3GVTehA4roE9kwlEyR+KWZJmHa8zkOA98Pg3VT7ySiGisg/rih0TSrU/oLiNozs60U1/yBpmp/LUQCU0R75BtpYog9tsHWYgW6rPFJ3KfA6ay+LuRVFob2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=eTrUSTOpKA2xrWod7/N7TW1NTdlWe+jWJC69nrR1zITnpyBUEzy2rRLToreclqkxphtYFIotcrfpj6xU50YArptwWjluWN6ejR5y6WM6fT5zOkVJWWeEIWbasSTFRfjIYj9/+RMXeE66PCMMDr/N2Uro/7qW8wvAGCBc1/g7/wPmPMtBt8BMDz1lZF0VmtQ0sdlyOoyPkEykmrKj/6CRM3Rzzu7CfVYGkZmyW0gIbOKpDyrSrL9z4b53nnV/ULi8PxubPNCT+Tt00oiuWmx4DvPAVSX1xNqm9Cp/aHRr+uD3gUHoiSDUZ21m1NEd2K2P8ycty6e12qes9tJ5mAgagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=WsAxxuM+9cHVdCeYpx062zoVGZiU1gMuJwzk9+rsfUI1V1sOU88n8+vboF6NZynIEh7K8YgPcAHcOEQMTnZNyUWz82zND8/3An36u+tIIFlaeCHk3Yjxw6B5XxNN3Cuc9u7vxeV9ko07NMdEKlEkWDUmLHumodYW5Ifq/Yey2jU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2773.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:48:27 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:48:27 +0000
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
Subject: [RESEND PATCH v6 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Mon, 17 Jun 2024 19:48:18 +0900
Message-Id: <20240617104818.221-5-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0f80778c-ef01-4f12-3c01-08dc8ebb04bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k3rxY8PAXVm/rF5igFlWHqQX9qrO8rm2EwhiLYU/oxnhe6i7l9WmhGsMEt5Y?=
 =?us-ascii?Q?vkSF+XXrkdlN1b6p4mMpNswpVVOOB+g5PRTZaOqeF+SDNC+ijycClkL6P5LH?=
 =?us-ascii?Q?5tuku3dXnAi6jRSlsmvtDuNbqbG9ntB/fgIDizEoJF762SN0ZQtmcxYtooVk?=
 =?us-ascii?Q?N5f4qTR4PJCeskpFwxMSllK0pZWNsAMf74pg7Cz950OG48Jhl0H58qRByFu+?=
 =?us-ascii?Q?KKqrFka1qUpsab2i7Z5BpDQyY77CUyfuVmwh41nw8gSdW2n8LrzS6k+XeWi1?=
 =?us-ascii?Q?TFdwyZ7IwRXWFpLXvcPPIzFQ3otyABSbWOTS0gwaEI7aG0+KeZ2bFwksCYZH?=
 =?us-ascii?Q?in5SRQcs1KTpAuHVQy4t3DyDCzACknT8Nh4yrrKTYGMOPb6955elimt3K5xh?=
 =?us-ascii?Q?rs0MXYDeyYvX1VGbI+vu/w7KbWwqooON6voo/wZLIaZ8/Dy88AyqBMAzSvD3?=
 =?us-ascii?Q?w9mNBmZhZ70TBnLBc7/rRG1SazhAliBStt3oZi4/7RR07p8nh7QDKGPBMgeM?=
 =?us-ascii?Q?Ec7LNFkEgmxviGq+PRNO0QMWLOvAq5S1OIcWlufJPgX7XP/N73Cs2iVL5/x8?=
 =?us-ascii?Q?P2W4hQ74iHVCAgauG4WT208VOPOx5l0tuBRnzKGN84UQEBbDvOnUPDjMdwkF?=
 =?us-ascii?Q?K2mlGPLG6fdVD4EurUudKC0KdDrZQ7HCa3OzcCkcoQoPAubJhJJqmscucjUv?=
 =?us-ascii?Q?nTzNVuOXJ91Ue3YVji4uxNgq9XvUojx4Y4YdoNPSIZgZSexPagvSE04fxDmY?=
 =?us-ascii?Q?GsckvKPdui6NN2ZPSjRueZiKGsAggUh8e8vP7+/nTWjVQ0WY3GJZqvJg9F8b?=
 =?us-ascii?Q?K8eWjt/dswLPsDJOYmmLWR1UKDpbH5cg2JZHt7ODe6k1LLFKvmM3IaCCyIwY?=
 =?us-ascii?Q?kBQkBOBPetvvzpxnX7uhOzYlbzTkftN2GFXUUwYniskhDg0wSQ6vPU3hCbSk?=
 =?us-ascii?Q?MxM6Mv9Y31wR4ERcdgkEjgG3d3UI/5jpHOOtG2rEJZDz90FkLb8h7lLs8y8h?=
 =?us-ascii?Q?8V6LGO8cfa+Rv0Be5VXyd/ONvLlHim5KOhpiNPBhsRiAIOCHcbheG6ESj/PQ?=
 =?us-ascii?Q?zU9FnwJD0NcMDE/RIJvkMP0JLR/g38nAjCEG+E6M8bZj8Jexn4FgaxCmlwdJ?=
 =?us-ascii?Q?B8vorU6qjdbcpC55I2tYa1YBnHEEy8+di9ndGxdfGdwgr+qRA8IkgqnvW3Gq?=
 =?us-ascii?Q?baOAMByIEiLX5387MEt07n2L8GgV7DhwWpPL8TzeBbdKxPoUgoKlRIfw94sF?=
 =?us-ascii?Q?sGTK1GQ7sTJpgUYdmhVCmsBkqs3OzflgBzpaWspOcDVJSRWIxIeGJLGWCZo+?=
 =?us-ascii?Q?MzZ4Tgo0iHvxTrVtem9lhrgzTl42mOOgVMHFfq2KVF10jlpmQQE5pIepwXi8?=
 =?us-ascii?Q?jcZFs6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NIYbUiUEynwLb1l/zuN20Wsnkca4PmHXWaFXu9fPvCGgttmqbmrrV3QROg2c?=
 =?us-ascii?Q?kvRX1dNK4dYBvRzkhpCUXGuahjsNLvct4LGFeCkWFcFRWzTXb/wiR44k0wym?=
 =?us-ascii?Q?+HsOF0WuINWAxP6kSEZ/rPfQ1Jn1AV7zC0AWURintbSqsO5la/7ursiPDD/m?=
 =?us-ascii?Q?NEcC065eCNOvHGoKxPUqb19qqXjSRdDq5IVJWAwzDmips6ZFgS8DVnEDbOR0?=
 =?us-ascii?Q?xG1uFyupLJF1yEIRolD0bLlGsJY8NnK4KiAIMOYNE3pk7sePrwWQfWDsi41D?=
 =?us-ascii?Q?wG7RAxT6MO2mB7gZjtROAeUH0UktVcLBEc6yT3vLcXL32/GiYqx15/8vTvNC?=
 =?us-ascii?Q?KeBsLPIYXUL48PLozYqZZFfVidqlvb0yYKGq+IjlplcryBJmKCpFgEZhanlz?=
 =?us-ascii?Q?CSKgb0GQdeQkOwCiowxL/HTMDU9EU1f7C+vym0gu/r9sxJLd9MrZCnszrKEw?=
 =?us-ascii?Q?PUIZl6CKZJL3G0+ozK4XyUFjIIT7Ew9RxNFUQQjKOouPs5g/hAuX3gnZlWke?=
 =?us-ascii?Q?ilcFajjYEHSAbnTZxmZu09JRY9QYfwb1GA30AHRjSJAf5JAG2GJz3MqKMy9J?=
 =?us-ascii?Q?u9N/gmBmjcLjxeqK7V+btGYAqKi7uNQwh6LdcERc5Vs+EAyz/J4SQqAcd8y7?=
 =?us-ascii?Q?bgOZhEW9Li4RSlEagsG8iOn1hqQ5vJ/br/q43+MpXe5NPyQEtLEnGE7B1Z7r?=
 =?us-ascii?Q?LOgGOXtAPqtuYQqAijVVWqhcYazauH26P0mdrQAMJZBYgK7Ls1Wbacr5snsI?=
 =?us-ascii?Q?i1CqbQkAsxMnln9iYK9ThOyRf2bOnM0/xXTfsgePTHsYn9ArfvVrj2EaLtUo?=
 =?us-ascii?Q?yFJ9uFwAmxoJUNRuXYHR4pYrG0/MviPAbNBqX9L1QXQdtTVsNe0r33kMCeJq?=
 =?us-ascii?Q?ybTO5xb4BzOTtI1glnAPzjes2sioKbLpir6VcuB+aXvYbwh/ILwzuUIH6GUI?=
 =?us-ascii?Q?fLTPn3R4+OoH9nhA5GwPW8DBdmR3gl+1f4iPzo7K3Z7ISQINJ4D+3ojTtCGg?=
 =?us-ascii?Q?VwRmfjApxvuaPeqpiVIeOuOZwKKieW9gKMSpcolZ3ykVfVIcALM/FPyHOR/Q?=
 =?us-ascii?Q?oWLfdWLTYK+Cqtdt2tzoMGtdiKTdahK49vH8+cV29l8iv4GfqYZ56Ww4wuj+?=
 =?us-ascii?Q?vQKLwhk1N+rPOcw1wADZTHEiRMMdAlUs83s6vuBaQA+QNTvHyvXVU/p8otpC?=
 =?us-ascii?Q?ZkKMNgr9w2fXDb+euGsxricFEFNU7sDu943I6bJz/VCLrEoJtB3h25ZTG+Uy?=
 =?us-ascii?Q?7CN/dEleaWKvgnG8EZIm8D0Io0XpN65L9DluZWoKxJgIsskZbEg71mKYdevg?=
 =?us-ascii?Q?VwDmaI9v6BGcCHmRJ1kA/zfyPteNGX9CufKR0F5DhPHVe1CpRn/JrPOkVzyR?=
 =?us-ascii?Q?/SnAE+N0MXepW9vk67o2CkyYTAIl4M/Jg+b4J3EUGxhXE+opf+fQ6rHjOyFt?=
 =?us-ascii?Q?nO1ExA9K1rG1ufZ+ss4hQXj3CxcwZ9VyEE8XOGywczhLza4h4zjVYgeZrs8S?=
 =?us-ascii?Q?t1xobqdVO4H/uzxbjDJsh/XucBqyB/DFXQJPRXhKIaZGkHY5VBUyb/lb28IL?=
 =?us-ascii?Q?JxpkJod0rzd4866u9rlEMcUbC/8c9iY8WoUbIFD1ZFVaU3P0uRW/+qVofzWZ?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f80778c-ef01-4f12-3c01-08dc8ebb04bb
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:48:26.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/g31LYcDMashpSc53/yW5C+6msCUbF3bPR6MVhJx6Jo/Q5+hNRcmcK2sugPX4Yt5Sh2M5njqJeQscAAPs0p2BEA4uzLu0mPlygL3CXJKew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2773

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
NV61M raw pixel-formats to the Wave5 encoder.

All these formats have a chroma subsampling ratio of 4:2:2 and
therefore require a new image size calculation as the driver
previously only handled a ratio of 4:2:0.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 89 +++++++++++++++----
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a470f24cbabe..fee24b427fd1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -66,6 +66,30 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
 	}
 };
 
@@ -109,13 +133,26 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 	struct vb2_v4l2_buffer *dst_buf;
 	struct frame_buffer frame_buf;
 	struct enc_param pic_param;
-	u32 stride = ALIGN(inst->dst_fmt.width, 32);
-	u32 luma_size = (stride * inst->dst_fmt.height);
-	u32 chroma_size = ((stride / 2) * (inst->dst_fmt.height / 2));
+	const struct v4l2_format_info *info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = 0;
+	u32 chroma_size = 0;
 
 	memset(&pic_param, 0, sizeof(struct enc_param));
 	memset(&frame_buf, 0, sizeof(struct frame_buffer));
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->mem_planes == 1) {
+		luma_size = stride * inst->dst_fmt.height;
+		chroma_size = luma_size / (info->hdiv * info->vdiv);
+	} else {
+		luma_size = inst->src_fmt.plane_fmt[0].sizeimage;
+		chroma_size = inst->src_fmt.plane_fmt[1].sizeimage;
+	}
+
 	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
 	if (!dst_buf) {
 		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__);
@@ -480,6 +517,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	const struct v4l2_format_info *info;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -501,16 +539,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		inst->src_fmt.plane_fmt[i].sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
 	}
 
-	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
-	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M) {
-		inst->cbcr_interleave = true;
-		inst->nv21 = false;
-	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
-		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
-		inst->cbcr_interleave = true;
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	inst->cbcr_interleave = (info->comp_planes == 2) ? true : false;
+
+	switch (inst->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV61M:
 		inst->nv21 = true;
-	} else {
-		inst->cbcr_interleave = false;
+		break;
+	default:
 		inst->nv21 = false;
 	}
 
@@ -1095,13 +1137,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
-static void wave5_set_enc_openparam(struct enc_open_param *open_param,
-				    struct vpu_instance *inst)
+static int wave5_set_enc_openparam(struct enc_open_param *open_param,
+				   struct vpu_instance *inst)
 {
 	struct enc_wave_param input = inst->enc_param;
+	const struct v4l2_format_info *info;
 	u32 num_ctu_row = ALIGN(inst->dst_fmt.height, 64) / 64;
 	u32 num_mb_row = ALIGN(inst->dst_fmt.height, 16) / 16;
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->hdiv == 2 && info->vdiv == 1)
+		open_param->src_format = FORMAT_422;
+	else
+		open_param->src_format = FORMAT_420;
+
 	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
 	open_param->wave_param.hvs_qp_scale = 2;
 	open_param->wave_param.hvs_max_delta_qp = 10;
@@ -1190,6 +1242,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
 	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
+
+	return 0;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1285,7 +1339,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 
 		memset(&open_param, 0, sizeof(struct enc_open_param));
 
-		wave5_set_enc_openparam(&open_param, inst);
+		ret = wave5_set_enc_openparam(&open_param, inst);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: wave5_set_enc_openparam, fail: %d\n",
+				__func__, ret);
+			goto return_buffers;
+		}
 
 		ret = wave5_vpu_enc_open(inst, &open_param);
 		if (ret) {
-- 
2.43.0


