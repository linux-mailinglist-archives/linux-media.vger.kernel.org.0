Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF111DCC94
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 14:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgEUMF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 08:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbgEUMF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 08:05:27 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C950C061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 05:05:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id x1so8482219ejd.8
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=D+ahkrOQ5qLDEqopu3LYhfJbc1OVq0i2VB9qJXkV3GM=;
        b=A0xr16QVH5lEJb4H60vyD97lK76AI9l2krtmyWj1Wp5P63CW98tegWI902P/8xkwvM
         AoP/mDONUQLrCINbNFPCkTl5uDkQOj9UEDBN5LlWBwEpVnZmX5ibNdK8LuAR+xcXdiku
         hQqPfohEJwwyDKckUHXU/yubOIIloFfAF+lTetqYa/lRqwjij47ybi94y4yKhrSJ8bwk
         +PpVBFde++kmtvGOvyhF0JSImwHTmCCoCUJQLFv3EjYxPojVPK2ipz4lxrlZu7op+VDG
         nvNvrJbRSZo8pYHfwwAt8GcYZyloUYvducCPKISsYosxWsx0QyzIAhg+/99GImtKKWqI
         AOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D+ahkrOQ5qLDEqopu3LYhfJbc1OVq0i2VB9qJXkV3GM=;
        b=obyiAtCzfMgKaEow0bKIbx+8qMMmJKV2RYRjudwwKW6YgdFNjylgl0YhtcOoa4TUOx
         3p+apQUe1v94tLb7hneCygDmSMWFyLBmGLiH1jUrh8dvCAA9mPwnggXdy5+dwaPpFAs2
         s+oZmUkBMUrjIfYsXz0jcn5hidpzy1m7SdC+TCQXmsaXDXgEUA+9G2f+TzFTJv1xFh3R
         xEIS79HJB2dpXtnGInGnoA3wJZVu29NT1OgPSzm7i0xRkXwkK5PLYVsWk6a+OsaXoXpy
         PjWwe/xe610dZNwVO+kEU/E6TbxZQ2x4CwYM2j0DHwz5LW78CCZC4Izzksto9BctNAQu
         OwPw==
X-Gm-Message-State: AOAM533na7Oxo6q2thvqO9SiNHFsiTi+ftAdKdktTWOG2tq84Wqc/NNS
        ay7deUCv2imrUlKi+IGcl+/pU7zg
X-Google-Smtp-Source: ABdhPJx0NL6loaocHlQ0ezoXzoxql/qMZcIqko9c8qbAmVOlsqOaf5n4gfzMWoUn6+fhdgsnSVHpMg==
X-Received: by 2002:a17:906:add7:: with SMTP id lb23mr3131912ejb.6.1590062723921;
        Thu, 21 May 2020 05:05:23 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8300:1c48:e13e:e99:f3a2:acc4? ([2a02:810a:8300:1c48:e13e:e99:f3a2:acc4])
        by smtp.gmail.com with ESMTPSA id oe21sm4660640ejb.69.2020.05.21.05.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 05:05:22 -0700 (PDT)
Subject: Re: How about a v4l-utils-1.20 release?
From:   Gregor Jasny <gjasny@googlemail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
Message-ID: <823e89b1-5148-4e9a-6ffa-7e07fed9e25c@googlemail.com>
Date:   Thu, 21 May 2020 14:05:19 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 20.04.20 14:05, Gregor Jasny wrote:
> It's been a while since we released v4l-utils 1.18. How about a 1.20 
> release?

After fixing the build problems on Ubuntu 16.04 and also some "make 
dist" issues I finally found time to release v4l-utils 1.20.0 today.

The Debian package has been uploaded and the change should also land in 
Ubuntu Groovy within the next days.

I'll also update the v4l-utils stable Ubuntu PPA with the new versions: 
https://launchpad.net/~libv4l/+archive/ubuntu/stable

Thanks,
Gregor
