Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45BF63F51E9
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 22:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhHWURZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 16:17:25 -0400
Received: from mout.web.de ([212.227.15.3]:35221 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231377AbhHWURY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 16:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1629749797;
        bh=Hcg9gj7QbmnGiqotkFyybAzljUDNsZpHDuc4YWVtb/Q=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=kF9oqlsNrBpey3wPQoTBSmuT5eOTWWwQSz36uLxgqG0CmBPn/OdyTPLTHKgqY7/OA
         HB9/WWYpoUjgBODeezJcEYmkisBh/VAsWFLOBifPbekNmTPnsivker3S1a11btqK4J
         TI3yUkNrflvvzN/vAk658u3BfFe5GHqsTPtChlwE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.27] ([78.55.218.194]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Md4V8-1maTkE3ea2-00IGt1; Mon, 23
 Aug 2021 22:16:36 +0200
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
 <20210819133128.45ef4353@coco.lan>
 <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
 <20210822194709.4b9d33d4@coco.lan>
 <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
 <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
From:   Soeren Moch <smoch@web.de>
Message-ID: <04f2071d-e0fd-d7a2-2ddf-caa10662dfda@web.de>
Date:   Mon, 23 Aug 2021 22:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Provags-ID: V03:K1:NjPtixl4mkzBjLi5tW7bXDU3Gcc2jKNgl+LaLiCdPamLALtzq5J
 tU8Wb4+GMo7pMkwlJ6nIuZpm9/ZaHVUZ7PolMF8xwcUuZRKL+tWe2ztbrThIxajrOqGMKOA
 8udWWzWfymoU9E/dn0K3OoDwR4Xlk2KYVxtnH/jTV5TX+EV0Ax1hk5Pg863KOCFQ2omW+Wd
 F3iDazwO4s9U4z22BjDQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jHD/jojTxas=:0iDse52vSFJEEMGF6Xg+pm
 5g2EPR6pfFIdQ1CyAcrF90Rs3gEXYZmteLXlhBrRQJVshzOWPxFz/Zgz2wmiwktVm+4b54nRw
 5uPMskpIs4naEiRFSQnoGXJ7EuMn/7kjkwm3SVdQHDLdIyiQV7XsMXlN7jxedPxDJfRG0MYas
 0yV7PKw12GLxxjLd/9ZZI7UHhF5dSBNqAG8LJY7SqiBm6I+DIcE+oZi7l6Pd+UX0vSgXdhx9T
 /+z0j8OW+wTXKoc0JoHnzNNCChqJr3rtx2llUwjQqWbvufJJaqfKPfpznbmVgQVtieeSx0GEn
 Kp0GZJc80VU8UQcTCkUwAqYoc0rXRr7RycqXlMaJCR3b587WPEqXzFwBrQkqwoDTjl8lluMpN
 XjBwGNUWjMMZI6cK9Hcn+8QmV2zCxvoGhaTknMOuDVsrqcyBB7Q6GO+mQb2aJ8NjlJFQyir++
 eMffD1s5T0XF4036rjgKYjcQGlnoZ5Ee1Ia+0R+s/2iYCee9ZUjznL7r6YPxRRWgY6yroVApW
 u0tW1CqBkceJSd5sVO6LnZghNrwN6ExoSQL3Lm+w2UF3Aygq+bE5z+CEJ0QyWP+LE4Kk4acqR
 bq/CkPun0Whhzcw2Kuah+T27+sBMZKkrpsmmrc/r5c+mLRTttbV+pVzk2pL8sp7+YS7NxpxdU
 ymzJou0Q6k/4xW9A0eDcd1/LdCifG8Yb2POI0Z0BMyjosINv4/WcXcriMMRJO9Fv3XNpFlqPf
 sXqtHpM69Vy7ANxKOADVA5qXnup9yeh5PXYFQRuJGK7ZW2MBiyqzDn7u2B7ahkBVeylTtl9+3
 5ZznbO/MTf2tS7SIm2y4x0ZtRN9m1889pqvXXeFL6/95hPIQ5PRE2k6v28hJ07DHXmbeXFRcf
 nHhmXYZnchGQBB4rAS8trrTB7+rFHU+vz7b0spJLJ7jJr6jgDs5/PVQTCgXxN7eUBdApXdQY9
 rHYusEtmaTS6RWwuLQIiQo8ZGfAhEe1NAyWqIIOHvcna1g53qrE7ure+ShJ88mr5OtdvewPbt
 OhYTAYdHc7sXxdZ+FFQwm5x8DNkIHp7A69YolpdI7Q2GxV1fNdArPI8XPL3rwZodHj2PPl2B0
 EnU5r11AcbLQLWG6AM4Dh19DVYuT3BUJvG6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.08.21 18:58, Linus Torvalds wrote:
> On Mon, Aug 23, 2021 at 7:59 AM Soeren Moch <smoch@web.de> wrote:
>> Linus,
>>
>> Is what I described directly above the new linux maintenance policy?  O=
r
>> is linux media a private kingdom where the community should keep away?
>> Is this a place where the subsystem maintainer is on a mission to
>> destroy everything instead of maintaining and improving it? Please tell
>> me what I understood wrong here.
Thanks for your quick answer.
> So technically, the regression policy for the kernel is purely about
> the ABI - the _binary_ interface. That seems to not have broken - old
> programs continue to work.
OK, as long as the related driver lives at least in staging. Without the
driver of course the hardware and userspace will not work any longer
with new kernel versions.
> We very much try to discourage user space applications from using the
> kernel header files directly - even projects like glibc etc are
> supposed to _copy_ them, not include the kernel headers.
OK, thanks for pointing to this policy.
> Exactly because re-organization and changes to the kernel tree
> shouldn't be something that then causes random problems elsewhere that
> are so hard to test - and synchronize - from the kernel standpoint (or
> from the standpoint of the other end).
>
> That clearly doesn't seem to be the case in this situation. Which is
> annoying as heck.
>
> Mauro: there clearly _are_ users of those header files, and even
> apparently that one old driver out there. And those headers were in
> the 'uapi' directory, so while it is annoying how user space programs
> used them this way, I think it's also not entirely unreasonable.
>
> I have reverted the header file move. But I would also heartily
> recommend that whatever user program includes those headers (VDR -
> anything else?) should take snapshots of these specific kernel
> headers.
I will try to modify the related userspace accordingly, but it will take
time until this ripples through to distributions.
I'm not aware of other applications than VDR (especially 2 Plugins)
using these 3 header files.
> I'm not convinced that it makes sense to move the av7110 driver back
> from staging - it may continue to work, but it _is_ old and there is
> no maintenance -
It is old, but there are users out there - including me - that still use
such card and driver. I would be happy to maintain this driver, if I'm
allowed to do so. I already offered this for several years.

How long can this driver stay in staging? Would you move the driver back
from staging when I do proper maintenance for it? Is it normal linux
policy to remove drivers after a certain period of time, even if a
driver still has users and someone that volunteers to maintain it?
> and I would certainly suggest that any other
> out-of-tree driver that uses these old interfaces that nothing else
> implements shouldn't do so, considering that nothing else implements
> them.
The hardware of these so called full-featured DVB cards is very special.
It is a Satellite-/Cable-TV Set-Top-Box on a PCI/PCIe card. Since only
two generations of these cards exist (the first generation in many
variants), only two drivers implement the full DVB API. There are no
other drivers for similar hardware, nothing uses other APIs for this
type of hardware.

Given that all drivers for this type of hardware use the API in
question, would you accept the second driver for the second generation
of full-featured DVB cards (saa716x) [1] to be pulled into mainline linux?
> So the only thing I did was move the header files back, and mark that
> move to be backported to 5.13 stable.
Thanks for moving the header files back. In 5.13.12 the API files are
still there at the old position.

Best regards,
Soeren

[1] https://github.com/s-moch/linux-saa716x

