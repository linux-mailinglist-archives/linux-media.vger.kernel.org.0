Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB7C224B7D
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 15:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgGRN0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 09:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgGRN0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 09:26:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A479C0619D2;
        Sat, 18 Jul 2020 06:26:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so6636085plo.3;
        Sat, 18 Jul 2020 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=VqTT9IDO19+ZA5nv21Pkcu4zf3MDPeHk42EblBrQa6o=;
        b=vMdwLDXf4i+qqdF9QRcnYNvVqSlfE3UZbAjpCea2Y0sRSKi72vS5GeC+Jx9gWKRa+P
         Zld5FgXZylg48gUhK2zNTIa48Etg3GM8Ss0KeI8JxhyArKdjQ+jnXhhiobotZFvkQMMg
         PoyNyG4/tb/bwlrMgc7qBvaJkIdOK2fi1aVNzOCQXPMj+eP/OyuD/q4rtehnQbetlCyY
         US+7SZ5B9pYQPPs3oHQIsMucKEvn2TlDkXcngQTV+Fljq9EWBcOYRohnVyGRH0tQA5RH
         cP1qsp0exsNvg2TANfA2mfZfmZG5kxD5ClubDHmFMMfE20zPZ+y0hlaaLmXKi96LL6fi
         QzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=VqTT9IDO19+ZA5nv21Pkcu4zf3MDPeHk42EblBrQa6o=;
        b=UTkTegQy1dGW49lGEW2350sqmu8XgiGHtky4GRWqaGyjkTN4JIkceeljGQEQMrzdW/
         xfVXPPuUCp2z8nC0IwyWGALh9RSJFqy9ChH2m3rMRvUge68IGr+Mtby+8AMazkcmdlqk
         +WM2QTaz5WsJxoipchdGVLvORCz4IvUQl6diTFRmhMyh5wvPuc0CR10x7gBW71jST6M2
         k2FEJaHP58FO2rSmu0Wh7KR/zGktKm/Wh4bffeeE4F5luwyi8hyenc0+zMZyQJe6IW78
         mcm9wM7JRkOrM40xis3AX7R7naUyZpGQrWO+Y0l6rRGRYkO1D4VyKes/beW+l2wEaNZ3
         7GFA==
X-Gm-Message-State: AOAM531LhBBwGBdKqHlrdd1M/kpScA7Ss2kejSkZs09DMYJOYtq7n4PZ
        e7H1QqCI4jo5lpC0mZrJZCo=
X-Google-Smtp-Source: ABdhPJzeybE3KLlfLyt/wu1z/T750bC+P9qMn09ZZOMxoP6gjGB9PqzQN9GYsQPNUZIx73shhE86AQ==
X-Received: by 2002:a17:902:8a93:: with SMTP id p19mr10489452plo.275.1595078806642;
        Sat, 18 Jul 2020 06:26:46 -0700 (PDT)
Received: from blackclown ([103.88.82.25])
        by smtp.gmail.com with ESMTPSA id r6sm10381569pgn.65.2020.07.18.06.26.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jul 2020 06:26:45 -0700 (PDT)
Date:   Sat, 18 Jul 2020 18:56:32 +0530
From:   Suraj Upadhyay <usuraj35@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Replace depracated MSI API.
Message-ID: <20200718132632.GA11527@blackclown>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace depracated pci_enable_msi with pci_alloc_irq_vectors.
And as a result modify how the returned value is handled.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/sta=
ging/media/atomisp/pci/atomisp_v4l2.c
index d36809a0182c..b824c6f78a9c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1735,8 +1735,8 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	pci_set_master(dev);
 	pci_set_drvdata(dev, isp);
=20
-	err =3D pci_enable_msi(dev);
-	if (err) {
+	err =3D pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
+	if (err < 0) {
 		dev_err(&dev->dev, "Failed to enable msi (%d)\n", err);
 		goto enable_msi_fail;
 	}
--=20
2.17.1


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8S+IcACgkQ+gRsbIfe
747Fmg/+Iujb0Dr/xwic1iWp0UM+FI1nN4E28i0EBw7trAm3ocK1bz9awuN2ieqf
7jZKBvoBdYbCVdTkPqPpneXP9JAT/Gwv5JyUtuqk8TUyau5i8MUhjjuBf3LCdSmn
UnoEoszx3VuNXp0n8jXL2TD/Od2CR0TAAG7/iGVdkHsQ5CAOKNk8MLCAz27DK7Zf
NVfF+CqczCzrJDH2D7Ubyrv34bE2i42qt1TTHeSe26kdc3Wc0runexaU5Gzntdtl
yO/5qxkbD6zFqrshu9GGv17Xa8RWi3leuPsoF4UWuKZHHUWxKSFmEy/dvbOlgAB2
kDGDtaJgTo3POGjJ6eb2x2Pexxq2pc5uBtjve2l5FI1xcEOS2tltYjkvApg03Bmm
wjAuEx/VLaHc24uU8CCQWRQCQRxfEBNH/sHgr67ZwZIvnaQmtiL8ufNatfiGY08K
Bzr5XwfoZS4kOeApvomqY9qXOjwn9FQ6HS8lLpFOXgSYn/HV065NzJORNMzM4xGQ
XLpCoq8ae8NQI3H5x/pPLG3jSLlhpNssynTXBgR+3QpDPM85xSIDDgL+JI4fQkti
z0c4bdDppEz3w4+QNQtT6OuTRtVniRdeQLa2QmCAwzGort1stDX9P47cqtZ5k3wz
pRTfmv7w4IcHpnhMiLcwHbrSzaqNmQ6FmFHIaV13kG4W7iUJld8=
=aeBi
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
