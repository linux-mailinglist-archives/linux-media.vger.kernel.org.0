Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1402150A44
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 16:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgBCPu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 10:50:58 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37592 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbgBCPu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 10:50:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id f129so17781062wmf.2;
        Mon, 03 Feb 2020 07:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2k2kojlNxd6DLo6ZxtPDv7dwX5Kkpi8+VuIoDodoN/U=;
        b=s+lNy+63T8N4tpl+7Do/OIGNrUOsRl8ILh/o5OEG/89bbymKgPfjoQZBQYXKhTmJhf
         7rmAp8gJwI4igIcxLlE2c0AT/4PZ8n4kPUkpJDg4biMfp/svmo+50stwPB1CFjGGCi/j
         nNf4BACFMn8ADnLP+O5nTo/TGLQ35byb3ilB8mquXb0rboRllaYbkjNP/ceJr21SsYL3
         yazfvsMuBgDjZfbcf0qR7MD23i9G3Ixlk06YmRA0Nzf83YS1uRkz+JEP4asirsK395L9
         e6MQgICHvjQk2O8C8EWDsszVDVCgxp+TToidLqzkTyWuxZ/alRRXRsrOVMIWGZ7f898x
         DWJA==
X-Gm-Message-State: APjAAAVBNmUgqS2aYV2StksPHXHgD/yMB4gmIRd6Ula6kGiXxEVZ82ZZ
        UUp9CbJ8WZ+FfWnKLz1fEQ==
X-Google-Smtp-Source: APXvYqyRfaAh3JGytPrKq2wtY9lyEdrbniGXSqLRqcVdhsb6pMyhheXASqBIVxbekNRZP4jDij2odA==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr31837445wma.177.1580745055783;
        Mon, 03 Feb 2020 07:50:55 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id w8sm24091252wmm.0.2020.02.03.07.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 07:50:55 -0800 (PST)
Received: (nullmailer pid 25905 invoked by uid 1000);
        Mon, 03 Feb 2020 15:50:53 -0000
Date:   Mon, 3 Feb 2020 15:50:53 +0000
From:   Rob Herring <robh@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 4/5] media: dt-bindings: media: Add Allwinner A64
 deinterlace compatible
Message-ID: <20200203155053.GA25849@bogus>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
 <20200125110353.591658-5-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125110353.591658-5-jernej.skrabec@siol.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 25 Jan 2020 12:03:52 +0100, Jernej Skrabec wrote:
> 
> Allwinner A64 SoC also contains deinterlace core, compatible to H3.
> 
> Add compatible string for it.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../bindings/media/allwinner,sun8i-h3-deinterlace.yaml      | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
