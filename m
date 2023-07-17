Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7D97559CC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 05:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjGQDCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 23:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjGQDCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 23:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D8410D
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689562920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UbJG4dHyZ5/q/VVWsWG+GOVp19fXI6CF1MdILq4BY4Q=;
        b=O4G/UFjcm/cJuVjUInr6aPaCz8mSSChSepaarNLCpMjA+s/anNeZuiDpIdQBIqJCotlSgh
        Q80/zTm6d16jY3A0YWUwjmnEDHusSoDrdpRI0nEzbIbiGkzyY2UCA6DcxHLvOehmrJt4Qh
        bqLAiQc4Q71slUh/ei+qkG1ihFVZ53E=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-YjzX75z8NVqpFxeKdpSZrQ-1; Sun, 16 Jul 2023 23:01:58 -0400
X-MC-Unique: YjzX75z8NVqpFxeKdpSZrQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-26337f5d2daso3158231a91.0
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 20:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689562918; x=1692154918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbJG4dHyZ5/q/VVWsWG+GOVp19fXI6CF1MdILq4BY4Q=;
        b=FZ6EP0jFsmi8spXqwgJdOxhO6pKbdg84rvdGJVu1BKIWohK51Nqb+HhfNpY3bWzg6c
         Pt9GPT0X5xrsbMXATzpqNXSYP1CMUE+Sj5OaiV+FdUrmdqQHzreDwuy4ubmGC6gjpq8V
         LfEy+9K3rdaM5tlufeSfVf7ltCVTWbCUgVhKdoQhA712/VT9kPgxpuO7QJzdJWUZIU1q
         HU/UyZj7ntiQxv/QdWpP+YkXeL9WCFqhCC/ihnoP5u+5dSUuZpeIX5VK6LnTfqOPVNlu
         XW4YPiVvwDU7qzxzVCoUQJPM2yfi3Mw75X/PxJ7g/gv7p8Kjl4mZ2e8EA6MJqK2Aw+xb
         ZWsg==
X-Gm-Message-State: ABy/qLbRS9ATmqSDIZYMNfaqvTZBjPtTs1ex/a6MeQNz8IV0t7qnJd5p
        Au8Fw3YTC+oq0mmTvWBE2A3++IeOrfXf1CoYKeN32I3lsS+TkARFLRlWtWv8lWZiq1VlvBLdfW7
        qrAAh61Vt/lwrsLfdid+aSCzoIWm17rPznctuMDA=
X-Received: by 2002:a17:90a:6a82:b0:25e:abc9:3cb1 with SMTP id u2-20020a17090a6a8200b0025eabc93cb1mr10509105pjj.4.1689562917793;
        Sun, 16 Jul 2023 20:01:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHCoix+M+feetdiw/m8iebGWratbh4c0crQs1pPKpXlLg2pIXRiZlnnd7Ed1BSyEI0lfZxeeaD7ifehCYeKxxY=
X-Received: by 2002:a17:90a:6a82:b0:25e:abc9:3cb1 with SMTP id
 u2-20020a17090a6a8200b0025eabc93cb1mr10509091pjj.4.1689562917435; Sun, 16 Jul
 2023 20:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230715170906.3627-1-hdegoede@redhat.com> <20230715170906.3627-3-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-3-hdegoede@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Mon, 17 Jul 2023 11:01:46 +0800
Message-ID: <CAEth8oG-Hae07g11miFQh0=_KY67ER4vc60L+G9NaGMa9ByqDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: atomisp: Mark ia_css_isys_240?_init() static
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sun, Jul 16, 2023 at 1:09=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> ia_css_isys_240?_init() are only used inside the C file where they are
> declared, mark them as static fixing:
>
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:24:20:
>    warning: no previous prototype for 'ia_css_isys_2400_init'
>    24 | input_system_err_t ia_css_isys_2400_init(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:87:20:
>    warning: no previous prototype for 'ia_css_isys_2401_init'
>    87 | input_system_err_t ia_css_isys_2401_init(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307152046.rvhFGrbz-lkp@i=
ntel.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/runtime/isys/src/isys_init.c    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init=
.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
> index 1a7b45bb4544..18bfe1010989 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
> @@ -21,7 +21,7 @@
>  #include "isys_dma_public.h"   /* isys2401_dma_set_max_burst_size() */
>  #include "isys_irq.h"
>
> -input_system_err_t ia_css_isys_2400_init(void)
> +static input_system_err_t ia_css_isys_2400_init(void)
>  {
>         backend_channel_cfg_t backend_ch0;
>         backend_channel_cfg_t backend_ch1;
> @@ -84,7 +84,7 @@ input_system_err_t ia_css_isys_2400_init(void)
>         return error;
>  }
>
> -input_system_err_t ia_css_isys_2401_init(void)
> +static input_system_err_t ia_css_isys_2401_init(void)
>  {
>         ia_css_isys_csi_rx_lut_rmgr_init();
>         ia_css_isys_ibuf_rmgr_init();
> --
> 2.41.0
>

Thank you for working on this.

It looks good to me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>


--
BR,
Kate

