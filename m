Return-Path: <linux-media+bounces-14844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C651492D117
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46FA51F23B3B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0436191495;
	Wed, 10 Jul 2024 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0/0BPQr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3466019049D
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720612503; cv=none; b=N5ONQbNq6J5a5huqntU7JODPmEyxPwB1sHwDkGYUOVHJE/lawV4JUJa08nVw/KErl2BbzGrtDwAH4NMZuaf4uV+rkP/GH7iiNWU0T6P81kfcq7Q+US+n1k1kWtTNuVV7scJKkIdNfWdOjv5b/tRDfodX13m0qY7xuIeNjfRK4GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720612503; c=relaxed/simple;
	bh=paVadfwH0SPC30fmPZ75RsUsAuV+09foiM4V9nvyopI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWXx6ch1zjjOZfihEP2+WD1kX0o46iLuQS/OViqy/OxD2IYMFXd94vlipTcueD1ZUj23cOrT09Y0/Pd62PQ8/tG1dMIQaRL2pvF6bhDHSF6tPQ8qHilSaoLNQYIIAB69QYq5lLF+t9OhOrWQ6D1ZAeT/CY4OsxZ5/QtAECln00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0/0BPQr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36796a9b636so4230551f8f.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720612499; x=1721217299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C10SPalmjZh+3GoQrwVikq0NAz3oJKzoCAEN1f0fq1E=;
        b=S0/0BPQrVdGO0QeFrgrL/lQ8mQrz7aRzbxLkMCrZuk7T779Qwj5QAIDwJlK52dPD9B
         jHyxkMZHpElDRmQlimXxWu8ZmxNkLrGu8dQ1EayODg2d3Ag6W+pjeOU2n8fxeFaM2/UW
         L8gUR78W8atKAF+koXmGZywsKbfCmhNYhQkbM02TZr8xTDcXO5Apxvao5ps63XawOVld
         ndhbHKPZkcbBvjWj/TU1glvUgwjXAb3ZBLmRrXzotjVqpP2T3EvID8qFVVCFH0UcmC+5
         JzwZuruTLvJYqj7zwpFQC9hfNaAfsgWTUBjcIg8nHDunwDebUJANuK7o/OhddZoBJ5BP
         ReRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720612499; x=1721217299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C10SPalmjZh+3GoQrwVikq0NAz3oJKzoCAEN1f0fq1E=;
        b=vp59PjZHe8LCvbT5KMKFKLQF5Ksxl9gIzu0KqsDbI9+62h9ltH6wgfz7yBZygn4uSm
         X7tBVDeqoMwrNs3fps1BUsQIKFxPFG2pmYpoSgMThMuWQ6QMMyolECGMlCpXt50nEpLI
         IDkQ+tx2VpxQG31ATGJlzgA2m9F2SiDV6kxTHQx7xqRrP440WYczj0Yvb4SvRw8Ma75Q
         y0fR1a9CirRagPISRATCk0J0drxuhRCCfk7AJ1FiC6Dnn9UiZZHWC9DmKvx6kgVkshlh
         s9vnrudeNdL88WrmfDRlJJLvKBFLpd375aPfMXvpUBByo+g65LbI9aLWuihOh+ehna8H
         VU0A==
X-Forwarded-Encrypted: i=1; AJvYcCWnWPC7hrs5ynywWQxkTAxApSvtKbbj6tMHrNE0PJVy97DVILAThCHI8AAFMDSYK3NnCvqRoWlFOw5RmUofoSiW+t/wD7MlXWZ9NQs=
X-Gm-Message-State: AOJu0Yyu5mgbiHSEYV+stDsy5nNWzSdAW2Cijj1Vudxrgi33qt/BnZzj
	jAASdoJNPzS3PHVzVYYrhegtNyrMiDhm8ZlbU5qBAlEUrPvvSFW7s6REPcHl+lY=
X-Google-Smtp-Source: AGHT+IFL5IETaUe0YovIdcK9CF583iP6dCztB0+V+HV9LmwPvUePVsgxb3uJajDS20oaqgpsEuIA0g==
X-Received: by 2002:adf:a31c:0:b0:367:8383:62f3 with SMTP id ffacd0b85a97d-367cea73e8emr3947995f8f.28.1720612499504;
        Wed, 10 Jul 2024 04:54:59 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7dedfsm5192357f8f.24.2024.07.10.04.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 04:54:59 -0700 (PDT)
Message-ID: <236cfe43-8321-4168-8630-fb9528f581bd@linaro.org>
Date: Wed, 10 Jul 2024 12:54:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] media: qcom: camss: Add notify interface in camss
 driver
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240709160656.31146-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2024 17:06, Depeng Shao wrote:
> The main v4l2 process logic in camss vfe subdev driver, so the vfe driver
> handles the buf done irq and register update configuration. But the buf
> done irq and register update configuration have been moved CSID HW in
> Titan 780 and other new platform, so vfe driver needs to call into CSID
> driver to configure the register update. And CSID driver also needs to
> call into vfe driver to notify of the buf done irq.
> 
> Adding this notify interface in camss structure to do the subdevs cross
> communication to decouple CSID and VFE, the subdevs can add an interface
> to process the message what is routed from other subdevices, then we can
> process the cross communication easily.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-csid-gen3.c     | 38 +++++++++++++++
>   .../media/platform/qcom/camss/camss-csid.h    |  8 ++++
>   .../media/platform/qcom/camss/camss-vfe-780.c | 29 +++++++++++-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  1 +
>   drivers/media/platform/qcom/camss/camss.c     | 47 +++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |  9 ++++
>   6 files changed, 130 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 17fd7c5499de..585054948255 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -312,6 +312,18 @@ static u32 csid_hw_version(struct csid_device *csid)
>   	return hw_version;
>   }
>   
> +static void csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->reg_update |= REG_UPDATE_RDI(csid, port_id);
> +	writel_relaxed(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
> +}
> +
> +static inline void csid_reg_update_clear(struct csid_device *csid,
> +					int port_id)
> +{
> +	csid->reg_update &= ~REG_UPDATE_RDI(csid, port_id);
> +}
> +
>   /*
>    * csid_isr - CSID module interrupt service routine
>    * @irq: Interrupt line
> @@ -341,6 +353,14 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   		if (csid->phy.en_vc & BIT(i)) {
>   			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>   			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
> +				/* For Titan 780, Buf Done IRQ&REG has been moved to CSID from VFE.
> +				 * Once CSID received Buf Done, need notify this event to VFE.
> +				 * Trigger VFE to handle Buf Done process.
> +				 */
> +				csid->camss->notify(&csid->subdev, CAMSS_MSG_BUF_DONE, (void *)&i);

Instead of a generic notify function with an enum passed to a switch 
lets just have a dedicated function for each functional callback.

csid->camss->reg_update_cmd();
csid->camss->reg_clear_cmd();

We can get rid of a switch and an additional enum that way, plus 
redundant "event not supported" error checking.

> +			}
>   		}
>   
>   	val = 1 << IRQ_CMD_CLEAR;
> @@ -434,6 +454,23 @@ static void csid_subdev_init(struct csid_device *csid)
>   	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
>   }
>   
> +static void csid_subdev_process_msg(struct csid_device *csid, unsigned int msg_type, void *arg)
> +{
> +	int msg_data = *(int *)arg;
> +
> +	switch (msg_type) {
> +	case CAMSS_MSG_RUP:
> +		csid_reg_update(csid, msg_data);
> +		break;
> +	case CAMSS_MSG_RUP_CLEAR:
> +		csid_reg_update_clear(csid, msg_data);
> +		break;
> +	default:
> +		dev_err(csid->camss->dev, "NOT Supported EVT Type\n");
> +		break;
> +	}
> +}
> +
>   const struct csid_hw_ops csid_ops_gen3 = {
>   	.configure_stream = csid_configure_stream,
>   	.configure_testgen_pattern = csid_configure_testgen_pattern,
> @@ -442,4 +479,5 @@ const struct csid_hw_ops csid_ops_gen3 = {
>   	.reset = csid_reset,
>   	.src_pad_code = csid_src_pad_code,
>   	.subdev_init = csid_subdev_init,
> +	.process_msg = csid_subdev_process_msg,
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index ae5b6b0dc0ea..714a8db855fd 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -152,6 +152,14 @@ struct csid_hw_ops {
>   	 * @csid: CSID device
>   	 */
>   	void (*subdev_init)(struct csid_device *csid);
> +
> +	/*
> +	 * process_msg - receive message from other sub device
> +	 * @csid: CSID device
> +	 * @evt_type: event type
> +	 * @arg: arguments
> +	 */
> +	void (*process_msg)(struct csid_device *csid, unsigned int evt_type, void *arg);
>   };
>   
>   struct csid_subdev_resources {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> index abef2d5b9c2e..3279fe53b987 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -131,13 +131,23 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u64 addr,
>   
>   static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>   {
> -	/* TODO: Add register update support */
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP.
> +	 */
> +	vfe->camss->notify(&vfe->line[line_id].subdev, CAMSS_MSG_RUP, (void *)&port_id);
>   }
>   
>   static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>   					enum vfe_line_id line_id)
>   {
> -	/* TODO: Add register update clear support */
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP clear.
> +	 */
> +	vfe->camss->notify(&vfe->line[line_id].subdev, CAMSS_MSG_RUP_CLEAR, (void *)&port_id);
>   }
>   
>   /*
> @@ -390,6 +400,20 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>   	vfe->video_ops = vfe_video_ops_780;
>   }
>   
> +static void vfe_subdev_process_msg(struct vfe_device *vfe, unsigned int msg_type, void *arg)
> +{
> +	int port_id = *(int *)arg;
> +
> +	switch (msg_type) {
> +	case CAMSS_MSG_BUF_DONE:
> +		vfe_buf_done(vfe, port_id);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
>   const struct vfe_hw_ops vfe_ops_780 = {
>   	.global_reset = NULL,
>   	.hw_version = vfe_hw_version,
> @@ -401,4 +425,5 @@ const struct vfe_hw_ops vfe_ops_780 = {
>   	.vfe_enable = vfe_enable,
>   	.vfe_halt = vfe_halt,
>   	.vfe_wm_stop = vfe_wm_stop,
> +	.process_msg = vfe_subdev_process_msg,
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 10e2cc3c0b83..a8b09ce9941b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -115,6 +115,7 @@ struct vfe_hw_ops {
>   	int (*vfe_halt)(struct vfe_device *vfe);
>   	void (*violation_read)(struct vfe_device *vfe);
>   	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
> +	void (*process_msg)(struct vfe_device *vfe, unsigned int msg_type, void *arg);
>   };
>   
>   struct vfe_isr_ops {
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1f1f44f6fbb2..abeb0918e47d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2202,6 +2202,52 @@ static void camss_genpd_cleanup(struct camss *camss)
>   	dev_pm_domain_detach(camss->genpd, true);
>   }
>   
> +static void camss_notify_msg(struct v4l2_subdev *sd,
> +			unsigned int msg_type, void *arg)
> +{
> +	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
> +	struct camss *camss = to_camss(v4l2_dev);
> +	struct vfe_device *vfe;
> +	struct vfe_line *vfe_line;
> +	struct csid_device *csid;
> +	int evt_data = *(int *)arg;
> +
> +	switch (msg_type) {
> +	case CAMSS_MSG_BUF_DONE:
> +		csid = v4l2_get_subdevdata(sd);
> +		vfe = &(camss->vfe[csid->id]);
> +		if (vfe->res->hw_ops->process_msg)
> +			vfe->res->hw_ops->process_msg(vfe,
> +				CAMSS_MSG_BUF_DONE, (void *)&evt_data);
> +		break;
> +
> +	case CAMSS_MSG_RUP:
> +		vfe_line = v4l2_get_subdevdata(sd);
> +		vfe = to_vfe(vfe_line);
> +		csid = &(camss->csid[vfe->id]);
> +
> +		if (csid->res->hw_ops->process_msg)
> +			csid->res->hw_ops->process_msg(csid,
> +				CAMSS_MSG_RUP, (void *)&evt_data);
> +		break;
> +
> +	case CAMSS_MSG_RUP_CLEAR:
> +		vfe_line = v4l2_get_subdevdata(sd);
> +		vfe = to_vfe(vfe_line);
> +		csid = &(camss->csid[vfe->id]);
> +
> +		if (csid->res->hw_ops->process_msg)
> +			csid->res->hw_ops->process_msg(csid,
> +				CAMSS_MSG_RUP_CLEAR, (void *)&evt_data);
> +
> +		break;
> +
> +	default:
> +		dev_err(camss->dev, "Not supported evt type\n");
> +		break;
> +	}
> +}

Instead of having a central swiss army knife notify() callback these 
should be CSID or VFE specific callbacks vfe->buf_done() csid->msg_rup() 
etc.

---
bod

