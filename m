Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B58F78D298
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 05:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241829AbjH3Dsf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 23:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241828AbjH3DsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 23:48:21 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AE51B7
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 20:48:17 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76ef653af2eso299981385a.0
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 20:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693367296; x=1693972096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e5h4zGrTEJTR79h27ndC59DREjDD3wdrcEpAoNPexk=;
        b=VnjteoODFfu+8NWAK0qu08ydE5EftOBl+dlijaiIt/7JzPsh7YFdbo/Hj6fm/yX6vt
         0tA4wmR3k/dA/ric3p8Tyn4cIvE938uAJTHPN288mZhqLyGi7HZRYmQoD4ZsZK5H1fp2
         2C3TFbFSR5f0jkQQlWUCAlkTDIJFG7mLnYzSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693367296; x=1693972096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3e5h4zGrTEJTR79h27ndC59DREjDD3wdrcEpAoNPexk=;
        b=LQTkMslnZ0IAZlOIW1XEfQneGVPDxoB4wcU1v/eJJ+pSFDgoPzUxiIS4u8f4ZvoBz7
         ZkMH5XA8+6x6SJQCWT7mRdWIQPs0B6XCGdrinYHZnkYbsEE3r61BJBT10lfLDVo/+yfD
         hOGRfdStNYrLfWUtAmPmWBAfhhCbvnzenFFjdwMyG82ekspgcl3uUdbjiHFzfl6DEyo3
         LGXAhKkHtu4HUM4PUqF/A0i3IgNbsnf+9E6HiRuKHLXl4JDXqnECFkYZSbnmovs5jdO/
         OJ/R5g+ibJyIPmbmaSz1aqeFzLrIg5jr8guYU920IiHinIwsF2MzDmRSYCi3K+q0/sXR
         Tatw==
X-Gm-Message-State: AOJu0YzsETXRam6kvF0xpmWWwomPPJBUBGIZ5CbUpuvgc/PycISTzFmr
        8ONXqu/APnQbgnAesFpGvGEUCgeiGXRQ+Mh/0NexCw==
X-Google-Smtp-Source: AGHT+IE6Myp9+1jy3S/wqTu6b2uzwsCgv3aKVuPiCYfOJfJ+Z1advQADbWGs0cMkuuI5iy1FaBCKUA==
X-Received: by 2002:a05:620a:4407:b0:76d:1cd8:1602 with SMTP id v7-20020a05620a440700b0076d1cd81602mr1175830qkp.11.1693367296249;
        Tue, 29 Aug 2023 20:48:16 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id p20-20020a05620a113400b0076cd2591629sm3533579qkk.6.2023.08.29.20.48.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 20:48:16 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-64aaf3c16c2so31964636d6.3
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 20:48:15 -0700 (PDT)
X-Received: by 2002:a05:6214:588e:b0:651:5b77:1ab5 with SMTP id
 md14-20020a056214588e00b006515b771ab5mr1076827qvb.22.1693367295092; Tue, 29
 Aug 2023 20:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com> <CAAFQd5Cn3xQroyYtC+m+pk1jOE5i3H+FGr-y8zqhaf0Yo5p-1Q@mail.gmail.com>
 <deb735ce-7de1-e59a-9de4-1365b374b417@arm.com> <20230829150442.GA3929@lst.de>
In-Reply-To: <20230829150442.GA3929@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 30 Aug 2023 12:47:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CiHXvsJugSi+hXY9ESsmxUzBzmbhF6G48iVsOcL5eMtQ@mail.gmail.com>
Message-ID: <CAAFQd5CiHXvsJugSi+hXY9ESsmxUzBzmbhF6G48iVsOcL5eMtQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: limit the sg segment size
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, Anle Pan <anle.pan@nxp.com>,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hui.fang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 30, 2023 at 12:04=E2=80=AFAM Christoph Hellwig <hch@lst.de> wro=
te:
>
> On Tue, Aug 29, 2023 at 12:14:44PM +0100, Robin Murphy wrote:
> > dma_get_max_seg_size() represents a capability of the device itself, na=
mely
> > the largest contiguous range it can be programmed to access in a single=
 DMA
> > descriptor/register/whatever.
>
> Yes.  In a way it's a bit odd that it ended up in a field in
> struct device, as the feature might actually be different for different
> DMA engines or features in a device.  If I was to redesign it from
> scratch I'd just pass it to dma_map_sg.
>
> >> Generally looking at videobuf2-dma-sg, I feel like we would benefit
> >> from some kind of dma_alloc_table_from_pages() that simply takes the
> >> struct dev pointer and does everything necessary.
> >
> > Possibly; this code already looks lifted from drm_prime_pages_to_sg(), =
and
> > if it's needed here then presumably vb2_dma_sg_get_userptr() also needs=
 it,
> > at the very least.
>
> Yes, there's tons of them.  But I'd feel really bad adding even more
> struct scatterlist based APIs given how bad of a data structure that is.

Do we see anything replacing it widely anywhere on the short-middle
term horizon? I think we could possibly migrate vb2 to use that new
thing internally and just provide some compatibility X to scatterlist
conversion function for the drivers.
