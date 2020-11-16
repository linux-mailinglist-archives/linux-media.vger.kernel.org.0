Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92232B4A06
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 16:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731610AbgKPPx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 10:53:29 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39111 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbgKPPx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 10:53:27 -0500
Received: by mail-ot1-f68.google.com with SMTP id z16so16450864otq.6;
        Mon, 16 Nov 2020 07:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=07t3K0JEgnCVg7rKOhxAhhlnyrobdjtihkJZvLcS2u0=;
        b=h5ifRz47yimj17zm9PRylBV8LlFnfcZKo2g9Yq4cmLuFZqcYEQcuF2tQZ7vG5kTbXA
         JSMMJeIXK+9AU2xuz0jh9qvhIGLfmU/FdJofQAJWqY2gI/Xb3lUxyUsyqH0mwUNDgQbw
         BczAQmbzU5zbmIMx4ZGoAquo6zoP5EkYJCapYGL+ROiChoodL1xNnhhlf0+6CWz/AamX
         VZ7DK4c9SBGR7OGDB2j9yJhyZveHQoUHM8unlsVIiQ4JAf4bSiIo2eGaVm1xsvTmbzeD
         1+qHKYKaN0tVtyBebujauceV9rZlRPmfNkxNU2EA4gRj4fpdHY7hEwu7Kbg4OIv6cCpo
         /RCQ==
X-Gm-Message-State: AOAM5329TKI8BGFKKAdIluv1p1701Phlyu3dVtxRGXgA6e7oZsBkC6E9
        4FFX0eCJYued1C/aYpu8cQ==
X-Google-Smtp-Source: ABdhPJywYfUrmrSzu10gQ7/fhwrtAtrz2VHNs70NHmvabvWuDMD9WVRBTGvxa5ipLKfnDg9mXWLDSw==
X-Received: by 2002:a05:6830:22c9:: with SMTP id q9mr11706594otc.48.1605542005594;
        Mon, 16 Nov 2020 07:53:25 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d8sm4776015otl.15.2020.11.16.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:53:24 -0800 (PST)
Received: (nullmailer pid 1716954 invoked by uid 1000);
        Mon, 16 Nov 2020 15:53:24 -0000
Date:   Mon, 16 Nov 2020 09:53:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add OV5648 bindings
 documentation
Message-ID: <20201116155324.GA1716839@bogus>
References: <20201113170104.2252046-1-paul.kocialkowski@bootlin.com>
 <20201113170104.2252046-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113170104.2252046-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Nov 2020 18:01:03 +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV5648
> image sensor.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov5648.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
