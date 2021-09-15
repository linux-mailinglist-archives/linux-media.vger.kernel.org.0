Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F15740C845
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 17:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234177AbhIOP0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 11:26:55 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:35461 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234154AbhIOP0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 11:26:55 -0400
Received: from shw-obgw-4002a.ext.cloudfilter.net ([10.228.9.250])
        by cmsmtp with ESMTP
        id QAaEm0gIcps7PQWn1mLQnL; Wed, 15 Sep 2021 15:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631719535; bh=vNttq5hlsSHzk/Ew370YHNVQdS2/TzX6r/8qh58AAYw=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=BJY0MmOc8G3fOq4I8JIbdVIO212sSPPhx1Ud7ZZDi4ypF1YTCm8LfFoxvqlgf6F7y
         /JP0P7iFsj2GQhfsm64dKhcJ/B0z2H4hBru2w7R51Gv3Zr3Gkug9ZaybksNHQNJLch
         g8VTtGP9Uc/X1ozY743Y+GedqYfFn2DXy3V1WelWeQILYhe9VCKZzbJcHXo8dpBC6S
         m59BlwIAE7ykUXVipb1+Rh4Kt7+el4c5a2uM+8/DDiMwsho9Re2nAoPuAoyfK7BFAD
         991Iv9IwoCUIY3irwXQYXtspWrZpb+U11rc1uReqixqzHpIeMjxy3F7gvq+bSaT9zD
         WlS8jU7l3IlbA==
Received: from [192.168.0.100] ([70.71.78.228])
        by cmsmtp with ESMTPA
        id QWn0mzU18xCNkQWn1muRM8; Wed, 15 Sep 2021 15:25:35 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Xe/qcK15 c=1 sm=1 tr=0 ts=6142106f
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=_Dj-zB-qAAAA:8 a=AWwpyIBXWYOj8_YovBAA:9
 a=QEXdDO2ut3YA:10 a=p2IOnBAzwV8vXciPbnnL:22 a=c-cOe7UV8MviEfHuAVEQ:22
User-Agent: Microsoft-MacOutlook/16.52.21080801
Date:   Wed, 15 Sep 2021 08:25:31 -0700
Subject: Re: [PATCH 03/11] edid-decode: change install directories for macOS
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <E7DEB50C-00AA-4C16-9A16-73E541E24F7A@shaw.ca>
Thread-Topic: [PATCH 03/11] edid-decode: change install directories for macOS
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-4-joevt@shaw.ca>
 <451f71d2-be72-9075-9c55-e456182eea5c@xs4all.nl>
In-Reply-To: <451f71d2-be72-9075-9c55-e456182eea5c@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4xfL8eELqS5tQgBoqVL0/4698HdGLkAriJPyUEJ17cNrYbAP6h+i8qjMaTCExBczrMnsrpdC/ziFSCh1LQI+VL9tQDvPPbnzeQ52eZs3KTXNK5LD6C57Dd
 j1sZYFUVZSAtf4m/gDWxZl72EKKESZS/0W8ragTzaKwSTJTC8t1xNmOUriipeOUfYm57wqeZPNuNzmqxROxiZ3yvkx4d8XZZeSneZlDSAgb7WZHXW3mL6Ykv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks. That last change was made because I don't like to do aligning betwe=
en lines that have different indents. That way you don't have to mix tabs an=
d spaces or worry about different tab widths used by different people using =
different editors.


=EF=BB=BFOn 2021-09-15, 3:06 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

    On 14/09/2021 14:11, joevt wrote:
    > In macOS, /usr/bin and /usr/share/man belong to root:wheel so install=
 to /usr/local/bin and /usr/local/share/man instead.
    >=20
    > Signed-off-by: Joe van Tunen <joevt@shaw.ca>
    > ---
    >  Makefile | 22 +++++++++++++++++-----
    >  1 file changed, 17 insertions(+), 5 deletions(-)
    >=20
    > diff --git a/Makefile b/Makefile
    > index 287b72d..adf6123 100644
    > --- a/Makefile
    > +++ b/Makefile
    > @@ -1,11 +1,23 @@
    > -bindir ?=3D /usr/bin
    > -mandir ?=3D /usr/share/man
    > +ifeq ($(OS),Windows_NT)
    > +	bindir ?=3D /usr/bin
    > +	mandir ?=3D /usr/share/man
    > +else
    > +	UNAME_S :=3D $(shell uname -s)
    > +	ifeq ($(UNAME_S),Darwin)
    > +		bindir ?=3D /usr/local/sbin
    > +		mandir ?=3D /usr/local/share/man
    > +	else
    > +		bindir ?=3D /usr/bin
    > +		mandir ?=3D /usr/share/man
    > +	endif
    > +endif
    > =20
    >  EMXX ?=3D em++
    > =20
    > -SOURCES =3D edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
    > -	  parse-displayid-block.cpp parse-ls-ext-block.cpp \
    > -	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
    > +SOURCES =3D \
    > +	edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
    > +	parse-displayid-block.cpp parse-ls-ext-block.cpp \
    > +	parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp

    This last change is a spurious change, I'll drop this and keep the rest=
.

    No need for you to do anything.

    Regards,

    	Hans

    >  WARN_FLAGS =3D -Wall -Wextra -Wno-missing-field-initializers -Wno-unus=
ed-parameter
    > =20
    >  all: edid-decode
    >=20



