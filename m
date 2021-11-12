Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7572644F020
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 00:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhKMABs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 19:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhKMABs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 19:01:48 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D26C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:58:57 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so16254120otl.3
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zjav1SJJTguZi3CsCesGpvrCrA940XMz33Goz2sSyK8=;
        b=mYLmsoHcyPPoVuKLKATSYJ4bQjZLzXw02I5bpCvAF7TiS5U4HU6OQlDCvlMMwh+LKb
         UaWz+b/GQdQfLg3IWO1iyod4T0Zz/blgqkSL5qCtzwYi1hXDw6SCVs6R+Y6mY0BGvDkU
         Jlk7mdaSJnBLy36RkaaWqbNeeAuZNY6bZITcW1r2Eg0DHHhs54b+XvtDKiDhOCQmcG+C
         LH1XWQAVk89FqTp901ZHCoJV0m+ISoHMYh9uF1Mn7hh5HA2IZhjETvfH448UJsAhsF3v
         8Cy5qk//3C9EuJVEAegP97RwXY3Rtl16T1GojOh2O7Fk6MkqOIA/6JTZwgHsuVTlk0sm
         Uczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zjav1SJJTguZi3CsCesGpvrCrA940XMz33Goz2sSyK8=;
        b=L0XoaL7W+msiHCHn2whjj37Rk1W4qJ4ec6a7W4L3l47tGHD1XhvKcpKVCTv0BkNHoz
         bbU/OBPZGPX5LVZqgWS3i39lskP68Q0VMVX/hysVm8y/Is8z2CtpXBNMTEmR+x7L7e+E
         fVWPapIYiaeUBWjc5yAIl0mva51lKklOMymmaJiB/LqaTsxYRicp/5P55LRkJuRodsoY
         f8uTOyeGDMZY3KoWLBmv3+x4dBsnCwmh/Aq/fK7/1LxE5VRNHe/APXKMihWR89BHdAR8
         i5QasIfiVUBnXJK2nsgIDNQs/laR0MTUVbeziXQAqxGPruQ32HbIaCetXEbkl8kvfCM5
         MVag==
X-Gm-Message-State: AOAM533lQ+QzMZXxurv38wxnwn+cJEpXLqy+eGgEirNS+WylTk5WAI3O
        xYwPwPV0JyfsSt92ge4p4Dpveav7ub2JUCA3Q2suOJGE
X-Google-Smtp-Source: ABdhPJzdtGfiix1TcHB6zBd7r6YEl7KCQYAoXJPQbWrAbAAVhCTpwADdJrOPKBG7ZIN3tgOt9Huix6mb7Dlo5EhgYxY=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr15593154otm.167.1636761536643;
 Fri, 12 Nov 2021 15:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
 <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com> <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
In-Reply-To: <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 16:58:45 -0700
Message-ID: <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 4:50 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> HI James
>
> You are getting -EPROTO while trying to get the current value of a
> control. I believe this is a hardware/firmware error.

Hmm, any idea why v4l2-compliance passes some of the time but not
always?

>
>
> Best regards!
