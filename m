Return-Path: <linux-media+bounces-66426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2MprIK1RR2pqWAAAu9opvQ
	(envelope-from <linux-media+bounces-66426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 08:07:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE216FEF40
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 08:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="CeV0kq/n";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66426-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66426-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BB6C305DAE8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 06:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4100B373C1D;
	Fri,  3 Jul 2026 06:04:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AE0374E74
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 06:04:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058656; cv=none; b=efQPHC090W58OJ2LJ1/w3bdEwRr2knLJ0a9AMuTASWI8BtzmMbrlWo2nJckmEYKypJxSS4OS2y3BWQc9yHciTTKF4SFPTVN/QZ/M2Rf9klWMhocyfedDx5n5zayyCOpztsURz22YtvEcdkCzPEbZ0idv0V2a0pOx8uJVt/UFczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058656; c=relaxed/simple;
	bh=N+cc/b7xmdRImOamVeA4YXuOqwU7zUsJN+2MNYui7a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZpFSr7QcJeANQ+4rGoVGOTvRdp/oQrmxhaIMvlN5P8AQw4F722uQz+ZmiMaNm9kLlWcxcaNcroie1Y9tPxpTQUeNAOpP3C2jXPA+oOyTU56K22M7ixX3nOHhaXuA5oda+EgVuCVsv6My8A/a/sfjSNkGwQMsHl48fHd9uCzY3jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CeV0kq/n; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so1002175e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 23:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783058648; x=1783663448; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKG7MwATR4/3kqZgemZ4ywXKTIrfkTvjrseZGgdxVU4=;
        b=CeV0kq/nMhErEMFP2wS10J8YPblvEMOIKweUFyX/M/J9YGdEYDxBHWoTFiefdYbkqO
         hE2tpi4O+xZNFYqTjciuEM23lEpliThUqWOj8ugTpnE7CIWwwKYGD+yjSKphxe0Z55nH
         eDBqE/bPeqnmaSGF+04FR8+EC5pX2F0Zn73ir7e7gGeyxykXNrU83jBJ7IVeVuQoiS42
         ttaDI/CvWzeP3Diq1YO5aPx8pjw7j0NQiwf0/Ol/gWE3rDHG5+ac+CRlopD6YMtR7Q/f
         EppW69Sn4fnPEpL89K3a6UeMzi8KsTPcz2ry2vNW++RPrASY9LC+nPHys3dJ8zeuWX8j
         UfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058648; x=1783663448;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKG7MwATR4/3kqZgemZ4ywXKTIrfkTvjrseZGgdxVU4=;
        b=LJp+uqFyQ+ja/sDjvHidY4zIng3f+DV0Xl64vqewZQdkTiWFea/pXOhyWrvamBSfTn
         OB8AljIw/LajsFVsL2ZOh0+osuSutNGcTzgxVMztwu6zhMJZkH+BKv2fYMUvNDBWq4Pj
         wK9LnITb9R7+t1OoFd6rO4zKsnwolPRXEVz8v3LVQ2HbbK8sOLY7cUumYSb1z80PSK5a
         Ba9vmRaiEGezWbLzs1H+2AwB5fGp+YPlUiLPdIKQmKI0anKncM79WFHTw8ThuacX+uwE
         rNwWJcNn9QwHvcwf9WwfHQ9jbuE/EDuZpkUYNgq4XwYmzTnqhHobz8mZJ0nQvu3EaKpl
         dqeA==
X-Forwarded-Encrypted: i=1; AFNElJ/eSfQefvuMrPSuWa+xc/YxMGbKWj2A0OIAhxPnNwlIAMKweBZ/A7CMPrD4QkOSDSFUog/2sfuOSFqmzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4u45gUgw14/zuFUov+UuMsDaFjUrjwMswHA+X7RVfOpwmnh+W
	nWY3LBMHP/3z00PKQDjuNWsnUuooXDlpxSDeZvd0JdwvektL3WL2iBpNoFrsRKcm938=
X-Gm-Gg: AfdE7cl0wbZzddXa3Zg2ZwB5XS+Gx9JV3wXwC85mbzh9FRGcBR/q2PyO3/sjRHFIunx
	84ftavVkc77w4nr31e1CLAty5LGXV1HXjG8jKYw1zX5ddILjO+B7B0GZJ2l6uU/P8ApdewHPLy/
	OgSQWn38JFDsPk0dhWlm22I00CkxvedoBWmB/kGabIY85E7wnagrVSgYZeLWnPJLrSbnDhWbZD/
	sDPPp4ngUvgL0dS2rPFpIOf6VAjH/0XrYBHJxUU6lQKJJaZzv9odUWYSHiu936jMWw5zs8e1sga
	wS6c3iD4VzeHBDoAJx/8Yg8RPH4wAbNGCyn/jg0E68p6d4kmMIYb4MC91Sm1fHaOixZ+MFNkimb
	2F0qSxLAhfO3+q3wdo29vgxMFr+g4QjIAGZwj9011ljh60jVh98uzugcl5FzU/OJYZltW7aTMrM
	N2gGYzqqFeGLiVQnZjGg==
X-Received: by 2002:a05:600c:19c7:b0:493:b750:bd20 with SMTP id 5b1f17b1804b1-493c3cdd21emr107865525e9.15.1783058647244;
        Thu, 02 Jul 2026 23:04:07 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c637568dsm112044915e9.4.2026.07.02.23.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:04:06 -0700 (PDT)
Date: Fri, 3 Jul 2026 08:04:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Raag Jadav <raag.jadav@intel.com>, 
	Sohil Mehta <sohil.mehta@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Pei Xiao <xiaopei01@kylinos.cn>, 
	Shashank Balaji <shashank.mahadasyam@sony.com>, Ben Horgan <ben.horgan@arm.com>, Johan Hovold <johan@kernel.org>, 
	linux-usb@vger.kernel.org, Nikita Kravets <teackot@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [GIT PULL] Split <linux/mod_devicetable.h> in per subsystem headers
Message-ID: <akdIS8mW2IubUWQh@monoceros>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqgtpm7i2tgva2ps"
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66426-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:raag.jadav@intel.com,m:sohil.mehta@intel.com,m:dave.hansen@linux.intel.com,m:robh@kernel.org,m:saravanak@kernel.org,m:bhelgaas@google.com,m:rafael@kernel.org,m:lenb@kernel.org,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:nicolas.frattaroli@collabora.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:driver-core@lists.linux.dev,m:jic23@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:xiaopei01@kylinos.cn,m:shashank.mahadasyam@sony.com,m:ben.horgan@arm.com,m:johan@kernel.org,m:linux-usb@vger.kernel.org,m:teackot@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.
 intel.com,m:platform-driver-x86@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kvm@vger.kernel.org,m:loongarch@lists.linux.dev,m:geert@linux-m68k.org,m:gregkh@linuxfoundation.org,m:broonie@kernel.org,m:o-takashi@sakamocchi.jp,m:wsa+renesas@sang-engineering.com,m:nickdesaulniers@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,intel.com,linux.intel.com,vger.kernel.org,ti.com,collabora.com,perex.cz,suse.com,sntech.de,lists.infradead.org,lists.linux.dev,oss.qualcomm.com,kylinos.cn,sony.com,arm.com,ideasonboard.com,loongson.cn,xen0n.name,linux-m68k.org,linuxfoundation.org,sakamocchi.jp,sang-engineering.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,lkml,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[monoceros:mid,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEE216FEF40


--sqgtpm7i2tgva2ps
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [GIT PULL] Split <linux/mod_devicetable.h> in per subsystem headers
MIME-Version: 1.0

Hello Linus,

the following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git tags/d=
evice-id-rework

for you to fetch changes up to 995832b2cebe6969d1b42635db698803ee31294d:

  Replace <linux/mod_devicetable.h> by more specific <linux/device-id/*.h> =
(c files) (2026-07-03 07:38:17 +0200)

Technically the series could be split and go in via the various
subsystem trees, but given that touching headers that are much used have
a big impact that require recompilation of big parts after a
modification, getting them in in bulk reduces this effect considerably
so they are all included here.

The changes were in next since next-20260629 and only minimally modified
since then:

 - Add SPDX headers (included since next-20260630)
 - Add a build fix for parisc (included since next-20260630)
 - Drop "MOD" from the header guards, too. (That's a last minute change
   that I only noticed while preparing this pull request. Was done using

	perl -p -i -e 's/LINUX_MOD_DEVICE_ID/LINUX_DEVICE_ID/' include/linux/devic=
e-id/*.h

   so should be safe.)
 - Add various review tags

Currently there are two minor merge conflicts with other trees in next,
Mark handled them well; and there were no other problem reports.

I'll watch your tree and next using my script until the next merge
window for regressions, but I'm optimistic there won't be much to do on
that front.

It would be awesome if you pulled this before -rc2 to allow subsystem
trees with conflicts against these changes to rebase on -rc2 or pull it
to resolve.

Thanks to all the folks who accompanied this effort
Uwe

----------------------------------------------------------------
Split <linux/mod_devicetable.h> in per subsystem headers

<linux/mod_devicetable.h> is included transitively in nearly every
driver in an x86_64 allmodconfig build of v7.1:

        $ find drivers -name \*.o -not -name \*.mod.o | wc -l
        21330
        $ find drivers -name \*.o.cmd -not -name \*.mod.o.cmd | xargs grep =
-l mod_devicetable.h | wc -l
        17038

The result of this mixture of different and unrelated subsystem details
is that even when touching an obscure device id struct most of the
kernel needs to be recompiled. Given that each driver typically only
needs one or two of these structures, splitting into per subsystem
headers and only including what is really needed reduces the amount of
needed recompilation.

This split is implemented in the first commit and then after some
preparatory work in the following commits, the last two replace
includes of <linux/mod_devicetable.h> by the actually needed more
specific headers. There are still a few instances left, but the ones
with high impact (that is in headers that are used a lot) and the easy
ones (.c files) are handled. These remaining includes will be addressed
during the next merge window.

----------------------------------------------------------------
Uwe Kleine-K=F6nig (The Capable Hub) (17):
      mod_devicetable.h: Split into per subsystem headers
      media: ti: vpe: #include <linux/platform_device.h> explicitly
      driver: core: Include headers for acpi_device_id and of_device_id for=
 struct device_driver
      driver core: platform: Include header for struct platform_device_id
      usb: serial: Include <linux/usb.h> in <linux/usb/serial.h>
      platform/x86: msi-ec: Ensure dmi_system_id is defined
      of: Explicitly include <linux/types.h> and <linux/err.h>
      i2c: Let i2c-core.h include <linux/i2c.h>
      platform/x86: x86-android-tablets: Add include defining struct dmi_sy=
stem_id
      platform/x86: int3472: Add include defining struct dmi_system_id
      usb: dwc2: Add include defining struct pci_device_id
      ALSA: hda/core: Add include defining struct hda_device_id
      LoongArch: KVM: Add include defining struct cpu_feature
      media: em28xx: Add include for struct usb_device_id
      parisc: #include <linux/compiler.h> for unlikely() in <asm/ptrace.h>
      Replace <linux/mod_devicetable.h> by more specific <linux/device-id/*=
=2Eh> (headers)
      Replace <linux/mod_devicetable.h> by more specific <linux/device-id/*=
=2Eh> (c files)

 arch/arm/mach-omap2/board-generic.c                |    1 -
 arch/loongarch/kvm/main.c                          |    1 +
 arch/mips/include/asm/cdmm.h                       |    2 +-
 arch/mips/lantiq/xway/dcdc.c                       |    1 -
 arch/mips/lantiq/xway/gptu.c                       |    1 -
 arch/mips/lantiq/xway/vmmc.c                       |    1 -
 arch/mips/pci/pci-rt2880.c                         |    1 -
 arch/mips/ralink/timer.c                           |    1 -
 arch/parisc/include/asm/hardware.h                 |    4 +-
 arch/parisc/include/asm/parisc-device.h            |    1 +
 arch/parisc/include/asm/ptrace.h                   |    1 +
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c     |    1 -
 arch/powerpc/platforms/86xx/common.c               |    1 -
 arch/powerpc/sysdev/fsl_lbc.c                      |    1 -
 arch/powerpc/sysdev/fsl_pmc.c                      |    1 -
 arch/s390/include/asm/ccwdev.h                     |    2 +-
 arch/sh/drivers/platform_early.c                   |    2 +-
 arch/sparc/crypto/crop_devid.c                     |    2 +-
 arch/sparc/kernel/of_device_32.c                   |    1 -
 arch/sparc/kernel/of_device_64.c                   |    1 -
 arch/sparc/kernel/of_device_common.c               |    1 -
 arch/x86/include/asm/cpu_device_id.h               |    5 +-
 arch/x86/kvm/svm/svm.c                             |    1 -
 arch/x86/kvm/vmx/vmx.c                             |    1 -
 drivers/accel/ethosu/ethosu_drv.c                  |    1 -
 drivers/accel/qaic/qaic_timesync.c                 |    1 -
 drivers/accel/qaic/sahara.c                        |    1 -
 drivers/ata/ahci_platform.c                        |    1 -
 drivers/ata/ahci_sunxi.c                           |    1 -
 drivers/ata/pata_buddha.c                          |    1 -
 drivers/ata/pata_ep93xx.c                          |    1 -
 drivers/ata/pata_imx.c                             |    1 -
 drivers/auxdisplay/arm-charlcd.c                   |    1 -
 drivers/auxdisplay/hd44780.c                       |    1 -
 drivers/auxdisplay/lcd2s.c                         |    1 -
 drivers/auxdisplay/max6959.c                       |    1 -
 drivers/auxdisplay/seg-led-gpio.c                  |    1 -
 drivers/block/floppy.c                             |    2 +-
 drivers/bluetooth/hci_h5.c                         |    1 -
 drivers/bluetooth/hci_qca.c                        |    1 -
 drivers/bus/mhi/ep/main.c                          |    1 -
 drivers/bus/mhi/host/init.c                        |    1 -
 drivers/cache/hisi_soc_hha.c                       |    1 -
 drivers/cdx/controller/cdx_controller.c            |    1 -
 drivers/char/hw_random/airoha-trng.c               |    1 -
 drivers/char/hw_random/atmel-rng.c                 |    1 -
 drivers/char/hw_random/ba431-rng.c                 |    1 -
 drivers/char/hw_random/bcm74110-rng.c              |    1 -
 drivers/char/hw_random/exynos-trng.c               |    1 -
 drivers/char/hw_random/histb-rng.c                 |    1 -
 drivers/char/hw_random/imx-rngc.c                  |    1 -
 drivers/char/hw_random/ingenic-trng.c              |    1 -
 drivers/char/hw_random/iproc-rng200.c              |    1 -
 drivers/char/hw_random/pasemi-rng.c                |    1 -
 drivers/char/hw_random/pic32-rng.c                 |    1 -
 drivers/char/hw_random/powernv-rng.c               |    1 -
 drivers/char/hw_random/xgene-rng.c                 |    1 -
 drivers/char/hw_random/xilinx-trng.c               |    1 -
 drivers/char/hw_random/xiphera-trng.c              |    1 -
 drivers/clk/aspeed/clk-ast2600.c                   |    1 -
 drivers/clk/aspeed/clk-ast2700.c                   |    1 -
 drivers/clk/clk-axi-clkgen.c                       |    1 -
 drivers/clk/clk-bm1880.c                           |    1 -
 drivers/clk/clk-cdce706.c                          |    1 -
 drivers/clk/clk-eyeq.c                             |    1 -
 drivers/clk/clk-renesas-pcie.c                     |    1 -
 drivers/clk/clk-si521xx.c                          |    1 -
 drivers/clk/clk-versaclock5.c                      |    1 -
 drivers/clk/imx/clk-imx8mp-audiomix.c              |    1 -
 drivers/clk/mediatek/clk-mt2701-g3d.c              |    1 -
 drivers/clk/mediatek/clk-mt2701.c                  |    1 -
 drivers/clk/mediatek/clk-mt2712.c                  |    1 -
 drivers/clk/mediatek/clk-mt6765.c                  |    1 -
 drivers/clk/mediatek/clk-mt6779-aud.c              |    1 -
 drivers/clk/mediatek/clk-mt7622-eth.c              |    1 -
 drivers/clk/mediatek/clk-mt7622-hif.c              |    1 -
 drivers/clk/mediatek/clk-mt7622.c                  |    1 -
 drivers/clk/mediatek/clk-mt7629-hif.c              |    1 -
 drivers/clk/mediatek/clk-mt7981-apmixed.c          |    1 -
 drivers/clk/mediatek/clk-mt7981-eth.c              |    1 -
 drivers/clk/mediatek/clk-mt7981-infracfg.c         |    1 -
 drivers/clk/mediatek/clk-mt7981-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt7986-apmixed.c          |    1 -
 drivers/clk/mediatek/clk-mt7986-eth.c              |    1 -
 drivers/clk/mediatek/clk-mt7986-infracfg.c         |    1 -
 drivers/clk/mediatek/clk-mt7986-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt8167-aud.c              |    1 -
 drivers/clk/mediatek/clk-mt8167-img.c              |    1 -
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c           |    1 -
 drivers/clk/mediatek/clk-mt8167-mm.c               |    1 -
 drivers/clk/mediatek/clk-mt8167-vdec.c             |    1 -
 drivers/clk/mediatek/clk-mt8173-mm.c               |    1 -
 drivers/clk/mediatek/clk-mt8183.c                  |    1 -
 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c    |    1 -
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c       |    1 -
 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c     |    1 -
 drivers/clk/mediatek/clk-mt8188-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt8188-vdo0.c             |    1 -
 drivers/clk/mediatek/clk-mt8188-vdo1.c             |    1 -
 drivers/clk/mediatek/clk-mt8188-venc.c             |    1 -
 drivers/clk/mediatek/clk-mt8188-wpe.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-cam.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-img.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c     |    1 -
 drivers/clk/mediatek/clk-mt8192-ipe.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-mdp.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-mfg.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-msdc.c             |    1 -
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c         |    1 -
 drivers/clk/mediatek/clk-mt8192-vdec.c             |    1 -
 drivers/clk/mediatek/clk-mt8192-venc.c             |    1 -
 drivers/clk/mediatek/clk-mt8192.c                  |    1 -
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c       |    1 -
 drivers/clk/mediatek/clk-mt8195-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt8365.c                  |    1 -
 drivers/clk/mediatek/clk-mt8516-aud.c              |    1 -
 drivers/clk/meson/a1-peripherals.c                 |    1 -
 drivers/clk/meson/a1-pll.c                         |    1 -
 drivers/clk/meson/axg.c                            |    1 -
 drivers/clk/meson/gxbb.c                           |    1 -
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |    1 -
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |    1 -
 drivers/clk/qcom/camcc-kaanapali.c                 |    1 -
 drivers/clk/qcom/camcc-milos.c                     |    1 -
 drivers/clk/qcom/camcc-qcs615.c                    |    1 -
 drivers/clk/qcom/camcc-sa8775p.c                   |    1 -
 drivers/clk/qcom/camcc-sc7180.c                    |    1 -
 drivers/clk/qcom/camcc-sc7280.c                    |    1 -
 drivers/clk/qcom/camcc-sc8180x.c                   |    1 -
 drivers/clk/qcom/camcc-sc8280xp.c                  |    1 -
 drivers/clk/qcom/camcc-sdm845.c                    |    1 -
 drivers/clk/qcom/camcc-sm4450.c                    |    1 -
 drivers/clk/qcom/camcc-sm6350.c                    |    1 -
 drivers/clk/qcom/camcc-sm7150.c                    |    1 -
 drivers/clk/qcom/camcc-sm8150.c                    |    1 -
 drivers/clk/qcom/camcc-sm8250.c                    |    1 -
 drivers/clk/qcom/camcc-sm8450.c                    |    1 -
 drivers/clk/qcom/camcc-sm8550.c                    |    1 -
 drivers/clk/qcom/camcc-sm8650.c                    |    1 -
 drivers/clk/qcom/camcc-sm8750.c                    |    1 -
 drivers/clk/qcom/camcc-x1e80100.c                  |    1 -
 drivers/clk/qcom/camcc-x1p42100.c                  |    1 -
 drivers/clk/qcom/dispcc-eliza.c                    |    1 -
 drivers/clk/qcom/dispcc-glymur.c                   |    1 -
 drivers/clk/qcom/dispcc-kaanapali.c                |    1 -
 drivers/clk/qcom/dispcc-milos.c                    |    1 -
 drivers/clk/qcom/dispcc-qcm2290.c                  |    1 -
 drivers/clk/qcom/dispcc-qcs615.c                   |    1 -
 drivers/clk/qcom/dispcc-sc7180.c                   |    1 -
 drivers/clk/qcom/dispcc-sc7280.c                   |    1 -
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    1 -
 drivers/clk/qcom/dispcc-sdm845.c                   |    1 -
 drivers/clk/qcom/dispcc-sm4450.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6115.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6125.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6350.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6375.c                   |    1 -
 drivers/clk/qcom/dispcc-sm7150.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8250.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8450.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8550.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8750.c                   |    1 -
 drivers/clk/qcom/dispcc-x1e80100.c                 |    1 -
 drivers/clk/qcom/dispcc0-sa8775p.c                 |    1 -
 drivers/clk/qcom/dispcc1-sa8775p.c                 |    1 -
 drivers/clk/qcom/ecpricc-qdu1000.c                 |    1 -
 drivers/clk/qcom/gcc-eliza.c                       |    1 -
 drivers/clk/qcom/gcc-glymur.c                      |    1 -
 drivers/clk/qcom/gcc-hawi.c                        |    1 -
 drivers/clk/qcom/gcc-ipq5018.c                     |    1 -
 drivers/clk/qcom/gcc-ipq5332.c                     |    1 -
 drivers/clk/qcom/gcc-kaanapali.c                   |    1 -
 drivers/clk/qcom/gcc-milos.c                       |    1 -
 drivers/clk/qcom/gcc-nord.c                        |    1 -
 drivers/clk/qcom/gcc-qcs615.c                      |    1 -
 drivers/clk/qcom/gcc-qcs8300.c                     |    1 -
 drivers/clk/qcom/gcc-sa8775p.c                     |    1 -
 drivers/clk/qcom/gcc-sdx75.c                       |    1 -
 drivers/clk/qcom/gcc-sm4450.c                      |    1 -
 drivers/clk/qcom/gcc-sm7150.c                      |    1 -
 drivers/clk/qcom/gcc-sm8650.c                      |    1 -
 drivers/clk/qcom/gcc-sm8750.c                      |    1 -
 drivers/clk/qcom/gcc-x1e80100.c                    |    1 -
 drivers/clk/qcom/gpucc-glymur.c                    |    1 -
 drivers/clk/qcom/gpucc-kaanapali.c                 |    1 -
 drivers/clk/qcom/gpucc-milos.c                     |    1 -
 drivers/clk/qcom/gpucc-msm8998.c                   |    1 -
 drivers/clk/qcom/gpucc-qcm2290.c                   |    1 -
 drivers/clk/qcom/gpucc-qcs615.c                    |    1 -
 drivers/clk/qcom/gpucc-sa8775p.c                   |    1 -
 drivers/clk/qcom/gpucc-sar2130p.c                  |    1 -
 drivers/clk/qcom/gpucc-sc7180.c                    |    1 -
 drivers/clk/qcom/gpucc-sc7280.c                    |    1 -
 drivers/clk/qcom/gpucc-sc8280xp.c                  |    1 -
 drivers/clk/qcom/gpucc-sdm660.c                    |    1 -
 drivers/clk/qcom/gpucc-sdm845.c                    |    1 -
 drivers/clk/qcom/gpucc-sm4450.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6115.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6125.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6350.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6375.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8150.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8250.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8350.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8450.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8550.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8650.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8750.c                    |    1 -
 drivers/clk/qcom/gpucc-x1e80100.c                  |    1 -
 drivers/clk/qcom/gpucc-x1p42100.c                  |    1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c              |    1 -
 drivers/clk/qcom/ipq-cmn-pll.c                     |    1 -
 drivers/clk/qcom/lpasscc-sc8280xp.c                |    1 -
 drivers/clk/qcom/lpasscc-sm6115.c                  |    1 -
 drivers/clk/qcom/mmcc-apq8084.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8960.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8974.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8994.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8996.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8998.c                    |    1 -
 drivers/clk/qcom/mmcc-sdm660.c                     |    1 -
 drivers/clk/qcom/negcc-nord.c                      |    1 -
 drivers/clk/qcom/nwgcc-nord.c                      |    1 -
 drivers/clk/qcom/segcc-nord.c                      |    1 -
 drivers/clk/qcom/tcsrcc-eliza.c                    |    1 -
 drivers/clk/qcom/tcsrcc-glymur.c                   |    1 -
 drivers/clk/qcom/tcsrcc-hawi.c                     |    1 -
 drivers/clk/qcom/tcsrcc-nord.c                     |    1 -
 drivers/clk/qcom/tcsrcc-sm8650.c                   |    1 -
 drivers/clk/qcom/tcsrcc-sm8750.c                   |    1 -
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |    1 -
 drivers/clk/qcom/videocc-glymur.c                  |    1 -
 drivers/clk/qcom/videocc-kaanapali.c               |    1 -
 drivers/clk/qcom/videocc-milos.c                   |    1 -
 drivers/clk/qcom/videocc-qcs615.c                  |    1 -
 drivers/clk/qcom/videocc-sa8775p.c                 |    1 -
 drivers/clk/qcom/videocc-sm7150.c                  |    1 -
 drivers/clk/qcom/videocc-sm8450.c                  |    1 -
 drivers/clk/qcom/videocc-sm8550.c                  |    1 -
 drivers/clk/qcom/videocc-sm8750.c                  |    1 -
 drivers/clk/qcom/videocc-x1p42100.c                |    1 -
 drivers/clk/renesas/clk-vbattb.c                   |    1 -
 drivers/clk/renesas/renesas-cpg-mssr.c             |    1 -
 drivers/clk/renesas/rzg2l-cpg.c                    |    1 -
 drivers/clk/renesas/rzv2h-cpg.c                    |    1 -
 drivers/clk/samsung/clk-exynos-audss.c             |    1 -
 drivers/clk/samsung/clk-exynos-clkout.c            |    1 -
 drivers/clk/samsung/clk-exynos2200.c               |    1 -
 drivers/clk/samsung/clk-exynos3250.c               |    1 -
 drivers/clk/samsung/clk-exynos4.c                  |    1 -
 drivers/clk/samsung/clk-exynos4412-isp.c           |    1 -
 drivers/clk/samsung/clk-exynos5-subcmu.c           |    1 -
 drivers/clk/samsung/clk-exynos5250.c               |    1 -
 drivers/clk/samsung/clk-exynos5420.c               |    1 -
 drivers/clk/samsung/clk-exynos5433.c               |    1 -
 drivers/clk/samsung/clk-exynos7870.c               |    1 -
 drivers/clk/samsung/clk-exynos7885.c               |    1 -
 drivers/clk/samsung/clk-exynos850.c                |    1 -
 drivers/clk/samsung/clk-exynos8895.c               |    1 -
 drivers/clk/samsung/clk-exynos990.c                |    1 -
 drivers/clk/samsung/clk-exynosautov9.c             |    1 -
 drivers/clk/samsung/clk-exynosautov920.c           |    1 -
 drivers/clk/samsung/clk-fsd.c                      |    1 -
 drivers/clk/samsung/clk-gs101.c                    |    1 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |    1 -
 drivers/clk/samsung/clk.c                          |    1 -
 drivers/clk/sprd/ums512-clk.c                      |    1 -
 drivers/clk/starfive/clk-starfive-jh7100-audio.c   |    1 -
 drivers/clk/starfive/clk-starfive-jh7100.c         |    1 -
 drivers/clk/tegra/clk-device.c                     |    1 -
 drivers/clk/xilinx/xlnx_vcu.c                      |    1 -
 drivers/counter/interrupt-cnt.c                    |    1 -
 drivers/counter/stm32-lptimer-cnt.c                |    1 -
 drivers/counter/stm32-timer-cnt.c                  |    1 -
 drivers/counter/ti-ecap-capture.c                  |    1 -
 drivers/counter/ti-eqep.c                          |    1 -
 drivers/cpufreq/amd_freq_sensitivity.c             |    1 -
 drivers/cpufreq/armada-37xx-cpufreq.c              |    1 -
 drivers/crypto/atmel-aes.c                         |    1 -
 drivers/crypto/atmel-sha.c                         |    1 -
 drivers/crypto/atmel-tdes.c                        |    1 -
 drivers/crypto/hifn_795x.c                         |    1 -
 drivers/crypto/img-hash.c                          |    1 -
 .../crypto/intel/keembay/keembay-ocs-hcu-core.c    |    1 -
 drivers/crypto/qce/core.c                          |    1 -
 drivers/crypto/starfive/jh7110-cryp.c              |    1 -
 drivers/crypto/talitos.c                           |    1 -
 drivers/crypto/tegra/tegra-se-main.c               |    1 -
 drivers/crypto/ti/dthev2-common.c                  |    1 -
 drivers/crypto/xilinx/zynqmp-aes-gcm.c             |    1 -
 drivers/devfreq/hisi_uncore_freq.c                 |    1 -
 drivers/devfreq/imx8m-ddrc.c                       |    1 -
 drivers/dma/amd/qdma/qdma.c                        |    1 -
 drivers/dma/ep93xx_dma.c                           |    1 -
 drivers/dma/qcom/hidma.c                           |    1 -
 drivers/dma/sf-pdma/sf-pdma.c                      |    1 -
 drivers/dma/xgene-dma.c                            |    1 -
 drivers/dma/xilinx/xdma.c                          |    1 -
 drivers/dpll/zl3073x/dpll.c                        |    1 -
 drivers/edac/fsl_ddr_edac.c                        |    1 -
 drivers/edac/mpc85xx_edac.c                        |    1 -
 drivers/edac/pnd2_edac.c                           |    1 -
 drivers/edac/sb_edac.c                             |    1 -
 drivers/extcon/extcon-intel-cht-wc.c               |    1 -
 drivers/extcon/extcon-intel-mrfld.c                |    1 -
 drivers/extcon/extcon-max14526.c                   |    1 -
 drivers/extcon/extcon-max3355.c                    |    1 -
 drivers/extcon/extcon-qcom-spmi-misc.c             |    1 -
 drivers/extcon/extcon-usb-gpio.c                   |    1 -
 drivers/firewire/core-device.c                     |    1 -
 drivers/firewire/net.c                             |    1 -
 drivers/firewire/sbp2.c                            |    1 -
 drivers/firmware/google/cbmem.c                    |    2 +-
 drivers/firmware/google/coreboot_table.c           |    2 +-
 drivers/firmware/google/framebuffer-coreboot.c     |    2 +-
 drivers/firmware/google/memconsole-coreboot.c      |    2 +-
 drivers/firmware/google/vpd.c                      |    2 +-
 drivers/firmware/qemu_fw_cfg.c                     |    1 -
 drivers/fpga/altera-freeze-bridge.c                |    1 -
 drivers/fpga/altera-pr-ip-core-plat.c              |    1 -
 drivers/fpga/ice40-spi.c                           |    1 -
 drivers/fpga/intel-m10-bmc-sec-update.c            |    1 -
 drivers/fpga/lattice-sysconfig-spi.c               |    1 -
 drivers/fpga/xilinx-selectmap.c                    |    1 -
 drivers/fpga/xilinx-spi.c                          |    1 -
 drivers/fsi/fsi-master-i2cr.c                      |    1 -
 drivers/fsi/fsi-scom.c                             |    1 -
 drivers/fsi/i2cr-scom.c                            |    1 -
 drivers/gpib/eastwood/fluke_gpib.c                 |    1 -
 drivers/gpio/gpio-74xx-mmio.c                      |    1 -
 drivers/gpio/gpio-adnp.c                           |    1 -
 drivers/gpio/gpio-aggregator.c                     |    1 -
 drivers/gpio/gpio-altera-a10sr.c                   |    1 -
 drivers/gpio/gpio-altera.c                         |    1 -
 drivers/gpio/gpio-ath79.c                          |    1 -
 drivers/gpio/gpio-bcm-kona.c                       |    1 -
 drivers/gpio/gpio-by-pinctrl.c                     |    1 -
 drivers/gpio/gpio-cros-ec.c                        |    1 -
 drivers/gpio/gpio-dwapb.c                          |    1 -
 drivers/gpio/gpio-en7523.c                         |    1 -
 drivers/gpio/gpio-ge.c                             |    1 -
 drivers/gpio/gpio-graniterapids.c                  |    1 -
 drivers/gpio/gpio-hisi.c                           |    1 -
 drivers/gpio/gpio-idt3243x.c                       |    1 -
 drivers/gpio/gpio-latch.c                          |    1 -
 drivers/gpio/gpio-line-mux.c                       |    1 -
 drivers/gpio/gpio-ltc4283.c                        |    1 -
 drivers/gpio/gpio-max7360.c                        |    1 -
 drivers/gpio/gpio-max77759.c                       |    1 -
 drivers/gpio/gpio-mb86s7x.c                        |    1 -
 drivers/gpio/gpio-mlxbf2.c                         |    1 -
 drivers/gpio/gpio-mmio.c                           |    1 -
 drivers/gpio/gpio-mockup.c                         |    1 -
 drivers/gpio/gpio-mpc8xxx.c                        |    1 -
 drivers/gpio/gpio-mpfs.c                           |    1 -
 drivers/gpio/gpio-nomadik.c                        |    1 -
 drivers/gpio/gpio-pca953x.c                        |    1 -
 drivers/gpio/gpio-pcf857x.c                        |    1 -
 drivers/gpio/gpio-qixis-fpga.c                     |    1 -
 drivers/gpio/gpio-realtek-otto.c                   |    1 -
 drivers/gpio/gpio-shared-proxy.c                   |    1 -
 drivers/gpio/gpio-sim.c                            |    1 -
 drivers/gpio/gpio-sl28cpld.c                       |    1 -
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |    1 -
 drivers/gpio/gpio-sprd.c                           |    1 -
 drivers/gpio/gpio-tn48m.c                          |    1 -
 drivers/gpio/gpio-virtuser.c                       |    1 -
 drivers/gpio/gpio-wcd934x.c                        |    1 -
 drivers/gpio/gpio-xgene-sb.c                       |    1 -
 drivers/gpio/gpio-xra1403.c                        |    1 -
 drivers/gpio/gpio-zevio.c                          |    1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    1 -
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |    1 -
 drivers/gpu/drm/bridge/inno-hdmi.c                 |    1 -
 drivers/gpu/drm/bridge/ssd2825.c                   |    1 -
 drivers/gpu/drm/bridge/tc358762.c                  |    1 -
 drivers/gpu/drm/bridge/tc358764.c                  |    1 -
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c            |    1 -
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    1 -
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    1 -
 drivers/gpu/drm/imagination/pvr_drv.c              |    1 -
 drivers/gpu/drm/imx/dc/dc-cf.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-de.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-drv.c                    |    1 -
 drivers/gpu/drm/imx/dc/dc-ed.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-fg.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-fl.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-fw.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-lb.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-pe.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-tc.c                     |    1 -
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    1 -
 drivers/gpu/drm/mediatek/mtk_cec.c                 |    1 -
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |    1 -
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    1 -
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    1 -
 drivers/gpu/drm/panel/panel-arm-versatile.c        |    1 -
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |    1 -
 drivers/gpu/drm/panel/panel-boe-td4320.c           |    1 -
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |    1 -
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    1 -
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       |    1 -
 drivers/gpu/drm/panel/panel-himax-hx83121a.c       |    1 -
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |    1 -
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c       |    1 -
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    1 -
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c  |    1 -
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c          |    1 -
 drivers/gpu/drm/panel/panel-motorola-mot.c         |    1 -
 drivers/gpu/drm/panel/panel-novatek-nt35532.c      |    1 -
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      |    1 -
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    1 -
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |    1 -
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |    1 -
 drivers/gpu/drm/panel/panel-renesas-r61307.c       |    1 -
 drivers/gpu/drm/panel/panel-renesas-r69328.c       |    1 -
 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c   |    1 -
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |    1 -
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    1 -
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |    1 -
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |    1 -
 .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  |    1 -
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    1 -
 drivers/gpu/drm/panel/panel-summit.c               |    1 -
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    1 -
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     |    1 -
 drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c     |    1 -
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c      |    1 -
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    1 -
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    1 -
 drivers/gpu/drm/sprd/sprd_drm.c                    |    1 -
 drivers/gpu/drm/sti/sti_hda.c                      |    1 -
 drivers/gpu/drm/stm/drv.c                          |    1 -
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    1 -
 drivers/gpu/drm/sun4i/sun6i_drc.c                  |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    1 -
 drivers/gpu/drm/tiny/sharp-memory.c                |    1 -
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    1 -
 drivers/gpu/drm/vc4/vc4_txp.c                      |    1 -
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c           |    1 -
 drivers/hid/intel-ish-hid/ishtp/bus.h              |    2 +-
 drivers/hsi/controllers/omap_ssi_port.c            |    1 -
 drivers/hte/hte-tegra194-test.c                    |    1 -
 drivers/hwmon/adcxx.c                              |    1 -
 drivers/hwmon/adt7410.c                            |    1 -
 drivers/hwmon/adt7462.c                            |    1 -
 drivers/hwmon/adt7475.c                            |    1 -
 drivers/hwmon/as370-hwmon.c                        |    1 -
 drivers/hwmon/axi-fan-control.c                    |    1 -
 drivers/hwmon/cros_ec_hwmon.c                      |    1 -
 drivers/hwmon/gxp-fan-ctrl.c                       |    1 -
 drivers/hwmon/iio_hwmon.c                          |    1 -
 drivers/hwmon/intel-m10-bmc-hwmon.c                |    1 -
 drivers/hwmon/jc42.c                               |    1 -
 drivers/hwmon/lan966x-hwmon.c                      |    1 -
 drivers/hwmon/lm70.c                               |    1 -
 drivers/hwmon/lm75.c                               |    1 -
 drivers/hwmon/ltc2947-core.c                       |    1 -
 drivers/hwmon/ltc4282.c                            |    1 -
 drivers/hwmon/ltc4283.c                            |    1 -
 drivers/hwmon/ltq-cputemp.c                        |    1 -
 drivers/hwmon/max197.c                             |    1 -
 drivers/hwmon/mc13783-adc.c                        |    1 -
 drivers/hwmon/mr75203.c                            |    1 -
 drivers/hwmon/ntc_thermistor.c                     |    1 -
 drivers/hwmon/occ/p9_sbe.c                         |    1 -
 drivers/hwmon/pmbus/adp1050.c                      |    1 -
 drivers/hwmon/pmbus/e50sn12051.c                   |    1 -
 drivers/hwmon/pmbus/lt3074.c                       |    1 -
 drivers/hwmon/pmbus/max17616.c                     |    1 -
 drivers/hwmon/pmbus/max20830.c                     |    1 -
 drivers/hwmon/pmbus/mp2975.c                       |    1 -
 drivers/hwmon/pmbus/stef48h28.c                    |    1 -
 drivers/hwmon/pwm-fan.c                            |    1 -
 drivers/hwmon/sch5627.c                            |    1 -
 drivers/hwmon/sch5636.c                            |    1 -
 drivers/hwmon/sl28cpld-hwmon.c                     |    1 -
 drivers/hwmon/smpro-hwmon.c                        |    1 -
 drivers/hwmon/sparx5-temp.c                        |    1 -
 drivers/hwmon/tmp102.c                             |    1 -
 drivers/hwmon/tmp108.c                             |    1 -
 drivers/hwtracing/coresight/ultrasoc-smb.c         |    1 -
 drivers/i2c/busses/i2c-amd-asf-plat.c              |    1 -
 drivers/i2c/busses/i2c-gxp.c                       |    1 -
 drivers/i2c/busses/i2c-hisi.c                      |    1 -
 drivers/i2c/busses/i2c-rtl9300.c                   |    1 -
 drivers/i2c/busses/i2c-rzv2m.c                     |    1 -
 drivers/i2c/i2c-core.h                             |    1 +
 drivers/iio/accel/adxl313_i2c.c                    |    1 -
 drivers/iio/accel/adxl313_spi.c                    |    1 -
 drivers/iio/accel/adxl355_core.c                   |    1 -
 drivers/iio/accel/adxl355_i2c.c                    |    1 -
 drivers/iio/accel/adxl355_spi.c                    |    1 -
 drivers/iio/accel/adxl367.c                        |    1 -
 drivers/iio/accel/adxl367_i2c.c                    |    1 -
 drivers/iio/accel/adxl367_spi.c                    |    1 -
 drivers/iio/accel/adxl372_i2c.c                    |    1 -
 drivers/iio/accel/adxl372_spi.c                    |    1 -
 drivers/iio/accel/adxl380_i2c.c                    |    1 -
 drivers/iio/accel/adxl380_spi.c                    |    1 -
 drivers/iio/accel/bma180.c                         |    1 -
 drivers/iio/accel/bma220_core.c                    |    1 -
 drivers/iio/accel/bma220_i2c.c                     |    1 -
 drivers/iio/accel/bma220_spi.c                     |    1 -
 drivers/iio/accel/bma400_i2c.c                     |    1 -
 drivers/iio/accel/bma400_spi.c                     |    1 -
 drivers/iio/accel/bmc150-accel-i2c.c               |    1 -
 drivers/iio/accel/bmc150-accel-spi.c               |    1 -
 drivers/iio/accel/bmi088-accel-i2c.c               |    1 -
 drivers/iio/accel/dmard06.c                        |    1 -
 drivers/iio/accel/fxls8962af-core.c                |    1 -
 drivers/iio/accel/fxls8962af-i2c.c                 |    1 -
 drivers/iio/accel/fxls8962af-spi.c                 |    1 -
 drivers/iio/accel/hid-sensor-accel-3d.c            |    1 -
 drivers/iio/accel/kxcjk-1013.c                     |    1 -
 drivers/iio/accel/kxsd9-i2c.c                      |    1 -
 drivers/iio/accel/kxsd9-spi.c                      |    1 -
 drivers/iio/accel/mma7660.c                        |    1 -
 drivers/iio/accel/mma8452.c                        |    1 -
 drivers/iio/accel/mma9551.c                        |    1 -
 drivers/iio/accel/mma9553.c                        |    1 -
 drivers/iio/accel/msa311.c                         |    1 -
 drivers/iio/accel/mxc4005.c                        |    1 -
 drivers/iio/accel/mxc6255.c                        |    1 -
 drivers/iio/accel/st_accel_i2c.c                   |    1 -
 drivers/iio/accel/st_accel_spi.c                   |    1 -
 drivers/iio/accel/stk8ba50.c                       |    1 -
 drivers/iio/adc/88pm886-gpadc.c                    |    1 -
 drivers/iio/adc/ad4000.c                           |    1 -
 drivers/iio/adc/ad4080.c                           |    1 -
 drivers/iio/adc/ad4134.c                           |    1 -
 drivers/iio/adc/ad4691.c                           |    1 -
 drivers/iio/adc/ad4851.c                           |    1 -
 drivers/iio/adc/ad7124.c                           |    1 -
 drivers/iio/adc/ad7173.c                           |    1 -
 drivers/iio/adc/ad7191.c                           |    1 -
 drivers/iio/adc/ad7192.c                           |    1 -
 drivers/iio/adc/ad7280a.c                          |    1 -
 drivers/iio/adc/ad7292.c                           |    1 -
 drivers/iio/adc/ad7298.c                           |    1 -
 drivers/iio/adc/ad7405.c                           |    1 -
 drivers/iio/adc/ad7606_par.c                       |    1 -
 drivers/iio/adc/ad7625.c                           |    1 -
 drivers/iio/adc/ad7779.c                           |    1 -
 drivers/iio/adc/adi-axi-adc.c                      |    1 -
 drivers/iio/adc/at91-sama5d2_adc.c                 |    1 -
 drivers/iio/adc/axp20x_adc.c                       |    1 -
 drivers/iio/adc/bcm_iproc_adc.c                    |    1 -
 drivers/iio/adc/berlin2-adc.c                      |    1 -
 drivers/iio/adc/cpcap-adc.c                        |    1 -
 drivers/iio/adc/envelope-detector.c                |    1 -
 drivers/iio/adc/fsl-imx25-gcq.c                    |    1 -
 drivers/iio/adc/hi8435.c                           |    1 -
 drivers/iio/adc/hx711.c                            |    1 -
 drivers/iio/adc/imx7d_adc.c                        |    1 -
 drivers/iio/adc/imx8qxp-adc.c                      |    1 -
 drivers/iio/adc/imx93_adc.c                        |    1 -
 drivers/iio/adc/ingenic-adc.c                      |    1 -
 drivers/iio/adc/intel_dc_ti_adc.c                  |    1 -
 drivers/iio/adc/intel_mrfld_adc.c                  |    1 -
 drivers/iio/adc/lpc18xx_adc.c                      |    1 -
 drivers/iio/adc/lpc32xx_adc.c                      |    1 -
 drivers/iio/adc/ltc2496.c                          |    1 -
 drivers/iio/adc/ltc2497.c                          |    1 -
 drivers/iio/adc/max1027.c                          |    1 -
 drivers/iio/adc/max11100.c                         |    1 -
 drivers/iio/adc/max1118.c                          |    1 -
 drivers/iio/adc/max1363.c                          |    1 -
 drivers/iio/adc/max14001.c                         |    1 -
 drivers/iio/adc/max34408.c                         |    1 -
 drivers/iio/adc/max77541-adc.c                     |    1 -
 drivers/iio/adc/max9611.c                          |    1 -
 drivers/iio/adc/mcp320x.c                          |    1 -
 drivers/iio/adc/mcp3422.c                          |    1 -
 drivers/iio/adc/mcp3911.c                          |    1 -
 drivers/iio/adc/mp2629_adc.c                       |    1 -
 drivers/iio/adc/mt6359-auxadc.c                    |    1 -
 drivers/iio/adc/mt6360-adc.c                       |    1 -
 drivers/iio/adc/mt6370-adc.c                       |    1 -
 drivers/iio/adc/mt6577_auxadc.c                    |    1 -
 drivers/iio/adc/nau7802.c                          |    1 -
 drivers/iio/adc/nct7201.c                          |    1 -
 drivers/iio/adc/npcm_adc.c                         |    1 -
 drivers/iio/adc/nxp-sar-adc.c                      |    1 -
 drivers/iio/adc/qcom-pm8xxx-xoadc.c                |    1 -
 drivers/iio/adc/qcom-spmi-adc5-gen3.c              |    1 -
 drivers/iio/adc/qcom-spmi-adc5.c                   |    1 -
 drivers/iio/adc/qcom-spmi-rradc.c                  |    1 -
 drivers/iio/adc/qcom-spmi-vadc.c                   |    1 -
 drivers/iio/adc/rohm-bd79112.c                     |    1 -
 drivers/iio/adc/rohm-bd79124.c                     |    1 -
 drivers/iio/adc/rtq6056.c                          |    1 -
 drivers/iio/adc/rzg2l_adc.c                        |    1 -
 drivers/iio/adc/rzn1-adc.c                         |    1 -
 drivers/iio/adc/rzt2h_adc.c                        |    1 -
 drivers/iio/adc/sd_adc_modulator.c                 |    1 -
 drivers/iio/adc/sophgo-cv1800b-adc.c               |    1 -
 drivers/iio/adc/spear_adc.c                        |    1 -
 drivers/iio/adc/stm32-adc.c                        |    1 -
 drivers/iio/adc/sun20i-gpadc-iio.c                 |    1 -
 drivers/iio/adc/ti-adc081c.c                       |    1 -
 drivers/iio/adc/ti-adc0832.c                       |    1 -
 drivers/iio/adc/ti-adc084s021.c                    |    1 -
 drivers/iio/adc/ti-adc108s102.c                    |    1 -
 drivers/iio/adc/ti-adc128s052.c                    |    1 -
 drivers/iio/adc/ti-adc161s626.c                    |    1 -
 drivers/iio/adc/ti-ads1018.c                       |    1 -
 drivers/iio/adc/ti-ads124s08.c                     |    1 -
 drivers/iio/adc/ti-ads131m02.c                     |    1 -
 drivers/iio/adc/ti-ads8688.c                       |    1 -
 drivers/iio/adc/ti-tlc4541.c                       |    1 -
 drivers/iio/adc/twl4030-madc.c                     |    1 -
 drivers/iio/adc/twl6030-gpadc.c                    |    1 -
 drivers/iio/adc/vf610_adc.c                        |    1 -
 drivers/iio/adc/xilinx-ams.c                       |    1 -
 drivers/iio/adc/xilinx-xadc-core.c                 |    1 -
 drivers/iio/addac/ad74413r.c                       |    1 -
 drivers/iio/afe/iio-rescale.c                      |    1 -
 drivers/iio/amplifiers/ad8366.c                    |    1 -
 drivers/iio/amplifiers/adl8113.c                   |    1 -
 drivers/iio/amplifiers/hmc425a.c                   |    1 -
 drivers/iio/cdc/ad7150.c                           |    1 -
 drivers/iio/chemical/ams-iaq-core.c                |    1 -
 drivers/iio/chemical/atlas-ezo-sensor.c            |    1 -
 drivers/iio/chemical/atlas-sensor.c                |    1 -
 drivers/iio/chemical/bme680_spi.c                  |    1 -
 drivers/iio/chemical/mhz19b.c                      |    1 -
 drivers/iio/chemical/pms7003.c                     |    1 -
 drivers/iio/chemical/scd30_i2c.c                   |    1 -
 drivers/iio/chemical/scd30_serial.c                |    1 -
 drivers/iio/chemical/sgp30.c                       |    1 -
 drivers/iio/chemical/sps30_i2c.c                   |    1 -
 drivers/iio/chemical/sps30_serial.c                |    1 -
 drivers/iio/chemical/sunrise_co2.c                 |    1 -
 drivers/iio/chemical/vz89x.c                       |    1 -
 .../iio/common/cros_ec_sensors/cros_ec_lid_angle.c |    1 -
 .../iio/common/cros_ec_sensors/cros_ec_sensors.c   |    1 -
 drivers/iio/common/ssp_sensors/ssp_dev.c           |    1 -
 drivers/iio/dac/ad3530r.c                          |    1 -
 drivers/iio/dac/ad3552r-hs.c                       |    1 -
 drivers/iio/dac/ad5446-i2c.c                       |    1 -
 drivers/iio/dac/ad5446-spi.c                       |    1 -
 drivers/iio/dac/ad5592r.c                          |    1 -
 drivers/iio/dac/ad5593r.c                          |    1 -
 drivers/iio/dac/ad5686-spi.c                       |    1 -
 drivers/iio/dac/ad5696-i2c.c                       |    1 -
 drivers/iio/dac/ad5706r.c                          |    1 -
 drivers/iio/dac/ad5758.c                           |    1 -
 drivers/iio/dac/ad7293.c                           |    1 -
 drivers/iio/dac/ad7303.c                           |    1 -
 drivers/iio/dac/ad8460.c                           |    1 -
 drivers/iio/dac/ad9739a.c                          |    1 -
 drivers/iio/dac/adi-axi-dac.c                      |    1 -
 drivers/iio/dac/dpot-dac.c                         |    1 -
 drivers/iio/dac/lpc18xx_dac.c                      |    1 -
 drivers/iio/dac/ltc2664.c                          |    1 -
 drivers/iio/dac/ltc2688.c                          |    1 -
 drivers/iio/dac/max22007.c                         |    1 -
 drivers/iio/dac/max5522.c                          |    1 -
 drivers/iio/dac/mcp4725.c                          |    1 -
 drivers/iio/dac/mcp4728.c                          |    1 -
 drivers/iio/dac/mcp47feb02.c                       |    1 -
 drivers/iio/dac/mcp4821.c                          |    1 -
 drivers/iio/dac/stm32-dac-core.c                   |    1 -
 drivers/iio/dac/stm32-dac.c                        |    1 -
 drivers/iio/dac/ti-dac082s085.c                    |    1 -
 drivers/iio/dac/ti-dac5571.c                       |    1 -
 drivers/iio/dac/vf610_dac.c                        |    1 -
 drivers/iio/filter/admv8818.c                      |    1 -
 drivers/iio/frequency/adf4350.c                    |    1 -
 drivers/iio/frequency/admfm2000.c                  |    1 -
 drivers/iio/frequency/admv1013.c                   |    1 -
 drivers/iio/frequency/admv1014.c                   |    1 -
 drivers/iio/frequency/adrf6780.c                   |    1 -
 drivers/iio/gyro/bmg160_i2c.c                      |    1 -
 drivers/iio/gyro/fxas21002c_i2c.c                  |    1 -
 drivers/iio/gyro/fxas21002c_spi.c                  |    1 -
 drivers/iio/gyro/hid-sensor-gyro-3d.c              |    1 -
 drivers/iio/gyro/st_gyro_i2c.c                     |    1 -
 drivers/iio/gyro/st_gyro_spi.c                     |    1 -
 drivers/iio/health/max30102.c                      |    1 -
 drivers/iio/humidity/dht11.c                       |    1 -
 drivers/iio/humidity/ens210.c                      |    1 -
 drivers/iio/humidity/hdc100x.c                     |    1 -
 drivers/iio/humidity/hid-sensor-humidity.c         |    1 -
 drivers/iio/humidity/hts221_i2c.c                  |    1 -
 drivers/iio/humidity/htu21.c                       |    1 -
 drivers/iio/humidity/si7020.c                      |    1 -
 drivers/iio/imu/adis16475.c                        |    1 -
 drivers/iio/imu/adis16480.c                        |    1 -
 drivers/iio/imu/adis16550.c                        |    1 -
 drivers/iio/imu/bmi160/bmi160_i2c.c                |    1 -
 drivers/iio/imu/bmi160/bmi160_spi.c                |    1 -
 drivers/iio/imu/bmi270/bmi270_i2c.c                |    1 -
 drivers/iio/imu/bmi270/bmi270_spi.c                |    1 -
 drivers/iio/imu/bmi323/bmi323_i2c.c                |    1 -
 drivers/iio/imu/bmi323/bmi323_spi.c                |    1 -
 drivers/iio/imu/bno055/bno055_i2c.c                |    1 -
 drivers/iio/imu/bno055/bno055_ser_core.c           |    1 -
 drivers/iio/imu/fxos8700_i2c.c                     |    1 -
 drivers/iio/imu/fxos8700_spi.c                     |    1 -
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c    |    1 -
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |    1 -
 drivers/iio/imu/inv_icm45600/inv_icm45600_i2c.c    |    1 -
 drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c    |    1 -
 drivers/iio/imu/inv_icm45600/inv_icm45600_spi.c    |    1 -
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |    1 -
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c          |    1 -
 drivers/iio/imu/kmx61.c                            |    1 -
 drivers/iio/imu/smi330/smi330_i2c.c                |    1 -
 drivers/iio/imu/smi330/smi330_spi.c                |    1 -
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c        |    1 -
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c        |    1 -
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c        |    1 -
 drivers/iio/light/al3000a.c                        |    1 -
 drivers/iio/light/al3010.c                         |    1 -
 drivers/iio/light/al3320a.c                        |    1 -
 drivers/iio/light/apds9999.c                       |    1 -
 drivers/iio/light/bh1780.c                         |    1 -
 drivers/iio/light/cm32181.c                        |    1 -
 drivers/iio/light/cm3232.c                         |    1 -
 drivers/iio/light/cm3605.c                         |    1 -
 drivers/iio/light/cros_ec_light_prox.c             |    1 -
 drivers/iio/light/gp2ap020a00f.c                   |    1 -
 drivers/iio/light/hid-sensor-als.c                 |    1 -
 drivers/iio/light/hid-sensor-prox.c                |    1 -
 drivers/iio/light/isl29018.c                       |    1 -
 drivers/iio/light/jsa1212.c                        |    1 -
 drivers/iio/light/ltr501.c                         |    1 -
 drivers/iio/light/ltrf216a.c                       |    1 -
 drivers/iio/light/max44000.c                       |    1 -
 drivers/iio/light/opt3001.c                        |    1 -
 drivers/iio/light/rpr0521.c                        |    1 -
 drivers/iio/light/si1133.c                         |    1 -
 drivers/iio/light/st_uvis25_i2c.c                  |    1 -
 drivers/iio/light/st_uvis25_spi.c                  |    1 -
 drivers/iio/light/stk3310.c                        |    1 -
 drivers/iio/light/tsl2563.c                        |    1 -
 drivers/iio/light/us5182d.c                        |    1 -
 drivers/iio/light/veml3328.c                       |    1 -
 drivers/iio/light/veml6046x00.c                    |    1 -
 drivers/iio/light/vl6180.c                         |    1 -
 drivers/iio/magnetometer/ak8974.c                  |    1 -
 drivers/iio/magnetometer/ak8975.c                  |    1 -
 drivers/iio/magnetometer/bmc150_magn_i2c.c         |    1 -
 drivers/iio/magnetometer/bmc150_magn_spi.c         |    1 -
 drivers/iio/magnetometer/hid-sensor-magn-3d.c      |    1 -
 drivers/iio/magnetometer/mmc35240.c                |    1 -
 drivers/iio/magnetometer/mmc5633.c                 |    1 -
 drivers/iio/magnetometer/mmc5983.c                 |    1 -
 drivers/iio/magnetometer/si7210.c                  |    1 -
 drivers/iio/magnetometer/st_magn_i2c.c             |    1 -
 drivers/iio/magnetometer/st_magn_spi.c             |    1 -
 drivers/iio/magnetometer/tlv493d.c                 |    1 -
 drivers/iio/magnetometer/yamaha-yas530.c           |    1 -
 drivers/iio/multiplexer/iio-mux.c                  |    1 -
 drivers/iio/orientation/hid-sensor-incl-3d.c       |    1 -
 drivers/iio/orientation/hid-sensor-rotation.c      |    1 -
 .../iio/position/hid-sensor-custom-intel-hinge.c   |    1 -
 drivers/iio/potentiometer/ad5272.c                 |    1 -
 drivers/iio/potentiometer/ds1803.c                 |    1 -
 drivers/iio/potentiometer/max5432.c                |    1 -
 drivers/iio/potentiometer/max5481.c                |    1 -
 drivers/iio/potentiometer/max5487.c                |    1 -
 drivers/iio/potentiometer/mcp4018.c                |    1 -
 drivers/iio/potentiometer/mcp41010.c               |    1 -
 drivers/iio/potentiometer/mcp4131.c                |    1 -
 drivers/iio/potentiometer/mcp4531.c                |    1 -
 drivers/iio/potentiostat/lmp91000.c                |    1 -
 drivers/iio/pressure/abp2030pa_i2c.c               |    1 -
 drivers/iio/pressure/abp2030pa_spi.c               |    1 -
 drivers/iio/pressure/adp810.c                      |    1 -
 drivers/iio/pressure/cros_ec_baro.c                |    1 -
 drivers/iio/pressure/hid-sensor-press.c            |    1 -
 drivers/iio/pressure/hp206c.c                      |    1 -
 drivers/iio/pressure/hsc030pa.c                    |    1 -
 drivers/iio/pressure/hsc030pa_i2c.c                |    1 -
 drivers/iio/pressure/hsc030pa_spi.c                |    1 -
 drivers/iio/pressure/icp10100.c                    |    1 -
 drivers/iio/pressure/mprls0025pa.c                 |    1 -
 drivers/iio/pressure/mprls0025pa_i2c.c             |    1 -
 drivers/iio/pressure/mprls0025pa_spi.c             |    1 -
 drivers/iio/pressure/ms5611_i2c.c                  |    1 -
 drivers/iio/pressure/ms5611_spi.c                  |    1 -
 drivers/iio/pressure/ms5637.c                      |    1 -
 drivers/iio/pressure/sdp500.c                      |    1 -
 drivers/iio/pressure/st_pressure_i2c.c             |    1 -
 drivers/iio/pressure/st_pressure_spi.c             |    1 -
 drivers/iio/pressure/zpa2326_i2c.c                 |    1 -
 drivers/iio/pressure/zpa2326_spi.c                 |    1 -
 drivers/iio/proximity/as3935.c                     |    1 -
 drivers/iio/proximity/cros_ec_mkbp_proximity.c     |    1 -
 drivers/iio/proximity/d3323aa.c                    |    1 -
 drivers/iio/proximity/hx9023s.c                    |    1 -
 drivers/iio/proximity/isl29501.c                   |    1 -
 drivers/iio/proximity/mb1232.c                     |    1 -
 drivers/iio/proximity/ping.c                       |    1 -
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  |    1 -
 drivers/iio/proximity/srf04.c                      |    1 -
 drivers/iio/proximity/sx9310.c                     |    1 -
 drivers/iio/proximity/sx9324.c                     |    1 -
 drivers/iio/proximity/sx9360.c                     |    1 -
 drivers/iio/proximity/vl53l1x-i2c.c                |    1 -
 drivers/iio/resolver/ad2s1200.c                    |    1 -
 drivers/iio/temperature/hid-sensor-temperature.c   |    1 -
 drivers/iio/temperature/ltc2983.c                  |    1 -
 drivers/iio/temperature/max31856.c                 |    1 -
 drivers/iio/temperature/max31865.c                 |    1 -
 drivers/iio/temperature/maxim_thermocouple.c       |    1 -
 drivers/iio/temperature/mcp9600.c                  |    1 -
 drivers/iio/temperature/mlx90614.c                 |    1 -
 drivers/iio/temperature/mlx90632.c                 |    1 -
 drivers/iio/temperature/mlx90635.c                 |    1 -
 drivers/iio/temperature/tmp006.c                   |    1 -
 drivers/iio/temperature/tmp007.c                   |    1 -
 drivers/iio/temperature/tsys01.c                   |    1 -
 drivers/iio/trigger/stm32-lptimer-trigger.c        |    1 -
 drivers/iio/trigger/stm32-timer-trigger.c          |    1 -
 drivers/input/keyboard/adp5585-keys.c              |    1 -
 drivers/input/keyboard/adp5588-keys.c              |    1 -
 drivers/input/keyboard/charlieplex_keypad.c        |    1 -
 drivers/input/keyboard/clps711x-keypad.c           |    1 -
 drivers/input/keyboard/ep93xx_keypad.c             |    1 -
 drivers/input/keyboard/max7360-keypad.c            |    1 -
 drivers/input/keyboard/pinephone-keyboard.c        |    1 -
 drivers/input/misc/ariel-pwrbutton.c               |    1 -
 drivers/input/misc/da9063_onkey.c                  |    1 -
 drivers/input/misc/gpio_decoder.c                  |    1 -
 drivers/input/misc/iqs269a.c                       |    1 -
 drivers/input/misc/iqs626a.c                       |    1 -
 drivers/input/misc/iqs7222.c                       |    1 -
 drivers/input/misc/mma8450.c                       |    1 -
 drivers/input/misc/rt5120-pwrkey.c                 |    1 -
 drivers/input/misc/sc27xx-vibra.c                  |    1 -
 drivers/input/misc/twl4030-pwrbutton.c             |    1 -
 drivers/input/serio/sun4i-ps2.c                    |    1 -
 drivers/input/touchscreen/cyttsp5.c                |    1 -
 drivers/input/touchscreen/himax_hx852x.c           |    1 -
 drivers/input/touchscreen/hynitron_cstxxx.c        |    1 -
 drivers/input/touchscreen/ili210x.c                |    1 -
 drivers/input/touchscreen/iqs5xx.c                 |    1 -
 drivers/input/touchscreen/msg2638.c                |    1 -
 drivers/input/touchscreen/resistive-adc-touch.c    |    1 -
 drivers/input/touchscreen/tsc2007_core.c           |    1 -
 drivers/interconnect/mediatek/mt8183.c             |    1 -
 drivers/interconnect/mediatek/mt8195.c             |    1 -
 drivers/interconnect/mediatek/mt8196.c             |    1 -
 drivers/interconnect/qcom/msm8909.c                |    1 -
 drivers/interconnect/qcom/msm8937.c                |    1 -
 drivers/interconnect/qcom/msm8939.c                |    1 -
 drivers/interconnect/qcom/msm8953.c                |    1 -
 drivers/interconnect/qcom/msm8976.c                |    1 -
 drivers/interconnect/qcom/msm8996.c                |    1 -
 drivers/interconnect/qcom/qcm2290.c                |    1 -
 drivers/interconnect/qcom/qcs404.c                 |    1 -
 drivers/interconnect/qcom/qdu1000.c                |    1 -
 drivers/interconnect/qcom/sa8775p.c                |    1 -
 drivers/interconnect/qcom/sc7180.c                 |    1 -
 drivers/interconnect/qcom/sc7280.c                 |    1 -
 drivers/interconnect/qcom/sc8180x.c                |    1 -
 drivers/interconnect/qcom/sc8280xp.c               |    1 -
 drivers/interconnect/qcom/sdm660.c                 |    1 -
 drivers/interconnect/qcom/sdm670.c                 |    1 -
 drivers/interconnect/qcom/sdm845.c                 |    1 -
 drivers/interconnect/qcom/sdx55.c                  |    1 -
 drivers/interconnect/qcom/sdx65.c                  |    1 -
 drivers/interconnect/qcom/shikra.c                 |    1 -
 drivers/interconnect/qcom/sm6115.c                 |    1 -
 drivers/interconnect/qcom/sm6350.c                 |    1 -
 drivers/interconnect/qcom/sm7150.c                 |    1 -
 drivers/interconnect/qcom/sm8150.c                 |    1 -
 drivers/interconnect/qcom/sm8250.c                 |    1 -
 drivers/interconnect/qcom/sm8350.c                 |    1 -
 drivers/interconnect/qcom/sm8450.c                 |    1 -
 drivers/interconnect/qcom/sm8550.c                 |    1 -
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c   |    1 -
 drivers/irqchip/irq-imx-intmux.c                   |    1 -
 drivers/irqchip/irq-lan966x-oic.c                  |    1 -
 drivers/irqchip/irq-sl28cpld.c                     |    1 -
 drivers/irqchip/irq-stm32mp-exti.c                 |    1 -
 drivers/leds/flash/leds-rt8515.c                   |    1 -
 drivers/leds/leds-aw200xx.c                        |    1 -
 drivers/leds/leds-bd2606mvv.c                      |    1 -
 drivers/leds/leds-cht-wcove.c                      |    1 -
 drivers/leds/leds-cr0014114.c                      |    1 -
 drivers/leds/leds-cros_ec.c                        |    1 -
 drivers/leds/leds-el15203000.c                     |    1 -
 drivers/leds/leds-gpio.c                           |    1 -
 drivers/leds/leds-is31fl319x.c                     |    1 -
 drivers/leds/leds-lm36274.c                        |    1 -
 drivers/leds/leds-lm3692x.c                        |    1 -
 drivers/leds/leds-lm3697.c                         |    1 -
 drivers/leds/leds-lp50xx.c                         |    1 -
 drivers/leds/leds-lt3593.c                         |    1 -
 drivers/leds/leds-max5970.c                        |    1 -
 drivers/leds/leds-mlxcpld.c                        |    1 -
 drivers/leds/leds-nic78bx.c                        |    1 -
 drivers/leds/leds-pca995x.c                        |    1 -
 drivers/leds/leds-regulator.c                      |    1 -
 drivers/leds/leds-spi-byte.c                       |    1 -
 drivers/leds/leds-sun50i-a100.c                    |    1 -
 drivers/leds/rgb/leds-group-multicolor.c           |    1 -
 drivers/leds/rgb/leds-mt6370-rgb.c                 |    1 -
 drivers/leds/rgb/leds-pwm-multicolor.c             |    1 -
 drivers/mailbox/mailbox-mpfs.c                     |    1 -
 drivers/mailbox/platform_mhu.c                     |    1 -
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    1 -
 drivers/media/firewire/firedtv-fw.c                |    1 -
 drivers/media/i2c/adv7180.c                        |    1 -
 drivers/media/i2c/cvs/core.c                       |    1 -
 drivers/media/i2c/gc0308.c                         |    1 -
 drivers/media/i2c/gc05a2.c                         |    1 -
 drivers/media/i2c/gc08a3.c                         |    1 -
 drivers/media/i2c/lm3560.c                         |    1 -
 drivers/media/i2c/mt9m114.c                        |    1 -
 drivers/media/i2c/mt9p031.c                        |    1 -
 drivers/media/i2c/mt9v032.c                        |    1 -
 drivers/media/i2c/ov2680.c                         |    1 -
 drivers/media/i2c/ov5640.c                         |    1 -
 drivers/media/i2c/ov5670.c                         |    1 -
 drivers/media/i2c/ov5675.c                         |    1 -
 drivers/media/i2c/ov64a40.c                        |    1 -
 drivers/media/i2c/ov7251.c                         |    1 -
 drivers/media/i2c/ov7670.c                         |    1 -
 drivers/media/i2c/ov8865.c                         |    1 -
 drivers/media/i2c/t4ka3.c                          |    1 -
 drivers/media/i2c/tvp514x.c                        |    1 -
 drivers/media/i2c/video-i2c.c                      |    1 -
 .../media/platform/arm/mali-c55/mali-c55-core.c    |    1 -
 drivers/media/platform/chips-media/coda/imx-vdoa.c |    1 -
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |    1 -
 .../media/platform/microchip/microchip-csi2dc.c    |    1 -
 drivers/media/platform/qcom/venus/vdec.c           |    1 -
 drivers/media/platform/qcom/venus/venc.c           |    1 -
 drivers/media/platform/renesas/rcar-fcp.c          |    1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |    1 -
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |    1 -
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    1 -
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |    1 -
 drivers/media/platform/ti/vpe/vip.c                |    1 +
 drivers/media/rc/ir-spi.c                          |    1 -
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/memory/stm32_omm.c                         |    1 -
 drivers/memory/tegra/tegra186-emc.c                |    1 -
 drivers/memory/tegra/tegra186.c                    |    1 -
 drivers/memory/tegra/tegra210-emc-core.c           |    1 -
 drivers/mfd/adp5585.c                              |    1 -
 drivers/mfd/atmel-hlcdc.c                          |    1 -
 drivers/mfd/atmel-smc.c                            |    1 -
 drivers/mfd/cros_ec_dev.c                          |    1 -
 drivers/mfd/cs42l43-i2c.c                          |    1 -
 drivers/mfd/cs42l43-sdw.c                          |    1 -
 drivers/mfd/hi655x-pmic.c                          |    1 -
 drivers/mfd/intel-lpss-acpi.c                      |    1 -
 drivers/mfd/intel-lpss-pci.c                       |    1 -
 drivers/mfd/intel_soc_pmic_bxtwc.c                 |    1 -
 drivers/mfd/intel_soc_pmic_crc.c                   |    1 -
 drivers/mfd/kempld-core.c                          |    1 -
 drivers/mfd/lochnagar-i2c.c                        |    1 -
 drivers/mfd/lp873x.c                               |    1 -
 drivers/mfd/lp87565.c                              |    1 -
 drivers/mfd/max14577.c                             |    1 -
 drivers/mfd/max7360.c                              |    1 -
 drivers/mfd/max77759.c                             |    1 -
 drivers/mfd/max77843.c                             |    1 -
 drivers/mfd/mc13xxx-spi.c                          |    1 -
 drivers/mfd/motorola-cpcap.c                       |    1 -
 drivers/mfd/ocelot-spi.c                           |    1 -
 drivers/mfd/rt5033.c                               |    1 -
 drivers/mfd/rt5120.c                               |    1 -
 drivers/mfd/rz-mtu3.c                              |    1 -
 drivers/mfd/sec-acpm.c                             |    1 -
 drivers/mfd/sec-i2c.c                              |    1 -
 drivers/mfd/simple-mfd-i2c.c                       |    1 -
 drivers/mfd/tps6594-i2c.c                          |    1 -
 drivers/mfd/tps6594-spi.c                          |    1 -
 drivers/mfd/upboard-fpga.c                         |    1 -
 drivers/mfd/wm831x-core.c                          |    1 -
 drivers/misc/eeprom/at24.c                         |    1 -
 drivers/misc/eeprom/ee1004.c                       |    1 -
 drivers/misc/eeprom/eeprom_93xx46.c                |    1 -
 drivers/misc/eeprom/idt_89hpesx.c                  |    1 -
 drivers/misc/hisi_hikey_usb.c                      |    1 -
 drivers/misc/pvpanic/pvpanic-mmio.c                |    1 -
 drivers/misc/pvpanic/pvpanic.c                     |    1 -
 drivers/misc/smpro-errmon.c                        |    1 -
 drivers/misc/smpro-misc.c                          |    1 -
 drivers/mmc/host/litex_mmc.c                       |    1 -
 drivers/mmc/host/owl-mmc.c                         |    1 -
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |    1 -
 drivers/mmc/host/renesas_sdhi_sys_dmac.c           |    1 -
 drivers/mmc/host/sdhci-npcm.c                      |    1 -
 drivers/mmc/host/sdhci-of-ma35d1.c                 |    1 -
 drivers/mmc/host/sh_mmcif.c                        |    1 -
 drivers/mmc/host/sunxi-mmc.c                       |    1 -
 drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c       |    1 -
 drivers/mux/adgs1408.c                             |    1 -
 drivers/mux/gpio.c                                 |    1 -
 drivers/net/can/spi/hi311x.c                       |    1 -
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c     |    1 -
 drivers/net/dsa/microchip/ksz8863_smi.c            |    1 -
 drivers/net/dsa/mt7530-mmio.c                      |    1 -
 drivers/net/dsa/ocelot/seville_vsc9953.c           |    1 -
 drivers/net/ethernet/calxeda/xgmac.c               |    1 -
 drivers/net/ethernet/ezchip/nps_enet.c             |    1 -
 drivers/net/ethernet/faraday/ftmac100.c            |    1 -
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c     |    1 -
 drivers/net/ethernet/freescale/enetc/enetc_ierb.c  |    1 -
 drivers/net/ethernet/ibm/emac/tah.c                |    1 -
 drivers/net/ethernet/ibm/emac/zmii.c               |    1 -
 drivers/net/ethernet/marvell/mvmdio.c              |    1 -
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_mdio.c |    1 -
 drivers/net/ethernet/mellanox/mlxsw/i2c.c          |    1 -
 drivers/net/ethernet/mellanox/mlxsw/minimal.c      |    1 -
 .../net/ethernet/stmicro/stmmac/dwmac-nuvoton.c    |    1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c |    1 -
 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c   |    1 -
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |    1 -
 drivers/net/ethernet/xscale/ptp_ixp46x.c           |    1 -
 drivers/net/ieee802154/mrf24j40.c                  |    1 -
 drivers/net/mdio/mdio-realtek-rtl9300.c            |    1 -
 drivers/net/mhi_net.c                              |    1 -
 drivers/net/wan/fsl_qmc_hdlc.c                     |    1 -
 drivers/net/wireless/ath/ath9k/ahb.c               |    1 -
 .../net/wireless/broadcom/brcm80211/brcmfmac/dmi.c |    1 -
 drivers/net/wireless/intersil/p54/p54spi.c         |    1 -
 drivers/net/wireless/ti/wl1251/sdio.c              |    1 -
 drivers/net/wireless/ti/wl12xx/main.c              |    1 -
 drivers/net/wireless/ti/wl18xx/main.c              |    1 -
 drivers/net/wwan/mhi_wwan_ctrl.c                   |    1 -
 drivers/net/wwan/mhi_wwan_mbim.c                   |    1 -
 drivers/net/wwan/qcom_bam_dmux.c                   |    1 -
 drivers/net/wwan/rpmsg_wwan_ctrl.c                 |    1 -
 drivers/nfc/microread/mei.c                        |    1 -
 drivers/nfc/pn544/mei.c                            |    1 -
 drivers/nfc/s3fwrn5/uart.c                         |    1 -
 drivers/nvmem/an8855-efuse.c                       |    1 -
 drivers/nvmem/apple-efuses.c                       |    1 -
 drivers/nvmem/brcm_nvram.c                         |    1 -
 drivers/nvmem/layerscape-sfp.c                     |    1 -
 drivers/nvmem/lpc18xx_eeprom.c                     |    1 -
 drivers/nvmem/max77759-nvmem.c                     |    1 -
 drivers/nvmem/mtk-efuse.c                          |    1 -
 drivers/nvmem/nintendo-otp.c                       |    1 -
 drivers/nvmem/qfprom.c                             |    1 -
 drivers/nvmem/qoriq-efuse.c                        |    1 -
 drivers/nvmem/rcar-efuse.c                         |    1 -
 drivers/nvmem/sec-qfprom.c                         |    1 -
 drivers/nvmem/sunplus-ocotp.c                      |    1 -
 drivers/nvmem/u-boot-env.c                         |    1 -
 drivers/nvmem/uniphier-efuse.c                     |    1 -
 drivers/of/device.c                                |    1 -
 drivers/pci/controller/cadence/pcie-sg2042.c       |    1 -
 drivers/pci/controller/dwc/pci-exynos.c            |    1 -
 drivers/pci/controller/dwc/pci-meson.c             |    1 -
 drivers/pci/controller/dwc/pcie-intel-gw.c         |    1 -
 drivers/pci/controller/dwc/pcie-keembay.c          |    1 -
 drivers/pci/controller/dwc/pcie-spacemit-k1.c      |    1 -
 drivers/pci/controller/dwc/pcie-stm32.c            |    1 -
 drivers/pci/pwrctrl/generic.c                      |    1 -
 drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c           |    1 -
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           |    1 -
 drivers/perf/arm-ccn.c                             |    1 -
 drivers/perf/fujitsu_uncore_pmu.c                  |    1 -
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c        |    1 -
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c       |    1 -
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c        |    1 -
 drivers/perf/riscv_pmu_legacy.c                    |    1 -
 drivers/perf/riscv_pmu_sbi.c                       |    1 -
 drivers/perf/starfive_starlink_pmu.c               |    1 -
 drivers/phy/allwinner/phy-sun50i-usb3.c            |    1 -
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c      |    1 -
 drivers/phy/amlogic/phy-meson-axg-pcie.c           |    1 -
 drivers/phy/amlogic/phy-meson-gxl-usb2.c           |    1 -
 drivers/phy/amlogic/phy-meson8b-usb2.c             |    1 -
 drivers/phy/cadence/cdns-dphy-rx.c                 |    1 -
 drivers/phy/hisilicon/phy-hi3670-pcie.c            |    1 -
 drivers/phy/hisilicon/phy-hi6220-usb.c             |    1 -
 drivers/phy/intel/phy-intel-keembay-usb.c          |    1 -
 drivers/phy/marvell/phy-mmp3-hsic.c                |    1 -
 drivers/phy/marvell/phy-mmp3-usb.c                 |    1 -
 drivers/phy/marvell/phy-mvebu-sata.c               |    1 -
 drivers/phy/mediatek/phy-mtk-ufs.c                 |    1 -
 drivers/phy/phy-eyeq5-eth.c                        |    1 -
 drivers/phy/phy-snps-eusb2.c                       |    1 -
 drivers/phy/qualcomm/phy-ath79-usb.c               |    1 -
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |    1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c          |    1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |    1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |    1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |    1 -
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |    1 -
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |    1 -
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |    1 -
 drivers/pinctrl/freescale/pinctrl-imx23.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx25.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx27.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx28.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx35.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx50.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx51.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx53.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6sll.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx91.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx93.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-vf610.c          |    1 -
 drivers/pinctrl/intel/pinctrl-alderlake.c          |    1 -
 drivers/pinctrl/intel/pinctrl-broxton.c            |    1 -
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |    1 -
 drivers/pinctrl/intel/pinctrl-denverton.c          |    1 -
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |    1 -
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |    1 -
 drivers/pinctrl/intel/pinctrl-geminilake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-intel-platform.c     |    1 -
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-lakefield.c          |    1 -
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |    1 -
 drivers/pinctrl/intel/pinctrl-merrifield.c         |    1 -
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-meteorpoint.c        |    1 -
 drivers/pinctrl/intel/pinctrl-moorefield.c         |    1 -
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |    1 -
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |    1 -
 drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c    |    1 -
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c     |    1 -
 drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c  |    1 -
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c           |    1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |    1 -
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |    1 -
 drivers/pinctrl/pinctrl-as3722.c                   |    1 -
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |    1 -
 drivers/pinctrl/pinctrl-da850-pupd.c               |    1 -
 drivers/pinctrl/pinctrl-digicolor.c                |    1 -
 drivers/pinctrl/pinctrl-eic7700.c                  |    1 -
 drivers/pinctrl/pinctrl-eyeq5.c                    |    1 -
 drivers/pinctrl/pinctrl-ingenic.c                  |    1 -
 drivers/pinctrl/pinctrl-loongson2.c                |    1 -
 drivers/pinctrl/pinctrl-lpc18xx.c                  |    1 -
 drivers/pinctrl/pinctrl-max77620.c                 |    1 -
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    1 -
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c             |    1 -
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |    1 -
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |    1 -
 drivers/pinctrl/pinctrl-mlxbf3.c                   |    1 -
 drivers/pinctrl/pinctrl-pistachio.c                |    1 -
 drivers/pinctrl/pinctrl-scmi.c                     |    1 -
 drivers/pinctrl/pinctrl-th1520.c                   |    1 -
 drivers/pinctrl/pinctrl-tps6594.c                  |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |    1 -
 drivers/pinctrl/spear/pinctrl-spear1310.c          |    1 -
 drivers/pinctrl/spear/pinctrl-spear1340.c          |    1 -
 drivers/pinctrl/spear/pinctrl-spear300.c           |    1 -
 drivers/pinctrl/spear/pinctrl-spear310.c           |    1 -
 drivers/pinctrl/spear/pinctrl-spear320.c           |    1 -
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |    1 -
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |    1 -
 .../pinctrl/starfive/pinctrl-starfive-jh7110-aon.c |    1 -
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |    1 -
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra234.c           |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra238.c           |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra264.c           |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c    |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c    |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c   |    1 -
 drivers/platform/chrome/cros_ec_chardev.c          |    1 -
 drivers/platform/chrome/cros_ec_debugfs.c          |    1 -
 drivers/platform/chrome/cros_ec_lightbar.c         |    1 -
 drivers/platform/chrome/cros_ec_sensorhub.c        |    1 -
 drivers/platform/chrome/cros_ec_sysfs.c            |    1 -
 drivers/platform/chrome/cros_ec_vbc.c              |    1 -
 drivers/platform/chrome/cros_kbd_led_backlight.c   |    1 -
 drivers/platform/chrome/cros_usbpd_logger.c        |    1 -
 drivers/platform/chrome/cros_usbpd_notify.c        |    1 -
 drivers/platform/chrome/wilco_ec/core.c            |    1 -
 drivers/platform/chrome/wilco_ec/debugfs.c         |    1 -
 drivers/platform/chrome/wilco_ec/telemetry.c       |    1 -
 drivers/platform/goldfish/goldfish_pipe.c          |    1 -
 drivers/platform/x86/asus-tf103c-dock.c            |    1 -
 drivers/platform/x86/intel/atomisp2/led.c          |    1 -
 drivers/platform/x86/intel/atomisp2/pm.c           |    1 -
 drivers/platform/x86/intel/bxtwc_tmu.c             |    1 -
 drivers/platform/x86/intel/ehl_pse_io.c            |    1 -
 drivers/platform/x86/intel/plr_tpmi.c              |    1 -
 drivers/platform/x86/intel/pmc/pwrm_telemetry.c    |    1 -
 drivers/platform/x86/intel/punit_ipc.c             |    1 -
 drivers/platform/x86/intel_scu_pltdrv.c            |    1 -
 drivers/platform/x86/msi-ec.c                      |    1 +
 drivers/platform/x86/nvidia-wmi-ec-backlight.c     |    1 -
 drivers/platform/x86/quickstart.c                  |    1 -
 drivers/platform/x86/uniwill/uniwill-wmi.c         |    1 -
 drivers/platform/x86/x86-android-tablets/dmi.c     |    1 -
 .../x86/x86-android-tablets/x86-android-tablets.h  |    1 +
 drivers/pmdomain/actions/owl-sps.c                 |    1 -
 drivers/pmdomain/imx/imx93-pd.c                    |    1 -
 .../pmdomain/marvell/pxa1908-power-controller.c    |    1 -
 drivers/pnp/pnpacpi/core.c                         |    1 -
 drivers/power/reset/brcm-kona-reset.c              |    1 -
 drivers/power/reset/ep93xx-restart.c               |    1 -
 drivers/power/reset/gpio-poweroff.c                |    1 -
 drivers/power/reset/ltc2952-poweroff.c             |    1 -
 drivers/power/reset/macsmc-reboot.c                |    1 -
 drivers/power/reset/ocelot-reset.c                 |    1 -
 drivers/power/reset/pwr-mlxbf.c                    |    1 -
 drivers/power/reset/qemu-virt-ctrl.c               |    1 -
 drivers/power/reset/sc27xx-poweroff.c              |    1 -
 drivers/power/reset/spacemit-p1-reboot.c           |    1 -
 drivers/power/reset/tdx-ec-poweroff.c              |    1 -
 drivers/power/reset/tps65086-restart.c             |    1 -
 drivers/power/sequencing/pwrseq-pcie-m2.c          |    1 -
 drivers/power/sequencing/pwrseq-qcom-wcn.c         |    1 -
 drivers/power/supply/adp5061.c                     |    1 -
 drivers/power/supply/bd71828-power.c               |    1 -
 drivers/power/supply/bd99954-charger.c             |    1 -
 drivers/power/supply/bq24190_charger.c             |    1 -
 drivers/power/supply/chagall-battery.c             |    1 -
 drivers/power/supply/cpcap-charger.c               |    1 -
 drivers/power/supply/cros_charge-control.c         |    1 -
 drivers/power/supply/cros_peripheral_charger.c     |    1 -
 drivers/power/supply/cros_usbpd-charger.c          |    1 -
 drivers/power/supply/lego_ev3_battery.c            |    1 -
 drivers/power/supply/max14656_charger_detector.c   |    1 -
 drivers/power/supply/max17042_battery.c            |    1 -
 drivers/power/supply/max77759_charger.c            |    1 -
 drivers/power/supply/max8971_charger.c             |    1 -
 drivers/power/supply/max8998_charger.c             |    1 -
 drivers/power/supply/mp2629_charger.c              |    1 -
 drivers/power/supply/olpc_battery.c                |    1 -
 drivers/power/supply/pm8916_bms_vm.c               |    1 -
 drivers/power/supply/pm8916_lbc.c                  |    1 -
 drivers/power/supply/rt5033_charger.c              |    1 -
 drivers/power/supply/rt9467-charger.c              |    1 -
 drivers/power/supply/rt9471.c                      |    1 -
 drivers/power/supply/rt9756.c                      |    1 -
 drivers/power/supply/s2mu005-battery.c             |    1 -
 drivers/power/supply/ug3105_battery.c              |    1 -
 drivers/pps/clients/pps-gpio.c                     |    1 -
 drivers/pps/generators/pps_gen_tio.c               |    1 -
 drivers/ptp/ptp_dte.c                              |    1 -
 drivers/pwm/pwm-adp5585.c                          |    1 -
 drivers/pwm/pwm-airoha.c                           |    1 -
 drivers/pwm/pwm-apple.c                            |    1 -
 drivers/pwm/pwm-berlin.c                           |    1 -
 drivers/pwm/pwm-ep93xx.c                           |    1 -
 drivers/pwm/pwm-gpio.c                             |    1 -
 drivers/pwm/pwm-intel-lgm.c                        |    1 -
 drivers/pwm/pwm-keembay.c                          |    1 -
 drivers/pwm/pwm-lpc18xx-sct.c                      |    1 -
 drivers/pwm/pwm-lpss-platform.c                    |    1 -
 drivers/pwm/pwm-max7360.c                          |    1 -
 drivers/pwm/pwm-pxa.c                              |    1 -
 drivers/pwm/pwm-sifive.c                           |    1 -
 drivers/pwm/pwm-sl28cpld.c                         |    1 -
 drivers/pwm/pwm-sprd.c                             |    1 -
 drivers/pwm/pwm-sunplus.c                          |    1 -
 drivers/pwm/pwm-vt8500.c                           |    1 -
 drivers/regulator/adp5055-regulator.c              |    1 -
 drivers/regulator/bd71828-regulator.c              |    1 -
 drivers/regulator/max77541-regulator.c             |    1 -
 drivers/regulator/max77675-regulator.c             |    1 -
 drivers/regulator/mt6370-regulator.c               |    1 -
 drivers/regulator/pv88080-regulator.c              |    1 -
 drivers/regulator/rt4803.c                         |    1 -
 drivers/regulator/rt5739.c                         |    1 -
 drivers/regulator/rt6190-regulator.c               |    1 -
 drivers/regulator/rt8092.c                         |    1 -
 drivers/regulator/rtq2208-regulator.c              |    1 -
 drivers/regulator/tps6287x-regulator.c             |    1 -
 drivers/regulator/tps65218-regulator.c             |    1 -
 drivers/regulator/tps65912-regulator.c             |    1 -
 drivers/regulator/vexpress-regulator.c             |    1 -
 drivers/reset/reset-ath79.c                        |    1 -
 drivers/reset/reset-axs10x.c                       |    1 -
 drivers/reset/reset-bcm6345.c                      |    1 -
 drivers/reset/reset-eyeq.c                         |    1 -
 drivers/reset/reset-gpio.c                         |    1 -
 drivers/reset/reset-sunplus.c                      |    1 -
 drivers/reset/reset-tn48m.c                        |    1 -
 drivers/reset/starfive/reset-starfive-jh7100.c     |    1 -
 drivers/rtc/rtc-88pm886.c                          |    1 -
 drivers/rtc/rtc-cpcap.c                            |    1 -
 drivers/rtc/rtc-cros-ec.c                          |    1 -
 drivers/rtc/rtc-ds1307.c                           |    1 -
 drivers/rtc/rtc-ep93xx.c                           |    1 -
 drivers/rtc/rtc-fsl-ftm-alarm.c                    |    1 -
 drivers/rtc/rtc-ftrtc010.c                         |    1 -
 drivers/rtc/rtc-lpc24xx.c                          |    1 -
 drivers/rtc/rtc-m48t86.c                           |    1 -
 drivers/rtc/rtc-mc13xxx.c                          |    1 -
 drivers/rtc/rtc-moxart.c                           |    1 -
 drivers/rtc/rtc-msc313.c                           |    1 -
 drivers/rtc/rtc-mt6397.c                           |    1 -
 drivers/rtc/rtc-mt7622.c                           |    1 -
 drivers/rtc/rtc-mxc_v2.c                           |    1 -
 drivers/rtc/rtc-r7301.c                            |    1 -
 drivers/rtc/rtc-rzn1.c                             |    1 -
 drivers/rtc/rtc-sh.c                               |    1 -
 drivers/rtc/rtc-ssd202d.c                          |    1 -
 drivers/rtc/rtc-tegra.c                            |    1 -
 drivers/rtc/rtc-ti-k3.c                            |    1 -
 drivers/rtc/rtc-tps6594.c                          |    1 -
 drivers/s390/crypto/ap_bus.c                       |    2 +-
 drivers/s390/crypto/vfio_ap_drv.c                  |    2 +-
 drivers/s390/crypto/zcrypt_cex4.c                  |    2 +-
 drivers/siox/siox-bus-gpio.c                       |    1 -
 drivers/soc/fsl/qe/qe.c                            |    1 -
 drivers/soc/qcom/qcom_pd_mapper.c                  |    1 -
 drivers/soc/renesas/rzn1_irqmux.c                  |    1 -
 drivers/soc/sophgo/sg2044-topsys.c                 |    1 -
 drivers/soc/tegra/fuse/fuse-tegra.c                |    1 -
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |    1 -
 drivers/soc/ti/smartreflex.c                       |    1 -
 drivers/soundwire/bus.c                            |    1 -
 drivers/soundwire/bus_type.c                       |    1 -
 drivers/soundwire/cadence_master.c                 |    1 -
 drivers/soundwire/debugfs.c                        |    1 -
 drivers/soundwire/generic_bandwidth_allocation.c   |    1 -
 drivers/soundwire/mipi_disco.c                     |    1 -
 drivers/soundwire/stream.c                         |    1 -
 drivers/soundwire/sysfs_slave.c                    |    1 -
 drivers/soundwire/sysfs_slave_dpn.c                |    1 -
 drivers/spi/spi-atcspi200.c                        |    1 -
 drivers/spi/spi-cs42l43.c                          |    1 -
 drivers/spi/spi-gpio.c                             |    1 -
 drivers/spi/spi-hisi-sfc-v3xx.c                    |    1 -
 drivers/spi/spi-loongson-pci.c                     |    1 -
 drivers/spi/spi-loongson-plat.c                    |    1 -
 drivers/spi/spi-loopback-test.c                    |    1 -
 .../spi/spi-offload-trigger-adi-util-sigma-delta.c |    1 -
 drivers/spi/spi-offload-trigger-pwm.c              |    1 -
 drivers/spi/spi-pxa2xx-platform.c                  |    1 -
 drivers/spi/spi-realtek-rtl-snand.c                |    1 -
 drivers/spi/spi-realtek-rtl.c                      |    1 -
 drivers/spi/spi-sc18is602.c                        |    1 -
 drivers/spi/spi-wpcm-fiu.c                         |    1 -
 drivers/spi/spi.c                                  |    1 -
 drivers/spi/spidev.c                               |    1 -
 drivers/spmi/spmi-apple-controller.c               |    1 -
 drivers/staging/greybus/arche-apb-ctrl.c           |    1 -
 drivers/staging/iio/frequency/ad9832.c             |    1 -
 drivers/staging/iio/frequency/ad9834.c             |    1 -
 drivers/thermal/loongson2_thermal.c                |    1 -
 drivers/thermal/renesas/rzg2l_thermal.c            |    1 -
 drivers/tty/goldfish.c                             |    1 -
 drivers/tty/serial/8250/8250_dfl.c                 |    1 -
 drivers/tty/serial/8250/8250_dw.c                  |    1 -
 drivers/tty/serial/8250/8250_em.c                  |    1 -
 drivers/tty/serial/8250/8250_keba.c                |    1 -
 drivers/tty/serial/8250/8250_loongson.c            |    1 -
 drivers/tty/serial/8250/8250_ni.c                  |    1 -
 drivers/tty/serial/max3100.c                       |    1 -
 drivers/tty/serial/max310x.c                       |    1 -
 drivers/tty/serial/sc16is7xx.c                     |    1 -
 drivers/tty/serial/sc16is7xx_i2c.c                 |    1 -
 drivers/tty/serial/sc16is7xx_spi.c                 |    1 -
 drivers/tty/serial/sccnxp.c                        |    1 -
 drivers/tty/serial/tegra-utc.c                     |    1 -
 drivers/uio/uio_pdrv_genirq.c                      |    1 -
 drivers/usb/dwc2/core.h                            |    1 +
 drivers/usb/gadget/udc/renesas_usbf.c              |    1 -
 drivers/usb/misc/usb-ljca.c                        |    1 -
 drivers/usb/typec/mux/tusb1046.c                   |    1 -
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |    1 -
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |    1 -
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |    1 -
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |    1 -
 drivers/usb/typec/tcpm/tcpci_mt6370.c              |    1 -
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             |    1 -
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |    1 -
 drivers/vdpa/vdpa.c                                |    1 -
 drivers/vdpa/vdpa_user/vduse_dev.c                 |    1 -
 drivers/video/backlight/apple_dwi_bl.c             |    1 -
 drivers/video/backlight/da9052_bl.c                |    1 -
 drivers/video/backlight/hx8357.c                   |    1 -
 drivers/video/backlight/ktd2801-backlight.c        |    1 -
 drivers/video/backlight/mp3309c.c                  |    1 -
 drivers/video/backlight/mt6370-backlight.c         |    1 -
 drivers/video/backlight/rave-sp-backlight.c        |    1 -
 drivers/video/backlight/rt4831-backlight.c         |    1 -
 .../fbdev/omap2/omapfb/displays/encoder-opa362.c   |    1 -
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |    1 -
 .../omap2/omapfb/displays/encoder-tpd12s015.c      |    1 -
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |    1 -
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c    |    2 +-
 drivers/virt/coco/tdx-guest/tdx-guest.c            |    1 -
 drivers/virt/coco/tdx-host/tdx-host.c              |    1 -
 drivers/w1/masters/amd_axi_w1.c                    |    1 -
 drivers/w1/masters/ds2490.c                        |    1 -
 drivers/w1/masters/mxc_w1.c                        |    1 -
 drivers/w1/masters/sgi_w1.c                        |    1 -
 drivers/w1/masters/w1-gpio.c                       |    1 -
 drivers/watchdog/at91rm9200_wdt.c                  |    1 -
 drivers/watchdog/cros_ec_wdt.c                     |    1 -
 drivers/watchdog/davinci_wdt.c                     |    1 -
 drivers/watchdog/ftwdt010_wdt.c                    |    1 -
 drivers/watchdog/gpio_wdt.c                        |    1 -
 drivers/watchdog/gunyah_wdt.c                      |    1 -
 drivers/watchdog/imgpdc_wdt.c                      |    1 -
 drivers/watchdog/keembay_wdt.c                     |    1 -
 drivers/watchdog/max63xx_wdt.c                     |    1 -
 drivers/watchdog/max77620_wdt.c                    |    1 -
 drivers/watchdog/meson_wdt.c                       |    1 -
 drivers/watchdog/moxart_wdt.c                      |    1 -
 drivers/watchdog/msc313e_wdt.c                     |    1 -
 drivers/watchdog/mt7621_wdt.c                      |    1 -
 drivers/watchdog/nic7018_wdt.c                     |    1 -
 drivers/watchdog/omap_wdt.c                        |    1 -
 drivers/watchdog/pseries-wdt.c                     |    1 -
 drivers/watchdog/realtek_otto_wdt.c                |    1 -
 drivers/watchdog/rt2880_wdt.c                      |    1 -
 drivers/watchdog/rti_wdt.c                         |    1 -
 drivers/watchdog/sbsa_gwdt.c                       |    1 -
 drivers/watchdog/sl28cpld_wdt.c                    |    1 -
 drivers/watchdog/sunplus_wdt.c                     |    1 -
 drivers/watchdog/ts72xx_wdt.c                      |    1 -
 drivers/watchdog/twl4030_wdt.c                     |    1 -
 drivers/watchdog/xilinx_wwdt.c                     |    1 -
 include/linux/acpi.h                               |    2 +-
 include/linux/amba/bus.h                           |    2 +-
 include/linux/auxiliary_bus.h                      |    2 +-
 include/linux/bcma/bcma.h                          |    2 +-
 include/linux/cdx/cdx_bus.h                        |    2 +-
 include/linux/device-id/acpi.h                     |   32 +
 include/linux/device-id/amba.h                     |   19 +
 include/linux/device-id/ap.h                       |   20 +
 include/linux/device-id/apr.h                      |   21 +
 include/linux/device-id/auxiliary.h                |   17 +
 include/linux/device-id/bcma.h                     |   25 +
 include/linux/device-id/ccw.h                      |   27 +
 include/linux/device-id/cdx.h                      |   40 +
 include/linux/device-id/coreboot.h                 |   20 +
 include/linux/device-id/css.h                      |   17 +
 include/linux/device-id/dfl.h                      |   34 +
 include/linux/device-id/dmi.h                      |   58 ++
 include/linux/device-id/eisa.h                     |   21 +
 include/linux/device-id/fsl_mc.h                   |   22 +
 include/linux/device-id/hda.h                      |   17 +
 include/linux/device-id/hid.h                      |   22 +
 include/linux/device-id/hv_vmbus.h                 |   18 +
 include/linux/device-id/i2c.h                      |   19 +
 include/linux/device-id/i3c.h                      |   26 +
 include/linux/device-id/ieee1394.h                 |   27 +
 include/linux/device-id/input.h                    |   62 ++
 include/linux/device-id/ipack.h                    |   17 +
 include/linux/device-id/isapnp.h                   |   16 +
 include/linux/device-id/ishtp.h                    |   24 +
 include/linux/device-id/mcb.h                      |   15 +
 include/linux/device-id/mdio.h                     |   35 +
 include/linux/device-id/mei_cl.h                   |   31 +
 include/linux/device-id/mhi.h                      |   24 +
 include/linux/device-id/mips_cdmm.h                |   17 +
 include/linux/device-id/of.h                       |   15 +
 include/linux/device-id/parisc.h                   |   21 +
 include/linux/device-id/pci.h                      |   54 ++
 include/linux/device-id/pcmcia.h                   |   48 +
 include/linux/device-id/platform.h                 |   17 +
 include/linux/device-id/pnp.h                      |   26 +
 include/linux/device-id/rio.h                      |   28 +
 include/linux/device-id/rpmsg.h                    |   19 +
 include/linux/device-id/sdio.h                     |   21 +
 include/linux/device-id/sdw.h                      |   18 +
 include/linux/device-id/serio.h                    |   18 +
 include/linux/device-id/slim.h                     |   23 +
 include/linux/device-id/spi.h                      |   19 +
 include/linux/device-id/spmi.h                     |   17 +
 include/linux/device-id/ssam.h                     |   28 +
 include/linux/device-id/ssb.h                      |   24 +
 include/linux/device-id/tb.h                       |   37 +
 include/linux/device-id/tee_client.h               |   18 +
 include/linux/device-id/typec.h                    |   26 +
 include/linux/device-id/ulpi.h                     |   16 +
 include/linux/device-id/usb.h                      |  111 +++
 include/linux/device-id/vchiq.h                    |    9 +
 include/linux/device-id/vio.h                      |   11 +
 include/linux/device-id/virtio.h                   |   16 +
 include/linux/device-id/wmi.h                      |   19 +
 include/linux/device-id/x86_cpu.h                  |   44 +
 include/linux/device-id/zorro.h                    |   19 +
 include/linux/device/driver.h                      |    2 +
 include/linux/dfl.h                                |    2 +-
 include/linux/dmi.h                                |    2 +-
 include/linux/eisa.h                               |    2 +-
 include/linux/firewire.h                           |    3 +-
 include/linux/fsl/mc.h                             |    2 +-
 include/linux/hid.h                                |    2 +-
 include/linux/hyperv.h                             |    2 +-
 include/linux/i2c.h                                |    2 +-
 include/linux/i3c/device.h                         |    2 +-
 include/linux/input.h                              |    2 +-
 include/linux/intel-ish-client-if.h                |    2 +-
 include/linux/ipack.h                              |    2 +-
 include/linux/isapnp.h                             |    2 +-
 include/linux/mcb.h                                |    2 +-
 include/linux/mei_cl_bus.h                         |    2 +-
 include/linux/mhi.h                                |    1 +
 include/linux/mmc/sdio_func.h                      |    2 +-
 include/linux/mod_devicetable.h                    | 1014 ++--------------=
----
 include/linux/of.h                                 |    2 +-
 include/linux/of_platform.h                        |    4 +-
 include/linux/pci-epf.h                            |    2 +-
 include/linux/pci.h                                |    2 +-
 include/linux/phy.h                                |    2 +-
 include/linux/platform_data/x86/int3472.h          |    2 +-
 include/linux/platform_data/x86/soc.h              |    2 +-
 include/linux/platform_device.h                    |    2 +-
 include/linux/pnp.h                                |    2 +-
 include/linux/raspberrypi/vchiq_bus.h              |    2 +-
 include/linux/rio.h                                |    2 +-
 include/linux/rpmsg.h                              |    2 +-
 include/linux/serio.h                              |    2 +-
 include/linux/slimbus.h                            |    2 +-
 include/linux/soc/qcom/apr.h                       |    2 +-
 include/linux/soundwire/sdw.h                      |    2 +-
 include/linux/spi/spi.h                            |    4 +-
 include/linux/ssb/ssb.h                            |    2 +-
 include/linux/surface_aggregator/device.h          |    2 +-
 include/linux/tee_drv.h                            |    2 +-
 include/linux/thunderbolt.h                        |    2 +-
 include/linux/ulpi/driver.h                        |    2 +-
 include/linux/usb.h                                |    2 +-
 include/linux/usb/serial.h                         |    1 +
 include/linux/usb/typec_altmode.h                  |    2 +-
 include/linux/virtio.h                             |    2 +-
 include/linux/wmi.h                                |    2 +-
 include/linux/zorro.h                              |    2 +-
 include/pcmcia/ds.h                                |    2 +-
 include/sound/hda_codec.h                          |    2 +-
 include/sound/hdaudio.h                            |    1 +
 net/qrtr/mhi.c                                     |    1 -
 net/rfkill/rfkill-gpio.c                           |    1 -
 sound/atmel/ac97c.c                                |    1 -
 sound/firewire/isight.c                            |    1 -
 sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c     |    1 -
 sound/hda/codecs/side-codecs/cs35l41_hda_spi.c     |    1 -
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |    1 -
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |    1 -
 sound/hda/core/hda_bus_type.c                      |    1 -
 sound/soc/atmel/sam9x5_wm8731.c                    |    1 -
 sound/soc/codecs/adau1372-i2c.c                    |    1 -
 sound/soc/codecs/adau1372-spi.c                    |    1 -
 sound/soc/codecs/adau1372.c                        |    1 -
 sound/soc/codecs/adau1761-i2c.c                    |    1 -
 sound/soc/codecs/adau1761-spi.c                    |    1 -
 sound/soc/codecs/adau1781-i2c.c                    |    1 -
 sound/soc/codecs/adau1781-spi.c                    |    1 -
 sound/soc/codecs/adau1977-i2c.c                    |    1 -
 sound/soc/codecs/adau1977-spi.c                    |    1 -
 sound/soc/codecs/adau7118-hw.c                     |    1 -
 sound/soc/codecs/ak4104.c                          |    1 -
 sound/soc/codecs/audio-iio-aux.c                   |    1 -
 sound/soc/codecs/cs4234.c                          |    1 -
 sound/soc/codecs/cs4270.c                          |    1 -
 sound/soc/codecs/cs42l42-sdw.c                     |    1 -
 sound/soc/codecs/cs42l43.c                         |    1 -
 sound/soc/codecs/cs42xx8-i2c.c                     |    1 -
 sound/soc/codecs/cs42xx8-spi.c                     |    1 -
 sound/soc/codecs/cs4349.c                          |    1 -
 sound/soc/codecs/es8316.c                          |    1 -
 sound/soc/codecs/es8323.c                          |    1 -
 sound/soc/codecs/es9356.c                          |    1 -
 sound/soc/codecs/max98357a.c                       |    1 -
 sound/soc/codecs/max98373-i2c.c                    |    1 -
 sound/soc/codecs/max98373-sdw.c                    |    1 -
 sound/soc/codecs/max98388.c                        |    1 -
 sound/soc/codecs/mt6351.c                          |    1 -
 sound/soc/codecs/mt6358.c                          |    1 -
 sound/soc/codecs/pcm3168a-i2c.c                    |    1 -
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    1 -
 sound/soc/codecs/rt1308-sdw.c                      |    1 -
 sound/soc/codecs/rt1316-sdw.c                      |    1 -
 sound/soc/codecs/rt1318-sdw.c                      |    1 -
 sound/soc/codecs/rt1320-sdw.c                      |    1 -
 sound/soc/codecs/rt700-sdw.c                       |    1 -
 sound/soc/codecs/rt711-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt711-sdw.c                       |    1 -
 sound/soc/codecs/rt712-sdca-dmic.c                 |    1 -
 sound/soc/codecs/rt712-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt715-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt715-sdw.c                       |    1 -
 sound/soc/codecs/rt721-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt722-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt9123.c                          |    1 -
 sound/soc/codecs/rt9123p.c                         |    1 -
 sound/soc/codecs/rtq9124.c                         |    1 -
 sound/soc/codecs/rtq9128.c                         |    1 -
 sound/soc/codecs/sdw-mockup.c                      |    1 -
 sound/soc/codecs/simple-amplifier.c                |    1 -
 sound/soc/codecs/sma1303.c                         |    1 -
 sound/soc/codecs/src4xxx-i2c.c                     |    1 -
 sound/soc/codecs/uda1334.c                         |    1 -
 sound/soc/codecs/wm8510.c                          |    1 -
 sound/soc/codecs/wm8523.c                          |    1 -
 sound/soc/codecs/wm8524.c                          |    1 -
 sound/soc/codecs/wm8580.c                          |    1 -
 sound/soc/codecs/wm8711.c                          |    1 -
 sound/soc/codecs/wm8728.c                          |    1 -
 sound/soc/codecs/wm8731-i2c.c                      |    1 -
 sound/soc/codecs/wm8731-spi.c                      |    1 -
 sound/soc/codecs/wm8737.c                          |    1 -
 sound/soc/codecs/wm8753.c                          |    1 -
 sound/soc/codecs/wm8770.c                          |    1 -
 sound/soc/codecs/wm8776.c                          |    1 -
 sound/soc/fsl/fsl_aud2htx.c                        |    1 -
 sound/soc/fsl/mpc5200_psc_ac97.c                   |    1 -
 .../soc/generic/audio-graph-card2-custom-sample.c  |    1 -
 sound/soc/jz4740/jz4740-i2s.c                      |    1 -
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |    1 -
 sound/soc/qcom/apq8096.c                           |    1 -
 sound/soc/qcom/sc7280.c                            |    1 -
 sound/soc/qcom/storm.c                             |    1 -
 sound/soc/sdca/sdca_class.c                        |    1 -
 sound/soc/sof/sof-client-ipc-flood-test.c          |    1 -
 sound/soc/sof/sof-client-ipc-kernel-injector.c     |    1 -
 sound/soc/sof/sof-client-ipc-msg-injector.c        |    1 -
 sound/soc/sunxi/sun50i-codec-analog.c              |    1 -
 sound/soc/sunxi/sun50i-dmic.c                      |    1 -
 sound/soc/tegra/tegra186_asrc.c                    |    1 -
 sound/soc/tegra/tegra186_dspk.c                    |    1 -
 sound/soc/tegra/tegra20_spdif.c                    |    1 -
 sound/soc/tegra/tegra210_adx.c                     |    1 -
 sound/soc/tegra/tegra210_amx.c                     |    1 -
 sound/soc/tegra/tegra210_dmic.c                    |    1 -
 sound/soc/tegra/tegra210_i2s.c                     |    1 -
 sound/soc/tegra/tegra210_mixer.c                   |    1 -
 sound/soc/tegra/tegra210_mvc.c                     |    1 -
 sound/soc/tegra/tegra210_ope.c                     |    1 -
 sound/soc/ti/omap-dmic.c                           |    1 -
 sound/soc/ti/omap-mcpdm.c                          |    1 -
 tools/testing/cxl/test/mem.c                       |    1 -
 1650 files changed, 1606 insertions(+), 2544 deletions(-)
 create mode 100644 include/linux/device-id/acpi.h
 create mode 100644 include/linux/device-id/amba.h
 create mode 100644 include/linux/device-id/ap.h
 create mode 100644 include/linux/device-id/apr.h
 create mode 100644 include/linux/device-id/auxiliary.h
 create mode 100644 include/linux/device-id/bcma.h
 create mode 100644 include/linux/device-id/ccw.h
 create mode 100644 include/linux/device-id/cdx.h
 create mode 100644 include/linux/device-id/coreboot.h
 create mode 100644 include/linux/device-id/css.h
 create mode 100644 include/linux/device-id/dfl.h
 create mode 100644 include/linux/device-id/dmi.h
 create mode 100644 include/linux/device-id/eisa.h
 create mode 100644 include/linux/device-id/fsl_mc.h
 create mode 100644 include/linux/device-id/hda.h
 create mode 100644 include/linux/device-id/hid.h
 create mode 100644 include/linux/device-id/hv_vmbus.h
 create mode 100644 include/linux/device-id/i2c.h
 create mode 100644 include/linux/device-id/i3c.h
 create mode 100644 include/linux/device-id/ieee1394.h
 create mode 100644 include/linux/device-id/input.h
 create mode 100644 include/linux/device-id/ipack.h
 create mode 100644 include/linux/device-id/isapnp.h
 create mode 100644 include/linux/device-id/ishtp.h
 create mode 100644 include/linux/device-id/mcb.h
 create mode 100644 include/linux/device-id/mdio.h
 create mode 100644 include/linux/device-id/mei_cl.h
 create mode 100644 include/linux/device-id/mhi.h
 create mode 100644 include/linux/device-id/mips_cdmm.h
 create mode 100644 include/linux/device-id/of.h
 create mode 100644 include/linux/device-id/parisc.h
 create mode 100644 include/linux/device-id/pci.h
 create mode 100644 include/linux/device-id/pcmcia.h
 create mode 100644 include/linux/device-id/platform.h
 create mode 100644 include/linux/device-id/pnp.h
 create mode 100644 include/linux/device-id/rio.h
 create mode 100644 include/linux/device-id/rpmsg.h
 create mode 100644 include/linux/device-id/sdio.h
 create mode 100644 include/linux/device-id/sdw.h
 create mode 100644 include/linux/device-id/serio.h
 create mode 100644 include/linux/device-id/slim.h
 create mode 100644 include/linux/device-id/spi.h
 create mode 100644 include/linux/device-id/spmi.h
 create mode 100644 include/linux/device-id/ssam.h
 create mode 100644 include/linux/device-id/ssb.h
 create mode 100644 include/linux/device-id/tb.h
 create mode 100644 include/linux/device-id/tee_client.h
 create mode 100644 include/linux/device-id/typec.h
 create mode 100644 include/linux/device-id/ulpi.h
 create mode 100644 include/linux/device-id/usb.h
 create mode 100644 include/linux/device-id/vchiq.h
 create mode 100644 include/linux/device-id/vio.h
 create mode 100644 include/linux/device-id/virtio.h
 create mode 100644 include/linux/device-id/wmi.h
 create mode 100644 include/linux/device-id/x86_cpu.h
 create mode 100644 include/linux/device-id/zorro.h

--sqgtpm7i2tgva2ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpHUNIACgkQj4D7WH0S
/k6K/gf/QKwBfI/e9wmq/4p7sgg1zwfLkhF4t/tY4EQjWxmYW8GmIGhzb8laWIWh
1CLJmxUa877jzlOi39Q0ESoOU7XC6ESlyFJMCu1Cd24fXdOxKUvw4Waw4GdUNAzM
yAaowy+nEwzYnUnRc7kcL1dS0KrmcnLLpMKY0rn/f+DlSUbLBvOrmPWePLrXkK1f
Amkhf/0bqEbb3IaY//ZcTjeNbowr74b5puT+npum07XDy5AGVi5MIAu2Z056tyHW
BXDbGSukEbMg4Fh0DJ1XFzTJ7PZHqCJJ3sXic6QpH3zrlsg0M9uEGl4eJ4Kg4TRb
wnqLyMVS0Nde+Y5K5Y75z4Nk/q7NEw==
=PRgJ
-----END PGP SIGNATURE-----

--sqgtpm7i2tgva2ps--

