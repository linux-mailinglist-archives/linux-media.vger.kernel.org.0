Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FE21218C1
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 19:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbfLPSqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 13:46:13 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36813 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbfLPR41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 12:56:27 -0500
Received: by mail-oi1-f194.google.com with SMTP id c16so3255618oic.3;
        Mon, 16 Dec 2019 09:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NSxjmaL8rqoc8+SB0zsgyZ8fRQmy0mATs46EIZXgEyk=;
        b=Qgl2b+TMaU7LakVluiTrx/MNWV6P2Cm6yJabsMTMGvoFFRKQVm+OjFJ6CgQBO7vpiI
         zn5szxT3LbEbR6D6HcZckJKkZzQhyZwBu6wtSyEA6s8QsxQIUXAQ+DAJYCAfmKGjKas+
         ADAWTJrwGa+an5BPjC33tH+4t5I/5tBOO7qqzqxcWBVS6UvvniXIaU3XGdcD89sVbdn2
         L+CI7Xukyd0eWTy+3zJeAqlsq+tkdY90Qqziv/+LNjzzrOFYTePOa9agC+XKxFyktjQm
         EPVajn0YhB4+8A0SyvodES8eHLxiHvbGvifRzprvH0P47HeEzRDyQChwvmc/g0P04LHY
         WEqg==
X-Gm-Message-State: APjAAAV43tivx9hOjjQ8YJQ1NH29MVP7LydvwA6geS5Wqnbvby+NeIFB
        g0DQflpE8BwHuf+S+iHMIrWzbLg=
X-Google-Smtp-Source: APXvYqyXP65Nz9zaHaZk148ttbC2NvwuE+K2RDevNtaBL+faMyDiMYmBW9qIEqPRu2uHBQ6qq8iWfA==
X-Received: by 2002:aca:498e:: with SMTP id w136mr146134oia.103.1576518986288;
        Mon, 16 Dec 2019 09:56:26 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k5sm6960322oif.24.2019.12.16.09.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 09:56:25 -0800 (PST)
Date:   Mon, 16 Dec 2019 11:56:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v3 3/6] media: dt-bindings: Add bindings for i.MX8QXP/QM
 JPEG driver
Message-ID: <20191216175624.GA24066@bogus>
References: <1576238781-5911-1-git-send-email-mirela.rabulea@nxp.com>
 <1576238781-5911-4-git-send-email-mirela.rabulea@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576238781-5911-4-git-send-email-mirela.rabulea@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Dec 2019 14:06:18 +0200, Mirela Rabulea wrote:
> Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../devicetree/bindings/media/imx8-jpeg.yaml       | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
