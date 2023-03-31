Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12426D1967
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 10:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjCaIHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 04:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjCaIHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 04:07:48 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1902A1B7F9
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 01:07:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i9so21525466wrp.3
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680250056; x=1682842056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImAx/oxEO+lHncb/ZesUrhnsKkwvaeFgdPZ5ntmrUCc=;
        b=hYo4gicJ5iiWIczEayogdArsTd/kZGrWvZCCUMX3xMI5zAQdHFRuAbIoBVeIBqDAgH
         FJxD0MqerkjCX9WWpHSiZ7e/xTPyB/vJVvg0ljtZjKl8fAu7Hb445g4runNQ54Khlytt
         FDXG6UAQlWs7j5IrYRxDSFLw4uwK5o+YAGCbUDquW2wcBVBmYlvZJfzZ0E6ermR/dzli
         RjcJEtPK9Ogov/77E+LAGgTGsApkCcjRbpokrNABdqBq6C3mQuJ1PInhiLRSACuThEuJ
         c6G/X/E6qD+1meI/eILbI8AcGgjdztgDveeEwV9RyPaYMV7sX5aWqHzUX+EXQ81PNy22
         uOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680250056; x=1682842056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImAx/oxEO+lHncb/ZesUrhnsKkwvaeFgdPZ5ntmrUCc=;
        b=PkVlZtb/K3PdKUbaPdOaIj1eNDRoUn+BHJPXF4/PJQAbb2uizBltESOFQeWl+/7HgJ
         /J66Fn0ktZ4c0p3MhgxzdohTwEBOBhJtxJ2/mMn9xwhuLfwhV6QR0LNYNp1SwbXFjsj3
         PvYLKCipPeQtALu0hF4/rFxUknIdN4aCaP9w9whClvox3EoBbafNJUt13V8OYqjO++PU
         ob2ZA7eIWuI+187pFxE50zp+DzlMRo5dDWpUCeJKNufRCuq8v3/fS8sWnHWfEucMqyKO
         gPBRsZW1yfkj/cDX4ywfPGmfZtKBDfQZ5fgY3kk9Z8OmJ9YGc7gJ523VSRDOTgVcEnFe
         hhKA==
X-Gm-Message-State: AAQBX9fem8wWdsABw+tIYjMOnpLxN6Xg5ZvW38+ADlgktpO3uYiNhGRa
        3xeCLGckXBj0k0ym/qqxPy/gfw==
X-Google-Smtp-Source: AKy350bxs9ZUM/3ex/YLlrgnbmR/q9tIRVwQaAUTFOf3rSiGvAR3/p8XfIs+BByVofxargQ0oFGabg==
X-Received: by 2002:a5d:45c1:0:b0:2d0:bba8:38f3 with SMTP id b1-20020a5d45c1000000b002d0bba838f3mr22407216wrs.14.1680250056391;
        Fri, 31 Mar 2023 01:07:36 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s12-20020adfeccc000000b002da1261aa44sm1514267wro.48.2023.03.31.01.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:07:35 -0700 (PDT)
Message-ID: <f26174aa-a6ca-151c-2602-2f39b40bb7da@linaro.org>
Date:   Fri, 31 Mar 2023 09:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        "Milen Mitkov (Consultant) (QUIC)" <quic_mmitkov@quicinc.com>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Chandan Gera <cgera@qti.qualcomm.com>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
 <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
 <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/03/2023 07:20, Azam Sadiq Pasha Kapatrala Syed wrote:
> + Nico (Linaro)
> Hi Team
> 
> Would like to know if anything is pending form our end as we want to get the patches mainlined?
> 
> Thanks,
> Azam

I'd like to get a clearer picture on this

[   90.535909] qcom-camss ac6a000.camss: VFE HW Version = 2.0.1
[   90.545756] qcom-camss ac6a000.camss: CSIPHY 3PH HW Version = 0x40010000
[   90.546358] qcom-camss ac6a000.camss: CSID HW Version = 2.0.1
[   90.546365] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
virtual channels mask 0x1
[   90.547675] qcom-camss ac6a000.camss: csid_link_setup: Enabled CSID 
virtual channels mask 0x0

Using the IMX577 sensor on the RB5 we get his pretty odd virtual 
channels mask.

If userspace is sending this in, the question I have is why. Surely with 
a sensor that doesn't have a VC there should be no impact on user-space.

---
bod
