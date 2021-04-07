Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C028C356DFB
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 15:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347977AbhDGN6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 09:58:55 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57827 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233192AbhDGN6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 09:58:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8halSGbnMxedU8hdlIfBo; Wed, 07 Apr 2021 15:58:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617803924; bh=onZYKiO2ryB03rtiquvQWthJJoRJUhP6gwwyRt4KCtk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FZpurIKOh5wU1UJu1zZ2+O/0cbRq0jshGbXAxzToJ3LyY9qumckoxIXG02+dKsIX3
         HPHe2IkCPWJEZyqY8Jde43fTxAv6mSFtLai3+O+ZR5qpVZeW2YRhfa9TUuuwTrAqdq
         lXj7OAEjcPeM3SziNe40iHXNO/Z3dxdIxbCr5Mmth4ssZRB0BPd82iREF18rpVFLh/
         lJ7nMwJ022CWMAJe3+TE6VeIUDtUzpUiTrnlLyJaHIRTsmpAdRHIlJxm2DOWg9Xfu3
         pWFHCGAkwKz5k3mOy2m5EDRHB2p9Imf2o+sjsoUIrLak453z4y9pIzB32bd6RYESJJ
         gxLPvISvE3CRw==
Subject: Re: [PATCH] media: platform: sti: Fix rumtime PM imbalance in
 regs_show
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210407054313.5570-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b6a94215-4445-dd94-1e54-fe0c1397b2b4@xs4all.nl>
Date:   Wed, 7 Apr 2021 15:58:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407054313.5570-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIWyhgy0yEkkE9M6C2ta9p6aNs5j/M8qPKQIB+f2MdFhbueUBlWCek85pPSSnjSQEhDVSy8rVz/1r9ttg97d6I8OsePspaoNwKEKxPZsJCIBbrb3hHlt
 vyAJW/d3V/vKJ23jMnmzO/BGR0fMXb4ImyUMJ9zTUapXKRhp/2hq9Vd7iixjR8aveUcysPZvH4m4fVhqehlRgxbUeUkYIh4U66UJlfKvEAAAR5Lz7YiHVdBM
 dvs/Vn1e8c/PlfKT8X3isVDCDH2P/8Pa7gur9eyT9rCG2ktVBtuFtY53ATLKIVp3TPZvLuGnNhv3uOXEQMnfngCgvYuPBLRBrvKsxel1x5qN4rK9RY68S8uf
 Dameai2u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/04/2021 07:43, Dinghao Liu wrote:
> pm_runtime_get_sync() will increase the rumtime PM counter
> even it returns an error. Thus a pairing decrement is needed
> to prevent refcount leak. Fix this by replacing this API with
> pm_runtime_resume_and_get(), which will not change the runtime
> PM counter on error.

Nice that a new function was created for this. Good news.

Just a heads up: if you make more patches like this, make sure you
fix the typo 'rumtime' to 'runtime'. I'll fix it manually, no need
to repost. And 'rumtime' does sound tasty!

Regards,

	Hans

> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/sti/bdisp/bdisp-debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sti/bdisp/bdisp-debug.c b/drivers/media/platform/sti/bdisp/bdisp-debug.c
> index 2b270093009c..a27f638df11c 100644
> --- a/drivers/media/platform/sti/bdisp/bdisp-debug.c
> +++ b/drivers/media/platform/sti/bdisp/bdisp-debug.c
> @@ -480,7 +480,7 @@ static int regs_show(struct seq_file *s, void *data)
>  	int ret;
>  	unsigned int i;
>  
> -	ret = pm_runtime_get_sync(bdisp->dev);
> +	ret = pm_runtime_resume_and_get(bdisp->dev);
>  	if (ret < 0) {
>  		seq_puts(s, "Cannot wake up IP\n");
>  		return 0;
> 

