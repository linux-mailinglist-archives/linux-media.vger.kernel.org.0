Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9FDAC9EFC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 15:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfJCNCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 09:02:32 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45981 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCNCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 09:02:31 -0400
Received: by mail-ed1-f67.google.com with SMTP id h33so2334294edh.12;
        Thu, 03 Oct 2019 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8r5WxxOeOXTyhjGVoA0FbOjfJLtO+yGrerZ8PuIaYmA=;
        b=seYrPpfa1oOXQgrqfHF2tePaGXgom357i9t/5fcs7p3yIcJoYEH7i0PeS5YC8iknfw
         0/vh94UAO2wTa4TQ+z9T1U2M5iBFmzv4Z2eYeug/ui68fVsT2in8OVzMYI9f7tU5Gi4B
         7EVSSbLo8Rf6PGknwi1s9/zhQs/04mKwrUzGVn/uyCl9ZcmKOHElQPMNRo0dpVvpw0ab
         32lVpELTlxpqOYCLlmmyemJURZCy0xJz0uYsosJvUatKNmPD6CaCNdoxCb9FS0vQVa00
         f7UffWZU2h4aWFtjEV1x6R4Vo+OW5bWWuSvzfpxRdPvNpUCqKalR4m2+b0c0XSc+VRGm
         B8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8r5WxxOeOXTyhjGVoA0FbOjfJLtO+yGrerZ8PuIaYmA=;
        b=b2NYlSApuVnFM0E0LMg5bgavd63kxqabrA3WiSecXUeNsyKSetZwpmdDkckTQ33Pn+
         4beTcFuaemoL6u1ZmmEs/sz9bhv0b1vRhFVX5guY00z+x4tO+D3TUGos4rcBWuCA4zz5
         L3sLriqIEl9lLNOZYoh1iAljZD6tTIJJlfBzLG2ngjKT9RaP343ZI0yPGgUBWJL0b175
         KdlaSnRpx8U4x+bgxK51KcptRh1jZKJv2xu+3Tkv1YT9V9T2m1/toorVH/wcp72PJxGW
         djsPyb0vwO2IwoLPATJeKfKQXaQ/i6mMcVULThLqcC8+JMzoVdscJdQD3uYu4eV8aIR6
         CiOg==
X-Gm-Message-State: APjAAAXciF2T/jzkYO2Rv0IZaWv6L9gbAjT+uZ52EX+6wuaeZW/TxRf3
        tzcKbXuO3BUWrXiXM8a1KJw=
X-Google-Smtp-Source: APXvYqx2IAKglMxnqKNvUPxz71FVzHMHHQooHceUpTXrz9+Op0nqMRrYn3aAwnTnekCDdHr8WMLUzQ==
X-Received: by 2002:a17:906:1f57:: with SMTP id d23mr7735574ejk.103.1570107749938;
        Thu, 03 Oct 2019 06:02:29 -0700 (PDT)
Received: from Limone ([46.114.33.103])
        by smtp.gmail.com with ESMTPSA id q33sm460603eda.60.2019.10.03.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 06:02:28 -0700 (PDT)
Date:   Thu, 3 Oct 2019 15:02:24 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003130224.GA2596@Limone>
References: <20191002150650.GA4227@gofer.mess.org>
 <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
 <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
 <20191003081742.0933264b@coco.lan>
 <CANL0fFTtHn4ocL4BD4cVKhVzjLhnQ0a45yq5x4MxWAVu-tD8sw@mail.gmail.com>
 <20191003094904.3aa5fdc7@coco.lan>
 <20191003095237.2efa0e7f@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003095237.2efa0e7f@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 
> Maybe something like this would make it work?

Nope. :(

[   47.371022] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
[   48.632824] si2168 1-0067: firmware version: B 4.0.25
[   48.671268] si2157 2-0063: unknown chip version Si21255-\xff\xff\xff


g

