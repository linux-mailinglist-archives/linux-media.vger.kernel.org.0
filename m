Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7D924D243
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgHUK0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbgHUK0Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:26:24 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8FFC061385;
        Fri, 21 Aug 2020 03:26:24 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g15so682940plj.6;
        Fri, 21 Aug 2020 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EDYP1Th9SUcoctkxgo3VQaPnbnmkI7OqEYMxoTvtHN0=;
        b=tZUcqQk4OxfAKx4yXlUjLq+S42J/dpi6hvKmcCzI7IOMFgXO22q8ZpOubAhZVhTkWT
         aSQmB1e0K2G2oiTgh0Jvi76L758pJSsbReHvXNc7DWEnXicLnC/wYxrJRkb1Z73wXQ2a
         vtnv+OsXzqtK3iUEduj5O+B1sA6VgK8M3/U4QvtO37i8XbtUzYVQKweCEFkQpPfDCosT
         vOpOpxUE8hwCgsOoFilXxhA7Ou47ncykW0t4gif9aGMl9TnGYIKCguP681X0e5iAbae9
         w68BzZm9t69S75hyC++oITJJAH952IURlQQ4wntJnTU1m1mj2qGH7nV4TBx6IYlkInP4
         viOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EDYP1Th9SUcoctkxgo3VQaPnbnmkI7OqEYMxoTvtHN0=;
        b=IlLRmQZ5DMACqetqhpiXJcE7NScJMlScI+D/UaibjHxJkoyKmYT2yk1mG6ElyahGGp
         e9uYq5lI4JSeeySFpii/lXBDSQ27zNhuPiwUX/mUTu9908KbBohZ/p+B2QXl9ij0Gb1I
         G2ESguzGi5uWbu73avVroXFWdtgJ7L8b2Eg8sBub7T3wNPoBcCHBeGksTNrGI6bkTJmL
         q08UToUXHohaIZdnf66CU1DCRw58omz6a8TgL72Po0hKaOZDUeTriPTHw7J2qCaREd5H
         DLlX7voKKwpDx036X8Gt6lOukjK2j5PEd3Yzub4UdyzlpWzQD1GQ4DjywLKJG0KxVtkc
         gG5g==
X-Gm-Message-State: AOAM533tdLD74I1az2olbPgzok9ipIjaEsA3h0kqZepeKq3Gx+G0ZOot
        3Q7DoWgu4nmywOvs+0qcqw==
X-Google-Smtp-Source: ABdhPJz9R9MwaPyIag3S3tRWpw9WvpKuu1aTtQc6U/Q6abAmmcfdC12JeVCjoNu3HX8Bp2NmCvYGXA==
X-Received: by 2002:a17:902:a412:: with SMTP id p18mr1756333plq.283.1598005584196;
        Fri, 21 Aug 2020 03:26:24 -0700 (PDT)
Received: from PWN ([2600:3c01::f03c:91ff:fe6e:64cd])
        by smtp.gmail.com with ESMTPSA id v11sm1634230pgs.22.2020.08.21.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:26:23 -0700 (PDT)
Date:   Fri, 21 Aug 2020 06:26:14 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix
 global-out-of-bounds read in precalculate_color()
Message-ID: <20200821102614.GA490417@PWN>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
 <20200821094813.GB480216@PWN>
 <eab860f3-5520-72cd-3bb1-f990f7f9ea6f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab860f3-5520-72cd-3bb1-f990f7f9ea6f@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 21, 2020 at 12:12:28PM +0200, Hans Verkuil wrote:
> Arrgh! I know what this is. /dev/video6 corresponds to the Metadata output
> device of vivid, and that metadata format sets brightness, contrast,
> saturation and hue:
> 
> struct vivid_meta_out_buf {
>         u16     brightness;
>         u16     contrast;
>         u16     saturation;
>         s16     hue;
> };
> 
> vivid_meta_out_process() calls tpg_s_* functions to set these values. But
> this is wrong, it should set the corresponding V4L2 controls instead since
> calling these tpg_s_* functions bypasses all range checks. It also will
> not update the controls themselves, so they are out-of-sync with the actual
> values. I.e. the test pattern generator uses different values compared to
> the values in the controls.
> 
> So two patches are needed:
> 
> 1) a patch for include/media/tpg/v4l2-tpg.h where tpg_s_hue will clamp the
> hue value to the valid range. This to prevent anyone else from setting invalid
> hue values in the tpg.
> 
> 2) a patch for drivers/media/test-drivers/vivid/vivid-meta-out.c where,
> instead of calling the tpg_s_* functions in vivid_meta_out_process(), it
> calls instead:
> 
>         v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
>         v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
> 	etc.
> 
> Do patch 2 first and test with syzkaller to check that by going through the
> controls this issue is resolved. Since with that approach the tpg should
> always get valid hue values.

Ah, now it all makes sense! Thank you! I will do them now.

Peilin
