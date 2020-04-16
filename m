Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508991ABF4D
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633112AbgDPLdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633448AbgDPLcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:32:55 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912ECC061A0C;
        Thu, 16 Apr 2020 04:32:53 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x26so1496992pgc.10;
        Thu, 16 Apr 2020 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=73G/tYBPsY7Yumk7mWov9Hec1mGGxgp9HY4KcukxdJk=;
        b=W0IGsdm+ACN3UO/Jo0nd+PFHgkmBMXkb3+UjlCb2MUZNnpWE2c0Srt8wlfJrux16No
         55tOI1PdSYIqK+t6kOiy9gqnRnEQE0HnP4cICNOeuDQL82IOiVKpcRke4iQEnvrFvHmh
         pj5S9eQEugeAbYsuDllp01Y+LyCUWgpVsNrKvwEvWbgu79wYOpEiMcp/pkCKPp2I573F
         84IauxJyP3NqAYcyu3dYmbyW/oZQrSKdRzgKMlxSpuqM8ZuA+DHkIthKUpnLI+WK8sqj
         fDXNeKeK9RtrqqJ3Jj2sQbWnU9Tp9+vEOdtae05A33NhtDVJ3fmR+XpYxmbk6b9QnZz2
         qL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=73G/tYBPsY7Yumk7mWov9Hec1mGGxgp9HY4KcukxdJk=;
        b=b9MncRHlBFIhtavphH83o34YGOx74nqSh5VOscJ6KeQamyHpyNTLmuFN6ym8+FbZWr
         +BU4pL83wmsltI9yg4CaQfe/6mQSKfCc3+SWIgR1EfkK9FyKW96WMVJwccMFGS9jWXgw
         PP4w9AxtrExTgt6m/gV9F1sSjnjCHRNQvpV5gX63IuKXRK5O2nbsjmLHqaoRELdJwaRf
         mgCJfaD1FdxemU6BP8l3mv3G0Z+SwNT3q/CgliJzGI0h6GUDeqmndulknoemhtNhduW6
         7S5TWzEf3/flF3FWf71q+enUSilZiBvFw0UjLfThgP/KaLHleBxup7vncaiQkfkyACU8
         fpQg==
X-Gm-Message-State: AGi0PuaizA6nq1hLXAj+CCCLBD810xt/Wm9whJ0eHSWZoAtj/bo/fZ+E
        8avNTMMKu4fOMzIVQ1t1oz8=
X-Google-Smtp-Source: APiQypKzID1pPKYdKYh039MvmszprZ+oT+Eo9hNJzwnQiIO4oU4+niTGf8czeKJIbqDEZzyjhgdirQ==
X-Received: by 2002:a63:6c83:: with SMTP id h125mr21113825pgc.168.1587036772993;
        Thu, 16 Apr 2020 04:32:52 -0700 (PDT)
Received: from localhost (181.56.30.125.dy.iij4u.or.jp. [125.30.56.181])
        by smtp.gmail.com with ESMTPSA id h11sm16533490pfn.125.2020.04.16.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 04:32:51 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Thu, 16 Apr 2020 20:32:49 +0900
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] media: v4l2-ctrls: add more NULL pointer checks
Message-ID: <20200416113249.GG30641@jagdpanzerIV.localdomain>
References: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
 <c83c137b-b801-a06b-e324-09dd3bbc9daf@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c83c137b-b801-a06b-e324-09dd3bbc9daf@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/04/16 10:53), Hans Verkuil wrote:
[..]
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -2869,6 +2869,9 @@ EXPORT_SYMBOL(v4l2_ctrl_add_handler);
> >  
> >  bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl)
> >  {
> > +	if (WARN_ON(!ctrl))
> > +		return false;
> > +
> >  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_TX)
> >  		return true;
> >  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_RX)
> > @@ -3794,7 +3797,9 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct v4l2_ext_control c;
> >  
> >  	/* It's a driver bug if this happens. */
> > -	WARN_ON(!ctrl->is_int);
> > +	if (WARN_ON(!ctrl || !ctrl->is_int))
> > +		return -EINVAL;
> 
> Just return 0 here. The return value is the control's value, not an error code.
> So all you can do here is return 0 in the absence of anything better.

OK.

> > +
> >  	c.value = 0;
> >  	get_ctrl(ctrl, &c);
> >  	return c.value;
> > @@ -4212,6 +4217,9 @@ EXPORT_SYMBOL(v4l2_s_ctrl);
> >  
> >  int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
> >  {
> > +	if (!ctrl)
> 
> Change this to 'if (WARN_ON(!ctrl))'
> 
> I don't think NULL pointers should be silently ignored: it really
> indicates a driver bug. It it certainly a good idea to WARN instead.

Should WARN_ON() be only in unlocked versions of ctrl API? It probably
would make sense to add WARNs to both - e.g. to v4l2_ctrl_s_ctrl() and
to __v4l2_ctrl_s_ctrl(). By the way, why don't locked and unlocked
versions live together in v4l2-ctrls.c file? Any reason for, e.g.,
v4l2_ctrl_s_ctrl() to be in header and __v4l2_ctrl_s_ctrl() to be C-file?

> The same is true for the functions below.

OK.

	-ss
