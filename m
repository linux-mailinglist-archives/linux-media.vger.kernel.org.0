Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 766693F9928
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 14:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245094AbhH0Mpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 08:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245060AbhH0Mpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 08:45:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C94CC061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 05:44:42 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id n27so13589480eja.5
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHAvFdp9F9uLUuqrTIGTPSO/uotGE+jx4GAojTbi8z4=;
        b=aPMwZXOen/7OuJ0PX84uWKe55hzC+Xb96LP2O3zLgEyaKAtBKqfvfX9dCgKhL6bDod
         0MssfHbrVWdVOkgRwESCyXNqeJzHJslLQK2GfBV/y6d73tENwD9zRUej3pG4Sm7RT6eX
         HM94FYo/meIEqMaD0Mg+kf3FvpS4zChKwGpi3qSfHuYonHEFnDeQAjGCtWnqKTxussiQ
         UNBYMP8/3ucqBeLowKIjl7lEbJSvMD3cw+aRMy8LqWiktA90EaFfSUEG9XTNTefVUPUn
         wYychiudW5hW2J4KFhoc8FkaCK1QN4Ov7Uok8uLsNIS0i7ZAvLADYHB6vhKgDZMZyvRU
         BX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHAvFdp9F9uLUuqrTIGTPSO/uotGE+jx4GAojTbi8z4=;
        b=gtKbpa9vj1iOAYKdg6eHGX634f54X9K0nxhYhopmcRBZmc2fwvW0olCMnk7uE6Agfj
         LgAupnsQ6fyP2frHz3hkw4EiNXSA65pxVN2OEkD8ydxZyoFv6mSaovaKd/YNp0FY9kgM
         J16uxc/zIJH6sgZCKfI8GXNwFYQ4ONG6Pc4+iNcYvCwPsf134TbLsJ8QDHcouzQJXTtC
         PEYSfKFJYqtD7r56QZBxmub/7J3kvl0iqdLHr4nLKQzASKm0QUQPvrgufOoHy9mW4lDV
         n2zuPemSjdGaju1HAvM7OhfTgO75n6JPX2gvlt9SAKdKTlWfkabpXMroh0KEOsO4NuhF
         q2yw==
X-Gm-Message-State: AOAM531joAG0pLq85yVDB0/MLx+IwGOIAolSU9PaQQFxFA3LnMEbRu4y
        9qxDeHvX+/odnwiMnBxTHjHdFAYQVdSjVvofszgMFA==
X-Google-Smtp-Source: ABdhPJyVQ4p80aH1g2Z+J0BqLVt5HWr0DJvxvnC/Xi0mpCNHD5AmbhrB5QNLfoaOoBNGWWzVhMvB+6ZqXHN9yq9bRQQ=
X-Received: by 2002:a17:906:a0c9:: with SMTP id bh9mr9644623ejb.51.1630068279302;
 Fri, 27 Aug 2021 05:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
 <20210610113615.785359-3-hverkuil-cisco@xs4all.nl> <ccaf0fa9-8be6-c623-61c7-91cb804ca2bf@collabora.com>
 <123eee90ee3e3fe5227f6ed88defc3818645c83e.camel@collabora.com> <cjs7hg9e457cn775prtsb860lkplvmmj9t@4ax.com>
In-Reply-To: <cjs7hg9e457cn775prtsb860lkplvmmj9t@4ax.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 27 Aug 2021 09:44:27 -0300
Message-ID: <CAAEAJfBhLEOdPp-sqeBqzStxa82Fu7YDF==pnX3R=0cebzNRHg@mail.gmail.com>
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically
 allocated arrays.
To:     John Cox <jc@kynesim.co.uk>
Cc:     Daniel Almeida <daniel.almeida@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Wed, 11 Aug 2021 at 12:59, John Cox <jc@kynesim.co.uk> wrote:
>
> Hi
>
> >[..]
> >
> >>
> >>
> >>  I tested & used this on my AV1 uapi patches [0] and this feature works just fine as far as I can tell.
> >>
> >>  Tested-By: Daniel Almeida <daniel.almeida@collabora.com>
> >>
> >>  Can this please be queued for 5.15?
> >>
> >
> >Hi Daniel,
> >
> >I believe your reply wasn't plain text so might have been filtered.
> >
> >Also, I'd say we want to have users actually using the interface,
> >before we consider merging it.
>
> What constitutes using? We (Pi) are in the process of adding it in the
> next version of our V4L2 H265 decoder (when we update to 5.14), or is it
> only used once merged?
>

Out of tree users have traditionally been assigned a low score.
Some kernel folks don't even count out of tree as user,
but  not me, I do count any user :-)

We definitely care about Pi and about other out of tree drivers
and users, as long as there's a plan towards mainline.

Thanks,
Ezequiel
