Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E3C78240F
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 08:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbjHUGzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 02:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbjHUGzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 02:55:14 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7442A9
        for <linux-media@vger.kernel.org>; Sun, 20 Aug 2023 23:55:12 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bf3f59905so389869666b.3
        for <linux-media@vger.kernel.org>; Sun, 20 Aug 2023 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692600911; x=1693205711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n0znqKZ0BIM+GS8ADupwpjgOORS1VVwFI7Nj18/67iw=;
        b=Sf08K3nrEo8RGte4P6EfxKP5Twd+7XRc8d/QMT4TArulSd+Zpt/QDguFkBFvdfHEnD
         xeTIlf/5RXrPg7FFF79A1xH8iiyg3x1mX8/nsROQDrVEN/nfvZMa7ml6QRtCIXXLqe9c
         8gUaw9D9WkfyPI3zCB8s8yLvoonz5AQok7lyfQNkYAcpOUT6nJq4Bt8VRlXfDpEPFSSH
         9kVwbSN66oNadite9nYHE7I31p8MrLACIcquUIXv4IOgpKMbmGn41HVDtQ27XwDoDxII
         4n/HtFTfQ0N6EEbcbtm3zbVOdPPSubo2wCBa3XTMV/m3EtCVE2iveyDoy5nDx8HshAO6
         v5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692600911; x=1693205711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0znqKZ0BIM+GS8ADupwpjgOORS1VVwFI7Nj18/67iw=;
        b=aIUAjB72Zoo95O4J33qlZ+SA+7wuuoLXcPY5IYLND05UeMxnj8xBfQV0aaAq7VEDLB
         XNGwecpmbq+ISg1I+pBPVuHu2K8fyquolc/HZA+8PAyBX5F6fT5D53hBxbAReJjxxwhi
         sG+d4c4uFeyJUwG5NLXa+KyMbZVrxR+3O9g/fraNOWzwo2Cv+8ZxGdZk1ClimrInD050
         C8TaG7t+O5sT5m0p7pusf7ug28lfaS3E9hQlHq+cMuUUV6TOUqvZnyJPsMliQsym2fzy
         xVznvaVJUrfLPUnAEQghoH9YpEeterLFWsdeSzKwkEnehb4/VseXzyQ9KrczxT2Rl/c9
         LVig==
X-Gm-Message-State: AOJu0Yy40ZtZjDoQdYP5XtiNwdTqsHjgf31CU/8uol1RfQcIiX09DNXt
        N7gdKskUllnTmc7y1ta7WuY=
X-Google-Smtp-Source: AGHT+IH0/qeHX+AziaF1stOkiL6JwUioe7YmrREQFeT680Qog9kgVm3cK8DMvCT/4VKUNH2IVKDYpA==
X-Received: by 2002:a17:907:a076:b0:99b:d2a9:9a01 with SMTP id ia22-20020a170907a07600b0099bd2a99a01mr4550413ejc.0.1692600910941;
        Sun, 20 Aug 2023 23:55:10 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id i22-20020a170906445600b009937dbabbdasm5954829ejp.217.2023.08.20.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:55:10 -0700 (PDT)
Message-ID: <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Mon, 21 Aug 2023 08:55:08 +0200
In-Reply-To: <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
         <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
         <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
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

Bingbu

On Mon, 2023-08-21 at 14:22 +0800, Bingbu Cao wrote:
>=20
> Claus,
>=20
>=20
> On 8/21/23 11:14 AM, Bingbu Cao wrote:
> > Hi, Claus,
> >=20
> > Thanks for your mail.
> >=20
> > On 8/20/23 11:09 PM, Claus Stovgaard wrote:
> > > On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com=C2=A0wrote:
> > > > From: Bingbu Cao <bingbu.cao@intel.com>
> > > >=20
> > > > This patch series adds a driver for Intel IPU6 input system.
> > > > IPU6 is the sixth generation of Imaging Processing Unit, it is
> > > > a PCI
> > > > device which can be found in some Intel Client Platforms. User
> > > > can
> > > > use
> > > > IPU6 to capture images from MIPI camera sensors.
> > > >=20
> > > >=20
> > >=20
> > > Hello Bingbu.
> > >=20
> > > ...=09
> > >=20
> > > Will continue investigating, but I would like any input in
> > > getting the
> > > driver up an running and testing on this Dell laptop. I think it
> > > should
> > > be very close to working.
> >=20
> > Do you any failure log for ov01a10?
> >=20
> > For Dell XPS 9320, the camera sensor module has a dependency on
> > Intel
> > IVSC driver, so please make sure you have the latest ivsc driver.
> > I remember they are already in media tree.
> >=20
> > I will check again with latest IVSC driver, feel free to mail me or
> > Wentong Wu meanwhile if you have any problems for camera sensor and
> > IVSC.
>=20
> I see that the ivsc driver has not been in master branch. Before
> that,
> could you try several hack to check whether camera can work on
> master?
>=20
> https://github.com/bingbucao/linux/commits/ipu_dev
>=20
> 7ebff51284d9 media: ov01a10: hack ivsc to make camera can work
> 01cc9f3d1b61 i2c: ljca: Call acpi_dev_clear_dependencies()
> 92e5d122e105 vsc: Defer firmware loading to avoid long probing time
> 5f5d5f0df06b driver: ivsc: add intel ivsc driver
> 0f4819dec533 Revert "gpio: Add support for Intel LJCA USB GPIO
> driver"

Thanks for your quick reply.

I was missing understanding of ivsc when I wrote the mail yesterday.
Got some basic understanding yesterday after I wrote, and big thanks
for confirming it, and also thanks for your ipu_dev branch. Has just
cloned it, and is building as I write.

Just fyi, I was trying to hack something together yesterday, and got
further, but not yet working.

My hack was to combine the out-of-tree ivsc drivers and firmware from

* https://github.com/intel/ivsc-firmware.git
* https://github.com/intel/ivsc-driver.git

Though noticed that I need some changes to the sensor driver so was
also building all the drivers from ipu6-drivers (with minor changes to
get_pages) as out-of-tree modules.

* https://github.com/intel/ipu6-drivers.git=20

Here I used everything beside media/pci/*.ko files. I could see the
sensor and got further, but was missing the last.

Looking forward to try your branch. Looks much cleaner, and would be
nice to get working :)

/Claus
> >=20
