Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0B11A7F84
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 16:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389784AbgDNOUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 10:20:38 -0400
Received: from mail-eopbgr150083.outbound.protection.outlook.com ([40.107.15.83]:41286
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389741AbgDNOUc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 10:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yot3Zxj9fu5OJnFKoioziT1z8b6vkpN8f/vIFsaKci8=;
 b=0y5xFEfUG7nVhWtTte9YvO2PP1RoDHKduEg2Ld4xDM2P1j9//LhwMKwzq0lzYsycqWjACuUdiZuSFZN7UyPejJbN/SQYwp6qlpnEdybvwYPJ5OBaxSLTXaMj3y9CaCh+39jjGwsmmJI+Zf7UgeeN7YDrSGtq9pTStEKOKfy+Gww=
Received: from AM7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:100::33)
 by AM0PR08MB4514.eurprd08.prod.outlook.com (2603:10a6:208:13a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Tue, 14 Apr
 2020 14:20:27 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::c5) by AM7PR02CA0023.outlook.office365.com
 (2603:10a6:20b:100::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Tue, 14 Apr 2020 14:20:27 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 14 Apr 2020 14:20:26 +0000
Received: ("Tessian outbound af37c2b81632:v50"); Tue, 14 Apr 2020 14:20:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9cd3325e54d7a9a2
X-CR-MTA-TID: 64aa7808
Received: from 56e8c3965797.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6AB08F36-6864-41D0-823F-0AE3BB2C1C3F.1;
        Tue, 14 Apr 2020 14:20:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56e8c3965797.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Apr 2020 14:20:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ebpxkd8D6c41cV5AMCM4D7BVbRZSjUFS+6jE+qEzbfiDcVHfrKIWIAlD0m+OA7eJNkHNPhEgSSSuy9orDR4ROJDT3nAsG5wr9P4xQ7c4oOYP3+JurV+dz7fkpvHXzx3DtcNtcvD/FMxUzCx5qGwsWsNA3nYq532U4vX+fTGpeZ2eZt7yborfCLe9K53Gzvds8s8cTnPwujRNks9+CNdCg04lgFrdlMzsAZqm9s2aYv4ddmBp9JwNCCuOFf45WzSjbKLjtAlQjkDdW3OJe4XjoFbEImbcmrfM7lA1O6xZK5qjACglFA5z+5hI63xs281NMZQyXzbP0oggm1yvhVeqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yot3Zxj9fu5OJnFKoioziT1z8b6vkpN8f/vIFsaKci8=;
 b=MW8wCF4r14msGevWpf4egYtM/cqFG60QVVctpcRNKAMFwlcvYcmTB0mx0PNz/qKJzu4LFxDvPpWEiBnxvXF9J3vucgQVJ4BoS93bKkH/xaGiYF3xaHOT9MuU8ucqlLzbQuEMMB+pQbw1/jHmMWukROcRl1DByZaewHMSer4El3lqqcR1BmSPzQq3KjXN3THSfP8ya8ajG3mXxTQHDdQBLPCahstA/xKq3uI2mmGUZiRbVS8WEoNSmw70Zgz75bb/kz0uA2sVefAR2Fhe5LBJsio+8t7zUoyl995IZOedwrt52s5O8e+npOgnTaogH23ETX/70G8L7b3lUcEawqUuiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yot3Zxj9fu5OJnFKoioziT1z8b6vkpN8f/vIFsaKci8=;
 b=0y5xFEfUG7nVhWtTte9YvO2PP1RoDHKduEg2Ld4xDM2P1j9//LhwMKwzq0lzYsycqWjACuUdiZuSFZN7UyPejJbN/SQYwp6qlpnEdybvwYPJ5OBaxSLTXaMj3y9CaCh+39jjGwsmmJI+Zf7UgeeN7YDrSGtq9pTStEKOKfy+Gww=
Received: from VI1P194CA0033.EURP194.PROD.OUTLOOK.COM (2603:10a6:803:3c::22)
 by DBBPR08MB4235.eurprd08.prod.outlook.com (2603:10a6:10:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Tue, 14 Apr
 2020 14:20:16 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:803:3c:cafe::63) by VI1P194CA0033.outlook.office365.com
 (2603:10a6:803:3c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Tue, 14 Apr 2020 14:20:16 +0000
Authentication-Results-Original: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2900.18 via Frontend Transport; Tue, 14 Apr 2020 14:20:15 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1415.2; Tue, 14 Apr
 2020 14:19:18 +0000
Received: from e123356-lin.trondheim.arm.com (10.40.16.105) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.1415.2 via Frontend
 Transport; Tue, 14 Apr 2020 14:19:17 +0000
From:   =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>
CC:     <nd@arm.com>, <orjan.eide@arm.com>, <anders.pedersen@arm.com>,
        <john.stultz@linaro.org>, Laura Abbott <labbott@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        "Daniel Vetter" <daniel.vetter@ffwll.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        "Arnd Bergmann" <arnd@arndb.de>, <devel@driverdev.osuosl.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH] staging: android: ion: Skip sync if not mapped
Date:   Tue, 14 Apr 2020 16:18:47 +0200
Message-ID: <20200414141849.55654-1-orjan.eide@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414134629.54567-1-orjan.eide@arm.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(186003)(36756003)(86362001)(5660300002)(82740400003)(316002)(7416002)(54906003)(8936002)(70206006)(70586007)(8676002)(478600001)(81166007)(336012)(47076004)(1076003)(81156014)(2906002)(6666004)(356005)(26005)(4326008)(2616005)(109986005)(7696005)(426003)(266003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b389880-0569-443e-101c-08d7e07efa2f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4235:|AM0PR08MB4514:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4514B28537A5085B182BEE5D90DA0@AM0PR08MB4514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0373D94D15
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vwt6JmX/jYgYH221sT3He0dXJ9cM5UO91FaGM6MJ3VQTfWd1/8g6S0WXYq5PuvSVFd9o7Q/h2aDk8P/V+LX84kpKBCg7NvPVPD0SDMSpxzpTLCAc+YgC3HQVHfEyUac8WmV9TKGKcSYIWDkvS6LsAPzA7Af0bF5gab8UPFxm3VYMnNGg7u2gdus2TKVv1pB++DrcTsTTye8OwZxNjYR0yMC7CdaG+6y6UC64iPn37Cy7vqs1DISoQbQFzwb+FAG6c/J62jqxHwbFT2KelceKSE10KSw0ab3EXRTbxsteWG5C2KNk4RLtzj1JS8vOwByZFwhsiYqTGvJKq6n8GVi4emgcH11elcnOyz01WMXUQuXAPhQiB7iixGSQetVaMGJ2gitGlyi/G5lqzh4gxWYkoHzeT4OK5ssV+ryWDqoUQJ7+WWw7GPZxMc4hAE4n7dZDKG/+nE0bxWkjzNShrRdeK/oK8dM1uxVQWv5b4vpTdQJWX79/Z8bTbdXnVZ09DVqPcJQkKOyaI8TOjLKU6hugBhjRCJJTu9E1pEHKAEPsq7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4235
Original-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=bestguesspass action=none
 header.from=arm.com;
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966005)(109986005)(81166007)(1076003)(81156014)(478600001)(2906002)(26826003)(8676002)(47076004)(36756003)(6666004)(86362001)(82740400003)(2616005)(4326008)(7696005)(426003)(186003)(8936002)(63350400001)(336012)(450100002)(26005)(316002)(54906003)(36906005)(5660300002)(70586007)(70206006)(266003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: c2b39d7b-d07f-4370-27b8-08d7e07ef3ba
X-Forefront-PRVS: 0373D94D15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hbxJu2am55xI3gbxPNpIwB97RS9jFOKbN0zKUEeI+kaII4Ax88rejI7OTRWeLzKz1HLy1FVIp2/tctPYbFr4ObJKm2BFycLM2hod/2kJ1fJjFQtWoUiXrxNe8K3tpMz2jY57jJLPqp5ufYhTUqodeYWNWZt9qc5uIAO/UhWMpcaW3fdHvGNwd7RN+aYNQK3NrngsImmK9z/KIgvr0DNkwxrnSOC8QK25lOLFGX7n2ASi2KA3hH4u0XInSdL3VbFYxGY2BQUWnQY3m0GirLislKQvrL/1y9QUK4iuztFN8ked8SSooAPtb9mi7XHeRkLvORp6eYIQi/Azm+CcyPmH/hWbeOZPYc/lj1/IRbyL3PDm244DgI6Yuaf0rYWuHqi1i3b+4W2ULOSZWL+r3abhLi/aXmqWAe1kfWHqEBrcWOem8tF4Fs8xiMmXqjSYAmeIoVMWWBmfKwWKecGrpNGw7dAnYrGKplpNeP5KcttZzpHHWdJsYKfJwcsON3eMvX6lSGE4/22jMxTO6J0gdK7mIQQmg0028v4Bv/QrELIO6ZE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 14:20:26.2683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b389880-0569-443e-101c-08d7e07efa2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4514
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only sync the sg-list of an Ion dma-buf attachment when the attachment
is actually mapped on the device.

dma-bufs may be synced at any time. It can be reached from user space
via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
syncs may be attempted, and dma_buf_end_cpu_access() and
dma_buf_begin_cpu_access() may not be paired.

Since the sg_list's dma_address isn't set up until the buffer is used
on the device, and dma_map_sg() is called on it, the dma_address will be
NULL if sync is attempted on the dma-buf before it's mapped on a device.

Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
into the dma_direct code")) this was a problem as the dma-api (at least
the swiotlb_dma_ops on arm64) would use the potentially invalid
dma_address. How that failed depended on how the device handled physical
address 0. If 0 was a valid address to physical ram, that page would get
flushed a lot, while the actual pages in the buffer would not get synced
correctly. While if 0 is an invalid physical address it may cause a
fault and trigger a crash.

In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
merge swiotlb_dma_ops into the dma_direct code"), as this moved the
dma-api to use the page pointer in the sg_list, and (for Ion buffers at
least) this will always be valid if the sg_list exists at all.

But, this issue is re-introduced in v5.3 with
commit 449fa54d6815 ("dma-direct: correct the physical addr in
dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
behaviour and picks the dma_address that may be invalid.

dma-buf core doesn't ensure that the buffer is mapped on the device, and
thus have a valid sg_list, before calling the exporter's
begin_cpu_access.

Signed-off-by: Ørjan Eide <orjan.eide@arm.com>
---
 drivers/staging/android/ion/ion.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

Resubmit without disclaimer, sorry about that.

This seems to be part of a bigger issue where dma-buf exporters assume
that their dma-buf begin_cpu_access and end_cpu_access callbacks have a
certain guaranteed behavior, which isn't ensured by dma-buf core.

This patch fixes this in ion only, but it also needs to be fixed for
other exporters, either handled like this in each exporter, or in
dma-buf core before calling into the exporters.

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 38b51eace4f9..7b752ba0cb6d 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -173,6 +173,7 @@ struct ion_dma_buf_attachment {
 	struct device *dev;
 	struct sg_table *table;
 	struct list_head list;
+	bool mapped:1;
 };
 
 static int ion_dma_buf_attach(struct dma_buf *dmabuf,
@@ -195,6 +196,7 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
 	a->table = table;
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
 
 	attachment->priv = a;
 
@@ -231,6 +233,8 @@ static struct sg_table *ion_map_dma_buf(struct dma_buf_attachment *attachment,
 			direction))
 		return ERR_PTR(-ENOMEM);
 
+	a->mapped = true;
+
 	return table;
 }
 
@@ -238,6 +242,10 @@ static void ion_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			      struct sg_table *table,
 			      enum dma_data_direction direction)
 {
+	struct ion_dma_buf_attachment *a = attachment->priv;
+
+	a->mapped = false;
+
 	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
 }
 
@@ -297,6 +305,8 @@ static int ion_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
 				    direction);
 	}
@@ -320,6 +330,8 @@ static int ion_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sg_for_device(a->dev, a->table->sgl, a->table->nents,
 				       direction);
 	}
-- 
2.17.1

