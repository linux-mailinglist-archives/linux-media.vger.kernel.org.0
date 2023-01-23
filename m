Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC11A6787B5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 21:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjAWU0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 15:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbjAWU0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 15:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7024834C1E
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 12:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674505556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wI+uwRrseHkDD2f7fdidODPj/+sMoA2eg3871tB7+XY=;
        b=ZAATYqUe3KEohzlh6msigthOocgaHHzRG+3JU7zXhYjV+9lVc8HtqkC93uWtHeDcz6L5Ld
        iPRvPdBh56Fo+zu9I9VfKWDfxRzEKmEAa5KcmHCAOXLHpanwEAkb47qfxmNYqZifx0BtAB
        zy+cR+lAy6RVCiqwT8uGkrTs2gA8JPw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-8STTk9K0OTKvGyXEcDGB5Q-1; Mon, 23 Jan 2023 15:25:55 -0500
X-MC-Unique: 8STTk9K0OTKvGyXEcDGB5Q-1
Received: by mail-lf1-f71.google.com with SMTP id l15-20020a056512110f00b004b6fe4513b7so5514624lfg.23
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 12:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wI+uwRrseHkDD2f7fdidODPj/+sMoA2eg3871tB7+XY=;
        b=djMxA/NH9fqoIy8M6i26FZRzNx8Ti2t6PS9Fk8hGZ/7ehYOH8TB0mJ6GoD/fKQa8La
         7HburC4y1QxmUcGrVSjXGmZeSjieX+GEmdkXFoMje+Nfb6WAGL/XK/tOvZBL4VK2JrRp
         Of4rgG23vWltMZqDxfiRwpdlgB53gVMRh6rok9oj09JW9hRAkL5k3Q5b3vUMVe3XGiyI
         0kvxj7+VwQnUrPzB8e81rQSKKMuGxGRebPtsN0rEszNbJQbds+hE4KrsVf8DjssT9ro/
         vhFwJx42XiKwEdUds4/NAqimM5gDrr1sxO9BHvnTXYu0ukhm5ec1IyiAQ3SeZqfqhtCt
         KfPw==
X-Gm-Message-State: AFqh2krPUDiN4L8uxeUKevYIngjZDR8z/x/fvq98bYpF8itrjjFk++ha
        VBwlh4WnerWG3Vk3LGbcTKqSQRbDe+/bFK7e1TirK0M0L+aa6y+CgKp8jiUd5B4YhHZkChim1FK
        8gH2VyHHTbNFOY1N2+L1eAlQIlDDkQCeub/HISIw=
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id j4-20020a056512398400b004cafaca5b59mr2145941lfu.615.1674505553734;
        Mon, 23 Jan 2023 12:25:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0sGio3mJgM/GrhOs7qNkqL6NME3XT0conpfnpdJIhsniT/NQ5+lS64DwEnKBw4hn9ZTBwS451C36ca3tv9Jg=
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id
 j4-20020a056512398400b004cafaca5b59mr2145938lfu.615.1674505553487; Mon, 23
 Jan 2023 12:25:53 -0800 (PST)
MIME-Version: 1.0
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
 <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
In-Reply-To: <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Mon, 23 Jan 2023 21:25:42 +0100
Message-ID: <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
Subject: Re: [ANNOUNCE] pixfmtdb
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Simon Ser <contact@emersion.fr>, linux-media@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        wayland-devel <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Why is the TF defined for GL formats and both the primaries and TF for
Vulkan formats? The only exception here should be sRGB formats. Where
did you get the information from?

On Mon, Jan 23, 2023 at 4:51 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> CC'ing the linux-media mailing list.
>
> On Mon, Jan 23, 2023 at 02:10:58PM +0000, Simon Ser wrote:
> > Hi all,
> >
> > In the last few days I've been working on a small new project, pixfmtdb [1].
> > It's a Web database of pixel format guides, it can be useful to understand
> > how pixels are laid out in memory for a given format and which formats from
> > various APIs are compatible with each other.
> >
> > pixfmtdb relies on the Khronos Data Format Specification [2] to describe
> > each format. This means that each format is described with a standardized
> > data blob, which can be re-used with other tools for other purposes.
> >
> > My future plans include adding more formats and format families to pixfmtdb,
> > and make it easy to use the data for code generation, in particular for
> > automatically generating tables containing metadata about formats, as used
> > in Wayland compositors and other projects.
> >
> > I hope some of you can find this work useful,
> >
> > Simon
> >
> > [1]: https://pixfmtdb.emersion.fr
> > [2]: https://www.khronos.org/dataformat
>
> --
> Regards,
>
> Laurent Pinchart
>

