Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E94637B3
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 16:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfGIOUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 10:20:04 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46824 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbfGIOUE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 10:20:04 -0400
Received: by mail-io1-f66.google.com with SMTP id i10so43429633iol.13;
        Tue, 09 Jul 2019 07:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f2rYhg/DnEqI7oO9ihLyCMIa+DmpfPhe6CmZvRfBjfY=;
        b=RFYT7bwKfCzsEl+RgjzSgVmE3xmwUf5TCseip+R+CHbyBHhnj0u6WwuYWran68UCOd
         S3g4OOuHGNSNQSJ/0bq3icUn8GuzJ5a3aNXyknWYNzFuGQaftIMXGSP8elwJNeGIxW6m
         mgIRkpzoL7Qq+wjfJqpbCHRAHZBhxC0qYp3a7YonYmTfJ2yB0zbhwhuZd6xGGf5hT4WM
         FMx8LH0WE2zKHNXEgfMtVXkx6n8MGhaG/Co3vZ656ILqrfOvG2YUOR01LX3J8jcroiev
         vsSms6eS/DgOyoWairWIHzEZDzdVLLhUBsUMmZ1SZTJj2J9rYoPRGrf6NKkJVmb0D4Ra
         VVgw==
X-Gm-Message-State: APjAAAVY1stULLF2AxOp5nBzCgV6jfqNO6xqrcmABVOI4QhORujg1nj+
        sCTfLg09okgvSdNHxgkwEQ==
X-Google-Smtp-Source: APXvYqw1WjCcN1aunVPm/TK1Ts7TfCgcpbAxxtxX/jK2MfStDyZ/tJCkQjlPTGKNQDZuFADZmjBdmQ==
X-Received: by 2002:a02:69d1:: with SMTP id e200mr28763177jac.138.1562682003125;
        Tue, 09 Jul 2019 07:20:03 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y20sm18421134iol.34.2019.07.09.07.20.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 07:20:02 -0700 (PDT)
Date:   Tue, 9 Jul 2019 08:20:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        nicolas.ferre@microchip.com, paulmck@linux.ibm.com,
        mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joao.Pinto@synopsys.com
Subject: Re: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Message-ID: <20190709142000.GA995@bogus>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
> RX mode.
> 
> Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> ---
> Changelog
> v3-v4
> - @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
>   it is really useful for me here. I removed all other the proprietary
>   properties except this one. Do you still think it must be removed?
> - Frequency units @Rob

Frequency units means append '-khz' to the property name. That also 
makes the 'frequency' part redundant, so maybe name it more around what 
the frequency is. The frequency for what?

Rob

> 
>  .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> new file mode 100644
> index 0000000..50603e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
> @@ -0,0 +1,29 @@
> +Synopsys DesignWare MIPI Rx D-PHY block details
> +
> +Description
> +-----------
> +
> +The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode.
> +Please refer to phy-bindings.txt for more information.
> +
> +Required properties:
> +- compatible		: Shall be "snps,dw-dphy-rx".
> +- #phy-cells		: Must be 1.
> +- bus-width		: Size of the test interface data bus (8 bits->8 or
> +			  12bits->12).
> +- snps,dphy-frequency	: Frequency at which D-PHY should start, configurable.
> +			  Check Synopsys databook. (-kHz)
> +- reg			: Test interface register. This correspondes to the
> +			  physical base address of the controller and size of
> +			  the device memory mapped registers; Check Synopsys
> +			  databook.
> +
> +Example:
> +
> +	mipi_dphy_rx1: dphy@d00003040 {
> +		compatible = "snps,dw-dphy-rx";
> +		#phy-cells = <1>;
> +		bus-width = <12>;
> +		snps,dphy-frequency = <300000>;
> +		reg = <0xd0003040 0x20>;
> +	};
> -- 
> 2.7.4
> 
