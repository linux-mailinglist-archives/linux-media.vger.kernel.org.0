Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0B87E5575
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 12:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344577AbjKHL0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 06:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344584AbjKHLZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 06:25:49 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C9F2137
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 03:25:47 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so11377362a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 03:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699442745; x=1700047545; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2CuofhZ4aryHNckV4tz7mpfGg2sIDu58AedhZXJh0U0=;
        b=Jx2uk3cQgMHdC/9cMCaxCs6gU/4zHpRVw5xn8giqUwI5Xj5tsGUo/dDmuIqziIJ67j
         Jy8BLDRkpYUqhzy/5u0gk7+ACzi+h3dPGhetZsWmCUXiGq6grpujo016VZjrkEtz3g4M
         TjBKcXey4G6yoI1MmXiXA/JbLkSys5wgeJXRsKZl+62jtm/RBbzX5LRH5H/uQzl+yp36
         8niTRYSvitgml76kBznBptZY5Bzurxxj7tVTQyvz3hIfowXEqHXpicYeuSGIaZ1tP0t2
         Xz25wGaUQiZVDRRuh2t69uKuqUk4jVNz525NKKd7uedLzucEbSuvuI/yKt4zRtlEBFSj
         Q5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699442745; x=1700047545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CuofhZ4aryHNckV4tz7mpfGg2sIDu58AedhZXJh0U0=;
        b=E+C74I9T2baTLloMJmUFMC3GlRBD0AV9dzBpZLe6Xt3qrV72bD3PSf3r7r9WZbdrZM
         Yy5iZ3CVlJkqoM0DNsAJYhgtnWZ9dKyylt6Tw6Lq4/SqkpPtObN03cc0rblXrmx3OoYP
         zha47In+NQksSO5s3A7ZciyFSKpQ/rvsDOTznf0XTx+HoxDeND9c6YQOekm0tEZjZdg6
         lZStVhVH05FnIjEWGc0wSoVCYbPQw5aOWMKfM5/2HHmr0cXqQDCOmf+OErp6WnBv93fL
         8hZaZrqHdWSbyUcVnkgdwfIkfTHjBfM9J2G9Ysa1BxuMBFRKhqbqlnVSWIgdrII3avGa
         r42g==
X-Gm-Message-State: AOJu0Yz1evnnF4K0eyPTtbwVqSfrl/iifB7bNdNdZQulVbYZERp7cT6j
        05vk9QxXrmRtMr3MN4dkWay+41c6Gd4tpA==
X-Google-Smtp-Source: AGHT+IFm3LaQCEXLCDgIEk98eHvjVVI6rOWfF9jHItwXHKk1p8BJfe+xtEoEy64fZup5WTk61UFR5w==
X-Received: by 2002:a50:c34c:0:b0:540:77f8:240 with SMTP id q12-20020a50c34c000000b0054077f80240mr1008195edb.14.1699442745229;
        Wed, 08 Nov 2023 03:25:45 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id q21-20020a056402033500b0053dfd3519f4sm6429327edw.22.2023.11.08.03.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 03:25:44 -0800 (PST)
Message-ID: <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
Subject: Re: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Wed, 08 Nov 2023 12:25:43 +0100
In-Reply-To: <20231024112924.3934228-9-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
         <20231024112924.3934228-9-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Input system CSI2 receiver is exposed as a v4l2 sub-device.
> Each CSI2 sub-device represent one single CSI2 hardware port
> which be linked with external sub-device such camera sensor
> by linked with ISYS CSI2's sink pad. CSI2 source pad is linked
> to the sink pad of video capture device.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 654
> ++++++++++++++++++
> =C2=A0drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |=C2=A0 81 +++
> =C2=A0.../media/pci/intel/ipu6/ipu6-isys-subdev.c=C2=A0=C2=A0 | 379 +++++=
+++++
> =C2=A0.../media/pci/intel/ipu6/ipu6-isys-subdev.h=C2=A0=C2=A0 |=C2=A0 58 =
++
> =C2=A0.../intel/ipu6/ipu6-platform-isys-csi2-reg.h=C2=A0 | 187 +++++
> =C2=A05 files changed, 1359 insertions(+)
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> =C2=A0create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-
> csi2-reg.h
>=20
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> new file mode 100644
> index 000000000000..0dedf3f51850
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
...
>=20
> +
> +#define DIV_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08
> +#define CSI2_ACCINV=C2=A0=C2=A0=C2=A0=C2=A08
> +
> +static u32 calc_timing(s32 a, s32 b, s64 link_freq, u32 accinv)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return accinv * a + (accinv * =
b * (500000000 >> DIV_SHIFT)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 / (int32_t)(link_freq >> DIV_SHIFT));
> +}

I think accinv should be s32 here. When accinv is unsigned, the
expression (accinv * b) becomes unsigned, and thus negative values of b
gives incorrect results.=C2=A0

This is different from e.g. https://github.com/intel/ipu6-drivers.

/Andreas
