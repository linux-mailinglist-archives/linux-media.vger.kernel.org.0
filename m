Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74EB177BC5
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 22:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387999AbfG0UUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 16:20:35 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43049 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387841AbfG0UUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 16:20:35 -0400
Received: by mail-ua1-f65.google.com with SMTP id o2so22563708uae.10
        for <linux-media@vger.kernel.org>; Sat, 27 Jul 2019 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6Hw/8q/I4E4lKx7Uu3Df+BkPRUnp2Xf9RTmX9yqVmfE=;
        b=nm1Bfz0fthPovqpOUFj951UdrxsQlWx+kEnRJCUJ1Y1H14OGwYKQ9MjbgJgOXeWMnF
         NitLPwlfANhxk+iijXuzB7eyqbXvofpcGo+WbXptkFz+aVHgqDm6T0aAciKB7/zFMX2L
         /JL0n58bvk3IYmcwjCjoaOK42twkIKDqgAU99HCG7sq9boGaUq0B64D7zdI0ImzI0H9N
         boRCC3MyVLEH4q/h9d6rKArDUDkZUK6nbFSfvcVGfQLf4WG/Mr57q9qLkoRCuNpTQJQg
         Bs4difNp27zhzpLtLQgWa65uQQ3nK/5S3qIOZUdzbH83SjLYWnaa3ReFkpdtk0jF6Sl5
         Czrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Hw/8q/I4E4lKx7Uu3Df+BkPRUnp2Xf9RTmX9yqVmfE=;
        b=d0WlD6DdrhIdsmpDbqOWa9H5JgKXKB3YdnKNA/MrJcnm7+hVrrr/XjZ379/FOwfdyI
         KA42+5ZwqHSxNubU5dzLyrTO2+HJLzxVlGcD7VxK4GIFkmCxApDTakl/babN40JR7wo5
         0uu3n+zGZ64BgAJAib59HGD5YQzYiQ5OWc3maGFbMesCzin214rUTh75Bws3LjMZa6C5
         QgOsKjrXtGzSVO3REb7D+JUHz4b549GHZwp27IMDsR5Ymm+KfyjH5RiwBY+9xO0HBTS0
         mAJ14piKRpMN6M1hBQayzyjoL2PDozdkaAgec1cff3yVVKxe4cmat4z74FOLQxXsjFEw
         dA/w==
X-Gm-Message-State: APjAAAUSoVwhINGD5uzN5cYlqEn9LcfMh8FOC5YjEJgyiEGL2N+bft0k
        7JA1a6vKce1eNPI+h7cHmPLCFE7Ok32RSajd50w=
X-Google-Smtp-Source: APXvYqzBpwJ89MIJ2+bOxi3uZ+zWZ8De0QJlGbTS8RFsA8YEnPkX4Bae9sc9R4DJ3Rq79PCnKLdoVnBWrm+W8HMk+As=
X-Received: by 2002:ab0:6619:: with SMTP id r25mr15535084uam.33.1564258834583;
 Sat, 27 Jul 2019 13:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
 <CAAEAJfDgEVMWbYkEaVp0mp4hQXbhZq8xJQM8xqCXGmyq7OaP9w@mail.gmail.com>
 <2586e6ca-da28-ac87-35dc-dfa6ae66f67d@gmail.com> <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
 <bd66b641-d11a-7794-ebe2-c7c4bbbc5208@xs4all.nl>
In-Reply-To: <bd66b641-d11a-7794-ebe2-c7c4bbbc5208@xs4all.nl>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 27 Jul 2019 17:20:22 -0300
Message-ID: <CAAEAJfDpaMCvWuTgZN-aR0ETOunyEV8M5he9QUmgx4dNq46uSQ@mail.gmail.com>
Subject: Re: tw686x driver (continued)
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     =?UTF-8?Q?Mark_Balan=C3=A7ian?= <mbalant3@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, 24 Jul 2019 at 10:08, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 7/24/19 2:25 PM, Mark Balan=C3=A7ian wrote:
> > Hi Ezequiel,
> >
> > (sorry didn't include linux-media in first email)
> > I'm not sure yet if I have my supervisor's permission to declare our
> > tool as open source, but I'll tell you the possible code paths that I
> > think may be leading our tool to think what it's thinking.
> >
> > First off, it detects a write access to desc->virt without locks inside
> > tw686x_memcpy_data_free, after it is called in the calling chain
> > tw686x_probe -> allocate an interrupt line -> tw686x_video_init ->
> > tw686x_set_format -> tw686x_memcpy_dma_free.
>
> Until the video device has been registered there is no need for locking
> since there is no possibility of concurrent access.
>
>  Further,
> > spin_lock_init(&dev->lock) (line 319 of tw686x-core.c) isn't
> > correspondingly closed in the function. Is this intended?
>
> Huh? spin_lock_init doesn't take a lock. It just initializes internal
> data.
>
> >
> > Second, there is a possibility according to how I have traced a call
> > chain that tw686x_init is going to the error: label since
>
> tw686x_init? I assume you mean tw686x_video_init?
>
> > tw686x_memcpy_dma_free is getting called inside another possible callin=
g
> > chain, going tw686x_init -> tw686x_video_free (error: label) ->
> > dma_ops->free (i.e. tw686x_memcpy_dma_free). I would assume this would
> > not be intended either.
>
> What tw686x_video_free() does really should be done in the release functi=
on
> of the video_device: vdev->release is currently set to video_device_relea=
se,
> but that should be a custom function that calls dev->dma_ops->free.
>

IIUC, v4l2_device_release is called when the last reference to the device
goes away. That, in turn, will call v4l2_dev->release(), which
is set to tw686x_dev_release.

Therefore, tw686x_dev_release is called when the last open handle
was closed, and it's where we free the last resources.

If there's any race with the consistent memory allocation/free,
it seems tw686x_dev_release would be an appropriate place
to free them.

Thanks,
Ezequiel
