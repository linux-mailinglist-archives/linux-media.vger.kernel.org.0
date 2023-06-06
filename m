Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81AE3724B5E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 20:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238634AbjFFS1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 14:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238524AbjFFS1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 14:27:01 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6E21702
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 11:26:59 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-75d4fb03100so400442985a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686076018; x=1688668018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EgWp+MBxEt8xLJXziW77AWY9c6lqc/rcXlQ+WkMys1I=;
        b=TFRaVkLcKLqFJPBQQ1ujtMNfkCzjmG3/6h7c3036WnXTH0IuSb0oXxXxiUEjKViAKQ
         AvQy7CYkQSCTnyhpd/mYXwSUxMdCdBjbIOjalvMI8mTg2ylUC/sBTaIcfZzfVPbE+i7L
         qslSw0agu6qTPH6NHQO6QLQ//i6VEZtn6dGlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686076018; x=1688668018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgWp+MBxEt8xLJXziW77AWY9c6lqc/rcXlQ+WkMys1I=;
        b=aDFqGf6NaZFBREKJ4eUKddKZqaKATBkHbIORyLBUdwtfj4A6cfGMHv3Oq2FKIPbClo
         tk+fMxCv5YwKd9LK1C6DDoFXwhtIWptqP7cNb3/HOBAUhJl38LMLrWQffnX1bWRf6xlW
         E3BkNXHR4rK2jETXIOt8s5+apHGAN2klF3Oda00okc+rXCI6xkhh2ptvC1rSctEdlgso
         p8W2PSZ4TQtneEAdA7oJied97Zu+0tPgO9XwXxVPrnfsL68MRbjDjaC7V014El9xCDxw
         njChwrmyspvwj4y8+PV0HENT9EQrU0uZsIu8S46joUzeWX0+vhpURJq0YB80NZM6pnou
         JMTw==
X-Gm-Message-State: AC+VfDwyyrUDu8J/VHRPFZtdh+9FFwqmQQxh1jWMj8Hn82dg8EY4Hx74
        N9mXvZ4/jcmksA70HnMjpm9uMF+F/zjmX/ymz80=
X-Google-Smtp-Source: ACHHUZ5ayeoTrfBk8xoS7RGF9Y7q1foz+4EmsKYgiRm3glu9fhUz2fel4x0CByAe2/1BFWl9PBhJEw==
X-Received: by 2002:a05:620a:3b12:b0:75e:c361:2ccd with SMTP id tl18-20020a05620a3b1200b0075ec3612ccdmr497153qkn.31.1686076018539;
        Tue, 06 Jun 2023 11:26:58 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id p12-20020ae9f30c000000b0075b2af4a076sm5112114qkg.16.2023.06.06.11.26.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 11:26:57 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f7f864525fso71157231cf.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 11:26:57 -0700 (PDT)
X-Received: by 2002:a05:6214:250d:b0:625:aa49:9abd with SMTP id
 gf13-20020a056214250d00b00625aa499abdmr329934qvb.65.1686076017218; Tue, 06
 Jun 2023 11:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230606170919.GJ25679@pendragon.ideasonboard.com> <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 6 Jun 2023 20:26:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCsQJB7bL2ObW2BssK4igEJ2ME3DU-RvsU4wkSoHbnTcfw@mail.gmail.com>
Message-ID: <CANiDSCsQJB7bL2ObW2BssK4igEJ2ME3DU-RvsU4wkSoHbnTcfw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU mappings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Poncho <poncho@spahan.ch>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 6 Jun 2023 at 19:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> When commit 716c330433e3 ("media: uvcvideo: Use standard names for
> menus") reworked the handling of menu controls, it inadvertently
> replaced a GENMASK(n - 1, 0) with a BIT_MASK(n). The latter isn't
> equivalent to the former, which broke adding XU mappings from userspace.
> Fix it.

Ups, that was wrong :), sorry about that

Thanks for the quick fix.

>
> Reported-by: Poncho <poncho@spahan.ch>
> Link: https://lore.kernel.org/linux-media/468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch/
> Fixes: 716c330433e3 ("media: uvcvideo: Use standard names for menus")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> This is untested. Poncho, would you be able to test this patch to see if
> it fixes your issue ?
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5ac2a424b13d..f4988f03640a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>         map->menu_names = NULL;
>         map->menu_mapping = NULL;
>
> -       map->menu_mask = BIT_MASK(xmap->menu_count);
> +       map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
>
>         size = xmap->menu_count * sizeof(*map->menu_mapping);
>         map->menu_mapping = kzalloc(size, GFP_KERNEL);
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
