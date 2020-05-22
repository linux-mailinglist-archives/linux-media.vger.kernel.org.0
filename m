Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55E71DEE63
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 19:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbgEVRgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 13:36:53 -0400
Received: from mout.gmx.net ([212.227.15.19]:35025 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730572AbgEVRgw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 13:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590168963;
        bh=L8OHkKiGCB/f+IXGOvXlrA5dVZpPxKv0KWhPeCEfQiU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=BeLXgfkAIYebk7dPy/b/dHEAFaJjpOKqtoTzjnKVAW06ogNORfIBepC20GqIxMD4h
         zFf8XH+aqqUE9rOOAVt7tRhQ8iAzw1u9Fn/jzKYz3gz5wy76dVx5rnFmiyYWgXqG/8
         zS41n3XBx7P/lOPsGptgJBPdUEv4ekgyuFVGwTos=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([83.52.229.196]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MmULr-1jCEVO1rBh-00iRzC; Fri, 22
 May 2020 19:36:03 +0200
Date:   Fri, 22 May 2020 19:35:49 +0200
From:   Oscar Carter <oscar.carter@gmx.com>
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>, keescook@chromium.org,
        mchehab@kernel.org, clemens@ladisch.de, tiwai@suse.de,
        perex@perex.cz
Cc:     Oscar Carter <oscar.carter@gmx.com>,
        kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        levonshe@gmail.com, alsa-devel@alsa-project.org,
        stefanr@s5r6.in-berlin.de
Subject: Re: [PATCH 0/2] firewire: obsolete cast of function callback toward
 CFI
Message-ID: <20200522173549.GA3059@ubuntu>
References: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:FBWJEV1Z+urCsYOxGe/qn+1ueZnIfzXJgXzE4sYXx2E6pTYxzTv
 z+vuWi/c+ugAv7NWN04Ae5Py94IM94abNLP1X0yCKYKEFIpu63slErlj9Fhy71e4OHzYglB
 +lQqRKUx5IjQ07W1dZ28vMOnrvIxckwJzFlxHK/OLsyentYpWqqW6H0z/J+wo+Rho3M4EOR
 yy6Jf31X/2ADUl48LCMBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qQZnxhBV1OE=:rHKO2Cr/IEWABaxDAPPKV6
 o3uezfePqPg8YTDyafPdmkb+4ckMJPNxVRQkNHKzYeHo+Os6qkNQUSxxTHCmQFDhfBQb0jNHh
 BdBqwZG+aGRrCkMv5CdCwkQ/d4GyQt9bgCR4jlFZ3jv49X5MW7L0b7Dmpbpa8g1BZ6mcyNDVH
 JFRDJGUlEAZFnnpwaHhJCBD3LS5z+DD4ubbcGszKZYshC6FDJERTbifdP0VSzin5thJm4wMLl
 s+Pqk3W+LI/3M2B2Ot5cHoHa2TmxhrYXisqjRtZNNrvr2G9PUbJxPUV2jRf/9MlCz7zvtx7w2
 IhWpaXJbAvi/KoT2F5zMykbYL3rrOmkRqwmvw8cQZmEtJgUUIBZdOEgJU0WVGBTf4IQou6u8y
 yfBXCYXnSXmc7UqZn+Xr+wkFqRiBd4AEjqzDYOIMOOproICCTYf3XOvSuf+jdUXvW8nbbY3M9
 3lvNG0t8kNHp/P/0p5WO3EsA7AObaFik3wTY32uWwIJH4b8U4h7wbNSR+0TWc76+PLLSZWnnw
 WFpv4AzhWrXeSCXgpeabnNO9lDgc3aDUW3oMeIO8NTErhmEJztO/Md2W3YtHrt4rXPankumz9
 lMAQTUARY+TKYggs6JnZQrfRsmfP4N/6EjPWvVbp4Xi333kuxYEGyoMLu4yHcXZJHi4mAaihJ
 EfJyvM+pNSejc0KDT/mrCEuZ7ODbAXJsIo6FYU83i7jv+2kVtURdOgPdsTv3bgnC/9gU5Wo2p
 qO8l/TM+osXKI7V7SBWWh8XsBndANr8TxGGJ9SS4gFG2ZmV5cXw5KsganYsF0rT/b804BTW/p
 bL0mRLhw5i+gXNVqYUrA7hfSTNq83sw1cJHT6P6L+T+VHC6QLeQo1X+scEuKtTeQIL+A/zibh
 aikX9N2HOSiKma4BOujmTmP2sFZbygP3CmxmYE5oI1eg8fsxyzzT1fsM4MaKQ1VwueAxyPxv/
 QLQUlcvW09MYGaIgN2THxOeQSa8zuDJWMglQ19+o3DqtjSGi/H0BAtvukYx46jFOUu1kwDtTg
 ooprer23ED/ADxKx4B7Ym+/ptHya3yxwKz/9nJ1xPgCMd7p8bbbtKAnowRofqh5PdmFBWuryE
 sIkYM2rpcNAYV4c+6ui8wgVr9kWwnSx8bqUTEKF2biSG45/AE4bEItsUyOXejHsTjvmTSQZ4m
 opPsBqRorwR0fA0Y4Xif41sZWA/dty4A+hdK2FyzhaEC5O4xhBisLmMxCbRO/tAqcGH+ysXFZ
 ZmLIFobfRvFTtpOLP
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, May 20, 2020 at 03:47:24PM +0900, Takashi Sakamoto wrote:
> Hi,
>
> Oscar Carter works for Control Flow Integrity build. Any cast
> of function callback is inconvenient for the work. Unfortunately,
> current code of firewire-core driver includes the cast[1] and Oscar
> posted some patches to remove it[2]. The patch is itself good. However,
> it includes changes existent kernel API and all of drivers as user
> of the API get affects from the change.
>
> This patchset is an alternative idea to add a new kernel API specific
> for multichannel isoc context. The existent kernel API and drivers is
> left as is.
>
> Practically, no in-kernel drivers use the additional API. Although the
> API is exported in the patchset, it's better to discuss about unexportin=
g
> the API.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/firewire/core-cdev.c#n985
> [2] https://lore.kernel.org/lkml/20200519173425.4724-1-oscar.carter@gmx.=
com/
>
> Regards
>
> Takashi Sakamoto (2):
>   firewire-core: add kernel API to construct multichannel isoc context
>   firewire-core: obsolete cast of function callback
>
>  drivers/firewire/core-cdev.c | 44 +++++++++++++++++++-----------------
>  drivers/firewire/core-iso.c  | 17 ++++++++++++++
>  include/linux/firewire.h     |  3 +++
>  3 files changed, 43 insertions(+), 21 deletions(-)
>
> --
> 2.25.1
>
Thanks for your work and new proposal. I've done a test build an it cleans=
 the
-Wcast-function-type warning without the need to change the current API. S=
o, it
looks good to me.

Thanks,
Oscar Carter
