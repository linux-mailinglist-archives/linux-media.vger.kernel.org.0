Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7321823E599
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 03:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgHGBuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 21:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHGBuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 21:50:37 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9E4C061574
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 18:50:36 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a26so408396ejc.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2020 18:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cD8jsk4+SBG8xPQfCCj2wmUpFVhawKwctfW4av5cjwU=;
        b=j7HC3Z5KWqeecaZcmC3YJkQ+9fE581GofeymgTxpCPrJdWE+UU1MMGXjGjBL3tQfy8
         537lS5kxtZrY9X0agbW+fq+ASnx+ufvq5xYa5fBh5z/aOOGPSrTa23sW4U1ceMrhFzSK
         J4cuZa2LhzUuuEnzgxPFjP4K8a/30hM5cSK5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cD8jsk4+SBG8xPQfCCj2wmUpFVhawKwctfW4av5cjwU=;
        b=pgCAYu90oDoQ5NiyoQkrf8V9ugkwfTfOplIMDzyO4TxGmx+F+d7nQMRujOUoM5NxiX
         mI0IyksWam7W+wX3lYQfSEnJmZYrxzNVT+WYPQSEvUuiV0p19gkhkjpXBWEzcXaxqmMW
         pfBM3j/utDL6KjkUoyhL/nw7eIQ23zijorwpq+7dXI4x//rEu8NUJCV2mk5c5opI7P88
         66HrWrOh/ViEAmjt4MNbB+Gkom/ZIOfBFBkucaPLsJPwqxsEv5z57bS6A0xCtLPjDoZ1
         dwlFN6ghr+6n08Kqo7N0hADM51FXHwIzDnRaqcXxzRSENhy/vqvrBeyioRRxj/YfnTpk
         aUlg==
X-Gm-Message-State: AOAM532QNxDY5jsI2ij4DkR9TAHtd4GqT8eFMv7D7FB9M9EZ1CRnHOs9
        qQKukzWaJCPo+3Zefih8UyFrtXOs8D+TMoIekVoEpA==
X-Google-Smtp-Source: ABdhPJw8niI7X7Sw8klc/4xbPNLsxrK/3t5hOTwIymbgO2pDc9aWiI0yYJOrcmGNz7OW7xrCLVM1Q6LDAFSnP9cYNMA=
X-Received: by 2002:a17:907:208e:: with SMTP id pv14mr7578996ejb.438.1596765034757;
 Thu, 06 Aug 2020 18:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200710144520.RESEND.1.Id0f52f486e277b5af30babac8ba6b09589962a68@changeid>
 <20200710070332.GA1175842@kroah.com> <CANMq1KDcKWgyYYP_m0-WV7602g7zUbU0PPkvwXxbSTF5vFfKGQ@mail.gmail.com>
In-Reply-To: <CANMq1KDcKWgyYYP_m0-WV7602g7zUbU0PPkvwXxbSTF5vFfKGQ@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 7 Aug 2020 09:50:23 +0800
Message-ID: <CANMq1KC7CgUT+neoOUZbnr8MbDgqEikqt2vn8dxAS1rpX=C2aA@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: atomisp: Replace trace_printk by pr_info
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devel@driverdev.osuosl.org, lkml <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 24, 2020 at 8:41 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Fri, Jul 10, 2020 at 3:03 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jul 10, 2020 at 02:45:29PM +0800, Nicolas Boichat wrote:
> > > trace_printk should not be used in production code, replace it
> > > call with pr_info.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > ---
> > > Sent this before as part of a series (whose 4th patch was a
> > > change that allows to detect such trace_printk), but maybe it's
> > > easier to get individual maintainer attention by splitting it.
> >
> > Mauro should take this soon:
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Mauro: did you get a chance to look at this? (and the other similar
> patch "media: camss: vfe: Use trace_printk for debugging only")

Mauro: Another gentle ping. Thanks.

> Thanks!
