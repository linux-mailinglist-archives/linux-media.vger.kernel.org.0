Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B717E5862
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 15:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjKHOLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 09:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbjKHOK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 09:10:59 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A451BEF
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 06:10:56 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a6190af24aso1075205966b.0
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699452655; x=1700057455; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2aoKPQxX5VukrQXdA2pr+5FnH/0vYYcAcQ+DpaBqZRo=;
        b=Wy3Znaq7o9d/5HhuCu4vazM3XFCvLYgzb8/QBxVAu35MvIaWg2eRdzrr6UNlLBcfKY
         wI261ap1mgIUQk0qmYtaGFTy8nLrNin+VFy97+Fs7ONB2/rcDYhfR8b4w4e0So8hBmbe
         Yb41UjshU6/ea/OcAPiKiOf0puiolE15Cgh/Az6ghT3gbuKiFniN1vJCc91J6Eobx0Sq
         9afwk20ZzQvGL6AkF9sM+GJunmq/9O3pr6WUbW/8a5QQPfiI92WQFeyrSZYsTigpfWT4
         2LPuIfhKtVZfetyq+BiYABN5Dj8IsXrYjnL3iqW5FH8H4z26YTPT6MAYxp0WmNLUwqZX
         FfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699452655; x=1700057455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2aoKPQxX5VukrQXdA2pr+5FnH/0vYYcAcQ+DpaBqZRo=;
        b=TJQcNXSAUNUwRmC1thkdmaBF85VHJJca5FW/Tg45jw1H/D3r2eyKt26hD+0KPV8QFR
         nTnoKLfLRXlQDzbH9KoTRn9fVCj49ul6KxuZ+o7TA3SWmsG1P15vt7v/t2/nfL+RMIWy
         Jmndb5dZ+LCA29akKZj378+ev+u1MzP5XSZg373RcSjLyrkUV/EYv/SAFiIBBVJPUTLD
         StkFZTdf890wufxHKCP0OlLKH6mqzrAL5QrmUHvsvU5jW4Vl9ZMzmy+7vt12btLrfulu
         1eJMU2zK4D3SaHAUYYC61qAg2MlrH69azYP57XQVFJJE+no6HMrSFu4DcINmcQmTmZIz
         1UzQ==
X-Gm-Message-State: AOJu0YyWYfoW+FNidE8wyA5g6XsrpHVjym2BX3T66RDRgvobdJabF1PQ
        3/3V6SaEMkY+VBTX+Mt6l1U=
X-Google-Smtp-Source: AGHT+IFA4TB17c9NW1I4moQ17+CGvCgwz0D5IiLDZtwco/svRerTPDIfFlAor73drGCHydKo+B3i4g==
X-Received: by 2002:a17:907:9486:b0:9e0:dcf:17ec with SMTP id dm6-20020a170907948600b009e00dcf17ecmr1814825ejc.30.1699452654824;
        Wed, 08 Nov 2023 06:10:54 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id i17-20020a170906a29100b009b9f87b34b6sm1093388ejz.189.2023.11.08.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:10:54 -0800 (PST)
Message-ID: <d9fa902626486899929202f56f3e924b4ba27a73.camel@gmail.com>
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Wed, 08 Nov 2023 15:10:53 +0100
In-Reply-To: <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
         <20231024112924.3934228-2-bingbu.cao@intel.com>
         <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, 2023-11-08 at 12:25 +0100, Hans de Goede wrote:
> Hi,
>=20
> On 10/24/23 13:29, bingbu.cao@intel.com=C2=A0wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> >=20
> > Intel Image Processing Unit 6th Gen includes input and processing
> > systems
> > but the hardware presents itself as a single PCI device in system.
> >=20
> > IPU6 PCI device driver basically does PCI configurations and load
> > the firmware binary, initialises IPU virtual bus, and sets up
> > platform
> > specific variants to support multiple IPU6 devices in single device
> > driver.
> >=20
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Suggested-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> > ---
> > =C2=A0.../media/pci/intel/ipu6/ipu6-platform-regs.h | 179 ++++
> > =C2=A0drivers/media/pci/intel/ipu6/ipu6.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 952
> > ++++++++++++++++++
> > =C2=A0drivers/media/pci/intel/ipu6/ipu6.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 352 +++++++
> > =C2=A03 files changed, 1483 insertions(+)
> > =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-
> > regs.h
> > =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
> > =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
>=20
> <snip>
>=20
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.c
> > b/drivers/media/pci/intel/ipu6/ipu6.c
> > new file mode 100644
> > index 000000000000..84960a283daf
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> > @@ -0,0 +1,952 @@
>=20
> <snip>
>=20
> > +static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* disable IPU6 PCI ATS on m=
tl ES2 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (is_ipu6ep_mtl(hw_ver) &&=
 boot_cpu_data.x86_stepping =3D=3D
> > 0x2 &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_ats_s=
upported(dev))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pci_disable_ats(dev);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* No PCI msi capability for=
 IPU6EP */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (is_ipu6ep(hw_ver) || is_=
ipu6ep_mtl(hw_ver)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/* likely do nothing as msi not enabled by default
> > */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pci_disable_msi(dev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pci_alloc_irq_vector=
s(dev, 1, 1, PCI_IRQ_MSI);
>=20
> This does not work on TGL systems (and is not reached on ADL and
> RPL).
>=20
> The out of tree driver instead uses:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D pci_enable_msi(dev);
>=20
> and that does work correctly on TGL.

Did you see my previous (25//10) comment on the same lines?=C2=A0

pci_alloc_irq_vectors returns number of irqs, so the "if (ret)" check
following the quoted line is wrong.

/Andreas
