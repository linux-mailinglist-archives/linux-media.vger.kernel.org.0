Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1B030932B
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 10:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhA3JUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 04:20:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:41276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231587AbhA3JSy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 04:18:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5644564E1C;
        Sat, 30 Jan 2021 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611996703;
        bh=5qOwQN/PFxVU1uCu0R3RYk3k2hOpa38gq0dwj1Z81BE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TI1i5vIhYih1DlnKYhKIpSDnAwXqVBMxqbGbe6y+D2hTDGqXz32titm9yMTzuL330
         Wc8fzibhZMFZJYMMkgDIdw6ZwyNwpKn19rOBRT3g0CBjClhtraDx/jrXd6nOFvHhJB
         2ihgq+Q5XO9MasDQPmhgyPlNx0QNj3bcyaH/uL6A=
Date:   Sat, 30 Jan 2021 09:51:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Emmanuel Arias <eamanu@yaerobi.com>
Cc:     m.tretter@pengutronix.de, kernel@pengutronix.de,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: allegro-dvt: Use __packed sentence
Message-ID: <YBUeG38fOvMkYgIp@kroah.com>
References: <YBRpstkOi685uHef@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBRpstkOi685uHef@debian>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 29, 2021 at 05:01:54PM -0300, Emmanuel Arias wrote:
> Fix coding style using __packed sentece instead of

Spelling check please?

And _why_ are you making this change, what does this do "better" than
the original?

thanks,

greg k-h
