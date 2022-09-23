Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE965E844F
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 22:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbiIWUrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 16:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbiIWUr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 16:47:26 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191A718369
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 13:46:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id 13so3076011ejn.3
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=slTUmWywshYzLtG2iCBd9xAuNqIYxN1NHjNERM9HWOI=;
        b=NZBfMfEXL6nxAofaTMev2jV6g2dzgjVY2A2bCvZ81pfLx9gmR0NrNgYoikKQuJ+wMu
         pcqcEX89NfCw9E0SXwlg7Q92uQCdY62OTcvLD4CdalzB/hEYyLCLB9WpuvFvV03p8AVm
         TKCWN+df1OxLA+qJNpjHZVvkzUKRyRWoI91kSdYg78c7ngBc8C98QqjgXY/UKMMs9j/d
         PROmrESRL2r8Ug0Rt0yqlRakwakNDPJEFCBdukJ1rrDYCWRekk9yQD6IzyNUQDRrP15A
         cDJ+qFJitirqjduxCLbehI6I4fbszFPrKyvR2RfV7Vvhf9f+jNkC9iZwc7155WkUk4pl
         wd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=slTUmWywshYzLtG2iCBd9xAuNqIYxN1NHjNERM9HWOI=;
        b=Uiv9tB5Oy8yvXIsnADhaCzsrO7S7e1GCgL9v18hiLF2lT32M8pcwijw94dDOV1I4O4
         6SJ+4DzXHSEYKk8oFCPQAFaPvJZz15MZmjjmbrj3ACRkFmFs6fSSUXJXMwgrw9F+UQE6
         886632ZN87qypSzMCqKsjRObWNWdxyqmMh9tGtLvM7MDAH/EMdkQZvjHlamVGSuxu2nf
         9rKlrQswir2oe1t9anyav7Hlhzt7Z0vQn7im7KaYCNCCd3hyvewBkPuTozeJHrQ4IbdI
         HFzxcgSKEIE+qpFHUjK5AoES0yVMf540xkN7IBY9oYMR9Ztdz3aoDqvyAAzPZ1ui++Ck
         UD0A==
X-Gm-Message-State: ACrzQf0IGdrDvcSGlderMo2yZWDfDQfPbEFeFhUMcizuxbSETceCThZF
        w8Y0F2IhJWK7Kb/N6HFuHJElHuRqrSU8T8sAsstdZg==
X-Google-Smtp-Source: AMsMyM5x3qxug33wcPiKbncHL81emmYaxd45w41yRgxl2k2kd9ZpBddHrfqQmAtgmx+oqBYG4KX2GC79zKBVJY2sKEg=
X-Received: by 2002:a17:907:72cd:b0:782:287f:d21c with SMTP id
 du13-20020a17090772cd00b00782287fd21cmr8766684ejc.200.1663966012563; Fri, 23
 Sep 2022 13:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <166392656967.56880.6892202016312600929@Monstersaurus>
 <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com> <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com>
In-Reply-To: <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 23 Sep 2022 21:46:36 +0100
Message-ID: <CAPY8ntCh0eu7BeBOTivba-Ff+PegGDBnmemY7wx6r_tMo-h0bw@mail.gmail.com>
Subject: Re: [libcamera-devel] RFC: Arducam 64 MP (Hawkeye)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All.

On Fri, 23 Sept 2022 at 14:43, Laurent Pinchart via libcamera-devel
<libcamera-devel@lists.libcamera.org> wrote:
>
> Hello,
>
> On Fri, Sep 23, 2022 at 10:03:19AM +0000, Sakari Ailus wrote:
> > On Fri, Sep 23, 2022 at 10:49:29AM +0100, Kieran Bingham wrote:
> > > Hi Sakari, Laurent,
> > >
> > > Last night I hooked up the Arducam 64 MP Hawkeye camera [0], to an RPi4,
> > > and added the camera helper for the RaspberryPi IPA to libcamera, and
> > > was able to use the camera directly with dtoverlay=arducam_64mp in the
> > > Raspberry Pi /boot/config.txt using the latest release from Raspberry
> > > Pi.
> > >
> > > Raspberry Pi have already added the driver for this camera [1] to their
> > > tree, and I have been given the tuning files from Arducam.

I accepted the driver on the basis that Arducam upstream it, based on
libcamera's requirement of nominally running against mainline kernels.
Merging tuning files for libcamera should wait until they've made good
on that.

Raspberry Pi are not providing any level of support for it, that's all
deferred to Arducam.

> > > This has allowed me to capture an image with pretty good response to
> > > changing lighting conditions, and colours. [2] ... The AF isn't yet
> > > enabled, so that shot is out of focus a little. (That's for later).
> > >
> > > Arducam do not wish to name the sensor used in the module, and have
> > > called it the 'arducam_64mp'. But attempting to upstreaming this with
> > > that name worries me.
> > >
> > > Furthermore, we would like to maintain libcamera as supporting cameras
> > > that have 'upstream' drivers (or drivers that are on their way
> > > upstream), so I'm keen to identify how we can upstream the drivers to
> > > create a better experience for users who are currently finding that they
> > > need to run a fork of libcamera to operate the module.
> > >
> > > So ultimately - my open question is ... Is it acceptable to have camera
> > > drivers that are named by their 'module/integration' rather than their
> > > sensor?
> >
> > A lot of users (especially the existing ones) depend on the entity name
> > currently. I don't think we could change it. For new ones I guess that
> > would be possible.
> >
> > Alternatively this could be a string control I think. That could be added
> > to existing drivers as well.
>
> The question here, as far as I understand, isn't about the entity name
> exposed to userspace, but about the driver name. The entity name
> certainly matters too.
>
> Camera sensor drivers we have in the mainline kernel are named after the
> camera sensor model, and I think we should continue that. If this were a
> custom silicon made by Arducam they could name it any way they want, but
> if it's a sensor from a known sensor manufacturer, I don't think the
> name should be hidden. I wouldn't be surprised if it would be possible
> to identify the camera sensor relatively easily from the register set
> anyway, which would render this whole game pointless.
>
> One of the major advantages of upstreaming driver is the community
> maintenance that you get from free, including improvements to the driver
> from other developers who use the same camera sensor in a different
> product. We don't want to have multiple drivers for the same hardware in
> the mainline kernel, there are precedents for that due to historical
> reasons (mostly people not realizing that the same IP core was used in
> different SoCs), and there are efforts to fix that. I don't see a reason
> to go the opposite way.
>
> TL;DR: Unless there's a very compeling reason not to follow the usual
> practice, I don't see why we should make an exception in this case.

Arducam have done a pretty good marketing campaign based on this
sensor, hence not wanting to publicly declare what it is.

Jeff Geerling suggested it might be an IMX686 [1], but it's not.
It is a Sony sensor. Read the ID register (0x0016 IIRC) and all will
be revealed. Cross reference to https://en.wikipedia.org/wiki/Exmor.

If mainline accepts a driver with an alternate name I'll be delighted
to revert the downstream driver.
Likewise I'll be happy to merge a PR renaming the driver if someone
else identifies it - Arducam have asked me not to identify it. (The DT
overlay needs to keep using the same name, but that is identifying the
overall module instead of just the sensor)

  Dave

[1] https://www.youtube.com/watch?v=0mYRHrLYmLU&t=1s
