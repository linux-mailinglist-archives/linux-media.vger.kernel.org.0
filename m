Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54736C2EC7
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732964AbfJAIXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 04:23:18 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38664 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJAIXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 04:23:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id b20so12369110ljj.5;
        Tue, 01 Oct 2019 01:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=39RhDSMZRJbAMEubpivc7sb2S4Q4zvVL3vDz0kDKunQ=;
        b=apGeQcXrcJwa17iebDwOvQb1D2jFDABi+i3Y5e9mtrhu6R+cDl5hZidWE+hmdrUnj6
         rC85MF3HgBo9uVwoXdwuZandJbtq6UfLt0U1jzPbr5Or7eDtBfGtoEPxwszZ+9831772
         dFin7XkBaqyuES7uwR34j9cvvwR9sWeeH+qzGbUcJAAVqZhCY3Vc9HOguPGHiUxeNPT3
         R9tPPEfKUYRee84EeqgrYEcE5SPfNZ5S572tpzBcXqC1YQis9nT4UpBIOnP/dIazrysF
         IUR1YzG/X2BX+AteRzwng7nejqDQ4uxfk0bPiEk38EYNOjezfD6Kvsfh1cO+mJnDb0fQ
         d+kg==
X-Gm-Message-State: APjAAAVXA+i5xp/AWmzwaCjHxUjSgbLbD8IhUgx1JdgYHOF7/Rh85kjs
        0+DEgiZDjRIeLE7ahy/JSNw=
X-Google-Smtp-Source: APXvYqwodPNS5oQBgRnLFOd73QE2r4CIJZzLiTOY6/q38+5ENMLIBmOyPaOGzVyvR0NyQ54cKXksoQ==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr14700661ljj.187.1569918195316;
        Tue, 01 Oct 2019 01:23:15 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id h25sm4836377lfj.81.2019.10.01.01.23.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:23:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iFDRK-00005F-1V; Tue, 01 Oct 2019 10:23:22 +0200
Date:   Tue, 1 Oct 2019 10:23:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] USB: fix runtime PM after driver unbind
Message-ID: <20191001082322.GH13531@localhost>
References: <20190930161205.18803-1-johan@kernel.org>
 <20190930133603.0192f809@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930133603.0192f809@coco.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 30, 2019 at 01:36:03PM -0300, Mauro Carvalho Chehab wrote:
> Em Mon, 30 Sep 2019 18:12:01 +0200
> Johan Hovold <johan@kernel.org> escreveu:
> 
> > A recent change in USB core broke runtime-PM after driver unbind in
> > several drivers (when counting all USB serial drivers). Specifically,
> > drivers which took care not modify the runtime-PM usage counter after
> > their disconnect callback had returned, would now fail to be suspended
> > when a driver is later bound.
> > 
> > I guess Greg could take all of these directly through his tree, unless
> > the media maintainers disagree.
> 
> Patches look ok and I'm fine if they go via Greg's tree. So:
> 
> Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Thanks for taking a look.

> Yet, on a quick look on media:
> 
> 	$ git grep -l usb_.*pm drivers/media/usb/
> 	drivers/media/usb/cpia2/cpia2_usb.c
> 	drivers/media/usb/dvb-usb-v2/az6007.c
> 	drivers/media/usb/dvb-usb-v2/dvb_usb.h
> 	drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
> 	drivers/media/usb/gspca/gspca.c
> 	drivers/media/usb/gspca/gspca.h
> 	drivers/media/usb/siano/smsusb.c
> 	drivers/media/usb/stkwebcam/stk-webcam.c
> 	drivers/media/usb/usbvision/usbvision-i2c.c
> 	drivers/media/usb/uvc/uvc_driver.c
> 	drivers/media/usb/uvc/uvc_v4l2.c
> 	drivers/media/usb/zr364xx/zr364xx.c
> 
> There are other drivers beside stkwebcam with has some PM routines.

Yeah, but that may be for system-wide suspend.

> Ok, only two (stkwebcam and uvcvideo) uses usb_autopm_get_interface() and
> usb_autopm_put_interface(), but I'm wondering if the others are doing the
> right thing, as their implementation are probably older.

Right, only these two support runtime PM through USB core (autosuspend).

In fact, I see now that stkwebcam fails to set the supports_autosuspend
flag in its usb_driver struct, so runtime PM has never actually been
enabled for this driver either. But I guess it doesn't hurt to fix
missing puts if someones wants to try enabling it, if not only for
documentation purposes and avoiding copy-paste proliferation.

Lots of legacy...

Johan
