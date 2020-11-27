Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1798C2C6CBD
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 21:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbgK0Uvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 15:51:32 -0500
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:59508 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729567AbgK0UuY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 15:50:24 -0500
X-Greylist: delayed 986 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Nov 2020 15:50:23 EST
Received: from [212.54.42.137] (helo=smtp6.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <dick@mrns.nl>)
        id 1kikR4-0004aJ-4F
        for linux-media@vger.kernel.org; Fri, 27 Nov 2020 21:33:42 +0100
Received: from ip-213-127-117-214.ip.prioritytelecom.net ([213.127.117.214] helo=routi.mrns.nl)
        by smtp6.tb.mail.iss.as9143.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <dick@mrns.nl>)
        id 1kikR2-00FprM-8x
        for linux-media@vger.kernel.org; Fri, 27 Nov 2020 21:33:41 +0100
Received: by routi.mrns.nl (sSMTP sendmail emulation); Fri, 27 Nov 2020 21:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mrns.nl;
 i=@mrns.nl; q=dns/txt; s=mail; t=1606509219; h=date : from : to :
 subject : message-id : mime-version : content-type : from;
 bh=DI7lAeDWF7gi/Jz/YBJ987QQAGqyId5HjJgrRN37cy0=;
 b=BwHbkrsiCuocIoBoMJMV9EKkkRKz66XoNlaTxaNpHfySh4o1gXEY3K8HJGN3CBSKq/qMy
 oRFu4cF29DIgPv5dLjIoitz5n/72UUVQRuJInQyTeK6MqKqOE8xvGVo/CTwfZpK7gYrKkgd
 CPQyh6Y1C1L2K6mbHdi9t8KOVCtx4t4=
Date:   Fri, 27 Nov 2020 21:33:39 +0100
From:   Dick <dick@mrns.nl>
To:     linux-media@vger.kernel.org
Subject: Use dvbv5-zap.c in mpv (LGPL)
Message-ID: <20201127203339.GA68093@routi.mrns.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SourceIP: 213.127.117.214
X-Authenticated-Sender: boeierlaan60@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.4 cv=eothcqlX c=1 sm=1 tr=0 ts=5fc162a5 a=/yqwS09Bd1mfwh02Zu0ZFA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=kj9zAlcOel0A:10 a=nNwsprhYR40A:10 a=pMv7iQpq6FTc1qH51LQA:9 a=CjuIK1q_8ugA:10
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I've used dvbv5-zap.c as a base to replace the dvbstream based input
stream for mpv-player. The header from dvbv5-zap.c stated that it's
GPL-2 and I wonder if it could be changed to LGPL-2.

I'm quite confused how libdvbv5 is licensed, v4l-utils seems GPL-2
licensed and contain the sources for libdvbv5 which are on it's turn
LGPL-2 licensed.

There are also some references from libdvbv5 to the v4l-utils DVB
utilities stating that it's sample code. To be honest, for me that's an
understatement. If you'd like to use libdvbv5 you'll essentially do
exactly what's in these utilties for setting up an DVB device. I wish
libdvbv5 contained that code as well (licensed as LGPL-2).

My questions are:
* How are the DVB related v4l-utils licensed (GPL-2 or LGPL-2)?
* Is libdvbv5 really LGPL-2 licensed? (some Linux distributions say
  GPL-2)
* Would it be possible to relicense the DVB related v4l-utils?
* As an alternative, would it be possible to supply LGPL-2 licensed
  examples with libdvbv5 or some higher level/helper functions?

Thanks in advance!
Dick
