Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9233D76632C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 06:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjG1Ed4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 00:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjG1Edz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 00:33:55 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B94A2119
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 21:33:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bbc7b2133fso10890755ad.1
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690518834; x=1691123634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sjgnuUF1UtpZLW1ujAqeplXhpFAOqSuC/MPy0ozrC9s=;
        b=nRbZvvC3CTwDdasucZw6A4taaWzsaiLHQfzVIa3pctRW4MJv1Sjn0nt9jUgRKzx4ct
         qodsA9iSLFgOrDqw/8AOXdLwHF9lMSf2/KKYoFa9GsTd15xo4CQUqYcZqC0AhBsQHjJz
         7FUywW00EWl+LkBFEEI7OG5L8vDmyrCREweto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690518834; x=1691123634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjgnuUF1UtpZLW1ujAqeplXhpFAOqSuC/MPy0ozrC9s=;
        b=lqDgAYFDq6b2zeSsqaET2aO0yWXO85YhnHbVOLdjVNcZ+AR365jR3DZ9fDbhHfq9dj
         Cni3p2nYyrFpI3f/nxDmy/dAZWuTVOyhrFKeY/PuQaPnQsNfegtBGCwjewjTF8UyhkGy
         ddyVzudNDvFFxg/LxbWkft8XMO5BQWAKSOW3M5hRxB+KA0lm10GJXTjF/IzCmOsK9p0O
         +84PMaM7br9gjzHsg70hMNGqJ/cBGK3kz+IbMOZI3yi5mtuwOsD6X6PWrxQDBmSNSQ+0
         1s7OMG/W6jhmM+YLKL+8R2PkWb03bdtSLQZaWj1v4CirrgyNOwCAOMldw4Wzg0H6brkA
         9WXA==
X-Gm-Message-State: ABy/qLapKvKzLmBEvZ0GNTIgmo2OwhJw3aVO3SX2BBPEewg9uvx8xZq8
        YCCWmU9laQbYDfcWbPhDmjyCyQ==
X-Google-Smtp-Source: APBJJlEjRPwBlxwN16AD8f6c8O4lrv+hQCuLrDZchuIdV+m3akrEjuAeL+c8fUt7WjWW1gzdNrJknA==
X-Received: by 2002:a17:903:1ce:b0:1b7:f611:a66b with SMTP id e14-20020a17090301ce00b001b7f611a66bmr707239plh.31.1690518833768;
        Thu, 27 Jul 2023 21:33:53 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:9314:7aae:8542:aa2d])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902cf4600b001b8c6890623sm2494325plg.7.2023.07.27.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 21:33:53 -0700 (PDT)
Date:   Fri, 28 Jul 2023 13:33:47 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hsia-Jun Li <Randy.Li@synaptics.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [RFC]: m2m dec reports the graphics memory requirement
Message-ID: <20230728043347.GM955071@google.com>
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
 <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/07/27 17:17), Tomasz Figa wrote:
> On Fri, Jun 30, 2023 at 7:47 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
> >
> > Hello All
> >
> > This RFC tries to address the following problems:
> >
> > 1. Application may request too many buffers, increasing pressure to
> > system's memory allocator(Thinking about running Android with 8K UHD
> > playback in a system with only 2 GiB memory available);
> >
> 
> Yeah, I think that's something that has to be addressed. It was also
> mentioned recently in the review of the DELETE_BUF series. I think we
> need some kind of accounting of the allocations to the processes, so
> that the per-process limits of memory usage could apply. Let me add
> +Sergey Senozhatsky who often crosses his path with kernel memory
> management.

That's an interesting topic. The usual approach would be memcg: we
create a memory controller, set memory usage limit, then move tasks
under that controller. The last part is problematic, as it implies
a well-behaving user-space. I'm not aware of a simple way (or any
way for that matter) to "automatically enforce" memcg on a process
group.

From what I can tell networking code attempts to "enforce" memcg on its
allocations, and hence has to manually charge memcg. For instance, take
a look at sock_reserve_memory() and corresponding mem_cgroup_charge_skmem()
call.

So I wonder if we can take a closer look at what networking does and
do something similar in vb2.
