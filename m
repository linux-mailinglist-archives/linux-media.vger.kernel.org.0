Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3142ECFD7
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 13:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbhAGMdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 07:33:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39410 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbhAGMdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 07:33:18 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 931831F4628C
Message-ID: <f499532ca147a0d2907a5020fb69def89d4c69a6.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: silence ktest bot build warning
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel test robot <lkp@intel.com>
Date:   Thu, 07 Jan 2021 09:32:28 -0300
In-Reply-To: <20210107124132.3648e789@collabora.com>
References: <20201208155540.340583-1-adrian.ratiu@collabora.com>
         <76b5569c-bc19-3d11-4da7-cf0dbb244433@xs4all.nl>
         <20210107124132.3648e789@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-01-07 at 12:41 +0100, Boris Brezillon wrote:
> On Thu, 7 Jan 2021 10:13:43 +0100
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
> > On 08/12/2020 16:55, Adrian Ratiu wrote:
> > > Some configurations built by the ktest bot produce the following
> > > warn, so mark the struct as __maybe_unused to avoid unnecessary
> > > ML spam.
> > >   
> > > > > drivers/staging/media/rkvdec/rkvdec.c:967:34: warning: unused variable 'of_rkvdec_match' [-Wunused-const-variable]  
> > >    static const struct of_device_id of_rkvdec_match[] = {
> > >                                     ^
> > >    1 warning generated.  
> > 
> > I suspect that this is because there is no 'depends on OF' in the Kconfig.
> > 
> > '__maybe_unused' isn't used for this anywhere else, so this does not seem like the
> > right approach.
> 
> It's not uncommon to do that, especially when you want the driver to be
> compile-tested (`git grep -C2 __maybe_unused|grep of_device_id` even
> reports 2 drivers in the media tree :P). A `depends on OF` or an
> `#ifdef CONFIG_OF` section surrounding the of_rkvdec_match declaration
> would also do the trick.
> 

I'm fine either way, __maybe_unused or depends on OF.

Thanks,
Ezequiel

