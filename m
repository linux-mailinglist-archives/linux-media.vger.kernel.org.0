Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBF51F95FF
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 14:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729871AbgFOMDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 08:03:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:33582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729868AbgFOMDv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 08:03:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4B6A20707;
        Mon, 15 Jun 2020 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592222631;
        bh=XoBnvNL3IwkQfinlN0LrO1MNHrk5mCT79HFTYI53ohk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0wIy0VF1JN/2qnd7BSCw6Nk50NGZg/5E2YaZDEAVVbtQvQWZzkVFAq+17gq90X7k2
         lQ2S1MuhzKk15zA072FNS8nVofGmED+3kyS419EOBYOfTsMGUNkSJABo+RzITXvFOE
         knJ/AZB9eo3vBs9jTXzoLVRmtkbqggIj9JtpVj5c=
Date:   Mon, 15 Jun 2020 14:03:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/3] venus: Make debug infrastructure more flexible
Message-ID: <20200615120337.GA511582@kroah.com>
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
 <20200613223919.7038-3-stanimir.varbanov@linaro.org>
 <20200614063710.GB2611869@kroah.com>
 <c54a12a2-7f92-105c-a01c-8e85730f36bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c54a12a2-7f92-105c-a01c-8e85730f36bb@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 15, 2020 at 12:55:29PM +0300, Stanimir Varbanov wrote:
> Hi Greg,
> 
> On 6/14/20 9:37 AM, Greg KH wrote:
> > On Sun, Jun 14, 2020 at 01:39:18AM +0300, Stanimir Varbanov wrote:
> >>  	if (slot == -1) {
> >> -		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
> >> +		VDBGH("no free slot for timestamp\n");
> > 
> > Again, no, you just lost a lot of valuable information by changing to a
> > different format (like driver, specific device, etc.).  Please don't do
> > this, it just makes the information less than before.
> 
> OK, one of the reasons to use pr_debug inside VDBGH macro is to avoid
> having struct device *dev variable in every function with dev_dbg even
> when the function doesn't use it.

But the function _is_ using it, as you are referring to the device that
is being controlled by the driver.  That's the point, you are stripping
off that very valuable information for no reason.

Which means to me that you never really actually _NEED_ these debugging
messages, as you have not used them to see if it provides you with
something that can tell you something about something.

So, let me push harder, why do you even want this message at all?  What
can it provide you now that the driver is up and working properly?

> Are you fine with s/pr_debug/dev_dbg in VDBGX macros?

I would be a bit happier yes, but the fact that you didn't use it means
you aren't even looking at these messages, which implies that it isn't
even needed.

So, how about just stripping all of these debugging messages out
entirely?  What do they provide that you don't already know?  Who would
use them?

thanks,

greg k-h
