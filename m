Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20066E8625
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 02:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjDTAEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 20:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDTAEh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 20:04:37 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF2D46BD
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 17:04:35 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h4so927497ljb.2
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681949074; x=1684541074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2G0wIqdDVL8V39zkJtaHo7rk4P3NZp9I0rLrpXM9zn0=;
        b=ya9kSiyBckKHw/r5XP0RpjppGN8C/dq36rqTYAJvC6A2i2Kt1Li1CimdnM/QtObhTV
         DYguK5harSijONZXVc8I2r/8lMWFDfdf0lKNA84XLvrOobSJcF+2TKQoyxJ86qx3rCVV
         bYh60YAv9An1fz6a3JLbsKTDytP7Ra5S7IzncImyW+RDdwXSafn7sfhxMgRD+Erlttl1
         tanmzY3LciKOi588uvpU+fuicolrdsBhsiwwWUcsD+79nHbQYWopyfYoVwKvyFe4pMol
         5/z9ZnHWZzmMqjtvGZoolAPK6i9phaF1eho33xYgtQnrocBTBecbhjk8V+4FxlxZKngY
         bBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681949074; x=1684541074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2G0wIqdDVL8V39zkJtaHo7rk4P3NZp9I0rLrpXM9zn0=;
        b=jSLJZMRQ9m0mmxmxc08u5zEwhTiQkXYvq3V7C4zMwVHPL8JWPvxGpAbQnYwA7e2XKl
         Ot82z9Dpg62XKaKoi2hgpTdzs4/4+G8Zn2EX50OeJWzdexoZ9L0roCh3u6OssRjEnE+U
         H5YTjXvNVt87ubCyhHjSqHtYUaTLuqdRRGsKsVfrjGDZ68bFTB2gpbzYZGIyEd9xXoPw
         ACSsE8oXRRtI0vZc/T9zu115j3DtnjNWzdZgaAJB9F8i+xDWdDdVU4QqJCughbM9/omZ
         Vi2fSptDuKMAhSkoAePide0LclCWYpyRi48zt9borl0aOShs4+9wNpNB9rPe8vRN7KFi
         b6PA==
X-Gm-Message-State: AAQBX9f8RLa/fjdXuI2PjzhHeyzbUUio+3JK85HIdnNkzzYd6M5mmuB4
        t5uvGH/jhIVWlxfG7vt3wvdjgQ==
X-Google-Smtp-Source: AKy350ZDEvgIQKSNHuZRDRgq4zUgypLURFd+FcdttpfqeiOpNO/OlnbRi8mFkVC84Iv0ldK9RshuOQ==
X-Received: by 2002:a2e:9a82:0:b0:2a7:75ae:3e63 with SMTP id p2-20020a2e9a82000000b002a775ae3e63mr2324997lji.27.1681949073956;
        Wed, 19 Apr 2023 17:04:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n9-20020ac242c9000000b004eb42f5367bsm52229lfl.19.2023.04.19.17.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:04:33 -0700 (PDT)
Message-ID: <372bb455-2e45-a230-e393-542d4fe5a5e5@linaro.org>
Date:   Thu, 20 Apr 2023 03:04:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/4] drm/msm: expose edid to hdmi cec adapter
Content-Language: en-GB
To:     Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-3-176479fb2fce@freebox.fr>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-3-176479fb2fce@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2023 21:10, Arnaud Vrac wrote:
> When edid has been read after hpd, pass it to the cec adapter so that it
> can extract the physical address of the device on the cec bus.
> Invalidate the physical address when hpd is low.

If there is another bridge in a chain (e.g. display-connector) which 
handles HPD, then the msm_hdmi_bridge_detect() might get skipped. Please 
also add the hpd_notify() callback which invalidate the physical 
address. See adv7511, which does that both in its own HPD path and in 
the hpd_notify().

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 17 +++++++++++++----
>   2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 9b1391d27ed39..efc3bd4908e83 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -7,6 +7,7 @@
>   #include <linux/delay.h>
>   #include <drm/drm_bridge_connector.h>
>   #include <drm/drm_edid.h>
> +#include <media/cec.h>
>   
>   #include "msm_kms.h"
>   #include "hdmi.h"
> @@ -256,6 +257,7 @@ static struct edid *msm_hdmi_bridge_get_edid(struct drm_bridge *bridge,
>   	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl | HDMI_CTRL_ENABLE);
>   
>   	edid = drm_get_edid(connector, hdmi->i2c);
> +	cec_s_phys_addr_from_edid(hdmi->cec_adap, edid);
>   
>   	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index bfa827b479897..cb3eb2625ff63 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -7,6 +7,7 @@
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/pinctrl/consumer.h>
> +#include <media/cec.h>
>   
>   #include "msm_kms.h"
>   #include "hdmi.h"
> @@ -230,15 +231,17 @@ enum drm_connector_status msm_hdmi_bridge_detect(
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	enum drm_connector_status stat_gpio, stat_reg;
> +	enum drm_connector_status status, stat_gpio, stat_reg;
>   	int retry = 20;
>   
>   	/*
>   	 * some platforms may not have hpd gpio. Rely only on the status
>   	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
>   	 */
> -	if (!hdmi->hpd_gpiod)
> -		return detect_reg(hdmi);
> +	if (!hdmi->hpd_gpiod) {
> +		status = detect_reg(hdmi);
> +		goto out;
> +	}
>   
>   	do {
>   		stat_gpio = detect_gpio(hdmi);
> @@ -259,5 +262,11 @@ enum drm_connector_status msm_hdmi_bridge_detect(
>   		DBG("hpd gpio tells us: %d", stat_gpio);
>   	}
>   
> -	return stat_gpio;
> +	status = stat_gpio;
> +
> +out:
> +	if (!status)
> +		cec_phys_addr_invalidate(hdmi->cec_adap);
> +
> +	return status;
>   }
> 

-- 
With best wishes
Dmitry

