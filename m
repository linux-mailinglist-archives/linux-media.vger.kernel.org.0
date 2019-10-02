Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C42C8CC9
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 17:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfJBPWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 11:22:10 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45477 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfJBPWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 11:22:10 -0400
Received: by mail-lj1-f193.google.com with SMTP id q64so17534177ljb.12;
        Wed, 02 Oct 2019 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iDEPt6fjgHL7+p8ibgn9j5TS7/CiziFdZZ+Jw8P2Ha0=;
        b=eMYu0gZkB0iPQR/AR+ftQCPPlyIKByq4XCOBicKsrFZZKOo7nioQs42tND2dtkyoLT
         nVYnt7maHCx6oo1hqHWfs28hP4YxPlUDzC3H5NLpsY2AqLPSyAWT1avNaDZB2bKCsE6A
         NsrZRPXMtttUwAOqihl+agWqIl4rMHQXyI1eEFpCLCltRvLj5q5kcmijN3dbCfPHAfrV
         NcTO/DC/458btzX59ivDAknuYIgGBgni/Wa233fYgOxkM/8TM28P/pp7ObQ5vHjMxfJ8
         OeLYgmbBwx9NjphaowimrRQONct2ihpJdb8YqwlY3c5BLC6ZTQtcfiM9PNLOz9yU0KMu
         sd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iDEPt6fjgHL7+p8ibgn9j5TS7/CiziFdZZ+Jw8P2Ha0=;
        b=Y0xMNA4+xhvLm0QULUySDcLwJ+gj8ibe3yOXtF9uPaXROZVSwffjBt/OGviMIqUBV5
         O+Txs+jOhvszzQjGuLuY7llSxTo2LXuTUGrZmabh48Et9+heCsiUSsa6oIgrEnwB+B7C
         VYciZo6m1ww3tTi8x+n6S4y8H3/7EXDPiM91LJUYS91HWclOTAqOwwMIUfPhOllDL7LM
         So4hF88nfhdENrpG3cU4OZ+W1dI7IN/9P4L6Bsmu/FVy++pMH/tEGiFRD44n7g6PTkO7
         vl/hHqKATX/Krfcd5LGCjSmb3zE1WlBTRumPqk8rE+fZquYiugJHM5Oll/ZtSNWKgMSY
         bqWA==
X-Gm-Message-State: APjAAAUNcNpPu2g6v1kUfUrVW5/xqXzkKZ+wo/fKCLeOkRXYbp+I75cQ
        azatfWVa9fFzdAJRhSO9RzX2CtTIInJX/zzAQ6s=
X-Google-Smtp-Source: APXvYqyMk83sNBFMSpFJjLyFPbRQRRvRC01LF+1jGIBpgQL9suyzVZ1Ize5PK38bRwRwc1ii6BBum2J0RxeuDyngGjI=
X-Received: by 2002:a2e:530d:: with SMTP id h13mr2770783ljb.109.1570029727746;
 Wed, 02 Oct 2019 08:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191001205203.4b1a5fb6@coco.lan> <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com> <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com> <20191002150650.GA4227@gofer.mess.org>
In-Reply-To: <20191002150650.GA4227@gofer.mess.org>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Wed, 2 Oct 2019 17:21:56 +0200
Message-ID: <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Sean Young <sean@mess.org>
Cc:     mchehab+samsung@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> Antti has some great suggestions in that thread:
>         https://lkml.org/lkml/2017/5/24/245
>
> Also note https://lkml.org/lkml/2017/5/26/357 if you have access to a
> logic analyser.

I read that thread. Unfortunately I'm not a hardware engineer nor do I
have access to a logic analyser, just the device and a remote hope not
to keep my custom 4.13 kernel forever or to have to buy a new DVB T2
device. :(
In the above thread it is mentioned that even the Windows driver
receives the ffff's so maybe it is a hardware bug?

I'd love to see this driver upstream but I have no idea how to
proceed. Any suggestions?

-- 
g
