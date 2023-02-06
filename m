Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB5768B910
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 10:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjBFJxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 04:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjBFJx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 04:53:26 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FCB1F5D8
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 01:53:13 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a2so9505450wrd.6
        for <linux-media@vger.kernel.org>; Mon, 06 Feb 2023 01:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OALBcHyiOKdLr54uUWDTNKeHxszaZfIesV0P4fl0wK8=;
        b=VIFYf3oxH9pTHspvdDZhugsxik7L0cScUnO3y/bJrX111E+tvEd/bwRXLtxbelM/bh
         q+9BpHIfbeeitjehJAweYsC3/GnxCIx/7LM3f1Vv2L7y7AVx4TU8yV0gjestCrwgyLiX
         Ke0ccVLwzbkqdMwkF+yGL6GhYLZ0d4cTzGoRsvN8dV11fBX2IeYmZeXhUhCiOrIjHQsv
         9UZxUBxMhNFZYC+kAHx+gL8wfi13ldMSAQPn+NJCNP5jwsKThlyfOtp8WUhnI9ilmEoB
         OEWh2PlIpLk9ASmH7Uap3he7Q5Q+hT2vC8NksWKgb6IBnVkqHuOjWuCedym3rGNeFqgk
         d2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OALBcHyiOKdLr54uUWDTNKeHxszaZfIesV0P4fl0wK8=;
        b=4px9qgNNdFR8UMMPelZdkoY5KzUdKzqTf+qdnUHIVPJSpIP0TLHwhTY7oggiav1+zV
         11f+giuT2+PQGoheX6zpwkz5WP1vsWiHVwAvDkGCg5tqZADA7PfD4R0PXctUd7hvKADy
         Z6BIJR0gixxnX3t2G5AdkGnhJ9ePl+J6j8hDMjwPfWjDuiFyy+viJhVj5qaymkCl4nO/
         fyf96uPWm/YhwIVfSXXoEkzoXdUDKCmx0qg5U5013dPeWFeB2/hncxCU6I0eHWyHpdrR
         RwHWJm/TSEpdKyp8GDPnhGFgLokC8fktgint5UTZp66DNzhZ+ropu/8D8mrxTSZJF0U5
         c0nQ==
X-Gm-Message-State: AO0yUKUSyV4U7syiKvH/cz7iXZF7L1CK+472NzsPiPrU9P648c8BtBPE
        g+sJPHemY4qskOmNZRSAWNrsOA==
X-Google-Smtp-Source: AK7set/wudvAKqMKIier8OI6uZN6H/gUsSGBWlNJVOF5lc5ZYm6g0ZPJNhJKwJDDf5QLpiPevUG3bg==
X-Received: by 2002:adf:f006:0:b0:2bf:b199:c7ef with SMTP id j6-20020adff006000000b002bfb199c7efmr16179901wro.12.1675677191879;
        Mon, 06 Feb 2023 01:53:11 -0800 (PST)
Received: from melexis.com ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm1533201wrt.108.2023.02.06.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 01:53:11 -0800 (PST)
Date:   Mon, 6 Feb 2023 11:53:09 +0200
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrii Kyselov <ays@melexis.com>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v4 0/8] media: i2c: mlx7502x ToF camera support
Message-ID: <Y+DOBR0vLJHgONM1@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
 <Y9DvUDQb84nz3qVc@melexis.com>
 <Y9EW2jqRa47UZezR@kekkonen.localdomain>
 <Y9E+hJ604i/ss/xR@melexis.com>
 <f71e9386-8a6e-a546-fa26-5abe55e3eeff@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f71e9386-8a6e-a546-fa26-5abe55e3eeff@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

> By the way, was the mailing list dropped from cc by mistake ?
No, I just wanted to send a remind about the patch to Sakari and Laurent.
Now it looks that this thread became more technical, so I am adding cc again.

> >> I took a glance already and the driver seems reasonably good but I'm
> >> concerned of the interface. How generic is it? I can't say to be an expert
> >> on these devices and we don't have any other ToF cameras yet. Is the
> >> precision (8 bits) of the control values enough?
> > Fairly, that it is an interesting question.
> > The frequency modulation defines the maximum range of object detection.
> > 1 MHz precision is what we need usually, as the maximum range is from
> > 1.5m(100Mhz) till 150(1MHz) meters then.
> > Usually, user applications use 60-80MHz(max range is 1.8 - 2.5meters).
> > Also, it is possible to have smaller step then 1 MHz, but it is not that practical.
> > I am ok switch to Hz and use u32. In that case we will not be limited for generic case.
> > 
> > Benjamin, what precision is better for frequency modulation in your case?
> 
> Good catch, we do require Hz precision for some frequencies we use.
> In other systems we use floats expressed as Mhz for this. As Linux only
> supports integers, switching it to u32 and express it as Hz is a good idea.
Ok, then I'll redo in next version.

-- 
--
BR,
Volodymyr Kharuk

