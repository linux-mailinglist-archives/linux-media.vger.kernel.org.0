Return-Path: <linux-media+bounces-56605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEQ5LlHTvmlseQMAu9opvQ
	(envelope-from <linux-media+bounces-56605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 18:20:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B12E67EB
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 18:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB12301D040
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 17:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0084C32D0CC;
	Sat, 21 Mar 2026 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="YAf3V3VW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AF830AD15
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113563; cv=none; b=Yydm8NHlQc4Am3IzalpBV+WSXREWCwUxo/A+uJF23g++85W38BaJU/1sNxt7D1nu1DrloEySdwlRxw5GlX5CUyhRMFFXHKc8amZBqIgDPiwnZJvfGYTbw3GXtatmPfRGJ4aG7qb4JBEijhOV8iVaqX5Timw36tYVLAWgQ6Z/eoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113563; c=relaxed/simple;
	bh=7lbuSXy266xvscn6Azstf5i7N7zEFerSJLOUbFcN/qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URg9rZ7XEoLaIF4WwiCzqmwoPH1nbQAg1+hOD4JV0nbmiuZlglybTk0hdrXkwDRjt7/Q0E/Tb/+BuNV/7RZVLHM/reB1Nj9ktiL9kYRv62ZoKM/ugN9JWBluz4wTnRQj2yIfzLbZp63vqkMRuLkp8qyi39FSSTSpmTR84FcH590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=YAf3V3VW; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cbb6d5f780so173302685a.1
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1774113560; x=1774718360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=YAf3V3VWURkCcplJnWyO/BbZuCFWrfzr+kvQCe3EvS0LhOrXBjqjsoSQ5J+3zpMWas
         6vxBWFKyBNOnuVmDF4uBuAzRWMVf2XCc2eDwXfHhB6hL7OFH3NrNIYmEfeqj2u88Pvum
         bgWvRnY6V7qTJIC4p8jQWCN6HT9KEM6kstVVcE48r9fFhPVAjAI+tzUxRRRj4eVuGT8d
         LDo9zSGCWRKzKBjfOwWu+EMriRQ/S9tfD18uBJlvVzGI5eLpFzLkrhH7DKDqWaeM8JHc
         v5KhcORIj/TzXjGhqdKDWIU/YMy/jgQWOraWrDPYFynht01noHe0BzfzAC60qe6Auzzx
         EZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113560; x=1774718360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=k1RM+/oeLgGrt/tT6p3lX+tN07pzZ6irmuRqSZx/xDrhmwr7Wc65r0YKzUX8zApDtf
         kbSRBvk6kH9Q/lHIyqrsJI6p5r4I/1s+QDqFvDR80zOsoqPSFGlPrLOTdfXndxdyFnl8
         ImwlJ5iodSvR+6FZkztDAvfvEGe2uAz49IPRseua8HODG9b5UgxXZiI7lDNZYJ/+1zbF
         i4/yK/82cUBsamtqsTwHV1Le4awgr92IBxI7oBn9FuwCMuDNDDvisv9u3CC2sVdWcnIq
         VVyY8IbeKGhZ0gdgrasRpoVZOmp3SayUqEBksyQ2g2Nco9g++o5kjLpsn0Gx3GdUNclk
         7C+w==
X-Forwarded-Encrypted: i=1; AJvYcCWASDjeXnjbPwEA7cEtBbVDF/jO1n34bJpmBq64ZYeeE/XANU3MExjIV4U+D0EhOeYdQLVe4AHdTKnfmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRUfDFwK91Lmdk6mjdxvWBiY/2KXQDEP2BWHwbb9IW1TX+3jN
	Kkq3zh2tdagXgdsX/aUCm8oMyG0a3GOhBeqnm3sTRLR38+gMTtfUS5WWBzSwI7NLD/vY9CFdXUz
	Uh2t7WFfk033S
X-Gm-Gg: ATEYQzy5j+S8rBYDm1qeJmGDdvA7QGBbabqidkniKZIpqrhZsQmrBjNnBIJ5Q/7FBXZ
	Z/os//xyn9v8GtwuqTshTlo5Zw/IliCP/lD6g71udMOAkuj7f5rJkEqVR6tGJu/91ZONf3sVNiD
	/NcOk+sNadT9T6CQDmlTX6uIf4qjvRsPkWZ/CeEXqmg9xb7V9idCTg69YbpimCeoZMN5KqkK2yy
	AytYGTJGaDFGBY4kzl+Cd3cW+lgrcRDPIrZCmBrVfjIcWBqESGPdAV6oAzfmLfKQgra9mypOSfE
	517jyVFzZXfgBMj+x2hnWveQATfyK3OufMUjqwirdHUEAFik3GA4d6i9FuPSFCFfNRf/VE1ubdO
	Osi8yMsN4vv76/WHwGZ0DlUPNk2WqlzIJDH5vns70wI9E3RW7clou+iDRTovlHxzl9aU9D4BpSj
	ihBRZjSl8Vm9Oo587V8ajVidRRpufUA+2/Av7hsm4OJoo4sJF10yZSzLCy3VGlFw==
X-Received: by 2002:a05:620a:708a:b0:8cd:99de:6b63 with SMTP id af79cd13be357-8cfc809ddb2mr1077152485a.67.1774113559673;
        Sat, 21 Mar 2026 10:19:19 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5fa29sm396085085a.10.2026.03.21.10.19.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 10:19:18 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-899fb2b94c1so19110746d6.3
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 10:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjcQJnumbksff7GSLzwdX1b3x2UajYwBOwOxtxaY575BXcoY4hW29UOn0/Z5M4Fk0oTHm/qHydazypUQ==@vger.kernel.org
X-Received: by 2002:a05:6214:2503:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89c85a4415dmr120844646d6.31.1774113557567; Sat, 21 Mar 2026
 10:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 21 Mar 2026 18:19:06 +0100
X-Gmail-Original-Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
X-Gm-Features: AaiRm51EiMaDZyOBoTxsmzhD9LKdQqqk1TUMHYTLZEpIizj3O9FXdJaoYzmTmY0
Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
	Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tomeuvizoso-net.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56605-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tomeuvizoso.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tomeuvizoso-net.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomeu@tomeuvizoso.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tomeuvizoso-net.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 0A3B12E67EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ioana,

Looks like the userspace portion of the driver is closed source
(libNeutronDriver.so)?

https://github.com/nxp-imx/tflite-neutron-delegate/blob/lf-6.12.49_2.2.0/CM=
akeLists.txt

Regards,

Tomeu

On Fri, Mar 6, 2026 at 2:27=E2=80=AFPM Ioana Ciocoi-Radulescu
<ruxandra.radulescu@nxp.com> wrote:
>
> Introduce a new accel driver for the Neutron Neural Processing Unit
> (NPU), along with associated dt-bindings and DTS node.
>
> The first patch extends the GEM DMA helper APIs to allow bidirectional
> mapping of non-coherent DMA buffers. While not part of the Neutron
> driver, it's a prerequisite allowing us to use the GEM DMA helper.
>
> Neutron is a Neural Processing Unit from NXP, providing machine
> learning (ML) acceleration for edge AI applications. Neutron is
> integrated on NXP SoCs such as the i.MX95.
>
> The NPU consists of the following:
> - RISC-V core running a proprietary firmware
> - One or more Neutron cores, representing the main computation
>   engine performing ML operations
> - Dedicated fast memory (TCM)
> - DMA engine that handles data transfers between DDR and TCM
>
> The firmware is closed source and distributed as a binary here [1].
>
> The Neutron software stack also contains a userspace library [1] and
> a LiteRT custom delegate [2] that allow integration with standard
> LiteRT tools.
>
> [1] https://github.com/nxp-upstream/neutron/tree/upstream
> [2] https://github.com/nxp-imx/tflite-neutron-delegate
>
> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
> Changes in v2:
> - rebase on newer drm-misc-next
> - dt bindings: clock fixes and renames
> - update DTS to match new names
> - remove unnecessary fields from neutron_job structure
> - fix use of uninitialized variable
>
> - Link to v1: https://lore.kernel.org/r/20260226-neutron-v1-0-46eccb3bb50=
a@nxp.com
>
> ---
> Ioana Ciocoi-Radulescu (9):
>       drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM=
 DMA buffers
>       accel/neutron: Add documentation for NXP Neutron accelerator driver
>       dt-bindings: npu: Add NXP Neutron
>       accel/neutron: Add driver for NXP Neutron NPU
>       accel/neutron: Add GEM buffer object support
>       accel/neutron: Add mailbox support
>       accel/neutron: Add job submission IOCTL
>       accel/neutron: Add logging support
>       arm64: dts: imx95: Add Neutron node
>
>  Documentation/accel/index.rst                      |   1 +
>  Documentation/accel/neutron/index.rst              |  12 +
>  Documentation/accel/neutron/neutron.rst            | 131 ++++++++
>  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  96 ++++++
>  MAINTAINERS                                        |  10 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   3 +-
>  drivers/accel/neutron/Kconfig                      |  16 +
>  drivers/accel/neutron/Makefile                     |  12 +
>  drivers/accel/neutron/neutron_debugfs.c            |  34 ++
>  drivers/accel/neutron/neutron_debugfs.h            |  15 +
>  drivers/accel/neutron/neutron_device.c             | 239 +++++++++++++
>  drivers/accel/neutron/neutron_device.h             | 155 +++++++++
>  drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
>  drivers/accel/neutron/neutron_driver.h             |  16 +
>  drivers/accel/neutron/neutron_gem.c                | 116 +++++++
>  drivers/accel/neutron/neutron_gem.h                |  14 +
>  drivers/accel/neutron/neutron_job.c                | 372 +++++++++++++++=
++++++
>  drivers/accel/neutron/neutron_job.h                |  43 +++
>  drivers/accel/neutron/neutron_mailbox.c            |  47 +++
>  drivers/accel/neutron/neutron_mailbox.h            |  42 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
>  include/drm/drm_gem_dma_helper.h                   |   3 +
>  include/uapi/drm/neutron_accel.h                   | 130 +++++++
>  25 files changed, 1801 insertions(+), 3 deletions(-)
> ---
> base-commit: 6716101ae42949e98ad4b9e71eeba08c055be410
> change-id: 20260226-neutron-c435e39d167f
>
> Best regards,
> --
> Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
>

