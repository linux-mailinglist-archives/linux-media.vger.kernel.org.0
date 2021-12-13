Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745954735DC
	for <lists+linux-media@lfdr.de>; Mon, 13 Dec 2021 21:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239897AbhLMU0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 15:26:01 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43639 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234464AbhLMU0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 15:26:00 -0500
Received: by mail-oi1-f180.google.com with SMTP id o4so24716729oia.10;
        Mon, 13 Dec 2021 12:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W2nr5lzeTuc4wVsr2H7zTWsAZoBJt4rbybjCxgiGF3o=;
        b=Zk1wI3A9P+gvTRiStYTTCsvWzL+1+gT2hzYFWUujVJaim+gBGkTAiJdJOqySXmK9mD
         +TzItdPZUcaLBvG46OFgxI//XJ34/iJLBSKASLf9SPDNLkDIqHOxti0VEdaJnP6rNpfn
         3aV/E1o2bC4k2PCq7QUYpHgqGKuLDf4Rm+p/B4ItA4W1a+iMqVgSutEQJY/5+ZKdN66/
         aI9vMmALze/dvB+z0YAOBJeHVKxokAxu8L60JajbBB4ME7bUw6Dq1m55p7m1FwlLYLKy
         nhaOU+PlZpsVD7LjwPvbsQIdyae0wFFoGnaVu7VmoAzlaHybJBuQ7EMMaOFJE9+3lhDw
         TVkw==
X-Gm-Message-State: AOAM533Psxw6yG5BvSgNTzqqmDstf/eensL0h7+V4P67vA6VEpnliymI
        yKtynx8foupzNDgzPhxLIg==
X-Google-Smtp-Source: ABdhPJzV3OAQgZPJLeYTPL4sGb9aQ9kYn2FUqrWfgSHlsezxQ/4uq2Xl5gUxl58V5kLhQFdPJyFlHA==
X-Received: by 2002:aca:1708:: with SMTP id j8mr795198oii.62.1639427159461;
        Mon, 13 Dec 2021 12:25:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n22sm2351916oop.29.2021.12.13.12.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:25:58 -0800 (PST)
Received: (nullmailer pid 1512288 invoked by uid 1000);
        Mon, 13 Dec 2021 20:25:57 -0000
Date:   Mon, 13 Dec 2021 14:25:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, devicetree@vger.kernel.org,
        todor.too@gmail.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        agross@kernel.org, mchehab@kernel.org, jgrahsl@snap.com,
        andrey.konovalov@linaro.org, jonathan@marek.ca, hfink@snap.com
Subject: Re: [RESEND PATCH v2 01/19] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
Message-ID: <YbesVRKPOGUGZW/I@robh.at.kernel.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
 <20211202153729.3362372-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202153729.3362372-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 02 Dec 2021 15:37:11 +0000, Bryan O'Donoghue wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add bindings for qcom,sm8250-camss in order to support the camera
> subsystem for SM8250.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++++++
>  1 file changed, 450 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
