Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081C5293B84
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405994AbgJTM02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:26:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41099 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394284AbgJTM01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:26:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id s9so1890216wro.8;
        Tue, 20 Oct 2020 05:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m0pVRuj0M2nZqf8Wm9BAPNQzfIxN4rcRXkQ0qVAU77o=;
        b=IEJLK8hy1linB/zxPHF1uvATyPzxLqSEuLRDYQ+h5sUkXYTo7FFc9s2ip3jLIBywET
         jcHqtywwYZDIqXp4J2JZnXL8lETsZLcaRjhm3G4SjdS5a5puvx7gnRsqrhFA8j9BNOr8
         zxQOhtd5GsFR12MEkXiTz86Xs5FEc8YluinSC1MqUADylZlbMEiaDe1CzTVVodE1GP0W
         g6cQTwCCe4sJUGdV1G8oAcJwkSUTAeNjuz3VpngtcYnsrgNDT3vQ5xQBhvV9VrmCDyIP
         n3AOTqeTkqnMNbdNkSlEo6nT6bxNgJFZmqnTtX+C1xzBt5Pd+RPHQrTZ04/okDE28TdU
         3oQg==
X-Gm-Message-State: AOAM533yTkoAsLLymcntVupu7Dac0em/U/VzEzeQWVHKwke71G2Nn19V
        oXsM56j9U5ouCgnKa7se8Kc=
X-Google-Smtp-Source: ABdhPJzJ4IfSkdpsol8AyRt80yXAXWp/BGDLmqEcL3uejEZmveMHiGjUKxbbGboz4mTyukzsYyU83Q==
X-Received: by 2002:adf:bb43:: with SMTP id x3mr3235381wrg.250.1603196785071;
        Tue, 20 Oct 2020 05:26:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id 67sm2492253wmb.31.2020.10.20.05.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:26:23 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:26:21 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20201020122621.GA126891@kozik-lap>
References: <20201019170247.92002-1-krzk@kernel.org>
 <20201020103833.GT13341@paasikivi.fi.intel.com>
 <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
 <20201020120058.GU13341@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020120058.GU13341@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 03:00:58PM +0300, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Tue, Oct 20, 2020 at 12:54:09PM +0200, Krzysztof Kozlowski wrote:
> > On Tue, 20 Oct 2020 at 12:38, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Krzysztof,
> > >
> > > On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
> > > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > > driver, are quite limited, e.g. do not support regulator supplies.
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > >
> > > > ---
> > > >
> > > > Changes since v4:
> > > > 1. Add clock-lanes,
> > > > 2. Add Rob's review,
> > > > 3. Add one more example and extend existing one,
> > > > 4. Add common clock properties (assigned-*).
> > >
> > > Using the assigned-* clock properties may be workable for this driver at
> > > the moment. But using these properties does not guarantee the external
> > > clock frequency intended to be used on the hardware.
> > 
> > It guarantees it. The clock frequency will be as expected (except if
> > someone misconfigures the DTS).
> 
> Is that guaranteed?
> 
> I'm not saying no to the approach, but if we change how camera sensor DT
> bindings are defined, I'd prefer an informed decision is made on the
> matter.
> 
> > 
> > > Using other
> > > frequencies *is not* expected to work. That applies to this driver as well.
> > 
> > This is the binding which is HW description. According to HW datasheet
> > other frequencies from described range are accepted and expected to
> > work.
> 
> As per datasheet, yes, different external clock frequencies can be used.
> But the link frequency is still not independent of the external clock
> frequency.
> 
> The properties of the sensor's PLL tree determines what can be achieved
> given a certain external clock frequency. So picking a wrong external clock
> frequency quite possibly means that none of the designated link frequencies
> are available, rendering the sensor inoperable.

The driver then controls the HW and knows exactly what is needed. If
link frequency (which has its own DT property) requires some clock
frequency, the driver will configure the clock to that value. The same
going other direction. Driver has the knowledge about both its input
clock and link frequency, therefore it can make the best decision.

If someone configures DT or the driver to wrong frequencies (making the
link frequencies not available), the solution is not to add more
properties. It would be a band aid. The solution is to configure it
correctly.

> 
> > 
> > > This, instead of the clock-frequency property, effectively removes the
> > > ability to set the correct frequency from the driver, at least with current
> > > set of the used APIs.
> > 
> > It seems you confuse DT bindings with some specific driver
> > implementation. Bindings do not describe the driver behavior but the
> > HW. The ability to set the correct frequency from the driver is not
> > removed. It was never part of the bindings and never should. It is
> > part of the driver.
> > 
> > >
> > > I suppose you could add a function to set the assigned clock frequency and
> > > keep it, just as clk_set_rate_exclusive does?

I did not reply to this comment, so let me know. Of course, one could
add such functions. It's not a job for DT bindings, though.

> > >
> > > Cc the common clock framework list + maintainers.
> > 
> > The bindings have Rob review which is the DT maintainer. His
> > ack/review is needed for the bindings to be accepted. What more do you
> > need? Shall I point to submitting-bindings document?
> > 
> > I am really tired of discussing this. You raise some concerns about
> > driver behavior in the wrong context - in the patch for device tree
> > bindings. You use the arguments about the driver while we talk about
> > bindings. This is clearly not correct. I am all the time repeating
> > myself - the bindings describe the hardware, not the driver.
> 
> My concerns are not related to the current driver implementation nor the
> driver patches in this set.

Yet you refer to driver related tasks (configuring provided clock) while
discussing the bindings.

Best regards,
Krzysztof

