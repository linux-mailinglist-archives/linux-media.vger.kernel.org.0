Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDBF21E42A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 02:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgGNAAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 20:00:55 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37637 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNAAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 20:00:55 -0400
Received: by mail-io1-f68.google.com with SMTP id v6so15466953iob.4;
        Mon, 13 Jul 2020 17:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wOPuVYur6h8tuyAKAZ1vKNn4igamlbQJNCJ8CthEK9o=;
        b=CMTmxO2vsC/F+X6i+FoNDgZL7DcAlKws1/AyV1cUjX0ZMTT291/NRXTKukeHFhA/MG
         i5zyzb+9ySAj9h9c0H24rMACi7i1H9o01dLcjA3gVWD+O/CwJhfMh7tdlXKZ+dEFzJou
         LTE0fHoHS25NNeTJiOPBnYG2QgrZFGFWAyG2evOGFEZSkLhSTJjy0o1gTXEO5uAv6FaA
         A0hJKnfEopyBs3In6U+PxMLjtg4atAYDZnBYL577ww/hmVeozeXcelAof3UcGcNm7i75
         UpDdleQmNWE7ibgxnrJDWzNtJ57eekR1SxfTeO2m1L+JmfdiF06HQiAUA2XTgPMrzOyq
         u74g==
X-Gm-Message-State: AOAM532Vu5wcueItkdZVya7M0kl69YyWAHpdENqbJq/KrNzQQ0efTYY4
        3y0aCU8ROoeVR8v+m/ling==
X-Google-Smtp-Source: ABdhPJzqkzoJOe6HxuTu9/O3zaXXkH9kNdURxoB0nBYzqptKaxDCYSKjt/2MsFlcwPFoYckHKi8J8A==
X-Received: by 2002:a5d:96d7:: with SMTP id r23mr2300768iol.126.1594684854173;
        Mon, 13 Jul 2020 17:00:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u6sm8919814ilg.32.2020.07.13.17.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:00:53 -0700 (PDT)
Received: (nullmailer pid 963897 invoked by uid 1000);
        Tue, 14 Jul 2020 00:00:52 -0000
Date:   Mon, 13 Jul 2020 18:00:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: media: renesas, fdp1: Make
 power-domains mandatory
Message-ID: <20200714000052.GA963826@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 21 Jun 2020 03:47:31 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Fix typo in comment message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
