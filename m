Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3252EAC38
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbhAENqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbhAENqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:46:52 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590BDC061793
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 05:46:12 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id l11so72739547lfg.0
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Au1IY+v2KNVtCRXjZBL6iRH9Z3DyqaQULdyE+hkZy8=;
        b=o/01AhY2Tr3A/GrVC12LywctlEE44xSi4F+ys5FkkWmMYFnCkfIWlMQnHSDM3C5crV
         w/YZwR45Q9faGjbysy8H67KmK1+3ZIZwAjeKhwO8+rcBX7z1DJc6sWBXY5zRs7NfESdZ
         2KzDI284MXGsNbTIONqotqioeOqhfzauhTyE+a3VoCFThcm6rjL++A6QR2QAA1oFTU0F
         QZmDr0Odr6fuwIyarF8svsPwTh1df5JBgI8iDiUMr/ThlNjSlvYMuXI6RcEHrkae0Qgs
         Die170uVgSTa8xD0JRrz71r/eGNSGzGS2L4poR0O92rPqXrlVZ8i+dsMfkfMMqaOQaBi
         A3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Au1IY+v2KNVtCRXjZBL6iRH9Z3DyqaQULdyE+hkZy8=;
        b=bbtUbJINuY655+cgWST5Pl4LWw780zeBlMDa32MYSgBvsthnuHRGKMoMBfkGYex6jE
         3xq69dr2V8kha+78ktt8YRSzFGm3miyg1dbB/m0QXYGbbdc2IUBq7GtQceuTVuaIAJpF
         7mmAAKhKABYsye7Mt8msSq1MkatOqe9wW2dmbWgE2jAcuquwRgGAbx+iQvxcgxBP23rH
         kr+P8JLumHu09OIJhI89rP2LbHX0RaWuCEubk+8jH/9fgddTrMfYwvZU2dBOYCXtcr9x
         qANCvJv0W6MJNluTn0U49qTSvYtFNwvPM57wwxCdkofwbywdrompEkhhrQw4gUJkjx4K
         WKRw==
X-Gm-Message-State: AOAM531X6fX3q+1Ow75cxb1c4cp1NLEIJSxnGBmFCtC1GWS8uTqKAEfm
        HSLMNCxJbslblUA388CJSrAFdf/zn/o3f/KPSCg=
X-Google-Smtp-Source: ABdhPJwXzZ5UP6ctRLUsrA0rjehLeUz5cqSbkjauJ+N7xOPyNNo1+ARLb1r7ePHajdaXoFgLvvbmwwaNS2UteerkPpk=
X-Received: by 2002:a19:d93:: with SMTP id 141mr35886706lfn.229.1609854370919;
 Tue, 05 Jan 2021 05:46:10 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com> <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com> <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
In-Reply-To: <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Jan 2021 10:45:59 -0300
Message-ID: <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 5, 2021 at 10:19 AM Fabio Estevam <festevam@gmail.com> wrote:

> I switched to the same 5.4 you used just to make sure we are in the
> same codebase.

Just tested against next-20210105 and the original warning happens and
csi is no longer probed.

I am using the same dtb that worked on 5.4.84.

It looks like we have a regression.
