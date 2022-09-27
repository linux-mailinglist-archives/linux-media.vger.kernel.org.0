Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FECD5EC521
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 15:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbiI0N5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 09:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiI0N5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 09:57:34 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9E9146624
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:57:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id sd10so20923638ejc.2
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=wWmUplSIGLHqTXKQn830L50TUzZDqD8/z7vsdgzJtC8=;
        b=ASPc4e4Zgz+eUs+S97BVl9bWv1qQHONmQi/YJX/JkSaYK7VZNlfBpN3xjDpkxBlAcO
         3+KsOEMxUWYn7fmwxeAG26DK0u+8OxwYt7hRPOdiXen80HLSDDDpkXRjA8PjpZsu/xC+
         quhabbvUiOP/51xY0nOK54k2j1xBOaAbw4n10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wWmUplSIGLHqTXKQn830L50TUzZDqD8/z7vsdgzJtC8=;
        b=JwZr988nGN7FieS2BaCz2t7TTRTIzzYq4QjMYtJstdIvQvvO8IfMpxUC+bHPk4oMkM
         W1VLNGcf3Y4fg4ax0cQj9HaaOoLUTBDBdbKU1FUS+3nW/59JNH2zKllFzuCDnEQTv4od
         m3Tj7f9X7A6dSs5nIYrc4Zr99Y1XmaG5dM1LbzJ1ngmSC61VqiqBoMnxGpvoNejEysiG
         c4huhGTXfqPfd1wIooaq5Km43HQrF94hWxtZLnPzzHlbUeu+FjBVPI0r4jjWVFQrraJ3
         HJKvvqRUtPyYPMBQHsb7pOZprAQ8ybg1lekh0MjNXwVqmCWBwzIsPabft/qT7SX0SIDr
         VZAw==
X-Gm-Message-State: ACrzQf0YffOibjk2nQYtyTOg0pg7Fw12vQvTUpUx/TTebj8zNAxs4KC6
        dHX/TYxjeumvx/ztOUqeFvvbpC9XLofml5umZUg=
X-Google-Smtp-Source: AMsMyM4sAP+5pL/221gknuJxd+fEdErxWbLCfFCS1SJ2hLmgH5ebcw4UIZwLovSJ7rf5JxjwtQwu0Q==
X-Received: by 2002:a17:907:9702:b0:782:6b6e:9e25 with SMTP id jg2-20020a170907970200b007826b6e9e25mr20747987ejc.258.1664287044456;
        Tue, 27 Sep 2022 06:57:24 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id m7-20020a056402050700b00457a92f8ad6sm1218961edv.28.2022.09.27.06.57.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:57:24 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id dv25so20816696ejb.12
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:57:24 -0700 (PDT)
X-Received: by 2002:a17:906:2699:b0:781:a473:9791 with SMTP id
 t25-20020a170906269900b00781a4739791mr23280968ejc.644.1664287043807; Tue, 27
 Sep 2022 06:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
 <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
 <20220926163449.380463ca@deangelis.fenrir.org.uk> <CANiDSCuT4TJLDTXR7760wRBn85OQXKKj0z-jPCAW5MXsGMB5uw@mail.gmail.com>
 <20220927135459.7d614076@deangelis.fenrir.org.uk> <CANiDSCvSxtjbs4WogLyRAVALSN+HpCLC15smon3kHMnGqGgN+g@mail.gmail.com>
 <20220927143009.125b8ccc@deangelis.fenrir.org.uk> <CANiDSCtWnKYbrEMBq3sfk6UfmRNzwS1OAuFjQzvFQ5ct9vobfg@mail.gmail.com>
 <20220927144247.71ad1b8f@deangelis.fenrir.org.uk>
In-Reply-To: <20220927144247.71ad1b8f@deangelis.fenrir.org.uk>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 27 Sep 2022 15:57:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCtKTzUs_D1OTwi57B1ssLOSszNbP+oX9q5LTG0PEvt7Ug@mail.gmail.com>
Message-ID: <CANiDSCtKTzUs_D1OTwi57B1ssLOSszNbP+oX9q5LTG0PEvt7Ug@mail.gmail.com>
Subject: Re: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
To:     Brian Morrison <bdm@fenrir.org.uk>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 27 Sept 2022 at 15:42, Brian Morrison <bdm@fenrir.org.uk> wrote:
>
> On Tue, 27 Sep 2022 15:34:51 +0200
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > I am afraid that you need to ask in the fedora forum/ML why they are
> > not authorizing the device by default. Maybe some user reported some
> > malfunction with that device?
>
> So this is not a kernel-related issue? I don't know how this sort of
> authorization is controlled, perhaps you know?
>

It is not kernel related. Every distro handles that differently:
https://docs.kernel.org/usb/authorization.html

Maybe someone on the list knows how fedora does it. A fast google
search shows: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard

Try on the fedora mailing list.

> --
>
> Brian Morrison



-- 
Ricardo Ribalda
