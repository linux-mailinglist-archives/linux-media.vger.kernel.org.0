Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4DFC10871D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 05:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfKYEUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 23:20:35 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9493 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfKYEU0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 23:20:26 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ddb56800001>; Sun, 24 Nov 2019 20:20:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 24 Nov 2019 20:20:15 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 24 Nov 2019 20:20:15 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 04:20:14 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Nov 2019 04:20:14 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ddb567e0005>; Sun, 24 Nov 2019 20:20:14 -0800
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, <bpf@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kvm@vger.kernel.org>,
        <linux-block@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-fsdevel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <netdev@vger.kernel.org>,
        <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 15/19] media/v4l2-core: pin_user_pages (FOLL_PIN) and put_user_page() conversion
Date:   Sun, 24 Nov 2019 20:20:07 -0800
Message-ID: <20191125042011.3002372-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125042011.3002372-1-jhubbard@nvidia.com>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574655617; bh=sXkMwo6nCTbLEEe6A0fE3HZE6drkGcT2bf/xg2miV08=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ILPjbz1Xf3Zm/5FgHxnPG5nT64CowMsN39dH/zsJbmSC+gSq0pOEijvDeHvqNqAXh
         oOIzbUT2eNgFVBIvTz/vca/orQuBXvMnsG0eRXnqAJva1FrU4RzL7XxnmLXDCVDwd0
         18ROqEaoC2ooCNj++I8ad4kja3BSE1HD3uXQ18+gCodv7jb6ycYdyljTrNcgWkR4qQ
         BpUpI0g/QO0DVDo6ZlUo3i48gL6AWVx6oK9JySs1JfedR9sY3RoHVu3byZwRpLHXWx
         Wy2a8ZeLni8nZThYfSFuIAiCX0O3OpjaWAQeEcuy/tIeL8KBlgTNS5sEzkFzeshUj6
         9AOASKks+OauQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1. Change v4l2 from get_user_pages() to pin_user_pages().

2. Because all FOLL_PIN-acquired pages must be released via
put_user_page(), also convert the put_page() call over to
put_user_pages_dirty_lock().

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2=
-core/videobuf-dma-sg.c
index 28262190c3ab..162a2633b1e3 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -183,12 +183,12 @@ static int videobuf_dma_init_user_locked(struct video=
buf_dmabuf *dma,
 	dprintk(1, "init user [0x%lx+0x%lx =3D> %d pages]\n",
 		data, size, dma->nr_pages);
=20
-	err =3D get_user_pages(data & PAGE_MASK, dma->nr_pages,
+	err =3D pin_user_pages(data & PAGE_MASK, dma->nr_pages,
 			     flags | FOLL_LONGTERM, dma->pages, NULL);
=20
 	if (err !=3D dma->nr_pages) {
 		dma->nr_pages =3D (err >=3D 0) ? err : 0;
-		dprintk(1, "get_user_pages: err=3D%d [%d]\n", err,
+		dprintk(1, "pin_user_pages: err=3D%d [%d]\n", err,
 			dma->nr_pages);
 		return err < 0 ? err : -EINVAL;
 	}
@@ -349,11 +349,8 @@ int videobuf_dma_free(struct videobuf_dmabuf *dma)
 	BUG_ON(dma->sglen);
=20
 	if (dma->pages) {
-		for (i =3D 0; i < dma->nr_pages; i++) {
-			if (dma->direction =3D=3D DMA_FROM_DEVICE)
-				set_page_dirty_lock(dma->pages[i]);
-			put_page(dma->pages[i]);
-		}
+		put_user_pages_dirty_lock(dma->pages, dma->nr_pages,
+					  dma->direction =3D=3D DMA_FROM_DEVICE);
 		kfree(dma->pages);
 		dma->pages =3D NULL;
 	}
--=20
2.24.0

