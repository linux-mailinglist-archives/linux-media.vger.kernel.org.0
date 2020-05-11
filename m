Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5FB1CE74E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgEKVUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:20:50 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:34328 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgEKVUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:20:50 -0400
Received: by mail-oo1-f67.google.com with SMTP id s139so1309525oos.1;
        Mon, 11 May 2020 14:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wpZ8Z2HbipIJu9qv1JxM/GBZFY/WCkbQWVqJwdqtSag=;
        b=qDZliZ+iPzvUKUfjjV9jiky6JsDx5PM4ms0VBdPaiGTyhkX+W4SwVSo4ZC2gdviYG9
         GFsFUh2QfvGy5QWdua5fa2+vp1owLgMDP1uPebW8kf+FFvPFb3aaDIeycJelEp/b9MZJ
         4UOSxDdoOv1pmIlRX9yFS8yrRjz8DK3ERwYbSUkutyOUVl81lA1oeEwZjs7sCIUfpwbr
         5ObISaU9Nz6v1+NNv4rwo+1j58VqK4ZErhBwfR0PyLjC48CAYOUrpiQG78JUk5bJyc2L
         FWzt6jZbtI53STUAoXwjSSkqtE1I1QdUT6/0nc3r6gQOB05v2wf8SYe3gNpqVeZuOxP3
         LayQ==
X-Gm-Message-State: AGi0Pub5Lk+Eb6XOa+K3OcPwRwPobHiTQ7ZfG2z10sss2GSs1nVDKCBj
        gZAVfaEPVCk8w8LIpcxrwA==
X-Google-Smtp-Source: APiQypI6KnlaeO1Yh0UWBD8XnJ6hSVXpqxOM5EEmjFaHTRG4YNRZTlr/VBxQK1119F3/KE+/5tpirQ==
X-Received: by 2002:a4a:9413:: with SMTP id h19mr10875976ooi.52.1589232049084;
        Mon, 11 May 2020 14:20:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t15sm3140462oov.32.2020.05.11.14.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 14:20:47 -0700 (PDT)
Received: (nullmailer pid 31409 invoked by uid 1000);
        Mon, 11 May 2020 21:20:47 -0000
Date:   Mon, 11 May 2020 16:20:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add ch7322 as a trivial device
Message-ID: <20200511212047.GA21845@bogus>
References: <20200424053819.220276-1-jnchase@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424053819.220276-1-jnchase@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 24, 2020 at 01:38:18AM -0400, Jeff Chase wrote:
> The ch7322 is a Chrontel CEC controller.
> 
> Signed-off-by: Jeff Chase <jnchase@google.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 4165352a590a..ec2ddc6cdf9a 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -48,6 +48,8 @@ properties:
>            - capella,cm32181
>              # CM3232: Ambient Light Sensor
>            - capella,cm3232
> +            # CH7322: HDMI-CEC Controller
> +          - chrontel,ch7322

I don't think this qualifies as a trivial device. It has HPDI, OE and 
reset signals all likely hooked up to GPIOs. You might not have those 
hooked up for s/w control, but someone will.

And I'd assume if you had multiple instances, they will need to be 
associated with each connector.

Rob
