Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC252D6838
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 19:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388277AbfJNRS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 13:18:27 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42686 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbfJNRS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 13:18:27 -0400
Received: by mail-oi1-f196.google.com with SMTP id i185so14346424oif.9;
        Mon, 14 Oct 2019 10:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=woBF22Zo3gSgEXnFBjrpZBAJnkenQ3ulqN1pWDAJfBI=;
        b=iIaJnSY5r6Ahxx8YoZjrnS4jLJmWxbdiN93xBV+bw4yS1Poo3t+GPpFmRCZwtvtMSr
         MB02bQhArwCrXHzOlHK7msZlH+HGM3CXzv9gNxRhn5gHI1Oxeac5y+q1KbOi/clRC5+d
         QKSfJw4nLvapU4GrZHY5I6o6DY82B0j61ArVo4HFNvI/tBzBY7OyJxR344reZk17Iw4K
         KPOTPDV9fKizD2cOI2HRtQR27y7p8oJlM5m1icDC9SzHEJT6xfJp/2SqV6mQ4PPDlxhK
         GW17Nqq4OXFuKCDQo1e9y0HbLr/UBBlEx3p7EbEIuQ8dW/kAbo+ZsMUrEmMqnb11Iv2u
         RaKg==
X-Gm-Message-State: APjAAAV03sYNDmX0I5SmnavEiK6BieYt+Lkd8fASLgOCzd3V+MGjUfON
        0+QhO1RBLq1cl85SDawbDA==
X-Google-Smtp-Source: APXvYqyr/1vK3/H8M3hQGrLJtcS3+95Pa3jcICVvxpRAUDlmEdNi7d5eXvtMuY3v1sivDQUgc/Dw4w==
X-Received: by 2002:aca:4994:: with SMTP id w142mr25900821oia.88.1571073505046;
        Mon, 14 Oct 2019 10:18:25 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v6sm5638740oie.4.2019.10.14.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 10:18:24 -0700 (PDT)
Date:   Mon, 14 Oct 2019 12:18:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        alexandre.torgue@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, hugues.fruchet@st.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: media: Convert stm32 dcmi bindings to
 json-schema
Message-ID: <20191014171822.GA7421@bogus>
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
 <20191014092021.24020-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014092021.24020-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 14 Oct 2019 11:20:21 +0200, Benjamin Gaignard wrote:
> Convert the STM32 dcmi binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> -use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - remove useless dma descriptions
> - fix clock property
> - add additionalProperties: false
> - fix reset indentation
> 
>  .../devicetree/bindings/media/st,stm32-dcmi.txt    | 45 -----------
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 86 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> 

Applied, thanks.

Rob
