Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC70728689E
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 21:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgJGTxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 15:53:18 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:42152 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbgJGTxS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 15:53:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602100397; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=y/Hs4nN28QIPh7k57IFR93DTFtO3KcbPd/P4OgQym4s=;
 b=MiV4aB37vAEFnuWmA+BtxenghxTOj/ERzjU6qnvuVj+8SJf01DW+iR+qNQXOnJSHP1FIVJLs
 AOcPLMOxbtZA4D/9QOfwAwEAmyC3oSV4GRO0msGuveFJLkAukIIupeEbwNe+lGYTmXEnQjCr
 0Juf3QKLIq2A+2jXb65wzIiXl1E=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f7e1cadd63768e57be386d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Oct 2020 19:53:17
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 322DFC433F1; Wed,  7 Oct 2020 19:53:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73E20C433C8;
        Wed,  7 Oct 2020 19:53:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Oct 2020 01:23:15 +0530
From:   vgarodia@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH 2/3] venus: vdec: Make decoder return LAST flag for
 sufficient event
In-Reply-To: <20200928164431.21884-3-stanimir.varbanov@linaro.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
 <20200928164431.21884-3-stanimir.varbanov@linaro.org>
Message-ID: <5a823acc60d4c5cace1d2562adc548ff@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2020-09-28 22:14, Stanimir Varbanov wrote:
> This makes the decoder to behaives equally for sufficient and
behaves

> insufficient events. After this change the LAST buffer flag will be set
> when the new resolution (in dynamic-resolution-change state) is smaller
> then the old bitstream resolution.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 41 ++++++++++++++++--------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c
> b/drivers/media/platform/qcom/venus/vdec.c
> index c11bdf3ca21b..c006401255dc 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -634,6 +634,7 @@ static int vdec_output_conf(struct venus_inst 
> *inst)
>  {
>  	struct venus_core *core = inst->core;
>  	struct hfi_enable en = { .enable = 1 };
> +	struct hfi_buffer_requirements bufreq;
>  	u32 width = inst->out_width;
>  	u32 height = inst->out_height;
>  	u32 out_fmt, out2_fmt;
> @@ -709,6 +710,22 @@ static int vdec_output_conf(struct venus_inst 
> *inst)
>  	}
> 
>  	if (IS_V3(core) || IS_V4(core)) {
> +		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
> +		if (ret)
> +			return ret;
> +
> +		if (bufreq.size > inst->output_buf_size)
> +			return -EINVAL;
> +
> +		if (inst->dpb_fmt) {
> +			ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT2, &bufreq);
> +			if (ret)
> +				return ret;
> +
> +			if (bufreq.size > inst->output2_buf_size)
> +				return -EINVAL;
> +		}
> +
>  		if (inst->output2_buf_size) {
>  			ret = venus_helper_set_bufsize(inst,
>  						       inst->output2_buf_size,
> @@ -1327,19 +1344,15 @@ static void vdec_event_change(struct venus_inst 
> *inst,
>  	dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
>  		sufficient ? "" : "not", ev_data->width, ev_data->height);
> 
> -	if (sufficient) {
> -		hfi_session_continue(inst);
> -	} else {
> -		switch (inst->codec_state) {
> -		case VENUS_DEC_STATE_INIT:
> -			inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
> -			break;
> -		case VENUS_DEC_STATE_DECODING:
> -			inst->codec_state = VENUS_DEC_STATE_DRC;
> -			break;
> -		default:
> -			break;
> -		}
> +	switch (inst->codec_state) {
> +	case VENUS_DEC_STATE_INIT:
> +		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
> +		break;
> +	case VENUS_DEC_STATE_DECODING:
> +		inst->codec_state = VENUS_DEC_STATE_DRC;

Video firmware would raise reconfig event to driver even for cases like
interlace detection, color space change in the bitstream. If not with 
this patch,
we can optimize by sending reconfig event only for resolution and 
bitdepth update,
in a followup patch.

> +		break;
> +	default:
> +		break;
>  	}
> 
>  	/*
> @@ -1348,7 +1361,7 @@ static void vdec_event_change(struct venus_inst 
> *inst,
>  	 * itself doesn't mark the last decoder output buffer with HFI EOS 
> flag.
>  	 */
> 
> -	if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
> +	if (inst->codec_state == VENUS_DEC_STATE_DRC) {
>  		struct vb2_v4l2_buffer *last;
>  		int ret;
