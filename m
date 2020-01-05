Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE58C1308D4
	for <lists+linux-media@lfdr.de>; Sun,  5 Jan 2020 16:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgAEPkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jan 2020 10:40:52 -0500
Received: from mxa2.seznam.cz ([77.75.76.90]:36258 "EHLO mxa2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgAEPkw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 5 Jan 2020 10:40:52 -0500
Received: from email.seznam.cz
        by email-smtpc3b.ng.seznam.cz (email-smtpc3b.ng.seznam.cz [10.23.13.75])
        id 52bb42f98500fb9c52135c3e;
        Sun, 05 Jan 2020 16:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1578238849; bh=5Yjf3YAbWSOuikdM9O5//wkqVI9wEY6NCXInlyuz/sI=;
        h=Received:From:To:Date:MIME-Version:Subject:CC:Message-ID:Priority:
         In-reply-to:References:X-mailer:Content-type:
         Content-transfer-encoding:Content-description;
        b=KfT2KrgbywSVv1qpD8E63zBPAnm/QtiT0GYzMAvMF4DwPiYjf17QbouShnQu5GOCt
         KU748RxgdQxlWEMkPKQ3+rZWyE+9J4VyOXFbdbPAL5nGQWK/w3H64JORNimZH2pq/t
         AZg7fcyua6gzaSF5dwoJ90GlIPFD6VuTjyUq6vwo=
Received: from [192.168.12.172] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay29.ng.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Sun, 05 Jan 2020 16:40:45 +0100 (CET)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Sun, 05 Jan 2020 16:40:43 +0100
MIME-Version: 1.0
Subject: Re: Building own DVB-T channel file from frequencies (w_scan issues)?
CC:     Michal Zatloukal <myxal.mxl@gmail.com>
Message-ID: <5E12037B.6074.229780F7@Frantisek.Rysanek.post.cz>
In-reply-to: <CAKKZj2CL+WcztAj4aM+Go7ghpPbUXUzL9VXx=COzumP0BQN=AQ@mail.gmail.com>
References: <5E10AA68.13836.1D538E25@Frantisek.Rysanek.post.cz>, <CAKKZj2CL+WcztAj4aM+Go7ghpPbUXUzL9VXx=COzumP0BQN=AQ@mail.gmail.com>
X-mailer: Pegasus Mail for Windows (4.73.639)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5 Jan 2020 at 11:24, Michal Zatloukal wrote:
> Thanks for the detailed response. I think I'll start with building
> w_scan2 when I have the time, since Ubuntu (and by extension, Debian,
> I assume) have none of the suggested tools (wirbelscan, w2_scan,
> t2scan)
> 
> Regarding "managing to add other transponders by hand"  - how does
> that work? Looking at the existing file, there are quite few fields
> which I don't know the values for. Do you mean using one of the
> zap/tune utilities?
> 
> MZ

Hello Michal,

at the moment i strongly suggest that you download t2scan:
  git clone https://github.com/mighty-p/t2scan.git

If you happen to have the Mygica T230C v2 AKA Evolveo Sigma T2,
you would need the aforementioned mod. 
If you have different hardware, you can use the vanilla t2scan. Note 
that if your receiver is DVB-T only, it will not find DVB-T2 
transmitters.


So until mighty-p updates his upstream, I need the following mod for 
my Mygica hardware: I need to comment out the two "offending" lines 
in scan.c = lines 2852 and 2851 this way:

if (ioctl(frontend_fd, FE_READ_STATUS, &fe_status) == -1) {
	//cleanup();
	//fatal("FE_READ_STATUS failed: %d %s\n",errno, strerror(errno));
}

You can actually remove the whole block, as the transaction that 
actually throws the (benign) error consists in the 
ioctl(FE_READ_STATUS).
I.e. remove the offender, rather than the messenger :-)
The actual substance of the problem in 
drivers/media/dvb-frontends/si2168.c is not entirely clear to me, 
seems to come up in the first call to si2168_cmd_execute() from 
si2168_read_status(), and the -EREMOTEIO is likely triggered by the 
si2168 front-end chip returning an error flag in response to that I2C 
request... possibly returns this error until a tuning has actually 
happend or some such.
The point is that the scanning activity works fine after that, 
including further calls to read_status() in the process :-O

So, with the mod, t2scan has returned a full channels.conf for VDR. 
I just copied that to /var/lib/vdr/ as that's final the format that I 
am after.


Historical notes:

Apparently, w_scan/w_scan2 can produce different output formats, 
including "dvb_tools v3" or what.
Apparently, VDR could take "dvb_tools v3" format as a "seed" (initial 
file) for vdr-plugin-wirbelscan, I don't remember exactly anymore.
In my notes, I read the following curse:

w_scan2 -ft -c CZ -x > channels_initial_v3.conf

Which surprisingly produces just a single valid line in the output 
file. Excluding some comments, the file looks like this:

T         0 AUTO NONE NONE     QPSK   2k 1/32 NONE
T         0 8MHz  1/2 NONE     QPSK   2k 1/32 NONE
T2 554000000 8MHz AUTO NONE     AUTO  32k  1/8 NONE

The first two lines look awry, the third line is actually allright.
It's funny, because the stderr output from w_scan2 suggest that it 
has scanned several transponders.
So, based on that format and based on data obtained in other ways, I 
was able to come up with the following manual creation:

T 546000000 8MHz  3/4 NONE    QAM64   8k 1/32 NONE
T 570000000 8MHz  3/4 NONE    QAM64   8k 1/32 NONE
T 714000000 8MHz  3/4 NONE    QAM64   8k 1/32 NONE
T 746000000 8MHz  3/4 NONE    QAM64   8k 1/32 NONE
T 770000000 8MHz  3/4 NONE    QAM64   8k 1/32 NONE
T2 530000000 8MHz AUTO NONE     AUTO  32k  1/8 NONE
T2 554000000 8MHz AUTO NONE     AUTO  32k  1/8 NONE

Again the data is specific to my location and a particular moment in 
history - but if you can watch the scanner in action, you can 
probably produce a valid config file by hand.

And, if memory serves, vdr-plugin-wirbelscan was able to take off 
from there.

Note that the "dvb_tools v3 initial file" describes multiplexes 
(transponders, radio channels) rather than individual program 
streams. Consequently, the file formats describing actual program 
streams are different, more complex. Such as the VDR's channels.conf.

Nowadays I'd just reach for t2scan.
Apparently, both w_scan2 and t2scan can produce other output file 
formats, such as VLC or XINE. I haven't tested those. 
See the man pages or --help if you need to give them a try.
Note that w_scan2 and t2scan use different cmdline arguments to do 
essentially the same thing.

Note that w_scan / w_scan2 / t2scan just spew their output to stdout, 
at the very end of their activity = not while scanning.
So, you need to redirect the output into a >file on your own, at the 
command line.
Note that if you let this stdout emerge on your terminal console, 
it will get intermingled with debug output, coming out on stderr.
Or, more precisely, again the stdout lines come out in one big batch 
at the very end. To me the >redirection is probably easier than using 
the mouse to copy and paste the data.

Further questions are welcome.

Frank

