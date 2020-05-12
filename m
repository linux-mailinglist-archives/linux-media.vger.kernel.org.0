Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA711CF63A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 15:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgELNzW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 09:55:22 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34650 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgELNzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 09:55:21 -0400
Received: by mail-ot1-f66.google.com with SMTP id 72so10560406otu.1;
        Tue, 12 May 2020 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=khg2FYARhLY8jqsBiK9GfQxfbP399NswSSMlCJ79cLM=;
        b=fdt4dCi+9JHwU6QYCXD707nyx9WyWLk8TVC506x3oH2VaZ1Wv/t1qFCUaB6jjmFV33
         VEey+YQhbckwbLfOYnK6lzkYOO57/7AxxxIUchgwRxg9dPH/T5bAZF3QukXm0jFMI9hx
         r/NPFY/aDvFNYFlnYI6QoRWd/KgbIhLIPRLJWdf0wZRN11URfCwyDTUOf7PH9OCLbKUM
         tWpUcKCpT9tqvetzd0qk2ZR2eFzbnzrLSs3+t+faCUSFCkNK5K9p4ORY+GlIoYnRRL6Y
         LyEuIKV9xGUut8jisWn8krAKj9w6QzVPcvte3HpzdPVuKjUlq75u4F2vBZJ0WO+faUkH
         akyQ==
X-Gm-Message-State: AGi0PuZzzyGY1VL5QXockgblvC0WcLdLOgjlqVkKtCQs7lsfWY277ezK
        7ljkkLLAagjBbEQqlCSgNQ==
X-Google-Smtp-Source: APiQypKVsMAlzHWT4/uwIBYqnJvQSdDTmKbo3XbCiLwbvxcmGGslzIJ4I5g3PCFGhGT1be+4rgh52g==
X-Received: by 2002:a9d:7e99:: with SMTP id m25mr3878487otp.45.1589291720627;
        Tue, 12 May 2020 06:55:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i127sm2764595oih.38.2020.05.12.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:55:19 -0700 (PDT)
Received: (nullmailer pid 26214 invoked by uid 1000);
        Tue, 12 May 2020 13:55:19 -0000
Date:   Tue, 12 May 2020 08:55:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     mka@chromium.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: venus: Add an optional power domain
 for perf voting
Message-ID: <20200512135519.GA24061@bogus>
References: <1589281966-13436-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589281966-13436-1-git-send-email-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 May 2020 16:42:46 +0530, Rajendra Nayak wrote:
> Add an optional power domain which when specified can be used for
> setting the performance state of Venus.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 4 +++-
>  Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.example.dt.yaml: video-codec@aa00000: power-domain-names: ['venus', 'vcodec0', 'vcodec1'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/qcom,sc7180-venus.example.dt.yaml: video-codec@aa00000: power-domain-names: ['venus', 'vcodec0'] is too short

See https://patchwork.ozlabs.org/patch/1288381

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

