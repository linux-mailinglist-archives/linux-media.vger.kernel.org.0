Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4916215CB21
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 20:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgBMT0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 14:26:31 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35320 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgBMT0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 14:26:31 -0500
Received: by mail-pg1-f193.google.com with SMTP id v23so240099pgk.2
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oH47U6dVilmFVsgLaUcqMonw11ZBismPGb+DPyC9Qjw=;
        b=DXO4fw78ecATFY1qi1857mdha/eTvTl3CNuC5fuI6H2JM+CXb6/ZCOym3sxgVzPdMA
         EI7//m/LWCbvFiQJQh1O7c72nwkOvtg0bGeJvmVF+9uv5ZCyssMjVnR1IWy0fw39/NuK
         1PrexqGGkHRoMJ9kY0B3dQn0EhWWs4ZuxYCXnaNIc3+MkKPHdU+ufVh5X7fCr8BZCSGM
         /we/r2FwhBJFJ64mvlvP4ebliuFrCk2ZRvMZmAwM2b92V4PgMfcFEO5CdXvvH9H/Vbwy
         Y/aFKIYNni0475hVC0EaUbif6N3KO8hbL13rekzoj6DPy7RkOLXuUUVbHYfXUlDdnC1j
         DmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oH47U6dVilmFVsgLaUcqMonw11ZBismPGb+DPyC9Qjw=;
        b=N1sObPXETwE8GV+zw11VaKMOKoeIZUA304gOKCXdU62ar434vEEMfR1xwaG8GongNc
         wFYpDNqI6CZ/9JxkP8rkUR664Nd+CXr0FwOi518u95I4YeaGDS6ZsgKffOcziyCrXLPK
         kSuBCxtC4+B0ntAZuwy98Hq/pQEs8fHc+Aq5tgxwuz5PUUVHnHAQoynb1FLSDgRh/tU0
         t20Fwvwt4miELP0Oi8yLfySxTYH9jvu853xdHWOroDDe0F7FCuiPWhczfUZM1mYy65az
         QrsNPTIsOrjkr91GpqAXmv5EqVYfdFst7dneM3mec/wR5mOdDOST+cwCVyYqb7heVWGc
         lcvw==
X-Gm-Message-State: APjAAAUZg8D8uuTNvUTi7cuo4N9kUVTgFCzvPGELSQQ/PVsFaKGU1KZT
        TjAjxCV+ZEj8Jf6AiNpZgbwo6w==
X-Google-Smtp-Source: APXvYqwOR7c/DNAxOXKiWnEw00nczvKJ/1Zdi0Od8v7HRY7xMcRpoGaa+BxDISCHpCjw8BXko2JvUQ==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr19442029pgb.383.1581621990306;
        Thu, 13 Feb 2020 11:26:30 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w11sm4015613pgh.5.2020.02.13.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 11:26:29 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:26:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213192627.GA1455@tuxbook-pro>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213185305.GF50449@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:

> Hi Bjorn,
> 
> On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > 
> > > Hello,
> > > 
> > > Changes since v3:
> > > 
> > >   - addressed DT and DT schema review comments.
> > > 
> > >   - renamed DT schema file.
> > > 
> > > v3 can be found at [1].
> > > These changes depend on patch series [2] - [6].
> > > 
> > > Thanks,
> > > Dikshita
> > > 
> > 
> > Picked up the dts patches for 5.7, with Stan's acks
> 
> I can't seem to find the patches in the QCOM repo, neither in
> 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> maybe you forget to push these?
> 

Thanks for the question Matthias, I was looking for this email as I
rebased onto v5.6-rc1 earlier this week, but got distracted.

I pulled them in, but in the rebase I realized that we don't have the
interconnects in place, so in it's current form these patches doesn't
compile.

Seems we're waiting for rather trivial respin of
https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
to get this settled.

Regards,
Bjorn
