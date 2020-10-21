Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C072295416
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 23:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506095AbgJUVYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 17:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506092AbgJUVYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 17:24:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D28C0613CE;
        Wed, 21 Oct 2020 14:24:46 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q5so4139964wmq.0;
        Wed, 21 Oct 2020 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RipUy/GvdmVZsDWbVUr7SVSUmlKVDIq3UATwfD6vxX8=;
        b=JjTXgBepKJProOvnSNen0yPW5ifumy3BqFeCaJ7L+UpcEbZoVgMbba8tpviragaXSu
         jFkvkZ21U7+Pk7zBAgMn0NzVvCqF+ioxuC3swm4fWz70R8NKDjkE/ucwr90PeS/W8dGd
         Z6JL5yjjZgPskA64LNNEqoeyTZUSEk6bbtQSeqLHZQMjGWH9nXwtRFsq5R3ikRgJrjEE
         txRx3ULZpBZnKWPDw/v/ERClyNawQzTMk+jrymeVLsikAJaQAx2lAyZRC8QocKY+kXau
         0OIePrvqLU1vTihzozjBSrS+6FHOMqzoFSoJ/QNOrQKwUtfF89pvBd3fuljkWQA3RTQZ
         5ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RipUy/GvdmVZsDWbVUr7SVSUmlKVDIq3UATwfD6vxX8=;
        b=tK3boKUnVV5wx4Y3KBcV55GezqluNHCSqhb2Mmunq7hRZRSCCpQmMAbXSKJkTgwwU5
         IXfCQ/FyUs0RaUU4DgqdLeNJnlry7OeqbU5eOWyZaz71fiYGtaRkmc2ivtwP9c5t13A6
         Mqrb1K+S9exOgfGxhg+VdbT532qSoiMF8kGtfNQcDDwOM7mOIs/i1UbY+0np3aebu8Q6
         TzYINNbDjlxAJUZ0HoqHoFqvaK6KrvjNHDTzqE0senqF5s3ZxII0K1L/joSPdW/8FIkg
         91yWdVBhYdtL/rA2HJgTNWw+ekPGfAiajTGOFVEISryWHbQGEMi4yJZ5zhgizijuzkP0
         OPgw==
X-Gm-Message-State: AOAM532clo/0lNwoGe9Arb6eUZM2M1yBaz7pbgdPEFrJ01l//xzGfAbo
        rO4i8EaTxuqzNfBl+QQRJIoUBC3iIS4=
X-Google-Smtp-Source: ABdhPJxnmv+oU8rhq+9dow/MKcVah8gWvFQrXY07xDSI1cb06ZiU1DEQPonv4pwelzNzEozZFgpppQ==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr5264801wmi.29.1603315484765;
        Wed, 21 Oct 2020 14:24:44 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t6sm6879858wre.30.2020.10.21.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:24:44 -0700 (PDT)
Date:   Wed, 21 Oct 2020 22:24:38 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201021212438.xgnjpmxojfketgqg@arch-thunder.localdomain>
References: <20201020190051.1852778-1-rmfrfs@gmail.com>
 <20201020190051.1852778-4-rmfrfs@gmail.com>
 <20201021155016.bs2n5ixuhxwjzjy2@uno.localdomain>
 <20201021205844.xpk4fgcppahlyee7@arch-thunder.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021205844.xpk4fgcppahlyee7@arch-thunder.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,
On Wed, Oct 21, 2020 at 09:58:47PM +0100, Rui Miguel Silva wrote:
> Hi Jacopo,
> Thanks for the review.
> 
> On Wed, Oct 21, 2020 at 05:50:16PM +0200, Jacopo Mondi wrote:
> > Hi Rui,
> > 
> > On Tue, Oct 20, 2020 at 08:00:51PM +0100, Rui Miguel Silva wrote:
> > 
> > Do you need a maxItems too ?
> 
> sure, thanks.
> 
> > 
> > nits apart
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks, Should I use this tag with renesas mail or the other that you
> already used in the other patches? I think the later makes more sense.

never mind, your tag is the normal, I was confused by your email in
the header and the email on the tag. My bad.

------
Cheers,
     Rui
