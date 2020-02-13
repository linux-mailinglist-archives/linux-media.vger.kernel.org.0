Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57BA15CB7F
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 20:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgBMT52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 14:57:28 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41827 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbgBMT52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 14:57:28 -0500
Received: by mail-pg1-f194.google.com with SMTP id 70so3668562pgf.8
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m1ZL+cG+Lhvx02V1ZHQxLgn/86YJrvrp+mo0irV6ra8=;
        b=nmkZ4Nzf/SJwqqzPOa3UEnycsRTHRVc4+sZQN4Jnsyha5149n6PwJuEtI/R/bl5aug
         F8XPHTMXPybUhqvB1JN1O+NnEk8Kg4dLOFiEkqPzbhA7P2767hWBaKa2ihxwawC0VA69
         Nif1EwOqVmG+4Vv9QR8dU+vV7O1ygMNo1Q3vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m1ZL+cG+Lhvx02V1ZHQxLgn/86YJrvrp+mo0irV6ra8=;
        b=fbDdxIQMQvvcYQGUgllucWF6GQdtvdse+2jNn0w4s3JzGrjb6PS0paMSp1BXmw8++X
         R1RMlk8rRDVk8Ct8os7jIKQ0r7CdEOhDircTfkTidOJJVp2XsfIG0g2nyyzmIuGRHBf2
         WrUFY76BeJdWMfGb7PNTDHYYa1J5SwRo4sqEOWxiDw1EUA/bClY07SX3vxjKnSl/pkMI
         mi5IFqo/iwF/zX8hyA9R3dMUI0a24z/VXnNEJ5TCBqUEOZS4CD7nKZ8+41BJwUAlnqp9
         +dLxAqDF7nONIf5vAjHhHnMEJYNJA+2iYJUuM84k82ePr7sV0vaZN4AFGxd5temNQnbw
         uEMQ==
X-Gm-Message-State: APjAAAUGpgGkK/Y2HnxRKp27D04flmwxbarltJ0PikqxoYIsbhzrpmwv
        zkmadva42SxuBdqQeRSTzuQ8e2c6nMo=
X-Google-Smtp-Source: APXvYqyWWS4urX6qPpv69y5a04RIC8pgtBfCtIoAnuGEK/H2aH6ENml9WKKE3GiT9io/ir2WYl8R0g==
X-Received: by 2002:a63:31d7:: with SMTP id x206mr15375581pgx.283.1581623847708;
        Thu, 13 Feb 2020 11:57:27 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b4sm3995718pfd.18.2020.02.13.11.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 11:57:26 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:57:25 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213195725.GH50449@google.com>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
 <20200213192627.GA1455@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200213192627.GA1455@tuxbook-pro>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 13, 2020 at 11:26:27AM -0800, Bjorn Andersson wrote:
> On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:
> 
> > Hi Bjorn,
> > 
> > On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > > 
> > > > Hello,
> > > > 
> > > > Changes since v3:
> > > > 
> > > >   - addressed DT and DT schema review comments.
> > > > 
> > > >   - renamed DT schema file.
> > > > 
> > > > v3 can be found at [1].
> > > > These changes depend on patch series [2] - [6].
> > > > 
> > > > Thanks,
> > > > Dikshita
> > > > 
> > > 
> > > Picked up the dts patches for 5.7, with Stan's acks
> > 
> > I can't seem to find the patches in the QCOM repo, neither in
> > 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> > maybe you forget to push these?
> > 
> 
> Thanks for the question Matthias, I was looking for this email as I
> rebased onto v5.6-rc1 earlier this week, but got distracted.
> 
> I pulled them in, but in the rebase I realized that we don't have the
> interconnects in place, so in it's current form these patches doesn't
> compile.
> 
> Seems we're waiting for rather trivial respin of
> https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
> to get this settled.

Hm, there has been no response to the comments in more than a month, also
the series depends on another ('Split SDM845 interconnect nodes and
consolidate RPMh support' https://patchwork.kernel.org/project/linux-arm-msm/list/?series=238831),
even though that isn't mentioned anywhere.

IIUC the interconnect configuration isn't strictly required to get the
video codec to work. I wonder if it would make sense to respin this
series to remove the interconnect properties. They could be added in a
separate patch after the ICC support has landed.

Dikshita/Bjorn, what do you think?
