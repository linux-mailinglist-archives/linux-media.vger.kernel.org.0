Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0AC12FC96
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 19:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgACSak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 13:30:40 -0500
Received: from mail-io1-f43.google.com ([209.85.166.43]:34615 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbgACSak (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jan 2020 13:30:40 -0500
Received: by mail-io1-f43.google.com with SMTP id z193so42152231iof.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2020 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7w3CGRigZmAN4SgW7NwYPByAaD+qPK2WMMXP2NJv+X4=;
        b=S8rzs/Wz25mL115xIU75ek07fAAxAFrm2xIQBGfKdzikspikf6rjofGVxJhzDxHOpI
         7catvOsTQyCVy4X0yEIz8UJlVYUr4Q7sqQv+IwHrbEIF8cj511n3AeyKGRr/0ESYGfC5
         DkR02yMkd7trMNfIeVFDcc4ljv5Ll65p9wmUk0dS6zPqe3XPA9qrqZuXLFK2zK7GjmfA
         XP5f7GU8+nhUaoBTZXQ9qW5amdRbnCZC3ZOf/iG7KAY+4mUVIcLmZVgKx5Ll70np/1Vz
         zzn1eSaVbj2iM28ha95wNWurV/49sqvLAcmOx9kXKELdNtyH13BLZe/4fIsrO9/vVdHk
         z45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7w3CGRigZmAN4SgW7NwYPByAaD+qPK2WMMXP2NJv+X4=;
        b=R8FpM1vw1EtG8qgH00zuFKZGvVxp2aZfqDiBNgfHkTodBJvj6BH99xNp2beJpS3kbU
         8eunsgpGObRR8I7+qqG3+56CYf1HqFXmLshj5ED8NwEmbVkHTw0bQnvOxGDWRblenIiD
         /8P7AeRWajgLzI1ZAA+GOFL/L8CT2cZatFGKTjMGtCxDf08FHEFR2Py9ReYMx+yKBCQy
         lCRHQMZ1LXeq3J/lkjZr/rPaBVD07ChxyvKhnPdjSI0/k3bXqf1Jiffwt9EFNqIsa5Oq
         503LkiKd81bkGCC1VsIQXi9MHDclGoi9TDJ7Et0NFSHNR0Asl1OZ9O3KOQiTfI94voDJ
         weFg==
X-Gm-Message-State: APjAAAVUZK3ECW6SMUM6P3BhIMGJnXEOKBESo76rtLLKzpjVcCCpGkts
        ooPKNVsLh1Z6Cc6SPyLJbINx9FK+efCQj7gWXseGDd6eD+8nMA==
X-Google-Smtp-Source: APXvYqyZ0UTCaOg9naR2MpDciFsivpsAOs8tsH3XGx5lSw8J7Rop33QY486kneXwN6lgdfNQ4lTZHgIrKn1lZzkuJWQ=
X-Received: by 2002:a5e:8f41:: with SMTP id x1mr62772060iop.113.1578076239132;
 Fri, 03 Jan 2020 10:30:39 -0800 (PST)
MIME-Version: 1.0
From:   Michal Zatloukal <myxal.mxl@gmail.com>
Date:   Fri, 3 Jan 2020 19:30:02 +0100
Message-ID: <CAKKZj2A2JZ43hkCAF3PMwLfpcSJmTgZGMG01zMgSAwaF-KahkA@mail.gmail.com>
Subject: Building own DVB-T channel file from frequencies (w_scan issues)?
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all.
I dusted off my old AF9015 no-name DVB-T stick (15a4:9016) to check
which stations I can receive (dissatisfied with IPTV). Seeing that the
package's channel list (provided by Ubuntu 19.10, version
0+git20171226.07b18ec-1) is outdated and/or incomplete, I wanted to
either run full channel scan, or just probe the frequencies of the
MUXes published by the local (and not-so-local[0]) operators. The
LinuxTV wiki only lists w_scan as a utility capable of scanning
without existing channel file (edit: shortly after typing up this
message, I came across dvbtune, where the wiki page suggests the tool
is outdated - is that tool supported or not?)

The problem I'm having is very similar to this debian bugreport [1].
As I understand it, w_scan is using NIT data in preference to the
actual frequency it used to receive said data. As a result, 1
frequency where another MUX [2] should be broadcast, is skipped in the
1st pass, and the original frequency is lost in the 2nd pass (522 ->
754 MHz), and another MUX (658 -> 834 MHz) is redirected to a
long-outdated frequency at the end of the spectrum, where the 2nd pass
finds nothing. [3] Score: 1/3 (expected) MUXes found.

Is there something that works like manual tuning in VLC, or NextPVR,
ie. enter frequency, bandwidth, and see if you get a signal + program
listing? (edit: dvbtune can do this apparently, though the format is
different from the normal channel list). Or perhaps an option to
w_scan to ignore NIT frequency if delta from scanning frequency is >
BW?

Thanks,
MZ

[0] <rant> On that note, I find the whole idea of
transponder-site-based channel lists weird. By one operator's own
maps, the range of a common 100kW tower is >100km, so I'm probably
within range of transponders from 3 other countries. Am I expected to
cat all applicable channel files from the package, or what?</rant>
[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?att=0;bug=788100
[2] I'm referring to what wiki calls "bouquet".
[3] Output below:
w_scan -ft -c sk
w_scan version 20170107 (compiled for DVB API 5.10)
using settings for SLOVAKIA
DVB aerial
DVB-T Europe
scan type TERRESTRIAL, channellist 4
output format vdr-2.0
WARNING: could not guess your codepage. Falling back to 'UTF-8'
output charset 'UTF-8', use -C <charset> to override
Info: using DVB adapter auto detection.
/dev/dvb/adapter0/frontend0 -> TERRESTRIAL "Afatech AF9013": good :-)
Using TERRESTRIAL frontend (adapter /dev/dvb/adapter0/frontend0)
-_-_-_-_ Getting frontend capabilities-_-_-_-_
Using DVB API 5.11
frontend 'Afatech AF9013' supports
INVERSION_AUTO
QAM_AUTO
TRANSMISSION_MODE_AUTO
GUARD_INTERVAL_AUTO
HIERARCHY_AUTO
FEC_AUTO
BANDWIDTH_AUTO not supported, trying 6/7/8 MHz.
FREQ (174.00MHz ... 862.00MHz)
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
Scanning DVB-T...
Scanning 8MHz frequencies...
474000: (time: 00:00.163)
482000: (time: 00:02.183)
490000: (time: 00:04.199)
498000: (time: 00:06.215)
506000: (time: 00:08.231)
514000: (time: 00:10.247)
522000: (time: 00:12.263)         signal ok: QAM_AUTO f = 522000 kHz
I999B8C999D999T999G999Y999 (0:0:0)
        QAM_AUTO f = 522000 kHz I999B8C999D999T999G999Y999 (0:0:0) :
updating transport_stream_id: -> (0:0:259)
        QAM_AUTO f = 522000 kHz I999B8C999D999T999G999Y999 (0:0:259) :
updating network_id -> (0:12290:259)
        updating transponder:
           (QAM_AUTO f = 522000 kHz I999B8C999D999T999G999Y999
(0:12290:259)) 0x0000
        to (QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:259)) 0x405A
530000: (time: 00:22.119)
538000: (time: 00:24.135)
546000: (time: 00:28.691)
554000: (time: 00:30.727)
562000: (time: 00:32.743)
570000: (time: 00:34.759)
578000: (time: 00:36.775)
586000: (time: 00:38.791)
594000: (time: 00:40.807)
602000: (time: 00:42.823)
610000: (time: 00:44.839)
618000: (time: 00:46.855)
626000: (time: 00:48.871)
634000: (time: 00:53.379)
642000: (time: 00:55.399)
650000: (time: 00:57.415)
658000: (time: 00:59.431)         signal ok: QAM_AUTO f = 658000 kHz
I999B8C999D999T999G999Y999 (0:0:0)
        QAM_AUTO f = 658000 kHz I999B8C999D999T999G999Y999 (0:0:0) :
updating transport_stream_id: -> (0:0:257)
        QAM_AUTO f = 658000 kHz I999B8C999D999T999G999Y999 (0:0:257) :
updating network_id -> (0:12544:257)
        updating transponder:
           (QAM_AUTO f = 658000 kHz I999B8C999D999T999G999Y999
(0:12544:257)) 0x0000
        to (QAM_64   f = 834000 kHz I999B8C23D0T8G4Y0 (8895:12544:257)) 0x405A
666000: (time: 01:00.127)
674000: (time: 01:02.151)
682000: (time: 01:04.167)
690000: (time: 01:06.183)
698000: (time: 01:08.199)
706000: (time: 01:10.215)
714000: (time: 01:12.231)
722000: (time: 01:14.247)
730000: (time: 01:16.263)
738000: (time: 01:18.279)
746000: (time: 01:20.295)
754000: skipped (already known transponder)
762000: (time: 01:22.311)
770000: (time: 01:24.327)
778000: (time: 01:26.343)
786000: (time: 01:28.359)
794000: (time: 01:30.375)
802000: (time: 01:32.391)
810000: (time: 01:34.407)
818000: (time: 01:36.423)
826000: (time: 01:38.439)
834000: skipped (already known transponder)
842000: (time: 01:40.455)
850000: (time: 01:42.471)
858000: (time: 01:44.487)
tune to: QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:259)
(time: 01:46.503)
        QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:259) :
updating transport_stream_id: -> (8895:12290:258)
service = TV JOJ (Towercom)
service = JOJ Plus (Towercom)
service = Prima Plus Promo (Towercom)
service = WAU (Towercom)
service = TA3 (Towercom)
service = otta - interaktivna sluzba (Towercom)
        QAM_64   f = 754000 kHz I999B8C23D0T8G4Y0 (8895:12290:258) :
updating network_id -> (8895:12289:258)
tune to: QAM_64   f = 834000 kHz I999B8C23D0T8G4Y0 (8895:12544:257)
(time: 02:00.703)
----------no signal----------
tune to: QAM_AUTO f = 834000 kHz I999B8C999D0T999G999Y0
(8895:12544:257) (time: 02:06.747)  (no signal)
----------no signal----------
(time: 02:12.791) dumping lists (5 services)
..
TV JOJ;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2102=2:2111=slo@3,2134=mul:2130:0:2001:8895:258:0
JOJ Plus;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2202=2:2211=slo@3,2234=mul:2230:0:2002:8895:258:0
Prima Plus Promo;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2302=27:2311=slo@17:0:0:2003:8895:258:0
WAU;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2402=2:2411=slo@3,2434=qaa:2431:0:2004:8895:258:0
TA3;Towercom:754000:B8C23D0G4M64T8Y0:T:27500:2502=2:2511=slo@3:0:0:2005:8895:258:0
Done, scan time: 02:12.791
