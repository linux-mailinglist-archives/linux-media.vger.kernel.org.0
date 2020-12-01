Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E832CB028
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 23:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgLAWfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 17:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLAWff (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 17:35:35 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274A6C0613D6
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 14:34:55 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id l5so5894019edq.11
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 14:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Yvo9niEDaxPhTUXyHt8vt7CyJEGrV1jvtlgHeLTY/fc=;
        b=GZb7zhGb9fwx8s43+sxGE90a76Q6/tDxePSL/MYKMBMC96onF3fg8FBHyaiqMfG9HO
         bQAcivow12xDUN/BJJus/Po+QuipUMtrCOAtIscQ3OrXkKi4/qvL/u2vduE6qWmBzy4k
         qATUvgGjL3r/nW6PR5RjSJ0V9Z+fsHdfi2hdYvqhWOwWlk30fPPB2uAkCOOhZF5uNDLZ
         IhtUvFHajZDyklToVNTdzs98tpGvhOc6Fy8+Kc+FetVnQ1XfkcqRTOn7UNh/bXi/S1Ll
         DHxCAj61qkWg1RQZylxE3Jh/tcXziDzkERVIRNSJS70XiBHnb0ExxlaCFQFMMlSKzBg+
         GXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yvo9niEDaxPhTUXyHt8vt7CyJEGrV1jvtlgHeLTY/fc=;
        b=LLIjt9g9xGu2apHtp0UMmr4VvsRibPMspZHtZ2cJiYbsFe1rWoKKDHaFCdvhBddDGL
         tH9l7eD1UgjiyVbBvLIxdEVx6FgmP258hn+O9nwlyyduLBSln0e3jlVUotpeeBKVacPr
         rG+/PhJ+0AXf8+QgvoLP35WCwfifsGzGSQ5b2CShawqc3WcwFim/SJUR21WL2jwfxW2W
         PBwZ62gNzA3x08b/ERS9btokfHrpWuKSE1vN3CuOGD4mo8zcGgXf3rbaJuJXDm4VX5KO
         MK7wM/mTIA1o0odIVj7zLJOGSu5xENTk1kVxAARJtUPKLjoMl0V5qUpSYgAKqmFY0/eo
         7ZMw==
X-Gm-Message-State: AOAM530srZr/NNT9hg3n+B8tmjp6mHyrxOXmuL2X95sxJ4Rp85SVgMTf
        dhJl15K4xphnMey8JhrcohSQsg==
X-Google-Smtp-Source: ABdhPJw5HeDjUFihksjVdh2T+BOaYOCFtQdZITxYwR0K2J9lN7LjLRweBYnaiaZBM9kSCHfquzSHig==
X-Received: by 2002:a50:9991:: with SMTP id m17mr5384860edb.48.1606862093621;
        Tue, 01 Dec 2020 14:34:53 -0800 (PST)
Received: from [192.168.0.3] (hst-221-103.medicom.bg. [84.238.221.103])
        by smtp.googlemail.com with ESMTPSA id k18sm546231edx.18.2020.12.01.14.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 14:34:53 -0800 (PST)
Subject: Re: [PATCH v2] venus: vdec: Handle DRC after drain
To:     Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        acourbot@chromium.org
References: <20201201042322.3346817-1-frkoenig@chromium.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <57cc5999-e54c-219c-812b-71b214dbe760@linaro.org>
Date:   Wed, 2 Dec 2020 00:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201042322.3346817-1-frkoenig@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fritz,

On 12/1/20 6:23 AM, Fritz Koenig wrote:
> If the DRC is near the end of the stream the client
> may send a V4L2_DEC_CMD_STOP before the DRC occurs.
> V4L2_DEC_CMD_STOP puts the driver into the
> VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
> that after the DRC event the state can be restored
> correctly.
> 
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
> 
> v2: remove TODO
> 
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 17 +++++++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 2b0899bf5b05f..1680c936c06fb 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -406,6 +406,7 @@ struct venus_inst {
>  	unsigned int core_acquired: 1;
>  	unsigned int bit_depth;
>  	bool next_buf_last;
> +	bool drain_active;

Could you introduce a new codec state instead of adding a flag for such
corner case.

I think that we will need to handle at least one more corner case (DRC
during seek operation), so then we have to introduce another flag, and
this is not a good solution to me. These additional flags will
complicate the state handling and will make the code readability worst

I'd introduce: VENUS_DEC_STATE_DRC_DURING_DRAIN or something similar.

>  };
>  
>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 5671cf3458a68..1d551b4d651a8 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -523,8 +523,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>  
>  		ret = hfi_session_process_buf(inst, &fdata);
>  
> -		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
> +		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
>  			inst->codec_state = VENUS_DEC_STATE_DRAIN;
> +			inst->drain_active = true;
> +		}
>  	}
>  
>  unlock:
> @@ -976,10 +978,14 @@ static int vdec_start_capture(struct venus_inst *inst)
>  
>  	inst->codec_state = VENUS_DEC_STATE_DECODING;
>  
> +	if (inst->drain_active)
> +		inst->codec_state = VENUS_DEC_STATE_DRAIN;
> +
>  	inst->streamon_cap = 1;
>  	inst->sequence_cap = 0;
>  	inst->reconfig = false;
>  	inst->next_buf_last = false;
> +	inst->drain_active = false;
>  
>  	return 0;
>  
> @@ -1105,6 +1111,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
>  		/* fallthrough */
>  	case VENUS_DEC_STATE_DRAIN:
>  		inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +		inst->drain_active = false;
>  		/* fallthrough */
>  	case VENUS_DEC_STATE_SEEK:
>  		vdec_cancel_dst_buffers(inst);
> @@ -1304,8 +1311,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>  
>  			v4l2_event_queue_fh(&inst->fh, &ev);
>  
> -			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +			if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
> +				inst->drain_active = false;
>  				inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +			}
>  		}
>  
>  		if (!bytesused)
> @@ -1429,9 +1438,13 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>  	case EVT_SYS_EVENT_CHANGE:
>  		switch (data->event_type) {
>  		case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
> +			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +				inst->codec_state = VENUS_DEC_STATE_DECODING;

Could you move this state transition into vdec_event_change(). That way
we will do it only once.

>  			vdec_event_change(inst, data, true);
>  			break;
>  		case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
> +			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +				inst->codec_state = VENUS_DEC_STATE_DECODING;

ditto

>  			vdec_event_change(inst, data, false);
>  			break;
>  		case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
> 

-- 
regards,
Stan
