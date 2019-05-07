Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F3B168D3
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 19:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfEGRIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 13:08:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34379 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfEGRII (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 13:08:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id l17so6130252otq.1;
        Tue, 07 May 2019 10:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u5gCbtmml1yWtK0t/PMj+6GIV4E1VRfs3WfNLTkbb0U=;
        b=dvjp0DrmCnX9SQ/Hs5fmUOwylIPlga+fDduZbMynuV/nmxAyuncLpsP9ZsUSTtz7h8
         9uTA+RYTI6JEOsxX0M5rjNnrqUaZ7HO0Jrt8JtsnkVWZ0bI3KvTmsJPfZFscdPdmr5nV
         FARByggVOa5hNaD08A7/mMdOqv4pEfSjTz83Cmkvc4cWr8cNqody8ZOEm9kVtn/X9FRG
         Xs7GMDfin9imaJSFdq1h4OWC2q2iJKx4coFBrCx4J9IKsKA4vK4S6jcaAsZAVH4Ajj4B
         OKgWyVlwz0Qmw1Bu7g60+YahEG65+78TLcgGwe7isqRtOmRHRdcaN+QLnpF5+RneWZUw
         OJFA==
X-Gm-Message-State: APjAAAW541N960qKifZQtEB9Mg0wBtmPGfU5I8Ptgt2Oh0DCl5XmVMPL
        CZxeUYW/7DmIZOu0jTrj1g==
X-Google-Smtp-Source: APXvYqwc4JiCIWXYUr3ObUenixfFSpXOk2sCufnR2BGXW2J5cL8AsNpP2sM0kLFlRvkdpUOC9F52mQ==
X-Received: by 2002:a05:6830:16cb:: with SMTP id l11mr4816409otr.260.1557248887796;
        Tue, 07 May 2019 10:08:07 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e133sm6006799oif.44.2019.05.07.10.08.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 10:08:07 -0700 (PDT)
Date:   Tue, 7 May 2019 12:08:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v5 3/5] media: dt-bindings: media: Add vendor prefix for
 allegro
Message-ID: <20190507170806.GA4411@bogus>
References: <20190503122010.16663-1-m.tretter@pengutronix.de>
 <20190503122010.16663-4-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-4-m.tretter@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  3 May 2019 14:20:08 +0200, Michael Tretter wrote:
> Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
> AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
> VP9 encoder, codec and decoder hardware (RTL) IPs.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> v5:
> - new patch
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
