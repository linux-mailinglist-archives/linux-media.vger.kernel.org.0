Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA07423755
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 07:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhJFFFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 01:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJFFFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 01:05:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83843C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 22:03:16 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id p13so5204728edw.0
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 22:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PYQL+B0/DYsLvNt0xCQjQJEykItzuiGh1O6OLlseyO0=;
        b=ku9DnKgp8MZNrb/yJ3rPK9xe8lx0+dH24yvvl9w6fraMFTRxLQDkQXtRr2lcjTmDvb
         55NxsJPyM2cveYPz3GEDDp4TZfaPeHQZoRYNwtbVlffo1dX3dhvKROAJB1MClvBTo+iF
         A4k5pob3Y7neTXC3jbHcpMBtdvGGWnhETujsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PYQL+B0/DYsLvNt0xCQjQJEykItzuiGh1O6OLlseyO0=;
        b=nBpgd2wit7Yb6CfAtU3qmtFbWewcrH3fD3x/ckI8j+dAiuEA3ZP/tp3kpgxd+CnCDq
         1j3H+y+z5XSokEwrJ/50ZW+rIVB4G54uBMNQUAYMPYGGG7D9nXSJQLS3nX41+T4EGmGu
         L4L/DPMFid7n/mtzhuF17RNGeE+XHQw/A0BwPAlaErlpKNNImiO3oL0zyR9lOQ8cbmTV
         BHZE7jOh8VTU032LxBQ7rf/jcfbnzf1GHtIseMtNDGFTN5HsXSI+uhLTihKfteMzJu5V
         Meqa7quUFHpWseqKHDcDTkxqxxvp6PtYSesekL8kMYX0BAT21rbgVsuGhKtFjRrempNx
         oczA==
X-Gm-Message-State: AOAM5300Me/NdNuTTbuCqc/nEvGiOov8qXUkh6w3ORnLoSkFL5S0FMGC
        Sx6ODtlMCa0pyVPAD6osEoLx9TsO7QQSUQ==
X-Google-Smtp-Source: ABdhPJw0Tw3vx3a+YeegpSW0FZixeLU8nk5cxUIuifUl0jDZHNxjcFwq6HELjfjFtsrwaGEyCmKXRQ==
X-Received: by 2002:aa7:dd90:: with SMTP id g16mr29096334edv.199.1633496594571;
        Tue, 05 Oct 2021 22:03:14 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id z5sm9766514edm.82.2021.10.05.22.03.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 22:03:14 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id o20so4806723wro.3
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 22:03:13 -0700 (PDT)
X-Received: by 2002:adf:9bd2:: with SMTP id e18mr20824560wrc.235.1633496593435;
 Tue, 05 Oct 2021 22:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <1632370218-5508-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1632370218-5508-1-git-send-email-bingbu.cao@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 6 Oct 2021 14:03:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BdXTYZDAQcyLVurqdjuT6fHdGpzQQ0c1NJ5y=81v7hcg@mail.gmail.com>
Message-ID: <CAAFQd5BdXTYZDAQcyLVurqdjuT6fHdGpzQQ0c1NJ5y=81v7hcg@mail.gmail.com>
Subject: Re: [PATCH] media: ipu3-cio2: Update high watermark to support higher
 data rate camera sensors
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tian.shu.qiu@intel.com, laurent.pinchart@ideasonboard.com,
        bingbu.cao@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Sep 23, 2021 at 1:11 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>
> CIO2 worked well with most camera sensors so far, but CIO2 will meet SRAM
> overflow when working with higher data rate camera sensors such as 13M@30fps.
> We must set lower high watermark value to trigger the DRAM write to support
> such camera sensors.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks for the patch. Would this have any implications for other
(lower) operating modes, such as increased power consumption, or it's
harmless? If so, what's the reason we didn't use the value from the
very beginning?

Best regards,
Tomasz

> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 3806d7f04d69..fde80d48533b 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -181,7 +181,7 @@ struct pci_dev;
>  #define CIO2_PBM_WMCTRL1_MID1_2CK      (16 << CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT)
>  #define CIO2_PBM_WMCTRL1_MID2_2CK      (21 << CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT)
>  #define CIO2_REG_PBM_WMCTRL2                           0x1468
> -#define CIO2_PBM_WMCTRL2_HWM_2CK                       40U
> +#define CIO2_PBM_WMCTRL2_HWM_2CK                       30U
>  #define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT                 0U
>  #define CIO2_PBM_WMCTRL2_LWM_2CK                       22U
>  #define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT                 8U
> --
> 2.7.4
>
