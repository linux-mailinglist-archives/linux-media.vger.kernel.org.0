Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687E715CBC1
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 21:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgBMUMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 15:12:51 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40997 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgBMUMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 15:12:50 -0500
Received: by mail-pf1-f195.google.com with SMTP id j9so3608154pfa.8
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 12:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Em2FaAYttibjTQlPuyOTgle0cIehhPkcJObsB7mmxQ4=;
        b=UUEAaBo8QzHRBzSTg5vwmEwtBZHIqo8GM6h67erAyXq9FaDWBAU6ir6JHFm5b5diIV
         HGWsJNDUrBMq8XkvSBRBNdSSnVo7QRrvOMGbMi4++YLam3x4bpheUpxPqL0nIVQiGhM5
         wFBYyGzAdq57vTFYJhluzz5kWAZTiuunHzIg4nV6XVmMowY494/FBW7F+k7invAvbZ0u
         349HgFlf3nLnrDlGAeeclZeyHNlXZAVUx2AJjjZQ8m74wI1MglsOpM3/jwU+jMgBt49d
         KKo78LddH450ayeAYP+lbVv7jKVJwUjYpvPpYqdDXM4aBjH7FlHFOH+2XRGqs9w9YhTy
         sGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Em2FaAYttibjTQlPuyOTgle0cIehhPkcJObsB7mmxQ4=;
        b=iO8A3OjZOO7zTaclOYKs1Rs17uVC6JFXeI0gA2el6B2czVH7tG0t6O03XYQXSl0NhR
         eBY85MD5FBKZNKgpxAXnQ48nPKtBHy9tnjUd5zitxzV3kFgS/qrFppiwC9zgJ33gQo0S
         pI13PR7CLhD8q4P1066u3RDsk0U29MaKF3RnnLvs8oX77oJnRGJM1GI4CbDE6h6869qj
         BHww//TqiUEC13lRyvzEGVkQE+63eDuN5LVGO3uSWEVuW42KGRZ4s2w33lHkDb1IMTJt
         tB7s1JPALg7CbmL5n1NufaCRAOaHWYpfAc3Q3p/HAMDCjXBKF5RHg1YzhdA3DNK7gq9B
         QXYg==
X-Gm-Message-State: APjAAAXo0oFM/ToaCh6exB04veTNSh/GvMVEGnz2eT7/R0Mouf4wxPgd
        w4HjMWhrpIVaIAh+4n8Tbg1FIw==
X-Google-Smtp-Source: APXvYqz6C2//bSkNXWpg1QFzaCdhtdkUlSkJBK805RDsjAufMVdJhjl5udMwJOsTXCI9bhdi8VtmPg==
X-Received: by 2002:aa7:8703:: with SMTP id b3mr14998134pfo.67.1581624769948;
        Thu, 13 Feb 2020 12:12:49 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u23sm3988269pfm.29.2020.02.13.12.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 12:12:49 -0800 (PST)
Date:   Thu, 13 Feb 2020 12:12:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213201247.GQ3948@builder>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
 <20200213192627.GA1455@tuxbook-pro>
 <20200213195725.GH50449@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213195725.GH50449@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 13 Feb 11:57 PST 2020, Matthias Kaehlcke wrote:

> On Thu, Feb 13, 2020 at 11:26:27AM -0800, Bjorn Andersson wrote:
> > On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:
> > 
> > > Hi Bjorn,
> > > 
> > > On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > > > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > > > 
> > > > > Hello,
> > > > > 
> > > > > Changes since v3:
> > > > > 
> > > > >   - addressed DT and DT schema review comments.
> > > > > 
> > > > >   - renamed DT schema file.
> > > > > 
> > > > > v3 can be found at [1].
> > > > > These changes depend on patch series [2] - [6].
> > > > > 
> > > > > Thanks,
> > > > > Dikshita
> > > > > 
> > > > 
> > > > Picked up the dts patches for 5.7, with Stan's acks
> > > 
> > > I can't seem to find the patches in the QCOM repo, neither in
> > > 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> > > maybe you forget to push these?
> > > 
> > 
> > Thanks for the question Matthias, I was looking for this email as I
> > rebased onto v5.6-rc1 earlier this week, but got distracted.
> > 
> > I pulled them in, but in the rebase I realized that we don't have the
> > interconnects in place, so in it's current form these patches doesn't
> > compile.
> > 
> > Seems we're waiting for rather trivial respin of
> > https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
> > to get this settled.
> 
> Hm, there has been no response to the comments in more than a month, also
> the series depends on another ('Split SDM845 interconnect nodes and
> consolidate RPMh support' https://patchwork.kernel.org/project/linux-arm-msm/list/?series=238831),
> even though that isn't mentioned anywhere.
> 

Sibi is revisiting David's 845 series, so my expectation is that it will
land in this cycle.

> IIUC the interconnect configuration isn't strictly required to get the
> video codec to work. I wonder if it would make sense to respin this
> series to remove the interconnect properties. They could be added in a
> separate patch after the ICC support has landed.
> 
> Dikshita/Bjorn, what do you think?

That sounds likely. Dikshita, can you confirm that we can just omit the
interconnect lines from the patch and I'll just apply the patches again
without these (and you can follow up with adding interconnects later).

Regards,
Bjorn
