Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69E86344DB
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 20:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbiKVTul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 14:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiKVTuk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 14:50:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28665C77C
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:50:35 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id b8so11301670edf.11
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IK8SDZ/jZDyLJEsuxR9xFz2htJfz3q3gT5kjSS+oWR4=;
        b=Ikboz0C29tilFV0hIGZnqAFHVvjMHxJd7InyRfuuUNzPVIQJVPxl+VrH7NhH/ytm4G
         RWtJ1mNRaTbK+4nxOJGwbeGTQd2rBQaylYCLcPR4p+roHyKFHeGySiCf7z6+9reUN/KE
         Z35zUt6yUcHWUuMbzpCmLZk16iNI+2Px8gy2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK8SDZ/jZDyLJEsuxR9xFz2htJfz3q3gT5kjSS+oWR4=;
        b=R2eE6rfHa0GeRZPITk/LwcfcfVAOltF72WuG2TRqRFK4we053hiI4fHXkk0gO0qKN/
         NgmvvO7HmfrfEHk8h3Wh4I+8/qsNKasZUgC/Be3eB4yVBNvluKaRj4kT3A0sgQpIDP9q
         X13nLHR6VOgxgG5g2TQuWveLClNG42otWD7oMBxQR6UhT1WGo5wnnn3OSex6d+yAESwj
         baRNFEH8ZnnW5JGYSZ25zwsOONfdY0kx3aU61xz/rVdRgW8Vsy168W6QKx0mb3eKyBn1
         4mRpFQQ/ZMSLU6BExue4MjpC5vrQ64WRgOWaDtFVqDo5/Ug3m8I1rJ3h/5ksYaTM9Ira
         /Icg==
X-Gm-Message-State: ANoB5pnNHgAURW4qApc8dAhPZ5U1Xj3L9H1QjVL/jNPbx7hY91/759zA
        YE+YUU2TZ3POcg46YsCyAOdV1yglKoMNg0UTcR3iFQ==
X-Google-Smtp-Source: AA0mqf7XUsswVblhhNThn/Wsg7nr0LQvlQk2QY03yhXme2ouSPPWSkV9vt2apDAQVVRdw98Fl27y+13qz8Y7qsxsG1Q=
X-Received: by 2002:a05:6402:28a9:b0:461:f5ce:a478 with SMTP id
 eg41-20020a05640228a900b00461f5cea478mr22342384edb.304.1669146634381; Tue, 22
 Nov 2022 11:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca> <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca> <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
In-Reply-To: <Y30kK6dsssSLJVgp@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 22 Nov 2022 20:50:23 +0100
Message-ID: <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
> > You nuke all the ptes. Drivers that move have slightly more than a
> > bare struct file, they also have a struct address_space so that
> > invalidate_mapping_range() works.
>
> Okay, this is one of the ways that this can be made to work correctly,
> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
> was the DAX mistake)

Hence this patch, to enforce that no dma-buf exporter gets this wrong.
Which some did, and then blamed bug reporters for the resulting splats
:-) One of the things we've reverted was the ttm huge pte support,
since that doesn't have the pmd_special flag (yet) and so would let
gup_fast through.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
