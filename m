Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A75938EF24
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 17:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235257AbhEXP4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 11:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234328AbhEXPz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 11:55:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF5AC0611B4;
        Mon, 24 May 2021 08:06:33 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id s6so32308035edu.10;
        Mon, 24 May 2021 08:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hYc9RqsGPOFH4b9ZCxZD1i1R6dOMPd4eh7fzqVzT0H8=;
        b=IYggH2+zUrbdnBrdf/jTJBsFvsk4fNzJueTFJWS2wav+i4qdiNx+Cg0ds2JTrtFcJK
         T0RtnoZxttQZp0nj6iOlzrT7rkaHfWvs5EQDRIMjbwVcQDab1kFlwtrzAhAUmNszUMXE
         mlWELyPzvUT5Hwby3Mu+xJRDzQt2R3Dhpe3/qxCxniY/MO4vxeVuu8Gj2tgy9IDFoe9q
         XuiY4wOt76aQ6kgEv9nz8fWdfq2lue434npLku5Ss7xpDFDkllkfdX9CZyAfQxQ+OtsS
         TncgOK/EWbljBM15dTijeALKHyo5V+bt98Jx2zJXFkesK/GaSJ88AfBd+7rTvBLXdrG7
         Hdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hYc9RqsGPOFH4b9ZCxZD1i1R6dOMPd4eh7fzqVzT0H8=;
        b=GUj6USM/ECCiY4t7WeQxefutyqudkF6pIa0EBMdzw+VJEP1avOvoVnQiEjyYt0XA5q
         s68uYuFw9MDTlUc5awaMfFYadouF+/H60X12ND1o/Pt85sGS1R3nWjhmilfsNWy+pktm
         qyMFm6ciSwwj+K4l1EYDCrGw2BgXdMxLaamy1Pv4RZ1C7gd4TsWgdtwdhZw6fH/JhTT6
         lJNZKeOobLfgtQcTZX5M4P0BuoqoKvvfjMrOUlsavzJv9nQ14MYQYrEFPUCDzB93Ul7e
         dkbG+pLSSyn4UooX+u/CcjYxbNGBBCnaMFGci+aLfQodGWGr6eA1MS9idbKbE35iP2Xf
         mDVw==
X-Gm-Message-State: AOAM530LnHVRqjcwx+fW20km5ItWUUX8ZU9fypKZwnZ39p/XnupBGyOz
        Iw1iTNE/zQ/+A/R77VBeDLyjWG5pYHBmzNgW/Xs=
X-Google-Smtp-Source: ABdhPJxnql6m4jMoSsNIXd+822UQ+FgMCyWYYrxYDrZNdFQtMwci4jKmziipZTven+e/600RCUx8aswTUzA0OJJ9xKs=
X-Received: by 2002:a05:6402:4256:: with SMTP id g22mr25643956edb.214.1621868792568;
 Mon, 24 May 2021 08:06:32 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Mon, 24 May 2021 23:06:11 +0800
Message-ID: <CAD-N9QU7T0vb1YaZ_NJfySEGiUsQ1ix6ved6TJKSUBQ+HqO1eQ@mail.gmail.com>
Subject: Is this a bug between dvb_usb_adapter_frontend_init and cinergyt2_frontend_attach?
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi kernel developers,

I doubt there is a bug between dvb_usb_adapter_frontend_init [1] and
cinergyt2_frontend_attach [2]. The following source code includes the
critical part.

-----------------------------------------------------------------------------------------------------
int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
{
        ......
        /* register all given adapter frontends */
        for (i = 0; i < adap->props.num_frontends; i++) {
                ret = adap->props.fe[i].frontend_attach(adap);
                if (ret || adap->fe_adap[i].fe == NULL) {
                        return 0;
                }
        }
        ......
}

static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
{
        ......
        adap->fe_adap[0].fe = cinergyt2_fe_attach(adap->dev);
        ......
        return ret;
}
-----------------------------------------------------------------------------------------------------

In the dvb_usb_adapter_frontend_init, the function pointer -
frontend_attach points to cinergyt2_frontend_attach. Then the parent
function dvb_usb_adapter_frontend_init checks the return value and
adap->fe_adap[i].fe to verify the execution of the child function.
However, the child function - cinergyt2_frontend_attach passes the
allocated dvb_frontend with adap->fe_adap[0].fe, but the check is
performed on adap->fe_adap[i].fe. At the same time, the adap in both
expressions should be the same data pointer.

Please correct me if you have any opinions with the above statements.

[1] dvb_usb_adapter_frontend_init:
https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/dvb-usb/dvb-usb-dvb.c#L276

[2] cinergyt2_frontend_attach:
https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/dvb-usb/cinergyT2-core.c#L68

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
