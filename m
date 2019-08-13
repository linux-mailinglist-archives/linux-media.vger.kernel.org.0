Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254828B831
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfHMMQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:16:10 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46639 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbfHMMQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:16:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id q139so3221446pfc.13
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HVlLJiIzjaXDxFFkRwCgsS9CVo3aI/KKzGwIYcEyzZU=;
        b=XNUFdEtT15n7SWbDoymnDWB6S1FHl3jTRMDvFq1tpn+deX4cDMtdSaifhruzfd5utA
         Zm6EOCAz2i2aXTj/LvosazkuB1chumYOVHkJVyOztRrzdHDgtxXKQsag4uSefxubT8x+
         x8F9fAzkGkBc7u9QgBuN/hq7bzEW/tmUINBC0DuoIUPEe455xY7RjQ2NFB3+cTbPFKny
         eYCN6EhLj+4oY6s+oDAWKtGbhZo4r+HhznjjdW37EgA0ODTPkQnXJkWn5QB6sCpwgMb9
         3jfjohhGwfSx4Y7y23bjrgF8Dgs8wqn4QCUrhRRoUK+AqAEGBXjikFMhsCwTCF9uuNa7
         1VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HVlLJiIzjaXDxFFkRwCgsS9CVo3aI/KKzGwIYcEyzZU=;
        b=p0ebFLwrbQKe94cpdw4ExFgI66v++wFu8P0dQ8Khmg3VmKs4vtvvc6uXVGBQCd4un7
         vcKbZkjxi0SpAErRMAEHYtV8MypGtHl3gXg+t7mk1R9QXkFFIKBYxqSE5iGa+MOgMrKW
         4cTLdkVenxqPHZop4NK0e3eaRnTJCbHX7vZ9A/K/KNBmGkSdfnjXI59a+X7MYd/Y68lz
         3qcIUxQMqS54Lq4ocoWc0UUkK6BjBxaWPAQQX7pYq0yKfmnlQCDELJUEitjq2m709JuJ
         RJcXuN+E8TXcx95ZGZtR2JLAH/n6loueXqSU4wUhr7Ctqxj2ruRm/25CVVwePLWdXKGx
         SuUg==
X-Gm-Message-State: APjAAAUePKKHnfFsbcNVP6SXccYn2UUprIkZ77wIyjy/fhlq4a146I8I
        J5KkdYMLaJHtV6Hn08jCHevQ
X-Google-Smtp-Source: APXvYqyqBDGNMo4tLSC5P2L0ZMq6zP+MdPBF4+rrYMx7vSuFUW2VLy1NayISlC8n8x8eROfvPHOiTw==
X-Received: by 2002:a17:90a:fe07:: with SMTP id ck7mr1936580pjb.68.1565698569207;
        Tue, 13 Aug 2019 05:16:09 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:649c:6ce0:9d44:669c:5d6c:bc5f])
        by smtp.gmail.com with ESMTPSA id o24sm200027991pfp.135.2019.08.13.05.16.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 05:16:08 -0700 (PDT)
Date:   Tue, 13 Aug 2019 17:46:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813121601.GB29378@Mani-XPS-13-9360>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813115427.GC2527@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813115427.GC2527@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 02:54:27PM +0300, Sakari Ailus wrote:
> On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> ...
> > +Required Properties:
> > +- compatible: Should be "sony,imx290"
> > +- reg: I2C bus address of the device
> > +- clocks: Reference to the xclk clock.
> > +- clock-names: Should be "xclk".
> > +- clock-frequency: Frequency of the xclk clock.
> > +- vdddo-supply: Sensor digital IO regulator.
> > +- vdda-supply: Sensor analog regulator.
> > +- vddd-supply: Sensor digital core regulator.
> 
> Could you also add the link-frequencies property, please?
> 

Sure, will do.

Thanks,
Mani

> -- 
> Sakari Ailus
