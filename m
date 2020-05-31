Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFAD1E9AC0
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 00:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgEaWsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 18:48:31 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17396 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgEaWsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 18:48:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed433df0000>; Sun, 31 May 2020 15:46:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 31 May 2020 15:48:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 31 May 2020 15:48:30 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 31 May
 2020 22:48:29 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 31 May 2020 22:48:29 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.56.10]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ed4343d0000>; Sun, 31 May 2020 15:48:29 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 1/2] mm/gup: introduce pin_user_pages_unlocked
Date:   Sun, 31 May 2020 15:48:26 -0700
Message-ID: <20200531224827.769427-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531224827.769427-1-jhubbard@nvidia.com>
References: <20200531224827.769427-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590965215; bh=V53v56y9lJXy8Ev50du65kbxD+j1cmQc1YhH71s5Kv8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=OtxxSXSKgIPisVTVmn6pmBnG+uyjI9ccPbrXFSxcz+rpwSv3CFnLtIdjgxZxSSv2p
         5ks5OVP/8liP8Ad+e2VVOvJRaW0ctGiBqlegn/Nddg008DoU0xK+QBtWD6enAeS3iR
         NLE6UZpUXfQsHUiXRMRiAHKD3jw+v3ltspRBycmnMcq8AT6q22UNcAig/yL8rS5moz
         EKvyLMII8e0BxV1LIGrZo5ZKcrkq1WsvzWN2KI8AElOamFIxHoCkLForTeMcfZiOha
         UPiTGflB11+Rttp+fbJrz8IoNvXbsPm5XABDBtkW2ghMU25oxrzsBFHYSLbJ9M4NfS
         39k1p7v/16HCQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce pin_user_pages_unlocked(), which is nearly identical to the
get_user_pages_unlocked() that it wraps, except that it sets FOLL_PIN
and rejects FOLL_GET.

As with other pairs of get_user_pages*() and pin_user_pages() API calls,
it's prudent to assert that FOLL_PIN is *not* set in the
get_user_pages*() call, so add that as part of this.

Cc: Souptick Joarder <jrdr.linux@gmail.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f3fe7371855c..a84befdb54b2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1713,6 +1713,8 @@ long get_user_pages_locked(unsigned long start, unsig=
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
index 87a6a59fe667..8ae5d09adb6b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2030,6 +2030,12 @@ long get_user_pages_unlocked(unsigned long start, un=
signed long nr_pages,
 	 */
 	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
 		return -EINVAL;
+	/*
+	 * FOLL_PIN must only be set internally by the pin_user_pages*() APIs,
+	 * never directly by the caller, so enforce that:
+	 */
+	if (WARN_ON_ONCE(gup_flags & FOLL_PIN))
+		return -EINVAL;
=20
 	down_read(&mm->mmap_sem);
 	ret =3D __get_user_pages_locked(current, mm, start, nr_pages, pages, NULL=
,
@@ -2939,3 +2945,20 @@ long pin_user_pages(unsigned long start, unsigned lo=
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
--=20
2.26.2

