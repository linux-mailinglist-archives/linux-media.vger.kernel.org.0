Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DAB17CD4E
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 10:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgCGJjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 04:39:25 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:42117 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgCGJjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 04:39:25 -0500
Received: by mail-pg1-f176.google.com with SMTP id h8so2273827pgs.9
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 01:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7a3AAdOd9aTW9nDmpj4pfI4b0wQoKltwVVKhvV6YEWo=;
        b=Z6Qq6/1BqFIylyqfS6Pv05Y6BNWVpCBFW7z4NRcvmpUbx0CCBnp383iDE0xtThbgF0
         CvlCohuP6bRjR/9CaLi7X6m7p+Jg1DeaBU4v/ZyAPTkswwjFbMxm9jQgiH78PNSTFbqC
         sOBuUr21Ll7e8Ep/vSwax0azbtJntHQOFwbMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7a3AAdOd9aTW9nDmpj4pfI4b0wQoKltwVVKhvV6YEWo=;
        b=MND0Ltd2YuVjB8mFm60OlsaMhJHBAYZMkAttLJErxd0Ct/B12GHo7Ru6yu/a+/ZtaN
         JJ5mTVNzF1HvYSwvPgRBpcKi5KeTVUj7133pBmTItyqVBB/wPawEcDCshLdON2oSonwy
         z6uJSEPnOPcosYvtrU50rOvrXPi09WzgJ3XoHfPuzeX2n8A5PCG9dYFCCBOnzq1G45Eb
         TL76m1zeVow0WWI/m6BgU3GYytiZBfoaCUGEHm+c/TbEm0Wnf1eykW3pGrrC3k872zVi
         R9sM24HJPLIOxRlmKpUwLWNs+PRf4aXkI/TvF5sNn5l2cMxTUfPns4JfMkAZ9y7SbaKk
         6BPA==
X-Gm-Message-State: ANhLgQ2YUnOfrGOdoNTZwGuL4rsDZUt1JAOCnXcJuUGEUwjvVv9uj3dQ
        bNEo885WokBkCaBybyGSoJJFFw==
X-Google-Smtp-Source: ADFU+vvn+Juchn8PjjSyhg0i99Mf32mKkqJVst/dcmMctSpXzE9UH+SIP0x31txil9XG5a1Hj4flwg==
X-Received: by 2002:a63:1e44:: with SMTP id p4mr7242868pgm.367.1583573964284;
        Sat, 07 Mar 2020 01:39:24 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id x197sm23115196pfd.74.2020.03.07.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 01:39:23 -0800 (PST)
Date:   Sat, 7 Mar 2020 18:39:22 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 10/11] videobuf2: add begin/end cpu_access callbacks to
 dma-sg
Message-ID: <20200307093922.GA29464@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-11-senozhatsky@chromium.org>
 <f99cd8d2-26a2-acd1-a986-aee66cd2ba12@xs4all.nl>
 <20200307052628.GB176460@google.com>
 <8150bc6c-f6a4-fa2c-4e2e-552dcb168df0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8150bc6c-f6a4-fa2c-4e2e-552dcb168df0@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/07 10:32), Hans Verkuil wrote:
> >>> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >>> +					enum dma_data_direction direction)
> >>
> >> I suggest you use this style to avoid checkpatch warnings:
> >>
> >> static int
> >> vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >> 				       enum dma_data_direction direction)
> > 
> > OK, will do.
> > 
> > Just for information, my checkpatch doesn't warn me:
> > 
> > $ ./scripts/checkpatch.pl outgoing/0010-videobuf2-add-begin-end-cpu_access-callbacks-to-dma-.patch
> 
> We use the --strict option to checkpatch.

Got it.

	-ss
