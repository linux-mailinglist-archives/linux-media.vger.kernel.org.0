Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E661A530C
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 19:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgDKROf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 13:14:35 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35742 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgDKROe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 13:14:34 -0400
Received: by mail-ed1-f68.google.com with SMTP id c7so6280750edl.2
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n2nvjiYKOGeRPIjQC3yHFvlVu+gSqn4ZojhNfsUqnAw=;
        b=CIq02D2Oj8SP+ijXBCRemqsLLM6fsrFGd250Ln+2sqE6oJHEhGGhNmh8XYXvKJpyy8
         B/wdKL50OLPTzhDwb19zVoFP9k/bmqNncSkgWLowbBmvwq73uJpbTZHpD+ZWYuzd7d5P
         qLRgJvKR6fu9tmppPoDscysjrIp+WRxqtViFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2nvjiYKOGeRPIjQC3yHFvlVu+gSqn4ZojhNfsUqnAw=;
        b=L2sdcec0Yb0KrBUDbnQrJqYeNgG6b/5RYCCSysVlpN3b3LFsR5Fja2LfcmjHZdLGni
         QnniKFuxoamk89FanKEloXresBihIS5HM9yV+adO3dcbrzwY4Ty4ZYXT0qaueWAjKbvC
         ayk2ic4+vVLLKyqO3QyIzsFUIY+Wea8CEDRUo4jhDTOudQiK/AR6/HnmLkLrwyRjhs4i
         o8dBjaBLyqzaX9JYsvIgOMNszYRo4st1toKeFmNJNkAz52n2cpabmoUMZonNJ1d4sNAD
         BYu0Uxf2XErvFo+RU1suJcy/SpCAnCJsrnnDBaMqA5R0K3tsqys1NkT3nOUh4hoc+8Ma
         5Kcg==
X-Gm-Message-State: AGi0PuYXukWoVnMP3fhKZO9w3QIpX0nDXnIaptUyL3aV/AzSYTOYW8Ii
        k3n9RzznTtAR7VS7lv6FGd4zfpmwLWxg3Q==
X-Google-Smtp-Source: APiQypJaoLkhOfPgsu5gbNaBbdwaRpftCWGBpPiKwbzZ3N8k2U5FwPp5yrsn3GK9pl1Rh0wYkN8q8A==
X-Received: by 2002:a05:6402:206c:: with SMTP id bd12mr9730183edb.287.1586625273456;
        Sat, 11 Apr 2020 10:14:33 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id cx13sm566744edb.26.2020.04.11.10.14.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 10:14:32 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id f13so5605070wrm.13
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 10:14:32 -0700 (PDT)
X-Received: by 2002:adf:e991:: with SMTP id h17mr10220840wrm.17.1586625271666;
 Sat, 11 Apr 2020 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20181213095107.14894-1-sakari.ailus@linux.intel.com>
 <20181213095107.14894-15-sakari.ailus@linux.intel.com> <8fcfef90-1111-e6d1-e177-d405fe581ba8@linux.intel.com>
In-Reply-To: <8fcfef90-1111-e6d1-e177-d405fe581ba8@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 11 Apr 2020 19:14:19 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ARcobVRmPvDE_DU+=upCzzCYxkOakFDPiwKPRuATKOhA@mail.gmail.com>
Message-ID: <CAAFQd5ARcobVRmPvDE_DU+=upCzzCYxkOakFDPiwKPRuATKOhA@mail.gmail.com>
Subject: Re: [PATCH v9 14/22] media: staging/intel-ipu3: Add imgu top level
 pci device driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jan 19, 2020 at 5:41 AM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>
>
>
> On 12/13/18 5:50 PM, Sakari Ailus wrote:
> > From: Yong Zhi <yong.zhi@intel.com>
> >
> > This patch adds support for the Intel IPU v3 as found
> > on Skylake and Kaby Lake SoCs.
[snip]
> > +- IPU3 driver documentation (Laurent)
> > +  Add diagram in driver rst to describe output capability.
> > +  Comments on configuring v4l2 subdevs for CIO2 and ImgU.
> Hi, Laurent,
>
> We are trying to remove the TODO items. I want get some input about your
> comments from you, I hope you can remember that as it has been a long time from
> last discussion on that.
>
> - Comments on configuring v4l2 subdevs for CIO2 and ImgU.
>
> Does this comment exist for Imgu only? We have a tool which can be used to
> configure Imgu subdev -
>
> https://github.com/intel/intel-ipu3-pipecfg
>
> Please help review, thanks.
>
> - Document different operation modes, and which buffer queues are relevant
>   in each mode. To process an image, which queues require a buffer an in
>   which ones is it optional?
>
> For this item, I will document what is the difference of operation mode and how
> user to make Imgu work, do you have other inputs on that?

Would you have a moment to take a look at the questions above? Thanks
in advance!

Best regards,
Tomasz
