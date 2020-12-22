Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E318A2E0EAB
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgLVTPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgLVTPU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:15:20 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF784C0613D6;
        Tue, 22 Dec 2020 11:14:40 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AF267806F7;
        Tue, 22 Dec 2020 11:14:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net AF267806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608664480;
        bh=M5Opg5R/38DkRwnOgdlxD0B9jj1MfxC+605df+mJ9y0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ew1GhxxcyeI5UqiQoh9P4V+yGGrE9TOA+ZB/fGc/VpWZ8Fglsm6z44PYyx49FCHI2
         WXoowMLbDeHdvfw51KVjVk7K9SHI9NtoycPMYFqI+ccZWF1DIFAHQQ4PKeiuTDPmIG
         ukjUraBzf9y7PL1ny35Vb/vYoZPCa6BbJJ+JFG9I=
Date:   Tue, 22 Dec 2020 13:14:33 -0600
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Message-ID: <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 21, 2020 at 10:47:37PM CST, Joel Stanley wrote:
>On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> Instead of testing and conditionally clearing them one by one, we can
>> instead just unconditionally clear them all at once.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>I had a poke at the assembly and it looks like GCC is clearing the
>bits unconditionally anyway, so removing the tests provides no change.
>
>Combining them is a good further optimization.
>
>Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>A question unrelated to this patch: Do you know why the driver doesn't
>clear the status bits in the interrupt handler? I would expect it to
>write the value of sts back to the register to ack the pending
>interrupt.
>

No, I don't, and I was sort of wondering the same thing actually -- I'm 
not deeply familiar with this hardware or driver though, so I was a bit 
hesitant to start messing with things.  (Though maybe doing so would 
address the "stickiness" aspect when it does manifest.)  Perhaps Eddie 
or Jae can shed some light here?


Zev

