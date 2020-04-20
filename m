Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BC51B0267
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 09:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgDTHM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 03:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTHM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 03:12:29 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E0EC061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 00:12:29 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id i27so7211391ota.7
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Hzvxdk0LU2RaTmxEJxqtOkuPAiFDWUctD4XmOi+9gJ0=;
        b=qgSYDpT5ueOkKqOIlrD8KyDeqeb2lLt9ZyMyVSHvBLYu1HAUSFm9x0eaXr30nkYJ/Z
         DHZHIil/vC1K9Az7vzAOwkffQLj695f8eGfyDs8EUkTaTGBd+NpmL49vmZKb0VnyQRS7
         7nod/lkHacuVhYRwSyrP2kkWGIHd9DAPxINPfQj+CyG1F+urtcq1v+rb29SqTFq8DzaZ
         LaPArHIrCuN6GxdzocoF1/DxfYQHi1rp12l6jRQi3rFw05/B+6TNQwHagHYDbi/z1Die
         b5rSHFJYLwjAwHNiR06bs56N+TZczwWfjNM/tGNNKAf0dUrUosMoH1Hrd3dvg8QIhB6o
         rDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Hzvxdk0LU2RaTmxEJxqtOkuPAiFDWUctD4XmOi+9gJ0=;
        b=qy7ey7nksNM8q/KhzzE19e9x47//W2TSh2gqo8VGVXGtVNl4kAyE2y2SGkLkC0YkZF
         b6HMS/Gv+BTGFc7X55ReDI2C87xFdkjZ6InCBmwM0OgTZUxk7J+66l8KHaep27jn3IRz
         n1NGMSUaeHLcOPXvGVhvqeWdguWLORJo84/he9NVvfBOWcryOsx16KeR7duUW8I1zws6
         Y3orw2jrWfMTsuEI7ZqE7arDJevQRFDDtWIssmkrmZNr7MvKhYNcC2KICJRevDNzAaUd
         hM3EiKRv1zXjlGpwDE8thz7NdoU7J8BjSFELqTrqmpkeZMz1mm9oVTQMKlow1DN9sLfx
         msFQ==
X-Gm-Message-State: AGi0PuYcmt/9+wJH+KeznkkNj9Qzn0WA4ONKKseT16NeLfeJLNnxL/qL
        mQR0bdjqjkE7j0gf1WAf2HTx7fEPbadIq9FhssA=
X-Google-Smtp-Source: APiQypKmcYD+TRyOorhWf8R5KaHAhG5xrvRhb61aeeHDu9hJkAzeerX+nb7nLMDGi2rUkrGR7Bet5ldN4FlyoY1eWXc=
X-Received: by 2002:a9d:355:: with SMTP id 79mr8450486otv.275.1587366747579;
 Mon, 20 Apr 2020 00:12:27 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
Date:   Mon, 20 Apr 2020 15:12:16 +0800
Message-ID: <CANTwqXBr5E=PVU6xAeSOB+vScmrjtVTDEHh+HX65uRxy36oynA@mail.gmail.com>
Subject: drivers: media: platform/meson: does there exist a refcount error in
 function meson_ao_cec_probe
To:     narmstrong@baylibre.com
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi=EF=BC=8Call:
when reviewing code of function meson_ao_cec_probe:
In Linux kernel version before v5.4, function meson_ao_cec_probe hold
a notify  reference by cec_notifier_get, when err happens, it will
release notify
twice by cec_notifier_put, does here exist a redundant put in error
handling of cec_register_adapter return value?

static int meson_ao_cec_probe(struct platform_device *pdev)
{
    ao_cec->notify =3D cec_notifier_get(hdmi_dev);
    if (!ao_cec->notify)
        return -ENOMEM;

    ......

    ret =3D clk_set_rate (ao_cec->core, CEC_CLK_RATE);
    if (ret) {
        dev_err(&pdev->dev, "core clock set rate failed\n");
        goto out_probe_clk;
    }

    device_reset_optional(&pdev->dev);

    ao_cec->pdev =3D pdev;
    platform_set_drvdata(pdev, ao_cec);

    ret =3D cec_register_adapter(ao_cec->adap, &pdev->dev);
    if (ret < 0) {
        cec_notifier_put(ao_cec->notify);     // is it a redundant put here=
?
        goto out_probe_clk;
    }


    out_probe_clk:
        clk_disable_unprepare(ao_cec->core);

    out_probe_adapter:
        cec_delete_adapter(ao_cec->adap);

    out_probe_notify:
        cec_notifier_put(ao_cec->notify);

    dev_err(&pdev->dev, "CEC controller registration failed\n");

    return ret;
}
