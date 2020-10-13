Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5082428D182
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbgJMPvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:51:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42535 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgJMPvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:51:11 -0400
Received: by mail-ot1-f66.google.com with SMTP id m13so422814otl.9;
        Tue, 13 Oct 2020 08:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2/2MnqF2Gy16RxbaNIawyqqNZ0AjkNS0GYEqVgqjHYU=;
        b=H6zgasFqBUN1pRPAaxvhhq1RWbKTRjg8ciBLC/O/tNBVy3v9p5PMORuCF0hYWMSuTb
         Pl+OVk2lj7JyyVlNbhJ2li33JBvzkWf5tT0VAf7Z2cvSxzlfmLQlskd2Nz9LMwMbUT94
         jslnaZUUIuOgtk7ND0SI39B/f4nP8ImygXcgjTNH/aQ2C9sfVTneNJAKXdAX2vU1yrhr
         xxY5YPqLlL44XBkqdF0M/heHRddbyomduetOxs4g+z7s6sJeVi8wFOz0hrD8qlBoa6Me
         uwxyWeLpC3Ele41TKvA9MswbnkOIeFejBs0g3hqCSsOqXT8v802J5cHykMVZHGYZ6oiO
         l1TQ==
X-Gm-Message-State: AOAM532I9x/3qiTNHo+nbrdx/wabmVFsHEfSrbflQ4MCzfG9nz59oLNW
        mLFa18ki7pobK8xJX/MEWg==
X-Google-Smtp-Source: ABdhPJzhkZpzL0I9XvrUKN7b6gSIA/TIkyR4RWCo85LmhUXK++724lhybp4DWdh6yU7+pdulCh3kbg==
X-Received: by 2002:a9d:3bca:: with SMTP id k68mr207926otc.150.1602604270789;
        Tue, 13 Oct 2020 08:51:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x13sm88293oot.24.2020.10.13.08.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 08:51:10 -0700 (PDT)
Received: (nullmailer pid 3584956 invoked by uid 1000);
        Tue, 13 Oct 2020 15:51:09 -0000
Date:   Tue, 13 Oct 2020 10:51:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bogdan Togorean <bogdan.togorean@analog.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-media@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Message-ID: <20201013155109.GA3584900@bogus>
References: <20201009113014.71531-1-bogdan.togorean@analog.com>
 <20201009113014.71531-2-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009113014.71531-2-bogdan.togorean@analog.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 09 Oct 2020 14:29:55 +0300, Bogdan Togorean wrote:
> Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
> front-end.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
> v3: drop I2C reg description
>     specify maxItems on reset-gpios property
> ---
>  .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
