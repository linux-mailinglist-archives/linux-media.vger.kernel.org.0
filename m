Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF97D74D6FF
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 15:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjGJNJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 09:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbjGJNIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 09:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2C12117
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688994333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cSSXjKtHNo2g+s4fKQO8ycwZ9VSR9y5qDmg/kPz0J+8=;
        b=NDekGdoVFuvPxqBPm/p8URYHUEwrlee7pnACszE4CztEXS8QClMi+uhA/7W5iKi6rNAU7A
        ImwAW4o9H6riexZj7hlloOSE6AgNJcBLna4YcmqgtWhnM3Q8sxoa2otZsO/plrPDDIJjjv
        S03AAqBX54a0A6gBqFiIzhASVHqu3NQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-JdtcBln_MRSCfpDRp5m24g-1; Mon, 10 Jul 2023 09:05:32 -0400
X-MC-Unique: JdtcBln_MRSCfpDRp5m24g-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-c0f35579901so5453177276.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 06:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688994331; x=1691586331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSSXjKtHNo2g+s4fKQO8ycwZ9VSR9y5qDmg/kPz0J+8=;
        b=eawJu6t8Kxv+Z0g1zWTozm63uUHb+NRY7BHnlGDrfO+lFCFAPiQQZJzyntPWPX6bmS
         yHwroqQusglDcwCpiTqiDdq+yr8JI9zFFseainllR9Prq8TDOhhTCkDASrd2IEd5lhj/
         /U4wAgnJqnzKYHKDl9yjYZhFfstWcRvP3L7lP2MXzxGNRZCDp22zjXk6DNUd3F3LBfU4
         ENpZXfzZrQ4hWWDLk57yxl7WHPELlBJDbzwjzKGrzTOsW30Xm6A1pZqPmvdR8dXVpIXI
         23VVeX3se6+B3nwSldKRsHElQpAYJF5s2+Li5leTtds83FIHfAAStXSV1CiC1jfVmHRG
         tK5Q==
X-Gm-Message-State: ABy/qLbV7lUmrwngvcLw5cEpcxTq88dN0Do8rmqJM75arUvU/G4AKBXM
        Ok3bb5jS1/KOjxQtCcfXnvOROW8QFbysvoTp0PaDAIXqjjfih+umxuIlqSObEsNIst03fxyYCwU
        NyqCJrprxMr6Bzms0aNecAjrFLiFPwKJv+PsY5J8=
X-Received: by 2002:a25:1f02:0:b0:c67:8903:532b with SMTP id f2-20020a251f02000000b00c678903532bmr9557472ybf.44.1688994331564;
        Mon, 10 Jul 2023 06:05:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFYCDVRqXESu2lKlw5OOq57+bm9EWCrFUc3sqkdq7rbGFO3X2AFRnXejnh8LqRK8eFbanSG74Fa5+uKsOptTgw=
X-Received: by 2002:a25:1f02:0:b0:c67:8903:532b with SMTP id
 f2-20020a251f02000000b00c678903532bmr9557452ybf.44.1688994331376; Mon, 10 Jul
 2023 06:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-11-tzimmermann@suse.de>
In-Reply-To: <20230710130113.14563-11-tzimmermann@suse.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 10 Jul 2023 15:05:19 +0200
Message-ID: <CAO-hwJLvBpNu1z4qM9+331-oUroh4g5HORL=EZS0nb+HHe+fdw@mail.gmail.com>
Subject: Re: [PATCH 10/17] hid/picolcd: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev driver
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com,
        linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 3:01=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.
>
> Flags should signal differences from the default values. After cleaning
> up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Feel free to take this through the DRI tree (or any other that handles
FB) with the rest of the series if you want.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-picolcd_fb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index dabcd054dad9..d726aaafb146 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -527,7 +527,6 @@ int picolcd_init_framebuffer(struct picolcd_data *dat=
a)
>         info->var =3D picolcdfb_var;
>         info->fix =3D picolcdfb_fix;
>         info->fix.smem_len   =3D PICOLCDFB_SIZE*8;
> -       info->flags =3D FBINFO_FLAG_DEFAULT;
>
>         fbdata =3D info->par;
>         spin_lock_init(&fbdata->lock);
> --
> 2.41.0
>

