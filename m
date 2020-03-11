Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 762C41813EE
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 10:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgCKJEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 05:04:34 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:38397 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCKJEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 05:04:34 -0400
Received: by mail-lf1-f45.google.com with SMTP id x22so1012453lff.5
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=10QQaChBYo8HfAtBqjIb9rn380grOzgVfJm9JXkPHN8=;
        b=GbakjEhSlWFud+Ca2CbsQYm7uCWjV1oXT/AnwehsOhDSlWkCU7/VB04NfWY8nBuMGT
         8EWF/B8klcaHBw7JBlNdS44iFyosaET6rAcwamCqu4Oulvgjp7bd4h1C1ozK8mKkc6xR
         /VUoHe2j23ul+ApKA/lEBU/GhcoNh7+ZQm4LLbdEpRVQA1jgsRqlavfbsSpZmjBFvrQ2
         MR/t9hlmgyVsMSetwWT3HxYGpt74KxxmiGRjPI1SS7bgj9dehM+GvbafcER63Pgl4H7m
         4gUDoMDSaWVbJY5i5O5UvrLzCYFiO3F5cdwPZKMD+ChlH5mVCS1jdDvNIjkspgCbOAel
         hT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10QQaChBYo8HfAtBqjIb9rn380grOzgVfJm9JXkPHN8=;
        b=sU6uBOu+CLLPyjXtAupPJQYJw2oOhByp6D//GzsSeIpk3/7i6Z9m64Kn7UJpLqQbjF
         sonnvNXWthgZUZ2HMJeqp5GWWAhxND2wRcCwNNivgv9rQey3vUUXcoQmg+e3FagX+SFe
         WBDm+Xgblnzrw1TygmnFtwrots8cUtq4Wx9jqR3lS5mRHZmBDkhs7tibjy6toyA8ARAR
         CTb//CDT03YaPwbBRiCLUe6ZZM2GpUNBsz+dVoE0cilLksva7VZj2/Do9Frp+HyBXUU+
         8XUnmocjXvwdnLQNuY0Cky7ec1/p5Gp4UHscias2usG/2suw3jrddInTJvFSw+iWYYEb
         mkaA==
X-Gm-Message-State: ANhLgQ2TLqUiMJqI20T2WVrEAvQJS1UmVztjNgI0mFdqsJdTGbMCSKEU
        ZXdYFq0dwenOTEwFJWkW3Z3S0w7pvQo=
X-Google-Smtp-Source: ADFU+vsikQpVl4zASUKjGGtb9aoPFoG/uARnOZqCDmaP5f+4wWY0K0L70CjC/+oh+Lv6DUb7Ig5pVQ==
X-Received: by 2002:a05:6402:3047:: with SMTP id bu7mr1736211edb.44.1583917041749;
        Wed, 11 Mar 2020 01:57:21 -0700 (PDT)
Received: from [192.168.27.209] ([94.155.124.210])
        by smtp.googlemail.com with ESMTPSA id t13sm20969edj.8.2020.03.11.01.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 01:57:20 -0700 (PDT)
Subject: Re: [bug report] media: venus: introduce core selection
To:     Dan Carpenter <dan.carpenter@oracle.com>, amasule@codeaurora.org
Cc:     linux-media@vger.kernel.org
References: <20200311081511.GA7593@mwanda>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <4a76b0e8-cc80-b7a4-7586-604f1369664f@linaro.org>
Date:   Wed, 11 Mar 2020 10:57:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311081511.GA7593@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thanks! The fix is on its way already [1].

On 3/11/20 10:15 AM, Dan Carpenter wrote:
> Hello Aniket Masule,
> 
> The patch 4ebf969375bc: "media: venus: introduce core selection" from
> Dec 2, 2019, leads to the following static checker warning:
> 
> 	drivers/media/platform/qcom/venus/vdec.c:968 vdec_start_streaming()
> 	warn: inconsistent returns 'inst->lock'.
> 
> drivers/media/platform/qcom/venus/vdec.c
>    943  static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
>    944  {
>    945          struct venus_inst *inst = vb2_get_drv_priv(q);
>    946          int ret;
>    947  
>    948          mutex_lock(&inst->lock);
>    949  
>    950          ret = venus_pm_acquire_core(inst);
>    951          if (ret)
>    952                  return ret;
> 
> goto error or just goto unlock?
> 
>    953  
>    954          if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>    955                  ret = vdec_start_capture(inst);
>    956          else
>    957                  ret = vdec_start_output(inst);
>    958  
>    959          if (ret)
>    960                  goto error;
>    961  
>    962          mutex_unlock(&inst->lock);
>    963          return 0;
>    964  
>    965  error:
>    966          venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
>    967          mutex_unlock(&inst->lock);
>    968          return ret;
>    969  }
> 
> regards,
> dan carpenter
> 

-- 
regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg164934.html
