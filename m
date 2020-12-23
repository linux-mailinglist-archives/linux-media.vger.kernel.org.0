Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557DF2E2025
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 18:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgLWRsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 12:48:41 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:37495 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgLWRsl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 12:48:41 -0500
Received: by mail-oi1-f169.google.com with SMTP id l207so19021515oib.4;
        Wed, 23 Dec 2020 09:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=i6ZWjRgUyOS3oxlVVK1a050yOc53efxdA38lm3lUzgw=;
        b=E2BK8jl3wRmAHfuy6PPZjc2G97lyEUyhN9v6Lph2x1J4yE9j6mWmoMV3SDavgkYJ3U
         ybMmaJw/aPNUKkvco5DdssNTAz1n858hWpOTTS09tbDVoobGyjJQU2rGIWjiG605n4hx
         OJSNEMpzVvj5nCXj5aB/xc0F7eIWjADhk0JFkN4EWlf4DhU3DYcIuJxzffVl63KnWhb2
         Cf2mzZ8sQunOIohs+bfF0zF+ECTMfgO8jdZ/GBdeCgHhi6APnxvPJXtpvtnVXYWhpxlJ
         C7aXwje/iNIBHxloInGkOeBRWy9SEsD/nzKGYSgPybpNITW+tAbObpKiz4+X18eIQSLs
         8UnQ==
X-Gm-Message-State: AOAM53193mcihRc5x9mE/EnKUI0fsRN36+67TTf6vAppq0MbOS362eJD
        qQLaNFLRSfGrul4nu1wQmQ==
X-Google-Smtp-Source: ABdhPJyvgtpvBvpLkNclyMmhlnyxOg364ztgl1lqxqvY5ppv1jScvgCdDkChT+Tj/4Iao5k33hFe/g==
X-Received: by 2002:aca:d506:: with SMTP id m6mr604921oig.113.1608745680858;
        Wed, 23 Dec 2020 09:48:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w6sm5917186otm.54.2020.12.23.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 09:48:00 -0800 (PST)
Received: (nullmailer pid 762421 invoked by uid 1000);
        Wed, 23 Dec 2020 17:47:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20201222160407.501586-3-maxime.chevallier@bootlin.com>
References: <20201222160407.501586-1-maxime.chevallier@bootlin.com> <20201222160407.501586-3-maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: i2c: Add bindings for TW9900
Date:   Wed, 23 Dec 2020 10:47:58 -0700
Message-Id: <1608745678.774726.762420.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Dec 2020 17:04:06 +0100, Maxime Chevallier wrote:
> The Techwell TW9900 is a video decoder supporting multiple input
> standards, such as PAL, NTSC and SECAM, and outputs a BT.656 video
> signal.
> 
> It's designed to be low-power, posesses some features such as a
> programmable comb-filter, and automatic input standard detection.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2->V3 : Fix the example not compiling due to a typo in the reset-gpios
> node.
> 
>  .../devicetree/bindings/media/i2c/tw9900.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/tw9900.example.dt.yaml: tw9900@44: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/tw9900.yaml

See https://patchwork.ozlabs.org/patch/1419441

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

