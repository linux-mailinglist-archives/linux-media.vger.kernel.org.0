Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC84181BAC
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729798AbgCKOs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:48:58 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36488 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgCKOs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:48:58 -0400
Received: by mail-qt1-f196.google.com with SMTP id m33so1742817qtb.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OeDgvgQiDB1GnxEeL/JTc+3NO9DTWC2sz0q3iRKbreY=;
        b=i2KhzPRPeR1otlrhMvHHrIZcJQps43kHk1oxKLWKdgxK+eytNvRuRzWEuFgFpBKtX2
         xupuyIw5OLfYjLZsRHwQLOMMT7q5HJng4TKsV6MtPsEdVl3RAG6reLaUM3Y22oyPteFm
         s7yeHZAmT8XFt4NgBOqc4fmtQAJOBt6JQcP/8wRe72YdUBSiRZB8PDLygH4dbhoxM9K4
         nI1qkk33E7LTqRW1HFs+62oEPuEDeHcYKE3OewtU6aIwiBNEgrJ8FBn1n1krAErVeHMd
         851B5DfVZmodckdXhR5RzIDvjtrQ6V8MHX1xrNw1IFmbw1MDz3Dk6V1iwVZI3sTWzvTK
         wkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OeDgvgQiDB1GnxEeL/JTc+3NO9DTWC2sz0q3iRKbreY=;
        b=SpthWCIZ0WvDY0XPKgy3k1rLEhYdl55p1qB8VR9I2FEEzw8bPCGNX80s7zmHs0kSgW
         ROECfJaQf9x9Nfp5bBALof3BUKs0JEBjJBLbKoUvM/XvxfWZP6dqt5OD/rQFKsNOwWr+
         pWjd9zNkZLA9BtB+iVqOGBaX7pvhubZaz5neGh1HtWjmNZIQ4yJH6b+y3Y8fPNOOi7iJ
         AAz2Gf/5r0maWod7DquZSSsvgk67pQAPxucUDUGcqMQLoxQaCZEagyTcBdNseQBT1MyE
         tMjdZYYQpcSttej9T7xlmjp7l73gFKPSJ/1YkCnsfTfSKVz7S1eyDQ7cMMA0H1HFE0Oc
         gVAQ==
X-Gm-Message-State: ANhLgQ14JFdOcYgEy/VLYofdeQ8E744UupoZrUqPgX7u8u2McTvjJXSl
        ouKT8HwEThuhWL3/xrgfKXfrkw==
X-Google-Smtp-Source: ADFU+vtDz3iLjwvD7XFuvmUQ9qKr0fxaZFV+bC/CrfkVrP2cganHSPmW/v177pahfAAzn29X68ur5w==
X-Received: by 2002:ac8:508:: with SMTP id u8mr2993785qtg.157.1583938136532;
        Wed, 11 Mar 2020 07:48:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id w2sm25704790qto.73.2020.03.11.07.48.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 07:48:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jC2fH-00050i-FV; Wed, 11 Mar 2020 11:48:55 -0300
Date:   Wed, 11 Mar 2020 11:48:55 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Message-ID: <20200311144855.GF31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
 <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
 <20200311143835.GD31668@ziepe.ca>
 <58916fcc-6d5e-4f6a-3de3-7bc90a4a5145@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58916fcc-6d5e-4f6a-3de3-7bc90a4a5145@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 03:43:03PM +0100, Christian König wrote:
> > > > int 'p2pdma map bar'(
> > > >      struct pci_device *source,
> > > >      unsigned int source_bar_number,
> > > >      struct pci_device *dest,
> > > >      physaddr&len *array_of_offsets & length pairs into source bar,
> > > >      struct scatterlist *output_sgl)
> > > Well that's exactly what I have to avoid since I don't have the array of
> > > offsets around and want to avoid constructing it.
> > Maybe it doesn't need an array of offsets - just a single offset and
> > callers can iterate the API?
> 
> Yes, that would of course work as well.
> 
> But I was assuming that p2pdma_map_bar() needs some state between those
> calls.

It might be able to run faster if some state is held. We've had APIs
before where the caller can provide a cache for expensive state for
APIs. Maybe that would be an appropriate pattern here?

IIRC the distance calculation is the expensive bit, that would be easy
enough to cache.

Jason
