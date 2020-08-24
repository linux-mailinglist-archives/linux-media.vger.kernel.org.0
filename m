Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8062507E1
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 20:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgHXSgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 14:36:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3053 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgHXSgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 14:36:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4408ad0000>; Mon, 24 Aug 2020 11:36:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 11:36:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 11:36:43 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Aug
 2020 18:36:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Aug 2020 18:36:43 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.58.8]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4408ba0007>; Mon, 24 Aug 2020 11:36:42 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     <jens.wiklander@linaro.org>
CC:     <arm@kernel.org>, <jhubbard@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <olof@lixom.net>, <soc@kernel.org>,
        <tee-dev@lists.linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2] tee: convert convert get_user_pages() --> pin_user_pages()
Date:   Mon, 24 Aug 2020 11:36:41 -0700
Message-ID: <20200824183641.632126-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598294189; bh=z82gApoeMO2LnErU5mpg0j+Kb/ttabmSFcmdgse888w=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=iVS8/GaDU9zmT9vo7ZZLTFMXFYqgCxX40+piNePuEsBesRbJOWSE/xX0l4lnN63zP
         rNulwOpHj0jxO0UYPRpWWnbbpBRRtjZ7Ad2Pr0Lr6Td2u5c4uA8uU/k3j/5ATc7Ldl
         ja2qEbIIh2G8Y00MsTl++oOV4QF+2L8NxS/wYDSAu2cOMojYwGP7fRx8PV1S+PPhJf
         eMwcpYjy4wLfip8pV0ZTrqAxTpQUf9P82fZY4js6G6bozNcuy7tmm5Q/Qm/FKQkGgz
         bn8l+gIiliISNvEyIeLS1tvUTztwBZWDlm9e7/nwvteVcBcutQNfuKhQ6LX2q0j+XR
         LrbSFl0y4fPnQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code was using get_user_pages*(), in a "Case 2" scenario
(DMA/RDMA), using the categorization from [1]. That means that it's
time to convert the get_user_pages*() + put_page() calls to
pin_user_pages*() + unpin_user_pages() calls.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Cc: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: tee-dev@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

OK, this should be indentical to v1 [1], but now rebased against
Linux 5.9-rc2.

As before, I've compile-tested it again with a cross compiler, but that's
the only testing I'm set up for with CONFIG_TEE.

[1] https://lore.kernel.org/r/20200519051850.2845561-1-jhubbard@nvidia.com

thanks,
John Hubbard
NVIDIA

 drivers/tee/tee_shm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 827ac3d0fea9..3c29e6c3ebe8 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -32,16 +32,13 @@ static void tee_shm_release(struct tee_shm *shm)
=20
 		poolm->ops->free(poolm, shm);
 	} else if (shm->flags & TEE_SHM_REGISTER) {
-		size_t n;
 		int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, shm);
=20
 		if (rc)
 			dev_err(teedev->dev.parent,
 				"unregister shm %p failed: %d", shm, rc);
=20
-		for (n =3D 0; n < shm->num_pages; n++)
-			put_page(shm->pages[n]);
-
+		unpin_user_pages(shm->pages, shm->num_pages);
 		kfree(shm->pages);
 	}
=20
@@ -228,7 +225,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ct=
x, unsigned long addr,
 	}
=20
 	if (flags & TEE_SHM_USER_MAPPED) {
-		rc =3D get_user_pages_fast(start, num_pages, FOLL_WRITE,
+		rc =3D pin_user_pages_fast(start, num_pages, FOLL_WRITE,
 					 shm->pages);
 	} else {
 		struct kvec *kiov;
@@ -292,16 +289,13 @@ struct tee_shm *tee_shm_register(struct tee_context *=
ctx, unsigned long addr,
 	return shm;
 err:
 	if (shm) {
-		size_t n;
-
 		if (shm->id >=3D 0) {
 			mutex_lock(&teedev->mutex);
 			idr_remove(&teedev->idr, shm->id);
 			mutex_unlock(&teedev->mutex);
 		}
 		if (shm->pages) {
-			for (n =3D 0; n < shm->num_pages; n++)
-				put_page(shm->pages[n]);
+			unpin_user_pages(shm->pages, shm->num_pages);
 			kfree(shm->pages);
 		}
 	}
--=20
2.28.0

