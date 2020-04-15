Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3091B1A9BDA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 13:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896756AbgDOLKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 07:10:22 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48377 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408852AbgDOLJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 07:09:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OfvEjW0aK7xncOfvHj4Xoj; Wed, 15 Apr 2020 13:09:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1586948989; bh=KvgcRhkkMIcBPhFyfvfr0ndt7euIQsGvniakb86DSHI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZV4QxIT6bvkSCSasI8Zij/Oetbj5jk9EkFRAmL9NsVCCPBpRACJmMpdT0TxlZ1DaD
         Ln/5uq8wNvnoQUDoQPYP5QoAub3W+ePJgVhWnzggrwHXj4ENIJHfQhUp4zNy/PUPtt
         MMLg11MJtiq3iZ3UMjLGjwTfdPWI0ebEK5B+Wo4VjQbMaRpfiiu2U7DSecmM7m7TLn
         Ltkq0hHY+h2c/OP/scesKk2xXTt/gmwBq2EegbqvzlsnU4tphMhKgZ55Ey4S5VQM7+
         Dv/H8cxtcESqSCG7weyIlGXkXIOPQMqzaSxgXNGOzB6lELA+H453M4UGjNYpD6Tx5n
         IR5Y9MpivzNVg==
Subject: Re: [PATCH v2 0/6] Move CEC drivers and menu to be out of
 MEDIA_SUPPORT
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Kukjin Kim <kgene@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Benson Leung <bleung@chromium.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-amlogic@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a81dee7b-2641-0d2f-c659-f08fe7af94f6@xs4all.nl>
Date:   Wed, 15 Apr 2020 13:09:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1586946605.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAoQtOqqqoVPHMdN5oX53UyHTmQQMULnRUjFyTATs/v6GWsXgRHarqzS1ELM0muaKrF3VHksfe1o3zy75bIhrVkkxn3gbBl1BdmIN5+lcREmQFChMpoz
 Ju9QQwCZI1BB9UntkfqJG+BgbfOeElcX/CEOIyxtYOaNE8WXyiVQwgXU08RSqvTQxpoRyl++31wJYQUdLRDMyvHnbpmZwP4DqUYw4IQp4AKSMr1T3+8u3MKh
 OI6pngpl8MQLGEkOh5oVajnj05PyuPqp6ucSipF/SIK/u7zTN8mszOFEeKdpp0ntMC29ccEZs4n2DnbmCp1wSH/OFb4DUQ/DZrgFfRDWVm9QZbtbRhNkS5vj
 7Noc09ibpD7T2jTrOwru7jYQzqV+oYfBmoXZzM2Gs73fP4RzuMTv+MNFB87lsbq+64eUia/jg66F9niepDng4k63TfR+gXGKWr02QMF5Np4eAGJrb5rr14kd
 yMEQKD/UvLPFlEi/1zuOidhRNdcFUg8bGiX7e6b+Sy/l34NdU/Tlc8ohcjplskom04uX66ChZEtb5coyIrpLOk7jyrJ5tJX/LjkTkbrezS8qELHEYc2/iLFj
 iQhF5tS82wfwc7Y7BK4YGSC6WOToZW1pwgKX4s9vbIWx2c6L17TucLjxuSPMEG+X71NkJL8oO/OALqBd4vwvHtAGzqXXUzBq0fMo9olwSFxHHD9YscyO+LzP
 /UKGTBJ5pucBIix9ZBK/sWlNXDD3p7RnYPQNphEKuj4VRc/T2Z8l9o3OlH3H9z/8JaHLcJ9TsOpA0+ATk8HKz/WaJuLjyKJFL4qiW51UYYbq7l/PQD+mf+Y9
 izE2CkfYawIr9c/RD1VfwzWSATTNCym7frlNvrayUiITjutvJpc7j4RLWwO4FykV7fDjQlWYP8wvMxYkd9u9DiLzE4OR0PFSz/OXM4wIzMYG8Vp93UEcTQ0T
 VycV0+v50PAJPn+lpTbWxBg0tZJZmrie3ujgadnEVqG+oGbz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/04/2020 12:31, Mauro Carvalho Chehab wrote:
> The CEC_CORE doesn't depend on MEDIA_SUPPORT. So, it doesn't make
> much sense to keep it under its menu.
> 
> This series move it to be just after RC support. As a side effect, now
> dependencies like PCI and USB are now selected, making easier to
> enable CEC drivers.

For this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> 
> - v2:
>   - move more CEC drivers from platform/
>   - rename kconfig options to be more coherent
> 
> Mauro Carvalho Chehab (6):
>   media: cec: move the core to a separate directory
>   media: place CEC menu before MEDIA_SUPPORT
>   media: move CEC platform drivers to a separate directory
>   media: move CEC USB drivers to a separate directory
>   media: cec: rename CEC platform drivers config options
>   media: cec: rename USB config options
> 
>  arch/arm/configs/exynos_defconfig             |   2 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +-
>  drivers/media/Kconfig                         |  30 +----
>  drivers/media/cec/Kconfig                     |  25 ++++
>  drivers/media/cec/Makefile                    |  16 +--
>  drivers/media/cec/core/Makefile               |  16 +++
>  drivers/media/cec/{ => core}/cec-adap.c       |   0
>  drivers/media/cec/{ => core}/cec-api.c        |   0
>  drivers/media/cec/{ => core}/cec-core.c       |   0
>  drivers/media/cec/{ => core}/cec-notifier.c   |   0
>  .../media/cec/{ => core}/cec-pin-error-inj.c  |   0
>  drivers/media/cec/{ => core}/cec-pin-priv.h   |   0
>  drivers/media/cec/{ => core}/cec-pin.c        |   0
>  drivers/media/cec/{ => core}/cec-priv.h       |   0
>  drivers/media/cec/platform/Kconfig            | 121 +++++++++++++++++
>  drivers/media/cec/platform/Makefile           |  14 ++
>  .../{ => cec}/platform/cec-gpio/Makefile      |   0
>  .../{ => cec}/platform/cec-gpio/cec-gpio.c    |   0
>  drivers/media/cec/platform/cros-ec/Makefile   |   2 +
>  .../platform/cros-ec}/cros-ec-cec.c           |   0
>  drivers/media/cec/platform/meson/Makefile     |   3 +
>  .../{ => cec}/platform/meson/ao-cec-g12a.c    |   0
>  .../media/{ => cec}/platform/meson/ao-cec.c   |   0
>  .../s5p-cec => cec/platform/s5p}/Makefile     |   2 +-
>  .../platform/s5p}/exynos_hdmi_cec.h           |   0
>  .../platform/s5p}/exynos_hdmi_cecctrl.c       |   0
>  .../s5p-cec => cec/platform/s5p}/regs-cec.h   |   0
>  .../s5p-cec => cec/platform/s5p}/s5p_cec.c    |   0
>  .../s5p-cec => cec/platform/s5p}/s5p_cec.h    |   0
>  drivers/media/cec/platform/seco/Makefile      |   2 +
>  .../seco-cec => cec/platform/seco}/seco-cec.c |   2 +-
>  .../seco-cec => cec/platform/seco}/seco-cec.h |   0
>  drivers/media/cec/platform/sti/Makefile       |   2 +
>  .../sti/cec => cec/platform/sti}/stih-cec.c   |   0
>  drivers/media/cec/platform/stm32/Makefile     |   2 +
>  .../{ => cec}/platform/stm32/stm32-cec.c      |   0
>  drivers/media/cec/platform/tegra/Makefile     |   2 +
>  .../platform/tegra}/tegra_cec.c               |   0
>  .../platform/tegra}/tegra_cec.h               |   0
>  drivers/media/cec/usb/Kconfig                 |   6 +
>  drivers/media/cec/usb/Makefile                |   6 +
>  .../pulse8-cec => cec/usb/pulse8}/Kconfig     |   5 +-
>  drivers/media/cec/usb/pulse8/Makefile         |   2 +
>  .../usb/pulse8}/pulse8-cec.c                  |   0
>  .../usb/rainshadow}/Kconfig                   |   5 +-
>  drivers/media/cec/usb/rainshadow/Makefile     |   2 +
>  .../usb/rainshadow}/rainshadow-cec.c          |   0
>  drivers/media/platform/Kconfig                | 125 ------------------
>  drivers/media/platform/Makefile               |  12 --
>  drivers/media/platform/cros-ec-cec/Makefile   |   2 -
>  drivers/media/platform/meson/Makefile         |   3 -
>  drivers/media/platform/seco-cec/Makefile      |   2 -
>  drivers/media/platform/sti/cec/Makefile       |   2 -
>  drivers/media/platform/stm32/Makefile         |   1 -
>  drivers/media/platform/tegra-cec/Makefile     |   2 -
>  drivers/media/usb/Kconfig                     |   6 -
>  drivers/media/usb/Makefile                    |   2 -
>  drivers/media/usb/pulse8-cec/Makefile         |   2 -
>  drivers/media/usb/rainshadow-cec/Makefile     |   2 -
>  59 files changed, 218 insertions(+), 212 deletions(-)
>  create mode 100644 drivers/media/cec/core/Makefile
>  rename drivers/media/cec/{ => core}/cec-adap.c (100%)
>  rename drivers/media/cec/{ => core}/cec-api.c (100%)
>  rename drivers/media/cec/{ => core}/cec-core.c (100%)
>  rename drivers/media/cec/{ => core}/cec-notifier.c (100%)
>  rename drivers/media/cec/{ => core}/cec-pin-error-inj.c (100%)
>  rename drivers/media/cec/{ => core}/cec-pin-priv.h (100%)
>  rename drivers/media/cec/{ => core}/cec-pin.c (100%)
>  rename drivers/media/cec/{ => core}/cec-priv.h (100%)
>  create mode 100644 drivers/media/cec/platform/Kconfig
>  create mode 100644 drivers/media/cec/platform/Makefile
>  rename drivers/media/{ => cec}/platform/cec-gpio/Makefile (100%)
>  rename drivers/media/{ => cec}/platform/cec-gpio/cec-gpio.c (100%)
>  create mode 100644 drivers/media/cec/platform/cros-ec/Makefile
>  rename drivers/media/{platform/cros-ec-cec => cec/platform/cros-ec}/cros-ec-cec.c (100%)
>  create mode 100644 drivers/media/cec/platform/meson/Makefile
>  rename drivers/media/{ => cec}/platform/meson/ao-cec-g12a.c (100%)
>  rename drivers/media/{ => cec}/platform/meson/ao-cec.c (100%)
>  rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/Makefile (63%)
>  rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cec.h (100%)
>  rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cecctrl.c (100%)
>  rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/regs-cec.h (100%)
>  rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.c (100%)
>  rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.h (100%)
>  create mode 100644 drivers/media/cec/platform/seco/Makefile
>  rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.c (99%)
>  rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.h (100%)
>  create mode 100644 drivers/media/cec/platform/sti/Makefile
>  rename drivers/media/{platform/sti/cec => cec/platform/sti}/stih-cec.c (100%)
>  create mode 100644 drivers/media/cec/platform/stm32/Makefile
>  rename drivers/media/{ => cec}/platform/stm32/stm32-cec.c (100%)
>  create mode 100644 drivers/media/cec/platform/tegra/Makefile
>  rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.c (100%)
>  rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.h (100%)
>  create mode 100644 drivers/media/cec/usb/Kconfig
>  create mode 100644 drivers/media/cec/usb/Makefile
>  rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Kconfig (86%)
>  create mode 100644 drivers/media/cec/usb/pulse8/Makefile
>  rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/pulse8-cec.c (100%)
>  rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Kconfig (85%)
>  create mode 100644 drivers/media/cec/usb/rainshadow/Makefile
>  rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/rainshadow-cec.c (100%)
>  delete mode 100644 drivers/media/platform/cros-ec-cec/Makefile
>  delete mode 100644 drivers/media/platform/meson/Makefile
>  delete mode 100644 drivers/media/platform/seco-cec/Makefile
>  delete mode 100644 drivers/media/platform/sti/cec/Makefile
>  delete mode 100644 drivers/media/platform/tegra-cec/Makefile
>  delete mode 100644 drivers/media/usb/pulse8-cec/Makefile
>  delete mode 100644 drivers/media/usb/rainshadow-cec/Makefile
> 

