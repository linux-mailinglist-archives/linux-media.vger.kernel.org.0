Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF67B69E4
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 15:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbjJCNJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 09:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjJCNJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 09:09:21 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65DCA6;
        Tue,  3 Oct 2023 06:09:18 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7abb93528e2so444930241.0;
        Tue, 03 Oct 2023 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696338558; x=1696943358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Znjfur39qqjdzsEXvyYiHZuLbuaT0vTImvdbRdQV+4=;
        b=aX7kwnOf3WM6s/BRgpqhktWcZc6KdqVf4PAbMIYA6f8fO75bwAxpbSVALoUITUb87x
         Yph7YFVmmamLo9Mvqo47MtguGoSF1xrPeJvu07tRCwsQdKqPPWlgoElPpbjaGtYow9fI
         uiT0AFzWGxbjjNCo5dVZtNzGXfoUyrjrargijbmJiQh9gwF/CbjT0vrOvkTkPf9N/Vhq
         VDxRRgEFswcAj6Qzpyyx60TTyu/gwsX8AliwvzSlVTEU7qtrhVagetTCXv8wXoSA31e6
         gEQBN5ffmRxVQKqSAOwZ+1n7ZZaXv0EzHGuMYQJffb/ZwO1WdWFOU6DN5IT70JTnXj6a
         dsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696338558; x=1696943358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Znjfur39qqjdzsEXvyYiHZuLbuaT0vTImvdbRdQV+4=;
        b=VkrnDyCTk76HKlT+1I+NMH4/LsBvJEeLFX/SastziLuUfMtPVr92ebVfb7j50LgWT8
         hOgzgbbQjFvCKe1EmtbQ8xe6WOTKFQoAygPd+QtQrb+Wtl7/gi97/uqmWYXYxI4skS2r
         1X+mKDyWuVh+7UTE1gNSWSOZ+JegHqZ/7kZZngPPpBihwufx5xQ9ni6AQOkNitvthrvX
         xjOyDi56rN60Qa/s1puL2GA21yLlBAj0vVmoOmB1xPXzg3AWCbu9PQtpLs3IhLwvRpoX
         0RTvLV+/9UDU+SZVwE1MxqZStgsOEVgRwlX31eNZLMlQ6gY4Jp5RraVMmFEmHwqnhrX0
         dVTQ==
X-Gm-Message-State: AOJu0Yzm2Zd5dfaMQNP/APYosc0XI+XJOv6gYoWLbiqxZ+Wjt0qXCm8a
        lfkTBBY0wrREaZMoUuW0Y+1u9s/aXMVIgfmlFFA=
X-Google-Smtp-Source: AGHT+IHxLU2viRDvkfkjpNz6nLNjvh8SF9YyPfx8WmQylu/hSi9YoR5Ymu6Rg5pcSwG4lhIaG29eWFWaLLA0k+xwzLw=
X-Received: by 2002:a67:d094:0:b0:452:7526:73ae with SMTP id
 s20-20020a67d094000000b00452752673aemr12677763vsi.26.1696338557858; Tue, 03
 Oct 2023 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
 <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com> <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
In-Reply-To: <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
From:   Kun-Fa Lin <milkfafa@gmail.com>
Date:   Tue, 3 Oct 2023 21:09:09 +0800
Message-ID: <CADnNmFoNe50AkcVCk2fx4rUkNVZ2QJ2eud0dz5AExy0+4u7Fbw@mail.gmail.com>
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On Tue, Oct 03, 2023 at 08:02:33PM +0800, Kun-Fa Lin wrote:
> > Hi Dan,
> >
> > Thanks for the patch.
> >
> > > The of_parse_phandle() function returns NULL on error.  It never returns

                          ^^
> > > error pointers.  Update the check accordingly.
                               ^^
> >
> > Commit message contains some redundant whitespaces.
> >
>
> I have no idea what you're talking about?  Are you talking about two
> spaces after a period?  :P
>

Yes :P

Regards,
Marvin
