Return-Path: <linux-media+bounces-38809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6DB19421
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 15:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD2787A929B
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 13:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FF1207A27;
	Sun,  3 Aug 2025 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="f/Ru5bc3"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012037.outbound.protection.outlook.com [40.107.75.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2545945;
	Sun,  3 Aug 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754229332; cv=fail; b=BL7QUbUAJeC8/0KAXTM9XXuRqgV9fn3FJ2yKeKPrE0kwGbxBR4i57PkOEaG3yJN1jhwnWDdkQzfh3ugxSK06IWtnAyOd+9jakmo4pCYXQQAhqMFDqi+namXKS4V7Y/tQULN7ybS8Vk4B/fRDp0BeYw0D8/2kmuYMxRKmu2ep//w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754229332; c=relaxed/simple;
	bh=Mm8EnN2TQj97eZ2lsbAPF4Tr+rq3zEUIiuhkzrAglHI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Q0rr1a6CmlUOn8Svz4KRFAAFpAuoQ7uJ+On5uwckxAl1YopghP2JMLx0MD6LCeh0nuvqTu73G92CCP49kPz+5P9MD1iOLyxVAClgkizU+KIHPIfYVigXs51mE7tas4xx5NR2crnbwrDBD1DX6ZP0lYzF4a7Mup2/Z8zaP6mZEMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=f/Ru5bc3; arc=fail smtp.client-ip=40.107.75.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMTZKIrn71TSm2tQ0a6OaLyM77cFhPD0G/GvSK4JqeaOolE+2XlM989l+U6FPEOzpc6WcMLoGxTx4anK4+UhWNh8UPx0gNfgnJLg99X1xVORo/Swb0C8MZCzgAAWru765o9WvxwyqenZS3pPu9JLKtuusbxNPyzTOlW96r8IPO5khfK9VWj+t52OXUJsaTjwPVs8bGNcxqY5nJsb8sFQSzdoaPtaLTFf3GB3FLvtb4/IYxyNSea9Lib766OFFG5HzFl1FNEZU11ENT6WuMOwrznrbmhYPSjXI2VXMU8sYEvhRc7tZSihAqy0D3SVRVm+eVS6VGF0oX+pA+66pfKXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/n7ZskUfIeFvbmIe/VLVh1DBQLcTTicScvLBLe4ikI=;
 b=PPe3xJ2Cyjq40Clgvrgs+oZbsphbTeIn9PNCWBMJB3M6fUJjXHkTkuuZcGt5bp0igbdTmDNL0NLM2F9y3e9zTHfKLusC5VNFmu9OMaUVO0WtaI24Ve82nz4oBt0wXvxg+3kyTIrK/buKjfHPbtIXAPr0DBD65mbjSofcSyYWwGpvdVQyZMWLPVaDPiSptge838sR9nh+EwdhPYx5/wtVnG/I9uYk8yHNZMiqAVUBX0KTWp/JoXBmHZpYNF7o4KXKypr/QnnOqr10DckPL3YF1LQvO69SjTlOtW5Qu28TikDoeH2hBehQA8yaA7kGQ9vyYBxXjM7TaA/5fYXDF8y4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/n7ZskUfIeFvbmIe/VLVh1DBQLcTTicScvLBLe4ikI=;
 b=f/Ru5bc3wSYNPww25Uj+pfO4gM9D0P7xnIOBJgzeaV2BJ0p5DNm4jGWRZaHXK74S5oWzP099p7wkZS/DLGb/5qtF9i0KmvqE24OXEShnBao3wvQ2k+tMCngUGS/RN/7FRPQk/pDNDzz8x2eRK7RkLxp6FKXWNyeXIXtDvZHEbPm2yDIUr6PGOy2i+7uN/4v5JDp719o5G4UewPsxX61SNE2KXIcKxFDAvDs0eIO4/Dd1GM9yFyn4RezQvaJtkB0Eevem2cqk/ytCcicK9Lh1RyaUAPn9JPRmNjn3gcu2gt0Ll5n+nHEmxhv1xPNAo8W+UWfFo+m3ilJwmhYrNmCgKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR0601MB5861.apcprd06.prod.outlook.com (2603:1096:820:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 13:55:26 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8989.017; Sun, 3 Aug 2025
 13:55:26 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
Date: Sun,  3 Aug 2025 21:55:06 +0800
Message-Id: <20250803135514.118892-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR0601MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: e700253b-9583-4840-9a08-08ddd29565e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k4btojquFFcJbqYQKw0Dj30oY8lYw3yeHLsKGoJKtU0WGC6bdRxkosp9D5J7?=
 =?us-ascii?Q?IdluzkkuLLc+Tmlcq1FfO/SrK42SA4zCSotXLA8KEhpwpGDyR4iPteiNZfZc?=
 =?us-ascii?Q?iie7PuaPF4EdmBKTbPCz6+XzJfbTMP6OKqJGk9dyiYzlal1m2GHy1Eoklne8?=
 =?us-ascii?Q?DUsU0LsYs23pqrJ/hrWivnXNhWUwTu2eO8vDlxzcz9h+y3sw++uS3FGXaDRK?=
 =?us-ascii?Q?0uVHxydfcpL+MMtWmNjkU+jHZpD+GjKyfcBMBcwpKLZEfDmY9lTadIHk85Qf?=
 =?us-ascii?Q?wMVZsSCW9YHk94GJdQFcbN5PYnGMLAwj49Mb1QGupvXWICcUc4x4vMqpEQ0l?=
 =?us-ascii?Q?Ogq7hdV9r/tmb9vbxFcOK2JMOieRS8BBqic8YOG1m9vH/vaEYWnwoC0vCjeo?=
 =?us-ascii?Q?Pi97EayW9SqviZoiNNE0SEgcmI0M6xTvyKSgJoMzmLeylU3izzPkgCdU1icO?=
 =?us-ascii?Q?6klRAwcNq6+JC76rbOSn8GiC2DNt0I1WQUIWKJzsWqFbvUVM+KCOvRNDGJnS?=
 =?us-ascii?Q?gEuovrmjzCgNHSn1vEa1QvtBjiI3PF7jRIR4m2eJVMjrOUSZa40h8a/4KT5l?=
 =?us-ascii?Q?PH3F5ZZXBxTj4cxM4y6wfT7Deg2w34wdAJLz/o6SpH2ovqDFsiBEOE8febfD?=
 =?us-ascii?Q?HiFbIvT0EGU4j8KtAZXd2hrUlJywnaznvkQsptqcQq59+IvfVozanOWUWzsN?=
 =?us-ascii?Q?N4hUn7S8COU5b2Q+LA7TH+OifAB/4pnim2pihp4N62mJ/FEzXFaqw8eidu70?=
 =?us-ascii?Q?I04nCs5JmuPOgvhN3Tu6nkrzk32h/EOVo0qSP03J7AZouzYhnWbj2aO2ueOq?=
 =?us-ascii?Q?cKBTzhLoUIsmYuQHn6rVnZw85aTJ+lBvGXYViFnsn/yjeh6yniFax8xHobCN?=
 =?us-ascii?Q?mrq/R1hKJp2VKwMtUqP4maZqyH2wkqYwniY9u6xPPjMcqdanRh9M2vaoKoqd?=
 =?us-ascii?Q?zkmiUtqhP0e6aOgedH3/SeVmdVxpURWZks0IVbGc9CxvTjkNXMuNK86TsblN?=
 =?us-ascii?Q?DZopenMzzI6grMg0fUKfPzrTaO0bqYuN7ZBIQD7+reIPnL1u6eR1+gsCNgjQ?=
 =?us-ascii?Q?YdeG5Usv0mvMVTxZxoXhPDtgLgRg4mHTLDzurQqfXE6pU0zkuJ/bC9a7Tdg+?=
 =?us-ascii?Q?RZFgmv/IuYas1epJJwB+FAE843t0BEA/ee2f7uRwVJy5N/yII80T7qD5exZV?=
 =?us-ascii?Q?XZA07PTKgVx+ivT73yjVgsP97kbs1Daslyw9A4gf7xmtyS/nKDT7LyEmNCFv?=
 =?us-ascii?Q?8H8hG5N/FBKlkV5jhUS2O+PEXgOQ/6X1uWuvOcCzlf/O3oSWyFaXgeN3WUAl?=
 =?us-ascii?Q?1jrpckjLl9HfnVmNxHleqaAFrz4Il+wFoxywGZe93YRG8iYByG1UxYtJQ5PO?=
 =?us-ascii?Q?YFSBBZ+i9f8jIrWyVfmhmPTgD9uJNIXJmaCFLjKTuVKGFc06ENhD2kmhNqqp?=
 =?us-ascii?Q?NzIFUCxd7yHsocb6jMs7Gb46UtcITN8GmBA42U7R5r/eEyUWS7QVYXIdjqWZ?=
 =?us-ascii?Q?KsA9WcTf3fgR7wzgiYGfHqkjojLeRs2Psp5o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gXBmtWRuETsRj0q8rBbYinhTsSC1nHulPXtjjXxNeyVvL58ef/meHMmmvb3E?=
 =?us-ascii?Q?OTw385YcV7DEWxpYCNqfXRwhbpsVK+RVC2Uo8zR7/aVwXNRorpnQ9pxNZm8J?=
 =?us-ascii?Q?ufBbrvPLKS5+xfcfvYDbupK4iwRqwMvlJlk54Xb+dud1NYQJx5kuCBXrCuR9?=
 =?us-ascii?Q?X01psuTSJZm2R8Wq2ElUcPFvQotED5GlbiMYta/0EEoFd1cojQC80N1kYueO?=
 =?us-ascii?Q?L4KEBwOTcHWj3Tr1f97c8npJYGS994PPAlz5s7wB6ApSemmYhrio8KHoIvGI?=
 =?us-ascii?Q?Sk57PwjtWvahiIUjHyqZpWhy9ebQJqw95ZPDYhq6wtV03Cv1mNcIpcqQ20N2?=
 =?us-ascii?Q?cXXq5mK/Sz7CP5Xi7rkGGD19fehTtjHyyaURVbtWi6XQzV3HWjmbb05NCmwx?=
 =?us-ascii?Q?O4wfcWgVa8t6EYSSM1FZH6uRK6fWefFdO3ZX1p9+lpv1vYSm/peYzr2Huh33?=
 =?us-ascii?Q?2wkIqHut12rGyI+34nyLDOPdMKMjdbHw9P+C6nz/ybk+vtFFYsv+jGF5fUbg?=
 =?us-ascii?Q?Rrgbby2sYmx8WotjhZJl76w3dAcI+DQXRiGdkl6biofvSK76Cpql22Dct6Nj?=
 =?us-ascii?Q?EwiwHAvDvOGUuTpllO6muRbt59MP1yatc65AbjXfXpuLZoYybPLStyfWgQ2n?=
 =?us-ascii?Q?+TT+ebOkNvoF8zx/YUkmo6gaD/rFfKSBP1QkVYSEHGysRaG0LJoOaNLt9mdQ?=
 =?us-ascii?Q?sjhqrB9DYaVcMmFnP8kHrTuR533D2ZSCZU/P0lehOOcZJ6Q+G9imb0+VWOSI?=
 =?us-ascii?Q?xLI+6viLWS9EXYN+pXaG+PPnVYE7z5EfmM5OCwLyD9Fjpz1tacK++jbuYJE2?=
 =?us-ascii?Q?j+R9J7bIF6omF7PRXDmpl9cLJX1l1gPyP25QFScPCH1G172ZIODt2xXf5O/c?=
 =?us-ascii?Q?3Z9o4b/ol6uI6aqqwb2w2cDEd/jTuQF0b3apyOKMWzSlZoAh2z/n2s+hV3WY?=
 =?us-ascii?Q?8JTFQkO6nyPP5T3z2rQ4owYQe64kh6Km+Z2tH1E7BqN2NC63MLpPX6sh6/AW?=
 =?us-ascii?Q?tv58X8bRWvAgL5dZdeTGAkLTFfIgJH2kwEwK8/QPpO2cold+RarAkPM/DZnH?=
 =?us-ascii?Q?yGVyGsfplTrEq2HCj1YYH8lcB4awcsiHVwKDZDj/0LKcLlYRgFfP2oPBrsh/?=
 =?us-ascii?Q?ea+LtyKHrJq7hkuWtMZ8xgM8M3ktoH/CXBN/+S3OpxqY/q8jmuejLK8eUj3Q?=
 =?us-ascii?Q?g+UJRPpEOh0hnJH4qHI8a8XJ52VlFqRcCSZM620jZPHTU9ZTXQLnddyL2FNE?=
 =?us-ascii?Q?ILuRctvyJ7hCJzA54s9S18160gzkGLfEJxwb4lBK5d3naYQ9juqmdOdC2WCP?=
 =?us-ascii?Q?LQKLflytGfID2EiX9iEMidM8XWr8Y8yvfmGwV4rt5qBibEjZPqna/OtNFEXv?=
 =?us-ascii?Q?UNx0OBupYIcAKZUy+l5c4iXlXx5pWdWfeSjYBZIfabmPGwv2CvttegBVns7f?=
 =?us-ascii?Q?XwgBNVj3e8891HJ2T1DlcKfm+28j59gkXhLJeixrbsV4InYCsG+Fat5qjhic?=
 =?us-ascii?Q?i7Ao7btHT32xbrRZT6SxAUnb/4MgSoIXgx9NVfZ0a3bZem0x6ZmNS0Nim45L?=
 =?us-ascii?Q?yNL6A5s+Fo8DN+57tX0p7+RzeDIly0sX6/m407rz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e700253b-9583-4840-9a08-08ddd29565e6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 13:55:26.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKes1wa+U0zEB9tJMUB9xATYQFKSMKJWsbZ05XoBn31uSXWdO1lYpfgYBciYgToTfSmyNP21t0sEDX5mqvO+2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5861

Based on testing and recommendations by David Lechner et al. [1][2],
using = { } to initialize a structure or array is the preferred way
to do this in the kernel.

This patch converts memset() to = { }, thereby:
- Eliminating the risk of sizeof() mismatches.
- Simplifying the code.

[1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
[2]: https://lore.kernel.org/lkml/20250614151844.50524610@jic23-huawei/

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c    |  3 +--
 .../mediatek/vcodec/decoder/vdec_vpu_if.c         | 12 ++++--------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c      |  6 ++----
 .../mediatek/vcodec/encoder/venc_vpu_if.c         | 15 +++++----------
 4 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
index eb3354192853..80554b2c26c0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
@@ -548,10 +548,9 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *inst)
 static struct vdec_vp9_inst *vp9_alloc_inst(struct mtk_vcodec_dec_ctx *ctx)
 {
 	int result;
-	struct mtk_vcodec_mem mem;
+	struct mtk_vcodec_mem mem = { };
 	struct vdec_vp9_inst *inst;
 
-	memset(&mem, 0, sizeof(mem));
 	mem.size = sizeof(struct vdec_vp9_inst);
 	result = mtk_vcodec_mem_alloc(ctx, &mem);
 	if (result)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 145958206e38..d5e943f81c15 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -181,12 +181,11 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 
 static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 {
-	struct vdec_ap_ipi_cmd msg;
+	struct vdec_ap_ipi_cmd msg = { };
 	int err = 0;
 
 	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg_id);
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = msg_id;
 	if (vpu->fw_abi_version < 2)
 		msg.vpu_inst_addr = vpu->inst_addr;
@@ -201,7 +200,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 
 int vpu_dec_init(struct vdec_vpu_inst *vpu)
 {
-	struct vdec_ap_ipi_init msg;
+	struct vdec_ap_ipi_init msg = { };
 	int err;
 
 	init_waitqueue_head(&vpu->wq);
@@ -225,7 +224,6 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 		}
 	}
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
@@ -245,7 +243,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 
 int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 {
-	struct vdec_ap_ipi_dec_start msg;
+	struct vdec_ap_ipi_dec_start msg = { };
 	int i;
 	int err = 0;
 
@@ -254,7 +252,6 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 		return -EINVAL;
 	}
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_START;
 	if (vpu->fw_abi_version < 2)
 		msg.vpu_inst_addr = vpu->inst_addr;
@@ -273,7 +270,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
 		      unsigned int len, unsigned int param_type)
 {
-	struct vdec_ap_ipi_get_param msg;
+	struct vdec_ap_ipi_get_param msg = { };
 	int err;
 
 	if (len > ARRAY_SIZE(msg.data)) {
@@ -281,7 +278,6 @@ int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
 		return -EINVAL;
 	}
 
-	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
 	msg.inst_id = vpu->inst_id;
 	memcpy(msg.data, data, sizeof(unsigned int) * len);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..bc6435a7543f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -1064,7 +1064,7 @@ static int mtk_venc_encode_header(void *priv)
 
 static int mtk_venc_param_change(struct mtk_vcodec_enc_ctx *ctx)
 {
-	struct venc_enc_param enc_prm;
+	struct venc_enc_param enc_prm = { };
 	struct vb2_v4l2_buffer *vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	struct mtk_video_enc_buf *mtk_buf;
 	int ret = 0;
@@ -1075,7 +1075,6 @@ static int mtk_venc_param_change(struct mtk_vcodec_enc_ctx *ctx)
 
 	mtk_buf = container_of(vb2_v4l2, struct mtk_video_enc_buf, m2m_buf.vb);
 
-	memset(&enc_prm, 0, sizeof(enc_prm));
 	if (mtk_buf->param_change == MTK_ENCODE_PARAM_NONE)
 		return 0;
 
@@ -1138,7 +1137,7 @@ static void mtk_venc_worker(struct work_struct *work)
 	struct mtk_vcodec_enc_ctx *ctx = container_of(work, struct mtk_vcodec_enc_ctx,
 				    encode_work);
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct venc_frm_buf frm_buf;
+	struct venc_frm_buf frm_buf = { };
 	struct mtk_vcodec_mem bs_buf;
 	struct venc_done_result enc_result;
 	int ret, i;
@@ -1168,7 +1167,6 @@ static void mtk_venc_worker(struct work_struct *work)
 		return;
 	}
 
-	memset(&frm_buf, 0, sizeof(frm_buf));
 	for (i = 0; i < src_buf->vb2_buf.num_planes ; i++) {
 		frm_buf.fb_addr[i].dma_addr =
 				vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, i);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 51bb7ee141b9..55627b71348d 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -132,7 +132,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 int vpu_enc_init(struct venc_vpu_inst *vpu)
 {
 	int status;
-	struct venc_ap_ipi_msg_init out;
+	struct venc_ap_ipi_msg_init out = { };
 
 	init_waitqueue_head(&vpu->wq_hd);
 	vpu->signaled = 0;
@@ -148,7 +148,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 		return -EINVAL;
 	}
 
-	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_INIT;
 	out.venc_inst = (unsigned long)vpu;
 	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
@@ -191,11 +190,10 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 	size_t msg_size = is_ext ?
 		sizeof(struct venc_ap_ipi_msg_set_param_ext) :
 		sizeof(struct venc_ap_ipi_msg_set_param);
-	struct venc_ap_ipi_msg_set_param_ext out;
+	struct venc_ap_ipi_msg_set_param_ext out = { };
 
 	mtk_venc_debug(vpu->ctx, "id %d ->", id);
 
-	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_SET_PARAM;
 	out.base.vpu_inst_addr = vpu->inst_addr;
 	out.base.param_id = id;
@@ -258,11 +256,10 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 	size_t msg_size = is_ext ?
 		sizeof(struct venc_ap_ipi_msg_enc_ext) :
 		sizeof(struct venc_ap_ipi_msg_enc);
-	struct venc_ap_ipi_msg_enc_ext out;
+	struct venc_ap_ipi_msg_enc_ext out = { };
 
 	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
 
-	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
 	out.base.vpu_inst_addr = vpu->inst_addr;
 	out.base.bs_mode = bs_mode;
@@ -302,12 +299,11 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 				 struct mtk_vcodec_mem *bs_buf,
 				 struct venc_frame_info *frame_info)
 {
-	struct venc_ap_ipi_msg_enc_ext_34 out;
+	struct venc_ap_ipi_msg_enc_ext_34 out = { };
 	size_t msg_size = sizeof(struct venc_ap_ipi_msg_enc_ext_34);
 
 	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
 
-	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_ENCODE;
 	out.vpu_inst_addr = vpu->inst_addr;
 	out.bs_mode = bs_mode;
@@ -367,9 +363,8 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 
 int vpu_enc_deinit(struct venc_vpu_inst *vpu)
 {
-	struct venc_ap_ipi_msg_deinit out;
+	struct venc_ap_ipi_msg_deinit out = { };
 
-	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_DEINIT;
 	out.vpu_inst_addr = vpu->inst_addr;
 	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
-- 
2.34.1


