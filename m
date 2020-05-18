Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E731D6E91
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 03:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgERBWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 May 2020 21:22:12 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17142 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgERBWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 May 2020 21:22:01 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec1e2aa0001>; Sun, 17 May 2020 18:19:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 17 May 2020 18:21:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 17 May 2020 18:21:59 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 01:21:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 18 May 2020 01:21:59 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.175]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec1e3370001>; Sun, 17 May 2020 18:21:59 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 1/2] mm/gup: introduce pin_user_pages_unlocked
Date:   Sun, 17 May 2020 18:21:56 -0700
Message-ID: <20200518012157.1178336-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518012157.1178336-1-jhubbard@nvidia.com>
References: <20200518012157.1178336-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589764778; bh=+Bd2dKwO1m4xCknqEnntHu5ZR7ZzO/a9Yy+seiDwYQk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=qe8apbDxfUOL34853vKL5Pm+EM2eEzJsyeg7TK3MuFDBhyRG+KGRXrfIauwl9kbnd
         EmVvRzb6mGS5pB2ULYsghn/hyU+gebu4Pp5pnV2Wts3D8L9LcSKErKF2UKsYujF2Nm
         ckthj0MxtSyWUcabjdBEafMngtKanymPa8HEh9J77CLEDvdtTJsstct6wlz7pqEEfW
         nYhEvXxAUiyGKHHIZ7F8RGZVsseT35PmooJKRPSH+h6gO9FK3ql5Ci8niH2a0WVQL4
         hH0G2nciKNm0jpEWVSZ+/uOKp3kNxLfdba5Pg7NwIKXwTNJnon+5wJ2U81Xci+1kzL
         bMPhYFJb+cIXw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce pin_user_pages_unlocked(), which is nearly identical to the
get_user_pages_unlocked() that it wraps, except that it sets FOLL_PIN
and rejects FOLL_GET.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5a323422d783..a5594ac9ebe3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1702,6 +1702,8 @@ long get_user_pages_locked(unsigned long start, unsig=
ned long nr_pages,
 		    unsigned int gup_flags, struct page **pages, int *locked);
 long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 		    struct page **pages, unsigned int gup_flags);
+long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
+		    struct page **pages, unsigned int gup_flags);
=20
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
diff --git a/mm/gup.c b/mm/gup.c
index 87a6a59fe667..50cd9323efff 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2939,3 +2939,20 @@ long pin_user_pages(unsigned long start, unsigned lo=
ng nr_pages,
 				     pages, vmas, gup_flags);
 }
 EXPORT_SYMBOL(pin_user_pages);
+
+/*
+ * pin_user_pages_unlocked() is the FOLL_PIN variant of
+ * get_user_pages_unlocked(). Behavior is the same, except that this one s=
ets
+ * FOLL_PIN and rejects FOLL_GET.
+ */
+long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
+			     struct page **pages, unsigned int gup_flags)
+{
+	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
+	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
+		return -EINVAL;
+
+	gup_flags |=3D FOLL_PIN;
+	return get_user_pages_unlocked(start, nr_pages, pages, gup_flags);
+}
+EXPORT_SYMBOL(pin_user_pages_unlocked);

base-commit: b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
prerequisite-patch-id: 0496235d2f0b29f75b9835e63a6923ddad6d0260
prerequisite-patch-id: 2711b9393a74cd0e1fcf48befea3618f7bb1ca9e
prerequisite-patch-id: 95e2521748b3058710fb2a161b2c76389644665b
prerequisite-patch-id: eeae300399f69db2cd61535b40c1f1ee1929195a
prerequisite-patch-id: 9ed26cdb071ab084a204c85a08986806d6bae877
--=20
2.26.2

