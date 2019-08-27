Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D229F263
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 20:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbfH0Sda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 14:33:30 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36759 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730424AbfH0Sda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 14:33:30 -0400
Received: by mail-ot1-f67.google.com with SMTP id k18so145775otr.3;
        Tue, 27 Aug 2019 11:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rauxVeX6XXUN6kRfoUwD+dQyTpVuWd2Mc2ch5ZLcNlg=;
        b=UnSJnHYx/lx4/NxtSiOYIHZJGmWyy0mc+ECKiF4reFBaNknezTVeeTE+uVPVTAthNh
         GKIcfOS/rQn/QHXJXqmoYngve20bR06/0QZs0PIksSTYt/XxEtdJ8b7Y3ER3daszYMZ5
         hoB9OtakgPf43p7TjlIpXS/XX0m1XdDP2p5MEyImz5z3W+qky25KUindIULBKnJBCCJZ
         xk6PtHGlJAI7fnBdqA3In+Uhe/owbwM7Hp4+lJgMIJ8ykmJdHxVsBBaUH9/KvSN+tjJO
         vTjzIbrOLBswPVGT2JRdJxq6jm1EqfuB1pxpURs/iYbHxMYfsKidezFNJB/2rTD2xIFn
         mZrQ==
X-Gm-Message-State: APjAAAUXLfRz1Jfhx10JzSWia0XJgMisO1BRsEeHxkIRYwLZ7hpjVqYF
        VQk7WMFe+4eNvU3vrLzAe7YqgeyA5g==
X-Google-Smtp-Source: APXvYqyiZjF/APCriiZUIRoNzTjoS7oq65RNpcauJCJcm5uyW8yJ2ZvltaFCn93zN1Sc5JRUZVuoEA==
X-Received: by 2002:a9d:6c1a:: with SMTP id f26mr21543920otq.83.1566930809307;
        Tue, 27 Aug 2019 11:33:29 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v24sm33429otj.78.2019.08.27.11.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 11:33:28 -0700 (PDT)
Date:   Tue, 27 Aug 2019 13:33:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v9 01/13] dt-bindings: connector: analog: add sdtv
 standards property
Message-ID: <20190827183327.GA24030@bogus>
References: <20190822080556.17109-1-m.felsch@pengutronix.de>
 <20190822080556.17109-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822080556.17109-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 22 Aug 2019 10:05:44 +0200, Marco Felsch wrote:
> Some connectors no matter if in- or output supports only a limited
> range of sdtv standards. It doesn't matter if the hardware behind that
> connector supports more than the listed formats since the users are
> restriced by a label e.g. to plug only a camera into this connector
> which uses the PAL format.
> 
> This patch adds the capability to describe such limitation within the
> firmware. There are no format restrictions if the property isn't
> present, so it's completely backward compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v8:
> Hi Rob,
> 
> I dropped your r b tag becuase of the changes I made in this version.
> Please can you have look on it again? Luckily this would be the last
> time ;-)
> 
> - move definition to include/dt-bindings/display
> - rename tvnorms.h to sdtv-standards.h
> - TVORMS_* -> SDTV_STD_*
> - add sync comments
> - adapt commit message
> - fix bindings documentation
> 
> v7:
> I kept Robs r b tag because I only changed the example and extended
> TVNORM_* macros.
> 
> - fix some style issues
> - add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50
> 
> v6:
> - tvnorms.h: use tabs instead of spaces
> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> ---
>  .../display/connector/analog-tv-connector.txt |  6 ++
>  include/dt-bindings/display/sdtv-standards.h  | 76 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  4 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 include/dt-bindings/display/sdtv-standards.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
