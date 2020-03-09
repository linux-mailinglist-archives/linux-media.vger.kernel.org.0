Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D5D17DC3D
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 10:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCIJR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 05:17:59 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:44956 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgCIJR7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 05:17:59 -0400
Received: by mail-ed1-f54.google.com with SMTP id g19so11126982eds.11
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 02:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2uE13X9NLaiDzIOG8VHY8MZnagnleF8fxm5Dt416rw=;
        b=JHJcaImyjs/HMeb5w21GosBMzXh72gusUrrwpIvG7nH6AiPTiY8BCHemZ87iB+jQe/
         H9i4YpkuVkfxVaS+8+QzRZchSPFl9HRpsziMJFjK5fWg6NW0hi+uZi9HsbBxE+Jq6wy7
         SxDzL0ejuvdSC50oE4MLvd29JZ7n2p6F8Eua0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2uE13X9NLaiDzIOG8VHY8MZnagnleF8fxm5Dt416rw=;
        b=m1YckSfD20o6ZDPSxZB82JKy2VgtUcTA44Hn4SNvWIbbyASvUJjAV0AZowv61aplnM
         HMu+mvR322PVCtXu8mZwkheSeSUq2foGRDshvPzwDZHVx7eaoyZlVCI+fEi/xlQvs9Tg
         TfIGq4MDQi1ReCilG5+k7XNbGqAHt6q//Nh77HxAhEH1y6dJTdXQSFdpJF70AKZlc0IE
         QqgMZ136WX++YIfxwuPxDXl+1T+PqBwKwc7HQcWCPv4YTDjMac3sHv8GYEPT/0KBaOpR
         O60dLBizSErrZ5mH5nutgDjUq/k64uvFm5a0urL74ZqwTBwJ4RJU8RaY5Uj6EIGNB2ud
         yByQ==
X-Gm-Message-State: ANhLgQ2dJo/i8BvG6OhlcBqAmJVT1HXMJVgxYL+b69AA44MlysGWcE//
        bdkmslqPmmAa6c/vqxbxThNPcZb8+Mktwg==
X-Google-Smtp-Source: ADFU+vu3YoOiSuoAGv1vEw+k36GMF6Qj8jQv7UqZMOJ+yq/4gwFSLMMgF9EOGz6KqFqOIuUl0hQ+cw==
X-Received: by 2002:aa7:dbd7:: with SMTP id v23mr16518816edt.82.1583745477257;
        Mon, 09 Mar 2020 02:17:57 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id l4sm3031279eds.3.2020.03.09.02.17.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 02:17:55 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id a25so6236835wrd.0
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 02:17:55 -0700 (PDT)
X-Received: by 2002:adf:eac8:: with SMTP id o8mr6539722wrn.105.1583745475160;
 Mon, 09 Mar 2020 02:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com> <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com> <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com> <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
 <20200309072526.GC46830@google.com> <e31197b6-5d22-0c3a-cc77-e9506136ada5@xs4all.nl>
 <CAAFQd5Ajopb019HZmtNJfDZmZbssDHfztmT0BvAD07QttXmZ1g@mail.gmail.com> <20200309090802.GA231920@google.com>
In-Reply-To: <20200309090802.GA231920@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 9 Mar 2020 18:17:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BH2rFZkABej+JfW76f2tjmBBKWm8WjW+TOTBjfewm_9w@mail.gmail.com>
Message-ID: <CAAFQd5BH2rFZkABej+JfW76f2tjmBBKWm8WjW+TOTBjfewm_9w@mail.gmail.com>
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 9, 2020 at 6:08 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (20/03/09 17:58), Tomasz Figa wrote:
> [..]
> > > > I see. Hmm, how do I do "test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS
> > > > is never set" then?
> > >
> > > Not sure I understand your question. When requesting buffers for non-MMAP memory,
> > > this capability must never be returned. That has nothing to do with a cache_hints
> > > module option.
> >
> > Have we decided that we explicitly don't want to support this for
> > USERPTR memory, even though technically possible and without much
> > extra code needed?
>
> My irrelevant 5 cents (sorry), I'd probably prefer to land MMAP
> first + test drivers patches + v4l-util patches. The effort
> required to land this is getting bigger.

I think that's fine, but we need to make it explicit. :)

Best regards,
Tomasz
