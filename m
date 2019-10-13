Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1902AD576D
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 20:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfJMSpj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 13 Oct 2019 14:45:39 -0400
Received: from smtp-out-mk-2.talktalk.net ([212.74.114.22]:58720 "EHLO
        mk-outbound-2.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728239AbfJMSpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 14:45:39 -0400
Received: from [192.168.1.89] ([82.22.16.195])
        by smtp.talktalk.net with SMTP
        id JiQUipD1D574lJiQUilpll; Sun, 13 Oct 2019 19:17:06 +0100
X-Originating-IP: [82.22.16.195]
X-Spam: 0
X-OAuthority: v=2.3 cv=cuTlbGwi c=1 sm=1 tr=0 a=P8GiAPQqIUPV+hjRTWZ0OA==:117
 a=P8GiAPQqIUPV+hjRTWZ0OA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=yZ8chm76AAAA:8 a=uGKf9n03fcRfgvmj5CwA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=d_f39n0F5IwZPrvwsx53:22
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: v4l-utils  undefined symbol: dvb_dev_alloc
From:   _ _ _ _ _ <clangers@toucansurf.com>
In-Reply-To: <20191012150220.1bff18ed@coco.lan>
Date:   Sun, 13 Oct 2019 19:45:36 +0100
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <2FBA3FCF-6ADA-42F2-A422-8BA602AD7B01@toucansurf.com>
References: <35A2C1D4-DE40-490C-AFE6-E426EC1EC0AC@toucansurf.com> <20191012150220.1bff18ed@coco.lan>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-CMAE-Envelope: MS4wfGBrdu7NRLi+VRWMpxI1mV6/nLJzJsq3uZEFVxnJsjoaneqFgDMKxTCDwZoxA6GEi2Bvl7EcroTJylidXPgrnL+Twd9UQ2V8Fm3X3gCKxKjJHvmVfCaM
 ZuVcAR054f1/xU2TQz/X/1LgIs7+GjXqbPXoaih/bsy9E+AIITC0P/uPG5EBurORCbCM51QMZdTacFtffJ+ae4WCu38EQUdw1+YqT5d2oJBbRxYld2s66xMO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I originally built using
./configure --prefix=/usr --sysconfdir=/etc --disable-static && make

so adapting your instructions and putting /usr/lib in /etc/ld.so.conf.d/local.conf and then executing ldconfig were the essential steps that fixed it.

Thanks.

> On 12 Oct 2019, at 19:02, Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> Em Sat, 12 Oct 2019 18:28:41 +0100
> _ _ _ _ _ <clangers@toucansurf.com> escreveu:
> 
>> I've been waiting for a working version of DVB-S2 capable tools and utilities to appear in a stable release of Mint, but  it hasn't happened yet, so I decided to build the latest stable v4l-utils from source.
>> 
>> I built v4l-utils version 1.18.0 on Linux Mint 18.3
>> 
>> the compilation process appeared to run through OK with only 9 warnings (see below), but the resulting executables fail due to a lib ref issue.
>> configure: WARNING: doxygen not found - will not generate any doxygen documentation
>> configure: WARNING: libelf library not available
>> configure: WARNING: Qt5 or higher is not available
>> configure: WARNING: ALSA library not available
>>  CC       control/libv4lconvert_la-libv4lcontrol.lo
>> control/libv4lcontrol.c: In function ‘v4lcontrol_create’:
>> control/libv4lcontrol.c:728:3: warning: ignoring return value of ‘ftruncate’, declared with attribute warn_unused_result [-Wunused-result]
>>   ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
>>   ^
>> libtool: warning: relinking 'libv4l2.la'
>> libtool: warning: relinking 'v4l2convert.la'
>> libtool: warning: relinking 'libv4l1.la'
>> libtool: warning: relinking 'v4l1compat.la'
>> 
>> Most of these look insignificant but the fifth one looks a bit worrying.
> 
> Shouldn't have any real consequence. it is just because there's nothing
> like:
> 
> 	ret = ftruncate(...)
> 	if (ret) {
> 		/* some error handling logic */
> 	}
> 
>> 
>> End result :-
>> 
>> stupiduser@somehost ~ $ gcc --version
>> gcc (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 2016060
>> 
>> stupiduser@somehost ~ $ dvbv5-scan -V
>> dvbv5-scan version 1.18.0
>> 
>> stupiduser@somehost ~ $ dvbv5-scan /usr/share/dvb/dvb-s/Astra-28.2E
>> dvbv5-scan: symbol lookup error: dvbv5-scan: undefined symbol: dvb_dev_alloc
>> 
>> stupiduser@somehost ~ $ dvb-fe-tool -m -a0 
>> dvb-fe-tool: symbol lookup error: dvb-fe-tool: undefined symbol: dvb_dev_alloc
> 
> Probably you have an older version of DVB libraries installed on
> your machine. It is trying to use the older library when you try
> to run it.
> 
> There are some ways of solving it:
> 
> 1) Make configure to override the old library with:
> 
> 	./configure --prefix=/usr
> 
> (the default is to install it at /usr/local)
> 
> 2) Ensure that the dynamic linker will use the libraries from
> /usr/local
> 
> Depending on how your distro is set, you could need to add a
> new file at /etc/ld.so.conf.d/, in order to teach the dynamic
> linker to use the /usr/local/lib directory to seek for libraries.
> 
> For example, create a "/etc/ld.so.conf.d/local.conf" file, and make the
> system use it by running, as root:
> 
> 	# echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf
> 	# ldconfig 
> 
> PS.: You may need to remove a previous install of the V4L and DVB
> libs, in order to avoid any conflicts.
> 
> 3) use the environment var LD_LIBRARY_PATH in order to add 
> /usr/local/lib to the list of directories it will seek for a 
> library.
> 
> Thanks,
> Mauro

