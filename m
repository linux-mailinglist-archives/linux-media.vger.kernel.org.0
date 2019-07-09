Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBC762DBB
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 03:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfGIBwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 21:52:50 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37417 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfGIBwt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 21:52:49 -0400
Received: by mail-io1-f67.google.com with SMTP id q22so17909311iog.4;
        Mon, 08 Jul 2019 18:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=s4iT/C+ZTI6lS8Y15mNcXYBDPJVtxfB5rOYQ4KRci6s=;
        b=jmVtikgOUC3rVx81wGXpn3jD4H3PkheB3VQFWX8kYKj61ZEJw9OEScZ6epQ4OoFs4G
         IdVnvf976dnGa3E1kx77Wj7t7TzfSdcmVePaNMmHx9zz1ANK6l+X7kfN4DznTvOv6ua2
         8zASkPHJchAEly+l4LYajlRjIOALH7O/s+BAVBBQe3/3HX3B4lFyIxOG99Kiw7E4rvA7
         XsxjTVE/SPPzO5yq7NCOWuRXHypd5lkTaaz0w7OIPB7JaNLf5uu1Aa2BN+uN2cCWxyPW
         6/qYsFVXk6u/klJaOB1SxSya5xXRaYISEFnNB8yxklcMUGqoxQ0G/HnwgyM5981UU+1y
         8VCg==
X-Gm-Message-State: APjAAAWFxM5HRoxkxC3Ghf7RjHne66uEQMs6+x7q9NU4uYlqD7os3Bal
        eGtPb1yqiqrXjkC3Y9cWgg==
X-Google-Smtp-Source: APXvYqxAB1vUvIqVP37afapbU1uZ0daFlx54UYQyhhrcCjs15oV7Bjsh/pZuPcpplBZBcFsuEEQPHw==
X-Received: by 2002:a02:cd83:: with SMTP id l3mr24635684jap.66.1562637168778;
        Mon, 08 Jul 2019 18:52:48 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w23sm34368748ioa.51.2019.07.08.18.52.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:52:48 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:52:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH v2 3/3] media: dt-bindings: imx7-csi: add i.MX6UL/L
 support
Message-ID: <20190709015247.GA25557@bogus>
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
 <20190606153825.8183-3-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190606153825.8183-3-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  6 Jun 2019 17:38:25 +0200, =?UTF-8?q?S=C3=A9bastien=20Szymanski?=          wrote:
> Document "fsl,imx6ul-csi" entry.
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> 
> Changes for v2:
>  - New patch to document new "fsl,imx6ul-csi" entry.
> 
>  Documentation/devicetree/bindings/media/imx7-csi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
