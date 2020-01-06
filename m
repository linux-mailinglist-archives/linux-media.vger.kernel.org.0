Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9811E131AFA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 23:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgAFWEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 17:04:20 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37262 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgAFWEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 17:04:20 -0500
Received: by mail-ot1-f68.google.com with SMTP id k14so73570274otn.4
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 14:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fFftcAxBxD84neD4s5xVO4mH7xPSROdINRJxfvD8MYA=;
        b=LmbSfT7J0LYqgJPc+lWkrsWR44FzGUHLhbihKkKy4GZK86KxwUvI49Ec62KgCeTnsL
         64MixkVfPRssFKlp5bn3e83sm9dih8pLsNe/Rxzc97fz7sq3Vuap8h4SaT+DQqvbxpP5
         YmZSo+fvnQHyLra3GOnmzsVyFld18jBTEbhEqy+hJudjDPzThN6BydPFzUakW1DBOQLu
         sQKIULTOZn8/OTdb+kbl3oB6w3vycb75uMO62jfcQVjyu6Fc/5EFIgMRec2PG4Q8jcjp
         j/5xG3muRruthV08VKR23Jv1RGSF9f6N0am6TJgYbM0y8KSpYNpP8glEP8ty4mMT/Ntt
         BXMg==
X-Gm-Message-State: APjAAAV0vKzN83E4W2SUaUVHz7UQqVn9i66FBnZKs3S1odzE1vg3fjwH
        ZxhOaN3zV/QBOsMxDFxXLos8wKk=
X-Google-Smtp-Source: APXvYqwHRXdRj1pmAq6XrCTjfKx9VfHB4zMHyOgAXIYwJAtov8i0mCVR10DvUEmeieA2TcBvigHzVg==
X-Received: by 2002:a05:6830:1555:: with SMTP id l21mr109767049otp.41.1578348259160;
        Mon, 06 Jan 2020 14:04:19 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id 47sm24873168otf.54.2020.01.06.14.04.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:04:18 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220d32
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:04:14 -0600
Date:   Mon, 6 Jan 2020 16:04:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 06/12] dt-bindings: media: venus: Convert msm8916 to
 DT schema
Message-ID: <20200106220414.GA10744@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-7-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-7-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  6 Jan 2020 17:49:23 +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8916-venus Venus binding to DT schema
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
