Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3CD15D413
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 09:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgBNIue (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 03:50:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34042 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgBNIue (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 03:50:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id n10so8002196wrm.1
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 00:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A6xeUrXm1OhLGAgimATAzYN20NBFKdzun4Zz1nb3AkM=;
        b=e6/b5raPmsYmH+sG4k9oyvszzsCKHKz+9hiecTQBbw9pKZqKmvGi9jkkFFkrPnJ/aV
         m6o7NwHNdgzR9pivkXwkpov95hTtUd2w0YfgMJzJYcBLZlHgHzPB7yg2iIOlMVZWxh7D
         RxA6GfOa2EUstJUWllnBM83ETS3mKFv367lM3ReUyFX5UIl0SbrEnlMgiOrkMY7Ja2FH
         wJJZQTn+Fb2HO2x4i2XUUqt1UsFUx3KxV0IjXrnWSePggJ//EgCXQIS85d6UcnLVDq0C
         C34P31snpNGzv5iJqcwretU9vUOC11jvQWpgqPHrHyTtNZfR/Rsa1BacJ2uIeS21WS5J
         hwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A6xeUrXm1OhLGAgimATAzYN20NBFKdzun4Zz1nb3AkM=;
        b=rUSgAlCXsoP2w3le4OtJIDhYEurPBqSP/DkKHSeOpjSHPn477T6b3oXEY3reaJyq1s
         0YXbXnS6Ml8LIwGW+nprRevBDlGew/+ZVAQAy3kbJXWht3VDhmY6H0fLfgDWIxDkSojm
         lX+PUv/hUuq6mImNRjltNgTvJU5V4/GixS09wR6FIMFz0pYEOwT1ISnHpg9ztHYYRzdu
         uAJ/3Z/xtmvynRuyv+9ynsyYdn2GxLjTHeV33oEQMfbYoWhg1hXjoq9BAQEDrODeHlgn
         HTyT5Qbu88JMuUh7nUsiOI6+U3At5Ftl9DeSPxvTjjF//xpOw+AWS0ihvVUVS323Mj57
         ORFg==
X-Gm-Message-State: APjAAAUtRYHFSSZdVee6ftHBH/ogHK1+RRcNrcQrroNSu+rfCW2uzgPQ
        Bty71530Nweqybs23fwsVJ0=
X-Google-Smtp-Source: APXvYqwB7/onwRR6DIWk95Is8nV6QKrlHOLlqIlen7jDqY6K2jYwsnRQwJBjF7iHzjA2mU41QUq1wQ==
X-Received: by 2002:a5d:514b:: with SMTP id u11mr2788105wrt.322.1581670232346;
        Fri, 14 Feb 2020 00:50:32 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id y8sm6171659wma.10.2020.02.14.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 00:50:31 -0800 (PST)
Date:   Fri, 14 Feb 2020 11:50:29 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add rc-videostrong-kii-pro
 keymap
Message-ID: <20200214085029.3rlokzmrlzl5ob7t@manjaro.localdomain>
References: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
 <20200213221513.28540-3-mohammad.rasim96@gmail.com>
 <ef0ce8b1-d229-8877-d039-ec2ff5b0a541@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef0ce8b1-d229-8877-d039-ec2ff5b0a541@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/02/14 09:41AM, Neil Armstrong wrote:
> Hi,
>
> On 13/02/2020 23:15, Mohammad Rasim wrote:
> > videostrong kii pro comes with a nec rc, add the keymap to the dts
> >
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > index 2f1f829450a2..6c9cc45fb417 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > @@ -76,3 +76,7 @@ eth_phy0: ethernet-phy@0 {
> >  		};
> >  	};
> >  };
> > +
> > +&ir {
> > +	linux,rc-map-name = "rc-videostrong-kii-pro";
>
> You should also update Documentation/devicetree/bindings/media/rc.yaml
>
fixed in v5.
> > +};
> > --
> > 2.25.0
> >
>
> Thanks,
> Neil
