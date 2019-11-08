Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9DAFF538E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 19:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfKHScH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Nov 2019 13:32:07 -0500
Received: from mail-out-2.itc.rwth-aachen.de ([134.130.5.47]:65156 "EHLO
        mail-out-2.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726670AbfKHScH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 13:32:07 -0500
X-Greylist: delayed 593 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 13:32:06 EST
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2A5AADYscVd/5sagoZlGgEBAQEBAQEBA?=
 =?us-ascii?q?QMBAQEBEQEBAQICAQEBAYFtAgEBAQELAYFKVVkJgREqCpMgghCbJwkBAQEBAQE?=
 =?us-ascii?q?BAQEHAS0CAQGEQAKEECQ3Bg4CDgEBBQEBAQEBBQRthUOFUgEFeRACAQgOCgklD?=
 =?us-ascii?q?wEiJQIEDgWFaQMuAQO0YYgNFYIjgTYBjBOBWT6EIz6EJQEBHoVuBI0ggjCGfZd?=
 =?us-ascii?q?AB4E/aJVfjiaLT4QLAaQsAgICAgkCFYFoI4FYTSSDO1ARFJBujg5DMYEojS6BI?=
 =?us-ascii?q?gGBDgEB?=
X-IPAS-Result: =?us-ascii?q?A2A5AADYscVd/5sagoZlGgEBAQEBAQEBAQMBAQEBEQEBAQI?=
 =?us-ascii?q?CAQEBAYFtAgEBAQELAYFKVVkJgREqCpMgghCbJwkBAQEBAQEBAQEHAS0CAQGEQ?=
 =?us-ascii?q?AKEECQ3Bg4CDgEBBQEBAQEBBQRthUOFUgEFeRACAQgOCgklDwEiJQIEDgWFaQM?=
 =?us-ascii?q?uAQO0YYgNFYIjgTYBjBOBWT6EIz6EJQEBHoVuBI0ggjCGfZdAB4E/aJVfjiaLT?=
 =?us-ascii?q?4QLAaQsAgICAgkCFYFoI4FYTSSDO1ARFJBujg5DMYEojS6BIgGBDgEB?=
X-IronPort-AV: E=Sophos;i="5.68,282,1569276000"; 
   d="scan'208";a="94266160"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
  by mail-in-2.itc.rwth-aachen.de with ESMTP; 08 Nov 2019 19:22:12 +0100
Received: from rwthex-w2-a.rwth-ad.de (2a00:8a60:1:e500::26:158) by
 rwthex-s2-b.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1779.2; Fri, 8 Nov 2019 19:22:11 +0100
Received: from rwthex-w2-a.rwth-ad.de ([fe80::18f3:313d:3e:42ff]) by
 rwthex-w2-a.rwth-ad.de ([fe80::18f3:313d:3e:42ff%21]) with mapi id
 15.01.1779.005; Fri, 8 Nov 2019 19:22:11 +0100
From:   =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens@rwth-aachen.de>
To:     Andrei Koshkosh <andreykosh000@mail.ru>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>,
        "Jan Pieter van Woerkom" <jp@jpvw.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] media: dvbsky: use a single mutex and state buffers
 for all R/W ops
Thread-Topic: [PATCH 1/1] media: dvbsky: use a single mutex and state buffers
 for all R/W ops
Thread-Index: AQHVlmCKuiaBTGxAZkqb72fHR+QF9KeBhVkA
Date:   Fri, 8 Nov 2019 18:22:11 +0000
Message-ID: <3265129.arFHkKjftx@sbruens-linux.lcs.intern>
References: <1573236913-16642-1-git-send-email-andreykosh000@mail.ru>
In-Reply-To: <1573236913-16642-1-git-send-email-andreykosh000@mail.ru>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [78.35.13.203]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D7CD9F9833F4804F9B0D3B126F8FE6FE@rwth-ad.de>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Freitag, 8. November 2019 19:15:13 CET Andrei Koshkosh wrote:
> Signed-off-by: Andrei Koshkosh <andreykosh000@mail.ru>

Do not claim to be author of something you have not written.

This is mostly commit 7d95fb746c4e "media: dvbsky: use just one mutex for 
serializing device R/W ops" originally from Mauro and later reverted.

Regards,

Stefan

> ---
>  drivers/media/usb/dvb-usb-v2/dvbsky.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c
> b/drivers/media/usb/dvb-usb-v2/dvbsky.c index c41e10b..7d36f5f 100644
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
