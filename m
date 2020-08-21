Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A0324D3F8
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 13:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHULa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 07:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgHULaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 07:30:25 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81BAC061388;
        Fri, 21 Aug 2020 04:30:24 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id p191so876892ybg.0;
        Fri, 21 Aug 2020 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qGFw5EG8yfKpTojIo2qI2uz1wjsdjmmuZqulpYk3hwg=;
        b=e6+nI7XjaiG4MvgGon277b13vqct+dEWLwhlXI60baS8THml6ykMt+txx7qZ7ibBZI
         h00+aCJF6/jKTcj3OgXInqYqf6TzPHjkxZmz3/yLU7z9f2uDxUc/61u9A9vbt+AmQFVk
         lq/86u5hyYh5xop7HS7QwJkmN0buU6IfUDbj4u+YgcJ+pj3TxymG2lRkyamPU2KW8YIO
         YmtOQzR0o9RCb7uYlPcTmGcpe4dN6X/gZWG44EbutxSiTzMIGZoJcols17euF0tVCe2q
         jI1YoRsVGZjxtzh9VdKOz29iWy5xzFMSVgLeeUNqfBor0WQYH+dTlmD5p+wk9k/Ih4B3
         kJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qGFw5EG8yfKpTojIo2qI2uz1wjsdjmmuZqulpYk3hwg=;
        b=ZGEVodxyxMyyC25JwcCRWAfcEm0SSpW+Z4nsrbcwmQ6jD0N8Kz3dbxCc0Tm0mh5Sqn
         Gpe4/A2eI4qu9yuLx5p+Cku7xemODMArErkKBPpC39BlzUYV9naJu0gkNzbomEE8MHeX
         CJDhQMf/IxjSMYReuSnLg77TQcdsqB+YOwx5HUhkFG80sl9kYN993gPAnyDM0LRHHnNZ
         2JWd7QzYbtfZAqINyQ23WwXORSmj18yKjanypqR7ZqQf2ljdh/6uAJc41HNgoNLOtc/S
         ah4Rmv8zRWt/eIpy+e8MR6sTro9ysU3jPNQLro9RgeLXrlcnEJi8OjBjzWlxEB1suVBt
         JEfA==
X-Gm-Message-State: AOAM532O3CF7Ns7lF7zSb3slhiS6ShNzLQvBaoVC2cPDOLsatZsn2e0u
        /bv+M1kGCG2EXJYXqAbWR+WV4eT7DA6Y7VP+eAg=
X-Google-Smtp-Source: ABdhPJzO87RlIZQJVU4eUm/FQb5ee7OcZkNqP4k1YqbHQQF8MLaSEQKjZe8DCGwNt2CyC9uW6EuJbN2kDh3E9QjO6T4=
X-Received: by 2002:a25:86cf:: with SMTP id y15mr2802916ybm.25.1598009421523;
 Fri, 21 Aug 2020 04:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org> <20200818122012.37956-3-jacopo+renesas@jmondi.org>
In-Reply-To: <20200818122012.37956-3-jacopo+renesas@jmondi.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 Aug 2020 12:29:55 +0100
Message-ID: <CA+V-a8sa8gszi1cF3SB1QO-aaVwGigrp1m-XmC1NycDcN9MU1w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 18, 2020 at 1:16 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> In order to establish required properties based on the selected
> bus type, make the 'bus-type' property mandatory.
>
> Binary compatibility with existing DTB is kept as the driver does not
> enforce the property to be present, and shall fall-back to default
> parallel bus configuration, which was the only supported bus type, if
> the property is not specified.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov772x.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> index 2b84fefeb4aa..75dad40f70cc 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> @@ -47,9 +47,15 @@ properties:
>        endpoint:
>          type: object
>          properties:
> +          bus-type:
> +            enum: [5, 6]
> +
>            remote-endpoint:
>              description: A phandle to the bus receiver's endpoint node.
>
> +        required:
> +          - bus-type
> +
>      additionalProperties: false
>
>  required:
> @@ -75,6 +81,7 @@ examples:
>
>              port {
>                  ov772x_0: endpoint {
> +                    bus-type = <5>;
>                      remote-endpoint = <&vcap1_in0>;
>                  };
>              };
> --
> 2.27.0
>
