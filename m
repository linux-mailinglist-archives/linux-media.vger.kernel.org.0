Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC2F10A19D
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfKZP4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:56:02 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:34553 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbfKZP4B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:56:01 -0500
Received: by mail-lj1-f171.google.com with SMTP id m6so13452889ljc.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=F3Jx3hjajdrer3o+IamsqZ48J1ZKIVziaHdpiQk+X8s=;
        b=EavNs2pLGWbt2FhKqFuEYVgHnGudYVe5oI1OZi9SVAEFCwdo9e3kfIGnKjYK7SeYTk
         CkR1M5scjYYpkcvVjKmyE/iRq1SywI3xGsyv6xmgT6GQbs2MjM+LdXcljApFygwX+oQN
         JS2NLXxt2YD5hgTjKVOsNiU4vJcXcmGJU62byE1LmI8BfMPxUs7BQ+PWGGhK5coD4ZqX
         wuIUzGIevXJvlgm62X/SLM+ilDqpWFVMBx3wqN/xFJaMXeMvwdBiAOQpxkv2GyRi16at
         yBbg7dUrw7qXWEbkznI4csrQy3t6x4WOF9CbRJvz2l/7DzmcddvEgutoEEgg5RPL2jBg
         KZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=F3Jx3hjajdrer3o+IamsqZ48J1ZKIVziaHdpiQk+X8s=;
        b=e8eMiO+Kps2YOqnCP2g+uUGMAHUlc5bQRcj2ebAEymD4dy8fNjVIr/BQeETJbJJhPg
         YIJbKlxwiwAvsQCygciuwlHTcTgrGQupxUud1MPD8YRA8d3H41u/8BdO0xhy2rAUXRKc
         XoRzNdzosXcaIVzJsKS5ADE4jxbQZfFqTN2upnsxzj2x1ie77AbYXVVmR6kOwl62I1Dv
         MRqKRw4FfVumbip6UpJCHOgH7vfWGNxx5jpg2R39K1abwpGxrQzRpfBEuJRQZliTnFrc
         2THZ3A1ju11Piu0XcKMbsxGdh+K5sRLG7jCfyQVU47t/IFBi/P3l4cuNfV1nsb3w03fZ
         2hVQ==
X-Gm-Message-State: APjAAAXXz23smJ9DhK7NXfr87jlWhk/9rqUllChAYUgANX1xn1jYDqmR
        i9qZESYr038ZFD2IPBj801R//fYyW5RRcKoPR/B5SzBq
X-Google-Smtp-Source: APXvYqzMbNynIqwsvc3WM81BPBtZW9hYOFzqJRZt8JL3mfXJXiIIImk6A84gUWZ+qrv7xS3CKhP2CUkfOt4dRt4eFtA=
X-Received: by 2002:a2e:9695:: with SMTP id q21mr26320180lji.206.1574783759709;
 Tue, 26 Nov 2019 07:55:59 -0800 (PST)
MIME-Version: 1.0
From:   Stuvart S <lovelinuxdeeply@gmail.com>
Date:   Tue, 26 Nov 2019 21:25:48 +0530
Message-ID: <CAAMGra5wp8o3DAFQdYk3Ky2oaWaNcX-o4gejW7jro5Rm1pkVug@mail.gmail.com>
Subject: TI Deserializer DT node configuration
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello team,

I am integrating DS90UB964 deserializer into my custom board based on
Rcar H3 Salvator XS. Deserializer is connected in i2c6.Also I have my
four serializers as DS90UB913 and cameras OV10635.

Can any one please help with the following?

How Deserializer connects to Serializer in DT node?I came accross
about the terms remote i2c, i2c-mux,i2c-atr.but I dont understand.I am
not using any i2c switches.
Any DT example is helpful for me

Regards
Stuvart

-- 
                        --- Come    Let's enjoy the world of Open Source  ---


Best regards,
Stuvart
