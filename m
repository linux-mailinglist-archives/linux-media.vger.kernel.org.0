Return-Path: <linux-media+bounces-23472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340A9F30F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68371887DE8
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DB2054F1;
	Mon, 16 Dec 2024 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gngDDSo1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842591B6D10
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734353625; cv=none; b=mKAWamjQa7f9ETPpfZXKLtsPE/vSwWE6avofo+2Z7d0y6pVVGG3425KDbf/77edcCZp9DFRB8WRcdrKg4AReFa7oln5XsusvxFW3b5PNPXcMrc3xtfokXcmzoKdEl8dV5hr6g/4lISJff3RlyOC+3ON8kIeWD8xjdQiLTikdTtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734353625; c=relaxed/simple;
	bh=T7Wwfx1tUs3V5AK28AwP6Qn21ivu3vyqtazzd49njwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFS/CU719Q4Zf6vuEwuDGbouf5ftFAoXAT5lbAz5ucd6XLhff5KwWu0VHCnP3XS7ATviCKj0q2uta0XBq2osXzStlATy8WuB+D5SAOhq0hzIiBBwu9op83R/1avHlb9qlx15oWcgJQDV5F9kePwO7EluPZGwda1l9BWMcC1M82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gngDDSo1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166f1e589cso41451725ad.3
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 04:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734353622; x=1734958422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYfL5DJPDY/75MCb2BkSsg1gUj+RZOTJbSEaVtCOmQA=;
        b=gngDDSo1O5Wxc46QhyStTsRPDs/ZOmJZ8AruUzHgcAkptpug+gAJmwy9RqEtu6M70+
         GZkh6tCuol79BdGJ+ZWv6CAMsnhPeVBR9QniM+NeTucgcwwdAf8rvplXrU3OMTIJA6h+
         lT4ObaMT12e6KoKoWGNi2PfY5qcpljPwGxr+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734353622; x=1734958422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYfL5DJPDY/75MCb2BkSsg1gUj+RZOTJbSEaVtCOmQA=;
        b=BvkTWEb4U2HcwzJmlGibRumw+jmoZfZwmvQnVfSC5lsYcE2fb/dDp1YjBl1hcbqYqw
         VIpO9cB1T7s41HUvQAImT03DN9tUe8rqIYlP/bOSZE2UCQNHHhPzdPhF/mhMzexob1Wb
         7+zSeuAFN3tvCbCR4JdPS9n63rUFK9lVWTgbmNDBeh2bx1aLMXSwyUQe4ZcQH17NFuW2
         j6PDnfqZ7rKeCqzyDXEZ4IRjXelUuPtYcJoAcVlFohLb+aO+uftdHp2QNj6XMlDBKmjL
         QZnUAbMp5WGEsBwmJ4fUbvXRSHLoJH5cUA/7ZEHUd/+GekO18zL3NlSmJOv8NDkPX1di
         Ibvw==
X-Gm-Message-State: AOJu0YxDaM1ccDOa3v3/e/7osuSb5PF2XhwZL8Ldd8yfO8xppI9L82T8
	eFmWR4IrrZ78ZDfkGXQDg8VnQz+S+xNeT/E+o9/eEyCPu3aQMcaaa/u9hhzM9q04E0yvcVN4bu0
	=
X-Gm-Gg: ASbGncugaT0I+auzEKmwm6rKH6KacPg5yQ+AQkSHte1E3yTcXU2/B3089tVaDmTl11T
	bouTfKOYJW7ZWYoXBvgJTKXWDGnutwUCNW2nWwelWY1tCkPmF3T9BbRogqiBKcl2qghaEo1KIsy
	ZPo+SdJUh0+Uu+tphM+zqBRyQZKksh7pDyfZAUxZLRxoKsxewOg2iwar3SKTAYAk1PJ3eboNWk8
	k1novoP3VtNGKIpBDa2JlxjhUsS9IeuU7OAf5kdBqLb0VGTKAhviuecssgRCEsPrMVzIdJa4oZE
	7uzABJizTmgT0sTJauv4NLo=
X-Google-Smtp-Source: AGHT+IEzUbV5gisAW2dk4Gx6w5qACBKfcJZyspBnli5LvRf5rsN4ua4jJY5JqVw2w09tqfqez3tUZA==
X-Received: by 2002:a17:902:eccd:b0:216:7ee9:222c with SMTP id d9443c01a7336-218929f2129mr160181745ad.7.1734353621900;
        Mon, 16 Dec 2024 04:53:41 -0800 (PST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db5e10sm41843255ad.14.2024.12.16.04.53.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:53:41 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd2ff40782so3575250a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 04:53:41 -0800 (PST)
X-Received: by 2002:a17:90b:4a01:b0:2ee:b26c:10a0 with SMTP id
 98e67ed59e1d1-2f2900a2bbemr19476619a91.24.1734353620665; Mon, 16 Dec 2024
 04:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <qiDpaTpmUiihs32PnSJ5OBrVm201qlAyraYycyW8Fo72UIcSkWQ2FgQPnddO_56Euepf508o_SsViFu1cQiSHlgD06m2rdnoqQvEeLe7NZo=@brettrd.com>
 <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com>
 <QZMkPVqtorkeIbj5BHOKAfQE7IJHh6Shg3K9xKeg4d6t4wPI7o94SkiH7znorWctNAqQ4Pr4jZhq6nPQjAk0GprUjcYqknpmVXwne8-H094=@brettrd.com>
 <CANiDSCspg89eRXB__MA9ZgxeweHku15UbbYvZxp-M51i8fy+bw@mail.gmail.com> <2gLJ1GFY4lqGOI89FNSzY1W2GK3DxficwvGTOrUq9XvD3ylcaizngXTreToZwVBYedhI970yNSfQ28QFTHb5ZZS7lkV0X6QXUzU7UdxuAZ8=@brettrd.com>
In-Reply-To: <2gLJ1GFY4lqGOI89FNSzY1W2GK3DxficwvGTOrUq9XvD3ylcaizngXTreToZwVBYedhI970yNSfQ28QFTHb5ZZS7lkV0X6QXUzU7UdxuAZ8=@brettrd.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 13:53:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCuwk=r-ChrqpAqFW9TzE2h7xAO9htsyGBif5inupc3iYw@mail.gmail.com>
X-Gm-Features: AbW1kvby7Id3aMNoeQOThn4NSodrBOhFIeZRtrLvB-9G9TUpRzz0VWlTfHJyv3E
Message-ID: <CANiDSCuwk=r-ChrqpAqFW9TzE2h7xAO9htsyGBif5inupc3iYw@mail.gmail.com>
Subject: Re: new UVC thermal camera vid:pid and quirk
To: BrettRD <brett@brettrd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, 16 Dec 2024 at 13:49, BrettRD <brett@brettrd.com> wrote:
>
>
> Hi Ricardo,
>
> Thanks for following up, the patch did compile and work correctly.
>
> Unfortunately my mail provider doesn't get along with git, so the attachment on the July 26th email is as close as I can get to submitting it.

Have you tried this ?:
https://b4.docs.kernel.org/en/latest/contributor/send.html#authenticating-with-the-web-submission-endpoint

If that doesn't work I could send the patch on your behalf

>
> Cheers,
> Brett
>
>
> On Monday, December 16th, 2024 at 11:41 PM, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> >
> >
> > Hi
> >
> > I was going through old emails... have you made any progress preparing
> > the patch?
> >
> > Regards!
> >
> > On Fri, 26 Jul 2024 at 07:24, BrettRD brett@brettrd.com wrote:
> >
> > > Hi Ricardo,
> > >
> > > On Monday, July 22nd, 2024 at 6:15 PM, Ricardo Ribalda ribalda@chromium.org wrote:
> > >
> > > > Hi BrettRD
> > > >
> > > > Thanks for your report.
> > > >
> > > > Do you want to give it a try at sending a patch for the device?
> > > >
> > > > It looks something like this:
> > > > https://lore.kernel.org/linux-media/20221101-easycam-v3-1-2c9881a7a4f7@chromium.org/
> > >
> > > I'd love to, I'm still reading up on how to build modules under Debian
> > > A first attempt is attached, I'll send it standalone once I've tested it.
> > >
> > > > Make sure the vid:pids are alphabetically ordered.
> > >
> > > Thanks! I wouldn't have noticed that, the struct is inserted in vid:pid order
> > >
> > > > Regards!
> > > >
> > > > On Fri, 19 Jul 2024 at 07:55, BrettRD brett@brettrd.com wrote:
> > > >
> > > > > Hello,
> > > > >
> > > > > I have a device not listed among the UVC supported devices, '2bdf:0102 HIK Camera', It's sold as a "mini640" thermal camera.
> > > > >
> > > > > It needs the quirk 'UVC_QUIRK_PROBE_MINMAX' before it runs happily under gstreamer using v4l2src, no errors for all reported resolutions.
> > > > >
> > > > > Attached is the libusb output from it, and the v4l2_compliance report generated without the quirk applied. (with quirk=2 it reports no failures)
> > > > >
> > > > > Thanks for a great driver and documentation
> > > > > Brett
> > > >
> > > > --
> > > > Ricardo Ribalda
> > >
> > > Cheers,
> > > Brett
> >
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda

