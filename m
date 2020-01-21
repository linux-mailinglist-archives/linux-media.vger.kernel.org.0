Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE01D144103
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 16:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgAUPyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 10:54:08 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39835 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgAUPyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 10:54:07 -0500
Received: by mail-ua1-f67.google.com with SMTP id 73so1172092uac.6
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8QWfIEIdtn232zgfzNj4ZjFfvfLxT5XeORw3qCL8xU=;
        b=ptwpJXy8ClJDOLXhpRk9bq0yLC4VM4P/cyMMLOyjshgNdzobUcCVbymL7/ogTVGzPq
         c1PWX36gJz9XeH3eeozW4AuGuFwK4+yz28RcCsyVnrhT4BIRd3eDMjXP6LiXWohxnOwa
         6ZcMdXYJ8hJonWlsbS+fgTclFL0FRcLfHDheFKu4ce024LlKlyPAR6zHea5APDEB/m77
         pjXO5AoRGWDxF/vkcO38Dmt3OLof5wzeDAPf/mP5kYKhVuVOAdiABdZibv6f3NYnDNRi
         jKxWcbqnPlD+BnouJgtu4NlYBxXnUEROIM7L1PbHVzHSPmTBOUsLjxnoOwm1aJ0dJ0Um
         wnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8QWfIEIdtn232zgfzNj4ZjFfvfLxT5XeORw3qCL8xU=;
        b=YCI6sKN2q7E+rhHP2U4kznJ/Nq9+yyLIN+JMYWnUxNMb63IAOAhDrCJgRcIlkAU0h8
         AYOGeLIGhm5gNGcxRgwqt1sHtSHHgLwi5zdfYuBKXPLRwfyu2qJefBLzhNzMIkKkEw8x
         CwukqTmhqq1ZiAGwrmKSsjo/Q96oTl0oOdbpeybIiPZsb8g3DZ085W/brPmtuc03CEes
         lGgYZgmBAEukE/tGmWEp3mpDDnnE1nyBzX5sIdCBMow9Q8QAiyM2RhMWuDR/H+Sedgml
         jWELex0XK1XwDSXUx/9aFFhDVL0ewVfRZeHkJibtcNj2tB30Qd0qEp//yhmQ70PH4n9u
         yFCA==
X-Gm-Message-State: APjAAAVfuwELj+scvoImPxuY0FQzWcbs+42UHQ7QLc+0iCpZrmHMnU+L
        T0ZMx4jOjNoz+dNyCWPEPJAlugX0g585+XOn8NcO4CQ=
X-Google-Smtp-Source: APXvYqzI2XG9LXT0MpWLnUhOcCRBAR02+XmxTSoHo9TAvd/OmtA8y2m/tO+tg+VT1msZ+muTjRDPt2C0nDEv3nXKNJ4=
X-Received: by 2002:ab0:6954:: with SMTP id c20mr3213444uas.82.1579622046894;
 Tue, 21 Jan 2020 07:54:06 -0800 (PST)
MIME-Version: 1.0
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
 <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com> <5E26B74F.31588.1CB7D4B3@Frantisek.Rysanek.post.cz>
In-Reply-To: <5E26B74F.31588.1CB7D4B3@Frantisek.Rysanek.post.cz>
From:   camden lindsay <camden.lindsay+kernel@gmail.com>
Date:   Tue, 21 Jan 2020 07:53:55 -0800
Message-ID: <CABkW7JNd=Tu7m=X9RqCU2VfQB_M2CE6PQnq0onjR_+x-w78kdw@mail.gmail.com>
Subject: Re: ir-keytable segfault when writing keymap from file
To:     Frantisek Rysanek <Frantisek.Rysanek@post.cz>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 21, 2020 at 12:33 AM Frantisek Rysanek
<Frantisek.Rysanek@post.cz> wrote:

> Initially I was wondering if the format of the keytable file was
> correct for your version of ir-keytable (because I believe I've seen
> two different formats in the recent past) but looking at that stack
> trace, currently I'm wondering about two possible theories:
>
> a) either ir-keytable is using strlen (by calling strdup(), actually)
> in an unsafe way, trying to find a null character in a buffer that is
> not null-terminated for some reason
>
> b) or, avx2 sounds like something rather hot off the press. Sounds
> like the libc contains several versions of the strlen function and
> patches the fastest flavour in at runtime, depending on the hardware
> it finds itself running on. But... is this avx2-based strlen()
> variant the culprit here? Who knows... I am assuming that your CPU is
> capable of avx2 = that the CPU feature detection in libc works
> fine... And I'm assuming that strlen() is so ubiquitous throughout
> the user space, that it's hardly the culprit here. Your distro
> probably wouldn't be able to boot if this was the problem.
>
> Unfortunately I have no hard data :-) just guesses.
>
> Also, at a more superficial level, what distro is this? Arch? I don't
> know Arch, I'm conservative, most of my machines run Debian oldstable
> :-)  You seem to be using a pretty new kernel, that's why I'm asking.
> Not that the kernel would seem to be implicated in this misbehavior.
> But if you're using some bleeding-edge "rolling release", that might
> be a part of the explanation (= perhaps not as thoroughly tested as
> my favourite late-adopter relics).
>
> Frank
>

Hello, Frank-

CPU is
[kodiuser@kodiarch ~]$ grep "model name" /proc/cpuinfo | head -1
model name    : Intel(R) Core(TM) i3-6100U CPU @ 2.30GHz
[kodiuser@kodiarch ~]$

/proc/cpuinfo shows cpu is capable of it, i believe
[kodiuser@kodiarch ~]$ grep flags /proc/cpuinfo | head -1 | grep avx2
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx
f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single
pti tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust
bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap
clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln
pts hwp hwp_notify hwp_act_window hwp_epp
[kodiuser@kodiarch ~]$

Any pointers on how to check to see if the feature detection for that
is working correctly in libc?

Yes, this is Arch.  Problem was first noticed while running a slightly
older kernel, but don't know if that is the initial cause.  Did a full
upgrade before posting this bug (where it picked up the current
kernel).

Thank you for the input :)

c
