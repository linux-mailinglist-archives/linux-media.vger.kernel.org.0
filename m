Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A69EA6C7
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 23:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbfJ3Wul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 18:50:41 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5340 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfJ3Wt7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 18:49:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dba139c0000>; Wed, 30 Oct 2019 15:50:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 30 Oct 2019 15:49:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:57 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:57 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 30 Oct 2019 22:49:56 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dba13920000>; Wed, 30 Oct 2019 15:49:55 -0700
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
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 18/19] mm/gup: remove support for gup(FOLL_LONGTERM)
Date:   Wed, 30 Oct 2019 15:49:29 -0700
Message-ID: <20191030224930.3990755-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1572475804; bh=6eCoZ62YVqPRMh6hmCwd736iryX7QnOeiQKLTn0GI5E=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=IkuRtYB4d3kOJrZ+EENymTxZvsMF+ZD6tsSf6fZglZMnwtzOZ73h77ci85UZpFmUW
         fQmmlzdC8n8mJLqJjmlbdC3DO4uaZw0YHORB/HafxMGpmFoCkTJ32qpfQg459tX+YK
         +Gf494GooD+nQM+FC8NLkVHrkhEl1KDPfLs3huMk5X62opwbgjDWtnHAEEMzBGnI99
         TD+I6HBpEKDObno8f3eOMuEVqd6qK/ifgd+derpKD20XS8ykxtZtU6JDOQRPdAIVXL
         nhlxBDkBgZJpnJUcnjsjfG8G3sDLivqNtRrrO3BSwLQ5qluS/cq192ATGynOsvcFqk
         qSCcSKzrPnw1A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that all other kernel callers of get_user_pages(FOLL_LONGTERM)
have been converted to pin_longterm_pages(), lock it down:

1) Add an assertion to get_user_pages(), preventing callers from
   passing FOLL_LONGTERM (in addition to the existing assertion that
   prevents FOLL_PIN).

2) Remove the associated GUP_LONGTERM_BENCHMARK test.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c                                   | 8 ++++----
 mm/gup_benchmark.c                         | 9 +--------
 tools/testing/selftests/vm/gup_benchmark.c | 7 ++-----
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e51b3820a995..9a28935a2cb1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1744,11 +1744,11 @@ long get_user_pages(unsigned long start, unsigned l=
ong nr_pages,
 		struct vm_area_struct **vmas)
 {
 	/*
-	 * As detailed above, FOLL_PIN must only be set internally by the
-	 * pin_user_page*() and pin_longterm_*() APIs, never directly by the
-	 * caller, so enforce that with an assertion:
+	 * As detailed above, FOLL_PIN and FOLL_LONGTERM must only be set
+	 * internally by the pin_user_page*() and pin_longterm_*() APIs, never
+	 * directly by the caller, so enforce that with an assertion:
 	 */
-	if (WARN_ON_ONCE(gup_flags & FOLL_PIN))
+	if (WARN_ON_ONCE(gup_flags & (FOLL_PIN | FOLL_LONGTERM)))
 		return -EINVAL;
=20
 	return __gup_longterm_locked(current, current->mm, start, nr_pages,
diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 2bb0f5df4803..de6941855b7e 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -6,7 +6,7 @@
 #include <linux/debugfs.h>
=20
 #define GUP_FAST_BENCHMARK	_IOWR('g', 1, struct gup_benchmark)
-#define GUP_LONGTERM_BENCHMARK	_IOWR('g', 2, struct gup_benchmark)
+/* Command 2 has been deleted. */
 #define GUP_BENCHMARK		_IOWR('g', 3, struct gup_benchmark)
 #define PIN_FAST_BENCHMARK	_IOWR('g', 4, struct gup_benchmark)
 #define PIN_LONGTERM_BENCHMARK	_IOWR('g', 5, struct gup_benchmark)
@@ -28,7 +28,6 @@ static void put_back_pages(int cmd, struct page **pages, =
unsigned long nr_pages)
=20
 	switch (cmd) {
 	case GUP_FAST_BENCHMARK:
-	case GUP_LONGTERM_BENCHMARK:
 	case GUP_BENCHMARK:
 		for (i =3D 0; i < nr_pages; i++)
 			put_page(pages[i]);
@@ -94,11 +93,6 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 			nr =3D get_user_pages_fast(addr, nr, gup->flags & 1,
 						 pages + i);
 			break;
-		case GUP_LONGTERM_BENCHMARK:
-			nr =3D get_user_pages(addr, nr,
-					    (gup->flags & 1) | FOLL_LONGTERM,
-					    pages + i, NULL);
-			break;
 		case GUP_BENCHMARK:
 			nr =3D get_user_pages(addr, nr, gup->flags & 1, pages + i,
 					    NULL);
@@ -157,7 +151,6 @@ static long gup_benchmark_ioctl(struct file *filep, uns=
igned int cmd,
=20
 	switch (cmd) {
 	case GUP_FAST_BENCHMARK:
-	case GUP_LONGTERM_BENCHMARK:
 	case GUP_BENCHMARK:
 	case PIN_FAST_BENCHMARK:
 	case PIN_LONGTERM_BENCHMARK:
diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/sel=
ftests/vm/gup_benchmark.c
index c5c934c0f402..5ef3cf8f3da5 100644
--- a/tools/testing/selftests/vm/gup_benchmark.c
+++ b/tools/testing/selftests/vm/gup_benchmark.c
@@ -15,7 +15,7 @@
 #define PAGE_SIZE sysconf(_SC_PAGESIZE)
=20
 #define GUP_FAST_BENCHMARK	_IOWR('g', 1, struct gup_benchmark)
-#define GUP_LONGTERM_BENCHMARK	_IOWR('g', 2, struct gup_benchmark)
+/* Command 2 has been deleted. */
 #define GUP_BENCHMARK		_IOWR('g', 3, struct gup_benchmark)
=20
 /*
@@ -46,7 +46,7 @@ int main(int argc, char **argv)
 	char *file =3D "/dev/zero";
 	char *p;
=20
-	while ((opt =3D getopt(argc, argv, "m:r:n:f:abctTLUuwSH")) !=3D -1) {
+	while ((opt =3D getopt(argc, argv, "m:r:n:f:abctTUuwSH")) !=3D -1) {
 		switch (opt) {
 		case 'a':
 			cmd =3D PIN_FAST_BENCHMARK;
@@ -72,9 +72,6 @@ int main(int argc, char **argv)
 		case 'T':
 			thp =3D 0;
 			break;
-		case 'L':
-			cmd =3D GUP_LONGTERM_BENCHMARK;
-			break;
 		case 'U':
 			cmd =3D GUP_BENCHMARK;
 			break;
--=20
2.23.0

