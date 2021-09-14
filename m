Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1274F40A4AC
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 05:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbhINDmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 23:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239029AbhINDmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 23:42:01 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CB0C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 20:40:44 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t20so7879697pju.5
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 20:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:user-agent:content-disposition;
        bh=JbyQ7VGQk35fFKq+ZHXwnl3QOO9Lw+YzIfoAl5zBW0Y=;
        b=jBZke60Q/SiBooMIMQxd5Irr3YfUKyl/Y4jaFWgUsT66RmMrS3i9rgfh2Ud0y5PY/z
         NVk2Ar+iOzCEu4yReGS9MD0JwLXeP8/Cu6L78b3sFDT7vZPGx/+M8Ci/XrcrEvq/FXgr
         +Rx1QioGafI5R5oMNd+Av5b0sOcxGZrEwZAg8mVssbP8jyiThl70WryrVbIeozbGYp5v
         cm/ZQ4GtEd+wT1hH7Du7qbokadOflXuEx8jjIZ7WW/V5k96s7TrNicnPd1m0eVocYCS/
         aj5aZjHYwgfXhIcHQBhvfEwxdx+5/YC53L98XhhmjEQPEcF2AQNEsbDYWvyz4SGsZ0jq
         lTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:in-reply-to:user-agent:content-disposition;
        bh=JbyQ7VGQk35fFKq+ZHXwnl3QOO9Lw+YzIfoAl5zBW0Y=;
        b=qVxPAJTDGx+PeyXEWVpVBJK7TRpP+HVPGluXAYo0gWl8DIwoW3h9kwO046ufYHDS5T
         /EVJhJLAj7WCWYZXDIHEdcAvv/6LxkxFpz61cfYNEDCMCi41ltjuFzmUQJRjZgfFNYHr
         +8K05yRfqURBvalXRyUeeN0RTuGNDT90zydgjk8GNQ5JckkmkjqreWoNoz6Guy6Y4DYi
         Ur6N7ehCYgl4ThJFHnnE+kWYZOTmoVrcX91LDJ2K1GilhHYMCTD0oFGQJi7HfvjN5R2q
         D/osVXZna2NAznKT2MK+NOGL7mQyopKrKMIH2rNQcTSEI2NC6ceKLd/x4xEGzNXJhA5K
         MWYw==
X-Gm-Message-State: AOAM53368jxz3jtT2u4t2GkmBRQ5zZcHqxGnHvc8/D7N9GRPtuMG/9Uo
        lOk1/NhGIcTLxWawixJGM+nqu1qWZ0fCvgR7ErCUspURUVvHpslo943i2X0rzbK6Gq6c2uvD/pP
        pcbnQODoY/v5kgihG
X-Google-Smtp-Source: ABdhPJzvPREwsMVsSmlMxKvhTvyVINXu+p/ZqeLrzBiwtjk/uh+XdKf8sXnTS5Q0/U0ON8qIWM8GuA==
X-Received: by 2002:a17:90a:e386:: with SMTP id b6mr1280514pjz.97.1631590844188;
        Mon, 13 Sep 2021 20:40:44 -0700 (PDT)
Received: from sidraya-laptopU ([203.201.61.238])
        by smtp.gmail.com with ESMTPSA id w26sm476509pfj.178.2021.09.13.20.40.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 20:40:43 -0700 (PDT)
Date:   Tue, 14 Sep 2021 09:10:37 +0530
From:   Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, prashanth.ka@pathpartnertech.com,
        praneeth@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 03/30] v4l: vxd-dec: Create vxd_dec Mem Manager helper
 library
Message-ID: <20210914034032.orctp5ov5oc33vag@sidraya-laptopU>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-4-sidraya.bj@pathpartnertech.com>
 <20210824133438.GO1931@kadam>
MIME-Version: 1.0
In-Reply-To: <20210824133438.GO1931@kadam>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset="US-ASCII"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 24, 2021 at 04:34:38PM +0300, Dan Carpenter wrote:
> On Wed, Aug 18, 2021 at 07:40:10PM +0530, sidraya.bj@pathpartnertech.com wrote:
> > +int img_mem_create_ctx(struct mem_ctx **new_ctx)
> > +{
> > +	struct mem_man *mem_man = &mem_man_data;
> > +	struct mem_ctx *ctx;
> > +
> > +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +
> > +	ctx->buffers = kzalloc(sizeof(*ctx->buffers), GFP_KERNEL);
> > +	if (!ctx->buffers)
> > +		return -ENOMEM;
> 
> Smatch would have caught that this needs a kfree(ctx); before returning.
> 
> It wouldn't hurt to run Smatch over this code.
> 
> git clone https://repo.or.cz/w/smatch.git
> cd smatch
> yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
> make
> cd ~/kernel/
> ~/smatch/smatch_scripts/kchecker drivers/staging/media/vxd/common/img_mem_man.c
> 
> (I am the author of Smatch  #BlowYourOwnTrumpet).
> 
> regards,
> dan carpenter
> 
I will run Smatch and will remove similar findings.
Thank you for reviewing. 

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
