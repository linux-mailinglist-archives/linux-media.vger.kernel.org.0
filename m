Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FA01DAA95
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 08:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgETGYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 02:24:14 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:59685 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725998AbgETGYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 02:24:14 -0400
X-Greylist: delayed 457 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 May 2020 02:24:13 EDT
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 4A81EC4E;
        Wed, 20 May 2020 02:16:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 20 May 2020 02:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=3XNYaKnp2YGCe91EplwF85srPK8
        6i5OIm/TZfO+r/A4=; b=boZgr2GGEoSCPOnQyY7adWYwLGs6cKNwB4tPIHroF9Q
        6nBi0D14HFNTaPEDK3mIToWgpFD/SoE7jIoA7nd1Ehuqfj2nkYSu+jP+xit2P2md
        XyTPT8i1+WR8EI2wlndxzZ0JCoY2jwiZnEzCWg0NvPuRyoDazEcAnX0KRzebYOeh
        EVRIWQ0WD1GjnazMVjqf/Ab6PxSId5ikiYxDPAipIlx+4a5HXOeE1cQFGijcK+4Z
        ro7MyN64kh82CxC5mgEKPkcegXkk23zwMsIVa12ZzhglXUSQa+C08eKEbhYQ3M8h
        svQd995a84sj/zPAqYjaoID1dZyUcdtTmLgXBJ1n/1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3XNYaK
        np2YGCe91EplwF85srPK86i5OIm/TZfO+r/A4=; b=kvz2/WezRA3U7KeAYIoye/
        GsK/JdQkFZfgnTnjy2U5r+nWxYV6BqcjDpSfSvImK33U8NDqHQjjWgIddB9ItzE5
        VQoDX9qFU83BCNZmvLoTQJxyRMkt/SBkeuaDt6CGdf22EfiLsSvhWCjXL0WoaOWk
        G5jP6/vgh7y54m0i6/oDos61fHKztdduCD99IIrEyuVmehl96QhRMEnhO2T+4zxM
        mrEi/nZR2z10IjvG0j3QEp6j/7Tf+5KyCS0BRWTIBwlN0LIkwsudGJ9r4vB+Kz9F
        mWRnnA6e+WTUa1SICCmLKb+BxjRygr+OCe+Nvn1RFo54RJDyhj0Q4OjeYX7twCiw
        ==
X-ME-Sender: <xms:PMvEXtybO761tUOfUtM1Uqz2bHplKGTEmVGoIF0G3kzcLSXeGp8BQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
    vedttdegteejkedvfeegfefhnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:PMvEXtQgL0xVSCOkaJchdgOBsjqZ2eLoEvsuUCzy-o2rOR9gqAeSCg>
    <xmx:PMvEXnXKX9pr1U5wgNkSMjZe8QCjXPg31XSMjzBCpwtmJubMfnKZXw>
    <xmx:PMvEXvi9bWn-4QBYxqXPK1RYyfQElyNhwIe9R9yz2xMB1_c_Ji2mjg>
    <xmx:QsvEXrtMztEFg7yl7BxqGmfpINuyC9xWvXo4xPA7p_oJD80NbveZlEi0-BA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp [180.235.3.54])
        by mail.messagingengine.com (Postfix) with ESMTPA id 42D9C3066434;
        Wed, 20 May 2020 02:16:26 -0400 (EDT)
Date:   Wed, 20 May 2020 15:16:24 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Oscar Carter <oscar.carter@gmx.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        alsa-devel@alsa-project.org,
        "Lev R . Oshvang ." <levonshe@gmail.com>
Subject: Re: [PATCH v2] firewire: Remove function callback casts
Message-ID: <20200520061624.GA25690@workstation>
Mail-Followup-To: Oscar Carter <oscar.carter@gmx.com>,
        Kees Cook <keescook@chromium.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        "Lev R . Oshvang ." <levonshe@gmail.com>
References: <20200519173425.4724-1-oscar.carter@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519173425.4724-1-oscar.carter@gmx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 07:34:25PM +0200, Oscar Carter wrote:
> In an effort to enable -Wcast-function-type in the top-level Makefile to
> support Control Flow Integrity builds, remove all the function callback
> casts.
> 
> To do this, modify the "fw_iso_context_create" function prototype adding
> a new parameter for the multichannel callback. Also, fix all the
> function calls accordingly.
> 
> In the "fw_iso_context_create" function return an error code if both
> callback parameters are NULL and also set the "ctx->callback.sc"
> explicity to NULL in this case. It is not necessary set to NULL the
> "ctx->callback.mc" variable because this and "ctx->callback.sc" are an
> union and setting one implies setting the other one to the same value.
> 
> Signed-off-by: Oscar Carter <oscar.carter@gmx.com>
> ---
> Changelog v1->v2
> -Set explicity to NULL the "ctx->callback.sc" variable and return an error
>  code in "fw_iso_context_create" function if both callback parameters are
>  NULL as Lev R. Oshvang suggested.
> -Modify the commit changelog accordingly.
> 
>  drivers/firewire/core-cdev.c        | 12 +++++++-----
>  drivers/firewire/core-iso.c         | 14 ++++++++++++--
>  drivers/firewire/net.c              |  2 +-
>  drivers/media/firewire/firedtv-fw.c |  3 ++-
>  include/linux/firewire.h            |  3 ++-
>  sound/firewire/amdtp-stream.c       |  2 +-
>  sound/firewire/isight.c             |  4 ++--
>  7 files changed, 27 insertions(+), 13 deletions(-)

I'm an author of ALSA firewire stack and thanks for the patch. I agree with
your intention to remove the cast of function callback toward CFI build.

Practically, the isochronous context with FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL
is never used by in-kernel drivers. Here, I propose to leave current
kernel API (fw_iso_context_create() with fw_iso_callback_t) as is.
Alternatively, a new kernel API for the context (e.g.
fw_iso_mc_context_create() with fw_iso_mc_callback_t). This idea leaves
current drivers as is and the change is done inner firewire-core driver,
therefore existent kernel API is not changed.

Later I post two patches for the proposal. I'd like you to review it and
I'm glad to receive your comments.


Regards

Takashi Sakamoto
