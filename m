Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBB6C9D8E
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbfJCLli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:41:38 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45680 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729820AbfJCLlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:41:37 -0400
Received: by mail-lj1-f196.google.com with SMTP id q64so2310251ljb.12;
        Thu, 03 Oct 2019 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2hb3oZ6qBYZenVNAUBLjwu+KkhMaugCRDxlPNc+K5A=;
        b=NGWKYS9QHRqVrfvkO1Dh1XqZFGKQSGJ2snuNrVQ6ruUsg6QO3E6KMTxpF/MLHe2Z8F
         iVFLCvrfxfsYTTzhPOPc1jrdzY0eNeRkmhsA0hVSx737SLxh6Zv21pK9Ep8bcDn8/unl
         AcgI5gzRaDZuTZhIa/t7Nh+IYxIoz0ll7Fz3cq0O+jeYX1nHByF7MMgtvCUuL8UYuc2M
         SHgACtnpO3nQqx7k3RR6Gkfed57TojRCejjFp98g5tqsQmZ+1oxX4sEfvMIPNjAMpTDg
         VqAU0Txb7s0SJfU7gyJ9qlZYYWP+KgrwUcD1/+NgccwX72gS+wU3I5JW6mq7BgthjPcw
         Gv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2hb3oZ6qBYZenVNAUBLjwu+KkhMaugCRDxlPNc+K5A=;
        b=Ke3fR1QdRc4E2CrdBLUlJr5uLLbksgIVYafAnl4ntm0aCdB/ff8R2m0CSvJ3CaWWIk
         IB8rsUBvySTAm/HG2XjPxyb/kUsIjpuMI2/PMycEc7x6WuCRH5OIxWpITT/QXcx0mEQQ
         vo9brLI+6o6e87O7HkmAmxiGm8c/LI4FpbzOBCUJxMIofozfUdvgaAFTe4szE/ZvzRf2
         OG45BkWWgH/bR/k1jG2n4UUJx+2esDuQeCfEIYMyLF5kP5gHzptyCVvbfZ8hCgXp68Tp
         XwJHGXwF9WpN4ApjaK+8lq4BJsWX2ffo1zf0FSv4iElv1DFauKkWASrEOYRWLTTG2Cpc
         M4Mg==
X-Gm-Message-State: APjAAAVHD9npUnR093gsPG6cUQfbde66b0nYFE1vlosQtrwDgDdFzHu7
        TC+Xkp4nzg15rVmk8spm866Z6+BLW7Cl0f9aqAxh7ad6hh4=
X-Google-Smtp-Source: APXvYqwR0DZpcGJUGfzc5BGGQqG7il/jl2O3LPEb8ta0vebeYBrwyQnzV4d23hbqFKZj1a9pLdCBBOkUoR3u3VdbsJ0=
X-Received: by 2002:a2e:5418:: with SMTP id i24mr5547908ljb.126.1570102895089;
 Thu, 03 Oct 2019 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191001205203.4b1a5fb6@coco.lan> <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com> <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com> <20191003081742.0933264b@coco.lan>
In-Reply-To: <20191003081742.0933264b@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 13:41:23 +0200
Message-ID: <CANL0fFTtHn4ocL4BD4cVKhVzjLhnQ0a45yq5x4MxWAVu-tD8sw@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> It means that there's a firmware stored at the device's eeprom
> (version 4.0.2). When the driver starts, it downloads a newer firmware
> from the file dvb-demod-si2168-b40-01.fw.

Thanks for the explanation.

> Btw, could you please try the enclosed hack and post the results?

Will do in a second.

FWIW, this hack worked:

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..28a3a4f1640e 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -136,6 +136,7 @@ static int si2157_init(struct dvb_frontend *fe)
        #define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
        #define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
        #define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
+       #define GONZO     (255 << 24 | 255 << 16 | 255 << 8 | 255 << 0)

        switch (chip_id) {
        case SI2158_A20:
@@ -148,6 +149,10 @@ static int si2157_init(struct dvb_frontend *fe)
        case SI2177_A30:
                fw_name = SI2157_A30_FIRMWARE;
                break;
+       case GONZO:
+               dev_info(&client->dev, "trying null\n");
+               fw_name = NULL;
+               break;
        case SI2157_A30:
        case SI2147_A30:
        case SI2146_A10:
