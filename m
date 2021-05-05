Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5903747A1
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 20:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbhEESBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 14:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbhEESBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 14:01:20 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6462C06129F
        for <linux-media@vger.kernel.org>; Wed,  5 May 2021 10:36:09 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id x8so2345086qkl.2
        for <linux-media@vger.kernel.org>; Wed, 05 May 2021 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bML/KIw4vkIF6m6AF0QDRSbzcPArKEWcSuhrrYaBtBo=;
        b=R34Ur0CNg21NAR2OMM8TqSpqyikAwMGN+4u43bnC29jGlBGkb+vt6oezgDWw5sLP4/
         fv2vyFxX7LaKKOPufJ8LsB5TjRFp5PLyEgDF3g4PZvHO/SH1CGijp4Erndyn8Powm9Rb
         akPPpupvefTwLByDo6YOrBVj3yiOhLVyY7+L3p3GcKGfr1z9mgZXSHmqVi0aZmIYND7v
         zAAt2DdrNWwVR8OdYKBit9LaGNftIib1OClHEnylLjXjS7TN1euJpt+fqmQFxl6wo901
         sTfq2Bvdm0EalAzwRAVGxBklTmRCPV6h62XAk6gKcLZJRKrIi7qv8R/E0rQcMm8jtBcm
         0Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bML/KIw4vkIF6m6AF0QDRSbzcPArKEWcSuhrrYaBtBo=;
        b=gFInhg0lqJL5LU4GqN1q6/DPBIfLqsnJ530WAIxdUWCzQYM25Ww76NNWsVUlDKSihE
         LgFiZ/fqX91cHtmAWP1kVlXOOmXWWQ+KHiyFVIVLHgDNKV8TIHokxulp+GACb9wD1nvK
         InJ5VKC9rxuuLEauGyQvIZ5J0dGwHI0oqZDs1INlJm0Y8KT9Vw7QdBEdvcOTLh1iXRDj
         b0ovFUSKkpFWFb1vF/bR2ZCo7w4nFxRDlD6ScaDB75Ddd813yqa3qjAqBYgnYWCBnhOB
         cLn9s8R3z80DUTkwSEhJqjPEW2mIrRy2YsVBI61wZzT7ihjDVfUTusK9YBgzRk+SoI2C
         JUSg==
X-Gm-Message-State: AOAM5310kBiAsujTuBY2UDGGVn6/TJo+N9Vc+Va8o2C6HE5WrEZvu0pW
        BN50AJPFDGnk1np2E1AY6fLvOg==
X-Google-Smtp-Source: ABdhPJyIptnjQKHB27Jsmv9m4bDilzW/rWjk1KdkwhlFuX2rQqKITvXb6nrs2FiUWrUkHiUl4wfrlw==
X-Received: by 2002:a05:620a:14a8:: with SMTP id x8mr4216682qkj.86.1620236169018;
        Wed, 05 May 2021 10:36:09 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 44sm5665119qtb.45.2021.05.05.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 10:36:08 -0700 (PDT)
Message-ID: <7fc04abf3959720a9f344bc3a67b4792552811c1.camel@ndufresne.ca>
Subject: Re: [RFC RESEND 2/3] media: uapi: Add VP9 stateless decoder controls
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Date:   Wed, 05 May 2021 13:36:06 -0400
In-Reply-To: <12493c55-e6cf-0491-d310-7561c7f77258@xs4all.nl>
References: <20210421100035.13571-1-andrzej.p@collabora.com>
         <20210421100035.13571-3-andrzej.p@collabora.com>
         <12493c55-e6cf-0491-d310-7561c7f77258@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

just a partial reply, I'll let Andrzej extend.

Le jeudi 29 avril 2021 à 12:20 +0200, Hans Verkuil a écrit :
> > +      - ``frame_width_minus_1``
> > +      - Add 1 to get the frame width expressed in pixels.
> > +    * - __u16
> > +      - ``frame_height_minus_1``
> > +      - Add 1 to get the frame height expressed in pixels.
> 
> These two fields are weird. Isn't this defined by setting the output format?
> And why the 'minus_1'?
> 
> > +    * - __u16
> > +      - ``render_width_minus_1``
> > +      - Add 1 to get the expected render width expressed in pixels. This is
> > +        not used during the decoding process but might be used by HW
> > scalers to
> > +        prepare a frame that's ready for scanout.
> > +    * - __u16
> > +      - render_height_minus_1
> > +      - Add 1 to get the expected render height expressed in pixels. This
> > is
> > +        not used during the decoding process but might be used by HW
> > scalers to
> > +        prepare a frame that's ready for scanout.
> 
> No idea what these fields are about. I suspect this can be defined by setting
> the capture format, but I'm not sure.

We have the same for other codecs. Each codec bitstream include the coded and
the display size in some form. For H264/H265 that was passed as as number of
macroblock and a crop rectangle. For VP9 value - 1 is as defined in the spec. As
0 is not valid, the boolean coder can save some bits when storing the value.
Though, for parameters, we usually start with the way it's encoded first, and
change it only if we think it make sense. We'll take note and consider this
whenever we have a second driver to look at.

Now, why do we include both here. Well in fact, the HW may have some extra
constraints. Which means there will be up to 3 frame sizes that matters. We
can't also determine if the display/render or coded size will be used for minim
CAPTURE format, as this will in fact depends if a post processor will be used or
not. 

So to recap, we limit the CAPTURE format base on this information, and not the
opposite. The width/height on OUTPUT FMT has been define as meaningless in the
spec (to align with stateful I suppose ?). This way, the driver got all the
information aligned with how it works inside the codec, without having to do a
translation dance, and then properly implement CAPTURE TRY_FMT base on that.

To make an analogy with stateful codec, this replaces the queuing of a frame
that contains codec headers. We skip the SRC_CH events, since this is no longer
asynchronous.

Nicolas

