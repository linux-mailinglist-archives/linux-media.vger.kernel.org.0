Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD6313070A
	for <lists+linux-media@lfdr.de>; Sun,  5 Jan 2020 11:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgAEKZD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jan 2020 05:25:03 -0500
Received: from mail-io1-f41.google.com ([209.85.166.41]:33090 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgAEKZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Jan 2020 05:25:03 -0500
Received: by mail-io1-f41.google.com with SMTP id z8so45806437ioh.0
        for <linux-media@vger.kernel.org>; Sun, 05 Jan 2020 02:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oqfx7yzANjdi+/LXKB7YUnki5hFtBTYwyLEEfw1Qp8g=;
        b=NMOeD5+yWzUH0yGCsiYWhsdoLaudjw8mjwXt4gNZL01giVgHjMC+vYWE4AC7e05GDw
         /LaIrlqZ6CgmlB2wZRYr9iuSjMCPBgVp+GR8NY+HVGRdIxJY+pb+7rV1+7hX7i4+OMwZ
         zoEpJldcIQX7F855XHUbMclREOyza8w+hQAQEibO9WSvc3XlUl+meEZZnv74mgHv3S4E
         DbJ+BZ6d9KzsmG+VdMQbneLCONl1ugliYwW/4uI+X1LfBjrjOneHamco/tRrdzuDvhyn
         q6qRkeD44Fvs/KBrzWPLLXVoyxjfPctAlbTdiBerjiT/n6lXscrXxrqDoufSDJ/tT2lm
         OlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oqfx7yzANjdi+/LXKB7YUnki5hFtBTYwyLEEfw1Qp8g=;
        b=qkfy17dSwL9A85oNMw3n8vKTkvbHDipVffYBnpFU2RnDHz+fF1lrQTTN9em4w/00ru
         YKyvxMPg5H76K+PehJxcCq1fUD5EsHfEP//GxnfaAr9/HoGSyfoTAAR79kfGJFJfmW6B
         87KCXsbt1kBvNF1P8mK8hT/l4REbk27r5LSnmPm/XHgQxoZ1peV6IBjDGSvXGisFm2Ci
         Vlh6Y5STw30Vtzhcb/wXGUdVq8JguPpXTlWRPYL8U8z7UCp8QWXbkUwH6h2OCk2MzIVD
         5FzIpKI8Da75bQe+Z0yYVdO2JnGovCy+Qe70zES6xUDV1G4j0blUe/qM7JC2KZ8EaNKA
         Tjvw==
X-Gm-Message-State: APjAAAWaMM/sCexBQJ1eig/BG8/ojBBMX3KcAZFR5oa7HtkRc8ta+bGr
        wCUZgpDPyDXZxeCNZuimVZRHuxiqYkJaehtHwMQ=
X-Google-Smtp-Source: APXvYqyyDIQ60hWbaXuOAqkoy5amv9NV3UDr2zUC6C3j6wWPqiyOQtobBlcP2BVtXkFRdhrTmdgryRoJlZ389CNlLTM=
X-Received: by 2002:a05:6638:34e:: with SMTP id x14mr77746914jap.38.1578219902037;
 Sun, 05 Jan 2020 02:25:02 -0800 (PST)
MIME-Version: 1.0
References: <5E10AA68.13836.1D538E25@Frantisek.Rysanek.post.cz>
In-Reply-To: <5E10AA68.13836.1D538E25@Frantisek.Rysanek.post.cz>
From:   Michal Zatloukal <myxal.mxl@gmail.com>
Date:   Sun, 5 Jan 2020 11:24:26 +0100
Message-ID: <CAKKZj2CL+WcztAj4aM+Go7ghpPbUXUzL9VXx=COzumP0BQN=AQ@mail.gmail.com>
Subject: Re: Building own DVB-T channel file from frequencies (w_scan issues)?
To:     Frantisek Rysanek <Frantisek.Rysanek@post.cz>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the detailed response. I think I'll start with building
w_scan2 when I have the time, since Ubuntu (and by extension, Debian,
I assume) have none of the suggested tools (wirbelscan, w2_scan,
t2scan)

Regarding "managing to add other transponders by hand"  - how does
that work? Looking at the existing file, there are quite few fields
which I don't know the values for. Do you mean using one of the
zap/tune utilities?

MZ


On Sat, 4 Jan 2020 at 16:08, Frantisek Rysanek
<Frantisek.Rysanek@post.cz> wrote:
>
> ...just for the sake of completeness, t2scan seems to face some
> misunderstanding with my Mygica T230C2, w_scan2 works fine...
>
> [LOG SAMPLE of t2scan]
> Info: using DVB adapter auto detection.
>         /dev/dvb/adapter0/frontend0 -> TERRESTRIAL "Silicon Labs
> Si2168": very good :-))
>
> Using TERRESTRIAL frontend (adapter /dev/dvb/adapter0/frontend0)
> -_-_-_-_ Getting frontend capabilities-_-_-_-_
> main:2852: FATAL: FE_READ_STATUS failed: 121 Remote I/O error
> [/SAMPLE]
>
> Apparently, compared to w_scan and w_scan2, t2scan is more pedantic
> about checking the state of the tuner before starting its scan.
> And, I understand that these tuners have a fair share of their own HW
> quirks.
>
> I've already reported this to the author of t2scan.
>
> Frank
>
> On 3 Jan 2020 at 22:33, linux-media@vger.kernel.org wrote:
>
> > Hi Michal,
> >
> > first of all there's a fork called w_scan2:
> > https://github.com/stefantalpalaru/w_scan2
> > this has got me "unstuck" last summer when I was starting with T2 in
> > Linux. It still isn't perfect, has skipped some transponders in my
> > spectrum based on some false assumptions... (but I managed to add
> > them by hand, into an initial channel file for DVR).
> >
> > And even more recently, there's t2scan - whose author specifically
> > mentions that the first thing he "sorted out" was: he got away with
> > following the clues about "neighboring transponders in the DVB
> > network".
> > https://github.com/mighty-p/t2scan
> > I have yet to test t2scan, but the early reviews are positive.
> >
> > Another remake of the w_scan appears to exist in the VDR universe, in
> > the form of vdr-plugin-wirbelscan. This solves some format mismatch
> > between VDR and the stand-alone w_scan that previously used to cause
> > EPG malfunctions and whatnot... I've seen this one in action, half a
> > year ago. Worked like a charm.
> >
> > Yes I heartily agree - following those metadata/clues as a primary or
> > even valid source of info has IMO been wrong all along. Unless you're
> > a vehicle-mounted receiver, typically you won't ever see any other
> > transponders in the "network", because all you ever see is a single
> > transponder of any mux. At this moment (transition from T to T2),
> > there are about 9 different muxes in the air where I live. And, SFN's
> > are not a strict rule. Quite on the contrary, in our country, channel
> > frequencies are often (re)used for different networks/multiplexes at
> > different towers throughout the country... so, skipping a radio
> > channel "because you know there's just another transmitter of the
> > MUX=network you already know" is just plain wrong, it results in
> > skipping some frequencies that you really need to have scanned...
> > t2scan should finally take care of that for good.
> >
> > And I also agree that relying on an external "transponder seed file"
> > to even be able to scan the band feels counter-productive.
> > Fortunately it seems that the situation is improving.
> >
> > Looking back, in my notes, I have snippets of info of some route from
> > w_scan to dvb_tools (dvbv5-scan) to VDR... I recall observing erratic
> > behaviors along that route. In my VDR seed file, I got just a single
> > transponder written by w_scan2... I ended up writing about five other
> > transponders by hand, following the simple format. And then VDR's
> > wirbelscan plugin would pick up from there.
> > And right now I'm wondering why a freshly compiled VDR with a freshly
> > compiled wirbelscan plugin doesn't present me with a  choice to scan
> > the band again :-) Maybe I should erase the old channels.conf to
> > provoke the wirbelscan plugin into action, not sure...
> >
> > Frank
> >
> > P.S.: I'm sticking to English for obvious reasons - answering into a
> > mailing list. Feel free to contact me directly in our mother tongue
> > :-)
> >
> >
> > On 3 Jan 2020 at 19:30, Michal Zatloukal wrote:
> > > Hi all.
> > > I dusted off my old AF9015 no-name DVB-T stick (15a4:9016) to check
> > > which stations I can receive (dissatisfied with IPTV). Seeing that the
> > > package's channel list (provided by Ubuntu 19.10, version
> > > 0+git20171226.07b18ec-1) is outdated and/or incomplete, I wanted to
> > > either run full channel scan, or just probe the frequencies of the
> > > MUXes published by the local (and not-so-local[0]) operators. The
> > > LinuxTV wiki only lists w_scan as a utility capable of scanning
> > > without existing channel file (edit: shortly after typing up this
> > > message, I came across dvbtune, where the wiki page suggests the tool
> > > is outdated - is that tool supported or not?)
> > >
> > > The problem I'm having is very similar to this debian bugreport [1].
> > > As I understand it, w_scan is using NIT data in preference to the
> > > actual frequency it used to receive said data. As a result, 1
> > > frequency where another MUX [2] should be broadcast, is skipped in the
> > > 1st pass, and the original frequency is lost in the 2nd pass (522 ->
> > > 754 MHz), and another MUX (658 -> 834 MHz) is redirected to a
> > > long-outdated frequency at the end of the spectrum, where the 2nd pass
> > > finds nothing. [3] Score: 1/3 (expected) MUXes found.
> > >
> > > Is there something that works like manual tuning in VLC, or NextPVR,
> > > ie. enter frequency, bandwidth, and see if you get a signal + program
> > > listing? (edit: dvbtune can do this apparently, though the format is
> > > different from the normal channel list). Or perhaps an option to
> > > w_scan to ignore NIT frequency if delta from scanning frequency is >
> > > BW?
> > >
> > > Thanks,
> > > MZ
> > >
> > > [0] <rant> On that note, I find the whole idea of
> > > transponder-site-based channel lists weird. By one operator's own
> > > maps, the range of a common 100kW tower is >100km, so I'm probably
> > > within range of transponders from 3 other countries. Am I expected to
> > > cat all applicable channel files from the package, or what?</rant>
> > > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?att=0;bug=788100
> > > [2] I'm referring to what wiki calls "bouquet".
> > > [3] Output below:
> > > w_scan -ft -c sk
> > > w_scan version 20170107 (compiled for DVB API 5.10)
> > > using settings for SLOVAKIA
> > > DVB aerial
> > > DVB-T Europe
> > > scan type TERRESTRIAL, channellist 4
> > > output format vdr-2.0
> > > WARNING: could not guess your codepage. Falling back to 'UTF-8'
> > > output charset 'UTF-8', use -C <charset> to override
> > > Info: using DVB adapter auto detection.
> > > /dev/dvb/adapter0/frontend0 -> TERRESTRIAL "Afatech AF9013": good :-)
> > > Using TERRESTRIAL frontend (adapter /dev/dvb/adapter0/frontend0)
> > > -_-_-_-_ Getting frontend capabilities-_-_-_-_
> > > Using DVB API 5.11
> > > frontend 'Afatech AF9013' supports
> > > INVERSION_AUTO
> > > QAM_AUTO
> > > TRANSMISSION_MODE_AUTO
> > > GUARD_INTERVAL_AUTO
> > > HIERARCHY_AUTO
> > > FEC_AUTO
> > > BANDWIDTH_AUTO not supported, trying 6/7/8 MHz.
> > > FREQ (174.00MHz ... 862.00MHz)
> > > -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
> > > Scanning DVB-T...
> > > Scanning 8MHz frequencies...
> > > 474000: (time: 00:00.163)
> > > 482000: (time: 00:02.183)
> > > 490000: (time: 00:04.199)
> > > 498000: (time: 00:06.215)
> > > 506000: (time: 00:08.231)
> > > 514000: (time: 00:10.247)
> > > 522000: (time: 00:12.263)         signal ok: QAM_AUTO f = 522000 kHz
> > > I999B8C999D999T999G999Y999 (0:0:0)
> > >         QAM_AUTO f = 522000 kHz I999B8C999D999T999G999Y999 (0:0:0) :
> > > updating transport_stream_id: -> (0:0:259)
> > >         QAM_AUTO f = 522000 kHz I999B8C999D999T999G999Y999 (0:0:259) :
> > > updating network_id -> (0:12290:259)
> > >         updating transponder:
> > >            (QAM_AUTO f = 522000 kHz I999B8C999D999T999G999Y999
> > > (0:12290:259)) 0x0000
> > >         to (QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:259)) 0x405A
> > > 530000: (time: 00:22.119)
> > > 538000: (time: 00:24.135)
> > > 546000: (time: 00:28.691)
> > > 554000: (time: 00:30.727)
> > > 562000: (time: 00:32.743)
> > > 570000: (time: 00:34.759)
> > > 578000: (time: 00:36.775)
> > > 586000: (time: 00:38.791)
> > > 594000: (time: 00:40.807)
> > > 602000: (time: 00:42.823)
> > > 610000: (time: 00:44.839)
> > > 618000: (time: 00:46.855)
> > > 626000: (time: 00:48.871)
> > > 634000: (time: 00:53.379)
> > > 642000: (time: 00:55.399)
> > > 650000: (time: 00:57.415)
> > > 658000: (time: 00:59.431)         signal ok: QAM_AUTO f = 658000 kHz
> > > I999B8C999D999T999G999Y999 (0:0:0)
> > >         QAM_AUTO f = 658000 kHz I999B8C999D999T999G999Y999 (0:0:0) :
> > > updating transport_stream_id: -> (0:0:257)
> > >         QAM_AUTO f = 658000 kHz I999B8C999D999T999G999Y999 (0:0:257) :
> > > updating network_id -> (0:12544:257)
> > >         updating transponder:
> > >            (QAM_AUTO f = 658000 kHz I999B8C999D999T999G999Y999
> > > (0:12544:257)) 0x0000
> > >         to (QAM_64   f = 834000 kHz I999B8C23D0T8G4Y0 (8895:12544:257)) 0x405A
> > > 666000: (time: 01:00.127)
> > > 674000: (time: 01:02.151)
> > > 682000: (time: 01:04.167)
> > > 690000: (time: 01:06.183)
> > > 698000: (time: 01:08.199)
> > > 706000: (time: 01:10.215)
> > > 714000: (time: 01:12.231)
> > > 722000: (time: 01:14.247)
> > > 730000: (time: 01:16.263)
> > > 738000: (time: 01:18.279)
> > > 746000: (time: 01:20.295)
> > > 754000: skipped (already known transponder)
> > > 762000: (time: 01:22.311)
> > > 770000: (time: 01:24.327)
> > > 778000: (time: 01:26.343)
> > > 786000: (time: 01:28.359)
> > > 794000: (time: 01:30.375)
> > > 802000: (time: 01:32.391)
> > > 810000: (time: 01:34.407)
> > > 818000: (time: 01:36.423)
> > > 826000: (time: 01:38.439)
> > > 834000: skipped (already known transponder)
> > > 842000: (time: 01:40.455)
> > > 850000: (time: 01:42.471)
> > > 858000: (time: 01:44.487)
> > > tune to: QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:259)
> > > (time: 01:46.503)
> > >         QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:259) :
> > > updating transport_stream_id: -> (8895:12290:258)
> > > service = TV JOJ (Towercom)
> > > service = JOJ Plus (Towercom)
> > > service = Prima Plus Promo (Towercom)
> > > service = WAU (Towercom)
> > > service = TA3 (Towercom)
> > > service = otta - interaktivna sluzba (Towercom)
> > >         QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:258) :
> > > updating network_id -> (8895:12289:258)
> > > tune to: QAM_64   f = 834000 kHz I999B8C23D0T8G4Y0 (8895:12544:257)
> > > (time: 02:00.703)
> > > ----------no signal----------
> > > tune to: QAM_AUTO f = 834000 kHz I999B8C999D0T999G999Y0
> > > (8895:12544:257) (time: 02:06.747)  (no signal)
> > > ----------no signal----------
> > > (time: 02:12.791) dumping lists (5 services)
> > > ..
> > > TV JOJ;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2102=2:2111=slo@3,2134=mul:2130:0:2001:8895:258:0
> > > JOJ Plus;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2202=2:2211=slo@3,2234=mul:2230:0:2002:8895:258:0
> > > Prima Plus Promo;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2302=27:2311=slo@17:0:0:2003:8895:258:0
> > > WAU;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2402=2:2411=slo@3,2434=qaa:2431:0:2004:8895:258:0
> > > TA3;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2502=2:2511=slo@3:0:0:2005:8895:258:0
> > > Done, scan time: 02:12.791
> >
> >
>
>
