Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B709864D4EF
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 02:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLOBKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 20:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLOBKd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 20:10:33 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DD753EC4
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 17:10:32 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id t17so8813849pjo.3
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Edze/qa0HPXemZjwOHvXFl0b/Mnz/IUyV30XlIwDVo=;
        b=lFO+uYcyTJOGOFVWWo1AmpohM/b0XXwNxnIoV25OB6s/a8yHFgvTRKPDtsiZXn77l4
         EUiiKDhu+Nz70hAj9TqK2GzGtEhIzLCF8QdUqZ0Y8raDlUSbEEiLaXy63pHxOzaoXtTO
         SbfTs/IVESASf61A/v+uTCwc7s2hy2ev41GGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Edze/qa0HPXemZjwOHvXFl0b/Mnz/IUyV30XlIwDVo=;
        b=kK1rZ12CCDNs9V/JUAZ0EyGoSOCttC1bF+gvyEue9x277ayvnTNwIA2SL9RiUydH6Z
         UXlkG+dgMkwhy7uia6n1sZPGq2Kmk3WPMNd5ZWL8nTK265rOHNtuTkKapsyO8Pgw1P/o
         czGhjGaRkdOqChkDc1srUgyvHMjDorsjqESd9HtNq7NlRKKw7OCL3ctT6NIhJAPJX542
         Ds1DQqVC2350N5v5x7siK77SQRKqzUfhYlM71h1Z0Obo+F17aPJ1FtA8zdy6exO2cA6t
         8TZ04aqbJuzqoZV9JauffZsO22M+elnzqqEpHDkTH32qj+yTiujjjSZPa8HDviR8iWxp
         EDZg==
X-Gm-Message-State: ANoB5plDrL0hU42qpGUlKz6G6PGwbVAS9iiPcOf1x2QNrDlqePwnNk1Q
        EeByfJ4alC3v0HCL04Tn57Jp/A==
X-Google-Smtp-Source: AA0mqf5+6gKAHAMUtzClUJvvgj+BHiKJYtgUrqGdmygUsqSr9SFaOC3MiyoheA3VlqwrOxqZt7t6dg==
X-Received: by 2002:a17:903:22c3:b0:189:d92b:86e4 with SMTP id y3-20020a17090322c300b00189d92b86e4mr38669978plg.52.1671066632042;
        Wed, 14 Dec 2022 17:10:32 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902e30300b00178143a728esm2416735plc.275.2022.12.14.17.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 17:10:30 -0800 (PST)
Date:   Thu, 15 Dec 2022 10:10:25 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Max Staudt <mstaudt@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Do not alloc dev->status
Message-ID: <Y5p0AfcKaHWxEjGV@google.com>
References: <20221214-uvc-status-alloc-v1-0-a0098ddc7c93@chromium.org>
 <Y5nFap/r4OgqgmeK@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5nFap/r4OgqgmeK@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/14 14:45), Laurent Pinchart wrote:
> On Wed, Dec 14, 2022 at 12:23:41PM +0100, Ricardo Ribalda wrote:
> > UVC_MAX_STATUS_SIZE is 16, simplify the code by inlining dev->status.
> 
> The reason why uvc_status is allocated dynamically is to ensure cache
> line alignment, as the USB host controller may DMA to the buffer.

Oh, that's a very subtle detail.

> > +struct uvc_status_streaming {
> > +	u8	button;
> > +} __packed;
> > +
> > +struct uvc_status_control {
> > +	u8	bSelector;
> > +	u8	bAttribute;
> > +	u8	bValue[11];
> > +} __packed;
> > +
> > +struct uvc_status {
> > +	u8	bStatusType;
> > +	u8	bOriginator;
> > +	u8	bEvent;
> > +	union {
> > +		struct uvc_status_control control;
> > +		struct uvc_status_streaming streaming;
> > +	};
> > +} __packed;
> > +
> >  struct uvc_device {
> >  	struct usb_device *udev;
> >  	struct usb_interface *intf;
> > @@ -559,7 +579,7 @@ struct uvc_device {
> >  	/* Status Interrupt Endpoint */
> >  	struct usb_host_endpoint *int_ep;
> >  	struct urb *int_urb;
> > -	u8 *status;
> > +	struct uvc_status status;

So we can do something like this maybe?

+	struct uvc_status status ____cacheline_aligned;

And this actually even improves code readability, IMHO, in a
sense that we explicitly say that it has to be cache aligned.
