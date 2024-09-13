Return-Path: <linux-media+bounces-18241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA799778BD
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 08:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 035D21C24460
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 06:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C3A1B29D8;
	Fri, 13 Sep 2024 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UGdzsxvf"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF112187349;
	Fri, 13 Sep 2024 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208540; cv=fail; b=P5wCF1+1vcymTGBCQcf8sSE9bPwy2iwNc0xhbEyg+SDhsincFxMoPp7sd1ko0WeZ8ezxi3rDwGJghJkgvx74+YA3AfIneIXq0efxCjG/ay86mCYrOlsgE4kdqoecZCKhSOw/Zmze8/sfQ7j2RTeEig84D4JOUVZAwhzDyRQ1i2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208540; c=relaxed/simple;
	bh=amtB4shzzjBXWfViicqteOo8bIk7eH/MbcEDIQOW9H4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A3YZnqYdQF2x3EgANUBdbfbzmFGx1OWeMKauwr1UwMQUgvpdNfAGcPkJ2ricoawM/PcrvzrGuBU/RHpW2wmgOwDOiAU7CXPyufFyJP5lWwnN8Xq1Xd20mDqIJo+o2/T5QZien5XqmXsddKS7wh945WNdbTtU5FsLqDdwCC0+q7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UGdzsxvf; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ+632omV7V6xgDc+2e0y625QXiZ/iLyGA/I94FPbI0hNAurAkClXatqmQMsHDzKybO6Uzv/LXKqWtPU9U5UOGYOvcU0uFi4UdhfABNCZO28PSgGnBCbr0zHhtmL+LSKy+DnfX9CC1/o8VCq35G6+5+z6ULnfqwvuatE4somAG2j2yKkY3NB3tf3Kwq/wjioN4JZQZh7/LA2F1iEfERZMfhkSObXGZ3FTVEqXmVrPCYwuoQ2plADu3CsPW35HiyjH8yyn5ysgxc8BudKesfNS4dxwD6uUikq2mRGpi64QJgcic2psiqsOr8CTBV+kjOi+D2NjhfV0lHJGIOM+DTXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaDjsabCvnodJmJQyUp2umCDwxUjAdtjjzmJ2268ln8=;
 b=Ikl+hb+Rz3Bmw544NfVPslZ2hnK4Y/2xTslK2dn8+9F9W8Uh8I7wKaljNAf8U0tv1/EZV4Z4jnezKHJhXrHIJG+vXSOKho1tW1YmWBk4vqxnZORPk2tJeJLovTJJTmwaGfmJGfye4yS2s9+GbcHiCBhBLtoXB+c5nmu3PFLlkrlEQC/fJacHf4J4Vlm3VvIcZI0dBRwDMFBP+ZvuKHycW6xbXCxr7JfgfRIDjAappZoHX7cbopx+o7BpZ+Fj9R+nPER29K11mjGxKYsHPHySL3NDaZFrbo0ggp3vMdOLrYhOvVGb3teznooNYBxZXJIRsPB7t00uXniNI7ZaSmg/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaDjsabCvnodJmJQyUp2umCDwxUjAdtjjzmJ2268ln8=;
 b=UGdzsxvfK5Cj+6Qc9bknY/OIisgKwKmTPNsGKAn2UTdX7sxFaeXXXzeS/GTALlIm6BYKhNSWdDmKMT8gB5nkza4w7OX8LK7jlTLQWhH/L4kjaeLtA87P4gK/38J7cuwpYfMPK+jgRSqdAKyc3irAExeNf2jLR4hOrQZsxsRreo+E0l8B7HpaMZoeFdvVznmn+HhhN9/Q/NVZaO6sMnhGz1L3XQOpqp9VsVt7fiECYqMXmSPcDZoLVe7ye1tpclYcajOye+B32eHYm/UCJoADXncUrW5fgILAZcnZVhLhNNN+BiEQ+LaT+5GEWW4HZm95VzIVQmPlea/3ZHMLUR8g2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10856.eurprd04.prod.outlook.com (2603:10a6:800:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 06:22:15 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%5]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 06:22:15 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] media: imx-jpeg: Set video drvdata before register video device
Date: Fri, 13 Sep 2024 15:21:44 +0900
Message-ID: <20240913062145.1885502-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10856:EE_
X-MS-Office365-Filtering-Correlation-Id: f27dd283-a130-4066-20b5-08dcd3bc6948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?28b2MI6KafdIz7l9GA7STdw+hVSgIqS/QbC2hhFjsK4gQjSpwDvsvob1fNZ1?=
 =?us-ascii?Q?h9CCFySLoMyjQZ3BICoQfMz0sV8fWVFlECT6w57Z2nuRq5hAXbrGJqN4mSOy?=
 =?us-ascii?Q?hNSIO4lRc3KdWgPFcb/HmLEgle+e4Qsz58J9j1y+mh3V+bDdyJRCSQHum9B8?=
 =?us-ascii?Q?jsnLO+WSjvkepVSZWzlLVs9P/RvN33APeIHDqwkQqPiJS6WmDNa0zcvBIrFl?=
 =?us-ascii?Q?IO9vR2nxSsWMAv4xJ4uIBJfQCKJiPLAbYyt8MYbBw+guYFJ8tlpWkMYEROf7?=
 =?us-ascii?Q?o8k20vdN+Dmjhrdc6eCsVJty4gorIKf3/u8IqarcY9e7Rt6a1LplTUNyS2bV?=
 =?us-ascii?Q?xfGeH/ZOdRFMoKGjuQcm+6DRqdGr+1FzuOkBnhsFadN4PsZB4SwopjncVjnW?=
 =?us-ascii?Q?0NIcLGyM4Gnzet1VksIEidptll460ixzq8NH04+HXMlTSzH0ZuX+Kz9wlJbp?=
 =?us-ascii?Q?ZvGkDocF+1tSJp/StM0WJ0J/weOeqvFK/zavjVIGLnfKrnp/vj3dov6S/rZz?=
 =?us-ascii?Q?2uIWlpGE8I4lS7Kbal/qqJb+w9ggl4fy2DSLG4pCPl7E8bA+w2qB2zFMoH1v?=
 =?us-ascii?Q?VoAxMM3hM0TE1P6t2SeuXAOivUZxxxfOrS8CCcHelHGmn9WOLtAz5xdbyUiH?=
 =?us-ascii?Q?b3+y/HZyei+oTwLtjzSorm1tp/EFDTAsloMcY7IHPC+mQsP9EJ7htg5BujmZ?=
 =?us-ascii?Q?VRAPZ4g87uUkFkpApxFIo4TuUmqHF6fDGn502pDPRgNMGHxpHnDwLtk2Ah7G?=
 =?us-ascii?Q?Grp8UOOPQ9Pqw8yzC0TSNHBch8atBDgIUXHKc1GaImkE++eZc4nUKvzVNFZF?=
 =?us-ascii?Q?4WXWcyNlEaID8yO+KI/jTOLAoospxw+6SyHhG8SkiTSglb4BzoCQEqUNHsPY?=
 =?us-ascii?Q?e2oU8aBK+y74NWa3UHMZE9c0+4TEc2gDX7gJmI6+WNxHjliJ7w8vEq+cMkzU?=
 =?us-ascii?Q?SO61EL0PUEM77dQk2SFxuzw0H/PJEHgwjqU4Ynl46+Vcg9iFb/X8Qp6+O6xe?=
 =?us-ascii?Q?LlAONy5NaW8ZE46QVQ2XqCmwEFYDs/EfrpeGiwNjUCly60MTDIbpb90d+HjX?=
 =?us-ascii?Q?JjHJN2NJ2NsG3VKvZIs7PNz4n57IfEkesF9UbtMiMnwU6K1jGY8gtZ40AQgJ?=
 =?us-ascii?Q?kxlqBpxU46n6MDK/jTQ/TGrPdBW4GSjaOJ35gDi1IwCYhCg9y8E0qypUlXNY?=
 =?us-ascii?Q?rfcZy/2iisVLHeKGkKNlF7Lie7WjjszJqtQdYQdZfGhFKaGjLHQ18Hp4y0cx?=
 =?us-ascii?Q?1MrLcCJuoVtCofufaLVYDs+XZ8fXFdrnWQEvNkKyfsPjL8gIps3BK2ovQCON?=
 =?us-ascii?Q?WNeX7Xfyt2VOMVWLDOAqwdtTIZz/GRSgtg8au0LFLe4o+I+NEct3VxDLKDIz?=
 =?us-ascii?Q?csrmB0UYGwVH/J1ptqdqfMbL0IyN2e810l8wycVY/Px4XmLRBA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ht3KH73GGW0a61WH9x6gigV2RpeXigVM/WblOehUqUu47rqaMJczmtZ1VuoV?=
 =?us-ascii?Q?QFiuuABm+0R3G+3tcvFkArUHMo7KbatbFZEfU0LIXkzZrPghyloq6kKZnCvN?=
 =?us-ascii?Q?X2PA6MpZKZfzfLpGXGYFa2y/KrCUj7TfD+T0jU+PdQenNBY3wKJ1h7TsK5tE?=
 =?us-ascii?Q?fetbqJuoaKLDTDKxJTOsmJOfX0sngYBYuJr+CDOQK8ib+XH1hlUy4kALiZ7y?=
 =?us-ascii?Q?reb6Mvl0YJ6/TvrR+48WTT0ZMZcjSTdyCYzgk0t5gu73WYA2cRIAFImIYho9?=
 =?us-ascii?Q?m0PavuhVgVsWYCzgbrYvtmAsNDNgIY2ti2VsJCrwTBZqTq3MOsd+gJXNNCH0?=
 =?us-ascii?Q?naAVUwJ6HOqIgcMQmSUPdygvSCNVeT0WWUBFWGJ2kLpBZLPFMQxkazJqqUJ/?=
 =?us-ascii?Q?aGOgE0hJzri2LWvwG2tyW6hH1ZNzploHSx4iRALxkX146ivXJr+gnF1munTa?=
 =?us-ascii?Q?o4+biHV7V29XXYCYuWYYDNdbRY0IUoSPEJQFvt20/a7Bxc9S6nks5sHq/AhW?=
 =?us-ascii?Q?kZrNBNp1NO6qeFhluZBlhD9tT9SfnMnzxENL43XqW9yaEIvND+9o2kZ86/rr?=
 =?us-ascii?Q?nunFVIXIKfYOeEoQjsvUYuehrKcgWukD/TGW9FNn5BY5UfyaLj2kf3zY7KvH?=
 =?us-ascii?Q?5tHd8Ckt1u7dmFkowsByfyfQGFigdpMumYEt/SzxdSAzgAHitRSp+wIsgytR?=
 =?us-ascii?Q?xoGNmIT6ZsGqlgeBEvNH6wgqA0MaPazeuC0Tk8ZFab0TN5ZmFNpZzMgf7DVG?=
 =?us-ascii?Q?eZzie9Rwn3JlKuJGE72jHLHpPd5Lmz1QHoseZb6GaJ+kfPPPN3yaC4t+APQr?=
 =?us-ascii?Q?N2MP+k0csxvoz9n1AHy4fOIoeKxDXmNRc9ot1eosvDCGgAdIYG0DhwfmZjvy?=
 =?us-ascii?Q?Ept436aoQqkAwwW6VsmP168nj8VkZ+onfZfSxondAicUKc9zD2I+K99czkQ9?=
 =?us-ascii?Q?nzmV8mEsDMwbTKtov+FTN2oQZElGlHNXxEDdHETnsCfHCE0CcuNHrmI97FWP?=
 =?us-ascii?Q?8IoG0cacbfpisBBsM8PmYPCvujBJ2U2iIsZ9vXSClDojmnIxM91sizxZjh6I?=
 =?us-ascii?Q?9Bz/vIthHFVXOHARjWOqfON7OZz3fcQQKD477CatdOs9UyupzNlhoFpEjOXw?=
 =?us-ascii?Q?ZhFoxxWPHpS6vMA2+LuLUlBkfbs7qEnmLPUP8po5FN2IaAgw4u09+Ib8Wgid?=
 =?us-ascii?Q?q9GhRX+OzcAwGyu6T1pFchvD6tO2UqhJ8gVTnYRmUbgdUOX3tFB8KuORAzN/?=
 =?us-ascii?Q?+03Yb0s3FLeB79gzNWgEwBmCMX9B03vyF2tPe9BWp4tY3LmSPyiFe4ZbbO6l?=
 =?us-ascii?Q?ewoLNoAntRnJmmns+anF3CrIBAp+4O5F52xHIiEo6UG93yYC2/L8no86XBSH?=
 =?us-ascii?Q?HkQ7sCtDoa1lQvf3rxhoMjB/W/RjEe84y3c/zE/6MyDuDzFb/2TxhHH/oO65?=
 =?us-ascii?Q?2yD0V9ykd6nmLayWbRKtwngyqOG0BD4rEaCaOP4G4eVAvUr+TciU3IgcpQW9?=
 =?us-ascii?Q?/W3ooz8NOHdXc2Vfr+6LwBU1xDyOfsgcg5oqrQ+jR8sLsEZ+4jf4ouiGWOuI?=
 =?us-ascii?Q?znX/lAmldl2GpMNmUyT3m6AE3MHc3NSQNV29pJDe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27dd283-a130-4066-20b5-08dcd3bc6948
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:22:15.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQyvjPgbfmmNKO4+FA16WMKQMssiit3C/JFEHeRWXeVzJtywnbv5b9qJImyD/UDFm6S+yM3sfk355qLpNiKflA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10856

The video drvdata should be set before the video device is registered,
otherwise video_drvdata() may return NULL in the open() file ops, and led
to oops.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@nxp.com>
Reviewed-by: TaoJiang <tao.jiang_2@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1d8913813037..979b03b112f8 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2842,6 +2842,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
 	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
 					V4L2_CAP_VIDEO_M2M_MPLANE;
+	video_set_drvdata(jpeg->dec_vdev, jpeg);
 	if (mode == MXC_JPEG_ENCODE) {
 		v4l2_disable_ioctl(jpeg->dec_vdev, VIDIOC_DECODER_CMD);
 		v4l2_disable_ioctl(jpeg->dec_vdev, VIDIOC_TRY_DECODER_CMD);
@@ -2854,7 +2855,6 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
 	}
-	video_set_drvdata(jpeg->dec_vdev, jpeg);
 	if (mode == MXC_JPEG_ENCODE)
 		v4l2_info(&jpeg->v4l2_dev,
 			  "encoder device registered as /dev/video%d (%d,%d)\n",
-- 
2.43.0-rc1


