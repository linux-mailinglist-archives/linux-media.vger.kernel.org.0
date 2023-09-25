Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6487AD7D8
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 14:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjIYMTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 08:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjIYMTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 08:19:01 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010CD10A
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 05:18:54 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so49851775e9.1
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695644333; x=1696249133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpHP0gjZZ+jc1OAptTHEyzuPC8yYPxjo1qi8MGdPaIY=;
        b=DnwKPmdYB4qo1hQkqy3sakSiILAshNdmn2LaBg/xbt+Kwfx4DhR6YTZLHRGVWKwB77
         pfRfIpg98sBIS2oe3wCFHeFFUKD1MD7zt5+85V2kTYmIjG0e01KgndKXCz4UXfCS77ZW
         tyaO0dWWXVRPvAMskKl70jyO1EVlvyZDrmo6+gmMLm/cXv/8Bsc2/SrfvzCEt38wYNGx
         0HGkX+iNstFBxq2bDlV08OrArrl3IXVBXgZuFlHGwLABK+YpaNk84FAhBl5SRJ34oAFC
         3qi3ikr/faKLMEa1qoQkOWdg7d8ojnFpRiT8yxKUysn4OeXefKP0vrUK8FPNmpqsPDTU
         Yh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695644333; x=1696249133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpHP0gjZZ+jc1OAptTHEyzuPC8yYPxjo1qi8MGdPaIY=;
        b=xC/L32PnNNUheDo8yl5EDAaoy8MR6Uo+5lVsOv7dHuQf/IdBqUk+8gHar3tzyWWKP3
         95aUZmv85IHOAHaX4UP8zm37I8cgvpxyfG/uB2iPlUqmKFyy2oVMjHVTvYZrma7PDu77
         C/b+8i4rFZDzZbZKq9dY6JV4ReDZ5rUdexzCN43M/nU2Pz0I9nYNvUQFzYW0D4mUmTrm
         p9EEqARKadSzEuoiXIoaKujJpdMIXawg2z7E+thWkoCB7P1cjFZ95rczMi3nTt96aDgT
         DCinrLLriLYtDPbcNyKmr4FjdAX1+v0XZ6O5wCX3NMPbsNOe/UIIkcX8eY2/4B1DKJ6T
         Mimw==
X-Gm-Message-State: AOJu0Yxtgqgb6rqvswU+z0wQkXsIHKeO+KSUmBFTAsF0nWh4MO+6mqVc
        7IcHIAblPZskYJuJTmEbUqFpMg==
X-Google-Smtp-Source: AGHT+IHrPi2LM0A+JOTQ15e6//++oAczdtZHV4J+jHAxcEA4WLivxDqwPJrKvih9F9TC8lgmR2L8pQ==
X-Received: by 2002:a05:6000:1e18:b0:323:2288:40ef with SMTP id bj24-20020a0560001e1800b00323228840efmr3530120wrb.14.1695644333441;
        Mon, 25 Sep 2023 05:18:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c3b8300b004053a6b8c41sm10408693wms.12.2023.09.25.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:18:53 -0700 (PDT)
Date:   Mon, 25 Sep 2023 15:18:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Adrien Thierry <athierry@redhat.com>,
        Dan Carpenter <error27@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 1/5] staging: vc04_services: vchiq_arm: Add new bus
 type and device type
Message-ID: <62363da5-39c4-40f2-bfca-fed182845eb8@kadam.mountain>
References: <20230913195354.835884-1-umang.jain@ideasonboard.com>
 <20230913195354.835884-2-umang.jain@ideasonboard.com>
 <e815e9d6-450c-4dcf-b562-f302dd9e22e5@kadam.mountain>
 <700e11e4-057d-78ed-8b52-dd2df97198bf@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700e11e4-057d-78ed-8b52-dd2df97198bf@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 23, 2023 at 07:57:51PM +0530, Umang Jain wrote:
> Hi Dan,
> 
> On 9/14/23 12:25 PM, Dan Carpenter wrote:
> > On Thu, Sep 14, 2023 at 01:23:50AM +0530, Umang Jain wrote:
> > > +static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> > > +{
> > > +	if (dev->bus == &vchiq_bus_type &&
> > > +	    strcmp(dev_name(dev), drv->name) == 0)
> > > +		return 1;
> > > +
> > > +	return 0;
> > > +}
> > I was not going to comment on this, because it's unfair to nitpick a
> > v11 patch...  But since you're going to have to redo it anyway, could
> > you make this function bool and change it to return true/false.
> > 
> > static bool vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> 
> Perhaps the return value can be true/false, but return type should always be
> 'int'
> 

Oh.  Sorry, I didn't look carefully.

Btw, you don't need to tip toe around telling me I'm wrong.  Just say
"That won't compile, dummy."  I'm a big boy, and I can admit when I make
mistakes.  ;)

regards,
dan carpenter

