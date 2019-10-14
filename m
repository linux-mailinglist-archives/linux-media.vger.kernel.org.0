Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81EA8D6833
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 19:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388418AbfJNRR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 13:17:28 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37166 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731347AbfJNRR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 13:17:28 -0400
Received: by mail-oi1-f193.google.com with SMTP id i16so14394684oie.4;
        Mon, 14 Oct 2019 10:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+b0QR5MF7DVCOWcWE3GZU/teF1mt8LRV+r1yfAkDfws=;
        b=HUK3kKJxok2to1pDq39t0oxn7B1t/mhK+rXfbsM2Ui5js3TvymxQZV/w+oC+WzDbz7
         XoopYRrQgI2/Jnfw/5YEFVWIuQFCfosdfq/A+C76xyGBq3JlLCkf7VBgyK7Z9cp4yb8u
         C4pvWZitIqQxtVv/ORFXfn+Ju5WeHR50JvwN9Xdf/VGZdJVpjhHF1qHjj9BqrE+D4cyD
         4QafoHAyJINObYpjrc4SnO/aLzeYCetHRxHVGdGFuyddQDb8xbnVd8/MxWsqXfORHQHC
         ph4Xbm559awvSMvfZkBVrP8vVuo+HlgYOyJPST/ROHUMoPVpBsz0V7MPjVmIjNqr62Ua
         AIVg==
X-Gm-Message-State: APjAAAWxlDT03ufY89mhSy+S9hKsHV5PPPmsGlx0EVV/3HoISWB2bVL8
        uyXRSXisLUlPH7epoS0Qtw==
X-Google-Smtp-Source: APXvYqwYipBsJ3yRLmNQwqolPY8YtV2dTSLL7DuXyoSS8Rs5Z+4QzavFZ+eAv1k7qSeBpao+RCMibA==
X-Received: by 2002:aca:d44e:: with SMTP id l75mr25527685oig.44.1571073447359;
        Mon, 14 Oct 2019 10:17:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n127sm5749817oia.0.2019.10.14.10.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 10:17:26 -0700 (PDT)
Date:   Mon, 14 Oct 2019 12:17:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        alexandre.torgue@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, hugues.fruchet@st.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: media: Convert stm32 cec bindings to
 json-schema
Message-ID: <20191014171726.GA5625@bogus>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014092021.24020-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 14 Oct 2019 11:20:20 +0200, Benjamin Gaignard wrote:
> Convert the STM32 cec binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - add additionalProperties: false
> - remove pinctrl-names and pinctrl-[0-9]
> 
>  .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
>  .../devicetree/bindings/media/st,stm32-cec.yaml    | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> 

Applied, thanks.

Rob
