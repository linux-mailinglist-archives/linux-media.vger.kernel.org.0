Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657DD723554
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 04:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbjFFCfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 22:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjFFCfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 22:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426DF116
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 19:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686018890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EqFplNNFBMxsZKxu892+jTxiHF9dPVb6fkmSgk8CehA=;
        b=EOnWOBwx7qDr9CCgsXq2+PWw4PubNLUTT5E8J9BLALeFUzmc++hFMcEeJABi6Cs6n2Z1qE
        yyemD9VZPyWrI42N2EwBzkV6yV1/7zDSTktMgkB/0bpEVavnEmz+Ny5AhWVvQrrlZGMFgL
        9AVWF3Hg7BK7iMj6ItZfARq/8dnWEWE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-x-08Z-XVNL-kKBk6tITTuA-1; Mon, 05 Jun 2023 22:34:47 -0400
X-MC-Unique: x-08Z-XVNL-kKBk6tITTuA-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6570c5525a7so1073436b3a.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jun 2023 19:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686018886; x=1688610886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqFplNNFBMxsZKxu892+jTxiHF9dPVb6fkmSgk8CehA=;
        b=B4Bbpv9YYBhN2L1F/vrG19pCrXfR0cQWZmFFCePrcUrTLM1I0xl/CitLnHyVxVh8o6
         Xa6E7XjlqZNrK0dCe0PryjjnQYlpXF9T+5ls4JeSIjr8DmDFY5srUTpomF/bWWWRhD7A
         jtoQBtjz1lPolRtnv+JzJSTy8VFbGYCwPdywu/d9yHPVxnTOUmO3y9BFmmAdkMBujgEA
         qBgzbW81EiuHA0oKi0lfatsBgQSki2hDlxtFSZxLdQeaCYYj5QI8PoOYdUUijiQ7LlYX
         324Q3td94ItVo+sTwlrHS1j2In2Ra+mfSGWo+8gkL5QX3BD51l+CUDLzScqmaiy7fUIr
         To4g==
X-Gm-Message-State: AC+VfDy+3i1YiTrofiM8kRKESYRH4YJwTt3zeQAwiMRjQ6+mjn/TVEcv
        z7jEdg/VhSdXqqLfZBSo0VqNw3xnt7Lcc+A8qLIveY+/HrtjCer5gFo5nM6QTzbS08naJK6HRQK
        NDhu8Xi5Fn/f5PTiIZZHLi9RTbQPBeJEfvYWAcPPBWZ8v0+w=
X-Received: by 2002:a05:6a21:6802:b0:105:63b0:5bf8 with SMTP id wr2-20020a056a21680200b0010563b05bf8mr707998pzb.18.1686018886026;
        Mon, 05 Jun 2023 19:34:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70vj0IekeJpT5Kw/rfea8yu5XYFh2CjLR9mIU0apilTuyfi1QvY30+iwcAtpXRDh4bTV99Ne9SIFw0cnxnNss=
X-Received: by 2002:a05:6a21:6802:b0:105:63b0:5bf8 with SMTP id
 wr2-20020a056a21680200b0010563b05bf8mr707987pzb.18.1686018885581; Mon, 05 Jun
 2023 19:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230605102903.924283-1-hpa@redhat.com> <20230605102903.924283-3-hpa@redhat.com>
 <f9f3f779-36e6-4329-880d-12a6faa707c2@kadam.mountain>
In-Reply-To: <f9f3f779-36e6-4329-880d-12a6faa707c2@kadam.mountain>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Tue, 6 Jun 2023 10:34:34 +0800
Message-ID: <CAEth8oFNtW2+CP1m0gxGF3g=SN7UZ_c_7eNGj8W6ppoiVsm+Qg@mail.gmail.com>
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Mon, Jun 5, 2023 at 7:11=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Jun 05, 2023 at 06:29:02PM +0800, Kate Hsuan wrote:
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
> Please add a check for allocation failure.
>
> regards,
> dan carpenter

Thank you for reviewing this.
I will fix it in the v2 patch.

>
>
> > +
> > +     buf_ptr =3D write_buf;
> > +     if (IS_ISP2401) {
> > +             memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
> > +             buf_ptr +=3D (sizeof(u8) * 5);
> > +             memset(buf_ptr, 0, 3);
> > +             buf_ptr +=3D 3; /* Padding 3 bytes for struct sh_css_sp_c=
onfig*/
> > +     } else {
> > +             memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp=
_group.config));
> > +             buf_ptr +=3D sizeof(sh_css_sp_group.config);
> > +     }
>


--=20
BR,
Kate

