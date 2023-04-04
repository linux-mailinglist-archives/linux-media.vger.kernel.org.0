Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663C36D5FAC
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 13:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbjDDLzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 07:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjDDLzX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 07:55:23 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F773C18
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 04:54:48 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q19so29437505wrc.5
        for <linux-media@vger.kernel.org>; Tue, 04 Apr 2023 04:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680609286;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub5MfHarz5HIFxeHnc0/0vIpMZsfBSyoJJ2fMfi2n3w=;
        b=OWGzAysNdv7vtzv2I1l0Maw3i/FfyrC/I+0z3WMOleOjQnnFdJ+MwokWJJY61fBjcJ
         Kg5JiFhviZqh+T8gUJ731fAAe+yJyoebamMKaap9VaJaBbEOX8GpFuTpeBkL98IZW5TV
         b6YKm6Q89Bs0uOPVATlr5oFf3/0T0BWdgbL84q/RYAXcR5Iq6au0CCmS5iC34poIeNLo
         98/i6d6tJgJY7m8Nxc4GLnBpcu5Vt/6vEGmqANaj9sDx47G99tunLOErsQlUzkIZ4RW2
         8yoLiKd2RZWZ3ieOo/y8WdoFV+1qDWXQbAImD5xrpX+d94Q4x4HAFVQz9Nlkg/wgQ3cm
         N7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680609286;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ub5MfHarz5HIFxeHnc0/0vIpMZsfBSyoJJ2fMfi2n3w=;
        b=7bHRPAmiLJPOEliV+uXRatlXzHp8vHVrl7XulLzgk54osrUaaGbh2qhsa8oKSaLz58
         GM9Zt7CTThXFWJkWyEqKtdBCSq+5a51QQkTK1Z4GBfcOyeHba4tqIbC9t9wptaWJrllr
         C/ihE1IbMwd+E9Dq9HJjKSwWi7paGRi4kphd46u9eFXfYUzFaNWVWq068A5AKdIbExdt
         gDnKvRT5YA9rUR9NhsOJS+6FdscByth93jKA8qxieS6kXxeu4M0FxWqYNaTo6uRtHx8n
         FMRAGEwdt1p7fJqwBe0nA7npLqbYF3xtVF0vG7UayIjJn8NiMSWug1hnQVW0fOjLbNVW
         FwJg==
X-Gm-Message-State: AAQBX9cS0+wim9G0bqLcaIcqakyObgw8dXLHCpMuDOJcWu5OsEZkloXx
        qJUi76WIJxc2sK2ra4KrNBZLeRQoe+/3wQ==
X-Google-Smtp-Source: AKy350bqoOu2+oGtXiuUj0JtAz8qQxzCa/AOVO93Gf7INco1HFmQWfLHQaa6o+ucHzwMzhEEpGWVgQ==
X-Received: by 2002:adf:f786:0:b0:2e5:151e:89f1 with SMTP id q6-20020adff786000000b002e5151e89f1mr1550251wrp.8.1680609286251;
        Tue, 04 Apr 2023 04:54:46 -0700 (PDT)
Received: from [192.168.0.8] (static-3-123-228-77.ipcom.comunitel.net. [77.228.123.3])
        by smtp.gmail.com with ESMTPSA id m2-20020a5d4a02000000b002d75ef32032sm12140310wrq.68.2023.04.04.04.54.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 04:54:45 -0700 (PDT)
Message-ID: <e4260d41-2295-53ed-12d1-3c039eddd94f@gmail.com>
Date:   Tue, 4 Apr 2023 13:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Jos=c3=a9_Manuel_Alcaraz_Pelegrina?= <jmaphys@gmail.com>
Subject: Help with support for AverTV Hc82
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I have a old AverTV Hybrid NanoExpress card sold several years ago by DELL that runs well on Windows, but I would like to make it working on Linux. 
There were several models of this card as described in https://linuxtv.org/wiki/index.php/AVerMedia_AVerTV_Hybrid_NanoExpress. Apart from the Avermedia models there are others sold by Dell that they labelled as HC82 (DVB) and HC82 (ASTC). Mine is HC82 (DVB).

Dell has a Diagnostic tool that give this information:

[21:59:19] === Device Information ===
[21:59:19] Capture filter friendlyname:AVerMedia 716x BDA Analog Capture
[21:59:19] Model Name:                 AVerMedia HC82 (Hybrid DVBT)
[21:59:19] Transmission Interface:     PCI Express
[21:59:19] Supported Standards:        NTSC/PAL/SECAM/DVB-T
[21:59:19] TV Tuner:                   TDA18271
[21:59:19] Audio/Video Decoder:        SAA7136
[21:59:19] Encoder:                    N/A
[21:59:19] Ditial TV Demodulator:      ZL10353
[21:59:19] === Driver Version ===
[21:59:19] Bridge:                     Error!
[21:59:19] === Test Results ===
[21:59:19] Tuner Product ID:           131
[21:59:19] AVDeocder Revision ID:   0x8000
[21:59:19] Demodulator Chip ID:        20
[21:59:19] Get Device Information:     [PASS]
[21:59:19] TV Tuner:                   [PASS]
[21:59:19] Audio/Video Decoder:        [PASS]
[21:59:19] Digital TV Demodulator:     [PASS]
[21:59:19] --- Test End ---

The card has a SAA7160 PCI Express based audio and video bridge, a DVB demodulator ZL10353 (perhaps a CE6353), a TDA18271 tuner and a SAA7136 A/V Decoder.

In order to try to install a driver for linux I followed the instructions given in https://www.vdr-portal.de/forum/index.php?thread/134377-tt-s2-6400-saa716x-kompilieren-unter-20-04/ to patch the linux sources:

#!/bin/sh
#
# Build modules under Ubuntu-20.04 LTS for TechnoTrend DVB S2-6400
# Based on https://www.vdr-portal.de/forum/index.php?thread/132415-tt-s2-6400-saa716x-kompilieren-unter-18-04/&postID=1337903#post1337903
#

URL=https://github.com/s-moch/linux-saa716x/compare
BUILDDIR=~/linux-saa716x
LOGFILE=$BUILDDIR/linux-saa716x.log
KERNELVERSION=$(uname -r)
KMAJOR=$(uname -r | cut -d'.' -f1)
KMINOR=$(uname -r | cut -d'.' -f2)
KSOURCE=$(uname -r | cut -d'-' -f1)
DIFF=saa716x-$KMAJOR.$KMINOR.diff
sudo apt install fakeroot build-essential devscripts libncurses5 libncurses5-dev bison flex libssl-dev pv wget linux-source-$KSOURCE linux-headers-$KERNELVERSION
rm -rf $BUILDDIR
mkdir -p $BUILDDIR
cd $BUILDDIR
wget $URL/$DIFF
echo "Kernel Sources entpacken..." 
pv /usr/src/linux-source-$KSOURCE.tar.bz2 | bzip2 -d | tar x
cd linux-source-$KSOURCE
cp /boot/config-$KERNELVERSION .config
cp /usr/src/linux-headers-$KERNELVERSION/Module.symvers .
printf "#\n# Kernelversion: $KERNELVERSION\n#\n" >$LOGFILE
patch -p1 < ../$DIFF | tee -a $LOGFILE
printf "y\nm\nm\nm\nm\n" | make oldconfig | tee -a $LOGFILE
make KERNELVERSION=$KERNELVERSION -j6 modules_prepare | tee -a $LOGFILE
make KERNELVERSION=$KERNELVERSION -j6 M=drivers/media/pci/saa716x/ modules | tee -a $LOGFILE
sudo cp drivers/media/pci/saa716x/saa716x_core.ko /lib/modules/$KERNELVERSION/kernel/drivers/media/pci/
sudo cp drivers/media/pci/saa716x/saa716x_ff.ko /lib/modules/$KERNELVERSION/kernel/drivers/media/pci/
sudo depmod $KERNELVERSION

adding a line to copy saa716x_hybrid.ko module when created.

I modified the saa716x_hybrid.h and saa716x_hybrid.c to adapt them to AverTV Hybrid NanoExpress HC82 card (I deleted the code for the others cards, sorry):

saa716x_hybrid.h

#ifndef __SAA716x_HYBRID_H
#define __SAA716x_HYBRID_H


#define AVERMEDIA   0x1461

#define AVERMEDIA_HC82  0x0555

#endif /* __SAA716x_HYBRID_H */


and saa716x_hybrid.c

/*
 * Avermedia Hybrid NanoExpress DVB-T
 *
 * DVB-T Test
 */

#define SAA716x_MODEL_AVERMEDIA_HC82          "AVERMEDIA NanoExpress Hybrid"
#define SAA716x_DEV_AVERMEDIA_HC82            "DVB-T + Analog"

//#if 0
// These data are from a old version of the driver by Manu Abraham, but I'm not sure this parameters correspond to this model.
static struct zl10353_config saa716x_hc82_zl10353_config = {
        .demod_address          = 0x1f ,
        .adc_clock              = 450560,
        .if2                    = 361667,
        .no_tuner               = 1,
        .parallel_ts            = 1,
};
//#endif


static int saa716x_hc82_frontend_attach(struct saa716x_adapter *adapter, int count)
{

    struct saa716x_dev *saa716x = adapter->saa716x;

    struct saa716x_i2c *demod_i2c = &saa716x->i2c[SAA716x_I2C_BUS_B];

        pci_dbg(saa716x->pdev, "Adapter (%d) Power ON", count);
        pci_dbg(saa716x->pdev, "Adapter (%d) SAA716x frontend Init",
             count);
        pci_dbg(saa716x->pdev, "Adapter (%d) Device ID=%02x", count,
             saa716x->pdev->subsystem_device);

        adapter->fe = zl10353_attach(&saa716x_hc82_zl10353_config,&demod_i2c->i2c_adapter);

    return 0;


    }


The script executes without errors and the module saa716x_hybrid.ko is generated. When loaded with sudo modprobe saa716x_hybrid the output of dmesg is:

[ 3978.615919] SAA716x Hybrid 0000:0d:00.0: found a AVERMEDIA NanoExpress Hybrid PCIe card
[ 3978.616140] SAA716x Hybrid 0000:0d:00.0:  SAA7160 Rev 3, irq: 25 (MSI)
[ 3978.661590] dvbdev: DVB: registering new adapter (SAA716x dvb adapter)
[ 3978.765613] SAA716x Hybrid 0000:0d:00.0: I2C transfer error, msg 0, addr = 0x1f, len=1, flags=0x0
[ 3978.765628] zl10353_read_register: readreg error (reg=127, ret==-5)
[ 3978.765636] SAA716x Hybrid 0000:0d:00.0: A frontend driver was not found for [1131:7160] subsystem [1461:0555]

So, the card is detected but the frontend is not loaded. In fact, the dvb device is created and also you could found the next devices:

/dev/dvb/adapter0
/dev/dvb/adapter0/demux0
/dev/dvb/adapter0/dvr0
/dev/dvb/adapter0/net0

Perhaps I need more information about the card but I have no idea what to do next. Any suggestions would be appreciated.

Thanks.

José Manuel

Sorry if I have send this mail to the owner of the list too. 
