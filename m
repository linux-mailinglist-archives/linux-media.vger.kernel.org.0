Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8B7600E8C
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 14:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiJQMFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 08:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJQMF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 08:05:28 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C9F21810
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 05:05:26 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id t4so8485076wmj.5
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuSFTNhPMVwE74UmWmK9ijUroBU9ojrTixwKZN0PI1I=;
        b=GRun/cu65Orrfx2NszYaCRA8JDqJuUq9fzHPH379ji9cWhsdsUFiLQHMkzMtkqilKa
         aogxwT98qzxkqblqNNiurkJHuxFHejJlGb+ei1MT+fpVg1jgq2dO2A7KjEYd1ttx/ndz
         j6PwkXti127+kITEPQvKTHy2sSHhCMgUUcVw8bkQQeUKvbtA0ODmGnwasVcIkCQtLoKW
         AX3mP/XUF/Oc7H3kxkfagbgVcEwAW54hT/2NgRMTM7f5L1T7pcGqxepWvg/XqqgqnK03
         Jweeep1W3gC0xYmEqTCPn3iP8+E9alPJDRo4Q6VmylYy1NDzhvtZpesp9scJg/Qrz/H4
         5t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuSFTNhPMVwE74UmWmK9ijUroBU9ojrTixwKZN0PI1I=;
        b=wofQNwJlvK3M9XTWWSVvCgp8xQg1wQ5sx2v4+UlTF4nR/QvSbRLnCzs5vX2PkLWTba
         z/NdfJURwN/fQADwYNiEQ+oVJeI6xxAu2QKWlRDAMphxQFqhuTK2GOkhIKAZrOQ3gu3Q
         uSs3SG1LVfcb3DsPl4TPIa7igJd4Jz0yyMuBRTEbwPb6rNcaOImgyC/McDfYs912IdMM
         hTXoAzwitmGYj6lxEwKgqLmrgqLRWbKEifjxsmz/AGqQf4X4aJ7egE7HPuhBPE8XqewH
         GbDH9sicF3ZTAyqoRoXRT3s1aLfq0Fsn/ZhSJGoXU+pvRdmaLyegMD8nQu/jdKdFBeIl
         skGA==
X-Gm-Message-State: ACrzQf0q/U9D733n2QqhtAnrDejqPKv6qF61xxaJKuP024lWgdk8IImL
        VOOH37VcMi5Ehtpx0q7AXH9emA==
X-Google-Smtp-Source: AMsMyM7H4yum6AD7MAR4XHAlumqtgjajfxooKMICybo67fRWPQ5sgLt2qfsBmLqpmxTMxJRxoWZgUQ==
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id bg10-20020a05600c3c8a00b003b4eff4a94fmr18661240wmb.105.1666008325122;
        Mon, 17 Oct 2022 05:05:25 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b003b47e75b401sm14699463wms.37.2022.10.17.05.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 05:05:24 -0700 (PDT)
Message-ID: <10e04ff4-44a3-3c39-a04b-4910e18f6d85@linaro.org>
Date:   Mon, 17 Oct 2022 13:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org>
 <f7cbad3c-76ab-093e-72c4-8d7629cd6b5b@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f7cbad3c-76ab-093e-72c4-8d7629cd6b5b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/10/2022 12:47, Milen Mitkov (Consultant) wrote:
> 
> Hey Bryan,
> 
> I don't see the second print (..."virtual channels mask 0x0") on my side 
> when testing with the standard imx577 driver. I also have imx577 on slot 
> 2 and ov9282 on slot 1. I am testing with:
> 
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx577 
> '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> 
> What is your testing procedure?
> 
> 
> Regards,

So for that I just do

https://libcamera.org/getting-started.html

apt install -y g++ meson libyaml-dev python3-yaml python3-ply 
python3-jinja2 libssl-dev libdw-dev libunwind-dev libudev-dev 
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libevent-dev

git clone https://git.libcamera.org/libcamera/libcamera.git
cd libcamera
meson build
ninja -C build

cd build/src/cam

./cam -l

Available cameras:
1: 'ov9282' (/base/soc@0/cci@ac4f000/i2c-bus@1/camera@60)
2: 'imx577' (/base/soc@0/cci@ac50000/i2c-bus@0/camera@1a)

./cam -c 2 --capture=10 --file

Do you have the ov9282 probed ?

To ssh://git.linaro.org/people/bryan.odonoghue/kernel.git
  * [new branch]                HEAD -> next-20221013-sm8250-camss-vc

---
bod
