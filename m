Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12A317D698
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2020 23:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgCHWBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Mar 2020 18:01:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36305 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgCHWBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Mar 2020 18:01:00 -0400
Received: by mail-pg1-f196.google.com with SMTP id d9so3807481pgu.3
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2020 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Jj+pYaKWaJaTeG0F5AyQyT4b1oSwBJ8WFgHn5sIktlU=;
        b=Fqi5ioWbAO0pDPjAJowbvb9fyLmk+BKKgPKGbUyVLzD71qg+GAKB8pU/1IMbnmNw4J
         tMvoXzOmgdmctc0ywORmdbDHCmOjatbb82qBfG6etyh94dqkUicciky5OnmaLh044W/N
         sbBimcwsgUIMDZxIhsHY4MuFBxfHFzNX8ZilIjG3ayAprv+TcsACtfLavo2hw4HAPWDm
         oBND6cBg3EY8ssfsP6ZIFqszXHNKDfKQcKVfSL2H36GsK+eiYFd/R/DJL/fIqlVv/0u6
         FfnqiNaiIaUybXoOgswiWe+0UvRZfhVp+buBVzhYg4wOF1CaBCU1sLDYjQSHAyrqyHSB
         jPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jj+pYaKWaJaTeG0F5AyQyT4b1oSwBJ8WFgHn5sIktlU=;
        b=Z8nBhLNSLd0Ve8SknDLE21UB+HKXAaWQds3CJwokzK1SVgRo/8BQ1/tVJjafxF0qBr
         t9qyQ6uI+7JwrNZCScQPHtmG+hlQgYWlBWwQamibLBrkVWdV5ok7LkOqGmVY/lagoP8w
         xntdzjoXsXJFNOw9K7FBX3wARxRGYdqBTv+/X2vIewGwFyQn0UwbUf/aE2z+ghj+CP2F
         27NDrBBE97/0E+XysF06eNrL4r64oBkVGtgNWvM4HVYz7PRqFHh1hsvDXpb1yKsLJDlf
         IVpA1qA+dMC15OOS76HLYJud9ml2MLNg4akGwh8Le/xq0nVRu4A3TXo7F6/XxhO8qB9r
         r2iA==
X-Gm-Message-State: ANhLgQ3QWkOImaNE95NY+Tk35UD+4+pqGvXEPdeR+j4inAVHGFC5nFcj
        K21nbs73FrETC/iFgz1IbbgRPu5pH3M=
X-Google-Smtp-Source: ADFU+vte8T+v2ZSoXd563AmJO+qtYjLzhk2OSgoaY6ZOhWMEqZV1BwiVLtqBYkvBcIQi+T9cpRvv6Q==
X-Received: by 2002:a63:f752:: with SMTP id f18mr13436739pgk.196.1583704859771;
        Sun, 08 Mar 2020 15:00:59 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d12sm20434900pfq.87.2020.03.08.15.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 15:00:59 -0700 (PDT)
Date:   Sun, 8 Mar 2020 15:00:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Elliot Berman <eberman@codeaurora.org>
Subject: Re: [PATCH] venus: firmware: Ignore secure call error on first resume
Message-ID: <20200308220057.GA1098305@builder>
References: <20200304155809.19637-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304155809.19637-1-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 04 Mar 07:58 PST 2020, Stanimir Varbanov wrote:

> With the latest cleanup in qcom scm driver

I've seen similar issues in other drivers, but I think the culprit is
the following bug fix 'ff34f3cce278 ("firmware: qcom: scm: Ensure 'a0'
status code is treated as signed")', rather than the recent refactoring.

As this is a bug fix it's quite likely to show up in linux-stable as
well and regress older versions, so you should probably Cc stable as
well.

> the secure monitor
> call for setting the remote processor state returns EINVAL when
> it is called for the first time and after another scm call
> auth_and_reset. The error returned from scm call could be ignored
> because the state transition is already done in auth_and_reset.
> 

I'm not sure what the appropriate mechanism is here, but your workaround
seems reasonable.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index de6812fb55f4..8801a6a7543d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -44,8 +44,14 @@ static void venus_reset_cpu(struct venus_core *core)
>  
>  int venus_set_hw_state(struct venus_core *core, bool resume)
>  {
> -	if (core->use_tz)
> -		return qcom_scm_set_remote_state(resume, 0);
> +	int ret;
> +
> +	if (core->use_tz) {
> +		ret = qcom_scm_set_remote_state(resume, 0);
> +		if (resume && ret == -EINVAL)
> +			ret = 0;
> +		return ret;
> +	}
>  
>  	if (resume)
>  		venus_reset_cpu(core);
> -- 
> 2.17.1
> 
