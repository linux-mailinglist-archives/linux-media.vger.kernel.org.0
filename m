Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5203F1E9ABF
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 00:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgEaWsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 18:48:30 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17369 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgEaWsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 18:48:30 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed433e80000>; Sun, 31 May 2020 15:47:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 31 May 2020 15:48:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 31 May 2020 15:48:29 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 31 May
 2020 22:48:29 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 31 May 2020 22:48:29 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.56.10]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ed4343c0000>; Sun, 31 May 2020 15:48:28 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 0/2] mm/gup, media/ivtv: introduce pin_user_pages_unlocked
Date:   Sun, 31 May 2020 15:48:25 -0700
Message-ID: <20200531224827.769427-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590965224; bh=aOt8sW2DbTQ7aWHqj2at43KUN0KLfkheGWFM9aoSfBc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=orGjsQX7/GZyhlyjMwLf6Gd8VmiPPfC+bmYyMyV+FSkk4dVzKy+xRoyEt1OSADwaw
         PFmiV/6Mcm94xUmcAFZgD/UlzH6KxvvtNeLA3CW8XwHodmh+CSAo9V0juitULojMXk
         syQe5LWa2ICiie+HOEQY5dwPEwDG3MAIRfAW4POeFqeDT6AdNbCiTZfCaYv57CsjJl
         6mMHbnOCJVKHjFIY+nlKYDOYTfmRshDZ9nzGhGTMFbYrlrYzr0YFPSkDWn2tZN3Fu0
         ADmc+VAtW4CIisdR3lfvJ0UdS/bgk3vKecEyMWaBW1cs9atrR5ZryEKatflzXDfhk/
         Eca4Z28vDG1+Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Here is a v2 that includes a small change that follows from Souptick's
review of another very similar patchset (that added
pin_user_pages_locked()) [1].

This applies on top of today's linux.git (5.7-rc7+).

Changes since v1: added an assert-and-return to the corresponding
get_user_pages_unlocked() call, to keep out any externally set
FOLL_PIN flag.

These patches are getting merged via Andrew's linux-mm tree, due to
adding a new pin_user_pages*() variant to gup.c. However, it would be
nice if anyone from IVTV or linux-media could provide some run time
testing, maybe even a Tested-by.

I've run this patchset through non-destructive xfstests, and a few
other things such as LTP. However, I'm not set up for IVTV specific
testing.

[1] https://lore.kernel.org/r/d11d52f8-d54c-bb45-bde9-198235a03921@nvidia.c=
om


John Hubbard (2):
  mm/gup: introduce pin_user_pages_unlocked
  ivtv: convert get_user_pages() --> pin_user_pages()

 drivers/media/pci/ivtv/ivtv-udma.c | 19 ++++++-------------
 drivers/media/pci/ivtv/ivtv-yuv.c  | 17 ++++++-----------
 drivers/media/pci/ivtv/ivtvfb.c    |  4 ++--
 include/linux/mm.h                 |  2 ++
 mm/gup.c                           | 23 +++++++++++++++++++++++
 5 files changed, 39 insertions(+), 26 deletions(-)


base-commit: bdc48fa11e46f867ea4d75fa59ee87a7f48be144
--=20
2.26.2

