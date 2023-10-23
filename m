Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D687D2A56
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 08:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjJWGXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 02:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjJWGX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 02:23:29 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF465DF
        for <linux-media@vger.kernel.org>; Sun, 22 Oct 2023 23:23:27 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso4333875a12.1
        for <linux-media@vger.kernel.org>; Sun, 22 Oct 2023 23:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698042206; x=1698647006; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P60DCw6Gby1A2dVCu2O1xJbC1xMjzbh0BeBp297e9m4=;
        b=PMgpTHZ3XeNz9s7ElgUIvMGlOnJsITdj+BCqebxk52PeEunZvQ9yA3RWv7VC2PwOKy
         +j4wz7bA9Q+CXyLPNkdmod0Uo161mjbSQDrUq0Z078P53B9uG/QE24EMEr+K+lqBjB2f
         pq21P3q7AmQnpsI7gVBTFuj1A50oQpZGh6aQJY1DrBI8PmviddXdzNdbdGb9UQ1E7gfN
         vdq414Emp1XLcjj8qQFnSnVHQbTYvClZHkYUCPzxtzl3m4BH2R56SLuKUdAhzSHY981l
         xHcAZJdw4/G3lX+MkvH3145iwiw+c5yK9qzS6N/OzVw36GN6ouYPTOjYB5gJpHLns/wL
         ft4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698042206; x=1698647006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P60DCw6Gby1A2dVCu2O1xJbC1xMjzbh0BeBp297e9m4=;
        b=hegQ7U6HzEChc6ix/XDYGyCL4yoMkwU7YeyTGX3KgpsygDJW+xZdaIciCYeYkWuwfl
         EtKW/DhuljRLFx+wXDb7pobRZNpqZTFL3rZneV6u6cIBW20bTIKXLneqdU9Xo4zSCOuR
         48wS7a3Ip0UW0nMSEG+cQXaeqIX3LTsXpPcrbkS9iOG4NNamPJSl/TJYwiDbfwYh3rNH
         SWUaGVQ22Lw+eeyiK+5HWAn0nf1r5pacp5UudAgVO6ZLjoXzrWnuci7r1f/7ZY2YSZme
         shg9ioxrEX8FIcsY89qJ/MWOggMwqm7bWRsxkkyV6KOJcooNa2JZzB26wz8Ws2Nst5Ug
         BeOA==
X-Gm-Message-State: AOJu0YxKrgvCpG3+LB+tcKTuZSUHZJVB7wGDZ/kITvRSH/ctG3GwcmiB
        XWAo3CHj+14aBwmu9+JHbYg=
X-Google-Smtp-Source: AGHT+IEIDeXm6QmqmyJ1bJgjxopFF/CH1SpJmtoPdQpYHpErmCvZAmkW66Uijc7Ns3H7tr7zOFtR3w==
X-Received: by 2002:a05:6402:4404:b0:51d:f5bd:5a88 with SMTP id y4-20020a056402440400b0051df5bd5a88mr6348811eda.38.1698042206022;
        Sun, 22 Oct 2023 23:23:26 -0700 (PDT)
Received: from [172.16.34.34] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id h28-20020a50cddc000000b0053e589016a7sm5848358edj.16.2023.10.22.23.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:23:25 -0700 (PDT)
Message-ID: <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, claus.stovgaard@gmail.com
Date:   Mon, 23 Oct 2023 08:23:23 +0200
In-Reply-To: <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <20230727071558.1148653-11-bingbu.cao@intel.com>
         <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
         <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
         <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
         <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, 2023-10-20 at 16:39 +0200, Hans de Goede wrote:
> Hi,
>=20
> On 10/20/23 12:47, Andreas Helbech Kleist wrote:
> > I've only tried it on my WIP IPU4 hack of this driver
>=20
> Oh a IPU4 version of this driver would be very interesting,
> I was actually thinking about looking into this myself
> because I have a Chuwi Hi13 tablet which uses the IPU4 and
> it would be nice to get the camera working there (and on
> other IPU4 using devices).
>=20
> Can you give some more info on your IPU4 work, e.g. :
>=20
> 1. Does it work?

Not yet. The intel-ipu4 module is working to the extent I'm able to
test it without the isys-module. Buttress authentication succeeds, and
I have very similar mmiotraces between the new driver and the old 4.19
based driver I'm comparing it to.

The isys-module is very much work in progress. I'm learning the v4l2=20
along the way, so there is a steep learning curve.

> 2. Which sensor are you using it with ?

A custom tc358748 driver that pretends to be a sensor that delivers RGB
data. I tried with the tc358746 driver in-tree, but figured it would be
simpler to start out with a custom driver, since we have an old driver
that has a list of the exact register writes needed to setup the
device.

> 3. Which device are you testing on ?

An endoscopic system from Ambu A/S (the company I work for). See my
colleague Claus' description of the device here:
https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015f.camel@=
gmail.com/

> 4. Do you have a public git branch with this somewhere ?

Not yet, but I will share when I have something working. I could push
the main driver part if anyone is interested. The isys driver is not
worth sharing yet.

> I'm afraid that I won't have time to look into this
> myself anytime soon, but I'm very interested in this.

It would be great to have somebody else testing this out when I get a
bit further.

>=20
> > but I think it
> > is correct for IPU6 as well. The reason is that isys_driver is an
> > auxiliary_driver, so I don't think=C2=A0
> >=20
> > =C2=A0=C2=A0=C2=A0 MODULE_DEVICE_TABLE(pci, isys_pci_tbl);
> >=20
> > has any effect. The PCI probe happens in ipu6_pci_probe in ipu6.c
> > (because it has a pci_device_id table as well), and the isys_driver
> > is
> > probed indirectly by ipu6-bus.c.
>=20
> So the MODULE_DEVICE_TABLE(pci, isys_pci_tbl) indeed does not
> belong in this auxbus driver, instead it should use some sort
> of auxbus MODULE_DEVICE_TABLE() to autoload based on its
> auxbus modalias.
>=20
> But it does have an effect, modprobe will load both the main
> ipu6 driver registering the aux devices as well as this driver
> based on the modalias of the PCI device because with this
> MODULE_DEVICE_TABLE(pci, isys_pci_tbl); statement both drivers
> match that PCI modalias.

All right. But since the main driver contains the same table, I don't
think there's any need to have it here?

> But the correct thing to do here would be to switch to
> an auxbus based MODULE_DEVICE_TABLE() for the isys driver.

The isys_driver already has an auxiliary_device_id table. I'm not sure
if that's what you mean?

From the bottom of ipu6-isys.c in PATCH 10/15:

+static const struct auxiliary_device_id ipu6_isys_id_table[] =3D {
+	{
+		.name =3D "intel_ipu6.isys",
+		.driver_data =3D (kernel_ulong_t)&ipu6_isys_auxdrv_data,
+	},
+};
+
+static struct auxiliary_driver isys_driver =3D {
+	.name =3D IPU6_ISYS_NAME,
+	.probe =3D isys_probe,
+	.remove =3D isys_remove,
+	.id_table =3D ipu6_isys_id_table,
+	.driver =3D {
+		.pm =3D &isys_pm_ops,
+	},
+};
+
+module_auxiliary_driver(isys_driver);
>=20

> Regards,
>=20
> Hans
>=20
>=20
>=20
>=20

