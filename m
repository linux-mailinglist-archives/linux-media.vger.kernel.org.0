Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8082A6243D3
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 15:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbiKJOGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 09:06:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKJOGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 09:06:24 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0002478300
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 06:06:22 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id z14so2401213wrn.7
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 06:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FG7CKiEpXdcRfvde0ML9G1im9GN9mW6nWlxvacnKi0Q=;
        b=ICqx4uLyILSvetwtTnyNaaffG6b4eVt/YzSHtkyzgBWchlPmD5FO/ifuIYl8gr0sIh
         0TrIm4hK9Q225FoykzkRaP6hLocNv6sW8fauCGNgsY5BbMw/n9NMU3fV9EvcUwY6Gca2
         7N7FaN7htkQxKplR7UZ/ylabegxk0F+sjDM1j2P/wPjWIi9R9/oqySptO3twU3ODuGl5
         du7KPPNfeiQXR/08ccLI0nL44Y76neMdauRlnC4940kuLK/VQwhu5RShZqyhHm07zTN0
         UaKxR1u2lzQotavvuD9r6rE5SKHwFcS416akkM7qZO4OlFVuO2ln4ionzs/r7UZyU7Y5
         1pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG7CKiEpXdcRfvde0ML9G1im9GN9mW6nWlxvacnKi0Q=;
        b=sRm2e6bpyiJ241chiQlp3S1ucU2MQHM3v94o3tdKskr38TO2qxn7N5/U5LaWzmwTVQ
         dRehdbdSavgblOtzk3SuU3eN/SVbcoyS0MctK9b2XBV91u0ZonKA6swkiV4MZDI6txPE
         40nzCVjc/xp+RIs5Vx4WyB9/PqNVptW7TxNKae+1VM6V3gfvVYuFrAUPwzYorOXujPyL
         bqR9NWnr0xwTcxY65VecZtTBoYb1ic7PO5jIJT+wsD/cDPfddJZaQPqMWJg89N1Bq5PZ
         kMYqNCAJujXgc45o5h3QIKOqIBgaJo/U/sr0ThO+qXiiHYGykuJP0hlNKEovycUgUAMn
         CcLw==
X-Gm-Message-State: ACrzQf3osCsU966DeFtlGDJgGKz6NTQ3cbjh7yk60WZWiV0wGgweHsqG
        ashWs6QYDkENd4N3IVDdwc/pQ1YFmq8=
X-Google-Smtp-Source: AMsMyM7VrayV4oKDNFXwuxEWi6mw24PIFSuoxPewRux3cihVJaJS9v28dbjL0rRSh2jX8gwV/kuyew==
X-Received: by 2002:a5d:604c:0:b0:236:6deb:6d31 with SMTP id j12-20020a5d604c000000b002366deb6d31mr40929472wrt.282.1668089181518;
        Thu, 10 Nov 2022 06:06:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b003b3365b38f9sm5908706wmo.10.2022.11.10.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:06:20 -0800 (PST)
Date:   Thu, 10 Nov 2022 17:06:17 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     oe-kbuild@lists.linux.dev, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Message-ID: <Y20FWdCTPiKWOdNd@kadam>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
 <Y2z4n8b+tEtzNR/4@kadam>
 <Y20ErxBkDVVGzYim@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y20ErxBkDVVGzYim@kadam>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 10, 2022 at 05:03:27PM +0300, Dan Carpenter wrote:
> On Thu, Nov 10, 2022 at 04:11:59PM +0300, Dan Carpenter wrote:
> > On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
> > > After running smatch on my tree I couldn't reproduce this warning:
> > >   warn: pm_runtime_get_sync() also returns 1 on success
> > > I'm using the latest smatch cloned from github. Do you append some
> > > options to kchecker to get this output ?
> > 
> > TL;DR: Thanks for the report!  I will fix it later this week.
> >
> 
> [ snip ]
> 
> > It creates a fake environment to test what !ret means
> > for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
> > the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".
> > 
> > Smatch shouldn't be printing warnings from inside the fake environment.
> 
> Nope.  That's not it...  It already has code to not print from a fake
> environment (unless you're in debug mode).  It's a mystery how the
> kbuild bot triggered this warning.
> 
> :(

Ah...  Seeing your patch helped me figure it out.  The kbuild bot does
not have the cross function db built so when it sees:

	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_V, crop->top, &ret);

Then it doesn't see that "ret" is modified.  On my system I have the
DB so I don't see the warning.

regards,
dan carpenter

