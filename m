Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788A91F0F9F
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 22:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgFGU3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 16:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgFGU3n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 16:29:43 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0858EC08C5C4
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 13:29:42 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id n11so15384235qkn.8
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 13:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Lz6rtZK9cjNPAtEwtLuwX/TSYzMGfXgJilYQqWDsi+k=;
        b=qoEfppc4l1T7Tnteea4ezpFwHMv4wHuEtUnWK1i2WOujZ0/uUUZEV5JDjWhOQm0HM5
         lmadO2e2RzPCpHob2PJQCUv8pduTvChQW5AB7tJolmxF+HYaMF+dYSYpllfmikA7wfWx
         fO/vgHjOzLtTDAIj+9bg7i5F7L5/5012scP4UNidpfkLffOv9AlAuiMjUjHrD34hjeCj
         0N59QLDrFIzqpCN8KC4XDuD6Vsby4PBF3VyR7YVUnc+hv3i0x2J8nvxGZGjxFSH7r+fu
         ODBQnt0VqGo9ici5Mry9hDofKgpGRmJiWdat8GvmeLh0/1VHA81xYDIbIqtJlzcsXRzE
         MAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Lz6rtZK9cjNPAtEwtLuwX/TSYzMGfXgJilYQqWDsi+k=;
        b=OR92gBV6JI17hXOi4fMbhLHzjJuduArcTFP4MY6NeLkuGpVi7M7JtvcayyiSwerknJ
         vHgyGgctqpdRkzb/7AYC3rwgBl3KzR0czionc5nsoKmbE6OHXwtDPJFBvdgnvcgMQeAn
         ZM3Sm8N9Ofhnp2+ExanxqjN3Pb65+Ii9Ze8C2uahj6+mU7jSc7KC2fNrYu8edMjoCmga
         4+/PzfsgqR3g0EX5YSgTNFCTzLXOWxjuxAtL5DUbF+Xy/TGCiH3U5yPQhWa63aDvsJsa
         aWAz4LcCfVd+S8GVc/3wTDiTPCBqZNCo8XlE4/fouhHFDK69Hn8XmFEH+9rt1Fo4NCfR
         5trg==
X-Gm-Message-State: AOAM533SFRfWdK90sCjLF2Jsj59lODeE2Humn2dbfY7FXwH7C20Kem9p
        w7mWxoIHPb6tZesdgs2+RQE0TA==
X-Google-Smtp-Source: ABdhPJxBY2kuRju1y7Y4Wso16zjhQCkYP7wBN9y8dzrRiSnIbCCe0LSgRuYomUlAn2H++WcfunFvTA==
X-Received: by 2002:a37:a504:: with SMTP id o4mr19036370qke.245.1591561782070;
        Sun, 07 Jun 2020 13:29:42 -0700 (PDT)
Received: from skullcanyon (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id z4sm5237262qkj.131.2020.06.07.13.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 13:29:41 -0700 (PDT)
Message-ID: <3b1150a327aa1e6810b153a4ba1fe32cf6c98f45.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: uapi: cedrus: Fix decoding interlaced H264
 content
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Date:   Sun, 07 Jun 2020 16:29:40 -0400
In-Reply-To: <572f23d1945a685bf899e96de147454f31674ae1.camel@ndufresne.ca>
References: <20200604185745.23568-1-jernej.skrabec@siol.net>
         <CAAEAJfDFMzMkDkN7zzNvkwsmYzgQPNGkP=dhW7neycYYRBJzHA@mail.gmail.com>
         <572f23d1945a685bf899e96de147454f31674ae1.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le dimanche 07 juin 2020 à 16:21 -0400, Nicolas Dufresne a écrit :
> Le samedi 06 juin 2020 à 09:46 -0300, Ezequiel Garcia a écrit :
> > Hi Jernej,
> > 
> > On Thu, 4 Jun 2020 at 15:55, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> > > Currently H264 interlaced content it's not properly decoded on Cedrus.
> > > There are two reasons for this:
> > > 1. slice parameters control doesn't provide enough information
> > > 2. bug in frame list construction in Cedrus driver
> > > 
> > > As described in commit message in patch 1, references stored in
> > > reference lists should tell if reference targets top or bottom field.
> > > However, this information is currently not provided. Patch 1 adds
> > > it in form of flags which are set for each reference. Patch 2 then
> > > uses those flags in Cedrus driver.
> > > 
> > > Frame list construction is fixed in patch 3.
> > > 
> > > This solution was extensively tested using Kodi on LibreELEC with A64,
> > > H3, H5 and H6 SoCs in slightly different form (flags were transmitted
> > > in MSB bits in index).
> > > 
> > 
> > So, if I understand correctly the field needs to be passed per-reference,
> > and the current per-DPB entry is not good?
> 
> For interlaced content we reference fields separately. That's the
> reason there is 32 entries in l0/l1. Though, as we decode both fields
> in the same buffer (interleaved), the DPB indice is not sufficient to
> inform the decoder what we are referencing. Understand that a top field
> can be used to decode the next bottom field. This even make sense as
> they are closer on the capture timeline. This covers slice based
> decoders.
> 
> The flags to indicate presence of top/bottom fields in DPB array seems
> only useful to frame base decoders. This is so that decoder can avoid
> using lost fields when constructing it's own l0/l1 internally.
> 
> > If you could point at the userspace code for this, it would be interesting
> > to take a look.
> > 
> > > Note: I'm not 100% sure if flags for both, top and bottom fields are
> > > needed. Any input here would be welcome.
> > > 
> > 
> > Given enum v4l2_field is already part of the uAPI, perhaps it makes
> > sense to just reuse that for the field type? Maybe it's an overkill,
> > but it would make sense to reuse the concepts and types that
> > already exist.
> > 
> > We can still add a reserved field to make this new reference type
> > extensive.
> 
> I think it's fine to create new flag for this, as your solution would
> require extending a reference to 24bit (this patch extend to 16bits).
> Though indeed, we could combine frame and TOP and reserve more bits for
> future use.

Sorry for the oversight, the flags is 16bits, so we already use 24bits.
But looking at "enum v4l2_field", which is not a flag, seems like a
miss-fit. It would create such a confusion, as V4L2_FIELD_SEQ_TB/BT can
still be used with this interface, even though we still need to say if
we reference TOP or BOTTOM. Only V4L2_FIELD_ALTERNATE is not supported.
But as you can see, "enum v4l2_fiel" is really meant to describe the
layout of the interleaved frame rather then signalling a field
directly.

> 
> > Thanks,
> > Ezequiel
> > 
> > 
> > > Please take a look.
> > > 
> > > Best regards,
> > > Jernej
> > > 
> > > Jernej Skrabec (3):
> > >   media: uapi: h264: update reference lists
> > >   media: cedrus: h264: Properly configure reference field
> > >   media: cedrus: h264: Fix frame list construction
> > > 
> > >  .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
> > >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 27 +++++++------
> > >  include/media/h264-ctrls.h                    | 12 +++++-
> > >  3 files changed, 62 insertions(+), 17 deletions(-)
> > > 
> > > --
> > > 2.27.0
> > > 
> > > 
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

