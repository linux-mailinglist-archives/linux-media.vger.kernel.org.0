Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A86279980
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 15:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbgIZNDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 09:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgIZNDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 09:03:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BC2C0613D3
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:03:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so1962025wmi.1
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6UBlp4CWE/HNUMg46vGuXH/W4+PrU2QCjrc8dmoCqx0=;
        b=PNuFpmwNBdW/TGJSBIP0GAADCkUiJiN3BePu59PEzCMlCXYVv+OLoczXNNVfGW7GAf
         ZsIIVdoOhY0IsSg1qTLlM46HvznPpDEZgXCebWEEK1ft9+j5c+8EjUwlhkLqmSDP7mpx
         4n3h5/vGkVdPc1nUSmhrDus0L0N0Yz96r3vpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UBlp4CWE/HNUMg46vGuXH/W4+PrU2QCjrc8dmoCqx0=;
        b=ZV/MVRadgojwH4BEj3lrHOFwtVtsgEUTN8Lfw1mpgBbJxkw5W/ImMF8D+wlSDxqdB1
         vxNJ+6mlCfyygB3PWeRSnfnW02wLoECedsNKOHesyQRXmUuPrgE6oyhN3PSGWPhbLO4t
         0So2gG4sfRxFkhW/EuBovS3yA6Stf8vr/N5rma7xfi61LN8BNd4DjVqYWg5dJ0zaxM+j
         +ozAGH4f77xj72gQB1+7GCSUVy8IqtZo12Er5UvV6GrQduWEwqf73+qO3YJe1d6yLSoO
         nqy4B5ioWyEsp4ARRSuRgQM6GrgqzfFXoupN8cJNSwejFeXoQRRyc2T7UHfmh6OY8GY6
         ioKg==
X-Gm-Message-State: AOAM533YIesym47WA5pFqvaHj4Nzzw9Ahl/S2YgrR5xNzgi0lg7lHKDj
        4lD340NeGaeAstH+ZsUWMbHHbg==
X-Google-Smtp-Source: ABdhPJynIuaCTOn8KUC4rrc+W/+aEYuVm8XN6ViT/zFkUVty6k8hF7b/mtHx243jPWCjHGHQoYci3Q==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr2541646wme.27.1601125410239;
        Sat, 26 Sep 2020 06:03:30 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id e18sm6533467wrx.50.2020.09.26.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:03:29 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:03:27 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, robh+dt@kernel.org, heiko@sntech.de,
        hverkuil-cisco@xs4all.nl, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, ezequiel@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com, jbx6244@gmail.com,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com,
        robin.murphy@arm.com
Subject: Re: [PATCH v5 0/9] move Rockchip ISP bindings out of staging / add
 ISP DT nodes for RK3399
Message-ID: <20200926130327.GD3781977@chromium.org>
References: <20200722155533.252844-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722155533.252844-1-helen.koike@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Wed, Jul 22, 2020 at 12:55:24PM -0300, Helen Koike wrote:
> Move the bindings out of drivers/staging and place them in
> Documentation/devicetree/bindings instead.
> 
> Also, add DT nodes for RK3399 and verify with make ARCH=arm64 dtbs_check
> and make ARCH=arm64 dt_binding_check.
> 
> Tested by verifying images streamed from Scarlet Chromebook
> 
> Changes in v5:
> - Drop unit addresses in dt-bindings example for simplification and fix
> errors as suggested by Rob Herring in previous version
> - Fix typos
> - Re-write clock organization with if/then schema
>

Besides one comment to patch 8/9,

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
