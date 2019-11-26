Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC5DA10A111
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbfKZPRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:17:20 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:43525 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKZPRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:17:20 -0500
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVMuN-1iPy3M0KGt-00SOwi; Tue, 26 Nov 2019 16:17:19 +0100
Received: by mail-qt1-f181.google.com with SMTP id g24so14935877qtq.11;
        Tue, 26 Nov 2019 07:17:18 -0800 (PST)
X-Gm-Message-State: APjAAAWlOMxg2m1wJLcQko27lt+38k48KbL8bLdvzsH9Uizn7Id0gdZX
        vUQQsm5URLXWYZBpyic13JK9vSuDV3HKlBu5fUk=
X-Google-Smtp-Source: APXvYqzUEPEopV0Ugxt4XdWNrM2MToy3D7wA7iQbahz/Jhe6h/k32GzRehmUjTN89ZFA8HW1/BzHhS3cHxV+K7Tb4iA=
X-Received: by 2002:ac8:75c4:: with SMTP id z4mr34578070qtq.142.1574781437904;
 Tue, 26 Nov 2019 07:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20191111203835.2260382-1-arnd@arndb.de> <20191111203835.2260382-7-arnd@arndb.de>
 <d54c82b5-21b7-2d5e-ad0b-206527ad2768@xs4all.nl> <CAK8P3a0rom6x4X8eH0zknfZ5=6_rrXGKGR4H+RiY4SWKbXfp=g@mail.gmail.com>
 <2271665b-f890-802f-eba8-0da43867d81f@xs4all.nl>
In-Reply-To: <2271665b-f890-802f-eba8-0da43867d81f@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Nov 2019 16:17:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a35r0hEnjKOc8LQRr+v3xo-kxWQ5VhxZoT=tjQHcs4-yA@mail.gmail.com>
Message-ID: <CAK8P3a35r0hEnjKOc8LQRr+v3xo-kxWQ5VhxZoT=tjQHcs4-yA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ldv/hjNbpKdwPkiLXzdN7t4WpgL9yaZhcKpGj33mbaBNiYSRv4Q
 StRtpIBB9/pi3ejvSbBLBCi745/3H4jJgh13a/7VtNEjNLfQ6wK6axFrKOTX3Pq4PZ28hbP
 YDCV/8E/XD3kp0KhiseOV/obbKpGz3CX6s0mSStM1T5rjxiJQmI9ALAnCN/TC9qFUNVp6UZ
 gZFq1d5xn1lolGBkkmhhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nZyQ59IwBTU=:kOxMEcV4H2vu3HgF/yosIK
 kFYOdZvqdxff5HvQ7+Rr6G2+FFFmwQjCUrwIui2L6VgY5qr/AWRWPhQJ5thBvuL8+nSeVO79R
 nCp0HrnmR35fEhpp4Oab0FXY/EqNN66L5RGQeDn+XIFmdBH3zcGjdCq5P/knA3mc+1uctQvH8
 mQjbCk++171EUujLHoPTge8VfY4G4hKbAEMIJELRfqyoQqWAnCygjFeDhc3eKCUK9wtU81ZkD
 GqCFjD3nFG3Ejj3GwkhtAOoOHgKEIB8NoIKekxhDNmbB1cuvb1ET9FlgX4nqbltKP0f5OT3KB
 F46F4fPg31vzN24GV58hSy2ffLwYBAFZvn3uTVgqIzGVbmfWUKNUkzfL8312GARvgT22OWb9b
 PTK+tMK5PeN8BU3fe9JtT9nsnh7Fz653bRZx3q0adgrkcTBbPjCsFzENoh9anAuPX95gmbqO2
 qylvKPF+DXDCjYic6lrFBSE5S91hMkmisM1M6+WCHLyNgnu3utHoBlHng21MHIr1wWVnITaXT
 X8Q+P1z8FFNFmvMDjUDLKSA1zc0t1kwZLuajcJ0u+okEgeJG89QtdRmebw1wGmB4zynRnCWrD
 hQZUSSzpDKhIElSEQshRlyZAyi0z61jPhgCQiGOuLENoktg//YfaaZ2TobqBstzkRWcvReEam
 aG1WXKRguS5m5ipEof690diB5Q5i578HfiOmf3n/SMo26NeepTQCSaoBeBU9PIbhbsEMvJs1i
 Btskl0Kfu4dU6h0rYGvoB90oxBhb6dPeuJT5l7dUJ+nKOUibGxITus92kS+IERhGcfSlpvnnX
 QSa0hnZWYO9sZbDQt/sDA/gl/qg3/K1NAsb3xXCdPQz5WPd4DRxgcdQcit6VOPAUPSL4DS/BX
 MOeIrgzvUCkxeUoYGLMg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 26, 2019 at 3:15 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Then use that in the struct v4l2_buffer definition:
>
> struct v4l2_buffer {
> ...
> #ifdef __KERNEL__
>         struct __kernel_v4l2_timeval timestamp;
> #else
>         struct timeval               timestamp;
> #endif
>
> That keeps struct v4l2_buffer fairly clean. And it also makes it
> possible to have a bit more extensive documentation for the
> struct __kernel_v4l2_timeval without polluting the actual struct
> v4l2_buffer definition.

Yes, good idea. I've added this version now:

#ifdef __KERNEL__
/*
 * This corresponds to the user space version of timeval
 * for 64-bit time_t. sparc64 is different from everyone
 * else, using the microseconds in the wrong half of the
 * second 64-bit word.
 */
struct __kernel_v4l2_timeval {
        long long       tv_sec;
#if defined(__sparc__) && defined(__arch64__)
        int             tv_usec;
        int             __pad;
#else
        long long       tv_usec;
#endif
};
#endif

I briefly considered using #else #define __kernel_v4l2_timeval timeval
to avoid the second #ifdef, but went back to your version again
for clarify.

> The videodev2.h header is something users of the API look at a
> lot and having this really ugly kernel timestamp in there is
> not acceptably IMHO. But splitting it off should work.

Do you also mean moving it into a separate header file, or
just outside of struct v4l2_buffer? Since it's hidden in #ifdef
__KERNEL__, it could be moved to media/ioctl.h or elsewhere.

      Arnd
