Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A065B12FF5F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 01:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgADAAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 19:00:55 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46876 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgADAAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jan 2020 19:00:55 -0500
Received: by mail-io1-f68.google.com with SMTP id t26so43072784ioi.13
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2020 16:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xmFf6L8ePvGKyOz/wpH8wXZ5AKBsBj34hi1vb6ky2dA=;
        b=aMmUgz10UPtLC+p76SSMGFCnsuO0etGmWsVICKJfidqE1kUkyTXHnTTUjfWbKgpKIR
         aCNpvUVtrWILzocYY3dorlD10e/G0PU+dq6pdvX/ht16txam1hj+uxjJ+qy/P8Mqh/Mj
         Jb+pXvP7CP75Hv9ZjwSAcAA2wh/wwprKMQTwK6cfDn9w1DmNwwl+ovtOLlCF8Dj+nfEO
         SC+g05FaiJ5Jml1zIXiS3viQj5LLmXTzxS6/eq7ILQCUWbtL4nh3FttHzKmXVVQrQAsC
         CMSKaZdHtCcsSNm8DwS+L3tQcssJ0UItdQ2akJP7IRiNYLB5r1DqGeFjo/VywolHzpt+
         ddJg==
X-Gm-Message-State: APjAAAWEfbm+aFBw1/WaCH3+6uSAdrfpvZ2c83elTZRPEMTRhPy3AaHz
        pwUZHRIzGhVGN1UxYiOmZ54D0bc=
X-Google-Smtp-Source: APXvYqy3IOIevp7lGPzg9svKa8Kp8ZIo7N17uq4u6iyAM66qAAWdpngIm5A9eXjyJ5jtNtAMGLV7/w==
X-Received: by 2002:a05:6602:280b:: with SMTP id d11mr60166736ioe.250.1578096053997;
        Fri, 03 Jan 2020 16:00:53 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id 141sm21523608ile.44.2020.01.03.16.00.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:00:53 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:00:52 -0700
Date:   Fri, 3 Jan 2020 17:00:52 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v3 12/12] dt-bindings: media: venus: delete old binding
 document
Message-ID: <20200104000052.GA17596@bogus>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
 <20191223113311.20602-13-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223113311.20602-13-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 23 Dec 2019 13:33:11 +0200, Stanimir Varbanov wrote:
> After transitioning to YAML DT schema we don't need this old-style
> document.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,venus.txt  | 120 ------------------
>  1 file changed, 120 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
