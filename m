Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C83958CC
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 09:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbfHTHsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 03:48:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43577 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTHsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 03:48:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id y8so11287013wrn.10
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H7DciBChVJm2OOS4yNWaNHUpMbDM4u25ZRTGyBd/5n4=;
        b=l+cQU7o0sFJKy+QvH/Cv+82e1X/ejSM86P6tjW+eEKJFXZHM2WpwT1zulo9TMFs+5z
         prHLTCISqTH/28St804CtH6VR/a/LDwFGhWxiguzmOEx33ArSjYAWnflsLJm07twHMLe
         Pgc174QZ4gNjVF2SKY8orfPWmQxF+Ds8P7VY6qvZ96bEtc+ZKxnkTLy+hsECM5Javx3K
         IjObQ9RdH+ZLIG4HxiNlkJ2XEkDUOFoxuZ0ZM0ZiwyAnExwGcK14kAzVKMsI4M2U5RUc
         fF/jcJ2bP7qO20nADzxHdGkx1qUWuXD8qO42h1oKEgEoe7Ih0nMlCl6QYwRlqnS4/eTA
         LbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H7DciBChVJm2OOS4yNWaNHUpMbDM4u25ZRTGyBd/5n4=;
        b=qt7g3a1UPyw8gdZo1fY8xu9kQHwAvB6cbLWgqFWqgZmRUfJtTdvOM0FMrdudaGKKSO
         l09+ZltH+Dh7EqQbKQ3qyywmPTTYPMsTgdUZG18Ujpt5FzsDse4b2O93Od/rlw04ZBgS
         nk2pbDP3jBf7PIZYNz/sOD9cLRndSoV8rWrOjy9bTTiXvucMKm3E93oXQ8rlA1EaBg4Y
         Ye2D2EbCEMrCR2S+t8Sx/Piu7ad7RQ8Ddy5baMhKrEUEK7gPrJwvDSLaK+6haXsvsrxu
         VVD8ZDbRi4qmQwKhOItxqxbpQ5qzISoD2tC5wkBWM2MMbIKAFvsSKzyAn5CANdGnxozR
         BSrA==
X-Gm-Message-State: APjAAAX/NDALLgrVDq2xnpTddemjADYcU5aPmhdWd3vwKRh1HkKJwQWX
        eJMqr9rONm+XsO78ZL+utbAJHQ==
X-Google-Smtp-Source: APXvYqxfeJ6uEnMZE+em1RqPa4VCm/6eGig9eaXelkWOYRunGbFsk/LoJxEVu3VGMmic7QxgLr1qww==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr34248617wrq.63.1566287295573;
        Tue, 20 Aug 2019 00:48:15 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v7sm1151750wrn.41.2019.08.20.00.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 00:48:15 -0700 (PDT)
Subject: Re: [PATCH v7 3/9] dw-hdmi-cec: use
 cec_notifier_cec_adap_(un)register
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-4-darekm@google.com>
 <2ffa9973-014e-af7c-13ab-d255adf5a8c2@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c5250388-0b49-ccf3-96d7-0b091de5a15b@baylibre.com>
Date:   Tue, 20 Aug 2019 09:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2ffa9973-014e-af7c-13ab-d255adf5a8c2@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/08/2019 16:35, Neil Armstrong wrote:
> On 14/08/2019 12:45, Dariusz Marcinkiewicz wrote:
>> Use the new cec_notifier_cec_adap_(un)register() functions to
>> (un)register the notifier for the CEC adapter.
>>
>> Also adds CEC_CAP_CONNECTOR_INFO capability to the adapter.
>>
>> Changes since v3:
>> 	- add CEC_CAP_CONNECTOR_INFO to cec_allocate_adapter,
>> 	- replace CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
>> 	CEC_CAP_RC | CEC_CAP_PASSTHROUGH with CEC_CAP_DEFAULTS.
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 ++++++-------
>>  1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>> index 0f949978d3fcd..ac1e001d08829 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>> @@ -256,8 +256,8 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>>  	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
>>  
>>  	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
>> -					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
>> -					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
>> +					 CEC_CAP_DEFAULTS |
>> +					 CEC_CAP_CONNECTOR_INFO,
>>  					 CEC_MAX_LOG_ADDRS);
>>  	if (IS_ERR(cec->adap))
>>  		return PTR_ERR(cec->adap);
>> @@ -278,13 +278,14 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	cec->notify = cec_notifier_get(pdev->dev.parent);
>> +	cec->notify = cec_notifier_cec_adap_register(pdev->dev.parent,
>> +						     NULL, cec->adap);
>>  	if (!cec->notify)
>>  		return -ENOMEM;
>>  
>>  	ret = cec_register_adapter(cec->adap, pdev->dev.parent);
>>  	if (ret < 0) {
>> -		cec_notifier_put(cec->notify);
>> +		cec_notifier_cec_adap_unregister(cec->notify);
>>  		return ret;
>>  	}
>>  
>> @@ -294,8 +295,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>>  	 */
>>  	devm_remove_action(&pdev->dev, dw_hdmi_cec_del, cec);
>>  
>> -	cec_register_cec_notifier(cec->adap, cec->notify);
>> -
>>  	return 0;
>>  }
>>  
>> @@ -303,8 +302,8 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
>>  {
>>  	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
>>  
>> +	cec_notifier_cec_adap_unregister(cec->notify);
>>  	cec_unregister_adapter(cec->adap);
>> -	cec_notifier_put(cec->notify);
>>  
>>  	return 0;
>>  }
>>
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 

Applying to drm-misc-next
