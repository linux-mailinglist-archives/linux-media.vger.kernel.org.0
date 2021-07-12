Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1938A3C64BE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhGLUJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:09:33 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:34666 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhGLUJd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:09:33 -0400
Received: by mail-il1-f181.google.com with SMTP id e13so20894856ilc.1;
        Mon, 12 Jul 2021 13:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jNoeX8wO21WvMFCN8qLPmxb7NixIaEwIKhRa/jBZc4c=;
        b=t22ceyA++Z/FsUHH9/iJdIR1za/qHX5YzspRZDjXD5EwvSD3UH85agFkXNRv1Y/wCd
         uZPyHNC6+Oi+us+QHi2H6d06FPgBhdX8q4qfcYC3nGcHjmaFXgWSRCYDm5qGbnthB0KP
         R8qkAD+2fmkitAv9qJ8M2rW9J+l65mwBoSpihbMeKIROVX5uDdbRHFaBLCn8GXG1crLj
         fRZTvjhJiHzrfRYIzKfD7xfNTQtvrR48K5TFAaMBgncxLYpMoAxcI9G7XZiWLFbixF6E
         ZVZrKBOrFj8OVpF4z4oa4c8q+T7YYWXOBwfAF1z8+qzKo1jrIFbeA8AXnp4wySiEaWVS
         tGmA==
X-Gm-Message-State: AOAM532tohKBPfnIWtBnJav6nRw2nVSO/mf9gDi5u1UtAWLtg4eL3Pcr
        BheCrhZqtre9W4flRdbsYA==
X-Google-Smtp-Source: ABdhPJy3Ws07cjAcuQgmhwGmkg9rBtZCWcMS3vUCjkNdSNq8fw2r4z5SkuCIBcSAUyqhaEvi8EoI1w==
X-Received: by 2002:a92:660f:: with SMTP id a15mr427034ilc.182.1626120404334;
        Mon, 12 Jul 2021 13:06:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g22sm8572430ion.10.2021.07.12.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:06:43 -0700 (PDT)
Received: (nullmailer pid 2400326 invoked by uid 1000);
        Mon, 12 Jul 2021 20:06:42 -0000
Date:   Mon, 12 Jul 2021 14:06:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        hverkuil-cisco@xs4all.nl, helen.koike@collabora.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com
Subject: Re: [PATCH v6 09/10] dt-bindings: media: rkisp1: document px30 isp
 compatible
Message-ID: <20210712200642.GA2400244@robh.at.kernel.org>
References: <20210618130238.4171196-1-heiko@sntech.de>
 <20210618130238.4171196-10-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618130238.4171196-10-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Jun 2021 15:02:37 +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Add the compatible for the px30-variant of the rkisp
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../bindings/media/rockchip-isp1.yaml         | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
