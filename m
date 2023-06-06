Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC84724E55
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 22:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238349AbjFFUyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 16:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239579AbjFFUyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 16:54:08 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDFF1707
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 13:54:07 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-75ea05150b3so247784785a.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686084846; x=1688676846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oNLiu3lpetJDNcs5sUzSXLLHYt8MsBkdpSw7dEBSuY=;
        b=NutTbyXGPvVZIvtaeqeqAVKvPJE37kiZJtfmH+Sl1zPvUKJdoeQ3VaMHXAgZj9hLhZ
         orAXIVNGpiYUzC9Ik7gfN0KaiE0mN2NB/RD8xl8jxxDZ8bTez/uzJtx4lPYDnDxkAM8H
         35TZrpLpbCEY5C5NrpS+6hCGg3B3vLjGlc4hac6pL29ECvpO3FPmxFFbAfXrD4Sf6EXg
         /JPwuS8L68dzwnHaZPtWEL1y8fkd+Fo5UJINWOxmmVyWcnIe2GxUE+x0UwI7AlDwPI7r
         PNTnGzmIjmx+PMZh1Wl28rn2d8ed1pa02maL9sKkVu/U4du03jCi0987zPRTj9F98ZKJ
         Tfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686084846; x=1688676846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oNLiu3lpetJDNcs5sUzSXLLHYt8MsBkdpSw7dEBSuY=;
        b=kuQk99nmCQwu38pK3Cghw8GcIopOQvJrG4Hcx+MJbu5r8EttLKWCGLEZP1fx8DO7rX
         cK6M50kLwmG+NE7Mqms+H/kVzNw/X1C3xpsQWp+eBiKldAoPlGmqA2aDYZkvRhXmqXCc
         63tZjJidNwtiSdaMhArQQVIEnMhaKhWuGCZgYhaWiliLqaqSjMI5b/6RmDdsJZ57plK7
         pxviZbut1lVJeH9QO1ofyPEvvIK6qiR+DsAFeETzsGhZ5ZfJ0a9N99A2y9QC2mlBI3Po
         oLiftp06i/9COlTmXdUqN/E0d9dnv74Frdf4+7W11kGKbZOqwIP7DhnVfgdOrGaHHxsL
         qmvQ==
X-Gm-Message-State: AC+VfDxOHTS7QFMgHKdLsTa1fPXS29G3Z48Rz9UWs/fbOEOKvwYd0tPT
        CY8AHG5d0WFILsVWe/qai0zx2eMxvby7t719us0uN+bK7Z0=
X-Google-Smtp-Source: ACHHUZ5REEsy75AsvlrLJdV62JvCHLaOei7lsYcdzX8driR0tOOGR10IsB5tLoJCOvSC/j2bZOlDDp22o2dtLgHw1wQ=
X-Received: by 2002:a05:620a:8acc:b0:75b:23a1:8317 with SMTP id
 qv12-20020a05620a8acc00b0075b23a18317mr1193390qkn.18.1686084846081; Tue, 06
 Jun 2023 13:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230606165808.70751-1-hdegoede@redhat.com> <20230606165808.70751-3-hdegoede@redhat.com>
In-Reply-To: <20230606165808.70751-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Jun 2023 23:53:29 +0300
Message-ID: <CAHp75VeqeA4GA0_r_KgH0wv0_TQ4rQUdTY99DFFR_oWfdiDxfw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: atomisp: ov2680: Convert to new CCI register
 access helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 6, 2023 at 7:58=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Use the new comon CCI register access helpers to replace the private
> register access helpers in the ov2680 driver.
>
> While at it also switch to using the same register address defines
> as the standard drivers/media/i2c/ov2680.c driver to make merging
> the 2 drivers simpler.

...

> +       cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_=
0a, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START, sensor->mo=
de.h_start, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_START, sensor->mode=
.v_start, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END, sensor->mode=
.h_end, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_END, sensor->mode.v=
_end, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
> +                 sensor->mode.h_output_size, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
> +                 sensor->mode.v_output_size, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_TIMING_HTS, sensor->mode.hts=
, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_TIMING_VTS, sensor->mode.vts=
, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_X_WIN, sensor->mode.h_output=
_size, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_Y_WIN, sensor->mode.v_output=
_size, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
> +       cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);

I know that &ret thingy was discussed before and Laurent is keen to
have this, but has anybody actually tested how bad or not at all the
code generation becomes?

...

> +       struct device *dev;
> +       struct regmap *regmap;

Isn't the same device associated with regmap? If so, one of them
probably duplicates the other.

--=20
With Best Regards,
Andy Shevchenko
