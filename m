Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B11115CB33
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 20:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgBMTed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 14:34:33 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52086 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgBMTed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 14:34:33 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so2817543pjb.1
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nUfkheJIghMNHD2cw8r6nBFU7H0TResTxkp5eL08reQ=;
        b=Zag+Nocpq/QP1R17TZfcAh/C2ektsQ+tpX9S7VwD9afHkZ7ByCqxRhehsj8DI2vwIk
         UvWmb9MOfA0i7dY42q0MLO5lUtDWZgerO2l4Z9ddHG+8Ot1GLLXpJ6mreXQ9TNkms7ie
         9i8Z4Z2bGQT5zRK0JP18zKHz6+1nelvI5v6Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nUfkheJIghMNHD2cw8r6nBFU7H0TResTxkp5eL08reQ=;
        b=E7WNpEcb1wSlVSi4E9FqVdA8cISthE/ic+sIsMHxsrEIv5OtC6A6EHS7RsABBdZXMC
         HVbHCAOSmSr3WHDbGpQ3XXXS+8Q+e+XksXa2BlKyA6VlIjJwn2gPEg+kNGPexZdaSJON
         orNrKS94Iq2eS1oo1d4Yt6/5FBwXW1kd8AIvmXVwS3Uj6SycOJhgGdpm3ykxZqkbcC5Z
         HE+yPuPnONlY4XRbNA56gjdUjjMe5RxUAwbseC7rwZ0AcU/LO27m6FvAkQI/m8KDtBG6
         LHTMzNRFmQZDNxGQXXuLW9CvQ7DwUphNQpnLh95/8TwoT5PJMvQ7suden3jcL43lqKNZ
         acnA==
X-Gm-Message-State: APjAAAXCvPXfEZqD9Z16GGAF3vRMhv3G8QbsrrfSZj6CSsb2dRJRgEaD
        TqPatZ7dTGQFcfIWOY9gIsE6tQ==
X-Google-Smtp-Source: APXvYqwsaliT2nemofJEfOxRJLQ1xQvumEmxILh1zgJ8lYiPxPy+4CycCbIjCD6iW3hSpAl6MYrKIg==
X-Received: by 2002:a17:90a:8a96:: with SMTP id x22mr6676707pjn.139.1581622472698;
        Thu, 13 Feb 2020 11:34:32 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z29sm4341344pgc.21.2020.02.13.11.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 11:34:31 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:34:30 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213193430.GG50449@google.com>
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

Now that you say it, I also stumbled across this at some point ...

> Seems we're waiting for rather trivial respin of
> https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
> to get this settled.

Thanks for the clarification!
