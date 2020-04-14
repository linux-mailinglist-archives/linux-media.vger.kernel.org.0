Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3531A7EB6
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 15:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbgDNNrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 09:47:39 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:38565
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727989AbgDNNrh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 09:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC7j1Zj4y5mIGXCP+MT8yqQBhySeisf48q0gLE5hvKQ=;
 b=N7hHaZrdBjcM4hhZlLDf4iVXCHOTAegsG+g4BYAydne1mpThFAp4/p1kSsjgojQ1wi2DvGbqEpaVuZb7KeTCdwSK+fMcUl6ZgPMB98r7xLGFcEAhUcFsevoqNciSLc5wrcMyQLC/VLVed4agbb1T/RZOnf7fljGFZSqfYVuXSYI=
Received: from AM7PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:20b:100::23)
 by AM0PR08MB5106.eurprd08.prod.outlook.com (2603:10a6:208:160::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Tue, 14 Apr
 2020 13:47:31 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::1d) by AM7PR02CA0013.outlook.office365.com
 (2603:10a6:20b:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Tue, 14 Apr 2020 13:47:31 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 14 Apr 2020 13:47:30 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Tue, 14 Apr 2020 13:47:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 62c0907afbdc7e40
X-CR-MTA-TID: 64aa7808
Received: from 9a99640b1180.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id DAD7CB87-2015-4625-B0C4-7DA69BA9DCEE.1;
        Tue, 14 Apr 2020 13:47:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a99640b1180.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Apr 2020 13:47:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lczVclKocjtdvFm8J+qBgxH3CNbT0DO26U/Fi5x48uhaq8eobHryIFqdbVGJvztLHwb6zFiVcnD4XxV6/fcOBzYuQ/xFX5jk2IPohBGwDNAJw8b6cfRSqNpCNS/TjVZdoVwmCdTa3m7ncdrJiPHrHjeOiel+NN0kF2xaQ9EhvLjfJvhs0f+ar72gX2jo9glA9qo75JY1ZDSZVe/9MOCytb4dplgi7YVVP7JUoIr5d56hTExERIfSHSz728a6Lv6hX07yKh4khZO8ldNqqjhUyDgsohVcf7wWQq9deWJzP6wUbmkohHoa6N62gmEABct/R+sy9bi9A0ictLjCF6B7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC7j1Zj4y5mIGXCP+MT8yqQBhySeisf48q0gLE5hvKQ=;
 b=N6RpR+Gx0WjMIYgNLT15y5AqPaMagr5CUaM5FwG/3IF5EbGpGP52jLdU2tUlRxgv4aNegt5FFxE9O0u43XWZBPRCbHgcj1LYPhO/cru/fhlDBB8vy95n8aRsl3R1C1vb1aReREuN+B1dvHbVGQcaCUivlIsJ6O5t8ok1+btDc+4u1VJd6WvYRJpxzEYc5Uh8p/65WWGNNn5bReQu/2XV1z9FI39RIpkZij1BmAgz4iL9gkp/NsT0naIPuJkNsmKx8bXJ/TVKp1UAsyX4knmZy7Nn1/YMdGpVgWiuFubzT99/4pCzfvkg7PVnJj6JJKmLVoHKZQaHRXBwLS9avgQ/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC7j1Zj4y5mIGXCP+MT8yqQBhySeisf48q0gLE5hvKQ=;
 b=N7hHaZrdBjcM4hhZlLDf4iVXCHOTAegsG+g4BYAydne1mpThFAp4/p1kSsjgojQ1wi2DvGbqEpaVuZb7KeTCdwSK+fMcUl6ZgPMB98r7xLGFcEAhUcFsevoqNciSLc5wrcMyQLC/VLVed4agbb1T/RZOnf7fljGFZSqfYVuXSYI=
Received: from AM6PR0502CA0064.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::41) by DB7PR08MB3465.eurprd08.prod.outlook.com
 (2603:10a6:10:50::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20; Tue, 14 Apr
 2020 13:47:20 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::a5) by AM6PR0502CA0064.outlook.office365.com
 (2603:10a6:20b:56::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.16 via Frontend
 Transport; Tue, 14 Apr 2020 13:47:20 +0000
Authentication-Results-Original: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2900.18 via Frontend Transport; Tue, 14 Apr 2020 13:47:19 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1415.2; Tue, 14 Apr
 2020 13:47:05 +0000
Received: from e123356-lin.trondheim.arm.com (10.40.16.105) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.1415.2 via Frontend
 Transport; Tue, 14 Apr 2020 13:47:04 +0000
From:   =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>
CC:     <orjan.eide@arm.com>, <anders.pedersen@arm.com>,
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
Date:   Tue, 14 Apr 2020 15:46:27 +0200
Message-ID: <20200414134629.54567-1-orjan.eide@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(26005)(109986005)(426003)(47076004)(86362001)(36756003)(336012)(7416002)(1076003)(81156014)(6666004)(2616005)(70586007)(7696005)(8676002)(54906003)(70206006)(186003)(2906002)(82740400003)(316002)(356005)(478600001)(8936002)(4326008)(81166007)(5660300002)(266003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bff94702-d3af-4052-e4f1-08d7e07a60d5
X-MS-TrafficTypeDiagnostic: DB7PR08MB3465:|AM0PR08MB5106:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5106FE6A1753EE6A4084F45690DA0@AM0PR08MB5106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0373D94D15
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OGuNZ9Sp55GW2uy07GFxMH/CEdnN8U6hHYJ+sLt2NUjAjZN2HCtqsI7/S3Vhl5dsxZdE9FXbQEOgLYb/C4XXB0dqEdKHCxh2O9zs+FmkbOx3QW9JNiuPWXw6S7aDBr8Rq4MnYfRGt+rW8zMoHZLSNmPjHtoDnf6wOtPmw5i9q99WSIsmO/xqi/jnIX/qMqBmpeLV7iLJ34r1g0JqyzsH0paK0Q/dPXXJo3IpzjJU3iQCETclb/5J65Ik53iHcMzcusdAjYNQ3jX272YxlquGpMXXC8ewtGcQ77jnmDwLhLcC/KWgkWJuGXIn2NarFqs+fckVG2F9z+KYfxc5dCEwTP+8zY/Xxg5FuLAHNS5CsGcKo4hXxyNikQbBBsf4rqM/XMO4YW/mtFSTfr4RGdMXc7RbBS+jsmgJ5TDk30t7mTjqoqFzo8eoJKjy4YhOaZu43gS5qOjR7pAjmfh10p5zYg8I1n0/gjFRHjVs+1GoIMCAIRvUFwXSarGR4D9U4Rdu2JHsm5CKqkGTWbz3/cDTP5bfBC4+4Ue7u8n5iFNMFOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Original-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=arm.com;
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(426003)(86362001)(82740400003)(26005)(478600001)(186003)(2906002)(26826003)(2616005)(109986005)(81166007)(81156014)(8936002)(70586007)(4326008)(6666004)(7696005)(450100002)(54906003)(8676002)(336012)(36906005)(316002)(70206006)(47076004)(1076003)(5660300002)(36756003)(266003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c68708c-7b33-4645-c6e1-08d7e07a5a24
X-Forefront-PRVS: 0373D94D15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQisQtbDqB8Fez7+TQy4LSDRmJxm7DD51aPRw307V6c3nIj46iCsdIXltkHsqvyRYcTCmOPuioGgRy5ei5GpqP6G4LpDCNczJ/UzoAxurlgy5+FuvZhHwHU3Q3T5X2nep+9rsz+sNmXsdmp8YwLXRvrnoSoV1Rq09vII2Hy487EjL4HTWaRrO/c+hihKRdxlL3QwYP3maHWvGKsBy96XBSmLimcdKk3dJgJ0YYbbtRXf7hloLPcoAoXAujycdkJcN2PHXIPPeESJOOdL9xfzK3yU8hFRrYieaWV5phJ90akffPwpWgkOBu/FSvGsiMGbzEn2mmd7oXgvB3sPRi/q3mbhOyPQwLGvTF2kkuHHchv52luWoc3O/pFZ8dr1qWe9LNYz5U5XyBQR1VNORGH4+faOXaJvm9s8x2oVRuizVzT4AdP4m1V+mM3uqN8su6O/tAXbA6cym0NA+o7aJNUlw8sAjGEKYryQ1gt/e+vfuL/JpIi2i5ZhXiM1t+lPfw2Fh/jc4leZAocjxbYlocno0c+2GCBdF4291aqTg1G3Z9o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 13:47:30.9995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff94702-d3af-4052-e4f1-08d7e07a60d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5106
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

Signed-off-by: =C3=98rjan Eide <orjan.eide@arm.com>
---
 drivers/staging/android/ion/ion.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

This seems to be part of a bigger issue where dma-buf exporters assume
that their dma-buf begin_cpu_access and end_cpu_access callbacks have a
certain guaranteed behavior, which isn't ensured by dma-buf core.

This patch fixes this in ion only, but it also needs to be fixed for
other exporters, either handled like this in each exporter, or in
dma-buf core before calling into the exporters.

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/io=
n/ion.c
index 38b51eace4f9..7b752ba0cb6d 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -173,6 +173,7 @@ struct ion_dma_buf_attachment {
        struct device *dev;
        struct sg_table *table;
        struct list_head list;
+       bool mapped:1;
 };

 static int ion_dma_buf_attach(struct dma_buf *dmabuf,
@@ -195,6 +196,7 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
        a->table =3D table;
        a->dev =3D attachment->dev;
        INIT_LIST_HEAD(&a->list);
+       a->mapped =3D false;

        attachment->priv =3D a;

@@ -231,6 +233,8 @@ static struct sg_table *ion_map_dma_buf(struct dma_buf_=
attachment *attachment,
                        direction))
                return ERR_PTR(-ENOMEM);

+       a->mapped =3D true;
+
        return table;
 }

@@ -238,6 +242,10 @@ static void ion_unmap_dma_buf(struct dma_buf_attachmen=
t *attachment,
                              struct sg_table *table,
                              enum dma_data_direction direction)
 {
+       struct ion_dma_buf_attachment *a =3D attachment->priv;
+
+       a->mapped =3D false;
+
        dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
 }

@@ -297,6 +305,8 @@ static int ion_dma_buf_begin_cpu_access(struct dma_buf =
*dmabuf,

        mutex_lock(&buffer->lock);
        list_for_each_entry(a, &buffer->attachments, list) {
+               if (!a->mapped)
+                       continue;
                dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
                                    direction);
        }
@@ -320,6 +330,8 @@ static int ion_dma_buf_end_cpu_access(struct dma_buf *d=
mabuf,

        mutex_lock(&buffer->lock);
        list_for_each_entry(a, &buffer->attachments, list) {
+               if (!a->mapped)
+                       continue;
                dma_sync_sg_for_device(a->dev, a->table->sgl, a->table->nen=
ts,
                                       direction);
        }
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
