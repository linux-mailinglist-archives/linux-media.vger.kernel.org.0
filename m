Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF7D3EEB25
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 12:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239580AbhHQKoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 06:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbhHQKoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 06:44:04 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DDAC0613C1
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:43:31 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id oa17so31402952pjb.1
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+/innh2PtgXkbsfaqLPlB3xD+duTFD4lC6SMGbPTr0s=;
        b=PscStddJITSywwdUV+jIVYrvl6WtRVTuWXfFBysREhc47Lixod3p2Dbu7LKbk2uzJK
         5NDNKOsaiFiWD6ZUp+cpOwpfioWg+gsCIIe9TVwy7SQfykxRkW2wGLMCdipXaO8ZtXUm
         cXGdqdm7op+sq6zERi1tpUj7uucsf7lfPuFj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+/innh2PtgXkbsfaqLPlB3xD+duTFD4lC6SMGbPTr0s=;
        b=P7DU+VoNYJHsigfVnDykOXXjBPv2XVLPoZOIF8E4iJ1Gh8XG9vb1uiyO94+DhmB+bV
         u7ykK34xJDp+bB6FDQU8lzFNXOP53g+Z9IXIAneR6XdxCj1uN/L8rW8YL//pENo6k7VG
         D1gEnyS0IDqHaNbYTDllIB2hzYUDLuk9tfbuyLPXA3GuasuswXzieXvV4l8ai1egq8R/
         uwIM4gZ3itC6OOzVtjZjmoHfS2fC7+dQpLbRRRU84LAqVSS2k0Hxc8+RaOXzTfu2b5GC
         U5nWtnTuR7/dNt3dpz6+l6wHHKGmOtXhZYLY1POcnbRgUiiGFXHX8H+K7CnELnquVsPP
         t4yA==
X-Gm-Message-State: AOAM530vmLtP8vKw/5Y+oxEqjli4bcfkr+EzsiTYtB0q+mpr7Hh4vmMp
        Ib8lW0ocpkLxQTNGHQx3jLuqmg==
X-Google-Smtp-Source: ABdhPJybzjf0mJSCoiJtrctCpE6UW3O4/wTk2jQoBgDJdeJg2rIJsLjLpw6AV7zntZb+b7ID4V5wZg==
X-Received: by 2002:a63:3d4a:: with SMTP id k71mr3019404pga.276.1629197010727;
        Tue, 17 Aug 2021 03:43:30 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8aab:cb84:5fe8:99dd])
        by smtp.gmail.com with ESMTPSA id r14sm2312434pff.106.2021.08.17.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:43:30 -0700 (PDT)
Date:   Tue, 17 Aug 2021 19:43:25 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 6/8] videobuf2: add queue memory coherency parameter
Message-ID: <YRuSzbVWPd/JpPjj@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-7-senozhatsky@chromium.org>
 <88491bca-f1b3-58f0-81e1-7ecec9f9da40@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88491bca-f1b3-58f0-81e1-7ecec9f9da40@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:29), Hans Verkuil wrote:
> >  
> > +static void set_queue_coherency(struct vb2_queue *q, bool coherent_mem)
> > +{
> > +	q->coherent_mem = 1;
> 
> This I do not like: coherent memory is the default, and so I think it will
> be more robust if this field is renamed to non_coherent_mem and so coherent
> memory will be the default since this field will be cleared initially with
> kzalloc.
> 
> Basically a similar argument that you used in patch 2/8.
> 
> I also think that it improves readability, since non-coherent is the
> exceptional case, not the rule, and the field name corresponds with the
> V4L2 memory flag name.
> 
> I noticed that in v1 of this series it was actually called non_coherent_mem,
> and it was changed in v2, actually after some comments from me.
> 
> But I changed my mind on that, and I think it makes more sense to go back to
> calling this non_coherent_mem.

Ok, done. Hans, is this your final decision? :)
