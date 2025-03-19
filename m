Return-Path: <linux-media+bounces-28452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F4A683F8
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 04:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6E453B5B5D
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 03:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E98024EF85;
	Wed, 19 Mar 2025 03:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FF7nAd8s"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022108.outbound.protection.outlook.com [40.107.43.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D56A24EA9B;
	Wed, 19 Mar 2025 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356251; cv=fail; b=LKFapegeZKKnwM9ip0CB2tjih9PbuRb0qZeTH8lD9AjQIwEIIwPel6/coezSFwyfWIG0bINs0eR9dFGqFt5NyXHRDVE2Vlp2RlGuZIGic0zFGdXi24qO7waTxWzD/87qQp5kL2IkZN8bAUdiOtDfFxgetOGAytG0xVPNBTLpGkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356251; c=relaxed/simple;
	bh=O57VXptonyG3Q2rLxZNHhSvAnsMKr8p/sdzW2LbZ9gU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B1aO4Fa7zaaJBSu44giPNYdSPVunBLNxb301OKAUaNVLsl37RG/FJBq9bvnkQ8ykOD1Ak9xZ2U6Gu5QjtiUpSoy6ioEv7by4FnuTU8JoNLYKGPiBOMbqKrKBW5Z3OJ41wb1f7D3ktFDwdptWRlIpPwWKfFxWtU3VQ2aTw7LAHoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FF7nAd8s; arc=fail smtp.client-ip=40.107.43.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfaPHL4VcvMTFoOrvBDda8JQk4hxTkPEtK6Wz9uts30meS57UrNWOlTc4q50tMZG8JCPWWZSc9qxrNrr8+JY7z1M+KXEYFYz+fUKAz/DprhZW7Od8A/BKMqeWofVwmxBdZrTE8LmBy+zNa+D8GZNoTsATeHu05IVnLtbgiwbLB/5MjmT+aQcRQ6h7S+AJXVitSswzm93Zd67stou+4qDPmi4bSW4hJGxkX+pJEz6hSEtyZfJ47hl9zTG8DCzQrC/tMGJxdj4rDTokCqs4NbPdToc+/VEMIs6GuGMNg/CG2Wa9ntj96UNfvFbnE2+7Y+gH2Iw/gRUcrKDa82nJMgdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOFB508/Sd59Vfz5YPzNugZCd259xSiL6x6E+sSmwBo=;
 b=GN5DWrVuoPy9q7lE458jkDLEeN7UJYB8ps74P3BuWLLG9HsmGuh9i8Zw/VX1/SPcIvuVj+H+oB4icWJ35RhJt/RT5s3RGO3av5dAOcK9zcEp9SdAjJM5KiUgfQFzz84AcYbCH6xPfJ5vi82Z98bvlpta8iQRH4xaUTYBQtB6DXRU/XRNRILEdTs90eEzijuDsnPUA82nuVr2Moc9j8OuLFrNKwh+MGvksj9w3LJTOqMkpaxDzpBpsO8XojxOnwGqxdrYXjF6dCZZgb08SDi9gmFK6WYHqKXIYl2LBxoGASy0T6lbBfHtKX3aybal3j1UpRMvZi2ZsNfeMpU8RGgzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOFB508/Sd59Vfz5YPzNugZCd259xSiL6x6E+sSmwBo=;
 b=FF7nAd8sf0cVQnYKYyCfiOJDxnmXhC2SNtyFNgdtaoPqtZS52vJbUpRJMHemjp8s2FJ41q1AuysS+UmoVGSmGhE7MdxTk4o4l6p/1EtGQt7W17IFNZE8Xm6grUc5l0gZsIPMNd8peE4FGf3bZjBiSbUuFMP+POQIZey9NzV57rE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2051.KORP216.PROD.OUTLOOK.COM (2603:1096:301:130::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Wed, 19 Mar 2025 03:50:43 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 03:50:43 +0000
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
Subject: [RESEND PATCH v0 1/3] media: chips-media: wave5: Improve performance of decoder
Date: Wed, 19 Mar 2025 12:50:32 +0900
Message-Id: <20250319035034.111-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0085.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2051:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed5c85a-6826-498b-2f4f-08dd669938f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Qgm8e4zie9cuUizwP42QwsgJ4672QIRJSL/y4CVmlzJJxvrR2AF8kKjt1TA?=
 =?us-ascii?Q?ov9TYB8ZTgW4YzJTTa6ggAhVkGAe3yYkTShNqHpWUi62ZSRpiqBWGwns/p1Y?=
 =?us-ascii?Q?3FMdPWu25cB6A97hzdnnP8MnWMD2PCW8RQzPBLn4/9kdIkfAPgOtERWK/hfs?=
 =?us-ascii?Q?Id9RwHvDT/GgEJ0WMlz5iK3i/V/74bSy7ATgmYxW2+gBltRAKrOp2oEIkXaG?=
 =?us-ascii?Q?RdvQd1Z+BRBewRdxL4LEQZBcHXVdwF1qJ6a5TjT1yQ8Gn8SYx60MyrAA5mzg?=
 =?us-ascii?Q?7eC2gbwG+JKdJFf2cNy6O/O3GgS3mUCyCI624vojRLg1A61Jp0MBqBaofuqS?=
 =?us-ascii?Q?UOattEQThWWV1Ig0IpyaQO3+X2GiKC3kdrqWkLB4tE4U5iMnGZG3jwqX8pKT?=
 =?us-ascii?Q?DY9/uJrBL0tZi/cDx4jDr5FF4cbC4E5+CLl73cjBpuTGsFf74XY1DddVV8eY?=
 =?us-ascii?Q?dDuC7TfIN5kfwwKrO0jM+VNm1BB8SUzwgtmhADsi9RXP5nFPqXKtv55MhmkG?=
 =?us-ascii?Q?eprCvlDfjA2TInod6mVV23B5LYXKnLe5BmaPi3m07IB+qcnQg46Etug8oZxD?=
 =?us-ascii?Q?WoLjzy44HtWK9QNVBR06g4ZLUatbe85Hk5vjbg2ugBVrsRPOhy+OSC9gjmhc?=
 =?us-ascii?Q?YEsm57yN0i89jI1ssa5EbURwkx3WLO2LeXwPOMJqf3P1vwWk9i038j4B6vop?=
 =?us-ascii?Q?PpM/IoEBhF3Y9DowP4TnF+fBts7V9cKh6cn6PqjkXOrmcxAYHAgUwZSSi9HD?=
 =?us-ascii?Q?ahmEvZHS6NH7mmZnW9j17zQSsp7nYuYOZb7YdD/ItbohkLIPXnREqUd0sj9c?=
 =?us-ascii?Q?fiJX07aZuj1CUPrFrXvekKZuD220MUfG9npDHiSF+CW9bj/c/RnUAFZz5jDi?=
 =?us-ascii?Q?HK9tuGhSUC+4x7XSSigFlpCGZUIEc4OsEqfwc8Qznn8w+sS3AlkIZl5S84qL?=
 =?us-ascii?Q?6utMxiQU4oWN+h7T5yVueYUmhcTqwuiXf3zSTEeAt/wyF+4WN8pIohVbGIgB?=
 =?us-ascii?Q?IDF5DsY4DDokGhbGSJuGADF1KA3Tpg7sNN+V72mCbit5HdhjmYReKaE1hIH9?=
 =?us-ascii?Q?+tN5NfCUk149NcYsHuVf3ashxyxDh6gz8ON2C8RlU9sjT8jAqJ7NyvDtxkPc?=
 =?us-ascii?Q?qomCpLhwgCopAmh7nBrNpSxUpeDEdmsyq5KaCOxyKeek5JBe+XMm2pii/r/n?=
 =?us-ascii?Q?DSAjTlYAo887bGAgIjMW/GXxRVTz/gW3geXRbLN291c8Hs/4klUU8Y99H0dd?=
 =?us-ascii?Q?E/0idShMWRriyxq+BAGsqHP+N0MxxPDjk5S61kh5hwHB69C6NqmpHwcOeQ73?=
 =?us-ascii?Q?Yd2/3FQ8TycYF2x21+hH0zz0lx81hCkU9eBMZSNG2nBarZF1utXyaYZgs5ru?=
 =?us-ascii?Q?LPrDShEOvlSq5ZnBGQDu8KI+4yWCSMKucgHomzAQMXpYcZezuMbe7hbYbfOE?=
 =?us-ascii?Q?i8KaIALR57UyOQUBqXs2//gm/oPOOpNF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ktSVXAvoNYwXElVJ8XP2O6RBobnEpAXnTBJwSlmTS/qGBI4p7yO6ktIe5/qH?=
 =?us-ascii?Q?0kmgfK8w0g2G12MPVry4r4JJRf2qp4WjOsYgKCHQo47V7xsilP7EiTKROLWG?=
 =?us-ascii?Q?xfUBt2CdBnHKsAgwTuYZ8v9L2hzpwRwzshQjO1KKGNpIzpsDhY/w9hy1fdwS?=
 =?us-ascii?Q?COvQhfnpwaSuPN7u1Y4h605zHUYMtBJuTsJcglc0e9E+OBvRcC/YvSIU8g7W?=
 =?us-ascii?Q?ozpofE7UEebFK2HluWrkHhRAiVCxhLyXYxSIRMLTflC2dUMVvp/sBa4yL76J?=
 =?us-ascii?Q?ChI+W7lsTyrylJoPIL2vxNf3E2MJokRevqkNEU086Yz6ia1RGq92iflMxf7w?=
 =?us-ascii?Q?heL+yYQIFCN4pcW9tX6yRvbF3nI8sHZ5pmbKtSZ07iKzs5EJ4UDHIWzcCuyM?=
 =?us-ascii?Q?7d5lwVKT6kjnC1FpkeZdSsluRI7+BOepLiHtx+PB4Ni6onYyU0IqY6r4NDUM?=
 =?us-ascii?Q?qsXzpWjdjHtlBlgSmIyFmOlKXboHHoYZfrHW38R7of2bfresg6uiNRhtEm2V?=
 =?us-ascii?Q?XzOjDnM22co1wDOwJPdLjkBz2seZHTX2JVwvO7FPPWIYlN1PBQE56Cy8GANc?=
 =?us-ascii?Q?rr7DdUXFVfgksDhzt1qmiT51rAHX3BzL3KCUMlv3QAZsCbeQ91XJ3O75/u/g?=
 =?us-ascii?Q?v910Oj1Ujy8qPK7SYUjFRv1dbZ90YweBonYjF30u4ATU2hMtrLPrhZzZ64d6?=
 =?us-ascii?Q?YViKYC44j5317W+pAePd6nGiNPGqUCdGEbeR5waeBq3fpCAcEhNezSSXtYWq?=
 =?us-ascii?Q?nH5u5v/2jQFyeA09o2dnMxVOBWc7qXqwstOaE4iryt/hHSAVN392c0XeCj7L?=
 =?us-ascii?Q?As1eMeIQFzbkowbGrHpC7c0mT8TLhcOErJ1g+hzOH8aY8CS51ZkyU1DdIGjO?=
 =?us-ascii?Q?Ccfqg9Uz+UHtXj8stWj4fixmgCYYkkgd/2RX31NctBf4vAwiS2wkDxpnjaZe?=
 =?us-ascii?Q?SXm61ilXBzcQpnT6vh5CwZczzFqugxts9X5APwR7DFOKUMYzVlujLrdjxS02?=
 =?us-ascii?Q?Mfc0yd5V9hdqrlMphSRZmLqBY7cT4uMh9vddY06Kcgu6bv7NKirNpzjbJ37F?=
 =?us-ascii?Q?SuopzVdRH4LVEQ0niq6DM+Ht0hVdUtG1o5AaiyAp9IwTDSKP1YYhoEbDqvot?=
 =?us-ascii?Q?T5+5gG8s0Q6SWzO3GHrZnPzCT2L62c/N5lqjm5huTehY3/OFyBmc6w1+Z3dU?=
 =?us-ascii?Q?K8oSa+YcbB3irc+sHx9Ru77Godf1weV9ZBSNHOV9COUiRo1dH7AtHlcw7RsG?=
 =?us-ascii?Q?qj11EPnXvnOAHeKfA8BR2FTr6utHcTBOvqF0TNePMncIZLmWPWk5PuhIeRg8?=
 =?us-ascii?Q?yO08OFTQOjoakwf2T0G9WbN2E76uKDTXFRHuoxVWHVtT0MBRPmmlhRuMaJqF?=
 =?us-ascii?Q?+UsDst5f3FpLXY9a9JmsX3FMIgiHz2v+sXIBHnc0ijrqVXs3rEIKjLT5qGEE?=
 =?us-ascii?Q?ouCSv7F7QyL+r1+gt7a83MfAZWuzUFVGaR4XP74GhF9FTQL0PYRCkTOMzHDK?=
 =?us-ascii?Q?2fPzUcmUEEQA3BYxc2+zkc6bwSdOG2v82LZNfdsWjXll0ffkHPhC9MrOIyUM?=
 =?us-ascii?Q?LHibSiDD52Ksg+Dj3X7r5JnvakwND7Xb6QQ9x8P74DvyJroFsORLnqp418dj?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed5c85a-6826-498b-2f4f-08dd669938f7
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 03:50:42.9399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iX1hdrPvMHJQH7oMwgSA4e28HeK/bAQXaaR3RXZQsInSqqjg09eHDykzFpNlUzRg2cNmSJikMUbhOg7tiZ4qKp85kg7xi9qVg3XUh1oFalw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2051

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The existing way for decoding frames was to wait until each frame was
decoded after feeding a bitstream. As a result, performance was low
and Wave5 could not achieve max pixel processing rate.

Update driver to use an asynchronous approach for decoding and feeding a
bitstream in order to achieve full capabilities of the device.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 344 ++++++++++--------
 .../chips-media/wave5/wave5-vpu-enc.c         |   3 -
 .../platform/chips-media/wave5/wave5-vpuapi.c |  25 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   5 +-
 4 files changed, 211 insertions(+), 166 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index fd71f0c43ac3..cc47da509703 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -230,12 +230,147 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 		switch_state(inst, VPU_INST_STATE_STOP);
 
 		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 
 	return ret;
 }
 
+static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
+			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
+{
+	size_t size;
+	size_t offset = wr_ptr - ring_buffer->daddr;
+	int ret;
+
+	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
+		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
+		if (ret < 0)
+			return ret;
+
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
+					     buffer_size - size);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
+					     buffer_size);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fill_ringbuffer(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
+
+	if (m2m_ctx->last_src_buf)  {
+		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "last src buffer already written\n");
+			return 0;
+		}
+	}
+
+	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
+		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
+		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
+		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+		dma_addr_t rd_ptr = 0;
+		dma_addr_t wr_ptr = 0;
+		size_t remain_size = 0;
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
+				vbuf->vb2_buf.index);
+			continue;
+		}
+
+		if (!src_buf) {
+			dev_dbg(inst->dev->dev,
+				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
+				__func__, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
+		if (ret) {
+			/* Unable to acquire the mutex */
+			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
+				ret);
+			return ret;
+		}
+
+		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
+
+		if (remain_size < src_size) {
+			dev_dbg(inst->dev->dev,
+				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
+				__func__, remain_size, src_size, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
+		if (ret) {
+			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
+				vbuf->vb2_buf.index, ret);
+			return ret;
+		}
+
+		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
+		if (ret) {
+			dev_dbg(inst->dev->dev,
+				"update_bitstream_buffer fail: %d for src buf (%u)\n",
+				ret, vbuf->vb2_buf.index);
+			break;
+		}
+
+		vpu_buf->consumed = true;
+
+		/* Don't write buffers passed the last one while draining. */
+		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
+			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
+			break;
+		}
+
+		inst->queuing_num++;
+		list_del_init(&vpu_buf->list);
+		break;
+	}
+
+	return ret;
+}
+
+static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
+{
+	int ret = 0;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	u32 fail_res = 0;
+
+	mutex_lock(&inst->feed_lock);
+	ret = fill_ringbuffer(inst);
+	mutex_unlock(&inst->feed_lock);
+	if (ret) {
+		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+		return;
+	}
+
+	ret = start_decode(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev,
+			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
+			m2m_ctx, ret, fail_res);
+	}
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+}
+
 static void flag_last_buffer_done(struct vpu_instance *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -347,7 +482,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
@@ -441,20 +575,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		}
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
-
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_mark_last_busy(inst->dev->dev);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
-	}
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -794,11 +914,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
 	}
 
 	if (inst->state != VPU_INST_STATE_NONE) {
+		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_src_buffer *vpu_buf;
+
 		/*
 		 * Temporarily release the state_spinlock so that subsequent
 		 * calls do not block on a mutex while inside this spinlock.
 		 */
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
+		if (vbuf) {
+			vpu_buf = wave5_to_vpu_src_buf(vbuf);
+			if (!vpu_buf->consumed)
+				wave5_vpu_dec_feed_remaining(inst);
+		}
+
 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 		if (ret)
 			return ret;
@@ -1116,115 +1246,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
 	return 0;
 }
 
-static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
-			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
-{
-	size_t size;
-	size_t offset = wr_ptr - ring_buffer->daddr;
-	int ret;
-
-	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
-		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
-		if (ret < 0)
-			return ret;
-
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
-					     buffer_size - size);
-		if (ret < 0)
-			return ret;
-	} else {
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
-					     buffer_size);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int fill_ringbuffer(struct vpu_instance *inst)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
-
-	if (m2m_ctx->last_src_buf)  {
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "last src buffer already written\n");
-			return 0;
-		}
-	}
-
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
-		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
-		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
-		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
-		dma_addr_t rd_ptr = 0;
-		dma_addr_t wr_ptr = 0;
-		size_t remain_size = 0;
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
-				vbuf->vb2_buf.index);
-			continue;
-		}
-
-		if (!src_buf) {
-			dev_dbg(inst->dev->dev,
-				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
-				__func__, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
-		if (ret) {
-			/* Unable to acquire the mutex */
-			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
-				ret);
-			return ret;
-		}
-
-		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
-
-		if (remain_size < src_size) {
-			dev_dbg(inst->dev->dev,
-				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
-				__func__, remain_size, src_size, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
-		if (ret) {
-			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
-				vbuf->vb2_buf.index, ret);
-			return ret;
-		}
-
-		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
-		if (ret) {
-			dev_dbg(inst->dev->dev,
-				"update_bitstream_buffer fail: %d for src buf (%u)\n",
-				ret, vbuf->vb2_buf.index);
-			break;
-		}
-
-		vpu_buf->consumed = true;
-
-		/* Don't write buffers passed the last one while draining. */
-		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
-			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
-			break;
-		}
-	}
-
-	return 0;
-}
-
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
@@ -1236,6 +1257,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	vbuf->sequence = inst->queued_src_buf_num++;
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	INIT_LIST_HEAD(&vpu_buf->list);
+	mutex_lock(&inst->feed_lock);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 }
 
 static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
@@ -1362,7 +1388,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 				goto return_buffers;
 			}
 		}
-
 	}
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
@@ -1385,6 +1410,13 @@ static int streamoff_output(struct vb2_queue *q)
 	dma_addr_t new_rd_ptr;
 	struct dec_output_info dec_info;
 	unsigned int i;
+	struct vpu_src_buffer *vpu_buf, *tmp;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+
+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
+		list_del_init(&vpu_buf->list);
 
 	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
 		ret = wave5_vpu_dec_set_disp_flag(inst, i);
@@ -1481,10 +1513,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
+		    q_status.report_queue_count == 0)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
@@ -1577,13 +1607,23 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
-	ret = fill_ringbuffer(inst);
-	if (ret) {
-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
-		goto finish_job_and_return;
+	if (!inst->retry) {
+		mutex_lock(&inst->feed_lock);
+		ret = fill_ringbuffer(inst);
+		mutex_unlock(&inst->feed_lock);
+		if (ret < 0) {
+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+			goto finish_job_and_return;
+		} else if (!inst->eos &&
+			   inst->queuing_num == 0 &&
+			   inst->state == VPU_INST_STATE_PIC_RUN) {
+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1619,7 +1659,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
@@ -1634,12 +1676,14 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
 		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 			return;
 		}
 
@@ -1650,14 +1694,22 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
+		}
+
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+		} else {
+			inst->retry = false;
+			if (!inst->eos)
+				inst->queuing_num--;
 		}
-		/* Return so that we leave this job active */
-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-		return;
-	default:
-		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
 		break;
+	default:
+		if (!v4l2_m2m_has_stopped(m2m_ctx))
+			WARN(1, "Execution of a job in state %s illegal.\n",
+			     state_to_str(inst->state));
+		return;
 	}
 
 finish_job_and_return:
@@ -1676,10 +1728,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		return;
 
-	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
-	if (ret)
-		dev_warn(inst->dev->dev,
-			 "Setting EOS for the bitstream, fail: %d\n", ret);
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1755,6 +1804,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
@@ -1830,9 +1881,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1e5fc5f8b856..cf20f774ed1b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1774,9 +1774,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..c1737fac6edd 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -233,6 +231,16 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
 			ret = -ETIMEDOUT;
 			goto unlock_and_return;
+		} else if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING) {
+			struct dec_output_info dec_info;
+
+			mutex_unlock(&vpu_dev->hw_lock);
+			wave5_vpu_dec_get_output_info(inst, &dec_info);
+			ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
+			if (ret) {
+				pm_runtime_put_sync(inst->dev->dev);
+				return ret;
+			}
 		}
 	} while (ret != 0);
 
@@ -249,11 +257,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
+	mutex_destroy(&inst->feed_lock);
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
@@ -720,8 +724,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -765,11 +767,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..6ca1ddc67c64 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -163,7 +163,7 @@ enum set_param_option {
 
 #define BUFFER_MARGIN				4096
 
-#define MAX_FIRMWARE_CALL_RETRY			10
+#define MAX_FIRMWARE_CALL_RETRY			30
 
 #define VDI_LITTLE_ENDIAN	0x0
 
@@ -812,6 +812,9 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool retry;
+	int queuing_num;
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
-- 
2.43.0


