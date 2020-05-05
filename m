Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DD41C4CC4
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 05:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgEEDzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 23:55:47 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44737 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgEEDzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 23:55:47 -0400
Received: by mail-ot1-f68.google.com with SMTP id j4so524842otr.11;
        Mon, 04 May 2020 20:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fVpmlRqOB7eXke8uevfSsRs8l7hcoXGDZESzEE9L/Kk=;
        b=LTmzC+z2LtrtoCvIZe1d3Ny2xovOeB6f2rKZV6s3kHfC/8qn5qyqN0p8+bwJFxotHm
         Zw0cQLRtOx/jciMAuAv76A2SwpoR0f+ljTL7r5/5FDvvbzrApIOlmwSPydkLUer83DGe
         cqbKEtSQEMqluaOH2T4r41hYfPcdfwjGZaxIuNBlUp1S1A2Wnm8eoEbjfMGbe9nA92u4
         y+QXHeTAV5QAPPHHsp0MA6kO2da0R1rTufWOi0opKAD+1eLBKw16puxkFZN/E74+Q7dz
         vLyGbrAq0NxWOQSmelz7Yg56Yk0YNBxRVO7uf358RT0tXqRrMySmI4CHpcqvK6aV3yBU
         W98Q==
X-Gm-Message-State: AGi0PuYeact1L4SFN2P1fgTfEUx9WOcFtUntI213U8dbVUhaLA6dZhI3
        5tuWvi21Th2S6zfRyEkjFiQEXEw=
X-Google-Smtp-Source: APiQypJTqz87zIpF1xabhLlbR6oZBO16QbukiXQa0HRhnMbsIVziIpe/J85nsrXb8hc4FUxAuvipIg==
X-Received: by 2002:a9d:5e04:: with SMTP id d4mr988124oti.312.1588650945786;
        Mon, 04 May 2020 20:55:45 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b63sm318718otc.23.2020.05.04.20.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:55:44 -0700 (PDT)
Received: (nullmailer pid 7523 invoked by uid 1000);
        Tue, 05 May 2020 03:55:43 -0000
Date:   Mon, 4 May 2020 22:55:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: Document MSM8939 Venus
Message-ID: <20200505035543.GA5765@bogus>
References: <20200501203505.144362-1-konradybcio@gmail.com>
 <20200501203505.144362-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501203505.144362-3-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  1 May 2020 22:35:03 +0200, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../bindings/media/qcom,msm8939-venus.yaml    | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/media/qcom,msm8939-venus.example.dts:20:18: fatal error: dt-bindings/clock/qcom,gcc-msm8939.h: No such file or directory
         #include <dt-bindings/clock/qcom,gcc-msm8939.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/media/qcom,msm8939-venus.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/media/qcom,msm8939-venus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1281452

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
