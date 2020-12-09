Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027392D4B74
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 21:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388338AbgLIURO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 15:17:14 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36233 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388153AbgLIURM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 15:17:12 -0500
Received: by mail-ot1-f67.google.com with SMTP id y24so2671058otk.3;
        Wed, 09 Dec 2020 12:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yJ0cLVJ9JZWAX/u5ei/QDKQAaWgfJGyvsFy8ualYnwU=;
        b=NdKbNGwqnex1+qYS8+MNyqp3MkCPNwqkPFEXFTVu5NEQwKvakIkBBe1RVYb4r7BqaI
         kEH3TfbUI8XbTHthDNbqgPK791OUUgFfSzS9m7kbwQB0EO6kZrpQq43hDpCXbqss+DQ9
         GtwMfDaNYRUNFRfmfjpaJJAcTmJU/xXDfztBRdIEYIlaBjAcN25076UYHZmQGFZ7ogwU
         FOaw09IUUDCwDXb6tyKzvX4Egn4mR2Zy/ITMMJOA79Y7tvWvKMZldal1VWFUKf7ooneg
         FHIb/7eotq+ab/ZUkMvVTmLYP25XHK08aWK11gIINtRlLYuKxh+AjdhRBskzyUUFgOmv
         PhNQ==
X-Gm-Message-State: AOAM533EA5aK1VqlFWp39olK+QwYT2P5ySWosfP9Kgi8Dsw+Eh4BcHO0
        BkpK/qC6FmvDWvF1Damzug==
X-Google-Smtp-Source: ABdhPJx9rg4S9SKFMqhGaVyhX9VYxBilXD9MFn18yIlS78OrPPfQMeGUJXPTxK8TINhTQOpRdculbw==
X-Received: by 2002:a9d:6642:: with SMTP id q2mr3259001otm.172.1607544989970;
        Wed, 09 Dec 2020 12:16:29 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n3sm595526otj.46.2020.12.09.12.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 12:16:28 -0800 (PST)
Received: (nullmailer pid 868717 invoked by uid 1000);
        Wed, 09 Dec 2020 20:16:27 -0000
Date:   Wed, 9 Dec 2020 14:16:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, bparrot@ti.com, hverkuil@xs4all.nl,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, sakari.ailus@iki.fi,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/13] dt-bindings: tegra: Update csi data-lanes to
 maximum 8 lanes
Message-ID: <20201209201627.GA868687@robh.at.kernel.org>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
 <1607022002-26575-12-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607022002-26575-12-git-send-email-skomatineni@nvidia.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 03 Dec 2020 11:00:00 -0800, Sowjanya Komatineni wrote:
> Tegra VI/CSI hardware don't have native 8 lane CSI RX port.
> 
> But x8 capture can be supported by using consecutive x4 ports
> simultaneously with HDMI-to-CSI bridges where source image is split
> on to two x4 ports.
> 
> This patch updates dt-bindings for csi endpoint data-lane property
> with maximum of 8 lanes.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
