Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF4F1C178F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 16:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgEAOTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 10:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728839AbgEAOTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 10:19:06 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3E0C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 07:19:05 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id k12so8010428qtm.4
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Yn+1TKfovnXiOgNNAcPh0kJa+4Pic1O3dxoARC/a4ak=;
        b=gA6kaDIBBYRHQApxBxWonJfxU8/7/uKycVgk394cd0i7LPmYXkiBxvkEI0XbHaY0/z
         6zbnOUtuMfkdmI45bsVkpOnwTkFCra9qdQmWffg5lPa4ZDGKO3wgadfQK/3teokD7vNl
         jOiuj51gWN+gF2+5jthzaFebqy5QTFV40MR1UmVUcXHRcWrsnJsO5fIstlWv42wfKtZm
         ze9ebWLlSPsfmTj2hga6o9TUKSsXicleyFwgZFWdoN2pkh1rmAnJPC/043m+jxQ+N1IN
         UMupTkEcjkI9s2UKTmBtKSA91A5dRgYXPPvZC4+MT9+xned1qaQ7vx2TLyMRSdXJzhWL
         OZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Yn+1TKfovnXiOgNNAcPh0kJa+4Pic1O3dxoARC/a4ak=;
        b=qzsBlZdDrTioW4jarHBUTlg20A/B/BKVq8ZIKWOfxXgyrHGTey8pmNFQeebioQQtrN
         ACCbHRcCXtNVIgLsW12L0WCpizv3j3eTRkgp/3c/TCDMOdZ2kI9mK+LzXCEJ7c4x9fa8
         jd/x3UCMxr7GZXftCLvsVivm/GVIO5CxMS07U/7DIQ3TY/PVfdRQjlW8cRhbq0S9Guy0
         eLcCk1W2eMDYo3oDUvh0aEJj/SpGDI31KMQZKEOfq19RUzMrLN1woXWtCNyMlORiv3X5
         Hw666hOHiqWkl46WG9S6mt8254H5BgQ1Bs1XPOc7zz/Hhu5Al/rSak3anPi+Kuv0GIuO
         rQrw==
X-Gm-Message-State: AGi0PuZ8aISzQ8YN6eu3aKfyqvAKWHOUmOuB683vxcnT+QHARYYkFJMD
        loeWzFuY0yx3qj7/vAfIuoSiKA==
X-Google-Smtp-Source: APiQypJ0WG72ONSD4nEjVRs3zk4pZlewSgj6kecaTJJhIT0T8oFw+vCtfii6Bobnmuc09F+6Gy4Aaw==
X-Received: by 2002:aed:37ca:: with SMTP id j68mr4077099qtb.276.1588342744170;
        Fri, 01 May 2020 07:19:04 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id i5sm2654891qki.42.2020.05.01.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 07:19:03 -0700 (PDT)
Message-ID: <d97b3c8e8a838d60d2d0d6058b77e624c0ee2fe1.camel@ndufresne.ca>
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Date:   Fri, 01 May 2020 10:19:02 -0400
In-Reply-To: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 30 avril 2020 à 14:38 +0300, Stanimir Varbanov a écrit :
> Here we add two more reasons for dynamic-resolution-change state
> (I think the name is misleading espesially "resolution" word, maybe
> dynamic-bitstream-change is better to describe).
> 
> The first one which could change in the middle of the stream is the
> bit-depth. For worst example the stream is 8bit at the begging but
> later in the bitstream it changes to 10bit. That change should be
> propagated to the client so that it can take appropriate  action. In
> this case most probably it has to stop the streaming on the capture
> queue and re-negotiate the pixel format and start the streaming
> again.
> 
> The second new reason is colorspace change. I'm not sure what action
> client should take but at least it should be notified for such change.
> One possible action is to notify the display entity that the colorspace
> and its parameters (y'cbcr encoding and so on) has been changed.

Just to help with the use case, colorspace changes need to be
communicated to the following HW or software in your media pipeline.
Let's consider a V4L2 only use case:

  m2m decoder -> m2m color transform - >...

The userspace needs to be aware on time, so that it can reconfigure the
color transformation parameters. The V4L2 event is a miss-fit though,
as it does not tell exactly which buffer will start having this new
colorspace. So in theory, one would have to:

  - drain
  - send the new csc parameters
  - resume

I'm not sure if our drivers implement resuming after CMD_STOP, do you
have information about that ? We could also go through streamoff/on
cycle in the mean time. Most codec won't allow changing these
parameters on delta frames, as it would force the decoder doing CSC
conversion of the reference frames in decode process, that seems
unrealistically complex requirement.

That being said, please keep in mind that in VP9, reference frames do
not have to be of the same sizes. You can change the resolution at any
point in time. No one managed to decode the related test vectors [0]
with our current event base resolution change notification.

[0] FRM_RESIZE https://www.webmproject.org/vp9/levels/

> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index 606b54947e10..bf10eda6125c 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -906,7 +906,11 @@ reflected by corresponding queries):
>  
>  * visible resolution (selection rectangles),
>  
> -* the minimum number of buffers needed for decoding.
> +* the minimum number of buffers needed for decoding,
> +
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace (and its properties) has been changed.
>  
>  Whenever that happens, the decoder must proceed as follows:
>  

