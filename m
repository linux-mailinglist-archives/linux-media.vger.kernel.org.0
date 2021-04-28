Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A196D36D358
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 09:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbhD1Hmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 03:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236816AbhD1Hmm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 03:42:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2E67613F8;
        Wed, 28 Apr 2021 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619595718;
        bh=k2BZ9xZikA1qiwskEWEetLqBAKCp0Z9oJXFgxTUYmtw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Vi8Q41F1HdlBeYMrlKgVG2j609ljUqp7dOT+lug12/AGgDYNLVVa5LAIGQq4UN6qQ
         gypWfjQczW66W9iirusrFuTv6SQ6MmRRqf6sDs/KIVveWLpKorA4BtJr8CdFlxScQL
         mb3MszHz9ctWoPXXxLTqUua0QBFkJMNN/XgyRkkosY3K5dg1lpuSO5DrPYioom0LFv
         9AQbNagmHL488T5TYbi2UXalXNcC+BrwSP2Frms+Q910aJoY8tlJ0pdiV6ZvevycU1
         OdLILcanhaXgJzGGyu+huT70QFJgbL3T3ZsjtkvaVj/egYr23D+HilhkbOxiKznIL0
         qz+UtpG9PSqAQ==
Date:   Wed, 28 Apr 2021 09:41:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 13/79] media: s5p: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210428094152.0fbf3f15@coco.lan>
In-Reply-To: <ae9e751a-be29-4ff8-b566-73c4f258d5b8@samsung.com>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <CGME20210427102755eucas1p2a4dd2a52b8bebd76c6a8fac9fa17c284@eucas1p2.samsung.com>
        <fd173b0ac00a31630bc60edaf47c2231970a87ed.1619519080.git.mchehab+huawei@kernel.org>
        <ae9e751a-be29-4ff8-b566-73c4f258d5b8@samsung.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Apr 2021 12:51:45 +0200
Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:

> On 27.04.2021 12:26, Mauro Carvalho Chehab wrote:
> > The pm_runtime_get_sync() internally increments the
> > dev->power.usage_count without decrementing it, even on errors.
> > Replace it by the new pm_runtime_resume_and_get(), introduced by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > in order to properly decrement the usage counter and avoid memory
> > leaks.
> > 
> > While here, check if the PM runtime error was caught at
> > s5p_cec_adap_enable().
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> > index 2a3e7ffefe0a..2250c1cbc64e 100644
> > --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> > +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> > @@ -35,10 +35,13 @@ MODULE_PARM_DESC(debug, "debug level (0-2)");
> >  
> >  static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
> >  {
> > +	int ret;
> >  	struct s5p_cec_dev *cec = cec_get_drvdata(adap);
> >  
> >  	if (enable) {
> > -		pm_runtime_get_sync(cec->dev);
> > +		ret = pm_runtime_resume_and_get(cec->dev);
> > +		if (ret < 0)
> > +			return ret;
> >  
> >  		s5p_cec_reset(cec);  
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Not related to this patch, it seems there is bug in the second
> 'if (enable)' branch, where pm_runtime_disable() is used
> instead of pm_runtime_put(_sync)().

Yeah. I'll add an additional patch before this series in order to
fix the bug. Thanks!

Regards,
Mauro



Thanks,
Mauro
