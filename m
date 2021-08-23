Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B6C3F48A1
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 12:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbhHWK2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 06:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbhHWK2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 06:28:41 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA99C061757
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 03:27:58 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id j2so5457455pll.1
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g1SJ1j2u1zvDC10cTU9j4nGc60DJc7SjggYjuomF1P4=;
        b=fe73TA8282cYRCk0e+Pfu/M0nN0GMD/jwNgJv416OP2s8C74tb5+Wy5PqTnxtJp1ug
         QC4jaAArkJ+KNc6VH30DDBUAKxKp2vRyNCUVKpf/cAf0U5V+iR38nhfia5xwZtDGRTEb
         m8naQt0HYR9yqeTWdMDvRozmxA+y+w8IrNwBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g1SJ1j2u1zvDC10cTU9j4nGc60DJc7SjggYjuomF1P4=;
        b=DDteQ4o6YpEPTaTUj27Yq7DnrDAyu3ycF7vtZ6iaJkH4U4v+8InKzikrWBifdXeBCv
         dZ2xBq2jZ1ckrWcOVR1W6Zvaay67pER4gXEfBLEaioC6LxyfvMiEzu5d4NMWYh4/NZYt
         EYXB9B05sk4+QApqGSlAerFwvXG5KB5KpvP0TrLaNV4L3/LpNM9AaI8IZeZexaXz+sB/
         Xs7k9N2P0lDSsBu9pga0AmFiyANgaLcbBe3f/2Sp8d6hShp3nGdt+43VP5Lv0eTQig9v
         JUq80qu/94nieoqxY4lkHHLmgqAPMuLHWOjMORDumsDtzgTc6sjGXrcR8CUgEIswIjuq
         lnBQ==
X-Gm-Message-State: AOAM531Ef6GwmTvR9EcDIv9yHV/l+VIEr23TuxV9YT8z29QhFCBM+tRx
        P8GGglF3NZfEPXbcUSuDTMiY6Q==
X-Google-Smtp-Source: ABdhPJwGot65ffHC35kFdykEdYNu4KrX9pN0ji5TehtyrAktvb3VwfUnZWUSeP+H3orX70FaNQ72Sg==
X-Received: by 2002:a17:90a:b284:: with SMTP id c4mr19593581pjr.213.1629714477648;
        Mon, 23 Aug 2021 03:27:57 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id s5sm18777794pgp.81.2021.08.23.03.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 03:27:57 -0700 (PDT)
Date:   Mon, 23 Aug 2021 19:27:50 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YSN4JhGObeaY7Sae@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-9-senozhatsky@chromium.org>
 <7e172194-9519-fd1f-6261-c40108a5d722@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e172194-9519-fd1f-6261-c40108a5d722@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:33), Hans Verkuil wrote:
> >  	struct dma_buf_attachment	*db_attach;
> >  
> >  	struct vb2_buffer		*vb;
> > +	bool				coherent_mem;
> 
> I think that this as well should be renamed to non_coherent_mem.
> 

Done.
