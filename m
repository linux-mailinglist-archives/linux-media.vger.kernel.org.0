Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AA378413D
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 14:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbjHVMwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 08:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235871AbjHVMwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 08:52:41 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3841BE
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 05:52:39 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c1d03e124so560715266b.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692708758; x=1693313558;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lA6A+Yo3HuR3qPyPO59IwQna5CbRvYTCn4AiEj8I+hc=;
        b=bP4BL09Yln9CMeoXgbYGy+i1OeB/O7JLX7N7Mbg5uaIdYbUGlmthH0/UxD0DI5BkuZ
         5zQydHOeQPu6F/7MSdlhDH7rTJYbpVtSAbE+G6+h6RWN2vzp0rqJ9KffUfC47imRAq0Y
         KH6YBBtzFxYXNAvj1IutTzNUjUmiT8JUqDpFf6ISGleVmcbRSTwzDrJbMoZZ2+myRQx6
         MJbafxl1YGuzFjo8PE2dYUdGYMrycftT4iX4dP+ciYnDCmGydLtF+bNQkg3xC2VA3MiP
         3cBWtSbw00S1XFBCGe81rN9OQrLHIUVJKF6xXBC2aHgYdjlHJn0rKMGsZ71zpjMHVvBH
         YS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692708758; x=1693313558;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lA6A+Yo3HuR3qPyPO59IwQna5CbRvYTCn4AiEj8I+hc=;
        b=Zk1Y1jRsltINmQMw7BtNYJXCJxQ1vzYo33sOzjgnoUPT3C9ZAZbHTFqLWtLFjiV4ti
         1RgF0323uQH8FsK8clMbH49bZ1iiXCYWPBgBfAHXMSdhPg/J+klBcAEMOYOWszBlpcTt
         Cag6JI73XLeUSoFP4ekNLeWhj/7VE7ftixiaLq6DIXFtVHu7tnRz4QFDMLlmvsKaMHcX
         j3jdzTNuRbnQu7oFOsrM0yO4mszjPvidUAIhUibCF07yPb8XkAHlBxZVMbi/VXJWIYvI
         tq6OToM0D7YNNPI77Um0YDa0+qX6FAEhz+AA27EfFU7rR9RwkaP9SUcVpbIgXXYdlyQ/
         TBFA==
X-Gm-Message-State: AOJu0YwW0hmZx/gZPfzjq6ZdVsbYcR5NwYcVTNS7AkkGUbQNvwQnPx0m
        V/TSapx2dXCexjciMAOBSbQ=
X-Google-Smtp-Source: AGHT+IGZQBxKwUensLrG8+QzNcn4rFuM/ZO/qXXl38lLYDtZ1e2DjbLO3FEoH9quRYWh2JUt/DF+Jg==
X-Received: by 2002:a17:906:7693:b0:99e:14e8:e4e5 with SMTP id o19-20020a170906769300b0099e14e8e4e5mr6985797ejm.59.1692708757462;
        Tue, 22 Aug 2023 05:52:37 -0700 (PDT)
Received: from [192.168.101.51] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id r23-20020a170906351700b0098951bb4dc3sm8127234eja.184.2023.08.22.05.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 05:52:36 -0700 (PDT)
Message-ID: <471df7ffdf34b73d186c429a366cfee62963015f.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   claus.stovgaard@gmail.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        andreaskleist@gmail.com
Date:   Tue, 22 Aug 2023 14:52:35 +0200
In-Reply-To: <20230821121908.GD10135@pendragon.ideasonboard.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
         <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
         <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
         <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
         <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
         <20230821121908.GD10135@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2023-08-21 at 15:19 +0300, Laurent Pinchart wrote:
> Hi Claus,
>=20
> On Mon, Aug 21, 2023 at 12:07:59PM +0200, Claus Stovgaard wrote:
> > On Mon, 2023-08-21 at 08:55 +0200, Claus Stovgaard wrote:
> > >=20
> > > Looking forward to try your branch. Looks much cleaner, and would
> > > be
> > > nice to get working :)
> >=20
> > I got it to work on Dell XPS 9320.
>=20
> I'm glad to hear this ! Even if PSYS support will be needed to make
> the
> IPU6 truly usable, it is a very nice step in the right direction.
>=20
> Would you be interested in adding initial support for the IPU6 in
> libcamera ? :-) Given that only the ISYS is currently available, and
> given the simplicity of the hardware, it may be as easy as a single
> line
> addition.
>=20
>=20

Hi Laurent.

Thanks for your offer - it might come in handy to have libcamera
support, but I don't need it right now.

My use case is a bit special. I am working as Embedded Engineer for
Ambu A/S, where we have 2 display units, named aView2 and aBox2, for
single use endoscopy.

https://youtu.be/eDcSrHxzZ70?t=3D14

Those units is based on the intel Apollo Lake with IPU4, where only the
isys part of IPU4 is used, as a FPGA in front of the Apollo Lake is
used for image processing. So the image stream is sent to the Apollo
Lake as RGB data - and is using the IPU4 isys as DMA. E.g. like below.

scope -> FPGA -> tc358748 -> IPU4-> memory

We need to support this for newer kernels, then provided from intel
(4.14 / 4.19) and looking at the code, it seems like a better option to
base it on this IPU6 isys driver and extend it to cover IPU4 isys also.

So we are being inspired by the provided 4.14 / 4.19 kernel, and then
work on the IPU6 codebase.

Our current status is that my coworker has the Buttress to load the
firmware on IPU4, and we will continue work from there.

My end goal would be that an upstream vanilla kernel is able to support
the isys part of IPU4, and the complete IPU6.

Regards
Claus
