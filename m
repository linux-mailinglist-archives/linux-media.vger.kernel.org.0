Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0305A100ABE
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 18:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKRRrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 12:47:21 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:37686 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfKRRrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 12:47:21 -0500
Received: by mail-ot1-f48.google.com with SMTP id d5so15276363otp.4;
        Mon, 18 Nov 2019 09:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DBGcQ5tRim+rJHu21QexpgiFtF/W9Uo/aIw7rep+4Ew=;
        b=CkxTqHPEWowjKLEqK+4yzU6PejpluU3pWiUvbydlJNrgu1XPblu/NtL/m8U3P+y6RO
         GlTQs87VljUnPJT0Sdqm2DPQPg10R0XF1o88bRiVS1RPnqBecqGWsEdkl+SkYQS7BWcU
         UPRCJiF39cZynHVrkChvcLXCXloowZI2d7o3DCIhgGBbZoVtYz2VthOV0Crui3u5GWH7
         G3TalpI/ckbFRhRqKKZAuaUY4pXX6cYVMaQpFm5lKbirIjTd9bA4c6dGwYPmLVqQ3DVx
         vgCuIwHu26XVK37VXqI1pNKd2dwmPbet7l57zFaSBNt3MLOlXJ1rd/tpzp8EfORZZjcs
         uk4g==
X-Gm-Message-State: APjAAAVX4iWEIszp4qTUE6z1uGAOK52NA1K61MdCmCPFpSowER53GaJx
        ZhfR3dj0tiq7EBM4e8XU6Q==
X-Google-Smtp-Source: APXvYqyodVGQ2IuHf3mfyOV0jL/iUZ7Co9F3pSKQ1r1b2efFRSJbqGk17z6KWF1hldkdDVzJ7QjCSA==
X-Received: by 2002:a9d:365:: with SMTP id 92mr381363otv.9.1574099240177;
        Mon, 18 Nov 2019 09:47:20 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u204sm6376146oig.35.2019.11.18.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 09:47:19 -0800 (PST)
Date:   Mon, 18 Nov 2019 11:47:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [RESEND Patch v3 20/20] dt-bindings: media: cal: convert binding
 to yaml
Message-ID: <20191118174719.GA19678@bogus>
References: <20191112145347.23519-1-bparrot@ti.com>
 <20191112145347.23519-21-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112145347.23519-21-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 Nov 2019 08:53:47 -0600, Benoit Parrot wrote:
> Convert ti-cal.txt to ti,cal.yaml.
> Add ti,cal.yaml to the MAINTAINERS file.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../devicetree/bindings/media/ti,cal.yaml     | 202 ++++++++++++++++++
>  .../devicetree/bindings/media/ti-cal.txt      |  81 -------
>  MAINTAINERS                                   |   1 +
>  3 files changed, 203 insertions(+), 81 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
