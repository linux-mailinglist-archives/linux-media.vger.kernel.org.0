Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE742ED77B
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 20:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbhAGTcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 14:32:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbhAGTcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 14:32:51 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F410C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 11:32:11 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id i24so8833046edj.8
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bGyYSj9jfCDTozLJ7tHaJR33H87h6X+0ovKSaII3Chg=;
        b=gMC5MwiK/ZpxiXYUFLMTt8lYRBpcNeOaZkvs2xF6FZmnlQrfRjzMHPz6t57P+OUCYK
         2WLA4Enp9b1MQSWHKZWM06oA+LCIlQMbH1gmLkl8e9tgCtioV9CoBjB50GcN5GN0ahQ7
         TTUWHWQeA2b3dPr/GtUMBAFZoUT+j6AS4Da4YybRfXzLRUUqCtNmvPz6h2QPAjh3W31N
         WHaaxRfOG+6MgWD0eMAIcCWlh3PcjE6EQy/lCDGRk3BSDV7UbmrpIY1LZxzxE0/iqIaD
         GlNT6+kL+lW8bUso9mRD/nMQ53o15XL1L1W4S8wFYWrC8tlJoev71OyVHZdB48jqlHdj
         B+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGyYSj9jfCDTozLJ7tHaJR33H87h6X+0ovKSaII3Chg=;
        b=Ig1R87eLKOFfYUofDQgPRfvbtmV2NFahulwBW4Hw/mRlsa3GnXukZ8ym5QsFtdStv6
         gBfNSQRvLSKO1ySOmKnxSRkxnYNX0ZbEUl/neItDs89nJyqXYkkAzA2xo1Yhv8GGpgHF
         u9avtLjULjNbCxhiUBDmw/LTU2EjIKa/0dBtgS9zZxvi4z8bNNqzPFTIhnLKbvpnVJnr
         UIVM5bFMF9W7teeVMOf8B0Bb9xxYgWRe4wfHP1KGC8h/T+MUh36ntE4Z82aUfV3Y6xIc
         /ri2/pMM1XSuIgCNRD+8bEjm8GCaoU2QIcN+XMIu/IWTqLd7Cpkfkx+fZE+e+BuZYqkk
         2lGQ==
X-Gm-Message-State: AOAM530Rj0QNscGhoMDNv56/JkFzEYwxDgo9Ajapw6pIaaCadSghQcPR
        +cnWmk4Q95NX0oD9meKvzISEP+BT5XhgESeGUdnwUQBdfkIkxA==
X-Google-Smtp-Source: ABdhPJzjlyY5cQVXTgLwOIZSCb0sMmrai5RJDvk/9/1CTVmOagduIwzJDJilsiQPttSlrPYvAmEQaIs4yW127iDRmC0=
X-Received: by 2002:aa7:cc15:: with SMTP id q21mr2786555edt.213.1610047930097;
 Thu, 07 Jan 2021 11:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 7 Jan 2021 16:31:58 -0300
Message-ID: <CAAEAJfADNg_RKuWfREAPbtpB86ZQsNKa5rc83sjB9BZViPhtHg@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: fwnode: v4l2_async_notifier_parse_fwnode_endpoints
 is deprecated
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, 14 Dec 2020 at 18:45, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Document that v4l2_async_notifier_parse_fwnode_endpoints() is deprecated.
> Its functionality has been replaced by other, better functions. Also add a
> reference to an example if someone ends up wandering here.
>

I'm working on a series to clean up the v4l2_async API a bit,
and came across this patch.

As far as I can see, the only user of v4l2_async_notifier_parse_fwnode_endpoints
is drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c.

Adding Maxime and Yong Deng, it would be great to get rid of this,
so we can remove the API, which would also allow us to remove
some other internal functions and therefore make the API a bit cleaner.

Thanks,
Ezequiel

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-fwnode.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 4365430eea6f..d0a1293379ab 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -453,6 +453,10 @@ typedef int (*parse_endpoint_func)(struct device *dev,
>   * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
>   *                 endpoint. Optional.
>   *
> + * DEPRECATED! This function is deprecated. Don't use it in new drivers.
> + * Instead see an example in cio2_parse_firmware() function in
> + * drivers/media/pci/intel/ipu3/ipu3-cio2.c .
> + *
>   * Parse the fwnode endpoints of the @dev device and populate the async sub-
>   * devices list in the notifier. The @parse_endpoint callback function is
>   * called for each endpoint with the corresponding async sub-device pointer to
> --
> 2.29.2
>
