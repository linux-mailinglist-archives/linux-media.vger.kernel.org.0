Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A287D764D7B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 10:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbjG0IfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 04:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbjG0Idu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 04:33:50 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB35F2D4E
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:18:12 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-635f293884cso4893506d6.3
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690445876; x=1691050676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pBNJ9Jjy5nne/mBaf+XQM6YNk3Kfb6d2ItNYN5IxBY=;
        b=XStq0dP/lunnm7P2pL+7qLkD89FL8gf/DMu5sQD7qsV92U2kReLMnQ2A4+jr//sxKQ
         D3uPQ64lCn+jIpk/TY1XHAsQ3QS2fyknnWTc8cE7OBO7YKAjG4RwP3opf0oggbmtpuuO
         H49mzeIWwogGduZXepIexRcKuth4A6/ZNm0p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445876; x=1691050676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pBNJ9Jjy5nne/mBaf+XQM6YNk3Kfb6d2ItNYN5IxBY=;
        b=Z9C0d/IFPDcdGUtozjwAzcyt+5AwFXulZNSvHQdhUTr3Z0RVldREptfoSYF1+ADclI
         JyoV6NVURrICqYng9lCv3T1gxSs1uxzpn6p1bKsDs3fQaRW2AtBet4MhiLbaaSVxPSe1
         ACq7jCcHzvDHFqpgr/Rzmtai1cgAoR+BA5DuavBNpQUKldFID9qxYvYmCAtSoFC4R8Da
         9IZ8YrkKyv4cvddfyNYMADgB+3vsw+8Ru9FKxaA7crtbWRK7nboQFxKbEJNR/8EUkDpU
         TQtE/BCGztv+dhG7yedavFuA+bmxbgTYMtvRKmjBb1xrRQb3xzHuPAKGKgcOP7R2Kg5D
         4umA==
X-Gm-Message-State: ABy/qLZQJIb3bjM5gbSOUHYa9/Z4pv92q6lJegoJqBb/hoNAtcEQiqmY
        NASXpUS/B2nVIbrPrai/OjYHyvpcdNdejcOnoMVb+Q==
X-Google-Smtp-Source: APBJJlF6NdLdGXb0XcZOf50Y8HesR/nGFFn29oAESi9Qu9PSeyz+9wMNQ2o5P/g9e/RoFccyihRP9w==
X-Received: by 2002:a05:6214:2586:b0:63d:3a7:3aa6 with SMTP id fq6-20020a056214258600b0063d03a73aa6mr5655166qvb.44.1690445875816;
        Thu, 27 Jul 2023 01:17:55 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id j13-20020a0cf50d000000b0063cdbe73a05sm258781qvm.97.2023.07.27.01.17.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:17:55 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76595a7b111so58992385a.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:5318:b0:767:dee0:455d with SMTP id
 oo24-20020a05620a531800b00767dee0455dmr4057489qkn.20.1690445874607; Thu, 27
 Jul 2023 01:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
In-Reply-To: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 27 Jul 2023 17:17:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
Message-ID: <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
Subject: Re: [RFC]: m2m dec reports the graphics memory requirement
To:     Hsia-Jun Li <Randy.Li@synaptics.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 7:47=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.com=
> wrote:
>
> Hello All
>
> This RFC tries to address the following problems:
>
> 1. Application may request too many buffers, increasing pressure to
> system's memory allocator(Thinking about running Android with 8K UHD
> playback in a system with only 2 GiB memory available);
>

Yeah, I think that's something that has to be addressed. It was also
mentioned recently in the review of the DELETE_BUF series. I think we
need some kind of accounting of the allocations to the processes, so
that the per-process limits of memory usage could apply. Let me add
+Sergey Senozhatsky who often crosses his path with kernel memory
management.

> 2. Application may allocate too few buffers while the codec stream
> didn't follow the statement in its sequence info;

Isn't that just an error? I think generally a stateful decoder
shouldn't allow allocating less buffers than required by the stream
(and as reported by V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).

>
> 3. Application would allocate all the graphics buffers in a large size
> meeting the decoding requirement, while only few alternative ref(never
> display) frame requests that;

Could you explain when that could happen in practice?

>
> 4. ioctl() G_FMT may need to reflex a format which far from the current
> sequence, or we can't know the resolution change result at an early stage=
;

Could you elaborate on this problem?

As per the stateful decoder specification "Any client query issued
after the decoder queues the event will return values applying to the
stream after the resolution change, including queue formats, selection
rectangles and controls.", which means that as soon as the decoder
gets a frame that has different buffer requirements, it will update
the format and notify the user space.

>
>
> A few solutions here:
>
> 1. Extend the struct v4l2_event_src_change in struct v4l2_event with the
> graphics pixel format(break uAPI)
>

We can't break uAPI, but I guess we could add a new event that
replaces the old one, In addition to a pixel format (and I guess the
number of buffers needed?), we would also need the buffer index or
some kind of timestamp to make it possible for the user space to
correlate the event with the action that triggered it.

But I fear that we would need to keep extending and extending the
struct with more data every once and a while.

> 2. Getting controls after the SRC_CHG event, struct v4l2_event need to
> tell how many controls it needs to fetch.
>

What do you mean by "how many controls"?

> 3. struct v4l2_ext_buffer for such out-of-band data.
>

It's similar to the event, this could end up with an ever growing struct.

If we need to understand the state of the codec for a specific frame,
I think it's exactly what the request API was designed for. It
captures the control state for each request, so we can read the
format, number of buffers needed and whatever we want for the result
of any given decoding request.

>
> Sorry for making it html before
>
> --
> Hsia-Jun(Randy) Li
>
