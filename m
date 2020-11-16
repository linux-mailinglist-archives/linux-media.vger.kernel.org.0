Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF93E2B476B
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 16:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730717AbgKPO6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 09:58:54 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34261 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730678AbgKPO6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 09:58:53 -0500
Received: by mail-oi1-f194.google.com with SMTP id w188so19091884oib.1;
        Mon, 16 Nov 2020 06:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Gfhy/yjV1GXVhi6NSk7xstYcxR79T3ACbInqJLsafY=;
        b=CrOOWO6bZkK0jD6mAZu34RO6PvGsj0L4UIzf2l8YGALv83gm57t8QU0eYRapJ0M0Ii
         xfEc04KQo1290eekMzLU2uzO06MK54RxYVlgXRzmrfc+Z4cOeJC/JJT4bO0ka55ijS+K
         rcyLX4CfvayemBSkHD6K69CbIKyuYAu0DH6M2v5K4PVlORPtHQokkLAvMtUMhFul1DX7
         xV3Ij2bZn0oy9OOi5Es5UyyI72l4iksRjg8HWAXo9opO0nNUFiZqFylLJ/z2E5GoIGAh
         PlapTKRvbzN8c0MpCY/ve/0h2X79J7VzMSBCu9oDib3erban0XduAvdt/oqDuBlZQvzb
         FXJQ==
X-Gm-Message-State: AOAM531UNxXgiWnzAGzDAeC/3vLXlUy5LRSuEJ4ENJE7W4Ct8lGvkyEW
        HjaA9EOB5sMr1jz70gRk5CThqMVwbQ==
X-Google-Smtp-Source: ABdhPJzQAvANeGr+VifH3Ry3wGi/leVqwv0JFC1O1upObnagqRSGpHomNuydlWtAynDJdWwN8NbQJw==
X-Received: by 2002:aca:4ed0:: with SMTP id c199mr9582156oib.14.1605538732440;
        Mon, 16 Nov 2020 06:58:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w21sm3113791ooj.32.2020.11.16.06.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:58:51 -0800 (PST)
Received: (nullmailer pid 1641092 invoked by uid 1000);
        Mon, 16 Nov 2020 14:58:50 -0000
Date:   Mon, 16 Nov 2020 08:58:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Heiko Stuebner <heiko@sntech.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: i2c: Add bindings for
 TW9900
Message-ID: <20201116145850.GA1640813@bogus>
References: <20201113134417.471445-1-maxime.chevallier@bootlin.com>
 <20201113134417.471445-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113134417.471445-3-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Nov 2020 14:44:16 +0100, Maxime Chevallier wrote:
> The Techwell TW9900 is a video decoder supporting multiple input
> standards, such as PAL, NTSC and SECAM, and outputs a BT.656 video
> signal.
> 
> It's designed to be low-power, posesses some features such as a
> programmable comb-filter, and automatic input standard detection.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v1->v2: Fix the example not compiling
> 
>  .../devicetree/bindings/media/i2c/tw9900.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/tw9900.example.dt.yaml: tw9900@44: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/tw9900.yaml


See https://patchwork.ozlabs.org/patch/1399805

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

