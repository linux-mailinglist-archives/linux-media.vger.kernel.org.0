Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876561C5812
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgEEOFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729351AbgEEOFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:05:37 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B28EC061A10
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 07:05:36 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s3so1753955eji.6
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DQhPVNzCwxODV9jjVycfNahbwJl6DrUIjQ9AnoCrWCs=;
        b=YU+6u86++6VWtYwNPHyc1ME4CNkzeonYAyS/jdldZueht1JjMExBXKZ2fwCZZnMaZI
         ZhkNfG4Iq7Wa8TgqlSCI9rUl8C2Q7X0XofiEN2if0Co5+gwFJU/5PxOH4YrwKBPJ5sGz
         zyiacbV9r11JC/U44S4xnE/s0Ymar0Oax5aJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DQhPVNzCwxODV9jjVycfNahbwJl6DrUIjQ9AnoCrWCs=;
        b=G/xujff6vnuIbQcyiEXA1VtT++D4CS4pfq159HkhMLEK5xPs4AzL+QTKw0U7GzeICf
         sgY6KoT1Ceq6p3TPNb9tB32WYIPa7kMa5H057dOPqnLspu4OoJvZUloN6JDijO9qbI1e
         xxKaX9wPDP36TAhTh3onCT85pb4DkWyVh+OEKx0jx34YQWrOeW8GLF+8uG7bxmp9M6AB
         tQpVI6ze4zMeZTcOTmtz+WooICLIRWP3f8ZSgRzPBY7uoOHHDDogdqDAFAnW34tShh5l
         R/JVGBLVRrsthIt4/eFNOVBXPK3BDDdXxBXQIY439y7oDyMSXlWzZbCdJj49/gbJJD9M
         0UmQ==
X-Gm-Message-State: AGi0PubMh1aR1jSYzBw99+7/EMoDmWFY2NGnqm3zg2tdVDVkfCa14kib
        Qvnvw1JrWew0IEsoe4a1VieA4qW+ghbmPg==
X-Google-Smtp-Source: APiQypLfJBq7mSP5n+MqYsZIPwYZjU067xwYGmZbWGD3IjNxwbozEcq4AM/fG4nD6hXeVr3GMsS16Q==
X-Received: by 2002:a17:907:7210:: with SMTP id dr16mr2695038ejc.197.1588687534605;
        Tue, 05 May 2020 07:05:34 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id c8sm322020ejs.86.2020.05.05.07.05.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 07:05:33 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id s8so2878918wrt.9
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 07:05:33 -0700 (PDT)
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr3926804wrs.415.1588687532834;
 Tue, 05 May 2020 07:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200505134110.3435-1-ezequiel@collabora.com> <20200505134110.3435-2-ezequiel@collabora.com>
 <CAAFQd5AWZFoPk2YTp2k8M7LvJshxw46-z+wK2VoM9EzB2CqiFA@mail.gmail.com> <c29fcc922a4917ac695043e605973ba9649f9c9b.camel@collabora.com>
In-Reply-To: <c29fcc922a4917ac695043e605973ba9649f9c9b.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 5 May 2020 16:05:19 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A458E8iqwakKTDEyTHC+NYY-M1SaTS3m0MARwPaRyOuw@mail.gmail.com>
Message-ID: <CAAFQd5A458E8iqwakKTDEyTHC+NYY-M1SaTS3m0MARwPaRyOuw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: rkvdec: Fix .buf_prepare
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 5, 2020 at 3:59 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Tue, 2020-05-05 at 15:56 +0200, Tomasz Figa wrote:
> > Hi Ezequiel,
> >
> > On Tue, May 5, 2020 at 3:41 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > The driver should only set the payload on .buf_prepare
> > > if the buffer is CAPTURE type, or if an OUTPUT buffer
> > > has a zeroed payload.
> >
> > Thanks for the patch. Just one question below.
> >
> > Where does the requirement to set OUTPUT buffer bytesused to sizeimage
> > if the original bytesused is 0 come from?
> >
>
> If I'm reading english correctly, it's here:
>
> https://www.kernel.org/doc/html/latest/media/uapi/v4l/buffer.html
>
> """
> The number of bytes occupied by the data in the buffer. It depends on the negotiated data format and may change with each buffer for compressed
> variable size data like JPEG images. Drivers must set this field when type refers to a capture stream, applications when it refers to an output
> stream. If the application sets this to 0 for an output stream, then bytesused will be set to the size of the buffer (see the length field of this
> struct) by the driver. For multiplanar formats this field is ignored and the planes pointer is used instead.
> """

Okay, thanks. I wonder if this shouldn't be handled by the core,
though. Especially given that the document refers to the length field
specifically and not the sizeimage set in the format.

Best regards,
Tomasz
