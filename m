Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D827A27137E
	for <lists+linux-media@lfdr.de>; Sun, 20 Sep 2020 13:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgITLWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Sep 2020 07:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgITLWv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Sep 2020 07:22:51 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7B8C0613CE;
        Sun, 20 Sep 2020 04:22:51 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id q4so10997753ils.4;
        Sun, 20 Sep 2020 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKZ1Xe28Ow4rt1PmT83Z3KN/e9i3VDBbZGy6cfuQ9rc=;
        b=EpRWEq+0W27nipF/ccwD+Vkb1kYhEdvek2UVshOvnbnagKmTN4zRCoE82za7ipXxEy
         8/9ITdGmgxy/tRI1MNtEe5BMJR11FQH90CdR5LaJafghzE/E9sSe01yvclymV040VTwu
         Xqi3Doq0px/4apUjzjGjdmHa68RA5me8OvmSHncKjOha1xQIbA3RZGumrfRAnMY6toLa
         y0Sw5fpwsHEzKq3vaOZhe6FDHisi3M1f1YC0dW578qqZfxZv7lL4+33s+Ik+asicgekD
         Pr1Xwefbqsur5DGqhTTrTxeulMH6zIWDinbj0AAMPUZ/TA+Hv+80zfRxU+53iWOFfhql
         wvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKZ1Xe28Ow4rt1PmT83Z3KN/e9i3VDBbZGy6cfuQ9rc=;
        b=l2GI9fB41N9XQvWSLNN88wwGi+VUGb81hEWAGibf1hl2uiYo7cH36c913gpYRn5CYg
         hhvyp/ZB5R3+G8ikKmUixRR3zIKM5tSWSGUIfc/n8ig1lAjRnfOAotwXCHLPupKbMkbK
         KeDsgFI3zhX3Dixs/RKJnkhbOfUJyDPOw6ulfAlna5wYDJ3O3YI4AAowbz9uRl8j5eYL
         r0CJ9zr/393LkCwb3nuu67Vx36WcYnh5AT8zyD+3gclXT3pgvG0t667SKeauyr1bF21r
         lh2WKmELQ1z5nAZ0GPgBxVqSLY/zNn0v7EZozpzzHis1sPbpRl6Oz1ArlHSLNHGpsgYn
         n2MQ==
X-Gm-Message-State: AOAM532PdtW8FXWB7SRDmeQFXSXD1o+sSJLd1F9Y/O61Dbl6Pyr1WFfp
        mlMbEC3AJhcuIwTb4X9h0hBXEpW6sLbqKNkvbVI=
X-Google-Smtp-Source: ABdhPJylG4Xdn0ZNb1hXBIPSZ6b/NG2QAMotphgKFHqocioQVWnEbNWG3WUXqKXVvHHwNqi00NDCHNHpmZ3M9upNZmM=
X-Received: by 2002:a92:1a03:: with SMTP id a3mr35254819ila.304.1600600970818;
 Sun, 20 Sep 2020 04:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com> <20200916105949.24858-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20200916105949.24858-2-fabrizio.castro.jz@renesas.com>
From:   Ramesh Shanmugasundaram <rashanmu@gmail.com>
Date:   Sun, 20 Sep 2020 12:22:14 +0100
Message-ID: <CAJWpUEd5_fTUtT_9tuwpgvp=ECmh-NGcU2FH49jmyaJNxKCqmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

>
> Renesas are expanding their DRIF support and offering,
> I'll be the internal maintainer for DRIF.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you for volunteering :-).

Reviewed-by: Ramesh Shanmugasundaram <rashanmu@gmail.com>

Please feel free to take my name off the maintainers list as I am not
spending time on this topic for a while now.

Thanks,
Ramesh

> ---
> v1->v2:
> * No change
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2575f449139a..d9ebaf0c179b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10909,6 +10909,7 @@ F:      include/media/drv-intf/renesas-ceu.h
>
>  MEDIA DRIVERS FOR RENESAS - DRIF
>  M:     Ramesh Shanmugasundaram <rashanmu@gmail.com>
> +M:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  L:     linux-media@vger.kernel.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
> --
> 2.25.1
>
