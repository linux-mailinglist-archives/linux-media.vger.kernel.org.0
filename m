Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE39D1987E6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 01:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgC3XP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 19:15:59 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36792 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3XP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 19:15:59 -0400
Received: by mail-io1-f68.google.com with SMTP id n10so5677516iom.3;
        Mon, 30 Mar 2020 16:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MzTiIR9WIdGk4sSFyoVRaphe8GsQGc2l1TSUK2PTluM=;
        b=Wu2v6j9uYLsdEWaLKPPo51gZD3vTE8+XVourSfvEPRPAJBJvPCivpvEH0fNZFYD7Mi
         5U3G+Yxeby39SyxLLrNGo79HPMNYsveuefN2mS4kAUSVrpAz3OoWgnSfYZSV0G97i2Nn
         oMlAq5bZNgzCXbXlMs4qxkH/4/OGKyqox1YGVu/X/JP4A0e33Qya37nuIAyXj7vOgHvz
         daQhtoqJ+aJ/o8bxFAlma7VELKI9zyR2DfuPIYJyu6uXLiswPLUzlIGtlID/MLPnrLNx
         Zvbv/LMfV1g8gTFNrrU6ebwIIB0QpWB5ExOB8yf4+sBTnv75q+nVz2N/XfrMC10Fl5DX
         O2mw==
X-Gm-Message-State: ANhLgQ1MlBxecW/5uutPRHsJ1cqqmP2ckz9zYm7Z412mShniF7BarPB0
        9B9x2ku9B4ECcq7Mo5DvpA==
X-Google-Smtp-Source: ADFU+vt9bzeSBDXZlx6pjw+tK/wi5g5Qw+8DG1MTXxR4RKIA4KRk2Ttwqfq05dNY7X2wF9Y9Ih/Veg==
X-Received: by 2002:a02:c605:: with SMTP id i5mr1593116jan.26.1585610158133;
        Mon, 30 Mar 2020 16:15:58 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q17sm5442226ilk.48.2020.03.30.16.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:15:57 -0700 (PDT)
Received: (nullmailer pid 9828 invoked by uid 1000);
        Mon, 30 Mar 2020 23:15:56 -0000
Date:   Mon, 30 Mar 2020 17:15:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 1/5] media: dt-bindings: media: i2c: Deprecate usage
 of the clock-frequency property
Message-ID: <20200330231556.GA5102@bogus>
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584620363-2255-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584620363-2255-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 12:19:19PM +0000, Lad Prabhakar wrote:
> Deprecate usage of the clock-frequency property. The preferred method to
> set clock rates is to use assigned-clock-rates.

Somewhere here and in the subject you should have 'ov5645'. Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
