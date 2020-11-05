Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B6F2A89C2
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 23:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732200AbgKEW2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 17:28:16 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37582 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKEW2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 17:28:15 -0500
Received: by mail-ot1-f68.google.com with SMTP id l36so2959621ota.4;
        Thu, 05 Nov 2020 14:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HAB4TfB3OG5D83YaeTiy/sDYe1f16TcNEMvC+v0nD1E=;
        b=UfmI1MgEVcB/0L/9zulZWcuxVxvgL7nmGk8PdJduF6i0GgrpipEXXMmNP4STMQuRlM
         lT5hoDKhg9DmB4FTHWVDLfxUfrMBmbiEI/abTu5LOafrmjY3UWS1my9jCffLVJM/J+Vo
         9HJUv8O9XNpW9uHu089am320jmjBNPMJzV6tJNXf6ZcvYH8e25kWmg7geNqu7lt3tn3F
         i/zkNn9RQqSNZn0WAotfNzsbfmTTBRMo58YPa76EGOCrQGojKLNFkxL7Awa99qH06K3z
         z95GgD32bIbaqXYcm4r8qCxTuHWrs1zj6Z1QXZiRLUqd1szHSGgoKVFtw4134TQ3mTjk
         ss2g==
X-Gm-Message-State: AOAM5333fG4fLzjrGyB9DSsFd9l+mq2mYDQ6ky5aB5KgsSE1o6zaEJyu
        d7f0JwJNJFWSzCBX1SykDA==
X-Google-Smtp-Source: ABdhPJxYhbRjqk86zYy6aUoBiL/gprHxtyRj1prSv8IZnbJiDbQwuuV5tw+1saXj7G4H/i1LuT0TIg==
X-Received: by 2002:a9d:682:: with SMTP id 2mr3291412otx.317.1604615294791;
        Thu, 05 Nov 2020 14:28:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v10sm633636otq.69.2020.11.05.14.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:28:14 -0800 (PST)
Received: (nullmailer pid 1915203 invoked by uid 1000);
        Thu, 05 Nov 2020 22:28:13 -0000
Date:   Thu, 5 Nov 2020 16:28:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        linux-kernel@vger.kernel.org, Alain Volmat <alain.volmat@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philippe CORNU <philippe.cornu@st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 2/4] media: dt-bindings: media: st, stm32-dcmi: add
 support of BT656 bus
Message-ID: <20201105222813.GA1915114@bogus>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
 <1604511132-4014-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604511132-4014-3-git-send-email-hugues.fruchet@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 04 Nov 2020 18:32:10 +0100, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus mode in DCMI driver.
> Add "bus-type" property and make it required so that there is no
> ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
> BT656 mode allows to save hardware synchro lines hsync & vsync by replacing
> them with synchro codes embedded in data stream, hence hsync-active &
> vsync-active properties are useless in this mode.
> With DCMI, BT656 bus mode is only compatible with 8 bits width data bus.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
