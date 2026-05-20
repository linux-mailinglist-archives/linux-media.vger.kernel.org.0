Return-Path: <linux-media+bounces-62355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD1pLikrDmpq6gUAu9opvQ
	(envelope-from <linux-media+bounces-62355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 23:44:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B959B3EE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 23:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4764302A7DB
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 21:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C5339FCA6;
	Wed, 20 May 2026 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gU5KD0mq"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12484375AB2;
	Wed, 20 May 2026 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779313442; cv=fail; b=XoUXIQxWT4Hs8H+KbeLchBQJn26H9jJzrmLNQ81WkmeMyy4Hz+avjfJUSb2Y4l09egy9SUDm7xbEy0nF+7iqa1r43Hqod+lP+911+vKj5l2SqM637LXEeHFGqEuyCRKSHdQg6DJmmm8jYgGCMVa0HCpqGDkfKvudlO02AocpE5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779313442; c=relaxed/simple;
	bh=IRK722l7fTkX1TXK5i7iBzt+7O2Vt8kdVBUSiwiXM+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ue5AcOXk6gn+BfoWHf5OvHlx4zITRqKEoc79Ty0WmRtAvH2KHeDPrCtuBoQMRiLrM7hha1kEOtBKhz6a6K2NEd4imvpMZ/TifCwbVFfo2oxAyZPufC7yuCtgHLVgSVoxR7Jm8rHOhxknDZC6QzWqL3Ylu5WcjlbN3BqfQpSVhfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gU5KD0mq; arc=fail smtp.client-ip=40.93.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ63SkEaPIHwoc+Fm2njBRUah4R4e0EYrlQ4gnBtNpKWn9GNrd+ZMZEW07QmgNykPp1xu1e4X8qyHVRs09J9X30Vv4un4g5+exqM9erVp+44fU0giAGgBJ3c1+iGaen6EYb5bkslmkusy7lNCWV+NWI8toqr9iaUBnC3ouIzl8wp8Ps6qVgWZvDhgTzN4WgVgJ1V0hBOFxK2ete9Kvc9HGoq75UAAffjnAxCZP6RT+oc/juy+FCNpWqgB5FjvuCjmtf/gFkCl79noRcM+sbJEU7O8rs0dj4gN7GlUqtreKzU67pDsVXhMfdz/Qi1b30xA0QmeIZoa5ph1ymUY8WMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klVbuwWQc2ZpjoJNgtANE313HxMoS8qEvKoZqw+RXuE=;
 b=Ov/QrcGh7JB2CP74q6bLnG5ov8+AegW4wosqjNYzdcmzpA11jB8NHUoFK/ejBV5bpB9SHQYIpU97dsz5Luvxr3BJlPsJwXvu0gnTwuBSJTj7qqtgMg7k76AvCcPOaJeaRN9ROTk5j/l81m7X2E5hEXWM7fqdiuyxgDvXTXjy0MhzcC0tZOlJF26uDkx7nLS4lVm/kvke24BOs32DOzvM0IpYxe4ejyB7p4BnS5AtcLangIyHh+urSClRRegVjwQE6WYxHRo7MvSmq0bN+4h9Th5TyPm3S3udBlkHbT4ecSw8CdcHK1hHH/MDCR5O6Oo+7q0gAzla3kQqbEs6kjPM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klVbuwWQc2ZpjoJNgtANE313HxMoS8qEvKoZqw+RXuE=;
 b=gU5KD0mqW3ppuXB1Z3iY7qtZTRUFXrI5icJ47PIr4GJikfQa4xhoveQQ7IzhP0jnPM7rXCOzw/puq4IYT9tEjOEPwSV50wXgjWjCHvBZDR5u0SayaiBW86R9i0/50BliEJLXz221rtYU+L70sIZsDJAsNFW37MdScRuEcOtGPJexpWsdvcYGREe+ay55PGk00YD9jHOcRLdJL1DaZt1iCYM7/f1BgxL/Vj1xAiaPEIbu6w0v8igV/hGaP2tgJO9jEWaNIBspIGLn2aLse8GqCbEPfJHFs65VaFfvMgoanCn/PEzwkaH1wzISao9wt1gKV7YYJtHgI2RkjU4+9couHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 21:43:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9913.012; Wed, 20 May 2026
 21:43:57 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	stable@vger.kernel.org
Subject: [PATCH] dma-buf: set SB_I_NOEXEC on the pseudo filesystem
Date: Wed, 20 May 2026 14:43:50 -0700
Message-ID: <20260520214350.168689-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aeddb3e-49ac-4057-10fa-08deb6b8e536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799006|6133799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lVOc8LfYI8ti6WB3DHf4nwUkluMH61o/adm/Sp9pKRrvVZOHdFsAUwAY6RbLC68NFM7KcEwohaH4UAUI1zdhf9T9AtaNJ0ne4H6uZtBUOf56QofffZi7sRaQZQjwLOHMejO/+gYovezkAIeQKRCObirLj1v83GytCt31si9D/mUHdsjbPmIwD7LyWvmV5/M4+5JaWkJ4RYNwMe6rWGqN6dxJUPCCVLZjvqgpQs6LopbhlRrHXjo18nPCxu0KK5ILNYTku/88FDEbqTJniAoTWtOUaZJHYo+HTWYNTrPy3IJsSehAF8w9BATLGP5Tqqlv99aTM2HVpt1tA7UxOOv4DQzAj5Xtq29hqU12/QVoEFpT7g8ArXttU25klCe7OgFzyhhA2hw57Kh9b3SKNK/1xc5lXH+k9lr3n/DBqJejU5agH1bzkdwxXUgSBmnSHmgi1okyhnsnr4mMVRLU7sJzUvrKaeMQ0tUzGedC95IG+ajA9vwLa9bYMiK8BREN0a95hkFXFojvDo1y/gkHBT6n6u7K6TbkO3L715IHAETTkPR8siPLcnt+S15PW8nZjn3ayllG5BBd28S6AGLQADjlOMf9Oeuw7eJIQauocnXcOCVsaA9TCxqy1FTcP0KEKA9cXYvhK+4WFBT0Ruagq99XvV1VyPMpIOQd8ZO1u4t/QNFE1l+O2rxIlvRDJdmzPOSp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(6133799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0UH3FXkdYDC/xstOTve/TecnZPtJtnq3lyT2tmFpCxLP5SelxPwA68758heg?=
 =?us-ascii?Q?rso9MXSU309aDWuYrzAv+2GlRpnR/3v9bHaoYVJBBg/KIxRDljkNur1SXaPx?=
 =?us-ascii?Q?XMIp4f72LhrSTi+kP6RerVxkAExcletNXYFZmkv4ebO9ASuOLDli2+TBFZ0k?=
 =?us-ascii?Q?wC1LhD9WjLRYSFPP8KZMhbIhUgeyaolkKDJ+1mvCv8S+NdD5CzzxaCDGfjDS?=
 =?us-ascii?Q?OEPbETnFt+YlFKrQpBgwK6x/c2EW/RQBEr5gGh2vO5trz1UcePxGkTZL8j91?=
 =?us-ascii?Q?RhjR+tYWUFeE735Rtk2sZUe3I5xKodZ5ogsK+fiwzC2ph7SauzyzLu2Np9JT?=
 =?us-ascii?Q?RpJQTPWqoCnMnUoGlWHCK+3I40pU3XPSL7k/26UNxrJsXpst7m7fC5SD70mv?=
 =?us-ascii?Q?nSSvJo+CWXGHWlsDpBTBJV7MUmm2wBkJz3q+DAZRpnjT/EzOXo+JPOI4sRmy?=
 =?us-ascii?Q?oYZHH2YjSxsH6wvhfcyaauftCXB+5uAVQUQ98ok/JVJjMUufEqRrfT+mp82W?=
 =?us-ascii?Q?ntoTKcFWSgXbsNSlxI6mQiGCHEYcdhyTjScJWRYjPa84i2CSrKZeYYKiY4+a?=
 =?us-ascii?Q?+PJ8kb3ckubx2bRquN2jGhqi0OQzvAQyB/jd/FhkhFOMAWhIDFFCBSVLlWxP?=
 =?us-ascii?Q?z4N3SvTXoPP5ORIEOen+PSEWEnDGGd6bCH900e1jfD0KVDAjn5cE2cM7NCKP?=
 =?us-ascii?Q?xKjM8ABmI0VvO2ewMx0NJc9/q9Ggni6Kbkz3VcPgnmHeEzI08dAD4sS9mloW?=
 =?us-ascii?Q?3q7ymHLOhVuxvCdjtIHDFB6z8H5KsvvUOnrpy32UCX86tCVd4vYfbClBaaUp?=
 =?us-ascii?Q?HgiRfR/csYY9aqbFjN/gJhLsEuW+fE8g/Zlx0Gz05PFJpQzQAzP9t/usjfk+?=
 =?us-ascii?Q?3bgLxWjPuUyvK1lWZtth8tPOtxIsBh6Ui3F+ZY5UkMoKJL6GWWbgSZWLjLMq?=
 =?us-ascii?Q?6GJd7N+veNBbAaVH5Q8ed+ZWEcL/a0AqGClJ+y2du0AeJk9taA6ID0/BTKJ0?=
 =?us-ascii?Q?noFFZLjmNXs4xCydHFmXu1wQjtq9gyDVf3rNzmaSqmJxuGyNRIpkgjaesKWQ?=
 =?us-ascii?Q?cAY6MoOEbYoqda5OrXZyrsnsP44y0Cini4/wY6lsbhHN3WxI+qN3XYtZ3lAI?=
 =?us-ascii?Q?pgzBOkRubc8Dsy4dmYElFcCydm1lLHJQsrvAXMoAMyfhaFmuALspp0pwJ9ls?=
 =?us-ascii?Q?BukXu6aANh1K/UlC/61zOs1BXuJWc3NP7IPN3wXmHsi2sLd+WuSi93QH7G4r?=
 =?us-ascii?Q?uZho+4NqEcngf/AxCKM8k3hXUN9QhfKlQ5vPqO2uA0qbqN93pTmfRFP1wDkO?=
 =?us-ascii?Q?96HsH1pVRsUj7XHF7frtaB1oiyzxyTXy0+jEmP87TsloyLMBKWSteLq73/bl?=
 =?us-ascii?Q?DaA4BO5+X9lHNof0JCtPAnPFD9sI3HOkQyav6T3xJgVAVIthCaz+XIj9XkuJ?=
 =?us-ascii?Q?B+cBHUTD6vhkZYkCqyzU7AbkpX3JQqcZWrbMztv2kPCa0Uzp2Qt6vNYJn/Ys?=
 =?us-ascii?Q?ABvrJnt+hRttYjVMyLHeljGr3PMV1FJzwarFBJZqzjdjKAuYmue093zkQwwo?=
 =?us-ascii?Q?oijMQte12fvlyT7WdnqstYpiS9vTcxe0I+TuwaMiIar/BhUDwRjXB3Lcgjdi?=
 =?us-ascii?Q?wqMd1N/oxbSTJgZZDJvMF9ZlRtbiGK9m2cSHckHveZ3ZFG2UIeHbv2Ss9dQD?=
 =?us-ascii?Q?+5LgRuyu3/IxspmMuHNy0DEmcNBIaASk91bb+J1RpC/xvwbAFhhpNEvpqbd8?=
 =?us-ascii?Q?b6r7cRAJvg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aeddb3e-49ac-4057-10fa-08deb6b8e536
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 21:43:57.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4v4kgy3M5Ez0ndA7bG8UxDZ75O8ZZcNULtXl8u24fCqFvepiWJ54IL1EaV81BV4Do+v8Zvd2nKjqmYT2bNIfVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62355-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 635B959B3EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The dma-buf pseudo filesystem dispenses S_ANON_INODE inodes via
alloc_anon_inode() but never sets SB_I_NOEXEC on its superblock.
Since commit 1e7ab6f67824 ("anon_inode: rework assertions") in 6.17,
path_noexec() warns on exactly that combination, so an mmap() on any
dma-buf fd trips the warning:

  WARNING: CPU: 11 PID: 121813 at fs/exec.c:118 path_noexec+0x47/0x50
   do_mmap+0x2b5/0x680
   vm_mmap_pgoff+0x129/0x210
   ksys_mmap_pgoff+0x177/0x240
   __x64_sys_mmap+0x33/0x70

dma-bufs have no business being executable, which is the invariant
that the new assertion is enforcing. Set SB_I_NOEXEC on the dmabuf
superblock.

Reproducer on a CONFIG_DEBUG_VFS=y kernel:

  make -C tools/testing/selftests/dmabuf-heaps
  sudo ./tools/testing/selftests/dmabuf-heaps/dmabuf-heap -t system

The selftest allocates from /dev/dma_heap/system and mmaps the
returned fd, which trips the warning without this patch.

Fixes: 1e7ab6f67824 ("anon_inode: rework assertions")
Cc: stable@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 71f37544a5c6..d86a99d7b8dc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -216,6 +216,7 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 	if (!ctx)
 		return -ENOMEM;
 	ctx->dops = &dma_buf_dentry_ops;
+	fc->s_iflags |= SB_I_NOEXEC;
 	return 0;
 }
 
-- 
2.54.0


