Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D66A1E6FBB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 00:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437458AbgE1Wz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 18:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437455AbgE1WzX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 18:55:23 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A258C08C5C6
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 15:55:23 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id u17so212760ybi.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94grXSLlKz8pt9Y0CHgxlWm5jQqtItEcnxP1GZOMo0Y=;
        b=nZ//AuWi6emFoMvlpgZ2523d/5KVjGEwQU0zLwnXPLqGYbQkyGyGihPS3pEL0kTBOR
         +7LAvogyO+1aMWyYOH/0CMMeAuN+6TF6HDQj4/FZOsZHR0OugIOemMNUiQhCkj8mONP1
         z0bkDBFCqQ9m+UQoQjvRBbbdsF79kjdkJaPfw3lILiowMeazXOckTlEax3r9a4AQDDRH
         IR0PfzU4mxf5+853e3n+ASqudDF1uQ3vcx1AZ/g1mHJHCrnOh6rj2XTy9R2We31zzKH7
         ROc05j59mxGEMpvrmyLn83UAErvunVxien7bYi68tWe7498ciEMKzxiqIm+YXy4uL/fC
         Vl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94grXSLlKz8pt9Y0CHgxlWm5jQqtItEcnxP1GZOMo0Y=;
        b=mh38h7S2UmjJO6/FtcPRTevg/EmzM7BjDHJoy9QeAMclaGXi8rpSPlJzySFZe0baDK
         dWZ8ydXMLd8Y2WynAXT8BRyuVBJ64NMIbwdiDkKOjKX2rRTIIVMn48AUQiOXbPImspM/
         wLZUEcwBnJJ+F14g+KUvYOmM6eg4jkVbl8g2kjig2QIUMxAykwyddt6vFuljVOLuQf3d
         laQeQxoIvd+ujEpjRfORoo22ZuaT+hN1MHxALFIZI9rj7Hpb0I6olsM/h4loCg6yeUBI
         0xeQa0s8KinLKuU1bhasAtfwYFgPP2s3l0zDNQEqaL5EGqdsACtbGCDnV+e7J6ptOZzo
         H1xA==
X-Gm-Message-State: AOAM530YjbtRZNftNP+DDdCHS0jHC1Ah0Epl+0+F8r6nfifYdvRH2RqN
        NozS4LAP1eHdLyHHWovlK0e7oXUDxa+zuedMUEeXefkt
X-Google-Smtp-Source: ABdhPJxVczRAAaGyfbjE3IbRMi+VMRiTSvNSq0RMNxiI7vs2fJbAppPLAdzMqbFICxJQrUWEOOeJsyvXMb1DypuA2Dc=
X-Received: by 2002:a25:38cb:: with SMTP id f194mr8941327yba.250.1590706522197;
 Thu, 28 May 2020 15:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200515025159.101081-1-jnchase@google.com> <20200515025159.101081-3-jnchase@google.com>
 <fe268ad4-1a46-b6de-54e1-c9e6731a96d3@xs4all.nl>
In-Reply-To: <fe268ad4-1a46-b6de-54e1-c9e6731a96d3@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Thu, 28 May 2020 18:55:10 -0400
Message-ID: <CALTkaQ1pyAB1JVtifa75RuyTQCeNDTObZH+BvdFQVhLLhAeosg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > +
> > +/* This device is always enabled */
> > +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
> > +{
>
> I'd disable the interrupt here if enable is false.

Ok I can do that.

>
> There is a power down mode as well, so perhaps that's something that can be
> done here too.
>

I think I'd prefer to use power down mode in a potential follow up
patch that adds PM to the driver.

> > +     return 0;
> > +}
> > +
> > +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
> > +{
> > +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> > +     int ret;
> > +
> > +     mutex_lock(&ch7322->mutex);
> > +     ret = regmap_update_bits(ch7322->regmap, CH7322_ADDLW,
> > +                              CH7322_ADDLW_MASK, log_addr << 4);
> > +     mutex_unlock(&ch7322->mutex);
>
> If log_addr is CEC_LOG_ADDR_INVALID, then that means that the current
> logical address configuration is to be cleared. In this case the logical
> address is set to 0xf (unregistered/broadcast). That should mean that the
> CEC device will not Ack any logical addresses, correct?

Correct.

>
> But it does receive broadcast messages and (I think) also messages from
> other logical addresses, except that those will not be Acked by this
> CEC adapter.
>

I was wrong about this before. It does not pass on messages from other LAs.

> If it still receives messages from other LAs, then that means that you can
> add the CEC_CAP_MONITOR_ALL capability. I.e., 'sudo cec-ctl -M' without
> configuring anything should see all CEC traffic.
>
> What is the default value of CH7322_ADDLW? It should start with 0xf as
> the logical address (i.e. no received messages should be Acked).

The default value is 0xf.

Thanks,
Jeff
