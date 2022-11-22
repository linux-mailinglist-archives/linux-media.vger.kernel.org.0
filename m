Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E6B633BC3
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 12:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbiKVLuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 06:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbiKVLuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 06:50:02 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B3326123
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 03:50:01 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id p184so10705365iof.11
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 03:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uY+PE1zp0HLoJFKsLmIrItqPJJAi5gmvU6X0S4I32YM=;
        b=fJd+OUEEo7yhUJglhlNtPWTOyNMHgwOSnlyR6wM976/O7K/FgDVYq1/T2eW/Ch0y8T
         lYeaTAeJWpP627HlIWYxslxEGMZjknzRypVE8AMMrFctrLA+wxW/XOj5CnX/P+tID6ob
         CodEhA3q2dyrOZPsju29XY4wqwoudju01QZFABu+XT2de8LPdOUteKFCdZ21g1rzTVOw
         nC4JGgzh2Sn2guLB+3SaHqnqIXQGpEsBCESZpc0AiMKxsgjsbPV6Mhc3Orkp1D23DYUa
         ovc8bQf79RUKUu649OrJ9NDBEUMf4Chl0mGrNStc5Lbi+Wsgd5ov4GflaOarwwXD54aq
         TiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uY+PE1zp0HLoJFKsLmIrItqPJJAi5gmvU6X0S4I32YM=;
        b=HzM+RvjY1/tytEX6rN8OEXqkRsF00AzZbmPxxFUChsXu6+rbs3ylm8T/8ZhoaL/ijE
         ofS93pWmeEqht9TtvHaQ3dXdA05Swc1habCFhwAg3P8WwdXPLmu2poXehT9V9y7cITr3
         lP3lSFE+WL4LkC8VYaqs/bo+SXecxijtn5snpWe4rP+7RjbcIkrUmQuEBSzhJZK3MWRJ
         GDZMypDsBV0bHmzwTE4QNKP+2TxzihgxrkYcuSB+Fv8Kyd/rumq+c4qvZVVYsxaiGTs5
         JOwNrN122F0JrpfxxLipyY6TM3lSCKJwD9OIcx4HhGqM+Nbn9kOgzkg9N7eC47LSj9/X
         aWOw==
X-Gm-Message-State: ANoB5pljQgcdrrC6lwJWJ3Jaaa5Ssq/og5k1RSt5fqvCyAf224ANf9MC
        /cgMdenWr800IiooVy9NRb5KcrHvTRWV+3e8RKXBnOx2KHgOMQ==
X-Google-Smtp-Source: AA0mqf7Kww//EoK1uUHu3UYIvIaqzUOmahlR5BfndbdMWvuXglEww7GzgGuAMOob5QSkskjLU2seQ0Nro6zt5yV92qo=
X-Received: by 2002:a6b:4402:0:b0:6c3:996b:5960 with SMTP id
 r2-20020a6b4402000000b006c3996b5960mr1698256ioa.169.1669117801207; Tue, 22
 Nov 2022 03:50:01 -0800 (PST)
MIME-Version: 1.0
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Nov 2022 11:49:45 +0000
Message-ID: <CAPY8ntC4XjhTC5jQd6OZF_6WsS+BLUD1QbxzjKTTLdiSgO2VzA@mail.gmail.com>
Subject: Handling of colorspace fields in image format
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

This has come about from a discussion with Laurent over how to handle
colorspace fields, whether a particular configuration is legitimate,
and whether we're looking at the correct behaviour. You're the go-to
person for that sort of question :-)

- CAPTURE queue (in this case on a M2M ISP device, but that doesn't
really matter).
- Limited colorspace options are available from the device (standard
SDTV BT601 limited range, HDTV BT709 limited range, and JPEG's BT601
full range).
- VIDIOC_ENUM_FMT flags returns V4L2_FMT_FLAG_CSC_COLORSPACE. It does
NOT set V4L2_FMT_FLAG_CSC_XFER_FUNC, V4L2_FMT_FLAG_CSC_YCBCR_ENC, or
V4L2_FMT_FLAG_CSC_QUANTIZATION. (No documentation saying this isn't
permitted, and why have 4 flags if they aren't independent).
- VIDIOC_S_FMT called with V4L2_PIX_FMT_FLAG_SET_CSC set.

Which colourspace fields from the format are applied?

The driver is saying that only colorspace is supported, and [1] says that
"The first is the colorspace identifier (enum v4l2_colorspace) which
defines the chromaticities, the default transfer function, the default
Y=E2=80=99CbCr encoding and the default quantization method"
so we have all 4 parameters defined via the defaults.
I read it that the ycbcr_enc, quantization, and xfer_func values
passed in should be ignored and replaced with the "default" values
derived from the colorspace value (use V4L2_MAP_XFER_FUNC_DEFAULT,
V4L2_MAP_YCBCR_ENC_DEFAULT, and V4L2_MAP_QUANTIZATION_DEFAULT)
Is this a valid interpretation?

Confusion comes from [2] for V4L2_PIX_FMT_FLAG_SET_CSC saying:
"If the colorimetry field (colorspace, xfer_func, ycbcr_enc, hsv_enc
or quantization) is set to *_DEFAULT, then that colorimetry setting
will remain unchanged from what was received."
What is "received" in this case? There is no inherent colourspace for
the device as it is M2M, so does that come back to being default
anyway, or reflecting the OUTPUT queue which might be Bayer and have
no range? Can we still ignore them all as the relevant
V4L2_FMT_FLAG_CSC_* flags aren't set?

Hopefully you can enlighten us.

Cheers
  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspa=
ces-defs.html
[2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-v=
4l2.html#v4l2-pix-fmt-flag-set-csc
