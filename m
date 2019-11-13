Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C225FA7A4
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 04:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfKMDzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 22:55:15 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45262 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKMDzP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 22:55:15 -0500
Received: by mail-oi1-f196.google.com with SMTP id 14so498890oir.12;
        Tue, 12 Nov 2019 19:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5kWuAnb+93D0REhXXytiBbTkzGvCtPsyT0rZx99YMZ4=;
        b=ZUoD3ENKGIAuMDoaGYEPJVn3++GGVj+jKmiJQdd7A1/iLJ5nlg+cVXJRG1j+K3B5oC
         5tWsRLt9h8OjEWnIiXM7eUWyTIuZwn0M8c58n9071ITCG1moKimwmzv42IdLDFQysPLK
         Fwx2BCld02QuWb+6BdXpFPqom5b48ElgVwdVYwnHIWrN4eyOLG+XWceUvhKvXkHWgMW+
         kXL60zhQHXbgmO3qkEETwx+qiKQVAFQOG2E7rCh7K3cDIQnSxRW+SGnJob+2ZpykVNuC
         wVT34NbO81539dBlbojnass+ngMBs9S9sx6l90LCWnPse6/J+bF9RjIfC9sojNrn7DHj
         Ljlw==
X-Gm-Message-State: APjAAAVV/kDFdmZZSVnRA1PLcZHg+2pXTLhi6hEOjbitednm9S75e6I+
        eiH4Hndmsbin+YJclrEhUw==
X-Google-Smtp-Source: APXvYqyhJ1i62xhTcrOaW8+Kr9g2RTxmHxUPGU56kpS88cTpyKfeDTpdQD6oVX2chc9xP27sjFYMvA==
X-Received: by 2002:aca:48cb:: with SMTP id v194mr534349oia.156.1573617313969;
        Tue, 12 Nov 2019 19:55:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l40sm349562ota.24.2019.11.12.19.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 19:55:13 -0800 (PST)
Date:   Tue, 12 Nov 2019 21:55:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>
Cc:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH 3/5] media: dt-bindings: Add bindings for i.MX8QXP/QM
 JPEG driver
Message-ID: <20191113035512.GA7965@bogus>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
 <1573053633-21437-4-git-send-email-mirela.rabulea@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573053633-21437-4-git-send-email-mirela.rabulea@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed,  6 Nov 2019 17:20:31 +0200, Mirela Rabulea wrote:
> Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../devicetree/bindings/media/imx8-jpeg.yaml       | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
