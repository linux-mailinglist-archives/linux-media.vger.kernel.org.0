Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D719F418F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 08:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfKHH6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 02:58:24 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35580 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfKHH6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 02:58:24 -0500
Received: by mail-ed1-f65.google.com with SMTP id r16so4307231edq.2
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 23:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D3jXzYvdGjlqFUY6YJjZ4aKEsF7aAuVAbaE32Cxqa+M=;
        b=hSS3xbO3uCqmoUlD++lWqkOxtrbIk6+T6PcZUQ6sfjXfbjRogpywAJcLvdKX5azLla
         Frp1LnFQFjA2yJWzJas6OYm+tA3WLkIwbnn7E7k9R2r5K0HlCreg4GvQGHB5Kq+T1pFq
         t8fJOkshZgn17qseuV1q7R+8+xs8/SuVlPzOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D3jXzYvdGjlqFUY6YJjZ4aKEsF7aAuVAbaE32Cxqa+M=;
        b=btSNT0WICZqWVncOEjIYksLpipUY/ObCeuCUbgHJK/5ctgn+x1dWyL3OAuYk56hMYD
         ydfwUumPwjUJkTrCmWwgSeEfqCiVkU3bAn7NcxkO7F7iIL0IIzpjWOTVelCTVTbPNKxJ
         S7Be+oqffuZELWK7Ehm5yQUWoC/ImOLl7eG3SydkN60U9hgKmq/ZEhOO3ySxVbO3ej79
         n3htB6KMWs7eqG9xMZRC+ho2O6CrC4eMWGbLuXpe+IHKpL8O4O3x1hgGckx1iuCIOwxT
         Ro1C8N/W32ddWI4YjJYRLMxbyPJDfC56Q5j8LV9uOPtCMRmluz+kqpCLE7CyHFWt7flE
         hyNA==
X-Gm-Message-State: APjAAAXZ7yA1Z75fv+Wkf9fKy+p+x3ONMQS0T1iO9/ETc3OzVoRYTHm3
        Us/7P5TDdIyCbt3v03t6u7T2ITgxRjMY1Q==
X-Google-Smtp-Source: APXvYqyTMvEMR8V5q/tZvf66kiKdQqRg1ody3bbPS692YKIIJs75E3lZgsp/seEqPngx37qY2wZGWA==
X-Received: by 2002:a17:906:2cd4:: with SMTP id r20mr7161450ejr.307.1573199900420;
        Thu, 07 Nov 2019 23:58:20 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id h50sm108539eda.51.2019.11.07.23.58.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 23:58:19 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id p4so5879713wrm.8
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 23:58:19 -0800 (PST)
X-Received: by 2002:a5d:414a:: with SMTP id c10mr7470082wrq.100.1573199898916;
 Thu, 07 Nov 2019 23:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org> <1573181413.STYvEGL1rf@os-lin-dmo>
 <20191108074955.t7mtqks4dfmrdzod@sirius.home.kraxel.org>
In-Reply-To: <20191108074955.t7mtqks4dfmrdzod@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 8 Nov 2019 16:58:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DEdLM=BmfQqsDryGgzu73A=u7KWA3RAT0no4kvjkg+oA@mail.gmail.com>
Message-ID: <CAAFQd5DEdLM=BmfQqsDryGgzu73A=u7KWA3RAT0no4kvjkg+oA@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 8, 2019 at 4:50 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Nov 07, 2019 at 02:09:34PM +0100, Dmitry Sepp wrote:
> > Hello Gerd,
> >
> > Thank you for your feedback.
> >
> > There is no relationship between those. As I mentioned earlier. we have also
> > been working on a virtio video device at the same time. And there is no
> > relationship between the two specs.
>
> Keiichi, have you looked at the spec?
>
> I think it is useful to have a single device specification for all video
> functions given that there is a bunch of common stuff.  Both encoder and
> decoder must negotiate video frame and video stream parameters for
> example.  Also the virtio-video spec looks like a superset of
> virtio-vdec.
>
> Is there any important feature in video-vdec which is missing in
> virtio-video?
>

I just replied to Dmitry's email with further clarification on some
vdec aspects and rationale behind some of the design decisions. Please
take a look.

I think it should be possible to build one protocol for both decoding
and encoding. Actually virtio-vdec shouldn't need too much
modification to handle encoding. The ability to set operating mode
(decoder vs encoder) and set frame buffer format should be enough.

However I believe that making it as generic as virtio-video adds too
much complexity, increasing the possible attack surface and making it
difficult to validate.

Best regards,
Tomasz
