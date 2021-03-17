Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C389B33EB1C
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 09:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhCQIMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 04:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhCQIMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 04:12:20 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC464C06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 01:12:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so2772683pjq.5
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zLY15HRdmjN+WzEM6Wb9ghJnMYS5GHNsHkgt7obEDCM=;
        b=c6ZgUWtqaq8Pu7xQlqPoKl8CX3atGgQHi577Sj+2KOyhTPAQQYvstQUKN397PFTwaN
         R7vZvQHgY9B8R3b2YC9EH5WCADvgr4+5uNFTG6+VzTZcFMFi6fdLxDbFUhtwpCoQ3FqD
         NOU+b161/ArEZtIWOvjgdosNKT3CIc7+n/fdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zLY15HRdmjN+WzEM6Wb9ghJnMYS5GHNsHkgt7obEDCM=;
        b=g7C+aKKpF2MBVhlxSaEPKBmzpLZzbkMc7RkHhd4euS6KfVPkwKz2GIpMQTkxYYlENp
         B+qmE5bhuxBtg6+8I2To+dVj31kvnXQgKGYtdtU1ZGfaIt140/pt0HRknUicDLmYV43d
         m0NqHaiDK8f1/JUzBnTz8Xeov6t+It3iwCJduN7tFUh14t5iMEopphll1H2O4jtYMaj4
         N/t6yuHmQnidAGsp/i38DTwzyJZlcUQWSLBsmeJeXGYPR3iEponcZrZsEWnBoNWPIXzj
         WHgbbzGHwLocr+vITjz8OvZzuGcOxXi++yUapqirC9SKVcxxVQbN4ImKCSaD0PVogDAX
         Ftnw==
X-Gm-Message-State: AOAM530BgoF8TSSRBOuAZS+S6mhqeWxxcKeeKUAai9LwyQHlqK3M6AO8
        bpduPc78QfIAxcNGcPPlAfmI/Q==
X-Google-Smtp-Source: ABdhPJwnW6oAfoxq5uuWhck8IodvFib2eXowUm6fAuUHOK6MrqUJp3RkyoYyCTxx5YIXYOtnpc3hIw==
X-Received: by 2002:a17:902:8c92:b029:e6:60ad:6924 with SMTP id t18-20020a1709028c92b02900e660ad6924mr3319720plo.16.1615968739531;
        Wed, 17 Mar 2021 01:12:19 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id 138sm18608063pfv.192.2021.03.17.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 01:12:19 -0700 (PDT)
Date:   Wed, 17 Mar 2021 17:12:14 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv2 2/3] media: uvcvideo: add ROI auto controls
Message-ID: <YFG53qBdM0HWV2qL@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-3-sergey.senozhatsky@gmail.com>
 <CAPybu_2ZRNUiZbFHfuW6i119xhs21-zTigoaO8sZc-Ye3D18xA@mail.gmail.com>
 <YFFcvbXRlCCB+pv/@google.com>
 <CAPybu_3cu7_vca0gi_A2QRA0TYozqE2Ef_q5QQgQW9LzGFbUKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_3cu7_vca0gi_A2QRA0TYozqE2Ef_q5QQgQW9LzGFbUKQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed Tomasz's email

On (21/03/17 09:08), Ricardo Ribalda Delgado wrote:
[..]
> > > > +               .id             = V4L2_CID_REGION_OF_INTEREST_AUTO,
> > > > +               .name           = "Region of Interest (auto)",
> > > > +               .entity         = UVC_GUID_UVC_CAMERA,
> > > > +               .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > > +               .size           = 16,
> > > > +               .offset         = 64,
> > > > +               .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> > > Are
> >
> > Are?
> 
> Aye!
> You are not a good kernel reviewer if you do not talk pirate :P.

Arr, Matey!

	-ss
