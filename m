Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC4F51E0FF
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 23:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444405AbiEFV0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 17:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245548AbiEFV0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 17:26:31 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBDF6339A
        for <linux-media@vger.kernel.org>; Fri,  6 May 2022 14:22:46 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id be20so10022033edb.12
        for <linux-media@vger.kernel.org>; Fri, 06 May 2022 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4DqGKTfv1ZP0XLzd4rSSr60o67crD7bv7TUM0cUdCwU=;
        b=DBj8prj+8RN4UUUgS0pQ8d/hxNVxW1rgoCelSh5Ayq+O8qwS+yt/YNnJphKeyrtr1u
         5u740oXOxMVgtH11g13dUclev9V0q0GzogkP/YDZiFOQbt1qL4OfOJbBC2MAgdMHsiXO
         Qw8qHeEbHay8e166dA5lmoNF0emMld5UH77Tk70RqseUTwSykhV26G92kRme4dw1t1x3
         HY+OpvEE60OkCfz+0L1HG4a21ucFNM/2ZFjb2dnajY/OtgEZwF7/8nZMcvaAVPQvdPhf
         zl85KD0obG2zPejS/mzeynqLf6nrdwQpc6oGRjWe7OVjv2DzWoGJItH1BxDU2/DFkp9z
         esfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4DqGKTfv1ZP0XLzd4rSSr60o67crD7bv7TUM0cUdCwU=;
        b=aiM4urqTLVNXsBWCk7DjYetNJSDM06BbJutdC7DhYfyhjoDEERGAGq+2FwEGpD4Zyo
         YXp6HEzJie+wERon5Erh1j/rDo8VRdHSSr+6V+vflOrHXCmitYS38zBUcFI4RqqQTwQl
         mZ0KFy8j2k/CDdVf/FHuFPLlhxKC7lsvKI4uKdGarS7ekfsv+CR3yhczg4IBFlVBg4NF
         m96RKWNemBgBUbvww1lp76E0pwkUXHPRrM02bwSYZDu0LjNcTHgpQyX724f7SGgjGgch
         7F8swM9Y+12DaK6XR8kYA0frjV4175A44dY2pmHYvvHFV/5f7IfMP+/dVQEh73hl2Db3
         rTZQ==
X-Gm-Message-State: AOAM533AiECWq135DY9dCyxfda5paY7DWqOrC+WuKT7MVAZSGJ+B8qQv
        T3RpAbjcaM6G+JuOkjTKWSt+1ghV38Ed0q2ZAqw=
X-Google-Smtp-Source: ABdhPJwuxUUWF1ncK1lznFN2bVnheYwT7zKwzJ7ruy3CeypiSAfI3gCNjl4s7qcKsjpG9rEp1YXa/DKEjKqul1rNtTg=
X-Received: by 2002:aa7:d350:0:b0:425:e029:da56 with SMTP id
 m16-20020aa7d350000000b00425e029da56mr5623322edr.296.1651872164695; Fri, 06
 May 2022 14:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220504223027.3480287-1-djrscally@gmail.com> <20220504223027.3480287-16-djrscally@gmail.com>
 <YnOnl51UTkg28/FW@smile.fi.intel.com> <b821fcf3-1d4c-f1e5-8b3f-72ee4cf1397a@gmail.com>
In-Reply-To: <b821fcf3-1d4c-f1e5-8b3f-72ee4cf1397a@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 6 May 2022 23:22:08 +0200
Message-ID: <CAHp75Vf_E=_6fCAB695+uARuKk4ErFiEN9ZCo1jN=7Xch82kbw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 6, 2022 at 1:46 PM Daniel Scally <djrscally@gmail.com> wrote:
> On 05/05/2022 11:31, Andy Shevchenko wrote:
> > On Wed, May 04, 2022 at 11:30:27PM +0100, Daniel Scally wrote:

...

> >> +    u8 vts[2];
> >> +
> >> +    vts[0] = ((ov7251->current_mode->height + vblank) & 0xff00) >> 8;
> >> +    vts[1] = ((ov7251->current_mode->height + vblank) & 0x00ff);
> > __be16 vts;
> >
> > cpu_to_be16();

> Most places that do this seem to do the conversion in the i2c read/write
> functions, so in this case within ov7251_write_seq_regs(). Can I do it
> there, as an extra patch? I actually have more changes to make on this
> driver but they're not remotely read yet so there'll be another series
> in the future

Ideally you should first convert them and then add your patch with
this change in mind.

> >> +    return ov7251_write_seq_regs(ov7251, OV7251_TIMING_VTS_REG, vts, 2);

-- 
With Best Regards,
Andy Shevchenko
