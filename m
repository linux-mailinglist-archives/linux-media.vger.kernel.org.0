Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781334474B3
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235013AbhKGRxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38466 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234980AbhKGRxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636307424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VI9/oTkMv73lXfxkfvV9yRrXnTPAd4jUWgjMM+1DFzc=;
        b=iQCzE5lx3FRgSo9dRKc5dJ4+ki1/CJftaDiXIY8qEXVP1oapdoP5RHc0M/12AxgdFMyKyC
        yMdHvlpb3xU4qGP2bxSI8QOmYUsNvJy+43CooPASmCViICC5ze+aq53FPctLYatXXMZV/Q
        0g3SFI0jL8wDqeT7n3ytXW0+axrhoNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-iyjgleweNyaCyb-fmeh8gQ-1; Sun, 07 Nov 2021 12:50:21 -0500
X-MC-Unique: iyjgleweNyaCyb-fmeh8gQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6C6F100C662;
        Sun,  7 Nov 2021 17:50:18 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 65EB619730;
        Sun,  7 Nov 2021 17:50:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        libcamera-devel@lists.libcamera.org
Subject: [RFC] media: Auto exposure/gain support for atomisp / libcamera integration ?
Date:   Sun,  7 Nov 2021 18:50:13 +0100
Message-Id: <20211107175013.355188-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Now that we have the atomisp2 driver running on some devices like
the Asus T101HA; and with the exposure + gain controls for the ov2680
sensor found on that laptop fixed:

https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/

I believe we need to start thinking about various userspace API
concerns. Thanks to Mauro's great work on various V4L2 API things
are starting to work (somewhat) with regular V4L2 apps, but we really
also need some processing / 3A stuff to make the cameras really
usable.

The most important thing needed is automatic exposure + gain control,
ATM this relies on a custom ATOMISP ioctl, but I believe that we can
just export the controls as regular v4l2 controls on the sensor subdev,
at least for the ov2680 the exposure is already exported this way
but it is read-only. Does anyone see any problems with just making
these normal v4l2 controls on the sensor subdev ?

We can then simulate the custom ATOMISP ioctl through the subdevs,
or we can just remove it alltogether.

Once we have the controls available this way I think we should write
a libcamera plugin, which like the older versions of the Rasberry Pi
plugin (if I've understood things correctly) won't use the MC framework
for now. I believe we first need to understand the atomisp code better
before we add MC support (*). But I still believe that an (experimental)
plugin would be good, both to get something usable so that we can get
more testers / more people interested in contributing.
Another reason is to have another use-case where apps need to support
libcamera to work properly (like on IPU3 devices) which will hopefully
motivate people working on apps to put more effort in supporting libcamera
(preferably through the new pipewire libcamera plugin so that things
will also work in a flatpack sandbox).

###

On other thing which I'm wondering about is the need to call S_INPUT to
select front / back in this list from Mauro:

	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
	/dev/video3:	Name             : ATOMISP ISP VIDEO output
	/dev/video4:	Name             : ATOMISP ISP ACC
	/dev/video5:	Name             : ATOMISP ISP MEMORY input
	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
	/dev/video9:	Name             : ATOMISP ISP VIDEO output
	/dev/video10:	Name             : ATOMISP ISP ACC

I notice that everything is listed twice, I wonder if we can use /dev/video2
with input 0 together with /dev/video8 for input 1, if that is possible then
we might set a different default input on each.

And maybe also make them /dev/video0 (already done I see) and /dev/video1,
possibly combined with a module-option to hide the others for now. This
should make things better for regular apps. OTOH if we go the libcamera
route then this is not really necessary I guess?

Regards,

Hans

*) I do believe that in the end MC support makes sense at least
to tie together the 

