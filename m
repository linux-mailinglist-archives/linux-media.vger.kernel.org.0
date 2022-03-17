Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C31704DC1EF
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 09:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiCQIyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 04:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiCQIyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 04:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EBD2CA76F8
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647507202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uFfTJdqSsa1NG+Ra/FukB6NKy0iv2m8HqzphlwyuIMY=;
        b=c88YGMFzzw1f2J8RcK8zhpF6cDUlF2Ro/LpIcASTblBMIdzGn1nJFw9UHxspylcTXjBPHd
        1nUBn3P7zbGRD6knkQgqm65PDpEY65BAR3nd01Zht2RHzQhnTi0Wv5tSFkPRTM5EnFYUW1
        0R0SNytS3Nyla+zcOZO3Qy5SP0eOMEA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-CIzlypFHNBq14vdbGpa9FQ-1; Thu, 17 Mar 2022 04:53:20 -0400
X-MC-Unique: CIzlypFHNBq14vdbGpa9FQ-1
Received: by mail-lj1-f197.google.com with SMTP id v9-20020a2e9909000000b00247ecf60956so1838409lji.12
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFfTJdqSsa1NG+Ra/FukB6NKy0iv2m8HqzphlwyuIMY=;
        b=BuRZYnG85dPGz1TAVYHSqnaMjcooJ921EexCjUrHkav9vgjGy6o2Kqk0Q3NWnpDSHa
         RoujK3gXyyfmOoM3+SamNv9XDP/b6ciItDBqpuMyQXjwUHJu3wQW7XgGMdC7hgtusPms
         HodlsLRE24eFw81zjcHFQC2U7VZ/h4RjSJTd/8qY9gC7/HBycnTi0/p756wRxGaT49PQ
         pwCxk/DzgDxqOCphFZBwMeaZrntIUZuA5x56Pq9UG4uHIkdNXNen8+BhUkvP7+YbZnPM
         vWIyVLe9rANb2ZbKKDXOlKxzcU83VobCYWLF6nZf9gpJjGs15NvFJ0r1r0AqIwpbKdMs
         gMLg==
X-Gm-Message-State: AOAM533J76HCSPy871yQcUFM5UaE6xo9qsvmoYr2r4iBGc2G53VlTKX7
        wo7y2FigVwumYu/ugfNAjaeep7I5FY5XkC63Ig54d2CNc28dTyiQ5lW27q5uh44elwDdSzRTcS+
        mJNNH+a/jgoC6w7qgjasQirUJE7b1OoeYsboonRo=
X-Received: by 2002:a2e:9dcf:0:b0:247:f8eb:90d5 with SMTP id x15-20020a2e9dcf000000b00247f8eb90d5mr2171006ljj.23.1647507198400;
        Thu, 17 Mar 2022 01:53:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNbwp6tqy+HcMHGRBfqOz/Srxy4fE5I30SgISlwUiwMSrU46WrhElns8Rx+/WjzuJGzZtPGGRI1b5zx3gbtI0=
X-Received: by 2002:a2e:9dcf:0:b0:247:f8eb:90d5 with SMTP id
 x15-20020a2e9dcf000000b00247f8eb90d5mr2170987ljj.23.1647507198111; Thu, 17
 Mar 2022 01:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220317075713.10633-1-hpa@redhat.com> <YjLxFuRXKzg3m9HH@paasikivi.fi.intel.com>
In-Reply-To: <YjLxFuRXKzg3m9HH@paasikivi.fi.intel.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Thu, 17 Mar 2022 16:53:07 +0800
Message-ID: <CAEth8oHqSS7EsPofmERRB=pmtS8YPP+MeM6fMG6tJT2z_qChxA@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Mar 17, 2022 at 4:28 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Thu, Mar 17, 2022 at 03:57:13PM +0800, Kate Hsuan wrote:
> > For the AF configuration, if the rightmost stripe is used, the AF scene
> > will be at the incorrect location of the sensor.
> >
> > The AF coordinate may be set to the right part of the sensor. This
> > configuration would lead to x_start being greater than the
> > down_scaled_stripes offset and the leftmost stripe would be disabled
> > and only the rightmost stripe is used to control the AF coordinate. If
> > the x_start doesn't perform any adjustments, the AF coordinate will be
> > at the wrong place of the sensor since down_scaled_stripes offset
> > would be the new zero of the coordinate system.
> >
> > In this patch, if only the rightmost stripe is used, x_start should
> > minus down_scaled_stripes offset to maintain its correctness of AF
> > scene coordinate.
> >
> > Changes in v2:
> > 1. Remove the setting of the first stripe.
> >
> > Changes in v4:
> > 1. x_start is estimated based on the method for both stripes are enabled.
> > 2. x_end is estimated based on the width.
>
> Please put the changelog before '---' line. I've removed it from the commit
> message this time.
>
> --
> Sakari Ailus
>

Okay, I got it.

Thank you.

-- 
BR,
Kate

