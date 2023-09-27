Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDD57B0381
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjI0MJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 08:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjI0MJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 08:09:49 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1882F180
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 05:09:48 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-4962c3588a3so3883439e0c.1
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 05:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695816587; x=1696421387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4rGt0XRlPacL5YggOXB08MWd6iS0qcmMTU/xjWBGVw=;
        b=RkEJYHqpQSFbE2aLFLzUGb+VK8Ipa3DIUA+gVlUISiHV58KXcozYvhB3lvIFsjYEs1
         01WVwbKQG3I4BanQK4Kpj4EisK8f3Gb6Gf7RWID4Ol+0N5Yes1ThAjXNh60IkuWxQl+p
         qdDCf1bnLtTQ6Eg2v51lTDJlvVueQMjAn8PHJe78076h94Kf3WPIT9rbRHSVWvcTK5XR
         y0jMLvqExmi5mzi3jm5fpuOGnLofhH8DXwcHkwiyo9u0WEbCGCJ/fE+vGlMn48SqPnJd
         bR51ZVYjGduoaqzN2f0JwMtYQUYHvyG2YiTlVd83vXIhXbulXnGGj7TgnHH8RLi0U5zl
         1pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695816587; x=1696421387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4rGt0XRlPacL5YggOXB08MWd6iS0qcmMTU/xjWBGVw=;
        b=eISongI/sy6U8yIaSgfLhfnR6XY7StwWoypYvVMZ/fyRr5wnQn5Py/wWMnZEDDJDD9
         5XgjBJ1TDnmQquOJL+fqHHK9gMQrGl+YxelyFUvDEE3red5uCi5/vV43T9uUqQ4jEbDX
         BSClgS2L1IIqX9hud7gl2oi0hOuk1HIkymAkQove9ofXmMm/+c3fJ0Cikt9fgLdv8yIb
         brqV9MojhMfayNoVnmsWbcqIg9XqeBQWr2F5jwtP5pVlJpIrE9UGnwS6hzLk8HZ8t9oy
         u8dmzfx38igGDVFoJeVJjv4hGtarlhFGmyPuQNFzcu5TnzutbaZTos3wNFM/H9ivvdD9
         imUw==
X-Gm-Message-State: AOJu0YyWLC5Gij5UP8Lz3UPnWAnWdoPoXik+7lfcaagTl+3OviPjICVd
        vh/TmqYZKqn2Ik0ZPNtXqIdrx5IbKj3jF4O6/38=
X-Google-Smtp-Source: AGHT+IFPdM9iQ/Rv2ZUNZR6AdiGk42gJRjIVK/Hs7IX9o7+TWs0rWiqUzogWzgw0Vc5E6fJ1OiAKUQaWRGijB61+XX8=
X-Received: by 2002:a05:6122:995:b0:49a:a931:dfba with SMTP id
 g21-20020a056122099500b0049aa931dfbamr845708vkd.4.1695816586974; Wed, 27 Sep
 2023 05:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <f794bf89-584b-41ff-a021-ab973cae89f8@moroto.mountain>
 <ad3feca0-94da-4b81-b52b-6a893bd07e5c@xs4all.nl> <88c78401-a3bf-4996-a703-c2869d3d7d23@kadam.mountain>
In-Reply-To: <88c78401-a3bf-4996-a703-c2869d3d7d23@kadam.mountain>
From:   Kun-Fa Lin <milkfafa@gmail.com>
Date:   Wed, 27 Sep 2023 20:09:36 +0800
Message-ID: <CADnNmFpW1VGwzVfXW-sdnM-YwNPv2+6YNviAt+Mbth_phgaBUw@mail.gmail.com>
Subject: Re: [bug report] media: nuvoton: Add driver for NPCM video capture
 and encoding engine
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

> > On 26/09/2023 16:23, Dan Carpenter wrote:
> > > Hello Marvin Lin,
> > >
> > > The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
> > > capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
> > > the following Smatch static checker warning:
> > >
> > >     drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
> > >     warn: sleeping in atomic context
> >
> > Hmm, why didn't my smatch run see this? Does this check require something
> > special? Does it rely on having run build_kernel_data.sh?
>
> Yep.  It relies on build_kernel_data.sh.  Otherwise it that code is all
> released.

I can see these warnings after running build_kernel_data.sh:
drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
warn: sleeping in atomic context
drivers/media/platform/nuvoton/npcm-video.c:1089 npcm_video_irq()
warn: sleeping in atomic context

I'll send below patch to fix them, thanks for the bug report.

--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -412,7 +412,7 @@ static unsigned int npcm_video_add_rect(struct
npcm_video *video,
        struct rect_list *list = NULL;
        struct v4l2_rect *r;

-       list = kzalloc(sizeof(*list), GFP_KERNEL);
+       list = kzalloc(sizeof(*list), GFP_ATOMIC);
        if (!list)
                return 0;

@@ -467,7 +467,7 @@ static struct rect_list
*npcm_video_new_rect(struct npcm_video *video,
        struct rect_list *list = NULL;
        struct v4l2_rect *r;

-       list = kzalloc(sizeof(*list), GFP_KERNEL);
+       list = kzalloc(sizeof(*list), GFP_ATOMIC);
        if (!list)
                return NULL;

Regards,
Marvin
