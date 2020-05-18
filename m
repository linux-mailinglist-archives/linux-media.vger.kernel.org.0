Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10671D6E90
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 03:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgERBWL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 May 2020 21:22:11 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17575 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgERBWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 May 2020 21:22:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec1e2ea0000>; Sun, 17 May 2020 18:20:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 17 May 2020 18:21:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 17 May 2020 18:21:59 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 01:21:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 18 May 2020 01:21:59 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.175]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec1e3370000>; Sun, 17 May 2020 18:21:59 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 0/2] mm/gup, media/ivtv: introduce pin_user_pages_unlocked
Date:   Sun, 17 May 2020 18:21:55 -0700
Message-ID: <20200518012157.1178336-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589764842; bh=UKuuw28idvbuk9+JyJWn1HzG2Q0RnTnMVtU5hSmRMG4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=FkE9zSIv1hkK/DzpQp1IN5hwESe78ZJonRfsEtsMWei5LWN6Bx1vKgHaaTYkyleE4
         r/CKasFjc83PUfYVSQ23U7edCIuZtwRXlBfTCuP4jEChBOzoCrwo4dpqWdVgiajEAz
         G1ydrOhnQ4L+Cyn8l767TURR5zZmMMb6wCXoRIkuVBc9XIXyDKuKo9XcgrxvwNAzk7
         P2Y9Vkb0kc+OPssuN8c0CE6XEt95anhC1vSNZzpe7UYjCqLCL0U64C3TMJSI8Z6lYn
         CsOJ12c4enptaTlurTh2a7Xk1diiTU+YfFnf4219tPRwIPwACv7ZAvstv263w1Bnfs
         Z6IMHkvmmn8mw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I suppose these should go up through Andrew's linux-mm tree, due to
adding a new pin_user_pages*() variant to gup.c. However, it would be
nice if anyone from IVTV or linux-media could provide some run time
testing, maybe even a Tested-by.

Note that I have only compile-tested these patches, although that does
also include cross-compiling for half a dozen arches.

John Hubbard (2):
  mm/gup: introduce pin_user_pages_unlocked
  ivtv: convert get_user_pages() --> pin_user_pages()

 drivers/media/pci/ivtv/ivtv-udma.c | 19 ++++++-------------
 drivers/media/pci/ivtv/ivtv-yuv.c  | 17 ++++++-----------
 drivers/media/pci/ivtv/ivtvfb.c    |  4 ++--
 include/linux/mm.h                 |  2 ++
 mm/gup.c                           | 17 +++++++++++++++++
 5 files changed, 33 insertions(+), 26 deletions(-)


base-commit: b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
--=20
2.26.2

