Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9820815CABB
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 19:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgBMSxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 13:53:08 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40355 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbgBMSxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 13:53:08 -0500
Received: by mail-pg1-f196.google.com with SMTP id z7so3584934pgk.7
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 10:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z5vHe2AowREqzAqOW6YaBuKUxPqz6MPlaKgwHeJebmE=;
        b=SY+Nz1MHBZwExWD4owfVmV3PKG8yw31q8mvMuM6QeqDDRkCgPfGDToBxCoXtzv381u
         Sx9OA5EBZVY/H1Uo5+oKZzHTqqH/JIXslPIK3cdn+q7Y+hFEI6WH4T6ux2goMg2iLmsd
         h6xM/VP8wbKEKFo6Pm9jYseBTiXldmQTfj/fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z5vHe2AowREqzAqOW6YaBuKUxPqz6MPlaKgwHeJebmE=;
        b=iA29YLfuDAIgIqSYbuOsl4+qQWqFBsbcukSrt5cMLyIFsRVA8lY2ZsywDSolyTuq9w
         eEwvF45F7kw9EPYFGdQ1kzglz1DyCfCaIIsxaCBFo3X0w0IalDKOqLx4mtMXyA5s6077
         3w1meI+JJRTyflr7rCeOydsxqLLo58YqPWSqnVP2Ou7BaRJKDGf290wXqqUeeO4ZmNi8
         xo24KM6jACQ2PQN1Nwu/tvkXxENE4ZYeGhljleLsu5ebITbXJfnDC99rJL+80iUD9tFg
         toWDrFtn+Rna3I3ywqEkV6N2BcOd//bnlys7vyijsiUHdhNL7LxeE6DW919oxJKgr4gk
         xDTA==
X-Gm-Message-State: APjAAAW0pmk2wOXmzpxB2h+677OzjShBzM3gZ0i6fyhdeycsAjwFfwzK
        epXSl0R/Ai/HZcwh6XHGC5Q6PA==
X-Google-Smtp-Source: APXvYqxHhXqcb5J9cFkzWat6D++pep33cBNsqaKAX+B6vNPEnsssomZ/y+j9r5yiKu81pnWzZrJ16w==
X-Received: by 2002:a63:c14b:: with SMTP id p11mr15832742pgi.290.1581619987489;
        Thu, 13 Feb 2020 10:53:07 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s14sm3897124pgv.74.2020.02.13.10.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 10:53:06 -0800 (PST)
Date:   Thu, 13 Feb 2020 10:53:05 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213185305.GF50449@google.com>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203180240.GD3948@builder>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bjorn,

On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> 
> > Hello,
> > 
> > Changes since v3:
> > 
> >   - addressed DT and DT schema review comments.
> > 
> >   - renamed DT schema file.
> > 
> > v3 can be found at [1].
> > These changes depend on patch series [2] - [6].
> > 
> > Thanks,
> > Dikshita
> > 
> 
> Picked up the dts patches for 5.7, with Stan's acks

I can't seem to find the patches in the QCOM repo, neither in
'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
maybe you forget to push these?

Thanks

Matthias
