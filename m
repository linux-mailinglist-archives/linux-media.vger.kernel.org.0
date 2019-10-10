Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2783D22A5
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 10:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733191AbfJJIXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 04:23:07 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36758 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733121AbfJJIXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 04:23:07 -0400
Received: by mail-ed1-f65.google.com with SMTP id h2so4655007edn.3;
        Thu, 10 Oct 2019 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=anhRpBXvI8v3QdXNeKQayTUbqgPwfLg3Vpe69FCVDok=;
        b=h8knSetjvpmn2cJvCkCtXRK/uKCu/3nhDZpdwWkoZijRv9r0qce2+GQmnW5t6EVrX3
         2oIRNCzSKX0R0D3Cs+mvYbX4S/h0PY/g6cSLSnjxr+K5gueyJupnRzyYGNgyO/c8+qIm
         unR0L4HP9d7Eun90l8e7PhcSPz+bRn5hfPP6AqqFmn64Cj/tplP9c+fyEXnN3crrqJWO
         4T8xx5fetE6G6DtyDFqSR4WCPZBureozVm52bGBOHKcjvZ/S2sL7mlLTuH5T4VSsJckc
         GEKpcI3f1GsKSssGBW3j46FSF++KmcsrOQU4LZyIQocVhXNuUOiJwXyWGqT+KYbCuPUL
         RfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=anhRpBXvI8v3QdXNeKQayTUbqgPwfLg3Vpe69FCVDok=;
        b=fH+3mc9UBOnBltXjBKzWOgnkvkNM4qGC8fX+PoEMzRu9dBTMRrQqxgZ5LspNzWMB4q
         BUD29DwvF5uWJEypPCntcPoHtmjsAk2yvkjh7gt9R3Sbb/bfmDt2Y7esCts6LWu+sLV4
         dHN1pp78ZWLV832TKueBb+Ln39huZRiGjErzrLs0lxXlVASvi/EnZ7fZu26KjmiFNEEe
         yt0fYQ2wBFJbg+zG+xTWAFAVBjOaqXDnSmZmOPg4khQIDk6NwHkQrAsCUfjLprHn7hQ2
         660XrKpdR5kYamQ/SuWLoJw74J7ziNmG9Nz2dcK1h9qWZuj5dbj19Uz/daq8iiNXkzOK
         8tkg==
X-Gm-Message-State: APjAAAXYJG5Z/9LzdgHbc3ayH4F+1JZFQ6Q/2NQ7x38HPssIi4Kw36I0
        IGZCpjSJIhTsyEhv9pJNI/Q=
X-Google-Smtp-Source: APXvYqw3jjTxLZs5Cpd/5sztCYGkcDqF/URA14DUEE0fKqxoiHlkL4C6Mg0geWmlwYKyFyuQM5Sbkg==
X-Received: by 2002:a05:6402:21e8:: with SMTP id ce8mr7028520edb.32.1570695784052;
        Thu, 10 Oct 2019 01:23:04 -0700 (PDT)
Received: from Limone ([46.114.37.24])
        by smtp.gmail.com with ESMTPSA id b6sm572414ejb.1.2019.10.10.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 01:23:02 -0700 (PDT)
Date:   Thu, 10 Oct 2019 10:23:00 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] media: af9035: add support for Logilink VG0022A
Message-ID: <20191010082300.GA3184@Limone>
References: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
 <9618316567493f917c41109f7dba94e533fbfb4b.1570194906.git.mchehab+samsung@kernel.org>
 <20191009214405.GA3621@Limone>
 <20191009220418.GA3131@Limone>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009220418.GA3131@Limone>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

I rebased Mauros patch on top of mine and this patch [3/4] is the first bad
commit. I believe these lines are the culprit:

+       if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
+           le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100)
+               si2168_config.dont_load_firmware = true;

> From: JP <jp@jpvw.nl>
> Mauro just took the wrong firmware to skip. demod instead of tuner.
> It would not be hard to fix that.

It seems so.

g

