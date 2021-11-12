Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A4344EEF6
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 22:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbhKLWBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 17:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhKLWBX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 17:01:23 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AEEC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 13:58:32 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so15831279otk.13
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 13:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q83pLhcouY8LyRpbEm7lPvyBqOxOD71YaErOvc2yPoU=;
        b=a3IPJTuTS6UTSvP7s+f6mBBaZZdOZyzGVhYYXCMt87QasTY+9gwhsxbPiIOenmSZ1R
         YQJplJTY00qjhBZzm0RAlI4KiLqxql+uNzAl8G5C8KwCI7qxWGUWXJ1kOC5W/IpPpeF0
         cJMC4tONeF2gecr0KuifElgLMirrIIlHdvXPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q83pLhcouY8LyRpbEm7lPvyBqOxOD71YaErOvc2yPoU=;
        b=LUWEpS5Be9Jyp5tPGkbhZvpG6FdLJP1UeaN6av9Wc2oQQLNWhwS5yaFnYOZicsnPSg
         InBr3bvUgxgwf75JrIBM1lvS6sdlOrugI3EGOFnrG17UiFgdS8RDp0MfTxnPbSVTb4b0
         E5mDzsVhdVGxblhaOz+zV05IPAVQKVtH/Cx9Buv6ZkfMK5pypoV/7SuEhzNPh+lzPy61
         ufqfG7RhG+cSPySrkK8/FPcgWJIKiR5i2hTEIvWg6g2bVql8PNqd5aldSipcO+e55/2b
         GCxhMu4acgAbzgo620S0R20RXzJ90o12f8TGELTnjI/M0KN2J6k0V3AYGyTRZGYuo8R8
         pLJw==
X-Gm-Message-State: AOAM531z6tB68qxyrU8/fNmCzbbRiX5Fd0xGJDwEypBVaxri7bc7YXNh
        jyzMDKLMKRkW70830LWREtazkvnR0YW4VZCv
X-Google-Smtp-Source: ABdhPJz0xUXFtIUoID4x0Dk2GlZSKgRmly1YFudfa7bWAOoRWyf7SBEp5XZnqmcZJwExBpaEM9qWNw==
X-Received: by 2002:a05:6830:2b29:: with SMTP id l41mr13196907otv.333.1636754311580;
        Fri, 12 Nov 2021 13:58:31 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id t14sm819534otr.23.2021.11.12.13.58.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 13:58:31 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id s139so20323743oie.13
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 13:58:31 -0800 (PST)
X-Received: by 2002:a05:6808:12:: with SMTP id u18mr16141852oic.174.1636754310622;
 Fri, 12 Nov 2021 13:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
In-Reply-To: <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 12 Nov 2021 22:58:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
Message-ID: <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James
On Fri, 12 Nov 2021 at 22:54, James Hilliard <james.hilliard1@gmail.com> wrote:
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > @James: Can you try this version? Thanks!
>
> Yeah, that looks better I think:

Great!, mind replying with a Tested-by: tag?

Thanks!
