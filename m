Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3D51D6E2D
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 01:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgEQX4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 May 2020 19:56:22 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1781 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgEQX4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 May 2020 19:56:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec1cf190000>; Sun, 17 May 2020 16:56:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 17 May 2020 16:56:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 17 May 2020 16:56:22 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 17 May
 2020 23:56:21 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 17 May 2020 23:56:21 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.175]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec1cf250000>; Sun, 17 May 2020 16:56:21 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     LKML <linux-kernel@vger.kernel.org>
CC:     John Hubbard <jhubbard@nvidia.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH 0/2] rapidio: convert to pin_user_pages(), plus a small fix
Date:   Sun, 17 May 2020 16:56:18 -0700
Message-ID: <20200517235620.205225-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589759769; bh=WygXQq7COfHXYUNFNVJbqoqXk/fDsRWGbCYJDmciCZY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=Av50MoMnmPmDKeqjGTkSknWAg9YKnSYXVgyvUplqSqBVVUKJ09SzcIUYuWgjIJBOR
         m8s6E8CQ6ZXKCzJN3DLPaa4MeCwhA4vh+nD+AuPBOKEOmVff3Frdr9UT0BF01afKt/
         NF5/b82MzHbBa2kCyS6tmA52FKtEgN9JD4Ftkk8+vish81pT9ZsNV05BsLy36scvTh
         8XRn683/8kwOsBEJRJarzv+gDVbAGm7u6IqDQDAARzeR9r3oC5jLaVldKkDd6WvPUh
         MZz3dj9xULeBnqlOBcZ2x0UxXlMcg9TnNd7zvEWOfattE0hX/bizEa/aU6KwL6SWpp
         NakKVu9vCcJEw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While converting rapidio from get_user_pages() to pin_user_pages(),
I noticed a small problem in the error handling, so that is fixed
first. As such, the fix has -stable on CC, and can be separately
applied.

Note that I have only compile-tested these patches, although that does
also include cross-compiling for half a dozen arches.

John Hubbard (2):
  rapidio: fix an error in get_user_pages_fast() error handling
  rapidio: convert get_user_pages() --> pin_user_pages()

 drivers/rapidio/devices/rio_mport_cdev.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

Cc: Matt Porter <mporter@kernel.crashing.org>
Cc: Alexandre Bounine <alex.bou9@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-media@vger.kernel.org

John Hubbard (2):
  rapidio: fix an error in get_user_pages_fast() error handling
  rapidio: convert get_user_pages() --> pin_user_pages()

 drivers/rapidio/devices/rio_mport_cdev.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)


base-commit: 5a9ffb954a3933d7867f4341684a23e008d6839b
--=20
2.26.2

