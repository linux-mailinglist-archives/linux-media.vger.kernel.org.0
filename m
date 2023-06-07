Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7437A72525F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 05:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbjFGDWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 23:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234577AbjFGDV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 23:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115B81715
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 20:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686108066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O4uHN7dDyqiJFN38ljpVYfsqZFn90IQ9E8iBPn120b0=;
        b=hXrp5yKWWBF0B7YcOpwuykSPIy5rLvC2A5m0r2brp5gq2N/EFZlRPVa7YoyaGXTmtGctB2
        7s8cCt54Bw3cpvBmROhBkYk9UM1iEbbNPTdXjZgzMa0PVDBP82JAkoA7phpd6H0tK5gmAZ
        7TqMwdChZAEHLiLltB5WHiI0Lil0nKg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-CMREbr6cPCik-zuqgmBJyw-1; Tue, 06 Jun 2023 23:21:04 -0400
X-MC-Unique: CMREbr6cPCik-zuqgmBJyw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2553b096ddfso149968a91.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 20:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686108063; x=1688700063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4uHN7dDyqiJFN38ljpVYfsqZFn90IQ9E8iBPn120b0=;
        b=Fg07I3ALqnJGrgtgfldRNyEhYPTqms1Gk+hSm5i4R0lN2vvj9uLN6/pz9ICcRrJb0Q
         S3zAnhDWt8bW0i6gJI/iG2yjCTwNHDX6QOFffrSeqN+FXgHAn7JAWVUBuLDbL39KF6Mt
         t3irQuhaK4voljXNZEqP8Rk9ImCyFhryHZF189eAzGlYiCl85KNZ/uQqESl1xUJ4lY82
         oCpm+jJx7QfGbkKcOruO1eQ0A8wOe6tAigRM31IuRtmO4eIr0fT3mCqiVDrvPAoVyxr+
         hKsA/beMYlSJuST27MrEn36HEJTUzNsiq4QI1/OD2D4315vruf5DGolnnOma2/5abiT3
         hbNg==
X-Gm-Message-State: AC+VfDwRmMTXnbcB27+A2wlOb2bx8+DPmw2dMuOaKXYrGGal/kHisLCE
        jtzxfpJzRPEI2HkiMfnsFLNMGDeEIxHfjL/EDBcN2P8U/+6Vn8kILk2ho5b2Ah3JAcRA/OlT2Hz
        hoc6uVgq2WMonBQwHFHUWUBU/bmBWqOCeAwgKdno=
X-Received: by 2002:a17:90a:5604:b0:256:3191:640f with SMTP id r4-20020a17090a560400b002563191640fmr14168542pjf.4.1686108063605;
        Tue, 06 Jun 2023 20:21:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IxHHAI8fo1XyQhNSq6ZNwnNspJlg0rcaVutU8hYk5R/tYh4ALfAgz1bCe2gZW58in7EQvKzgdmKTHubM56r0=
X-Received: by 2002:a17:90a:5604:b0:256:3191:640f with SMTP id
 r4-20020a17090a560400b002563191640fmr14168521pjf.4.1686108063173; Tue, 06 Jun
 2023 20:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230605102903.924283-1-hpa@redhat.com> <20230605102903.924283-3-hpa@redhat.com>
 <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
In-Reply-To: <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Wed, 7 Jun 2023 11:20:52 +0800
Message-ID: <CAEth8oFRQY0-orTxM5csAmvj3D65i5j-qqiy6nYLuS6spyEkzg@mail.gmail.com>
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Jun 6, 2023 at 7:02=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi Kate,
>
> On 6/5/23 12:29, Kate Hsuan wrote:
> > Pick up the necessary part of sp_group configuration for both model and
> > then copy those parts into a tempetory buffer. This buffer is finally
> > written to the ISP with correct length.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/driver=
s/staging/media/atomisp/pci/sh_css_params.c
> > index 588f2adab058..2913d9d6d226 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> > @@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading=
_table(struct ia_css_stream
> >
> >  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
> >  {
> > +     u8 *write_buf;
> > +     u8 *buf_ptr;
> > +
> >       IA_CSS_ENTER_LEAVE_PRIVATE("void");
> > +
> > +     write_buf =3D kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
>
> Please use sizeof(struct sh_css_sp_group) here, since you have dropped al=
l the #ifdef-s in the header now that is the largest size which you need no=
w.

Okay.

>
> > +
> > +     buf_ptr =3D write_buf;
> > +     if (IS_ISP2401) {
> > +             memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
>
> This is wrong, there is a big hole between:
>
>         u8                      no_isp_sync; /* Signal host immediately a=
fter start */
>         u8                      enable_raw_pool_locking; /** Enable Raw B=
uffer Locking for HAL
>         u8                      lock_all;
>
> and:
>
>         u8                 enable_isys_event_queue;
>         u8                      disable_cont_vf;
>
> filled with ISP2400 specific data now, so you are copying what likely is =
some empty alignment bytes before the ISP2400 specific input_formatter stru=
ct now instead of copying enable_isys_event_queue
> and disable_cont_vf.
>
> So you need to split the memcpy into 2 memcpy calls. You can calculate th=
e source offset of enable_isys_event_queue in sh_css_sp_group.config with o=
ffsetof(struct sh_css_sp_config, enable_isys_event_queue), or better yet, j=
ust take the address of it:
>
>         if (IS_ISP2401) {
>                 memcpy(buf_ptr, &sh_css_sp_group.config, 3);
>                 buf_ptr +=3D 3;
>                 memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event=
_queue, 2);
>                 buf_ptr +=3D 2;
>                 memset(buf_ptr, 0, 3);
>                 buf_ptr +=3D 3; /* Padding 3 bytes for struct sh_css_sp_c=
onfig*/
>         } else {
>
> Also note I have dropped the "* sizeof(u8)" here, you already dropped tha=
t yourself for the memset / padding bits and dropping it makes the code eas=
ier to read IMHO.
>
>

Ops, My bad. I tried to simplify the memcpy() part and made the things
wrong. I should skip the structure between them. I'll fix it in the v2
patch.

Thank you for pointing out this error.

>
> > +             buf_ptr +=3D (sizeof(u8) * 5);
> > +             memset(buf_ptr, 0, 3);
> > +             buf_ptr +=3D 3; /* Padding 3 bytes for struct sh_css_sp_c=
onfig*/
> > +     } else {
> > +             memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp=
_group.config));
> > +             buf_ptr +=3D sizeof(sh_css_sp_group.config);
> > +     }
> > +
> > +     memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pip=
e));
> > +     buf_ptr +=3D sizeof(sh_css_sp_group.pipe);
> > +
> > +     if (IS_ISP2401) {
> > +             memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_s=
p_group.pipe_io));
> > +             buf_ptr +=3D sizeof(sh_css_sp_group.pipe_io);
> > +             memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
> > +                    sizeof(sh_css_sp_group.pipe_io_status));
> > +             buf_ptr +=3D sizeof(sh_css_sp_group.pipe_io_status);
> > +     }
> > +
> > +     memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.de=
bug));
> > +     buf_ptr +=3D sizeof(sh_css_sp_group.debug);
> > +
> >       hmm_store(xmem_sp_group_ptrs,
> > -                &sh_css_sp_group,
> > -                sizeof(struct sh_css_sp_group));
> > +               write_buf,
> > +               buf_ptr - write_buf);
> > +
> > +     kfree(write_buf);
> >       return xmem_sp_group_ptrs;
> >  }
> >
>
> The rest looks good at a quick glance, but I need to take a closer look l=
ater.
>
> Regards,
>
> Hans
>


--=20
BR,
Kate

