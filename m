Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2CB435E5A
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 11:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhJUJyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 05:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhJUJyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 05:54:49 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46FEC06161C;
        Thu, 21 Oct 2021 02:52:33 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id o133so139721pfg.7;
        Thu, 21 Oct 2021 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=S9bjOuI45h65wf/JkcoaH7lZSurcv8d3EkWiJ/rqemw=;
        b=X2WJ0nm0wGkHjb9BvIMcKvk5nj7GEOQju3JVFq3xdfM9fyL6zIbYqSF8jiXAfTnUDK
         Rec3GHEw5n/lkjifMaPJn83G0Pq5VRc6EBtWPi8e8JUNN+58KyQoX+lKBoaGzd+/EU8+
         oTm75y7I3NlqE1ie3Sw56MmJmt1rUoZPElOXX75SBpjwgYa/0LsuUZ/dQcsBhsi25m2e
         FxLenE7HNxD7egFH+DR1150PchOutWJBjKxvoOiLSr5+S+1XDQrCDfMI7LOzd5KtVmxu
         7/XIF6uPVG+W9jfhgYKEs1HQ3lmTt3r/bGMWJryVf/BTXJRK7LN0ug4iuoyMR3uFAOds
         7ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S9bjOuI45h65wf/JkcoaH7lZSurcv8d3EkWiJ/rqemw=;
        b=AF322pKzjJWOA/fYhre9Rf6rbFirP90N+CWTCBDe09MImlHsKtDo6cygH9cmkiEC1J
         qcucLGsqn+n/8rW+TXoP1irA/oAISVXI9Ghhx0p14tTn9FEVO5J2ArbO5WGGQJRpn4b8
         zEhMBVA60uO/RraE2g46YcJTYqeYKME/J6x55qCjOCEXiR0sycR+ybCG6M2HOJtQPmGb
         hgV6NChrJxSXG9Z3Zc64wFdFbs2pDk5U7D74T8oIcNpUFpcc3/IXXedRssIieiqzEYMr
         8UXirg43ahj+Zw46rRksSrhRqCXxPnyyZX51uwS7YNtqo3hriU8Rohx1edcLn3xkF0Ug
         xV1Q==
X-Gm-Message-State: AOAM531VAyu9gdqz2gpsACeEICdW7t9rrxWBEm5Rvjh3jGokoDBYnroz
        VNBZlXr4HIH15DAoagxVJrE=
X-Google-Smtp-Source: ABdhPJyMsUXCyOhdHOms+3btsP8mkOiltp5y7vgF9NmBloHfWejT8e3uQEkA5Tm7cx3yTMQ8SVJ4WA==
X-Received: by 2002:a62:d11e:0:b0:446:d705:7175 with SMTP id z30-20020a62d11e000000b00446d7057175mr4480842pfg.74.1634809953248;
        Thu, 21 Oct 2021 02:52:33 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id s7sm5669395pfu.139.2021.10.21.02.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:52:32 -0700 (PDT)
Message-ID: <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Thu, 21 Oct 2021 18:52:28 +0900
In-Reply-To: <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211017162337.44860-6-kitakar@gmail.com>
         <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for your comment :-)

First, I need to correct what I said in the previous mail. I later found
that loading only "atomisp" (as well as its dependency,
atomisp_gmin_platform) does not cause this issue.

What causes this issue is rather, loading sensor drivers (as well as its
dependency, atomisp_gmin_platform).

These sensor drivers for surface3 are both not upstream, but I made them
as similar as possible to the upstreamed ones. So, I guess this issue
can still be reproducible on some other devices.

I can't (easily) try touchscreen on mipad2 because it won't boot without
nomodeset and somehow GNOME won't start if it's using nomodeset (on Arch
Linux).

On Mon, 2021-10-18 at 10:30 +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/17/21 18:23, Tsuchiya Yuto wrote:
> > Touchscreen input works fine before loading atomisp driver on Surface 3.
> > 
> > However, after loading atomisp driver, touchscreen works only when
> > capturing images. This sounds like atomisp turns off something needed
> > for touchscreen when atomisp is idle.
> > 
> > There is no useful kernel log. Just the touchscreen stops working
> > with no log.
> > 
> > I'll update if I find something further. First of all, can someone
> > reproduce this issue on the other devices?
> 
> My first bet would be some regulator getting turned off.
> 
> What you can do is:
> 
> 1. ls -l /dev/bus/i2c/devices
> 
> And then write down the number of the i2c-bus to which the
> CRC PMIC is connected, lets say it is number "4". Then:
> 
> 2. Before loading the atomisp drivers run:
>    "sudo i2cdump -y -f 4 0x6e > crc-regs-good"
> 
> 3. After loading the atomisp drivers run:
>    "sudo i2cdump -y -f 4 0x6e > crc-regs-bad
> 
> 4. "diff -u crc-regs-good crc-regs-bad"
> 
> And see what changed.

Here is the diff. The "good" one is before loading sensor driver, the
"bad" one is from after loading sensor driver:

        $ diff -u crc-regs-good crc-regs-bad
        --- crc-regs-good	2021-10-21 18:04:57.853396866 +0900
        +++ crc-regs-bad	2021-10-21 18:06:13.755738054 +0900
        @@ -4,14 +4,14 @@
         20: 00 00 01 c8 68 07 0a 10 10 01 1f 10 10 10 10 10    ..??h???????????
         30: 10 10 00 20 21 20 20 20 20 20 00 2a 1c 1c 14 10    ??. !     .*????
         40: 10 10 10 28 20 20 28 2e 2f 20 20 83 00 00 4c 00    ???(  (./  ?..L.
        -50: 00 01 01 01 00 00 60 00 60 00 00 02 02 03 60 60    .???..`.`..???``
        +50: 00 01 01 01 00 00 60 02 60 00 00 02 02 62 60 60    .???..`?`..??b``
         60: 60 01 03 00 00 00 00 00 00 00 30 04 00 00 00 00    `??.......0?....
        -70: 00 03 00 00 02 7b 02 6c 02 71 02 55 02 7c 02 9d    .?..?{?l?q?U?|??
        +70: 00 03 00 00 02 7b 02 6d 02 73 02 58 02 7f 02 9e    .?..?{?m?s?X????
         80: 00 00 00 00 00 00 00 00 00 00 00 02 08 00 0b 02    ...........??.??
         90: 3f 07 00 00 00 00 4c 00 4e 00 00 4c 00 23 01 b4    ??....L.N..L.#??
         a0: 4c 00 4e 00 00 3d ca 6a f0 00 00 3d ca 6a f0 00    L.N..=?j?..=?j?.
         b0: 00 7e 2a ff 02 04 06 00 00 00 00 00 00 20 00 00    .~*.???...... ..
         c0: 00 00 00 cd 08 00 00 4c 00 00 00 4c 00 00 00 3d    ...??..L...L...=
        -d0: 97 00 00 3d 97 00 00 fe 17 00 ff 02 01 07 94 03    ?..=?..??..?????
        -e0: 9a 00 27 00 00 00 00 00 00 00 00 00 00 00 00 00    ?.'.............
        +d0: 97 00 00 3d 97 00 00 fe 17 00 ff 02 01 07 ec 03    ?..=?..??..?????
        +e0: 96 00 21 00 00 00 00 00 00 00 00 00 00 00 00 00    ?.!.............
         f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................

Note that lines "70:" and "d0:"/"e0:" change over time. So, the actual
change caused by loading sensor driver is line "50:"

        -50: 00 01 01 01 00 00 60 00 60 00 00 02 02 03 60 60    .???..`.`..???``
        +50: 00 01 01 01 00 00 60 02 60 00 00 02 02 62 60 60    .???..`?`..??b``

and in atomisp_gmin_platform.c file,

        /* CRYSTAL COVE PMIC register set */
        #define CRYSTAL_1P8V_REG	0x57
        #define CRYSTAL_2P8V_REG	0x5d
        #define CRYSTAL_ON		0x63
        #define CRYSTAL_OFF		0x62

indeed we're poking at 0x57 and 0x5d. So, maybe this issue is caused by
regulators? I tried what would happen if I kept sensor power on before
in sensor drivers, but there was no effect. But I feel I need to look
into it again further.

> There are 2 possible root causes here:
> 
> 1. Some regulator is shared between the cameras and
> touchscreen
> 
> 2. The crc code in atomisp which you are using is
> poking registers assuming the Bay Trail version of
> the Crystal Cove PMIC (aka CRC PMIC) but your
> Surface 3 has the Cherry Trail version and we know
> that the regulators are add different register
> addresses there, see the comment in:
> drivers/acpi/pmic/intel_pmic_chtcrc.c
> so it is possible that the atomisp code is simply
> poking the wrong register for one of the regulators

According to this Android kernel commit [1], the address for 1P8V and
2P8V are updated to the CRC+ ones (the upstreamed atomisp already has
this change)

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/commit/2f8221ba9a3770aed1ecfad2d04db61b95f30394
    ("update PMIC v1p8/v2p8 address")

> I also wonder if this goes away if you do the
> 
> 	hrv = 0x03;
> 
> Hack inside drivers/mfd/intel_soc_pmic_core.c ?
> 
> Without that we end up using the wrong PMIC
> OpRegion driver which also uses the wrong
> regulator addresses.

I'm now using cht one with your patch, but the situation is the same
as before.

Regards,
Tsuchiya Yuto

> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> Here are the 2 different regulator drivers the
> comment in drivers/acpi/pmic/intel_pmic_chtcrc.c
> refers to:
> 
> https://github.com/Zenfone2-Dev/android_kernel_asus_moorefield-1/blob/stock/drivers/regulator/pmic_crystal_cove.c
> https://github.com/Zenfone2-Dev/android_kernel_asus_moorefield-1/blob/stock/drivers/regulator/pmic_crystal_cove_plus.c
> 


