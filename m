Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0E344A47
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 20:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfFMSHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 14:07:06 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43632 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfFMSHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 14:07:06 -0400
Received: by mail-qt1-f195.google.com with SMTP id z24so10403692qtj.10;
        Thu, 13 Jun 2019 11:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uJe8I8sTo6Wr3xUA8HaLUhp6Xh2YuZHCokF4ZHF76zg=;
        b=DuemzGjRlKI744kbvrh6vaRQ337rkQzScCVdAK+yCWFe7OL191JvK7e0k23uXim6bf
         5NRpgb4T8yLnkQk7iXU0PwOKkVEUoL8oPP2b5dEA1g/+Cs+XWabeLoKVkQ9JcpJ7q1oT
         q6mpG/+6sSt/ubUjPXbXWS+5KC/DZ1rwVY/wK/jPi0QuyWVI64gRYCt5Qj0cpsXhebtr
         4IpRCML351pBECL4hkZipgpGK2Mn8jySH6A7HOveMTcW6YeuyKk3OG2DtcacpeuXIzPD
         ZOnbHe2cvfqDGnAia4ziFlVA5wn0IFoPQgBWoAPvT6U0CSm6rDrBceFZLQua4OsEcfy6
         P+bg==
X-Gm-Message-State: APjAAAU2LyYjiUz6rb7i3Wn226s+kq+P2NZO8i9VfGkdCUPf9LSs/aF2
        mRRslHfImX41VXmHTDIm8A==
X-Google-Smtp-Source: APXvYqyO+OUa9HVTaBjWtOfGsobWt9n1ovanms1shUpwuONVcUrxOzNlXAQ6/MruhodSsyvGKCM2vg==
X-Received: by 2002:ac8:66d8:: with SMTP id m24mr76314466qtp.355.1560449225550;
        Thu, 13 Jun 2019 11:07:05 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id k55sm277423qtf.68.2019.06.13.11.07.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 11:07:04 -0700 (PDT)
Date:   Thu, 13 Jun 2019 12:07:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, rui.silva@linaro.org,
        slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com,
        otavio@ossystems.com.br, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI
 clock
Message-ID: <20190613180703.GA2190@bogus>
References: <20190504144027.31920-1-festevam@gmail.com>
 <20190504144027.31920-6-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190504144027.31920-6-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat,  4 May 2019 11:40:25 -0300, Fabio Estevam wrote:
> As per the i.MX7D Reference Manual only the MCLK is used for
> the CSI block, so only document this single clock.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
