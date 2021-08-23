Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675C63F4ED2
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 18:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhHWQ7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 12:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbhHWQ7E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 12:59:04 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B94C061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 09:58:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id f2so32705805ljn.1
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98PHTWq7ky4uIAhtxpYGbR+A+DrEV4QAqPeio6dZ76c=;
        b=XYZgeUhUnJcXD4fVkA+dF4XVXeqfUj+huK6g+OxtSkKhEM5JL/fWZ3SpGPJMJ7MbM/
         VZQsdqy/SaE+gChury1wlKIgbV40Thmnbjc4otuiITwu3beKN6i/Lu7sNBI5YV5KUuOa
         ZFTHG7omc6VajNPz+K7hNjB8Bgm0WhNsQG0Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98PHTWq7ky4uIAhtxpYGbR+A+DrEV4QAqPeio6dZ76c=;
        b=f7UwMK+cWJzZXb9feyc9/qKFkKjk7dVkFRvZdSNQ6gAXzBnYMFfIwsQfsTPbxj3PiE
         YbZswdOmGvLj8R4wL7FRgYXmnnWpovAQTdtYzrxVjLUeQfhrkimvqNjx2lkIzCcgrriE
         KCXuKu5s9OrCom9+SmcSlZfVFyEYzSWSD/VsAQ22ZqQQouTRlidabfMIbIjnbjCGCi/8
         UBg2y+R6nALKHmJ1dxbgLkmPgjbsMkJt90y0AKBNZQmiHpwFRJenZesRrjhGvsEwb4Mr
         hqlz0QvsiJpr/FoD8xtW4CpQ7pFwjT21zE/HI+hNli+kks5yCeT+Rv1xqhqBG9O0KKkj
         NaZA==
X-Gm-Message-State: AOAM533mIxgIXGnlGPjY+lpG8I54GVQRnN/hCl9UA+ONRY2o4xzUwTPl
        74JN/6YbD1Zd6I0ZDl2EseEfHssllUPzEN7wD6g=
X-Google-Smtp-Source: ABdhPJzHo13BB5xBPFULu+bJPL5T9S/0ZmKvMfcJvRoevPQPlcvWt6Cy5H6EnvtlhXbRZX30nQ3o3Q==
X-Received: by 2002:a2e:b537:: with SMTP id z23mr29020086ljm.109.1629737897806;
        Mon, 23 Aug 2021 09:58:17 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id c18sm1084978lfv.268.2021.08.23.09.58.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:58:17 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id i28so39289378lfl.2
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 09:58:17 -0700 (PDT)
X-Received: by 2002:a19:500e:: with SMTP id e14mr24746968lfb.487.1629737896948;
 Mon, 23 Aug 2021 09:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de> <20210819133128.45ef4353@coco.lan>
 <c56ec571-2278-95e9-2028-990e03159c3f@web.de> <20210822194709.4b9d33d4@coco.lan>
 <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
In-Reply-To: <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Aug 2021 09:58:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
Message-ID: <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Soeren Moch <smoch@web.de>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 23, 2021 at 7:59 AM Soeren Moch <smoch@web.de> wrote:
>
> Linus,
>
> Is what I described directly above the new linux maintenance policy?  Or
> is linux media a private kingdom where the community should keep away?
> Is this a place where the subsystem maintainer is on a mission to
> destroy everything instead of maintaining and improving it? Please tell
> me what I understood wrong here.

So technically, the regression policy for the kernel is purely about
the ABI - the _binary_ interface. That seems to not have broken - old
programs continue to work.

We very much try to discourage user space applications from using the
kernel header files directly - even projects like glibc etc are
supposed to _copy_ them, not include the kernel headers.

Exactly because re-organization and changes to the kernel tree
shouldn't be something that then causes random problems elsewhere that
are so hard to test - and synchronize - from the kernel standpoint (or
from the standpoint of the other end).

That clearly doesn't seem to be the case in this situation. Which is
annoying as heck.

Mauro: there clearly _are_ users of those header files, and even
apparently that one old driver out there. And those headers were in
the 'uapi' directory, so while it is annoying how user space programs
used them this way, I think it's also not entirely unreasonable.

I have reverted the header file move. But I would also heartily
recommend that whatever user program includes those headers (VDR -
anything else?) should take snapshots of these specific kernel
headers.

I'm not convinced that it makes sense to move the av7110 driver back
from staging - it may continue to work, but it _is_ old and there is
no maintenance - and I would certainly suggest that any other
out-of-tree driver that uses these old interfaces that nothing else
implements shouldn't do so, considering that nothing else implements
them.

So the only thing I did was move the header files back, and mark that
move to be backported to 5.13 stable.

           Linus
