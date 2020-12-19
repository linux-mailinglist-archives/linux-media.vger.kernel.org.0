Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DEB2DEDFF
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 10:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgLSJ2g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 04:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgLSJ2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 04:28:35 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51041C0617B0;
        Sat, 19 Dec 2020 01:27:55 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id v2so3034312pfm.9;
        Sat, 19 Dec 2020 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ctmRMSbwSXsaUJmiSd13cerYbuM3368cFgF1ybIbnTk=;
        b=TJAl+FrXpE9DBSVN6HlpabGbK1T5ePXYs0WRG220mm555kBJcqf2uiFcVg3T7VaSGT
         LQRfLBrNHh/aIt+fc1XuNI/sRDVQV1Y3KP95RaJDRVSk50P0NEFcEK4r9rleQFjV117a
         hrr3pBCTPsyip+3lKtfsvF/xP1jJH43EjsTWQjQmVY8HZz4ioQxJVvLsB550cgnPA9lp
         jexkeuw/XqO4ULcgY2XV1V6gAEl52d95gftoIhuPgDBYYlZggN+CvMvzBzV4D2FX+xrm
         sQyq8N0lYFVlXT/MQlNlKnWArV+pS5YXkwKRo8GPI1Ib19T2H+YIsGd+FizMJrl5Sv2k
         s4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ctmRMSbwSXsaUJmiSd13cerYbuM3368cFgF1ybIbnTk=;
        b=g4GIy2N3rxvQjpLujLqsV7Iaxx7uQcTl6R557ds3KBHRAaO45HDn094vpMOVnRl53T
         PplzObH0P3p3Dr6ou27yJ19UQT8Jgi+I+kPBkTPpZF7uxj0nm+F6vqSFyUnq1feaJAHn
         AL0zjettqVG4aYB9i0yqME/J/dQgWiCD3vaxBsluLKCbgFY1lCGdl+ZsDX98g2+CoZUE
         fI4JgEuxPas3KaQleAxwlX08PoOCCih7a9sKUaYg6/B2lU7hks8bA8edzkYjwrqD0YMN
         MocHLa8YNv3G0nkHHq5u9hXmjMr3n75pY5kEJnAzXZotuapyEMj7HeKvsm2cILfz1JNj
         PiYA==
X-Gm-Message-State: AOAM530JHkL/6dI8x55oYWZ8JJFWtiUrk05bNyAJS/whODl7yDqzOTOa
        DY4+w6+I4ykzsnHaT6qD6NI=
X-Google-Smtp-Source: ABdhPJwoWtXQBa4bBhOrr/hAGclT7oR71ftv1fFkA/FD/hXBOdJCLFtbTmZPAJbL75q6V94kP3HcKg==
X-Received: by 2002:a63:5845:: with SMTP id i5mr7465833pgm.355.1608370074869;
        Sat, 19 Dec 2020 01:27:54 -0800 (PST)
Received: from localhost (g39.222-224-245.ppp.wakwak.ne.jp. [222.224.245.39])
        by smtp.gmail.com with ESMTPSA id mz1sm9467603pjb.33.2020.12.19.01.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 01:27:54 -0800 (PST)
Date:   Sat, 19 Dec 2020 18:27:51 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Zhen Lei <thunder.leizhen@huawei.com>,
        Karol Gugala <kgugala@antmicro.com>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media <linux-media@vger.kernel.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: soc: add the required property
 'additionalProperties'
Message-ID: <20201219092751.GI3168563@lianli.shorne-pla.net>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-4-thunder.leizhen@huawei.com>
 <20201218211706.GA2190351@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218211706.GA2190351@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 03:17:06PM -0600, Rob Herring wrote:
> On Fri, 04 Dec 2020 17:38:11 +0800, Zhen Lei wrote:
> > When I do dt_binding_check for any YAML file, below wanring is always
> > reported:
> > 
> > xxx/soc/litex/litex,soc-controller.yaml: 'additionalProperties' is a required property
> > xxx/soc/litex/litex,soc-controller.yaml: ignoring, error in schema:
> > warning: no schema found in file: xxx/soc/litex/litex,soc-controller.yaml
> > 
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > ---
> >  Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> Applied, thanks!

Thank you!

-Stafford
