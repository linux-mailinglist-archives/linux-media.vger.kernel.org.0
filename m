Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691E5587C68
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbiHBM06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbiHBM05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:26:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB072613A
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:26:56 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gb36so62580ejc.10
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=e7k1LmrXrO5O++3qxnQhICaCHcTyJhB0/CBDua5eiGM=;
        b=bGmMzq1oZHiJCntDoaRXJndtU8BUZgHXyunag6MusYIqHypSAA63b33xFVFRm7IULY
         dfFYiX7HfprwxMm5jqZDZXBl+CxcURkZBOghwOSR39mMtdQHlPkza5nz4DG2hEr34m7p
         5VaiWiRFSbzi2mijU/Ewr7t07/+qRgv+KsEsqBARwPM4zEXG65m4q5tyt+bHuZcytt8y
         Hwsd+a2/kjdCIZgRtPf6MVEVUHQqkpRXJq9zGZSCtdLiK0egTPf6NAzp+F829+M7vRYk
         fsWIliQfXTi13pKCgL77FG1GndUm9pmQZHkOIVrR3iQ0moqD1HgRNRQQgjdWFrs/Vw4w
         pH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=e7k1LmrXrO5O++3qxnQhICaCHcTyJhB0/CBDua5eiGM=;
        b=hc+buhHDh7nk5F+f9pGDu4ruuOOhwjvuUsuHF5AtV3mhv8uJJZK89vH5O/CmlH5uH4
         NwmVAVbex3K/MNQcSa7E4jSkLiWPcvAT5HCGIlynWE4siSPCWh+FTo2idaiR4V1ZBIwl
         uXfPqyC6BZD/rGt6se4g/uXRzjtRQDM1lS4Br60zl1cLaedKvrQg7DWpe0lqtQcD9OA+
         Mnw3EqYRG5n74bW8BZnbzMrTDFR4zuAdU+hlj64M+asaiJn3b8zXPwavixMnRBsxlJU4
         cWCIkpn61FEgyUAkBkIsiYjlZMi6Z2diiagAzGYmIM7aaKFDIH06OctB1fL6tQk/SOVj
         oOrQ==
X-Gm-Message-State: AJIora8GpB992NCjMnLL20DRp2vAxrTBBVIjrjmkr7K5hYwH4o5qV71z
        U+HknuHfYcxfpKFUY7vDSNpW9gAeTeb7zv7lGHU=
X-Google-Smtp-Source: AGRyM1u9F0Zur0RotvR1h3XoBlxvMxEtyfUKoR6yK4E/vlJRpfLw6zqCyxrbll3pIfbUrMzOuDgzxhf7n72PUE/A7dY=
X-Received: by 2002:a17:907:9706:b0:72b:4b0d:86a2 with SMTP id
 jg6-20020a170907970600b0072b4b0d86a2mr15577953ejc.242.1659443214661; Tue, 02
 Aug 2022 05:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl> <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
 <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl> <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
 <CAHp75Vd60urVv5R+fE+xxqMNJhJSmXZnfJJwU5t-m3E_T+pcWA@mail.gmail.com>
In-Reply-To: <CAHp75Vd60urVv5R+fE+xxqMNJhJSmXZnfJJwU5t-m3E_T+pcWA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 14:26:17 +0200
Message-ID: <CAHp75Ve87Pvh-ZGHA=wK+ex9kq58FusA-p1EtVzdwKO_3MRyOw@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 2, 2022 at 2:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > You are blaming the wrong man here, i.e. devm. The problem as I stated
> > above is developers who do not understand (pay attention to) the
> > lifetime of the objects.
>
> That said, the devm has nothing to do with the driver still being
> problematic for the scenario you described, no?

And the cleanest (at the first glance) solution is to make v4l2 to fix
this bug by suppressing unbind attributes when the device is opened
for all v4l2 subdev drivers, and restore it back when it's closed.

-- 
With Best Regards,
Andy Shevchenko
