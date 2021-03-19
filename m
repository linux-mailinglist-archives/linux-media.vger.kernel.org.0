Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515C03414EB
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhCSFf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbhCSFfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:35:32 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C329EC06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:35:31 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6174403pjh.1
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l9qdRJ37wMwErzIyw0U24u0NyMPwPyp/2vqA1Tx+4xY=;
        b=Ik1ukPvKh934dddyz6yPqKEoRi3+kqch9hVoWuFoPorP3AB6p+MKJKdkNT43KJL4SN
         /P9ojVXrng3BziRdMvsU9mWYICjpUS0DyrGYRhQ3TjMxv0mD5zF9HFbtTe8o83/ADKvT
         u5LkiAQPevSUh5Y0KeyAi33NoB9J0NJSOoSAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l9qdRJ37wMwErzIyw0U24u0NyMPwPyp/2vqA1Tx+4xY=;
        b=tNlElcw0BckM6IuYeQGxxZVtiB4NgJ6zGKJm0rJoqggMJZa/r4YLY3zqYghcc+zE61
         H7oo6uOqEcKt+gVhETU0RBWwkHL8vr7EgVC/zg6E0wAqpf3PcJlwxfYCYTS2pRjrIsJT
         lOxIOvNPnK1uJ5EwmVd2FpHcXNOXL7tt1ACsbmrlMMkZXGSmmJhdpPNJjNQ1itFl3QNI
         1NRcI0qYTu3JFQEn/rsETz+z26hGJkmm56+/OqlvuS8pb4ubfhxAWNHr+/QX5tGawSiV
         6u/hzdPWHQlvesrHemuDDQ5yX8waEx4A6te0zL084xWKRaahA1vC7yhnEreRk79wcnDu
         HBWw==
X-Gm-Message-State: AOAM5336EjcVleX3jnUhpjju0MQjLr63WUSSbcI6h/IvgJE4ZkMCbdT5
        U+AAh5Aw26J9qnx2tqkwvYRCtQ==
X-Google-Smtp-Source: ABdhPJwEoH4kXmBWJFvyEEPTHu0ycUeMmF/84wCTY8Yp0+t1W38oAFNb1AUIu7W/mR/hE3AsRP0FAw==
X-Received: by 2002:a17:90a:f40c:: with SMTP id ch12mr8038514pjb.176.1616132131240;
        Thu, 18 Mar 2021 22:35:31 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id fr23sm3892636pjb.22.2021.03.18.22.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:35:30 -0700 (PDT)
Date:   Fri, 19 Mar 2021 14:35:26 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
Message-ID: <YFQ4HuavL7R6VPha@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-4-sergey.senozhatsky@gmail.com>
 <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
 <YFFiizDjNBMG3uI+@google.com>
 <CAPybu_0ruoc-w3402j-vVNs2-xq8=-_XzVKSxiG+iuyB=eNimA@mail.gmail.com>
 <YFLbYjm0VyzaEMkr@google.com>
 <CANiDSCtCaVUxrYeceWXEJ3o61ze8uNyce69xW_KcQTirhWfZaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtCaVUxrYeceWXEJ3o61ze8uNyce69xW_KcQTirhWfZaQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/18 22:19), Ricardo Ribalda wrote:
> >
> > May I please ask for more opinions on this?
> 
> Could you try setting the roi in a loop in your device and verify that
> it accepts all the values with no modification. If so we can implement
> the set/get as a quirk for other devices.

Tested on two (very) different devices.

Firmware D:

   CLAP all passed, we are cool

Firmware H:

   CLAP all passed, we are cool


Code sample

---
       in_selection.target     = V4L2_SEL_TGT_ROI;
       in_selection.flags      = V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE;

       for (int i = 0; i < 1001; i++) {
               in_selection.r.left     = 0 + i;
               in_selection.r.top      = 0 + i;
               in_selection.r.width    = 42 + i;
               in_selection.r.height   = 42 + i;

               ret = doioctl(fd, VIDIOC_S_SELECTION, &in_selection);
               if (ret) {
                       fprintf(stderr, "BOOM %d\n", ret);
                       exit(1);
               }

               ret = doioctl(fd, VIDIOC_G_SELECTION, &in_selection);
               if (ret) {
                       fprintf(stderr, "BANG %d\n", ret);
                       exit(2);
               }

               if (in_selection.r.left != i ||
                   in_selection.r.top != i ||
                   in_selection.r.width != i + 42 ||
                   in_selection.r.height != i + 42) {

                       fprintf(stderr, "SNAP %d %d %d %d != %d %d %d %d\n",
                               i, i, i + 42, i + 42,
                               in_selection.r.left,
                               in_selection.r.top,
                               in_selection.r.width,
                               in_selection.r.height);
                       exit(3);
               }
       }

       fprintf(stderr, "CLAP all passed, we are cool\n");
---
