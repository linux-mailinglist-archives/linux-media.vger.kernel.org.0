Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924A7D5167
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2019 19:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfJLRgw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 12 Oct 2019 13:36:52 -0400
Received: from smtp-out-mk-2.talktalk.net ([212.74.114.22]:54960 "EHLO
        mk-outbound-2.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729419AbfJLRgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Oct 2019 13:36:52 -0400
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Sat, 12 Oct 2019 13:36:51 EDT
Received: from [192.168.1.89] ([82.22.16.195])
        by smtp.talktalk.net with SMTP
        id JKkViey8d574lJKkWil8DG; Sat, 12 Oct 2019 18:00:12 +0100
X-Originating-IP: [82.22.16.195]
X-Spam: 0
X-OAuthority: v=2.3 cv=cuTlbGwi c=1 sm=1 tr=0 a=P8GiAPQqIUPV+hjRTWZ0OA==:117
 a=P8GiAPQqIUPV+hjRTWZ0OA==:17 a=IkcTkHD0fZMA:10 a=uPZiAMpXAAAA:8
 a=7GKYziPKAAAA:20 a=Y43RGKntG8WBZRMvogIA:9 a=QEXdDO2ut3YA:10
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
From:   _ _ _ _ _ <clangers@toucansurf.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: v4l-utils  undefined symbol: dvb_dev_alloc
Date:   Sat, 12 Oct 2019 18:28:41 +0100
Message-Id: <35A2C1D4-DE40-490C-AFE6-E426EC1EC0AC@toucansurf.com>
Cc:     Clangers <clangers@toucansurf.com>
To:     linux-media@vger.kernel.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
X-CMAE-Envelope: MS4wfHvxsq2CemE/zWdjWKKH9BcYCOnbHMsmI42xK2m2m5HjgwziYyhF6i+CZZ6+eGW5qRx1enKPXsXEPIvDqyYU9upe2EKzntiYyR2/h0CstmaYHginURQ9
 4it+5ivmUWg1Z2JxN2+m8oZyEQ54ZNTR/lAlaJ9ZOtEN4f3V5aIr7JnH2D8972Kz76L6kPcBFLP/1+mQsfbCvJfQavETvNP9KmNF/pk5DChTro5/3tLhDC51
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I've been waiting for a working version of DVB-S2 capable tools and utilities to appear in a stable release of Mint, but  it hasn't happened yet, so I decided to build the latest stable v4l-utils from source.

I built v4l-utils version 1.18.0 on Linux Mint 18.3

the compilation process appeared to run through OK with only 9 warnings (see below), but the resulting executables fail due to a lib ref issue.
configure: WARNING: doxygen not found - will not generate any doxygen documentation
configure: WARNING: libelf library not available
configure: WARNING: Qt5 or higher is not available
configure: WARNING: ALSA library not available
  CC       control/libv4lconvert_la-libv4lcontrol.lo
control/libv4lcontrol.c: In function ‘v4lcontrol_create’:
control/libv4lcontrol.c:728:3: warning: ignoring return value of ‘ftruncate’, declared with attribute warn_unused_result [-Wunused-result]
   ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
   ^
libtool: warning: relinking 'libv4l2.la'
libtool: warning: relinking 'v4l2convert.la'
libtool: warning: relinking 'libv4l1.la'
libtool: warning: relinking 'v4l1compat.la'

Most of these look insignificant but the fifth one looks a bit worrying.

End result :-

stupiduser@somehost ~ $ gcc --version
gcc (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 2016060

stupiduser@somehost ~ $ dvbv5-scan -V
dvbv5-scan version 1.18.0

stupiduser@somehost ~ $ dvbv5-scan /usr/share/dvb/dvb-s/Astra-28.2E
dvbv5-scan: symbol lookup error: dvbv5-scan: undefined symbol: dvb_dev_alloc

stupiduser@somehost ~ $ dvb-fe-tool -m -a0 
dvb-fe-tool: symbol lookup error: dvb-fe-tool: undefined symbol: dvb_dev_alloc

- - - - - - - - 

I've appended a bunch of links that refer to C versus C++ declarations.

Is it really necessary for me "a user" to change all the source code references to the suggested form just to get it work. 
Surely there must be a stupid mistake that I've made instead.



Refs to the compiler declaration issues:

https://stackoverflow.com/questions/53322164/linking-shared-library-libdvbv5-undefined-reference

https://stackoverflow.com/questions/18877437/undefined-reference-to-errors-when-linking-static-c-library-with-c-code

https://stackoverflow.com/questions/1041866/what-is-the-effect-of-extern-c-in-c/1041880#1041880

https://github.com/gjasny/v4l-utils/blob/master/lib/libdvbv5/dvb-fe.c



