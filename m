Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C88224B8F
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 15:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgGRNcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 09:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgGRNcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 09:32:54 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01C4C0619D2;
        Sat, 18 Jul 2020 06:32:54 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b92so7691439pjc.4;
        Sat, 18 Jul 2020 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=GX7yez5X9ql9EcvciXmb6Gd1L93T6OzAX6ibX57rbPQ=;
        b=ZY3Y/FC1Lwnkm6dQkh4u+0S0oXj0z4ncjsGsOMNjCdooJTh65GqHkedkCNP81WXS98
         n2ejrZ8T8GFdCfiMQXNFXjwsTGbvk05p8Wmu+378uO1ilYuJ7zFsk/V0XU+haEgynerR
         m5ot6W91v/QS0qoRXMS8C610RtIabaGvxd5X60icmDFmh6w4VqkIBZngSYyJn5IvxwDD
         6Mpoklmvj44ICRM+SpKXWJ1fsuusy127z+EsEBnD+zVfe1gzP/RWMOQUnkMrgDzV0i8Z
         459I+EtxMpt+KZ+mWMOGkxXjmXUk1k3oZnde42iH+ePyxQraB5+EQhtFERqOiGHAOl+0
         /cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GX7yez5X9ql9EcvciXmb6Gd1L93T6OzAX6ibX57rbPQ=;
        b=pVrgWJphcFVYPplPHwJ8Pcsq+9dHBuEYpFOAk0cQA0mb7xwqGs1sibWo9zE/ZwGAyQ
         RK3rc2EPmt6DaHlRT/AS48QkFKnWcFXpsB3pB22niT9coEeR44Q0JXTF079v85MCdPdW
         taEm2jT0JgTRFpOnXWkXWbUA9ZpI9BOJbgG4HdmJ2Qb+3WdZkAFL0wshxVaPCn01rQFn
         4JWr9Y8ukIhAzlLPC9ik1/7eKagAYbSCAAyLrTmKgHQW04BaPg25RtD/dl2kmJ2e+P5j
         UhyUyDVXHbbrMRdO2hTenwVmzyJxTQJ3WCjWM6O2jfqOe8W+1aP81ouOyHr738zQ839F
         Dm3w==
X-Gm-Message-State: AOAM53306L970Oai4+Qmt4nvDIkmApBhE7M/aw24Pm88wmCJ2Tcm2LQY
        x5dXHY+vjzxktSGWxE7B7/o=
X-Google-Smtp-Source: ABdhPJwyHspTs0owbnia19HlErjk8ONGVAAjGQH4tbwAhB81gov0I2Nas4/RWujZDESmokW6cBD3Tw==
X-Received: by 2002:a17:90a:14a5:: with SMTP id k34mr15218415pja.37.1595079174064;
        Sat, 18 Jul 2020 06:32:54 -0700 (PDT)
Received: from blackclown ([103.88.82.25])
        by smtp.gmail.com with ESMTPSA id 137sm10722296pgg.72.2020.07.18.06.32.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jul 2020 06:32:53 -0700 (PDT)
Date:   Sat, 18 Jul 2020 19:02:38 +0530
From:   Suraj Upadhyay <usuraj35@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: media: ipu3: Replace depracated MSI API.
Message-ID: <20200718133238.GA11982@blackclown>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace depracated psi_enable_msi with pci_alloc_irq_vectors.
And as a result modify how the returned value is handled.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/media/ipu3/ipu3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3=
/ipu3.c
index ee1bba6bdcac..54690e7442be 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -602,9 +602,9 @@ static irqreturn_t imgu_isr(int irq, void *imgu_ptr)
 static int imgu_pci_config_setup(struct pci_dev *dev)
 {
 	u16 pci_command;
-	int r =3D pci_enable_msi(dev);
+	int r =3D pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
=20
-	if (r) {
+	if (r < 0) {
 		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
 		return r;
 	}
--=20
2.17.1


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8S+fYACgkQ+gRsbIfe
746prw/8C/HY3bZaEpdYpHHSDI6ZZC1gsQki6rnqZBb3KYtGG9YXeNOAxs64ddZa
vV+ZFo4WNxCeR0tSIEsFbDb6XnVAg6yFWrnVfOjmjkOYMYMyLLBXLYadmH24TOPb
Ty00ZSy3GXSZ2jTQOkUVXzedF8UuWv9Br9dUfJnF1xky2a2S79HBjFL6MzacKvSF
CsGAqrZyF7Fn5JEcU1fY78E3ma2bdhp8M/didwaixH2w1Ya1ifbwJ44hlYEtrezU
+E6DGUh8dZgx7TVa2dqgTLR6xkrW9gUM3/U4NZ+PsTTKEzD1g+iQZaAViktldXH2
G1qSW6qR9W26MLKEmtGWe+uwM07jnIhKc0z4GZfZv9LRNXUvKJ88fm1fomPeLiEY
CW6vV2V3BSBSXhmrI+jVhJij997QhXFNzdVSAZkkiDOvG7ml3+LnFc4EXRE0jXGV
cxDbjTgS/xj9seOfwzqcEeDANWPPvNCN9SClptNU/XMew5+zfVaVx0BIWwzkZiLM
j7aPMAuya0LKbRBRIqrWrDJEjPphlVQ8PQM1bcDlb/el/IYwYcvmIWcQKQUNihX2
Kpz77+2ww8wbbGW80EORd149V8/Gw40OAQ3T/p8ve4vJL7dhabARwFZ9J7mHP1BF
GFXkTShwUtTqVbivZ011N1mDCUb6YjjSUoYVZP431J2cMb17sos=
=Fu6m
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
