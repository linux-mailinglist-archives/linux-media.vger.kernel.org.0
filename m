Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A58E33CFD4
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhCPI11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:27:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37863 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234782AbhCPI1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:27:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M52gl0b6T4ywlM52jlAEdG; Tue, 16 Mar 2021 09:27:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615883230; bh=SK//TJeKZZqCTdVtCweP5Ojk9og1PzK5n/CaXENhwA4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UGFR+XZDGpsskxFwHshrd6koI6MW2DggZ/bfFDfsGQCuroKsacRk5Gu3mU9Vw3Ccb
         LBrYh2CNpOniKAVhaBvSj7FxewQfowcalR2B4UC6EBI7HYppSvLh+43uP0vUNp/AJ1
         FZrrtCY7Q4WQYIlW3DAMNTbUgs2EhAcuaIqa6xcrkDrh9k1jDW+Lqtz+3K0ciExfEZ
         +eHbCk11egAoxszrXOl4GYkqmU/7LXcpkQ0QLCrPil0u6Yd0DjgfnpADtVNXekbHMr
         HQQcs0P+jk4wHI7skC2sqt6+sU24XHIV4NmOD/yTqG5Ecl0GfwochDZ1HqyRue2esZ
         VDRhfrkCuoksg==
Subject: Re: [PATCH] Rectify spelling and grammar
To:     Xiaofeng Cao <cxfcosmos@gmail.com>
Cc:     gustavoars@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaofeng Cao <caoxiaofeng@yulong.com>, mchehab@kernel.org
References: <20210311072044.388-1-cxfcosmos@gmail.com>
 <126298ca-15c3-22f8-50f5-b7bf4cc281ec@xs4all.nl>
 <CAHHmPVFHkgGdo6C+FYBo+jsH=xzpnEUgGs7bKT6=MQFhZC-N1g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d9899157-99f3-6382-8693-8d1eb2dcaeba@xs4all.nl>
Date:   Tue, 16 Mar 2021 09:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHHmPVFHkgGdo6C+FYBo+jsH=xzpnEUgGs7bKT6=MQFhZC-N1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHgsxrDn00l8/eE0J4+bnKgDJrNpJFOYtKHRpRyF9TJpK0AQXwzF5SMXi34scTCQLOH0+gy0wF3G66+gQDmDP/wOds0T3vjN2au/5epvUzXnthnTJXTd
 ABrNLTDI8jGomA1FSHVGzeUjmt0rXX5ojdFvxgBBE4fVozD8uZ4KRNZDncGFRvKogyecWgzkgtOW8cYG5hhHwMf1zBs1ZnymRGdPkuF/ElJiDBHenwt4wtH1
 dOg2zoq7gcMVCxY37mZDsVMShCLUM7UmLSyqd2kSEvKWmxwFEbRnMv9NUZ4ql8Ar9pagtG8qFaRWYz+KMsUqfW+c6/F6v2xzruF69PaoRaxC1gvu70AP7jPx
 XZS8xuwDgZCWwAQrliR/sr+hT/Cy6GbxN1pStYQ3m/jXjOk4RyFqZYIy33jtNswgPLE88/Ly
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 09:16, Xiaofeng Cao wrote:
> Hi Hans Verkuil,
> 
> I'm sorry to make you confused. Please use Xiaofeng Cao <caoxiaofeng@yulong.com <mailto:caoxiaofeng@yulong.com>>

Thanks, I've updated this to keep checkpatch happy.

BTW, for your next patch: it is good practice to add a prefix of the driver you
are patching, so:

[PATCH] radio-si476x: rectify spelling and grammar

That way we know in which driver the change is.

Regards,

	Hans

> 
> Gmail.com is my personal email while yulong.com <http://yulong.com> is my company email which is in trouble when communicating with the
> Linux kernel.
> 
> According to relevant regulations, I have to use the company mailbox to indicate company information.
> 
> Best regards,
> 
>     Xiaofeng
> 
> Hans Verkuil <hverkuil-cisco@xs4all.nl <mailto:hverkuil-cisco@xs4all.nl>> 于2021年3月16日周二 下午3:45写道：
> 
>     Hi Xiaofeng Cao,
> 
>     The patch is good, but scripts/checkpatch.pl <http://checkpatch.pl> complains about a mismatch:
> 
>     WARNING: From:/Signed-off-by: email address mismatch: 'From: Xiaofeng Cao <cxfcosmos@gmail.com <mailto:cxfcosmos@gmail.com>>' !=
>     'Signed-off-by: Xiaofeng Cao
>     <caoxiaofeng@yulong.com <mailto:caoxiaofeng@yulong.com>>'
> 
>     Which is the one I should use?
> 
>     Regards,
> 
>             Hans
> 
>     On 11/03/2021 08:20, Xiaofeng Cao wrote:
>     > Change 'inaccesable' to 'inaccessible'
>     > Change 'detrmine' to 'determine'
>     > Delete 'in' grammatically
>     >
>     > Signed-off-by: Xiaofeng Cao <caoxiaofeng@yulong.com <mailto:caoxiaofeng@yulong.com>>
>     > ---
>     >  drivers/media/radio/radio-si476x.c | 6 +++---
>     >  1 file changed, 3 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
>     > index 23997425bdb5..b39a68f83c5f 100644
>     > --- a/drivers/media/radio/radio-si476x.c
>     > +++ b/drivers/media/radio/radio-si476x.c
>     > @@ -152,7 +152,7 @@ static struct v4l2_ctrl_config si476x_ctrls[] = {
>     > 
>     >       /*
>     >        * SI476X during its station seeking(or tuning) process uses several
>     > -      * parameters to detrmine if "the station" is valid:
>     > +      * parameters to determine if "the station" is valid:
>     >        *
>     >        *      - Signal's SNR(in dBuV) must be lower than
>     >        *      #V4L2_CID_SI476X_SNR_THRESHOLD
>     > @@ -255,7 +255,7 @@ struct si476x_radio;
>     >   *
>     >   * This table holds pointers to functions implementing particular
>     >   * operations depending on the mode in which the tuner chip was
>     > - * configured to start in. If the function is not supported
>     > + * configured to start. If the function is not supported
>     >   * corresponding element is set to #NULL.
>     >   *
>     >   * @tune_freq: Tune chip to a specific frequency
>     > @@ -917,7 +917,7 @@ static int si476x_radio_s_ctrl(struct v4l2_ctrl *ctrl)
>     >       case V4L2_CID_RDS_RECEPTION:
>     >               /*
>     >                * It looks like RDS related properties are
>     > -              * inaccesable when tuner is in AM mode, so cache the
>     > +              * inaccessible when tuner is in AM mode, so cache the
>     >                * changes
>     >                */
>     >               if (si476x_core_is_in_am_receiver_mode(radio->core))
>     >
> 

