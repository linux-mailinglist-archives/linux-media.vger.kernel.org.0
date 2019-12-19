Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0777126FF5
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 22:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfLSVsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 16:48:17 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38382 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSVsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 16:48:17 -0500
Received: by mail-ot1-f67.google.com with SMTP id d7so4620492otf.5;
        Thu, 19 Dec 2019 13:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z8WpkfaBd9LcNOS1ekWzc3jrpBFEgAwL/QCFq5Jyeew=;
        b=AvxU+4kJ3aXwhwlLJ0DtiRGeL0xFfCOo62CZzDc3v+uZ13VhgY74sGeEIkjDquwmlS
         SJVHtJ8u5Vgl6nnXuTveknv8aWkxSWwcRVFxvER4oSMF9ZmA6N1OnID3FAhMJJkMBGs5
         5DHmRR9P5nIAeZFguR+Ux+yorEwbQNSRx9WHU0n6ukmdCt7hWeqXQ3M2V6k4jAHvnoxt
         l8PNZJoYEMyZRgjc89bHKatVvgm86t5OsCWJ2Msg0DTy98fQuWxp/02xzPNJBUAkZXaU
         NrHrWs2+4GhPN7f6z0OsR7B6OadTvWIqvhx3PjIj1YqR6LYz06a1P0ORbS3iCWmeKYBw
         UOeQ==
X-Gm-Message-State: APjAAAV/S6uiMA2Hd8qHiREbSRXlqjmBvrXYOyVV//S+JqnTbaFimlcc
        eWC7KYn6EM3ZrU/8rV4KzQ==
X-Google-Smtp-Source: APXvYqyRMrFF8GIOCRwcLqbmo96aJh0GGtJtfkuQW1KREFiW1KO2DI9WZdU4KIzqYrCOJ1NQrGxQ6A==
X-Received: by 2002:a05:6830:22e3:: with SMTP id t3mr10536060otc.193.1576792096066;
        Thu, 19 Dec 2019 13:48:16 -0800 (PST)
Received: from localhost ([2607:fb90:1cd2:8a0d:3549:d84c:9720:edb4])
        by smtp.gmail.com with ESMTPSA id n17sm2572850otq.46.2019.12.19.13.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 13:48:15 -0800 (PST)
Date:   Thu, 19 Dec 2019 15:48:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: media: renesas,ceu: Convert to yaml
Message-ID: <20191219214806.GA32623@bogus>
References: <20191211171300.87023-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211171300.87023-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 11 Dec 2019 18:13:00 +0100, Jacopo Mondi wrote:
> Convert the Renesas CEU bindings description to yaml schema and remove
> the existing textual bindings document.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> ---
> v1 -> v2:
> - Dual license as suggested by Rob
> - Fix compatible string for r7s72100-ceu
> - Add 'default' to bus-width endpoint property
> 
> Thanks
>    j
> ---
>  .../devicetree/bindings/media/renesas,ceu.txt | 86 -------------------
>  .../bindings/media/renesas,ceu.yaml           | 78 +++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 79 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.yaml
> 

Applied, thanks.

Rob
