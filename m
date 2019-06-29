Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8B75AA73
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 13:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfF2Ldj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 07:33:39 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36078 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfF2Ldj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 07:33:39 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so8499996ljj.3
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 04:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bbBjB5cx+o2aiMaPFJ++LDuTCw7VIcGJ5Q2P97dlvRo=;
        b=AXJxvba8VmcHQh4uvr88cKOmvpmbaB7yrgom08KAlmptn005rv37EpeUasnPm0lC4T
         u8EuV72GxOlBgPltxdtTRzVbYnrBfmMLeL/M4z13sM4QhJKVtqHe6Rb2zlNbMtHoj5nQ
         Qnz4Yf4jQzkvatZMrn70VmWLh0oAArf62YtT5CgA07mWVra2En3hwIrQvjR4PGypbkjk
         0t2p8RpsPeDc8d55N0jimB2B1OP6AlN+8eisUF3M09IhaP7HWAXcddqicFztbVVmJtvy
         x9mPlzmLbzrglsfzEEK+/dPDlG7kU0E64ooaviHg7QXE50nxlv/XLg87/BRLD/afPt/j
         tT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bbBjB5cx+o2aiMaPFJ++LDuTCw7VIcGJ5Q2P97dlvRo=;
        b=fMzrjaUZhuV7ZwQ/V+5xDKnI685KOA3yzV7XW/Q5GN8qPE2znCQvQMI4ZngoABmoID
         jGv2I/0G9IVLjYC35re8ivSLbZzcS78iiTSpm4XcwGFsNtK/lbNZKpiG40ocREPCL+cM
         ltzPEtDZMHe/37jZSU9EFVIQAuqHtFlTEm7fSvGugjkn0Iw2e9nsD7fv6RBs8PJeRw93
         o484UdMW7VUIo1ILXcqnlnqM4ZAaGqyYXd6T9FI/VSGCf+bgsMe1GFIwl57J8FWLsI3w
         AxkyOlX917pom4kf/yWoXF7nIU/ni1TSGEgagrLHUutvi6F6XoCI0Mz+MpE+xeTzDl2F
         w7ow==
X-Gm-Message-State: APjAAAWjMKOiNjoE8OcOqHubtkH19msjXe29tIeYAzCSNuBrLMiGXvuP
        /sZDs5KnKQzSIJLgDr7iq4o10g==
X-Google-Smtp-Source: APXvYqw1v1m2lkzRz4DqQZSuB8ARKDDxWzk57B/Sg9yqjsLKNYRP84p0fI03MNUbHjSyITCWrg9y7Q==
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr8880759ljg.37.1561808017312;
        Sat, 29 Jun 2019 04:33:37 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id h84sm1605229ljf.42.2019.06.29.04.33.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 04:33:36 -0700 (PDT)
Date:   Sat, 29 Jun 2019 13:33:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Message-ID: <20190629113336.GA20789@bigcity.dyn.berto.se>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your work.

On 2019-06-29 12:00:24 +0200, Hans Verkuil wrote:
> sd->entity.graph_obj.mdev can be NULL when this function is called, and
> that breaks existing drivers (rcar-vin, but probably others as well).
> 
> Check if sd->entity.num_pads is non-zero instead since that doesn't depend
> on mdev.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in v4l2_subdev_call()")

This fixes my problem,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 21fb90d66bfc..bc32fc1e0c0b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
>  {
>  #if defined(CONFIG_MEDIA_CONTROLLER)
> -	if (sd->entity.graph_obj.mdev) {
> -		if (pad >= sd->entity.num_pads)
> -			return -EINVAL;
> -		return 0;
> -	}
> +	if (sd->entity.num_pads)
> +		return pad >= sd->entity.num_pads ? -EINVAL : 0;
>  #endif
>  	/* allow pad 0 on subdevices not registered as media entities */
> -	if (pad > 0)
> -		return -EINVAL;
> -	return 0;
> +	return pad ? -EINVAL : 0;
>  }
> 
>  static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)

-- 
Regards,
Niklas Söderlund
