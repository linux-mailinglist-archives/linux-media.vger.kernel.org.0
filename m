Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B03228012
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 14:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgGUMhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 08:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgGUMhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 08:37:01 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48009C061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 05:37:01 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a1so21453689ejg.12
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 05:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7X6TFuDA2AgdDaJ8XT6FgxO3Uu8NZwFOACOJdwmuC8=;
        b=SgQ6u5sLV9P0KGSSAYBHyulF5NEmpccZ0QuB4zGq4EUrIcQYJJd6ZqxxmAJk9ox7P1
         ihbxZx0xPbbSqKN735ypY44AQlg2YJWM855nOIFAJTVcvSPcDaVwKQpxCxSLGTemp7IM
         y45dD5n1c5tpZrlzsyCi7KKpc//hrN2DmIU3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7X6TFuDA2AgdDaJ8XT6FgxO3Uu8NZwFOACOJdwmuC8=;
        b=Td4od9TSCXhNg6enM/NcKGMh/3u7zyVX10yV/rl5bnnzWu2q6TM9ZhBKxN8m3R7lXc
         LKc76kSAnXM0lRb2KC9wMFbofbak/0cuoUFil1jF4ZN2cc+bgYtHopJHjbZiARQ+gNPp
         8MiOpOKreBqh12nsZzX8qHy9ZLuYfoFa1eNhTEXoELt2Fi79XTw/Y/NxJoEVvaDeolUw
         k6U3qNV1y1WXwWOQ7W1xPRDnXpbvf4NJKpVE2BNumOq92ynFxEayUF6RaYJ7pmJmvwwH
         IZaKov5pV7kHLbdN4X5EfMy0V9TlLWfphOeOAjcXgkeBZ36K+YCXg/VAvzr0s9kX3/Zu
         uizA==
X-Gm-Message-State: AOAM5328Ffkw3471wh5xOVSTG7DHTKl4Fo5eXdkiS0F1Rs8vHoHVP8ZB
        g0UWALoj7LWQ0V7BKDFB6ZuWsCKyRfw=
X-Google-Smtp-Source: ABdhPJz3XEDjxiFC4WNCWH/1gS3WmfX2x6PZIYjZ5JX6ZUhCB1svp6MYCTy3e9QKaXEa5ByOFSIfiw==
X-Received: by 2002:a17:906:3b9b:: with SMTP id u27mr875286ejf.500.1595335019699;
        Tue, 21 Jul 2020 05:36:59 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id q17sm16570848ejd.20.2020.07.21.05.36.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 05:36:59 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id c80so2677930wme.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 05:36:58 -0700 (PDT)
X-Received: by 2002:a1c:4303:: with SMTP id q3mr4061770wma.134.1595335018254;
 Tue, 21 Jul 2020 05:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
 <20200718145918.17752-6-dafna.hirschfeld@collabora.com> <d8475ade-94a3-48ad-02d7-f03810ddf6dc@collabora.com>
 <114a3242-88e9-46a1-c8c8-f5bfd424d05a@collabora.com>
In-Reply-To: <114a3242-88e9-46a1-c8c8-f5bfd424d05a@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 Jul 2020 14:36:46 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BLuwfnQfYbaWmtre5YCx-_YG4E10cZxeL+6pESap_U0A@mail.gmail.com>
Message-ID: <CAAFQd5BLuwfnQfYbaWmtre5YCx-_YG4E10cZxeL+6pESap_U0A@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] media: staging: rkisp1: add a pointer to
 rkisp1_device from struct rkisp1_isp
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 2:26 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> On 20.07.20 21:25, Helen Koike wrote:
> >
> >
> > On 7/18/20 11:59 AM, Dafna Hirschfeld wrote:
> >> The code in rkisp1-isp.c requires access to struct 'rkisp1_device'
> >> in several places. It access it using the 'container_of' macro.
> >> This patch adds a pointer to 'rkisp1_device' in struct 'rkisp1_isp'
> >> to simplify the access.
> >
> > What is wrong with container_of?
>
> I remember Laurent suggested it a while ago.
> I also feel container_of is a bit cumbersome and other entities already have a pointer to rkisp1_device.
>

Do we even need the rkisp1_isp struct? Could we just pass rkisp1_device instead?

Best regards,
Tomasz
