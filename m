Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B67BB9F0B1
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 18:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbfH0Qtz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 12:49:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37334 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbfH0Qtz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 12:49:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so19538682wrt.4
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cTWZg8V/nyymlJR3E//mmyQqhwBJxrXt8Jr0aqoADmE=;
        b=FhhxRsQPGDP8cvwdVOBV/Q9KECZ3/SS/9YKq05inESx1g26m12evZpvz33bgtVsHzL
         VG1RNdEvBrucRUnQu/rbk/mOJ861Nn65QbjsGtDGrl26YaoxVEYVg/bMpW0LBB3VRyUF
         7FIAKMW8qfwbrEhsg0U5s/svZcEFvdOYnjK4vRIz0m79Gd4eGSGLL2ElZ3HqRznqxDh6
         TWsW5mqfc+7HIY7PBnW6cxfhzt1oBfg6m3stTGMm7Sf9dOnPMmvTo1zld1JBYH3Be7Bd
         JSdvdLQS8NBmXzWKE/M9I4C4skhN584oNkcxlbUTmTNja/2WzQmE5S9XL3vahTL8kxoD
         2nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cTWZg8V/nyymlJR3E//mmyQqhwBJxrXt8Jr0aqoADmE=;
        b=R1ct5fTsbsI/JKXUnBnkc07YH2+7FQXDjrZos7ywEwCgK12GOntGObPWFLfKGlvJl/
         FaT3no19iPiOlBoWd7qHTJQYKkpquJOiexIGfcNJmXPfMuRgGSImKVHfWxcEO0DejXYD
         +ocMSXqiajMJAPZS/VwiUY2ojkvZxcdgPQnFf8p+B/Pit/uepCQARVuvRWyHmHhNvqxO
         6YW8/DHBjS1pcz8iBlonhGpqAllOElspe3sd8iE8NDt6jbIgDCGpcZZ3q2yh9zlB5LAR
         HMd7rXYaH0dkPqGDBEwySV6kfBPjrtik73kV9hHtSSkf8XdM74GTxQajur+wzXe4MO/7
         URPA==
X-Gm-Message-State: APjAAAUDrn+t86lXsWo7NG43nnIWtsUxWEi6D3RR5s2UIHd9FDuovZ+s
        ZMLytpUYta5x1ytUNqQDDe2e4HD8dLKfcd9Sag8=
X-Google-Smtp-Source: APXvYqwhu+nDWd5wv3vfAibIn57fAIF7Fqv68NxrQC67VUMvgRF2qYmnfo16w3ue4BWg7+neBFzlais7FnflOAwICII=
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr680185wrx.122.1566924592688;
 Tue, 27 Aug 2019 09:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <CADBDwkcKFGLQ_uv4U-gCTXeR09n3uz7dJt3OkufuR_4QsMb0AQ@mail.gmail.com>
 <20190826144014.02e0a85b@coco.lan> <CADBDwkdbeRPC9VWYqLUcw-As8d14EqhD3qpdjc4c43s4dS5Nsg@mail.gmail.com>
 <20190827100953.0e8dc268@coco.lan>
In-Reply-To: <20190827100953.0e8dc268@coco.lan>
From:   Olcay Korkmaz <olcay.krkmz@gmail.com>
Date:   Tue, 27 Aug 2019 19:49:41 +0300
Message-ID: <CADBDwkcPtEWA6nBFGwdQQn5USzxHNvvoczSY8sRBP1hnB6Y7hw@mail.gmail.com>
Subject: Re: bug: dvbv5-scan segfaults
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Olcay Korkmaz <olcay.krkmz@gmail.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 27 A=C4=9Fu 2019 Sal,
16:10 tarihinde =C5=9Funu yazd=C4=B1:
>
> Em Mon, 26 Aug 2019 22:25:28 +0300
> Olcay Korkmaz <olcay.krkmz@gmail.com> escreveu:
>
> > 1.14.2 and git tree build gives the same error
> > TS of entire transponder:
> > https://drive.google.com/file/d/1zHouZSlbPowyJY5tzT5ro0r4ciPURkbi/view?=
usp=3Dsharing
>
> Thanks!
>
> Please don't top-post.

old habit sorry.

>
> > > Em Mon, 26 Aug 2019 19:59:17 +0300
> > > Olcay Korkmaz <olcay.mz@gmail.com> escreveu:
> > >
>
>
> > > > Service TV8, provider TV8: digital television
> > > > Storing as channel TV8
> > > >
> > > > Program received signal SIGSEGV, Segmentation fault.
> > > > 0x00007ffff7ba5cff in dvb_store_channel ()
> > > >    from /usr/lib/x86_64-linux-gnu/libdvbv5.so.0
> > > > (gdb) backtrace
> > >
> > >
> > > > #0 0x00007ffff7ba5cff in dvb_store_channel ()
> > > >    from /usr/lib/x86_64-linux-gnu/libdvbv5.so.0
> > > > #1 0x00005555555560c6 in run_scan (dvb=3D0x55555575d2e0, args=3D0x7=
fffffffdc80)
> > > >     at dvbv5-scan.c:313
> > > > #2 main (argc=3D<optimized out>, argv=3D<optimized out>) at dvbv5-s=
can.c:562
>
> Ok, the problem is happening here:
>
> Program received signal SIGSEGV, Segmentation fault.
> dvb_store_channel (dvb_file=3D0x7fffffffe460, __p=3D0x5555555605d0, dvb_s=
can_handler=3D0x555555565060, get_detected=3D0,
>     get_nit=3D0) at dvb-file.c:1345
> 1345                    if (dvb_scan_handler->nit->transport) {
> (gdb) bt
> #0  dvb_store_channel (dvb_file=3D0x7fffffffe460, __p=3D0x5555555605d0, d=
vb_scan_handler=3D0x555555565060, get_detected=3D0,
>     get_nit=3D0) at dvb-file.c:1345
> #1  0x0000555555556847 in run_scan (dvb=3D0x5555555604f0, args=3D0x7fffff=
ffe4b0) at dvbv5-scan.c:313
> #2  main (argc=3D<optimized out>, argv=3D<optimized out>) at dvbv5-scan.c=
:562
>
> The enclosed patch should fix the issue. Could you please check?

Thanks, patch fixed the problem.
>
> diff --git a/lib/libdvbv5/dvb-file.c b/lib/libdvbv5/dvb-file.c
> index d077271a6546..474b59cb6fce 100644
> --- a/lib/libdvbv5/dvb-file.c
> +++ b/lib/libdvbv5/dvb-file.c
> @@ -1342,7 +1342,7 @@ int dvb_store_channel(struct dvb_file **dvb_file,
>                         dvb_log(_("Storing as channel %s"), channel);
>                 vchannel =3D dvb_vchannel(parms, dvb_scan_handler->nit, s=
ervice->service_id);
>
> -               if (dvb_scan_handler->nit->transport) {
> +               if (dvb_scan_handler->nit && dvb_scan_handler->nit->trans=
port) {
>                         network_id =3D dvb_scan_handler->nit->transport->=
network_id;
>                         transport_id =3D dvb_scan_handler->nit->transport=
->transport_id;
>                 }
>
>
> Regards,
> Mauro

Regards,
Olcay K.
