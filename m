Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A002225235
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 16:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgGSO0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 10:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgGSO0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 10:26:36 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3745AC0619D2;
        Sun, 19 Jul 2020 07:26:36 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t15so8703916pjq.5;
        Sun, 19 Jul 2020 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=oMMdTXZE/SgKfnyt+CE5RFRImiPbBYVyuLwDLtnU710=;
        b=EzbcabwlmwC4jqxRbOKtvJ9MHzIhodmrDdUcgAmLM7KNPfhOf12UERa6e+Ix73WN99
         B9CSgpa2wp9J/0RnkP0Giyq5HOdZ9bamkCAQ8ZEqTndO/2iLTkzT4OzbIbOPE5KDk6GZ
         8Lhzctls2OlsbcjVBq5wKft7B8bM37sc/RhFniR5D+QF7PstIxVh16+ggynEcmdoR9Kx
         p/7dJdFEhohOU6UjjBsTBRqWhiqjKVUdJLas88BLok+H7qiL4cFc7JFv9kWMYeV0W8jl
         Htef5Pn9jHZAx3WYZgCbwV++4wrRI057lL6Z4CHM0vBQWafwwmpyIvDDmwBvGXFtFuxz
         VRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=oMMdTXZE/SgKfnyt+CE5RFRImiPbBYVyuLwDLtnU710=;
        b=PMnLaLzHox5Fud+zf6LK5vbOSF8mM5O4lY1j0Fk0RiCSxt7rJ6Ifm8Qu4787wBKVpt
         YHXF+ArsbLFHUaud1cEMJg2kgtowCRq3+7jU+vpvLdtCPo6WHcZKB5TpxjFmsv9JPFk3
         Tnl05gRQEApCRsqoeDhQzVZF2xkf/4uTYxYdM7Ey+Z1eXS7yjAjDw9gExzj4shJ7CRyi
         LZ5fYsDDBhlfUQFLHK674/C6XdRHQf5b38V7V3rGLaM1GMBxcEKJGEv/By7NOsdFr2v0
         VfZg57k/aUypDh1Mb4l12CjHqEPx/vJYmruts1kBNstxfWPvzxcbfR65Cg0HYY2LeI4p
         X/3w==
X-Gm-Message-State: AOAM532YBR48Tv6QeLzBzBP+i6SG0dQyCApwxV/+O2wyTHe5ENrbRVuX
        s2DvV6zSskzp3LnAv1GRtshfC1rE+VM=
X-Google-Smtp-Source: ABdhPJyHkJphjwrwB3Q6cZ2Xn4DmrvnkvjiU+j1n+X1klm3CGtABSJZW31khrbzX0PEBHQ68heFfxw==
X-Received: by 2002:a17:90b:3c1:: with SMTP id go1mr18153119pjb.129.1595168795748;
        Sun, 19 Jul 2020 07:26:35 -0700 (PDT)
Received: from blackclown ([103.88.82.25])
        by smtp.gmail.com with ESMTPSA id f207sm14031419pfa.107.2020.07.19.07.26.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jul 2020 07:26:35 -0700 (PDT)
Date:   Sun, 19 Jul 2020 19:56:23 +0530
From:   Suraj Upadhyay <usuraj35@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: atomisp: Replace depracated MSI APIs
Message-ID: <20200719142623.GA31565@blackclown>
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

Replace depracated MSI IRQ enabler and disabler
with pci_alloc_irq_vectors and pci_free_irq_vectors respectively.
And as a result handle the returned error as appropriate.
Compile tested.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
Change:
	v2: Replace the MSI IRQ disabler too.
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/sta=
ging/media/atomisp/pci/atomisp_v4l2.c
index d36809a0182c..a5dea5521b36 100644
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
@@ -1857,7 +1857,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 initialize_modules_fail:
 	cpu_latency_qos_remove_request(&isp->pm_qos);
 	atomisp_msi_irq_uninit(isp, dev);
-	pci_disable_msi(dev);
+	pci_free_irq_vectors(dev);
 enable_msi_fail:
 fw_validation_fail:
 	release_firmware(isp->firmware);
--=20
2.17.1


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8UWA4ACgkQ+gRsbIfe
7460DQ/9EUsPrIHgSxSfS3NIWg+/PaRCXfxS4V+3voUz57aoINkqRJcbRxs2uTYq
1mBfCNTE1WlNQfplnGJe4VCwamF9sniqn1/DDUDJhpqJibsjuY1OXkOyXRTZIk1e
AUGjbbdAEo05UOPOqZPAOvm8mlCjZ04btYOHA4x1jIetCFAKj+A1/f1rwvy1UGiP
LJQJSlZCPej4kyKjdd7AHy6w0LYMJ8LcjXW5aGG3031ne129InLPNJROd+ZCiqbK
2HGwy34MjgU6Uxtr6x++sSI60iJa5rsO0AxzDF5y4usCxSdcutMThZVUjM4K6tBS
M1/cXgfzBWLHZXkJxlbxOCT8H1R4vLkpovo6TaSq6Kdhktt6vyu3YfWLpR/OWike
KD0W6Kia8Kkfe5IGHJoqOHunwxBc3fXmFumWNZyqtCZND3KNy77WlnPtncAZNN0J
fKOstp1XNTUNJAqGiY8uA029Fy/34EK5M/Pts7LZjlpY+Zz9Fy0xwuqmpOG/HijS
jUwYKZhj+h7LaktU/PFZ4Ag8/UVlwL0yHtgRYvMHFpFcAM3IyhxKU/WL94f6wZ4P
5n1OTPuvgkGSjGI2v7tFMELzMomYt8TIF1WJI4NpaKVo06gwbcGLFCEHXrMYpUWi
ZFmub5PWOOI3BMxk4TS3HVAt04lES0GWvTXoY6E9/8idDSe1zDU=
=ajNK
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
