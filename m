Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8BA278C47
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 17:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbgIYPNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 11:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728527AbgIYPNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 11:13:32 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04040C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 08:13:32 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id c4so827352oou.6
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o2Exc0VBzd1ZNlpHVolK8GIrxWSC5fjv/MamEye1CJU=;
        b=ZU3Z9UgkdkEleoOCD2pAZl7P746k2eSXo1QpjnhEr/LIKvmhtAYVxNwwxdjdGe/8jp
         yizjFfOFng297w6kW82u/7EK9fl5bdl1XRjTw/ujyJl5Rdew/OOBkOX7Vjv+/vEEG559
         qe1lQ8yo5qj0smPTw/NSREaaPyYKYrEujCR6r4z28CLPUOpZlixAJpCBF6u8oJ1xGlsL
         CaSQicVjlrPJ+uqN98DTIzQDj6qYSV3c2Jh+a6LZgZCBo9q5wwQvZ83o1NrowIOQWwzS
         rzgu47afS7y8NTjp9OX3duZkS2qItbsNxNcrtdHB5UGKEwxdpjw8dd+0HI45FPpCnFUQ
         ViSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o2Exc0VBzd1ZNlpHVolK8GIrxWSC5fjv/MamEye1CJU=;
        b=Mih27CtyVeUOAzVC+Nc9g2xD8x9t7JPg7xLgBfj/gVbi4iWsMzJDGCmXBH+u4cVC6f
         1UyG2IIL1VfclB/cHUnP/l0gKVAbPCAOZ2I/sxhQ3tlUH1wF5AngC5FNQhWS1t0AC04Z
         gSf/4f300TS6TRMQ9cs4q22VXHblktCoBqi5t6N6nhnfIyciA+hOXxgqeyOtaN+gLtG8
         jbp2mZGiCBLXwruxqn1UVyxyizYySf7pacJDrmvJLugHiVNmfkBqpxKsHtDv9TDdZnc8
         XYuaHgk0hgxo2sFlxThMlv+RwtBmJxWTOi0lPXWW10iSLNTVkL6DwV7rskf5elwRU7KU
         A8NA==
X-Gm-Message-State: AOAM532QD7fSnWPG4Vr4sZ7OeE09SiwVaNVC3QLdLtxV1hCUVOvvCB6a
        UgFEBGAhpF1FKmQhk9XsrEkVqQ==
X-Google-Smtp-Source: ABdhPJxEWKdnpqf5Z7ph3yamNi6DbElNakvjUXJwVJzGCJsO9xYsMWxm0+GWTqRp12Q29DfPg8KFwA==
X-Received: by 2002:a4a:e516:: with SMTP id r22mr1182921oot.3.1601046811391;
        Fri, 25 Sep 2020 08:13:31 -0700 (PDT)
Received: from yoga (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id x15sm746755oor.33.2020.09.25.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 08:13:30 -0700 (PDT)
Date:   Fri, 25 Sep 2020 10:13:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: venus: simplify the return expression of
 session_process_buf()
Message-ID: <20200925151328.GC2510@yoga>
References: <20200921131038.92204-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921131038.92204-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 21 Sep 08:10 CDT 2020, Qinglang Miao wrote:

> Simplify the return expression.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 50439eb1f..fb3fd3640 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -439,7 +439,6 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  	struct vb2_buffer *vb = &vbuf->vb2_buf;
>  	unsigned int type = vb->type;
>  	struct hfi_frame_data fdata;
> -	int ret;
>  
>  	memset(&fdata, 0, sizeof(fdata));
>  	fdata.alloc_len = buf->size;
> @@ -470,11 +469,7 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  		fdata.offset = 0;
>  	}
>  
> -	ret = hfi_session_process_buf(inst, &fdata);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return hfi_session_process_buf(inst, &fdata);
>  }
>  
>  static bool is_dynamic_bufmode(struct venus_inst *inst)
> -- 
> 2.23.0
> 
