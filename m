Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F61D51B7
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2019 20:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbfJLSrz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 12 Oct 2019 14:47:55 -0400
Received: from smtp-out-mk-2.talktalk.net ([212.74.114.22]:58035 "EHLO
        mk-outbound-2.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728111AbfJLSrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Oct 2019 14:47:55 -0400
Received: from [192.168.1.89] ([82.22.16.195])
        by smtp.talktalk.net with SMTP
        id JLz9ifeYZ574lJLz9ilBGt; Sat, 12 Oct 2019 19:19:23 +0100
X-Originating-IP: [82.22.16.195]
X-Spam: 0
X-OAuthority: v=2.3 cv=cuTlbGwi c=1 sm=1 tr=0 a=P8GiAPQqIUPV+hjRTWZ0OA==:117
 a=P8GiAPQqIUPV+hjRTWZ0OA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=yZ8chm76AAAA:8 a=tMpp-0aFcUxKEtd6i1cA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=d_f39n0F5IwZPrvwsx53:22
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: v4l-utils  undefined symbol: dvb_dev_alloc
From:   _ _ _ _ _ <clangers@toucansurf.com>
In-Reply-To: <20191012150220.1bff18ed@coco.lan>
Date:   Sat, 12 Oct 2019 19:47:52 +0100
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <5FF0093D-1AAE-4683-A290-F875CE32300D@toucansurf.com>
References: <35A2C1D4-DE40-490C-AFE6-E426EC1EC0AC@toucansurf.com> <20191012150220.1bff18ed@coco.lan>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-CMAE-Envelope: MS4wfFBr56f2fS7SxX4ri09l9BKjM278I3vhXuRs4DAq/CIdJxHtZ+UMtXpTcdY3uQjx4pyPi6UQslK+wZ/ugRv7qRKfYwro+Lh56DE6QwHrgFl4eEfo3N1N
 CfbfGDV+BOnzpy06DHN8YW0wCxibvt90QVzMdDAXKkWi3iggaw/Xi06Hw8QwQC7sAjn1PQGjSHEoWuPL4Bu1Td8/a5rWCVS7xiPo33knLanhfh57X0rfmk6l
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Great, I'll try what you suggest.
Regards
Carl

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

