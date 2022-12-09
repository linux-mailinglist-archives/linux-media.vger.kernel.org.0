Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7574647EA7
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 08:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiLIHgk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 9 Dec 2022 02:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiLIHgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Dec 2022 02:36:38 -0500
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Dec 2022 23:36:34 PST
Received: from relay.uni-heidelberg.de (relay.uni-heidelberg.de [129.206.100.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4936A2E6A0
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 23:36:33 -0800 (PST)
X-IPAS-Result: =?us-ascii?q?A2BoBAC25JJj/67bzoFaHgEBCxIMQIFEC4M0gViETpRGg?=
 =?us-ascii?q?Q6bAA8BAQEBAQEBAQEJPQcEAQGKESc3Bg4BAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBBwSBHYVoDYcAgQsCJgKDcYMiE69SgTKBAYNQAYEgmmaBYQaBFCwBh?=
 =?us-ascii?q?zcdWIhvAjeBVUSBS4JEgmtlBBiCE4MKgmcEllpygU0zNwNEHUADC20KRTUXT?=
 =?us-ascii?q?CscGweBDCooFQMEBAMCBhMDIAINKDEUBCkTDSsmawkCAyJmAwMEKCwDCUAHJ?=
 =?us-ascii?q?iQ8B1Y3BQMCDyA4BgMJAwIfVXMwJgUDCxUlCAVHBAg2BQZQEgIKERIPLEQOQ?=
 =?us-ascii?q?jw5FgYnaAwOEwNUgU8EgQ+BAgpXmCNgg1oggSWTdK9bNAeCIIFOBYFFBgyCZ?=
 =?us-ascii?q?4VugSKHdYx7TINmE4xXhi4Ckh6XQI1FlHiFPoF4gX8zGiSDN1EZD1eRO4UUh?=
 =?us-ascii?q?Ut0AgEBATYCBwEKAQEDCYofAQE?=
IronPort-Data: A9a23:I98ftaJPCsGUuIWGFE+RCJUlxSXFcZb7ZxGr2PjKsXjdYENSg2cPn
 zFODTrQM/+DN2KmKY8lOYrk8R8DvZfTmt9nSAsd+CA2RRqmi+KcWIvDfhmsV8+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP64xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvQ/
 4KsyyHjEAX9gWQtaDpFs/vrRC5H5ZwehhtJ5jTSWtgW5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaKVeS6sUe6boD56vR0Soze5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fLZkD87M6R/3bMekP+ytkpIRo3BIYHr7Mf7WFmr
 ZT0KRgRYwufwuexx7m4DPR2lII+KsiuPI4etnxkxzzDArAqTPgvQY2Tv44ehm9uwJoXTLCHO
 JZxhTlHNXwsZzVKM00cD9Q7m+CjhVHiaS8etVSU4Ko64mTeyAZ8yrerPNe9ltmiHJUJxx/J/
 T6fl4j/KjUYOfWOyguqyS+9prHOtD3BftlOBqLto5aGh3XImjJPUkROPbehmtG9i0ijS5daJ
 kAV8wIwoqUosk+mVN/wW1u/unHsg/IHc8ZdCPF/7QaKwamS/hyLQHUCT3tBZd0qucs8SCYlk
 FOE9z/0OdBxmLHScTHA9LWkljm7ATocASgvPi49RhRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2QM4W2+R7YSkji/rTwLzXv96/jsSYElZqv207Skr1sFMmNOZJcqTysTDmAeB8wJGxYnTpU
 JIsu8Wf4O0KB5yXm0Rhq81TTejwup5p3BX2iFJiGdwe6i6x53Omd41K71lDyKpBLssfZXrsZ
 0jYukVM/o0VIX2rKK96Yo68D84n16emGdmNuhHogjhmOMkZmOyvpX8GiausM4bFyxJEfUYXa
 P+mnT6EVypyNEie5GPeqid0+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgTWM7pltvnY/1mEm
 zq6Cyds40sHOAEZSnSHmbP/0XhUcRDX+Lis850KLbDbSuaYMD14U6S5LUwdl3xNxPgLyr2Rp
 hlRq2dSxV7gmHCPNAOLdH15c7LzTN55oG4kOjYvVWtEKFB8CbtCLc43KfMKQFXQ3LA5nKYuE
 6BcJa1twJ1nE1z6xtjUVrGlxKQKSfhhrVjTV8Z5SFDTp6JdejE=
IronPort-HdrOrdr: A9a23:DkoUeKsS42l2yaoKYwNWDkMj7skDfdV00zEX/kB9WHVpmwKj9/
 xG785rtyMc6Qx7ZJhOo7290cW7MBbhHNtOkO0s1NSZMDUO2lHDEGgK1+KL/9SjIVycygc378
 ldmsZFaeEYQWIUsfrH
X-IronPort-Anti-Spam-Filtered: true
Received: from test-moock.urz.uni-heidelberg.de ([129.206.219.174])
  by relay.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Dec 2022 08:35:18 +0100
Received: from localhost (localhost [IPv6:0:0:0:0:0:0:0:1])
        by test-moock.urz.uni-heidelberg.de (8.17.1.9/8.17.1.9/Debian-1) with ESMTP id 2B97ZHG6095862
        for <linux-media@vger.kernel.org>; Fri, 9 Dec 2022 08:35:17 +0100
Date:   Fri, 9 Dec 2022 08:35:17 +0100
From:   Marco Moock <marco.moock@urz.uni-heidelberg.de>
To:     linux-media@vger.kernel.org
Subject: Logitech camera only uses USB 1.1 (Full speed), not enough
 bandwidth
Message-ID: <20221209083517.10698645@urz.uni-heidelberg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_50,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I have a Logtech Webcam and it doesn't use USB 2.0, only 1.1 and
therefore it has not enough bandwidth for video. It is not a hardware
issue.

Please see this bug report in English:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1025735

This is the Usenet discussion about that problem in German:
https://de.comp.os.unix.linux.hardware.narkive.com/YgT3gc2x/usb-kamera-bild-komplett-gestort-bandwidth-not-wide-enough

If you need more information, please tell me.

-- 
Gruß
Marco Moock
