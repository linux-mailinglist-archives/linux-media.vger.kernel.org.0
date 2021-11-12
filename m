Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F7744EF39
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 23:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbhKLW0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 17:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhKLW0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 17:26:54 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB09C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:24:03 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id u74so20508410oie.8
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y621yBnt5JkrkFhlOZ0P54KF3RLy1DP90JsoSa4kBV8=;
        b=HqE9brIZbiqwGfkcOrrY/qKWQKsJpTk5h2x+oMsqOnlVsbh+Ze9EP02HzLjF4uKqd/
         4ufDlyUMAaivpp51oFhAYvwvGz54gfccT/uaGNeioG5lk9oYoSUU05hEWXJ/qQrHktam
         tQl1ecqAID21R/ttLjJxTSoMOnT8Pjbml6JGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y621yBnt5JkrkFhlOZ0P54KF3RLy1DP90JsoSa4kBV8=;
        b=ht/5scHiYAApbnkKBSJrgCfG8q8hR8yBv6vPtTqGukXXroCYo/Ac6PSMowX8wRbVfJ
         7fCjcOsn+RNZQAS1dr4lnK+lrw/UtEh2Mf6+/l2g7dneBCJS0lrAIqPnEoE6DiWdjYtC
         Qz9xntlI7tZ+Fv9I7uBnTiBtoOreqlYKWuEZxTMAPoZZckSCK8oMItVm8juPtmoJimUL
         j6tUNkWr9H1GJ/JENFTtYWJb2c4c5LdmjCPp9nc0OUdBFVz0gXEv5HmeTgTZvuZCV0kF
         H0jVmp2f2c+cRxONGnTvjwT26YMbpPwlOyoBEbWukkzmPIS9CcQoyE8B5mM0Yyffv9yd
         eh+g==
X-Gm-Message-State: AOAM533hQ5iN9yLEAvIDdRf5Iz4AVfmc8b+nS6awwABVAEe3N71JP6vm
        WTnsARWCVdoty014iupwmrpRv1m2GCfNnwQ8
X-Google-Smtp-Source: ABdhPJye1EOYq8vxKgRwtF2S0RUj7/HQvR9EueAQePfy4GrDn+rD9X53JH25ooupgATAfzd1AaEKWg==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr28656315oie.41.1636755842814;
        Fri, 12 Nov 2021 14:24:02 -0800 (PST)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id k4sm1568435oic.48.2021.11.12.14.24.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 14:24:02 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id 64-20020a4a0d43000000b002b866fa13eeso3400514oob.2
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:24:01 -0800 (PST)
X-Received: by 2002:a4a:5a45:: with SMTP id v66mr10599567ooa.26.1636755841462;
 Fri, 12 Nov 2021 14:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com> <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
In-Reply-To: <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 12 Nov 2021 23:23:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
Message-ID: <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
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

could you check if this fixes your issue:

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp
b/utils/v4l2-compliance/v4l2-test-controls.cpp
index a303baef560e..8731c9eb635e 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -851,7 +851,7 @@ int testExtendedControls(struct node *node)
                warn("s_ext_ctrls returned EILSEQ\n");
                ret = 0;
        }
-       if (ret && !multiple_classes)
+       if (ret && !(ret == EACCES && is_uvcvideo) && !multiple_classes)
                return fail("could not set all controls of a specific class\n");
        if (ret != EINVAL && multiple_classes)
                return fail("should get EINVAL when setting
mixed-class controls\n");

If so  I will prepare v4 of
https://patchwork.linuxtv.org/project/linux-media/patch/20210317143453.483470-1-ribalda@chromium.org/

Thanks!
