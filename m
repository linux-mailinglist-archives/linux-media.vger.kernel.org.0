Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776822ECEE6
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 12:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbhAGLmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 06:42:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbhAGLmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 06:42:20 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6BB471F4107E;
        Thu,  7 Jan 2021 11:41:38 +0000 (GMT)
Date:   Thu, 7 Jan 2021 12:41:32 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: rkvdec: silence ktest bot build warning
Message-ID: <20210107124132.3648e789@collabora.com>
In-Reply-To: <76b5569c-bc19-3d11-4da7-cf0dbb244433@xs4all.nl>
References: <20201208155540.340583-1-adrian.ratiu@collabora.com>
        <76b5569c-bc19-3d11-4da7-cf0dbb244433@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 7 Jan 2021 10:13:43 +0100
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 08/12/2020 16:55, Adrian Ratiu wrote:
> > Some configurations built by the ktest bot produce the following
> > warn, so mark the struct as __maybe_unused to avoid unnecessary
> > ML spam.
> >   
> >>> drivers/staging/media/rkvdec/rkvdec.c:967:34: warning: unused variable 'of_rkvdec_match' [-Wunused-const-variable]  
> >    static const struct of_device_id of_rkvdec_match[] = {
> > 				    ^
> >    1 warning generated.  
> 
> I suspect that this is because there is no 'depends on OF' in the Kconfig.
> 
> '__maybe_unused' isn't used for this anywhere else, so this does not seem like the
> right approach.

It's not uncommon to do that, especially when you want the driver to be
compile-tested (`git grep -C2 __maybe_unused|grep of_device_id` even
reports 2 drivers in the media tree :P). A `depends on OF` or an
`#ifdef CONFIG_OF` section surrounding the of_rkvdec_match declaration
would also do the trick.

> 
> Regards,
> 
> 	Hans
> 
> > 
> > vim +/of_rkvdec_match +967 drivers/staging/media/rkvdec/rkvdec.c
> > 
> >    966  
> >  > 967	static const struct of_device_id of_rkvdec_match[] = {  
> >    968		{ .compatible = "rockchip,rk3399-vdec" },
> >    969		{ /* sentinel */ }
> >    970	};
> >    971	MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> >    972
> > 
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> > index aa4f8c287618..3af0f02ec59b 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec.c
> > @@ -992,7 +992,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
> >  	}
> >  }
> >  
> > -static const struct of_device_id of_rkvdec_match[] = {
> > +static const struct of_device_id __maybe_unused of_rkvdec_match[] = {
> >  	{ .compatible = "rockchip,rk3399-vdec" },
> >  	{ /* sentinel */ }
> >  };
> >   
> 

