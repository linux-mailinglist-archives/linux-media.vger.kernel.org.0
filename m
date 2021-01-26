Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF51303592
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388790AbhAZFqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:46:05 -0500
Received: from m12-12.163.com ([220.181.12.12]:44516 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729346AbhAZCwi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 21:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=mxInm
        W0WGyD7tNP1IlQncdf8KhYE4vvXW0RaNikDrpY=; b=VBch1yBoEU6YLN9mWCA8L
        owEmX3Mxei73LlwWeFZKU1pqdh1d4FWr7mmioHzwsK21lRJ4XS2piCosLSEMJb1/
        WSUJvThyMAln9lPcMSpRtNDrgRdJxOut/mllmYU6hWxBXolbUa8b3wWU8hGgcTxX
        yYc4wE95aqoq7zCd55qU8Q=
Received: from localhost (unknown [218.94.48.178])
        by smtp8 (Coremail) with SMTP id DMCowABHf6uTgw9gy6c8Nw--.6162S2;
        Tue, 26 Jan 2021 10:51:00 +0800 (CST)
Date:   Tue, 26 Jan 2021 10:50:58 +0800
From:   Guoqing Chi <chi962464zy@163.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhangwen@yulong.com
Subject: Re: [PATCH] media: vidtv: remove redundant quote
Message-ID: <20210126105058.000034a4@163.com>
In-Reply-To: <b470e011-a21e-f333-6650-5c025906d63e@xs4all.nl>
References: <20210119010947.709-1-chi962464zy@163.com>
        <b470e011-a21e-f333-6650-5c025906d63e@xs4all.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: DMCowABHf6uTgw9gy6c8Nw--.6162S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw47urW8Ww4kZry5Jr43Jrb_yoWDuFb_Cw
        s7Zr4xu34Utr18tF15JF9rZryYkayDZFs5XF98tw1YvFy3Za45J3Wavw17Aa12gF4IvFsr
        Zry5X348ur13WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRiXdb5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pfklmlasuwk6r16rljoofrz/1tbiNxQmRFWBjYMKtAAAsl
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 25 Jan 2021 12:26:54 +0100
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 19/01/2021 02:09, chiguoqing wrote:
> > Repeated references string.h
> > 
> > Signed-off-by: Wen Zhang <zhangwen@yulong.com>  
> 
> checkpatch gives me:
> 
> ERROR: Missing Signed-off-by: line by nominal patch author
> 'chiguoqing <chi962464zy@163.com>'
> 
> Can you fix this?
> 
> Regards,
> 
> 	Hans

Hi Hans:
  I will resend patch,and change author to zhangwen. Thanks.

> 
> > ---
> >  drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> > b/drivers/media/test-drivers/vidtv/vidtv_psi.c index
> > 4511a2a98405..8ff27d26c343 100644 ---
> > a/drivers/media/test-drivers/vidtv/vidtv_psi.c +++
> > b/drivers/media/test-drivers/vidtv/vidtv_psi.c @@ -19,7 +19,6 @@
> >  #include <linux/ratelimit.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> > -#include <linux/string.h>
> >  #include <linux/time.h>
> >  #include <linux/types.h>
> >  
> >   


