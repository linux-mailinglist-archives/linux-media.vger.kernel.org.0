Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA8744D2D2
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 09:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhKKIDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 03:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhKKIDF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 03:03:05 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C12CC061766;
        Thu, 11 Nov 2021 00:00:16 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so3982512pjc.4;
        Thu, 11 Nov 2021 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=anYKlz5/FkjskAO9CiyYEeUC3/1zMqtLheya2AtuYUw=;
        b=KEms7mXNCicZVOwKHLraJZSFGzperAB5QLDWRrMHx5JzNOQ85d5aNwFJTAORp3uwgl
         wK7WPRB0mgTmitjdics5sqDmfdgzYg4towhuBrEoGxS0usGr3xcnhGyJz/mgAAIAcGsc
         VrCKItYkbDnaPz3Hn/cffDVM1BYOm7IhPhWiWTyNQCvo9M6JZ+tOWOj9oWalaz5Gwxvd
         YeYWWKhZiEfVfTK0RXyjDcM87PGl3b5sf98xpi88VDNR2E2nUmY190ZfVtqzd9Fi8+Ef
         29yDXofB1wuPSg7YAJC3mOOShcMj83mELtoHD2rxUZLaaj2Io+23SF5jq9M5QOUuMYUO
         tmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=anYKlz5/FkjskAO9CiyYEeUC3/1zMqtLheya2AtuYUw=;
        b=zrks1HOxwfNLD2EaZbZX2Apk6MjuG3rJKDMSAizNT+Hpd5/Ly37+zkenb64Ubv/74G
         G+TVjMl/yeCXz3fIE7dZ8BJJKPLVXGR/zWMw5gR4WW9Icc6Drj7we4dCVcrP0hMxg/KI
         dN3rVIaWG9tvp8KvjeXGkkc9FFgpl+tCPlcqKNwNy9S9YolpQrs+42thP6cBSZplnFg3
         ugfHMtx4HEzClSR/sNX6ZDXAWSQBuVQ0Tb1hSateq+pdRh/CPKpLDPD2E2KjTD0VDrXQ
         PlSswa4vVXPmVlfIilZ6tbpCj+Z2GmX0ZgOKjkMUzMx2DVQBCTzPQlGLp+nqsjcKXWqb
         A6kw==
X-Gm-Message-State: AOAM5317M4KzndntQ1e9/yyTZoSVBb5K0C3Cffc9KCes874NiQB0DwHv
        xe7DyLSsWpXzNlkiiclOBjiZNdJzzIiCVQ==
X-Google-Smtp-Source: ABdhPJxwrqngvkvCkTAilFFpWP99r6p1tACNt3bQhwB2rv2pwMITSsDfoQvak5B4GhQQ0CwnvgHlWw==
X-Received: by 2002:a17:90b:3a85:: with SMTP id om5mr6342382pjb.108.1636617615911;
        Thu, 11 Nov 2021 00:00:15 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id z23sm1558285pgn.14.2021.11.11.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 00:00:15 -0800 (PST)
Message-ID: <d02d6194a8e81d0056da6f6b996954000e30c68f.camel@gmail.com>
Subject: Re: [BUG/RFC PATCH 1/5] [BUG][RFC] media: atomisp: pci: assume
 run_mode is PREVIEW
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Date:   Thu, 11 Nov 2021 17:00:11 +0900
In-Reply-To: <20211029100259.2cdfdfce@sal.lan>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211017162337.44860-2-kitakar@gmail.com>
         <20211029100259.2cdfdfce@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

<Adding back people/list to Cc>

On Fri, 2021-10-29 at 10:02 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 18 Oct 2021 01:23:32 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> 
> > This is almost a BUG report with a patch to just make atomisp work
> > again with the current mainline kernel. Thus, prefixed with [BUG][RFC].
> > 
> > RFC:
> >   1. When looking at the `case CI_MODE_NONE:`, it tries to do something.
> >      So, it should rather work with CI_MODE_NONE, too? Just I don't know
> >      how to configure userspace apps to use CI_MODE_NONE ?
> >   2. How can we re-add the run mode support again without relying on
> >      the s_parm ?
> > 
> > > 8-----------------------------------------------------------------8<  
> > 
> > After the commit 8a7c5594c020 ("media: v4l2-ioctl: clear fields in s_parm")
> > added on v4.18 (backported to v4.9.182 and v4.14.127), the capture mode
> > flag is cleared (except for V4L2_MODE_HIGHQUALITY).
> > 
> > Due to this, it seems that now we can't use this flag to set atomisp
> > run_mode. This results in capture not working with the following message
> > (loaded atomisp driver with dbg_level=1):
> > 
> > 	kern  :warn  : [ 3658.776616] ia_css_pipe_get_info: ia_css_stream_create needs to be called before ia_css_[stream/pipe]_get_info
> > 	kern  :err   : [ 3658.776641] atomisp-isp2 0000:00:03.0: get_frame_info 1920x1080 (padded to 0)
> > 	kern  :warn  : [ 3658.776666] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22
> > 
> > So, when we can't detect run mode from the s_parm capturemode
> > (CI_MODE_NONE), let's assume the run mode is PREVIEW.
> 
> The run_mode on this driver is related to how camera works on Android.
> On such systems, camera have a preview mode, which is what the user
> views at the camera display. This is usually set to the display
> resolution (or to some other resolution that would allow a high
> fps rate). When the photo button is clicked, it sets the camera to
> the highest resolution mode (by default), which usually means a low
> fps rate.

Thank you for the description. I always wondered why they needed to
introduce run mode stuff.

> This doesn't make much sense on desktops, nor standard Linux apps
> support that.
> 
> Anyway, after looking on this patch, I guess the best is to apply
> this patch instead:
> 
> 	https://lore.kernel.org/linux-media/543e61dd07c90a7d8577b3a94696edc77953b9d8.1635497370.git.mchehab+huawei@kernel.org/T/#u
> 
> As a plus side, it is also one step further to allow generic apps to
> use the atomisp driver.
> 
> Applying it allowed me to do:
> 
> 	$ v4l2grab -D -f 'NV12' -x 1600 -y 1200 -d /dev/video2 -u
> 	$ nvt/raw2pnm -x1600 -y1200 -f NV12 out017.raw out017.pnm
> 	$ feh out017.pnm
> 
> So, I'm dropping patch 1/5 from media_stage, replacing it by the one which
> sets the mode after open().

Sorry for a bit late reply, I checked the capture functionality with the
latest media_stage patches and can confirm capture is still working
regarding this run_mode issue.

So, I agree to replace this my patch with yours. Thanks!

Regards,
Tsuchiya Yuto

> Regards,
> Mauro
> 
> > 
> > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > index c8a625667e81..6fc64f0ccc31 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > @@ -2638,7 +2638,11 @@ static int atomisp_s_parm(struct file *file, void *fh,
> >  				asd->high_speed_mode = true;
> >  		}
> >  
> > -		goto out;
> > +		dev_warn(isp->dev,
> > +			 "setting run_mode using s_parm capturemode is not supported anymore\n");
> > +		dev_warn(isp->dev, "assuming run_mode is PREVIEW\n");
> > +		mode = ATOMISP_RUN_MODE_PREVIEW;
> > +		break;
> >  	}
> >  	case CI_MODE_VIDEO:
> >  		mode = ATOMISP_RUN_MODE_VIDEO;

