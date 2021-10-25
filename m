Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECF3439861
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 16:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbhJYOXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 10:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhJYOXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 10:23:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618BCC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 07:21:16 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 84-20020a1c0457000000b003232b0f78f8so13370246wme.0
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=M2t/ljyMrSuXJkPKEqRg6rIEcIkhDvv9y02qHL6/vSA=;
        b=HnJfizDONe/3Ah4LArAtk4rNpri4e/nd+R022uQwk6uOK/euQFILctLpRi0WoJC+Rv
         akNDcgmWu3b0WFc814xw9EFbPyGunTCw34CqooWBboOE2KGXGPEkaPE3dgHFnBQ37h9K
         CsB0DyUz4zdOv96Ah7h7TdpDr0RlVkMhLsXgPFVjeVsGIxEZ6qi8TcIDyp9lAIGdkoxQ
         ZpX9LrM5qHGPjLVL+U5nssVoJ24QfpGMJvvwp6UTAdyJwdAk/+cJ6hCLb9OR4SuoBIn4
         uBCjWggLsLNpLi/5rpTRH+vNBuE+Pl5d9gdVEo/RzOaxcjJLb8c80XcUofkTIQ6kjwwV
         BuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=M2t/ljyMrSuXJkPKEqRg6rIEcIkhDvv9y02qHL6/vSA=;
        b=wQKWiyi1QU+VP6feXW+lUQQe4kb9Flz+WpqreoOLDim2Uir9Dm6kFsCJqvqkrJ+JZQ
         gwYMKua2OcZDYAfuMpxmnSPZisfDl18UICQTn476DTGwdVhczR/xbj+klYt/kp7ytszq
         dKTcdIgaPuYZ6IeoteiY8aP12DxsYMzt1PPP53FCFtMRky6UA84WpaVq0/dwofjOxnXF
         3ioM4IUpdPRdjWhLPyyZoP2nPCrUCVg4T+ac+CT1fOMHt2knizdBDQKyFjTaC5Ua/SV3
         y6X3gWYqaZ04zWZ/oEDUpUCD/Zgs//8T0TUhXLDzBqowsZaXw24NxK+g5wRErLLelM2v
         IrVg==
X-Gm-Message-State: AOAM533KXv59gvI4AxHJCD4XrFyEmSTyitozGFIfGAXNhKM5590FIGsK
        EBBlrLqYWzEL4+EWlV5cGTOd6Q==
X-Google-Smtp-Source: ABdhPJxZdvPCuvpV6tREqY0nQE+UB8Cnxc1p8PDS1uJcZgD/pQ7VS7MzXqg1nnKjYeohcPySiJe9iw==
X-Received: by 2002:a1c:4d08:: with SMTP id o8mr17787192wmh.35.1635171674960;
        Mon, 25 Oct 2021 07:21:14 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id u2sm15907155wrr.35.2021.10.25.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:21:14 -0700 (PDT)
Date:   Mon, 25 Oct 2021 16:21:12 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
Message-ID: <YXa9WGs7ewyaHmI9@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <da925d73-fdf0-3962-3841-a1dd53b5c5dd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da925d73-fdf0-3962-3841-a1dd53b5c5dd@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Mon, Oct 25, 2021 at 02:45:02PM +0200, Hans Verkuil a écrit :
> Hi Corentin,
> 
> On 13/10/2021 20:58, Corentin Labbe wrote:
> > Hello
> > 
> > The main change of this serie is to fusion all zoran related modules in
> > one.
> > This fixes the load order problem when everything is built-in.
> > 
> > Regards
> > 
> > Changes since v1:
> > - add missing debugfs cleaning
> > - clean some remaining module_get/put functions which made impossible to
> >   remove the zoran module
> > - added the two latest patchs
> 
> Something weird is wrong with this series. I have a DC30, but loading this with:
> 
> modprobe zr36067 card=3
> 
> results in this error message in the kernel log:
> 
> [   58.645557] zr36067: module is from the staging directory, the quality is unknown, you have been warned.
> [   58.646658] zr36067 0000:03:00.0: Zoran MJPEG board driver version 0.10.1
> [   58.646793] zr36067 0000:03:00.0: Zoran ZR36057 (rev 1), irq: 18, memory: 0xf4000000
> [   58.648821] zr36067 0000:03:00.0: Initializing i2c bus...
> [   58.662420] vpx3220 22-0047: vpx3216b found @ 0x8e (DC30[0])
> [   58.737445] zr36067 0000:03:00.0: Fail to get encoder
> 
> This works before, so why this is now failing is not clear to me.
> 
> It does work with 'card=0', but I really have a DC30.
> 
> If I test with 'card=0' then the rmmod issue is now solved.

Everything normal, since card 0 does not have encoder.
Could you check that adv7175 is compiled ?

I got the same problem with my DC10+ where saa7110 was not compiled.
This issue was reproduced randomly and I have no explanation. (kconfig problem ?)

Regards
