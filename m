Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1BE787932
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 22:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243305AbjHXUTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 16:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239341AbjHXUTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 16:19:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C951E4B
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 13:19:21 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ff933f9ca8so300309e87.1
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692908359; x=1693513159;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XdHWGSpZETM2O+ITDteT7UfsUNev9UDh8oQrLbZyR7Q=;
        b=YKNOKkTbuzrx5SyzXpPv5UBO7FiXuAve62Z0DK9VJOMERNFtEjSgG2Ev3y5symky1+
         UIEAyTXFMxxYET2Lo9MRUEdlLzPe2oqkKR5dhCU1h17r+bqBfPytUPUPY9dmOysOGgWo
         CfJVICeUJ+gmQKikgHpVgiIPhXw2kk+3H5Y+dKK3WjF6zeLwe75WB3qJLkdAXa/KfVWN
         DS+f45dp+0NYOoPutq8NGvpZZShBBr/fnhNJk3apvzvLke3zYKMVOjv/X7pBZPOfzByS
         aM1NgQTzkr/xcRBc1GwaRAHRDFkNABWnSTnG4HeF2betUV04rNLnbpWJczLa+l/+3UNJ
         ggIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692908359; x=1693513159;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdHWGSpZETM2O+ITDteT7UfsUNev9UDh8oQrLbZyR7Q=;
        b=gWpB9O3kMVpD3N9YEtSQ8X+k2Ry2OAxiNK5PXFQ5bNANbIm5/eo1BDkyhhoMcm1T7D
         M89BVv8eccR4h/wO1nuUwo/PG2drJcMQJ4CQc+YBX2gEu+79HC6meVCbfHg0w/B5DLtT
         hlPuDwlKjFhJFR1BFJsjmUjTu9YBb6AaMRoPDqc0rdE7pqYAZvLlslnXhke6OuCdfUQM
         rOuocjQyWqmzrX1WLMBLLb9Jyn9QILUhafWGpAc3pBg9xmutAjdC+2+RX1mAmau2skg9
         xtzZJQymS6NcY9kcDNxML6nMxjn2SrGnfbmXTRAskwcLM4QDaRxK121jZWKSL5oWPDH9
         93gA==
X-Gm-Message-State: AOJu0YyKvblKtqg9RJ08MUhtKjTenB2YK4NaZ7HdIEL5/01ZzDIkJPv4
        H52wUvyDrLKNKIG9bTTVQdE=
X-Google-Smtp-Source: AGHT+IFdGWqLJfNm0nvvvMA9WeaNsGrR/iqt+9lxlpZoGCl3YQNU/XwoswFGiSra+wcQUyli5g2y9g==
X-Received: by 2002:a19:ca44:0:b0:500:90d1:90a6 with SMTP id h4-20020a19ca44000000b0050090d190a6mr5440973lfj.63.1692908359173;
        Thu, 24 Aug 2023 13:19:19 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id i9-20020aa7c709000000b0052a198d8a4dsm148843edq.52.2023.08.24.13.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:19:18 -0700 (PDT)
Message-ID: <073f6080b1365e3d552186f4921c9d98f32ab106.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Date:   Thu, 24 Aug 2023 22:19:16 +0200
In-Reply-To: <8c47de74-a08f-2adc-537d-e30b42cdb45b@linux.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
         <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
         <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
         <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
         <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
         <8c47de74-a08f-2adc-537d-e30b42cdb45b@linux.intel.com>
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

On Tue, 2023-08-22 at 11:05 +0800, Bingbu Cao wrote:
>=20
> Claus,
>=20
> On 8/21/23 6:07 PM, Claus Stovgaard wrote:
> > Bingbu
> >=20
> > Though yavta does not work in the way as described in the guide.
> >=20
> > [root@xps-1 ]# yavta --data-prefix -u -c10 -n5 -I -s 1280x800 --
> > file=3D/tmp/frame-#.bin -f SBGGR10 /dev/video0
> > Device /dev/video0 opened.
> > Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video,
> > capture, with mplanes.
> > Video format set: SBGGR10 (30314742) 1280x800 field none, 1 planes:
> > =C2=A0* Stride 2560, buffer size 2050560
> > Video format: SBGGR10 (30314742) 1280x800 field none, 1 planes:=20
> > =C2=A0* Stride 2560, buffer size 2050560
> > Unable to request buffers: Invalid argument (22).
>=20
> Firstly, thanks for your work. I just noticed that we remove the
> userptr buffer support before, that means yavta '-u' will not be
> supported. So I think you can try to remove '-u' to see whether it
> can work. I will update the documentation in next version.

Good catch. Removing the -u makes it work.

clst@emb-xps-1:~$ yavta --data-prefix -c10 -n5 -I -s 1280x800 --
file=3D/tmp/frame-#.bin -f SBGGR10 /dev/video0
Device /dev/video0 opened.
Device `ipu6' on `PCI:0000:00:05.0' (driver 'isys') supports video,
capture, with mplanes.
Video format set: SBGGR10 (30314742) 1280x800 field none, 1 planes:=20
 * Stride 2560, buffer size 2050560
Video format: SBGGR10 (30314742) 1280x800 field none, 1 planes:=20
 * Stride 2560, buffer size 2050560
5 buffers requested.
length: 1 offset: 1815302016 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0x7fa9b040b000.
...
Warning: bytes used 2048000 !=3D image size 2050560 for plane 0
0 (0) [-] none 0 2048000 B 183.555047 183.571463 59.641 fps ts mono/EoF
Warning: bytes used 2048000 !=3D image size 2050560 for plane 0
1 (1) [-] none 1 2048000 B 183.571675 183.588100 60.140 fps ts mono/EoF
...
Captured 10 frames in 0.182985 seconds (54.649099 fps, 0.000000 B/s).
5 buffers released.


> For Dell XPS 9320, we still have some work to make IPU work with
> Intel VSC(upstreaming). My current hack on github is not offical.
> But it can help people on 9320 to verify the camera before
> everything ready. :)
>=20


Yes. Big thanks for the work. I guess that after next merge window, the
IPU6 patches can be rebased on top of Intel VSC sent upstream, and also
changed to fit the changes in the V4L2 api.

Regards
Claus
