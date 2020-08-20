Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C2C24C3CD
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 18:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729681AbgHTQz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 12:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgHTQz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 12:55:56 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E299C061385;
        Thu, 20 Aug 2020 09:55:56 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id q75so2926366iod.1;
        Thu, 20 Aug 2020 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B8Zze2yjx5cxPwAWRxAmp/+kbBC1Q5APJD1pbfmxx08=;
        b=X72+vnTc2+GULDJ/AzZfsyaTadjUPRvNgCK7odMlYPO8WYAPzcfVWJao+YAWTKQUOV
         DC9VNUeLPW0DQR//4AC3on6CQ1PanjJ5XQ/z6T3EV7ycu987NdNAMprY7jBQvkEb0Uwa
         419dz+R3KDPI8huPsUzWf/FzaR+qtPTNo6C0TLSnbTAjLILW3KXYjnAZ/g482BqRJLtq
         3xfAQq0ZaTGEunXf3ocaDnaSHkex/3/q1bEtnPlQ/kXG5oNeC450jkibQuGxghCuxsAq
         0Gt2spgTT7EiYiSsDED5gWKxThJcpeUl9BtPuah+4IQWbNyd8BSeGnUB0ZmsD4kFwj8o
         ihUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B8Zze2yjx5cxPwAWRxAmp/+kbBC1Q5APJD1pbfmxx08=;
        b=PzF9hYub/4Ns5GScVVySQOCmsQadG42/uBBYza1hOwzaiUqmZDw+gtDpVTYPpuyYrW
         gxzr6naVx+yiDWjVqBt15OdUsasU18VA++8oT5aYs3wovZ0HZqLmg6FEOdYhmzVCKeiM
         zr6ZyR9mYsFNoB+r/WKUjoZxDSvWc7AA3hIgr5FHiq4sZIGu4R1cmO8rRV9LnVsAeb47
         aBuLyV0JnQNmVbk6jWjDLYg6qRGu/SEKgX6aQiDE5DmBTUyycYjkak2ev2jjUOo75hqm
         NXUwNqB69rPN7T71/Rs56DWDE0gOf8IEWfl3H4rdqXJT/IshGVhH0MIPJkshE6YyjG8f
         6Czw==
X-Gm-Message-State: AOAM533GZH1hqSEeHYuvMwrt+/ddhEvYr0SSsiN3HB5KhQY/iTMdsQDk
        pu3B8d63zESDG4aubxIjYpXRS2gRhM3RRY0Zrgw=
X-Google-Smtp-Source: ABdhPJz3pRhN5tLgudTw/Pid4LM66ZMYleKi10QLrJ7l/UD1gGVK+ZOFJPbKFmlNXADv1mHxV+RQklNDySTJ0k8DX0c=
X-Received: by 2002:a6b:c88f:: with SMTP id y137mr3349771iof.55.1597942555643;
 Thu, 20 Aug 2020 09:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
 <20200819212523.113973-1-ztong0001@gmail.com> <aed971ed-bd8e-eaed-b2ee-80e9654f24cd@xs4all.nl>
In-Reply-To: <aed971ed-bd8e-eaed-b2ee-80e9654f24cd@xs4all.nl>
From:   Tong Zhang <ztong0001@gmail.com>
Date:   Thu, 20 Aug 2020 12:55:44 -0400
Message-ID: <CAA5qM4Dt0-skt534i58iW-zBxhMxhYPBQemYPU-W-QxmFaPM7Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: pvrusb2: fix parsing error
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     isely@pobox.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 20, 2020 at 7:44 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> > diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > index 1cfb7cf64131..6a444cb27e31 100644
> > --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > @@ -866,8 +866,8 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
> >  {
> >       int ret;
>
> This is no longer used, so can be removed.
>

Thank you Hans.
I removed the unused variable and did a compilation test for the new patch.
Thanks again for being patient guiding me through this. :-)
