Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BB33D6966
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 00:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbhGZVlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 17:41:06 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:39624 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbhGZVlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 17:41:04 -0400
Received: by mail-io1-f49.google.com with SMTP id j21so13798326ioo.6;
        Mon, 26 Jul 2021 15:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mv6erYWaZJR9dk5x4Gfa5MHHYyiQEZ5IAKk/24C/zJg=;
        b=a/OhC2L7N6RlkIWWRFDU6SYn0uTBuN4YQZZLE5OBpIXKbFTF4YPmYqIveJIF13+D9W
         KilBvOYn9O9tlOXYAV60nm0lQP22MjKZ7ryD5o9smr9m3VUml6zTLwrxMCLdN5kAiBiE
         HuUiCjmDRAICH6l2zwYcLtyxwXdzwusI/WPOrD2IgoB14CgyIeN0INMH9PcBIO1YZkx3
         EDSH+/BfpZbulaqZrYc+wfy/CHMpYG0/6BxwFZf1+ERSIFqFJAHoADwljB3efGKq9HUc
         fDqpwILunKnueoqOqZgKy3gVu8yKGpI5nMxY1r32tZmuqKEsBg4kUglOBzpfAQ/dQLfo
         XOuw==
X-Gm-Message-State: AOAM531WQm/eeO3gAtJXnGR30wm8uF8ZRULwEKXO+I3sD4ZebcuFZTEp
        CLEWI2fyanX2V2d53brmow==
X-Google-Smtp-Source: ABdhPJwxrp8upfs2mo/1MgMfEJ0vL1b6dEOhoaWvwBBrrcWDiSW1AKf+zKQ3J8zFOVN7ibXIhwvnkw==
X-Received: by 2002:a02:a797:: with SMTP id e23mr18647088jaj.121.1627338091257;
        Mon, 26 Jul 2021 15:21:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z18sm545175ilh.55.2021.07.26.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:21:30 -0700 (PDT)
Received: (nullmailer pid 977034 invoked by uid 1000);
        Mon, 26 Jul 2021 22:21:29 -0000
Date:   Mon, 26 Jul 2021 16:21:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v7 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Message-ID: <20210726222129.GA977000@robh.at.kernel.org>
References: <20210726073518.2167398-1-s.riedmueller@phytec.de>
 <20210726073518.2167398-6-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726073518.2167398-6-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 26 Jul 2021 09:35:17 +0200, Stefan Riedmueller wrote:
> Convert mt9p031 sensor bindings to yaml schema. Also update the
> MAINTAINERS entry.
> 
> Although input-clock-frequency and pixel-clock-frequency have not been
> definded as endpoint propierties in the textual bindings, the sensor
> does parse them from the endpoint. Thus move these properties to the
> endpoint in the new yaml bindings.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  .../bindings/media/i2c/aptina,mt9p031.yaml    | 86 +++++++++++++++++++
>  .../devicetree/bindings/media/i2c/mt9p031.txt | 40 ---------
>  MAINTAINERS                                   |  1 +
>  3 files changed, 87 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
