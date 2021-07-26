Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15E63D5201
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 05:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhGZDTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 23:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhGZDTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 23:19:02 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B1EC061757
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 20:59:30 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso12443496pjs.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 20:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qVPBFQfkoOTPpfgMDmNOI+3X8ZThG2kSzEdO/wqW9+c=;
        b=alM+LxGH7qHW9x9N7zhsCk8NElJ2wRQAP/5f/SDVrC+tO7ArwcAhPFuIOMrm4gxFKR
         WyYVrMg4S256yZZ17BpidOc6Am+vSnGjT32lE1fTYZheWmAb7iOzymoDHu7aRNuwCq9I
         Xe3DG2ctfTtDb8ZWSGB+FQ6XXhJiuae5a37ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qVPBFQfkoOTPpfgMDmNOI+3X8ZThG2kSzEdO/wqW9+c=;
        b=Oz0Q+cyKE4nxm6DWApoPgk9EKWGGpsiFYmUxlDTpBwA1Rk9HXxi8imvNgCp3LPfq4U
         qbsob/L/tqjYYJCdladZ1COABEGpYDe2I9xeXHz0o+NR0FqMOvbTUfdX/A00bSNLBibV
         28EkZ3oDtP4kLH4AxbMsYU2iDBXk1zckOWK1i+1ohenESoxV4x0WcA8/rVPzWXduSNBr
         RcgxPLd/RL9M+6R/Bv0ruSaupsk+tcqOZbxU027MLHoZHKOYzepBpLOIweYIvgKo/JNr
         /SLIpQAUEoUx15ixLe1T5E3s6+5GqcLoMy67n4fZ9oW+EfP8hf+DequT6mo/Y2qi+X3s
         q3kQ==
X-Gm-Message-State: AOAM531Y0pXTekDYtX3aShTQHM+JhnMjGIAQ3xbzXUnu2TwDcI3rhH6R
        GbnFQ9Vs+1ecT9JnZmkimlLzuA==
X-Google-Smtp-Source: ABdhPJyBXvKTfbQKNMacfCffeSJ2AZsms1CzkeIUcBE53GMuFpW+A10Jsx3/5dUpSGM7eSTsvo1AyA==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id b10-20020a056a000a8ab029030ca10b3e3fmr15705921pfl.40.1627271970392;
        Sun, 25 Jul 2021 20:59:30 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:d699:4331:827:4150])
        by smtp.gmail.com with ESMTPSA id 26sm11408304pgx.72.2021.07.25.20.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 20:59:29 -0700 (PDT)
Date:   Mon, 26 Jul 2021 12:59:25 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: [PATCHv3 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YP4zHRh+jHJGbNHz@google.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-9-senozhatsky@chromium.org>
 <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/22 19:26), Dafna Hirschfeld wrote:
> Also, the 'cookie' cb returns buf->dma_addr which is not initialized for
> the noncontiguous api. So it is not clear how drivers should use the new api.
> Many drivers call vb2_dma_contig_plane_dma_addr which returns the cookie.

Hmm, that's a good find. Is ->dma_addr the same as what we have in
sgt.sgl->dma_address for non-contig?
