Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596213BA43A
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 21:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhGBTLe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 15:11:34 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:34151 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhGBTLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 15:11:34 -0400
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.179]) with ESMTPSA (Nemesis)
 id 1M9Ezx-1lt5PX3x5D-006Qo3 for <linux-media@vger.kernel.org>; Fri, 02 Jul
 2021 21:09:01 +0200
Received: by mail-qv1-f43.google.com with SMTP id g15so2752661qvi.13
        for <linux-media@vger.kernel.org>; Fri, 02 Jul 2021 12:09:00 -0700 (PDT)
X-Gm-Message-State: AOAM531z/d2wUtWUF9WnMw7Amrmi5fyc4D/ekkd6b2lJKU9+GpFzQyGb
        COpB8dVdEf3jqAIDZ+GAA2XO6lbZPxiaoLrxses=
X-Google-Smtp-Source: ABdhPJzel1Lr21c8mCoMqSDG+jWYiRERdvxHgtYBO4J0og+BIZ8Cm6tjpOvCyBjzzvh/lHnmIVDeBmOia91fqtjebU8=
X-Received: by 2002:a0c:ba05:: with SMTP id w5mr1249617qvf.60.1625252934844;
 Fri, 02 Jul 2021 12:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
 <3728eeea-1471-ff23-6adf-03fee9bc03d6@selasky.org>
In-Reply-To: <3728eeea-1471-ff23-6adf-03fee9bc03d6@selasky.org>
From:   Tony Houghton <h@realh.co.uk>
Date:   Fri, 2 Jul 2021 20:08:42 +0100
X-Gmail-Original-Message-ID: <CA+GXpVXgWNYgjtnM7C=daShXVwzWJtz=Tg10X_0B-OP-=j1MZw@mail.gmail.com>
Message-ID: <CA+GXpVXgWNYgjtnM7C=daShXVwzWJtz=Tg10X_0B-OP-=j1MZw@mail.gmail.com>
Subject: Re: DVB reliability problems
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     Tony Houghton <h@realh.co.uk>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bu9b7B/44ehXYIjAUB8W4LU6umrctNwtegcbeCnI81d+ioArWEi
 ZepvFsJs7tsO1RkEQJsIo3UcXHgtYaOpbMrKNfp/7oVIkUXH7xBFgYunQwdn6ce0O4n7vfG
 D3InefezwPyP1IpNOHRCoog3wEB9TErvxs31THn/8xHdeFiiz4oSk8CE1E+mpegcflMCyFB
 /tRlE9Hhp2yA3fWcpe9iw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ENULXSB2CTY=:J1qBAuGhdmWj9xgrrgSwxC
 omUcYIWMKBjCPc8cjOXh6eQs6kChxSBsC8H0TUTnpfe4F4PRYcyKhtpEINa4y7nFQNjoHH+QB
 Du+kCWnenGzbCScPxmlB+eSYzsx2B4eiUhSeKp95TA55BFEErAL66HxRmpqaFORYFfkNax+j2
 h8tSo4JyEea1tu5jAhdLLJJXTXq/5VEQM2nKtUATjF8nwKP5aKjnGebhwRpxfQgs3XGeothzp
 viRQzNM26psRZy6laYCjrtpjgcNforMd0dS+lmcMDCkrKIh0zB/xunQMvmZw80Rt0y6G0zc6f
 vGRqAhho6OvHW5PeUIzlm7iig/f/MqzKXFgjOKRh9QtKctMu2RgndCFikha6E/lPfVCR8iu8I
 Y9EjNPnB3s6jTYJZO66kEl52in4wzcPu4FutD/KE/CfBvltMgt5BoTF2lNUDF3DDXkLQr9Ge4
 IKezGi089lwXOXWvd/pSb+AKqCk9TKHIRliXfnUogIe9A4/tjN+wnfsMVwIH/95ks4dIZuI1M
 /Clx0nMYjhQUz42cdhhNKG6vy5BwJG48qIoyr7+BYolNn1bmOzHMZD1bo56qMm3mtC9JMFDp/
 XE8GYQFgpvoEUGiJTTghf8tIiEx0X4TKzhd2fewt8kbqgPczscd+G+VEzrq6FPKjNiXucQJI6
 e/j74jtYgwO0myKg4gmmt6c4DOU7nRbRHyHI88eiTbQIIHk+eaDeW86hTY1UoXElwuiPzGmVX
 N0PWWzoX42DbRrxo3XWyfjTHUvrMAKG5oX3quvd90N09/W54DO36rcR5LRmMR+KQzVn9x3bxp
 uxk7kwjI6s14CAakP2MMAC3fCdoQRmI4deChv+iA9qUzH37Ms5ICZyaBInnVxq8BtpAFwYC
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2 Jul 2021 at 19:43, Hans Petter Selasky <hps@selasky.org> wrote:

> Hi,
>
> I've seen problems with DVBSky USB devices when using the CAM slot,
> typically during bad signal conditions. Seems to be an issue with the
> decoder card. Bought a new antenna, and the problems were significantly
> reduced!

Thanks for replying. I don't use any CAMs though, so something else
must be causing my problems.

-- 
TH
