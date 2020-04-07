Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1208B1A1639
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgDGTv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:51:56 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]:39812 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgDGTvz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:51:55 -0400
Received: by mail-qv1-f45.google.com with SMTP id v38so2473320qvf.6
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=dR0mbD3+jCcDgPJSM1HPeiVY1tL93gJxFgbZI9Jl10s=;
        b=1qKuj+CQsFdu0S/dcw4TciuO/ws3JReNBv5JKib8hcJdOhTxhNXTvg7b/VFrEw8H+P
         syRmN0xOyRpK1eh4P/FFWhR25LhI1uRReSW9v4tph4MQxBqXVBpdbPldvAMxMUj4FMQu
         9jU6WLnLdpful1nvEejFYn1+xKrgq68tvBo4pjBQhojlVeTrZaaY1+YiVzckuzZYWZFb
         sD6+Z+JSPpFbrnsMOT9MerVkqtA7xsHKI8l0RE5I4BH/6D+LTIZtSdqi5UCIXLV+bthB
         g5Dollz0EH/D9rBScauC66L5jcjIhvQABX5TL4sGT6oFs5drG3TyPCQf5qSHwdQtn5JC
         WHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dR0mbD3+jCcDgPJSM1HPeiVY1tL93gJxFgbZI9Jl10s=;
        b=JhpFGc9MIw4zHl9NvUF35FEnReYk4t1hogzmEVDVGN5KTBFUP2WGRwgdggMt07JIft
         UNuUuYEQ04hwvE0XXcXb7H/0TK9wsWAMqQW/zSQNZ7kVfVgBzuEGtc6ViAvh2z9FoY4B
         Jq3zwiWfwZ3ZaPbt918C9wxmPY6d61nfaJAtHCz3hHGwwxwr4XW7KRtmjpfgvVWxgg0+
         pRn/8R9FeC6QUiDZ3Z8Z+LXBbuXPRG5Q0kQzguo5fCTQ9y0tJbwicWoM9ILMfcBT/9gb
         mfPXOYtK8mTL60HL7e3P6dCVqa8p+slL+cLPgy5z+9A0txVLWKYgxo4gRM/XYW+sodI+
         LYKA==
X-Gm-Message-State: AGi0PuYigKt3W58MCf58iQcBgUoitt0/Nu4WXrARLWDnZB+H/dcQGufQ
        yevsfcR7niYw1OXNLFxEHvbcIg==
X-Google-Smtp-Source: APiQypKYLRb3WFd77e8JXJR3o5PrTG4nhjECxPjI5gCmHbGnLJqbyllFlzTpo7pu0yvu/AC6BSTzjA==
X-Received: by 2002:a05:6214:1933:: with SMTP id es19mr3942541qvb.186.1586289113009;
        Tue, 07 Apr 2020 12:51:53 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id a18sm15865428qkc.117.2020.04.07.12.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:51:52 -0700 (PDT)
Message-ID: <8c082046f8ad9e7602b495fab466a759da6d3035.camel@ndufresne.ca>
Subject: Re: imx6: Cannot register mem2mem
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 07 Apr 2020 15:51:50 -0400
In-Reply-To: <CAOMZO5Bw=wowJntuWYA-h9s2nFvPRbkQVWadM4GcUdxWH2rWNw@mail.gmail.com>
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
         <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com>
         <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
         <CAOMZO5Ask2GF7fA=K6_RYF7138YEhsg4ERqvyS5SRt6jkh8QvQ@mail.gmail.com>
         <65b57718-a60e-66bf-61ba-348457fc524f@gmail.com>
         <CAOMZO5C95_G_Zeff2NRJZ4fxH29VfJP7B74H3h+bMp05WGF2Rg@mail.gmail.com>
         <CAOMZO5Bw=wowJntuWYA-h9s2nFvPRbkQVWadM4GcUdxWH2rWNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 06 avril 2020 à 18:26 -0300, Fabio Estevam a écrit :
> On Mon, Apr 6, 2020 at 4:39 PM Fabio Estevam <festevam@gmail.com> wrote:
> 
> > Nicolas,
> > 
> > I am using Gstreamer 1.16.2 on i.MX6 and cannot get the
> > v4l2video8convert to show up.
> > 
> > The mem2mem appears at /dev/video8 and it corresponds to i.MX6
> > ipu_ic_pp csc/scaler.
> > 
> > Any suggestions?
> 
> It seems that it shows up with v4l2convert instead of v4l2video8convert
> and it works fine:
> 
> gst-launch-1.0 videotestsrc ! video/x-raw,width=320,height=240 !
> v4l2convert ! video/x-raw,width=640,height=480 ! kmssink
> 
> So we are all fine then :-)

Yes, the first to be found "converter", even though the identification
of such converter is a bit bogus, will have the fixed name v4l2convert.
That's the different between 1.14 and 1.16. I've wondering if I should
kept an alias for this case, but we decided not to pollute the registry
with that. The argument was the video8 is not predictable. sometimes
just plugging some UVC camera, or a change in kernel timing will swap
the videoN nodes. Hope this is fine, for simple cases like Exynos and
i.MX6 that should work.

p.s. also, remember the registry is cached, it could not be impossible
that there still some potential cache stalls as tracking the movement
in /dev isn't very reliable.

> 
> Thanks

