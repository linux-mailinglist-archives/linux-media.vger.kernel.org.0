Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32475294280
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 20:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437758AbgJTSwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 14:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437753AbgJTSwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 14:52:10 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72081C0613CE;
        Tue, 20 Oct 2020 11:52:10 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s9so3497015wro.8;
        Tue, 20 Oct 2020 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hj/5rM+jvw3L4um8epXIlyHrB+7DbJ2e5G0hRWEEu0A=;
        b=CBNQesy7gDXxZgJM+wVoV5gsm3Arow6foIwAKaz+gB+8oC3LApDfqTn5rut9in5Ex6
         fJmEYUj5IQq97LgmIJqBUmGInGCGM9aZvIsep3UFdfjCSYylB+dBLbx02rDyfcJamPlR
         2DMhXy8EdCk4k9pj0zC8K9DVZjMn0YzuNZR/ULF76wGB/i1i9sOdM5ZG6XJe9lHG89BX
         iZIiHNvZ05wGfvsFlf+CeL5Yl7bbxGgdGl+ijCul3u6OYWabluq4xxiGWZqYZhxeyNiZ
         Rq/O+kwXTeBgWOGAJcVsmlzTDlpf8c2bEUjlkMU/5qa/h0S5E2ep53tvSxkeFTVSFPNC
         51uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hj/5rM+jvw3L4um8epXIlyHrB+7DbJ2e5G0hRWEEu0A=;
        b=rcgRzjA3eHLjpyxf0sjhG141/ek3H/X28wSK/iTfz0kFF17Xmgy+wqK0z2yzxfi1su
         tQUUHyZlPZeNQT/qMmlciFCXhHHAsuGgg8t0zjDnEozUvscykPnsUPtaJP3xa2Xm7uaj
         i2XF5kf0PNSz3mxDOknCPa3OBKF/AWktFfInuCtAUaMFeKC2lwFS99T4OADO5Bq2ztti
         vVwyWcumhORcEXMubZzKLPxdsnyIAKmkOXrzpfol3NvoDgefVXgZg/aM026tIRQFcTeo
         XDklY9yx0AVdBHxY6UPJ1tDkD9y8bOySirECikC7EGyQK2ICMVK9n4chcBr3TSMk4Oww
         +kSQ==
X-Gm-Message-State: AOAM532geZ4GwS/AVcPt+t0eccNwxDr54Yg3PUx5+72sf6yq5pLr5ZGG
        zOukY0WROjlQ1kgz4i81yKy74HQj7x4=
X-Google-Smtp-Source: ABdhPJw6ycjDTlgnXw8TqLHiKMGACU3mTpKDtd5WgINy1vG3V+zqXDvWD61WsX7sfQQcSJZiCnPdeg==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr5409041wrg.166.1603219929109;
        Tue, 20 Oct 2020 11:52:09 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id x65sm4281514wmg.1.2020.10.20.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 11:52:08 -0700 (PDT)
Date:   Tue, 20 Oct 2020 19:52:06 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201020185206.qst2uksgcy3axbnh@arch-thunder.localdomain>
References: <20201020091921.1730003-1-rmfrfs@gmail.com>
 <20201020091921.1730003-4-rmfrfs@gmail.com>
 <20201020153044.GA875273@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020153044.GA875273@bogus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob Bot,
On Tue, Oct 20, 2020 at 10:30:44AM -0500, Rob Herring wrote:
> On Tue, 20 Oct 2020 10:19:21 +0100, Rui Miguel Silva wrote:
> > Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> > the textual document and update MAINTAINERS entry.
> > 
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > ---
> >  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
> >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 173 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> ./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:91:21: [warning] wrong indentation: expected 22 but found 20 (indentation)
> ./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:93:21: [warning] wrong indentation: expected 22 but found 20 (indentation)

Strange not to complain on line 94 also.

> 
> 
> See https://patchwork.ozlabs.org/patch/1384742
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

I have done this and I am at version:
2020.8.2.dev4+g341f3e35180a

and still do not get any warning on this file. Nevertheless I
found the indentation issue and will:

> Please check and re-submit.

------
Cheers,
     Rui
