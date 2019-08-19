Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 024D395166
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 01:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfHSXDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 19:03:47 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33382 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728821AbfHSXDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 19:03:44 -0400
Received: by mail-qk1-f196.google.com with SMTP id w18so2946744qki.0;
        Mon, 19 Aug 2019 16:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+fEhXc75dNFQQgm3SZ13Enj8uQKmSxtoS1Lo3ZXneE=;
        b=rz9uIxSnoZKv07hkZPuqNrU1Te5MlxtOHUtRy0Sv4q0vbLAJVcS8msAO0MYHyQhCTT
         2jp7Rf4JGKZTyvdbnGRxPxYBjwdgU7n7aMySM8xlbA8eTuIphBESaL7P3GN5+yNAo+Tz
         HVd5fD81tL93m5nXwKwrQQOdKOmT0bmMeRvx0+gOWrz6POEpsUKQsXMCtm0pZGvXYYHd
         ffLkPr5FwRnn/FpU9MbX0Lt33UpSVS6JUpI4e6t2NvRX0RaAD+Zl/60e6f1euW83QVuP
         3k/+hyqKTuuLTViu5TphXpEu8akNSNaQE2yc7USUW0I0mJLZD0wybO4D6+5l9xT65KUj
         Tjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+fEhXc75dNFQQgm3SZ13Enj8uQKmSxtoS1Lo3ZXneE=;
        b=c0/KXd4fpFUmG5nvoZbBT9lkTsyQmPEs+s0Z9oGQGuVvD6uImaZvYP1xXBaqBQMF73
         deHfAsUYsuRmv84B/gb1Jl8wcpKP7e2qMS75goTj+m3Yjm8sP2ZgtPl2HPqcWaXkiiqP
         +6eOMsd5g0ZYowqY9ro4hL04v5/sluNq2625lSe0MMHtANLjUmrWZHzthEA4hHP4xH2N
         r+30npEM9AtzwSarkm4McRi8X/GhOSdo0jrLFsxejJgOR00S0QwDWwP0MEA8QLG8Y08B
         s1tdzMdJDzpmuli0GmWICMPLbyqsJBtTRc1mX9bLy/I57LFuIYKqkeFRfe90lfUOnCtO
         lWkw==
X-Gm-Message-State: APjAAAUPkSk5bqqL7K51h7eFu8+GA5Xp1tomBSpt0bT42Qip55YX7hCX
        kxwTrYRw0NmMwXFDYpQxinmF9eTSraYUIv8Ytsh3meE69l4=
X-Google-Smtp-Source: APXvYqxZtSR7JnVQhywe7n0QCoJVtHfSeVwjuUQydCL5tLwB61QV+2eYNMFO/PAwALYCQr9+Kl3fQrZdTckW5iko988=
X-Received: by 2002:a37:454:: with SMTP id 81mr22303872qke.153.1566255823035;
 Mon, 19 Aug 2019 16:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
 <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc> <CALaQ_hqEZ-kco1esyB4mk0z9Q9Xt1XZsgYKR7gSdF7COERKoOA@mail.gmail.com>
 <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org>
In-Reply-To: <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org>
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Mon, 19 Aug 2019 18:03:35 -0500
Message-ID: <CALaQ_hrdCP+UhzvDSnWKJYuvxzhNAoKAF4GCN+do3v1-hjiDLg@mail.gmail.com>
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     shuah <shuah@kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>, sean@mess.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(resubmitting due to non "plain-text" causing virus bounce):

Hey Shuah, after these few days, I FINALLY completed bisecting... much
to my dismay...
It was my first foray into bisecting and it looked simple enough, but
for some reason every subsequent step resulted in a "bad" result.
*****
$ git bisect log
git bisect start
# good: [f0fae702de30331a8ce913cdb87ac0bdf990d85f] Linux 5.1.15
git bisect good f0fae702de30331a8ce913cdb87ac0bdf990d85f
# bad: [d36a8d2fb62c7c9415213bea9cf576d8b1f9071f] Linux 5.2.8
git bisect bad d36a8d2fb62c7c9415213bea9cf576d8b1f9071f
# good: [e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd] Linux 5.1
git bisect good e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd
# bad: [a2d635decbfa9c1e4ae15cb05b68b2559f7f827c] Merge tag
'drm-next-2019-05-09' of git://anongit.freedesktop.org/drm/drm
git bisect bad a2d635decbfa9c1e4ae15cb05b68b2559f7f827c
# bad: [82efe439599439a5e1e225ce5740e6cfb777a7dd] Merge tag
'devicetree-for-5.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect bad 82efe439599439a5e1e225ce5740e6cfb777a7dd
# bad: [78438ce18f26dbcaa8993bb45d20ffb0cec3bc3e] Merge branch
'stable-fodder' of
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect bad 78438ce18f26dbcaa8993bb45d20ffb0cec3bc3e
# bad: [275b103a26e218b3d739e5ab15be6b40303a1428] Merge tag
'edac_for_5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp
git bisect bad 275b103a26e218b3d739e5ab15be6b40303a1428
# bad: [0bc40e549aeea2de20fc571749de9bbfc099fb34] Merge branch
'x86-mm-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 0bc40e549aeea2de20fc571749de9bbfc099fb34
# bad: [007dc78fea62610bf06829e38f1d8c69b6ea5af6] Merge branch
'locking-core-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 007dc78fea62610bf06829e38f1d8c69b6ea5af6
# bad: [5ba2a4b12f450c5c69099a5c19671c6e59daa435] Merge branch
'core-rcu-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 5ba2a4b12f450c5c69099a5c19671c6e59daa435
# bad: [91df49e187c1a111e423fe0c3aec3472980385e4] Merge LKMM and RCU commits
git bisect bad 91df49e187c1a111e423fe0c3aec3472980385e4
# bad: [add0d37b4f1e77de7d170ece43c8d765572a1eab] rcu: Correct
READ_ONCE()/WRITE_ONCE() for ->rcu_read_unlock_special
git bisect bad add0d37b4f1e77de7d170ece43c8d765572a1eab
# bad: [da8739f23fadf05809c6c37c327367b229467045] rcu: Allow
rcu_nocbs= to specify all CPUs
git bisect bad da8739f23fadf05809c6c37c327367b229467045
# bad: [884157cef0acf05648fe921d80c680afababb428] rcu: Make exit_rcu()
handle non-preempted RCU readers
git bisect bad 884157cef0acf05648fe921d80c680afababb428
# bad: [671a63517cf983ad8eaa324167165cef245ab744] rcu: Avoid
unnecessary softirq when system is idle
git bisect bad 671a63517cf983ad8eaa324167165cef245ab744
# bad: [e85e6a21b2b5f31148cc3f2e785262b37c3e1ec7] rcu: Unconditionally
expedite during suspend/hibernate
git bisect bad e85e6a21b2b5f31148cc3f2e785262b37c3e1ec7
# first bad commit: [e85e6a21b2b5f31148cc3f2e785262b37c3e1ec7] rcu:
Unconditionally expedite during suspend/hibernate
*****
And those were ALL of the steps and I REALLY don't think that rcu
commit is the cause.

My testing went down something like this:
*****
$ git clean -xdf
$ git reset --hard
$ git checkout v5.1.15
$ git bisect start
$ git bisect good
$ git bisect bad v5.2.8
//edit "./drivers/media/usb/au0828/au0828-cards.c", adding my 0x400 tuner.
$ cat /proc/config.gz | gunzip > .config
$ yes '' | make oldconfig
$ make -j4
$ make modules_install
$ cp -v arch/x86/boot/bzImage /boot/vmlinuz-linux-bisect
$ mkinitcpio -k <kernel listed from modules_install command> -g
/boot/initramfs-linux-bisect.img
//reboot into newly compiled kernel (already set in
/boot/loader/entries/bisect.conf)
$ /w_scan-20170107/w_scan -c US //test tuner which results in "...
main:4004: FATAL: ***** NO USEABLE TERRCABLE_ATSC CARD FOUND. *****
...". Same issue with tvheadend and journalctl shows the Tuner is busy
error -19 message.
$ git bisect bad
$ make mrproper //necessary? Took forever to compile all 13 steps cleanly.
//GOTO "cat /proc/config.gz | gunzip > .config" step and repeat 13
times... ugh. About 2-3 hours for each.
*****

I don't know how bisecting does it's magic, but I'd think it'd be
something like this:
v............commits...........v //(from 5.1.15 to 5.2.8)
Good ||||||||||||||||||||||| Bad
                |                //split the commits
           |                     //split the bottom half if the
previous test failed
              |                  //split the difference again if good,
and repeat.

I'd think a more intelligent way to bisect would be based on a
file/module that is known/thought to produce the error.
In my case, the starting point would be "./drivers/media/usb/au0828/"
All commit changes for any file in that directory given a branch/tag
range would be examined.
If no changes are found in that branch/tag range, then the next step
would be to analyze any commits that are affected by parents/children
(references) of au0828 within that version range, and continually move
up/down the line. (eg. linux/usb.h which is referenced by au0828.h)
This way, the scope is very narrow at the beginning and widens as needed.
I think it's something that could be implemented in the git tool and
the user only needs to provide a starting place. Just a thought.

I can only hope that I incorrectly used bisecting and someone can
point to what I did wrong and provide a better way. (maybe I wouldn't
have to mrproper, so the testing wouldn't take days?)

On Mon, Aug 19, 2019 at 3:49 PM shuah <shuah@kernel.org> wrote:
>
> On 8/16/19 7:15 PM, Nathan Royce wrote:
> Hi Nathan,
>
> Just catching up with this thread. Let me know what you find. Can you
> build your own kernel and see what you can find?
>
> thanks,
> -- Shuah
