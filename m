Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D8D23D0DC
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgHETxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgHEQtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:49:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D4FC0A889B
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 06:59:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id p20so5906745wrf.0
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2020 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UnXJHln0qJbsyvbPd5nqi57xc+Rx9WPeYE5iXwX0XOk=;
        b=i2iCcpioXVjoTQdXBrEiKZV8HDQohs1SW7AoSkaqbNBRXcATmKyNRwZxG4abyUrF/h
         B6+YN267k8wKf9sNxJmzjXsmxoMYwVpDwfZPKKzt7226rrpXlZX/MhDCkRZa33QHeskX
         zUu81CIeAk5bQUepUE4nvi440fLTOq94xYNVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UnXJHln0qJbsyvbPd5nqi57xc+Rx9WPeYE5iXwX0XOk=;
        b=s+hfjPbxCDmE74fhBvXmxSTAbLz2etvvqE7OnYwxYLDyiv0TVcczRSRIk4BmuLIzv0
         MaVXzD3s6iRIFz2bir0iw0s10n56kRDApbnHJbysTSwVgNASiIjd42y+ZL8cS0b64VB6
         QvqYO71NfAdidyMgwW2oZ6FSd1Q7Jo9HgQLfNSEB33CjvA6+e7inKztNQZv426fp5tN4
         8aAOceMijZgVBsnhpehRGvzbPmirkVZc9WXlN+/UHUprEI9Anb6DFjFzP1PZs0yzpW3k
         mZMcgfWfgUNhLPejJoIfLT58+zb6yFWJUUXChD0hhd5sYhQv07D9WW+/z5JYh//dUPIX
         ZSJA==
X-Gm-Message-State: AOAM532bWpwanr5N6tw1rydREX4w3RzFrVirTPJwGWJE3SBqZDnqH0uc
        9Wim6xFSoOJMzsovECIqgYozDw==
X-Google-Smtp-Source: ABdhPJzJiPiCgoIc7QqL+Le88T/qe30fnQtcEXtkyzxhaRvh6U8/yV/tcZZjKgew/5QRIdgnJQoUOQ==
X-Received: by 2002:adf:f341:: with SMTP id e1mr3112056wrp.207.1596635987978;
        Wed, 05 Aug 2020 06:59:47 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id t202sm2936254wmt.20.2020.08.05.06.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:59:47 -0700 (PDT)
Date:   Wed, 5 Aug 2020 13:59:46 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 5/9] media: staging: rkisp1: add a pointer to
 rkisp1_device from struct rkisp1_isp
Message-ID: <20200805135946.GA1015630@chromium.org>
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
 <20200718145918.17752-6-dafna.hirschfeld@collabora.com>
 <d8475ade-94a3-48ad-02d7-f03810ddf6dc@collabora.com>
 <114a3242-88e9-46a1-c8c8-f5bfd424d05a@collabora.com>
 <CAAFQd5BLuwfnQfYbaWmtre5YCx-_YG4E10cZxeL+6pESap_U0A@mail.gmail.com>
 <fa457a47-4005-8c64-d135-96b321ddd6a6@collabora.com>
 <CAAFQd5ATRvBapupZaBf6TkWcVwOy7C9+A95+vLHJiwuUca4LQg@mail.gmail.com>
 <74c2563c-25ca-833b-2f72-b6e10e6e3847@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74c2563c-25ca-833b-2f72-b6e10e6e3847@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 01, 2020 at 06:08:06PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 21.07.20 17:32, Tomasz Figa wrote:
> > On Tue, Jul 21, 2020 at 5:30 PM Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> > > 
> > > Hi,
> > > 
> > > On 21.07.20 14:36, Tomasz Figa wrote:
> > > > On Tue, Jul 21, 2020 at 2:26 PM Dafna Hirschfeld
> > > > <dafna.hirschfeld@collabora.com> wrote:
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > On 20.07.20 21:25, Helen Koike wrote:
> > > > > > 
> > > > > > 
> > > > > > On 7/18/20 11:59 AM, Dafna Hirschfeld wrote:
> > > > > > > The code in rkisp1-isp.c requires access to struct 'rkisp1_device'
> > > > > > > in several places. It access it using the 'container_of' macro.
> > > > > > > This patch adds a pointer to 'rkisp1_device' in struct 'rkisp1_isp'
> > > > > > > to simplify the access.
> > > > > > 
> > > > > > What is wrong with container_of?
> > > > > 
> > > > > I remember Laurent suggested it a while ago.
> > > > > I also feel container_of is a bit cumbersome and other entities already have a pointer to rkisp1_device.
> > > > > 
> > > > 
> > > > Do we even need the rkisp1_isp struct? Could we just pass rkisp1_device instead?
> > > 
> > > pass to where ?  You mean to the function rkisp1_mipi_csi2_start ?
> > 
> > Yes, all around the driver, where rkisp1_isp is passed.
> 
> Most of the functions are part of subdevice callback implementation
> where the rkisp1_device is not needed, so I don't the see the point.

Okay, so then I'd just lean towards keeping it as is. container_of is
generally considered more efficient than a pointer, because it doesn't
require a load operation to obtain a reference to the parent struct.

Best regards,
Tomasz
